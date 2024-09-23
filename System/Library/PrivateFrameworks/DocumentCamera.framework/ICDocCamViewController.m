@implementation ICDocCamViewController

- (id)imageMeshTransformWithImage:(id)a3 backgroundImage:(id)a4 imageViewFrame:(CGRect)a5 imageQuad:(id)a6 previewView:(id)a7 previewBounds:(CGRect)a8 scrimView:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  double v16;
  double v17;
  double v18;
  double v19;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  ICDocCamViewControllerMeshTransform *v27;
  void *v28;
  ICDocCamViewControllerMeshTransform *v29;

  height = a8.size.height;
  width = a8.size.width;
  y = a8.origin.y;
  x = a8.origin.x;
  v16 = a5.size.height;
  v17 = a5.size.width;
  v18 = a5.origin.y;
  v19 = a5.origin.x;
  v22 = a9;
  v23 = a7;
  v24 = a6;
  v25 = a4;
  v26 = a3;
  v27 = [ICDocCamViewControllerMeshTransform alloc];
  -[ICDocCamViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[ICDocCamViewControllerMeshTransform initWithImage:backgroundImage:imageViewFrame:view:imageQuad:previewView:previewBounds:scrimView:](v27, "initWithImage:backgroundImage:imageViewFrame:view:imageQuad:previewView:previewBounds:scrimView:", v26, v25, v28, v24, v23, v22, v19, v18, v17, v16, x, y, width, height);

  return v29;
}

- (void)pushViewController:(id)a3 type:(id)a4 subtype:(id)a5 duration:(double)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  ICDocCamViewController *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  objc_msgSend(MEMORY[0x24BDE57E8], "animation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v16 = (void *)MEMORY[0x212B988FC](v14);
    objc_msgSend(v15, "setValue:forKey:", v16, CFSTR("animationCompletionBlockKey"));

    v17 = self;
  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(v15, "setDelegate:", v17);
  objc_msgSend(v15, "setRemovedOnCompletion:", 1);
  objc_msgSend(v15, "setDuration:", a6);
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTimingFunction:", v18);

  objc_msgSend(v15, "setType:", v12);
  objc_msgSend(v15, "setSubtype:", v13);
  -[ICDocCamViewController navigationController](self, "navigationController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addAnimation:forKey:", v15, 0);

  -[ICDocCamViewController navigationController](self, "navigationController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "pushViewController:animated:", v23, 0);

}

- (void)popViewController:(id)a3 subtype:(id)a4 duration:(double)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  ICDocCamViewController *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;

  v21 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(MEMORY[0x24BDE57E8], "animation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v13 = (void *)MEMORY[0x212B988FC](v11);
    objc_msgSend(v12, "setValue:forKey:", v13, CFSTR("animationCompletionBlockKey"));

    v14 = self;
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v12, "setDelegate:", v14);
  objc_msgSend(v12, "setRemovedOnCompletion:", 1);
  objc_msgSend(v12, "setDuration:", a5);
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTimingFunction:", v15);

  objc_msgSend(v12, "setType:", v21);
  objc_msgSend(v12, "setSubtype:", v10);
  -[ICDocCamViewController navigationController](self, "navigationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAnimation:forKey:", v12, 0);

  -[ICDocCamViewController navigationController](self, "navigationController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v19, "popViewControllerAnimated:", 0);

}

- (void)setViewControllers:(id)a3 type:(id)a4 subtype:(id)a5 duration:(double)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  objc_msgSend(MEMORY[0x24BDE57E8], "animation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v16 = (void *)MEMORY[0x212B988FC](v14);
    objc_msgSend(v15, "setValue:forKey:", v16, CFSTR("animationCompletionBlockKey"));

  }
  objc_msgSend(v15, "setDelegate:", self);
  objc_msgSend(v15, "setRemovedOnCompletion:", 0);
  objc_msgSend(v15, "setDuration:", a6);
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTimingFunction:", v17);

  objc_msgSend(v15, "setType:", v12);
  objc_msgSend(v15, "setSubtype:", v13);
  -[ICDocCamViewController navigationController](self, "navigationController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addAnimation:forKey:", v15, 0);

  -[ICDocCamViewController navigationController](self, "navigationController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setViewControllers:animated:", v22, 0);

}

- (CIContext)sharedCoreImageContext
{
  ICDocCamViewController *v2;
  CIContext *sharedCoreImageContext;
  uint64_t v4;
  CIContext *v5;
  CIContext *v6;

  v2 = self;
  objc_sync_enter(v2);
  sharedCoreImageContext = v2->_sharedCoreImageContext;
  if (!sharedCoreImageContext)
  {
    +[ICDocCamImageFilters sharedCoreImageContext](ICDocCamImageFilters, "sharedCoreImageContext");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v2->_sharedCoreImageContext;
    v2->_sharedCoreImageContext = (CIContext *)v4;

    sharedCoreImageContext = v2->_sharedCoreImageContext;
  }
  v6 = sharedCoreImageContext;
  objc_sync_exit(v2);

  return v6;
}

+ (float)cameraIntrinsicMatrixForWidth:(double)a1 height:(double)a2 pixelFocalLength:(float)a3
{
  __asm
  {
    FMOV            V1.2S, #-1.0
    FMOV            V3.4S, #1.0
  }
  return a3;
}

+ (void)initialize
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___ICDocCamViewController;
  objc_msgSendSuper2(&v3, sel_initialize);
  if ((id)objc_opt_class() == a1)
    +[ICDocCamViewController registerDefaults](ICDocCamViewController, "registerDefaults");
}

+ (void)registerDefaults
{
  void *v2;
  void *v3;
  _QWORD v4[23];
  _QWORD v5[24];

  v5[23] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = CFSTR("internalSettings.docCam.rectangle.segmentFudgeFactor");
  v4[1] = CFSTR("internalSettings.docCam.rectangle.segmentVisualConfidence");
  v5[0] = &unk_24C5D7F80;
  v5[1] = &unk_24C5D7F90;
  v4[2] = CFSTR("internalSettings.docCam.rectangle.segmentVisualConfidence60Frames");
  v4[3] = CFSTR("internalSettings.docCam.rectangle.segmentVisualConfidenceFinalScan");
  v5[2] = &unk_24C5D7FA0;
  v5[3] = &unk_24C5D7FB0;
  v4[4] = CFSTR("internalSettings.docCam.rectangle.segmentStabilityStdDev");
  v4[5] = CFSTR("internalSettings.docCam.rectangle.minimumAspectRatio");
  v5[4] = &unk_24C5D7FC0;
  v5[5] = &unk_24C5D7FD0;
  v4[6] = CFSTR("internalSettings.docCam.rectangle.maximumAspectRatio");
  v4[7] = CFSTR("internalSettings.docCam.rectangle.quadratureTolerance");
  v5[6] = &unk_24C5D7FE0;
  v5[7] = &unk_24C5D7FF0;
  v4[8] = CFSTR("internalSettings.docCam.rectangle.minimumSize");
  v4[9] = CFSTR("internalSettings.docCam.rectangle.minimumConfidence");
  v5[8] = &unk_24C5D8000;
  v5[9] = &unk_24C5D7FA0;
  v4[10] = CFSTR("internalSettings.docCam.rectangle.visualConfidence");
  v4[11] = CFSTR("internalSettings.docCam.rectangle.maximumNumber");
  v5[10] = &unk_24C5D8010;
  v5[11] = &unk_24C5D8280;
  v4[12] = CFSTR("internalSettings.docCam.rectangle.stabilityStdDev");
  v4[13] = CFSTR("internalSettings.docCam.rectangle.detectionEnabled");
  v5[12] = &unk_24C5D8020;
  v5[13] = MEMORY[0x24BDBD1C8];
  v4[14] = CFSTR("internalSettings.docCam.registration.enabled");
  v4[15] = CFSTR("internalSettings.docCam.debugRectangles.enabled");
  v5[14] = MEMORY[0x24BDBD1C0];
  v5[15] = MEMORY[0x24BDBD1C0];
  v4[16] = CFSTR("internalSettings.docCam.displayString.enabled");
  v4[17] = CFSTR("internalSettings.docCam.rectangle.realTime");
  v5[16] = MEMORY[0x24BDBD1C0];
  v5[17] = MEMORY[0x24BDBD1C0];
  v4[18] = CFSTR("internalSettings.docCam.rectangle.synchronous");
  v4[19] = CFSTR("internalSettings.docCam.rectangle.queueSize");
  v5[18] = MEMORY[0x24BDBD1C0];
  v5[19] = &unk_24C5D8298;
  v4[20] = CFSTR("internalSettings.docCam.imageStabilization.disabled");
  v4[21] = CFSTR("internalSettings.docCam.format");
  v5[20] = MEMORY[0x24BDBD1C0];
  v5[21] = &unk_24C5D82B0;
  v4[22] = CFSTR("internalSettings.docCam.scanMovieRecording.enabled");
  v5[22] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 23);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerDefaults:", v3);

}

- (ICDocCamViewController)initWithImageCache:(id)a3
{
  id v4;
  void *v5;
  ICDocCamViewController *v6;
  ICDocCamDocumentInfoCollection *v7;
  ICDocCamDocumentInfoCollection *documentInfoCollection;
  id v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)ICDocCamViewController;
  v6 = -[ICDocCamViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, CFSTR("ICDocCamViewController"), v5);

  if (v6)
  {
    v7 = objc_alloc_init(ICDocCamDocumentInfoCollection);
    documentInfoCollection = v6->_documentInfoCollection;
    v6->_documentInfoCollection = v7;

    -[ICDocCamViewController setImageCache:](v6, "setImageCache:", v4);
    v9 = objc_alloc_init(MEMORY[0x24BE0B650]);
    -[ICDocCamViewController setAccelerometer:](v6, "setAccelerometer:", v9);

  }
  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  UIColor *v6;
  UIColor *cameraHighlightColor;
  NSObject *v8;
  dispatch_queue_t v9;
  void *v10;
  ICDocCamSpinner *v11;
  void *v12;
  ICDocCamSpinner *v13;
  dispatch_semaphore_t v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  ICDocCamProcessingBlocker *v23;
  void *v24;
  ICDocCamProcessingBlocker *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  ICDocCamRectangleResultsQueue *v30;
  void *v31;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)ICDocCamViewController;
  -[ICDocCamViewController viewDidLoad](&v32, sel_viewDidLoad);
  v3 = (void *)UIAccessibilityLibrary();
  dlsym(v3, "_UIAccessibilityStart");
  -[ICDocCamViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dc_lighterColor");
  v6 = (UIColor *)objc_claimAutoreleasedReturnValue();
  cameraHighlightColor = self->_cameraHighlightColor;
  self->_cameraHighlightColor = v6;

  -[ICDocCamViewController preWarmFilters](self, "preWarmFilters");
  -[ICDocCamViewController setUpUserDefaults](self, "setUpUserDefaults");
  -[ICDocCamViewController setCaptureDebugDone:](self, "setCaptureDebugDone:", 0);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_queue_create("com.apple.documentcamera.DocCamSpinnerQueue", v8);
  -[ICDocCamViewController setSnapshotSpinnerQueue:](self, "setSnapshotSpinnerQueue:", v9);

  +[DCSettings sharedSettings](DCSettings, "sharedSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v10, "finishAfterFirstScan");

  if ((v9 & 1) == 0)
  {
    v11 = [ICDocCamSpinner alloc];
    -[ICDocCamViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[ICDocCamSpinner initWithView:minimumDuration:](v11, "initWithView:minimumDuration:", v12, 1.0);
    -[ICDocCamViewController setSnapshotSpinner:](self, "setSnapshotSpinner:", v13);

  }
  v14 = dispatch_semaphore_create(1);
  -[ICDocCamViewController setFlashAndFilterUISemaphore:](self, "setFlashAndFilterUISemaphore:", v14);

  -[ICDocCamViewController previewView](self, "previewView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = 0;
  objc_msgSend(v16, "setOpacity:", v17);

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel_singleTap);
  -[ICDocCamViewController setSingleTapGestureRecognizer:](self, "setSingleTapGestureRecognizer:", v18);

  -[ICDocCamViewController singleTapGestureRecognizer](self, "singleTapGestureRecognizer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setNumberOfTapsRequired:", 1);

  -[ICDocCamViewController singleTapGestureRecognizer](self, "singleTapGestureRecognizer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDelegate:", self);

  -[ICDocCamViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController singleTapGestureRecognizer](self, "singleTapGestureRecognizer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addGestureRecognizer:", v22);

  -[ICDocCamViewController setSnapStillImageMode:](self, "setSnapStillImageMode:", 0);
  -[ICDocCamViewController setDefaultFilter:](self, "setDefaultFilter:", 1);
  v23 = -[ICDocCamProcessingBlocker initWithDelegate:]([ICDocCamProcessingBlocker alloc], "initWithDelegate:", self);
  -[ICDocCamViewController setProcessRequestsBlocker:](self, "setProcessRequestsBlocker:", v23);

  -[ICDocCamViewController processRequestsBlocker](self, "processRequestsBlocker");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addBlockerOfType:clearRectangles:clearQueue:", CFSTR("ViewLifetimeBlocker"), 1, 1);

  v25 = -[ICDocCamProcessingBlocker initWithDelegate:]([ICDocCamProcessingBlocker alloc], "initWithDelegate:", self);
  -[ICDocCamViewController setSnapStillImageBlocker:](self, "setSnapStillImageBlocker:", v25);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObserver:selector:name:object:", self, sel_myApplicationWillResignActive_, *MEMORY[0x24BDF75D8], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObserver:selector:name:object:", self, sel_myApplicationDidBecomeActive_, *MEMORY[0x24BDF7510], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addObserver:selector:name:object:", self, sel_contentSizeCategoryDidChange_, *MEMORY[0x24BDF7670], 0);

  -[ICDocCamViewController setDidAddAppLifetimeObservers:](self, "setDidAddAppLifetimeObservers:", 1);
  -[ICDocCamViewController disableRetakeMode](self, "disableRetakeMode");
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController setLastSubjectAreaChange:](self, "setLastSubjectAreaChange:", v29);

  self->_requestTimeSum = 0.0;
  self->_requestTimeIndex = 0;
  *(_OWORD *)&self->_requestTime[6] = 0u;
  *(_OWORD *)&self->_requestTime[8] = 0u;
  *(_OWORD *)&self->_requestTime[2] = 0u;
  *(_OWORD *)&self->_requestTime[4] = 0u;
  *(_OWORD *)self->_requestTime = 0u;
  v30 = objc_alloc_init(ICDocCamRectangleResultsQueue);
  -[ICDocCamViewController setRectResultsQueue:](self, "setRectResultsQueue:", v30);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController setRecentRectangleObservations:](self, "setRecentRectangleObservations:", v31);

  -[ICDocCamViewController initializeUserInterface](self, "initializeUserInterface");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICDocCamViewController;
  -[ICDocCamViewController viewWillAppear:](&v10, sel_viewWillAppear_, a3);
  -[ICDocCamViewController setupThumbnailViewControllerIfNecessary](self, "setupThumbnailViewControllerIfNecessary");
  -[ICDocCamViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNavigationBarHidden:animated:", 1, 0);

  -[ICDocCamViewController session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[ICDocCamViewController launchCaptureSession](self, "launchCaptureSession");
  -[ICDocCamViewController updateFonts](self, "updateFonts");
  -[ICDocCamViewController documentInfoCollection](self, "documentInfoCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "docInfos");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "count"))
  {

    goto LABEL_7;
  }
  v8 = -[ICDocCamViewController isInRetakeMode](self, "isInRetakeMode");

  if (v8)
  {
LABEL_7:
    -[ICDocCamViewController saveButton](self, "saveButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 1);
    goto LABEL_8;
  }
  -[ICDocCamViewController saveButton](self, "saveButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", 0);
LABEL_8:

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICDocCamViewController;
  -[ICDocCamViewController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  -[ICDocCamViewController session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[ICDocCamViewController setupCaptureSession](self, "setupCaptureSession");
    -[ICDocCamViewController launchCaptureSession](self, "launchCaptureSession");
  }
  -[ICDocCamViewController createPhysicalCaptureRecognizerOrNotifierIfNecessary](self, "createPhysicalCaptureRecognizerOrNotifierIfNecessary");
  -[ICDocCamViewController updateFilterButtonTint](self, "updateFilterButtonTint");
  -[ICDocCamViewController processRequestsBlocker](self, "processRequestsBlocker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeBlockerOfType:", CFSTR("SaveActionBlocker"));

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdleTimerDisabled:", 1);

  -[ICDocCamViewController userPromptLabel](self, "userPromptLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController speakLabelTextForAccessibilityIfNecessary:afterDelay:](self, "speakLabelTextForAccessibilityIfNecessary:afterDelay:", v7, 3.0);

  -[ICDocCamViewController logAlgoChoice](self, "logAlgoChoice");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICDocCamViewController;
  -[ICDocCamViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[ICDocCamViewController processRequestsBlocker](self, "processRequestsBlocker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addBlockerOfType:clearRectangles:clearQueue:", CFSTR("ViewLifetimeBlocker"), 1, 1);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;
  _QWORD block[5];

  v3 = a3;
  -[ICDocCamViewController sessionQueue](self, "sessionQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__ICDocCamViewController_viewDidDisappear___block_invoke;
  block[3] = &unk_24C5B89B0;
  block[4] = self;
  dispatch_async(v5, block);

  v17.receiver = self;
  v17.super_class = (Class)ICDocCamViewController;
  -[ICDocCamViewController viewDidDisappear:](&v17, sel_viewDidDisappear_, v3);
  -[ICDocCamViewController previewView](self, "previewView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 0;
  objc_msgSend(v7, "setOpacity:", v8);

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIdleTimerDisabled:", 0);

  -[ICDocCamViewController presentedViewController](self, "presentedViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[ICDocCamViewController thumbnailViewController](self, "thumbnailViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "willMoveToParentViewController:", 0);

    -[ICDocCamViewController thumbnailViewController](self, "thumbnailViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeFromParentViewController");

    -[ICDocCamViewController thumbnailViewController](self, "thumbnailViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeFromSuperview");

    -[ICDocCamViewController setThumbnailViewController:](self, "setThumbnailViewController:", 0);
  }
  -[ICDocCamViewController physicalCaptureRecognizer](self, "physicalCaptureRecognizer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setEnabled:", 0);

  -[ICDocCamViewController physicalCaptureNotifier](self, "physicalCaptureNotifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setEnabled:", 0);

}

void __43__ICDocCamViewController_viewDidDisappear___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;

  if (!objc_msgSend(*(id *)(a1 + 32), "setupResult"))
  {
    objc_msgSend(*(id *)(a1 + 32), "session");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isRunning");

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "session");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stopRunning");

      objc_msgSend(*(id *)(a1 + 32), "removeObserversIfNecessary");
    }
  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIColor *v11;
  UIColor *cameraHighlightColor;

  -[ICDocCamViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[ICDocCamViewController setViewBoundsSize:](self, "setViewBoundsSize:", v4, v5);

  -[ICDocCamViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController setStatusBarOrientation:](self, "setStatusBarOrientation:", objc_msgSend(v8, "interfaceOrientation"));

  -[ICDocCamViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tintColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dc_lighterColor");
  v11 = (UIColor *)objc_claimAutoreleasedReturnValue();
  cameraHighlightColor = self->_cameraHighlightColor;
  self->_cameraHighlightColor = v11;

  -[ICDocCamViewController setupThumbnailViewControllerIfNecessary](self, "setupThumbnailViewControllerIfNecessary");
  -[ICDocCamViewController updateAutoButtonTitleForAutoMode:](self, "updateAutoButtonTitleForAutoMode:", -[ICDocCamViewController autoMode](self, "autoMode"));
  -[ICDocCamViewController updateFilterAndFlashButtons](self, "updateFilterAndFlashButtons");
  -[ICDocCamViewController updateAllConstraints](self, "updateAllConstraints");
  -[ICDocCamViewController setUpFilterScrollView](self, "setUpFilterScrollView");
}

- (void)dealloc
{
  objc_super v3;

  -[ICDocCamViewController removeAllNotifications](self, "removeAllNotifications");
  v3.receiver = self;
  v3.super_class = (Class)ICDocCamViewController;
  -[ICDocCamViewController dealloc](&v3, sel_dealloc);
}

- (void)viewSafeAreaInsetsDidChange
{
  void *v3;
  objc_super v4;

  -[ICDocCamViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  -[ICDocCamViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUpdateConstraints");

  v4.receiver = self;
  v4.super_class = (Class)ICDocCamViewController;
  -[ICDocCamViewController viewSafeAreaInsetsDidChange](&v4, sel_viewSafeAreaInsetsDidChange);
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)ICDocCamViewController;
  -[ICDocCamViewController traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, v4);
  -[ICDocCamViewController updateLabelColors](self, "updateLabelColors");

}

- (void)initializeUserInterface
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
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
  _BOOL8 v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  double v79;
  double v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  double v91;
  double v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  id v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  double v106;
  double v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  id v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  double v121;
  double v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  uint64_t v127;
  double *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  id v134;
  uint64_t v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  double v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  id v148;
  uint64_t v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  double v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  uint64_t v160;
  double v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  double v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  id v193;
  void *v194;
  id v195;
  id v196;
  id v197;
  id v198;
  id v199;
  id v200;
  id v201;
  id v202;
  id v203;
  id v204;
  id v205;
  id v206;
  id v207;
  id v208;
  id v209;
  id v210;
  id v211;
  id v212;
  id v213;
  id v214;
  id v215;
  id v216;
  id v217;
  id v218;
  id v219;
  id v220;
  id v221;
  id v222;
  id v223;
  id v224;
  id v225;
  id v226;
  id v227;
  id v228;
  id v229;
  id v230;
  id v231;
  id v232;
  id v233;
  id v234;
  id v235;
  id v236;

  v3 = -[ICDocCamViewController scanMovieRecordingEnabled](self, "scanMovieRecordingEnabled");
  -[ICDocCamViewController recordButton](self, "recordButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v196 = v4;
  if (v3)
  {
    objc_msgSend(v4, "setEnabled:", 1);

    -[ICDocCamViewController recordButton](self, "recordButton");
    v197 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v197, "setHidden:", 0);
  }
  else
  {
    objc_msgSend(v4, "setEnabled:", 0);

    -[ICDocCamViewController recordButton](self, "recordButton");
    v197 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v197, "setHidden:", 1);
  }

  -[ICDocCamViewController view](self, "view");
  v198 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v198, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDF6FF8], "_applicationKeyWindow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController setStatusBarOrientation:](self, "setStatusBarOrientation:", objc_msgSend(v7, "interfaceOrientation"));

  if (!v5)
  -[ICDocCamViewController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", 15);
  -[ICDocCamViewController setExtendedLayoutIncludesOpaqueBars:](self, "setExtendedLayoutIncludesOpaqueBars:", 0);
  -[ICDocCamViewController navigationController](self, "navigationController");
  v199 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v199, "navigationBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBarStyle:", 0);

  objc_msgSend(MEMORY[0x24BDF6950], "dc_barColor");
  v200 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBarTintColor:", v200);

  -[ICDocCamViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  +[ICDocCamSaveButton buttonWithType:](ICDocCamSaveButton, "buttonWithType:", 1);
  v201 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController setSaveButton:](self, "setSaveButton:");

  -[ICDocCamViewController saveButton](self, "saveButton");
  v202 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v202, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[ICDocCamViewController saveButton](self, "saveButton");
  v203 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v203, "setHidden:", 1);

  -[ICDocCamViewController view](self, "view");
  v204 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController saveButton](self, "saveButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v204, "addSubview:", v11);

  -[ICDocCamViewController documentInfoCollection](self, "documentInfoCollection");
  v205 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v205, "docInfos");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  -[ICDocCamViewController saveButton](self, "saveButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDocumentCount:", v13);

  -[ICDocCamViewController saveButton](self, "saveButton");
  v206 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v206, "addTarget:action:forControlEvents:", self, sel_saveAction_, 64);

  -[ICDocCamViewController autoShutterOnView](self, "autoShutterOnView");
  v207 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v207, "setHidden:", 0);

  -[ICDocCamViewController autoShutterOnView](self, "autoShutterOnView");
  v208 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v208, "setAlpha:", 1.0);

  -[ICDocCamViewController autoShutterOnView](self, "autoShutterOnView");
  v209 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v209, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 0;
  objc_msgSend(v15, "setOpacity:", v16);

  -[ICDocCamViewController autoShutterOffView](self, "autoShutterOffView");
  v210 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v210, "setHidden:", 0);

  -[ICDocCamViewController autoShutterOffView](self, "autoShutterOffView");
  v211 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v211, "setAlpha:", 1.0);

  -[ICDocCamViewController autoShutterOffView](self, "autoShutterOffView");
  v212 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v212, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = 0;
  objc_msgSend(v17, "setOpacity:", v18);

  -[ICDocCamViewController filterNameFeedbackView](self, "filterNameFeedbackView");
  v213 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v213, "setHidden:", 0);

  -[ICDocCamViewController filterNameFeedbackView](self, "filterNameFeedbackView");
  v214 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v214, "setAlpha:", 1.0);

  -[ICDocCamViewController filterNameFeedbackView](self, "filterNameFeedbackView");
  v215 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v215, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v20) = 0;
  objc_msgSend(v19, "setOpacity:", v20);

  -[ICDocCamViewController moveCameraCloserView](self, "moveCameraCloserView");
  v216 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v216, "setHidden:", 0);

  -[ICDocCamViewController moveCameraCloserView](self, "moveCameraCloserView");
  v217 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v217, "setAlpha:", 1.0);

  -[ICDocCamViewController moveCameraCloserView](self, "moveCameraCloserView");
  v218 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v218, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v22) = 0;
  objc_msgSend(v21, "setOpacity:", v22);

  -[ICDocCamViewController setFilterSettingUIShowing:](self, "setFilterSettingUIShowing:", 0);
  -[ICDocCamViewController cameraUnavailableScrim](self, "cameraUnavailableScrim");
  v219 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v219, "setHidden:", 1);

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v220 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController autoShutterOnLabel](self, "autoShutterOnLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTextColor:", v220);

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v221 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController autoShutterOffLabel](self, "autoShutterOffLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTextColor:", v221);

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v222 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController filterNameFeedbackLabel](self, "filterNameFeedbackLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTextColor:", v222);

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v223 = (id)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v223, "userInterfaceIdiom");

  if (v26)
  {
    -[ICDocCamViewController flashSettingViewFlashIcon](self, "flashSettingViewFlashIcon");
    v224 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v224, "setHidden:", 1);

    -[ICDocCamViewController filterViewButton](self, "filterViewButton");
    v225 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v225, "setHidden:", 1);

    -[ICDocCamViewController filterViewContainer](self, "filterViewContainer");
    v226 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v226, "setHidden:", 0);

    -[ICDocCamViewController filterViewButton](self, "filterViewButton");
    v227 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v227, "removeFromSuperview");

    -[ICDocCamViewController setFilterViewButton:](self, "setFilterViewButton:", 0);
  }
  else
  {
    -[ICDocCamViewController filterButton](self, "filterButton");
    v228 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v228, "setHidden:", 1);

  }
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v229 = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v229, "userInterfaceIdiom");

  if (v27)
  {
    -[ICDocCamViewController flashSettingView](self, "flashSettingView");
    v230 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v230, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setShadowRadius:", 0.0);

    -[ICDocCamViewController flashSettingView](self, "flashSettingView");
    v231 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v231, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v30) = 1050253722;
    objc_msgSend(v29, "setShadowOpacity:", v30);

    -[ICDocCamViewController flashSettingView](self, "flashSettingView");
    v232 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v232, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setShadowOffset:", 0.0, 0.0);

    -[ICDocCamViewController flashSettingView](self, "flashSettingView");
    v233 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v233, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setMasksToBounds:", 0);

    -[ICDocCamViewController flashSettingView](self, "flashSettingView");
    v234 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v234, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setCornerRadius:", 13.0);

    -[ICDocCamViewController flashSettingView](self, "flashSettingView");
    v235 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v235, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setBorderWidth:", 0.0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.5);
    v235 = (id)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController flashSettingView](self, "flashSettingView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setBackgroundColor:", v235);
  }

  -[ICDocCamViewController setFlashMode:](self, "setFlashMode:", 2);
  -[ICDocCamViewController flashButtonImage](self, "flashButtonImage");
  v236 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController flashButton](self, "flashButton");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setImage:forState:", v236, 0);

  -[ICDocCamViewController flashButtonForIPhone](self, "flashButtonForIPhone");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setImage:forState:", v236, 0);

  -[ICDocCamViewController flashButton](self, "flashButton");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setTintColor:", v38);

  -[ICDocCamViewController flashButtonForIPhone](self, "flashButtonForIPhone");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setTintColor:", v40);

  -[ICDocCamViewController flashButtonForIPhone](self, "flashButtonForIPhone");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setLargeContentImage:", v236);

  -[ICDocCamViewController setAutoMode:](self, "setAutoMode:", 1);
  if (-[ICDocCamViewController autoMode](self, "autoMode"))
  {
    -[ICDocCamViewController userPromptView](self, "userPromptView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setHidden:", 0);
  }
  else
  {
    -[ICDocCamViewController hideShutter:](self, "hideShutter:", 0);
    -[ICDocCamViewController userPromptView](self, "userPromptView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setHidden:", 1);
  }

  v43 = -[ICDocCamViewController autoMode](self, "autoMode");
  -[ICDocCamViewController overlayView](self, "overlayView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setShowGridAnimation:", v43);

  -[ICDocCamViewController cameraHighlightColor](self, "cameraHighlightColor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController overlayView](self, "overlayView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setRectColor:", v45);

  if ((DCDebugInterfaceEnabled() & 1) != 0
    || (objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"),
        v47 = (void *)objc_claimAutoreleasedReturnValue(),
        v48 = objc_msgSend(v47, "userInterfaceIdiom"),
        v47,
        v48 == 1))
  {
    -[ICDocCamViewController flashButton](self, "flashButton");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "layer");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v51) = 0;
    objc_msgSend(v50, "setShadowOpacity:", v51);

    -[ICDocCamViewController flashButton](self, "flashButton");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "layer");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setShadowRadius:", 0.0);

  }
  objc_msgSend(MEMORY[0x24BDB2460], "defaultDeviceWithMediaType:", *MEMORY[0x24BDB1D50]);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v54, "hasFlash") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "userInterfaceIdiom");

    -[ICDocCamViewController flashSettingView](self, "flashSettingView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
      objc_msgSend(v57, "setHidden:", 0);
    else
      objc_msgSend(v57, "setHidden:", 1);
  }
  else
  {
    -[ICDocCamViewController flashButton](self, "flashButton");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setHidden:", 1);

    -[ICDocCamViewController flashSettingView](self, "flashSettingView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setHidden:", 1);
  }

  -[ICDocCamViewController enableUIElements:](self, "enableUIElements:", 0);
  -[ICDocCamViewController enableShutter:](self, "enableShutter:", 0);
  -[ICDocCamViewController initializeFilters](self, "initializeFilters");
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v59, "userInterfaceIdiom");

  if (v60)
  {
    -[ICDocCamViewController topToolbarForIPhone](self, "topToolbarForIPhone");
  }
  else
  {
    -[ICDocCamViewController cancelButton](self, "cancelButton");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setHidden:", 1);

    -[ICDocCamViewController flashButton](self, "flashButton");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setHidden:", 1);

    -[ICDocCamViewController filterButton](self, "filterButton");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setHidden:", 1);

    -[ICDocCamViewController autoButton](self, "autoButton");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setHidden:", 1);

    -[ICDocCamViewController manualButton](self, "manualButton");
  }
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setHidden:", 1);

  if ((DCDebugInterfaceEnabled() & 1) != 0
    || (objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"),
        v66 = (void *)objc_claimAutoreleasedReturnValue(),
        v67 = objc_msgSend(v66, "userInterfaceIdiom"),
        v66,
        v67 == 1))
  {
    -[ICDocCamViewController autoButton](self, "autoButton");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "sizeToFit");

    -[ICDocCamViewController manualButton](self, "manualButton");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "sizeToFit");

    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.5);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v72 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v73 = objc_msgSend(v72, "CGColor");
    -[ICDocCamViewController flashSettingView](self, "flashSettingView");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "layer");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setBorderColor:", v73);

    -[ICDocCamViewController flashSettingView](self, "flashSettingView");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "layer");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setBorderWidth:", 0.0);

    -[ICDocCamViewController flashSettingView](self, "flashSettingView");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "frame");
    v80 = v79;
    -[ICDocCamViewController flashSettingView](self, "flashSettingView");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "layer");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setCornerRadius:", v80 * 0.5);

    -[ICDocCamViewController flashSettingView](self, "flashSettingView");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setBackgroundColor:", v70);

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v84 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v85 = objc_msgSend(v84, "CGColor");
    -[ICDocCamViewController autoButton](self, "autoButton");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "layer");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "setBorderColor:", v85);

    -[ICDocCamViewController autoButton](self, "autoButton");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "layer");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "setBorderWidth:", 0.0);

    -[ICDocCamViewController autoButton](self, "autoButton");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "frame");
    v92 = v91;
    -[ICDocCamViewController autoButton](self, "autoButton");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "layer");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "setCornerRadius:", v92 * 0.5);

    if (-[ICDocCamViewController autoMode](self, "autoMode"))
      v95 = v70;
    else
      v95 = v71;
    v96 = objc_msgSend(objc_retainAutorelease(v95), "CGColor");
    -[ICDocCamViewController autoButton](self, "autoButton");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "layer");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "setBackgroundColor:", v96);

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v99 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v100 = objc_msgSend(v99, "CGColor");
    -[ICDocCamViewController manualButton](self, "manualButton");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "layer");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setBorderColor:", v100);

    -[ICDocCamViewController manualButton](self, "manualButton");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "layer");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "setBorderWidth:", 0.0);

    -[ICDocCamViewController manualButton](self, "manualButton");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "frame");
    v107 = v106;
    -[ICDocCamViewController manualButton](self, "manualButton");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "layer");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "setCornerRadius:", v107 * 0.5);

    if (-[ICDocCamViewController autoMode](self, "autoMode"))
      v110 = v71;
    else
      v110 = v70;
    v111 = objc_msgSend(objc_retainAutorelease(v110), "CGColor");
    -[ICDocCamViewController manualButton](self, "manualButton");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "layer");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "setBackgroundColor:", v111);

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v114 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v115 = objc_msgSend(v114, "CGColor");
    -[ICDocCamViewController filterViewContainer](self, "filterViewContainer");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "layer");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "setBorderColor:", v115);

    -[ICDocCamViewController filterViewContainer](self, "filterViewContainer");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "layer");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "setBorderWidth:", 0.0);

    -[ICDocCamViewController filterViewContainer](self, "filterViewContainer");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "frame");
    v122 = v121;
    -[ICDocCamViewController filterViewContainer](self, "filterViewContainer");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "layer");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "setCornerRadius:", v122 * 0.5);

    -[ICDocCamViewController filterViewContainer](self, "filterViewContainer");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "setBackgroundColor:", v70);

  }
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = objc_msgSend(v126, "userInterfaceIdiom");

  v128 = (double *)MEMORY[0x24BDF7888];
  if (!v127)
  {
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 17.0, *MEMORY[0x24BDF7888]);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController cancelButton](self, "cancelButton");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "titleLabel");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "setFont:", v129);

  }
  -[ICDocCamViewController saveButton](self, "saveButton");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "layer");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "setMasksToBounds:", 0);

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v134 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v135 = objc_msgSend(v134, "CGColor");
  -[ICDocCamViewController saveButton](self, "saveButton");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "layer");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "setShadowColor:", v135);

  -[ICDocCamViewController saveButton](self, "saveButton");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "layer");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v140) = 1047904911;
  objc_msgSend(v139, "setShadowOpacity:", v140);

  -[ICDocCamViewController saveButton](self, "saveButton");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "layer");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "setShadowRadius:", 2.0);

  -[ICDocCamViewController saveButton](self, "saveButton");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "layer");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "setShadowOffset:", 0.0, 0.0);

  -[ICDocCamViewController saveButton](self, "saveButton");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "sizeToFit");

  -[ICDocCamViewController cancelButton](self, "cancelButton");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "layer");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "setMasksToBounds:", 0);

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v148 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v149 = objc_msgSend(v148, "CGColor");
  -[ICDocCamViewController cancelButton](self, "cancelButton");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "layer");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "setShadowColor:", v149);

  -[ICDocCamViewController cancelButton](self, "cancelButton");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "layer");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v154) = 1053609165;
  objc_msgSend(v153, "setShadowOpacity:", v154);

  -[ICDocCamViewController cancelButton](self, "cancelButton");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "layer");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "setShadowRadius:", 2.0);

  -[ICDocCamViewController cancelButton](self, "cancelButton");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "layer");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "setShadowOffset:", 0.0, 1.0);

  if ((DCDebugInterfaceEnabled() & 1) != 0
    || (objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"),
        v159 = (void *)objc_claimAutoreleasedReturnValue(),
        v160 = objc_msgSend(v159, "userInterfaceIdiom"),
        v159,
        v160 == 1))
  {
    v161 = *v128;
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 14.0, *v128);
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController flashSettingViewOnButton](self, "flashSettingViewOnButton");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v163, "titleLabel");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "setFont:", v162);

    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 14.0, v161);
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController flashSettingViewOffButton](self, "flashSettingViewOffButton");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "titleLabel");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v167, "setFont:", v165);

    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 14.0, v161);
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController flashSettingViewAutoButton](self, "flashSettingViewAutoButton");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v169, "titleLabel");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v170, "setFont:", v168);
  }
  else
  {
    v171 = *MEMORY[0x24BDF7880];
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 14.0, *MEMORY[0x24BDF7880]);
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController flashSettingViewOnButton](self, "flashSettingViewOnButton");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v173, "titleLabel");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v174, "setFont:", v172);

    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 14.0, v171);
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController flashSettingViewOffButton](self, "flashSettingViewOffButton");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v176, "titleLabel");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v177, "setFont:", v175);

    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 14.0, v171);
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController flashSettingViewAutoButton](self, "flashSettingViewAutoButton");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v169, "titleLabel");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v170, "setFont:", v168);
  }

  -[ICDocCamViewController filterViewContainer](self, "filterViewContainer");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "setAccessibilityLabel:", CFSTR("Filter View Container"));

  -[ICDocCamViewController filterView](self, "filterView");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "setAccessibilityLabel:", CFSTR("Filter View"));

  -[ICDocCamViewController filterScrollViewContainer](self, "filterScrollViewContainer");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "setAccessibilityLabel:", CFSTR("Filter Scroll View Container"));

  -[ICDocCamViewController filterScrollView](self, "filterScrollView");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v181, "setAccessibilityLabel:", CFSTR("Filter Scroll View"));

  -[ICDocCamViewController flashSettingView](self, "flashSettingView");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "setAccessibilityLabel:", CFSTR("Flash Setting View"));

  -[ICDocCamViewController flashSettingButtonView](self, "flashSettingButtonView");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v183, "setAccessibilityLabel:", CFSTR("Flash Setting Button View"));

  -[ICDocCamViewController autoButton](self, "autoButton");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v184, "_accessibilitySetInterfaceStyleIntent:", 2);

  -[ICDocCamViewController manualButton](self, "manualButton");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v185, "_accessibilitySetInterfaceStyleIntent:", 2);

  -[ICDocCamViewController flashButton](self, "flashButton");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v186, "_accessibilitySetInterfaceStyleIntent:", 2);

  -[ICDocCamViewController flashButtonForIPhone](self, "flashButtonForIPhone");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "_accessibilitySetInterfaceStyleIntent:", 2);

  -[ICDocCamViewController flashSettingViewFlashIcon](self, "flashSettingViewFlashIcon");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v188, "_accessibilitySetInterfaceStyleIntent:", 2);

  -[ICDocCamViewController flashSettingViewAutoButton](self, "flashSettingViewAutoButton");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v189, "_accessibilitySetInterfaceStyleIntent:", 2);

  -[ICDocCamViewController flashSettingViewOnButton](self, "flashSettingViewOnButton");
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "_accessibilitySetInterfaceStyleIntent:", 2);

  -[ICDocCamViewController flashSettingViewOffButton](self, "flashSettingViewOffButton");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "_accessibilitySetInterfaceStyleIntent:", 2);

  -[ICDocCamViewController updateLabelColors](self, "updateLabelColors");
  -[ICDocCamViewController setupAccessibilityInfo](self, "setupAccessibilityInfo");
  -[ICDocCamViewController cancelButton](self, "cancelButton");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  v193 = objc_alloc_init(MEMORY[0x24BDF6C78]);
  objc_msgSend(v192, "addInteraction:", v193);

  -[ICDocCamViewController saveButton](self, "saveButton");
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  v195 = objc_alloc_init(MEMORY[0x24BDF6C78]);
  objc_msgSend(v194, "addInteraction:", v195);

}

- (void)setUpUserDefaults
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  -[ICDocCamViewController setSegmentTopLeft:](self, "setSegmentTopLeft:", 0.0, 0.0);
  -[ICDocCamViewController setSegmentTopRight:](self, "setSegmentTopRight:", 0.0, 0.0);
  -[ICDocCamViewController setSegmentBottomLeft:](self, "setSegmentBottomLeft:", 0.0, 0.0);
  -[ICDocCamViewController setSegmentBottomRight:](self, "setSegmentBottomRight:", 0.0, 0.0);
  -[ICDocCamViewController setSegmentMeanComputed:](self, "setSegmentMeanComputed:", 0);
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatForKey:", CFSTR("internalSettings.docCam.rectangle.segmentFudgeFactor"));
  -[ICDocCamViewController setSegmentationFudgeFactor:](self, "setSegmentationFudgeFactor:");

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatForKey:", CFSTR("internalSettings.docCam.rectangle.segmentVisualConfidence"));
  -[ICDocCamViewController setSegmentMinimumVisualConfidence:](self, "setSegmentMinimumVisualConfidence:");

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatForKey:", CFSTR("internalSettings.docCam.rectangle.segmentVisualConfidence60Frames"));
  -[ICDocCamViewController setSegmentMinimumVisualConfidence60Frames:](self, "setSegmentMinimumVisualConfidence60Frames:");

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatForKey:", CFSTR("internalSettings.docCam.rectangle.segmentVisualConfidenceFinalScan"));
  -[ICDocCamViewController setSegmentMinimumVisualConfidenceFinalScan:](self, "setSegmentMinimumVisualConfidenceFinalScan:");

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatForKey:", CFSTR("internalSettings.docCam.rectangle.segmentStabilityStdDev"));
  -[ICDocCamViewController setSegmentStabilityStdDev:](self, "setSegmentStabilityStdDev:");

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatForKey:", CFSTR("internalSettings.docCam.rectangle.minimumAspectRatio"));
  -[ICDocCamViewController setRectangleMinimumAspectRatio:](self, "setRectangleMinimumAspectRatio:");

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatForKey:", CFSTR("internalSettings.docCam.rectangle.maximumAspectRatio"));
  -[ICDocCamViewController setRectangleMaximumAspectRatio:](self, "setRectangleMaximumAspectRatio:");

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatForKey:", CFSTR("internalSettings.docCam.rectangle.quadratureTolerance"));
  -[ICDocCamViewController setRectangleQuadratureTolerance:](self, "setRectangleQuadratureTolerance:");

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatForKey:", CFSTR("internalSettings.docCam.rectangle.minimumSize"));
  -[ICDocCamViewController setRectangleMinimumSize:](self, "setRectangleMinimumSize:");

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatForKey:", CFSTR("internalSettings.docCam.rectangle.minimumConfidence"));
  -[ICDocCamViewController setRectangleMinimumConfidence:](self, "setRectangleMinimumConfidence:");

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatForKey:", CFSTR("internalSettings.docCam.rectangle.visualConfidence"));
  -[ICDocCamViewController setRectangleMinimumVisualConfidence:](self, "setRectangleMinimumVisualConfidence:");

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController setRectangleMaximumNumber:](self, "setRectangleMaximumNumber:", objc_msgSend(v14, "integerForKey:", CFSTR("internalSettings.docCam.rectangle.maximumNumber")));

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "floatForKey:", CFSTR("internalSettings.docCam.rectangle.stabilityStdDev"));
  -[ICDocCamViewController setRectangleStabilityStdDev:](self, "setRectangleStabilityStdDev:");

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController setRectangleDetectionEnabled:](self, "setRectangleDetectionEnabled:", objc_msgSend(v16, "BOOLForKey:", CFSTR("internalSettings.docCam.rectangle.detectionEnabled")));

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController setRegistrationEnabled:](self, "setRegistrationEnabled:", objc_msgSend(v17, "BOOLForKey:", CFSTR("internalSettings.docCam.registration.enabled")));

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController setDebugRectanglesEnabled:](self, "setDebugRectanglesEnabled:", objc_msgSend(v18, "BOOLForKey:", CFSTR("internalSettings.docCam.debugRectangles.enabled")));

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController setDisplayStringEnabled:](self, "setDisplayStringEnabled:", objc_msgSend(v19, "BOOLForKey:", CFSTR("internalSettings.docCam.displayString.enabled")));

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController setRealTimeRectangleDetection:](self, "setRealTimeRectangleDetection:", objc_msgSend(v20, "BOOLForKey:", CFSTR("internalSettings.docCam.rectangle.realTime")));

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController setSynchronousRectangleDetection:](self, "setSynchronousRectangleDetection:", objc_msgSend(v21, "BOOLForKey:", CFSTR("internalSettings.docCam.rectangle.synchronous")));

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController setQueueSizeForRectangleDetection:](self, "setQueueSizeForRectangleDetection:", objc_msgSend(v22, "integerForKey:", CFSTR("internalSettings.docCam.rectangle.queueSize")));

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController setScanMovieRecordingEnabled:](self, "setScanMovieRecordingEnabled:", objc_msgSend(v23, "BOOLForKey:", CFSTR("internalSettings.docCam.scanMovieRecording.enabled")));

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController setScanMovieRecordingDontShowWarning:](self, "setScanMovieRecordingDontShowWarning:", objc_msgSend(v24, "BOOLForKey:", CFSTR("internalSettings.docCam.scanMovieRecording.doNotShowWarning")));

}

- (void)preWarmFilters
{
  if (-[ICDocCamViewController preWarmFilters]::onceToken != -1)
    dispatch_once(&-[ICDocCamViewController preWarmFilters]::onceToken, &__block_literal_global_15);
}

void __40__ICDocCamViewController_preWarmFilters__block_invoke()
{
  NSObject *v0;

  dispatch_get_global_queue(0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v0, &__block_literal_global_402);

}

void __40__ICDocCamViewController_preWarmFilters__block_invoke_2()
{
  void *v0;
  CGContext *CurrentContext;
  id v2;
  void *v3;
  ICDocCamImageQuad *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  CGSize v22;
  CGRect v23;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v22.width = 32.0;
  v22.height = 32.0;
  UIGraphicsBeginImageContext(v22);
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(MEMORY[0x24BDF6950], "redColor");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v2, "CGColor"));

  v23.size.width = 32.0;
  v23.origin.x = 0.0;
  v23.origin.y = 0.0;
  v23.size.height = 32.0;
  CGContextFillRect(CurrentContext, v23);
  UIGraphicsGetImageFromCurrentImageContext();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  v4 = -[ICDocCamImageQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([ICDocCamImageQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", 0.1, 0.1, 0.9, 0.1, 0.1, 0.9, 0.9, 0.9);
  +[ICDocCamImageFilters perspectiveCorrectedImageFromImage:normalizedImageQuad:](ICDocCamImageFilters, "perspectiveCorrectedImageFromImage:normalizedImageQuad:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICDocCamImageFilters filteredImage:orientation:imageFilterType:](ICDocCamImageFilters, "filteredImage:orientation:imageFilterType:", v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICDocCamImageFilters filteredImage:orientation:imageFilterType:](ICDocCamImageFilters, "filteredImage:orientation:imageFilterType:", v5, 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICDocCamImageFilters filteredImage:orientation:imageFilterType:](ICDocCamImageFilters, "filteredImage:orientation:imageFilterType:", v5, 0, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICDocCamImageFilters filteredImage:orientation:imageFilterType:](ICDocCamImageFilters, "filteredImage:orientation:imageFilterType:", v5, 0, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", v0);
  v12 = v11;
  v13 = os_log_create("com.apple.documentcamera", ");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 134217984;
    v20 = v12;
    _os_log_impl(&dword_20CE8E000, v13, OS_LOG_TYPE_DEFAULT, "Finished prewarming filters in: %.2f seconds", (uint8_t *)&v19, 0xCu);
  }

  if (!v5)
  {
    v14 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __40__ICDocCamViewController_preWarmFilters__block_invoke_2_cold_5();

  }
  if (!v6)
  {
    v15 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __40__ICDocCamViewController_preWarmFilters__block_invoke_2_cold_4();

  }
  if (!v7)
  {
    v16 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __40__ICDocCamViewController_preWarmFilters__block_invoke_2_cold_3();

  }
  if (!v8)
  {
    v17 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __40__ICDocCamViewController_preWarmFilters__block_invoke_2_cold_2();

  }
  if (!v9)
  {
    v18 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      __40__ICDocCamViewController_preWarmFilters__block_invoke_2_cold_1();

  }
}

- (void)setupThumbnailViewControllerIfNecessary
{
  void *v3;
  ICDocCamThumbnailCollectionViewController *v4;
  void *v5;
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
  const __CFString *v32;
  void *v33;
  const __CFString *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  -[ICDocCamViewController thumbnailViewController](self, "thumbnailViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = -[ICDocCamThumbnailCollectionViewController initWithDelegate:]([ICDocCamThumbnailCollectionViewController alloc], "initWithDelegate:", self);
    -[ICDocCamViewController setThumbnailViewController:](self, "setThumbnailViewController:", v4);

    -[ICDocCamViewController documentInfoCollection](self, "documentInfoCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "docInfos");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController thumbnailViewController](self, "thumbnailViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDocumentInfoArray:", v6);

    -[ICDocCamViewController imageCache](self, "imageCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController thumbnailViewController](self, "thumbnailViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImageCache:", v8);

    -[ICDocCamViewController thumbnailViewController](self, "thumbnailViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController addChildViewController:](self, "addChildViewController:", v10);

    -[ICDocCamViewController thumbnailViewController](self, "thumbnailViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[ICDocCamViewController thumbnailContainerView](self, "thumbnailContainerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController thumbnailViewController](self, "thumbnailViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "collectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v15);

    -[ICDocCamViewController thumbnailViewController](self, "thumbnailViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "didMoveToParentViewController:", self);

    v17 = (void *)MEMORY[0x24BDD1628];
    v34 = CFSTR("childView");
    -[ICDocCamViewController thumbnailViewController](self, "thumbnailViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "collectionView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[childView]|"), 0, 0, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x24BDD1628];
    v32 = CFSTR("childView");
    -[ICDocCamViewController thumbnailViewController](self, "thumbnailViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "collectionView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v24;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[childView]|"), 0, 0, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICDocCamViewController thumbnailViewController](self, "thumbnailViewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "collectionView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v21);
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v26);
    -[ICDocCamViewController thumbnailViewController](self, "thumbnailViewController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "collectionView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController thumbnailContainerView](self, "thumbnailContainerView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setCollectionView:", v30);

  }
}

- (BOOL)useDocumentSegmentation
{
  if (-[ICDocCamViewController useDocumentSegmentation]::onceToken != -1)
    dispatch_once(&-[ICDocCamViewController useDocumentSegmentation]::onceToken, &__block_literal_global_414);
  return -[ICDocCamViewController useDocumentSegmentation]::isEnabled;
}

void __49__ICDocCamViewController_useDocumentSegmentation__block_invoke()
{
  void *v0;
  int v1;

  if (MGIsQuestionValid() && MGGetBoolAnswer())
  {
    +[DCSettings sharedSettings](DCSettings, "sharedSettings");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = objc_msgSend(v0, "useDocumentSegmentationRequest");

    if (v1)
      -[ICDocCamViewController useDocumentSegmentation]::isEnabled = 1;
  }
}

- (void)updateAllConstraints
{
  _BOOL4 v3;
  void *v4;
  int64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;

  if ((DCDebugInterfaceEnabled() & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "userInterfaceIdiom") == 1;

  }
  v5 = -[ICDocCamViewController statusBarOrientation](self, "statusBarOrientation");
  -[ICDocCamViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeAreaInsets");
  v8 = -60.0;
  if ((unint64_t)(v5 - 1) < 2)
    v8 = -104.0;
  if (v3)
    v8 = -100.0;
  v9 = v8 - v7;

  -[ICDocCamViewController userPromptViewVerticalConstraint](self, "userPromptViewVerticalConstraint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setConstant:", v9);

  -[ICDocCamViewController moveCameraCloserViewVerticalConstraint](self, "moveCameraCloserViewVerticalConstraint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setConstant:", v9);

  if (v3)
    -[ICDocCamViewController updateConstraintsForIPad](self, "updateConstraintsForIPad");
  else
    -[ICDocCamViewController updateConstraintsForIPhone](self, "updateConstraintsForIPhone");
}

- (void)updateConstraintsForIPad
{
  void *v3;
  void *v4;
  id v5;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  float v41;
  double v42;
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
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
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
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
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
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  id v191;
  uint64_t v192;
  void *v193;
  uint64_t v194;
  _QWORD v195[2];

  v195[1] = *MEMORY[0x24BDAC8D0];
  -[ICDocCamViewController iPadLayoutConstraints](self, "iPadLayoutConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD1628];
    -[ICDocCamViewController iPadLayoutConstraints](self, "iPadLayoutConstraints");
    v191 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activateConstraints:", v191);

  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[ICDocCamViewController setIPadLayoutConstraints:](self, "setIPadLayoutConstraints:", v5);

    -[ICDocCamViewController filterNameFeedbackViewTopLayoutConstraint](self, "filterNameFeedbackViewTopLayoutConstraint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setConstant:", 30.0);

    -[ICDocCamViewController iPadLayoutConstraints](self, "iPadLayoutConstraints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController filterNameFeedbackViewTopLayoutConstraint](self, "filterNameFeedbackViewTopLayoutConstraint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

    -[ICDocCamViewController iPadLayoutConstraints](self, "iPadLayoutConstraints");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController shutterButton](self, "shutterButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "centerXAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, -50.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v14);

    -[ICDocCamViewController iPadLayoutConstraints](self, "iPadLayoutConstraints");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController shutterButton](self, "shutterButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "centerYAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "centerYAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:constant:", v19, 0.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v20);

    -[ICDocCamViewController manualButton](self, "manualButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "titleLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "text");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICDocCamViewController autoButton](self, "autoButton");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "titleLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "text");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v194 = *MEMORY[0x24BDF65F8];
    v27 = v194;
    -[ICDocCamViewController manualButton](self, "manualButton");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "titleLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "font");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v195[0] = v30;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v195, &v194, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sizeWithAttributes:", v31);
    v33 = v32;

    v192 = v27;
    -[ICDocCamViewController autoButton](self, "autoButton");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "titleLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "font");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v193 = v36;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v193, &v192, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "sizeWithAttributes:", v37);
    v39 = v38;

    if (v33 >= v39)
      v40 = v33;
    else
      v40 = v39;
    v41 = v40;
    v42 = ceilf(v41) + 32.0;
    -[ICDocCamViewController iPadLayoutConstraints](self, "iPadLayoutConstraints");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController manualButton](self, "manualButton");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42 * 0.5 >= 43.0)
    {
      objc_msgSend(v44, "trailingAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController view](self, "view");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "trailingAnchor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "constraintGreaterThanOrEqualToAnchor:constant:", v47, -11.0);
    }
    else
    {
      objc_msgSend(v44, "centerXAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController shutterButton](self, "shutterButton");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "centerXAnchor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "constraintEqualToAnchor:constant:", v47, 0.0);
    }
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObject:", v48);

    -[ICDocCamViewController iPadLayoutConstraints](self, "iPadLayoutConstraints");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController manualButton](self, "manualButton");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "centerYAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController view](self, "view");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "centerYAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:constant:", v53, 164.0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObject:", v54);

    -[ICDocCamViewController iPadLayoutConstraints](self, "iPadLayoutConstraints");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController manualButton](self, "manualButton");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "widthAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToConstant:", v42);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "addObject:", v58);

    -[ICDocCamViewController iPadLayoutConstraints](self, "iPadLayoutConstraints");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController autoButton](self, "autoButton");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42 * 0.5 >= 43.0)
    {
      objc_msgSend(v60, "trailingAnchor");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController view](self, "view");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "trailingAnchor");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "constraintGreaterThanOrEqualToAnchor:constant:", v63, -11.0);
    }
    else
    {
      objc_msgSend(v60, "centerXAnchor");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController shutterButton](self, "shutterButton");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "centerXAnchor");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "constraintEqualToAnchor:constant:", v63, 0.0);
    }
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "addObject:", v64);

    -[ICDocCamViewController iPadLayoutConstraints](self, "iPadLayoutConstraints");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController autoButton](self, "autoButton");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "centerYAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController view](self, "view");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "centerYAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:constant:", v69, 118.0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "addObject:", v70);

    -[ICDocCamViewController iPadLayoutConstraints](self, "iPadLayoutConstraints");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController autoButton](self, "autoButton");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "widthAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToConstant:", v42);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "addObject:", v74);

    -[ICDocCamViewController iPadLayoutConstraints](self, "iPadLayoutConstraints");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController saveButton](self, "saveButton");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "trailingAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController view](self, "view");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "trailingAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToAnchor:constant:", v79, -21.0);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "addObject:", v80);

    -[ICDocCamViewController iPadLayoutConstraints](self, "iPadLayoutConstraints");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController saveButton](self, "saveButton");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "centerYAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController cancelButton](self, "cancelButton");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "centerYAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "constraintEqualToAnchor:constant:", v85, 0.0);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "addObject:", v86);

    -[ICDocCamViewController iPadLayoutConstraints](self, "iPadLayoutConstraints");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController cancelButton](self, "cancelButton");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "leadingAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController view](self, "view");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "leadingAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "constraintEqualToAnchor:constant:", v91, 21.0);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "addObject:", v92);

    -[ICDocCamViewController iPadLayoutConstraints](self, "iPadLayoutConstraints");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController cancelButton](self, "cancelButton");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "firstBaselineAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController view](self, "view");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "bottomAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "constraintEqualToAnchor:constant:", v97, -40.0);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "addObject:", v98);

    -[ICDocCamViewController thumbnailContainerView](self, "thumbnailContainerView");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[ICDocCamViewController thumbnailContainerView](self, "thumbnailContainerView");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "leadingAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController cancelButton](self, "cancelButton");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "trailingAnchor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "constraintEqualToAnchor:constant:", v103, 48.0);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController setThumbnailContainerViewLeadingConstraintForIPad:](self, "setThumbnailContainerViewLeadingConstraintForIPad:", v104);

    -[ICDocCamViewController iPadLayoutConstraints](self, "iPadLayoutConstraints");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController thumbnailContainerViewLeadingConstraintForIPad](self, "thumbnailContainerViewLeadingConstraintForIPad");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "addObject:", v106);

    -[ICDocCamViewController thumbnailContainerView](self, "thumbnailContainerView");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "trailingAnchor");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController saveButton](self, "saveButton");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "leadingAnchor");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "constraintEqualToAnchor:constant:", v110, 48.0);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController setThumbnailContainerViewTrailingConstraintForIPad:](self, "setThumbnailContainerViewTrailingConstraintForIPad:", v111);

    -[ICDocCamViewController updateThumbnailContainerViewConstraintConstantForIPad](self, "updateThumbnailContainerViewConstraintConstantForIPad");
    -[ICDocCamViewController iPadLayoutConstraints](self, "iPadLayoutConstraints");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController thumbnailContainerViewTrailingConstraintForIPad](self, "thumbnailContainerViewTrailingConstraintForIPad");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "addObject:", v113);

    -[ICDocCamViewController iPadLayoutConstraints](self, "iPadLayoutConstraints");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController thumbnailContainerView](self, "thumbnailContainerView");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "bottomAnchor");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController view](self, "view");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "safeAreaLayoutGuide");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "bottomAnchor");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "constraintEqualToAnchor:constant:", v119, -16.0);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "addObject:", v120);

    -[ICDocCamViewController iPadLayoutConstraints](self, "iPadLayoutConstraints");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController flashSettingView](self, "flashSettingView");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "trailingAnchor");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController flashButton](self, "flashButton");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "trailingAnchor");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "constraintEqualToAnchor:constant:", v125, 0.0);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "addObject:", v126);

    -[ICDocCamViewController iPadLayoutConstraints](self, "iPadLayoutConstraints");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController flashSettingView](self, "flashSettingView");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "centerYAnchor");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController flashButton](self, "flashButton");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "centerYAnchor");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "constraintEqualToAnchor:constant:", v131, 0.0);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "addObject:", v132);

    -[ICDocCamViewController iPadLayoutConstraints](self, "iPadLayoutConstraints");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController flashSettingView](self, "flashSettingView");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "heightAnchor");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "constraintEqualToConstant:", 44.0);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "addObject:", v136);

    -[ICDocCamViewController iPadLayoutConstraints](self, "iPadLayoutConstraints");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController filterViewContainer](self, "filterViewContainer");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "centerYAnchor");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController filterButton](self, "filterButton");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "centerYAnchor");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "constraintEqualToAnchor:constant:", v141, 0.0);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "addObject:", v142);

    -[ICDocCamViewController iPadLayoutConstraints](self, "iPadLayoutConstraints");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController filterViewContainer](self, "filterViewContainer");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "heightAnchor");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "constraintEqualToConstant:", 44.0);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "addObject:", v146);

    -[ICDocCamViewController iPadLayoutConstraints](self, "iPadLayoutConstraints");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController filterViewContainer](self, "filterViewContainer");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "trailingAnchor");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController filterButton](self, "filterButton");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "trailingAnchor");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "constraintEqualToAnchor:constant:", v151, 0.0);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "addObject:", v152);

    -[ICDocCamViewController filterScrollView](self, "filterScrollView");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "setContentInset:", 0.0, 6.0, 0.0, 0.0);

    -[ICDocCamViewController filterViewContainer](self, "filterViewContainer");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "widthAnchor");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "constraintEqualToConstant:", 44.0);
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController setFilterViewContainerWidthConstraint:](self, "setFilterViewContainerWidthConstraint:", v156);

    -[ICDocCamViewController iPadLayoutConstraints](self, "iPadLayoutConstraints");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController filterViewContainerWidthConstraint](self, "filterViewContainerWidthConstraint");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v157, "addObject:", v158);

    -[ICDocCamViewController iPadLayoutConstraints](self, "iPadLayoutConstraints");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController filterViewContainer](self, "filterViewContainer");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "centerYAnchor");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController filterButton](self, "filterButton");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "centerYAnchor");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v161, "constraintEqualToAnchor:constant:", v163, 0.0);
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v159, "addObject:", v164);

    -[ICDocCamViewController iPadLayoutConstraints](self, "iPadLayoutConstraints");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController filterScrollViewContainer](self, "filterScrollViewContainer");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "leadingAnchor");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController filterView](self, "filterView");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v168, "leadingAnchor");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v167, "constraintEqualToAnchor:constant:", v169, 0.0);
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v165, "addObject:", v170);

    -[ICDocCamViewController iPadLayoutConstraints](self, "iPadLayoutConstraints");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController filterScrollViewContainer](self, "filterScrollViewContainer");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v172, "topAnchor");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController filterView](self, "filterView");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v174, "topAnchor");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v173, "constraintEqualToAnchor:constant:", v175, 0.0);
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v171, "addObject:", v176);

    -[ICDocCamViewController iPadLayoutConstraints](self, "iPadLayoutConstraints");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController filterScrollViewContainer](self, "filterScrollViewContainer");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "bottomAnchor");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController filterView](self, "filterView");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v180, "bottomAnchor");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v179, "constraintEqualToAnchor:constant:", v181, 0.0);
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v177, "addObject:", v182);

    -[ICDocCamViewController iPadLayoutConstraints](self, "iPadLayoutConstraints");
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController filterScrollViewContainer](self, "filterScrollViewContainer");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "trailingAnchor");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController filterView](self, "filterView");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v186, "trailingAnchor");
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v185, "constraintEqualToAnchor:constant:", v187, 0.0);
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "addObject:", v188);

    v189 = (void *)MEMORY[0x24BDD1628];
    -[ICDocCamViewController iPadLayoutConstraints](self, "iPadLayoutConstraints");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v189, "activateConstraints:", v190);

  }
}

- (void)updateConstraintsForIPhone
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  int v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
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
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  void *v75;
  double v76;
  double v77;
  void *v78;
  double v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  id v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
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
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  void *v324;
  void *v325;
  void *v326;
  void *v327;
  void *v328;
  void *v329;
  void *v330;
  void *v331;
  void *v332;
  void *v333;
  void *v334;
  void *v335;
  void *v336;
  void *v337;
  void *v338;
  void *v339;
  void *v340;
  void *v341;
  double v342;
  double v343;
  void *v344;
  double v345;
  double v346;
  double v347;
  void *v348;
  double v349;
  double v350;
  void *v351;
  double v352;
  double v353;
  double v354;
  void *v355;
  void *v356;
  void *v357;
  void *v358;
  void *v359;
  void *v360;
  void *v361;
  void *v362;
  double v363;
  double v364;
  void *v365;
  double v366;
  double v367;
  double v368;
  void *v369;
  double v370;
  double v371;
  void *v372;
  double v373;
  double v374;
  double v375;
  void *v376;
  void *v377;
  void *v378;
  void *v379;
  void *v380;
  void *v381;
  void *v382;
  double v383;
  double v384;
  void *v385;
  double v386;
  double v387;
  void *v388;
  double v389;
  double v390;
  void *v391;
  double v392;
  double v393;
  double v394;
  void *v395;
  void *v396;
  void *v397;
  void *v398;
  double v399;
  void *v400;
  void *v401;
  void *v402;
  void *v403;
  void *v404;
  void *v405;
  void *v406;
  void *v407;
  void *v408;
  void *v409;
  void *v410;
  void *v411;
  void *v412;
  void *v413;
  void *v414;
  void *v415;
  void *v416;
  void *v417;
  void *v418;
  void *v419;
  void *v420;
  void *v421;
  void *v422;
  void *v423;
  void *v424;
  void *v425;
  void *v426;
  void *v427;
  void *v428;
  void *v429;
  void *v430;
  void *v431;
  void *v432;
  void *v433;
  void *v434;
  void *v435;
  void *v436;
  void *v437;
  void *v438;
  void *v439;
  void *v440;
  uint64_t v441;
  uint64_t v442;
  uint64_t i;
  void *v444;
  void *v445;
  void *v446;
  void *v447;
  uint64_t v448;
  uint64_t v449;
  uint64_t j;
  void *v451;
  void *v452;
  void *v453;
  void *v454;
  void *v455;
  void *v456;
  void *v457;
  void *v458;
  void *v459;
  void *v460;
  void *v461;
  void *v462;
  void *v463;
  void *v464;
  void *v465;
  void *v466;
  void *v467;
  void *v468;
  void *v469;
  void *v470;
  void *v471;
  void *v472;
  void *v473;
  void *v474;
  void *v475;
  void *v476;
  void *v477;
  void *v478;
  void *v479;
  void *v480;
  void *v481;
  void *v482;
  void *v483;
  void *v484;
  void *v485;
  void *v486;
  void *v487;
  void *v488;
  void *v489;
  void *v490;
  void *v491;
  void *v492;
  void *v493;
  void *v494;
  void *v495;
  void *v496;
  void *v497;
  void *v498;
  void *v499;
  void *v500;
  void *v501;
  void *v502;
  void *v503;
  void *v504;
  void *v505;
  void *v506;
  void *v507;
  void *v508;
  void *v509;
  void *v510;
  void *v511;
  void *v512;
  void *v513;
  void *v514;
  void *v515;
  void *v516;
  void *v517;
  void *v518;
  void *v519;
  void *v520;
  void *v521;
  void *v522;
  void *v523;
  void *v524;
  void *v525;
  void *v526;
  void *v527;
  void *v528;
  void *v529;
  void *v530;
  void *v531;
  void *v532;
  void *v533;
  void *v534;
  void *v535;
  void *v536;
  double v537;
  double v538;
  void *v539;
  double v540;
  double v541;
  double v542;
  void *v543;
  void *v544;
  void *v545;
  void *v546;
  void *v547;
  void *v548;
  void *v549;
  void *v550;
  void *v551;
  void *v552;
  void *v553;
  void *v554;
  void *v555;
  void *v556;
  void *v557;
  double v558;
  double v559;
  void *v560;
  void *v561;
  void *v562;
  void *v563;
  void *v564;
  void *v565;
  void *v566;
  void *v567;
  void *v568;
  void *v569;
  void *v570;
  void *v571;
  void *v572;
  void *v573;
  void *v574;
  void *v575;
  void *v576;
  void *v577;
  void *v578;
  void *v579;
  void *v580;
  void *v581;
  void *v582;
  void *v583;
  void *v584;
  void *v585;
  void *v586;
  void *v587;
  void *v588;
  void *v589;
  void *v590;
  void *v591;
  void *v592;
  void *v593;
  void *v594;
  void *v595;
  void *v596;
  void *v597;
  void *v598;
  void *v599;
  void *v600;
  void *v601;
  void *v602;
  void *v603;
  void *v604;
  void *v605;
  void *v606;
  void *v607;
  void *v608;
  void *v609;
  void *v610;
  void *v611;
  void *v612;
  void *v613;
  void *v614;
  void *v615;
  void *v616;
  void *v617;
  void *v618;
  void *v619;
  void *v620;
  void *v621;
  void *v622;
  void *v623;
  void *v624;
  void *v625;
  void *v626;
  void *v627;
  void *v628;
  void *v629;
  void *v630;
  void *v631;
  void *v632;
  void *v633;
  void *v634;
  void *v635;
  void *v636;
  void *v637;
  void *v638;
  void *v639;
  void *v640;
  void *v641;
  void *v642;
  void *v643;
  void *v644;
  void *v645;
  void *v646;
  void *v647;
  void *v648;
  void *v649;
  void *v650;
  void *v651;
  double v652;
  double v653;
  int v654;
  double v655;
  double v656;
  __int128 v657;
  __int128 v658;
  __int128 v659;
  __int128 v660;
  __int128 v661;
  __int128 v662;
  __int128 v663;
  __int128 v664;
  _BYTE v665[128];
  _BYTE v666[128];
  uint64_t v667;

  v667 = *MEMORY[0x24BDAC8D0];
  -[ICDocCamViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dc_directionalSafeAreaInsets");
  v656 = v4;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = -[ICDocCamViewController statusBarOrientation](self, "statusBarOrientation") - 1;
  if (v11 > 1)
  {
    -[ICDocCamViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "dc_requiresCompactLandscapeIcons");

    v654 = v16;
    v17 = 44.0;
    if (v16)
      v17 = 32.0;
    v655 = v17;
    -[ICDocCamViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "window");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "windowScene");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "statusBarManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "statusBarFrame");
    v23 = v22;

    v12 = 0.0;
    v6 = fmax(v6 - v23, 0.0);
    v13 = v10;
  }
  else
  {
    v654 = 0;
    if (v8 <= 0.0)
      v12 = 0.0;
    else
      v12 = 10.0;
    v13 = v8 + v12;
    v655 = 44.0;
  }
  -[ICDocCamViewController iPhonePortraitLayoutConstraints](self, "iPhonePortraitLayoutConstraints");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -(v13 + 13.0);
  if (v24
    || (-[ICDocCamViewController iPhoneLandscapeLayoutConstraints](self, "iPhoneLandscapeLayoutConstraints"),
        (v24 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    -[ICDocCamViewController iPhoneCompactLandscapeLayoutConstraints](self, "iPhoneCompactLandscapeLayoutConstraints");
    v93 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v93)
    {
      v94 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      -[ICDocCamViewController setIPhonePortraitLayoutConstraints:](self, "setIPhonePortraitLayoutConstraints:", v94);

      v95 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      -[ICDocCamViewController setIPhoneLandscapeLayoutConstraints:](self, "setIPhoneLandscapeLayoutConstraints:", v95);

      v96 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      -[ICDocCamViewController setIPhoneCompactLandscapeLayoutConstraints:](self, "setIPhoneCompactLandscapeLayoutConstraints:", v96);

      -[ICDocCamViewController iPhonePortraitLayoutConstraints](self, "iPhonePortraitLayoutConstraints");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController filterNameFeedbackViewTopLayoutConstraint](self, "filterNameFeedbackViewTopLayoutConstraint");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "addObject:", v98);

      -[ICDocCamViewController iPhoneLandscapeLayoutConstraints](self, "iPhoneLandscapeLayoutConstraints");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController filterNameFeedbackViewTopLayoutConstraint](self, "filterNameFeedbackViewTopLayoutConstraint");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "addObject:", v100);

      -[ICDocCamViewController iPhoneCompactLandscapeLayoutConstraints](self, "iPhoneCompactLandscapeLayoutConstraints");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController filterNameFeedbackViewTopLayoutConstraint](self, "filterNameFeedbackViewTopLayoutConstraint");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "addObject:", v102);

      -[ICDocCamViewController topToolbarForIPhone](self, "topToolbarForIPhone");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[ICDocCamViewController cancelButtonForIPhone](self, "cancelButtonForIPhone");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[ICDocCamViewController autoButtonForIPhone](self, "autoButtonForIPhone");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[ICDocCamViewController flashButtonForIPhone](self, "flashButtonForIPhone");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[ICDocCamViewController filterButtonForIPhone](self, "filterButtonForIPhone");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[ICDocCamViewController saveButton](self, "saveButton");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[ICDocCamViewController filterScrollViewContainer](self, "filterScrollViewContainer");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[ICDocCamViewController iPhonePortraitLayoutConstraints](self, "iPhonePortraitLayoutConstraints");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController shutterButton](self, "shutterButton");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "centerXAnchor");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController view](self, "view");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "centerXAnchor");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "constraintEqualToAnchor:constant:", v114, 0.0);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "addObject:", v115);

      -[ICDocCamViewController shutterButton](self, "shutterButton");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "bottomAnchor");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController view](self, "view");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "bottomAnchor");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "constraintEqualToAnchor:constant:", v119, -(v13 + 13.0));
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController setShutterButtonBottomConstraintForPortraitIPhone:](self, "setShutterButtonBottomConstraintForPortraitIPhone:", v120);

      -[ICDocCamViewController iPhonePortraitLayoutConstraints](self, "iPhonePortraitLayoutConstraints");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController shutterButtonBottomConstraintForPortraitIPhone](self, "shutterButtonBottomConstraintForPortraitIPhone");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "addObject:", v122);

      -[ICDocCamViewController iPhoneLandscapeLayoutConstraints](self, "iPhoneLandscapeLayoutConstraints");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController shutterButton](self, "shutterButton");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "centerYAnchor");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController view](self, "view");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "centerYAnchor");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "constraintEqualToAnchor:constant:", v127, 0.0);
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "addObject:", v128);

      -[ICDocCamViewController shutterButton](self, "shutterButton");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "trailingAnchor");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController view](self, "view");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "trailingAnchor");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v130, "constraintEqualToAnchor:constant:", v132, -(v13 + 13.0));
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController setShutterButtonBottomConstraintForLandscapeIPhone:](self, "setShutterButtonBottomConstraintForLandscapeIPhone:", v133);

      -[ICDocCamViewController iPhoneLandscapeLayoutConstraints](self, "iPhoneLandscapeLayoutConstraints");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController shutterButtonBottomConstraintForLandscapeIPhone](self, "shutterButtonBottomConstraintForLandscapeIPhone");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v134, "addObject:", v135);

      -[ICDocCamViewController iPhoneCompactLandscapeLayoutConstraints](self, "iPhoneCompactLandscapeLayoutConstraints");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController shutterButton](self, "shutterButton");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v137, "centerYAnchor");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController view](self, "view");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "centerYAnchor");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "constraintEqualToAnchor:constant:", v140, 0.0);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "addObject:", v141);

      -[ICDocCamViewController iPhoneCompactLandscapeLayoutConstraints](self, "iPhoneCompactLandscapeLayoutConstraints");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController shutterButtonBottomConstraintForLandscapeIPhone](self, "shutterButtonBottomConstraintForLandscapeIPhone");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v142, "addObject:", v143);

      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController saveButton](self, "saveButton");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v145, "centerYAnchor");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController shutterButton](self, "shutterButton");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "centerYAnchor");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "constraintEqualToAnchor:constant:", v148, 0.0);
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "addObject:", v149);

      -[ICDocCamViewController iPhonePortraitLayoutConstraints](self, "iPhonePortraitLayoutConstraints");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v150, "addObjectsFromArray:", v144);

      objc_msgSend(v144, "removeAllObjects");
      -[ICDocCamViewController saveButton](self, "saveButton");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v151, "centerYAnchor");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController view](self, "view");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v153, "bottomAnchor");
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "constraintEqualToAnchor:constant:", v154, -34.0);
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController setSaveButtonLandscapeVerticalConstraintForIPhone:](self, "setSaveButtonLandscapeVerticalConstraintForIPhone:", v155);

      -[ICDocCamViewController iPhoneLandscapeLayoutConstraints](self, "iPhoneLandscapeLayoutConstraints");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController saveButtonLandscapeVerticalConstraintForIPhone](self, "saveButtonLandscapeVerticalConstraintForIPhone");
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "addObject:", v157);

      -[ICDocCamViewController iPhoneCompactLandscapeLayoutConstraints](self, "iPhoneCompactLandscapeLayoutConstraints");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController saveButtonLandscapeVerticalConstraintForIPhone](self, "saveButtonLandscapeVerticalConstraintForIPhone");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v158, "addObject:", v159);

      -[ICDocCamViewController saveButton](self, "saveButton");
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v160, "trailingAnchor");
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController view](self, "view");
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v162, "trailingAnchor");
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v161, "constraintEqualToAnchor:constant:", v163, -16.0);
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "addObject:", v164);

      -[ICDocCamViewController iPhonePortraitLayoutConstraints](self, "iPhonePortraitLayoutConstraints");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v165, "addObjectsFromArray:", v144);

      objc_msgSend(v144, "removeAllObjects");
      -[ICDocCamViewController saveButton](self, "saveButton");
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v166, "trailingAnchor");
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController view](self, "view");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v168, "trailingAnchor");
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v167, "constraintEqualToAnchor:constant:", v169, 0.0);
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController setSaveButtonLandscapeTrailingConstraintForIPhone:](self, "setSaveButtonLandscapeTrailingConstraintForIPhone:", v170);

      -[ICDocCamViewController iPhoneLandscapeLayoutConstraints](self, "iPhoneLandscapeLayoutConstraints");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController saveButtonLandscapeTrailingConstraintForIPhone](self, "saveButtonLandscapeTrailingConstraintForIPhone");
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v171, "addObject:", v172);

      -[ICDocCamViewController iPhoneCompactLandscapeLayoutConstraints](self, "iPhoneCompactLandscapeLayoutConstraints");
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController saveButtonLandscapeTrailingConstraintForIPhone](self, "saveButtonLandscapeTrailingConstraintForIPhone");
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v173, "addObject:", v174);

      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController filterViewContainer](self, "filterViewContainer");
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v176, "leadingAnchor");
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController view](self, "view");
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v178, "leadingAnchor");
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v177, "constraintEqualToAnchor:constant:", v179, 0.0);
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v175, "addObject:", v180);

      -[ICDocCamViewController filterViewContainer](self, "filterViewContainer");
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v181, "trailingAnchor");
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController view](self, "view");
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v183, "trailingAnchor");
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v182, "constraintEqualToAnchor:constant:", v184, 0.0);
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v175, "addObject:", v185);

      -[ICDocCamViewController filterViewContainer](self, "filterViewContainer");
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v186, "topAnchor");
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController view](self, "view");
      v188 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v188, "topAnchor");
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v187, "constraintEqualToAnchor:constant:", v189, 0.0);
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v175, "addObject:", v190);

      -[ICDocCamViewController iPhonePortraitLayoutConstraints](self, "iPhonePortraitLayoutConstraints");
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v191, "addObjectsFromArray:", v175);

      -[ICDocCamViewController iPhoneLandscapeLayoutConstraints](self, "iPhoneLandscapeLayoutConstraints");
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v192, "addObjectsFromArray:", v175);

      -[ICDocCamViewController iPhoneCompactLandscapeLayoutConstraints](self, "iPhoneCompactLandscapeLayoutConstraints");
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v193, "addObjectsFromArray:", v175);

      -[ICDocCamViewController filterViewContainer](self, "filterViewContainer");
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v194, "heightAnchor");
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v195, "constraintEqualToConstant:", v655);
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController setFilterViewContainerHeightConstraint:](self, "setFilterViewContainerHeightConstraint:", v196);

      -[ICDocCamViewController iPhonePortraitLayoutConstraints](self, "iPhonePortraitLayoutConstraints");
      v197 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController filterViewContainerHeightConstraint](self, "filterViewContainerHeightConstraint");
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v197, "addObject:", v198);

      -[ICDocCamViewController iPhoneLandscapeLayoutConstraints](self, "iPhoneLandscapeLayoutConstraints");
      v199 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController filterViewContainerHeightConstraint](self, "filterViewContainerHeightConstraint");
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v199, "addObject:", v200);

      -[ICDocCamViewController iPhoneCompactLandscapeLayoutConstraints](self, "iPhoneCompactLandscapeLayoutConstraints");
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController filterViewContainerHeightConstraint](self, "filterViewContainerHeightConstraint");
      v202 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v201, "addObject:", v202);

      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController filterViewButton](self, "filterViewButton");
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v204, "leadingAnchor");
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController filterView](self, "filterView");
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v206, "leadingAnchor");
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "constraintEqualToAnchor:constant:", v207, 4.0);
      v208 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v203, "addObject:", v208);

      -[ICDocCamViewController filterViewButton](self, "filterViewButton");
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v209, "bottomAnchor");
      v210 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController filterView](self, "filterView");
      v211 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v211, "bottomAnchor");
      v212 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v210, "constraintEqualToAnchor:constant:", v212, 0.0);
      v213 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v203, "addObject:", v213);

      -[ICDocCamViewController filterScrollViewContainer](self, "filterScrollViewContainer");
      v214 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v214, "leadingAnchor");
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController filterViewButton](self, "filterViewButton");
      v216 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v216, "trailingAnchor");
      v217 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v215, "constraintEqualToAnchor:constant:", v217, 0.0);
      v218 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v203, "addObject:", v218);

      -[ICDocCamViewController filterScrollViewContainer](self, "filterScrollViewContainer");
      v219 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v219, "bottomAnchor");
      v220 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController filterView](self, "filterView");
      v221 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v221, "bottomAnchor");
      v222 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v220, "constraintEqualToAnchor:constant:", v222, 0.0);
      v223 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v203, "addObject:", v223);

      -[ICDocCamViewController filterScrollViewContainer](self, "filterScrollViewContainer");
      v224 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v224, "trailingAnchor");
      v225 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController filterView](self, "filterView");
      v226 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v226, "trailingAnchor");
      v227 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v225, "constraintEqualToAnchor:constant:", v227, 0.0);
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v203, "addObject:", v228);

      -[ICDocCamViewController iPhonePortraitLayoutConstraints](self, "iPhonePortraitLayoutConstraints");
      v229 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v229, "addObjectsFromArray:", v203);

      -[ICDocCamViewController iPhoneLandscapeLayoutConstraints](self, "iPhoneLandscapeLayoutConstraints");
      v230 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v230, "addObjectsFromArray:", v203);

      -[ICDocCamViewController iPhoneCompactLandscapeLayoutConstraints](self, "iPhoneCompactLandscapeLayoutConstraints");
      v231 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v231, "addObjectsFromArray:", v203);

      objc_msgSend(v203, "removeAllObjects");
      -[ICDocCamViewController filterViewButton](self, "filterViewButton");
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v232, "topAnchor");
      v233 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController filterView](self, "filterView");
      v234 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v234, "bottomAnchor");
      v235 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v233, "constraintEqualToAnchor:constant:", v235, -44.0);
      v236 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v203, "addObject:", v236);

      -[ICDocCamViewController filterScrollViewContainer](self, "filterScrollViewContainer");
      v237 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v237, "topAnchor");
      v238 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController filterView](self, "filterView");
      v239 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v239, "bottomAnchor");
      v240 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v238, "constraintEqualToAnchor:constant:", v240, -44.0);
      v241 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v203, "addObject:", v241);

      -[ICDocCamViewController iPhonePortraitLayoutConstraints](self, "iPhonePortraitLayoutConstraints");
      v242 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v242, "addObjectsFromArray:", v203);

      objc_msgSend(v203, "removeAllObjects");
      -[ICDocCamViewController filterViewButton](self, "filterViewButton");
      v243 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v243, "topAnchor");
      v244 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController filterView](self, "filterView");
      v245 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v245, "bottomAnchor");
      v246 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v244, "constraintEqualToAnchor:constant:", v246, -44.0);
      v247 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v203, "addObject:", v247);

      -[ICDocCamViewController filterScrollViewContainer](self, "filterScrollViewContainer");
      v248 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v248, "topAnchor");
      v249 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController filterView](self, "filterView");
      v250 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v250, "bottomAnchor");
      v251 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v249, "constraintEqualToAnchor:constant:", v251, -44.0);
      v252 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v203, "addObject:", v252);

      -[ICDocCamViewController iPhoneLandscapeLayoutConstraints](self, "iPhoneLandscapeLayoutConstraints");
      v253 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v253, "addObjectsFromArray:", v203);

      objc_msgSend(v203, "removeAllObjects");
      -[ICDocCamViewController filterViewButton](self, "filterViewButton");
      v254 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v254, "topAnchor");
      v255 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController filterView](self, "filterView");
      v256 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v256, "bottomAnchor");
      v257 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "constraintEqualToAnchor:constant:", v257, -32.0);
      v258 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v203, "addObject:", v258);

      -[ICDocCamViewController filterScrollViewContainer](self, "filterScrollViewContainer");
      v259 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v259, "topAnchor");
      v260 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController filterView](self, "filterView");
      v261 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v261, "bottomAnchor");
      v262 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v260, "constraintEqualToAnchor:constant:", v262, -32.0);
      v263 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v203, "addObject:", v263);

      -[ICDocCamViewController iPhoneCompactLandscapeLayoutConstraints](self, "iPhoneCompactLandscapeLayoutConstraints");
      v264 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v264, "addObjectsFromArray:", v203);

      -[ICDocCamViewController iPhonePortraitLayoutConstraints](self, "iPhonePortraitLayoutConstraints");
      v265 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController cancelButtonForIPhone](self, "cancelButtonForIPhone");
      v266 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v266, "centerYAnchor");
      v267 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController topToolbarForIPhone](self, "topToolbarForIPhone");
      v268 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v268, "bottomAnchor");
      v269 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v267, "constraintEqualToAnchor:constant:", v269, -22.0);
      v270 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v265, "addObject:", v270);

      -[ICDocCamViewController iPhoneLandscapeLayoutConstraints](self, "iPhoneLandscapeLayoutConstraints");
      v271 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController cancelButtonForIPhone](self, "cancelButtonForIPhone");
      v272 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v272, "centerYAnchor");
      v273 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController topToolbarForIPhone](self, "topToolbarForIPhone");
      v274 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v274, "bottomAnchor");
      v275 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v273, "constraintEqualToAnchor:constant:", v275, -22.0);
      v276 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v271, "addObject:", v276);

      -[ICDocCamViewController iPhoneCompactLandscapeLayoutConstraints](self, "iPhoneCompactLandscapeLayoutConstraints");
      v277 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController cancelButtonForIPhone](self, "cancelButtonForIPhone");
      v278 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v278, "centerYAnchor");
      v279 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController topToolbarForIPhone](self, "topToolbarForIPhone");
      v280 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v280, "bottomAnchor");
      v281 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v279, "constraintEqualToAnchor:constant:", v281, -16.0);
      v282 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v277, "addObject:", v282);

      -[ICDocCamViewController cancelButtonForIPhone](self, "cancelButtonForIPhone");
      v283 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v283, "leadingAnchor");
      v284 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController topToolbarForIPhone](self, "topToolbarForIPhone");
      v285 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v285, "leadingAnchor");
      v286 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v284, "constraintEqualToAnchor:constant:", v286, 0.0);
      v287 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController setCancelButtonForIPhoneLeadingConstraint:](self, "setCancelButtonForIPhoneLeadingConstraint:", v287);

      -[ICDocCamViewController iPhonePortraitLayoutConstraints](self, "iPhonePortraitLayoutConstraints");
      v288 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController cancelButtonForIPhoneLeadingConstraint](self, "cancelButtonForIPhoneLeadingConstraint");
      v289 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v288, "addObject:", v289);

      -[ICDocCamViewController iPhoneLandscapeLayoutConstraints](self, "iPhoneLandscapeLayoutConstraints");
      v290 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController cancelButtonForIPhoneLeadingConstraint](self, "cancelButtonForIPhoneLeadingConstraint");
      v291 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v290, "addObject:", v291);

      -[ICDocCamViewController iPhoneCompactLandscapeLayoutConstraints](self, "iPhoneCompactLandscapeLayoutConstraints");
      v292 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController cancelButtonForIPhoneLeadingConstraint](self, "cancelButtonForIPhoneLeadingConstraint");
      v293 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v292, "addObject:", v293);

      -[ICDocCamViewController iPhonePortraitLayoutConstraints](self, "iPhonePortraitLayoutConstraints");
      v294 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController autoButtonForIPhone](self, "autoButtonForIPhone");
      v295 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v295, "centerYAnchor");
      v296 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController topToolbarForIPhone](self, "topToolbarForIPhone");
      v297 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v297, "bottomAnchor");
      v298 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v296, "constraintEqualToAnchor:constant:", v298, -22.0);
      v299 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v294, "addObject:", v299);

      -[ICDocCamViewController iPhoneLandscapeLayoutConstraints](self, "iPhoneLandscapeLayoutConstraints");
      v300 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController autoButtonForIPhone](self, "autoButtonForIPhone");
      v301 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v301, "centerYAnchor");
      v302 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController topToolbarForIPhone](self, "topToolbarForIPhone");
      v303 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v303, "bottomAnchor");
      v304 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v302, "constraintEqualToAnchor:constant:", v304, -22.0);
      v305 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v300, "addObject:", v305);

      -[ICDocCamViewController iPhoneCompactLandscapeLayoutConstraints](self, "iPhoneCompactLandscapeLayoutConstraints");
      v306 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController autoButtonForIPhone](self, "autoButtonForIPhone");
      v307 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v307, "centerYAnchor");
      v308 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController topToolbarForIPhone](self, "topToolbarForIPhone");
      v309 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v309, "bottomAnchor");
      v310 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v308, "constraintEqualToAnchor:constant:", v310, -16.0);
      v311 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v306, "addObject:", v311);

      -[ICDocCamViewController autoButtonForIPhone](self, "autoButtonForIPhone");
      v312 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v312, "trailingAnchor");
      v313 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController topToolbarForIPhone](self, "topToolbarForIPhone");
      v314 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v314, "trailingAnchor");
      v315 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v313, "constraintEqualToAnchor:constant:", v315, 0.0);
      v316 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController setAutoButtonForIPhoneTrailingConstraint:](self, "setAutoButtonForIPhoneTrailingConstraint:", v316);

      -[ICDocCamViewController iPhonePortraitLayoutConstraints](self, "iPhonePortraitLayoutConstraints");
      v317 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController autoButtonForIPhoneTrailingConstraint](self, "autoButtonForIPhoneTrailingConstraint");
      v318 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v317, "addObject:", v318);

      -[ICDocCamViewController iPhoneLandscapeLayoutConstraints](self, "iPhoneLandscapeLayoutConstraints");
      v319 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController autoButtonForIPhoneTrailingConstraint](self, "autoButtonForIPhoneTrailingConstraint");
      v320 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v319, "addObject:", v320);

      -[ICDocCamViewController iPhoneCompactLandscapeLayoutConstraints](self, "iPhoneCompactLandscapeLayoutConstraints");
      v321 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController autoButtonForIPhoneTrailingConstraint](self, "autoButtonForIPhoneTrailingConstraint");
      v322 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v321, "addObject:", v322);

      -[ICDocCamViewController iPhonePortraitLayoutConstraints](self, "iPhonePortraitLayoutConstraints");
      v323 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashButtonForIPhone](self, "flashButtonForIPhone");
      v324 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v324, "centerYAnchor");
      v325 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController topToolbarForIPhone](self, "topToolbarForIPhone");
      v326 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v326, "bottomAnchor");
      v327 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v325, "constraintEqualToAnchor:constant:", v327, -22.0);
      v328 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v323, "addObject:", v328);

      -[ICDocCamViewController iPhoneLandscapeLayoutConstraints](self, "iPhoneLandscapeLayoutConstraints");
      v329 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashButtonForIPhone](self, "flashButtonForIPhone");
      v330 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v330, "centerYAnchor");
      v331 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController topToolbarForIPhone](self, "topToolbarForIPhone");
      v332 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v332, "bottomAnchor");
      v333 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v331, "constraintEqualToAnchor:constant:", v333, -22.0);
      v334 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v329, "addObject:", v334);

      -[ICDocCamViewController iPhoneCompactLandscapeLayoutConstraints](self, "iPhoneCompactLandscapeLayoutConstraints");
      v335 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashButtonForIPhone](self, "flashButtonForIPhone");
      v336 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v336, "centerYAnchor");
      v337 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController topToolbarForIPhone](self, "topToolbarForIPhone");
      v338 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v338, "bottomAnchor");
      v339 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v337, "constraintEqualToAnchor:constant:", v339, -16.0);
      v340 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v335, "addObject:", v340);

      -[ICDocCamViewController view](self, "view");
      v341 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v341, "bounds");
      v343 = v342;

      -[ICDocCamViewController view](self, "view");
      v344 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v344, "bounds");
      v346 = v345;

      if (v343 >= v346)
        v347 = v346;
      else
        v347 = v343;
      -[ICDocCamViewController cancelButtonForIPhone](self, "cancelButtonForIPhone");
      v348 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v348, "bounds");
      v350 = v349;

      -[ICDocCamViewController autoButtonForIPhone](self, "autoButtonForIPhone");
      v351 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v351, "bounds");
      v352 = v350 + 12.0;
      v354 = v353 + 12.0;

      if (v352 < v354)
        v352 = v354;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v355 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashButtonForIPhone](self, "flashButtonForIPhone");
      v356 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v356, "centerXAnchor");
      v357 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController topToolbarForIPhone](self, "topToolbarForIPhone");
      v358 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v358, "centerXAnchor");
      v359 = (void *)objc_claimAutoreleasedReturnValue();
      v653 = (v347 - (v352 + v352) + -88.0) / 3.0 * 0.5;
      objc_msgSend(v357, "constraintEqualToAnchor:constant:", v359, -22.0 - v653);
      v360 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v355, "addObject:", v360);

      -[ICDocCamViewController iPhonePortraitLayoutConstraints](self, "iPhonePortraitLayoutConstraints");
      v361 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v361, "addObjectsFromArray:", v355);

      objc_msgSend(v355, "removeAllObjects");
      -[ICDocCamViewController view](self, "view");
      v362 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v362, "bounds");
      v364 = v363;

      -[ICDocCamViewController view](self, "view");
      v365 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v365, "bounds");
      v367 = v366;

      if (v364 >= v367)
        v368 = v364;
      else
        v368 = v367;
      -[ICDocCamViewController cancelButtonForIPhone](self, "cancelButtonForIPhone");
      v369 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v369, "bounds");
      v371 = v370;

      -[ICDocCamViewController autoButtonForIPhone](self, "autoButtonForIPhone");
      v372 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v372, "bounds");
      v373 = v371 + 12.0;
      v375 = v374 + 12.0;

      if (v373 < v375)
        v373 = v375;
      -[ICDocCamViewController flashButtonForIPhone](self, "flashButtonForIPhone");
      v376 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v376, "centerXAnchor");
      v377 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController topToolbarForIPhone](self, "topToolbarForIPhone");
      v378 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v378, "centerXAnchor");
      v379 = (void *)objc_claimAutoreleasedReturnValue();
      v652 = (v368 - (v373 + v373) + -88.0) / 3.0 * 0.5;
      objc_msgSend(v377, "constraintEqualToAnchor:constant:", v379, -22.0 - v652);
      v380 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v355, "addObject:", v380);

      -[ICDocCamViewController iPhoneLandscapeLayoutConstraints](self, "iPhoneLandscapeLayoutConstraints");
      v381 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v381, "addObjectsFromArray:", v355);

      objc_msgSend(v355, "removeAllObjects");
      -[ICDocCamViewController view](self, "view");
      v382 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v382, "bounds");
      v384 = v383;

      -[ICDocCamViewController view](self, "view");
      v385 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v385, "bounds");
      v387 = v386;

      if (v384 >= v387)
        v387 = v384;
      -[ICDocCamViewController cancelButtonForIPhone](self, "cancelButtonForIPhone");
      v388 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v388, "bounds");
      v390 = v389;

      -[ICDocCamViewController autoButtonForIPhone](self, "autoButtonForIPhone");
      v391 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v391, "bounds");
      v392 = v390 + 12.0;
      v394 = v393 + 12.0;

      if (v392 < v394)
        v392 = v394;
      -[ICDocCamViewController flashButtonForIPhone](self, "flashButtonForIPhone");
      v395 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v395, "centerXAnchor");
      v396 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController topToolbarForIPhone](self, "topToolbarForIPhone");
      v397 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v397, "centerXAnchor");
      v398 = (void *)objc_claimAutoreleasedReturnValue();
      v399 = (v387 - (v392 + v392) + -64.0) / 3.0 * 0.5;
      objc_msgSend(v396, "constraintEqualToAnchor:constant:", v398, -16.0 - v399);
      v400 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v355, "addObject:", v400);

      -[ICDocCamViewController iPhoneCompactLandscapeLayoutConstraints](self, "iPhoneCompactLandscapeLayoutConstraints");
      v401 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v401, "addObjectsFromArray:", v355);

      objc_msgSend(v355, "removeAllObjects");
      -[ICDocCamViewController iPhonePortraitLayoutConstraints](self, "iPhonePortraitLayoutConstraints");
      v402 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController filterButtonForIPhone](self, "filterButtonForIPhone");
      v403 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v403, "centerYAnchor");
      v404 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController topToolbarForIPhone](self, "topToolbarForIPhone");
      v405 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v405, "bottomAnchor");
      v406 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v404, "constraintEqualToAnchor:constant:", v406, -22.0);
      v407 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v402, "addObject:", v407);

      -[ICDocCamViewController iPhoneLandscapeLayoutConstraints](self, "iPhoneLandscapeLayoutConstraints");
      v408 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController filterButtonForIPhone](self, "filterButtonForIPhone");
      v409 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v409, "centerYAnchor");
      v410 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController topToolbarForIPhone](self, "topToolbarForIPhone");
      v411 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v411, "bottomAnchor");
      v412 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v410, "constraintEqualToAnchor:constant:", v412, -22.0);
      v413 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v408, "addObject:", v413);

      -[ICDocCamViewController iPhoneCompactLandscapeLayoutConstraints](self, "iPhoneCompactLandscapeLayoutConstraints");
      v414 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController filterButtonForIPhone](self, "filterButtonForIPhone");
      v415 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v415, "centerYAnchor");
      v416 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController topToolbarForIPhone](self, "topToolbarForIPhone");
      v417 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v417, "bottomAnchor");
      v418 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v416, "constraintEqualToAnchor:constant:", v418, -16.0);
      v419 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v414, "addObject:", v419);

      -[ICDocCamViewController filterButtonForIPhone](self, "filterButtonForIPhone");
      v420 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v420, "centerXAnchor");
      v421 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController topToolbarForIPhone](self, "topToolbarForIPhone");
      v422 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v422, "centerXAnchor");
      v423 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v421, "constraintEqualToAnchor:constant:", v423, v653 + 22.0);
      v424 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v355, "addObject:", v424);

      -[ICDocCamViewController iPhonePortraitLayoutConstraints](self, "iPhonePortraitLayoutConstraints");
      v425 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v425, "addObjectsFromArray:", v355);

      objc_msgSend(v355, "removeAllObjects");
      -[ICDocCamViewController filterButtonForIPhone](self, "filterButtonForIPhone");
      v426 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v426, "centerXAnchor");
      v427 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController topToolbarForIPhone](self, "topToolbarForIPhone");
      v428 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v428, "centerXAnchor");
      v429 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v427, "constraintEqualToAnchor:constant:", v429, v652 + 22.0);
      v430 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v355, "addObject:", v430);

      -[ICDocCamViewController iPhoneLandscapeLayoutConstraints](self, "iPhoneLandscapeLayoutConstraints");
      v431 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v431, "addObjectsFromArray:", v355);

      objc_msgSend(v355, "removeAllObjects");
      -[ICDocCamViewController filterButtonForIPhone](self, "filterButtonForIPhone");
      v432 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v432, "centerXAnchor");
      v433 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController topToolbarForIPhone](self, "topToolbarForIPhone");
      v434 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v434, "centerXAnchor");
      v435 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v433, "constraintEqualToAnchor:constant:", v435, v399 + 16.0);
      v436 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v355, "addObject:", v436);

      -[ICDocCamViewController iPhoneCompactLandscapeLayoutConstraints](self, "iPhoneCompactLandscapeLayoutConstraints");
      v437 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v437, "addObjectsFromArray:", v355);

      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v438 = (void *)objc_claimAutoreleasedReturnValue();
      v663 = 0u;
      v664 = 0u;
      v661 = 0u;
      v662 = 0u;
      -[ICDocCamViewController flashSettingView](self, "flashSettingView");
      v439 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v439, "constraints");
      v440 = (void *)objc_claimAutoreleasedReturnValue();

      v441 = objc_msgSend(v440, "countByEnumeratingWithState:objects:count:", &v661, v666, 16);
      if (v441)
      {
        v442 = *(_QWORD *)v662;
        do
        {
          for (i = 0; i != v441; ++i)
          {
            if (*(_QWORD *)v662 != v442)
              objc_enumerationMutation(v440);
            objc_msgSend(v438, "addObject:", *(_QWORD *)(*((_QWORD *)&v661 + 1) + 8 * i));
          }
          v441 = objc_msgSend(v440, "countByEnumeratingWithState:objects:count:", &v661, v666, 16);
        }
        while (v441);
      }

      -[ICDocCamViewController flashSettingView](self, "flashSettingView");
      v444 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v444, "removeConstraints:", v438);

      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v445 = (void *)objc_claimAutoreleasedReturnValue();

      v659 = 0u;
      v660 = 0u;
      v657 = 0u;
      v658 = 0u;
      -[ICDocCamViewController flashSettingButtonView](self, "flashSettingButtonView");
      v446 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v446, "constraints");
      v447 = (void *)objc_claimAutoreleasedReturnValue();

      v448 = objc_msgSend(v447, "countByEnumeratingWithState:objects:count:", &v657, v665, 16);
      if (v448)
      {
        v449 = *(_QWORD *)v658;
        do
        {
          for (j = 0; j != v448; ++j)
          {
            if (*(_QWORD *)v658 != v449)
              objc_enumerationMutation(v447);
            objc_msgSend(v445, "addObject:", *(_QWORD *)(*((_QWORD *)&v657 + 1) + 8 * j));
          }
          v448 = objc_msgSend(v447, "countByEnumeratingWithState:objects:count:", &v657, v665, 16);
        }
        while (v448);
      }

      -[ICDocCamViewController flashSettingButtonView](self, "flashSettingButtonView");
      v451 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v451, "removeConstraints:", v445);

      -[ICDocCamViewController view](self, "view");
      v452 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingView](self, "flashSettingView");
      v453 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v452, "dc_removeAllConstraintsForSubview:", v453);

      -[ICDocCamViewController flashSettingView](self, "flashSettingView");
      v454 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v454, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[ICDocCamViewController flashSettingView](self, "flashSettingView");
      v455 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingButtonView](self, "flashSettingButtonView");
      v456 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v455, "dc_removeAllConstraintsForSubview:", v456);

      -[ICDocCamViewController flashSettingButtonView](self, "flashSettingButtonView");
      v457 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v457, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[ICDocCamViewController flashSettingButtonView](self, "flashSettingButtonView");
      v458 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingViewFlashIcon](self, "flashSettingViewFlashIcon");
      v459 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v458, "dc_removeAllConstraintsForSubview:", v459);

      -[ICDocCamViewController flashSettingViewFlashIcon](self, "flashSettingViewFlashIcon");
      v460 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v460, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[ICDocCamViewController flashSettingButtonView](self, "flashSettingButtonView");
      v461 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingViewAutoButton](self, "flashSettingViewAutoButton");
      v462 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v461, "dc_removeAllConstraintsForSubview:", v462);

      -[ICDocCamViewController flashSettingViewAutoButton](self, "flashSettingViewAutoButton");
      v463 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v463, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[ICDocCamViewController flashSettingButtonView](self, "flashSettingButtonView");
      v464 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingViewOnButton](self, "flashSettingViewOnButton");
      v465 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v464, "dc_removeAllConstraintsForSubview:", v465);

      -[ICDocCamViewController flashSettingViewOnButton](self, "flashSettingViewOnButton");
      v466 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v466, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[ICDocCamViewController flashSettingButtonView](self, "flashSettingButtonView");
      v467 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingViewOffButton](self, "flashSettingViewOffButton");
      v468 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v467, "dc_removeAllConstraintsForSubview:", v468);

      -[ICDocCamViewController flashSettingViewOffButton](self, "flashSettingViewOffButton");
      v469 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v469, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[ICDocCamViewController flashButton](self, "flashButton");
      v470 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v470, "setHidden:", 1);

      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v471 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingView](self, "flashSettingView");
      v472 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v472, "leadingAnchor");
      v473 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController view](self, "view");
      v474 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v474, "leadingAnchor");
      v475 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v473, "constraintEqualToAnchor:constant:", v475, 0.0);
      v476 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v471, "addObject:", v476);

      -[ICDocCamViewController flashSettingView](self, "flashSettingView");
      v477 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v477, "trailingAnchor");
      v478 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController view](self, "view");
      v479 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v479, "trailingAnchor");
      v480 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v478, "constraintEqualToAnchor:constant:", v480, 0.0);
      v481 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v471, "addObject:", v481);

      -[ICDocCamViewController flashSettingView](self, "flashSettingView");
      v482 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v482, "topAnchor");
      v483 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController view](self, "view");
      v484 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v484, "topAnchor");
      v485 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v483, "constraintEqualToAnchor:constant:", v485, 0.0);
      v486 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v471, "addObject:", v486);

      -[ICDocCamViewController iPhonePortraitLayoutConstraints](self, "iPhonePortraitLayoutConstraints");
      v487 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v487, "addObjectsFromArray:", v471);

      -[ICDocCamViewController iPhoneLandscapeLayoutConstraints](self, "iPhoneLandscapeLayoutConstraints");
      v488 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v488, "addObjectsFromArray:", v471);

      -[ICDocCamViewController iPhoneCompactLandscapeLayoutConstraints](self, "iPhoneCompactLandscapeLayoutConstraints");
      v489 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v489, "addObjectsFromArray:", v471);

      -[ICDocCamViewController flashSettingView](self, "flashSettingView");
      v490 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v490, "heightAnchor");
      v491 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v491, "constraintEqualToConstant:", v655);
      v492 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController setFlashSettingViewHeightConstraint:](self, "setFlashSettingViewHeightConstraint:", v492);

      -[ICDocCamViewController iPhonePortraitLayoutConstraints](self, "iPhonePortraitLayoutConstraints");
      v493 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingViewHeightConstraint](self, "flashSettingViewHeightConstraint");
      v494 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v493, "addObject:", v494);

      -[ICDocCamViewController iPhoneLandscapeLayoutConstraints](self, "iPhoneLandscapeLayoutConstraints");
      v495 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingViewHeightConstraint](self, "flashSettingViewHeightConstraint");
      v496 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v495, "addObject:", v496);

      -[ICDocCamViewController iPhoneCompactLandscapeLayoutConstraints](self, "iPhoneCompactLandscapeLayoutConstraints");
      v497 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingViewHeightConstraint](self, "flashSettingViewHeightConstraint");
      v498 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v497, "addObject:", v498);

      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v499 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingButtonView](self, "flashSettingButtonView");
      v500 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v500, "leadingAnchor");
      v501 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingView](self, "flashSettingView");
      v502 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v502, "leadingAnchor");
      v503 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v501, "constraintEqualToAnchor:constant:", v503, 0.0);
      v504 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v499, "addObject:", v504);

      -[ICDocCamViewController flashSettingButtonView](self, "flashSettingButtonView");
      v505 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v505, "trailingAnchor");
      v506 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingView](self, "flashSettingView");
      v507 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v507, "trailingAnchor");
      v508 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v506, "constraintEqualToAnchor:constant:", v508, 0.0);
      v509 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v499, "addObject:", v509);

      -[ICDocCamViewController flashSettingButtonView](self, "flashSettingButtonView");
      v510 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v510, "bottomAnchor");
      v511 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingView](self, "flashSettingView");
      v512 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v512, "bottomAnchor");
      v513 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v511, "constraintEqualToAnchor:constant:", v513, 0.0);
      v514 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v499, "addObject:", v514);

      -[ICDocCamViewController iPhonePortraitLayoutConstraints](self, "iPhonePortraitLayoutConstraints");
      v515 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v515, "addObjectsFromArray:", v499);

      -[ICDocCamViewController iPhoneLandscapeLayoutConstraints](self, "iPhoneLandscapeLayoutConstraints");
      v516 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v516, "addObjectsFromArray:", v499);

      -[ICDocCamViewController iPhoneCompactLandscapeLayoutConstraints](self, "iPhoneCompactLandscapeLayoutConstraints");
      v517 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v517, "addObjectsFromArray:", v499);

      -[ICDocCamViewController iPhonePortraitLayoutConstraints](self, "iPhonePortraitLayoutConstraints");
      v518 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingButtonView](self, "flashSettingButtonView");
      v519 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v519, "topAnchor");
      v520 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingView](self, "flashSettingView");
      v521 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v521, "bottomAnchor");
      v522 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v520, "constraintEqualToAnchor:constant:", v522, -44.0);
      v523 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v518, "addObject:", v523);

      -[ICDocCamViewController iPhoneLandscapeLayoutConstraints](self, "iPhoneLandscapeLayoutConstraints");
      v524 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingButtonView](self, "flashSettingButtonView");
      v525 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v525, "topAnchor");
      v526 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingView](self, "flashSettingView");
      v527 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v527, "bottomAnchor");
      v528 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v526, "constraintEqualToAnchor:constant:", v528, -44.0);
      v529 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v524, "addObject:", v529);

      -[ICDocCamViewController iPhoneCompactLandscapeLayoutConstraints](self, "iPhoneCompactLandscapeLayoutConstraints");
      v530 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingButtonView](self, "flashSettingButtonView");
      v531 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v531, "topAnchor");
      v532 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingView](self, "flashSettingView");
      v533 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v533, "bottomAnchor");
      v534 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v532, "constraintEqualToAnchor:constant:", v534, -32.0);
      v535 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v530, "addObject:", v535);

      -[ICDocCamViewController view](self, "view");
      v536 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v536, "bounds");
      v538 = v537;

      -[ICDocCamViewController view](self, "view");
      v539 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v539, "bounds");
      v541 = v540;

      if (v538 >= v541)
        v542 = v541;
      else
        v542 = v538;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v543 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingViewFlashIcon](self, "flashSettingViewFlashIcon");
      v544 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v544, "centerXAnchor");
      v545 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingButtonView](self, "flashSettingButtonView");
      v546 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v546, "leadingAnchor");
      v547 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v545, "constraintEqualToAnchor:constant:", v547, 24.0);
      v548 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v543, "addObject:", v548);

      -[ICDocCamViewController flashSettingViewFlashIcon](self, "flashSettingViewFlashIcon");
      v549 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v549, "centerYAnchor");
      v550 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingButtonView](self, "flashSettingButtonView");
      v551 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v551, "centerYAnchor");
      v552 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v550, "constraintEqualToAnchor:constant:", v552, 0.0);
      v553 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v543, "addObject:", v553);

      -[ICDocCamViewController flashSettingViewAutoButton](self, "flashSettingViewAutoButton");
      v554 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v554, "centerXAnchor");
      v555 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingButtonView](self, "flashSettingButtonView");
      v556 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v556, "leadingAnchor");
      v557 = (void *)objc_claimAutoreleasedReturnValue();
      v558 = v542 * 0.5;
      v559 = (v542 * 0.5 + -32.0) * 0.5;
      objc_msgSend(v555, "constraintEqualToAnchor:constant:", v557, v559 + 32.0);
      v560 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v543, "addObject:", v560);

      -[ICDocCamViewController flashSettingViewAutoButton](self, "flashSettingViewAutoButton");
      v561 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v561, "centerYAnchor");
      v562 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingButtonView](self, "flashSettingButtonView");
      v563 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v563, "centerYAnchor");
      v564 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v562, "constraintEqualToAnchor:constant:", v564, 0.0);
      v565 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v543, "addObject:", v565);

      -[ICDocCamViewController flashSettingViewOnButton](self, "flashSettingViewOnButton");
      v566 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v566, "centerXAnchor");
      v567 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingButtonView](self, "flashSettingButtonView");
      v568 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v568, "leadingAnchor");
      v569 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v567, "constraintEqualToAnchor:constant:", v569, v558);
      v570 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v543, "addObject:", v570);

      -[ICDocCamViewController flashSettingViewOnButton](self, "flashSettingViewOnButton");
      v571 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v571, "centerYAnchor");
      v572 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingButtonView](self, "flashSettingButtonView");
      v573 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v573, "centerYAnchor");
      v574 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v572, "constraintEqualToAnchor:constant:", v574, 0.0);
      v575 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v543, "addObject:", v575);

      -[ICDocCamViewController flashSettingViewOffButton](self, "flashSettingViewOffButton");
      v576 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v576, "centerXAnchor");
      v577 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingButtonView](self, "flashSettingButtonView");
      v578 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v578, "leadingAnchor");
      v579 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v577, "constraintEqualToAnchor:constant:", v579, v558 + v559);
      v580 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v543, "addObject:", v580);

      -[ICDocCamViewController flashSettingViewOffButton](self, "flashSettingViewOffButton");
      v581 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v581, "centerYAnchor");
      v582 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingButtonView](self, "flashSettingButtonView");
      v583 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v583, "centerYAnchor");
      v584 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v582, "constraintEqualToAnchor:constant:", v584, 0.0);
      v585 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v543, "addObject:", v585);

      -[ICDocCamViewController iPhonePortraitLayoutConstraints](self, "iPhonePortraitLayoutConstraints");
      v586 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v586, "addObjectsFromArray:", v543);

      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v587 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingViewFlashIcon](self, "flashSettingViewFlashIcon");
      v588 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v588, "trailingAnchor");
      v589 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingViewAutoButton](self, "flashSettingViewAutoButton");
      v590 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v590, "leadingAnchor");
      v591 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v589, "constraintEqualToAnchor:constant:", v591, -37.0);
      v592 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v587, "addObject:", v592);

      -[ICDocCamViewController flashSettingViewFlashIcon](self, "flashSettingViewFlashIcon");
      v593 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v593, "centerYAnchor");
      v594 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingViewAutoButton](self, "flashSettingViewAutoButton");
      v595 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v595, "centerYAnchor");
      v596 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v594, "constraintEqualToAnchor:constant:", v596, 0.0);
      v597 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v587, "addObject:", v597);

      -[ICDocCamViewController flashSettingViewAutoButton](self, "flashSettingViewAutoButton");
      v598 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v598, "trailingAnchor");
      v599 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingViewOnButton](self, "flashSettingViewOnButton");
      v600 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v600, "leadingAnchor");
      v601 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v599, "constraintEqualToAnchor:constant:", v601, -46.0);
      v602 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v587, "addObject:", v602);

      -[ICDocCamViewController flashSettingViewAutoButton](self, "flashSettingViewAutoButton");
      v603 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v603, "centerYAnchor");
      v604 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingButtonView](self, "flashSettingButtonView");
      v605 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v605, "centerYAnchor");
      v606 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v604, "constraintEqualToAnchor:constant:", v606, 0.0);
      v607 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v587, "addObject:", v607);

      -[ICDocCamViewController flashSettingViewOnButton](self, "flashSettingViewOnButton");
      v608 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v608, "centerXAnchor");
      v609 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingButtonView](self, "flashSettingButtonView");
      v610 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v610, "centerXAnchor");
      v611 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v609, "constraintEqualToAnchor:constant:", v611, 0.0);
      v612 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v587, "addObject:", v612);

      -[ICDocCamViewController flashSettingViewOnButton](self, "flashSettingViewOnButton");
      v613 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v613, "centerYAnchor");
      v614 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingButtonView](self, "flashSettingButtonView");
      v615 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v615, "centerYAnchor");
      v616 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v614, "constraintEqualToAnchor:constant:", v616, 0.0);
      v617 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v587, "addObject:", v617);

      -[ICDocCamViewController flashSettingViewOffButton](self, "flashSettingViewOffButton");
      v618 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v618, "leadingAnchor");
      v619 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingViewOnButton](self, "flashSettingViewOnButton");
      v620 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v620, "trailingAnchor");
      v621 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v619, "constraintEqualToAnchor:constant:", v621, 46.0);
      v622 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v587, "addObject:", v622);

      -[ICDocCamViewController flashSettingViewOffButton](self, "flashSettingViewOffButton");
      v623 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v623, "centerYAnchor");
      v624 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingButtonView](self, "flashSettingButtonView");
      v625 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v625, "centerYAnchor");
      v626 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v624, "constraintEqualToAnchor:constant:", v626, 0.0);
      v627 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v587, "addObject:", v627);

      -[ICDocCamViewController iPhoneLandscapeLayoutConstraints](self, "iPhoneLandscapeLayoutConstraints");
      v628 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v628, "addObjectsFromArray:", v587);

      -[ICDocCamViewController iPhoneCompactLandscapeLayoutConstraints](self, "iPhoneCompactLandscapeLayoutConstraints");
      v629 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v629, "addObjectsFromArray:", v587);

      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v630 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController view](self, "view");
      v631 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController thumbnailContainerView](self, "thumbnailContainerView");
      v632 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v631, "dc_removeAllConstraintsForSubview:", v632);

      -[ICDocCamViewController thumbnailContainerView](self, "thumbnailContainerView");
      v633 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v633, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[ICDocCamViewController thumbnailContainerView](self, "thumbnailContainerView");
      v634 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v634, "leadingAnchor");
      v635 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController view](self, "view");
      v636 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v636, "leadingAnchor");
      v637 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v635, "constraintEqualToAnchor:constant:", v637, 16.0);
      v638 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController setThumbnailContainerViewLeadingConstraintForIPhone:](self, "setThumbnailContainerViewLeadingConstraintForIPhone:", v638);

      -[ICDocCamViewController thumbnailContainerViewLeadingConstraintForIPhone](self, "thumbnailContainerViewLeadingConstraintForIPhone");
      v639 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v630, "addObject:", v639);

      -[ICDocCamViewController thumbnailContainerView](self, "thumbnailContainerView");
      v640 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v640, "bottomAnchor");
      v641 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController view](self, "view");
      v642 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v642, "bottomAnchor");
      v643 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v641, "constraintEqualToAnchor:constant:", v643, 0.0);
      v644 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController setThumbnailContainerViewBottomConstraintForIPhone:](self, "setThumbnailContainerViewBottomConstraintForIPhone:", v644);

      -[ICDocCamViewController thumbnailContainerViewBottomConstraintForIPhone](self, "thumbnailContainerViewBottomConstraintForIPhone");
      v645 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v630, "addObject:", v645);

      -[ICDocCamViewController thumbnailContainerView](self, "thumbnailContainerView");
      v646 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v646, "widthAnchor");
      v647 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v647, "constraintEqualToConstant:", 100.0);
      v648 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v630, "addObject:", v648);

      -[ICDocCamViewController iPhonePortraitLayoutConstraints](self, "iPhonePortraitLayoutConstraints");
      v649 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v649, "addObjectsFromArray:", v630);

      -[ICDocCamViewController iPhoneLandscapeLayoutConstraints](self, "iPhoneLandscapeLayoutConstraints");
      v650 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v650, "addObjectsFromArray:", v630);

      -[ICDocCamViewController iPhoneCompactLandscapeLayoutConstraints](self, "iPhoneCompactLandscapeLayoutConstraints");
      v651 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v651, "addObjectsFromArray:", v630);

    }
  }
  -[ICDocCamViewController autoShutterOnTopLayoutConstraint](self, "autoShutterOnTopLayoutConstraint");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setConstant:", v6 + 60.0);

  -[ICDocCamViewController autoShutterOffTopLayoutConstraint](self, "autoShutterOffTopLayoutConstraint");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setConstant:", v6 + 60.0);

  -[ICDocCamViewController shutterButtonBottomConstraintForPortraitIPhone](self, "shutterButtonBottomConstraintForPortraitIPhone");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setConstant:", v25);

  -[ICDocCamViewController shutterButtonBottomConstraintForLandscapeIPhone](self, "shutterButtonBottomConstraintForLandscapeIPhone");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setConstant:", v25);

  -[ICDocCamViewController filterViewContainerHeightConstraint](self, "filterViewContainerHeightConstraint");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setConstant:", v655 + v6);

  -[ICDocCamViewController flashSettingViewHeightConstraint](self, "flashSettingViewHeightConstraint");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setConstant:", v655 + v6);

  -[ICDocCamViewController thumbnailContainerViewBottomConstraintForIPhone](self, "thumbnailContainerViewBottomConstraintForIPhone");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setConstant:", -16.0 - v8 - v12);

  -[ICDocCamViewController thumbnailContainerViewLeadingConstraintForIPhone](self, "thumbnailContainerViewLeadingConstraintForIPhone");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setConstant:", v656 + 16.0);

  -[ICDocCamViewController cancelButtonForIPhoneLeadingConstraint](self, "cancelButtonForIPhoneLeadingConstraint");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setConstant:", v656 + 12.0);

  -[ICDocCamViewController autoButtonForIPhoneTrailingConstraint](self, "autoButtonForIPhoneTrailingConstraint");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setConstant:", -12.0 - v10);

  -[ICDocCamViewController saveButtonLandscapeVerticalConstraintForIPhone](self, "saveButtonLandscapeVerticalConstraintForIPhone");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setConstant:", -34.0 - v8);

  -[ICDocCamViewController saveButtonLandscapeTrailingConstraintForIPhone](self, "saveButtonLandscapeTrailingConstraintForIPhone");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setConstant:", -21.0 - v10);

  -[ICDocCamViewController view](self, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "frame");
  v40 = v39;

  -[ICDocCamViewController view](self, "view");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "frame");
  v43 = v42;

  if (v40 >= v43)
    v40 = v43;
  -[ICDocCamViewController saveButton](self, "saveButton");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setMaxWidthForPortraitIPhone:", (uint64_t)(v40 * 0.5 + -43.0 + -16.0));

  -[ICDocCamViewController filterButtonImage](self, "filterButtonImage");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController filterButton](self, "filterButton");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setImage:forState:", v45, 0);

  -[ICDocCamViewController filterButtonForIPhone](self, "filterButtonForIPhone");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setImage:forState:", v45, 0);

  -[ICDocCamViewController filterViewButton](self, "filterViewButton");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setImage:forState:", v45, 0);

  -[ICDocCamViewController flashButtonImage](self, "flashButtonImage");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController flashButton](self, "flashButton");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setImage:forState:", v49, 0);

  -[ICDocCamViewController flashButtonForIPhone](self, "flashButtonForIPhone");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setImage:forState:", v49, 0);

  -[ICDocCamViewController flashSettingViewFlashIcon](self, "flashSettingViewFlashIcon");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setImage:forState:", v49, 0);

  -[ICDocCamViewController filterScrollViewContentWidthWithInterItemSpacing:startPadding:endPadding:](self, "filterScrollViewContentWidthWithInterItemSpacing:startPadding:endPadding:", 20.0, 10.0, 0.0);
  v54 = v53;
  -[ICDocCamViewController filterViewButton](self, "filterViewButton");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "frame");
  v57 = v56;

  -[ICDocCamViewController view](self, "view");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "bounds");
  v60 = v59;

  -[ICDocCamViewController filterViewLeadingConstraint](self, "filterViewLeadingConstraint");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setConstant:", 0.0);

  -[ICDocCamViewController filterViewTrailingConstraint](self, "filterViewTrailingConstraint");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setConstant:", 0.0);

  if (v60 - (v54 + v57) <= 0.0 || v11 < 2)
  {
    if (v11 <= 1)
    {
      v64 = (void *)MEMORY[0x24BDD1628];
      -[ICDocCamViewController iPhoneLandscapeLayoutConstraints](self, "iPhoneLandscapeLayoutConstraints");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "deactivateConstraints:", v65);

      v66 = (void *)MEMORY[0x24BDD1628];
      -[ICDocCamViewController iPhoneCompactLandscapeLayoutConstraints](self, "iPhoneCompactLandscapeLayoutConstraints");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "deactivateConstraints:", v67);

      v68 = (void *)MEMORY[0x24BDD1628];
      -[ICDocCamViewController iPhonePortraitLayoutConstraints](self, "iPhonePortraitLayoutConstraints");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "activateConstraints:", v69);

      -[ICDocCamViewController topToolbarForIPhoneHeightConstraint](self, "topToolbarForIPhoneHeightConstraint");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setConstant:", v6 + 44.0);

      -[ICDocCamViewController filterNameFeedbackViewTopLayoutConstraint](self, "filterNameFeedbackViewTopLayoutConstraint");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "setConstant:", v6 + 59.0);
      goto LABEL_24;
    }
  }
  else
  {
    -[ICDocCamViewController view](self, "view");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "bounds");
    v74 = v73;

    -[ICDocCamViewController filterViewButton](self, "filterViewButton");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "frame");
    v77 = v76;
    -[ICDocCamViewController filterViewLeadingConstraint](self, "filterViewLeadingConstraint");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v74 - v54 + -10.0;
    objc_msgSend(v78, "setConstant:", v79 * 0.5 - v77 + -4.0);

    -[ICDocCamViewController filterViewTrailingConstraint](self, "filterViewTrailingConstraint");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setConstant:", v79 * -0.5);

  }
  v81 = (void *)MEMORY[0x24BDD1628];
  -[ICDocCamViewController iPhonePortraitLayoutConstraints](self, "iPhonePortraitLayoutConstraints");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "deactivateConstraints:", v82);

  v83 = (void *)MEMORY[0x24BDD1628];
  if (v654)
  {
    -[ICDocCamViewController iPhoneLandscapeLayoutConstraints](self, "iPhoneLandscapeLayoutConstraints");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "deactivateConstraints:", v84);

    v85 = (void *)MEMORY[0x24BDD1628];
    -[ICDocCamViewController iPhoneCompactLandscapeLayoutConstraints](self, "iPhoneCompactLandscapeLayoutConstraints");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "activateConstraints:", v86);

    -[ICDocCamViewController topToolbarForIPhoneHeightConstraint](self, "topToolbarForIPhoneHeightConstraint");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "setConstant:", v6 + 32.0);

    -[ICDocCamViewController filterNameFeedbackViewTopLayoutConstraint](self, "filterNameFeedbackViewTopLayoutConstraint");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setConstant:", v6 + 45.0);
  }
  else
  {
    -[ICDocCamViewController iPhoneCompactLandscapeLayoutConstraints](self, "iPhoneCompactLandscapeLayoutConstraints");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "deactivateConstraints:", v88);

    v89 = (void *)MEMORY[0x24BDD1628];
    -[ICDocCamViewController iPhoneLandscapeLayoutConstraints](self, "iPhoneLandscapeLayoutConstraints");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "activateConstraints:", v90);

    -[ICDocCamViewController topToolbarForIPhoneHeightConstraint](self, "topToolbarForIPhoneHeightConstraint");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "setConstant:", v6 + 44.0);

    -[ICDocCamViewController filterNameFeedbackViewTopLayoutConstraint](self, "filterNameFeedbackViewTopLayoutConstraint");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setConstant:", v6 + 59.0);
  }
LABEL_24:

  -[ICDocCamViewController view](self, "view");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "layoutIfNeeded");

}

- (void)updateThumbnailContainerViewConstraintConstantForIPad
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  id v9;
  id v10;
  id v11;

  -[ICDocCamViewController cancelButton](self, "cancelButton");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v4 = v3;

  -[ICDocCamViewController saveButton](self, "saveButton");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v6 = v5;

  v7 = vabdd_f64(v4, v6);
  -[ICDocCamViewController thumbnailContainerViewLeadingConstraintForIPad](self, "thumbnailContainerViewLeadingConstraintForIPad");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 >= v6)
  {
    objc_msgSend(v10, "setConstant:", 48.0);

    -[ICDocCamViewController thumbnailContainerViewTrailingConstraintForIPad](self, "thumbnailContainerViewTrailingConstraintForIPad");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setConstant:", -(v7 + 48.0));
  }
  else
  {
    objc_msgSend(v10, "setConstant:", v7 + 48.0);

    -[ICDocCamViewController thumbnailContainerViewTrailingConstraintForIPad](self, "thumbnailContainerViewTrailingConstraintForIPad");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setConstant:", -48.0);
  }

}

- (double)filterScrollViewContentWidthWithInterItemSpacing:(double)a3 startPadding:(double)a4 endPadding:(double)a5
{
  unint64_t i;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  unint64_t v17;
  double v18;

  for (i = 0; ; ++i)
  {
    -[ICDocCamViewController filterButtons](self, "filterButtons");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11 <= i)
      break;
    -[ICDocCamViewController filterButtons](self, "filterButtons");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", i);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "frame");
    v15 = v14;
    -[ICDocCamViewController filterNames](self, "filterNames");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count") - 1;

    if (v17 <= i)
      v18 = a5;
    else
      v18 = a3;
    a4 = a4 + v15 + v18;

  }
  return a4;
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  ICDocCamViewController *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  objc_super v19;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[ICDocCamViewController processRequestsBlocker](self, "processRequestsBlocker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addBlockerOfType:clearRectangles:clearQueue:", CFSTR("OrientationBlocker"), 1, 1);

  v19.receiver = self;
  v19.super_class = (Class)ICDocCamViewController;
  -[ICDocCamViewController viewWillTransitionToSize:withTransitionCoordinator:](&v19, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[ICDocCamViewController accelerometer](self, "accelerometer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "currentDeviceOrientation");

  if ((unint64_t)(v10 - 1) <= 3)
  {
    -[ICDocCamViewController videoPreviewLayer](self, "videoPreviewLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "connection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setVideoOrientation:", v10);

  }
  -[ICDocCamViewController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "viewControllers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lastObject");
  v15 = (ICDocCamViewController *)objc_claimAutoreleasedReturnValue();
  if (v15 == self)
  {
    -[ICDocCamViewController presentedViewController](self, "presentedViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      goto LABEL_7;
    -[ICDocCamViewController shutterButton](self, "shutterButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICDocCamUtilities prepareForRotationIfNecessaryWithShutterButton:coodinator:](ICDocCamUtilities, "prepareForRotationIfNecessaryWithShutterButton:coodinator:", v13, v7);
  }
  else
  {

  }
LABEL_7:
  v17[4] = self;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __77__ICDocCamViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v18[3] = &unk_24C5B8A18;
  v18[4] = self;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __77__ICDocCamViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v17[3] = &unk_24C5B8A18;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v18, v17);

}

uint64_t __77__ICDocCamViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "saveButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "saveButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "updateAllConstraints");
  objc_msgSend(*(id *)(a1 + 32), "setUpFilterScrollView");
  return objc_msgSend(*(id *)(a1 + 32), "updateFilterChoiceButtonScrollPositionAnimated:", 1);
}

void __77__ICDocCamViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setStatusBarOrientation:", objc_msgSend(v4, "interfaceOrientation"));

  objc_msgSend(*(id *)(a1 + 32), "processRequestsBlocker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeBlockerOfType:", CFSTR("OrientationBlocker"));

  objc_msgSend(*(id *)(a1 + 32), "accelerometer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "currentDeviceOrientation");

  if ((unint64_t)(v7 - 1) <= 3)
    objc_msgSend(*(id *)(a1 + 32), "setReferenceOrientation:", v7);
}

- (void)updateAutoButtonTitleForAutoMode:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.5);
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Auto"), CFSTR("Auto"), CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController autoButtonForIPhone](self, "autoButtonForIPhone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:forState:", v8, 0);

    -[ICDocCamViewController autoButtonForIPhone](self, "autoButtonForIPhone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLargeContentTitle:", v8);

    -[ICDocCamViewController cameraHighlightColor](self, "cameraHighlightColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController autoButton](self, "autoButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTintColor:", v11);

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController manualButton](self, "manualButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTintColor:", v13);

    -[ICDocCamViewController autoButton](self, "autoButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v27);

    -[ICDocCamViewController manualButton](self, "manualButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBackgroundColor:", v5);
  }
  else
  {
    +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Manual"), CFSTR("Manual"), CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController autoButtonForIPhone](self, "autoButtonForIPhone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTitle:forState:", v8, 0);

    -[ICDocCamViewController autoButtonForIPhone](self, "autoButtonForIPhone");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setLargeContentTitle:", v8);

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController autoButton](self, "autoButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTintColor:", v19);

    -[ICDocCamViewController cameraHighlightColor](self, "cameraHighlightColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController manualButton](self, "manualButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTintColor:", v21);

    -[ICDocCamViewController autoButton](self, "autoButton");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBackgroundColor:", v5);

    -[ICDocCamViewController manualButton](self, "manualButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBackgroundColor:", v27);
  }

  -[ICDocCamViewController autoShutterOnView](self, "autoShutterOnView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setBackgroundColor:", v7);

  if (objc_msgSend(v7, "dc_colorIsLight"))
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController autoShutterOnLabel](self, "autoShutterOnLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setTextColor:", v25);

}

- (void)enableShutterButtonIfPossible
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[ICDocCamViewController isInRetakeMode](self, "isInRetakeMode"))
  {
    v3 = 1;
  }
  else
  {
    -[ICDocCamViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController documentInfoCollection](self, "documentInfoCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "docInfos");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "documentCameraController:canAddImages:", self, objc_msgSend(v6, "count") + 1);

  }
  -[ICDocCamViewController enableShutter:](self, "enableShutter:", v3);
}

- (void)enableUIElements:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  -[ICDocCamViewController flashButton](self, "flashButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v3);

  -[ICDocCamViewController filterButton](self, "filterButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v3);

  -[ICDocCamViewController autoButton](self, "autoButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", v3);

  -[ICDocCamViewController manualButton](self, "manualButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v3);

  -[ICDocCamViewController flashButtonForIPhone](self, "flashButtonForIPhone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v3);

  -[ICDocCamViewController filterButtonForIPhone](self, "filterButtonForIPhone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", v3);

  -[ICDocCamViewController autoButtonForIPhone](self, "autoButtonForIPhone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEnabled:", v3);

  -[ICDocCamViewController updateAccessibilityEnabledStateForUIElements](self, "updateAccessibilityEnabledStateForUIElements");
}

- (void)killFeedbackDisplayIncludingUserPrompts:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD v5[5];
  BOOL v6;

  v3 = a3;
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    -[ICDocCamViewController killFeedbackDisplayInternalIncludingUserPrompts:](self, "killFeedbackDisplayInternalIncludingUserPrompts:", v3);
  }
  else
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __66__ICDocCamViewController_killFeedbackDisplayIncludingUserPrompts___block_invoke;
    v5[3] = &unk_24C5B8A40;
    v5[4] = self;
    v6 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], v5);
  }
}

uint64_t __66__ICDocCamViewController_killFeedbackDisplayIncludingUserPrompts___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "killFeedbackDisplayInternalIncludingUserPrompts:", *(unsigned __int8 *)(a1 + 40));
}

- (void)killFeedbackDisplayInternalIncludingUserPrompts:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;

  v3 = a3;
  -[ICDocCamViewController autoShutterOffView](self, "autoShutterOffView");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllAnimations");

  -[ICDocCamViewController autoShutterOnView](self, "autoShutterOnView");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllAnimations");

  -[ICDocCamViewController filterNameFeedbackView](self, "filterNameFeedbackView");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllAnimations");

  -[ICDocCamViewController autoShutterOnView](self, "autoShutterOnView");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setHidden:", 0);

  -[ICDocCamViewController autoShutterOnView](self, "autoShutterOnView");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAlpha:", 1.0);

  -[ICDocCamViewController autoShutterOnView](self, "autoShutterOnView");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = 0;
  objc_msgSend(v8, "setOpacity:", v9);

  -[ICDocCamViewController autoShutterOffView](self, "autoShutterOffView");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setHidden:", 0);

  -[ICDocCamViewController autoShutterOffView](self, "autoShutterOffView");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setAlpha:", 1.0);

  -[ICDocCamViewController autoShutterOffView](self, "autoShutterOffView");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = 0;
  objc_msgSend(v10, "setOpacity:", v11);

  -[ICDocCamViewController filterNameFeedbackView](self, "filterNameFeedbackView");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setHidden:", 0);

  -[ICDocCamViewController filterNameFeedbackView](self, "filterNameFeedbackView");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setAlpha:", 1.0);

  -[ICDocCamViewController filterNameFeedbackView](self, "filterNameFeedbackView");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = 0;
  objc_msgSend(v12, "setOpacity:", v13);

  if (v3)
  {
    -[ICDocCamViewController moveCameraCloserView](self, "moveCameraCloserView");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeAllAnimations");

    -[ICDocCamViewController userPromptView](self, "userPromptView");
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeAllAnimations");

    -[ICDocCamViewController moveCameraCloserView](self, "moveCameraCloserView");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setHidden:", 0);

    -[ICDocCamViewController moveCameraCloserView](self, "moveCameraCloserView");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setAlpha:", 1.0);

    -[ICDocCamViewController moveCameraCloserView](self, "moveCameraCloserView");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = 0;
    objc_msgSend(v16, "setOpacity:", v17);

    -[ICDocCamViewController userPromptView](self, "userPromptView");
    v35 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setAlpha:", 0.0);

    -[ICDocCamViewController userPromptView](self, "userPromptView");
    v36 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setHidden:", 1);

  }
}

- (void)updateLabelColors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;

  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController autoShutterOffLabel](self, "autoShutterOffLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v7);

  objc_msgSend(MEMORY[0x24BDF6950], "dc_labelBackgroundColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController autoShutterOffView](self, "autoShutterOffView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v8);

  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController filterNameFeedbackLabel](self, "filterNameFeedbackLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v9);

  objc_msgSend(MEMORY[0x24BDF6950], "dc_labelBackgroundColor");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController filterNameFeedbackView](self, "filterNameFeedbackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v10);

}

- (BOOL)isInRetakeMode
{
  return -[ICDocCamViewController retakeIndex](self, "retakeIndex") >= 0;
}

- (void)disableRetakeMode
{
  -[ICDocCamViewController setRetakeIndex:](self, "setRetakeIndex:", -1);
}

- (void)retakeButtonWasPressed
{
  char v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  -[ICDocCamViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    -[ICDocCamViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController documentInfoCollection](self, "documentInfoCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "docInfos");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "documentCameraControllerDidRetake:pageCount:", self, objc_msgSend(v5, "count"));

  }
}

- (BOOL)autoMode
{
  return staticAutoMode;
}

- (void)setAutoMode:(BOOL)a3
{
  staticAutoMode = a3;
}

- (void)setFlashMode:(int64_t)a3
{
  void *v4;
  id v5;

  self->_flashMode = a3;
  -[ICDocCamViewController photoOutput](self, "photoOutput");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoSettingsForSceneMonitoring");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFlashMode:", a3);

}

- (void)setupCaptureSession
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  ICDocCamImageSequenceAnalyzer *v16;
  NSObject *v17;
  _QWORD block[5];
  _QWORD v19[4];
  id v20;
  id location;
  _QWORD v22[5];
  _QWORD v23[7];
  _QWORD v24[8];

  v24[7] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDB24D0]);
  -[ICDocCamViewController setSession:](self, "setSession:", v3);

  -[ICDocCamViewController session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController previewView](self, "previewView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSession:", v4);

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = dispatch_queue_create("session queue", v6);
  -[ICDocCamViewController setSessionQueue:](self, "setSessionQueue:", v7);

  -[ICDocCamViewController setSetupResult:](self, "setSetupResult:", 0);
  v8 = *MEMORY[0x24BDB1D50];
  v9 = objc_msgSend(MEMORY[0x24BDB2460], "authorizationStatusForMediaType:", *MEMORY[0x24BDB1D50]);
  v10 = MEMORY[0x24BDAC760];
  if (v9 != 3)
  {
    -[ICDocCamViewController sessionQueue](self, "sessionQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_suspend(v11);

    v22[0] = v10;
    v22[1] = 3221225472;
    v22[2] = __45__ICDocCamViewController_setupCaptureSession__block_invoke;
    v22[3] = &unk_24C5B8A68;
    v22[4] = self;
    objc_msgSend(MEMORY[0x24BDB2460], "requestAccessForMediaType:completionHandler:", v8, v22);
  }
  v23[0] = CFSTR("ICDocCamImageSequenceAnalyzer_Rectangles");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ICDocCamViewController rectangleDetectionEnabled](self, "rectangleDetectionEnabled"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v12;
  v23[1] = CFSTR("ICDocCamImageSequenceAnalyzer_Registration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ICDocCamViewController registrationEnabled](self, "registrationEnabled"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v13;
  v24[2] = MEMORY[0x24BDBD1C0];
  v23[2] = CFSTR("ICDocCamImageSequenceAnalyzer_SceneClassification");
  v23[3] = CFSTR("ICDocCamImageSequenceAnalyzer_RealTime");
  v24[3] = MEMORY[0x24BDBD1C8];
  v24[4] = MEMORY[0x24BDBD1C8];
  v23[4] = CFSTR("ICDocCamImageSequenceAnalyzer_Synchronous");
  v23[5] = CFSTR("ICDocCamImageSequenceAnalyzer_MaxBufferQueueSize");
  v23[6] = CFSTR("ICDocCamImageSequenceAnalyzer_Debug");
  v24[5] = &unk_24C5D8280;
  v24[6] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __45__ICDocCamViewController_setupCaptureSession__block_invoke_2;
  v19[3] = &unk_24C5B8A90;
  objc_copyWeak(&v20, &location);
  v15 = (void *)MEMORY[0x212B988FC](v19);
  v16 = -[ICDocCamImageSequenceAnalyzer initWithOptions:callback:]([ICDocCamImageSequenceAnalyzer alloc], "initWithOptions:callback:", v14, v15);
  -[ICDocCamViewController setVkAnalyzer:](self, "setVkAnalyzer:", v16);

  -[ICDocCamViewController sessionQueue](self, "sessionQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __45__ICDocCamViewController_setupCaptureSession__block_invoke_3;
  block[3] = &unk_24C5B89B0;
  block[4] = self;
  dispatch_async(v17, block);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __45__ICDocCamViewController_setupCaptureSession__block_invoke(uint64_t a1, char a2)
{
  NSObject *v3;

  if ((a2 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setSetupResult:", 1);
  objc_msgSend(*(id *)(a1 + 32), "sessionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v3);

}

void __45__ICDocCamViewController_setupCaptureSession__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "analyzerCallbackWithDictionaryResults:", v3);

}

void __45__ICDocCamViewController_setupCaptureSession__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned int v4;
  int v5;
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
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  CGFloat v20;
  CGFloat v21;
  uint64_t v22;
  double v23;
  double v24;
  id v25;
  const opaqueCMFormatDescription *v26;
  CGSize v27;
  id v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  id v40;
  const opaqueCMFormatDescription *v41;
  CGSize PresentationDimensions;
  FourCharCode MediaSubType;
  double width;
  double height;
  id v49;
  uint64_t v50;
  NSObject *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  NSObject *v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  id v68;
  NSObject *v69;
  dispatch_queue_t v70;
  void *v71;
  void *v72;
  int v73;
  void *v74;
  void *v75;
  NSObject *v76;
  int v77;
  id v78;
  int v79;
  id v80;
  NSObject *v81;
  int v82;
  id v83;
  NSObject *v84;
  void *v85;
  ICDocCamDebugMovieController *v86;
  void *v87;
  void *v88;
  ICDocCamDebugMovieController *v89;
  void *v90;
  void *v91;
  void *v92;
  char v93;
  uint64_t v94;
  id v95;
  id v96;
  void *v97;
  id v98;
  id v99;
  id v100;
  _QWORD block[5];
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  id v110;
  uint8_t buf[4];
  id v112;
  uint64_t v113;
  void *v114;
  _BYTE v115[128];
  _BYTE v116[128];
  uint64_t v117;

  v117 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "setupResult"))
    return;
  v94 = *MEMORY[0x24BDB1D50];
  +[ICDocCamViewController deviceWithMediaType:preferringPosition:](ICDocCamViewController, "deviceWithMediaType:preferringPosition:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = 0;
  objc_msgSend(MEMORY[0x24BDB2470], "deviceInputWithDevice:error:", v2, &v110);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = v110;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerForKey:", CFSTR("internalSettings.docCam.format"));

  if (v4 <= 3)
    v5 = v4;
  else
    v5 = 0;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scale");
  v13 = v12;

  if (v8 >= v10)
    v14 = v8;
  else
    v14 = v10;
  if (v8 >= v10)
    v15 = v10;
  else
    v15 = v8;
  if (v5 == 2)
  {
    objc_msgSend(v2, "formats");
    v108 = 0u;
    v109 = 0u;
    v106 = 0u;
    v107 = 0u;
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v106, v116, 16);
    if (v31)
    {
      v18 = 0;
      v32 = v8 * v13;
      v33 = v10 * v13;
      v34 = v14 / v15;
      v35 = *(_QWORD *)v107;
      if (v32 >= v33)
        v36 = v33;
      else
        v36 = v32;
      if (v32 >= v33)
        v37 = v32;
      else
        v37 = v33;
      v38 = 3.40282347e38;
      do
      {
        v39 = 0;
        do
        {
          if (*(_QWORD *)v107 != v35)
            objc_enumerationMutation(v16);
          v40 = *(id *)(*((_QWORD *)&v106 + 1) + 8 * v39);
          v41 = (const opaqueCMFormatDescription *)objc_msgSend(v40, "formatDescription");
          PresentationDimensions = CMVideoFormatDescriptionGetPresentationDimensions(v41, 0, 0);
          MediaSubType = CMFormatDescriptionGetMediaSubType(v41);
          if (PresentationDimensions.width >= PresentationDimensions.height)
            width = PresentationDimensions.width;
          else
            width = PresentationDimensions.height;
          if (PresentationDimensions.width >= PresentationDimensions.height)
            height = PresentationDimensions.height;
          else
            height = PresentationDimensions.width;
          if (MediaSubType == 875704422
            && height >= v36
            && width >= v37
            && vabdd_f64(v34, width / height) < 0.1
            && PresentationDimensions.width * PresentationDimensions.height < v38)
          {
            v49 = v40;

            objc_msgSend(*(id *)(a1 + 32), "setStreamingImageSize:", PresentationDimensions.width, PresentationDimensions.height);
            v38 = PresentationDimensions.width * PresentationDimensions.height;
            v18 = v49;
          }

          ++v39;
        }
        while (v31 != v39);
        v50 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v106, v116, 16);
        v31 = v50;
      }
      while (v50);

      if (v18)
      {
        v5 = 2;
        goto LABEL_76;
      }
    }
    else
    {

    }
    v51 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      goto LABEL_74;
    }
LABEL_75:

    v5 = 0;
    v18 = 0;
    goto LABEL_76;
  }
  if (v5 != 3)
  {
    v18 = 0;
    goto LABEL_77;
  }
  objc_msgSend(v2, "formats");
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v102, v115, 16);
  if (!v17)
  {

    goto LABEL_69;
  }
  v18 = 0;
  v19 = *(_QWORD *)v103;
  v20 = 0.0;
  v21 = 0.0;
  do
  {
    v22 = 0;
    v23 = v20;
    v24 = v21;
    do
    {
      if (*(_QWORD *)v103 != v19)
        objc_enumerationMutation(v16);
      v25 = *(id *)(*((_QWORD *)&v102 + 1) + 8 * v22);
      v26 = (const opaqueCMFormatDescription *)objc_msgSend(v25, "formatDescription");
      v27 = CMVideoFormatDescriptionGetPresentationDimensions(v26, 0, 0);
      v21 = v27.width;
      v20 = v27.height;
      if (CMFormatDescriptionGetMediaSubType(v26) != 875704422 || v27.width < v24 || v27.height <= v23)
      {
        v20 = v23;
        v21 = v24;
      }
      else
      {
        v30 = v25;

        v18 = v30;
        objc_msgSend(*(id *)(a1 + 32), "setStreamingImageSize:", v27.width, v27.height);
      }

      ++v22;
      v23 = v20;
      v24 = v21;
    }
    while (v17 != v22);
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v102, v115, 16);
  }
  while (v17);

  if (!v18)
  {
LABEL_69:
    v51 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
LABEL_74:
      _os_log_impl(&dword_20CE8E000, v51, OS_LOG_TYPE_DEFAULT, "Unable to find chosenFormat, defaulting to PhotoPreset", buf, 2u);
      goto LABEL_75;
    }
    goto LABEL_75;
  }
  v5 = 3;
LABEL_76:

LABEL_77:
  if (!v97)
  {
    v52 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      __45__ICDocCamViewController_setupCaptureSession__block_invoke_3_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 32), "session");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "beginConfiguration");

  objc_msgSend(*(id *)(a1 + 32), "session");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  AVCaptureSessionSetAuthorizedToUseCameraInMultipleForegroundAppLayout();

  objc_msgSend(*(id *)(a1 + 32), "session");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "canAddInput:", v97);

  if (v56)
  {
    objc_msgSend(*(id *)(a1 + 32), "session");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "addInput:", v97);

    objc_msgSend(*(id *)(a1 + 32), "setVideoDeviceInput:", v97);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __45__ICDocCamViewController_setupCaptureSession__block_invoke_436;
    block[3] = &unk_24C5B89B0;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  else
  {
    v58 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20CE8E000, v58, OS_LOG_TYPE_DEFAULT, "Could not add video device input to the session", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setSetupResult:", 2);
  }
  v96 = objc_alloc_init(MEMORY[0x24BDB24C0]);
  objc_msgSend(*(id *)(a1 + 32), "session");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v59, "canAddOutput:", v96);

  if (v60)
  {
    objc_msgSend(*(id *)(a1 + 32), "session");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addOutput:", v96);

    objc_msgSend(*(id *)(a1 + 32), "setPhotoOutput:", v96);
    objc_msgSend(*(id *)(a1 + 32), "photoOutput");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setHighResolutionCaptureEnabled:", 1);

    objc_msgSend(*(id *)(a1 + 32), "photoOutput");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setLivePhotoCaptureEnabled:", 0);

    objc_msgSend(MEMORY[0x24BDB24C8], "photoSettings");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setFlashMode:", objc_msgSend(*(id *)(a1 + 32), "flashMode"));
    objc_msgSend(*(id *)(a1 + 32), "photoOutput");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setPhotoSettingsForSceneMonitoring:", v64);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setInProgressPhotoCaptureDelegates:", v66);

  }
  else
  {
    v67 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20CE8E000, v67, OS_LOG_TYPE_DEFAULT, "Could not add still image output to the session", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setSetupResult:", 2);
  }
  v68 = objc_alloc_init(MEMORY[0x24BDB2508]);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v69 = objc_claimAutoreleasedReturnValue();
  v70 = dispatch_queue_create("VideoDataOutputQueue", v69);

  v113 = *MEMORY[0x24BDC56B8];
  v114 = &unk_24C5D82C8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setVideoSettings:", v71);

  objc_msgSend(v68, "setSampleBufferDelegate:queue:", *(_QWORD *)(a1 + 32), v70);
  objc_msgSend(*(id *)(a1 + 32), "session");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v72, "canAddOutput:", v68);

  if (v73)
  {
    objc_msgSend(*(id *)(a1 + 32), "session");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "addOutput:", v68);

    objc_msgSend(*(id *)(a1 + 32), "setVideoDataOutput:", v68);
  }
  objc_msgSend(v68, "connectionWithMediaType:", v94);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setVideoConnection:", v75);
  if (objc_msgSend(v75, "isCameraIntrinsicMatrixDeliverySupported"))
  {
    objc_msgSend(v75, "setCameraIntrinsicMatrixDeliveryEnabled:", 1);
    objc_msgSend(v75, "setPreferredVideoStabilizationMode:", 0);
  }
  if ((v5 - 2) < 2)
  {
    v100 = 0;
    v77 = objc_msgSend(v2, "lockForConfiguration:", &v100);
    v78 = v100;
    if (!v77)
    {
      v76 = os_log_create("com.apple.documentcamera", ");
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v112 = v78;
        _os_log_impl(&dword_20CE8E000, v76, OS_LOG_TYPE_DEFAULT, "Could not lock device for configuration: %@", buf, 0xCu);
      }
      goto LABEL_106;
    }
    objc_msgSend(v2, "setActiveFormat:", v18);
    objc_msgSend(v2, "unlockForConfiguration");
  }
  else
  {
    if (!v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "session");
      v76 = objc_claimAutoreleasedReturnValue();
      -[NSObject setSessionPreset:](v76, "setSessionPreset:", *MEMORY[0x24BDB1B40]);
      goto LABEL_102;
    }
    if (v5 == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "session");
      v76 = objc_claimAutoreleasedReturnValue();
      -[NSObject setSessionPreset:](v76, "setSessionPreset:", *MEMORY[0x24BDB1B20]);
LABEL_102:
      v78 = 0;
LABEL_106:

      goto LABEL_107;
    }
    v78 = 0;
  }
LABEL_107:

  v99 = 0;
  v79 = objc_msgSend(v2, "lockForConfiguration:", &v99);
  v80 = v99;
  if (v79)
  {
    objc_msgSend(v2, "setSubjectAreaChangeMonitoringEnabled:", 1);
    objc_msgSend(v2, "setProvidesStortorgetMetadata:", 1);
  }
  else
  {
    v81 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v112 = v80;
      _os_log_impl(&dword_20CE8E000, v81, OS_LOG_TYPE_DEFAULT, "Could not lock device for configuration: %@", buf, 0xCu);
    }

  }
  v98 = 0;
  v82 = objc_msgSend(v2, "lockForConfiguration:", &v98);
  v83 = v98;
  if (v82)
  {
    if (objc_msgSend(v2, "isAutoFocusRangeRestrictionSupported"))
      objc_msgSend(v2, "setAutoFocusRangeRestriction:", 1);
    objc_msgSend(v2, "unlockForConfiguration");
  }
  else
  {
    v84 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v112 = v83;
      _os_log_impl(&dword_20CE8E000, v84, OS_LOG_TYPE_DEFAULT, "Could not lock device for configuration: %@", buf, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "setDeviceHasFlash:", objc_msgSend(v2, "hasFlash"));
  objc_msgSend(*(id *)(a1 + 32), "session");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "commitConfiguration");

  if (objc_msgSend(*(id *)(a1 + 32), "scanMovieRecordingEnabled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setReferenceOrientation:", 1);
    v86 = [ICDocCamDebugMovieController alloc];
    v87 = *(void **)(a1 + 32);
    objc_msgSend(v87, "videoConnection");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = -[ICDocCamDebugMovieController initWithDelegate:videoConnection:referenceOrientation:](v86, "initWithDelegate:videoConnection:referenceOrientation:", v87, v88, objc_msgSend(*(id *)(a1 + 32), "referenceOrientation"));
    objc_msgSend(*(id *)(a1 + 32), "setMovieController:", v89);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "isConstantColorAvailable"))
  {
    objc_msgSend(*(id *)(a1 + 32), "photoOutput");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setConstantColorEnabled:", 1);

    objc_msgSend(*(id *)(a1 + 32), "photoOutput");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "setConstantColorClippingRecoveryEnabled:", 1);

    objc_msgSend(*(id *)(a1 + 32), "photoOutput");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_opt_respondsToSelector();

    if ((v93 & 1) != 0)
      objc_msgSend(v96, "setConstantColorSaturationBoostEnabled:", 1);
  }

}

void __45__ICDocCamViewController_setupCaptureSession__block_invoke_436(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t *v4;
  char v5;
  uint64_t v6;
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
  id v17;
  id v18;
  id v19;
  id v20;

  if (objc_msgSend(*(id *)(a1 + 32), "statusBarOrientation"))
    v2 = objc_msgSend(*(id *)(a1 + 32), "statusBarOrientation");
  else
    v2 = 1;
  objc_msgSend(*(id *)(a1 + 32), "previewView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "videoPreviewLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setVideoPreviewLayer:", v3);

  v4 = (uint64_t *)MEMORY[0x24BDB1C78];
  v5 = DCDebugInterfaceEnabled();
  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "userInterfaceIdiom") != 1)
      v4 = (uint64_t *)MEMORY[0x24BDB1C80];
  }
  v6 = *v4;
  objc_msgSend(*(id *)(a1 + 32), "videoPreviewLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setVideoGravity:", v6);

  if ((v5 & 1) == 0)
  objc_msgSend(*(id *)(a1 + 32), "videoPreviewLayer");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setVideoOrientation:", v2);

  objc_msgSend(*(id *)(a1 + 32), "videoPreviewLayer");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "rectForMetadataOutputRectOfInterest:", 0.0, 0.0, 1.0, 1.0);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  objc_msgSend(*(id *)(a1 + 32), "overlayView");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPreviewBounds:", v10, v12, v14, v16);

}

- (void)launchCaptureSession
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  _QWORD v9[5];
  _QWORD block[5];

  -[ICDocCamViewController sessionQueue](self, "sessionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__ICDocCamViewController_launchCaptureSession__block_invoke;
  block[3] = &unk_24C5B89B0;
  block[4] = self;
  dispatch_async(v3, block);

  if (-[ICDocCamViewController isInRetakeMode](self, "isInRetakeMode"))
  {
    -[ICDocCamViewController processRequestsBlocker](self, "processRequestsBlocker");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addBlockerOfType:clearRectangles:clearQueue:", CFSTR("ViewLifetimeBlocker"), 1, 1);

    -[ICDocCamViewController overlayView](self, "overlayView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 1);

    -[ICDocCamViewController overlayView](self, "overlayView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clearRectangles");

    v8 = dispatch_time(0, 500000000);
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __46__ICDocCamViewController_launchCaptureSession__block_invoke_6;
    v9[3] = &unk_24C5B89B0;
    v9[4] = self;
    dispatch_after(v8, MEMORY[0x24BDAC9B8], v9);
  }
}

void __46__ICDocCamViewController_launchCaptureSession__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  dispatch_time_t v5;
  NSObject *v6;
  _QWORD *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD block[5];

  v2 = objc_msgSend(*(id *)(a1 + 32), "setupResult");
  switch(v2)
  {
    case 2:
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __46__ICDocCamViewController_launchCaptureSession__block_invoke_5;
      v8[3] = &unk_24C5B89B0;
      v8[4] = *(_QWORD *)(a1 + 32);
      v6 = MEMORY[0x24BDAC9B8];
      v7 = v8;
LABEL_7:
      dispatch_async(v6, v7);
      return;
    case 1:
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __46__ICDocCamViewController_launchCaptureSession__block_invoke_3;
      v9[3] = &unk_24C5B89B0;
      v9[4] = *(_QWORD *)(a1 + 32);
      v6 = MEMORY[0x24BDAC9B8];
      v7 = v9;
      goto LABEL_7;
    case 0:
      objc_msgSend(*(id *)(a1 + 32), "addObserversIfNecessary");
      objc_msgSend(*(id *)(a1 + 32), "session");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "startRunning");

      objc_msgSend(*(id *)(a1 + 32), "session");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setSessionRunning:", objc_msgSend(v4, "isRunning"));

      objc_msgSend(*(id *)(a1 + 32), "clearQueue");
      v5 = dispatch_time(0, 500000000);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __46__ICDocCamViewController_launchCaptureSession__block_invoke_2;
      block[3] = &unk_24C5B89B0;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_after(v5, MEMORY[0x24BDAC9B8], block);
      break;
  }
}

void __46__ICDocCamViewController_launchCaptureSession__block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "processRequestsBlocker");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeBlockerOfType:", CFSTR("ViewLifetimeBlocker"));

  if (objc_msgSend(*(id *)(a1 + 32), "isSessionRunning"))
  {
    objc_msgSend(*(id *)(a1 + 32), "enableShutterButtonIfPossible");
    objc_msgSend(*(id *)(a1 + 32), "enableUIElements:", 1);
    objc_msgSend(*(id *)(a1 + 32), "physicalCaptureRecognizer");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEnabled:", 1);

    objc_msgSend(*(id *)(a1 + 32), "physicalCaptureNotifier");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnabled:", 1);

  }
}

void __46__ICDocCamViewController_launchCaptureSession__block_invoke_3(uint64_t a1)
{
  void *v2;
  double v3;
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
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "previewView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = 1.0;
  objc_msgSend(v2, "setOpacity:", v3);

  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Privacy or Restrictions settings have disabled use of the camera. You can change this in Settings."), CFSTR("Privacy or Restrictions settings have disabled use of the camera. You can change this in Settings."), CFSTR("Localizable"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDF67F0];
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Camera Unavailable"), CFSTR("Camera Unavailable"), CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v5, v15, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("exclamationmark.triangle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v7);

  v8 = (void *)MEMORY[0x24BDF67E8];
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("OK"), CFSTR("OK"), CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addAction:", v10);
  v11 = (void *)MEMORY[0x24BDF67E8];
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Settings"), CFSTR("Settings"), CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, &__block_literal_global_461);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addAction:", v13);
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v6, 1, 0);

}

void __46__ICDocCamViewController_launchCaptureSession__block_invoke_4()
{
  void *v0;
  char v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=ROOT"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "openSensitiveURL:withOptions:", v4, 0);

  if ((v1 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", *MEMORY[0x24BDF7568]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "openURL:options:completionHandler:", v3, MEMORY[0x24BDBD1B8], 0);

  }
}

void __46__ICDocCamViewController_launchCaptureSession__block_invoke_5(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "previewView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = 1.0;
  objc_msgSend(v2, "setOpacity:", v3);

  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Unable to capture media"), CFSTR("Unable to capture media"), CFSTR("Localizable"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDF67F0];
  DCAppName();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v5, v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("exclamationmark.triangle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v7);

  v8 = (void *)MEMORY[0x24BDF67E8];
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("OK"), CFSTR("OK"), CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addAction:", v10);
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v6, 1, 0);

}

void __46__ICDocCamViewController_launchCaptureSession__block_invoke_6(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "overlayView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 0);

  objc_msgSend(*(id *)(a1 + 32), "processRequestsBlocker");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeBlockerOfType:", CFSTR("ViewLifetimeBlocker"));

}

- (void)restartImageCaptureSessionIfNecessary
{
  NSObject *v3;
  _QWORD block[5];

  -[ICDocCamViewController sessionQueue](self, "sessionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__ICDocCamViewController_restartImageCaptureSessionIfNecessary__block_invoke;
  block[3] = &unk_24C5B89B0;
  block[4] = self;
  dispatch_async(v3, block);

}

void __63__ICDocCamViewController_restartImageCaptureSessionIfNecessary__block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "addObserversIfNecessary");
  objc_msgSend(*(id *)(a1 + 32), "session");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startRunning");

  objc_msgSend(*(id *)(a1 + 32), "session");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSessionRunning:", objc_msgSend(v3, "isRunning"));

}

- (void)stopImageCaptureSession
{
  NSObject *v3;
  _QWORD block[5];

  -[ICDocCamViewController sessionQueue](self, "sessionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__ICDocCamViewController_stopImageCaptureSession__block_invoke;
  block[3] = &unk_24C5B89B0;
  block[4] = self;
  dispatch_async(v3, block);

}

void __49__ICDocCamViewController_stopImageCaptureSession__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;

  if (!objc_msgSend(*(id *)(a1 + 32), "setupResult"))
  {
    objc_msgSend(*(id *)(a1 + 32), "session");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isRunning");

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "session");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stopRunning");

      objc_msgSend(*(id *)(a1 + 32), "session");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setSessionRunning:", objc_msgSend(v5, "isRunning"));

      objc_msgSend(*(id *)(a1 + 32), "removeObserversIfNecessary");
    }
  }
}

- (BOOL)isConstantColorAvailable
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  -[ICDocCamViewController photoOutput](self, "photoOutput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isConstantColorSupported");

  if (v4 == 1)
    return v6;
  else
    return 0;
}

- (void)initializeFilters
{
  void *v3;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  unint64_t v22;
  double v23;
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
  void *v34;

  v3 = (void *)MEMORY[0x24BDBCE30];
  +[ICDocCamImageFilters imageFilterNames](ICDocCamImageFilters, "imageFilterNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICDocCamImageFilters imageFilterNames](ICDocCamImageFilters, "imageFilterNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICDocCamImageFilters imageFilterNames](ICDocCamImageFilters, "imageFilterNames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICDocCamImageFilters imageFilterNames](ICDocCamImageFilters, "imageFilterNames");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithObjects:", v5, v7, v9, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController setFilterNames:](self, "setFilterNames:", v12);

  if (objc_msgSend(MEMORY[0x24BDF6750], "dc_isRTL"))
  {
    -[ICDocCamViewController filterNames](self, "filterNames");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "reverseObjectEnumerator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController setFilterNames:](self, "setFilterNames:", v15);

  }
  -[ICDocCamViewController filterButtons](self, "filterButtons");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    -[ICDocCamViewController filterScrollView](self, "filterScrollView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setShowsVerticalScrollIndicator:", 0);

    -[ICDocCamViewController filterScrollView](self, "filterScrollView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setShowsHorizontalScrollIndicator:", 0);

    -[ICDocCamViewController filterScrollView](self, "filterScrollView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDelegate:", self);

    -[ICDocCamViewController filterScrollView](self, "filterScrollView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setClipsToBounds:", 1);

    v21 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[ICDocCamViewController setFilterButtons:](self, "setFilterButtons:", v21);

    v22 = 0;
    v23 = *MEMORY[0x24BDF7888];
    while (1)
    {
      -[ICDocCamViewController filterNames](self, "filterNames");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "count");

      if (v25 <= v22)
        break;
      objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 14.0, v23);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "titleLabel");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setFont:", v27);

      objc_msgSend(v26, "addTarget:action:forControlEvents:", self, sel_filterButtonChoiceAction_, 64);
      -[ICDocCamViewController filterNames](self, "filterNames");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectAtIndexedSubscript:", v22);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setTag:", +[ICDocCamImageFilters imageFilterTypeFromName:](ICDocCamImageFilters, "imageFilterTypeFromName:", v30));

      -[ICDocCamViewController filterNames](self, "filterNames");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectAtIndexedSubscript:", v22);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setTitle:forState:", v32, 0);

      objc_msgSend(v26, "sizeToFit");
      objc_msgSend(v26, "_accessibilitySetInterfaceStyleIntent:", 2);
      -[ICDocCamViewController filterButtons](self, "filterButtons");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v26);

      -[ICDocCamViewController filterScrollView](self, "filterScrollView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addSubview:", v26);

      objc_msgSend(v26, "_accessibilitySetIsSpeakThisElement:", 1);
      ++v22;
    }
  }
  -[ICDocCamViewController updateFilterChoiceButtonSelection:](self, "updateFilterChoiceButtonSelection:", -[ICDocCamViewController defaultFilter](self, "defaultFilter"));
}

- (void)updateFilterChoiceButtonSelection:(signed __int16)a3
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  int v17;

  v4 = 0;
  v5 = a3;
  v6 = MEMORY[0x24BDAC760];
  v7 = MEMORY[0x24BDAC9B8];
  while (1)
  {
    -[ICDocCamViewController filterButtons](self, "filterButtons");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9 <= v4)
      break;
    -[ICDocCamViewController filterButtons](self, "filterButtons");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "tag");

    if (v12 == v5)
      -[ICDocCamViewController cameraHighlightColor](self, "cameraHighlightColor");
    else
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController filterButtons](self, "filterButtons");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTintColor:", v13);

    v16[0] = v6;
    v16[1] = 3221225472;
    v16[2] = __60__ICDocCamViewController_updateFilterChoiceButtonSelection___block_invoke;
    v16[3] = &unk_24C5B8AD8;
    v16[4] = self;
    v17 = v4;
    dispatch_async(v7, v16);
    ++v4;
  }
}

void __60__ICDocCamViewController_updateFilterChoiceButtonSelection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "filterButtons");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", *(int *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsDisplay");

  objc_msgSend(*(id *)(a1 + 32), "filterButtons");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", *(int *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "forceDisplayIfNeeded");

}

- (void)hideFilterSettingUI
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[6];
  _QWORD v12[5];
  _QWORD v13[5];

  if (-[ICDocCamViewController filterSettingUIShowing](self, "filterSettingUIShowing"))
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceIdiom");

    if (v4)
    {
      -[ICDocCamViewController view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "layoutIfNeeded");

      -[ICDocCamViewController updateFilterChoiceButtonScrollPositionAnimated:](self, "updateFilterChoiceButtonScrollPositionAnimated:", 0);
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __45__ICDocCamViewController_hideFilterSettingUI__block_invoke_3;
      v11[3] = &unk_24C5B8B00;
      v11[4] = self;
      v11[5] = 0x4046000000000000;
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __45__ICDocCamViewController_hideFilterSettingUI__block_invoke_4;
      v10[3] = &unk_24C5B8A68;
      v10[4] = self;
      objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v11, v10, 0.25);
    }
    else
    {
      -[ICDocCamViewController topToolbarForIPhone](self, "topToolbarForIPhone");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAlpha:", 0.0);

      -[ICDocCamViewController topToolbarForIPhone](self, "topToolbarForIPhone");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHidden:", 0);

      -[ICDocCamViewController filterViewContainer](self, "filterViewContainer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAlpha:", 1.0);

      -[ICDocCamViewController filterViewContainer](self, "filterViewContainer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHidden:", 0);

      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __45__ICDocCamViewController_hideFilterSettingUI__block_invoke;
      v13[3] = &unk_24C5B89B0;
      v13[4] = self;
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __45__ICDocCamViewController_hideFilterSettingUI__block_invoke_2;
      v12[3] = &unk_24C5B8A68;
      v12[4] = self;
      objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v13, v12, 0.5);
    }
  }
}

void __45__ICDocCamViewController_hideFilterSettingUI__block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "topToolbarForIPhone");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "filterViewContainer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

}

uint64_t __45__ICDocCamViewController_hideFilterSettingUI__block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "filterViewContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 1);

  objc_msgSend(*(id *)(a1 + 32), "setFilterSettingUIShowing:", 0);
  objc_msgSend(*(id *)(a1 + 32), "updateFilterChoiceButtonScrollPositionAnimated:", 0);
  objc_msgSend(*(id *)(a1 + 32), "updateAccessibilityForCurrentFilter");
  return objc_msgSend(*(id *)(a1 + 32), "updateAccessibilityFocusForHidingFilterSettingsUI");
}

void __45__ICDocCamViewController_hideFilterSettingUI__block_invoke_3(uint64_t a1)
{
  double v2;
  id v3;
  id v4;

  v2 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "filterViewContainerWidthConstraint");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConstant:", v2);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

}

uint64_t __45__ICDocCamViewController_hideFilterSettingUI__block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFilterSettingUIShowing:", 0);
  objc_msgSend(*(id *)(a1 + 32), "updateAccessibilityForCurrentFilter");
  return objc_msgSend(*(id *)(a1 + 32), "updateAccessibilityFocusForHidingFilterSettingsUI");
}

- (void)setUpFilterScrollView
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  unint64_t v15;
  double v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  unint64_t v32;
  double v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  unint64_t v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  id v55;
  void *v56;
  void *v57;
  double v58;
  void *v59;
  void *v60;
  double v61;
  void *v62;
  void *v63;
  double v64;
  void *v65;
  void *v66;
  id v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  id v73;
  void *v74;
  void *v75;
  double v76;
  void *v77;
  double v78;
  void *v79;
  void *v80;
  _QWORD v81[4];
  _QWORD v82[5];

  v82[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = 20.0;
  v6 = 22.0;
  if (!v4)
  {
    v6 = 8.0;
    if ((unint64_t)(-[ICDocCamViewController statusBarOrientation](self, "statusBarOrientation") - 1) <= 1)
    {
      -[ICDocCamViewController filterScrollViewContentWidthWithInterItemSpacing:startPadding:endPadding:](self, "filterScrollViewContentWidthWithInterItemSpacing:startPadding:endPadding:", 20.0, 10.0, 0.0);
      v8 = v7;
      -[ICDocCamViewController filterViewButton](self, "filterViewButton");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "frame");
      v11 = v10;

      -[ICDocCamViewController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bounds");
      v14 = v13 + -12.0 - (v8 + v11 + 4.0);

      v5 = 20.0;
      if (v14 > 0.0)
      {
        v15 = 0;
        v16 = 0.0;
        while (1)
        {
          -[ICDocCamViewController filterButtons](self, "filterButtons");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "count");

          if (v18 <= v15)
            break;
          -[ICDocCamViewController filterButtons](self, "filterButtons");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectAtIndexedSubscript:", v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "frame");
          v16 = v16 + v21;

          ++v15;
        }
        -[ICDocCamViewController filterScrollView](self, "filterScrollView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "bounds");
        v24 = v23;
        -[ICDocCamViewController filterButtons](self, "filterButtons");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = (v24 + -12.0 + -10.0 - v16) / (double)(unint64_t)(objc_msgSend(v25, "count") - 1);

      }
    }
  }
  -[ICDocCamViewController filterScrollViewContentWidthWithInterItemSpacing:startPadding:endPadding:](self, "filterScrollViewContentWidthWithInterItemSpacing:startPadding:endPadding:", v5, 10.0, v6);
  v27 = v26;
  -[ICDocCamViewController filterScrollView](self, "filterScrollView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bounds");
  v30 = v29;
  -[ICDocCamViewController filterScrollView](self, "filterScrollView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setContentSize:", v27, v30);

  v32 = 0;
  v33 = 10.0;
  while (1)
  {
    -[ICDocCamViewController filterButtons](self, "filterButtons");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "count");

    if (v35 <= v32)
      break;
    -[ICDocCamViewController filterButtons](self, "filterButtons");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectAtIndexedSubscript:", v32);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v37, "frame");
    v39 = v38;
    -[ICDocCamViewController filterScrollView](self, "filterScrollView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "bounds");
    objc_msgSend(v37, "setFrame:", v33, 0.0, v39);

    -[ICDocCamViewController filterNames](self, "filterNames");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "count") - 1;

    if (v42 <= v32)
      v43 = v6;
    else
      v43 = v5;
    v33 = v33 + v39 + v43;

    ++v32;
  }
  objc_msgSend(MEMORY[0x24BDE56B8], "layer");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController filterScrollViewContainer](self, "filterScrollViewContainer");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "bounds");
  objc_msgSend(v44, "setFrame:");

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "userInterfaceIdiom");

  v48 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
  if (v47)
  {
    v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v50 = objc_msgSend(v49, "CGColor");
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
    v51 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v52 = objc_msgSend(v51, "CGColor");
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
    v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v54 = objc_msgSend(v53, "CGColor");
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
    v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v48, "arrayWithObjects:", v50, v52, v54, objc_msgSend(v55, "CGColor"), 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setColors:", v56);

    v57 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v44, "frame");
    objc_msgSend(v57, "numberWithDouble:", 8.0 / v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v81[0] = v59;
    v60 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v44, "frame");
    objc_msgSend(v60, "numberWithDouble:", 16.0 / v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v81[1] = v62;
    v63 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v44, "frame");
    objc_msgSend(v63, "numberWithDouble:", -12.0 / v64 + 1.0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v81[2] = v65;
    v81[3] = &unk_24C5D8280;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v81, 4);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setLocations:", v66);

  }
  else
  {
    v67 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v68 = objc_msgSend(v67, "CGColor");
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
    v69 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v70 = objc_msgSend(v69, "CGColor");
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
    v71 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v72 = objc_msgSend(v71, "CGColor");
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
    v73 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v48, "arrayWithObjects:", v68, v70, v72, objc_msgSend(v73, "CGColor"), 0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setColors:", v74);

    v82[0] = &unk_24C5D82B0;
    v75 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v44, "frame");
    objc_msgSend(v75, "numberWithDouble:", 8.0 / v76);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v82[1] = v59;
    v77 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v44, "frame");
    objc_msgSend(v77, "numberWithDouble:", -8.0 / v78 + 1.0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v82[2] = v62;
    v82[3] = &unk_24C5D8280;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v82, 4);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setLocations:", v65);
  }

  objc_msgSend(v44, "setStartPoint:", 0.0, 0.5);
  objc_msgSend(v44, "setEndPoint:", 1.0, 0.5);
  -[ICDocCamViewController filterScrollViewContainer](self, "filterScrollViewContainer");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "layer");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setMask:", v44);

}

- (void)updateFilterButtonTint
{
  unint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD block[4];
  id v14;

  v3 = 0;
  v4 = MEMORY[0x24BDAC760];
  v5 = MEMORY[0x24BDAC9B8];
  while (1)
  {
    -[ICDocCamViewController filterButtons](self, "filterButtons");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7 <= v3)
      break;
    -[ICDocCamViewController filterButtons](self, "filterButtons");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "tag");
    if (v10 == -[ICDocCamViewController defaultFilter](self, "defaultFilter"))
      -[ICDocCamViewController cameraHighlightColor](self, "cameraHighlightColor");
    else
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTintColor:", v11);

    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __48__ICDocCamViewController_updateFilterButtonTint__block_invoke;
    block[3] = &unk_24C5B89B0;
    v14 = v9;
    v12 = v9;
    dispatch_async(v5, block);

    ++v3;
  }
}

uint64_t __48__ICDocCamViewController_updateFilterButtonTint__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsDisplay");
}

- (void)updateFilterAndFlashButtons
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;

  if ((DCDebugInterfaceEnabled() & 1) != 0
    || (objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"),
        v28 = (id)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v28, "userInterfaceIdiom"),
        v28,
        v3 == 1))
  {
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.5);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = objc_msgSend(v4, "CGColor");
    -[ICDocCamViewController flashSettingView](self, "flashSettingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBorderColor:", v5);

    -[ICDocCamViewController flashSettingView](self, "flashSettingView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBorderWidth:", 0.0);

    -[ICDocCamViewController flashSettingView](self, "flashSettingView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v12 = v11;
    -[ICDocCamViewController flashSettingView](self, "flashSettingView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCornerRadius:", v12 * 0.5);

    -[ICDocCamViewController flashSettingView](self, "flashSettingView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v29);

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v16, "CGColor");
    -[ICDocCamViewController filterViewContainer](self, "filterViewContainer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBorderColor:", v17);

    -[ICDocCamViewController filterViewContainer](self, "filterViewContainer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBorderWidth:", 0.0);

    -[ICDocCamViewController filterViewContainer](self, "filterViewContainer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "frame");
    v24 = v23;
    -[ICDocCamViewController filterViewContainer](self, "filterViewContainer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setCornerRadius:", v24 * 0.5);

    -[ICDocCamViewController filterViewContainer](self, "filterViewContainer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setBackgroundColor:", v29);

  }
}

- (id)flashMenuButtonSizes
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__ICDocCamViewController_flashMenuButtonSizes__block_invoke;
  block[3] = &unk_24C5B89B0;
  block[4] = self;
  if (-[ICDocCamViewController flashMenuButtonSizes]::onceToken != -1)
    dispatch_once(&-[ICDocCamViewController flashMenuButtonSizes]::onceToken, block);
  return (id)-[ICDocCamViewController flashMenuButtonSizes]::buttonSizeDictionary;
}

void __46__ICDocCamViewController_flashMenuButtonSizes__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "flashSettingViewAutoButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sizeToFit");

  objc_msgSend(*(id *)(a1 + 32), "flashSettingViewOnButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeToFit");

  objc_msgSend(*(id *)(a1 + 32), "flashSettingViewOffButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeToFit");

  v22[0] = CFSTR("Auto");
  v5 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(*(id *)(a1 + 32), "flashSettingViewAutoButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  objc_msgSend(v5, "valueWithCGSize:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v9;
  v22[1] = CFSTR("On");
  v10 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(*(id *)(a1 + 32), "flashSettingViewOnButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  objc_msgSend(v10, "valueWithCGSize:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v14;
  v22[2] = CFSTR("Off");
  v15 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(*(id *)(a1 + 32), "flashSettingViewOffButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  objc_msgSend(v15, "valueWithCGSize:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)-[ICDocCamViewController flashMenuButtonSizes]::buttonSizeDictionary;
  -[ICDocCamViewController flashMenuButtonSizes]::buttonSizeDictionary = v20;

}

- (double)flashSettingViewWidthForIPad
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;

  -[ICDocCamViewController flashMenuButtonSizes](self, "flashMenuButtonSizes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("Auto"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CGSizeValue");
  v5 = v4;
  objc_msgSend(v2, "objectForKey:", CFSTR("On"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "CGSizeValue");
  v8 = v7;
  objc_msgSend(v2, "objectForKey:", CFSTR("Off"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "CGSizeValue");
  v11 = v5 + 0.0 + v8 + v10 + 72.0;

  return v11;
}

- (void)flashMoveCloserFeedback
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__ICDocCamViewController_flashMoveCloserFeedback__block_invoke;
  block[3] = &unk_24C5B89B0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __49__ICDocCamViewController_flashMoveCloserFeedback__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "moveCameraCloserView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("opacity"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBeginTime:", CACurrentMediaTime());
    objc_msgSend(v13, "setDuration:", 2.0);
    objc_msgSend(v13, "setKeyTimes:", &unk_24C5D8578);
    objc_msgSend(v13, "setValues:", &unk_24C5D8590);
    objc_msgSend(v13, "setRemovedOnCompletion:", 1);
    objc_msgSend(v13, "setFillMode:", *MEMORY[0x24BDE5978]);
    LODWORD(v4) = 1.0;
    objc_msgSend(v13, "setRepeatCount:", v4);
    objc_msgSend(*(id *)(a1 + 32), "moveCameraCloserView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAnimation:forKey:", v13, CFSTR("opacity"));

    objc_msgSend(*(id *)(a1 + 32), "moveCameraCloserView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = 0;
    objc_msgSend(v8, "setOpacity:", v9);

    objc_msgSend(*(id *)(a1 + 32), "moveCameraCloserLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v11);

  }
}

- (void)flashFilterButtonNameFeedback
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  dispatch_time_t v12;
  _QWORD block[5];

  -[ICDocCamViewController killFeedbackDisplayIncludingUserPrompts:](self, "killFeedbackDisplayIncludingUserPrompts:", 0);
  +[ICDocCamImageFilters localizedImageFilterNameForType:](ICDocCamImageFilters, "localizedImageFilterNameForType:", -[ICDocCamViewController defaultFilter](self, "defaultFilter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController filterNameFeedbackLabel](self, "filterNameFeedbackLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v3);

  objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("opacity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBeginTime:", CACurrentMediaTime());
  objc_msgSend(v5, "setDuration:", 2.0);
  objc_msgSend(v5, "setKeyTimes:", &unk_24C5D85A8);
  objc_msgSend(v5, "setValues:", &unk_24C5D85C0);
  objc_msgSend(v5, "setRemovedOnCompletion:", 1);
  objc_msgSend(v5, "setFillMode:", *MEMORY[0x24BDE5978]);
  LODWORD(v6) = 1.0;
  objc_msgSend(v5, "setRepeatCount:", v6);
  -[ICDocCamViewController filterNameFeedbackView](self, "filterNameFeedbackView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAnimation:forKey:", v5, CFSTR("filterName"));

  -[ICDocCamViewController filterNameFeedbackView](self, "filterNameFeedbackView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = 0;
  objc_msgSend(v10, "setOpacity:", v11);

  v12 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__ICDocCamViewController_flashFilterButtonNameFeedback__block_invoke;
  block[3] = &unk_24C5B89B0;
  block[4] = self;
  dispatch_after(v12, MEMORY[0x24BDAC9B8], block);

}

void __55__ICDocCamViewController_flashFilterButtonNameFeedback__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Current filter: %@"), CFSTR("Current filter: %@"), CFSTR("Localizable"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(*(id *)(a1 + 32), "filterNameFeedbackLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v6, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v5);
}

- (void)filterButtonChoiceAction:(id)a3
{
  id v4;
  dispatch_time_t v5;
  _QWORD block[5];

  v4 = a3;
  -[ICDocCamViewController setDefaultFilter:](self, "setDefaultFilter:", (__int16)objc_msgSend(v4, "tag"));
  -[ICDocCamViewController updateFilterChoiceButtonSelection:](self, "updateFilterChoiceButtonSelection:", -[ICDocCamViewController defaultFilter](self, "defaultFilter"));
  -[ICDocCamViewController hideFilterSettingUI](self, "hideFilterSettingUI");
  -[ICDocCamViewController flashFilterButtonNameFeedback](self, "flashFilterButtonNameFeedback");
  v5 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__ICDocCamViewController_filterButtonChoiceAction___block_invoke;
  block[3] = &unk_24C5B89B0;
  block[4] = self;
  dispatch_after(v5, MEMORY[0x24BDAC9B8], block);

}

void __51__ICDocCamViewController_filterButtonChoiceAction___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "processRequestsBlocker");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeBlockerOfType:", CFSTR("FilterSettingBlocker"));

}

- (void)updateAccessibilityFocusForHidingFilterSettingsUI
{
  void *v3;
  id argument;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceIdiom"))
    -[ICDocCamViewController filterButton](self, "filterButton");
  else
    -[ICDocCamViewController filterButtonForIPhone](self, "filterButtonForIPhone");
  argument = (id)objc_claimAutoreleasedReturnValue();

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], argument);
}

- (void)updateAccessibilityFocusForHidingFlashSettingsUI
{
  void *v3;
  id argument;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceIdiom"))
    -[ICDocCamViewController flashButton](self, "flashButton");
  else
    -[ICDocCamViewController flashButtonForIPhone](self, "flashButtonForIPhone");
  argument = (id)objc_claimAutoreleasedReturnValue();

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], argument);
}

- (void)updateFilterChoiceButtonScrollPositionAnimated:(BOOL)a3
{
  _BOOL8 v3;
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  CGRect v27;

  v3 = a3;
  v5 = 0;
  v7 = *MEMORY[0x24BDBF090];
  v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v9 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
  while (1)
  {
    -[ICDocCamViewController filterButtons](self, "filterButtons");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11 <= v5)
      break;
    -[ICDocCamViewController filterButtons](self, "filterButtons");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "tag");
    if (v14 == -[ICDocCamViewController defaultFilter](self, "defaultFilter"))
    {
      objc_msgSend(v13, "frame");
      v6 = v15;
      v8 = v16;
      v7 = v17 + -16.0;
      v9 = v18 + 32.0;

      break;
    }

    ++v5;
  }
  v27.origin.x = v7;
  v27.origin.y = v6;
  v27.size.width = v9;
  v27.size.height = v8;
  if (CGRectIsEmpty(v27))
  {
    v19 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[ICDocCamViewController updateFilterChoiceButtonScrollPositionAnimated:].cold.1();

    -[ICDocCamViewController filterButtons](self, "filterButtons");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "frame");
    v7 = v22;
    v6 = v23;
    v9 = v24;
    v8 = v25;

  }
  -[ICDocCamViewController filterScrollView](self, "filterScrollView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "scrollRectToVisible:animated:", v3, v7, v6, v9, v8);

}

- (id)filterButtonImage
{
  void *v3;
  void *v4;
  int v5;
  void *v6;

  if ((unint64_t)(-[ICDocCamViewController statusBarOrientation](self, "statusBarOrientation") - 3) <= 1
    && (-[ICDocCamViewController view](self, "view"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "window"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "dc_requiresCompactLandscapeIcons"),
        v4,
        v3,
        v5))
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("camera.filters"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "dc_largeSystemImageNamed:", CFSTR("camera.filters"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)flashButtonImage
{
  unint64_t v3;
  __CFString *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = -[ICDocCamViewController flashMode](self, "flashMode");
  if (v3 > 2)
    v4 = 0;
  else
    v4 = off_24C5B8EF8[v3];
  if ((unint64_t)(-[ICDocCamViewController statusBarOrientation](self, "statusBarOrientation") - 3) <= 1
    && (-[ICDocCamViewController view](self, "view"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "window"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "dc_requiresCompactLandscapeIcons"),
        v6,
        v5,
        v7))
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "dc_largeSystemImageNamed:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (void)myApplicationWillResignActive:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[ICDocCamViewController physicalCaptureRecognizer](self, "physicalCaptureRecognizer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 0);

  -[ICDocCamViewController physicalCaptureNotifier](self, "physicalCaptureNotifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 0);

  -[ICDocCamViewController processRequestsBlocker](self, "processRequestsBlocker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addBlockerOfType:clearRectangles:clearQueue:", CFSTR("ApplicationActiveBlocker"), 1, 1);

  -[ICDocCamViewController dismissFilterAndFlashUI](self, "dismissFilterAndFlashUI");
}

- (void)myApplicationDidBecomeActive:(id)a3
{
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;

  -[ICDocCamViewController clearRectangles](self, "clearRectangles", a3);
  -[ICDocCamViewController clearQueue](self, "clearQueue");
  -[ICDocCamViewController processRequestsBlocker](self, "processRequestsBlocker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeBlockerOfType:", CFSTR("ApplicationActiveBlocker"));

  v5 = -[ICDocCamViewController isSessionRunning](self, "isSessionRunning");
  if (v5)
    -[ICDocCamViewController enableShutterButtonIfPossible](self, "enableShutterButtonIfPossible");
  else
    -[ICDocCamViewController enableShutter:](self, "enableShutter:", 0);
  -[ICDocCamViewController enableUIElements:](self, "enableUIElements:", v5);
  -[ICDocCamViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isKeyWindow");

  if (v8)
  {
    -[ICDocCamViewController physicalCaptureRecognizer](self, "physicalCaptureRecognizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEnabled:", 1);

    -[ICDocCamViewController physicalCaptureNotifier](self, "physicalCaptureNotifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEnabled:", 1);

  }
  -[ICDocCamViewController logAlgoChoice](self, "logAlgoChoice");
}

- (void)removeAllNotifications
{
  NSObject *sessionQueue;
  uint64_t v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  _QWORD block[5];

  sessionQueue = self->_sessionQueue;
  v4 = MEMORY[0x24BDAC760];
  if (sessionQueue)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__ICDocCamViewController_removeAllNotifications__block_invoke;
    block[3] = &unk_24C5B89B0;
    block[4] = self;
    dispatch_sync(sessionQueue, block);
  }
  if (-[ICDocCamViewController didAddAppLifetimeObservers](self, "didAddAppLifetimeObservers"))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BDF75D8], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x24BDF7510], 0);

    -[ICDocCamViewController setDidAddAppLifetimeObservers:](self, "setDidAddAppLifetimeObservers:", 0);
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:", self);

  if (self->_sessionQueue)
  {
    -[ICDocCamViewController sessionQueue](self, "sessionQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __48__ICDocCamViewController_removeAllNotifications__block_invoke_2;
    v10[3] = &unk_24C5B89B0;
    v10[4] = self;
    dispatch_sync(v5, v10);

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:name:object:", self, *MEMORY[0x24BDF7670], 0);

}

uint64_t __48__ICDocCamViewController_removeAllNotifications__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObserversIfNecessary");
}

void __48__ICDocCamViewController_removeAllNotifications__block_invoke_2(uint64_t a1)
{
  int v2;
  id v3;
  id v4;
  id v5;

  if (!objc_msgSend(*(id *)(a1 + 32), "setupResult"))
  {
    objc_msgSend(*(id *)(a1 + 32), "session");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "isRunning");

    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 32), "session");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stopRunning");

      objc_msgSend(*(id *)(a1 + 32), "session");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setSessionRunning:", objc_msgSend(v5, "isRunning"));

    }
  }
}

- (void)addObserversIfNecessary
{
  void *v3;
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
  void *v14;

  if (!-[ICDocCamViewController isObservingCaptureSession](self, "isObservingCaptureSession"))
  {
    -[ICDocCamViewController session](self, "session");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("running"), 1, SessionRunningContext);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController videoDeviceInput](self, "videoDeviceInput");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_subjectAreaDidChange_, *MEMORY[0x24BDB1A18], v6);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController session](self, "session");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_sessionRuntimeError_, *MEMORY[0x24BDB1B58], v8);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController session](self, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_sessionWasInterrupted_, *MEMORY[0x24BDB1B68], v10);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController session](self, "session");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_sessionInterruptionEnded_, *MEMORY[0x24BDB1AE0], v12);

    -[ICDocCamViewController videoDeviceInput](self, "videoDeviceInput");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "device");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:forKeyPath:options:context:", self, CFSTR("adjustingFocus"), 1, 0);

    -[ICDocCamViewController setIsObservingCaptureSession:](self, "setIsObservingCaptureSession:", 1);
  }
}

- (void)removeObserversIfNecessary
{
  void *v3;
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
  void *v14;

  if (-[ICDocCamViewController isObservingCaptureSession](self, "isObservingCaptureSession"))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController videoDeviceInput](self, "videoDeviceInput");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDB1A18], v5);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController session](self, "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BDB1B58], v7);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController session](self, "session");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:name:object:", self, *MEMORY[0x24BDB1B68], v9);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController session](self, "session");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObserver:name:object:", self, *MEMORY[0x24BDB1AE0], v11);

    -[ICDocCamViewController session](self, "session");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObserver:forKeyPath:context:", self, CFSTR("running"), SessionRunningContext);

    -[ICDocCamViewController videoDeviceInput](self, "videoDeviceInput");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "device");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObserver:forKeyPath:", self, CFSTR("adjustingFocus"));

    -[ICDocCamViewController setIsObservingCaptureSession:](self, "setIsObservingCaptureSession:", 0);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  int v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  const __CFString *v27;
  NSObject *v28;
  const __CFString *v29;
  NSObject *v30;
  void *v31;
  __CFString *v32;
  void *v33;
  objc_super v34;
  _QWORD block[5];
  char v36;
  char v37;
  uint8_t buf[4];
  const __CFString *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("adjustingFocus")))
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController setAdjustingFocus:](self, "setAdjustingFocus:", objc_msgSend(v13, "isEqualToNumber:", v14));

  }
  else if ((void *)SessionRunningContext == a6)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    -[ICDocCamViewController processRequestsBlocker](self, "processRequestsBlocker");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "blocked"))
    {
      -[ICDocCamViewController processRequestsBlocker](self, "processRequestsBlocker");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "blockerSet");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "count") == 1)
      {
        -[ICDocCamViewController processRequestsBlocker](self, "processRequestsBlocker");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "blockerSet");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "member:", CFSTR("OrientationBlocker"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21 == 0;

      }
      else
      {
        v22 = 1;
      }

    }
    else
    {
      v22 = 0;
    }

    v23 = 0;
    if ((_DWORD)v16 && !v22)
    {
      -[ICDocCamViewController snapStillImageBlocker](self, "snapStillImageBlocker");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v24, "blocked") ^ 1;

    }
    -[ICDocCamViewController setSessionRunning:](self, "setSessionRunning:", v16);
    v25 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20CE8E000, v25, OS_LOG_TYPE_DEFAULT, "observeValueForKeyPath(SessionRunningContext)", buf, 2u);
    }

    v26 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = CFSTR("NO");
      if ((_DWORD)v16)
        v27 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v39 = v27;
      _os_log_impl(&dword_20CE8E000, v26, OS_LOG_TYPE_DEFAULT, "  isSessionRunning: %@", buf, 0xCu);
    }

    v28 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = CFSTR("NO");
      if (v23)
        v29 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v39 = v29;
      _os_log_impl(&dword_20CE8E000, v28, OS_LOG_TYPE_DEFAULT, "  enableUI        : %@", buf, 0xCu);
    }

    if ((v23 & 1) == 0)
    {
      v30 = os_log_create("com.apple.documentcamera", ");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        -[ICDocCamViewController processRequestsBlocker](self, "processRequestsBlocker");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "blockerSet");
        v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v39 = v32;
        _os_log_impl(&dword_20CE8E000, v30, OS_LOG_TYPE_DEFAULT, "  procReqBlockers : %@", buf, 0xCu);

      }
    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __73__ICDocCamViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_24C5B8B28;
    v36 = v16;
    block[4] = self;
    v37 = v23;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  else
  {
    v34.receiver = self;
    v34.super_class = (Class)ICDocCamViewController;
    -[ICDocCamViewController observeValueForKeyPath:ofObject:change:context:](&v34, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

void __73__ICDocCamViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  float v5;
  int v6;
  void *v7;
  void (**v8)(void);
  _QWORD v9[5];

  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "flashFilterButtonNameFeedback");
  v2 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 41))
    objc_msgSend(v2, "enableShutterButtonIfPossible");
  else
    objc_msgSend(v2, "enableShutter:", 0);
  objc_msgSend(*(id *)(a1 + 32), "enableUIElements:", *(unsigned __int8 *)(a1 + 41));
  objc_msgSend(*(id *)(a1 + 32), "previewView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "opacity");
  if (v5 == 0.0)
  {
    v6 = *(unsigned __int8 *)(a1 + 40);

    if (v6)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __73__ICDocCamViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
      v9[3] = &unk_24C5B89B0;
      v9[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v9, 0.25);
    }
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 32), "sessionStartNotificationBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionStartNotificationBlock");
    v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v8[2]();

    objc_msgSend(*(id *)(a1 + 32), "setSessionStartNotificationBlock:", 0);
  }
}

void __73__ICDocCamViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  void *v1;
  double v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "previewView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = 1.0;
  objc_msgSend(v1, "setOpacity:", v2);

}

- (void)subjectAreaDidChange:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDBCE60], "date", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController setLastSubjectAreaChange:](self, "setLastSubjectAreaChange:");

}

- (void)sessionRuntimeError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  _QWORD block[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDB1AD8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = os_log_create("com.apple.documentcamera", ");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v6;
    _os_log_impl(&dword_20CE8E000, v7, OS_LOG_TYPE_DEFAULT, "Capture session runtime error: %@", buf, 0xCu);
  }

  if (objc_msgSend(v6, "code") == -11819)
  {
    -[ICDocCamViewController sessionQueue](self, "sessionQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__ICDocCamViewController_sessionRuntimeError___block_invoke;
    block[3] = &unk_24C5B89B0;
    block[4] = self;
    dispatch_async(v8, block);

  }
  else
  {
    -[ICDocCamViewController resumeButton](self, "resumeButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 0);

  }
}

void __46__ICDocCamViewController_sessionRuntimeError___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  _QWORD block[5];

  if (objc_msgSend(*(id *)(a1 + 32), "isSessionRunning"))
  {
    objc_msgSend(*(id *)(a1 + 32), "session");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "startRunning");

    objc_msgSend(*(id *)(a1 + 32), "session");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setSessionRunning:", objc_msgSend(v3, "isRunning"));

  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__ICDocCamViewController_sessionRuntimeError___block_invoke_2;
    block[3] = &unk_24C5B89B0;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

void __46__ICDocCamViewController_sessionRuntimeError___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "resumeButton");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHidden:", 0);

}

- (void)hideUIForInterruptedSession:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];

  v3 = a3;
  if ((DCDebugInterfaceEnabled() & 1) != 0
    || (objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "userInterfaceIdiom"),
        v5,
        v6 == 1))
  {
    if (v3)
    {
      -[ICDocCamViewController enableShutter:](self, "enableShutter:", 0);
      -[ICDocCamViewController flashButton](self, "flashButton");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setEnabled:", 0);

      -[ICDocCamViewController filterButton](self, "filterButton");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setEnabled:", 0);

      -[ICDocCamViewController autoButton](self, "autoButton");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setEnabled:", 0);

      -[ICDocCamViewController manualButton](self, "manualButton");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setEnabled:", 0);

      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __54__ICDocCamViewController_hideUIForInterruptedSession___block_invoke;
      v17[3] = &unk_24C5B89B0;
      v17[4] = self;
      objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v17, 0.25);
    }
    else
    {
      -[ICDocCamViewController flashButton](self, "flashButton");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setEnabled:", 1);

      -[ICDocCamViewController filterButton](self, "filterButton");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setEnabled:", 1);

      -[ICDocCamViewController autoButton](self, "autoButton");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setEnabled:", 1);

      -[ICDocCamViewController manualButton](self, "manualButton");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setEnabled:", 1);

      v15[4] = self;
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __54__ICDocCamViewController_hideUIForInterruptedSession___block_invoke_2;
      v16[3] = &unk_24C5B89B0;
      v16[4] = self;
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __54__ICDocCamViewController_hideUIForInterruptedSession___block_invoke_3;
      v15[3] = &unk_24C5B8A68;
      objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v16, v15, 0.25);
    }
  }
}

void __54__ICDocCamViewController_hideUIForInterruptedSession___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "hideShutter:", 1);
  objc_msgSend(*(id *)(a1 + 32), "flashButton");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "filterButton");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "userPromptView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "autoButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "manualButton");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "filterViewContainer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "flashSettingView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", 0.0);

}

void __54__ICDocCamViewController_hideUIForInterruptedSession___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "hideShutter:", 0);
  objc_msgSend(*(id *)(a1 + 32), "flashButton");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "filterButton");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "userPromptView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "autoButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "manualButton");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "filterViewContainer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "flashSettingView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", 1.0);

}

uint64_t __54__ICDocCamViewController_hideUIForInterruptedSession___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enableShutter:", 1);
}

- (void)sessionWasInterrupted:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];
  uint8_t buf[4];
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDB1AE8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if ((unint64_t)(v6 - 1) >= 4)
    v7 = CFSTR("Unknown");
  else
    v7 = off_24C5B8F10[v6 - 1];
  v8 = os_log_create("com.apple.documentcamera", ");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v7;
    _os_log_impl(&dword_20CE8E000, v8, OS_LOG_TYPE_DEFAULT, "Capture session was interrupted with reason %@", buf, 0xCu);
  }

  -[ICDocCamViewController dismissFilterAndFlashUI](self, "dismissFilterAndFlashUI");
  -[ICDocCamViewController hideUIForInterruptedSession:](self, "hideUIForInterruptedSession:", 1);
  if (v6 != 1)
  {
    if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      -[ICDocCamViewController resumeButton](self, "resumeButton");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAlpha:", 0.0);

      -[ICDocCamViewController resumeButton](self, "resumeButton");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setHidden:", 0);

      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __48__ICDocCamViewController_sessionWasInterrupted___block_invoke;
      v16[3] = &unk_24C5B89B0;
      v16[4] = self;
      objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v16, 0.25);
    }
    else if (v6 == 4)
    {
      -[ICDocCamViewController userPromptView](self, "userPromptView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setHidden:", 1);

      -[ICDocCamViewController cameraUnavailableScrim](self, "cameraUnavailableScrim");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAlpha:", 0.0);

      -[ICDocCamViewController cameraUnavailableScrim](self, "cameraUnavailableScrim");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setHidden:", 0);

      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __48__ICDocCamViewController_sessionWasInterrupted___block_invoke_2;
      v15[3] = &unk_24C5B89B0;
      v15[4] = self;
      objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v15, 0.25);
      -[ICDocCamViewController cameraUnavailableLabel](self, "cameraUnavailableLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController speakLabelTextForAccessibilityIfNecessary:afterDelay:](self, "speakLabelTextForAccessibilityIfNecessary:afterDelay:", v14, 1.0);

    }
  }
}

void __48__ICDocCamViewController_sessionWasInterrupted___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "resumeButton");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __48__ICDocCamViewController_sessionWasInterrupted___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "cameraUnavailableScrim");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)sessionInterruptionEnded:(id)a3
{
  NSObject *v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  uint8_t buf[16];

  v4 = os_log_create("com.apple.documentcamera", ");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20CE8E000, v4, OS_LOG_TYPE_DEFAULT, "Capture session interruption ended", buf, 2u);
  }

  -[ICDocCamViewController resumeButton](self, "resumeButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isHidden");

  if ((v6 & 1) == 0)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __51__ICDocCamViewController_sessionInterruptionEnded___block_invoke;
    v12[3] = &unk_24C5B89B0;
    v12[4] = self;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __51__ICDocCamViewController_sessionInterruptionEnded___block_invoke_2;
    v11[3] = &unk_24C5B8A68;
    v11[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v12, v11, 0.25);
  }
  -[ICDocCamViewController cameraUnavailableScrim](self, "cameraUnavailableScrim");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isHidden");

  if ((v8 & 1) == 0)
  {
    v9[4] = self;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __51__ICDocCamViewController_sessionInterruptionEnded___block_invoke_3;
    v10[3] = &unk_24C5B89B0;
    v10[4] = self;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __51__ICDocCamViewController_sessionInterruptionEnded___block_invoke_4;
    v9[3] = &unk_24C5B8A68;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v10, v9, 0.25);
  }
  -[ICDocCamViewController hideUIForInterruptedSession:](self, "hideUIForInterruptedSession:", 0);
}

void __51__ICDocCamViewController_sessionInterruptionEnded___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "resumeButton");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __51__ICDocCamViewController_sessionInterruptionEnded___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "resumeButton");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHidden:", 1);

}

void __51__ICDocCamViewController_sessionInterruptionEnded___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "cameraUnavailableScrim");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __51__ICDocCamViewController_sessionInterruptionEnded___block_invoke_4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "cameraUnavailableScrim");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHidden:", 1);

}

- (void)resumeInterruptedSession:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[ICDocCamViewController sessionQueue](self, "sessionQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__ICDocCamViewController_resumeInterruptedSession___block_invoke;
  block[3] = &unk_24C5B89B0;
  block[4] = self;
  dispatch_async(v4, block);

}

void __51__ICDocCamViewController_resumeInterruptedSession___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void (*v6)(uint64_t);
  uint64_t *p_block;
  uint64_t v8;
  uint64_t block;

  objc_msgSend(*(id *)(a1 + 32), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startRunning");

  objc_msgSend(*(id *)(a1 + 32), "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSessionRunning:", objc_msgSend(v3, "isRunning"));

  objc_msgSend(*(id *)(a1 + 32), "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isRunning");

  if ((v5 & 1) != 0)
  {
    v8 = MEMORY[0x24BDAC760];
    v6 = __51__ICDocCamViewController_resumeInterruptedSession___block_invoke_3;
    p_block = &v8;
  }
  else
  {
    block = MEMORY[0x24BDAC760];
    v6 = __51__ICDocCamViewController_resumeInterruptedSession___block_invoke_2;
    p_block = &block;
  }
  p_block[1] = 3221225472;
  p_block[2] = (uint64_t)v6;
  p_block[3] = (uint64_t)&unk_24C5B89B0;
  p_block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], p_block);
}

void __51__ICDocCamViewController_resumeInterruptedSession___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Unable to resume"), CFSTR("Unable to resume"), CFSTR("Localizable"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x24BDF67F0];
  DCAppName();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alertControllerWithTitle:message:preferredStyle:", v3, v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("exclamationmark.triangle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v5);

  v6 = (void *)MEMORY[0x24BDF67E8];
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("OK"), CFSTR("OK"), CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addAction:", v8);
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v4, 1, 0);

}

void __51__ICDocCamViewController_resumeInterruptedSession___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "resumeButton");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHidden:", 1);

}

- (id)createNSDataFrom:(id)a3 metaData:(id)a4
{
  UIImage *v5;
  id v6;
  void *v7;
  void *v8;
  const __CFData *v9;
  CGImageSource *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const __CFString *Type;
  __CFData *v24;
  CGImageDestination *v25;
  const __CFData *v27;
  void *v28;
  UIImage *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v5 = (UIImage *)a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x24BDBCE50];
  v28 = v6;
  v29 = v5;
  UIImageJPEGRepresentation(v5, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataWithData:", v8);
  v9 = (const __CFData *)objc_claimAutoreleasedReturnValue();

  v27 = v9;
  v10 = CGImageSourceCreateWithData(v9, 0);
  v11 = (void *)objc_msgSend(v6, "mutableCopy");
  v12 = *MEMORY[0x24BDD9470];
  objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BDD9470]);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x24BDD95D0];
  objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BDD95D0]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x24BDD96E8];
  objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BDD96E8]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x24BDD96D8];
  objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BDD96D8]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x24BDD9668];
  objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BDD9668]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x24BDD9598];
  objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BDD9598]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v33)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!v32)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!v31)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v30)
  {
    if (v17)
      goto LABEL_9;
LABEL_12:
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      goto LABEL_14;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
    goto LABEL_12;
LABEL_9:
  if (v19)
    goto LABEL_14;
LABEL_13:
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
  objc_msgSend(v11, "setObject:forKey:", v33, v12);
  objc_msgSend(v11, "setObject:forKey:", v32, v13);
  objc_msgSend(v11, "setObject:forKey:", v31, v14);
  objc_msgSend(v11, "setObject:forKey:", v30, v15);
  objc_msgSend(v11, "setObject:forKey:", v17, v16);
  objc_msgSend(v11, "setObject:forKey:", v19, v18);
  v20 = -[UIImage imageOrientation](v29, "imageOrientation");
  if ((unint64_t)(v20 - 1) >= 3)
    v21 = 1;
  else
    v21 = dword_20CF1B428[v20 - 1];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v22, CFSTR("Orientation"));

  objc_msgSend(v11, "removeObjectForKey:", CFSTR("Diagnostic"));
  Type = CGImageSourceGetType(v10);
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v24 = (__CFData *)objc_claimAutoreleasedReturnValue();
  v25 = CGImageDestinationCreateWithData(v24, Type, 1uLL, 0);
  CGImageDestinationAddImageFromSource(v25, v10, 0, (CFDictionaryRef)v11);
  CGImageDestinationFinalize(v25);
  CFRelease(v25);
  CFRelease(v10);

  return v24;
}

- (void)toggleAutoCapture:(id)a3
{
  id v4;
  id v5;
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[5];

  v4 = a3;
  -[ICDocCamViewController manualButton](self, "manualButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4 && !-[ICDocCamViewController autoMode](self, "autoMode"))
  {

    goto LABEL_13;
  }
  -[ICDocCamViewController autoButton](self, "autoButton");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v4)
  {
    v7 = -[ICDocCamViewController autoMode](self, "autoMode");

    if (v7)
      goto LABEL_13;
  }
  else
  {

  }
  -[ICDocCamViewController processRequestsBlocker](self, "processRequestsBlocker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addBlockerOfType:clearRectangles:clearQueue:", CFSTR("ToggleAutoModeBlocker"), 1, 1);

  -[ICDocCamViewController killFeedbackDisplayIncludingUserPrompts:](self, "killFeedbackDisplayIncludingUserPrompts:", 1);
  -[ICDocCamViewController autoButton](self, "autoButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", 0);

  -[ICDocCamViewController manualButton](self, "manualButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", 0);

  -[ICDocCamViewController autoButtonForIPhone](self, "autoButtonForIPhone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEnabled:", 0);

  -[ICDocCamViewController clearRectangles](self, "clearRectangles");
  -[ICDocCamViewController clearQueue](self, "clearQueue");
  if (-[ICDocCamViewController autoMode](self, "autoMode"))
  {
    -[ICDocCamViewController setAutoMode:](self, "setAutoMode:", 0);
    v12 = -[ICDocCamViewController autoMode](self, "autoMode");
    -[ICDocCamViewController overlayView](self, "overlayView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setShowGridAnimation:", v12);

    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "userInterfaceIdiom");

    if (!v15)
    {
      -[ICDocCamViewController updateConstraintsForIPhone](self, "updateConstraintsForIPhone");
      -[ICDocCamViewController thumbnailViewController](self, "thumbnailViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "animateLayoutChange");

    }
    -[ICDocCamViewController updateAutoButtonTitleForAutoMode:](self, "updateAutoButtonTitleForAutoMode:", 1);
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __44__ICDocCamViewController_toggleAutoCapture___block_invoke;
    v33[3] = &unk_24C5B89B0;
    v33[4] = self;
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __44__ICDocCamViewController_toggleAutoCapture___block_invoke_2;
    v32[3] = &unk_24C5B8A68;
    v32[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 0, v33, v32, 0.2, 0.0);
    objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("opacity"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBeginTime:", CACurrentMediaTime());
    objc_msgSend(v17, "setDuration:", 2.0);
    objc_msgSend(v17, "setKeyTimes:", &unk_24C5D85D8);
    objc_msgSend(v17, "setValues:", &unk_24C5D85F0);
    objc_msgSend(v17, "setRemovedOnCompletion:", 1);
    objc_msgSend(v17, "setFillMode:", *MEMORY[0x24BDE5978]);
    LODWORD(v18) = 1.0;
    objc_msgSend(v17, "setRepeatCount:", v18);
    -[ICDocCamViewController autoShutterOffView](self, "autoShutterOffView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addAnimation:forKey:", v17, CFSTR("autoOff"));

    -[ICDocCamViewController autoShutterOffView](self, "autoShutterOffView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v23) = 0;
    objc_msgSend(v22, "setOpacity:", v23);

    -[ICDocCamViewController updateAccessibilityForAutoShutterMode:](self, "updateAccessibilityForAutoShutterMode:", 0);
  }
  else
  {
    -[ICDocCamViewController setAutoMode:](self, "setAutoMode:", 1);
    -[ICDocCamViewController updateAutoButtonTitleForAutoMode:](self, "updateAutoButtonTitleForAutoMode:", 0);
    v30[4] = self;
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __44__ICDocCamViewController_toggleAutoCapture___block_invoke_3;
    v31[3] = &unk_24C5B89B0;
    v31[4] = self;
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __44__ICDocCamViewController_toggleAutoCapture___block_invoke_4;
    v30[3] = &unk_24C5B8A68;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 0, v31, v30, 0.1, 0.0);
    objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("opacity"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBeginTime:", CACurrentMediaTime());
    objc_msgSend(v17, "setDuration:", 2.0);
    objc_msgSend(v17, "setKeyTimes:", &unk_24C5D85D8);
    objc_msgSend(v17, "setValues:", &unk_24C5D85F0);
    objc_msgSend(v17, "setRemovedOnCompletion:", 1);
    objc_msgSend(v17, "setFillMode:", *MEMORY[0x24BDE5978]);
    LODWORD(v24) = 1.0;
    objc_msgSend(v17, "setRepeatCount:", v24);
    -[ICDocCamViewController autoShutterOnView](self, "autoShutterOnView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addAnimation:forKey:", v17, CFSTR("autoOn"));

    -[ICDocCamViewController autoShutterOnView](self, "autoShutterOnView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v29) = 0;
    objc_msgSend(v28, "setOpacity:", v29);

    -[ICDocCamViewController updateAccessibilityForAutoShutterMode:](self, "updateAccessibilityForAutoShutterMode:", 1);
  }

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
LABEL_13:

}

uint64_t __44__ICDocCamViewController_toggleAutoCapture___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateAutoButtonTitleForAutoMode:", 0);
}

void __44__ICDocCamViewController_toggleAutoCapture___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "clearRectangles");
  objc_msgSend(*(id *)(a1 + 32), "autoButton");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnabled:", 1);

  objc_msgSend(*(id *)(a1 + 32), "manualButton");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 1);

  objc_msgSend(*(id *)(a1 + 32), "autoButtonForIPhone");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 1);

  objc_msgSend(*(id *)(a1 + 32), "processRequestsBlocker");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeBlockerOfType:", CFSTR("ToggleAutoModeBlocker"));

}

uint64_t __44__ICDocCamViewController_toggleAutoCapture___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateAutoButtonTitleForAutoMode:", 1);
}

void __44__ICDocCamViewController_toggleAutoCapture___block_invoke_4(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "clearRectangles");
  objc_msgSend(*(id *)(a1 + 32), "autoButton");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnabled:", 1);

  objc_msgSend(*(id *)(a1 + 32), "manualButton");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 1);

  objc_msgSend(*(id *)(a1 + 32), "autoButtonForIPhone");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 1);

  objc_msgSend(*(id *)(a1 + 32), "processRequestsBlocker");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeBlockerOfType:", CFSTR("ToggleAutoModeBlocker"));

}

- (void)filterButtonCancelUI:(id)a3
{
  dispatch_time_t v4;
  _QWORD block[5];

  -[ICDocCamViewController hideFilterSettingUI](self, "hideFilterSettingUI", a3);
  v4 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__ICDocCamViewController_filterButtonCancelUI___block_invoke;
  block[3] = &unk_24C5B89B0;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x24BDAC9B8], block);
}

void __47__ICDocCamViewController_filterButtonCancelUI___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "processRequestsBlocker");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeBlockerOfType:", CFSTR("FilterSettingBlocker"));

}

- (void)filterButtonAction:(id)a3
{
  id v4;
  NSObject *v5;
  intptr_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  _QWORD v31[6];
  _QWORD v32[5];
  _QWORD v33[5];

  v4 = a3;
  if (-[ICDocCamViewController filterSettingUIShowing](self, "filterSettingUIShowing"))
  {
    -[ICDocCamViewController filterButtonCancelUI:](self, "filterButtonCancelUI:", v4);
  }
  else
  {
    -[ICDocCamViewController flashAndFilterUISemaphore](self, "flashAndFilterUISemaphore");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_semaphore_wait(v5, 0);

    if (!v6)
    {
      -[ICDocCamViewController processRequestsBlocker](self, "processRequestsBlocker");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addBlockerOfType:clearRectangles:clearQueue:", CFSTR("FilterSettingBlocker"), 1, 1);

      -[ICDocCamViewController dismissFlashUI](self, "dismissFlashUI");
      -[ICDocCamViewController userPromptView](self, "userPromptView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setHidden:", 1);

      objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "userInterfaceIdiom");

      if (v10)
      {
        -[ICDocCamViewController view](self, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "layoutIfNeeded");

        -[ICDocCamViewController setUpFilterScrollView](self, "setUpFilterScrollView");
        -[ICDocCamViewController filterScrollViewContentWidthWithInterItemSpacing:startPadding:endPadding:](self, "filterScrollViewContentWidthWithInterItemSpacing:startPadding:endPadding:", 20.0, 10.0, 22.0);
        v13 = v12;
        -[ICDocCamViewController filterScrollView](self, "filterScrollView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "contentInset");
        v16 = v15;

        objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "bounds");
        v19 = v18;
        v21 = v20;
        v22 = v13 + 44.0 + v16;

        if (v19 >= v21)
          v23 = v21;
        else
          v23 = v19;
        v24 = v23 + -66.0;
        if (v22 < v24)
          v24 = v22;
        v30[4] = self;
        v31[0] = MEMORY[0x24BDAC760];
        v31[1] = 3221225472;
        v31[2] = __45__ICDocCamViewController_filterButtonAction___block_invoke_3;
        v31[3] = &unk_24C5B8B00;
        v31[4] = self;
        *(double *)&v31[5] = v24;
        v30[0] = MEMORY[0x24BDAC760];
        v30[1] = 3221225472;
        v30[2] = __45__ICDocCamViewController_filterButtonAction___block_invoke_4;
        v30[3] = &unk_24C5B8A68;
        objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v31, v30, 0.25);
      }
      else
      {
        -[ICDocCamViewController topToolbarForIPhone](self, "topToolbarForIPhone");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setAlpha:", 1.0);

        -[ICDocCamViewController topToolbarForIPhone](self, "topToolbarForIPhone");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setHidden:", 0);

        -[ICDocCamViewController filterViewContainer](self, "filterViewContainer");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setAlpha:", 0.0);

        -[ICDocCamViewController filterViewContainer](self, "filterViewContainer");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setHidden:", 0);

        -[ICDocCamViewController view](self, "view");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "layoutIfNeeded");

        -[ICDocCamViewController setUpFilterScrollView](self, "setUpFilterScrollView");
        -[ICDocCamViewController updateFilterChoiceButtonScrollPositionAnimated:](self, "updateFilterChoiceButtonScrollPositionAnimated:", 0);
        v33[0] = MEMORY[0x24BDAC760];
        v33[1] = 3221225472;
        v33[2] = __45__ICDocCamViewController_filterButtonAction___block_invoke;
        v33[3] = &unk_24C5B89B0;
        v33[4] = self;
        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        v32[2] = __45__ICDocCamViewController_filterButtonAction___block_invoke_2;
        v32[3] = &unk_24C5B8A68;
        v32[4] = self;
        objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v33, v32, 0.25);
      }
    }
  }

}

uint64_t __45__ICDocCamViewController_filterButtonAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "topToolbarForIPhone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "filterViewContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "setUpFilterScrollView");
  return objc_msgSend(*(id *)(a1 + 32), "updateFilterChoiceButtonScrollPositionAnimated:", 0);
}

void __45__ICDocCamViewController_filterButtonAction___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "topToolbarForIPhone");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  objc_msgSend(*(id *)(a1 + 32), "setFilterSettingUIShowing:", 1);
  objc_msgSend(*(id *)(a1 + 32), "flashAndFilterUISemaphore");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v2);

  objc_msgSend(*(id *)(a1 + 32), "updateAccessibilityForCurrentFilter");
  LODWORD(v2) = *MEMORY[0x24BDF72C8];
  objc_msgSend(*(id *)(a1 + 32), "filterViewContainer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v2, v4);

}

uint64_t __45__ICDocCamViewController_filterButtonAction___block_invoke_3(uint64_t a1)
{
  double v2;
  void *v3;
  void *v4;

  v2 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "filterViewContainerWidthConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConstant:", v2);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

  return objc_msgSend(*(id *)(a1 + 32), "setUpFilterScrollView");
}

void __45__ICDocCamViewController_filterButtonAction___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setFilterSettingUIShowing:", 1);
  objc_msgSend(*(id *)(a1 + 32), "flashAndFilterUISemaphore");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v2);

  objc_msgSend(*(id *)(a1 + 32), "updateAccessibilityForCurrentFilter");
  LODWORD(v2) = *MEMORY[0x24BDF72C8];
  objc_msgSend(*(id *)(a1 + 32), "filterViewContainer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v2, v3);

}

- (void)cancelAction:(id)a3
{
  void *v4;
  int64_t v5;
  ICDocCamExtractedDocumentViewController *v6;
  void *v7;
  void *v8;
  ICDocCamExtractedDocumentViewController *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
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
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[6];

  -[ICDocCamViewController processRequestsBlocker](self, "processRequestsBlocker", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addBlockerOfType:clearRectangles:clearQueue:", CFSTR("CancelActionBlocker"), 1, 1);

  -[ICDocCamViewController dismissFilterAndFlashUI](self, "dismissFilterAndFlashUI");
  if (-[ICDocCamViewController isInRetakeMode](self, "isInRetakeMode"))
  {
    v5 = -[ICDocCamViewController retakeIndex](self, "retakeIndex");
    -[ICDocCamViewController disableRetakeMode](self, "disableRetakeMode");
    v6 = [ICDocCamExtractedDocumentViewController alloc];
    -[ICDocCamViewController documentInfoCollection](self, "documentInfoCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController imageCache](self, "imageCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ICDocCamExtractedDocumentViewController initWithDelegate:documentInfoCollection:imageCache:currentIndex:mode:](v6, "initWithDelegate:documentInfoCollection:imageCache:currentIndex:mode:", self, v7, v8, v5, 0);

    v10 = *MEMORY[0x24BDE5E00];
    v11 = *MEMORY[0x24BDE5E20];
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __39__ICDocCamViewController_cancelAction___block_invoke;
    v39[3] = &unk_24C5B89B0;
    v39[4] = self;
    -[ICDocCamViewController pushViewController:type:subtype:duration:completion:](self, "pushViewController:type:subtype:duration:completion:", v9, v10, v11, v39, 0.25);

  }
  else
  {
    -[ICDocCamViewController documentInfoCollection](self, "documentInfoCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "docInfos");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      -[ICDocCamViewController documentInfoCollection](self, "documentInfoCollection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "docInfos");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (v17 == 1)
        v18 = CFSTR("Discard Scan");
      else
        v18 = CFSTR("Discard Scans");
      +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", v18, v18, CFSTR("Localizable"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x24BDD17C8];
      +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("DISCARD_%lu_SCANNED_IMAGES_ALERT_MESSAGE"), CFSTR("DISCARD_%lu_SCANNED_IMAGES_ALERT_MESSAGE"), CFSTR("Localizable"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController documentInfoCollection](self, "documentInfoCollection");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "docInfos");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringWithFormat:", v23, objc_msgSend(v25, "count"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v21, v26, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("exclamationmark.triangle"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setImage:", v28);

      v29 = (void *)MEMORY[0x24BDF67E8];
      +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Discard"), CFSTR("Discard"), CFSTR("Localizable"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = MEMORY[0x24BDAC760];
      v38[0] = MEMORY[0x24BDAC760];
      v38[1] = 3221225472;
      v38[2] = __39__ICDocCamViewController_cancelAction___block_invoke_2;
      v38[3] = &unk_24C5B8B50;
      v38[4] = self;
      objc_msgSend(v29, "actionWithTitle:style:handler:", v30, 0, v38);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "addAction:", v32);
      v33 = (void *)MEMORY[0x24BDF67E8];
      +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Cancel"), CFSTR("Cancel"), CFSTR("Localizable"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v31;
      v37[1] = 3221225472;
      v37[2] = __39__ICDocCamViewController_cancelAction___block_invoke_4;
      v37[3] = &unk_24C5B8B50;
      v37[4] = self;
      objc_msgSend(v33, "actionWithTitle:style:handler:", v34, 1, v37);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "addAction:", v35);
      -[ICDocCamViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v27, 1, 0);

    }
    else
    {
      -[ICDocCamViewController cameraUnavailableScrim](self, "cameraUnavailableScrim");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setHidden:", 1);

      -[ICDocCamViewController delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "documentCameraControllerDidCancel:", self);

      -[ICDocCamViewController processRequestsBlocker](self, "processRequestsBlocker");
      v36 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "removeBlockerOfType:", CFSTR("CancelActionBlocker"));

    }
  }
}

void __39__ICDocCamViewController_cancelAction___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "saveButton");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 0);

  objc_msgSend(*(id *)(a1 + 32), "thumbnailContainerView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  objc_msgSend(*(id *)(a1 + 32), "processRequestsBlocker");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeBlockerOfType:", CFSTR("CancelActionBlocker"));

}

void __39__ICDocCamViewController_cancelAction___block_invoke_2(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documentCameraControllerDidCancel:", *(_QWORD *)(a1 + 32));

  v3 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__ICDocCamViewController_cancelAction___block_invoke_3;
  block[3] = &unk_24C5B89B0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v3, MEMORY[0x24BDAC9B8], block);
}

void __39__ICDocCamViewController_cancelAction___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "processRequestsBlocker");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeBlockerOfType:", CFSTR("CancelActionBlocker"));

}

void __39__ICDocCamViewController_cancelAction___block_invoke_4(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[5];

  v2 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__ICDocCamViewController_cancelAction___block_invoke_5;
  block[3] = &unk_24C5B89B0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x24BDAC9B8], block);
}

void __39__ICDocCamViewController_cancelAction___block_invoke_5(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "processRequestsBlocker");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeBlockerOfType:", CFSTR("CancelActionBlocker"));

}

- (void)singleTap
{
  NSObject *v3;
  intptr_t v4;
  NSObject *v5;

  -[ICDocCamViewController flashAndFilterUISemaphore](self, "flashAndFilterUISemaphore");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_semaphore_wait(v3, 0);

  if (!v4)
  {
    -[ICDocCamViewController dismissFilterAndFlashUI](self, "dismissFilterAndFlashUI");
    -[ICDocCamViewController flashAndFilterUISemaphore](self, "flashAndFilterUISemaphore");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v5);

  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  NSObject *v5;
  intptr_t v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;

  v4 = a3;
  -[ICDocCamViewController flashAndFilterUISemaphore](self, "flashAndFilterUISemaphore");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_semaphore_wait(v5, 0);

  if (!v6)
  {
    -[ICDocCamViewController singleTapGestureRecognizer](self, "singleTapGestureRecognizer");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 != v4)
    {
      LOBYTE(v7) = 1;
LABEL_12:
      -[ICDocCamViewController flashAndFilterUISemaphore](self, "flashAndFilterUISemaphore");
      v19 = objc_claimAutoreleasedReturnValue();
      dispatch_semaphore_signal(v19);

      goto LABEL_13;
    }
    -[ICDocCamViewController filterViewContainer](self, "filterViewContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isHidden") & 1) != 0)
    {
      v7 = -[ICDocCamViewController flashSettingUIShowing](self, "flashSettingUIShowing");

      if (!v7)
        goto LABEL_12;
    }
    else
    {

    }
    -[ICDocCamViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v10);
    v12 = v11;
    v14 = v13;

    -[ICDocCamViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hitTest:withEvent:", 0, v12, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICDocCamViewController thumbnailContainerView](self, "thumbnailContainerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isDescendantOfView:", v17);

    if (v18)
      -[ICDocCamViewController dismissFilterAndFlashUI](self, "dismissFilterAndFlashUI");
    LOBYTE(v7) = v18 ^ 1;

    goto LABEL_12;
  }
  LOBYTE(v7) = 0;
LABEL_13:

  return v7;
}

- (void)handleVolumeButtonPress:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 1)
    -[ICDocCamViewController shutterButtonAction:](self, "shutterButtonAction:", 0);

}

- (void)shutterButtonAction:(id)a3
{
  NSObject *v4;
  intptr_t v5;
  void *v6;
  void *v7;
  NSObject *v8;

  -[ICDocCamViewController flashAndFilterUISemaphore](self, "flashAndFilterUISemaphore", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_semaphore_wait(v4, 0);

  if (!v5)
  {
    -[ICDocCamViewController dismissFilterAndFlashUI](self, "dismissFilterAndFlashUI");
    -[ICDocCamViewController overlayView](self, "overlayView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "documentQuad");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController setBackupQuad:](self, "setBackupQuad:", v7);

    -[ICDocCamViewController snapStillImageWithMode:](self, "snapStillImageWithMode:", 2);
    -[ICDocCamViewController flashAndFilterUISemaphore](self, "flashAndFilterUISemaphore");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v8);

  }
}

- (void)saveAction:(id)a3
{
  unint64_t i;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;

  for (i = 0; ; ++i)
  {
    -[ICDocCamViewController documentInfoCollection](self, "documentInfoCollection", a3);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "docInfos");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6 <= i)
      break;
    -[ICDocCamViewController documentInfoCollection](self, "documentInfoCollection");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "docInfos");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "croppedAndFilteredImageUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      return;
  }
  -[ICDocCamViewController processRequestsBlocker](self, "processRequestsBlocker");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "blockerSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", CFSTR("SaveActionBlocker"));

  if ((v11 & 1) == 0)
  {
    -[ICDocCamViewController processRequestsBlocker](self, "processRequestsBlocker");
    v29 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addBlockerOfType:clearRectangles:clearQueue:", CFSTR("SaveActionBlocker"), 1, 1);

    -[ICDocCamViewController dismissFilterAndFlashUI](self, "dismissFilterAndFlashUI");
    -[ICDocCamViewController documentInfoCollection](self, "documentInfoCollection");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "docInfos");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      -[ICDocCamViewController delegate](self, "delegate");
      v31 = (id)objc_claimAutoreleasedReturnValue();
      v14 = objc_opt_respondsToSelector();

      if ((v14 & 1) != 0)
      {
        -[ICDocCamViewController delegate](self, "delegate");
        v32 = (id)objc_claimAutoreleasedReturnValue();
        -[ICDocCamViewController documentInfoCollection](self, "documentInfoCollection");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICDocCamViewController imageCache](self, "imageCache");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "documentCameraController:didFinishWithDocInfoCollection:imageCache:warnUser:", self, v15, v16, 1);

      }
      else
      {
        -[ICDocCamViewController imageCache](self, "imageCache");
        v33 = (id)objc_claimAutoreleasedReturnValue();
        -[ICDocCamViewController documentInfoCollection](self, "documentInfoCollection");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "docInfos");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "croppedAndFilteredImageUUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "getImage:", v20);
        v21 = objc_claimAutoreleasedReturnValue();

        -[ICDocCamViewController documentInfoCollection](self, "documentInfoCollection");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "docInfos");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "metaData");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICDocCamViewController createNSDataFrom:metaData:](self, "createNSDataFrom:metaData:", v21, v25);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        -[ICDocCamViewController didFinishWithImage:](self, "didFinishWithImage:", v15);
        v32 = (id)v21;
      }

    }
  }
}

- (void)enableShutter:(BOOL)a3
{
  void *v3;
  _BOOL8 v4;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v4 = a3;
  if (a3)
  {
    -[ICDocCamViewController shutterButton](self, "shutterButton");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPseudoDisabled:", 0);

  }
  -[ICDocCamViewController shutterButton](self, "shutterButton");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUserInteractionEnabled:", v4);

  -[ICDocCamViewController shutterButton](self, "shutterButton");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "alpha");
  v7 = v6;
  if (v6 == 0.0)
  {
    v8 = 1;
  }
  else
  {
    -[ICDocCamViewController shutterButton](self, "shutterButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "isUserInteractionEnabled") ^ 1;
  }
  -[ICDocCamViewController physicalCaptureRecognizer](self, "physicalCaptureRecognizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSuspended:", v8);

  if (v7 != 0.0)
  -[ICDocCamViewController physicalCaptureNotifier](self, "physicalCaptureNotifier");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setEnabled:", v4);

}

- (void)dismissFilterUI
{
  void *v3;

  -[ICDocCamViewController processRequestsBlocker](self, "processRequestsBlocker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeBlockerOfType:", CFSTR("FilterSettingBlocker"));

  -[ICDocCamViewController hideFilterSettingUI](self, "hideFilterSettingUI");
}

- (void)dismissFlashUI
{
  void *v3;

  -[ICDocCamViewController processRequestsBlocker](self, "processRequestsBlocker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeBlockerOfType:", CFSTR("FlashSettingBlocker"));

  -[ICDocCamViewController hideFlashSettingUI](self, "hideFlashSettingUI");
}

- (void)dismissFilterAndFlashUI
{
  -[ICDocCamViewController dismissFilterUI](self, "dismissFilterUI");
  -[ICDocCamViewController dismissFlashUI](self, "dismissFlashUI");
}

- (void)hideShutter:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  id v6;
  id v7;
  id v8;

  v3 = a3;
  v5 = (double)!a3;
  -[ICDocCamViewController shutterButton](self, "shutterButton");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", v5);

  -[ICDocCamViewController physicalCaptureRecognizer](self, "physicalCaptureRecognizer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSuspended:", v3);

  -[ICDocCamViewController physicalCaptureNotifier](self, "physicalCaptureNotifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v3);

}

- (void)hideFlashSettingUI
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[6];
  _QWORD v11[5];
  _QWORD v12[5];

  if (-[ICDocCamViewController flashSettingUIShowing](self, "flashSettingUIShowing"))
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceIdiom");

    if (v4)
    {
      v9[4] = self;
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __44__ICDocCamViewController_hideFlashSettingUI__block_invoke_3;
      v10[3] = &unk_24C5B8B00;
      v10[4] = self;
      v10[5] = 0;
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __44__ICDocCamViewController_hideFlashSettingUI__block_invoke_4;
      v9[3] = &unk_24C5B8A68;
      objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v10, v9, 0.25);
    }
    else
    {
      -[ICDocCamViewController topToolbarForIPhone](self, "topToolbarForIPhone");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setHidden:", 0);

      -[ICDocCamViewController topToolbarForIPhone](self, "topToolbarForIPhone");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAlpha:", 0.0);

      -[ICDocCamViewController flashSettingView](self, "flashSettingView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAlpha:", 1.0);

      -[ICDocCamViewController flashSettingView](self, "flashSettingView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setHidden:", 0);

      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __44__ICDocCamViewController_hideFlashSettingUI__block_invoke;
      v12[3] = &unk_24C5B89B0;
      v12[4] = self;
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __44__ICDocCamViewController_hideFlashSettingUI__block_invoke_2;
      v11[3] = &unk_24C5B8A68;
      v11[4] = self;
      objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v12, v11, 0.25);
    }
  }
}

void __44__ICDocCamViewController_hideFlashSettingUI__block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "flashSettingView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "topToolbarForIPhone");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

}

uint64_t __44__ICDocCamViewController_hideFlashSettingUI__block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "flashSettingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 1);

  objc_msgSend(*(id *)(a1 + 32), "setFlashSettingUIShowing:", 0);
  objc_msgSend(*(id *)(a1 + 32), "updateAccessibilityForCurrentFlashMode");
  return objc_msgSend(*(id *)(a1 + 32), "updateAccessibilityFocusForHidingFlashSettingsUI");
}

void __44__ICDocCamViewController_hideFlashSettingUI__block_invoke_3(uint64_t a1)
{
  double v2;
  id v3;
  id v4;

  v2 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "flashSettingWidthConstraint");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConstant:", v2);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

}

uint64_t __44__ICDocCamViewController_hideFlashSettingUI__block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFlashSettingUIShowing:", 0);
  objc_msgSend(*(id *)(a1 + 32), "updateAccessibilityForCurrentFlashMode");
  return objc_msgSend(*(id *)(a1 + 32), "updateAccessibilityFocusForHidingFlashSettingsUI");
}

- (void)flashButtonCancelUI:(id)a3
{
  dispatch_time_t v4;
  _QWORD block[5];

  -[ICDocCamViewController hideFlashSettingUI](self, "hideFlashSettingUI", a3);
  v4 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__ICDocCamViewController_flashButtonCancelUI___block_invoke;
  block[3] = &unk_24C5B89B0;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x24BDAC9B8], block);
}

void __46__ICDocCamViewController_flashButtonCancelUI___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "processRequestsBlocker");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeBlockerOfType:", CFSTR("FlashSettingBlocker"));

}

- (void)changeFlashAction:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
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
  void *v34;
  int64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  dispatch_time_t v45;
  _QWORD block[5];

  v4 = a3;
  -[ICDocCamViewController flashSettingViewOffButton](self, "flashSettingViewOffButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[ICDocCamViewController setFlashMode:](self, "setFlashMode:", 0);
    -[ICDocCamViewController flashButtonImage](self, "flashButtonImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController flashButton](self, "flashButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:forState:", v8, 0);

    -[ICDocCamViewController flashButton](self, "flashButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTintColor:", v11);

    -[ICDocCamViewController flashButtonForIPhone](self, "flashButtonForIPhone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImage:forState:", v8, 0);

    -[ICDocCamViewController flashButtonForIPhone](self, "flashButtonForIPhone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTintColor:", v14);

    -[ICDocCamViewController flashButtonForIPhone](self, "flashButtonForIPhone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setLargeContentImage:", v8);

    -[ICDocCamViewController flashSettingViewFlashIcon](self, "flashSettingViewFlashIcon");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setImage:forState:", v8, 0);

    -[ICDocCamViewController flashSettingViewFlashIcon](self, "flashSettingViewFlashIcon");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTintColor:", v18);
  }
  else
  {
    -[ICDocCamViewController flashSettingViewOnButton](self, "flashSettingViewOnButton");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4)
    {
      -[ICDocCamViewController setFlashMode:](self, "setFlashMode:", 1);
      -[ICDocCamViewController flashButtonImage](self, "flashButtonImage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashButton](self, "flashButton");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setImage:forState:", v8, 0);

      -[ICDocCamViewController flashButton](self, "flashButton");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController cameraHighlightColor](self, "cameraHighlightColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setTintColor:", v21);

      -[ICDocCamViewController flashButtonForIPhone](self, "flashButtonForIPhone");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setImage:forState:", v8, 0);

      -[ICDocCamViewController flashButtonForIPhone](self, "flashButtonForIPhone");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController cameraHighlightColor](self, "cameraHighlightColor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setTintColor:", v24);

      -[ICDocCamViewController flashButtonForIPhone](self, "flashButtonForIPhone");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setLargeContentImage:", v8);

      -[ICDocCamViewController flashSettingViewFlashIcon](self, "flashSettingViewFlashIcon");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setImage:forState:", v8, 0);

      -[ICDocCamViewController flashSettingViewFlashIcon](self, "flashSettingViewFlashIcon");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController cameraHighlightColor](self, "cameraHighlightColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTintColor:", v18);
    }
    else
    {
      -[ICDocCamViewController flashSettingViewAutoButton](self, "flashSettingViewAutoButton");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v7 != v4)
      {
        v8 = 0;
        goto LABEL_9;
      }
      -[ICDocCamViewController setFlashMode:](self, "setFlashMode:", 2);
      -[ICDocCamViewController flashButtonImage](self, "flashButtonImage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashButton](self, "flashButton");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setImage:forState:", v8, 0);

      -[ICDocCamViewController flashButton](self, "flashButton");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setTintColor:", v29);

      -[ICDocCamViewController flashButtonForIPhone](self, "flashButtonForIPhone");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setImage:forState:", v8, 0);

      -[ICDocCamViewController flashButtonForIPhone](self, "flashButtonForIPhone");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setTintColor:", v32);

      -[ICDocCamViewController flashButtonForIPhone](self, "flashButtonForIPhone");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setLargeContentImage:", v8);

      -[ICDocCamViewController flashSettingViewFlashIcon](self, "flashSettingViewFlashIcon");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setImage:forState:", v8, 0);

      -[ICDocCamViewController flashSettingViewFlashIcon](self, "flashSettingViewFlashIcon");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTintColor:", v18);
    }
  }

LABEL_9:
  v35 = -[ICDocCamViewController flashMode](self, "flashMode");
  if (v35)
  {
    if (v35 == 1)
    {
      -[ICDocCamViewController flashSettingViewOnButton](self, "flashSettingViewOnButton");
      v36 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v35 != 2)
      {
        v37 = 0;
        goto LABEL_17;
      }
      -[ICDocCamViewController flashSettingViewAutoButton](self, "flashSettingViewAutoButton");
      v36 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[ICDocCamViewController flashSettingViewOffButton](self, "flashSettingViewOffButton");
    v36 = objc_claimAutoreleasedReturnValue();
  }
  v37 = (void *)v36;
LABEL_17:
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController flashSettingViewAutoButton](self, "flashSettingViewAutoButton");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setTintColor:", v38);

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController flashSettingViewOnButton](self, "flashSettingViewOnButton");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setTintColor:", v40);

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController flashSettingViewOffButton](self, "flashSettingViewOffButton");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setTintColor:", v42);

  -[ICDocCamViewController cameraHighlightColor](self, "cameraHighlightColor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setTintColor:", v44);

  -[ICDocCamViewController hideFlashSettingUI](self, "hideFlashSettingUI");
  v45 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__ICDocCamViewController_changeFlashAction___block_invoke;
  block[3] = &unk_24C5B89B0;
  block[4] = self;
  dispatch_after(v45, MEMORY[0x24BDAC9B8], block);
  -[ICDocCamViewController updateAccessibilityForCurrentFlashMode](self, "updateAccessibilityForCurrentFlashMode");

}

void __44__ICDocCamViewController_changeFlashAction___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "processRequestsBlocker");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeBlockerOfType:", CFSTR("FlashSettingBlocker"));

}

- (void)flashButtonAction:(id)a3
{
  NSObject *v4;
  intptr_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int64_t v14;
  uint64_t v15;
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
  BOOL v27;
  uint64_t v28;
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
  _QWORD v40[5];
  _QWORD v41[6];
  _QWORD v42[5];
  _QWORD v43[5];

  -[ICDocCamViewController flashAndFilterUISemaphore](self, "flashAndFilterUISemaphore", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_semaphore_wait(v4, 0);

  if (!v5)
  {
    -[ICDocCamViewController processRequestsBlocker](self, "processRequestsBlocker");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addBlockerOfType:clearRectangles:clearQueue:", CFSTR("FlashSettingBlocker"), 1, 1);

    -[ICDocCamViewController dismissFilterUI](self, "dismissFilterUI");
    -[ICDocCamViewController userPromptView](self, "userPromptView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 1);

    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceIdiom");

    if (v9)
    {
      v10 = -[ICDocCamViewController flashMode](self, "flashMode");
      if (v10)
      {
        if (v10 == 1)
        {
          -[ICDocCamViewController flashSettingViewOnButton](self, "flashSettingViewOnButton");
          v11 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v10 != 2)
          {
            v18 = 0;
            goto LABEL_15;
          }
          -[ICDocCamViewController flashSettingViewAutoButton](self, "flashSettingViewAutoButton");
          v11 = objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        -[ICDocCamViewController flashSettingViewOffButton](self, "flashSettingViewOffButton");
        v11 = objc_claimAutoreleasedReturnValue();
      }
      v18 = (void *)v11;
LABEL_15:
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingViewAutoButton](self, "flashSettingViewAutoButton");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setTintColor:", v19);

      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingViewOnButton](self, "flashSettingViewOnButton");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setTintColor:", v21);

      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingViewOffButton](self, "flashSettingViewOffButton");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setTintColor:", v23);

      -[ICDocCamViewController cameraHighlightColor](self, "cameraHighlightColor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTintColor:", v25);

      -[ICDocCamViewController view](self, "view");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "layoutIfNeeded");

      v27 = -[ICDocCamViewController flashSettingUIShowing](self, "flashSettingUIShowing");
      v28 = 0;
      if (!v27)
        -[ICDocCamViewController flashSettingViewWidthForIPad](self, "flashSettingViewWidthForIPad", 0.0);
      v40[4] = self;
      v41[0] = MEMORY[0x24BDAC760];
      v41[1] = 3221225472;
      v41[2] = __44__ICDocCamViewController_flashButtonAction___block_invoke_3;
      v41[3] = &unk_24C5B8B00;
      v41[4] = self;
      v41[5] = v28;
      v40[0] = MEMORY[0x24BDAC760];
      v40[1] = 3221225472;
      v40[2] = __44__ICDocCamViewController_flashButtonAction___block_invoke_4;
      v40[3] = &unk_24C5B8A68;
      objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v41, v40, 0.25);
      goto LABEL_23;
    }
    -[ICDocCamViewController flashButtonImage](self, "flashButtonImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController flashSettingViewFlashIcon](self, "flashSettingViewFlashIcon");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setImage:forState:", v12, 0);

    v14 = -[ICDocCamViewController flashMode](self, "flashMode");
    if (v14)
    {
      if (v14 == 1)
      {
        -[ICDocCamViewController flashSettingViewOnButton](self, "flashSettingViewOnButton");
        v15 = objc_claimAutoreleasedReturnValue();
        -[ICDocCamViewController flashSettingViewFlashIcon](self, "flashSettingViewFlashIcon");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICDocCamViewController cameraHighlightColor](self, "cameraHighlightColor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setTintColor:", v17);
      }
      else
      {
        if (v14 != 2)
        {
          v18 = 0;
          goto LABEL_22;
        }
        -[ICDocCamViewController flashSettingViewAutoButton](self, "flashSettingViewAutoButton");
        v15 = objc_claimAutoreleasedReturnValue();
        -[ICDocCamViewController flashSettingViewFlashIcon](self, "flashSettingViewFlashIcon");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICDocCamViewController cameraHighlightColor](self, "cameraHighlightColor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setTintColor:", v17);
      }
    }
    else
    {
      -[ICDocCamViewController flashSettingViewOffButton](self, "flashSettingViewOffButton");
      v15 = objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashSettingViewFlashIcon](self, "flashSettingViewFlashIcon");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTintColor:", v17);
    }

    v18 = (void *)v15;
LABEL_22:
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController flashSettingViewAutoButton](self, "flashSettingViewAutoButton");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setTintColor:", v29);

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController flashSettingViewOnButton](self, "flashSettingViewOnButton");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setTintColor:", v31);

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController flashSettingViewOffButton](self, "flashSettingViewOffButton");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setTintColor:", v33);

    -[ICDocCamViewController cameraHighlightColor](self, "cameraHighlightColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTintColor:", v35);

    -[ICDocCamViewController flashSettingView](self, "flashSettingView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setAlpha:", 0.0);

    -[ICDocCamViewController flashSettingView](self, "flashSettingView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setHidden:", 0);

    -[ICDocCamViewController topToolbarForIPhone](self, "topToolbarForIPhone");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setAlpha:", 1.0);

    -[ICDocCamViewController topToolbarForIPhone](self, "topToolbarForIPhone");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setHidden:", 0);

    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __44__ICDocCamViewController_flashButtonAction___block_invoke;
    v43[3] = &unk_24C5B89B0;
    v43[4] = self;
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __44__ICDocCamViewController_flashButtonAction___block_invoke_2;
    v42[3] = &unk_24C5B8A68;
    v42[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v43, v42, 0.25);

LABEL_23:
  }
}

void __44__ICDocCamViewController_flashButtonAction___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "flashSettingView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "topToolbarForIPhone");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

}

void __44__ICDocCamViewController_flashButtonAction___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "topToolbarForIPhone");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  objc_msgSend(*(id *)(a1 + 32), "setFlashSettingUIShowing:", objc_msgSend(*(id *)(a1 + 32), "flashSettingUIShowing") ^ 1);
  objc_msgSend(*(id *)(a1 + 32), "flashAndFilterUISemaphore");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v2);

  objc_msgSend(*(id *)(a1 + 32), "updateAccessibilityForCurrentFlashMode");
  LODWORD(v2) = *MEMORY[0x24BDF72C8];
  objc_msgSend(*(id *)(a1 + 32), "flashSettingView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v2, v4);

}

void __44__ICDocCamViewController_flashButtonAction___block_invoke_3(uint64_t a1)
{
  double v2;
  id v3;
  id v4;

  v2 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "flashSettingWidthConstraint");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConstant:", v2);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

}

void __44__ICDocCamViewController_flashButtonAction___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  char v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "flashAndFilterUISemaphore");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v2);

  objc_msgSend(*(id *)(a1 + 32), "setFlashSettingUIShowing:", objc_msgSend(*(id *)(a1 + 32), "flashSettingUIShowing") ^ 1);
  objc_msgSend(*(id *)(a1 + 32), "updateAccessibilityForCurrentFlashMode");
  v3 = objc_msgSend(*(id *)(a1 + 32), "flashSettingUIShowing") ^ 1;
  objc_msgSend(*(id *)(a1 + 32), "flashSettingButtonView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityElementsHidden:", v3);

  v4 = objc_msgSend(*(id *)(a1 + 32), "flashSettingUIShowing");
  v5 = *(void **)(a1 + 32);
  if ((v4 & 1) != 0)
    objc_msgSend(v5, "flashSettingView");
  else
    objc_msgSend(v5, "flashButton");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v7);

}

- (void)image:(id)a3 didFinishSavingWithError:(id)a4 contextInfo:(void *)a5
{
  id v5;
  NSObject *v6;

  v5 = a4;
  if (v5)
  {
    v6 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ICDocCamViewController image:didFinishSavingWithError:contextInfo:].cold.1();

  }
}

- (void)didFinishWithImage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[ICDocCamViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentCameraController:didFinishWithImage:", self, v5);

}

- (BOOL)validRect:(id)a3 forImageSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  BOOL v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
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
  double v48;
  double v49;
  double v50;
  double v51;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v8 = v7;
  if (v7 && objc_msgSend(v7, "count"))
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topLeft");
    v11 = v10;
    objc_msgSend(v9, "topRight");
    if (v11 < v12)
    {
      objc_msgSend(v9, "bottomLeft");
      v14 = v13;
      objc_msgSend(v9, "bottomRight");
      if (v14 < v15)
      {
        objc_msgSend(v9, "topLeft");
        v17 = v16;
        objc_msgSend(v9, "bottomLeft");
        if (v17 > v18)
        {
          objc_msgSend(v9, "topRight");
          v20 = v19;
          objc_msgSend(v9, "bottomRight");
          if (v20 > v21)
          {
            if (-[ICDocCamViewController useDocumentSegmentation](self, "useDocumentSegmentation"))
            {
LABEL_8:
              v22 = 1;
LABEL_33:

              goto LABEL_34;
            }
            if (height <= width)
            {
              -[ICDocCamViewController viewBoundsSize](self, "viewBoundsSize");
              v39 = v38;
              -[ICDocCamViewController viewBoundsSize](self, "viewBoundsSize");
              v40 = height / (width / v39);
              v41 = 0.0;
              if (v40 > v42)
              {
                -[ICDocCamViewController viewBoundsSize](self, "viewBoundsSize");
                v41 = (v40 - v43) * 0.5 / v40;
              }
              objc_msgSend(v9, "topLeft");
              if (v44 >= 0.0)
              {
                objc_msgSend(v9, "bottomLeft");
                if (v45 >= 0.0)
                {
                  objc_msgSend(v9, "topRight");
                  if (v46 <= 1.0)
                  {
                    objc_msgSend(v9, "bottomRight");
                    if (v47 <= 1.0)
                    {
                      objc_msgSend(v9, "topLeft");
                      if (v48 <= 1.0 - v41)
                      {
                        objc_msgSend(v9, "bottomLeft");
                        if (v49 >= v41)
                        {
                          objc_msgSend(v9, "topRight");
                          if (v50 <= 1.0 - v41)
                          {
                            objc_msgSend(v9, "bottomRight");
                            if (v51 >= v41)
                              goto LABEL_8;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
            else
            {
              -[ICDocCamViewController viewBoundsSize](self, "viewBoundsSize");
              v24 = v23;
              -[ICDocCamViewController viewBoundsSize](self, "viewBoundsSize");
              v25 = width / (height / v24);
              v26 = 0.0;
              if (v25 > v27)
              {
                -[ICDocCamViewController viewBoundsSize](self, "viewBoundsSize");
                v26 = (v25 - v28) * 0.5 / v25;
              }
              objc_msgSend(v9, "topLeft");
              if (v29 >= v26)
              {
                objc_msgSend(v9, "bottomLeft");
                if (v30 >= v26)
                {
                  objc_msgSend(v9, "topRight");
                  v31 = 1.0 - v26;
                  if (v32 <= v31)
                  {
                    objc_msgSend(v9, "bottomRight");
                    if (v33 <= v31)
                    {
                      objc_msgSend(v9, "topLeft");
                      if (v34 <= 1.0)
                      {
                        objc_msgSend(v9, "bottomLeft");
                        if (v35 >= 0.0)
                        {
                          objc_msgSend(v9, "topRight");
                          if (v36 <= 1.0)
                          {
                            objc_msgSend(v9, "bottomRight");
                            if (v37 >= 0.0)
                              goto LABEL_8;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    v22 = 0;
    goto LABEL_33;
  }
  v22 = 0;
LABEL_34:

  return v22;
}

- (BOOL)sufficientlyLarge:(id)a3 forImageSize:(CGSize)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  float v22;
  float v23;
  float v24;
  BOOL v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  ICDocCamImageQuad *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  ICDocCamImageQuad *v45;

  v5 = a3;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count"))
  {
    -[ICDocCamViewController videoPreviewLayer](self, "videoPreviewLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController videoPreviewLayer](self, "videoPreviewLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v10 = v9;
    -[ICDocCamViewController videoPreviewLayer](self, "videoPreviewLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    objc_msgSend(v7, "metadataOutputRectOfInterestForRect:", 0.0, 0.0, v10);
    v13 = v12;
    v15 = v14;

    -[ICDocCamViewController videoPreviewLayer](self, "videoPreviewLayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "connection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "videoOrientation");

    if ((unint64_t)(v18 - 1) >= 2)
      v19 = v15;
    else
      v19 = v13;
    if ((unint64_t)(v18 - 1) >= 2)
      v20 = v13;
    else
      v20 = v15;
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[ICDocCamViewController useDocumentSegmentation](self, "useDocumentSegmentation"))
    {
      if (!-[ICDocCamViewController segmentMeanComputed](self, "segmentMeanComputed"))
      {
        objc_msgSend(v21, "confidence");
        v23 = v22;
        -[ICDocCamViewController segmentMinimumVisualConfidence60Frames](self, "segmentMinimumVisualConfidence60Frames");
        if (v23 < v24)
        {
          v25 = 0;
LABEL_23:

          goto LABEL_24;
        }
      }
      if (-[ICDocCamViewController segmentMeanComputed](self, "segmentMeanComputed"))
      {
        -[ICDocCamViewController setSegmentMeanComputed:](self, "setSegmentMeanComputed:", 0);
        v30 = [ICDocCamImageQuad alloc];
        -[ICDocCamViewController segmentBottomLeft](self, "segmentBottomLeft");
        v32 = v31;
        v34 = v33;
        -[ICDocCamViewController segmentBottomRight](self, "segmentBottomRight");
        v36 = v35;
        v38 = v37;
        -[ICDocCamViewController segmentTopLeft](self, "segmentTopLeft");
        v40 = v39;
        v42 = v41;
        -[ICDocCamViewController segmentTopRight](self, "segmentTopRight");
        v45 = -[ICDocCamImageQuad initWithBottomLeft:bottomRight:topLeft:topRight:](v30, "initWithBottomLeft:bottomRight:topLeft:topRight:", v32, v34, v36, v38, v40, v42, v43, v44);
      }
      else
      {
        +[ICDocCamImageQuad quadFromVNRectangle:](ICDocCamImageQuad, "quadFromVNRectangle:", v21);
        v45 = (ICDocCamImageQuad *)objc_claimAutoreleasedReturnValue();
      }
      v26 = v45;
      -[ICDocCamImageQuad bounds](v45, "bounds");
      v29 = 0.3;
    }
    else
    {
      +[ICDocCamImageQuad quadFromVNRectangle:](ICDocCamImageQuad, "quadFromVNRectangle:", v21);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "bounds");
      v29 = 0.6;
    }
    v25 = v28 > v19 * v29 || v27 > v20 * v29;

    goto LABEL_23;
  }
  v25 = 0;
LABEL_24:

  return v25;
}

- (BOOL)shouldAutoShoot
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  unint64_t v21;
  float v22;
  id v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  float v27;
  uint64_t i;
  float v29;
  float v30;
  float v31;
  id v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  double v36;
  uint64_t j;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t k;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  float v94;
  float v95;
  float v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  _QWORD v140[4];
  id v141;
  _QWORD *v142;
  uint64_t *v143;
  _QWORD *v144;
  uint64_t *v145;
  uint64_t *v146;
  _QWORD *v147;
  uint64_t *v148;
  uint64_t *v149;
  int v150;
  uint64_t v151;
  uint64_t *v152;
  uint64_t v153;
  uint64_t (*v154)(uint64_t, uint64_t);
  void (*v155)(uint64_t);
  id v156;
  uint64_t v157;
  uint64_t *v158;
  uint64_t v159;
  uint64_t (*v160)(uint64_t, uint64_t);
  void (*v161)(uint64_t);
  id v162;
  uint64_t v163;
  float *v164;
  uint64_t v165;
  int v166;
  uint64_t v167;
  uint64_t *v168;
  uint64_t v169;
  char v170;
  _QWORD v171[8];
  uint64_t v172;
  double *v173;
  uint64_t v174;
  __n128 (*v175)(__n128 *, __n128 *);
  uint64_t (*v176)();
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  _QWORD v180[3];
  int v181;
  _QWORD v182[3];
  char v183;
  _BYTE v184[128];
  _BYTE v185[128];
  _BYTE v186[128];
  uint64_t v187;

  v187 = *MEMORY[0x24BDAC8D0];
  if (!-[ICDocCamViewController autoMode](self, "autoMode"))
    return 0;
  if (!-[ICDocCamViewController isInRetakeMode](self, "isInRetakeMode"))
  {
    -[ICDocCamViewController delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController documentInfoCollection](self, "documentInfoCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "docInfos");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "documentCameraController:canAddImages:", self, objc_msgSend(v5, "count") + 1);

    if ((v6 & 1) == 0)
      return 0;
  }
  -[ICDocCamViewController processRequestsBlocker](self, "processRequestsBlocker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "blocked");

  if ((v8 & 1) != 0)
    return 0;
  -[ICDocCamViewController snapStillImageBlocker](self, "snapStillImageBlocker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "blocked");

  if ((v10 & 1) != 0)
    return 0;
  -[ICDocCamViewController rectResultsQueue](self, "rectResultsQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "size");

  if (!v12)
  {
    -[ICDocCamViewController overlayView](self, "overlayView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "clearRectangles");

    return 0;
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v182[0] = 0;
  v182[1] = v182;
  v182[2] = 0x2020000000;
  v183 = 0;
  v180[0] = 0;
  v180[1] = v180;
  v180[2] = 0x2020000000;
  v181 = 0;
  v172 = 0;
  v173 = (double *)&v172;
  v174 = 0x4012000000;
  v175 = __Block_byref_object_copy__4;
  v176 = __Block_byref_object_dispose__4;
  v179 = 0;
  v177 = "";
  v178 = 0;
  v171[0] = 0;
  v171[1] = v171;
  v171[2] = 0x4012000000;
  v171[3] = __Block_byref_object_copy__4;
  v171[4] = __Block_byref_object_dispose__4;
  v171[7] = 0;
  v171[5] = "";
  v171[6] = 0;
  v167 = 0;
  v168 = &v167;
  v169 = 0x2020000000;
  v170 = 0;
  v163 = 0;
  v164 = (float *)&v163;
  v165 = 0x2020000000;
  v166 = 0;
  v157 = 0;
  v158 = &v157;
  v159 = 0x3032000000;
  v160 = __Block_byref_object_copy__561;
  v161 = __Block_byref_object_dispose__562;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v162 = (id)objc_claimAutoreleasedReturnValue();
  v151 = 0;
  v152 = &v151;
  v153 = 0x3032000000;
  v154 = __Block_byref_object_copy__561;
  v155 = __Block_byref_object_dispose__562;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v156 = (id)objc_claimAutoreleasedReturnValue();
  v140[0] = MEMORY[0x24BDAC760];
  v140[1] = 3221225472;
  v140[2] = __41__ICDocCamViewController_shouldAutoShoot__block_invoke;
  v140[3] = &unk_24C5B8B78;
  v142 = v180;
  v143 = &v167;
  v144 = v182;
  v145 = &v163;
  v14 = v13;
  v141 = v14;
  v146 = &v172;
  v150 = 1101004800;
  v147 = v171;
  v148 = &v157;
  v149 = &v151;
  v15 = (void *)MEMORY[0x212B988FC](v140);
  -[ICDocCamViewController rectResultsQueue](self, "rectResultsQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController rectResultsQueue](self, "rectResultsQueue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "apply:fromIndex:toIndex:", v15, objc_msgSend(v17, "size") - 1, 0);

  if (v173[6] <= 20.0 && v173[7] <= 20.0 && !*((_BYTE *)v168 + 24) && v164[6] >= 2.0)
  {
    v21 = objc_msgSend((id)v158[5], "count");
    if (v21)
    {
      -[ICDocCamViewController rectangleStabilityStdDev](self, "rectangleStabilityStdDev");
      if (v22 != -1.0)
      {
        if (-[ICDocCamViewController useDocumentSegmentation](self, "useDocumentSegmentation"))
        {
          v138 = 0u;
          v139 = 0u;
          v136 = 0u;
          v137 = 0u;
          v23 = (id)v152[5];
          v24 = 0;
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v136, v186, 16);
          if (v25)
          {
            v26 = *(_QWORD *)v137;
            v27 = 0.0;
            do
            {
              for (i = 0; i != v25; ++i)
              {
                if (*(_QWORD *)v137 != v26)
                  objc_enumerationMutation(v23);
                objc_msgSend(*(id *)(*((_QWORD *)&v136 + 1) + 8 * i), "floatValue");
                if (v29 >= 0.99999)
                  v29 = -0.0;
                else
                  ++v24;
                v27 = v27 + v29;
              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v136, v186, 16);
            }
            while (v25);
          }
          else
          {
            v27 = 0.0;
          }

          -[ICDocCamViewController segmentMinimumVisualConfidence60Frames](self, "segmentMinimumVisualConfidence60Frames");
          v30 = (double)v24 + 0.001;
          if ((float)(v27 / v30) < v31)
            goto LABEL_11;
        }
        v134 = 0u;
        v135 = 0u;
        v132 = 0u;
        v133 = 0u;
        v32 = (id)v158[5];
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v132, v185, 16);
        if (v33)
        {
          v34 = 0.0;
          v124 = 0.0;
          v126 = 0.0;
          v35 = *(_QWORD *)v133;
          v120 = 0.0;
          v122 = 0.0;
          v116 = 0.0;
          v118 = 0.0;
          v36 = 0.0;
          do
          {
            for (j = 0; j != v33; ++j)
            {
              v114 = v34;
              if (*(_QWORD *)v133 != v35)
                objc_enumerationMutation(v32);
              v38 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * j);
              objc_msgSend(v38, "topLeft");
              v40 = v39;
              objc_msgSend(v38, "topLeft");
              v42 = v41;
              objc_msgSend(v38, "topRight");
              v44 = v43;
              objc_msgSend(v38, "topRight");
              v46 = v45;
              objc_msgSend(v38, "bottomLeft");
              v48 = v47;
              objc_msgSend(v38, "bottomLeft");
              v50 = v49;
              objc_msgSend(v38, "bottomRight");
              v52 = v51;
              objc_msgSend(v38, "bottomRight");
              v36 = v36 + v40;
              v116 = v116 + v42;
              v118 = v118 + v44;
              v120 = v120 + v46;
              v122 = v122 + v48;
              v124 = v124 + v50;
              v126 = v126 + v52;
              v34 = v114 + v53;
            }
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v132, v185, 16);
          }
          while (v33);
        }
        else
        {
          v34 = 0.0;
          v124 = 0.0;
          v126 = 0.0;
          v120 = 0.0;
          v122 = 0.0;
          v116 = 0.0;
          v118 = 0.0;
          v36 = 0.0;
        }

        v104 = v116 / (double)v21;
        v105 = v36 / (double)v21;
        v102 = v120 / (double)v21;
        v103 = v118 / (double)v21;
        v100 = v124 / (double)v21;
        v101 = v122 / (double)v21;
        v97 = (double)v21;
        v98 = v34 / (double)v21;
        v99 = v126 / (double)v21;
        if (-[ICDocCamViewController useDocumentSegmentation](self, "useDocumentSegmentation"))
        {
          -[ICDocCamViewController setSegmentTopLeft:](self, "setSegmentTopLeft:", v105, v104, *(_QWORD *)&v97);
          -[ICDocCamViewController setSegmentTopRight:](self, "setSegmentTopRight:", v103, v102);
          -[ICDocCamViewController setSegmentBottomLeft:](self, "setSegmentBottomLeft:", v101, v100);
          -[ICDocCamViewController setSegmentBottomRight:](self, "setSegmentBottomRight:", v99, v98);
          -[ICDocCamViewController setSegmentMeanComputed:](self, "setSegmentMeanComputed:", 1);
        }
        v130 = 0u;
        v131 = 0u;
        v128 = 0u;
        v129 = 0u;
        v54 = (id)v158[5];
        v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v128, v184, 16);
        if (v55)
        {
          v125 = 0.0;
          v127 = 0.0;
          v56 = *(_QWORD *)v129;
          v121 = 0.0;
          v123 = 0.0;
          v117 = 0.0;
          v119 = 0.0;
          v113 = 0.0;
          v115 = 0.0;
          do
          {
            for (k = 0; k != v55; ++k)
            {
              if (*(_QWORD *)v129 != v56)
                objc_enumerationMutation(v54);
              v58 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * k);
              objc_msgSend(v58, "topLeft", *(_QWORD *)&v97);
              v112 = v59;
              objc_msgSend(v58, "topLeft");
              v111 = v60;
              objc_msgSend(v58, "topLeft");
              v110 = v61;
              objc_msgSend(v58, "topLeft");
              v109 = v62;
              objc_msgSend(v58, "topRight");
              v108 = v63;
              objc_msgSend(v58, "topRight");
              v107 = v64;
              objc_msgSend(v58, "topRight");
              v106 = v65;
              objc_msgSend(v58, "topRight");
              v67 = v66;
              objc_msgSend(v58, "bottomLeft");
              v69 = v68;
              objc_msgSend(v58, "bottomLeft");
              v71 = v70;
              objc_msgSend(v58, "bottomLeft");
              v73 = v72;
              objc_msgSend(v58, "bottomLeft");
              v75 = v74;
              objc_msgSend(v58, "bottomRight");
              v77 = v76;
              objc_msgSend(v58, "bottomRight");
              v79 = v78;
              objc_msgSend(v58, "bottomRight");
              v81 = v80;
              objc_msgSend(v58, "bottomRight");
              v113 = v113 + (v112 - v105) * (v111 - v105);
              v115 = v115 + (v110 - v104) * (v109 - v104);
              v117 = v117 + (v108 - v103) * (v107 - v103);
              v119 = v119 + (v106 - v102) * (v67 - v102);
              v121 = v121 + (v69 - v101) * (v71 - v101);
              v123 = v123 + (v73 - v100) * (v75 - v100);
              v125 = v125 + (v77 - v99) * (v79 - v99);
              v127 = v127 + (v81 - v98) * (v82 - v98);
            }
            v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v128, v184, 16);
          }
          while (v55);
        }
        else
        {
          v125 = 0.0;
          v127 = 0.0;
          v121 = 0.0;
          v123 = 0.0;
          v117 = 0.0;
          v119 = 0.0;
          v113 = 0.0;
          v115 = 0.0;
        }

        v83 = sqrt(v113 / v97);
        v84 = sqrt(v117 / v97);
        v85 = sqrt(v119 / v97);
        v86 = sqrt(v121 / v97);
        v87 = sqrt(v123 / v97);
        v88 = sqrt(v125 / v97);
        v89 = sqrt(v127 / v97);
        if (v86 < v88)
          v86 = v88;
        if (v84 < v86)
          v84 = v86;
        if (v83 >= v84)
          v90 = v83;
        else
          v90 = v84;
        if (v87 >= v89)
          v91 = v87;
        else
          v91 = v89;
        if (v85 >= v91)
          v91 = v85;
        v92 = sqrt(v115 / v97);
        if (v92 >= v91)
          v93 = v92;
        else
          v93 = v91;
        -[ICDocCamViewController rectangleStabilityStdDev](self, "rectangleStabilityStdDev", *(_QWORD *)&v97);
        v95 = v94;
        if (-[ICDocCamViewController useDocumentSegmentation](self, "useDocumentSegmentation"))
        {
          -[ICDocCamViewController segmentStabilityStdDev](self, "segmentStabilityStdDev");
          v95 = v96;
        }
        if (v90 > v95 || v93 > v95)
        {
          -[ICDocCamViewController setSegmentMeanComputed:](self, "setSegmentMeanComputed:", 0);
          v18 = 0;
          goto LABEL_12;
        }
      }
    }
    v18 = 1;
    goto LABEL_12;
  }
LABEL_11:
  v18 = 0;
LABEL_12:

  _Block_object_dispose(&v151, 8);
  _Block_object_dispose(&v157, 8);

  _Block_object_dispose(&v163, 8);
  _Block_object_dispose(&v167, 8);
  _Block_object_dispose(v171, 8);
  _Block_object_dispose(&v172, 8);
  _Block_object_dispose(v180, 8);
  _Block_object_dispose(v182, 8);

  return v18;
}

uint64_t __41__ICDocCamViewController_shouldAutoShoot__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  float v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  void *v23;
  ICDocCamImageQuad *v24;
  void *v25;
  void *v26;
  void *v27;

  v3 = a2;
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  objc_msgSend(v3, "objectForKey:", CFSTR("Rectangles"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "count"))
  {
    v10 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    goto LABEL_23;
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (*(_BYTE *)(v6 + 24))
  {
    objc_msgSend(v3, "valueForKey:", CFSTR("RecognitionTime"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceDate:", v7);
    *(float *)&v8 = v8;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = LODWORD(v8);
    v9 = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);

    if (v9 > 2.0)
    {
      v10 = 0;
      goto LABEL_23;
    }
  }
  else
  {
    *(_BYTE *)(v6 + 24) = 1;
  }
  objc_msgSend(v3, "valueForKey:", CFSTR("RegistrationAlignmentVector"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_21;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 == v12)
    goto LABEL_21;
  objc_msgSend(v11, "CGVectorValue");
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v16 = *(double *)(v15 + 48);
  v17 = -v13;
  if (v13 >= 0.0)
    v17 = v13;
  if (v16 < v17)
    v16 = v17;
  *(double *)(v15 + 48) = v16;
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v19 = *(double *)(v18 + 56);
  v20 = -v14;
  if (v14 >= 0.0)
    v20 = v14;
  if (v19 < v20)
    v19 = v20;
  *(double *)(v18 + 56) = v19;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 48) = v13
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)
                                                                          + 48);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 56) = v14
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)
                                                                          + 56);
  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v22 = *(float *)(a1 + 104);
  if (*(double *)(v21 + 48) <= v22 && *(double *)(v21 + 56) <= v22)
  {
LABEL_21:
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_alloc_init(ICDocCamImageQuad);
    objc_msgSend(v23, "topLeft");
    -[ICDocCamImageQuad setTopLeft:](v24, "setTopLeft:");
    objc_msgSend(v23, "topRight");
    -[ICDocCamImageQuad setTopRight:](v24, "setTopRight:");
    objc_msgSend(v23, "bottomLeft");
    -[ICDocCamImageQuad setBottomLeft:](v24, "setBottomLeft:");
    objc_msgSend(v23, "bottomRight");
    -[ICDocCamImageQuad setBottomRight:](v24, "setBottomRight:");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "addObject:", v24);
    v25 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "confidence");
    objc_msgSend(v25, "numberWithFloat:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "addObject:", v27);
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }

LABEL_23:
  return v10;
}

- (id)cropAndFilterImage:(id)a3 rects:(id)a4 filterType:(signed __int16)a5 constantColor:(BOOL)a6
{
  id v8;
  id v9;
  id v10;
  CGImage *v11;
  size_t Width;
  size_t Height;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
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
  ICDocCamImageQuad *v31;
  void *v32;
  void *v33;
  void *v34;
  CGImage *v35;
  id v36;
  void *v37;
  void *v39;
  id v40;
  unsigned int v41;
  _BOOL4 v42;

  v41 = a5;
  v42 = a6;
  v8 = a3;
  v9 = a4;
  v10 = objc_retainAutorelease(v8);
  v11 = (CGImage *)objc_msgSend(v10, "CGImage");
  Width = CGImageGetWidth(v11);
  Height = CGImageGetHeight(v11);
  v14 = (void *)MEMORY[0x212B98734]();
  if (v9 && objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = v15;
      v40 = v15;
      objc_msgSend(v15, "topLeft");
      v18 = v17;
      v20 = v19;
      objc_msgSend(v16, "topRight");
      v22 = v21;
      v24 = v23;
      objc_msgSend(v16, "bottomLeft");
      v26 = v25;
      v28 = v27;
      objc_msgSend(v16, "bottomRight");
      v31 = -[ICDocCamImageQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([ICDocCamImageQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v26, v28, v29, v30, v18, v20, v22, v24);
      -[ICDocCamImageQuad imageQuadByScalingBy:](v31, "imageQuadByScalingBy:", (double)Width, (double)Height);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "topLeft");
      objc_msgSend(v32, "topRight");
      objc_msgSend(v32, "bottomLeft");
      objc_msgSend(v32, "bottomRight");
      v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBF660]), "initWithCGImage:", v11);
      -[ICDocCamViewController sharedCoreImageContext](self, "sharedCoreImageContext");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICDocCamImageFilters perspectiveCorrectedCIImageFromCIImage:imageQuad:](ICDocCamImageFilters, "perspectiveCorrectedCIImageFromCIImage:imageQuad:", v39, v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "extent");
      v35 = (CGImage *)objc_msgSend(v33, "createCGImage:fromRect:", v34);
      if (v35)
      {
        objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:", v35);
        v36 = (id)objc_claimAutoreleasedReturnValue();
        CGImageRelease(v35);
      }
      else
      {
        v36 = 0;
      }

      v15 = v40;
    }
    else
    {
      v36 = 0;
      v31 = 0;
    }

  }
  else
  {
    v36 = 0;
    v31 = 0;
  }
  objc_autoreleasePoolPop(v14);
  if (!v36)
    v36 = v10;
  +[ICDocCamImageFilters filteredImage:orientation:imageFilterType:constantColor:](ICDocCamImageFilters, "filteredImage:orientation:imageFilterType:constantColor:", v36, 0, v41, v42);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

- (void)saveCapturedImage:(id)a3 metaData:(id)a4 rects:(id)a5 constantColor:(BOOL)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int64_t v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  NSObject *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  ICDocCamImageQuad *v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  uint64_t v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  uint64_t v82;
  NSObject *v83;
  NSObject *v84;
  void *v85;
  NSObject *v86;
  ICDocCamDocumentInfo *v87;
  void *v88;
  ICDocCamDocumentInfo *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  NSObject *v94;
  void *v95;
  int64_t v96;
  int64_t v97;
  void *v98;
  void *v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  void *v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  void *v121;
  void *v122;
  void *v123;
  NSObject *v124;
  ICDocCamDocumentInfo *v125;
  NSObject *v126;
  id v127;
  uint64_t v128;
  double v129;
  NSObject *v130;
  double v131;
  signed __int16 v132;
  double v133;
  NSObject *v134;
  id v135;
  double v136;
  ICDocCamImageQuad *v137;
  _BOOL4 v138;
  void (**v139)(double);
  id v140;
  _QWORD v141[5];
  NSObject *v142;
  id v143;
  ICDocCamDocumentInfo *v144;
  id v145;
  id v146;
  NSObject *v147;
  void (**v148)(double);
  _QWORD *v149;
  int64_t v150;
  signed __int16 v151;
  BOOL v152;
  _QWORD v153[5];
  _QWORD block[4];
  NSObject *v155;
  id v156;
  _QWORD *v157;
  id v158;
  signed __int16 v159;
  BOOL v160;
  _QWORD v161[4];
  id v162;
  id location;
  _QWORD v164[5];
  id v165;
  _QWORD v166[6];

  v138 = a6;
  v11 = a3;
  v140 = a4;
  v12 = a5;
  v139 = (void (**)(double))a7;
  v13 = os_log_create("com.apple.documentcamera", ");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[ICDocCamViewController saveCapturedImage:metaData:rects:constantColor:completionHandler:].cold.4();

  if (-[ICDocCamViewController isInRetakeMode](self, "isInRetakeMode"))
    goto LABEL_5;
  -[ICDocCamViewController delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController documentInfoCollection](self, "documentInfoCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "docInfos");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v14, "documentCameraController:canAddImages:", self, objc_msgSend(v16, "count") + 1);

  if ((v17 & 1) != 0)
  {
LABEL_5:
    v135 = v11;
    v18 = objc_opt_class();
    DCDynamicCast(v18, (uint64_t)v11);
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationsEnabled:", 0);
      -[ICDocCamViewController saveButton](self, "saveButton");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController documentInfoCollection](self, "documentInfoCollection");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "docInfos");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setDocumentCount:", objc_msgSend(v22, "count") + 1);

      objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationsEnabled:", 1);
      -[ICDocCamViewController updateThumbnailContainerViewConstraintConstantForIPad](self, "updateThumbnailContainerViewConstraintConstantForIPad");
      -[ICDocCamViewController documentInfoCollection](self, "documentInfoCollection");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "docInfos");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "count");

      if (!v25)
      {
        -[ICDocCamViewController saveButton](self, "saveButton");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setHidden:", 0);

        -[ICDocCamViewController saveButton](self, "saveButton");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setEnabled:", 0);

        -[ICDocCamViewController saveButton](self, "saveButton");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setAlpha:", 0.0);

        v166[0] = MEMORY[0x24BDAC760];
        v166[1] = 3221225472;
        v166[2] = __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke;
        v166[3] = &unk_24C5B89B0;
        v166[4] = self;
        objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v166, 0.15);
      }
      if (-[ICDocCamViewController isInRetakeMode](self, "isInRetakeMode"))
      {
        v29 = -[ICDocCamViewController statusBarOrientation](self, "statusBarOrientation");
        -[ICDocCamViewController view](self, "view");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "window");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        +[ICDocCamExtractedDocumentViewController targetRectForOrientation:window:](ICDocCamExtractedDocumentViewController, "targetRectForOrientation:window:", v29, v31);
        v33 = v32;
        v35 = v34;

      }
      else
      {
        -[ICDocCamViewController targetViewRect](self, "targetViewRect");
        v33 = v37;
        v35 = v38;
      }
      if (v12)
      {
        if (!objc_msgSend(v12, "count"))
          goto LABEL_27;
        objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v39)
          goto LABEL_27;
        -[NSObject size](v19, "size");
        v136 = v40;
        -[NSObject size](v19, "size");
        v133 = v41;
        objc_msgSend(v39, "topLeft");
        v129 = v43;
        v131 = v42;
        objc_msgSend(v39, "topRight");
        v45 = v44;
        v47 = v46;
        objc_msgSend(v39, "bottomLeft");
        v49 = v48;
        v51 = v50;
        objc_msgSend(v39, "bottomRight");
        v54 = -[ICDocCamImageQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([ICDocCamImageQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v49, v51, v52, v53, v131, v129, v45, v47);
        -[ICDocCamImageQuad imageQuadByScalingBy:](v54, "imageQuadByScalingBy:", (double)(unint64_t)v136, (double)(unint64_t)v133);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "bounds");
        if (v56 / v57 < v33 / v35)
          v58 = v35 / v57;
        else
          v58 = v33 / v56;
        if (MGGetProductType() != 1737882206)
        {
          objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "scale");
          v58 = v58 * v60;

        }
        +[ICDocCamUtilities resizedImage:newSize:interpolationQuality:](ICDocCamUtilities, "resizedImage:newSize:interpolationQuality:", v19, 3, v58 * (double)(unint64_t)v136, v58 * (double)(unint64_t)v133);
        v61 = objc_claimAutoreleasedReturnValue();

        v134 = v61;
        if (!v61)
LABEL_27:
          v134 = v19;
        if (objc_msgSend(v12, "count"))
        {
          objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = v62;
          if (v62)
          {
            objc_msgSend(v62, "topLeft");
            v65 = v64;
            v67 = v66;
            objc_msgSend(v63, "topRight");
            v69 = v68;
            v71 = v70;
            objc_msgSend(v63, "bottomLeft");
            v73 = v72;
            v75 = v74;
            objc_msgSend(v63, "bottomRight");
            v77 = v76;
            v79 = v78;
          }
          else
          {
            v73 = 0.0;
            v79 = 1.0;
            v77 = 1.0;
            v75 = 1.0;
            v71 = 0.0;
            v69 = 1.0;
            v67 = 0.0;
            v65 = 0.0;
          }

          goto LABEL_35;
        }
      }
      else
      {
        v134 = v19;
      }
      v73 = 0.0;
      v79 = 1.0;
      v77 = 1.0;
      v75 = 1.0;
      v71 = 0.0;
      v69 = 1.0;
      v67 = 0.0;
      v65 = 0.0;
LABEL_35:
      v137 = -[ICDocCamImageQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([ICDocCamImageQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v73, v75, v77, v79, v65, v67, v69, v71);
      v132 = -[ICDocCamViewController defaultFilter](self, "defaultFilter");
      v164[0] = 0;
      v164[1] = v164;
      v164[2] = 0x3032000000;
      v164[3] = __Block_byref_object_copy__561;
      v164[4] = __Block_byref_object_dispose__562;
      v165 = 0;
      if (-[ICDocCamViewController isInRetakeMode](self, "isInRetakeMode"))
      {
        v130 = 0;
      }
      else
      {
        objc_initWeak(&location, self);
        -[ICDocCamViewController saveButton](self, "saveButton");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "setEnabled:", 0);

        v81 = (void *)MEMORY[0x24BDF6F90];
        v82 = MEMORY[0x24BDAC760];
        v161[0] = MEMORY[0x24BDAC760];
        v161[1] = 3221225472;
        v161[2] = __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_2;
        v161[3] = &unk_24C5B8BA0;
        objc_copyWeak(&v162, &location);
        objc_msgSend(v81, "animateWithDuration:animations:", v161, 0.15);
        dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v83 = objc_claimAutoreleasedReturnValue();
        v84 = dispatch_queue_create("com.apple.documentcamera.cropped-and-filtered-image", v83);

        block[0] = v82;
        block[1] = 3221225472;
        block[2] = __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_3;
        block[3] = &unk_24C5B8BC8;
        v157 = v164;
        objc_copyWeak(&v158, &location);
        v155 = v19;
        v156 = v12;
        v159 = v132;
        v160 = v138;
        v130 = v84;
        dispatch_async(v84, block);

        objc_destroyWeak(&v158);
        objc_destroyWeak(&v162);
        objc_destroyWeak(&location);
      }
      -[ICDocCamViewController cropAndFilterImage:rects:filterType:constantColor:](self, "cropAndFilterImage:rects:filterType:constantColor:", v134, v12, -[ICDocCamViewController defaultFilter](self, "defaultFilter"), v138);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController snapshotSpinnerQueue](self, "snapshotSpinnerQueue");
      v86 = objc_claimAutoreleasedReturnValue();
      v153[0] = MEMORY[0x24BDAC760];
      v153[1] = 3221225472;
      v153[2] = __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_4;
      v153[3] = &unk_24C5B89B0;
      v153[4] = self;
      dispatch_sync(v86, v153);

      v87 = [ICDocCamDocumentInfo alloc];
      -[ICDocCamViewController delegate](self, "delegate");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = -[ICDocCamDocumentInfo initWithDelegate:](v87, "initWithDelegate:", v88);

      -[ICDocCamDocumentInfo setCurrentFilter:](v89, "setCurrentFilter:", -[ICDocCamViewController defaultFilter](self, "defaultFilter"));
      -[ICDocCamDocumentInfo setMetaData:](v89, "setMetaData:", v140);
      -[ICDocCamDocumentInfo setImageQuad:](v89, "setImageQuad:", v137);
      -[ICDocCamViewController imageCache](self, "imageCache");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "setImage:metaData:addToMemoryCache:completion:", v85, v140, 1, 0);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamDocumentInfo setMeshAnimImageUUID:](v89, "setMeshAnimImageUUID:", v91);

      -[ICDocCamDocumentInfo setCroppedAndFilteredImageUUID:](v89, "setCroppedAndFilteredImageUUID:", 0);
      -[ICDocCamDocumentInfo setCroppedButNotFilteredImageUUID:](v89, "setCroppedButNotFilteredImageUUID:", 0);
      -[ICDocCamViewController imageCache](self, "imageCache");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "setImage:metaData:", v19, v140);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamDocumentInfo setFullImageUUID:](v89, "setFullImageUUID:", v93);

      -[ICDocCamDocumentInfo setConstantColor:](v89, "setConstantColor:", v138);
      v94 = os_log_create("com.apple.documentcamera", ");
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
        -[ICDocCamViewController saveCapturedImage:metaData:rects:constantColor:completionHandler:].cold.2();

      -[ICDocCamViewController overlayView](self, "overlayView");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "setHidden:", 1);

      v96 = -[ICDocCamViewController retakeIndex](self, "retakeIndex");
      if (-[ICDocCamViewController isInRetakeMode](self, "isInRetakeMode"))
      {
        -[ICDocCamViewController stopImageCaptureSession](self, "stopImageCaptureSession");
        v97 = -[ICDocCamViewController statusBarOrientation](self, "statusBarOrientation");
        -[ICDocCamViewController view](self, "view");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "window");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        +[ICDocCamExtractedDocumentViewController targetRectForOrientation:window:](ICDocCamExtractedDocumentViewController, "targetRectForOrientation:window:", v97, v99);
        v101 = v100;
        v103 = v102;
        v105 = v104;
        v107 = v106;

      }
      else
      {
        -[ICDocCamViewController targetViewRect](self, "targetViewRect");
        v101 = v108;
        v103 = v109;
        v105 = v110;
        v107 = v111;
      }
      -[ICDocCamViewController videoPreviewLayer](self, "videoPreviewLayer", 3221225472);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "rectForMetadataOutputRectOfInterest:", 0.0, 0.0, 1.0, 1.0);
      v114 = v113;
      v116 = v115;
      v118 = v117;
      v120 = v119;

      -[ICDocCamViewController previewView](self, "previewView");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController scrimView](self, "scrimView");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController imageMeshTransformWithImage:backgroundImage:imageViewFrame:imageQuad:previewView:previewBounds:scrimView:](self, "imageMeshTransformWithImage:backgroundImage:imageViewFrame:imageQuad:previewView:previewBounds:scrimView:", v85, v19, v137, v121, v122, v101, v103, v105, v107, v114, v116, v118, v120);
      v123 = (void *)objc_claimAutoreleasedReturnValue();

      v141[0] = MEMORY[0x24BDAC760];
      v141[1] = v128;
      v141[2] = __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_574;
      v141[3] = &unk_24C5B8CB8;
      v141[4] = self;
      v124 = v19;
      v142 = v124;
      v143 = v12;
      v151 = v132;
      v152 = v138;
      v125 = v89;
      v144 = v125;
      v150 = v96;
      v145 = v140;
      v146 = v123;
      v148 = v139;
      v126 = v130;
      v147 = v126;
      v149 = v164;
      v127 = v123;
      objc_msgSend(v127, "startWithCompletionBlock:", v141);

      _Block_object_dispose(v164, 8);
      v19 = v124;
      v11 = v135;
      goto LABEL_44;
    }
    -[ICDocCamViewController restartImageCaptureSessionIfNecessary](self, "restartImageCaptureSessionIfNecessary");
    if (v139)
      v139[2](0.5);
    v36 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      -[ICDocCamViewController saveCapturedImage:metaData:rects:constantColor:completionHandler:].cold.1();

  }
  else
  {
    -[ICDocCamViewController warnAboutMaxScansIfNecessary](self, "warnAboutMaxScansIfNecessary");
    v19 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[ICDocCamViewController saveCapturedImage:metaData:rects:constantColor:completionHandler:].cold.3();
  }
LABEL_44:

}

void __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "saveButton");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.25);

}

void __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "saveButton");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.25);

}

void __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "cropAndFilterImage:rects:filterType:constantColor:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(__int16 *)(a1 + 64), *(unsigned __int8 *)(a1 + 66));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_4(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_5;
  block[3] = &unk_24C5B89B0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_5(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setAwaitingSnapshotCompletion:", 0);
  objc_msgSend(*(id *)(a1 + 32), "snapshotSpinner");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hide");

}

void __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_574(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  id *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  ICDocCamExtractedDocumentViewController *v30;
  void *v31;
  void *v32;
  void *v33;
  ICDocCamExtractedDocumentViewController *v34;
  ICDocCamExtractedDocumentViewController *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t);
  void *v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  id v45;
  _QWORD block[4];
  id v47;
  id v48;
  uint64_t v49;
  id v50;
  _QWORD v51[4];
  ICDocCamExtractedDocumentViewController *v52;
  id v53;
  id v54;
  id v55;
  id location;

  if (objc_msgSend(*(id *)(a1 + 32), "isInRetakeMode"))
  {
    objc_msgSend(*(id *)(a1 + 32), "cropAndFilterImage:rects:filterType:constantColor:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(__int16 *)(a1 + 112), *(unsigned __int8 *)(a1 + 114));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "imageCache");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setImage:metaData:", v2, *(_QWORD *)(a1 + 64));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "setCroppedAndFilteredImageUUID:", v4);

    v5 = *(_QWORD *)(a1 + 104);
    v6 = objc_msgSend(*(id *)(a1 + 32), "isInRetakeMode");
    v7 = *(void **)(a1 + 32);
    if (v6)
    {
      objc_msgSend(v7, "disableRetakeMode");
      v8 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 32), "documentInfoCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "docInfos");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:atIndexedSubscript:", v8, *(_QWORD *)(a1 + 104));

    }
    else
    {
      objc_msgSend(v7, "documentInfoCollection");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "docInfos");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v27, "count");

      objc_msgSend(*(id *)(a1 + 32), "documentInfoCollection");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "docInfos");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addObject:", *(_QWORD *)(a1 + 56));

      objc_msgSend(*(id *)(a1 + 32), "saveButton");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHidden:", 0);
    }

    objc_msgSend(*(id *)(a1 + 32), "documentInfoCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bumpModificationDate");

    v30 = [ICDocCamExtractedDocumentViewController alloc];
    v31 = *(void **)(a1 + 32);
    objc_msgSend(v31, "documentInfoCollection");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "imageCache");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[ICDocCamExtractedDocumentViewController initWithDelegate:documentInfoCollection:imageCache:currentIndex:mode:](v30, "initWithDelegate:documentInfoCollection:imageCache:currentIndex:mode:", v31, v32, v33, v5, 0);

    objc_initWeak(&location, *(id *)(a1 + 32));
    v51[0] = MEMORY[0x24BDAC760];
    v51[1] = 3221225472;
    v51[2] = __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_2_575;
    v51[3] = &unk_24C5B8C18;
    objc_copyWeak(&v55, &location);
    v52 = v34;
    v53 = *(id *)(a1 + 72);
    v54 = *(id *)(a1 + 88);
    v35 = v34;
    dispatch_async(MEMORY[0x24BDAC9B8], v51);

    objc_destroyWeak(&v55);
    objc_destroyWeak(&location);

  }
  else
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    +[DCSettings sharedSettings](DCSettings, "sharedSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "finishAfterFirstScan");

    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 32), "addNewDocument:", *(_QWORD *)(a1 + 56));
      v14 = *(NSObject **)(a1 + 80);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_4_577;
      block[3] = &unk_24C5B8C68;
      v15 = &v47;
      v47 = *(id *)(a1 + 56);
      objc_copyWeak(&v50, &location);
      v49 = *(_QWORD *)(a1 + 96);
      v48 = *(id *)(a1 + 64);
      dispatch_async(v14, block);

      objc_destroyWeak(&v50);
    }
    else
    {
      v16 = os_log_create("com.apple.documentcamera", ");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_574_cold_1(a1, v16, v17, v18, v19, v20, v21, v22);

      objc_msgSend(*(id *)(a1 + 32), "thumbnailViewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *(_QWORD *)(a1 + 56);
      v37 = MEMORY[0x24BDAC760];
      v38 = 3221225472;
      v39 = __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_579;
      v40 = &unk_24C5B8C90;
      v41 = *(id *)(a1 + 80);
      v42 = *(id *)(a1 + 56);
      objc_copyWeak(&v45, &location);
      v44 = *(_QWORD *)(a1 + 96);
      v43 = *(id *)(a1 + 64);
      objc_msgSend(v23, "addNewDocument:completionBlock:", v24, &v37);

      objc_msgSend(*(id *)(a1 + 72), "hide", v37, v38, v39, v40, v41);
      v15 = &v41;

      objc_destroyWeak(&v45);
    }

    objc_msgSend(*(id *)(a1 + 32), "clearRectangles");
    objc_msgSend(*(id *)(a1 + 32), "overlayView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setHidden:", 0);

    (*(void (**)(double))(*(_QWORD *)(a1 + 88) + 16))(0.5);
    objc_msgSend(*(id *)(a1 + 32), "speakScannedDocumentForAccessibilityIfNecessary");
    objc_destroyWeak(&location);
  }
  objc_msgSend(*(id *)(a1 + 32), "imageCache");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "clearInMemoryCache");

}

void __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_2_575(uint64_t a1)
{
  id *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 56);
  v3 = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = *(_QWORD *)(a1 + 32);
  v12[0] = v3;
  v12[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_3_576;
  v8[3] = &unk_24C5B8BF0;
  objc_copyWeak(&v11, v2);
  v6 = *MEMORY[0x24BDE5E00];
  v7 = *MEMORY[0x24BDE5E20];
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v3, "setViewControllers:type:subtype:duration:completion:", v5, v6, v7, v8, 0.25);

  objc_destroyWeak(&v11);
}

uint64_t __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_3_576(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "clearRectangles");

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "overlayView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 0);

  objc_msgSend(*(id *)(a1 + 32), "hide");
  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 40) + 16))(0.5);
}

void __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_4_577(uint64_t a1)
{
  id v2;
  __int128 v3;
  _QWORD block[4];
  id v5;
  __int128 v6;
  id v7;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_5_578;
  block[3] = &unk_24C5B8C68;
  v5 = *(id *)(a1 + 32);
  objc_copyWeak(&v7, (id *)(a1 + 56));
  v3 = *(_OWORD *)(a1 + 40);
  v2 = (id)v3;
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v7);
}

void __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_5_578(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "imageCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:metaData:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCroppedAndFilteredImageUUID:", v5);

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "saveButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", 1);

  v8 = objc_loadWeakRetained(v2);
  objc_msgSend(v8, "saveButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", 0);

  v10 = objc_loadWeakRetained(v2);
  objc_msgSend(v10, "scrimView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", 1);

  v12 = objc_loadWeakRetained(v2);
  objc_msgSend(v12, "saveButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAlpha:", 1.0);

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_loadWeakRetained(v2);
  objc_msgSend(v15, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "superview");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBackgroundColor:", v14);

  v18 = (void *)MEMORY[0x24BDF6F90];
  v19 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_6;
  v22[3] = &unk_24C5B8BA0;
  objc_copyWeak(&v23, v2);
  v20[0] = v19;
  v20[1] = 3221225472;
  v20[2] = __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_7;
  v20[3] = &unk_24C5B8C40;
  objc_copyWeak(&v21, v2);
  objc_msgSend(v18, "animateWithDuration:animations:completion:", v22, v20, 0.4);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
}

void __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_6(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_7(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "saveAction:", 0);

}

void __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_579(uint64_t a1)
{
  NSObject *v2;
  id v3;
  __int128 v4;
  _QWORD block[4];
  id v6;
  __int128 v7;
  id v8;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_2_580;
  block[3] = &unk_24C5B8C68;
  v2 = *(NSObject **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_copyWeak(&v8, (id *)(a1 + 64));
  v4 = *(_OWORD *)(a1 + 48);
  v3 = (id)v4;
  v7 = v4;
  dispatch_async(v2, block);

  objc_destroyWeak(&v8);
}

void __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_2_580(uint64_t a1)
{
  id v2;
  __int128 v3;
  _QWORD block[4];
  id v5;
  __int128 v6;
  id v7;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_3_581;
  block[3] = &unk_24C5B8C68;
  v5 = *(id *)(a1 + 32);
  objc_copyWeak(&v7, (id *)(a1 + 56));
  v3 = *(_OWORD *)(a1 + 40);
  v2 = (id)v3;
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v7);
}

void __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_3_581(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[24];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "imageCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:metaData:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCroppedAndFilteredImageUUID:", v5);

  v6 = os_log_create("com.apple.documentcamera", ");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "croppedAndFilteredImageUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_3_581_cold_1((uint64_t)v7, v8, buf, v6);
  }

  v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "saveButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", 1);

  v11 = objc_loadWeakRetained(v2);
  objc_msgSend(v11, "saveButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHidden:", 0);

  v13 = objc_loadWeakRetained(v2);
  objc_msgSend(v13, "scrimView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHidden:", 1);

  v15 = (void *)MEMORY[0x24BDF6F90];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_582;
  v16[3] = &unk_24C5B8BA0;
  objc_copyWeak(&v17, v2);
  objc_msgSend(v15, "animateWithDuration:animations:", v16, 0.15);
  objc_destroyWeak(&v17);
}

void __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_582(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "saveButton");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (id)detectRectanglesRequest
{
  id v3;

  if (-[ICDocCamViewController useDocumentSegmentation](self, "useDocumentSegmentation"))
  {
    v3 = objc_alloc_init(MEMORY[0x24BDF9B60]);
  }
  else
  {
    v3 = objc_alloc_init(MEMORY[0x24BDF9B98]);
    -[ICDocCamViewController rectangleMinimumAspectRatio](self, "rectangleMinimumAspectRatio");
    objc_msgSend(v3, "setMinimumAspectRatio:");
    -[ICDocCamViewController rectangleMaximumAspectRatio](self, "rectangleMaximumAspectRatio");
    objc_msgSend(v3, "setMaximumAspectRatio:");
    objc_msgSend(v3, "setMaximumObservations:", -[ICDocCamViewController rectangleMaximumNumber](self, "rectangleMaximumNumber"));
    -[ICDocCamViewController rectangleMinimumConfidence](self, "rectangleMinimumConfidence");
    objc_msgSend(v3, "setMinimumConfidence:");
    -[ICDocCamViewController rectangleQuadratureTolerance](self, "rectangleQuadratureTolerance");
    objc_msgSend(v3, "setQuadratureTolerance:");
    objc_msgSend(v3, "setRequiredVersion:", 2);
  }
  return v3;
}

- (unsigned)imageOrientationFromDevice
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  unsigned int v9;
  unsigned int result;

  -[ICDocCamViewController videoDeviceInput](self, "videoDeviceInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "position");

  -[ICDocCamViewController accelerometer](self, "accelerometer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "currentDeviceOrientation");

  if ((unint64_t)(v7 - 5) <= 1)
    v7 = -[ICDocCamViewController statusBarOrientation](self, "statusBarOrientation");
  switch(v7)
  {
    case 1:
      v8 = v5 == 2;
      v9 = 6;
      goto LABEL_10;
    case 2:
      if (v5 == 2)
        return 5;
      else
        return 8;
    case 3:
      v8 = v5 == 2;
      v9 = 1;
      goto LABEL_10;
    case 4:
      v8 = v5 == 2;
      v9 = 3;
LABEL_10:
      if (v8)
        result = v9 + 1;
      else
        result = v9;
      break;
    default:
      result = 1;
      break;
  }
  return result;
}

- (void)detectRectanglesAndSaveCapturedImage:(__CVBuffer *)a3 metadata:(id)a4 constantColor:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  CGFloat v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGImage *v28;
  size_t Width;
  size_t Height;
  unint64_t v31;
  unint64_t v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  BOOL v37;
  uint64_t v38;
  void *v39;
  float32x4_t v40;
  float32x4_t v41;
  CFDataRef v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  float v49;
  double v50;
  int v51;
  int v52;
  CGFloat v53;
  CGFloat v54;
  int v55;
  CGFloat v56;
  CFDataRef v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  float v72;
  float v73;
  float v74;
  id v75;
  NSObject *v76;
  void *v77;
  void *v78;
  BOOL v79;
  void *v80;
  double v81;
  CGFloat v82;
  double v83;
  CGFloat v84;
  double v85;
  CGFloat v86;
  double v87;
  CGFloat v88;
  void *v89;
  double v90;
  CGFloat v91;
  double v92;
  CGFloat v93;
  double v94;
  CGFloat v95;
  double v96;
  CGFloat v97;
  void *v98;
  BOOL v99;
  void *v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  float v110;
  float v111;
  float v112;
  float v113;
  float v114;
  float v115;
  float v116;
  float v117;
  float v118;
  float v119;
  float v120;
  float v121;
  float v122;
  float v123;
  float v124;
  float v125;
  float v126;
  float v127;
  float v128;
  float v129;
  float v130;
  float v131;
  float v132;
  float v133;
  float v134;
  float v135;
  ICDocCamImageQuad *v136;
  float v137;
  double v138;
  float v139;
  double v140;
  float v141;
  double v142;
  float v143;
  double v144;
  float v145;
  float v146;
  float v147;
  float v148;
  ICDocCamImageQuad *v149;
  void *v150;
  NSObject *v151;
  uint64_t v152;
  void *v153;
  void *v154;
  void *v155;
  BOOL v156;
  uint64_t v157;
  NSObject *v158;
  void *v159;
  void *v160;
  ICDocCamImageQuadEditViewController *v161;
  void *v162;
  void *v163;
  float v164;
  float v165;
  float v166;
  float v167;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  double v175;
  id v176;
  void *v177;
  _BOOL4 v178;
  void *v179;
  id v180;
  uint64_t v181;
  void *v182;
  id v183;
  void *v184;
  _QWORD v185[5];
  id v186;
  id v187;
  id v188;
  BOOL v189;
  _QWORD block[5];
  id v191;
  UInt8 bytes[16];
  __int128 v193;
  __int128 v194;
  CGAffineTransform v195;
  CGAffineTransform v196;
  CGAffineTransform v197;
  void *v198;
  _QWORD v199[2];
  _QWORD v200[2];
  _QWORD v201[2];
  _QWORD v202[5];
  CGRect v203;
  CGRect v204;

  v7 = a5;
  v202[2] = *MEMORY[0x24BDAC8D0];
  v180 = a4;
  v183 = a6;
  v10 = -[ICDocCamViewController imageOrientationFromDevice](self, "imageOrientationFromDevice");
  -[ICDocCamViewController videoPreviewLayer](self, "videoPreviewLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "videoOrientation");

  -[ICDocCamViewController accelerometer](self, "accelerometer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "currentDeviceOrientation");

  if ((unint64_t)(v15 - 1) >= 4)
    v16 = v13;
  else
    v16 = v15;
  v17 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v197.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v197.c = v17;
  *(_OWORD *)&v197.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  if (v16 == 1)
  {
    CGAffineTransformMakeRotation(&v197, -1.57079633);
  }
  else
  {
    if (v16 == 2)
    {
      v18 = 1.57079633;
    }
    else if (v16 == 4)
    {
      v18 = -3.14159265;
    }
    else
    {
      v18 = 0.0;
    }
    CGAffineTransformMakeRotation(&v196, v18);
    v197 = v196;
  }
  objc_msgSend(MEMORY[0x24BDBF660], "imageWithCVPixelBuffer:", a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v178 = v7;
  v195 = v197;
  objc_msgSend(v19, "imageByApplyingTransform:", &v195);
  v184 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v184, "extent");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  -[ICDocCamViewController sharedCoreImageContext](self, "sharedCoreImageContext");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (CGImage *)objc_msgSend(v177, "createCGImage:fromRect:", v184, v21, v23, v25, v27);
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  v31 = Height;
  if (Width <= Height)
    v32 = Height;
  else
    v32 = Width;
  -[ICDocCamViewController streamingImageSize](self, "streamingImageSize");
  v34 = v33;
  -[ICDocCamViewController streamingImageSize](self, "streamingImageSize");
  if (v34 < v35)
    v34 = v35;
  -[ICDocCamViewController cameraIntrinsicData](self, "cameraIntrinsicData");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36 == 0;

  *(float *)&v38 = (float)v32 / (float)(unint64_t)v34;
  v181 = v38;
  if (v37)
  {
    memset(&v196, 0, sizeof(v196));
    v46 = (void *)objc_opt_class();
    -[ICDocCamViewController pixelFocalLength](self, "pixelFocalLength");
    *(float *)&v47 = (float)v31;
    HIDWORD(v48) = HIDWORD(v181);
    *(float *)&v48 = *(float *)&v181 * v49;
    *(float *)&v50 = (float)Width;
    objc_msgSend(v46, "cameraIntrinsicMatrixForWidth:height:pixelFocalLength:", v50, v47, v48);
    LODWORD(v196.b) = v51;
    LODWORD(v196.d) = v52;
    v196.a = v53;
    v196.c = v54;
    LODWORD(v196.ty) = v55;
    v196.tx = v56;
    v57 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)&v196, 48);
    v58 = *MEMORY[0x24BDF9F40];
    v200[0] = v57;
    v59 = *MEMORY[0x24BDF9F38];
    v199[0] = v58;
    v199[1] = v59;
    -[ICDocCamViewController sharedCoreImageContext](self, "sharedCoreImageContext");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v200[1] = v60;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v200, v199, 2);
    v182 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ICDocCamViewController cameraIntrinsicData](self, "cameraIntrinsicData");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "getBytes:length:", &v196, 48);

    *(_OWORD *)bytes = 0u;
    v193 = 0u;
    v194 = 0u;
    v40 = vmulq_n_f32(*(float32x4_t *)&v196.a, *(float *)&v181);
    v41 = vmulq_n_f32(*(float32x4_t *)&v196.c, *(float *)&v181);
    *(_DWORD *)&bytes[8] = v40.i32[2];
    DWORD2(v193) = v41.i32[2];
    *(_QWORD *)bytes = v40.i64[0];
    *(_QWORD *)&v193 = v41.i64[0];
    DWORD2(v194) = 1065353216;
    *(_QWORD *)&v194 = vmulq_n_f32(*(float32x4_t *)&v196.tx, *(float *)&v181).u64[0];
    v42 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], bytes, 48);
    v43 = *MEMORY[0x24BDF9F40];
    v202[0] = v42;
    v44 = *MEMORY[0x24BDF9F38];
    v201[0] = v43;
    v201[1] = v44;
    -[ICDocCamViewController sharedCoreImageContext](self, "sharedCoreImageContext");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v202[1] = v45;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v202, v201, 2);
    v182 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v179 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF9C28]), "initWithCVPixelBuffer:orientation:options:", a3, v10, v182);
  -[ICDocCamViewController detectRectanglesRequest](self, "detectRectanglesRequest");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v198 = v61;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v198, 1);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v191 = 0;
  v63 = objc_msgSend(v179, "performRequests:error:", v62, &v191);
  v176 = v191;

  objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:", v28);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "results");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(-[ICDocCamViewController statusBarOrientation](self, "statusBarOrientation") - 3) > 1)
  {
    objc_msgSend(v64, "size");
    v68 = v69;
    objc_msgSend(v64, "size");
    v66 = v70;
  }
  else
  {
    objc_msgSend(v64, "size");
    v68 = v67;
  }
  if (-[ICDocCamViewController validRect:forImageSize:](self, "validRect:forImageSize:", v65, v68, v66))
  {
    if (!-[ICDocCamViewController useDocumentSegmentation](self, "useDocumentSegmentation")
      || (objc_msgSend(v65, "objectAtIndexedSubscript:", 0),
          v71 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v71, "confidence"),
          v73 = v72,
          v71,
          -[ICDocCamViewController segmentMinimumVisualConfidenceFinalScan](self, "segmentMinimumVisualConfidenceFinalScan"), v75 = 0, v73 < 0.99999)&& v73 > v74)
    {
      v75 = v65;
    }
  }
  else
  {
    v75 = 0;
  }
  -[ICDocCamViewController lastHighConfidenceRectangle](self, "lastHighConfidenceRectangle");
  v76 = objc_claimAutoreleasedReturnValue();
  if (v76)
  {
    -[ICDocCamViewController overlayView](self, "overlayView");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v77, "rectangleIsActive") & 1) == 0)
    {

LABEL_37:
      goto LABEL_38;
    }
    objc_msgSend(v75, "firstObject");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v78 == 0;

    if (!v79)
    {
      -[ICDocCamViewController lastHighConfidenceRectangle](self, "lastHighConfidenceRectangle");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "boundingBox");
      v82 = v81;
      v84 = v83;
      v86 = v85;
      v88 = v87;

      objc_msgSend(v75, "firstObject");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "boundingBox");
      v91 = v90;
      v93 = v92;
      v95 = v94;
      v97 = v96;

      v203.origin.x = v82;
      v203.origin.y = v84;
      v203.size.width = v86;
      v203.size.height = v88;
      v204.origin.x = v91;
      v204.origin.y = v93;
      v204.size.width = v95;
      v204.size.height = v97;
      if (!CGRectIntersectsRect(v203, v204))
      {

        v76 = os_log_create("com.apple.documentcamera", ");
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v196.a) = 0;
          _os_log_impl(&dword_20CE8E000, v76, OS_LOG_TYPE_DEFAULT, "The detected rectangle doesn't intersect with the last visible rectangle", (uint8_t *)&v196, 2u);
        }
        v75 = 0;
        goto LABEL_37;
      }
    }
  }
LABEL_38:
  if (v63
    && -[ICDocCamViewController autoMode](self, "autoMode")
    && -[ICDocCamViewController snapStillImageMode](self, "snapStillImageMode") == 1
    && (objc_msgSend(v75, "firstObject"),
        v98 = (void *)objc_claimAutoreleasedReturnValue(),
        v99 = v98 == 0,
        v98,
        !v99))
  {
    if (-[ICDocCamViewController useDocumentSegmentation](self, "useDocumentSegmentation"))
    {
      objc_msgSend(v75, "objectAtIndexedSubscript:", 0);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "topLeft");
      v174 = v101;
      v175 = v102;
      objc_msgSend(v100, "topRight");
      v172 = v103;
      v173 = v104;
      objc_msgSend(v100, "bottomLeft");
      v171 = v105;
      v107 = v106;
      objc_msgSend(v100, "bottomRight");
      v110 = v172;
      v168 = v108;
      v169 = v107;
      v111 = v108;
      if (v110 >= v111)
        v112 = v172;
      else
        v112 = v108;
      v113 = v174;
      v114 = v171;
      if (v114 < v113)
        v113 = v171;
      v166 = v113;
      v167 = v112;
      v115 = v175;
      v116 = v173;
      if (v115 >= v116)
        v117 = v175;
      else
        v117 = v173;
      v118 = v107;
      v170 = v109;
      v119 = v109;
      if (v119 < v118)
        v118 = v119;
      v164 = v118;
      v165 = v117;
      -[ICDocCamViewController segmentationFudgeFactor](self, "segmentationFudgeFactor");
      v121 = v120;
      -[ICDocCamViewController segmentationFudgeFactor](self, "segmentationFudgeFactor");
      v123 = v122;
      -[ICDocCamViewController segmentationFudgeFactor](self, "segmentationFudgeFactor");
      v125 = v124;
      -[ICDocCamViewController segmentationFudgeFactor](self, "segmentationFudgeFactor");
      v127 = v126;
      -[ICDocCamViewController segmentationFudgeFactor](self, "segmentationFudgeFactor");
      v129 = v128;
      -[ICDocCamViewController segmentationFudgeFactor](self, "segmentationFudgeFactor");
      v131 = v130;
      -[ICDocCamViewController segmentationFudgeFactor](self, "segmentationFudgeFactor");
      v133 = v132;
      -[ICDocCamViewController segmentationFudgeFactor](self, "segmentationFudgeFactor");
      v135 = v134;
      v136 = [ICDocCamImageQuad alloc];
      v137 = v174 - (float)((float)(v167 - v166) * v121);
      v138 = fmaxf(v137, 0.0001);
      v139 = v175 + (float)((float)(v165 - v164) * v123);
      v140 = fminf(v139, 0.9999);
      v141 = v172 + (float)((float)(v167 - v166) * v125);
      v142 = fminf(v141, 0.9999);
      v143 = v173 + (float)((float)(v165 - v164) * v127);
      v144 = fminf(v143, 0.9999);
      v145 = v171 - (float)((float)(v167 - v166) * v129);
      v146 = v169 - (float)((float)(v165 - v164) * v131);
      v147 = v168 + (float)((float)(v167 - v166) * v133);
      v148 = v170 - (float)((float)(v165 - v164) * v135);
      v149 = -[ICDocCamImageQuad initWithBottomLeft:bottomRight:topLeft:topRight:](v136, "initWithBottomLeft:bottomRight:topLeft:topRight:", fmaxf(v145, 0.0001), fmaxf(v146, 0.0001), fminf(v147, 0.9999), fmaxf(v148, 0.0001), v138, v140, v142, v144);
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v150, "addObject:", v149);
      -[ICDocCamViewController saveCapturedImage:metaData:rects:constantColor:completionHandler:](self, "saveCapturedImage:metaData:rects:constantColor:completionHandler:", v64, v180, v150, v178, v183);

    }
    else
    {
      -[ICDocCamViewController saveCapturedImage:metaData:rects:constantColor:completionHandler:](self, "saveCapturedImage:metaData:rects:constantColor:completionHandler:", v64, v180, v75, v178, v183);
    }
  }
  else
  {
    -[ICDocCamViewController snapshotSpinnerQueue](self, "snapshotSpinnerQueue");
    v151 = objc_claimAutoreleasedReturnValue();
    v152 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __104__ICDocCamViewController_detectRectanglesAndSaveCapturedImage_metadata_constantColor_completionHandler___block_invoke;
    block[3] = &unk_24C5B89B0;
    block[4] = self;
    dispatch_sync(v151, block);

    objc_msgSend(v75, "firstObject");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICDocCamImageQuad quadFromVNRectangle:](ICDocCamImageQuad, "quadFromVNRectangle:", v153);
    v154 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v154)
    {
      -[ICDocCamViewController backupQuad](self, "backupQuad");
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      v156 = v155 == 0;

      if (v156)
      {
        v154 = 0;
      }
      else
      {
        -[ICDocCamViewController backupQuad](self, "backupQuad");
        v157 = objc_claimAutoreleasedReturnValue();
        v158 = os_log_create("com.apple.documentcamera", ");
        if (os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v196.a) = 0;
          _os_log_impl(&dword_20CE8E000, v158, OS_LOG_TYPE_DEFAULT, "No Quad found in image, falling back to visible quad at shutter press", (uint8_t *)&v196, 2u);
        }

        v154 = (void *)v157;
      }
    }
    -[ICDocCamViewController userPromptView](self, "userPromptView");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v159, "setHidden:", 1);

    v185[0] = v152;
    v185[1] = 3221225472;
    v185[2] = __104__ICDocCamViewController_detectRectanglesAndSaveCapturedImage_metadata_constantColor_completionHandler___block_invoke_586;
    v185[3] = &unk_24C5B8D08;
    v185[4] = self;
    v186 = v75;
    v189 = v178;
    v187 = v180;
    v188 = v183;
    v160 = (void *)MEMORY[0x212B988FC](v185);
    v161 = -[ICDocCamImageQuadEditViewController initWithImage:quad:scanDataDelegate:orientation:completionHandler:]([ICDocCamImageQuadEditViewController alloc], "initWithImage:quad:scanDataDelegate:orientation:completionHandler:", v64, v154, 0, 0, v160);
    -[ICDocCamImageQuadEditViewController setInCaptureMode:](v161, "setInCaptureMode:", 1);
    -[ICDocCamViewController setUseCustomRecropTransition:](self, "setUseCustomRecropTransition:", 0);
    -[ICDocCamViewController navigationController](self, "navigationController");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "setDelegate:", 0);

    -[ICDocCamImageQuadEditViewController navigationController](v161, "navigationController");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v163, "setDelegate:", 0);

    -[ICDocCamViewController pushViewController:type:subtype:duration:completion:](self, "pushViewController:type:subtype:duration:completion:", v161, *MEMORY[0x24BDE5E00], *MEMORY[0x24BDE5E20], 0, 0.5);
  }
  CGImageRelease(v28);
  -[ICDocCamViewController setBackupQuad:](self, "setBackupQuad:", 0);

}

void __104__ICDocCamViewController_detectRectanglesAndSaveCapturedImage_metadata_constantColor_completionHandler___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __104__ICDocCamViewController_detectRectanglesAndSaveCapturedImage_metadata_constantColor_completionHandler___block_invoke_2;
  block[3] = &unk_24C5B89B0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __104__ICDocCamViewController_detectRectanglesAndSaveCapturedImage_metadata_constantColor_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setAwaitingSnapshotCompletion:", 0);
  objc_msgSend(*(id *)(a1 + 32), "snapshotSpinner");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hide");

}

void __104__ICDocCamViewController_detectRectanglesAndSaveCapturedImage_metadata_constantColor_completionHandler___block_invoke_586(uint64_t a1, char a2, void *a3, void *a4, int a5)
{
  id v9;
  id v10;
  void *v11;
  ICDocCamDocumentInfo *v12;
  void *v13;
  ICDocCamDocumentInfo *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  char v39;
  id location;
  _QWORD block[5];
  _QWORD v42[2];

  v42[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  if (a5)
  {
    objc_msgSend(*(id *)(a1 + 32), "cropAndFilterImage:rects:filterType:constantColor:", v9, *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "defaultFilter"), *(unsigned __int8 *)(a1 + 64));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = [ICDocCamDocumentInfo alloc];
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[ICDocCamDocumentInfo initWithDelegate:](v12, "initWithDelegate:", v13);

    -[ICDocCamDocumentInfo setCurrentFilter:](v14, "setCurrentFilter:", objc_msgSend(*(id *)(a1 + 32), "defaultFilter"));
    -[ICDocCamDocumentInfo setMetaData:](v14, "setMetaData:", *(_QWORD *)(a1 + 48));
    -[ICDocCamDocumentInfo setImageQuad:](v14, "setImageQuad:", v10);
    -[ICDocCamDocumentInfo setMeshAnimImageUUID:](v14, "setMeshAnimImageUUID:", 0);
    objc_msgSend(*(id *)(a1 + 32), "imageCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setImage:metaData:", v11, *(_QWORD *)(a1 + 48));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamDocumentInfo setCroppedAndFilteredImageUUID:](v14, "setCroppedAndFilteredImageUUID:", v16);

    -[ICDocCamDocumentInfo setCroppedButNotFilteredImageUUID:](v14, "setCroppedButNotFilteredImageUUID:", 0);
    objc_msgSend(*(id *)(a1 + 32), "imageCache");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setImage:metaData:", v9, *(_QWORD *)(a1 + 48));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamDocumentInfo setFullImageUUID:](v14, "setFullImageUUID:", v18);

    -[ICDocCamDocumentInfo setConstantColor:](v14, "setConstantColor:", *(unsigned __int8 *)(a1 + 64));
    objc_msgSend(*(id *)(a1 + 32), "documentInfoCollection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "docInfos");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v14);

    objc_msgSend(*(id *)(a1 + 32), "saveButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setHidden:", 0);

    objc_msgSend(*(id *)(a1 + 32), "documentInfoCollection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bumpModificationDate");

    objc_msgSend(*(id *)(a1 + 32), "snapshotSpinnerQueue");
    v23 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __104__ICDocCamViewController_detectRectanglesAndSaveCapturedImage_metadata_constantColor_completionHandler___block_invoke_2_587;
    block[3] = &unk_24C5B89B0;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_sync(v23, block);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "clearRectangles");
    if ((a2 & 1) != 0)
    {
      if ((objc_msgSend(*(id *)(a1 + 32), "isInRetakeMode") & 1) != 0)
      {
        v24 = *(void **)(a1 + 32);
        v25 = *(_QWORD *)(a1 + 48);
        v42[0] = v10;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "saveCapturedImage:metaData:rects:constantColor:completionHandler:", v9, v25, v26, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));

      }
      else
      {
        objc_initWeak(&location, *(id *)(a1 + 32));
        v30 = MEMORY[0x24BDAC760];
        v31 = 3221225472;
        v32 = __104__ICDocCamViewController_detectRectanglesAndSaveCapturedImage_metadata_constantColor_completionHandler___block_invoke_4;
        v33 = &unk_24C5B8CE0;
        objc_copyWeak(&v38, &location);
        v34 = v9;
        v35 = *(id *)(a1 + 48);
        v36 = v10;
        v39 = *(_BYTE *)(a1 + 64);
        v37 = *(id *)(a1 + 56);
        objc_msgSend(*(id *)(a1 + 32), "setSessionStartNotificationBlock:", &v30);
        objc_msgSend(*(id *)(a1 + 32), "previewView", v30, v31, v32, v33);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "layer");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v29) = 1.0;
        objc_msgSend(v28, "setOpacity:", v29);

        objc_msgSend(*(id *)(a1 + 32), "restartImageCaptureSessionIfNecessary");
        objc_destroyWeak(&v38);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      (*(void (**)(double))(*(_QWORD *)(a1 + 56) + 16))(1.0);
      objc_msgSend(*(id *)(a1 + 32), "popViewController:subtype:duration:completion:", *MEMORY[0x24BDE5E00], *MEMORY[0x24BDE5E20], 0, 0.5);
      objc_msgSend(*(id *)(a1 + 32), "retakeButtonWasPressed");
    }
  }

}

void __104__ICDocCamViewController_detectRectanglesAndSaveCapturedImage_metadata_constantColor_completionHandler___block_invoke_2_587(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __104__ICDocCamViewController_detectRectanglesAndSaveCapturedImage_metadata_constantColor_completionHandler___block_invoke_3;
  block[3] = &unk_24C5B89B0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __104__ICDocCamViewController_detectRectanglesAndSaveCapturedImage_metadata_constantColor_completionHandler___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setAwaitingSnapshotCompletion:", 0);
  objc_msgSend(*(id *)(a1 + 32), "snapshotSpinner");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hide");

}

void __104__ICDocCamViewController_detectRectanglesAndSaveCapturedImage_metadata_constantColor_completionHandler___block_invoke_4(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "popViewController:subtype:duration:completion:", *MEMORY[0x24BDE5E00], *MEMORY[0x24BDE5E20], 0, 0.28);

  v4 = objc_loadWeakRetained(v2);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8[0] = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "saveCapturedImage:metaData:rects:constantColor:completionHandler:", v5, v6, v7, *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 56));

}

- (void)snapStillImageWithMode:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  char v7;
  ICDocCamViewController *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[6];
  _QWORD block[5];

  v5 = os_log_create("com.apple.documentcamera", ");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICDocCamViewController snapStillImageWithMode:].cold.3();

  -[ICDocCamViewController processRequestsBlocker](self, "processRequestsBlocker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "blocked");

  if ((v7 & 1) == 0)
  {
    v8 = self;
    objc_sync_enter(v8);
    -[ICDocCamViewController snapStillImageBlocker](v8, "snapStillImageBlocker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "blocked");

    if ((v10 & 1) != 0)
    {
      objc_sync_exit(v8);

    }
    else
    {
      -[ICDocCamViewController snapStillImageBlocker](v8, "snapStillImageBlocker");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addBlockerOfType:clearRectangles:clearQueue:", CFSTR("SnapStillImageBlocker"), 0, 1);

      -[ICDocCamViewController processRequestsBlocker](v8, "processRequestsBlocker");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addBlockerOfType:clearRectangles:clearQueue:", CFSTR("SnapshotDelayBlocker"), 0, 0);

      objc_sync_exit(v8);
      -[ICDocCamViewController inProgressPhotoCaptureDelegates](v8, "inProgressPhotoCaptureDelegates");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      v15 = os_log_create("com.apple.documentcamera", ");
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
      if (v14)
      {
        if (v16)
          -[ICDocCamViewController snapStillImageWithMode:].cold.2();

        -[ICDocCamViewController clearQueue](v8, "clearQueue");
      }
      else
      {
        if (v16)
          -[ICDocCamViewController snapStillImageWithMode:].cold.1();

        -[ICDocCamViewController setSnapStillImageMode:](v8, "setSnapStillImageMode:", a3);
        v17 = MEMORY[0x24BDAC760];
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __49__ICDocCamViewController_snapStillImageWithMode___block_invoke;
        block[3] = &unk_24C5B89B0;
        block[4] = v8;
        dispatch_async(MEMORY[0x24BDAC9B8], block);
        -[ICDocCamViewController videoPreviewLayer](v8, "videoPreviewLayer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "connection");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "videoOrientation");

        -[ICDocCamViewController sessionQueue](v8, "sessionQueue");
        v21 = objc_claimAutoreleasedReturnValue();
        v23[0] = v17;
        v23[1] = 3221225472;
        v23[2] = __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_2;
        v23[3] = &unk_24C5B8B00;
        v23[4] = v8;
        v23[5] = v20;
        dispatch_async(v21, v23);

        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICDocCamViewController setLastAXPositionAnnouncementDate:](v8, "setLastAXPositionAnnouncementDate:", v22);

      }
    }
  }
}

uint64_t __49__ICDocCamViewController_snapStillImageWithMode___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setAnimationDuration:", 0.2);
  objc_msgSend(*(id *)(a1 + 32), "enableShutter:", 0);
  return objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

void __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  int v17;
  void *v18;
  unint64_t v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  ICDocCamPhotoCaptureDelegate *v28;
  uint64_t v29;
  uint64_t v30;
  ICDocCamPhotoCaptureDelegate *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  dispatch_time_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  int v40;
  NSObject *v41;
  void *v42;
  _QWORD block[5];
  _QWORD v44[5];
  id v45;
  _QWORD v46[5];
  id location;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  _QWORD v51[3];

  v51[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "photoOutput");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectionWithMediaType:", *MEMORY[0x24BDB1D50]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setVideoOrientation:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(v3, "isCameraIntrinsicMatrixDeliverySupported"))
    objc_msgSend(v3, "setCameraIntrinsicMatrixDeliveryEnabled:", 1);
  objc_msgSend(*(id *)(a1 + 32), "photoOutput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isFlashScene") & 1) != 0)
  {

LABEL_6:
    v6 = (void *)MEMORY[0x24BDB24C8];
    v48 = *MEMORY[0x24BDC56B8];
    v49 = &unk_24C5D82C8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "photoSettingsWithFormat:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "photoOutput");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "supportedFlashModes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    for (i = 0; objc_msgSend(v10, "count") > i; ++i)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "integerValue");
      LODWORD(v13) = v13 == objc_msgSend(*(id *)(a1 + 32), "flashMode");

      if ((_DWORD)v13)
        objc_msgSend(v8, "setFlashMode:", objc_msgSend(*(id *)(a1 + 32), "flashMode"));
    }
    if (objc_msgSend(*(id *)(a1 + 32), "flashMode")
      && objc_msgSend(*(id *)(a1 + 32), "isConstantColorAvailable"))
    {
      objc_msgSend(v8, "setConstantColorEnabled:", 1);
      objc_msgSend(v8, "setConstantColorFallbackPhotoDeliveryEnabled:", 1);
    }
    goto LABEL_19;
  }
  v5 = objc_msgSend(*(id *)(a1 + 32), "flashMode");

  if (v5 == 1)
    goto LABEL_6;
  v14 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(*(id *)(a1 + 32), "photoOutput");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "arrayWithCapacity:", objc_msgSend(v15, "maxBracketedCapturePhotoCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  v17 = *MEMORY[0x24BDB1A88];
  while (1)
  {
    objc_msgSend(*(id *)(a1 + 32), "photoOutput");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "maxBracketedCapturePhotoCount");

    if (v19 <= v16)
      break;
    LODWORD(v20) = v17;
    objc_msgSend(MEMORY[0x24BDB2440], "autoExposureSettingsWithExposureTargetBias:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v21);

    ++v16;
  }
  v22 = (void *)MEMORY[0x24BDB24B8];
  v50 = *MEMORY[0x24BDC56B8];
  v51[0] = &unk_24C5D82C8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "photoBracketSettingsWithRawPixelFormatType:processedFormat:bracketedSettings:", 0, v23, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "photoOutput");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isLensStabilizationDuringBracketedCaptureSupported");

  if (v25)
    objc_msgSend(v8, "setLensStabilizationEnabled:", 1);
LABEL_19:

  objc_msgSend(v8, "setHighResolutionPhotoEnabled:", 1);
  objc_msgSend(v8, "setPreviewPhotoFormat:", 0);
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "BOOLForKey:", CFSTR("internalSettings.docCam.imageStabilization.disabled"));

  if (v27)
    objc_msgSend(v8, "setPhotoQualityPrioritization:", 1);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v28 = [ICDocCamPhotoCaptureDelegate alloc];
  v29 = MEMORY[0x24BDAC760];
  v46[0] = MEMORY[0x24BDAC760];
  v46[1] = 3221225472;
  v30 = *(_QWORD *)(a1 + 32);
  v46[2] = __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_3;
  v46[3] = &unk_24C5B89B0;
  v46[4] = v30;
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_6;
  v44[3] = &unk_24C5B8DA8;
  objc_copyWeak(&v45, &location);
  v44[4] = *(_QWORD *)(a1 + 32);
  v31 = -[ICDocCamPhotoCaptureDelegate initWithRequestedPhotoSettings:willCapturePhotoAnimation:completed:](v28, "initWithRequestedPhotoSettings:willCapturePhotoAnimation:completed:", v8, v46, v44);
  objc_msgSend(*(id *)(a1 + 32), "inProgressPhotoCaptureDelegates");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)MEMORY[0x24BDD16E0];
  -[ICDocCamPhotoCaptureDelegate requestedPhotoSettings](v31, "requestedPhotoSettings");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "numberWithLongLong:", objc_msgSend(v34, "uniqueID"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setObject:forKeyedSubscript:", v31, v35);

  objc_msgSend(*(id *)(a1 + 32), "setAwaitingSnapshotCompletion:", 1);
  v36 = dispatch_time(0, 0);
  objc_msgSend(*(id *)(a1 + 32), "snapshotSpinnerQueue");
  v37 = objc_claimAutoreleasedReturnValue();
  block[0] = v29;
  block[1] = 3221225472;
  block[2] = __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_598;
  block[3] = &unk_24C5B89B0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v36, v37, block);

  objc_msgSend(*(id *)(a1 + 32), "photoOutput");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v38, "isConstantColorSupported"))
    goto LABEL_27;
  objc_msgSend(*(id *)(a1 + 32), "photoOutput");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v39, "isConstantColorEnabled") & 1) == 0)
  {

LABEL_27:
    goto LABEL_28;
  }
  v40 = objc_msgSend(v8, "isConstantColorEnabled");

  if (v40)
  {
    v41 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_2_cold_1();
    goto LABEL_30;
  }
LABEL_28:
  v41 = os_log_create("com.apple.documentcamera", ");
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_2_cold_2();
LABEL_30:

  objc_msgSend(*(id *)(a1 + 32), "photoOutput");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "capturePhotoWithSettings:delegate:", v8, v31);

  objc_destroyWeak(&v45);
  objc_destroyWeak(&location);

}

void __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_3(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_4;
  block[3] = &unk_24C5B89B0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_4(uint64_t a1)
{
  void *v2;
  double v3;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "videoPreviewLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = 0;
  objc_msgSend(v2, "setOpacity:", v3);

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_5;
  v5[3] = &unk_24C5B89B0;
  v5[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v5, 0.25);
}

void __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_5(uint64_t a1)
{
  void *v1;
  double v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "videoPreviewLayer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = 1.0;
  v3 = v1;
  objc_msgSend(v1, "setOpacity:", v2);

}

void __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_6(uint64_t a1, void *a2, __CVBuffer *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (**v18)(_QWORD, double);
  NSObject *v19;
  _QWORD v20[8];

  v9 = a2;
  v10 = a4;
  v11 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(v11, "objectForKey:", CFSTR("constantColorPhoto"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    objc_msgSend(v9, "requestedPhotoSettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "uniqueID");

    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_7;
    v20[3] = &unk_24C5B8D80;
    v17 = *(_QWORD *)(a1 + 32);
    v20[4] = WeakRetained;
    v20[5] = v17;
    v20[6] = a3;
    v20[7] = v16;
    v18 = (void (**)(_QWORD, double))MEMORY[0x212B988FC](v20);
    CVPixelBufferRetain(a3);
    if (a3)
    {
      objc_msgSend(*(id *)(a1 + 32), "detectRectanglesAndSaveCapturedImage:metadata:constantColor:completionHandler:", a3, v10, v14, v18);
    }
    else
    {
      v19 = os_log_create("com.apple.documentcamera", ");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_6_cold_1();

      v18[2](v18, 0.5);
    }

  }
}

void __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_7(uint64_t a1, double a2)
{
  NSObject *v4;
  _QWORD v5[4];
  int8x16_t v6;
  double v7;
  uint64_t v8;

  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "sessionQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_8;
  v5[3] = &unk_24C5B8D58;
  v7 = a2;
  v6 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  v8 = *(_QWORD *)(a1 + 56);
  dispatch_async(v4, v5);

}

void __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_8(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  __int128 v4;
  uint64_t v5;

  v2 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_9;
  block[3] = &unk_24C5B8D30;
  v4 = *(_OWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 56);
  dispatch_after(v2, MEMORY[0x24BDAC9B8], block);
}

void __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_9(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  dispatch_time_t v11;
  uint64_t v12;
  _QWORD v13[6];
  _QWORD v14[5];
  _QWORD v15[4];
  uint64_t v16;

  objc_msgSend(*(id *)(a1 + 32), "setSnapStillImageMode:", 0);
  objc_msgSend(*(id *)(a1 + 32), "enableShutterButtonIfPossible");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "documentInfoCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "docInfos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v2, "documentCameraController:canAddImages:", v3, objc_msgSend(v5, "count") + 1);

  v6 = MEMORY[0x24BDAC760];
  if ((_DWORD)v3 && objc_msgSend(*(id *)(a1 + 32), "autoMode"))
  {
    +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Ready for next scan."), CFSTR("Ready for next scan."), CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "userPromptLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v7);

    objc_msgSend(*(id *)(a1 + 32), "userPromptView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 0);

    objc_msgSend(*(id *)(a1 + 32), "userPromptView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAlpha:", 0.0);

    v15[1] = 3221225472;
    v15[2] = __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_10;
    v15[3] = &unk_24C5B89B0;
    v16 = *(_QWORD *)(a1 + 32);
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_11;
    v14[3] = &unk_24C5B8A68;
    v14[4] = v16;
    v15[0] = v6;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 0, v15, v14, 0.2, 0.0);
  }
  v11 = dispatch_time(0, 300000000);
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_13;
  v13[3] = &unk_24C5B8B00;
  v12 = *(_QWORD *)(a1 + 48);
  v13[4] = *(_QWORD *)(a1 + 40);
  v13[5] = v12;
  dispatch_after(v11, MEMORY[0x24BDAC9B8], v13);
}

void __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_10(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "userPromptView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_11(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "setHideUserPrompt:", 0);
  v2 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_12;
  block[3] = &unk_24C5B89B0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x24BDAC9B8], block);
}

void __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_12(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "userPromptLabel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v1);

}

void __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_13(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "inProgressPhotoCaptureDelegates");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, v2);

  objc_msgSend(*(id *)(a1 + 32), "snapStillImageBlocker");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeBlockerOfType:", CFSTR("SnapStillImageBlocker"));

  objc_msgSend(*(id *)(a1 + 32), "processRequestsBlocker");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeBlockerOfType:", CFSTR("SnapshotDelayBlocker"));

}

void __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_598(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_2_599;
  block[3] = &unk_24C5B89B0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_2_599(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "awaitingSnapshotCompletion"))
  {
    objc_msgSend(*(id *)(a1 + 32), "snapshotSpinner");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "show");

  }
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __CVBuffer *ImageBuffer;
  size_t Width;
  CFDictionaryRef v22;
  CFTypeRef v23;
  void *v24;
  void *v25;
  void *v26;
  CVImageBufferRef v27;
  uint64_t v28;
  CFDictionaryRef v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  CMTime v34;
  CMTime buf[2];
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  if (-[ICDocCamViewController scanMovieRecordingEnabled](self, "scanMovieRecordingEnabled"))
  {
    -[ICDocCamViewController movieController](self, "movieController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recordFrame:fromConnection:", a4, v7);

  }
  -[ICDocCamViewController setCameraIntrinsicData:](self, "setCameraIntrinsicData:", 0);
  if (!objc_msgSend(v7, "isCameraIntrinsicMatrixDeliverySupported"))
  {
    v11 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0].value) = 0;
      _os_log_impl(&dword_20CE8E000, v11, OS_LOG_TYPE_INFO, "Camera intrinsic matrix delivery is not supported.", (uint8_t *)buf, 2u);
    }
    goto LABEL_12;
  }
  if (!objc_msgSend(v7, "isCameraIntrinsicMatrixDeliveryEnabled"))
  {
    v11 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0].value) = 0;
      _os_log_impl(&dword_20CE8E000, v11, OS_LOG_TYPE_INFO, "Camera intrinsic matrix delivery is disabled.", (uint8_t *)buf, 2u);
    }
LABEL_12:

    goto LABEL_13;
  }
  -[ICDocCamViewController setCameraIntrinsicData:](self, "setCameraIntrinsicData:", CMGetAttachment(a4, (CFStringRef)*MEMORY[0x24BDC0CD8], 0));
  -[ICDocCamViewController cameraIntrinsicData](self, "cameraIntrinsicData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[ICDocCamViewController cameraIntrinsicData](self, "cameraIntrinsicData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "getBytes:length:", buf, 48);

  }
LABEL_13:
  if (a4)
  {
    if (-[ICDocCamViewController adjustingFocus](self, "adjustingFocus"))
      goto LABEL_15;
    -[ICDocCamViewController processRequestsBlocker](self, "processRequestsBlocker");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "blocked");

    if ((v13 & 1) != 0)
      goto LABEL_26;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController lastSubjectAreaChange](self, "lastSubjectAreaChange");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", v15);
    v17 = v16;

    if (v17 < 1.0)
    {
LABEL_15:
      -[ICDocCamViewController clearRectangles](self, "clearRectangles");
      -[ICDocCamViewController clearQueue](self, "clearQueue");
    }
    else
    {
      -[ICDocCamViewController streamingImageSize](self, "streamingImageSize");
      if (v19 == *MEMORY[0x24BDBF148] && v18 == *(double *)(MEMORY[0x24BDBF148] + 8))
      {
        ImageBuffer = CMSampleBufferGetImageBuffer(a4);
        CVPixelBufferLockBaseAddress(ImageBuffer, 0);
        Width = CVPixelBufferGetWidth(ImageBuffer);
        -[ICDocCamViewController setStreamingImageSize:](self, "setStreamingImageSize:", (double)Width, (double)CVPixelBufferGetHeight(ImageBuffer));
        CVPixelBufferUnlockBaseAddress(ImageBuffer, 0);
      }
      v22 = CMCopyDictionaryOfAttachments(0, a4, 1u);
      v23 = CMGetAttachment(a4, (CFStringRef)*MEMORY[0x24BDC0CD8], 0);
      -[__CFDictionary valueForKey:](v22, "valueForKey:", *MEMORY[0x24BE107E8]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v24)
      {
        objc_msgSend(v24, "valueForKey:", *MEMORY[0x24BE10D28]);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "floatValue");
        -[ICDocCamViewController setPixelFocalLength:](self, "setPixelFocalLength:");

      }
      v27 = CMSampleBufferGetImageBuffer(a4);
      if (v27)
      {
        memset(buf, 0, 24);
        CMSampleBufferGetOutputPresentationTimeStamp(buf, a4);
        v28 = -[ICDocCamViewController imageOrientationFromDevice](self, "imageOrientationFromDevice");
        v36[0] = CFSTR("ICDocCamImageSequenceFrame_Timestamp");
        v34 = buf[0];
        v29 = CMTimeCopyAsDictionary(&v34, 0);
        v37[0] = v29;
        v36[1] = CFSTR("ICDocCamImageSequenceFrame_Orientation");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v37[1] = v30;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        -[ICDocCamViewController detectRectanglesRequest](self, "detectRectanglesRequest");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICDocCamViewController vkAnalyzer](self, "vkAnalyzer");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICDocCamViewController pixelFocalLength](self, "pixelFocalLength");
        objc_msgSend(v33, "addFrame:metaData:frameOptions:rectangleRequest:pixelFocalLength:cameraIntrinsicData:", v27, v22, v31, v32, v23);

      }
    }
  }
LABEL_26:

}

- (void)clearRectangles
{
  id v2;

  -[ICDocCamViewController overlayView](self, "overlayView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearRectangles");

}

- (void)clearQueue
{
  id v2;

  -[ICDocCamViewController rectResultsQueue](self, "rectResultsQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clear");

}

- (void)analyzerCallbackWithDictionaryResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
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
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  BOOL v63;
  void *v64;
  double v65;
  uint64_t requestTimeIndex;
  double v67;
  void *v68;
  void *v69;
  void *v70;
  _QWORD v71[5];
  _QWORD block[5];
  _QWORD v73[3];
  _QWORD v74[5];

  v74[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!-[ICDocCamViewController isInRetakeMode](self, "isInRetakeMode"))
  {
    -[ICDocCamViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController documentInfoCollection](self, "documentInfoCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "docInfos");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "documentCameraController:canAddImages:", self, objc_msgSend(v7, "count") + 1))
    {

    }
    else
    {
      v8 = -[ICDocCamViewController didWarnAboutMaxScans](self, "didWarnAboutMaxScans");

      if (v8)
        goto LABEL_47;
    }
  }
  -[ICDocCamViewController processRequestsBlocker](self, "processRequestsBlocker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "blocked");

  if ((v10 & 1) == 0)
  {
    -[ICDocCamViewController snapStillImageBlocker](self, "snapStillImageBlocker");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "blocked");

    if ((v12 & 1) == 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICDocCamImageSequenceAnalyzerResults"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        -[ICDocCamViewController videoPreviewLayer](self, "videoPreviewLayer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "rectForMetadataOutputRectOfInterest:", 0.0, 0.0, 1.0, 1.0);
        v16 = v15;
        v18 = v17;
        v20 = v19;
        v22 = v21;

        -[ICDocCamViewController overlayView](self, "overlayView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setPreviewBounds:", v16, v18, v20, v22);

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICDocCamImageSequenceFrame_Timestamp"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICDocCamImageSequenceFrame_MetaData"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICDocCamImageSequenceFrame_MetaData"));
          v70 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v70 = 0;
        }
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ICDocCamImageSequenceAnalyzer_Rectangles"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)(-[ICDocCamViewController statusBarOrientation](self, "statusBarOrientation") - 3) > 1)
        {
          -[ICDocCamViewController streamingImageSize](self, "streamingImageSize");
          v29 = v32;
          -[ICDocCamViewController streamingImageSize](self, "streamingImageSize");
          v31 = v33;
        }
        else
        {
          -[ICDocCamViewController streamingImageSize](self, "streamingImageSize");
          v29 = v28;
          v31 = v30;
        }
        if (-[ICDocCamViewController validRect:forImageSize:](self, "validRect:forImageSize:", v27, v29, v31))
        {
          -[ICDocCamViewController didRecognizeRectangleForAccessibility:](self, "didRecognizeRectangleForAccessibility:", 1);
          if (v27)
          {
            v34 = objc_alloc_init(MEMORY[0x24BDBCED8]);
            v73[0] = CFSTR("Rectangles");
            v73[1] = CFSTR("Timestamp");
            v74[0] = v27;
            v74[1] = v24;
            v73[2] = CFSTR("RecognitionTime");
            objc_msgSend(MEMORY[0x24BDBCE60], "date");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v74[2] = v35;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v74, v73, 3);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "addEntriesFromDictionary:", v36);

            -[ICDocCamViewController rectResultsQueue](self, "rectResultsQueue");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "enqueue:", v34);

            -[ICDocCamViewController rectResultsQueue](self, "rectResultsQueue");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v38, "size") > 250;

            if (v39)
            {
              -[ICDocCamViewController rectResultsQueue](self, "rectResultsQueue");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = (id)objc_msgSend(v40, "dequeue");

            }
            if (-[ICDocCamViewController debugRectanglesEnabled](self, "debugRectanglesEnabled"))
            {
              -[ICDocCamViewController overlayView](self, "overlayView");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "setDocumentQuad:", 0);

              -[ICDocCamViewController overlayView](self, "overlayView");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "setDebugRects:", v27);

              block[0] = MEMORY[0x24BDAC760];
              block[1] = 3221225472;
              block[2] = __64__ICDocCamViewController_analyzerCallbackWithDictionaryResults___block_invoke;
              block[3] = &unk_24C5B89B0;
              block[4] = self;
              dispatch_async(MEMORY[0x24BDAC9B8], block);
            }
            else if (objc_msgSend(v27, "count"))
            {
              objc_msgSend(v27, "firstObject");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              if (!-[ICDocCamViewController useDocumentSegmentation](self, "useDocumentSegmentation")
                && (objc_msgSend(v48, "confidence"),
                    v50 = v49,
                    -[ICDocCamViewController rectangleMinimumVisualConfidence](self, "rectangleMinimumVisualConfidence"),
                    v50 > v51)
                || -[ICDocCamViewController useDocumentSegmentation](self, "useDocumentSegmentation")
                && (objc_msgSend(v48, "confidence"),
                    v53 = v52,
                    -[ICDocCamViewController segmentMinimumVisualConfidence](self, "segmentMinimumVisualConfidence"),
                    v53 > v54)
                && (objc_msgSend(v48, "confidence"), v55 < 0.99999))
              {
                -[ICDocCamViewController setLastHighConfidenceRectangle:](self, "setLastHighConfidenceRectangle:", v48);
                +[ICDocCamImageQuad quadFromVNRectangle:](ICDocCamImageQuad, "quadFromVNRectangle:", v48);
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                -[ICDocCamViewController overlayView](self, "overlayView");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "setDocumentQuad:", v56);

                -[ICDocCamViewController overlayView](self, "overlayView");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v58, "setDebugRects:", 0);

                if (!-[ICDocCamViewController hideUserPrompt](self, "hideUserPrompt"))
                {
                  -[ICDocCamViewController setHideUserPrompt:](self, "setHideUserPrompt:", 1);
                  v71[0] = MEMORY[0x24BDAC760];
                  v71[1] = 3221225472;
                  v71[2] = __64__ICDocCamViewController_analyzerCallbackWithDictionaryResults___block_invoke_2;
                  v71[3] = &unk_24C5B89B0;
                  v71[4] = self;
                  dispatch_async(MEMORY[0x24BDAC9B8], v71);
                }
                -[ICDocCamViewController updateRecentlyObservedRectanglesWithRect:](self, "updateRecentlyObservedRectanglesWithRect:", v48);
              }

            }
            else
            {
              -[ICDocCamViewController overlayView](self, "overlayView");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "setDocumentQuad:", 0);

              -[ICDocCamViewController overlayView](self, "overlayView");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "setDebugRects:", v27);

            }
          }
          else
          {
            -[ICDocCamViewController overlayView](self, "overlayView");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "setDocumentQuad:", 0);

            -[ICDocCamViewController overlayView](self, "overlayView");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "setDebugRects:", 0);

          }
          objc_msgSend(MEMORY[0x24BDD16A8], "string");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICDocCamImageSequenceFrame_RequestTime"));
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = v62 == 0;

          if (!v63)
          {
            self->_requestTimeSum = self->_requestTimeSum - self->_requestTime[self->_requestTimeIndex];
            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICDocCamImageSequenceFrame_RequestTime"));
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "doubleValue");
            self->_requestTime[self->_requestTimeIndex] = v65;

            requestTimeIndex = self->_requestTimeIndex;
            v67 = self->_requestTime[requestTimeIndex] + self->_requestTimeSum;
            self->_requestTimeSum = v67;
            self->_requestTimeIndex = ((int)requestTimeIndex + 1) % 10;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Average request time = %.1fms"), v67 / 10.0 * 1000.0, v70);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "appendString:", v68);

          }
          if (-[ICDocCamViewController displayStringEnabled](self, "displayStringEnabled"))
          {
            -[ICDocCamViewController overlayView](self, "overlayView");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "setDisplayString:", v61);
          }
          else
          {
            -[ICDocCamViewController overlayView](self, "overlayView");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "setDisplayString:", 0);
          }

          if (-[ICDocCamViewController shouldAutoShoot](self, "shouldAutoShoot"))
          {
            if (-[ICDocCamViewController sufficientlyLarge:forImageSize:](self, "sufficientlyLarge:forImageSize:", v27, v29, v31))
            {
              -[ICDocCamViewController killFeedbackDisplayIncludingUserPrompts:](self, "killFeedbackDisplayIncludingUserPrompts:", 1);
              -[ICDocCamViewController snapStillImageWithMode:](self, "snapStillImageWithMode:", 1);
            }
            else
            {
              -[ICDocCamViewController clearQueue](self, "clearQueue");
              -[ICDocCamViewController flashMoveCloserFeedback](self, "flashMoveCloserFeedback");
            }
          }

        }
        else
        {
          -[ICDocCamViewController overlayView](self, "overlayView");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setDocumentQuad:", 0);

          -[ICDocCamViewController overlayView](self, "overlayView");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "setDebugRects:", v27);

          -[ICDocCamViewController didRecognizeRectangleForAccessibility:](self, "didRecognizeRectangleForAccessibility:", 0);
        }

      }
      else
      {
        -[ICDocCamViewController overlayView](self, "overlayView");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "clearRectangles");

      }
    }
  }
LABEL_47:

}

void __64__ICDocCamViewController_analyzerCallbackWithDictionaryResults___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "userPromptView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHidden:", 1);

}

uint64_t __64__ICDocCamViewController_analyzerCallbackWithDictionaryResults___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];
  _QWORD v5[4];
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "userPromptView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __64__ICDocCamViewController_analyzerCallbackWithDictionaryResults___block_invoke_3;
  v5[3] = &unk_24C5B89B0;
  v6 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __64__ICDocCamViewController_analyzerCallbackWithDictionaryResults___block_invoke_4;
  v4[3] = &unk_24C5B8A68;
  v4[4] = v6;
  return objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 0, v5, v4, 0.6, 0.7);
}

void __64__ICDocCamViewController_analyzerCallbackWithDictionaryResults___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "userPromptView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __64__ICDocCamViewController_analyzerCallbackWithDictionaryResults___block_invoke_4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "userPromptView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHidden:", 1);

}

- (void)logAlgoChoice
{
  _BOOL4 v2;
  NSObject *v3;
  _BOOL4 v4;
  const char *v5;
  uint8_t *v6;
  __int16 v7;
  __int16 v8;

  v2 = -[ICDocCamViewController useDocumentSegmentation](self, "useDocumentSegmentation");
  v3 = os_log_create("com.apple.documentcamera", ");
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      v8 = 0;
      v5 = "Using VNDetectDocumentSegmentationRequest";
      v6 = (uint8_t *)&v8;
LABEL_6:
      _os_log_impl(&dword_20CE8E000, v3, OS_LOG_TYPE_INFO, v5, v6, 2u);
    }
  }
  else if (v4)
  {
    v7 = 0;
    v5 = "Using VNDetectRectanglesRequest";
    v6 = (uint8_t *)&v7;
    goto LABEL_6;
  }

}

- (void)focusWithMode:(int64_t)a3 exposeWithMode:(int64_t)a4 atDevicePoint:(CGPoint)a5 monitorSubjectAreaChange:(BOOL)a6
{
  CGFloat y;
  CGFloat x;
  NSObject *v12;
  _QWORD v13[9];
  BOOL v14;

  y = a5.y;
  x = a5.x;
  -[ICDocCamViewController sessionQueue](self, "sessionQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __94__ICDocCamViewController_focusWithMode_exposeWithMode_atDevicePoint_monitorSubjectAreaChange___block_invoke;
  v13[3] = &unk_24C5B8DD0;
  v13[4] = self;
  v13[5] = a3;
  *(CGFloat *)&v13[6] = x;
  *(CGFloat *)&v13[7] = y;
  v13[8] = a4;
  v14 = a6;
  dispatch_async(v12, v13);

}

void __94__ICDocCamViewController_focusWithMode_exposeWithMode_atDevicePoint_monitorSubjectAreaChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  id v5;
  NSObject *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "videoDeviceInput");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  v4 = objc_msgSend(v3, "lockForConfiguration:", &v7);
  v5 = v7;
  if (v4)
  {
    if (objc_msgSend(v3, "isFocusPointOfInterestSupported")
      && objc_msgSend(v3, "isFocusModeSupported:", *(_QWORD *)(a1 + 40)))
    {
      objc_msgSend(v3, "setFocusPointOfInterest:", *(double *)(a1 + 48), *(double *)(a1 + 56));
      objc_msgSend(v3, "setFocusMode:", *(_QWORD *)(a1 + 40));
    }
    if (objc_msgSend(v3, "isExposurePointOfInterestSupported")
      && objc_msgSend(v3, "isExposureModeSupported:", *(_QWORD *)(a1 + 64)))
    {
      objc_msgSend(v3, "setExposurePointOfInterest:", *(double *)(a1 + 48), *(double *)(a1 + 56));
      objc_msgSend(v3, "setExposureMode:", *(_QWORD *)(a1 + 64));
    }
    objc_msgSend(v3, "setSubjectAreaChangeMonitoringEnabled:", *(unsigned __int8 *)(a1 + 72));
    objc_msgSend(v3, "unlockForConfiguration");
  }
  else
  {
    v6 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __94__ICDocCamViewController_focusWithMode_exposeWithMode_atDevicePoint_monitorSubjectAreaChange___block_invoke_cold_1();

  }
}

+ (id)deviceWithMediaType:(id)a3 preferringPosition:(int64_t)a4
{
  objc_msgSend(MEMORY[0x24BDB2460], "defaultDeviceWithDeviceType:mediaType:position:", *MEMORY[0x24BDB1A58], a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)prepareForDismissal
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_2(&dword_20CE8E000, v0, v1, "ICDocCamViewController prepareForDismissal", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)thumbnailViewDidTap:(id)a3
{
  id v4;
  void *v5;
  char v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  ICDocCamExtractedDocumentViewController *v15;
  void *v16;
  void *v17;
  ICDocCamExtractedDocumentViewController *v18;
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
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  ICDocCamExtractedDocumentViewController *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id from;
  id location;

  v4 = a3;
  -[ICDocCamViewController processRequestsBlocker](self, "processRequestsBlocker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "blocked");

  if ((v6 & 1) == 0)
  {
    v7 = objc_msgSend(v4, "item");
    -[ICDocCamViewController documentInfoCollection](self, "documentInfoCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "docInfos");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v7 & 0x8000000000000000) == 0 && v7 < objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "croppedAndFilteredImageUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[ICDocCamViewController processRequestsBlocker](self, "processRequestsBlocker");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addBlockerOfType:clearRectangles:clearQueue:", CFSTR("ThumbnailTapBlocker"), 1, 1);

        -[ICDocCamViewController cameraUnavailableScrim](self, "cameraUnavailableScrim");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isHidden");

        if ((v14 & 1) == 0)
          -[ICDocCamViewController dismissFilterAndFlashUI](self, "dismissFilterAndFlashUI");
        -[ICDocCamViewController stopImageCaptureSession](self, "stopImageCaptureSession");
        -[ICDocCamViewController clearRectangles](self, "clearRectangles");
        -[ICDocCamViewController disableRetakeMode](self, "disableRetakeMode");
        v15 = [ICDocCamExtractedDocumentViewController alloc];
        -[ICDocCamViewController documentInfoCollection](self, "documentInfoCollection");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICDocCamViewController imageCache](self, "imageCache");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[ICDocCamExtractedDocumentViewController initWithDelegate:documentInfoCollection:imageCache:currentIndex:mode:](v15, "initWithDelegate:documentInfoCollection:imageCache:currentIndex:mode:", self, v16, v17, v7, 0);

        v38 = v18;
        -[ICDocCamViewController setUseCustomThumbnailZoomTransition:](self, "setUseCustomThumbnailZoomTransition:", 1);
        -[ICDocCamViewController navigationController](self, "navigationController");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setDelegate:", self);

        -[ICDocCamExtractedDocumentViewController navigationController](v18, "navigationController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setDelegate:", self);

        -[ICDocCamViewController thumbnailViewController](self, "thumbnailViewController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "collectionView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "cellForItemAtIndexPath:", v4);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        -[ICDocCamViewController documentInfoCollection](self, "documentInfoCollection");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "docInfos");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectAtIndexedSubscript:", v7);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v37 = v26;
        -[ICDocCamViewController imageCache](self, "imageCache");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "croppedAndFilteredImageUUID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "getImage:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        -[ICDocCamViewController setImageForThumbnailZoom:](self, "setImageForThumbnailZoom:", v29);
        -[ICDocCamViewController setIndexPathForThumbnailZoom:](self, "setIndexPathForThumbnailZoom:", v4);
        objc_initWeak(&location, self);
        objc_initWeak(&from, v23);
        v39[0] = MEMORY[0x24BDAC760];
        v39[1] = 3221225472;
        v39[2] = __46__ICDocCamViewController_thumbnailViewDidTap___block_invoke;
        v39[3] = &unk_24C5B8DF8;
        objc_copyWeak(&v40, &from);
        objc_copyWeak(&v41, &location);
        -[ICDocCamViewController setThumbnailZoomCompletionBlock:](self, "setThumbnailZoomCompletionBlock:", v39);
        if ((DCDebugInterfaceEnabled() & 1) != 0)
          goto LABEL_11;
        objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "userInterfaceIdiom");

        if (v31 == 1
          || (-[ICDocCamViewController documentInfoCollection](self, "documentInfoCollection"),
              v32 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v32, "docInfos"),
              v33 = (void *)objc_claimAutoreleasedReturnValue(),
              v34 = objc_msgSend(v33, "count"),
              v33,
              v32,
              v34 != 1))
        {
LABEL_11:
          objc_msgSend(v23, "setHidden:", 1);
        }
        else
        {
          -[ICDocCamViewController thumbnailContainerView](self, "thumbnailContainerView");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setHidden:", 1);

        }
        -[ICDocCamViewController navigationController](self, "navigationController");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "pushViewController:animated:", v38, 1);

        objc_destroyWeak(&v41);
        objc_destroyWeak(&v40);
        objc_destroyWeak(&from);
        objc_destroyWeak(&location);

      }
    }

  }
}

void __46__ICDocCamViewController_thumbnailViewDidTap___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  if ((DCDebugInterfaceEnabled() & 1) != 0)
    goto LABEL_3;
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v8, "userInterfaceIdiom");

  if (v2 == 1)
    goto LABEL_3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "documentInfoCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "docInfos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 != 1)
  {
LABEL_3:
    v9 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v9, "setHidden:", 0);
  }
  else
  {
    v9 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v9, "thumbnailContainerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 0);

  }
  v10 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v10, "processRequestsBlocker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeBlockerOfType:", CFSTR("ThumbnailTapBlocker"));

}

- (void)addNewDocument:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ICDocCamViewController documentInfoCollection](self, "documentInfoCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "docInfos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v7);

  -[ICDocCamViewController documentInfoCollection](self, "documentInfoCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bumpModificationDate");

  -[ICDocCamViewController warnAboutMaxScansIfNecessary](self, "warnAboutMaxScansIfNecessary");
}

- (CGRect)targetViewRect
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  unint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGRect result;

  v3 = -[ICDocCamViewController statusBarOrientation](self, "statusBarOrientation");
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  v6 = v3 - 1;
  -[ICDocCamViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    objc_msgSend(v7, "bounds");
    v10 = v9;

    -[ICDocCamViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v19 = v10 + -200.0;
    v21 = v20 + -200.0;

    v22 = 100.0;
    v23 = 100.0;
  }
  else
  {
    objc_msgSend(v7, "bounds");
    v13 = v12;

    -[ICDocCamViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    v16 = v15;
    if (v6 > 1)
    {
      v17 = 32.0;
      *(double *)&v18 = -64.0;
    }
    else
    {
      v17 = 100.0;
      *(double *)&v18 = -200.0;
    }
    v24 = *(double *)&v18;

    -[ICDocCamViewController view](self, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "safeAreaInsets");
    v27 = v26;
    v29 = v28;
    v30 = v16 + v24;
    v19 = v13 + -64.0;

    v23 = v17 + v27;
    v31 = 0.0;
    if (v29 > 0.0)
      v31 = 10.0;
    v21 = v30 - (v27 + v29 + v31);
    v22 = 32.0;
  }
  v32 = v19;
  v33 = v21;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void)warnAboutMaxScansIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  -[ICDocCamViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController documentInfoCollection](self, "documentInfoCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "docInfos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "documentCameraController:canAddImages:", self, objc_msgSend(v5, "count") + 1);

  if ((v6 & 1) == 0)
  {
    -[ICDocCamViewController enableShutter:](self, "enableShutter:", 0);
    -[ICDocCamViewController shutterButton](self, "shutterButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPseudoDisabled:", 1);

    if (!-[ICDocCamViewController didWarnAboutMaxScans](self, "didWarnAboutMaxScans"))
    {
      -[ICDocCamViewController setDidWarnAboutMaxScans:](self, "setDidWarnAboutMaxScans:", 1);
      -[ICDocCamViewController processRequestsBlocker](self, "processRequestsBlocker");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addBlockerOfType:clearRectangles:clearQueue:", CFSTR("MaxImageAlertBlocker"), 1, 1);

      v9 = (void *)objc_opt_class();
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __54__ICDocCamViewController_warnAboutMaxScansIfNecessary__block_invoke;
      v10[3] = &unk_24C5B8B50;
      v10[4] = self;
      objc_msgSend(v9, "warnAboutMaxScansReachedForViewController:completionHandler:", self, v10);
    }
  }
}

void __54__ICDocCamViewController_warnAboutMaxScansIfNecessary__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "processRequestsBlocker");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeBlockerOfType:", CFSTR("MaxImageAlertBlocker"));

}

+ (void)warnAboutMaxScansReachedForViewController:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v5 = a4;
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Maximum Reached"), CFSTR("Maximum Reached"), CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("You’ve added the maximum number of scans to this document. You can delete scans or create another document."), CFSTR("You’ve added the maximum number of scans to this document. You can delete scans or create another document."), CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("exclamationmark.triangle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v9);

  v10 = (void *)MEMORY[0x24BDF67E8];
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("OK"), CFSTR("OK"), CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 1, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addAction:", v12);
  objc_msgSend(v13, "presentViewController:animated:completion:", v8, 1, 0);

}

- (id)filteredImageForDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "croppedButNotFilteredImageUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICDocCamViewController imageCache](self, "imageCache");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "croppedButNotFilteredImageUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getImage:", v7);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fullImageUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getImage:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "imageQuad");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICDocCamImageFilters perspectiveCorrectedImageFromImage:normalizedImageQuad:](ICDocCamImageFilters, "perspectiveCorrectedImageFromImage:normalizedImageQuad:", v6, v7);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICDocCamImageFilters filteredImage:orientation:imageFilterType:constantColor:](ICDocCamImageFilters, "filteredImage:orientation:imageFilterType:constantColor:", v10, objc_msgSend(v4, "currentOrientation"), objc_msgSend(v4, "currentFilter"), objc_msgSend(v4, "constantColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)extractedDocumentController:(id)a3 startMarkupOnDocument:(id)a4 inkStyle:(unint64_t)a5 startPresentBlock:(id)a6 dismissCompletionBlock:(id)a7
{
  id v11;
  void (**v12)(id, _QWORD *);
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
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  _QWORD v32[5];
  id v33;

  v11 = a4;
  v12 = (void (**)(id, _QWORD *))a6;
  v30 = a7;
  -[ICDocCamViewController imageCache](self, "imageCache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "croppedAndFilteredImageUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "getImage:", v14);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICDocCamViewController filteredImageForDocument:](self, "filteredImageForDocument:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[DCMarkupUtilities createMarkupViewController](DCMarkupUtilities, "createMarkupViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setInkStyle:", a5);
  objc_msgSend(MEMORY[0x24BDF6950], "DCExtractedDocumentViewControllerBackgroundColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v17);

  objc_msgSend(v11, "markupModelData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dc_JPEGData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setData:withArchivedModelData:placeholderImage:", v19, v18, v31);

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", v16);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_markupDoneAction_);
  objc_msgSend(v16, "navigationItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setLeftBarButtonItem:", v21);

  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_markupCancelAction_);
  objc_msgSend(v16, "navigationItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setRightBarButtonItem:", v23);

  objc_msgSend(v20, "setModalTransitionStyle:", 2);
  objc_msgSend(v20, "setModalPresentationStyle:", 6);
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "userInterfaceIdiom");

  if (!v26)
  {
    objc_msgSend(v20, "navigationBar");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.1, 1.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setBarTintColor:", v28);

  }
  -[ICDocCamViewController setMarkupDocumentInfo:](self, "setMarkupDocumentInfo:", v11);
  -[ICDocCamViewController setMarkupDismissCompletionBlock:](self, "setMarkupDismissCompletionBlock:", v30);
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __126__ICDocCamViewController_extractedDocumentController_startMarkupOnDocument_inkStyle_startPresentBlock_dismissCompletionBlock___block_invoke;
  v32[3] = &unk_24C5B8E20;
  v32[4] = self;
  v29 = v20;
  v33 = v29;
  v12[2](v12, v32);

}

void __126__ICDocCamViewController_extractedDocumentController_startMarkupOnDocument_inkStyle_startPresentBlock_dismissCompletionBlock___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);

}

- (void)markupDoneAction:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v4 = a3;
  v5 = objc_opt_class();
  -[ICDocCamViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  DCDynamicCast(v5, (uint64_t)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_opt_class();
  -[ICDocCamViewController presentedViewController](self, "presentedViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  DCDynamicCast(v9, (uint64_t)v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICDocCamViewController markupDocumentInfo](self, "markupDocumentInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController setMarkupDocumentInfo:](self, "setMarkupDocumentInfo:", 0);
  objc_msgSend(v11, "topViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = &v28;
  v30 = 0x2050000000;
  v14 = (void *)getMarkupViewControllerClass(void)::softClass;
  v31 = getMarkupViewControllerClass(void)::softClass;
  if (!getMarkupViewControllerClass(void)::softClass)
  {
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = ___ZL28getMarkupViewControllerClassv_block_invoke;
    v27[3] = &unk_24C5B8EA8;
    v27[4] = &v28;
    ___ZL28getMarkupViewControllerClassv_block_invoke((uint64_t)v27);
    v14 = (void *)v29[3];
  }
  v15 = objc_retainAutorelease(v14);
  _Block_object_dispose(&v28, 8);
  if ((objc_opt_isKindOfClass() & (v12 != 0)) == 1)
  {
    v16 = v13;
    v26 = v8;
    objc_msgSend(v16, "createArchivedModelData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMarkupModelData:", v17);

    objc_msgSend(v16, "dataRepresentationEmbeddingSourceImageAndEditModel:error:", 0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v25 = v4;
      objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithData:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController imageCache](self, "imageCache");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "metaData");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "croppedAndFilteredImageUUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "replaceImage:metaData:uuid:", v19, v21, v22);

      objc_msgSend(v26, "didUpdateDocumentImage:", v12);
      v4 = v25;
    }

    v8 = v26;
  }
  -[ICDocCamViewController markupDismissCompletionBlock](self, "markupDismissCompletionBlock");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController setMarkupDismissCompletionBlock:](self, "setMarkupDismissCompletionBlock:", 0);
  -[ICDocCamViewController presentedViewController](self, "presentedViewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "dismissViewControllerAnimated:completion:", 1, v23);

}

- (void)markupCancelAction:(id)a3
{
  void *v4;
  id v5;

  -[ICDocCamViewController markupDismissCompletionBlock](self, "markupDismissCompletionBlock", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController setMarkupDismissCompletionBlock:](self, "setMarkupDismissCompletionBlock:", 0);
  -[ICDocCamViewController setMarkupDocumentInfo:](self, "setMarkupDocumentInfo:", 0);
  -[ICDocCamViewController presentedViewController](self, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v5);

}

- (id)extractedDocumentControllerMarkupModelDataForDocument:(id)a3
{
  objc_msgSend(a3, "markupModelData");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)extractedDocumentControllerDiscardMarkupModelDataForDocument:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "setMarkupModelData:", 0);
  v4 = objc_opt_class();
  -[ICDocCamViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  DCDynamicCast(v4, (uint64_t)v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICDocCamViewController filteredImageForDocument:](self, "filteredImageForDocument:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController imageCache](self, "imageCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "metaData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "croppedAndFilteredImageUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "replaceImage:metaData:uuid:", v8, v10, v11);

  objc_msgSend(v7, "didUpdateDocumentImage:", v12);
}

- (void)extractedDocumentControllerDidTapRetake:(unint64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  id v29;
  id location;

  -[ICDocCamViewController documentInfoCollection](self, "documentInfoCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "docInfos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 > a3)
  {
    -[ICDocCamViewController thumbnailViewController](self, "thumbnailViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "update");

    -[ICDocCamViewController setRetakeIndex:](self, "setRetakeIndex:", a3);
    -[ICDocCamViewController saveButton](self, "saveButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 1);

    -[ICDocCamViewController thumbnailContainerView](self, "thumbnailContainerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", 1);

    -[ICDocCamViewController setUseCustomRetakeTransition:](self, "setUseCustomRetakeTransition:", 1);
    -[ICDocCamViewController navigationController](self, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDelegate:", self);

    -[ICDocCamViewController navigationController](self, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "topViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "navigationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDelegate:", self);

    -[ICDocCamViewController documentInfoCollection](self, "documentInfoCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "docInfos");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICDocCamViewController imageCache](self, "imageCache");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "croppedAndFilteredImageUUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "getImage:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a3, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController setIndexPathForRetake:](self, "setIndexPathForRetake:", v21);

    -[ICDocCamViewController setImageForRetake:](self, "setImageForRetake:", v20);
    -[ICDocCamViewController setRetakeCompletionBlock:](self, "setRetakeCompletionBlock:", 0);
    objc_initWeak(&location, self);
    v25 = MEMORY[0x24BDAC760];
    v26 = 3221225472;
    v27 = __66__ICDocCamViewController_extractedDocumentControllerDidTapRetake___block_invoke;
    v28 = &unk_24C5B8BA0;
    objc_copyWeak(&v29, &location);
    -[ICDocCamViewController setSessionStartNotificationBlock:](self, "setSessionStartNotificationBlock:", &v25);
    -[ICDocCamViewController previewView](self, "previewView", v25, v26, v27, v28);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v24) = 1.0;
    objc_msgSend(v23, "setOpacity:", v24);

    -[ICDocCamViewController restartImageCaptureSessionIfNecessary](self, "restartImageCaptureSessionIfNecessary");
    -[ICDocCamViewController retakeButtonWasPressed](self, "retakeButtonWasPressed");
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

  }
}

void __66__ICDocCamViewController_extractedDocumentControllerDidTapRetake___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "navigationController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "popViewControllerAnimated:", 1);

}

- (void)extractedDocumentController:(id)a3 didTapRecrop:(id)a4 index:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  ICDocCamImageQuadEditViewController *v14;
  id v15;
  id v16;
  ICDocCamImageQuadEditViewController *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  ICDocCamViewController *v32;
  id v33;
  int64_t v34;

  v8 = a3;
  v9 = a4;
  -[ICDocCamViewController imageCache](self, "imageCache", v8);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fullImageUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "getImage:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "imageQuad");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "currentOrientation");
  v14 = [ICDocCamImageQuadEditViewController alloc];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __73__ICDocCamViewController_extractedDocumentController_didTapRecrop_index___block_invoke;
  v30[3] = &unk_24C5B8E48;
  v15 = v9;
  v31 = v15;
  v32 = self;
  v16 = v8;
  v33 = v16;
  v34 = a5;
  v17 = -[ICDocCamImageQuadEditViewController initWithImage:quad:scanDataDelegate:orientation:completionHandler:](v14, "initWithImage:quad:scanDataDelegate:orientation:completionHandler:", v11, v12, 0, v13, v30);
  -[ICDocCamImageQuadEditViewController setShowImageAsAspectFit:](v17, "setShowImageAsAspectFit:", 1);
  -[ICDocCamViewController setUseCustomRecropTransition:](self, "setUseCustomRecropTransition:", 1);
  -[ICDocCamViewController navigationController](self, "navigationController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDelegate:", self);

  -[ICDocCamImageQuadEditViewController navigationController](v17, "navigationController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDelegate:", self);

  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a5, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController setIndexPathForRecrop:](self, "setIndexPathForRecrop:", v20);

  -[ICDocCamViewController imageCache](self, "imageCache");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "croppedAndFilteredImageUUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "getImage:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController setFilteredImageForRecrop:](self, "setFilteredImageForRecrop:", v23);

  objc_msgSend(v16, "croppedButNotFilteredImageForDocInfo:", v15);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController setUnfilteredImageForRecrop:](self, "setUnfilteredImageForRecrop:", v24);

  v25 = objc_alloc(MEMORY[0x24BDF6AC8]);
  -[ICDocCamViewController unfilteredImageForRecrop](self, "unfilteredImageForRecrop");
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v27 = (void *)objc_msgSend(v25, "initWithCGImage:scale:orientation:", objc_msgSend(v26, "CGImage"), objc_msgSend(v15, "currentOrientation"), 1.0);
  -[ICDocCamViewController setUnfilteredImageForRecrop:](self, "setUnfilteredImageForRecrop:", v27);

  -[ICDocCamViewController setOrientationForRecrop:](self, "setOrientationForRecrop:", objc_msgSend(v15, "currentOrientation"));
  -[ICDocCamViewController navigationController](self, "navigationController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "pushViewController:animated:", v17, 1);

}

void __73__ICDocCamViewController_extractedDocumentController_didTapRecrop_index___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
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
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;

  v27 = a3;
  v7 = a4;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setImageQuad:", v7);
    +[ICDocCamImageFilters perspectiveCorrectedImageFromImage:normalizedImageQuad:](ICDocCamImageFilters, "perspectiveCorrectedImageFromImage:normalizedImageQuad:", v27, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "imageCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "metaData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "croppedButNotFilteredImageUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "replaceImage:metaData:uuid:", v8, v10, v11);

    +[ICDocCamImageFilters filteredImage:orientation:imageFilterType:constantColor:](ICDocCamImageFilters, "filteredImage:orientation:imageFilterType:constantColor:", v8, objc_msgSend(*(id *)(a1 + 32), "currentOrientation"), objc_msgSend(*(id *)(a1 + 32), "currentFilter"), objc_msgSend(*(id *)(a1 + 32), "constantColor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "imageCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "metaData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "croppedAndFilteredImageUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "replaceImage:metaData:uuid:", v12, v14, v15);

    objc_msgSend(*(id *)(a1 + 40), "thumbnailViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "update");

    objc_msgSend(*(id *)(a1 + 48), "didUpdateDocumentImage:", *(_QWORD *)(a1 + 32));
  }
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", *(_QWORD *)(a1 + 56), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setIndexPathForRecrop:", v17);

  objc_msgSend(*(id *)(a1 + 40), "imageCache");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "croppedAndFilteredImageUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "getImage:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setFilteredImageForRecrop:", v20);

  objc_msgSend(*(id *)(a1 + 48), "croppedButNotFilteredImageForDocInfo:", *(_QWORD *)(a1 + 32));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setUnfilteredImageForRecrop:", v21);

  v22 = objc_alloc(MEMORY[0x24BDF6AC8]);
  objc_msgSend(*(id *)(a1 + 40), "unfilteredImageForRecrop");
  v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v24 = (void *)objc_msgSend(v22, "initWithCGImage:scale:orientation:", objc_msgSend(v23, "CGImage"), objc_msgSend(*(id *)(a1 + 32), "currentOrientation"), 1.0);
  objc_msgSend(*(id *)(a1 + 40), "setUnfilteredImageForRecrop:", v24);

  objc_msgSend(*(id *)(a1 + 40), "setOrientationForRecrop:", objc_msgSend(*(id *)(a1 + 32), "currentOrientation"));
  objc_msgSend(*(id *)(a1 + 40), "navigationController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (id)objc_msgSend(v25, "popViewControllerAnimated:", 1);

}

- (void)extractedDocumentControllerDidTapDone:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
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
  double v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(uint64_t);
  void *v48;
  id v49;
  id location;

  -[ICDocCamViewController disableRetakeMode](self, "disableRetakeMode");
  objc_msgSend(MEMORY[0x24BDE57E8], "animation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemovedOnCompletion:", 1);
  objc_msgSend(v5, "setDuration:", 0.25);
  v6 = *MEMORY[0x24BDE5E00];
  objc_msgSend(v5, "setType:", *MEMORY[0x24BDE5E00]);
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimingFunction:", v7);

  -[ICDocCamViewController saveButton](self, "saveButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAnimation:forKey:", v5, CFSTR("changeTextTransition"));

  -[ICDocCamViewController saveButton](self, "saveButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController documentInfoCollection](self, "documentInfoCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "docInfos");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDocumentCount:", objc_msgSend(v12, "count"));

  -[ICDocCamViewController updateThumbnailContainerViewConstraintConstantForIPad](self, "updateThumbnailContainerViewConstraintConstantForIPad");
  -[ICDocCamViewController documentInfoCollection](self, "documentInfoCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "docInfos");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    -[ICDocCamViewController saveButton](self, "saveButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setHidden:", 0);

  }
  -[ICDocCamViewController thumbnailContainerView](self, "thumbnailContainerView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setHidden:", 0);

  -[ICDocCamViewController thumbnailViewController](self, "thumbnailViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "update");

  -[ICDocCamViewController documentInfoCollection](self, "documentInfoCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "docInfos");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v21)
  {
    -[ICDocCamViewController setUseCustomThumbnailZoomTransition:](self, "setUseCustomThumbnailZoomTransition:", 1);
    -[ICDocCamViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setNeedsLayout");

    -[ICDocCamViewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "layoutIfNeeded");

    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a3, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController documentInfoCollection](self, "documentInfoCollection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "docInfos");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectAtIndexedSubscript:", a3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICDocCamViewController imageCache](self, "imageCache");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "croppedAndFilteredImageUUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "getImage:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICDocCamViewController setIndexPathForThumbnailZoom:](self, "setIndexPathForThumbnailZoom:", v24);
    -[ICDocCamViewController setImageForThumbnailZoom:](self, "setImageForThumbnailZoom:", v30);
    objc_initWeak(&location, self);
    v45 = MEMORY[0x24BDAC760];
    v46 = 3221225472;
    v47 = __64__ICDocCamViewController_extractedDocumentControllerDidTapDone___block_invoke;
    v48 = &unk_24C5B8BA0;
    objc_copyWeak(&v49, &location);
    -[ICDocCamViewController setSessionStartNotificationBlock:](self, "setSessionStartNotificationBlock:", &v45);
    -[ICDocCamViewController previewView](self, "previewView", v45, v46, v47, v48);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v33) = 1.0;
    objc_msgSend(v32, "setOpacity:", v33);

    -[ICDocCamViewController restartImageCaptureSessionIfNecessary](self, "restartImageCaptureSessionIfNecessary");
    objc_destroyWeak(&v49);
    objc_destroyWeak(&location);

  }
  else
  {
    -[ICDocCamViewController setUseCustomThumbnailZoomTransition:](self, "setUseCustomThumbnailZoomTransition:", 0);
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "userInterfaceIdiom");

    if (!v35)
    {
      -[ICDocCamViewController thumbnailContainerView](self, "thumbnailContainerView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setHidden:", 0);

    }
    -[ICDocCamViewController navigationController](self, "navigationController");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "topViewController");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "view");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDE57E8], "animation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setDuration:", 0.25);
    objc_msgSend(v40, "setType:", *MEMORY[0x24BDE5E30]);
    objc_msgSend(v40, "setSubtype:", v6);
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D28]);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setTimingFunction:", v41);

    objc_msgSend(v39, "layer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addAnimation:forKey:", v40, &stru_24C5B9710);

    -[ICDocCamViewController navigationController](self, "navigationController");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (id)objc_msgSend(v43, "popViewControllerAnimated:", 0);

  }
}

void __64__ICDocCamViewController_extractedDocumentControllerDidTapDone___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "navigationController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "popViewControllerAnimated:", 1);

}

- (void)extractedDocumentControllerDidDeleteDocument:(id)a3
{
  id v3;

  -[ICDocCamViewController thumbnailViewController](self, "thumbnailViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "update");

}

- (void)setupAccessibilityInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t i;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
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
  void *v78;
  id v79;
  void *v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  -[ICDocCamViewController userPromptLabel](self, "userPromptLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

  -[ICDocCamViewController cameraUnavailableLabel](self, "cameraUnavailableLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAccessibilityElement:", 0);

  -[ICDocCamViewController cancelButtonForIPhone](self, "cancelButtonForIPhone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowsLargeContentViewer:", 1);

  -[ICDocCamViewController cancelButtonForIPhone](self, "cancelButtonForIPhone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x24BDF6B70]);
  objc_msgSend(v6, "addInteraction:", v7);

  -[ICDocCamViewController cancelButton](self, "cancelButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShowsLargeContentViewer:", 1);

  -[ICDocCamViewController cancelButton](self, "cancelButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x24BDF6B70]);
  objc_msgSend(v9, "addInteraction:", v10);

  -[ICDocCamViewController flashButton](self, "flashButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setShowsLargeContentViewer:", 1);

  -[ICDocCamViewController flashButton](self, "flashButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x24BDF6B70]);
  objc_msgSend(v12, "addInteraction:", v13);

  -[ICDocCamViewController flashSettingViewFlashIcon](self, "flashSettingViewFlashIcon");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setShowsLargeContentViewer:", 1);

  -[ICDocCamViewController flashSettingViewFlashIcon](self, "flashSettingViewFlashIcon");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(MEMORY[0x24BDF6B70]);
  objc_msgSend(v15, "addInteraction:", v16);

  -[ICDocCamViewController flashButtonForIPhone](self, "flashButtonForIPhone");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setShowsLargeContentViewer:", 1);

  -[ICDocCamViewController flashButtonForIPhone](self, "flashButtonForIPhone");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc_init(MEMORY[0x24BDF6B70]);
  objc_msgSend(v18, "addInteraction:", v19);

  -[ICDocCamViewController flashSettingViewAutoButton](self, "flashSettingViewAutoButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setShowsLargeContentViewer:", 1);

  -[ICDocCamViewController flashSettingViewAutoButton](self, "flashSettingViewAutoButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc_init(MEMORY[0x24BDF6B70]);
  objc_msgSend(v21, "addInteraction:", v22);

  -[ICDocCamViewController flashSettingViewOnButton](self, "flashSettingViewOnButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setShowsLargeContentViewer:", 1);

  -[ICDocCamViewController flashSettingViewOnButton](self, "flashSettingViewOnButton");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_alloc_init(MEMORY[0x24BDF6B70]);
  objc_msgSend(v24, "addInteraction:", v25);

  -[ICDocCamViewController flashSettingViewOffButton](self, "flashSettingViewOffButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setShowsLargeContentViewer:", 1);

  -[ICDocCamViewController flashSettingViewOffButton](self, "flashSettingViewOffButton");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_alloc_init(MEMORY[0x24BDF6B70]);
  objc_msgSend(v27, "addInteraction:", v28);

  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Show filter settings"), CFSTR("Show filter settings"), CFSTR("Localizable"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController filterButton](self, "filterButton");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setAccessibilityLabel:", v29);

  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Double-tap to choose a filter to apply to this scan."), CFSTR("Double-tap to choose a filter to apply to this scan."), CFSTR("Localizable"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController filterButton](self, "filterButton");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setAccessibilityHint:", v31);

  -[ICDocCamViewController filterButton](self, "filterButton");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setShowsLargeContentViewer:", 1);

  -[ICDocCamViewController filterButton](self, "filterButton");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_alloc_init(MEMORY[0x24BDF6B70]);
  objc_msgSend(v34, "addInteraction:", v35);

  -[ICDocCamViewController filterButton](self, "filterButton");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "accessibilityLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController filterButtonForIPhone](self, "filterButtonForIPhone");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setAccessibilityLabel:", v37);

  -[ICDocCamViewController filterButton](self, "filterButton");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "accessibilityHint");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController filterButtonForIPhone](self, "filterButtonForIPhone");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setAccessibilityHint:", v40);

  -[ICDocCamViewController filterButtonForIPhone](self, "filterButtonForIPhone");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setShowsLargeContentViewer:", 1);

  -[ICDocCamViewController filterButtonForIPhone](self, "filterButtonForIPhone");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_alloc_init(MEMORY[0x24BDF6B70]);
  objc_msgSend(v43, "addInteraction:", v44);

  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Hide filter settings"), CFSTR("Hide filter settings"), CFSTR("Localizable"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController filterViewButton](self, "filterViewButton");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setAccessibilityLabel:", v45);

  -[ICDocCamViewController filterViewButton](self, "filterViewButton");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setShowsLargeContentViewer:", 1);

  -[ICDocCamViewController filterViewButton](self, "filterViewButton");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_alloc_init(MEMORY[0x24BDF6B70]);
  objc_msgSend(v48, "addInteraction:", v49);

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  -[ICDocCamViewController filterButtons](self, "filterButtons", 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
  if (v51)
  {
    v52 = *(_QWORD *)v82;
    do
    {
      for (i = 0; i != v51; ++i)
      {
        if (*(_QWORD *)v82 != v52)
          objc_enumerationMutation(v50);
        v54 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
        objc_msgSend(v54, "setShowsLargeContentViewer:", 1);
        v55 = objc_alloc_init(MEMORY[0x24BDF6B70]);
        objc_msgSend(v54, "addInteraction:", v55);

      }
      v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
    }
    while (v51);
  }

  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Double-tap to resume"), CFSTR("Double-tap to resume"), CFSTR("Localizable"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController resumeButton](self, "resumeButton");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setAccessibilityLabel:", v56);

  -[ICDocCamViewController autoButtonForIPhone](self, "autoButtonForIPhone");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setShowsLargeContentViewer:", 1);

  -[ICDocCamViewController autoButtonForIPhone](self, "autoButtonForIPhone");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_alloc_init(MEMORY[0x24BDF6B70]);
  objc_msgSend(v59, "addInteraction:", v60);

  -[ICDocCamViewController autoButton](self, "autoButton");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setShowsLargeContentViewer:", 1);

  -[ICDocCamViewController autoButton](self, "autoButton");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_alloc_init(MEMORY[0x24BDF6B70]);
  objc_msgSend(v62, "addInteraction:", v63);

  -[ICDocCamViewController updateAccessibilityForCurrentFlashMode](self, "updateAccessibilityForCurrentFlashMode");
  -[ICDocCamViewController updateAccessibilityForCurrentFilter](self, "updateAccessibilityForCurrentFilter");
  -[ICDocCamViewController updateAccessibilityForAutoShutterMode:](self, "updateAccessibilityForAutoShutterMode:", -[ICDocCamViewController autoMode](self, "autoMode"));
  -[ICDocCamViewController filterButton](self, "filterButton");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "_accessibilitySetIsSpeakThisElement:", 1);

  -[ICDocCamViewController filterButtonForIPhone](self, "filterButtonForIPhone");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "_accessibilitySetIsSpeakThisElement:", 1);

  -[ICDocCamViewController flashButton](self, "flashButton");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "_accessibilitySetIsSpeakThisElement:", 1);

  -[ICDocCamViewController flashButtonForIPhone](self, "flashButtonForIPhone");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "_accessibilitySetIsSpeakThisElement:", 1);

  -[ICDocCamViewController autoButton](self, "autoButton");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "_accessibilitySetIsSpeakThisElement:", 1);

  -[ICDocCamViewController autoButtonForIPhone](self, "autoButtonForIPhone");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "_accessibilitySetIsSpeakThisElement:", 1);

  -[ICDocCamViewController manualButton](self, "manualButton");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "_accessibilitySetIsSpeakThisElement:", 1);

  -[ICDocCamViewController flashSettingViewFlashIcon](self, "flashSettingViewFlashIcon");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "accessibilityLabel");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController flashSettingViewFlashIcon](self, "flashSettingViewFlashIcon");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setLargeContentTitle:", v72);

  -[ICDocCamViewController filterViewButton](self, "filterViewButton");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "accessibilityLabel");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController filterViewButton](self, "filterViewButton");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setLargeContentTitle:", v75);

  -[ICDocCamViewController manualButton](self, "manualButton");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setShowsLargeContentViewer:", 1);

  -[ICDocCamViewController manualButton](self, "manualButton");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = objc_alloc_init(MEMORY[0x24BDF6B70]);
  objc_msgSend(v78, "addInteraction:", v79);

  -[ICDocCamViewController view](self, "view");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setAccessibilityIgnoresInvertColors:", 1);

}

- (void)updateAccessibilityForCurrentFilter
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
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
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[ICDocCamViewController filterButtons](self, "filterButtons", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v29;
    v6 = *MEMORY[0x24BDF7400];
    v7 = ~*MEMORY[0x24BDF7400];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v29 != v5)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "tag");
        if (v10 == -[ICDocCamViewController defaultFilter](self, "defaultFilter"))
          v11 = v6 | objc_msgSend(v9, "accessibilityTraits");
        else
          v11 = objc_msgSend(v9, "accessibilityTraits") & v7;
        objc_msgSend(v9, "setAccessibilityTraits:", v11);
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v4);
  }

  -[ICDocCamViewController filterButton](self, "filterButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityValue:", 0);

  if (-[ICDocCamViewController filterSettingUIShowing](self, "filterSettingUIShowing"))
  {
    +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Hide filter settings"), CFSTR("Hide filter settings"), CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController filterButton](self, "filterButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAccessibilityLabel:", v13);

    -[ICDocCamViewController filterButton](self, "filterButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAccessibilityValue:", 0);
  }
  else
  {
    +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Show filter settings"), CFSTR("Show filter settings"), CFSTR("Localizable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController filterButton](self, "filterButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAccessibilityLabel:", v16);

    +[ICDocCamImageFilters localizedImageFilterNameForType:](ICDocCamImageFilters, "localizedImageFilterNameForType:", -[ICDocCamViewController defaultFilter](self, "defaultFilter"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController filterButton](self, "filterButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAccessibilityValue:", v15);

  }
  -[ICDocCamViewController filterButton](self, "filterButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "accessibilityValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController filterButtonForIPhone](self, "filterButtonForIPhone");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAccessibilityValue:", v20);

  -[ICDocCamViewController filterButton](self, "filterButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "accessibilityLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController filterButton](self, "filterButton");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setLargeContentTitle:", v23);

  -[ICDocCamViewController filterButtonForIPhone](self, "filterButtonForIPhone");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "accessibilityLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController filterButtonForIPhone](self, "filterButtonForIPhone");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setLargeContentTitle:", v26);

}

- (void)updateAccessibilityForCurrentFlashMode
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
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
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;

  v3 = -[ICDocCamViewController flashMode](self, "flashMode");
  switch(v3)
  {
    case 2:
      -[ICDocCamViewController flashSettingViewOffButton](self, "flashSettingViewOffButton");
      v33 = (id)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v33, "accessibilityTraits");
      v8 = *MEMORY[0x24BDF7400];
      objc_msgSend(v33, "setAccessibilityTraits:", v7 & ~*MEMORY[0x24BDF7400]);

      -[ICDocCamViewController flashSettingViewOnButton](self, "flashSettingViewOnButton");
      v34 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setAccessibilityTraits:", objc_msgSend(v34, "accessibilityTraits") & ~v8);

      -[ICDocCamViewController flashSettingViewAutoButton](self, "flashSettingViewAutoButton");
      v35 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setAccessibilityTraits:", objc_msgSend(v35, "accessibilityTraits") | v8);

      +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("auto"), CFSTR("auto"), CFSTR("Localizable"));
      v36 = (id)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashButton](self, "flashButton");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAccessibilityValue:", v36);
      goto LABEL_7;
    case 1:
      -[ICDocCamViewController flashSettingViewOffButton](self, "flashSettingViewOffButton");
      v37 = (id)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v37, "accessibilityTraits");
      v11 = *MEMORY[0x24BDF7400];
      objc_msgSend(v37, "setAccessibilityTraits:", v10 & ~*MEMORY[0x24BDF7400]);

      -[ICDocCamViewController flashSettingViewOnButton](self, "flashSettingViewOnButton");
      v38 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setAccessibilityTraits:", objc_msgSend(v38, "accessibilityTraits") | v11);

      -[ICDocCamViewController flashSettingViewAutoButton](self, "flashSettingViewAutoButton");
      v39 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setAccessibilityTraits:", objc_msgSend(v39, "accessibilityTraits") & ~v11);

      +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("on"), CFSTR("on"), CFSTR("Localizable"));
      v36 = (id)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashButton](self, "flashButton");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAccessibilityValue:", v36);
LABEL_7:

      break;
    case 0:
      +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("off"), CFSTR("off"), CFSTR("Localizable"));
      v29 = (id)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController flashButton](self, "flashButton");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setAccessibilityValue:", v29);

      -[ICDocCamViewController flashSettingViewOffButton](self, "flashSettingViewOffButton");
      v30 = (id)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v30, "accessibilityTraits");
      v6 = *MEMORY[0x24BDF7400];
      objc_msgSend(v30, "setAccessibilityTraits:", *MEMORY[0x24BDF7400] | v5);

      -[ICDocCamViewController flashSettingViewOnButton](self, "flashSettingViewOnButton");
      v31 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setAccessibilityTraits:", objc_msgSend(v31, "accessibilityTraits") & ~v6);

      -[ICDocCamViewController flashSettingViewAutoButton](self, "flashSettingViewAutoButton");
      v32 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setAccessibilityTraits:", objc_msgSend(v32, "accessibilityTraits") & ~v6);

      break;
  }
  if (-[ICDocCamViewController flashSettingUIShowing](self, "flashSettingUIShowing"))
  {
    +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Hide flash settings"), CFSTR("Hide flash settings"), CFSTR("Localizable"));
    v40 = (id)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController flashButton](self, "flashButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAccessibilityLabel:", v40);

    -[ICDocCamViewController flashButton](self, "flashButton");
    v41 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setAccessibilityHint:", 0);
  }
  else
  {
    +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Show flash settings"), CFSTR("Show flash settings"), CFSTR("Localizable"));
    v42 = (id)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController flashButton](self, "flashButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAccessibilityLabel:", v42);

    +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Double-tap to change the flash setting"), CFSTR("Double-tap to change the flash setting"), CFSTR("Localizable"));
    v41 = (id)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController flashButton](self, "flashButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAccessibilityHint:", v41);

  }
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Double-tap to turn flash off"), CFSTR("Double-tap to turn flash off"), CFSTR("Localizable"));
  v43 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController flashSettingViewOffButton](self, "flashSettingViewOffButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAccessibilityHint:", v43);

  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Double-tap to turn flash on"), CFSTR("Double-tap to turn flash on"), CFSTR("Localizable"));
  v44 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController flashSettingViewOnButton](self, "flashSettingViewOnButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAccessibilityHint:", v44);

  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Double-tap to set flash to auto"), CFSTR("Double-tap to set flash to auto"), CFSTR("Localizable"));
  v45 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController flashSettingViewAutoButton](self, "flashSettingViewAutoButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAccessibilityHint:", v45);

  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Hide flash settings"), CFSTR("Hide flash settings"), CFSTR("Localizable"));
  v46 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController flashSettingViewFlashIcon](self, "flashSettingViewFlashIcon");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAccessibilityLabel:", v46);

  -[ICDocCamViewController flashButton](self, "flashButton");
  v47 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "accessibilityLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController flashButtonForIPhone](self, "flashButtonForIPhone");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAccessibilityLabel:", v19);

  -[ICDocCamViewController flashButton](self, "flashButton");
  v48 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "accessibilityHint");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController flashButtonForIPhone](self, "flashButtonForIPhone");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAccessibilityHint:", v21);

  -[ICDocCamViewController flashButton](self, "flashButton");
  v49 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "accessibilityValue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController flashButtonForIPhone](self, "flashButtonForIPhone");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setAccessibilityValue:", v23);

  -[ICDocCamViewController flashSettingViewOffButton](self, "flashSettingViewOffButton");
  v50 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "_accessibilitySetIsSpeakThisElement:", 1);

  -[ICDocCamViewController flashSettingViewOnButton](self, "flashSettingViewOnButton");
  v51 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "_accessibilitySetIsSpeakThisElement:", 1);

  -[ICDocCamViewController flashSettingViewAutoButton](self, "flashSettingViewAutoButton");
  v52 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "_accessibilitySetIsSpeakThisElement:", 1);

  -[ICDocCamViewController flashButton](self, "flashButton");
  v53 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "accessibilityLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController flashButton](self, "flashButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setLargeContentTitle:", v25);

  -[ICDocCamViewController flashButtonForIPhone](self, "flashButtonForIPhone");
  v54 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "accessibilityLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController flashButtonForIPhone](self, "flashButtonForIPhone");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setLargeContentTitle:", v27);

}

- (void)updateAccessibilityForAutoShutterMode:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v14, "userInterfaceIdiom");

  if (v5)
  {
    -[ICDocCamViewController autoButton](self, "autoButton");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v15, "accessibilityTraits");
    if (v3)
    {
      v7 = *MEMORY[0x24BDF7400];
      objc_msgSend(v15, "setAccessibilityTraits:", *MEMORY[0x24BDF7400] | v6);

      -[ICDocCamViewController manualButton](self, "manualButton");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setAccessibilityTraits:", objc_msgSend(v16, "accessibilityTraits") & ~v7);

      -[ICDocCamViewController autoButton](self, "autoButton");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAccessibilityHint:", 0);

      +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Double-tap to change shutter mode to manual."), CFSTR("Double-tap to change shutter mode to manual."), CFSTR("Localizable"));
      v18 = (id)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController manualButton](self, "manualButton");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAccessibilityHint:", v18);

    }
    else
    {
      v11 = *MEMORY[0x24BDF7400];
      objc_msgSend(v15, "setAccessibilityTraits:", v6 & ~*MEMORY[0x24BDF7400]);

      -[ICDocCamViewController manualButton](self, "manualButton");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setAccessibilityTraits:", objc_msgSend(v20, "accessibilityTraits") | v11);

      +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Double-tap to change shutter mode to automatic."), CFSTR("Double-tap to change shutter mode to automatic."), CFSTR("Localizable"));
      v21 = (id)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController autoButton](self, "autoButton");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAccessibilityHint:", v21);

      -[ICDocCamViewController manualButton](self, "manualButton");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setAccessibilityHint:", 0);
    }
  }
  else
  {
    +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Double-tap to toggle shutter mode."), CFSTR("Double-tap to toggle shutter mode."), CFSTR("Localizable"));
    v19 = (id)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController autoButtonForIPhone](self, "autoButtonForIPhone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAccessibilityHint:", v19);

    -[ICDocCamViewController autoButtonForIPhone](self, "autoButtonForIPhone");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v18, "accessibilityTraits");
    objc_msgSend(v18, "setAccessibilityTraits:", v10 & ~*MEMORY[0x24BDF73E8]);
  }

  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Take picture"), CFSTR("Take picture"), CFSTR("Localizable"));
  v22 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController shutterButton](self, "shutterButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAccessibilityLabel:", v22);

}

- (void)speakLabelTextForAccessibilityIfNecessary:(id)a3 afterDelay:(double)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  dispatch_time_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  char v14;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    do
    {
      v8 = objc_msgSend(v7, "isHidden");
      if ((v8 & 1) != 0)
        break;
      objc_msgSend(v7, "superview");
      v9 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v9;
    }
    while (v9);
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  v10 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __79__ICDocCamViewController_speakLabelTextForAccessibilityIfNecessary_afterDelay___block_invoke;
  v12[3] = &unk_24C5B8A40;
  v14 = v8;
  v13 = v6;
  v11 = v6;
  dispatch_after(v10, MEMORY[0x24BDAC9B8], v12);

}

void __79__ICDocCamViewController_speakLabelTextForAccessibilityIfNecessary_afterDelay___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id argument;

  if (!*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "text");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "length");

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "text");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dc_stringByReplacingNewlineCharactersWithWhiteSpace");
      argument = (id)objc_claimAutoreleasedReturnValue();

      UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], argument);
    }
  }
}

- (BOOL)accessibilityPerformEscape
{
  -[ICDocCamViewController cancelAction:](self, "cancelAction:", 0);
  return 1;
}

- (void)updateRecentlyObservedRectanglesWithRect:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t i;
  void *v16;
  double v17;
  double v18;
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
  double v31;
  void *v32;
  unint64_t v33;
  void *v34;
  unint64_t v35;
  void *v36;
  unint64_t v37;
  void *v38;
  unint64_t v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  _BOOL4 v44;
  const __CFString *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[ICDocCamViewController recentRectangleObservations](self, "recentRectangleObservations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v5);
    -[ICDocCamViewController recentRectangleObservations](self, "recentRectangleObservations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v4);

    -[ICDocCamViewController recentRectangleObservations](self, "recentRectangleObservations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 < 6)
    {
LABEL_29:
      objc_sync_exit(v5);

      goto LABEL_30;
    }
    -[ICDocCamViewController recentRectangleObservations](self, "recentRectangleObservations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectAtIndex:", 0);

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    -[ICDocCamViewController recentRectangleObservations](self, "recentRectangleObservations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v52;
      v13 = 0.0;
      v49 = 0.0;
      v50 = 0.0;
      v14 = 0.0;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          v48 = v13;
          if (*(_QWORD *)v52 != v12)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          objc_msgSend(v16, "topLeft");
          v18 = v17;
          objc_msgSend(v16, "bottomLeft");
          v20 = v19;
          objc_msgSend(v16, "topLeft");
          v22 = v21;
          objc_msgSend(v16, "topRight");
          v24 = v23;
          objc_msgSend(v16, "topRight");
          v26 = v25;
          objc_msgSend(v16, "bottomRight");
          v28 = v27;
          objc_msgSend(v16, "bottomLeft");
          v30 = v29;
          objc_msgSend(v16, "bottomRight");
          v14 = v14 + (v18 + v20) * 0.5;
          v49 = v49 + (v26 + v28) * 0.5;
          v50 = v50 + (v22 + v24) * 0.5;
          v13 = v48 + (v30 + v31) * 0.5;
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
      }
      while (v11);
    }
    else
    {
      v13 = 0.0;
      v49 = 0.0;
      v50 = 0.0;
      v14 = 0.0;
    }

    -[ICDocCamViewController recentRectangleObservations](self, "recentRectangleObservations");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "count");

    -[ICDocCamViewController recentRectangleObservations](self, "recentRectangleObservations");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "count");

    -[ICDocCamViewController recentRectangleObservations](self, "recentRectangleObservations");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "count");

    -[ICDocCamViewController recentRectangleObservations](self, "recentRectangleObservations");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "count");

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController lastAXPositionAnnouncementDate](self, "lastAXPositionAnnouncementDate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "timeIntervalSinceDate:", v41);
    if (v42 > 2.5)
    {

    }
    else
    {
      -[ICDocCamViewController lastAXPositionAnnouncementDate](self, "lastAXPositionAnnouncementDate");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v43 == 0;

      if (!v44)
      {
LABEL_28:

        goto LABEL_29;
      }
    }
    if (v14 / (double)v33 >= 0.075)
    {
      if (v50 / (double)v35 <= 0.925)
      {
        if (v49 / (double)v37 <= 0.925)
        {
          if (v13 / (double)v39 >= 0.075)
          {
            v47 = 0;
            __UIAccessibilitySpeakAndDoNotBeInterrupted((NSString *)+[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Hold camera still"), CFSTR("Hold camera still"), CFSTR("Localizable")));
LABEL_27:
            -[ICDocCamViewController setLastAXPositionAnnouncementDate:](self, "setLastAXPositionAnnouncementDate:", v40);

            goto LABEL_28;
          }
          v45 = CFSTR("Move camera slightly down and hold still");
        }
        else
        {
          v45 = CFSTR("Move camera slightly right and hold still");
        }
      }
      else
      {
        v45 = CFSTR("Move camera slightly up and hold still");
      }
    }
    else
    {
      v45 = CFSTR("Move camera slightly left and hold still");
    }
    +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", v45, v45, CFSTR("Localizable"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      v47 = v46;
      UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v46);
    }
    else
    {
      v47 = 0;
    }
    goto LABEL_27;
  }
LABEL_30:

}

- (void)speakScannedDocumentForAccessibilityIfNecessary
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_668);
}

void __73__ICDocCamViewController_speakScannedDocumentForAccessibilityIfNecessary__block_invoke()
{
  id v0;

  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Scanned Documents"), CFSTR("Scanned Documents"), CFSTR("Localizable"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v0);

}

- (void)updateAccessibilityEnabledStateForUIElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _QWORD v24[8];

  v24[7] = *MEMORY[0x24BDAC8D0];
  -[ICDocCamViewController flashButton](self, "flashButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v3;
  -[ICDocCamViewController filterButton](self, "filterButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v4;
  -[ICDocCamViewController autoButton](self, "autoButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v5;
  -[ICDocCamViewController manualButton](self, "manualButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v6;
  -[ICDocCamViewController flashButtonForIPhone](self, "flashButtonForIPhone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v7;
  -[ICDocCamViewController filterButtonForIPhone](self, "filterButtonForIPhone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v8;
  -[ICDocCamViewController autoButtonForIPhone](self, "autoButtonForIPhone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v20;
    v14 = *MEMORY[0x24BDF73E8];
    v15 = ~*MEMORY[0x24BDF73E8];
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v17, "isEnabled", (_QWORD)v19))
          v18 = objc_msgSend(v17, "accessibilityTraits") & v15;
        else
          v18 = v14 | objc_msgSend(v17, "accessibilityTraits");
        objc_msgSend(v17, "setAccessibilityTraits:", v18);
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

}

- (void)updateFonts
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v3 = *MEMORY[0x24BDF77B0];
  objc_msgSend(MEMORY[0x24BDF6A70], "dc_preferredFontForTextStyle:adjustedForDefaultSize:", *MEMORY[0x24BDF77B0], 16.0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController userPromptLabel](self, "userPromptLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v9);

  objc_msgSend(MEMORY[0x24BDF6A70], "dc_preferredFontForTextStyle:adjustedForDefaultSize:", v3, 16.0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController filterNameFeedbackLabel](self, "filterNameFeedbackLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v10);

  objc_msgSend(MEMORY[0x24BDF6A70], "dc_preferredFontForTextStyle:adjustedForDefaultSize:", v3, 14.0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController autoShutterOnLabel](self, "autoShutterOnLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v11);

  objc_msgSend(MEMORY[0x24BDF6A70], "dc_preferredFontForTextStyle:adjustedForDefaultSize:", v3, 14.0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController autoShutterOffLabel](self, "autoShutterOffLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v12);

  objc_msgSend(MEMORY[0x24BDF6A70], "dc_preferredFontForTextStyle:adjustedForDefaultSize:", v3, 16.0);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController moveCameraCloserLabel](self, "moveCameraCloserLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v13);

}

- (void)didRecognizeRectangleForAccessibility:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  id *v6;
  void *v7;
  void *v8;
  _Unwind_Exception *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a3;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v5 = -[ICDocCamViewController hasCandidateRectanglesForAX](self, "hasCandidateRectanglesForAX");
    if (v3)
    {
      if ((v5 & 1) == 0)
      {
        -[ICDocCamViewController setHasCandidateRectanglesForAX:](self, "setHasCandidateRectanglesForAX:", 1);
        -[ICDocCamViewController setAxConsecutiveRecognizerStateCount:](self, "setAxConsecutiveRecognizerStateCount:", 1);
      }
      if (-[ICDocCamViewController axConsecutiveRecognizerStateCount](self, "axConsecutiveRecognizerStateCount") != 5)
        goto LABEL_17;
      v10 = 0;
      v11 = &v10;
      v12 = 0x2020000000;
      v6 = (id *)getkAXAnnouncementEnteredValidStateSoundSymbolLoc(void)::ptr;
      v13 = getkAXAnnouncementEnteredValidStateSoundSymbolLoc(void)::ptr;
      if (!getkAXAnnouncementEnteredValidStateSoundSymbolLoc(void)::ptr)
      {
        v7 = (void *)AXRuntimeLibrary();
        v6 = (id *)dlsym(v7, "kAXAnnouncementEnteredValidStateSound");
        v11[3] = (uint64_t)v6;
        getkAXAnnouncementEnteredValidStateSoundSymbolLoc(void)::ptr = (uint64_t)v6;
      }
      _Block_object_dispose(&v10, 8);
      if (v6)
        goto LABEL_16;
      v5 = -[ICRemoteDocCamViewController viewDidLoad].cold.1();
    }
    if (v5)
    {
      -[ICDocCamViewController setHasCandidateRectanglesForAX:](self, "setHasCandidateRectanglesForAX:", 0);
      -[ICDocCamViewController setAxConsecutiveRecognizerStateCount:](self, "setAxConsecutiveRecognizerStateCount:", 1);
    }
    if (-[ICDocCamViewController axConsecutiveRecognizerStateCount](self, "axConsecutiveRecognizerStateCount", v10) != 5)
      goto LABEL_17;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v6 = (id *)getkAXAnnouncementExitedValidStateSoundSymbolLoc(void)::ptr;
    v13 = getkAXAnnouncementExitedValidStateSoundSymbolLoc(void)::ptr;
    if (!getkAXAnnouncementExitedValidStateSoundSymbolLoc(void)::ptr)
    {
      v8 = (void *)AXRuntimeLibrary();
      v6 = (id *)dlsym(v8, "kAXAnnouncementExitedValidStateSound");
      v11[3] = (uint64_t)v6;
      getkAXAnnouncementExitedValidStateSoundSymbolLoc(void)::ptr = (uint64_t)v6;
    }
    _Block_object_dispose(&v10, 8);
    if (!v6)
    {
      v9 = (_Unwind_Exception *)-[ICRemoteDocCamViewController viewDidLoad].cold.1();
      _Block_object_dispose(&v10, 8);
      _Unwind_Resume(v9);
    }
LABEL_16:
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], *v6);
LABEL_17:
    -[ICDocCamViewController setAxConsecutiveRecognizerStateCount:](self, "setAxConsecutiveRecognizerStateCount:", -[ICDocCamViewController axConsecutiveRecognizerStateCount](self, "axConsecutiveRecognizerStateCount", v10) + 1);
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void (**v4)(void);

  objc_msgSend(a3, "valueForKey:", CFSTR("animationCompletionBlockKey"), a4);
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v4)
    v4[2]();

}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  ICDocCamThumbnailZoomTransitionAnimator *v8;
  void *v9;
  void *v10;
  void *v11;
  ICDocCamThumbnailZoomTransitionAnimator *v12;
  _BOOL4 v13;
  ICDocCamRetakeTransitionAnimator *v14;
  void *v15;
  void *v16;
  void *v17;
  ICDocCamRecropTransitionAnimator *v18;
  void *v19;
  void *v20;
  int64_t v21;
  void *v22;
  ICDocCamRecropTransitionAnimator *v23;

  if (-[ICDocCamViewController useCustomThumbnailZoomTransition](self, "useCustomThumbnailZoomTransition", a3, a4, a5, a6))
  {
    -[ICDocCamViewController setUseCustomThumbnailZoomTransition:](self, "setUseCustomThumbnailZoomTransition:", 0);
    v8 = [ICDocCamThumbnailZoomTransitionAnimator alloc];
    -[ICDocCamViewController imageForThumbnailZoom](self, "imageForThumbnailZoom");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController indexPathForThumbnailZoom](self, "indexPathForThumbnailZoom");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewController thumbnailZoomCompletionBlock](self, "thumbnailZoomCompletionBlock");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[ICDocCamThumbnailZoomTransitionAnimator initWithImage:indexPath:duration:completion:](v8, "initWithImage:indexPath:duration:completion:", v9, v10, v11, 0.5);

    -[ICDocCamThumbnailZoomTransitionAnimator setPresenting:](v12, "setPresenting:", a4 == 1);
    -[ICDocCamViewController setImageForThumbnailZoom:](self, "setImageForThumbnailZoom:", 0);
  }
  else
  {
    v13 = -[ICDocCamViewController useCustomRetakeTransition](self, "useCustomRetakeTransition");
    if (a4 == 2 && v13)
    {
      -[ICDocCamViewController setUseCustomRetakeTransition:](self, "setUseCustomRetakeTransition:", 0);
      v14 = [ICDocCamRetakeTransitionAnimator alloc];
      -[ICDocCamViewController imageForRetake](self, "imageForRetake");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController indexPathForRetake](self, "indexPathForRetake");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController retakeCompletionBlock](self, "retakeCompletionBlock");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[ICDocCamRetakeTransitionAnimator initWithImage:indexPath:duration:completion:](v14, "initWithImage:indexPath:duration:completion:", v15, v16, v17, 0.28);

      -[ICDocCamThumbnailZoomTransitionAnimator setPresenting:](v12, "setPresenting:", 0);
      -[ICDocCamViewController setImageForRetake:](self, "setImageForRetake:", 0);
    }
    else if (-[ICDocCamViewController useCustomRecropTransition](self, "useCustomRecropTransition"))
    {
      v18 = [ICDocCamRecropTransitionAnimator alloc];
      -[ICDocCamViewController filteredImageForRecrop](self, "filteredImageForRecrop");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController unfilteredImageForRecrop](self, "unfilteredImageForRecrop");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[ICDocCamViewController orientationForRecrop](self, "orientationForRecrop");
      -[ICDocCamViewController indexPathForRecrop](self, "indexPathForRecrop");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[ICDocCamRecropTransitionAnimator initWithImage:unfilteredImage:orientation:indexPath:duration:completion:](v18, "initWithImage:unfilteredImage:orientation:indexPath:duration:completion:", v19, v20, v21, v22, 0, 0.65);

      -[ICDocCamViewController setFilteredImageForRecrop:](self, "setFilteredImageForRecrop:", 0);
      -[ICDocCamViewController setUnfilteredImageForRecrop:](self, "setUnfilteredImageForRecrop:", 0);
      -[ICDocCamRecropTransitionAnimator setPresenting:](v23, "setPresenting:", a4 == 1);
      if (!-[ICDocCamRecropTransitionAnimator presenting](v23, "presenting"))
        -[ICDocCamViewController setUseCustomRecropTransition:](self, "setUseCustomRecropTransition:", 0);
      v12 = (ICDocCamThumbnailZoomTransitionAnimator *)v23;
    }
    else
    {
      v12 = 0;
    }
  }
  return v12;
}

- (CGRect)zoomTargetForIndexPath:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
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
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CGRect result;

  v4 = a3;
  if (-[ICDocCamViewController zoomTargetShouldUseCustomImageFrame](self, "zoomTargetShouldUseCustomImageFrame"))
  {
    -[ICDocCamViewController zoomTargetCustomImageFrame](self, "zoomTargetCustomImageFrame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
  }
  else
  {
    v13 = v4;
    v14 = objc_opt_class();
    -[ICDocCamViewController thumbnailContainerView](self, "thumbnailContainerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "collectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "collectionViewLayout");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    DCDynamicCast(v14, (uint64_t)v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v18, "compactLayout"))
    {
      v19 = (void *)MEMORY[0x24BDD15D8];
      -[ICDocCamViewController documentInfoCollection](self, "documentInfoCollection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "docInfos");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "indexPathForItem:inSection:", objc_msgSend(v21, "count") - 1, 0);
      v22 = objc_claimAutoreleasedReturnValue();

      v13 = (id)v22;
    }
    -[ICDocCamViewController thumbnailViewController](self, "thumbnailViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "collectionView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "cellForItemAtIndexPath:", v13);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICDocCamViewController thumbnailViewController](self, "thumbnailViewController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "collectionView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "frame");
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    -[ICDocCamViewController view](self, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "convertRect:toView:", v36, v29, v31, v33, v35);
    v6 = v37;
    v8 = v38;
    v10 = v39;
    v12 = v40;

  }
  v41 = v6;
  v42 = v8;
  v43 = v10;
  v44 = v12;
  result.size.height = v44;
  result.size.width = v43;
  result.origin.y = v42;
  result.origin.x = v41;
  return result;
}

- (void)toggleRecording:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];

  -[ICDocCamViewController recordButton](self, "recordButton", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 0);

  -[ICDocCamViewController movieController](self, "movieController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRecording");

  if (v6)
  {
    -[ICDocCamViewController movieController](self, "movieController");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stopRecording");
LABEL_3:

    return;
  }
  if (-[ICDocCamViewController autoMode](self, "autoMode"))
  {
    objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Scan Movie Recording"), CFSTR("Recording only works with manual shutter mode."), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("exclamationmark.triangle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v8);

    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __42__ICDocCamViewController_toggleRecording___block_invoke;
    v19[3] = &unk_24C5B8B50;
    v19[4] = self;
    objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", CFSTR("OK"), 1, v19);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v9);

    -[ICDocCamViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
  }
  else
  {
    if (-[ICDocCamViewController scanMovieRecordingDontShowWarning](self, "scanMovieRecordingDontShowWarning"))
    {
      -[ICDocCamViewController movieController](self, "movieController");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "startRecording");
      goto LABEL_3;
    }
    objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Scan Movie Recording"), CFSTR("Do not:\nRotate device.\nPut app into background.\nInvoke Split View or Slide Over mode.\nDo anything other than hit the Stop button."), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("exclamationmark.triangle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v10);

    v11 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __42__ICDocCamViewController_toggleRecording___block_invoke_2;
    v18[3] = &unk_24C5B8B50;
    v18[4] = self;
    objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", CFSTR("Do not show again"), 0, v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v12);

    v17[0] = v11;
    v17[1] = 3221225472;
    v17[2] = __42__ICDocCamViewController_toggleRecording___block_invoke_3;
    v17[3] = &unk_24C5B8B50;
    v17[4] = self;
    objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v13);

    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __42__ICDocCamViewController_toggleRecording___block_invoke_4;
    v16[3] = &unk_24C5B8B50;
    v16[4] = self;
    objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", CFSTR("OK"), 0, v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v14);

    -[ICDocCamViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
  }

}

void __42__ICDocCamViewController_toggleRecording___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "recordButton");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setEnabled:", 1);

}

void __42__ICDocCamViewController_toggleRecording___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setScanMovieRecordingDontShowWarning:", 1);
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBool:forKey:", 1, CFSTR("internalSettings.docCam.scanMovieRecording.doNotShowWarning"));

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronize");

  objc_msgSend(*(id *)(a1 + 32), "movieController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startRecording");

}

void __42__ICDocCamViewController_toggleRecording___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "recordButton");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setEnabled:", 1);

}

void __42__ICDocCamViewController_toggleRecording___block_invoke_4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "movieController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "startRecording");

}

- (void)enableUIElementsForMovieRecording:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v3 = a3;
  -[ICDocCamViewController flashButton](self, "flashButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v3);

  -[ICDocCamViewController filterButton](self, "filterButton");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v3);

  -[ICDocCamViewController autoButton](self, "autoButton");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", v3);

  -[ICDocCamViewController manualButton](self, "manualButton");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v3);

  -[ICDocCamViewController shutterButton](self, "shutterButton");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v3);

  -[ICDocCamViewController cancelButton](self, "cancelButton");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", v3);

  -[ICDocCamViewController flashButtonForIPhone](self, "flashButtonForIPhone");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEnabled:", v3);

  -[ICDocCamViewController filterButtonForIPhone](self, "filterButtonForIPhone");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEnabled:", v3);

  -[ICDocCamViewController autoButtonForIPhone](self, "autoButtonForIPhone");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setEnabled:", v3);

  -[ICDocCamViewController cancelButtonForIPhone](self, "cancelButtonForIPhone");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setEnabled:", v3);

}

- (void)showErrorForMovieRecording:(id)a3
{
  id v4;
  __CFRunLoop *Main;
  const void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  ICDocCamViewController *v10;

  v4 = a3;
  Main = CFRunLoopGetMain();
  v6 = (const void *)*MEMORY[0x24BDBD598];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__ICDocCamViewController_showErrorForMovieRecording___block_invoke;
  v8[3] = &unk_24C5B8E20;
  v7 = v4;
  v9 = v7;
  v10 = self;
  CFRunLoopPerformBlock(Main, v6, v8);

}

void __53__ICDocCamViewController_showErrorForMovieRecording___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v2 = (void *)MEMORY[0x24BDF67F0];
  objc_msgSend(*(id *)(a1 + 32), "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "localizedFailureReason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alertControllerWithTitle:message:preferredStyle:", v3, v4, 1);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("exclamationmark.triangle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v5);

  v6 = (void *)MEMORY[0x24BDF67E8];
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("OK"), CFSTR("OK"), CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v8);

  objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v9, 1, 0);
}

- (void)pauseCaptureSessionForMovieRecording
{
  int v3;
  id v4;
  id v5;

  -[ICDocCamViewController session](self, "session");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "isRunning");

  if (v3)
  {
    -[ICDocCamViewController session](self, "session");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopRunning");

  }
}

- (void)resumeCaptureSessionForMovieRecording
{
  char v3;
  id v4;
  id v5;

  -[ICDocCamViewController session](self, "session");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "isRunning");

  if ((v3 & 1) == 0)
  {
    -[ICDocCamViewController session](self, "session");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startRunning");

  }
}

- (void)enableRecordButton:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[ICDocCamViewController recordButton](self, "recordButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)changeRecordButtonTitle:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[ICDocCamViewController recordButton](self, "recordButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:forState:", v5, 0);

}

- (void)createPhysicalCaptureRecognizerOrNotifierIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  ICDocCamPhysicalCaptureRecognizer *v6;
  id v7;
  id v8;
  id v9;
  ICDocCamPhysicalCaptureNotifier *v10;

  if (-[ICDocCamViewController useGestureRecognizerForVolumeButtons](self, "useGestureRecognizerForVolumeButtons"))
  {
    -[ICDocCamViewController physicalCaptureRecognizer](self, "physicalCaptureRecognizer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v6 = -[ICDocCamPhysicalCaptureRecognizer initWithTarget:action:]([ICDocCamPhysicalCaptureRecognizer alloc], "initWithTarget:action:", self, sel_handleVolumeButtonPress_);
      -[ICDocCamViewController setPhysicalCaptureRecognizer:](self, "setPhysicalCaptureRecognizer:");

      -[ICDocCamViewController physicalCaptureRecognizer](self, "physicalCaptureRecognizer");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDesiredButtons:", &unk_24C5D8608);

      -[ICDocCamViewController physicalCaptureRecognizer](self, "physicalCaptureRecognizer");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setActiveButton:", 1);

      -[ICDocCamViewController view](self, "view");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[ICDocCamViewController physicalCaptureRecognizer](self, "physicalCaptureRecognizer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addGestureRecognizer:", v4);

LABEL_7:
    }
  }
  else
  {
    -[ICDocCamViewController physicalCaptureNotifier](self, "physicalCaptureNotifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v10 = objc_alloc_init(ICDocCamPhysicalCaptureNotifier);
      -[ICDocCamViewController setPhysicalCaptureNotifier:](self, "setPhysicalCaptureNotifier:");

      -[ICDocCamViewController physicalCaptureNotifier](self, "physicalCaptureNotifier");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDelegate:", self);
      goto LABEL_7;
    }
  }
}

- (void)physicalCaptureNotifierDidChangeState:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;

  v4 = objc_msgSend(a3, "state");
  -[ICDocCamViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isKeyWindow");

  if (v7)
  {
    if (v4)
    {
      if (v4 == 1)
        -[ICDocCamViewController handlePhysicalButtonPressed:](self, "handlePhysicalButtonPressed:", 1);
    }
    else
    {
      -[ICDocCamViewController handlePhysicalButtonReleased:](self, "handlePhysicalButtonReleased:", 1);
    }
  }
}

- (void)handlePhysicalButtonPressed:(int64_t)a3
{
  int v4;
  id v5;

  -[ICDocCamViewController shutterButton](self, "shutterButton", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v5, "isEnabled");
  if (((v4 ^ 1 | objc_msgSend(v5, "isTouchInside")) & 1) == 0)
  {
    -[ICDocCamViewController setCapturingFromPhysicalButton:](self, "setCapturingFromPhysicalButton:", 1);
    objc_msgSend(v5, "setHighlighted:", 1);
  }

}

- (void)handlePhysicalButtonReleased:(int64_t)a3
{
  id v4;

  if (-[ICDocCamViewController capturingFromPhysicalButton](self, "capturingFromPhysicalButton", a3))
  {
    -[ICDocCamViewController shutterButton](self, "shutterButton");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHighlighted:", 0);
    -[ICDocCamViewController shutterButtonAction:](self, "shutterButtonAction:", 0);
    -[ICDocCamViewController setCapturingFromPhysicalButton:](self, "setCapturingFromPhysicalButton:", 0);

  }
}

- (BOOL)useGestureRecognizerForVolumeButtons
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)removeSaveActionBlockerForFiles
{
  id v2;

  -[ICDocCamViewController processRequestsBlocker](self, "processRequestsBlocker");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeBlockerOfType:", CFSTR("SaveActionBlocker"));

}

- (ICDocCamViewControllerDelegate)delegate
{
  return (ICDocCamViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ICDocCamThumbnailContainerView)thumbnailContainerView
{
  return self->_thumbnailContainerView;
}

- (void)setThumbnailContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailContainerView, a3);
}

- (ICDocCamThumbnailCollectionViewController)thumbnailViewController
{
  return self->_thumbnailViewController;
}

- (void)setThumbnailViewController:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailViewController, a3);
}

- (int64_t)setupResult
{
  return self->_setupResult;
}

- (void)setSetupResult:(int64_t)a3
{
  self->_setupResult = a3;
}

- (ICDocCamPreviewView)previewView
{
  return (ICDocCamPreviewView *)objc_loadWeakRetained((id *)&self->_previewView);
}

- (void)setPreviewView:(id)a3
{
  objc_storeWeak((id *)&self->_previewView, a3);
}

- (UIView)cameraUnavailableScrim
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_cameraUnavailableScrim);
}

- (void)setCameraUnavailableScrim:(id)a3
{
  objc_storeWeak((id *)&self->_cameraUnavailableScrim, a3);
}

- (UIView)cameraUnavailableView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_cameraUnavailableView);
}

- (void)setCameraUnavailableView:(id)a3
{
  objc_storeWeak((id *)&self->_cameraUnavailableView, a3);
}

- (UILabel)cameraUnavailableLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_cameraUnavailableLabel);
}

- (void)setCameraUnavailableLabel:(id)a3
{
  objc_storeWeak((id *)&self->_cameraUnavailableLabel, a3);
}

- (UIButton)resumeButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_resumeButton);
}

- (void)setResumeButton:(id)a3
{
  objc_storeWeak((id *)&self->_resumeButton, a3);
}

- (ICDocCamShutterButton)shutterButton
{
  return (ICDocCamShutterButton *)objc_loadWeakRetained((id *)&self->_shutterButton);
}

- (void)setShutterButton:(id)a3
{
  objc_storeWeak((id *)&self->_shutterButton, a3);
}

- (NSLayoutConstraint)shutterButtonBottomConstraintForPortraitIPhone
{
  return self->_shutterButtonBottomConstraintForPortraitIPhone;
}

- (void)setShutterButtonBottomConstraintForPortraitIPhone:(id)a3
{
  objc_storeStrong((id *)&self->_shutterButtonBottomConstraintForPortraitIPhone, a3);
}

- (NSLayoutConstraint)shutterButtonBottomConstraintForLandscapeIPhone
{
  return self->_shutterButtonBottomConstraintForLandscapeIPhone;
}

- (void)setShutterButtonBottomConstraintForLandscapeIPhone:(id)a3
{
  objc_storeStrong((id *)&self->_shutterButtonBottomConstraintForLandscapeIPhone, a3);
}

- (UIView)autoShutterOnView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_autoShutterOnView);
}

- (void)setAutoShutterOnView:(id)a3
{
  objc_storeWeak((id *)&self->_autoShutterOnView, a3);
}

- (UILabel)autoShutterOnLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_autoShutterOnLabel);
}

- (void)setAutoShutterOnLabel:(id)a3
{
  objc_storeWeak((id *)&self->_autoShutterOnLabel, a3);
}

- (NSLayoutConstraint)autoShutterOnTopLayoutConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_autoShutterOnTopLayoutConstraint);
}

- (void)setAutoShutterOnTopLayoutConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_autoShutterOnTopLayoutConstraint, a3);
}

- (UIView)autoShutterOffView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_autoShutterOffView);
}

- (void)setAutoShutterOffView:(id)a3
{
  objc_storeWeak((id *)&self->_autoShutterOffView, a3);
}

- (UILabel)autoShutterOffLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_autoShutterOffLabel);
}

- (void)setAutoShutterOffLabel:(id)a3
{
  objc_storeWeak((id *)&self->_autoShutterOffLabel, a3);
}

- (NSLayoutConstraint)autoShutterOffTopLayoutConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_autoShutterOffTopLayoutConstraint);
}

- (void)setAutoShutterOffTopLayoutConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_autoShutterOffTopLayoutConstraint, a3);
}

- (UIView)filterNameFeedbackView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_filterNameFeedbackView);
}

- (void)setFilterNameFeedbackView:(id)a3
{
  objc_storeWeak((id *)&self->_filterNameFeedbackView, a3);
}

- (UILabel)filterNameFeedbackLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_filterNameFeedbackLabel);
}

- (void)setFilterNameFeedbackLabel:(id)a3
{
  objc_storeWeak((id *)&self->_filterNameFeedbackLabel, a3);
}

- (NSLayoutConstraint)filterNameFeedbackViewTopLayoutConstraint
{
  return self->_filterNameFeedbackViewTopLayoutConstraint;
}

- (void)setFilterNameFeedbackViewTopLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_filterNameFeedbackViewTopLayoutConstraint, a3);
}

- (ICDocCamOverlayView)overlayView
{
  return (ICDocCamOverlayView *)objc_loadWeakRetained((id *)&self->_overlayView);
}

- (void)setOverlayView:(id)a3
{
  objc_storeWeak((id *)&self->_overlayView, a3);
}

- (UIView)userPromptView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_userPromptView);
}

- (void)setUserPromptView:(id)a3
{
  objc_storeWeak((id *)&self->_userPromptView, a3);
}

- (UILabel)userPromptLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_userPromptLabel);
}

- (void)setUserPromptLabel:(id)a3
{
  objc_storeWeak((id *)&self->_userPromptLabel, a3);
}

- (UIView)moveCameraCloserView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_moveCameraCloserView);
}

- (void)setMoveCameraCloserView:(id)a3
{
  objc_storeWeak((id *)&self->_moveCameraCloserView, a3);
}

- (UILabel)moveCameraCloserLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_moveCameraCloserLabel);
}

- (void)setMoveCameraCloserLabel:(id)a3
{
  objc_storeWeak((id *)&self->_moveCameraCloserLabel, a3);
}

- (NSLayoutConstraint)thumbnailContainerViewLeadingConstraintForIPad
{
  return self->_thumbnailContainerViewLeadingConstraintForIPad;
}

- (void)setThumbnailContainerViewLeadingConstraintForIPad:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailContainerViewLeadingConstraintForIPad, a3);
}

- (NSLayoutConstraint)thumbnailContainerViewTrailingConstraintForIPad
{
  return self->_thumbnailContainerViewTrailingConstraintForIPad;
}

- (void)setThumbnailContainerViewTrailingConstraintForIPad:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailContainerViewTrailingConstraintForIPad, a3);
}

- (NSLayoutConstraint)thumbnailContainerViewBottomConstraintForIPhone
{
  return self->_thumbnailContainerViewBottomConstraintForIPhone;
}

- (void)setThumbnailContainerViewBottomConstraintForIPhone:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailContainerViewBottomConstraintForIPhone, a3);
}

- (NSLayoutConstraint)thumbnailContainerViewLeadingConstraintForIPhone
{
  return self->_thumbnailContainerViewLeadingConstraintForIPhone;
}

- (void)setThumbnailContainerViewLeadingConstraintForIPhone:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailContainerViewLeadingConstraintForIPhone, a3);
}

- (UIView)scrimView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_scrimView);
}

- (void)setScrimView:(id)a3
{
  objc_storeWeak((id *)&self->_scrimView, a3);
}

- (UIButton)cancelButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_cancelButton);
}

- (void)setCancelButton:(id)a3
{
  objc_storeWeak((id *)&self->_cancelButton, a3);
}

- (ICDocCamSaveButton)saveButton
{
  return self->_saveButton;
}

- (void)setSaveButton:(id)a3
{
  objc_storeStrong((id *)&self->_saveButton, a3);
}

- (NSLayoutConstraint)saveButtonLandscapeVerticalConstraintForIPhone
{
  return self->_saveButtonLandscapeVerticalConstraintForIPhone;
}

- (void)setSaveButtonLandscapeVerticalConstraintForIPhone:(id)a3
{
  objc_storeStrong((id *)&self->_saveButtonLandscapeVerticalConstraintForIPhone, a3);
}

- (NSLayoutConstraint)saveButtonLandscapeTrailingConstraintForIPhone
{
  return self->_saveButtonLandscapeTrailingConstraintForIPhone;
}

- (void)setSaveButtonLandscapeTrailingConstraintForIPhone:(id)a3
{
  objc_storeStrong((id *)&self->_saveButtonLandscapeTrailingConstraintForIPhone, a3);
}

- (UIButton)autoButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_autoButton);
}

- (void)setAutoButton:(id)a3
{
  objc_storeWeak((id *)&self->_autoButton, a3);
}

- (UIButton)manualButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_manualButton);
}

- (void)setManualButton:(id)a3
{
  objc_storeWeak((id *)&self->_manualButton, a3);
}

- (UIButton)flashButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_flashButton);
}

- (void)setFlashButton:(id)a3
{
  objc_storeWeak((id *)&self->_flashButton, a3);
}

- (UIButton)filterButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_filterButton);
}

- (void)setFilterButton:(id)a3
{
  objc_storeWeak((id *)&self->_filterButton, a3);
}

- (BOOL)filterSettingUIShowing
{
  return self->_filterSettingUIShowing;
}

- (void)setFilterSettingUIShowing:(BOOL)a3
{
  self->_filterSettingUIShowing = a3;
}

- (BOOL)capturingFromPhysicalButton
{
  return self->_capturingFromPhysicalButton;
}

- (void)setCapturingFromPhysicalButton:(BOOL)a3
{
  self->_capturingFromPhysicalButton = a3;
}

- (UIView)flashSettingView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_flashSettingView);
}

- (void)setFlashSettingView:(id)a3
{
  objc_storeWeak((id *)&self->_flashSettingView, a3);
}

- (NSLayoutConstraint)flashSettingViewHeightConstraint
{
  return self->_flashSettingViewHeightConstraint;
}

- (void)setFlashSettingViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_flashSettingViewHeightConstraint, a3);
}

- (UIView)flashSettingButtonView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_flashSettingButtonView);
}

- (void)setFlashSettingButtonView:(id)a3
{
  objc_storeWeak((id *)&self->_flashSettingButtonView, a3);
}

- (UIButton)flashSettingViewFlashIcon
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_flashSettingViewFlashIcon);
}

- (void)setFlashSettingViewFlashIcon:(id)a3
{
  objc_storeWeak((id *)&self->_flashSettingViewFlashIcon, a3);
}

- (UIButton)flashSettingViewAutoButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_flashSettingViewAutoButton);
}

- (void)setFlashSettingViewAutoButton:(id)a3
{
  objc_storeWeak((id *)&self->_flashSettingViewAutoButton, a3);
}

- (UIButton)flashSettingViewOnButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_flashSettingViewOnButton);
}

- (void)setFlashSettingViewOnButton:(id)a3
{
  objc_storeWeak((id *)&self->_flashSettingViewOnButton, a3);
}

- (UIButton)flashSettingViewOffButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_flashSettingViewOffButton);
}

- (void)setFlashSettingViewOffButton:(id)a3
{
  objc_storeWeak((id *)&self->_flashSettingViewOffButton, a3);
}

- (NSLayoutConstraint)flashSettingWidthConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_flashSettingWidthConstraint);
}

- (void)setFlashSettingWidthConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_flashSettingWidthConstraint, a3);
}

- (BOOL)flashSettingUIShowing
{
  return self->_flashSettingUIShowing;
}

- (void)setFlashSettingUIShowing:(BOOL)a3
{
  self->_flashSettingUIShowing = a3;
}

- (OS_dispatch_queue)sessionQueue
{
  return self->_sessionQueue;
}

- (void)setSessionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_sessionQueue, a3);
}

- (AVCaptureSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (AVCaptureDeviceInput)videoDeviceInput
{
  return self->_videoDeviceInput;
}

- (void)setVideoDeviceInput:(id)a3
{
  objc_storeStrong((id *)&self->_videoDeviceInput, a3);
}

- (AVCapturePhotoSettings)photoSettings
{
  return self->_photoSettings;
}

- (void)setPhotoSettings:(id)a3
{
  objc_storeStrong((id *)&self->_photoSettings, a3);
}

- (AVCapturePhotoOutput)photoOutput
{
  return self->_photoOutput;
}

- (void)setPhotoOutput:(id)a3
{
  objc_storeStrong((id *)&self->_photoOutput, a3);
}

- (NSMutableDictionary)inProgressPhotoCaptureDelegates
{
  return self->_inProgressPhotoCaptureDelegates;
}

- (void)setInProgressPhotoCaptureDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_inProgressPhotoCaptureDelegates, a3);
}

- (AVCaptureVideoDataOutput)videoDataOutput
{
  return self->_videoDataOutput;
}

- (void)setVideoDataOutput:(id)a3
{
  objc_storeStrong((id *)&self->_videoDataOutput, a3);
}

- (AVCaptureVideoPreviewLayer)videoPreviewLayer
{
  return (AVCaptureVideoPreviewLayer *)objc_loadWeakRetained((id *)&self->_videoPreviewLayer);
}

- (void)setVideoPreviewLayer:(id)a3
{
  objc_storeWeak((id *)&self->_videoPreviewLayer, a3);
}

- (int64_t)statusBarOrientation
{
  return self->_statusBarOrientation;
}

- (void)setStatusBarOrientation:(int64_t)a3
{
  self->_statusBarOrientation = a3;
}

- (CGSize)viewBoundsSize
{
  double width;
  double height;
  CGSize result;

  width = self->_viewBoundsSize.width;
  height = self->_viewBoundsSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setViewBoundsSize:(CGSize)a3
{
  self->_viewBoundsSize = a3;
}

- (UIColor)cameraHighlightColor
{
  return self->_cameraHighlightColor;
}

- (void)setCameraHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_cameraHighlightColor, a3);
}

- (BOOL)isSessionRunning
{
  return self->_sessionRunning;
}

- (void)setSessionRunning:(BOOL)a3
{
  self->_sessionRunning = a3;
}

- (ICDocCamImageSequenceAnalyzer)vkAnalyzer
{
  return self->_vkAnalyzer;
}

- (void)setVkAnalyzer:(id)a3
{
  objc_storeStrong((id *)&self->_vkAnalyzer, a3);
}

- (ICDocCamRectangleResultsQueue)rectResultsQueue
{
  return (ICDocCamRectangleResultsQueue *)objc_getProperty(self, a2, 1608, 1);
}

- (void)setRectResultsQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1608);
}

- (BOOL)deviceHasFlash
{
  return self->_deviceHasFlash;
}

- (void)setDeviceHasFlash:(BOOL)a3
{
  self->_deviceHasFlash = a3;
}

- (int64_t)flashMode
{
  return self->_flashMode;
}

- (float)pixelFocalLength
{
  return self->_pixelFocalLength;
}

- (void)setPixelFocalLength:(float)a3
{
  self->_pixelFocalLength = a3;
}

- (NSData)cameraIntrinsicData
{
  return self->_cameraIntrinsicData;
}

- (void)setCameraIntrinsicData:(id)a3
{
  objc_storeStrong((id *)&self->_cameraIntrinsicData, a3);
}

- (BOOL)hideUserPrompt
{
  return self->_hideUserPrompt;
}

- (void)setHideUserPrompt:(BOOL)a3
{
  self->_hideUserPrompt = a3;
}

- (BOOL)adjustingFocus
{
  return self->_adjustingFocus;
}

- (void)setAdjustingFocus:(BOOL)a3
{
  self->_adjustingFocus = a3;
}

- (NSDate)lastSubjectAreaChange
{
  return (NSDate *)objc_getProperty(self, a2, 1632, 1);
}

- (void)setLastSubjectAreaChange:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1632);
}

- (ICDocCamDocumentInfoCollection)documentInfoCollection
{
  return self->_documentInfoCollection;
}

- (void)setDocumentInfoCollection:(id)a3
{
  objc_storeStrong((id *)&self->_documentInfoCollection, a3);
}

- (int64_t)retakeIndex
{
  return self->_retakeIndex;
}

- (void)setRetakeIndex:(int64_t)a3
{
  self->_retakeIndex = a3;
}

- (ICDocCamImageCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_imageCache, a3);
}

- (void)setSharedCoreImageContext:(id)a3
{
  objc_storeStrong((id *)&self->_sharedCoreImageContext, a3);
}

- (NSLayoutConstraint)userPromptViewVerticalConstraint
{
  return self->_userPromptViewVerticalConstraint;
}

- (void)setUserPromptViewVerticalConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_userPromptViewVerticalConstraint, a3);
}

- (NSLayoutConstraint)moveCameraCloserViewVerticalConstraint
{
  return self->_moveCameraCloserViewVerticalConstraint;
}

- (void)setMoveCameraCloserViewVerticalConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_moveCameraCloserViewVerticalConstraint, a3);
}

- (ICDocCamDocumentInfo)markupDocumentInfo
{
  return self->_markupDocumentInfo;
}

- (void)setMarkupDocumentInfo:(id)a3
{
  objc_storeStrong((id *)&self->_markupDocumentInfo, a3);
}

- (id)markupDismissCompletionBlock
{
  return self->_markupDismissCompletionBlock;
}

- (void)setMarkupDismissCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1696);
}

- (BKSAccelerometer)accelerometer
{
  return self->_accelerometer;
}

- (void)setAccelerometer:(id)a3
{
  objc_storeStrong((id *)&self->_accelerometer, a3);
}

- (float)rectangleMinimumAspectRatio
{
  return self->_rectangleMinimumAspectRatio;
}

- (void)setRectangleMinimumAspectRatio:(float)a3
{
  self->_rectangleMinimumAspectRatio = a3;
}

- (float)rectangleMaximumAspectRatio
{
  return self->_rectangleMaximumAspectRatio;
}

- (void)setRectangleMaximumAspectRatio:(float)a3
{
  self->_rectangleMaximumAspectRatio = a3;
}

- (float)rectangleQuadratureTolerance
{
  return self->_rectangleQuadratureTolerance;
}

- (void)setRectangleQuadratureTolerance:(float)a3
{
  self->_rectangleQuadratureTolerance = a3;
}

- (float)rectangleMinimumSize
{
  return self->_rectangleMinimumSize;
}

- (void)setRectangleMinimumSize:(float)a3
{
  self->_rectangleMinimumSize = a3;
}

- (float)rectangleMinimumConfidence
{
  return self->_rectangleMinimumConfidence;
}

- (void)setRectangleMinimumConfidence:(float)a3
{
  self->_rectangleMinimumConfidence = a3;
}

- (float)rectangleMinimumVisualConfidence
{
  return self->_rectangleMinimumVisualConfidence;
}

- (void)setRectangleMinimumVisualConfidence:(float)a3
{
  self->_rectangleMinimumVisualConfidence = a3;
}

- (int64_t)rectangleMaximumNumber
{
  return self->_rectangleMaximumNumber;
}

- (void)setRectangleMaximumNumber:(int64_t)a3
{
  self->_rectangleMaximumNumber = a3;
}

- (float)rectangleStabilityStdDev
{
  return self->_rectangleStabilityStdDev;
}

- (void)setRectangleStabilityStdDev:(float)a3
{
  self->_rectangleStabilityStdDev = a3;
}

- (float)segmentMinimumVisualConfidence
{
  return self->_segmentMinimumVisualConfidence;
}

- (void)setSegmentMinimumVisualConfidence:(float)a3
{
  self->_segmentMinimumVisualConfidence = a3;
}

- (float)segmentMinimumVisualConfidence60Frames
{
  return self->_segmentMinimumVisualConfidence60Frames;
}

- (void)setSegmentMinimumVisualConfidence60Frames:(float)a3
{
  self->_segmentMinimumVisualConfidence60Frames = a3;
}

- (float)segmentMinimumVisualConfidenceFinalScan
{
  return self->_segmentMinimumVisualConfidenceFinalScan;
}

- (void)setSegmentMinimumVisualConfidenceFinalScan:(float)a3
{
  self->_segmentMinimumVisualConfidenceFinalScan = a3;
}

- (float)segmentStabilityStdDev
{
  return self->_segmentStabilityStdDev;
}

- (void)setSegmentStabilityStdDev:(float)a3
{
  self->_segmentStabilityStdDev = a3;
}

- (float)segmentationFudgeFactor
{
  return self->_segmentationFudgeFactor;
}

- (void)setSegmentationFudgeFactor:(float)a3
{
  self->_segmentationFudgeFactor = a3;
}

- (CGPoint)segmentTopLeft
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_segmentTopLeft, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setSegmentTopLeft:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_segmentTopLeft, &v3, 16, 1, 0);
}

- (CGPoint)segmentTopRight
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_segmentTopRight, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setSegmentTopRight:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_segmentTopRight, &v3, 16, 1, 0);
}

- (CGPoint)segmentBottomLeft
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_segmentBottomLeft, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setSegmentBottomLeft:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_segmentBottomLeft, &v3, 16, 1, 0);
}

- (CGPoint)segmentBottomRight
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_segmentBottomRight, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setSegmentBottomRight:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_segmentBottomRight, &v3, 16, 1, 0);
}

- (BOOL)segmentMeanComputed
{
  return self->_segmentMeanComputed;
}

- (void)setSegmentMeanComputed:(BOOL)a3
{
  self->_segmentMeanComputed = a3;
}

- (BOOL)rectangleDetectionEnabled
{
  return self->_rectangleDetectionEnabled;
}

- (void)setRectangleDetectionEnabled:(BOOL)a3
{
  self->_rectangleDetectionEnabled = a3;
}

- (BOOL)registrationEnabled
{
  return self->_registrationEnabled;
}

- (void)setRegistrationEnabled:(BOOL)a3
{
  self->_registrationEnabled = a3;
}

- (BOOL)debugRectanglesEnabled
{
  return self->_debugRectanglesEnabled;
}

- (void)setDebugRectanglesEnabled:(BOOL)a3
{
  self->_debugRectanglesEnabled = a3;
}

- (BOOL)displayStringEnabled
{
  return self->_displayStringEnabled;
}

- (void)setDisplayStringEnabled:(BOOL)a3
{
  self->_displayStringEnabled = a3;
}

- (BOOL)realTimeRectangleDetection
{
  return self->_realTimeRectangleDetection;
}

- (void)setRealTimeRectangleDetection:(BOOL)a3
{
  self->_realTimeRectangleDetection = a3;
}

- (BOOL)synchronousRectangleDetection
{
  return self->_synchronousRectangleDetection;
}

- (void)setSynchronousRectangleDetection:(BOOL)a3
{
  self->_synchronousRectangleDetection = a3;
}

- (int64_t)queueSizeForRectangleDetection
{
  return self->_queueSizeForRectangleDetection;
}

- (void)setQueueSizeForRectangleDetection:(int64_t)a3
{
  self->_queueSizeForRectangleDetection = a3;
}

- (ICDocCamProcessingBlocker)processRequestsBlocker
{
  return self->_processRequestsBlocker;
}

- (void)setProcessRequestsBlocker:(id)a3
{
  objc_storeStrong((id *)&self->_processRequestsBlocker, a3);
}

- (ICDocCamProcessingBlocker)snapStillImageBlocker
{
  return self->_snapStillImageBlocker;
}

- (void)setSnapStillImageBlocker:(id)a3
{
  objc_storeStrong((id *)&self->_snapStillImageBlocker, a3);
}

- (BOOL)didWarnAboutMaxScans
{
  return self->_didWarnAboutMaxScans;
}

- (void)setDidWarnAboutMaxScans:(BOOL)a3
{
  self->_didWarnAboutMaxScans = a3;
}

- (BOOL)isObservingCaptureSession
{
  return self->_isObservingCaptureSession;
}

- (void)setIsObservingCaptureSession:(BOOL)a3
{
  self->_isObservingCaptureSession = a3;
}

- (BOOL)didAddAppLifetimeObservers
{
  return self->_didAddAppLifetimeObservers;
}

- (void)setDidAddAppLifetimeObservers:(BOOL)a3
{
  self->_didAddAppLifetimeObservers = a3;
}

- (int64_t)snapStillImageMode
{
  return self->_snapStillImageMode;
}

- (void)setSnapStillImageMode:(int64_t)a3
{
  self->_snapStillImageMode = a3;
}

- (ICDocCamImageQuad)backupQuad
{
  return self->_backupQuad;
}

- (void)setBackupQuad:(id)a3
{
  objc_storeStrong((id *)&self->_backupQuad, a3);
}

- (VNRectangleObservation)lastHighConfidenceRectangle
{
  return self->_lastHighConfidenceRectangle;
}

- (void)setLastHighConfidenceRectangle:(id)a3
{
  objc_storeStrong((id *)&self->_lastHighConfidenceRectangle, a3);
}

- (NSMutableArray)filterButtons
{
  return self->_filterButtons;
}

- (void)setFilterButtons:(id)a3
{
  objc_storeStrong((id *)&self->_filterButtons, a3);
}

- (UIView)filterView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_filterView);
}

- (void)setFilterView:(id)a3
{
  objc_storeWeak((id *)&self->_filterView, a3);
}

- (UIButton)filterViewButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_filterViewButton);
}

- (void)setFilterViewButton:(id)a3
{
  objc_storeWeak((id *)&self->_filterViewButton, a3);
}

- (NSArray)filterNames
{
  return self->_filterNames;
}

- (void)setFilterNames:(id)a3
{
  objc_storeStrong((id *)&self->_filterNames, a3);
}

- (UIView)filterViewContainer
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_filterViewContainer);
}

- (void)setFilterViewContainer:(id)a3
{
  objc_storeWeak((id *)&self->_filterViewContainer, a3);
}

- (NSLayoutConstraint)filterViewContainerHeightConstraint
{
  return self->_filterViewContainerHeightConstraint;
}

- (void)setFilterViewContainerHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_filterViewContainerHeightConstraint, a3);
}

- (UIScrollView)filterScrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_filterScrollView);
}

- (void)setFilterScrollView:(id)a3
{
  objc_storeWeak((id *)&self->_filterScrollView, a3);
}

- (UIView)filterScrollViewContainer
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_filterScrollViewContainer);
}

- (void)setFilterScrollViewContainer:(id)a3
{
  objc_storeWeak((id *)&self->_filterScrollViewContainer, a3);
}

- (NSLayoutConstraint)filterViewLeadingConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_filterViewLeadingConstraint);
}

- (void)setFilterViewLeadingConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_filterViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)filterViewTrailingConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_filterViewTrailingConstraint);
}

- (void)setFilterViewTrailingConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_filterViewTrailingConstraint, a3);
}

- (NSLayoutConstraint)filterViewContainerWidthConstraint
{
  return self->_filterViewContainerWidthConstraint;
}

- (void)setFilterViewContainerWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_filterViewContainerWidthConstraint, a3);
}

- (NSLayoutConstraint)topToolbarForIPhoneHeightConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_topToolbarForIPhoneHeightConstraint);
}

- (void)setTopToolbarForIPhoneHeightConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_topToolbarForIPhoneHeightConstraint, a3);
}

- (UIView)topToolbarForIPhone
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_topToolbarForIPhone);
}

- (void)setTopToolbarForIPhone:(id)a3
{
  objc_storeWeak((id *)&self->_topToolbarForIPhone, a3);
}

- (UIButton)cancelButtonForIPhone
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_cancelButtonForIPhone);
}

- (void)setCancelButtonForIPhone:(id)a3
{
  objc_storeWeak((id *)&self->_cancelButtonForIPhone, a3);
}

- (UIButton)flashButtonForIPhone
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_flashButtonForIPhone);
}

- (void)setFlashButtonForIPhone:(id)a3
{
  objc_storeWeak((id *)&self->_flashButtonForIPhone, a3);
}

- (UIButton)filterButtonForIPhone
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_filterButtonForIPhone);
}

- (void)setFilterButtonForIPhone:(id)a3
{
  objc_storeWeak((id *)&self->_filterButtonForIPhone, a3);
}

- (UIButton)autoButtonForIPhone
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_autoButtonForIPhone);
}

- (void)setAutoButtonForIPhone:(id)a3
{
  objc_storeWeak((id *)&self->_autoButtonForIPhone, a3);
}

- (NSLayoutConstraint)cancelButtonForIPhoneLeadingConstraint
{
  return self->_cancelButtonForIPhoneLeadingConstraint;
}

- (void)setCancelButtonForIPhoneLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButtonForIPhoneLeadingConstraint, a3);
}

- (NSLayoutConstraint)autoButtonForIPhoneTrailingConstraint
{
  return self->_autoButtonForIPhoneTrailingConstraint;
}

- (void)setAutoButtonForIPhoneTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_autoButtonForIPhoneTrailingConstraint, a3);
}

- (signed)defaultFilter
{
  return self->_defaultFilter;
}

- (void)setDefaultFilter:(signed __int16)a3
{
  self->_defaultFilter = a3;
}

- (NSMutableArray)recentRectangleObservations
{
  return self->_recentRectangleObservations;
}

- (void)setRecentRectangleObservations:(id)a3
{
  objc_storeStrong((id *)&self->_recentRectangleObservations, a3);
}

- (NSDate)lastAXPositionAnnouncementDate
{
  return self->_lastAXPositionAnnouncementDate;
}

- (void)setLastAXPositionAnnouncementDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastAXPositionAnnouncementDate, a3);
}

- (BOOL)hasCandidateRectanglesForAX
{
  return self->_hasCandidateRectanglesForAX;
}

- (void)setHasCandidateRectanglesForAX:(BOOL)a3
{
  self->_hasCandidateRectanglesForAX = a3;
}

- (unint64_t)axConsecutiveRecognizerStateCount
{
  return self->_axConsecutiveRecognizerStateCount;
}

- (void)setAxConsecutiveRecognizerStateCount:(unint64_t)a3
{
  self->_axConsecutiveRecognizerStateCount = a3;
}

- (NSMutableArray)iPadLayoutConstraints
{
  return self->_iPadLayoutConstraints;
}

- (void)setIPadLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_iPadLayoutConstraints, a3);
}

- (NSMutableArray)iPhonePortraitLayoutConstraints
{
  return self->_iPhonePortraitLayoutConstraints;
}

- (void)setIPhonePortraitLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_iPhonePortraitLayoutConstraints, a3);
}

- (NSMutableArray)iPhoneLandscapeLayoutConstraints
{
  return self->_iPhoneLandscapeLayoutConstraints;
}

- (void)setIPhoneLandscapeLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_iPhoneLandscapeLayoutConstraints, a3);
}

- (NSMutableArray)iPhoneCompactLandscapeLayoutConstraints
{
  return self->_iPhoneCompactLandscapeLayoutConstraints;
}

- (void)setIPhoneCompactLandscapeLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_iPhoneCompactLandscapeLayoutConstraints, a3);
}

- (ICDocCamPhysicalCaptureRecognizer)physicalCaptureRecognizer
{
  return self->_physicalCaptureRecognizer;
}

- (void)setPhysicalCaptureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_physicalCaptureRecognizer, a3);
}

- (ICDocCamPhysicalCaptureNotifier)physicalCaptureNotifier
{
  return self->_physicalCaptureNotifier;
}

- (void)setPhysicalCaptureNotifier:(id)a3
{
  objc_storeStrong((id *)&self->_physicalCaptureNotifier, a3);
}

- (CGSize)streamingImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_streamingImageSize.width;
  height = self->_streamingImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setStreamingImageSize:(CGSize)a3
{
  self->_streamingImageSize = a3;
}

- (UITapGestureRecognizer)singleTapGestureRecognizer
{
  return self->_singleTapGestureRecognizer;
}

- (void)setSingleTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_singleTapGestureRecognizer, a3);
}

- (OS_dispatch_semaphore)flashAndFilterUISemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 2000, 1);
}

- (void)setFlashAndFilterUISemaphore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 2000);
}

- (BOOL)useCustomThumbnailZoomTransition
{
  return self->_useCustomThumbnailZoomTransition;
}

- (void)setUseCustomThumbnailZoomTransition:(BOOL)a3
{
  self->_useCustomThumbnailZoomTransition = a3;
}

- (NSIndexPath)indexPathForThumbnailZoom
{
  return self->_indexPathForThumbnailZoom;
}

- (void)setIndexPathForThumbnailZoom:(id)a3
{
  objc_storeStrong((id *)&self->_indexPathForThumbnailZoom, a3);
}

- (UIImage)imageForThumbnailZoom
{
  return self->_imageForThumbnailZoom;
}

- (void)setImageForThumbnailZoom:(id)a3
{
  objc_storeStrong((id *)&self->_imageForThumbnailZoom, a3);
}

- (id)thumbnailZoomCompletionBlock
{
  return self->_thumbnailZoomCompletionBlock;
}

- (void)setThumbnailZoomCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 2024);
}

- (BOOL)zoomTargetShouldUseCustomImageFrame
{
  return self->_zoomTargetShouldUseCustomImageFrame;
}

- (void)setZoomTargetShouldUseCustomImageFrame:(BOOL)a3
{
  self->_zoomTargetShouldUseCustomImageFrame = a3;
}

- (CGRect)zoomTargetCustomImageFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_zoomTargetCustomImageFrame.origin.x;
  y = self->_zoomTargetCustomImageFrame.origin.y;
  width = self->_zoomTargetCustomImageFrame.size.width;
  height = self->_zoomTargetCustomImageFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setZoomTargetCustomImageFrame:(CGRect)a3
{
  self->_zoomTargetCustomImageFrame = a3;
}

- (BOOL)useCustomRetakeTransition
{
  return self->_useCustomRetakeTransition;
}

- (void)setUseCustomRetakeTransition:(BOOL)a3
{
  self->_useCustomRetakeTransition = a3;
}

- (NSIndexPath)indexPathForRetake
{
  return self->_indexPathForRetake;
}

- (void)setIndexPathForRetake:(id)a3
{
  objc_storeStrong((id *)&self->_indexPathForRetake, a3);
}

- (UIImage)imageForRetake
{
  return self->_imageForRetake;
}

- (void)setImageForRetake:(id)a3
{
  objc_storeStrong((id *)&self->_imageForRetake, a3);
}

- (id)retakeCompletionBlock
{
  return self->_retakeCompletionBlock;
}

- (void)setRetakeCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 2048);
}

- (BOOL)useCustomRecropTransition
{
  return self->_useCustomRecropTransition;
}

- (void)setUseCustomRecropTransition:(BOOL)a3
{
  self->_useCustomRecropTransition = a3;
}

- (int64_t)orientationForRecrop
{
  return self->_orientationForRecrop;
}

- (void)setOrientationForRecrop:(int64_t)a3
{
  self->_orientationForRecrop = a3;
}

- (NSIndexPath)indexPathForRecrop
{
  return self->_indexPathForRecrop;
}

- (void)setIndexPathForRecrop:(id)a3
{
  objc_storeStrong((id *)&self->_indexPathForRecrop, a3);
}

- (UIImage)filteredImageForRecrop
{
  return self->_filteredImageForRecrop;
}

- (void)setFilteredImageForRecrop:(id)a3
{
  objc_storeStrong((id *)&self->_filteredImageForRecrop, a3);
}

- (UIImage)unfilteredImageForRecrop
{
  return self->_unfilteredImageForRecrop;
}

- (void)setUnfilteredImageForRecrop:(id)a3
{
  objc_storeStrong((id *)&self->_unfilteredImageForRecrop, a3);
}

- (id)sessionStartNotificationBlock
{
  return self->_sessionStartNotificationBlock;
}

- (void)setSessionStartNotificationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 2088);
}

- (BOOL)captureDebugDone
{
  return self->_captureDebugDone;
}

- (void)setCaptureDebugDone:(BOOL)a3
{
  self->_captureDebugDone = a3;
}

- (OS_dispatch_queue)snapshotSpinnerQueue
{
  return self->_snapshotSpinnerQueue;
}

- (void)setSnapshotSpinnerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotSpinnerQueue, a3);
}

- (ICDocCamSpinner)snapshotSpinner
{
  return self->_snapshotSpinner;
}

- (void)setSnapshotSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotSpinner, a3);
}

- (BOOL)awaitingSnapshotCompletion
{
  return self->_awaitingSnapshotCompletion;
}

- (void)setAwaitingSnapshotCompletion:(BOOL)a3
{
  self->_awaitingSnapshotCompletion = a3;
}

- (ICDocCamDebugMovieController)movieController
{
  return self->_movieController;
}

- (void)setMovieController:(id)a3
{
  objc_storeStrong((id *)&self->_movieController, a3);
}

- (int64_t)referenceOrientation
{
  return self->_referenceOrientation;
}

- (void)setReferenceOrientation:(int64_t)a3
{
  self->_referenceOrientation = a3;
}

- (AVCaptureConnection)videoConnection
{
  return self->_videoConnection;
}

- (void)setVideoConnection:(id)a3
{
  objc_storeStrong((id *)&self->_videoConnection, a3);
}

- (UIButton)recordButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_recordButton);
}

- (void)setRecordButton:(id)a3
{
  objc_storeWeak((id *)&self->_recordButton, a3);
}

- (BOOL)scanMovieRecordingEnabled
{
  return self->_scanMovieRecordingEnabled;
}

- (void)setScanMovieRecordingEnabled:(BOOL)a3
{
  self->_scanMovieRecordingEnabled = a3;
}

- (BOOL)scanMovieRecordingDontShowWarning
{
  return self->_scanMovieRecordingDontShowWarning;
}

- (void)setScanMovieRecordingDontShowWarning:(BOOL)a3
{
  self->_scanMovieRecordingDontShowWarning = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_recordButton);
  objc_storeStrong((id *)&self->_videoConnection, 0);
  objc_storeStrong((id *)&self->_movieController, 0);
  objc_storeStrong((id *)&self->_snapshotSpinner, 0);
  objc_storeStrong((id *)&self->_snapshotSpinnerQueue, 0);
  objc_storeStrong(&self->_sessionStartNotificationBlock, 0);
  objc_storeStrong((id *)&self->_unfilteredImageForRecrop, 0);
  objc_storeStrong((id *)&self->_filteredImageForRecrop, 0);
  objc_storeStrong((id *)&self->_indexPathForRecrop, 0);
  objc_storeStrong(&self->_retakeCompletionBlock, 0);
  objc_storeStrong((id *)&self->_imageForRetake, 0);
  objc_storeStrong((id *)&self->_indexPathForRetake, 0);
  objc_storeStrong(&self->_thumbnailZoomCompletionBlock, 0);
  objc_storeStrong((id *)&self->_imageForThumbnailZoom, 0);
  objc_storeStrong((id *)&self->_indexPathForThumbnailZoom, 0);
  objc_storeStrong((id *)&self->_flashAndFilterUISemaphore, 0);
  objc_storeStrong((id *)&self->_singleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_physicalCaptureNotifier, 0);
  objc_storeStrong((id *)&self->_physicalCaptureRecognizer, 0);
  objc_storeStrong((id *)&self->_iPhoneCompactLandscapeLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_iPhoneLandscapeLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_iPhonePortraitLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_iPadLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_lastAXPositionAnnouncementDate, 0);
  objc_storeStrong((id *)&self->_recentRectangleObservations, 0);
  objc_storeStrong((id *)&self->_autoButtonForIPhoneTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_cancelButtonForIPhoneLeadingConstraint, 0);
  objc_destroyWeak((id *)&self->_autoButtonForIPhone);
  objc_destroyWeak((id *)&self->_filterButtonForIPhone);
  objc_destroyWeak((id *)&self->_flashButtonForIPhone);
  objc_destroyWeak((id *)&self->_cancelButtonForIPhone);
  objc_destroyWeak((id *)&self->_topToolbarForIPhone);
  objc_destroyWeak((id *)&self->_topToolbarForIPhoneHeightConstraint);
  objc_storeStrong((id *)&self->_filterViewContainerWidthConstraint, 0);
  objc_destroyWeak((id *)&self->_filterViewTrailingConstraint);
  objc_destroyWeak((id *)&self->_filterViewLeadingConstraint);
  objc_destroyWeak((id *)&self->_filterScrollViewContainer);
  objc_destroyWeak((id *)&self->_filterScrollView);
  objc_storeStrong((id *)&self->_filterViewContainerHeightConstraint, 0);
  objc_destroyWeak((id *)&self->_filterViewContainer);
  objc_storeStrong((id *)&self->_filterNames, 0);
  objc_destroyWeak((id *)&self->_filterViewButton);
  objc_destroyWeak((id *)&self->_filterView);
  objc_storeStrong((id *)&self->_filterButtons, 0);
  objc_storeStrong((id *)&self->_lastHighConfidenceRectangle, 0);
  objc_storeStrong((id *)&self->_backupQuad, 0);
  objc_storeStrong((id *)&self->_snapStillImageBlocker, 0);
  objc_storeStrong((id *)&self->_processRequestsBlocker, 0);
  objc_storeStrong((id *)&self->_accelerometer, 0);
  objc_storeStrong(&self->_markupDismissCompletionBlock, 0);
  objc_storeStrong((id *)&self->_markupDocumentInfo, 0);
  objc_storeStrong((id *)&self->_moveCameraCloserViewVerticalConstraint, 0);
  objc_storeStrong((id *)&self->_userPromptViewVerticalConstraint, 0);
  objc_storeStrong((id *)&self->_sharedCoreImageContext, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_documentInfoCollection, 0);
  objc_storeStrong((id *)&self->_lastSubjectAreaChange, 0);
  objc_storeStrong((id *)&self->_cameraIntrinsicData, 0);
  objc_storeStrong((id *)&self->_rectResultsQueue, 0);
  objc_storeStrong((id *)&self->_vkAnalyzer, 0);
  objc_storeStrong((id *)&self->_cameraHighlightColor, 0);
  objc_destroyWeak((id *)&self->_videoPreviewLayer);
  objc_storeStrong((id *)&self->_videoDataOutput, 0);
  objc_storeStrong((id *)&self->_inProgressPhotoCaptureDelegates, 0);
  objc_storeStrong((id *)&self->_photoOutput, 0);
  objc_storeStrong((id *)&self->_photoSettings, 0);
  objc_storeStrong((id *)&self->_videoDeviceInput, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_destroyWeak((id *)&self->_flashSettingWidthConstraint);
  objc_destroyWeak((id *)&self->_flashSettingViewOffButton);
  objc_destroyWeak((id *)&self->_flashSettingViewOnButton);
  objc_destroyWeak((id *)&self->_flashSettingViewAutoButton);
  objc_destroyWeak((id *)&self->_flashSettingViewFlashIcon);
  objc_destroyWeak((id *)&self->_flashSettingButtonView);
  objc_storeStrong((id *)&self->_flashSettingViewHeightConstraint, 0);
  objc_destroyWeak((id *)&self->_flashSettingView);
  objc_destroyWeak((id *)&self->_filterButton);
  objc_destroyWeak((id *)&self->_flashButton);
  objc_destroyWeak((id *)&self->_manualButton);
  objc_destroyWeak((id *)&self->_autoButton);
  objc_storeStrong((id *)&self->_saveButtonLandscapeTrailingConstraintForIPhone, 0);
  objc_storeStrong((id *)&self->_saveButtonLandscapeVerticalConstraintForIPhone, 0);
  objc_storeStrong((id *)&self->_saveButton, 0);
  objc_destroyWeak((id *)&self->_cancelButton);
  objc_destroyWeak((id *)&self->_scrimView);
  objc_storeStrong((id *)&self->_thumbnailContainerViewLeadingConstraintForIPhone, 0);
  objc_storeStrong((id *)&self->_thumbnailContainerViewBottomConstraintForIPhone, 0);
  objc_storeStrong((id *)&self->_thumbnailContainerViewTrailingConstraintForIPad, 0);
  objc_storeStrong((id *)&self->_thumbnailContainerViewLeadingConstraintForIPad, 0);
  objc_destroyWeak((id *)&self->_moveCameraCloserLabel);
  objc_destroyWeak((id *)&self->_moveCameraCloserView);
  objc_destroyWeak((id *)&self->_userPromptLabel);
  objc_destroyWeak((id *)&self->_userPromptView);
  objc_destroyWeak((id *)&self->_overlayView);
  objc_storeStrong((id *)&self->_filterNameFeedbackViewTopLayoutConstraint, 0);
  objc_destroyWeak((id *)&self->_filterNameFeedbackLabel);
  objc_destroyWeak((id *)&self->_filterNameFeedbackView);
  objc_destroyWeak((id *)&self->_autoShutterOffTopLayoutConstraint);
  objc_destroyWeak((id *)&self->_autoShutterOffLabel);
  objc_destroyWeak((id *)&self->_autoShutterOffView);
  objc_destroyWeak((id *)&self->_autoShutterOnTopLayoutConstraint);
  objc_destroyWeak((id *)&self->_autoShutterOnLabel);
  objc_destroyWeak((id *)&self->_autoShutterOnView);
  objc_storeStrong((id *)&self->_shutterButtonBottomConstraintForLandscapeIPhone, 0);
  objc_storeStrong((id *)&self->_shutterButtonBottomConstraintForPortraitIPhone, 0);
  objc_destroyWeak((id *)&self->_shutterButton);
  objc_destroyWeak((id *)&self->_resumeButton);
  objc_destroyWeak((id *)&self->_cameraUnavailableLabel);
  objc_destroyWeak((id *)&self->_cameraUnavailableView);
  objc_destroyWeak((id *)&self->_cameraUnavailableScrim);
  objc_destroyWeak((id *)&self->_previewView);
  objc_storeStrong((id *)&self->_thumbnailViewController, 0);
  objc_storeStrong((id *)&self->_thumbnailContainerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __40__ICDocCamViewController_preWarmFilters__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_20CE8E000, v0, v1, "Prewarming black and white filter failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __40__ICDocCamViewController_preWarmFilters__block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_20CE8E000, v0, v1, "Prewarming grayscale filter failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __40__ICDocCamViewController_preWarmFilters__block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_20CE8E000, v0, v1, "Prewarming color filter failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __40__ICDocCamViewController_preWarmFilters__block_invoke_2_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_20CE8E000, v0, v1, "Prewarming photo filter failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __40__ICDocCamViewController_preWarmFilters__block_invoke_2_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_20CE8E000, v0, v1, "Prewarming crop filter failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __45__ICDocCamViewController_setupCaptureSession__block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_20CE8E000, v0, v1, "Could not create video device input: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updateFilterChoiceButtonScrollPositionAnimated:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_20CE8E000, v0, v1, "Did not find frame for current filter.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)image:didFinishSavingWithError:contextInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_20CE8E000, v0, v1, "error saving: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)saveCapturedImage:metaData:rects:constantColor:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_20CE8E000, v0, v1, "saveCapturedImage null image", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)saveCapturedImage:metaData:rects:constantColor:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_20CE8E000, v0, v1, "saveCapturedImage created docInfo %p", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)saveCapturedImage:metaData:rects:constantColor:completionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_2(&dword_20CE8E000, v0, v1, "saveCapturedImage warnAboutMaxScansIfNecessary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)saveCapturedImage:metaData:rects:constantColor:completionHandler:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_2(&dword_20CE8E000, v0, v1, "saveCapturedImage", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_574_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_20CE8E000, a2, a3, "saveCapturedImage addNewDocument docInfo %p", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_3_581_cold_1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_20CE8E000, log, OS_LOG_TYPE_DEBUG, "saveCapturedImage completion docInfo %p croppedAndFilteredImageUUID %@", buf, 0x16u);

}

- (void)snapStillImageWithMode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_2(&dword_20CE8E000, v0, v1, "snapStillImageWithMode NOT returning early -- capturing NOT in progress", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)snapStillImageWithMode:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_2(&dword_20CE8E000, v0, v1, "snapStillImageWithMode returning early - capturing in progress", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)snapStillImageWithMode:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_2(&dword_20CE8E000, v0, v1, "snapStillImageWithMode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_2(&dword_20CE8E000, v0, v1, "snapStillImage: color constancy enabled for capture", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_2(&dword_20CE8E000, v0, v1, "snapStillImage: color constancy NOT enabled for capture", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_6_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_20CE8E000, v0, v1, "snapStillImage: error capturing photo.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __94__ICDocCamViewController_focusWithMode_exposeWithMode_atDevicePoint_monitorSubjectAreaChange___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_20CE8E000, v0, v1, "Could not lock device for configuration: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
