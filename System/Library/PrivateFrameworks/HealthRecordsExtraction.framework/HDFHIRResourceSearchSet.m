@implementation HDFHIRResourceSearchSet

- (id)_initWithEntries:(id)a3 serverBaseURL:(id)a4 pageURL:(id)a5 nextPageURL:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HDFHIRResourceSearchSet *v14;
  uint64_t v15;
  NSArray *entries;
  uint64_t v17;
  NSURL *serverBaseURL;
  uint64_t v19;
  NSURL *pageURL;
  uint64_t v21;
  NSURL *nextPageURL;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HDFHIRResourceSearchSet;
  v14 = -[HDFHIRResourceSearchSet init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    entries = v14->_entries;
    v14->_entries = (NSArray *)v15;

    v17 = objc_msgSend(v11, "copy");
    serverBaseURL = v14->_serverBaseURL;
    v14->_serverBaseURL = (NSURL *)v17;

    v19 = objc_msgSend(v12, "copy");
    pageURL = v14->_pageURL;
    v14->_pageURL = (NSURL *)v19;

    v21 = objc_msgSend(v13, "copy");
    nextPageURL = v14->_nextPageURL;
    v14->_nextPageURL = (NSURL *)v21;

  }
  return v14;
}

+ (id)searchSetWithFHIRJSONObject:(id)a3 serverBaseURL:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  int v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *j;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id *v45;
  NSObject *v46;
  id v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  id v54;
  NSObject *v55;
  void *v56;
  void *v58;
  objc_class *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  id v65;
  void *v66;
  id v67;
  id *v68;
  uint64_t v69;
  id obj;
  id obja;
  id v72;
  id v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint8_t buf[4];
  id v85;
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v64 = a4;
  objc_msgSend(v8, "detectedResourceType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Bundle"));

  if ((v10 & 1) == 0)
  {
    v31 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v8, "detectedResourceType");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "hk_assignError:code:format:", a5, 3, CFSTR("searchSetWithFHIRJSONObject needs \"Bundle\" resource, but got \"%@\"), v32);

    v33 = 0;
    goto LABEL_61;
  }
  v59 = (objc_class *)a1;
  objc_msgSend(v8, "sourceURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "JSONObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hk_safeArrayIfExistsForKeyPath:error:", CFSTR("link"), 0);
  v13 = objc_claimAutoreleasedReturnValue();

  v67 = v8;
  v68 = a5;
  v61 = (void *)v13;
  if (!v13)
  {
    v18 = 0;
    goto LABEL_23;
  }
  v14 = (void *)v13;
  v15 = v11;
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  obj = v14;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
  if (!v16)
  {
    v18 = 0;
    goto LABEL_22;
  }
  v17 = v16;
  v18 = 0;
  v19 = *(_QWORD *)v81;
  do
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v81 != v19)
        objc_enumerationMutation(obj);
      v21 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
      v22 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("url"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "hk_safeURLWithString:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        objc_msgSend(v21, "valueForKeyPath:", CFSTR("relation"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v25, "isEqual:", CFSTR("self")) & 1) != 0)
        {
          v26 = v15;
          v15 = v24;
          goto LABEL_14;
        }
        v28 = objc_msgSend(v25, "isEqual:", CFSTR("next"));
        v29 = v18;
        v26 = v18;
        v18 = v24;
        if (v28)
        {
LABEL_14:
          v30 = v24;

          v29 = v18;
        }
        v18 = v29;

        goto LABEL_16;
      }
      _HKInitializeLogging();
      v27 = *MEMORY[0x24BDD2FF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_224DAC000, v27, OS_LOG_TYPE_DEFAULT, "Ignoring \"link\" entry missing its \"url\" in Bundle", buf, 2u);
      }
LABEL_16:

    }
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
  }
  while (v17);
LABEL_22:

  a5 = v68;
  v11 = v15;
LABEL_23:
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "JSONObject");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = 0;
  objc_msgSend(v35, "hk_safeArrayForKeyPath:error:", CFSTR("entry"), &v79);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v79;

  v60 = v36;
  if (v36)
  {
    v63 = v34;
    v58 = v11;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v65 = v36;
    obja = (id)objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
    if (obja)
    {
      v69 = *(_QWORD *)v76;
      while (2)
      {
        for (j = 0; j != obja; j = (char *)j + 1)
        {
          if (*(_QWORD *)v76 != v69)
            objc_enumerationMutation(v65);
          v38 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)j);
          objc_opt_class();
          HKSafeObject();
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v33)
          {

            v11 = v58;
            v34 = v63;
            goto LABEL_60;
          }
          objc_msgSend(v38, "hk_safeStringIfExistsForKeyPath:error:", CFSTR("fullURL"), 0);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (v39)
          {
            objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v40 = 0;
          }
          v74 = 0;
          objc_msgSend(v38, "hk_safeDictionaryForKeyPath:error:", CFSTR("resource"), &v74);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v74;
          if (v41)
          {
            v43 = (void *)MEMORY[0x24BE48978];
            objc_msgSend(v8, "FHIRVersion");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            if (v40)
            {
              v73 = v42;
              v45 = &v73;
              objc_msgSend(v43, "resourceObjectWithJSONObject:sourceURL:FHIRVersion:receivedDate:extractionHints:error:", v41, v40, v44, v66, 0, &v73);
            }
            else
            {
              v72 = v42;
              v45 = &v72;
              objc_msgSend(v43, "resourceObjectWithJSONObject:serverBaseURL:FHIRVersion:receivedDate:error:", v41, v64, v44, v66, &v72);
            }
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = *v45;

            if (v48)
            {
              objc_msgSend(v63, "addObject:", v48);
            }
            else
            {
              _HKInitializeLogging();
              v49 = *MEMORY[0x24BDD2FF8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v85 = v47;
                _os_log_error_impl(&dword_224DAC000, v49, OS_LOG_TYPE_ERROR, "Failed to create resource object from search set entry: %@", buf, 0xCu);
              }
            }

            v8 = v67;
          }
          else
          {
            _HKInitializeLogging();
            v46 = *MEMORY[0x24BDD2FF8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v85 = v42;
              _os_log_impl(&dword_224DAC000, v46, OS_LOG_TYPE_DEFAULT, "No resource in search set entry: %@", buf, 0xCu);
            }
            v47 = v42;
          }

        }
        obja = (id)objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
        if (obja)
          continue;
        break;
      }
    }

    v11 = v58;
    v34 = v63;
LABEL_57:
    v33 = (void *)objc_msgSend([v59 alloc], "_initWithEntries:serverBaseURL:pageURL:nextPageURL:", v34, v64, v11, v18);
  }
  else
  {
    objc_msgSend(v8, "JSONObject");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("entry"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    _HKInitializeLogging();
    v52 = (void *)*MEMORY[0x24BDD2FF8];
    v53 = *MEMORY[0x24BDD2FF8];
    if (!v51)
    {
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        v55 = v52;
        HKSensitiveLogItem();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v85 = v56;
        _os_log_impl(&dword_224DAC000, v55, OS_LOG_TYPE_DEFAULT, "There's no \"entry\" key on Bundle obtained from %@", buf, 0xCu);

      }
      goto LABEL_57;
    }
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      +[HDFHIRResourceSearchSet searchSetWithFHIRJSONObject:serverBaseURL:error:].cold.1(v52);
    v54 = v62;
    if (v54)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v54);
      else
        _HKLogDroppedError();
    }

    v33 = 0;
  }
LABEL_60:

LABEL_61:
  return v33;
}

- (NSArray)entries
{
  return self->_entries;
}

- (NSURL)serverBaseURL
{
  return self->_serverBaseURL;
}

- (NSURL)pageURL
{
  return self->_pageURL;
}

- (NSURL)nextPageURL
{
  return self->_nextPageURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextPageURL, 0);
  objc_storeStrong((id *)&self->_pageURL, 0);
  objc_storeStrong((id *)&self->_serverBaseURL, 0);
  objc_storeStrong((id *)&self->_entries, 0);
}

+ (void)searchSetWithFHIRJSONObject:(void *)a1 serverBaseURL:error:.cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  HKSensitiveLogItem();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_224DAC000, v1, OS_LOG_TYPE_ERROR, "Invalid \"entry\" key on Bundle obtained from %@", (uint8_t *)&v3, 0xCu);

}

@end
