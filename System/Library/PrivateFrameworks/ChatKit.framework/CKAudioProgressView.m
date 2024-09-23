@implementation CKAudioProgressView

- (CKAudioProgressView)initWithFrame:(CGRect)a3
{
  CKAudioProgressView *v3;
  CKAudioProgressView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKAudioProgressView;
  v3 = -[CKAudioProgressView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKAudioProgressView setOpaque:](v3, "setOpaque:", 0);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D36A58]), "initWithTarget:action:", v4, sel_prepareForDisplay);
    -[CKAudioProgressView setDisplayUpdater:](v4, "setDisplayUpdater:", v5);

  }
  return v4;
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
  CGSize result;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "audioProgressViewSize");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

+ (float)progressForTime:(double)a3 duration:(double)a4
{
  float v4;
  double v5;

  v4 = 0.0;
  if (a3 != 0.0)
  {
    v4 = 1.0;
    if (a3 != a4)
    {
      if (a4 >= 0.05)
        a3 = a3 + 0.05;
      v4 = a3 / a4;
    }
  }
  v5 = v4;
  if (v4 > 1.0)
    v5 = 1.0;
  return fmax(v5, 0.0);
}

- (void)setProgress:(float)a3
{
  double v3;
  float v4;

  v3 = a3;
  if (v3 > 1.0)
    v3 = 1.0;
  v4 = fmax(v3, 0.0);
  if (self->_progress != v4)
  {
    self->_progress = v4;
    -[CKAudioProgressView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
  }
}

- (void)setPlaying:(BOOL)a3
{
  if (self->_playing != a3)
  {
    self->_playing = a3;
    -[CKAudioProgressView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
  }
}

- (void)setPlayed:(BOOL)a3
{
  if (self->_played != a3)
  {
    self->_played = a3;
    -[CKAudioProgressView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
  }
}

- (void)setColor:(char)a3
{
  if (self->_color != a3)
  {
    self->_color = a3;
    -[CKAudioProgressView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
  }
}

- (void)prepareForDisplay
{
  _BOOL8 v3;
  float v4;
  float v5;
  uint64_t v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double MidX;
  double MidY;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CGFloat v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  id v28;
  CGSize v29;
  CGRect v30;
  CGRect v31;

  v3 = -[CKAudioProgressView isPlaying](self, "isPlaying");
  -[CKAudioProgressView progress](self, "progress");
  v5 = v4;
  v6 = -[CKAudioProgressView color](self, "color");
  +[CKAudioProgressView imageWithType:color:](CKAudioProgressView, "imageWithType:color:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0C9D538];
  v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "audioProgressViewSize");
  v12 = v11;
  v14 = v13;

  v30.origin.x = v8;
  v30.origin.y = v9;
  v30.size.width = v12;
  v30.size.height = v14;
  MidX = CGRectGetMidX(v30);
  v31.origin.x = v8;
  v31.origin.y = v9;
  v31.size.width = v12;
  v31.size.height = v14;
  MidY = CGRectGetMidY(v31);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "theme");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "progressViewColorForColorType:", v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKAudioProgressView traitCollection](self, "traitCollection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 4.0;
  if (objc_msgSend(v20, "userInterfaceIdiom") != 6)
  {
    -[CKAudioProgressView traitCollection](self, "traitCollection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "displayScale");
    v21 = v23;

  }
  v29.width = v12;
  v29.height = v14;
  UIGraphicsBeginImageContextWithOptions(v29, 0, v21);
  if (v5 > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, (v12 + -3.0) * 0.5, -1.57079633, v5 * 6.28318531 + -1.57079633);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "set");
    objc_msgSend(v24, "setLineWidth:", 3.0);
    objc_msgSend(v24, "stroke");

  }
  objc_msgSend(v7, "size");
  v26 = MidX - v25 * 0.5;
  objc_msgSend(v7, "size");
  objc_msgSend(v7, "drawAtPoint:", v26, MidY - v27 * 0.5);
  UIGraphicsGetImageFromCurrentImageContext();
  v28 = (id)objc_claimAutoreleasedReturnValue();

  UIGraphicsEndImageContext();
  -[CKBalloonImageView setImage:](self, "setImage:", v28);

}

- (void)prepareForDisplayIfNeeded
{
  id v2;

  -[CKAudioProgressView displayUpdater](self, "displayUpdater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateIfNeeded");

}

- (void)setNeedsPrepareForDisplay
{
  id v2;

  -[CKAudioProgressView displayUpdater](self, "displayUpdater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdate");

}

+ (id)imageWithType:(unsigned __int8)a3 color:(char)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BYTE v15[3];

  v4 = a4;
  v5 = a3;
  CKAudioProgressImageCache();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  v15[1] = v5;
  v15[2] = 0;
  objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", v15, "{?=cCB}");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(a1, "templateImageWithType:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "theme");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "progressViewColorForColorType:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_flatImageWithColor:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setObject:forKey:", v9, v8);
  }

  return v9;
}

+ (id)templateImageWithType:(unsigned __int8)a3
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  _BYTE v14[3];

  v3 = a3;
  CKAudioProgressImageCache();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = 0;
  v14[1] = v3;
  v14[2] = 1;
  objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", v14, "{?=cCB}");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "audioProgressViewSize");
    v9 = v8 + -10.0;

    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      v11 = CFSTR("pause.circle.fill");
    else
      v11 = CFSTR("play.circle.fill");
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageWithSymbolConfiguration:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v6, v5);
  }

  return v6;
}

+ (id)templateImageWithControlImage:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  CGSize v27;

  v3 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioProgressViewSize");
  v6 = v5;
  v8 = v7;

  v27.width = v6;
  v27.height = v8;
  UIGraphicsBeginImageContextWithOptions(v27, 0, 0.0);
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "set");

  if (v3)
  {
    v10 = *MEMORY[0x1E0C9D538];
    v11 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v3, "alignmentRectInsets");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    objc_msgSend(v3, "size");
    v21 = v20 - (v15 + v19);
    v23 = v22 - (v13 + v17);
    if (CKMainScreenScale_once_101 != -1)
      dispatch_once(&CKMainScreenScale_once_101, &__block_literal_global_85_3);
    v24 = *(double *)&CKMainScreenScale_sMainScreenScale_101;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_101 == 0.0)
      v24 = 1.0;
    objc_msgSend(v3, "drawAtPoint:", 1.0 / v24 * (v10 * v24 + floor((v6 * v24 - v21 * v24) * 0.5)) - v15, 1.0 / v24 * (v11 * v24 + floor((v8 * v24 - v23 * v24) * 0.5)) - v13);
  }
  UIGraphicsGetImageFromCurrentImageContext();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v25;
}

- (float)progress
{
  return self->_progress;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (BOOL)isPlayed
{
  return self->_played;
}

- (char)color
{
  return self->_color;
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
}

@end
