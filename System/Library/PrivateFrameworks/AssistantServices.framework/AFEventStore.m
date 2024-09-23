@implementation AFEventStore

- (BOOL)_filterEventsMoreThanADayOld:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v3 = a3;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "deviceType") == 18)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "eventBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "deviceType") == 23;

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingUnit:value:toDate:options:", 32, -24, v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v11 = v10;
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  v13 = v12;
  objc_msgSend(v3, "timestamp");
  if (v14 < v13 || (objc_msgSend(v3, "timestamp"), v15 > v11))
    v5 = 0;

  return v5;
}

- (void)_populateBTCarEventOUID:(id)a3 carBluetoothHeadunit:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  objc_msgSend(a3, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v6, "length") < 9)
  {
    objc_msgSend(v10, "setOrganizationallyUniqueId:", CFSTR("N/A"));
  }
  else
  {
    objc_msgSend(v6, "subdataWithRange:", 0, 9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v7, 4);
    objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), &stru_1E3A37708);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v10, "setOrganizationallyUniqueId:", v9);

  }
}

- (id)_mapIDsToSELFEvents:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0D9A3F0]);
  if (objc_msgSend(v4, "hasProductID"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v4, "productID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHeadUnitProductId:", v6);

  }
  if (objc_msgSend(v4, "hasVendorID"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v4, "vendorID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHeadUnitVendorId:", v7);

  }
  -[AFEventStore _populateBTCarEventOUID:carBluetoothHeadunit:](self, "_populateBTCarEventOUID:carBluetoothHeadunit:", v4, v5);

  return v5;
}

- (void)fetchHeadunitsConnectedInLast24HoursWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void (*v5)(void);
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void *v29;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v5 = (void (*)(void))getBiomeLibrarySymbolLoc_ptr;
  v29 = getBiomeLibrarySymbolLoc_ptr;
  v6 = MEMORY[0x1E0C809B0];
  if (!getBiomeLibrarySymbolLoc_ptr)
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __getBiomeLibrarySymbolLoc_block_invoke;
    v25[3] = &unk_1E3A365A8;
    v25[4] = &v26;
    __getBiomeLibrarySymbolLoc_block_invoke(v25);
    v5 = (void (*)(void))v27[3];
  }
  _Block_object_dispose(&v26, 8);
  if (v5)
  {
    v5();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "Device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "Wireless");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "Bluetooth");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026F0]), "initWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, 0, 0, 0);
    objc_msgSend(v10, "publisherWithOptions:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v6;
    v24[1] = 3221225472;
    v24[2] = __90__AFEventStore_BluetoothEvent__fetchHeadunitsConnectedInLast24HoursWithCompletionHandler___block_invoke;
    v24[3] = &unk_1E3A35F10;
    v24[4] = self;
    objc_msgSend(v13, "filterWithIsIncluded:", v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v6;
    v23[1] = 3221225472;
    v23[2] = __90__AFEventStore_BluetoothEvent__fetchHeadunitsConnectedInLast24HoursWithCompletionHandler___block_invoke_2;
    v23[3] = &unk_1E3A35F38;
    v23[4] = self;
    objc_msgSend(v14, "mapWithTransform:", v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v6;
    v21[1] = 3221225472;
    v21[2] = __90__AFEventStore_BluetoothEvent__fetchHeadunitsConnectedInLast24HoursWithCompletionHandler___block_invoke_15;
    v21[3] = &unk_1E3A35FA0;
    v22 = v11;
    v16 = v11;
    v17 = (id)objc_msgSend(v15, "sinkWithCompletion:receiveInput:", &__block_literal_global_39920, v21);

    objc_msgSend(v16, "allObjects");
    v18 = objc_claimAutoreleasedReturnValue();
    v4[2](v4, v18, 0);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id<BMRootLibrary> SoftBiomeLibrary(void)");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("AFEventDefs.h"), 13, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

uint64_t __90__AFEventStore_BluetoothEvent__fetchHeadunitsConnectedInLast24HoursWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_filterEventsMoreThanADayOld:", a2);
}

uint64_t __90__AFEventStore_BluetoothEvent__fetchHeadunitsConnectedInLast24HoursWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mapIDsToSELFEvents:", a2);
}

uint64_t __90__AFEventStore_BluetoothEvent__fetchHeadunitsConnectedInLast24HoursWithCompletionHandler___block_invoke_15(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __90__AFEventStore_BluetoothEvent__fetchHeadunitsConnectedInLast24HoursWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (objc_msgSend(v2, "state") == 1)
  {
    v3 = (void *)AFSiriLogContextEvent;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextEvent, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "error");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 136315394;
      v7 = "-[AFEventStore(BluetoothEvent) fetchHeadunitsConnectedInLast24HoursWithCompletionHandler:]_block_invoke_3";
      v8 = 2112;
      v9 = v5;
      _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s Error fetching bluetooth event: %@", (uint8_t *)&v6, 0x16u);

    }
  }

}

@end
