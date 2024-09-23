@implementation DEDTestingFinisher

+ (id)log
{
  if (log_onceToken_0 != -1)
    dispatch_once(&log_onceToken_0, &__block_literal_global_11);
  return (id)log_log_0;
}

void __25__DEDTestingFinisher_log__block_invoke()
{
  os_log_t v0;
  void *v1;
  id v2;

  +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = os_log_create((const char *)objc_msgSend(v2, "loggingSubsystem"), "ded-testing-finisher");
  v1 = (void *)log_log_0;
  log_log_0 = (uint64_t)v0;

}

- (DEDTestingFinisher)initWithConfiguration:(id)a3 session:(id)a4
{
  id v4;
  DEDTestingFinisher *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DEDTestingFinisher;
  v4 = a4;
  v5 = -[DEDTestingFinisher init](&v7, sel_init);
  objc_storeWeak((id *)&v5->_session, v4);

  return v5;
}

- (void)finishSession:(id)a3 withConfiguration:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  char v24;
  NSObject *v25;
  id v26;
  void *v27;
  DEDCompressionDebouncer *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  NSObject *v52;
  DEDCompressionDebouncer *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id obj;
  void *v60;
  void *v61;
  DEDTestingFinisher *v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  id v68;
  _QWORD v69[4];
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t v79[128];
  uint8_t v80[4];
  void *v81;
  uint8_t buf[24];
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v62 = self;
  objc_msgSend((id)objc_opt_class(), "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21469E000, v6, OS_LOG_TYPE_DEFAULT, "Preparing to copy files to test directory.", buf, 2u);
  }

  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  objc_msgSend(v5, "allExtensionIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v76;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v76 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * i), "stringValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
    }
    while (v10);
  }

  v14 = (void *)objc_opt_new();
  objc_msgSend(v5, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "directoryForBugSessionIdentifier:", v15);
  v16 = objc_claimAutoreleasedReturnValue();

  v56 = (void *)v16;
  objc_msgSend(MEMORY[0x24BE2C9A0], "lsDir:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = v17;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v72;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v72 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * j);
        objc_msgSend(v22, "lastPathComponent");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "containsObject:", v23))
        {
          v24 = objc_msgSend(MEMORY[0x24BE2C9A0], "isValidDirectory:", v22);

          if ((v24 & 1) != 0)
          {
            objc_msgSend(v57, "addObject:", v22);
            continue;
          }
        }
        else
        {

        }
        objc_msgSend((id)objc_opt_class(), "log");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          -[DEDTestingFinisher finishSession:withConfiguration:].cold.4((uint64_t)buf, (uint64_t)v22);

      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
    }
    while (v19);
  }

  v69[0] = MEMORY[0x24BDAC760];
  v69[1] = 3221225472;
  v69[2] = __54__DEDTestingFinisher_finishSession_withConfiguration___block_invoke;
  v69[3] = &unk_24D1E5440;
  v26 = v5;
  v70 = v26;
  v27 = (void *)MEMORY[0x2199D4184](v69);
  v28 = -[DEDCompressionDebouncer initWithTrigger:interval:]([DEDCompressionDebouncer alloc], "initWithTrigger:interval:", v27, 1.0);
  -[DEDCompressionDebouncer handler](v28, "handler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDTestingFinisher flattenDirectories:progressHandler:](v62, "flattenDirectories:progressHandler:", v57, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "log");
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v80 = 138543362;
    v81 = v30;
    _os_log_impl(&dword_21469E000, v31, OS_LOG_TYPE_DEFAULT, "attachments = %{public}@", v80, 0xCu);
  }

  v32 = objc_alloc_init(MEMORY[0x24BDD1580]);
  objc_msgSend(v32, "temporaryDirectory");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "identifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "URLByAppendingPathComponent:", v34);
  v35 = objc_claimAutoreleasedReturnValue();

  v68 = 0;
  v60 = (void *)v35;
  v61 = v32;
  objc_msgSend(v32, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v35, 1, 0, &v68);
  v36 = v68;
  if (v36)
  {
    v37 = v36;
    objc_msgSend((id)objc_opt_class(), "log");
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      -[DEDTestingFinisher finishSession:withConfiguration:].cold.3(v37, v38);

  }
  v39 = objc_msgSend(v30, "count");
  if (v39)
  {
    v40 = v39;
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v55 = v30;
    v58 = v30;
    v41 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v64, v79, 16);
    if (v41)
    {
      v42 = v41;
      v53 = v28;
      v54 = v27;
      v43 = 0;
      v44 = *(_QWORD *)v65;
      do
      {
        for (k = 0; k != v42; objc_msgSend(v46, "uploadProgress:total:", k + v43, v40))
        {
          v46 = v26;
          if (*(_QWORD *)v65 != v44)
            objc_enumerationMutation(v58);
          v47 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * k);
          objc_msgSend(v47, "lastPathComponent", v53, v54);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "URLByAppendingPathComponent:", v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = 0;
          objc_msgSend(v61, "copyItemAtURL:toURL:error:", v47, v49, &v63);
          v50 = v63;

          if (v50)
          {
            objc_msgSend((id)objc_opt_class(), "log");
            v51 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
              -[DEDTestingFinisher finishSession:withConfiguration:].cold.2((uint64_t)v80, (uint64_t)v50);

          }
          ++k;
          v26 = v46;
        }
        v42 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v64, v79, 16);
        v43 += k;
      }
      while (v42);
      v28 = v53;
      v27 = v54;
    }
    else
    {
      v43 = 0;
    }

    if (v43 != v40)
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        -[DEDTestingFinisher finishSession:withConfiguration:].cold.1();

    }
    objc_msgSend(v26, "uploadProgress:total:", v40, v40);
    v30 = v55;
  }
  else
  {
    objc_msgSend(v26, "uploadProgress:total:", 1, 1);
  }
  objc_msgSend(v26, "didFinishAllUploads");

}

uint64_t __54__DEDTestingFinisher_finishSession_withConfiguration___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "compressionProgress:total:", a2, a3);
}

- (DEDTestingFinisher)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DEDTestingFinisher;
  return -[DEDTestingFinisher init](&v4, sel_init, a3);
}

+ (id)archivedClasses
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)flattenDirectories:(id)a3 progressHandler:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t m;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  id v32;
  id obj;
  id obja;
  id v35;
  uint8_t v36;
  _BYTE v37[15];
  _QWORD v38[4];
  id v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  uint64_t v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v32 = a4;
  v35 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
  v7 = 0;
  if (v6)
  {
    v8 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v60 != v8)
          objc_enumerationMutation(obj);
        objc_msgSend(MEMORY[0x24BE2C9A0], "lsDir:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v56;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v56 != v12)
                objc_enumerationMutation(v10);
              v14 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j);
              if (objc_msgSend(MEMORY[0x24BE2C9A0], "isValidDirectory:", v14))
                v7 += objc_msgSend(MEMORY[0x24BE2C978], "directorySizeOf:", v14);
            }
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
          }
          while (v11);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
    }
    while (v6);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v28 = obj;
  v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v66, 16);
  if (v30)
  {
    v15 = 0;
    v29 = *(_QWORD *)v52;
    do
    {
      for (k = 0; k != v30; ++k)
      {
        if (*(_QWORD *)v52 != v29)
          objc_enumerationMutation(v28);
        objc_msgSend(MEMORY[0x24BE2C9A0], "lsDir:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * k));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        obja = v16;
        v17 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v47, v65, 16);
        if (v17)
        {
          v18 = *(_QWORD *)v48;
          do
          {
            for (m = 0; m != v17; ++m)
            {
              if (*(_QWORD *)v48 != v18)
                objc_enumerationMutation(obja);
              v20 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * m);
              if (objc_msgSend(MEMORY[0x24BE2C9A0], "isValidDirectory:", v20))
              {
                v43 = 0;
                v44 = &v43;
                v45 = 0x2020000000;
                v46 = 0;
                objc_msgSend((id)objc_opt_class(), "log");
                v21 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138543362;
                  v64 = v20;
                  _os_log_debug_impl(&dword_21469E000, v21, OS_LOG_TYPE_DEBUG, "Compressing folder... (%{public}@)", buf, 0xCu);
                }

                v22 = (void *)MEMORY[0x24BE2C978];
                v38[0] = MEMORY[0x24BDAC760];
                v38[1] = 3221225472;
                v38[2] = __57__DEDTestingFinisher_flattenDirectories_progressHandler___block_invoke;
                v38[3] = &unk_24D1E5468;
                v40 = &v43;
                v39 = v32;
                v41 = v15;
                v42 = v7;
                objc_msgSend(v22, "archiveDirectoryAt:deleteOriginal:progressHandler:", v20, 1, v38);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = v44[3];
                objc_msgSend((id)objc_opt_class(), "log");
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                  -[DEDTestingFinisher flattenDirectories:progressHandler:].cold.1(&v36, v37, v25);

                if (v23)
                {
                  objc_msgSend(v35, "addObject:", v23);
                }
                else
                {
                  objc_msgSend((id)objc_opt_class(), "log");
                  v26 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543362;
                    v64 = v20;
                    _os_log_error_impl(&dword_21469E000, v26, OS_LOG_TYPE_ERROR, "Error compressing: %{public}@", buf, 0xCu);
                  }

                }
                v15 += v24;
                _Block_object_dispose(&v43, 8);
              }
              else
              {
                objc_msgSend(v35, "addObject:", v20);
              }
            }
            v17 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v47, v65, 16);
          }
          while (v17);
        }

      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v66, 16);
    }
    while (v30);
  }

  return v35;
}

uint64_t __57__DEDTestingFinisher_flattenDirectories_progressHandler___block_invoke(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) + a1[6], a1[7]);
}

- (void)writeData:(id)a3 filename:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  -[DEDTestingFinisher session](self, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "directoryForBugSessionIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "URLByAppendingPathComponent:", CFSTR("sendData"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "fileExistsAtPath:", v14);

  if ((v15 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v16, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v12, 1, 0, &v23);
    v17 = v23;

    if (v17)
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[DEDTestingFinisher writeData:filename:].cold.2();

    }
  }
  objc_msgSend(v12, "URLByAppendingPathComponent:", v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v7, "writeToURL:options:error:", v19, 2, &v22);

  v20 = v22;
  if (v20)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[DEDTestingFinisher writeData:filename:].cold.1();

  }
}

- (DEDBugSession)session
{
  return (DEDBugSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (void)setSession:(id)a3
{
  objc_storeWeak((id *)&self->_session, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_session);
}

- (void)finishSession:withConfiguration:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  v3 = 2048;
  v4 = v0;
  _os_log_error_impl(&dword_21469E000, v1, OS_LOG_TYPE_ERROR, "Expected to complete %lu files, but only completed %lu.", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)finishSession:(uint64_t)a1 withConfiguration:(uint64_t)a2 .cold.2(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_8(a1, a2), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v4;
  OUTLINED_FUNCTION_0_1(&dword_21469E000, v5, v6, "Error copying to destination directory. %@");

  OUTLINED_FUNCTION_9();
}

- (void)finishSession:(void *)a1 withConfiguration:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_21469E000, a2, v4, "Error creating destination directory. %@", v5);

}

- (void)finishSession:(uint64_t)a1 withConfiguration:(uint64_t)a2 .cold.4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_8(a1, a2), "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138543362;
  *v2 = v4;
  OUTLINED_FUNCTION_0_1(&dword_21469E000, v5, v6, "Error: Found folder that does not map to a completed extension: %{public}@");

  OUTLINED_FUNCTION_9();
}

- (void)flattenDirectories:(os_log_t)log progressHandler:.cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_21469E000, log, OS_LOG_TYPE_DEBUG, "Finished compressing", buf, 2u);
}

- (void)writeData:filename:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_21469E000, v0, v1, "Failed to save data: [%{public}@]", v2);
  OUTLINED_FUNCTION_1();
}

- (void)writeData:filename:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_21469E000, v0, v1, "Failed to create sendData directory: [%{public}@]", v2);
  OUTLINED_FUNCTION_1();
}

@end
