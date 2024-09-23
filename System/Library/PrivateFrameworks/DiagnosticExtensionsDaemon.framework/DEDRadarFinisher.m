@implementation DEDRadarFinisher

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DEDRadarFinisher)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DEDRadarFinisher;
  return -[DEDRadarFinisher init](&v4, sel_init, a3);
}

- (DEDRadarFinisher)initWithConfiguration:(id)a3 session:(id)a4
{
  id v5;
  DEDRadarFinisher *v6;
  void *v7;
  os_log_t v8;
  id v9;
  id v10;
  objc_super v12;

  v5 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DEDRadarFinisher;
  v6 = -[DEDRadarFinisher init](&v12, sel_init);
  if (v6)
  {
    +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = os_log_create((const char *)objc_msgSend(v7, "loggingSubsystem"), "ded-radar-finisher");
    -[DEDRadarFinisher setLog:](v6, "setLog:", v8);

    -[DEDRadarFinisher setSession:](v6, "setSession:", v5);
    v9 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    -[DEDRadarFinisher setUploadItems:](v6, "setUploadItems:", v9);

    v10 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    -[DEDRadarFinisher setVerificationTasks:](v6, "setVerificationTasks:", v10);

  }
  return v6;
}

+ (id)archivedClasses
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
}

- (void)finishSession:(id)a3 withConfiguration:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  DEDDiagnosticCollector *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  char v51;
  id v52;
  DEDRadarFinisher *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  NSObject *v58;
  DEDRadarUploadItem *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  const __CFString *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  NSObject *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id obj;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  id v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  uint8_t buf[4];
  void *v99;
  __int16 v100;
  const __CFString *v101;
  _BYTE v102[128];
  _BYTE v103[128];
  _QWORD v104[3];
  _QWORD v105[6];

  v105[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[DEDRadarFinisher log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21469E000, v8, OS_LOG_TYPE_DEFAULT, "Starting Tap-to-Radar finishSession...", buf, 2u);
  }

  -[DEDRadarFinisher log](self, "log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "radarProblemID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v99 = v10;
    _os_log_impl(&dword_21469E000, v9, OS_LOG_TYPE_DEFAULT, "config.radarProblemID = %{public}@", buf, 0xCu);

  }
  -[DEDRadarFinisher log](self, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "radarAuthToken");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v99 = v12;
    _os_log_impl(&dword_21469E000, v11, OS_LOG_TYPE_DEFAULT, "config.radarAuthToken = %{public}@", buf, 0xCu);

  }
  objc_msgSend(v7, "radarProblemID");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    objc_msgSend(v7, "radarAuthToken");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[DEDRadarFinisher setSession:](self, "setSession:", v6);
      -[DEDRadarFinisher setConfiguration:](self, "setConfiguration:", v7);
      LODWORD(v16) = 0;
      -[DEDRadarFinisher setPercentComplete:](self, "setPercentComplete:", v16);
      -[DEDRadarFinisher setRetryAttemptCount:](self, "setRetryAttemptCount:", 0);
      v17 = objc_alloc_init(MEMORY[0x24BDD1710]);
      objc_msgSend(v17, "setQualityOfService:", 25);
      objc_msgSend(v17, "setMaxConcurrentOperationCount:", 1);
      v18 = (void *)MEMORY[0x24BDD1858];
      objc_msgSend(v6, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "backgroundSessionConfigurationWithIdentifier:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "setUpDataUsageWithConfiguration:", v7);
      objc_msgSend(v20, "setRequestCachePolicy:", 1);
      v104[0] = CFSTR("Accept");
      v104[1] = CFSTR("Content-Type");
      v105[0] = CFSTR("application/json");
      v105[1] = CFSTR("application/json; charset=utf-8");
      v104[2] = CFSTR("Radar-Authentication");
      objc_msgSend(v7, "radarAuthToken");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v105[2] = v21;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v105, v104, 3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setHTTPAdditionalHeaders:", v22);

      v77 = v20;
      v78 = v17;
      objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:delegate:delegateQueue:", v20, self, v17);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEDRadarFinisher setUrlSession:](self, "setUrlSession:", v23);

      v24 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(v7, "radarProblemID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v24, "initWithFormat:", CFSTR("Tap-to-Radar upload for rdar://%@ via diagnosticextensionsd"), v25);
      -[DEDRadarFinisher urlSession](self, "urlSession");
      v27 = v6;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setSessionDescription:", v26);

      v29 = objc_alloc_init(DEDDiagnosticCollector);
      -[DEDDiagnosticCollector availableDiagnosticExtensions](v29, "availableDiagnosticExtensions");
      v30 = objc_claimAutoreleasedReturnValue();

      v31 = (void *)objc_opt_new();
      v79 = v27;
      objc_msgSend(v27, "identifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = (void *)v30;
      objc_msgSend(v31, "collectedGroupsWithSessionIdentifier:matchingExtensions:", v32, v30);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v96 = 0u;
      v97 = 0u;
      v94 = 0u;
      v95 = 0u;
      obj = v33;
      v82 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v103, 16);
      if (!v82)
        goto LABEL_41;
      v81 = *(_QWORD *)v95;
      v84 = v7;
      while (1)
      {
        v34 = 0;
        do
        {
          if (*(_QWORD *)v95 != v81)
            objc_enumerationMutation(obj);
          v83 = v34;
          v35 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * v34);
          -[DEDRadarFinisher folderNameForAttachmentGroup:](self, "folderNameForAttachmentGroup:", v35);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = 0u;
          v91 = 0u;
          v92 = 0u;
          v93 = 0u;
          v36 = (void *)MEMORY[0x24BE2C9A0];
          objc_msgSend(v35, "rootURL");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "findAllfiles:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          v85 = v38;
          v87 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
          if (v87)
          {
            v86 = *(_QWORD *)v91;
            do
            {
              v39 = 0;
              do
              {
                if (*(_QWORD *)v91 != v86)
                  objc_enumerationMutation(v85);
                v40 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v39);
                -[DEDRadarFinisher log](self, "log");
                v41 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v99 = v40;
                  _os_log_impl(&dword_21469E000, v41, OS_LOG_TYPE_DEFAULT, "Starting upload for %{public}@", buf, 0xCu);
                }

                objc_msgSend(v40, "lastPathComponent");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD14A8], "URLPathAllowedCharacterSet");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "stringByAddingPercentEncodingWithAllowedCharacters:", v43);
                v44 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://radar-webservices-ext.apple.com"));
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = (void *)MEMORY[0x24BDD17C8];
                objc_msgSend(v7, "radarProblemID");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "stringWithFormat:", CFSTR("problems/%@/attachments/%@/%@"), v47, v88, v44);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "URLByAppendingPathComponent:", v48);
                v49 = (void *)objc_claimAutoreleasedReturnValue();

                -[DEDRadarFinisher log](self, "log");
                v50 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v99 = v49;
                  _os_log_impl(&dword_21469E000, v50, OS_LOG_TYPE_DEFAULT, "Calculated Radar API URL: %{public}@", buf, 0xCu);
                }

                v89 = 0;
                v51 = objc_msgSend(v40, "checkResourceIsReachableAndReturnError:", &v89);
                v52 = v89;
                if ((v51 & 1) != 0)
                {
                  v53 = self;
                  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "path");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "attributesOfItemAtPath:error:", v55, 0);
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  v57 = objc_msgSend(v56, "fileSize");

                  self = v53;
                  if (v57)
                  {
                    -[DEDRadarFinisher createUploadTaskForAttachment:atRadarURL:](v53, "createUploadTaskForAttachment:atRadarURL:", v40, v49);
                    v58 = objc_claimAutoreleasedReturnValue();
                    v59 = -[DEDRadarUploadItem initWithUploadTask:andAttachment:]([DEDRadarUploadItem alloc], "initWithUploadTask:andAttachment:", v58, v40);
                    v60 = (void *)MEMORY[0x24BDD17C8];
                    objc_msgSend(v40, "lastPathComponent");
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v60, "stringWithFormat:", CFSTR("%@/%@"), v88, v61);
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    -[DEDRadarUploadItem setRadarAttachmentName:](v59, "setRadarAttachmentName:", v62);

                    -[DEDRadarUploadItem setRadarURL:](v59, "setRadarURL:", v49);
                    -[DEDRadarFinisher uploadItems](v53, "uploadItems");
                    v63 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v63, "addObject:", v59);

                    -[DEDRadarFinisher log](v53, "log");
                    v64 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
                    {
                      -[DEDRadarFinisher uploadItems](v53, "uploadItems");
                      v65 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543362;
                      v99 = v65;
                      _os_log_impl(&dword_21469E000, v64, OS_LOG_TYPE_DEFAULT, "self.uploadItems: %{public}@", buf, 0xCu);

                    }
                    -[NSObject resume](v58, "resume");

                    goto LABEL_28;
                  }
                  -[DEDRadarFinisher log](v53, "log");
                  v58 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543362;
                    v99 = v40;
                    _os_log_error_impl(&dword_21469E000, v58, OS_LOG_TYPE_ERROR, "File at URL %{public}@ is zero bytes in size, skipping", buf, 0xCu);
LABEL_28:
                    v7 = v84;
                    goto LABEL_35;
                  }
                  v7 = v84;
                }
                else
                {
                  -[DEDRadarFinisher log](self, "log");
                  v58 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v58, OS_LOG_TYPE_FAULT))
                  {
                    objc_msgSend(v52, "localizedDescription");
                    v66 = objc_claimAutoreleasedReturnValue();
                    v67 = (void *)v66;
                    *(_DWORD *)buf = 138543618;
                    v68 = CFSTR("unknown");
                    if (v66)
                      v68 = (const __CFString *)v66;
                    v99 = v40;
                    v100 = 2114;
                    v101 = v68;
                    _os_log_fault_impl(&dword_21469E000, v58, OS_LOG_TYPE_FAULT, "File at URL %{public}@ encountered reachable error: %{public}@, skipping", buf, 0x16u);

                  }
                }
LABEL_35:

                ++v39;
              }
              while (v87 != v39);
              v69 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
              v87 = v69;
            }
            while (v69);
          }

          v34 = v83 + 1;
        }
        while (v83 + 1 != v82);
        v82 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v103, 16);
        if (!v82)
        {
LABEL_41:

          -[DEDRadarFinisher uploadItems](self, "uploadItems");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = objc_msgSend(v70, "count");

          v6 = v79;
          if (!v71)
          {
            -[DEDRadarFinisher log](self, "log");
            v72 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21469E000, v72, OS_LOG_TYPE_DEFAULT, "No attachments were sent to radar finisher", buf, 2u);
            }

            -[DEDRadarFinisher session](self, "session");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "uploadProgress:total:", 1, 1);

            -[DEDRadarFinisher session](self, "session");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "didFinishAllUploads");

          }
          goto LABEL_49;
        }
      }
    }
  }
  -[DEDRadarFinisher log](self, "log");
  v75 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    -[DEDRadarFinisher finishSession:withConfiguration:].cold.1();

  objc_msgSend(v6, "didFinishAllUploads");
LABEL_49:

}

- (id)createUploadTaskForAttachment:(id)a3 atRadarURL:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD16B0], "requestWithURL:cachePolicy:timeoutInterval:", a4, 1, 120.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHTTPMethod:", CFSTR("PUT"));
  objc_msgSend(v7, "addValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("X-Override-File"));
  -[DEDRadarFinisher urlSession](self, "urlSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uploadTaskWithRequest:fromFile:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[DEDRadarFinisher log](self, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543618;
    v13 = v6;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_21469E000, v10, OS_LOG_TYPE_DEFAULT, "Starting upload for %{public}@ with task: %{public}@", (uint8_t *)&v12, 0x16u);
  }

  return v9;
}

- (id)folderNameForAttachmentGroup:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  const __CFString *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;

  v3 = a3;
  +[DEDDevice currentDeviceWithDaemonInfo](DEDDevice, "currentDeviceWithDaemonInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("∕"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("?"), CFSTR("﹖"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("|"), CFSTR("｜"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v8;
  if (objc_msgSend(v4, "mediaSystemRole") == 2)
  {
    v10 = CFSTR(" (L)");
  }
  else
  {
    v11 = v9;
    if (objc_msgSend(v4, "mediaSystemRole") != 3)
      goto LABEL_6;
    v10 = CFSTR(" (R)");
  }
  objc_msgSend(v9, "stringByAppendingString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  objc_msgSend(v4, "deviceClass");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 != v12)
  {
    objc_msgSend(v4, "deviceClass");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingFormat:", CFSTR(" - %@"), v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v14;
  }
  objc_msgSend(v4, "hardwareCodename");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "build");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingFormat:", CFSTR(" (%@) - %@"), v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "extensionID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.DiagnosticExtensions.sysdiagnose"));

  if ((_DWORD)v15)
  {
    v19 = v17;
  }
  else
  {
    objc_msgSend(v3, "displayName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringByReplacingOccurrencesOfString:withString:", CFSTR("log"), CFSTR("Log"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), v17, v21);
    v19 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v19;
}

- (id)getUploadItemForTask:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[DEDRadarFinisher uploadItems](self, "uploadItems", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v10 = objc_msgSend(v9, "taskIdentifier");
        if (v10 == objc_msgSend(v4, "taskIdentifier"))
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)allUploadsComplete
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
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
  -[DEDRadarFinisher uploadItems](self, "uploadItems", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isUploaded"))
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (id)getVerificationTaskForDataTask:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[DEDRadarFinisher verificationTasks](self, "verificationTasks", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "dataTask");
        v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)allVerificationTasksComplete
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
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
  -[DEDRadarFinisher verificationTasks](self, "verificationTasks", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isFinished"))
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (void)startAttachmentVerificationTasks
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "Max number of retries hit in finisher. Ending upload session.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)processVerifyTaskResults
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "Hit an error while attempting to verify attachments; skipping verification",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_2_3();
}

void __44__DEDRadarFinisher_processVerifyTaskResults__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  DEDRadarAttachment *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(v5, "response");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v5, "response");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "statusCode") - 299;

    if (v9 <= 0xFFFFFFFFFFFFFF9CLL)
    {
      objc_msgSend(*(id *)(a1 + 32), "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __44__DEDRadarFinisher_processVerifyTaskResults__block_invoke_cold_3(v5);
LABEL_12:

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      *a3 = 1;
      goto LABEL_24;
    }
  }
  objc_msgSend(v5, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __44__DEDRadarFinisher_processVerifyTaskResults__block_invoke_cold_1();
    goto LABEL_12;
  }
  v12 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v13 = (void *)MEMORY[0x24BDD1608];
  objc_msgSend(v5, "data");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v13, "JSONObjectWithData:options:error:", v14, 4, &v29);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v29;

  if (v16)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __44__DEDRadarFinisher_processVerifyTaskResults__block_invoke_cold_2(v16);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v24 = v15;
    v18 = v15;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v26;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v26 != v21)
            objc_enumerationMutation(v18);
          v23 = -[DEDRadarAttachment initWithDictionary:]([DEDRadarAttachment alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v22));
          if (v23)
            objc_msgSend(v12, "addObject:", v23);

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v20);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "unionSet:", v12);
    v15 = v24;
  }

LABEL_24:
}

void __44__DEDRadarFinisher_processVerifyTaskResults__block_invoke_119(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, _BYTE *);
  void *v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __44__DEDRadarFinisher_processVerifyTaskResults__block_invoke_2;
  v18 = &unk_24D1E43D8;
  v5 = v3;
  v19 = v5;
  v20 = &v21;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v15);
  v6 = *(void **)(a1 + 32);
  if (v22[5])
  {
    objc_msgSend(v6, "log", v15, v16, v17, v18);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "configuration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "radarProblemID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "radarAttachmentName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v9;
      v29 = 2114;
      v30 = v10;
      _os_log_impl(&dword_21469E000, v7, OS_LOG_TYPE_DEFAULT, "Attachment verification (%{public}@): (SUCCESS) %{public}@", buf, 0x16u);

    }
  }
  else
  {
    objc_msgSend(v6, "log", v15, v16, v17, v18);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "configuration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "radarProblemID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "radarAttachmentName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v13;
      v29 = 2114;
      v30 = v14;
      _os_log_error_impl(&dword_21469E000, v11, OS_LOG_TYPE_ERROR, "Attachment verification (%{public}@): (FAILURE) %{public}@", buf, 0x16u);

    }
    objc_msgSend(v5, "setIsUploaded:", 0);
  }

  _Block_object_dispose(&v21, 8);
}

void __44__DEDRadarFinisher_processVerifyTaskResults__block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "fileName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "radarAttachmentName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

void __44__DEDRadarFinisher_processVerifyTaskResults__block_invoke_122(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if ((objc_msgSend(v7, "isUploaded") & 1) == 0)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v7, "attachedPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "radarURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "createUploadTaskForAttachment:atRadarURL:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setTotalBytesSent:", 0);
    objc_msgSend(v7, "setTaskIdentifier:", objc_msgSend(v6, "taskIdentifier"));
    objc_msgSend(v6, "resume");

  }
}

- (void)finishRadarUploadSession
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  -[DEDRadarFinisher log](self, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21469E000, v3, OS_LOG_TYPE_DEFAULT, "All attachments finished! Clean up time!", v7, 2u);
  }

  -[DEDRadarFinisher session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uploadProgress:total:", 1, 1);

  -[DEDRadarFinisher urlSession](self, "urlSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishTasksAndInvalidate");

  -[DEDRadarFinisher session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didFinishAllUploads");

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[DEDRadarFinisher log](self, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138543362;
    v18 = v6;
    _os_log_impl(&dword_21469E000, v7, OS_LOG_TYPE_DEFAULT, "urlSessionTask complete: %{public}@", (uint8_t *)&v17, 0xCu);
  }

  -[DEDRadarFinisher log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "response");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543362;
    v18 = v9;
    _os_log_impl(&dword_21469E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v17, 0xCu);

  }
  -[DEDRadarFinisher getUploadItemForTask:](self, "getUploadItemForTask:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDRadarFinisher getVerificationTaskForDataTask:](self, "getVerificationTaskForDataTask:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    objc_msgSend(v10, "setIsUploaded:", 1);
    -[DEDRadarFinisher log](self, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138543362;
      v18 = v10;
      _os_log_impl(&dword_21469E000, v13, OS_LOG_TYPE_DEFAULT, "Finished upload item: %{public}@", (uint8_t *)&v17, 0xCu);
    }

    -[DEDRadarFinisher log](self, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[DEDRadarFinisher uploadItems](self, "uploadItems");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v15;
      _os_log_impl(&dword_21469E000, v14, OS_LOG_TYPE_DEFAULT, "self.uploadItems: %{public}@", (uint8_t *)&v17, 0xCu);

    }
    if (-[DEDRadarFinisher allUploadsComplete](self, "allUploadsComplete"))
      -[DEDRadarFinisher startAttachmentVerificationTasks](self, "startAttachmentVerificationTasks");
  }
  else if (v11)
  {
    objc_msgSend(v11, "setIsFinished:", 1);
    -[DEDRadarFinisher log](self, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v12;
      _os_log_impl(&dword_21469E000, v16, OS_LOG_TYPE_DEFAULT, "Finished verification task: %@", (uint8_t *)&v17, 0xCu);
    }

    if (-[DEDRadarFinisher allVerificationTasksComplete](self, "allVerificationTasksComplete"))
      -[DEDRadarFinisher processVerifyTaskResults](self, "processVerifyTaskResults");
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  int v19;
  float v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  int v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  -[DEDRadarFinisher getUploadItemForTask:](self, "getUploadItemForTask:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTotalBytesSent:", a6);
  objc_msgSend(v10, "setTotalBytesExpectedToSend:", a7);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[DEDRadarFinisher uploadItems](self, "uploadItems", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = 0;
    v16 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v11);
        v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v15 += objc_msgSend(v18, "totalBytesSent");
        v14 += objc_msgSend(v18, "totalBytesExpectedToSend");
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
    v15 = 0;
  }

  v19 = (int)(float)((float)((float)v15 / (float)v14) * 100.0);
  -[DEDRadarFinisher percentComplete](self, "percentComplete");
  if (v19 != (int)(float)(v20 * 100.0) && v19 != 100)
  {
    -[DEDRadarFinisher log](self, "log");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      -[DEDRadarFinisher session](self, "session");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "config");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "radarProblemID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v24;
      v33 = 1026;
      v34 = (int)(float)((float)((float)v15 / (float)v14) * 100.0);
      _os_log_impl(&dword_21469E000, v21, OS_LOG_TYPE_DEFAULT, "DEDRadarFinisher upload percentComplete (%{public}@): %{public}i%%", buf, 0x12u);

    }
    *(float *)&v25 = (float)v15 / (float)v14;
    -[DEDRadarFinisher setPercentComplete:](self, "setPercentComplete:", v25);
    -[DEDRadarFinisher session](self, "session");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "uploadProgress:total:", v15, v14);

  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a5;
  -[DEDRadarFinisher getVerificationTaskForDataTask:](self, "getVerificationTaskForDataTask:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v8, "data");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "mutableCopy");

      objc_msgSend(v11, "appendData:", v12);
      objc_msgSend(v8, "setData:", v11);

    }
    else
    {
      objc_msgSend(v8, "setData:", v12);
    }
  }

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  void (**v9)(id, uint64_t);
  void *v10;
  void *v11;
  id v12;

  v12 = a5;
  v9 = (void (**)(id, uint64_t))a6;
  -[DEDRadarFinisher getVerificationTaskForDataTask:](self, "getVerificationTaskForDataTask:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "setResponse:", v12);
  v9[2](v9, 1);

}

- (DEDBugSession)session
{
  return (DEDBugSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (void)setSession:(id)a3
{
  objc_storeWeak((id *)&self->_session, a3);
}

- (DEDBugSessionConfiguration)configuration
{
  return (DEDBugSessionConfiguration *)objc_loadWeakRetained((id *)&self->_configuration);
}

- (void)setConfiguration:(id)a3
{
  objc_storeWeak((id *)&self->_configuration, a3);
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (float)percentComplete
{
  return self->_percentComplete;
}

- (void)setPercentComplete:(float)a3
{
  self->_percentComplete = a3;
}

- (int)retryAttemptCount
{
  return self->_retryAttemptCount;
}

- (void)setRetryAttemptCount:(int)a3
{
  self->_retryAttemptCount = a3;
}

- (NSMutableSet)uploadItems
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUploadItems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSURLSession)urlSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUrlSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableSet)verificationTasks
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setVerificationTasks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationTasks, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_uploadItems, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_destroyWeak((id *)&self->_configuration);
  objc_destroyWeak((id *)&self->_session);
}

- (void)finishSession:withConfiguration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "Can't perform finishSession as either the problem ID or auth token are nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

void __44__DEDRadarFinisher_processVerifyTaskResults__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "Data response for verification task is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

void __44__DEDRadarFinisher_processVerifyTaskResults__block_invoke_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1(&dword_21469E000, v2, v3, "DEDRadarFinisher failed to deserialize attachments response: %{public}@", v4, v5, v6, v7, 2u);

}

void __44__DEDRadarFinisher_processVerifyTaskResults__block_invoke_cold_3(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = (void *)MEMORY[0x24BDD15B8];
  objc_msgSend(a1, "response");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedStringForStatusCode:", objc_msgSend(v2, "statusCode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1(&dword_21469E000, v4, v5, "Response headers for verification task indicate an invalid response code: %@", v6, v7, v8, v9, 2u);

}

@end
