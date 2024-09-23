@implementation KMCoreRoutineBridge

- (KMCoreRoutineBridge)init
{
  KMCoreRoutineBridge *v2;
  uint64_t v3;
  id v4;
  KVItemMapper *itemMapper;
  KMCoreRoutineBridge *v6;
  NSObject *v7;
  id v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)KMCoreRoutineBridge;
  v2 = -[KMCoreRoutineBridge init](&v10, sel_init);
  if (!v2)
    goto LABEL_4;
  v9 = 0;
  v3 = objc_msgSend(objc_alloc(MEMORY[0x24BE5E8F0]), "initWithObjectClass:error:", objc_opt_class(), &v9);
  v4 = v9;
  itemMapper = v2->_itemMapper;
  v2->_itemMapper = (KVItemMapper *)v3;

  if (v2->_itemMapper)
  {

LABEL_4:
    v6 = v2;
    goto LABEL_8;
  }
  v7 = KMLogContextCore;
  if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[KMCoreRoutineBridge init]";
    v13 = 2112;
    v14 = v4;
    _os_log_error_impl(&dword_218838000, v7, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }

  v6 = 0;
LABEL_8:

  return v6;
}

- (unsigned)cascadeItemType
{
  return 15757;
}

- (id)originAppId
{
  return (id)*MEMORY[0x24BE5E888];
}

- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4
{
  uint64_t (**v5)(id, void *);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  KVItemMapper *itemMapper;
  void *v21;
  void *v22;
  int v23;
  BOOL v24;
  NSObject *v25;
  NSObject *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id obj;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v5 = (uint64_t (**)(id, void *))a4;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingUnit:value:toDate:options:", 16, -90, v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingUnit:value:toDate:options:", 16, 10, v6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 0;
  -[KMCoreRoutineBridge _fetchLocationOfInterestBetweenStartDate:endDate:error:](self, "_fetchLocationOfInterestBetweenStartDate:endDate:error:", v8, v10, &v38);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v38;
  if (v11)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v31 = v11;
    obj = v11;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v35;
      v29 = v8;
      v30 = v6;
      v28 = v10;
      while (2)
      {
        v16 = 0;
        v17 = v12;
        do
        {
          if (*(_QWORD *)v35 != v15)
            objc_enumerationMutation(obj);
          v18 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v16);
          v19 = (void *)MEMORY[0x219A1AD04]();
          itemMapper = self->_itemMapper;
          v33 = v17;
          -[KVItemMapper mapObject:error:](itemMapper, "mapObject:error:", v18, &v33);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v33;

          if (objc_msgSend(v21, "count") != 1)
          {
            v26 = KMLogContextCore;
            v8 = v29;
            v6 = v30;
            v10 = v28;
            if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v40 = "-[KMCoreRoutineBridge enumerateItemsWithError:usingBlock:]";
              v41 = 2112;
              v42 = v21;
              v43 = 2112;
              v44 = v12;
              _os_log_error_impl(&dword_218838000, v26, OS_LOG_TYPE_ERROR, "%s Unexepected items: %@ error: %@", buf, 0x20u);
            }

            objc_autoreleasePoolPop(v19);
            v24 = 0;
            goto LABEL_20;
          }
          objc_msgSend(v21, "firstObject");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v5[2](v5, v22);

          objc_autoreleasePoolPop(v19);
          if (!v23)
          {
            v24 = 0;
            v8 = v29;
            v6 = v30;
            v10 = v28;
            goto LABEL_20;
          }
          ++v16;
          v17 = v12;
        }
        while (v14 != v16);
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
        v24 = 1;
        v8 = v29;
        v6 = v30;
        v10 = v28;
        if (v14)
          continue;
        break;
      }
    }
    else
    {
      v24 = 1;
    }
LABEL_20:

    v11 = v31;
  }
  else
  {
    v25 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v40 = "-[KMCoreRoutineBridge enumerateItemsWithError:usingBlock:]";
      v41 = 2112;
      v42 = v12;
      _os_log_error_impl(&dword_218838000, v25, OS_LOG_TYPE_ERROR, "%s Could not get CoreRoutine LOIs: %@", buf, 0x16u);
    }
    v24 = 0;
  }

  return v24;
}

- (id)_fetchLocationOfInterestBetweenStartDate:(id)a3 endDate:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  dispatch_semaphore_t v8;
  void *v9;
  NSObject *v10;
  dispatch_time_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  NSObject *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = dispatch_semaphore_create(0);
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__1662;
  v32 = __Block_byref_object_dispose__1663;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1662;
  v26 = __Block_byref_object_dispose__1663;
  v27 = 0;
  objc_msgSend(MEMORY[0x24BE27ED0], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __78__KMCoreRoutineBridge__fetchLocationOfInterestBetweenStartDate_endDate_error___block_invoke;
  v18[3] = &unk_24D961440;
  v20 = &v28;
  v21 = &v22;
  v10 = v8;
  v19 = v10;
  objc_msgSend(v9, "fetchLocationsOfInterestVisitedBetweenStartDate:endDate:withHandler:", v6, v7, v18);

  v11 = dispatch_time(0, 1000000000);
  if (dispatch_semaphore_wait(v10, v11))
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v34 = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Fetch CoreRoutine LOI timed out after %f second(s)"), 0x3FF0000000000000);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.vocabulary.donate.coreroutine.loi"), 1, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    KVSetError();

  }
  else
  {
    if (!v23[5])
    {
      v16 = (id)v29[5];
      goto LABEL_6;
    }
    KVSetError();
  }
  v16 = 0;
LABEL_6:

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemMapper, 0);
}

void __78__KMCoreRoutineBridge__fetchLocationOfInterestBetweenStartDate_endDate_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
