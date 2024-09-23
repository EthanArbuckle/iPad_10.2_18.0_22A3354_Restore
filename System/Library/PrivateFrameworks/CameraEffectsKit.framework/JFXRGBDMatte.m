@implementation JFXRGBDMatte

+ (BOOL)_defaultMatteGeneratorPrefersDepth
{
  return 1;
}

- (id)initForFrameSet:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  id v7;
  __CVBuffer *v8;
  size_t Width;
  size_t Height;
  double *v11;
  dispatch_queue_t v12;
  void *v13;
  dispatch_queue_t v14;
  void *v15;
  dispatch_semaphore_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  int v23;
  int v24;
  DepthProcessingDataRGBD *v25;
  ContourMemoryPool *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  JFXPixelRotationSession *v32;
  void *v33;
  JFXPixelRotationSession *v34;
  void *v35;
  objc_super v37;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)JFXRGBDMatte;
  v5 = -[JFXMatting initForFrameSet:](&v38, sel_initForFrameSet_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5[789] = objc_msgSend(v6, "BOOLForKey:", CFSTR("JFXVisualizeFaceRect"));

    objc_msgSend(v4, "depthData");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (__CVBuffer *)objc_msgSend(v7, "depthDataMap");

    Width = CVPixelBufferGetWidth(v8);
    Height = CVPixelBufferGetHeight(v8);
    v11 = (double *)(v5 + 64);
    *((double *)v5 + 8) = (double)Width;
    *((double *)v5 + 9) = (double)Height;
    *((double *)v5 + 10) = (double)Height;
    *((double *)v5 + 11) = (double)Width;
    v12 = dispatch_queue_create("com.apple.JFXRGBDMatting.submissionQ", 0);
    v13 = (void *)*((_QWORD *)v5 + 13);
    *((_QWORD *)v5 + 13) = v12;

    v14 = dispatch_queue_create("com.apple.JFXRGBDMatting.processQ", MEMORY[0x24BDAC9C0]);
    v15 = (void *)*((_QWORD *)v5 + 14);
    *((_QWORD *)v5 + 14) = v14;

    v16 = dispatch_semaphore_create(1);
    v17 = (void *)*((_QWORD *)v5 + 15);
    *((_QWORD *)v5 + 15) = v16;

    v18 = objc_alloc_init(MEMORY[0x24BE79000]);
    v19 = (void *)*((_QWORD *)v5 + 5);
    *((_QWORD *)v5 + 5) = v18;

    v20 = objc_alloc_init(MEMORY[0x24BE79000]);
    v21 = (void *)*((_QWORD *)v5 + 6);
    *((_QWORD *)v5 + 6) = v20;

    v22 = 0;
    *((_DWORD *)v5 + 14) = 0;
    v23 = (int)(*((double *)v5 + 10) * 0.5);
    v24 = (int)(*((double *)v5 + 11) * 0.5);
    *((_QWORD *)v5 + 81) = 0;
    *((_QWORD *)v5 + 82) = 0;
    *((_QWORD *)v5 + 83) = 0;
    do
    {
      *(_QWORD *)&v5[v22 + 600] = operator new[]();
      v22 += 8;
    }
    while (v22 != 32);
    *((_QWORD *)v5 + 79) = operator new[]();
    *((_QWORD *)v5 + 80) = operator new[]();
    v25 = (DepthProcessingDataRGBD *)operator new();
    DepthProcessingDataRGBD::DepthProcessingDataRGBD(v25, (unint64_t)*v11, (unint64_t)*((double *)v5 + 9), 0);
    *((_QWORD *)v5 + 99) = v25;
    v26 = (ContourMemoryPool *)operator new();
    ContourMemoryPool::ContourMemoryPool(v26, v24, v23);
    *((_QWORD *)v5 + 100) = v26;
    JFXCreatePixelBufferPool(v24, v23, 1111970369, (CVPixelBufferPoolRef *)v5 + 85);
    JFXCreatePixelBufferPool((unint64_t)*((double *)v5 + 10), (unint64_t)*((double *)v5 + 11), 1278226488, (CVPixelBufferPoolRef *)v5 + 87);
    JFXCreatePixelBufferPool((unint64_t)*v11, (unint64_t)*((double *)v5 + 9), 1278226488, (CVPixelBufferPoolRef *)v5 + 88);
    *((_QWORD *)v5 + 89) = 0;
    JFXCreatePixelBufferPool((unint64_t)*((double *)v5 + 1), (unint64_t)*((double *)v5 + 2), 1278226488, (CVPixelBufferPoolRef *)v5 + 86);
    v27 = -[JFXImageScaler initForCPU:]([JFXImageScaler alloc], "initForCPU:", 0);
    v28 = (void *)*((_QWORD *)v5 + 90);
    *((_QWORD *)v5 + 90) = v27;

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v5[744] = objc_msgSend(v29, "BOOLForKey:", CFSTR("JFXDisableMattingMultithreadingKey"));

    v5[745] = 1;
    v5[746] = 1;
    v5[747] = 1;
    *((_DWORD *)v5 + 168) = 20;
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKey:", CFSTR("JFXMinObjectDistance"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
      *((_DWORD *)v5 + 168) = objc_msgSend(v31, "intValue");
    *((_OWORD *)v5 + 47) = 0u;
    *((_OWORD *)v5 + 48) = 0u;
    v32 = -[JFXPixelRotationSession initWithRotation:mirror:]([JFXPixelRotationSession alloc], "initWithRotation:mirror:", 1, 1);
    v33 = (void *)*((_QWORD *)v5 + 91);
    *((_QWORD *)v5 + 91) = v32;

    v34 = -[JFXPixelRotationSession initWithRotation:mirror:]([JFXPixelRotationSession alloc], "initWithRotation:mirror:", 1, 1);
    v35 = (void *)*((_QWORD *)v5 + 92);
    *((_QWORD *)v5 + 92) = v34;

    v37.receiver = v5;
    v37.super_class = (Class)JFXRGBDMatte;
    -[JFXMatting setReady:](&v37, sel_setReady_, 1);

  }
  return v5;
}

- (void)dealloc
{
  JFXPixelRotationSession *matteRotator;
  JFXPixelRotationSession *colorRotator;
  JFXImageScaler *imageScaler;
  uint64_t i;
  char *v7;
  char *depthBufferFull;
  char *vImageTempBuffer;
  DepthProcessingDataRGBD *depthProcessingData;
  ContourMemoryPool *contourMemoryPool;
  objc_super v12;

  matteRotator = self->_matteRotator;
  self->_matteRotator = 0;

  colorRotator = self->_colorRotator;
  self->_colorRotator = 0;

  imageScaler = self->_imageScaler;
  self->_imageScaler = 0;

  CVPixelBufferPoolRelease(self->_scaledSourcePool);
  CVPixelBufferPoolRelease(self->_scaledDestinationPool);
  CVPixelBufferPoolRelease(self->_processedMattePool);
  CVPixelBufferPoolRelease(self->_rotatedMattePool);
  for (i = 0; i != 4; ++i)
  {
    v7 = self->_depthBufferHalf[i];
    if (v7)
      MEMORY[0x2276A1A80](v7, 0x1000C8077774924);
  }
  depthBufferFull = self->_depthBufferFull;
  if (depthBufferFull)
  {
    MEMORY[0x2276A1A80](depthBufferFull, 0x1000C8077774924);
    self->_depthBufferFull = 0;
  }
  vImageTempBuffer = self->_vImageTempBuffer;
  if (vImageTempBuffer)
  {
    MEMORY[0x2276A1A80](vImageTempBuffer, 0x1000C8077774924);
    self->_vImageTempBuffer = 0;
  }
  CVPixelBufferRelease(self->_alphaMatteHistory);
  depthProcessingData = self->_depthProcessingData;
  if (depthProcessingData)
  {
    DepthProcessingDataRGBD::~DepthProcessingDataRGBD(depthProcessingData);
    MEMORY[0x2276A1A98]();
  }
  contourMemoryPool = self->_contourMemoryPool;
  if (contourMemoryPool)
  {
    ContourMemoryPool::~ContourMemoryPool(contourMemoryPool);
    MEMORY[0x2276A1A98]();
  }
  v12.receiver = self;
  v12.super_class = (Class)JFXRGBDMatte;
  -[JFXRGBDMatte dealloc](&v12, sel_dealloc);
}

- (void)requestMattingStatus
{
  NSObject *submissionQ;
  _QWORD block[5];

  submissionQ = self->_submissionQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__JFXRGBDMatte_requestMattingStatus__block_invoke;
  block[3] = &unk_24EE5B720;
  block[4] = self;
  dispatch_async(submissionQ, block);
}

void __36__JFXRGBDMatte_requestMattingStatus__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 120), 0xFFFFFFFFFFFFFFFFLL);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 112);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__JFXRGBDMatte_requestMattingStatus__block_invoke_2;
  block[3] = &unk_24EE5B720;
  block[4] = v2;
  dispatch_async(v3, block);
}

intptr_t __36__JFXRGBDMatte_requestMattingStatus__block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 656) = 0x40000000;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 120));
}

- (void)alphaMatteForFrameSet:(id)a3 mattingPerfState:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *submissionQ;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  JFXLog_DebugMatting();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "metadataDict");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v12;
    _os_log_impl(&dword_2269A9000, v11, OS_LOG_TYPE_DEFAULT, "metadata=%@", buf, 0xCu);

  }
  submissionQ = self->_submissionQ;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __73__JFXRGBDMatte_alphaMatteForFrameSet_mattingPerfState_completionHandler___block_invoke;
  v17[3] = &unk_24EE5B770;
  v17[4] = self;
  v18 = v9;
  v19 = v8;
  v20 = v10;
  v14 = v10;
  v15 = v8;
  v16 = v9;
  dispatch_async(submissionQ, v17);

}

void __73__JFXRGBDMatte_alphaMatteForFrameSet_mattingPerfState_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 120), 0xFFFFFFFFFFFFFFFFLL);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 112);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __73__JFXRGBDMatte_alphaMatteForFrameSet_mattingPerfState_completionHandler___block_invoke_2;
  v5[3] = &unk_24EE5B748;
  v6 = v2;
  v7 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = v4;
  dispatch_async(v3, v5);

}

void __73__JFXRGBDMatte_alphaMatteForFrameSet_mattingPerfState_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  JFXPerfTimer *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  double LargestFaceRect;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  __CVBuffer *v20;
  __CVBuffer *v21;
  void *v22;
  void *v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BOOL4 v28;
  float64x2_t v29;
  float64x2_t v30;
  double v31;
  _BOOL4 v32;
  NSObject *v33;
  _OWORD *v34;
  _OWORD *v35;
  __int128 v36;
  int v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  __int128 v47;
  float64_t v48;
  float64x2_t v49;
  CVPixelBufferRef pixelBufferOut;
  uint8_t buf[4];
  _DWORD v52[7];

  *(_QWORD *)&v52[5] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "signpostToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tokenId");
  kdebug_trace();

  v3 = objc_alloc_init(JFXPerfTimer);
  objc_msgSend(*(id *)(a1 + 40), "depthData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "depthDataType");
  v6 = *(void **)(a1 + 40);
  if (v5 == 1717855600)
  {
    objc_msgSend(v6, "depthData");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v7, "depthDataMap");
  }
  else
  {
    objc_msgSend(v6, "depthData");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "depthDataByConvertingToDepthDataType:", 1717855600);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v9, "depthDataMap");

  }
  if (v8)
  {
    LargestFaceRect = getLargestFaceRect(*(void **)(a1 + 40));
    v11 = *(_QWORD *)(a1 + 48) + 152;
    *(double *)v11 = LargestFaceRect;
    *(_QWORD *)(v11 + 8) = v12;
    *(_QWORD *)(v11 + 16) = v13;
    *(_QWORD *)(v11 + 24) = v14;
    objc_msgSend(*(id *)(a1 + 40), "metadataObjectForKey:", *MEMORY[0x24BE79580]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1 + 48) + 184) = objc_msgSend(v15, "interfaceOrientation");

    JFXLog_DebugMatting();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 184);
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v52 = v17;
      _os_log_impl(&dword_2269A9000, v16, OS_LOG_TYPE_DEFAULT, "interface orientation=%ld", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "colorImageBuffer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "cvPixelBuffer");

    pixelBufferOut = 0;
    CVPixelBufferPoolCreatePixelBuffer(0, *(CVPixelBufferPoolRef *)(*(_QWORD *)(a1 + 48) + 680), &pixelBufferOut);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 720), "scaleImage:destinationImage:", v19, pixelBufferOut);
    v20 = (__CVBuffer *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 736), "createRotatedPixelBuffer:", pixelBufferOut);
    CVPixelBufferRelease(pixelBufferOut);
    v21 = (__CVBuffer *)objc_msgSend(*(id *)(a1 + 48), "processAlphaMapUsingDepthAndColor:colorBuffer:", v8, v20);
    objc_msgSend(*(id *)(a1 + 40), "colorImageBuffer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    exifMetadataForCVPixelBuffer((const void *)objc_msgSend(v22, "cvPixelBuffer"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)(*(_QWORD *)(a1 + 48) + 664) = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 664) & 0xFFFFFFFFFFFFFFFDLL | (2 * (exifBrightnessFromEXIFMetadata(v23) >= 6.5));
    v25 = *(_QWORD *)(a1 + 48);
    v26 = *(_QWORD *)(v25 + 664);
    if (v26 != *(_QWORD *)(v25 + 656))
    {
      +[JFXMatting postNotification:](JFXMatting, "postNotification:");
      v25 = *(_QWORD *)(a1 + 48);
      v26 = *(_QWORD *)(v25 + 664);
    }
    *(_QWORD *)(v25 + 656) = v26;
    v27 = *(_QWORD *)(a1 + 48);
    v49 = *(float64x2_t *)(v27 + 752);
    v27 += 152;
    *(_QWORD *)&v24 = *(_QWORD *)(v27 + 8);
    v47 = v24;
    v48 = *(double *)v27;
    v28 = isFaceBoundingBoxValid(*(double *)v27, *(double *)&v24, *(double *)(v27 + 16), *(double *)(v27 + 24));
    v29.f64[0] = v48;
    *(_QWORD *)&v29.f64[1] = v47;
    v30 = vsubq_f64(v49, v29);
    v31 = vaddvq_f64(vmulq_f64(v30, v30));
    v32 = v31 > 0.000004 && v28;
    JFXLog_DebugMatting();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v52[0] = v32;
      LOWORD(v52[1]) = 2048;
      *(double *)((char *)&v52[1] + 2) = v31;
      _os_log_impl(&dword_2269A9000, v33, OS_LOG_TYPE_DEFAULT, "facemotion=%d movement_squared=%.7f", buf, 0x12u);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 48) + 788) = v32;
    v34 = *(_OWORD **)(a1 + 48);
    v35 = (_OWORD *)((char *)v34 + 152);
    v34 += 47;
    v36 = v35[1];
    *v34 = *v35;
    v34[1] = v36;
    CVPixelBufferRelease(v20);

    v37 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 792) + 112);
    JFXLog_DebugMatting();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v52[0] = v37;
      _os_log_impl(&dword_2269A9000, v38, OS_LOG_TYPE_DEFAULT, "inside JFXRGBMatte averageDepth=%dmm", buf, 8u);
    }

    v39 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", JFXRemappedAverageDepth(v37));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setMetadataObject:forKey:", v40, *MEMORY[0x24BE79570]);

    objc_msgSend(MEMORY[0x24BE79030], "imageWithCVPixelBuffer:", v21);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    CVPixelBufferRelease(v21);
    if (*(_QWORD *)(a1 + 32))
    {
      -[JFXPerfTimer end](v3, "end");
      v43 = v42;
      objc_msgSend(*(id *)(a1 + 32), "captureFrameStats");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(objc_msgSend(v44, "times") + 16) = v43;

      v45 = *(void **)(a1 + 32);
    }
    else
    {
      v45 = 0;
    }
    objc_msgSend(v45, "signpostToken", v47);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "tokenId");
    kdebug_trace();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 48) + 120));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 48) + 120));
  }

}

- (__CVBuffer)processAlphaMapUsingDepthAndColor:(__CVBuffer *)a3 colorBuffer:(__CVBuffer *)a4
{
  -[JFXRGBDMatte getDepthData:processData:](self, "getDepthData:processData:", a3, self->_depthProcessingData);
  -[JFXRGBDMatte depthToAlphaMap:](self, "depthToAlphaMap:", self->_depthProcessingData);
  return -[JFXRGBDMatte localMattingHalfRGBD:colorBuffer:](self, "localMattingHalfRGBD:colorBuffer:", self->_depthProcessingData, a4);
}

- (void)findDepthForFace:(DepthProcessingDataRGBD *)a3
{
  DepthProcessingDataRGBD::getFaceDepthFromPortrait(a3, self->_largestFaceRect);
}

- (void)findRectOrientationRightLeft:(int *)a3 numContourPixels:(int)a4 winHeight:(int)a5 halfHeight:(int)a6 originY:(int *)a7 sizeHeight:(int *)a8 isRight:(BOOL)a9
{
  int v13;
  int v14;
  uint64_t v15;
  int *v16;
  int v17;
  uint64_t v18;
  int *v19;
  int v20;
  int v21;
  int v22;
  int *v23;
  uint64_t v24;
  int v25;
  int *v26;
  uint64_t v27;
  int v28;
  int v29;
  int v30;
  CGRect *p_largestFaceRect;
  int v32;
  int v33;
  int v34;

  if (a6 >= 0)
    v13 = a6;
  else
    v13 = a6 + 1;
  v14 = v13 >> 1;
  if (a9)
  {
    if (a4 < 1)
      goto LABEL_28;
    v15 = a4;
    v16 = a3 + 1;
    v17 = a6;
    do
    {
      if (*(v16 - 1) < v17)
      {
        v14 = *v16;
        v17 = *(v16 - 1);
      }
      v16 += 2;
      --v15;
    }
    while (v15);
  }
  else
  {
    if (a4 < 1)
      goto LABEL_28;
    v17 = 0;
    v18 = a4;
    v19 = a3 + 1;
    do
    {
      if (*(v19 - 1) > v17)
      {
        v14 = *v19;
        v17 = *(v19 - 1);
      }
      v19 += 2;
      --v18;
    }
    while (v18);
  }
  if (a9)
  {
    v20 = 0;
    v21 = 0;
    v22 = v17 + 20;
    v23 = a3 + 1;
    v24 = a4;
    do
    {
      if (*(v23 - 1) < v22)
      {
        v20 += *v23;
        ++v21;
      }
      v23 += 2;
      --v24;
    }
    while (v24);
  }
  else
  {
    v20 = 0;
    v21 = 0;
    v25 = v17 - 20;
    v26 = a3 + 1;
    v27 = a4;
    do
    {
      if (*(v26 - 1) > v25)
      {
        v20 += *v26;
        ++v21;
      }
      v26 += 2;
      --v27;
    }
    while (v27);
  }
  if (v21 >= 1)
    v14 = v20 / v21;
LABEL_28:
  if (a5 >= 0)
    v28 = a5;
  else
    v28 = a5 + 1;
  v29 = (v14 - (v28 >> 1)) & ~((v14 - (v28 >> 1)) >> 31);
  *a7 = v29;
  v30 = v29 + a5;
  if (a6 - 1 < v29 + a5)
    v30 = a6 - 1;
  *a8 = v30 - v29;
  p_largestFaceRect = &self->_largestFaceRect;
  if (isFaceBoundingBoxValid(self->_largestFaceRect.origin.x, self->_largestFaceRect.origin.y, self->_largestFaceRect.size.width, self->_largestFaceRect.size.height))
  {
    v32 = (int)(p_largestFaceRect->origin.x * (double)a6);
    v33 = *a7;
    if (*a7 > v32)
    {
      *a7 = v32;
      v33 = v32;
    }
    v34 = (int)(p_largestFaceRect->size.width * (double)a6) + v32;
    if (v34 > v33 + a5)
      *a8 = v34 - v33;
  }
}

- (void)findLocalMattingRect:(int *)a3 processingData:(DepthProcessingDataRGBD *)a4 mattingRect:(CGRect *)a5
{
  uint64_t v8;
  uint64_t var13;
  int var15;
  int v11;
  double width;
  uint64_t v13;
  int64_t interfaceOrientation;
  int v15;
  int *v16;
  int v17;
  int v18;
  int v19;
  int *v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  CGRect *p_largestFaceRect;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  uint64_t v44;
  uint64_t v45;

  v8 = (int)(self->_depthSizeRotated.height * 0.5);
  var13 = a4->var13;
  var15 = a4->var15;
  if (var15 < 201)
    v11 = 250;
  else
    v11 = (int)(((double)(var15 - 598) * -0.424 + 119.0) * 1.4);
  width = self->_depthSizeRotated.width;
  if (v11 <= 90)
    v11 = 90;
  v13 = v11 >> 1;
  v45 = 0;
  interfaceOrientation = self->_interfaceOrientation;
  switch(interfaceOrientation)
  {
    case 4:
      LOBYTE(v44) = 1;
LABEL_17:
      -[JFXRGBDMatte findRectOrientationRightLeft:numContourPixels:winHeight:halfHeight:originY:sizeHeight:isRight:](self, "findRectOrientationRightLeft:numContourPixels:winHeight:halfHeight:originY:sizeHeight:isRight:", a3, var13, v13, v8, (char *)&v45 + 4, &v45, v44);
      break;
    case 3:
      LOBYTE(v44) = 0;
      goto LABEL_17;
    case 2:
      if ((int)var13 < 1)
      {
        v19 = 10;
      }
      else
      {
        v15 = 0;
        v16 = a3 + 1;
        do
        {
          v18 = *v16;
          v16 += 2;
          v17 = v18;
          if (v15 <= v18)
            v15 = v17;
          --var13;
        }
        while (var13);
        v19 = v15 + 10;
      }
      if (v19 >= (int)v8)
        v24 = v8 - 1;
      else
        v24 = v19;
      if (v24 - (int)v13 <= 10)
        v25 = v24 - 1;
      else
        v25 = v13 + 10;
      v26 = v24 - v25;
      HIDWORD(v45) = v24 - v25;
      p_largestFaceRect = &self->_largestFaceRect;
      if (isFaceBoundingBoxValid(self->_largestFaceRect.origin.x, self->_largestFaceRect.origin.y, self->_largestFaceRect.size.width, self->_largestFaceRect.size.height))
      {
        v28 = (int)(p_largestFaceRect->origin.x * (double)(int)v8);
        v29 = v25 + v24 - v28;
        if (v25 + v24 + ~v28 >= 0)
          v29 = v25 + v24 + ~v28;
        v30 = v29 >> 1;
        v31 = v26 + v28;
        if (v26 + v28 < 0 != __OFADD__(v26, v28))
          ++v31;
        v32 = v31 >> 1;
        if (v26 > v28)
        {
          v25 = v24 + ~v28;
        }
        else
        {
          v28 = v32;
          v25 = v30;
        }
        HIDWORD(v45) = v28;
      }
      LODWORD(v45) = v25;
      break;
    default:
      if ((int)var13 < 1)
      {
        v21 = v8;
      }
      else
      {
        v20 = a3 + 1;
        v21 = v8;
        do
        {
          v23 = *v20;
          v20 += 2;
          v22 = v23;
          if (v23 < v21)
            v21 = v22;
          --var13;
        }
        while (var13);
      }
      if (v21 <= 10)
        v33 = 10;
      else
        v33 = v21;
      v34 = v33 - 10;
      if (v33 + (int)v13 >= (int)v8)
        v35 = v8 - v33 + 9;
      else
        v35 = v13 + 10;
      HIDWORD(v45) = v33 - 10;
      if (isFaceBoundingBoxValid(self->_largestFaceRect.origin.x, self->_largestFaceRect.origin.y, self->_largestFaceRect.size.width, self->_largestFaceRect.size.height))
      {
        v36 = (int)(self->_largestFaceRect.size.width * (double)(int)v8
                  + (double)(int)v8 * self->_largestFaceRect.origin.x);
        if (v35 + v34 <= v36)
        {
          v37 = v35 - v33 + v36;
          v38 = v37 + 9;
          v39 = v37 + 10;
          if (v38 >= 0)
            v39 = v38;
          v35 = v39 >> 1;
        }
        else
        {
          v35 = v36 - v33 + 9;
        }
      }
      if (v34 + v35 >= 310)
        v40 = v35;
      else
        v40 = 320 - v33;
      if (self->_usingLargerRect)
        v41 = v40;
      else
        v41 = v35;
      LODWORD(v45) = v41;
      break;
  }
  a5->origin.x = 0.0;
  v42 = HIDWORD(v45);
  a5->origin.y = (double)SHIDWORD(v45);
  a5->size.width = (double)(int)(width * 0.5);
  v43 = v45;
  a5->size.height = (double)(int)v45;
  self->_heightOfMattingWin = v43;
  self->_topOfHeadHalf = v42;
}

- (char)makeTrimap:(DepthProcessingDataRGBD *)a3
{
  unint64_t v4;
  unint64_t v5;
  char *v6;
  char *v7;
  unint64_t v8;
  char *v9;
  char v10;

  v4 = (unint64_t)self->_depthSizeRotated.width >> 1;
  v5 = (unint64_t)self->_depthSizeRotated.height >> 1;
  v6 = -[JFXRGBDMatte localDepthBufferBig](self, "localDepthBufferBig", a3);
  v7 = -[JFXRGBDMatte localDepthBufferSmall](self, "localDepthBufferSmall");
  v8 = v5 * v4;
  if (v5 * v4)
  {
    v9 = v6;
    do
    {
      v10 = *v9;
      if (*v9)
      {
        if (*v7)
          v10 = -1;
        else
          v10 = 0x80;
      }
      *v9++ = v10;
      ++v7;
      --v8;
    }
    while (v8);
  }
  return v6;
}

- (void)moveLocalDepthBufferToDepthOuter:(DepthProcessingDataRGBD *)a3
{
  memcpy(-[JFXRGBDMatte localDepthBuffer](self, "localDepthBuffer"), a3->var11, ((unint64_t)self->_depthSizeRotated.height >> 1) * ((unint64_t)self->_depthSizeRotated.width >> 1));
}

- (char)localDepthBuffer
{
  return self->_depthBufferHalf[0];
}

- (char)localDepthBufferBig
{
  return self->_depthBufferHalf[1];
}

- (char)localDepthBufferSmall
{
  return self->_depthBufferHalf[2];
}

- (char)localDepthBufferTemp
{
  return self->_depthBufferHalf[3];
}

- (void)erodeAndDilateMatte:(DepthProcessingDataRGBD *)a3
{
  __int128 v5;
  double height;
  vImagePixelCount v7;
  vImagePixelCount v8;
  char *v9;
  char *v10;
  char *var11;
  vImage_Buffer v12;
  vImage_Buffer v13;
  vImage_Buffer v14;
  vImage_Buffer dest;
  vImage_Buffer src;
  unsigned __int8 kernel[16];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  char v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v5 = -1;
  *((_QWORD *)&v5 + 1) = -1;
  v20 = v5;
  v21 = v5;
  v18 = v5;
  v19 = v5;
  *(_OWORD *)kernel = v5;
  *(CGFloat *)&v5 = self->_depthSizeRotated.width;
  height = self->_depthSizeRotated.height;
  v22 = -1;
  v7 = (unint64_t)*(double *)&v5 >> 1;
  v8 = (unint64_t)height >> 1;
  v9 = -[JFXRGBDMatte localDepthBufferSmall](self, "localDepthBufferSmall");
  v10 = self->_depthBufferHalf[3];
  var11 = a3->var11;
  src.data = a3->var10;
  src.height = v8;
  src.width = v7;
  src.rowBytes = v7;
  dest.data = var11;
  dest.height = v8;
  dest.width = v7;
  dest.rowBytes = v7;
  v14.data = -[JFXRGBDMatte localDepthBufferBig](self, "localDepthBufferBig");
  v14.height = v8;
  v14.width = v7;
  v14.rowBytes = v7;
  v13.data = v9;
  v13.height = v8;
  v13.width = v7;
  v13.rowBytes = v7;
  v12.data = v10;
  v12.height = v8;
  v12.width = v7;
  v12.rowBytes = v7;
  vImageErode_Planar8(&src, &dest, 0, 0, kernel, 3uLL, 3uLL, 8u);
  vImageErode_Planar8(&src, &v13, 0, 0, kernel, 7uLL, 7uLL, 8u);
  vImageDilate_Planar8(&src, &v12, 0, 0, kernel, 7uLL, 7uLL, 8u);
  vImageDilate_Planar8(&v12, &v14, 0, 0, kernel, 3uLL, 3uLL, 8u);
}

- (vImage_Buffer)featherMatte:(SEL)a3
{
  __int128 v5;
  double width;
  char *var10;
  vImage_Buffer dest;
  unsigned __int8 kernel[16];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  char v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v5 = -1;
  *((_QWORD *)&v5 + 1) = -1;
  v13 = v5;
  v14 = v5;
  v11 = v5;
  v12 = v5;
  *(_OWORD *)kernel = v5;
  width = self->_depthSizeRotated.width;
  *(CGFloat *)&v5 = self->_depthSizeRotated.height;
  v15 = -1;
  var10 = a4->var10;
  dest.data = a4->var11;
  dest.height = (unint64_t)*(double *)&v5;
  dest.width = (unint64_t)width;
  dest.rowBytes = (unint64_t)width;
  retstr->data = var10;
  retstr->height = (unint64_t)*(double *)&v5;
  retstr->width = (unint64_t)width;
  retstr->rowBytes = (unint64_t)width;
  vImageBoxConvolve_Planar8(retstr, &dest, self->_vImageTempBuffer, 0, 0, 5u, 5u, 0, 8u);
  return (vImage_Buffer *)vImageErode_Planar8(&dest, retstr, 0, 0, kernel, 3uLL, 3uLL, 8u);
}

- (void)grabCutWithTrimap:(char *)a3 color:(__CVBuffer *)a4 processWin:(CGRect)a5
{
  -[JFXRGBDMatte mattingGrabCut:depthMap:colorBuffer:processWin:](self, "mattingGrabCut:depthMap:colorBuffer:processWin:", a3, -[JFXRGBDMatte localDepthBuffer](self, "localDepthBuffer"), a4, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

- (__CVBuffer)createInvertedMatte:(vImage_Buffer *)a3
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  int8x16_t *v8;
  int8x16_t *v9;
  uint64_t v10;
  int8x16_t v11;
  __int128 v13;
  __int128 v14;
  CVPixelBufferRef pixelBufferOut;

  pixelBufferOut = 0;
  CVPixelBufferPoolCreatePixelBuffer(0, self->_processedMattePool, &pixelBufferOut);
  CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
  v13 = 0u;
  v14 = 0u;
  JFXToVImage(pixelBufferOut, (uint64_t)&v13);
  v4 = *((_QWORD *)&v13 + 1);
  if (*((_QWORD *)&v13 + 1))
  {
    v5 = 0;
    v6 = *((_QWORD *)&v14 + 1);
    v7 = *((_QWORD *)&v14 + 1) >> 4;
    if (*((_QWORD *)&v14 + 1) >> 4 <= 1uLL)
      v7 = 1;
    do
    {
      if (v6 >= 0x10)
      {
        v8 = (int8x16_t *)(v13 + *((_QWORD *)&v14 + 1) * v5);
        v9 = (int8x16_t *)((char *)a3->data + a3->rowBytes * v5);
        v10 = v7;
        do
        {
          v11 = *v9++;
          *v8++ = vmvnq_s8(v11);
          --v10;
        }
        while (v10);
        v4 = *((_QWORD *)&v13 + 1);
      }
      ++v5;
    }
    while (v5 < v4);
  }
  CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
  return pixelBufferOut;
}

- (__CVBuffer)localMattingHalfRGBD:(DepthProcessingDataRGBD *)a3 colorBuffer:(__CVBuffer *)a4
{
  CGSize *p_depthSizeRotated;
  double height;
  CGFloat v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  int var13;
  int v15;
  int *v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  int var15;
  int v22;
  int v23;
  unsigned int v24;
  int v25;
  unsigned int v26;
  signed int v27;
  int v28;
  double v29;
  double v30;
  double v31;
  double v32;
  char *v33;
  char *v34;
  int8x16_t v35;
  __CVBuffer *v36;
  __CVBuffer *v37;
  __CVBuffer *v38;
  __CVBuffer *v39;
  _OWORD v41[2];
  vImage_Buffer dest;
  vImage_Buffer src;
  __int128 v44;
  __int128 v45;
  _BYTE v46[132];
  int v47;

  p_depthSizeRotated = &self->_depthSizeRotated;
  height = self->_depthSizeRotated.height;
  v9 = self->_depthSizeRotated.width * 0.5;
  v10 = (int)v9;
  v11 = (int)(height * 0.5);
  v47 = (int)(height * 0.5);
  ContourProcessing::ContourProcessing((ContourProcessing *)v46, (unsigned __int8 *)a3->var10, v47, (int)v9, self->_contourMemoryPool, 0);
  ContourProcessing::contourExtractionProcessing((ContourProcessing *)v46, &a3->var13, &v47);
  self->_heightOfMattingWin = -1;
  self->_topOfHeadHalf = -1;
  v12 = v47;
  v13 = v11 - 1;
  if ((int)v11 - 1 >= v47 + 20)
    v13 = v47 + 20;
  var13 = a3->var13;
  if (var13 >= 1)
  {
    v15 = 0;
    v16 = self->_contourMemoryPool->var2 + 1;
    v17 = a3->var13;
    do
    {
      v18 = *v16;
      v16 += 2;
      if (v18 < v13)
        ++v15;
      --v17;
    }
    while (v17);
    if ((int)v10 >= 0)
      v19 = v10;
    else
      v19 = v10 + 1;
    v20 = (v19 >> 1);
    if (v15)
      v20 = ((int)v20 / v15);
    if (var13 >= 21)
    {
      var15 = a3->var15;
      if (var15 < 201)
        v22 = 250;
      else
        v22 = (int)(((double)(var15 - 598) * -0.424 + 119.0) * 2.8);
      if (v22 <= 90)
        v22 = 90;
      if (v47 <= 10)
        v12 = 10;
      v23 = v12 - 10;
      v47 = v12 - 10;
      v24 = v22 >> 1;
      v25 = v12 + (v22 >> 1);
      v26 = v24 + 10;
      v27 = v11 - v12 + 9;
      if (v25 < (int)v11)
        v27 = v26;
      v28 = v27 / 2;
      self->_heightOfMattingWin = v28;
      self->_topOfHeadHalf = v23;
      v29 = (double)v23;
      v30 = (double)(int)v10;
      v31 = (double)v28;
      *(_QWORD *)&v44 = 0;
      *((double *)&v44 + 1) = (double)v23;
      *(double *)&v45 = (double)(int)v10;
      *((double *)&v45 + 1) = (double)v28;
      if (self->_usingFaceRect)
      {
        -[JFXRGBDMatte findLocalMattingRect:processingData:mattingRect:](self, "findLocalMattingRect:processingData:mattingRect:", self->_contourMemoryPool->var2, a3, &v44);
        v29 = *((double *)&v44 + 1);
        v32 = *(double *)&v44;
        v31 = *((double *)&v45 + 1);
        v30 = *(double *)&v45;
      }
      else
      {
        v32 = 0.0;
      }
      -[JFXRGBDMatte expansionOfKnownRegionsRGBD:processingData:regionWin:centerOfRow:](self, "expansionOfKnownRegionsRGBD:processingData:regionWin:centerOfRow:", a4, a3, v20, v32, v29, v30, v31);
      -[JFXRGBDMatte innerOuterFusion:processWin:](self, "innerOuterFusion:processWin:", a3, v44, v45);
      -[JFXRGBDMatte erodeAndDilateMatte:](self, "erodeAndDilateMatte:", a3);
      v33 = -[JFXRGBDMatte makeTrimap:](self, "makeTrimap:", a3);
      -[JFXRGBDMatte moveLocalDepthBufferToDepthOuter:](self, "moveLocalDepthBufferToDepthOuter:", a3);
      -[JFXRGBDMatte grabCutWithTrimap:color:processWin:](self, "grabCutWithTrimap:color:processWin:", v33, a4, v44, v45);
      v34 = -[JFXRGBDMatte localDepthBuffer](self, "localDepthBuffer");
      -[JFXRGBDMatte postProcessing:depthDataSmall:depthData:RGBDMatte:halfHeight:halfWidth:](self, "postProcessing:depthDataSmall:depthData:RGBDMatte:halfHeight:halfWidth:", -[JFXRGBDMatte localDepthBufferTemp](self, "localDepthBufferTemp"), -[JFXRGBDMatte localDepthBufferSmall](self, "localDepthBufferSmall"), a3->var11, v34, v11, v10);
      src.data = v34;
      src.height = (int)v11;
      src.width = (int)v10;
      src.rowBytes = (int)v10;
      dest.data = a3->var10;
      v35 = (int8x16_t)vcvtq_u64_f64(*(float64x2_t *)p_depthSizeRotated);
      *(int8x16_t *)&dest.height = vextq_s8(v35, v35, 8uLL);
      dest.rowBytes = v35.i64[0];
      vImageScale_Planar8(&src, &dest, self->_vImageTempBuffer, 0x20u);
    }
  }
  v44 = 0u;
  v45 = 0u;
  -[JFXRGBDMatte featherMatte:](self, "featherMatte:", a3);
  v41[0] = v44;
  v41[1] = v45;
  v36 = -[JFXRGBDMatte createInvertedMatte:](self, "createInvertedMatte:", v41);
  v37 = v36;
  if (self->_visualizeFaceRect)
    drawFaceRectOnAlphaMap(v36, self->_largestFaceRect.origin.x, self->_largestFaceRect.origin.y, self->_largestFaceRect.size.width, self->_largestFaceRect.size.height);
  v38 = -[JFXPixelRotationSession createRotatedPixelBuffer:](self->_matteRotator, "createRotatedPixelBuffer:", v37);
  v39 = -[JFXRGBDMatte createTemporalFilteredMatte:](self, "createTemporalFilteredMatte:", v38);
  CVPixelBufferRelease(v38);
  CVPixelBufferRelease(v37);
  ContourProcessing::~ContourProcessing((ContourProcessing *)v46);
  return v39;
}

- (__CVBuffer)createTemporalFilteredMatte:(__CVBuffer *)a3
{
  JFXPerfTimer *v5;
  size_t Width;
  size_t Height;
  __CVBuffer *alphaMatteHistory;
  size_t BytesPerRow;
  size_t v10;
  size_t v11;
  uint8x8_t *BaseAddress;
  uint8x8_t *v13;
  uint8x8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint8x8_t *v17;
  uint8x8_t *v18;
  uint8x8_t *v19;
  uint64_t v20;
  uint8x8_t v21;
  uint8x8_t v22;
  uint8x8_t v23;
  NSObject *v24;
  uint64_t v25;
  __CVBuffer *v26;
  JFXPerfTimer *v28;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferRef pixelBufferOut;
  uint8_t buf[4];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(JFXPerfTimer);
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  pixelBufferOut = 0;
  CVPixelBufferPoolCreatePixelBuffer(0, self->_scaledDestinationPool, &pixelBufferOut);
  pixelBuffer = 0;
  CVPixelBufferPoolCreatePixelBuffer(0, self->_rotatedMattePool, &pixelBuffer);
  if (self->_motionDetected || (alphaMatteHistory = self->_alphaMatteHistory) == 0)
  {
    pixelBuffer = CVPixelBufferRetain(a3);
  }
  else
  {
    CVPixelBufferLockBaseAddress(alphaMatteHistory, 1uLL);
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    CVPixelBufferLockBaseAddress(pixelBuffer, 0);
    v28 = v5;
    BytesPerRow = CVPixelBufferGetBytesPerRow(self->_alphaMatteHistory);
    v10 = CVPixelBufferGetBytesPerRow(a3);
    v11 = CVPixelBufferGetBytesPerRow(pixelBuffer);
    BaseAddress = (uint8x8_t *)CVPixelBufferGetBaseAddress(pixelBuffer);
    v13 = (uint8x8_t *)CVPixelBufferGetBaseAddress(self->_alphaMatteHistory);
    v14 = (uint8x8_t *)CVPixelBufferGetBaseAddress(a3);
    if (Height)
    {
      v15 = 0;
      v16 = Width >> 3;
      if (Width >> 3 <= 1)
        v16 = 1;
      do
      {
        v17 = v13;
        v18 = v14;
        v19 = BaseAddress;
        v20 = v16;
        if (Width >= 8)
        {
          do
          {
            v21 = *v17++;
            v22 = v21;
            v23 = *v18++;
            *v19++ = vqmovn_u16(vmovl_u8(vhadd_u8(v23, v22)));
            --v20;
          }
          while (v20);
        }
        ++v15;
        BaseAddress = (uint8x8_t *)((char *)BaseAddress + v11);
        v14 = (uint8x8_t *)((char *)v14 + v10);
        v13 = (uint8x8_t *)((char *)v13 + BytesPerRow);
      }
      while (v15 != Height);
    }
    v5 = v28;
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    CVPixelBufferUnlockBaseAddress(self->_alphaMatteHistory, 1uLL);
  }
  CVPixelBufferRelease(self->_alphaMatteHistory);
  self->_alphaMatteHistory = CVPixelBufferRetain(a3);
  -[JFXImageScaler scaleImage:destinationImage:](self->_imageScaler, "scaleImage:destinationImage:", pixelBuffer, pixelBufferOut);
  CVPixelBufferRelease(pixelBuffer);
  JFXLog_DebugMatting();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    -[JFXPerfTimer end](v5, "end");
    *(_DWORD *)buf = 134217984;
    v32 = v25;
    _os_log_impl(&dword_2269A9000, v24, OS_LOG_TYPE_DEFAULT, "temporal filter %.1fms", buf, 0xCu);
  }

  v26 = pixelBufferOut;
  return v26;
}

- (void)innerOuterFusion:(DepthProcessingDataRGBD *)a3 processWin:(CGRect)a4
{
  double height;
  double y;
  JFXPerfTimer *v8;
  __int128 v9;
  double v10;
  double width;
  char *depthBufferFull;
  int v13;
  vImagePixelCount v14;
  vImagePixelCount v15;
  char *v16;
  int v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  _DWORD *v24;
  ContourMemoryPool *contourMemoryPool;
  CGRect *p_largestFaceRect;
  int v27;
  int v28;
  uint64_t var13;
  int v30;
  int v31;
  _DWORD *v32;
  uint64_t v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int *v38;
  int v39;
  int v41;
  int v42;
  uint64_t v44;
  uint64_t v45;
  vImagePixelCount v46;
  uint64_t v47;
  char *var10;
  NSObject *v49;
  uint64_t v50;
  JFXPerfTimer *v51;
  _BYTE v52[132];
  int v53;
  vImage_Buffer v54;
  vImage_Buffer v55;
  vImage_Buffer v56;
  vImage_Buffer dest;
  vImage_Buffer src;
  _OWORD kernel[5];
  char v60;
  uint8_t buf[4];
  uint64_t v62;
  uint64_t v63;

  height = a4.size.height;
  y = a4.origin.y;
  v63 = *MEMORY[0x24BDAC8D0];
  v8 = objc_alloc_init(JFXPerfTimer);
  *(_QWORD *)&v9 = -1;
  *((_QWORD *)&v9 + 1) = -1;
  kernel[3] = v9;
  kernel[4] = v9;
  kernel[1] = v9;
  kernel[2] = v9;
  kernel[0] = v9;
  width = self->_depthSizeRotated.width;
  v10 = self->_depthSizeRotated.height;
  v60 = -1;
  depthBufferFull = self->_depthBufferFull;
  v13 = (int)(width * 0.5);
  src.data = a3->var11;
  src.height = (unint64_t)v10;
  src.width = (unint64_t)width;
  src.rowBytes = (unint64_t)width;
  v14 = (int)(v10 * 0.5);
  dest.data = depthBufferFull;
  dest.height = v14;
  v15 = v13;
  dest.width = v13;
  dest.rowBytes = v13;
  v51 = v8;
  vImageScale_Planar8(&src, &dest, self->_vImageTempBuffer, 0x20u);
  v16 = self->_depthBufferHalf[0];
  v56.data = a3->var10;
  v56.height = v14;
  v56.width = v15;
  v56.rowBytes = v15;
  v55.data = v16;
  v55.height = v14;
  v55.width = v15;
  v55.rowBytes = v15;
  vImageDilate_Planar8(&v56, &v55, 0, 0, (const unsigned __int8 *)kernel, 7uLL, 7uLL, 8u);
  bzero(a3->var11, (int)v15 * (int)v14);
  v17 = (int)y;
  v18 = y + height;
  if (v18 > (double)(int)y)
  {
    v19 = v17;
    v20 = (int)v15 * (uint64_t)v17;
    do
    {
      v21 = v15;
      v22 = v20;
      if ((int)v15 >= 1)
      {
        do
        {
          if (depthBufferFull[v22] <= 0x63u)
            v23 = 0;
          else
            v23 = -1;
          a3->var11[v22++] = v23;
          --v21;
        }
        while (v21);
      }
      ++v19;
      v20 += v15;
    }
    while (v18 > (double)(int)v19);
  }
  v54.data = a3->var11;
  v54.height = v14;
  v54.width = v15;
  v54.rowBytes = v15;
  vImageErode_Planar8(&v54, &dest, 0, 0, (const unsigned __int8 *)kernel, 5uLL, 5uLL, 8u);
  vImageErode_Planar8(&dest, &v54, 0, 0, (const unsigned __int8 *)kernel, 5uLL, 5uLL, 8u);
  vImageDilate_Planar8(&v54, &dest, 0, 0, (const unsigned __int8 *)kernel, 5uLL, 5uLL, 8u);
  vImageDilate_Planar8(&dest, &v54, 0, 0, (const unsigned __int8 *)kernel, 5uLL, 5uLL, 8u);
  v24 = (_DWORD *)operator new[]();
  contourMemoryPool = self->_contourMemoryPool;
  memcpy(v24, contourMemoryPool->var2, 8 * a3->var13);
  v53 = -1;
  ContourProcessing::ContourProcessing((ContourProcessing *)v52, (unsigned __int8 *)a3->var11, v14, v15, contourMemoryPool, 1);
  ContourProcessing::contourExtractionProcessing((ContourProcessing *)v52, &a3->var14, &v53);
  JFXDistanceTransformEuclidean((uint64_t)a3->var11, (uint64_t)depthBufferFull, v14, v15, 1);
  p_largestFaceRect = &self->_largestFaceRect;
  if (isFaceBoundingBoxValid(p_largestFaceRect->origin.x, p_largestFaceRect->origin.y, p_largestFaceRect->size.width, p_largestFaceRect->size.height))
  {
    v27 = (int)(p_largestFaceRect->origin.x * (double)(int)v14);
    v28 = (int)(p_largestFaceRect->size.width * (double)(int)v14) + v27;
  }
  else
  {
    v27 = (int)(y + 20.0);
    if ((int)v14 - 1 < v27)
      v27 = v14 - 1;
    v28 = (int)v18;
  }
  var13 = a3->var13;
  if ((int)var13 < 1)
    goto LABEL_21;
  v30 = 0;
  v31 = 0;
  v32 = v24 + 1;
  v33 = a3->var13;
  do
  {
    if (*v32 == v27)
    {
      ++v30;
      v31 += *(v32 - 1);
    }
    v32 += 2;
    --v33;
  }
  while (v33);
  if (v30 <= 0)
  {
LABEL_21:
    if ((v15 & 0x80000000) == 0)
      v35 = v15;
    else
      v35 = v15 + 1;
    v34 = v35 >> 1;
  }
  else
  {
    v34 = v31 / v30;
  }
  if ((int)var13 >= 1)
  {
    v36 = 0;
    v37 = 0;
    v38 = v24 + 1;
    do
    {
      v39 = *v38;
      if (*v38 > v27 && v39 < v28)
      {
        v41 = *(v38 - 1);
        if (v41 > v34)
        {
          v37 += depthBufferFull[v41 + v39 * (int)v15];
          ++v36;
        }
      }
      v38 += 2;
      --var13;
    }
    while (var13);
    if (v36 > 0)
    {
      v42 = v37 / v36;
      if (v37 / v36 <= 11 && v27 < v28)
      {
        v44 = v27;
        v45 = v34 + (int)v15 * (uint64_t)v27;
        do
        {
          v46 = v15 - v34;
          v47 = v45;
          if (v34 < (int)v15)
          {
            do
            {
              var10 = a3->var10;
              if (!var10[v47] && v16[v47] && v42 < depthBufferFull[v47])
                var10[v47] = -1;
              ++v47;
              --v46;
            }
            while (v46);
          }
          ++v44;
          v45 += v15;
        }
        while (v44 != v28);
      }
    }
  }
  MEMORY[0x2276A1A80](v24, 0x1000C8052888210);
  JFXLog_DebugMatting();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    -[JFXPerfTimer end](v51, "end");
    *(_DWORD *)buf = 134217984;
    v62 = v50;
    _os_log_impl(&dword_2269A9000, v49, OS_LOG_TYPE_DEFAULT, "inner outer fusion %.1fms", buf, 0xCu);
  }

  ContourProcessing::~ContourProcessing((ContourProcessing *)v52);
}

- (void)expansionOfKnownRegionsRGBD:(__CVBuffer *)a3 processingData:(DepthProcessingDataRGBD *)a4 regionWin:(CGRect)a5 centerOfRow:(int)a6
{
  double y;
  __int128 v11;
  char *depthBufferFull;
  double width;
  double height;
  _BOOL4 v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  unsigned int v25;
  unsigned int v26;
  int BytesPerRow;
  char *BaseAddress;
  float32x4_t v29;
  uint8x8_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int8x16_t v34;
  float32x4_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *var10;
  BOOL v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  uint64_t v48;
  unsigned int v49;
  uint64_t i;
  char *v51;
  NSObject *v52;
  uint64_t v53;
  __CVBuffer *v54;
  JFXPerfTimer *v55;
  vImage_Buffer dest;
  vImage_Buffer src;
  uint8_t buf[4];
  uint64_t v59;
  unsigned __int8 kernel[16];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  char v65;
  uint64_t v66;

  y = a5.origin.y;
  v66 = *MEMORY[0x24BDAC8D0];
  v55 = objc_alloc_init(JFXPerfTimer);
  v65 = -1;
  *(_QWORD *)&v11 = -1;
  *((_QWORD *)&v11 + 1) = -1;
  v63 = v11;
  v64 = v11;
  v61 = v11;
  v62 = v11;
  *(_OWORD *)kernel = v11;
  depthBufferFull = self->_depthBufferFull;
  width = self->_depthSizeRotated.width;
  height = self->_depthSizeRotated.height;
  v15 = isFaceBoundingBoxValid(self->_largestFaceRect.origin.x, self->_largestFaceRect.origin.y, self->_largestFaceRect.size.width, self->_largestFaceRect.size.height);
  v16 = (int)(height * 0.5);
  v17 = (int)(width * 0.5);
  if (v15)
  {
    v18 = (int)(self->_largestFaceRect.origin.x * (double)v16);
    v19 = (int)(self->_largestFaceRect.size.width * (double)v16);
  }
  else
  {
    v18 = (int)y + 20;
    v20 = v16 - v18;
    if (v16 - v18 <= 20)
      v20 = 20;
    v19 = v20 - 20;
  }
  v21 = v19 + v18;
  if (v16 - 1 >= v18)
    v22 = v18;
  else
    v22 = v16 - 1;
  src.data = a4->var10;
  src.height = v16;
  if (v21 >= v16)
    v23 = (int)(height * 0.5);
  else
    v23 = v21;
  v24 = v17;
  src.width = v17;
  src.rowBytes = v17;
  dest.data = depthBufferFull;
  dest.height = v16;
  dest.width = v17;
  dest.rowBytes = v17;
  vImageDilate_Planar8(&src, &dest, 0, 0, kernel, 5uLL, 5uLL, 8u);
  v25 = CVPixelBufferGetWidth(a3);
  v26 = CVPixelBufferGetHeight(a3);
  BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
  v31 = v22 & ~(v22 >> 31);
  v32 = v23 & ~(v23 >> 31);
  if (v31 < v32)
  {
    v54 = a3;
    v33 = v31 - 2;
    v34 = (int8x16_t)vdupq_n_s32(0x4B400000u);
    v35 = (float32x4_t)vdupq_n_s32(0xCB400000);
    v36 = v22 & ~(v22 >> 31);
    do
    {
      if (v25 > a6)
      {
        v37 = a6;
        v38 = a6 - 2;
        do
        {
          if (a4->var10[v37 + v36 * v24] >= 0x81u)
          {
            v29.i32[0] = *(_DWORD *)&BaseAddress[4 * (int)v37 + v36 * BytesPerRow];
            v29 = vaddq_f32((float32x4_t)vorrq_s8((int8x16_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)v29.f32)), v34), v35);
            v39 = v33;
            do
            {
              v40 = v39 * v24;
              v41 = v38;
              do
              {
                if ((v41 & 0x8000000000000000) == 0
                  && (v39 & 0x8000000000000000) == 0
                  && v41 < v25
                  && v39 < v26)
                {
                  v42 = v41 + v40;
                  var10 = a4->var10;
                  if (!var10[v41 + v40])
                  {
                    if (depthBufferFull[v42])
                    {
                      if (((v36 - v39) * (v36 - v39) + (v37 - v41) * (v37 - v41)) <= 4)
                      {
                        v30.i32[0] = *(_DWORD *)&BaseAddress[4 * (int)v41 + v39 * BytesPerRow];
                        v45 = vsubq_f32(vaddq_f32((float32x4_t)vorrq_s8((int8x16_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(v30)), v34), v35), v29);
                        v46 = vsubq_f32(v45, v45);
                        v47 = vmulq_f32(v46, v46);
                        v30 = (uint8x8_t)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v47, 2), vaddq_f32(v47, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v47.f32, 1))).u64[0];
                        if (*(float *)v30.i32 <= 100.0)
                          var10[v42] = 0x80;
                      }
                    }
                  }
                }
                v44 = v41++ < v37 + 2;
              }
              while (v44);
              v44 = v39++ < v36 + 2;
            }
            while (v44);
          }
          ++v37;
          ++v38;
        }
        while (v37 < v25);
      }
      ++v36;
      ++v33;
    }
    while (v36 != v32);
    v48 = a6 + v24 * v31;
    a3 = v54;
    do
    {
      v49 = a6;
      for (i = v48; v49 < v25; ++v49)
      {
        v51 = a4->var10;
        if (v51[i] == 128)
          v51[i] = -1;
        ++i;
      }
      ++v31;
      v48 += v24;
    }
    while (v31 != v32);
  }
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  JFXLog_DebugMatting();
  v52 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    -[JFXPerfTimer end](v55, "end");
    *(_DWORD *)buf = 134217984;
    v59 = v53;
    _os_log_impl(&dword_2269A9000, v52, OS_LOG_TYPE_DEFAULT, "expansion %.1fms", buf, 0xCu);
  }

}

- (void)mattingGrabCut:(char *)a3 depthMap:(char *)a4 colorBuffer:(__CVBuffer *)a5 processWin:(CGRect)a6
{
  JFXPerfTimer *v11;
  NSObject *v12;
  void *BaseAddress;
  int BytesPerRow;
  uint64_t i;
  NSObject *v16;
  uint64_t v17;
  NSObject *group;
  CGRect v19;
  __int128 context;
  char *v21;
  void *v22;
  CGRect *v23;
  int v24;
  uint64_t v25;
  _QWORD v26[5];
  int v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v19 = a6;
  if (a6.size.width > 0.0 && a6.size.height > 20.0)
  {
    v11 = objc_alloc_init(JFXPerfTimer);
    self->_grabCutCounter = (self->_grabCutCounter + 1) % 0xA;
    dispatch_get_global_queue(0, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    group = dispatch_group_create();
    CVPixelBufferLockBaseAddress(a5, 1uLL);
    BaseAddress = CVPixelBufferGetBaseAddress(a5);
    BytesPerRow = CVPixelBufferGetBytesPerRow(a5);
    if (self->_disableMattingMultithreading)
    {
      *(_QWORD *)&context = self->_grabCutModules[0];
      *((_QWORD *)&context + 1) = a3;
      v21 = a4;
      v22 = BaseAddress;
      v23 = &v19;
      v24 = BytesPerRow;
      v25 = 0x100000000;
      dispatch_group_async_f(group, v12, &context, (dispatch_function_t)DispatchContextRGBDSensoGrabCut);
      dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
      if (!self->_grabCutCounter)
        -[PVComputeGrabCut reset](self->_grabCutModules[0], "reset");

    }
    else
    {
      *(_QWORD *)&context = self->_grabCutModules[0];
      *((_QWORD *)&context + 1) = a3;
      v21 = a4;
      v22 = BaseAddress;
      v23 = &v19;
      v24 = BytesPerRow;
      v25 = 0x200000000;
      v26[0] = self->_grabCutModules[1];
      v26[1] = a3;
      v26[2] = a4;
      v26[3] = BaseAddress;
      v26[4] = &v19;
      v27 = BytesPerRow;
      v28 = 0x200000001;
      dispatch_group_async_f(group, v12, &context, (dispatch_function_t)DispatchContextRGBDSensoGrabCut);
      dispatch_group_async_f(group, v12, v26, (dispatch_function_t)DispatchContextRGBDSensoGrabCut);
      dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
      if (!self->_grabCutCounter)
      {
        -[PVComputeGrabCut reset](self->_grabCutModules[0], "reset");
        -[PVComputeGrabCut reset](self->_grabCutModules[1], "reset");
      }
      for (i = 56; i != -56; i -= 56)

    }
    CVPixelBufferUnlockBaseAddress(a5, 1uLL);
    JFXLog_DebugMatting();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[JFXPerfTimer end](v11, "end");
      LODWORD(context) = 134217984;
      *(_QWORD *)((char *)&context + 4) = v17;
      _os_log_impl(&dword_2269A9000, v16, OS_LOG_TYPE_DEFAULT, "grabcut %.1fms", (uint8_t *)&context, 0xCu);
    }

  }
}

- (void)getDepthData:(__CVBuffer *)a3 processData:(DepthProcessingDataRGBD *)a4
{
  JFXPerfTimer *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t minObjectDistance;
  int v12;
  int *v13;
  uint64_t v14;
  int v15;
  unint64_t v16;
  unint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v7 = objc_alloc_init(JFXPerfTimer);
    JFXConvertFloatDepthImageToFixedPointAndTranspose(a3, (int32x4_t *)a4->var2);
    DepthProcessingDataRGBD::depthHistogram(a4, self->_depthHist);
    DepthProcessingDataRGBD::fillHolesInSource(a4, self->_largestFaceRect, (UIInterfaceOrientation)self->_interfaceOrientation);
    JFXLog_DebugMatting();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[JFXPerfTimer end](v7, "end");
      v18 = 134217984;
      v19 = v9;
      _os_log_impl(&dword_2269A9000, v8, OS_LOG_TYPE_DEFAULT, "RGBD preproc_histogram %.1fms", (uint8_t *)&v18, 0xCu);
    }

  }
  else
  {
    JFXLog_matting();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_2269A9000, v10, OS_LOG_TYPE_DEFAULT, "Error: depthPixelBuffer=NULL.", (uint8_t *)&v18, 2u);
    }

  }
  self->_faceRectDepth = -1;
  if (isFaceBoundingBoxValid(self->_largestFaceRect.origin.x, self->_largestFaceRect.origin.y, self->_largestFaceRect.size.width, self->_largestFaceRect.size.height))
  {
    -[JFXRGBDMatte findDepthForFace:](self, "findDepthForFace:", a4);
  }
  minObjectDistance = self->_minObjectDistance;
  if ((int)minObjectDistance < 3)
    goto LABEL_16;
  v12 = 0;
  v13 = &self->_depthHist[2];
  v14 = minObjectDistance - 2;
  do
  {
    v15 = *v13++;
    v12 += v15;
    --v14;
  }
  while (v14);
  if (v12 <= 2000)
  {
LABEL_16:
    self->_numFramesWithVeryClosePixels = 0;
    goto LABEL_17;
  }
  v16 = self->_numFramesWithVeryClosePixels + 1;
  self->_numFramesWithVeryClosePixels = v16;
  if (v16 <= 3)
  {
LABEL_17:
    v17 = 0;
    goto LABEL_18;
  }
  v17 = 1;
LABEL_18:
  self->_currentMattingStatus = v17;
}

- (void)depthToAlphaMap:(DepthProcessingDataRGBD *)a3
{
  int v5;
  CGSize *p_depthSizeRotated;
  double v7;
  int *depthHist;
  int v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int *v21;
  int v22;
  int v23;
  BOOL v24;
  uint64_t v25;
  int *v26;
  int v27;
  int v28;
  BOOL v29;
  int v30;
  int v31;
  int faceRectDepth;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  int *v36;
  uint64_t v37;
  int v38;
  char *depthBufferFull;
  double height;
  double width;
  int v42;
  int v43;
  uint64_t v44;
  uint64_t i;
  char v46;
  unsigned __int8 v47[32];
  vImage_Buffer v48;
  vImage_Buffer v49;
  _DWORD v50[9];
  _BYTE v51[4];
  _DWORD v52[98];
  uint64_t v53;

  v5 = 0;
  v53 = *MEMORY[0x24BDAC8D0];
  p_depthSizeRotated = &self->_depthSizeRotated;
  v7 = self->_depthSizeRotated.height * self->_depthSizeRotated.width;
  depthHist = self->_depthHist;
  v9 = 1;
  do
  {
    v10 = v9;
    if (v9 <= 99)
      v11 = 99;
    else
      v11 = v9;
    v12 = v11 + 1;
    while (depthHist[v10] <= 20)
    {
      ++v10;
      ++v9;
      if (v12 == (_DWORD)v10)
        goto LABEL_15;
    }
    v50[3 * v5 + 8] = v10;
    v13 = 3 * v5;
    v50[v13 + 9] = 0;
    if ((int)v10 <= 99)
    {
      v14 = 0;
      while (1)
      {
        v15 = depthHist[v10];
        if (v15 < 21)
          break;
        v14 += v15;
        v50[v13 + 9] = v14;
        v24 = v10++ < 99;
        if (!v24)
        {
          LODWORD(v10) = 100;
          break;
        }
      }
    }
    v12 = v10 - 1;
    v52[v13] = v10 - 1;
    ++v5;
LABEL_15:
    v9 = v12 + 1;
  }
  while (v12 < 99);
  if (!v5)
  {
    LODWORD(v17) = 5;
    goto LABEL_47;
  }
  v16 = v5 - 1;
  if (v5 == 1)
  {
    v17 = v52[0];
    if (v52[0] <= 99)
    {
      while (depthHist[v17] >= 1)
      {
        if ((_DWORD)++v17 == 100)
          goto LABEL_43;
      }
      goto LABEL_47;
    }
LABEL_43:
    LODWORD(v17) = 99;
    goto LABEL_47;
  }
  if (v5 < 1)
  {
    LODWORD(v19) = 0;
  }
  else
  {
    v18 = 0;
    LODWORD(v19) = 0;
    v20 = 0;
    v21 = (int *)v51;
    do
    {
      v23 = *v21;
      v21 += 3;
      v22 = v23;
      if (v23 <= v20)
      {
        v19 = v19;
      }
      else
      {
        v20 = v22;
        v19 = v18;
      }
      ++v18;
    }
    while (v5 != v18);
    v24 = !self->_usingforegroundSegBooster || (int)v19 <= 0;
    if (!v24)
    {
      v25 = 0;
      v26 = (int *)v51;
      while (1)
      {
        v27 = *v26;
        v26 += 3;
        if (v27 > (int)v7 / 3)
          break;
        if (v19 == ++v25)
          goto LABEL_39;
      }
      LODWORD(v19) = v25;
    }
  }
LABEL_39:
  v17 = (int)v52[3 * (int)v19];
  if ((_DWORD)v19 != v16)
  {
    v28 = v50[3 * (int)v19 + 11];
    v29 = __OFADD__(v28, (_DWORD)v17);
    v30 = v28 + v17;
    if (v30 < 0 != v29)
      ++v30;
    LODWORD(v17) = v30 >> 1;
    goto LABEL_47;
  }
  if ((int)v17 > 99)
    goto LABEL_43;
  while (depthHist[v17] >= 1)
  {
    if ((_DWORD)++v17 == 100)
      goto LABEL_43;
  }
LABEL_47:
  v31 = 10 * v17;
  faceRectDepth = self->_faceRectDepth;
  if (faceRectDepth >= 1)
  {
    if (v31 >= faceRectDepth || faceRectDepth > 0x3E7)
    {
      if (v31 > faceRectDepth && faceRectDepth <= 0x12B)
      {
        v36 = &self->_depthHist[45];
        v37 = -550;
        while (1)
        {
          v38 = *v36++;
          if (v38 < 21)
            break;
          v37 += 10;
          if (!v37)
          {
            v31 = 1000;
            goto LABEL_66;
          }
        }
        v31 = v37 + 1000;
      }
    }
    else
    {
      v33 = (unsigned __int16)self->_faceRectDepth / 0xAu;
      if (v33 <= 0x63)
        v34 = 99;
      else
        v34 = (unsigned __int16)self->_faceRectDepth / 0xAu;
      v35 = v34 + 1;
      while (depthHist[v33] >= 21)
      {
        if (v35 == ++v33)
          goto LABEL_64;
      }
      LODWORD(v35) = v33;
LABEL_64:
      v31 = 10 * v35;
    }
  }
LABEL_66:
  depthBufferFull = self->_depthBufferFull;
  DepthProcessingDataRGBD::setAverageDepthAndSegment(a3, v31);
  width = p_depthSizeRotated->width;
  height = p_depthSizeRotated->height;
  v42 = (int)(height * 0.5);
  memset(v47, 255, 25);
  v43 = (int)(width * 0.5);
  *(_QWORD *)v50 = a3->var10;
  *(_QWORD *)&v50[2] = (unint64_t)height;
  *(_QWORD *)&v50[4] = (unint64_t)width;
  *(_QWORD *)&v50[6] = (unint64_t)width;
  v49.data = depthBufferFull;
  v49.height = v42;
  v49.width = v43;
  v49.rowBytes = v43;
  vImageScale_Planar8((const vImage_Buffer *)v50, &v49, self->_vImageTempBuffer, 0x20u);
  v44 = (v43 * v42);
  if ((int)v44 >= 1)
  {
    for (i = 0; i != v44; ++i)
    {
      if (depthBufferFull[i] <= 0x63u)
        v46 = 0;
      else
        v46 = -1;
      a3->var10[i] = v46;
    }
  }
  v48.data = a3->var10;
  v48.height = v42;
  v48.width = v43;
  v48.rowBytes = v43;
  vImageDilate_Planar8(&v48, &v49, 0, 0, v47, 3uLL, 3uLL, 8u);
  vImageDilate_Planar8(&v49, &v48, 0, 0, v47, 3uLL, 3uLL, 8u);
  vImageErode_Planar8(&v48, &v49, 0, 0, v47, 3uLL, 3uLL, 8u);
  vImageErode_Planar8(&v49, &v48, 0, 0, v47, 3uLL, 3uLL, 8u);
}

- (void)postProcessing:(const char *)a3 depthDataSmall:(const char *)a4 depthData:(const char *)a5 RGBDMatte:(char *)a6 halfHeight:(int)a7 halfWidth:(int)a8
{
  int v14;
  int v15;
  int v16;
  float v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  const char *v22;
  float v23;
  uint64_t v24;
  const char *v25;
  char *v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  char *depthBufferFull;
  uint64_t v31;
  int v32;
  int v33;
  int topOfHeadHalf;
  int *v35;
  int v36;
  int v37;
  int v39;
  uint64_t v40;
  unsigned int v41;
  uint64_t v42;
  double v43;
  int v44;
  int v45;
  unsigned int v46;
  NSObject *v47;
  uint64_t v48;
  JFXPerfTimer *v50;
  _BYTE v51[132];
  int v52;
  uint8_t buf[4];
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v50 = objc_alloc_init(JFXPerfTimer);
  v14 = self->_heightOfMattingWin + self->_topOfHeadHalf;
  if (v14 <= 20)
    v15 = 20;
  else
    v15 = self->_heightOfMattingWin + self->_topOfHeadHalf;
  if (a7 - 1 >= v14)
    v16 = self->_heightOfMattingWin + self->_topOfHeadHalf;
  else
    v16 = a7 - 1;
  memcpy(&a6[v16 * a8], &a5[v16 * a8], (a7 - v16) * a8);
  if (v16 <= 1)
    v18 = 1;
  else
    v18 = v16;
  v19 = (v15 - 19);
  if (v18 > v19)
  {
    v20 = (v18 - 1) * a8;
    v21 = &a6[v20];
    v22 = &a5[v20];
    v23 = 0.0499;
    do
    {
      if (a8 >= 1)
      {
        v24 = a8;
        v25 = v22;
        v26 = v21;
        do
        {
          LOBYTE(v17) = *v26;
          v27 = *(unsigned __int8 *)v25++;
          v17 = (float)((float)(1.0 - v23) * (float)v27) + (float)((float)LODWORD(v17) * v23);
          *v26++ = (int)v17;
          --v24;
        }
        while (v24);
      }
      --v18;
      v23 = v23 + 0.0499;
      v21 -= a8;
      v22 -= a8;
    }
    while (v18 > v19);
  }
  v52 = 0;
  ContourProcessing::ContourProcessing((ContourProcessing *)v51, (unsigned __int8 *)a6, a7, a8, self->_contourMemoryPool, 0);
  v28 = ContourProcessing::contourExtraction((ContourProcessing *)v51, &v52);
  if (v52 < 21 || self->_topOfHeadHalf < 1)
  {
    v40 = (a8 * a7);
    if ((int)v40 >= 1)
    {
      do
      {
        v41 = *(unsigned __int8 *)a3++;
        if (v41 <= 0x63)
          *a6 = 0;
        ++a6;
        --v40;
      }
      while (v40);
    }
  }
  else
  {
    v29 = v28;
    depthBufferFull = self->_depthBufferFull;
    JFXDistanceTransformEuclidean((uint64_t)a4, (uint64_t)depthBufferFull, a7, a8, 0);
    v31 = v52;
    if (v52 < 1)
    {
      v33 = 0;
      v32 = 0;
      v36 = 1;
    }
    else
    {
      v32 = 0;
      v33 = 0;
      topOfHeadHalf = self->_topOfHeadHalf;
      v35 = (int *)(v29 + 4);
      v36 = 1;
      do
      {
        v37 = *v35;
        if (*v35 >= topOfHeadHalf && v37 < self->_heightOfMattingWin + topOfHeadHalf)
        {
          v39 = depthBufferFull[*(v35 - 1) + (uint64_t)(v37 * a8)];
          v32 += v39;
          if (v33 <= v39)
            v33 = v39;
          ++v36;
        }
        v35 += 2;
        --v31;
      }
      while (v31);
    }
    v42 = (a8 * a7);
    if ((int)v42 >= 1)
    {
      v43 = rint((double)v32 / (double)v36);
      v44 = v33 + (uint64_t)v43;
      if (v44 < 0 != __OFADD__(v33, (uint64_t)v43))
        ++v44;
      v45 = v44 >> 1;
      do
      {
        v46 = *(unsigned __int8 *)a3++;
        if (v46 < 0x64 || v33 >= 16 && v45 < *depthBufferFull)
          *a6 = 0;
        ++depthBufferFull;
        ++a6;
        --v42;
      }
      while (v42);
    }
  }
  JFXLog_DebugMatting();
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    -[JFXPerfTimer end](v50, "end");
    *(_DWORD *)buf = 134217984;
    v54 = v48;
    _os_log_impl(&dword_2269A9000, v47, OS_LOG_TYPE_DEFAULT, "postproc %.1fms", buf, 0xCu);
  }

  ContourProcessing::~ContourProcessing((ContourProcessing *)v51);
}

- (BOOL)isValidForCameraFrameSet:(id)a3
{
  id v4;
  id v5;
  __CVBuffer *v6;
  size_t Width;
  size_t Height;
  BOOL v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend(v4, "depthData");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (__CVBuffer *)objc_msgSend(v5, "depthDataMap");

  Width = CVPixelBufferGetWidth(v6);
  Height = CVPixelBufferGetHeight(v6);
  v11.receiver = self;
  v11.super_class = (Class)JFXRGBDMatte;
  if (-[JFXMatting isValidForCameraFrameSet:](&v11, sel_isValidForCameraFrameSet_, v4))
    v9 = self->_depthSize.height == (double)Height && self->_depthSize.width == (double)Width;
  else
    v9 = 0;

  return v9;
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

- (void).cxx_destruct
{
  PVComputeGrabCut **grabCutModules;
  uint64_t i;

  objc_storeStrong((id *)&self->_colorRotator, 0);
  objc_storeStrong((id *)&self->_matteRotator, 0);
  objc_storeStrong((id *)&self->_imageScaler, 0);
  objc_storeStrong((id *)&self->_processThrottle, 0);
  objc_storeStrong((id *)&self->_processQ, 0);
  objc_storeStrong((id *)&self->_submissionQ, 0);
  grabCutModules = self->_grabCutModules;
  for (i = 1; i != -1; --i)
    objc_storeStrong((id *)&grabCutModules[i], 0);
}

@end
