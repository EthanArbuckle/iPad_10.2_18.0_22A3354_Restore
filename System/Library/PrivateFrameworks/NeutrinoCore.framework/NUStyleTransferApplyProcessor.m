@implementation NUStyleTransferApplyProcessor

uint64_t __75___NUStyleTransferApplyProcessor_processWithInputs_arguments_output_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  int v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  int v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  double v56;
  __int16 v57;
  double v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_NUStyleEngineConfiguration coefficientTextureSizeForStyleEngineConfiguration:](_NUStyleEngineConfiguration, "coefficientTextureSizeForStyleEngineConfiguration:", v4);
  v6 = v5;
  v8 = v7;

  if (*(double *)(a1 + 104) != v6 || *(double *)(a1 + 112) != v8)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_623);
    v10 = _NULogger;
    if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      goto LABEL_35;
    v11 = *(_QWORD *)(a1 + 104);
    v12 = *(_QWORD *)(a1 + 112);
    v51 = 134218752;
    v52 = v11;
    v53 = 2048;
    v54 = v12;
    v55 = 2048;
    v56 = v6;
    v57 = 2048;
    v58 = v8;
    v13 = "*** Unexpected style buffer size: %0.0fx%0.0f, expected: %0.0fx%0.0f";
    v14 = v10;
    v15 = 42;
    goto LABEL_34;
  }
  if (*(double *)(a1 + 88) != *MEMORY[0x1E0C9D538] || *(double *)(a1 + 96) != *(double *)(MEMORY[0x1E0C9D538] + 8))
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_623);
    v17 = _NULogger;
    if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      goto LABEL_35;
    v18 = *(_QWORD *)(a1 + 88);
    v19 = *(_QWORD *)(a1 + 96);
    v51 = 134218240;
    v52 = v18;
    v53 = 2048;
    v54 = v19;
    v13 = "*** Unexpected style buffer origin: %0.0fx%0.0f, expected: 0x0";
    v14 = v17;
    v15 = 22;
    goto LABEL_34;
  }
  objc_msgSend(v3, "setImageSize:", *(double *)(a1 + 136), *(double *)(a1 + 144));
  objc_msgSend(v3, "setRegionToRender:", NURectFlipYOrigin(*(CGFloat *)(a1 + 152), *(CGFloat *)(a1 + 160), *(CGFloat *)(a1 + 168), *(CGFloat *)(a1 + 176), *(CGFloat *)(a1 + 120), *(CGFloat *)(a1 + 128), *(CGFloat *)(a1 + 136), *(CGFloat *)(a1 + 144)));
  objc_msgSend(*(id *)(a1 + 32), "metalTexture");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInputTexture:", v20);

  objc_msgSend(*(id *)(a1 + 32), "region");
  objc_msgSend(v3, "setInputImageRect:", NURectFlipYOrigin(v21, v22, v23, v24, *(CGFloat *)(a1 + 120), *(CGFloat *)(a1 + 128), *(CGFloat *)(a1 + 136), *(CGFloat *)(a1 + 144)));
  objc_msgSend(*(id *)(a1 + 40), "metalTexture");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInputLinearSystemCoefficientsTexture:", v25);

  v26 = *(void **)(a1 + 48);
  if (v26)
  {
    objc_msgSend(v26, "metalTexture");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setInputThumbnailTexture:", v27);

  }
  v28 = *(void **)(a1 + 56);
  if (v28)
  {
    objc_msgSend(v28, "metalTexture");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setInputDeltaMapTexture:", v29);

    objc_msgSend(*(id *)(a1 + 56), "region");
    objc_msgSend(v3, "setInputDeltaMapImageRect:", NURectFlipYOrigin(v30, v31, v32, v33, *(CGFloat *)(a1 + 120), *(CGFloat *)(a1 + 128), *(CGFloat *)(a1 + 136), *(CGFloat *)(a1 + 144)));
  }
  v34 = *(void **)(a1 + 64);
  if (v34)
  {
    objc_msgSend(v34, "metalTexture");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTargetThumbnailTexture:", v35);

  }
  objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", CFSTR("noiseModel"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInputNoiseModel:", v36);

  objc_msgSend(*(id *)(a1 + 80), "metalTexture");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOutputTexture:", v37);

  objc_msgSend(*(id *)(a1 + 80), "region");
  objc_msgSend(v3, "setOutputImageRect:", NURectFlipYOrigin(v38, v39, v40, v41, *(CGFloat *)(a1 + 120), *(CGFloat *)(a1 + 128), *(CGFloat *)(a1 + 136), *(CGFloat *)(a1 + 144)));
  v42 = objc_msgSend(v3, "prepareToProcess:", 6);
  if (v42)
  {
    v43 = v42;
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_623);
    v44 = _NULogger;
    if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      goto LABEL_35;
    v45 = *(_QWORD *)(a1 + 184);
    v51 = 138412546;
    v52 = v45;
    v53 = 1024;
    LODWORD(v54) = v43;
    v13 = "*** Failed to prepare %@: %d";
    goto LABEL_33;
  }
  v46 = objc_msgSend(v3, "process");
  if (!v46)
  {
    v49 = 1;
    goto LABEL_36;
  }
  v47 = v46;
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_623);
  v44 = _NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
  {
    v48 = *(_QWORD *)(a1 + 184);
    v51 = 138412546;
    v52 = v48;
    v53 = 1024;
    LODWORD(v54) = v47;
    v13 = "*** Failed to process %@: %d";
LABEL_33:
    v14 = v44;
    v15 = 18;
LABEL_34:
    _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v51, v15);
  }
LABEL_35:
  v49 = 0;
LABEL_36:

  return v49;
}

@end
