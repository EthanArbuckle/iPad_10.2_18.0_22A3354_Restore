@implementation DESFedStatsRecorder

- (BOOL)record:(id)a3 data:(id)a4 dataTypeContent:(id)a5 metadata:(id)a6 errorOut:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  char isKindOfClass;
  char v17;
  id FedStatsDataEncoderClass;
  void *v19;
  char v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v39;
  id v40;
  id v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!PrivateFederatedLearningLibraryCore_frameworkLibrary)
  {
    v42 = xmmword_1E706F200;
    v43 = 0;
    PrivateFederatedLearningLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (PrivateFederatedLearningLibraryCore_frameworkLibrary)
  {
    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        getFedStatsDataEncoderClass();
        v17 = objc_opt_respondsToSelector();
        FedStatsDataEncoderClass = getFedStatsDataEncoderClass();
        v19 = FedStatsDataEncoderClass;
        if ((v17 & 1) != 0)
        {
          v41 = 0;
          v20 = objc_msgSend(FedStatsDataEncoderClass, "encodeDataArrayAndRecord:dataTypeContent:baseKey:errorOut:", v12, v13, v11, &v41);
          v21 = v41;
          if (!a7)
            goto LABEL_17;
        }
        else
        {
          objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = 0;
          v20 = objc_msgSend(v19, "encodeDataAndRecord:dataTypeContent:baseKey:errorOut:", v39, v13, v11, &v40);
          v21 = v40;

          if (!a7)
          {
LABEL_17:

            goto LABEL_14;
          }
        }
        *a7 = objc_retainAutorelease(v21);
        goto LABEL_17;
      }
    }
    v22 = sLog_0;
    if (os_log_type_enabled((os_log_t)sLog_0, OS_LOG_TYPE_ERROR))
      -[DESFedStatsRecorder record:data:dataTypeContent:metadata:errorOut:].cold.2(v22, v23, v24, v25, v26, v27, v28, v29);
  }
  else
  {
    v30 = sLog_0;
    if (os_log_type_enabled((os_log_t)sLog_0, OS_LOG_TYPE_ERROR))
      -[DESFedStatsRecorder record:data:dataTypeContent:metadata:errorOut:].cold.1(v30, v31, v32, v33, v34, v35, v36, v37);
  }
  v20 = 0;
LABEL_14:

  return v20;
}

- (BOOL)record:(id)a3 data:(id)a4 encodingSchema:(id)a5 metadata:(id)a6 errorOut:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  BOOL v17;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("dataContentTypes"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("key=%@ has wrong type, value=%@"), CFSTR("dataContentTypes"), v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "exceptionWithName:reason:userInfo:", v20, v21, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v22);
  }
  v17 = -[DESFedStatsRecorder record:data:dataTypeContent:metadata:errorOut:](self, "record:data:dataTypeContent:metadata:errorOut:", v12, v13, v16, v15, a7);

  return v17;
}

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.DistributedEvaluation", "DESFedStatsRecorder");
    v3 = (void *)sLog_0;
    sLog_0 = (uint64_t)v2;

  }
}

- (void)record:(uint64_t)a3 data:(uint64_t)a4 dataTypeContent:(uint64_t)a5 metadata:(uint64_t)a6 errorOut:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1B96E5000, a1, a3, "Failed to softlink PrivateFederatedLearning framework", a5, a6, a7, a8, 0);
}

- (void)record:(uint64_t)a3 data:(uint64_t)a4 dataTypeContent:(uint64_t)a5 metadata:(uint64_t)a6 errorOut:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1B96E5000, a1, a3, "Data to be encoded by FedStats is malformed, should be a non-empty array of dictionaries", a5, a6, a7, a8, 0);
}

@end
