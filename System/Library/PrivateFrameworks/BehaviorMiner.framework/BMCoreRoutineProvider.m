@implementation BMCoreRoutineProvider

- (id)locationEvents
{
  void *v2;
  void *v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  id v6;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  objc_msgSend(MEMORY[0x24BE27ED0], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", -2419200.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v4 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __39__BMCoreRoutineProvider_locationEvents__block_invoke;
  v8[3] = &unk_24D21E8F0;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  objc_msgSend(v2, "fetchLocationsOfInterestVisitedSinceDate:withHandler:", v3, v8);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __39__BMCoreRoutineProvider_locationEvents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BMEvent *v15;
  void *v16;
  void *v17;
  BMEvent *v18;
  BMItem *v19;
  void *v20;
  BMItem *v21;
  BMEvent *v22;
  void *v23;
  void *v24;
  BMEvent *v25;
  BMItem *v26;
  void *v27;
  BMItem *v28;
  BMEvent *v29;
  void *v30;
  void *v31;
  BMEvent *v32;
  id v33;
  id obj;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v33 = v5;
    v39 = a1;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = v5;
    v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    if (v36)
    {
      v35 = *(_QWORD *)v50;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v50 != v35)
            objc_enumerationMutation(obj);
          v37 = v7;
          v8 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v7);
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          v48 = 0u;
          v41 = v8;
          objc_msgSend(v8, "visits");
          v38 = (id)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
          if (v42)
          {
            v40 = *(_QWORD *)v46;
            do
            {
              for (i = 0; i != v42; ++i)
              {
                if (*(_QWORD *)v46 != v40)
                  objc_enumerationMutation(v38);
                v10 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
                v11 = (void *)MEMORY[0x2199D5B54]();
                objc_msgSend(v41, "identifier");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "UUIDString");
                v13 = (void *)objc_claimAutoreleasedReturnValue();

                if (v13)
                {
                  v44 = v11;
                  +[BMItemType locationIdentifier](BMItemType, "locationIdentifier");
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  +[BMItem itemWithType:stringValue:](BMItem, "itemWithType:stringValue:", v14, v13);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();

                  v15 = [BMEvent alloc];
                  objc_msgSend(v10, "entryDate");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "exitDate");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  v18 = -[BMEvent initWithStartDate:endDate:item:](v15, "initWithStartDate:endDate:item:", v16, v17, v43);

                  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v39 + 40) + 8) + 40), "addObject:", v18);
                  v19 = [BMItem alloc];
                  +[BMItemType enterLocation](BMItemType, "enterLocation");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  v21 = -[BMItem initWithType:value:](v19, "initWithType:value:", v20, v13);

                  v22 = [BMEvent alloc];
                  objc_msgSend(v10, "entryDate");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "entryDate");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v25 = -[BMEvent initWithStartDate:endDate:item:](v22, "initWithStartDate:endDate:item:", v23, v24, v21);

                  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v39 + 40) + 8) + 40), "addObject:", v25);
                  v26 = [BMItem alloc];
                  +[BMItemType exitLocation](BMItemType, "exitLocation");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  v28 = -[BMItem initWithType:value:](v26, "initWithType:value:", v27, v13);

                  v29 = [BMEvent alloc];
                  objc_msgSend(v10, "exitDate");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "exitDate");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v32 = -[BMEvent initWithStartDate:endDate:item:](v29, "initWithStartDate:endDate:item:", v30, v31, v28);

                  v11 = v44;
                  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v39 + 40) + 8) + 40), "addObject:", v32);

                }
                objc_autoreleasePoolPop(v11);
              }
              v42 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
            }
            while (v42);
          }

          v7 = v37 + 1;
        }
        while (v37 + 1 != v36);
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      }
      while (v36);
    }

    v6 = 0;
    v5 = v33;
    a1 = v39;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

@end
