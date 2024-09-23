@implementation ICDocCamPhotoCaptureDelegate

- (ICDocCamPhotoCaptureDelegate)initWithRequestedPhotoSettings:(id)a3 willCapturePhotoAnimation:(id)a4 completed:(id)a5
{
  id v8;
  id v9;
  id v10;
  ICDocCamPhotoCaptureDelegate *v11;
  ICDocCamPhotoCaptureDelegate *v12;
  id v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICDocCamPhotoCaptureDelegate;
  v11 = -[ICDocCamPhotoCaptureDelegate init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    -[ICDocCamPhotoCaptureDelegate setRequestedPhotoSettings:](v11, "setRequestedPhotoSettings:", v8);
    -[ICDocCamPhotoCaptureDelegate setWillCapturePhotoAnimation:](v12, "setWillCapturePhotoAnimation:", v9);
    -[ICDocCamPhotoCaptureDelegate setCompleted:](v12, "setCompleted:", v10);
    v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[ICDocCamPhotoCaptureDelegate setImageAttributes:](v12, "setImageAttributes:", v13);

  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_pbRef);
  self->_pbRef = 0;
  v3.receiver = self;
  v3.super_class = (Class)ICDocCamPhotoCaptureDelegate;
  -[ICDocCamPhotoCaptureDelegate dealloc](&v3, sel_dealloc);
}

- (void)didFinish
{
  void (**v3)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  __CVBuffer *v4;
  void *v5;
  void *v6;

  -[ICDocCamPhotoCaptureDelegate completed](self, "completed");
  v3 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v4 = -[ICDocCamPhotoCaptureDelegate pbRef](self, "pbRef");
  -[ICDocCamPhotoCaptureDelegate metaData](self, "metaData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamPhotoCaptureDelegate imageAttributes](self, "imageAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, ICDocCamPhotoCaptureDelegate *, __CVBuffer *, void *, void *))v3)[2](v3, self, v4, v5, v6);

  -[ICDocCamPhotoCaptureDelegate setRequestedPhotoSettings:](self, "setRequestedPhotoSettings:", 0);
  -[ICDocCamPhotoCaptureDelegate setPbRef:](self, "setPbRef:", 0);
}

- (void)setPbRef:(__CVBuffer *)a3
{
  __CVBuffer *pbRef;

  pbRef = self->_pbRef;
  if (pbRef != a3)
  {
    CVPixelBufferRelease(pbRef);
    self->_pbRef = CVPixelBufferRetain(a3);
  }
}

- (void)captureOutput:(id)a3 willBeginCaptureForResolvedSettings:(id)a4
{
  double v4;

  LODWORD(v4) = -8388609;
  -[ICDocCamPhotoCaptureDelegate setHighestSharpness:](self, "setHighestSharpness:", a3, a4, v4);
}

- (void)captureOutput:(id)a3 willCapturePhotoForResolvedSettings:(id)a4
{
  void (**v4)(void);

  -[ICDocCamPhotoCaptureDelegate willCapturePhotoAnimation](self, "willCapturePhotoAnimation", a3, a4);
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v4[2]();

}

- (void)captureOutput:(id)a3 didFinishProcessingPhoto:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  __CVBuffer *v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  float v24;
  NSObject *v25;
  void *v26;
  float v27;
  float v28;
  float v29;
  CFDictionaryRef v30;
  double v31;
  float v32;
  float v33;
  NSObject *v34;
  void *v35;
  void *v36;
  CFDictionaryRef v37;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v11 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ICDocCamPhotoCaptureDelegate captureOutput:didFinishProcessingPhoto:error:].cold.3((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);

    goto LABEL_5;
  }
  v18 = objc_retainAutorelease(v9);
  v19 = (__CVBuffer *)objc_msgSend(v18, "pixelBuffer");
  -[ICDocCamPhotoCaptureDelegate requestedPhotoSettings](self, "requestedPhotoSettings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v20, "isConstantColorEnabled") & 1) != 0)
  {
    -[ICDocCamPhotoCaptureDelegate requestedPhotoSettings](self, "requestedPhotoSettings");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "isConstantColorFallbackPhotoDeliveryEnabled"))
      v22 = objc_msgSend(v8, "isFlashScene");
    else
      v22 = 0;

    v23 = objc_msgSend(v18, "isConstantColorFallbackPhoto");
    if (v22)
    {
      if (v23)
      {
        if (-[ICDocCamPhotoCaptureDelegate constantColorDeliveredOriginalPhoto](self, "constantColorDeliveredOriginalPhoto"))
        {
          -[ICDocCamPhotoCaptureDelegate constantColorCenterWeightedMeanConfidenceLevel](self, "constantColorCenterWeightedMeanConfidenceLevel");
          if (v24 >= 0.9)
          {
            v25 = os_log_create("com.apple.documentcamera", ");
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
              -[ICDocCamPhotoCaptureDelegate captureOutput:didFinishProcessingPhoto:error:].cold.1(self);

            v19 = -[ICDocCamPhotoCaptureDelegate pbRef](self, "pbRef");
            -[ICDocCamPhotoCaptureDelegate imageAttributes](self, "imageAttributes");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("constantColorPhoto"));

          }
        }
        -[ICDocCamPhotoCaptureDelegate setConstantColorDeliveredFallBackPhoto:](self, "setConstantColorDeliveredFallBackPhoto:", 1);
      }
      else
      {
        if (-[ICDocCamPhotoCaptureDelegate constantColorDeliveredFallBackPhoto](self, "constantColorDeliveredFallBackPhoto"))
        {
          objc_msgSend(v18, "constantColorCenterWeightedMeanConfidenceLevel");
          v33 = v32;
          if (v32 < 0.9)
          {
            v34 = os_log_create("com.apple.documentcamera", ");
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              -[ICDocCamPhotoCaptureDelegate captureOutput:didFinishProcessingPhoto:error:].cold.2(v18);

            v19 = -[ICDocCamPhotoCaptureDelegate pbRef](self, "pbRef");
          }
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v33 >= 0.9);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICDocCamPhotoCaptureDelegate imageAttributes](self, "imageAttributes");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setObject:forKeyedSubscript:", v35, CFSTR("constantColorPhoto"));

        }
        objc_msgSend(v18, "constantColorCenterWeightedMeanConfidenceLevel");
        -[ICDocCamPhotoCaptureDelegate setConstantColorCenterWeightedMeanConfidenceLevel:](self, "setConstantColorCenterWeightedMeanConfidenceLevel:");
        -[ICDocCamPhotoCaptureDelegate setConstantColorDeliveredOriginalPhoto:](self, "setConstantColorDeliveredOriginalPhoto:", 1);
      }
      -[ICDocCamPhotoCaptureDelegate sharpnessForImageBuffer:](self, "sharpnessForImageBuffer:", v19);
      -[ICDocCamPhotoCaptureDelegate setPbRef:](self, "setPbRef:", v19);
      v37 = CMCopyDictionaryOfAttachments(0, v19, 1u);
      -[ICDocCamPhotoCaptureDelegate setMetaData:](self, "setMetaData:", v37);

      goto LABEL_5;
    }
  }
  else
  {

    objc_msgSend(v18, "isConstantColorFallbackPhoto");
  }
  -[ICDocCamPhotoCaptureDelegate sharpnessForImageBuffer:](self, "sharpnessForImageBuffer:", v19);
  v28 = v27;
  -[ICDocCamPhotoCaptureDelegate highestSharpness](self, "highestSharpness");
  if (v28 > v29)
  {
    -[ICDocCamPhotoCaptureDelegate setPbRef:](self, "setPbRef:", v19);
    v30 = CMCopyDictionaryOfAttachments(0, v19, 1u);
    -[ICDocCamPhotoCaptureDelegate setMetaData:](self, "setMetaData:", v30);

    *(float *)&v31 = v28;
    -[ICDocCamPhotoCaptureDelegate setHighestSharpness:](self, "setHighestSharpness:", v31);
  }
LABEL_5:

}

- (void)captureOutput:(id)a3 didFinishProcessingLivePhotoToMovieFileAtURL:(id)a4 duration:(id *)a5 photoDisplayTime:(id *)a6 resolvedSettings:(id)a7 error:(id)a8
{
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v8 = a8;
  if (v8)
  {
    v9 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ICDocCamPhotoCaptureDelegate captureOutput:didFinishProcessingLivePhotoToMovieFileAtURL:duration:photoDisplayTime:resolvedSettings:error:].cold.1((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);

  }
}

- (void)captureOutput:(id)a3 didFinishCaptureForResolvedSettings:(id)a4 error:(id)a5
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = a5;
  if (v6)
  {
    v7 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ICDocCamPhotoCaptureDelegate captureOutput:didFinishProcessingPhoto:error:].cold.3((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

  }
  -[ICDocCamPhotoCaptureDelegate didFinish](self, "didFinish");

}

- (float)sharpnessForImageBuffer:(__CVBuffer *)a3
{
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  vDSP_Length v6;
  void *BaseAddressOfPlane;
  size_t BytesPerRowOfPlane;
  float *v9;
  float *v10;
  NSObject *v11;
  uint64_t __StandardDeviation;
  vImage_Buffer src;
  vImage_Buffer dest;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
  v6 = HeightOfPlane * WidthOfPlane;
  BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  src.data = BaseAddressOfPlane;
  src.height = HeightOfPlane;
  src.width = WidthOfPlane;
  src.rowBytes = BytesPerRowOfPlane;
  v9 = (float *)malloc_type_calloc(HeightOfPlane * WidthOfPlane, 4uLL, 0x100004052888210uLL);
  __StandardDeviation = 0;
  if (v9)
  {
    v10 = v9;
    if (BytesPerRowOfPlane == WidthOfPlane)
    {
      vDSP_vfltu8((const unsigned __int8 *)BaseAddressOfPlane, 1, v9, 1, v6);
    }
    else
    {
      dest.data = v9;
      dest.height = HeightOfPlane;
      dest.width = WidthOfPlane;
      dest.rowBytes = 4 * WidthOfPlane;
      vImageConvert_Planar8toPlanarF(&src, &dest, 0.0, 255.0, 0);
    }
    v20 = -1082130432;
    v16 = xmmword_20CF1B208;
    v17 = unk_20CF1B218;
    v18 = xmmword_20CF1B228;
    v19 = unk_20CF1B238;
    dest = *(vImage_Buffer *)ymmword_20CF1B1E8;
    vDSP_f5x5(v10, HeightOfPlane, WidthOfPlane, (const float *)&dest, v10);
    vDSP_normalize(v10, 1, 0, 1, (float *)&__StandardDeviation + 1, (float *)&__StandardDeviation, v6);
    free(v10);
  }
  else
  {
    v11 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ICDocCamPhotoCaptureDelegate sharpnessForImageBuffer:].cold.1(v11);

  }
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  return *(float *)&__StandardDeviation;
}

- (AVCapturePhotoSettings)requestedPhotoSettings
{
  return self->_requestedPhotoSettings;
}

- (void)setRequestedPhotoSettings:(id)a3
{
  objc_storeStrong((id *)&self->_requestedPhotoSettings, a3);
}

- (NSDictionary)metaData
{
  return self->_metaData;
}

- (void)setMetaData:(id)a3
{
  objc_storeStrong((id *)&self->_metaData, a3);
}

- (__CVBuffer)pbRef
{
  return self->_pbRef;
}

- (float)highestSharpness
{
  return self->_highestSharpness;
}

- (void)setHighestSharpness:(float)a3
{
  self->_highestSharpness = a3;
}

- (NSMutableDictionary)imageAttributes
{
  return self->_imageAttributes;
}

- (void)setImageAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_imageAttributes, a3);
}

- (float)constantColorCenterWeightedMeanConfidenceLevel
{
  return self->_constantColorCenterWeightedMeanConfidenceLevel;
}

- (void)setConstantColorCenterWeightedMeanConfidenceLevel:(float)a3
{
  self->_constantColorCenterWeightedMeanConfidenceLevel = a3;
}

- (BOOL)constantColorDeliveredFallBackPhoto
{
  return self->_constantColorDeliveredFallBackPhoto;
}

- (void)setConstantColorDeliveredFallBackPhoto:(BOOL)a3
{
  self->_constantColorDeliveredFallBackPhoto = a3;
}

- (BOOL)constantColorDeliveredOriginalPhoto
{
  return self->_constantColorDeliveredOriginalPhoto;
}

- (void)setConstantColorDeliveredOriginalPhoto:(BOOL)a3
{
  self->_constantColorDeliveredOriginalPhoto = a3;
}

- (id)willCapturePhotoAnimation
{
  return self->_willCapturePhotoAnimation;
}

- (void)setWillCapturePhotoAnimation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)completed
{
  return self->_completed;
}

- (void)setCompleted:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completed, 0);
  objc_storeStrong(&self->_willCapturePhotoAnimation, 0);
  objc_storeStrong((id *)&self->_imageAttributes, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_requestedPhotoSettings, 0);
}

- (void)captureOutput:(void *)a1 didFinishProcessingPhoto:error:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "constantColorCenterWeightedMeanConfidenceLevel");
  OUTLINED_FUNCTION_1_1(&dword_20CE8E000, v1, v2, "captureOutput:didFinishProcessingPhoto: using original capture since it met the minimum confidence level (got %f)", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_3();
}

- (void)captureOutput:(void *)a1 didFinishProcessingPhoto:error:.cold.2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "constantColorCenterWeightedMeanConfidenceLevel");
  OUTLINED_FUNCTION_1_1(&dword_20CE8E000, v1, v2, "captureOutput:didFinishProcessingPhoto: ignoring constant color original capture since it didn't meet the minimum confidence level (got %f)", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_3();
}

- (void)captureOutput:(uint64_t)a3 didFinishProcessingPhoto:(uint64_t)a4 error:(uint64_t)a5 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20CE8E000, a2, a3, "Error capturing photo: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)captureOutput:(uint64_t)a3 didFinishProcessingLivePhotoToMovieFileAtURL:(uint64_t)a4 duration:(uint64_t)a5 photoDisplayTime:(uint64_t)a6 resolvedSettings:(uint64_t)a7 error:(uint64_t)a8 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20CE8E000, a2, a3, "Error processing live photo companion movie: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)sharpnessForImageBuffer:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20CE8E000, log, OS_LOG_TYPE_ERROR, "sharpnessForImageBuffer unable to allocate floatPixels", v1, 2u);
}

@end
