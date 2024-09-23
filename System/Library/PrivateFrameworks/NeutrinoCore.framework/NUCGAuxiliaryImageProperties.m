@implementation NUCGAuxiliaryImageProperties

- (NUCGAuxiliaryImageProperties)initWithCGProperties:(id)a3 imageSource:(CGImageSource *)a4
{
  id v5;
  NUCGAuxiliaryImageProperties *v6;
  uint64_t v7;
  NSString *auxiliaryImageTypeCGIdentifier;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NUCGAuxiliaryImageProperties;
  v5 = a3;
  v6 = -[NUCGAuxiliaryImageProperties init](&v16, sel_init);
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC868]);
  v7 = objc_claimAutoreleasedReturnValue();
  auxiliaryImageTypeCGIdentifier = v6->_auxiliaryImageTypeCGIdentifier;
  v6->_auxiliaryImageTypeCGIdentifier = (NSString *)v7;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Width"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Height"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "integerValue");
  if ((v12 | v10) < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("NUGeometryPrimitives.h"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(width >= 0) && (height >= 0)"));

  }
  v6->_size.width = v10;
  v6->_size.height = v12;
  objc_storeWeak(&v6->_imageSource, a4);
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NUCGAuxiliaryImageProperties *v4;
  id WeakRetained;

  v4 = [NUCGAuxiliaryImageProperties alloc];
  objc_storeStrong((id *)&v4->_auxCGInfoDictionary, self->_auxCGInfoDictionary);
  objc_storeStrong(&v4->_auxDataInfoMetadata, self->_auxDataInfoMetadata);
  v4->_compatibilityMetadata = self->_compatibilityMetadata;
  objc_storeStrong((id *)&v4->_auxImage, self->_auxImage);
  objc_storeStrong((id *)&v4->_auxiliaryImageTypeCGIdentifier, self->_auxiliaryImageTypeCGIdentifier);
  objc_storeStrong((id *)&v4->_depthCamCalibrationData, self->_depthCamCalibrationData);
  WeakRetained = objc_loadWeakRetained(&self->_imageSource);
  objc_storeWeak(&v4->_imageSource, WeakRetained);

  v4->_size = self->_size;
  return v4;
}

- (CGImageMetadata)auxiliaryDataInfoMetadata
{
  CGImageMetadata *auxDataInfoMetadata;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  auxDataInfoMetadata = (CGImageMetadata *)self->_auxDataInfoMetadata;
  if (!auxDataInfoMetadata)
  {
    v8 = 0;
    -[NUCGAuxiliaryImageProperties auxiliaryCoreGraphicsInfoDictionary:](self, "auxiliaryCoreGraphicsInfoDictionary:", &v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    if (v4)
    {
      auxDataInfoMetadata = (CGImageMetadata *)self->_auxDataInfoMetadata;
    }
    else
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_418);
      v6 = _NURenderLogger;
      if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v10 = v5;
        _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "failed to get auxiliaryDataInfoMetadata. error: %@", buf, 0xCu);
      }
      auxDataInfoMetadata = 0;
    }

  }
  return auxDataInfoMetadata;
}

- (NUColorSpace)colorSpace
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[NUCGAuxiliaryImageProperties auxInfoColorSpace](self, "auxInfoColorSpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v10 = 0;
    -[NUCGAuxiliaryImageProperties auxiliaryCoreGraphicsInfoDictionary:](self, "auxiliaryCoreGraphicsInfoDictionary:", &v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
    if (v6)
    {
      -[NUCGAuxiliaryImageProperties auxInfoColorSpace](self, "auxInfoColorSpace");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_418);
      v8 = _NURenderLogger;
      if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v7;
        _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "failed to get auxiliaryDataInfoMetadata. error: %@", buf, 0xCu);
      }
      v5 = 0;
    }

  }
  return (NUColorSpace *)v5;
}

- (id)auxiliaryCoreGraphicsInfoDictionary:(id *)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CGImageMetadata *v10;
  CGImageMetadata *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id auxDataInfoMetadata;
  void *v16;
  void *v17;
  NUColorSpace *v18;
  void *v19;
  id v20;
  void *v21;
  int v22;
  __CFString *v23;
  uint64_t (*CGImageSourceCopyAuxiliaryDataInfoAtIndexWithOptionsSymbolLoc)(id, _QWORD, __CFString *, void *);
  CFDictionaryRef v25;
  NSObject *v27;
  void *v28;
  void *specific;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  _BYTE buf[24];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_2145();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v28;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2145();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v31)
      {
        v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v35 = (void *)MEMORY[0x1E0CB3978];
        v36 = v34;
        objc_msgSend(v35, "callStackSymbols");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v34;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v38;
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
    _NUAssertFailHandler((uint64_t)"-[NUCGAuxiliaryImageProperties auxiliaryCoreGraphicsInfoDictionary:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 1344, CFSTR("Invalid parameter not satisfying: %s"), v39, v40, v41, v42, (uint64_t)"error != NULL");
  }
  WeakRetained = objc_loadWeakRetained(&self->_imageSource);

  -[NUCGAuxiliaryImageProperties auxCGInfoDictionary](self, "auxCGInfoDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[NUCGAuxiliaryImageProperties auxImage](self, "auxImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[NUCGAuxiliaryImageProperties auxImage](self, "auxImage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dictionaryRepresentation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        goto LABEL_5;
LABEL_27:
      v20 = *a3;
      goto LABEL_28;
    }
    if (!WeakRetained)
    {
      +[NUError missingError:object:](NUError, "missingError:object:", CFSTR("imageSource is nil"), 0);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      *a3 = v20;
LABEL_28:
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Unable to obtain auxiliary data"), self, v20);
      v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    -[NUCGAuxiliaryImageProperties auxiliaryImageTypeCGIdentifier](self, "auxiliaryImageTypeCGIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0CBC718]))
    {

    }
    else
    {
      -[NUCGAuxiliaryImageProperties auxiliaryImageTypeCGIdentifier](self, "auxiliaryImageTypeCGIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0CBC710]);

      if (!v22)
        goto LABEL_25;
    }
    if (!ImageIOLibraryCore_frameworkLibrary)
    {
      *(_OWORD *)buf = xmmword_1E5060DB0;
      *(_QWORD *)&buf[16] = 0;
      ImageIOLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (ImageIOLibraryCore_frameworkLibrary && getCGImageSourceCopyAuxiliaryDataInfoAtIndexWithOptionsSymbolLoc())
    {
      -[NUCGAuxiliaryImageProperties auxiliaryImageTypeCGIdentifier](self, "auxiliaryImageTypeCGIdentifier");
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CGImageSourceCopyAuxiliaryDataInfoAtIndexWithOptionsSymbolLoc = (uint64_t (*)(id, _QWORD, __CFString *, void *))getCGImageSourceCopyAuxiliaryDataInfoAtIndexWithOptionsSymbolLoc();
      if (!CGImageSourceCopyAuxiliaryDataInfoAtIndexWithOptionsSymbolLoc)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFDictionaryRef soft_CGImageSourceCopyAuxiliaryDataInfoAtIndexWithOptions(CGImageSourceRef, size_t, CFStringRef, CFDictionaryRef _Nullable)");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, CFSTR("NURenderSourceNode+CGImage.m"), 44, CFSTR("%s"), dlerror());

        __break(1u);
      }
      v25 = (CFDictionaryRef)CGImageSourceCopyAuxiliaryDataInfoAtIndexWithOptionsSymbolLoc(WeakRetained, 0, v23, &unk_1E50A34F8);
LABEL_26:
      v6 = v25;

      if (v6)
      {
LABEL_5:
        -[NUCGAuxiliaryImageProperties auxiliaryImageTypeCGIdentifier](self, "auxiliaryImageTypeCGIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CBC718]))
        {
          v10 = -[NUCGAuxiliaryImageProperties compatibilityMetadata](self, "compatibilityMetadata");

          if (!v10)
          {
LABEL_9:
            -[NUCGAuxiliaryImageProperties setAuxImage:](self, "setAuxImage:", 0);
            -[NUCGAuxiliaryImageProperties setAuxCGInfoDictionary:](self, "setAuxCGInfoDictionary:", v6);
            if (!self->_auxDataInfoMetadata)
            {
              -[NUCGAuxiliaryImageProperties auxCGInfoDictionary](self, "auxCGInfoDictionary");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC6D0]);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              auxDataInfoMetadata = self->_auxDataInfoMetadata;
              self->_auxDataInfoMetadata = v14;

            }
            -[NUCGAuxiliaryImageProperties auxInfoColorSpace](self, "auxInfoColorSpace");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v16)
            {
              objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC6B8]);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (v17)
              {
                v18 = -[NUColorSpace initWithCGColorSpace:]([NUColorSpace alloc], "initWithCGColorSpace:", v17);
                -[NUCGAuxiliaryImageProperties setAuxInfoColorSpace:](self, "setAuxInfoColorSpace:", v18);

              }
            }
            return v6;
          }
          v9 = (void *)objc_msgSend(v6, "mutableCopy");
          v11 = -[NUCGAuxiliaryImageProperties compatibilityMetadata](self, "compatibilityMetadata");
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CBC6D8]);
          v12 = objc_msgSend(v9, "copy");

          v6 = (void *)v12;
        }

        goto LABEL_9;
      }
      goto LABEL_27;
    }
LABEL_25:
    -[NUCGAuxiliaryImageProperties auxiliaryImageTypeCGIdentifier](self, "auxiliaryImageTypeCGIdentifier");
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v25 = CGImageSourceCopyAuxiliaryDataInfoAtIndex((CGImageSourceRef)WeakRetained, 0, v23);
    goto LABEL_26;
  }
  return v6;
}

- (id)auxiliaryImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  NSObject *v12;
  void *v13;
  void *specific;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
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
  v8 = a3;
  if (!a4)
  {
    NUAssertLogger_2145();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "subsampleFactor != NULL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v13;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2145();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = (void *)MEMORY[0x1E0CB3978];
        v21 = v19;
        objc_msgSend(v20, "callStackSymbols");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v19;
        v30 = 2114;
        v31 = v23;
        _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v18;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCGAuxiliaryImageProperties auxiliaryImageWithSourceOptions:subsampleFactor:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 1402, CFSTR("Invalid parameter not satisfying: %s"), v24, v25, v26, v27, (uint64_t)"subsampleFactor != NULL");
  }
  v9 = v8;
  *a4 = 1;
  -[NUCGAuxiliaryImageProperties auxiliaryImage:](self, "auxiliaryImage:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)auxiliaryImage:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  const __CFString *v14;
  NSObject *v16;
  void *v17;
  void *specific;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_2145();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v17;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2145();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v24 = (void *)MEMORY[0x1E0CB3978];
        v25 = v23;
        objc_msgSend(v24, "callStackSymbols");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v23;
        v34 = 2114;
        v35 = v27;
        _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v22;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCGAuxiliaryImageProperties auxiliaryImage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 1410, CFSTR("Invalid parameter not satisfying: %s"), v28, v29, v30, v31, (uint64_t)"error != NULL");
  }
  -[NUCGAuxiliaryImageProperties auxImage](self, "auxImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[NUCGAuxiliaryImageProperties auxiliaryCoreGraphicsInfoDictionary:](self, "auxiliaryCoreGraphicsInfoDictionary:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[NUCGAuxiliaryImageProperties auxiliaryImageTypeCGIdentifier](self, "auxiliaryImageTypeCGIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[NUAuxiliaryImageFactory auxiliaryImageFromCoreGraphicsInfoDictionary:forCGAuxiliaryImageTypeString:error:](NUAuxiliaryImageFactory, "auxiliaryImageFromCoreGraphicsInfoDictionary:forCGAuxiliaryImageTypeString:error:", v7, v8, a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[NUCGAuxiliaryImageProperties setAuxCGInfoDictionary:](self, "setAuxCGInfoDictionary:", 0);
        -[NUCGAuxiliaryImageProperties setAuxImage:](self, "setAuxImage:", v9);
        if (objc_msgSend(v9, "auxiliaryImageType") == 2)
        {
          -[NUCGAuxiliaryImageProperties auxImage](self, "auxImage");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "underlyingAVDepthData");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "cameraCalibrationData");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[NUCGAuxiliaryImageProperties setDepthCamCalibrationData:](self, "setDepthCamCalibrationData:", v12);

        }
        v6 = v9;
        goto LABEL_12;
      }
      v13 = *a3;
      v14 = CFSTR("Cannot create auxiliaryImage. NUAuxiliaryImageFactory failed.");
    }
    else
    {
      v13 = *a3;
      v14 = CFSTR("Cannot create auxiliaryImage. Missing dictionary.");
    }
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 7, v14, self, v13);
    v6 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

    goto LABEL_13;
  }
  v6 = v5;
LABEL_13:

  return v6;
}

- (id)depthCameraCalibrationData
{
  AVCameraCalibrationData *depthCamCalibrationData;
  void *v5;
  id v6;
  AVCameraCalibrationData *v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  depthCamCalibrationData = self->_depthCamCalibrationData;
  if (depthCamCalibrationData)
    return depthCamCalibrationData;
  v9 = 0;
  -[NUCGAuxiliaryImageProperties auxiliaryImage:](self, "auxiliaryImage:", &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (v5)
  {
    v7 = self->_depthCamCalibrationData;
  }
  else
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_418);
    v8 = _NURenderLogger;
    if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v6;
      _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "failed to get cameraCalibrationData. error: %@", buf, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NUCGAuxiliaryImageProperties auxiliaryImageTypeCGIdentifier](self, "auxiliaryImageTypeCGIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NUCGAuxiliaryImageProperties size](self, "size");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%ld, %ld}"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<NUCGAuxiliaryImageProperties:%p> type=%@ size=%@"), self, v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)auxiliaryImagePropertiesByUpdatingMetadata:(CGImageMetadata *)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v4 = (void *)-[NUCGAuxiliaryImageProperties copy](self, "copy");
  objc_msgSend(v4, "setAuxDataInfoMetadata:", a3);
  v10 = 0;
  v5 = (id)objc_msgSend(v4, "auxiliaryCoreGraphicsInfoDictionary:", &v10);
  objc_msgSend(v4, "auxCGInfoDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "setObject:forKeyedSubscript:", a3, *MEMORY[0x1E0CBC6D0]);
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setAuxCGInfoDictionary:", v8);

  return v4;
}

- (NSString)auxiliaryImageTypeCGIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
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

- (CGImageMetadata)compatibilityMetadata
{
  return self->_compatibilityMetadata;
}

- (void)setCompatibilityMetadata:(CGImageMetadata *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSDictionary)auxCGInfoDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAuxCGInfoDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NUAuxiliaryImage)auxImage
{
  return (NUAuxiliaryImage *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAuxImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (AVCameraCalibrationData)depthCamCalibrationData
{
  return (AVCameraCalibrationData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDepthCamCalibrationData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (id)auxDataInfoMetadata
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setAuxDataInfoMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NUColorSpace)auxInfoColorSpace
{
  return (NUColorSpace *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAuxInfoColorSpace:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxInfoColorSpace, 0);
  objc_storeStrong(&self->_auxDataInfoMetadata, 0);
  objc_storeStrong((id *)&self->_depthCamCalibrationData, 0);
  objc_storeStrong((id *)&self->_auxImage, 0);
  objc_storeStrong((id *)&self->_auxCGInfoDictionary, 0);
  objc_storeStrong((id *)&self->_auxiliaryImageTypeCGIdentifier, 0);
  objc_destroyWeak(&self->_imageSource);
}

@end
