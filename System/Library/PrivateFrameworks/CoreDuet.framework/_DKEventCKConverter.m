@implementation _DKEventCKConverter

- (_DKEventCKConverter)initWithZoneID:(id)a3
{
  id v5;
  _DKEventCKConverter *v6;
  _DKEventCKConverter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DKEventCKConverter;
  v6 = -[_DKEventCKConverter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_zoneID, a3);

  return v7;
}

- (id)eventsFromRecords:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _DKPREvent *v15;
  uint64_t v16;
  BOOL v17;
  uint8_t *v18;
  size_t v19;
  uint64_t v20;
  void *v21;
  _DKPREvent *v22;
  void *v23;
  _DKPREvent *v24;
  void *v25;
  NSObject *v26;
  size_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *context;
  _DKEventCKConverter *v37;
  void *v38;
  uint64_t v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x193FEE914]();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v42;
    v37 = self;
    v38 = v6;
    v39 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v42 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x193FEE914]();
        -[_DKEventCKConverter eventDataFromRecord:]((uint64_t)self, v11);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (v13)
        {
          if (-[_DKEventData version](v13) == 2)
          {
            -[_DKSyncWindow startDate]((uint64_t)v14);
            v15 = (_DKPREvent *)objc_claimAutoreleasedReturnValue();
            v16 = -[_DKSyncType urgency]((uint64_t)v14);
            if ((_DWORD)v16)
              v17 = v15 == 0;
            else
              v17 = 1;
            if (v17 || !-[_DKPREvent length](v15, "length"))
            {
              +[_CDLogging syncChannel](_CDLogging, "syncChannel");
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend((id)objc_opt_class(), "description");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v16);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_DKPREvent length](v15, "length"));
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v46 = v29;
                v47 = 2112;
                v48 = v30;
                v49 = 2112;
                v50 = v31;
                _os_log_error_impl(&dword_18DDBE000, v26, OS_LOG_TYPE_ERROR, "%{public}@: Dropping event, unexpected uncompressed length of %@ or compressedData length of %@", buf, 0x20u);

                v6 = v38;
              }

              v23 = 0;
            }
            else
            {
              v18 = (uint8_t *)malloc_type_malloc(v16 + 32, 0x6C4234E2uLL);
              v15 = objc_retainAutorelease(v15);
              v19 = compression_decode_buffer(v18, v16 + 32, (const uint8_t *)-[_DKPREvent bytes](v15, "bytes"), -[_DKPREvent length](v15, "length"), 0, COMPRESSION_LZFSE);
              if (v19 == v16)
              {
                objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v18, v16, 1);
                v20 = objc_claimAutoreleasedReturnValue();
                if (v20)
                {
                  v21 = (void *)v20;
                  v22 = -[_DKPREvent initWithData:]([_DKPREvent alloc], "initWithData:", v20);
                  +[_DKEvent fromPBCodable:](_DKEvent, "fromPBCodable:", v22);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();

                  goto LABEL_24;
                }
              }
              else
              {
                v27 = v19;
                +[_CDLogging syncChannel](_CDLogging, "syncChannel");
                v28 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend((id)objc_opt_class(), "description");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v27);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v16);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v46 = v32;
                  v47 = 2112;
                  v48 = v33;
                  v49 = 2112;
                  v50 = v34;
                  _os_log_error_impl(&dword_18DDBE000, v28, OS_LOG_TYPE_ERROR, "%{public}@: Dropping event, uncompressed size %@ does not match uncompressed length %@", buf, 0x20u);

                }
                free(v18);
              }
              v23 = 0;
LABEL_24:
              self = v37;
              v6 = v38;
            }
            v9 = v39;
          }
          else
          {
            v24 = [_DKPREvent alloc];
            -[_DKSyncWindow startDate]((uint64_t)v14);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = -[_DKPREvent initWithData:](v24, "initWithData:", v25);

            +[_DKEvent fromPBCodable:](_DKEvent, "fromPBCodable:", v15);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
          }

          if (v23)
            objc_msgSend(v6, "addObject:", v23);

        }
        objc_autoreleasePoolPop(v12);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    }
    while (v8);
  }

  objc_autoreleasePoolPop(context);
  return v6;
}

- (id)eventDataFromRecord:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  _DKPREventData *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "recordType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("DKEvent"));

    if ((v6 & 1) != 0)
    {
      objc_msgSend(v4, "encryptedValuesByKey");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", CFSTR("encryptedEvent"));
      v8 = objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v9 = -[_DKPREventData initWithData:]([_DKPREventData alloc], "initWithData:", v8);
        +[_DKEventData fromPBCodable:](_DKEventData, "fromPBCodable:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          v12 = v10;
        }
        else
        {
          +[_CDLogging syncChannel](_CDLogging, "syncChannel");
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            -[_DKEventCKConverter eventDataFromRecord:].cold.2();

        }
      }
      else
      {
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v9 = (_DKPREventData *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v9->super.super, OS_LOG_TYPE_ERROR))
          -[_DKEventCKConverter eventDataFromRecord:].cold.1();
        v11 = 0;
      }

    }
    else
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[_DKEventCKConverter eventDataFromRecord:].cold.3(a1, v4);
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)recordsFromEvents:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  size_t v13;
  uint8_t *v14;
  id v15;
  size_t v16;
  size_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id *v22;
  void *v23;
  void *v24;
  void *v25;
  void *context;
  void *v28;
  NSObject *v29;
  _DKEventCKConverter *v30;
  id v31;
  id obj;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v5);
  v31 = (id)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x193FEE914]();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v4;
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
  if (v34)
  {
    v33 = *(_QWORD *)v37;
    v30 = self;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v37 != v33)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x193FEE914]();
        objc_msgSend(v7, "toPBCodable");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "data");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v35 = v8;
          +[_CDSizeMetricFamily sizeMetricFamilyWithName:]((uint64_t)_CDSizeMetricFamily, CFSTR("Cloud"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[_CDSizeMetricFamily sizeMetricWithName:string:scale:]((uint64_t)v11, CFSTR("bytes to send"), 0, 1024);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          CDSizeMetricAddSize((uint64_t)v12, objc_msgSend(v10, "length"));
          if ((unint64_t)objc_msgSend(v10, "length") >= 0x401
            && !((unint64_t)objc_msgSend(v10, "length") >> 13))
          {
            v13 = objc_msgSend(v10, "length");
            v14 = (uint8_t *)malloc_type_malloc(v13, 0x68BF4A00uLL);
            v15 = objc_retainAutorelease(v10);
            v16 = compression_encode_buffer(v14, v13, (const uint8_t *)objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"), 0, COMPRESSION_LZFSE);
            if (v16 && (v17 = v16, (double)(unint64_t)objc_msgSend(v15, "length") * 0.75 > (double)v16))
            {
              objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v14, v17, 1);
              v18 = objc_claimAutoreleasedReturnValue();
              self = v30;
              if (v18)
              {
                v19 = (void *)v18;
                +[_CDLogging syncChannel](_CDLogging, "syncChannel");
                v20 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend((id)objc_opt_class(), "description");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  v29 = v20;
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v19, "length"));
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v15, "length"));
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v41 = v28;
                  v42 = 2112;
                  v43 = v24;
                  v44 = 2112;
                  v45 = v25;
                  _os_log_debug_impl(&dword_18DDBE000, v29, OS_LOG_TYPE_DEBUG, "%{public}@: Event compressed to %@ (from %@)", buf, 0x20u);

                  v20 = v29;
                }

                -[_CDSizeMetricFamily sizeMetricWithName:string:scale:]((uint64_t)v11, CFSTR("compressed bytes sent"), 0, 1024);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                CDSizeMetricAddSize((uint64_t)v21, objc_msgSend(v19, "length"));
                v22 = -[_DKEventData initWithCompressedData:uncompressedLength:version:]((id *)[_DKEventData alloc], v19, (void *)objc_msgSend(v15, "length"), (void *)2);

                self = v30;
                goto LABEL_17;
              }
            }
            else
            {
              free(v14);
              self = v30;
            }
          }
          -[_CDSizeMetricFamily sizeMetricWithName:string:scale:]((uint64_t)v11, CFSTR("uncompressed bytes sent"), 0, 1024);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          CDSizeMetricAddSize((uint64_t)v19, objc_msgSend(v10, "length"));
          v22 = -[_DKEventData initWithData:version:]((id *)[_DKEventData alloc], v10, (void *)1);
LABEL_17:

          -[_DKEventCKConverter recordFromEventData:event:]((uint64_t)self, v22, v7);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
            objc_msgSend(v31, "addObject:", v23);

          v8 = v35;
        }

        objc_autoreleasePoolPop(v8);
        ++v6;
      }
      while (v34 != v6);
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    }
    while (v34);
  }

  objc_autoreleasePoolPop(context);
  return v31;
}

- (id)recordFromEventData:(void *)a3 event:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;

  v5 = a3;
  if (a1)
  {
    -[_DKEventData asData](a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_alloc(MEMORY[0x1E0C95070]);
      objc_msgSend(v5, "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v7, "initWithRecordName:zoneID:", v9, *(_QWORD *)(a1 + 8));

      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("DKEvent"), v10);
      objc_msgSend(v11, "encryptedValuesByKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v6, CFSTR("encryptedEvent"));

      objc_msgSend(v5, "creationDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v5, "creationDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v14, CFSTR("eventCreationDate"));

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v15, CFSTR("eventCreationDate"));

        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[_DKEventCKConverter recordFromEventData:event:].cold.2(a1, v5, v16);

      }
      objc_msgSend(v5, "stream");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v18, CFSTR("streamName"));

    }
    else
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[_DKEventCKConverter recordFromEventData:event:].cold.1();
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)recordIDsFromEventIDs:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
        v13 = objc_alloc(MEMORY[0x1E0C95070]);
        objc_msgSend(v12, "UUIDString", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v13, "initWithRecordName:zoneID:", v14, self->_zoneID);

        if (v15)
          objc_msgSend(v6, "addObject:", v15);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  return v6;
}

- (id)eventIDsFromRecordIDsAndTypes:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  __int128 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v4);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v27;
    v10 = 0x1E0CB3000uLL;
    *(_QWORD *)&v7 = 138544386;
    v19 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v12, v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("DKEvent")))
        {
          objc_msgSend(v12, "recordName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(objc_alloc(*(Class *)(v10 + 2600)), "initWithUUIDString:", v14);
          if (v15)
          {
            objc_msgSend(v25, "addObject:", v15);
          }
          else
          {
            +[_CDLogging syncChannel](_CDLogging, "syncChannel");
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend((id)objc_opt_class(), "description");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "recordName");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "zoneID");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "zoneName");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "zoneID");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "ownerName");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v19;
              v31 = v24;
              v32 = 2114;
              v33 = CFSTR("DKEvent");
              v34 = 2114;
              v35 = v23;
              v36 = 2114;
              v37 = v22;
              v38 = 2114;
              v39 = v17;
              _os_log_error_impl(&dword_18DDBE000, v16, OS_LOG_TYPE_ERROR, "%{public}@: CKRecordID of type %{public}@ has an invalid UUIDString recordName:%{public}@ (zoneName:%{public}@ ownerName:%{public}@)", buf, 0x34u);

            }
            v10 = 0x1E0CB3000;
          }

        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
    }
    while (v8);
  }

  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneID, 0);
}

- (void)eventDataFromRecord:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1(&dword_18DDBE000, v1, v2, "%{public}@: Dropping event record: Missing value '%@'", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_1();
}

- (void)eventDataFromRecord:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11(&dword_18DDBE000, v1, v2, "%{public}@: Dropping event record: Unable to decode event", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_1();
}

- (void)eventDataFromRecord:(uint64_t)a1 .cold.3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "recordType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1(&dword_18DDBE000, v4, v5, "%{public}@: Dropping event record: Unexpected record type: %{public}@", v6, v7, v8, v9, 2u);

}

- (void)recordFromEventData:event:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11(&dword_18DDBE000, v1, v2, "%{public}@: Dropping event: Unable to encode event", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_1();
}

- (void)recordFromEventData:(NSObject *)a3 event:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate dk_localtimeString](v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138543874;
  v11 = v5;
  v12 = 2114;
  v13 = v7;
  v14 = 2114;
  v15 = v9;
  _os_log_error_impl(&dword_18DDBE000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Faking creation date on event %{public}@ (created %{public}@)", (uint8_t *)&v10, 0x20u);

}

@end
