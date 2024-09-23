@implementation CKMessageEntryRecordedAudioView

- (CKMessageEntryRecordedAudioView)initWithFrame:(CGRect)a3
{
  CKMessageEntryRecordedAudioView *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v35;
  char v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)CKMessageEntryRecordedAudioView;
  v3 = -[CKMessageEntryRecordedAudioView initWithFrame:](&v42, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "entryFieldShouldUseBackdropView");

    if (v5)
    {
      v6 = objc_alloc(MEMORY[0x1E0CEABE8]);
      objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v6, "initWithEffect:", v7);

      objc_msgSend(v8, "contentView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "theme");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "entryFieldAudioRecordingBalloonColor");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v10, "setBackgroundColor:", objc_msgSend(v13, "CGColor"));

      objc_msgSend(v8, "contentView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setCompositingFilter:", *MEMORY[0x1E0CD2E50]);

      objc_msgSend(v8, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setMasksToBounds:", 1);

      -[CKMessageEntryRecordedAudioView setBlurView:](v3, "setBlurView:", v8);
      -[CKMessageEntryRecordedAudioView addSubview:](v3, "addSubview:", v8);
      -[CKMessageEntryRecordedAudioView setBlurView:](v3, "setBlurView:", 0);
      objc_msgSend(v8, "removeFromSuperview");
    }
    else
    {
      LODWORD(v35) = 0x1000000;
      v37 = CKColorZero;
      *((_QWORD *)&v35 + 1) = -1;
      v36 = -2;
      v38 = *(_OWORD *)&qword_18E7CB368;
      v39 = 1;
      v40 = 0;
      v41 = 0;
      CKResizableBalloonMask(&v35);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_alloc(MEMORY[0x1E0CEA658]);
      objc_msgSend(v8, "imageWithRenderingMode:", 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v17, "initWithImage:", v18);

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "theme");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "entryFieldAudioRecordingBalloonColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setTintColor:", v22);

      -[CKMessageEntryRecordedAudioView setBalloonImageView:](v3, "setBalloonImageView:", v19);
      -[CKMessageEntryRecordedAudioView addSubview:](v3, "addSubview:", v19);

    }
    -[CKMessageEntryRecordedAudioView updatePlayPauseDeleteButton](v3, "updatePlayPauseDeleteButton");
    v23 = objc_alloc(MEMORY[0x1E0CEA658]);
    v24 = *MEMORY[0x1E0C9D648];
    v25 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v26 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v27 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v28 = (void *)objc_msgSend(v23, "initWithFrame:", *MEMORY[0x1E0C9D648], v25, v26, v27);
    objc_msgSend(v28, "setContentMode:", 8);
    objc_msgSend(v28, "setClipsToBounds:", 1);
    -[CKMessageEntryRecordedAudioView addSubview:](v3, "addSubview:", v28);
    -[CKMessageEntryRecordedAudioView setWaveformImageView:](v3, "setWaveformImageView:", v28);
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v24, v25, v26, v27);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "audioBalloonTimeFont");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setFont:", v31);

    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setTextColor:", v32);

    CKLocalizedStringForDuration(0.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setText:", v33);

    -[CKMessageEntryRecordedAudioView setTimeLabel:](v3, "setTimeLabel:", v29);
    -[CKMessageEntryRecordedAudioView addSubview:](v3, "addSubview:", v29);
    -[CKMessageEntryRecordedAudioView setTimeLabel:](v3, "setTimeLabel:", 0);
    objc_msgSend(v29, "removeFromSuperview");

  }
  return v3;
}

- (void)updatePlayPauseDeleteButton
{
  UIButton *v3;
  UIButton *playPauseDeleteButton;
  UIButton *v5;
  void *v6;
  UIButton *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  _BOOL4 v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  id v16;

  if (!self->_playPauseDeleteButton)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
    v3 = (UIButton *)objc_claimAutoreleasedReturnValue();
    playPauseDeleteButton = self->_playPauseDeleteButton;
    self->_playPauseDeleteButton = v3;

    v5 = self->_playPauseDeleteButton;
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v5, "setTintColor:", v6);

    v7 = self->_playPauseDeleteButton;
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v7, "setTintColor:", v8);

    -[UIButton setOpaque:](self->_playPauseDeleteButton, "setOpaque:", 0);
    -[UIButton addTarget:action:forEvents:](self->_playPauseDeleteButton, "addTarget:action:forEvents:", self, sel_handlePlayPauseDelete_, 64);
    -[CKMessageEntryRecordedAudioView addSubview:](self, "addSubview:", self->_playPauseDeleteButton);
  }
  if (CKIsRunningInMacCatalyst())
  {
    if (-[CKMessageEntryRecordedAudioView isPlaying](self, "isPlaying"))
      v9 = CFSTR("AudioPause");
    else
      v9 = CFSTR("AudioPlay");
    objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageWithRenderingMode:", 2);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    v11 = -[CKMessageEntryRecordedAudioView isPlaying](self, "isPlaying");
    v12 = CFSTR("pauseAudioRecordingButton");
    if (v11)
      v12 = CFSTR("playAudioRecordingButton");
    v13 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:scale:", *MEMORY[0x1E0CEB538], 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("xmark"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "imageWithSymbolConfiguration:", v14);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    v13 = CFSTR("deleteAudioRecordingButton");
  }
  -[UIButton setImage:forState:](self->_playPauseDeleteButton, "setImage:forState:", v16, 0);
  -[UIButton accessibilitySetIdentification:](self->_playPauseDeleteButton, "accessibilitySetIdentification:", v13);
  -[CKMessageEntryRecordedAudioView setNeedsLayout](self, "setNeedsLayout");

}

- (void)handlePlayPauseDelete:(id)a3
{
  _BOOL4 v4;
  void *v5;
  id v6;

  if (CKIsRunningInMacCatalyst())
  {
    v4 = -[CKMessageEntryRecordedAudioView isPlaying](self, "isPlaying");
    -[CKMessageEntryRecordedAudioView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
      objc_msgSend(v5, "messageEntryRecordedAudioViewPressedPause:", self);
    else
      objc_msgSend(v5, "messageEntryRecordedAudioViewPressedPlay:", self);
  }
  else
  {
    -[CKMessageEntryRecordedAudioView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "messageEntryRecordedAudioViewPressedDelete:", self);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[CKAudioController setDelegate:](self->_audioController, "setDelegate:", 0);
  -[CKAudioController stop](self->_audioController, "stop");
  v3.receiver = self;
  v3.super_class = (Class)CKMessageEntryRecordedAudioView;
  -[CKMessageEntryRecordedAudioView dealloc](&v3, sel_dealloc);
}

- (void)setAudioMediaObject:(id)a3
{
  CKAudioMediaObject *v5;
  void *v6;
  CKAudioController *v7;
  void *v8;
  void *v9;
  CKAudioController *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = (CKAudioMediaObject *)a3;
  if (self->_audioMediaObject != v5)
  {
    objc_storeStrong((id *)&self->_audioMediaObject, a3);
    -[CKMessageEntryRecordedAudioView audioController](self, "audioController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stop");

    if (v5)
    {
      v7 = [CKAudioController alloc];
      -[CKMessageEntryRecordedAudioView audioMediaObject](self, "audioMediaObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[CKAudioController initWithMediaObjects:](v7, "initWithMediaObjects:", v9);

      -[CKAudioController setDelegate:](v10, "setDelegate:", self);
      -[CKMessageEntryRecordedAudioView setAudioController:](self, "setAudioController:", v10);

    }
    else
    {
      -[CKMessageEntryRecordedAudioView setAudioController:](self, "setAudioController:", 0);
    }
    -[CKMessageEntryRecordedAudioView setWaveformImage:](self, "setWaveformImage:", 0);
    self->_cachedWaveFormImageIsValid = 0;
    -[CKMessageEntryRecordedAudioView updateTimeString](self, "updateTimeString");
    -[CKMessageEntryRecordedAudioView updateProgress](self, "updateProgress");
    -[CKMessageEntryRecordedAudioView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)updateTimeString
{
  double v3;
  double v4;
  void *v5;
  char v6;
  void *v7;
  double v8;
  void *v9;
  id v10;

  -[CKMessageEntryRecordedAudioView time](self, "time");
  v4 = v3;
  -[CKMessageEntryRecordedAudioView audioController](self, "audioController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPlaying");

  if ((v6 & 1) == 0)
  {
    -[CKMessageEntryRecordedAudioView audioMediaObject](self, "audioMediaObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "duration");
    v4 = v8;

  }
  -[CKMessageEntryRecordedAudioView timeLabel](self, "timeLabel");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  CKLocalizedStringForDuration(v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CKMessageEntryRecordedAudioView frame](self, "frame");
  if (v9 != width || v8 != height)
    -[CKMessageEntryRecordedAudioView setWaveformImage:](self, "setWaveformImage:", 0);
  v11.receiver = self;
  v11.super_class = (Class)CKMessageEntryRecordedAudioView;
  -[CKMessageEntryRecordedAudioView setFrame:](&v11, sel_setFrame_, x, y, width, height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  __int128 v10;
  char v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  CGSize result;

  LODWORD(v10) = 0x1000000;
  v12 = CKColorZero;
  *((_QWORD *)&v10 + 1) = -1;
  v11 = -2;
  v13 = *(_OWORD *)&qword_18E7CB368;
  v14 = 1;
  v15 = 0;
  v16 = 0;
  CKResizableBalloonMask(&v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  -[CKMessageEntryRecordedAudioView waveformImage](self, "waveformImage");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[CKMessageEntryRecordedAudioView waveformImage](self, "waveformImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasDifferentColorAppearanceComparedToTraitCollection:", v9);

    if (v8)
    {
      self->_cachedWaveFormImageIsValid = 0;
      -[CKMessageEntryRecordedAudioView setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  void *v38;
  double v39;
  double v40;
  CGFloat v41;
  void *v42;
  double v43;
  CGFloat v44;
  void *v45;
  void *v46;
  double v47;
  double MinX;
  void *v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  CGFloat rect;
  objc_super v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;

  v63.receiver = self;
  v63.super_class = (Class)CKMessageEntryRecordedAudioView;
  -[CKMessageEntryRecordedAudioView layoutSubviews](&v63, sel_layoutSubviews);
  -[CKMessageEntryRecordedAudioView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKMessageEntryRecordedAudioView blurView](self, "blurView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCornerRadius:", v10 * 0.5);

  v13 = v8;
  if (!CKIsRunningInMacCatalyst())
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "balloonMaskTailSizeForTailShape:", 1);
    v13 = v8 - v15;

  }
  -[CKMessageEntryRecordedAudioView blurView](self, "blurView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v4, v6, v13, v10);

  -[CKMessageEntryRecordedAudioView balloonImageView](self, "balloonImageView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v4, v6, v8, v10);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "entryViewLeftInsetForRecordedAudioCancelButton");
  v20 = v19;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sendButtonSize");
  v23 = v22;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "entryViewSendButtonCoverSpace");
  v26 = v23 + v25;

  v27 = v4 + v20;
  v28 = v6 + 0.0;
  v29 = v8 - (v20 + v26);
  -[CKMessageEntryRecordedAudioView playPauseDeleteButton](self, "playPauseDeleteButton");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "sizeToFit");
  objc_msgSend(v30, "frame");
  v32 = v31;
  v34 = v33;
  v35 = v4 + v20 + 3.0;
  if (CKIsRunningInMacCatalyst())
  {
    v32 = v10 + -6.0;
    v34 = v10 + -6.0;
  }
  if (CKMainScreenScale_once_44 != -1)
    dispatch_once(&CKMainScreenScale_once_44, &__block_literal_global_108);
  v36 = *(double *)&CKMainScreenScale_sMainScreenScale_44;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_44 == 0.0)
    v36 = 1.0;
  v37 = 1.0 / v36 * (v28 * v36 + floor((v10 * v36 - v34 * v36) * 0.5));
  objc_msgSend(v30, "setFrame:", v27 + 3.0, v37, v32, v34);
  -[CKMessageEntryRecordedAudioView timeLabel](self, "timeLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "sizeThatFits:", v29, v10);
  rect = v32;
  v40 = v39;

  v64.origin.x = v27;
  v64.origin.y = v28;
  v64.size.width = v29;
  v64.size.height = v10;
  v41 = CGRectGetMaxX(v64) - v40;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "audioBalloonTimeInset");
  v44 = v41 - v43;

  -[CKMessageEntryRecordedAudioView timeLabel](self, "timeLabel");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setFrame:", v44, v28, v40, v10);

  -[CKMessageEntryRecordedAudioView waveformImageView](self, "waveformImageView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v65.origin.x = v35;
  v65.origin.y = v37;
  v65.size.width = rect;
  v65.size.height = v34;
  v47 = CGRectGetMaxX(v65) + 6.0;
  v66.origin.x = v44;
  v66.origin.y = v28;
  v66.size.width = v40;
  v66.size.height = v10;
  MinX = CGRectGetMinX(v66);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "audioBalloonWaveformTimeSpace");
  v51 = MinX - v50;

  v52 = v51 - v47;
  if (!self->_cachedWaveFormImageIsValid)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "theme");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "entryFieldBorderColor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKMessageEntryRecordedAudioView audioMediaObject](self, "audioMediaObject");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "composeWaveformForWidth:orientation:withColor:", 1, v55, v51 - v47);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKMessageEntryRecordedAudioView setWaveformImage:](self, "setWaveformImage:", v57);
    -[CKMessageEntryRecordedAudioView waveformImageView](self, "waveformImageView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setImage:", v57);

    self->_cachedWaveFormImageIsValid = 1;
  }
  objc_msgSend(v46, "frame", *(_QWORD *)&rect);
  objc_msgSend(v46, "sizeThatFits:", v29, v10);
  v60 = v59;
  if (CKMainScreenScale_once_44 != -1)
    dispatch_once(&CKMainScreenScale_once_44, &__block_literal_global_108);
  v61 = *(double *)&CKMainScreenScale_sMainScreenScale_44;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_44 == 0.0)
    v61 = 1.0;
  objc_msgSend(v46, "setFrame:", v47, 1.0 / v61 * (v28 * v61 + floor((v10 * v61 - v60 * v61) * 0.5)), v52, v60);

}

- (void)updateProgress
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  float v8;
  float v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  long double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  double v34;
  double v35;
  double v36;
  char v37;

  -[CKMessageEntryRecordedAudioView audioMediaObject](self, "audioMediaObject");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryRecordedAudioView audioController](self, "audioController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryRecordedAudioView time](self, "time");
  v5 = v4;
  objc_msgSend(v31, "duration");
  v7 = v6;
  +[CKAudioProgressView progressForTime:duration:](CKAudioProgressView, "progressForTime:duration:", v5, v6);
  v9 = v8;
  v10 = objc_msgSend(v3, "isPlaying");
  -[CKMessageEntryRecordedAudioView delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "messageEntryRecordedAudioViewPlaybackProgressDidChange:", v5);

  if (v5 == 0.0)
    v12 = v10;
  else
    v12 = 1;
  if (v5 == v7 || (v12 & 1) == 0)
  {
    self->_cachedWaveFormImageIsValid = 0;
    -[CKMessageEntryRecordedAudioView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    -[CKMessageEntryRecordedAudioView waveformImage](self, "waveformImage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "size");
    if (v15 != 0.0)
    {
      v16 = v14;
      if (v14 != 0.0)
      {
        v17 = v15;
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "waveformPowerLevelWidthIncrement");

        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "waveformPowerLevelWidth");
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "waveformGapWidth");

        if (CKMainScreenScale_once_44 != -1)
          dispatch_once(&CKMainScreenScale_once_44, &__block_literal_global_108);
        v24 = (1.0 - v9) * (v16 / (double)v19);
        v25 = fmod(v24, 1.0) * (double)v21 + (double)(unint64_t)v24 * (double)v19 + (double)v23;
        v26 = *(double *)&CKMainScreenScale_sMainScreenScale_44;
        if (*(double *)&CKMainScreenScale_sMainScreenScale_44 == 0.0)
          v26 = 1.0;
        v27 = floor(v25 * v26) / v26;
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA610]), "initWithSize:", v16, v17);
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __49__CKMessageEntryRecordedAudioView_updateProgress__block_invoke;
        v32[3] = &unk_1E27553F8;
        v37 = 1;
        v33 = v13;
        v34 = v16;
        v35 = v17;
        v36 = v27;
        objc_msgSend(v28, "imageWithActions:", v32);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKMessageEntryRecordedAudioView waveformImageView](self, "waveformImageView");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setImage:", v29);

      }
    }

  }
}

double __49__CKMessageEntryRecordedAudioView_updateProgress__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double result;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CGRect v15;
  CGRect v16;

  if (*(unsigned __int8 *)(a1 + 64) == 255)
  {
    objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "theme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "waveformUnplayedColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "set");

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "theme");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "waveformUnplayedColorNewAudioMessagesFlow");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "set");

    v16.size.height = *(CGFloat *)(a1 + 48);
    v16.size.width = *(CGFloat *)(a1 + 56);
    v16.origin.x = *(double *)(a1 + 40) - v16.size.width;
    v16.origin.y = 0.0;
    UIRectFillUsingBlendMode(v16, kCGBlendModeSourceIn);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "set");

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "theme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entryFieldBorderColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "set");

    v15.size.height = *(CGFloat *)(a1 + 48);
    v15.size.width = *(double *)(a1 + 40) - *(double *)(a1 + 56);
    v15.origin.x = 0.0;
    v15.origin.y = 0.0;
    UIRectFill(v15);
    v6 = *MEMORY[0x1E0C9D538];
    v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:blendMode:alpha:", 18, *MEMORY[0x1E0C9D538], v7, 1.0);
    objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:blendMode:alpha:", 0, v6, v7, 0.33);
  }
  return result;
}

- (void)play
{
  id v2;

  -[CKMessageEntryRecordedAudioView audioController](self, "audioController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "play");

}

- (void)pause
{
  id v2;

  -[CKMessageEntryRecordedAudioView audioController](self, "audioController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pause");

}

- (void)stop
{
  id v2;

  -[CKMessageEntryRecordedAudioView audioController](self, "audioController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stop");

}

- (BOOL)isPlaying
{
  void *v2;
  char v3;

  -[CKMessageEntryRecordedAudioView audioController](self, "audioController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPlaying");

  return v3;
}

- (void)audioController:(id)a3 mediaObjectDidFinishPlaying:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CKMessageEntryRecordedAudioView setTime:](self, "setTime:", 0.0);
  -[CKMessageEntryRecordedAudioView updateTimeString](self, "updateTimeString");
  -[CKMessageEntryRecordedAudioView updateProgress](self, "updateProgress");
  -[CKMessageEntryRecordedAudioView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageEntryRecordedAudioView:mediaObjectDidFinishPlaying:", self, v5);

}

- (void)audioController:(id)a3 mediaObjectProgressDidChange:(id)a4 currentTime:(double)a5 duration:(double)a6
{
  -[CKMessageEntryRecordedAudioView setTime:](self, "setTime:", a3, a4, a5, a6);
  -[CKMessageEntryRecordedAudioView updateTimeString](self, "updateTimeString");
  -[CKMessageEntryRecordedAudioView updateProgress](self, "updateProgress");
}

- (void)audioControllerDidPause:(id)a3
{
  -[CKMessageEntryRecordedAudioView updateTimeString](self, "updateTimeString", a3);
  -[CKMessageEntryRecordedAudioView updateProgress](self, "updateProgress");
}

- (void)audioControllerDidStop:(id)a3
{
  id v4;

  -[CKMessageEntryRecordedAudioView setTime:](self, "setTime:", a3, 0.0);
  -[CKMessageEntryRecordedAudioView updateTimeString](self, "updateTimeString");
  -[CKMessageEntryRecordedAudioView updateProgress](self, "updateProgress");
  -[CKMessageEntryRecordedAudioView delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageEntryRecordedAudioViewPlaybackDidStop");

}

- (CKAudioMediaObject)audioMediaObject
{
  return self->_audioMediaObject;
}

- (UIButton)playPauseDeleteButton
{
  return self->_playPauseDeleteButton;
}

- (void)setPlayPauseDeleteButton:(id)a3
{
  objc_storeStrong((id *)&self->_playPauseDeleteButton, a3);
}

- (CKMessageEntryRecordedAudioViewDelegate)delegate
{
  return (CKMessageEntryRecordedAudioViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIVisualEffectView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_blurView, a3);
}

- (UIImageView)balloonImageView
{
  return self->_balloonImageView;
}

- (void)setBalloonImageView:(id)a3
{
  objc_storeStrong((id *)&self->_balloonImageView, a3);
}

- (CKAudioController)audioController
{
  return self->_audioController;
}

- (void)setAudioController:(id)a3
{
  objc_storeStrong((id *)&self->_audioController, a3);
}

- (UILabel)timeLabel
{
  return self->_timeLabel;
}

- (void)setTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_timeLabel, a3);
}

- (UIImage)waveformImage
{
  return self->_waveformImage;
}

- (void)setWaveformImage:(id)a3
{
  objc_storeStrong((id *)&self->_waveformImage, a3);
}

- (UIImageView)waveformImageView
{
  return self->_waveformImageView;
}

- (void)setWaveformImageView:(id)a3
{
  objc_storeStrong((id *)&self->_waveformImageView, a3);
}

- (double)time
{
  return self->_time;
}

- (void)setTime:(double)a3
{
  self->_time = a3;
}

- (NSString)timeFormat
{
  return self->_timeFormat;
}

- (void)setTimeFormat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (BOOL)cachedWaveFormImageIsValid
{
  return self->_cachedWaveFormImageIsValid;
}

- (void)setCachedWaveFormImageIsValid:(BOOL)a3
{
  self->_cachedWaveFormImageIsValid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeFormat, 0);
  objc_storeStrong((id *)&self->_waveformImageView, 0);
  objc_storeStrong((id *)&self->_waveformImage, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_audioController, 0);
  objc_storeStrong((id *)&self->_balloonImageView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_playPauseDeleteButton, 0);
  objc_storeStrong((id *)&self->_audioMediaObject, 0);
}

@end
