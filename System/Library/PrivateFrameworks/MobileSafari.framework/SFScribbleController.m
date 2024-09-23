@implementation SFScribbleController

- (SFScribbleController)initWithWebView:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  SFScribbleController *v8;
  SFScribbleController *v9;
  uint64_t v10;
  WBSScribbleController *elementController;
  SFScribbleOverlay *v12;
  SFScribbleOverlay *overlay;
  uint64_t v14;
  SFScribbleController *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)SFScribbleController;
  v8 = -[SFScribbleController init](&v22, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v7);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D8AC18]), "initWithWebView:", v6);
    elementController = v9->_elementController;
    v9->_elementController = (WBSScribbleController *)v10;

    -[WBSScribbleController setDelegate:](v9->_elementController, "setDelegate:", v9);
    v12 = objc_alloc_init(SFScribbleOverlay);
    overlay = v9->_overlay;
    v9->_overlay = v12;

    objc_storeWeak((id *)&v9->_webView, v6);
    objc_initWeak(&location, v9);
    v14 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __49__SFScribbleController_initWithWebView_delegate___block_invoke;
    v19[3] = &unk_1E21E72A0;
    objc_copyWeak(&v20, &location);
    -[SFScribbleOverlay setSelectionHandler:](v9->_overlay, "setSelectionHandler:", v19);
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __49__SFScribbleController_initWithWebView_delegate___block_invoke_2;
    v17[3] = &unk_1E21E2AE8;
    objc_copyWeak(&v18, &location);
    -[SFScribbleOverlay setTapHandler:](v9->_overlay, "setTapHandler:", v17);
    v15 = v9;
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __49__SFScribbleController_initWithWebView_delegate___block_invoke(uint64_t a1, double a2, double a3)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_selectionDidMoveToLocation:", a2, a3);

}

void __49__SFScribbleController_initWithWebView_delegate___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_hideSelectedElement");

}

- (CGImage)_imageForScribbleAnimationWithElementFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id WeakRetained;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  CGImage *v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  -[SFScribbleController _frameForElementFrame:inCoordinateSpace:](self, "_frameForElementFrame:inCoordinateSpace:", WeakRetained, x, y, width, height);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(WeakRetained, "safari_snapshotImageFromIOSurfaceInRect:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0D8AC20];
  v19 = objc_retainAutorelease(v17);
  v20 = objc_msgSend(v19, "CGImage");
  objc_msgSend(WeakRetained, "bounds");
  v22 = v21;
  v24 = v23;
  objc_msgSend(WeakRetained, "traitCollection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "displayScale");
  v27 = (CGImage *)objc_msgSend(v18, "imageForScribbleEffectWithElementSnapshot:elementFrame:webViewSize:webViewScale:", v20, v10, v12, v14, v16, v22, v24, v26);

  return v27;
}

- (void)_runScribbleAnimationInFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id WeakRetained;
  CGImage *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  v9 = -[SFScribbleController _imageForScribbleAnimationWithElementFrame:](self, "_imageForScribbleAnimationWithElementFrame:", x, y, width, height);
  v10 = objc_alloc(MEMORY[0x1E0D8AC20]);
  objc_msgSend(WeakRetained, "bounds");
  objc_msgSend(WeakRetained, "convertRect:toView:", self->_overlay);
  v11 = (void *)objc_msgSend(v10, "initWithImage:frame:", v9);
  CGImageRelease(v9);
  -[SFScribbleOverlay insertSubview:atIndex:](self->_overlay, "insertSubview:atIndex:", v11, 0);
  objc_initWeak(&location, self);
  -[WBSScribbleController setElementSelectionEnabled:](self->_elementController, "setElementSelectionEnabled:", 0);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __53__SFScribbleController__runScribbleAnimationInFrame___block_invoke;
  v15 = &unk_1E21E2AE8;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v11, "startEffectWithCompletion:", &v12);
  objc_msgSend(MEMORY[0x1E0D8AC20], "prewarm", v12, v13, v14, v15);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __53__SFScribbleController__runScribbleAnimationInFrame___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[1], "setElementSelectionEnabled:", 1);
    WeakRetained = v2;
  }

}

- (BOOL)isScribbling
{
  return -[WBSScribbleController isScribbling](self->_elementController, "isScribbling");
}

- (BOOL)canEnableScribble
{
  return -[WBSScribbleController canHideContentInWebView](self->_elementController, "canHideContentInWebView");
}

- (void)_endScribblingAndSaveChanges:(BOOL)a3
{
  _BOOL8 v3;
  NSValue *pendingSelectionLocation;
  SFScribbleOverlay *overlay;
  id WeakRetained;
  _QWORD v8[5];

  v3 = a3;
  if (-[WBSScribbleController isScribbling](self->_elementController, "isScribbling"))
  {
    if (!self->_userInitiatedScribblingDisabled)
    {
      pendingSelectionLocation = self->_pendingSelectionLocation;
      self->_pendingSelectionLocation = 0;

      overlay = self->_overlay;
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __53__SFScribbleController__endScribblingAndSaveChanges___block_invoke;
      v8[3] = &unk_1E21E2050;
      v8[4] = self;
      -[SFScribbleOverlay endSelectionWithCompletion:](overlay, "endSelectionWithCompletion:", v8);
      -[WBSScribbleController endScribblingAndSaveChanges:](self->_elementController, "endScribblingAndSaveChanges:", v3);
      objc_msgSend(MEMORY[0x1E0D8AC20], "discardPrewarmedContent");
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "sfScribbleControllerDidEndScribbling:", self);

    }
  }
}

uint64_t __53__SFScribbleController__endScribblingAndSaveChanges___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeFromSuperview");
}

- (unint64_t)hiddenElementCount
{
  return -[WBSScribbleController numberOfAllHiddenElements](self->_elementController, "numberOfAllHiddenElements");
}

- (void)startScribbling
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;

  if ((-[WBSScribbleController isScribbling](self->_elementController, "isScribbling") & 1) == 0
    && !self->_userInitiatedScribblingDisabled)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("didShowDistractionControlEducationalAlertKey"));

    if (v4)
    {
      -[SFScribbleController _startScribbling](self, "_startScribbling");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBool:forKey:", 1, CFSTR("didShowDistractionControlEducationalAlertKey"));

      objc_initWeak(&location, self);
      v6 = (void *)MEMORY[0x1E0DC3450];
      _WBSLocalizedString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      _WBSLocalizedString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v7, v8, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (void *)MEMORY[0x1E0DC3448];
      _WBSLocalizedString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __39__SFScribbleController_startScribbling__block_invoke;
      v17 = &unk_1E21E72C8;
      objc_copyWeak(&v18, &location);
      objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 0, &v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addAction:", v12, v14, v15, v16, v17);

      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "sfScribbleController:presentAlert:", self, v9);

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }
}

void __39__SFScribbleController_startScribbling__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_startScribbling");
    WeakRetained = v2;
  }

}

- (void)_startScribbling
{
  WBSScribbleController *elementController;
  _QWORD v4[4];
  id v5;
  id location;

  if ((-[WBSScribbleController isScribbling](self->_elementController, "isScribbling") & 1) == 0
    && !self->_userInitiatedScribblingDisabled)
  {
    objc_initWeak(&location, self);
    elementController = self->_elementController;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __40__SFScribbleController__startScribbling__block_invoke;
    v4[3] = &unk_1E21E72F0;
    objc_copyWeak(&v5, &location);
    -[WBSScribbleController startScribblingWithCompletionHandler:](elementController, "startScribblingWithCompletionHandler:", v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __40__SFScribbleController__startScribbling__block_invoke(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  id *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id *v19;

  if (a2)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
    v3 = WeakRetained;
    if (WeakRetained)
    {
      v19 = WeakRetained;
      v4 = objc_loadWeakRetained(WeakRetained + 4);
      v5 = objc_loadWeakRetained(v19 + 6);
      objc_msgSend(v5, "scrollView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "overlayContainerViewForScribbleController:", v19);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      if (v7)
        v9 = (void *)v7;
      else
        v9 = v6;
      v10 = v9;

      objc_msgSend(v10, "addSubview:", v19[5]);
      objc_msgSend(v6, "bounds");
      objc_msgSend(v10, "convertRect:fromView:", v6);
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;

      objc_msgSend(v19[5], "setFrame:", v12, v14, v16, v18);
      objc_msgSend(MEMORY[0x1E0D8AC20], "prewarm");
      objc_msgSend(v4, "sfScribbleControllerDidStartScribbling:", v19);

      v3 = v19;
    }

  }
}

- (void)reloadData
{
  void *v3;
  void *v4;
  id WeakRetained;

  if (-[WBSScribbleController isScribbling](self->_elementController, "isScribbling"))
    -[SFScribbleController _endScribblingAndSaveChanges:](self, "_endScribblingAndSaveChanges:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  objc_msgSend(WeakRetained, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFScribbleController updateUserDefinedContentBlockerWithHost:](self, "updateUserDefinedContentBlockerWithHost:", v4);

}

- (void)reloadWithoutScribbleElements
{
  -[WBSScribbleController reloadWithoutScribbleElements](self->_elementController, "reloadWithoutScribbleElements");
}

- (void)clearEdits
{
  id WeakRetained;
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
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "sfScribbleControllerDidEndScribbling:", self);
  if (-[SFScribbleController hiddenElementCount](self, "hiddenElementCount") > 1)
  {
    objc_initWeak(&location, self);
    v4 = (void *)MEMORY[0x1E0DC3450];
    _WBSLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", 0, v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0DC3448];
    _WBSLocalizedString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __34__SFScribbleController_clearEdits__block_invoke;
    v16 = &unk_1E21E72C8;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 2, &v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v9, v13, v14, v15, v16);

    v10 = (void *)MEMORY[0x1E0DC3448];
    _WBSLocalizedString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v12);

    objc_msgSend(WeakRetained, "sfScribbleController:presentAlert:", self, v6);
    objc_destroyWeak(&v17);

    objc_destroyWeak(&location);
  }
  else
  {
    -[WBSScribbleController clearAllEdits](self->_elementController, "clearAllEdits");
  }

}

void __34__SFScribbleController_clearEdits__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[1], "clearAllEdits");
    WeakRetained = v2;
  }

}

- (void)_hideSelectedElement
{
  void *v3;
  void *v4;

  -[SFScribbleOverlay endSelection](self->_overlay, "endSelection");
  -[WBSScribbleController selectedScribbleElement](self->_elementController, "selectedScribbleElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WBSScribbleController selectedScribbleElement](self->_elementController, "selectedScribbleElement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "geometry");
    -[SFScribbleController _runScribbleAnimationInFrame:](self, "_runScribbleAnimationInFrame:");

    -[WBSScribbleController hideSelectedElement](self->_elementController, "hideSelectedElement");
  }
}

- (BOOL)isPrivateBrowsing
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = objc_msgSend(WeakRetained, "isPrivateBrowsing");

  return v3;
}

- (NSArray)normalBrowsingUserContentControllers
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "normalBrowsingUserContentControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (WBSScribbleQuirksManager)scribbleQuirksManager
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "scribbleQuirksManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WBSScribbleQuirksManager *)v3;
}

- (WBSUserDefinedContentBlockerManager)userDefinedContentBlockerManager
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_msgSend(WeakRetained, "isPrivateBrowsing"))
    objc_msgSend(WeakRetained, "privateBrowsingUserDefinedContentBlockerManager");
  else
    objc_msgSend(WeakRetained, "normalBrowsingUserDefinedContentBlockerManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WBSUserDefinedContentBlockerManager *)v3;
}

- (void)scribbleController:(id)a3 didUpdateSelectedElement:(id)a4 withError:(id)a5
{
  -[SFScribbleController _setSelectedElement:](self, "_setSelectedElement:", a4);
  -[SFScribbleController _performPendingSelectionRequestIfNeeded](self, "_performPendingSelectionRequestIfNeeded");
}

- (void)scribbleControllerDidUpdateHiddenElementCount:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "sfScribbleControllerDidUpdateHiddenElementCount:", self);

}

- (CGImage)scribbleController:(id)a3 snapshotForElement:(id)a4
{
  WKWebView **p_webView;
  id v6;
  id WeakRetained;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  CGImage *v17;

  p_webView = &self->_webView;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_webView);
  objc_msgSend(v6, "geometry");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[SFScribbleController _frameForElementFrame:inCoordinateSpace:](self, "_frameForElementFrame:inCoordinateSpace:", WeakRetained, v9, v11, v13, v15);
  objc_msgSend(WeakRetained, "safari_snapshotImageFromIOSurfaceInRect:");
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17 = (CGImage *)objc_msgSend(v16, "CGImage");

  return v17;
}

- (void)updateUserDefinedContentBlockerWithHost:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    -[SFScribbleController userDefinedContentBlockerManager](self, "userDefinedContentBlockerManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasContentBlockerWithActions");

    if (v5)
      -[WBSScribbleController loadContentBlockerForHost:](self->_elementController, "loadContentBlockerForHost:", v6);
  }

}

- (void)scheduleValidationForHiddenElementsIfNeeded
{
  -[WBSScribbleController startValidatingHiddenElements](self->_elementController, "startValidatingHiddenElements");
}

- (CGRect)_frameForElementFrame:(CGRect)a3 inCoordinateSpace:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[SFScribbleController _frameForElementFrame:inCoordinateSpace:withOutset:](self, "_frameForElementFrame:inCoordinateSpace:withOutset:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)_frameForElementFrame:(CGRect)a3 inCoordinateSpace:(id)a4 withOutset:(double)a5
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  WKWebView **p_webView;
  id v11;
  id WeakRetained;
  double MinX;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
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
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect result;
  CGRect v55;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_webView = &self->_webView;
  v11 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_webView);
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = width;
  v48.size.height = height;
  MinX = CGRectGetMinX(v48);
  v49.origin.x = x;
  v49.origin.y = y;
  v49.size.width = width;
  v49.size.height = height;
  objc_msgSend(WeakRetained, "_convertPointFromContentsToView:", MinX, CGRectGetMinY(v49));
  v15 = v14;
  v17 = v16;
  objc_msgSend(WeakRetained, "scrollView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "zoomScale");
  v50.size.width = width * v19;
  v50.size.height = height * v19;
  v50.origin.x = v15;
  v50.origin.y = v17;
  v51 = CGRectInset(v50, -a5, -a5);
  v20 = v51.origin.x;
  v21 = v51.origin.y;
  v22 = v51.size.width;
  v23 = v51.size.height;
  objc_msgSend(WeakRetained, "bounds");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  objc_msgSend(WeakRetained, "_obscuredInsets");
  v55.origin.x = v25 + v32;
  v55.origin.y = v27 + v33;
  v55.size.width = v29 - (v32 + v34);
  v55.size.height = v31 - (v33 + v35);
  v52.origin.x = v20;
  v52.origin.y = v21;
  v52.size.width = v22;
  v52.size.height = v23;
  v53 = CGRectIntersection(v52, v55);
  objc_msgSend(WeakRetained, "convertRect:toCoordinateSpace:", v11, v53.origin.x, v53.origin.y, v53.size.width, v53.size.height);
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v43 = v42;

  v44 = v37;
  v45 = v39;
  v46 = v41;
  v47 = v43;
  result.size.height = v47;
  result.size.width = v46;
  result.origin.y = v45;
  result.origin.x = v44;
  return result;
}

- (CGPoint)_offsetForObscuredInsets
{
  id WeakRetained;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  objc_msgSend(WeakRetained, "_convertPointFromViewToContents:", 0.0, 0.0);
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)_selectionDidMoveToLocation:(CGPoint)a3
{
  double y;
  double x;
  id WeakRetained;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  NSValue *v20;
  NSValue *pendingSelectionLocation;
  _QWORD v22[2];

  y = a3.y;
  x = a3.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  -[SFScribbleController _offsetForObscuredInsets](self, "_offsetForObscuredInsets");
  v8 = v7;
  v10 = v9;
  objc_msgSend(WeakRetained, "convertPoint:fromView:", self->_overlay, x, y);
  objc_msgSend(WeakRetained, "_convertPointFromViewToContents:");
  v12 = v11 - v8;
  v14 = v13 - v10;
  objc_msgSend(WeakRetained, "scrollView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "zoomScale");
  v17 = v16;

  v18 = v12 * v17;
  v19 = v14 * v17;
  if (-[WBSScribbleController hasPendingRequest](self->_elementController, "hasPendingRequest"))
  {
    *(double *)v22 = v18;
    *(double *)&v22[1] = v19;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v22, "{CGPoint=dd}");
    v20 = (NSValue *)objc_claimAutoreleasedReturnValue();
    pendingSelectionLocation = self->_pendingSelectionLocation;
    self->_pendingSelectionLocation = v20;

  }
  else
  {
    -[SFScribbleController _updateScribbleControllerForElementAtPoint:](self, "_updateScribbleControllerForElementAtPoint:", v18, v19);
  }

}

- (void)_updateScribbleControllerForElementAtPoint:(CGPoint)a3
{
  -[WBSScribbleController updateSelectionToPoint:](self->_elementController, "updateSelectionToPoint:", a3.x, a3.y);
}

- (void)updateCountForElementsHiddenByPaintingAvoidance
{
  -[WBSScribbleController updateCountForElementsHiddenByPaintingAvoidance](self->_elementController, "updateCountForElementsHiddenByPaintingAvoidance");
}

- (void)_performPendingSelectionRequestIfNeeded
{
  NSValue *pendingSelectionLocation;
  NSValue *v4;
  int v5;
  NSValue *v6;

  v6 = self->_pendingSelectionLocation;
  pendingSelectionLocation = self->_pendingSelectionLocation;
  self->_pendingSelectionLocation = 0;

  v4 = v6;
  if (v6)
  {
    v5 = -[WBSScribbleController isScribbling](self->_elementController, "isScribbling");
    v4 = v6;
    if (v5)
    {
      -[NSValue CGPointValue](v6, "CGPointValue");
      -[SFScribbleController _updateScribbleControllerForElementAtPoint:](self, "_updateScribbleControllerForElementAtPoint:");
      v4 = v6;
    }
  }

}

- (void)_setSelectedElement:(id)a3
{
  if (a3)
  {
    objc_msgSend(a3, "geometry");
    -[SFScribbleController _frameForElementFrame:inCoordinateSpace:withOutset:](self, "_frameForElementFrame:inCoordinateSpace:withOutset:", self->_overlay);
    -[SFScribbleOverlay moveSelectionToFrame:](self->_overlay, "moveSelectionToFrame:");
  }
  else
  {
    -[SFScribbleOverlay endSelection](self->_overlay, "endSelection");
  }
}

- (id)_cancelActionForURLFieldOverlay
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v3 = (void *)MEMORY[0x1E0DC3428];
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__SFScribbleController__cancelActionForURLFieldOverlay__block_invoke;
  v7[3] = &unk_1E21E7318;
  v7[4] = self;
  objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", v4, 0, 0, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __55__SFScribbleController__cancelActionForURLFieldOverlay__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endScribblingAndSaveChanges:", 0);
}

- (id)_doneAction
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v3 = (void *)MEMORY[0x1E0DC3428];
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__SFScribbleController__doneAction__block_invoke;
  v7[3] = &unk_1E21E7318;
  v7[4] = self;
  objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", v4, 0, 0, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __35__SFScribbleController__doneAction__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endScribblingAndSaveChanges:", 1);
}

- (SFURLFieldOverlayConfiguration)urlFieldOverlayConfiguration
{
  SFURLFieldOverlayConfiguration *v3;
  void *v4;

  v3 = -[SFURLFieldOverlayConfiguration initWithIdentifier:]([SFURLFieldOverlayConfiguration alloc], "initWithIdentifier:", CFSTR("scribble"));
  -[SFScribbleController _setCommonPropertiesToConfiguration:](self, "_setCommonPropertiesToConfiguration:", v3);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("eye.slash.fill"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFURLFieldOverlayConfiguration setIcon:](v3, "setIcon:", v4);

  -[SFURLFieldOverlayConfiguration setPrefersSecondaryText:](v3, "setPrefersSecondaryText:", 1);
  return v3;
}

- (SFURLFieldOverlayConfiguration)urlFieldOverlayNarrowConfiguration
{
  SFURLFieldOverlayConfiguration *v3;

  v3 = -[SFURLFieldOverlayConfiguration initWithIdentifier:]([SFURLFieldOverlayConfiguration alloc], "initWithIdentifier:", CFSTR("scribbleNarrow"));
  -[SFScribbleController _setCommonPropertiesToConfiguration:](self, "_setCommonPropertiesToConfiguration:", v3);
  -[SFURLFieldOverlayConfiguration setPlaceFirstButtonInLeadingEdge:](v3, "setPlaceFirstButtonInLeadingEdge:", 1);
  -[SFURLFieldOverlayConfiguration setShouldTextShrinkToFit:](v3, "setShouldTextShrinkToFit:", 1);
  return v3;
}

- (void)_setCommonPropertiesToConfiguration:(id)a3
{
  void *v4;
  id v5;
  SFURLFieldOverlayButtonItem *v6;
  void *v7;
  SFURLFieldOverlayButtonItem *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(SFURLFieldOverlayButtonItem);
  -[SFScribbleController _cancelActionForURLFieldOverlay](self, "_cancelActionForURLFieldOverlay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFURLFieldOverlayButtonItem setAction:](v6, "setAction:", v7);

  -[SFURLFieldOverlayButtonItem setTheme:](v6, "setTheme:", 0);
  objc_msgSend(v18, "addObject:", v6);

  v8 = objc_alloc_init(SFURLFieldOverlayButtonItem);
  -[SFScribbleController _doneAction](self, "_doneAction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFURLFieldOverlayButtonItem setAction:](v8, "setAction:", v9);

  if (-[WBSScribbleController numberOfChangesFromCurrentSession](self->_elementController, "numberOfChangesFromCurrentSession"))
  {
    v10 = 1;
  }
  else
  {
    v10 = 2;
  }
  -[SFURLFieldOverlayButtonItem setTheme:](v8, "setTheme:", v10);
  objc_msgSend(v18, "addObject:", v8);

  v11 = (void *)objc_msgSend(v18, "copy");
  objc_msgSend(v5, "setButtonItems:", v11);

  -[SFScribbleController _urlFieldOverlayText](self, "_urlFieldOverlayText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecondaryText:", v12);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setThemeColor:", v13);

  objc_msgSend(v5, "setUserInterfaceStyle:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrimaryTextColor:", v14);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecondaryTextColor:", v15);

  objc_msgSend(MEMORY[0x1E0DC3658], "sf_colorNamed:", CFSTR("ScribbleDoneButtonColor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProminentButtonBackgroundColor:", v16);

  objc_msgSend(MEMORY[0x1E0DC3658], "sf_colorNamed:", CFSTR("ScribbleTextColor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProminentButtonTextColor:", v17);

}

- (id)_urlFieldOverlayText
{
  void *v3;
  void *v4;
  void *v5;

  if (-[WBSScribbleController numberOfChangesFromCurrentSession](self->_elementController, "numberOfChangesFromCurrentSession"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringWithFormat:", v4, -[WBSScribbleController numberOfChangesFromCurrentSession](self->_elementController, "numberOfChangesFromCurrentSession"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _WBSLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)setWebView:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_webView, obj);
    -[SFScribbleController _endScribblingAndSaveChanges:](self, "_endScribblingAndSaveChanges:", 0);
    v5 = obj;
  }

}

- (void)openFeedbackAppForScribbleReportForWebView:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *MEMORY[0x1E0D8A3A0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openURL:withOptions:", v3, 0);

}

- (SFScribbleControllerDelegate)delegate
{
  return (SFScribbleControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SFScribbleOverlay)overlay
{
  return self->_overlay;
}

- (WKWebView)webView
{
  return (WKWebView *)objc_loadWeakRetained((id *)&self->_webView);
}

- (BOOL)userInitiatedScribblingDisabled
{
  return self->_userInitiatedScribblingDisabled;
}

- (void)setUserInitiatedScribblingDisabled:(BOOL)a3
{
  self->_userInitiatedScribblingDisabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_webView);
  objc_storeStrong((id *)&self->_overlay, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pendingSelectionLocation, 0);
  objc_storeStrong((id *)&self->_elementController, 0);
}

@end
