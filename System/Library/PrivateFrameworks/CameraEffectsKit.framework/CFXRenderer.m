@implementation CFXRenderer

+ (void)initialize
{
  if (initialize_onceToken_1 != -1)
    dispatch_once(&initialize_onceToken_1, &__block_literal_global_56);
}

void __25__CFXRenderer_initialize__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addSuiteNamed:", CFSTR("com.apple.avfoundation"));

}

+ (__CVBuffer)createBufferWith:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char *BaseAddress;
  double v11;
  uint64_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  int16x8_t v16;
  unsigned __int32 v17;
  void *v18;
  __CVBuffer *v19;
  const __CFString *v20;
  void *v21;
  __CVBuffer *v22;
  const __CFString *v23;
  void *v24;
  __CVBuffer *v25;
  const __CFString *v26;
  void *v27;
  __CVBuffer *v28;
  float64_t v30;
  float64_t v31;
  float64_t v32;
  float64_t v33;
  CVPixelBufferRef pixelBufferOut;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_24EE9BEA0, *MEMORY[0x24BDC56B8]);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDC5690]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", width);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDC5708]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BDC5650]);

  pixelBufferOut = 0;
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (unint64_t)width, (unint64_t)height, 0x20u, (CFDictionaryRef)v7, &pixelBufferOut);
  CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBufferOut);
  v11 = height * (double)CVPixelBufferGetBytesPerRow(pixelBufferOut);
  v32 = 0.0;
  v33 = 0.0;
  v30 = 0.0;
  v31 = 0.0;
  objc_msgSend(v6, "getRed:green:blue:alpha:", &v33, &v32, &v31, &v30);
  if (v11 > 0.0)
  {
    v12 = 0;
    v13.f64[0] = v30;
    v13.f64[1] = v33;
    v14.f64[0] = v32;
    v14.f64[1] = v31;
    v15 = (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL);
    v16 = (int16x8_t)vcvtq_s64_f64(vmulq_f64(v13, v15));
    *(int16x4_t *)v16.i8 = vuzp1_s16((int16x4_t)vmovn_s64((int64x2_t)v16), (int16x4_t)vmovn_s64(vcvtq_s64_f64(vmulq_f64(v14, v15))));
    v17 = vmovn_s16(v16).u32[0];
    do
    {
      *(_DWORD *)&BaseAddress[v12] = v17;
      v12 += 4;
    }
    while (v11 > (double)(int)v12);
  }
  CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
  objc_msgSend(MEMORY[0x24BE78FF8], "extendedSRGBColorSpace");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = pixelBufferOut;
  v20 = (const __CFString *)*MEMORY[0x24BDC5490];
  objc_msgSend(v18, "nclcTriplet");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  CVBufferSetAttachment(v19, v20, (CFTypeRef)objc_msgSend(v21, "colorPrimary"), kCVAttachmentMode_ShouldPropagate);

  v22 = pixelBufferOut;
  v23 = (const __CFString *)*MEMORY[0x24BDC5510];
  objc_msgSend(v18, "nclcTriplet");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  CVBufferSetAttachment(v22, v23, (CFTypeRef)objc_msgSend(v24, "transferFunction"), kCVAttachmentMode_ShouldPropagate);

  v25 = pixelBufferOut;
  v26 = (const __CFString *)*MEMORY[0x24BDC5570];
  objc_msgSend(v18, "nclcTriplet");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  CVBufferSetAttachment(v25, v26, (CFTypeRef)objc_msgSend(v27, "ycbcrMatrix"), kCVAttachmentMode_ShouldPropagate);

  v28 = pixelBufferOut;
  return v28;
}

- (CFXRenderer)initWithDelegate:(id)a3 captureMode:(int64_t)a4
{
  id v6;
  CFXRenderer *v7;
  CFXRenderer *v8;
  JTFrameRateCalculator *v9;
  JTFrameRateCalculator *fpsCalc;
  JFXAnimojiEffectRenderer *v11;
  JFXAnimojiEffectRenderer *animojiRenderer;
  uint64_t v13;
  UIColor *animojiBackgroundColor;
  void *v15;
  void *v16;
  uint64_t v17;
  PVLivePlayer *livePlayer;
  objc_class *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  JFXMetadataValidator *metadataValidator;
  PVLivePlayerCameraSource *v29;
  PVLivePlayerCameraSource *cameraSource;
  PVLivePlayer *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  objc_super v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v37.receiver = self;
  v37.super_class = (Class)CFXRenderer;
  v7 = -[CFXRenderer init](&v37, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    v8->_captureMode = a4;
    v9 = -[JTFrameRateCalculator initWithWindowSize:]([JTFrameRateCalculator alloc], "initWithWindowSize:", 1.0);
    fpsCalc = v8->_fpsCalc;
    v8->_fpsCalc = v9;

    if (+[JFXAnimojiEffectRenderer isSupported](JFXAnimojiEffectRenderer, "isSupported"))
    {
      +[JFXAnimojiEffectRenderer setupAVTMetalShaderCache](JFXAnimojiEffectRenderer, "setupAVTMetalShaderCache");
      v11 = -[JFXAnimojiEffectRenderer initWithConstrainedHeadPose:]([JFXAnimojiEffectRenderer alloc], "initWithConstrainedHeadPose:", a4 == 3);
      animojiRenderer = v8->_animojiRenderer;
      v8->_animojiRenderer = v11;

      -[JFXAnimojiEffectRenderer setAsynchronouslyLoadNewPuppets:](v8->_animojiRenderer, "setAsynchronouslyLoadNewPuppets:", 1);
      -[JFXAnimojiEffectRenderer setAllowAntialiasing:](v8->_animojiRenderer, "setAllowAntialiasing:", 1);
    }
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v13 = objc_claimAutoreleasedReturnValue();
    animojiBackgroundColor = v8->_animojiBackgroundColor;
    v8->_animojiBackgroundColor = (UIColor *)v13;

    -[CFXRenderer CFX_getPreviewColorSpace](v8, "CFX_getPreviewColorSpace");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = *MEMORY[0x24BE79640];
    v39[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(objc_alloc(MEMORY[0x24BE79078]), "initWithOptions:delegate:", v16, v8);
    livePlayer = v8->_livePlayer;
    v8->_livePlayer = (PVLivePlayer *)v17;

    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVLivePlayer setName:](v8->_livePlayer, "setName:", v20);

    if (isStreamingMode(a4))
    {
      v21 = objc_alloc_init(MEMORY[0x24BE790A0]);
      CreatePVLPThrottlingControlParameters();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setThermalLevel:controlParameters:", 0, v22);

      CreatePVLPThrottlingControlParameters();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setThermalLevel:controlParameters:", 10, v23);

      CreatePVLPThrottlingControlParameters();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setThermalLevel:controlParameters:", 20, v24);

      CreatePVLPThrottlingControlParameters();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setThermalLevel:controlParameters:", 30, v25);

      -[PVLivePlayer setThermalThrottlingPolicy:](v8->_livePlayer, "setThermalThrottlingPolicy:", v21);
    }
    +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_cameraMode = objc_msgSend(v26, "cameraMode");

    v27 = objc_opt_new();
    metadataValidator = v8->_metadataValidator;
    v8->_metadataValidator = (JFXMetadataValidator *)v27;

    v29 = (PVLivePlayerCameraSource *)objc_alloc_init(MEMORY[0x24BE79090]);
    cameraSource = v8->_cameraSource;
    v8->_cameraSource = v29;

    v31 = v8->_livePlayer;
    -[CFXRenderer cameraSource](v8, "cameraSource");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVLivePlayer setSource:inputID:](v31, "setSource:inputID:", v32, 0);

    v33 = objc_alloc(MEMORY[0x24BE79088]);
    -[CFXRenderer cameraSource](v8, "cameraSource");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v33, "initWithPlayerCameraSource:", v34);

    -[PVLivePlayer setRenderLink:](v8->_livePlayer, "setRenderLink:", v35);
    -[PVLivePlayer start](v8->_livePlayer, "start");

  }
  return v8;
}

- (void)setAnimojiBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_animojiBackgroundColor, a3);
}

- (void)dealloc
{
  JFXPixelRotationSession *pixelRotationSession;
  objc_super v4;

  -[CFXRenderer shutdown](self, "shutdown");
  pixelRotationSession = self->_pixelRotationSession;
  self->_pixelRotationSession = 0;

  v4.receiver = self;
  v4.super_class = (Class)CFXRenderer;
  -[CFXRenderer dealloc](&v4, sel_dealloc);
}

- (void)setTrackingLossDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CFXRenderer animojiRenderer](self, "animojiRenderer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTrackingLossDelegate:", v4);

}

- (void)resetMetadataValidation
{
  id v2;

  -[CFXRenderer metadataValidator](self, "metadataValidator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reset");

}

- (void)pause
{
  id v2;

  -[CFXRenderer livePlayer](self, "livePlayer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stop");

}

- (void)resume
{
  id v2;

  -[CFXRenderer livePlayer](self, "livePlayer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "start");

}

- (void)shutdown
{
  id v2;

  -[CFXRenderer livePlayer](self, "livePlayer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shutdown");

}

- (void)flush
{
  id v2;

  -[CFXRenderer livePlayer](self, "livePlayer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flush");

}

- (BOOL)livePlayerIsSaturated
{
  void *v2;
  BOOL v3;

  -[CFXRenderer livePlayer](self, "livePlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "status") == 2;

  return v3;
}

- (void)renderFrame:(id)a3 effectComposition:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id *v12;
  unsigned int v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  void *v21;
  uint64_t v22;
  CFXFrame *v23;
  CFXFrame *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  CFXFrame *v48;
  uint64_t v49;
  CFXFrame *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  _QWORD v60[2];
  uint8_t buf[16];
  uint64_t v62;
  __int128 v63;
  uint64_t v64;
  void *v65;
  void *v66;
  _QWORD v67[6];
  _QWORD v68[8];

  v68[6] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CFXRenderer CFX_PVFrameSetFromCFXFrame:](self, "CFX_PVFrameSetFromCFXFrame:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    v10 = *MEMORY[0x24BE79580];
    objc_msgSend(v8, "metadataObjectForKey:", *MEMORY[0x24BE79580]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "cameraPosition"))
    {
      v66 = v9;
      v12 = &v66;
      +[JFXPixelRotationSession rotateFrameSetToUIOrientation:pixelRotationSession:](JFXPixelRotationSession, "rotateFrameSetToUIOrientation:pixelRotationSession:", &v66, &self->_pixelRotationSession);
    }
    else
    {
      v13 = +[JFXOrientationMonitor deviceInterfaceOrientation](JFXOrientationMonitor, "deviceInterfaceOrientation");
      if (v13 > 4)
        v14 = 0;
      else
        v14 = dword_226AB7990[v13];
      v65 = v9;
      v12 = &v65;
      +[JFXPixelRotationSession rotateFrameSet:by:mirror:pixelRotationSession:](JFXPixelRotationSession, "rotateFrameSet:by:mirror:pixelRotationSession:", &v65, v14, 1, &self->_pixelRotationSession);
    }
    v15 = *v12;

    objc_msgSend(v15, "setMetadataObject:forKey:", v7, CFSTR("kEffectCompositionMetadataKey"));
    objc_msgSend(v7, "jtEffectsForType:", 7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[JFXPickerCameraSource sharedInstance](JFXPickerCameraSource, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isPickerPreviewing"))
    {
      v18 = objc_msgSend(v16, "count");

      if (v18)
      {
LABEL_12:
        v20 = JFXIsCTMCroppedCameraMode(-[CFXRenderer cameraMode](self, "cameraMode"));
        if (objc_msgSend(v7, "isEmpty") && !v20)
        {
          objc_msgSend(v15, "colorImageBuffer");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "cvPixelBuffer");
          v63 = 0uLL;
          v64 = 0;
          if (v6)
            objc_msgSend(v6, "timestamp");
          v23 = [CFXFrame alloc];
          *(_OWORD *)buf = v63;
          v62 = v64;
          v24 = -[CFXFrame initWithPixelBuffer:timestamp:](v23, "initWithPixelBuffer:timestamp:", v22, buf);
          -[CFXRenderer delegate](self, "delegate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_OWORD *)buf = v63;
          v62 = v64;
          objc_msgSend(v25, "renderer:didPrepareToRenderFrameAtPresentationTime:", self, buf);

          -[CFXRenderer delegate](self, "delegate");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "renderer:didRenderFrame:", self, v24);

          goto LABEL_36;
        }
        if (-[CFXRenderer captureMode](self, "captureMode") != 3)
        {
          -[CFXRenderer fpsCalc](self, "fpsCalc");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "log:", &__block_literal_global_34);

          -[CFXRenderer fpsCalc](self, "fpsCalc");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "tickFrameReceived");

          -[CFXRenderer cameraSource](self, "cameraSource");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "cameraFrameSetRecieved:", v15);

LABEL_36:
          goto LABEL_37;
        }
        v63 = 0uLL;
        v64 = 0;
        if (v6)
          objc_msgSend(v6, "timestamp");
        if (objc_msgSend(v16, "count"))
        {
          objc_msgSend(v16, "firstObject");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
          {
            objc_msgSend(v15, "metadataObjectForKey:", v10);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = objc_msgSend(v28, "interfaceOrientation");
            v29 = objc_msgSend(v28, "captureVideoOrientation");
            objc_msgSend(v15, "metadataDict");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "objectForKey:", CFSTR("PVFrameSetMetadataOriginalBufferSizeKey"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "CGSizeValue");
            v33 = v32;
            v35 = v34;

            objc_msgSend(v15, "metadataDict");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "objectForKey:", CFSTR("PVFrameSetMetadataARMetadataKey"));
            v37 = objc_claimAutoreleasedReturnValue();

            if (v37)
            {
              v38 = ((unint64_t)(v58 - 3) < 2) ^ ((unint64_t)(v29 - 5) < 0xFFFFFFFFFFFFFFFELL);
              if (v38)
                v39 = v35;
              else
                v39 = v33;
              if (v38)
                v40 = v33;
              else
                v40 = v35;
              v68[0] = v37;
              v67[0] = CFSTR("JFXAnimojiRendererMetadata_JFXARMetadata");
              v67[1] = CFSTR("JFXAnimojiRendererMetadata_RenderSize");
              v60[0] = v40;
              v60[1] = v39;
              objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v60, "{CGSize=dd}");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v68[1] = v56;
              v67[2] = CFSTR("JFXAnimojiRendererMetadata_AVCaptureVideoOrientation");
              v57 = v28;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v29);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              v68[2] = v55;
              v67[3] = CFSTR("JFXAnimojiRendererMetadata_UIInterfaceOrientation");
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v58);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v68[3] = v41;
              v67[4] = CFSTR("JFXAnimojiRendererMetadata_Effect");
              objc_msgSend(v16, "firstObject");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v68[4] = v42;
              v67[5] = CFSTR("JFXAnimojiRendererMetadata_BackgroundColor");
              -[CFXRenderer animojiBackgroundColor](self, "animojiBackgroundColor");
              v59 = (void *)v37;
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v68[5] = v43;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v68, v67, 6);
              v44 = (void *)objc_claimAutoreleasedReturnValue();

              -[CFXRenderer animojiRenderer](self, "animojiRenderer");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              *(_OWORD *)buf = v63;
              v62 = v64;
              objc_msgSend(v45, "renderWithTime:metadata:", buf, v44);
              v46 = objc_claimAutoreleasedReturnValue();

              if (v46)
              {
                -[CFXRenderer delegate](self, "delegate");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                *(_OWORD *)buf = v63;
                v62 = v64;
                objc_msgSend(v47, "renderer:didPrepareToRenderFrameAtPresentationTime:", self, buf);

                v48 = [CFXFrame alloc];
                v49 = -[NSObject cvPixelBuffer](v46, "cvPixelBuffer");
                *(_OWORD *)buf = v63;
                v62 = v64;
                v50 = -[CFXFrame initWithPixelBuffer:timestamp:](v48, "initWithPixelBuffer:timestamp:", v49, buf);
                -[CFXRenderer delegate](self, "delegate");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "renderer:didRenderFrame:", self, v50);

LABEL_35:
                goto LABEL_36;
              }
            }
            else
            {

            }
          }
        }
        JFXLog_animoji();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2269A9000, v46, OS_LOG_TYPE_DEFAULT, "Couldn't get a buffer at all, not even a solid background buffer", buf, 2u);
        }
        goto LABEL_35;
      }
      +[JFXPickerCameraSource sharedInstance](JFXPickerCameraSource, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "pickerSource");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "cameraFrameSetRecieved:", v15);

    }
    goto LABEL_12;
  }
LABEL_37:

}

- (void)willDropCameraFrame
{
  id v2;

  -[CFXRenderer cameraSource](self, "cameraSource");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraFrameSetDropped");

}

- (id)buildRenderRequest:(id)a3 time:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  JFXCapturePreviewProperties *v20;
  int64_t v21;
  uint64_t v22;
  JFXCapturePreviewRequestBuilder *v23;
  void *v24;
  JFXCapturePreviewRequestBuilder *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  __int128 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  _BYTE time[32];
  __int128 v50;
  __int128 v51;
  uint64_t v52;

  objc_msgSend(a3, "objectForKeyedSubscript:", &unk_24EE9BF30);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "presentationTimeStamp");
    *(_OWORD *)time = v51;
    *(_QWORD *)&time[16] = v52;
    CMTimeGetSeconds((CMTime *)time);
    kdebug_trace();
    -[CFXRenderer fpsCalc](self, "fpsCalc");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tickReceived");

    +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "renderSize");
    v11 = v10;
    v13 = v12;

    +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frameSize");
    v16 = v15;
    v18 = v17;

    objc_msgSend(v7, "metadataObjectForKey:", CFSTR("kEffectCompositionMetadataKey"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = [JFXCapturePreviewProperties alloc];
    v21 = -[CFXRenderer cameraMode](self, "cameraMode");
    *(_OWORD *)time = *(_OWORD *)&a4->var0;
    *(_QWORD *)&time[16] = a4->var3;
    v22 = -[JFXCapturePreviewProperties initWithCameraFrameSet:renderCameraMode:renderTime:renderOutputSize:frameSize:](v20, "initWithCameraFrameSet:renderCameraMode:renderTime:renderOutputSize:frameSize:", v7, v21, time, v11, v13, v16, v18);
    v23 = [JFXCapturePreviewRequestBuilder alloc];
    -[PVLivePlayer outputColorSpace](self->_livePlayer, "outputColorSpace");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)v22;
    v25 = -[JFXCapturePreviewRequestBuilder initWithPreviewProperties:outputColorSpace:](v23, "initWithPreviewProperties:outputColorSpace:", v22, v24);

    *(_OWORD *)time = *(_OWORD *)&a4->var0;
    *(_QWORD *)&time[16] = a4->var3;
    -[CFXRenderer CFX_JTEffectsFromCFXEffectComposition:forRenderTime:](self, "CFX_JTEffectsFromCFXEffectComposition:forRenderTime:", v19, time);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXRenderer animojiRenderer](self, "animojiRenderer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXRenderer metadataValidator](self, "metadataValidator");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[JFXPickerCameraSource sharedInstance](JFXPickerCameraSource, "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "isPickerPreviewing");
    v31 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)time = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&time[16] = v31;
    v50 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    -[JFXCapturePreviewRequestBuilder createPVRenderRequestUsingAnimojiRenderer:metadataValidator:additionalTransform:effectStack:animojiTapPoint:animojiUsesInterfaceOrientation:requestHandler:](v25, "createPVRenderRequestUsingAnimojiRenderer:metadataValidator:additionalTransform:effectStack:animojiTapPoint:animojiUsesInterfaceOrientation:requestHandler:", v27, v28, time, v26, v30, 1, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    -[CFXRenderer animojiRenderer](self, "animojiRenderer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      +[CFXEffectType effectTypeWithIdentifier:](CFXEffectType, "effectTypeWithIdentifier:", CFSTR("Animoji"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "hasEffectOfType:", v34))
      {
        objc_msgSend(v7, "metadataDict");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectForKey:", CFSTR("PVFrameSetMetadataARMetadataKey"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        -[CFXRenderer animojiRenderer](self, "animojiRenderer");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "trackingLossDelegate");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v36, "arFrame");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (v39)
        {

        }
        else if (objc_msgSend(v38, "shouldShowAnimojiFaceReticle"))
        {
          objc_msgSend(v38, "setupAnimojiFaceReticleForTrackingLoss");
          objc_msgSend(v38, "showAnimojiFaceReticleForTrackingLoss");
        }

      }
    }
    objc_msgSend(v7, "presentationTimeStamp");
    *(_OWORD *)time = v47;
    *(_QWORD *)&time[16] = v48;
    CMTimeGetSeconds((CMTime *)time);
    kdebug_trace();
    objc_msgSend(v7, "presentationTimeStamp");
    *(_OWORD *)time = v45;
    *(_QWORD *)&time[16] = v46;
    CMTimeGetSeconds((CMTime *)time);
    kdebug_trace();
    memset(time, 0, 24);
    objc_msgSend(v7, "presentationTimeStamp");
    -[CFXRenderer delegate](self, "delegate");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = *(_OWORD *)time;
    v44 = *(_QWORD *)&time[16];
    objc_msgSend(v40, "renderer:didPrepareToRenderFrameAtPresentationTime:", self, &v43);

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (void)renderRequestComplete:(id)a3 results:(id)a4 completedOutOfOrder:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  CFXFrame *v18;
  CFXFrame *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  __CVBuffer *v23;
  void *v24;
  CFXFrame *v25;
  CFXFrame *v26;
  void *v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  _QWORD v32[3];
  _QWORD v33[6];
  CMTime v34;
  CMTime time;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "userContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "presentationTimeStamp");
  else
    memset(&v34, 0, sizeof(v34));
  time = v34;
  CMTimeGetSeconds(&time);
  kdebug_trace();
  if (a5 || !objc_msgSend(v9, "count"))
  {
    -[CFXRenderer fpsCalc](self, "fpsCalc");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tickDropped");
    goto LABEL_26;
  }
  if (v11)
    objc_msgSend(v11, "presentationTimeStamp");
  else
    memset(&v33[3], 0, 24);
  time = *(CMTime *)&v33[3];
  CMTimeGetSeconds(&time);
  kdebug_trace();
  objc_msgSend(v11, "metadataObjectForKey:", CFSTR("kEffectCompositionMetadataKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMetadataObject:forKey:", 0, CFSTR("kEffectCompositionMetadataKey"));
  +[JFXPickerCameraSource sharedInstance](JFXPickerCameraSource, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "isPickerPreviewing"))
    goto LABEL_18;
  objc_msgSend(v12, "jtEffectsForType:", 7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    if ((unint64_t)objc_msgSend(v9, "count") >= 2)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "cvPixelBuffer");
      v18 = [CFXFrame alloc];
      if (v11)
        objc_msgSend(v11, "presentationTimeStamp");
      else
        memset(v33, 0, 24);
      v19 = -[CFXFrame initWithPixelBuffer:timestamp:](v18, "initWithPixelBuffer:timestamp:", v17, v33);
      -[CFXRenderer CFX_PVFrameSetFromCFXFrame:](self, "CFX_PVFrameSetFromCFXFrame:", v19);
      v20 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v20;
    }
    +[JFXPickerCameraSource sharedInstance](JFXPickerCameraSource, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pickerSource");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "cameraFrameSetRecieved:", v11);

LABEL_18:
  }
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (__CVBuffer *)objc_msgSend(v22, "cvPixelBuffer");
  objc_msgSend(v11, "colorImageBuffer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  CVBufferPropagateAttachments((CVBufferRef)objc_msgSend(v24, "cvPixelBuffer"), v23);

  v25 = [CFXFrame alloc];
  if (v11)
    objc_msgSend(v11, "presentationTimeStamp");
  else
    memset(v32, 0, sizeof(v32));
  v26 = -[CFXFrame initWithPixelBuffer:timestamp:](v25, "initWithPixelBuffer:timestamp:", v23, v32);
  if (v8)
  {
    objc_msgSend(v8, "time");
  }
  else
  {
    v30 = 0uLL;
    v31 = 0;
  }
  v28 = v30;
  v29 = v31;
  -[CFXFrame setRequestTime:](v26, "setRequestTime:", &v28);
  -[CFXRenderer delegate](self, "delegate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "renderer:didRenderFrame:", self, v26);

LABEL_26:
}

- (void)livePlayerDroppedFrame:(int)a3 sources:(id)a4 time:(id *)a5
{
  kdebug_trace();
}

- (id)CFX_PVFrameSetFromCFXFrame:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CMTime v11;
  __int128 v12;
  uint64_t v13;
  CMTime v14;
  __int128 v15;
  uint64_t v16;

  v3 = a3;
  objc_msgSend(v3, "pvFrameSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = objc_msgSend(v3, "pixelBuffer");
    if (v5
      || (objc_msgSend(v3, "arFrame"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v5 = objc_msgSend(v6, "capturedImage"),
          v6,
          v5))
    {
      objc_msgSend(MEMORY[0x24BE79030], "imageWithCVPixelBuffer:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0uLL;
      v16 = 0;
      if (v3)
        objc_msgSend(v3, "timestamp");
      memset(&v14, 0, sizeof(v14));
      +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      CMTimeMake(&v14, 1, objc_msgSend(v8, "timeScale"));

      v12 = v15;
      v13 = v16;
      v11 = v14;
      objc_msgSend(MEMORY[0x24BE78FF0], "sampleBufferWithPVImageBuffer:timestamp:frameDuration:", v7, &v12, &v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE79020]), "initWithColorBuffer:metadata:", v9, 0);

    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

- (id)CFX_JTEffectsFromCFXEffectComposition:(id)a3 forRenderTime:(id *)a4
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11;

  objc_msgSend(a3, "effects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __67__CFXRenderer_CFX_JTEffectsFromCFXEffectComposition_forRenderTime___block_invoke;
  v9[3] = &unk_24EE5B678;
  v11 = *a4;
  v7 = v6;
  v10 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  return v7;
}

void __67__CFXRenderer_CFX_JTEffectsFromCFXEffectComposition_forRenderTime___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _OWORD v7[3];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  CMTime time2;
  CMTime time1;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  objc_msgSend(a2, "jtEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "type") == 2)
  {
    v14 = 0u;
    v15 = 0u;
    v13 = 0u;
    objc_msgSend(v3, "renderEffect");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "effectRange");
    }
    else
    {
      v14 = 0u;
      v15 = 0u;
      v13 = 0u;
    }

    *(_OWORD *)&time1.value = v13;
    time1.epoch = v14;
    *(_OWORD *)&time2.value = CFXEffectPreviewStartAtNextRenderTime;
    time2.epoch = 0;
    if (!CMTimeCompare(&time1, &time2))
    {
      *(_QWORD *)&v14 = *(_QWORD *)(a1 + 56);
      v13 = *(_OWORD *)(a1 + 40);
      v9 = v14;
      v10 = v15;
      v8 = v13;
      objc_msgSend(v3, "renderEffect");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = v8;
      v7[1] = v9;
      v7[2] = v10;
      objc_msgSend(v6, "setEffectRange:", v7);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (id)CFX_getPreviewColorSpace
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "jfx_displayColorSpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x24BE78FF8];
  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "jfx_getColorSpaceFromCaptureColorSpace:", objc_msgSend(v5, "cameraColorSpace"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "jfx_recommendedDisplayColorSpaceForColorSpace:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE78FF8], "jfx_compareAndChooseLesserColorSpace:right:", v3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (UIColor)animojiBackgroundColor
{
  return self->_animojiBackgroundColor;
}

- (int64_t)captureMode
{
  return self->_captureMode;
}

- (void)setCaptureMode:(int64_t)a3
{
  self->_captureMode = a3;
}

- (int64_t)cameraMode
{
  return self->_cameraMode;
}

- (JFXPixelRotationSession)pixelRotationSession
{
  return self->_pixelRotationSession;
}

- (void)setPixelRotationSession:(id)a3
{
  objc_storeStrong((id *)&self->_pixelRotationSession, a3);
}

- (JFXMetadataValidator)metadataValidator
{
  return self->_metadataValidator;
}

- (void)setMetadataValidator:(id)a3
{
  objc_storeStrong((id *)&self->_metadataValidator, a3);
}

- (CFXRendererDelegate)delegate
{
  return (CFXRendererDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PVLivePlayer)livePlayer
{
  return self->_livePlayer;
}

- (void)setLivePlayer:(id)a3
{
  objc_storeStrong((id *)&self->_livePlayer, a3);
}

- (PVLivePlayerCameraSource)cameraSource
{
  return self->_cameraSource;
}

- (void)setCameraSource:(id)a3
{
  objc_storeStrong((id *)&self->_cameraSource, a3);
}

- (JFXAnimojiEffectRenderer)animojiRenderer
{
  return self->_animojiRenderer;
}

- (void)setAnimojiRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_animojiRenderer, a3);
}

- (JTFrameRateCalculator)fpsCalc
{
  return self->_fpsCalc;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fpsCalc, 0);
  objc_storeStrong((id *)&self->_animojiRenderer, 0);
  objc_storeStrong((id *)&self->_cameraSource, 0);
  objc_storeStrong((id *)&self->_livePlayer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_metadataValidator, 0);
  objc_storeStrong((id *)&self->_pixelRotationSession, 0);
  objc_storeStrong((id *)&self->_animojiBackgroundColor, 0);
}

@end
