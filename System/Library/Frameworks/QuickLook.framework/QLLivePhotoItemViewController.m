@implementation QLLivePhotoItemViewController

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v6 = a3;
  v7 = a5;
  v8 = v6;
  objc_msgSend(v8, "size");
  if (v8)
  {
    v10 = v8;
    v11 = v7;
    QLRunInMainThread();

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.quicklook.livePhotoItemViewController"), 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v9);

  }
}

uint64_t __93__QLLivePhotoItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke(uint64_t a1, double a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _BYTE *v7;
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
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
  _QWORD *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  _QWORD *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t result;
  const __CFString *v58;
  void *v59;
  const __CFString *v60;
  _QWORD v61[2];

  v61[1] = *MEMORY[0x24BDAC8D0];
  gotLoadHelper_x23__OBJC_CLASS___PHLivePhotoView(a2);
  v4 = objc_opt_new();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 1152);
  *(_QWORD *)(v5 + 1152) = v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1152), "setDelegate:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1152), "setLivePhoto:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1152), "setAccessibilityIdentifier:", CFSTR("QLLivePhotoViewControllerLivePhotoViewAccessibilityIdentifier"));
  v7 = *(_BYTE **)(a1 + 32);
  if (v7[1197])
    objc_msgSend(v7, "animateToPreferredDynamicRange");
  else
    objc_msgSend(v7, "updatePreferredDynamicRangeForced:", 0);
  v8 = (_QWORD *)(*(_QWORD *)(a1 + 32) + 1136);
  objc_msgSend(*(id *)(a1 + 40), "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "size");
  *v8 = v10;
  v8[1] = v11;

  objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:", *(double *)(*(_QWORD *)(a1 + 32) + 1136), *(double *)(*(_QWORD *)(a1 + 32) + 1144));
  objc_msgSend(*(id *)(a1 + 32), "setContentView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1152));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1152), "playbackGestureRecognizer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1152), "playbackGestureRecognizer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeGestureRecognizer:", v14);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1152), "playbackGestureRecognizer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addGestureRecognizer:", v16);

  v17 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(v17 + 1152), "playbackGestureRecognizer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDelegate:", v17);

  v19 = objc_alloc_init(MEMORY[0x24BEBD668]);
  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(void **)(v20 + 1160);
  *(_QWORD *)(v20 + 1160) = v19;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1160), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(*(id *)(v2 + 2944), "livePhotoBadgeImageWithOptions:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1160), "setImage:", v22);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1160), "setAccessibilityIdentifier:", CFSTR("QLLivePhotoViewControllerLivePhotoBadgeAccessibilityIdentifier"));
  objc_msgSend(*(id *)(a1 + 32), "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1160));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1160), "image");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "size");
  v26 = v25;
  v28 = v27;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)MEMORY[0x24BDD1628];
  v60 = CFSTR("width");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v26);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v31;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v61, &v60, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  _NSDictionaryOfVariableBindings(CFSTR("_livePhotoBadge"), *(id *)(*(_QWORD *)(a1 + 32) + 1160), 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[_livePhotoBadge(width)]"), 0, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addConstraints:", v34);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)MEMORY[0x24BDD1628];
  v58 = CFSTR("height");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v28);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v37;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  _NSDictionaryOfVariableBindings(CFSTR("_livePhotoBadge"), *(id *)(*(_QWORD *)(a1 + 32) + 1160), 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[_livePhotoBadge(height)]"), 0, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addConstraints:", v40);

  v41 = (void *)MEMORY[0x24BDD1628];
  v42 = *(_QWORD **)(a1 + 32);
  v43 = v42[145];
  objc_msgSend(v42, "view");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v43, 1, 0, v44, 1, 1.0, 0.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "ql_activatedConstraint");
  v46 = objc_claimAutoreleasedReturnValue();
  v47 = *(_QWORD *)(a1 + 32);
  v48 = *(void **)(v47 + 1168);
  *(_QWORD *)(v47 + 1168) = v46;

  v49 = (void *)MEMORY[0x24BDD1628];
  v50 = *(_QWORD **)(a1 + 32);
  v51 = v50[145];
  objc_msgSend(v50, "view");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v51, 3, 0, v52, 3, 1.0, 0.0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "ql_activatedConstraint");
  v54 = objc_claimAutoreleasedReturnValue();
  v55 = *(_QWORD *)(a1 + 32);
  v56 = *(void **)(v55 + 1176);
  *(_QWORD *)(v55 + 1176) = v54;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1208) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1195) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_updateLivePhotoBadgeAnimated:", 0);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)_updateLivePhotoBadgeAnimated:(BOOL)a3
{
  _BOOL4 v3;
  PHLivePhotoView *livePhotoView;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD aBlock[5];

  v3 = a3;
  livePhotoView = self->_livePhotoView;
  -[QLLivePhotoItemViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHLivePhotoView convertPoint:toView:](livePhotoView, "convertPoint:toView:", v6, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  v8 = v7;
  v10 = v9;

  -[QLItemViewController appearance](self, "appearance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "topInset");
  v13 = v12;

  -[NSLayoutConstraint setConstant:](self->_livePhotoBadgeLeftConstraint, "setConstant:", v8 + 5.0);
  v14 = v13 + 5.0;
  if (v10 + 5.0 >= v13 + 5.0)
    v14 = v10 + 5.0;
  -[NSLayoutConstraint setConstant:](self->_livePhotoBadgeTopConstraint, "setConstant:", v14);
  if (!self->_fullyZoomedOut || self->_isFullScreen || self->_isPlaying || self->_transitionInProgress)
  {
    v15 = 0;
  }
  else
  {
    -[QLItemViewController appearance](self, "appearance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v20, "presentationMode") != 4;

  }
  self->_livePhotoBadgeVisible = v15;
  -[QLLivePhotoItemViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setNeedsLayout");

  -[QLLivePhotoItemViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layoutIfNeeded");

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__QLLivePhotoItemViewController__updateLivePhotoBadgeAnimated___block_invoke;
  aBlock[3] = &unk_24C724B00;
  aBlock[4] = self;
  v18 = _Block_copy(aBlock);
  v19 = v18;
  if (v3)
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v18, 0.2);
  else
    (*((void (**)(void *))v18 + 2))(v18);

}

uint64_t __63__QLLivePhotoItemViewController__updateLivePhotoBadgeAnimated___block_invoke(uint64_t a1)
{
  uint64_t v1;
  double v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = 1.0;
  if (!*(_BYTE *)(v1 + 1193))
    v2 = 0.0;
  return objc_msgSend(*(id *)(v1 + 1160), "setAlpha:", v2);
}

- (BOOL)_wasJustPlaying
{
  void *v3;
  double v4;
  double v5;

  if (!self->_didEndPlayingTimestamp)
    return 0;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", self->_didEndPlayingTimestamp);
  v5 = v4;

  return v5 < 0.25;
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
  v9.receiver = self;
  v9.super_class = (Class)QLLivePhotoItemViewController;
  v7 = a4;
  -[QLScrollableContentItemViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __84__QLLivePhotoItemViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_24C724B78;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

uint64_t __84__QLLivePhotoItemViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateLivePhotoBadgeAnimated:", 1);
}

- (void)previewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)QLLivePhotoItemViewController;
  -[QLScrollableContentItemViewController previewWillAppear:](&v4, sel_previewWillAppear_, a3);
  -[PHLivePhotoView stopPlayback](self->_livePhotoView, "stopPlayback");
  -[QLLivePhotoItemViewController _updateLivePhotoBadgeAnimated:](self, "_updateLivePhotoBadgeAnimated:", 0);
  -[QLLivePhotoItemViewController _updateImageAnalysisInteractionAnimated:](self, "_updateImageAnalysisInteractionAnimated:", 0);
}

- (void)previewWillFinishAppearing
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)QLLivePhotoItemViewController;
  -[QLItemViewController previewWillFinishAppearing](&v2, sel_previewWillFinishAppearing);
}

- (void)previewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  objc_super v11;

  v3 = a3;
  if (_os_feature_enabled_impl())
  {
    -[QLItemViewController appearance](self, "appearance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[QLImageAnalysisManager shouldStartImageAnalysisForPresentationMode:](QLImageAnalysisManager, "shouldStartImageAnalysisForPresentationMode:", objc_msgSend(v5, "presentationMode"));

    if (v6)
      -[QLLivePhotoItemViewController _setupAndStartImageAnalysisIfNeeded](self, "_setupAndStartImageAnalysisIfNeeded");
  }
  v11.receiver = self;
  v11.super_class = (Class)QLLivePhotoItemViewController;
  -[QLScrollableContentItemViewController previewDidAppear:](&v11, sel_previewDidAppear_, v3);
  -[QLItemViewController appearance](self, "appearance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "presentationMode");

  if (v8 == 4)
  {
    if (!self->_isPlaying)
      -[PHLivePhotoView startPlaybackWithStyle:](self->_livePhotoView, "startPlaybackWithStyle:", 1);
  }
  else if (self->_isPlaying)
  {
    -[QLItemViewController appearance](self, "appearance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "presentationMode");

    if (v10 != 4)
      -[PHLivePhotoView stopPlayback](self->_livePhotoView, "stopPlayback");
  }
  -[QLLivePhotoItemViewController _updateLivePhotoBadgeAnimated:](self, "_updateLivePhotoBadgeAnimated:", 1);
  -[QLLivePhotoItemViewController _updateImageAnalysisInteractionAnimated:](self, "_updateImageAnalysisInteractionAnimated:", 1);
}

- (void)previewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)QLLivePhotoItemViewController;
  -[QLItemViewController previewWillDisappear:](&v4, sel_previewWillDisappear_, a3);
  -[QLImageAnalysisManager shouldHideInteraction:animated:](self->_imageAnalysisManager, "shouldHideInteraction:animated:", 1, 0);
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _BOOL4 isPlaying;
  objc_super v16;

  v4 = a4;
  v6 = a3;
  -[QLItemViewController appearance](self, "appearance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)QLLivePhotoItemViewController;
  -[QLScrollableContentItemViewController setAppearance:animated:](&v16, sel_setAppearance_animated_, v6, v4);

  -[QLLivePhotoItemViewController _updateLivePhotoBadgeAnimated:](self, "_updateLivePhotoBadgeAnimated:", v4);
  if (_os_feature_enabled_impl())
  {
    v8 = objc_msgSend(v7, "presentationMode");
    -[QLItemViewController appearance](self, "appearance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "presentationMode");

    if (v8 != v10)
    {
      if (+[QLImageAnalysisManager shouldStartImageAnalysisForPresentationMode:](QLImageAnalysisManager, "shouldStartImageAnalysisForPresentationMode:", v10)&& (-[QLItemViewController didAppearOnce](self, "didAppearOnce")|| -[QLImageAnalysisManager hasAnalysis](self->_imageAnalysisManager, "hasAnalysis")))
      {
        -[QLLivePhotoItemViewController _setupAndStartImageAnalysisIfNeeded](self, "_setupAndStartImageAnalysisIfNeeded");
      }
      else
      {
        -[QLLivePhotoItemViewController _updateAnalysisButtonsContainerConstraints](self, "_updateAnalysisButtonsContainerConstraints");
      }
    }
  }
  v11 = objc_msgSend(v7, "presentationMode");
  -[QLItemViewController appearance](self, "appearance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "presentationMode");

  if (v11 != v13)
  {
    -[QLItemViewController appearance](self, "appearance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "presentationMode") == 4)
    {
      isPlaying = self->_isPlaying;

      if (!isPlaying)
        -[PHLivePhotoView startPlaybackWithStyle:](self->_livePhotoView, "startPlaybackWithStyle:", 1);
    }
    else
    {

    }
    -[QLLivePhotoItemViewController updatePreferredDynamicRangeForced:](self, "updatePreferredDynamicRangeForced:", 0);
  }

}

- (void)previewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[QLImageAnalysisManager stopImageAnalysis](self->_imageAnalysisManager, "stopImageAnalysis");
  v5.receiver = self;
  v5.super_class = (Class)QLLivePhotoItemViewController;
  -[QLScrollableContentItemViewController previewDidDisappear:](&v5, sel_previewDidDisappear_, v3);
  self->_shouldPlayHint = 1;
  self->_isPlaying = 0;
  -[PHLivePhotoView stopPlayback](self->_livePhotoView, "stopPlayback");
}

- (void)previewBecameFullScreen:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  objc_super v7;

  v4 = a4;
  v5 = a3;
  self->_isFullScreen = a3;
  v7.receiver = self;
  v7.super_class = (Class)QLLivePhotoItemViewController;
  -[QLItemViewController previewBecameFullScreen:animated:](&v7, sel_previewBecameFullScreen_animated_);
  -[QLLivePhotoItemViewController _updateLivePhotoBadgeAnimated:](self, "_updateLivePhotoBadgeAnimated:", 1);
  -[QLImageAnalysisManager updateForFullScreen:animated:](self->_imageAnalysisManager, "updateForFullScreen:animated:", v5, v4);
  -[QLLivePhotoItemViewController _updateAnalysisButtonsContainerConstraints](self, "_updateAnalysisButtonsContainerConstraints");
}

- (void)transitionDidStart:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)QLLivePhotoItemViewController;
  -[QLItemViewController transitionDidStart:](&v4, sel_transitionDidStart_, a3);
  self->_transitionInProgress = 1;
  self->_HDRTransitionInProgress = 1;
  if (self->_livePhotoView)
    -[QLLivePhotoItemViewController animateToPreferredDynamicRange](self, "animateToPreferredDynamicRange");
  -[QLLivePhotoItemViewController _updateLivePhotoBadgeAnimated:](self, "_updateLivePhotoBadgeAnimated:", 1);
  -[QLLivePhotoItemViewController _updateImageAnalysisInteractionAnimated:](self, "_updateImageAnalysisInteractionAnimated:", 1);
}

- (void)transitionDidFinish:(BOOL)a3 didComplete:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)QLLivePhotoItemViewController;
  -[QLScrollableContentItemViewController transitionWillFinish:didComplete:](&v5, sel_transitionWillFinish_didComplete_, a3, a4);
  self->_transitionInProgress = 0;
  -[QLLivePhotoItemViewController _updateLivePhotoBadgeAnimated:](self, "_updateLivePhotoBadgeAnimated:", 1);
  -[QLLivePhotoItemViewController _updateImageAnalysisInteractionAnimated:](self, "_updateImageAnalysisInteractionAnimated:", 1);
}

- (void)didEndZoomingAtScale:(double)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;

  -[QLScrollableContentItemViewController scrollView](self, "scrollView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoomScale");
  v6 = v5;
  -[QLScrollableContentItemViewController scrollView](self, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minZoomScale");
  self->_fullyZoomedOut = v6 == v8;

  -[QLLivePhotoItemViewController _updateLivePhotoBadgeAnimated:](self, "_updateLivePhotoBadgeAnimated:", 1);
}

- (void)willBeginZooming
{
  self->_fullyZoomedOut = 0;
  -[QLLivePhotoItemViewController _updateLivePhotoBadgeAnimated:](self, "_updateLivePhotoBadgeAnimated:", 1);
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)canEnterFullScreen
{
  void *v3;
  BOOL v4;
  void *v5;

  -[PHLivePhotoView playbackGestureRecognizer](self->_livePhotoView, "playbackGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "state") == 1)
  {
    v4 = 0;
  }
  else
  {
    -[PHLivePhotoView playbackGestureRecognizer](self->_livePhotoView, "playbackGestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "state") != 2 && !self->_isPlaying;

  }
  return v4;
}

- (BOOL)canToggleFullScreen
{
  objc_super v4;

  if (-[QLLivePhotoItemViewController _wasJustPlaying](self, "_wasJustPlaying"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)QLLivePhotoItemViewController;
  return -[QLItemViewController canToggleFullScreen](&v4, sel_canToggleFullScreen);
}

- (int64_t)preferredWhitePointAdaptivityStyle
{
  return 2;
}

- (id)toolbarButtonsForTraitCollection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)QLLivePhotoItemViewController;
  -[QLItemViewController toolbarButtonsForTraitCollection:](&v8, sel_toolbarButtonsForTraitCollection_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (_os_feature_enabled_impl()
    && -[QLImageAnalysisManager isInteractionActive](self->_imageAnalysisManager, "isInteractionActive")
    && -[QLImageAnalysisManager hasResultsForVisualSearch](self->_imageAnalysisManager, "hasResultsForVisualSearch"))
  {
    -[QLImageAnalysisManager imageAnalysisToolbarButton](self->_imageAnalysisManager, "imageAnalysisToolbarButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
  return v5;
}

- (void)buttonPressedWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  int v8;
  BOOL v9;
  objc_super v10;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = _os_feature_enabled_impl();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("QLVisualSearchButton")))
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
  {
    v10.receiver = self;
    v10.super_class = (Class)QLLivePhotoItemViewController;
    -[QLItemViewController buttonPressedWithIdentifier:completionHandler:](&v10, sel_buttonPressedWithIdentifier_completionHandler_, v6, v7);
  }
  else
  {
    -[QLImageAnalysisManager infoButtonTapped](self->_imageAnalysisManager, "infoButtonTapped");
    if (v7)
      v7[2](v7);
  }

}

- (void)livePhotoView:(id)a3 willBeginPlaybackWithStyle:(int64_t)a4
{
  self->_isPlaying = 1;
  -[QLLivePhotoItemViewController _updateLivePhotoBadgeAnimated:](self, "_updateLivePhotoBadgeAnimated:", 1, a4);
  -[QLLivePhotoItemViewController _updateImageAnalysisInteractionAnimated:](self, "_updateImageAnalysisInteractionAnimated:", 1);
}

- (void)livePhotoView:(id)a3 didEndPlaybackWithStyle:(int64_t)a4
{
  NSDate *v5;
  NSDate *didEndPlayingTimestamp;

  objc_msgSend(MEMORY[0x24BDBCE60], "date", a3, a4);
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  didEndPlayingTimestamp = self->_didEndPlayingTimestamp;
  self->_didEndPlayingTimestamp = v5;

  self->_isPlaying = 0;
  -[QLLivePhotoItemViewController _updateLivePhotoBadgeAnimated:](self, "_updateLivePhotoBadgeAnimated:", 1);
  -[QLLivePhotoItemViewController _updateImageAnalysisInteractionAnimated:](self, "_updateImageAnalysisInteractionAnimated:", 1);
}

- (BOOL)livePhotoView:(id)a3 canBeginPlaybackWithStyle:(int64_t)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  objc_msgSend(a3, "playbackGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLLivePhotoItemViewController imageAnalysisView](self, "imageAnalysisView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  return !-[QLLivePhotoItemViewController _isPointInNonImageSubjectItems:](self, "_isPointInNonImageSubjectItems:", v8, v10);
}

- (double)livePhotoView:(id)a3 extraMinimumTouchDurationForTouch:(id)a4 withStyle:(int64_t)a5
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v6 = a4;
  -[QLLivePhotoItemViewController imageAnalysisView](self, "imageAnalysisView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationInView:", v7);
  v9 = v8;
  v11 = v10;

  if (-[QLImageAnalysisManager imageSubjectExistsAtPoint:](self->_imageAnalysisManager, "imageSubjectExistsAtPoint:", v9, v11)&& !-[QLLivePhotoItemViewController _isPointInNonImageSubjectItems:](self, "_isPointInNonImageSubjectItems:", v9, v11))
  {
    return 0.4;
  }
  else
  {
    return 0.0;
  }
}

- (UIImage)imageForAnalysis
{
  void *v2;
  void *v3;

  -[PHLivePhotoView livePhoto](self->_livePhotoView, "livePhoto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (UIView)imageAnalysisView
{
  return (UIView *)self->_livePhotoView;
}

- (NSDictionary)clientPreviewOptions
{
  void *v2;
  void *v3;

  -[QLItemViewController context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientPreviewOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)imageAnalyzerWantsUpdateInfoButtonWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[QLItemViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewItemViewControllerWantsUpdateOverlay:animated:", self, v3);

}

- (void)imageAnalysisInteractionWillPresentVisualSearchController
{
  NSNumber *v3;
  NSNumber *savedFullScreenState;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isFullScreen);
  v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  savedFullScreenState = self->_savedFullScreenState;
  self->_savedFullScreenState = v3;

  -[QLItemViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewItemViewController:wantsFullScreen:", self, 1);

}

- (void)imageAnalysisInteractionDidDismissVisualSearchController
{
  NSNumber *savedFullScreenState;
  uint64_t v4;
  NSNumber *v5;
  void *v6;
  QLLivePhotoItemViewController *v7;
  uint64_t v8;
  id v9;

  savedFullScreenState = self->_savedFullScreenState;
  if (savedFullScreenState)
  {
    v4 = -[NSNumber BOOLValue](savedFullScreenState, "BOOLValue");
    v5 = self->_savedFullScreenState;
    self->_savedFullScreenState = 0;

    -[QLItemViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v6;
    v7 = self;
    v8 = v4;
  }
  else
  {
    -[QLItemViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v6;
    v7 = self;
    v8 = 0;
  }
  objc_msgSend(v6, "previewItemViewController:wantsFullScreen:", v7, v8);

}

- (BOOL)shouldDetectMachineReadableCode
{
  void *v2;
  char v3;

  -[QLItemViewController context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldPreventMachineReadableCodeDetection") ^ 1;

  return v3;
}

- (void)_setupAndStartImageAnalysisIfNeeded
{
  QLImageAnalysisManager *imageAnalysisManager;
  _BOOL4 v4;
  QLImageAnalysisManager *v5;
  QLImageAnalysisManager *v6;
  QLImageAnalysisManager *v7;
  void *v8;
  QLImageAnalysisManager *v9;
  QLImageAnalysisManager *v10;

  imageAnalysisManager = self->_imageAnalysisManager;
  if (!imageAnalysisManager)
  {
LABEL_8:
    v7 = [QLImageAnalysisManager alloc];
    -[QLLivePhotoItemViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[QLImageAnalysisManager initWithDelegate:presentingView:](v7, "initWithDelegate:presentingView:", self, v8);
    v10 = self->_imageAnalysisManager;
    self->_imageAnalysisManager = v9;

    goto LABEL_9;
  }
  v4 = -[QLImageAnalysisManager hasAnalysis](imageAnalysisManager, "hasAnalysis");
  v5 = self->_imageAnalysisManager;
  if (!v4)
  {
    if (v5)
    {
      if (-[QLImageAnalysisManager isAnalysisOngoing](v5, "isAnalysisOngoing"))
        return;
      v6 = self->_imageAnalysisManager;
      if (v6)
        -[QLImageAnalysisManager stopImageAnalysis](v6, "stopImageAnalysis");
    }
    goto LABEL_8;
  }
  -[QLImageAnalysisManager addInteractionIfNeeded](v5, "addInteractionIfNeeded");
  -[QLImageAnalysisManager setupAnalysisButtonsContainer](self->_imageAnalysisManager, "setupAnalysisButtonsContainer");
LABEL_9:
  -[QLLivePhotoItemViewController _updateAnalysisButtonsContainerConstraints](self, "_updateAnalysisButtonsContainerConstraints");
}

- (void)_updateAnalysisButtonsContainerConstraints
{
  PHLivePhotoView *livePhotoView;
  QLImageAnalysisManager *imageAnalysisManager;
  PHLivePhotoView *v5;
  id v6;

  livePhotoView = self->_livePhotoView;
  if (livePhotoView)
  {
    imageAnalysisManager = self->_imageAnalysisManager;
    v5 = livePhotoView;
    -[QLLivePhotoItemViewController view](self, "view");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[QLImageAnalysisManager updateBottomRightContainerPositionForImageView:view:](imageAnalysisManager, "updateBottomRightContainerPositionForImageView:view:", v5, v6);

  }
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)QLLivePhotoItemViewController;
  -[QLLivePhotoItemViewController viewDidLoad](&v8, sel_viewDidLoad);
  objc_initWeak(&location, self);
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__QLLivePhotoItemViewController_viewDidLoad__block_invoke;
  v5[3] = &unk_24C724AD8;
  objc_copyWeak(&v6, &location);
  v4 = (id)-[QLLivePhotoItemViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v3, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __44__QLLivePhotoItemViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateAnalysisButtonsContainerConstraints");

}

- (void)adjustImageInteractionForScrollEvent:(id)a3
{
  -[QLImageAnalysisManager adjustImageInteractionForScrollView:](self->_imageAnalysisManager, "adjustImageInteractionForScrollView:", a3);
  -[QLLivePhotoItemViewController _updateAnalysisButtonsContainerConstraints](self, "_updateAnalysisButtonsContainerConstraints");
}

- (void)_updateImageAnalysisInteractionAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  void *v6;

  v3 = a3;
  if (self->_isPlaying || self->_transitionInProgress)
  {
    v5 = 1;
  }
  else
  {
    -[QLItemViewController appearance](self, "appearance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "presentationMode") == 4;

  }
  -[QLImageAnalysisManager shouldHideInteraction:animated:](self->_imageAnalysisManager, "shouldHideInteraction:animated:", v5, v3);
}

- (BOOL)canPerformFirstTimeAppearanceActions:(unint64_t)a3
{
  char v3;
  unsigned __int8 v4;
  BOOL v5;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)QLLivePhotoItemViewController;
  v4 = -[QLItemViewController canPerformFirstTimeAppearanceActions:](&v7, sel_canPerformFirstTimeAppearanceActions_);
  v5 = (v3 & 0x28) != 0;
  if ((v4 & 1) != 0)
    v5 = 1;
  return (v3 & 0x10) != 0 || v5;
}

- (void)performFirstTimeAppearanceActions:(unint64_t)a3
{
  if ((a3 & 8) != 0)
  {
    -[QLImageAnalysisManager setShouldHighlightTextAndDDAfterNextAnalysis:](self->_imageAnalysisManager, "setShouldHighlightTextAndDDAfterNextAnalysis:", 1);
  }
  else if ((a3 & 0x10) != 0)
  {
    -[QLImageAnalysisManager setShouldEnterVisualSearchAfterNextAnalysis:](self->_imageAnalysisManager, "setShouldEnterVisualSearchAfterNextAnalysis:", 1);
  }
  else if ((a3 & 0x20) != 0)
  {
    -[QLImageAnalysisManager setShouldUpliftSubjectAfterNextAnalysis:](self->_imageAnalysisManager, "setShouldUpliftSubjectAfterNextAnalysis:", 1);
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v4;
  BOOL v5;

  v4 = a4;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v4, "numberOfTapsRequired") != 2;

  return v5;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  PHLivePhotoView *livePhotoView;
  id v5;
  id v6;

  livePhotoView = self->_livePhotoView;
  v5 = a3;
  -[PHLivePhotoView playbackGestureRecognizer](livePhotoView, "playbackGestureRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  return v6 != v5
      || -[QLLivePhotoItemViewController livePhotoView:canBeginPlaybackWithStyle:](self, "livePhotoView:canBeginPlaybackWithStyle:", self->_livePhotoView, 1);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  id v8;
  char v9;

  v6 = a3;
  v7 = a4;
  -[PHLivePhotoView playbackGestureRecognizer](self->_livePhotoView, "playbackGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v6)
  {
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[QLLivePhotoItemViewController livePhotoView:extraMinimumTouchDurationForTouch:withStyle:](self, "livePhotoView:extraMinimumTouchDurationForTouch:withStyle:", self->_livePhotoView, v7, 1);
      objc_msgSend(v6, "setExtraMinimumTouchDuration:");
    }
  }
  else
  {

  }
  return 1;
}

- (BOOL)shouldAcceptTouch:(id)a3 ofGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unsigned int v14;
  objc_super v16;

  v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)QLLivePhotoItemViewController;
  v7 = a3;
  v8 = -[QLItemViewController shouldAcceptTouch:ofGestureRecognizer:](&v16, sel_shouldAcceptTouch_ofGestureRecognizer_, v7, v6);
  -[QLLivePhotoItemViewController imageAnalysisView](self, "imageAnalysisView", v16.receiver, v16.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locationInView:", v9);
  v11 = v10;
  v13 = v12;

  LODWORD(v9) = objc_msgSend(v7, "_isPointerTouch");
  if ((_DWORD)v9)
  {
    if (-[QLImageAnalysisManager isTextSelectionEnabled](self->_imageAnalysisManager, "isTextSelectionEnabled"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 &= !-[QLImageAnalysisManager textExistsAtPoint:](self->_imageAnalysisManager, "textExistsAtPoint:", v11, v13);
    }
  }
  if (-[QLImageAnalysisManager visualSearchExistsAtPoint:](self->_imageAnalysisManager, "visualSearchExistsAtPoint:", v11, v13))
  {
    objc_opt_class();
    v8 &= ~objc_opt_isKindOfClass();
  }
  v14 = v8 & ~-[QLImageAnalysisManager hasActiveTextSelection](self->_imageAnalysisManager, "hasActiveTextSelection");

  return v14;
}

- (BOOL)_isPointInNonImageSubjectItems:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  return -[QLImageAnalysisManager textExistsAtPoint:](self->_imageAnalysisManager, "textExistsAtPoint:")
      || -[QLImageAnalysisManager dataDetectorExistsAtPoint:](self->_imageAnalysisManager, "dataDetectorExistsAtPoint:", x, y)|| -[QLImageAnalysisManager actionInfoItemExistsAtPoint:](self->_imageAnalysisManager, "actionInfoItemExistsAtPoint:", x, y);
}

- (void)updatePreferredDynamicRangeForced:(BOOL)a3
{
  _BOOL4 v3;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a3;
  if (_os_feature_enabled_impl())
  {
    if (!self->_HDRTransitionInProgress || v3)
    {
      -[QLItemViewController appearance](self, "appearance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "presentationMode");

      if (v7 == 2)
        v8 = 2;
      else
        v8 = 1;
      -[PHLivePhotoView setPreferredImageDynamicRange:](self->_livePhotoView, "setPreferredImageDynamicRange:", v8);
    }
  }
}

- (void)animateToPreferredDynamicRange
{
  _QWORD v2[5];
  _QWORD v3[5];

  v2[4] = self;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __63__QLLivePhotoItemViewController_animateToPreferredDynamicRange__block_invoke;
  v3[3] = &unk_24C724B00;
  v3[4] = self;
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __63__QLLivePhotoItemViewController_animateToPreferredDynamicRange__block_invoke_2;
  v2[3] = &unk_24C724B28;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v3, v2, 2.0);
}

uint64_t __63__QLLivePhotoItemViewController_animateToPreferredDynamicRange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1152), "setPreferredImageDynamicRange:", 2);
}

uint64_t __63__QLLivePhotoItemViewController_animateToPreferredDynamicRange__block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1197) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "updatePreferredDynamicRangeForced:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysisButtonContainerBottomConstraint, 0);
  objc_storeStrong((id *)&self->_analysisButtonContainerRightConstraint, 0);
  objc_storeStrong((id *)&self->_analysisButtonContainer, 0);
  objc_storeStrong((id *)&self->_imageAnalysisManager, 0);
  objc_storeStrong((id *)&self->_savedFullScreenState, 0);
  objc_storeStrong((id *)&self->_didEndPlayingTimestamp, 0);
  objc_storeStrong((id *)&self->_livePhotoBadgeTopConstraint, 0);
  objc_storeStrong((id *)&self->_livePhotoBadgeLeftConstraint, 0);
  objc_storeStrong((id *)&self->_livePhotoBadge, 0);
  objc_storeStrong((id *)&self->_livePhotoView, 0);
}

@end
