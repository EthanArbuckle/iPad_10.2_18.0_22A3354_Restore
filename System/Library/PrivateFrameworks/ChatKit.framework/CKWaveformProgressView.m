@implementation CKWaveformProgressView

- (CKWaveformProgressView)initWithFrame:(CGRect)a3
{
  CKWaveformProgressView *v3;
  CKWaveformProgressView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKWaveformProgressView;
  v3 = -[CKWaveformProgressView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKWaveformProgressView setContentMode:](v3, "setContentMode:", 4);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D36A58]), "initWithTarget:action:", v4, sel_prepareForDisplay);
    -[CKWaveformProgressView setDisplayUpdater:](v4, "setDisplayUpdater:", v5);

  }
  return v4;
}

- (void)prepareForDisplayIfNeeded
{
  id v2;

  -[CKWaveformProgressView displayUpdater](self, "displayUpdater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateIfNeeded");

}

- (void)setNeedsPrepareForDisplay
{
  id v2;

  -[CKWaveformProgressView displayUpdater](self, "displayUpdater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdate");

}

- (void)setWaveform:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_waveform != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_waveform, a3);
    -[CKWaveformProgressView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
    v5 = v6;
  }

}

- (void)setCurrentTime:(double)a3
{
  if (self->_currentTime != a3)
  {
    self->_currentTime = a3;
    -[CKWaveformProgressView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
  }
}

- (void)setPlaying:(BOOL)a3
{
  if (self->_playing != a3)
  {
    self->_playing = a3;
    -[CKWaveformProgressView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
  }
}

- (void)setPlayed:(BOOL)a3
{
  if (self->_played != a3)
  {
    self->_played = a3;
    -[CKWaveformProgressView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
  }
}

- (void)setColor:(char)a3
{
  if (self->_color != a3)
  {
    self->_color = a3;
    -[CKWaveformProgressView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
  }
}

- (void)prepareForDisplay
{
  int v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v13;
  void *v14;
  float v15;
  float v16;
  void *v17;
  unint64_t v18;
  void *v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  long double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  double v42;
  double v43;
  double v44;
  _QWORD v45[4];
  id v46;
  double v47;
  double v48;
  CGSize v49;
  CGRect v50;
  CGRect v51;

  v3 = -[CKWaveformProgressView color](self, "color");
  -[CKWaveformProgressView duration](self, "duration");
  v5 = v4;
  -[CKWaveformProgressView currentTime](self, "currentTime");
  v7 = v6;
  -[CKWaveformProgressView waveform](self, "waveform");
  v39 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "size");
  if (v9 != 0.0)
  {
    v10 = v8;
    if (v8 != 0.0)
    {
      v11 = v9;
      if (v8 != *MEMORY[0x1E0C9D820] || v9 != *(double *)(MEMORY[0x1E0C9D820] + 8))
      {
        if (v7 == v5 || v7 == 0.0 && !-[CKWaveformProgressView isPlaying](self, "isPlaying"))
        {
          -[CKWaveformProgressView waveform](self, "waveform");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v3 == -1 && !-[CKWaveformProgressView isPlayed](self, "isPlayed"))
          {
            v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA610]), "initWithSize:", v10, v11);
            v45[0] = MEMORY[0x1E0C809B0];
            v45[1] = 3221225472;
            v45[2] = __43__CKWaveformProgressView_prepareForDisplay__block_invoke;
            v45[3] = &unk_1E2750638;
            v46 = v13;
            v47 = v10;
            v48 = v11;
            objc_msgSend(v14, "imageWithActions:", v45);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

          }
        }
        else
        {
          +[CKAudioProgressView progressForTime:duration:](CKAudioProgressView, "progressForTime:duration:", v7, v5);
          v16 = v15;
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "waveformPowerLevelWidthIncrement");

          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "waveformPowerLevelWidth");
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "waveformGapWidth");

          if (CKMainScreenScale_once_52 != -1)
            dispatch_once(&CKMainScreenScale_once_52, &__block_literal_global_126);
          v23 = (1.0 - v16) * (v10 / (double)v18);
          v24 = fmod(v23, 1.0) * (double)v20 + (double)(unint64_t)v23 * (double)v18 + (double)v22;
          v25 = *(double *)&CKMainScreenScale_sMainScreenScale_52;
          if (*(double *)&CKMainScreenScale_sMainScreenScale_52 == 0.0)
            v25 = 1.0;
          v26 = floor(v24 * v25) / v25;
          objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "isRichAudioMessagesEnabled");

          if (v28)
          {
            v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA610]), "initWithSize:", v10, v11);
            v40[0] = MEMORY[0x1E0C809B0];
            v40[1] = 3221225472;
            v40[2] = __43__CKWaveformProgressView_prepareForDisplay__block_invoke_2;
            v40[3] = &unk_1E2755D08;
            v42 = v10;
            v43 = v11;
            v44 = v26;
            v41 = v39;
            objc_msgSend(v13, "imageWithActions:", v40);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[CKWaveformProgressView setImage:](self, "setImage:", v29);

LABEL_27:
            goto LABEL_28;
          }
          v49.width = v10;
          v49.height = v11;
          UIGraphicsBeginImageContextWithOptions(v49, 0, 0.0);
          if (v3 == -1)
          {
            v33 = -[CKWaveformProgressView isPlayed](self, "isPlayed");
            objc_msgSend(v39, "drawAtPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
            +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "theme");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = v35;
            v37 = v10 - v26;
            if (v33)
              objc_msgSend(v35, "waveformDisabledColor");
            else
              objc_msgSend(v35, "waveformUnplayedColor");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "set");

            v51.origin.y = 0.0;
            v51.origin.x = v37;
            v51.size.width = v26;
            v51.size.height = v11;
            UIRectFillUsingBlendMode(v51, kCGBlendModeSourceIn);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "set");

            v50.size.width = v10 - v26;
            v50.origin.x = 0.0;
            v50.origin.y = 0.0;
            v50.size.height = v11;
            UIRectFill(v50);
            v31 = *MEMORY[0x1E0C9D538];
            v32 = *(double *)(MEMORY[0x1E0C9D538] + 8);
            objc_msgSend(v39, "drawAtPoint:blendMode:alpha:", 18, *MEMORY[0x1E0C9D538], v32, 1.0);
            objc_msgSend(v39, "drawAtPoint:blendMode:alpha:", 0, v31, v32, 0.33);
          }
          UIGraphicsGetImageFromCurrentImageContext();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          UIGraphicsEndImageContext();
        }
        -[CKWaveformProgressView setImage:](self, "setImage:", v13);
        goto LABEL_27;
      }
    }
  }
LABEL_28:

}

void __43__CKWaveformProgressView_prepareForDisplay__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  CGRect v5;

  objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "theme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "waveformUnplayedColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set");

  v5.size.width = *(CGFloat *)(a1 + 40);
  v5.size.height = *(CGFloat *)(a1 + 48);
  v5.origin.x = 0.0;
  v5.origin.y = 0.0;
  UIRectFillUsingBlendMode(v5, kCGBlendModeSourceIn);
}

uint64_t __43__CKWaveformProgressView_prepareForDisplay__block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  CGRect v6;

  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "set");

  v6.size.height = *(CGFloat *)(a1 + 48);
  v6.size.width = *(double *)(a1 + 40) - *(double *)(a1 + 56);
  v6.origin.x = 0.0;
  v6.origin.y = 0.0;
  UIRectFill(v6);
  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:blendMode:alpha:", 18, *MEMORY[0x1E0C9D538], v4, 1.0);
  return objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:blendMode:alpha:", 0, v3, v4, 0.33);
}

- (void)setImage:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)CKWaveformProgressView;
    -[CKBalloonImageView setImage:](&v6, sel_setImage_, v4);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v8 = v4;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "CKWaveformProgressView: Attempting to setImage to object that is not an image - %@", buf, 0xCu);
      }

    }
    IMLogBacktrace();
  }

}

- (char)color
{
  return self->_color;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (UIImage)waveform
{
  return self->_waveform;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (BOOL)isPlayed
{
  return self->_played;
}

- (IMManualUpdater)displayUpdater
{
  return self->_displayUpdater;
}

- (void)setDisplayUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_displayUpdater, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayUpdater, 0);
  objc_storeStrong((id *)&self->_waveform, 0);
}

@end
