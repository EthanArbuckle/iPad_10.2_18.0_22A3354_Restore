@implementation FCCKDatabaseRecordVersionMiddleware

- (id)clientToServerRecordID:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  return a3;
}

- (id)serverToClientRecordID:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  return a3;
}

- (id)clientToServerRecordZoneID:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  return a3;
}

- (id)serverToClientRecordZoneID:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  return a3;
}

- (id)serverToClientRecord:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("readerMinimumRequiredVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (v6)
  {
    v8 = objc_msgSend(v6, "integerValue");
    v7 = v5;
    if (v8 >= 2)
    {
      v9 = FCPrivateDataEncryptionLog;
      if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412546;
        v13 = v5;
        v14 = 2112;
        v15 = &unk_1E470A508;
        _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "Cannot handle version due minimumRequiredVersion {Record: %@, readingVersion: %@}", (uint8_t *)&v12, 0x16u);
      }
      v7 = 0;
    }
  }
  v10 = v7;

  return v10;
}

- (id)clientToServerRecord:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("writerVersionHighWatermark"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6 || objc_msgSend(v6, "integerValue") <= 0)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E470A508, CFSTR("writerVersionHighWatermark"));
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("readerMinimumRequiredVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E470A508, CFSTR("readerMinimumRequiredVersion"));

  return v5;
}

- (id)clientToServerRecordZone:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  return a3;
}

- (id)serverToClientRecordZone:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  return a3;
}

- (id)serverToClientRecordType:(id)a3 withRecordID:(id)a4 inDatabase:(id)a5 error:(id *)a6
{
  return a3;
}

- (id)clientToServerRecordType:(id)a3 withRecordID:(id)a4 inDatabase:(id)a5 error:(id *)a6
{
  return a3;
}

- (int64_t)database:(id)a3 willEnqueueOperation:(id)a4 error:(id *)a5
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[2];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_opt_class();
  v21 = v5;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v7, "recordZoneIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v7, "configurationsByRecordZoneID", v21);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v15, "desiredKeys");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(v16, "mutableCopy");

          if (v17)
          {
            v26[0] = CFSTR("writerVersionHighWatermark");
            v26[1] = CFSTR("readerMinimumRequiredVersion");
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "removeObjectsInArray:", v18);
            objc_msgSend(v17, "addObjectsFromArray:", v18);
            v19 = (void *)objc_msgSend(v17, "copy");
            objc_msgSend(v15, "setDesiredKeys:", v19);

          }
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v10);
  }

  return 0;
}

@end
