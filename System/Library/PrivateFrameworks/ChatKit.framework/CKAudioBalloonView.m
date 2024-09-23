@implementation CKAudioBalloonView

- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  objc_super v18;

  v5 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CKAudioBalloonView;
  v8 = a3;
  -[CKBalloonView configureForMediaObject:previewWidth:orientation:](&v18, sel_configureForMediaObject_previewWidth_orientation_, v8, v5, a4);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", v18.receiver, v18.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "theme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((_DWORD)v5 == 1)
    v12 = 1;
  else
    v12 = 0xFFFFFFFFLL;
  objc_msgSend(v10, "waveformColorForColorType:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "waveformForOrientation:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_flatImageWithColor:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAudioBalloonView setWaveform:](self, "setWaveform:", v15);

  objc_msgSend(v8, "duration");
  v17 = v16;

  -[CKAudioBalloonView setDuration:](self, "setDuration:", v17);
  -[CKAudioBalloonView setPlayed:](self, "setPlayed:", 1);

}

- (void)configureForComposition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKAudioBalloonView;
  v4 = a3;
  -[CKColoredBalloonView configureForComposition:](&v8, sel_configureForComposition_, v4);
  objc_msgSend(v4, "mediaObjects", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previewMaxWidth");
  -[CKAudioBalloonView configureForMediaObject:previewWidth:orientation:](self, "configureForMediaObject:previewWidth:orientation:", v6, 1);

  -[CKAudioBalloonView setPlayed:](self, "setPlayed:", 0);
}

- (BOOL)isAudioMessage
{
  return 1;
}

- (CKAudioBalloonView)initWithFrame:(CGRect)a3
{
  CKAudioBalloonView *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  CKAudioProgressView *v10;
  CKWaveformProgressView *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CKAudioBalloonView;
  v3 = -[CKColoredBalloonView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA700]);
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    -[CKAudioBalloonView setTimeLabel:](v3, "setTimeLabel:", v9);
    -[CKAudioBalloonView addSubview:](v3, "addSubview:", v9);
    v10 = -[CKAudioProgressView initWithFrame:]([CKAudioProgressView alloc], "initWithFrame:", v5, v6, v7, v8);
    -[CKAudioProgressView setColor:](v10, "setColor:", -[CKBalloonView color](v3, "color"));
    -[CKAudioProgressView sizeToFit](v10, "sizeToFit");
    -[CKAudioBalloonView setProgressView:](v3, "setProgressView:", v10);
    -[CKAudioBalloonView addSubview:](v3, "addSubview:", v10);
    v11 = -[CKWaveformProgressView initWithFrame:]([CKWaveformProgressView alloc], "initWithFrame:", v5, v6, v7, v8);
    -[CKWaveformProgressView setColor:](v11, "setColor:", -[CKBalloonView color](v3, "color"));
    -[CKAudioBalloonView addSubview:](v3, "addSubview:", v11);
    -[CKAudioBalloonView setWaveformProgressView:](v3, "setWaveformProgressView:", v11);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7F8]), "initWithTarget:action:", v3, sel_waveformProgressViewPanning_);
    -[CKWaveformProgressView addGestureRecognizer:](v11, "addGestureRecognizer:", v12);

  }
  return v3;
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
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  void *v22;
  double v23;
  double v24;
  double MaxX;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  CGFloat rect;
  double v37;
  double v38;
  double v39;
  objc_super v40;
  CGRect v41;
  CGRect v42;

  v40.receiver = self;
  v40.super_class = (Class)CKAudioBalloonView;
  -[CKColoredBalloonView layoutSubviews](&v40, sel_layoutSubviews);
  -[CKAudioBalloonView bounds](self, "bounds");
  v37 = v4;
  v38 = v3;
  -[CKAudioBalloonView alignmentRectForFrame:](self, "alignmentRectForFrame:");
  v6 = v5;
  v39 = v7;
  v9 = v8;
  v11 = v10;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAudioBalloonView progressView](self, "progressView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v15 = v14;
  v17 = v16;
  objc_msgSend(v12, "audioBalloonProgressInset");
  v19 = v6 + v18;
  if (CKMainScreenScale_once_56 != -1)
    dispatch_once(&CKMainScreenScale_once_56, &__block_literal_global_139);
  v20 = *(double *)&CKMainScreenScale_sMainScreenScale_56;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_56 == 0.0)
    v20 = 1.0;
  v21 = 1.0 / v20 * (v39 * v20 + floor((v11 * v20 - v17 * v20) * 0.5));
  objc_msgSend(v13, "setFrame:", v19, v21, v15, v17);
  -[CKAudioBalloonView timeLabel](self, "timeLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sizeThatFits:", v9, v11);
  rect = v15;
  v24 = v23;

  v41.origin.x = v6;
  v41.origin.y = v39;
  v41.size.width = v9;
  v41.size.height = v11;
  MaxX = CGRectGetMaxX(v41);
  objc_msgSend(v12, "audioBalloonTimeInset");
  v27 = MaxX - (v24 + v26);
  -[CKAudioBalloonView timeLabel](self, "timeLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setFrame:", v27, v39, v24, v11);

  -[CKAudioBalloonView waveformProgressView](self, "waveformProgressView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "frame");
  objc_msgSend(v29, "sizeThatFits:", v38, v37);
  v31 = v30;
  v42.origin.x = v19;
  v42.origin.y = v21;
  v42.size.width = rect;
  v42.size.height = v17;
  v32 = CGRectGetMaxX(v42);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "audioBalloonWaveformTimeSpace");
  v35 = v34;

  if (CKMainScreenScale_once_56 != -1)
    dispatch_once(&CKMainScreenScale_once_56, &__block_literal_global_139);
  objc_msgSend(v29, "setFrame:", *(_QWORD *)&rect);
  objc_msgSend(v29, "setClipsToBounds:", v27 - v35 - (v32 + 6.0) != v31);

}

- (void)addOverlaySubview:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKAudioBalloonView timeLabel](self, "timeLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CKAudioBalloonView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v4, v5);

}

- (UIEdgeInsets)alignmentRectInsets
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIEdgeInsets result;

  -[CKBalloonImageView image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[CKColoredBalloonView mask](self, "mask");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "image");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v14 = *MEMORY[0x1E0CEB4B0];
      v11 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
      v9 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
      v7 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
      goto LABEL_9;
    }
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "balloonMaskTailSizeForTailShape:", 1);
  v7 = v6;
  v8 = objc_msgSend(v3, "imageOrientation");
  v9 = 0.0;
  if (!v8)
    goto LABEL_7;
  v10 = v8;
  if (v8 != 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UIEdgeInsets CKEdgeInsetsWithImageOrientation(UIEdgeInsets, UIImageOrientation)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("CKGeometry.h"), 429, CFSTR("CKEdgeInsetsWithImageOrientation %ld hasn't been implemented"), v10);

LABEL_7:
    v11 = 0.0;
    goto LABEL_8;
  }
  v11 = v7;
  v7 = 0.0;
LABEL_8:

  v14 = 0.0;
LABEL_9:
  v15 = v11;
  v16 = v9;
  v17 = v7;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height;
  double width;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
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
  double v32;
  double v33;
  double v34;
  double v35;
  unint64_t v36;
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
  uint64_t v48;
  CGSize result;

  height = a3.height;
  width = a3.width;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView __ck_alignmentRectSizeForFrameSize:](self, "__ck_alignmentRectSizeForFrameSize:", width, height);
  v10 = v9;
  v12 = v11;
  -[CKAudioBalloonView progressView](self, "progressView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sizeThatFits:", v10, v12);
  v15 = v14;

  -[CKAudioBalloonView waveformProgressView](self, "waveformProgressView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sizeThatFits:", v10, v12);
  v18 = v17;
  v20 = v19;

  -[CKAudioBalloonView timeLabel](self, "timeLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sizeThatFits:", v10, v12);
  v23 = v22;
  v25 = v24;

  objc_msgSend(v8, "audioBalloonProgressInset");
  v27 = v18 + v15 + v26 + 6.0;
  objc_msgSend(v8, "audioBalloonWaveformTimeSpace");
  v29 = v23 + v28 + v27;
  objc_msgSend(v8, "audioBalloonTimeInset");
  v31 = 0.0;
  -[UIView __ck_frameSizeForAlignmentRectSize:](self, "__ck_frameSizeForAlignmentRectSize:", v30 + v29, 0.0);
  v33 = v32;
  v34 = v32 - width;
  if (v34 > 0.0)
  {
    v35 = fmod(v34, 1.0);
    v36 = objc_msgSend(v8, "waveformPowerLevelWidthIncrement");
    v31 = v34 + (double)v36 - (v35 + (double)((unint64_t)v34 % v36));
  }
  if (objc_msgSend(v8, "isAccessibilityPreferredContentSizeCategory"))
  {
    v37 = fmax(v25, v20 + 25.0);
  }
  else
  {
    -[CKColoredBalloonView balloonDescriptor](self, "balloonDescriptor");
    objc_msgSend(v8, "balloonMaskSizeWithBalloonDescriptor:", &v48);
    v37 = v38;
  }
  objc_msgSend(v8, "audioBalloonAlignmentInsets");
  if (a4)
  {
    a4->top = v39;
    a4->left = v40;
    a4->bottom = v41;
    a4->right = v42;
  }
  v43 = v33 - v31 + v40 + v42;
  v44 = v37 + v39 + v41;
  if (-[CKBalloonView hasSuggestedActionsMenu](self, "hasSuggestedActionsMenu"))
  {
    -[CKBalloonView suggestedActionsMenuAdditionalHeight](self, "suggestedActionsMenuAdditionalHeight");
    v43 = v43 + 0.0;
    v44 = v44 + v45;
  }

  v46 = v43;
  v47 = v44;
  result.height = v47;
  result.width = v46;
  return result;
}

- (void)prepareForDisplay
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKAudioBalloonView;
  -[CKColoredBalloonView prepareForDisplay](&v12, sel_prepareForDisplay);
  v3 = -[CKBalloonView color](self, "color");
  -[CKAudioBalloonView timeLabel](self, "timeLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "theme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "balloonTextColorForColorType:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v7);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "audioBalloonTimeFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v9);

  -[CKAudioBalloonView progressView](self, "progressView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setColor:", -[CKBalloonView color](self, "color"));

  -[CKAudioBalloonView waveformProgressView](self, "waveformProgressView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setColor:", -[CKBalloonView color](self, "color"));

  -[CKAudioBalloonView updateTimeString](self, "updateTimeString");
  -[CKAudioBalloonView updateProgress](self, "updateProgress");

}

- (void)prepareForReuse
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)CKAudioBalloonView;
  -[CKColoredBalloonView prepareForReuse](&v12, sel_prepareForReuse);
  -[CKAudioBalloonView setControlHidden:](self, "setControlHidden:", 0);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[CKAudioBalloonView nonVibrantSubViews](self, "nonVibrantSubViews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setUserInteractionEnabled:", 1);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }

}

- (void)setTime:(double)a3
{
  if (self->_time != a3)
  {
    self->_time = a3;
    -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
  }
}

- (void)setDuration:(double)a3
{
  void *v5;

  if (self->_duration != a3)
  {
    self->_duration = a3;
    -[CKAudioBalloonView waveformProgressView](self, "waveformProgressView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDuration:", a3);

    -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
  }
}

- (void)setWaveform:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKAudioBalloonView waveformProgressView](self, "waveformProgressView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWaveform:", v4);

}

- (void)setPlaying:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_playing != a3)
  {
    v3 = a3;
    self->_playing = a3;
    -[CKAudioBalloonView waveformProgressView](self, "waveformProgressView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPlaying:", v3);

    -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
  }
}

- (void)setPlayed:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_played != a3)
  {
    v3 = a3;
    self->_played = a3;
    -[CKAudioBalloonView waveformProgressView](self, "waveformProgressView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPlayed:", v3);

    -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
  }
}

- (void)setControlHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CKAudioBalloonView progressView](self, "progressView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (BOOL)isControlHidden
{
  void *v2;
  char v3;

  -[CKAudioBalloonView progressView](self, "progressView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden");

  return v3;
}

- (void)setWaveformContentMode:(int64_t)a3
{
  id v4;

  -[CKAudioBalloonView waveformProgressView](self, "waveformProgressView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentMode:", a3);

}

- (int64_t)waveformContentMode
{
  void *v2;
  int64_t v3;

  -[CKAudioBalloonView waveformProgressView](self, "waveformProgressView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "contentMode");

  return v3;
}

- (void)updateTimeString
{
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;

  -[CKAudioBalloonView time](self, "time");
  v4 = v3;
  if (v3 == 0.0 && !-[CKAudioBalloonView isPlaying](self, "isPlaying"))
  {
    -[CKAudioBalloonView duration](self, "duration");
    v4 = v5;
  }
  -[CKAudioBalloonView timeLabel](self, "timeLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CKLocalizedStringForDuration(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v7);

  -[CKAudioBalloonView setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateProgress
{
  double v3;
  double v4;
  double v5;
  _BOOL8 v6;
  _BOOL8 v7;
  void *v8;
  id v9;

  -[CKAudioBalloonView progressView](self, "progressView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CKAudioBalloonView time](self, "time");
  v4 = v3;
  -[CKAudioBalloonView duration](self, "duration");
  +[CKAudioProgressView progressForTime:duration:](CKAudioProgressView, "progressForTime:duration:", v4, v5);
  objc_msgSend(v9, "setProgress:");
  v6 = -[CKAudioBalloonView isPlaying](self, "isPlaying");
  if (-[CKAudioBalloonView isPlayed](self, "isPlayed"))
    v7 = -[CKBalloonView orientation](self, "orientation") == 0;
  else
    v7 = 0;
  objc_msgSend(v9, "setPlayed:", v7);
  objc_msgSend(v9, "setPlaying:", v6);
  objc_msgSend(v9, "prepareForDisplayIfNeeded");
  -[CKAudioBalloonView waveformProgressView](self, "waveformProgressView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCurrentTime:", v4);
  objc_msgSend(v8, "prepareForDisplayIfNeeded");

}

- (id)nonVibrantSubViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  -[CKAudioBalloonView timeLabel](self, "timeLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAudioBalloonView progressView](self, "progressView", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  -[CKAudioBalloonView waveformProgressView](self, "waveformProgressView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)vibrantContainerWillReparentNonVibrantSubviews:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setUserInteractionEnabled:", 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)waveformProgressViewPanning:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double duration;
  double v11;
  void *v12;
  char v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;

  -[CKWaveformProgressView frame](self->_waveformProgressView, "frame");
  v9 = v7 / v8;

  duration = self->_duration;
  v11 = v9 * duration;
  if (v11 <= duration)
  {
    if (v11 < 0.0)
      v11 = 0.0;
  }
  else
  {
    v11 = duration + -0.01;
  }
  self->_time = v11;
  -[CKBalloonView delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[CKBalloonView delegate](self, "delegate");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "audioBalloonScrubberDidChangeValue:", v11);

  }
}

- (double)time
{
  return self->_time;
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (BOOL)isPlayed
{
  return self->_played;
}

- (UILabel)timeLabel
{
  return self->_timeLabel;
}

- (void)setTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_timeLabel, a3);
}

- (CKAudioProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_progressView, a3);
}

- (CKWaveformProgressView)waveformProgressView
{
  return self->_waveformProgressView;
}

- (void)setWaveformProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_waveformProgressView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waveformProgressView, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
}

- (void)configureForMessagePart:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKAudioBalloonView;
  -[CKColoredBalloonView configureForMessagePart:](&v9, sel_configureForMessagePart_, v4);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewMaxWidth");
  v7 = v6;

  objc_msgSend(v4, "mediaObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAudioBalloonView configureForMediaObject:previewWidth:orientation:](self, "configureForMediaObject:previewWidth:orientation:", v8, objc_msgSend(v4, "balloonOrientation"), v7);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[CKAudioBalloonView setPlayed:](self, "setPlayed:", objc_msgSend(v4, "isPlayed"));

}

@end
