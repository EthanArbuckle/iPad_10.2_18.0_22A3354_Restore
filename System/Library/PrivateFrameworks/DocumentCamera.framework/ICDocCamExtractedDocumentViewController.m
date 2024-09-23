@implementation ICDocCamExtractedDocumentViewController

- (CGSize)imageSizeForDocumentAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGSize result;

  -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "docInfos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v8 = 0.0;
  v9 = 0.0;
  if (v7 > a3)
  {
    -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "docInfos");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "croppedAndFilteredImageUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[ICDocCamExtractedDocumentViewController imageCache](self, "imageCache");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "croppedAndFilteredImageUUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "getImageSize:", v15);
      v8 = v16;
      v9 = v17;
    }
    else
    {
      -[ICDocCamExtractedDocumentViewController delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_opt_respondsToSelector();

      if ((v19 & 1) == 0)
      {
LABEL_7:

        goto LABEL_8;
      }
      -[ICDocCamExtractedDocumentViewController delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "docInfos");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndexedSubscript:", a3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "extractedDocumentControllerImageSizeForDocument:", v21);
      v8 = v22;
      v9 = v23;

    }
    goto LABEL_7;
  }
LABEL_8:
  v24 = v8;
  v25 = v9;
  result.height = v25;
  result.width = v24;
  return result;
}

- (id)croppedAndFilteredmageForDocumentAtIndex:(int64_t)a3
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
  char v16;

  -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "docInfos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 > a3)
  {
    -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "docInfos");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "croppedAndFilteredImageUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[ICDocCamExtractedDocumentViewController imageCache](self, "imageCache");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "croppedAndFilteredImageUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "getImage:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[ICDocCamExtractedDocumentViewController delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) == 0)
      {
        v14 = 0;
        goto LABEL_9;
      }
      -[ICDocCamExtractedDocumentViewController delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "extractedDocumentControllerImageForDocument:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

LABEL_9:
    return v14;
  }
  v14 = 0;
  return v14;
}

- (id)croppedButNotFilteredImageForDocumentAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "docInfos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") <= (unint64_t)a3)
  {
    v10 = 0;
  }
  else
  {
    -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "docInfos");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentViewController croppedButNotFilteredImageForDocInfo:](self, "croppedButNotFilteredImageForDocInfo:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)croppedButNotFilteredImageForDocInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = a3;
  objc_msgSend(v4, "croppedButNotFilteredImageUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_3;
  -[ICDocCamExtractedDocumentViewController imageCache](self, "imageCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "croppedButNotFilteredImageUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getImage:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_3:
    -[ICDocCamExtractedDocumentViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0
      || (-[ICDocCamExtractedDocumentViewController delegate](self, "delegate"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v11, "extractedDocumentControllerUncroppedImageForDocument:", v4),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          !v8))
    {
      objc_msgSend(v4, "fullImageUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[ICDocCamExtractedDocumentViewController imageCache](self, "imageCache");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "fullImageUUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "getImage:", v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    objc_msgSend(v4, "imageQuad");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v8 && v14)
    {
      +[ICDocCamImageFilters perspectiveCorrectedImageFromImage:normalizedImageQuad:](ICDocCamImageFilters, "perspectiveCorrectedImageFromImage:normalizedImageQuad:", v8, v14);
      v16 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v16;
    }
    if (v8)
    {
      -[ICDocCamExtractedDocumentViewController delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_opt_respondsToSelector();

      if ((v18 & 1) == 0)
      {
        -[ICDocCamExtractedDocumentViewController imageCache](self, "imageCache");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "metaData");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setImage:metaData:", v8, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setCroppedButNotFilteredImageUUID:", v21);

      }
    }

  }
  return v8;
}

- (CIContext)sharedCoreImageContext
{
  ICDocCamExtractedDocumentViewController *v2;
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

+ (CGRect)targetRectForOrientation:(int64_t)a3 window:(id)a4
{
  id v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  v5 = a4;
  +[ICDocCamPageContentViewController leadingTrailingOffset:](ICDocCamPageContentViewController, "leadingTrailingOffset:", a3);
  v7 = v6;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;

  v13 = 37.0;
  if ((DCDebugInterfaceEnabled() & 1) != 0
    || (objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "userInterfaceIdiom"),
        v14,
        v15 == 1))
  {
    *(double *)&v16 = 44.0;
  }
  else
  {
    if ((unint64_t)(a3 - 1) < 2
      || (unint64_t)(a3 - 3) <= 1 && !objc_msgSend(v5, "dc_requiresCompactLandscapeIcons"))
    {
      v17 = 44.0;
      v13 = 113.0;
      goto LABEL_5;
    }
    *(double *)&v16 = 32.0;
  }
  v17 = *(double *)&v16;
LABEL_5:

  v18 = v7;
  v19 = v17;
  v20 = v10 + v7 * -2.0;
  v21 = v12 - (v17 + v13);
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (ICDocCamExtractedDocumentViewController)initWithDelegate:(id)a3 documentInfoCollection:(id)a4 imageCache:(id)a5 currentIndex:(int64_t)a6 mode:(int)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  ICDocCamExtractedDocumentViewController *v16;
  objc_super v18;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)ICDocCamExtractedDocumentViewController;
  v16 = -[ICDocCamExtractedDocumentViewController initWithNibName:bundle:](&v18, sel_initWithNibName_bundle_, CFSTR("ICDocCamExtractedDocumentViewController"), v15);

  if (v16)
  {
    objc_storeWeak((id *)&v16->_delegate, v12);
    objc_storeStrong((id *)&v16->_documentInfoCollection, a4);
    v16->_presentationPageIndex = a6;
    objc_storeStrong((id *)&v16->_imageCache, a5);
    v16->_mode = a7;
  }
  -[ICDocCamExtractedDocumentViewController updatePageIndicatorForPageIndex:](v16, "updatePageIndicatorForPageIndex:", -[ICDocCamExtractedDocumentViewController presentationPageIndex](v16, "presentationPageIndex"));

  return v16;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICDocCamExtractedDocumentViewController;
  -[ICDocCamExtractedDocumentViewController dealloc](&v4, sel_dealloc);
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (id)undoManager
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  objc_super v8;

  -[ICDocCamExtractedDocumentViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[ICDocCamExtractedDocumentViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "extractedDocumentControllerUndoManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ICDocCamExtractedDocumentViewController;
    -[ICDocCamExtractedDocumentViewController undoManager](&v8, sel_undoManager);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)defaultsChanged
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__ICDocCamExtractedDocumentViewController_defaultsChanged__block_invoke;
  block[3] = &unk_24C5B7AE0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __58__ICDocCamExtractedDocumentViewController_defaultsChanged__block_invoke(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  id *v4;
  void *v5;
  uint64_t result;

  if (objc_msgSend(MEMORY[0x24BDF6AD8], "isSourceTypeAvailable:", 1)
    && (v2 = (id *)(a1 + 32), (objc_msgSend(*(id *)(a1 + 32), "cameraDisabled") & 1) == 0))
  {
    result = objc_msgSend(*v2, "cameraRestricted");
    if ((result & 1) == 0)
      return result;
    v3 = 0;
  }
  else
  {
    v3 = DCDebugInterfaceEnabled() ^ 1;
    v5 = *(void **)(a1 + 32);
    v4 = (id *)(a1 + 32);
    result = objc_msgSend(v5, "cameraRestricted");
    if ((_DWORD)result == (_DWORD)v3)
      return result;
    v2 = v4;
  }
  objc_msgSend(*v2, "setCameraRestricted:", v3);
  return objc_msgSend(*v2, "updateLayout");
}

- (BOOL)cameraDisabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("com.apple.notes.cameraDisabled"));

  return v3;
}

- (void)viewDidLoad
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
  id v14;
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
  _BOOL8 v68;
  id v69;
  id v70;
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
  double v96;
  void *v97;
  void *v98;
  void *v99;
  double v100;
  void *v101;
  void *v102;
  ICDocCamReorderingThumbnailCollectionViewLayout *v103;
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
  _BOOL8 v115;
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
  id v132;
  void *v133;
  objc_super v134;
  void *v135;
  const __CFString *v136;
  void *v137;
  const __CFString *v138;
  void *v139;
  uint64_t v140;
  void *v141;
  __int128 v142;
  uint64_t v143;
  uint64_t v144;

  v144 = *MEMORY[0x24BDAC8D0];
  v134.receiver = self;
  v134.super_class = (Class)ICDocCamExtractedDocumentViewController;
  -[ICDocCamExtractedDocumentViewController viewDidLoad](&v134, sel_viewDidLoad);
  v135 = 0;
  if (!UIAccessibilityLibraryCore_frameworkLibrary)
  {
    v142 = xmmword_24C5B7E78;
    v143 = 0;
    UIAccessibilityLibraryCore_frameworkLibrary = _sl_dlopen();
    v4 = v135;
    v3 = (void *)UIAccessibilityLibraryCore_frameworkLibrary;
    if (UIAccessibilityLibraryCore_frameworkLibrary)
    {
      if (!v135)
        goto LABEL_5;
    }
    else
    {
      v133 = v135;
      v4 = (void *)abort_report_np();
    }
    free(v4);
    goto LABEL_5;
  }
  v3 = (void *)UIAccessibilityLibraryCore_frameworkLibrary;
LABEL_5:
  dlsym(v3, "_UIAccessibilityStart");
  -[ICDocCamExtractedDocumentViewController setModalPresentationCapturesStatusBarAppearance:](self, "setModalPresentationCapturesStatusBarAppearance:", 1);
  -[ICDocCamExtractedDocumentViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBarStyle:", 0);

  objc_msgSend(MEMORY[0x24BDF6950], "dc_barColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBarTintColor:", v7);

  objc_msgSend(MEMORY[0x24BDF6950], "dc_barColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController topToolbar](self, "topToolbar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v10);

  objc_msgSend(MEMORY[0x24BDF6950], "dc_barColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController bottomToolbar](self, "bottomToolbar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBarTintColor:", v12);

  -[ICDocCamExtractedDocumentViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  v14 = objc_alloc_init(MEMORY[0x24BDF6BE8]);
  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v15);

  -[ICDocCamExtractedDocumentViewController navigationItem](self, "navigationItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setScrollEdgeAppearance:", v14);

  objc_msgSend(MEMORY[0x24BDF6950], "DCExtractedDocumentViewControllerBackgroundColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBackgroundColor:", v17);

  -[ICDocCamExtractedDocumentViewController bottomToolbar](self, "bottomToolbar");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "safeAreaLayoutGuide");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setActive:", 1);

  objc_msgSend(MEMORY[0x24BDF6AC8], "dc_largeSystemImageNamed:", CFSTR("plus.circle"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController addButtonItem](self, "addButtonItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setImage:", v25);

  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("plus.circle"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController addButtonItem](self, "addButtonItem");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setLandscapeImagePhone:", v27);

  objc_msgSend(MEMORY[0x24BDF6AC8], "dc_largeSystemImageNamed:", CFSTR("crop"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController recropButtonItem](self, "recropButtonItem");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setImage:", v29);

  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("crop"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController recropButtonItem](self, "recropButtonItem");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setLandscapeImagePhone:", v31);

  objc_msgSend(MEMORY[0x24BDF6AC8], "dc_largeSystemImageNamed:", CFSTR("crop"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController recropButtonItemForNavBar](self, "recropButtonItemForNavBar");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setImage:", v33);

  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("crop"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController recropButtonItemForNavBar](self, "recropButtonItemForNavBar");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setLandscapeImagePhone:", v35);

  objc_msgSend(MEMORY[0x24BDF6AC8], "dc_largeSystemImageNamed:", CFSTR("rotate.left"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController rotateButtonItem](self, "rotateButtonItem");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setImage:", v37);

  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("rotate.left"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController rotateButtonItem](self, "rotateButtonItem");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setLandscapeImagePhone:", v39);

  objc_msgSend(MEMORY[0x24BDF6AC8], "dc_largeSystemImageNamed:", CFSTR("rotate.left"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController rotateButtonItemForNavBar](self, "rotateButtonItemForNavBar");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setImage:", v41);

  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("rotate.left"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController rotateButtonItemForNavBar](self, "rotateButtonItemForNavBar");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setLandscapeImagePhone:", v43);

  objc_msgSend(MEMORY[0x24BDF6AC8], "dc_largeSystemImageNamed:", CFSTR("trash"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController trashButtonItem](self, "trashButtonItem");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setImage:", v45);

  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("trash"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController trashButtonItem](self, "trashButtonItem");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setLandscapeImagePhone:", v47);

  objc_msgSend(MEMORY[0x24BDF6AC8], "dc_largeSystemImageNamed:", CFSTR("trash"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController trashButtonItemForNavBar](self, "trashButtonItemForNavBar");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setImage:", v49);

  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("trash"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController trashButtonItemForNavBar](self, "trashButtonItemForNavBar");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setLandscapeImagePhone:", v51);

  objc_msgSend(MEMORY[0x24BDF6AC8], "dc_largeSystemImageNamed:", CFSTR("square.and.arrow.up"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController actionButtonItem](self, "actionButtonItem");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setImage:", v53);

  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("square.and.arrow.up"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController actionButtonItem](self, "actionButtonItem");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setLandscapeImagePhone:", v55);

  objc_msgSend(MEMORY[0x24BDF6AC8], "dc_largeSystemImageNamed:", CFSTR("camera.filters"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController filterButtonItem](self, "filterButtonItem");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setImage:", v57);

  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("camera.filters"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController filterButtonItem](self, "filterButtonItem");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setLandscapeImagePhone:", v59);

  objc_msgSend(MEMORY[0x24BDF6AC8], "dc_largeSystemImageNamed:", CFSTR("camera.filters"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController filterButtonItemForNavBar](self, "filterButtonItemForNavBar");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setImage:", v61);

  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("camera.filters"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController filterButtonItemForNavBar](self, "filterButtonItemForNavBar");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setLandscapeImagePhone:", v63);

  -[ICDocCamExtractedDocumentViewController filterButtonItem](self, "filterButtonItem");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "_setAdditionalSelectionInsets:", 5.0, 3.0, 5.0, 3.0);

  -[ICDocCamExtractedDocumentViewController filterButtonItemForNavBar](self, "filterButtonItemForNavBar");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "_setAdditionalSelectionInsets:", 5.0, 3.0, 5.0, 3.0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "addObserver:selector:name:object:", self, sel_defaultsChanged, *MEMORY[0x24BDD13F0], 0);

  v68 = (DCDebugInterfaceEnabled() & 1) == 0
     && (!objc_msgSend(MEMORY[0x24BDF6AD8], "isSourceTypeAvailable:", 1)
      || -[ICDocCamExtractedDocumentViewController cameraDisabled](self, "cameraDisabled"));
  -[ICDocCamExtractedDocumentViewController setCameraRestricted:](self, "setCameraRestricted:", v68, v133);
  v69 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[ICDocCamExtractedDocumentViewController setDocumentsToUpdateWhenScrollingStops:](self, "setDocumentsToUpdateWhenScrollingStops:", v69);

  -[ICDocCamExtractedDocumentViewController setPreviousViewSize:](self, "setPreviousViewSize:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  -[ICDocCamExtractedDocumentViewController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", 15);
  -[ICDocCamExtractedDocumentViewController setExtendedLayoutIncludesOpaqueBars:](self, "setExtendedLayoutIncludesOpaqueBars:", 1);
  v70 = objc_alloc(MEMORY[0x24BDF6C30]);
  v140 = *MEMORY[0x24BDF7BF8];
  v141 = &unk_24C5D7F40;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v141, &v140, 1);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = (void *)objc_msgSend(v70, "initWithTransitionStyle:navigationOrientation:options:", 1, 0, v71);
  -[ICDocCamExtractedDocumentViewController setPageViewController:](self, "setPageViewController:", v72);

  -[ICDocCamExtractedDocumentViewController pageViewController](self, "pageViewController");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setDataSource:", self);

  -[ICDocCamExtractedDocumentViewController pageViewController](self, "pageViewController");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setDelegate:", self);

  -[ICDocCamExtractedDocumentViewController pageViewController](self, "pageViewController");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController addChildViewController:](self, "addChildViewController:", v75);

  -[ICDocCamExtractedDocumentViewController pageViewControllerContainerView](self, "pageViewControllerContainerView");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController pageViewController](self, "pageViewController");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "view");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addSubview:", v78);

  -[ICDocCamExtractedDocumentViewController pageViewController](self, "pageViewController");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "didMoveToParentViewController:", self);

  -[ICDocCamExtractedDocumentViewController currentBackgroundColor](self, "currentBackgroundColor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController pageViewControllerContainerView](self, "pageViewControllerContainerView");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setBackgroundColor:", v80);

  v82 = (void *)MEMORY[0x24BDD1628];
  v138 = CFSTR("childView");
  -[ICDocCamExtractedDocumentViewController pageViewController](self, "pageViewController");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "view");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = v84;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v139, &v138, 1);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[childView]|"), 0, 0, v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  v87 = (void *)MEMORY[0x24BDD1628];
  v136 = CFSTR("childView");
  -[ICDocCamExtractedDocumentViewController pageViewController](self, "pageViewController");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "view");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = v89;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v137, &v136, 1);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[childView]|"), 0, 0, v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v86);
  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v91);
  -[ICDocCamExtractedDocumentViewController pageViewController](self, "pageViewController");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "view");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[ICDocCamExtractedDocumentViewController showViewControllerAtIndex:animated:](self, "showViewControllerAtIndex:animated:", -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex"), 0);
  -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("ICDocCamThumbnailCellKind"));

  -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("ICDocCamExtractedDocumentThumbnailCell"));

  v96 = *MEMORY[0x24BDF7D78];
  -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "setDecelerationRate:", v96);

  -[ICDocCamExtractedDocumentViewController collectionTitleButton](self, "collectionTitleButton");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

  -[ICDocCamExtractedDocumentViewController collectionTitleButton](self, "collectionTitleButton");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v100) = 1132068864;
  objc_msgSend(v99, "setContentCompressionResistancePriority:forAxis:", 0, v100);

  -[ICDocCamExtractedDocumentViewController pageIndexLabel](self, "pageIndexLabel");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

  -[ICDocCamExtractedDocumentViewController pageIndexLabel](self, "pageIndexLabel");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "setTextAlignment:", 1);

  v103 = -[ICDocCamReorderingThumbnailCollectionViewLayout initWithDelegate:]([ICDocCamReorderingThumbnailCollectionViewLayout alloc], "initWithDelegate:", self);
  -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "setCollectionViewLayout:", v103);

  -[ICDocCamExtractedDocumentViewController setCurrentThumbnailItem:animated:](self, "setCurrentThumbnailItem:animated:", -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex"), 0);
  -[ICDocCamExtractedDocumentViewController thumbnailLongPressGestureRecognizer](self, "thumbnailLongPressGestureRecognizer");
  v105 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v105)
  {
    v106 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BA0]), "initWithTarget:action:", self, sel_respondToThumbnailLongPressGesture_);
    -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "addGestureRecognizer:", v106);

    -[ICDocCamExtractedDocumentViewController setThumbnailLongPressGestureRecognizer:](self, "setThumbnailLongPressGestureRecognizer:", v106);
  }
  -[ICDocCamExtractedDocumentViewController imageLongPressGestureRecognizer](self, "imageLongPressGestureRecognizer");
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v108)
  {
    v109 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BA0]), "initWithTarget:action:", self, sel_respondToImageLongPressGesture_);
    -[ICDocCamExtractedDocumentViewController view](self, "view");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "addGestureRecognizer:", v109);

    -[ICDocCamExtractedDocumentViewController setImageLongPressGestureRecognizer:](self, "setImageLongPressGestureRecognizer:", v109);
    -[ICDocCamExtractedDocumentViewController imageLongPressGestureRecognizer](self, "imageLongPressGestureRecognizer");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "setDelegate:", self);

  }
  -[ICDocCamExtractedDocumentViewController axHUDLongPressGestureRecognizer](self, "axHUDLongPressGestureRecognizer");
  v112 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v112)
  {
    v113 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BA0]), "initWithTarget:action:", self, sel_handleAccessibilityLongPressOnCollectionTitle_);
    -[ICDocCamExtractedDocumentViewController setAxHUDLongPressGestureRecognizer:](self, "setAxHUDLongPressGestureRecognizer:", v113);

    -[ICDocCamExtractedDocumentViewController axHUDLongPressGestureRecognizer](self, "axHUDLongPressGestureRecognizer");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "setDelegate:", self);

    v115 = DCAccessibilityAccessibilityLargerTextSizesEnabled();
    -[ICDocCamExtractedDocumentViewController axHUDLongPressGestureRecognizer](self, "axHUDLongPressGestureRecognizer");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "setEnabled:", v115);

    -[ICDocCamExtractedDocumentViewController collectionTitleButton](self, "collectionTitleButton");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentViewController axHUDLongPressGestureRecognizer](self, "axHUDLongPressGestureRecognizer");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "addGestureRecognizer:", v118);

  }
  -[ICDocCamExtractedDocumentViewController axHUDLongPressGestureRecognizer](self, "axHUDLongPressGestureRecognizer");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController imageLongPressGestureRecognizer](self, "imageLongPressGestureRecognizer");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "requireGestureRecognizerToFail:", v120);

  -[ICDocCamExtractedDocumentViewController imageLongPressGestureRecognizer](self, "imageLongPressGestureRecognizer");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController thumbnailLongPressGestureRecognizer](self, "thumbnailLongPressGestureRecognizer");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "requireGestureRecognizerToFail:", v122);

  -[ICDocCamExtractedDocumentViewController pageViewController](self, "pageViewController");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "view");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "subviews");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "dc_objectPassingTest:", &__block_literal_global);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController setPageViewControllerScrollView:](self, "setPageViewControllerScrollView:", v126);

  -[ICDocCamExtractedDocumentViewController pageViewControllerScrollView](self, "pageViewControllerScrollView");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "setContentInsetAdjustmentBehavior:", 2);

  -[ICDocCamExtractedDocumentViewController pageViewControllerScrollView](self, "pageViewControllerScrollView");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setDelegate:", self);

  -[ICDocCamExtractedDocumentViewController setupAccessibilityInfo](self, "setupAccessibilityInfo");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "addObserver:selector:name:object:", self, sel_updateForAccessibilityDarkerSystemColors, *MEMORY[0x24BDF7230], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "addObserver:selector:name:object:", self, sel_contentSizeCategoryDidChange_, *MEMORY[0x24BDF7670], 0);

  -[ICDocCamExtractedDocumentViewController collectionTitleButton](self, "collectionTitleButton");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = objc_alloc_init(MEMORY[0x24BDF6C78]);
  objc_msgSend(v131, "addInteraction:", v132);

}

uint64_t __54__ICDocCamExtractedDocumentViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
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
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  double v41;
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
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  objc_super v72;
  _QWORD block[5];
  _QWORD v74[4];
  _QWORD v75[3];

  v3 = a3;
  v75[2] = *MEMORY[0x24BDAC8D0];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__ICDocCamExtractedDocumentViewController_viewWillAppear___block_invoke;
  block[3] = &unk_24C5B7AE0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  -[ICDocCamExtractedDocumentViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[ICDocCamExtractedDocumentViewController collectionTitleButton](self, "collectionTitleButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "extractedDocumentControllerTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:forState:", v9, 0);

  }
  -[ICDocCamExtractedDocumentViewController navigationController](self, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNavigationBarHidden:animated:", 0, 1);

  -[ICDocCamExtractedDocumentViewController navigationController](self, "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setToolbarHidden:", 1);

  -[ICDocCamExtractedDocumentViewController navigationController](self, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "navigationBar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setOpaque:", 1);

  -[ICDocCamExtractedDocumentViewController navigationController](self, "navigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "navigationBar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTranslucent:", 0);

  -[ICDocCamExtractedDocumentViewController bottomToolbar](self, "bottomToolbar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setOpaque:", 1);

  -[ICDocCamExtractedDocumentViewController bottomToolbar](self, "bottomToolbar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTranslucent:", 0);

  -[ICDocCamExtractedDocumentViewController topToolbar](self, "topToolbar");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setOpaque:", 1);

  -[ICDocCamExtractedDocumentViewController titleViewWrapper](self, "titleViewWrapper");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    v20 = objc_alloc_init(MEMORY[0x24BDF6F90]);
    -[ICDocCamExtractedDocumentViewController setTitleViewWrapper:](self, "setTitleViewWrapper:", v20);

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentViewController titleViewWrapper](self, "titleViewWrapper");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setBackgroundColor:", v21);

    -[ICDocCamExtractedDocumentViewController titleViewWrapper](self, "titleViewWrapper");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[ICDocCamExtractedDocumentViewController titleViewWrapper](self, "titleViewWrapper");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setUserInteractionEnabled:", 1);

    -[ICDocCamExtractedDocumentViewController titleViewWrapper](self, "titleViewWrapper");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v26) = 1132068864;
    objc_msgSend(v25, "setContentCompressionResistancePriority:forAxis:", 0, v26);

    v27 = (void *)MEMORY[0x24BDD1628];
    -[ICDocCamExtractedDocumentViewController titleViewWrapper](self, "titleViewWrapper");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v28, 7, 0, 0, 0, 1.0, 100.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentViewController setTitleViewWrapperWidthConstraint:](self, "setTitleViewWrapperWidthConstraint:", v29);

    -[ICDocCamExtractedDocumentViewController titleViewWrapperWidthConstraint](self, "titleViewWrapperWidthConstraint");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v31) = 1140457472;
    objc_msgSend(v30, "setPriority:", v31);

    v32 = (void *)MEMORY[0x24BDD1628];
    -[ICDocCamExtractedDocumentViewController titleViewWrapper](self, "titleViewWrapper");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v33, 8, 0, 0, 0, 1.0, 44.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentViewController setTitleViewWrapperHeightConstraint:](self, "setTitleViewWrapperHeightConstraint:", v34);

    v35 = (void *)MEMORY[0x24BDD1628];
    -[ICDocCamExtractedDocumentViewController titleViewWrapperWidthConstraint](self, "titleViewWrapperWidthConstraint");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v75[0] = v36;
    -[ICDocCamExtractedDocumentViewController titleViewWrapperHeightConstraint](self, "titleViewWrapperHeightConstraint");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v75[1] = v37;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v75, 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "activateConstraints:", v38);

    v39 = objc_alloc_init(MEMORY[0x24BDF6DD0]);
    -[ICDocCamExtractedDocumentViewController setTitleView:](self, "setTitleView:", v39);

    -[ICDocCamExtractedDocumentViewController titleView](self, "titleView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v41) = 1132068864;
    objc_msgSend(v40, "setContentCompressionResistancePriority:forAxis:", 0, v41);

    -[ICDocCamExtractedDocumentViewController titleView](self, "titleView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[ICDocCamExtractedDocumentViewController titleViewWrapper](self, "titleViewWrapper");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentViewController titleView](self, "titleView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addSubview:", v44);

    -[ICDocCamExtractedDocumentViewController titleView](self, "titleView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentViewController titleViewWrapper](self, "titleViewWrapper");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:constant:", v48, 0.0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICDocCamExtractedDocumentViewController titleView](self, "titleView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "trailingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentViewController titleViewWrapper](self, "titleViewWrapper");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "trailingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:constant:", v53, 0.0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICDocCamExtractedDocumentViewController titleView](self, "titleView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "bottomAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentViewController titleViewWrapper](self, "titleViewWrapper");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "bottomAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:constant:", v58, 0.0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICDocCamExtractedDocumentViewController titleView](self, "titleView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "topAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentViewController titleViewWrapper](self, "titleViewWrapper");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "topAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:constant:", v63, 0.0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    v65 = (void *)MEMORY[0x24BDD1628];
    v74[0] = v49;
    v74[1] = v54;
    v74[2] = v59;
    v74[3] = v64;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v74, 4);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "activateConstraints:", v66);

    -[ICDocCamExtractedDocumentViewController titleViewWrapper](self, "titleViewWrapper");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentViewController navigationItem](self, "navigationItem");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setTitleView:", v67);

  }
  -[ICDocCamExtractedDocumentViewController currentPageContentViewController](self, "currentPageContentViewController");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController showBarsForZoomablePageContentViewController:](self, "showBarsForZoomablePageContentViewController:", v69);

  -[ICDocCamExtractedDocumentViewController navigationController](self, "navigationController");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "navigationBar");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setNeedsLayout");

  v72.receiver = self;
  v72.super_class = (Class)ICDocCamExtractedDocumentViewController;
  -[ICDocCamExtractedDocumentViewController viewWillAppear:](&v72, sel_viewWillAppear_, v3);
}

void __58__ICDocCamExtractedDocumentViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "navigationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tintColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setDefaultCollectionViewTitleTintColor:", v7);
  objc_msgSend(MEMORY[0x24BDF6950], "dc_darkerAccessibilityColorForColor:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setDarkenedCollectionViewTitleTintColor:", v4);

  objc_msgSend(*(id *)(a1 + 32), "updateForAccessibilityDarkerSystemColors");
  objc_msgSend(*(id *)(a1 + 32), "collectionTitleButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsDisplay");

  objc_msgSend(*(id *)(a1 + 32), "collectionTitleButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recursivelyForceDisplayIfNeeded");

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (!v4)
  {
    -[ICDocCamExtractedDocumentViewController bottomToolbar](self, "bottomToolbar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidateIntrinsicContentSize");

    -[ICDocCamExtractedDocumentViewController bottomToolbar](self, "bottomToolbar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sizeToFit");

  }
  v7.receiver = self;
  v7.super_class = (Class)ICDocCamExtractedDocumentViewController;
  -[ICDocCamExtractedDocumentViewController viewWillLayoutSubviews](&v7, sel_viewWillLayoutSubviews);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)ICDocCamExtractedDocumentViewController;
  -[ICDocCamExtractedDocumentViewController viewDidLayoutSubviews](&v18, sel_viewDidLayoutSubviews);
  -[ICDocCamExtractedDocumentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[ICDocCamExtractedDocumentViewController previousViewSize](self, "previousViewSize");
  if (v5 != v9 || v7 != v8)
  {
    -[ICDocCamExtractedDocumentViewController setPreviousViewSize:](self, "setPreviousViewSize:", v5, v7);
    -[ICDocCamExtractedDocumentViewController updateLayout](self, "updateLayout");
    -[ICDocCamExtractedDocumentViewController updatePageIndicatorForPageIndex:](self, "updatePageIndicatorForPageIndex:", -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex"));
    -[ICDocCamExtractedDocumentViewController thumbnailCollectionViewLayout](self, "thumbnailCollectionViewLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidateLayout");

    -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layoutIfNeeded");

  }
  v13 = -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex");
  -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "docInfos");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v13 < v16)
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentViewController setCurrentThumbnailItem:animated:](self, "setCurrentThumbnailItem:animated:", objc_msgSend(v17, "item"), -[ICDocCamExtractedDocumentViewController layoutHasHappened](self, "layoutHasHappened"));

  }
  if (!-[ICDocCamExtractedDocumentViewController isAnimatingPageViewController](self, "isAnimatingPageViewController"))
    -[ICDocCamExtractedDocumentViewController updatePageViewControllerConstraints:animationBlock:completionBlock:](self, "updatePageViewControllerConstraints:animationBlock:completionBlock:", 0, 0, 0);
  -[ICDocCamExtractedDocumentViewController setLayoutHasHappened:](self, "setLayoutHasHappened:", 1);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICDocCamExtractedDocumentViewController;
  -[ICDocCamExtractedDocumentViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[ICDocCamExtractedDocumentViewController becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[ICDocCamExtractedDocumentViewController setBarsShouldBeHidden:](self, "setBarsShouldBeHidden:", 1);
  +[DCImageAnalyzerManager sharedInstance](DCImageAnalyzerManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cleanup");

  v6.receiver = self;
  v6.super_class = (Class)ICDocCamExtractedDocumentViewController;
  -[ICDocCamExtractedDocumentViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, v3);
}

- (BOOL)prefersStatusBarHidden
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;

  if (-[ICDocCamExtractedDocumentViewController barsShouldBeHidden](self, "barsShouldBeHidden"))
    return 1;
  -[ICDocCamExtractedDocumentViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "interfaceOrientation");

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "userInterfaceIdiom"))
    v9 = 1;
  else
    v9 = (unint64_t)(v7 - 3) >= 2;
  v3 = !v9;

  return v3;
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 1;
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  _BOOL8 v4;
  id v5;

  v4 = DCAccessibilityAccessibilityLargerTextSizesEnabled();
  -[ICDocCamExtractedDocumentViewController axHUDLongPressGestureRecognizer](self, "axHUDLongPressGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v4);

}

- (void)prepareForDismissal
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;

  -[ICDocCamExtractedDocumentViewController presentedViewController](self, "presentedViewController");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v5 = (void *)v2;
    v4 = objc_opt_respondsToSelector();
    v3 = v5;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v5, "prepareForDismissal");
      v3 = v5;
    }
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ICDocCamExtractedDocumentViewController;
  -[ICDocCamExtractedDocumentViewController traitCollectionDidChange:](&v11, sel_traitCollectionDidChange_, a3);
  objc_msgSend(MEMORY[0x24BDF6950], "dc_barColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBarTintColor:", v4);

  objc_msgSend(MEMORY[0x24BDF6950], "dc_barColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController topToolbar](self, "topToolbar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v7);

  objc_msgSend(MEMORY[0x24BDF6950], "dc_barColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController bottomToolbar](self, "bottomToolbar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBarTintColor:", v9);

}

- (void)updateLayout
{
  void *v2;
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  unint64_t v13;
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
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  BOOL v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  BOOL v56;
  void *v57;
  uint64_t v58;
  double v59;
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
  double v85;
  double v86;
  void *v87;
  char v88;
  double Height;
  double v90;
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
  uint64_t v112;
  uint64_t v113;
  _QWORD v114[3];
  void *v115;
  void *v116;
  _QWORD v117[3];
  void *v118;
  void *v119;
  _QWORD v120[4];
  _QWORD v121[5];
  _QWORD v122[4];
  _QWORD v123[5];
  _QWORD v124[3];
  void *v125;
  void *v126;
  const __CFString *v127;
  void *v128;
  const __CFString *v129;
  void *v130;
  _QWORD v131[7];
  _QWORD v132[9];
  void *v133;
  void *v134;
  _QWORD v135[5];
  void *v136;
  _QWORD v137[7];
  void *v138;
  _QWORD v139[3];
  CGRect v140;

  v139[1] = *MEMORY[0x24BDAC8D0];
  v112 = 0;
  v113 = 0;
  -[UIViewController dc_getEffectiveInterfaceOrientation:andEffectiveInterfaceIdiom:](self, "dc_getEffectiveInterfaceOrientation:andEffectiveInterfaceIdiom:", &v113, &v112);
  -[ICDocCamExtractedDocumentViewController filterButtonItem](self, "filterButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController rotateButtonItem](self, "rotateButtonItem");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController filterButtonItemForNavBar](self, "filterButtonItemForNavBar");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController rotateButtonItemForNavBar](self, "rotateButtonItemForNavBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController recropButtonItemForNavBar](self, "recropButtonItemForNavBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ICDocCamExtractedDocumentViewController mode](self, "mode"))
  {
    v8 = -[ICDocCamExtractedDocumentViewController mode](self, "mode");
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    -[ICDocCamExtractedDocumentViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v12 = v11;

    v13 = v113 - 1;
    if (v8 == 1)
    {
      v109 = v5;
      if (v112)
      {
        if (v13 < 2)
        {
          -[ICDocCamExtractedDocumentViewController doneButtonItem](self, "doneButtonItem");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v126 = v14;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v126, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICDocCamExtractedDocumentViewController navigationItem](self, "navigationItem");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setLeftBarButtonItems:", v15);

          if (-[ICDocCamExtractedDocumentViewController shouldDisableSharrow](self, "shouldDisableSharrow"))
          {
            v17 = (void *)MEMORY[0x24BDBD1A8];
          }
          else
          {
            -[ICDocCamExtractedDocumentViewController actionButtonItem](self, "actionButtonItem");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            v125 = v75;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v125, 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

          }
          v124[0] = v6;
          v124[1] = v111;
          v124[2] = v7;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v124, 3);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "arrayByAddingObjectsFromArray:", v76);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICDocCamExtractedDocumentViewController navigationItem](self, "navigationItem");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "setRightBarButtonItems:", v77);

          -[ICDocCamExtractedDocumentViewController topToolbar](self, "topToolbar");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "setHidden:", 1);

          -[ICDocCamExtractedDocumentViewController bottomToolbar](self, "bottomToolbar");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "setHidden:", 0);

          -[ICDocCamExtractedDocumentViewController bottomToolbar](self, "bottomToolbar");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "_setHidesShadow:", 0);

          -[ICDocCamExtractedDocumentViewController recreateThumbnailContainerWithWidth:leadingTrailingMargin:](self, "recreateThumbnailContainerWithWidth:leadingTrailingMargin:", v12, 60.0);
          if (-[ICDocCamExtractedDocumentViewController cameraRestricted](self, "cameraRestricted"))
          {
            v122[0] = v9;
            -[ICDocCamExtractedDocumentViewController thumbnailContainerViewItem](self, "thumbnailContainerViewItem");
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            v122[1] = v3;
            v122[2] = v9;
            -[ICDocCamExtractedDocumentViewController trashButtonItem](self, "trashButtonItem");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v122[3] = v73;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v122, 4);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICDocCamExtractedDocumentViewController bottomToolbar](self, "bottomToolbar");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "setItems:", v74);
          }
          else
          {
            -[ICDocCamExtractedDocumentViewController addButtonItem](self, "addButtonItem");
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            v123[0] = v3;
            v123[1] = v9;
            -[ICDocCamExtractedDocumentViewController thumbnailContainerViewItem](self, "thumbnailContainerViewItem");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v123[2] = v73;
            v123[3] = v9;
            -[ICDocCamExtractedDocumentViewController trashButtonItem](self, "trashButtonItem");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            v123[4] = v74;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v123, 5);
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICDocCamExtractedDocumentViewController bottomToolbar](self, "bottomToolbar");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "setItems:", v82);

          }
LABEL_40:

LABEL_41:
          -[ICDocCamExtractedDocumentViewController updateTitleView](self, "updateTitleView");

          v5 = v109;
          goto LABEL_42;
        }
        *(double *)&v58 = 60.0;
      }
      else
      {
        if (v13 < 2)
        {
          -[ICDocCamExtractedDocumentViewController doneButtonItem](self, "doneButtonItem");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v134 = v53;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v134, 1);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICDocCamExtractedDocumentViewController navigationItem](self, "navigationItem");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "setLeftBarButtonItems:", v54);

          v56 = -[ICDocCamExtractedDocumentViewController shouldDisableSharrow](self, "shouldDisableSharrow");
          if (v56)
          {
            v57 = (void *)MEMORY[0x24BDBD1A8];
          }
          else
          {
            -[ICDocCamExtractedDocumentViewController actionButtonItem](self, "actionButtonItem");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v133 = v55;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v133, 1);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
          }
          -[ICDocCamExtractedDocumentViewController navigationItem](self, "navigationItem");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "setRightBarButtonItems:", v57);

          if (!v56)
          {

          }
          if (-[ICDocCamExtractedDocumentViewController cameraRestricted](self, "cameraRestricted"))
          {
            -[ICDocCamExtractedDocumentViewController recropButtonItem](self, "recropButtonItem");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            v131[0] = v93;
            v131[1] = v9;
            v131[2] = v5;
            v131[3] = v9;
            v131[4] = v110;
            v131[5] = v9;
            -[ICDocCamExtractedDocumentViewController trashButtonItem](self, "trashButtonItem");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            v131[6] = v94;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v131, 7);
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICDocCamExtractedDocumentViewController bottomToolbar](self, "bottomToolbar");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v96, "setItems:", v95);
          }
          else
          {
            -[ICDocCamExtractedDocumentViewController addButtonItem](self, "addButtonItem");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            v132[0] = v93;
            v132[1] = v9;
            -[ICDocCamExtractedDocumentViewController recropButtonItem](self, "recropButtonItem");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            v132[2] = v94;
            v132[3] = v9;
            v132[4] = v5;
            v132[5] = v9;
            v132[6] = v110;
            v132[7] = v9;
            -[ICDocCamExtractedDocumentViewController trashButtonItem](self, "trashButtonItem");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            v132[8] = v95;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v132, 9);
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICDocCamExtractedDocumentViewController bottomToolbar](self, "bottomToolbar");
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v97, "setItems:", v96);

          }
          -[ICDocCamExtractedDocumentViewController recreateThumbnailContainerWithWidth:leadingTrailingMargin:](self, "recreateThumbnailContainerWithWidth:leadingTrailingMargin:", v12, 0.0);
          -[ICDocCamExtractedDocumentViewController topToolbar](self, "topToolbar");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "setHidden:", 0);

          -[ICDocCamExtractedDocumentViewController topToolbar](self, "topToolbar");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICDocCamExtractedDocumentViewController thumbnailContainerView](self, "thumbnailContainerView");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "addSubview:", v100);

          v101 = (void *)MEMORY[0x24BDD1628];
          v129 = CFSTR("childView");
          -[ICDocCamExtractedDocumentViewController thumbnailContainerView](self, "thumbnailContainerView");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          v130 = v102;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v130, &v129, 1);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[childView]|"), 0, 0, v103);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v104 = (void *)MEMORY[0x24BDD1628];
          v127 = CFSTR("childView");
          -[ICDocCamExtractedDocumentViewController thumbnailContainerView](self, "thumbnailContainerView");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          v128 = v105;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v128, &v127, 1);
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[childView]|"), 0, 0, v106);
          v3 = (void *)objc_claimAutoreleasedReturnValue();

          -[ICDocCamExtractedDocumentViewController topToolbar](self, "topToolbar");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v107, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

          objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v17);
          objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v3);
          -[ICDocCamExtractedDocumentViewController bottomToolbar](self, "bottomToolbar");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "setHidden:", 0);

          -[ICDocCamExtractedDocumentViewController bottomToolbar](self, "bottomToolbar");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "_setHidesShadow:", 1);
          goto LABEL_41;
        }
        *(double *)&v58 = 56.0;
      }
      v59 = *(double *)&v58;
      -[ICDocCamExtractedDocumentViewController topToolbar](self, "topToolbar");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "setHidden:", 1);

      -[ICDocCamExtractedDocumentViewController bottomToolbar](self, "bottomToolbar");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setHidden:", 0);

      -[ICDocCamExtractedDocumentViewController bottomToolbar](self, "bottomToolbar");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "_setHidesShadow:", 0);

      -[ICDocCamExtractedDocumentViewController recreateThumbnailContainerWithWidth:leadingTrailingMargin:](self, "recreateThumbnailContainerWithWidth:leadingTrailingMargin:", v12, v59);
      if (-[ICDocCamExtractedDocumentViewController cameraRestricted](self, "cameraRestricted"))
      {
        v120[0] = v9;
        -[ICDocCamExtractedDocumentViewController thumbnailContainerViewItem](self, "thumbnailContainerViewItem");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v120[1] = v63;
        v120[2] = v9;
        -[ICDocCamExtractedDocumentViewController trashButtonItem](self, "trashButtonItem");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v120[3] = v64;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v120, 4);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICDocCamExtractedDocumentViewController bottomToolbar](self, "bottomToolbar");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "setItems:", v65);
      }
      else
      {
        -[ICDocCamExtractedDocumentViewController addButtonItem](self, "addButtonItem");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v121[0] = v63;
        v121[1] = v9;
        -[ICDocCamExtractedDocumentViewController thumbnailContainerViewItem](self, "thumbnailContainerViewItem");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v121[2] = v64;
        v121[3] = v9;
        -[ICDocCamExtractedDocumentViewController trashButtonItem](self, "trashButtonItem");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v121[4] = v65;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v121, 5);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICDocCamExtractedDocumentViewController bottomToolbar](self, "bottomToolbar");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "setItems:", v66);

      }
      -[ICDocCamExtractedDocumentViewController bottomToolbar](self, "bottomToolbar");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setHidden:", 0);

      -[ICDocCamExtractedDocumentViewController doneButtonItem](self, "doneButtonItem");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = v69;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v119, 1);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamExtractedDocumentViewController navigationItem](self, "navigationItem");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "setLeftBarButtonItems:", v70);

      if (-[ICDocCamExtractedDocumentViewController shouldDisableSharrow](self, "shouldDisableSharrow"))
      {
        v17 = (void *)MEMORY[0x24BDBD1A8];
      }
      else
      {
        -[ICDocCamExtractedDocumentViewController actionButtonItem](self, "actionButtonItem");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v118 = v72;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v118, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v117[0] = v6;
      v117[1] = v111;
      v117[2] = v7;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v117, 3);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "arrayByAddingObjectsFromArray:", v3);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamExtractedDocumentViewController navigationItem](self, "navigationItem");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "setRightBarButtonItems:", v73);
      goto LABEL_40;
    }
    v41 = 56.0;
    if (v13 < 2)
      v41 = 0.0;
    v42 = 60.0;
    if (!v112)
      v42 = v41;
    -[ICDocCamExtractedDocumentViewController recreateThumbnailContainerWithWidth:leadingTrailingMargin:](self, "recreateThumbnailContainerWithWidth:leadingTrailingMargin:", v12, v42);
    -[ICDocCamExtractedDocumentViewController doneButtonItem](self, "doneButtonItem");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = v43;
    v3 = (void *)0x24BDBC000;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v116, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentViewController navigationItem](self, "navigationItem");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setLeftBarButtonItems:", v44);

    v46 = -[ICDocCamExtractedDocumentViewController shouldDisableSharrow](self, "shouldDisableSharrow");
    if (v46)
    {
      v47 = (void *)MEMORY[0x24BDBD1A8];
    }
    else
    {
      -[ICDocCamExtractedDocumentViewController actionButtonItem](self, "actionButtonItem");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = v2;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v115, 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[ICDocCamExtractedDocumentViewController navigationItem](self, "navigationItem");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setRightBarButtonItems:", v47);

    if (!v46)
    {

    }
    v114[0] = v9;
    -[ICDocCamExtractedDocumentViewController thumbnailContainerViewItem](self, "thumbnailContainerViewItem");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v114[1] = v49;
    v114[2] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v114, 3);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentViewController bottomToolbar](self, "bottomToolbar");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setItems:", v50);

    -[ICDocCamExtractedDocumentViewController topToolbar](self, "topToolbar");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setHidden:", 1);

  }
  else
  {
    if (!v112)
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
      -[ICDocCamExtractedDocumentViewController doneButtonItem](self, "doneButtonItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v139[0] = v19;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v139, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamExtractedDocumentViewController navigationItem](self, "navigationItem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setLeftBarButtonItems:", v20);

      -[ICDocCamExtractedDocumentViewController retakeButtonItem](self, "retakeButtonItem");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v138 = v22;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v138, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamExtractedDocumentViewController navigationItem](self, "navigationItem");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setRightBarButtonItems:", v23);

      -[ICDocCamExtractedDocumentViewController recropButtonItem](self, "recropButtonItem");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v137[0] = v25;
      v137[1] = v18;
      v137[2] = v5;
      v137[3] = v18;
      v137[4] = v110;
      v137[5] = v18;
      -[ICDocCamExtractedDocumentViewController trashButtonItem](self, "trashButtonItem");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v137[6] = v26;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v137, 7);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamExtractedDocumentViewController bottomToolbar](self, "bottomToolbar");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setItems:", v27);

      -[ICDocCamExtractedDocumentViewController topToolbar](self, "topToolbar");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setHidden:", 1);

      -[ICDocCamExtractedDocumentViewController bottomToolbar](self, "bottomToolbar");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setHidden:", 0);

      -[ICDocCamExtractedDocumentViewController filterViewController](self, "filterViewController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamExtractedDocumentViewController bottomToolbar](self, "bottomToolbar");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "_setHidesShadow:", v30 != 0);

    }
    if ((DCDebugInterfaceEnabled() & 1) != 0 || v112 == 1)
    {
      -[ICDocCamExtractedDocumentViewController topToolbar](self, "topToolbar");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setHidden:", 1);

      -[ICDocCamExtractedDocumentViewController bottomToolbar](self, "bottomToolbar");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setHidden:", 1);

      -[ICDocCamExtractedDocumentViewController doneButtonItem](self, "doneButtonItem");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v136 = v34;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v136, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamExtractedDocumentViewController navigationItem](self, "navigationItem");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setLeftBarButtonItems:", v35);

      -[ICDocCamExtractedDocumentViewController retakeButtonItem](self, "retakeButtonItem");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v135[0] = v37;
      -[ICDocCamExtractedDocumentViewController trashButtonItemForNavBar](self, "trashButtonItemForNavBar");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v135[1] = v38;
      v135[2] = v6;
      v135[3] = v111;
      v135[4] = v7;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v135, 5);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamExtractedDocumentViewController navigationItem](self, "navigationItem");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setRightBarButtonItems:", v39);

    }
    -[ICDocCamExtractedDocumentViewController updateTitleView](self, "updateTitleView");
  }
LABEL_42:
  -[ICDocCamExtractedDocumentViewController view](self, "view");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "safeAreaInsets");
  v86 = v85;
  -[ICDocCamExtractedDocumentViewController bottomToolbar](self, "bottomToolbar");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend(v87, "isHidden");
  if ((v88 & 1) != 0)
  {
    Height = 0.0;
  }
  else
  {
    -[ICDocCamExtractedDocumentViewController bottomToolbar](self, "bottomToolbar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    Height = CGRectGetHeight(v140);
  }
  v90 = v86 + Height;
  -[ICDocCamExtractedDocumentViewController filterViewController](self, "filterViewController");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setBottomContentInset:", v90);

  if ((v88 & 1) == 0)
}

- (void)updateFilterViewLayoutIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  -[UIViewController dc_getEffectiveInterfaceOrientation:andEffectiveInterfaceIdiom:](self, "dc_getEffectiveInterfaceOrientation:andEffectiveInterfaceIdiom:", &v9, &v8);
  if (!v8)
  {
    -[ICDocCamExtractedDocumentViewController filterViewController](self, "filterViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[ICDocCamExtractedDocumentViewController filterViewController](self, "filterViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setNeedsLayout");

      -[ICDocCamExtractedDocumentViewController filterViewController](self, "filterViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "layoutIfNeeded");

    }
  }
}

- (void)updateTitleView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  int v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  uint64_t v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
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
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  double v72;
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
  uint64_t v101;
  _QWORD v102[6];
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _QWORD v107[4];
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x24BDAC8D0];
  -[ICDocCamExtractedDocumentViewController titleViewWrapper](self, "titleViewWrapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return;
  -[ICDocCamExtractedDocumentViewController updateForAccessibilityDarkerSystemColors](self, "updateForAccessibilityDarkerSystemColors");
  -[ICDocCamExtractedDocumentViewController titleView](self, "titleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  -[ICDocCamExtractedDocumentViewController titleView](self, "titleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrangedSubviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v103, v108, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v104;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v104 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * i);
        -[ICDocCamExtractedDocumentViewController titleView](self, "titleView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeArrangedSubview:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v103, v108, 16);
    }
    while (v9);
  }

  v14 = -[ICDocCamExtractedDocumentViewController documentCount](self, "documentCount");
  v15 = -[ICDocCamExtractedDocumentViewController mode](self, "mode");
  if (!v15)
  {
    if (v14 < 2)
    {
      v29 = 1;
      v38 = 0.0;
      v39 = 0.0;
      goto LABEL_25;
    }
    if ((DCDebugInterfaceEnabled() & 1) != 0
      || (objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"),
          v40 = (void *)objc_claimAutoreleasedReturnValue(),
          v41 = objc_msgSend(v40, "userInterfaceIdiom"),
          v40,
          v41 == 1))
    {
      v42 = (void *)MEMORY[0x24BDF6A70];
      v43 = *MEMORY[0x24BDF7880];
      v44 = 19.0;
    }
    else
    {
      -[ICDocCamExtractedDocumentViewController view](self, "view");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "window");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "windowScene");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = objc_msgSend(v100, "interfaceOrientation");

      v42 = (void *)MEMORY[0x24BDF6A70];
      if ((unint64_t)(v101 - 1) > 1)
      {
        v43 = *MEMORY[0x24BDF7880];
        v44 = 14.0;
      }
      else
      {
        v43 = *MEMORY[0x24BDF7888];
        v44 = 16.0;
      }
    }
    objc_msgSend(v42, "systemFontOfSize:weight:", v44, v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentViewController pageIndexLabel](self, "pageIndexLabel");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setFont:", v45);

    v29 = 1;
    v38 = 0.0;
LABEL_23:
    -[ICDocCamExtractedDocumentViewController pageIndexLabel](self, "pageIndexLabel");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "sizeToFit");

    -[ICDocCamExtractedDocumentViewController pageIndexLabel](self, "pageIndexLabel");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "size");
    v39 = v49;

    goto LABEL_25;
  }
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "userInterfaceIdiom");

  if (v17)
    goto LABEL_14;
  -[ICDocCamExtractedDocumentViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "window");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "windowScene");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "interfaceOrientation");

  if ((unint64_t)(v21 - 3) > 1)
  {
LABEL_14:
    v25 = (void *)MEMORY[0x24BDF6A70];
    v30 = *MEMORY[0x24BDF7880];
    v31 = 16.0;
  }
  else
  {
    -[ICDocCamExtractedDocumentViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "window");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "dc_requiresCompactLandscapeIcons");

    v25 = (void *)MEMORY[0x24BDF6A70];
    v26 = *MEMORY[0x24BDF7880];
    if (v24)
    {
      objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 14.0, *MEMORY[0x24BDF7880]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 14.0, v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      goto LABEL_16;
    }
    v31 = 16.0;
    v30 = *MEMORY[0x24BDF7880];
  }
  objc_msgSend(v25, "systemFontOfSize:weight:", v31, v30);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 12.0, *MEMORY[0x24BDF7888]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 1;
LABEL_16:
  -[ICDocCamExtractedDocumentViewController pageIndexLabel](self, "pageIndexLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFont:", v28);

  -[ICDocCamExtractedDocumentViewController collectionTitleButton](self, "collectionTitleButton");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "titleLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setFont:", v27);

  -[ICDocCamExtractedDocumentViewController collectionTitleButton](self, "collectionTitleButton");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "sizeToFit");

  -[ICDocCamExtractedDocumentViewController collectionTitleButton](self, "collectionTitleButton");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "size");
  v38 = v37;

  v39 = 0.0;
  if (v14 > 1)
    goto LABEL_23;
LABEL_25:
  -[ICDocCamExtractedDocumentViewController titleView](self, "titleView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setDistribution:", 0);

  -[ICDocCamExtractedDocumentViewController titleView](self, "titleView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v51;
  if (v29)
  {
    objc_msgSend(v51, "setAxis:", 1);

    -[ICDocCamExtractedDocumentViewController titleView](self, "titleView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setDistribution:", 1);

    -[ICDocCamExtractedDocumentViewController titleView](self, "titleView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setSpacing:", -16.0);

    if (v15)
    {
      -[ICDocCamExtractedDocumentViewController titleView](self, "titleView");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamExtractedDocumentViewController collectionTitleButton](self, "collectionTitleButton");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "addArrangedSubview:", v56);

    }
    if (v14 >= 2)
    {
      -[ICDocCamExtractedDocumentViewController titleView](self, "titleView");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamExtractedDocumentViewController pageIndexLabel](self, "pageIndexLabel");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "addArrangedSubview:", v58);

      -[ICDocCamExtractedDocumentViewController titleView](self, "titleView");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setSpacing:", -6.0);

    }
    goto LABEL_41;
  }
  objc_msgSend(v51, "setAxis:", 0);

  -[ICDocCamExtractedDocumentViewController titleView](self, "titleView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setSpacing:", 4.0);

  if (objc_msgSend(MEMORY[0x24BDF6750], "dc_isRTL"))
  {
    if (v14 >= 2)
    {
      -[ICDocCamExtractedDocumentViewController titleView](self, "titleView");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamExtractedDocumentViewController pageIndexLabel](self, "pageIndexLabel");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "addArrangedSubview:", v62);

    }
    if (!v15)
      goto LABEL_40;
    -[ICDocCamExtractedDocumentViewController titleView](self, "titleView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentViewController collectionTitleButton](self, "collectionTitleButton");
    v64 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v15)
    {
      -[ICDocCamExtractedDocumentViewController titleView](self, "titleView");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamExtractedDocumentViewController collectionTitleButton](self, "collectionTitleButton");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "addArrangedSubview:", v66);

    }
    if (v14 < 2)
      goto LABEL_40;
    -[ICDocCamExtractedDocumentViewController titleView](self, "titleView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentViewController pageIndexLabel](self, "pageIndexLabel");
    v64 = objc_claimAutoreleasedReturnValue();
  }
  v67 = (void *)v64;
  objc_msgSend(v63, "addArrangedSubview:", v64);

LABEL_40:
  v38 = v38 + v39;
LABEL_41:
  -[ICDocCamExtractedDocumentViewController titleViewWrapperWidthConstraint](self, "titleViewWrapperWidthConstraint");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constant");
  v70 = v69;

  v71 = v38 + 8.0;
  if (v70 >= v38 + 8.0)
    v72 = v70;
  else
    v72 = v38 + 8.0;
  -[ICDocCamExtractedDocumentViewController titleViewWrapperWidthConstraint](self, "titleViewWrapperWidthConstraint");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setConstant:", v72);

  -[ICDocCamExtractedDocumentViewController titleViewWrapper](self, "titleViewWrapper");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController titleView](self, "titleView");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "addSubview:", v75);

  -[ICDocCamExtractedDocumentViewController titleView](self, "titleView");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "leadingAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController titleViewWrapper](self, "titleViewWrapper");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "leadingAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "constraintEqualToAnchor:constant:", v79, 0.0);
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICDocCamExtractedDocumentViewController titleView](self, "titleView");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "trailingAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController titleViewWrapper](self, "titleViewWrapper");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "trailingAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "constraintEqualToAnchor:constant:", v84, 0.0);
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICDocCamExtractedDocumentViewController titleView](self, "titleView");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "bottomAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController titleViewWrapper](self, "titleViewWrapper");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "bottomAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "constraintEqualToAnchor:constant:", v89, 0.0);
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICDocCamExtractedDocumentViewController titleView](self, "titleView");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "topAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController titleViewWrapper](self, "titleViewWrapper");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "topAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "constraintEqualToAnchor:constant:", v94, 0.0);
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  v96 = (void *)MEMORY[0x24BDD1628];
  v107[0] = v80;
  v107[1] = v85;
  v107[2] = v90;
  v107[3] = v95;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v107, 4);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "activateConstraints:", v97);

  if (v71 != v72)
  {
    v102[0] = MEMORY[0x24BDAC760];
    v102[1] = 3221225472;
    v102[2] = __58__ICDocCamExtractedDocumentViewController_updateTitleView__block_invoke;
    v102[3] = &unk_24C5B7B28;
    v102[4] = self;
    *(double *)&v102[5] = v71;
    dc_dispatchMainAfterDelay(v102, 0.1);
  }

}

uint64_t __58__ICDocCamExtractedDocumentViewController_updateTitleView__block_invoke(uint64_t a1)
{
  _QWORD v2[6];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __58__ICDocCamExtractedDocumentViewController_updateTitleView__block_invoke_2;
  v2[3] = &unk_24C5B7B28;
  v2[4] = *(_QWORD *)(a1 + 32);
  v2[5] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v2, 0.2);
}

void __58__ICDocCamExtractedDocumentViewController_updateTitleView__block_invoke_2(uint64_t a1)
{
  double v1;
  id v2;

  v1 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "titleViewWrapperWidthConstraint");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setConstant:", v1);

}

- (double)thumbnailToolbarHeight
{
  BOOL v4;
  double result;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v9 = 0;
  v10 = 0;
  -[UIViewController dc_getEffectiveInterfaceOrientation:andEffectiveInterfaceIdiom:](self, "dc_getEffectiveInterfaceOrientation:andEffectiveInterfaceIdiom:", &v10, &v9);
  if ((unint64_t)(v10 - 3) <= 1 && v9 == 0)
  {
    -[ICDocCamExtractedDocumentViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "dc_requiresCompactLandscapeIcons");

    result = 44.0;
    if (v8)
      return 32.0;
  }
  else
  {
    if (v9)
      v4 = 1;
    else
      v4 = (unint64_t)(v10 - 1) >= 2;
    result = 44.0;
    if (!v4)
      return 39.0;
  }
  return result;
}

- (void)recreateThumbnailContainerWithWidth:(double)a3 leadingTrailingMargin:(double)a4
{
  void *v7;
  ICDocCamExtractedThumbnailContainerView *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  CGAffineTransform v47;
  CGAffineTransform v48;
  _QWORD v49[6];

  v49[4] = *MEMORY[0x24BDAC8D0];
  -[ICDocCamExtractedDocumentViewController thumbnailContainerView](self, "thumbnailContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");

  -[ICDocCamExtractedDocumentViewController setThumbnailContainerViewItem:](self, "setThumbnailContainerViewItem:", 0);
  -[ICDocCamExtractedDocumentViewController setThumbnailContainerView:](self, "setThumbnailContainerView:", 0);
  -[ICDocCamExtractedDocumentViewController setThumbnailCollectionViewController:](self, "setThumbnailCollectionViewController:", 0);
  v8 = objc_alloc_init(ICDocCamExtractedThumbnailContainerView);
  -[ICDocCamExtractedDocumentViewController setThumbnailContainerView:](self, "setThumbnailContainerView:", v8);

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController thumbnailContainerView](self, "thumbnailContainerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v9);

  -[ICDocCamExtractedDocumentViewController thumbnailContainerView](self, "thumbnailContainerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegate:", self);

  v12 = objc_alloc(MEMORY[0x24BDF6860]);
  -[ICDocCamExtractedDocumentViewController thumbnailContainerView](self, "thumbnailContainerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithCustomView:", v13);
  -[ICDocCamExtractedDocumentViewController setThumbnailContainerViewItem:](self, "setThumbnailContainerViewItem:", v14);

  if (objc_msgSend(MEMORY[0x24BDF6750], "dc_isRTL"))
  {
    CGAffineTransformMakeScale(&v48, -1.0, 1.0);
    -[ICDocCamExtractedDocumentViewController thumbnailContainerView](self, "thumbnailContainerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v48;
    objc_msgSend(v15, "setTransform:", &v47);

  }
  -[ICDocCamExtractedDocumentViewController thumbnailContainerViewItem](self, "thumbnailContainerViewItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWidth:", a3 + a4 * -2.0);

  -[ICDocCamExtractedDocumentViewController thumbnailToolbarHeight](self, "thumbnailToolbarHeight");
  v18 = v17;
  -[ICDocCamExtractedDocumentViewController thumbnailContainerViewItem](self, "thumbnailContainerViewItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "width");
  v21 = v20;
  -[ICDocCamExtractedDocumentViewController thumbnailContainerView](self, "thumbnailContainerView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", 0.0, 0.0, v21, v18);

  -[ICDocCamExtractedDocumentViewController thumbnailContainerView](self, "thumbnailContainerView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "heightAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToConstant:", v18);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setActive:", 1);

  -[ICDocCamExtractedDocumentViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "layoutIfNeeded");

  -[ICDocCamExtractedDocumentViewController setupThumbnailViewController](self, "setupThumbnailViewController");
  objc_msgSend(MEMORY[0x24BDE56B8], "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController thumbnailContainerView](self, "thumbnailContainerView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bounds");
  objc_msgSend(v27, "setFrame:");

  v29 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
  v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v31 = objc_msgSend(v30, "CGColor");
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
  v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v33 = objc_msgSend(v32, "CGColor");
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
  v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v35 = objc_msgSend(v34, "CGColor");
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
  v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v29, "arrayWithObjects:", v31, v33, v35, objc_msgSend(v36, "CGColor"), 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setColors:", v37);

  v49[0] = &unk_24C5D8070;
  v38 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v27, "frame");
  objc_msgSend(v38, "numberWithDouble:", 12.0 / v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v40;
  v41 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v27, "frame");
  objc_msgSend(v41, "numberWithDouble:", 1.0 - 12.0 / v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v43;
  v49[3] = &unk_24C5D8088;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 4);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setLocations:", v44);

  objc_msgSend(v27, "setStartPoint:", 0.0, 0.5);
  objc_msgSend(v27, "setEndPoint:", 1.0, 0.5);
  -[ICDocCamExtractedDocumentViewController thumbnailContainerView](self, "thumbnailContainerView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "layer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setMask:", v27);

}

- (void)setupThumbnailViewController
{
  void *v3;
  id v4;
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
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  -[ICDocCamExtractedDocumentViewController thumbnailCollectionViewController](self, "thumbnailCollectionViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDF68F0]);
    -[ICDocCamExtractedDocumentViewController setThumbnailCollectionViewController:](self, "setThumbnailCollectionViewController:", v4);

    -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentViewController thumbnailCollectionViewController](self, "thumbnailCollectionViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCollectionView:", v5);

    -[ICDocCamExtractedDocumentViewController thumbnailCollectionViewController](self, "thumbnailCollectionViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentViewController addChildViewController:](self, "addChildViewController:", v7);

    -[ICDocCamExtractedDocumentViewController thumbnailContainerView](self, "thumbnailContainerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v9);

    -[ICDocCamExtractedDocumentViewController thumbnailCollectionViewController](self, "thumbnailCollectionViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "didMoveToParentViewController:", self);

    v11 = (void *)MEMORY[0x24BDD1628];
    v27 = CFSTR("childView");
    -[ICDocCamExtractedDocumentViewController thumbnailCollectionViewController](self, "thumbnailCollectionViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[childView]|"), 0, 0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x24BDD1628];
    v25 = CFSTR("childView");
    -[ICDocCamExtractedDocumentViewController thumbnailCollectionViewController](self, "thumbnailCollectionViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "collectionView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[childView]|"), 0, 0, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICDocCamExtractedDocumentViewController thumbnailCollectionViewController](self, "thumbnailCollectionViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "collectionView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[ICDocCamExtractedDocumentViewController thumbnailCollectionViewController](self, "thumbnailCollectionViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "collectionView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setContentInsetAdjustmentBehavior:", 2);

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v15);
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v20);

  }
  -[ICDocCamExtractedDocumentViewController setCurrentThumbnailItem:animated:](self, "setCurrentThumbnailItem:animated:", -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex"), 0);
}

- (CGSize)frameSizeForImageSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[ICDocCamExtractedDocumentViewController thumbnailCollectionViewLayout](self, "thumbnailCollectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemSizeForImageSize:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)setImage:(id)a3 forCell:(id)a4 useResizedImage:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  id v25;
  id v26;

  v5 = a5;
  v26 = a4;
  v8 = a3;
  -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");

  -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentInset");

  if (v8 && v5)
  {
    objc_msgSend(v8, "size");
    v12 = v11;
    v14 = v13;
    -[ICDocCamExtractedDocumentViewController frameSizeForImageSize:](self, "frameSizeForImageSize:");
    v16 = v15;
    v18 = v17;
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "scale");
    v21 = v20;

    v22 = fmax(v21, 1.0);
    +[ICDocCamUtilities aspectFillSize:targetSize:](ICDocCamUtilities, "aspectFillSize:targetSize:", v12, v14, v16 * v22, v18 * v22);
    +[ICDocCamUtilities resizedImage:newSize:interpolationQuality:](ICDocCamUtilities, "resizedImage:newSize:interpolationQuality:", v8, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "imageView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v24;
    v25 = v23;
  }
  else
  {
    objc_msgSend(v26, "imageView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v24;
    v25 = v8;
  }
  objc_msgSend(v24, "setImage:", v25);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  objc_super v11;

  height = a3.height;
  width = a3.width;
  v11.receiver = self;
  v11.super_class = (Class)ICDocCamExtractedDocumentViewController;
  v7 = a4;
  -[ICDocCamExtractedDocumentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[ICDocCamExtractedDocumentViewController thumbnailCollectionViewLayout](self, "thumbnailCollectionViewLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIsUndergoingOrientationChange:", 1);

  v9[4] = self;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __94__ICDocCamExtractedDocumentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v10[3] = &unk_24C5B7B50;
  v10[4] = self;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __94__ICDocCamExtractedDocumentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v9[3] = &unk_24C5B7B50;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v10, v9);

}

uint64_t __94__ICDocCamExtractedDocumentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "filterViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  if (v2)
    return objc_msgSend(v3, "selectFilterButtons");
  else
    return objc_msgSend(v3, "deselectFilterButtons");
}

void __94__ICDocCamExtractedDocumentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  _QWORD v4[4];
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "showViewControllerAtIndex:animated:", objc_msgSend(*(id *)(a1 + 32), "presentationPageIndex"), 0);
  objc_msgSend(*(id *)(a1 + 32), "updateLayout");
  objc_msgSend(*(id *)(a1 + 32), "thumbnailCollectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __94__ICDocCamExtractedDocumentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
  v4[3] = &unk_24C5B7AE0;
  v5 = *(_QWORD *)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __94__ICDocCamExtractedDocumentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4;
  v3[3] = &unk_24C5B7B78;
  v3[4] = v5;
  objc_msgSend(v2, "performBatchUpdates:completion:", v4, v3);

}

void __94__ICDocCamExtractedDocumentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "thumbnailCollectionViewLayout");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidateLayout");

}

void __94__ICDocCamExtractedDocumentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setCurrentThumbnailItem:animated:", objc_msgSend(*(id *)(a1 + 32), "presentationPageIndex"), 1);
  objc_msgSend(*(id *)(a1 + 32), "thumbnailCollectionViewLayout");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIsUndergoingOrientationChange:", 0);

}

- (int64_t)orientationRotated90DegreesFromOrientation:(int64_t)a3
{
  if ((unint64_t)a3 >= 4)
    -[ICDocCamExtractedDocumentViewController orientationRotated90DegreesFromOrientation:].cold.1();
  return qword_20CF1AFE0[a3];
}

- (void)updatePageViewControllerConstraints:(BOOL)a3 animationBlock:(id)a4 completionBlock:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double MaxY;
  void *v14;
  double Height;
  double v16;
  double v17;
  void *v18;
  char v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;
  uint64_t v38;
  uint64_t v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  -[ICDocCamExtractedDocumentViewController filterViewController](self, "filterViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ICDocCamExtractedDocumentViewController navigationController](self, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "navigationBar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    MaxY = CGRectGetMaxY(v40);

    v38 = 0;
    v39 = 0;
    -[UIViewController dc_getEffectiveInterfaceOrientation:andEffectiveInterfaceIdiom:](self, "dc_getEffectiveInterfaceOrientation:andEffectiveInterfaceIdiom:", &v39, &v38);
    if ((DCDebugInterfaceEnabled() & 1) != 0 || v38 == 1 || (unint64_t)(v39 - 3) <= 1)
    {
      -[ICDocCamExtractedDocumentViewController filterViewController](self, "filterViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "contentSize");
      Height = 0.0;
      v17 = v16 + 0.0;

      -[ICDocCamExtractedDocumentViewController bottomToolbar](self, "bottomToolbar");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isHidden");

      if ((v19 & 1) != 0)
        goto LABEL_10;
      -[ICDocCamExtractedDocumentViewController bottomToolbar](self, "bottomToolbar");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "frame");
      Height = CGRectGetHeight(v41);
    }
    else
    {
      -[ICDocCamExtractedDocumentViewController view](self, "view");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "safeAreaInsets");
      v22 = v21;
      -[ICDocCamExtractedDocumentViewController filterViewController](self, "filterViewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "contentSize");
      v25 = v22 + v24;
      -[ICDocCamExtractedDocumentViewController bottomToolbar](self, "bottomToolbar");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "frame");
      Height = v25 + CGRectGetHeight(v42);

      v17 = 0.0;
    }

  }
  else
  {
    MaxY = 0.0;
    Height = 0.0;
    v17 = 0.0;
  }
LABEL_10:
  if (-[ICDocCamExtractedDocumentViewController adjustPageViewControllerForMarkup](self, "adjustPageViewControllerForMarkup"))
  {
    -[UIViewController dc_safeAreaDistanceFromTop](self, "dc_safeAreaDistanceFromTop");
    MaxY = v27;
    Height = 35.0;
  }
  -[ICDocCamExtractedDocumentViewController pageViewBottomConstraint](self, "pageViewBottomConstraint");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setConstant:", -Height);

  -[ICDocCamExtractedDocumentViewController pageViewTopConstraint](self, "pageViewTopConstraint");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setConstant:", MaxY);

  -[ICDocCamExtractedDocumentViewController pageViewLeadingConstraint](self, "pageViewLeadingConstraint");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setConstant:", 0.0);

  -[ICDocCamExtractedDocumentViewController pageViewTrailingConstraint](self, "pageViewTrailingConstraint");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setConstant:", -v17);

  if (v6)
  {
    -[ICDocCamExtractedDocumentViewController setIsAnimatingPageViewController:](self, "setIsAnimatingPageViewController:", 1);
    v32 = MEMORY[0x24BDAC760];
    v33 = (void *)MEMORY[0x24BDF6F90];
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __110__ICDocCamExtractedDocumentViewController_updatePageViewControllerConstraints_animationBlock_completionBlock___block_invoke;
    v36[3] = &unk_24C5B7BA0;
    v36[4] = self;
    v37 = v8;
    v34[0] = v32;
    v34[1] = 3221225472;
    v34[2] = __110__ICDocCamExtractedDocumentViewController_updatePageViewControllerConstraints_animationBlock_completionBlock___block_invoke_2;
    v34[3] = &unk_24C5B7BC8;
    v34[4] = self;
    v35 = v9;
    objc_msgSend(v33, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v36, v34, 0.5, 0.0, 1.0, 0.0);

  }
}

uint64_t __110__ICDocCamExtractedDocumentViewController_updatePageViewControllerConstraints_animationBlock_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "currentPageContentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetZoom");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __110__ICDocCamExtractedDocumentViewController_updatePageViewControllerConstraints_animationBlock_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setIsAnimatingPageViewController:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)showFilterViewIfNecessary
{
  void *v2;
  void *v4;
  ICDocCamFilterViewController *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  char v10;
  double Height;
  double v12;
  void *v13;
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
  double v36;
  uint64_t v37;
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[5];
  CGRect v42;

  -[ICDocCamExtractedDocumentViewController filterViewController](self, "filterViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc_init(ICDocCamFilterViewController);
    -[ICDocCamExtractedDocumentViewController setFilterViewController:](self, "setFilterViewController:", v5);

    -[ICDocCamExtractedDocumentViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeAreaInsets");
    v8 = v7;
    -[ICDocCamExtractedDocumentViewController bottomToolbar](self, "bottomToolbar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isHidden");
    if ((v10 & 1) != 0)
    {
      Height = 0.0;
    }
    else
    {
      -[ICDocCamExtractedDocumentViewController bottomToolbar](self, "bottomToolbar");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "bounds");
      Height = CGRectGetHeight(v42);
    }
    v12 = v8 + Height;
    -[ICDocCamExtractedDocumentViewController filterViewController](self, "filterViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBottomContentInset:", v12);

    if ((v10 & 1) == 0)
    -[ICDocCamExtractedDocumentViewController filterViewController](self, "filterViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFilterViewDelegate:", self);

    -[ICDocCamExtractedDocumentViewController filterViewController](self, "filterViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentViewController addChildViewController:](self, "addChildViewController:", v15);

    -[ICDocCamExtractedDocumentViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    -[ICDocCamExtractedDocumentViewController filterViewController](self, "filterViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFrame:", v18, v20, v22, v24);

    -[ICDocCamExtractedDocumentViewController view](self, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentViewController filterViewController](self, "filterViewController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentViewController topToolbar](self, "topToolbar");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "insertSubview:above:", v29, v30);

    -[ICDocCamExtractedDocumentViewController filterViewController](self, "filterViewController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "didMoveToParentViewController:", self);

    -[ICDocCamExtractedDocumentViewController filterViewController](self, "filterViewController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "prepareToAnimateIn:", 1);

    -[ICDocCamExtractedDocumentViewController filterViewController](self, "filterViewController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "layer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v36) = 0;
    objc_msgSend(v35, "setOpacity:", v36);

    v37 = MEMORY[0x24BDAC760];
    v40[4] = self;
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __68__ICDocCamExtractedDocumentViewController_showFilterViewIfNecessary__block_invoke;
    v41[3] = &unk_24C5B7AE0;
    v41[4] = self;
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __68__ICDocCamExtractedDocumentViewController_showFilterViewIfNecessary__block_invoke_2;
    v40[3] = &unk_24C5B7B78;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v41, v40, 0.15);
    v38[4] = self;
    v39[0] = v37;
    v39[1] = 3221225472;
    v39[2] = __68__ICDocCamExtractedDocumentViewController_showFilterViewIfNecessary__block_invoke_3;
    v39[3] = &unk_24C5B7AE0;
    v39[4] = self;
    v38[0] = v37;
    v38[1] = 3221225472;
    v38[2] = __68__ICDocCamExtractedDocumentViewController_showFilterViewIfNecessary__block_invoke_4;
    v38[3] = &unk_24C5B7AE0;
    -[ICDocCamExtractedDocumentViewController updatePageViewControllerConstraints:animationBlock:completionBlock:](self, "updatePageViewControllerConstraints:animationBlock:completionBlock:", 1, v39, v38);
  }
}

void __68__ICDocCamExtractedDocumentViewController_showFilterViewIfNecessary__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  double v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "filterViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = 1.0;
  objc_msgSend(v2, "setOpacity:", v3);

}

void __68__ICDocCamExtractedDocumentViewController_showFilterViewIfNecessary__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  double v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "filterViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = 1.0;
  objc_msgSend(v2, "setOpacity:", v3);

}

void __68__ICDocCamExtractedDocumentViewController_showFilterViewIfNecessary__block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "currentPageContentViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "resetZoom");

}

void __68__ICDocCamExtractedDocumentViewController_showFilterViewIfNecessary__block_invoke_4(uint64_t a1)
{
  UIAccessibilityNotifications v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "updateLayout");
  v2 = *MEMORY[0x24BDF72C8];
  objc_msgSend(*(id *)(a1 + 32), "filterViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v2, v3);

}

- (void)hideFilterViewIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  ICDocCamExtractedDocumentViewController *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];

  -[ICDocCamExtractedDocumentViewController deselectFilterButtons](self, "deselectFilterButtons");
  -[ICDocCamExtractedDocumentViewController filterViewController](self, "filterViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICDocCamExtractedDocumentViewController filterViewController](self, "filterViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentViewController setFilterViewController:](self, "setFilterViewController:", 0);
    objc_msgSend(v4, "prepareToAnimateIn:", 0);
    -[ICDocCamExtractedDocumentViewController filterViewController](self, "filterViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = 1.0;
    objc_msgSend(v7, "setOpacity:", v8);

    v9 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __68__ICDocCamExtractedDocumentViewController_hideFilterViewIfNecessary__block_invoke;
    v16[3] = &unk_24C5B7AE0;
    v16[4] = self;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __68__ICDocCamExtractedDocumentViewController_hideFilterViewIfNecessary__block_invoke_2;
    v15[3] = &unk_24C5B7B78;
    v15[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v16, v15, 0.15);
    v13 = self;
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __68__ICDocCamExtractedDocumentViewController_hideFilterViewIfNecessary__block_invoke_3;
    v14[3] = &unk_24C5B7AE0;
    v14[4] = self;
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __68__ICDocCamExtractedDocumentViewController_hideFilterViewIfNecessary__block_invoke_4;
    v11[3] = &unk_24C5B7BF0;
    v12 = v4;
    v10 = v4;
    -[ICDocCamExtractedDocumentViewController updatePageViewControllerConstraints:animationBlock:completionBlock:](self, "updatePageViewControllerConstraints:animationBlock:completionBlock:", 1, v14, v11);

  }
}

void __68__ICDocCamExtractedDocumentViewController_hideFilterViewIfNecessary__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  double v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "filterViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = 0;
  objc_msgSend(v2, "setOpacity:", v3);

}

void __68__ICDocCamExtractedDocumentViewController_hideFilterViewIfNecessary__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  double v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "filterViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = 0;
  objc_msgSend(v2, "setOpacity:", v3);

}

void __68__ICDocCamExtractedDocumentViewController_hideFilterViewIfNecessary__block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "currentPageContentViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "resetZoom");

}

void __68__ICDocCamExtractedDocumentViewController_hideFilterViewIfNecessary__block_invoke_4(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "willMoveToParentViewController:", 0);
  objc_msgSend(*(id *)(a1 + 32), "removeFromParentViewController");
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "setFilterViewDelegate:", 0);
  objc_msgSend(*(id *)(a1 + 40), "updateLayout");
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)updateImage:(id)a3 document:(id)a4 withFilterType:(signed __int16)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[2];

  v5 = a5;
  v26[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "docInfos");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "indexOfObject:", v9);

  if (objc_msgSend(v9, "currentFilter") != (_DWORD)v5 && v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v9, "setCurrentFilter:", v5);
    objc_msgSend(v9, "croppedAndFilteredImageUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICDocCamExtractedDocumentViewController imageCache](self, "imageCache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13)
    {
      objc_msgSend(v9, "metaData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "croppedAndFilteredImageUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "replaceImage:metaData:uuid:", v8, v16, v17);

    }
    else
    {
      objc_msgSend(v14, "setImage:metaData:addToMemoryCache:completion:", v8, 0, 0, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCroppedAndFilteredImageUUID:", v16);
    }

    if (v12 == -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex"))
    {
      -[ICDocCamExtractedDocumentViewController currentImageView](self, "currentImageView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setImage:", v8);

    }
    -[ICDocCamExtractedDocumentViewController delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) != 0)
    {
      v21 = objc_msgSend(v9, "currentFilter");
      -[ICDocCamExtractedDocumentViewController delegate](self, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "extractedDocumentControllerDidApplyFilter:forDocument:", v21, v9);

    }
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v12, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "reloadItemsAtIndexPaths:", v25);

  }
}

- (void)didUpdateDocumentTitle:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[ICDocCamExtractedDocumentViewController collectionTitleButton](self, "collectionTitleButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:forState:", v4, 0);

  -[ICDocCamExtractedDocumentViewController updateTitleView](self, "updateTitleView");
}

- (void)didUpdateDocumentInfoArrayNewCurrentDocument:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  -[ICDocCamExtractedDocumentViewController thumbnailCollectionViewLayout](self, "thumbnailCollectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "movingItem");

  if (v5)
  {
    -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelInteractiveMovement");

  }
  -[ICDocCamExtractedDocumentViewController thumbnailCollectionViewLayout](self, "thumbnailCollectionViewLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidateLayout");

  -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadData");

  if (v14
    && (-[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "docInfos"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "indexOfObject:", v14),
        v10,
        v9,
        v11 != 0x7FFFFFFFFFFFFFFFLL))
  {
    -[ICDocCamExtractedDocumentViewController showViewControllerAtIndex:animated:](self, "showViewControllerAtIndex:animated:", v11, 0);
    -[ICDocCamExtractedDocumentViewController setCurrentThumbnailItem:animated:](self, "setCurrentThumbnailItem:animated:", v11, 1);
    v12 = objc_msgSend(v14, "currentFilter");
    -[ICDocCamExtractedDocumentViewController filterViewController](self, "filterViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCurrentFilterType:", v12);

  }
  else
  {
    -[ICDocCamExtractedDocumentViewController hideFilterViewIfNecessary](self, "hideFilterViewIfNecessary");
  }

}

- (void)didUpdateDocumentImage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[ICDocCamExtractedDocumentViewController isScrollingBetweenPages](self, "isScrollingBetweenPages"))
  {
    -[ICDocCamExtractedDocumentViewController documentsToUpdateWhenScrollingStops](self, "documentsToUpdateWhenScrollingStops");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
  else
  {
    -[ICDocCamExtractedDocumentViewController updateDocumentImage:](self, "updateDocumentImage:", v5);
  }

}

- (void)updateDocumentImage:(id)a3
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "docInfos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v4);

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadItemsAtIndexPaths:", v10);

    if (-[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex") == v7)
    {
      -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "docInfos");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 >= objc_msgSend(v12, "count"))
      {
LABEL_6:

        goto LABEL_7;
      }
      -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "docInfos");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        -[ICDocCamExtractedDocumentViewController croppedAndFilteredmageForDocumentAtIndex:](self, "croppedAndFilteredmageForDocumentAtIndex:", v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICDocCamExtractedDocumentViewController currentPageContentViewController](self, "currentPageContentViewController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setImage:", v16);

        v18 = objc_msgSend(v15, "currentFilter");
        -[ICDocCamExtractedDocumentViewController filterViewController](self, "filterViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setCurrentFilterType:", v18);
        v11 = v15;
        goto LABEL_6;
      }
    }
LABEL_7:
    -[ICDocCamExtractedDocumentViewController thumbnailCollectionViewLayout](self, "thumbnailCollectionViewLayout");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "invalidateLayout");

    -[ICDocCamExtractedDocumentViewController setCurrentThumbnailItem:animated:](self, "setCurrentThumbnailItem:animated:", -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex"), 1);
    -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bumpModificationDate");

  }
}

- (id)currentDocument
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex");
  -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "docInfos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 >= objc_msgSend(v5, "count"))
  {
    v8 = 0;
  }
  else
  {
    -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "docInfos");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)addImageAction:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  if (!-[ICDocCamExtractedDocumentViewController shouldDisableActions](self, "shouldDisableActions", a3))
  {
    -[ICDocCamExtractedDocumentViewController hideFilterViewIfNecessary](self, "hideFilterViewIfNecessary");
    -[ICDocCamExtractedDocumentViewController presentedViewController](self, "presentedViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
      -[ICDocCamExtractedDocumentViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
    -[ICDocCamExtractedDocumentViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[ICDocCamExtractedDocumentViewController delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "extractedDocumentControllerDidTapAddImage");

    }
  }
}

- (void)recropButtonPressed:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  if (!-[ICDocCamExtractedDocumentViewController shouldDisableActions](self, "shouldDisableActions", a3))
  {
    -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "docInfos");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      -[ICDocCamExtractedDocumentViewController delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) != 0)
      {
        if (-[ICDocCamExtractedDocumentViewController currentImageHasMarkup](self, "currentImageHasMarkup"))
        {
          -[ICDocCamExtractedDocumentViewController alertAndDiscardMarkup](self, "alertAndDiscardMarkup");
        }
        else
        {
          -[ICDocCamExtractedDocumentViewController delegate](self, "delegate");
          v10 = (id)objc_claimAutoreleasedReturnValue();
          -[ICDocCamExtractedDocumentViewController currentDocument](self, "currentDocument");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "extractedDocumentController:didTapRecrop:index:", self, v9, -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex"));

        }
      }
    }
  }
}

- (void)retakeAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[ICDocCamExtractedDocumentViewController view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "statusBarManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController setStatusBarWasHiddenWhenRetakeTapped:](self, "setStatusBarWasHiddenWhenRetakeTapped:", objc_msgSend(v7, "isStatusBarHidden"));

  -[ICDocCamExtractedDocumentViewController delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "extractedDocumentControllerDidTapRetake:", -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex"));

}

- (void)doneAction:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  id v11;

  -[ICDocCamExtractedDocumentViewController view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "statusBarManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController setStatusBarWasHiddenWhenDoneTapped:](self, "setStatusBarWasHiddenWhenDoneTapped:", objc_msgSend(v7, "isStatusBarHidden"));

  -[ICDocCamExtractedDocumentViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_opt_respondsToSelector();

  -[ICDocCamExtractedDocumentViewController delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v9 = -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex");
  if ((v5 & 1) != 0)
  {
    -[ICDocCamExtractedDocumentViewController scanCollectionDataDelegate](self, "scanCollectionDataDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "extractedDocumentControllerDidTapDone:scanDataDelegate:", v9, v10);

  }
  else
  {
    objc_msgSend(v11, "extractedDocumentControllerDidTapDone:", v9);
  }

}

- (void)shareAction:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (!-[ICDocCamExtractedDocumentViewController shouldDisableActions](self, "shouldDisableActions"))
  {
    -[ICDocCamExtractedDocumentViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "docInfos");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      if (v8)
      {
        -[ICDocCamExtractedDocumentViewController delegate](self, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "docInfos");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "extractedDocumentController:shareDocument:sender:", self, v12, v13);

      }
    }
  }

}

- (DCScanDataDelegate)scanCollectionDataDelegate
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_opt_class();
  -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "docInfos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  DCDynamicCast(v3, (uint64_t)v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "scanDataDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "parentAttachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (DCScanDataDelegate *)v9;
}

- (DCScanDataDelegate)selectedScanDataDelegate
{
  void *v2;
  void *v3;

  -[ICDocCamExtractedDocumentViewController currentDocument](self, "currentDocument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scanDataDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (DCScanDataDelegate *)v3;
}

- (id)orientationString:(int64_t)a3
{
  if ((unint64_t)a3 >= 4)
    -[ICDocCamExtractedDocumentViewController orientationString:].cold.1();
  return off_24C5B7E90[a3];
}

- (id)currentPageContentViewController
{
  void *v2;
  void *v3;
  void *v4;

  -[ICDocCamExtractedDocumentViewController pageViewController](self, "pageViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (UIImageView)currentImageView
{
  void *v2;
  void *v3;

  -[ICDocCamExtractedDocumentViewController currentPageContentViewController](self, "currentPageContentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImageView *)v3;
}

- (void)alertAndDiscardMarkup
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
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  ICDocCamExtractedDocumentViewController *v21;
  id v22;

  -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "docInfos");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Discard Annotations?"), CFSTR("Discard Annotations?"), CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("If you rotate or crop this scan, its Markup annotations will be discarded."), CFSTR("If you rotate or crop this scan, its Markup annotations will be discarded."), CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("exclamationmark.triangle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v9);

  v10 = (void *)MEMORY[0x24BDF67E8];
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("OK"), CFSTR("OK"), CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __64__ICDocCamExtractedDocumentViewController_alertAndDiscardMarkup__block_invoke;
  v20 = &unk_24C5B7C18;
  v21 = self;
  v22 = v5;
  v12 = v5;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 2, &v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v13, v17, v18, v19, v20, v21);

  v14 = (void *)MEMORY[0x24BDF67E8];
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Cancel"), CFSTR("Cancel"), CFSTR("Localizable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v16);

  -[ICDocCamExtractedDocumentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
}

void __64__ICDocCamExtractedDocumentViewController_alertAndDiscardMarkup__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extractedDocumentControllerDiscardMarkupModelDataForDocument:", *(_QWORD *)(a1 + 40));

}

- (BOOL)currentImageHasMarkup
{
  void *v3;
  char v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;

  -[ICDocCamExtractedDocumentViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  v5 = -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex");
  -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "docInfos");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v5 >= v8)
    return 0;
  -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "docInfos");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICDocCamExtractedDocumentViewController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "extractedDocumentControllerMarkupModelDataForDocument:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length") != 0;

  return v14;
}

- (BOOL)imageIsPortrait:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v3 = a3;
  objc_msgSend(v3, "size");
  v5 = v4;
  objc_msgSend(v3, "size");
  v7 = v6;

  return v5 <= v7;
}

- (void)rotateAction:(id)a3
{
  if (!-[ICDocCamExtractedDocumentViewController shouldDisableActions](self, "shouldDisableActions", a3))
  {
    if (-[ICDocCamExtractedDocumentViewController currentImageHasMarkup](self, "currentImageHasMarkup"))
      -[ICDocCamExtractedDocumentViewController alertAndDiscardMarkup](self, "alertAndDiscardMarkup");
    else
      -[ICDocCamExtractedDocumentViewController rotateCurrentImage](self, "rotateCurrentImage");
  }
}

- (void)rotateCurrentImage
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20CE8E000, log, OS_LOG_TYPE_ERROR, "Unable to find image when rotating.", v1, 2u);
}

void __61__ICDocCamExtractedDocumentViewController_rotateCurrentImage__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __int128 v6;
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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[5];
  id v27;
  _OWORD v28[3];
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setClipsToBounds:", 1);
  objc_msgSend(*(id *)(a1 + 40), "pageViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClipsToBounds:", 1);

  objc_msgSend(*(id *)(a1 + 48), "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllAnimations");

  v5 = *(void **)(a1 + 48);
  v6 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v28[0] = *MEMORY[0x24BDBD8B8];
  v28[1] = v6;
  v28[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v5, "setTransform:", v28);
  objc_msgSend(*(id *)(a1 + 40), "documentInfoCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "docInfos");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 64));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x212B98734](objc_msgSend(v9, "setCurrentOrientation:", objc_msgSend(*(id *)(a1 + 40), "orientationRotated90DegreesFromOrientation:", objc_msgSend(v9, "currentOrientation"))));
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:scale:orientation:", objc_msgSend(objc_retainAutorelease(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)), "CGImage"), *(_QWORD *)(a1 + 72), 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "croppedAndFilteredImageUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "imageCache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    objc_msgSend(v9, "metaData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "croppedAndFilteredImageUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "replaceImage:metaData:uuid:", v11, v15, v16);

  }
  else
  {
    objc_msgSend(v13, "setImage:metaData:addToMemoryCache:completion:", v11, 0, 1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCroppedAndFilteredImageUUID:", v15);
  }

  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = 0;

  objc_msgSend(*(id *)(a1 + 40), "currentPageContentViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setImage:", v11);

  objc_autoreleasePoolPop(v10);
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_opt_respondsToSelector();

  if ((v21 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "thumbnailCollectionView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", *(_QWORD *)(a1 + 64), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "reloadItemsAtIndexPaths:", v24);

  }
  objc_msgSend(*(id *)(a1 + 40), "setRotationUnderWay:", 0);
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __61__ICDocCamExtractedDocumentViewController_rotateCurrentImage__block_invoke_2;
  v26[3] = &unk_24C5B7BF0;
  v26[4] = *(_QWORD *)(a1 + 40);
  v27 = v9;
  v25 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], v26);

}

void __61__ICDocCamExtractedDocumentViewController_rotateCurrentImage__block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "extractedDocumentControllerDidRotateDocument:", *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 32), "documentInfoCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bumpModificationDate");

}

- (void)filterButtonAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
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
  uint64_t v20;
  void *v21;
  NSObject *v22;
  _QWORD v23[5];

  v4 = a3;
  if (!-[ICDocCamExtractedDocumentViewController shouldDisableActions](self, "shouldDisableActions"))
  {
    -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "docInfos");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      -[ICDocCamExtractedDocumentViewController filterViewController](self, "filterViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v4, "setSelected:", 0);
        -[ICDocCamExtractedDocumentViewController deselectFilterButtons](self, "deselectFilterButtons");
        -[ICDocCamExtractedDocumentViewController hideFilterViewIfNecessary](self, "hideFilterViewIfNecessary");
      }
      else
      {
        objc_msgSend(v4, "setSelected:", 1);
        -[ICDocCamExtractedDocumentViewController selectFilterButtons](self, "selectFilterButtons");
        v9 = -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex");
        -[ICDocCamExtractedDocumentViewController croppedAndFilteredmageForDocumentAtIndex:](self, "croppedAndFilteredmageForDocumentAtIndex:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICDocCamExtractedDocumentViewController croppedButNotFilteredImageForDocumentAtIndex:](self, "croppedButNotFilteredImageForDocumentAtIndex:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "docInfos");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9 >= objc_msgSend(v13, "count"))
        {
          v16 = 0;
        }
        else
        {
          -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "docInfos");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectAtIndexedSubscript:", v9);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

        }
        if (v16 && v10 && v11)
        {
          -[ICDocCamExtractedDocumentViewController showFilterViewIfNecessary](self, "showFilterViewIfNecessary");
          -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "docInfos");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectAtIndexedSubscript:", v9);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "currentFilter");
          -[ICDocCamExtractedDocumentViewController filterViewController](self, "filterViewController");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setCurrentFilterType:", v20);

        }
        else
        {
          v22 = os_log_create("com.apple.documentcamera", ");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            -[ICDocCamExtractedDocumentViewController filterButtonAction:].cold.1(v16, v22);

        }
      }
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __62__ICDocCamExtractedDocumentViewController_filterButtonAction___block_invoke;
      v23[3] = &unk_24C5B7AE0;
      v23[4] = self;
      dc_dispatchMainAfterDelay(v23, 0.25);
    }
  }

}

uint64_t __62__ICDocCamExtractedDocumentViewController_filterButtonAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateFilterButtonItemAccessibilityInfo");
}

- (void)deleteButtonAction:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
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
  _QWORD v25[5];

  v4 = a3;
  if (!-[ICDocCamExtractedDocumentViewController shouldDisableActions](self, "shouldDisableActions"))
  {
    if (-[ICDocCamExtractedDocumentViewController mode](self, "mode"))
    {
      v5 = objc_opt_class();
      DCDynamicCast(v5, (uint64_t)v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "docInfos");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "count");

        if (v9 >= 2)
        {
          -[ICDocCamExtractedDocumentViewController deleteCurrentPage](self, "deleteCurrentPage");
LABEL_18:

          goto LABEL_19;
        }
      }
      -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "docInfos");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "count") == 1)
      {
        -[ICDocCamExtractedDocumentViewController delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v13 = -[ICDocCamExtractedDocumentViewController mode](self, "mode");

          if (v13 == 1)
          {
            +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Deleting the last scan in this document will remove the document from your note."), CFSTR("Deleting the last scan in this document will remove the document from your note."), CFSTR("Localizable"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
            objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v14, 0, 0);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = (void *)MEMORY[0x24BDF67E8];
            +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Delete Scan"), CFSTR("Delete Scan"), CFSTR("Localizable"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v25[0] = MEMORY[0x24BDAC760];
            v25[1] = 3221225472;
            v25[2] = __62__ICDocCamExtractedDocumentViewController_deleteButtonAction___block_invoke;
            v25[3] = &unk_24C5B7C68;
            v25[4] = self;
            objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 2, v25);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addAction:", v18);

            v19 = (void *)MEMORY[0x24BDF67E8];
            +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Cancel"), CFSTR("Cancel"), CFSTR("Localizable"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 1, 0);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addAction:", v21);

            objc_msgSend(v15, "setModalPresentationStyle:", 7);
            -[ICDocCamExtractedDocumentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, 0);
            objc_msgSend(v15, "popoverPresentationController");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v22;
            if (v6)
            {
              objc_msgSend(v22, "setBarButtonItem:", v6);
            }
            else
            {
              -[ICDocCamExtractedDocumentViewController currentImageView](self, "currentImageView");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "setSourceView:", v24);

              -[ICDocCamExtractedDocumentViewController menuControllerTargetRect](self, "menuControllerTargetRect");
              objc_msgSend(v23, "setSourceRect:");
            }
            objc_msgSend(v23, "setPermittedArrowDirections:", 3);

            goto LABEL_18;
          }
LABEL_13:
          v14 = 0;
          goto LABEL_14;
        }

      }
      goto LABEL_13;
    }
    -[ICDocCamExtractedDocumentViewController deleteCurrentPage](self, "deleteCurrentPage");
  }
LABEL_19:

}

uint64_t __62__ICDocCamExtractedDocumentViewController_deleteButtonAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteCurrentPage");
}

- (id)makeUIImageFromCIImage:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  CGImage *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBF648];
  v11 = *MEMORY[0x24BDBF818];
  v12[0] = MEMORY[0x24BDBD1C0];
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contextWithOptions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "extent");
  v8 = (CGImage *)objc_msgSend(v7, "createCGImage:fromRect:", v5);

  objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v8);

  return v9;
}

- (void)deleteCurrentPage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  double x;
  double y;
  double width;
  double height;
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
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  const __CFString *v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  void *v72;
  void *v73;
  void *v74;
  _QWORD *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  CATransform3D v81;
  CATransform3D v82;
  CATransform3D v83;
  CATransform3D v84;
  _QWORD v85[5];
  _QWORD v86[2];
  _QWORD v87[3];
  void *v88;
  void *v89;
  _QWORD v90[2];
  _QWORD v91[4];
  CGRect v92;
  CGRect v93;

  v91[2] = *MEMORY[0x24BDAC8D0];
  -[ICDocCamExtractedDocumentViewController hideFilterViewIfNecessary](self, "hideFilterViewIfNecessary");
  -[ICDocCamExtractedDocumentViewController currentPageContentViewController](self, "currentPageContentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetZoom");

  -[ICDocCamExtractedDocumentViewController currentPageContentViewController](self, "currentPageContentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_graphicsQuality");

  if (v7 != 100)
  {
    -[ICDocCamExtractedDocumentViewController croppedAndFilteredmageForDocumentAtIndex:](self, "croppedAndFilteredmageForDocumentAtIndex:", -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc(MEMORY[0x24BDBF660]);
    v10 = objc_retainAutorelease(v8);
    v80 = (void *)objc_msgSend(v9, "initWithCGImage:", objc_msgSend(v10, "CGImage"));
    objc_msgSend(v80, "extent");
    v93 = CGRectIntegral(v92);
    x = v93.origin.x;
    y = v93.origin.y;
    width = v93.size.width;
    height = v93.size.height;
    objc_msgSend(v80, "imageByCroppingToRect:");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "imageByClampingToExtent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "extent");
    objc_msgSend(v15, "imageBySettingAlphaOneInExtent:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x24BDBF658];
    v90[0] = *MEMORY[0x24BDBF960];
    v90[1] = CFSTR("inputRadius");
    v91[0] = v16;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 40.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v91[1] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v91, v90, 2);
    v19 = v5;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "filterWithName:withInputParameters:", CFSTR("CIGaussianBlur"), v20);
    v21 = v7;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "outputImage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "imageByCroppingToRect:", x, y, width, height);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v19;
    -[ICDocCamExtractedDocumentViewController makeUIImageFromCIImage:](self, "makeUIImageFromCIImage:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "size");
    v27 = v26;
    objc_msgSend(v10, "size");
    objc_msgSend(v25, "dc_scaledImageWithSize:scale:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentViewController currentPageContentViewController](self, "currentPageContentViewController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setImage:", v28);

    v7 = v21;
  }
  -[ICDocCamExtractedDocumentViewController trashButtonItem](self, "trashButtonItem");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setEnabled:", 0);

  -[ICDocCamExtractedDocumentViewController trashButtonItemForNavBar](self, "trashButtonItemForNavBar");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setEnabled:", 0);

  -[ICDocCamExtractedDocumentViewController retakeButtonItem](self, "retakeButtonItem");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setEnabled:", 0);

  -[ICDocCamExtractedDocumentViewController _beginDisablingInterfaceAutorotation](self, "_beginDisablingInterfaceAutorotation");
  v33 = 0x24BDE5000uLL;
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  v85[0] = MEMORY[0x24BDAC760];
  v85[1] = 3221225472;
  v85[2] = __60__ICDocCamExtractedDocumentViewController_deleteCurrentPage__block_invoke;
  v85[3] = &unk_24C5B7AE0;
  v85[4] = self;
  objc_msgSend(MEMORY[0x24BDE57D8], "setCompletionBlock:", v85);
  memset(&v84, 0, sizeof(v84));
  objc_msgSend(v5, "layer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v34)
    objc_msgSend(v34, "transform");
  else
    memset(&v84, 0, sizeof(v84));

  -[ICDocCamExtractedDocumentViewController currentPageContentViewController](self, "currentPageContentViewController");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "zoomScale");
  v38 = v37;

  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setFromValue:", v40);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v38 * 0.5);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setToValue:", v41);

  objc_msgSend(v39, "setDuration:", 0.28);
  LODWORD(v42) = 1.0;
  objc_msgSend(v39, "setRepeatCount:", v42);
  objc_msgSend(v39, "setRemovedOnCompletion:", 0);
  v43 = *MEMORY[0x24BDE5970];
  objc_msgSend(v39, "setFillMode:", *MEMORY[0x24BDE5970]);
  LODWORD(v44) = 1051361018;
  LODWORD(v45) = 1045220557;
  LODWORD(v46) = 0;
  LODWORD(v47) = 1.0;
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v44, v46, v45, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setTimingFunction:", v48);

  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setBeginTime:", 0.08);
  objc_msgSend(v49, "setFromValue:", &unk_24C5D8088);
  objc_msgSend(v49, "setToValue:", &unk_24C5D8070);
  objc_msgSend(v49, "setDuration:", 0.15);
  LODWORD(v50) = 1.0;
  objc_msgSend(v49, "setRepeatCount:", v50);
  objc_msgSend(v49, "setRemovedOnCompletion:", 0);
  objc_msgSend(v49, "setFillMode:", v43);
  v51 = *MEMORY[0x24BDE5D20];
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setTimingFunction:", v52);

  if (v7 == 100)
  {
    v53 = *MEMORY[0x24BDE5A78];
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5A78]);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setEnabled:", 1);
    objc_msgSend(v54, "setValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("inputNormalizeEdges"));
    objc_msgSend(v54, "setValue:forKey:", &unk_24C5D8070, CFSTR("inputRadius"));
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v55, "_graphicsQuality") == 100)
      v56 = CFSTR("default");
    else
      v56 = CFSTR("low");
    objc_msgSend(v54, "setValue:forKey:", v56, CFSTR("inputQuality"));

    objc_msgSend(v5, "layer");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = v54;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v89, 1);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setFilters:", v58);

    objc_msgSend(v5, "layer");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setShouldRasterize:", 1);

    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("filters.gaussianBlur.inputRadius"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "valueForKeyPath:", CFSTR("filters.gaussianBlur.inputRadius"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setFromValue:", v62);

    objc_msgSend(v60, "setToValue:", &unk_24C5D80A0);
    objc_msgSend(v60, "setDuration:", 0.15);
    LODWORD(v63) = 1.0;
    objc_msgSend(v60, "setRepeatCount:", v63);
    objc_msgSend(v60, "setRemovedOnCompletion:", 0);
    objc_msgSend(v60, "setFillMode:", v43);
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v51);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setTimingFunction:", v64);

    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", v53);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setEnabled:", 1);
    objc_msgSend(v65, "setValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("inputNormalizeEdges"));
    objc_msgSend(v65, "setValue:forKey:", &unk_24C5D80A0, CFSTR("inputRadius"));
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v66, "_graphicsQuality") == 100)
      v67 = CFSTR("default");
    else
      v67 = CFSTR("low");
    objc_msgSend(v65, "setValue:forKey:", v67, CFSTR("inputQuality"));

    objc_msgSend(v5, "layer");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = v65;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v88, 1);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setFilters:", v69);

    v7 = 100;
    v33 = 0x24BDE5000;
  }
  else
  {
    v60 = 0;
  }
  objc_msgSend(v5, "layer");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v71) = 0;
  objc_msgSend(v70, "setOpacity:", v71);

  v82 = v84;
  CATransform3DScale(&v83, &v82, 0.5, 0.5, 0.5);
  objc_msgSend(v5, "layer");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v83;
  objc_msgSend(v72, "setTransform:", &v81);

  objc_msgSend(MEMORY[0x24BDE5638], "animation");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setDuration:", 0.28);
  if (v7 == 100 && v60)
  {
    v87[0] = v39;
    v87[1] = v49;
    v87[2] = v60;
    v74 = (void *)MEMORY[0x24BDBCE30];
    v75 = v87;
    v76 = 3;
  }
  else
  {
    v86[0] = v39;
    v86[1] = v49;
    v74 = (void *)MEMORY[0x24BDBCE30];
    v75 = v86;
    v76 = 2;
  }
  objc_msgSend(v74, "arrayWithObjects:count:", v75, v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setAnimations:", v77);

  objc_msgSend(v5, "layer");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "addAnimation:forKey:", v73, CFSTR("animGroup"));

  objc_msgSend(*(id *)(v33 + 2008), "commit");
}

void __60__ICDocCamExtractedDocumentViewController_deleteCurrentPage__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
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
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  unint64_t v31;
  dispatch_time_t v32;
  NSObject *v33;
  _QWORD *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[5];
  _QWORD block[5];
  _QWORD v43[5];
  _QWORD v44[5];
  id v45;

  objc_msgSend(*(id *)(a1 + 32), "documentInfoCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "docInfos");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "documentInfoCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "docInfos");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 32), "presentationPageIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "croppedAndFilteredImageUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "imageCache");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "croppedAndFilteredImageUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "deleteImage:", v10);

    }
    objc_msgSend(v7, "croppedButNotFilteredImageUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "imageCache");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "croppedButNotFilteredImageUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "deleteImage:", v13);

    }
    objc_msgSend(v7, "fullImageUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(*(id *)(a1 + 32), "imageCache");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fullImageUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "deleteImage:", v16);

    }
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", objc_msgSend(*(id *)(a1 + 32), "presentationPageIndex"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "thumbnailCollectionView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x24BDAC760];
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __60__ICDocCamExtractedDocumentViewController_deleteCurrentPage__block_invoke_2;
    v44[3] = &unk_24C5B7BF0;
    v44[4] = *(_QWORD *)(a1 + 32);
    v20 = v17;
    v45 = v20;
    v43[0] = v19;
    v43[1] = 3221225472;
    v43[2] = __60__ICDocCamExtractedDocumentViewController_deleteCurrentPage__block_invoke_3;
    v43[3] = &unk_24C5B7B78;
    v43[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v18, "performBatchUpdates:completion:", v44, v43);

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v19) = objc_opt_respondsToSelector();

    if ((v19 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "extractedDocumentControllerDidDeleteDocument:", v7);

    }
    objc_msgSend(*(id *)(a1 + 32), "documentInfoCollection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bumpModificationDate");

  }
  objc_msgSend(*(id *)(a1 + 32), "documentInfoCollection");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "docInfos");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "count");

  v27 = *(void **)(a1 + 32);
  if (v26)
  {
    v28 = objc_msgSend(v27, "presentationPageIndex");
    objc_msgSend(*(id *)(a1 + 32), "documentInfoCollection");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "docInfos");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "count") - 1;

    if (v28 >= v31)
      v28 = v31;
    objc_msgSend(*(id *)(a1 + 32), "setPresentationPageIndex:", v28);
    objc_msgSend(*(id *)(a1 + 32), "updatePageIndicatorForPageIndex:", v28);
    objc_msgSend(*(id *)(a1 + 32), "showViewControllerAtIndex:animated:", v28, 1);
    objc_msgSend(*(id *)(a1 + 32), "setCurrentThumbnailItem:animated:", v28, 1);
    if (objc_msgSend(*(id *)(a1 + 32), "_isInterfaceAutorotationDisabled"))
    {
      v32 = dispatch_time(0, 1000000000);
      v41[0] = MEMORY[0x24BDAC760];
      v41[1] = 3221225472;
      v41[2] = __60__ICDocCamExtractedDocumentViewController_deleteCurrentPage__block_invoke_5;
      v41[3] = &unk_24C5B7AE0;
      v41[4] = *(_QWORD *)(a1 + 32);
      v33 = MEMORY[0x24BDAC9B8];
      v34 = v41;
LABEL_18:
      dispatch_after(v32, v33, v34);
      return;
    }
    objc_msgSend(*(id *)(a1 + 32), "trashButtonItem");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setEnabled:", 1);

    objc_msgSend(*(id *)(a1 + 32), "trashButtonItemForNavBar");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setEnabled:", 1);

    objc_msgSend(*(id *)(a1 + 32), "retakeButtonItem");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setEnabled:", 1);

  }
  else
  {
    if (objc_msgSend(v27, "_isInterfaceAutorotationDisabled"))
    {
      v32 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __60__ICDocCamExtractedDocumentViewController_deleteCurrentPage__block_invoke_4;
      block[3] = &unk_24C5B7AE0;
      block[4] = *(_QWORD *)(a1 + 32);
      v33 = MEMORY[0x24BDAC9B8];
      v34 = block;
      goto LABEL_18;
    }
    objc_msgSend(*(id *)(a1 + 32), "trashButtonItem");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setEnabled:", 1);

    objc_msgSend(*(id *)(a1 + 32), "trashButtonItemForNavBar");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setEnabled:", 1);

    objc_msgSend(*(id *)(a1 + 32), "retakeButtonItem");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setEnabled:", 1);

    objc_msgSend(*(id *)(a1 + 32), "doneAction:", 0);
  }
}

void __60__ICDocCamExtractedDocumentViewController_deleteCurrentPage__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "thumbnailCollectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteItemsAtIndexPaths:", v3);

  objc_msgSend(*(id *)(a1 + 32), "documentInfoCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "docInfos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectAtIndex:", objc_msgSend(*(id *)(a1 + 32), "presentationPageIndex"));

}

void __60__ICDocCamExtractedDocumentViewController_deleteCurrentPage__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;

  objc_msgSend(*(id *)(a1 + 32), "thumbnailCollectionViewLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateLayout");

  objc_msgSend(*(id *)(a1 + 32), "documentInfoCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "docInfos");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "presentationPageIndex");
    objc_msgSend(*(id *)(a1 + 32), "documentInfoCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "docInfos");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count") - 1;

    if (v6 >= v9)
      v10 = v9;
    else
      v10 = v6;
    objc_msgSend(*(id *)(a1 + 32), "setCurrentThumbnailItem:animated:", v10, 1);
  }
}

uint64_t __60__ICDocCamExtractedDocumentViewController_deleteCurrentPage__block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  if (objc_msgSend(*(id *)(a1 + 32), "_isInterfaceAutorotationDisabled"))
    objc_msgSend(*(id *)(a1 + 32), "_endDisablingInterfaceAutorotation");
  objc_msgSend(*(id *)(a1 + 32), "trashButtonItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnabled:", 1);

  objc_msgSend(*(id *)(a1 + 32), "trashButtonItemForNavBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 1);

  objc_msgSend(*(id *)(a1 + 32), "retakeButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 1);

  return objc_msgSend(*(id *)(a1 + 32), "doneAction:", 0);
}

void __60__ICDocCamExtractedDocumentViewController_deleteCurrentPage__block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_endDisablingInterfaceAutorotation");
  objc_msgSend(*(id *)(a1 + 32), "trashButtonItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnabled:", 1);

  objc_msgSend(*(id *)(a1 + 32), "trashButtonItemForNavBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 1);

  objc_msgSend(*(id *)(a1 + 32), "retakeButtonItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 1);

}

- (void)showViewControllerAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14[2];
  id location;
  _QWORD v16[2];

  v4 = a4;
  v16[1] = *MEMORY[0x24BDAC8D0];
  -[ICDocCamExtractedDocumentViewController setPresentationPageIndex:](self, "setPresentationPageIndex:");
  -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "docInfos");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 > a3)
  {
    objc_initWeak(&location, self);
    -[ICDocCamExtractedDocumentViewController viewControllerAtIndex:](self, "viewControllerAtIndex:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentViewController pageViewController](self, "pageViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __78__ICDocCamExtractedDocumentViewController_showViewControllerAtIndex_animated___block_invoke;
    v13[3] = &unk_24C5B7C90;
    objc_copyWeak(v14, &location);
    v14[1] = (id)a3;
    objc_msgSend(v11, "setViewControllers:direction:animated:completion:", v12, 0, v4, v13);

    -[ICDocCamExtractedDocumentViewController updateImageViewAccessibilityForPageContentViewController:](self, "updateImageViewAccessibilityForPageContentViewController:", v10);
    objc_destroyWeak(v14);

    objc_destroyWeak(&location);
  }
}

void __78__ICDocCamExtractedDocumentViewController_showViewControllerAtIndex_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updatePageIndicatorForPageIndex:", *(_QWORD *)(a1 + 40));

}

- (void)startMarkupViewController
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  id location;

  -[ICDocCamExtractedDocumentViewController currentDocument](self, "currentDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[ICDocCamExtractedDocumentViewController setAdjustPageViewControllerForMarkup:](self, "setAdjustPageViewControllerForMarkup:", 1);
  if (v3)
  {
    v4 = MEMORY[0x24BDAC760];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __68__ICDocCamExtractedDocumentViewController_startMarkupViewController__block_invoke;
    v9[3] = &unk_24C5B7CB8;
    v9[4] = self;
    v5 = (void *)MEMORY[0x212B988FC](v9);
    -[ICDocCamExtractedDocumentViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __68__ICDocCamExtractedDocumentViewController_startMarkupViewController__block_invoke_4;
    v7[3] = &unk_24C5B7CE0;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v6, "extractedDocumentController:startMarkupOnDocument:inkStyle:startPresentBlock:dismissCompletionBlock:", self, v3, 1, v5, v7);

    objc_destroyWeak(&v8);
  }
  objc_destroyWeak(&location);

}

void __68__ICDocCamExtractedDocumentViewController_startMarkupViewController__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  _QWORD v8[5];

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v7 = v3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __68__ICDocCamExtractedDocumentViewController_startMarkupViewController__block_invoke_2;
  v8[3] = &unk_24C5B7AE0;
  v8[4] = v4;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__ICDocCamExtractedDocumentViewController_startMarkupViewController__block_invoke_3;
  v6[3] = &unk_24C5B7BA0;
  v6[4] = v4;
  v5 = v3;
  objc_msgSend(v4, "updatePageViewControllerConstraints:animationBlock:completionBlock:", 1, v8, v6);

}

void __68__ICDocCamExtractedDocumentViewController_startMarkupViewController__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "currentPageContentViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "resetZoom");

}

uint64_t __68__ICDocCamExtractedDocumentViewController_startMarkupViewController__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateLayout");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __68__ICDocCamExtractedDocumentViewController_startMarkupViewController__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "didDismissMarkupViewController");

}

- (void)didDismissMarkupViewController
{
  -[ICDocCamExtractedDocumentViewController setAdjustPageViewControllerForMarkup:](self, "setAdjustPageViewControllerForMarkup:", 0);
  -[ICDocCamExtractedDocumentViewController updatePageViewControllerConstraints:animationBlock:completionBlock:](self, "updatePageViewControllerConstraints:animationBlock:completionBlock:", 1, 0, 0);
}

- (void)deselectFilterButtons
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD v14[2];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[ICDocCamExtractedDocumentViewController filterButtonItem](self, "filterButtonItem", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  -[ICDocCamExtractedDocumentViewController filterButtonItemForNavBar](self, "filterButtonItemForNavBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setSelected:", 0);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (void)selectFilterButtons
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD v14[2];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[ICDocCamExtractedDocumentViewController filterButtonItem](self, "filterButtonItem", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  -[ICDocCamExtractedDocumentViewController filterButtonItemForNavBar](self, "filterButtonItemForNavBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setSelected:", 1);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (id)truncatedString:(id)a3 clipLength:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  if (objc_msgSend(v5, "length") <= a4)
  {
    v8 = v5;
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v5, "substringToIndex:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@…"), v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)pencilDownInZoomablePageContentViewController:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  id v7;

  if (-[ICDocCamExtractedDocumentViewController isShowingBarsForZoomablePageContentViewController:](self, "isShowingBarsForZoomablePageContentViewController:", a3))
  {
    -[ICDocCamExtractedDocumentViewController currentDocument](self, "currentDocument");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v7 = v4;
      -[ICDocCamExtractedDocumentViewController delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_opt_respondsToSelector();

      v4 = v7;
      if ((v6 & 1) != 0)
      {
        -[ICDocCamExtractedDocumentViewController startMarkupViewController](self, "startMarkupViewController");
        v4 = v7;
      }
    }

  }
}

- (void)hideBarsForZoomablePageContentViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  id v12;

  v4 = a3;
  if (!-[ICDocCamExtractedDocumentViewController barsShouldBeHidden](self, "barsShouldBeHidden"))
  {
    -[ICDocCamExtractedDocumentViewController filterViewController](self, "filterViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[ICDocCamExtractedDocumentViewController setBarsShouldBeHidden:](self, "setBarsShouldBeHidden:", 1);
      -[ICDocCamExtractedDocumentViewController currentBackgroundColor](self, "currentBackgroundColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamExtractedDocumentViewController pageViewControllerContainerView](self, "pageViewControllerContainerView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setBackgroundColor:", v6);

      v8 = MEMORY[0x24BDAC760];
      v9 = (void *)MEMORY[0x24BDF6F90];
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __88__ICDocCamExtractedDocumentViewController_hideBarsForZoomablePageContentViewController___block_invoke;
      v11[3] = &unk_24C5B7BF0;
      v11[4] = self;
      v12 = v4;
      v10[0] = v8;
      v10[1] = 3221225472;
      v10[2] = __88__ICDocCamExtractedDocumentViewController_hideBarsForZoomablePageContentViewController___block_invoke_2;
      v10[3] = &unk_24C5B7B78;
      v10[4] = self;
      objc_msgSend(v9, "animateWithDuration:animations:completion:", v11, v10, 0.2);

    }
  }

}

void __88__ICDocCamExtractedDocumentViewController_hideBarsForZoomablePageContentViewController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "setNeedsStatusBarAppearanceUpdate");
  objc_msgSend(*(id *)(a1 + 32), "currentBackgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v2);

  objc_msgSend(*(id *)(a1 + 32), "bottomToolbar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "topToolbar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "pageViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityViewIsModal:", 1);

}

void __88__ICDocCamExtractedDocumentViewController_hideBarsForZoomablePageContentViewController___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNavigationBarHidden:animated:", 1, 0);

  LODWORD(v2) = *MEMORY[0x24BDF72C8];
  objc_msgSend(*(id *)(a1 + 32), "pageViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v2, v3);

}

- (void)showBarsForZoomablePageContentViewController:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  v5 = -[ICDocCamExtractedDocumentViewController barsShouldBeHidden](self, "barsShouldBeHidden");
  if (v4 && v5)
  {
    -[ICDocCamExtractedDocumentViewController setBarsShouldBeHidden:](self, "setBarsShouldBeHidden:", 0);
    -[ICDocCamExtractedDocumentViewController currentBackgroundColor](self, "currentBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentViewController pageViewControllerContainerView](self, "pageViewControllerContainerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v6);

    -[ICDocCamExtractedDocumentViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNavigationBarHidden:animated:", 0, 0);

    -[ICDocCamExtractedDocumentViewController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "navigationBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAlpha:", 0.0);

    -[ICDocCamExtractedDocumentViewController pageViewController](self, "pageViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAccessibilityViewIsModal:", 0);

    v13 = (void *)MEMORY[0x24BDF6F90];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __88__ICDocCamExtractedDocumentViewController_showBarsForZoomablePageContentViewController___block_invoke;
    v14[3] = &unk_24C5B7BF0;
    v14[4] = self;
    v15 = v4;
    objc_msgSend(v13, "animateWithDuration:animations:", v14, 0.2);

  }
}

void __88__ICDocCamExtractedDocumentViewController_showBarsForZoomablePageContentViewController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "setNeedsStatusBarAppearanceUpdate");
  objc_msgSend(*(id *)(a1 + 32), "currentBackgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v2);

  objc_msgSend(*(id *)(a1 + 32), "bottomToolbar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "topToolbar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", 1.0);

  LODWORD(v6) = *MEMORY[0x24BDF72C8];
  objc_msgSend(*(id *)(a1 + 32), "pageViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v6, v8);

}

- (void)switchBarVisibilityForZoomablePageContentViewController:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[ICDocCamExtractedDocumentViewController filterViewController](self, "filterViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (-[ICDocCamExtractedDocumentViewController barsShouldBeHidden](self, "barsShouldBeHidden"))
      -[ICDocCamExtractedDocumentViewController showBarsForZoomablePageContentViewController:](self, "showBarsForZoomablePageContentViewController:", v5);
    else
      -[ICDocCamExtractedDocumentViewController hideBarsForZoomablePageContentViewController:](self, "hideBarsForZoomablePageContentViewController:", v5);
  }

}

- (BOOL)isShowingBarsForZoomablePageContentViewController:(id)a3
{
  return !-[ICDocCamExtractedDocumentViewController barsShouldBeHidden](self, "barsShouldBeHidden", a3);
}

- (id)currentBackgroundColor
{
  void *v3;

  if ((DCDebugInterfaceEnabled() & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    if (-[ICDocCamExtractedDocumentViewController barsShouldBeHidden](self, "barsShouldBeHidden"))
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    else
      objc_msgSend(MEMORY[0x24BDF6950], "DCExtractedDocumentViewControllerBackgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  uint64_t v5;
  void *v6;

  v5 = objc_msgSend(a4, "pageIndex", a3);
  v6 = 0;
  if (v5 && v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[ICDocCamExtractedDocumentViewController viewControllerAtIndex:](self, "viewControllerAtIndex:", v5 - 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend(a4, "pageIndex", a3);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_3;
  v6 = v5 + 1;
  -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "docInfos");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v6 == v9)
  {
LABEL_3:
    v10 = 0;
  }
  else
  {
    -[ICDocCamExtractedDocumentViewController viewControllerAtIndex:](self, "viewControllerAtIndex:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (void)setIsScrollingBetweenPages:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_isScrollingBetweenPages = a3;
  -[ICDocCamExtractedDocumentViewController thumbnailCollectionViewLayout](self, "thumbnailCollectionViewLayout");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsScrollingBetweenPages:", v3);

}

- (BOOL)isPageViewControllerScrolled
{
  double v4;

  if (-[ICDocCamExtractedDocumentViewController isScrollingBetweenPages](self, "isScrollingBetweenPages"))
    return 1;
  -[ICDocCamExtractedDocumentViewController normalizedPageViewControllerScrollPosition](self, "normalizedPageViewControllerScrollPosition");
  return v4 != 0.0;
}

- (BOOL)shouldDisableActions
{
  void *v4;
  char v5;

  if (-[ICDocCamExtractedDocumentViewController isPageViewControllerScrolled](self, "isPageViewControllerScrolled"))
    return 1;
  -[ICDocCamExtractedDocumentViewController thumbnailCollectionViewLayout](self, "thumbnailCollectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "movingItem");

  return v5;
}

- (BOOL)shouldDisableSharrow
{
  void *v2;
  void *v3;
  char v4;

  -[ICDocCamExtractedDocumentViewController navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "dc_isInSecureWindow");

  return v4;
}

- (double)normalizedPageViewControllerScrollPosition
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  -[ICDocCamExtractedDocumentViewController pageViewController](self, "pageViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5 + 16.0;

  -[ICDocCamExtractedDocumentViewController pageViewControllerScrollView](self, "pageViewControllerScrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentOffset");
  v9 = v8 - v6;

  -[ICDocCamExtractedDocumentViewController pageViewController](self, "pageViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v9 / (v12 + 16.0);

  return v13;
}

- (id)viewControllerAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  ICDocCamZoomablePageContentViewController *v10;
  void *v11;

  -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "docInfos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "docInfos");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9 <= a3)
    {
      v10 = 0;
      return v10;
    }
    v10 = objc_alloc_init(ICDocCamZoomablePageContentViewController);
    -[ICDocCamExtractedDocumentViewController croppedAndFilteredmageForDocumentAtIndex:](self, "croppedAndFilteredmageForDocumentAtIndex:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamZoomablePageContentViewController setImage:](v10, "setImage:", v11);

    -[ICDocCamZoomablePageContentViewController setPageIndex:](v10, "setPageIndex:", a3);
    -[ICDocCamZoomablePageContentViewController setPageContentDelegate:](v10, "setPageContentDelegate:", self);
    -[ICDocCamExtractedDocumentViewController currentBackgroundColor](self, "currentBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamZoomablePageContentViewController view](v10, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v5);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)pageViewController:(id)a3 willTransitionToViewControllers:(id)a4
{
  id v5;
  uint64_t v6;
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
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        -[ICDocCamExtractedDocumentViewController currentBackgroundColor](self, "currentBackgroundColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "view");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setBackgroundColor:", v11);

        -[ICDocCamExtractedDocumentViewController croppedAndFilteredmageForDocumentAtIndex:](self, "croppedAndFilteredmageForDocumentAtIndex:", objc_msgSend(v10, "pageIndex"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setImage:", v13);

        objc_msgSend(v10, "resetZoom");
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  -[ICDocCamExtractedDocumentViewController setIsScrollingBetweenPages:](self, "setIsScrollingBetweenPages:", 1);

}

- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6
{
  _BOOL4 v6;
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
  id v18;

  v6 = a6;
  v18 = a5;
  if (v6)
  {
    -[ICDocCamExtractedDocumentViewController pageViewController](self, "pageViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewControllers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICDocCamExtractedDocumentViewController setPresentationPageIndex:](self, "setPresentationPageIndex:", objc_msgSend(v10, "pageIndex"));
    -[ICDocCamExtractedDocumentViewController updatePageIndicatorForPageIndex:](self, "updatePageIndicatorForPageIndex:", -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex"));
    -[ICDocCamExtractedDocumentViewController thumbnailCollectionViewLayout](self, "thumbnailCollectionViewLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setInterPageScrollPosition:", 0.0);

    -[ICDocCamExtractedDocumentViewController thumbnailCollectionViewLayout](self, "thumbnailCollectionViewLayout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCurrentItem:animated:", -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex"), 0);

    -[ICDocCamExtractedDocumentViewController updateImageViewAccessibilityForPageContentViewController:](self, "updateImageViewAccessibilityForPageContentViewController:", v10);
    LODWORD(v12) = *MEMORY[0x24BDF71E8];
    objc_msgSend(v10, "imageView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accessibilityLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification((UIAccessibilityNotifications)v12, v14);

    if (objc_msgSend(v18, "count"))
    {
      v15 = objc_opt_class();
      objc_msgSend(v18, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      DCCheckedDynamicCast(v15, (uint64_t)v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "resetZoom");
    }

  }
  -[ICDocCamExtractedDocumentViewController setIsScrollingBetweenPages:](self, "setIsScrollingBetweenPages:", 0);

}

- (void)setPresentationPageIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  int64_t v11;

  -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "docInfos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "docInfos");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count") - 1;

    if (v10 >= a3)
      v11 = a3;
    else
      v11 = v10;
  }
  else
  {
    v11 = 0;
  }
  self->_presentationPageIndex = v11;
}

- (void)setCurrentThumbnailItem:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  unint64_t v9;
  id v10;

  v4 = a4;
  -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "docInfos");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 > a3)
  {
    -[ICDocCamExtractedDocumentViewController thumbnailCollectionViewLayout](self, "thumbnailCollectionViewLayout");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCurrentItem:animated:", a3, v4);

  }
}

- (void)updatePageIndicatorForPageIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __CFString *v25;

  -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "docInfos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 < 2)
  {
    v25 = &stru_24C5B9710;
    goto LABEL_10;
  }
  if ((unint64_t)(-[UIViewController dc_effectiveInterfaceOrientation](self, "dc_effectiveInterfaceOrientation")
                        - 3) > 1)
    goto LABEL_8;
  -[ICDocCamExtractedDocumentViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "dc_requiresCompactLandscapeIcons") & 1) == 0)
  {

    goto LABEL_8;
  }
  v10 = -[ICDocCamExtractedDocumentViewController mode](self, "mode");

  if (!v10)
  {
LABEL_8:
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = CFSTR("%d of %d");
    goto LABEL_9;
  }
  v11 = (void *)MEMORY[0x24BDD17C8];
  v12 = CFSTR("(%d of %d)");
LABEL_9:
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", v12, v12, CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "docInfos");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringWithFormat:", v13, a3 + 1, objc_msgSend(v15, "count"));
  v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  -[ICDocCamExtractedDocumentViewController pageIndexLabel](self, "pageIndexLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v25);

  -[ICDocCamExtractedDocumentViewController updateTitleView](self, "updateTitleView");
  -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "docInfos");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v19 > a3)
  {
    -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "docInfos");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndexedSubscript:", a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "currentFilter");
    -[ICDocCamExtractedDocumentViewController filterViewController](self, "filterViewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setCurrentFilterType:", v23);

  }
}

- (void)changePage:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  -[ICDocCamExtractedDocumentViewController pageViewController](self, "pageViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "pageIndex");

  if (a3)
    v9 = v8 - 1;
  else
    v9 = v8 + 1;
  -[ICDocCamExtractedDocumentViewController viewControllerAtIndex:](self, "viewControllerAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[ICDocCamExtractedDocumentViewController pageViewController](self, "pageViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setViewControllers:direction:animated:completion:", v12, a3, 0, 0);

  }
}

- (id)imageForDocInfo:(id)a3 newFilter:(signed __int16)a4
{
  uint64_t v4;
  id v6;
  id v7;
  uint64_t *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  ICDocCamExtractedDocumentViewController *v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v4 = a4;
  v6 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  v30 = 0;
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __69__ICDocCamExtractedDocumentViewController_imageForDocInfo_newFilter___block_invoke;
  v20 = &unk_24C5B7D08;
  v23 = &v31;
  v21 = self;
  v7 = v6;
  v22 = v7;
  v24 = &v25;
  dc_performBlockOnMainThread(&v17);
  v8 = v32;
  v9 = (id)v32[5];
  v10 = v8[5];
  if (v10)
  {
    +[ICDocCamImageFilters filteredImage:orientation:imageFilterType:](ICDocCamImageFilters, "filteredImage:orientation:imageFilterType:", v10, objc_msgSend(v7, "currentOrientation", v17, v18, v19, v20, v21), v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26[5])
    {
      +[ICDocCamImageFilters imageWithRGBColorspaceFromImage:](ICDocCamImageFilters, "imageWithRGBColorspaceFromImage:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "dc_JPEGData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x24BDF6AC8];
      +[DCMarkupUtilities imageDataWithMarkupModelData:sourceImageData:](DCMarkupUtilities, "imageDataWithMarkupModelData:sourceImageData:", v26[5], v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "imageWithData:", v15);
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = v11;
    }
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v9;
}

void __69__ICDocCamExtractedDocumentViewController_imageForDocInfo_newFilter___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "croppedButNotFilteredImageForDocInfo:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "extractedDocumentControllerMarkupModelDataForDocument:", *(_QWORD *)(a1 + 40));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

- (BOOL)filterViewControllerDidSelectFilter:(signed __int16)a3
{
  uint64_t v3;
  BOOL v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  if (-[ICDocCamExtractedDocumentViewController shouldDisableActions](self, "shouldDisableActions"))
    return 0;
  v6 = -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex");
  -[ICDocCamExtractedDocumentViewController croppedButNotFilteredImageForDocumentAtIndex:](self, "croppedButNotFilteredImageForDocumentAtIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "docInfos");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 >= objc_msgSend(v9, "count"))
  {
    v12 = 0;
  }
  else
  {
    -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "docInfos");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v5 = 0;
  if (v7 && v12)
  {
    if (objc_msgSend(v12, "currentFilter") == (_DWORD)v3)
    {
      v5 = 0;
    }
    else
    {
      -[ICDocCamExtractedDocumentViewController imageForDocInfo:newFilter:](self, "imageForDocInfo:newFilter:", v12, v3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamExtractedDocumentViewController updateImage:document:withFilterType:](self, "updateImage:document:withFilterType:", v13, v12, v3);
      -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bumpModificationDate");

      v5 = 1;
    }
  }

  return v5;
}

- (BOOL)filterViewControllerCanApplyToAll:(signed __int16)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  signed __int16 v13;

  if (-[ICDocCamExtractedDocumentViewController shouldDisableActions](self, "shouldDisableActions"))
    return 0;
  -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "docInfos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 < 2)
    return 0;
  -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "docInfos");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __77__ICDocCamExtractedDocumentViewController_filterViewControllerCanApplyToAll___block_invoke;
  v12[3] = &__block_descriptor_34_e37_B32__0__ICDocCamDocumentInfo_8Q16_B24l;
  v13 = a3;
  v8 = objc_msgSend(v10, "indexOfObjectPassingTest:", v12) != 0x7FFFFFFFFFFFFFFFLL;

  return v8;
}

BOOL __77__ICDocCamExtractedDocumentViewController_filterViewControllerCanApplyToAll___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  _BOOL8 result;

  result = *(unsigned __int16 *)(a1 + 32) != (unsigned __int16)objc_msgSend(a2, "currentFilter");
  *a4 = result;
  return result;
}

- (BOOL)filterViewControllerApplyToAll:(signed __int16)a3
{
  uint64_t v3;
  BOOL v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  DCLongRunningTaskController *v20;
  void *v21;
  void *v22;
  DCLongRunningTaskController *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  __int16 v30;
  _BYTE v31[128];
  uint64_t v32;

  v3 = a3;
  v32 = *MEMORY[0x24BDAC8D0];
  if (-[ICDocCamExtractedDocumentViewController shouldDisableActions](self, "shouldDisableActions"))
  {
    return 0;
  }
  else
  {
    v5 = -[ICDocCamExtractedDocumentViewController filterViewControllerDidSelectFilter:](self, "filterViewControllerDidSelectFilter:", v3);
    if (-[ICDocCamExtractedDocumentViewController mode](self, "mode"))
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "docInfos");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v26 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            if (objc_msgSend(v12, "currentFilter") != (_DWORD)v3)
            {
              v13 = v7;
              -[ICDocCamExtractedDocumentViewController delegate](self, "delegate");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_opt_respondsToSelector();

              if ((v15 & 1) != 0)
              {
                objc_msgSend(v12, "setCurrentFilter:", v3);
                -[ICDocCamExtractedDocumentViewController delegate](self, "delegate");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "extractedDocumentControllerDidApplyFilter:forDocument:", v3, v12);

                v5 = 1;
              }
              -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "bumpModificationDate");

              v7 = v13;
            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
        }
        while (v9);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "window");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      +[DCLongRunningTaskController setMainWindow:](DCLongRunningTaskController, "setMainWindow:", v7);
      v20 = [DCLongRunningTaskController alloc];
      -[ICDocCamExtractedDocumentViewController view](self, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "window");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[DCLongRunningTaskController initWithWindow:intervalBeforeOpeningProgressDialog:](v20, "initWithWindow:intervalBeforeOpeningProgressDialog:", v22, 0.5);

      -[DCLongRunningTaskController setProgressToStringTransformer:](v23, "setProgressToStringTransformer:", &__block_literal_global_419);
      -[DCLongRunningTaskController setViewControllerToPresentFrom:](v23, "setViewControllerToPresentFrom:", self);
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __74__ICDocCamExtractedDocumentViewController_filterViewControllerApplyToAll___block_invoke_2;
      v29[3] = &unk_24C5B7DB8;
      v29[4] = self;
      v30 = v3;
      -[DCLongRunningTaskController startTask:completionBlock:](v23, "startTask:completionBlock:", v29, 0);

    }
  }
  return v5;
}

id __74__ICDocCamExtractedDocumentViewController_filterViewControllerApplyToAll___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)MEMORY[0x24BDD17C8];
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Apply Filter to Scan %lu of %lu"), CFSTR("Apply Filter to Scan %lu of %lu"), CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v6, a2, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __74__ICDocCamExtractedDocumentViewController_filterViewControllerApplyToAll___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  unsigned __int16 v22;
  int v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _QWORD v28[6];
  id v29;
  __int16 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "documentInfoCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "docInfos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v36;
    v10 = 1;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(v6);
        if (*(unsigned __int16 *)(a1 + 40) != (unsigned __int16)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "currentFilter"))++v10;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 1;
  }

  objc_msgSend(v3, "setTotalUnitCount:", v10);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "documentInfoCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "docInfos");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v32;
    v18 = 1;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v32 != v17)
          objc_enumerationMutation(v14);
        v20 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
        v21 = (void *)MEMORY[0x212B98734]();
        v22 = objc_msgSend(v20, "currentFilter");
        v23 = *(unsigned __int16 *)(a1 + 40);
        if (v23 != v22)
        {
          objc_msgSend(*(id *)(a1 + 32), "imageForDocInfo:newFilter:", v20, (__int16)v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (v24)
          {
            v28[0] = MEMORY[0x24BDAC760];
            v28[1] = 3221225472;
            v28[2] = __74__ICDocCamExtractedDocumentViewController_filterViewControllerApplyToAll___block_invoke_3;
            v28[3] = &unk_24C5B7D90;
            v30 = *(_WORD *)(a1 + 40);
            v26 = *(_QWORD *)(a1 + 32);
            v28[4] = v20;
            v28[5] = v26;
            v29 = v24;
            dispatch_async(MEMORY[0x24BDAC9B8], v28);

          }
          objc_msgSend(v3, "setCompletedUnitCount:", ++v18);
          objc_msgSend(*(id *)(a1 + 32), "documentInfoCollection");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "bumpModificationDate");

        }
        objc_autoreleasePoolPop(v21);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v16);
  }

}

void __74__ICDocCamExtractedDocumentViewController_filterViewControllerApplyToAll___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "croppedAndFilteredImageUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setCurrentFilter:", *(__int16 *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 40), "imageCache");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "metaData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "croppedAndFilteredImageUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "replaceImage:metaData:uuid:", v4, v5, v6);

    objc_msgSend(*(id *)(a1 + 40), "didUpdateDocumentImage:", *(_QWORD *)(a1 + 32));
  }
}

- (void)showPrimaryControllerForNotes:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (**v10)(_QWORD);
  void *v11;
  BOOL v12;
  void *v13;
  _QWORD v14[4];
  void (**v15)(_QWORD);
  _QWORD v16[5];
  id v17;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "displayMode") == 1)
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "applicationState");

    v9 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __82__ICDocCamExtractedDocumentViewController_showPrimaryControllerForNotes_animated___block_invoke;
    v16[3] = &unk_24C5B7BF0;
    v16[4] = self;
    v17 = v6;
    v10 = (void (**)(_QWORD))MEMORY[0x212B988FC](v16);
    v11 = v10;
    if (v8)
      v12 = 1;
    else
      v12 = !v4;
    if (v12)
    {
      v10[2](v10);
    }
    else
    {
      v13 = (void *)MEMORY[0x24BDF6F90];
      v14[0] = v9;
      v14[1] = 3221225472;
      v14[2] = __82__ICDocCamExtractedDocumentViewController_showPrimaryControllerForNotes_animated___block_invoke_2;
      v14[3] = &unk_24C5B7DE0;
      v15 = v10;
      objc_msgSend(v13, "animateWithDuration:animations:", v14, 0.2);

    }
  }

}

void __82__ICDocCamExtractedDocumentViewController_showPrimaryControllerForNotes_animated___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "horizontalSizeClass");

  if (v3 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;

    if (v6 >= v8)
      v9 = 2;
    else
      v9 = 3;
    objc_msgSend(*(id *)(a1 + 40), "setPreferredDisplayMode:", v9);
  }
}

uint64_t __82__ICDocCamExtractedDocumentViewController_showPrimaryControllerForNotes_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)collectionNameTapped:(id)a3
{
  void *v4;
  void *v5;
  ICDocCamRenamePrompt *v6;
  _QWORD v7[5];

  -[ICDocCamExtractedDocumentViewController collectionTitleButton](self, "collectionTitleButton", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleForState:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ICDocCamRenamePrompt initWithExistingTitle:]([ICDocCamRenamePrompt alloc], "initWithExistingTitle:", v5);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__ICDocCamExtractedDocumentViewController_collectionNameTapped___block_invoke;
  v7[3] = &unk_24C5B7E08;
  v7[4] = self;
  -[ICDocCamRenamePrompt showFromViewController:completion:](v6, "showFromViewController:completion:", self, v7);

}

void __64__ICDocCamExtractedDocumentViewController_collectionNameTapped___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  id v13;

  v13 = a2;
  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "collectionTitleButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTitle:forState:", v13, 0);

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "extractedDocumentControllerDidChangeTitle:", v13);

    }
    objc_msgSend(*(id *)(a1 + 32), "documentInfoCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bumpModificationDate");

  }
  objc_msgSend(*(id *)(a1 + 32), "updateTitleView");
  objc_msgSend(*(id *)(a1 + 32), "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "rootViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("ICSplitViewController")))
    objc_msgSend(*(id *)(a1 + 32), "showPrimaryControllerForNotes:animated:", v10, 0);
  objc_msgSend(*(id *)(a1 + 32), "becomeFirstResponder");

}

- (ICDocCamReorderingThumbnailCollectionViewLayout)thumbnailCollectionViewLayout
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_opt_class();
  -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  DCCheckedDynamicCast(v3, (uint64_t)v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICDocCamReorderingThumbnailCollectionViewLayout *)v6;
}

- (CGSize)collectionView:(id)a3 imageSizeAtIndex:(int64_t)a4
{
  double v4;
  double v5;
  CGSize result;

  -[ICDocCamExtractedDocumentViewController imageSizeForDocumentAtIndex:](self, "imageSizeForDocumentAtIndex:", a4);
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGRect)targetViewRect
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)respondToImageLongPressGesture:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  CGPoint v22;
  CGRect v23;

  v4 = a3;
  -[ICDocCamExtractedDocumentViewController currentImageView](self, "currentImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  v10 = objc_msgSend(v4, "state");
  if (v10 == 1)
  {
    -[ICDocCamExtractedDocumentViewController currentImageView](self, "currentImageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v22.x = v7;
    v22.y = v9;
    v12 = CGRectContainsPoint(v23, v22);

    if (v12)
    {
      objc_msgSend(MEMORY[0x24BDF6BB0], "sharedMenuController");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v13 = DCTSDRectWithCenterAndSize(v7, v9, 10.0);
      v15 = v14;
      v17 = v16;
      v19 = v18;
      -[ICDocCamExtractedDocumentViewController currentImageView](self, "currentImageView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "showMenuFromView:rect:", v20, v13, v15, v17, v19);

      -[ICDocCamExtractedDocumentViewController setMenuControllerTargetRect:](self, "setMenuControllerTargetRect:", v13, v15, v17, v19);
    }
  }
}

- (void)share:(id)a3
{
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
  id v14;

  -[ICDocCamExtractedDocumentViewController delegate](self, "delegate", a3);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController currentDocument](self, "currentDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController menuControllerTargetRect](self, "menuControllerTargetRect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[ICDocCamExtractedDocumentViewController currentImageView](self, "currentImageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "extractedDocumentControllerDidSelectShareFromMenuForDocument:sourceRect:sourceView:", v4, v13, v6, v8, v10, v12);

}

- (void)copy:(id)a3
{
  void *v4;
  id v5;

  -[ICDocCamExtractedDocumentViewController delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController currentDocument](self, "currentDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extractedDocumentControllerDidSelectCopyFromMenuForDocument:", v4);

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v11;

  v6 = a4;
  -[ICDocCamExtractedDocumentViewController currentPageContentViewController](self, "currentPageContentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "analysisInteraction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "hasActiveTextSelection") & 1) == 0
    && !-[ICDocCamExtractedDocumentViewController shouldDisableActions](self, "shouldDisableActions"))
  {
    if (sel_copy_ == a3
      || !-[ICDocCamExtractedDocumentViewController shouldDisableSharrow](self, "shouldDisableSharrow")
      && sel_share_ == a3)
    {
      -[ICDocCamExtractedDocumentViewController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_respondsToSelector();

      goto LABEL_4;
    }
    if (sel_delete_ == a3
      && -[ICDocCamExtractedDocumentViewController canPerformAction:withSender:](self, "canPerformAction:withSender:", sel_copy_, v6))
    {
      v9 = -[ICDocCamExtractedDocumentViewController mode](self, "mode") != 2;
      goto LABEL_4;
    }
  }
  v9 = 0;
LABEL_4:

  return v9 & 1;
}

- (void)respondToThumbnailLongPressGesture:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  double v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  id v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  v44 = a3;
  -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfItemsInSection:", 0);

  if (v5 >= 2 && -[ICDocCamExtractedDocumentViewController mode](self, "mode") == 1)
  {
    -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "locationInView:", v6);
    v8 = v7;
    v10 = v9;

    -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "indexPathForItemAtPoint:", v8, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "cellForItemAtIndexPath:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }
    -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cellForItemAtIndexPath:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v17, "frame");
      v18 = CGRectGetMinX(v45) + -24.0;
      if (v8 < v18)
        v8 = v18;
    }
    v19 = fmax(v8, 0.0);
    -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "contentOffset");
    v22 = v21;

    -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "frame");
    v25 = v22 + v24;

    -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v5 - 1;
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v5 - 1, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "cellForItemAtIndexPath:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v29, "frame");
      v30 = CGRectGetMaxX(v46) + 24.0;
      if (v19 >= v30)
        v19 = v30;
    }
    if (v19 < v25)
      v25 = v19;
    v31 = objc_msgSend(v44, "state");
    switch(v31)
    {
      case 3:
        -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "endInteractiveMovement");
        break;
      case 2:
        -[ICDocCamExtractedDocumentViewController movingIndexPath](self, "movingIndexPath");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v35, "item")
          || (-[ICDocCamExtractedDocumentViewController movingXPosition](self, "movingXPosition"), v25 >= v36))
        {
          -[ICDocCamExtractedDocumentViewController movingIndexPath](self, "movingIndexPath");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v38, "item") == v27)
          {
            -[ICDocCamExtractedDocumentViewController movingXPosition](self, "movingXPosition");
            v40 = v39;

            if (v25 > v40)
              goto LABEL_30;
          }
          else
          {

          }
          -[ICDocCamExtractedDocumentViewController movingYPosition](self, "movingYPosition");
          v42 = v41;
          -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "updateInteractiveMovementTargetPosition:", v25, v42);

          -[ICDocCamExtractedDocumentViewController speakAccessibilityAnnouncementForReorderIfNecessaryForProposedIndexPath:](self, "speakAccessibilityAnnouncementForReorderIfNecessaryForProposedIndexPath:", v12);
        }
        else
        {

        }
LABEL_30:

        goto LABEL_31;
      case 1:
        if (v12)
        {
          objc_msgSend(v14, "frame");
          -[ICDocCamExtractedDocumentViewController setMovingYPosition:](self, "setMovingYPosition:", CGRectGetMidY(v47));
          -[ICDocCamExtractedDocumentViewController setMovingXPosition:](self, "setMovingXPosition:", v25);
          -[ICDocCamExtractedDocumentViewController setMovingIndexPath:](self, "setMovingIndexPath:", v12);
          -[ICDocCamExtractedDocumentViewController thumbnailCollectionViewLayout](self, "thumbnailCollectionViewLayout");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setMovingItem:", 1);

          -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "beginInteractiveMovementForItemAtIndexPath:", v12);

          -[ICDocCamExtractedDocumentViewController setLastAXProposedIndexForReordering:](self, "setLastAXProposedIndexForReordering:", objc_msgSend(v12, "item"));
        }
        goto LABEL_30;
      default:
        -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "cancelInteractiveMovement");
        break;
    }

    -[ICDocCamExtractedDocumentViewController thumbnailCollectionViewLayout](self, "thumbnailCollectionViewLayout");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setMovingItem:", 0);

    -[ICDocCamExtractedDocumentViewController setMovingIndexPath:](self, "setMovingIndexPath:", 0);
    -[ICDocCamExtractedDocumentViewController setCurrentThumbnailItem:animated:](self, "setCurrentThumbnailItem:animated:", -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex"), 1);
    goto LABEL_30;
  }
LABEL_31:

}

- (void)handleAccessibilityLongPressOnCollectionTitle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  if (DCAccessibilityAccessibilityLargerTextSizesEnabled())
  {
    -[ICDocCamExtractedDocumentViewController collectionTitleButton](self, "collectionTitleButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentViewController truncatedString:clipLength:](self, "truncatedString:clipLength:", v5, 48);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "docInfos");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9 > 1)
    {
      v11 = (void *)MEMORY[0x24BDD17C8];
      -[ICDocCamExtractedDocumentViewController pageIndexLabel](self, "pageIndexLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "text");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@\n%@"), v6, v13);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = v6;
    }
    -[ICDocCamExtractedDocumentViewController hudItemForAccessibilityLargerText](self, "hudItemForAccessibilityLargerText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v15 = objc_alloc(MEMORY[0x24BDF67A8]);
      v16 = (void *)objc_msgSend(v15, "initWithTitle:image:imageInsets:", v10, 0, *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
      -[ICDocCamExtractedDocumentViewController setHudItemForAccessibilityLargerText:](self, "setHudItemForAccessibilityLargerText:", v16);

    }
    v17 = objc_msgSend(v20, "state");
    if ((unint64_t)(v17 - 3) >= 2)
    {
      if (v17 == 1)
      {
        -[ICDocCamExtractedDocumentViewController hudItemForAccessibilityLargerText](self, "hudItemForAccessibilityLargerText");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setTitle:", v10);

        -[ICDocCamExtractedDocumentViewController hudItemForAccessibilityLargerText](self, "hudItemForAccessibilityLargerText");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICDocCamExtractedDocumentViewController _showAccessibilityHUDItem:](self, "_showAccessibilityHUDItem:", v19);

      }
    }
    else
    {
      -[ICDocCamExtractedDocumentViewController _dismissAccessibilityHUD](self, "_dismissAccessibilityHUD");
    }

  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v6
    && !-[ICDocCamExtractedDocumentViewController isPageViewControllerScrolled](self, "isPageViewControllerScrolled"))
  {
    -[ICDocCamExtractedDocumentViewController setCurrentThumbnailItem:animated:](self, "setCurrentThumbnailItem:animated:", objc_msgSend(v6, "item"), 1);
    -[ICDocCamExtractedDocumentViewController showViewControllerAtIndex:animated:](self, "showViewControllerAtIndex:animated:", objc_msgSend(v6, "item"), 0);
    -[ICDocCamExtractedDocumentViewController updatePageIndicatorForPageIndex:](self, "updatePageIndicatorForPageIndex:", -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex"));
  }

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v6;
  double v7;
  CGSize result;

  -[ICDocCamExtractedDocumentViewController imageSizeForDocumentAtIndex:](self, "imageSizeForDocumentAtIndex:", objc_msgSend(a5, "item", a3, a4));
  -[ICDocCamExtractedDocumentViewController frameSizeForImageSize:](self, "frameSizeForImageSize:");
  result.height = v7;
  result.width = v6;
  return result;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  int64_t v6;

  -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "docInfos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  char v23;
  double v24;
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
  CGAffineTransform v38;
  CGAffineTransform v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("ICDocCamExtractedDocumentThumbnailCell"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "docInfos");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "docInfos");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      v15 = objc_msgSend(v7, "item");
      -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "docInfos");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count") - 1;

      if (v15 <= v18)
      {
        v21 = objc_msgSend(v7, "item");
      }
      else
      {
        -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "docInfos");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "count") - 1;

      }
      -[ICDocCamExtractedDocumentViewController delegate](self, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_opt_respondsToSelector();

      if ((v23 & 1) != 0)
      {
        objc_msgSend(v6, "bounds");
        v25 = v24;
        objc_initWeak(&location, self);
        -[ICDocCamExtractedDocumentViewController delegate](self, "delegate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "docInfos");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectAtIndexedSubscript:", v21);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = MEMORY[0x24BDAC760];
        v40[1] = 3221225472;
        v40[2] = __81__ICDocCamExtractedDocumentViewController_collectionView_cellForItemAtIndexPath___block_invoke;
        v40[3] = &unk_24C5B7E30;
        objc_copyWeak(&v42, &location);
        v41 = v8;
        objc_msgSend(v26, "extractedDocumentControllerLoadThumbnailForDocument:size:completionBlock:", v29, v40, v25, v25);

        objc_destroyWeak(&v42);
        objc_destroyWeak(&location);
      }
      else
      {
        -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "docInfos");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectAtIndexedSubscript:", v21);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "croppedAndFilteredImageUUID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        -[ICDocCamExtractedDocumentViewController imageCache](self, "imageCache");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "getImage:", v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        -[ICDocCamExtractedDocumentViewController setImage:forCell:useResizedImage:](self, "setImage:forCell:useResizedImage:", v35, v8, 1);
      }
    }
  }
  else
  {

  }
  if (objc_msgSend(MEMORY[0x24BDF6750], "dc_isRTL"))
  {
    CGAffineTransformMakeScale(&v39, -1.0, 1.0);
    objc_msgSend(v8, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v39;
    objc_msgSend(v36, "setTransform:", &v38);

  }
  return v8;
}

void __81__ICDocCamExtractedDocumentViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "setImage:forCell:useResizedImage:", v4, *(_QWORD *)(a1 + 32), 1);

}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int64_t v21;
  int64_t v22;
  uint64_t v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "item");
  v12 = objc_msgSend(v10, "item");
  if (v12 == v11)
    goto LABEL_14;
  v13 = v12;
  -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "docInfos");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "docInfos");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeObjectAtIndex:", v11);

  -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "docInfos");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "insertObject:atIndex:", v16, v13);

  v21 = -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex");
  v22 = v13;
  if (v11 != v21)
  {
    if (v11 < -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex", v13)
      && v13 >= -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex"))
    {
      v23 = -1;
    }
    else
    {
      if (v11 <= -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex")
        || v13 > -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex"))
      {
        goto LABEL_11;
      }
      v23 = 1;
    }
    v22 = -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex") + v23;
  }
  -[ICDocCamExtractedDocumentViewController setPresentationPageIndex:](self, "setPresentationPageIndex:", v22);
LABEL_11:
  -[ICDocCamExtractedDocumentViewController showViewControllerAtIndex:animated:](self, "showViewControllerAtIndex:animated:", -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex"), 0);
  -[ICDocCamExtractedDocumentViewController setCurrentThumbnailItem:animated:](self, "setCurrentThumbnailItem:animated:", -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex"), 1);
  -[ICDocCamExtractedDocumentViewController delegate](self, "delegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_opt_respondsToSelector();

  if ((v25 & 1) != 0)
  {
    -[ICDocCamExtractedDocumentViewController delegate](self, "delegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "docInfos");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectAtIndexedSubscript:", v11);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "extractedDocumentControllerDidMovePageFromIndex:toIndex:forDocument:", v11, v13, v29);

  }
  -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bumpModificationDate");

  objc_initWeak(&location, self);
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __90__ICDocCamExtractedDocumentViewController_collectionView_moveItemAtIndexPath_toIndexPath___block_invoke;
  v31[3] = &unk_24C5B7E58;
  objc_copyWeak(&v34, &location);
  v32 = v9;
  v33 = v10;
  dc_dispatchMainAfterDelay(v31, 0.5);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);
LABEL_14:

}

void __90__ICDocCamExtractedDocumentViewController_collectionView_moveItemAtIndexPath_toIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "speakAccessibilityAnnouncementForMovingItemFromIndexPath:toIndexPath:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[ICDocCamExtractedDocumentViewController thumbnailCollectionViewLayout](self, "thumbnailCollectionViewLayout");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIsScrubbing:", 1);

  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  double v10;
  int v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;

  v25 = a3;
  -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v25 && !-[ICDocCamExtractedDocumentViewController isScrollingBetweenPages](self, "isScrollingBetweenPages"))
  {
    v11 = objc_msgSend(v25, "isDragging");

    if (v11)
    {
      -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "frame");
      v14 = v13 * 0.5;
      objc_msgSend(v25, "contentOffset");
      v16 = v15 + v14;
      -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "frame");
      v19 = v18 * 0.5;
      objc_msgSend(v25, "contentOffset");
      v21 = v20 + v19;

      -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "indexPathForItemAtPoint:", v16, v21);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v23 = objc_msgSend(v9, "item");
        if (v23 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v24 = v23;
          if (v23 != -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex"))
          {
            -[ICDocCamExtractedDocumentViewController showViewControllerAtIndex:animated:](self, "showViewControllerAtIndex:animated:", v24, 0);
            -[ICDocCamExtractedDocumentViewController updatePageIndicatorForPageIndex:](self, "updatePageIndicatorForPageIndex:", v24);
          }
        }
      }
      goto LABEL_9;
    }
  }
  else
  {

  }
  -[ICDocCamExtractedDocumentViewController pageViewControllerScrollView](self, "pageViewControllerScrollView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v25;
  if (v5 == v25)
  {
    v7 = -[ICDocCamExtractedDocumentViewController isScrollingBetweenPages](self, "isScrollingBetweenPages");
    v6 = v25;
    if (v7)
    {
      v8 = objc_msgSend(v25, "effectiveUserInterfaceLayoutDirection");
      -[ICDocCamExtractedDocumentViewController thumbnailCollectionViewLayout](self, "thumbnailCollectionViewLayout");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamExtractedDocumentViewController normalizedPageViewControllerScrollPosition](self, "normalizedPageViewControllerScrollPosition");
      if (v8 == 1)
        v10 = -v10;
      objc_msgSend(v9, "setInterPageScrollPosition:", v10);
LABEL_9:

      v6 = v25;
    }
  }

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;

  v21 = a3;
  -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v21 && !a4)
  {
    -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v9 = v8 * 0.5;
    objc_msgSend(v21, "contentOffset");
    v11 = v10 + v9;
    -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v14 = v13 * 0.5;
    objc_msgSend(v21, "contentOffset");
    v16 = v15 + v14;

    -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "indexPathForItemAtPoint:", v11, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = objc_msgSend(v18, "item");
      if (v19 != -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex")
        && !UIAccessibilityIsVoiceOverRunning())
      {
        -[ICDocCamExtractedDocumentViewController showViewControllerAtIndex:animated:](self, "showViewControllerAtIndex:animated:", objc_msgSend(v18, "item"), 1);
        -[ICDocCamExtractedDocumentViewController updatePageIndicatorForPageIndex:](self, "updatePageIndicatorForPageIndex:", -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex"));
      }
    }
    -[ICDocCamExtractedDocumentViewController setCurrentThumbnailItem:animated:](self, "setCurrentThumbnailItem:animated:", -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex"), 1);
    -[ICDocCamExtractedDocumentViewController thumbnailCollectionViewLayout](self, "thumbnailCollectionViewLayout");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setIsScrubbing:", 0);

  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
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
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  v20 = a3;
  -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v20;
  if (v4 == v20)
  {
    -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v8 = v7 * 0.5;
    objc_msgSend(v20, "contentOffset");
    v10 = v9 + v8;
    -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    v13 = v12 * 0.5;
    objc_msgSend(v20, "contentOffset");
    v15 = v14 + v13;

    -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "indexPathForItemAtPoint:", v10, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = objc_msgSend(v17, "item");
      if (v18 != -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex")
        && !UIAccessibilityIsVoiceOverRunning())
      {
        -[ICDocCamExtractedDocumentViewController showViewControllerAtIndex:animated:](self, "showViewControllerAtIndex:animated:", objc_msgSend(v17, "item"), 0);
        -[ICDocCamExtractedDocumentViewController updatePageIndicatorForPageIndex:](self, "updatePageIndicatorForPageIndex:", -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex"));
      }
    }
    -[ICDocCamExtractedDocumentViewController setCurrentThumbnailItem:animated:](self, "setCurrentThumbnailItem:animated:", -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex"), 1);
    -[ICDocCamExtractedDocumentViewController thumbnailCollectionViewLayout](self, "thumbnailCollectionViewLayout");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setIsScrubbing:", 0);

    v5 = v20;
  }

}

- (void)_pageViewControllerDidFinishTransitions:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[ICDocCamExtractedDocumentViewController thumbnailCollectionViewLayout](self, "thumbnailCollectionViewLayout", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateLayout");

  -[ICDocCamExtractedDocumentViewController setIsScrollingBetweenPages:](self, "setIsScrollingBetweenPages:", 0);
  -[ICDocCamExtractedDocumentViewController setCurrentThumbnailItem:animated:](self, "setCurrentThumbnailItem:animated:", -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex"), 0);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[ICDocCamExtractedDocumentViewController documentsToUpdateWhenScrollingStops](self, "documentsToUpdateWhenScrollingStops", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[ICDocCamExtractedDocumentViewController updateDocumentImage:](self, "updateDocumentImage:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[ICDocCamExtractedDocumentViewController documentsToUpdateWhenScrollingStops](self, "documentsToUpdateWhenScrollingStops");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

}

- (void)setupAccessibilityInfo
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
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;

  -[ICDocCamExtractedDocumentViewController updateFilterButtonItemAccessibilityInfo](self, "updateFilterButtonItemAccessibilityInfo");
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Rotate"), CFSTR("Rotate"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController rotateButtonItem](self, "rotateButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v3);

  -[ICDocCamExtractedDocumentViewController rotateButtonItem](self, "rotateButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController rotateButtonItem](self, "rotateButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", v6);

  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Double-tap to rotate the scan counter-clockwise."), CFSTR("Double-tap to rotate the scan counter-clockwise."), CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController rotateButtonItem](self, "rotateButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityHint:", v8);

  -[ICDocCamExtractedDocumentViewController rotateButtonItem](self, "rotateButtonItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController rotateButtonItemForNavBar](self, "rotateButtonItemForNavBar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTitle:", v11);

  -[ICDocCamExtractedDocumentViewController rotateButtonItem](self, "rotateButtonItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accessibilityLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController rotateButtonItemForNavBar](self, "rotateButtonItemForNavBar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAccessibilityLabel:", v14);

  -[ICDocCamExtractedDocumentViewController rotateButtonItem](self, "rotateButtonItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "accessibilityHint");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController rotateButtonItemForNavBar](self, "rotateButtonItemForNavBar");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAccessibilityHint:", v17);

  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Double-tap to rename document"), CFSTR("Double-tap to rename document"), CFSTR("Localizable"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController collectionTitleButton](self, "collectionTitleButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAccessibilityHint:", v19);

  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Add scan"), CFSTR("Add scan"), CFSTR("Localizable"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController addButtonItem](self, "addButtonItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTitle:", v21);

  -[ICDocCamExtractedDocumentViewController addButtonItem](self, "addButtonItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "title");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController addButtonItem](self, "addButtonItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setAccessibilityLabel:", v24);

  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Double-tap to add a new scan to this document."), CFSTR("Double-tap to add a new scan to this document."), CFSTR("Localizable"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController addButtonItem](self, "addButtonItem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setAccessibilityHint:", v26);

  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Share"), CFSTR("Share"), CFSTR("Localizable"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController actionButtonItem](self, "actionButtonItem");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setAccessibilityLabel:", v28);

  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Double-tap to share the current scan."), CFSTR("Double-tap to share the current scan."), CFSTR("Localizable"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController actionButtonItem](self, "actionButtonItem");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setAccessibilityHint:", v30);

  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Delete scan"), CFSTR("Delete scan"), CFSTR("Localizable"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController trashButtonItem](self, "trashButtonItem");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setAccessibilityLabel:", v32);

  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Double-tap to delete the current scan."), CFSTR("Double-tap to delete the current scan."), CFSTR("Localizable"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController trashButtonItem](self, "trashButtonItem");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setAccessibilityHint:", v34);

  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Crop"), CFSTR("Crop"), CFSTR("Localizable"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController recropButtonItem](self, "recropButtonItem");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setTitle:", v36);

  -[ICDocCamExtractedDocumentViewController recropButtonItem](self, "recropButtonItem");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "title");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController recropButtonItem](self, "recropButtonItem");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setAccessibilityLabel:", v39);

  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Double-tap to crop the current scan."), CFSTR("Double-tap to crop the current scan."), CFSTR("Localizable"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController recropButtonItem](self, "recropButtonItem");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setAccessibilityHint:", v41);

  -[ICDocCamExtractedDocumentViewController recropButtonItem](self, "recropButtonItem");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "title");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController recropButtonItemForNavBar](self, "recropButtonItemForNavBar");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setTitle:", v44);

  -[ICDocCamExtractedDocumentViewController recropButtonItem](self, "recropButtonItem");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "accessibilityLabel");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController recropButtonItemForNavBar](self, "recropButtonItemForNavBar");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setAccessibilityLabel:", v47);

  -[ICDocCamExtractedDocumentViewController recropButtonItem](self, "recropButtonItem");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "accessibilityHint");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController recropButtonItemForNavBar](self, "recropButtonItemForNavBar");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setAccessibilityHint:", v50);

  -[ICDocCamExtractedDocumentViewController updateForAccessibilityDarkerSystemColors](self, "updateForAccessibilityDarkerSystemColors");
}

- (void)updateFilterButtonItemAccessibilityInfo
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Filters"), CFSTR("Filters"), CFSTR("Localizable"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController filterViewController](self, "filterViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Hide filters"), CFSTR("Hide filters"), CFSTR("Localizable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("Double-tap to hide filter options.");
  }
  else
  {
    +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Show filters"), CFSTR("Show filters"), CFSTR("Localizable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("Double-tap to choose a filter to apply to this scan.");
  }
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", v5, v5, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController filterButtonItem](self, "filterButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v13);

  -[ICDocCamExtractedDocumentViewController filterButtonItemForNavBar](self, "filterButtonItemForNavBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v13);

  -[ICDocCamExtractedDocumentViewController filterButtonItem](self, "filterButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityLabel:", v4);

  -[ICDocCamExtractedDocumentViewController filterButtonItemForNavBar](self, "filterButtonItemForNavBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityLabel:", v4);

  -[ICDocCamExtractedDocumentViewController filterButtonItem](self, "filterButtonItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessibilityHint:", v6);

  -[ICDocCamExtractedDocumentViewController filterButtonItemForNavBar](self, "filterButtonItemForNavBar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityHint:", v6);

}

- (void)updateImageViewAccessibilityForPageContentViewController:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;

  v37 = a3;
  objc_msgSend(v37, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  v6 = v5;
  objc_msgSend(v37, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "size");
  v9 = v8;

  if (v6 >= v9)
    v10 = CFSTR("portrait");
  else
    v10 = CFSTR("landscape");
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", v10, v10, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "docInfos");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICDocCamImageFilters localizedImageFilterNameForType:](ICDocCamImageFilters, "localizedImageFilterNameForType:", objc_msgSend(v14, "currentFilter"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x24BDD17C8];
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("%lu of %lu"), CFSTR("%lu of %lu"), CFSTR("Localizable"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex") + 1;
  -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "docInfos");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringWithFormat:", v17, v18, objc_msgSend(v20, "count"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Scan"), CFSTR("Scan"), CFSTR("Localizable"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "imageView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setIsAccessibilityElement:", 1);

  __DCAccessibilityStringForVariables(1, v22, v24, v25, v26, v27, v28, v29, (uint64_t)v11);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "imageView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setAccessibilityLabel:", v30);

  -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "docInfos");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "count");

  if (v34)
  {
    +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Three-finger swipe to scroll between scans."), CFSTR("Three-finger swipe to scroll between scans."), CFSTR("Localizable"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "imageView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setAccessibilityHint:", v35);

  }
}

- (BOOL)accessibilityPerformEscape
{
  -[ICDocCamExtractedDocumentViewController doneAction:](self, "doneAction:", 0);
  return 1;
}

- (void)updateForAccessibilityDarkerSystemColors
{
  void *v3;
  id v4;

  if (UIAccessibilityDarkerSystemColorsEnabled())
    -[ICDocCamExtractedDocumentViewController darkenedCollectionViewTitleTintColor](self, "darkenedCollectionViewTitleTintColor");
  else
    -[ICDocCamExtractedDocumentViewController defaultCollectionViewTitleTintColor](self, "defaultCollectionViewTitleTintColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController collectionTitleButton](self, "collectionTitleButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleColor:forState:", v4, 0);

}

- (void)speakAccessibilityAnnouncementForReorderIfNecessaryForProposedIndexPath:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = objc_msgSend(a3, "item");
  if (v4 != -[ICDocCamExtractedDocumentViewController lastAXProposedIndexForReordering](self, "lastAXProposedIndexForReordering"))
  {
    +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Position %lu"), CFSTR("Position %lu"), CFSTR("Localizable"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v6, v4 + 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v5);
    -[ICDocCamExtractedDocumentViewController setLastAXProposedIndexForReordering:](self, "setLastAXProposedIndexForReordering:", v4);

  }
}

- (void)speakAccessibilityAnnouncementForMovingItemFromIndexPath:(id)a3 toIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = objc_msgSend(a3, "item");
  v7 = objc_msgSend(v5, "item");

  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Moved item from position %lu to position %lu"), CFSTR("Moved item from position %lu to position %lu"), CFSTR("Localizable"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v9, v6 + 1, v7 + 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v8);

}

- (id)_accessibilitySpeakThisElementsAndStrings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  v12.receiver = self;
  v12.super_class = (Class)ICDocCamExtractedDocumentViewController;
  -[ICDocCamExtractedDocumentViewController _accessibilitySpeakThisElementsAndStrings](&v12, sel__accessibilitySpeakThisElementsAndStrings);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICDocCamExtractedDocumentViewController collectionTitleButton](self, "collectionTitleButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertObject:atIndex:", v7, 0);

  -[ICDocCamExtractedDocumentViewController pageIndexLabel](self, "pageIndexLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessibilityLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertObject:atIndex:", v9, 1);

  v10 = (void *)objc_msgSend(v5, "copy");
  return v10;
}

- (BOOL)accessibilityScrollRightPage
{
  int64_t v3;
  int64_t v4;

  v3 = -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex");
  v4 = v3;
  if (v3)
    -[ICDocCamExtractedDocumentViewController showViewControllerAtIndex:animated:](self, "showViewControllerAtIndex:animated:", v3 - 1, 0);
  return v4 != 0;
}

- (BOOL)accessibilityScrollLeftPage
{
  unint64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex");
  -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "docInfos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") - 1;

  if (v3 < v6)
    -[ICDocCamExtractedDocumentViewController showViewControllerAtIndex:animated:](self, "showViewControllerAtIndex:animated:", v3 + 1, 0);
  return v3 < v6;
}

- (void)thumbnailContainerViewIncrementCurrentIndex:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex", a3);
  -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "docInfos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 < objc_msgSend(v5, "count") - 1)
  {
    -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "docInfos");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (!v8)
      return;
    -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v4 + 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentViewController collectionView:didSelectItemAtIndexPath:](self, "collectionView:didSelectItemAtIndexPath:", v9, v5);
  }

}

- (void)thumbnailContainerViewDecrementCurrentIndex:(id)a3
{
  int64_t v4;
  int64_t v5;
  void *v6;
  id v7;

  v4 = -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex", a3);
  if (v4)
  {
    v5 = v4;
    -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v5 - 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentViewController collectionView:didSelectItemAtIndexPath:](self, "collectionView:didSelectItemAtIndexPath:", v7, v6);

  }
}

- (unint64_t)thumbnailContainerViewNumberOfItems:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "docInfos");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (void)thumbnailContainerView:(id)a3 moveItemFromIndex:(int64_t)a4 toIndex:(int64_t)a5
{
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (-[ICDocCamExtractedDocumentViewController thumbnailContainerViewSupportsReordering:](self, "thumbnailContainerViewSupportsReordering:", a3))
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a4, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a5, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamExtractedDocumentViewController collectionView:moveItemAtIndexPath:toIndexPath:](self, "collectionView:moveItemAtIndexPath:toIndexPath:", v9, v11, v8);

    -[ICDocCamExtractedDocumentViewController showViewControllerAtIndex:animated:](self, "showViewControllerAtIndex:animated:", a5, 0);
    -[ICDocCamExtractedDocumentViewController thumbnailCollectionView](self, "thumbnailCollectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reloadData");

  }
}

- (BOOL)thumbnailContainerViewSupportsReordering:(id)a3
{
  return -[ICDocCamExtractedDocumentViewController mode](self, "mode", a3) == 1;
}

- (BOOL)thumbnailContainerViewIsVisible:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  -[ICDocCamExtractedDocumentViewController view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "interfaceOrientation") - 3;

  -[ICDocCamExtractedDocumentViewController traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "horizontalSizeClass");

  -[ICDocCamExtractedDocumentViewController filterViewController](self, "filterViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v7 < 0xFFFFFFFFFFFFFFFELL || v9 != 1 || v10 == 0;
}

- (BOOL)thumbnailContainerViewIsVisible
{
  ICDocCamExtractedDocumentViewController *v2;
  void *v3;

  v2 = self;
  -[ICDocCamExtractedDocumentViewController thumbnailContainerView](self, "thumbnailContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[ICDocCamExtractedDocumentViewController thumbnailContainerViewIsVisible:](v2, "thumbnailContainerViewIsVisible:", v3);

  return (char)v2;
}

- (CGRect)zoomTargetForIndexPath:(id)a3
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
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  v4 = a3;
  -[ICDocCamExtractedDocumentViewController pageViewControllerContainerView](self, "pageViewControllerContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = objc_msgSend(v4, "item");
  -[ICDocCamExtractedDocumentViewController imageSizeForDocumentAtIndex:](self, "imageSizeForDocumentAtIndex:", v14);
  +[ICDocCamUtilities aspectFillSize:targetSize:](ICDocCamUtilities, "aspectFillSize:targetSize:");
  +[ICDocCamUtilities aspectFitSize:targetSize:](ICDocCamUtilities, "aspectFitSize:targetSize:");
  v16 = v15;
  v18 = v17;
  v19 = v7 + v11 * 0.5 - v15 * 0.5;
  v20 = v9 + v13 * 0.5 - v17 * 0.5;
  result.size.height = v18;
  result.size.width = v16;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)imageRectWithZoomAndPanForIndexPath:(id)a3
{
  void *v4;
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
  double v15;
  double v16;
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
  CGRect result;

  -[ICDocCamExtractedDocumentViewController currentImageView](self, "currentImageView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedDocumentViewController currentImageView](self, "currentImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[ICDocCamExtractedDocumentViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convertRect:toView:", v14, v7, v9, v11, v13);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v23 = v16;
  v24 = v18;
  v25 = v20;
  v26 = v22;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (unint64_t)documentCount
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[ICDocCamExtractedDocumentViewController documentInfoCollection](self, "documentInfoCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "docInfos");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)indexPathForCurrentDocument
{
  return (id)objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", -[ICDocCamExtractedDocumentViewController presentationPageIndex](self, "presentationPageIndex"), 0);
}

- (void)resetImageCentering
{
  id v2;

  -[ICDocCamExtractedDocumentViewController currentPageContentViewController](self, "currentPageContentViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetImageCentering");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIView)topToolbar
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_topToolbar);
}

- (void)setTopToolbar:(id)a3
{
  objc_storeWeak((id *)&self->_topToolbar, a3);
}

- (UIToolbar)bottomToolbar
{
  return (UIToolbar *)objc_loadWeakRetained((id *)&self->_bottomToolbar);
}

- (void)setBottomToolbar:(id)a3
{
  objc_storeWeak((id *)&self->_bottomToolbar, a3);
}

- (ICDocCamFilterViewController)filterViewController
{
  return self->_filterViewController;
}

- (void)setFilterViewController:(id)a3
{
  objc_storeStrong((id *)&self->_filterViewController, a3);
}

- (UIPageViewController)pageViewController
{
  return self->_pageViewController;
}

- (void)setPageViewController:(id)a3
{
  objc_storeStrong((id *)&self->_pageViewController, a3);
}

- (BOOL)statusBarWasHiddenWhenDoneTapped
{
  return self->_statusBarWasHiddenWhenDoneTapped;
}

- (void)setStatusBarWasHiddenWhenDoneTapped:(BOOL)a3
{
  self->_statusBarWasHiddenWhenDoneTapped = a3;
}

- (BOOL)statusBarWasHiddenWhenRetakeTapped
{
  return self->_statusBarWasHiddenWhenRetakeTapped;
}

- (void)setStatusBarWasHiddenWhenRetakeTapped:(BOOL)a3
{
  self->_statusBarWasHiddenWhenRetakeTapped = a3;
}

- (UIBarButtonItem)trashButtonItem
{
  return self->_trashButtonItem;
}

- (void)setTrashButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_trashButtonItem, a3);
}

- (UIBarButtonItem)rotateButtonItem
{
  return self->_rotateButtonItem;
}

- (void)setRotateButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_rotateButtonItem, a3);
}

- (UIBarButtonItem)filterButtonItem
{
  return self->_filterButtonItem;
}

- (void)setFilterButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_filterButtonItem, a3);
}

- (UIBarButtonItem)addButtonItem
{
  return self->_addButtonItem;
}

- (void)setAddButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_addButtonItem, a3);
}

- (UIBarButtonItem)actionButtonItem
{
  return self->_actionButtonItem;
}

- (void)setActionButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_actionButtonItem, a3);
}

- (UIBarButtonItem)doneButtonItem
{
  return self->_doneButtonItem;
}

- (void)setDoneButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_doneButtonItem, a3);
}

- (UIBarButtonItem)retakeButtonItem
{
  return self->_retakeButtonItem;
}

- (void)setRetakeButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_retakeButtonItem, a3);
}

- (UIBarButtonItem)filterButtonItemForNavBar
{
  return self->_filterButtonItemForNavBar;
}

- (void)setFilterButtonItemForNavBar:(id)a3
{
  objc_storeStrong((id *)&self->_filterButtonItemForNavBar, a3);
}

- (UIBarButtonItem)trashButtonItemForNavBar
{
  return self->_trashButtonItemForNavBar;
}

- (void)setTrashButtonItemForNavBar:(id)a3
{
  objc_storeStrong((id *)&self->_trashButtonItemForNavBar, a3);
}

- (UIBarButtonItem)rotateButtonItemForNavBar
{
  return self->_rotateButtonItemForNavBar;
}

- (void)setRotateButtonItemForNavBar:(id)a3
{
  objc_storeStrong((id *)&self->_rotateButtonItemForNavBar, a3);
}

- (UIBarButtonItem)recropButtonItem
{
  return self->_recropButtonItem;
}

- (void)setRecropButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_recropButtonItem, a3);
}

- (UIBarButtonItem)recropButtonItemForNavBar
{
  return self->_recropButtonItemForNavBar;
}

- (void)setRecropButtonItemForNavBar:(id)a3
{
  objc_storeStrong((id *)&self->_recropButtonItemForNavBar, a3);
}

- (BOOL)rotationUnderWay
{
  return self->_rotationUnderWay;
}

- (void)setRotationUnderWay:(BOOL)a3
{
  self->_rotationUnderWay = a3;
}

- (UILabel)pageIndexLabel
{
  return self->_pageIndexLabel;
}

- (void)setPageIndexLabel:(id)a3
{
  objc_storeStrong((id *)&self->_pageIndexLabel, a3);
}

- (UIButton)collectionTitleButton
{
  return self->_collectionTitleButton;
}

- (void)setCollectionTitleButton:(id)a3
{
  objc_storeStrong((id *)&self->_collectionTitleButton, a3);
}

- (UIView)titleViewWrapper
{
  return self->_titleViewWrapper;
}

- (void)setTitleViewWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_titleViewWrapper, a3);
}

- (UIStackView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_titleView, a3);
}

- (NSLayoutConstraint)titleViewWrapperWidthConstraint
{
  return self->_titleViewWrapperWidthConstraint;
}

- (void)setTitleViewWrapperWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleViewWrapperWidthConstraint, a3);
}

- (NSLayoutConstraint)titleViewWrapperHeightConstraint
{
  return self->_titleViewWrapperHeightConstraint;
}

- (void)setTitleViewWrapperHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleViewWrapperHeightConstraint, a3);
}

- (UIView)pageViewControllerContainerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_pageViewControllerContainerView);
}

- (void)setPageViewControllerContainerView:(id)a3
{
  objc_storeWeak((id *)&self->_pageViewControllerContainerView, a3);
}

- (int64_t)presentationPageIndex
{
  return self->_presentationPageIndex;
}

- (UICollectionViewController)thumbnailCollectionViewController
{
  return self->_thumbnailCollectionViewController;
}

- (void)setThumbnailCollectionViewController:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailCollectionViewController, a3);
}

- (UICollectionView)thumbnailCollectionView
{
  return self->_thumbnailCollectionView;
}

- (void)setThumbnailCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailCollectionView, a3);
}

- (ICDocCamExtractedThumbnailContainerView)thumbnailContainerView
{
  return self->_thumbnailContainerView;
}

- (void)setThumbnailContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailContainerView, a3);
}

- (UIBarButtonItem)thumbnailContainerViewItem
{
  return self->_thumbnailContainerViewItem;
}

- (void)setThumbnailContainerViewItem:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailContainerViewItem, a3);
}

- (int)mode
{
  return self->_mode;
}

- (void)setMode:(int)a3
{
  self->_mode = a3;
}

- (ICDocCamDocumentInfoCollection)documentInfoCollection
{
  return self->_documentInfoCollection;
}

- (void)setDocumentInfoCollection:(id)a3
{
  objc_storeStrong((id *)&self->_documentInfoCollection, a3);
}

- (ICDocCamImageCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_imageCache, a3);
}

- (UILongPressGestureRecognizer)imageLongPressGestureRecognizer
{
  return self->_imageLongPressGestureRecognizer;
}

- (void)setImageLongPressGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_imageLongPressGestureRecognizer, a3);
}

- (UILongPressGestureRecognizer)thumbnailLongPressGestureRecognizer
{
  return self->_thumbnailLongPressGestureRecognizer;
}

- (void)setThumbnailLongPressGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailLongPressGestureRecognizer, a3);
}

- (NSIndexPath)movingIndexPath
{
  return self->_movingIndexPath;
}

- (void)setMovingIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_movingIndexPath, a3);
}

- (double)movingXPosition
{
  return self->_movingXPosition;
}

- (void)setMovingXPosition:(double)a3
{
  self->_movingXPosition = a3;
}

- (double)movingYPosition
{
  return self->_movingYPosition;
}

- (void)setMovingYPosition:(double)a3
{
  self->_movingYPosition = a3;
}

- (CGRect)menuControllerTargetRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_menuControllerTargetRect.origin.x;
  y = self->_menuControllerTargetRect.origin.y;
  width = self->_menuControllerTargetRect.size.width;
  height = self->_menuControllerTargetRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setMenuControllerTargetRect:(CGRect)a3
{
  self->_menuControllerTargetRect = a3;
}

- (ICDocCamExtractedDocumentControllerDelegate)delegate
{
  return (ICDocCamExtractedDocumentControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIAlertController)editTitleAlert
{
  return (UIAlertController *)objc_loadWeakRetained((id *)&self->_editTitleAlert);
}

- (void)setEditTitleAlert:(id)a3
{
  objc_storeWeak((id *)&self->_editTitleAlert, a3);
}

- (void)setSharedCoreImageContext:(id)a3
{
  objc_storeStrong((id *)&self->_sharedCoreImageContext, a3);
}

- (CGSize)previousViewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_previousViewSize.width;
  height = self->_previousViewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreviousViewSize:(CGSize)a3
{
  self->_previousViewSize = a3;
}

- (BOOL)isScrollingBetweenPages
{
  return self->_isScrollingBetweenPages;
}

- (UIScrollView)pageViewControllerScrollView
{
  return self->_pageViewControllerScrollView;
}

- (void)setPageViewControllerScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_pageViewControllerScrollView, a3);
}

- (NSMutableArray)documentsToUpdateWhenScrollingStops
{
  return self->_documentsToUpdateWhenScrollingStops;
}

- (void)setDocumentsToUpdateWhenScrollingStops:(id)a3
{
  objc_storeStrong((id *)&self->_documentsToUpdateWhenScrollingStops, a3);
}

- (int64_t)lastAXProposedIndexForReordering
{
  return self->_lastAXProposedIndexForReordering;
}

- (void)setLastAXProposedIndexForReordering:(int64_t)a3
{
  self->_lastAXProposedIndexForReordering = a3;
}

- (BOOL)barsShouldBeHidden
{
  return self->_barsShouldBeHidden;
}

- (void)setBarsShouldBeHidden:(BOOL)a3
{
  self->_barsShouldBeHidden = a3;
}

- (BOOL)cameraRestricted
{
  return self->_cameraRestricted;
}

- (void)setCameraRestricted:(BOOL)a3
{
  self->_cameraRestricted = a3;
}

- (NSLayoutConstraint)pageViewLeadingConstraint
{
  return self->_pageViewLeadingConstraint;
}

- (void)setPageViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_pageViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)pageViewTrailingConstraint
{
  return self->_pageViewTrailingConstraint;
}

- (void)setPageViewTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_pageViewTrailingConstraint, a3);
}

- (NSLayoutConstraint)pageViewTopConstraint
{
  return self->_pageViewTopConstraint;
}

- (void)setPageViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_pageViewTopConstraint, a3);
}

- (NSLayoutConstraint)pageViewBottomConstraint
{
  return self->_pageViewBottomConstraint;
}

- (void)setPageViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_pageViewBottomConstraint, a3);
}

- (BOOL)adjustPageViewControllerForMarkup
{
  return self->_adjustPageViewControllerForMarkup;
}

- (void)setAdjustPageViewControllerForMarkup:(BOOL)a3
{
  self->_adjustPageViewControllerForMarkup = a3;
}

- (BOOL)isAnimatingPageViewController
{
  return self->_isAnimatingPageViewController;
}

- (void)setIsAnimatingPageViewController:(BOOL)a3
{
  self->_isAnimatingPageViewController = a3;
}

- (UIAccessibilityHUDItem)hudItemForAccessibilityLargerText
{
  return self->_hudItemForAccessibilityLargerText;
}

- (void)setHudItemForAccessibilityLargerText:(id)a3
{
  objc_storeStrong((id *)&self->_hudItemForAccessibilityLargerText, a3);
}

- (UILongPressGestureRecognizer)axHUDLongPressGestureRecognizer
{
  return self->_axHUDLongPressGestureRecognizer;
}

- (void)setAxHUDLongPressGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_axHUDLongPressGestureRecognizer, a3);
}

- (BOOL)layoutHasHappened
{
  return self->_layoutHasHappened;
}

- (void)setLayoutHasHappened:(BOOL)a3
{
  self->_layoutHasHappened = a3;
}

- (UIColor)defaultCollectionViewTitleTintColor
{
  return self->_defaultCollectionViewTitleTintColor;
}

- (void)setDefaultCollectionViewTitleTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_defaultCollectionViewTitleTintColor, a3);
}

- (UIColor)darkenedCollectionViewTitleTintColor
{
  return self->_darkenedCollectionViewTitleTintColor;
}

- (void)setDarkenedCollectionViewTitleTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_darkenedCollectionViewTitleTintColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkenedCollectionViewTitleTintColor, 0);
  objc_storeStrong((id *)&self->_defaultCollectionViewTitleTintColor, 0);
  objc_storeStrong((id *)&self->_axHUDLongPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_hudItemForAccessibilityLargerText, 0);
  objc_storeStrong((id *)&self->_pageViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_pageViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_pageViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_pageViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_documentsToUpdateWhenScrollingStops, 0);
  objc_storeStrong((id *)&self->_pageViewControllerScrollView, 0);
  objc_storeStrong((id *)&self->_sharedCoreImageContext, 0);
  objc_destroyWeak((id *)&self->_editTitleAlert);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_movingIndexPath, 0);
  objc_storeStrong((id *)&self->_thumbnailLongPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_imageLongPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_documentInfoCollection, 0);
  objc_storeStrong((id *)&self->_thumbnailContainerViewItem, 0);
  objc_storeStrong((id *)&self->_thumbnailContainerView, 0);
  objc_storeStrong((id *)&self->_thumbnailCollectionView, 0);
  objc_storeStrong((id *)&self->_thumbnailCollectionViewController, 0);
  objc_destroyWeak((id *)&self->_pageViewControllerContainerView);
  objc_storeStrong((id *)&self->_titleViewWrapperHeightConstraint, 0);
  objc_storeStrong((id *)&self->_titleViewWrapperWidthConstraint, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_titleViewWrapper, 0);
  objc_storeStrong((id *)&self->_collectionTitleButton, 0);
  objc_storeStrong((id *)&self->_pageIndexLabel, 0);
  objc_storeStrong((id *)&self->_recropButtonItemForNavBar, 0);
  objc_storeStrong((id *)&self->_recropButtonItem, 0);
  objc_storeStrong((id *)&self->_rotateButtonItemForNavBar, 0);
  objc_storeStrong((id *)&self->_trashButtonItemForNavBar, 0);
  objc_storeStrong((id *)&self->_filterButtonItemForNavBar, 0);
  objc_storeStrong((id *)&self->_retakeButtonItem, 0);
  objc_storeStrong((id *)&self->_doneButtonItem, 0);
  objc_storeStrong((id *)&self->_actionButtonItem, 0);
  objc_storeStrong((id *)&self->_addButtonItem, 0);
  objc_storeStrong((id *)&self->_filterButtonItem, 0);
  objc_storeStrong((id *)&self->_rotateButtonItem, 0);
  objc_storeStrong((id *)&self->_trashButtonItem, 0);
  objc_storeStrong((id *)&self->_pageViewController, 0);
  objc_storeStrong((id *)&self->_filterViewController, 0);
  objc_destroyWeak((id *)&self->_bottomToolbar);
  objc_destroyWeak((id *)&self->_topToolbar);
}

- (void)orientationRotated90DegreesFromOrientation:.cold.1()
{
  __assert_rtn("-[ICDocCamExtractedDocumentViewController orientationRotated90DegreesFromOrientation:]", "ICDocCamExtractedDocumentViewController.m", 1249, "0");
}

- (void)orientationString:.cold.1()
{
  __assert_rtn("-[ICDocCamExtractedDocumentViewController orientationString:]", "ICDocCamExtractedDocumentViewController.m", 1570, "0");
}

- (void)filterButtonAction:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "scanDataDelegateIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_20CE8E000, a2, OS_LOG_TYPE_ERROR, "Unable to find images when trying to open filter view controller for scanDataDelegate %@", (uint8_t *)&v4, 0xCu);

}

@end
