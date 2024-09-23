@implementation NUImageDataJob

- (id)scalePolicy
{
  void *v2;
  void *v3;

  -[NUImageDataJob imageDataRequest](self, "imageDataRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scalePolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)wantsOutputGeometry
{
  return 1;
}

- (BOOL)wantsOutputImage
{
  return 1;
}

- (BOOL)wantsCompleteStage
{
  return 1;
}

- (id)cacheKey
{
  NUDigest *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;

  v3 = objc_alloc_init(NUDigest);
  -[NURenderJob renderNode](self, "renderNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nu_updateDigest:", v3);

  -[NUImageDataJob imageDataRequest](self, "imageDataRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataExtractor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nu_updateDigest:", v3);

  objc_msgSend(v5, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nu_updateDigest:", v3);

  objc_msgSend(v5, "colorSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nu_updateDigest:", v3);

  objc_msgSend(v5, "regionPolicy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderJob outputGeometry](self, "outputGeometry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "regionForGeometry:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  if (v11)
    objc_msgSend(v11, "bounds", v14, v15);
  -[NUDigest addBytes:length:](v3, "addBytes:length:", &v14, 32);
  -[NUDigest finalize](v3, "finalize");
  -[NUDigest stringValue](v3, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)requestOptions
{
  void *v2;
  void *v3;

  -[NUImageDataJob imageDataRequest](self, "imageDataRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)newRenderPipelineStateForEvaluationMode:(int64_t)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NUImageDataJob;
  v4 = -[NURenderJob newRenderPipelineStateForEvaluationMode:](&v7, sel_newRenderPipelineStateForEvaluationMode_, a3);
  -[NURenderJob request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnableTransparency:", objc_msgSend(v5, "wantsAlpha"));

  return v4;
}

- (BOOL)render:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NUStorageImageBuffer *v13;
  NUStorageImageBuffer *renderBuffer;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  CIRenderTask *v20;
  CIRenderTask *renderTask;
  BOOL v22;
  NSObject *v24;
  void *v25;
  void *specific;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  -[NUImageDataJob imageDataRequest](self, "imageDataRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "regionPolicy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderJob outputGeometry](self, "outputGeometry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "regionForGeometry:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v8, "bounds");
  +[NUFactory sharedFactory](NUFactory, "sharedFactory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "surfaceStoragePool");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[NUPixelFormat RGBAh](NUPixelFormat, "RGBAh");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "newStorageWithSize:format:", (unsigned __int128)0, v11);

  if (!v12)
  {
    NUAssertLogger_9062();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No storage allocated"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v25;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_9062();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v28)
      {
        v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v32 = (void *)MEMORY[0x1E0CB3978];
        v33 = v31;
        objc_msgSend(v32, "callStackSymbols");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v31;
        v43 = 2114;
        v44 = v35;
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
      v42 = v30;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUImageDataJob render:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageDataRequest.m", 180, CFSTR("No storage allocated"), v36, v37, v38, v39, v40);
  }
  v13 = -[NUStorageImageBuffer initWithStorage:fromPool:]([NUStorageImageBuffer alloc], "initWithStorage:fromPool:", v12, v10);
  renderBuffer = self->_renderBuffer;
  self->_renderBuffer = v13;

  -[NURenderJob outputImage](self, "outputImage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUStorageImageBuffer storage](self->_renderBuffer, "storage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[NUColorSpace workingColorSpace](NUColorSpace, "workingColorSpace");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[NURenderJob imageSize](self, "imageSize");
  -[NURenderJob renderImage:into:colorSpace:roi:imageSize:error:](self, "renderImage:into:colorSpace:roi:imageSize:error:", v15, v16, v17, v8, v18, v19, a3);
  v20 = (CIRenderTask *)objc_claimAutoreleasedReturnValue();
  renderTask = self->_renderTask;
  self->_renderTask = v20;

  v22 = self->_renderTask != 0;
  return v22;
}

- (BOOL)complete:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  double v18;
  NSObject *v20;
  void *v21;
  void *specific;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[5];
  id v37;
  _BYTE *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _BYTE buf[32];
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_9062();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v21;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_9062();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v28 = (void *)MEMORY[0x1E0CB3978];
        v29 = v27;
        objc_msgSend(v28, "callStackSymbols");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v27;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v31;
        _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v26;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUImageDataJob complete:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageDataRequest.m", 191, CFSTR("Invalid parameter not satisfying: %s"), v32, v33, v34, v35, (uint64_t)"error != NULL");
  }
  -[CIRenderTask nu_waitUntilCompletedAndReturnError:](self->_renderTask, "nu_waitUntilCompletedAndReturnError:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_155_9073);
    v6 = (void *)_NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEBUG))
    {
      v17 = v6;
      objc_msgSend(v5, "kernelExecutionTime");
      *(_DWORD *)buf = 134218496;
      *(double *)&buf[4] = v18 * 1000.0;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = objc_msgSend(v5, "passCount");
      *(_WORD *)&buf[18] = 2048;
      *(double *)&buf[20] = (float)((float)objc_msgSend(v5, "pixelsProcessed") * 0.00000095367);
      _os_log_debug_impl(&dword_1A6553000, v17, OS_LOG_TYPE_DEBUG, "CIRenderInfo: exec=%0.3fms pass=%d pixels=%0.3fMpix", buf, 0x1Cu);

    }
    -[NURenderJob renderer:](self, "renderer:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v13 = 0;
LABEL_20:

      goto LABEL_21;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&buf[24] = __Block_byref_object_copy__9075;
    v47 = __Block_byref_object_dispose__9076;
    v48 = 0;
    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__9075;
    v44 = __Block_byref_object_dispose__9076;
    v45 = 0;
    -[NUImageDataJob imageDataRequest](self, "imageDataRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUStorageImageBuffer storage](self->_renderBuffer, "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __27__NUImageDataJob_complete___block_invoke;
    v36[3] = &unk_1E5061960;
    v38 = buf;
    v36[4] = self;
    v10 = v8;
    v37 = v10;
    v39 = &v40;
    v11 = objc_msgSend(v9, "useAsCIImageWithOptions:renderer:block:", 0, v7, v36);

    if (v11 == 1)
    {
      v12 = *(void **)(*(_QWORD *)&buf[8] + 40);
      if (v12)
      {
        objc_storeStrong((id *)&self->_data, v12);
        v13 = 1;
LABEL_19:

        _Block_object_dispose(&v40, 8);
        _Block_object_dispose(buf, 8);

        goto LABEL_20;
      }
      if (v41[5])
        +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("unable to extractDataToDictionary"), v10);
      else
        +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("unable to extractDataToDictionary"), v10);
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[NUError failureError:object:](NUError, "failureError:object:", CFSTR("Failed to use render buffer as CIImage"), self->_renderBuffer);
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = 0;
    *a3 = v16;
    goto LABEL_19;
  }
  -[NURenderJob request](self, "request");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");
  +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("failed to render"), v15, *a3);
  *a3 = (id)objc_claimAutoreleasedReturnValue();

  v13 = 0;
LABEL_21:

  return v13;
}

- (id)extractDataToDictionary:(id)a3 bounds:(id *)a4 dataExtractor:(id)a5 options:(id)a6 colorSpace:(CGColorSpace *)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  double var0;
  double var1;
  double v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGRect v33;
  CGRect v34;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  -[NURenderJob renderer:](self, "renderer:", a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    var0 = (double)a4->var0.var0;
    var1 = (double)a4->var0.var1;
    v20 = (double)a4->var1.var0;
    v21 = (double)a4->var1.var1;
    objc_msgSend(v14, "extent");
    v34.origin.x = v22;
    v34.origin.y = v23;
    v34.size.width = v24;
    v34.size.height = v25;
    v33.origin.x = var0;
    v33.origin.y = var1;
    v33.size.width = v20;
    v33.size.height = v21;
    if (!CGRectEqualToRect(v33, v34))
    {
      memset(&v32, 0, sizeof(v32));
      CGAffineTransformMakeTranslation(&v32, -var0, -var1);
      objc_msgSend(v14, "imageByClampingToExtent");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "imageByCroppingToRect:", var0, var1, v20, v21);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = v32;
      objc_msgSend(v27, "imageByApplyingTransform:", &v31);
      v14 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v17, "context");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C9DDB8], "extractDataToDictionary:dataExtractor:options:context:colorSpace:error:", v14, v15, v16, v28, a7, a8);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (id)result
{
  _NUImageDataResult *v3;
  void *v4;

  v3 = objc_alloc_init(_NUImageDataResult);
  -[_NUImageDataResult setData:](v3, "setData:", self->_data);
  -[NURenderJob outputGeometry](self, "outputGeometry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUImageDataResult setGeometry:](v3, "setGeometry:", v4);

  return v3;
}

- (void)cleanUp
{
  NSDictionary *data;
  NUStorageImageBuffer *renderBuffer;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NUImageDataJob;
  -[NURenderJob cleanUp](&v5, sel_cleanUp);
  data = self->_data;
  self->_data = 0;

  renderBuffer = self->_renderBuffer;
  self->_renderBuffer = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderTask, 0);
  objc_storeStrong((id *)&self->_renderBuffer, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

void __27__NUImageDataJob_complete___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  _OWORD v18[2];
  _OWORD v19[2];
  CGRect v20;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "extent");
  v20.origin.x = v5;
  v20.origin.y = v6;
  v20.size.width = v7;
  v20.size.height = v8;
  NU::RectT<long>::RectT(v19, &v20, 3);
  v18[0] = v19[0];
  v18[1] = v19[1];
  objc_msgSend(*(id *)(a1 + 40), "dataExtractor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "requestOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "colorSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v3, "extractDataToDictionary:bounds:dataExtractor:options:colorSpace:error:", v4, v18, v9, v10, objc_msgSend(v11, "CGColorSpace"), &v17);
  v12 = objc_claimAutoreleasedReturnValue();

  v13 = v17;
  v14 = v17;
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v12;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v13);

}

@end
