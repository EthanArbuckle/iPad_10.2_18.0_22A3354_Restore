@implementation BLSHFlipbook

+ (id)createWithPlatformProvider:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPlatformProvider:", v3);

  return v4;
}

- (BLSHFlipbook)initWithPlatformProvider:(id)a3
{
  id v4;
  BLSHFlipbook *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  CAFlipBook *flipbook;
  NSObject *v13;
  objc_super v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BLSHFlipbook;
  v5 = -[BLSHFlipbook init](&v15, sel_init);
  if (v5)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "flipbookSpecification");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        v16 = *MEMORY[0x24BDE5C40];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "frameCapacity"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = v8;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(MEMORY[0x24BDE5660], "mainDisplay");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "flipBookWithOptions:", v9);
    v11 = objc_claimAutoreleasedReturnValue();
    flipbook = v5->_flipbook;
    v5->_flipbook = (CAFlipBook *)v11;

    *(_WORD *)&v5->_wantsTransform = 0;
    -[CAFlipBook setWantsTransform:](v5->_flipbook, "setWantsTransform:", 0);
    -[CAFlipBook setInverted:](v5->_flipbook, "setInverted:", v5->_inverted);
    if (os_variant_has_internal_diagnostics())
      -[CAFlipBook setMaximumMemoryUsageForDiagnostics:](v5->_flipbook, "setMaximumMemoryUsageForDiagnostics:", 20971520);
    bls_flipbook_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[BLSHFlipbook initWithPlatformProvider:].cold.1((uint64_t)v5, v13);

  }
  return v5;
}

- (BLSHRenderedFlipbookFrame)frameOnGlass
{
  return (BLSHRenderedFlipbookFrame *)-[CAFlipBook frameAtTime:](self->_flipbook, "frameAtTime:", mach_continuous_time());
}

- (BLSHRenderedFlipbookFrame)captureFrameOnGlass
{
  return (BLSHRenderedFlipbookFrame *)(id)-[CAFlipBook copyCurrentFrame](self->_flipbook, "copyCurrentFrame");
}

- (BLSHRenderedFlipbookFrame)lastRenderedFrame
{
  return (BLSHRenderedFlipbookFrame *)-[CAFlipBook frameAtTime:](self->_flipbook, "frameAtTime:", -1);
}

- (NSArray)activeFrames
{
  return (NSArray *)-[CAFlipBook activeFrames](self->_flipbook, "activeFrames");
}

- (unint64_t)memoryUsage
{
  return -[CAFlipBook memoryUsage](self->_flipbook, "memoryUsage");
}

- (BOOL)isPowerSavingEnabled
{
  return -[CAFlipBook powerSavingEnabled](self->_flipbook, "powerSavingEnabled");
}

- (void)setPowerSavingEnabled:(BOOL)a3
{
  -[CAFlipBook setPowerSavingEnabled:](self->_flipbook, "setPowerSavingEnabled:", a3);
}

- (BOOL)is1HzFlipbook
{
  return -[CAFlipBook isOneHzFlipBook](self->_flipbook, "isOneHzFlipBook");
}

- (void)set1HzFlipbook:(BOOL)a3
{
  -[CAFlipBook setOneHzFlipBook:](self->_flipbook, "setOneHzFlipBook:", a3);
}

- (BOOL)cachesFramesOnExit
{
  return -[CAFlipBook cachesFramesOnExit](self->_flipbook, "cachesFramesOnExit");
}

- (void)setCachesFramesOnExit:(BOOL)a3
{
  -[CAFlipBook setCachesFramesOnExit:](self->_flipbook, "setCachesFramesOnExit:", a3);
}

- (void)renderFrameForPresentation:(id)a3 dateSpecifier:(id)a4 completion:(id)a5
{
  void (**v8)(id, void *, id);
  id v9;
  void *v10;
  CAFlipBook *flipbook;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  CAFlipBook *v21;
  void *v22;
  id v23;
  double v24;
  NSObject *v25;
  id v26;

  v8 = (void (**)(id, void *, id))a5;
  v9 = a4;
  objc_msgSend(a3, "flipbookContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  flipbook = self->_flipbook;
  objc_msgSend(v10, "caContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFlipBook setContextId:](flipbook, "setContextId:", objc_msgSend(v12, "contextId"));

  v13 = objc_msgSend(v10, "wantsTransform");
  if (self->_wantsTransform != (_DWORD)v13)
  {
    self->_wantsTransform = v13;
    -[CAFlipBook setWantsTransform:](self->_flipbook, "setWantsTransform:", v13);
  }
  v14 = objc_msgSend(v10, "isInverted");
  if (self->_inverted != (_DWORD)v14)
  {
    self->_inverted = v14;
    -[CAFlipBook setInverted:](self->_flipbook, "setInverted:", v14);
  }
  BSContinuousMachTimeNow();
  v16 = v15;
  v17 = mach_continuous_time();
  objc_msgSend(v9, "presentationDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "bls_machContinuousTime");

  if (v17 <= v19)
    v20 = v19;
  else
    v20 = v17;
  v21 = self->_flipbook;
  v26 = 0;
  -[CAFlipBook renderForTime:options:userInfo:error:](v21, "renderForTime:options:userInfo:error:", v20, 0, v9, &v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v26;
  BSContinuousMachTimeNow();
  if (v24 - v16 > 1.0)
  {
    bls_flipbook_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[BLSHFlipbook renderFrameForPresentation:dateSpecifier:completion:].cold.1();

  }
  v8[2](v8, v22, v23);

}

- (id)cancelAllFrames
{
  double v3;
  double v4;
  void *v5;
  double v6;
  NSObject *v7;

  BSContinuousMachTimeNow();
  v4 = v3;
  -[CAFlipBook cancel](self->_flipbook, "cancel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BSContinuousMachTimeNow();
  if (v6 - v4 > 1.0)
  {
    bls_flipbook_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[BLSHFlipbook cancelAllFrames].cold.1();

  }
  return v5;
}

- (void)collect
{
  -[CAFlipBook collect](self->_flipbook, "collect");
}

- (void)purge
{
  -[CAFlipBook purge](self->_flipbook, "purge");
}

- (void)invalidate
{
  id v3;
  CAFlipBook *flipbook;

  v3 = -[BLSHFlipbook cancelAllFrames](self, "cancelAllFrames");
  -[BLSHFlipbook collect](self, "collect");
  -[BLSHFlipbook purge](self, "purge");
  flipbook = self->_flipbook;
  self->_flipbook = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flipbook, 0);
}

- (void)initWithPlatformProvider:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 134218242;
  v3 = a1;
  v4 = 2114;
  v5 = a1;
  _os_log_debug_impl(&dword_2145AC000, a2, OS_LOG_TYPE_DEBUG, "%p created %{public}@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)renderFrameForPresentation:dateSpecifier:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2145AC000, v0, v1, "%p -[CAFlipBook renderForTime:options:userInfo:error:] took %.5fs. Likely dupe of rdar://78634442", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)cancelAllFrames
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2145AC000, v0, v1, "%p -[CAFlipBook cancel] took %.5fs. Likely dupe of rdar://78634442", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
