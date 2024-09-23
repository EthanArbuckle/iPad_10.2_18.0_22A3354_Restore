@implementation NUProcessorCache

- (NUProcessorCache)init
{
  void *v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *specific;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  objc_class *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_45_14554);
  v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = v3;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v9;
    _os_log_error_impl(&dword_1A6553000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_45_14554);
      goto LABEL_8;
    }
    if (v10 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_45_14554);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v12 = (void *)MEMORY[0x1E0CB3978];
    v13 = v11;
    objc_msgSend(v12, "callStackSymbols");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v15;
    _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v18 = (void *)MEMORY[0x1E0CB3978];
  v19 = specific;
  v13 = v16;
  objc_msgSend(v18, "callStackSymbols");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v29 = specific;
  v30 = 2114;
  v31 = v21;
  _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v22 = (objc_class *)objc_opt_class();
  NSStringFromClass(v22);
  v23 = objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUProcessorCache init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Performance/NUProcessorCache.m", 28, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v24, v25, v26, v27, v23);
}

- (NUProcessorCache)initWithImage:(id)a3
{
  CIImage *v4;
  CIImage *v5;
  NUProcessorCache *v6;
  NSString *label;
  CIImage *inputImage;
  CIImage *v9;
  uint64_t v10;
  NUPixelFormat *pixelFormat;
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
  v4 = (CIImage *)a3;
  if (!v4)
  {
    NUAssertLogger_14537();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "image != nil");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v14;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14537();
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
    _NUAssertFailHandler((uint64_t)"-[NUProcessorCache initWithImage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Performance/NUProcessorCache.m", 32, CFSTR("Invalid parameter not satisfying: %s"), v25, v26, v27, v28, (uint64_t)"image != nil");
  }
  v5 = v4;
  v29.receiver = self;
  v29.super_class = (Class)NUProcessorCache;
  v6 = -[NUProcessorCache init](&v29, sel_init);
  label = v6->_label;
  v6->_label = (NSString *)CFSTR("NUProcessorCache");

  inputImage = v6->_inputImage;
  v6->_inputImage = v5;
  v9 = v5;

  +[NUPixelFormat RGBAh](NUPixelFormat, "RGBAh");
  v10 = objc_claimAutoreleasedReturnValue();
  pixelFormat = v6->_pixelFormat;
  v6->_pixelFormat = (NUPixelFormat *)v10;

  return v6;
}

- (CIImage)outputImage
{
  void *v3;
  uint64_t v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  _QWORD *v28;
  uint64_t *v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  _QWORD v38[5];
  id v39;
  _OWORD v40[2];
  CGRect v41;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__14527;
  v38[4] = __Block_byref_object_dispose__14528;
  v39 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__14527;
  v36 = __Block_byref_object_dispose__14528;
  -[NUProcessorCache inputImage](self, "inputImage");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  -[NUProcessorCache pixelFormat](self, "pixelFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "CIFormat");
  objc_msgSend((id)v33[5], "extent");
  v41.origin.x = v5;
  v41.origin.y = v6;
  v41.size.width = v7;
  v41.size.height = v8;
  NU::RectT<long>::RectT(v40, &v41, 3);
  v24 = v40[1];
  v25 = v40[0];
  v42 = *MEMORY[0x1E0C9E138];
  v43[0] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDC8], "emptyImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v33[5], "extent");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[NUProcessorCache label](self, "label");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend((id)v33[5], "digest");
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __31__NUProcessorCache_outputImage__block_invoke_2;
  v26[3] = &unk_1E5062730;
  v28 = v38;
  v21 = v3;
  v30 = v25;
  v31 = v24;
  v27 = v21;
  v29 = &v32;
  objc_msgSend(v10, "imageWithExtent:processorDescription:argumentDigest:inputFormat:outputFormat:options:roiCallback:processor:", v19, v20, 0, v4, v9, &__block_literal_global_14531, v12, v14, v16, v18, v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(v38, 8);

  return (CIImage *)v22;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NUPixelFormat)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(id)a3
{
  objc_storeStrong((id *)&self->_pixelFormat, a3);
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputImage, 0);
  objc_storeStrong((id *)&self->_pixelFormat, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_processorImage, 0);
}

void __31__NUProcessorCache_outputImage__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGPoint v20;
  CGSize v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int64x2_t v25;
  CGPoint origin;
  int64x2_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  _OWORD v33[2];
  CGRect v34;
  CGRect v35;

  v4 = a3;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", objc_msgSend(*(id *)(a1 + 32), "metalFormat"), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStorageMode:", 2);
    objc_msgSend(v5, "setUsage:", 3);
    objc_msgSend(v4, "metalTexture");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "newTextureWithDescriptor:", v5);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDE8]), "initWithMTLTexture:commandBuffer:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0);
    objc_msgSend(v11, "setFlipped:", 1);
    objc_msgSend(v11, "setColorSpace:", 0);
    objc_msgSend(v11, "setAlphaMode:", 0);
    objc_msgSend(v4, "metalContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v12, "startTaskToRender:toDestination:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v11, 0);

    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = 0;

  }
  objc_msgSend(v4, "region");
  v35.origin.x = v16;
  v35.origin.y = v17;
  v35.size.width = v18;
  v35.size.height = v19;
  NU::RectT<long>::RectT(&v34, &v35, 3);
  origin = v34.origin;
  v20 = *(CGPoint *)(a1 + 56);
  v21 = *(CGSize *)(a1 + 72);
  v35 = v34;
  v34.origin = v20;
  v34.size = v21;
  NU::RectT<long>::Intersection((uint64_t)v33, (uint64_t *)&v35, (uint64_t *)&v34);
  v25 = (int64x2_t)v33[0];
  v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v29 = v33[0];
  v30 = 0;
  v31 = v33[1];
  v32 = 1;
  objc_msgSend(v4, "metalTexture");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = vsubq_s64(v25, (int64x2_t)origin);
  v28 = 0;
  objc_msgSend(v4, "metalCommandBuffer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[NUCopyKernel copyFromTexture:region:toTexture:atPoint:withCommandBuffer:](NUCopyKernel, "copyFromTexture:region:toTexture:atPoint:withCommandBuffer:", v22, &v29, v23, &v27, v24);

}

double __31__NUProcessorCache_outputImage__block_invoke()
{
  return 0.0;
}

@end
