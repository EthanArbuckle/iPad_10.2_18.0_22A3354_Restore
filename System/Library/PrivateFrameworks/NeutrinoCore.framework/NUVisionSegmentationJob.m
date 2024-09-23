@implementation NUVisionSegmentationJob

- (NUVisionSegmentationJob)initWithVisionSegmentationRequest:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NUVisionSegmentationJob;
  return -[NURenderJob initWithRequest:](&v4, sel_initWithRequest_, a3);
}

- (NUVisionSegmentationJob)initWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *specific;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  objc_class *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_17893);
  v5 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = v5;
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v31 = v11;
    _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v12 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v12 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_17893);
      goto LABEL_8;
    }
    if (v12 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_17893);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v13 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v14 = (void *)MEMORY[0x1E0CB3978];
    v15 = v13;
    objc_msgSend(v14, "callStackSymbols");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v31 = v17;
    _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v18 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v20 = (void *)MEMORY[0x1E0CB3978];
  v21 = specific;
  v15 = v18;
  objc_msgSend(v20, "callStackSymbols");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v31 = specific;
  v32 = 2114;
  v33 = v23;
  _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v24 = (objc_class *)objc_opt_class();
  NSStringFromClass(v24);
  v25 = objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUVisionSegmentationJob initWithRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVisionSegmentationRequest.m", 185, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v26, v27, v28, v29, v25);
}

- (id)scalePolicy
{
  void *v2;
  void *v3;

  -[NUVisionSegmentationJob segmentationRequest](self, "segmentationRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scalePolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)wantsOutputImage
{
  return 1;
}

- (BOOL)wantsOutputGeometry
{
  return 1;
}

- (BOOL)wantsCompleteStage
{
  return 0;
}

- (__CVBuffer)_combineMultipleObservations:(id)a3 context:(id)a4 error:(id *)a5
{
  __CVBuffer *v5;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  __CVBuffer *i;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unint64_t v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  uint64_t v29;
  unint64_t v30;
  float v31;
  void *v32;
  float v33;
  float v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  id v49;
  void *v51;
  NSObject *v52;
  void *v53;
  void *specific;
  NSObject *v55;
  _BOOL4 v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  uint8_t v79[128];
  uint8_t buf[4];
  void *v81;
  __int16 v82;
  void *v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!objc_msgSend(v9, "count"))
  {
    NUAssertLogger_17968();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "observations.count > 0");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v81 = v53;
      _os_log_error_impl(&dword_1A6553000, v52, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_17968();
    v55 = objc_claimAutoreleasedReturnValue();
    v56 = os_log_type_enabled(v55, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v56)
      {
        v59 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v60 = (void *)MEMORY[0x1E0CB3978];
        v61 = v59;
        objc_msgSend(v60, "callStackSymbols");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "componentsJoinedByString:", CFSTR("\n"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v81 = v59;
        v82 = 2114;
        v83 = v63;
        _os_log_error_impl(&dword_1A6553000, v55, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v56)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "componentsJoinedByString:", CFSTR("\n"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v81 = v58;
      _os_log_error_impl(&dword_1A6553000, v55, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUVisionSegmentationJob _combineMultipleObservations:context:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVisionSegmentationRequest.m", 209, CFSTR("Invalid parameter not satisfying: %s"), v64, v65, v66, v67, (uint64_t)"observations.count > 0");
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
  if (v13)
  {
    v5 = (__CVBuffer *)v13;
    v14 = *(_QWORD *)v75;
    do
    {
      for (i = 0; i != v5; i = (__CVBuffer *)((char *)i + 1))
      {
        if (*(_QWORD *)v75 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)i), "instanceSegmentationMask");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v16);

      }
      v5 = (__CVBuffer *)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
    }
    while (v5);
  }

  -[NUVisionSegmentationJob segmentationRequest](self, "segmentationRequest");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "visionSegmentationPolicy");

  switch(v18)
  {
    case 0:
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      goto LABEL_38;
    case 1:
      v20 = 0;
      if (objc_msgSend(v12, "count"))
      {
        v21 = 0;
        v22 = 0.0;
        do
        {
          objc_msgSend(v12, "objectAtIndexedSubscript:", v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "boundingBox");
          v25 = v24;
          objc_msgSend(v12, "objectAtIndexedSubscript:", v21);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "boundingBox");
          v28 = v25 * v27;

          if (v28 > v22)
          {
            objc_msgSend(v11, "objectAtIndexedSubscript:", v21);
            v29 = objc_claimAutoreleasedReturnValue();

            v20 = (void *)v29;
            v22 = v28;
          }
          ++v21;
        }
        while (v21 < objc_msgSend(v12, "count"));
      }
      goto LABEL_37;
    case 2:
      if (objc_msgSend(v12, "count"))
      {
        v30 = 0;
        v20 = 0;
        v31 = 0.0;
        do
        {
          objc_msgSend(v12, "objectAtIndexedSubscript:", v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "confidence");
          v34 = v33;

          if (v34 > v31)
          {
            objc_msgSend(v11, "objectAtIndexedSubscript:", v30);
            v35 = objc_claimAutoreleasedReturnValue();

            v31 = v34;
            v20 = (void *)v35;
          }
          ++v30;
        }
        while (v30 < objc_msgSend(v12, "count"));
      }
      else
      {
        v20 = 0;
      }
LABEL_37:
      v19 = v20;
LABEL_38:
      v5 = (__CVBuffer *)objc_msgSend(v19, "pixelBuffer");
      goto LABEL_39;
    case 3:
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (__CVBuffer *)objc_msgSend(v36, "pixelBuffer");

      if (objc_msgSend(v11, "count") == 1)
        goto LABEL_40;
      v68 = v10;
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDE8]), "initWithPixelBuffer:", v5);
      objc_msgSend(MEMORY[0x1E0C9DD70], "componentAdd");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setBlendKernel:", v37);

      v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count") - 1);
      if ((unint64_t)objc_msgSend(v11, "count") < 2)
        goto LABEL_28;
      v39 = 1;
      break;
    default:
      goto LABEL_40;
  }
  do
  {
    v40 = (void *)MEMORY[0x1E0C9DDC8];
    objc_msgSend(v11, "objectAtIndexedSubscript:", v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "imageWithCVPixelBuffer:", objc_msgSend(v41, "pixelBuffer"));
    v42 = (id)objc_claimAutoreleasedReturnValue();

    v73 = 0;
    objc_msgSend(v68, "startTaskToRender:toDestination:error:", v42, v20, &v73);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v73;
    if (!v43)
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", v39);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Merge render failed"), v51, v44);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      v5 = 0;
      goto LABEL_42;
    }
    objc_msgSend(v38, "addObject:", v43);

    ++v39;
  }
  while (v39 < objc_msgSend(v11, "count"));
LABEL_28:
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v42 = v38;
  v45 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v70;
    do
    {
      for (j = 0; j != v46; ++j)
      {
        if (*(_QWORD *)v70 != v47)
          objc_enumerationMutation(v42);
        v49 = (id)objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * j), "nu_waitUntilCompletedAndReturnError:", a5);
      }
      v46 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
    }
    while (v46);
  }
LABEL_42:

  v10 = v68;
LABEL_39:

LABEL_40:
  return v5;
}

- (BOOL)render:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  Class *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  char v20;
  id v21;
  void *v22;
  uint64_t v23;
  char v24;
  void *v25;
  char v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  __CVBuffer *v31;
  __CVBuffer *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  size_t v41;
  CGColorSpaceRef ColorSpace;
  void *v43;
  __CVBuffer *v44;
  void *v45;
  const __CFString *v46;
  const void *v47;
  const __CFString *v48;
  NUCVPixelBuffer *v49;
  NUCVPixelBuffer *v50;
  const __CFDictionary *v51;
  OSType PixelFormatType;
  size_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  NUCVPixelBuffer *v57;
  NUCVPixelBuffer *v58;
  NSObject *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  void *specific;
  NSObject *v65;
  _BOOL4 v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  size_t Height;
  size_t Width;
  size_t v80;
  size_t v81;
  const __CFDictionary *v82;
  id v83;
  CVBufferRef buffer;
  __CVBuffer *buffera;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  VTPixelTransferSessionRef pixelTransferSessionOut;
  id v91;
  id v92;
  id v93;
  _QWORD v94[2];
  uint64_t v95;
  void *v96;
  _BYTE pixelBufferOut[12];
  __int16 v98;
  void *v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_17968();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)pixelBufferOut = 138543362;
      *(_QWORD *)&pixelBufferOut[4] = v63;
      _os_log_error_impl(&dword_1A6553000, v62, OS_LOG_TYPE_ERROR, "Fail: %{public}@", pixelBufferOut, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_17968();
    v65 = objc_claimAutoreleasedReturnValue();
    v66 = os_log_type_enabled(v65, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v66)
      {
        v69 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v70 = (void *)MEMORY[0x1E0CB3978];
        v71 = v69;
        objc_msgSend(v70, "callStackSymbols");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "componentsJoinedByString:", CFSTR("\n"));
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)pixelBufferOut = 138543618;
        *(_QWORD *)&pixelBufferOut[4] = v69;
        v98 = 2114;
        v99 = v73;
        _os_log_error_impl(&dword_1A6553000, v65, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", pixelBufferOut, 0x16u);

      }
    }
    else if (v66)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "componentsJoinedByString:", CFSTR("\n"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)pixelBufferOut = 138543362;
      *(_QWORD *)&pixelBufferOut[4] = v68;
      _os_log_error_impl(&dword_1A6553000, v65, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", pixelBufferOut, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUVisionSegmentationJob render:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVisionSegmentationRequest.m", 284, CFSTR("Invalid parameter not satisfying: %s"), v74, v75, v76, v77, (uint64_t)"error != nil");
  }
  -[NURenderJob renderer:](self, "renderer:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    LOBYTE(v16) = 0;
    goto LABEL_63;
  }
  -[NURenderJob outputImage](self, "outputImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0CEDF70]);
  v95 = *MEMORY[0x1E0CEE378];
  v96 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[NUFactory sharedFactory](NUFactory, "sharedFactory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "visionSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithCIImage:options:session:", v6, v9, v11);

  -[NUVisionSegmentationJob segmentationRequest](self, "segmentationRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "segmentationType");

  v15 = (Class *)0x1E0CEDF00;
  switch(v14)
  {
    case 0:
      +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("Unknown segmentation type"), 0);
      LOBYTE(v16) = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    case 1:
      v89 = v7;
      v87 = v6;
      v17 = v12;
      v18 = objc_alloc_init(MEMORY[0x1E0CEDF30]);
      -[NUVisionSegmentationJob segmentationRequest](self, "segmentationRequest");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "produceConfidenceMap");

      if ((v20 & 1) == 0)
      {
        v12 = v17;
        break;
      }
      v21 = objc_alloc_init(MEMORY[0x1E0CEDF30]);
      objc_msgSend(v21, "setRevision:", 1);
      objc_msgSend(v21, "setQualityLevel:", 1);
      v12 = v17;
      if (!v21)
        break;
      v94[0] = v18;
      v94[1] = v21;
      v22 = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 2);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = 0;
      goto LABEL_14;
    case 2:
      goto LABEL_10;
    case 3:
      v15 = (Class *)0x1E0CEDF38;
LABEL_10:
      v89 = v7;
      v87 = v6;
      v18 = objc_alloc_init(*v15);
      break;
    default:
      v89 = v7;
      v87 = v6;
      v18 = 0;
      break;
  }
  v93 = v18;
  v24 = 1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v93, 1);
  v23 = objc_claimAutoreleasedReturnValue();
  v22 = 0;
LABEL_14:
  v92 = 0;
  v25 = v12;
  v88 = (void *)v23;
  v26 = objc_msgSend(v12, "performRequests:error:", v23, &v92);
  v27 = v92;
  v28 = v27;
  if ((v26 & 1) == 0)
  {
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Vision segmentation failed"), v18, v27);
    LOBYTE(v16) = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    v12 = v25;
    v6 = v87;
LABEL_31:
    v35 = v22;
    v7 = v89;
    goto LABEL_61;
  }
  v86 = v27;
  if (v14 != 3)
  {
    if (v14 == 2)
    {
      objc_msgSend(v18, "results");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "count");

      if (v34)
      {
        objc_msgSend(v18, "results");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = 0;
        v31 = -[NUVisionSegmentationJob _combineMultipleObservations:context:error:](self, "_combineMultipleObservations:context:error:", v16, v89, &v91);
        v83 = v91;
        v32 = 0;
        goto LABEL_24;
      }
      LOBYTE(v16) = 1;
      goto LABEL_30;
    }
    if (v14 != 1)
    {
      v16 = 0;
      v12 = v25;
      v35 = v22;
      v7 = v89;
LABEL_49:
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 3, CFSTR("No pixelBuffer from vision segmentation"), v18, v16);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(v16) = 0;
      goto LABEL_50;
    }
  }
  objc_msgSend(v18, "results");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    +[NUError missingError:object:](NUError, "missingError:object:", CFSTR("Vision segmentation missing observation"), v18);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:
    v12 = v25;
    v28 = v86;
    v6 = v87;
    goto LABEL_31;
  }
  v30 = objc_msgSend(v16, "pixelBuffer");
  v31 = (__CVBuffer *)v30;
  if ((v24 & 1) != 0)
  {
    v32 = 0;
    v83 = 0;
LABEL_24:
    v35 = v22;
    goto LABEL_38;
  }
  buffer = (CVBufferRef)v30;
  v35 = v22;
  objc_msgSend(v22, "results");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "firstObject");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    v32 = (__CVBuffer *)objc_msgSend(v37, "pixelBuffer");
    v31 = buffer;
  }
  else
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_204);
    v31 = buffer;
    v38 = (void *)_NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      v60 = v38;
      +[NUError missingError:object:](NUError, "missingError:object:", CFSTR("Vision confidence map missing observation"), v35);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)pixelBufferOut = 138412290;
      *(_QWORD *)&pixelBufferOut[4] = v61;
      _os_log_error_impl(&dword_1A6553000, v60, OS_LOG_TYPE_ERROR, "%@", pixelBufferOut, 0xCu);

      v31 = buffer;
    }
    v32 = 0;
  }

  v83 = 0;
LABEL_38:

  if (!v31)
  {
    v12 = v25;
    v7 = v89;
    v16 = v83;
    goto LABEL_49;
  }
  -[NURenderJob outputGeometry](self, "outputGeometry");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "scaledSize");
  v80 = v41;
  v81 = v40;

  Width = CVPixelBufferGetWidth(v31);
  Height = CVPixelBufferGetHeight(v31);
  buffera = v31;
  ColorSpace = CVImageBufferGetColorSpace(v31);
  v12 = v25;
  v7 = v89;
  if (!ColorSpace)
  {
    +[NUColorSpace linearGrayColorSpace](NUColorSpace, "linearGrayColorSpace");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    CVBufferSetAttachment(buffera, (CFStringRef)*MEMORY[0x1E0CA8CD8], (CFTypeRef)objc_msgSend(v43, "CGColorSpace"), kCVAttachmentMode_ShouldPropagate);

    v12 = v25;
  }
  if (v32)
  {
    v44 = v32;
    if (!CVImageBufferGetColorSpace(v32))
    {
      +[NUColorSpace linearGrayColorSpace](NUColorSpace, "linearGrayColorSpace");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (const __CFString *)*MEMORY[0x1E0CA8CD8];
      v47 = (const void *)objc_msgSend(v45, "CGColorSpace");
      v48 = v46;
      v12 = v25;
      CVBufferSetAttachment(v32, v48, v47, kCVAttachmentMode_ShouldPropagate);

      v44 = v32;
    }
    v49 = -[NUCVPixelBuffer initWithCVPixelBuffer:]([NUCVPixelBuffer alloc], "initWithCVPixelBuffer:", v44);
    -[NUVisionSegmentationJob setConfidenceMap:](self, "setConfidenceMap:", v49);

  }
  if (Width == v81 && Height == v80)
  {
    v50 = -[NUCVPixelBuffer initWithCVPixelBuffer:]([NUCVPixelBuffer alloc], "initWithCVPixelBuffer:", buffera);
    -[NUVisionSegmentationJob setSegmentedMatte:](self, "setSegmentedMatte:", v50);

    LOBYTE(v16) = 1;
LABEL_50:
    v28 = v86;
    v6 = v87;
    goto LABEL_61;
  }
  *(_QWORD *)pixelBufferOut = 0;
  v51 = CVBufferCopyAttachments(buffera, kCVAttachmentMode_ShouldPropagate);
  PixelFormatType = CVPixelBufferGetPixelFormatType(buffera);
  v53 = v81;
  v82 = v51;
  v54 = CVPixelBufferCreate(0, v53, v80, PixelFormatType, v51, (CVPixelBufferRef *)pixelBufferOut);
  v6 = v87;
  if ((_DWORD)v54)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUError failureError:object:](NUError, "failureError:object:", CFSTR("Failed to create output pixel buffer"), v55);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(v16) = 0;
  }
  else
  {
    pixelTransferSessionOut = 0;
    v56 = VTPixelTransferSessionCreate(0, &pixelTransferSessionOut);
    if (!(_DWORD)v56 && pixelTransferSessionOut)
    {
      v56 = VTPixelTransferSessionTransferImage(pixelTransferSessionOut, buffera, *(CVPixelBufferRef *)pixelBufferOut);
      VTPixelTransferSessionInvalidate(pixelTransferSessionOut);
      CFRelease(pixelTransferSessionOut);
      pixelTransferSessionOut = 0;
    }
    LOBYTE(v16) = (_DWORD)v56 == 0;
    if ((_DWORD)v56)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v56);
      v57 = (NUCVPixelBuffer *)objc_claimAutoreleasedReturnValue();
      +[NUError failureError:object:](NUError, "failureError:object:", CFSTR("Failed to transfer pixel buffer"), v57);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v58 = [NUCVPixelBuffer alloc];
      v57 = -[NUCVPixelBuffer initWithCVPixelBuffer:](v58, "initWithCVPixelBuffer:", *(_QWORD *)pixelBufferOut);
      -[NUVisionSegmentationJob setSegmentedMatte:](self, "setSegmentedMatte:", v57);
    }

    CFRelease(*(CFTypeRef *)pixelBufferOut);
  }
  v28 = v86;

LABEL_61:
LABEL_62:

LABEL_63:
  return (char)v16;
}

- (id)result
{
  _NUVisionSegmentationResult *v3;
  void *v4;
  void *v5;
  _NUVisionSegmentationResult *v6;
  void *v7;

  v3 = [_NUVisionSegmentationResult alloc];
  -[NUVisionSegmentationJob segmentedMatte](self, "segmentedMatte");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUVisionSegmentationJob confidenceMap](self, "confidenceMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_NUVisionSegmentationResult initWithSegmentedMatteBuffer:confidenceMapBuffer:](v3, "initWithSegmentedMatteBuffer:confidenceMapBuffer:", v4, v5);

  -[NUVisionSegmentationJob segmentationRequest](self, "segmentationRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUVisionSegmentationResult setSegmentationType:](v6, "setSegmentationType:", objc_msgSend(v7, "segmentationType"));

  return v6;
}

- (void)cleanUp
{
  objc_super v3;

  -[NUVisionSegmentationJob setSegmentedMatte:](self, "setSegmentedMatte:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NUVisionSegmentationJob;
  -[NURenderJob cleanUp](&v3, sel_cleanUp);
}

- (NUVisionSegmentationRequest)confidenceMapRequest
{
  return self->_confidenceMapRequest;
}

- (NUImageBuffer)segmentedMatte
{
  return self->_segmentedMatte;
}

- (void)setSegmentedMatte:(id)a3
{
  objc_storeStrong((id *)&self->_segmentedMatte, a3);
}

- (NUImageBuffer)confidenceMap
{
  return self->_confidenceMap;
}

- (void)setConfidenceMap:(id)a3
{
  objc_storeStrong((id *)&self->_confidenceMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confidenceMap, 0);
  objc_storeStrong((id *)&self->_segmentedMatte, 0);
  objc_storeStrong((id *)&self->_confidenceMapRequest, 0);
}

@end
