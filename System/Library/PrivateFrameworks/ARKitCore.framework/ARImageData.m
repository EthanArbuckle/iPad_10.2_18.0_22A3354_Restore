@implementation ARImageData

- (ARImageData)init
{
  ARImageData *v2;
  uint64_t v3;
  NSMutableDictionary *extrinsicsMap;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ARImageData;
  v2 = -[ARImageData init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    extrinsicsMap = v2->_extrinsicsMap;
    v2->_extrinsicsMap = (NSMutableDictionary *)v3;

    v5 = MEMORY[0x1E0C83FF0];
    v6 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 16);
    *(_OWORD *)&v2[1].super.isa = *MEMORY[0x1E0C83FF0];
    *(_OWORD *)&v2[1]._temperature = v6;
    v7 = *(_OWORD *)(v5 + 48);
    *(_OWORD *)&v2[1]._timestamp = *(_OWORD *)(v5 + 32);
    *(_OWORD *)&v2[1]._currentCaptureTimestamp = v7;
  }
  return v2;
}

- (ARImageData)initWithImageData:(id)a3
{
  id *v4;
  ARImageData *v5;
  ARImageData *v6;
  unsigned __int8 *anon_120;
  double v8;
  double v9;
  uint64_t v10;
  NSDate *captureDate;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  double v21;
  float v22;
  float v23;
  float v24;
  float v25;
  uint64_t v26;
  ARFaceData *faceData;
  uint64_t v28;
  AVDepthData *depthData;
  double v30;
  void *v31;
  uint64_t v32;
  NSString *cameraType;
  uint64_t v34;
  ARImageData *latestUltraWideImage;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  double v40;
  uint64_t v41;
  ARPointCloud *pointCloud;
  uint64_t v43;
  AVCameraCalibrationData *calibrationData;
  uint64_t v45;
  ADCameraCalibration *adCameraCalibration;
  __int128 v48;
  __int128 v49;

  v4 = (id *)a3;
  v5 = -[ARImageData init](self, "init");
  v6 = v5;
  if (v5)
  {
    anon_120 = v5->_anon_120;
    -[ARImageData setPixelBuffer:](v5, "setPixelBuffer:", objc_msgSend(v4, "pixelBuffer"));
    -[ARImageData setVisionData:](v6, "setVisionData:", objc_msgSend(v4, "visionData"));
    objc_msgSend(v4, "timestamp");
    v6->_timestamp = v8;
    objc_msgSend(v4, "currentCaptureTimestamp");
    v6->_currentCaptureTimestamp = v9;
    objc_msgSend(v4, "captureDate");
    v10 = objc_claimAutoreleasedReturnValue();
    captureDate = v6->_captureDate;
    v6->_captureDate = (NSDate *)v10;

    objc_msgSend(v4, "cameraIntrinsics");
    *(_DWORD *)&v6->_anon_120[8] = v12;
    *(_DWORD *)&v6->_anon_120[24] = v13;
    *(_QWORD *)anon_120 = v14;
    *(_QWORD *)&v6->_anon_120[16] = v15;
    *(_DWORD *)&v6->_anon_120[40] = v16;
    *(_QWORD *)&v6->_anon_120[32] = v17;
    v6->_mirrored = objc_msgSend(v4, "isMirrored");
    v6->_lensType = objc_msgSend(v4, "lensType");
    if (v4)
    {
      objc_msgSend(v4, "radialDistortion");
      v18 = v48;
      v19 = v49;
    }
    else
    {
      v18 = 0uLL;
      v19 = 0uLL;
    }
    *(_OWORD *)v6->_radialDistortion = v18;
    *(_OWORD *)&v6->_radialDistortion[16] = v19;
    objc_msgSend(v4, "tangentialDistortion");
    *(_OWORD *)v6->_tangentialDistortion = v20;
    objc_msgSend(v4, "exposureDuration");
    v6->_exposureDuration = v21;
    objc_msgSend(v4, "exposureTargetOffset");
    v6->_exposureTargetOffset = v22;
    objc_msgSend(v4, "temperature");
    v6->_temperature = v23;
    objc_msgSend(v4, "signalToNoiseRatio");
    v6->_signalToNoiseRatio = v24;
    objc_msgSend(v4, "ISO");
    v6->_ISO = v25;
    objc_msgSend(v4, "faceData");
    v26 = objc_claimAutoreleasedReturnValue();
    faceData = v6->_faceData;
    v6->_faceData = (ARFaceData *)v26;

    objc_msgSend(v4, "depthData");
    v28 = objc_claimAutoreleasedReturnValue();
    depthData = v6->_depthData;
    v6->_depthData = (AVDepthData *)v28;

    objc_msgSend(v4, "depthDataTimestamp");
    v6->_depthDataTimestamp = v30;
    v6->_cameraPosition = objc_msgSend(v4, "cameraPosition");
    objc_msgSend(v4, "cameraType");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "copy");
    cameraType = v6->_cameraType;
    v6->_cameraType = (NSString *)v32;

    v6->_captureFramesPerSecond = objc_msgSend(v4, "captureFramesPerSecond");
    v6->_deviceOrientation = objc_msgSend(v4, "deviceOrientation");
    v6->_secondary = objc_msgSend(v4, "isSecondary");
    objc_storeStrong((id *)&v6->_exifData, v4[10]);
    objc_storeStrong((id *)&v6->_tiffData, v4[25]);
    v6->_highResolution = objc_msgSend(v4, "isHighResolution");
    objc_msgSend(v4, "latestUltraWideImage");
    v34 = objc_claimAutoreleasedReturnValue();
    latestUltraWideImage = v6->_latestUltraWideImage;
    v6->_latestUltraWideImage = (ARImageData *)v34;

    objc_msgSend(v4, "visionTransform");
    *(_OWORD *)&v6[1].super.isa = v36;
    *(_OWORD *)&v6[1]._temperature = v37;
    *(_OWORD *)&v6[1]._timestamp = v38;
    *(_OWORD *)&v6[1]._currentCaptureTimestamp = v39;
    objc_msgSend(v4, "timestampOfSynchronizedWideImageData");
    v6->_timestampOfSynchronizedWideImageData = v40;
    objc_msgSend(v4, "pointCloud");
    v41 = objc_claimAutoreleasedReturnValue();
    pointCloud = v6->_pointCloud;
    v6->_pointCloud = (ARPointCloud *)v41;

    objc_msgSend(v4, "calibrationData");
    v43 = objc_claimAutoreleasedReturnValue();
    calibrationData = v6->_calibrationData;
    v6->_calibrationData = (AVCameraCalibrationData *)v43;

    objc_msgSend(v4, "adCameraCalibration");
    v45 = objc_claimAutoreleasedReturnValue();
    adCameraCalibration = v6->_adCameraCalibration;
    v6->_adCameraCalibration = (ADCameraCalibration *)v45;

    objc_storeStrong((id *)&v6->_extrinsicsMap, v4[24]);
    kdebug_trace();
  }

  return v6;
}

- (ARImageData)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3 captureFramePerSecond:(int64_t)a4 captureDevice:(id)a5 captureSession:(id)a6
{
  id v10;
  id v11;
  CVImageBufferRef ImageBuffer;
  CVImageBufferRef v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  ARImageData *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  int v26;
  int v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  NSObject *v31;
  objc_class *v32;
  uint64_t v33;
  void *v34;
  void *v36;
  void *v37;
  CMTime v38;
  CMTime buf;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  if (a3 && (ImageBuffer = CMSampleBufferGetImageBuffer(a3)) != 0)
  {
    v13 = ImageBuffer;
    CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0CA2638], 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    memset(&v38, 0, sizeof(v38));
    CMSampleBufferGetPresentationTimeStamp(&v38, a3);
    CMGetAttachment(a3, CFSTR("{Exif}"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    CMGetAttachment(a3, CFSTR("{TIFF}"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v17 = ARMatrix3x3FromNSData(v14);
    }
    else
    {
      v37 = v15;
      objc_msgSend(v10, "activeFormat");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = initWithSampleBuffer_captureFramePerSecond_captureDevice_captureSession__format;

      if (v21 != (void *)v22)
      {
        objc_msgSend(v10, "activeFormat");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)initWithSampleBuffer_captureFramePerSecond_captureDevice_captureSession__format;
        initWithSampleBuffer_captureFramePerSecond_captureDevice_captureSession__format = v23;

        *(float *)&v25 = ARIntrinsicsFromDeviceFormat((void *)initWithSampleBuffer_captureFramePerSecond_captureDevice_captureSession__format);
        DWORD2(initWithSampleBuffer_captureFramePerSecond_captureDevice_captureSession__fallbackIntrinsics) = v26;
        *(_DWORD *)algn_1EF081A08 = v27;
        *(_QWORD *)&initWithSampleBuffer_captureFramePerSecond_captureDevice_captureSession__fallbackIntrinsics = v25;
        qword_1EF081A00 = v28;
        DWORD2(xmmword_1EF081A10) = v29;
        *(_QWORD *)&xmmword_1EF081A10 = v30;
        _ARLogGeneral_3();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          v32 = (objc_class *)objc_opt_class();
          NSStringFromClass(v32);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          ARMatrix3x3Description((__n128)initWithSampleBuffer_captureFramePerSecond_captureDevice_captureSession__fallbackIntrinsics, *(__n128 *)&qword_1EF081A00, (__n128)xmmword_1EF081A10);
          v33 = objc_claimAutoreleasedReturnValue();
          LODWORD(buf.value) = 138543874;
          *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v36;
          LOWORD(buf.flags) = 2048;
          *(_QWORD *)((char *)&buf.flags + 2) = self;
          HIWORD(buf.epoch) = 2112;
          v40 = v33;
          v34 = (void *)v33;
          _os_log_impl(&dword_1B3A68000, v31, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Using fallback intrinsics %@", (uint8_t *)&buf, 0x20u);

        }
      }
      v17 = *(double *)&initWithSampleBuffer_captureFramePerSecond_captureDevice_captureSession__fallbackIntrinsics;
      v18 = *(double *)&qword_1EF081A00;
      v19 = *(double *)&xmmword_1EF081A10;
      v15 = v37;
    }
    buf = v38;
    self = -[ARImageData initWithPixelBuffer:captureFramePerSecond:captureDevice:captureSession:timestamp:intrinsics:exif:tiff:](self, "initWithPixelBuffer:captureFramePerSecond:captureDevice:captureSession:timestamp:intrinsics:exif:tiff:", v13, a4, v10, v11, &buf, v15, v17, v18, v19, v16);

    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (uint64_t)initWithPixelBuffer:(void *)a1 captureFramePerSecond:(uint64_t)a2 captureDevice:(uint64_t)a3 captureSession:(uint64_t)a4 timestamp:(uint64_t)a5 intrinsics:(uint64_t)a6 exif:(__int128 *)a7
{
  __int128 v8;
  uint64_t v9;

  v8 = *a7;
  v9 = *((_QWORD *)a7 + 2);
  return objc_msgSend(a1, "initWithPixelBuffer:captureFramePerSecond:captureDevice:captureSession:timestamp:intrinsics:exif:tiff:", a3, a4, a5, a6, &v8, 0);
}

- (uint64_t)initWithPixelBuffer:(__n128)a3 captureFramePerSecond:(__n128)a4 captureDevice:(uint64_t)a5 captureSession:(__CVBuffer *)a6 timestamp:(uint64_t)a7 intrinsics:(void *)a8 exif:(void *)a9 tiff:(CMTime *)a10
{
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  Float64 Seconds;
  void *v25;
  uint64_t v26;
  void *v27;
  int v28;
  int v29;
  uint64_t v30;
  void *v31;
  const __CFDictionary *v32;
  const __CFDictionary *Value;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  __int128 v48;
  __int128 v50;
  __int128 v52;
  _QWORD v53[2];
  void (*v54)(uint64_t);
  void *v55;
  const __CFDictionary *v56;
  CMTime time;

  v19 = a8;
  v20 = a9;
  v21 = a11;
  v22 = a12;
  v23 = objc_msgSend(a1, "init");
  if (v23)
  {
    time = *a10;
    Seconds = CMTimeGetSeconds(&time);
    *(Float64 *)(v23 + 32) = Seconds;
    *(Float64 *)(v23 + 48) = Seconds;
    objc_storeStrong((id *)(v23 + 208), a8);
    if (v20)
    {
      v25 = (void *)objc_opt_class();
      time = *a10;
      objc_msgSend(v25, "captureDateFromPresentationTimestamp:session:", &time, v20);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
    }
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v26;

    *(_QWORD *)(v23 + 56) = CVPixelBufferRetain(a6);
    *(_BYTE *)(v23 + 9) = 0;
    objc_msgSend(v19, "deviceWhiteBalanceGains");
    objc_msgSend(v19, "temperatureAndTintValuesForDeviceWhiteBalanceGains:");
    *(_DWORD *)(v23 + 16) = v28;
    objc_msgSend(v19, "exposureTargetOffset");
    *(_DWORD *)(v23 + 12) = v29;
    *(_QWORD *)(v23 + 136) = objc_msgSend(v19, "position");
    objc_msgSend(v19, "deviceType");
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = *(void **)(v23 + 144);
    *(_QWORD *)(v23 + 144) = v30;

    *(_QWORD *)(v23 + 168) = a7;
    *(_DWORD *)(v23 + 20) = 2139095040;
    v32 = CVBufferCopyAttachments(a6, kCVAttachmentMode_ShouldPropagate);
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v54 = __117__ARImageData_initWithPixelBuffer_captureFramePerSecond_captureDevice_captureSession_timestamp_intrinsics_exif_tiff___block_invoke;
    v55 = &__block_descriptor_40_e5_v8__0l;
    v56 = v32;
    if (v32)
    {
      Value = (const __CFDictionary *)CFDictionaryGetValue(v32, (const void *)*MEMORY[0x1E0D04138]);
      if (Value)
      {
        CFDictionaryGetValue(Value, (const void *)*MEMORY[0x1E0D05098]);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v34;
        if (v34)
        {
          objc_msgSend(v34, "floatValue");
          *(_DWORD *)(v23 + 20) = v36;
        }

      }
    }
    objc_msgSend(v21, "valueForKey:", CFSTR("ExposureTime"), *(_OWORD *)&a2, *(_OWORD *)&a3, *(_OWORD *)&a4);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v37)
    {
      objc_msgSend(v37, "doubleValue");
      *(_QWORD *)(v23 + 72) = v39;
    }
    objc_msgSend(v19, "ISO");
    *(_DWORD *)(v23 + 24) = v40;
    *(_OWORD *)(v23 + 288) = v48;
    *(_OWORD *)(v23 + 304) = v50;
    *(_OWORD *)(v23 + 320) = v52;
    v41 = objc_msgSend(v21, "copy");
    v42 = *(void **)(v23 + 80);
    *(_QWORD *)(v23 + 80) = v41;

    v43 = objc_msgSend(v22, "copy");
    v44 = *(void **)(v23 + 200);
    *(_QWORD *)(v23 + 200) = v43;

    +[ARBKSAccelerometer sharedWeakAccelerometerHandle](ARBKSAccelerometer, "sharedWeakAccelerometerHandle");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(v23 + 88) = objc_msgSend(v45, "currentOrientation");
    kdebug_trace();

    v54((uint64_t)v53);
  }

  return v23;
}

void __117__ARImageData_initWithPixelBuffer_captureFramePerSecond_captureDevice_captureSession_timestamp_intrinsics_exif_tiff___block_invoke(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

- (void)dealloc
{
  objc_super v3;

  kdebug_trace();
  CVPixelBufferRelease(self->_pixelBuffer);
  CVPixelBufferRelease(self->_visionData);
  v3.receiver = self;
  v3.super_class = (Class)ARImageData;
  -[ARImageData dealloc](&v3, sel_dealloc);
}

- (void)setPixelBuffer:(__CVBuffer *)a3
{
  __CVBuffer *pixelBuffer;

  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer != a3)
  {
    CVPixelBufferRelease(pixelBuffer);
    self->_pixelBuffer = CVPixelBufferRetain(a3);
  }
}

- (void)setVisionData:(__CVBuffer *)a3
{
  __CVBuffer *visionData;

  visionData = self->_visionData;
  if (visionData != a3)
  {
    CVPixelBufferRelease(visionData);
    self->_visionData = a3;
    CVPixelBufferRetain(a3);
  }
}

- (NSMutableDictionary)extrinsicsMap
{
  return (NSMutableDictionary *)(id)-[NSMutableDictionary copy](self->_extrinsicsMap, "copy");
}

- (CGSize)imageResolution
{
  __CVBuffer *pixelBuffer;
  double Width;
  double Height;
  double v5;
  CGSize result;

  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer)
  {
    Width = (double)CVPixelBufferGetWidth(self->_pixelBuffer);
    Height = (double)CVPixelBufferGetHeight(pixelBuffer);
  }
  else
  {
    Width = *MEMORY[0x1E0C9D820];
    Height = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v5 = Width;
  result.height = Height;
  result.width = v5;
  return result;
}

- (BOOL)matchesPixelBufferPointerRecursively:(void *)a3
{
  ARImageData *v5;
  void *v6;
  char v7;

  if (-[ARImageData pixelBuffer](self, "pixelBuffer") == a3)
    return 1;
  -[ARImageData originalImage](self, "originalImage");
  v5 = (ARImageData *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
    return 0;
  -[ARImageData originalImage](self, "originalImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "matchesPixelBufferPointerRecursively:", a3);

  return v7;
}

- (void)setDeviceOrientation:(int64_t)a3
{
  self->_deviceOrientation = a3;
}

- (unint64_t)hash
{
  return (unint64_t)(self->_timestamp * 1000.0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double *v5;
  double *v6;
  NSDate *captureDate;
  float32x4_t v8;
  uint32x4_t v9;
  int64x2_t v10;
  int64x2_t v11;
  ARFaceData *faceData;
  AVDepthData *depthData;
  NSString *cameraType;
  ARImageData *latestUltraWideImage;
  float32x4_t v16;
  char v17;
  ARPointCloud *pointCloud;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = (double *)v4;
    v6 = v5;
    if (vabdd_f64(self->_timestamp, v5[4]) >= 2.22044605e-16)
      goto LABEL_33;
    if (vabdd_f64(self->_currentCaptureTimestamp, v5[6]) >= 2.22044605e-16)
      goto LABEL_33;
    captureDate = self->_captureDate;
    if (captureDate != *((NSDate **)v6 + 5) && !-[NSDate isEqual:](captureDate, "isEqual:"))
      goto LABEL_33;
    v8.i64[0] = 0x3400000034000000;
    v8.i64[1] = 0x3400000034000000;
    v9 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vcgeq_f32(v8, vabdq_f32(*(float32x4_t *)&self->_anon_120[16], *(float32x4_t *)(v6 + 38))), (int8x16_t)vcgeq_f32(v8, vabdq_f32(*(float32x4_t *)self->_anon_120, *(float32x4_t *)(v6 + 36)))), (int8x16_t)vcgeq_f32(v8, vabdq_f32(*(float32x4_t *)&self->_anon_120[32], *(float32x4_t *)(v6 + 40))));
    v9.i32[3] = v9.i32[2];
    if ((vminvq_u32(v9) & 0x80000000) == 0)
      goto LABEL_33;
    if (self->_pixelBuffer != (__CVBuffer *)*((_QWORD *)v6 + 7))
      goto LABEL_33;
    if (self->_mirrored != *((unsigned __int8 *)v6 + 8))
      goto LABEL_33;
    if (self->_lensType != *((_QWORD *)v6 + 8))
      goto LABEL_33;
    v10 = (int64x2_t)vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)self->_radialDistortion, *(float64x2_t *)(v6 + 32)), (int8x16_t)vceqq_f64(*(float64x2_t *)&self->_radialDistortion[16], *(float64x2_t *)(v6 + 34)));
    if ((vandq_s8((int8x16_t)v10, (int8x16_t)vdupq_laneq_s64(v10, 1)).u64[0] & 0x8000000000000000) == 0)
      goto LABEL_33;
    v11 = vceqq_f64(*(float64x2_t *)self->_tangentialDistortion, *(float64x2_t *)(v6 + 30));
    if ((vandq_s8((int8x16_t)vdupq_laneq_s64(v11, 1), (int8x16_t)v11).u64[0] & 0x8000000000000000) == 0)
      goto LABEL_33;
    if (vabdd_f64(self->_exposureDuration, v6[9]) >= 2.22044605e-16)
      goto LABEL_33;
    if (vabds_f32(self->_exposureTargetOffset, *((float *)v6 + 3)) >= 0.00000011921)
      goto LABEL_33;
    if (vabds_f32(self->_temperature, *((float *)v6 + 4)) >= 0.00000011921)
      goto LABEL_33;
    if (vabds_f32(self->_signalToNoiseRatio, *((float *)v6 + 5)) >= 0.00000011921)
      goto LABEL_33;
    if (vabds_f32(self->_ISO, *((float *)v6 + 6)) >= 0.00000011921)
      goto LABEL_33;
    faceData = self->_faceData;
    if (faceData != *((ARFaceData **)v6 + 12) && !-[ARFaceData isEqual:](faceData, "isEqual:"))
      goto LABEL_33;
    if (((depthData = self->_depthData, depthData == *((AVDepthData **)v6 + 13))
       || -[AVDepthData isEqual:](depthData, "isEqual:"))
      && vabdd_f64(self->_depthDataTimestamp, v6[15]) < 2.22044605e-16
      && self->_visionData == (__CVBuffer *)*((_QWORD *)v6 + 16)
      && self->_cameraPosition == *((_QWORD *)v6 + 17)
      && ((cameraType = self->_cameraType, cameraType == *((NSString **)v6 + 18))
       || -[NSString isEqualToString:](cameraType, "isEqualToString:"))
      && self->_captureFramesPerSecond == *((_QWORD *)v6 + 21)
      && self->_deviceOrientation == *((_QWORD *)v6 + 11)
      && self->_secondary == *((unsigned __int8 *)v6 + 9)
      && self->_highResolution == *((unsigned __int8 *)v6 + 10)
      && ((latestUltraWideImage = self->_latestUltraWideImage, latestUltraWideImage == *((ARImageData **)v6 + 22))
       || -[ARImageData isEqual:](latestUltraWideImage, "isEqual:"))
      && (v16.i64[0] = 0x3400000034000000,
          v16.i64[1] = 0x3400000034000000,
          (vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vcgeq_f32(v16, vabdq_f32(*(float32x4_t *)&self[1]._temperature, *(float32x4_t *)(v6 + 44))), (int8x16_t)vcgeq_f32(v16, vabdq_f32(*(float32x4_t *)&self[1].super.isa, *(float32x4_t *)(v6 + 42)))), vandq_s8((int8x16_t)vcgeq_f32(v16, vabdq_f32(*(float32x4_t *)&self[1]._timestamp, *(float32x4_t *)(v6 + 46))), (int8x16_t)vcgeq_f32(v16,
                                                   vabdq_f32(*(float32x4_t *)&self[1]._currentCaptureTimestamp, *(float32x4_t *)(v6 + 48)))))) & 0x80000000) != 0)&& self->_timestampOfSynchronizedWideImageData == v6[23]&& -[NSMutableDictionary isEqualToDictionary:](self->_extrinsicsMap, "isEqualToDictionary:", *((_QWORD *)v6 + 24))&& -[NSDictionary isEqualToDictionary:](self->_exifData, "isEqualToDictionary:", *((_QWORD *)v6 + 10)))
    {
      pointCloud = self->_pointCloud;
      if (pointCloud == *((ARPointCloud **)v6 + 14))
        v17 = 1;
      else
        v17 = -[ARPointCloud isEqual:](pointCloud, "isEqual:");
    }
    else
    {
LABEL_33:
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<ARImageData: %p timestamp=%f device=%@>"), self, *(_QWORD *)&self->_timestamp, self->_cameraType);
}

- (id)debugQuickLookObject
{
  return (id)objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVImageBuffer:", self->_pixelBuffer);
}

+ (id)captureDateFromPresentationTimestamp:(id *)a3 session:(id)a4
{
  CMTime v6;
  CMTime lhs;
  CMTime v8;
  CMTime v9;

  memset(&v9, 0, sizeof(v9));
  CMClockGetTime(&v9, (CMClockRef)objc_msgSend(a4, "synchronizationClock"));
  memset(&v8, 0, sizeof(v8));
  lhs = v9;
  v6 = *(CMTime *)a3;
  CMTimeSubtract(&v8, &lhs, &v6);
  lhs = v8;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -CMTimeGetSeconds(&lhs));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARImageData)initWithCoder:(id)a3
{
  id v4;
  ARImageData *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  float v13;
  double v14;
  double v15;
  unsigned int v16;
  double v17;
  ARImageData *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  unsigned int v55;
  double v56;
  double v57;
  _OWORD v58[2];
  __int128 v59;
  __int128 v60;

  v4 = a3;
  v5 = -[ARImageData init](self, "init");
  if (!v5)
    goto LABEL_30;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
  v7 = v6;
  v8 = 0.0;
  if (v7 >= 0.0)
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"), 0.0);
  -[ARImageData setTimestamp:](v5, "setTimestamp:", v8);
  -[ARImageData timestamp](v5, "timestamp");
  -[ARImageData setCurrentCaptureTimestamp:](v5, "setCurrentCaptureTimestamp:");
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("exposureDuration"));
  -[ARImageData setExposureDuration:](v5, "setExposureDuration:");
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("exposureTargetOffset"));
  -[ARImageData setExposureTargetOffset:](v5, "setExposureTargetOffset:");
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("signalToNoiseRatio"));
  -[ARImageData setSignalToNoiseRatio:](v5, "setSignalToNoiseRatio:");
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("ISO"));
  -[ARImageData setISO:](v5, "setISO:");
  objc_opt_self();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("cameraParameters"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "focalLength");
    *(float *)&v11 = v11;
    *(_QWORD *)&v57 = LODWORD(v11);
    objc_msgSend(v10, "focalLength");
    v13 = v12;
    LODWORD(v12) = 0;
    *((float *)&v12 + 1) = v13;
    v56 = v12;
    objc_msgSend(v10, "principalPoint");
    *(float *)&v14 = v14;
    v55 = LODWORD(v14);
    objc_msgSend(v10, "principalPoint");
    *(float *)&v16 = v15;
    v17 = COERCE_DOUBLE(__PAIR64__(v16, v55));
    v18 = v5;
    v20 = v56;
    v19 = v57;
  }
  else
  {
    if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("cameraIntrinsics")))
    {
      objc_msgSend(v4, "decodeDataObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageData setCameraIntrinsics:](v5, "setCameraIntrinsics:", ARMatrix3x3FromNSData(v21));

      goto LABEL_10;
    }
    objc_msgSend(v4, "ar_decodeMatrix3x3ForKey:", CFSTR("cameraIntrinsics"));
    v18 = v5;
  }
  -[ARImageData setCameraIntrinsics:](v18, "setCameraIntrinsics:", v19, v20, v17);
LABEL_10:
  -[ARImageData setCameraPosition:](v5, "setCameraPosition:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cameraPosition")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cameraType"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARImageData setCameraType:](v5, "setCameraType:", v22);

  -[ARImageData setMirrored:](v5, "setMirrored:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pixelBufferIsMirrored")));
  -[ARImageData setLensType:](v5, "setLensType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("lensType")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("radialDistortion"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    v59 = 0u;
    v60 = 0u;
    objc_msgSend(v23, "getBytes:length:", &v59, 32);
    v58[0] = v59;
    v58[1] = v60;
    -[ARImageData setRadialDistortion:](v5, "setRadialDistortion:", v58);
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tangentialDistortion"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v59 = 0uLL;
    objc_msgSend(v25, "getBytes:length:", &v59, 16);
    -[ARImageData setTangentialDistortion:](v5, "setTangentialDistortion:", *(double *)&v59);
  }
  -[ARImageData setCaptureFramesPerSecond:](v5, "setCaptureFramesPerSecond:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("targetFramesPerSecond")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("captureDate"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARImageData setCaptureDate:](v5, "setCaptureDate:", v26);

  -[ARImageData setPixelBuffer:](v5, "setPixelBuffer:", 0);
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("temperature"));
  if (*(float *)&v27 == 0.0)
    *(float *)&v27 = 6500.0;
  -[ARImageData setTemperature:](v5, "setTemperature:", v27);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("faceData"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARImageData setFaceData:](v5, "setFaceData:", v28);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = v4;
    v5->_pixelBuffer = (__CVBuffer *)objc_msgSend(v29, "ar_decodePixelBufferForKey:", CFSTR("pixelBuffer"));
    v30 = objc_msgSend(v29, "ar_decodePixelBufferForKey:", CFSTR("visionData"));

    v5->_visionData = (__CVBuffer *)v30;
  }
  ARDepthRepresentationDictionaryClassList();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("AVDepthData"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B1A8]), "initWithPixelBuffer:depthMetadataDictionary:", 0, v32);
    -[ARImageData setDepthData:](v5, "setDepthData:", v33);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("depthDataTimeStamp"));
    v35 = v34;
    v36 = 0.0;
    if (v35 >= 0.0)
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("depthDataTimeStamp"), 0.0);
    -[ARImageData setDepthDataTimestamp:](v5, "setDepthDataTimestamp:", v36);
  }
  -[ARImageData setDeviceOrientation:](v5, "setDeviceOrientation:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("deviceOrientation")));
  -[ARImageData setSecondary:](v5, "setSecondary:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("secondary")));
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("visionTransform")))
  {
    objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", CFSTR("visionTransform"));
  }
  else
  {
    v37 = *MEMORY[0x1E0C83FF0];
    v38 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 16);
    v39 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 32);
    v40 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 48);
  }
  -[ARImageData setVisionTransform:](v5, "setVisionTransform:", *(double *)&v37, *(double *)&v38, *(double *)&v39, *(double *)&v40);
  v5->_highResolution = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("highResolution"));
  -[ARImageData setLatestUltraWideImage:](v5, "setLatestUltraWideImage:", 0);
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestampOfSynchronizedWideImageData"));
  -[ARImageData setTimestampOfSynchronizedWideImageData:](v5, "setTimestampOfSynchronizedWideImageData:");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pointCloud"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARImageData setPointCloud:](v5, "setPointCloud:", v41);

  v42 = (void *)MEMORY[0x1E0C99E60];
  v43 = objc_opt_class();
  v44 = objc_opt_class();
  v45 = objc_opt_class();
  objc_msgSend(v42, "setWithObjects:", v43, v44, v45, objc_opt_class(), 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v46, CFSTR("extrinsicsMap"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
    objc_storeStrong((id *)&v5->_extrinsicsMap, v47);
  v48 = (void *)MEMORY[0x1E0C99E60];
  v49 = objc_opt_class();
  v50 = objc_opt_class();
  v51 = objc_opt_class();
  objc_msgSend(v48, "setWithObjects:", v49, v50, v51, objc_opt_class(), 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v52, CFSTR("exifData"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
    objc_storeStrong((id *)&v5->_exifData, v53);

LABEL_30:
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CVBuffer *pixelBuffer;
  id v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "encodeDouble:forKey:", CFSTR("timestamp"), self->_timestamp);
  objc_msgSend(v15, "encodeDouble:forKey:", CFSTR("exposureDuration"), self->_exposureDuration);
  *(float *)&v4 = self->_exposureTargetOffset;
  objc_msgSend(v15, "encodeFloat:forKey:", CFSTR("exposureTargetOffset"), v4);
  *(float *)&v5 = self->_signalToNoiseRatio;
  objc_msgSend(v15, "encodeFloat:forKey:", CFSTR("signalToNoiseRatio"), v5);
  *(float *)&v6 = self->_ISO;
  objc_msgSend(v15, "encodeFloat:forKey:", CFSTR("ISO"), v6);
  *(float *)&v7 = self->_temperature;
  objc_msgSend(v15, "encodeFloat:forKey:", CFSTR("temperature"), v7);
  objc_msgSend(v15, "ar_encodeMatrix3x3:forKey:", CFSTR("cameraIntrinsics"), *(double *)self->_anon_120, *(double *)&self->_anon_120[16], *(double *)&self->_anon_120[32]);
  objc_msgSend(v15, "encodeInteger:forKey:", self->_cameraPosition, CFSTR("cameraPosition"));
  objc_msgSend(v15, "encodeObject:forKey:", self->_cameraType, CFSTR("cameraType"));
  objc_msgSend(v15, "encodeBool:forKey:", self->_mirrored, CFSTR("pixelBufferIsMirrored"));
  objc_msgSend(v15, "encodeInteger:forKey:", self->_lensType, CFSTR("lensType"));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", self->_radialDistortion, 32);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v8, CFSTR("radialDistortion"));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", self->_tangentialDistortion, 16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "encodeObject:forKey:", v9, CFSTR("tangentialDistortion"));
  objc_msgSend(v15, "encodeInteger:forKey:", self->_captureFramesPerSecond, CFSTR("targetFramesPerSecond"));
  objc_msgSend(v15, "encodeObject:forKey:", self->_captureDate, CFSTR("captureDate"));
  objc_msgSend(v15, "encodeObject:forKey:", self->_faceData, CFSTR("faceData"));
  -[ARImageData depthData](self, "depthData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ARImageData depthData](self, "depthData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ARDepthRepresentationDictionary(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      objc_msgSend(v15, "encodeObject:forKey:", v12, CFSTR("AVDepthData"));
    objc_msgSend(v15, "encodeDouble:forKey:", CFSTR("depthDataTimeStamp"), self->_depthDataTimestamp);

  }
  objc_msgSend(v15, "encodeInteger:forKey:", -[ARImageData deviceOrientation](self, "deviceOrientation"), CFSTR("deviceOrientation"));
  objc_msgSend(v15, "encodeBool:forKey:", -[ARImageData isSecondary](self, "isSecondary"), CFSTR("secondary"));
  objc_msgSend(v15, "ar_encodeMatrix4x4:forKey:", CFSTR("visionTransform"), *(double *)&self[1].super.isa, *(double *)&self[1]._temperature, self[1]._timestamp, self[1]._currentCaptureTimestamp);
  objc_msgSend(v15, "encodeBool:forKey:", -[ARImageData isHighResolution](self, "isHighResolution"), CFSTR("highResolution"));
  -[ARImageData timestampOfSynchronizedWideImageData](self, "timestampOfSynchronizedWideImageData");
  objc_msgSend(v15, "encodeDouble:forKey:", CFSTR("timestampOfSynchronizedWideImageData"));
  objc_msgSend(v15, "encodeObject:forKey:", self->_pointCloud, CFSTR("pointCloud"));
  objc_msgSend(v15, "encodeObject:forKey:", self->_extrinsicsMap, CFSTR("extrinsicsMap"));
  objc_msgSend(v15, "encodeObject:forKey:", self->_exifData, CFSTR("exifData"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    pixelBuffer = self->_pixelBuffer;
    v14 = v15;
    objc_msgSend(v14, "ar_encodePixelBuffer:forKey:", pixelBuffer, CFSTR("pixelBuffer"));
    objc_msgSend(v14, "ar_encodePixelBuffer:forKey:", self->_visionData, CFSTR("visionData"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", self->_anon_120, 48);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "encodeDataObject:", v14);
  }

}

- (ARImageData)initWithDictionary:(id)a3
{
  id v4;
  ARImageData *v5;
  const __CFDictionary *v6;
  Float64 Seconds;
  void *v8;
  __n128 v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  double v18;
  CMTime v20;
  CMTime v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[ARImageData init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CMSampleBufferPresentationTime"));
    v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    if (v6
      || (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OriginalTimestampWhenWrittenToFile")),
          (v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        memset(&v21, 0, sizeof(v21));
        CMTimeMakeFromDictionary(&v21, v6);
        v20 = v21;
        Seconds = CMTimeGetSeconds(&v20);
        v5->_timestamp = Seconds;
        v5->_currentCaptureTimestamp = Seconds;
      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CA2638]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v8
       || (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IntrinsicsMatrix")),
           (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v9 = ARMatrix3x3FromColumnMajorFlatArray(v8);
      *(_DWORD *)&v5->_anon_120[8] = v9.n128_u32[2];
      *(_DWORD *)&v5->_anon_120[24] = v10;
      *(_QWORD *)v5->_anon_120 = v9.n128_u64[0];
      *(_QWORD *)&v5->_anon_120[16] = v11;
      *(_DWORD *)&v5->_anon_120[40] = v12;
      *(_QWORD *)&v5->_anon_120[32] = v13;
    }
    else
    {
      _ARLogGeneral_3();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v21.value) = 138543618;
        *(CMTimeValue *)((char *)&v21.value + 4) = (CMTimeValue)v16;
        LOWORD(v21.flags) = 2048;
        *(_QWORD *)((char *)&v21.flags + 2) = v5;
        _os_log_impl(&dword_1B3A68000, v14, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Creating imageData without cameraIntrinsics", (uint8_t *)&v21, 0x16u);

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ExposureTime"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    v5->_exposureDuration = v18;

    v5->_deviceOrientation = 0;
    *(_WORD *)&v5->_secondary = 0;

  }
  return v5;
}

- (id)encodeToDictionary
{
  Float64 v3;
  const __CFAllocator *v4;
  CFDictionaryRef v5;
  __n128 v6;
  __n128 v7;
  __n128 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CMTime v14;
  CMTime v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  memset(&v15, 0, sizeof(v15));
  -[ARImageData timestamp](self, "timestamp");
  CMTimeMakeWithSeconds(&v15, v3, 1000000);
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v14 = v15;
  v5 = CMTimeCopyAsDictionary(&v14, v4);
  v17[0] = v5;
  v16[0] = CFSTR("CMSampleBufferPresentationTime");
  v16[1] = CFSTR("IntrinsicsMatrix");
  -[ARImageData cameraIntrinsics](self, "cameraIntrinsics");
  ARMatrix3x3ToColumnMajorFlatArray(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  v16[2] = CFSTR("ExposureTime");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[ARImageData exposureDuration](self, "exposureDuration");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithImageData:", self);
}

- (__n128)extrinsicMatrix4x4ToDeviceType:(uint64_t)a1
{
  void *v1;
  void *v2;
  __int128 v3;
  __int128 v5;

  objc_msgSend(*(id *)(a1 + 192), "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "matrix");
    v5 = v3;
  }
  else
  {
    v5 = *MEMORY[0x1E0C83FF0];
  }

  return (__n128)v5;
}

- (uint64_t)extrinsicMatrixToDeviceType:(void *)a1
{
  return ARMatrix4x3FromMatrix4x4(objc_msgSend(a1, "extrinsicMatrix4x4ToDeviceType:"));
}

- (void)addExtrinsicMatrix:(void *)a3 toDeviceType:
{
  id v4;

  v4 = a3;
  ARMatrix4x4FromMatrix4x3();
  objc_msgSend(a1, "addExtrinsicMatrix4x4:toDeviceType:", v4);

}

- (void)addExtrinsicMatrix4x4:(double)a3 toDeviceType:(double)a4
{
  id v8;
  ARExtrinsicsWrapper *v13;

  v8 = a7;
  v13 = -[ARExtrinsicsWrapper initWithMatrix:]([ARExtrinsicsWrapper alloc], "initWithMatrix:", a2, a3, a4, a5);
  objc_msgSend(*(id *)(a1 + 192), "setObject:forKeyedSubscript:", v13, v8);

}

- (NSDictionary)tracingEntry
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  OSType PixelFormatType;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  ARQATraceableDefaultEntryForResultData(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v15[0] = CFSTR("width");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[ARImageData imageResolution](self, "imageResolution");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = CFSTR("height");
  v16[0] = v6;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[ARImageData imageResolution](self, "imageResolution");
  objc_msgSend(v7, "numberWithDouble:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("imageResolution"));

  PixelFormatType = CVPixelBufferGetPixelFormatType(-[ARImageData pixelBuffer](self, "pixelBuffer"));
  AROSTypeToString(PixelFormatType);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("pixelBufferFormat"));

  -[ARImageData cameraIntrinsics](self, "cameraIntrinsics");
  +[ARQAHelper arrayWithMatrix3x3:](ARQAHelper, "arrayWithMatrix3x3:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("cameraIntrinsics"));

  return (NSDictionary *)v4;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (NSDate)captureDate
{
  return self->_captureDate;
}

- (void)setCaptureDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (double)currentCaptureTimestamp
{
  return self->_currentCaptureTimestamp;
}

- (void)setCurrentCaptureTimestamp:(double)a3
{
  self->_currentCaptureTimestamp = a3;
}

- (__n128)cameraIntrinsics
{
  return a1[18];
}

- (__n128)setCameraIntrinsics:(__n128)a3
{
  result[18] = a2;
  result[19] = a3;
  result[20] = a4;
  return result;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (BOOL)isMirrored
{
  return self->_mirrored;
}

- (void)setMirrored:(BOOL)a3
{
  self->_mirrored = a3;
}

- (void)setImageResolution:(CGSize)a3
{
  self->_imageResolution = a3;
}

- (unint64_t)lensType
{
  return self->_lensType;
}

- (void)setLensType:(unint64_t)a3
{
  self->_lensType = a3;
}

- (__n128)radialDistortion
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(a1 + 256);
  v3 = *(_OWORD *)(a1 + 272);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (void)setRadialDistortion:(ARImageData *)self
{
  _OWORD *v2;
  __int128 v3;

  v3 = v2[1];
  *(_OWORD *)self->_radialDistortion = *v2;
  *(_OWORD *)&self->_radialDistortion[16] = v3;
}

- (__n128)tangentialDistortion
{
  return a1[15];
}

- (void)setTangentialDistortion:(ARImageData *)self
{
  __int128 v2;

  *(_OWORD *)self->_tangentialDistortion = v2;
}

- (double)exposureDuration
{
  return self->_exposureDuration;
}

- (void)setExposureDuration:(double)a3
{
  self->_exposureDuration = a3;
}

- (float)exposureTargetOffset
{
  return self->_exposureTargetOffset;
}

- (void)setExposureTargetOffset:(float)a3
{
  self->_exposureTargetOffset = a3;
}

- (float)temperature
{
  return self->_temperature;
}

- (void)setTemperature:(float)a3
{
  self->_temperature = a3;
}

- (float)signalToNoiseRatio
{
  return self->_signalToNoiseRatio;
}

- (void)setSignalToNoiseRatio:(float)a3
{
  self->_signalToNoiseRatio = a3;
}

- (float)ISO
{
  return self->_ISO;
}

- (void)setISO:(float)a3
{
  self->_ISO = a3;
}

- (NSDictionary)exifData
{
  return self->_exifData;
}

- (void)setExifData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (int64_t)deviceOrientation
{
  return self->_deviceOrientation;
}

- (ARFaceData)faceData
{
  return self->_faceData;
}

- (void)setFaceData:(id)a3
{
  objc_storeStrong((id *)&self->_faceData, a3);
}

- (AVDepthData)depthData
{
  return self->_depthData;
}

- (void)setDepthData:(id)a3
{
  objc_storeStrong((id *)&self->_depthData, a3);
}

- (ARPointCloud)pointCloud
{
  return self->_pointCloud;
}

- (void)setPointCloud:(id)a3
{
  objc_storeStrong((id *)&self->_pointCloud, a3);
}

- (double)depthDataTimestamp
{
  return self->_depthDataTimestamp;
}

- (void)setDepthDataTimestamp:(double)a3
{
  self->_depthDataTimestamp = a3;
}

- (__CVBuffer)visionData
{
  return self->_visionData;
}

- (int64_t)cameraPosition
{
  return self->_cameraPosition;
}

- (void)setCameraPosition:(int64_t)a3
{
  self->_cameraPosition = a3;
}

- (NSString)cameraType
{
  return self->_cameraType;
}

- (void)setCameraType:(id)a3
{
  objc_storeStrong((id *)&self->_cameraType, a3);
}

- (AVCameraCalibrationData)calibrationData
{
  return self->_calibrationData;
}

- (void)setCalibrationData:(id)a3
{
  objc_storeStrong((id *)&self->_calibrationData, a3);
}

- (ADCameraCalibration)adCameraCalibration
{
  return self->_adCameraCalibration;
}

- (void)setAdCameraCalibration:(id)a3
{
  objc_storeStrong((id *)&self->_adCameraCalibration, a3);
}

- (int64_t)captureFramesPerSecond
{
  return self->_captureFramesPerSecond;
}

- (void)setCaptureFramesPerSecond:(int64_t)a3
{
  self->_captureFramesPerSecond = a3;
}

- (BOOL)isSecondary
{
  return self->_secondary;
}

- (void)setSecondary:(BOOL)a3
{
  self->_secondary = a3;
}

- (BOOL)isHighResolution
{
  return self->_highResolution;
}

- (void)setHighResolution:(BOOL)a3
{
  self->_highResolution = a3;
}

- (ARImageData)latestUltraWideImage
{
  return self->_latestUltraWideImage;
}

- (void)setLatestUltraWideImage:(id)a3
{
  objc_storeStrong((id *)&self->_latestUltraWideImage, a3);
}

- (__n128)visionTransform
{
  return a1[21];
}

- (__n128)setVisionTransform:(__n128)a3
{
  result[21] = a2;
  result[22] = a3;
  result[23] = a4;
  result[24] = a5;
  return result;
}

- (double)timestampOfSynchronizedWideImageData
{
  return self->_timestampOfSynchronizedWideImageData;
}

- (void)setTimestampOfSynchronizedWideImageData:(double)a3
{
  self->_timestampOfSynchronizedWideImageData = a3;
}

- (void)setExtrinsicsMap:(id)a3
{
  objc_storeStrong((id *)&self->_extrinsicsMap, a3);
}

- (NSDictionary)tiffData
{
  return self->_tiffData;
}

- (AVCaptureDevice)captureDevice
{
  return self->_captureDevice;
}

- (void)setCaptureDevice:(id)a3
{
  objc_storeStrong((id *)&self->_captureDevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureDevice, 0);
  objc_storeStrong((id *)&self->_tiffData, 0);
  objc_storeStrong((id *)&self->_extrinsicsMap, 0);
  objc_storeStrong((id *)&self->_latestUltraWideImage, 0);
  objc_storeStrong((id *)&self->_adCameraCalibration, 0);
  objc_storeStrong((id *)&self->_calibrationData, 0);
  objc_storeStrong((id *)&self->_cameraType, 0);
  objc_storeStrong((id *)&self->_pointCloud, 0);
  objc_storeStrong((id *)&self->_depthData, 0);
  objc_storeStrong((id *)&self->_faceData, 0);
  objc_storeStrong((id *)&self->_exifData, 0);
  objc_storeStrong((id *)&self->_captureDate, 0);
}

@end
