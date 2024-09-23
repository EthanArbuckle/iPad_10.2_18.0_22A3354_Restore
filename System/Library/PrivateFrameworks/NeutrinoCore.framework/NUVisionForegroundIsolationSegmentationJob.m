@implementation NUVisionForegroundIsolationSegmentationJob

- ($0AC6E346AE4835514AAA8AC86D8F4844)idealModelSize
{
  int64_t v2;
  int64_t v3;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v2 = 512;
  v3 = 512;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (id)scalePolicy
{
  uint64_t v2;
  uint64_t v3;

  v2 = -[NUVisionForegroundIsolationSegmentationJob idealModelSize](self, "idealModelSize");
  return -[NUPixelCountScalePolicy initWithTargetPixelCount:]([NUPixelCountScalePolicy alloc], "initWithTargetPixelCount:", v2 * v3);
}

- (BOOL)wantsOutputImage
{
  return 1;
}

- (BOOL)wantsOutputGeometry
{
  return 1;
}

- (BOOL)wantsCompleteStage
{
  return 0;
}

- (BOOL)render:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  BOOL v15;
  void *v16;
  __CVBuffer *v17;
  NUCVPixelBuffer *v18;
  NUImageBuffer *maskBuffer;
  void *v20;
  double v21;
  double v22;
  NUImageBuffer *v23;
  NUImageBuffer *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  NSObject *v32;
  void *v33;
  void *specific;
  NSObject *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_21151();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v52 = v33;
      _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_21151();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v36)
      {
        v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v40 = (void *)MEMORY[0x1E0CB3978];
        v41 = v39;
        objc_msgSend(v40, "callStackSymbols");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v52 = v39;
        v53 = 2114;
        v54 = v43;
        _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v36)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v52 = v38;
      _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUVisionForegroundIsolationSegmentationJob render:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVisionForegroundIsolationSegmentationRequest.m", 76, CFSTR("Invalid parameter not satisfying: %s"), v44, v45, v46, v47, (uint64_t)"error != nil");
  }
  -[NURenderJob outputImage](self, "outputImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderJob outputGeometry](self, "outputGeometry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "orientation");
  objc_msgSend(v5, "imageByApplyingOrientation:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[NUVisionBasedRenderJob newRequestHandlerForImage:error:](self, "newRequestHandlerForImage:error:", v8, a3);
  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0CEDF10]);
    v50 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "performRequests:error:", v11, a3);

    if (!v12)
    {
      v15 = 0;
LABEL_23:

      goto LABEL_24;
    }
    objc_msgSend(v10, "results");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v13, "count") >= 2)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      +[NUError invalidError:object:](NUError, "invalidError:object:", CFSTR("Unexpected number of observations"), v49);
      v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
      v15 = 0;
      *a3 = v14;
LABEL_22:

      goto LABEL_23;
    }
    objc_msgSend(v13, "firstObject");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "allInstances");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (__CVBuffer *)objc_msgSend(v49, "generateMaskForInstances:error:", v16, a3);

    if (!v17)
    {
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to generate a mask for foreground instances"), v13, *a3);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    if (v7 == 1)
    {
      v18 = -[NUCVPixelBuffer initWithCVPixelBuffer:]([NUCVPixelBuffer alloc], "initWithCVPixelBuffer:", v17);
      maskBuffer = self->_maskBuffer;
      self->_maskBuffer = (NUImageBuffer *)v18;

      CVPixelBufferRelease(v17);
LABEL_19:
      v15 = 1;
      goto LABEL_22;
    }
    objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    CVPixelBufferRelease(v17);
    if (v7 == 6)
    {
      v7 = 8;
    }
    else if (v7 == 8)
    {
      v7 = 6;
    }
    objc_msgSend(v20, "imageByApplyingOrientation:", v7);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v48, "extent");
    v23 = +[NUVideoUtilities newPixelBufferOfSize:format:](NUVideoUtilities, "newPixelBufferOfSize:format:", vcvtpd_s64_f64(v21), vcvtpd_s64_f64(v22), 1278226534);
    v24 = self->_maskBuffer;
    self->_maskBuffer = v23;

    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDE8]), "initWithPixelBuffer:", -[NUImageBuffer CVPixelBuffer](self->_maskBuffer, "CVPixelBuffer"));
    v26 = objc_alloc_init(MEMORY[0x1E0C9DD90]);
    objc_msgSend(v26, "startTaskToRender:toDestination:error:", v48, v25, a3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
    {
      objc_msgSend(v27, "nu_waitUntilCompletedAndReturnError:", a3);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29 == 0;

      if (!v30)
        goto LABEL_19;
    }
    else
    {

    }
    v15 = 0;
    goto LABEL_22;
  }
  v15 = 0;
LABEL_24:

  return v15;
}

- (id)result
{
  _NUVisionForegroundIsolationSegmentationResult *v3;
  void *v4;
  _NUVisionForegroundIsolationSegmentationResult *v5;

  v3 = [_NUVisionForegroundIsolationSegmentationResult alloc];
  -[NUVisionForegroundIsolationSegmentationJob maskBuffer](self, "maskBuffer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_NUVisionForegroundIsolationSegmentationResult initWithMaskBuffer:](v3, "initWithMaskBuffer:", v4);

  return v5;
}

- (NUImageBuffer)maskBuffer
{
  return self->_maskBuffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskBuffer, 0);
}

@end
