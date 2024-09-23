@implementation NURedEyeDetectionJob

- (BOOL)prepare:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  CIImage *v14;
  CIImage *fullSizeImage;
  NSObject *v17;
  void *v18;
  void *specific;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  objc_super v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v33.receiver = self;
  v33.super_class = (Class)NURedEyeDetectionJob;
  if (!-[NURenderJob prepare:](&v33, sel_prepare_))
    return 0;
  -[NURenderJob prepareNode](self, "prepareNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    NUAssertLogger_3257();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing prepare node"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v18;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_3257();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v25 = (void *)MEMORY[0x1E0CB3978];
        v26 = v24;
        objc_msgSend(v25, "callStackSymbols");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v24;
        v36 = 2114;
        v37 = v28;
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
      v35 = v23;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURedEyeDetectionJob prepare:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURedEyeDetectionRequest.m", 63, CFSTR("Missing prepare node"), v29, v30, v31, v32, (uint64_t)v33.receiver);
  }
  -[NURenderJob setRenderScale:](self, "setRenderScale:", NUScaleOne);
  v6 = -[NUImageDataJob newRenderPipelineStateForEvaluationMode:](self, "newRenderPipelineStateForEvaluationMode:", 1);
  objc_msgSend(v6, "setScale:", NUScaleOne);
  -[NURenderJob renderNodeWithPipelineState:error:](self, "renderNodeWithPipelineState:error:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "outputImage:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 != 0;
    if (v9)
    {
      objc_msgSend(v8, "imageProperties:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "metadata");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "imageBySettingProperties:", v13);
        v14 = (CIImage *)objc_claimAutoreleasedReturnValue();
        fullSizeImage = self->_fullSizeImage;
        self->_fullSizeImage = v14;

      }
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)requestOptions
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NURedEyeDetectionJob;
  -[NUImageDataJob requestOptions](&v7, sel_requestOptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_fullSizeImage, CFSTR("fullSizeImage"));
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (void)cleanUp
{
  CIImage *fullSizeImage;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NURedEyeDetectionJob;
  -[NUImageDataJob cleanUp](&v4, sel_cleanUp);
  fullSizeImage = self->_fullSizeImage;
  self->_fullSizeImage = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullSizeImage, 0);
}

@end
