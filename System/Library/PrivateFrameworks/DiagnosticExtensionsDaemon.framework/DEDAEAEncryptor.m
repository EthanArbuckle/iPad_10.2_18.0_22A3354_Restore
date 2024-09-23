@implementation DEDAEAEncryptor

- (id)encryptLogsAtPath:(id)a3 outputDirectory:(id)a4 withMetadata:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  const char *v15;
  AAPathList v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  const char *v21;
  AAPathList_impl *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  AAByteStream_impl *v27;
  AEAContext v28;
  void *v29;
  AEAContext_impl *v30;
  id v31;
  AAByteStream_impl *v32;
  AAByteStream_impl *v33;
  AAArchiveStream_impl *v34;
  AAFieldKeySet_impl *v35;
  AAFieldKeySet_impl *v36;
  void *v37;
  void *v39;
  id v40;
  void *v41;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = os_log_create((const char *)objc_msgSend(v10, "loggingSubsystem"), "ded-encryptor");

  objc_msgSend(v9, "objectForKey:", CFSTR("publicKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v12, 0);
    if (objc_msgSend(MEMORY[0x24BE2C9A0], "isValidDirectory:", v7))
    {
      objc_msgSend(v7, "path");
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v15 = (const char *)objc_msgSend(v14, "fileSystemRepresentation");

      v16 = AAPathListCreateWithDirectoryContents(v15, 0, 0, 0, 0, 0);
      if (!v16)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[DEDAEAEncryptor encryptLogsAtPath:outputDirectory:withMetadata:].cold.2();
LABEL_24:
        v17 = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    else
    {
      objc_msgSend(v7, "URLByDeletingLastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "path");
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v15 = (const char *)objc_msgSend(v19, "fileSystemRepresentation");

      objc_msgSend(v7, "lastPathComponent");
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v21 = (const char *)objc_msgSend(v20, "fileSystemRepresentation");

      v16 = AAPathListCreateWithPath(v15, v21);
      if (!v16)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[DEDAEAEncryptor encryptLogsAtPath:outputDirectory:withMetadata:].cold.7();
        goto LABEL_24;
      }
    }
    v22 = v16;
    objc_msgSend(v7, "lastPathComponent");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringByAppendingPathExtension:", CFSTR("aea"));
    v24 = objc_claimAutoreleasedReturnValue();

    v41 = (void *)v24;
    objc_msgSend(v8, "URLByAppendingPathComponent:", v24);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "path");
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27 = AAFileStreamOpenWithPath((const char *)objc_msgSend(v26, "fileSystemRepresentation"), 513, 0x1A4u);

    if (v27)
    {
      v40 = v8;
      v28 = AEAContextCreateWithProfile(3u);
      v29 = v13;
      v30 = v28;
      v39 = v29;
      v31 = objc_retainAutorelease(v29);
      AEAContextSetFieldBlob(v30, 0xAu, 1u, (const uint8_t *)objc_msgSend(v31, "bytes"), objc_msgSend(v31, "length"));
      AEAContextSetFieldUInt(v30, 3u, 0x801uLL);
      v32 = AEAEncryptionOutputStreamOpen(v27, v30, 0, 0);
      if (v32)
      {
        v33 = v32;
        v34 = AAEncodeArchiveOutputStreamOpen(v32, 0, 0, 0, 0);
        v35 = AAFieldKeySetCreateWithString("TYP,PAT,LNK,DEV,DAT,MOD,FLG,MTM,BTM,CTM,UID,GID,CLC,HLC,XAT");
        if (v34)
        {
          v36 = v35;
          if (v35)
          {
            v37 = v41;
            if (AAArchiveStreamWritePathList(v34, v22, v35, v15, 0, 0, 0, 0) < 0)
            {
              if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
                -[DEDAEAEncryptor encryptLogsAtPath:outputDirectory:withMetadata:].cold.6();

              v25 = 0;
            }
            AEAContextDestroy(v30);
            AAArchiveStreamClose(v34);
            AAFieldKeySetDestroy(v36);
            AAPathListDestroy(v22);
            v25 = v25;
            v17 = v25;
            v13 = v39;
            v8 = v40;
            goto LABEL_33;
          }
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[DEDAEAEncryptor encryptLogsAtPath:outputDirectory:withMetadata:].cold.5();
        AAByteStreamClose(v33);
        AEAContextDestroy(v30);
      }
      else
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[DEDAEAEncryptor encryptLogsAtPath:outputDirectory:withMetadata:].cold.4();
        AEAContextDestroy(v30);
        AAByteStreamClose(v27);
      }
      AAPathListDestroy(v22);
      v17 = 0;
      v13 = v39;
      v8 = v40;
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[DEDAEAEncryptor encryptLogsAtPath:outputDirectory:withMetadata:].cold.3();
      AAPathListDestroy(v22);
      v17 = 0;
    }
    v37 = v41;
LABEL_33:

    goto LABEL_34;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[DEDAEAEncryptor encryptLogsAtPath:outputDirectory:withMetadata:].cold.1(v11);
  v17 = 0;
LABEL_35:

  return v17;
}

- (id)encryptLogsAtPath:(id)a3 outputDirectory:(id)a4 withPublicKey:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v15 = CFSTR("publicKey");
  v16[0] = a5;
  v8 = (void *)MEMORY[0x24BDBCE70];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[DEDAEAEncryptor encryptLogsAtPath:outputDirectory:withMetadata:](self, "encryptLogsAtPath:outputDirectory:withMetadata:", v11, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)encryptLogsAtPath:(os_log_t)log outputDirectory:withMetadata:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21469E000, log, OS_LOG_TYPE_ERROR, "No key found in encryptor meta data", v1, 2u);
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
  OUTLINED_FUNCTION_2(&dword_21469E000, v0, v1, "Could not open directory contents of %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)encryptLogsAtPath:outputDirectory:withMetadata:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_21469E000, v0, v1, "Could not open AppleArchive output byte stream at %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)encryptLogsAtPath:outputDirectory:withMetadata:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_21469E000, v0, v1, "Could not open AppleArchive encryption stream at %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)encryptLogsAtPath:outputDirectory:withMetadata:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_21469E000, v0, v1, "Could not create encoder stream for the archive at %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)encryptLogsAtPath:outputDirectory:withMetadata:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_21469E000, v0, v1, "Writing directory contents to archive failed %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)encryptLogsAtPath:outputDirectory:withMetadata:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_21469E000, v0, v1, "Could not open file at %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
