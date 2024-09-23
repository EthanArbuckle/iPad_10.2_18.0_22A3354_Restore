@implementation JFXDepthAsMatte

+ (BOOL)_defaultMatteGeneratorPrefersDepth
{
  return 1;
}

- (id)initForFrameSet:(id)a3
{
  id v4;
  CVPixelBufferPoolRef *v5;
  id v6;
  __CVBuffer *v7;
  double Width;
  size_t Height;
  objc_super v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)JFXDepthAsMatte;
  v5 = -[JFXMatting initForFrameSet:](&v12, sel_initForFrameSet_, v4);
  if (v5)
  {
    objc_msgSend(v4, "depthData");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = (__CVBuffer *)objc_msgSend(v6, "depthDataMap");

    Width = (double)CVPixelBufferGetWidth(v7);
    Height = CVPixelBufferGetHeight(v7);
    JFXCreatePixelBufferPool((unint64_t)(double)Height, (unint64_t)Width, 1278226534, v5 + 5);
    JFXCreatePixelBufferPool((unint64_t)*((double *)v5 + 1), (unint64_t)*((double *)v5 + 2), 1278226534, v5 + 6);
    JFXCreatePixelBufferPool((unint64_t)*((double *)v5 + 1), (unint64_t)*((double *)v5 + 2), 1278226488, v5 + 7);
    v11.receiver = v5;
    v11.super_class = (Class)JFXDepthAsMatte;
    -[JFXMatting setReady:](&v11, sel_setReady_, 1);
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferPoolRelease(self->_rotatedFBufferPool);
  self->_rotatedFBufferPool = 0;
  CVPixelBufferPoolRelease(self->_scaledUpFBufferPool);
  self->_scaledUpFBufferPool = 0;
  CVPixelBufferPoolRelease(self->_alphaPool);
  self->_alphaPool = 0;
  v3.receiver = self;
  v3.super_class = (Class)JFXDepthAsMatte;
  -[JFXDepthAsMatte dealloc](&v3, sel_dealloc);
}

- (void)alphaMatteForFrameSet:(id)a3 mattingPerfState:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  JFXPerfTimer *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  __CVBuffer *v17;
  id v18;
  vImagePixelCount height;
  vImagePixelCount v20;
  vImagePixelCount width;
  vImagePixelCount v22;
  char *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  vImagePixelCount v29;
  uint64_t v30;
  vImagePixelCount v31;
  vImagePixelCount v32;
  int8x8_t *v33;
  int8x8_t *v34;
  vImagePixelCount v35;
  int8x8_t v36;
  vImage_Buffer v37;
  __int128 v38;
  __int128 v39;
  vImage_Buffer v40;
  vImage_Buffer v41;
  vImage_Buffer dest;
  vImage_Buffer src;
  CVPixelBufferRef v44;
  CVPixelBufferRef v45;
  CVPixelBufferRef v46;
  CVPixelBufferRef v47;
  CVPixelBufferRef pixelBufferOut;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  objc_msgSend(v9, "signpostToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tokenId");
  kdebug_trace();

  v12 = objc_alloc_init(JFXPerfTimer);
  v47 = 0;
  pixelBufferOut = 0;
  v45 = 0;
  v46 = 0;
  v44 = 0;
  CVPixelBufferPoolCreatePixelBuffer(0, self->_rotatedFBufferPool, &pixelBufferOut);
  CVPixelBufferPoolCreatePixelBuffer(0, self->_scaledUpFBufferPool, &v47);
  if (self->super._cameraLocation == 2)
    CVPixelBufferPoolCreatePixelBuffer(0, self->_scaledUpFBufferPool, &v46);
  CVPixelBufferPoolCreatePixelBuffer(0, self->_alphaPool, &v44);
  CVPixelBufferPoolCreatePixelBuffer(0, self->_alphaPool, &v45);
  objc_msgSend(v8, "depthData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "depthDataType");
  objc_msgSend(v8, "depthData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14 == 1717856627)
  {
    v17 = (__CVBuffer *)objc_msgSend(objc_retainAutorelease(v15), "depthDataMap");
  }
  else
  {
    objc_msgSend(v15, "depthDataByConvertingToDepthDataType:", 1717855600);
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = (__CVBuffer *)objc_msgSend(v18, "depthDataMap");

  }
  CVPixelBufferLockBaseAddress(v17, 1uLL);
  CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
  CVPixelBufferLockBaseAddress(v47, 0);
  if (v46)
    CVPixelBufferLockBaseAddress(v46, 0);
  CVPixelBufferLockBaseAddress(v45, 0);
  CVPixelBufferLockBaseAddress(v44, 0);
  memset(&src, 0, sizeof(src));
  JFXToVImage(v17, (uint64_t)&src);
  memset(&dest, 0, sizeof(dest));
  JFXToVImage(pixelBufferOut, (uint64_t)&dest);
  memset(&v41, 0, sizeof(v41));
  JFXToVImage(v47, (uint64_t)&v41);
  memset(&v40, 0, sizeof(v40));
  JFXToVImage(v44, (uint64_t)&v40);
  v38 = 0u;
  v39 = 0u;
  JFXToVImage(v45, (uint64_t)&v38);
  if (!vImageRotate90_PlanarF(&src, &dest, 3u, 0.0, 0))
  {
    height = dest.height;
    if (dest.height)
    {
      v20 = 0;
      width = dest.width;
      do
      {
        if (width >= 4)
        {
          v22 = 0;
          v23 = (char *)dest.data + dest.rowBytes * v20;
          do
          {
            *(float32x4_t *)&v23[16 * v22] = vmaxnmq_f32(*(float32x4_t *)&v23[16 * v22], (float32x4_t)0);
            ++v22;
            width = dest.width;
          }
          while (v22 < dest.width >> 2);
          height = dest.height;
        }
        ++v20;
      }
      while (height > v20);
    }
    if (!vImageScale_PlanarF(&dest, &v41, 0, 0))
    {
      if (v46)
      {
        memset(&v37, 0, sizeof(v37));
        JFXToVImage(v46, (uint64_t)&v37);
        if (vImageHorizontalReflect_PlanarF(&v41, &v37, 0))
          goto LABEL_17;
        v41 = v37;
      }
      if (!vImageConvert_PlanarFtoPlanar8(&v41, &v40, 2.0, 0.2, 0))
      {
        v29 = v41.height;
        if (v41.height)
        {
          v30 = 0;
          v31 = v41.width;
          v32 = v41.width >> 3;
          if (v41.width >> 3 <= 1)
            v32 = 1;
          do
          {
            if (v31 >= 8)
            {
              v33 = (int8x8_t *)(v38 + *((_QWORD *)&v39 + 1) * v30);
              v34 = (int8x8_t *)((char *)v40.data + v40.rowBytes * v30);
              v35 = v32;
              do
              {
                v36 = *v34++;
                *v33++ = vorr_s8(vand_s8(vceqz_s8(v36), (int8x8_t)0x80C080C080C080C0), v36);
                --v35;
              }
              while (v35);
            }
            ++v30;
          }
          while (v30 != v29);
        }
      }
    }
  }
LABEL_17:
  CVPixelBufferUnlockBaseAddress(v17, 1uLL);
  CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
  CVPixelBufferUnlockBaseAddress(v47, 0);
  if (v46)
    CVPixelBufferUnlockBaseAddress(v46, 0);
  CVPixelBufferUnlockBaseAddress(v45, 0);
  CVPixelBufferUnlockBaseAddress(v44, 0);
  CVPixelBufferRelease(pixelBufferOut);
  CVPixelBufferRelease(v47);
  if (v46)
    CVPixelBufferRelease(v46);
  CVPixelBufferRelease(v44);
  objc_msgSend(MEMORY[0x24BE79030], "imageWithCVPixelBuffer:", v45);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  CVPixelBufferRelease(v45);
  if (v9)
  {
    -[JFXPerfTimer end](v12, "end");
    v26 = v25;
    objc_msgSend(v9, "captureFrameStats");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(objc_msgSend(v27, "times") + 16) = v26;

  }
  objc_msgSend(v9, "signpostToken");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "tokenId");
  kdebug_trace();

  v10[2](v10, v24);
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
