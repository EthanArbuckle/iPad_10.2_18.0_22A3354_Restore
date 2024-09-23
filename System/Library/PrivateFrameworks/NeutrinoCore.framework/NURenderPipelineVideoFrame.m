@implementation NURenderPipelineVideoFrame

- (id)description
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  CMTime time;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  time = (CMTime)self->_frameTime;
  v5 = (__CFString *)CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &time);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p frameTime: %@, pixelBuffer: %p>"), v4, self, v5, self->_pixelBuffer);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NURenderPipelineVideoFrame)initWithFrameTime:(id *)a3 pixelBuffer:(__CVBuffer *)a4
{
  NURenderPipelineVideoFrame *v6;
  int64_t var3;
  NSObject *v9;
  void *v10;
  void *specific;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    NUAssertLogger_1305();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "pixelBuffer != nil");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v10;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_1305();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v17 = (void *)MEMORY[0x1E0CB3978];
        v18 = v16;
        objc_msgSend(v17, "callStackSymbols");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v16;
        v28 = 2114;
        v29 = v20;
        _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v15;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineVideoFrame initWithFrameTime:pixelBuffer:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineState.m", 357, CFSTR("Invalid parameter not satisfying: %s"), v21, v22, v23, v24, (uint64_t)"pixelBuffer != nil");
  }
  v25.receiver = self;
  v25.super_class = (Class)NURenderPipelineVideoFrame;
  v6 = -[NURenderPipelineVideoFrame init](&v25, sel_init);
  var3 = a3->var3;
  *(_OWORD *)&v6->_frameTime.value = *(_OWORD *)&a3->var0;
  v6->_frameTime.epoch = var3;
  v6->_pixelBuffer = a4;
  CFRetain(a4);
  return v6;
}

- (void)dealloc
{
  __CVBuffer *pixelBuffer;
  objc_super v4;

  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer)
    CFRelease(pixelBuffer);
  v4.receiver = self;
  v4.super_class = (Class)NURenderPipelineVideoFrame;
  -[NURenderPipelineVideoFrame dealloc](&v4, sel_dealloc);
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_frameTime, 24, 1, 0);
  return result;
}

@end
