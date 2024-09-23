@implementation QLHapticItemViewController

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject **v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id buf[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (NSObject **)MEMORY[0x24BE7BF48];
  v12 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v12 = *v11;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_20D4F5000, v12, OS_LOG_TYPE_INFO, "QLHapticItemViewController loadPreviewControllerWithContents #Media", (uint8_t *)buf, 2u);
  }
  -[QLHapticItemViewController setHasAudioCustom:](self, "setHasAudioCustom:", 0);
  objc_initWeak(buf, self);
  v13 = v8;
  objc_copyWeak(&v16, buf);
  v15 = v10;
  v14 = v9;
  QLRunInBackgroundThread();

  objc_destroyWeak(&v16);
  objc_destroyWeak(buf);

}

void __90__QLHapticItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  id v7;
  id *v8;
  id *v9;
  NSObject **v10;
  NSObject *v11;
  NSObject **v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17[5];
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained(a1 + 8);
  v19 = 0;
  objc_msgSend(WeakRetained, "makeAVAssetFromAHAP:error:", v4, &v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v19;

  if (!v6 || v7)
  {
    (*((void (**)(void))a1[7] + 2))();
  }
  else
  {
    v8 = (id *)objc_loadWeakRetained(a1 + 8);
    v9 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 142, v6);
      if ((objc_msgSend(v9, "canPlayHaptics") & 1) != 0)
      {
        if (objc_msgSend(v9, "hasAudioCustom"))
        {
          v17[1] = (id)MEMORY[0x24BDAC760];
          v17[2] = (id)3221225472;
          v17[3] = __90__QLHapticItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_1;
          v17[4] = &unk_24C725230;
          objc_copyWeak(&v18, a1 + 8);
          QLRunInMainThread();
          objc_destroyWeak(&v18);
        }
        v14 = v6;
        v15 = a1[5];
        v16 = a1[7];
        objc_copyWeak(v17, a1 + 8);
        QLRunInMainThread();
        objc_destroyWeak(v17);

      }
      else
      {
        v12 = (NSObject **)MEMORY[0x24BE7BF48];
        v13 = *MEMORY[0x24BE7BF48];
        if (!*MEMORY[0x24BE7BF48])
        {
          QLSInitLogging();
          v13 = *v12;
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20D4F5000, v13, OS_LOG_TYPE_INFO, "Device does not support haptics. Calling for unavailable config #AnyItemViewController", buf, 2u);
        }
        objc_msgSend(v9, "_setNeedsUpdateContentUnavailableConfiguration");
        (*((void (**)(void))a1[7] + 2))();
      }
    }
    else
    {
      v10 = (NSObject **)MEMORY[0x24BE7BF48];
      v11 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        QLSInitLogging();
        v11 = *v10;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v21 = "-[QLHapticItemViewController loadPreviewControllerWithContents:context:completionHandler:]_block_invoke";
        _os_log_impl(&dword_20D4F5000, v11, OS_LOG_TYPE_INFO, "%s: is not available #AnyItemViewController", buf, 0xCu);
      }
      objc_msgSend(0, "_setNeedsUpdateContentUnavailableConfiguration");
      (*((void (**)(void))a1[7] + 2))();
    }

  }
}

void __90__QLHapticItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_1(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setupMissingAudioCustomLabel");

}

void __90__QLHapticItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  objc_super v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __90__QLHapticItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_3;
  v6[3] = &unk_24C725F28;
  v7 = v2;
  v8 = *(id *)(a1 + 56);
  objc_copyWeak(&v9, (id *)(a1 + 64));
  v5.receiver = v3;
  v5.super_class = (Class)QLHapticItemViewController;
  objc_msgSendSuper2(&v5, sel_loadPreviewControllerWithContents_context_completionHandler_, v4, v7, v6);
  objc_destroyWeak(&v9);

}

void __90__QLHapticItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject **v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void (*v10)(void);
  id WeakRetained;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
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
      v13 = 138412546;
      v14 = v8;
      v15 = 2112;
      v16 = v3;
      _os_log_impl(&dword_20D4F5000, v7, OS_LOG_TYPE_ERROR, "Error while loading preview controller with preview item with name: %@: %@ #AnyItemViewController", (uint8_t *)&v13, 0x16u);

    }
    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
    {
      v10 = *(void (**)(void))(v9 + 16);
LABEL_10:
      v10();
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "showTimeLabelIfNeeded");

    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
    {
      v10 = *(void (**)(void))(v12 + 16);
      goto LABEL_10;
    }
  }

}

- (void)_setupMissingAudioCustomLabel
{
  UILabel *v3;
  UILabel *missingAudioCustomLabel;
  UILabel *v5;
  void *v6;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  missingAudioCustomLabel = self->_missingAudioCustomLabel;
  self->_missingAudioCustomLabel = v3;

  v5 = self->_missingAudioCustomLabel;
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v5, "setFont:", v6);

  v7 = self->_missingAudioCustomLabel;
  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v7, "setTextColor:", v8);

  -[UILabel setAdjustsFontForContentSizeCategory:](self->_missingAudioCustomLabel, "setAdjustsFontForContentSizeCategory:", 1);
  -[UILabel setTextAlignment:](self->_missingAudioCustomLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_missingAudioCustomLabel, "setNumberOfLines:", 0);
  -[UILabel setLineBreakMode:](self->_missingAudioCustomLabel, "setLineBreakMode:", 0);
  v9 = self->_missingAudioCustomLabel;
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](v9, "setBackgroundColor:", v10);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_missingAudioCustomLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v11 = (void *)MEMORY[0x24BDD17C8];
  QLLocalizedString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringWithFormat:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_missingAudioCustomLabel, "setText:", v13);

  -[QLHapticItemViewController view](self, "view");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", self->_missingAudioCustomLabel);

}

- (BOOL)canPlayHaptics
{
  void *v2;
  char v3;
  void *v4;
  char v5;

  -[QLHapticItemViewController playerItem](self, "playerItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) == 0)
    return 0;
  objc_msgSend(MEMORY[0x24BDBF5C0], "capabilitiesForHardware");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsHaptics");

  return v5;
}

- (id)iconImageWithConfiguration:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:withConfiguration:", CFSTR("apple.haptics"), a3);
}

- (id)imageAccessibilityIdentifer
{
  return CFSTR("QLHapticItemViewControllerAhapconImageViewAccessibilityIdentifier");
}

- (BOOL)usesScrubber
{
  return 0;
}

- (id)playerItem
{
  AVPlayerItem *playerItem;
  AVPlayerItem *v4;
  AVPlayerItem *v5;

  playerItem = self->_playerItem;
  if (!playerItem)
  {
    if (self->super.super.super._mediaAsset)
    {
      objc_msgSend(MEMORY[0x24BDB2618], "playerItemWithAsset:");
      v4 = (AVPlayerItem *)objc_claimAutoreleasedReturnValue();
      v5 = self->_playerItem;
      self->_playerItem = v4;

      playerItem = self->_playerItem;
    }
    else
    {
      playerItem = 0;
    }
  }
  return playerItem;
}

- (id)player
{
  AVPlayer *player;
  void *v4;
  AVPlayer *v5;
  AVPlayer *v6;

  player = self->super.super.super._player;
  if (!player)
  {
    if (self->super.super.super._mediaAsset)
    {
      -[QLHapticItemViewController playerItem](self, "playerItem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v4, "setPlayHapticTracks:", 1);
      objc_msgSend(MEMORY[0x24BDB2610], "playerWithPlayerItem:", v4);
      v5 = (AVPlayer *)objc_claimAutoreleasedReturnValue();
      v6 = self->super.super.super._player;
      self->super.super.super._player = v5;

      player = self->super.super.super._player;
    }
    else
    {
      player = 0;
    }
  }
  return player;
}

- (int64_t)playbackTimeFormat
{
  return 1;
}

- (BOOL)_assetIsDecodable:(id)a3
{
  return 1;
}

- (void)showTimeLabelIfNeeded
{
  void *v3;
  void *v4;
  _BOOL4 v5;
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
        if (objc_msgSend(v4, "presentationMode"))
        {
          v5 = -[QLHapticItemViewController canPlayHaptics](self, "canPlayHaptics");

          if (v5)
            -[QLMediaItemViewController showTimeLabel](self, "showTimeLabel");
          return;
        }

      }
    }

  }
}

- (void)setupConstraints
{
  id v3;
  UILabel *missingAudioCustomLabel;
  unint64_t v5;
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
  UIImageView *backgroundIconImageView;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  QLOverlayPlayButton *playButton;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[4];

  v47[3] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  missingAudioCustomLabel = self->_missingAudioCustomLabel;
  v5 = 0x24BDBC000;
  if (missingAudioCustomLabel)
  {
    -[UILabel topAnchor](missingAudioCustomLabel, "topAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLHapticItemViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutMarginsGuide");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:constant:", v9, 8.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel leftAnchor](self->_missingAudioCustomLabel, "leftAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLHapticItemViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layoutMarginsGuide");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "leftAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel rightAnchor](self->_missingAudioCustomLabel, "rightAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLHapticItemViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layoutMarginsGuide");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "rightAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = 0x24BDBC000uLL;
    -[UILabel sizeToFit](self->_missingAudioCustomLabel, "sizeToFit");
    v47[0] = v10;
    v47[1] = v15;
    v47[2] = v20;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v21);

  }
  backgroundIconImageView = self->super._backgroundIconImageView;
  if (backgroundIconImageView)
  {
    -[UIImageView centerXAnchor](backgroundIconImageView, "centerXAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLHapticItemViewController view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "centerXAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIImageView centerYAnchor](self->super._backgroundIconImageView, "centerYAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLHapticItemViewController view](self, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "centerYAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_missingAudioCustomLabel)
    {
      LODWORD(v31) = 1131741184;
      objc_msgSend(v30, "setPriority:", v31);
      -[UIImageView topAnchor](self->super._backgroundIconImageView, "topAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel bottomAnchor](self->_missingAudioCustomLabel, "bottomAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "constraintGreaterThanOrEqualToAnchor:constant:", v33, 8.0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v34);

    }
    v46[0] = v26;
    v46[1] = v30;
    objc_msgSend(*(id *)(v5 + 3632), "arrayWithObjects:count:", v46, 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v35);

    v36 = v5;
    playButton = self->super._playButton;
    if (playButton)
    {
      -[QLOverlayPlayButton centerYAnchor](playButton, "centerYAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView centerYAnchor](self->super._backgroundIconImageView, "centerYAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "constraintEqualToAnchor:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLOverlayPlayButton centerXAnchor](self->super._playButton, "centerXAnchor", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView centerXAnchor](self->super._backgroundIconImageView, "centerXAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "constraintEqualToAnchor:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v45[1] = v43;
      objc_msgSend(*(id *)(v36 + 3632), "arrayWithObjects:count:", v45, 2);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObjectsFromArray:", v44);

    }
  }
  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v3);

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
  v8.super_class = (Class)QLHapticItemViewController;
  -[QLHapticItemViewController viewDidLoad](&v8, sel_viewDidLoad);
  objc_initWeak(&location, self);
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __41__QLHapticItemViewController_viewDidLoad__block_invoke;
  v5[3] = &unk_24C724AD8;
  objc_copyWeak(&v6, &location);
  v4 = (id)-[QLHapticItemViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v3, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __41__QLHapticItemViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)WeakRetained[180];
  if (v2)
  {
    v3 = WeakRetained;
    objc_msgSend(v2, "sizeToFit");
    WeakRetained = v3;
  }

}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (!-[QLHapticItemViewController canPlayHaptics](self, "canPlayHaptics", a3))
  {
    objc_msgSend(MEMORY[0x24BEBD4E8], "emptyProminentConfiguration");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x24BDD17C8];
    QLLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringWithFormat:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v6);

    v7 = (void *)MEMORY[0x24BDD17C8];
    QLLocalizedString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSecondaryText:", v9);

    -[QLHapticItemViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", v10);
  }
}

- (BOOL)play
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __int128 v9;
  uint64_t v10;

  v3 = -[QLMediaItemBaseViewController isVisible](self, "isVisible");
  if (v3)
  {
    -[QLHapticItemViewController player](self, "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "status");

    if (v5 == 1)
    {
      -[QLHapticItemViewController player](self, "player");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *MEMORY[0x24BDC0D88];
      v10 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
      objc_msgSend(v6, "seekToTime:", &v9);

      -[QLHapticItemViewController player](self, "player");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "play");

      LOBYTE(v3) = 1;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (float)playerTimeObservationInterval
{
  return 0.05;
}

- (id)playbackObserverBlock
{
  void *v3;
  _QWORD aBlock[5];
  id v6;
  id location;

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__QLHapticItemViewController_playbackObserverBlock__block_invoke;
  aBlock[3] = &unk_24C725FA0;
  objc_copyWeak(&v6, &location);
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

void __51__QLHapticItemViewController_playbackObserverBlock__block_invoke(uint64_t a1, CMTime *a2)
{
  id *v4;
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double Seconds;
  id v12;
  double v13;
  CMTime v14;
  CMTime time;

  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  time = *a2;
  objc_msgSend(WeakRetained, "observePlayingTime:", &time);

  time = *a2;
  *(Float64 *)(*(_QWORD *)(a1 + 32) + 1448) = CMTimeGetSeconds(&time);
  v6 = objc_loadWeakRetained(v4);
  objc_msgSend(v6, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "asset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "duration");
  else
    memset(&v14, 0, sizeof(v14));
  Seconds = CMTimeGetSeconds(&v14);
  v12 = objc_loadWeakRetained(v4);
  objc_msgSend(v12, "elapsedTime");
  *(double *)(*(_QWORD *)(a1 + 32) + 1456) = Seconds - v13;

}

- (id)stringFromTimeInterval:(double)a3
{
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (stringFromTimeInterval__onceToken != -1)
    dispatch_once(&stringFromTimeInterval__onceToken, &__block_literal_global_7);
  HIDWORD(v4) = 1078853632;
  if (a3 <= 60.0)
  {
    v6 = (void *)stringFromTimeInterval__millisecondTimeFormatter;
    *(float *)&v4 = a3;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromNumber:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x24BDD17C8];
    QLLocalizedStringWithDefaultValue();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithFormat:", v10, v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend((id)stringFromTimeInterval__minuteSecondFormatter, "stringFromTimeInterval:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

void __53__QLHapticItemViewController_stringFromTimeInterval___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_alloc(MEMORY[0x24BDBCEA0]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v0, "initWithLocaleIdentifier:", v2);

  objc_msgSend(v8, "setLocale:", v3);
  v4 = objc_alloc_init(MEMORY[0x24BDD14F8]);
  v5 = (void *)stringFromTimeInterval__minuteSecondFormatter;
  stringFromTimeInterval__minuteSecondFormatter = (uint64_t)v4;

  objc_msgSend((id)stringFromTimeInterval__minuteSecondFormatter, "setCalendar:", v8);
  objc_msgSend((id)stringFromTimeInterval__minuteSecondFormatter, "setAllowedUnits:", 192);
  objc_msgSend((id)stringFromTimeInterval__minuteSecondFormatter, "setUnitsStyle:", 0);
  objc_msgSend((id)stringFromTimeInterval__minuteSecondFormatter, "setZeroFormattingBehavior:", 0x10000);
  objc_msgSend((id)stringFromTimeInterval__minuteSecondFormatter, "setAllowsFractionalUnits:", 1);
  v6 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  v7 = (void *)stringFromTimeInterval__millisecondTimeFormatter;
  stringFromTimeInterval__millisecondTimeFormatter = (uint64_t)v6;

  objc_msgSend((id)stringFromTimeInterval__millisecondTimeFormatter, "setNumberStyle:", 1);
  objc_msgSend((id)stringFromTimeInterval__millisecondTimeFormatter, "setRoundingMode:", 5);
  objc_msgSend((id)stringFromTimeInterval__millisecondTimeFormatter, "setLocale:", v3);
  objc_msgSend((id)stringFromTimeInterval__millisecondTimeFormatter, "setPaddingPosition:", 0);
  objc_msgSend((id)stringFromTimeInterval__millisecondTimeFormatter, "setPaddingCharacter:", CFSTR("0"));
  objc_msgSend((id)stringFromTimeInterval__millisecondTimeFormatter, "setMinimumIntegerDigits:", 2);
  objc_msgSend((id)stringFromTimeInterval__millisecondTimeFormatter, "setMinimumFractionDigits:", 1);
  objc_msgSend((id)stringFromTimeInterval__millisecondTimeFormatter, "setMaximumFractionDigits:", 1);

}

- (id)toolbarButtonsForTraitCollection:(id)a3
{
  void *v4;
  __CFString **v5;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  if (!-[QLMediaItemBaseViewController shouldDisplayPlayButtonInNavigationBar](self, "shouldDisplayPlayButtonInNavigationBar", a3)|| !-[QLMediaItemBaseViewController playable](self, "playable"))
  {
    return MEMORY[0x24BDBD1A8];
  }
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7BFD8]), "initWithIdentifier:", CFSTR("togglePlay"));
  objc_msgSend(v4, "setPlacement:", 0);
  if (-[QLMediaItemBaseViewController playingStatus](self, "playingStatus") == 1)
  {
    objc_msgSend(v4, "setSymbolImageName:", CFSTR("stop.fill"));
    v5 = QLMediaItemViewControllerBarPlayButtonPlayingAccessibilityIdentifier;
  }
  else
  {
    objc_msgSend(v4, "setSymbolImageName:", 0);
    objc_msgSend(v4, "setSystemItem:", 17);
    v5 = QLMediaItemViewControllerBarPlayButtonPausedAccessibilityIdentifier;
  }
  objc_msgSend(v4, "setAccessibilityIdentifier:", *v5);
  v8[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (double)remainingTime
{
  return self->_remainingTime;
}

- (id)makeAVAssetFromAHAP:(id)a3 error:(id *)a4
{
  opaqueCMSampleBuffer *v5;
  NSObject **v6;
  NSObject *v7;
  id v8;
  opaqueCMSampleBuffer *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject **v14;
  NSObject *v15;
  id v16;
  id v17;
  void *v18;
  NSObject **v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  CMTimeRange v29;
  CMTimeRange start;
  CMTime duration;
  CMTimeRange buf;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = -[QLHapticItemViewController createSampleBufferFromAHAP:error:](self, "createSampleBufferFromAHAP:error:", a3);
  if (v5 && !*a4)
  {
    v10 = v5;
    v11 = (void *)MEMORY[0x24BDB25C0];
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &movieHeaderMPEG4, 148);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "movieWithData:options:error:", v12, 0, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 && !*a4)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "_QLCreateTemporaryDirectory:", a4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18 && !*a4)
      {
        objc_msgSend(MEMORY[0x24BDD1880], "UUID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "UUIDString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "URLByAppendingPathComponent:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB2560]), "initWithURL:options:", v24, 0);
        objc_msgSend(v13, "setDefaultMediaDataStorage:", v25);

        objc_msgSend(v13, "addMutableTrackWithMediaType:copySettingsFromTrack:options:", *MEMORY[0x24BDB1D08], 0, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v26, "appendSampleBuffer:decodeTime:presentationTime:error:", v10, 0, 0, a4) & 1) != 0)
        {
          memset(&buf, 0, sizeof(buf));
          CMSampleBufferGetDuration(&duration, v10);
          *(_OWORD *)&start.start.value = *MEMORY[0x24BDC0D88];
          start.start.epoch = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
          CMTimeRangeMake(&buf, &start.start, &duration);
          start = buf;
          v29 = buf;
          objc_msgSend(v26, "insertMediaTimeRange:intoTimeRange:", &start, &v29);
          v17 = v13;
        }
        else
        {
          QLSLogHandle();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            v28 = *a4;
            LODWORD(buf.start.value) = 138412290;
            *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v28;
            _os_log_impl(&dword_20D4F5000, v27, OS_LOG_TYPE_ERROR, "Failed to create an AVMutableMovieTrack for haptics: %@ #AnyItemViewController", (uint8_t *)&buf, 0xCu);
          }

          v17 = 0;
        }

      }
      else
      {
        v19 = (NSObject **)MEMORY[0x24BE7BF48];
        v20 = *MEMORY[0x24BE7BF48];
        if (!*MEMORY[0x24BE7BF48])
        {
          QLSInitLogging();
          v20 = *v19;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = *a4;
          LODWORD(buf.start.value) = 138412290;
          *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v21;
          _os_log_impl(&dword_20D4F5000, v20, OS_LOG_TYPE_ERROR, "Failed to create a temporary directory: %@ #AnyItemViewController", (uint8_t *)&buf, 0xCu);
        }
        v17 = 0;
      }

    }
    else
    {
      v14 = (NSObject **)MEMORY[0x24BE7BF48];
      v15 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        QLSInitLogging();
        v15 = *v14;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = *a4;
        LODWORD(buf.start.value) = 138412290;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v16;
        _os_log_impl(&dword_20D4F5000, v15, OS_LOG_TYPE_ERROR, "Failed to create an AVMutableMovie: %@ #AnyItemViewController", (uint8_t *)&buf, 0xCu);
      }
      v17 = 0;
    }

    return v17;
  }
  else
  {
    v6 = (NSObject **)MEMORY[0x24BE7BF48];
    v7 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v7 = *v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *a4;
      LODWORD(buf.start.value) = 138412290;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v8;
      _os_log_impl(&dword_20D4F5000, v7, OS_LOG_TYPE_ERROR, "Failed to create a sample buffer with AHAP contents: %@ #AnyItemViewController", (uint8_t *)&buf, 0xCu);
    }
    return 0;
  }
}

- (id)filterPatternDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("Pattern"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexesOfObjectsPassingTest:", &__block_literal_global_63);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    self->_hasAudioCustom = 1;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectsAtIndexes:", v6);
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("Pattern"));

  }
  v8 = (void *)objc_msgSend(v4, "copy");

  return v8;
}

uint64_t __54__QLHapticItemViewController_filterPatternDictionary___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("Event"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("EventType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AudioCustom"));

  return v4;
}

- (opaqueCMSampleBuffer)createSampleBufferFromAHAP:(id)a3 error:(id *)a4
{
  id v6;
  const __CFAllocator *v7;
  OSStatus v8;
  NSObject **v9;
  NSObject *v10;
  id v11;
  opaqueCMSampleBuffer *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  Float64 v17;
  CMTimeEpoch v18;
  id v19;
  OSStatus v20;
  NSObject **v21;
  NSObject *v22;
  id v23;
  const char *v24;
  CMSampleTimingInfo *p_buf;
  void *v26;
  id v27;
  NSObject **v28;
  NSObject *v29;
  OSStatus v30;
  NSObject **v31;
  id v32;
  __int128 v34;
  CMSampleBufferRef sampleBufferOut;
  size_t sampleSizeArray;
  CMBlockBufferRef theBuffer;
  CMTime v38;
  CMFormatDescriptionRef formatDescriptionOut;
  CMSampleTimingInfo buf;
  uint64_t v41;
  const __CFString *v42;
  CMTime time2;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  formatDescriptionOut = 0;
  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v8 = CMFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0x68617074u, 0x61686172u, 0, &formatDescriptionOut);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v6, 4, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");
    -[QLHapticItemViewController filterPatternDictionary:](self, "filterPatternDictionary:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBF5E0]), "initWithDictionary:error:", v15, a4);
    memset(&v38, 0, sizeof(v38));
    objc_msgSend(v16, "duration");
    CMTimeMakeWithSeconds(&v38, v17, 10000);
    buf.duration = v38;
    v34 = *MEMORY[0x24BDC0D88];
    *(_OWORD *)&time2.value = *MEMORY[0x24BDC0D88];
    v18 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    time2.epoch = v18;
    if (CMTimeCompare(&buf.duration, &time2) <= 0)
    {
      v41 = *MEMORY[0x24BDD0FC8];
      v42 = CFSTR("Computed negative pattern duration, which is not possible.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_alloc(MEMORY[0x24BDD1540]);
      *a4 = (id)objc_msgSend(v27, "initWithDomain:code:userInfo:", *MEMORY[0x24BE7C000], -1, v26);
      v28 = (NSObject **)MEMORY[0x24BE7BF48];
      v29 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        QLSInitLogging();
        v29 = *v28;
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.duration.value) = 0;
        _os_log_impl(&dword_20D4F5000, v29, OS_LOG_TYPE_ERROR, "Duration cannot be less than 0. #AnyItemViewController", (uint8_t *)&buf, 2u);
      }

      goto LABEL_24;
    }
    theBuffer = 0;
    v19 = objc_retainAutorelease(v6);
    v20 = CMBlockBufferCreateWithMemoryBlock(v7, (void *)objc_msgSend(v19, "bytes"), objc_msgSend(v19, "length"), v7, 0, 0, objc_msgSend(v19, "length"), 0, &theBuffer);
    if (v20)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], v20, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      v21 = (NSObject **)MEMORY[0x24BE7BF48];
      v22 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        QLSInitLogging();
        v22 = *v21;
      }
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      v23 = *a4;
      LODWORD(buf.duration.value) = 138412290;
      *(CMTimeValue *)((char *)&buf.duration.value + 4) = (CMTimeValue)v23;
      v24 = "Failed to allocate memory block: %@ #AnyItemViewController";
      p_buf = &buf;
    }
    else
    {
      sampleSizeArray = CMBlockBufferGetDataLength(theBuffer);
      buf.duration = v38;
      *(_OWORD *)&buf.presentationTimeStamp.value = v34;
      buf.presentationTimeStamp.epoch = v18;
      buf.decodeTimeStamp = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D40];
      sampleBufferOut = 0;
      v30 = CMSampleBufferCreateReady(v7, theBuffer, formatDescriptionOut, 1, 1, &buf, 1, &sampleSizeArray, &sampleBufferOut);
      if (!v30)
      {
        v12 = sampleBufferOut;
        goto LABEL_25;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], v30, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      v31 = (NSObject **)MEMORY[0x24BE7BF48];
      v22 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        QLSInitLogging();
        v22 = *v31;
      }
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
LABEL_24:
        v12 = 0;
LABEL_25:

        goto LABEL_26;
      }
      v32 = *a4;
      LODWORD(time2.value) = 138412290;
      *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)v32;
      v24 = "Failed to create sample buffer: %@ #AnyItemViewController";
      p_buf = (CMSampleTimingInfo *)&time2;
    }
    _os_log_impl(&dword_20D4F5000, v22, OS_LOG_TYPE_ERROR, v24, (uint8_t *)p_buf, 0xCu);
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], v8, 0);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (NSObject **)MEMORY[0x24BE7BF48];
  v10 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v10 = *v9;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = *a4;
    LODWORD(buf.duration.value) = 138412290;
    *(CMTimeValue *)((char *)&buf.duration.value + 4) = (CMTimeValue)v11;
    _os_log_impl(&dword_20D4F5000, v10, OS_LOG_TYPE_ERROR, "Failed to get format descriptor: %@ #AnyItemViewController", (uint8_t *)&buf, 0xCu);
  }
  v12 = 0;
LABEL_26:

  return v12;
}

- (BOOL)hasAudioCustom
{
  return self->_hasAudioCustom;
}

- (void)setHasAudioCustom:(BOOL)a3
{
  self->_hasAudioCustom = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_missingAudioCustomLabel, 0);
  objc_storeStrong((id *)&self->_playerItem, 0);
}

@end
