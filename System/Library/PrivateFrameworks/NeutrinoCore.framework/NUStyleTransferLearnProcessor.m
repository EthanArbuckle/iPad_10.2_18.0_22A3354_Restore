@implementation NUStyleTransferLearnProcessor

uint64_t __75___NUStyleTransferLearnProcessor_processWithInputs_arguments_output_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  uint64_t v29;
  double v30;
  int v31;
  int v32;
  double v33;
  uint64_t v34;
  int v36;
  double v37;
  __int16 v38;
  double v39;
  __int16 v40;
  double v41;
  __int16 v42;
  double v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "region");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[_NUStyleEngineConfiguration coefficientTextureSizeForStyleEngineConfiguration:](_NUStyleEngineConfiguration, "coefficientTextureSizeForStyleEngineConfiguration:", v12);
  v14 = v13;
  v16 = v15;

  if (v9 != v14 || v11 != v16)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_623);
    v18 = _NULogger;
    if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    v36 = 134218752;
    v37 = v9;
    v38 = 2048;
    v39 = v11;
    v40 = 2048;
    v41 = v14;
    v42 = 2048;
    v43 = v16;
    v19 = "*** Unexpected style buffer size: %0.0fx%0.0f, expected: %0.0fx%0.0f";
    v20 = v18;
    v21 = 42;
    goto LABEL_28;
  }
  if (v5 != *MEMORY[0x1E0C9D538] || v7 != *(double *)(MEMORY[0x1E0C9D538] + 8))
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_623);
    v23 = _NULogger;
    if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    v36 = 134218240;
    v37 = v5;
    v38 = 2048;
    v39 = v7;
    v19 = "*** Unexpected style buffer origin: %0.0fx%0.0f, expected: 0x0";
    v20 = v23;
    v21 = 22;
    goto LABEL_28;
  }
  objc_msgSend(*(id *)(a1 + 32), "metalTexture");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOutputLinearSystemCoefficientsTexture:", v24);

  objc_msgSend(*(id *)(a1 + 40), "metalTexture");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInputThumbnailTexture:", v25);

  objc_msgSend(*(id *)(a1 + 48), "metalTexture");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTargetThumbnailTexture:", v26);

  v27 = objc_msgSend(v3, "prepareToProcess:", 1);
  if (v27)
  {
    v28 = v27;
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_623);
    v29 = _NULogger;
    if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    v30 = *(double *)(a1 + 56);
    v36 = 138412546;
    v37 = v30;
    v38 = 1024;
    LODWORD(v39) = v28;
    v19 = "*** Failed to prepare %@: %d";
    goto LABEL_27;
  }
  v31 = objc_msgSend(v3, "process");
  if (!v31)
  {
    v34 = 1;
    goto LABEL_30;
  }
  v32 = v31;
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_623);
  v29 = _NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
  {
    v33 = *(double *)(a1 + 56);
    v36 = 138412546;
    v37 = v33;
    v38 = 1024;
    LODWORD(v39) = v32;
    v19 = "*** Failed to process %@: %d";
LABEL_27:
    v20 = v29;
    v21 = 18;
LABEL_28:
    _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v36, v21);
  }
LABEL_29:
  v34 = 0;
LABEL_30:

  return v34;
}

@end
