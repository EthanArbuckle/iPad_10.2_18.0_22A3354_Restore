@implementation WFMPMediaLibraryFiltering

+ (void)performCustomFilteringUsingComparisonPredicates:(id)a3 resultHandler:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void (**v33)(id, void *, void *);
  void *v34;
  id obj;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[5];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint8_t v46[128];
  _BYTE buf[24];
  void *v48;
  uint64_t *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v33 = (void (**)(id, void *, void *))a4;
  v34 = (void *)objc_opt_new();
  v36 = (void *)objc_opt_new();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v38;
    v32 = *MEMORY[0x24BDBCAB8];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v38 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(v36, "addObject:", v9);
          continue;
        }
        v10 = v9;
        if (objc_msgSend(v10, "comparisonType") == 4)
        {
          v11 = 0;
        }
        else
        {
          if (objc_msgSend(v10, "comparisonType") != 99)
          {

            goto LABEL_25;
          }
          v11 = 1;
        }
        objc_msgSend(v10, "property");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "userInfo");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "value");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & (v14 != 0)) == 1)
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          v15 = (_QWORD *)getMPMediaItemPropertyMediaTypeSymbolLoc_ptr_23120;
          v48 = (void *)getMPMediaItemPropertyMediaTypeSymbolLoc_ptr_23120;
          if (!getMPMediaItemPropertyMediaTypeSymbolLoc_ptr_23120)
          {
            v16 = MediaPlayerLibrary_23103();
            v15 = dlsym(v16, "MPMediaItemPropertyMediaType");
            *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v15;
            getMPMediaItemPropertyMediaTypeSymbolLoc_ptr_23120 = (uint64_t)v15;
          }
          _Block_object_dispose(buf, 8);
          if (!v15)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPMediaItemPropertyMediaType(void)");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, CFSTR("WFMPMediaLibraryFiltering.m"), 19, CFSTR("%s"), dlerror(), v32);

            __break(1u);
          }
          if (objc_msgSend(v13, "isEqualToString:", *v15))
          {
            WFMPMediaTypeMapping();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "allKeysForObject:", v14);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "firstObject");
            v19 = objc_claimAutoreleasedReturnValue();

            v14 = (void *)v19;
          }
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2050000000;
          v20 = (void *)getMPMediaPropertyPredicateClass_softClass;
          v48 = (void *)getMPMediaPropertyPredicateClass_softClass;
          if (!getMPMediaPropertyPredicateClass_softClass)
          {
            v41[0] = MEMORY[0x24BDAC760];
            v41[1] = 3221225472;
            v41[2] = __getMPMediaPropertyPredicateClass_block_invoke;
            v41[3] = &unk_24C4E3118;
            v41[4] = buf;
            __getMPMediaPropertyPredicateClass_block_invoke((uint64_t)v41);
            v20 = *(void **)(*(_QWORD *)&buf[8] + 24);
          }
          v21 = objc_retainAutorelease(v20);
          _Block_object_dispose(buf, 8);
          objc_msgSend(v21, "predicateWithValue:forProperty:comparisonType:", v14, v13, v11);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = 0;
        }

        if (v22)
        {
          objc_msgSend(v34, "addObject:", v22);

          continue;
        }
LABEL_25:
        objc_msgSend(v36, "addObject:", v10);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    }
    while (v6);
  }

  getWFMediaLibraryFilteringLogObject();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "+[WFMPMediaLibraryFiltering performCustomFilteringUsingComparisonPredicates:resultHandler:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v34;
    *(_WORD *)&buf[22] = 2112;
    v48 = v36;
    _os_log_impl(&dword_20BBAD000, v23, OS_LOG_TYPE_INFO, "%s Filtering with media predicates %@, unfilterable predicates %@", buf, 0x20u);
  }

  if (objc_msgSend(v34, "count"))
  {
    v42 = 0;
    v43 = &v42;
    v44 = 0x2050000000;
    v24 = (void *)getMPMediaQueryClass_softClass_23126;
    v45 = getMPMediaQueryClass_softClass_23126;
    if (!getMPMediaQueryClass_softClass_23126)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getMPMediaQueryClass_block_invoke_23127;
      v48 = &unk_24C4E3118;
      v49 = &v42;
      __getMPMediaQueryClass_block_invoke_23127((uint64_t)buf);
      v24 = (void *)v43[3];
    }
    v25 = objc_retainAutorelease(v24);
    _Block_object_dispose(&v42, 8);
    v26 = (void *)objc_msgSend([v25 alloc], "initWithFilterPredicates:", v34);
    objc_msgSend(v26, "items");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    getWFMediaLibraryFilteringLogObject();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = objc_msgSend(v27, "count");
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "+[WFMPMediaLibraryFiltering performCustomFilteringUsingComparisonPredicates:resultHandler:]";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v29;
      _os_log_impl(&dword_20BBAD000, v28, OS_LOG_TYPE_INFO, "%s MPMediaQuery completed with %lu results", buf, 0x16u);
    }

    v33[2](v33, v27, v36);
  }
  else
  {
    v33[2](v33, 0, 0);
  }

}

+ (Class)objectClass
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getMPMediaItemClass_softClass_23101;
  v9 = getMPMediaItemClass_softClass_23101;
  if (!getMPMediaItemClass_softClass_23101)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getMPMediaItemClass_block_invoke_23102;
    v5[3] = &unk_24C4E3118;
    v5[4] = &v6;
    __getMPMediaItemClass_block_invoke_23102((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = v2;
  _Block_object_dispose(&v6, 8);
  return (Class)v3;
}

@end
