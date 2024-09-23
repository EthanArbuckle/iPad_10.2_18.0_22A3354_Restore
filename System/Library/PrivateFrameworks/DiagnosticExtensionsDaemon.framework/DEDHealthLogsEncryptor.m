@implementation DEDHealthLogsEncryptor

- (id)encryptLogsAtPath:(id)a3 outputDirectory:(id)a4 withPublicKey:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  int v23;
  id v24;
  void *v25;
  id v26;
  id v28;
  id v29;
  id v30;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = os_log_create((const char *)objc_msgSend(v10, "loggingSubsystem"), "ded-encryptor");

  HKHealthWrapCertificateFromString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x24BDD3C58]);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v13, "initWithSubjectUUID:studyUUID:channel:payloadType:certificate:", v14, v15, CFSTR("v1-timberlorry_archive"), CFSTR("timberlorry_archive"), v12);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setStartDate:", v17);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setEndDate:", v18);

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3C50]), "initWithConfiguration:", v16);
  v20 = (void *)objc_msgSend(MEMORY[0x24BDD3C50], "newOutputFileURLInDirectory:", v9);

  v30 = 0;
  LODWORD(v9) = objc_msgSend(v19, "startWithOutputFileURL:error:", v20, &v30);
  v21 = v30;
  v22 = v21;
  if ((_DWORD)v9)
  {
    v29 = v21;
    v23 = objc_msgSend(v19, "appendDataFromFileURL:error:", v7, &v29);
    v24 = v29;

    if (v23 && !v24)
    {
      v28 = 0;
      objc_msgSend(v19, "finalizeWithError:", &v28);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v28;
      if (v24)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[DEDHealthLogsEncryptor encryptLogsAtPath:outputDirectory:withPublicKey:].cold.1();
        v26 = 0;
      }
      else
      {
        v26 = v25;
      }

      goto LABEL_14;
    }
  }
  else
  {
    v24 = v21;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[DEDHealthLogsEncryptor encryptLogsAtPath:outputDirectory:withPublicKey:].cold.2();
  v26 = 0;
LABEL_14:

  return v26;
}

- (id)encryptLogsAtPath:(id)a3 outputDirectory:(id)a4 withMetadata:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  int v43;
  id v44;
  void *v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  NSObject *oslog;
  id v59;
  id v60;
  id v61;
  id v62;
  const __CFString *v63;
  void *v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v57 = a4;
  v8 = a5;
  +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  oslog = os_log_create((const char *)objc_msgSend(v9, "loggingSubsystem"), "ded-encryptor");

  objc_msgSend(v8, "objectForKey:", CFSTR("cloudKitEnv"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("publicKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11 && v10)
    objc_msgSend(v10, "BOOLValue");
  HKHealthWrapCertificateFromString();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
  {
    v54 = (void *)v12;
    v50 = v11;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "fileExistsAtPath:", v15);

    objc_msgSend(v7, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 0;
    v52 = v14;
    objc_msgSend(v14, "attributesOfItemAtPath:error:", v17, &v62);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v62;

    v19 = oslog;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v66 = v20;
      v67 = 1026;
      LODWORD(v68) = v16;
      _os_log_impl(&dword_21469E000, v19, OS_LOG_TYPE_DEFAULT, "Does file exist at path: %{public}@ (Y/N): %{public}d", buf, 0x12u);

    }
    if (v18)
    {
      v21 = v19;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[DEDHealthLogsEncryptor encryptLogsAtPath:outputDirectory:withMetadata:].cold.5(v7, (uint64_t)v18, v21);

    }
    v51 = v18;
    v22 = v19;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "path");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v66 = v23;
      v67 = 2114;
      v68 = v53;
      _os_log_impl(&dword_21469E000, v22, OS_LOG_TYPE_DEFAULT, "File Attributes of file: %{public}@ Attributes Dict: %{public}@", buf, 0x16u);

    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("channel"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("payloadType"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("timberLorryUUID"));
    v26 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v55 = (void *)v26;
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[DEDHealthLogsEncryptor encryptLogsAtPath:outputDirectory:withMetadata:].cold.2();
      v30 = 0;
      v11 = v50;
      v13 = v54;
      goto LABEL_38;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("studyID"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = v10;
    if (v27)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("studyID"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v28);

    }
    else
    {
      v29 = (uint64_t)v56;
    }
    v31 = objc_alloc(MEMORY[0x24BDD3C58]);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (void *)v29;
    v47 = v25;
    v48 = v24;
    v33 = (void *)objc_msgSend(v31, "initWithSubjectUUID:studyUUID:channel:payloadType:certificate:", v32, v29, v24, v25, v54);

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setStartDate:", v34);

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setEndDate:", v35);

    v63 = CFSTR("caseID");
    v64 = v55;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setKeyValuePairs:", v36);

    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3C50]), "initWithConfiguration:", v33);
    v38 = (void *)objc_msgSend(MEMORY[0x24BDD3C50], "newOutputFileURLInDirectory:", v57);
    v61 = 0;
    LODWORD(v36) = objc_msgSend(v37, "startWithOutputFileURL:error:", v38, &v61);
    v39 = v61;
    v40 = v39;
    if ((_DWORD)v36)
    {
      v41 = v38;
      v60 = v39;
      v42 = v7;
      v43 = objc_msgSend(v37, "appendDataFromFileURL:error:", v7, &v60);
      v44 = v60;

      if (v43)
      {
        v7 = v42;
        v24 = v48;
        v38 = v41;
        if (!v44)
        {
          v59 = 0;
          objc_msgSend(v37, "finalizeWithError:", &v59);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v59;
          v11 = v50;
          if (v44)
          {
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              -[DEDHealthLogsEncryptor encryptLogsAtPath:outputDirectory:withPublicKey:].cold.1();
            v30 = 0;
          }
          else
          {
            v30 = v45;
          }

LABEL_37:
          v10 = v49;
          v13 = v54;
          v25 = v47;
LABEL_38:

          goto LABEL_39;
        }
      }
      else
      {
        v7 = v42;
        v24 = v48;
        v38 = v41;
      }
    }
    else
    {
      v44 = v39;
      v24 = v48;
    }
    v11 = v50;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[DEDHealthLogsEncryptor encryptLogsAtPath:outputDirectory:withPublicKey:].cold.2();
    v30 = 0;
    goto LABEL_37;
  }
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    -[DEDHealthLogsEncryptor encryptLogsAtPath:outputDirectory:withMetadata:].cold.1(oslog);
  v30 = 0;
LABEL_39:

  return v30;
}

- (void)encryptLogsAtPath:outputDirectory:withPublicKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_21469E000, v0, v1, "Error: Unable to finalize the files error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)encryptLogsAtPath:outputDirectory:withPublicKey:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_21469E000, v0, v1, "Error: Unable to encrypt the files error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)encryptLogsAtPath:(os_log_t)log outputDirectory:withMetadata:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21469E000, log, OS_LOG_TYPE_ERROR, "Error: No cert generated from the publicKey provided.", v1, 2u);
}

- (void)encryptLogsAtPath:outputDirectory:withMetadata:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_21469E000, v0, v1, "Tried to use HealthWrapEncryptor without a caseID specified. The files at path: %@ will be skipped.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)encryptLogsAtPath:(void *)a1 outputDirectory:(uint64_t)a2 withMetadata:(NSObject *)a3 .cold.5(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  v7 = 2114;
  v8 = a2;
  _os_log_error_impl(&dword_21469E000, a3, OS_LOG_TYPE_ERROR, "Unable to get file attributes at path: %{public}@ with Error: %{public}@", v6, 0x16u);

}

@end
