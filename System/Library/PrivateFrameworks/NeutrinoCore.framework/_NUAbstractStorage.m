@implementation _NUAbstractStorage

- (_NUAbstractStorage)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NUAbstractStorage;
  return -[_NUAbstractStorage init](&v3, sel_init);
}

- (void)_resetSize:(id)a3 format:(id)a4
{
  self->_size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)a3;
  objc_storeStrong((id *)&self->_format, a4);
}

- (void)validateRect:(id *)a3
{
  NUMutableRegion *validRegion;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  _OWORD v5[2];

  validRegion = self->_validRegion;
  var1 = a3->var1;
  v5[0] = a3->var0;
  v5[1] = var1;
  -[NUMutableRegion addRect:](validRegion, "addRect:", v5);
}

- (void)validateRegion:(id)a3
{
  -[NUMutableRegion addRegion:](self->_validRegion, "addRegion:", a3);
}

- (NURegion)validRegion
{
  return (NURegion *)(id)-[NUMutableRegion copy](self->_validRegion, "copy");
}

- (void)invalidate
{
  -[NUMutableRegion clear](self->_validRegion, "clear");
}

- (BOOL)isValidInRect:(id *)a3
{
  NUMutableRegion *validRegion;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  _OWORD v6[2];

  validRegion = self->_validRegion;
  if (!validRegion)
    return 1;
  var1 = a3->var1;
  v6[0] = a3->var0;
  v6[1] = var1;
  return -[NURegion includesRect:](validRegion, "includesRect:", v6);
}

- (BOOL)isValidInRegion:(id)a3
{
  id v4;
  NUMutableRegion *validRegion;
  char v6;

  v4 = a3;
  validRegion = self->_validRegion;
  if (validRegion)
    v6 = -[NURegion includesRegion:](validRegion, "includesRegion:", v4);
  else
    v6 = 1;

  return v6;
}

- (void)assertIsValidInRect:(id *)a3
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *specific;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _OWORD v22[2];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  var1 = a3->var1;
  v22[0] = a3->var0;
  v22[1] = var1;
  if (!-[_NUAbstractStorage isValidInRect:](self, "isValidInRect:", v22))
  {
    NUAssertLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{origin={%ld, %ld} size={%ld, %ld}}]"), a3->var0.var0, a3->var0.var1, a3->var1.var0, a3->var1.var1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is not valid in %@: %@"), self, v8, self->_validRegion);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v9;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v15;
        v25 = 2114;
        v26 = v17;
        _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v14;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{origin={%ld, %ld} size={%ld, %ld}}]"), a3->var0.var0, a3->var0.var1, a3->var1.var0, a3->var1.var1);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler((uint64_t)"-[_NUAbstractStorage assertIsValidInRect:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageStorage.mm", 85, CFSTR("%@ is not valid in %@: %@"), v18, v19, v20, v21, (uint64_t)self);
  }
}

- (void)assertIsValidInRegion:(id)a3
{
  NSObject *v4;
  void *v5;
  void *specific;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  if (!-[_NUAbstractStorage isValidInRegion:](self, "isValidInRegion:"))
  {
    NUAssertLogger();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is not valid in %@: %@"), self, v18, self->_validRegion);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v5;
      _os_log_error_impl(&dword_1A6553000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v8)
      {
        v11 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v20 = v11;
        v21 = 2114;
        v22 = v13;
        _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v10;
      _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[_NUAbstractStorage assertIsValidInRegion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageStorage.mm", 91, CFSTR("%@ is not valid in %@: %@"), v14, v15, v16, v17, (uint64_t)self);
  }

}

- (int64_t)copyFromStorage:(id)a3 region:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_14252);
  v7 = (id)_NUAssertLogger;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v11;
    _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

  }
  if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_14252);
    v12 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v15;
      v26 = 2114;
      v27 = v17;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
  }
  else
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_14252);
    v12 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v14;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
  }

  v18 = (objc_class *)objc_opt_class();
  NSStringFromClass(v18);
  v19 = objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[_NUAbstractStorage copyFromStorage:region:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageStorage.mm", 96, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v20, v21, v22, v23, v19);
}

- (int64_t)readBufferInRegion:(id)a3 block:(id)a4
{
  return 0;
}

- (int64_t)writeBufferInRegion:(id)a3 block:(id)a4
{
  return 0;
}

- (int64_t)fillBufferWithPattern4:(unsigned int)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  void *v9;
  int64_t v10;
  _QWORD v12[5];
  unsigned int v13;
  _QWORD v14[4];

  v5 = -[_NUAbstractStorage size](self, "size");
  v7 = v6;
  v8 = -[_NUAbstractStorage sizeInBytes](self, "sizeInBytes");
  v14[0] = 0;
  v14[1] = 0;
  v14[2] = v5;
  v14[3] = v7;
  +[NURegion regionWithRect:](NURegion, "regionWithRect:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __45___NUAbstractStorage_fillBufferWithPattern4___block_invoke;
  v12[3] = &__block_descriptor_44_e27_v16__0___NUMutableBuffer__8l;
  v13 = a3;
  v12[4] = v8;
  v10 = -[_NUAbstractStorage writeBufferInRegion:block:](self, "writeBufferInRegion:block:", v9, v12);

  return v10;
}

- (int64_t)useAsCIImageWithOptions:(id)a3 renderer:(id)a4 block:(id)a5
{
  return 0;
}

- (int64_t)useAsCIRenderDestinationWithRenderer:(id)a3 block:(id)a4
{
  return 0;
}

- (int64_t)useAsCVPixelBufferWithBlock:(id)a3
{
  return 0;
}

- (void)provideBuffer:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_NUAbstractStorage validRegion](self, "validRegion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUAbstractStorage readBufferInRegion:block:](self, "readBufferInRegion:block:", v4, v5);

}

- (void)provideMutableBuffer:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];

  v4 = a3;
  v7[0] = 0;
  v7[1] = 0;
  v7[2] = -[_NUAbstractStorage size](self, "size");
  v7[3] = v5;
  +[NURegion regionWithRect:](NURegion, "regionWithRect:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUAbstractStorage writeBufferInRegion:block:](self, "writeBufferInRegion:block:", v6, v4);

}

- (NUColorSpace)colorSpace
{
  return (NUColorSpace *)objc_getProperty(self, a2, 16, 1);
}

- (void)setColorSpace:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
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

- (int64_t)sizeInBytes
{
  return self->_sizeInBytes;
}

- (void)setSizeInBytes:(int64_t)a3
{
  self->_sizeInBytes = a3;
}

- (NUPixelFormat)format
{
  return (NUPixelFormat *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFormat:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->colorSpace, 0);
  objc_storeStrong((id *)&self->_validRegion, 0);
}

@end
