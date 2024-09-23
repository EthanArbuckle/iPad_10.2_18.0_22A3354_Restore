@implementation CSFModelComputeBackendFactory

+ (id)provideComputeBackendWithModelFile:(id)a3 separateWeight:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  CSFMil2bnnsComputeBackend *v11;
  id v12;
  void *v13;
  CSFMil2bnnsComputeBackend *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "hasSuffix:", CFSTR("bnns.mil")))
  {
    +[CSFBnnsIrLookUp getBnnsIrPathFromMilFile:](CSFBnnsIrLookUp, "getBnnsIrPathFromMilFile:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v26 = "+[CSFModelComputeBackendFactory provideComputeBackendWithModelFile:separateWeight:error:]";
      v27 = 2112;
      v28 = v9;
      v29 = 2112;
      v30 = v7;
      _os_log_impl(&dword_1B502E000, v10, OS_LOG_TYPE_DEFAULT, "%s obtained lookup bnnsIrPath : %@ for mil path: %@", buf, 0x20u);
    }
    v22 = 0;
    v11 = -[CSFMil2bnnsComputeBackend initWithModelFile:bnnsIrPath:errOut:]([CSFMil2bnnsComputeBackend alloc], "initWithModelFile:bnnsIrPath:errOut:", v7, v9, &v22);
    v12 = v22;

    if (!v11)
      goto LABEL_14;
LABEL_11:
    if (!v12)
    {
      v11 = v11;
      v14 = v11;
      goto LABEL_19;
    }
    goto LABEL_14;
  }
  if (objc_msgSend(v7, "hasSuffix:", CFSTR("bnnsir")))
  {
    v21 = 0;
    v11 = -[CSFMil2bnnsComputeBackend initWithBnnsIrFile:weightPath:errOut:]([CSFMil2bnnsComputeBackend alloc], "initWithBnnsIrFile:weightPath:errOut:", v7, v8, &v21);
    v13 = v21;
  }
  else
  {
    if (!objc_msgSend(v7, "hasSuffix:", CFSTR("mlmodelc")))
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v23 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Backend not supported"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2457, v17);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      v11 = 0;
      goto LABEL_14;
    }
    v20 = 0;
    v11 = -[CSFCoreMLComputeBackend initWithModelFile:error:]([CSFCoreMLComputeBackend alloc], "initWithModelFile:error:", v7, &v20);
    v13 = v20;
  }
  v12 = v13;
  if (v11)
    goto LABEL_11;
LABEL_14:
  v18 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v26 = "+[CSFModelComputeBackendFactory provideComputeBackendWithModelFile:separateWeight:error:]";
    v27 = 2112;
    v28 = v7;
    v29 = 2112;
    v30 = v12;
    _os_log_impl(&dword_1B502E000, v18, OS_LOG_TYPE_DEFAULT, "%s model: %@ init with error: %@", buf, 0x20u);
  }
  if (a5)
  {
    v12 = objc_retainAutorelease(v12);
    v14 = 0;
    *a5 = v12;
  }
  else
  {
    v14 = 0;
  }
LABEL_19:

  return v14;
}

@end
