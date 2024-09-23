@implementation PKMetalView

- (id)metalLayer
{
  if (a1)
    a1 = (id *)a1[53];
  return a1;
}

- (void)resizeDrawableIfNecessary
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSObject *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  NSObject *v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  int v31;
  double v32;
  __int16 v33;
  double v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    objc_msgSend(result, "frame");
    v3 = v2;
    v5 = v4;
    objc_msgSend(*((id *)v1 + 52), "setFrame:", 0.0, 0.0);
    objc_msgSend(*((id *)v1 + 53), "setFrame:", 0.0, 0.0, v3, v5);
    if (*((_BYTE *)v1 + 432))
    {
      if (v3 > 0.0 && v5 > 0.0)
      {
        v6 = *((double *)v1 + 56) / v3;
        if (v6 < *((double *)v1 + 57) / v5)
          v6 = *((double *)v1 + 57) / v5;
        objc_msgSend(*((id *)v1 + 53), "setContentsScale:", v6);
      }
      v7 = *((double *)v1 + 56);
      v8 = *((double *)v1 + 57);
      result = (void *)objc_msgSend(*((id *)v1 + 53), "drawableSize");
      if (v7 != v10 || v8 != v9)
      {
        v12 = os_log_create("com.apple.pencilkit", ");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          v27 = *((double *)v1 + 56);
          v28 = *((double *)v1 + 57);
          -[PKMetalView metalLayer]((id *)v1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "contentsScale");
          v31 = 134218496;
          v32 = v27;
          v33 = 2048;
          v34 = v28;
          v35 = 2048;
          v36 = v30;
          _os_log_debug_impl(&dword_1BE213000, v12, OS_LOG_TYPE_DEBUG, "Resize drawable to: %g %g, contentsScale: %g", (uint8_t *)&v31, 0x20u);

        }
        v13 = *((double *)v1 + 56);
        v14 = *((double *)v1 + 57);
        v15 = (void *)*((_QWORD *)v1 + 53);
        return (void *)objc_msgSend(v15, "setDrawableSize:", v13, v14);
      }
    }
    else
    {
      objc_msgSend(*((id *)v1 + 53), "contentsScale");
      v17 = v3 * v16;
      objc_msgSend(*((id *)v1 + 53), "contentsScale");
      +[PKMetalUtility clampedPixelSize:](PKMetalUtility, "clampedPixelSize:", v17, v5 * v18);
      v20 = v19;
      v22 = v21;
      result = (void *)objc_msgSend(*((id *)v1 + 53), "drawableSize");
      if (v20 != v24 || v22 != v23)
      {
        v26 = os_log_create("com.apple.pencilkit", ");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          v31 = 134218240;
          v32 = v20;
          v33 = 2048;
          v34 = v22;
          _os_log_debug_impl(&dword_1BE213000, v26, OS_LOG_TYPE_DEBUG, "Resize drawable to: %g %g", (uint8_t *)&v31, 0x16u);
        }

        v15 = (void *)*((_QWORD *)v1 + 53);
        v13 = v20;
        v14 = v22;
        return (void *)objc_msgSend(v15, "setDrawableSize:", v13, v14);
      }
    }
  }
  return result;
}

- (id)initWithFrame:(double)a3 andPixelSize:(double)a4 pixelFormat:(double)a5
{
  id *v11;
  id *v12;
  BOOL v13;
  id v14;
  void *v15;
  void *v16;
  objc_super v18;

  if (!a1)
    return 0;
  v18.receiver = a1;
  v18.super_class = (Class)PKMetalView;
  v11 = (id *)objc_msgSendSuper2(&v18, sel_initWithFrame_);
  v12 = v11;
  if (v11)
  {
    v11[55] = a2;
    v13 = a7 != *MEMORY[0x1E0C9D820];
    if (a8 != *(double *)(MEMORY[0x1E0C9D820] + 8))
      v13 = 1;
    *((_BYTE *)v11 + 432) = v13;
    *((double *)v11 + 56) = a7;
    *((double *)v11 + 57) = a8;
    v14 = objc_alloc_init(MEMORY[0x1E0CD27E0]);
    objc_storeStrong(v12 + 53, v14);
    objc_msgSend(v12[53], "setPixelFormat:", v12[55]);
    objc_msgSend(v12, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSublayer:", v14);

    +[PKMetalUtility defaultDevice](PKMetalUtility, "defaultDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDevice:", v16);

    objc_msgSend(v14, "setOpaque:", 1);
    objc_msgSend(v14, "setFramebufferOnly:", 1);
    objc_msgSend(v14, "setLowLatency:", 1);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v14, "setLowWorkload:", 1);
    objc_msgSend(v14, "setAllowsDisplayCompositingWithCopy:", 0);
    if (!*((_BYTE *)v12 + 432))
    {
      +[PKMetalUtility layerContentsScale](PKMetalUtility, "layerContentsScale");
      objc_msgSend(v14, "setContentsScale:");
    }
    -[PKMetalView resizeDrawableIfNecessary](v12);

    objc_msgSend(v12, "setUserInteractionEnabled:", 0);
  }
  return v12;
}

- (uint64_t)setPixelFormat:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    if (*(_QWORD *)(result + 440) != a2)
    {
      *(_QWORD *)(result + 440) = a2;
      -[PKMetalView flushDrawables](result);
      return objc_msgSend(*(id *)(v3 + 424), "setPixelFormat:", a2);
    }
  }
  return result;
}

- (uint64_t)flushDrawables
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 424), "discardContents");
    return objc_msgSend(*(id *)(v1 + 424), "removeBackBuffers");
  }
  return result;
}

- (void)setUseLuminanceColorFilter:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  if (a1 && *(unsigned __int8 *)(a1 + 434) != a2)
  {
    objc_msgSend(*(id *)(a1 + 424), "removeFromSuperlayer");
    objc_msgSend(*(id *)(a1 + 416), "removeFromSuperlayer");
    v4 = *(void **)(a1 + 416);
    *(_QWORD *)(a1 + 416) = 0;

    *(_BYTE *)(a1 + 434) = a2;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (a2)
    {
      objc_msgSend(v5, "addObserver:selector:name:object:", a1, sel_accessibilityInvertColorsStatusDidChange_, *MEMORY[0x1E0DC4528], 0);

      v7 = objc_alloc_init(MEMORY[0x1E0CD2708]);
      v8 = *(void **)(a1 + 416);
      *(_QWORD *)(a1 + 416) = v7;

      objc_msgSend(*(id *)(a1 + 416), "setReducesCaptureBitDepth:", 1);
      objc_msgSend(*(id *)(a1 + 416), "setIgnoresScreenClip:", 1);
      objc_msgSend(*(id *)(a1 + 416), "setScale:", 0.25);
      objc_msgSend((id)a1, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSublayer:", *(_QWORD *)(a1 + 416));

      objc_msgSend(*(id *)(a1 + 416), "setMask:", *(_QWORD *)(a1 + 424));
      objc_msgSend((id)a1, "bounds");
      v11 = v10;
      objc_msgSend((id)a1, "bounds");
      objc_msgSend(*(id *)(a1 + 416), "setFrame:", 0.0, 0.0, v11);
      +[PKMetalView installLuminanceColorFilterOnLayer:lightLuma:darkLuma:](0.0, 1.0, (uint64_t)PKMetalView, *(void **)(a1 + 416));
    }
    else
    {
      objc_msgSend(v5, "removeObserver:name:object:", a1, *MEMORY[0x1E0DC4528], 0);

      objc_msgSend((id)a1, "layer");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSublayer:", *(_QWORD *)(a1 + 424));

    }
  }
}

+ (void)installLuminanceColorFilterOnLayer:(uint64_t)a3 lightLuma:(void *)a4 darkLuma:
{
  id v6;
  void *v7;
  void *v8;
  CGContext *v9;
  CGContext *v10;
  _BOOL4 IsInvertColorsEnabled;
  double v12;
  CGImageRef Image;
  void *v14;
  _QWORD v15[3];
  CGRect v16;
  CGRect v17;

  v15[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setName:", CFSTR("gaussianBlur"));
  objc_msgSend(v7, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("inputNormalizeEdges"));
  objc_msgSend(v7, "setValue:forKeyPath:", &unk_1E77ECF48, CFSTR("inputRadius"));
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E20]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v9 = DKUCreateRGBABitmapContext(0, 256.0, 1.0, 1.0);
  if (v9)
  {
    v10 = v9;
    IsInvertColorsEnabled = UIAccessibilityIsInvertColorsEnabled();
    if (IsInvertColorsEnabled)
      v12 = a1;
    else
      v12 = a2;
    if (!IsInvertColorsEnabled)
      a2 = a1;
    CGContextSetRGBFillColor(v10, v12, v12, v12, 1.0);
    v16.origin.x = 0.0;
    v16.origin.y = 0.0;
    v16.size.height = 1.0;
    v16.size.width = 128.0;
    CGContextFillRect(v10, v16);
    CGContextSetRGBFillColor(v10, a2, a2, a2, 1.0);
    v17.origin.y = 0.0;
    v17.size.height = 1.0;
    v17.origin.x = 128.0;
    v17.size.width = 128.0;
    CGContextFillRect(v10, v17);
    Image = CGBitmapContextCreateImage(v10);
    CGContextRelease(v10);
  }
  else
  {
    Image = 0;
  }
  objc_msgSend(v8, "setValue:forKey:", Image, CFSTR("inputColorMap"));

  v15[0] = v7;
  v15[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFilters:", v14);

}

- (void)setDoubleBuffered:(uint64_t)a1
{
  uint64_t v4;

  if (a1)
  {
    if (qword_1EF5604D0 != -1)
      dispatch_once(&qword_1EF5604D0, &__block_literal_global_60);
    if (_MergedGlobals_1_0 && *(unsigned __int8 *)(a1 + 433) != a2)
    {
      *(_BYTE *)(a1 + 433) = a2;
      if (a2)
        v4 = 2;
      else
        v4 = 3;
      objc_msgSend(*(id *)(a1 + 424), "setMaximumDrawableCount:", v4);
    }
  }
}

- (void)accessibilityInvertColorsStatusDidChange:(id)a3
{
  if (self)
  {
    if (self->_useLuminanceColorFilter)
      +[PKMetalView installLuminanceColorFilterOnLayer:lightLuma:darkLuma:](0.0, 1.0, (uint64_t)PKMetalView, self->_backdropLayer);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalLayer, 0);
  objc_storeStrong((id *)&self->_backdropLayer, 0);
}

@end
