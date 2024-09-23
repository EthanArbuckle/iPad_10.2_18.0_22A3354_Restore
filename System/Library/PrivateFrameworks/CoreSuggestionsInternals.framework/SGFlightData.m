@implementation SGFlightData

- (SGFlightData)init
{
  SGFlightData *v2;
  void *v3;
  SGSeekableData *v4;
  void *v5;
  SGSeekableData *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _PASLazyPurgeableResult *flightDataOffsets;
  SGSeekableData *v11;
  void *v12;
  SGSeekableData *v13;
  id v14;
  SGSeekableData *v15;
  uint64_t v16;
  _PASLazyPurgeableResult *airportDataOffsets;
  SGSeekableData *v18;
  void *v19;
  SGSeekableData *v20;
  id v21;
  SGSeekableData *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  _PASLazyPurgeableResult *carrierCodesByName;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  _PASNotificationToken *assetUpdateToken;
  NSObject *v33;
  SGSeekableData *v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  id location;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  SGSeekableData *v44;
  _QWORD v45[4];
  SGSeekableData *v46;
  _QWORD v47[4];
  SGSeekableData *v48;
  objc_super v49;

  v49.receiver = self;
  v49.super_class = (Class)SGFlightData;
  v2 = -[SGFlightData init](&v49, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = [SGSeekableData alloc];
    objc_msgSend(v3, "pathForResource:ofType:", CFSTR("flights"), CFSTR("dat"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SGSeekableData initWithMemoryMappedPath:](v4, "initWithMemoryMappedPath:", v5);

    objc_storeStrong((id *)&v2->_flightsFh, v6);
    v7 = objc_alloc(MEMORY[0x1E0D815E0]);
    v8 = MEMORY[0x1E0C809B0];
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __20__SGFlightData_init__block_invoke;
    v47[3] = &unk_1E7DAB7E8;
    v35 = v6;
    v48 = v35;
    v9 = objc_msgSend(v7, "initWithBlock:", v47);
    flightDataOffsets = v2->_flightDataOffsets;
    v2->_flightDataOffsets = (_PASLazyPurgeableResult *)v9;

    -[SGFlightData updateFlights](v2, "updateFlights");
    v11 = [SGSeekableData alloc];
    objc_msgSend(v3, "pathForResource:ofType:", CFSTR("airports"), CFSTR("dat"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SGSeekableData initWithMemoryMappedPath:](v11, "initWithMemoryMappedPath:", v12);

    objc_storeStrong((id *)&v2->_airportsFh, v13);
    v14 = objc_alloc(MEMORY[0x1E0D815E0]);
    v45[0] = v8;
    v45[1] = 3221225472;
    v45[2] = __20__SGFlightData_init__block_invoke_2;
    v45[3] = &unk_1E7DAB7E8;
    v15 = v13;
    v46 = v15;
    v16 = objc_msgSend(v14, "initWithBlock:", v45);
    airportDataOffsets = v2->_airportDataOffsets;
    v2->_airportDataOffsets = (_PASLazyPurgeableResult *)v16;

    -[SGFlightData updateAirports](v2, "updateAirports");
    v18 = [SGSeekableData alloc];
    objc_msgSend(v3, "pathForResource:ofType:", CFSTR("carrierNames"), CFSTR("dat"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[SGSeekableData initWithMemoryMappedPath:](v18, "initWithMemoryMappedPath:", v19);

    v21 = objc_alloc(MEMORY[0x1E0D815E0]);
    v43[0] = v8;
    v43[1] = 3221225472;
    v43[2] = __20__SGFlightData_init__block_invoke_3;
    v43[3] = &unk_1E7DAB810;
    v22 = v20;
    v44 = v22;
    v23 = (void *)objc_msgSend(v21, "initWithBlock:", v43);
    objc_storeStrong((id *)&v2->_carrierNames, v23);
    v24 = objc_alloc(MEMORY[0x1E0D815E0]);
    v41[0] = v8;
    v41[1] = 3221225472;
    v41[2] = __20__SGFlightData_init__block_invoke_4;
    v41[3] = &unk_1E7DAB810;
    v25 = v23;
    v42 = v25;
    v26 = objc_msgSend(v24, "initWithBlock:", v41);
    carrierCodesByName = v2->_carrierCodesByName;
    v2->_carrierCodesByName = (_PASLazyPurgeableResult *)v26;

    -[SGFlightData updateCarriers](v2, "updateCarriers");
    location = 0;
    objc_initWeak(&location, v2);
    v38[0] = v8;
    v38[1] = 3221225472;
    v38[2] = __20__SGFlightData_init__block_invoke_6;
    v38[3] = &unk_1E7DB7010;
    objc_copyWeak(&v39, &location);
    v28 = (void *)MEMORY[0x1C3BD5158](v38);
    +[SGAsset asset](SGAsset, "asset");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v8;
    v36[1] = 3221225472;
    v36[2] = __20__SGFlightData_init__block_invoke_7;
    v36[3] = &unk_1E7DAB860;
    v30 = v28;
    v37 = v30;
    objc_msgSend(v29, "registerUpdateHandler:", v36);
    v31 = objc_claimAutoreleasedReturnValue();
    assetUpdateToken = v2->_assetUpdateToken;
    v2->_assetUpdateToken = (_PASNotificationToken *)v31;

    +[SGAsset notificationQueue](SGAsset, "notificationQueue");
    v33 = objc_claimAutoreleasedReturnValue();
    dispatch_sync(v33, v30);

    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[SGAsset asset](SGAsset, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterUpdateHandlerAsyncWithToken:", self->_assetUpdateToken);

  v4.receiver = self;
  v4.super_class = (Class)SGFlightData;
  -[SGFlightData dealloc](&v4, sel_dealloc);
}

- (void)updateFlights
{
  void *v3;
  void *v4;
  SGSeekableData *v5;
  id v6;
  SGSeekableData *v7;
  _PASLazyPurgeableResult *v8;
  _PASLazyPurgeableResult *flightUpdateDataOffsets;
  _QWORD v10[4];
  SGSeekableData *v11;

  +[SGAsset asset](SGAsset, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filesystemPathForAssetDataRelativePath:", CFSTR("flightsUpdate.dat"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SGSeekableData initWithMemoryMappedPath:]([SGSeekableData alloc], "initWithMemoryMappedPath:", v4);
  objc_storeStrong((id *)&self->_flightsUpdateFh, v5);
  v6 = objc_alloc(MEMORY[0x1E0D815E0]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __29__SGFlightData_updateFlights__block_invoke;
  v10[3] = &unk_1E7DAB7E8;
  v11 = v5;
  v7 = v5;
  v8 = (_PASLazyPurgeableResult *)objc_msgSend(v6, "initWithBlock:", v10);
  flightUpdateDataOffsets = self->_flightUpdateDataOffsets;
  self->_flightUpdateDataOffsets = v8;

}

- (void)updateAirports
{
  void *v3;
  void *v4;
  SGSeekableData *v5;
  id v6;
  SGSeekableData *v7;
  _PASLazyPurgeableResult *v8;
  _PASLazyPurgeableResult *airportUpdateDataOffsets;
  _QWORD v10[4];
  SGSeekableData *v11;

  +[SGAsset asset](SGAsset, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filesystemPathForAssetDataRelativePath:", CFSTR("airportsUpdate.dat"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SGSeekableData initWithMemoryMappedPath:]([SGSeekableData alloc], "initWithMemoryMappedPath:", v4);
  objc_storeStrong((id *)&self->_airportsUpdateFh, v5);
  v6 = objc_alloc(MEMORY[0x1E0D815E0]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __30__SGFlightData_updateAirports__block_invoke;
  v10[3] = &unk_1E7DAB7E8;
  v11 = v5;
  v7 = v5;
  v8 = (_PASLazyPurgeableResult *)objc_msgSend(v6, "initWithBlock:", v10);
  airportUpdateDataOffsets = self->_airportUpdateDataOffsets;
  self->_airportUpdateDataOffsets = v8;

}

- (void)updateCarriers
{
  void *v3;
  void *v4;
  SGSeekableData *v5;
  id v6;
  uint64_t v7;
  SGSeekableData *v8;
  void *v9;
  id v10;
  id v11;
  _PASLazyPurgeableResult *v12;
  _PASLazyPurgeableResult *carrierUpdateCodesByName;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  SGSeekableData *v17;

  +[SGAsset asset](SGAsset, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filesystemPathForAssetDataRelativePath:", CFSTR("carrierNamesUpdate.dat"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SGSeekableData initWithMemoryMappedPath:]([SGSeekableData alloc], "initWithMemoryMappedPath:", v4);
  v6 = objc_alloc(MEMORY[0x1E0D815E0]);
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __30__SGFlightData_updateCarriers__block_invoke;
  v16[3] = &unk_1E7DAB810;
  v17 = v5;
  v8 = v5;
  v9 = (void *)objc_msgSend(v6, "initWithBlock:", v16);
  objc_storeStrong((id *)&self->_carrierUpdateNames, v9);
  v10 = objc_alloc(MEMORY[0x1E0D815E0]);
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __30__SGFlightData_updateCarriers__block_invoke_2;
  v14[3] = &unk_1E7DAB810;
  v15 = v9;
  v11 = v9;
  v12 = (_PASLazyPurgeableResult *)objc_msgSend(v10, "initWithBlock:", v14);
  carrierUpdateCodesByName = self->_carrierUpdateCodesByName;
  self->_carrierUpdateCodesByName = v12;

}

- (id)airportIataCodesForDataOffset:(id)a3
{
  _QWORD *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *((unsigned __int16 *)v3 + 4));
  if (*((_WORD *)v3 + 4))
  {
    v5 = 0;
    v6 = 10;
    do
    {
      objCStringForCarrierKey(v3[2] + v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:atIndexedSubscript:", v7, v5);

      ++v5;
      v6 += 16;
    }
    while (v5 < *((unsigned __int16 *)v3 + 4));
  }

  return v4;
}

- (id)airportIataCodes
{
  unsigned __int16 *v3;
  unsigned __int16 *v4;
  void *v5;
  void *v6;
  void *v7;

  -[_PASLazyPurgeableResult result](self->_airportDataOffsets, "result");
  v3 = (unsigned __int16 *)objc_claimAutoreleasedReturnValue();
  -[_PASLazyPurgeableResult result](self->_airportUpdateDataOffsets, "result");
  v4 = (unsigned __int16 *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v4[4] + (unint64_t)v3[4]);
  -[SGFlightData airportIataCodesForDataOffset:](self, "airportIataCodesForDataOffset:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  -[SGFlightData airportIataCodesForDataOffset:](self, "airportIataCodesForDataOffset:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v7);

  return v5;
}

- (id)namesForAirport:(id)a3 withDataOffset:(id)a4 andFileHandle:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_retainAutorelease(v7);
  v11 = objc_msgSend(v8, "seekLocationForKey:", objc_msgSend(v10, "UTF8String"));
  if (v11)
  {
    v28 = v10;
    v12 = (void *)MEMORY[0x1C3BD4F6C](objc_msgSend(v9, "seekToFileOffset:", v11));
    readLengthPrefixedString(v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "componentsSeparatedByString:", CFSTR("|"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v12);
    v15 = (void *)objc_opt_new();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v16 = v14;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v30 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          if ((unint64_t)objc_msgSend(v21, "length") >= 3)
          {
            v22 = (void *)MEMORY[0x1E0D81638];
            objc_msgSend(v21, "substringToIndex:", 2);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "substringFromIndex:", 2);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "tupleWithFirst:second:", v23, v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v25);

          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v18);
    }

    v26 = (void *)objc_msgSend(v15, "copy");
    v10 = v28;
  }
  else
  {
    v26 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v26;
}

- (id)namesForAirport:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1C3BD4F6C]();
  -[_PASLazyPurgeableResult result](self->_airportUpdateDataOffsets, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGFlightData namesForAirport:withDataOffset:andFileHandle:](self, "namesForAirport:withDataOffset:andFileHandle:", v4, v6, self->_airportsUpdateFh);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PASLazyPurgeableResult result](self->_airportDataOffsets, "result");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGFlightData namesForAirport:withDataOffset:andFileHandle:](self, "namesForAirport:withDataOffset:andFileHandle:", v4, v8, self->_airportsFh);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v5);
  return v10;
}

- (id)bestLocalizedNameForAirport:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  id v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v25;
  id obj;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  -[SGFlightData namesForAirport:](self, "namesForAirport:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  v5 = 0;
  if (!v30)
    goto LABEL_25;
  v29 = *(_QWORD *)v39;
  v27 = v4;
  v28 = *MEMORY[0x1E0C997E8];
  do
  {
    v6 = 0;
    do
    {
      if (*(_QWORD *)v39 != v29)
        objc_enumerationMutation(obj);
      objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v6));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v28);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {

        goto LABEL_25;
      }
      v31 = v6;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v33 = v4;
      v9 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      if (!v9)
      {
        v5 = 0;
        goto LABEL_21;
      }
      v10 = v9;
      v5 = 0;
      v11 = *(_QWORD *)v35;
      do
      {
        v12 = 0;
        v32 = v10;
        do
        {
          if (*(_QWORD *)v35 != v11)
            objc_enumerationMutation(v33);
          v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v12);
          objc_msgSend(v13, "second");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "first");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v8, "hasPrefix:", v15))
            goto LABEL_15;
          v16 = objc_msgSend(v14, "length");
          objc_msgSend(v5, "second");
          v17 = v5;
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "length");

          if (v16 > v19)
          {
            v5 = v13;
            v15 = v17;
            v10 = v32;
LABEL_15:

            goto LABEL_17;
          }
          v5 = v17;
          v10 = v32;
LABEL_17:

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v10);
LABEL_21:

      v6 = v31 + 1;
      v4 = v27;
    }
    while (v31 + 1 != v30);
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  }
  while (v30);
LABEL_25:

  objc_msgSend(v5, "second");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    v22 = v20;
  }
  else
  {
    objc_msgSend(v4, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "second");
    v22 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v22;
}

- (id)timezoneOlsonCodeForAirport:(id)a3 withDataOffset:(id)a4 andFileHandle:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v7 = a5;
  v8 = objc_retainAutorelease(a3);
  v9 = a4;
  v10 = (void *)objc_msgSend(v9, "seekLocationForKey:", objc_msgSend(v8, "UTF8String"));

  if (v10)
  {
    objc_msgSend(v7, "seekToFileOffset:", v10);
    v11 = readLengthPrefixedString(v7);
    readLengthPrefixedString(v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)timezoneOlsonCodeForAirport:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[_PASLazyPurgeableResult result](self->_airportUpdateDataOffsets, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGFlightData timezoneOlsonCodeForAirport:withDataOffset:andFileHandle:](self, "timezoneOlsonCodeForAirport:withDataOffset:andFileHandle:", v4, v5, self->_airportsUpdateFh);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    -[_PASLazyPurgeableResult result](self->_airportDataOffsets, "result");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGFlightData timezoneOlsonCodeForAirport:withDataOffset:andFileHandle:](self, "timezoneOlsonCodeForAirport:withDataOffset:andFileHandle:", v4, v8, self->_airportsFh);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)latitudeAndLongitudeForAirport:(id)a3 withDataOffset:(id)a4 andFileHandle:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;

  v7 = a5;
  v8 = objc_retainAutorelease(a3);
  v9 = a4;
  v10 = (void *)objc_msgSend(v9, "seekLocationForKey:", objc_msgSend(v8, "UTF8String"));

  if (v10)
  {
    objc_msgSend(v7, "seekToFileOffset:", v10);
    v11 = readLengthPrefixedString(v7);
    v12 = readLengthPrefixedString(v7);
    v13 = objc_retainAutorelease(v7);
    v14 = (double)(int)bswap32(*(_DWORD *)objc_msgSend(v13, "dataOfLength:", 4)) / 10000000.0;
    v15 = (double)(int)bswap32(*(_DWORD *)objc_msgSend(objc_retainAutorelease(v13), "dataOfLength:", 4)) / 10000000.0;
    if (v14 == 0.0 && v15 == 0.0)
    {
      v10 = 0;
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0D81638];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "tupleWithFirst:second:", v17, v18);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v10;
}

- (id)latitudeAndLongitudeForAirport:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[_PASLazyPurgeableResult result](self->_airportUpdateDataOffsets, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGFlightData latitudeAndLongitudeForAirport:withDataOffset:andFileHandle:](self, "latitudeAndLongitudeForAirport:withDataOffset:andFileHandle:", v4, v5, self->_airportsUpdateFh);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    -[_PASLazyPurgeableResult result](self->_airportDataOffsets, "result");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGFlightData latitudeAndLongitudeForAirport:withDataOffset:andFileHandle:](self, "latitudeAndLongitudeForAirport:withDataOffset:andFileHandle:", v4, v8, self->_airportsFh);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)cityForIataCode:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;

  v3 = a3;
  v4 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend((id)objc_opt_class(), "iataCodeToCityDatabaseDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("City"));
  v7 = objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = (__CFString *)v7;
  else
    v8 = &stru_1E7DB83A8;

  objc_autoreleasePoolPop(v4);
  return v8;
}

- (id)carrierIataCodes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1C3BD4F6C](self, a2);
  -[_PASLazyPurgeableResult result](self->_carrierUpdateNames, "result");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PASLazyPurgeableResult result](self->_carrierNames, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v8;
}

- (id)carrierIataCodeForCarrierName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v4, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v5);
  -[_PASLazyPurgeableResult result](self->_carrierUpdateCodesByName, "result");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    -[_PASLazyPurgeableResult result](self->_carrierCodesByName, "result");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)nameForCarrier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  -[_PASLazyPurgeableResult result](self->_carrierUpdateNames, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[_PASLazyPurgeableResult result](self->_carrierNames, "result");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)airportsServicedByCarrier:(id)a3 flightNumber:(unsigned __int16)a4 withDataOffset:(id)a5 andFileHandle:(id)a6
{
  unsigned int v8;
  id v9;
  _QWORD *v10;
  id v11;
  id v12;
  uint64_t v13;
  int v14;
  int v15;
  unsigned __int16 v16;
  id v17;
  unsigned int v18;
  id v19;
  unsigned int v20;
  id v21;
  unsigned __int8 *v22;
  void *v24;
  id v26;
  uint64_t v27;
  unsigned int v28;
  void *v29;

  v8 = a4;
  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = objc_retainAutorelease(v9);
  v13 = objc_msgSend(v10, "seekLocationForKey:", objc_msgSend(v12, "UTF8String"));
  if (v13
    && (objc_msgSend(v11, "seekToFileOffset:", v13),
        v14 = objc_msgSend(v10, "payloadCountForKey:", objc_msgSend(objc_retainAutorelease(v12), "UTF8String")),
        v15 = v14 - 1,
        v14 >= 1))
  {
    v16 = 0;
    while (1)
    {
      v17 = objc_retainAutorelease(v11);
      v18 = bswap32(*(unsigned __int16 *)objc_msgSend(v17, "dataOfLength:", 2)) >> 16;
      v19 = objc_retainAutorelease(v17);
      v20 = *(unsigned __int16 *)objc_msgSend(v19, "dataOfLength:", 2);
      v21 = objc_retainAutorelease(v19);
      v22 = (unsigned __int8 *)objc_msgSend(v21, "dataOfLength:", 1);

      v16 += v18;
      if (v16 == v8)
        break;
      if (v16 > v8 || v15-- == 0)
        goto LABEL_10;
    }
    objc_msgSend(v21, "seekToFileOffset:", (*v22 | ((unint64_t)__rev16(v20) << 8)) + v10[4] + v10[5]);
    v26 = objc_retainAutorelease(v21);
    v27 = *(unsigned __int8 *)objc_msgSend(v26, "dataOfLength:", 1);
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v27);
    if ((_DWORD)v27)
    {
      v28 = 0;
      do
      {
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", objc_msgSend(objc_retainAutorelease(v26), "dataOfLength:", 3), 3, 1);
        objc_msgSend(v24, "addObject:", v29);

        ++v28;
      }
      while (v28 < v27);
    }
  }
  else
  {
LABEL_10:
    v24 = (void *)objc_opt_new();
  }

  return v24;
}

- (id)airportsServicedByCarrier:(id)a3 flightNumber:(unsigned __int16)a4
{
  uint64_t v4;
  _PASLazyPurgeableResult *flightUpdateDataOffsets;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a4;
  flightUpdateDataOffsets = self->_flightUpdateDataOffsets;
  v7 = a3;
  -[_PASLazyPurgeableResult result](flightUpdateDataOffsets, "result");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGFlightData airportsServicedByCarrier:flightNumber:withDataOffset:andFileHandle:](self, "airportsServicedByCarrier:flightNumber:withDataOffset:andFileHandle:", v7, v4, v8, self->_flightsUpdateFh);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PASLazyPurgeableResult result](self->_flightDataOffsets, "result");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGFlightData airportsServicedByCarrier:flightNumber:withDataOffset:andFileHandle:](self, "airportsServicedByCarrier:flightNumber:withDataOffset:andFileHandle:", v7, v4, v10, self->_flightsFh);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setByAddingObjectsFromSet:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)airportCodeForAirportName:(id)a3 flightCarrier:(id)a4 flightNumber:(unsigned __int16)a5 outputInfos:(id)a6
{
  uint64_t v6;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v6 = a5;
  v18[1] = *MEMORY[0x1E0C80C00];
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = a6;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "numberWithUnsignedShort:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGFlightData airportCodeForAirportName:flightCarrier:flightNumber:otherKnownFlightsToAirport:outputInfos:](self, "airportCodeForAirportName:flightCarrier:flightNumber:otherKnownFlightsToAirport:outputInfos:", v13, v12, v6, v15, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)airportCodeForAirportName:(id)a3 flightCarrier:(id)a4 flightNumber:(unsigned __int16)a5 otherKnownFlightsToAirport:(id)a6 outputInfos:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  id v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  unint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  unint64_t v58;
  id v59;
  void *v60;
  uint64_t v61;
  double v62;
  unint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  unint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  objc_class *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  id v88;
  void *v89;
  id obj;
  uint64_t v91;
  uint64_t v92;
  void *context;
  uint64_t v94;
  void *v95;
  id v96;
  void *v97;
  void *v98;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _BYTE v112[128];
  uint8_t v113[128];
  uint8_t buf[4];
  void *v115;
  __int16 v116;
  uint64_t v117;
  __int16 v118;
  id v119;
  __int16 v120;
  void *v121;
  _BYTE v122[128];
  uint64_t v123;

  v9 = a5;
  v123 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v88 = a4;
  v13 = a6;
  v14 = a7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v13, "containsObject:", v15);

  v87 = v14;
  if ((a6 & 1) == 0)
  {
    v16 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayByAddingObject:", v17);
    v18 = objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v16);
    v13 = (id)v18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = (void *)objc_opt_class();
    v20 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v12, "lowercaseString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v20);
    objc_msgSend(v19, "sanitizeAirportName:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v98 = v22;
    v23 = objc_msgSend(v22, "length");
    if (!objc_msgSend(v13, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGFlightData.m"), 599, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("flightCodes.count > 0"));

    }
    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    v86 = v13;
    v24 = v13;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v108, v122, 16);
    v26 = 0x1E0CB3000;
    if (v25)
    {
      v27 = v25;
      v89 = 0;
      v28 = *(_QWORD *)v109;
      v29 = v9;
      while (2)
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v109 != v28)
            objc_enumerationMutation(v24);
          v31 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * v30);
          v32 = (void *)MEMORY[0x1C3BD4F6C]();
          v33 = objc_msgSend(v31, "unsignedIntegerValue");
          -[SGFlightData airportsServicedByCarrier:flightNumber:](self, "airportsServicedByCarrier:flightNumber:", v88, (unsigned __int16)v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v34;
          if (v33 == v29 || objc_msgSend(v34, "count"))
          {
            if (v89)
            {
              objc_msgSend(v89, "intersectSet:", v35);
              v36 = v89;
            }
            else
            {
              v36 = (void *)objc_msgSend(v35, "mutableCopy");
            }
            v26 = 0x1E0CB3000;
            v89 = v36;
            if (!objc_msgSend(v36, "count"))
            {
              sgLogHandle();
              v41 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1C3607000, v41, OS_LOG_TYPE_INFO, "No airports found in common", buf, 2u);
              }

              sgPrivateLogHandle();
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v24, "_pas_componentsJoinedByString:", CFSTR(", "));
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v115 = v98;
                v116 = 2112;
                v117 = (uint64_t)v81;
                v118 = 2112;
                v119 = v88;
                _os_log_debug_impl(&dword_1C3607000, v42, OS_LOG_TYPE_DEBUG, "Could not get airport code for airport \"%@\" from flights %@ on carrier %@ because they do not have at least 1 airport in common", buf, 0x20u);

                v26 = 0x1E0CB3000;
              }

              objc_autoreleasePoolPop(v32);
              goto LABEL_32;
            }
          }
          else
          {
            v26 = 0x1E0CB3000;
          }

          objc_autoreleasePoolPop(v32);
          ++v30;
        }
        while (v27 != v30);
        v37 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v108, v122, 16);
        v27 = v37;
        if (v37)
          continue;
        break;
      }
    }
    else
    {
      v89 = 0;
    }
LABEL_32:

    if (objc_msgSend(v89, "count") == 1)
    {
      sgPrivateLogHandle();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        v82 = (void *)MEMORY[0x1C3BD4F6C]();
        objc_msgSend(v24, "_pas_componentsJoinedByString:", CFSTR(", "));
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_autoreleasePoolPop(v82);
        objc_msgSend(v89, "anyObject");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v115 = v98;
        v116 = 2112;
        v117 = (uint64_t)v83;
        v118 = 2112;
        v119 = v88;
        v120 = 2112;
        v121 = v84;
        _os_log_debug_impl(&dword_1C3607000, v43, OS_LOG_TYPE_DEBUG, "Skipping levenshtein for airport \"%@\" flights %@ on carrier %@ because they have exactly one airport in common: %@", buf, 0x2Au);

      }
      v44 = v89;
      objc_msgSend(v89, "anyObject");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
    }
    else
    {
      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      obj = v89;
      v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v113, 16);
      if (v92)
      {
        v97 = 0;
        v91 = *(_QWORD *)v105;
        do
        {
          v45 = 0;
          do
          {
            if (*(_QWORD *)v105 != v91)
              objc_enumerationMutation(obj);
            v94 = v45;
            v46 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * v45);
            context = (void *)MEMORY[0x1C3BD4F6C]();
            v100 = 0u;
            v101 = 0u;
            v102 = 0u;
            v103 = 0u;
            v95 = v46;
            -[SGFlightData namesForAirport:](self, "namesForAirport:", v46);
            v96 = (id)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v100, v112, 16);
            if (v47)
            {
              v48 = v47;
              v49 = *(_QWORD *)v101;
              do
              {
                for (i = 0; i != v48; ++i)
                {
                  v51 = v23;
                  if (*(_QWORD *)v101 != v49)
                    objc_enumerationMutation(v96);
                  v52 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * i);
                  v53 = (void *)MEMORY[0x1C3BD4F6C]();
                  v54 = (void *)objc_opt_class();
                  objc_msgSend(v52, "second");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v55, "lowercaseString");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "sanitizeAirportName:", v56);
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  v58 = +[SGLevenshtein distanceBetweenStrings:and:](SGLevenshtein, "distanceBetweenStrings:and:", v57, v98);

                  if (v58 >= v51)
                  {
                    v23 = v51;
                  }
                  else
                  {
                    v59 = v95;

                    v97 = v59;
                    v23 = v58;
                  }
                  objc_autoreleasePoolPop(v53);
                }
                v48 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v100, v112, 16);
              }
              while (v48);
            }

            objc_autoreleasePoolPop(context);
            v45 = v94 + 1;
          }
          while (v94 + 1 != v92);
          v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v113, 16);
        }
        while (v92);
      }
      else
      {
        v97 = 0;
      }

      v26 = 0x1E0CB3000uLL;
      v44 = v89;
    }
    v60 = (void *)objc_msgSend(CFSTR("airportCodeCandidats_"), "mutableCopy");
    v61 = +[SGRTCLogging round:toSignificantFigures:](SGRTCLogging, "round:toSignificantFigures:", 2, (double)(unint64_t)objc_msgSend(v44, "count"));
    v63 = (unint64_t)v62;
    v64 = (void *)MEMORY[0x1C3BD4F6C](v61);
    objc_msgSend(*(id *)(v26 + 2024), "numberWithUnsignedLong:", v63);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "stringValue");
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v64);
    objc_msgSend(v60, "appendString:", v66);

    v67 = (void *)objc_msgSend(CFSTR("airportInitScore_"), "mutableCopy");
    v68 = +[SGRTCLogging bucketizeInteger:withBucketSize:limit:](SGRTCLogging, "bucketizeInteger:withBucketSize:limit:", objc_msgSend(v98, "length"), 5, 60);
    v69 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(*(id *)(v26 + 2024), "numberWithUnsignedLong:", v68);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "stringValue");
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v69);
    objc_msgSend(v67, "appendString:", v71);

    v72 = (void *)objc_msgSend(CFSTR("airportBestScore_"), "mutableCopy");
    v73 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(*(id *)(v26 + 2024), "numberWithUnsignedLong:", v23);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v74;
    if (!v74)
      v74 = &unk_1E7E0C080;
    objc_msgSend(v74, "stringValue");
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v73);
    objc_msgSend(v72, "appendString:", v76);

    v40 = v87;
    if (v60)
      objc_msgSend(v87, "addObject:", v60);
    if (v67)
      objc_msgSend(v87, "addObject:", v67);
    if (v72)
      objc_msgSend(v87, "addObject:", v72);
    v39 = v97;

    v13 = v86;
    v12 = v98;
  }
  else
  {
    sgLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
    {
      v78 = (objc_class *)objc_opt_class();
      NSStringFromClass(v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      +[SGAsset asset](SGAsset, "asset");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v115 = v79;
      v116 = 2048;
      v117 = objc_msgSend(v80, "assetVersion");
      _os_log_fault_impl(&dword_1C3607000, v38, OS_LOG_TYPE_FAULT, "Expecting NSString for airportName but found something else: %@. Asset version = %lu", buf, 0x16u);

    }
    if (_PASEvaluateLogFaultAndProbCrashCriteria())
      abort();
    v39 = 0;
    v40 = v87;
  }

  return v39;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierUpdateCodesByName, 0);
  objc_storeStrong((id *)&self->_carrierUpdateNames, 0);
  objc_storeStrong((id *)&self->_carrierCodesByName, 0);
  objc_storeStrong((id *)&self->_carrierNames, 0);
  objc_storeStrong((id *)&self->_assetUpdateToken, 0);
  objc_storeStrong((id *)&self->_airportUpdateDataOffsets, 0);
  objc_storeStrong((id *)&self->_airportsUpdateFh, 0);
  objc_storeStrong((id *)&self->_airportDataOffsets, 0);
  objc_storeStrong((id *)&self->_airportsFh, 0);
  objc_storeStrong((id *)&self->_flightUpdateDataOffsets, 0);
  objc_storeStrong((id *)&self->_flightsUpdateFh, 0);
  objc_storeStrong((id *)&self->_flightDataOffsets, 0);
  objc_storeStrong((id *)&self->_flightsFh, 0);
}

id __30__SGFlightData_updateCarriers__block_invoke(uint64_t a1)
{
  SGOffsetDictionary *v2;
  void *v3;

  v2 = -[SGOffsetDictionary initWithFilehandle:sizeFactor:keyLength:singleByteOffset:]([SGOffsetDictionary alloc], "initWithFilehandle:sizeFactor:keyLength:singleByteOffset:", *(_QWORD *)(a1 + 32), 1, 3, 1);
  -[SGOffsetDictionary fullMappingFromFile:](v2, "fullMappingFromFile:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __30__SGFlightData_updateCarriers__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "result");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v1, "count"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__SGFlightData_updateCarriers__block_invoke_3;
  v6[3] = &unk_1E7DAB838;
  v7 = v2;
  v3 = v2;
  objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v6);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

void __30__SGFlightData_updateCarriers__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x1C3BD4F6C]();
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v5, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v8);

  objc_autoreleasePoolPop(v6);
}

SGOffsetDictionary *__30__SGFlightData_updateAirports__block_invoke(uint64_t a1)
{
  return -[SGOffsetDictionary initWithFilehandle:sizeFactor:keyLength:singleByteOffset:]([SGOffsetDictionary alloc], "initWithFilehandle:sizeFactor:keyLength:singleByteOffset:", *(_QWORD *)(a1 + 32), 1, 3, 0);
}

SGOffsetDictionary *__29__SGFlightData_updateFlights__block_invoke(uint64_t a1)
{
  return -[SGOffsetDictionary initWithFilehandle:sizeFactor:keyLength:singleByteOffset:]([SGOffsetDictionary alloc], "initWithFilehandle:sizeFactor:keyLength:singleByteOffset:", *(_QWORD *)(a1 + 32), 5, 3, 0);
}

SGOffsetDictionary *__20__SGFlightData_init__block_invoke(uint64_t a1)
{
  return -[SGOffsetDictionary initWithFilehandle:sizeFactor:keyLength:singleByteOffset:]([SGOffsetDictionary alloc], "initWithFilehandle:sizeFactor:keyLength:singleByteOffset:", *(_QWORD *)(a1 + 32), 5, 3, 0);
}

SGOffsetDictionary *__20__SGFlightData_init__block_invoke_2(uint64_t a1)
{
  return -[SGOffsetDictionary initWithFilehandle:sizeFactor:keyLength:singleByteOffset:]([SGOffsetDictionary alloc], "initWithFilehandle:sizeFactor:keyLength:singleByteOffset:", *(_QWORD *)(a1 + 32), 1, 3, 0);
}

id __20__SGFlightData_init__block_invoke_3(uint64_t a1)
{
  SGOffsetDictionary *v2;
  void *v3;

  v2 = -[SGOffsetDictionary initWithFilehandle:sizeFactor:keyLength:singleByteOffset:]([SGOffsetDictionary alloc], "initWithFilehandle:sizeFactor:keyLength:singleByteOffset:", *(_QWORD *)(a1 + 32), 1, 3, 1);
  -[SGOffsetDictionary fullMappingFromFile:](v2, "fullMappingFromFile:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __20__SGFlightData_init__block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "result");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v1, "count"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __20__SGFlightData_init__block_invoke_5;
  v6[3] = &unk_1E7DAB838;
  v7 = v2;
  v3 = v2;
  objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v6);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

void __20__SGFlightData_init__block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateFlights");
  objc_msgSend(WeakRetained, "updateAirports");
  objc_msgSend(WeakRetained, "updateCarriers");

}

uint64_t __20__SGFlightData_init__block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __20__SGFlightData_init__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x1C3BD4F6C]();
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v5, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v8);

  objc_autoreleasePoolPop(v6);
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_9921 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_9921, &__block_literal_global_9922);
  return (id)sharedInstance__pasExprOnceResult_9923;
}

+ (id)airportNameNoiseKeywords
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  SEL v16;
  id v17;

  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __40__SGFlightData_airportNameNoiseKeywords__block_invoke;
  v15 = &__block_descriptor_48_e5_v8__0l;
  v16 = a2;
  v17 = a1;
  if (airportNameNoiseKeywords_onceToken != -1)
    dispatch_once(&airportNameNoiseKeywords_onceToken, &v12);
  pthread_mutex_lock(&airportNameNoiseKeywords_lock);
  v4 = (void *)airportNameNoiseKeywords_airportNameNoiseKeywords;
  if (!airportNameNoiseKeywords_airportNameNoiseKeywords)
  {
    +[SGAsset asset](SGAsset, "asset", v12, v13, v14, v15, v16, v17);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filesystemPathForAssetDataRelativePath:", CFSTR("AirportNameNoise.plist"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGFlightData.m"), 220, CFSTR("failed to get asset path for AIRPORT_NAME_IDENT."));

    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithContentsOfFile:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)airportNameNoiseKeywords_airportNameNoiseKeywords;
    airportNameNoiseKeywords_airportNameNoiseKeywords = v7;

    v4 = (void *)airportNameNoiseKeywords_airportNameNoiseKeywords;
  }
  v9 = v4;
  pthread_mutex_unlock(&airportNameNoiseKeywords_lock);
  return v9;
}

+ (id)iataCodeToCityDatabaseDict
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v12;
  id v13;
  _QWORD block[6];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SGFlightData_iataCodeToCityDatabaseDict__block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = a2;
  block[5] = a1;
  if (iataCodeToCityDatabaseDict_onceToken != -1)
    dispatch_once(&iataCodeToCityDatabaseDict_onceToken, block);
  pthread_mutex_lock(&iataCodeToCityDatabaseDict_lock);
  v4 = (void *)iataCodeToCityDatabaseDict_iataCodeDatabaseDict;
  if (!iataCodeToCityDatabaseDict_iataCodeDatabaseDict)
  {
    +[SGAsset asset](SGAsset, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filesystemPathForAssetDataRelativePath:", CFSTR("IataCodeToCity.plplist"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGFlightData.m"), 257, CFSTR("failed to get asset path for IATA_CITY_DB_IDENT."));

    }
    v13 = 0;
    objc_msgSend(MEMORY[0x1E0D815D8], "dictionaryWithPath:error:", v6, &v13);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v13;
    v9 = (void *)iataCodeToCityDatabaseDict_iataCodeDatabaseDict;
    iataCodeToCityDatabaseDict_iataCodeDatabaseDict = v7;

    v4 = (void *)iataCodeToCityDatabaseDict_iataCodeDatabaseDict;
  }
  v10 = v4;
  pthread_mutex_unlock(&iataCodeToCityDatabaseDict_lock);
  return v10;
}

void __42__SGFlightData_iataCodeToCityDatabaseDict__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  __int128 v5;

  +[SGAsset asset](SGAsset, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__SGFlightData_iataCodeToCityDatabaseDict__block_invoke_2;
  v4[3] = &__block_descriptor_48_e20_v16__0___PASAsset2_8l;
  v5 = *(_OWORD *)(a1 + 32);
  v3 = (id)objc_msgSend(v2, "registerUpdateHandler:", v4);

}

void __42__SGFlightData_iataCodeToCityDatabaseDict__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  pthread_mutex_lock(&iataCodeToCityDatabaseDict_lock);
  objc_msgSend(v3, "filesystemPathForAssetDataRelativePath:", CFSTR("IataCodeToCity.plplist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("SGFlightData.m"), 245, CFSTR("failed to get asset path for IATA_CITY_DB_IDENT."));

  }
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0D815D8], "dictionaryWithPath:error:", v4, &v9);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v9;
  v7 = (void *)iataCodeToCityDatabaseDict_iataCodeDatabaseDict;
  iataCodeToCityDatabaseDict_iataCodeDatabaseDict = v5;

  pthread_mutex_unlock(&iataCodeToCityDatabaseDict_lock);
}

void __40__SGFlightData_airportNameNoiseKeywords__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  __int128 v5;

  +[SGAsset asset](SGAsset, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__SGFlightData_airportNameNoiseKeywords__block_invoke_2;
  v4[3] = &__block_descriptor_48_e20_v16__0___PASAsset2_8l;
  v5 = *(_OWORD *)(a1 + 32);
  v3 = (id)objc_msgSend(v2, "registerUpdateHandler:", v4);

}

void __40__SGFlightData_airportNameNoiseKeywords__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  pthread_mutex_lock(&airportNameNoiseKeywords_lock);
  objc_msgSend(v3, "filesystemPathForAssetDataRelativePath:", CFSTR("AirportNameNoise.plist"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("SGFlightData.m"), 209, CFSTR("failed to get asset path for AIRPORT_NAME_IDENT."));

    v4 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithContentsOfFile:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)airportNameNoiseKeywords_airportNameNoiseKeywords;
  airportNameNoiseKeywords_airportNameNoiseKeywords = v5;

  pthread_mutex_unlock(&airportNameNoiseKeywords_lock);
}

void __30__SGFlightData_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_9923;
  sharedInstance__pasExprOnceResult_9923 = v1;

  objc_autoreleasePoolPop(v0);
}

+ (id)sanitizeAirportName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend((id)objc_opt_class(), "airportNameNoiseKeywords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12++), CFSTR(" "), 0, 0, objc_msgSend(v7, "length", (_QWORD)v15));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  _PASCollapseWhitespaceAndStrip();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  return v13;
}

@end
