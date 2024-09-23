@implementation NUCMPhotoAuxiliaryImageProperties

- (NUCMPhotoAuxiliaryImageProperties)init
{
  void *v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *specific;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  objc_class *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_2167);
  v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = v3;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v9;
    _os_log_error_impl(&dword_1A6553000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_2167);
      goto LABEL_8;
    }
    if (v10 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_2167);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v12 = (void *)MEMORY[0x1E0CB3978];
    v13 = v11;
    objc_msgSend(v12, "callStackSymbols");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v15;
    _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v18 = (void *)MEMORY[0x1E0CB3978];
  v19 = specific;
  v13 = v16;
  objc_msgSend(v18, "callStackSymbols");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v29 = specific;
  v30 = 2114;
  v31 = v21;
  _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v22 = (objc_class *)objc_opt_class();
  NSStringFromClass(v22);
  v23 = objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUCMPhotoAuxiliaryImageProperties init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 1062, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v24, v25, v26, v27, v23);
}

- (NUCMPhotoAuxiliaryImageProperties)initWithProperties:(id)a3 decompressionContainer:(CMPhotoDecompressionContainer *)a4
{
  id v6;
  void *v7;
  NUCMPhotoAuxiliaryImageProperties *v8;
  uint64_t v9;
  NSString *auxiliaryImageTypeCGIdentifier;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v17;
  NSString *auxiliaryImageURN;
  const __CFString *v19;
  NSObject *v20;
  void *v21;
  void *specific;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  _BOOL4 v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  objc_super v72;
  _BYTE buf[12];
  __int16 v74;
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_2145();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "properties");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v21;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2145();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v37 = (void *)MEMORY[0x1E0CB3978];
        v38 = v36;
        objc_msgSend(v37, "callStackSymbols");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "componentsJoinedByString:", CFSTR("\n"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v36;
        v74 = 2114;
        v75 = v40;
        _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v26;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCMPhotoAuxiliaryImageProperties initWithProperties:decompressionContainer:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 1066, CFSTR("Invalid parameter not satisfying: %s"), v41, v42, v43, v44, (uint64_t)"properties");
  }
  if (!a4)
  {
    NUAssertLogger_2145();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "decompressionContainer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v28;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2145();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (v29)
    {
      if (v31)
      {
        v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v46 = (void *)MEMORY[0x1E0CB3978];
        v47 = v45;
        objc_msgSend(v46, "callStackSymbols");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "componentsJoinedByString:", CFSTR("\n"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v45;
        v74 = 2114;
        v75 = v49;
        _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v31)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v33;
      _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCMPhotoAuxiliaryImageProperties initWithProperties:decompressionContainer:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 1067, CFSTR("Invalid parameter not satisfying: %s"), v50, v51, v52, v53, (uint64_t)"decompressionContainer");
  }
  v7 = v6;
  v72.receiver = self;
  v72.super_class = (Class)NUCMPhotoAuxiliaryImageProperties;
  v8 = -[NUCMPhotoAuxiliaryImageProperties init](&v72, sel_init);
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC868]);
  v9 = objc_claimAutoreleasedReturnValue();
  auxiliaryImageTypeCGIdentifier = v8->_auxiliaryImageTypeCGIdentifier;
  v8->_auxiliaryImageTypeCGIdentifier = (NSString *)v9;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Width"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Height"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "integerValue");

  if ((v14 | v12) < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, CFSTR("NUGeometryPrimitives.h"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(width >= 0) && (height >= 0)"));

  }
  v8->_size.width = v12;
  v8->_size.height = v14;
  objc_storeWeak(&v8->_container, a4);
  if (-[NSString isEqualToString:](v8->_auxiliaryImageTypeCGIdentifier, "isEqualToString:", CFSTR("urn:com:apple:photo:2023:aux:originalthumbnail")))
  {
    v15 = 10;
LABEL_10:
    v8->_type = v15;
    objc_storeStrong((id *)&v8->_auxiliaryImageURN, v8->_auxiliaryImageTypeCGIdentifier);
    goto LABEL_11;
  }
  if (-[NSString isEqualToString:](v8->_auxiliaryImageTypeCGIdentifier, "isEqualToString:", CFSTR("urn:com:apple:photo:2023:aux:linearthumbnail"))|| -[NSString isEqualToString:](v8->_auxiliaryImageTypeCGIdentifier, "isEqualToString:", CFSTR("tag:apple.com,2023:photo:aux:linearthumbnail")))
  {
    v15 = 11;
    goto LABEL_10;
  }
  if (-[NSString isEqualToString:](v8->_auxiliaryImageTypeCGIdentifier, "isEqualToString:", CFSTR("tag:apple.com,2023:photo:aux:deltamap"))|| -[NSString isEqualToString:](v8->_auxiliaryImageTypeCGIdentifier, "isEqualToString:", CFSTR("tag:apple.com,2023:photo:aux:styledeltamap")))
  {
    v8->_type = 12;
    objc_storeStrong((id *)&v8->_auxiliaryImageURN, v8->_auxiliaryImageTypeCGIdentifier);
    *(_QWORD *)buf = 0;
    if (!CMPhotoDecompressionContainerGetImageGeometryForIndexWithOptions())
    {
      v17 = *(_QWORD *)buf;
      if ((*(_QWORD *)buf & 0x8000000000000000) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "handleFailureInFunction:file:lineNumber:description:", v55, CFSTR("NUGeometryPrimitives.h"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(width >= 0) && (height >= 0)"));

      }
      v8->_size.width = v17;
      v8->_size.height = 0;
    }
  }
  else
  {
    if (-[NSString isEqualToString:](v8->_auxiliaryImageTypeCGIdentifier, "isEqualToString:", *MEMORY[0x1E0CBC720]))
    {
      v8->_type = 3;
      auxiliaryImageURN = v8->_auxiliaryImageURN;
      v19 = CFSTR("urn:com:apple:photo:2018:aux:portraiteffectsmatte");
    }
    else if (-[NSString isEqualToString:](v8->_auxiliaryImageTypeCGIdentifier, "isEqualToString:", *MEMORY[0x1E0CBC738]))
    {
      v8->_type = 4;
      auxiliaryImageURN = v8->_auxiliaryImageURN;
      v19 = CFSTR("urn:com:apple:photo:2019:aux:semanticskinmatte");
    }
    else
    {
      if (!-[NSString isEqualToString:](v8->_auxiliaryImageTypeCGIdentifier, "isEqualToString:", *MEMORY[0x1E0CBC740]))
      {
        NUAssertLogger_2145();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid aux image type: %@"), v8->_auxiliaryImageTypeCGIdentifier);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v57;
          _os_log_error_impl(&dword_1A6553000, v56, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

        }
        v58 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        NUAssertLogger_2145();
        v59 = objc_claimAutoreleasedReturnValue();
        v60 = os_log_type_enabled(v59, OS_LOG_TYPE_ERROR);
        if (v58)
        {
          if (v60)
          {
            v63 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            v64 = (void *)MEMORY[0x1E0CB3978];
            v65 = v63;
            objc_msgSend(v64, "callStackSymbols");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "componentsJoinedByString:", CFSTR("\n"));
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v63;
            v74 = 2114;
            v75 = v67;
            _os_log_error_impl(&dword_1A6553000, v59, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

          }
        }
        else if (v60)
        {
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "componentsJoinedByString:", CFSTR("\n"));
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v62;
          _os_log_error_impl(&dword_1A6553000, v59, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

        }
        _NUAssertFailHandler((uint64_t)"-[NUCMPhotoAuxiliaryImageProperties initWithProperties:decompressionContainer:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 1105, CFSTR("Invalid aux image type: %@"), v68, v69, v70, v71, (uint64_t)v8->_auxiliaryImageTypeCGIdentifier);
      }
      v8->_type = 9;
      auxiliaryImageURN = v8->_auxiliaryImageURN;
      v19 = CFSTR("urn:com:apple:photo:2020:aux:semanticskymatte");
    }
    v8->_auxiliaryImageURN = &v19->isa;

  }
LABEL_11:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NUCMPhotoAuxiliaryImageProperties *v4;
  id WeakRetained;

  v4 = +[NUCMPhotoAuxiliaryImageProperties allocWithZone:](NUCMPhotoAuxiliaryImageProperties, "allocWithZone:", a3);
  v4->_type = self->_type;
  v4->_size = self->_size;
  objc_storeStrong((id *)&v4->_auxImage, self->_auxImage);
  WeakRetained = objc_loadWeakRetained(&self->_container);
  objc_storeWeak(&v4->_container, WeakRetained);

  objc_storeStrong((id *)&v4->_auxiliaryImageTypeCGIdentifier, self->_auxiliaryImageTypeCGIdentifier);
  return v4;
}

- (id)auxiliaryCoreGraphicsInfoDictionary:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *specific;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_2145();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v6;
      _os_log_error_impl(&dword_1A6553000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2145();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v9)
      {
        v12 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v13 = (void *)MEMORY[0x1E0CB3978];
        v14 = v12;
        objc_msgSend(v13, "callStackSymbols");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v22 = v12;
        v23 = 2114;
        v24 = v16;
        _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "componentsJoinedByString:", CFSTR("\n"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v11;
      _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCMPhotoAuxiliaryImageProperties auxiliaryCoreGraphicsInfoDictionary:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 1124, CFSTR("Invalid parameter not satisfying: %s"), v17, v18, v19, v20, (uint64_t)"error != NULL");
  }
  +[NUError unsupportedError:object:](NUError, "unsupportedError:object:", CFSTR("Dictionary representation for this auxiliary image is not supported"), self);
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  return 0;
}

- (CGImageMetadata)auxiliaryDataInfoMetadata
{
  NSObject *v2;
  uint8_t v4[16];

  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_418);
  v2 = _NURenderLogger;
  if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_1A6553000, v2, OS_LOG_TYPE_ERROR, "auxiliaryDataInfoMetadata is unavailable", v4, 2u);
  }
  return 0;
}

- (NUColorSpace)colorSpace
{
  return 0;
}

- (CGImageMetadata)compatibilityMetadata
{
  return 0;
}

- (id)auxiliaryImage:(id *)a3
{
  uint64_t v4;

  v4 = 1;
  -[NUCMPhotoAuxiliaryImageProperties auxiliaryImageWithSourceOptions:subsampleFactor:error:](self, "auxiliaryImageWithSourceOptions:subsampleFactor:error:", MEMORY[0x1E0C9AA70], &v4, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)auxiliaryImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;
  unint64_t v12;
  id v13;
  uint64_t ImageGeometryForIndexWithOptions;
  void *v15;
  const __CFString *v16;
  uint64_t AuxiliaryImageCountForIndexWithOptions;
  void *v18;
  void *v19;
  void *v20;
  unint64_t type;
  __CFString *v22;
  __CFString *v23;
  NSObject *v25;
  void *v26;
  void *specific;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _BYTE pixelBuffer[12];
  __int16 v75;
  void *v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!a4)
  {
    NUAssertLogger_2145();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "subsampleFactor != NULL");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)pixelBuffer = 138543362;
      *(_QWORD *)&pixelBuffer[4] = v26;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", pixelBuffer, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2145();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v29)
      {
        v46 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v47 = (void *)MEMORY[0x1E0CB3978];
        v48 = v46;
        objc_msgSend(v47, "callStackSymbols");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "componentsJoinedByString:", CFSTR("\n"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)pixelBuffer = 138543618;
        *(_QWORD *)&pixelBuffer[4] = v46;
        v75 = 2114;
        v76 = v50;
        _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", pixelBuffer, 0x16u);

      }
    }
    else if (v29)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)pixelBuffer = 138543362;
      *(_QWORD *)&pixelBuffer[4] = v31;
      _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", pixelBuffer, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCMPhotoAuxiliaryImageProperties auxiliaryImageWithSourceOptions:subsampleFactor:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 1149, CFSTR("Invalid parameter not satisfying: %s"), v51, v52, v53, v54, (uint64_t)"subsampleFactor != NULL");
  }
  if (!a5)
  {
    NUAssertLogger_2145();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)pixelBuffer = 138543362;
      *(_QWORD *)&pixelBuffer[4] = v33;
      _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", pixelBuffer, 0xCu);

    }
    v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2145();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (v34)
    {
      if (v36)
      {
        v55 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v56 = (void *)MEMORY[0x1E0CB3978];
        v57 = v55;
        objc_msgSend(v56, "callStackSymbols");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "componentsJoinedByString:", CFSTR("\n"));
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)pixelBuffer = 138543618;
        *(_QWORD *)&pixelBuffer[4] = v55;
        v75 = 2114;
        v76 = v59;
        _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", pixelBuffer, 0x16u);

      }
    }
    else if (v36)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)pixelBuffer = 138543362;
      *(_QWORD *)&pixelBuffer[4] = v38;
      _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", pixelBuffer, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCMPhotoAuxiliaryImageProperties auxiliaryImageWithSourceOptions:subsampleFactor:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 1150, CFSTR("Invalid parameter not satisfying: %s"), v60, v61, v62, v63, (uint64_t)"error != NULL");
  }
  v9 = v8;
  WeakRetained = objc_loadWeakRetained(&self->_container);
  if (!WeakRetained)
  {
    NUAssertLogger_2145();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decompression container is dead!"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)pixelBuffer = 138543362;
      *(_QWORD *)&pixelBuffer[4] = v40;
      _os_log_error_impl(&dword_1A6553000, v39, OS_LOG_TYPE_ERROR, "Fail: %{public}@", pixelBuffer, 0xCu);

    }
    v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2145();
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
    if (v41)
    {
      if (v43)
      {
        v64 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v65 = (void *)MEMORY[0x1E0CB3978];
        v66 = v64;
        objc_msgSend(v65, "callStackSymbols");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "componentsJoinedByString:", CFSTR("\n"));
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)pixelBuffer = 138543618;
        *(_QWORD *)&pixelBuffer[4] = v64;
        v75 = 2114;
        v76 = v68;
        _os_log_error_impl(&dword_1A6553000, v42, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", pixelBuffer, 0x16u);

      }
    }
    else if (v43)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "componentsJoinedByString:", CFSTR("\n"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)pixelBuffer = 138543362;
      *(_QWORD *)&pixelBuffer[4] = v45;
      _os_log_error_impl(&dword_1A6553000, v42, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", pixelBuffer, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCMPhotoAuxiliaryImageProperties auxiliaryImageWithSourceOptions:subsampleFactor:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 1153, CFSTR("Decompression container is dead!"), v69, v70, v71, v72, v73);
  }
  v11 = WeakRetained;
  *(_QWORD *)pixelBuffer = 0;
  v12 = *a4;
  if (self->_type == 10)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    ImageGeometryForIndexWithOptions = CMPhotoDecompressionContainerGetImageGeometryForIndexWithOptions();
    if ((_DWORD)ImageGeometryForIndexWithOptions)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", ImageGeometryForIndexWithOptions);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("Failed to read auxiliary image size");
    }
    else
    {
      if (v12 >= 2)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 0 / v12);
        v19 = v9;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D09568]);

        v9 = v19;
        objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1E50A24A8, *MEMORY[0x1E0D09598]);
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", CMPhotoDecompressionContainerCreateImageForIndex());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("Failed to read auxiliary image");
    }
    +[NUError failureError:object:](NUError, "failureError:object:", v16, v15);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    AuxiliaryImageCountForIndexWithOptions = CMPhotoDecompressionContainerGetAuxiliaryImageCountForIndexWithOptions();
    if ((_DWORD)AuxiliaryImageCountForIndexWithOptions)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", AuxiliaryImageCountForIndexWithOptions);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[NUError failureError:object:](NUError, "failureError:object:", CFSTR("Failed to get number of auxiliary images"), v18);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      type = self->_type;
      if (type > 0xC)
        v22 = CFSTR("Invalid");
      else
        v22 = off_1E5060F88[type];
      v23 = v22;
      +[NUError failureError:object:](NUError, "failureError:object:", CFSTR("Missing auxiliary image"), v23);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return 0;
}

- (id)depthCameraCalibrationData
{
  return 0;
}

- (NSString)auxiliaryImageTypeCGIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)size
{
  int64_t v2;
  int64_t v3;
  _QWORD v4[2];
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  objc_copyStruct(v4, &self->_size, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setSize:(id)a3
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3;

  v3 = a3;
  objc_copyStruct(&self->_size, &v3, 16, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryImageTypeCGIdentifier, 0);
  objc_storeStrong((id *)&self->_auxiliaryImageURN, 0);
  objc_storeStrong((id *)&self->_auxImage, 0);
  objc_destroyWeak(&self->_container);
}

@end
