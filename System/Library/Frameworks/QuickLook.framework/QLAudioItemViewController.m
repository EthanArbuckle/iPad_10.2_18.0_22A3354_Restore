@implementation QLAudioItemViewController

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  objc_super v11;
  _QWORD v12[4];
  id v13;
  QLAudioItemViewController *v14;
  id v15;

  v8 = a4;
  v12[1] = 3221225472;
  v12[2] = __89__QLAudioItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke;
  v12[3] = &unk_24C726170;
  v14 = self;
  v15 = a5;
  v13 = v8;
  v11.receiver = self;
  v11.super_class = (Class)QLAudioItemViewController;
  v12[0] = MEMORY[0x24BDAC760];
  v9 = v15;
  v10 = v8;
  -[QLMediaItemViewController loadPreviewControllerWithContents:context:completionHandler:](&v11, sel_loadPreviewControllerWithContents_context_completionHandler_, a3, v10, v12);

}

void __89__QLAudioItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject **v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
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
  QLOverlayPlayButton *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QLAudioScrubberViewContainer *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  int v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (NSObject **)MEMORY[0x24BE7BF48];
    v5 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(void **)(a1 + 32);
      v7 = v5;
      objc_msgSend(v6, "previewTitle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138412546;
      v32 = v8;
      v33 = 2112;
      v34 = v3;
      _os_log_impl(&dword_20D4F5000, v7, OS_LOG_TYPE_ERROR, "Error while loading preview controller with preview item with name: %@: %@ #Generic", (uint8_t *)&v31, 0x16u);

    }
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "scrollView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pinchGestureRecognizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEnabled:", 0);

    objc_msgSend(*(id *)(a1 + 40), "scrollView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "panGestureRecognizer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setEnabled:", 0);

    v14 = (void *)MEMORY[0x24BEBD660];
    objc_msgSend(*(id *)(a1 + 40), "waveformImageDimension");
    objc_msgSend(v14, "configurationWithPointSize:weight:scale:", 3, -1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "iconImageWithConfiguration:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v16);
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTintColor:", v18);

    objc_msgSend(*(id *)(a1 + 40), "imageAccessibilityIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAccessibilityIdentifier:", v19);

    objc_msgSend(*(id *)(a1 + 40), "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSubview:", v17);

    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 1360), v17);
    v21 = objc_alloc_init(QLOverlayPlayButton);
    v22 = *(_QWORD *)(a1 + 40);
    v23 = *(void **)(v22 + 1368);
    *(_QWORD *)(v22 + 1368) = v21;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1368), "setTarget:action:", *(_QWORD *)(a1 + 40), sel_play);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1368), "setAlpha:", 0.0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1368), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(*(id *)(a1 + 40), "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1368));

    objc_msgSend(*(id *)(a1 + 40), "setupConstraints");
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", *(_QWORD *)(a1 + 40), sel__tapRecognized_);
    objc_msgSend(*(id *)(a1 + 40), "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addGestureRecognizer:", v25);

    if (objc_msgSend(*(id *)(a1 + 40), "usesScrubber"))
    {
      v27 = objc_alloc_init(_QLAudioScrubberViewContainer);
      v28 = *(_QWORD *)(a1 + 40);
      v29 = *(void **)(v28 + 1376);
      *(_QWORD *)(v28 + 1376) = v27;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1376), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1376), "setUserInteractionEnabled:", 1);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1376), "setAlpha:", 1.0);
      objc_msgSend(*(id *)(a1 + 40), "addScrubberWithDeferral");
    }
    v30 = *(_QWORD *)(a1 + 48);
    if (v30)
      (*(void (**)(uint64_t, _QWORD))(v30 + 16))(v30, 0);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[QLVideoScrubberView removeObserver:forKeyPath:context:](self->_scrubber, "removeObserver:forKeyPath:context:", self, CFSTR("userInteractingWithScrubber"), 0);
  v3.receiver = self;
  v3.super_class = (Class)QLAudioItemViewController;
  -[QLMediaItemViewController dealloc](&v3, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v7;

  if (self->_scrubber == a4)
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("userInteractingWithScrubber")))
    {
      if (-[QLVideoScrubberView isUserInteractingWithScrubber](self->_scrubber, "isUserInteractingWithScrubber"))
        -[QLMediaItemViewController showTimeLabelIfNeeded](self, "showTimeLabelIfNeeded");
      else
        -[QLMediaItemViewController hideTimeLabelAfterDelay](self, "hideTimeLabelAfterDelay");
      -[QLAudioItemViewController didChangePlayingStatus](self, "didChangePlayingStatus");
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)QLAudioItemViewController;
    -[QLMediaItemViewController observeValueForKeyPath:ofObject:change:context:](&v7, sel_observeValueForKeyPath_ofObject_change_context_, a3);
  }
}

- (void)addScrubberWithDeferral
{
  dispatch_time_t v3;
  _QWORD block[5];

  if (!self->_scrubber)
  {
    if (self->_scrubberContainer)
    {
      v3 = dispatch_time(0, 500000000);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __52__QLAudioItemViewController_addScrubberWithDeferral__block_invoke;
      block[3] = &unk_24C724B00;
      block[4] = self;
      dispatch_after(v3, MEMORY[0x24BDAC9B8], block);
    }
  }
}

uint64_t __52__QLAudioItemViewController_addScrubberWithDeferral__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  QLWaveformScrubberViewProvider *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
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
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[5];
  const __CFString *v44;
  uint64_t v45;
  const __CFString *v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(result + 32);
  if (!*(_QWORD *)(v1 + 1392))
  {
    if (*(_BYTE *)(v1 + 1408))
    {
      v2 = result;
      v3 = objc_opt_new();
      v4 = *(_QWORD *)(v2 + 32);
      v5 = *(void **)(v4 + 1384);
      *(_QWORD *)(v4 + 1384) = v3;

      objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 1384), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 1384), "setShowsHorizontalScrollIndicator:", 0);
      objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 1384), "setBounces:", 0);
      v6 = objc_opt_new();
      v7 = *(_QWORD *)(v2 + 32);
      v8 = *(void **)(v7 + 1392);
      *(_QWORD *)(v7 + 1392) = v6;

      v9 = objc_alloc_init(QLWaveformScrubberViewProvider);
      v10 = *(_QWORD *)(v2 + 32);
      v11 = *(void **)(v10 + 1400);
      *(_QWORD *)(v10 + 1400) = v9;

      objc_msgSend(*(id *)(v2 + 32), "player");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 1392), "photosScrubber");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setPlayer:", v12);

      v14 = *(_QWORD *)(v2 + 32);
      v15 = *(_QWORD *)(v14 + 1400);
      objc_msgSend(*(id *)(v14 + 1392), "photosScrubber");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setFilmstripViewProvider:", v15);

      objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 1392), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(*(id *)(v2 + 32), "mediaDuration");
      v18 = v17;
      objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 1392), "photosScrubber");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setEstimatedDuration:", v18);

      objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 1392), "addObserver:forKeyPath:options:context:", *(_QWORD *)(v2 + 32), CFSTR("userInteractingWithScrubber"), 1, 0);
      objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 1392), "scrollView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setContentInsetAdjustmentBehavior:", 2);

      objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 1392), "setAlpha:", 0.0);
      v43[0] = MEMORY[0x24BDAC760];
      v43[1] = 3221225472;
      v43[2] = __52__QLAudioItemViewController_addScrubberWithDeferral__block_invoke_2;
      v43[3] = &unk_24C724B00;
      v43[4] = *(_QWORD *)(v2 + 32);
      objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v43, 0.2);
      objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 1384), "addSubview:", *(_QWORD *)(*(_QWORD *)(v2 + 32) + 1392));
      objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 1376), "addSubview:", *(_QWORD *)(*(_QWORD *)(v2 + 32) + 1384));
      objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 1376), "leadingAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 1392), "leadingAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintEqualToAnchor:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setActive:", 1);

      objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 1376), "trailingAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 1392), "trailingAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "constraintEqualToAnchor:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setActive:", 1);

      objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 1376), "topAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 1392), "topAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "constraintEqualToAnchor:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setActive:", 1);

      objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 1376), "bottomAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 1392), "bottomAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "constraintEqualToAnchor:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setActive:", 1);

      v33 = *(_QWORD *)(v2 + 32);
      v34 = *(void **)(v33 + 1376);
      v35 = (void *)MEMORY[0x24BDD1628];
      v46 = CFSTR("scrubberContainerScrollView");
      v47[0] = *(_QWORD *)(v33 + 1384);
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[scrubberContainerScrollView]|"), 0, 0, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addConstraints:", v37);

      v38 = *(_QWORD *)(v2 + 32);
      v39 = *(void **)(v38 + 1376);
      v40 = (void *)MEMORY[0x24BDD1628];
      v44 = CFSTR("scrubberContainerScrollView");
      v45 = *(_QWORD *)(v38 + 1384);
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[scrubberContainerScrollView]|"), 0, 0, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addConstraints:", v42);

      return objc_msgSend(*(id *)(v2 + 32), "showTimeLabelIfNeeded");
    }
  }
  return result;
}

uint64_t __52__QLAudioItemViewController_addScrubberWithDeferral__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1392), "setAlpha:", 1.0);
}

- (void)previewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)QLAudioItemViewController;
  -[QLMediaItemViewController previewDidAppear:](&v4, sel_previewDidAppear_, a3);
  self->_previewIsVisisble = 1;
  -[QLAudioItemViewController addScrubberWithDeferral](self, "addScrubberWithDeferral");
}

- (void)previewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)QLAudioItemViewController;
  -[QLMediaItemViewController previewDidDisappear:](&v4, sel_previewDidDisappear_, a3);
  self->_previewIsVisisble = 0;
}

- (BOOL)canPerformFirstTimeAppearanceActions:(unint64_t)a3
{
  return a3 & 1;
}

- (void)buttonPressedWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("QLDoneButtonIdentifier")))
    -[QLMediaItemBaseViewController stop](self, "stop");
  v8.receiver = self;
  v8.super_class = (Class)QLAudioItemViewController;
  -[QLMediaItemBaseViewController buttonPressedWithIdentifier:completionHandler:](&v8, sel_buttonPressedWithIdentifier_completionHandler_, v6, v7);

}

- (void)setPlayControlsHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  double v7;
  _QWORD v8[5];
  BOOL v9;

  v4 = a4;
  v5 = a3;
  -[QLOverlayPlayButton alpha](self->_playButton, "alpha");
  if (v7 == (double)v5)
  {
    if (v4)
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __60__QLAudioItemViewController_setPlayControlsHidden_animated___block_invoke;
      v8[3] = &unk_24C724CF8;
      v8[4] = self;
      v9 = v5;
      objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v8, 0.2);
    }
    else
    {
      -[QLOverlayPlayButton setAlpha:](self->_playButton, "setAlpha:", (double)!v5);
    }
  }
}

uint64_t __60__QLAudioItemViewController_setPlayControlsHidden_animated___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1368), "setAlpha:", v1);
}

- (void)didChangePlayingStatus
{
  int64_t v3;
  BOOL v4;
  uint64_t v5;

  v3 = -[QLMediaItemBaseViewController playingStatus](self, "playingStatus");
  v4 = -[QLVideoScrubberView isUserInteractingWithScrubber](self->_scrubber, "isUserInteractingWithScrubber");
  v5 = 1;
  if (!v4 && v3 != 1)
    v5 = -[QLMediaItemBaseViewController playable](self, "playable", 1) ^ 1;
  -[QLAudioItemViewController setPlayControlsHidden:animated:](self, "setPlayControlsHidden:animated:", v5, 0);
}

- (id)accessoryView
{
  return self->_scrubberContainer;
}

- (id)timeLabelScrollView
{
  return -[QLVideoScrubberView scrollView](self->_scrubber, "scrollView");
}

- (BOOL)canEnterFullScreen
{
  return 0;
}

- (void)transitionDidStart:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (!a3 || -[QLMediaItemBaseViewController playingStatus](self, "playingStatus") != 1)
    -[QLAudioItemViewController setPlayControlsHidden:animated:](self, "setPlayControlsHidden:animated:", !v3, 1);
}

- (void)transitionDidFinish:(BOOL)a3 didComplete:(BOOL)a4
{
  if (!a4 && -[QLMediaItemBaseViewController playingStatus](self, "playingStatus", a3) != 1)
    -[QLAudioItemViewController setPlayControlsHidden:animated:](self, "setPlayControlsHidden:animated:", 0, 1);
}

- (void)setupConstraints
{
  double v3;
  double v4;
  double v5;
  double v6;
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
  id v22;

  if (self->_backgroundIconImageView)
  {
    -[QLAudioItemViewController waveformImageDimension](self, "waveformImageDimension");
    v4 = v3;
    -[QLAudioItemViewController maximumWaveformDimension](self, "maximumWaveformDimension");
    v6 = v4 / v5 * 13.0;
    -[QLAudioItemViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDD1628];
    -[QLAudioItemViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 10, 0, self->_backgroundIconImageView, 10, 1.0, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addConstraint:", v10);

    -[QLAudioItemViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDD1628];
    -[QLAudioItemViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, 9, 0, self->_backgroundIconImageView, 9, 1.0, 0.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addConstraint:", v14);

  }
  if (self->_playButton)
  {
    -[QLAudioItemViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x24BDD1628];
    -[QLAudioItemViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 9, 0, self->_playButton, 9, 1.0, 0.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addConstraint:", v18);

    -[QLAudioItemViewController view](self, "view");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x24BDD1628];
    -[QLAudioItemViewController view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v20, 10, 0, self->_playButton, 10, 1.0, 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addConstraint:", v21);

  }
}

- (double)waveformImageDimension
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double result;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;

  if (v5 >= v8)
    v5 = v8;
  -[QLAudioItemViewController maximumWaveformDimension](self, "maximumWaveformDimension");
  v10 = v5 - v9;
  -[QLAudioItemViewController maximumWaveformDimension](self, "maximumWaveformDimension");
  if (v10 < result)
    return v10;
  return result;
}

- (id)iconImageWithConfiguration:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("waveform.path"), a3);
}

- (id)imageAccessibilityIdentifier
{
  return CFSTR("QLAudioItemViewControllerQuickTimeImageViewAccessibilityIdentifier");
}

- (BOOL)usesScrubber
{
  return 1;
}

- (double)maximumWaveformDimension
{
  return 200.0;
}

- (BOOL)supportsChromeless
{
  return 0;
}

- (NSLayoutConstraint)topScrubber
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1416, 1);
}

- (void)setTopScrubber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1416);
}

- (UIView)scrubberContainer
{
  return (UIView *)objc_getProperty(self, a2, 1376, 1);
}

- (void)setScrubberContainer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1376);
}

- (BOOL)scrubbing
{
  return self->_scrubbing;
}

- (void)setScrubbing:(BOOL)a3
{
  self->_scrubbing = a3;
}

- (double)scrubberVerticalOffset
{
  return self->_scrubberVerticalOffset;
}

- (void)setScrubberVerticalOffset:(double)a3
{
  self->_scrubberVerticalOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topScrubber, 0);
  objc_storeStrong((id *)&self->_scrubberViewProvider, 0);
  objc_storeStrong((id *)&self->_scrubber, 0);
  objc_storeStrong((id *)&self->_scrubberContainerScrollView, 0);
  objc_storeStrong((id *)&self->_scrubberContainer, 0);
  objc_storeStrong((id *)&self->_playButton, 0);
  objc_storeStrong((id *)&self->_backgroundIconImageView, 0);
}

@end
