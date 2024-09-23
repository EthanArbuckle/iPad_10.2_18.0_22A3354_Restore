@implementation CRCameraReader

+ (unint64_t)supportedCameraCount
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDB2468];
  v3 = *MEMORY[0x24BDB1A50];
  v9[0] = *MEMORY[0x24BDB1A58];
  v9[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "discoverySessionWithDeviceTypes:mediaType:position:", v4, *MEMORY[0x24BDB1D50], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "devices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  return v7;
}

+ (void)loadFonts
{
  if (+[CRCameraReader loadFonts]::onceToken != -1)
    dispatch_once(&+[CRCameraReader loadFonts]::onceToken, &__block_literal_global_1);
}

void __27__CRCameraReader_loadFonts__block_invoke()
{
  void *v0;
  void *v1;
  const __CFURL *v2;
  void *v3;
  void *v4;
  const __CFURL *v5;
  CFErrorRef error;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CoreRecognition"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "resourceURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLByAppendingPathComponent:", CFSTR("Fonts/Scancardium_2.0.ttf"));
  v2 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

  error = 0;
  CTFontManagerRegisterFontsForURL(v2, kCTFontManagerScopeProcess, &error);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CoreRecognition"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resourceURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("Fonts/Spendcardium.ttf"));
  v5 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

  CTFontManagerRegisterFontsForURL(v5, kCTFontManagerScopeProcess, &error);
}

- (CRCameraReader)initWithOptions:(id)a3
{
  return -[CRCameraReader initWithNibName:bundle:options:](self, "initWithNibName:bundle:options:", 0, 0, a3);
}

- (CRCameraReader)init
{
  return -[CRCameraReader initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
}

- (CRCameraReader)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[CRCameraReader initWithNibName:bundle:options:](self, "initWithNibName:bundle:options:", 0, 0, 0);
}

- (CRCameraReader)initWithNibName:(id)a3 bundle:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  CRCameraReader *v12;
  void *v13;
  void *v14;
  int v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  dispatch_semaphore_t v22;
  double v23;
  dispatch_queue_t v24;
  dispatch_queue_t v25;
  uint64_t v26;
  UIColor *maskColor;
  uint64_t v28;
  UIColor *maskOutlineColor;
  uint64_t v30;
  UIColor *placementTextColor;
  uint64_t v32;
  UIColor *capturedTextColor;
  void *v34;
  objc_super v36;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  -[CRCameraReader setOptionsDictionary:](self, "setOptionsDictionary:", v11);

  objc_msgSend((id)objc_opt_class(), "loadFonts");
  v36.receiver = self;
  v36.super_class = (Class)CRCameraReader;
  v12 = -[CRCameraReader initWithNibName:bundle:](&v36, sel_initWithNibName_bundle_, v8, v9);
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCameraReader setConfigPresentCentered:](v12, "setConfigPresentCentered:", objc_msgSend(v13, "BOOLForKey:", CFSTR("com.apple.CoreRecognition.RedeemerPresentCentered")));

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLForKey:", CFSTR("com.apple.CoreRecognition.RedeemerDemoMode"));
    v16 = 1.0;
    if (v15)
      v16 = 0.25;
    -[CRCameraReader setConfigDemoSpeed:](v12, "setConfigDemoSpeed:", v16);

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCameraReader setConfigUseFastScanning:](v12, "setConfigUseFastScanning:", objc_msgSend(v17, "BOOLForKey:", CFSTR("com.apple.CoreRecognition.UseFastScanning")));

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCameraReader setConfigUseJPEGForColor:](v12, "setConfigUseJPEGForColor:", objc_msgSend(v18, "BOOLForKey:", CFSTR("com.apple.CoreRecognition.useJPEGForColor")));

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCameraReader setShowDiagnosticHUD:](v12, "setShowDiagnosticHUD:", objc_msgSend(v19, "BOOLForKey:", CFSTR("com.apple.CoreRecognition.showDiagnosticHUD")));

    -[CRCameraReader setCaptureCount:](v12, "setCaptureCount:", 1);
    objc_msgSend(MEMORY[0x24BDD1748], "weakObjectsPointerArray");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCameraReader setCaptureBuffer:](v12, "setCaptureBuffer:", v20);

    -[CRCameraReader setSessionTimeout:](v12, "setSessionTimeout:", INFINITY);
    -[CRCameraReader setWhiteBalanceMode:](v12, "setWhiteBalanceMode:", 2);
    -[CRCameraReader setFocusMode:](v12, "setFocusMode:", 2);
    -[CRCameraReader setExposureMode:](v12, "setExposureMode:", 2);
    -[CRCameraReader setTorchMode:](v12, "setTorchMode:", 0);
    -[CRCameraReader setCameraMode:](v12, "setCameraMode:", *MEMORY[0x24BDB1B18]);
    -[CRCameraReader setHidePlacementText:](v12, "setHidePlacementText:", 0);
    -[CRCameraReader setEnableAltIDCardScan:](v12, "setEnableAltIDCardScan:", 0);
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCameraReader setCameraPosition:](v12, "setCameraPosition:", objc_msgSend(v21, "userInterfaceIdiom") == 1);

    v22 = dispatch_semaphore_create(1);
    -[CRCameraReader setProcessingImage:](v12, "setProcessingImage:", v22);

    -[CRCameraReader setLastBuffer:](v12, "setLastBuffer:", 0);
    LODWORD(v23) = 1036831949;
    -[CRCameraReader setBorderPaddingIDCard:](v12, "setBorderPaddingIDCard:", v23);
    v24 = dispatch_queue_create("com.apple.CoreRecognition.processingQueue", 0);
    -[CRCameraReader setProcessingQueue:](v12, "setProcessingQueue:", v24);

    v25 = dispatch_queue_create("com.apple.CoreRecognition.callbackQueue", 0);
    -[CRCameraReader setDelegateQueue:](v12, "setDelegateQueue:", v25);

    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.3);
    v26 = objc_claimAutoreleasedReturnValue();
    maskColor = v12->_maskColor;
    v12->_maskColor = (UIColor *)v26;

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v28 = objc_claimAutoreleasedReturnValue();
    maskOutlineColor = v12->_maskOutlineColor;
    v12->_maskOutlineColor = (UIColor *)v28;

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v30 = objc_claimAutoreleasedReturnValue();
    placementTextColor = v12->_placementTextColor;
    v12->_placementTextColor = (UIColor *)v30;

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v32 = objc_claimAutoreleasedReturnValue();
    capturedTextColor = v12->_capturedTextColor;
    v12->_capturedTextColor = (UIColor *)v32;

    -[CRCameraReader alignmentLayer](v12, "alignmentLayer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "propogateMaskColor:outlineColor:placementTextColor:capturedTextColor:", v12->_maskColor, v12->_maskOutlineColor, v12->_placementTextColor, v12->_capturedTextColor);

  }
  return v12;
}

- (void)setMaskColor:(id)a3
{
  UIColor *v4;
  UIColor *maskColor;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (UIColor *)objc_msgSend(v7, "copy");
  maskColor = self->_maskColor;
  self->_maskColor = v4;

  if (-[CRCameraReader isViewLoaded](self, "isViewLoaded"))
  {
    -[CRCameraReader alignmentLayer](self, "alignmentLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "propogateMaskColor:outlineColor:placementTextColor:capturedTextColor:", self->_maskColor, self->_maskOutlineColor, self->_placementTextColor, self->_capturedTextColor);

  }
}

- (void)setMaskOutlineColor:(id)a3
{
  UIColor *v4;
  UIColor *maskOutlineColor;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (UIColor *)objc_msgSend(v7, "copy");
  maskOutlineColor = self->_maskOutlineColor;
  self->_maskOutlineColor = v4;

  if (-[CRCameraReader isViewLoaded](self, "isViewLoaded"))
  {
    -[CRCameraReader alignmentLayer](self, "alignmentLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "propogateMaskColor:outlineColor:placementTextColor:capturedTextColor:", self->_maskColor, self->_maskOutlineColor, self->_placementTextColor, self->_capturedTextColor);

  }
}

- (void)aetPlacementTextColor:(id)a3
{
  UIColor *v4;
  UIColor *placementTextColor;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (UIColor *)objc_msgSend(v7, "copy");
  placementTextColor = self->_placementTextColor;
  self->_placementTextColor = v4;

  if (-[CRCameraReader isViewLoaded](self, "isViewLoaded"))
  {
    -[CRCameraReader alignmentLayer](self, "alignmentLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "propogateMaskColor:outlineColor:placementTextColor:capturedTextColor:", self->_maskColor, self->_maskOutlineColor, self->_placementTextColor, self->_capturedTextColor);

  }
}

- (void)setCapturedTextColor:(id)a3
{
  UIColor *v4;
  UIColor *capturedTextColor;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (UIColor *)objc_msgSend(v7, "copy");
  capturedTextColor = self->_capturedTextColor;
  self->_capturedTextColor = v4;

  if (-[CRCameraReader isViewLoaded](self, "isViewLoaded"))
  {
    -[CRCameraReader alignmentLayer](self, "alignmentLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "propogateMaskColor:outlineColor:placementTextColor:capturedTextColor:", self->_maskColor, self->_maskOutlineColor, self->_placementTextColor, self->_capturedTextColor);

  }
}

- (void)orientationDidChange:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __39__CRCameraReader_orientationDidChange___block_invoke;
  v3[3] = &unk_24C58B768;
  v3[4] = self;
  cr_dispatch_async(MEMORY[0x24BDAC9B8], (uint64_t)v3);
}

uint64_t __39__CRCameraReader_orientationDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "viewDidLayoutSubviews");
}

- (__CVBuffer)createFastAccessPixelBufferWithSize:(CGSize)a3 videoFormat:(int)a4
{
  FigCreatePixelBufferAttributesWithIOSurfaceSupport();
  FigCreateIOSurfaceBackedCVPixelBufferWithAttributes();
  CFRelease(0);
  return 0;
}

- (void)loadView
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CRDefaultCaptureSessionManager *v11;
  CRDefaultCaptureSessionManager *v12;
  void *v13;
  void *v14;
  int64_t v15;
  void *v16;
  int64_t v17;
  void *v18;
  int64_t v19;
  void *v20;
  int64_t v21;
  void *v22;
  int64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  _QWORD *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  _QWORD v67[5];
  _OWORD v68[5];
  uint64_t v69;
  unint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;

  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachNewContextToCurrentThreadWithCameraReader:", self);

  v4 = objc_alloc(MEMORY[0x24BDF6F90]);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v6 = (void *)objc_msgSend(v4, "initWithFrame:");
  -[CRCameraReader setView:](self, "setView:", v6);

  +[CRColor blackColor](CRColor, "blackColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCameraReader view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v7);

  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allowOverrideWithKey:forResultFromBlock:", CFSTR("kCROverrideCaptureSessionManager"), &__block_literal_global_62);
    v11 = (CRDefaultCaptureSessionManager *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = objc_alloc_init(CRDefaultCaptureSessionManager);
    v10 = v11;
  }
  v12 = v11;
  -[CRCameraReader setSessionManager:](self, "setSessionManager:", v11);
  if (v9)

  -[CRCameraReader sessionManager](self, "sessionManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCaptureSessionDelegate:", self);

  -[CRCameraReader sessionManager](self, "sessionManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCaptureSessionMetadataDelegate:", self);

  v15 = -[CRCameraReader cameraPosition](self, "cameraPosition");
  -[CRCameraReader sessionManager](self, "sessionManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCameraPosition:", v15);

  v17 = -[CRCameraReader whiteBalanceMode](self, "whiteBalanceMode");
  -[CRCameraReader sessionManager](self, "sessionManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWhiteBalanceMode:", v17);

  v19 = -[CRCameraReader focusMode](self, "focusMode");
  -[CRCameraReader sessionManager](self, "sessionManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFocusMode:", v19);

  v21 = -[CRCameraReader exposureMode](self, "exposureMode");
  -[CRCameraReader sessionManager](self, "sessionManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setExposureMode:", v21);

  v23 = -[CRCameraReader torchMode](self, "torchMode");
  -[CRCameraReader sessionManager](self, "sessionManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTorchMode:", v23);

  v25 = (void *)MEMORY[0x24BDBCF20];
  -[CRCameraReader outputObjectTypes](self, "outputObjectTypes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setWithArray:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = objc_msgSend(v27, "containsObject:", CFSTR("CROutputTypeQRCode"));
  -[CRCameraReader sessionManager](self, "sessionManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setEnableMetadataOutput:", v28);

  if ((objc_msgSend(v27, "containsObject:", CFSTR("CROutputTypeQRCode")) & 1) != 0
    || objc_msgSend(v27, "containsObject:", CFSTR("CROutputTypeHomeKitCode")))
  {
    -[CRCameraReader sessionManager](self, "sessionManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setTargetFocusDistance:", 140);
  }
  else
  {
    -[CRCameraReader sessionManager](self, "sessionManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setTargetFocusDistance:", 160);
  }

  -[CRCameraReader cameraMode](self, "cameraMode");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCameraReader sessionManager](self, "sessionManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setCameraMode:", v31);

  v33 = objc_msgSend(v27, "containsObject:", CFSTR("CROutputTypeiTunesCode"));
  v34 = (_QWORD *)MEMORY[0x24BDB1B40];
  if ((v33 & 1) == 0 && (objc_msgSend(v27, "containsObject:", CFSTR("CROutputTypeHomeKitCode")) & 1) == 0)
  {
    -[CRCameraReader sessionManager](self, "sessionManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setCameraMode:", *v34);

    -[CRCameraReader sessionManager](self, "sessionManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setCameraPosition:", 0);

  }
  -[CRCameraReader sessionManager](self, "sessionManager");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "enableMetadataOutput");

  if (v38)
  {
    -[CRCameraReader setCameraMode:](self, "setCameraMode:", *MEMORY[0x24BDB1AF8]);
    -[CRCameraReader cameraMode](self, "cameraMode");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCameraReader sessionManager](self, "sessionManager");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setCameraMode:", v39);

  }
  -[CRCameraReader sessionManager](self, "sessionManager");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setupCameraSession");

  -[CRCameraReader sessionManager](self, "sessionManager");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "cameraMode");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)*v34;

  if (v43 == v44)
  {
    -[CRCameraReader releaseCorrectedCardBuffer](self, "releaseCorrectedCardBuffer");
    -[CRCameraReader createCorrectedCardBuffer](self, "createCorrectedCardBuffer");
  }
  -[CRCameraReader view](self, "view");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "layer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCameraReader sessionManager](self, "sessionManager");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "previewLayer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "addSublayer:", v48);

  +[CRAlignmentLayer layer](CRAlignmentLayer, "layer");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCameraReader setAlignmentLayer:](self, "setAlignmentLayer:", v49);

  -[CRCameraReader alignmentLayer](self, "alignmentLayer");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "instructionLayer");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setHidden:", -[CRCameraReader hidePlacementText](self, "hidePlacementText"));

  -[CRCameraReader view](self, "view");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "layer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCameraReader alignmentLayer](self, "alignmentLayer");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "addSublayer:", v54);

  -[CRCameraReader alignmentLayer](self, "alignmentLayer");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setDelegate:", self);

  if (-[CRCameraReader showDiagnosticHUD](self, "showDiagnosticHUD"))
  {
    +[DiagnosticHUDLayer layer](DiagnosticHUDLayer, "layer");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCameraReader setDiagnosticHUDLayer:](self, "setDiagnosticHUDLayer:", v56);

    -[CRCameraReader view](self, "view");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "layer");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCameraReader diagnosticHUDLayer](self, "diagnosticHUDLayer");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "addSublayer:", v59);

  }
  v60 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  v77 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  v78 = v60;
  v79 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v80 = *(_QWORD *)(MEMORY[0x24BDE5598] + 80);
  v61 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  v75 = *MEMORY[0x24BDE5598];
  v76 = v61;
  v62 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  v73 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  v74 = v62;
  -[CRCameraReader view](self, "view");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "layer");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v68[2] = v77;
  v68[3] = v78;
  v68[4] = v79;
  v68[0] = v75;
  v68[1] = v76;
  v69 = v80;
  v70 = 0xBF45D867C3ECE2A5;
  v71 = v73;
  v72 = v74;
  objc_msgSend(v64, "setSublayerTransform:", v68);

  v65 = (void *)objc_opt_new();
  -[CRCameraReader setPreviousContactMatches:](self, "setPreviousContactMatches:", v65);

  -[CRCameraReader processingQueue](self, "processingQueue");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = MEMORY[0x24BDAC760];
  v67[1] = 3221225472;
  v67[2] = __26__CRCameraReader_loadView__block_invoke_2;
  v67[3] = &unk_24C58B768;
  v67[4] = self;
  cr_dispatch_async((uint64_t)v66, (uint64_t)v67);

}

CRDefaultCaptureSessionManager *__26__CRCameraReader_loadView__block_invoke()
{
  return objc_alloc_init(CRDefaultCaptureSessionManager);
}

uint64_t __26__CRCameraReader_loadView__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "loadModels");
}

- (void)loadModels
{
  CRMLEmbossedNumberModel *v3;
  CRMLEmbossedCardholderModel *v4;
  CRMLEmbossedExpirationModel *v5;
  CRMLFlatModel *v6;

  v3 = objc_alloc_init(CRMLEmbossedNumberModel);
  -[CRCameraReader setEmbossedNumberModel:](self, "setEmbossedNumberModel:");

  v4 = objc_alloc_init(CRMLEmbossedCardholderModel);
  -[CRCameraReader setEmbossedCardholderModel:](self, "setEmbossedCardholderModel:");

  v5 = objc_alloc_init(CRMLEmbossedExpirationModel);
  -[CRCameraReader setEmbossedExpirationModel:](self, "setEmbossedExpirationModel:");

  v6 = objc_alloc_init(CRMLFlatModel);
  -[CRCameraReader setFlatPrintedModel:](self, "setFlatPrintedModel:");

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;

  -[CRCameraReader sessionManager](self, "sessionManager");
  v38 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "previewLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[CRCameraReader sessionManager](self, "sessionManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "previewLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v6, v8, v10, v12);

  -[CRCameraReader alignmentLayer](self, "alignmentLayer");
  v39 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "superlayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[CRCameraReader alignmentLayer](self, "alignmentLayer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

  -[CRCameraReader diagnosticHUDLayer](self, "diagnosticHUDLayer");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "superlayer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bounds");
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  -[CRCameraReader diagnosticHUDLayer](self, "diagnosticHUDLayer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setFrame:", v27, v29, v31, v33);

  -[CRCameraReader sessionManager](self, "sessionManager");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  -[CRCameraReader view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "window");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "windowScene");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setPreviewOrientation:", objc_msgSend(v37, "interfaceOrientation"));

  -[CRCameraReader alignmentLayer](self, "alignmentLayer");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setNeedsLayout");

  -[CRCameraReader diagnosticHUDLayer](self, "diagnosticHUDLayer");
  v43 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setNeedsLayout");

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  CRPollingTimer *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CRCameraReader;
  -[CRCameraReader viewWillAppear:](&v21, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginGeneratingDeviceOrientationNotifications");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_orientationDidChange_, *MEMORY[0x24BDF76D8], v4);

  v6 = -[CRPollingTimer initWithTarget:selector:]([CRPollingTimer alloc], "initWithTarget:selector:", self, sel_hideBoxLayer);
  -[CRCameraReader setBoxLayerHideTimer:](self, "setBoxLayerHideTimer:", v6);

  if (-[CRCameraReader isCaptureMode](self, "isCaptureMode"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel_handleTapFrom_);
    -[CRCameraReader setTapGestureRecognizer:](self, "setTapGestureRecognizer:", v7);

    -[CRCameraReader tapGestureRecognizer](self, "tapGestureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNumberOfTapsRequired:", 1);

    -[CRCameraReader tapGestureRecognizer](self, "tapGestureRecognizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNumberOfTouchesRequired:", 1);

    -[CRCameraReader view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCameraReader tapGestureRecognizer](self, "tapGestureRecognizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addGestureRecognizer:", v11);

  }
  -[CRCameraReader view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMasksToBounds:", 1);

  -[CRCameraReader startSession](self, "startSession");
  v14 = (void *)MEMORY[0x24BDBCF20];
  -[CRCameraReader outputObjectTypes](self, "outputObjectTypes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "containsObject:", CFSTR("CROutputTypeCreditCardName")))
  {
    if (!objc_msgSend(MEMORY[0x24BDBACF8], "authorizationStatusForEntityType:", 0))
    {
      v17 = objc_alloc_init(MEMORY[0x24BDBACF8]);
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __33__CRCameraReader_viewWillAppear___block_invoke;
      v20[3] = &unk_24C58B7D0;
      v20[4] = self;
      objc_msgSend(v17, "requestAccessForEntityType:completionHandler:", 0, v20);
      goto LABEL_8;
    }
    if (objc_msgSend(MEMORY[0x24BDBACF8], "authorizationStatusForEntityType:", 0) == 3)
    {
      dispatch_get_global_queue(0, 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __33__CRCameraReader_viewWillAppear___block_invoke_3;
      v19[3] = &unk_24C58B768;
      v19[4] = self;
      cr_dispatch_async((uint64_t)v17, (uint64_t)v19);
LABEL_8:

    }
  }
  -[CRCameraReader alignmentLayer](self, "alignmentLayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "fadePlacementImage");

}

void __33__CRCameraReader_viewWillAppear___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  _QWORD v4[5];

  if (a2)
  {
    dispatch_get_global_queue(0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __33__CRCameraReader_viewWillAppear___block_invoke_2;
    v4[3] = &unk_24C58B768;
    v4[4] = *(_QWORD *)(a1 + 32);
    cr_dispatch_async((uint64_t)v3, (uint64_t)v4);

  }
}

void __33__CRCameraReader_viewWillAppear___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "contactsCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateContactsCache:", 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_updateContactsCache_, *MEMORY[0x24BDBA3D0], 0);

  }
}

void __33__CRCameraReader_viewWillAppear___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "contactsCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateContactsCache:", 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_updateContactsCache_, *MEMORY[0x24BDBA3D0], 0);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CRCameraReader;
  -[CRCameraReader viewDidDisappear:](&v10, sel_viewDidDisappear_, a3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BDF76D8], v5);

  -[CRCameraReader tapGestureRecognizer](self, "tapGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CRCameraReader view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCameraReader tapGestureRecognizer](self, "tapGestureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeGestureRecognizer:", v8);

    -[CRCameraReader setTapGestureRecognizer:](self, "setTapGestureRecognizer:", 0);
  }
  -[CRCameraReader boxLayerHideTimer](self, "boxLayerHideTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invalidate");

  -[CRCameraReader setBoxLayerHideTimer:](self, "setBoxLayerHideTimer:", 0);
  -[CRCameraReader stopSession](self, "stopSession");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)CRCameraReader;
  -[CRCameraReader viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __69__CRCameraReader_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_24C58B7F8;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v8);

}

void __69__CRCameraReader_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "view");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "windowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "interfaceOrientation");
  }
  else
  {
    objc_msgSend(v3, "parentViewController");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_7;
    objc_msgSend(*(id *)(a1 + 32), "parentViewController");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "windowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "interfaceOrientation");

  }
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionManager");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPreviewOrientation:", v6);

  }
LABEL_7:
  objc_msgSend(*(id *)(a1 + 32), "alignmentLayer");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "diagnosticHUDLayer");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setNeedsLayout");

}

- (void)releaseCorrectedCardBuffer
{
  __CVBuffer *correctedCardBuffer;

  correctedCardBuffer = self->_correctedCardBuffer;
  if (correctedCardBuffer)
  {
    CVPixelBufferRelease(correctedCardBuffer);
    self->_correctedCardBuffer = 0;
  }
}

- (void)createCorrectedCardBuffer
{
  void *v3;
  void *v4;
  void *v5;
  __CVBuffer *v6;
  id v7;

  v3 = (void *)MEMORY[0x24BDBCF20];
  -[CRCameraReader outputObjectTypes](self, "outputObjectTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "containsObject:", CFSTR("CROutputTypeIDCardFront")) & 1) != 0
    || objc_msgSend(v7, "containsObject:", CFSTR("CROutputTypeIDCardBack")))
  {
    -[CRCameraReader sessionManager](self, "sessionManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CRCameraReader createFastAccessPixelBufferWithSize:videoFormat:](self, "createFastAccessPixelBufferWithSize:videoFormat:", objc_msgSend(v5, "targetVideoFormat"), 1536.0, 960.0);
  }
  else
  {
    -[CRCameraReader sessionManager](self, "sessionManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CRCameraReader createFastAccessPixelBufferWithSize:videoFormat:](self, "createFastAccessPixelBufferWithSize:videoFormat:", objc_msgSend(v5, "targetVideoFormat"), 768.0, 480.0);
  }
  self->_correctedCardBuffer = v6;

}

- (void)dealloc
{
  OS_dispatch_queue *delegateQueue;
  void *v4;
  void *v5;
  CRCaptureSessionManager *sessionManager;
  OS_dispatch_queue *processingQueue;
  NSUInteger v8;
  NSPointerArray *captureBuffer;
  void *v10;
  opaqueCMSampleBuffer *lastBuffer;
  objc_super v12;

  delegateQueue = self->_delegateQueue;
  self->_delegateQueue = 0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BDBA3D0], 0);

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endGeneratingDeviceOrientationNotifications");

  -[CRCameraReader removeLayerTree](self, "removeLayerTree");
  -[CRCaptureSessionManager teardownCameraSession](self->_sessionManager, "teardownCameraSession");
  sessionManager = self->_sessionManager;
  self->_sessionManager = 0;

  processingQueue = self->_processingQueue;
  self->_processingQueue = 0;

  -[CRCameraReader releaseCorrectedCardBuffer](self, "releaseCorrectedCardBuffer");
  -[NSPointerArray compact](self->_captureBuffer, "compact");
  while (1)
  {
    v8 = -[NSPointerArray count](self->_captureBuffer, "count");
    captureBuffer = self->_captureBuffer;
    if (!v8)
      break;
    v10 = -[NSPointerArray pointerAtIndex:](captureBuffer, "pointerAtIndex:", 0);
    -[NSPointerArray removePointerAtIndex:](self->_captureBuffer, "removePointerAtIndex:", 0);
    CFRelease(v10);
  }
  self->_captureBuffer = 0;

  lastBuffer = self->_lastBuffer;
  if (lastBuffer)
  {
    CFRelease(lastBuffer);
    self->_lastBuffer = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)CRCameraReader;
  -[CRCameraReader dealloc](&v12, sel_dealloc);
}

- (void)setupInitialLayerConfiguration
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  -[CRCameraReader boxLayer](self, "boxLayer");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:", 1);

  -[CRCameraReader alignmentLayer](self, "alignmentLayer");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "resetLayer");

  v3 = -[CRCameraReader hidePlacementText](self, "hidePlacementText");
  -[CRCameraReader alignmentLayer](self, "alignmentLayer");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "instructionLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

  -[CRCameraReader boxLayer](self, "boxLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CRCameraReader boxLayer](self, "boxLayer");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeFromSuperlayer");

  }
  +[CRBoxLayer layer](CRBoxLayer, "layer");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[CRCameraReader setBoxLayer:](self, "setBoxLayer:");

  -[CRCameraReader view](self, "view");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCameraReader boxLayer](self, "boxLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSublayer:", v7);

  -[CRCameraReader sessionManager](self, "sessionManager");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "previewLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = 1.0;
  objc_msgSend(v8, "setOpacity:", v9);

  v10 = (void *)MEMORY[0x24BDBCF20];
  -[CRCameraReader outputObjectTypes](self, "outputObjectTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v20, "containsObject:", CFSTR("CROutputTypeCreditCardNumber")) & 1) != 0
    || (objc_msgSend(v20, "containsObject:", CFSTR("CROutputTypeCreditCardName")) & 1) != 0
    || (objc_msgSend(v20, "containsObject:", CFSTR("CRCameraReaderCreditCardExpirationDate")) & 1) != 0
    || (objc_msgSend(v20, "containsObject:", CFSTR("CROutputTypeIDCardFront")) & 1) != 0
    || objc_msgSend(v20, "containsObject:", CFSTR("CROutputTypeIDCardBack")))
  {
    -[CRCameraReader alignmentLayer](self, "alignmentLayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidden:", 0);
  }
  else
  {
    -[CRCameraReader alignmentLayer](self, "alignmentLayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidden:", 1);
  }

}

- (void)didReceiveMemoryWarning
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRCameraReader;
  -[CRCameraReader didReceiveMemoryWarning](&v6, sel_didReceiveMemoryWarning);
  if (-[CRCameraReader isViewLoaded](self, "isViewLoaded"))
  {
    -[CRCameraReader view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[CRCameraReader setView:](self, "setView:", 0);
      -[CRCameraReader stopSession](self, "stopSession");
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = __41__CRCameraReader_didReceiveMemoryWarning__block_invoke;
      v5[3] = &unk_24C58B768;
      v5[4] = self;
      cr_dispatch_async(MEMORY[0x24BDAC9B8], (uint64_t)v5);
    }
  }
}

uint64_t __41__CRCameraReader_didReceiveMemoryWarning__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "sessionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "teardownCameraSession");

  objc_msgSend(*(id *)(a1 + 32), "setSessionManager:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "releaseCorrectedCardBuffer");
}

- (void)toggleCamera
{
  void *v3;
  void *v4;
  _QWORD block[5];

  -[CRCameraReader sessionManager](self, "sessionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CRCameraReader sessionManager](self, "sessionManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toggleCamera");

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __30__CRCameraReader_toggleCamera__block_invoke;
    block[3] = &unk_24C58B768;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

uint64_t __30__CRCameraReader_toggleCamera__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setupInitialLayerConfiguration");
}

- (void)switchToCameraWithDeviceID:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CRCameraReader sessionManager](self, "sessionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "switchToCameraWithDeviceID:", v5);

}

- (int64_t)currentCameraIdentifier
{
  void *v2;
  int64_t v3;

  -[CRCameraReader sessionManager](self, "sessionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cameraPosition");

  return v3;
}

- (id)currentDeviceID
{
  void *v2;
  void *v3;

  -[CRCameraReader sessionManager](self, "sessionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentDeviceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)switchToCamera:(int64_t)a3
{
  void *v5;
  id v6;

  -[CRCameraReader sessionManager](self, "sessionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CRCameraReader sessionManager](self, "sessionManager");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "switchToCamera:", a3);

  }
}

- (void)captureImage
{
  -[CRCameraReader setImagesToCapture:](self, "setImagesToCapture:", -[CRCameraReader imagesToCapture](self, "imagesToCapture") + -[CRCameraReader captureCount](self, "captureCount"));
}

- (void)start
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __23__CRCameraReader_start__block_invoke;
  v2[3] = &unk_24C58B768;
  v2[4] = self;
  cr_dispatch_async(MEMORY[0x24BDAC9B8], (uint64_t)v2);
}

void __23__CRCameraReader_start__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "startSession");
  objc_msgSend(*(id *)(a1 + 32), "alignmentLayer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fadePlacementImage");

}

- (void)cancel
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __24__CRCameraReader_cancel__block_invoke;
  v2[3] = &unk_24C58B768;
  v2[4] = self;
  cr_dispatch_async(MEMORY[0x24BDAC9B8], (uint64_t)v2);
}

uint64_t __24__CRCameraReader_cancel__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "stopSession");
  return objc_msgSend(*(id *)(a1 + 32), "sendDidCancel");
}

- (void)startSession
{
  __int128 *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;

  -[CRCameraReader setFoundCode:](self, "setFoundCode:", 0);
  -[CRCameraReader setIsQRCode:](self, "setIsQRCode:", 0);
  -[CRCameraReader setPreviousCode:](self, "setPreviousCode:", 0);
  v19 = *MEMORY[0x24BDC0D40];
  v20 = *(_QWORD *)(MEMORY[0x24BDC0D40] + 16);
  -[CRCameraReader setSessionStarted:](self, "setSessionStarted:", &v19);
  v3 = (__int128 *)MEMORY[0x24BDC0D48];
  v17 = *MEMORY[0x24BDC0D48];
  v18 = *(_QWORD *)(MEMORY[0x24BDC0D48] + 16);
  -[CRCameraReader setPointsFound:](self, "setPointsFound:", &v17);
  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCameraReader setCodePresented:](self, "setCodePresented:", v4);

  -[CRCameraReader setCodeInverted:](self, "setCodeInverted:", 0);
  -[CRCameraReader setDidSendEndOrCancel:](self, "setDidSendEndOrCancel:", 0);
  -[CRCameraReader setDidSendFindBox:](self, "setDidSendFindBox:", 0);
  v15 = *v3;
  v16 = *((_QWORD *)v3 + 2);
  -[CRCameraReader setLastSendFindBox:](self, "setLastSendFindBox:", &v15);
  -[CRCameraReader setImagesToCapture:](self, "setImagesToCapture:", 0);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCameraReader setCardNumberCounts:](self, "setCardNumberCounts:", v5);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCameraReader setCardholderCounts:](self, "setCardholderCounts:", v6);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCameraReader setExpirationDateCounts:](self, "setExpirationDateCounts:", v7);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCameraReader setPinnedFoundInfo:](self, "setPinnedFoundInfo:", v8);

  v13 = *MEMORY[0x24BDC0D58];
  v14 = *(_QWORD *)(MEMORY[0x24BDC0D58] + 16);
  -[CRCameraReader setLastFieldFoundTime:](self, "setLastFieldFoundTime:", &v13);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCameraReader setNameCutRects:](self, "setNameCutRects:", v9);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCameraReader setDateCutRects:](self, "setDateCutRects:", v10);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCameraReader setCardBlurValues:](self, "setCardBlurValues:", v11);

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __30__CRCameraReader_startSession__block_invoke;
  v12[3] = &unk_24C58B768;
  v12[4] = self;
  cr_dispatch_async(MEMORY[0x24BDAC9B8], (uint64_t)v12);
}

void __30__CRCameraReader_startSession__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;

  objc_msgSend(*(id *)(a1 + 32), "sessionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRunning");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setupInitialLayerConfiguration");
    objc_msgSend(*(id *)(a1 + 32), "sessionManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startRunning");

    objc_msgSend(*(id *)(a1 + 32), "diagnosticHUDLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sessionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "previewLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sessionManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "previewVisibleRect");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    objc_msgSend(*(id *)(a1 + 32), "sessionManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cameraResolution");
    objc_msgSend(v5, "setPreviewLayer:visibleRect:cameraResolution:", v7, v10, v12, v14, v16, v18, v19);

    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setPreviousIdleState:", objc_msgSend(v20, "isIdleTimerDisabled"));

    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setIdleTimerDisabled:", 1);

    objc_msgSend(*(id *)(a1 + 32), "setSessionIsStopping:", 0);
  }
}

- (void)stopSession
{
  _QWORD v3[5];

  -[CRCameraReader setSessionIsStopping:](self, "setSessionIsStopping:", 1);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __29__CRCameraReader_stopSession__block_invoke;
  v3[3] = &unk_24C58B768;
  v3[4] = self;
  cr_dispatch_async(MEMORY[0x24BDAC9B8], (uint64_t)v3);
}

void __29__CRCameraReader_stopSession__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  objc_msgSend(*(id *)(a1 + 32), "sessionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRunning");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopRunning");

    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIdleTimerDisabled:", objc_msgSend(*(id *)(a1 + 32), "previousIdleState"));

    objc_msgSend(*(id *)(a1 + 32), "previousContactMatches");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeAllObjects");

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setCardNumberCounts:", v7);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setCardholderCounts:", v8);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setExpirationDateCounts:", v9);

  }
  objc_msgSend(*(id *)(a1 + 32), "processingQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __29__CRCameraReader_stopSession__block_invoke_2;
  v11[3] = &unk_24C58B768;
  v11[4] = *(_QWORD *)(a1 + 32);
  cr_dispatch_async((uint64_t)v10, (uint64_t)v11);

}

uint64_t __29__CRCameraReader_stopSession__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSessionIsStopping:", 0);
}

- (id)cameraIntrinsicDataForSampleBuffer:(opaqueCMSampleBuffer *)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v14;
  uint64x2_t v15;
  unint64_t v20;
  int v21;
  __int128 v22;
  _OWORD v24[3];

  CMGetAttachment(a3, (CFStringRef)*MEMORY[0x24BDC0CD8], 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CMGetAttachment(a3, (CFStringRef)*MEMORY[0x24BE107E8], 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BE10D28]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v8)
      _ZF = 1;
    else
      _ZF = v11 == 0;
    if (!_ZF)
    {
      objc_msgSend(v11, "floatValue");
      objc_msgSend(v12, "floatValue", v14, 0);
      v15.i64[0] = a4;
      v15.i64[1] = a5;
      __asm { FMOV            V2.2S, #-1.0 }
      LODWORD(v20) = 0;
      HIDWORD(v20) = v21;
      *(float32x2_t *)&v22 = vmul_f32(vadd_f32(vcvt_f32_f64(vcvtq_f64_u64(v15)), _D2), (float32x2_t)0x3F0000003F000000);
      DWORD2(v22) = 1.0;
      v24[1] = v20;
      v24[2] = v22;
      objc_msgSend(0, "getBytes:length:", v24, 48);
    }
  }
  else
  {
    v12 = 0;
  }

  return v8;
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  double Seconds;
  double v12;
  NSObject *v13;
  intptr_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[6];
  CMTime v18;
  _QWORD v19[5];
  _QWORD v20[5];
  CMTime v21;
  CMTime v22;
  CMTime v23;
  CMTime v24;
  CMTime v25;
  CMTime v26;
  CMTime v27;
  CMTime rhs;
  CMTime lhs;
  CMTime time;

  +[CRInsights sharedInsights](CRInsights, "sharedInsights", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attachNewContextToCurrentThreadWithCameraReader:", self);

  memset(&v27, 0, sizeof(v27));
  CMSampleBufferGetPresentationTimeStamp(&v27, a4);
  -[CRCameraReader sessionStarted](self, "sessionStarted");
  if ((time.flags & 1) == 0)
  {
    v26 = v27;
    -[CRCameraReader setSessionStarted:](self, "setSessionStarted:", &v26);
  }
  -[CRCameraReader boxLayerHideTimer](self, "boxLayerHideTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v27;
  objc_msgSend(v8, "evalAtTime:", &v25);

  -[CRCameraReader sessionManager](self, "sessionManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isAdjustingFocus"))
  {
    v24 = v27;
    -[CRCameraReader lastFieldFoundTime](self, "lastFieldFoundTime");
    lhs = v24;
    rhs = v23;
    CMTimeSubtract(&time, &lhs, &rhs);
    if (CMTimeGetSeconds(&time) <= 1.0)
      goto LABEL_16;
  }
  v10 = -[CRCameraReader sessionIsStopping](self, "sessionIsStopping");

  if (v10)
    return;
  if (-[CRCameraReader isCaptureMode](self, "isCaptureMode"))
  {
    -[CRCameraReader captureImageFromSampleBuffer:](self, "captureImageFromSampleBuffer:", a4);
    return;
  }
  v22 = v27;
  -[CRCameraReader sessionStarted](self, "sessionStarted");
  lhs = v22;
  rhs = v21;
  CMTimeSubtract(&time, &lhs, &rhs);
  Seconds = CMTimeGetSeconds(&time);
  -[CRCameraReader sessionTimeout](self, "sessionTimeout");
  if (Seconds > v12)
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __69__CRCameraReader_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke;
    v20[3] = &unk_24C58B768;
    v20[4] = self;
    cr_dispatch_async(MEMORY[0x24BDAC9B8], (uint64_t)v20);
    return;
  }
  if (-[CRCameraReader lastBuffer](self, "lastBuffer"))
  {
    CFRelease(self->_lastBuffer);
    -[CRCameraReader setLastBuffer:](self, "setLastBuffer:", 0);
  }
  -[CRCameraReader setLastBuffer:](self, "setLastBuffer:", CFRetain(a4));
  -[CRCameraReader processingImage](self, "processingImage");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = dispatch_semaphore_wait(v13, 0);

  if (!v14)
  {
    CFRetain(a4);
    -[CRCameraReader diagnosticHUDLayer](self, "diagnosticHUDLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = MEMORY[0x24BDAC760];
    if (v15)
    {
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __69__CRCameraReader_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke_2;
      v19[3] = &unk_24C58B768;
      v19[4] = self;
      cr_dispatch_async(MEMORY[0x24BDAC9B8], (uint64_t)v19);
    }
    -[CRCameraReader processingQueue](self, "processingQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v16;
    v17[1] = 3221225472;
    v17[2] = __69__CRCameraReader_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke_3;
    v17[3] = &unk_24C58B820;
    v17[4] = self;
    v17[5] = a4;
    v18 = v27;
    cr_dispatch_async((uint64_t)v9, (uint64_t)v17);
LABEL_16:

  }
}

uint64_t __69__CRCameraReader_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "stopSession");
  return objc_msgSend(*(id *)(a1 + 32), "sendDidEndWithErrorDomain:code:userInfo:", CFSTR("Core Recognition Error Domain"), 1, 0);
}

void __69__CRCameraReader_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "diagnosticHUDLayer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "refreshFrameIndicator");

}

void __69__CRCameraReader_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __CVBuffer *ImageBuffer;
  void *v12;
  uint64_t v13;
  size_t Width;
  void *v15;
  void *v16;
  void *v17;
  __CVBuffer *v18;
  void *v19;
  uint64_t v20;
  size_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  CVImageBufferRef v25;
  void *v26;
  void *v27;
  __int128 v28;
  uint64_t v29;
  CMTime v30;
  CMTime v31;

  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifySampleBufferProcessingStart:", *(_QWORD *)(a1 + 40));

  v3 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(*(id *)(a1 + 32), "outputObjectTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "containsObject:", CFSTR("CROutputTypeiTunesCode")) & 1) == 0)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(*(id *)(a1 + 32), "outputObjectTypes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", CFSTR("CROutputTypeHomeKitCode"));

    if (!v9)
    {
      if (objc_msgSend(v5, "containsObject:", CFSTR("CROutputTypeCreditCardNumber")))
      {
        ImageBuffer = CMSampleBufferGetImageBuffer(*(CMSampleBufferRef *)(a1 + 40));
        v12 = *(void **)(a1 + 32);
        v13 = *(_QWORD *)(a1 + 40);
        Width = CVPixelBufferGetWidth(ImageBuffer);
        objc_msgSend(v12, "cameraIntrinsicDataForSampleBuffer:width:height:", v13, Width, CVPixelBufferGetHeight(ImageBuffer));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *(void **)(a1 + 32);
        objc_msgSend(v16, "outputObjectTypes");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        CMSampleBufferGetPresentationTimeStamp(&v31, *(CMSampleBufferRef *)(a1 + 40));
        objc_msgSend(v16, "findObjects:inPixelBuffer:cameraIntrinsicData:frameTime:", v17, ImageBuffer, v15, &v31);
      }
      else
      {
        if ((objc_msgSend(v5, "containsObject:", CFSTR("CROutputTypeIDCardFront")) & 1) == 0
          && !objc_msgSend(v5, "containsObject:", CFSTR("CROutputTypeIDCardBack")))
        {
          if (!objc_msgSend(v5, "containsObject:", CFSTR("CROutputTypeCameraText")))
            goto LABEL_11;
          v25 = CMSampleBufferGetImageBuffer(*(CMSampleBufferRef *)(a1 + 40));
          CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 40), (CFStringRef)*MEMORY[0x24BE107E8], 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = *(void **)(a1 + 32);
          objc_msgSend(v26, "outputObjectTypes");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = *(_OWORD *)(a1 + 48);
          v29 = *(_QWORD *)(a1 + 64);
          objc_msgSend(v26, "findOCRTextObjects:inPixelBuffer:attachments:frameTime:", v27, v25, v10, &v28);

          goto LABEL_4;
        }
        v18 = CMSampleBufferGetImageBuffer(*(CMSampleBufferRef *)(a1 + 40));
        v19 = *(void **)(a1 + 32);
        v20 = *(_QWORD *)(a1 + 40);
        v21 = CVPixelBufferGetWidth(v18);
        objc_msgSend(v19, "cameraIntrinsicDataForSampleBuffer:width:height:", v20, v21, CVPixelBufferGetHeight(v18));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = *(void **)(a1 + 32);
        objc_msgSend(v22, "outputObjectTypes");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        CMSampleBufferGetPresentationTimeStamp(&v30, *(CMSampleBufferRef *)(a1 + 40));
        objc_msgSend(v22, "findIDObjects:inPixelBuffer:cameraIntrinsicData:frameTime:", v17, v18, v15, &v30);
      }

      goto LABEL_11;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "findCodeInSampleBuffer:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "sessionManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "highISOAdjustExposure");
LABEL_4:

LABEL_11:
  objc_msgSend(*(id *)(a1 + 32), "processingImage");
  v23 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v23);

  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "notifySampleBufferProcessingEnd:", *(_QWORD *)(a1 + 40));

  CFRelease(*(CFTypeRef *)(a1 + 40));
}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  float v19;
  float v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  float v25;
  float v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id obj;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t i;
  CMTime v39;
  CMTime v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _QWORD v51[3];

  v51[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v51[0] = *MEMORY[0x24BDB1EC8];
  v33 = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndex:", 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = v32;
    v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (!v36)
      goto LABEL_22;
    v35 = *(_QWORD *)v46;
    while (1)
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v46 != v35)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v37, "type");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v7) = objc_msgSend(v8, "isEqualToString:", v7);

        if ((_DWORD)v7)
        {
          objc_msgSend(v37, "stringValue");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v9, "isEqualToString:", &stru_24C599708) & 1) == 0)
          {
            -[CRCameraReader callbackDelegate](self, "callbackDelegate");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "stringValue");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v10, "cameraReader:shouldReturnQRCode:", self, v11);

            if (!v12)
              continue;
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = 0u;
            v44 = 0u;
            v41 = 0u;
            v42 = 0u;
            objc_msgSend(v37, "corners");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
            if (v14)
            {
              v15 = *(_QWORD *)v42;
              do
              {
                for (j = 0; j != v14; ++j)
                {
                  if (*(_QWORD *)v42 != v15)
                    objc_enumerationMutation(v13);
                  v17 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
                  objc_msgSend(v17, "objectForKey:", CFSTR("X"));
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "floatValue");
                  v20 = v19;
                  -[CRCameraReader sessionManager](self, "sessionManager");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "cameraResolution");
                  v23 = v22;
                  objc_msgSend(v17, "objectForKey:", CFSTR("Y"));
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "floatValue");
                  v26 = v25;
                  -[CRCameraReader sessionManager](self, "sessionManager");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "cameraResolution");
                  v29 = v28;

                  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v23 * v20, v29 * v26);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v9, "addObject:", v30);

                }
                v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
              }
              while (v14);
            }

            objc_msgSend(v37, "stringValue");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[CRCameraReader setFoundCode:](self, "setFoundCode:", v31);

            -[CRCameraReader setFoundPoints:](self, "setFoundPoints:", v9);
            CMSampleBufferGetPresentationTimeStamp(&v40, -[CRCameraReader lastBuffer](self, "lastBuffer"));
            v39 = v40;
            -[CRCameraReader setPointsFound:](self, "setPointsFound:", &v39);
            -[CRCameraReader setIsQRCode:](self, "setIsQRCode:", 1);
          }

        }
      }
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      if (!v36)
      {
LABEL_22:

        break;
      }
    }
  }

}

- (void)flashScreenAndPlayCaptureSound
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v3 = objc_alloc(MEMORY[0x24BDF6F90]);
  -[CRCameraReader view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v6 = (void *)objc_msgSend(v3, "initWithFrame:");

  +[CRColor whiteColor](CRColor, "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

  -[CRCameraReader view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v6);

  v10 = (void *)MEMORY[0x24BDF6F90];
  v11 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __48__CRCameraReader_flashScreenAndPlayCaptureSound__block_invoke;
  v15[3] = &unk_24C58B768;
  v16 = v6;
  v13[0] = v11;
  v13[1] = 3221225472;
  v13[2] = __48__CRCameraReader_flashScreenAndPlayCaptureSound__block_invoke_2;
  v13[3] = &unk_24C58B848;
  v12 = v16;
  v14 = v12;
  objc_msgSend(v10, "animateWithDuration:animations:completion:", v15, v13, 1.0);
  AudioServicesPlaySystemSound(0x454u);

}

uint64_t __48__CRCameraReader_flashScreenAndPlayCaptureSound__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __48__CRCameraReader_flashScreenAndPlayCaptureSound__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)captureImageFromSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  const void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const void *v17;
  const void *v18;
  _QWORD v19[6];

  CFRetain(a3);
  -[CRCameraReader captureBuffer](self, "captureBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addPointer:", a3);

  -[CRCameraReader captureBuffer](self, "captureBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  v8 = -[CRCameraReader captureCount](self, "captureCount");

  if (v7 > v8)
  {
    -[CRCameraReader captureBuffer](self, "captureBuffer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (const void *)objc_msgSend(v9, "pointerAtIndex:", 0);

    -[CRCameraReader captureBuffer](self, "captureBuffer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removePointerAtIndex:", 0);

    CFRelease(v10);
  }
  if (-[CRCameraReader imagesToCapture](self, "imagesToCapture"))
  {
    -[CRCameraReader captureBuffer](self, "captureBuffer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");

    v14 = 0;
    v15 = MEMORY[0x24BDAC760];
    v16 = MEMORY[0x24BDAC9B8];
    while (objc_msgSend(v13, "count") > v14)
    {
      v17 = (const void *)objc_msgSend(v13, "pointerAtIndex:", v14);
      v18 = v17;
      if (v17)
      {
        CFRetain(v17);
        v19[0] = v15;
        v19[1] = 3221225472;
        v19[2] = __47__CRCameraReader_captureImageFromSampleBuffer___block_invoke;
        v19[3] = &unk_24C58B898;
        v19[4] = self;
        v19[5] = v18;
        cr_dispatch_async(v16, (uint64_t)v19);
      }
      ++v14;
    }

  }
}

void __47__CRCameraReader_captureImageFromSampleBuffer___block_invoke(uint64_t a1)
{
  __CVBuffer *ImageBuffer;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  size_t BytesPerRowOfPlane;
  void *BaseAddressOfPlane;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  void *v24;
  size_t v25;
  size_t v26;
  size_t v27;

  if (objc_msgSend(*(id *)(a1 + 32), "imagesToCapture"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setImagesToCapture:", objc_msgSend(*(id *)(a1 + 32), "imagesToCapture") - 1);
    ImageBuffer = CMSampleBufferGetImageBuffer(*(CMSampleBufferRef *)(a1 + 40));
    CVPixelBufferLockBaseAddress(ImageBuffer, 0);
    WidthOfPlane = CVPixelBufferGetWidthOfPlane(ImageBuffer, 0);
    HeightOfPlane = CVPixelBufferGetHeightOfPlane(ImageBuffer, 0);
    BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(ImageBuffer, 0);
    BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(ImageBuffer, 0);
    CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 40), (CFStringRef)*MEMORY[0x24BE107E8], 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "generateStringFromDate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "stringByAppendingPathExtension:", CFSTR("tif"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = BaseAddressOfPlane;
    v25 = HeightOfPlane;
    v26 = WidthOfPlane;
    v27 = BytesPerRowOfPlane;
    writeBuffer();
    v12 = objc_msgSend(*(id *)(a1 + 32), "configUseJPEGForColor");
    v13 = CFSTR("jpg");
    if (!v12)
      v13 = CFSTR("tif");
    v14 = v13;
    objc_msgSend(v10, "stringByAppendingString:", CFSTR("Color"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAppendingPathExtension:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    writeBufferWithFullColor();

    objc_msgSend(*(id *)(a1 + 32), "callbackDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(*(id *)(a1 + 32), "callbackDelegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_opt_respondsToSelector();

      if ((v19 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v11, CFSTR("PNGFileName"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 3221225472;
        v22[2] = __47__CRCameraReader_captureImageFromSampleBuffer___block_invoke_2;
        v22[3] = &unk_24C58B870;
        v22[4] = *(_QWORD *)(a1 + 32);
        v23 = v20;
        v21 = v20;
        cr_dispatch_async(MEMORY[0x24BDAC9B8], (uint64_t)v22);

      }
    }
    CVPixelBufferUnlockBaseAddress(ImageBuffer, 0);

  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void __47__CRCameraReader_captureImageFromSampleBuffer___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "flashScreenAndPlayCaptureSound");
  objc_msgSend(*(id *)(a1 + 32), "callbackDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraReader:didWriteToFile:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)findCodeInSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  size_t BytesPerRowOfPlane;
  size_t v7;
  void *BaseAddressOfPlane;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  void *v26;
  BOOL v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  _BOOL4 v34;
  uint64_t i;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  char v52;
  int v53;
  uint64_t v54;
  id v55;
  void *v56;
  void *v57;
  BOOL v58;
  char v59;
  int v60;
  _BOOL8 v61;
  void *v62;
  void *v63;
  __CVBuffer *pixelBuffer;
  id obj;
  _QWORD v67[5];
  _QWORD v68[5];
  CMTime v69;
  CMTime v70;
  CMTime v71;
  _QWORD v72[5];
  id v73;
  id v74;
  id v75;
  opaqueCMSampleBuffer *v76;
  CMTime v77;
  char v78;
  char v79;
  char v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _QWORD v85[4];
  CMTime v86;
  CMTime rhs;
  CMTime lhs;
  CMTime time;
  _BYTE v90[128];
  uint64_t v91;
  CGPoint v92;
  CGRect v93;

  v91 = *MEMORY[0x24BDAC8D0];
  memset(&v86, 0, sizeof(v86));
  CMSampleBufferGetPresentationTimeStamp(&v86, a3);
  pixelBuffer = CMSampleBufferGetImageBuffer(a3);
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(pixelBuffer, 0);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(pixelBuffer, 0);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
  if (WidthOfPlane)
  {
    if (HeightOfPlane)
    {
      v7 = BytesPerRowOfPlane;
      if (!CVPixelBufferLockBaseAddress(pixelBuffer, 0))
      {
        CFRetain(a3);
        BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
        -[CRCameraReader foundCode](self, "foundCode");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v9 != 0;

        v10 = (void *)objc_opt_class();
        v85[0] = BaseAddressOfPlane;
        v85[1] = HeightOfPlane;
        v85[2] = WidthOfPlane;
        v85[3] = v7;
        -[CRCameraReader outputObjectTypes](self, "outputObjectTypes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "findCodeInImage:maxStage:outputObjectTypes:", v85, v61, v11);
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v62, "objectForKey:", CFSTR("boxPoints"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "objectForKey:", CFSTR("code"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "objectForKey:", CFSTR("inverted"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v13, "BOOLValue");

        objc_msgSend(v62, "objectForKey:", CFSTR("accepted"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v14, "BOOLValue");

        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRCameraReader sessionManager](self, "sessionManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "previewLayer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "bounds");
        v19 = v18;
        v21 = v20;
        v23 = v22;
        v25 = v24;

        if (!-[CRCameraReader isQRCode](self, "isQRCode")
          || (-[CRCameraReader foundCode](self, "foundCode"),
              v26 = (void *)objc_claimAutoreleasedReturnValue(),
              v27 = v26 == 0,
              v26,
              v27))
        {
          v30 = v12;
        }
        else
        {
          -[CRCameraReader foundCode](self, "foundCode");
          v28 = objc_claimAutoreleasedReturnValue();

          -[CRCameraReader foundCode](self, "foundCode");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[CRCameraReader setPreviousCode:](self, "setPreviousCode:", v29);

          -[CRCameraReader foundPoints](self, "foundPoints");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          -[CRCameraReader boxLayer](self, "boxLayer");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setFrameRatio:", 1.0);

          v60 = 1;
          v63 = (void *)v28;
          LODWORD(v61) = 1;
        }
        v83 = 0u;
        v84 = 0u;
        v81 = 0u;
        v82 = 0u;
        obj = v30;
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
        if (v32)
        {
          v33 = *(_QWORD *)v82;
          LOBYTE(v34) = 1;
          do
          {
            for (i = 0; i != v32; ++i)
            {
              if (*(_QWORD *)v82 != v33)
                objc_enumerationMutation(obj);
              v36 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
              -[CRCameraReader sessionManager](self, "sessionManager");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "CGPointValue");
              v39 = v38;
              v41 = v40;
              -[CRCameraReader sessionManager](self, "sessionManager");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "previewLayer");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "convertCameraPoint:toLayer:", v43, v39, v41);
              v45 = v44;
              v47 = v46;

              objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v45, v47);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "addObject:", v48);

              if (v34)
              {
                v93.origin.x = v19;
                v93.origin.y = v21;
                v93.size.width = v23;
                v93.size.height = v25;
                v92.x = v45;
                v92.y = v47;
                v34 = CGRectContainsPoint(v93, v92);
              }
              else
              {
                v34 = 0;
              }
            }
            v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
          }
          while (v32);
        }
        else
        {
          v34 = 1;
        }

        v49 = v60 & v34;
        if ((v60 & v34) == 1 && v63)
        {
          -[CRCameraReader previousCode](self, "previousCode");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          if (v50
            && (-[CRCameraReader previousCode](self, "previousCode"),
                v51 = (void *)objc_claimAutoreleasedReturnValue(),
                v52 = objc_msgSend(v51, "isEqualToString:", v63),
                v51,
                v50,
                (v52 & 1) != 0))
          {
            v49 = 1;
          }
          else
          {
            -[CRCameraReader setPreviousCode:](self, "setPreviousCode:", v63);
            v49 = 0;
          }
        }
        CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
        CFRelease(a3);
        if (v63)
          v53 = v49;
        else
          v53 = 0;
        if (v53 == 1)
          -[CRCameraReader stopSession](self, "stopSession");
        v54 = MEMORY[0x24BDAC760];
        if (obj)
        {
          v72[0] = MEMORY[0x24BDAC760];
          v72[1] = 3221225472;
          v72[2] = __41__CRCameraReader_findCodeInSampleBuffer___block_invoke;
          v72[3] = &unk_24C58B8C0;
          v72[4] = self;
          v55 = obj;
          v77 = v86;
          v73 = v55;
          v74 = v15;
          v78 = v49;
          v79 = v59;
          v80 = v53;
          v75 = v63;
          v76 = a3;
          cr_dispatch_async(MEMORY[0x24BDAC9B8], (uint64_t)v72);

        }
        else
        {
          v71 = v86;
          -[CRCameraReader pointsFound](self, "pointsFound");
          lhs = v71;
          rhs = v70;
          CMTimeSubtract(&time, &lhs, &rhs);
          if (CMTimeGetSeconds(&time) > 0.3)
          {
            -[CRCameraReader sessionManager](self, "sessionManager");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "resetFocus");

          }
          -[CRCameraReader setFoundPoints:](self, "setFoundPoints:", 0);
        }
        if (v61)
        {
          v68[0] = v54;
          v68[1] = 3221225472;
          v68[2] = __41__CRCameraReader_findCodeInSampleBuffer___block_invoke_2;
          v68[3] = &unk_24C58B8E8;
          v68[4] = self;
          v69 = v86;
          cr_dispatch_async(MEMORY[0x24BDAC9B8], (uint64_t)v68);
        }
        -[CRCameraReader diagnosticHUDLayer](self, "diagnosticHUDLayer");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v57 == 0;

        if (!v58)
        {
          v67[0] = v54;
          v67[1] = 3221225472;
          v67[2] = __41__CRCameraReader_findCodeInSampleBuffer___block_invoke_3;
          v67[3] = &unk_24C58B768;
          v67[4] = self;
          cr_dispatch_async(MEMORY[0x24BDAC9B8], (uint64_t)v67);
        }

      }
    }
  }
}

void __41__CRCameraReader_findCodeInSampleBuffer___block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  __int128 *v24;
  CMTimeScale *p_timescale;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  id v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  double v52;
  double v53;
  uint64_t v54;
  int v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  int v61;
  double v62;
  _BOOL4 v63;
  id *v64;
  _BOOL8 v65;
  void *v66;
  char v67;
  __CFString *v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  CRCameraReaderOutput *v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  int v81;
  void *v82;
  void *v83;
  void *v84;
  int v85;
  void *v86;
  void *v87;
  void *v88;
  int v89;
  __CVBuffer *ImageBuffer;
  void *v91;
  uint64_t v92;
  size_t Width;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  int v100;
  CVImageBufferRef v101;
  const void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  __int128 v110;
  uint64_t v111;
  __int128 v112;
  uint64_t v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  uint64_t v119;
  CMTime v120;
  CMTime v121;
  __int128 v122;
  uint64_t v123;
  CMTime rhs;
  CMTime lhs;
  CMTime time;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  _BYTE v132[128];
  uint64_t v133;

  v133 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "foundPoints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_11;
  v4 = 0;
  do
  {
    objc_msgSend(*(id *)(a1 + 32), "foundPoints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "CGPointValue");
    v8 = v7;
    v10 = v9;

    objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "CGPointValue");
    v13 = v12;
    v15 = v14;

    v16 = sqrt((v13 - v8) * (v13 - v8) + (v15 - v10) * (v15 - v10));
  }
  while (v16 <= 20.0 && v4++ < 3);
  if (v16 <= 20.0)
  {
    v121 = *(CMTime *)(a1 + 72);
    v18 = *(void **)(a1 + 32);
    if (v18)
      objc_msgSend(v18, "pointsFound");
    else
      memset(&v120, 0, sizeof(v120));
    lhs = v121;
    rhs = v120;
    CMTimeSubtract(&time, &lhs, &rhs);
    if (CMTimeGetSeconds(&time) > 3.0)
    {
      objc_msgSend(*(id *)(a1 + 32), "stopSession");
      objc_msgSend(*(id *)(a1 + 32), "sendDidEndWithErrorDomain:code:userInfo:", CFSTR("Core Recognition Error Domain"), 1, 0);
    }
  }
  else
  {
LABEL_11:
    objc_msgSend(*(id *)(a1 + 32), "setFoundPoints:", *(_QWORD *)(a1 + 40));
    v122 = *(_OWORD *)(a1 + 72);
    v123 = *(_QWORD *)(a1 + 88);
    objc_msgSend(*(id *)(a1 + 32), "setPointsFound:", &v122);
  }
  objc_msgSend(*(id *)(a1 + 32), "diagnosticHUDLayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setBoxPoints:", *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "boxLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "positionForCodeBoxPoints:", *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "boxLayer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setHidden:", 0);

  v22 = *(void **)(a1 + 32);
  v118 = *(_OWORD *)(a1 + 72);
  v119 = *(_QWORD *)(a1 + 88);
  objc_msgSend(v22, "primeBoxLayerHideTimerWithFrameTime:", &v118);
  if (*(_QWORD *)(a1 + 56) && *(_BYTE *)(a1 + 96))
  {
    v23 = 0;
    v24 = (__int128 *)(a1 + 72);
    p_timescale = &time.timescale;
    do
    {
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", v23);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "CGPointValue");
      *((_QWORD *)p_timescale - 1) = v27;
      *(_QWORD *)p_timescale = v28;

      ++v23;
      p_timescale += 4;
    }
    while (v23 != 4);
    if (*(_BYTE *)(a1 + 97))
      v29 = (*(double *)&time.epoch + v128) * 0.5;
    else
      v29 = (*(double *)&time.value + v130) * 0.5;
    if (*(_BYTE *)(a1 + 97))
      v30 = (v127 + v129) * 0.5;
    else
      v30 = (*(double *)&time.timescale + v131) * 0.5;
    if (*(_BYTE *)(a1 + 97))
      v31 = (*(double *)&time.value + v130) * 0.5;
    else
      v31 = (*(double *)&time.epoch + v128) * 0.5;
    if (*(_BYTE *)(a1 + 97))
      v32 = (*(double *)&time.timescale + v131) * 0.5;
    else
      v32 = (v127 + v129) * 0.5;
    objc_msgSend(*(id *)(a1 + 32), "sessionManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sessionManager");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "previewLayer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "convertCameraPoint:toLayer:", v35, v29, v30);
    v37 = v36;
    v39 = v38;

    objc_msgSend(*(id *)(a1 + 32), "sessionManager");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sessionManager");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "previewLayer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "convertCameraPoint:toLayer:", v42, v31, v32);
    v44 = v43;
    v46 = v45;

    if (v44 == v37)
    {
      v47 = dbl_20CDD3A30[v46 > v39];
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "sessionManager");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v60, "isPreviewVideoMirrored");
      v62 = atan((v46 - v39) / (v44 - v37));

      if (v61)
        v63 = v44 > v37;
      else
        v63 = v44 < v37;
      if (v63)
        v47 = v62 + 3.14159265;
      else
        v47 = v62;
    }
    v64 = (id *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 32), "setFoundCode:", *(_QWORD *)(a1 + 56));
    v65 = v47 > 1.57079633 || v47 < -1.57079633;
    objc_msgSend(*v64, "setCodeInverted:", v65);
    objc_msgSend(*v64, "boxLayer");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(*v64, "isQRCode");
    if ((v67 & 1) != 0)
    {
      v68 = &stru_24C599708;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "foundCode");
      v68 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v69 = objc_msgSend(*(id *)(a1 + 32), "configPresentCentered");
    if (v69)
    {
      objc_msgSend(*(id *)(a1 + 32), "sessionManager");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v1, "isPreviewVideoMirrored");
    }
    else
    {
      v70 = 0;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "configPresentCentered"))
      v71 = objc_msgSend(*(id *)(a1 + 32), "codeInverted");
    else
      v71 = 0;
    objc_msgSend(v66, "setString:mirrored:inverted:", v68, v70, v71);
    if (v69)

    if ((v67 & 1) == 0)
    v72 = objc_alloc_init(CRCameraReaderOutput);
    if (!*(_BYTE *)(a1 + 98))
      goto LABEL_80;
    v73 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(*(id *)(a1 + 32), "outputObjectTypes");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setWithArray:", v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v75, "containsObject:", CFSTR("CROutputTypeQRCode")))
    {
      v76 = objc_msgSend(*(id *)(a1 + 32), "isQRCode");

      if (v76)
      {
        -[CRCameraReaderOutput objectInternal](v72, "objectInternal");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "setType:", CFSTR("CROutputTypeQRCode"));
        goto LABEL_79;
      }
    }
    else
    {

    }
    v78 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(*(id *)(a1 + 32), "outputObjectTypes");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setWithArray:", v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v80, "containsObject:", CFSTR("CROutputTypeiTunesCode"));

    if (v81)
    {
      objc_msgSend(*(id *)(a1 + 32), "findCodeInSampleBuffer:", objc_msgSend(*(id *)(a1 + 32), "lastBuffer"));
      -[CRCameraReaderOutput objectInternal](v72, "objectInternal");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "setType:", CFSTR("CROutputTypeiTunesCode"));
    }
    else
    {
      v82 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend(*(id *)(a1 + 32), "outputObjectTypes");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "setWithArray:", v83);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = objc_msgSend(v84, "containsObject:", CFSTR("CROutputTypeHomeKitCode"));

      if (v85)
      {
        objc_msgSend(*(id *)(a1 + 32), "findCodeInSampleBuffer:", objc_msgSend(*(id *)(a1 + 32), "lastBuffer"));
        -[CRCameraReaderOutput objectInternal](v72, "objectInternal");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "setType:", CFSTR("CROutputTypeHomeKitCode"));
      }
      else
      {
        v86 = (void *)MEMORY[0x24BDBCF20];
        objc_msgSend(*(id *)(a1 + 32), "outputObjectTypes");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "setWithArray:", v87);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = objc_msgSend(v88, "containsObject:", CFSTR("CROutputTypeCreditCardNumber"));

        if (v89)
        {
          ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)objc_msgSend(*(id *)(a1 + 32), "lastBuffer"));
          v91 = *(void **)(a1 + 32);
          v92 = *(_QWORD *)(a1 + 64);
          Width = CVPixelBufferGetWidth(ImageBuffer);
          objc_msgSend(v91, "cameraIntrinsicDataForSampleBuffer:width:height:", v92, Width, CVPixelBufferGetHeight(ImageBuffer));
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v94 = *(void **)(a1 + 32);
          objc_msgSend(v94, "outputObjectTypes");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          v112 = *v24;
          v113 = *(_QWORD *)(a1 + 88);
          objc_msgSend(v94, "findObjects:inPixelBuffer:cameraIntrinsicData:frameTime:", v95, ImageBuffer, v77, &v112);

          -[CRCameraReaderOutput objectInternal](v72, "objectInternal");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "setType:", CFSTR("CROutputTypeCreditCardNumber"));
        }
        else
        {
          v97 = (void *)MEMORY[0x24BDBCF20];
          objc_msgSend(*(id *)(a1 + 32), "outputObjectTypes");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "setWithArray:", v98);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          v100 = objc_msgSend(v99, "containsObject:", CFSTR("CROutputTypeCameraText"));

          if (!v100)
          {
LABEL_80:
            v104 = *(_QWORD *)(a1 + 40);
            -[CRCameraReaderOutput objectInternal](v72, "objectInternal");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v105, "setVertices:", v104);

            objc_msgSend(*(id *)(a1 + 32), "foundCode");
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            -[CRCameraReaderOutput objectInternal](v72, "objectInternal");
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v107, "setStringValue:", v106);

            v108 = *(void **)(a1 + 32);
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v72);
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v108, "sendDidEndWithInfo:", v109);

            return;
          }
          v101 = CMSampleBufferGetImageBuffer((CMSampleBufferRef)objc_msgSend(*(id *)(a1 + 32), "lastBuffer"));
          v102 = (const void *)objc_msgSend(*(id *)(a1 + 32), "lastBuffer");
          v77 = (void *)CMGetAttachment(v102, (CFStringRef)*MEMORY[0x24BE107E8], 0);
          v103 = *(void **)(a1 + 32);
          objc_msgSend(v103, "outputObjectTypes");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v110 = *v24;
          v111 = *(_QWORD *)(a1 + 88);
          objc_msgSend(v103, "findOCRTextObjects:inPixelBuffer:attachments:frameTime:", v96, v101, v77, &v110);
        }

      }
    }
LABEL_79:

    goto LABEL_80;
  }
  v116 = 0u;
  v117 = 0u;
  v114 = 0u;
  v115 = 0u;
  v48 = *(id *)(a1 + 48);
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v114, v132, 16);
  if (v49)
  {
    v50 = 0;
    v51 = *(_QWORD *)v115;
    v52 = 0.0;
    v53 = 0.0;
    do
    {
      v54 = 0;
      v55 = v50 + 1;
      v50 += v49;
      do
      {
        if (*(_QWORD *)v115 != v51)
          objc_enumerationMutation(v48);
        objc_msgSend(*(id *)(*((_QWORD *)&v114 + 1) + 8 * v54), "CGPointValue");
        v56 = 1.0 / (double)(v55 + (int)v54);
        v53 = v53 * (1.0 - v56) + v57 * v56;
        v52 = v52 * (1.0 - v56) + v58 * v56;
        ++v54;
      }
      while (v49 != v54);
      v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v114, v132, 16);
    }
    while (v49);
  }
  else
  {
    v52 = 0.0;
    v53 = 0.0;
  }

  objc_msgSend(*(id *)(a1 + 32), "sessionManager");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "refocusOnPoint:", v53, v52);

}

uint64_t __41__CRCameraReader_findCodeInSampleBuffer___block_invoke_2(uint64_t a1)
{
  void *v2;
  __int128 v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "pauseBoxLayerHideTimer");
  v2 = *(void **)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 56);
  return objc_msgSend(v2, "animatePresentCodeAtFrameTime:", &v4);
}

void __41__CRCameraReader_findCodeInSampleBuffer___block_invoke_3(uint64_t a1)
{
  int v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;

  objc_msgSend(*(id *)(a1 + 32), "sessionManager");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v21, "isFocusPointOfInterestSupported");

  v3 = 0.0;
  v4 = 0.0;
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionManager");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "focusPointOfInterest");
    v6 = v5;
    v8 = v7;

    objc_msgSend(*(id *)(a1 + 32), "sessionManager");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "cameraResolution");
    v10 = v9;
    objc_msgSend(*(id *)(a1 + 32), "sessionManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cameraResolution");
    v13 = v12;

    objc_msgSend(*(id *)(a1 + 32), "sessionManager");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sessionManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "previewLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "convertCameraPoint:toLayer:", v15, v6 * v10, v8 * v13);
    v3 = v16;
    v4 = v17;

  }
  objc_msgSend(*(id *)(a1 + 32), "diagnosticHUDLayer");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sessionManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isAdjustingFocus");
  objc_msgSend(*(id *)(a1 + 32), "sessionManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setAdjustingFocus:pointOfInterestSupported:focusPoint:", v19, objc_msgSend(v20, "isFocusPointOfInterestSupported"), v3, v4);

}

+ (id)extractCardImage:(id)a3 fromPixelBuffer:(__CVBuffer *)a4 withCardBuffer:(__CVBuffer *)a5 cameraIntrinsicData:(id)a6
{
  objc_msgSend(a1, "extractCardImage:fromPixelBuffer:withCardBuffer:withPoints:cameraIntrinsicData:", a3, a4, a5, 0, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)extractCardImage:(id)a3 fromPixelBuffer:(__CVBuffer *)a4 withCardBuffer:(__CVBuffer *)a5 withPoints:(id)a6 cameraIntrinsicData:(id)a7
{
  double v7;

  LODWORD(v7) = 0;
  objc_msgSend(a1, "extractCardImage:fromPixelBuffer:withCardBuffer:withPoints:cameraIntrinsicData:padding:inputOrientation:", a3, a4, a5, a6, a7, 1, v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)extractCardImage:(id)a3 fromPixelBuffer:(__CVBuffer *)a4 withCardBuffer:(__CVBuffer *)a5 withPoints:(id)a6 cameraIntrinsicData:(id)a7 padding:(float)a8 inputOrientation:(int)a9
{
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  id v18;
  id v19;
  void *v20;
  char v21;
  CFDictionaryRef v22;
  void *v23;
  void *v24;
  char isKindOfClass;
  NSString *v26;
  NSPoint v27;
  double y;
  NSString *v29;
  NSPoint v30;
  double v31;
  NSString *v32;
  NSPoint v33;
  double v34;
  NSString *v35;
  CGFloat x;
  CGFloat v37;
  NSPoint v38;
  id v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGFloat v46;
  CGFloat v47;
  void *v48;
  CGFloat v49;
  CGFloat v50;
  void *v51;
  CGFloat v52;
  CGFloat v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  _BOOL4 v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  CGColorSpace *DeviceRGB;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  id v82;
  void *v83;
  uint64_t v84;
  uint64_t i;
  void *v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  double v108;
  double v109;
  double v110;
  int v111;
  double v112;
  double v113;
  double v114;
  uint64_t v115;
  unint64_t v116;
  double v117;
  double v118;
  unint64_t v119;
  double v120;
  void *v121;
  void *v122;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  void *BaseAddressOfPlane;
  void *v126;
  size_t v127;
  id v129;
  void *v130;
  void *v131;
  void *v133;
  void *v134;
  void *v135;
  int v136;
  id v137;
  id obj;
  uint64_t v139;
  void *v140;
  void *v141;
  uint64_t v142;
  uint64_t v143;
  CGAffineTransform v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  id v149;
  CGPoint v150;
  CGPoint v151;
  CGPoint v152;
  CGPoint v153;
  _OWORD v154[4];
  CGAffineTransform v155;
  CGPoint v156;
  _BYTE v157[128];
  uint64_t v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;
  CGRect v166;

  v13 = *(_QWORD *)&a9;
  v158 = *MEMORY[0x24BDAC8D0];
  v137 = a3;
  v18 = a6;
  v19 = a7;
  v134 = v19;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "BOOLForKey:", CFSTR("com.apple.CoreRecognition.enable_vn_2_rect_detector"));

  v22 = CMCopyDictionaryOfAttachments((CFAllocatorRef)*MEMORY[0x24BDBD240], a4, 1u);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBF660]), "initWithCVPixelBuffer:options:", a4, v22);
  objc_msgSend(v23, "imageByApplyingOrientation:", v13);
  v141 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    CFRelease(v22);
  if (!v18)
  {
    v133 = (void *)objc_opt_new();
    v39 = objc_alloc_init(MEMORY[0x24BDF9B98]);
    LODWORD(v40) = 15.0;
    v135 = v39;
    objc_msgSend(v39, "setQuadratureTolerance:", v40);
    LODWORD(v41) = 1045220557;
    objc_msgSend(v39, "setMinimumSize:", v41);
    LODWORD(v42) = 0;
    objc_msgSend(v39, "setMinimumConfidence:", v42);
    objc_msgSend(v39, "setMaximumObservations:", 1);
    if (v19)
    {
      objc_msgSend(v133, "setObject:forKey:", v19, *MEMORY[0x24BDF9F40]);
      LODWORD(v44) = 1058724538;
      objc_msgSend(v39, "setMinimumAspectRatio:", v44);
      LODWORD(v45) = 1059570110;
    }
    else
    {
      LODWORD(v43) = 1058407449;
      objc_msgSend(v39, "setMinimumAspectRatio:", v43);
      LODWORD(v45) = 1059887199;
    }
    objc_msgSend(v39, "setMaximumAspectRatio:", v45);
    v131 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF9C28]), "initWithCIImage:options:", v141, v133);
    if ((v21 & 1) == 0)
      objc_msgSend(v39, "setRequiredVersion:", 1);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v39);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v149 = 0;
    objc_msgSend(v131, "performRequests:error:", v83, &v149);
    v129 = v149;

    objc_msgSend(v135, "results");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v130, "count"))
    {
      v147 = 0u;
      v148 = 0u;
      v145 = 0u;
      v146 = 0u;
      obj = v130;
      v84 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v145, v157, 16);
      if (v84)
      {
        v136 = 0;
        v139 = *(_QWORD *)v146;
        v140 = 0;
        do
        {
          for (i = 0; i != v84; ++i)
          {
            if (*(_QWORD *)v146 != v139)
              objc_enumerationMutation(obj);
            v86 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * i);
            objc_msgSend(v141, "extent");
            v88 = v87;
            objc_msgSend(v141, "extent");
            v90 = v89;
            objc_msgSend(v86, "topLeft");
            v153.x = v88 * v91;
            v153.y = v90 * v92;
            objc_msgSend(v86, "topRight");
            v152.x = v88 * v93;
            v152.y = v90 * v94;
            objc_msgSend(v86, "bottomLeft");
            v151.x = v88 * v95;
            v151.y = v90 * v96;
            objc_msgSend(v86, "bottomRight");
            v150.x = v88 * v97;
            v150.y = v90 * v98;
            *(CGPoint *)&v155.a = v153;
            *(CGPoint *)&v155.c = v152;
            *(CGPoint *)&v155.tx = v150;
            v156 = v151;
            v9 = rectFromPoints((uint64_t)&v155);
            v10 = v99;
            v11 = v100;
            v12 = v101;
            v102 = (void *)MEMORY[0x24BDBCE30];
            NSStringFromPoint(v153);
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromPoint(v152);
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromPoint(v150);
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromPoint(v151);
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "arrayWithObjects:", v103, v104, v105, v106, 0, v129);
            v107 = objc_claimAutoreleasedReturnValue();

            v140 = (void *)v107;
            if (a8 > 0.0)
            {
              calculatePointsWithPaddingInCorrectedSpace(&v153.x, &v152.x, &v150.x, &v151.x, v9, v10, v11, v12, a8, (double)(unint64_t)objc_msgSend(v137, "width"), (double)(unint64_t)objc_msgSend(v137, "height"));
              v154[0] = v153;
              v154[1] = v152;
              v154[2] = v150;
              v154[3] = v151;
              v9 = rectFromPoints((uint64_t)v154);
              v10 = v108;
              v11 = v109;
              v12 = v110;
            }
            objc_msgSend(v141, "extent");
            if (CGRectContainsPoint(v160, v153))
            {
              objc_msgSend(v141, "extent");
              if (CGRectContainsPoint(v161, v152))
              {
                objc_msgSend(v141, "extent");
                if (CGRectContainsPoint(v162, v151))
                {
                  objc_msgSend(v141, "extent");
                  if (CGRectContainsPoint(v163, v150))
                  {
                    objc_msgSend(v141, "extent");
                    v166.origin.x = v9;
                    v166.origin.y = v10;
                    v166.size.width = v11;
                    v166.size.height = v12;
                    if (CGRectContainsRect(v164, v166))
                      v111 = 1;
                    else
                      v111 = v136;
                    v136 = v111;
                  }
                }
              }
            }
          }
          v84 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v145, v157, 16);
        }
        while (v84);
      }
      else
      {
        v140 = 0;
        LOBYTE(v136) = 0;
      }

    }
    else
    {
      v140 = 0;
      LOBYTE(v136) = 0;
    }

    if ((v136 & 1) != 0)
      goto LABEL_10;
LABEL_46:
    v82 = 0;
    goto LABEL_51;
  }
  objc_msgSend(v18, "objectAtIndex:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v18, "objectAtIndex:", 0);
  v26 = (NSString *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) != 0)
  {
    v27 = NSPointFromString(v26);
    y = v27.y;
    v155.a = v27.x;
    v155.b = v27.y;

    objc_msgSend(v18, "objectAtIndex:", 1);
    v29 = (NSString *)objc_claimAutoreleasedReturnValue();
    v30 = NSPointFromString(v29);
    v31 = v30.y;
    v155.c = v30.x;

    objc_msgSend(v18, "objectAtIndex:", 2);
    v32 = (NSString *)objc_claimAutoreleasedReturnValue();
    v33 = NSPointFromString(v32);
    v34 = v33.y;
    v155.tx = v33.x;

    objc_msgSend(v18, "objectAtIndex:", 3);
    v35 = (NSString *)objc_claimAutoreleasedReturnValue();
    v38 = NSPointFromString(v35);
    v37 = v38.y;
    x = v38.x;
  }
  else
  {
    -[NSString CGPointValue](v26, "CGPointValue");
    y = v46;
    v155.a = v47;
    v155.b = v46;

    objc_msgSend(v18, "objectAtIndex:", 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "CGPointValue");
    v31 = v49;
    v155.c = v50;
    v155.d = v49;

    objc_msgSend(v18, "objectAtIndex:", 2);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "CGPointValue");
    v34 = v52;
    v155.tx = v53;
    v155.ty = v52;

    objc_msgSend(v18, "objectAtIndex:", 3);
    v35 = (NSString *)objc_claimAutoreleasedReturnValue();
    -[NSString CGPointValue](v35, "CGPointValue");
  }
  v54 = v37;
  v156.x = x;

  objc_msgSend(v141, "extent");
  v155.b = v55 - y;
  objc_msgSend(v141, "extent");
  v155.d = v56 - v31;
  objc_msgSend(v141, "extent");
  v155.ty = v57 - v34;
  objc_msgSend(v141, "extent");
  v156.y = v58 - v54;
  v152 = *(CGPoint *)&v155.c;
  v153 = *(CGPoint *)&v155.a;
  v150 = *(CGPoint *)&v155.tx;
  v151 = v156;
  v9 = rectFromPoints((uint64_t)&v155);
  v10 = v59;
  v11 = v60;
  v12 = v61;
  objc_msgSend(v141, "extent");
  v165.origin.x = v9;
  v165.origin.y = v10;
  v165.size.width = v11;
  v165.size.height = v12;
  v62 = CGRectContainsRect(v159, v165);
  v63 = (void *)MEMORY[0x24BDBCE30];
  NSStringFromPoint(v153);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromPoint(v152);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromPoint(v150);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromPoint(v151);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "arrayWithObjects:", v64, v65, v66, v67, 0);
  v140 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v62)
    goto LABEL_46;
LABEL_10:
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  objc_msgSend(v141, "imageByCroppingToRect:", v9, v10, v11, v12);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", CFSTR("CIPerspectiveCorrection"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBF690], "vectorWithCGPoint:", v153);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setValue:forKey:", v71, CFSTR("inputTopLeft"));

  objc_msgSend(MEMORY[0x24BDBF690], "vectorWithCGPoint:", v152);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setValue:forKey:", v72, CFSTR("inputTopRight"));

  objc_msgSend(MEMORY[0x24BDBF690], "vectorWithCGPoint:", v151);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setValue:forKey:", v73, CFSTR("inputBottomLeft"));

  objc_msgSend(MEMORY[0x24BDBF690], "vectorWithCGPoint:", v150);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setValue:forKey:", v74, CFSTR("inputBottomRight"));

  objc_msgSend(v70, "setValue:forKey:", v69, *MEMORY[0x24BDBF960]);
  objc_msgSend(v70, "valueForKey:", *MEMORY[0x24BDBF9C8]);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "extent");
  v77 = v76;
  objc_msgSend(v141, "extent");
  if (v77 <= v78 && (objc_msgSend(v75, "extent"), v80 = v79, objc_msgSend(v141, "extent"), v80 <= v81))
  {
    objc_msgSend(v75, "extent");
    v113 = v112;
    objc_msgSend(v75, "extent");
    if (v113 < v114)
    {
      objc_msgSend(v75, "imageByApplyingOrientation:", 6);
      v115 = objc_claimAutoreleasedReturnValue();

      v75 = (void *)v115;
    }
    v116 = objc_msgSend(v137, "width");
    objc_msgSend(v75, "extent");
    v118 = v117;
    v119 = objc_msgSend(v137, "height");
    objc_msgSend(v75, "extent");
    memset(&v155, 0, sizeof(v155));
    CGAffineTransformMakeScale(&v155, (double)v116 / v118, (double)v119 / v120);
    v144 = v155;
    objc_msgSend(v75, "imageByApplyingTransform:", &v144);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBF648], "contextWithOptions:", 0);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "render:toCVPixelBuffer:bounds:colorSpace:", v121, a5, DeviceRGB, 0.0, 0.0, (double)(unint64_t)objc_msgSend(v137, "width"), (double)(unint64_t)objc_msgSend(v137, "height"));
    CGColorSpaceRelease(DeviceRGB);
    WidthOfPlane = CVPixelBufferGetWidthOfPlane(a5, 0);
    HeightOfPlane = CVPixelBufferGetHeightOfPlane(a5, 0);
    if (WidthOfPlane && HeightOfPlane && !CVPixelBufferLockBaseAddress(a5, 0))
    {
      BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a5, 0);
      if (v137)
      {
        objc_msgSend(v137, "vImage");
        v126 = *(void **)&v154[0];
        objc_msgSend(v137, "vImage");
        objc_msgSend(v137, "vImage");
        v127 = v142 * v143;
      }
      else
      {
        v126 = 0;
        v127 = 0;
      }
      memcpy(v126, BaseAddressOfPlane, v127);
      CVPixelBufferUnlockBaseAddress(a5, 0);
    }
    v82 = v140;

  }
  else
  {
    CFRelease(DeviceRGB);
    v82 = 0;
  }

LABEL_51:
  return v82;
}

- (void)sendProvideOverlayObjects:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CRCameraReader delegateQueue](self, "delegateQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__CRCameraReader_sendProvideOverlayObjects___block_invoke;
  v7[3] = &unk_24C58B870;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  cr_dispatch_async((uint64_t)v5, (uint64_t)v7);

}

uint64_t __44__CRCameraReader_sendProvideOverlayObjects___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "callbackDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = *(id *)(a1 + 40);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v13;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
          objc_msgSend(*(id *)(a1 + 32), "callbackDelegate", (_QWORD)v12);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "cameraReader:provideOverlayTextForRecognizedObject:", *(_QWORD *)(a1 + 32), v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setOverlayString:", v10);

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }

  }
  return objc_msgSend(*(id *)(a1 + 32), "showTextDetectorObjects:", *(_QWORD *)(a1 + 40), (_QWORD)v12);
}

- (void)findOCRTextObjects:(id)a3 inPixelBuffer:(__CVBuffer *)a4 attachments:(id)a5 frameTime:(id *)a6
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CRCameraReaderOutputCameraText *v17;
  CRCameraReaderOutputCameraText *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  CVPixelBufferRetain(a4);
  -[CRCameraReader ocrImageReader](self, "ocrImageReader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *MEMORY[0x24BEB5B40];
  v25[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resultsForPixelBuffer:options:error:", a4, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v12);
        v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15);
        v17 = [CRCameraReaderOutputCameraText alloc];
        v18 = -[CRCameraReaderOutput initWithImageReaderOutput:](v17, "initWithImageReaderOutput:", v16, (_QWORD)v19);
        objc_msgSend(v11, "addObject:", v18);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  -[CRCameraReader sendProvideOverlayObjects:](self, "sendProvideOverlayObjects:", v11);
  CVPixelBufferRelease(a4);

}

- (id)findObjects:(id)a3 inImage:(id)a4 properties:(id)a5
{
  void *v7;
  uint64_t v8;
  CVPixelBufferRef Planar420PixelBufferFromImageFile;
  __CVBuffer *v10;
  void *v11;
  __CFDictionary *Mutable;
  __CFDictionary *IOSurfacePropertiesDictionary;
  clock_t v14;
  void *v15;
  CVPixelBufferRef v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSString *v26;
  size_t Height;
  NSPoint v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  void *v36;
  id v37;
  id v38;
  id v40;
  id v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  CVPixelBufferRef pixelBufferOut;
  _BYTE v48[128];
  uint64_t v49;
  NSPoint v50;

  v49 = *MEMORY[0x24BDAC8D0];
  v37 = a3;
  v41 = a4;
  v40 = a5;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v38 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "pathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "compare:options:", CFSTR("JPG"), 1);

  if (v8)
    Planar420PixelBufferFromImageFile = createPlanar420PixelBufferFromImageFile((const __CFURL *)v41);
  else
    Planar420PixelBufferFromImageFile = createPlanar420PixelBufferFromJPEGFile();
  v10 = Planar420PixelBufferFromImageFile;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB5B80]), "initWithWidth:height:colorSpace:", 768, 480, 0);
  pixelBufferOut = 0;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  IOSurfacePropertiesDictionary = fcssCreateIOSurfacePropertiesDictionary(768, 480, 875704422);
  if (IOSurfacePropertiesDictionary)
  {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDC5668], IOSurfacePropertiesDictionary);
    CFRelease(IOSurfacePropertiesDictionary);
  }
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0x300uLL, 0x1E0uLL, 0x34323066u, Mutable, &pixelBufferOut);
  v14 = clock();
  v15 = (void *)objc_opt_class();
  v16 = pixelBufferOut;
  objc_msgSend(v40, "objectForKey:", CFSTR("CameraIntrinsicData"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "extractCardImage:fromPixelBuffer:withCardBuffer:cameraIntrinsicData:", v11, v10, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  *(float *)&v19 = (float)(uint64_t)(clock() - v14) / 1000000.0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setObject:forKey:", v20, CFSTR("cardExtractionTime"));

  if (v18)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v22 = v18;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v44;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v44 != v24)
            objc_enumerationMutation(v22);
          v26 = *(NSString **)(*((_QWORD *)&v43 + 1) + 8 * v25);
          Height = CVPixelBufferGetHeight(v10);
          v28 = NSPointFromString(v26);
          v50.x = v28.x;
          v50.y = (double)Height - v28.y;
          NSStringFromPoint(v50);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v29);

          ++v25;
        }
        while (v23 != v25);
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v23);
    }

    objc_msgSend(v42, "setValue:forKey:", v21, CFSTR("boxPoints"));
    -[CRCameraReader findObjectsEmbossed:inImage:](self, "findObjectsEmbossed:inImage:", v37, v11);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addEntriesFromDictionary:", v30);
    objc_msgSend(v38, "setObject:forKey:", v42, CFSTR("freeformResults"));

  }
  objc_msgSend(v40, "objectForKey:", CFSTR("cardPoints"));
  v31 = objc_claimAutoreleasedReturnValue();

  v32 = (void *)v31;
  if (v31)
  {
    v33 = (id)objc_msgSend((id)objc_opt_class(), "extractCardImage:fromPixelBuffer:withCardBuffer:withPoints:cameraIntrinsicData:", v11, v10, pixelBufferOut, v31, 0);
    -[CRCameraReader findObjectsEmbossed:inImage:](self, "findObjectsEmbossed:inImage:", v37, v11);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addEntriesFromDictionary:", v34);
    objc_msgSend(v38, "setObject:forKey:", v36, CFSTR("annotatedCardPointResults"));

  }
  CVPixelBufferRelease(pixelBufferOut);
  CVPixelBufferRelease(v10);

  return v38;
}

- (void)updatePinnedInfoFrameIndex
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  -[CRCameraReader pinnedFoundInfo](self, "pinnedFoundInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("currentFrameIndex"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
    v4 = objc_msgSend(v7, "unsignedIntegerValue") + 1;
  else
    v4 = 0;
  -[CRCameraReader pinnedFoundInfo](self, "pinnedFoundInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("currentFrameIndex"));

}

- (void)setFirstTimeFrameIndexForPinnedField:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "stringByAppendingString:", CFSTR("FirstPinningFrameIndex"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CRCameraReader pinnedFoundInfo](self, "pinnedFoundInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[CRCameraReader pinnedFoundInfo](self, "pinnedFoundInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("currentFrameIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CRCameraReader pinnedFoundInfo](self, "pinnedFoundInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v7, v9);

    }
  }

}

- (unint64_t)getFirstTimeFrameIndexForPinnedField:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  objc_msgSend(a3, "stringByAppendingString:", CFSTR("FirstPinningFrameIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCameraReader pinnedFoundInfo](self, "pinnedFoundInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "unsignedIntegerValue");
  else
    v7 = -1;

  return v7;
}

- (id)getCorrectedIDImageFromAuxiliaryPoints:(id)a3 fromPixelBuffer:(__CVBuffer *)a4 orientation:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  CFDictionaryRef v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  float v32;
  float v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  uint64_t v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  CGAffineTransform v60;
  CGAffineTransform v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  uint64_t v70;
  CGRect v71;
  CGRect v72;

  v5 = *(_QWORD *)&a5;
  v70 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = v8;
  if (v8 && objc_msgSend(v8, "count") == 4)
  {
    v10 = CMCopyDictionaryOfAttachments((CFAllocatorRef)*MEMORY[0x24BDBD240], a4, 1u);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBF660]), "initWithCVPixelBuffer:options:", a4, v10);
    objc_msgSend(v11, "imageByApplyingOrientation:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      CFRelease(v10);
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "CGPointValue");
    v62 = v14;
    v63 = v15;

    objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "CGPointValue");
    v64 = v17;
    v65 = v18;

    objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "CGPointValue");
    v66 = v20;
    v67 = v21;

    objc_msgSend(v9, "objectAtIndexedSubscript:", 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "CGPointValue");
    v68 = v23;
    v69 = v24;

    v25 = rectFromPoints((uint64_t)&v62);
    v27 = v26;
    v29 = v28;
    v31 = v30;
    -[CRCameraReader borderPaddingIDCard](self, "borderPaddingIDCard");
    if (v32 > 0.0)
    {
      -[CRCameraReader borderPaddingIDCard](self, "borderPaddingIDCard");
      calculatePointsWithPaddingInCorrectedSpace(&v62, &v64, &v66, &v68, v25, v27, v29, v31, v33, 1536.0, 960.0);
      v25 = rectFromPoints((uint64_t)&v62);
      v27 = v34;
      v29 = v35;
      v31 = v36;
    }
    objc_msgSend(v12, "extent");
    v72.origin.x = v25;
    v72.origin.y = v27;
    v72.size.width = v29;
    v72.size.height = v31;
    if (CGRectContainsRect(v71, v72))
    {
      objc_msgSend(v12, "imageByCroppingToRect:", v25, v27, v29, v31);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", CFSTR("CIPerspectiveCorrection"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBF690], "vectorWithCGPoint:", v62, v63);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setValue:forKey:", v39, CFSTR("inputTopLeft"));

      objc_msgSend(MEMORY[0x24BDBF690], "vectorWithCGPoint:", v64, v65);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setValue:forKey:", v40, CFSTR("inputTopRight"));

      objc_msgSend(MEMORY[0x24BDBF690], "vectorWithCGPoint:", v66, v67);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setValue:forKey:", v41, CFSTR("inputBottomRight"));

      objc_msgSend(MEMORY[0x24BDBF690], "vectorWithCGPoint:", v68, v69);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setValue:forKey:", v42, CFSTR("inputBottomLeft"));

      objc_msgSend(v38, "setValue:forKey:", v37, *MEMORY[0x24BDBF960]);
      objc_msgSend(v38, "valueForKey:", *MEMORY[0x24BDBF9C8]);
      v43 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "extent");
      v45 = v44;
      objc_msgSend(v12, "extent");
      if (v45 <= v46 && (objc_msgSend(v43, "extent"), v48 = v47, objc_msgSend(v12, "extent"), v48 <= v49))
      {
        objc_msgSend(v43, "extent");
        v52 = v51;
        objc_msgSend(v43, "extent");
        if (v52 < v53)
        {
          objc_msgSend(v43, "imageByApplyingOrientation:", 6);
          v54 = objc_claimAutoreleasedReturnValue();

          v43 = (id)v54;
        }
        objc_msgSend(v43, "extent");
        v56 = v55;
        objc_msgSend(v43, "extent");
        memset(&v61, 0, sizeof(v61));
        CGAffineTransformMakeScale(&v61, 1536.0 / v56, 960.0 / v57);
        v60 = v61;
        objc_msgSend(v43, "imageByApplyingTransform:", &v60);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        v43 = v58;
        v50 = v43;
      }
      else
      {
        v50 = 0;
      }

    }
    else
    {
      v50 = 0;
    }

  }
  else
  {
    v50 = 0;
  }

  return v50;
}

- (void)findIDObjects:(id)a3 inPixelBuffer:(__CVBuffer *)a4 cameraIntrinsicData:(id)a5 frameTime:(id *)a6
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  CGImage *v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double x;
  double y;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  CGFloat v52;
  void *v53;
  CGFloat v54;
  void *v55;
  void *v56;
  CRCameraReaderOutputIDCard *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  __CVBuffer *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  int v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  void *v82;
  double v83;
  CGFloat v84;
  double v85;
  CGFloat v86;
  double v87;
  CGFloat v88;
  double v89;
  CGFloat v90;
  CGFloat v91;
  CGFloat v92;
  double width;
  double height;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  void *v101;
  CGFloat v102;
  void *v103;
  CGFloat v104;
  void *v105;
  void *v106;
  CGFloat v107;
  CGFloat v108;
  CGFloat v109;
  CGFloat v110;
  CGFloat v111;
  double v112;
  double v113;
  double v114;
  double v115;
  size_t v116;
  size_t v117;
  double v118;
  double v119;
  CGFloat v120;
  double v121;
  unint64_t v122;
  BOOL v123;
  _QWORD *v124;
  NSString *v125;
  NSPoint v126;
  void *v127;
  double v128;
  double v129;
  void *v130;
  void *v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  void *v140;
  double v141;
  CGFloat v142;
  double v143;
  CGFloat v144;
  double v145;
  CGFloat v146;
  double v147;
  CGFloat v148;
  CGFloat v149;
  double v150;
  double v151;
  double v152;
  size_t v153;
  float v154;
  int v155;
  size_t v156;
  size_t v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  void *v165;
  CGFloat v166;
  void *v167;
  CGFloat v168;
  void *v169;
  void *v170;
  double v171;
  double v172;
  double v173;
  double v174;
  double v175;
  double v176;
  double v177;
  double v178;
  double v179;
  double v180;
  double v181;
  double v182;
  double v183;
  double v184;
  double v185;
  double v186;
  void *v187;
  CGFloat v188;
  void *v189;
  CGFloat v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  size_t v198;
  double v199;
  double v200;
  size_t v201;
  double v202;
  CGFloat v203;
  void *v204;
  CRCameraReaderOutputIDCard *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  CGColorSpace *DeviceRGB;
  __CVBuffer *v211;
  size_t v212;
  void *v213;
  _BOOL4 v214;
  CGImage *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  int v223;
  void *v224;
  uint64_t v225;
  __CFString *v226;
  double v227;
  id v228;
  void *v229;
  void *v230;
  void *v231;
  void *rect;
  double recta;
  float rectb;
  void *rect_8;
  double rect_8a;
  __CFString *rect_8b;
  uint64_t rect_16;
  void *rect_16a;
  void *v240;
  CGAffineTransform v241;
  CGAffineTransform v242;
  _BYTE v243[8];
  _QWORD v244[9];
  NSPoint v245;
  NSPoint v246;
  NSPoint v247;
  NSPoint v248;
  NSPoint v249;
  NSPoint v250;
  NSPoint v251;
  NSPoint v252;
  NSPoint v253;
  NSPoint v254;
  NSPoint v255;
  NSPoint v256;
  NSPoint v257;
  NSPoint v258;
  NSPoint v259;
  NSPoint v260;
  NSPoint v261;
  NSPoint v262;
  CGRect v263;
  CGRect v264;
  CGRect v265;
  CGRect v266;
  CGRect v267;
  CGRect v268;
  CGRect v269;
  CGRect v270;
  CGRect v271;
  CGRect v272;

  v244[7] = *MEMORY[0x24BDAC8D0];
  v228 = a5;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", a3);
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  v226 = CFSTR("CRCameraReaderIDCardCapturePathAutomatic");
  CVPixelBufferGetWidth(a4);
  CVPixelBufferGetHeight(a4);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v229 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB5B80]), "initWithWidth:height:colorSpace:", 1536, 960, 0);
  -[CRCameraReader sessionManager](self, "sessionManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "previewLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "videoOrientation");

  switch(v13)
  {
    case 2:
      v225 = 0;
      v14 = 3;
      break;
    case 3:
      v14 = 8;
      v225 = 1;
      break;
    case 4:
      v14 = 6;
      v225 = 0x100000000;
      break;
    default:
      v225 = 0;
      v14 = 1;
      break;
  }
  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "allowOverrideWithKey:forValue:", CFSTR("boxPoints"), 0);
    rect_16 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    rect_16 = 0;
  }

  -[CRCameraReader callbackDelegate](self, "callbackDelegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    -[CRCameraReader callbackDelegate](self, "callbackDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "cameraReader:auxiliaryIDCornerDetection:", self, a4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[CRCameraReader getCorrectedIDImageFromAuxiliaryPoints:fromPixelBuffer:orientation:](self, "getCorrectedIDImageFromAuxiliaryPoints:fromPixelBuffer:orientation:", v20, a4, v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
LABEL_25:

      v66 = rect_16;
      goto LABEL_26;
    }
    objc_msgSend(MEMORY[0x24BDBF648], "contextWithOptions:", 0);
    rect_8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "extent");
    v22 = (CGImage *)objc_msgSend(rect_8, "createCGImage:fromRect:", v21);
    objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:", v22);
    rect = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v22);
    for (i = 0; i != 4; ++i)
    {
      objc_msgSend(v20, "objectAtIndexedSubscript:", i);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "CGPointValue");

      normalizedPointForSize();
      NSStringFromPoint(v245);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v25);

    }
    -[CRCameraReader sessionManager](self, "sessionManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCameraReader alignmentLayer](self, "alignmentLayer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "alignmentRect");
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    -[CRCameraReader alignmentLayer](self, "alignmentLayer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "convertCameraRect:fromLayer:", v36, v29, v31, v33, v35);
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v44 = v43;

    v263.origin.x = v38;
    v263.origin.y = v40;
    v263.size.width = v42;
    v263.size.height = v44;
    CGRectIntegral(v263);
    normalizedRectForSize();
    x = v246.x;
    y = v246.y;
    v48 = v47;
    v50 = v49;
    NSStringFromPoint(v246);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v231, "addObject:", v51);

    v52 = x + v48;
    v247.x = v52;
    v247.y = y;
    NSStringFromPoint(v247);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v231, "addObject:", v53);

    v54 = y + v50;
    v248.x = v52;
    v248.y = v54;
    NSStringFromPoint(v248);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v231, "addObject:", v55);

    v249.x = x;
    v249.y = v54;
    NSStringFromPoint(v249);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v231, "addObject:", v56);

    v57 = objc_alloc_init(CRCameraReaderOutputIDCard);
    -[CRCameraReaderOutput objectInternal](v57, "objectInternal");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setImageValue:", rect);

    -[CRCameraReaderOutput objectInternal](v57, "objectInternal");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setVertices:", v9);

    -[CRCameraReaderOutput objectInternal](v57, "objectInternal");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setTargetVertices:", v231);

    -[CRCameraReaderOutput objectInternal](v57, "objectInternal");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setCapturePath:", v226);

    if (objc_msgSend(v230, "containsObject:", CFSTR("CROutputTypeIDCardFront")))
    {
      -[CRCameraReaderOutput objectInternal](v57, "objectInternal");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v14;
      objc_msgSend(v62, "setType:", CFSTR("CROutputTypeIDCardFront"));
    }
    else
    {
      -[CRCameraReaderOutput objectInternal](v57, "objectInternal");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v14;
      objc_msgSend(v62, "setType:", CFSTR("CROutputTypeIDCardBack"));
    }

    -[CRCameraReader callbackDelegate](self, "callbackDelegate");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[CRCameraReader callbackDelegate](self, "callbackDelegate");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v68, "cameraReader:shouldReturnIDImage:", self, v57);

      if (!v69)
        goto LABEL_24;
    }
    else
    {

    }
    AudioServicesPlaySystemSound(0xFFFu);
    -[CRCameraReader stopSession](self, "stopSession");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v57);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCameraReader sendDidEndWithInfo:](self, "sendDidEndWithInfo:", v70);

    -[CRCameraReader sendDidEndAnimation](self, "sendDidEndAnimation");
    -[CRCameraReader cardBlurValues](self, "cardBlurValues");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "removeAllObjects");

LABEL_24:
    v14 = v63;
    goto LABEL_25;
  }
  v64 = (void *)objc_opt_class();
  v65 = -[CRCameraReader correctedCardBuffer](self, "correctedCardBuffer");
  -[CRCameraReader borderPaddingIDCard](self, "borderPaddingIDCard");
  objc_msgSend(v64, "extractCardImage:fromPixelBuffer:withCardBuffer:withPoints:cameraIntrinsicData:padding:inputOrientation:", v229, a4, v65, rect_16, v228, v14);
  v20 = (void *)rect_16;
  v66 = objc_claimAutoreleasedReturnValue();
LABEL_26:

  rect_16a = (void *)v66;
  if (v66)
  {
    -[CRCameraReader sessionManager](self, "sessionManager");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCameraReader alignmentLayer](self, "alignmentLayer");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "alignmentRect");
    v75 = v74;
    v77 = v76;
    v79 = v78;
    v81 = v80;
    -[CRCameraReader alignmentLayer](self, "alignmentLayer");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "convertCameraRect:fromLayer:", v82, v75, v77, v79, v81);
    v84 = v83;
    v86 = v85;
    v88 = v87;
    v90 = v89;

    v264.origin.x = v84;
    v264.origin.y = v86;
    v264.size.width = v88;
    v264.size.height = v90;
    v265 = CGRectIntegral(v264);
    v91 = v265.origin.x;
    v92 = v265.origin.y;
    width = v265.size.width;
    height = v265.size.height;
    normalizedRectForSize();
    v95 = v250.x;
    v96 = v250.y;
    v98 = v97;
    v100 = v99;
    NSStringFromPoint(v250);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v231, "addObject:", v101);

    v102 = v95 + v98;
    v251.x = v102;
    v251.y = v96;
    NSStringFromPoint(v251);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v231, "addObject:", v103);

    v104 = v96 + v100;
    v252.x = v102;
    v252.y = v104;
    NSStringFromPoint(v252);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v231, "addObject:", v105);

    v253.x = v95;
    v253.y = v104;
    NSStringFromPoint(v253);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v231, "addObject:", v106);

    v266.origin.x = v91;
    v266.origin.y = v92;
    v266.size.width = width;
    v266.size.height = height;
    v267 = CGRectInset(v266, width * 0.1, height * 0.1);
    recta = v267.origin.y;
    v107 = v267.origin.x;
    v108 = v267.size.width;
    v109 = v267.size.height;
    v267.origin.x = v91;
    v267.origin.y = v92;
    v267.size.width = width;
    v267.size.height = height;
    v268 = CGRectInset(v267, width * -0.1, height * -0.1);
    rect_8a = v268.origin.y;
    v110 = v268.size.height;
    if ((_DWORD)v225)
    {
      v111 = v109;
      v112 = v268.size.width;
      v113 = v268.origin.x;
      v114 = v108;
      v115 = v107;
    }
    else
    {
      v112 = v268.size.height;
      v110 = v268.size.width;
      v114 = v109;
      v111 = v108;
      v115 = recta;
      v113 = v268.origin.y;
      recta = v107;
      rect_8a = v268.origin.x;
    }
    if (HIDWORD(v225))
    {
      v116 = CVPixelBufferGetHeight(a4);
      v117 = CVPixelBufferGetHeight(a4);
      v118 = (double)v116 - (v114 + v115);
      v119 = v112 + v113;
      v115 = recta;
      v113 = rect_8a;
      v120 = v110;
      recta = v118;
      rect_8a = (double)v117 - v119;
      v121 = v111;
    }
    else
    {
      v120 = v112;
      v112 = v110;
      v121 = v114;
      v114 = v111;
    }
    v122 = 0;
    v123 = 0;
    v124 = v244;
    do
    {
      objc_msgSend(rect_16a, "objectAtIndexedSubscript:", v122);
      v125 = (NSString *)objc_claimAutoreleasedReturnValue();
      v126 = NSPointFromString(v125);
      *(NSPoint *)(v124 - 1) = v126;

      normalizedPointForSize();
      NSStringFromPoint(v254);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v127);

      v269.origin.x = rect_8a;
      v269.origin.y = v113;
      v269.size.width = v112;
      v269.size.height = v120;
      if (!CGRectContainsPoint(v269, v126))
        break;
      v270.origin.x = recta;
      v270.origin.y = v115;
      v270.size.width = v114;
      v270.size.height = v121;
      if (CGRectContainsPoint(v270, v126))
        break;
      v123 = v122 > 2;
      v124 += 2;
      ++v122;
    }
    while (v122 != 4);
    if (v123)
    {
      rectFromPoints((uint64_t)v243);
      if ((int)(v128 * v129) >= (int)(v121 * v114))
      {
        rect_8b = v226;
        goto LABEL_45;
      }
    }
  }
  if (-[CRCameraReader enableAltIDCardScan](self, "enableAltIDCardScan"))
  {
    rect_8b = CFSTR("CRCameraReaderIDCardCapturePathFallback");

    -[CRCameraReader sessionManager](self, "sessionManager");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCameraReader alignmentLayer](self, "alignmentLayer");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "alignmentRect");
    v133 = v132;
    v135 = v134;
    v137 = v136;
    v139 = v138;
    -[CRCameraReader alignmentLayer](self, "alignmentLayer");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "convertCameraRect:fromLayer:", v140, v133, v135, v137, v139);
    v142 = v141;
    v144 = v143;
    v146 = v145;
    v148 = v147;

    v271.origin.x = v142;
    v271.origin.y = v144;
    v271.size.width = v146;
    v271.size.height = v148;
    v272 = CGRectIntegral(v271);
    v149 = v272.origin.x;
    v150 = v272.origin.y;
    v151 = v272.size.width;
    v152 = v272.size.height;
    v153 = CVPixelBufferGetHeight(a4);
    CVPixelBufferGetWidth(-[CRCameraReader correctedCardBuffer](self, "correctedCardBuffer"));
    CVPixelBufferGetHeight(-[CRCameraReader correctedCardBuffer](self, "correctedCardBuffer"));
    -[CRCameraReader borderPaddingIDCard](self, "borderPaddingIDCard");
    rectb = v154;
    -[CRCameraReader borderPaddingIDCard](self, "borderPaddingIDCard");
    LODWORD(v146) = v155;
    v156 = CVPixelBufferGetWidth(a4);
    v157 = CVPixelBufferGetHeight(a4);
    v158 = (double)v153 - (v152 + v150);
    v227 = v149;
    normalizedRectForSize();
    v159 = v255.x;
    v160 = v255.y;
    v162 = v161;
    v164 = v163;
    NSStringFromPoint(v255);
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v231, "addObject:", v165);

    v166 = v159 + v162;
    v256.x = v166;
    v256.y = v160;
    NSStringFromPoint(v256);
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v231, "addObject:", v167);

    v168 = v160 + v164;
    v257.x = v166;
    v257.y = v168;
    NSStringFromPoint(v257);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v231, "addObject:", v169);

    v258.x = v159;
    v258.y = v168;
    NSStringFromPoint(v258);
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v231, "addObject:", v170);
    *(float *)&v168 = v152 * rectb;

    *(float *)&v166 = v151 * *(float *)&v146;
    LODWORD(v171) = LODWORD(v166);
    LODWORD(v172) = LODWORD(v168);
    +[CRCameraReader uniformPadRect:widthPadding:heightPadding:width:height:](CRCameraReader, "uniformPadRect:widthPadding:heightPadding:width:height:", v227, v158, v151, v152, v171, v172, (float)v156, (float)v157);
    +[CRCameraReader aspectRatioPaddedRect:expectedWidth:height:orientation:](CRCameraReader, "aspectRatioPaddedRect:expectedWidth:height:orientation:", v14);
    v174 = v173;
    v176 = v175;
    v178 = v177;
    v180 = v179;
    normalizedRectForSize();
    v181 = v259.x;
    v182 = v259.y;
    v184 = v183;
    v186 = v185;
    NSStringFromPoint(v259);
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v187);

    v188 = v181 + v184;
    v260.x = v188;
    v260.y = v182;
    NSStringFromPoint(v260);
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v189);

    v190 = v182 + v186;
    v261.x = v188;
    v261.y = v190;
    NSStringFromPoint(v261);
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v191);

    v262.x = v181;
    v262.y = v190;
    NSStringFromPoint(v262);
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v192);

    objc_msgSend(MEMORY[0x24BDBF660], "imageWithCVPixelBuffer:", a4);
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v193, "imageByCroppingToRect:", v174, v176, v178, v180);
    v194 = (void *)objc_claimAutoreleasedReturnValue();

    CGAffineTransformMakeTranslation(&v242, -v174, -v176);
    objc_msgSend(v194, "imageByApplyingTransform:", &v242);
    v195 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v195, "imageByApplyingOrientation:", v14);
    v196 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v196, "imageByApplyingOrientation:", 6);
    v197 = (void *)objc_claimAutoreleasedReturnValue();

    v198 = CVPixelBufferGetWidth(-[CRCameraReader correctedCardBuffer](self, "correctedCardBuffer"));
    objc_msgSend(v197, "extent");
    v200 = v199;
    v201 = CVPixelBufferGetHeight(-[CRCameraReader correctedCardBuffer](self, "correctedCardBuffer"));
    objc_msgSend(v197, "extent");
    v203 = fmin((double)v198 / v200, (double)v201 / v202);
    CGAffineTransformMakeScale(&v241, v203, v203);
    objc_msgSend(v197, "imageByApplyingTransform:", &v241);
    v204 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBF648], "contextWithOptions:", 0);
    v205 = (CRCameraReaderOutputIDCard *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", *MEMORY[0x24BDBF5F0], *MEMORY[0x24BDBF5E8], MEMORY[0x24BDBD1C0], *MEMORY[0x24BDBF608], MEMORY[0x24BDBD1C8], *MEMORY[0x24BDBF610], 0);
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBF650], "detectorOfType:context:options:", *MEMORY[0x24BDBF628], v205, v206);
    v240 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v240, "featuresInImage:options:", v204, v206);
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v204, "imageByApplyingOrientation:", 5);
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v240, "featuresInImage:options:", v208, v206);
    v209 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v207, "count") <= 2 && (unint64_t)objc_msgSend(v209, "count") < 3)
    {

      goto LABEL_55;
    }
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v211 = -[CRCameraReader correctedCardBuffer](self, "correctedCardBuffer");
    v212 = CVPixelBufferGetWidth(-[CRCameraReader correctedCardBuffer](self, "correctedCardBuffer"));
    -[CRCameraReaderOutputIDCard render:toCVPixelBuffer:bounds:colorSpace:](v205, "render:toCVPixelBuffer:bounds:colorSpace:", v204, v211, DeviceRGB, 0.0, 0.0, (double)v212, (double)CVPixelBufferGetHeight(-[CRCameraReader correctedCardBuffer](self, "correctedCardBuffer")));
    CGColorSpaceRelease(DeviceRGB);

LABEL_45:
    objc_msgSend(MEMORY[0x24BDBF660], "imageWithCVPixelBuffer:", -[CRCameraReader correctedCardBuffer](self, "correctedCardBuffer"));
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCameraReader cardBlurValues](self, "cardBlurValues");
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    v214 = isLeastBlurryFrame(v204, v213, 10);

    if (!v214)
    {
LABEL_57:

      goto LABEL_58;
    }
    v205 = objc_alloc_init(CRCameraReaderOutputIDCard);
    objc_msgSend(MEMORY[0x24BDBF648], "contextWithOptions:", 0);
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v204, "extent");
    v215 = (CGImage *)objc_msgSend(v206, "createCGImage:fromRect:", v204);
    objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:", v215);
    v240 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v215);
    -[CRCameraReaderOutput objectInternal](v205, "objectInternal");
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v216, "setImageValue:", v240);

    if (objc_msgSend(v230, "containsObject:", CFSTR("CROutputTypeIDCardFront")))
    {
      -[CRCameraReaderOutput objectInternal](v205, "objectInternal");
      v217 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v217, "setType:", CFSTR("CROutputTypeIDCardFront"));
    }
    else
    {
      -[CRCameraReaderOutput objectInternal](v205, "objectInternal");
      v217 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v217, "setType:", CFSTR("CROutputTypeIDCardBack"));
    }

    -[CRCameraReaderOutput objectInternal](v205, "objectInternal");
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v218, "setVertices:", v9);

    -[CRCameraReaderOutput objectInternal](v205, "objectInternal");
    v219 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v219, "setTargetVertices:", v231);

    -[CRCameraReaderOutput objectInternal](v205, "objectInternal");
    v220 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v220, "setCapturePath:", rect_8b);

    -[CRCameraReader callbackDelegate](self, "callbackDelegate");
    v221 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[CRCameraReader callbackDelegate](self, "callbackDelegate");
      v222 = (void *)objc_claimAutoreleasedReturnValue();
      v223 = objc_msgSend(v222, "cameraReader:shouldReturnIDImage:", self, v205);

      if (!v223)
        goto LABEL_56;
    }
    else
    {

    }
    AudioServicesPlaySystemSound(0xFFFu);
    -[CRCameraReader stopSession](self, "stopSession");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v205);
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCameraReader sendDidEndWithInfo:](self, "sendDidEndWithInfo:", v224);

    -[CRCameraReader sendDidEndAnimation](self, "sendDidEndAnimation");
    -[CRCameraReader cardBlurValues](self, "cardBlurValues");
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v207, "removeAllObjects");
LABEL_55:

LABEL_56:
    goto LABEL_57;
  }
  rect_8b = v226;
LABEL_58:

}

- (void)findObjects:(id)a3 inPixelBuffer:(__CVBuffer *)a4 cameraIntrinsicData:(id)a5 frameTime:(id *)a6
{
  CRCameraReader *v6;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __CFString *v41;
  __CFString *v42;
  __CFString *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  int v85;
  void *v86;
  _BOOL8 v87;
  int v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  void *v101;
  double v102;
  CGFloat v103;
  double v104;
  CGFloat v105;
  double v106;
  CGFloat v107;
  double v108;
  CGFloat v109;
  double x;
  double y;
  double width;
  double height;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  id v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  int v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  uint64_t v138;
  int v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  int v146;
  void *v147;
  void *v148;
  uint64_t v149;
  void *v150;
  void *v151;
  _BOOL4 v152;
  void *v153;
  id *p_isa;
  void *v155;
  void *v156;
  void *v157;
  id v158;
  void *v159;
  void *v160;
  uint64_t v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  int v167;
  void *v168;
  int v169;
  void *v170;
  void *v171;
  void *v172;
  BOOL v173;
  void *v174;
  void *v175;
  _BOOL4 v176;
  void *v177;
  void *v178;
  int v179;
  void *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t i;
  void *v185;
  void *v186;
  void *v187;
  int v188;
  _BOOL4 v189;
  void *v190;
  char v191;
  uint64_t v192;
  id v193;
  void *v194;
  void *v195;
  BOOL v196;
  CRCameraReader *v197;
  void *v198;
  int v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  uint64_t v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  int v211;
  void *v212;
  void *v213;
  char v214;
  void *v215;
  void *v216;
  void *v217;
  _BOOL4 v218;
  void *v219;
  void *v220;
  uint64_t v221;
  void *v222;
  void *v223;
  int v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t j;
  void *v233;
  void *v234;
  uint64_t v235;
  void *v236;
  void *v237;
  CRCameraReader *v238;
  void *v239;
  void *v240;
  int v241;
  void *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t k;
  void *v247;
  void *v248;
  void *v249;
  int v250;
  _BOOL4 v251;
  id v252;
  void *v253;
  void *v254;
  BOOL v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  int v260;
  char v261;
  char v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  uint64_t v268;
  void *v269;
  CRCameraReader *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  NSString *v276;
  NSPoint v277;
  char valid;
  void *v279;
  void *v280;
  char v281;
  int v282;
  CRCameraReader *v283;
  char v284;
  int v285;
  void *v286;
  void *v287;
  BOOL v288;
  void *v289;
  uint64_t v290;
  void *v291;
  BOOL v292;
  char v293;
  void *v294;
  void *v295;
  void *v296;
  char v297;
  void *v298;
  void *v299;
  void *v300;
  _BOOL4 v301;
  void *v302;
  void *v303;
  void *v304;
  BOOL v305;
  void *v306;
  void *v307;
  void *v308;
  BOOL v309;
  void *v310;
  void *v311;
  void *v312;
  BOOL v313;
  void *v314;
  void *v315;
  uint64_t v316;
  id v317;
  void *v318;
  void *v319;
  uint64_t v320;
  id v321;
  void *v322;
  BOOL v323;
  uint64_t v324;
  id v325;
  int v326;
  void *v327;
  void *v328;
  id v329;
  void *v330;
  id v331;
  void *v332;
  void *v333;
  void *v334;
  CVPixelBufferRef pixelBuffer;
  void *v336;
  void *v337;
  void *v338;
  id *v339;
  void *v340;
  id *v341;
  char v342;
  id *v344;
  void *v345;
  void *v346;
  const __CFString *obj;
  id obja;
  id *v349;
  void *v350;
  uint64_t v351;
  void *v352;
  void *v353;
  uint64_t v354;
  int v355;
  void *v356;
  uint64_t v357;
  id *v358;
  void *v359;
  int v360;
  id *v361;
  void *v362;
  unint64_t v363;
  CRCameraReader *v364;
  _QWORD v365[5];
  CMTime v366;
  CMTime v367;
  _QWORD v368[5];
  id v369;
  id v370;
  id v371;
  id v372;
  char v373;
  _QWORD v374[5];
  id v375;
  __int128 v376;
  int64_t v377;
  CMTime v378;
  CMTime v379;
  __int128 v380;
  int64_t v381;
  __int128 v382;
  int64_t v383;
  __int128 v384;
  int64_t v385;
  __int128 v386;
  __int128 v387;
  __int128 v388;
  __int128 v389;
  __int128 v390;
  __int128 v391;
  __int128 v392;
  __int128 v393;
  __int128 v394;
  int64_t v395;
  __int128 v396;
  __int128 v397;
  __int128 v398;
  __int128 v399;
  __int128 v400;
  __int128 v401;
  __int128 v402;
  __int128 v403;
  _QWORD v404[5];
  id v405;
  _QWORD v406[4];
  id v407;
  id v408;
  char v409;
  _QWORD v410[4];
  id v411;
  _QWORD v412[5];
  id v413;
  _QWORD v414[4];
  id v415;
  char v416;
  _QWORD v417[5];
  id v418;
  _QWORD v419[4];
  id v420;
  _QWORD v421[5];
  id v422;
  __int128 v423;
  int64_t v424;
  __int128 v425;
  int64_t var3;
  _QWORD v427[4];
  id v428;
  char v429;
  CMTime rhs;
  CMTime lhs;
  CMTime time;
  _BYTE v433[128];
  _BYTE v434[128];
  _BYTE v435[128];
  _BYTE v436[128];
  uint64_t v437;
  CGRect v438;
  CGRect v439;

  v437 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v330 = v10;
  v331 = a5;
  pixelBuffer = a4;
  CVPixelBufferRetain(a4);
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLForKey:", CFSTR("com.apple.CoreRecognition.disable_fixedbox"));

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v361) = objc_msgSend(v13, "BOOLForKey:", CFSTR("com.apple.CoreRecognition.disable_freeformbox"));

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v338 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v10);
  v333 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCameraReader updatePinnedInfoFrameIndex](self, "updatePinnedInfoFrameIndex");
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", CFSTR("CROutputTypeCreditCardNumber"));
  v332 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCameraReader pinnedFoundInfo](self, "pinnedFoundInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRCameraReader nameCutRects](self, "nameCutRects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v355 = v12;
  if (objc_msgSend(v16, "count"))
  {
    -[CRCameraReader nameCutRects](self, "nameCutRects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count") == 8;

  }
  else
  {
    v18 = 1;
  }

  -[CRCameraReader dateCutRects](self, "dateCutRects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count"))
  {
    -[CRCameraReader dateCutRects](self, "dateCutRects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count") == 8;

  }
  else
  {
    v21 = 1;
  }

  -[CRCameraReader pinnedFoundInfo](self, "pinnedFoundInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKey:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRCameraReader cardNumberCounts](self, "cardNumberCounts");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (v25)
  {
    -[CRCameraReader pinnedFoundInfo](self, "pinnedFoundInfo");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKey:", CFSTR("code"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      if (!v15 && objc_msgSend(v333, "containsObject:", CFSTR("CROutputTypeCreditCardName")))
      {
        if (!v23 && v18 != v21 && ((v21 ^ 1 | v18) & 1) != 0)
        {
LABEL_16:
          if (objc_msgSend(v333, "containsObject:", CFSTR("CRCameraReaderCreditCardExpirationDate"))
            && (v15 || v18 == v21 || ((v18 ^ 1 | v21) & 1) == 0))
          {
            objc_msgSend(v332, "addObject:", CFSTR("CRCameraReaderCreditCardExpirationDate"));
          }
          goto LABEL_22;
        }
        objc_msgSend(v332, "addObject:", CFSTR("CROutputTypeCreditCardName"));
      }
      if (!v23)
        goto LABEL_16;
    }
  }
  else
  {
    objc_msgSend(v332, "addObjectsFromArray:", v10);
  }
LABEL_22:
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB5B80]), "initWithWidth:height:colorSpace:", 768, 480, 0);
  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "allowOverrideWithKey:forValue:", CFSTR("boxPoints"), 0);
    v31 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v31 = 0;
  }

  objc_msgSend((id)objc_opt_class(), "extractCardImage:fromPixelBuffer:withCardBuffer:withPoints:cameraIntrinsicData:", v28, pixelBuffer, -[CRCameraReader correctedCardBuffer](self, "correctedCardBuffer"), v31, v331);
  v32 = objc_claimAutoreleasedReturnValue();

  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v337 = (void *)v32;
  if (v33)
  {
    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "allowOverrideWithKey:forValue:", CFSTR("CRInsightsCardImageFreeformLandscape"), v28);
    v35 = (id)objc_claimAutoreleasedReturnValue();

    v36 = v35;
  }
  else
  {
    v34 = v28;
    v36 = v34;
  }

  v334 = v36;
  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "allowOverrideWithKey:forResultFromBlock:", CFSTR("kCROverrideShouldRunOffline"), &__block_literal_global_181);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v39;
  }
  if (objc_msgSend(v39, "BOOLValue"))
    objc_msgSend(v36, "ciImage");
  else
    objc_msgSend(MEMORY[0x24BDBF660], "imageWithCVPixelBuffer:", -[CRCameraReader correctedCardBuffer](self, "correctedCardBuffer"));
  v329 = (id)objc_claimAutoreleasedReturnValue();

  if (v37)
  v364 = self;

  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v427[0] = MEMORY[0x24BDAC760];
    v427[1] = 3221225472;
    v427[2] = __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_2;
    v427[3] = &unk_24C58B950;
    v429 = (char)v361;
    v349 = &v428;
    v428 = v337;
    -[__CFString allowOverrideWithKey:forResultFromBlock:](v41, "allowOverrideWithKey:forResultFromBlock:", CFSTR("kOverrideShouldRunFreeformPath"), v427);
    v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", (v337 != 0) & ~(_DWORD)v361);
    v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v41 = v42;
  }
  v43 = v42;
  v44 = -[__CFString BOOLValue](v42, "BOOLValue");
  if (v40)

  if (v44)
  {
    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    obj = CFSTR("CRInsightsContextImagePath");
    objc_msgSend(v45, "setContextValue:forKey:", CFSTR("CRInsightsContextImagePathFreeform"));

    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setContextValue:forKey:", CFSTR("CRInsightsContextImageOrientationLandscape"), CFSTR("CRInsightsContextImageOrientation"));

    v425 = *(_OWORD *)&a6->var0;
    var3 = a6->var3;
    -[CRCameraReader setPointsFound:](self, "setPointsFound:", &v425);
    objc_msgSend(v338, "setValue:forKey:", v337, CFSTR("boxPoints"));
    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "provideInsightValue:forKey:", v337, CFSTR("boxPoints"));

    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "provideInsightValue:forKey:", v36, CFSTR("CRInsightsCardImageFreeformLandscape"));

    v423 = *(_OWORD *)&a6->var0;
    v424 = a6->var3;
    -[CRCameraReader sendDidFindTarget:frameTime:](self, "sendDidFindTarget:frameTime:", v337, &v423);
    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      +[CRInsights sharedInsights](CRInsights, "sharedInsights");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "allowOverrideWithKey:forResultFromBlock:", CFSTR("kCROverrideShouldRunEmbossedPath"), &__block_literal_global_182);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v51;
    }
    v52 = objc_msgSend(v51, "BOOLValue");
    if (v49)

    if (v52)
    {
      -[CRCameraReader findObjectsEmbossed:inImage:](self, "findObjectsEmbossed:inImage:", v332, v334);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      +[CRInsights sharedInsights](CRInsights, "sharedInsights");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "provideInsightValue:forKey:", v53, CFSTR("CRInsightsEmbossedResultsFreeformLandscape"));

      -[CRCameraReader mergeInfo:intoFindInfo:](self, "mergeInfo:intoFindInfo:", v53, v338);
    }
    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v352 = (void *)objc_claimAutoreleasedReturnValue();
    if (v352)
    {
      +[CRInsights sharedInsights](CRInsights, "sharedInsights");
      v55 = (id)objc_claimAutoreleasedReturnValue();
      v421[0] = MEMORY[0x24BDAC760];
      v421[1] = 3221225472;
      v421[2] = __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_4;
      v421[3] = &unk_24C58B998;
      v421[4] = self;
      v422 = v329;
      objc_msgSend(v55, "allowOverrideWithKey:forResultFromBlock:", CFSTR("kCROverrideRegionsFreeformLandscape"), v421);
      v358 = (id *)(id)objc_claimAutoreleasedReturnValue();

      v344 = &v422;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "targetRectsForImage:", v329);
      v55 = (id)objc_claimAutoreleasedReturnValue();
      v358 = (id *)v55;
    }

    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "provideInsightValue:forKey:", v358, CFSTR("CRInsightsTextDetectorRegionsFreeformLandscape"));

    if (objc_msgSend(v358, "count"))
    {
      -[CRCameraReader findObjectsFlat:inImage:numberRects:invert:](self, "findObjectsFlat:inImage:numberRects:invert:", v330, v334, v358, 0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      +[CRInsights sharedInsights](CRInsights, "sharedInsights");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "provideInsightValue:forKey:", v57, CFSTR("CRInsightsTextDetectorResultsFreeformLandscape"));

      -[CRCameraReader mergeInfo:intoFindInfo:](self, "mergeInfo:intoFindInfo:", v57, v338);
    }
    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v59)
    {
      +[CRInsights sharedInsights](CRInsights, "sharedInsights");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v419[0] = MEMORY[0x24BDAC760];
      v419[1] = 3221225472;
      v419[2] = __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_5;
      v419[3] = &unk_24C58B9C0;
      v341 = &v420;
      v420 = v338;
      objc_msgSend(v60, "allowOverrideWithKey:forResultFromBlock:", CFSTR("kCROverrideShouldRunPortraitFlatPrintedPath"), v419);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v62 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v338, "objectForKey:", CFSTR("code"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "numberWithBool:", v60 == 0);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v63 = objc_msgSend(v61, "BOOLValue");

    if (v63)
    {
      +[CRInsights sharedInsights](CRInsights, "sharedInsights");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setContextValue:forKey:", CFSTR("CRInsightsContextImageOrientationPortrait"), CFSTR("CRInsightsContextImageOrientation"));

      +[CRInsights sharedInsights](CRInsights, "sharedInsights");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      if (v65)
      {
        +[CRInsights sharedInsights](CRInsights, "sharedInsights");
        v66 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v334, "imageByRotating90CW");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "allowOverrideWithKey:forValue:", CFSTR("CRInsightsCardImageFreeformPortrait"), v67);
        v68 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v334, "imageByRotating90CW");
        v66 = (id)objc_claimAutoreleasedReturnValue();
        v68 = v66;
      }

      +[CRInsights sharedInsights](CRInsights, "sharedInsights");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "provideInsightValue:forKey:", v68, CFSTR("CRInsightsCardImageFreeformPortrait"));

      +[CRInsights sharedInsights](CRInsights, "sharedInsights");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = self;
      if (v70)
      {
        +[CRInsights sharedInsights](CRInsights, "sharedInsights");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v417[0] = MEMORY[0x24BDAC760];
        v417[1] = 3221225472;
        v417[2] = __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_6;
        v417[3] = &unk_24C58B998;
        v417[4] = v364;
        v418 = v68;
        objc_msgSend(v71, "allowOverrideWithKey:forResultFromBlock:", CFSTR("kCROverrideRegionsFreeformPortrait"), v417);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v339 = &v418;
      }
      else
      {
        v73 = (void *)objc_opt_class();
        objc_msgSend(v68, "ciImage");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "targetRectsForImage:", v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v74 = v72;

      +[CRInsights sharedInsights](CRInsights, "sharedInsights");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "provideInsightValue:forKey:", v74, CFSTR("CRInsightsTextDetectorRegionsFreeformPortrait"));

      if (objc_msgSend(v74, "count"))
      {
        -[CRCameraReader findObjectsFlat:inImage:numberRects:invert:](v364, "findObjectsFlat:inImage:numberRects:invert:", v330, v68, v74, 0);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRCameraReader mergeInfo:intoFindInfo:](v364, "mergeInfo:intoFindInfo:", v76, v338);
        +[CRInsights sharedInsights](CRInsights, "sharedInsights");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "provideInsightValue:forKey:", v76, CFSTR("CRInsightsTextDetectorResultsFreeformPortrait"));

        objc_msgSend(v338, "objectForKey:", CFSTR("code"));
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v77) = v78 == 0;

        if ((_DWORD)v77)
        {
          +[CRInsights sharedInsights](CRInsights, "sharedInsights");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "setContextValue:forKey:", CFSTR("CRInsightsContextImageOrientationPortraitInverted"), CFSTR("CRInsightsContextImageOrientation"));

          v6 = v364;
          -[CRCameraReader findObjectsFlat:inImage:numberRects:invert:](v364, "findObjectsFlat:inImage:numberRects:invert:", v330, v68, v74, 1);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          -[CRCameraReader mergeInfo:intoFindInfo:](v364, "mergeInfo:intoFindInfo:", v80, v338);

        }
      }

      if (v70)
    }
    if (v59)

    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setContextValue:forKey:", 0, CFSTR("CRInsightsContextImageOrientation"));

    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString setContextValue:forKey:](v41, "setContextValue:forKey:", 0, CFSTR("CRInsightsContextImagePath"));

    if (v352)
  }
  if (v40)

  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  if (v82)
  {
    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = CFSTR("kOverrideShouldRunFixedCutPath");
    v414[0] = MEMORY[0x24BDAC760];
    v414[1] = 3221225472;
    v414[2] = __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_7;
    v414[3] = &unk_24C58B950;
    v416 = v355;
    v415 = v338;
    objc_msgSend(v83, "allowOverrideWithKey:forResultFromBlock:", CFSTR("kOverrideShouldRunFixedCutPath"), v414);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = 0;
    v358 = &v415;
  }
  else
  {
    v86 = (void *)MEMORY[0x24BDD16E0];
    if ((v355 & 1) != 0)
    {
      v87 = 0;
    }
    else
    {
      objc_msgSend(v338, "objectForKey:", CFSTR("code"));
      v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v87 = v41 == 0;
    }
    objc_msgSend(v86, "numberWithBool:", v87);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = v355 ^ 1;
    v83 = v84;
  }
  v88 = objc_msgSend(v84, "BOOLValue");
  if (v82)

  if (v85)
  if (v88)
  {
    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "setContextValue:forKey:", CFSTR("CRInsightsContextImagePathFixedCut"), CFSTR("CRInsightsContextImagePath"));

    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setContextValue:forKey:", CFSTR("CRInsightsContextImageOrientationLandscape"), CFSTR("CRInsightsContextImageOrientation"));

    -[CRCameraReader sessionManager](v364, "sessionManager");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCameraReader alignmentLayer](v364, "alignmentLayer");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "alignmentRect");
    v94 = v93;
    v96 = v95;
    v98 = v97;
    v100 = v99;
    -[CRCameraReader alignmentLayer](v364, "alignmentLayer");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "convertCameraRect:fromLayer:", v101, v94, v96, v98, v100);
    v103 = v102;
    v105 = v104;
    v107 = v106;
    v109 = v108;

    v438.origin.x = v103;
    v438.origin.y = v105;
    v438.size.width = v107;
    v438.size.height = v109;
    v439 = CGRectIntegral(v438);
    x = v439.origin.x;
    y = v439.origin.y;
    width = v439.size.width;
    height = v439.size.height;
    WidthOfPlane = CVPixelBufferGetWidthOfPlane(pixelBuffer, 0);
    HeightOfPlane = CVPixelBufferGetHeightOfPlane(pixelBuffer, 0);
    if (WidthOfPlane && HeightOfPlane && !CVPixelBufferLockBaseAddress(pixelBuffer, 0))
    {
      v350 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB5B80]), "initWithCVPixelBuffer:toColorSpace:", pixelBuffer, 0);
      objc_msgSend(v350, "imageByCroppingRectangle:", x, y, width, height);
      v356 = (void *)objc_claimAutoreleasedReturnValue();
      if (height > width)
      {
        objc_msgSend(v356, "imageByRotating90CW");
        v116 = objc_claimAutoreleasedReturnValue();

        v356 = (void *)v116;
      }
      +[CRInsights sharedInsights](CRInsights, "sharedInsights");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "provideInsightValue:forKey:", v356, CFSTR("CRInsightsCardImageFixedCutLandscape"));

      +[CRInsights sharedInsights](CRInsights, "sharedInsights");
      v353 = (void *)objc_claimAutoreleasedReturnValue();
      if (v353)
      {
        +[CRInsights sharedInsights](CRInsights, "sharedInsights");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        v412[0] = MEMORY[0x24BDAC760];
        v412[1] = 3221225472;
        v412[2] = __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_8;
        v412[3] = &unk_24C58B998;
        v412[4] = v364;
        v413 = v356;
        objc_msgSend(v118, "allowOverrideWithKey:forResultFromBlock:", CFSTR("kCROverrideRegionsFixedCutLandscape"), v412);
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        obj = (const __CFString *)&v413;
      }
      else
      {
        v120 = (void *)objc_opt_class();
        objc_msgSend(v356, "ciImage");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v120, "targetRectsForImage:", v118);
        v119 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v121 = v119;

      +[CRInsights sharedInsights](CRInsights, "sharedInsights");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "provideInsightValue:forKey:", v121, CFSTR("CRInsightsTextDetectorRegionsFixedCutLandscape"));

      if (objc_msgSend(v121, "count"))
      {
        -[CRCameraReader findObjectsFlat:inImage:numberRects:invert:](v364, "findObjectsFlat:inImage:numberRects:invert:", v330, v356, v121, 0);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        +[CRInsights sharedInsights](CRInsights, "sharedInsights");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "provideInsightValue:forKey:", v123, CFSTR("CRInsightsTextDetectorResultsFixedCutLandscape"));

        -[CRCameraReader mergeInfo:intoFindInfo:](v364, "mergeInfo:intoFindInfo:", v123, v338);
      }
      +[CRInsights sharedInsights](CRInsights, "sharedInsights");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      if (v125)
      {
        +[CRInsights sharedInsights](CRInsights, "sharedInsights");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        v410[0] = MEMORY[0x24BDAC760];
        v410[1] = 3221225472;
        v410[2] = __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_9;
        v410[3] = &unk_24C58B9C0;
        v6 = (CRCameraReader *)&v411;
        v411 = v338;
        objc_msgSend(v126, "allowOverrideWithKey:forResultFromBlock:", CFSTR("kCROverrideShouldRunEmbossedPath"), v410);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v128 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v338, "objectForKey:", CFSTR("code"));
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v128, "numberWithBool:", v126 == 0);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v129 = objc_msgSend(v127, "BOOLValue");

      if (v129)
      {
        -[CRCameraReader findObjectsEmbossed:inImage:](v364, "findObjectsEmbossed:inImage:", v332, v356);
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        +[CRInsights sharedInsights](CRInsights, "sharedInsights");
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v131, "provideInsightValue:forKey:", v130, CFSTR("CRInsightsEmbossedResultsFixedCutLandscape"));

        -[CRCameraReader mergeInfo:intoFindInfo:](v364, "mergeInfo:intoFindInfo:", v130, v338);
      }
      if (v125)

      CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
      if (v353)

    }
    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setContextValue:forKey:", 0, CFSTR("CRInsightsContextImageOrientation"));

    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "setContextValue:forKey:", 0, CFSTR("CRInsightsContextImagePath"));

  }
  if (v82)

  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  if (v134)
  {
    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v406[0] = MEMORY[0x24BDAC760];
    v406[1] = 3221225472;
    v406[2] = __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_10;
    v406[3] = &unk_24C58B9E8;
    v358 = &v407;
    v407 = v338;
    v409 = (char)v361;
    v361 = &v408;
    v408 = v337;
    objc_msgSend(v135, "allowOverrideWithKey:forResultFromBlock:", CFSTR("kCROverrideShouldRunFreeformInvertedPath"), v406);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v137 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v338, "objectForKey:", CFSTR("accepted"));
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v135, "BOOLValue") & 1) != 0)
      v138 = 0;
    else
      v138 = (v337 != 0) & ~(_DWORD)v361;
    objc_msgSend(v137, "numberWithBool:", v138);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v139 = objc_msgSend(v136, "BOOLValue");

  if (v139)
  {
    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "setContextValue:forKey:", CFSTR("CRInsightsContextImagePathFreeform"), CFSTR("CRInsightsContextImagePath"));

    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "setContextValue:forKey:", CFSTR("CRInsightsContextImageOrientationLandscapeInverted"), CFSTR("CRInsightsContextImageOrientation"));

    objc_msgSend(v334, "imageByRotating180");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    if (v143)
    {
      +[CRInsights sharedInsights](CRInsights, "sharedInsights");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "allowOverrideWithKey:forResultFromBlock:", CFSTR("kCROverrideShouldRunEmbossedPath"), &__block_literal_global_184);
      v145 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      v144 = v145;
    }
    v146 = objc_msgSend(v145, "BOOLValue");
    if (v143)

    if (v146)
    {
      +[CRInsights sharedInsights](CRInsights, "sharedInsights");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "provideInsightValue:forKey:", v142, CFSTR("CRInsightsCardImageFreeformLandscapeInverted"));

      -[CRCameraReader findObjectsEmbossed:inImage:](v364, "findObjectsEmbossed:inImage:", v332, v142);
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      +[CRInsights sharedInsights](CRInsights, "sharedInsights");
      v149 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v149, "provideInsightValue:forKey:", v148, CFSTR("CRInsightsEmbossedResultsFreeformLandscapeInverted"));

      objc_msgSend(v148, "objectForKey:", CFSTR("code"));
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v149) = v150 == 0;

      if ((v149 & 1) == 0)
      {
        -[CRCameraReader mergeInfo:intoFindInfo:](v364, "mergeInfo:intoFindInfo:", v148, v338);
        objc_msgSend(v338, "setValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("inverted"));
      }

    }
    objc_msgSend(v338, "objectForKey:", CFSTR("code"));
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v152 = v151 == 0;

    if (v152)
    {
      +[CRInsights sharedInsights](CRInsights, "sharedInsights");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      p_isa = (id *)&v364->super.super.super.isa;
      if (v153)
      {
        +[CRInsights sharedInsights](CRInsights, "sharedInsights");
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        v404[0] = MEMORY[0x24BDAC760];
        v404[1] = 3221225472;
        v404[2] = __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_12;
        v404[3] = &unk_24C58B998;
        v404[4] = v364;
        v405 = v142;
        objc_msgSend(v155, "allowOverrideWithKey:forResultFromBlock:", CFSTR("kCROverrideRegionsFreeformLandscapeInverted"), v404);
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        p_isa = &v405;
      }
      else
      {
        v157 = (void *)objc_opt_class();
        objc_msgSend(v142, "ciImage");
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v157, "targetRectsForImage:", v155);
        v156 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v158 = v156;

      +[CRInsights sharedInsights](CRInsights, "sharedInsights");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v159, "provideInsightValue:forKey:", v158, CFSTR("CRInsightsTextDetectorRegionsFreeformLandscapeInverted"));

      if (objc_msgSend(v158, "count"))
      {
        -[CRCameraReader findObjectsFlat:inImage:numberRects:invert:](v364, "findObjectsFlat:inImage:numberRects:invert:", v330, v142, v158, 0);
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        +[CRInsights sharedInsights](CRInsights, "sharedInsights");
        v161 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v161, "provideInsightValue:forKey:", v160, CFSTR("CRInsightsTextDetectorResultsFreeformLandscapeInverted"));

        objc_msgSend(v160, "objectForKey:", CFSTR("code"));
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v161) = v162 == 0;

        if ((v161 & 1) == 0)
        {
          -[CRCameraReader mergeInfo:intoFindInfo:](v364, "mergeInfo:intoFindInfo:", v160, v338);
          objc_msgSend(v338, "setValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("inverted"));
        }

      }
      if (v153)

    }
    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v163, "setContextValue:forKey:", 0, CFSTR("CRInsightsContextImageOrientation"));

    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "setContextValue:forKey:", 0, CFSTR("CRInsightsContextImagePath"));

  }
  if (v134)
  {

  }
  objc_msgSend(v338, "objectForKey:", CFSTR("boxPoints"));
  v336 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v338, "objectForKey:", CFSTR("code"));
  v345 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v338, "objectForKey:", CFSTR("codeOrigin"));
  v327 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v338, "objectForKey:", CFSTR("codeFragmentOrigins"));
  v328 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v338, "objectForKey:", CFSTR("expirationDate"));
  v340 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v338, "objectForKey:", CFSTR("accepted"));
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v326 = objc_msgSend(v165, "BOOLValue");

  objc_msgSend(v338, "objectForKey:", CFSTR("nameResults"));
  v402 = 0u;
  v403 = 0u;
  v400 = 0u;
  v401 = 0u;
  obja = (id)objc_claimAutoreleasedReturnValue();
  v354 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v400, v436, 16);
  if (!v354)
  {
    v342 = 0;
    goto LABEL_196;
  }
  v342 = 0;
  v351 = *(_QWORD *)v401;
  do
  {
    v357 = 0;
    do
    {
      if (*(_QWORD *)v401 != v351)
        objc_enumerationMutation(obja);
      v359 = *(void **)(*((_QWORD *)&v400 + 1) + 8 * v357);
      objc_msgSend(v359, "objectForKey:", CFSTR("isValidNameString"));
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      v167 = objc_msgSend(v166, "BOOLValue");

      if (v167)
      {
        objc_msgSend(v359, "objectForKey:", CFSTR("nameResult"));
        v362 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v359, "objectForKey:", CFSTR("minMatchDistance"));
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        v169 = objc_msgSend(v168, "intValue");

        objc_msgSend(v359, "objectForKey:", CFSTR("nameAccepted"));
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v170, "BOOLValue"))
        {

          goto LABEL_150;
        }
        objc_msgSend(v359, "objectForKey:", CFSTR("closestNameDistance"));
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        if (v171)
        {
          objc_msgSend(v359, "objectForKey:", CFSTR("closestNameDistance"));
          v172 = (void *)objc_claimAutoreleasedReturnValue();
          v173 = objc_msgSend(v172, "integerValue") > v169;

          if (!v173)
          {
LABEL_150:
            objc_msgSend(v359, "objectForKey:", CFSTR("cardholderName"));
            v170 = v362;
            v362 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_151;
          }
        }
        else
        {
LABEL_151:

        }
        -[CRCameraReader cardholderCounts](v364, "cardholderCounts");
        v174 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v174, "objectForKey:", v362);
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        v176 = v175 == 0;

        if (!v176)
        {
          -[CRCameraReader cardholderCounts](v364, "cardholderCounts");
          v177 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v177, "objectForKey:", v362);
          v178 = (void *)objc_claimAutoreleasedReturnValue();
          v179 = objc_msgSend(v178, "intValue");

          v398 = 0u;
          v399 = 0u;
          v396 = 0u;
          v397 = 0u;
          -[CRCameraReader cardholderCounts](v364, "cardholderCounts");
          v180 = (void *)objc_claimAutoreleasedReturnValue();
          v181 = objc_msgSend(v180, "countByEnumeratingWithState:objects:count:", &v396, v435, 16);
          v182 = (v179 + 1);
          if (v181)
          {
            v183 = *(_QWORD *)v397;
            while (2)
            {
              for (i = 0; i != v181; ++i)
              {
                if (*(_QWORD *)v397 != v183)
                  objc_enumerationMutation(v180);
                v185 = *(void **)(*((_QWORD *)&v396 + 1) + 8 * i);
                -[CRCameraReader cardholderCounts](v364, "cardholderCounts");
                v186 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v186, "objectForKey:", v185);
                v187 = (void *)objc_claimAutoreleasedReturnValue();
                v188 = objc_msgSend(v187, "intValue");

                v189 = v188 == 2 || v182 == 2;
                if (v189 && objc_msgSend(v362, "editDistanceFromString:", v185) == 1)
                {
                  if (v188 == 2)
                  {
                    v193 = v185;

                    v182 = 3;
                    v362 = v193;
                  }
                  else
                  {
                    v182 = 3;
                  }
                  goto LABEL_178;
                }
              }
              v181 = objc_msgSend(v180, "countByEnumeratingWithState:objects:count:", &v396, v435, 16);
              if (v181)
                continue;
              break;
            }
          }
LABEL_178:

          -[CRCameraReader cardholderCounts](v364, "cardholderCounts");
          v200 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v182);
          v201 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v200, "setObject:forKey:", v201, v362);
          goto LABEL_179;
        }
        objc_msgSend(v359, "objectForKey:", CFSTR("nameAccepted"));
        v190 = (void *)objc_claimAutoreleasedReturnValue();
        v191 = objc_msgSend(v190, "BOOLValue");

        if ((v191 & 1) != 0)
        {
          v192 = 4;
          goto LABEL_175;
        }
        objc_msgSend(v359, "objectForKey:", CFSTR("closestNameDistance"));
        v194 = (void *)objc_claimAutoreleasedReturnValue();
        if (v194
          && (objc_msgSend(v359, "objectForKey:", CFSTR("closestNameDistance")),
              v195 = (void *)objc_claimAutoreleasedReturnValue(),
              v196 = objc_msgSend(v195, "integerValue") > v169,
              v195,
              v194,
              v197 = v364,
              !v196))
        {
          v192 = 3;
        }
        else
        {
          objc_msgSend(v359, "objectForKey:", CFSTR("isNonNameString"));
          v198 = (void *)objc_claimAutoreleasedReturnValue();
          v199 = objc_msgSend(v198, "BOOLValue");

          if (v199)
            v192 = 4294967294;
          else
            v192 = 1;
LABEL_175:
          v197 = v364;
        }
        -[CRCameraReader cardholderCounts](v197, "cardholderCounts");
        v200 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v192);
        v201 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v200, "setObject:forKey:", v201, v362);
LABEL_179:

        -[CRCameraReader cardholderCounts](v364, "cardholderCounts");
        v202 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v202, "objectForKey:", v362);
        v203 = (void *)objc_claimAutoreleasedReturnValue();
        v204 = objc_msgSend(v203, "intValue");

        -[CRCameraReader cardholderCounts](v364, "cardholderCounts");
        v205 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v204);
        v206 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v205, "setObject:forKey:", v206, v362);

        -[CRCameraReader pinnedFoundInfo](v364, "pinnedFoundInfo");
        v207 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v207, "objectForKey:", CFSTR("cardholderName"));
        v208 = (void *)objc_claimAutoreleasedReturnValue();

        if (v208)
        {
          -[CRCameraReader cardholderCounts](v364, "cardholderCounts");
          v209 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v209, "objectForKey:", v208);
          v210 = (void *)objc_claimAutoreleasedReturnValue();
          v211 = objc_msgSend(v210, "intValue");

        }
        else
        {
          v211 = 0;
        }
        if (v345 && (int)v204 >= 3 && (int)v204 > v211)
        {
          -[CRCameraReader pinnedFoundInfo](v364, "pinnedFoundInfo");
          v212 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v212, "objectForKey:", CFSTR("cardholderName"));
          v213 = (void *)objc_claimAutoreleasedReturnValue();
          v214 = objc_msgSend(v213, "isEqualToString:", v362);

          if ((v214 & 1) == 0)
          {
            v394 = *(_OWORD *)&a6->var0;
            v395 = a6->var3;
            -[CRCameraReader setLastFieldFoundTime:](v364, "setLastFieldFoundTime:", &v394);
            v342 = 1;
          }
          -[CRCameraReader pinnedFoundInfo](v364, "pinnedFoundInfo");
          v215 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v215, "setObject:forKey:", v362, CFSTR("cardholderName"));

          -[CRCameraReader setFirstTimeFrameIndexForPinnedField:](v364, "setFirstTimeFrameIndexForPinnedField:", CFSTR("cardholderName"));
          -[CRCameraReader pinnedFoundInfo](v364, "pinnedFoundInfo");
          v216 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v216, "objectForKey:", CFSTR("nameOrigin"));
          v217 = (void *)objc_claimAutoreleasedReturnValue();
          v218 = v217 == 0;

          if (v218)
          {
            -[CRCameraReader pinnedFoundInfo](v364, "pinnedFoundInfo");
            v219 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v359, "objectForKey:", CFSTR("nameOrigin"));
            v220 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v219, "setObject:forKey:", v220, CFSTR("nameOrigin"));

          }
        }

      }
      ++v357;
    }
    while (v357 != v354);
    v221 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v400, v436, 16);
    v354 = v221;
  }
  while (v221);
LABEL_196:

  if (v345)
  {
    -[CRCameraReader cardNumberCounts](v364, "cardNumberCounts");
    v222 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v222, "objectForKey:", v345);
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    v224 = objc_msgSend(v223, "intValue");

    objc_msgSend(v345, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24C599708);
    v225 = (void *)objc_claimAutoreleasedReturnValue();
    v363 = objc_msgSend(v225, "length");

    -[CRCameraReader cardNumberCounts](v364, "cardNumberCounts");
    v226 = (void *)objc_claimAutoreleasedReturnValue();
    v360 = v224 + 1;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:");
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v226, "setObject:forKey:", v227, v345);

    if ((v363 & 0xFFFFFFFFFFFFFFFDLL) == 0x11)
    {
      v392 = 0u;
      v393 = 0u;
      v390 = 0u;
      v391 = 0u;
      -[CRCameraReader cardNumberCounts](v364, "cardNumberCounts");
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v228, "allKeys");
      v229 = (void *)objc_claimAutoreleasedReturnValue();

      v230 = objc_msgSend(v229, "countByEnumeratingWithState:objects:count:", &v390, v434, 16);
      if (v230)
      {
        v231 = *(_QWORD *)v391;
        do
        {
          for (j = 0; j != v230; ++j)
          {
            if (*(_QWORD *)v391 != v231)
              objc_enumerationMutation(v229);
            v233 = *(void **)(*((_QWORD *)&v390 + 1) + 8 * j);
            objc_msgSend(v233, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24C599708);
            v234 = (void *)objc_claimAutoreleasedReturnValue();
            v235 = objc_msgSend(v234, "length");

            if (v235 <= 12)
            {
              -[CRCameraReader cardNumberCounts](v364, "cardNumberCounts");
              v236 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
              v237 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v236, "setObject:forKey:", v237, v233);

            }
          }
          v230 = objc_msgSend(v229, "countByEnumeratingWithState:objects:count:", &v390, v434, 16);
        }
        while (v230);
      }

    }
  }
  else
  {
    v360 = 0;
    v363 = 0;
  }
  v238 = v364;
  if (v340)
  {
    -[CRCameraReader expirationDateCounts](v364, "expirationDateCounts");
    v239 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v239, "objectForKey:", v340);
    v240 = (void *)objc_claimAutoreleasedReturnValue();
    v241 = objc_msgSend(v240, "intValue");

    v388 = 0u;
    v389 = 0u;
    v386 = 0u;
    v387 = 0u;
    -[CRCameraReader expirationDateCounts](v364, "expirationDateCounts");
    v242 = (void *)objc_claimAutoreleasedReturnValue();
    v243 = objc_msgSend(v242, "countByEnumeratingWithState:objects:count:", &v386, v433, 16);
    v244 = (v241 + 1);
    if (v243)
    {
      v245 = *(_QWORD *)v387;
      while (2)
      {
        for (k = 0; k != v243; ++k)
        {
          if (*(_QWORD *)v387 != v245)
            objc_enumerationMutation(v242);
          v247 = *(void **)(*((_QWORD *)&v386 + 1) + 8 * k);
          -[CRCameraReader expirationDateCounts](v364, "expirationDateCounts");
          v248 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v248, "objectForKey:", v247);
          v249 = (void *)objc_claimAutoreleasedReturnValue();
          v250 = objc_msgSend(v249, "intValue");

          v251 = v250 == 2 || v244 == 2;
          if (v251 && objc_msgSend(v340, "editDistanceFromString:", v247) == 1)
          {
            if (v250 == 2)
            {
              v252 = v247;

              v244 = 3;
              v340 = v252;
            }
            else
            {
              v244 = 3;
            }
            goto LABEL_227;
          }
        }
        v243 = objc_msgSend(v242, "countByEnumeratingWithState:objects:count:", &v386, v433, 16);
        if (v243)
          continue;
        break;
      }
    }
LABEL_227:

    -[CRCameraReader expirationDateCounts](v364, "expirationDateCounts");
    v253 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v244);
    v254 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v253, "setObject:forKey:", v254, v340);

    v238 = v364;
  }
  else
  {
    v340 = 0;
    LODWORD(v244) = 0;
  }
  v255 = v360 > 1 && v363 > 0xF;
  if (!v255 && v360 < 5)
  {

    v345 = 0;
    goto LABEL_248;
  }
  -[CRCameraReader pinnedFoundInfo](v238, "pinnedFoundInfo");
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v256, "objectForKey:", CFSTR("code"));
  v257 = (void *)objc_claimAutoreleasedReturnValue();

  if (v257)
  {
    -[CRCameraReader cardNumberCounts](v364, "cardNumberCounts");
    v258 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v258, "objectForKey:", v257);
    v259 = (void *)objc_claimAutoreleasedReturnValue();
    v260 = objc_msgSend(v259, "intValue");

    v261 = objc_msgSend(v257, "isEqualToString:", v345);
    if (v360 <= v260)
      v262 = 1;
    else
      v262 = v261;
    if ((v262 & 1) == 0)
    {
      v384 = *(_OWORD *)&a6->var0;
      v385 = a6->var3;
      -[CRCameraReader setLastFieldFoundTime:](v364, "setLastFieldFoundTime:", &v384);
      -[CRCameraReader pinnedFoundInfo](v364, "pinnedFoundInfo");
      v263 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v263, "setObject:forKey:", v345, CFSTR("code"));
      goto LABEL_243;
    }
  }
  else
  {
    v382 = *(_OWORD *)&a6->var0;
    v383 = a6->var3;
    -[CRCameraReader setLastFieldFoundTime:](v364, "setLastFieldFoundTime:", &v382);
    -[CRCameraReader pinnedFoundInfo](v364, "pinnedFoundInfo");
    v264 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v264, "setObject:forKey:", v345, CFSTR("code"));

    -[CRCameraReader setFirstTimeFrameIndexForPinnedField:](v364, "setFirstTimeFrameIndexForPinnedField:", CFSTR("code"));
    -[CRCameraReader pinnedFoundInfo](v364, "pinnedFoundInfo");
    v265 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v265, "setObject:forKey:", v327, CFSTR("codeOrigin"));

    if (v328)
    {
      -[CRCameraReader pinnedFoundInfo](v364, "pinnedFoundInfo");
      v266 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v266, "setObject:forKey:", v328, CFSTR("codeFragmentOrigins"));

    }
    objc_msgSend(v338, "objectForKey:", CFSTR("isPortrait"));
    v267 = (void *)objc_claimAutoreleasedReturnValue();
    v268 = objc_msgSend(v267, "BOOLValue");

    -[CRCameraReader pinnedFoundInfo](v364, "pinnedFoundInfo");
    v263 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v268);
    v269 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v263, "setObject:forKey:", v269, CFSTR("isPortrait"));

LABEL_243:
    v342 = 1;
  }

  if ((int)v244 < 2 || v345 == 0)
  {
LABEL_248:

    v271 = v364;
    goto LABEL_249;
  }
  -[CRCameraReader pinnedFoundInfo](v364, "pinnedFoundInfo");
  v295 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v295, "objectForKey:", CFSTR("expirationDate"));
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  v297 = objc_msgSend(v296, "isEqualToString:", v340);

  if ((v297 & 1) == 0)
  {
    v380 = *(_OWORD *)&a6->var0;
    v381 = a6->var3;
    -[CRCameraReader setLastFieldFoundTime:](v364, "setLastFieldFoundTime:", &v380);
    v342 = 1;
  }
  -[CRCameraReader pinnedFoundInfo](v364, "pinnedFoundInfo");
  v298 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v298, "setObject:forKey:", v340, CFSTR("expirationDate"));

  -[CRCameraReader setFirstTimeFrameIndexForPinnedField:](v364, "setFirstTimeFrameIndexForPinnedField:", CFSTR("expirationDate"));
  -[CRCameraReader pinnedFoundInfo](v364, "pinnedFoundInfo");
  v299 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v299, "objectForKey:", CFSTR("dateOrigin"));
  v300 = (void *)objc_claimAutoreleasedReturnValue();
  v301 = v300 == 0;

  if (v301)
  {
    -[CRCameraReader pinnedFoundInfo](v364, "pinnedFoundInfo");
    v302 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v338, "objectForKey:", CFSTR("dateOrigin"));
    v303 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v302, "setObject:forKey:", v303, CFSTR("dateOrigin"));

  }
  objc_msgSend(v338, "objectForKey:", CFSTR("expirationYear"));
  v304 = (void *)objc_claimAutoreleasedReturnValue();
  v305 = v304 == 0;

  if (!v305)
  {
    -[CRCameraReader pinnedFoundInfo](v364, "pinnedFoundInfo");
    v306 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v338, "objectForKey:", CFSTR("expirationYear"));
    v307 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v306, "setObject:forKey:", v307, CFSTR("expirationYear"));

  }
  objc_msgSend(v338, "objectForKey:", CFSTR("expirationMonth"));
  v308 = (void *)objc_claimAutoreleasedReturnValue();
  v309 = v308 == 0;

  if (!v309)
  {
    -[CRCameraReader pinnedFoundInfo](v364, "pinnedFoundInfo");
    v310 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v338, "objectForKey:", CFSTR("expirationMonth"));
    v311 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v310, "setObject:forKey:", v311, CFSTR("expirationMonth"));

  }
  objc_msgSend(v338, "objectForKey:", CFSTR("expirationDay"));
  v312 = (void *)objc_claimAutoreleasedReturnValue();
  v313 = v312 == 0;

  if (!v313)
  {
    -[CRCameraReader pinnedFoundInfo](v364, "pinnedFoundInfo");
    v314 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v338, "objectForKey:", CFSTR("expirationDay"));
    v315 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v314, "setObject:forKey:", v315, CFSTR("expirationDay"));

  }
  v271 = v364;
  if (!v340)
  {
LABEL_249:
    -[CRCameraReader pinnedFoundInfo](v271, "pinnedFoundInfo");
    v272 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v272, "objectForKey:", CFSTR("expirationDate"));
    v340 = (void *)objc_claimAutoreleasedReturnValue();

    v271 = v364;
  }
  -[CRCameraReader pinnedFoundInfo](v271, "pinnedFoundInfo");
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v273, "objectForKey:", CFSTR("cardholderName"));
  v274 = (void *)objc_claimAutoreleasedReturnValue();

  if (v274)
  {
    -[CRCameraReader pinnedFoundInfo](v364, "pinnedFoundInfo");
    v275 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v275, "objectForKey:", CFSTR("nameOrigin"));
    v276 = (NSString *)objc_claimAutoreleasedReturnValue();
    v277 = NSPointFromString(v276);
    valid = isValidNameLocationForCode(v345, v277.x, v277.y);

    if ((valid & 1) == 0)
    {

      -[CRCameraReader pinnedFoundInfo](v364, "pinnedFoundInfo");
      v279 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v279, "removeObjectForKey:", CFSTR("cardholderName"));

      -[CRCameraReader pinnedFoundInfo](v364, "pinnedFoundInfo");
      v280 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v280, "removeObjectForKey:", CFSTR("nameOrigin"));

      v274 = 0;
    }
  }
  v281 = objc_msgSend(v333, "containsObject:", CFSTR("CRCameraReaderCreditCardExpirationDate"));
  v282 = objc_msgSend(v333, "containsObject:", CFSTR("CROutputTypeCreditCardName"));
  v283 = v364;
  if (v340)
    v284 = 0;
  else
    v284 = v281;
  if (v274)
    v285 = 0;
  else
    v285 = v282;
  if (((v284 & 1) != 0 || v285)
    && (v379 = (CMTime)*a6,
        -[CRCameraReader lastFieldFoundTime](v364, "lastFieldFoundTime"),
        lhs = v379,
        rhs = v378,
        CMTimeSubtract(&time, &lhs, &rhs),
        CMTimeGetSeconds(&time) <= 1.0))
  {
    v293 = 0;
    v294 = v345;
    v292 = v345 == 0;
  }
  else
  {
    -[CRCameraReader pinnedFoundInfo](v364, "pinnedFoundInfo");
    v286 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v286, "objectForKey:", CFSTR("code"));
    v287 = (void *)objc_claimAutoreleasedReturnValue();
    v288 = v287 == 0;

    if (v288)
    {
      v283 = v364;
      v291 = v345;
    }
    else
    {
      -[CRCameraReader pinnedFoundInfo](v364, "pinnedFoundInfo");
      v289 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v289, "objectForKey:", CFSTR("code"));
      v290 = objc_claimAutoreleasedReturnValue();

      v326 = 1;
      v291 = (void *)v290;
      v283 = v364;
    }
    v292 = v291 == 0;
    v293 = 1;
    v346 = v291;
    if (v291 && v326)
    {
      AudioServicesPlaySystemSound(0xFFFu);
      -[CRCameraReader stopSession](v283, "stopSession");
      v292 = 0;
    }
    v294 = v346;
  }
  if (v336)
  {
    v316 = MEMORY[0x24BDAC9B8];
    v317 = MEMORY[0x24BDAC9B8];
    v374[0] = MEMORY[0x24BDAC760];
    v374[1] = 3221225472;
    v374[2] = __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_13;
    v374[3] = &unk_24C58BA30;
    v374[4] = v283;
    v375 = v336;
    v376 = *(_OWORD *)&a6->var0;
    v377 = a6->var3;
    cr_dispatch_async(v316, (uint64_t)v374);

    v283 = v364;
  }
  if ((v342 & 1) != 0)
  {
    -[CRCameraReader pinnedFoundInfo](v283, "pinnedFoundInfo");
    v318 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCameraReader sendDidRecognizeNewObjects:](v283, "sendDidRecognizeNewObjects:", v318);

    v283 = v364;
  }
  if (v292)
  {
    v367 = (CMTime)*a6;
    -[CRCameraReader pointsFound](v283, "pointsFound");
    lhs = v367;
    rhs = v366;
    CMTimeSubtract(&time, &lhs, &rhs);
    if (CMTimeGetSeconds(&time) > 0.3)
    {
      -[CRCameraReader sessionManager](v283, "sessionManager");
      v319 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v319, "resetFocus");

      v283 = v364;
    }
    -[CRCameraReader setFoundPoints:](v283, "setFoundPoints:", 0);
  }
  else
  {
    v320 = MEMORY[0x24BDAC9B8];
    v321 = MEMORY[0x24BDAC9B8];
    v368[0] = MEMORY[0x24BDAC760];
    v368[1] = 3221225472;
    v368[2] = __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_14;
    v368[3] = &unk_24C58BA80;
    v368[4] = v283;
    v369 = v294;
    v370 = v274;
    v371 = v340;
    v373 = v293;
    v372 = v336;
    cr_dispatch_async(v320, (uint64_t)v368);

    v283 = v364;
  }
  -[CRCameraReader diagnosticHUDLayer](v283, "diagnosticHUDLayer");
  v322 = (void *)objc_claimAutoreleasedReturnValue();
  v323 = v322 == 0;

  if (!v323)
  {
    v324 = MEMORY[0x24BDAC9B8];
    v325 = MEMORY[0x24BDAC9B8];
    v365[0] = MEMORY[0x24BDAC760];
    v365[1] = 3221225472;
    v365[2] = __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_17;
    v365[3] = &unk_24C58B768;
    v365[4] = v364;
    cr_dispatch_async(v324, (uint64_t)v365);

  }
  CVPixelBufferRelease(pixelBuffer);

}

uint64_t __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke()
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
}

uint64_t __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_2(uint64_t a1)
{
  _BOOL8 v1;

  if (*(_BYTE *)(a1 + 40))
    v1 = 0;
  else
    v1 = *(_QWORD *)(a1 + 32) != 0;
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v1);
}

uint64_t __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_3()
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
}

uint64_t __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_4(uint64_t a1)
{
  return objc_msgSend((id)objc_opt_class(), "targetRectsForImage:", *(_QWORD *)(a1 + 40));
}

id __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_5(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("code"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "numberWithBool:", v2 == 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "ciImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "targetRectsForImage:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_7(uint64_t a1)
{
  void *v1;
  void *v2;
  int v3;
  _BOOL8 v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (*(_BYTE *)(a1 + 40))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("code"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v1 == 0;
  }
  objc_msgSend(v2, "numberWithBool:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)

  return v5;
}

id __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "ciImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "targetRectsForImage:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_9(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("code"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "numberWithBool:", v2 == 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_10(uint64_t a1)
{
  void *v2;
  void *v3;
  _BOOL8 v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("accepted"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "BOOLValue") & 1) == 0 && !*(_BYTE *)(a1 + 48) && *(_QWORD *)(a1 + 40) != 0;
  objc_msgSend(v2, "numberWithBool:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_11()
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
}

id __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_12(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "ciImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "targetRectsForImage:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_13(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  NSString *v5;
  NSPoint v6;
  NSString *v7;
  NSPoint v8;
  double v9;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double Width;
  CGFloat v23;
  CGFloat y;
  CGFloat v25;
  CGFloat height;
  id v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  double v31;
  double v32;
  uint64_t v33;
  int v34;
  NSString *v35;
  void *v36;
  NSPoint v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  CGRect rect;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  CMTime v54;
  CMTime v55;
  __int128 v56;
  uint64_t v57;
  CMTime rhs;
  CMTime lhs;
  CMTime time;
  _BYTE v61[128];
  uint64_t v62;
  CGPoint v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;

  v62 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "foundPoints");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    goto LABEL_11;
  v3 = 0;
  do
  {
    objc_msgSend(*(id *)(a1 + 32), "foundPoints");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", v3);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = NSPointFromString(v5);

    objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", v3);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = NSPointFromString(v7);

    v9 = sqrt((v8.x - v6.x) * (v8.x - v6.x) + (v8.y - v6.y) * (v8.y - v6.y));
  }
  while (v9 <= 20.0 && v3++ < 3);
  if (v9 <= 20.0)
  {
    v55 = *(CMTime *)(a1 + 48);
    v11 = *(void **)(a1 + 32);
    if (v11)
      objc_msgSend(v11, "pointsFound");
    else
      memset(&v54, 0, sizeof(v54));
    lhs = v55;
    rhs = v54;
    CMTimeSubtract(&time, &lhs, &rhs);
    if (CMTimeGetSeconds(&time) > 3.0)
    {
      objc_msgSend(*(id *)(a1 + 32), "stopSession");
      objc_msgSend(*(id *)(a1 + 32), "sendDidEndWithErrorDomain:code:userInfo:", CFSTR("Core Recognition Error Domain"), 1, 0);
    }
  }
  else
  {
LABEL_11:
    objc_msgSend(*(id *)(a1 + 32), "setFoundPoints:", *(_QWORD *)(a1 + 40));
    v56 = *(_OWORD *)(a1 + 48);
    v57 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 32), "setPointsFound:", &v56);
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  *(_QWORD *)&rect.origin.y = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sessionManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "previewLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v64.origin.x = v15;
  v64.origin.y = v17;
  v64.size.width = v19;
  v64.size.height = v21;
  Width = CGRectGetWidth(v64);
  v65.origin.x = v15;
  v65.origin.y = v17;
  v65.size.width = v19;
  v65.size.height = v21;
  v23 = CGRectGetHeight(v65) / -10.0;
  v66.origin.x = v15;
  v66.origin.y = v17;
  v66.size.width = v19;
  v66.size.height = v21;
  v67 = CGRectInset(v66, Width / -10.0, v23);
  rect.origin.x = v67.origin.x;
  y = v67.origin.y;
  v25 = v67.size.width;
  height = v67.size.height;
  v52 = 0u;
  v53 = 0u;
  rect.size = 0u;
  v51 = 0u;
  v27 = *(id *)(a1 + 40);
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &rect.size, v61, 16);
  if (v28)
  {
    v29 = 0;
    v30 = *(_QWORD *)v51;
    v31 = 0.0;
    v32 = 0.0;
    do
    {
      v33 = 0;
      v34 = v29 + 1;
      v49 = v29 + v28;
      do
      {
        if (*(_QWORD *)v51 != v30)
          objc_enumerationMutation(v27);
        v35 = *(NSString **)(*(_QWORD *)&rect.size.height + 8 * v33);
        objc_msgSend(*(id *)(a1 + 32), "sessionManager");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = NSPointFromString(v35);
        objc_msgSend(*(id *)(a1 + 32), "sessionManager");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "previewLayer");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "convertCameraPoint:toLayer:flipped:", v39, 1, v37.x, v37.y);
        v41 = v40;
        v43 = v42;

        objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v41, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)&rect.origin.y, "addObject:", v44);

        v68.origin.x = rect.origin.x;
        v68.origin.y = y;
        v68.size.width = v25;
        v68.size.height = height;
        v63.x = v41;
        v63.y = v43;
        CGRectContainsPoint(v68, v63);
        v45 = 1.0 / (double)(v34 + (int)v33);
        v32 = v32 * (1.0 - v45) + v41 * v45;
        v31 = v31 * (1.0 - v45) + v43 * v45;
        ++v33;
      }
      while (v28 != v33);
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &rect.size, v61, 16);
      v29 = v49;
    }
    while (v28);
  }
  else
  {
    v31 = 0.0;
    v32 = 0.0;
  }

  if (objc_msgSend(*(id *)&rect.origin.y, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "diagnosticHUDLayer");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setBoxPoints:", *(_QWORD *)&rect.origin.y);

    objc_msgSend(*(id *)(a1 + 32), "alignmentLayer");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "animateFoundCardRect:", *(_QWORD *)&rect.origin.y);

    objc_msgSend(*(id *)(a1 + 32), "sessionManager");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "refocusOnPoint:exposure:", 0, v32, v31);

  }
}

void __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_14(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  NSString *v13;
  NSPoint v14;
  void *v15;
  NSString *v16;
  NSPoint v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  CRCameraReaderOutput *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  CRCameraReaderOutput *v34;
  void *v35;
  BOOL v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  CRCameraReaderOutputExpirationDate *v43;
  void *v44;
  BOOL v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  BOOL v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  BOOL v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  _QWORD v75[5];
  char v76;
  uint64_t v77;
  _QWORD v78[2];

  v78[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "pauseBoxLayerHideTimer");
  objc_msgSend(*(id *)(a1 + 32), "pinnedFoundInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("codeFragmentOrigins"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "pinnedFoundInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("codeOrigin"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v78, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v77 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v77, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 40), "componentsSeparatedByString:", CFSTR(" "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  if (v5 >= objc_msgSend(v3, "count"))
  {
    v11 = objc_msgSend(v4, "count");
    if (v11 <= objc_msgSend(v3, "count"))
      goto LABEL_10;
    objc_msgSend(v4, "subarrayWithRange:", 0, objc_msgSend(v3, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    for (i = 0; ; ++i)
    {
      v8 = objc_msgSend(v3, "count");
      if (i >= v8 - objc_msgSend(v4, "count"))
        break;
      objc_msgSend(v6, "addObject:", &stru_24C599708);
    }
  }

  v4 = v6;
LABEL_10:
  objc_msgSend(*(id *)(a1 + 32), "pinnedFoundInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("nameOrigin"));
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = NSPointFromString(v13);

  objc_msgSend(*(id *)(a1 + 32), "pinnedFoundInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", CFSTR("dateOrigin"));
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  v17 = NSPointFromString(v16);

  v18 = objc_msgSend(*(id *)(a1 + 32), "getFirstTimeFrameIndexForPinnedField:", CFSTR("cardholderName"));
  v19 = objc_msgSend(*(id *)(a1 + 32), "getFirstTimeFrameIndexForPinnedField:", CFSTR("expirationDate"));
  v20 = objc_msgSend(*(id *)(a1 + 32), "getFirstTimeFrameIndexForPinnedField:", CFSTR("code"));
  objc_msgSend(*(id *)(a1 + 32), "alignmentLayer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *(_QWORD *)(a1 + 48);
  v23 = *(_QWORD *)(a1 + 56);
  v75[0] = MEMORY[0x24BDAC760];
  v75[1] = 3221225472;
  v75[2] = __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_15;
  v75[3] = &unk_24C58BA58;
  v76 = *(_BYTE *)(a1 + 72);
  v75[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v21, "animateFoundCodeParts:codePartPositions:codeFrameIndex:cardHolder:cardholderPosition:cardholderFrameIndex:expDate:expdatePosition:expDateFrameIndex:completionBlock:", v4, v3, v20, v22, v18, v23, v14.x, v14.y, v17.x, v17.y, v19, v75);

  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 40), "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24C599708);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setFoundCode:", v24);

    v25 = objc_alloc_init(CRCameraReaderOutput);
    v26 = *(_QWORD *)(a1 + 64);
    -[CRCameraReaderOutput objectInternal](v25, "objectInternal");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setVertices:", v26);

    -[CRCameraReaderOutput objectInternal](v25, "objectInternal");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setType:", CFSTR("CROutputTypeCreditCardNumber"));

    v29 = *(_QWORD *)(a1 + 40);
    -[CRCameraReaderOutput objectInternal](v25, "objectInternal");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setFormattedStringValue:", v29);

    objc_msgSend(*(id *)(a1 + 32), "foundCode");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCameraReaderOutput objectInternal](v25, "objectInternal");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setStringValue:", v31);

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v25);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(*(id *)(a1 + 32), "outputObjectTypes");
    v34 = (CRCameraReaderOutput *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setWithArray:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v35, "containsObject:", CFSTR("CROutputTypeCreditCardName")))
    {
      v36 = *(_QWORD *)(a1 + 48) == 0;

      if (v36)
        goto LABEL_16;
      v34 = objc_alloc_init(CRCameraReaderOutput);
      v37 = *(_QWORD *)(a1 + 64);
      -[CRCameraReaderOutput objectInternal](v34, "objectInternal");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setVertices:", v37);

      -[CRCameraReaderOutput objectInternal](v34, "objectInternal");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setType:", CFSTR("CROutputTypeCreditCardName"));

      v40 = *(_QWORD *)(a1 + 48);
      -[CRCameraReaderOutput objectInternal](v34, "objectInternal");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setStringValue:", v40);

      objc_msgSend(v74, "addObject:", v34);
    }
    else
    {

    }
LABEL_16:
    v42 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(*(id *)(a1 + 32), "outputObjectTypes");
    v43 = (CRCameraReaderOutputExpirationDate *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setWithArray:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v44, "containsObject:", CFSTR("CRCameraReaderCreditCardExpirationDate")))
    {
      v45 = *(_QWORD *)(a1 + 56) == 0;

      if (v45)
      {
LABEL_27:
        objc_msgSend(*(id *)(a1 + 32), "sendDidEndWithInfo:", v74);

        goto LABEL_28;
      }
      v43 = objc_alloc_init(CRCameraReaderOutputExpirationDate);
      v46 = *(_QWORD *)(a1 + 64);
      -[CRCameraReaderOutput objectInternal](v43, "objectInternal");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setVertices:", v46);

      -[CRCameraReaderOutput objectInternal](v43, "objectInternal");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setType:", CFSTR("CRCameraReaderCreditCardExpirationDate"));

      v49 = *(_QWORD *)(a1 + 56);
      -[CRCameraReaderOutput objectInternal](v43, "objectInternal");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setStringValue:", v49);

      objc_msgSend(*(id *)(a1 + 32), "pinnedFoundInfo");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "objectForKey:", CFSTR("expirationYear"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v49) = v52 == 0;

      if ((v49 & 1) == 0)
      {
        v53 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(*(id *)(a1 + 32), "pinnedFoundInfo");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "objectForKey:", CFSTR("expirationYear"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "numberWithInteger:", objc_msgSend(v55, "integerValue"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRCameraReaderOutput objectInternal](v43, "objectInternal");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "setYearValue:", v56);

      }
      objc_msgSend(*(id *)(a1 + 32), "pinnedFoundInfo");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "objectForKey:", CFSTR("expirationMonth"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v59 == 0;

      if (!v60)
      {
        v61 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(*(id *)(a1 + 32), "pinnedFoundInfo");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "objectForKey:", CFSTR("expirationMonth"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "numberWithInteger:", objc_msgSend(v63, "integerValue"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRCameraReaderOutput objectInternal](v43, "objectInternal");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "setMonthValue:", v64);

      }
      objc_msgSend(*(id *)(a1 + 32), "pinnedFoundInfo");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "objectForKey:", CFSTR("expirationDay"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v67 == 0;

      if (!v68)
      {
        v69 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(*(id *)(a1 + 32), "pinnedFoundInfo");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "objectForKey:", CFSTR("expirationDay"));
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "numberWithInteger:", objc_msgSend(v71, "integerValue"));
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRCameraReaderOutput objectInternal](v43, "objectInternal");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "setDayValue:", v72);

      }
      objc_msgSend(v74, "addObject:", v43);
    }
    else
    {

    }
    goto LABEL_27;
  }
LABEL_28:

}

uint64_t __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_15(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "sendDidEndAnimation");
  return result;
}

void __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_17(uint64_t a1)
{
  int v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;

  objc_msgSend(*(id *)(a1 + 32), "sessionManager");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v21, "isFocusPointOfInterestSupported");

  v3 = 0.0;
  v4 = 0.0;
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionManager");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "focusPointOfInterest");
    v6 = v5;
    v8 = v7;

    objc_msgSend(*(id *)(a1 + 32), "sessionManager");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "cameraResolution");
    v10 = v9;
    objc_msgSend(*(id *)(a1 + 32), "sessionManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cameraResolution");
    v13 = v12;

    objc_msgSend(*(id *)(a1 + 32), "sessionManager");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sessionManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "previewLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "convertCameraPoint:toLayer:", v15, v6 * v10, v8 * v13);
    v3 = v16;
    v4 = v17;

  }
  objc_msgSend(*(id *)(a1 + 32), "diagnosticHUDLayer");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sessionManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isAdjustingFocus");
  objc_msgSend(*(id *)(a1 + 32), "sessionManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setAdjustingFocus:pointOfInterestSupported:focusPoint:", v19, objc_msgSend(v20, "isFocusPointOfInterestSupported"), v3, v4);

}

- (id)findObjectsEmbossed:(id)a3 inImage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSRect v42;
  CGRect v43;
  CGRect v44;
  NSRect v45;
  CGRect v46;
  CGRect v47;
  NSRect v48;

  v6 = a3;
  v7 = a4;
  -[CRCameraReader nameCutRects](self, "nameCutRects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCameraReader setNameCutRects:](self, "setNameCutRects:", v9);

  }
  -[CRCameraReader dateCutRects](self, "dateCutRects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCameraReader setDateCutRects:](self, "setDateCutRects:", v11);

  }
  -[CRCameraReader dateCutRects](self, "dateCutRects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (!v13)
  {
    v14 = 8;
    y = 0.670120239;
    x = 0.0475194012;
    height = 0.0707215541;
    width = 0.849705277;
    do
    {
      -[CRCameraReader dateCutRects](self, "dateCutRects");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v42.origin.x = x;
      v42.origin.y = y;
      v42.size.width = width;
      v42.size.height = height;
      NSStringFromRect(v42);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v20);

      v43.origin.x = x;
      v43.origin.y = y;
      v43.size.width = width;
      v43.size.height = height;
      v44 = CGRectOffset(v43, 0.0, 0.0353607771);
      x = v44.origin.x;
      y = v44.origin.y;
      width = v44.size.width;
      height = v44.size.height;
      --v14;
    }
    while (v14);
  }
  -[CRCameraReader nameCutRects](self, "nameCutRects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (!v22)
  {
    v23 = 8;
    v24 = 0.929278433;
    v25 = 0.0475194012;
    v26 = 0.0707215541;
    v27 = 0.849705277;
    do
    {
      -[CRCameraReader nameCutRects](self, "nameCutRects");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v45.origin.x = v25;
      v45.origin.y = v24;
      v45.size.width = v27;
      v45.size.height = v26;
      NSStringFromRect(v45);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addObject:", v29);

      v46.origin.x = v25;
      v46.origin.y = v24;
      v46.size.width = v27;
      v46.size.height = v26;
      v47 = CGRectOffset(v46, 0.0, -0.0353607771);
      v25 = v47.origin.x;
      v24 = v47.origin.y;
      v27 = v47.size.width;
      v26 = v47.size.height;
      --v23;
    }
    while (v23);
  }
  v30 = (void *)MEMORY[0x24BDBCEB8];
  v48.origin.x = 0.0209955056;
  v48.origin.y = 0.546364477;
  v48.size.width = 0.960868335;
  v48.size.height = 0.108566147;
  NSStringFromRect(v48);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "arrayWithObject:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "provideInsightValue:forKey:", v32, CFSTR("CRInsightsEmbossedRegionsNumber"));

  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCameraReader nameCutRects](self, "nameCutRects");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "provideInsightValue:forKey:", v35, CFSTR("CRInsightsEmbossedRegionsName"));

  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCameraReader dateCutRects](self, "dateCutRects");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "provideInsightValue:forKey:", v37, CFSTR("CRInsightsEmbossedRegionsExpirationDate"));

  -[CRCameraReader nameCutRects](self, "nameCutRects");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCameraReader dateCutRects](self, "dateCutRects");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCameraReader findCCObjectsEmbossed:inImage:numberRects:nameRects:dateRects:](self, "findCCObjectsEmbossed:inImage:numberRects:nameRects:dateRects:", v6, v7, v32, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

+ (id)findCodeInImage:(vImage_Buffer *)a3 maxStage:(unint64_t)a4 outputObjectTypes:(id)a5
{
  double width;
  double height;
  __int128 v7;
  _OWORD v9[2];

  width = (double)a3->width;
  height = (double)a3->height;
  v7 = *(_OWORD *)&a3->width;
  v9[0] = *(_OWORD *)&a3->data;
  v9[1] = v7;
  +[CRCameraReader findCodeInImage:maxStage:roi:outputObjectTypes:](CRCameraReader, "findCodeInImage:maxStage:roi:outputObjectTypes:", v9, a4, a5, 0.0, 0.0, width, height);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)findCodeInImage:(vImage_Buffer *)a3 maxStage:(unint64_t)a4
{
  double width;
  double height;
  void *v8;
  __int128 v9;
  void *v10;
  _OWORD v12[2];

  width = (double)a3->width;
  height = (double)a3->height;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", CFSTR("CROutputTypeiTunesCode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_OWORD *)&a3->width;
  v12[0] = *(_OWORD *)&a3->data;
  v12[1] = v9;
  +[CRCameraReader findCodeInImage:maxStage:roi:outputObjectTypes:](CRCameraReader, "findCodeInImage:maxStage:roi:outputObjectTypes:", v12, a4, v8, 0.0, 0.0, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)findCodeInImage:(vImage_Buffer *)a3 maxStage:(unint64_t)a4 roi:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v11;
  __int128 v12;
  void *v13;
  _OWORD v15[2];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", CFSTR("CROutputTypeiTunesCode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_OWORD *)&a3->width;
  v15[0] = *(_OWORD *)&a3->data;
  v15[1] = v12;
  +[CRCameraReader findCodeInImage:maxStage:roi:outputObjectTypes:](CRCameraReader, "findCodeInImage:maxStage:roi:outputObjectTypes:", v15, a4, v11, x, y, width, height);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)findCodeInImage:(vImage_Buffer *)a3 maxStage:(unint64_t)a4 roi:(CGRect)a5 outputObjectTypes:(id)a6
{
  CGFloat y;
  CGFloat x;
  unint64_t v10;
  double Current;
  void *v12;
  int v13;
  int64x2_t v14;
  int64x2_t v15;
  int CodeRectInImageWithModel;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  double v30;
  void *v31;
  int v32;
  __int128 v33;
  int v34;
  int v35;
  CFArrayRef v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  BOOL v42;
  double v43;
  size_t v44;
  uint64_t v45;
  char *v46;
  size_t v47;
  char *v48;
  int v49;
  void *v50;
  void *v51;
  unint64_t v52;
  float v53;
  double v54;
  float v55;
  void *v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v68;
  id v69;
  id v70;
  id v71;
  _OWORD v72[2];
  _OWORD v73[2];
  CFArrayRef v74;
  _OWORD v75[2];
  CGPoint v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  uint64_t v83;

  y = a5.origin.y;
  x = a5.origin.x;
  v83 = *MEMORY[0x24BDAC8D0];
  v69 = a6;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v71 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v70 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setObject:forKey:", v70, CFSTR("stageInfo"));
  if (a4)
    v10 = a4;
  else
    v10 = -1;
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v69);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", CFSTR("CROutputTypeHomeKitCode"));

  v15 = *(int64x2_t *)&a3->width;
  v75[0] = *(_OWORD *)&a3->data;
  v14.i64[1] = *((_QWORD *)&v75[0] + 1);
  v75[1] = v15;
  *(CGFloat *)v14.i64 = x;
  *(CGFloat *)v15.i64 = y;
  CodeRectInImageWithModel = _findCodeRectInImageWithModel(v75, (uint64_t)&v76, v14, v15, 95158272, v13);
  if (CodeRectInImageWithModel)
  {
    v17 = (void *)MEMORY[0x24BDBCE30];
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v76.x, v76.y);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v77, v78);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v79, v80);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v81, v82);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "arrayWithObjects:", v18, v19, v20, v21, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v71, "setObject:forKey:", v22, CFSTR("boxPoints"));
  }
  v23 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (CodeRectInImageWithModel)
    v25 = 0;
  else
    v25 = 1001;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CFAbsoluteTimeGetCurrent() - Current);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "dictionaryWithObjectsAndKeys:", v24, CFSTR("stage"), v26, CFSTR("status"), v27, CFSTR("duration"), 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "addObject:", v28);

  v29 = CodeRectInImageWithModel == 0;
  if (v10 < 2)
    v29 = 1;
  if (!v29)
  {
    v30 = CFAbsoluteTimeGetCurrent();
    v74 = 0;
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v69);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "containsObject:", CFSTR("CROutputTypeHomeKitCode"));

    v33 = *(_OWORD *)&a3->width;
    if (v32)
    {
      v73[0] = *(_OWORD *)&a3->data;
      v73[1] = v33;
      v34 = _segmentHomeKitCodeImages(v73, &v76, &v74);
    }
    else
    {
      v72[0] = *(_OWORD *)&a3->data;
      v72[1] = v33;
      v34 = _segmentCodeImages(v72, &v76, &v74);
    }
    v35 = v34;
    v36 = v74;
    v37 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CFAbsoluteTimeGetCurrent() - v30);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "dictionaryWithObjectsAndKeys:", v38, CFSTR("stage"), v39, CFSTR("status"), v40, CFSTR("duration"), 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "addObject:", v41);

    v42 = v35 == 0;
    if (v10 < 3)
      v42 = 1;
    if (!v42)
    {
      v43 = CFAbsoluteTimeGetCurrent();
      v44 = -[__CFArray count](v36, "count");
      v45 = MEMORY[0x24BDAC7A8]();
      v46 = (char *)&v68 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
      v47 = 4 * v45;
      MEMORY[0x24BDAC7A8]();
      v48 = (char *)&v68 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v46, v44);
      bzero(v48, v47);
      v49 = _recognizeCodeImages(v36, v46, (int *)v48, 0.0);
      if (v49)
      {
        v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v46, v44, 1);
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = 0;
        v53 = 1.0;
        while (objc_msgSend(v50, "length") > v52)
        {
          v55 = *(float *)&v48[4 * v52];
          *(float *)&v54 = v55;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v54);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "addObject:", v56);

          v53 = v53 * v55;
          ++v52;
        }
        objc_msgSend(v71, "setObject:forKey:", v50, CFSTR("code"));
        objc_msgSend(v71, "setObject:forKey:", v51, CFSTR("thresholds"));
        *(float *)&v57 = v53;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "setObject:forKey:", v58, CFSTR("confidence"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v53 > 0.9, v53);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "setObject:forKey:", v59, CFSTR("accepted"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v49 == 2);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "setObject:forKey:", v60, CFSTR("inverted"));

      }
      v61 = (void *)MEMORY[0x24BDBCE70];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 3);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      if (v49)
        v63 = 0;
      else
        v63 = 1003;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CFAbsoluteTimeGetCurrent() - v43);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "dictionaryWithObjectsAndKeys:", v62, CFSTR("stage"), v64, CFSTR("status"), v65, CFSTR("duration"), 0);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "addObject:", v66);

    }
  }

  return v71;
}

+ (id)textFeatureWithVNTextObservation:(id)a3
{
  id v3;
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;
  NSRect v36;
  NSRect v37;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "boundingBox");
  v5 = v4;
  objc_msgSend(v3, "boundingBox");
  v7 = v6;
  objc_msgSend(v3, "boundingBox");
  v9 = v8;
  objc_msgSend(v3, "boundingBox");
  v11 = v10;
  objc_msgSend(v3, "boundingBox");
  v36.origin.y = 1.0 - v7 - v9;
  v36.origin.x = v5;
  v36.size.width = v11;
  NSStringFromRect(v36);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(v3, "characterBoxes", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v31 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v18, "boundingBox");
        v20 = v19;
        objc_msgSend(v18, "boundingBox");
        v22 = v21;
        objc_msgSend(v18, "boundingBox");
        v24 = v23;
        objc_msgSend(v18, "boundingBox");
        v26 = v25;
        objc_msgSend(v18, "boundingBox");
        v37.origin.y = 1.0 - v22 - v24;
        v37.origin.x = v20;
        v37.size.width = v26;
        NSStringFromRect(v37);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v27);

      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v15);
  }

  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB5B98]), "initWithFeatureRect:subFeatureRects:", v12, v13);
  return v28;
}

+ (id)targetRectsForImage:(id)a3
{
  id v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  float v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  unint64_t v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  unint64_t v64;
  void *v65;
  double v66;
  void *v67;
  void *v68;
  double v69;
  void *v70;
  double v71;
  void *v72;
  double v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  char *v80;
  void *v81;
  void *v82;
  void *v83;
  float v84;
  uint64_t v85;
  void *v86;
  void *v87;
  double v88;
  double v89;
  double v90;
  double v91;
  void *v92;
  double v93;
  double v94;
  void *v95;
  double v96;
  double v97;
  double v98;
  double v99;
  void *v100;
  double v101;
  double v102;
  double v103;
  double v104;
  void *v105;
  double v106;
  double v107;
  double v108;
  double v109;
  void *v110;
  double v111;
  double v112;
  double v113;
  double v114;
  float v115;
  float v116;
  float v117;
  float v118;
  float v119;
  void *v120;
  double v121;
  CGFloat v122;
  double v123;
  CGFloat v124;
  double v125;
  CGFloat v126;
  double v127;
  CGFloat v128;
  double v129;
  double v130;
  double v131;
  CGFloat v132;
  CGFloat v133;
  void *v134;
  id v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t j;
  double v139;
  CGFloat v140;
  double v141;
  CGFloat v142;
  double v143;
  CGFloat v144;
  double v145;
  CGFloat v146;
  double v147;
  double v148;
  double v149;
  CGFloat v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v156;
  id v157;
  id v158;
  id v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  double v180;
  void *aRect;
  double aRectb;
  CGFloat aRecta;
  char *v184;
  double v185;
  CGFloat v186;
  unint64_t v187;
  double v188;
  CGFloat v189;
  id v190;
  void *v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  id v200;
  _BYTE v201[128];
  _BYTE v202[128];
  _QWORD v203[3];
  CGRect v204;
  CGRect v205;
  NSRect v206;
  CGRect v207;
  CGRect v208;
  CGRect v209;
  CGRect v210;
  CGRect v211;
  CGRect v212;
  CGRect v213;
  CGRect v214;
  CGRect v215;
  CGRect v216;
  CGRect v217;
  CGRect v218;
  CGRect v219;
  CGRect v220;
  CGRect v221;
  CGRect v222;
  CGRect v223;
  CGRect v224;
  CGRect v225;
  CGRect v226;
  CGRect v227;
  CGRect v228;
  CGRect v229;
  CGRect v230;
  CGRect v231;
  CGRect v232;
  CGRect v233;
  CGRect v234;
  CGRect v235;
  CGRect v236;
  CGRect v237;
  CGRect v238;
  CGRect v239;
  CGRect v240;
  CGRect v241;
  CGRect v242;
  CGRect v243;
  CGRect v244;
  CGRect v245;
  CGRect v246;
  NSRect v247;

  v203[1] = *MEMORY[0x24BDAC8D0];
  v157 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v190 = (id)objc_claimAutoreleasedReturnValue();
  v159 = v157;
  v3 = objc_alloc(MEMORY[0x24BDF9C28]);
  v160 = (void *)objc_msgSend(v3, "initWithCIImage:options:", v159, MEMORY[0x24BDBD1B8]);
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("com.apple.CoreRecognition.enable_vn_detector"));

  v6 = objc_alloc_init(MEMORY[0x24BDF9BA0]);
  v7 = v6;
  if (v5)
    v8 = 2;
  else
    v8 = 1;
  v161 = v6;
  objc_msgSend(v6, "setAlgorithm:", v8);
  objc_msgSend(v7, "setReportCharacterBoxes:", 1);
  objc_msgSend(v7, "setDetectDiacritics:", 0);
  v203[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v203, 1);
  v9 = (char *)objc_claimAutoreleasedReturnValue();
  v200 = 0;
  objc_msgSend(v160, "performRequests:error:", v9, &v200);
  v158 = v200;

  objc_msgSend(v161, "results");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  if (v162 && objc_msgSend(v162, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    v198 = 0u;
    v199 = 0u;
    v196 = 0u;
    v197 = 0u;
    v10 = v162;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v196, v202, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v197;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v197 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend((id)objc_opt_class(), "textFeatureWithVNTextObservation:", *(_QWORD *)(*((_QWORD *)&v196 + 1) + 8 * i));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "subFeatures");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = (char *)objc_msgSend(v15, "count");

          if ((unint64_t)(v9 - 4) <= 0x18)
          {
            if ((unint64_t)objc_msgSend(v190, "count") <= 0x13)
            {
              objc_msgSend(v14, "bounds");
              v17 = v16;
              v19 = v18;
              v21 = v20;
              v23 = v22;
              objc_msgSend(v14, "bounds");
              v25 = v24;
              objc_msgSend(v14, "bounds");
              v27 = v26 * -0.100000001;
              v204.origin.x = v17;
              v204.origin.y = v19;
              v204.size.width = v21;
              v204.size.height = v23;
              v205 = CGRectInset(v204, v25 * -0.0500000007, v27);
              x = v205.origin.x;
              y = v205.origin.y;
              width = v205.size.width;
              height = v205.size.height;
              objc_msgSend(v14, "setShouldExpandToFullWidth:", 1);
              v32 = (void *)MEMORY[0x24BDBCE70];
              v206.origin.x = x;
              v206.origin.y = y;
              v206.size.width = width;
              v206.size.height = height;
              NSStringFromRect(v206);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "dictionaryWithObjectsAndKeys:", v33, CFSTR("paddedRect"), v14, CFSTR("textFeatures"), 0);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v190, "addObject:", v34);

            }
            if (v9 == (char *)4)
              objc_msgSend(v191, "addObject:", v14);
          }

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v196, v202, 16);
      }
      while (v11);
    }

    if ((unint64_t)objc_msgSend(v191, "count") >= 4)
    {
      objc_msgSend(v191, "sortUsingComparator:", &__block_literal_global_241);
      objc_msgSend(v191, "subarrayWithRange:", 0, 4);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      v36 = 3.4028e38;
      while (objc_msgSend(v191, "count") - 3 > v35)
      {
        objc_msgSend(v191, "objectAtIndexedSubscript:", v35);
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v177, "bounds");
        v37 = CGRectGetWidth(v207);
        objc_msgSend(v191, "objectAtIndexedSubscript:", v35);
        v176 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v176, "bounds");
        v38 = CGRectGetHeight(v208);
        v187 = v35 + 1;
        objc_msgSend(v191, "objectAtIndexedSubscript:");
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v175, "bounds");
        v39 = CGRectGetWidth(v209);
        objc_msgSend(v191, "objectAtIndexedSubscript:", v35 + 1);
        v174 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v174, "bounds");
        v40 = v37 * v38 - v39 * CGRectGetHeight(v210);
        objc_msgSend(v191, "objectAtIndexedSubscript:", v35);
        if (v40 < 0.0)
        {
          v169 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v169, "bounds");
          v45 = CGRectGetWidth(v215);
          objc_msgSend(v191, "objectAtIndexedSubscript:", v35);
          v165 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v165, "bounds");
          v46 = CGRectGetHeight(v216);
          objc_msgSend(v191, "objectAtIndexedSubscript:", v187);
          v164 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v164, "bounds");
          v47 = CGRectGetWidth(v217);
          objc_msgSend(v191, "objectAtIndexedSubscript:", v187);
          v163 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v163, "bounds");
          v44 = -(v45 * v46 - v47 * CGRectGetHeight(v218));
        }
        else
        {
          v168 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v168, "bounds");
          v41 = CGRectGetWidth(v211);
          objc_msgSend(v191, "objectAtIndexedSubscript:", v35);
          v167 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v167, "bounds");
          v42 = CGRectGetHeight(v212);
          objc_msgSend(v191, "objectAtIndexedSubscript:", v187);
          v166 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v166, "bounds");
          v43 = CGRectGetWidth(v213);
          objc_msgSend(v191, "objectAtIndexedSubscript:", v187);
          v9 = (char *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "bounds");
          v44 = v41 * v42 - v43 * CGRectGetHeight(v214);
        }
        v184 = v9;
        objc_msgSend(v191, "objectAtIndexedSubscript:", v187);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "bounds");
        v49 = CGRectGetWidth(v219);
        objc_msgSend(v191, "objectAtIndexedSubscript:", v187);
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v173, "bounds");
        v50 = CGRectGetHeight(v220);
        v51 = v35 + 2;
        objc_msgSend(v191, "objectAtIndexedSubscript:", v35 + 2);
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v172, "bounds");
        v52 = CGRectGetWidth(v221);
        objc_msgSend(v191, "objectAtIndexedSubscript:", v35 + 2);
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v171, "bounds");
        if (v49 * v50 - v52 * CGRectGetHeight(v222) < 0.0)
        {
          objc_msgSend(v191, "objectAtIndexedSubscript:", v187);
          aRect = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(aRect, "bounds");
          v58 = CGRectGetWidth(v227);
          objc_msgSend(v191, "objectAtIndexedSubscript:", v187);
          v179 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v179, "bounds");
          v59 = CGRectGetHeight(v228);
          objc_msgSend(v191, "objectAtIndexedSubscript:", v35 + 2);
          v178 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v178, "bounds");
          v60 = CGRectGetWidth(v229);
          objc_msgSend(v191, "objectAtIndexedSubscript:", v35 + 2);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "bounds");
          v57 = -(v58 * v59 - v60 * CGRectGetHeight(v230));
        }
        else
        {
          objc_msgSend(v191, "objectAtIndexedSubscript:", v187);
          aRect = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(aRect, "bounds");
          v53 = CGRectGetWidth(v223);
          objc_msgSend(v191, "objectAtIndexedSubscript:", v187);
          v179 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v179, "bounds");
          v54 = CGRectGetHeight(v224);
          objc_msgSend(v191, "objectAtIndexedSubscript:", v35 + 2);
          v178 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v178, "bounds");
          v55 = CGRectGetWidth(v225);
          objc_msgSend(v191, "objectAtIndexedSubscript:", v35 + 2);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "bounds");
          v57 = v53 * v54 - v55 * CGRectGetHeight(v226);
        }
        objc_msgSend(v191, "objectAtIndexedSubscript:", v35 + 2);
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v170, "bounds");
        v61 = CGRectGetWidth(v231);
        objc_msgSend(v191, "objectAtIndexedSubscript:", v35 + 2);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "bounds");
        v63 = CGRectGetHeight(v232);
        v64 = v35 + 3;
        objc_msgSend(v191, "objectAtIndexedSubscript:", v35 + 3);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "bounds");
        v66 = CGRectGetWidth(v233);
        objc_msgSend(v191, "objectAtIndexedSubscript:", v64);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "bounds");
        if (v61 * v63 - v66 * CGRectGetHeight(v234) >= 0.0)
        {
          objc_msgSend(v191, "objectAtIndexedSubscript:", v51);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "bounds");
          v77 = CGRectGetWidth(v239);
          objc_msgSend(v191, "objectAtIndexedSubscript:", v51);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "bounds");
          v78 = CGRectGetHeight(v240);
          objc_msgSend(v191, "objectAtIndexedSubscript:", v64);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "bounds");
          v79 = CGRectGetWidth(v241);
          objc_msgSend(v191, "objectAtIndexedSubscript:", v64);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "bounds");
          v75 = v48;
          v76 = v77 * v78 - v79 * CGRectGetHeight(v242);
        }
        else
        {
          objc_msgSend(v191, "objectAtIndexedSubscript:", v51);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "bounds");
          v69 = CGRectGetWidth(v235);
          objc_msgSend(v191, "objectAtIndexedSubscript:", v51);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "bounds");
          v71 = CGRectGetHeight(v236);
          objc_msgSend(v191, "objectAtIndexedSubscript:", v64);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "bounds");
          v73 = CGRectGetWidth(v237);
          objc_msgSend(v191, "objectAtIndexedSubscript:", v64);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "bounds");
          v75 = v48;
          v76 = -(v69 * v71 - v73 * CGRectGetHeight(v238));
        }

        v80 = v184;
        v82 = v166;
        v81 = v167;
        v83 = v168;
        if (v40 < 0.0)
        {
          v80 = (char *)v163;
          v82 = v164;
          v81 = v165;
          v83 = v169;
        }

        v84 = v44 + v57 + v76;
        v9 = v184;
        v35 = v187;
        if (v36 > v84)
        {
          objc_msgSend(v191, "subarrayWithRange:", v187 - 1, 4);
          v85 = objc_claimAutoreleasedReturnValue();

          v156 = (void *)v85;
          v36 = v84;
          v9 = v184;
          v35 = v187;
        }
      }
      objc_msgSend(v156, "sortedArrayUsingComparator:", &__block_literal_global_242);
      v86 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v86, "objectAtIndexedSubscript:", 0);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "bounds");
      v89 = v88;
      v91 = v90;
      objc_msgSend(v86, "objectAtIndexedSubscript:", 1);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v185 = v91;
      v188 = v89;
      objc_msgSend(v92, "bounds");
      v180 = v94;
      aRectb = v93;

      objc_msgSend(v86, "objectAtIndexedSubscript:", 1);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "bounds");
      v97 = v96;
      v99 = v98;
      objc_msgSend(v86, "objectAtIndexedSubscript:", 2);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "bounds");
      v102 = v101;
      v104 = v103;

      objc_msgSend(v86, "objectAtIndexedSubscript:", 2);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "bounds");
      v107 = v106;
      v109 = v108;
      objc_msgSend(v86, "objectAtIndexedSubscript:", 3);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "bounds");
      v112 = v111;
      v114 = v113;

      v115 = (v185 - v180) * (v185 - v180) + (v188 - aRectb) * (v188 - aRectb);
      v116 = sqrtf(v115);
      v117 = (v99 - v104) * (v99 - v104) + (v97 - v102) * (v97 - v102);
      v118 = sqrtf(v117);
      if (vabds_f32(v116, v118) < 0.01)
      {
        v119 = (v109 - v114) * (v109 - v114) + (v107 - v112) * (v107 - v112);
        if (vabds_f32(v118, sqrtf(v119)) < 0.01)
        {
          v120 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB5BA0]), "initWithOrderedFeatures:", v86);
          objc_msgSend(v120, "bounds");
          v122 = v121;
          v124 = v123;
          v126 = v125;
          v128 = v127;
          objc_msgSend(v120, "bounds");
          v130 = v129;
          objc_msgSend(v120, "bounds");
          v132 = v131 * -0.100000001;
          v243.origin.x = v122;
          v243.origin.y = v124;
          v243.size.width = v126;
          v243.size.height = v128;
          v244 = CGRectInset(v243, v130 * -0.0500000007, v132);
          v186 = v244.origin.y;
          v189 = v244.origin.x;
          aRecta = v244.size.width;
          v133 = v244.size.height;
          objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v86, "count"));
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          v194 = 0u;
          v195 = 0u;
          v192 = 0u;
          v193 = 0u;
          v135 = v86;
          v136 = objc_msgSend(v135, "countByEnumeratingWithState:objects:count:", &v192, v201, 16);
          if (v136)
          {
            v137 = *(_QWORD *)v193;
            do
            {
              for (j = 0; j != v136; ++j)
              {
                if (*(_QWORD *)v193 != v137)
                  objc_enumerationMutation(v135);
                objc_msgSend(*(id *)(*((_QWORD *)&v192 + 1) + 8 * j), "bounds");
                v140 = v139;
                v142 = v141;
                v144 = v143;
                v146 = v145;
                objc_msgSend(v120, "bounds");
                v148 = v147;
                objc_msgSend(v120, "bounds");
                v150 = v149 * -0.100000001;
                v245.origin.x = v140;
                v245.origin.y = v142;
                v245.size.width = v144;
                v245.size.height = v146;
                v246 = CGRectInset(v245, v148 * -0.0500000007, v150);
                NSStringFromRect(v246);
                v151 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v134, "addObject:", v151);

              }
              v136 = objc_msgSend(v135, "countByEnumeratingWithState:objects:count:", &v192, v201, 16);
            }
            while (v136);
          }

          v152 = (void *)MEMORY[0x24BDBCE70];
          v247.origin.y = v186;
          v247.origin.x = v189;
          v247.size.width = aRecta;
          v247.size.height = v133;
          NSStringFromRect(v247);
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v152, "dictionaryWithObjectsAndKeys:", v153, CFSTR("paddedRect"), v134, CFSTR("paddedRects"), v120, CFSTR("textFeatures"), 0);
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v190, "addObject:", v154);

        }
      }

    }
  }

  return v190;
}

uint64_t __38__CRCameraReader_targetRectsForImage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double Width;
  double Height;
  double v8;
  uint64_t v9;
  CGRect v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "bounds");
  Width = CGRectGetWidth(v11);
  objc_msgSend(v4, "bounds");
  Height = CGRectGetHeight(v12);
  objc_msgSend(v5, "bounds");
  v8 = CGRectGetWidth(v13);
  objc_msgSend(v5, "bounds");
  if (Width * Height < v8 * CGRectGetHeight(v14))
    v9 = 1;
  else
    v9 = -1;

  return v9;
}

uint64_t __38__CRCameraReader_targetRectsForImage___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(a2, "bounds");
  v6 = v5;
  objc_msgSend(v4, "bounds");
  if (v6 >= v7)
    v8 = 1;
  else
    v8 = -1;

  return v8;
}

- (id)findCCObjectEmbossed:(id)a3 inImage:(id)a4 forRect:(id)a5
{
  id v8;
  id v9;
  double x;
  double y;
  double width;
  double height;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  float v17;
  double v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v8 = a3;
  v9 = a4;
  v28 = NSRectFromString((NSString *)a5);
  x = v28.origin.x;
  y = v28.origin.y;
  width = v28.size.width;
  height = v28.size.height;
  v14 = objc_msgSend(v9, "height");
  v15 = objc_msgSend(v9, "width");
  v16 = objc_msgSend(v9, "height");
  v17 = 28.0 / (height * (double)v14);
  v18 = v17;
  v29.size.width = v18 * (double)v15;
  v29.size.height = v18 * (double)v16;
  v29.origin.x = 0.0;
  v29.origin.y = 0.0;
  v30 = CGRectIntegral(v29);
  objc_msgSend(v9, "imageByScalingToWidth:height:", (unint64_t)v30.size.width, (unint64_t)v30.size.height, v30.origin.x, v30.origin.y);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "width");
  v21 = objc_msgSend(v19, "width");
  v22 = objc_msgSend(v19, "height");
  v23 = objc_msgSend(v19, "height");
  v31.origin.x = x * (double)v20;
  v31.size.width = width * (double)v21;
  v31.origin.y = y * (double)v22;
  v31.size.height = height * (double)v23;
  v32 = CGRectIntegral(v31);
  *(float *)&v32.size.width = v32.size.width * 0.125;
  objc_msgSend(v19, "imageByCroppingRectangle:", v32.origin.x, v32.origin.y, (float)((float)(ceilf(*(float *)&v32.size.width) * 8.0) + -5.0), 28.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("CROutputTypeCreditCardName")))
  {
    -[CRCameraReader findCCNameInImageEmbossed:](self, "findCCNameInImageEmbossed:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v8, "isEqualToString:", CFSTR("CRCameraReaderCreditCardExpirationDate")))
    {
      v26 = 0;
      goto LABEL_7;
    }
    -[CRCameraReader findCCExpDateInImageEmbossed:](self, "findCCExpDateInImageEmbossed:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v25;
LABEL_7:

  return v26;
}

- (id)findObjectsFlat:(id)a3 inImage:(id)a4 numberRects:(id)a5 invert:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  BOOL v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  BOOL v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  BOOL v52;
  void *v53;
  void *v54;
  void *v55;
  BOOL v56;
  void *v57;
  void *v58;
  BOOL v59;
  void *v60;
  void *v61;
  BOOL v62;
  void *v63;
  void *v64;
  BOOL v65;
  int v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  void *v77;
  void *v78;
  BOOL v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  _BOOL4 v85;
  void *v86;
  void *v87;
  int v88;
  void *v89;
  void *v90;
  double v91;
  void *v92;
  void *v93;
  void *v94;
  double v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  int v100;
  void *v101;
  void *v102;
  void *v103;
  id v105;
  void *v106;
  id v107;
  void *v108;
  void *v109;
  id v110;
  void *v111;
  id v112;
  void *v113;
  void *v114;
  void *v115;
  int v116;
  int v117;
  id obj;
  void *v119;
  void *v120;
  int v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  void *v125;
  void *v126;
  uint64_t i;
  void *v128;
  id v129;
  void *v130;
  void *v131;
  _QWORD v132[4];
  id v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  _QWORD v142[4];
  id v143;
  CRCameraReader *v144;
  id v145;
  id v146;
  BOOL v147;
  BOOL v148;
  _BYTE v149[128];
  _BYTE v150[128];
  uint64_t v151;

  v6 = a6;
  v151 = *MEMORY[0x24BDAC8D0];
  v112 = a3;
  v10 = a4;
  v110 = a5;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("com.apple.CoreRecognition.show_engine_name"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = objc_msgSend(v12, "BOOLValue");

  v13 = objc_msgSend(v10, "height");
  v14 = v13 > objc_msgSend(v10, "width");
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v112);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v129 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("isDetectedRect"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "setObject:forKey:", v15, CFSTR("isPortrait"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "setObject:forKey:", v16, CFSTR("inverted"));

  v121 = objc_msgSend(v111, "containsObject:", CFSTR("CROutputTypeCreditCardName"));
  v117 = objc_msgSend(v111, "containsObject:", CFSTR("CRCameraReaderCreditCardExpirationDate"));
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "takeContextSnapshot");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v142[0] = MEMORY[0x24BDAC760];
  v142[1] = 3221225472;
  v142[2] = __61__CRCameraReader_findObjectsFlat_inImage_numberRects_invert___block_invoke;
  v142[3] = &unk_24C58BB08;
  v147 = v14;
  v107 = v18;
  v143 = v107;
  v144 = self;
  v105 = v10;
  v145 = v105;
  v148 = v6;
  v19 = v109;
  v146 = v19;
  objc_msgSend(v110, "enumerateObjectsWithOptions:usingBlock:", 1, v142);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    +[CRInsights sharedInsights](CRInsights, "sharedInsights", v105, v107);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "allowOverrideWithKey:forResultFromBlock:", CFSTR("kCROverrideShouldRunOffline"), &__block_literal_global_267);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0, v105, v107);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v22;
  }
  if (objc_msgSend(v22, "BOOLValue"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v131 = 0;
  }
  if (v20)

  v140 = 0u;
  v141 = 0u;
  v138 = 0u;
  v139 = 0u;
  obj = v19;
  v123 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v138, v150, 16);
  if (v123)
  {
    v122 = *(_QWORD *)v139;
    do
    {
      for (i = 0; i != v123; ++i)
      {
        if (*(_QWORD *)v139 != v122)
          objc_enumerationMutation(obj);
        v23 = *(id *)(*((_QWORD *)&v138 + 1) + 8 * i);
        objc_msgSend(v23, "objectForKey:", CFSTR("Cardholder"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v130 = (void *)objc_msgSend(v24, "mutableCopy");

        objc_msgSend(v23, "objectForKey:", CFSTR("Expiration"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v128 = (void *)objc_msgSend(v25, "mutableCopy");

        +[CRInsights sharedInsights](CRInsights, "sharedInsights");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          +[CRInsights sharedInsights](CRInsights, "sharedInsights");
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v125, "allowOverrideWithKey:forResultFromBlock:", CFSTR("kCROverrideShouldRunOffline"), &__block_literal_global_268);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v124 = v27;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v126 = v27;
        }
        v28 = objc_msgSend(v27, "BOOLValue");
        v29 = v126;
        if (v26)
        {

          v29 = v125;
        }

        if (v28)
        {
          objc_msgSend(v23, "objectForKey:", CFSTR("cardnumberFragmented"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
            objc_msgSend(v23, "objectForKey:", CFSTR("cardnumberFragmented"));
          else
            objc_msgSend(v23, "objectForKey:", CFSTR("CardNumber"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          v136 = 0u;
          v137 = 0u;
          v134 = 0u;
          v135 = 0u;
          v32 = v31;
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v134, v149, 16);
          if (v33)
          {
            v34 = *(_QWORD *)v135;
            do
            {
              for (j = 0; j != v33; ++j)
              {
                if (*(_QWORD *)v135 != v34)
                  objc_enumerationMutation(v32);
                v36 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v134 + 1) + 8 * j), "mutableCopy");
                objc_msgSend(v36, "objectForKey:", CFSTR("code"));
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = v37 == 0;

                if (!v38)
                {
                  objc_msgSend(v23, "objectForKey:", CFSTR("fieldCutRect"));
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "setObject:forKey:", v39, CFSTR("numberCutRect"));

                  objc_msgSend(v23, "objectForKey:", CFSTR("codeOrigin"));
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "setObject:forKey:", v40, CFSTR("codeOrigin"));

                  objc_msgSend(v23, "objectForKey:", CFSTR("codeFragmentOrigins"));
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v41)
                    objc_msgSend(v36, "setObject:forKey:", v41, CFSTR("codeFragmentOrigins"));
                  objc_msgSend(v131, "addObject:", v36);

                }
              }
              v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v134, v149, 16);
            }
            while (v33);
          }

        }
        objc_msgSend(v23, "objectForKey:", CFSTR("code"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v42 == 0;

        if (!v43)
        {
          objc_msgSend(v23, "objectForKey:", CFSTR("code"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v129, "setObject:forKey:", v44, CFSTR("code"));

          objc_msgSend(v23, "objectForKey:", CFSTR("accepted"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v129, "setObject:forKey:", v45, CFSTR("accepted"));

          objc_msgSend(v23, "objectForKey:", CFSTR("codeOrigin"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v129, "setObject:forKey:", v46, CFSTR("codeOrigin"));

          objc_msgSend(v23, "objectForKey:", CFSTR("codeFragmentOrigins"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          if (v47)
            objc_msgSend(v129, "setObject:forKey:", v47, CFSTR("codeFragmentOrigins"));
          goto LABEL_38;
        }
        if (v128)
          v48 = v117;
        else
          v48 = 0;
        if (v48 == 1)
        {
          objc_msgSend(v23, "objectForKey:", CFSTR("fieldCutRect"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v128, "setObject:forKey:", v49, CFSTR("expDateCutRect"));

          objc_msgSend(v23, "objectForKey:", CFSTR("dateOrigin"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v128, "setObject:forKey:", v50, CFSTR("dateOrigin"));

          objc_msgSend(v114, "addObject:", v128);
          objc_msgSend(v128, "objectForKey:", CFSTR("expDateAccepted"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = v51 == 0;

          if (!v52)
          {
            objc_msgSend(v128, "objectForKey:", CFSTR("expirationDate"));
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v129, "setObject:forKey:", v53, CFSTR("expirationDate"));

            +[CRInsights sharedInsights](CRInsights, "sharedInsights");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "provideInsightValue:forKey:", v128, CFSTR("expirationDate"));

            objc_msgSend(v128, "objectForKey:", CFSTR("expirationYear"));
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = v55 == 0;

            if (!v56)
            {
              objc_msgSend(v128, "objectForKey:", CFSTR("expirationYear"));
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v129, "setObject:forKey:", v57, CFSTR("expirationYear"));

            }
            objc_msgSend(v128, "objectForKey:", CFSTR("expirationMonth"));
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = v58 == 0;

            if (!v59)
            {
              objc_msgSend(v128, "objectForKey:", CFSTR("expirationMonth"));
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v129, "setObject:forKey:", v60, CFSTR("expirationMonth"));

            }
            objc_msgSend(v128, "objectForKey:", CFSTR("expirationDay"));
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = v61 == 0;

            if (!v62)
            {
              objc_msgSend(v128, "objectForKey:", CFSTR("expirationDay"));
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v129, "setObject:forKey:", v63, CFSTR("expirationDay"));

            }
            objc_msgSend(v128, "objectForKey:", CFSTR("dateOrigin"));
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = v64 == 0;

            if (!v65)
            {
              objc_msgSend(v128, "objectForKey:", CFSTR("dateOrigin"));
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v129, "setObject:forKey:", v47, CFSTR("dateOrigin"));
LABEL_38:

            }
          }
        }
        if (v130)
          v66 = v121;
        else
          v66 = 0;
        if (v66 == 1)
        {
          objc_msgSend(v130, "objectForKey:", CFSTR("nameResult"));
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", isValidNameString(v67));
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v130, "setObject:forKey:", v68, CFSTR("isValidNameString"));

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", isNonNameString(v67));
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v130, "setObject:forKey:", v69, CFSTR("isNonNameString"));

          objc_msgSend(v23, "objectForKey:", CFSTR("fieldCutRect"));
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v130, "setObject:forKey:", v70, CFSTR("nameCutRect"));

          objc_msgSend(v23, "objectForKey:", CFSTR("nameOrigin"));
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v130, "setObject:forKey:", v71, CFSTR("nameOrigin"));

          +[CRInsights sharedInsights](CRInsights, "sharedInsights");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          if (v72)
          {
            +[CRInsights sharedInsights](CRInsights, "sharedInsights");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v132[0] = MEMORY[0x24BDAC760];
            v132[1] = 3221225472;
            v132[2] = __61__CRCameraReader_findObjectsFlat_inImage_numberRects_invert___block_invoke_4;
            v132[3] = &unk_24C58B9C0;
            v133 = v130;
            objc_msgSend(v73, "allowOverrideWithKey:forResultFromBlock:", CFSTR("kCROverrideShouldRunOffline"), v132);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            v120 = v74;
          }
          else
          {
            v75 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v130, "objectForKey:", CFSTR("isNonNameString"));
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "numberWithBool:", objc_msgSend(v73, "BOOLValue") ^ 1);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            v119 = v74;
          }
          v76 = objc_msgSend(v74, "BOOLValue");
          v77 = v119;
          if (v72)
            v77 = v120;

          if (v76)
            objc_msgSend(v115, "addObject:", v130);
          if (v72)

          objc_msgSend(v130, "objectForKey:", CFSTR("nameAccepted"));
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = v78 == 0;

          if (!v79)
          {
            if (v116)
              objc_msgSend(v130, "objectForKey:", CFSTR("nameResult"));
            else
              objc_msgSend(v130, "objectForKey:", CFSTR("closestNameMatch"));
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v130, "setObject:forKey:", v80, CFSTR("cardholderName"));

            objc_msgSend(v130, "objectForKey:", CFSTR("cardholderName"));
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v129, "setObject:forKey:", v81, CFSTR("cardholderName"));

            objc_msgSend(v23, "objectForKey:", CFSTR("fieldCutRect"));
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v129, "setObject:forKey:", v82, CFSTR("nameCutRect"));

            objc_msgSend(v23, "objectForKey:", CFSTR("nameOrigin"));
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v129, "setObject:forKey:", v83, CFSTR("nameOrigin"));

          }
        }
        objc_msgSend(v129, "objectForKey:", CFSTR("cardholderName"));
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = v84 == 0;

        if (v85)
        {
          objc_msgSend(v130, "objectForKey:", CFSTR("nameResult"));
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v130, "objectForKey:", CFSTR("isValidNameString"));
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = objc_msgSend(v87, "BOOLValue");

          if (v88)
          {
            objc_msgSend(v129, "setObject:forKey:", v86, CFSTR("cardholderName"));
            +[CRInsights sharedInsights](CRInsights, "sharedInsights");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "provideInsightValue:forKey:", v86, CFSTR("nameResults"));

          }
        }

      }
      v123 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v138, v150, 16);
    }
    while (v123);
  }

  v90 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v113, "timeIntervalSinceNow");
  objc_msgSend(v90, "numberWithDouble:", -v91);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "setObject:forKey:", v92, CFSTR("recognitionTime"));

  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v113, "timeIntervalSinceNow");
  objc_msgSend(v94, "numberWithDouble:", -v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "provideInsightValue:forKey:", v96, CFSTR("recognitionTime"));

  objc_msgSend(v129, "setObject:forKey:", v114, CFSTR("expDateResults"));
  objc_msgSend(v129, "setObject:forKey:", v115, CFSTR("nameResults"));
  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  if (v97)
  {
    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "allowOverrideWithKey:forResultFromBlock:", CFSTR("kCROverrideShouldRunOffline"), &__block_literal_global_281);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = v99;
  }
  v100 = objc_msgSend(v99, "BOOLValue");
  if (v97)

  if (v100)
    objc_msgSend(v129, "setObject:forKey:", v131, CFSTR("numberResults"));
  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "provideInsightValue:forKey:", v131, CFSTR("numberResults"));

  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "provideInsightValue:forKey:", v114, CFSTR("expDateResults"));

  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "provideInsightValue:forKey:", v115, CFSTR("nameResults"));

  return v129;
}

void __61__CRCameraReader_findObjectsFlat_inImage_numberRects_invert___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double x;
  double y;
  CGFloat width;
  double height;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  float v21;
  float v22;
  void *v23;
  void *v24;
  float v25;
  float v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t i;
  NSString *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  float v42;
  float v43;
  void *v44;
  id v45;
  double v46;
  NSString *v47;
  id v48;
  NSPoint v49;
  NSPoint v50;
  NSPoint v51;
  NSPoint v52;
  NSPoint v53;
  NSRect v54;
  NSRect v55;
  NSRect v56;

  v48 = a2;
  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachContextCopyToCurrentThread:", *(_QWORD *)(a1 + 32));

  objc_msgSend(v48, "objectForKey:", CFSTR("paddedRect"));
  v47 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "objectForKey:", CFSTR("textFeatures"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = NSRectFromString(v47);
  x = v54.origin.x;
  y = v54.origin.y;
  width = v54.size.width;
  height = v54.size.height;
  if (*(_BYTE *)(a1 + 64))
    v9 = 85.685;
  else
    v9 = 54.05;
  if (*(_BYTE *)(a1 + 64))
    v10 = 54.05;
  else
    v10 = 85.685;
  objc_msgSend(*(id *)(a1 + 40), "findCCResultsInImageFlat:usingTextFeatures:invert:", *(_QWORD *)(a1 + 48), v4, *(unsigned __int8 *)(a1 + 65));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = width;
  v12 = (void *)objc_msgSend(v11, "mutableCopy");
  v13 = (1.0 - y - height) * v9;
  v14 = height * v9;
  v15 = x * v10;

  if (*(_BYTE *)(a1 + 65))
    v16 = 54.05 - v13 - v14;
  else
    v16 = v13;
  v49.x = v15;
  v49.y = v16;
  NSStringFromPoint(v49);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v17, CFSTR("fieldOrigin"));

  v55.origin.x = v15;
  v55.origin.y = v13;
  v55.size.width = v46 * v10;
  v55.size.height = v14;
  NSStringFromRect(v55);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v18, CFSTR("fieldCutRect"));

  objc_msgSend(v12, "objectForKey:", CFSTR("Expiration"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKey:", CFSTR("normalizedDateOffset"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "floatValue");
  v22 = v21;

  objc_msgSend(v12, "objectForKey:", CFSTR("Cardholder"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKey:", CFSTR("normalizedNameOffset"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "floatValue");
  v26 = v25;

  v50.x = v22 * 85.685;
  v50.y = v16;
  NSStringFromPoint(v50);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v27, CFSTR("dateOrigin"));

  v51.x = v26 * 85.685;
  v51.y = v16;
  NSStringFromPoint(v51);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v28, CFSTR("nameOrigin"));

  v52.x = v15;
  v52.y = v16;
  NSStringFromPoint(v52);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v29, CFSTR("codeOrigin"));

  objc_msgSend(v48, "objectForKey:", CFSTR("paddedRects"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v30)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v30, "count"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("CardNumber"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i < objc_msgSend(v31, "count") && i < objc_msgSend(v33, "count"); ++i)
    {
      objc_msgSend(v31, "objectAtIndex:", i);
      v35 = (NSString *)objc_claimAutoreleasedReturnValue();
      v56 = NSRectFromString(v35);
      v36 = v56.origin.x;
      v37 = v56.origin.y;
      v38 = v56.size.height;

      if (*(_BYTE *)(a1 + 65))
        v39 = 54.05 - (1.0 - v37 - v38) * 54.05 - v38 * 54.05;
      else
        v39 = (1.0 - v37 - v38) * 54.05;
      objc_msgSend(v33, "objectAtIndex:", i);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "objectForKey:", CFSTR("normalizedCodeOffset"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "floatValue");
      v43 = v42;

      v53.x = v36 * 85.685 + v43 * 85.685;
      v53.y = v39;
      NSStringFromPoint(v53);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addObject:", v44);

    }
    objc_msgSend(v12, "setObject:forKey:", v32, CFSTR("codeFragmentOrigins"));

  }
  v45 = *(id *)(a1 + 56);
  objc_sync_enter(v45);
  objc_msgSend(*(id *)(a1 + 56), "addObject:", v12);
  objc_sync_exit(v45);

}

uint64_t __61__CRCameraReader_findObjectsFlat_inImage_numberRects_invert___block_invoke_2()
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
}

uint64_t __61__CRCameraReader_findObjectsFlat_inImage_numberRects_invert___block_invoke_3()
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
}

id __61__CRCameraReader_findObjectsFlat_inImage_numberRects_invert___block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("isNonNameString"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "numberWithBool:", objc_msgSend(v2, "BOOLValue") ^ 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __61__CRCameraReader_findObjectsFlat_inImage_numberRects_invert___block_invoke_5()
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
}

- (id)findCCObjectsEmbossed:(id)a3 inImage:(id)a4 numberRects:(id)a5 nameRects:(id)a6 dateRects:(id)a7
{
  void *v7;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CGFloat y;
  CGFloat x;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  float v54;
  void *v55;
  void *v56;
  _BOOL4 v57;
  float v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  _BOOL4 v72;
  void *v73;
  void *v74;
  double v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  int v80;
  void *v81;
  clock_t v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t i;
  void *v91;
  void *v92;
  void *v93;
  int v94;
  void *v95;
  double v96;
  void *v97;
  clock_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  id v104;
  id v105;
  id v106;
  double v107;
  void *v108;
  void *v109;
  double v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  int v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  uint64_t v123;
  char v124;
  int v125;
  clock_t v126;
  int v127;
  clock_t v128;
  id v129;
  id v130;
  id v131;
  id v132;
  void *v133;
  char v134;
  id obj;
  id v136;
  double v137;
  double v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  id v142;
  void *v143;
  void *v144;
  unint64_t v145;
  unint64_t v146;
  double v147;
  double v148;
  NSString *v150;
  unint64_t v151;
  double v152;
  unint64_t v153;
  double v154;
  double v155;
  double v156;
  unint64_t v157;
  double v158;
  id v159;
  double v160;
  double v161;
  clock_t v162;
  void *v163;
  void *v164;
  double width;
  void *v166;
  double height;
  id v168;
  CGPoint v169;
  id v170;
  NSObject *group;
  double v172;
  double v173;
  void *v174;
  uint64_t v175;
  void *v176;
  void *v177;
  _QWORD v178[4];
  id v179;
  CRCameraReader *v180;
  id v181;
  id v182;
  id v183;
  id v184;
  BOOL v185;
  char v186;
  char v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  _QWORD v192[4];
  id v193;
  CRCameraReader *v194;
  id v195;
  id v196;
  id v197;
  id v198;
  BOOL v199;
  char v200;
  char v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  _BYTE v206[128];
  _BYTE v207[128];
  uint64_t v208;
  CGRect v209;
  CGRect v210;
  NSRect v211;
  CGRect v212;
  CGRect v213;
  CGRect v214;
  CGRect v215;
  CGRect v216;
  CGRect v217;
  CGRect v218;
  NSRect v219;

  v208 = *MEMORY[0x24BDAC8D0];
  v132 = a3;
  v142 = a4;
  v129 = a5;
  v130 = a6;
  v131 = a7;
  v126 = clock();
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("com.apple.CoreRecognition.exaustive_search"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = objc_msgSend(v13, "BOOLValue");

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", CFSTR("com.apple.CoreRecognition.show_engine_name"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v123) = objc_msgSend(v15, "BOOLValue");

  v146 = objc_msgSend(v142, "height");
  v145 = objc_msgSend(v142, "width");
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v132);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v136 = (id)objc_claimAutoreleasedReturnValue();
  v127 = objc_msgSend(v133, "containsObject:", CFSTR("CROutputTypeCreditCardName"));
  HIDWORD(v123) = objc_msgSend(v133, "containsObject:", CFSTR("CRCameraReaderCreditCardExpirationDate"));
  v209.origin.x = *(CGFloat *)MEMORY[0x24BDBEFB0];
  v209.origin.y = *(CGFloat *)(MEMORY[0x24BDBEFB0] + 8);
  v209.size.width = 428.425;
  v209.size.height = 270.25;
  v210 = CGRectIntegral(v209);
  height = v210.size.height;
  y = v210.origin.y;
  if (v146 <= v145)
  {
    width = v210.size.height;
    height = v210.size.width;
    x = v210.origin.y;
    y = v210.origin.x;
  }
  else
  {
    width = v210.size.width;
    x = v210.origin.x;
  }
  v128 = clock();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v204 = 0u;
  v205 = 0u;
  v202 = 0u;
  v203 = 0u;
  obj = v129;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v202, v207, 16);
  if (v18)
  {
    v177 = 0;
    v139 = *(_QWORD *)v203;
    v19 = 54.05;
    if (v146 <= v145)
      v20 = 54.05;
    else
      v20 = 85.685;
    if (v146 <= v145)
      v19 = 85.685;
    v137 = v19;
    v138 = v20;
    while (2)
    {
      v175 = 0;
      v140 = v18;
      do
      {
        if (*(_QWORD *)v203 != v139)
          objc_enumerationMutation(obj);
        v150 = (NSString *)*(id *)(*((_QWORD *)&v202 + 1) + 8 * v175);
        v211 = NSRectFromString(v150);
        v172 = v211.origin.x;
        v21 = v211.origin.y;
        v22 = v211.size.width;
        v23 = v211.size.height;
        *(float *)&v211.origin.x = 28.0 / (width * v211.size.height);
        v211.origin.x = *(float *)&v211.origin.x;
        v211.size.width = height * v211.origin.x;
        v211.size.height = width * v211.origin.x;
        v211.origin.x = y;
        v211.origin.y = x;
        v212 = CGRectIntegral(v211);
        v24 = v212.origin.x;
        v25 = v212.origin.y;
        v26 = v212.size.width;
        v27 = v212.size.height;
        v212.origin.x = *(CGFloat *)MEMORY[0x24BDBEFB0];
        v212.origin.y = *(CGFloat *)(MEMORY[0x24BDBEFB0] + 8);
        v212.size.height = 405.375;
        v212.size.width = 642.6375;
        CGRectIntegral(v212);
        v160 = v21 + 0.035;
        v155 = v21 + 0.035 + 0.01;
        v169.x = v137 * v172;
        v169.y = v138 * (1.0 - v21 - v23);
        v147 = v137 * v22;
        v148 = v138 * v23;
        if (v146 > v145)
          v28 = v26;
        else
          v28 = v27;
        if (v146 > v145)
          v29 = v27;
        else
          v29 = v26;
        if (v146 > v145)
          v30 = v24;
        else
          v30 = v25;
        v152 = v30;
        if (v146 <= v145)
          v25 = v24;
        v163 = v7;
        width = v28;
        height = v29;
        objc_msgSend(v142, "imageByScalingToWidth:height:", (unint64_t)v29, (unint64_t)v28, v123);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v157 = objc_msgSend(v31, "width");
        v32 = v23 * 0.65;
        v153 = objc_msgSend(v31, "width");
        v33 = objc_msgSend(v31, "height");
        v34 = objc_msgSend(v31, "height");
        v151 = objc_msgSend(v31, "width");
        v35 = objc_msgSend(v31, "width");
        v36 = objc_msgSend(v31, "height");
        v37 = objc_msgSend(v31, "height");
        v38 = objc_msgSend(v31, "width");
        v39 = objc_msgSend(v31, "width");
        v40 = objc_msgSend(v31, "height");
        v41 = objc_msgSend(v31, "height");
        v213.origin.x = v172 * (double)v157;
        v213.size.width = v22 * (double)v153;
        v213.origin.y = v21 * (double)v33;
        v213.size.height = v23 * (double)v34;
        v214 = CGRectIntegral(v213);
        v42 = v214.origin.x;
        v43 = v214.origin.y;
        v44 = v214.size.width;
        v214.origin.x = (double)v151 * 0.85;
        v214.size.width = (double)v35 * 0.06;
        v214.origin.y = v160 * (double)v36;
        v214.size.height = v32 * (double)v37;
        v215 = CGRectIntegral(v214);
        v173 = v215.origin.x;
        v161 = v215.origin.y;
        v7 = v163;
        v45 = v215.size.width;
        v46 = v32;
        v47 = v215.size.height;
        v215.origin.x = (double)v38 * 0.85;
        v215.size.width = (double)v39 * 0.06;
        v215.origin.y = v155 * (double)v40;
        v215.size.height = v46 * (double)v41;
        v216 = CGRectIntegral(v215);
        v156 = v216.origin.y;
        v158 = v216.origin.x;
        v154 = v216.size.height;
        v48 = v216.size.width;
        *(float *)&v216.origin.x = v44 * 0.125;
        v49 = (float)((float)(ceilf(*(float *)&v216.origin.x) * 8.0) + -5.0);
        objc_msgSend(v31, "imageByCroppingRectangle:", v42, v43, v49, 28.0);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        y = v25;
        -[CRCameraReader findCCNumberInImageEmbossed:](self, "findCCNumberInImageEmbossed:", v50);
        x = v152;
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v51, "objectForKey:", CFSTR("code"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v39) = v52 == 0;

        if ((_DWORD)v39)
        {
          v217.size.height = 28.0;
          v217.origin.x = v42;
          v217.origin.y = v43;
          v217.size.width = v49;
          v218 = CGRectInset(v217, 60.0, 0.0);
          objc_msgSend(v31, "imageByCroppingRectangle:", v218.origin.x, v218.origin.y, v218.size.width, v218.size.height);
          v53 = objc_claimAutoreleasedReturnValue();

          v54 = v45 * 0.125;
          objc_msgSend(v31, "imageByCroppingRectangle:", v173, v161, (float)((float)(ceilf(v54) * 8.0) + -5.0), v47);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          -[CRCameraReader findCCNumberInImageEmbossed:withFinalDigit:](self, "findCCNumberInImageEmbossed:withFinalDigit:", v53, v55);
          v177 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v177, "objectForKey:", CFSTR("code"));
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = v56 == 0;

          if (v57)
          {
            v58 = v48 * 0.125;
            objc_msgSend(v31, "imageByCroppingRectangle:", v158, v156, (float)((float)(ceilf(v58) * 8.0) + -5.0), v154);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            -[CRCameraReader findCCNumberInImageEmbossed:withFinalDigit:](self, "findCCNumberInImageEmbossed:withFinalDigit:", v53, v59);
            v60 = objc_claimAutoreleasedReturnValue();

            v177 = (void *)v60;
          }

          v50 = (void *)v53;
        }
        else
        {
          v177 = v51;
        }
        +[CRInsights sharedInsights](CRInsights, "sharedInsights");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        if (v61)
        {
          +[CRInsights sharedInsights](CRInsights, "sharedInsights");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "allowOverrideWithKey:forResultFromBlock:", CFSTR("kCROverrideShouldRunOffline"), &__block_literal_global_284);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v143 = v62;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v144 = v62;
        }
        v63 = objc_msgSend(v62, "BOOLValue");
        v64 = v144;
        if (v61)
        {

          v64 = v7;
        }

        if (v63)
        {
          v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v177);
          v219.origin = v169;
          v219.size.width = v147;
          v219.size.height = v148;
          NSStringFromRect(v219);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "setObject:forKey:", v66, CFSTR("numberCutRect"));

          NSStringFromPoint(v169);
          v67 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "setObject:forKey:", v67, CFSTR("codeOrigin"));

          objc_msgSend(v177, "objectForKey:", CFSTR("accepted"));
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v67) = v68 == 0;

          if ((v67 & 1) == 0)
          {
            objc_msgSend(v141, "addEntriesFromDictionary:", v65);
            NSStringFromPoint(v169);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v141, "setObject:forKey:", v69, CFSTR("codeOrigin"));

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v146 > v145);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v141, "setObject:forKey:", v70, CFSTR("isPortrait"));

            if ((v134 & 1) == 0)
              goto LABEL_45;
          }

        }
        else
        {
          objc_msgSend(v136, "addEntriesFromDictionary:", v177);
          objc_msgSend(v177, "objectForKey:", CFSTR("accepted"));
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = v71 == 0;

          if (!v72)
          {
            NSStringFromPoint(v169);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v136, "setObject:forKey:", v73, CFSTR("codeOrigin"));

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v146 > v145);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v136, "setObject:forKey:", v74, CFSTR("isPortrait"));

            +[CRInsights sharedInsights](CRInsights, "sharedInsights");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "provideInsightValue:forKey:", v177, CFSTR("CRInsightsRecognitionResultForNumberEmbossed"));
LABEL_45:

            goto LABEL_46;
          }
        }

        ++v175;
      }
      while (v140 != v175);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v202, v207, 16);
      if (v18)
        continue;
      break;
    }
  }
  else
  {
    v177 = 0;
  }
LABEL_46:

  *(float *)&v75 = (float)(clock() - v128) / 1000000.0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "setObject:forKey:", v76, CFSTR("codeRecognitionTime"));

  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if (v77)
  {
    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "allowOverrideWithKey:forResultFromBlock:", CFSTR("kCROverrideShouldRunOffline"), &__block_literal_global_287);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = v79;
  }
  if ((objc_msgSend(v79, "BOOLValue", v123) & 1) != 0)
  {
    v80 = 1;
  }
  else
  {
    objc_msgSend(v177, "objectForKey:", CFSTR("accepted"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v81, "BOOLValue");

  }
  if (v77)

  if (v80)
  {
    group = dispatch_group_create();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    if (v127)
    {
      v82 = clock();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      v162 = v82;
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      +[CRInsights sharedInsights](CRInsights, "sharedInsights");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "takeContextSnapshot");
      v84 = (void *)objc_claimAutoreleasedReturnValue();

      v192[0] = MEMORY[0x24BDAC760];
      v192[1] = 3221225472;
      v192[2] = __80__CRCameraReader_findCCObjectsEmbossed_inImage_numberRects_nameRects_dateRects___block_invoke_3;
      v192[3] = &unk_24C58BBD0;
      v159 = v84;
      v193 = v159;
      v194 = self;
      v195 = v142;
      v199 = v146 > v145;
      v200 = 0;
      v170 = v166;
      v196 = v170;
      v201 = v124;
      v85 = v176;
      v197 = v85;
      v168 = v164;
      v198 = v168;
      objc_msgSend(v130, "enumerateObjectsWithOptions:usingBlock:", 1, v192);
      objc_msgSend(v85, "objectForKey:");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v84) = v86 == 0;

      if ((_DWORD)v84)
      {
        v191 = 0u;
        v189 = 0u;
        v190 = 0u;
        v188 = 0u;
        v87 = v170;
        v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v188, v206, 16);
        if (v88)
        {
          v89 = *(_QWORD *)v189;
          while (2)
          {
            for (i = 0; i != v88; ++i)
            {
              if (*(_QWORD *)v189 != v89)
                objc_enumerationMutation(v87);
              v91 = *(void **)(*((_QWORD *)&v188 + 1) + 8 * i);
              objc_msgSend(v91, "objectForKey:", CFSTR("nameResult"));
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v91, "objectForKey:", CFSTR("isValidNameString"));
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              v94 = objc_msgSend(v93, "BOOLValue");

              if (v94)
              {
                objc_msgSend(v85, "setObject:forKey:", v92, CFSTR("cardholderName"));

                goto LABEL_67;
              }

            }
            v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v188, v206, 16);
            if (v88)
              continue;
            break;
          }
        }
LABEL_67:

      }
      objc_msgSend(v85, "setObject:forKey:", v170, CFSTR("nameResults"));
      objc_msgSend(v130, "removeAllObjects");
      objc_msgSend(v168, "allObjects");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v130, "addObjectsFromArray:", v95);

      *(float *)&v96 = (float)(clock() - v162) / 1000000.0;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v96);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "setObject:forKey:", v97, CFSTR("nameRecognitionTime"));

    }
    if (v125)
    {
      v98 = clock();
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      +[CRInsights sharedInsights](CRInsights, "sharedInsights");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "takeContextSnapshot");
      v102 = (void *)objc_claimAutoreleasedReturnValue();

      v178[0] = MEMORY[0x24BDAC760];
      v178[1] = 3221225472;
      v178[2] = __80__CRCameraReader_findCCObjectsEmbossed_inImage_numberRects_nameRects_dateRects___block_invoke_4;
      v178[3] = &unk_24C58BBD0;
      v103 = v102;
      v179 = v103;
      v180 = self;
      v181 = v142;
      v185 = v146 > v145;
      v186 = 0;
      v104 = v100;
      v182 = v104;
      v105 = v99;
      v183 = v105;
      v106 = v174;
      v184 = v106;
      v187 = v134;
      objc_msgSend(v131, "enumerateObjectsWithOptions:usingBlock:", 1, v178);
      objc_msgSend(v106, "setObject:forKey:", v104, CFSTR("expDateResults"));
      *(float *)&v107 = (float)(clock() - v98) / 1000000.0;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "setObject:forKey:", v108, CFSTR("expDateRecognitionTime"));

      objc_msgSend(v131, "removeAllObjects");
      objc_msgSend(v105, "allObjects");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "addObjectsFromArray:", v109);

    }
    dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
    *(float *)&v110 = (float)(clock() - v126) / 1000000.0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "setObject:forKey:", v111, CFSTR("totalRecognitionTime"));

    objc_msgSend(v136, "addEntriesFromDictionary:", v176);
    objc_msgSend(v136, "addEntriesFromDictionary:", v174);
    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    if (v112)
    {
      +[CRInsights sharedInsights](CRInsights, "sharedInsights");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "allowOverrideWithKey:forResultFromBlock:", CFSTR("kCROverrideShouldRunOffline"), &__block_literal_global_300);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = v114;
    }
    v115 = objc_msgSend(v114, "BOOLValue");
    if (v112)

    if (v115)
      objc_msgSend(v136, "addEntriesFromDictionary:", v141);
    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "provideInsightValue:forKey:", v176, CFSTR("CRInsightsRecognitionResultForNameEmbossed"));

    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "provideInsightValue:forKey:", v174, CFSTR("CRInsightsRecognitionResultForExpDateEmbossed"));

    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "provideInsightValue:forKey:", v141, CFSTR("CRInsightsRecognitionResultForNumberEmbossed"));

    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "provideInsightValue:forKey:", v141, CFSTR("numberResults"));

    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "provideInsightValue:forKey:", v176, CFSTR("nameResults"));

    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "provideInsightValue:forKey:", v174, CFSTR("expDateResults"));

  }
  return v136;
}

uint64_t __80__CRCameraReader_findCCObjectsEmbossed_inImage_numberRects_nameRects_dateRects___block_invoke()
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
}

uint64_t __80__CRCameraReader_findCCObjectsEmbossed_inImage_numberRects_nameRects_dateRects___block_invoke_2()
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
}

void __80__CRCameraReader_findCCObjectsEmbossed_inImage_numberRects_nameRects_dateRects___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  double x;
  double y;
  double width;
  double height;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  float v18;
  float v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  CGFloat v46;
  NSString *aString;
  NSPoint v48;
  NSRect v49;
  NSRect v50;
  NSRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  NSRect v55;
  NSRect v56;

  aString = a2;
  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachContextCopyToCurrentThread:", *(_QWORD *)(a1 + 32));

  v49 = NSRectFromString(aString);
  x = v49.origin.x;
  y = v49.origin.y;
  width = v49.size.width;
  height = v49.size.height;
  objc_msgSend(*(id *)(a1 + 40), "findCCObjectEmbossed:inImage:forRect:", CFSTR("CROutputTypeCreditCardName"), *(_QWORD *)(a1 + 48), aString);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  if (*(_BYTE *)(a1 + 80))
    v10 = 85.685;
  else
    v10 = 54.05;
  if (*(_BYTE *)(a1 + 80))
    v11 = 54.05;
  else
    v11 = 85.685;
  objc_msgSend(v9, "objectForKey:", CFSTR("nameResult"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = height;
  v14 = (1.0 - y - height) * v10;
  v45 = v13;
  v46 = y;
  v15 = v13 * v10;
  if (*(_BYTE *)(a1 + 81))
    v16 = 54.05 - v14 - v13 * v10;
  else
    v16 = v14;
  objc_msgSend(v9, "objectForKey:", CFSTR("nameOffset"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "floatValue");
  v19 = v18;

  v50.origin.x = x * v11;
  v50.origin.y = v14;
  v50.size.width = width * v11;
  v50.size.height = v15;
  NSStringFromRect(v50);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v20, CFSTR("nameCutRect"));

  v48.x = x * v11 + v19 / 7.5;
  v48.y = v16;
  NSStringFromPoint(v48);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v21, CFSTR("nameOrigin"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", isValidNameString(v12));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v22, CFSTR("isValidNameString"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", isNonNameString(v12));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v23, CFSTR("isNonNameString"));

  v24 = *(id *)(a1 + 56);
  objc_sync_enter(v24);
  objc_msgSend(*(id *)(a1 + 56), "addObject:", v9);
  objc_msgSend(v9, "objectForKey:", CFSTR("nameAccepted"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    if (*(_BYTE *)(a1 + 82))
      objc_msgSend(v9, "objectForKey:", CFSTR("nameResult"));
    else
      objc_msgSend(v9, "objectForKey:", CFSTR("closestNameMatch"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v26, CFSTR("cardholderName"));

    v27 = *(void **)(a1 + 64);
    objc_msgSend(v9, "objectForKey:", CFSTR("cardholderName"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKey:", v28, CFSTR("cardholderName"));

  }
  objc_msgSend(v9, "objectForKey:", CFSTR("isValidNameString"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "BOOLValue");

  if (v30)
  {
    v31 = *(void **)(a1 + 72);
    v51.origin.x = x;
    v51.origin.y = v46;
    v51.size.width = width;
    v51.size.height = v45;
    NSStringFromRect(v51);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObject:", v32);

    v52.origin.x = x;
    v52.origin.y = v46;
    v52.size.width = width;
    v52.size.height = v45;
    v53 = CGRectOffset(v52, 0.0, v45 * 0.5);
    v33 = v53.origin.x;
    v34 = v53.origin.y;
    v35 = v53.size.width;
    v36 = v53.size.height;
    v53.origin.x = x;
    v53.origin.y = v46;
    v53.size.width = width;
    v53.size.height = v45;
    v54 = CGRectOffset(v53, 0.0, v45 * -0.5);
    v37 = v54.origin.x;
    v38 = v54.origin.y;
    v39 = v54.size.width;
    v40 = v54.size.height;
    if (v34 < 1.0)
    {
      v41 = *(void **)(a1 + 72);
      v55.origin.x = v33;
      v55.origin.y = v34;
      v55.size.width = v35;
      v55.size.height = v36;
      NSStringFromRect(v55);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "addObject:", v42);

    }
    if (v38 > 0.670120259)
    {
      v43 = *(void **)(a1 + 72);
      v56.origin.x = v37;
      v56.origin.y = v38;
      v56.size.width = v39;
      v56.size.height = v40;
      NSStringFromRect(v56);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "addObject:", v44);

    }
  }
  objc_sync_exit(v24);

}

void __80__CRCameraReader_findCCObjectsEmbossed_inImage_numberRects_nameRects_dateRects___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  double x;
  double y;
  CGFloat width;
  double height;
  void *v11;
  CGFloat v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  void *v21;
  float v22;
  float v23;
  CGFloat v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  CGFloat v57;
  double v58;
  NSString *aString;
  NSPoint v60;
  NSRect v61;
  NSRect v62;
  NSRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  NSRect v67;
  NSRect v68;

  aString = a2;
  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attachContextCopyToCurrentThread:", *(_QWORD *)(a1 + 32));

  v61 = NSRectFromString(aString);
  x = v61.origin.x;
  y = v61.origin.y;
  width = v61.size.width;
  height = v61.size.height;
  objc_msgSend(*(id *)(a1 + 40), "findCCObjectEmbossed:inImage:forRect:", CFSTR("CRCameraReaderCreditCardExpirationDate"), *(_QWORD *)(a1 + 48), aString);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = width;
  v12 = x;
  v13 = (void *)objc_msgSend(v11, "mutableCopy");

  v57 = y;
  v14 = 1.0 - y - height;
  if (*(_BYTE *)(a1 + 80))
    v15 = 85.685;
  else
    v15 = 54.05;
  if (*(_BYTE *)(a1 + 80))
    v16 = 54.05;
  else
    v16 = 85.685;
  v17 = v14 * v15;
  v18 = height * v15;
  v19 = 54.05 - v14 * v15 - height * v15;
  if (*(_BYTE *)(a1 + 81))
    v20 = v19;
  else
    v20 = v17;
  objc_msgSend(v13, "objectForKey:", CFSTR("dateOffset"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "floatValue");
  v23 = v22;
  v24 = x * v16;

  v62.origin.x = v24;
  v62.origin.y = v17;
  v62.size.width = v58 * v16;
  v62.size.height = v18;
  NSStringFromRect(v62);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v25, CFSTR("expDateCutRect"));

  v60.x = v24 + v23 / 7.5;
  v60.y = v20;
  NSStringFromPoint(v60);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v26, CFSTR("dateOrigin"));

  v27 = *(id *)(a1 + 56);
  objc_sync_enter(v27);
  objc_msgSend(*(id *)(a1 + 56), "addObject:", v13);
  objc_msgSend(v13, "objectForKey:", CFSTR("expDateAccepted"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v29 = *(void **)(a1 + 64);
    v63.origin.x = v12;
    v63.origin.y = v57;
    v63.size.width = v58;
    v63.size.height = height;
    NSStringFromRect(v63);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObject:", v30);

    v64.origin.x = v12;
    v64.origin.y = v57;
    v64.size.width = v58;
    v64.size.height = height;
    v65 = CGRectOffset(v64, 0.0, height * 0.5);
    v31 = v65.origin.x;
    v32 = v65.origin.y;
    v33 = v65.size.width;
    v34 = v65.size.height;
    v65.origin.x = v12;
    v65.origin.y = v57;
    v65.size.width = v58;
    v65.size.height = height;
    v66 = CGRectOffset(v65, 0.0, height * -0.5);
    v35 = v66.origin.x;
    v36 = v66.origin.y;
    v37 = v66.size.width;
    v38 = v66.size.height;
    if (v32 < 1.0)
    {
      v39 = *(void **)(a1 + 64);
      v67.origin.x = v31;
      v67.origin.y = v32;
      v67.size.width = v33;
      v67.size.height = v34;
      NSStringFromRect(v67);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addObject:", v40);

    }
    if (v36 > 0.670120259)
    {
      v41 = *(void **)(a1 + 64);
      v68.origin.x = v35;
      v68.origin.y = v36;
      v68.size.width = v37;
      v68.size.height = v38;
      NSStringFromRect(v68);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "addObject:", v42);

    }
    v43 = *(void **)(a1 + 72);
    objc_msgSend(v13, "objectForKey:", CFSTR("expirationDate"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setObject:forKey:", v44, CFSTR("expirationDate"));

    objc_msgSend(v13, "objectForKey:", CFSTR("expirationYear"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      v46 = *(void **)(a1 + 72);
      objc_msgSend(v13, "objectForKey:", CFSTR("expirationYear"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setObject:forKey:", v47, CFSTR("expirationYear"));

    }
    objc_msgSend(v13, "objectForKey:", CFSTR("expirationMonth"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      v49 = *(void **)(a1 + 72);
      objc_msgSend(v13, "objectForKey:", CFSTR("expirationMonth"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setObject:forKey:", v50, CFSTR("expirationMonth"));

    }
    objc_msgSend(v13, "objectForKey:", CFSTR("expirationDay"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (v51)
    {
      v52 = *(void **)(a1 + 72);
      objc_msgSend(v13, "objectForKey:", CFSTR("expirationDay"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setObject:forKey:", v53, CFSTR("expirationDay"));

    }
    objc_msgSend(v13, "objectForKey:", CFSTR("dateOrigin"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v54)
    {
      v55 = *(void **)(a1 + 72);
      objc_msgSend(v13, "objectForKey:", CFSTR("dateOrigin"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setObject:forKey:", v56, CFSTR("dateOrigin"));

    }
    if (!*(_BYTE *)(a1 + 82))
      *a4 = 1;
  }
  objc_sync_exit(v27);

}

uint64_t __80__CRCameraReader_findCCObjectsEmbossed_inImage_numberRects_nameRects_dateRects___block_invoke_5()
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
}

- (id)findCCResultsInImageFlat:(id)a3 usingTextFeatures:(id)a4 invert:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t j;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  BOOL v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  _BOOL4 v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v93;
  void *v94;
  id v95;
  id v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _QWORD v105[5];
  id v106;
  id v107;
  id v108;
  uint64_t v109;
  BOOL v110;
  char v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _BYTE v116[128];
  _BYTE v117[128];
  uint64_t v118;

  v5 = a5;
  v118 = *MEMORY[0x24BDAC8D0];
  v96 = a3;
  v7 = a4;
  v94 = v7;
  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContextValue:forKey:", v7);

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("com.apple.CoreRecognition.disable_prefix_check"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v97 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(v7, "subFeatures");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "arrayWithCapacity:", objc_msgSend(v13, "count"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();

    v114 = 0u;
    v115 = 0u;
    v112 = 0u;
    v113 = 0u;
    objc_msgSend(v7, "subFeatures");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v112, v117, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v113;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v113 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v112 + 1) + 8 * i), "subFeatures");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "count");

          v15 += v20;
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v112, v117, 16);
      }
      while (v16);
    }

    objc_msgSend(v94, "subFeatures");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v22 = 2;
    else
      v22 = 0;
    v105[0] = MEMORY[0x24BDAC760];
    v105[1] = 3221225472;
    v105[2] = __68__CRCameraReader_findCCResultsInImageFlat_usingTextFeatures_invert___block_invoke;
    v105[3] = &unk_24C58BC18;
    v105[4] = self;
    v106 = v96;
    v110 = v5;
    v93 = v90;
    v107 = v93;
    v111 = v11;
    v95 = v99;
    v108 = v95;
    v109 = v15;
    objc_msgSend(v21, "enumerateObjectsWithOptions:usingBlock:", v22, v105);

    extractCardCode(v93);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    if (v98)
    {
      objc_msgSend(v94, "bounds");
      if (isValidCodeLocation(v98, 0, v23, v24, v25, v26))
      {
        objc_msgSend(v97, "setObject:forKey:", v98, CFSTR("code"));
        objc_msgSend(v97, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("accepted"));
      }
    }
    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      +[CRInsights sharedInsights](CRInsights, "sharedInsights");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "allowOverrideWithKey:forResultFromBlock:", CFSTR("kCROverrideShouldRunOffline"), &__block_literal_global_309);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v29;
    }
    v40 = objc_msgSend(v29, "BOOLValue");
    if (v27)

    if (v40)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v41;
      if (v98)
      {
        objc_msgSend(v41, "setObject:forKey:", v98, CFSTR("code"));
        objc_msgSend(v42, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("accepted"));
      }
      else
      {
        objc_msgSend(v41, "setObject:forKey:", v93, CFSTR("code"));
      }
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v42, 0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "setObject:forKey:", v43, CFSTR("cardnumberFragmented"));

    }
    objc_msgSend(v97, "setObject:forKey:", v95, CFSTR("CardNumber"));
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "setObject:forKey:", v44, CFSTR("Cardholder"));

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "setObject:forKey:", v45, CFSTR("Expiration"));

    goto LABEL_65;
  }
  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setContextValue:forKey:", v7, CFSTR("CRInsightsContextRecognitionTextFeature"));

  -[CRCameraReader flatPrintedModel](self, "flatPrintedModel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "creditcardResultsFromImage:textFeatures:invert:tryPatternMatch:", v96, v7, v5, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v93 = v32;
  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "provideInsightValue:forKey:", v32, CFSTR("CRInsightsRecognitionResultsForRegion"));

  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setContextValue:forKey:", 0, CFSTR("CRInsightsContextRecognitionTextFeature"));

  objc_msgSend(v32, "objectForKey:", CFSTR("FastScanningCTCSegmentKey"));
  v95 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectForKey:", CFSTR("FastScanningGeometricKey"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectForKey:", CFSTR("FastScanningPatternSearchKey"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "objectForKey:", CFSTR("CardNumber"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "objectAtIndex:", 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  extractCardCode(v35);
  v36 = objc_claimAutoreleasedReturnValue();

  v98 = (void *)v36;
  if (!v36)
  {
    objc_msgSend(v95, "objectForKey:", CFSTR("CardNumber"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v37, "objectAtIndex:", 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    extractCardCode(v38);
    v39 = objc_claimAutoreleasedReturnValue();

    v98 = (void *)v39;
    if (v39)
    {
      v89 = v37;
    }
    else
    {
      objc_msgSend(v88, "objectForKey:", CFSTR("CardNumber"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v46, "objectAtIndex:", 0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      extractCardCode(v47);
      v48 = objc_claimAutoreleasedReturnValue();

      v98 = (void *)v48;
      if (!v48)
      {
        v98 = 0;
        v89 = v46;
        goto LABEL_33;
      }
      v89 = v46;
    }
  }
  objc_msgSend(v7, "bounds");
  if (isValidCodeLocation(v98, 0, v49, v50, v51, v52))
  {
    objc_msgSend(v97, "setObject:forKey:", v98, CFSTR("code"));
    objc_msgSend(v97, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("accepted"));
  }
LABEL_33:
  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "allowOverrideWithKey:forResultFromBlock:", CFSTR("kCROverrideShouldRunOffline"), &__block_literal_global_314);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v55;
  }
  v56 = objc_msgSend(v55, "BOOLValue");
  if (v53)

  if (v56)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v57 = v32;
    v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v101, v116, 16);
    if (v58)
    {
      v59 = *(_QWORD *)v102;
      do
      {
        for (j = 0; j != v58; ++j)
        {
          if (*(_QWORD *)v102 != v59)
            objc_enumerationMutation(v57);
          objc_msgSend(v57, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * j));
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "objectForKey:", CFSTR("CardNumber"));
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          extractCardNumberResults(v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v63, "objectForKey:", CFSTR("code"));
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend(v64, "length") == 0;

          if (!v65)
            objc_msgSend(v100, "addObject:", v63);

        }
        v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v101, v116, 16);
      }
      while (v58);
    }

    objc_msgSend(v97, "setObject:forKey:", v100, CFSTR("CardNumber"));
  }
  objc_msgSend(v91, "objectForKey:", CFSTR("Cardholder"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCameraReader contactsCache](self, "contactsCache");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCameraReader previousContactMatches](self, "previousContactMatches");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  extractCardholderNameResults(v66, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v97, "setObject:forKey:", v69, CFSTR("Cardholder"));
  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (v70)
  {
    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "allowOverrideWithKey:forValue:", CFSTR("referenceExpirationDate"), 0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v72 = 0;
  }

  computeReferenceDateFromString(v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "objectForKey:", CFSTR("Expiration"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  extractExpirationDateResults(v74, v73);
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v75, "objectForKey:", CFSTR("expDateAccepted"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v74) = v76 == 0;

  if ((_DWORD)v74)
  {
    objc_msgSend(v88, "objectForKey:", CFSTR("Expiration"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    extractExpirationDateResults(v77, v73);
    v78 = objc_claimAutoreleasedReturnValue();

    v75 = (void *)v78;
  }
  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if (v79)
  {
    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "allowOverrideWithKey:forResultFromBlock:", CFSTR("kCROverrideShouldRunOffline"), &__block_literal_global_315);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = v81;
  }
  if (objc_msgSend(v81, "BOOLValue"))
  {
    objc_msgSend(v75, "objectForKey:", CFSTR("expDateAccepted"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v82 == 0;

    if (!v79)
      goto LABEL_62;
    goto LABEL_61;
  }
  v83 = 0;
  if (v79)
LABEL_61:

LABEL_62:
  if (v83)
  {
    objc_msgSend(v95, "objectForKey:", CFSTR("Expiration"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    extractExpirationDateResults(v84, v73);
    v85 = objc_claimAutoreleasedReturnValue();

    v75 = (void *)v85;
  }
  objc_msgSend(v97, "setObject:forKey:", v75, CFSTR("Expiration"));

LABEL_65:
  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setContextValue:forKey:", 0, CFSTR("CRInsightsContextRecognitionTextFeatureGroup"));

  return v97;
}

void __68__CRCameraReader_findCCResultsInImageFlat_usingTextFeatures_invert___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  float v19;
  void *v20;
  void *v21;
  float v22;
  double v23;
  void *v24;
  id v25;

  v25 = a2;
  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContextValue:forKey:", v25, CFSTR("CRInsightsContextRecognitionTextFeature"));

  objc_msgSend(*(id *)(a1 + 32), "flatPrintedModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "creditcardResultsFromImage:textFeatures:invert:tryPatternMatch:", *(_QWORD *)(a1 + 40), v25, *(unsigned __int8 *)(a1 + 72), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "provideInsightValue:forKey:", v8, CFSTR("CRInsightsRecognitionResultsForRegion"));

  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContextValue:forKey:", 0, CFSTR("CRInsightsContextRecognitionTextFeature"));

  objc_msgSend(v8, "objectForKey:", CFSTR("FastScanningGeometricKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("CardNumber"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndex:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = *(void **)(a1 + 48);
    objc_msgSend(v12, "objectAtIndex:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appendString:", v15);

  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v12, "count") >= 2)
  {
    objc_msgSend(v12, "objectAtIndex:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v17, CFSTR("codeOffset"));

    if ((unint64_t)objc_msgSend(v12, "count") < 3)
    {
      v19 = 300.0;
    }
    else
    {
      objc_msgSend(v12, "objectAtIndex:", 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (float)objc_msgSend(v18, "integerValue");

    }
    objc_msgSend(v12, "objectAtIndex:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndex:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (float)objc_msgSend(v21, "integerValue") / v19;

    *(float *)&v23 = v22;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v24, CFSTR("normalizedCodeOffset"));

  }
  objc_msgSend(*(id *)(a1 + 56), "addObject:", v16);
  if (!*(_BYTE *)(a1 + 73) && (checkPartialCodePrefix(*(void **)(a1 + 48), *(_QWORD *)(a1 + 64)) & 1) == 0)
    *a4 = 1;

}

uint64_t __68__CRCameraReader_findCCResultsInImageFlat_usingTextFeatures_invert___block_invoke_2()
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
}

uint64_t __68__CRCameraReader_findCCResultsInImageFlat_usingTextFeatures_invert___block_invoke_3()
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
}

uint64_t __68__CRCameraReader_findCCResultsInImageFlat_usingTextFeatures_invert___block_invoke_4()
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
}

- (id)findCCNumberInImageEmbossed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  CGFloat *v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageByApplyingHistogramCorrection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "provideInsightValue:forKey:", v6, CFSTR("CRInsightsCardImageCutEmbossedBufferKey"));

  -[CRCameraReader embossedNumberModel](self, "embossedNumberModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "creditcardResultsFromImage:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("arrayResult"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  v12 = 1;
  v13 = (CGFloat *)MEMORY[0x24BDBF070];
  while (objc_msgSend(v10, "count") > v12)
  {
    objc_msgSend(v10, "objectAtIndex:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    extractCardCode(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15 && isValidCodeLocation(v15, 1, *v13, v13[1], v13[2], v13[3]))
    {
      objc_msgSend(v5, "setObject:forKey:", v15, CFSTR("code"));
      objc_msgSend(v5, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("accepted"));
      v11 = v15;
      break;
    }
    ++v12;
    v11 = v15;
  }

  return v5;
}

- (id)findCCNumberInImageEmbossed:(id)a3 withFinalDigit:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "height");
  objc_msgSend(v7, "imageByScalingToWidth:height:", (unint64_t)(28.0 / (double)v9 * (double)(unint64_t)objc_msgSend(v7, "width")), (unint64_t)(28.0 / (double)v9 * (double)(unint64_t)objc_msgSend(v7, "height")));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "imageByApplyingHistogramCorrection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCameraReader embossedExpirationModel](self, "embossedExpirationModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "creditcardResultsFromImage:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("FastScanningCTCSegmentKey"));
  v13 = objc_claimAutoreleasedReturnValue();

  v43 = (void *)v13;
  -[CRCameraReader extractFinalDigitStringFromNumbers:](self, "extractFinalDigitStringFromNumbers:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "length") != 1)
  {
    objc_msgSend(v10, "imageByAdjustingBrightnessAlpha:beta:", 1.3, 128.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "imageByApplyingHistogramCorrection");
    v16 = objc_claimAutoreleasedReturnValue();

    -[CRCameraReader embossedExpirationModel](self, "embossedExpirationModel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "creditcardResultsFromImage:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", CFSTR("FastScanningCTCSegmentKey"));
    v19 = objc_claimAutoreleasedReturnValue();

    -[CRCameraReader extractFinalDigitStringFromNumbers:](self, "extractFinalDigitStringFromNumbers:", v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v16;
    v43 = (void *)v19;
    v14 = (void *)v20;
  }
  if (objc_msgSend(v14, "length") == 1)
  {
    v39 = v6;
    v40 = v8;
    objc_msgSend(v6, "imageByApplyingHistogramCorrection");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCameraReader embossedNumberModel](self, "embossedNumberModel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "creditcardResultsFromImage:", v41);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKey:", CFSTR("arrayResult"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    enrichedNumbersListHK(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 1;
    while (objc_msgSend(v24, "count") > v25)
    {
      objc_msgSend(v24, "objectAtIndex:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringByAppendingString:", v14);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      extractCardCodeHK(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      ++v25;
      if (v28)
      {
        objc_msgSend(v40, "setObject:forKey:", v28, CFSTR("code"));
        objc_msgSend(v40, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("accepted"));
        goto LABEL_14;
      }
    }
    objc_msgSend(v41, "imageByAdjustingBrightnessAlpha:beta:", 2.0, 100.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "imageByApplyingHistogramCorrection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    -[CRCameraReader embossedNumberModel](self, "embossedNumberModel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "creditcardResultsFromImage:", v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKey:", CFSTR("arrayResult"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    enrichedNumbersListHK(v33);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = 1;
    while (objc_msgSend(v24, "count") > v34)
    {
      objc_msgSend(v24, "objectAtIndex:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringByAppendingString:", v14);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      extractCardCodeHK(v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      ++v34;
      if (v37)
      {
        objc_msgSend(v40, "setObject:forKey:", v37, CFSTR("code"));
        objc_msgSend(v40, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("accepted"));
        goto LABEL_13;
      }
    }
    v37 = 0;
LABEL_13:

    v28 = 0;
LABEL_14:

    v6 = v39;
    v8 = v40;
  }

  return v8;
}

- (id)findCCNameInImageEmbossed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a3, "imageByApplyingHistogramCorrection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCameraReader embossedCardholderModel](self, "embossedCardholderModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "creditcardResultsFromImage:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("arrayResult"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRCameraReader contactsCache](self, "contactsCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCameraReader previousContactMatches](self, "previousContactMatches");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  extractCardholderNameResults(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)findCCExpDateInImageEmbossed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(a3, "imageByApplyingHistogramCorrection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCameraReader embossedExpirationModel](self, "embossedExpirationModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "creditcardResultsFromImage:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("FastScanningCTCSegmentKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRInsights sharedInsights](CRInsights, "sharedInsights");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[CRInsights sharedInsights](CRInsights, "sharedInsights");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allowOverrideWithKey:forValue:", CFSTR("referenceExpirationDate"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  computeReferenceDateFromString(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  extractExpirationDateResults(v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("expDateAccepted"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("FastScanningPatternSearchKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    extractExpirationDateResults(v15, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", CFSTR("expDateAccepted"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      v18 = v16;
    else
      v18 = v12;
    v14 = v18;

  }
  return v14;
}

- (void)removeLayerTree
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;

  -[CRCameraReader diagnosticHUDLayer](self, "diagnosticHUDLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperlayer");

  -[CRCameraReader alignmentLayer](self, "alignmentLayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperlayer");

  -[CRCameraReader boxLayer](self, "boxLayer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperlayer");

  -[CRCameraReader sessionManager](self, "sessionManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previewLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperlayer");

}

- (void)primeBoxLayerHideTimerWithFrameTime:(id *)a3
{
  void *v5;
  double Seconds;
  double v7;
  CMTime v8;
  CMTime v9;

  -[CRCameraReader boxLayerHideTimer](self, "boxLayerHideTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(CMTime *)a3;
  Seconds = CMTimeGetSeconds(&v8);
  -[CRCameraReader configDemoSpeed](self, "configDemoSpeed");
  CMTimeMakeWithSeconds(&v9, Seconds + 0.5 / v7, a3->var1);
  objc_msgSend(v5, "setFireTime:", &v9);

}

- (void)pauseBoxLayerHideTimer
{
  void *v2;
  __int128 v3;
  uint64_t v4;

  -[CRCameraReader boxLayerHideTimer](self, "boxLayerHideTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BDC0D58];
  v4 = *(_QWORD *)(MEMORY[0x24BDC0D58] + 16);
  objc_msgSend(v2, "setFireTime:", &v3);

}

- (void)hideBoxLayer
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__CRCameraReader_hideBoxLayer__block_invoke;
  block[3] = &unk_24C58B768;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __30__CRCameraReader_hideBoxLayer__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "boxLayer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHidden:", 1);

}

- (CGRect)boxLayerPresentationFrame
{
  void *v3;
  void *v4;
  double Width;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double Height;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  double MidX;
  void *v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect result;

  -[CRCameraReader view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  Width = CGRectGetWidth(v28);
  -[CRCameraReader view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  if (Width <= CGRectGetHeight(v29))
  {
    -[CRCameraReader view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v10 = CGRectGetWidth(v31);
    v11 = 0.8;
  }
  else
  {
    -[CRCameraReader view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v10 = CGRectGetWidth(v30);
    v11 = 0.65;
  }
  v12 = v10 * v11;

  -[CRCameraReader boxLayer](self, "boxLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  Height = CGRectGetHeight(v32);
  -[CRCameraReader boxLayer](self, "boxLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v16 = CGRectGetWidth(v33);

  -[CRCameraReader view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  MidX = CGRectGetMidX(v34);
  -[CRCameraReader view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bounds");
  v22 = v12 * Height / v16;
  v23 = CGRectGetMidY(v35) - v22 * 0.5;

  v24 = MidX - v12 * 0.5;
  v25 = v23;
  v26 = v12;
  v27 = v22;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (void)animatePresentCodeAtFrameTime:(id *)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  double v9;
  double MidX;
  double v11;
  double MidY;
  void *v13;
  void *v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v19;
  void *v20;
  double v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  void *v55;
  double v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  void *v62;
  void *v63;
  _QWORD v64[4];
  id v65;
  id v66;
  id v67[4];
  CATransform3D v68;
  uint64_t v69;
  CATransform3D v70;
  _BYTE v71[128];
  CATransform3D v72;
  CATransform3D v73;
  CATransform3D v74;
  CATransform3D v75;
  _QWORD v76[6];
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;

  v76[3] = *MEMORY[0x24BDAC8D0];
  -[CRCameraReader boxLayer](self, "boxLayer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "animationKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", CFSTR("CRBoxLayerAnimationReveal"));

  if ((v6 & 1) == 0)
  {
    -[CRCameraReader boxLayer](self, "boxLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeAllAnimations");

  }
  objc_msgSend(MEMORY[0x24BDE5638], "animation");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE5638], "animation");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCameraReader boxLayer](self, "boxLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "position");
  MidX = v9;
  MidY = v11;

  memset(&v75, 0, sizeof(v75));
  -[CRCameraReader boxLayer](self, "boxLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    objc_msgSend(v13, "transform");
  else
    memset(&v75, 0, sizeof(v75));

  if (-[CRCameraReader configPresentCentered](self, "configPresentCentered"))
  {
    -[CRCameraReader boxLayerPresentationFrame](self, "boxLayerPresentationFrame");
    x = v77.origin.x;
    y = v77.origin.y;
    width = v77.size.width;
    height = v77.size.height;
    MidX = CGRectGetMidX(v77);
    v78.origin.x = x;
    v78.origin.y = y;
    v78.size.width = width;
    v78.size.height = height;
    MidY = CGRectGetMidY(v78);
    v79.origin.x = x;
    v79.origin.y = y;
    v79.size.width = width;
    v79.size.height = height;
    v19 = CGRectGetWidth(v79);
    -[CRCameraReader boxLayer](self, "boxLayer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bounds");
    v21 = CGRectGetWidth(v80);

    CATransform3DMakeScale(&v74, v19 / v21, v19 / v21, 1.0);
    v75 = v74;
    if (-[CRCameraReader codeInverted](self, "codeInverted"))
    {
      v73 = v75;
      CATransform3DRotate(&v74, &v73, 3.14159265, 0.0, 0.0, 1.0);
      v75 = v74;
    }
    -[CRCameraReader sessionManager](self, "sessionManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isPreviewVideoMirrored");

    if (v23)
    {
      v72 = v75;
      CATransform3DRotate(&v74, &v72, 3.14159265, 0.0, 1.0, 0.0);
      v75 = v74;
    }
    objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("position"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCameraReader boxLayer](self, "boxLayer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "position");
    v27 = v26;
    -[CRCameraReader boxLayer](self, "boxLayer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "position");
    v30 = v29;

    v31 = (void *)MEMORY[0x24BDBCE30];
    v32 = (void *)MEMORY[0x24BDD1968];
    -[CRCameraReader boxLayer](self, "boxLayer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "position");
    objc_msgSend(v32, "valueWithCGPoint:");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "valueWithCGPoint:", (MidX + v27) * 0.5, (MidY + v30) * 0.5);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", MidX, MidY);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "arrayWithObjects:", v34, v35, v36, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setValues:", v37);

    objc_msgSend(v24, "setKeyTimes:", &unk_24C5A5208);
    objc_msgSend(v24, "setCalculationMode:", CFSTR("cubic"));
    objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("zPosition"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = &unk_24C5A5310;
    v81.origin.x = x;
    v81.origin.y = y;
    v81.size.width = width;
    v81.size.height = height;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CGRectGetWidth(v81));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v76[1] = v39;
    v76[2] = &unk_24C5A5310;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v76, 3);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setValues:", v40);

    objc_msgSend(v38, "setKeyTimes:", &unk_24C5A5220);
    objc_msgSend(v38, "setCalculationMode:", CFSTR("cubic"));
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)MEMORY[0x24BDD1968];
    -[CRCameraReader boxLayer](self, "boxLayer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v43;
    if (v43)
      objc_msgSend(v43, "transform");
    else
      memset(v71, 0, sizeof(v71));
    objc_msgSend(v42, "valueWithCATransform3D:", v71);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setFromValue:", v49);

    v70 = v75;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", &v70);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setToValue:", v50);

    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setFromValue:", v52);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.4);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setToValue:", v53);

    -[CRCameraReader configDemoSpeed](self, "configDemoSpeed");
    objc_msgSend(v62, "setDuration:", 0.5 / v54);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v24, v38, v41, 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setAnimations:", v55);

    -[CRCameraReader configDemoSpeed](self, "configDemoSpeed");
    objc_msgSend(v63, "setDuration:", 0.5 / v56);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v51);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setAnimations:", v57);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFromValue:", v45);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.4);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setToValue:", v46);

    -[CRCameraReader configDemoSpeed](self, "configDemoSpeed");
    objc_msgSend(v62, "setDuration:", 0.25 / v47);
    -[CRCameraReader configDemoSpeed](self, "configDemoSpeed");
    objc_msgSend(v63, "setDuration:", 0.25 / v48);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v24);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setAnimations:", v38);
  }

  objc_initWeak((id *)&v74, self);
  -[CRCameraReader boxLayer](self, "boxLayer");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = MEMORY[0x24BDAC760];
  v64[1] = 3221225472;
  v64[2] = __48__CRCameraReader_animatePresentCodeAtFrameTime___block_invoke;
  v64[3] = &unk_24C58BCA0;
  objc_copyWeak(v67, (id *)&v74);
  v59 = v62;
  v65 = v59;
  v67[1] = (id)a2;
  v60 = v63;
  v66 = v60;
  v67[2] = *(id *)&MidX;
  v67[3] = *(id *)&MidY;
  v68 = v75;
  v69 = 0x3FD999999999999ALL;
  objc_msgSend(v58, "addCompletionBlock:", v64);

  objc_destroyWeak(v67);
  objc_destroyWeak((id *)&v74);

}

void __48__CRCameraReader_animatePresentCodeAtFrameTime___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  void *v26;
  double v27;
  id v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  id v33;
  _OWORD v34[8];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "boxLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllAnimations");

  v5 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v5, "sessionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "previewLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllAnimations");

  v8 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v8, "boxLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 32);
  NSStringFromSelector(*(SEL *)(a1 + 56));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAnimation:forKey:", v10, v11);

  v12 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v12, "sessionManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "previewLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 40);
  NSStringFromSelector(*(SEL *)(a1 + 56));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAnimation:forKey:", v15, v16);

  v17 = *(double *)(a1 + 64);
  v18 = *(double *)(a1 + 72);
  v19 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v19, "boxLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPosition:", v17, v18);

  v21 = *(_OWORD *)(a1 + 160);
  v39 = *(_OWORD *)(a1 + 144);
  v40 = v21;
  v22 = *(_OWORD *)(a1 + 192);
  v41 = *(_OWORD *)(a1 + 176);
  v42 = v22;
  v23 = *(_OWORD *)(a1 + 96);
  v35 = *(_OWORD *)(a1 + 80);
  v36 = v23;
  v24 = *(_OWORD *)(a1 + 128);
  v37 = *(_OWORD *)(a1 + 112);
  v38 = v24;
  v25 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v25, "boxLayer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34[4] = v39;
  v34[5] = v40;
  v34[6] = v41;
  v34[7] = v42;
  v34[0] = v35;
  v34[1] = v36;
  v34[2] = v37;
  v34[3] = v38;
  objc_msgSend(v26, "setTransform:", v34);

  v27 = *(double *)(a1 + 208);
  v28 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v28, "sessionManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "previewLayer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v31 = v27;
  objc_msgSend(v30, "setOpacity:", v31);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_loadWeakRetained(v2);
  objc_msgSend(v33, "setCodePresented:", v32);

}

- (void)showMessage:(id)a3 color:(id)a4 style:(int64_t)a5 duration:(double)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  void *v31;
  double MidX;
  void *v33;
  double Width;
  double MaxY;
  void *v36;
  double Height;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  double v44;
  void *v45;
  double v46;
  void *v47;
  double v48;
  void *v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _BOOL4 v55;
  void *v56;
  double MinX;
  void *v58;
  double MinY;
  void *v60;
  double v61;
  void *v62;
  void *v63;
  _BOOL4 v64;
  double v65;
  double v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  dispatch_time_t v71;
  id v72;
  id v73;
  id v74;
  id v75;
  void *v76;
  void *v77;
  id v78;
  _QWORD block[4];
  id v80;
  CRCameraReader *v81;
  id v82;
  id v83;
  id v84;
  id v85[3];
  id location[2];
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;

  v10 = a3;
  v78 = a4;
  v11 = 0;
  v12 = v10;
  v13 = 0;
  switch(a5)
  {
    case 0:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CoreRecognition"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Note"), &stru_24C599708, 0);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 1:
      goto LABEL_6;
    case 2:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CoreRecognition"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Success"), &stru_24C599708, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = 0;
      v12 = v10;
      goto LABEL_6;
    case 3:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CoreRecognition"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Error"), &stru_24C599708, 0);
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_5:
      v11 = (void *)v14;
      v13 = v10;
LABEL_6:

      v10 = v13;
      break;
    default:
      break;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CoreRecognition"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24C599708, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRCameraReader activityIndicator](self, "activityIndicator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 0);
    -[CRCameraReader setActivityIndicator:](self, "setActivityIndicator:", v19);

    -[CRCameraReader activityIndicator](self, "activityIndicator");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setHidesWhenStopped:", 1);

    -[CRCameraReader view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCameraReader activityIndicator](self, "activityIndicator");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSubview:", v22);

    if (-[CRCameraReader configPresentCentered](self, "configPresentCentered"))
    {
      -[CRCameraReader boxLayerPresentationFrame](self, "boxLayerPresentationFrame");
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v30 = v29;
      -[CRCameraReader activityIndicator](self, "activityIndicator");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v87.origin.x = v24;
      v87.origin.y = v26;
      v87.size.width = v28;
      v87.size.height = v30;
      MidX = CGRectGetMidX(v87);
      -[CRCameraReader activityIndicator](self, "activityIndicator");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "bounds");
      Width = CGRectGetWidth(v88);
      v89.origin.x = v24;
      v89.origin.y = v26;
      v89.size.width = v28;
      v89.size.height = v30;
      MaxY = CGRectGetMaxY(v89);
      -[CRCameraReader activityIndicator](self, "activityIndicator");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "bounds");
      Height = CGRectGetHeight(v90);
      -[CRCameraReader activityIndicator](self, "activityIndicator");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "bounds");
      v39 = CGRectGetWidth(v91);
      -[CRCameraReader activityIndicator](self, "activityIndicator");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "bounds");
      objc_msgSend(v31, "setFrame:", MidX + Width * -0.5, MaxY + Height * 0.5, v39, CGRectGetHeight(v92));

      -[CRCameraReader activityIndicator](self, "activityIndicator");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setAutoresizingMask:", 45);
LABEL_17:

      goto LABEL_18;
    }
    -[CRCameraReader activityIndicator](self, "activityIndicator");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCameraReader view](self, "view");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "bounds");
    v42 = CGRectGetMidX(v93);
    -[CRCameraReader activityIndicator](self, "activityIndicator");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "bounds");
    v44 = CGRectGetWidth(v94);
    -[CRCameraReader view](self, "view");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "bounds");
    v46 = CGRectGetMaxY(v95);
    -[CRCameraReader activityIndicator](self, "activityIndicator");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "bounds");
    v48 = CGRectGetHeight(v96);
    -[CRCameraReader activityIndicator](self, "activityIndicator");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "bounds");
    v50 = CGRectGetWidth(v97);
    -[CRCameraReader activityIndicator](self, "activityIndicator");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "bounds");
    objc_msgSend(v77, "setFrame:", v42 + v44 * -0.5, v46 + v48 * -1.5 + -44.0, v50, CGRectGetHeight(v98));

    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v52, "userInterfaceIdiom") == 1)
    {
      -[CRCameraReader view](self, "view");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "bounds");
      v105.size.width = 1024.0;
      v105.size.height = 748.0;
      v105.origin.x = 0.0;
      v105.origin.y = 0.0;
      if (CGRectEqualToRect(v99, v105))
      {

      }
      else
      {
        -[CRCameraReader view](self, "view");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "bounds");
        v106.size.width = 768.0;
        v106.size.height = 1004.0;
        v106.origin.x = 0.0;
        v106.origin.y = 0.0;
        v55 = CGRectEqualToRect(v100, v106);

        if (!v55)
        {
LABEL_16:
          -[CRCameraReader activityIndicator](self, "activityIndicator");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setAutoresizingMask:", 13);
          goto LABEL_17;
        }
      }
      -[CRCameraReader activityIndicator](self, "activityIndicator");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRCameraReader activityIndicator](self, "activityIndicator");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "frame");
      MinX = CGRectGetMinX(v101);
      -[CRCameraReader activityIndicator](self, "activityIndicator");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "frame");
      MinY = CGRectGetMinY(v102);
      -[CRCameraReader activityIndicator](self, "activityIndicator");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "frame");
      v61 = CGRectGetWidth(v103);
      -[CRCameraReader activityIndicator](self, "activityIndicator");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "frame");
      objc_msgSend(v52, "setFrame:", MinX, MinY + -44.0, v61, CGRectGetHeight(v104));

    }
    goto LABEL_16;
  }
LABEL_18:
  -[CRCameraReader activityIndicator](self, "activityIndicator");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 == 1)
    objc_msgSend(v63, "startAnimating");
  else
    objc_msgSend(v63, "stopAnimating");

  objc_initWeak(location, self);
  v64 = -[CRCameraReader configPresentCentered](self, "configPresentCentered");
  -[CRCameraReader configDemoSpeed](self, "configDemoSpeed");
  v66 = v65;
  -[CRCameraReader codePresented](self, "codePresented");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "timeIntervalSinceNow");
  v69 = 0.25;
  if (v64)
    v69 = 0.5;
  v70 = v69 / v66 + v68;

  v71 = dispatch_time(0, (uint64_t)(fmax(v70, 0.0) * 1000000000.0));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__CRCameraReader_showMessage_color_style_duration___block_invoke;
  block[3] = &unk_24C58BD40;
  v80 = v78;
  v81 = self;
  v82 = v10;
  v85[1] = *(id *)&a6;
  v72 = v10;
  v73 = v78;
  objc_copyWeak(v85, location);
  v85[2] = (id)a5;
  v83 = v11;
  v84 = v17;
  v74 = v17;
  v75 = v11;
  dispatch_after(v71, MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(v85);
  objc_destroyWeak(location);

}

void __51__CRCameraReader_showMessage_color_style_duration___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int64_t v4;
  dispatch_time_t v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14[3];

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "boxLayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "animatePulseColor:", *(_QWORD *)(a1 + 32));

    v4 = 200000000;
  }
  else
  {
    v4 = 0;
  }
  v5 = dispatch_time(0, v4);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __51__CRCameraReader_showMessage_color_style_duration___block_invoke_2;
  v9[3] = &unk_24C58BD40;
  v6 = *(void **)(a1 + 48);
  v9[4] = *(_QWORD *)(a1 + 40);
  v7 = v6;
  v14[1] = *(id *)(a1 + 80);
  v10 = v7;
  v11 = v2;
  v8 = v2;
  objc_copyWeak(v14, (id *)(a1 + 72));
  v14[2] = *(id *)(a1 + 88);
  v12 = *(id *)(a1 + 56);
  v13 = *(id *)(a1 + 64);
  dispatch_after(v5, MEMORY[0x24BDAC9B8], v9);

  objc_destroyWeak(v14);
}

void __51__CRCameraReader_showMessage_color_style_duration___block_invoke_2(id *a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;
  id v8[3];

  objc_msgSend(a1[4], "boxLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __51__CRCameraReader_showMessage_color_style_duration___block_invoke_3;
  v3[3] = &unk_24C58BD18;
  v4 = a1[5];
  v8[1] = a1[10];
  v5 = a1[6];
  objc_copyWeak(v8, a1 + 9);
  v8[2] = a1[11];
  v6 = a1[7];
  v7 = a1[8];
  objc_msgSend(v2, "addCompletionBlock:", v3);

  objc_destroyWeak(v8);
}

void __51__CRCameraReader_showMessage_color_style_duration___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id *v8;
  void *v9;
  id WeakRetained;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  double v16;
  dispatch_time_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22[2];
  _QWORD block[4];
  id v24[2];

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", *(_QWORD *)(a1 + 48), v4, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BDF67E8];
    v7 = *(_QWORD *)(a1 + 56);
    v18 = MEMORY[0x24BDAC760];
    v19 = 3221225472;
    v20 = __51__CRCameraReader_showMessage_color_style_duration___block_invoke_5;
    v21 = &unk_24C58BCF0;
    v8 = (id *)(a1 + 64);
    objc_copyWeak(v22, (id *)(a1 + 64));
    v22[1] = *(id *)(a1 + 80);
    objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 0, &v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v9, v18, v19, v20, v21);
    WeakRetained = objc_loadWeakRetained(v8);
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v5, 1, 0);

    objc_destroyWeak(v22);
  }
  else
  {
    v11 = *(double *)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceNow");
    v13 = v11 + v12;
    v14 = v13 * 1000000000.0;
    v15 = v13 <= 0.0;
    v16 = 0.0;
    if (!v15)
      v16 = v14;
    v17 = dispatch_time(0, (uint64_t)v16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__CRCameraReader_showMessage_color_style_duration___block_invoke_4;
    block[3] = &unk_24C58BCC8;
    objc_copyWeak(v24, (id *)(a1 + 64));
    v24[1] = *(id *)(a1 + 80);
    dispatch_after(v17, MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(v24);
  }

}

void __51__CRCameraReader_showMessage_color_style_duration___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "sendDidDisplayMessageStyle:", *(_QWORD *)(a1 + 40));

}

void __51__CRCameraReader_showMessage_color_style_duration___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "sendDidDisplayMessageStyle:", *(_QWORD *)(a1 + 40));

}

- (void)sendDidCancel
{
  void *v3;
  _QWORD v4[5];

  -[CRCameraReader delegateQueue](self, "delegateQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __31__CRCameraReader_sendDidCancel__block_invoke;
  v4[3] = &unk_24C58B768;
  v4[4] = self;
  cr_dispatch_async((uint64_t)v3, (uint64_t)v4);

}

void __31__CRCameraReader_sendDidCancel__block_invoke(uint64_t a1)
{
  id v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "didSendEndOrCancel") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setDidSendEndOrCancel:", 1);
    objc_msgSend(*(id *)(a1 + 32), "callbackDelegate");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cameraReaderDidCancel:", *(_QWORD *)(a1 + 32));

  }
}

- (void)sendDidEndWithInfo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CRCameraReader delegateQueue](self, "delegateQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37__CRCameraReader_sendDidEndWithInfo___block_invoke;
  v7[3] = &unk_24C58B870;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  cr_dispatch_async((uint64_t)v5, (uint64_t)v7);

}

uint64_t __37__CRCameraReader_sendDidEndWithInfo___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  void *v4;

  result = objc_msgSend(*(id *)(a1 + 32), "didSendEndOrCancel");
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setDidSendEndOrCancel:", 1);
    objc_msgSend(*(id *)(a1 + 32), "callbackDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cameraReader:didRecognizeObjects:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setPinnedFoundInfo:", v4);

    objc_msgSend(*(id *)(a1 + 32), "setFoundCode:", 0);
    return objc_msgSend(*(id *)(a1 + 32), "setPreviousCode:", 0);
  }
  return result;
}

- (void)sendDidRecognizeNewObjects:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CRCameraReader delegateQueue](self, "delegateQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__CRCameraReader_sendDidRecognizeNewObjects___block_invoke;
  v7[3] = &unk_24C58B870;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  cr_dispatch_async((uint64_t)v5, (uint64_t)v7);

}

void __45__CRCameraReader_sendDidRecognizeNewObjects___block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  void *v4;
  void *v5;
  CRCameraReaderOutput *v6;
  void *v7;
  void *v8;
  CRCameraReaderOutput *v9;
  void *v10;
  void *v11;
  CRCameraReaderOutputExpirationDate *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;

  objc_msgSend(*(id *)(a1 + 32), "callbackDelegate");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v35 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("code"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("cardholderName"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("expirationDate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v6 = objc_alloc_init(CRCameraReaderOutput);
      -[CRCameraReaderOutput objectInternal](v6, "objectInternal");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setType:", CFSTR("CROutputTypeCreditCardNumber"));

      -[CRCameraReaderOutput objectInternal](v6, "objectInternal");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setStringValue:", v3);

      objc_msgSend(v35, "addObject:", v6);
    }
    if (v4)
    {
      v9 = objc_alloc_init(CRCameraReaderOutput);
      -[CRCameraReaderOutput objectInternal](v9, "objectInternal");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setType:", CFSTR("CROutputTypeCreditCardName"));

      -[CRCameraReaderOutput objectInternal](v9, "objectInternal");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setStringValue:", v4);

      objc_msgSend(v35, "addObject:", v9);
    }
    if (v5)
    {
      v12 = objc_alloc_init(CRCameraReaderOutputExpirationDate);
      -[CRCameraReaderOutput objectInternal](v12, "objectInternal");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setType:", CFSTR("CRCameraReaderCreditCardExpirationDate"));

      -[CRCameraReaderOutput objectInternal](v12, "objectInternal");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setStringValue:", v5);

      objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("expirationYear"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v16 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(*(id *)(a1 + 32), "pinnedFoundInfo");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKey:", CFSTR("expirationYear"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "numberWithInteger:", objc_msgSend(v18, "integerValue"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRCameraReaderOutput objectInternal](v12, "objectInternal");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setYearValue:", v19);

      }
      objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("expirationMonth"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        v22 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(*(id *)(a1 + 32), "pinnedFoundInfo");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKey:", CFSTR("expirationMonth"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "numberWithInteger:", objc_msgSend(v24, "integerValue"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRCameraReaderOutput objectInternal](v12, "objectInternal");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setMonthValue:", v25);

      }
      objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("expirationDay"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v28 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(*(id *)(a1 + 32), "pinnedFoundInfo");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKey:", CFSTR("expirationDay"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "numberWithInteger:", objc_msgSend(v30, "integerValue"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRCameraReaderOutput objectInternal](v12, "objectInternal");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setDayValue:", v31);

      }
      objc_msgSend(v35, "addObject:", v12);

    }
    objc_msgSend(*(id *)(a1 + 32), "callbackDelegate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "cameraReader:didRecognizedNewObjects:", *(_QWORD *)(a1 + 32), v35);

  }
}

- (void)sendDidEndAnimation
{
  dispatch_time_t v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = dispatch_time(0, 500000000);
  -[CRCameraReader delegateQueue](self, "delegateQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__CRCameraReader_sendDidEndAnimation__block_invoke;
  block[3] = &unk_24C58B768;
  block[4] = self;
  dispatch_after(v3, v4, block);

}

void __37__CRCameraReader_sendDidEndAnimation__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "callbackDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraReaderDidEnd:", *(_QWORD *)(a1 + 32));

}

- (void)sendDidEndWithError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CRCameraReader delegateQueue](self, "delegateQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__CRCameraReader_sendDidEndWithError___block_invoke;
  v7[3] = &unk_24C58B870;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  cr_dispatch_async((uint64_t)v5, (uint64_t)v7);

}

uint64_t __38__CRCameraReader_sendDidEndWithError___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  void *v4;

  result = objc_msgSend(*(id *)(a1 + 32), "didSendEndOrCancel");
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setDidSendEndOrCancel:", 1);
    objc_msgSend(*(id *)(a1 + 32), "callbackDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cameraReader:didFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setPinnedFoundInfo:", v4);

    objc_msgSend(*(id *)(a1 + 32), "setFoundCode:", 0);
    return objc_msgSend(*(id *)(a1 + 32), "setPreviousCode:", 0);
  }
  return result;
}

- (id)attributedStringWithFrame:(CGSize)a3 withFont:(id)a4 withString:(id)a5 color:(CGColor *)a6
{
  CGFloat height;
  CGFloat width;
  const CGPath *v9;
  const __CFAttributedString *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  unsigned int v14;
  CTFontRef v15;
  id v16;
  void *v17;
  const __CFAttributedString *v18;
  const __CTFramesetter *v19;
  const __CTFrame *Frame;
  unint64_t length;
  unint64_t v22;
  int v23;
  BOOL v24;
  BOOL v25;
  int v26;
  BOOL v27;
  uint64_t v29;
  id v31;
  __CFString *name;
  void *v33;
  _QWORD v34[3];
  _QWORD v35[4];
  CFRange v36;
  CGRect v37;

  height = a3.height;
  width = a3.width;
  v35[3] = *MEMORY[0x24BDAC8D0];
  name = (__CFString *)a4;
  v31 = a5;
  v33 = (void *)objc_opt_new();
  objc_msgSend(v33, "setAlignment:", 1);
  v37.origin.x = 0.0;
  v37.origin.y = 0.0;
  v37.size.width = width;
  v37.size.height = height;
  v9 = CGPathCreateWithRect(v37, 0);
  v10 = 0;
  v29 = *MEMORY[0x24BDC4C28];
  v11 = *MEMORY[0x24BDF6600];
  v12 = 512;
  v13 = *MEMORY[0x24BDF6628];
  v14 = 256;
  do
  {
    v15 = CTFontCreateWithName(name, (double)v12, 0);
    v16 = objc_alloc(MEMORY[0x24BDD1458]);
    v34[0] = v29;
    v34[1] = v11;
    v35[0] = v15;
    v35[1] = a6;
    v34[2] = v13;
    v35[2] = v33;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (const __CFAttributedString *)objc_msgSend(v16, "initWithString:attributes:", v31, v17);

    v19 = CTFramesetterCreateWithAttributedString(v18);
    v36.location = 0;
    v36.length = 0;
    Frame = CTFramesetterCreateFrame(v19, v36, v9, 0);
    length = CTFrameGetVisibleStringRange(Frame).length;
    v22 = -[__CFAttributedString length](v18, "length");
    v23 = v14 >> 1;
    if (v14 >> 1 <= 1)
      v23 = 1;
    v24 = v22 > length;
    v25 = v22 > length;
    if (v25)
      v26 = -v14;
    else
      v26 = v14;
    v12 += v26;
    if (v24)
    {
      v14 = v23;
    }
    else
    {
      v27 = v14 >= 4;
      if (v14 < 4)
      {
        v14 = v23;
      }
      else
      {
        v25 = 1;
        v14 = 1;
      }
      if (v27)
        v12 += 2 * v23;
    }
    CFRelease(Frame);
    CFRelease(v19);
    CFRelease(v15);
    v10 = v18;
  }
  while (v25);
  CGPathRelease(v9);

  return v18;
}

- (id)createTextLayerForRecognizedObject:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double x;
  double y;
  double width;
  double height;
  id v41;
  id v42;
  float v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  CATransform3D v49;
  CATransform3D v50;
  CGRect v51;
  CGRect v52;

  v4 = a3;
  objc_msgSend(v4, "overlayString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "boundingBox");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[CRCameraReader sessionManager](self, "sessionManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCameraReader sessionManager](self, "sessionManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "previewLayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 1.0 - v7;
    objc_msgSend(v14, "convertCameraPointOCR:toLayer:flipped:", v16, 0, v9, 1.0 - v7);
    v19 = v18;
    v21 = v20;

    -[CRCameraReader sessionManager](self, "sessionManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCameraReader sessionManager](self, "sessionManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "previewLayer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v9 + v13;
    objc_msgSend(v22, "convertCameraPointOCR:toLayer:flipped:", v24, 0, v9 + v13, v17);
    v27 = v26;

    -[CRCameraReader sessionManager](self, "sessionManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCameraReader sessionManager](self, "sessionManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "previewLayer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v11 + v17;
    objc_msgSend(v28, "convertCameraPointOCR:toLayer:flipped:", v30, 0, v25, v31);

    -[CRCameraReader sessionManager](self, "sessionManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCameraReader sessionManager](self, "sessionManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "previewLayer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "convertCameraPointOCR:toLayer:flipped:", v34, 0, v9, v31);
    v36 = v35;

    v51.size.width = v36 - v19;
    v51.size.height = v27 - v21;
    v51.origin.x = v19;
    v51.origin.y = v21;
    v52 = CGRectOffset(v51, -(v36 - v19), 0.0);
    x = v52.origin.x;
    y = v52.origin.y;
    width = v52.size.width;
    height = v52.size.height;
    objc_msgSend(MEMORY[0x24BDE57C0], "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRColor whiteColor](CRColor, "whiteColor");
    v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(v41, "CGColor"));

    -[CRCameraReader ocrOverlayBackgroundOpacity](self, "ocrOverlayBackgroundOpacity");
    objc_msgSend(v5, "setOpacity:");
    +[CRColor blackColor](CRColor, "blackColor");
    v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "setForegroundColor:", objc_msgSend(v42, "CGColor"));

    objc_msgSend(v5, "setFrame:", x, y, width, height);
    objc_msgSend(v5, "setAlignmentMode:", *MEMORY[0x24BDE5800]);
    objc_msgSend(v5, "setFontSize:", 24.0);
    objc_msgSend(v4, "rotation");
    CATransform3DMakeRotation(&v50, (float)-v43, 0.0, 0.0, 1.0);
    v49 = v50;
    objc_msgSend(v5, "setTransform:", &v49);
    objc_msgSend(v5, "setAllowsFontSubpixelQuantization:", 1);
    objc_msgSend(v5, "setMasksToBounds:", 1);
    objc_msgSend(v5, "setCornerRadius:", 10.0);
    -[CRCameraReader ocrOverlayFontName](self, "ocrOverlayFontName");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "overlayString");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "string");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCameraReader attributedStringWithFrame:withFont:withString:color:](self, "attributedStringWithFrame:withFont:withString:color:", v44, v46, objc_msgSend(v5, "foregroundColor"), width, height);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setString:", v47);

  }
  return v5;
}

- (void)showTextDetectorObjects:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__CRCameraReader_showTextDetectorObjects___block_invoke;
  v6[3] = &unk_24C58B870;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __42__CRCameraReader_showTextDetectorObjects___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "textDetectorRTFeedback");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v19;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v19 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v5++), "removeFromSuperlayer");
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v3);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = *(id *)(a1 + 40);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(a1 + 32), "createTextLayerForRecognizedObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9), (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "layer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addSublayer:", v10);

        objc_msgSend(*(id *)(a1 + 32), "textDetectorRTFeedback");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v7);
  }

}

- (void)sendDidDisplayMessageStyle:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __45__CRCameraReader_sendDidDisplayMessageStyle___block_invoke;
  v3[3] = &unk_24C58B898;
  v3[4] = self;
  v3[5] = a3;
  cr_dispatch_async(MEMORY[0x24BDAC9B8], (uint64_t)v3);
}

void __45__CRCameraReader_sendDidDisplayMessageStyle___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;

  if (*(_QWORD *)(a1 + 40) != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "activityIndicator");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stopAnimating");

    if (*(_QWORD *)(a1 + 40) != 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "callbackDelegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_opt_respondsToSelector();

      if ((v4 & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "callbackDelegate");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "cameraReaderDidDisplayMessage:", *(_QWORD *)(a1 + 32));

      }
      if (*(_QWORD *)(a1 + 40) != 2)
        objc_msgSend(*(id *)(a1 + 32), "startSession");
    }
  }
}

- (void)sendDidFindTarget:(id)a3 frameTime:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11;

  v6 = a3;
  -[CRCameraReader delegateQueue](self, "delegateQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__CRCameraReader_sendDidFindTarget_frameTime___block_invoke;
  v9[3] = &unk_24C58BA30;
  v9[4] = self;
  v11 = *a4;
  v8 = v6;
  v10 = v8;
  cr_dispatch_async((uint64_t)v7, (uint64_t)v9);

}

void __46__CRCameraReader_sendDidFindTarget_frameTime___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  __int128 v9;
  uint64_t v10;
  CMTime v11;
  CMTime v12;
  CMTime rhs;
  CMTime lhs;
  CMTime time;

  if ((objc_msgSend(*(id *)(a1 + 32), "didSendFindBox") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setDidSendFindBox:", 1);
    objc_msgSend(*(id *)(a1 + 32), "callbackDelegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_opt_respondsToSelector();

    if ((v3 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "callbackDelegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "cameraReaderDidFindTarget:", *(_QWORD *)(a1 + 32));

    }
  }
  v12 = *(CMTime *)(a1 + 48);
  v5 = *(void **)(a1 + 32);
  if (v5)
    objc_msgSend(v5, "lastSendFindBox");
  else
    memset(&v11, 0, sizeof(v11));
  lhs = v12;
  rhs = v11;
  CMTimeSubtract(&time, &lhs, &rhs);
  if (CMTimeGetSeconds(&time) > 1.0)
  {
    v9 = *(_OWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 32), "setLastSendFindBox:", &v9);
    objc_msgSend(*(id *)(a1 + 32), "callbackDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "callbackDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cameraReaderDidFindTarget:withCorners:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    }
  }
}

- (void)sendDidEndWithErrorDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  id v6;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CRCameraReader sendDidEndWithError:](self, "sendDidEndWithError:");

}

- (NSArray)outputObjectTypes
{
  return (NSArray *)(id)-[NSArray copy](self->_outputObjectTypes, "copy");
}

- (void)setOutputObjectTypes:(id)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  uint64_t v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  v5 = (NSArray *)a3;
  if (self->_outputObjectTypes != v5)
  {
    objc_storeStrong((id *)&self->_outputObjectTypes, a3);
    -[CRCameraReader releaseCorrectedCardBuffer](self, "releaseCorrectedCardBuffer");
    -[CRCameraReader createCorrectedCardBuffer](self, "createCorrectedCardBuffer");
    if (-[NSArray containsObject:](self->_outputObjectTypes, "containsObject:", CFSTR("CROutputTypeCameraText")))
    {
      v6 = *MEMORY[0x24BEB5B48];
      v7 = *MEMORY[0x24BEB5B50];
      v22[0] = *MEMORY[0x24BEB5B48];
      v22[1] = v7;
      v8 = (void *)MEMORY[0x24BDBCED8];
      v9 = *MEMORY[0x24BEB5B58];
      v23[0] = CFSTR("en-US");
      v23[1] = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dictionaryWithDictionary:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[CRCameraReader optionsDictionary](self, "optionsDictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v10) = v12 == 0;

      if ((v10 & 1) == 0)
      {
        -[CRCameraReader optionsDictionary](self, "optionsDictionary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addEntriesFromDictionary:", v13);

      }
      objc_msgSend(v11, "objectForKey:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("zh-Hans"));

      if (v15)
        objc_msgSend(v11, "setObject:forKey:", *MEMORY[0x24BEB5B68], *MEMORY[0x24BEB5B60]);
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB5B88]), "initWithOptions:", v11);
      -[CRCameraReader setOcrImageReader:](self, "setOcrImageReader:", v16);

      -[CRCameraReader ocrImageReader](self, "ocrImageReader");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *MEMORY[0x24BEB5B70];
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setOutputObjectTypes:", v18);

      v19 = (void *)objc_opt_new();
      -[CRCameraReader setTextDetectorRTFeedback:](self, "setTextDetectorRTFeedback:", v19);

      LODWORD(v20) = 0.75;
      -[CRCameraReader setOcrOverlayBackgroundOpacity:](self, "setOcrOverlayBackgroundOpacity:", v20);
      -[CRCameraReader setOcrOverlayFontName:](self, "setOcrOverlayFontName:", CFSTR("Helvetica"));

    }
  }

}

- (BOOL)hidePlacementText
{
  return self->_hidePlacementText;
}

- (void)setHidePlacementText:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  self->_hidePlacementText = a3;
  -[CRCameraReader alignmentLayer](self, "alignmentLayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "instructionLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (id)generateStringFromDate:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v4, "setDateFormat:", CFSTR("yyyyMMddHHmmssSSS"));
  objc_msgSend(v4, "stringFromDate:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)updateContactsCache:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  BOOL v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[7];

  v23[6] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BDBACF8], "authorizationStatusForEntityType:", 0) == 3)
  {
    v5 = *MEMORY[0x24BDBA2C8];
    v23[0] = *MEMORY[0x24BDBA2C0];
    v23[1] = v5;
    v6 = *MEMORY[0x24BDBA360];
    v23[2] = *MEMORY[0x24BDBA310];
    v23[3] = v6;
    v7 = *MEMORY[0x24BDBA328];
    v23[4] = *MEMORY[0x24BDBA358];
    v23[5] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBACB8]), "initWithKeysToFetch:", v8);
    v10 = objc_alloc_init(MEMORY[0x24BDBACF8]);
    -[CRCameraReader previousContactMatches](self, "previousContactMatches");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeAllObjects");

    v22 = 0;
    objc_msgSend(v10, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v8, &v22);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v22;
    objc_msgSend(v4, "objectForKey:", CFSTR("meContact"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v15 = 1;
    else
      v15 = v12 == 0;
    v16 = !v15;

    if (v16)
    {
      createCachedContact(v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("meContact"));

      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRCameraReader setContactsCache:](self, "setContactsCache:", v18);

    }
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __38__CRCameraReader_updateContactsCache___block_invoke;
    v20[3] = &unk_24C58BD68;
    v21 = v4;
    objc_msgSend(v10, "enumerateContactsWithFetchRequest:error:usingBlock:", v9, 0, v20);

  }
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCameraReader setContactsCache:](self, "setContactsCache:", v19);

}

void __38__CRCameraReader_updateContactsCache___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v12 = v5;
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = *(void **)(a1 + 32);
    createCachedContact(v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, v11);

  }
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= 0x1F4)
    *a3 = 1;

}

- (void)mergeInfo:(id)a3 intoFindInfo:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__CRCameraReader_mergeInfo_intoFindInfo___block_invoke;
  v7[3] = &unk_24C58BD90;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __41__CRCameraReader_mergeInfo_intoFindInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v9);
  }

}

- (id)extractFinalDigitStringFromNumbers:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("0123456789 "));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invertedSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsJoinedByString:", &stru_24C599708);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (CGRect)uniformPadRect:(CGRect)a3 widthPadding:(float)a4 heightPadding:(float)a5 width:(double)a6 height:(double)a7
{
  double height;
  double width;
  double y;
  CGFloat x;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14 = fmin(a4, fmin(a3.origin.x, a6 - CGRectGetMaxX(a3)));
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v15 = fmin(a5, fmin(y, a7 - CGRectGetMaxY(v19)));
  if (v15 <= 0.0 || v14 <= 0.0)
  {
    NSLog(CFSTR("CoreRecognition:uniformPadRect attempting to negative pad ID image skipping padding maxPaddingX %f maxPaddingy %f"), *(_QWORD *)&v14, *(_QWORD *)&v15);
  }
  else
  {
    v16 = fmin(v14 / width, v15 / height);
    v17 = -(height * v16);
    v18 = -(width * v16);
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    v21 = CGRectInset(v20, v17, v18);
    x = v21.origin.x;
    y = v21.origin.y;
    width = v21.size.width;
    height = v21.size.height;
  }
  v25.origin.x = 0.0;
  v25.origin.y = 0.0;
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  v25.size.width = a6;
  v25.size.height = a7;
  v23 = CGRectIntersection(v22, v25);
  return CGRectIntegral(v23);
}

+ (CGRect)aspectRatioPaddedRect:(CGRect)a3 expectedWidth:(double)a4 height:(double)a5 orientation:(unsigned int)a6
{
  double width;
  double height;
  double x;
  double y;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  width = a3.size.width;
  height = a3.size.height;
  x = a3.origin.x;
  y = a3.origin.y;
  v10 = a4 / a5;
  if (a6 != 6)
  {
    width = a3.size.width;
    height = a3.size.height;
    x = a3.origin.x;
    y = a3.origin.y;
    if (a6 != 8)
    {
      width = a3.size.height;
      height = a3.size.width;
      x = a3.origin.y;
      y = a3.origin.x;
    }
  }
  if (width / height > v10)
  {
    v11 = (width * a5 / a4 - height) * 0.5;
    v12 = 0.0;
    if (y - v11 >= 0.0)
      y = v11;
    else
      v12 = (v11 - y) * a4 / a5;
    if (a6 == 8 || a6 == 6)
    {
      v14 = -y;
    }
    else
    {
      v14 = v12;
      v12 = -y;
    }
LABEL_20:
    a3 = CGRectInset(a3, v12, v14);
    return CGRectIntegral(a3);
  }
  if (v10 > width / height)
  {
    v13 = (height * a4 / a5 - width) * 0.5;
    v12 = 0.0;
    if (x - v13 >= 0.0)
      x = v13;
    else
      v12 = (v13 - x) * a5 / a4;
    if (a6 == 8 || a6 == 6)
    {
      v14 = v12;
      v12 = -x;
    }
    else
    {
      v14 = -x;
    }
    goto LABEL_20;
  }
  return CGRectIntegral(a3);
}

- (CRCameraReaderDelegate)callbackDelegate
{
  return (CRCameraReaderDelegate *)objc_loadWeakRetained((id *)&self->_callbackDelegate);
}

- (void)setCallbackDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_callbackDelegate, a3);
}

- (UIColor)maskColor
{
  return self->_maskColor;
}

- (UIColor)maskOutlineColor
{
  return self->_maskOutlineColor;
}

- (UIColor)placementTextColor
{
  return self->_placementTextColor;
}

- (void)setPlacementTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (UIColor)capturedTextColor
{
  return self->_capturedTextColor;
}

- (BOOL)enableAltIDCardScan
{
  return self->_enableAltIDCardScan;
}

- (void)setEnableAltIDCardScan:(BOOL)a3
{
  self->_enableAltIDCardScan = a3;
}

- (float)borderPaddingIDCard
{
  return self->_borderPaddingIDCard;
}

- (void)setBorderPaddingIDCard:(float)a3
{
  self->_borderPaddingIDCard = a3;
}

- (__CVBuffer)correctedCardBuffer
{
  return self->_correctedCardBuffer;
}

- (void)setCorrectedCardBuffer:(__CVBuffer *)a3
{
  self->_correctedCardBuffer = a3;
}

- (BOOL)configPresentCentered
{
  return self->_configPresentCentered;
}

- (void)setConfigPresentCentered:(BOOL)a3
{
  self->_configPresentCentered = a3;
}

- (double)configDemoSpeed
{
  return self->_configDemoSpeed;
}

- (void)setConfigDemoSpeed:(double)a3
{
  self->_configDemoSpeed = a3;
}

- (CRBoxLayer)boxLayer
{
  return (CRBoxLayer *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setBoxLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1056);
}

- (DiagnosticHUDLayer)diagnosticHUDLayer
{
  return (DiagnosticHUDLayer *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setDiagnosticHUDLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1064);
}

- (NSArray)foundPoints
{
  return (NSArray *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setFoundPoints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1072);
}

- (NSString)foundCode
{
  return (NSString *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setFoundCode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1080);
}

- (BOOL)isQRCode
{
  return self->_isQRCode;
}

- (void)setIsQRCode:(BOOL)a3
{
  self->_isQRCode = a3;
}

- (NSString)previousCode
{
  return (NSString *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setPreviousCode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1088);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)sessionStarted
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_sessionStarted, 24, 1, 0);
  return result;
}

- (void)setSessionStarted:(id *)a3
{
  objc_copyStruct(&self->_sessionStarted, a3, 24, 1, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)pointsFound
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_pointsFound, 24, 1, 0);
  return result;
}

- (void)setPointsFound:(id *)a3
{
  objc_copyStruct(&self->_pointsFound, a3, 24, 1, 0);
}

- (NSDate)codePresented
{
  return (NSDate *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setCodePresented:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1096);
}

- (BOOL)codeInverted
{
  return self->_codeInverted;
}

- (void)setCodeInverted:(BOOL)a3
{
  self->_codeInverted = a3;
}

- (BOOL)didSendEndOrCancel
{
  return self->_didSendEndOrCancel;
}

- (void)setDidSendEndOrCancel:(BOOL)a3
{
  self->_didSendEndOrCancel = a3;
}

- (BOOL)didSendFindBox
{
  return self->_didSendFindBox;
}

- (void)setDidSendFindBox:(BOOL)a3
{
  self->_didSendFindBox = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastSendFindBox
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_lastSendFindBox, 24, 1, 0);
  return result;
}

- (void)setLastSendFindBox:(id *)a3
{
  objc_copyStruct(&self->_lastSendFindBox, a3, 24, 1, 0);
}

- (unint64_t)imagesToCapture
{
  return self->_imagesToCapture;
}

- (void)setImagesToCapture:(unint64_t)a3
{
  self->_imagesToCapture = a3;
}

- (BOOL)configUseJPEGForColor
{
  return self->_configUseJPEGForColor;
}

- (void)setConfigUseJPEGForColor:(BOOL)a3
{
  self->_configUseJPEGForColor = a3;
}

- (NSPointerArray)captureBuffer
{
  return (NSPointerArray *)objc_getProperty(self, a2, 1112, 1);
}

- (void)setCaptureBuffer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1112);
}

- (CRPollingTimer)boxLayerHideTimer
{
  return (CRPollingTimer *)objc_getProperty(self, a2, 1120, 1);
}

- (void)setBoxLayerHideTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1120);
}

- (BOOL)configUseFastScanning
{
  return self->_configUseFastScanning;
}

- (void)setConfigUseFastScanning:(BOOL)a3
{
  self->_configUseFastScanning = a3;
}

- (opaqueCMSampleBuffer)lastBuffer
{
  return self->_lastBuffer;
}

- (void)setLastBuffer:(opaqueCMSampleBuffer *)a3
{
  self->_lastBuffer = a3;
}

- (OS_dispatch_semaphore)processingImage
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 1136, 1);
}

- (void)setProcessingImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1136);
}

- (NSMutableDictionary)cardNumberCounts
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 1144, 1);
}

- (void)setCardNumberCounts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1144);
}

- (NSMutableDictionary)cardholderCounts
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 1152, 1);
}

- (void)setCardholderCounts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1152);
}

- (NSMutableDictionary)expirationDateCounts
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 1160, 1);
}

- (void)setExpirationDateCounts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1160);
}

- (NSMutableDictionary)pinnedFoundInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 1168, 1);
}

- (void)setPinnedFoundInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1168);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastFieldFoundTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_lastFieldFoundTime, 24, 1, 0);
  return result;
}

- (void)setLastFieldFoundTime:(id *)a3
{
  objc_copyStruct(&self->_lastFieldFoundTime, a3, 24, 1, 0);
}

- (CRAlignmentLayer)alignmentLayer
{
  return (CRAlignmentLayer *)objc_getProperty(self, a2, 1176, 1);
}

- (void)setAlignmentLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1176);
}

- (OS_dispatch_queue)processingQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 1184, 1);
}

- (void)setProcessingQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1184);
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 1192, 1);
}

- (void)setDelegateQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1192);
}

- (UIActivityIndicatorView)activityIndicator
{
  return (UIActivityIndicatorView *)objc_getProperty(self, a2, 1200, 1);
}

- (void)setActivityIndicator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1200);
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return (UITapGestureRecognizer *)objc_getProperty(self, a2, 1208, 1);
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1208);
}

- (BOOL)previousIdleState
{
  return self->_previousIdleState;
}

- (void)setPreviousIdleState:(BOOL)a3
{
  self->_previousIdleState = a3;
}

- (NSMutableArray)dateCutRects
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1216, 1);
}

- (void)setDateCutRects:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1216);
}

- (NSMutableArray)nameCutRects
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1224, 1);
}

- (void)setNameCutRects:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1224);
}

- (NSDictionary)contactsCache
{
  return (NSDictionary *)objc_getProperty(self, a2, 1232, 1);
}

- (void)setContactsCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1232);
}

- (NSCache)previousContactMatches
{
  return (NSCache *)objc_getProperty(self, a2, 1240, 1);
}

- (void)setPreviousContactMatches:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1240);
}

- (BOOL)sessionIsStopping
{
  return self->_sessionIsStopping;
}

- (void)setSessionIsStopping:(BOOL)a3
{
  self->_sessionIsStopping = a3;
}

- (CRMLCCModel)flatPrintedModel
{
  return (CRMLCCModel *)objc_getProperty(self, a2, 1248, 1);
}

- (void)setFlatPrintedModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1248);
}

- (CRMLCCModel)embossedNumberModel
{
  return (CRMLCCModel *)objc_getProperty(self, a2, 1256, 1);
}

- (void)setEmbossedNumberModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1256);
}

- (CRMLCCModel)embossedExpirationModel
{
  return (CRMLCCModel *)objc_getProperty(self, a2, 1264, 1);
}

- (void)setEmbossedExpirationModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1264);
}

- (CRMLCCModel)embossedCardholderModel
{
  return (CRMLCCModel *)objc_getProperty(self, a2, 1272, 1);
}

- (void)setEmbossedCardholderModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1272);
}

- (NSMutableArray)cardBlurValues
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1280, 1);
}

- (void)setCardBlurValues:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1280);
}

- (NSMutableDictionary)optionsDictionary
{
  return self->_optionsDictionary;
}

- (void)setOptionsDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_optionsDictionary, a3);
}

- (CRImageReader)ocrImageReader
{
  return self->_ocrImageReader;
}

- (void)setOcrImageReader:(id)a3
{
  objc_storeStrong((id *)&self->_ocrImageReader, a3);
}

- (CATextLayer)overlayTextLayer
{
  return self->_overlayTextLayer;
}

- (void)setOverlayTextLayer:(id)a3
{
  objc_storeStrong((id *)&self->_overlayTextLayer, a3);
}

- (NSMutableArray)textDetectorRTFeedback
{
  return self->_textDetectorRTFeedback;
}

- (void)setTextDetectorRTFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_textDetectorRTFeedback, a3);
}

- (NSString)ocrOverlayFontName
{
  return (NSString *)objc_getProperty(self, a2, 1320, 1);
}

- (void)setOcrOverlayFontName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1320);
}

- (float)ocrOverlayBackgroundOpacity
{
  return self->_ocrOverlayBackgroundOpacity;
}

- (void)setOcrOverlayBackgroundOpacity:(float)a3
{
  self->_ocrOverlayBackgroundOpacity = a3;
}

- (BOOL)continousMode
{
  return self->_continousMode;
}

- (void)setContinousMode:(BOOL)a3
{
  self->_continousMode = a3;
}

- (BOOL)isCaptureMode
{
  return self->_captureMode;
}

- (void)setCaptureMode:(BOOL)a3
{
  self->_captureMode = a3;
}

- (unint64_t)captureCount
{
  return self->_captureCount;
}

- (void)setCaptureCount:(unint64_t)a3
{
  self->_captureCount = a3;
}

- (double)sessionTimeout
{
  return self->_sessionTimeout;
}

- (void)setSessionTimeout:(double)a3
{
  self->_sessionTimeout = a3;
}

- (int64_t)whiteBalanceMode
{
  return self->_whiteBalanceMode;
}

- (void)setWhiteBalanceMode:(int64_t)a3
{
  self->_whiteBalanceMode = a3;
}

- (int64_t)focusMode
{
  return self->_focusMode;
}

- (void)setFocusMode:(int64_t)a3
{
  self->_focusMode = a3;
}

- (int64_t)exposureMode
{
  return self->_exposureMode;
}

- (void)setExposureMode:(int64_t)a3
{
  self->_exposureMode = a3;
}

- (int64_t)torchMode
{
  return self->_torchMode;
}

- (void)setTorchMode:(int64_t)a3
{
  self->_torchMode = a3;
}

- (NSString)cameraMode
{
  return (NSString *)objc_getProperty(self, a2, 1376, 1);
}

- (void)setCameraMode:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1376);
}

- (int64_t)cameraPosition
{
  return self->_cameraPosition;
}

- (void)setCameraPosition:(int64_t)a3
{
  self->_cameraPosition = a3;
}

- (BOOL)showDiagnosticHUD
{
  return self->_showDiagnosticHUD;
}

- (void)setShowDiagnosticHUD:(BOOL)a3
{
  self->_showDiagnosticHUD = a3;
}

- (CRCaptureSessionManager)sessionManager
{
  return (CRCaptureSessionManager *)objc_getProperty(self, a2, 1392, 1);
}

- (void)setSessionManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1392);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_cameraMode, 0);
  objc_storeStrong((id *)&self->_ocrOverlayFontName, 0);
  objc_storeStrong((id *)&self->_textDetectorRTFeedback, 0);
  objc_storeStrong((id *)&self->_overlayTextLayer, 0);
  objc_storeStrong((id *)&self->_ocrImageReader, 0);
  objc_storeStrong((id *)&self->_optionsDictionary, 0);
  objc_storeStrong((id *)&self->_cardBlurValues, 0);
  objc_storeStrong((id *)&self->_embossedCardholderModel, 0);
  objc_storeStrong((id *)&self->_embossedExpirationModel, 0);
  objc_storeStrong((id *)&self->_embossedNumberModel, 0);
  objc_storeStrong((id *)&self->_flatPrintedModel, 0);
  objc_storeStrong((id *)&self->_previousContactMatches, 0);
  objc_storeStrong((id *)&self->_contactsCache, 0);
  objc_storeStrong((id *)&self->_nameCutRects, 0);
  objc_storeStrong((id *)&self->_dateCutRects, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_alignmentLayer, 0);
  objc_storeStrong((id *)&self->_pinnedFoundInfo, 0);
  objc_storeStrong((id *)&self->_expirationDateCounts, 0);
  objc_storeStrong((id *)&self->_cardholderCounts, 0);
  objc_storeStrong((id *)&self->_cardNumberCounts, 0);
  objc_storeStrong((id *)&self->_processingImage, 0);
  objc_storeStrong((id *)&self->_boxLayerHideTimer, 0);
  objc_storeStrong((id *)&self->_captureBuffer, 0);
  objc_storeStrong((id *)&self->_codePresented, 0);
  objc_storeStrong((id *)&self->_previousCode, 0);
  objc_storeStrong((id *)&self->_foundCode, 0);
  objc_storeStrong((id *)&self->_foundPoints, 0);
  objc_storeStrong((id *)&self->_diagnosticHUDLayer, 0);
  objc_storeStrong((id *)&self->_boxLayer, 0);
  objc_storeStrong((id *)&self->_capturedTextColor, 0);
  objc_storeStrong((id *)&self->_placementTextColor, 0);
  objc_storeStrong((id *)&self->_maskOutlineColor, 0);
  objc_storeStrong((id *)&self->_maskColor, 0);
  objc_destroyWeak((id *)&self->_callbackDelegate);
  objc_storeStrong((id *)&self->_outputObjectTypes, 0);
}

@end
