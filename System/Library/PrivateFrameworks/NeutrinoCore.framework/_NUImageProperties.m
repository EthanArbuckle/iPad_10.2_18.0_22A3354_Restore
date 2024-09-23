@implementation _NUImageProperties

- (BOOL)isHDR
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[_NUImageProperties colorSpace](self, "colorSpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHDR");

  if ((v4 & 1) != 0)
    return 1;
  -[_NUImageProperties colorSpace](self, "colorSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isExtended");

  return (v6 & 1) != 0
      || +[NUGlobalSettings allAssetsCanUseHDRPipeline](NUGlobalSettings, "allAssetsCanUseHDRPipeline");
}

- (BOOL)hasGainMap
{
  void *v2;
  BOOL v3;

  -[_NUImageProperties auxiliaryImagePropertiesForType:](self, "auxiliaryImagePropertiesForType:", 7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (double)gainMapHeadroom
{
  _NUImageProperties *v2;
  NSNumber *gainMapHeadroomValue;
  void *v4;
  uint64_t v5;
  NSNumber *v6;
  double v7;
  double v8;

  v2 = self;
  objc_sync_enter(v2);
  gainMapHeadroomValue = v2->_gainMapHeadroomValue;
  if (!gainMapHeadroomValue)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[_NUImageProperties _computeGainMapHeadroom](v2, "_computeGainMapHeadroom");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v2->_gainMapHeadroomValue;
    v2->_gainMapHeadroomValue = (NSNumber *)v5;

    gainMapHeadroomValue = v2->_gainMapHeadroomValue;
  }
  -[NSNumber doubleValue](gainMapHeadroomValue, "doubleValue");
  v8 = v7;
  objc_sync_exit(v2);

  return v8;
}

- (void)setGainMapHeadroom:(double)a3
{
  uint64_t v4;
  NSNumber *gainMapHeadroomValue;
  _NUImageProperties *obj;

  obj = self;
  objc_sync_enter(obj);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  gainMapHeadroomValue = obj->_gainMapHeadroomValue;
  obj->_gainMapHeadroomValue = (NSNumber *)v4;

  -[_NUImageProperties _updateGainMapHeadroomMetadata:](obj, "_updateGainMapHeadroomMetadata:", a3);
  objc_sync_exit(obj);

}

- (double)_computeGainMapHeadroom
{
  void *v3;
  void *v4;
  float v5;
  float v6;
  float v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;

  -[_NUImageProperties flexRangeProperties](self, "flexRangeProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    *(double *)&v17 = 1.0;
    -[_NUImageProperties auxiliaryImagePropertiesForType:](self, "auxiliaryImagePropertiesForType:", 7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v8 = 1.0;
    if (!v9)
      goto LABEL_13;
    v11 = objc_msgSend(v9, "auxiliaryDataInfoMetadata");
    if (!v11)
      goto LABEL_13;
    v12 = v11;
    objc_msgSend((id)objc_opt_class(), "versionFromMeteorPlusMetadata:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "major") <= 1)
    {
      if (objc_msgSend(v13, "major") < 1)
      {
LABEL_12:

        v8 = *(double *)&v17;
LABEL_13:

        goto LABEL_14;
      }
    }
    else if ((objc_msgSend((id)objc_opt_class(), "getGainMapHeadroom:fromMetadata:", &v17, v12) & 1) != 0)
    {
      goto LABEL_12;
    }
    -[_NUImageProperties metadata](self, "metadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCF70]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      objc_msgSend((id)objc_opt_class(), "getGainMapHeadroom:fromMakerNote:", &v17, v15);

    goto LABEL_12;
  }
  objc_msgSend(v3, "baseHeadroom");
  v6 = v5;
  objc_msgSend(v4, "alternateHeadroom");
  v8 = exp2f(fmaxf(v6, v7));
LABEL_14:

  return v8;
}

- (void)_updateGainMapHeadroomMetadata:(double)a3
{
  void *v5;
  const CGImageMetadata *v6;
  void *v7;
  CGMutableImageMetadataRef MutableCopy;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[_NUImageProperties auxiliaryImagePropertiesForType:](self, "auxiliaryImagePropertiesForType:", 7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v12 = v5;
    v6 = (const CGImageMetadata *)objc_msgSend(v5, "auxiliaryDataInfoMetadata");
    v5 = v12;
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "versionFromMeteorPlusMetadata:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "major") >= 2)
      {
        MutableCopy = CGImageMetadataCreateMutableCopy(v6);
        if (objc_msgSend((id)objc_opt_class(), "setGainMapHeadroom:toMetadata:", MutableCopy, a3))
          -[_NUImageProperties _updateGainMapMetadata:](self, "_updateGainMapMetadata:", MutableCopy);
        CFRelease(MutableCopy);
      }
      -[_NUImageProperties metadata](self, "metadata");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCF70]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "mutableCopy");

      if (v11 && objc_msgSend((id)objc_opt_class(), "setGainMapHeadroom:toMakerNote:", v11, a3))
        -[_NUImageProperties _updateMakerNote:](self, "_updateMakerNote:", v11);

      v5 = v12;
    }
  }

}

- (void)_updateMakerNote:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[_NUImageProperties metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "mutableCopy");

  v6 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CBCF70]);

  v7 = (void *)objc_msgSend(v8, "copy");
  -[_NUImageProperties setMetadata:](self, "setMetadata:", v7);

}

- (void)_updateGainMapMetadata:(CGImageMetadata *)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[_NUImageProperties auxiliaryImagePropertiesForType:](self, "auxiliaryImagePropertiesForType:", 7);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    NUAssertLogger_2784();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected gain map properties"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2784();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v14 = (void *)MEMORY[0x1E0CB3978];
        v15 = v13;
        objc_msgSend(v14, "callStackSymbols");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v13;
        v26 = 2114;
        v27 = v17;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[_NUImageProperties _updateGainMapMetadata:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageProperties.m", 206, CFSTR("Unexpected gain map properties"), v18, v19, v20, v21, v22);
  }
  objc_msgSend(v23, "auxiliaryImagePropertiesByUpdatingMetadata:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUImageProperties setAuxiliaryImageProperties:forType:](self, "setAuxiliaryImageProperties:forType:", v5, 7);

}

- (NUVersion)meteorPlusGainMapVersion
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  -[_NUImageProperties auxiliaryImagePropertiesForType:](self, "auxiliaryImagePropertiesForType:", 7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (v4 = objc_msgSend(v2, "auxiliaryDataInfoMetadata")) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "versionFromMeteorPlusMetadata:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (NUVersion *)v5;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  int64_t v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[_NUImageProperties url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUImageProperties metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUImageProperties colorSpace](self, "colorSpace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_NUImageProperties size](self, "size");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%ld, %ld}"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_NUImageProperties orientation](self, "orientation");
  if ((unint64_t)(v11 - 9) >= 0xFFFFFFFFFFFFFFF8)
    v12 = v11;
  else
    v12 = 0;
  v13 = NUOrientationName_names[v12];
  -[_NUImageProperties fileUTI](self, "fileUTI");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUImageProperties rawProperties](self, "rawProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> url=%@ metadata=%@ colorSpace=%@ size=%@ orientation=%@ fileUTI=%@ raw=%@ aux=%@"), v4, self, v5, v6, v7, v10, v13, v14, v15, self->_auxiliaryImagesProperties);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[_NUImageProperties initWithProperties:]([_NUImageProperties alloc], "initWithProperties:", self);
}

- (_NUImageProperties)init
{
  _NUImageProperties *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *auxiliaryImagesProperties;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_NUImageProperties;
  v2 = -[_NUImageProperties init](&v6, sel_init);
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  auxiliaryImagesProperties = v2->_auxiliaryImagesProperties;
  v2->_auxiliaryImagesProperties = v3;

  return v2;
}

- (_NUImageProperties)initWithProperties:(id)a3
{
  id *v4;
  id *v5;
  _NUImageProperties *v6;
  uint64_t v7;
  NSURL *url;
  void *v9;
  uint64_t v10;
  NSDictionary *metadata;
  uint64_t v12;
  NUColorSpace *colorSpace;
  int64_t v14;
  uint64_t v15;
  NSString *fileUTI;
  void *v17;
  uint64_t v18;
  NUSemanticStyleProperties *semanticStyleProperties;
  uint64_t v20;
  NSMutableDictionary *auxiliaryImagesProperties;
  uint64_t v22;
  NUFlexRangeProperties *flexRangeProperties;
  uint64_t v24;
  NURAWImageProperties *rawProperties;
  NSObject *v27;
  void *v28;
  void *specific;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  objc_super v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  if (!v4)
  {
    NUAssertLogger_2784();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "properties != nil");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v61 = v28;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2784();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v31)
      {
        v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v42 = (void *)MEMORY[0x1E0CB3978];
        v43 = v41;
        objc_msgSend(v42, "callStackSymbols");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "componentsJoinedByString:", CFSTR("\n"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v61 = v41;
        v62 = 2114;
        v63 = v45;
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
      v61 = v33;
      _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[_NUImageProperties initWithProperties:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageProperties.m", 405, CFSTR("Invalid parameter not satisfying: %s"), v46, v47, v48, v49, (uint64_t)"properties != nil");
  }
  v5 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    NUAssertLogger_2784();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "[properties isKindOfClass:_NUImageProperties.class]");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v61 = v35;
      _os_log_error_impl(&dword_1A6553000, v34, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2784();
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);
    if (v36)
    {
      if (v38)
      {
        v50 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v51 = (void *)MEMORY[0x1E0CB3978];
        v52 = v50;
        objc_msgSend(v51, "callStackSymbols");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "componentsJoinedByString:", CFSTR("\n"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v61 = v50;
        v62 = 2114;
        v63 = v54;
        _os_log_error_impl(&dword_1A6553000, v37, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v38)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "componentsJoinedByString:", CFSTR("\n"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v61 = v40;
      _os_log_error_impl(&dword_1A6553000, v37, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[_NUImageProperties initWithProperties:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageProperties.m", 406, CFSTR("Invalid parameter not satisfying: %s"), v55, v56, v57, v58, (uint64_t)"[properties isKindOfClass:_NUImageProperties.class]");
  }
  v59.receiver = self;
  v59.super_class = (Class)_NUImageProperties;
  v6 = -[_NUImageProperties init](&v59, sel_init);
  objc_msgSend(v5, "url");
  v7 = objc_claimAutoreleasedReturnValue();
  url = v6->_url;
  v6->_url = (NSURL *)v7;

  objc_msgSend(v5, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copy");
  metadata = v6->_metadata;
  v6->_metadata = (NSDictionary *)v10;

  objc_msgSend(v5, "colorSpace");
  v12 = objc_claimAutoreleasedReturnValue();
  colorSpace = v6->_colorSpace;
  v6->_colorSpace = (NUColorSpace *)v12;

  v6->_size.width = objc_msgSend(v5, "size");
  v6->_size.height = v14;
  v6->_orientation = objc_msgSend(v5, "orientation");
  objc_msgSend(v5, "fileUTI");
  v15 = objc_claimAutoreleasedReturnValue();
  fileUTI = v6->_fileUTI;
  v6->_fileUTI = (NSString *)v15;

  v6->_alphaInfo = objc_msgSend(v5, "alphaInfo");
  v6->_componentInfo = objc_msgSend(v5, "componentInfo");
  objc_msgSend(v5, "semanticStyleProperties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "copy");
  semanticStyleProperties = v6->_semanticStyleProperties;
  v6->_semanticStyleProperties = (NUSemanticStyleProperties *)v18;

  v20 = objc_msgSend(v5[2], "mutableCopy");
  auxiliaryImagesProperties = v6->_auxiliaryImagesProperties;
  v6->_auxiliaryImagesProperties = (NSMutableDictionary *)v20;

  v22 = objc_msgSend(v5[11], "copy");
  flexRangeProperties = v6->_flexRangeProperties;
  v6->_flexRangeProperties = (NUFlexRangeProperties *)v22;

  objc_msgSend(v5, "rawProperties");
  v24 = objc_claimAutoreleasedReturnValue();
  rawProperties = v6->_rawProperties;
  v6->_rawProperties = (NURAWImageProperties *)v24;

  return v6;
}

- (id)auxiliaryImagePropertiesForType:(int64_t)a3
{
  NSMutableDictionary *auxiliaryImagesProperties;
  __CFString *v4;
  __CFString *v5;
  void *v6;

  auxiliaryImagesProperties = self->_auxiliaryImagesProperties;
  if ((unint64_t)a3 > 0xC)
    v4 = CFSTR("Invalid");
  else
    v4 = off_1E5060F88[a3];
  v5 = v4;
  -[NSMutableDictionary objectForKeyedSubscript:](auxiliaryImagesProperties, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setAuxiliaryImageProperties:(id)a3 forType:(int64_t)a4
{
  NSMutableDictionary *auxiliaryImagesProperties;
  id v6;
  __CFString *v7;
  __CFString *v8;

  auxiliaryImagesProperties = self->_auxiliaryImagesProperties;
  v6 = a3;
  if ((unint64_t)a4 > 0xC)
    v7 = CFSTR("Invalid");
  else
    v7 = off_1E5060F88[a4];
  v8 = v7;
  -[NSMutableDictionary setObject:forKeyedSubscript:](auxiliaryImagesProperties, "setObject:forKeyedSubscript:", v6, v8);

}

- (void)resetAuxiliaryImageProperties
{
  -[NSMutableDictionary removeAllObjects](self->_auxiliaryImagesProperties, "removeAllObjects");
}

- (void)enumerateAuxiliaryImageProperties:(id)a3
{
  id v4;
  NSMutableDictionary *auxiliaryImagesProperties;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  auxiliaryImagesProperties = self->_auxiliaryImagesProperties;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56___NUImageProperties_enumerateAuxiliaryImageProperties___block_invoke;
  v7[3] = &unk_1E5060E50;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](auxiliaryImagesProperties, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUrl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (NUColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (void)setColorSpace:(id)a3
{
  objc_storeStrong((id *)&self->_colorSpace, a3);
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

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (NSString)fileUTI
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFileUTI:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (int64_t)alphaInfo
{
  return self->_alphaInfo;
}

- (void)setAlphaInfo:(int64_t)a3
{
  self->_alphaInfo = a3;
}

- (int64_t)componentInfo
{
  return self->_componentInfo;
}

- (void)setComponentInfo:(int64_t)a3
{
  self->_componentInfo = a3;
}

- (NURAWImageProperties)rawProperties
{
  return (NURAWImageProperties *)objc_getProperty(self, a2, 80, 1);
}

- (void)setRawProperties:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NUFlexRangeProperties)flexRangeProperties
{
  return (NUFlexRangeProperties *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFlexRangeProperties:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NUSemanticStyleProperties)semanticStyleProperties
{
  return (NUSemanticStyleProperties *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSemanticStyleProperties:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semanticStyleProperties, 0);
  objc_storeStrong((id *)&self->_flexRangeProperties, 0);
  objc_storeStrong((id *)&self->_rawProperties, 0);
  objc_storeStrong((id *)&self->_fileUTI, 0);
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_auxiliaryImagesProperties, 0);
  objc_storeStrong((id *)&self->_gainMapHeadroomValue, 0);
}

+ (id)versionFromFlexRangeMetadata:(CGImageMetadata *)a3
{
  __CFString *v5;
  CGImageMetadataTagRef v6;
  void *v7;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("HDRToneMap"), CFSTR("Version"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v6 = CGImageMetadataCopyTagWithPath(a3, 0, v5);
    if (v6)
    {
      objc_msgSend(a1, "versionFromMetadataTag:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)versionFromMeteorPlusMetadata:(CGImageMetadata *)a3
{
  __CFString *v5;
  CGImageMetadataTagRef v6;
  void *v7;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("HDRGainMap"), CFSTR("HDRGainMapVersion"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v6 = CGImageMetadataCopyTagWithPath(a3, 0, v5);
    if (v6)
    {
      objc_msgSend(a1, "versionFromMetadataTag:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)versionFromMetadataTag:(CGImageMetadataTag *)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (id)CGImageMetadataTagCopyValue(a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[NUVersion versionWithPackedUInt32:](NUVersion, "versionWithPackedUInt32:", objc_msgSend(v3, "integerValue"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_585);
    v5 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = v3;
      _os_log_impl(&dword_1A6553000, v5, OS_LOG_TYPE_DEFAULT, "Invalid HDRGainMap version tag value: %{public}@", (uint8_t *)&v7, 0xCu);
    }
    v4 = 0;
  }

  return v4;
}

+ (BOOL)getGainMapHeadroom:(double *)a3 fromMetadata:(CGImageMetadata *)a4
{
  __CFString *v6;
  CGImageMetadataTag *v7;
  CGImageMetadataTag *v8;
  __CFString *v9;
  char isKindOfClass;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v15;
  __CFString *v16;
  void *specific;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  CGImageMetadata *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  __CFString *v32;
  __int16 v33;
  CGImageMetadata *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    NUAssertLogger_2784();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "metadata != NULL");
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v16;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2784();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v22 = (__CFString *)dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v23 = (void *)MEMORY[0x1E0CB3978];
        v24 = v22;
        objc_msgSend(v23, "callStackSymbols");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
        v26 = (CGImageMetadata *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v22;
        v33 = 2114;
        v34 = v26;
        _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v21;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUImageProperties getGainMapHeadroom:fromMetadata:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageProperties.m", 259, CFSTR("Invalid parameter not satisfying: %s"), v27, v28, v29, v30, (uint64_t)"metadata != NULL");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("HDRGainMap"), CFSTR("HDRGainMapHeadroom"));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = CGImageMetadataCopyTagWithPath(a4, 0, v6);
  v8 = v7;
  if (v7)
  {
    v9 = (__CFString *)CGImageMetadataTagCopyValue(v7);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {
      -[__CFString doubleValue](v9, "doubleValue");
      if (a3)
        *(_QWORD *)a3 = v11;
    }
    else
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_585);
      v13 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v32 = v9;
        _os_log_impl(&dword_1A6553000, v13, OS_LOG_TYPE_DEFAULT, "Invalid gain map headroom tag value: %{public}@", buf, 0xCu);
      }
    }

  }
  else
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_585);
    v12 = _NULogger;
    isKindOfClass = 0;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v32 = v6;
      v33 = 2114;
      v34 = a4;
      _os_log_impl(&dword_1A6553000, v12, OS_LOG_TYPE_DEFAULT, "Failed to get metadata tag %{public}@ from metadata: %{public}@", buf, 0x16u);
      isKindOfClass = 0;
    }
  }

  return isKindOfClass & 1;
}

+ (BOOL)setGainMapHeadroom:(double)a3 toMetadata:(CGImageMetadata *)a4
{
  void *v5;
  __CFString *v6;
  CGImageMetadataTag *v7;
  BOOL v8;
  NSObject *v9;
  const char *v10;
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
  if (!a4)
  {
    NUAssertLogger_2784();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "metadata != NULL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v13;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2784();
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
    _NUAssertFailHandler((uint64_t)"+[_NUImageProperties setGainMapHeadroom:toMetadata:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageProperties.m", 285, CFSTR("Invalid parameter not satisfying: %s"), v24, v25, v26, v27, (uint64_t)"metadata != NULL");
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("HDRGainMap"), CFSTR("HDRGainMapHeadroom"));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = CGImageMetadataTagCreate(CFSTR("http://ns.apple.com/HDRGainMap/1.0/"), CFSTR("HDRGainMap"), CFSTR("HDRGainMapHeadroom"), kCGImageMetadataTypeDefault, v5);
  if (v7)
  {
    if (CGImageMetadataSetTagWithPath(a4, 0, v6, v7))
    {
      v8 = 1;
      goto LABEL_14;
    }
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_585);
    v9 = _NULogger;
    v8 = 0;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v10 = "Failed to set HDRGainMap metadata headroom tag!";
      goto LABEL_13;
    }
  }
  else
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_585);
    v9 = _NULogger;
    v8 = 0;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v10 = "Failed to make HDRGainMap metadata headroom tag!";
LABEL_13:
      _os_log_impl(&dword_1A6553000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 2u);
      v8 = 0;
    }
  }
LABEL_14:

  return v8;
}

+ (BOOL)getGainMapHeadroom:(double *)a3 fromMakerNote:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  BOOL v13;
  NSObject *v15;
  void *v16;
  void *specific;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (!v5)
  {
    NUAssertLogger_2784();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "makerNote != NULL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v16;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2784();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v23 = (void *)MEMORY[0x1E0CB3978];
        v24 = v22;
        objc_msgSend(v23, "callStackSymbols");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v22;
        v33 = 2114;
        v34 = v26;
        _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v21;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUImageProperties getGainMapHeadroom:fromMakerNote:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageProperties.m", 305, CFSTR("Invalid parameter not satisfying: %s"), v27, v28, v29, v30, (uint64_t)"makerNote != NULL");
  }
  v6 = v5;
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C89CA0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C89CA8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v7, "doubleValue");
    v10 = v9;
    objc_msgSend(v8, "doubleValue");
    objc_msgSend(MEMORY[0x1E0D75130], "gainMapHeadroomForHDRGain:gainMapValue:", v10, v11);
    if (a3)
      *(_QWORD *)a3 = v12;
    v13 = 1;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)setGainMapHeadroom:(double)a3 toMakerNote:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v11;
  void *v12;
  void *specific;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  _BYTE buf[12];
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!v6)
  {
    NUAssertLogger_2784();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "makerNote != NULL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v12;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2784();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v19 = (void *)MEMORY[0x1E0CB3978];
        v20 = v18;
        objc_msgSend(v19, "callStackSymbols");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v18;
        v29 = 2114;
        v30 = v22;
        _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v17;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUImageProperties setGainMapHeadroom:toMakerNote:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageProperties.m", 325, CFSTR("Invalid parameter not satisfying: %s"), v23, v24, v25, v26, (uint64_t)"makerNote != NULL");
  }
  v7 = v6;
  v27 = 0.0;
  *(_QWORD *)buf = 0;
  objc_msgSend(a1, "_computeMeteorPlusGain:gainMapValue:forContentHeadroom:", buf, &v27, a3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)buf);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0C89CA0]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0C89CA8]);

  return 1;
}

+ (void)_computeMeteorPlusGain:(double *)a3 gainMapValue:(double *)a4 forContentHeadroom:(double)a5
{
  double v8;
  double v9;
  NSObject *v10;
  void *v11;
  void *specific;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_2784();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "outGain != NULL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v59 = v11;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2784();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v32 = (void *)MEMORY[0x1E0CB3978];
        v33 = v31;
        objc_msgSend(v32, "callStackSymbols");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v59 = v31;
        v60 = 2114;
        v61 = v35;
        _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v59 = v16;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUImageProperties _computeMeteorPlusGain:gainMapValue:forContentHeadroom:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageProperties.m", 341, CFSTR("Invalid parameter not satisfying: %s"), v36, v37, v38, v39, (uint64_t)"outGain != NULL");
  }
  if (!a4)
  {
    NUAssertLogger_2784();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "outValue != NULL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v59 = v18;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2784();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (v19)
    {
      if (v21)
      {
        v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v41 = (void *)MEMORY[0x1E0CB3978];
        v42 = v40;
        objc_msgSend(v41, "callStackSymbols");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "componentsJoinedByString:", CFSTR("\n"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v59 = v40;
        v60 = 2114;
        v61 = v44;
        _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v59 = v23;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUImageProperties _computeMeteorPlusGain:gainMapValue:forContentHeadroom:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageProperties.m", 342, CFSTR("Invalid parameter not satisfying: %s"), v45, v46, v47, v48, (uint64_t)"outValue != NULL");
  }
  if (a5 < 1.0)
  {
    NUAssertLogger_2784();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "headroom >= 1.0");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v59 = v25;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2784();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (v26)
    {
      if (v28)
      {
        v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v50 = (void *)MEMORY[0x1E0CB3978];
        v51 = v49;
        objc_msgSend(v50, "callStackSymbols");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "componentsJoinedByString:", CFSTR("\n"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v59 = v49;
        v60 = 2114;
        v61 = v53;
        _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v28)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v59 = v30;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[_NUImageProperties _computeMeteorPlusGain:gainMapValue:forContentHeadroom:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageProperties.m", 343, CFSTR("Invalid parameter not satisfying: %s"), v54, v55, v56, v57, (uint64_t)"headroom >= 1.0");
  }
  v8 = log2(a5);
  *a3 = a5;
  if (v8 <= 2.3)
    v9 = (2.3 - v8) * 0.99 / 0.3;
  else
    v9 = (v8 + -2.3) * 0.01 / -0.7;
  *a4 = v9 + 0.01;
}

+ (CGImageMetadata)createGainMapMetadataWithHeadroom:(double)a3
{
  CGMutableImageMetadataRef Mutable;
  void *v5;
  CGImageMetadataTag *v6;
  __CFString *v7;
  void *v8;
  CGImageMetadataTag *v9;
  __CFString *v10;
  CGImageMetadata *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v16[16];
  uint8_t v17[16];
  uint8_t buf[16];

  Mutable = CGImageMetadataCreateMutable();
  if (CGImageMetadataRegisterNamespaceForPrefix(Mutable, CFSTR("http://ns.apple.com/HDRGainMap/1.0/"), CFSTR("HDRGainMap"), 0))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0x20000);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = CGImageMetadataTagCreate(CFSTR("http://ns.apple.com/HDRGainMap/1.0/"), CFSTR("HDRGainMap"), CFSTR("HDRGainMapVersion"), kCGImageMetadataTypeDefault, v5);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("HDRGainMap"), CFSTR("HDRGainMapVersion"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (CGImageMetadataSetTagWithPath(Mutable, 0, v7, v6))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CGImageMetadataTagCreate(CFSTR("http://ns.apple.com/HDRGainMap/1.0/"), CFSTR("HDRGainMap"), CFSTR("HDRGainMapHeadroom"), kCGImageMetadataTypeDefault, v8);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("HDRGainMap"), CFSTR("HDRGainMapHeadroom"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (CGImageMetadataSetTagWithPath(Mutable, 0, v10, v9))
      {
        v11 = Mutable;
      }
      else
      {
        if (_NULogOnceToken != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_585);
        v14 = _NULogger;
        if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v16 = 0;
          _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Failed to set HDRGainMap metadata headroom tag!", v16, 2u);
        }
        v11 = 0;
      }

    }
    else
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_585);
      v13 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v17 = 0;
        _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Failed to set HDRGainMap metadata version tag!", v17, 2u);
      }
      v11 = 0;
    }

  }
  else
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_585);
    v12 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Failed to register HDRGainMap metadata tag!", buf, 2u);
    }
    v11 = 0;
  }

  return v11;
}

@end
