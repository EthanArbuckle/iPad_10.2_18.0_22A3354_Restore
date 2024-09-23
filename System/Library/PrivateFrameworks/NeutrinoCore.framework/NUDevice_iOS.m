@implementation NUDevice_iOS

- (NUDevice_iOS)initWithName:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NUDevice_iOS *v7;
  objc_super v9;
  uint8_t buf[16];

  v4 = a3;
  v5 = MTLCreateSystemDefaultDevice();
  if (!v5)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_9875);
    v6 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1A6553000, v6, OS_LOG_TYPE_FAULT, "Failed to obtain default Metal device", buf, 2u);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)NUDevice_iOS;
  v7 = -[NUDevice initWithName:model:metalDevice:](&v9, sel_initWithName_model_metalDevice_, v4, CFSTR("Apple"), v5);

  return v7;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[NUDevice name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUDevice model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUDevice metalDevice](self, "metalDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p name:%@ model:%@ metal: %@>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)family
{
  void *v2;
  unint64_t v3;

  -[NUDevice metalDevice](self, "metalDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "supportsFamily:", 1008) & 1) != 0)
  {
    v3 = 8;
  }
  else if ((objc_msgSend(v2, "supportsFamily:", 1007) & 1) != 0)
  {
    v3 = 7;
  }
  else if ((objc_msgSend(v2, "supportsFamily:", 1006) & 1) != 0)
  {
    v3 = 6;
  }
  else if ((objc_msgSend(v2, "supportsFamily:", 1005) & 1) != 0)
  {
    v3 = 5;
  }
  else if ((objc_msgSend(v2, "supportsFamily:", 1004) & 1) != 0)
  {
    v3 = 4;
  }
  else if ((objc_msgSend(v2, "supportsFamily:", 1003) & 1) != 0)
  {
    v3 = 3;
  }
  else if ((objc_msgSend(v2, "supportsFamily:", 1002) & 1) != 0)
  {
    v3 = 2;
  }
  else
  {
    v3 = objc_msgSend(v2, "supportsFamily:", 1001);
  }

  return v3;
}

- (int64_t)_preferredSampleMode
{
  if (-[NUDevice_iOS family](self, "family") - 2 >= 7)
    return 2;
  else
    return 3;
}

- (id)_newRendererWithCIContextOptions:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  NSObject *v8;
  void *v9;
  void *specific;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[12];
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!-[NUDevice shouldRenderUsingMetal](self, "shouldRenderUsingMetal"))
  {
    NUAssertLogger_9861();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Software renderer is unsupported"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v24 = 138543362;
      *(_QWORD *)&v24[4] = v9;
      _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v24, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_9861();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v16 = (void *)MEMORY[0x1E0CB3978];
        v17 = v15;
        objc_msgSend(v16, "callStackSymbols");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v24 = 138543618;
        *(_QWORD *)&v24[4] = v15;
        v25 = 2114;
        v26 = v19;
        _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v24, 0x16u);

      }
    }
    else if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v24 = 138543362;
      *(_QWORD *)&v24[4] = v14;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v24, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUDevice_iOS _newRendererWithCIContextOptions:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Runtime/NUDevice_iOS.m", 101, CFSTR("Software renderer is unsupported"), v20, v21, v22, v23, *(uint64_t *)v24);
  }
  v6 = -[NUDevice_iOS _newMetalRendererWithOptions:](self, "_newMetalRendererWithOptions:", v5);

  return v6;
}

- (id)_newMetalRendererWithOptions:(id)a3
{
  id v4;
  NUMetalRenderer *v5;
  void *v6;
  NUMetalRenderer *v7;

  v4 = a3;
  v5 = [NUMetalRenderer alloc];
  -[NUDevice metalDevice](self, "metalDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NUMetalRenderer initWithMetalDevice:options:](v5, "initWithMetalDevice:options:", v6, v4);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderer, 0);
}

@end
