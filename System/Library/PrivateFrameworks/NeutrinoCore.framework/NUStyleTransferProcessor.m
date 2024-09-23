@implementation NUStyleTransferProcessor

uint64_t __70___NUStyleTransferProcessor_processWithInputs_arguments_output_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v14;
  void *v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  void *v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  int v26;
  int v27;
  NSObject *v28;
  uint64_t v29;
  const char *v30;
  int v31;
  int v32;
  uint64_t v33;
  uint64_t v35;
  NSObject *v36;
  void *v38;
  void *specific;
  NSObject *v40;
  _BOOL4 v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _BYTE v53[12];
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "CGRectValue");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v3, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "thumbnailSize");
  v10 = v9;
  v12 = v11;

  if (v5 != v10 || v7 != v12)
  {
    NUAssertLogger_24413();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Thumbnail size doesn't match the thumbnail extent"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v53 = 138543362;
      *(_QWORD *)&v53[4] = v38;
      _os_log_error_impl(&dword_1A6553000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v53, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v41)
      {
        v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v45 = (void *)MEMORY[0x1E0CB3978];
        v46 = v44;
        objc_msgSend(v45, "callStackSymbols");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "componentsJoinedByString:", CFSTR("\n"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v53 = 138543618;
        *(_QWORD *)&v53[4] = v44;
        v54 = 2114;
        v55 = v48;
        _os_log_error_impl(&dword_1A6553000, v40, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v53, 0x16u);

      }
    }
    else if (v41)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v53 = 138543362;
      *(_QWORD *)&v53[4] = v43;
      _os_log_error_impl(&dword_1A6553000, v40, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v53, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferProcessor processWithInputs:arguments:output:error:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2081, CFSTR("Thumbnail size doesn't match the thumbnail extent"), v49, v50, v51, v52, *(uint64_t *)v53);
  }
  objc_msgSend(*(id *)(a1 + 40), "metalTexture");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInputThumbnailTexture:", v14);

  objc_msgSend(*(id *)(a1 + 48), "metalTexture");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTargetThumbnailTexture:", v15);

  objc_msgSend(v3, "setImageSize:", *(double *)(a1 + 88), *(double *)(a1 + 96));
  objc_msgSend(v3, "setRegionToRender:", NURectFlipYOrigin(*(CGFloat *)(a1 + 104), *(CGFloat *)(a1 + 112), *(CGFloat *)(a1 + 120), *(CGFloat *)(a1 + 128), *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88), *(CGFloat *)(a1 + 96)));
  objc_msgSend(*(id *)(a1 + 56), "metalTexture");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInputTexture:", v16);

  objc_msgSend(*(id *)(a1 + 56), "region");
  objc_msgSend(v3, "setInputImageRect:", NURectFlipYOrigin(v17, v18, v19, v20, *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88), *(CGFloat *)(a1 + 96)));
  objc_msgSend(*(id *)(a1 + 64), "metalTexture");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOutputTexture:", v21);

  objc_msgSend(*(id *)(a1 + 64), "region");
  objc_msgSend(v3, "setOutputImageRect:", NURectFlipYOrigin(v22, v23, v24, v25, *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88), *(CGFloat *)(a1 + 96)));
  v26 = objc_msgSend(v3, "prepareToProcess:", 5);
  if (v26)
  {
    v27 = v26;
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_623);
    v28 = _NULogger;
    if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v29 = *(_QWORD *)(a1 + 136);
    *(_DWORD *)v53 = 138412546;
    *(_QWORD *)&v53[4] = v29;
    v54 = 1024;
    LODWORD(v55) = v27;
    v30 = "*** Failed to prepare %@: %d";
    goto LABEL_19;
  }
  v31 = objc_msgSend(v3, "process");
  if (!v31)
  {
    v33 = 1;
    goto LABEL_16;
  }
  v32 = v31;
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_623);
  v28 = _NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
  {
    v35 = *(_QWORD *)(a1 + 136);
    *(_DWORD *)v53 = 138412546;
    *(_QWORD *)&v53[4] = v35;
    v54 = 1024;
    LODWORD(v55) = v32;
    v30 = "*** Failed to process %@: %d";
LABEL_19:
    _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, v30, v53, 0x12u);
  }
LABEL_15:
  v33 = 0;
LABEL_16:

  return v33;
}

@end
