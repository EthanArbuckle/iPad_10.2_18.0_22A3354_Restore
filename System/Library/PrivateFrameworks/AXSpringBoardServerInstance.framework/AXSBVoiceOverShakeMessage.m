@implementation AXSBVoiceOverShakeMessage

- (AXSBVoiceOverShakeMessage)initWithFrame:(CGRect)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  AXSBVoiceOverShakeMessage *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  AXSBVoiceOverShakeMessage *v27;
  objc_super v29;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;

  v29.receiver = self;
  v29.super_class = (Class)AXSBVoiceOverShakeMessage;
  v9 = -[AXSBVoiceOverShakeMessage initWithFrame:](&v29, sel_initWithFrame_, (v6 + -160.0) * 0.5, v8 + -160.0, 160.0, 160.0);
  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), "initWithFrame:", 20.0, 5.0, 120.0, 150.0);
    objc_msgSend(v10, "setClipsToBounds:", 1);
    -[AXSBVoiceOverShakeMessage addSubview:](v9, "addSubview:", v10);
    v11 = objc_alloc(MEMORY[0x24BEBD708]);
    objc_msgSend(v10, "bounds");
    v12 = (void *)objc_msgSend(v11, "initWithFrame:");
    objc_msgSend(v12, "setNumberOfLines:", 0);
    UISystemFontBoldForSize();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFont:", v13);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v14);

    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextColor:", v15);

    objc_msgSend(v12, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setShadowColor:", v16);

    objc_msgSend(v12, "setShadowOffset:", 1.0, 1.0);
    SBAXLocalizedString(CFSTR("SHAKE_TO_ENABLE"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v17);

    objc_msgSend(v10, "addSubview:", v12);
    objc_msgSend(v12, "sizeToFit");
    objc_msgSend(v12, "frame");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    objc_msgSend(v10, "frame");
    objc_msgSend(v12, "setFrame:", v19, v24 * 0.5 - v23 * 0.5, v21, v23);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSBVoiceOverShakeMessage setBackgroundColor:](v9, "setBackgroundColor:", v25);

    -[AXSBVoiceOverShakeMessage setAlpha:](v9, "setAlpha:", 0.0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v9, sel_orientationChange, CFSTR("AXSBServerOrientationChange"), 0);

    -[AXSBVoiceOverShakeMessage setClipsToBounds:](v9, "setClipsToBounds:", 1);
    -[AXSBVoiceOverShakeMessage reorientHUDIfNeeded:](v9, "reorientHUDIfNeeded:", 0);
    v27 = v9;

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AXSBVoiceOverShakeMessage;
  -[AXSBVoiceOverShakeMessage dealloc](&v4, sel_dealloc);
}

- (void)orientationChange
{
  -[AXSBVoiceOverShakeMessage reorientHUDIfNeeded:](self, "reorientHUDIfNeeded:", 1);
}

- (void)reorientHUDIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  double v10;
  _QWORD v11[5];
  int v12;
  int v13;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "safeIntegerForKey:", CFSTR("activeInterfaceOrientation"));

  v7 = v6 - 1;
  v8 = 0;
  v9 = 0;
  if ((unint64_t)(v6 - 1) <= 3)
  {
    v8 = dword_21ACB6A60[v7];
    v9 = dword_21ACB6A70[v7];
  }
  v10 = 0.3;
  if (!v3)
    v10 = 0.0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __49__AXSBVoiceOverShakeMessage_reorientHUDIfNeeded___block_invoke;
  v11[3] = &unk_24DDE5808;
  v11[4] = self;
  v12 = v8;
  v13 = v9;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v11, v10);
}

uint64_t __49__AXSBVoiceOverShakeMessage_reorientHUDIfNeeded___block_invoke(uint64_t a1)
{
  __int128 v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGAffineTransform v17;

  v2 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v17.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v17.c = v2;
  *(_OWORD *)&v17.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  v3 = *(void **)(a1 + 32);
  *(_OWORD *)&v16.a = *(_OWORD *)&v17.a;
  *(_OWORD *)&v16.c = v2;
  *(_OWORD *)&v16.tx = *(_OWORD *)&v17.tx;
  objc_msgSend(v3, "setTransform:", &v16);
  objc_msgSend(*(id *)(a1 + 32), "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = *(float *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = (v12 - v9) * 0.5 + v10;

  objc_msgSend(*(id *)(a1 + 32), "setFrame:", v5, v13, v7, v9);
  CGAffineTransformMakeRotation(&v17, *(float *)(a1 + 44) * 3.14159265 / 180.0);
  v15 = v17;
  UIIntegralTransform();
  v17 = v16;
  return objc_msgSend(*(id *)(a1 + 32), "setTransform:", &v16, *(_OWORD *)&v15.a, *(_OWORD *)&v15.c, *(_OWORD *)&v15.tx);
}

- (void)drawRect:(CGRect)a3
{
  void *v3;
  id v4;
  CGRect v5;

  v5 = CGRectInset(a3, 10.0, 10.0);
  objc_msgSend(MEMORY[0x24BEBD420], "roundedRectBezierPath:withRoundedCorners:withCornerRadius:", -1, v5.origin.x, v5.origin.y, v5.size.width, v5.size.height, 10.0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.65);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFill");

  objc_msgSend(v4, "fill");
}

@end
