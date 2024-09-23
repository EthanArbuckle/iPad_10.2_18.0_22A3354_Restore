@implementation DEDSeedingFinisher

- (id)additionalStateInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_24D202C98, CFSTR("version"));
  v16[0] = CFSTR("total_bytes_to_upload");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[DEDSeedingFinisher totalUploadSize](self, "totalUploadSize"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = CFSTR("bytes_uploaded");
  v17[0] = v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[DEDSeedingFinisher bytesUploadedFromAllFiles](self, "bytesUploadedFromAllFiles"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("finisher"));

  -[DEDSeedingFinisher config](self, "config");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v14 = CFSTR("allows_cellular_upload");
    v8 = (void *)MEMORY[0x24BDD16E0];
    -[DEDSeedingFinisher config](self, "config");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "numberWithBool:", objc_msgSend(v9, "allowsCellularUpload"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("config"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &stru_24D1E6AF0, CFSTR("config"));
  }
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isUploading
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  BOOL v10;
  _QWORD v12[5];

  -[DEDSeedingFinisher client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ongoingUploads");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[DEDSeedingFinisher promises](self, "promises");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __33__DEDSeedingFinisher_isUploading__block_invoke;
  v12[3] = &unk_24D1E48A0;
  v12[4] = self;
  objc_msgSend(v4, "ded_selectItemsPassingTest:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v6)
    v9 = v8 == 0;
  else
    v9 = 1;
  v10 = !v9;

  return v10;
}

uint64_t __33__DEDSeedingFinisher_isUploading__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = (id *)(a1 + 32);
  objc_msgSend(v5, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __33__DEDSeedingFinisher_isUploading__block_invoke_cold_1(v4, v3, v6);

  objc_msgSend(v3, "progress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isFinished") ^ 1;

  return v8;
}

- (BOOL)uploadFinished
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  BOOL v11;
  BOOL v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[DEDSeedingFinisher client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ongoingUploads");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[DEDSeedingFinisher promises](self, "promises");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = objc_msgSend(v4, "count");
  objc_msgSend(v4, "ded_selectItemsPassingTest:", &__block_literal_global_4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  -[DEDSeedingFinisher log](self, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v15 = 134218496;
    v16 = v6;
    v17 = 2048;
    v18 = v7;
    v19 = 2048;
    v20 = v9;
    _os_log_impl(&dword_21469E000, v10, OS_LOG_TYPE_INFO, "[%lu] file promises. [%lu] uploads. [%lu] uploads completed.", (uint8_t *)&v15, 0x20u);
  }

  if (v6)
    v11 = v7 == 0;
  else
    v11 = 1;
  v13 = !v11 && v9 == v6;

  return v13;
}

uint64_t __36__DEDSeedingFinisher_uploadFinished__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFinished");

  return v3;
}

- (void)finishSession:(id)a3 withConfiguration:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  DEDSeedingClient *v17;
  void *v18;
  void *v19;
  DEDSeedingClient *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  double v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  int v48;
  id v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  DEDSeedingFinisher *v63;
  uint64_t v64;
  NSObject *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  NSObject *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  uint64_t v78;
  id obj;
  _QWORD v80[6];
  id v81;
  NSObject *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint8_t v91[128];
  uint8_t buf[4];
  void *v93;
  __int16 v94;
  uint64_t v95;
  __int16 v96;
  double v97;
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[DEDSeedingFinisher setConfig:](self, "setConfig:", a4);
  -[DEDSeedingFinisher setSession:](self, "setSession:", v6);
  v7 = (void *)MEMORY[0x24BDD17C8];
  -[DEDSeedingFinisher config](self, "config");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "seedingSubmissionType");
  v10 = "Unknown";
  if (v9 == 2)
    v10 = "FFU";
  if (v9 == 1)
    v11 = "FR";
  else
    v11 = v10;
  -[DEDSeedingFinisher config](self, "config");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("com.apple.diagnosticextensionsd-finishing-%s-%ld"), v11, objc_msgSend(v12, "seedingSubmissionID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v76 = objc_retainAutorelease(v13);
  objc_msgSend(v76, "UTF8String");
  v14 = (void *)os_transaction_create();
  -[DEDSeedingFinisher setTransaction:](self, "setTransaction:", v14);

  -[DEDSeedingFinisher client](self, "client");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    -[DEDSeedingFinisher log](self, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21469E000, v16, OS_LOG_TYPE_DEFAULT, "Initializing networking client for resuming finisher", buf, 2u);
    }

    v17 = [DEDSeedingClient alloc];
    -[DEDSeedingFinisher config](self, "config");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[DEDSeedingClient initWithConfiguration:sessionID:delegate:](v17, "initWithConfiguration:sessionID:delegate:", v18, v19, self);
    -[DEDSeedingFinisher setClient:](self, "setClient:", v20);

  }
  -[DEDSeedingFinisher log](self, "log");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    -[DEDSeedingFinisher session](self, "session");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v93 = v23;
    _os_log_impl(&dword_21469E000, v21, OS_LOG_TYPE_DEFAULT, "Will prepare submission directory for bug session [%{public}@]", buf, 0xCu);

  }
  -[DEDSeedingFinisher prepareSessionDirectoryForSubmission:](self, "prepareSessionDirectoryForSubmission:", v6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDSeedingFinisher log](self, "log");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    -[DEDSeedingFinisher session](self, "session");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "identifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v93 = v27;
    _os_log_impl(&dword_21469E000, v25, OS_LOG_TYPE_DEFAULT, "Did prepare submission directory for bug session [%{public}@]", buf, 0xCu);

  }
  v77 = v6;
  v75 = v24;
  if (objc_msgSend(v24, "count"))
  {
    -[DEDSeedingFinisher uploads](self, "uploads");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObjectsFromArray:", v24);
  }
  else
  {
    -[DEDSeedingFinisher log](self, "log");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "identifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v93 = v30;
      _os_log_impl(&dword_21469E000, v29, OS_LOG_TYPE_DEFAULT, "Prepared session directory but got zero upload items on [%{public}@]. Will not start any new uploads", buf, 0xCu);

    }
    -[DEDSeedingFinisher client](self, "client");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "ongoingUploads");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    v28 = v32;
    v33 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v87, v98, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v88;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v88 != v35)
            objc_enumerationMutation(v28);
          v37 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
          -[DEDSeedingFinisher log](self, "log");
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            -[DEDSeedingFinisher session](self, "session");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "identifier");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v37, "taskIdentifier");
            objc_msgSend(v37, "progress");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "fractionCompleted");
            *(_DWORD *)buf = 138543874;
            v93 = v40;
            v94 = 2048;
            v95 = v41;
            v96 = 2048;
            v97 = v43 * 100.0;
            _os_log_impl(&dword_21469E000, v38, OS_LOG_TYPE_DEFAULT, "[%{public}@] found upload task [%lu] completion [%.2f%%]", buf, 0x20u);

          }
        }
        v34 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v87, v98, 16);
      }
      while (v34);
    }

    v6 = v77;
  }

  v44 = dispatch_group_create();
  -[DEDSeedingFinisher setTotalUploadSize:](self, "setTotalUploadSize:", 0);
  -[DEDSeedingFinisher log](self, "log");
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "identifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDSeedingFinisher uploads](self, "uploads");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "count");
    *(_DWORD *)buf = 138543618;
    v93 = v46;
    v94 = 1024;
    LODWORD(v95) = v48;
    _os_log_impl(&dword_21469E000, v45, OS_LOG_TYPE_DEFAULT, "will dispatch uploads for [%{public}@] with [%d] uploads", buf, 0x12u);

  }
  v49 = objc_alloc(MEMORY[0x24BDBCF20]);
  -[DEDSeedingFinisher uploads](self, "uploads");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)objc_msgSend(v49, "initWithSet:", v50);

  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  obj = v51;
  v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v84;
    v55 = MEMORY[0x24BDAC760];
    do
    {
      v56 = 0;
      v78 = v53;
      do
      {
        if (*(_QWORD *)v84 != v54)
          objc_enumerationMutation(obj);
        v57 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v56);
        dispatch_group_enter(v44);
        -[DEDSeedingFinisher promises](self, "promises");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "extensionID");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "objectForKey:", v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        -[DEDSeedingFinisher log](self, "log");
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v57, "publicDescription");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "UUIDString");
          v63 = self;
          v64 = v54;
          v65 = v44;
          v66 = v55;
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v93 = v62;
          v94 = 2114;
          v95 = (uint64_t)v67;
          _os_log_impl(&dword_21469E000, v61, OS_LOG_TYPE_DEFAULT, "will send file %{public}@ promise: [%{public}@]", buf, 0x16u);

          v55 = v66;
          v44 = v65;
          v54 = v64;
          self = v63;
          v53 = v78;

        }
        -[DEDSeedingFinisher client](self, "client");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "attachedPath");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v80[0] = v55;
        v80[1] = 3221225472;
        v80[2] = __54__DEDSeedingFinisher_finishSession_withConfiguration___block_invoke;
        v80[3] = &unk_24D1E4908;
        v80[4] = v57;
        v80[5] = self;
        v81 = v60;
        v82 = v44;
        v70 = v60;
        objc_msgSend(v68, "sendFile:promise:withCompletion:", v69, v70, v80);

        ++v56;
      }
      while (v53 != v56);
      v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
    }
    while (v53);
  }

  dispatch_group_wait(v44, 0xFFFFFFFFFFFFFFFFLL);
  -[DEDSeedingFinisher log](self, "log");
  v71 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v77, "identifier");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v93 = v72;
    _os_log_impl(&dword_21469E000, v71, OS_LOG_TYPE_DEFAULT, "did dispatch all uploads for [%{public}@]", buf, 0xCu);

  }
  objc_msgSend(v77, "uploadProgress:total:", 0, -[DEDSeedingFinisher totalUploadSize](self, "totalUploadSize"));
  -[DEDSeedingFinisher log](self, "log");
  v73 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v77, "identifier");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v93 = v74;
    _os_log_impl(&dword_21469E000, v73, OS_LOG_TYPE_INFO, "finishSession completed (uploads are dispatched) for session [%{public}@]", buf, 0xCu);

  }
}

void __54__DEDSeedingFinisher_finishSession_withConfiguration___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138543362;
      v21 = v5;
      _os_log_impl(&dword_21469E000, v6, OS_LOG_TYPE_DEFAULT, "Error sending file %{public}@", (uint8_t *)&v20, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "client");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "promiseFilename");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "fileSize");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "longLongValue");
    v12 = v7;
    v13 = v8;
    v14 = v9;
    v15 = 99;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setUploadTask:", a2);
    objc_msgSend(*(id *)(a1 + 32), "fileSize");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setTotalBytesExpectedToSend:", objc_msgSend(v16, "longLongValue"));

    objc_msgSend(*(id *)(a1 + 40), "setTotalUploadSize:", objc_msgSend(*(id *)(a1 + 40), "totalUploadSize") + objc_msgSend(*(id *)(a1 + 32), "totalBytesExpectedToSend"));
    objc_msgSend(*(id *)(a1 + 32), "extensionID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      goto LABEL_7;
    v18 = *(void **)(a1 + 40);
    if (!*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(v18, "log");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __54__DEDSeedingFinisher_finishSession_withConfiguration___block_invoke_cold_1();
      goto LABEL_6;
    }
    objc_msgSend(v18, "client");
    v7 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "promiseFilename");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "fileSize");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "longLongValue");
    v12 = v7;
    v13 = v19;
    v14 = v9;
    v15 = 3;
  }
  -[NSObject updatePromise:withFilename:size:status:success:error:](v12, "updatePromise:withFilename:size:status:success:error:", v13, v14, v11, v15, 0, 0);

LABEL_6:
LABEL_7:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

- (DEDSeedingFinisher)initWithConfiguration:(id)a3 session:(id)a4
{
  id v7;
  id v8;
  DEDSeedingFinisher *v9;
  DEDSeedingClient *v10;
  void *v11;
  uint64_t v12;
  DEDSeedingClient *client;
  uint64_t v14;
  NSMutableDictionary *promises;
  uint64_t v16;
  NSMutableSet *uploads;
  void *v18;
  os_log_t v19;
  OS_os_log *log;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)DEDSeedingFinisher;
  v9 = -[DEDSeedingFinisher init](&v22, sel_init);
  if (v9)
  {
    v10 = [DEDSeedingClient alloc];
    objc_msgSend(v8, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[DEDSeedingClient initWithConfiguration:sessionID:delegate:](v10, "initWithConfiguration:sessionID:delegate:", v7, v11, v9);
    client = v9->_client;
    v9->_client = (DEDSeedingClient *)v12;

    objc_storeStrong((id *)&v9->_config, a3);
    objc_storeWeak((id *)&v9->_session, v8);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 5);
    promises = v9->_promises;
    v9->_promises = (NSMutableDictionary *)v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 2);
    uploads = v9->_uploads;
    v9->_uploads = (NSMutableSet *)v16;

    +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = os_log_create((const char *)objc_msgSend(v18, "loggingSubsystem"), "seed-finish");
    log = v9->_log;
    v9->_log = (OS_os_log *)v19;

    v9->_isPreparing = 0;
    +[DEDFBKFeedbackUpload cleanUpIfNeeded](DEDFBKFeedbackUpload, "cleanUpIfNeeded");
  }

  return v9;
}

- (DEDSeedingFinisher)initWithCoder:(id)a3
{
  id v4;
  DEDSeedingFinisher *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *promises;
  uint64_t v12;
  NSMutableSet *uploads;
  void *v14;
  os_log_t v15;
  OS_os_log *log;
  NSObject *v17;
  NSMutableDictionary *v18;
  objc_super v20;
  uint8_t buf[4];
  NSMutableDictionary *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DEDSeedingFinisher;
  v5 = -[DEDSeedingFinisher init](&v20, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCEF0];
    +[DEDSeedingFinisher archivedClasses](DEDSeedingFinisher, "archivedClasses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithSet:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "minusSet:", v9);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("promises"));
    v10 = objc_claimAutoreleasedReturnValue();
    promises = v5->_promises;
    v5->_promises = (NSMutableDictionary *)v10;

    v5->_totalUploadSize = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("totalUploadSize"));
    v5->_bytesUploadedFromAllFiles = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("bytesUploaded"));
    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 2);
    uploads = v5->_uploads;
    v5->_uploads = (NSMutableSet *)v12;

    +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = os_log_create((const char *)objc_msgSend(v14, "loggingSubsystem"), "seed-finish");
    log = v5->_log;
    v5->_log = (OS_os_log *)v15;

    v17 = v5->_log;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = v5->_promises;
      *(_DWORD *)buf = 138412290;
      v22 = v18;
      _os_log_impl(&dword_21469E000, v17, OS_LOG_TYPE_INFO, "Restoring Seeding Finisher with promises %@", buf, 0xCu);
    }
    v5->_isPreparing = 0;
    +[DEDFBKFeedbackUpload cleanUpIfNeeded](DEDFBKFeedbackUpload, "cleanUpIfNeeded");

  }
  return v5;
}

- (void)didStartCollectingDiagnosticExtensionWithIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x24BDD1880];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[DEDSeedingFinisher promises](self, "promises");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v5);

  -[DEDSeedingFinisher save](self, "save");
  -[DEDSeedingFinisher client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "makePromiseWithUUID:extensionID:success:error:", v8, v5, 0, 0);

}

- (void)didCollectAttachmentGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v4 = a3;
  objc_msgSend(v4, "extensionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DEDSeedingFinisher promises](self, "promises");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "extensionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[DEDSeedingFinisher client](self, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updatePromise:withAttachmentGroup:status:success:error:", v8, v4, 2, 0, 0);

  }
  else
  {
    -[DEDSeedingFinisher log](self, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[DEDSeedingFinisher didCollectAttachmentGroup:].cold.1();

  }
}

- (void)didCancelCollectionOnExtension:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  -[DEDSeedingFinisher promises](self, "promises");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[DEDSeedingFinisher client](self, "client");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancelPromise:withSuccess:error:", v6, 0, 0);

    -[DEDSeedingFinisher promises](self, "promises");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject removeObjectForKey:](v8, "removeObjectForKey:", v4);
  }
  else
  {
    -[DEDSeedingFinisher log](self, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[DEDSeedingFinisher didCancelCollectionOnExtension:].cold.1();
  }

}

- (void)didAdoptAttachmentGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "extensionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDSeedingFinisher promises](self, "promises");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "extensionID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

    -[DEDSeedingFinisher save](self, "save");
    -[DEDSeedingFinisher client](self, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "extensionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __46__DEDSeedingFinisher_didAdoptAttachmentGroup___block_invoke;
    v12[3] = &unk_24D1E4930;
    v12[4] = self;
    v13 = v6;
    v14 = v4;
    v11 = v6;
    objc_msgSend(v9, "makePromiseWithUUID:extensionID:success:error:", v11, v10, v12, 0);

  }
}

void __46__DEDSeedingFinisher_didAdoptAttachmentGroup___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updatePromise:withAttachmentGroup:status:success:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 2, 0, 0);

}

- (void)cleanup
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  NSObject *v24;
  void *v25;
  id obj;
  _QWORD v27[5];
  id v28;
  NSObject *v29;
  _QWORD v30[5];
  id v31;
  NSObject *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  -[DEDSeedingFinisher promises](self, "promises");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[DEDSeedingFinisher log](self, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[DEDSeedingFinisher promises](self, "promises");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "allValues");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "valueForKeyPath:", CFSTR("UUIDString"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v9;
      _os_log_impl(&dword_21469E000, v6, OS_LOG_TYPE_DEFAULT, "Found promises on cleanup, will cancel [%{public}@]", buf, 0xCu);

    }
    v10 = dispatch_group_create();
    -[DEDSeedingFinisher promises](self, "promises");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(v12, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v34;
      v16 = MEMORY[0x24BDAC760];
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v34 != v15)
            objc_enumerationMutation(obj);
          v18 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v12, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[DEDSeedingFinisher promises](self, "promises");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "removeObjectForKey:", v18);

          dispatch_group_enter(v10);
          -[DEDSeedingFinisher client](self, "client");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v30[0] = v16;
          v30[1] = 3221225472;
          v30[2] = __29__DEDSeedingFinisher_cleanup__block_invoke;
          v30[3] = &unk_24D1E4930;
          v30[4] = self;
          v22 = v19;
          v31 = v22;
          v32 = v10;
          v27[0] = v16;
          v27[1] = 3221225472;
          v27[2] = __29__DEDSeedingFinisher_cleanup__block_invoke_48;
          v27[3] = &unk_24D1E4958;
          v27[4] = self;
          v28 = v22;
          v29 = v32;
          v23 = v22;
          objc_msgSend(v21, "cancelPromise:withSuccess:error:", v23, v30, v27);

        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v14);
    }

    dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    -[DEDSeedingFinisher log](self, "log");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21469E000, v24, OS_LOG_TYPE_DEFAULT, "did finish cleanup cancel file promises", buf, 2u);
    }

  }
  -[DEDSeedingFinisher client](self, "client");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "cleanup");

}

void __29__DEDSeedingFinisher_cleanup__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_21469E000, v2, OS_LOG_TYPE_DEFAULT, "did cleanup cancel promise [%{public}@]", (uint8_t *)&v4, 0xCu);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __29__DEDSeedingFinisher_cleanup__block_invoke_48(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_21469E000, v2, OS_LOG_TYPE_DEFAULT, "did failed to cleanup cancel promise [%{public}@]", (uint8_t *)&v4, 0xCu);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[DEDSeedingFinisher promises](self, "promises");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("promises"));

  objc_msgSend(v5, "encodeInt64:forKey:", -[DEDSeedingFinisher totalUploadSize](self, "totalUploadSize"), CFSTR("totalUploadSize"));
  objc_msgSend(v5, "encodeInt64:forKey:", -[DEDSeedingFinisher bytesUploadedFromAllFiles](self, "bytesUploadedFromAllFiles"), CFSTR("bytesUploaded"));

}

+ (id)archivedClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, objc_opt_class(), 0);
}

- (void)uploadTask:(id)a3 didCompleteWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  __int16 v33;
  _BOOL4 v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[DEDSeedingFinisher log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v31 = 134218240;
    v32 = objc_msgSend(v6, "taskIdentifier");
    v33 = 1024;
    v34 = v7 != 0;
    _os_log_impl(&dword_21469E000, v8, OS_LOG_TYPE_DEFAULT, "Upload Task: [%lu] did complete. Error? [%i]", (uint8_t *)&v31, 0x12u);
  }

  -[DEDSeedingFinisher uploadItemForTask:](self, "uploadItemForTask:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "fileSize");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBytesUploaded:", objc_msgSend(v11, "longLongValue"));

    objc_msgSend(v10, "setCompleted:", 1);
    -[DEDSeedingFinisher updateUploadProgressOnSessionIfNeeded](self, "updateUploadProgressOnSessionIfNeeded");
    -[DEDSeedingFinisher promises](self, "promises");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "extensionID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      if (v7)
      {
        -[DEDSeedingFinisher log](self, "log");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[DEDSeedingFinisher uploadTask:didCompleteWithError:].cold.2(v6);

        -[DEDSeedingFinisher client](self, "client");
        v16 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "promiseFilename");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "fileSize");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "longLongValue");
        v20 = v16;
        v21 = v14;
        v22 = v17;
        v23 = 99;
      }
      else
      {
        -[DEDSeedingFinisher client](self, "client");
        v16 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "promiseFilename");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "fileSize");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "longLongValue");
        v20 = v16;
        v21 = v14;
        v22 = v17;
        v23 = 4;
      }
      -[NSObject updatePromise:withFilename:size:status:success:error:](v20, "updatePromise:withFilename:size:status:success:error:", v21, v22, v19, v23, 0, 0);

    }
    else
    {
      -[DEDSeedingFinisher log](self, "log");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[DEDSeedingFinisher uploadTask:didCompleteWithError:].cold.1();
    }

    objc_msgSend(v10, "attachedPath");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = (void *)MEMORY[0x24BE2C9A0];
      objc_msgSend(v10, "attachedPath");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "removeFile:", v26);

    }
  }
  if (-[DEDSeedingFinisher uploadsAreComplete](self, "uploadsAreComplete"))
  {
    -[DEDSeedingFinisher setTransaction:](self, "setTransaction:", 0);
    v27 = (void *)objc_opt_new();
    -[DEDSeedingFinisher setPromises:](self, "setPromises:", v27);

    -[DEDSeedingFinisher session](self, "session");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[DEDFBKFeedbackUpload didFinishUploadOnBugSessionIdentifier:](DEDFBKFeedbackUpload, "didFinishUploadOnBugSessionIdentifier:", v29);

    -[DEDSeedingFinisher session](self, "session");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "didFinishAllUploads");

  }
}

- (void)uploadTask:(id)a3 didSendBytes:(int64_t)a4 totalBytesExpectedToSend:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  DEDSeedingUploadItem *v12;
  void *v13;

  v8 = a3;
  -[DEDSeedingFinisher uploadItemForTask:](self, "uploadItemForTask:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "setBytesUploaded:", a4);
  }
  else
  {
    -[DEDSeedingFinisher log](self, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[DEDSeedingFinisher uploadTask:didSendBytes:totalBytesExpectedToSend:].cold.1(self, v8);

    v12 = objc_alloc_init(DEDSeedingUploadItem);
    -[DEDSeedingUploadItem setUploadTask:](v12, "setUploadTask:", v8);
    -[DEDSeedingUploadItem setBytesUploaded:](v12, "setBytesUploaded:", a4);
    -[DEDSeedingUploadItem setTotalBytesExpectedToSend:](v12, "setTotalBytesExpectedToSend:", a5);
    -[DEDSeedingFinisher uploads](self, "uploads");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v12);

  }
  -[DEDSeedingFinisher updateUploadProgressOnSessionIfNeeded](self, "updateUploadProgressOnSessionIfNeeded");

}

- (void)updateUploadProgressOnSessionIfNeeded
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  int v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  int64_t v24;
  __int16 v25;
  int64_t v26;
  __int16 v27;
  int64_t v28;
  __int16 v29;
  int v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[DEDSeedingFinisher uploads](self, "uploads", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v31, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v3);
        v6 += objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "bytesUploaded");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v31, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  -[DEDSeedingFinisher setBytesUploadedFromAllFiles:](self, "setBytesUploadedFromAllFiles:", v6);
  if (-[DEDSeedingFinisher shouldReportProgress](self, "shouldReportProgress"))
  {
    -[DEDSeedingFinisher setUploadProgressCounter:](self, "setUploadProgressCounter:", -[DEDSeedingFinisher uploadProgressCounter](self, "uploadProgressCounter") + 1);
    -[DEDSeedingFinisher session](self, "session");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uploadProgress:total:", -[DEDSeedingFinisher bytesUploadedFromAllFiles](self, "bytesUploadedFromAllFiles"), -[DEDSeedingFinisher totalUploadSize](self, "totalUploadSize"));

    -[DEDSeedingFinisher log](self, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      -[DEDSeedingFinisher session](self, "session");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[DEDSeedingFinisher lastUploadPercentageReported](self, "lastUploadPercentageReported");
      v14 = -[DEDSeedingFinisher bytesUploadedFromAllFiles](self, "bytesUploadedFromAllFiles");
      v15 = -[DEDSeedingFinisher totalUploadSize](self, "totalUploadSize");
      v16 = -[DEDSeedingFinisher uploadProgressCounter](self, "uploadProgressCounter");
      *(_DWORD *)buf = 138544386;
      v22 = v12;
      v23 = 2048;
      v24 = v13;
      v25 = 2048;
      v26 = v14;
      v27 = 2048;
      v28 = v15;
      v29 = 1024;
      v30 = v16;
      _os_log_impl(&dword_21469E000, v10, OS_LOG_TYPE_INFO, "[%{public}@] upload progress: %lu%% (sent: %lu total: %lu) updateCount: %i", buf, 0x30u);

    }
  }
}

- (BOOL)shouldReportProgress
{
  float v3;
  uint64_t v4;
  BOOL v5;
  NSObject *v6;

  if (-[DEDSeedingFinisher totalUploadSize](self, "totalUploadSize"))
  {
    v3 = (float)-[DEDSeedingFinisher bytesUploadedFromAllFiles](self, "bytesUploadedFromAllFiles");
    v4 = 5
       * ((uint64_t)(float)((float)(v3 / (float)-[DEDSeedingFinisher totalUploadSize](self, "totalUploadSize")) * 100.0)
        / 5);
    v5 = v4 != -[DEDSeedingFinisher lastUploadPercentageReported](self, "lastUploadPercentageReported")
      && -[DEDSeedingFinisher uploadProgressCounter](self, "uploadProgressCounter") < 100;
    -[DEDSeedingFinisher setLastUploadPercentageReported:](self, "setLastUploadPercentageReported:", v4);
  }
  else
  {
    -[DEDSeedingFinisher log](self, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[DEDSeedingFinisher shouldReportProgress].cold.1();

    return 0;
  }
  return v5;
}

- (BOOL)uploadsAreComplete
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[DEDSeedingFinisher uploads](self, "uploads", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    v6 = 1;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v6 &= objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "completed");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (id)prepareSessionDirectoryForSubmission:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  BOOL v17;
  void *v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  id obj;
  void *v45;
  void *v46;
  DEDSeedingFinisher *v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  void *v55;
  _QWORD v56[2];
  _QWORD v57[2];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DEDSeedingFinisher setIsPreparing:](self, "setIsPreparing:", 1);
  v47 = self;
  -[DEDSeedingFinisher attachmentHandler](self, "attachmentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v4;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v5;
  objc_msgSend(v5, "directoryForBugSessionIdentifier:", v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v37 = (void *)v7;
  objc_msgSend(MEMORY[0x24BE2C9A0], "lsDir:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v51;
    v12 = *MEMORY[0x24BDBCC60];
    v40 = *MEMORY[0x24BDBCC60];
    v41 = *(_QWORD *)v51;
    do
    {
      v13 = 0;
      v43 = v10;
      do
      {
        if (*(_QWORD *)v51 != v11)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v13);
        v48 = 0;
        v49 = 0;
        objc_msgSend(v14, "getResourceValue:forKey:error:", &v49, v12, &v48);
        v15 = v49;
        v16 = v48;
        if (objc_msgSend(v15, "BOOLValue"))
          v17 = v16 == 0;
        else
          v17 = 0;
        if (v17)
        {
          v18 = (void *)MEMORY[0x24BDD17C8];
          -[DEDSeedingFinisher config](v47, "config");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "seedingSubmissionType");
          v21 = "Unknown";
          if (v20 == 2)
            v21 = "feedback_followup_id";
          if (v20 == 1)
            v22 = "feedback_id";
          else
            v22 = v21;
          objc_msgSend(v18, "stringWithUTF8String:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "lastPathComponent");
          v24 = objc_claimAutoreleasedReturnValue();
          -[DEDSeedingFinisher promises](v47, "promises");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = (void *)v24;
          objc_msgSend(v25, "objectForKey:", v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
          {
            objc_msgSend(v26, "UUIDString");
            v27 = objc_claimAutoreleasedReturnValue();
            v45 = v23;
            v56[0] = v23;
            v28 = (void *)MEMORY[0x24BDD16E0];
            -[DEDSeedingFinisher config](v47, "config");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "numberWithInteger:", objc_msgSend(v29, "seedingSubmissionID"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v56[1] = CFSTR("promise_uuid");
            v57[0] = v30;
            v57[1] = v27;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            -[DEDSeedingFinisher prepareUpload:forSubmissionWithSession:metadata:](v47, "prepareUpload:forSubmissionWithSession:metadata:", v14, v42, v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setFilePromiseUUID:", v27);
            if (v32)
              objc_msgSend(v39, "addObject:", v32);

            v12 = v40;
            v11 = v41;
            v10 = v43;
            v23 = v45;
            v33 = v46;
          }
          else
          {
            -[DEDSeedingFinisher log](v47, "log");
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v33 = v46;
              v55 = v46;
              _os_log_error_impl(&dword_21469E000, v27, OS_LOG_TYPE_ERROR, "found no promise for extension ID [%{public}@]", buf, 0xCu);
              v10 = v43;
            }
            else
            {
              v10 = v43;
              v33 = v46;
            }
          }

        }
        ++v13;
      }
      while (v10 != v13);
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      v10 = v34;
    }
    while (v34);
  }

  -[DEDSeedingFinisher setIsPreparing:](v47, "setIsPreparing:", 0);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v39);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

- (id)prepareUpload:(id)a3 forSubmissionWithSession:(id)a4 metadata:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  __CFString *v32;
  uint64_t v33;
  void *v34;
  __CFString *v35;
  uint64_t v36;
  __CFString *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  uint64_t v52;
  void *v53;
  const __CFString *v54;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  __CFString *v64;
  NSObject *v65;
  void *v66;
  id v67;
  id v68;
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  uint64_t v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[DEDSeedingFinisher log](self, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[DEDSeedingFinisher prepareUpload:forSubmissionWithSession:metadata:].cold.12();

  -[DEDSeedingFinisher attachmentHandler](self, "attachmentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastPathComponent");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("promise_uuid"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("promise_uuid"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v16 = (void *)MEMORY[0x24BDD17C8];
  -[DEDSeedingFinisher config](self, "config");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "seedingSubmissionType");
  v19 = "Unknown";
  if (v18 == 2)
    v19 = "FFU";
  if (v18 == 1)
    v20 = "FR";
  else
    v20 = v19;
  -[DEDSeedingFinisher config](self, "config");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%s-%ld-%@"), v20, objc_msgSend(v21, "seedingSubmissionID"), v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "identifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "directoryForBugSessionIdentifier:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "URLByAppendingPathComponent:", v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE2C9A0], "createDirectoryWithClassCDataProtection:", v25);
  v26 = objc_claimAutoreleasedReturnValue();
  if (!v26)
  {
    objc_msgSend(MEMORY[0x24BE2C9A0], "lsDir:", v8);
    v28 = objc_claimAutoreleasedReturnValue();
    if (!-[NSObject count](v28, "count"))
    {
      objc_msgSend(v8, "lastPathComponent");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "URLByAppendingPathComponent:", v34);
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v32 = v35;
      objc_msgSend(MEMORY[0x24BE2C9A0], "createDirectoryWithClassCDataProtection:", v35);
      v36 = objc_claimAutoreleasedReturnValue();
      if (v36)
      {
        v27 = (id)v36;
        -[DEDSeedingFinisher log](self, "log");
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          -[DEDSeedingFinisher prepareUpload:forSubmissionWithSession:metadata:].cold.6(v27);
        goto LABEL_63;
      }
      objc_msgSend(MEMORY[0x24BE2C978], "archiveDirectoryAt:", v35);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v43)
      {
        -[DEDSeedingFinisher log](self, "log");
        v65 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
LABEL_62:
          v27 = 0;
LABEL_63:
          v29 = 0;
          goto LABEL_64;
        }
LABEL_61:
        -[DEDSeedingFinisher prepareUpload:forSubmissionWithSession:metadata:].cold.1();
        goto LABEL_62;
      }

    }
    if ((unint64_t)-[NSObject count](v28, "count") >= 2)
    {
      objc_msgSend(v8, "lastPathComponent");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "URLByAppendingPathComponent:", v30);
      v31 = objc_claimAutoreleasedReturnValue();

      v32 = (__CFString *)v31;
      objc_msgSend(MEMORY[0x24BE2C9A0], "createDirectoryWithClassCDataProtection:", v31);
      v33 = objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        v27 = (id)v33;
        -[DEDSeedingFinisher log](self, "log");
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          -[DEDSeedingFinisher prepareUpload:forSubmissionWithSession:metadata:].cold.6(v27);
        v29 = 0;
        goto LABEL_64;
      }
      if ((objc_msgSend(MEMORY[0x24BE2C9A0], "copyAllFilesFromDir:toDir:", v8, v31) & 1) == 0)
      {
        -[DEDSeedingFinisher log](self, "log");
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          -[DEDSeedingFinisher prepareUpload:forSubmissionWithSession:metadata:].cold.5();

        v32 = (__CFString *)v31;
      }
      objc_msgSend(MEMORY[0x24BE2C978], "archiveDirectoryAt:", v32);
      v45 = objc_claimAutoreleasedReturnValue();
      if (v45)
      {
        v38 = v45;
        v64 = v32;
        -[NSObject lastPathComponent](v45, "lastPathComponent");
        v46 = objc_claimAutoreleasedReturnValue();
LABEL_41:

        v64 = (__CFString *)v46;
        goto LABEL_42;
      }
      -[DEDSeedingFinisher log](self, "log");
      v65 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        goto LABEL_62;
      goto LABEL_61;
    }
    if (-[NSObject count](v28, "count") != 1)
    {
      v64 = 0;
LABEL_42:
      objc_msgSend(v25, "URLByAppendingPathComponent:", CFSTR("__fileclerk.json"));
      v65 = objc_claimAutoreleasedReturnValue();
      v67 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v9, 0, &v67);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v67;
      if (v27)
      {
        -[DEDSeedingFinisher log](self, "log");
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          -[DEDSeedingFinisher prepareUpload:forSubmissionWithSession:metadata:].cold.4(v27);

      }
      objc_msgSend(v63, "writeToURL:atomically:", v65, 1);
      -[DEDSeedingFinisher archiveItemsInDirectory:](self, "archiveItemsInDirectory:", v25);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEDSeedingFinisher log](self, "log");
      v50 = objc_claimAutoreleasedReturnValue();
      v51 = v50;
      if (v49)
      {
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v49, "lastPathComponent");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v22;
          objc_msgSend(v8, "lastPathComponent");
          v52 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v70 = v59;
          v71 = 2114;
          v72 = v52;
          v53 = (void *)v52;
          _os_log_impl(&dword_21469E000, v51, OS_LOG_TYPE_INFO, "created upload file name [%{public}@] from directory [%{public}@]", buf, 0x16u);

          v22 = v61;
        }

        objc_msgSend(MEMORY[0x24BE2C9A0], "removeFile:", v8);
        if (v64)
          v54 = v64;
        else
          v54 = &stru_24D1E6AF0;
        +[DEDSeedingUploadItem itemAtPath:enclosedFilename:extensionID:](DEDSeedingUploadItem, "itemAtPath:enclosedFilename:extensionID:", v49, v54, v66);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          -[DEDSeedingFinisher prepareUpload:forSubmissionWithSession:metadata:].cold.1();

        v29 = 0;
      }

      goto LABEL_57;
    }
    -[NSObject objectAtIndexedSubscript:](v28, "objectAtIndexedSubscript:", 0);
    v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v68 = 0;
    -[__CFString getResourceValue:forKey:error:](v37, "getResourceValue:forKey:error:", &v68, *MEMORY[0x24BDBCC60], 0);
    v38 = v68;
    v64 = v37;
    if (-[NSObject BOOLValue](v38, "BOOLValue"))
    {
      v65 = v38;
      -[__CFString lastPathComponent](v37, "lastPathComponent");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "URLByAppendingPathComponent:", v39);
      v40 = objc_claimAutoreleasedReturnValue();

      v41 = (void *)v40;
      objc_msgSend(MEMORY[0x24BE2C9A0], "createDirectoryWithClassCDataProtection:", v40);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      v60 = v41;
      if (v27)
      {
        -[DEDSeedingFinisher log](self, "log");
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          -[DEDSeedingFinisher prepareUpload:forSubmissionWithSession:metadata:].cold.6(v27);
LABEL_29:

        v29 = 0;
LABEL_57:
        v32 = v64;
LABEL_64:

        goto LABEL_65;
      }
      if ((objc_msgSend(MEMORY[0x24BE2C9A0], "copyAllFilesFromDir:toDir:", v64, v41) & 1) == 0)
      {
        -[DEDSeedingFinisher log](self, "log");
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          -[DEDSeedingFinisher prepareUpload:forSubmissionWithSession:metadata:].cold.5();

        v41 = v60;
      }
      objc_msgSend(MEMORY[0x24BE2C978], "archiveDirectoryAt:", v41);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v57)
      {
        -[DEDSeedingFinisher log](self, "log");
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          -[DEDSeedingFinisher prepareUpload:forSubmissionWithSession:metadata:].cold.1();
        goto LABEL_29;
      }
      v58 = v57;
      objc_msgSend(v57, "lastPathComponent");
      v62 = objc_claimAutoreleasedReturnValue();

      v38 = v65;
      v47 = v60;
    }
    else
    {
      v47 = (void *)objc_msgSend(MEMORY[0x24BE2C9A0], "copyAndReturn:toDir:", v37, v25);
      objc_msgSend(v47, "lastPathComponent");
      v62 = objc_claimAutoreleasedReturnValue();
    }

    v46 = v62;
    goto LABEL_41;
  }
  v27 = (id)v26;
  -[DEDSeedingFinisher log](self, "log");
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    -[DEDSeedingFinisher prepareUpload:forSubmissionWithSession:metadata:].cold.6(v27);
  v29 = 0;
LABEL_65:

  return v29;
}

- (id)archiveItemsInDirectory:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DEDSeedingFinisher log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[DEDSeedingFinisher archiveItemsInDirectory:].cold.2(v4, v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2C970]), "initWithURL:", v4);
  if (v6)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v19 = v4;
    objc_msgSend(MEMORY[0x24BE2C9A0], "lsDir:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v12, "lastPathComponent");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v6, "addFile:withPathName:", v12, v13) & 1) == 0)
          {
            -[DEDSeedingFinisher log](self, "log");
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v6, "tarGzUrl");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v25 = v12;
              v26 = 2114;
              v27 = v13;
              v28 = 2114;
              v29 = v15;
              _os_log_error_impl(&dword_21469E000, v14, OS_LOG_TYPE_ERROR, "failed to add [%{public}@] with path name [%{public}@] to [%{public}@]", buf, 0x20u);

            }
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
      }
      while (v9);
    }

    objc_msgSend(v6, "closeArchive");
    v4 = v19;
    objc_msgSend(MEMORY[0x24BE2C9A0], "removeFile:", v19);
    objc_msgSend(v6, "tarGzUrl");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[DEDSeedingFinisher log](self, "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[DEDSeedingFinisher archiveItemsInDirectory:].cold.1();

    v16 = 0;
  }

  return v16;
}

- (void)save
{
  id v2;

  -[DEDSeedingFinisher session](self, "session");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "save");

}

- (id)attachmentHandler
{
  return objc_alloc_init(DEDAttachmentHandler);
}

- (id)uploadItemForTask:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[DEDSeedingFinisher uploads](self, "uploads");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __40__DEDSeedingFinisher_uploadItemForTask___block_invoke;
  v9[3] = &unk_24D1E4980;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "ded_findWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __40__DEDSeedingFinisher_uploadItemForTask___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uploadTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (DEDBugSessionConfiguration)config
{
  return (DEDBugSessionConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableSet)uploads
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUploads:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (int64_t)totalUploadSize
{
  return self->_totalUploadSize;
}

- (void)setTotalUploadSize:(int64_t)a3
{
  self->_totalUploadSize = a3;
}

- (int64_t)lastUploadPercentageReported
{
  return self->_lastUploadPercentageReported;
}

- (void)setLastUploadPercentageReported:(int64_t)a3
{
  self->_lastUploadPercentageReported = a3;
}

- (int64_t)bytesUploadedFromAllFiles
{
  return self->_bytesUploadedFromAllFiles;
}

- (void)setBytesUploadedFromAllFiles:(int64_t)a3
{
  self->_bytesUploadedFromAllFiles = a3;
}

- (int)uploadProgressCounter
{
  return self->_uploadProgressCounter;
}

- (void)setUploadProgressCounter:(int)a3
{
  self->_uploadProgressCounter = a3;
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (DEDBugSession)session
{
  return (DEDBugSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (void)setSession:(id)a3
{
  objc_storeWeak((id *)&self->_session, a3);
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (BOOL)isPreparing
{
  return self->_isPreparing;
}

- (void)setIsPreparing:(BOOL)a3
{
  self->_isPreparing = a3;
}

- (DEDSeedingClient)client
{
  return (DEDSeedingClient *)objc_getProperty(self, a2, 80, 1);
}

- (void)setClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSMutableDictionary)promises
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPromises:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promises, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_uploads, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

void __33__DEDSeedingFinisher_isUploading__block_invoke_cold_1(id *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a2, "taskIdentifier");
  objc_msgSend(a2, "progress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fractionCompleted");
  v10 = 138543874;
  v11 = v6;
  v12 = 2048;
  v13 = v7;
  v14 = 2048;
  v15 = v9 * 100.0;
  _os_log_debug_impl(&dword_21469E000, a3, OS_LOG_TYPE_DEBUG, "isUploading? | [%{public}@] found upload task [%lu] completion [%.2f%%]", (uint8_t *)&v10, 0x20u);

}

void __54__DEDSeedingFinisher_finishSession_withConfiguration___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "did signal uploading but found no promise for DE identifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)didCollectAttachmentGroup:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "didCollect group but group has no DE identifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)didCancelCollectionOnExtension:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "did cancel collection but found no promise for DE identifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)uploadTask:didCompleteWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_21469E000, v0, v1, "finished upload but found no promise for  [%{public}@]", v2);
  OUTLINED_FUNCTION_1();
}

- (void)uploadTask:(void *)a1 didCompleteWithError:.cold.2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "taskIdentifier");
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_21469E000, v1, v2, "Upload Task: [%lu] error: %{public}@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1_2();
}

- (void)uploadTask:(void *)a1 didSendBytes:(void *)a2 totalBytesExpectedToSend:.cold.1(void *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(a1, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "taskIdentifier");
  OUTLINED_FUNCTION_2_0(&dword_21469E000, v5, v6, "[%{public}@] No Upload Item for task: [%lu]", v7, v8, v9, v10, 2u);

}

- (void)shouldReportProgress
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_21469E000, v0, OS_LOG_TYPE_DEBUG, "totalUploadSize is zero, will not send progress updates", v1, 2u);
  OUTLINED_FUNCTION_2_3();
}

- (void)prepareUpload:forSubmissionWithSession:metadata:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "archiveDirectoryAt error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)prepareUpload:(void *)a1 forSubmissionWithSession:metadata:.cold.4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_21469E000, v2, v3, "Error serializing filer token: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_2();
}

- (void)prepareUpload:forSubmissionWithSession:metadata:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "copyallFiles error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)prepareUpload:(void *)a1 forSubmissionWithSession:metadata:.cold.6(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_21469E000, v2, v3, "prepare upload error [%{public}@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_2();
}

- (void)prepareUpload:forSubmissionWithSession:metadata:.cold.12()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_9_0(&dword_21469E000, v0, v1, "_preparing upload for %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)archiveItemsInDirectory:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_21469E000, v0, v1, "Failed to initialize archive at [%{public}@]", v2);
  OUTLINED_FUNCTION_1();
}

- (void)archiveItemsInDirectory:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_9_0(&dword_21469E000, a2, v4, "archiveItemsInDirectory [%{public}@]", v5);

  OUTLINED_FUNCTION_1_2();
}

@end
