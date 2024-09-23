@implementation QLMediaItemViewController

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v7;
  objc_super v8;
  _QWORD v9[4];
  QLMediaItemViewController *v10;
  id v11;

  v9[1] = 3221225472;
  v9[2] = __89__QLMediaItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke;
  v9[3] = &unk_24C726EC8;
  v10 = self;
  v11 = a5;
  v8.receiver = v10;
  v8.super_class = (Class)QLMediaItemViewController;
  v9[0] = MEMORY[0x24BDAC760];
  v7 = v11;
  -[QLMediaItemBaseViewController loadPreviewControllerWithContents:context:completionHandler:](&v8, sel_loadPreviewControllerWithContents_context_completionHandler_, a3, a4, v9);

}

uint64_t __89__QLMediaItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (!a2)
    return QLRunInMainThread();
  return result;
}

void __89__QLMediaItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_2(uint64_t a1)
{
  QLMediaScrubberGesture *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v2 = [QLMediaScrubberGesture alloc];
  objc_msgSend(*(id *)(a1 + 32), "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[QLMediaScrubberGesture initWithPlayer:](v2, "initWithPlayer:", v3);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 1344);
  *(_QWORD *)(v5 + 1344) = v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1344), "setDelegate:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1344), "setScrubberDelegate:");
  LODWORD(v7) = 1.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1344), "setMaximumValue:", v7);
  LODWORD(v8) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1344), "setMinimumValue:", v8);
  v9 = objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", *(_QWORD *)(a1 + 32), sel_tapToPlayGestureChanged_);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 1352);
  *(_QWORD *)(v10 + 1352) = v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1352), "setDelegate:");
  objc_msgSend(*(id *)(a1 + 32), "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addGestureRecognizer:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1344));

  objc_msgSend(*(id *)(a1 + 32), "view");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addGestureRecognizer:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1352));

}

- (void)previewIsAppearingWithProgress:(double)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)QLMediaItemViewController;
  -[QLMediaItemBaseViewController previewIsAppearingWithProgress:](&v6, sel_previewIsAppearingWithProgress_);
  -[QLItemViewController accessoryView](self, "accessoryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", a3);

}

- (void)previewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)QLMediaItemViewController;
  -[QLMediaItemBaseViewController previewDidAppear:](&v5, sel_previewDidAppear_, a3);
  -[QLMediaItemViewController showTimeLabelIfNeeded](self, "showTimeLabelIfNeeded");
  -[QLItemViewController accessoryView](self, "accessoryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

  -[UIView setHidden:](self->_timeLabelBackground, "setHidden:", 0);
  if (-[QLMediaItemViewController shouldHandleRegisteringForCommandCenterHandlers](self, "shouldHandleRegisteringForCommandCenterHandlers"))
  {
    -[QLMediaItemViewController _registerForCommandCenterHandlers](self, "_registerForCommandCenterHandlers");
    -[QLMediaItemViewController _updateCommandCenterPlayingInfoWithCurrentPlaybackTimeInformation](self, "_updateCommandCenterPlayingInfoWithCurrentPlaybackTimeInformation");
  }
}

- (void)previewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)QLMediaItemViewController;
  -[QLItemViewController previewWillDisappear:](&v4, sel_previewWillDisappear_, a3);
  -[UIView setHidden:](self->_timeLabelBackground, "setHidden:", 1);
}

- (void)previewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)QLMediaItemViewController;
  -[QLMediaItemBaseViewController previewDidDisappear:](&v6, sel_previewDidDisappear_, a3);
  -[QLMediaItemViewController removeTimeLabel](self, "removeTimeLabel");
  if (-[QLMediaItemViewController shouldHandleRegisteringForCommandCenterHandlers](self, "shouldHandleRegisteringForCommandCenterHandlers"))
  {
    objc_msgSend(MEMORY[0x24BDDCAC8], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNowPlayingInfo:", 0);

    objc_msgSend(MEMORY[0x24BDDCAC8], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRepresentedApplicationBundleIdentifier:", 0);

    -[QLMediaItemViewController _unregisterForCommandCenterHandlers](self, "_unregisterForCommandCenterHandlers");
  }
}

- (void)previewBecameFullScreen:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)QLMediaItemViewController;
  -[QLMediaItemBaseViewController previewBecameFullScreen:animated:](&v6, sel_previewBecameFullScreen_animated_, a3, a4);
  if (v4)
    -[QLMediaItemViewController hideTimeLabelAnimated:](self, "hideTimeLabelAnimated:", 0);
  else
    -[QLMediaItemViewController showTimeLabelIfNeeded](self, "showTimeLabelIfNeeded");
}

- (void)transitionDidFinish:(BOOL)a3 didComplete:(BOOL)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)QLMediaItemViewController;
  -[QLItemViewController transitionDidFinish:didComplete:](&v6, sel_transitionDidFinish_didComplete_, a3);
  if (!a4)
    -[UIView setHidden:](self->_timeLabelBackground, "setHidden:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[UIScrollView removeObserver:forKeyPath:](self->_scrubberScrollView, "removeObserver:forKeyPath:", self, CFSTR("contentOffset"));
  v3.receiver = self;
  v3.super_class = (Class)QLMediaItemViewController;
  -[QLMediaItemBaseViewController dealloc](&v3, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v7;

  if (self->_scrubberScrollView == a6)
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("contentOffset"), a4, a5))
      -[QLMediaItemViewController setTimeLabelNeedsUpdate](self, "setTimeLabelNeedsUpdate");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)QLMediaItemViewController;
    -[QLMediaItemBaseViewController observeValueForKeyPath:ofObject:change:context:](&v7, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)hostApplicationDidEnterBackground:(id)a3
{
  if ((objc_msgSend(a3, "BOOLValue") & 1) == 0)
    -[QLMediaItemViewController _updateCommandCenterPlayingInfoWithCurrentPlaybackTimeInformation](self, "_updateCommandCenterPlayingInfoWithCurrentPlaybackTimeInformation");
}

- (BOOL)shouldHandleRegisteringForCommandCenterHandlers
{
  return 1;
}

- (void)observePlayingTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)QLMediaItemViewController;
  v4 = *a3;
  -[QLMediaItemBaseViewController observePlayingTime:](&v5, sel_observePlayingTime_, &v4);
  -[QLMediaItemViewController setTimeLabelNeedsUpdate](self, "setTimeLabelNeedsUpdate");
}

- (id)timeLabelScrollView
{
  return 0;
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  objc_super v17;

  v4 = a4;
  v6 = a3;
  -[QLItemViewController appearance](self, "appearance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)QLMediaItemViewController;
  -[QLMediaItemBaseViewController setAppearance:animated:](&v17, sel_setAppearance_animated_, v6, v4);
  -[QLMediaItemViewController setTimeLabelNeedsUpdate](self, "setTimeLabelNeedsUpdate");
  -[QLMediaScrubberGesture setEnabled:](self->_scrubGesture, "setEnabled:", objc_msgSend(v6, "presentationMode") == 5);
  -[UITapGestureRecognizer setEnabled:](self->_tapToPlayGesture, "setEnabled:", objc_msgSend(v6, "presentationMode") == 5);
  v8 = objc_msgSend(v6, "presentationMode");

  v9 = v8 != 5;
  -[QLScrollableContentItemViewController scrollView](self, "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pinchGestureRecognizer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEnabled:", v9);

  v12 = objc_msgSend(v7, "presentationMode");
  -[QLItemViewController appearance](self, "appearance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "presentationMode");

  if (v12 != v14)
  {
    -[QLItemViewController appearance](self, "appearance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "presentationMode");

    if (v16 == 4)
      -[QLMediaItemViewController hideTimeLabelAnimated:](self, "hideTimeLabelAnimated:", 0);
    else
      -[QLMediaItemViewController showTimeLabelIfNeeded](self, "showTimeLabelIfNeeded");
  }

}

- (void)setUpTimeLabelIfNeeded
{
  UIView *v3;
  UIView *timeLabelBackground;
  void *v5;
  UIView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIView *v12;
  void *v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *timeLabelConstraintX;
  void *v16;
  void *v17;
  UIView *v18;
  void *v19;
  void *v20;
  NSLayoutConstraint *v21;
  NSLayoutConstraint *timeLabelConstraintY;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  UILabel *v32;
  UILabel *timeLabel;
  UILabel *v34;
  void *v35;
  UIView *v36;
  void *v37;
  UILabel *v38;
  void *v39;
  void *v40;
  UIView *v41;
  void *v42;
  void *v43;
  void *v44;
  UIScrollView *scrubberScrollView;
  UIScrollView *v46;
  UIScrollView *v47;
  UIScrollView *v48;
  const __CFString *v49;
  UILabel *v50;
  const __CFString *v51;
  UILabel *v52;
  _QWORD v53[2];
  _QWORD v54[2];
  void *v55;
  uint64_t v56;
  _QWORD v57[2];

  v57[1] = *MEMORY[0x24BDAC8D0];
  if (!self->_timeLabelBackground)
  {
    -[QLMediaItemViewController timeLabelScrollView](self, "timeLabelScrollView");
    v48 = (UIScrollView *)objc_claimAutoreleasedReturnValue();
    v3 = (UIView *)objc_opt_new();
    timeLabelBackground = self->_timeLabelBackground;
    self->_timeLabelBackground = v3;

    -[UIView layer](self->_timeLabelBackground, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerRadius:", 2.0);

    v6 = self->_timeLabelBackground;
    v7 = (void *)MEMORY[0x24BEBD4B8];
    QLFrameworkBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("QLSquaredLabelBackgroundColor"), v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v9);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_timeLabelBackground, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setAlpha:](self->_timeLabelBackground, "setAlpha:", 0.0);
    -[QLMediaItemViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", self->_timeLabelBackground);

    v11 = (void *)MEMORY[0x24BDD1628];
    v12 = self->_timeLabelBackground;
    -[QLMediaItemViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 9, 0, v13, 9, 1.0, 0.0);
    v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    timeLabelConstraintX = self->_timeLabelConstraintX;
    self->_timeLabelConstraintX = v14;

    -[QLMediaItemViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addConstraint:", self->_timeLabelConstraintX);

    v17 = (void *)MEMORY[0x24BDD1628];
    v18 = self->_timeLabelBackground;
    -[QLMediaItemViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v18, 4, 0, v19, 4, 1.0, 0.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "ql_activatedConstraint");
    v21 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    timeLabelConstraintY = self->_timeLabelConstraintY;
    self->_timeLabelConstraintY = v21;

    objc_msgSend(MEMORY[0x24BEBB520], "defaultFontForTextStyle:", *MEMORY[0x24BEBE1E8]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "fontDescriptor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = *MEMORY[0x24BEBB548];
    v25 = *MEMORY[0x24BEBB598];
    v53[0] = *MEMORY[0x24BEBB5A0];
    v53[1] = v25;
    v54[0] = &unk_24C749540;
    v54[1] = &unk_24C749558;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v54, v53, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v26;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v55, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v27;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "fontDescriptorByAddingAttributes:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = (void *)MEMORY[0x24BEBB520];
    objc_msgSend(v23, "pointSize");
    objc_msgSend(v30, "fontWithDescriptor:size:", v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = (UILabel *)objc_opt_new();
    timeLabel = self->_timeLabel;
    self->_timeLabel = v32;

    -[UILabel setFont:](self->_timeLabel, "setFont:", v31);
    -[UILabel setTextAlignment:](self->_timeLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](self->_timeLabel, "setNumberOfLines:", 1);
    v34 = self->_timeLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v34, "setBackgroundColor:", v35);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_timeLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](self->_timeLabelBackground, "addSubview:", self->_timeLabel);
    v36 = self->_timeLabelBackground;
    v37 = (void *)MEMORY[0x24BDD1628];
    v38 = self->_timeLabel;
    v51 = CFSTR("label");
    v52 = v38;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(2)-[label]-(2)-|"), 0, 0, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraints:](v36, "addConstraints:", v40);

    v41 = self->_timeLabelBackground;
    v42 = (void *)MEMORY[0x24BDD1628];
    v49 = CFSTR("label");
    v50 = self->_timeLabel;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(8)-[label]-(8)-|"), 0, 0, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraints:](v41, "addConstraints:", v44);

    scrubberScrollView = self->_scrubberScrollView;
    if (scrubberScrollView)
    {
      if (scrubberScrollView != v48)
        -[UIScrollView removeObserver:forKeyPath:](scrubberScrollView, "removeObserver:forKeyPath:", self, CFSTR("contentOffset"));
    }
    v46 = self->_scrubberScrollView;
    self->_scrubberScrollView = v48;
    v47 = v48;

    -[UIScrollView addObserver:forKeyPath:options:context:](self->_scrubberScrollView, "addObserver:forKeyPath:options:context:", self, CFSTR("contentOffset"), 1, self->_scrubberScrollView);
    -[QLMediaItemViewController setTimeLabelNeedsUpdate](self, "setTimeLabelNeedsUpdate");

  }
}

- (void)removeTimeLabel
{
  UIView *timeLabelBackground;
  UILabel *timeLabel;
  UIScrollView *scrubberScrollView;

  -[UIView removeFromSuperview](self->_timeLabelBackground, "removeFromSuperview");
  timeLabelBackground = self->_timeLabelBackground;
  self->_timeLabelBackground = 0;

  -[UILabel removeFromSuperview](self->_timeLabel, "removeFromSuperview");
  timeLabel = self->_timeLabel;
  self->_timeLabel = 0;

  -[UIScrollView removeObserver:forKeyPath:](self->_scrubberScrollView, "removeObserver:forKeyPath:", self, CFSTR("contentOffset"));
  scrubberScrollView = self->_scrubberScrollView;
  self->_scrubberScrollView = 0;

}

- (int64_t)playbackTimeFormat
{
  double v3;
  double v5;

  if (-[QLMediaItemBaseViewController playingStatus](self, "playingStatus") == 2)
  {
    -[QLMediaItemBaseViewController remainingTime](self, "remainingTime");
    if (v3 > 1.0)
      return 2;
  }
  if (-[QLMediaItemBaseViewController playingStatus](self, "playingStatus") != 1)
    return 1;
  -[QLMediaItemBaseViewController elapsedTime](self, "elapsedTime");
  if (v5 < 5.0)
    return 2;
  else
    return 1;
}

- (void)setTimeLabelNeedsUpdate
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UILabel *timeLabel;
  int64_t playbackTimeFormat;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  _QWORD v22[6];

  self->_playbackTimeFormat = -[QLMediaItemViewController playbackTimeFormat](self, "playbackTimeFormat");
  if (-[UIScrollView isDragging](self->_scrubberScrollView, "isDragging")
    || -[UIScrollView isDecelerating](self->_scrubberScrollView, "isDecelerating")
    || -[QLMediaScrubberGesture state](self->_scrubGesture, "state") == 1
    || -[QLMediaScrubberGesture state](self->_scrubGesture, "state") == 2)
  {
    self->_playbackTimeFormat = 1;
    -[QLMediaItemViewController showTimeLabelIfNeeded](self, "showTimeLabelIfNeeded");
    -[QLMediaItemViewController hideTimeLabelAfterDelay](self, "hideTimeLabelAfterDelay");
    -[UIScrollView contentOffset](self->_scrubberScrollView, "contentOffset");
    v4 = v3;
    -[UIScrollView contentSize](self->_scrubberScrollView, "contentSize");
    v6 = v5;
    -[UIScrollView contentInset](self->_scrubberScrollView, "contentInset");
    v8 = v7;
    -[UIScrollView contentInset](self->_scrubberScrollView, "contentInset");
    if (v4 >= -v9)
    {
      v11 = 0.0;
      if (v4 <= v6 - v8)
      {
LABEL_10:
        -[NSLayoutConstraint setConstant:](self->_timeLabelConstraintX, "setConstant:", v11);
        goto LABEL_11;
      }
      v10 = v4 - (v6 - v8);
    }
    else
    {
      v10 = v4 + v9;
    }
    v11 = -v10;
    goto LABEL_10;
  }
LABEL_11:
  timeLabel = self->_timeLabel;
  playbackTimeFormat = self->_playbackTimeFormat;
  -[QLMediaItemBaseViewController elapsedTime](self, "elapsedTime");
  v15 = v14;
  -[QLMediaItemBaseViewController remainingTime](self, "remainingTime");
  -[QLMediaItemViewController labelTextWithFormat:elapsedInterval:remainingInterval:](self, "labelTextWithFormat:elapsedInterval:remainingInterval:", playbackTimeFormat, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](timeLabel, "setText:", v17);

  -[UILabel sizeToFit](self->_timeLabel, "sizeToFit");
  -[QLItemViewController appearance](self, "appearance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bottomInset");
  v20 = -(v19 + 5.0);

  -[NSLayoutConstraint constant](self->_timeLabelConstraintY, "constant");
  if (v21 != v20)
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __52__QLMediaItemViewController_setTimeLabelNeedsUpdate__block_invoke;
    v22[3] = &unk_24C724CD0;
    v22[4] = self;
    *(double *)&v22[5] = v20;
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v22, 0.2);
  }
  -[QLMediaItemViewController _updateCommandCenterPlayingInfoWithCurrentPlaybackTimeInformation](self, "_updateCommandCenterPlayingInfoWithCurrentPlaybackTimeInformation");
}

uint64_t __52__QLMediaItemViewController_setTimeLabelNeedsUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1304), "setConstant:", *(double *)(a1 + 40));
}

- (void)showTimeLabelIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  if (!-[QLMediaItemBaseViewController isFullScreen](self, "isFullScreen"))
  {
    -[QLItemViewController appearance](self, "appearance");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "presentationMode") != 4)
    {
      -[QLItemViewController appearance](self, "appearance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "presentationMode") != 3)
      {
        -[QLItemViewController appearance](self, "appearance");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "presentationMode");

        if (v5)
        {
          -[QLMediaItemViewController showTimeLabel](self, "showTimeLabel");
          -[QLMediaItemViewController hideTimeLabelAfterDelay](self, "hideTimeLabelAfterDelay");
        }
        return;
      }

    }
  }
}

- (void)showTimeLabel
{
  _QWORD v3[5];

  -[QLMediaItemViewController setUpTimeLabelIfNeeded](self, "setUpTimeLabelIfNeeded");
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __42__QLMediaItemViewController_showTimeLabel__block_invoke;
  v3[3] = &unk_24C724B00;
  v3[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v3, 0.5);
}

uint64_t __42__QLMediaItemViewController_showTimeLabel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1272), "setAlpha:", 1.0);
}

- (void)hideTimeLabelAfterDelay
{
  NSTimer *playbackTimeHiddenTimer;
  NSTimer *v4;
  double v5;
  NSTimer *v6;
  NSTimer *v7;

  playbackTimeHiddenTimer = self->_playbackTimeHiddenTimer;
  if (playbackTimeHiddenTimer)
  {
    -[NSTimer invalidate](playbackTimeHiddenTimer, "invalidate");
    v4 = self->_playbackTimeHiddenTimer;
    self->_playbackTimeHiddenTimer = 0;

  }
  -[UIView alpha](self->_timeLabelBackground, "alpha");
  if (v5 == 1.0)
  {
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_hideTimeLabel, 0, 0, 2.0);
    v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    v7 = self->_playbackTimeHiddenTimer;
    self->_playbackTimeHiddenTimer = v6;

  }
}

- (void)hideTimeLabel
{
  -[QLMediaItemViewController hideTimeLabelAnimated:](self, "hideTimeLabelAnimated:", 1);
}

- (void)hideTimeLabelAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  NSTimer *playbackTimeHiddenTimer;
  NSTimer *v8;
  _QWORD aBlock[5];

  v3 = a3;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__QLMediaItemViewController_hideTimeLabelAnimated___block_invoke;
  aBlock[3] = &unk_24C724B00;
  aBlock[4] = self;
  v5 = _Block_copy(aBlock);
  v6 = v5;
  if (v3)
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v5, 0.4);
  else
    (*((void (**)(void *))v5 + 2))(v5);
  playbackTimeHiddenTimer = self->_playbackTimeHiddenTimer;
  if (playbackTimeHiddenTimer)
  {
    -[NSTimer invalidate](playbackTimeHiddenTimer, "invalidate");
    v8 = self->_playbackTimeHiddenTimer;
    self->_playbackTimeHiddenTimer = 0;

  }
}

uint64_t __51__QLMediaItemViewController_hideTimeLabelAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1272), "setAlpha:", 0.0);
}

- (id)labelTextWithFormat:(int64_t)a3 elapsedInterval:(double)a4 remainingInterval:(double)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (a3 == 3)
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    -[QLMediaItemViewController stringFromTimeInterval:](self, "stringFromTimeInterval:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLMediaItemViewController stringFromTimeInterval:](self, "stringFromTimeInterval:", a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ / -%@"), v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (a3 == 2)
    {
      v12 = (void *)MEMORY[0x24BDD17C8];
      -[QLMediaItemViewController stringFromTimeInterval:](self, "stringFromTimeInterval:", a5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("-%@"), v8);
    }
    else
    {
      if (a3 != 1)
      {
        v11 = 0;
        return v11;
      }
      v7 = (void *)MEMORY[0x24BDD17C8];
      -[QLMediaItemViewController stringFromTimeInterval:](self, "stringFromTimeInterval:", a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR(" %@"), v8);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)stringFromTimeInterval:(double)a3
{
  uint64_t *v4;

  if (stringFromTimeInterval__onceToken_0 != -1)
    dispatch_once(&stringFromTimeInterval__onceToken_0, &__block_literal_global_16);
  v4 = &stringFromTimeInterval__hourMinuteSecondFormatter;
  if (a3 < 3600.0)
    v4 = &stringFromTimeInterval__minuteSecondFormatter_0;
  return (id)objc_msgSend((id)*v4, "stringFromTimeInterval:", a3);
}

uint64_t __52__QLMediaItemViewController_stringFromTimeInterval___block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x24BDD14F8]);
  v1 = (void *)stringFromTimeInterval__minuteSecondFormatter_0;
  stringFromTimeInterval__minuteSecondFormatter_0 = (uint64_t)v0;

  objc_msgSend((id)stringFromTimeInterval__minuteSecondFormatter_0, "setAllowedUnits:", 192);
  objc_msgSend((id)stringFromTimeInterval__minuteSecondFormatter_0, "setUnitsStyle:", 0);
  objc_msgSend((id)stringFromTimeInterval__minuteSecondFormatter_0, "setZeroFormattingBehavior:", 0x10000);
  v2 = objc_alloc_init(MEMORY[0x24BDD14F8]);
  v3 = (void *)stringFromTimeInterval__hourMinuteSecondFormatter;
  stringFromTimeInterval__hourMinuteSecondFormatter = (uint64_t)v2;

  objc_msgSend((id)stringFromTimeInterval__hourMinuteSecondFormatter, "setAllowedUnits:", 224);
  objc_msgSend((id)stringFromTimeInterval__hourMinuteSecondFormatter, "setUnitsStyle:", 0);
  return objc_msgSend((id)stringFromTimeInterval__hourMinuteSecondFormatter, "setZeroFormattingBehavior:", 0x10000);
}

- (id)_playingInfoWithPlaybackDuration:(double)a3 elapsedTime:(double)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *playingInfo;
  void *v14;
  void *v15;

  if (!self->_playingInfo)
  {
    v7 = (void *)MEMORY[0x24BDDC7B8];
    -[QLMediaItemBaseViewController mediaAsset](self, "mediaAsset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLItemViewController context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "previewTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "playingInfoFromAsset:withDefaultTitle:", v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (NSMutableDictionary *)objc_msgSend(v11, "mutableCopy");
    playingInfo = self->_playingInfo;
    self->_playingInfo = v12;

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_playingInfo, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BDDBC58]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_playingInfo, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BDDC518]);

  return self->_playingInfo;
}

- (void)_registerForCommandCenterHandlers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDDCB60], "sharedCommandCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "playCommand");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTarget:action:", self, sel_userTappedPlayInControlCenter_);

  objc_msgSend(v7, "pauseCommand");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTarget:action:", self, sel_userTappedPauseInControlCenter_);

  objc_msgSend(v7, "changePlaybackPositionCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTarget:action:", self, sel_userScrubbedInControlCenter_);

  objc_msgSend(v7, "togglePlayPauseCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTarget:action:", self, sel_togglePlaybackFromControlCenter_);

}

- (void)_unregisterForCommandCenterHandlers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDDCB60], "sharedCommandCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pauseCommand");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTarget:", self);

  objc_msgSend(v7, "playCommand");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeTarget:", self);

  objc_msgSend(v7, "changePlaybackPositionCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTarget:", self);

  objc_msgSend(v7, "togglePlayPauseCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeTarget:", self);

}

- (int64_t)userTappedPlayInControlCenter:(id)a3
{
  if (-[QLMediaItemBaseViewController play](self, "play", a3))
    return 0;
  else
    return 200;
}

- (int64_t)userTappedPauseInControlCenter:(id)a3
{
  if (-[QLMediaItemBaseViewController pause](self, "pause", a3))
    return 0;
  else
    return 200;
}

- (int64_t)userScrubbedInControlCenter:(id)a3
{
  double v4;
  Float64 v5;
  void *v6;
  void *v7;
  void *v8;
  CMTime v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CMTime v14;

  memset(&v14, 0, sizeof(v14));
  objc_msgSend(a3, "positionTime");
  v5 = v4;
  -[QLMediaItemBaseViewController player](self, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "currentTime");
    LODWORD(v6) = v12;
  }
  else
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
  }
  CMTimeMakeWithSeconds(&v14, v5, (int32_t)v6);

  -[QLMediaItemBaseViewController player](self, "player");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;
  objc_msgSend(v8, "seekToTime:", &v10);

  return 0;
}

- (int64_t)togglePlaybackFromControlCenter:(id)a3
{
  if (-[QLMediaItemBaseViewController togglePlayback](self, "togglePlayback", a3))
    return 0;
  else
    return 200;
}

- (void)_updateCommandCenterPlayingInfoWithCurrentPlaybackTimeInformation
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (-[QLMediaItemBaseViewController isVisible](self, "isVisible"))
  {
    if (-[QLMediaItemViewController shouldHandleRegisteringForCommandCenterHandlers](self, "shouldHandleRegisteringForCommandCenterHandlers"))
    {
      objc_msgSend(MEMORY[0x24BDDCAC8], "defaultCenter");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLMediaItemBaseViewController mediaDuration](self, "mediaDuration");
      v5 = v4;
      -[QLMediaItemBaseViewController elapsedTime](self, "elapsedTime");
      -[QLMediaItemViewController _playingInfoWithPlaybackDuration:elapsedTime:](self, "_playingInfoWithPlaybackDuration:elapsedTime:", v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setNowPlayingInfo:", v7);

      objc_msgSend(MEMORY[0x24BDDCAC8], "defaultCenter");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      -[QLItemViewController presentingDelegate](self, "presentingDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "parentApplicationDisplayIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setRepresentedApplicationBundleIdentifier:", v9);

    }
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  BOOL v3;
  void *v4;
  float v5;

  if (self->_scrubGesture != a3)
    return self->_tapToPlayGesture == a3;
  -[QLMediaItemBaseViewController player](self, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rate");
  v3 = v5 != 0.0;

  return v3;
}

- (void)tapToPlayGestureChanged:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
    -[QLMediaItemBaseViewController togglePlayback](self, "togglePlayback");
}

- (id)registeredKeyCommands
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", CFSTR(" "), 0, sel_togglePlayback);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  QLLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDiscoverabilityTitle:", v4);

  objc_msgSend(MEMORY[0x24BE7BFA8], "keyCommandWithKeyCommand:identifier:", v3, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10.receiver = self;
  v10.super_class = (Class)QLMediaItemViewController;
  -[QLItemViewController registeredKeyCommands](&v10, sel_registeredKeyCommands);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)handlePerformedKeyCommandIfNeeded:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (objc_msgSend(v4, "keyCommandIdentifier") == 4)
  {
    -[QLMediaItemBaseViewController togglePlayback](self, "togglePlayback");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)QLMediaItemViewController;
    -[QLItemViewController handlePerformedKeyCommandIfNeeded:](&v5, sel_handlePerformedKeyCommandIfNeeded_, v4);
  }

}

- (void)scrubber:(id)a3 didChangeValue:(float)a4
{
  id v6;
  NSNumber *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSNumber *v13;
  NSNumber *isSeeking;
  void *v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id location;
  CMTime time;
  CMTime v24;
  CMTime v25;

  v6 = a3;
  v7 = self->_isSeeking;
  objc_sync_enter(v7);
  v8 = -[NSNumber BOOLValue](self->_isSeeking, "BOOLValue");
  objc_sync_exit(v7);

  if (!v8)
  {
    -[QLMediaItemViewController showTimeLabel](self, "showTimeLabel");
    memset(&v25, 0, sizeof(v25));
    -[QLMediaItemBaseViewController player](self, "player");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "asset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      objc_msgSend(v11, "duration");
    else
      memset(&v25, 0, sizeof(v25));

    memset(&v24, 0, sizeof(v24));
    time = v25;
    CMTimeMultiplyByFloat64(&v24, &time, a4);
    v13 = self->_isSeeking;
    objc_sync_enter(v13);
    isSeeking = self->_isSeeking;
    self->_isSeeking = (NSNumber *)MEMORY[0x24BDBD1C8];

    objc_sync_exit(v13);
    objc_initWeak(&location, self);
    -[QLMediaItemBaseViewController player](self, "player");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __53__QLMediaItemViewController_scrubber_didChangeValue___block_invoke;
    v20[3] = &unk_24C726710;
    objc_copyWeak(&v21, &location);
    time = v24;
    v18 = *MEMORY[0x24BDC0D88];
    v19 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    v16 = v18;
    v17 = v19;
    objc_msgSend(v15, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &time, &v18, &v16, v20);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

}

void __53__QLMediaItemViewController_scrubber_didChangeValue___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v2 = WeakRetained[167];
    objc_sync_enter(v2);
    v3 = v4[167];
    v4[167] = (id)MEMORY[0x24BDBD1C0];

    objc_sync_exit(v2);
    WeakRetained = v4;
  }

}

- (QLMediaScrubberGesture)scrubGesture
{
  return self->_scrubGesture;
}

- (void)setScrubGesture:(id)a3
{
  objc_storeStrong((id *)&self->_scrubGesture, a3);
}

- (UITapGestureRecognizer)tapToPlayGesture
{
  return self->_tapToPlayGesture;
}

- (void)setTapToPlayGesture:(id)a3
{
  objc_storeStrong((id *)&self->_tapToPlayGesture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapToPlayGesture, 0);
  objc_storeStrong((id *)&self->_scrubGesture, 0);
  objc_storeStrong((id *)&self->_isSeeking, 0);
  objc_storeStrong((id *)&self->_playbackTimeHiddenTimer, 0);
  objc_storeStrong((id *)&self->_timeLabelConstraintY, 0);
  objc_storeStrong((id *)&self->_timeLabelConstraintX, 0);
  objc_storeStrong((id *)&self->_scrubberScrollView, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_timeLabelBackground, 0);
  objc_storeStrong((id *)&self->_playingInfo, 0);
}

@end
