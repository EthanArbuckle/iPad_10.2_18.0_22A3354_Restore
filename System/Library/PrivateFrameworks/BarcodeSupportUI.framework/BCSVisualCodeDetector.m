@implementation BCSVisualCodeDetector

- (BCSVisualCodeDetector)init
{
  BCSVisualCodeDetector *v2;
  BCSVisualCodeDetector *v3;
  BCSVisualCodeDetector *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BCSVisualCodeDetector;
  v2 = -[BCSVisualCodeDetector init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_isAppC3DTracking = 0;
    -[BCSVisualCodeDetector startSession](v2, "startSession");
    v4 = v3;
  }

  return v3;
}

- (void)detectCodeFromBuffer:(opaqueCMSampleBuffer *)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  CVImageBufferRef ImageBuffer;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  double Seconds;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  _BOOL4 isAppC3DTracking;
  void *v17;
  id appcodeExtractCompletionHandler;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  dispatch_time_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  _QWORD aBlock[4];
  id v31;
  NSObject *v32;
  uint8_t *v33;
  CMTime time;
  CMTime v35;
  uint8_t buf[8];
  uint8_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v6 = (void (**)(id, void *))a4;
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (ImageBuffer)
  {
    v8 = (os_signpost_id_t)ImageBuffer;
    v9 = (id)BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
    v10 = v9;
    if (v8 != -1 && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_236DE2000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "Detection", "start code detection", buf, 2u);
    }

    *(_QWORD *)buf = 0;
    v37 = buf;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__0;
    v40 = __Block_byref_object_dispose__0;
    v41 = 0;
    v11 = dispatch_group_create();
    memset(&v35, 0, sizeof(v35));
    CMSampleBufferGetPresentationTimeStamp(&v35, a3);
    time = v35;
    Seconds = CMTimeGetSeconds(&time);
    CMGetAttachment(a3, (CFStringRef)*MEMORY[0x24BDC0CD8], 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
    v15 = v14;
    if ((unint64_t)v13 + 1 >= 2 && os_signpost_enabled(v14))
    {
      LOWORD(time.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_236DE2000, v15, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v13, "Detection.ACCode", "start ACCode code detection", (uint8_t *)&time, 2u);
    }

    isAppC3DTracking = self->_isAppC3DTracking;
    self->_isAppC3DTracking = 0;
    if (-[BCSVisualCodeDetector _submitToAppC3D:timestamp:metadata:](self, "_submitToAppC3D:timestamp:metadata:", v8, v13, Seconds))
    {
      dispatch_group_enter(v11);
      os_unfair_lock_lock(&appcodeExtractCompletionHandlerLock);
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __57__BCSVisualCodeDetector_detectCodeFromBuffer_completion___block_invoke;
      aBlock[3] = &unk_2508640F0;
      v33 = buf;
      v31 = v13;
      v32 = v11;
      v17 = _Block_copy(aBlock);
      appcodeExtractCompletionHandler = self->_appcodeExtractCompletionHandler;
      self->_appcodeExtractCompletionHandler = v17;

      os_unfair_lock_unlock(&appcodeExtractCompletionHandlerLock);
    }
    v19 = (id)BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
    v20 = v19;
    if (v8 != -1 && os_signpost_enabled(v19))
    {
      LOWORD(time.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_236DE2000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v8, "Detection.QR", "start QR code detection", (uint8_t *)&time, 2u);
    }

    -[BCSVisualCodeDetector _estimateQRCodeAvailabilityInFrame:](self, "_estimateQRCodeAvailabilityInFrame:", v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (id)BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
    v23 = v22;
    if (v8 != -1 && os_signpost_enabled(v22))
    {
      LOWORD(time.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_236DE2000, v23, OS_SIGNPOST_INTERVAL_END, v8, "Detection.QR", "end QR code detection", (uint8_t *)&time, 2u);
    }

    v24 = (id)BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
    v25 = v24;
    if (v8 != -1 && os_signpost_enabled(v24))
    {
      LOWORD(time.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_236DE2000, v25, OS_SIGNPOST_INTERVAL_END, v8, "Detection", "end code detection", (uint8_t *)&time, 2u);
    }

    v26 = dispatch_time(0, 1000000000);
    dispatch_group_wait(v11, v26);
    if (objc_msgSend(*((id *)v37 + 5), "count"))
    {
      objc_msgSend(v21, "arrayByAddingObjectsFromArray:", *((_QWORD *)v37 + 5));
      v27 = objc_claimAutoreleasedReturnValue();

      v21 = (void *)v27;
    }
    else if (v21)
    {
      v28 = objc_msgSend(v21, "count");
      if (!isAppC3DTracking && v28 && self->_isAppC3DTracking)
      {

        v29 = BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          LOWORD(time.value) = 0;
          _os_log_impl(&dword_236DE2000, v29, OS_LOG_TYPE_INFO, "Tracking an app clip code, skip QR codes in frame.", (uint8_t *)&time, 2u);
        }
        v21 = 0;
      }
    }
    v6[2](v6, v21);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v6[2](v6, 0);
  }

}

void __57__BCSVisualCodeDetector_detectCodeFromBuffer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint8_t v8[16];

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v5 = (id)BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7 + 1 >= 2 && os_signpost_enabled(v5))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_236DE2000, v6, OS_SIGNPOST_INTERVAL_END, v7, "Detection.ACCode", "end ACCode code detection", v8, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)resetCache
{
  self->_isAppC3DTracking = 0;
}

- (id)_estimateQRCodeAvailabilityInFrame:(__CVBuffer *)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BCSVisualCodeQR *v19;
  BCSVisualCodeQR *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  _BYTE v27[128];
  id v28;
  _QWORD v29[3];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc(MEMORY[0x24BDF9C28]);
  v6 = (void *)objc_msgSend(v5, "initWithCVPixelBuffer:orientation:options:", a3, self->_imageOrientation, MEMORY[0x24BDBD1B8]);
  v7 = objc_alloc_init(MEMORY[0x24BDF9B50]);
  -[BCSVisualCodeDetector _regionOfInterest](self, "_regionOfInterest");
  objc_msgSend(v7, "setRegionOfInterest:");
  objc_msgSend(v7, "setRevision:", 1);
  v29[0] = *MEMORY[0x24BDF9DA0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSymbologies:", v8);

  objc_msgSend(v7, "setStopAtFirstPyramidWith2DCode:", 1);
  v28 = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v28, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v6, "performRequests:error:", v9, &v26);
  v10 = v26;

  objc_msgSend(v7, "results");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v17);
        v19 = [BCSVisualCodeQR alloc];
        v20 = -[BCSVisualCodeQR initWithBarcodeObservation:](v19, "initWithBarcodeObservation:", v18, (_QWORD)v22);
        objc_msgSend(v12, "addObject:", v20);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v15);
  }

  return v12;
}

- (CGRect)_regionOfInterest
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = 0.15;
  v3 = 0.2;
  v4 = 0.7;
  v5 = 0.6;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)didReceiveAppC3DUpdate:(AppC3DTrackingResult *)a3 orientation:(unsigned int)a4 error:(__CFError *)a5 timestamp:(double)a6
{
  NSObject *v8;
  void *v9;
  id v10;
  void (**appcodeExtractCompletionHandler)(id, void *);
  id v12;
  id v13;
  uint8_t buf[4];
  __CFError *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a5)
  {
    v8 = BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v15 = a5;
      _os_log_impl(&dword_236DE2000, v8, OS_LOG_TYPE_INFO, "Error in update callback: %@", buf, 0xCu);
    }

    v9 = 0;
    v10 = 0;
  }
  else
  {
    v13 = 0;
    -[BCSVisualCodeDetector _extractAppClipCode:orientation:error:timestamp:](self, "_extractAppClipCode:orientation:error:timestamp:", a3, *(_QWORD *)&a4, &v13, a6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v13;
  }
  os_unfair_lock_lock(&appcodeExtractCompletionHandlerLock);
  appcodeExtractCompletionHandler = (void (**)(id, void *))self->_appcodeExtractCompletionHandler;
  if (appcodeExtractCompletionHandler)
  {
    appcodeExtractCompletionHandler[2](appcodeExtractCompletionHandler, v9);
    v12 = self->_appcodeExtractCompletionHandler;
  }
  else
  {
    v12 = 0;
  }
  self->_appcodeExtractCompletionHandler = 0;

  os_unfair_lock_unlock(&appcodeExtractCompletionHandlerLock);
}

- (CGAffineTransform)_tranformWithImageOrientation:(SEL)a3
{
  __int128 v5;
  CGFloat v6;
  uint64_t v11;
  __int128 v12;

  switch(a4)
  {
    case 6u:
      v5 = xmmword_236DFDCA0;
      __asm { FMOV            V0.2D, #1.0 }
      v6 = 0.0;
      goto LABEL_7;
    case 3u:
      _Q0 = xmmword_236DFDD40;
      v5 = xmmword_236DFDD50;
      v6 = -1.0;
      goto LABEL_7;
    case 1u:
      _Q0 = xmmword_236DFDD50;
      v5 = xmmword_236DFDE40;
      v6 = 1.0;
LABEL_7:
      retstr->a = v6;
      *(_QWORD *)&retstr->b = v5;
      *(_OWORD *)&retstr->c = v5;
      *(_OWORD *)&retstr->tx = _Q0;
      return self;
  }
  v11 = MEMORY[0x24BDBD8B8];
  v12 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->c = v12;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v11 + 32);
  return self;
}

- (id)_extractAppClipCode:(AppC3DTrackingResult *)a3 orientation:(unsigned int)a4 error:(id *)a5 timestamp:(double)a6
{
  uint64_t v7;
  uint64_t NumberOfTrackingData;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t Data;
  void *v16;
  unsigned int DataVersion;
  unsigned int v19;
  void *Corners;
  void *v21;
  BCSVisualCodeDetector *v22;
  uint64_t i;
  const __CFDictionary *v24;
  _BOOL4 v25;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  BCSVisualCodeAppClip *v36;
  double v38;
  double v39;
  unsigned int v40;
  uint64_t v41;
  unsigned int v42;
  CGPoint point;
  float64x2_t v44;
  float64x2_t v45;
  float64x2_t v46;
  id v47;
  CGPoint buf[2];
  CGPoint v49;
  CGPoint v50;
  uint64_t v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  v7 = *(_QWORD *)&a4;
  v51 = *MEMORY[0x24BDAC8D0];
  v47 = *a5;
  NumberOfTrackingData = AppC3DTrackingResultGetNumberOfTrackingData();
  if (v47)
  {
    v10 = 0;
  }
  else
  {
    v11 = NumberOfTrackingData;
    if (NumberOfTrackingData)
    {
      v12 = BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf[0].x) = 134218240;
        *(_QWORD *)((char *)&buf[0].x + 4) = v11;
        WORD2(buf[0].y) = 2048;
        *(double *)((char *)&buf[0].y + 6) = a6;
        _os_log_impl(&dword_236DE2000, v12, OS_LOG_TYPE_INFO, "App clip code tracking %ld codes at %f", (uint8_t *)buf, 0x16u);
      }
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v14 = 0;
      v42 = v7;
      v41 = v11;
      while (1)
      {
        self->_isAppC3DTracking = 1;
        Data = AppC3DTrackingResultCreateData();
        v16 = (void *)Data;
        if (v47 || Data == 0)
          break;
        AppC3DTrackingResultGetMetadata();
        if (v47)
          break;
        DataVersion = AppC3DTrackingResultGetDataVersion();
        if (v47)
          break;
        v19 = DataVersion;
        Corners = (void *)AppC3DTrackingResultCreateCorners();
        if (!objc_msgSend(Corners, "count") || v47 || objc_msgSend(Corners, "count") != 4)
        {

          break;
        }
        v40 = v19;
        v21 = v13;
        v45 = 0u;
        v46 = 0u;
        v44 = 0u;
        v22 = self;
        -[BCSVisualCodeDetector _tranformWithImageOrientation:](self, "_tranformWithImageOrientation:", v7);
        for (i = 0; i != 4; ++i)
        {
          point.x = 0.0;
          point.y = 0.0;
          objc_msgSend(Corners, "objectAtIndexedSubscript:", i);
          v24 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          v25 = CGPointMakeWithDictionaryRepresentation(v24, &point);

          if (!v25)
          {

            v10 = 0;
            v13 = v21;
            goto LABEL_30;
          }
          buf[i] = (CGPoint)vaddq_f64(v46, vmlaq_n_f64(vmulq_n_f64(v45, point.y), v44, point.x));
        }
        self = v22;
        -[BCSVisualCodeDetector _regionOfInterest](v22, "_regionOfInterest");
        x = v52.origin.x;
        y = v52.origin.y;
        width = v52.size.width;
        height = v52.size.height;
        v30 = buf[0].x;
        v31 = buf[0].y;
        v13 = v21;
        if (CGRectContainsPoint(v52, buf[0]))
        {
          v32 = buf[1].x;
          v33 = buf[1].y;
          v53.origin.x = x;
          v53.origin.y = y;
          v53.size.width = width;
          v53.size.height = height;
          if (CGRectContainsPoint(v53, buf[1]))
          {
            v54.origin.x = x;
            v54.origin.y = y;
            v54.size.width = width;
            v54.size.height = height;
            v38 = v49.y;
            v39 = v49.x;
            if (CGRectContainsPoint(v54, v49))
            {
              v55.origin.x = x;
              v55.origin.y = y;
              v55.size.width = width;
              v34 = v50.x;
              v55.size.height = height;
              v35 = v50.y;
              if (CGRectContainsPoint(v55, v50))
              {
                v36 = -[BCSVisualCodeAppClip initWithRawPayload:version:]([BCSVisualCodeAppClip alloc], "initWithRawPayload:version:", v16, v40);
                -[BCSVisualCode setTopLeft:](v36, "setTopLeft:", v30, v31);
                -[BCSVisualCode setTopRight:](v36, "setTopRight:", v32, v33);
                -[BCSVisualCode setBottomRight:](v36, "setBottomRight:", v39, v38);
                -[BCSVisualCode setBottomLeft:](v36, "setBottomLeft:", v34, v35);
                objc_msgSend(v21, "addObject:", v36);

              }
            }
          }
        }

        ++v14;
        v7 = v42;
        if (v14 == v41)
          goto LABEL_26;
      }

      v10 = 0;
    }
    else
    {
LABEL_26:
      v10 = v13;
    }
LABEL_30:

  }
  return v10;
}

- (BOOL)_processCameraFrame:(__CVBuffer *)a3 timestamp:(double)a4 cameraMatrix:(double)a5[9]
{
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8 = CFSTR("orientation");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_imageOrientation);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  AppC3DProcessCameraFrameData();
  return 1;
}

- (BOOL)_submitToAppC3D:(__CVBuffer *)a3 timestamp:(double)a4 metadata:(id)a5
{
  NSObject *v8;
  double Width;
  size_t Height;
  int8x16_t v12;
  int8x16_t v13;
  __int128 v14;
  uint8_t buf[8];
  double v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (a5)
  {
    v13 = 0u;
    v14 = 0u;
    v12 = 0u;
    objc_msgSend(a5, "getBytes:length:", &v12, 48);
    *(double *)buf = *(float *)v12.i32;
    v16 = *(float *)v13.i32;
    v17 = vcvtq_f64_f32((float32x2_t)__PAIR64__(v12.u32[1], v14));
    v18 = vcvtq_f64_f32((float32x2_t)vzip2_s32(*(int32x2_t *)v13.i8, *(int32x2_t *)&v14));
    v19 = vcvtq_f64_f32((float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8(v12, v12, 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8(v13, v13, 8uLL)));
    v20 = *((float *)&v14 + 2);
  }
  else
  {
    v8 = BCS_LOG_CHANNEL_PREFIXBarcodeScannerLifeCycle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_236DE2000, v8, OS_LOG_TYPE_INFO, "Intrinsics metadata is nil, generate the matrix based on image dimension.", buf, 2u);
    }
    Width = (double)CVPixelBufferGetWidth(a3);
    Height = CVPixelBufferGetHeight(a3);
    *(double *)buf = Width;
    v16 = 0.0;
    v17.f64[0] = (Width + -1.0) * 0.5;
    v17.f64[1] = 0.0;
    v18.f64[0] = Width;
    v18.f64[1] = ((double)Height + -1.0) * 0.5;
    v19 = 0uLL;
    v20 = 1.0;
  }
  return -[BCSVisualCodeDetector _processCameraFrame:timestamp:cameraMatrix:](self, "_processCameraFrame:timestamp:cameraMatrix:", a3, buf, a4);
}

- (void)startSession
{
  if (!self->_appCodeSession)
  {
    AppC3DConfigCreate();
    AppC3DConfigSetTrackingMode();
    AppC3DConfigSetTrackingConfig();
    AppC3DCreate();
    AppC3DConfigRelease();
    AppC3DSetUpdateCallback();
  }
}

- (void)endSession
{
  if (self->_appCodeSession)
  {
    AppC3DRelease();
    self->_appCodeSession = 0;
  }
}

- (unsigned)imageOrientation
{
  return self->_imageOrientation;
}

- (void)setImageOrientation:(unsigned int)a3
{
  self->_imageOrientation = a3;
}

- (AppC3DSession)appCodeSession
{
  return self->_appCodeSession;
}

- (void)setAppCodeSession:(AppC3DSession *)a3
{
  self->_appCodeSession = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_appcodeExtractCompletionHandler, 0);
}

@end
