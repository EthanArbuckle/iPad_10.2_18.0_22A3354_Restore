@implementation NUIOSurfaceStorage

- (NUIOSurfaceStorage)initWithSize:(id)a3 format:(id)a4
{
  int64_t var1;
  int64_t var0;
  id v7;
  void *v8;
  NUIOSurfaceStorage *v9;
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
  objc_super v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  var1 = a3.var1;
  var0 = a3.var0;
  v32 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!v7)
  {
    NUAssertLogger_17449();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "pixelFormat != nil");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v12;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_17449();
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
        v29 = v18;
        v30 = 2114;
        v31 = v22;
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
      v29 = v17;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUIOSurfaceStorage initWithSize:format:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurfaceStorage.m", 50, CFSTR("Invalid parameter not satisfying: %s"), v23, v24, v25, v26, (uint64_t)"pixelFormat != nil");
  }
  v8 = v7;
  v27.receiver = self;
  v27.super_class = (Class)NUIOSurfaceStorage;
  v9 = -[_NUAbstractStorage init](&v27, sel_init);
  -[_NUAbstractStorage _resetSize:format:](v9, "_resetSize:format:", var0, var1, v8);
  -[NUIOSurfaceStorage _allocateSurface](v9, "_allocateSurface");
  v9->_purgeLevel = 1;

  return v9;
}

- (NUIOSurfaceStorage)initWithSurface:(id)a3
{
  NUIOSurface *v4;
  NUIOSurface *v5;
  NUIOSurfaceStorage *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NUIOSurface *surface;
  NSObject *v13;
  void *v14;
  void *specific;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  objc_super v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = (NUIOSurface *)a3;
  if (!v4)
  {
    NUAssertLogger_17449();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "surface != nil");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v14;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_17449();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v21 = (void *)MEMORY[0x1E0CB3978];
        v22 = v20;
        objc_msgSend(v21, "callStackSymbols");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v20;
        v32 = 2114;
        v33 = v24;
        _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v19;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUIOSurfaceStorage initWithSurface:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurfaceStorage.m", 67, CFSTR("Invalid parameter not satisfying: %s"), v25, v26, v27, v28, (uint64_t)"surface != nil");
  }
  v5 = v4;
  v29.receiver = self;
  v29.super_class = (Class)NUIOSurfaceStorage;
  v6 = -[_NUAbstractStorage init](&v29, sel_init);
  v7 = -[NUIOSurface size](v5, "size");
  v9 = v8;
  -[NUIOSurface format](v5, "format");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUAbstractStorage _resetSize:format:](v6, "_resetSize:format:", v7, v9, v10);

  surface = v6->_surface;
  v6->_surface = v5;

  v6->_purgeLevel = 1;
  return v6;
}

- (int64_t)rowBytes
{
  return -[NUIOSurface rowBytes](self->_surface, "rowBytes");
}

- (int64_t)sizeInBytes
{
  return -[NUIOSurface sizeInBytes](self->_surface, "sizeInBytes");
}

- (void)_allocateSurface
{
  NUIOSurface *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NUIOSurface *v8;
  NUIOSurface *surface;

  v3 = [NUIOSurface alloc];
  v4 = -[_NUAbstractStorage size](self, "size");
  v6 = v5;
  -[_NUAbstractStorage format](self, "format");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NUIOSurface initWithSize:format:](v3, "initWithSize:format:", v4, v6, v7);
  surface = self->_surface;
  self->_surface = v8;

  -[NUIOSurface setName:](self->_surface, "setName:", CFSTR("NUIOSurfaceStorage"));
}

- (BOOL)isPurgeable
{
  return self->_purgeable;
}

- (int64_t)purgeLevel
{
  return self->_purgeLevel;
}

- (void)adjustPurgeLevel:(int64_t)a3
{
  if (self->_purgeLevel != a3)
  {
    self->_purgeLevel = a3;
    if (self->_purgeable)
      -[NUIOSurface makePurgeable:](self->_surface, "makePurgeable:");
  }
}

- (void)makePurgeable
{
  -[NUIOSurface makePurgeable:](self->_surface, "makePurgeable:", self->_purgeLevel);
  self->_purgeable = 1;
}

- (BOOL)makeNonPurgeable
{
  _BOOL4 v3;

  v3 = -[NUIOSurface makeNonPurgeable](self->_surface, "makeNonPurgeable");
  if (v3)
    self->_purgeable = 0;
  return v3;
}

- (BOOL)isPurged
{
  return -[NUIOSurface isPurged](self->_surface, "isPurged");
}

- (BOOL)isShared
{
  void *v2;
  int v3;
  char v4;

  -[NUIOSurface IOSurface](self->_surface, "IOSurface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "localUseCount");
  if (v3 <= 1)
  {
    if (v3)
      v4 = 0;
    else
      v4 = objc_msgSend(v2, "isInUse");
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)isInUse
{
  void *v2;
  char v3;

  -[NUIOSurface IOSurface](self->_surface, "IOSurface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInUse");

  return v3;
}

- (void)incrementUseCount
{
  id v2;

  -[NUIOSurface IOSurface](self->_surface, "IOSurface");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "incrementUseCount");

}

- (BOOL)decrementUseCount
{
  void *v3;
  void *v4;

  -[NUIOSurface invalidatePixelBuffer](self->_surface, "invalidatePixelBuffer");
  -[NUIOSurface IOSurface](self->_surface, "IOSurface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decrementUseCount");

  -[NUIOSurface IOSurface](self->_surface, "IOSurface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "isInUse") ^ 1;

  return (char)v3;
}

- (int)useCount
{
  void *v2;
  int v3;

  -[NUIOSurface IOSurface](self->_surface, "IOSurface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "localUseCount");

  return v3;
}

- (void)setColorSpace:(id)a3
{
  id v4;
  NUIOSurface *surface;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NUIOSurfaceStorage;
  v4 = a3;
  -[_NUAbstractStorage setColorSpace:](&v7, sel_setColorSpace_, v4);
  surface = self->_surface;
  v6 = objc_msgSend(v4, "CGColorSpace", v7.receiver, v7.super_class);

  -[NUIOSurface setColorSpace:](surface, "setColorSpace:", v6);
}

- (int64_t)readBufferInRegion:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  NUDevice *device;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__NUIOSurfaceStorage_readBufferInRegion_block___block_invoke;
  v11[3] = &unk_1E5062CA0;
  v12 = v6;
  v7 = v6;
  v8 = -[NUIOSurfaceStorage readSurfaceInRegion:block:](self, "readSurfaceInRegion:block:", a3, v11);
  device = self->_device;
  self->_device = 0;

  return v8;
}

- (int64_t)writeBufferInRegion:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  NUDevice *device;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__NUIOSurfaceStorage_writeBufferInRegion_block___block_invoke;
  v11[3] = &unk_1E5062CA0;
  v12 = v6;
  v7 = v6;
  v8 = -[NUIOSurfaceStorage writeSurfaceInRegion:block:](self, "writeSurfaceInRegion:block:", a3, v11);
  device = self->_device;
  self->_device = 0;

  return v8;
}

- (int64_t)readSurfaceInRegion:(id)a3 block:(id)a4
{
  uint64_t (**v6)(id, NUIOSurface *);

  v6 = (uint64_t (**)(id, NUIOSurface *))a4;
  -[_NUAbstractStorage assertIsValidInRegion:](self, "assertIsValidInRegion:", a3);
  LODWORD(a3) = v6[2](v6, self->_surface);

  return a3;
}

- (int64_t)writeSurfaceInRegion:(id)a3 block:(id)a4
{
  id v6;
  int64_t v7;

  v6 = a3;
  if ((*((unsigned int (**)(id, NUIOSurface *))a4 + 2))(a4, self->_surface))
  {
    -[_NUAbstractStorage validateRegion:](self, "validateRegion:", v6);
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)readTextureInRegion:(id)a3 device:(id)a4 block:(id)a5
{
  id v8;
  NUDevice *v9;
  uint64_t (**v10)(id, void *);
  NUIOSurface *surface;
  void *v12;
  void *v13;
  NUDevice *device;
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
  v8 = a3;
  v9 = (NUDevice *)a4;
  v10 = (uint64_t (**)(id, void *))a5;
  if (!-[NUDevice hasMetalSupport](v9, "hasMetalSupport"))
  {
    NUAssertLogger_17449();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "device.hasMetalSupport");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v17;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_17449();
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
    _NUAssertFailHandler((uint64_t)"-[NUIOSurfaceStorage readTextureInRegion:device:block:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurfaceStorage.m", 267, CFSTR("Invalid parameter not satisfying: %s"), v28, v29, v30, v31, (uint64_t)"device.hasMetalSupport");
  }
  -[_NUAbstractStorage assertIsValidInRegion:](self, "assertIsValidInRegion:", v8);
  surface = self->_surface;
  -[NUDevice metalDevice](v9, "metalDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUIOSurface textureForDevice:](surface, "textureForDevice:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(surface) = v10[2](v10, v13);
  device = self->_device;
  self->_device = v9;

  return surface;
}

- (int64_t)writeTextureInRegion:(id)a3 device:(id)a4 block:(id)a5
{
  id v8;
  NUDevice *v9;
  unsigned int (**v10)(id, void *);
  NUIOSurface *surface;
  void *v12;
  void *v13;
  int64_t v14;
  NUDevice *device;
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
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (NUDevice *)a4;
  v10 = (unsigned int (**)(id, void *))a5;
  if (!-[NUDevice hasMetalSupport](v9, "hasMetalSupport"))
  {
    NUAssertLogger_17449();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "device.hasMetalSupport");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v18;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_17449();
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
        v34 = v24;
        v35 = 2114;
        v36 = v28;
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
      v34 = v23;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUIOSurfaceStorage writeTextureInRegion:device:block:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurfaceStorage.m", 287, CFSTR("Invalid parameter not satisfying: %s"), v29, v30, v31, v32, (uint64_t)"device.hasMetalSupport");
  }
  surface = self->_surface;
  -[NUDevice metalDevice](v9, "metalDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUIOSurface textureForDevice:](surface, "textureForDevice:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10[2](v10, v13))
  {
    -[_NUAbstractStorage validateRegion:](self, "validateRegion:", v8);
    v14 = 1;
  }
  else
  {
    v14 = 0;
  }
  device = self->_device;
  self->_device = v9;

  return v14;
}

- (int64_t)useAsCIImageWithOptions:(id)a3 renderer:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  int64_t v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22[0] = 0;
  v22[1] = 0;
  v22[2] = -[_NUAbstractStorage size](self, "size");
  v22[3] = v11;
  +[NURegion regionWithRect:](NURegion, "regionWithRect:", v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __61__NUIOSurfaceStorage_useAsCIImageWithOptions_renderer_block___block_invoke;
  v18[3] = &unk_1E5062CF0;
  v20 = v8;
  v21 = v10;
  v19 = v9;
  v13 = v8;
  v14 = v9;
  v15 = v10;
  v16 = -[NUIOSurfaceStorage readSurfaceInRegion:block:](self, "readSurfaceInRegion:block:", v12, v18);

  return v16;
}

- (int64_t)useAsCIRenderDestinationWithRenderer:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  int64_t v12;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];

  v6 = a3;
  v7 = a4;
  v17[0] = 0;
  v17[1] = 0;
  v17[2] = -[_NUAbstractStorage size](self, "size");
  v17[3] = v8;
  +[NURegion regionWithRect:](NURegion, "regionWithRect:", v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__NUIOSurfaceStorage_useAsCIRenderDestinationWithRenderer_block___block_invoke;
  v14[3] = &unk_1E5062D18;
  v15 = v6;
  v16 = v7;
  v10 = v6;
  v11 = v7;
  v12 = -[NUIOSurfaceStorage writeSurfaceInRegion:block:](self, "writeSurfaceInRegion:block:", v9, v14);

  return v12;
}

- (int64_t)useAsCVPixelBufferWithBlock:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  int64_t v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];

  v4 = a3;
  v12[0] = 0;
  v12[1] = 0;
  v12[2] = -[_NUAbstractStorage size](self, "size");
  v12[3] = v5;
  +[NURegion regionWithRect:](NURegion, "regionWithRect:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__NUIOSurfaceStorage_useAsCVPixelBufferWithBlock___block_invoke;
  v10[3] = &unk_1E5062CA0;
  v11 = v4;
  v7 = v4;
  v8 = -[NUIOSurfaceStorage readSurfaceInRegion:block:](self, "readSurfaceInRegion:block:", v6, v10);

  return v8;
}

- (int64_t)copyFromStorage:(id)a3 region:(id)a4
{
  _QWORD *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  unint64_t v16;
  NUDevice *device;
  id v18;
  id v19;
  int64_t v20;
  NSObject *v22;
  void *v23;
  void *specific;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
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
  objc_super v70;
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    NUAssertLogger_17449();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "other != nil");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v72 = v23;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_17449();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        v43 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v44 = (void *)MEMORY[0x1E0CB3978];
        v45 = v43;
        objc_msgSend(v44, "callStackSymbols");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "componentsJoinedByString:", CFSTR("\n"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v72 = v43;
        v73 = 2114;
        v74 = v47;
        _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v72 = v28;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUIOSurfaceStorage copyFromStorage:region:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurfaceStorage.m", 341, CFSTR("Invalid parameter not satisfying: %s"), v48, v49, v50, v51, (uint64_t)"other != nil");
  }
  v8 = v7;
  v9 = objc_msgSend(v6, "size");
  v11 = v10;
  if (v9 != -[_NUAbstractStorage size](self, "size") || v11 != v12)
  {
    NUAssertLogger_17449();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "NUPixelSizeEqualToSize(other.size, self.size)");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v72 = v30;
      _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_17449();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (v31)
    {
      if (v33)
      {
        v52 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v53 = (void *)MEMORY[0x1E0CB3978];
        v54 = v52;
        objc_msgSend(v53, "callStackSymbols");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "componentsJoinedByString:", CFSTR("\n"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v72 = v52;
        v73 = 2114;
        v74 = v56;
        _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v33)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v72 = v35;
      _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUIOSurfaceStorage copyFromStorage:region:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurfaceStorage.m", 342, CFSTR("Invalid parameter not satisfying: %s"), v57, v58, v59, v60, (uint64_t)"NUPixelSizeEqualToSize(other.size, self.size)");
  }
  -[_NUAbstractStorage format](self, "format");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "format");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqualToPixelFormat:", v14);

  if ((v15 & 1) == 0)
  {
    NUAssertLogger_17449();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "[self.format isEqualToPixelFormat:other.format]");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v72 = v37;
      _os_log_error_impl(&dword_1A6553000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_17449();
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
    if (v38)
    {
      if (v40)
      {
        v61 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v62 = (void *)MEMORY[0x1E0CB3978];
        v63 = v61;
        objc_msgSend(v62, "callStackSymbols");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "componentsJoinedByString:", CFSTR("\n"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v72 = v61;
        v73 = 2114;
        v74 = v65;
        _os_log_error_impl(&dword_1A6553000, v39, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v40)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "componentsJoinedByString:", CFSTR("\n"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v72 = v42;
      _os_log_error_impl(&dword_1A6553000, v39, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUIOSurfaceStorage copyFromStorage:region:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurfaceStorage.m", 343, CFSTR("Invalid parameter not satisfying: %s"), v66, v67, v68, v69, (uint64_t)"[self.format isEqualToPixelFormat:other.format]");
  }
  v16 = v6[13];
  if ((unint64_t)self->_device | v16)
  {
    if (v16)
      device = (NUDevice *)v6[13];
    else
      device = self->_device;
    v18 = (id)v16;
    v19 = -[NUIOSurfaceStorage _copyFromIOSurfaceStorage:region:device:](self, "_copyFromIOSurfaceStorage:region:device:", v6, v8, device);
  }
  else
  {
    v70.receiver = self;
    v70.super_class = (Class)NUIOSurfaceStorage;
    v19 = -[_NUAbstractBufferStorage copyFromStorage:region:](&v70, sel_copyFromStorage_region_, v6, v8);
  }
  v20 = (int64_t)v19;

  return v20;
}

- (int64_t)_copyFromIOSurfaceStorage:(id)a3 region:(id)a4 device:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  int64_t v14;
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
  _QWORD v32[5];
  id v33;
  id v34;
  _BYTE *v35;
  _BYTE buf[24];
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    NUAssertLogger_17449();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "other != nil");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v17;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_17449();
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
        *(_QWORD *)&buf[4] = v23;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v27;
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
      *(_QWORD *)&buf[4] = v22;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUIOSurfaceStorage _copyFromIOSurfaceStorage:region:device:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurfaceStorage.m", 365, CFSTR("Invalid parameter not satisfying: %s"), v28, v29, v30, v31, (uint64_t)"other != nil");
  }
  v11 = v10;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v37 = 1;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __62__NUIOSurfaceStorage__copyFromIOSurfaceStorage_region_device___block_invoke;
  v32[3] = &unk_1E5062D90;
  v35 = buf;
  v32[4] = self;
  v12 = v9;
  v33 = v12;
  v13 = v11;
  v34 = v13;
  v14 = objc_msgSend(v8, "readTextureInRegion:device:block:", v12, v13, v32);
  if (v14 == 1)
    v14 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);

  _Block_object_dispose(buf, 8);
  return v14;
}

- (NSString)description
{
  __IOSurface *v3;
  uint64_t UseCount;

  v3 = -[NUIOSurface IOSurfaceRef](self->_surface, "IOSurfaceRef");
  UseCount = IOSurfaceGetUseCount(v3);
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p> IOSurface=%p useCount=%d purgeable=%d sizeInBytes=%ld surface=%@"), objc_opt_class(), self, v3, UseCount, self->_purgeable, -[NUIOSurface sizeInBytes](self->_surface, "sizeInBytes"), self->_surface);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_surface, 0);
}

uint64_t __62__NUIOSurfaceStorage__copyFromIOSurfaceStorage_region_device___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = (void *)a1[6];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__NUIOSurfaceStorage__copyFromIOSurfaceStorage_region_device___block_invoke_2;
  v9[3] = &unk_1E5062D68;
  v10 = v6;
  v11 = (id)a1[5];
  v12 = v3;
  v7 = v3;
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = objc_msgSend(v4, "writeTextureInRegion:device:block:", v5, v10, v9);

  return 1;
}

uint64_t __62__NUIOSurfaceStorage__copyFromIOSurfaceStorage_region_device___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__NUIOSurfaceStorage__copyFromIOSurfaceStorage_region_device___block_invoke_3;
  v7[3] = &unk_1E5062D40;
  v4 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v10 = v3;
  v5 = v3;
  objc_msgSend(v4, "executeMetal:", v7);

  return 1;
}

void __62__NUIOSurfaceStorage__copyFromIOSurfaceStorage_region_device___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[3];
  _QWORD v11[3];
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;

  v3 = a2;
  v4 = (void *)a1[4];
  if (v4)
  {
    objc_msgSend(v4, "bounds");
    v6 = *((_QWORD *)&v14 + 1);
    v5 = v14;
    v7 = v15;
  }
  else
  {
    v6 = 0;
    v5 = 0;
    v7 = 0uLL;
    v14 = 0u;
    v15 = 0u;
  }
  v8 = a1[5];
  v9 = a1[6];
  v11[0] = v5;
  v11[1] = v6;
  v11[2] = 0;
  v12 = v7;
  v13 = 1;
  v10[0] = v5;
  v10[1] = v6;
  v10[2] = 0;
  +[NUCopyKernel copyFromTexture:region:toTexture:atPoint:withCommandBuffer:](NUCopyKernel, "copyFromTexture:region:toTexture:atPoint:withCommandBuffer:", v8, v11, v9, v10, v3);

}

uint64_t __50__NUIOSurfaceStorage_useAsCVPixelBufferWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NUCVPixelBuffer *v4;
  uint64_t v5;
  NUCVPixelBuffer *v6;

  v3 = a2;
  v4 = [NUCVPixelBuffer alloc];
  v5 = objc_msgSend(v3, "pixelBuffer");

  v6 = -[NUCVPixelBuffer initWithCVPixelBuffer:](v4, "initWithCVPixelBuffer:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return 1;
}

uint64_t __65__NUIOSurfaceStorage_useAsCIRenderDestinationWithRenderer_block___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "renderDestinationForSurface:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return v4;
}

uint64_t __61__NUIOSurfaceStorage_useAsCIImageWithOptions_renderer_block___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "imageForSurface:options:", a2, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return 1;
}

uint64_t __48__NUIOSurfaceStorage_writeBufferInRegion_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__NUIOSurfaceStorage_writeBufferInRegion_block___block_invoke_2;
  v5[3] = &unk_1E5062CC8;
  v6 = *(id *)(a1 + 32);
  v3 = objc_msgSend(a2, "write:", v5);

  return v3;
}

uint64_t __48__NUIOSurfaceStorage_writeBufferInRegion_block___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __47__NUIOSurfaceStorage_readBufferInRegion_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__NUIOSurfaceStorage_readBufferInRegion_block___block_invoke_2;
  v5[3] = &unk_1E5062C78;
  v6 = *(id *)(a1 + 32);
  v3 = objc_msgSend(a2, "read:", v5);

  return v3;
}

uint64_t __47__NUIOSurfaceStorage_readBufferInRegion_block___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
