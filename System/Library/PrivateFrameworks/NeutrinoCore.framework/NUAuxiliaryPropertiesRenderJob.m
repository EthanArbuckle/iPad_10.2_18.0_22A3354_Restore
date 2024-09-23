@implementation NUAuxiliaryPropertiesRenderJob

- (BOOL)wantsRenderStage
{
  return 0;
}

- (BOOL)wantsCompleteStage
{
  return 0;
}

- (BOOL)prepare:(id *)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  NUImageProperties *v8;
  NUImageProperties *imageProperties;
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
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;
  objc_super v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_1008();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v11;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_1008();
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
        v46 = v17;
        v47 = 2114;
        v48 = v21;
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
      v46 = v16;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUAuxiliaryPropertiesRenderJob prepare:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUAuxiliaryImageRenderRequest.m", 401, CFSTR("Invalid parameter not satisfying: %s"), v22, v23, v24, v25, (uint64_t)"error != NULL");
  }
  v44.receiver = self;
  v44.super_class = (Class)NUAuxiliaryPropertiesRenderJob;
  v5 = -[NURenderJob prepare:](&v44, sel_prepare_);
  if (v5)
  {
    -[NURenderJob prepareNode](self, "prepareNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      NUAssertLogger_1008();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing prepare node"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v46 = v27;
        _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger_1008();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
      if (v28)
      {
        if (v30)
        {
          v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v34 = (void *)MEMORY[0x1E0CB3978];
          v35 = v33;
          objc_msgSend(v34, "callStackSymbols");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v46 = v33;
          v47 = 2114;
          v48 = v37;
          _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
      }
      else if (v30)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v46 = v32;
        _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      _NUAssertFailHandler((uint64_t)"-[NUAuxiliaryPropertiesRenderJob prepare:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUAuxiliaryImageRenderRequest.m", 407, CFSTR("Missing prepare node"), v38, v39, v40, v41, v43);
    }
    -[NURenderJob prepareNode](self, "prepareNode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageProperties:", a3);
    v8 = (NUImageProperties *)objc_claimAutoreleasedReturnValue();
    imageProperties = self->_imageProperties;
    self->_imageProperties = v8;

    LOBYTE(v5) = self->_imageProperties != 0;
  }
  return v5;
}

- (id)result
{
  _NUAuxiliaryPropertiesResult *v3;
  NUImageProperties *imageProperties;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = objc_alloc_init(_NUAuxiliaryPropertiesResult);
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  imageProperties = self->_imageProperties;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__NUAuxiliaryPropertiesRenderJob_result__block_invoke;
  v6[3] = &unk_1E5060880;
  v6[4] = self;
  v6[5] = &v7;
  -[NUImageProperties enumerateAuxiliaryImageProperties:](imageProperties, "enumerateAuxiliaryImageProperties:", v6);
  -[_NUAuxiliaryPropertiesResult setCanPropagateOriginalAuxiliaryData:](v3, "setCanPropagateOriginalAuxiliaryData:", *((unsigned __int8 *)v8 + 24));
  -[_NUAuxiliaryPropertiesResult setProperties:](v3, "setProperties:", self->_imageProperties);
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageProperties, 0);
}

void __40__NUAuxiliaryPropertiesRenderJob_result__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v7 = a3;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v8 + 24))
  {
    v10 = v7;
    objc_msgSend(*(id *)(a1 + 32), "prepareNode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v9, "canPropagateOriginalAuxiliaryData:", a2);

    v7 = v10;
  }
  else
  {
    *(_BYTE *)(v8 + 24) = 0;
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a4 = 1;

}

@end
