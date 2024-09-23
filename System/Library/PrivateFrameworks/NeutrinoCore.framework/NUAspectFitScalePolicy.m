@implementation NUAspectFitScalePolicy

- (NUAspectFitScalePolicy)initWithTargetPixelSize:(id)a3
{
  int64_t var1;
  int64_t var0;
  void *v6;
  void *v7;
  objc_super v9;

  var1 = a3.var1;
  var0 = a3.var0;
  if (a3.var0 >= a3.var1)
  {
    var1 = a3.var0;
    var0 = a3.var1;
  }
  else if ((a3.var1 | a3.var0) < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("NUGeometryPrimitives.h"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(width >= 0) && (height >= 0)"));

  }
  v9.receiver = self;
  v9.super_class = (Class)NUAspectFitScalePolicy;
  return -[NUFitScalePolicy initWithTargetPixelSize:](&v9, sel_initWithTargetPixelSize_, var1, var0);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)scaleForImageSize:(id)a3
{
  int64_t var1;
  int64_t var0;
  int64_t width;
  int64_t height;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  int64_t v13;
  int64_t v14;
  NSObject *v15;
  void *v16;
  void *specific;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v35 = *MEMORY[0x1E0C80C00];
  if (!a3.var0 || (var1 = a3.var1) == 0)
  {
    NUAssertLogger_21783();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "!NUPixelSizeIsEmpty(imageSize)");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v16;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_21783();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v23 = (void *)MEMORY[0x1E0CB3978];
        v24 = v22;
        objc_msgSend(v23, "callStackSymbols");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v22;
        v33 = 2114;
        v34 = v26;
        _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v21;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUAspectFitScalePolicy scaleForImageSize:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUScalePolicy.m", 137, CFSTR("Invalid parameter not satisfying: %s"), v27, v28, v29, v30, (uint64_t)"!NUPixelSizeIsEmpty(imageSize)");
  }
  var0 = a3.var0;
  if (a3.var0 >= a3.var1)
  {
    width = self->super._size.width;
    height = self->super._size.height;
  }
  else
  {
    height = self->super._size.width;
    width = self->super._size.height;
    if ((height | width) < 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("NUGeometryPrimitives.h"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(width >= 0) && (height >= 0)"));

    }
  }
  v9 = NUScaleToFitSizeInSize(var0, var1, width, height);
  v11 = v10;
  v12 = NUScaleCompare(v9, v10, NUScaleOne, *((uint64_t *)&NUScaleOne + 1));
  if (v12 >= 0)
    v13 = *((_QWORD *)&NUScaleOne + 1);
  else
    v13 = v11;
  if (v12 >= 0)
    v14 = NUScaleOne;
  else
    v14 = v9;
  result.var1 = v13;
  result.var0 = v14;
  return result;
}

@end
