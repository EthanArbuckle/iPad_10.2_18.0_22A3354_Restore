@implementation BMFileServer

- (BOOL)entitledToAccessClientCompute:(id)a3 error:(id *)a4
{
  id v5;
  BMProcess *v6;
  BMProcess *v7;
  NSObject *v8;
  char v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[8];
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v6 = (BMProcess *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    -[NSXPCConnection bm_accessControlPolicy](v6);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = -[NSObject allowsAccessToClientCompute:](v8, "allowsAccessToClientCompute:", v5);
    v10 = v9;
    if (a4 && (v9 & 1) == 0)
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      -[NSXPCConnection bm_process](v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "executableName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("'%@' is not entitled to access compute as '%@'"), v13, v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)MEMORY[0x1E0CB35C8];
      v19 = *MEMORY[0x1E0CB2D50];
      v20[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 5, v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    __biome_log_for_category(6);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AEB31000, v8, OS_LOG_TYPE_DEFAULT, "Connection invalidated before entitlement check, denying request", buf, 2u);
    }
    v10 = 0;
  }

  return v10;
}

- (void)replaceFileAtPath:(id)a3 withFileHandle:(id)a4 protection:(int)a5 reply:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD, void *);
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  BOOL v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int64_t v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  BMFileManager *fileManager;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  id v67;
  int v68;
  uint64_t v69;
  id v70;
  void *v71;
  void *v72;
  uint64_t v73;
  const __CFString *v74;
  uint64_t v75;
  const __CFString *v76;
  uint64_t v77;
  const __CFString *v78;
  uint64_t v79;
  const __CFString *v80;
  uint64_t v81;
  const __CFString *v82;
  uint64_t v83;
  const __CFString *v84;
  uint64_t v85;
  const __CFString *v86;
  uint8_t buf[4];
  id v88;
  uint64_t v89;
  _QWORD v90[3];

  v90[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD, void *))a6;
  BMFileServerValidateAndParsePath(v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[NSString stringByAppendingPathComponent:](self->_directory, "stringByAppendingPathComponent:", v10);
    v69 = objc_claimAutoreleasedReturnValue();
    __biome_log_for_category(6);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v88 = v10;
      _os_log_impl(&dword_1AEB31000, v14, OS_LOG_TYPE_INFO, "-replaceFileAtPath:withFileHandle:protection:reply: called with subpath: %{public}@", buf, 0xCu);
    }

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("pathType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqual:", CFSTR("streams"));

    if (v16)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("subscriptions"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v18 = (void *)MEMORY[0x1E0CB35C8];
        v85 = *MEMORY[0x1E0CB2D50];
        v86 = CFSTR("Client processes not allowed read-write access to subscriptions substream");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        v20 = v18;
        v21 = 5;
LABEL_38:
        objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), v21, v19);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v12[2](v12, 0, v53);

        goto LABEL_41;
      }
      v68 = a5;
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("stream"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = 0;
      v28 = -[BMFileServer entitledToAccessStream:withMode:error:](self, "entitledToAccessStream:withMode:error:", v27, 2, &v72);
      v29 = v72;
LABEL_20:
      v19 = v29;

      if (v28)
        goto LABEL_21;
LABEL_26:
      v12[2](v12, 0, v19);
LABEL_41:
      v24 = (void *)v69;
      goto LABEL_42;
    }
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("pathType"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isEqual:", CFSTR("compute"));

    if (v26)
    {
      v68 = a5;
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("clientIdentifier"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = 0;
      v28 = -[BMFileServer entitledToAccessClientCompute:error:](self, "entitledToAccessClientCompute:error:", v27, &v71);
      v29 = v71;
      goto LABEL_20;
    }
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("pathType"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "isEqual:", CFSTR("sharedSync"));

    if (!v31)
    {
      v52 = (void *)MEMORY[0x1E0CB35C8];
      v83 = *MEMORY[0x1E0CB2D50];
      v84 = CFSTR("Invalid request");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = v52;
      v21 = 3;
      goto LABEL_38;
    }
    v68 = a5;
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("stream"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = 0;
    v33 = -[BMFileServer entitledToAccessStream:withMode:error:](self, "entitledToAccessStream:withMode:error:", v32, 2, &v70);
    v19 = v70;

    if (!v33)
      goto LABEL_26;
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("deviceType"));
    v34 = objc_claimAutoreleasedReturnValue();
    +[BMStoreDirectory remoteDevices](BMStoreDirectory, "remoteDevices");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[NSObject isEqual:](v34, "isEqual:", v35) & 1) != 0)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("segment"));
      v66 = v34;
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v68 == 6 || !v36)
      {
LABEL_21:
        v67 = v11;
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("streamType"), v10);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v37, "unsignedIntegerValue") == 1)
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("stream"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = +[BMPublicStreamUtilities streamForStreamIdentifier:](BMPublicStreamUtilities, "streamForStreamIdentifier:", v38);

          if (!v39)
          {
            __biome_log_for_category(6);
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              -[BMFileServer fileHandleForFileAtPath:flags:protection:reply:].cold.2((uint64_t)v13, (uint64_t)CFSTR("stream"), v40);

            v41 = (void *)MEMORY[0x1E0CB35C8];
            v81 = *MEMORY[0x1E0CB2D50];
            v82 = CFSTR("Invalid stream identifier");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 2, v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v12[2](v12, 0, v43);

            v10 = v65;
            v11 = v67;
            goto LABEL_41;
          }
        }
        else
        {

        }
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("pathType"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v65;
        if (objc_msgSend(v44, "isEqual:", CFSTR("streams")))
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("metadata"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          +[BMStoreDirectory metadata](BMStoreDirectory, "metadata");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v45, "isEqual:", v46))
          {
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("segment"));
            v59 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v59)
            {
              v60 = (void *)MEMORY[0x1E0CB35C8];
              v79 = *MEMORY[0x1E0CB2D50];
              v80 = CFSTR("Invalid file");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              v56 = v60;
              v57 = 5;
              goto LABEL_40;
            }
LABEL_32:
            if ((v68 + 1) < 9)
            {
              fileManager = self->_fileManager;
              v11 = v67;
              if (fileManager)
              {
                v24 = (void *)v69;
                -[BMFileManager replaceFileAtPath:withFileHandle:protection:error:](fileManager, "replaceFileAtPath:withFileHandle:protection:error:", v69, v67);
                v48 = objc_claimAutoreleasedReturnValue();
                v49 = (uint64_t)v19;

                if (!(v48 | v49))
                {
                  v50 = (void *)MEMORY[0x1E0CB35C8];
                  v73 = *MEMORY[0x1E0CB2D50];
                  v74 = CFSTR("Unspecified failure");
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  v11 = v67;
                  objc_msgSend(v50, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 0, v51);
                  v49 = objc_claimAutoreleasedReturnValue();

                }
                v12[2](v12, v48, (void *)v49);

                v19 = (id)v49;
              }
              else
              {
                __biome_log_for_category(6);
                v61 = objc_claimAutoreleasedReturnValue();
                v24 = (void *)v69;
                if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                  -[BMFileServer fileHandleForFileAtPath:flags:protection:reply:].cold.3();

                v62 = (void *)MEMORY[0x1E0CB35C8];
                v75 = *MEMORY[0x1E0CB2D50];
                v76 = CFSTR("Internal failure");
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v62, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 0, v63);
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                v12[2](v12, 0, v64);

                v11 = v67;
              }
              goto LABEL_42;
            }
            v54 = (void *)MEMORY[0x1E0CB35C8];
            v77 = *MEMORY[0x1E0CB2D50];
            v78 = CFSTR("Invalid protection class");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = v54;
            v57 = 2;
LABEL_40:
            objc_msgSend(v56, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), v57, v55);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v12[2](v12, 0, v58);

            v11 = v67;
            goto LABEL_41;
          }

        }
        goto LABEL_32;
      }
      __biome_log_for_category(6);
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
        -[BMFileServer fileHandleForFileAtPath:flags:protection:reply:].cold.4();
    }
    else
    {

    }
    goto LABEL_21;
  }
  __biome_log_for_category(6);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    -[BMFileServer replaceFileAtPath:withFileHandle:protection:reply:].cold.1();

  v23 = (void *)MEMORY[0x1E0CB35C8];
  v89 = *MEMORY[0x1E0CB2D50];
  v90[0] = CFSTR("Invalid path");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, &v89, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 2, v24);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v12[2](v12, 0, v19);
LABEL_42:

}

- (void)fileHandleForFileAtPath:(id)a3 flags:(int)a4 protection:(int)a5 reply:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  void (**v11)(id, _QWORD, void *);
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString **v28;
  uint64_t *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  BOOL v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  BOOL v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  void *v55;
  void *v56;
  const __CFString **v57;
  uint64_t *v58;
  void *v59;
  void *v60;
  void *v61;
  int64_t v62;
  NSObject *v63;
  BMFileManager *fileManager;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  uint64_t v71;
  unsigned int v72;
  NSObject *v73;
  id v74;
  id v75;
  id v76;
  NSObject *v77;
  NSObject *v78;
  id v79;
  uint64_t v80;
  const __CFString *v81;
  uint64_t v82;
  const __CFString *v83;
  uint64_t v84;
  const __CFString *v85;
  uint64_t v86;
  const __CFString *v87;
  uint64_t v88;
  const __CFString *v89;
  uint64_t v90;
  const __CFString *v91;
  uint64_t v92;
  const __CFString *v93;
  uint64_t v94;
  const __CFString *v95;
  uint64_t v96;
  NSObject *v97;
  uint8_t buf[4];
  id v99;
  uint64_t v100;
  _QWORD v101[3];

  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v101[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void (**)(id, _QWORD, void *))a6;
  BMFileServerValidateAndParsePath(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    __biome_log_for_category(6);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[BMFileServer fileHandleForFileAtPath:flags:protection:reply:].cold.1();

    v25 = (void *)MEMORY[0x1E0CB35C8];
    v100 = *MEMORY[0x1E0CB2D50];
    v101[0] = CFSTR("Invalid path");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v101, &v100, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 2, v13);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  -[NSString stringByAppendingPathComponent:](self->_directory, "stringByAppendingPathComponent:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  __biome_log_for_category(6);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v99 = v10;
    _os_log_impl(&dword_1AEB31000, v14, OS_LOG_TYPE_INFO, "-fileHandleForFileAtPath:flags:protection:reply: called with subpath: %{public}@", buf, 0xCu);
  }

  if ((v8 & 0x9EEF7CFD) != 0 || (v8 & 0x40100000) == 0x40000000)
  {
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v96 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid flags: %#X"), v8);
    v17 = objc_claimAutoreleasedReturnValue();
    v97 = v17;
    v27 = (void *)MEMORY[0x1E0C99D80];
    v28 = (const __CFString **)&v97;
    v29 = &v96;
LABEL_17:
    objc_msgSend(v27, "dictionaryWithObjects:forKeys:count:", v28, v29, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v26;
    v32 = 2;
LABEL_18:
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), v32, v30);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v33);

    goto LABEL_59;
  }
  if ((v7 + 1) >= 9)
  {
    v34 = (void *)MEMORY[0x1E0CB35C8];
    v94 = *MEMORY[0x1E0CB2D50];
    v95 = CFSTR("Invalid protection class");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1);
    v17 = objc_claimAutoreleasedReturnValue();
    v35 = v34;
    v36 = 2;
    goto LABEL_20;
  }
  v72 = v8 & 0xDEFFFEFF | 0x21000000;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("pathType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqual:", CFSTR("streams"));

  if (!v16)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("pathType"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "isEqual:", CFSTR("compute"));

    if (v39)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("clientIdentifier"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = 0;
      v41 = -[BMFileServer entitledToAccessClientCompute:error:](self, "entitledToAccessClientCompute:error:", v40, &v76);
      v17 = v76;

      if (v41)
        goto LABEL_49;
LABEL_15:
      v11[2](v11, 0, v17);
      goto LABEL_59;
    }
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("pathType"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "isEqual:", CFSTR("sharedSync"));

    if (v45)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("stream"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (v46)
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("stream"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = 0;
        v48 = -[BMFileServer entitledToAccessStream:withMode:error:](self, "entitledToAccessStream:withMode:error:", v47, v72, &v75);
        v17 = v75;

        if (!v48)
          goto LABEL_15;
LABEL_28:
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("deviceType"));
        v49 = objc_claimAutoreleasedReturnValue();
        +[BMStoreDirectory remoteDevices](BMStoreDirectory, "remoteDevices");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if ((-[NSObject isEqual:](v49, "isEqual:", v50) & 1) != 0)
        {
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("segment"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          if ((_DWORD)v7 == 6 || !v51)
            goto LABEL_49;
          __biome_log_for_category(6);
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
            -[BMFileServer fileHandleForFileAtPath:flags:protection:reply:].cold.4();
        }
        else
        {

        }
        goto LABEL_48;
      }
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("generation"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v59)
      {
        v74 = 0;
        v71 = -[BMFileServer entitledToAccessSharedSyncWithError:](self, "entitledToAccessSharedSyncWithError:", &v74);
        v17 = v74;
        if ((v71 & 1) == 0)
          goto LABEL_15;
        goto LABEL_28;
      }
      if (-[BMFileServer isBiomeSyncDaemon](self, "isBiomeSyncDaemon"))
      {
        if ((v8 & 3) == 0)
        {
          v17 = 0;
          goto LABEL_28;
        }
        v55 = (void *)MEMORY[0x1E0CB35C8];
        v88 = *MEMORY[0x1E0CB2D50];
        v89 = CFSTR("Write access denied");
        v56 = (void *)MEMORY[0x1E0C99D80];
        v57 = &v89;
        v58 = &v88;
      }
      else
      {
        v55 = (void *)MEMORY[0x1E0CB35C8];
        v90 = *MEMORY[0x1E0CB2D50];
        v91 = CFSTR("Access denied");
        v56 = (void *)MEMORY[0x1E0C99D80];
        v57 = &v91;
        v58 = &v90;
      }
    }
    else
    {
      v55 = (void *)MEMORY[0x1E0CB35C8];
      v86 = *MEMORY[0x1E0CB2D50];
      v87 = CFSTR("Invalid request");
      v56 = (void *)MEMORY[0x1E0C99D80];
      v57 = &v87;
      v58 = &v86;
    }
    objc_msgSend(v56, "dictionaryWithObjects:forKeys:count:", v57, v58, 1);
    v17 = objc_claimAutoreleasedReturnValue();
    v35 = v55;
    v36 = 5;
LABEL_20:
    objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), v36, v17);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v37);

    goto LABEL_59;
  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("stream"));
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("streamType"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "unsignedIntegerValue");

  if (self->_domain != BMServiceDomainForStream(v19, v17))
  {
    v42 = (void *)MEMORY[0x1E0CB35C8];
    v92 = *MEMORY[0x1E0CB2D50];
    v93 = CFSTR("Wrong domain");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
    v22 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 3, v22);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v43);

LABEL_42:
    goto LABEL_59;
  }
  -[BMFileServer currentUseCase](self, "currentUseCase");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "isEqual:", CFSTR("__writer__")))
  {
    v79 = 0;
    v21 = -[BMFileServer entitledToAccessStream:withMode:error:](self, "entitledToAccessStream:withMode:error:", v17, 2, &v79);
    v22 = v79;

    if (!v21)
    {
LABEL_41:
      v11[2](v11, 0, v22);
      goto LABEL_42;
    }
    v23 = v22;
  }
  else
  {

    v23 = 0;
  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("subscriptions"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    v78 = v23;
    LOBYTE(v53) = -[BMFileServer entitledToAccessStream:withMode:error:](self, "entitledToAccessStream:withMode:error:", v17, 2, &v78);
    v54 = v78;
  }
  else
  {
    v77 = v23;
    v53 = -[BMFileServer entitledToAccessStream:withMode:error:](self, "entitledToAccessStream:withMode:error:", v17, v72, &v77);
    v54 = v77;
  }
  v22 = v54;

  if ((v53 & 1) == 0)
    goto LABEL_41;
  v49 = v17;
  v17 = v22;
LABEL_48:

LABEL_49:
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("streamType"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v60, "unsignedIntegerValue") == 1)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = +[BMPublicStreamUtilities streamForStreamIdentifier:](BMPublicStreamUtilities, "streamForStreamIdentifier:", v61);

    if (!v62)
    {
      __biome_log_for_category(6);
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        -[BMFileServer fileHandleForFileAtPath:flags:protection:reply:].cold.2((uint64_t)v12, (uint64_t)CFSTR("stream"), v63);

      v26 = (void *)MEMORY[0x1E0CB35C8];
      v84 = *MEMORY[0x1E0CB2D50];
      v85 = CFSTR("Invalid stream identifier");
      v27 = (void *)MEMORY[0x1E0C99D80];
      v28 = &v85;
      v29 = &v84;
      goto LABEL_17;
    }
  }
  else
  {

  }
  fileManager = self->_fileManager;
  if (!fileManager)
  {
    __biome_log_for_category(6);
    v69 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
      -[BMFileServer fileHandleForFileAtPath:flags:protection:reply:].cold.3();

    v70 = (void *)MEMORY[0x1E0CB35C8];
    v82 = *MEMORY[0x1E0CB2D50];
    v83 = CFSTR("Internal failure");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v70;
    v32 = 0;
    goto LABEL_18;
  }
  v73 = v17;
  -[BMFileManager fileHandleForFileAtPath:flags:protection:error:](fileManager, "fileHandleForFileAtPath:flags:protection:error:", v13, v72, v7, &v73);
  v65 = objc_claimAutoreleasedReturnValue();
  v66 = v73;

  if (!(v65 | v66))
  {
    v67 = (void *)MEMORY[0x1E0CB35C8];
    v80 = *MEMORY[0x1E0CB2D50];
    v81 = CFSTR("Unspecified failure");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 0, v68);
    v66 = objc_claimAutoreleasedReturnValue();

  }
  v11[2](v11, v65, (void *)v66);

  v17 = v66;
LABEL_59:

}

- (BOOL)entitledToAccessStream:(id)a3 withMode:(int)a4 error:(id *)a5
{
  __int16 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  BOOL v13;
  unint64_t v15;
  BMResourceSpecifier *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  uint8_t buf[8];
  _QWORD v38[2];
  _QWORD v39[2];
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  _QWORD v45[2];

  v6 = a4;
  v45[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    __biome_log_for_category(6);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AEB31000, v12, OS_LOG_TYPE_DEFAULT, "Connection invalidated before entitlement check, denying request", buf, 2u);
    }
    v13 = 0;
    goto LABEL_29;
  }
  if ((v6 & 1 | 2) == 2 || v6 < 0)
  {
    -[NSXPCConnection bm_accessControlPolicy](v9);
    v12 = objc_claimAutoreleasedReturnValue();
    if (v6 < 0 || (v6 & 3) == 0)
      v15 = 1;
    else
      v15 = 3;
    v16 = -[BMResourceSpecifier initWithType:name:]([BMResourceSpecifier alloc], "initWithType:name:", 1, v8);
    if (v16)
    {
      if ((-[NSObject allowsAccessToResource:withMode:](v12, "allowsAccessToResource:withMode:", v16, v15) & 1) != 0)
      {
        if ((objc_msgSend(v8, "isEqual:", CFSTR("GenerativeExperiences.TransparencyLog")) & 1) == 0
          && !objc_msgSend(v8, "isEqual:", CFSTR("PrivateCloudCompute.RequestLog")))
        {
          goto LABEL_17;
        }
        -[BMFileServer currentUseCase](self, "currentUseCase");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqual:", CFSTR("__pruner__"));

        if ((v18 & 1) != 0)
          goto LABEL_17;
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.AppleIntelligenceReport"));
        objc_msgSend(v19, "valueForKey:", CFSTR("reportDuration"));
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = (void *)v29;
        v31 = &unk_1E5E48BE8;
        if (v29)
          v31 = (void *)v29;
        v32 = v31;

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v32, "doubleValue");
          if (v33 != 0.0)
          {

LABEL_17:
            v13 = 1;
LABEL_28:

            goto LABEL_29;
          }
        }
        if (a5)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Stream '%@' is not enabled"), v8);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = (void *)MEMORY[0x1E0CB35C8];
          v38[0] = *MEMORY[0x1E0CB2D50];
          v38[1] = CFSTR("UserControlled");
          v39[0] = v34;
          v39[1] = MEMORY[0x1E0C9AAB0];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 5, v35);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_26;
      }
      if (a5)
      {
        v24 = (void *)MEMORY[0x1E0CB3940];
        -[NSObject descriptionOfProcessAndUseCase](v12, "descriptionOfProcessAndUseCase");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        BMAccessModePrintableDescription(v15);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringWithFormat:", CFSTR("%@ is not entitled for '%@' access to '%@'"), v25, v26, v8);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = (void *)MEMORY[0x1E0CB35C8];
        v40 = *MEMORY[0x1E0CB2D50];
        v41 = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v27;
        v23 = 5;
        goto LABEL_25;
      }
    }
    else if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid stream identifier '%@'"), v8);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v42 = *MEMORY[0x1E0CB2D50];
      v43 = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v20;
      v23 = 7;
LABEL_25:
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), v23, v21);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_26:
    }
    v13 = 0;
    goto LABEL_28;
  }
  if (!a5)
  {
    v13 = 0;
    goto LABEL_30;
  }
  v11 = (void *)MEMORY[0x1E0CB35C8];
  v44 = *MEMORY[0x1E0CB2D50];
  v45[0] = CFSTR("Invalid access mode");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 7, v12);
  v13 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

LABEL_30:
  return v13;
}

- (id)currentUseCase
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection bm_accessControlPolicy](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "useCase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)temporaryFileHandleWithProtection:(int)a3 reply:(id)a4
{
  uint64_t v4;
  void (**v6)(id, _QWORD, uint64_t);
  NSObject *v7;
  BMFileManager *fileManager;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint8_t buf[8];
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  _QWORD v25[2];

  v4 = *(_QWORD *)&a3;
  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD, uint64_t))a4;
  __biome_log_for_category(6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEB31000, v7, OS_LOG_TYPE_INFO, "-temporaryFileHandleWithProtection:reply: called", buf, 2u);
  }

  if ((v4 + 1) >= 9)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2D50];
    v25[0] = CFSTR("Invalid protection class");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v10 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = 2;
LABEL_12:
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), v15, v10);
    v9 = objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v9);
    goto LABEL_13;
  }
  fileManager = self->_fileManager;
  if (!fileManager)
  {
    __biome_log_for_category(6);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[BMFileServer fileHandleForFileAtPath:flags:protection:reply:].cold.3();

    v17 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2D50];
    v23 = CFSTR("Internal failure");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v10 = objc_claimAutoreleasedReturnValue();
    v14 = v17;
    v15 = 0;
    goto LABEL_12;
  }
  v18 = 0;
  -[BMFileManager temporaryFileHandleWithProtection:error:](fileManager, "temporaryFileHandleWithProtection:error:", v4, &v18);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (uint64_t)v18;
  if (!(v9 | v10))
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2D50];
    v21 = CFSTR("Unspecified failure");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 0, v12);
    v10 = objc_claimAutoreleasedReturnValue();

  }
  v6[2](v6, v9, v10);
LABEL_13:

}

- (BMFileServer)initWithDirectory:(id)a3
{
  id v4;
  BMFileServer *v5;
  NSObject *v6;
  uint64_t v7;
  NSString *directory;
  uint64_t v9;
  BMFileManager *fileManager;
  objc_super v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BMFileServer;
  v5 = -[BMFileServer init](&v12, sel_init);
  if (v5)
  {
    __biome_log_for_category(6);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl(&dword_1AEB31000, v6, OS_LOG_TYPE_DEFAULT, "BMFileServer in %@", buf, 0xCu);
    }

    v7 = objc_msgSend(v4, "copy");
    directory = v5->_directory;
    v5->_directory = (NSString *)v7;

    +[BMFileManager fileManagerWithDirectAccessToDirectory:cachingOptions:](BMFileManager, "fileManagerWithDirectAccessToDirectory:cachingOptions:", v4, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    fileManager = v5->_fileManager;
    v5->_fileManager = (BMFileManager *)v9;

    +[BMPaths getServiceDomain:subpath:forPath:](BMPaths, "getServiceDomain:subpath:forPath:", &v5->_domain, 0, v4);
  }

  return v5;
}

- (BOOL)entitledToAccessSharedSyncWithError:(id *)a3
{
  BMProcess *v4;
  BMProcess *v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[8];
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v4 = (BMProcess *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    __biome_log_for_category(6);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AEB31000, v6, OS_LOG_TYPE_DEFAULT, "Connection invalidated before entitlement check, denying request", buf, 2u);
    }
    goto LABEL_12;
  }
  -[NSXPCConnection bm_accessControlPolicy](v4);
  v6 = objc_claimAutoreleasedReturnValue();
  -[NSObject process](v6, "process");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "BOOLForEntitlement:", CFSTR("com.apple.private.biome.sync")))
  {

    v8 = 1;
    goto LABEL_13;
  }
  if (os_variant_allows_internal_security_policies())
  {
    -[NSObject process](v6, "process");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "BOOLForEntitlement:", CFSTR("com.apple.internal.biome.sync"));

  }
  else
  {
    v8 = 0;
  }

  if (a3 && (v8 & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    -[NSXPCConnection bm_process](v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "executableName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("'%@' is missing entitlement 'com.apple.private.biome.sync'"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2D50];
    v19[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 5, v15);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

LABEL_12:
    v8 = 0;
  }
LABEL_13:

  return v8;
}

- (BOOL)isBiomeSyncDaemon
{
  BMProcess *v2;
  BMProcess *v3;
  void *v4;
  BOOL v5;
  NSObject *v6;
  uint8_t v8[16];

  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v2 = (BMProcess *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    -[NSXPCConnection bm_process](v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "processType") == 3;

  }
  else
  {
    __biome_log_for_category(6);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1AEB31000, v6, OS_LOG_TYPE_DEFAULT, "Connection invalidated before entitlement check, denying request", v8, 2u);
    }

    v5 = 0;
  }

  return v5;
}

- (void)createDirectoryAtPath:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  BOOL v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  BMFileManager *fileManager;
  BOOL v32;
  id v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  const __CFString *v46;
  uint64_t v47;
  const __CFString *v48;
  uint64_t v49;
  const __CFString *v50;
  uint64_t v51;
  const __CFString *v52;
  uint8_t buf[4];
  id v54;
  uint64_t v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  BMFileServerValidateAndParsePath(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    __biome_log_for_category(6);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[BMFileServer createDirectoryAtPath:reply:].cold.1();

    v17 = (void *)MEMORY[0x1E0CB35C8];
    v55 = *MEMORY[0x1E0CB2D50];
    v56[0] = CFSTR("Invalid path");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 2, v9);
    v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:
    v7[2](v7, v18);
    goto LABEL_20;
  }
  -[NSString stringByAppendingPathComponent:](self->_directory, "stringByAppendingPathComponent:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __biome_log_for_category(6);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v54 = v6;
    _os_log_impl(&dword_1AEB31000, v10, OS_LOG_TYPE_INFO, "-createDirectoryAtPath:reply: called with subpath: %{public}@", buf, 0xCu);
  }

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pathType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", CFSTR("streams"));

  if (v12)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("stream"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    v14 = -[BMFileServer entitledToAccessStream:withMode:error:](self, "entitledToAccessStream:withMode:error:", v13, 0, &v44);
    v15 = v44;
  }
  else
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pathType"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqual:", CFSTR("compute"));

    if (v20)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("clientIdentifier"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 0;
      v14 = -[BMFileServer entitledToAccessClientCompute:error:](self, "entitledToAccessClientCompute:error:", v13, &v43);
      v15 = v43;
    }
    else
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pathType"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqual:", CFSTR("sharedSync"));

      if (!v22)
      {
        v39 = (void *)MEMORY[0x1E0CB35C8];
        v51 = *MEMORY[0x1E0CB2D50];
        v52 = CFSTR("Invalid request");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
        v18 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 3, v18);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, v40);

        goto LABEL_20;
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("stream"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0;
      v14 = -[BMFileServer entitledToAccessStream:withMode:error:](self, "entitledToAccessStream:withMode:error:", v13, 0, &v42);
      v15 = v42;
    }
  }
  v18 = v15;

  if (!v14)
    goto LABEL_19;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("streamType"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "unsignedIntegerValue") == 1)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("stream"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = +[BMPublicStreamUtilities streamForStreamIdentifier:](BMPublicStreamUtilities, "streamForStreamIdentifier:", v24);

    if (!v25)
    {
      __biome_log_for_category(6);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[BMFileServer fileHandleForFileAtPath:flags:protection:reply:].cold.2((uint64_t)v8, (uint64_t)CFSTR("stream"), v26);

      v27 = (void *)MEMORY[0x1E0CB35C8];
      v49 = *MEMORY[0x1E0CB2D50];
      v50 = CFSTR("Invalid stream identifier");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v27;
      v30 = 2;
LABEL_30:
      objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), v30, v28);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v38);

      goto LABEL_20;
    }
  }
  else
  {

  }
  fileManager = self->_fileManager;
  if (!fileManager)
  {
    __biome_log_for_category(6);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      -[BMFileServer fileHandleForFileAtPath:flags:protection:reply:].cold.3();

    v37 = (void *)MEMORY[0x1E0CB35C8];
    v47 = *MEMORY[0x1E0CB2D50];
    v48 = CFSTR("Internal failure");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v37;
    v30 = 0;
    goto LABEL_30;
  }
  v41 = v18;
  v32 = -[BMFileManager createDirectoryAtPath:error:](fileManager, "createDirectoryAtPath:error:", v9, &v41);
  v33 = v41;

  if (!v32 && !v33)
  {
    v34 = (void *)MEMORY[0x1E0CB35C8];
    v45 = *MEMORY[0x1E0CB2D50];
    v46 = CFSTR("Unspecified failure");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 0, v35);
    v33 = (id)objc_claimAutoreleasedReturnValue();

  }
  v7[2](v7, v33);
  v18 = v33;
LABEL_20:

}

- (void)removeFileAtPath:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _BOOL4 v45;
  BMFileManager *fileManager;
  BOOL v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  const __CFString *v66;
  uint64_t v67;
  const __CFString *v68;
  uint64_t v69;
  const __CFString *v70;
  uint64_t v71;
  const __CFString *v72;
  uint64_t v73;
  const __CFString *v74;
  uint64_t v75;
  const __CFString *v76;
  uint8_t buf[4];
  id v78;
  uint64_t v79;
  _QWORD v80[3];

  v80[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  BMFileServerValidateAndParsePath(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    __biome_log_for_category(6);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[BMFileServer removeFileAtPath:reply:].cold.1();

    v19 = (void *)MEMORY[0x1E0CB35C8];
    v79 = *MEMORY[0x1E0CB2D50];
    v80[0] = CFSTR("Invalid path");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, &v79, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 2, v9);
    v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:
    v7[2](v7, v15);
    goto LABEL_55;
  }
  -[NSString stringByAppendingPathComponent:](self->_directory, "stringByAppendingPathComponent:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __biome_log_for_category(6);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v78 = v6;
    _os_log_impl(&dword_1AEB31000, v10, OS_LOG_TYPE_INFO, "-removeFileAtPath:reply: called with subpath: %{public}@", buf, 0xCu);
  }

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pathType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", CFSTR("streams"));

  if (v12)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("subscriptions"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v75 = *MEMORY[0x1E0CB2D50];
      v76 = CFSTR("Client processes not allowed read-write access to subscriptions substream");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v16 = v14;
      v17 = 5;
LABEL_26:
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), v17, v15);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v38);

      goto LABEL_55;
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("stream"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = 0;
    v23 = -[BMFileServer entitledToAccessStream:withMode:error:](self, "entitledToAccessStream:withMode:error:", v22, 2, &v64);
    v24 = v64;
  }
  else
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pathType"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqual:", CFSTR("compute"));

    if (v21)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("clientIdentifier"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = 0;
      v23 = -[BMFileServer entitledToAccessClientCompute:error:](self, "entitledToAccessClientCompute:error:", v22, &v63);
      v24 = v63;
    }
    else
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pathType"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isEqual:", CFSTR("sharedSync"));

      if (!v26)
      {
        v37 = (void *)MEMORY[0x1E0CB35C8];
        v73 = *MEMORY[0x1E0CB2D50];
        v74 = CFSTR("Invalid request");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        v16 = v37;
        v17 = 3;
        goto LABEL_26;
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("stream"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = 0;
      v23 = -[BMFileServer entitledToAccessStream:withMode:error:](self, "entitledToAccessStream:withMode:error:", v22, 2, &v62);
      v24 = v62;
    }
  }
  v15 = v24;

  if (!v23)
    goto LABEL_21;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("streamType"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v9;
  if (objc_msgSend(v27, "unsignedIntegerValue") != 1)
  {

LABEL_23:
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pathType"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v34, "isEqual:", CFSTR("streams")))
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("segment"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v35 != 0;

    }
    else
    {
      v36 = 0;
    }

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pathType"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v39, "isEqual:", CFSTR("compute")))
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sessionIdentifier"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (v40)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("bookmarks"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (v41)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("client"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (v42)
          {
            v59 = v42;
            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("clientIdentifier"));
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            if (v43)
            {
              v58 = v43;
              objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("subscriptionIdentifier"));
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = v44 != 0;

              v43 = v58;
            }
            else
            {
              v45 = 0;
            }

            v42 = v59;
          }
          else
          {
            v45 = 0;
          }

        }
        else
        {
          v45 = 0;
        }

      }
      else
      {
        v45 = 0;
      }

    }
    else
    {
      v45 = 0;
    }

    if (v36 || v45)
    {
      fileManager = self->_fileManager;
      if (fileManager)
      {
        v61 = v15;
        v47 = -[BMFileManager removeFileAtPath:error:](fileManager, "removeFileAtPath:error:", v60, &v61);
        v48 = v61;

        if (!v47 && !v48)
        {
          v49 = (void *)MEMORY[0x1E0CB35C8];
          v65 = *MEMORY[0x1E0CB2D50];
          v66 = CFSTR("Unspecified failure");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 0, v50);
          v48 = (id)objc_claimAutoreleasedReturnValue();

        }
        v7[2](v7, v48);
        v15 = v48;
        goto LABEL_54;
      }
      __biome_log_for_category(6);
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        -[BMFileServer fileHandleForFileAtPath:flags:protection:reply:].cold.3();

      v56 = (void *)MEMORY[0x1E0CB35C8];
      v67 = *MEMORY[0x1E0CB2D50];
      v68 = CFSTR("Internal failure");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v56;
      v54 = 0;
    }
    else
    {
      v51 = (void *)MEMORY[0x1E0CB35C8];
      v69 = *MEMORY[0x1E0CB2D50];
      v70 = CFSTR("Invalid file");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v51;
      v54 = 5;
    }
    objc_msgSend(v53, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), v54, v52);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v57);

LABEL_54:
    v9 = v60;
    goto LABEL_55;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("stream"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = +[BMPublicStreamUtilities streamForStreamIdentifier:](BMPublicStreamUtilities, "streamForStreamIdentifier:", v28);

  if (v29)
    goto LABEL_23;
  __biome_log_for_category(6);
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    -[BMFileServer fileHandleForFileAtPath:flags:protection:reply:].cold.2((uint64_t)v8, (uint64_t)CFSTR("stream"), v30);

  v31 = (void *)MEMORY[0x1E0CB35C8];
  v71 = *MEMORY[0x1E0CB2D50];
  v72 = CFSTR("Invalid stream identifier");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 2, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v33);

  v9 = v60;
LABEL_55:

}

- (void)removeDirectoryAtPath:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  BMFileManager *fileManager;
  BOOL v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  const __CFString *v50;
  uint64_t v51;
  const __CFString *v52;
  uint64_t v53;
  const __CFString *v54;
  uint64_t v55;
  const __CFString *v56;
  uint64_t v57;
  const __CFString *v58;
  uint8_t buf[4];
  id v60;
  uint64_t v61;
  _QWORD v62[3];

  v62[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  BMFileServerValidateAndParsePath(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    __biome_log_for_category(6);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[BMFileServer removeDirectoryAtPath:reply:].cold.1();

    v19 = (void *)MEMORY[0x1E0CB35C8];
    v61 = *MEMORY[0x1E0CB2D50];
    v62[0] = CFSTR("Invalid path");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, &v61, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 2, v9);
    v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:
    v7[2](v7, v15);
    goto LABEL_34;
  }
  -[NSString stringByAppendingPathComponent:](self->_directory, "stringByAppendingPathComponent:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __biome_log_for_category(6);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v60 = v6;
    _os_log_impl(&dword_1AEB31000, v10, OS_LOG_TYPE_INFO, "-removeDirectoryAtPath:reply: called with subpath: %{public}@", buf, 0xCu);
  }

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pathType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", CFSTR("streams"));

  if (v12)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("subscriptions"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v57 = *MEMORY[0x1E0CB2D50];
      v58 = CFSTR("Client processes not allowed read-write access to subscriptions substream");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v16 = v14;
      v17 = 5;
LABEL_29:
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), v17, v15);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v41);

      goto LABEL_34;
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("stream"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0;
    v23 = -[BMFileServer entitledToAccessStream:withMode:error:](self, "entitledToAccessStream:withMode:error:", v22, 2, &v48);
    v24 = v48;
  }
  else
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pathType"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqual:", CFSTR("compute"));

    if (v21)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("clientIdentifier"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0;
      v23 = -[BMFileServer entitledToAccessClientCompute:error:](self, "entitledToAccessClientCompute:error:", v22, &v47);
      v24 = v47;
    }
    else
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pathType"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isEqual:", CFSTR("sharedSync"));

      if (!v26)
      {
        v40 = (void *)MEMORY[0x1E0CB35C8];
        v55 = *MEMORY[0x1E0CB2D50];
        v56 = CFSTR("Invalid request");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        v16 = v40;
        v17 = 3;
        goto LABEL_29;
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("stream"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 0;
      v23 = -[BMFileServer entitledToAccessStream:withMode:error:](self, "entitledToAccessStream:withMode:error:", v22, 2, &v46);
      v24 = v46;
    }
  }
  v15 = v24;

  if (!v23)
    goto LABEL_21;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("streamType"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "unsignedIntegerValue") == 1)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("stream"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = +[BMPublicStreamUtilities streamForStreamIdentifier:](BMPublicStreamUtilities, "streamForStreamIdentifier:", v28);

    if (!v29)
    {
      __biome_log_for_category(6);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        -[BMFileServer fileHandleForFileAtPath:flags:protection:reply:].cold.2((uint64_t)v8, (uint64_t)CFSTR("stream"), v30);

      v31 = (void *)MEMORY[0x1E0CB35C8];
      v53 = *MEMORY[0x1E0CB2D50];
      v54 = CFSTR("Invalid stream identifier");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v31;
      v34 = 2;
LABEL_33:
      objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), v34, v32);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v44);

      goto LABEL_34;
    }
  }
  else
  {

  }
  fileManager = self->_fileManager;
  if (!fileManager)
  {
    __biome_log_for_category(6);
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      -[BMFileServer fileHandleForFileAtPath:flags:protection:reply:].cold.3();

    v43 = (void *)MEMORY[0x1E0CB35C8];
    v51 = *MEMORY[0x1E0CB2D50];
    v52 = CFSTR("Internal failure");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v43;
    v34 = 0;
    goto LABEL_33;
  }
  v45 = v15;
  v36 = -[BMFileManager removeDirectoryAtPath:error:](fileManager, "removeDirectoryAtPath:error:", v9, &v45);
  v37 = v45;

  if (!v36 && !v37)
  {
    v38 = (void *)MEMORY[0x1E0CB35C8];
    v49 = *MEMORY[0x1E0CB2D50];
    v50 = CFSTR("Unspecified failure");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 0, v39);
    v37 = (id)objc_claimAutoreleasedReturnValue();

  }
  v7[2](v7, v37);
  v15 = v37;
LABEL_34:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_directory, 0);
}

- (void)fileHandleForFileAtPath:flags:protection:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_6(&dword_1AEB31000, v0, v1, "-fileHandleForFileAtPath:flags:protection:reply: called with invalid path: %{private}@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)fileHandleForFileAtPath:(NSObject *)a3 flags:protection:reply:.cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];

  OUTLINED_FUNCTION_8_2();
  objc_msgSend(v4, "objectForKeyedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_6(&dword_1AEB31000, a3, v6, "Invalid stream identifier %{public}@ type 'public'", v7);

  OUTLINED_FUNCTION_5_0();
}

- (void)fileHandleForFileAtPath:flags:protection:reply:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_1AEB31000, v0, v1, "File manager not set", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)fileHandleForFileAtPath:flags:protection:reply:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_6_2(&dword_1AEB31000, v0, v1, "Unexpected protection class specified for remote sharedSync file %{public}@ %d");
  OUTLINED_FUNCTION_1();
}

- (void)createDirectoryAtPath:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_6(&dword_1AEB31000, v0, v1, "-createDirectoryAtPath:reply: called with invalid path: %{private}@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)removeFileAtPath:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_6(&dword_1AEB31000, v0, v1, "-removeFileAtPath:reply: called with invalid path: %{private}@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)removeDirectoryAtPath:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_6(&dword_1AEB31000, v0, v1, "-removeDirectoryAtPath:reply: called with invalid path: %{private}@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)replaceFileAtPath:withFileHandle:protection:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_6(&dword_1AEB31000, v0, v1, "-replaceFileAtPath:withFileHandle:protection:reply: called with invalid path: %{private}@", v2);
  OUTLINED_FUNCTION_1();
}

@end
