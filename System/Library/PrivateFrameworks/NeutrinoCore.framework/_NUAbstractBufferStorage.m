@implementation _NUAbstractBufferStorage

- (int64_t)sizeInBytes
{
  NSObject *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_14252);
  v2 = (id)_NUAssertLogger;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v6;
    _os_log_error_impl(&dword_1A6553000, v2, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

  }
  if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_14252);
    v7 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v10;
      v21 = 2114;
      v22 = v12;
      _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
  }
  else
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_14252);
    v7 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v9;
      _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
  }

  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[_NUAbstractBufferStorage sizeInBytes]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageStorage.mm", 152, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v15, v16, v17, v18, v14);
}

- (const)bytesAtPoint:(id)a3
{
  int64_t var1;
  int64_t var0;
  uint64_t v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  NSObject *v12;
  void *v13;
  void *specific;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  var1 = a3.var1;
  var0 = a3.var0;
  v30 = *MEMORY[0x1E0C80C00];
  v6 = -[_NUAbstractStorage size](self, "size");
  if (var0 < 0 || var0 >= v6 || var1 < 0 || var1 >= v7)
  {
    NUAssertLogger();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "NUPixelPointInRect(point, extent)");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v13;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v19;
        v28 = 2114;
        v29 = v21;
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
      v27 = v18;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[_NUAbstractBufferStorage bytesAtPoint:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageStorage.mm", 158, CFSTR("Invalid parameter not satisfying: %s"), v22, v23, v24, v25, (uint64_t)"NUPixelPointInRect(point, extent)");
  }
  -[_NUAbstractStorage format](self, "format");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "bytesPerPixel");

  v10 = -[_NUAbstractBufferStorage rowBytes](self, "rowBytes");
  return -[_NUAbstractBufferStorage bytes](self, "bytes") + v10 * var1 + v9 * var0;
}

- (void)mutableBytesAtPoint:(id)a3
{
  int64_t var1;
  int64_t var0;
  uint64_t v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  NSObject *v12;
  void *v13;
  void *specific;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  var1 = a3.var1;
  var0 = a3.var0;
  v30 = *MEMORY[0x1E0C80C00];
  v6 = -[_NUAbstractStorage size](self, "size");
  if (var0 < 0 || var0 >= v6 || var1 < 0 || var1 >= v7)
  {
    NUAssertLogger();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "NUPixelPointInRect(point, extent)");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v13;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v19;
        v28 = 2114;
        v29 = v21;
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
      v27 = v18;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[_NUAbstractBufferStorage mutableBytesAtPoint:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageStorage.mm", 169, CFSTR("Invalid parameter not satisfying: %s"), v22, v23, v24, v25, (uint64_t)"NUPixelPointInRect(point, extent)");
  }
  -[_NUAbstractStorage format](self, "format");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "bytesPerPixel");

  v10 = -[_NUAbstractBufferStorage rowBytes](self, "rowBytes");
  return -[_NUAbstractBufferStorage mutableBytes](self, "mutableBytes") + v10 * var1 + v9 * var0;
}

- (int64_t)copyFromStorage:(id)a3 region:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  int64_t v16;
  NSObject *v18;
  void *v19;
  void *specific;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[5];
  id v53;
  _BYTE *v54;
  _BYTE buf[24];
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    NUAssertLogger();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "other != nil");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v19;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v37 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "componentsJoinedByString:", CFSTR("\n"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v37;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v39;
        _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v22)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v24;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v40 = "other != nil";
    v41 = 179;
LABEL_32:

    _NUAssertFailHandler((uint64_t)"-[_NUAbstractBufferStorage copyFromStorage:region:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageStorage.mm", v41, CFSTR("Invalid parameter not satisfying: %s"), v48, v49, v50, v51, (uint64_t)v40);
  }
  v8 = objc_msgSend(v6, "size");
  v10 = v9;
  if (v8 != -[_NUAbstractStorage size](self, "size") || v10 != v11)
  {
    NUAssertLogger();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "NUPixelSizeEqualToSize(other.size, self.size)");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v26;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v21 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (v27)
    {
      if (v28)
      {
        v42 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "componentsJoinedByString:", CFSTR("\n"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v42;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v44;
        _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v28)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v30;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v40 = "NUPixelSizeEqualToSize(other.size, self.size)";
    v41 = 180;
    goto LABEL_32;
  }
  -[_NUAbstractStorage format](self, "format");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "format");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqualToPixelFormat:", v13);

  if ((v14 & 1) == 0)
  {
    NUAssertLogger();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "[self.format isEqualToPixelFormat:other.format]");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v32;
      _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v21 = objc_claimAutoreleasedReturnValue();
    v34 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (v33)
    {
      if (v34)
      {
        v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "componentsJoinedByString:", CFSTR("\n"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v45;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v47;
        _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v34)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v36;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v40 = "[self.format isEqualToPixelFormat:other.format]";
    v41 = 181;
    goto LABEL_32;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v56 = 1;
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __51___NUAbstractBufferStorage_copyFromStorage_region___block_invoke;
  v52[3] = &unk_1E5062610;
  v54 = buf;
  v52[4] = self;
  v15 = v7;
  v53 = v15;
  v16 = objc_msgSend(v6, "readBufferInRegion:block:", v15, v52);
  if (v16 == 1)
    v16 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);

  _Block_object_dispose(buf, 8);
  return v16;
}

- (int64_t)rowBytes
{
  return self->_rowBytes;
}

- (const)bytes
{
  return self->_bytes;
}

- (void)mutableBytes
{
  return self->_mutableBytes;
}

@end
