@implementation HURecordedWaveformView

- (HURecordedWaveformView)initWithFrame:(CGRect)a3 waveformColor:(id)a4 backgroundColor:(id)a5 tintColor:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  id v15;
  id v16;
  HURecordedWaveformView *v17;
  HURecordedWaveformView *v18;
  id v19;
  void *v20;
  uint64_t v21;
  UIVisualEffectView *blurView;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  UIButton *playRecordingButton;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v36;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v36.receiver = self;
  v36.super_class = (Class)HURecordedWaveformView;
  v17 = -[HURecordedWaveformView initWithFrame:](&v36, sel_initWithFrame_, x, y, width, height);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_waveformColor, a4);
    objc_storeStrong((id *)&v18->_backgroundColor, a5);
    v19 = objc_alloc(MEMORY[0x1E0CEABE8]);
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "initWithEffect:", v20);
    blurView = v18->_blurView;
    v18->_blurView = (UIVisualEffectView *)v21;

    -[UIVisualEffectView contentView](v18->_blurView, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setBackgroundColor:", objc_msgSend(objc_retainAutorelease(v15), "CGColor"));

    -[UIVisualEffectView contentView](v18->_blurView, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setCompositingFilter:", *MEMORY[0x1E0CD2E50]);

    -[UIVisualEffectView layer](v18->_blurView, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setMasksToBounds:", 1);

    -[HURecordedWaveformView addSubview:](v18, "addSubview:", v18->_blurView);
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
    v28 = objc_claimAutoreleasedReturnValue();
    playRecordingButton = v18->_playRecordingButton;
    v18->_playRecordingButton = (UIButton *)v28;

    objc_msgSend(MEMORY[0x1E0CEA638], "hu_playButton");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](v18->_playRecordingButton, "setImage:forState:", v30, 0);
    -[UIButton setOpaque:](v18->_playRecordingButton, "setOpaque:", 0);
    -[UIButton setTintColor:](v18->_playRecordingButton, "setTintColor:", v16);
    -[UIButton accessibilitySetIdentification:](v18->_playRecordingButton, "accessibilitySetIdentification:", CFSTR("playAnnounceRecordingButton"));
    -[UIButton _setTouchInsets:](v18->_playRecordingButton, "_setTouchInsets:", -0.15, -0.15, -0.15, -0.15);
    -[UIButton addTarget:action:forControlEvents:](v18->_playRecordingButton, "addTarget:action:forControlEvents:", v18, sel__playRecording_, 64);
    -[HURecordedWaveformView addSubview:](v18, "addSubview:", v18->_playRecordingButton);
    v31 = objc_alloc(MEMORY[0x1E0CEA658]);
    v32 = (void *)objc_msgSend(v31, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[HURecordedWaveformView setWaveformImageView:](v18, "setWaveformImageView:", v32);

    -[HURecordedWaveformView waveformImageView](v18, "waveformImageView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setContentMode:", 8);

    -[HURecordedWaveformView waveformImageView](v18, "waveformImageView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HURecordedWaveformView addSubview:](v18, "addSubview:", v34);

  }
  return v18;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)HURecordedWaveformView;
  -[HURecordedWaveformView layoutSubviews](&v29, sel_layoutSubviews);
  -[HURecordedWaveformView blurView](self, "blurView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HURecordedWaveformView bounds](self, "bounds");
  objc_msgSend(v4, "setCornerRadius:", v5 * 0.5);

  -[HURecordedWaveformView blurView](self, "blurView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HURecordedWaveformView bounds](self, "bounds");
  objc_msgSend(v6, "setFrame:");

  -[HURecordedWaveformView playRecordingButton](self, "playRecordingButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;

  -[HURecordedWaveformView blurView](self, "blurView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "center");
  v14 = v13 - v11 * 0.5;

  -[HURecordedWaveformView playRecordingButton](self, "playRecordingButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v9, v14, 44.0, 44.0);

  -[HURecordedWaveformView bounds](self, "bounds");
  -[HURecordedWaveformView bounds](self, "bounds");
  v17 = v16;
  v18 = v9 + 44.0;
  -[HURecordedWaveformView blurView](self, "blurView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "center");
  v21 = v20 - v17 * 0.5;

  -[HURecordedWaveformView bounds](self, "bounds");
  v23 = v22 + -244.0 + 200.0;
  -[HURecordedWaveformView waveformImageView](self, "waveformImageView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", v18, v21, v23, v17);

  -[HURecordedWaveformView waveformImage](self, "waveformImage");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    -[HURecordedWaveformView waveformColor](self, "waveformColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HURecordedWaveformView _waveFormImageForWidth:havingColor:](self, "_waveFormImageForWidth:havingColor:", v26, v23);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    -[HURecordedWaveformView setWaveformImage:](self, "setWaveformImage:", v27);
    -[HURecordedWaveformView waveformImageView](self, "waveformImageView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setImage:", v27);

  }
}

- (void)setAudioPowerLevels:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_audioPowerLevels != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_audioPowerLevels, a3);
    -[HURecordedWaveformView setWaveformImage:](self, "setWaveformImage:", 0);
    -[HURecordedWaveformView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setAudioFileURL:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_audioFileURL, a3);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D311B0]), "initWithAudioFileURL:audioSessionOptions:delegate:", v5, 4, self);
  -[HURecordedWaveformView setAudioPlayer:](self, "setAudioPlayer:", v6);

  -[HURecordedWaveformView audioPlayer](self, "audioPlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v7, "prepareToPlay:", &v10);
  v8 = v10;

  if (v8)
  {
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v12 = v5;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "Failed prepare to play audioFile [%@] - [%@]", buf, 0x16u);
    }

  }
}

- (void)setAlpha:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HURecordedWaveformView;
  -[HURecordedWaveformView setAlpha:](&v7, sel_setAlpha_, a3);
  -[HURecordedWaveformView audioPlayer](self, "audioPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stop");

  -[HURecordedWaveformView playRecordingButton](self, "playRecordingButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "hu_playButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:forState:", v6, 0);

}

- (void)_playRecording:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  -[HURecordedWaveformView audioPlayer](self, "audioPlayer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPlaying");

  -[HURecordedWaveformView audioPlayer](self, "audioPlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (v5)
  {
    objc_msgSend(v6, "pause");
  }
  else
  {
    objc_msgSend(v6, "play");

    objc_msgSend(MEMORY[0x1E0CEA638], "hu_pauseButton");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[HURecordedWaveformView playRecordingButton](self, "playRecordingButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:forState:", v8, 0);

  }
}

- (id)_waveFormImageForWidth:(double)a3 havingColor:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  float v23;
  float v24;
  unint64_t v25;
  unint64_t v26;
  double v27;
  unint64_t v28;
  double v29;
  float v31;
  float v32;
  double v33;
  unint64_t v34;
  unint64_t v35;
  double *v36;
  uint64_t v37;
  unint64_t v38;
  double v39;
  double v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v46;
  void *v47;
  id v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HURecordedWaveformView audioPowerLevels](self, "audioPowerLevels");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = (unint64_t)(a3 * 0.25);
  if (v9)
  {
    v10 = (8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0;
    v11 = (char *)&v46 - v10;
    -[HURecordedWaveformView audioPowerLevels](self, "audioPowerLevels", MEMORY[0x1E0C80A78](v7).n128_f64[0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      v46 = (uint64_t)&v46;
      v48 = v6;
      MEMORY[0x1E0C80A78](v14);
      v15 = (char *)&v46 - v10;
      bzero((char *)&v46 - v10, 8 * v9);
      bzero((char *)&v46 - v10, 8 * v9);
      v55 = 0u;
      v54 = 0u;
      v53 = 0u;
      v52 = 0u;
      v47 = v8;
      v16 = v8;
      v51 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      if (v51)
      {
        v17 = 0;
        v18 = 0;
        v50 = *(_QWORD *)v53;
        v19 = v9 - 1;
        v49 = v11 + 8;
        do
        {
          v20 = 0;
          v21 = v18 * v9;
          v22 = v17;
          do
          {
            if (*(_QWORD *)v53 != v50)
              objc_enumerationMutation(v16);
            objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * v20), "floatValue");
            v24 = __exp10(v23 * 0.05) * 32767.0;
            v25 = objc_msgSend(v16, "count");
            if (v18 * v9 / v25 >= v19)
              v17 = v9 - 1;
            else
              v17 = v18 * v9 / v25;
            v26 = *(_QWORD *)&v15[8 * v17];
            v27 = v24 * v24 + *(double *)&v11[8 * v17] * *(double *)&v11[8 * v17] * (double)v26;
            v28 = v26 + 1;
            v29 = sqrt(v27 / (double)v28);
            *(double *)&v11[8 * v17] = v29;
            if (v17 != v22 && v22 + 1 < v17)
            {
              v31 = *(double *)&v11[8 * v22];
              v32 = v29 - v31;
              v33 = (float)((float)(v32 / (float)(v17 - v22)) + v31);
              v34 = v21 / v25;
              if (v21 / v25 >= v19)
                v34 = v9 - 1;
              v35 = ~v22 + v34;
              v36 = (double *)&v49[8 * v22];
              do
              {
                *v36++ = v33;
                --v35;
              }
              while (v35);
            }
            *(_QWORD *)&v15[8 * v17] = v28;
            ++v18;
            ++v20;
            v21 += v9;
            v22 = v17;
          }
          while (v20 != v51);
          v51 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
        }
        while (v51);
      }

      v37 = 0;
      if (v9 <= 1)
        v38 = 1;
      else
        v38 = (unint64_t)(a3 * 0.25);
      v39 = 1.0;
      do
      {
        v40 = fmax(*(double *)&v11[8 * v37] + -30.0, 0.0);
        *(double *)&v11[8 * v37] = v40;
        if (v39 < v40)
          v39 = v40;
        ++v37;
      }
      while (v38 != v37);
      v41 = 0;
      v6 = v48;
      do
      {
        *(double *)&v11[8 * v41] = *(double *)&v11[8 * v41] / v39;
        ++v41;
      }
      while (v38 != v41);
      +[HUAudioWaveformUtilities waveformImageforPowerLevels:powerLevelsCount:color:](HUAudioWaveformUtilities, "waveformImageforPowerLevels:powerLevelsCount:color:", v11, v9, v6);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "_flatImageWithColor:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v44, "imageWithAlignmentRectInsets:", 0.0, 0.0, 0.0, 1.0);
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = v47;
    }
    else
    {
      v9 = 0;
    }
  }

  return (id)v9;
}

- (void)_updateProgressForPlaybackTime:(double)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  int v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  CGSize v20;
  CGRect v21;

  -[HURecordedWaveformView audioPlayer](self, "audioPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "duration");
  v7 = v6;

  +[HUAudioWaveformUtilities progressForTime:duration:](HUAudioWaveformUtilities, "progressForTime:duration:", a3, v7);
  -[HURecordedWaveformView audioPlayer](self, "audioPlayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isPlaying");

  if (v9)
  {
    -[HURecordedWaveformView waveformImage](self, "waveformImage");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "size");
    v11 = v10;
    v13 = v12;
    +[HUAudioWaveformUtilities disabledWaveformWidth:forProgress:](HUAudioWaveformUtilities, "disabledWaveformWidth:forProgress:");
    v15 = v14;
    v20.width = v11;
    v20.height = v13;
    UIGraphicsBeginImageContextWithOptions(v20, 0, 0.0);
    objc_msgSend(v19, "drawAtPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "set");

    v21.origin.x = v11 - v15;
    v21.origin.y = 0.0;
    v21.size.width = v15;
    v21.size.height = v13;
    UIRectFillUsingBlendMode(v21, kCGBlendModeSourceIn);
    UIGraphicsGetImageFromCurrentImageContext();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    -[HURecordedWaveformView waveformImageView](self, "waveformImageView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setImage:", v17);

  }
}

- (void)audioPlayer:(id)a3 didPausePlaybackWithReason:(id)a4
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CEA638], "hu_playButton", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HURecordedWaveformView playRecordingButton](self, "playRecordingButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:forState:", v6, 0);

}

- (void)audioPlayerDidStopPlayback:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CEA638], "hu_playButton", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HURecordedWaveformView playRecordingButton](self, "playRecordingButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:forState:", v5, 0);

}

- (void)audioPlayerDidResumePlayback:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CEA638], "hu_pauseButton", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HURecordedWaveformView playRecordingButton](self, "playRecordingButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:forState:", v5, 0);

}

- (void)audioPlayerDidFinishPlayback:(id)a3 withError:(id)a4
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CEA638], "hu_playButton", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HURecordedWaveformView playRecordingButton](self, "playRecordingButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:forState:", v6, 0);

}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSArray)audioPowerLevels
{
  return self->_audioPowerLevels;
}

- (NSURL)audioFileURL
{
  return self->_audioFileURL;
}

- (UIImageView)waveformImageView
{
  return self->_waveformImageView;
}

- (void)setWaveformImageView:(id)a3
{
  objc_storeStrong((id *)&self->_waveformImageView, a3);
}

- (UIButton)playRecordingButton
{
  return self->_playRecordingButton;
}

- (void)setPlayRecordingButton:(id)a3
{
  objc_storeStrong((id *)&self->_playRecordingButton, a3);
}

- (UIVisualEffectView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_blurView, a3);
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

- (double)minTimeLabelWidth
{
  return self->_minTimeLabelWidth;
}

- (void)setMinTimeLabelWidth:(double)a3
{
  self->_minTimeLabelWidth = a3;
}

- (UIColor)waveformColor
{
  return self->_waveformColor;
}

- (void)setWaveformColor:(id)a3
{
  objc_storeStrong((id *)&self->_waveformColor, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (HFAudioPlayer)audioPlayer
{
  return self->_audioPlayer;
}

- (void)setAudioPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_audioPlayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_waveformColor, 0);
  objc_storeStrong((id *)&self->_waveformImage, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_playRecordingButton, 0);
  objc_storeStrong((id *)&self->_waveformImageView, 0);
  objc_storeStrong((id *)&self->_audioFileURL, 0);
  objc_storeStrong((id *)&self->_audioPowerLevels, 0);
}

@end
