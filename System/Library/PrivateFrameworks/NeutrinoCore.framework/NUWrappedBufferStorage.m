@implementation NUWrappedBufferStorage

- (NUWrappedBufferStorage)initWithSize:(id)a3 format:(id)a4 bytes:(void *)a5 rowBytes:(int64_t)a6 length:(int64_t)a7
{
  int64_t var1;
  int64_t var0;
  id v13;
  void *v14;
  NUWrappedBufferStorage *v15;
  NSObject *v17;
  void *v18;
  void *specific;
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
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  _BOOL4 v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  objc_super v97;
  uint8_t buf[4];
  void *v99;
  __int16 v100;
  void *v101;
  uint64_t v102;

  var1 = a3.var1;
  var0 = a3.var0;
  v102 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  if (!v13)
  {
    NUAssertLogger_8104();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "pixelFormat != nil");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v99 = v18;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_8104();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v52 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v53 = (void *)MEMORY[0x1E0CB3978];
        v54 = v52;
        objc_msgSend(v53, "callStackSymbols");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "componentsJoinedByString:", CFSTR("\n"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v99 = v52;
        v100 = 2114;
        v101 = v56;
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
      v99 = v23;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUWrappedBufferStorage initWithSize:format:bytes:rowBytes:length:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUBufferStorage.m", 339, CFSTR("Invalid parameter not satisfying: %s"), v57, v58, v59, v60, (uint64_t)"pixelFormat != nil");
  }
  if (!a5)
  {
    NUAssertLogger_8104();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "bytes != nil");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v99 = v25;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_8104();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (v26)
    {
      if (v28)
      {
        v61 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v62 = (void *)MEMORY[0x1E0CB3978];
        v63 = v61;
        objc_msgSend(v62, "callStackSymbols");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "componentsJoinedByString:", CFSTR("\n"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v99 = v61;
        v100 = 2114;
        v101 = v65;
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
      v99 = v30;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUWrappedBufferStorage initWithSize:format:bytes:rowBytes:length:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUBufferStorage.m", 340, CFSTR("Invalid parameter not satisfying: %s"), v66, v67, v68, v69, (uint64_t)"bytes != nil");
  }
  if (!a6)
  {
    NUAssertLogger_8104();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "rowBytes != 0");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v99 = v32;
      _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_8104();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (v33)
    {
      if (v35)
      {
        v70 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v71 = (void *)MEMORY[0x1E0CB3978];
        v72 = v70;
        objc_msgSend(v71, "callStackSymbols");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "componentsJoinedByString:", CFSTR("\n"));
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v99 = v70;
        v100 = 2114;
        v101 = v74;
        _os_log_error_impl(&dword_1A6553000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v35)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v99 = v37;
      _os_log_error_impl(&dword_1A6553000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUWrappedBufferStorage initWithSize:format:bytes:rowBytes:length:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUBufferStorage.m", 341, CFSTR("Invalid parameter not satisfying: %s"), v75, v76, v77, v78, (uint64_t)"rowBytes != 0");
  }
  if (!a7)
  {
    NUAssertLogger_8104();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "length != 0");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v99 = v39;
      _os_log_error_impl(&dword_1A6553000, v38, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_8104();
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
    if (v40)
    {
      if (v42)
      {
        v79 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v80 = (void *)MEMORY[0x1E0CB3978];
        v81 = v79;
        objc_msgSend(v80, "callStackSymbols");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "componentsJoinedByString:", CFSTR("\n"));
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v99 = v79;
        v100 = 2114;
        v101 = v83;
        _os_log_error_impl(&dword_1A6553000, v41, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v42)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "componentsJoinedByString:", CFSTR("\n"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v99 = v44;
      _os_log_error_impl(&dword_1A6553000, v41, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUWrappedBufferStorage initWithSize:format:bytes:rowBytes:length:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUBufferStorage.m", 342, CFSTR("Invalid parameter not satisfying: %s"), v84, v85, v86, v87, (uint64_t)"length != 0");
  }
  if (var1 * a6 > a7)
  {
    NUAssertLogger_8104();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "length >= size.height * rowBytes");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v99 = v46;
      _os_log_error_impl(&dword_1A6553000, v45, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v47 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_8104();
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = os_log_type_enabled(v48, OS_LOG_TYPE_ERROR);
    if (v47)
    {
      if (v49)
      {
        v88 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v89 = (void *)MEMORY[0x1E0CB3978];
        v90 = v88;
        objc_msgSend(v89, "callStackSymbols");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "componentsJoinedByString:", CFSTR("\n"));
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v99 = v88;
        v100 = 2114;
        v101 = v92;
        _os_log_error_impl(&dword_1A6553000, v48, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v49)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "componentsJoinedByString:", CFSTR("\n"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v99 = v51;
      _os_log_error_impl(&dword_1A6553000, v48, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUWrappedBufferStorage initWithSize:format:bytes:rowBytes:length:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUBufferStorage.m", 343, CFSTR("Invalid parameter not satisfying: %s"), v93, v94, v95, v96, (uint64_t)"length >= size.height * rowBytes");
  }
  v14 = v13;
  v97.receiver = self;
  v97.super_class = (Class)NUWrappedBufferStorage;
  v15 = -[_NUAbstractStorage init](&v97, sel_init);
  v15->_rowBytes = a6;
  v15->_length = a7;
  v15->_bytes = a5;
  -[_NUAbstractStorage _resetSize:format:](v15, "_resetSize:format:", var0, var1, v14);

  return v15;
}

- (int64_t)sizeInBytes
{
  return self->_length;
}

- (int64_t)readBufferInRegion:(id)a3 block:(id)a4
{
  void (**v6)(id, NUBufferAdapter *);
  NUBufferAdapter *v7;

  v6 = (void (**)(id, NUBufferAdapter *))a4;
  -[_NUAbstractStorage assertIsValidInRegion:](self, "assertIsValidInRegion:", a3);
  v7 = -[NUBufferAdapter initWithBuffer:]([NUBufferAdapter alloc], "initWithBuffer:", self);
  v6[2](v6, v7);

  -[NUBufferAdapter invalidate](v7, "invalidate");
  return 1;
}

- (int64_t)writeBufferInRegion:(id)a3 block:(id)a4
{
  void (**v6)(id, NUMutableBufferAdapter *);
  id v7;
  NUMutableBufferAdapter *v8;

  v6 = (void (**)(id, NUMutableBufferAdapter *))a4;
  v7 = a3;
  v8 = -[NUMutableBufferAdapter initWithMutableBuffer:]([NUMutableBufferAdapter alloc], "initWithMutableBuffer:", self);
  v6[2](v6, v8);

  -[NUBufferAdapter invalidate](v8, "invalidate");
  -[_NUAbstractStorage validateRegion:](self, "validateRegion:", v7);

  return 1;
}

- (void)mutableBytes
{
  return self->_bytes;
}

- (id)newRenderDestination
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0C9DDE8]);
  v4 = -[NUWrappedBufferStorage mutableBytes](self, "mutableBytes");
  v5 = -[_NUAbstractStorage size](self, "size");
  -[_NUAbstractStorage size](self, "size");
  v7 = v6;
  v8 = -[NUWrappedBufferStorage rowBytes](self, "rowBytes");
  -[_NUAbstractStorage format](self, "format");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithBitmapData:width:height:bytesPerRow:format:", v4, v5, v7, v8, objc_msgSend(v9, "CIFormat"));

  objc_msgSend(v10, "setLabel:", CFSTR("NUWrappedBufferStorage-new"));
  return v10;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p> bytes=%p length=%ld"), objc_opt_class(), self, self->_bytes, self->_length);
}

- (const)bytes
{
  return self->_bytes;
}

- (int64_t)rowBytes
{
  return self->_rowBytes;
}

@end
