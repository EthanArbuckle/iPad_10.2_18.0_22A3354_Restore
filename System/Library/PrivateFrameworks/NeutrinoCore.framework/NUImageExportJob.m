@implementation NUImageExportJob

- (NUImageExportJob)initWithImageExportRequest:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NUImageExportJob;
  return -[NUExportJob initWithExportRequest:](&v4, sel_initWithExportRequest_, a3);
}

- (NUImageExportJob)initWithExportRequest:(id)a3
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_11574);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_11574);
      goto LABEL_8;
    }
    if (v12 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_11574);
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
  _NUAssertFailHandler((uint64_t)"-[NUImageExportJob initWithExportRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageExportJob.m", 59, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v26, v27, v28, v29, v25);
}

- (id)_filterProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;

  v4 = a3;
  -[NUImageExportJob imageExportRequest](self, "imageExportRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "mutableCopy");

  if (objc_msgSend(v5, "applyOrientationAsMetadata"))
  {
    -[NURenderJob outputGeometry](self, "outputGeometry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "orientation");

  }
  else
  {
    v8 = 1;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v9, *MEMORY[0x1E0CBCFF0]);

  v10 = *MEMORY[0x1E0CBD090];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CBD090]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v13, *MEMORY[0x1E0CBD0C0]);

    objc_msgSend(v6, "setObject:forKey:", v12, v10);
  }
  v14 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v14, "objectForKey:", CFSTR("{TIFF}"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", CFSTR("Model"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "isEqualToString:", CFSTR("Apple Vision Pro")))
  {
    objc_msgSend(v14, "objectForKey:", CFSTR("{HEIF}"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", CFSTR("CameraExtrinsics"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "objectForKey:", CFSTR("{HEIF}"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", CFSTR("CameraModel"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v14, "objectForKey:", CFSTR("{HEIF}"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeObjectForKey:", CFSTR("CameraExtrinsics"));

    }
    if (v20)
    {
      objc_msgSend(v14, "objectForKey:", CFSTR("{HEIF}"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "removeObjectForKey:", CFSTR("CameraModel"));

    }
    v23 = v14;

    v6 = v23;
  }
  objc_msgSend(v5, "format");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addImageDestinationOptionsToImageProperties:", v6);

  v25 = v6;
  return v25;
}

- (id)imageDestinationOptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v10;
  void *v11;
  void *specific;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
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
  -[NUImageExportJob imageExportRequest](self, "imageExportRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[NURenderJob prepareNode](self, "prepareNode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      NUAssertLogger_11560();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing prepare node"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v29 = v11;
        _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger_11560();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v14)
        {
          v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v18 = (void *)MEMORY[0x1E0CB3978];
          v19 = v17;
          objc_msgSend(v18, "callStackSymbols");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v29 = v17;
          v30 = 2114;
          v31 = v21;
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
        v29 = v16;
        _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      _NUAssertFailHandler((uint64_t)"-[NUImageExportJob imageDestinationOptions]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageExportJob.m", 122, CFSTR("Missing prepare node"), v22, v23, v24, v25, v26);
    }
    -[NURenderJob prepareNode](self, "prepareNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(v6, "imageProperties:", &v27);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "metadata");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = (void *)MEMORY[0x1E0C9AA70];
    }

  }
  -[NUImageExportJob _filterProperties:](self, "_filterProperties:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)auxiliaryImageTypes
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[NUImageExportJob imageExportRequest](self, "imageExportRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "auxiliaryImageTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[NUImageExportRequest defaultAuxiliaryImageTypes](NUImageExportRequest, "defaultAuxiliaryImageTypes");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)auxiliaryImages
{
  NSObject *auxImageQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__11583;
  v10 = __Block_byref_object_dispose__11584;
  v11 = 0;
  auxImageQueue = self->_auxImageQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__NUImageExportJob_auxiliaryImages__block_invoke;
  v5[3] = &unk_1E5063FE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(auxImageQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)result
{
  void *v3;
  _NUImageExportResult *v4;
  void *v5;
  void *v6;

  -[NUImageExportJob imageExportRequest](self, "imageExportRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(_NUImageExportResult);
  if (objc_msgSend(v3, "renderToData"))
  {
    -[_NUImageExportResult setDestinationData:](v4, "setDestinationData:", self->_destinationData);
  }
  else
  {
    objc_msgSend(v3, "destinationURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NUExportResult setDestinationURL:](v4, "setDestinationURL:", v5);

  }
  -[NURenderJob outputGeometry](self, "outputGeometry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUExportResult setGeometry:](v4, "setGeometry:", v6);

  return v4;
}

- (BOOL)wantsOutputGeometry
{
  return 1;
}

- (BOOL)wantsOutputImage
{
  return 1;
}

- (id)prepareNodeWithPipelineState:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NUResetOrientationNode *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  NUHDRGainMapNode *v25;
  objc_super v27;

  v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)NUImageExportJob;
  -[NURenderJob prepareNodeWithPipelineState:error:](&v27, sel_prepareNodeWithPipelineState_error_, v6, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NUImageExportJob imageExportRequest](self, "imageExportRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "applyOrientationAsMetadata");

    if (v9)
    {
      objc_msgSend(v7, "outputImageGeometry:", a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v21 = 0;
        goto LABEL_24;
      }
      v11 = v10;
      v12 = objc_msgSend(v10, "orientation");
      v13 = 6;
      if (v12 != 8)
        v13 = v12;
      if (v12 == 6)
        v14 = 8;
      else
        v14 = v13;
      v15 = -[NUOrientationNode initWithOrientation:input:]([NUResetOrientationNode alloc], "initWithOrientation:input:", v14, v7);

      v7 = v15;
    }
  }
  if (+[NUGlobalSettings enableHDRSupport](NUGlobalSettings, "enableHDRSupport")
    && +[NUGlobalSettings renderMeteorPlusAsHDR](NUGlobalSettings, "renderMeteorPlusAsHDR"))
  {
    -[NUImageExportJob imageExportRequest](self, "imageExportRequest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageProperties:", a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "colorSpace");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = v18;
    }
    else
    {
      objc_msgSend(v17, "colorSpace");
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    v22 = v20;

    if (objc_msgSend(v6, "auxiliaryImageType") == 1
      && ((objc_msgSend(v22, "isHDR") & 1) != 0 || objc_msgSend(v22, "isExtended")))
    {
      if (objc_msgSend(v17, "hasGainMap"))
      {
        objc_msgSend(v17, "gainMapHeadroom");
        if (v23 > 1.0)
        {
          objc_msgSend(v17, "gainMapHeadroom");
          v25 = -[NUHDRGainMapNode initWithInput:contentHeadroom:displayHeadroom:]([NUHDRGainMapNode alloc], "initWithInput:contentHeadroom:displayHeadroom:", v7, v24, v24);

          v7 = v25;
        }
      }
    }

  }
  v7 = v7;
  v21 = v7;
LABEL_24:

  return v21;
}

- (id)evaluateRenderDependencies:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  uint64_t v27;
  NSObject *v28;
  OS_dispatch_queue *v29;
  OS_dispatch_queue *auxImageQueue;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  NUAuxiliaryImageRenderRequest *v36;
  void *v37;
  NUAuxiliaryImageRenderRequest *v38;
  id v39;
  void *v40;
  void *v41;
  id v43;
  void *v44;
  void *v45;
  id obj;
  id obja;
  id v48;
  _QWORD v49[4];
  id v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  id v60;
  objc_super v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v61.receiver = self;
  v61.super_class = (Class)NUImageExportJob;
  -[NURenderJob evaluateRenderDependencies:](&v61, sel_evaluateRenderDependencies_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NURenderJob prepareNode](self, "prepareNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 0;
    objc_msgSend(v6, "imageProperties:", &v60);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v60;

    v45 = (void *)v7;
    if (v7)
    {
      v43 = v8;
      -[NUImageExportJob imageExportRequest](self, "imageExportRequest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "auxImages");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "mutableCopy");
      v12 = v11;
      if (v11)
        v13 = v11;
      else
        v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v14 = v13;
      v44 = v5;

      obj = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      -[NUImageExportJob auxiliaryImageTypes](self, "auxiliaryImageTypes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v57;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v57 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v19);
            objc_msgSend(v14, "objectForKeyedSubscript:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = NUAuxiliaryImageTypeFromString(v20);
            if (!v21)
            {
              v23 = v22;
              objc_msgSend(v45, "auxiliaryImagePropertiesForType:", v22);
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              if (v24)
              {
                -[NURenderJob prepareNode](self, "prepareNode");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = objc_msgSend(v25, "canPropagateOriginalAuxiliaryData:", v23);

                if ((v26 & 1) == 0)
                  objc_msgSend(obj, "addObject:", v20);
              }
            }

            ++v19;
          }
          while (v17 != v19);
          v27 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
          v17 = v27;
        }
        while (v27);
      }

      objc_storeStrong((id *)&self->_auxImages, v14);
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (OS_dispatch_queue *)dispatch_queue_create("NUExportImageJob.auxiliaryImages", v28);
      auxImageQueue = self->_auxImageQueue;
      self->_auxImageQueue = v29;

      v48 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v44);
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      obja = obj;
      v31 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v53;
        do
        {
          for (i = 0; i != v32; ++i)
          {
            if (*(_QWORD *)v53 != v33)
              objc_enumerationMutation(obja);
            v35 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
            v36 = [NUAuxiliaryImageRenderRequest alloc];
            -[NURenderJob request](self, "request");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = -[NURenderRequest initWithRequest:](v36, "initWithRequest:", v37);

            -[NUAuxiliaryImageRenderRequest setAuxiliaryImageType:](v38, "setAuxiliaryImageType:", NUAuxiliaryImageTypeFromString(v35));
            -[NUAuxiliaryImageRenderRequest setSkipRenderIfNotRequired:](v38, "setSkipRenderIfNotRequired:", 1);
            -[NURenderRequest setResponseQueue:](v38, "setResponseQueue:", self->_auxImageQueue);
            v49[0] = MEMORY[0x1E0C809B0];
            v49[1] = 3221225472;
            v49[2] = __47__NUImageExportJob_evaluateRenderDependencies___block_invoke;
            v49[3] = &unk_1E5061F78;
            v50 = v14;
            v51 = v35;
            -[NURenderRequest setCompletionBlock:](v38, "setCompletionBlock:", v49);
            v39 = -[NUAuxiliaryImageRenderRequest newRenderJob](v38, "newRenderJob");
            -[NURenderJob prepareNode](self, "prepareNode");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "setPrepareNode:", v40);

            -[NURenderJob resolvedSpaceMap](self, "resolvedSpaceMap");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "setResolvedSpaceMap:", v41);

            objc_msgSend(v48, "addObject:", v39);
          }
          v32 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
        }
        while (v32);
      }

      v8 = v43;
      v5 = v44;
    }
    else
    {
      -[NURenderJob prepareNode](self, "prepareNode");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to get image properties"), v14, v8);
      v48 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v48 = 0;
  }

  return v48;
}

- (CGImage)copyCGImageWithIOSurface:(id)a3 fromRect:(CGRect)a4 colorSpace:(id)a5 error:(id *)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  int v27;
  uint64_t *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  CFPropertyListRef v38;
  CGImage *v39;
  NSObject *v41;
  void *v42;
  void *specific;
  NSObject *v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  _BOOL4 v52;
  void *v53;
  void *v54;
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
  __IOSurface *buffer;
  const __CFDictionary *theAttachments;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint8_t buf[4];
  void *v80;
  __int16 v81;
  void *v82;
  uint64_t v83;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v83 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  if (!a6)
  {
    NUAssertLogger_11560();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v80 = v42;
      _os_log_error_impl(&dword_1A6553000, v41, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_11560();
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v45)
      {
        v55 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v56 = (void *)MEMORY[0x1E0CB3978];
        v57 = v55;
        objc_msgSend(v56, "callStackSymbols");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "componentsJoinedByString:", CFSTR("\n"));
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v80 = v55;
        v81 = 2114;
        v82 = v59;
        _os_log_error_impl(&dword_1A6553000, v44, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v45)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "componentsJoinedByString:", CFSTR("\n"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v80 = v47;
      _os_log_error_impl(&dword_1A6553000, v44, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUImageExportJob copyCGImageWithIOSurface:fromRect:colorSpace:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageExportJob.m", 277, CFSTR("Invalid parameter not satisfying: %s"), v60, v61, v62, v63, (uint64_t)"error != nil");
  }
  v15 = v14;
  if (!v14)
  {
    NUAssertLogger_11560();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "colorSpace != nil");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v80 = v49;
      _os_log_error_impl(&dword_1A6553000, v48, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v50 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_11560();
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = os_log_type_enabled(v51, OS_LOG_TYPE_ERROR);
    if (v50)
    {
      if (v52)
      {
        v64 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v65 = (void *)MEMORY[0x1E0CB3978];
        v66 = v64;
        objc_msgSend(v65, "callStackSymbols");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "componentsJoinedByString:", CFSTR("\n"));
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v80 = v64;
        v81 = 2114;
        v82 = v68;
        _os_log_error_impl(&dword_1A6553000, v51, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v52)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "componentsJoinedByString:", CFSTR("\n"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v80 = v54;
      _os_log_error_impl(&dword_1A6553000, v51, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUImageExportJob copyCGImageWithIOSurface:fromRect:colorSpace:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageExportJob.m", 278, CFSTR("Invalid parameter not satisfying: %s"), v69, v70, v71, v72, (uint64_t)"colorSpace != nil");
  }
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_102);
  v16 = _NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6553000, v16, OS_LOG_TYPE_DEFAULT, "NUImageExportJob exporting with IOSurface", buf, 2u);
  }
  -[NURenderJob renderer:](self, "renderer:", a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v13, "extent");
    v19 = v18;
    v21 = v20;
    v22 = objc_msgSend(v15, "isHDR");
    v23 = vcvtpd_s64_f64(v19);
    v24 = vcvtpd_s64_f64(v21);
    if (v22)
      v25 = 2019963440;
    else
      v25 = 875704422;
    v26 = +[NUVideoUtilities newPixelBufferOfSize:format:](NUVideoUtilities, "newPixelBufferOfSize:format:", v23, v24, v25);
    if (v26)
    {
      v27 = objc_msgSend(v15, "isHDR");
      v28 = (uint64_t *)MEMORY[0x1E0CA8F00];
      if (!v27)
        v28 = (uint64_t *)MEMORY[0x1E0CA8F10];
      v29 = *v28;
      v77 = *MEMORY[0x1E0CA8EE8];
      v78 = v29;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
      theAttachments = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CVBufferSetAttachments((CVBufferRef)objc_msgSend(v26, "CVPixelBuffer"), theAttachments, kCVAttachmentMode_ShouldPropagate);
      buffer = CVPixelBufferGetIOSurface((CVPixelBufferRef)objc_msgSend(v26, "CVPixelBuffer"));
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDE8]), "initWithIOSurface:", buffer);
      objc_msgSend(v30, "setColorSpace:", objc_msgSend(v15, "CGColorSpace"));
      -[NURenderJob request](self, "request");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "name");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setLabel:", v32);

      objc_msgSend(v17, "context");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "startTaskToRender:fromRect:toDestination:atPoint:error:", v13, v30, a6, x, y, width, height, 0.0, 0.0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34;
      if (v34)
      {
        objc_msgSend(v34, "nu_waitUntilCompletedAndReturnError:", a6);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
        {
          v75 = *MEMORY[0x1E0CBD130];
          v76 = MEMORY[0x1E0C9AAB0];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = CGColorSpaceCopyPropertyList((CGColorSpaceRef)objc_msgSend(v15, "CGColorSpace"));
          if (v38)
          {
            IOSurfaceSetValue(buffer, (CFStringRef)*MEMORY[0x1E0CBBF90], v38);
            CFRelease(v38);
          }
          v39 = (CGImage *)CGImageCreateFromIOSurface();

        }
        else
        {
          +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("failed to waitUntilCompletedAndReturnError for image export"), 0, *a6);
          v39 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }

      }
      else
      {
        +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("failed to startTaskToRender for image export"), 0, *a6);
        v39 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 1, CFSTR("IOSurface path failed in image export"), 0);
      v39 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v39 = 0;
  }

  return v39;
}

- (BOOL)render:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  BOOL v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int isKindOfClass;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  NSData *v54;
  NSData *destinationData;
  NSData *v56;
  __CFString *v57;
  CGImageDestination *v58;
  void *v59;
  void *v60;
  __CFString *v61;
  const __CFDictionary *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  _BOOL8 v72;
  void *v73;
  id v74;
  const __CFDictionary *v75;
  __CFString *v76;
  int v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v83;
  NSObject *v84;
  void *v85;
  void *v86;
  void *v87;
  NSObject *v88;
  void *v89;
  void *v90;
  NSObject *v91;
  void *v92;
  void *specific;
  NSObject *v94;
  _BOOL4 v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  void *v108;
  CGImage *image;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v115;
  void *v116;
  id v118;
  id v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _QWORD v124[5];
  uint8_t v125[128];
  _BYTE buf[24];
  uint64_t (*v127)(uint64_t, uint64_t);
  void (*v128)(uint64_t);
  id v129;
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_11560();
    v91 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v92;
      _os_log_error_impl(&dword_1A6553000, v91, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_11560();
    v94 = objc_claimAutoreleasedReturnValue();
    v95 = os_log_type_enabled(v94, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v95)
      {
        v98 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v99 = (void *)MEMORY[0x1E0CB3978];
        v100 = v98;
        objc_msgSend(v99, "callStackSymbols");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "componentsJoinedByString:", CFSTR("\n"));
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v98;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v102;
        _os_log_error_impl(&dword_1A6553000, v94, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v95)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "componentsJoinedByString:", CFSTR("\n"));
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v97;
      _os_log_error_impl(&dword_1A6553000, v94, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUImageExportJob render:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageExportJob.m", 338, CFSTR("Invalid parameter not satisfying: %s"), v103, v104, v105, v106, (uint64_t)"error != NULL");
  }
  -[NURenderJob renderer:](self, "renderer:");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  if (v115)
  {
    -[NURenderJob prepareNode](self, "prepareNode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageProperties:", a3);
    v116 = (void *)objc_claimAutoreleasedReturnValue();

    if (v116)
    {
      -[NUImageExportJob imageExportRequest](self, "imageExportRequest");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "colorSpace");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v4)
      {
        v6 = v4;
      }
      else
      {
        objc_msgSend(v116, "colorSpace");
        v6 = (id)objc_claimAutoreleasedReturnValue();
      }
      v8 = v6;

      if ((objc_msgSend(v8, "isRGB") & 1) != 0)
      {
        v113 = v8;
      }
      else
      {
        if (_NULogOnceToken != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_102);
        v9 = _NULogger;
        if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v8;
          _os_log_impl(&dword_1A6553000, v9, OS_LOG_TYPE_DEFAULT, "Destination color space is not RGB, falling back to sRGB: %{public}@", buf, 0xCu);
        }
        +[NUColorSpace sRGBColorSpace](NUColorSpace, "sRGBColorSpace");
        v10 = objc_claimAutoreleasedReturnValue();

        v113 = (void *)v10;
      }
      v11 = -[NURenderJob imageSize](self, "imageSize");
      v13 = v12;
      objc_msgSend(v112, "format");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "pixelFormat");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "context");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if (objc_msgSend(v113, "isExtended") && (objc_msgSend(v110, "supportsExtendedRange") & 1) == 0)
      {
        if (_NULogOnceToken != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_11574);
        v15 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
        {
          v16 = (void *)MEMORY[0x1E0CB3940];
          v17 = v15;
          objc_msgSend(v16, "stringWithFormat:", CFSTR("XDR colorspace (%@) is incompatible with format (%@)"), v113, v110);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v18;
          _os_log_impl(&dword_1A6553000, v17, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

          v19 = _NULogOnceToken;
        }
        else
        {
          v19 = -1;
        }
        if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
        {
          if (v19 != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_11574);
          v20 = (void *)_NUAssertLogger;
          if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
          {
            v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            v26 = (void *)MEMORY[0x1E0CB3978];
            v27 = v25;
            v28 = v20;
            objc_msgSend(v26, "callStackSymbols");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v25;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v30;
            _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

          }
        }
        else
        {
          if (v19 != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_11574);
          v31 = (void *)_NUAssertLogger;
          if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
          {
            v83 = (void *)MEMORY[0x1E0CB3978];
            v84 = v31;
            objc_msgSend(v83, "callStackSymbols");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "componentsJoinedByString:", CFSTR("\n"));
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v86;
            _os_log_error_impl(&dword_1A6553000, v84, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

          }
        }
        _NUAssertContinueHandler((uint64_t)"-[NUImageExportJob render:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageExportJob.m", 374, CFSTR("XDR colorspace (%@) is incompatible with format (%@)"), v21, v22, v23, v24, (uint64_t)v113);
      }
      if (objc_msgSend(v113, "isHDR") && objc_msgSend(v110, "bitsPerComponent") <= 9)
      {
        if (_NULogOnceToken != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_11574);
        v32 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
        {
          v33 = (void *)MEMORY[0x1E0CB3940];
          v34 = v32;
          objc_msgSend(v33, "stringWithFormat:", CFSTR("HDR colorspace (%@) is incompatible with format (%@)"), v113, v110);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v35;
          _os_log_impl(&dword_1A6553000, v34, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

          v36 = _NULogOnceToken;
        }
        else
        {
          v36 = -1;
        }
        if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
        {
          if (v36 != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_11574);
          v37 = (void *)_NUAssertLogger;
          if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
          {
            v42 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            v43 = (void *)MEMORY[0x1E0CB3978];
            v44 = v42;
            v45 = v37;
            objc_msgSend(v43, "callStackSymbols");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "componentsJoinedByString:", CFSTR("\n"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v42;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v47;
            _os_log_error_impl(&dword_1A6553000, v45, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

          }
        }
        else
        {
          if (v36 != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_11574);
          v48 = (void *)_NUAssertLogger;
          if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
          {
            v87 = (void *)MEMORY[0x1E0CB3978];
            v88 = v48;
            objc_msgSend(v87, "callStackSymbols");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "componentsJoinedByString:", CFSTR("\n"));
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v90;
            _os_log_error_impl(&dword_1A6553000, v88, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

          }
        }
        _NUAssertContinueHandler((uint64_t)"-[NUImageExportJob render:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageExportJob.m", 375, CFSTR("HDR colorspace (%@) is incompatible with format (%@)"), v38, v39, v40, v41, (uint64_t)v113);
      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v127 = __Block_byref_object_copy__11583;
      v128 = __Block_byref_object_dispose__11584;
      v129 = 0;
      -[NUImageExportJob imageExportRequest](self, "imageExportRequest");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "renderWithIOSurface");

      if ((v50 & isKindOfClass) != 0)
      {
        -[NURenderJob outputImage](self, "outputImage");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        image = -[NUImageExportJob copyCGImageWithIOSurface:fromRect:colorSpace:error:](self, "copyCGImageWithIOSurface:fromRect:colorSpace:error:", v51, v113, a3, 0.0, 0.0, (double)v11, (double)v13);
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[NURenderJob outputImage](self, "outputImage");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v110, "CIFormat");
        v53 = objc_msgSend(v113, "CGColorSpace");
        v124[0] = MEMORY[0x1E0C809B0];
        v124[1] = 3221225472;
        v124[2] = __27__NUImageExportJob_render___block_invoke;
        v124[3] = &unk_1E5061FA0;
        v124[4] = buf;
        image = (CGImage *)objc_msgSend(v108, "createCGImage:fromRect:format:premultiplied:colorSpace:deferred:renderCallback:", v51, v52, 1, v53, 1, v124, 0.0, 0.0, (double)v11, (double)v13);
      }
      else
      {
        -[NURenderJob outputImage](self, "outputImage");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        image = (CGImage *)objc_msgSend(v108, "createCGImage:fromRect:format:colorSpace:deferred:", v51, objc_msgSend(v110, "CIFormat"), objc_msgSend(v113, "CGColorSpace"), 1, 0.0, 0.0, (double)v11, (double)v13);
      }

      if (image)
      {
        if (objc_msgSend(v112, "renderToData"))
        {
          v54 = (NSData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
          destinationData = self->_destinationData;
          self->_destinationData = v54;

          v56 = self->_destinationData;
          objc_msgSend(v111, "fileType");
          v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v58 = CGImageDestinationCreateWithData((CFMutableDataRef)v56, v57, 1uLL, 0);
        }
        else
        {
          objc_msgSend(v112, "destinationURL");
          v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v111, "fileType");
          v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v58 = CGImageDestinationCreateWithURL((CFURLRef)v57, v61, 1uLL, 0);

        }
        if (v58)
        {
          -[NUImageExportJob imageDestinationOptions](self, "imageDestinationOptions");
          v62 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          CGImageDestinationAddImage(v58, image, v62);
          v107 = v62;
          -[NUImageExportJob auxiliaryImages](self, "auxiliaryImages");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v122 = 0u;
          v123 = 0u;
          v120 = 0u;
          v121 = 0u;
          -[NUImageExportJob auxiliaryImageTypes](self, "auxiliaryImageTypes");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v120, v125, 16);
          if (v65)
          {
            v66 = *(_QWORD *)v121;
LABEL_63:
            v67 = 0;
            while (1)
            {
              if (*(_QWORD *)v121 != v66)
                objc_enumerationMutation(v64);
              v68 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * v67);
              objc_msgSend(v63, "objectForKeyedSubscript:", v68);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              if (v69)
                goto LABEL_70;
              v70 = NUAuxiliaryImageTypeFromString(v68);
              objc_msgSend(v116, "auxiliaryImagePropertiesForType:", v70);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              v72 = v71 == 0;

              if (!v72)
                break;
LABEL_71:
              if (v65 == ++v67)
              {
                v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v120, v125, 16);
                if (v65)
                  goto LABEL_63;
                goto LABEL_73;
              }
            }
            -[NURenderJob renderNode](self, "renderNode");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v119 = 0;
            objc_msgSend(v73, "originalAuxiliaryImageForType:error:", v70, &v119);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v74 = v119;

            if (!v69)
            {
              +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to get original aux image"), v68, v74);
              *a3 = (id)objc_claimAutoreleasedReturnValue();

              v77 = 0;
              goto LABEL_76;
            }

LABEL_70:
            v118 = 0;
            objc_msgSend(v69, "dictionaryRepresentationForAuxiliaryDataType:", &v118);
            v75 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
            v76 = (__CFString *)v118;
            CGImageDestinationAddAuxiliaryDataInfo(v58, v76, v75);

            goto LABEL_71;
          }
LABEL_73:
          v77 = 1;
LABEL_76:

          if (!CGImageDestinationFinalize(v58))
          {
            -[NURenderJob request](self, "request");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            v79 = (void *)objc_msgSend(v78, "copy");
            +[NUError failureError:object:](NUError, "failureError:object:", CFSTR("Failed to finalize CGImageDestination"), v79);
            *a3 = (id)objc_claimAutoreleasedReturnValue();

            v77 = 0;
          }
          if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
          {
            -[NURenderJob request](self, "request");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            v81 = (void *)objc_msgSend(v80, "copy");
            +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Error during CGImageDestination finalize"), v81, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
            *a3 = (id)objc_claimAutoreleasedReturnValue();

            v77 = 0;
          }
          CFRelease(v58);
        }
        else
        {
          -[NURenderJob request](self, "request");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = (void *)objc_msgSend(v107, "copy");
          +[NUError failureError:object:](NUError, "failureError:object:", CFSTR("Failed to create CGImageDestinationRef"), v63);
          v77 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }

        CGImageRelease(image);
        v7 = v77 != 0;
      }
      else
      {
        -[NURenderJob request](self, "request");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = (void *)objc_msgSend(v59, "copy");
        +[NUError failureError:object:](NUError, "failureError:object:", CFSTR("Failed to create CGImageRef"), v60);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

        v7 = 0;
      }
      _Block_object_dispose(buf, 8);

    }
    else
    {
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to get image properties"), 0, *a3);
      v7 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)cleanUp
{
  NSData *destinationData;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NUImageExportJob;
  -[NURenderJob cleanUp](&v4, sel_cleanUp);
  destinationData = self->_destinationData;
  self->_destinationData = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxImageQueue, 0);
  objc_storeStrong((id *)&self->_auxImages, 0);
  objc_storeStrong((id *)&self->_destinationData, 0);
}

void __27__NUImageExportJob_render___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v12;
  void *v13;
  uint64_t v14;
  id *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[4];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v12 = a2;
  if (v12)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_102);
    v13 = (void *)_NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      v17 = (void *)MEMORY[0x1E0CB3B18];
      *(double *)v20 = a3;
      *(double *)&v20[1] = a4;
      *(double *)&v20[2] = a5;
      *(double *)&v20[3] = a6;
      v18 = v13;
      objc_msgSend(v17, "valueWithBytes:objCType:", v20, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v22 = v19;
      v23 = 2112;
      v24 = v12;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "createCGImage callback for rect: %@, error: %@", buf, 0x16u);

    }
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v16 = *(_QWORD *)(v14 + 40);
    v15 = (id *)(v14 + 40);
    if (!v16)
      objc_storeStrong(v15, a2);
  }

}

void __47__NUImageExportJob_evaluateRenderDependencies___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v6 = 0;
  objc_msgSend(a2, "result:", &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  if (v3)
  {
    objc_msgSend(v3, "auxiliaryImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 40));

  }
}

void __35__NUImageExportJob_auxiliaryImages__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
