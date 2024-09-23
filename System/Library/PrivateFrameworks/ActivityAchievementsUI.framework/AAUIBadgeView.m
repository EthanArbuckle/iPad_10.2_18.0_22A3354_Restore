@implementation AAUIBadgeView

- (void)cleanupAfterSnapshot
{
  id v2;

  -[AAUIBadgeView drawable](self, "drawable");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cleanupAfterSnapshot");

}

- (id)initUsingEarnedShader:(BOOL)a3
{
  _BOOL4 useEarnedShader;
  double v4;
  double v5;
  double v6;
  double v7;
  AAUIBadgeView *v8;
  AAUIBadgeView *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSDictionary *tweakableUniforms;
  AAUIBadge *v16;
  AAUIBadge *badge;
  AAUIBadgeViewDrawable *v18;
  AAUIBadgeViewDrawable *drawable;
  void *v20;
  void *v21;
  uint64_t v22;
  UIPanGestureRecognizer *spinRecognizer;
  uint64_t v24;
  UITapGestureRecognizer *tapRecognizer;
  uint64_t v26;
  UILongPressGestureRecognizer *longPressRecognizer;
  objc_super v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  useEarnedShader = a3;
  v32 = *MEMORY[0x24BDAC8D0];
  v29.receiver = self;
  v29.super_class = (Class)AAUIBadgeView;
  v4 = *MEMORY[0x24BDBF090];
  v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v8 = -[AAUIBadgeView initWithFrame:](&v29, sel_initWithFrame_, *MEMORY[0x24BDBF090], v5, v6, v7);
  v9 = v8;
  if (v8)
  {
    v8->_magnetsEngaged = 1;
    -[AAUIBadgeView overrideEarnedShader](v8, "overrideEarnedShader");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[AAUIBadgeView overrideEarnedShader](v9, "overrideEarnedShader");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_useEarnedShader = objc_msgSend(v11, "BOOLValue");

      ACHLogDefault();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        -[AAUIBadgeView overrideEarnedShader](v9, "overrideEarnedShader");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v31 = v13;
        _os_log_impl(&dword_21CC08000, v12, OS_LOG_TYPE_DEFAULT, "Overriding earned shader value: %{public}@", buf, 0xCu);

      }
      useEarnedShader = v9->_useEarnedShader;
    }
    else
    {
      v9->_useEarnedShader = useEarnedShader;
    }
    if (useEarnedShader)
      -[AAUIBadgeView _defaultTweaks](v9, "_defaultTweaks");
    else
      -[AAUIBadgeView _unearnedShaderDefaultTweaks](v9, "_unearnedShaderDefaultTweaks");
    v14 = objc_claimAutoreleasedReturnValue();
    tweakableUniforms = v9->_tweakableUniforms;
    v9->_tweakableUniforms = (NSDictionary *)v14;

    v16 = objc_alloc_init(AAUIBadge);
    badge = v9->_badge;
    v9->_badge = v16;

    if (!v9->_useEarnedShader)
      -[AAUIBadge setMaxRotationY:](v9->_badge, "setMaxRotationY:", 1.48352986);
    -[AAUIBadgeView _invalidateLastUpdateTime](v9, "_invalidateLastUpdateTime");
    v18 = -[AAUIMetalBadgeView initUsingEarnedShader:delegate:]([AAUIMetalBadgeView alloc], "initUsingEarnedShader:delegate:", v9->_useEarnedShader, v9);
    drawable = v9->_drawable;
    v9->_drawable = v18;

    if (v9->_drawable)
    {
      -[AAUIBadgeView setAutoresizingMask:](v9, "setAutoresizingMask:", 18);
      -[AAUIBadgeViewDrawable view](v9->_drawable, "view");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setFrame:", v4, v5, v6, v7);

      -[AAUIBadgeViewDrawable view](v9->_drawable, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAUIBadgeView addSubview:](v9, "addSubview:", v21);

    }
    v22 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD7E0]), "initWithTarget:action:", v9, sel__panned_);
    spinRecognizer = v9->_spinRecognizer;
    v9->_spinRecognizer = (UIPanGestureRecognizer *)v22;

    -[UIPanGestureRecognizer setDelegate:](v9->_spinRecognizer, "setDelegate:", v9);
    -[AAUIBadgeView addGestureRecognizer:](v9, "addGestureRecognizer:", v9->_spinRecognizer);
    v24 = objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", v9, sel__tapped_);
    tapRecognizer = v9->_tapRecognizer;
    v9->_tapRecognizer = (UITapGestureRecognizer *)v24;

    -[AAUIBadgeView addGestureRecognizer:](v9, "addGestureRecognizer:", v9->_tapRecognizer);
    if (objc_msgSend(MEMORY[0x24BDD4198], "isAppleInternalInstall"))
    {
      v26 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD740]), "initWithTarget:action:", v9, sel__longPressInternalOnly_);
      longPressRecognizer = v9->_longPressRecognizer;
      v9->_longPressRecognizer = (UILongPressGestureRecognizer *)v26;

      -[UILongPressGestureRecognizer setNumberOfTouchesRequired:](v9->_longPressRecognizer, "setNumberOfTouchesRequired:", 2);
      -[AAUIBadgeView addGestureRecognizer:](v9, "addGestureRecognizer:", v9->_longPressRecognizer);
    }
  }
  return v9;
}

- (NSNumber)overrideEarnedShader
{
  NSNumber *overrideEarnedShader;
  void *v4;
  NSNumber *v5;
  NSNumber *v6;

  overrideEarnedShader = self->_overrideEarnedShader;
  if (!overrideEarnedShader)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("UseEarnedShader"));
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v6 = self->_overrideEarnedShader;
    self->_overrideEarnedShader = v5;

    overrideEarnedShader = self->_overrideEarnedShader;
  }
  return overrideEarnedShader;
}

- (void)_invalidateLastUpdateTime
{
  self->_lastUpdateTime = NAN;
}

- (id)_valueForTweak:(id)a3
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKey:](self->_tweakableUniforms, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_defaultTweaks
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[8];
  _QWORD v13[9];

  v13[8] = *MEMORY[0x24BDAC8D0];
  v12[0] = CFSTR("springMass");
  v2 = (void *)objc_msgSend(&unk_24E0BABE8, "mutableCopy");
  v13[0] = v2;
  v12[1] = CFSTR("springStiffness");
  v3 = (void *)objc_msgSend(&unk_24E0BAC10, "mutableCopy");
  v13[1] = v3;
  v12[2] = CFSTR("springDamping");
  v4 = (void *)objc_msgSend(&unk_24E0BAC38, "mutableCopy");
  v13[2] = v4;
  v12[3] = CFSTR("spinDrag");
  v5 = (void *)objc_msgSend(&unk_24E0BAC60, "mutableCopy");
  v13[3] = v5;
  v12[4] = CFSTR("magneticForce");
  v6 = (void *)objc_msgSend(&unk_24E0BAC88, "mutableCopy");
  v13[4] = v6;
  v12[5] = CFSTR("velocityForce");
  v7 = (void *)objc_msgSend(&unk_24E0BACB0, "mutableCopy");
  v13[5] = v7;
  v12[6] = CFSTR("unstickingForce");
  v8 = (void *)objc_msgSend(&unk_24E0BACD8, "mutableCopy");
  v13[6] = v8;
  v12[7] = CFSTR("velocityForcePower");
  v9 = (void *)objc_msgSend(&unk_24E0BAD00, "mutableCopy");
  v13[7] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_unearnedShaderDefaultTweaks
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[8];
  _QWORD v13[9];

  v13[8] = *MEMORY[0x24BDAC8D0];
  v12[0] = CFSTR("springMass");
  v2 = (void *)objc_msgSend(&unk_24E0BAD28, "mutableCopy");
  v13[0] = v2;
  v12[1] = CFSTR("springStiffness");
  v3 = (void *)objc_msgSend(&unk_24E0BAD50, "mutableCopy");
  v13[1] = v3;
  v12[2] = CFSTR("springDamping");
  v4 = (void *)objc_msgSend(&unk_24E0BAD78, "mutableCopy");
  v13[2] = v4;
  v12[3] = CFSTR("spinDrag");
  v5 = (void *)objc_msgSend(&unk_24E0BADA0, "mutableCopy");
  v13[3] = v5;
  v12[4] = CFSTR("magneticForce");
  v6 = (void *)objc_msgSend(&unk_24E0BADC8, "mutableCopy");
  v13[4] = v6;
  v12[5] = CFSTR("velocityForce");
  v7 = (void *)objc_msgSend(&unk_24E0BADF0, "mutableCopy");
  v13[5] = v7;
  v12[6] = CFSTR("unstickingForce");
  v8 = (void *)objc_msgSend(&unk_24E0BAE18, "mutableCopy");
  v13[6] = v8;
  v12[7] = CFSTR("velocityForcePower");
  v9 = (void *)objc_msgSend(&unk_24E0BAE40, "mutableCopy");
  v13[7] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setConfiguration:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AAUIBadgeView drawable](self, "drawable");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConfiguration:", v4);

}

- (AAUIBadgeViewDrawable)drawable
{
  return self->_drawable;
}

- (id)snapshot
{
  void *v2;
  void *v3;

  -[AAUIBadgeView drawable](self, "drawable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)updateBadgeModelForDrawable:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _BOOL4 v10;
  double v11;
  float v12;
  float v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  long double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double spinRate;
  double v29;
  long double v30;
  double v31;
  double v32;
  long double v33;
  long double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  AAUIBadge *v39;
  double v41;

  v4 = a3;
  if (self->_useEarnedShader)
  {
    -[AAUIBadgeView backTextureImage](self, "backTextureImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      -[AAUIBadgeView _generateBackTextureImage](self, "_generateBackTextureImage");
  }
  -[AAUIBadgeView timeSinceLastUpdate](self, "timeSinceLastUpdate");
  v7 = v6;
  -[AAUIBadge rotationY](self->_badge, "rotationY");
  v9 = v8;
  if (!-[AAUIBadgeView magnetsEngaged](self, "magnetsEngaged"))
    -[ARUIAnimatableObject update:](self->_badge, "update:", v7);
  v10 = -[AAUIBadgeView magnetsEngaged](self, "magnetsEngaged");
  -[AAUIBadge rotationY](self->_badge, "rotationY");
  if (v10)
  {
    *(float *)&v11 = v11;
    -[AAUIBadgeView _normalizeAngle:](self, "_normalizeAngle:", v11);
    v13 = v12;
    -[AAUIBadgeView _valueForTweak:](self, "_valueForTweak:", CFSTR("magneticForce"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v16 = v15;

    -[AAUIBadgeView _valueForTweak:](self, "_valueForTweak:", CFSTR("velocityForce"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    v19 = v18;

    -[AAUIBadgeView _valueForTweak:](self, "_valueForTweak:", CFSTR("velocityForcePower"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValue");
    v22 = v21;

    -[AAUIBadgeView _valueForTweak:](self, "_valueForTweak:", CFSTR("spinDrag"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    v41 = v24;

    -[AAUIBadgeView _valueForTweak:](self, "_valueForTweak:", CFSTR("unstickingForce"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "doubleValue");
    v27 = v26;

    spinRate = self->_spinRate;
    if (spinRate >= 0.0)
      v29 = self->_spinRate;
    else
      v29 = -spinRate;
    v30 = v13;
    v31 = v19 * pow(v29, v22);
    if (spinRate <= 0.0)
      v32 = -v31;
    else
      v32 = v31;
    v33 = v16 * cos(v30 * 2.0 + 1.57079633);
    v34 = v27 * (1.0 / pow(v29 + 1.0, 3.0));
    v35 = v33 - v32 + sin(v30) * v34;
    v36 = (1.0 - v41 * v7) * (spinRate + v35 * v7);
    self->_spinRate = v36;
    -[AAUIBadge setRotationY:](self->_badge, "setRotationY:", (double)(v30 + v36 * v7));
    v37 = self->_spinRate;
    if (v37 < 0.0)
      v37 = -v37;
    if (v37 < 0.01)
    {
      v38 = -v35;
      if (v35 >= 0.0)
        v38 = v35;
      if (v38 < 0.02)
        -[AAUIBadgeView setPaused:](self, "setPaused:", 1);
    }
  }
  else
  {
    self->_spinRate = (v11 - v9) / v7;
  }
  self->_lastUpdateTime = CACurrentMediaTime();
  v39 = self->_badge;

  return v39;
}

- (BOOL)magnetsEngaged
{
  return self->_magnetsEngaged;
}

- (double)timeSinceLastUpdate
{
  double v2;

  v2 = 0.0;
  if (!-[AAUIBadgeView isPaused](self, "isPaused", self->_lastUpdateTime))
    return CACurrentMediaTime() - self->_lastUpdateTime;
  return v2;
}

- (void)resizeBadgeForCurrentViewSize
{
  id v2;

  -[AAUIBadgeView drawable](self, "drawable");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resizeBadgeForCurrentViewSize");

}

- (BOOL)isPaused
{
  void *v2;
  char v3;

  -[AAUIBadgeView drawable](self, "drawable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPaused");

  return v3;
}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  void *v6;

  v3 = a3;
  v5 = -[AAUIBadgeView isPaused](self, "isPaused");
  -[AAUIBadgeView drawable](self, "drawable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPaused:", v3);

  if (v5 && !v3)
  {
    -[AAUIBadgeView _invalidateLastUpdateTime](self, "_invalidateLastUpdateTime");
    -[AAUIBadgeView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (float)_normalizeAngle:(float)a3
{
  float result;
  double v4;
  float v5;

  result = fmodf(a3, 6.2832);
  v4 = result;
  if (result <= 3.14159265)
  {
    if (v4 < -3.14159265)
      return v4 + 6.28318531;
  }
  else
  {
    v5 = 6.28318531 - v4;
    return -v5;
  }
  return result;
}

+ (double)badgeAspectRatio
{
  return 0.938967136;
}

- (id)initUsingEarnedShader:(BOOL)a3 delegate:(id)a4
{

  return 0;
}

- (id)drawable:(id)a3 valueForTweakableUniform:(id)a4
{
  return -[AAUIBadgeView _valueForTweak:](self, "_valueForTweak:", a4);
}

- (id)tweakableUniformsForDrawable:(id)a3
{
  return self->_tweakableUniforms;
}

- (void)setBadgeBacksideAttributedString:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToAttributedString:", self->_backsideAttributedString) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_backsideAttributedString, a3);
    -[AAUIBadgeView _setBackTextureNeedsRegeneration](self, "_setBackTextureNeedsRegeneration");
  }

}

- (void)setBadgeBacksideIcon:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_backAppleLogo != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_backAppleLogo, a3);
    -[AAUIBadgeView _setBackTextureNeedsRegeneration](self, "_setBackTextureNeedsRegeneration");
    v5 = v6;
  }

}

- (void)_setBackTextureNeedsRegeneration
{
  -[AAUIBadgeView setBackTextureImage:](self, "setBackTextureImage:", 0);
  -[AAUIBadgeView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)_generateBackTextureImage
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CGContext *CurrentContext;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void (**shortenedBadgeBacksideStringProvider)(void);
  void *v31;
  void *v32;
  void *v33;
  double v34;
  int v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  double v40;
  double v41;
  UIImage *backAppleLogo;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGFloat v48;
  CGFloat v49;
  double v50;
  double v51;
  double MaxY;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  UIImage *v59;
  UIImage *v60;
  UIImage *backTextureImage;
  UIImage *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  char v70;
  CGSize v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;

  -[AAUIBadgeView configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "badgeShape");

  *(double *)&v5 = 240.6;
  v6 = 120.3;
  *(double *)&v7 = 207.8;
  v8 = 86.95;
  v9 = 256.0;
  v10 = 128.0;
  *(double *)&v11 = 1.16;
  *(double *)&v12 = 268.8;
  v13 = 134.4;
  v14 = 256.0;
  *(double *)&v15 = 268.8;
  *(double *)&v16 = 207.8;
  *(double *)&v17 = 240.6;
  switch(v4)
  {
    case 0:
    case 5:
      *(double *)&v11 = 1.20754717;
      v14 = 212.0;
      goto LABEL_4;
    case 1:
LABEL_8:
      v66 = *(double *)&v11;
      v9 = *(double *)&v12;
      v14 = *(double *)&v15;
      v10 = v13;
      goto LABEL_14;
    case 2:
    case 4:
      *(double *)&v11 = 1.16;
      v14 = 278.0;
LABEL_4:
      v9 = v14;
      goto LABEL_6;
    case 3:
LABEL_9:
      v66 = *(double *)&v11;
      goto LABEL_14;
    case 6:
LABEL_10:
      v66 = *(double *)&v11;
      v9 = *(double *)&v7;
      v14 = *(double *)&v16;
      v10 = v8;
      goto LABEL_14;
    case 7:
LABEL_11:
      v66 = *(double *)&v11;
      v9 = *(double *)&v5;
      v14 = *(double *)&v17;
      v10 = v6;
      goto LABEL_14;
    default:
      v9 = *MEMORY[0x24BDBF148];
      v14 = *(double *)(MEMORY[0x24BDBF148] + 8);
      *(double *)&v11 = 0.0;
LABEL_6:
      v10 = v14 * 0.5;
      v13 = v14 * 0.5;
      *(double *)&v12 = v9;
      *(double *)&v15 = v14;
      v8 = v14 * 0.5;
      *(double *)&v7 = v9;
      *(double *)&v16 = v14;
      v6 = v14 * 0.5;
      *(double *)&v5 = v9;
      *(double *)&v17 = v14;
      switch(v4)
      {
        case 0:
        case 5:
          v66 = *(double *)&v11;
          break;
        case 1:
          goto LABEL_8;
        case 2:
          v66 = *(double *)&v11;
          v10 = v10 + -26.0;
          break;
        case 3:
          goto LABEL_9;
        case 4:
          v66 = *(double *)&v11;
          break;
        case 6:
          goto LABEL_10;
        case 7:
          goto LABEL_11;
        default:
          v66 = *(double *)&v11;
          break;
      }
LABEL_14:
      v71.width = v9;
      v71.height = v14;
      UIGraphicsBeginImageContextWithOptions(v71, 0, 0.0);
      CurrentContext = UIGraphicsGetCurrentContext();
      v72.origin.x = 0.0;
      v72.origin.y = 0.0;
      v72.size.width = v9;
      v72.size.height = v14;
      CGContextClearRect(CurrentContext, v72);
      v19 = (void *)-[NSAttributedString mutableCopy](self->_backsideAttributedString, "mutableCopy");
      if (!v19)
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", &stru_24E0B4958);
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "scale");
      v22 = 2.0 / v21;

      v23 = v9 + v22 * -2.0;
      if (objc_msgSend(v19, "length"))
      {
        objc_msgSend(v19, "attributesAtIndex:effectiveRange:", 0, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v24 = (void *)MEMORY[0x24BDBD1B8];
      }
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", CFSTR("X\nX\nX"), v24);
      objc_msgSend(v25, "size");
      if (v26 >= v10)
        v27 = v10;
      else
        v27 = v26;
      v70 = 0;
      objc_msgSend(v19, "scaleFontAndKerningToFitSize:minimumFontSize:minimumKerning:stillDidntFit:", &v70, v23, v27, 10.0, 0.7);
      v29 = v28;
      v69 = v23;
      if (v70)
      {
        shortenedBadgeBacksideStringProvider = (void (**)(void))self->_shortenedBadgeBacksideStringProvider;
        if (shortenedBadgeBacksideStringProvider)
        {
          shortenedBadgeBacksideStringProvider[2]();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v31;
          if (v31)
          {
            v33 = (void *)objc_msgSend(v31, "mutableCopy");

            objc_msgSend(v33, "scaleFontAndKerningToFitSize:minimumFontSize:minimumKerning:stillDidntFit:", 0, v23, v27, 10.0, 0.7);
            v29 = v34;
            v19 = v33;
          }

        }
      }
      switch(v4)
      {
        case 0:
        case 3:
        case 4:
        case 5:
          v35 = 0;
          v36 = 26.0;
          goto LABEL_34;
        case 1:
          v35 = 0;
          v36 = 21.0;
          goto LABEL_34;
        case 2:
          v35 = 0;
          v36 = 154.0;
          v37 = 154.0;
          goto LABEL_35;
        case 6:
          v35 = 1;
          v36 = 32.0;
          goto LABEL_34;
        case 7:
          v35 = 0;
          v36 = 20.0;
          goto LABEL_34;
        default:
          v35 = 0;
          v36 = 0.0;
LABEL_34:
          v37 = 0.0;
LABEL_35:
          v38 = v22;
          v39 = objc_msgSend(v19, "length");
          if (v39)
            v40 = v29;
          else
            v40 = 0.0;
          if (v39)
            v41 = v36;
          else
            v41 = v37;
          backAppleLogo = self->_backAppleLogo;
          v68 = v41;
          if (backAppleLogo)
          {
            -[UIImage size](backAppleLogo, "size");
            v44 = v66 * v43;
            v46 = v66 * v45;
          }
          else
          {
            v44 = *(double *)(MEMORY[0x24BDBF090] + 16);
            v46 = *(double *)(MEMORY[0x24BDBF090] + 24);
          }
          UIRoundToViewScale();
          v64 = v47;
          v65 = v46;
          if (v35)
            v48 = v47;
          else
            v48 = v38;
          v67 = v44;
          if (v35)
          {
            v49 = v46;
          }
          else
          {
            v44 = v69;
            v49 = v40;
          }
          UIRoundToViewScale();
          v51 = v50;
          v73.origin.x = v48;
          v73.origin.y = v51;
          v73.size.width = v44;
          v73.size.height = v49;
          MaxY = CGRectGetMaxY(v73);
          v53 = v38 - v51;
          v54 = -0.0;
          if (v51 >= v38)
            v53 = 0.0;
          else
            v54 = v38 - v51;
          v55 = v51 + v54;
          v56 = v68 + MaxY - v53;
          if (v35)
            v57 = v56;
          else
            v57 = v55;
          if (v35)
            v58 = v55;
          else
            v58 = v56;
          v74.origin.x = v38;
          v74.origin.y = v57;
          v74.size.width = v69;
          v74.size.height = v40;
          if (!CGRectIsEmpty(v74))
            objc_msgSend(v19, "drawInRect:", v38, v57, v69, v40);
          v59 = self->_backAppleLogo;
          if (v59)
            -[UIImage drawInRect:blendMode:alpha:](v59, "drawInRect:blendMode:alpha:", 0, v64, v58, v67, v65, 0.75);
          UIGraphicsGetImageFromCurrentImageContext();
          v60 = (UIImage *)objc_claimAutoreleasedReturnValue();
          backTextureImage = self->_backTextureImage;
          self->_backTextureImage = v60;

          UIGraphicsEndImageContext();
          v62 = self->_backTextureImage;
          -[AAUIBadgeView drawable](self, "drawable");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "setBackTextureImage:", v62);

          return;
      }
  }
}

- (AAUIBadgeModelConfiguration)configuration
{
  void *v2;
  void *v3;

  -[AAUIBadgeView drawable](self, "drawable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AAUIBadgeModelConfiguration *)v3;
}

- (void)setFixedBadgeAngle:(double)a3
{
  -[AAUIBadgeView setPaused:](self, "setPaused:", 0);
  -[AAUIBadgeView setMagnetsEngaged:](self, "setMagnetsEngaged:", 1);
  self->_spinRate = 0.0;
  -[AAUIBadge removeAllAnimationsForBadgePropertyType:](self->_badge, "removeAllAnimationsForBadgePropertyType:", 2);
  -[AAUIBadge setRotationY:](self->_badge, "setRotationY:", a3);
  -[AAUIBadgeView setNeedsDisplay](self, "setNeedsDisplay");
}

- (double)playFlipInAnimation
{
  void *v3;
  void *v4;
  float v5;
  void *v6;
  float v7;
  void *v8;
  float v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  id v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id location;

  -[AAUIBadgeView setMagnetsEngaged:](self, "setMagnetsEngaged:", 0);
  -[AAUIBadge removeAllAnimationsForBadgePropertyType:](self->_badge, "removeAllAnimationsForBadgePropertyType:", 2);
  -[AAUIBadge setRotationY:](self->_badge, "setRotationY:", 0.0);
  objc_msgSend(MEMORY[0x24BDE5760], "animation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIBadgeView _valueForTweak:](self, "_valueForTweak:", CFSTR("springMass"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  objc_msgSend(v3, "setMass:", v5);

  -[AAUIBadgeView _valueForTweak:](self, "_valueForTweak:", CFSTR("springStiffness"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  objc_msgSend(v3, "setStiffness:", v7);

  -[AAUIBadgeView _valueForTweak:](self, "_valueForTweak:", CFSTR("springDamping"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  objc_msgSend(v3, "setDamping:", v9);

  objc_msgSend(v3, "durationForEpsilon:", 0.001);
  objc_msgSend(v3, "setDuration:");
  -[AAUIBadge rotationY](self->_badge, "rotationY");
  v11 = v10;
  -[AAUIBadge rotationY](self->_badge, "rotationY");
  v13 = v12;
  objc_initWeak(&location, self);
  v14 = (void *)MEMORY[0x24BE01CA0];
  objc_msgSend(v3, "duration");
  v16 = v15;
  *(float *)&v11 = v11 - fmod(v13 + 2.22044605e-16, 6.28318531) + 6.28318531;
  v17 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __36__AAUIBadgeView_playFlipInAnimation__block_invoke;
  v26[3] = &unk_24E0B3030;
  v18 = v3;
  v27 = v18;
  v24[0] = v17;
  v24[1] = 3221225472;
  v24[2] = __36__AAUIBadgeView_playFlipInAnimation__block_invoke_2;
  v24[3] = &unk_24E0B2DB8;
  objc_copyWeak(&v25, &location);
  LODWORD(v19) = LODWORD(v11);
  objc_msgSend(v14, "animationWithEndingFloatValue:duration:customTimingFunction:completion:", v26, v24, v19, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIBadge addAnimation:forBadgePropertyType:](self->_badge, "addAnimation:forBadgePropertyType:", v20, 2);
  objc_msgSend(v18, "duration");
  v22 = v21;

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return v22;
}

uint64_t __36__AAUIBadgeView_playFlipInAnimation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_timeFunction:");
}

void __36__AAUIBadgeView_playFlipInAnimation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setMagnetsEngaged:", 1);

}

- (double)playFlipOutAnimation
{
  double spinRate;
  long double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  float v10;
  void *v11;
  float v12;
  void *v13;
  float v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  float v19;
  uint64_t v20;
  id v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id location;

  spinRate = self->_spinRate;
  -[AAUIBadgeView setPaused:](self, "setPaused:", 0);
  -[AAUIBadgeView setMagnetsEngaged:](self, "setMagnetsEngaged:", 0);
  -[AAUIBadge removeAllAnimationsForBadgePropertyType:](self->_badge, "removeAllAnimationsForBadgePropertyType:", 2);
  -[AAUIBadge rotationY](self->_badge, "rotationY");
  if (fabs(spinRate) > 1.35 && self->_useEarnedShader)
  {
    if (spinRate <= 0.0)
      v5 = v4 + -6.28318531 + fmod(-v4, 6.28318531);
    else
      v5 = v4 + 6.28318531 - fmod(v4, 6.28318531);
    v7 = 0.7;
  }
  else
  {
    v6 = round(v4 / 6.28318531);
    v5 = (v6 + v6) * 3.14159265;
    v7 = 0.14;
  }
  objc_msgSend(MEMORY[0x24BDE5760], "animation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIBadgeView _valueForTweak:](self, "_valueForTweak:", CFSTR("springMass"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  objc_msgSend(v8, "setMass:", v7 * v10);

  -[AAUIBadgeView _valueForTweak:](self, "_valueForTweak:", CFSTR("springStiffness"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  objc_msgSend(v8, "setStiffness:", v12);

  -[AAUIBadgeView _valueForTweak:](self, "_valueForTweak:", CFSTR("springDamping"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  objc_msgSend(v8, "setDamping:", v14 * 1.14);

  v15 = -spinRate;
  if (spinRate >= 0.0)
    v15 = spinRate;
  objc_msgSend(v8, "setInitialVelocity:", v15 / 3.14159265);
  objc_msgSend(v8, "durationForEpsilon:", 0.035);
  objc_msgSend(v8, "setDuration:");
  objc_initWeak(&location, self);
  v16 = (void *)MEMORY[0x24BE01CA0];
  objc_msgSend(v8, "duration");
  v18 = v17;
  v20 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __37__AAUIBadgeView_playFlipOutAnimation__block_invoke;
  v29[3] = &unk_24E0B3030;
  v21 = v8;
  v30 = v21;
  v27[0] = v20;
  v27[1] = 3221225472;
  v27[2] = __37__AAUIBadgeView_playFlipOutAnimation__block_invoke_2;
  v27[3] = &unk_24E0B2DB8;
  objc_copyWeak(&v28, &location);
  v19 = v5;
  *(float *)&v22 = v19;
  objc_msgSend(v16, "animationWithEndingFloatValue:duration:customTimingFunction:completion:", v29, v27, v22, v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIBadge addAnimation:forBadgePropertyType:](self->_badge, "addAnimation:forBadgePropertyType:", v23, 2);
  objc_msgSend(v21, "duration");
  v25 = v24;

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

  return v25;
}

uint64_t __37__AAUIBadgeView_playFlipOutAnimation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_timeFunction:");
}

void __37__AAUIBadgeView_playFlipOutAnimation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setMagnetsEngaged:", 1);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UIPanGestureRecognizer *v4;
  BOOL v5;
  double v6;
  double v7;

  v4 = (UIPanGestureRecognizer *)a3;
  if (-[AAUIBadgeView verticalPanningDisabled](self, "verticalPanningDisabled") && self->_spinRecognizer == v4)
  {
    -[UIPanGestureRecognizer velocityInView:](v4, "velocityInView:", self);
    v5 = fabs(v6) > fabs(v7);
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (double)_attenuatedSpinRate:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  -[AAUIBadge maxRotationY](self->_badge, "maxRotationY");
  if (v5 > 0.0)
  {
    -[AAUIBadge rotationY](self->_badge, "rotationY");
    if (v6 >= 0.0)
      v7 = v6;
    else
      v7 = -v6;
    -[AAUIBadge maxRotationY](self->_badge, "maxRotationY");
    if (v8 < 0.0)
      v8 = -v8;
    v9 = v7 - v8;
    if (v9 >= 0.0)
      v10 = v9;
    else
      v10 = -v9;
    -[AAUIBadge maxRotationY](self->_badge, "maxRotationY");
    if (v11 < 0.0)
      v11 = -v11;
    return v10 / v11 * a3;
  }
  return a3;
}

- (double)_attenuatedVelocity:(double)a3
{
  double v4;
  double v5;

  -[AAUIBadge maxRotationY](self->_badge, "maxRotationY");
  v5 = -1.0;
  if (a3 >= -1.0)
    v5 = a3;
  if (a3 > 1.0)
    v5 = 1.0;
  if (v4 <= 0.0)
    return a3;
  else
    return v5;
}

- (void)_panned:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  id v19;

  v19 = a3;
  objc_msgSend(v19, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  -[AAUIBadgeView _attenuatedSpinRate:](self, "_attenuatedSpinRate:", 3.30693964);
  v8 = v7;
  v9 = objc_msgSend(v19, "state");
  switch(v9)
  {
    case 3:
      -[AAUIBadgeView setMagnetsEngaged:](self, "setMagnetsEngaged:", 1);
      objc_msgSend(v19, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "velocityInView:", v10);
      -[AAUIBadgeView _attenuatedVelocity:](self, "_attenuatedVelocity:", v11 / v6);
      v13 = v12;

      v14 = -(v8 * v13);
      if (v8 * v13 >= 0.0)
        v14 = v8 * v13;
      if (v14 >= 2.22044605e-16)
        v8 = v8 * v13;
      else
        v8 = 2.22044605e-16;
      break;
    case 2:
      -[AAUIBadge rotationY](self->_badge, "rotationY");
      v16 = v15;
      objc_msgSend(v19, "translationInView:", v4);
      -[AAUIBadge setRotationY:](self->_badge, "setRotationY:", v16 + v8 * v17 / v6);
      objc_msgSend(v19, "setTranslation:inView:", v4, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
      break;
    case 1:
      -[AAUIBadgeView setMagnetsEngaged:](self, "setMagnetsEngaged:", 0);
      -[AAUIBadge removeAllAnimationsForBadgePropertyType:](self->_badge, "removeAllAnimationsForBadgePropertyType:", 2);
      v8 = 0.0;
      break;
  }
  self->_spinRate = v8;
  -[AAUIBadgeView setPaused:](self, "setPaused:", 0);
  -[AAUIBadgeView badgeDelegate](self, "badgeDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "badgeViewDidSpin:", self);

}

- (void)_longPressInternalOnly:(id)a3
{
  if (objc_msgSend(a3, "state") == 1)
    -[AAUIBadgeView _spin360Degrees](self, "_spin360Degrees");
}

- (void)_spin360Degrees
{
  double v3;
  double v4;
  double v5;
  long double v6;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  -[AAUIBadgeView setPaused:](self, "setPaused:", 0);
  -[AAUIBadgeView setMagnetsEngaged:](self, "setMagnetsEngaged:", 0);
  -[AAUIBadge removeAllAnimationsForBadgePropertyType:](self->_badge, "removeAllAnimationsForBadgePropertyType:", 2);
  -[AAUIBadge setRotationY:](self->_badge, "setRotationY:", 0.0);
  -[AAUIBadge rotationY](self->_badge, "rotationY");
  v4 = v3;
  -[AAUIBadge rotationY](self->_badge, "rotationY");
  v6 = v4 - fmod(v5 + 2.22044605e-16, 6.28318531) + 31.4159265;
  objc_initWeak(&location, self);
  v7 = (void *)MEMORY[0x24BE01CA0];
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __32__AAUIBadgeView__spin360Degrees__block_invoke_2;
  v13 = &unk_24E0B2DB8;
  objc_copyWeak(&v14, &location);
  *(float *)&v6 = v6;
  LODWORD(v8) = LODWORD(v6);
  objc_msgSend(v7, "animationWithEndingFloatValue:duration:customTimingFunction:completion:", &__block_literal_global_4, &v10, v8, 10.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIBadge addAnimation:forBadgePropertyType:](self->_badge, "addAnimation:forBadgePropertyType:", v9, 2, v10, v11, v12, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __32__AAUIBadgeView__spin360Degrees__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setMagnetsEngaged:", 1);

}

- (void)_tapped:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend(a3, "locationInView:", self);
  v5 = v4;
  -[AAUIBadgeView frame](self, "frame");
  v7 = v5 + v6 * -0.5;
  -[AAUIBadgeView frame](self, "frame");
  -[AAUIBadgeView _applyImpulse:](self, "_applyImpulse:", (double)(sin(v7 / v8 + v7 / v8) * 12.0));
}

- (void)_applyImpulse:(double)a3
{
  -[AAUIBadgeView setPaused:](self, "setPaused:", 0);
  -[AAUIBadgeView setMagnetsEngaged:](self, "setMagnetsEngaged:", 1);
  self->_spinRate = self->_spinRate + a3;
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return a3 == 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (UIImage)backTextureImage
{
  return self->_backTextureImage;
}

- (void)setBackTextureImage:(id)a3
{
  objc_storeStrong((id *)&self->_backTextureImage, a3);
}

- (id)shortenedBadgeBacksideStringProvider
{
  return self->_shortenedBadgeBacksideStringProvider;
}

- (void)setShortenedBadgeBacksideStringProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (BOOL)verticalPanningDisabled
{
  return self->_verticalPanningDisabled;
}

- (void)setVerticalPanningDisabled:(BOOL)a3
{
  self->_verticalPanningDisabled = a3;
}

- (AAUIBadgeViewDelegate)badgeDelegate
{
  return (AAUIBadgeViewDelegate *)objc_loadWeakRetained((id *)&self->_badgeDelegate);
}

- (void)setBadgeDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_badgeDelegate, a3);
}

- (void)setDrawable:(id)a3
{
  objc_storeStrong((id *)&self->_drawable, a3);
}

- (NSNumber)useMetal
{
  return self->_useMetal;
}

- (void)setUseMetal:(id)a3
{
  objc_storeStrong((id *)&self->_useMetal, a3);
}

- (void)setOverrideEarnedShader:(id)a3
{
  objc_storeStrong((id *)&self->_overrideEarnedShader, a3);
}

- (void)setMagnetsEngaged:(BOOL)a3
{
  self->_magnetsEngaged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideEarnedShader, 0);
  objc_storeStrong((id *)&self->_useMetal, 0);
  objc_storeStrong((id *)&self->_drawable, 0);
  objc_destroyWeak((id *)&self->_badgeDelegate);
  objc_storeStrong(&self->_shortenedBadgeBacksideStringProvider, 0);
  objc_storeStrong((id *)&self->_backTextureImage, 0);
  objc_storeStrong((id *)&self->_tweakableUniforms, 0);
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_spinRecognizer, 0);
  objc_storeStrong((id *)&self->_backsideAttributedString, 0);
  objc_storeStrong((id *)&self->_backAppleLogo, 0);
  objc_storeStrong((id *)&self->_badge, 0);
}

@end
