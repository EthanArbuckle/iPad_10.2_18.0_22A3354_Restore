@implementation JFXDisparityAsMatte

+ (BOOL)_defaultMatteGeneratorPrefersDepth
{
  return 0;
}

- (id)initForFrameSet:(id)a3
{
  id v4;
  CVPixelBufferPoolRef *v5;
  id v6;
  __CVBuffer *v7;
  double Width;
  uint64_t Height;
  objc_super v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)JFXDisparityAsMatte;
  v5 = -[JFXMatting initForFrameSet:](&v12, sel_initForFrameSet_, v4);
  if (v5)
  {
    objc_msgSend(v4, "depthData");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = (__CVBuffer *)objc_msgSend(v6, "depthDataMap");

    Width = (double)CVPixelBufferGetWidth(v7);
    Height = (unint64_t)(double)CVPixelBufferGetHeight(v7);
    JFXCreatePixelBufferPool((unint64_t)Width, Height, 825306677, v5 + 5);
    JFXCreatePixelBufferPool(Height, (unint64_t)Width, 825306677, v5 + 6);
    JFXCreatePixelBufferPool((unint64_t)*((double *)v5 + 1), (unint64_t)*((double *)v5 + 2), 825306677, v5 + 7);
    JFXCreatePixelBufferPool((unint64_t)*((double *)v5 + 1), (unint64_t)*((double *)v5 + 2), 1751411059, v5 + 8);
    v11.receiver = v5;
    v11.super_class = (Class)JFXDisparityAsMatte;
    -[JFXMatting setReady:](&v11, sel_setReady_, 1);
  }

  return v5;
}

- (void)alphaMatteForFrameSet:(id)a3 mattingPerfState:(id)a4 completionHandler:(id)a5
{
  id v7;
  __CVPixelBufferPool *fixedPointBufferPool;
  void (**v9)(id, void *);
  void *v10;
  int v11;
  void *v12;
  void *v13;
  __CVBuffer *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  vImage_Buffer v19;
  vImage_Buffer v20;
  vImage_Buffer v21;
  vImage_Buffer v22;
  vImage_Buffer dest;
  vImage_Buffer src;
  CVPixelBufferRef v25;
  CVPixelBufferRef v26;
  CVPixelBufferRef v27;
  CVPixelBufferRef v28;
  CVPixelBufferRef pixelBufferOut;

  v7 = a3;
  v28 = 0;
  pixelBufferOut = 0;
  v26 = 0;
  v27 = 0;
  v25 = 0;
  fixedPointBufferPool = self->_fixedPointBufferPool;
  v9 = (void (**)(id, void *))a5;
  CVPixelBufferPoolCreatePixelBuffer(0, fixedPointBufferPool, &pixelBufferOut);
  CVPixelBufferPoolCreatePixelBuffer(0, self->_rotatedFPBufferPool, &v28);
  CVPixelBufferPoolCreatePixelBuffer(0, self->_scaledUpFPBufferPool, &v27);
  if (self->super._cameraLocation == 2)
    CVPixelBufferPoolCreatePixelBuffer(0, self->_scaledUpFPBufferPool, &v26);
  CVPixelBufferPoolCreatePixelBuffer(0, self->_alphaMattePool, &v25);
  objc_msgSend(v7, "depthData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "depthDataType");
  objc_msgSend(v7, "depthData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11 == 1751411059)
  {
    v14 = (__CVBuffer *)objc_msgSend(objc_retainAutorelease(v12), "depthDataMap");
  }
  else
  {
    objc_msgSend(v12, "depthDataByConvertingToDepthDataType:", 1751411059);
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = (__CVBuffer *)objc_msgSend(v15, "depthDataMap");

  }
  CVPixelBufferLockBaseAddress(v14, 1uLL);
  CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
  CVPixelBufferLockBaseAddress(v28, 0);
  CVPixelBufferLockBaseAddress(v27, 0);
  if (v26)
    CVPixelBufferLockBaseAddress(v26, 0);
  CVPixelBufferLockBaseAddress(v25, 0);
  objc_msgSend(v7, "depthData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    memset(&src, 0, sizeof(src));
    JFXToVImage(v14, (uint64_t)&src);
    memset(&dest, 0, sizeof(dest));
    JFXToVImage(pixelBufferOut, (uint64_t)&dest);
    memset(&v22, 0, sizeof(v22));
    JFXToVImage(v28, (uint64_t)&v22);
    memset(&v21, 0, sizeof(v21));
    JFXToVImage(v27, (uint64_t)&v21);
    memset(&v20, 0, sizeof(v20));
    JFXToVImage(v25, (uint64_t)&v20);
    if (!vImageConvert_16Fto16U(&src, &dest, 0)
      && !vImageRotate90_Planar16U(&dest, &v22, 3u, 0, 0)
      && !vImageScale_Planar16U(&v22, &v21, 0, 0))
    {
      if (v26)
      {
        memset(&v19, 0, sizeof(v19));
        JFXToVImage(v26, (uint64_t)&v19);
        if (vImageHorizontalReflect_Planar16U(&v21, &v19, 0))
          goto LABEL_19;
        v21 = v19;
      }
      vImageConvert_16Uto16F(&v21, &v20, 0);
    }
  }
  else
  {
    JFXLog_matting();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(src.data) = 0;
      _os_log_impl(&dword_2269A9000, v17, OS_LOG_TYPE_DEFAULT, "alphaMatteForFrameSet no depthData, move along...", (uint8_t *)&src, 2u);
    }

  }
LABEL_19:
  CVPixelBufferUnlockBaseAddress(v14, 1uLL);
  CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
  CVPixelBufferUnlockBaseAddress(v28, 0);
  CVPixelBufferUnlockBaseAddress(v27, 0);
  if (v26)
    CVPixelBufferUnlockBaseAddress(v26, 0);
  CVPixelBufferUnlockBaseAddress(v25, 0);
  CVPixelBufferRelease(pixelBufferOut);
  CVPixelBufferRelease(v28);
  CVPixelBufferRelease(v27);
  if (v26)
    CVPixelBufferRelease(v26);
  objc_msgSend(MEMORY[0x24BE79030], "imageWithCVPixelBuffer:", v25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  CVPixelBufferRelease(v25);
  v9[2](v9, v18);

}

+ (CGSize)mattingDepthInputSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 640.0;
  v3 = 360.0;
  result.height = v3;
  result.width = v2;
  return result;
}

@end
