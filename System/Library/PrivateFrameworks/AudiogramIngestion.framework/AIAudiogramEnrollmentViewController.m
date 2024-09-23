@implementation AIAudiogramEnrollmentViewController

- (AIAudiogramEnrollmentViewController)init
{
  AIAudiogramEnrollmentViewController *v2;
  AIAudiogramEnrollmentViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AIAudiogramEnrollmentViewController;
  v2 = -[AIAudiogramEnrollmentViewController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[AIAudiogramEnrollmentViewController setAnalyticsClient:](v2, "setAnalyticsClient:", 0);
  return v3;
}

- (AIAudiogramEnrollmentViewController)initWithDelegate:(id)a3
{
  id v4;
  AIAudiogramEnrollmentViewController *v5;
  AIAudiogramEnrollmentViewController *v6;

  v4 = a3;
  v5 = -[AIAudiogramEnrollmentViewController init](self, "init");
  v6 = v5;
  if (v5)
    -[AIAudiogramEnrollmentViewController setAudiogramConfirmationDelegate:](v5, "setAudiogramConfirmationDelegate:", v4);

  return v6;
}

- (void)setHealthStore:(id)a3 unitPreferenceController:(id)a4 initialDate:(id)a5
{
  id v8;
  id v9;

  v9 = a5;
  v8 = a4;
  -[AIAudiogramEnrollmentViewController setHealthStore:](self, "setHealthStore:", a3);
  -[AIAudiogramEnrollmentViewController setUnitPreferenceController:](self, "setUnitPreferenceController:", v8);

  -[AIAudiogramEnrollmentViewController setInitialDate:](self, "setInitialDate:", v9);
}

- (void)viewDidLoad
{
  AIAudiogramIngestionEngine *v3;
  AIAudiogramIngestionEngine *audiogramEngine;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  _BOOL4 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)AIAudiogramEnrollmentViewController;
  -[OBNavigationController viewDidLoad](&v8, sel_viewDidLoad);
  v3 = -[AIAudiogramIngestionEngine initWithDelegate:]([AIAudiogramIngestionEngine alloc], "initWithDelegate:", self);
  audiogramEngine = self->_audiogramEngine;
  self->_audiogramEngine = v3;

  self->_isCameraAvailable = objc_msgSend(MEMORY[0x24BEBD658], "isSourceTypeAvailable:", 1);
  v5 = -[AIAudiogramIngestionEngine isAvailable](self->_audiogramEngine, "isAvailable");
  AXLogAudiogram();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v10 = v5;
    _os_log_impl(&dword_22FB4F000, v6, OS_LOG_TYPE_INFO, "Starting audiogram ingestion. Is model is available? %d", buf, 8u);
  }

  if (!v5)
    -[AIAudiogramIngestionEngine startRetrievingLatestModelSilently](self->_audiogramEngine, "startRetrievingLatestModelSilently");
  -[AIAudiogramEnrollmentViewController presentationController](self, "presentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);

  if (_os_feature_enabled_impl())
    -[AIAudiogramEnrollmentViewController _showWelcomeV2](self, "_showWelcomeV2");
  else
    -[AIAudiogramEnrollmentViewController _showWelcome](self, "_showWelcome");
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AIAudiogramEnrollmentViewController;
  -[AIAudiogramEnrollmentViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  -[AIAudiogramEnrollmentViewController view](self, "view");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v5, "superview");
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
      if (!v6)
        return;
    }
    objc_msgSend(v5, "setAccessibilityViewIsModal:", 1);

  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (int64_t)modalPresentationStyle
{
  return 2;
}

- (id)_imagesFromPDF:(id)a3
{
  const __CFURL *v3;
  const __CFURL *v4;
  CGPDFDocumentRef v5;
  CGPDFDocument *v6;
  void *v7;
  int64_t NumberOfPages;
  int64_t v9;
  size_t v10;
  CGPDFPage *Page;
  CGPDFPage *v12;
  int RotationAngle;
  NSObject *v14;
  CGFloat v15;
  CGContext *CurrentContext;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v24;
  uint8_t buf[4];
  int v27;
  uint64_t v28;
  CGRect BoxRect;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = (const __CFURL *)a3;
  v4 = v3;
  if (!v3)
  {
    AXLogAudiogram();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[AIAudiogramEnrollmentViewController _imagesFromPDF:].cold.1();
    goto LABEL_24;
  }
  v5 = CGPDFDocumentCreateWithURL(v3);
  if (!v5)
  {
    AXLogAudiogram();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[AIAudiogramEnrollmentViewController _imagesFromPDF:].cold.2();
LABEL_24:

    v7 = 0;
    goto LABEL_25;
  }
  v6 = v5;
  v7 = (void *)objc_opt_new();
  NumberOfPages = CGPDFDocumentGetNumberOfPages(v6);
  if (NumberOfPages >= 1)
  {
    v9 = NumberOfPages;
    v10 = 1;
    do
    {
      Page = CGPDFDocumentGetPage(v6, v10);
      if (Page)
      {
        v12 = Page;
        RotationAngle = CGPDFPageGetRotationAngle(Page);
        AXLogAudiogram();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          v27 = RotationAngle;
          _os_log_impl(&dword_22FB4F000, v14, OS_LOG_TYPE_INFO, "PDF page angle %i", buf, 8u);
        }

        BoxRect = CGPDFPageGetBoxRect(v12, kCGPDFMediaBox);
        BoxRect.origin.x = BoxRect.size.width * 4.16666651;
        v15 = BoxRect.size.height * 4.16666651;
        BoxRect.origin.y = BoxRect.size.height * 4.16666651;
        UIGraphicsBeginImageContext((CGSize)BoxRect.origin);
        CurrentContext = UIGraphicsGetCurrentContext();
        CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationHigh);
        CGContextTranslateCTM(CurrentContext, 0.0, v15);
        CGContextScaleCTM(CurrentContext, 4.16666651, -4.16666651);
        CGContextSaveGState(CurrentContext);
        CGContextDrawPDFPage(CurrentContext, v12);
        CGContextRestoreGState(CurrentContext);
        UIGraphicsGetImageFromCurrentImageContext();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        UIGraphicsEndImageContext();
        v18 = 1;
        if ((RotationAngle - 136) >= 0x5A)
          v18 = 2 * ((RotationAngle - 226) < 0x5A);
        if ((RotationAngle - 46) >= 0x5A)
          v19 = v18;
        else
          v19 = 3;
        v20 = (void *)MEMORY[0x24BEBD640];
        v21 = objc_retainAutorelease(v17);
        objc_msgSend(v20, "imageWithCGImage:scale:orientation:", objc_msgSend(v21, "CGImage"), v19, 1.0);
        v22 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "addObject:", v22);
      }
      else
      {
        AXLogAudiogram();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          v27 = v10;
          _os_log_error_impl(&dword_22FB4F000, v22, OS_LOG_TYPE_ERROR, "Unable to get page (%i) from document", buf, 8u);
        }
      }

      if (v10 > 2)
        break;
    }
    while (v9 > (uint64_t)v10++);
  }
  CFRelease(v4);
  CFRelease(v6);
LABEL_25:

  return v7;
}

- (void)_showWelcome
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
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
  id v31;

  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", CFSTR("waveform.path"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithTintColor:renderingMode:", v4, 1);
  v31 = (id)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x24BE6E458]);
  aiLocString(CFSTR("AudiogramIngestionWelcomeTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  aiLocString(CFSTR("AudiogramIngestionWelcomeDetailText"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithTitle:detailText:icon:", v6, v7, v31);

  objc_msgSend(v8, "headerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = 1036831949;
  objc_msgSend(v9, "setTitleHyphenationFactor:", v10);

  if (-[AIAudiogramEnrollmentViewController isCameraAvailable](self, "isCameraAvailable"))
  {
    objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", CFSTR("camera"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageWithTintColor:renderingMode:", v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    aiLocString(CFSTR("AudiogramIngestionOptionCameraTitle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    aiLocString(CFSTR("AudiogramIngestionOptionCameraDescription"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addBulletedListItemWithTitle:description:image:", v14, v15, v13);

  }
  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", CFSTR("photo.on.rectangle.angled"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "imageWithTintColor:renderingMode:", v17, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  aiLocString(CFSTR("AudiogramIngestionOptionPhotosTitle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  aiLocString(CFSTR("AudiogramIngestionOptionPhotosDescription"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addBulletedListItemWithTitle:description:image:", v19, v20, v18);

  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", CFSTR("folder"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "imageWithTintColor:renderingMode:", v22, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  aiLocString(CFSTR("AudiogramIngestionOptionFilesTitle"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  aiLocString(CFSTR("AudiogramIngestionOptionFilesDescription"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addBulletedListItemWithTitle:description:image:", v24, v25, v23);

  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  aiLocString(CFSTR("AudiogramIngestionImportButton"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setTitle:forState:", v27, 0);

  objc_msgSend(v26, "addTarget:action:forControlEvents:", self, sel__importTapped_, 64);
  objc_msgSend(v8, "buttonTray");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addButton:", v26);

  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelTapped_);
  objc_msgSend(v8, "navigationItem");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setRightBarButtonItem:", v29);

  -[OBNavigationController pushViewController:animated:](self, "pushViewController:animated:", v8, 1);
}

- (void)_showWelcomeV2
{
  id v3;
  void *v4;
  void *v5;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", CFSTR("chart.line.text.clipboard"));
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x24BE6E458]);
  aiLocString(CFSTR("AudiogramIngestionWelcomeTitleV2"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  aiLocString(CFSTR("AudiogramIngestionWelcomeDetailTextV2"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithTitle:detailText:icon:", v4, v5, v23);

  objc_msgSend(v6, "headerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 1036831949;
  objc_msgSend(v7, "setTitleHyphenationFactor:", v8);

  audiogramIngestionImageNamed(CFSTR("audiogram_symbols"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  aiLocString(CFSTR("AudiogramIngestionOptionSymbolsTitle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  aiLocString(CFSTR("AudiogramIngestionOptionSymbolsDescription"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addBulletedListItemWithTitle:description:image:", v10, v11, v9);

  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", CFSTR("lines.audiogram"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  aiLocString(CFSTR("AudiogramIngestionOptionFrequenciesTitle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  aiLocString(CFSTR("AudiogramIngestionOptionFrequenciesDescription"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addBulletedListItemWithTitle:description:image:", v13, v14, v12);

  if (-[AIAudiogramEnrollmentViewController isCameraAvailable](self, "isCameraAvailable"))
  {
    objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    aiLocString(CFSTR("AudiogramIngestionScanWithCameraButton"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTitle:forState:", v16, 0);

    objc_msgSend(v15, "addTarget:action:forControlEvents:", self, sel__showCameraTips_, 64);
    objc_msgSend(v6, "buttonTray");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addButton:", v15);

  }
  objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  aiLocString(CFSTR("AudiogramIngestionEnterManuallyButton"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTitle:forState:", v19, 0);

  objc_msgSend(v18, "addTarget:action:forControlEvents:", self, sel__showNonCameraOptions_, 64);
  objc_msgSend(v6, "buttonTray");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addButton:", v18);

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelTapped_);
  objc_msgSend(v6, "navigationItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setRightBarButtonItem:", v21);

  -[OBNavigationController pushViewController:animated:](self, "pushViewController:animated:", v6, 1);
}

- (void)_startManualEntryV2
{
  void *v3;

  -[AIAudiogramEnrollmentViewController setAnalyticsImportSource:](self, "setAnalyticsImportSource:", 0);
  -[AIAudiogramEnrollmentViewController setAudiogram:](self, "setAudiogram:", 0);
  -[AIAudiogramEnrollmentViewController setSelectedFrequencies:](self, "setSelectedFrequencies:", 0);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramEnrollmentViewController setPickedDate:](self, "setPickedDate:", v3);

  -[AIAudiogramEnrollmentViewController setHasLeftSymbols:](self, "setHasLeftSymbols:", 1);
  -[AIAudiogramEnrollmentViewController setHasRightSymbols:](self, "setHasRightSymbols:", 1);
  -[AIAudiogramEnrollmentViewController showFrequencySelectionViewController](self, "showFrequencySelectionViewController");
}

- (void)_showValidationFailed
{
  AXPerformBlockOnMainThread();
}

void __60__AIAudiogramEnrollmentViewController__showValidationFailed__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
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
  double v34;
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
  id v63;
  void *v64;
  void *v65;
  _QWORD v66[6];

  v66[4] = *MEMORY[0x24BDAC8D0];
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(*(id *)(a1 + 32), "audiogramEngine");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "failureMode");

    if ((unint64_t)(v3 - 1) > 3)
    {
      v4 = 0;
    }
    else
    {
      aiLocString(off_24FD6DC30[v3 - 1]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    aiLocString(CFSTR("AudiogramIngestionValidationFailedDescriptionV2"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v4)
    {
      aiLocString(CFSTR("AudiogramIngestionValidationFailedWithReasonFormat"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v4;
      v52 = v10;
      AXCFormattedString();
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = v9;
    }
    v13 = objc_alloc(MEMORY[0x24BE6E448]);
    aiLocString(CFSTR("AudiogramIngestionValidationFailedTitleV2"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithTitle:detailText:icon:contentLayout:", v14, v12, 0, 2);
    objc_msgSend(*(id *)(a1 + 32), "setValidationFailedController:", v15);

    objc_msgSend(*(id *)(a1 + 32), "validationFailedController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "headerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "customIconContainerView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(*(id *)(a1 + 32), "audiogramImages");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        v21 = objc_alloc(MEMORY[0x24BEBD668]);
        objc_msgSend(*(id *)(a1 + 32), "audiogramImages");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "firstObject");
        v63 = v12;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v10;
        v24 = (void *)objc_msgSend(v21, "initWithImage:", v23);

        objc_msgSend(v24, "setContentMode:", 1);
        objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v18, "addSubview:", v24);
        objc_msgSend(v18, "setClipsToBounds:", 0);
        v56 = (void *)MEMORY[0x24BDD1628];
        objc_msgSend(v24, "centerXAnchor");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "centerXAnchor");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "constraintEqualToAnchor:", v61);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v66[0] = v60;
        objc_msgSend(v24, "centerYAnchor");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "centerYAnchor");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "constraintEqualToAnchor:", v58);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v66[1] = v57;
        objc_msgSend(v24, "heightAnchor");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "heightAnchor");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "constraintEqualToAnchor:", v54);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v66[2] = v53;
        objc_msgSend(v18, "superview");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "heightAnchor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "validationFailedController");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "view");
        v65 = v4;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "heightAnchor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "constraintEqualToAnchor:multiplier:", v29, 0.2);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v66[3] = v30;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v66, 4);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "activateConstraints:", v31);

        v4 = v65;
        v12 = v63;

        v10 = v64;
      }
    }

  }
  else
  {
    v5 = objc_alloc(MEMORY[0x24BE6E448]);
    aiLocString(CFSTR("AudiogramIngestionValidationFailedTitle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    aiLocString(CFSTR("AudiogramIngestionValidationFailedDescription"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithTitle:detailText:symbolName:contentLayout:", v6, v7, 0, 2);
    objc_msgSend(*(id *)(a1 + 32), "setValidationFailedController:", v8);

  }
  objc_msgSend(*(id *)(a1 + 32), "validationFailedController", v51, v52);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "headerView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v34) = 1036831949;
  objc_msgSend(v33, "setTitleHyphenationFactor:", v34);

  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, *(_QWORD *)(a1 + 32), sel__cancelTapped_);
  objc_msgSend(*(id *)(a1 + 32), "validationFailedController");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "navigationItem");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setRightBarButtonItem:", v35);

  LODWORD(v37) = _os_feature_enabled_impl();
  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v37)
  {
    aiLocString(CFSTR("AudiogramIngestionValidationFailedTryAgain"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setTitle:forState:", v39, 0);

    objc_msgSend(v38, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__tryAgainTapped_, 64);
    objc_msgSend(*(id *)(a1 + 32), "validationFailedController");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "buttonTray");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addButton:", v38);

    objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    aiLocString(CFSTR("AudiogramIngestionEnterManuallyButton"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setTitle:forState:", v43, 0);

    objc_msgSend(v42, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__startManualEntryV2, 64);
    objc_msgSend(*(id *)(a1 + 32), "validationFailedController");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "buttonTray");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addButton:", v42);

  }
  else
  {
    aiLocString(CFSTR("AudiogramIngestionManualImportButton"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setTitle:forState:", v46, 0);

    objc_msgSend(v38, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__manuallyImportAudiogram, 64);
    objc_msgSend(*(id *)(a1 + 32), "validationFailedController");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "buttonTray");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addButton:", v38);
  }

  objc_msgSend(*(id *)(a1 + 32), "_hideAnalyzingAudiogram");
  objc_msgSend(*(id *)(a1 + 32), "topViewController");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "validationFailedController");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47 != v48)
  {
    v49 = *(void **)(a1 + 32);
    objc_msgSend(v49, "validationFailedController");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "pushViewController:animated:", v50, 0);

    if (objc_msgSend(MEMORY[0x24BE4BD98], "isInternalInstall"))
    {
      if (_os_feature_enabled_impl())
        AXPerformBlockOnMainThreadAfterDelay();
    }
  }

}

void __60__AIAudiogramEnrollmentViewController__showValidationFailed__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "validationFailedController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_addDebugToolbarItemToController:", v2);

}

- (void)_showDownloadingAudiogram
{
  AXPerformBlockOnMainThread();
}

void __64__AIAudiogramEnrollmentViewController__showDownloadingAudiogram__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  AIAudiogramLoadingViewController *v4;
  void *v5;
  AIAudiogramLoadingViewController *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "loadingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 != v3)
  {
    v4 = [AIAudiogramLoadingViewController alloc];
    aiLocString(CFSTR("AudiogramIngestionDownloadingTitle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[AIAudiogramLoadingViewController initWithTitle:style:](v4, "initWithTitle:style:", v5, 0);
    objc_msgSend(*(id *)(a1 + 32), "setLoadingController:", v6);

    v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "loadingController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pushViewController:animated:", v8, 1);

  }
}

- (void)_showAnalyzingAudiogram
{
  AXPerformBlockOnMainThread();
}

void __62__AIAudiogramEnrollmentViewController__showAnalyzingAudiogram__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  AIAudiogramLoadingViewController *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "loadingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 != v3)
  {
    v4 = -[AIAudiogramLoadingViewController initWithTitle:style:]([AIAudiogramLoadingViewController alloc], "initWithTitle:style:", &stru_24FD6E4F8, 1);
    objc_msgSend(*(id *)(a1 + 32), "setLoadingController:", v4);

    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "loadingController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pushViewController:animated:", v6, 0);

  }
}

- (void)_hideAnalyzingAudiogram
{
  AXPerformBlockOnMainThread();
}

void __62__AIAudiogramEnrollmentViewController__hideAnalyzingAudiogram__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "loadingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
    v4 = (id)objc_msgSend(*(id *)(a1 + 32), "popViewControllerAnimated:", 0);
}

- (void)_showResultsForAudiogram:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AXPerformBlockOnMainThread();

}

void __64__AIAudiogramEnrollmentViewController__showResultsForAudiogram___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  AIAudiogramFinalResultViewController *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  AIAudiogramFinalResultViewController *v10;
  AIAudiogramResultsViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  AIAudiogramResultsViewController *v16;
  AIAudiogramFinalResultViewController *v17;
  _QWORD v18[8];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _QWORD v25[5];
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(*(id *)(a1 + 32), "topViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "loadingController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2 == v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "_hideAnalyzingAudiogram");
      v31 = 0;
      v32 = &v31;
      v33 = 0x2020000000;
      v34 = 0;
      v27 = 0;
      v28 = &v27;
      v29 = 0x2020000000;
      v30 = 0;
      v25[0] = 0;
      v25[1] = v25;
      v25[2] = 0x3032000000;
      v25[3] = __Block_byref_object_copy__7;
      v25[4] = __Block_byref_object_dispose__7;
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v26 = (id)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      v20 = &v19;
      v21 = 0x3032000000;
      v22 = __Block_byref_object_copy__7;
      v23 = __Block_byref_object_dispose__7;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v24 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "sensitivityPoints");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __64__AIAudiogramEnrollmentViewController__showResultsForAudiogram___block_invoke_297;
      v18[3] = &unk_24FD6D930;
      v18[4] = &v31;
      v18[5] = v25;
      v18[6] = &v27;
      v18[7] = &v19;
      objc_msgSend(v4, "enumerateObjectsUsingBlock:", v18);

      objc_msgSend(*(id *)(a1 + 32), "setSelectedFrequencies:", v20[5]);
      objc_msgSend(*(id *)(a1 + 32), "setAudiogram:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "setHasRightSymbols:", *((unsigned __int8 *)v28 + 24));
      objc_msgSend(*(id *)(a1 + 32), "setHasLeftSymbols:", *((unsigned __int8 *)v32 + 24));
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setPickedDate:", v5);

      v6 = [AIAudiogramFinalResultViewController alloc];
      v7 = v20[5];
      v8 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "audiogramConfirmationDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[AIAudiogramFinalResultViewController initWithAudiogram:selectedFrequencies:audiogramConfirmationDelegate:audiogramManualIngestionDelegate:](v6, "initWithAudiogram:selectedFrequencies:audiogramConfirmationDelegate:audiogramManualIngestionDelegate:", v8, v7, v9, *(_QWORD *)(a1 + 32));

      -[AIAudiogramFinalResultViewController setAnalyticsImportSource:](v10, "setAnalyticsImportSource:", objc_msgSend(*(id *)(a1 + 32), "analyticsImportSource"));
      -[AIAudiogramFinalResultViewController setAnalyticsClient:](v10, "setAnalyticsClient:", objc_msgSend(*(id *)(a1 + 32), "analyticsClient"));
      objc_msgSend(*(id *)(a1 + 32), "pushViewController:animated:", v10, 0);
      objc_msgSend(*(id *)(a1 + 32), "setFinalResultViewController:", v10);
      if (objc_msgSend(MEMORY[0x24BE4BD98], "isInternalInstall"))
      {
        v17 = v10;
        AXPerformBlockOnMainThreadAfterDelay();

      }
      _Block_object_dispose(&v19, 8);

      _Block_object_dispose(v25, 8);
      _Block_object_dispose(&v27, 8);
      _Block_object_dispose(&v31, 8);
    }
  }
  else
  {
    v11 = [AIAudiogramResultsViewController alloc];
    objc_msgSend(*(id *)(a1 + 32), "audiogramConfirmationDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[AIAudiogramResultsViewController initWithDelegate:audiogram:](v11, "initWithDelegate:audiogram:", v12, *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "healthStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultsViewController setHealthStore:](v16, "setHealthStore:", v13);

    objc_msgSend(*(id *)(a1 + 32), "unitPreferenceController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultsViewController setUnitPreferenceController:](v16, "setUnitPreferenceController:", v14);

    objc_msgSend(*(id *)(a1 + 32), "initialDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultsViewController setInitialDate:](v16, "setInitialDate:", v15);

    -[AIAudiogramResultsViewController setAnalyticsDidCompleteIngestion:](v16, "setAnalyticsDidCompleteIngestion:", *(_QWORD *)(a1 + 40) != 0);
    -[AIAudiogramResultsViewController setAnalyticsImportSource:](v16, "setAnalyticsImportSource:", objc_msgSend(*(id *)(a1 + 32), "analyticsImportSource"));
    -[AIAudiogramResultsViewController setAnalyticsClient:](v16, "setAnalyticsClient:", objc_msgSend(*(id *)(a1 + 32), "analyticsClient"));
    objc_msgSend(*(id *)(a1 + 32), "pushViewController:animated:", v16, 0);

  }
}

void __64__AIAudiogramEnrollmentViewController__showResultsForAudiogram___block_invoke_297(_QWORD *a1, void *a2)
{
  void *v3;
  _BYTE *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "leftEarSensitivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24);
    v5 = &unk_24FD77608;
LABEL_5:
    *v4 = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "addObject:", v5);
    goto LABEL_6;
  }
  objc_msgSend(v12, "rightEarSensitivity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v4 = (_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24);
    v5 = &unk_24FD77620;
    goto LABEL_5;
  }
LABEL_6:
  v7 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v12, "frequency");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getHKUnitClass_3(), "hertzUnit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValueForUnit:", v10);
  objc_msgSend(v8, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v11);

}

uint64_t __64__AIAudiogramEnrollmentViewController__showResultsForAudiogram___block_invoke_303(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addDebugToolbarItemToController:", *(_QWORD *)(a1 + 40));
}

- (void)_addDebugToolbarItemToController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
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
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  id location;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BE4BD98], "isInternalInstall"))
  {
    if (_os_feature_enabled_impl())
    {
      objc_msgSend(v4, "navigationItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "rightBarButtonItems");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      if (v7 <= 1)
      {
        objc_initWeak(&location, self);
        v8 = (void *)MEMORY[0x24BEBD748];
        v9 = (void *)MEMORY[0x24BEBD388];
        objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", CFSTR("ant"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = MEMORY[0x24BDAC760];
        v25 = 3221225472;
        v26 = __72__AIAudiogramEnrollmentViewController__addDebugToolbarItemToController___block_invoke;
        v27 = &unk_24FD6D958;
        objc_copyWeak(&v28, &location);
        objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", CFSTR("File Radar"), v10, CFSTR("radar"), &v24);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = v11;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 1, v24, v25, v26, v27);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "menuWithTitle:children:", CFSTR("[Internal Only]"), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = objc_alloc(MEMORY[0x24BEBD410]);
        objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", CFSTR("ant.fill"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v14, "initWithImage:menu:", v15, v13);

        objc_msgSend(v4, "navigationItem");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "rightBarButtonItems");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v18, "mutableCopy");
        v20 = v19;
        if (v19)
        {
          v21 = v19;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v21 = (id)objc_claimAutoreleasedReturnValue();
        }
        v22 = v21;

        objc_msgSend(v22, "addObject:", v16);
        objc_msgSend(v4, "navigationItem");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setRightBarButtonItems:", v22);

        objc_destroyWeak(&v28);
        objc_destroyWeak(&location);
      }
    }
  }

}

void __72__AIAudiogramEnrollmentViewController__addDebugToolbarItemToController___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_showTapToRadarAlert");

}

- (void)_showTapToRadarAlert
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", CFSTR("File Radar"), CFSTR("Attach image of audiogram for easier debugging?"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __59__AIAudiogramEnrollmentViewController__showTapToRadarAlert__block_invoke;
  v9[3] = &unk_24FD6D980;
  v9[4] = self;
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", CFSTR("Attach"), 0, v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __59__AIAudiogramEnrollmentViewController__showTapToRadarAlert__block_invoke_2;
  v8[3] = &unk_24FD6D980;
  v8[4] = self;
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", CFSTR("Do not attach"), 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, &__block_literal_global_1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAction:", v5);
  objc_msgSend(v3, "addAction:", v6);
  objc_msgSend(v3, "addAction:", v7);
  -[AIAudiogramEnrollmentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);

}

uint64_t __59__AIAudiogramEnrollmentViewController__showTapToRadarAlert__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_openTapToRadarWithAttachment:", 1);
}

uint64_t __59__AIAudiogramEnrollmentViewController__showTapToRadarAlert__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_openTapToRadarWithAttachment:", 0);
}

- (void)_openTapToRadarWithAttachment:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
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
  _QWORD v31[4];
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _QWORD v40[13];

  v3 = a3;
  v40[11] = *MEMORY[0x24BDAC8D0];
  v24 = (void *)objc_opt_new();
  objc_msgSend(v24, "setDateFormat:", CFSTR("yyyy.MM.dd_HH-mm-ss"));
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__7;
  v38 = __Block_byref_object_dispose__7;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v39 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = (void *)MEMORY[0x24BDBCF48];
    NSTemporaryDirectory();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fileURLWithPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[AIAudiogramEnrollmentViewController audiogramImages](self, "audiogramImages");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __69__AIAudiogramEnrollmentViewController__openTapToRadarWithAttachment___block_invoke;
    v31[3] = &unk_24FD6D9E8;
    v9 = v7;
    v32 = v9;
    v33 = &v34;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v31);

  }
  v10 = objc_alloc_init(MEMORY[0x24BDD1808]);
  objc_msgSend(v10, "setScheme:", CFSTR("tap-to-radar"));
  objc_msgSend(v10, "setHost:", CFSTR("new"));
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("ComponentID"), CFSTR("1105897"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v30;
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("ComponentName"), CFSTR("Hearing Accessibility"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v29;
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("ComponentVersion"), CFSTR("iOS"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v28;
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Classification"), CFSTR("Other Bug"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v40[3] = v27;
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Reproducibility"), CFSTR("I Didn't Try"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v40[4] = v26;
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Title"), CFSTR("Audiogram Ingestion Accuracy Issue"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v40[5] = v25;
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Description"), CFSTR("Please share some information on what went wrong (symbols were not identified, had wrong values, etc)"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40[6] = v11;
  v12 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringFromDate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "queryItemWithName:value:", CFSTR("TimeOfIssue"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v40[7] = v15;
  v16 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend((id)v35[5], "componentsJoinedByString:", CFSTR(","));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "queryItemWithName:value:", CFSTR("Attachments"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v40[8] = v18;
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("DeleteOnAttach"), CFSTR("1"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v40[9] = v19;
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("IncludeDevicePrefixInTitle"), CFSTR("1"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v40[10] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setQueryItems:", v21);

  objc_msgSend(v10, "URL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "openURL:withOptions:", v22, 0);

  _Block_object_dispose(&v34, 8);
}

void __69__AIAudiogramEnrollmentViewController__openTapToRadarWithAttachment___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  UIImage *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = *(void **)(a1 + 32);
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = a2;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("Image%lu.jpeg"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  UIImageJPEGRepresentation(v7, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "writeToURL:atomically:", v12, 1);
  v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(v12, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

}

- (void)_manuallyImportAudiogram
{
  if (_os_feature_enabled_impl())
  {
    -[AIAudiogramEnrollmentViewController _startManualEntryV2](self, "_startManualEntryV2");
  }
  else
  {
    -[AIAudiogramEnrollmentViewController setAnalyticsImportSource:](self, "setAnalyticsImportSource:", 0);
    -[AIAudiogramEnrollmentViewController _showResultsForAudiogram:](self, "_showResultsForAudiogram:", 0);
  }
}

- (void)_cameraAccessisAuthorizedForHealth:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  id *v7;
  NSObject *v8;
  _QWORD *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  _QWORD v13[2];
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  _QWORD v18[2];
  uint8_t buf[4];
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(MEMORY[0x24BE4BD98], "currentProcessIsHealth"))
  {
    v4 = (id)*MEMORY[0x24BDB1D50];
    v5 = objc_msgSend(MEMORY[0x24BDB2460], "authorizationStatusForMediaType:", v4);
    AXLogAudiogram();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v20 = v5;
      _os_log_impl(&dword_22FB4F000, v6, OS_LOG_TYPE_INFO, "The authorization status of camera access in Health app audiogram ingestion: %i", buf, 8u);
    }

    if ((unint64_t)(v5 - 1) >= 3)
    {
      if (!v5)
      {
        v10 = (void *)MEMORY[0x24BDB2460];
        v14[0] = MEMORY[0x24BDAC760];
        v14[1] = 3221225472;
        v14[2] = __74__AIAudiogramEnrollmentViewController__cameraAccessisAuthorizedForHealth___block_invoke_2;
        v14[3] = &unk_24FD6DA60;
        v7 = &v16;
        v16 = v3;
        v15 = v4;
        objc_msgSend(v10, "requestAccessForMediaType:completionHandler:", v15, v14);

LABEL_12:
        goto LABEL_13;
      }
      AXLogAudiogram();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v20 = v5;
        _os_log_impl(&dword_22FB4F000, v11, OS_LOG_TYPE_INFO, "Unexpected authorization status of camera access in Health app audiogram ingestion: %i", buf, 8u);
      }

      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __74__AIAudiogramEnrollmentViewController__cameraAccessisAuthorizedForHealth___block_invoke_386;
      v12[3] = &unk_24FD6DA10;
      v7 = (id *)v13;
      v13[0] = v3;
      v13[1] = v5;
      v8 = MEMORY[0x24BDAC9B8];
      v9 = v12;
    }
    else
    {
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __74__AIAudiogramEnrollmentViewController__cameraAccessisAuthorizedForHealth___block_invoke;
      v17[3] = &unk_24FD6DA10;
      v7 = (id *)v18;
      v18[0] = v3;
      v18[1] = v5;
      v8 = MEMORY[0x24BDAC9B8];
      v9 = v17;
    }
    dispatch_async(v8, v9);
    goto LABEL_12;
  }
LABEL_13:

}

uint64_t __74__AIAudiogramEnrollmentViewController__cameraAccessisAuthorizedForHealth___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __74__AIAudiogramEnrollmentViewController__cameraAccessisAuthorizedForHealth___block_invoke_2(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __74__AIAudiogramEnrollmentViewController__cameraAccessisAuthorizedForHealth___block_invoke_3;
  v2[3] = &unk_24FD6DA38;
  v4 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);

}

uint64_t __74__AIAudiogramEnrollmentViewController__cameraAccessisAuthorizedForHealth___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(MEMORY[0x24BDB2460], "authorizationStatusForMediaType:", *(_QWORD *)(a1 + 32)));
}

uint64_t __74__AIAudiogramEnrollmentViewController__cameraAccessisAuthorizedForHealth___block_invoke_386(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_presentCameraAuthorizationStatusDeniedAlert
{
  AXPerformBlockOnMainThread();
}

void __83__AIAudiogramEnrollmentViewController__presentCameraAuthorizationStatusDeniedAlert__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v2 = (void *)MEMORY[0x24BEBD3B0];
  aiLocString(CFSTR("AudiogramIngestionTCCCameraDeniedTitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  aiLocString(CFSTR("AudiogramIngestionTCCCameraDeniedMessage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alertControllerWithTitle:message:preferredStyle:", v3, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BEBD3A8];
  aiLocString(CFSTR("AudiogramIngestionTCCCameraDeniedCancelAction"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BEBD3A8];
  aiLocString(CFSTR("AudiogramIngestionTCCCameraDeniedDefaultAction"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __83__AIAudiogramEnrollmentViewController__presentCameraAuthorizationStatusDeniedAlert__block_invoke_2;
  v12[3] = &unk_24FD6D980;
  v12[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 0, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addAction:", v8);
  objc_msgSend(v5, "addAction:", v11);
  objc_msgSend(v5, "setPreferredAction:", v11);
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v5, 1, 0);

}

uint64_t __83__AIAudiogramEnrollmentViewController__presentCameraAuthorizationStatusDeniedAlert__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showCameraAuthorizationInSetting");
}

- (void)_showCameraAuthorizationInSetting
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=HEALTH"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openSensitiveURL:withOptions:", v3, 0);

}

- (void)_importTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;
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
  uint64_t v22;
  void *v23;
  void *v24;
  char isKindOfClass;
  void *v26;
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];

  v4 = a3;
  v5 = (void *)MEMORY[0x24BEBD3B0];
  aiLocString(CFSTR("AudiogramIngestionImportTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[AIAudiogramEnrollmentViewController isCameraAvailable](self, "isCameraAvailable");
  v9 = MEMORY[0x24BDAC760];
  if (v8)
  {
    v10 = (void *)MEMORY[0x24BEBD3A8];
    aiLocString(CFSTR("AudiogramIngestionImportOptionCamera"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v9;
    v29[1] = 3221225472;
    v29[2] = __53__AIAudiogramEnrollmentViewController__importTapped___block_invoke;
    v29[3] = &unk_24FD6D980;
    v29[4] = self;
    objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 0, v29);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addAction:", v12);
  }
  v13 = (void *)MEMORY[0x24BEBD3A8];
  aiLocString(CFSTR("AudiogramIngestionImportOptionPhotos"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v9;
  v28[1] = 3221225472;
  v28[2] = __53__AIAudiogramEnrollmentViewController__importTapped___block_invoke_2;
  v28[3] = &unk_24FD6D980;
  v28[4] = self;
  objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 0, v28);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x24BEBD3A8];
  aiLocString(CFSTR("AudiogramIngestionImportOptionFiles"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v9;
  v27[1] = 3221225472;
  v27[2] = __53__AIAudiogramEnrollmentViewController__importTapped___block_invoke_3;
  v27[3] = &unk_24FD6D980;
  v27[4] = self;
  objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 0, v27);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x24BEBD3A8];
  aiLocString(CFSTR("AudiogramIngestionImportOptionCancel"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 1, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addAction:", v15);
  objc_msgSend(v7, "addAction:", v18);
  objc_msgSend(v7, "addAction:", v21);
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v7, "popoverPresentationController");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = (void *)v22;
      objc_opt_self();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v7, "popoverPresentationController");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setSourceView:", v4);

      }
    }
  }
  -[AIAudiogramEnrollmentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

}

uint64_t __53__AIAudiogramEnrollmentViewController__importTapped___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_openCameraTapped:", 0);
}

uint64_t __53__AIAudiogramEnrollmentViewController__importTapped___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_openPhotosTapped:", 0);
}

uint64_t __53__AIAudiogramEnrollmentViewController__importTapped___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_openDocumentsTapped:", 0);
}

- (void)_openCameraTapped:(id)a3
{
  _QWORD v4[5];

  if ((objc_msgSend(MEMORY[0x24BE4BD98], "currentProcessIsHealth", a3) & 1) != 0)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __57__AIAudiogramEnrollmentViewController__openCameraTapped___block_invoke;
    v4[3] = &unk_24FD6DA88;
    v4[4] = self;
    -[AIAudiogramEnrollmentViewController _cameraAccessisAuthorizedForHealth:](self, "_cameraAccessisAuthorizedForHealth:", v4);
  }
  else
  {
    -[AIAudiogramEnrollmentViewController _openCamera](self, "_openCamera");
  }
}

uint64_t __57__AIAudiogramEnrollmentViewController__openCameraTapped___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2 == 2)
    return objc_msgSend(*(id *)(result + 32), "_presentCameraAuthorizationStatusDeniedAlert");
  if (a2 == 3)
    return objc_msgSend(*(id *)(result + 32), "_openCamera");
  return result;
}

- (void)_openCamera
{
  id v3;

  v3 = (id)objc_opt_new();
  objc_msgSend(v3, "setDelegate:", self);
  -[AIAudiogramEnrollmentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);

}

- (void)_openPhotosTapped:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v4 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2050000000;
  v5 = (void *)getPHPickerConfigurationClass_softClass;
  v25 = getPHPickerConfigurationClass_softClass;
  if (!getPHPickerConfigurationClass_softClass)
  {
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __getPHPickerConfigurationClass_block_invoke;
    v20 = &unk_24FD6CE58;
    v21 = &v22;
    __getPHPickerConfigurationClass_block_invoke((uint64_t)&v17);
    v5 = (void *)v23[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v22, 8);
  v7 = [v6 alloc];
  objc_msgSend(MEMORY[0x24BDE35F0], "sharedPhotoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithPhotoLibrary:", v8);

  objc_msgSend(v9, "setSelectionLimit:", 1);
  v22 = 0;
  v23 = &v22;
  v24 = 0x2050000000;
  v10 = (void *)getPHPickerFilterClass_softClass;
  v25 = getPHPickerFilterClass_softClass;
  if (!getPHPickerFilterClass_softClass)
  {
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __getPHPickerFilterClass_block_invoke;
    v20 = &unk_24FD6CE58;
    v21 = &v22;
    __getPHPickerFilterClass_block_invoke((uint64_t)&v17);
    v10 = (void *)v23[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v22, 8);
  objc_msgSend(v11, "imagesFilter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFilter:", v12);

  v22 = 0;
  v23 = &v22;
  v24 = 0x2050000000;
  v13 = (void *)getPHPickerViewControllerClass_softClass;
  v25 = getPHPickerViewControllerClass_softClass;
  if (!getPHPickerViewControllerClass_softClass)
  {
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __getPHPickerViewControllerClass_block_invoke;
    v20 = &unk_24FD6CE58;
    v21 = &v22;
    __getPHPickerViewControllerClass_block_invoke((uint64_t)&v17);
    v13 = (void *)v23[3];
  }
  v14 = objc_retainAutorelease(v13);
  _Block_object_dispose(&v22, 8);
  v15 = (void *)objc_msgSend([v14 alloc], "initWithConfiguration:", v9);
  objc_msgSend(v15, "setDelegate:", self);
  objc_msgSend(v15, "presentationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDelegate:", self);

  -[AIAudiogramEnrollmentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, 0);
}

- (void)_openDocumentsTapped:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc(MEMORY[0x24BEBD560]);
  v5 = *MEMORY[0x24BDF84E0];
  v9[0] = *MEMORY[0x24BDF8410];
  v9[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initForOpeningContentTypes:asCopy:", v6, 1);

  objc_msgSend(v7, "setAllowsMultipleSelection:", 0);
  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "presentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);

  -[AIAudiogramEnrollmentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
}

- (void)_cancelTapped:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  if (self->_analyticsIngestionAttempted)
  {
    dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__AIAudiogramEnrollmentViewController__cancelTapped___block_invoke;
    block[3] = &unk_24FD6CDA0;
    block[4] = self;
    dispatch_async(v4, block);

  }
  -[AIAudiogramEnrollmentViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

void __53__AIAudiogramEnrollmentViewController__cancelTapped___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("adjusted");
  v8[1] = CFSTR("completed");
  v9[0] = MEMORY[0x24BDBD1C0];
  v9[1] = MEMORY[0x24BDBD1C0];
  v8[2] = CFSTR("import_source");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "analyticsImportSource"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v2;
  v8[3] = CFSTR("client");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "analyticsClient"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogAggregate();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_22FB4F000, v5, OS_LOG_TYPE_INFO, "Audiogram Ingestion canceled: %@", (uint8_t *)&v6, 0xCu);
  }

  AnalyticsSendEvent();
}

- (void)_prepareToImportAudiogramImages:(id)a3
{
  id v5;
  _BOOL4 v6;
  NSObject *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  self->_analyticsIngestionAttempted = 1;
  objc_storeStrong((id *)&self->_audiogramImages, a3);
  v6 = -[AIAudiogramIngestionEngine isAvailable](self->_audiogramEngine, "isAvailable");
  AXLogAudiogram();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109120;
    v8[1] = v6;
    _os_log_impl(&dword_22FB4F000, v7, OS_LOG_TYPE_INFO, "Preparing to import audiogram image. Is model is available? %d", (uint8_t *)v8, 8u);
  }

  if (v6)
  {
    -[AIAudiogramEnrollmentViewController _showAnalyzingAudiogram](self, "_showAnalyzingAudiogram");
    -[AIAudiogramEnrollmentViewController _importAudiogramImage](self, "_importAudiogramImage");
  }
  else
  {
    -[AIAudiogramIngestionEngine startRetrievingLatestModel](self->_audiogramEngine, "startRetrievingLatestModel");
    -[AIAudiogramEnrollmentViewController _showDownloadingAudiogram](self, "_showDownloadingAudiogram");
  }

}

- (void)_importAudiogramImage
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22FB4F000, v0, v1, "No image received for audiogram import", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

uint64_t __60__AIAudiogramEnrollmentViewController__importAudiogramImage__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "_showResultsForAudiogram:", a2);
  AXLogAudiogram();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "audiogramEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 134217984;
    v7 = objc_msgSend(v5, "failureMode");
    _os_log_impl(&dword_22FB4F000, v4, OS_LOG_TYPE_INFO, "Audiogram is invalid. Failure mode from ingestion engine is %lu", (uint8_t *)&v6, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_showValidationFailed");
}

- (void)audiogramIngestionEngineModelDownloadProgressed:(float)a3
{
  AXPerformBlockOnMainThread();
}

void __87__AIAudiogramEnrollmentViewController_audiogramIngestionEngineModelDownloadProgressed___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  double v4;
  uint8_t v5[16];

  AXLogAudiogram();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22FB4F000, v2, OS_LOG_TYPE_INFO, "Loading controller received progress update", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "loadingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = *(_DWORD *)(a1 + 40);
  objc_msgSend(v3, "setProgress:", v4);

}

- (void)audiogramIngestionEngineModelDownloadComplete
{
  AXPerformBlockOnMainThread();
}

uint64_t __84__AIAudiogramEnrollmentViewController_audiogramIngestionEngineModelDownloadComplete__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  double v4;
  uint8_t buf[16];

  AXLogAudiogram();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22FB4F000, v2, OS_LOG_TYPE_INFO, "Loading controller received download complete", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "loadingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1.0;
  objc_msgSend(v3, "setProgress:", v4);

  return AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __84__AIAudiogramEnrollmentViewController_audiogramIngestionEngineModelDownloadComplete__block_invoke_424(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "popViewControllerAnimated:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_showAnalyzingAudiogram");
  return objc_msgSend(*(id *)(a1 + 32), "_importAudiogramImage");
}

- (void)audiogramIngestionEngineModelDownloadFailed:(id)a3
{
  AXPerformBlockOnMainThread();
}

void __83__AIAudiogramEnrollmentViewController_audiogramIngestionEngineModelDownloadFailed___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  AXLogAudiogram();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_22FB4F000, v2, OS_LOG_TYPE_INFO, "Loading controller received download failed", v6, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "loadingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadViewIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "loadingController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  aiLocString(CFSTR("AudiogramIngestionLoadingError"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showLoadingMessage:", v5);

}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return 0;
}

- (void)documentCameraViewController:(id)a3 didFinishWithScan:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  AXLogAudiogram();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22FB4F000, v8, OS_LOG_TYPE_INFO, "Audiogram imported via document camera", buf, 2u);
  }

  v9 = v6;
  AXPerformBlockOnMainThread();
  v10 = (void *)objc_opt_new();
  if (objc_msgSend(v7, "pageCount"))
  {
    v11 = 0;
    do
    {
      objc_msgSend(v7, "imageOfPageAtIndex:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        objc_msgSend(v10, "addObject:", v12);

      v13 = objc_msgSend(v7, "pageCount");
      if (v11 > 1)
        break;
      ++v11;
    }
    while (v13 > v11);
  }
  -[AIAudiogramEnrollmentViewController _prepareToImportAudiogramImages:](self, "_prepareToImportAudiogramImages:", v10);
  -[AIAudiogramEnrollmentViewController setAnalyticsImportSource:](self, "setAnalyticsImportSource:", 3);

}

uint64_t __86__AIAudiogramEnrollmentViewController_documentCameraViewController_didFinishWithScan___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)documentCameraViewControllerDidCancel:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  uint8_t buf[16];

  v3 = a3;
  AXLogAudiogram();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22FB4F000, v4, OS_LOG_TYPE_INFO, "Audiogram scan cancelled", buf, 2u);
  }

  v6 = v3;
  v5 = v3;
  AXPerformBlockOnMainThread();

}

uint64_t __77__AIAudiogramEnrollmentViewController_documentCameraViewControllerDidCancel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)documentCameraViewController:(id)a3 didFailWithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  AXLogAudiogram();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[AIAudiogramEnrollmentViewController documentCameraViewController:didFailWithError:].cold.1();

  v9 = v5;
  v8 = v5;
  AXPerformBlockOnMainThread();

}

uint64_t __85__AIAudiogramEnrollmentViewController_documentCameraViewController_didFailWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[9];
  id v15;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  AXLogAudiogram();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22FB4F000, v8, OS_LOG_TYPE_INFO, "Audiogram imported via photo picker", buf, 2u);
  }

  v9 = MEMORY[0x24BDAC760];
  v14[5] = MEMORY[0x24BDAC760];
  v14[6] = 3221225472;
  v14[7] = __63__AIAudiogramEnrollmentViewController_picker_didFinishPicking___block_invoke;
  v14[8] = &unk_24FD6CDA0;
  v15 = v6;
  v10 = v6;
  AXPerformBlockOnMainThread();
  objc_msgSend(v7, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "itemProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __63__AIAudiogramEnrollmentViewController_picker_didFinishPicking___block_invoke_2;
  v14[3] = &unk_24FD6DB00;
  v14[4] = self;
  v13 = (id)objc_msgSend(v12, "loadObjectOfClass:completionHandler:", objc_opt_class(), v14);

}

uint64_t __63__AIAudiogramEnrollmentViewController_picker_didFinishPicking___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

void __63__AIAudiogramEnrollmentViewController_picker_didFinishPicking___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    AXLogAudiogram();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __63__AIAudiogramEnrollmentViewController_picker_didFinishPicking___block_invoke_2_cold_2();
LABEL_7:

    v5 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    AXLogAudiogram();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __63__AIAudiogramEnrollmentViewController_picker_didFinishPicking___block_invoke_2_cold_1();
    goto LABEL_7;
  }
LABEL_8:
  v8 = v5;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "axSafelyAddObject:", v8);
  objc_msgSend(*(id *)(a1 + 32), "_prepareToImportAudiogramImages:", v9);
  objc_msgSend(*(id *)(a1 + 32), "setAnalyticsImportSource:", 1);

}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  AIAudiogramEnrollmentViewController *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  AIAudiogramEnrollmentViewController *v20;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __77__AIAudiogramEnrollmentViewController_documentPicker_didPickDocumentsAtURLs___block_invoke;
  v18 = &unk_24FD6D6D0;
  v19 = v6;
  v20 = self;
  v9 = v6;
  AXPerformBlockOnMainThread();
  dispatch_get_global_queue(0, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __77__AIAudiogramEnrollmentViewController_documentPicker_didPickDocumentsAtURLs___block_invoke_2;
  v12[3] = &unk_24FD6D6D0;
  v13 = v7;
  v14 = self;
  v11 = v7;
  dispatch_async(v10, v12);

}

uint64_t __77__AIAudiogramEnrollmentViewController_documentPicker_didPickDocumentsAtURLs___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
  return objc_msgSend(*(id *)(a1 + 40), "_showAnalyzingAudiogram");
}

void __77__AIAudiogramEnrollmentViewController_documentPicker_didPickDocumentsAtURLs___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t v17[16];
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *MEMORY[0x24BDBCBE8];
    v20[0] = *MEMORY[0x24BDBCBE8];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v2, "resourceValuesForKeys:error:", v5, &v18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v18;

    if (v7)
    {
      AXLogAudiogram();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __77__AIAudiogramEnrollmentViewController_documentPicker_didPickDocumentsAtURLs___block_invoke_2_cold_3();

      objc_msgSend(*(id *)(a1 + 40), "_showValidationFailed");
    }
    else
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "conformsToType:", *MEMORY[0x24BDF8410]))
      {
        AXLogAudiogram();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v17 = 0;
          _os_log_impl(&dword_22FB4F000, v11, OS_LOG_TYPE_INFO, "Audiogram image imported via document picker", v17, 2u);
        }

        v12 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD640]), "initWithContentsOfFile:", v3);
        v13 = (void *)v12;
        if (v12)
        {
          v19 = v12;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v14 = 0;
        }

      }
      else if (objc_msgSend(v10, "conformsToType:", *MEMORY[0x24BDF84E0]))
      {
        AXLogAudiogram();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v17 = 0;
          _os_log_impl(&dword_22FB4F000, v15, OS_LOG_TYPE_INFO, "Audiogram PDF imported via document picker", v17, 2u);
        }

        objc_msgSend(*(id *)(a1 + 40), "_imagesFromPDF:", v2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }
      if (objc_msgSend(v14, "count"))
      {
        objc_msgSend(*(id *)(a1 + 40), "_prepareToImportAudiogramImages:", v14);
        objc_msgSend(*(id *)(a1 + 40), "setAnalyticsImportSource:", 2);
      }
      else
      {
        AXLogAudiogram();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          __77__AIAudiogramEnrollmentViewController_documentPicker_didPickDocumentsAtURLs___block_invoke_2_cold_2();

        objc_msgSend(*(id *)(a1 + 40), "_showValidationFailed");
      }

    }
  }
  else
  {
    AXLogAudiogram();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __77__AIAudiogramEnrollmentViewController_documentPicker_didPickDocumentsAtURLs___block_invoke_2_cold_1();

    objc_msgSend(*(id *)(a1 + 40), "_showValidationFailed");
  }

}

- (void)_showCameraTips:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  id v11;
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
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  AIAudiogramEnrollmentViewController *v44;
  _QWORD v45[5];

  v45[4] = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc(MEMORY[0x24BE6E458]);
  aiLocString(CFSTR("AudiogramIngestionCameraTipTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithTitle:detailText:icon:", v5, 0, 0);

  objc_msgSend(v6, "headerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 1036831949;
  objc_msgSend(v7, "setTitleHyphenationFactor:", v8);

  objc_msgSend(v6, "headerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "customIconContainerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x24BEBD668]);
    audiogramIngestionImageNamed(CFSTR("camera_scan_illustration"));
    v44 = self;
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageWithTintColor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v11, "initWithImage:", v14);

    objc_msgSend(v15, "setContentMode:", 1);
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v10, "addSubview:", v15);
    objc_msgSend(v10, "setClipsToBounds:", 0);
    v36 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v15, "centerXAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "centerXAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v40;
    objc_msgSend(v15, "centerYAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "centerYAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v38);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v45[1] = v37;
    objc_msgSend(v15, "heightAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "heightAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v45[2] = v17;
    objc_msgSend(v10, "superview");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "heightAnchor");
    v43 = v10;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "heightAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:multiplier:", v21, 0.3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v45[3] = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "activateConstraints:", v23);

    v10 = v43;
    self = v44;

  }
  aiLocString(CFSTR("AudiogramIngestionCameraTipChart"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addBulletedListItemWithTitle:description:symbolName:tintColor:", v24, &stru_24FD6E4F8, CFSTR("chart.dots.scatter"), v25);

  aiLocString(CFSTR("AudiogramIngestionCameraTipLight"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addBulletedListItemWithTitle:description:symbolName:tintColor:", v26, &stru_24FD6E4F8, CFSTR("lightbulb.max"), v27);

  aiLocString(CFSTR("AudiogramIngestionCameraTipSteady"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addBulletedListItemWithTitle:description:symbolName:tintColor:", v28, &stru_24FD6E4F8, CFSTR("camera"), v29);

  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  aiLocString(CFSTR("AudiogramIngestionCameraTipButtonTitle"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setTitle:forState:", v31, 0);

  objc_msgSend(v30, "addTarget:action:forControlEvents:", self, sel__openCameraTapped_, 64);
  objc_msgSend(v6, "buttonTray");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addButton:", v30);

  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelTapped_);
  objc_msgSend(v6, "navigationItem");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setRightBarButtonItem:", v33);

  -[OBNavigationController pushViewController:animated:](self, "pushViewController:animated:", v6, 1);
}

- (void)_showNonCameraOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
  uint64_t v21;
  void *v22;
  void *v23;
  char isKindOfClass;
  void *v25;
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];

  v4 = a3;
  v5 = (void *)MEMORY[0x24BEBD3B0];
  aiLocString(CFSTR("AudiogramIngestionImportTitleV2"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BEBD3A8];
  aiLocString(CFSTR("AudiogramIngestionImportOptionPhotosV2"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __61__AIAudiogramEnrollmentViewController__showNonCameraOptions___block_invoke;
  v28[3] = &unk_24FD6D980;
  v28[4] = self;
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, v28);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BEBD3A8];
  aiLocString(CFSTR("AudiogramIngestionImportOptionFilesV2"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v10;
  v27[1] = 3221225472;
  v27[2] = __61__AIAudiogramEnrollmentViewController__showNonCameraOptions___block_invoke_2;
  v27[3] = &unk_24FD6D980;
  v27[4] = self;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 0, v27);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BEBD3A8];
  aiLocString(CFSTR("AudiogramIngestionImportOptionManualV2"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v10;
  v26[1] = 3221225472;
  v26[2] = __61__AIAudiogramEnrollmentViewController__showNonCameraOptions___block_invoke_3;
  v26[3] = &unk_24FD6D980;
  v26[4] = self;
  objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 0, v26);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x24BEBD3A8];
  aiLocString(CFSTR("AudiogramIngestionImportOptionCancel"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "actionWithTitle:style:handler:", v19, 1, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addAction:", v11);
  objc_msgSend(v7, "addAction:", v14);
  objc_msgSend(v7, "addAction:", v17);
  objc_msgSend(v7, "addAction:", v20);
  objc_msgSend(v7, "popoverPresentationController");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    objc_opt_self();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v7, "popoverPresentationController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setSourceView:", v4);

    }
  }
  -[AIAudiogramEnrollmentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

}

uint64_t __61__AIAudiogramEnrollmentViewController__showNonCameraOptions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_openPhotosTapped:", 0);
}

uint64_t __61__AIAudiogramEnrollmentViewController__showNonCameraOptions___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_openDocumentsTapped:", 0);
}

uint64_t __61__AIAudiogramEnrollmentViewController__showNonCameraOptions___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startManualEntryV2");
}

- (void)_tryAgainTapped:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  -[AIAudiogramEnrollmentViewController topViewController](self, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramEnrollmentViewController validationFailedController](self, "validationFailedController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
    v6 = (id)-[AIAudiogramEnrollmentViewController popViewControllerAnimated:](self, "popViewControllerAnimated:", 0);
  if (-[AIAudiogramEnrollmentViewController analyticsImportSource](self, "analyticsImportSource") == 3)
  {
    -[AIAudiogramEnrollmentViewController _openCameraTapped:](self, "_openCameraTapped:", v9);
LABEL_9:
    v8 = v9;
    goto LABEL_10;
  }
  if (-[AIAudiogramEnrollmentViewController analyticsImportSource](self, "analyticsImportSource") == 1)
  {
    -[AIAudiogramEnrollmentViewController _openPhotosTapped:](self, "_openPhotosTapped:", v9);
    goto LABEL_9;
  }
  v7 = -[AIAudiogramEnrollmentViewController analyticsImportSource](self, "analyticsImportSource");
  v8 = v9;
  if (v7 == 2)
  {
    -[AIAudiogramEnrollmentViewController _openDocumentsTapped:](self, "_openDocumentsTapped:", v9);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)showFrequencySelectionViewController
{
  AXPerformBlockOnMainThread();
}

void __75__AIAudiogramEnrollmentViewController_showFrequencySelectionViewController__block_invoke(uint64_t a1)
{
  AIAudiogramFrequencySelectionViewController *v2;
  void *v3;
  void *v4;
  AIAudiogramFrequencySelectionViewController *v5;

  v2 = [AIAudiogramFrequencySelectionViewController alloc];
  aiLocString(CFSTR("AudiogramFrequencySelectionTitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "selectedFrequencies");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AIAudiogramFrequencySelectionViewController initWithTitle:detailText:selectedFrequencies:delegate:isModal:](v2, "initWithTitle:detailText:selectedFrequencies:delegate:isModal:", v3, &stru_24FD6E4F8, v4, *(_QWORD *)(a1 + 32), 0);

  objc_msgSend(*(id *)(a1 + 32), "pushViewController:animated:", v5, 1);
}

- (void)cancelButtonTapped
{
  AXPerformBlockOnMainThread();
}

uint64_t __57__AIAudiogramEnrollmentViewController_cancelButtonTapped__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelTapped:", 0);
}

- (void)updateSelectedFrequenciesWithSelectedFrequencies:(id)a3
{
  void *v4;

  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_458);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramEnrollmentViewController setSelectedFrequencies:](self, "setSelectedFrequencies:", v4);

  -[AIAudiogramEnrollmentViewController updateFrequencyViewControllers](self, "updateFrequencyViewControllers");
  -[AIAudiogramEnrollmentViewController refreshFinalConfirmationView](self, "refreshFinalConfirmationView");
}

uint64_t __88__AIAudiogramEnrollmentViewController_updateSelectedFrequenciesWithSelectedFrequencies___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)updateFrequencyViewControllers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id HKAudiogramSampleClass_0;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;

  -[AIAudiogramEnrollmentViewController audiogram](self, "audiogram");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AIAudiogramEnrollmentViewController audiogram](self, "audiogram");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramEnrollmentViewController audiogram](self, "audiogram");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sensitivityPoints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __69__AIAudiogramEnrollmentViewController_updateFrequencyViewControllers__block_invoke;
    v20[3] = &unk_24FD6DB68;
    v20[4] = self;
    v8 = v4;
    v21 = v8;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v20);

    if (objc_msgSend(v8, "count"))
    {
      HKAudiogramSampleClass_0 = getHKAudiogramSampleClass_0();
      objc_msgSend(v17, "startDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "endDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      metadataForHKAudiogramSample();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(HKAudiogramSampleClass_0, "audiogramSampleWithSensitivityPoints:startDate:endDate:metadata:", v8, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }
    -[AIAudiogramEnrollmentViewController setAudiogram:](self, "setAudiogram:", v13);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramEnrollmentViewController childViewControllers](self, "childViewControllers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __69__AIAudiogramEnrollmentViewController_updateFrequencyViewControllers__block_invoke_2;
    v18[3] = &unk_24FD6DB90;
    v18[4] = self;
    v19 = v14;
    v16 = v14;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", v18);

    -[OBNavigationController setViewControllers:](self, "setViewControllers:", v16);
  }
}

void __69__AIAudiogramEnrollmentViewController_updateFrequencyViewControllers__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "frequency");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getHKUnitClass_3(), "hertzUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValueForUnit:", v4);
  v6 = v5;

  objc_msgSend(*(id *)(a1 + 32), "selectedFrequencies");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "containsObject:", v8) & 1) == 0)
  {

    goto LABEL_5;
  }
  v9 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v9, "containsObject:", v10);

  if ((v9 & 1) != 0)
  {
LABEL_5:
    objc_msgSend(*(id *)(a1 + 32), "frequenciesWithConfiguredInitialPoints");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObject:", v12);

    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v13);
LABEL_6:

}

void __69__AIAudiogramEnrollmentViewController_updateFrequencyViewControllers__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(*(id *)(a1 + 32), "selectedFrequencies"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "currentFrequency"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v3, "containsObject:", v4),
        v4,
        v3,
        v5))
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  }

}

- (void)refreshFinalConfirmationView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[AIAudiogramEnrollmentViewController finalResultViewController](self, "finalResultViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AIAudiogramEnrollmentViewController finalResultViewController](self, "finalResultViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramEnrollmentViewController selectedFrequencies](self, "selectedFrequencies");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateFrequencies:", v5);

    -[AIAudiogramEnrollmentViewController finalResultViewController](self, "finalResultViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramEnrollmentViewController audiogram](self, "audiogram");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadAudiogram:", v6);

  }
}

- (void)showIndividualFirstSensitivityPointInputViewController
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  AIAudiogramIndividualFrequencyInputViewController *v11;
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
  AIAudiogramIndividualFrequencyInputViewController *v22;

  -[AIAudiogramEnrollmentViewController selectedFrequencies](self, "selectedFrequencies");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_4;
  v5 = (void *)v4;
  -[AIAudiogramEnrollmentViewController frequenciesWithConfiguredInitialPoints](self, "frequenciesWithConfiguredInitialPoints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramEnrollmentViewController selectedFrequencies](self, "selectedFrequencies");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "containsObject:", v8);

  if ((v9 & 1) == 0)
  {
    -[AIAudiogramEnrollmentViewController selectedFrequencies](self, "selectedFrequencies");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramEnrollmentViewController _addInitialSensitivityPointAtFrequency:](self, "_addInitialSensitivityPointAtFrequency:", v10);

LABEL_4:
  }
  v11 = [AIAudiogramIndividualFrequencyInputViewController alloc];
  -[AIAudiogramEnrollmentViewController audiogramConfirmationDelegate](self, "audiogramConfirmationDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramEnrollmentViewController audiogram](self, "audiogram");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramEnrollmentViewController selectedFrequencies](self, "selectedFrequencies");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[AIAudiogramIndividualFrequencyInputViewController initWithDelegate:audiogramConfirmationDelegate:audiogram:currentFrequency:isModalViewController:](v11, "initWithDelegate:audiogramConfirmationDelegate:audiogram:currentFrequency:isModalViewController:", self, v12, v13, v15, 0);

  v16 = (void *)MEMORY[0x24BDD17C8];
  aiLocString(CFSTR("AudiogramIngestionAddValuesTitle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramEnrollmentViewController selectedFrequencies](self, "selectedFrequencies");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIndividualFrequencyInputViewController frequencyTitleLabel](v22, "frequencyTitleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setText:", v20);

  -[OBNavigationController pushViewController:animated:](self, "pushViewController:animated:", v22, 1);
}

- (void)showNextFrequencyInputViewControllerWithAudiogram:(id)a3 previousFrequency:(id)a4
{
  id v6;
  void *v7;
  char v8;
  AIAudiogramIndividualFrequencyInputViewController *v9;
  void *v10;
  void *v11;
  AIAudiogramIndividualFrequencyInputViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  AIAudiogramFinalResultViewController *v17;
  void *v18;
  void *v19;
  void *v20;
  AIAudiogramFinalResultViewController *v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  void *v25;
  id v26;

  v6 = a4;
  -[AIAudiogramEnrollmentViewController setAudiogram:](self, "setAudiogram:", a3);
  -[AIAudiogramEnrollmentViewController getNextFrequency:](self, "getNextFrequency:", v6);
  v26 = (id)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[AIAudiogramEnrollmentViewController frequenciesWithConfiguredInitialPoints](self, "frequenciesWithConfiguredInitialPoints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v26);

    if ((v8 & 1) == 0)
      -[AIAudiogramEnrollmentViewController _addInitialSensitivityPointAtFrequency:](self, "_addInitialSensitivityPointAtFrequency:", v26);
    v9 = [AIAudiogramIndividualFrequencyInputViewController alloc];
    -[AIAudiogramEnrollmentViewController audiogramConfirmationDelegate](self, "audiogramConfirmationDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramEnrollmentViewController audiogram](self, "audiogram");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[AIAudiogramIndividualFrequencyInputViewController initWithDelegate:audiogramConfirmationDelegate:audiogram:currentFrequency:isModalViewController:](v9, "initWithDelegate:audiogramConfirmationDelegate:audiogram:currentFrequency:isModalViewController:", self, v10, v11, v26, 0);

    v13 = (void *)MEMORY[0x24BDD17C8];
    aiLocString(CFSTR("AudiogramIngestionAddValuesTitle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", v14, v26);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramIndividualFrequencyInputViewController frequencyTitleLabel](v12, "frequencyTitleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v15);

  }
  else
  {
    v17 = [AIAudiogramFinalResultViewController alloc];
    -[AIAudiogramEnrollmentViewController audiogram](self, "audiogram");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramEnrollmentViewController selectedFrequencies](self, "selectedFrequencies");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramEnrollmentViewController audiogramConfirmationDelegate](self, "audiogramConfirmationDelegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[AIAudiogramFinalResultViewController initWithAudiogram:selectedFrequencies:audiogramConfirmationDelegate:audiogramManualIngestionDelegate:](v17, "initWithAudiogram:selectedFrequencies:audiogramConfirmationDelegate:audiogramManualIngestionDelegate:", v18, v19, v20, self);
    -[AIAudiogramEnrollmentViewController setFinalResultViewController:](self, "setFinalResultViewController:", v21);

    v22 = -[AIAudiogramEnrollmentViewController analyticsImportSource](self, "analyticsImportSource");
    -[AIAudiogramEnrollmentViewController finalResultViewController](self, "finalResultViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAnalyticsImportSource:", v22);

    v24 = -[AIAudiogramEnrollmentViewController analyticsClient](self, "analyticsClient");
    -[AIAudiogramEnrollmentViewController finalResultViewController](self, "finalResultViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAnalyticsClient:", v24);

    -[AIAudiogramEnrollmentViewController finalResultViewController](self, "finalResultViewController");
    v12 = (AIAudiogramIndividualFrequencyInputViewController *)objc_claimAutoreleasedReturnValue();
  }
  -[OBNavigationController pushViewController:animated:](self, "pushViewController:animated:", v12, 1);

}

- (void)_addInitialSensitivityPointAtFrequency:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id HKQuantityClass_2;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id HKAudiogramSampleClass_0;
  id v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  _QWORD v47[5];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;

  v4 = a3;
  -[AIAudiogramEnrollmentViewController frequenciesWithConfiguredInitialPoints](self, "frequenciesWithConfiguredInitialPoints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_opt_new();
    -[AIAudiogramEnrollmentViewController setFrequenciesWithConfiguredInitialPoints:](self, "setFrequenciesWithConfiguredInitialPoints:", v6);

  }
  -[AIAudiogramEnrollmentViewController frequenciesWithConfiguredInitialPoints](self, "frequenciesWithConfiguredInitialPoints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

  objc_msgSend(getHKUnitClass_3(), "decibelHearingLevelUnit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getHKUnitClass_3(), "hertzUnit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HKQuantityClass_2 = getHKQuantityClass_2();
  objc_msgSend(v4, "doubleValue");
  objc_msgSend(HKQuantityClass_2, "quantityWithUnit:doubleValue:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDBCEB8];
  -[AIAudiogramEnrollmentViewController audiogram](self, "audiogram");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sensitivityPoints");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = v14;
  else
    v16 = MEMORY[0x24BDBD1A8];
  objc_msgSend(v12, "arrayWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = MEMORY[0x24BDAC760];
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __78__AIAudiogramEnrollmentViewController__addInitialSensitivityPointAtFrequency___block_invoke;
  v44[3] = &unk_24FD6DBB8;
  v19 = v9;
  v45 = v19;
  v20 = v4;
  v46 = v20;
  if (objc_msgSend(v17, "indexOfObjectPassingTest:", v44) == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (-[AIAudiogramEnrollmentViewController hasLeftSymbols](self, "hasLeftSymbols"))
    {
      objc_msgSend(getHKQuantityClass_2(), "quantityWithUnit:doubleValue:", v8, 0.0);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }
    if (-[AIAudiogramEnrollmentViewController hasRightSymbols](self, "hasRightSymbols"))
    {
      objc_msgSend(getHKQuantityClass_2(), "quantityWithUnit:doubleValue:", v8, 0.0);
      v23 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
    v48 = 0;
    v49 = &v48;
    v50 = 0x2050000000;
    v24 = (void *)getHKAudiogramSensitivityPointClass_softClass_2;
    v51 = getHKAudiogramSensitivityPointClass_softClass_2;
    if (!getHKAudiogramSensitivityPointClass_softClass_2)
    {
      v47[0] = v18;
      v47[1] = 3221225472;
      v47[2] = __getHKAudiogramSensitivityPointClass_block_invoke_2;
      v47[3] = &unk_24FD6CE58;
      v47[4] = &v48;
      __getHKAudiogramSensitivityPointClass_block_invoke_2((uint64_t)v47);
      v24 = (void *)v49[3];
    }
    v40 = v8;
    v25 = objc_retainAutorelease(v24);
    _Block_object_dispose(&v48, 8);
    v43 = 0;
    objc_msgSend(v25, "sensitivityPointWithFrequency:leftEarSensitivity:rightEarSensitivity:error:", v11, v21, v23, &v43);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v43;
    if (v21 | v23)
      objc_msgSend(v17, "addObject:", v26);
    if (objc_msgSend(v17, "count"))
    {
      v41[0] = v18;
      v41[1] = 3221225472;
      v41[2] = __78__AIAudiogramEnrollmentViewController__addInitialSensitivityPointAtFrequency___block_invoke_2;
      v41[3] = &unk_24FD6DBE0;
      v42 = v19;
      objc_msgSend(v17, "sortedArrayUsingComparator:", v41);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v11;
      v28 = objc_msgSend(v27, "mutableCopy");

      -[AIAudiogramEnrollmentViewController pickedDate](self, "pickedDate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      HKAudiogramSampleClass_0 = getHKAudiogramSampleClass_0();
      metadataForHKAudiogramSample();
      v38 = v22;
      v31 = v19;
      v32 = v23;
      v33 = v20;
      v34 = v26;
      v35 = v21;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(HKAudiogramSampleClass_0, "audiogramSampleWithSensitivityPoints:startDate:endDate:metadata:", v28, v29, v29, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[AIAudiogramEnrollmentViewController setAudiogram:](self, "setAudiogram:", v37);

      v21 = v35;
      v26 = v34;
      v20 = v33;
      v23 = v32;
      v19 = v31;
      v22 = v38;

      v17 = (void *)v28;
      v11 = v39;
    }

    v8 = v40;
  }
  else
  {
    v22 = 0;
  }

}

BOOL __78__AIAudiogramEnrollmentViewController__addInitialSensitivityPointAtFrequency___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  objc_msgSend(a2, "frequency");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValueForUnit:", *(_QWORD *)(a1 + 32));
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 40), "doubleValue");
  v10 = v9;

  if (v8 == v10)
    *a4 = 1;
  return v8 == v10;
}

uint64_t __78__AIAudiogramEnrollmentViewController__addInitialSensitivityPointAtFrequency___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;

  v5 = a3;
  objc_msgSend(a2, "frequency");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValueForUnit:", *(_QWORD *)(a1 + 32));
  v8 = v7;
  objc_msgSend(v5, "frequency");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "doubleValueForUnit:", *(_QWORD *)(a1 + 32));
  v11 = v10;

  if (v8 >= v11)
    return 1;
  else
    return -1;
}

- (id)getNextFrequency:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[AIAudiogramEnrollmentViewController selectedFrequencies](self, "selectedFrequencies");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL
    || (v7 = v6 + 1,
        -[AIAudiogramEnrollmentViewController selectedFrequencies](self, "selectedFrequencies"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "count"),
        v8,
        v7 >= v9))
  {
    v11 = 0;
  }
  else
  {
    -[AIAudiogramEnrollmentViewController selectedFrequencies](self, "selectedFrequencies");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (void)completedAudiogramManualIngestion
{
  -[AIAudiogramEnrollmentViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)updateAudiogramDate:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id HKAudiogramSampleClass_0;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[AIAudiogramEnrollmentViewController setPickedDate:](self, "setPickedDate:");
  -[AIAudiogramEnrollmentViewController audiogram](self, "audiogram");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sensitivityPoints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    HKAudiogramSampleClass_0 = getHKAudiogramSampleClass_0();
    -[AIAudiogramEnrollmentViewController audiogram](self, "audiogram");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sensitivityPoints");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    metadataForHKAudiogramSample();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(HKAudiogramSampleClass_0, "audiogramSampleWithSensitivityPoints:startDate:endDate:metadata:", v9, v12, v12, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramEnrollmentViewController setAudiogram:](self, "setAudiogram:", v11);

    -[AIAudiogramEnrollmentViewController updateFrequencyViewControllers](self, "updateFrequencyViewControllers");
    -[AIAudiogramEnrollmentViewController refreshFinalConfirmationView](self, "refreshFinalConfirmationView");
  }

}

- (void)didSelectNodeToEditWithSelectedFrequency:(id)a3
{
  void *v4;
  char v5;
  AIAudiogramIndividualFrequencyInputViewController *v6;
  void *v7;
  void *v8;
  AIAudiogramIndividualFrequencyInputViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[AIAudiogramEnrollmentViewController frequenciesWithConfiguredInitialPoints](self, "frequenciesWithConfiguredInitialPoints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v15);

  if ((v5 & 1) == 0)
    -[AIAudiogramEnrollmentViewController _addInitialSensitivityPointAtFrequency:](self, "_addInitialSensitivityPointAtFrequency:", v15);
  v6 = [AIAudiogramIndividualFrequencyInputViewController alloc];
  -[AIAudiogramEnrollmentViewController audiogramConfirmationDelegate](self, "audiogramConfirmationDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramEnrollmentViewController audiogram](self, "audiogram");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AIAudiogramIndividualFrequencyInputViewController initWithDelegate:audiogramConfirmationDelegate:audiogram:currentFrequency:isModalViewController:](v6, "initWithDelegate:audiogramConfirmationDelegate:audiogram:currentFrequency:isModalViewController:", self, v7, v8, v15, 1);

  v10 = (void *)MEMORY[0x24BDD17C8];
  aiLocString(CFSTR("AudiogramIngestionEditValuesTitle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", v11, v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIndividualFrequencyInputViewController frequencyTitleLabel](v9, "frequencyTitleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v9);
  -[AIAudiogramEnrollmentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);

}

- (void)didSelectNodeToAddWithSelectedFrequency:(id)a3
{
  void *v4;
  char v5;
  AIAudiogramIndividualFrequencyInputViewController *v6;
  void *v7;
  void *v8;
  AIAudiogramIndividualFrequencyInputViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[AIAudiogramEnrollmentViewController frequenciesWithConfiguredInitialPoints](self, "frequenciesWithConfiguredInitialPoints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v15);

  if ((v5 & 1) == 0)
    -[AIAudiogramEnrollmentViewController _addInitialSensitivityPointAtFrequency:](self, "_addInitialSensitivityPointAtFrequency:", v15);
  v6 = [AIAudiogramIndividualFrequencyInputViewController alloc];
  -[AIAudiogramEnrollmentViewController audiogramConfirmationDelegate](self, "audiogramConfirmationDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramEnrollmentViewController audiogram](self, "audiogram");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AIAudiogramIndividualFrequencyInputViewController initWithDelegate:audiogramConfirmationDelegate:audiogram:currentFrequency:isModalViewController:](v6, "initWithDelegate:audiogramConfirmationDelegate:audiogram:currentFrequency:isModalViewController:", self, v7, v8, v15, 1);

  -[AIAudiogramIndividualFrequencyInputViewController setUserAddedFrequencyAfterOptical:](v9, "setUserAddedFrequencyAfterOptical:", 1);
  v10 = (void *)MEMORY[0x24BDD17C8];
  aiLocString(CFSTR("AudiogramIngestionAddValuesTitle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", v11, v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIndividualFrequencyInputViewController frequencyTitleLabel](v9, "frequencyTitleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v9);
  -[AIAudiogramEnrollmentViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
  -[AIAudiogramEnrollmentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);

}

- (void)dismissCurrentFrequencyInputViewControllerWithAudiogram:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AIAudiogramEnrollmentViewController setAudiogram:](self, "setAudiogram:", v4);
  -[AIAudiogramEnrollmentViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[AIAudiogramEnrollmentViewController finalResultViewController](self, "finalResultViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadAudiogram:", v4);

}

- (unint64_t)analyticsClient
{
  return self->_analyticsClient;
}

- (void)setAnalyticsClient:(unint64_t)a3
{
  self->_analyticsClient = a3;
}

- (AIAudiogramConfirmResultsViewControllerDelegate)audiogramConfirmationDelegate
{
  return (AIAudiogramConfirmResultsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_audiogramConfirmationDelegate);
}

- (void)setAudiogramConfirmationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_audiogramConfirmationDelegate, a3);
}

- (OBTextWelcomeController)validationFailedController
{
  return self->_validationFailedController;
}

- (void)setValidationFailedController:(id)a3
{
  objc_storeStrong((id *)&self->_validationFailedController, a3);
}

- (AIAudiogramLoadingViewController)loadingController
{
  return self->_loadingController;
}

- (void)setLoadingController:(id)a3
{
  objc_storeStrong((id *)&self->_loadingController, a3);
}

- (BOOL)isCameraAvailable
{
  return self->_isCameraAvailable;
}

- (void)setIsCameraAvailable:(BOOL)a3
{
  self->_isCameraAvailable = a3;
}

- (AIAudiogramIngestionEngine)audiogramEngine
{
  return self->_audiogramEngine;
}

- (void)setAudiogramEngine:(id)a3
{
  objc_storeStrong((id *)&self->_audiogramEngine, a3);
}

- (NSArray)audiogramImages
{
  return self->_audiogramImages;
}

- (void)setAudiogramImages:(id)a3
{
  objc_storeStrong((id *)&self->_audiogramImages, a3);
}

- (BOOL)analyticsIngestionAttempted
{
  return self->_analyticsIngestionAttempted;
}

- (void)setAnalyticsIngestionAttempted:(BOOL)a3
{
  self->_analyticsIngestionAttempted = a3;
}

- (unint64_t)analyticsImportSource
{
  return self->_analyticsImportSource;
}

- (void)setAnalyticsImportSource:(unint64_t)a3
{
  self->_analyticsImportSource = a3;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (HKUnitPreferenceController)unitPreferenceController
{
  return self->_unitPreferenceController;
}

- (void)setUnitPreferenceController:(id)a3
{
  objc_storeStrong((id *)&self->_unitPreferenceController, a3);
}

- (NSDate)initialDate
{
  return self->_initialDate;
}

- (void)setInitialDate:(id)a3
{
  objc_storeStrong((id *)&self->_initialDate, a3);
}

- (NSArray)selectedFrequencies
{
  return self->_selectedFrequencies;
}

- (void)setSelectedFrequencies:(id)a3
{
  objc_storeStrong((id *)&self->_selectedFrequencies, a3);
}

- (HKAudiogramSample)audiogram
{
  return self->_audiogram;
}

- (void)setAudiogram:(id)a3
{
  objc_storeStrong((id *)&self->_audiogram, a3);
}

- (NSNumber)currentFrequency
{
  return self->_currentFrequency;
}

- (void)setCurrentFrequency:(id)a3
{
  objc_storeStrong((id *)&self->_currentFrequency, a3);
}

- (BOOL)hasLeftSymbols
{
  return self->_hasLeftSymbols;
}

- (void)setHasLeftSymbols:(BOOL)a3
{
  self->_hasLeftSymbols = a3;
}

- (BOOL)hasRightSymbols
{
  return self->_hasRightSymbols;
}

- (void)setHasRightSymbols:(BOOL)a3
{
  self->_hasRightSymbols = a3;
}

- (NSDate)pickedDate
{
  return self->_pickedDate;
}

- (void)setPickedDate:(id)a3
{
  self->_pickedDate = (NSDate *)a3;
}

- (AIAudiogramFinalResultViewController)finalResultViewController
{
  return self->_finalResultViewController;
}

- (void)setFinalResultViewController:(id)a3
{
  objc_storeStrong((id *)&self->_finalResultViewController, a3);
}

- (NSMutableSet)frequenciesWithConfiguredInitialPoints
{
  return self->_frequenciesWithConfiguredInitialPoints;
}

- (void)setFrequenciesWithConfiguredInitialPoints:(id)a3
{
  objc_storeStrong((id *)&self->_frequenciesWithConfiguredInitialPoints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frequenciesWithConfiguredInitialPoints, 0);
  objc_storeStrong((id *)&self->_finalResultViewController, 0);
  objc_storeStrong((id *)&self->_currentFrequency, 0);
  objc_storeStrong((id *)&self->_audiogram, 0);
  objc_storeStrong((id *)&self->_selectedFrequencies, 0);
  objc_storeStrong((id *)&self->_initialDate, 0);
  objc_storeStrong((id *)&self->_unitPreferenceController, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_audiogramImages, 0);
  objc_storeStrong((id *)&self->_audiogramEngine, 0);
  objc_storeStrong((id *)&self->_loadingController, 0);
  objc_storeStrong((id *)&self->_validationFailedController, 0);
  objc_destroyWeak((id *)&self->_audiogramConfirmationDelegate);
}

- (void)_imagesFromPDF:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22FB4F000, v0, v1, "CFURLRef was nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_imagesFromPDF:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22FB4F000, v0, v1, "CGPDFDocumentRef was nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)documentCameraViewController:didFailWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_22FB4F000, v0, v1, "Audiogram scan failed %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __63__AIAudiogramEnrollmentViewController_picker_didFinishPicking___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_22FB4F000, v0, v1, "Object returned from photo picker was not UIImage. Instead found %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __63__AIAudiogramEnrollmentViewController_picker_didFinishPicking___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_22FB4F000, v0, v1, "Error picking photo from photo picker %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __77__AIAudiogramEnrollmentViewController_documentPicker_didPickDocumentsAtURLs___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22FB4F000, v0, v1, "No path provided for picked document", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __77__AIAudiogramEnrollmentViewController_documentPicker_didPickDocumentsAtURLs___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_22FB4F000, v0, v1, "No document read from URL: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __77__AIAudiogramEnrollmentViewController_documentPicker_didPickDocumentsAtURLs___block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_22FB4F000, v0, v1, "Unable to read content type from document's path: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
