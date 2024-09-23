@implementation CKMessageEntryWaveformView

+ (id)waveformCurveTransform
{
  void *v2;
  uint64_t v3;
  void *v4;
  _BYTE v6[2048];
  _BYTE __dst[3400];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = (void *)waveformCurveTransform_sTransform;
  if (!waveformCurveTransform_sTransform)
  {
    memcpy(__dst, &unk_18E7C9258, sizeof(__dst));
    memcpy(v6, &unk_18E7C9FA0, sizeof(v6));
    objc_msgSend(MEMORY[0x1E0CD27D8], "meshTransformWithVertexCount:vertices:faceCount:faces:depthNormalization:", 85, __dst, 64, v6, *MEMORY[0x1E0CD2A90]);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)waveformCurveTransform_sTransform;
    waveformCurveTransform_sTransform = v3;

    v2 = (void *)waveformCurveTransform_sTransform;
  }
  return v2;
}

- (CKMessageEntryWaveformView)initWithFrame:(CGRect)a3
{
  CKMessageEntryWaveformView *v3;
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v40;
  char v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  objc_super v47;

  v47.receiver = self;
  v47.super_class = (Class)CKMessageEntryWaveformView;
  v3 = -[CKMessageEntryWaveformView initWithFrame:](&v47, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
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

      -[CKMessageEntryWaveformView setBlurView:](v3, "setBlurView:", v8);
      -[CKMessageEntryWaveformView addSubview:](v3, "addSubview:", v8);
      -[CKMessageEntryWaveformView setBlurView:](v3, "setBlurView:", 0);
      objc_msgSend(v8, "removeFromSuperview");
    }
    else
    {
      LODWORD(v40) = 0x1000000;
      v42 = CKColorZero;
      *((_QWORD *)&v40 + 1) = -1;
      v41 = -2;
      v43 = *(_OWORD *)&qword_18E7CB368;
      v44 = 1;
      v45 = 0;
      v46 = 0;
      CKResizableBalloonMask(&v40);
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

      -[CKMessageEntryWaveformView setBalloonImageView:](v3, "setBalloonImageView:", v19);
      -[CKMessageEntryWaveformView addSubview:](v3, "addSubview:", v19);

    }
    v23 = objc_alloc(MEMORY[0x1E0CEA658]);
    v24 = *MEMORY[0x1E0C9D648];
    v25 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v26 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v27 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v28 = (void *)objc_msgSend(v23, "initWithFrame:", *MEMORY[0x1E0C9D648], v25, v26, v27);
    objc_msgSend(v28, "setContentMode:", 8);
    objc_msgSend(v28, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKMessageEntryWaveformView waveformCurveTransform](CKMessageEntryWaveformView, "waveformCurveTransform");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setMeshTransform:", v30);

    -[CKMessageEntryWaveformView addSubview:](v3, "addSubview:", v28);
    -[CKMessageEntryWaveformView setWaveformImageView:](v3, "setWaveformImageView:", v28);
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v24, v25, v26, v27);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "audioBalloonTimeFont");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setFont:", v33);

    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setTextColor:", v34);

    CKLocalizedStringForDuration(0.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setText:", v35);

    objc_msgSend(v31, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    -[CKMessageEntryWaveformView setMinTimeLabelWidth:](v3, "setMinTimeLabelWidth:");
    -[CKMessageEntryWaveformView setTimeLabel:](v3, "setTimeLabel:", v31);
    -[CKMessageEntryWaveformView addSubview:](v3, "addSubview:", v31);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "theme");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "entryFieldBorderColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setTextColor:", v38);

  }
  return v3;
}

- (void)didMoveToWindow
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  -[CKMessageEntryWaveformView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8 = v3;
    objc_msgSend(v3, "bounds");
    if (v4 >= v5)
      v6 = v4;
    else
      v6 = v5;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryWaveformView setMaxPowerLevelsCount:](self, "setMaxPowerLevelsCount:", vcvtpd_u64_f64(v6 / (double)(unint64_t)objc_msgSend(v7, "waveformPowerLevelWidthIncrement")));

    v3 = v8;
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
  int v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double MaxX;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  objc_super v43;
  CGRect v44;

  v43.receiver = self;
  v43.super_class = (Class)CKMessageEntryWaveformView;
  -[CKMessageEntryWaveformView layoutSubviews](&v43, sel_layoutSubviews);
  -[CKMessageEntryWaveformView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKMessageEntryWaveformView blurView](self, "blurView");
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
  -[CKMessageEntryWaveformView blurView](self, "blurView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v4, v6, v13, v10);

  -[CKMessageEntryWaveformView balloonImageView](self, "balloonImageView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v4, v6, v8, v10);

  v18 = CKIsRunningInMacCatalyst();
  v19 = 0.0;
  if (!v18)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", 0.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "balloonMaskTailSizeForTailShape:", 1);
    v22 = v21;

    v19 = v22 + 0.0;
  }
  v23 = v4 + 0.0;
  v24 = v6 + 0.0;
  v25 = v8 - v19;
  -[CKMessageEntryWaveformView timeLabel](self, "timeLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v28 = v27;

  -[CKMessageEntryWaveformView minTimeLabelWidth](self, "minTimeLabelWidth");
  if (v28 >= v29)
    v30 = v28;
  else
    v30 = v29;
  v44.origin.x = v23;
  v44.origin.y = v24;
  v44.size.width = v25;
  v44.size.height = v10;
  MaxX = CGRectGetMaxX(v44);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "audioBalloonTimeInset");
  v34 = MaxX - (v30 + v33);

  -[CKMessageEntryWaveformView timeLabel](self, "timeLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setFrame:", v34, v24, v30, v10);

  -[CKMessageEntryWaveformView waveformImageView](self, "waveformImageView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "frame");
  objc_msgSend(v36, "sizeThatFits:", v25, v10);
  v38 = v37;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "audioBalloonWaveformTimeSpace");
  v41 = v40;

  if (CKMainScreenScale_once_21 != -1)
    dispatch_once(&CKMainScreenScale_once_21, &__block_literal_global_50);
  v42 = *(double *)&CKMainScreenScale_sMainScreenScale_21;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_21 == 0.0)
    v42 = 1.0;
  objc_msgSend(v36, "setFrame:", 0.0, 1.0 / v42 * (v24 * v42 + floor((v10 * v42 - v38 * v42) * 0.5)), v34 - v41, v38);
  -[CKMessageEntryWaveformView updateWaveform](self, "updateWaveform");

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

- (void)setDuration:(double)a3
{
  double duration;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;

  duration = self->_duration;
  if (duration != a3)
  {
    v9 = 0uLL;
    v8 = 0uLL;
    CKTimeIntervalComponents((unint64_t *)&v9 + 1, (unint64_t *)&v9, 0, duration);
    CKTimeIntervalComponents((unint64_t *)&v8 + 1, (unint64_t *)&v8, 0, a3);
    self->_duration = a3;
    if (v9 != v8)
    {
      CKLocalizedStringForDuration(a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageEntryWaveformView timeLabel](self, "timeLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setText:", v6);

    }
  }
}

- (void)appendPowerLevel:(double)a3
{
  void *v5;
  id v6;

  -[CKMessageEntryWaveformView powerLevels](self, "powerLevels");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[CKMessageEntryWaveformView setPowerLevels:](self, "setPowerLevels:");
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v5);

  -[CKMessageEntryWaveformView setNeedsLayout](self, "setNeedsLayout");
}

- (void)clearPowerLevels
{
  -[CKMessageEntryWaveformView setPowerLevels:](self, "setPowerLevels:", 0);
  -[CKMessageEntryWaveformView setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateWaveform
{
  void *v3;
  void *v4;
  unint64_t v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  uint64_t v10;
  double v11;
  unint64_t v12;
  uint64_t v13;
  double *v14;
  size_t v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  double *v23;
  void *v24;
  float v25;
  double v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  -[CKMessageEntryWaveformView powerLevels](self, "powerLevels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryWaveformView waveformImageView](self, "waveformImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v5 = objc_msgSend(v3, "count");
    objc_msgSend(v4, "bounds");
    v7 = v6;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = ceil(v7 / (double)(unint64_t)objc_msgSend(v8, "waveformPowerLevelWidthIncrement"));

    v11 = (double)v5;
    if (v9 <= (double)v5)
      v11 = v9;
    v12 = (unint64_t)v11;
    MEMORY[0x1E0C80A78](v10);
    v14 = (double *)((char *)v32 - v13);
    bzero((char *)v32 - v13, v15);
    v16 = objc_msgSend(v3, "count");
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "waveformMinDbPowerLevel");
    v19 = CKLinearForDbPowerLevel(v18) * 32767.0;

    v20 = log(32767.0 - v19);
    if (v12)
    {
      v21 = v20;
      v22 = -(uint64_t)v12;
      v23 = v14;
      do
      {
        objc_msgSend(v3, "objectAtIndex:", v16 + v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "floatValue");
        v26 = v25;

        v20 = fmax(log(v26 - v19), 0.0) / v21;
        *v23++ = v20;
      }
      while (!__CFADD__(v22++, 1));
    }
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", v20);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "theme");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "entryFieldBorderColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    CKWaveformWithPowerLevels((uint64_t)v14, v12, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v31 = 0;
  }
  objc_msgSend(v4, "setImage:", v31);

}

- (double)duration
{
  return self->_duration;
}

- (NSMutableArray)powerLevels
{
  return self->_powerLevels;
}

- (void)setPowerLevels:(id)a3
{
  objc_storeStrong((id *)&self->_powerLevels, a3);
}

- (UIImageView)waveformImageView
{
  return self->_waveformImageView;
}

- (void)setWaveformImageView:(id)a3
{
  objc_storeStrong((id *)&self->_waveformImageView, a3);
}

- (unint64_t)maxPowerLevelsCount
{
  return self->_maxPowerLevelsCount;
}

- (void)setMaxPowerLevelsCount:(unint64_t)a3
{
  self->_maxPowerLevelsCount = a3;
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

- (UILabel)timeLabel
{
  return self->_timeLabel;
}

- (void)setTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_timeLabel, a3);
}

- (double)minTimeLabelWidth
{
  return self->_minTimeLabelWidth;
}

- (void)setMinTimeLabelWidth:(double)a3
{
  self->_minTimeLabelWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_balloonImageView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_waveformImageView, 0);
  objc_storeStrong((id *)&self->_powerLevels, 0);
}

@end
