@implementation AFUISceneConfiguration

- (AFUISceneConfiguration)init
{
  void *v3;
  void *v4;
  AFUISceneConfiguration *v5;

  v3 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BE38058], "mainConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultSiriSceneConfigurationWithInitialBounds:onDisplay:", v4, *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24));
  v5 = (AFUISceneConfiguration *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_initWithInitialBounds:(CGRect)a3 displayConfiguration:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  AFUISceneConfiguration *v11;
  AFUISceneConfiguration *v12;
  uint64_t v13;
  FBSDisplayConfiguration *displayConfiguration;
  __int128 v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v28;
  objc_super v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;
  CGRect v35;
  CGRect v36;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v34 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFUISceneConfiguration.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayConfiguration"));

  }
  v29.receiver = self;
  v29.super_class = (Class)AFUISceneConfiguration;
  v11 = -[AFUISceneConfiguration init](&v29, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_cancelSceneLoadingAfterTimeout = 1;
    v11->_sceneLoadingTimeOutDuration = 60.0;
    v11->_initialBounds.origin.x = x;
    v11->_initialBounds.origin.y = y;
    v11->_initialBounds.size.width = width;
    v11->_initialBounds.size.height = height;
    v13 = objc_msgSend(v10, "copy");
    displayConfiguration = v12->_displayConfiguration;
    v12->_displayConfiguration = (FBSDisplayConfiguration *)v13;

    v12->_foreground = 1;
    *(_OWORD *)&v12->_launchIntent = xmmword_2175631D0;
    v15 = *(_OWORD *)(MEMORY[0x24BEBE158] + 16);
    *(_OWORD *)&v12->_initialSafeAreaInsets.top = *MEMORY[0x24BEBE158];
    *(_OWORD *)&v12->_initialSafeAreaInsets.bottom = v15;
    *(_OWORD *)&v12->_userInterfaceStyle = xmmword_2175631E0;
    v16 = x;
    *(CGFloat *)&v15 = y;
    v17 = width;
    v18 = height;
    if (CGRectEqualToRect(*(CGRect *)((char *)&v15 - 8), *MEMORY[0x24BDBF070]))
    {
      -[FBSDisplayConfiguration bounds](v12->_displayConfiguration, "bounds");
      x = v19;
      y = v20;
      width = v21;
      height = v22;
      v23 = (void *)*MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      {
        v24 = v23;
        v35.origin.x = x;
        v35.origin.y = y;
        v35.size.width = width;
        v35.size.height = height;
        NSStringFromCGRect(v35);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v31 = "-[AFUISceneConfiguration _initWithInitialBounds:displayConfiguration:]";
        v32 = 2112;
        v33 = v25;
        _os_log_error_impl(&dword_217514000, v24, OS_LOG_TYPE_ERROR, "%s #sceneHosting Initializing AFUISceneConfiguration with null bounds, falling back to displayConfiguration's bounds: %@", buf, 0x16u);
LABEL_9:

      }
    }
    else
    {
      v26 = (void *)*MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v24 = v26;
        v36.origin.x = x;
        v36.origin.y = y;
        v36.size.width = width;
        v36.size.height = height;
        NSStringFromCGRect(v36);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v31 = "-[AFUISceneConfiguration _initWithInitialBounds:displayConfiguration:]";
        v32 = 2112;
        v33 = v25;
        _os_log_impl(&dword_217514000, v24, OS_LOG_TYPE_DEFAULT, "%s #sceneHosting Initializing AFUISceneConfiguration using bounds: %@", buf, 0x16u);
        goto LABEL_9;
      }
    }
    v12->_bounds.origin.x = x;
    v12->_bounds.origin.y = y;
    v12->_bounds.size.width = width;
    v12->_bounds.size.height = height;
    -[AFUISceneConfiguration _setupPlatformSpecificDefaultSettings](v12, "_setupPlatformSpecificDefaultSettings");
  }

  return v12;
}

- (FBSSceneParameters)sceneParameters
{
  int v3;
  __objc2_class **v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v3 = -[FBSDisplayConfiguration isCarDisplay](self->_displayConfiguration, "isCarDisplay");
  v4 = off_24D7A0A80;
  if (!v3)
    v4 = off_24D7A0A20;
  -[__objc2_class specification](*v4, "specification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE38468]), "initWithSpecification:", v5);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__AFUISceneConfiguration_sceneParameters__block_invoke;
  v8[3] = &unk_24D7A1860;
  v8[4] = self;
  objc_msgSend(v6, "updateSettingsWithBlock:", v8);

  return (FBSSceneParameters *)v6;
}

uint64_t __41__AFUISceneConfiguration_sceneParameters__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "configureMutableSceneSettings:", a2);
}

- (void)configureMutableSceneSettings:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  double x;
  double y;
  double width;
  double height;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  v4 = (void *)MEMORY[0x24BEBDB58];
  v17 = a3;
  objc_msgSend(v4, "_applicationKeyWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "interfaceOrientation");

  if (-[FBSDisplayConfiguration isCarDisplay](self->_displayConfiguration, "isCarDisplay")
    || (objc_msgSend(MEMORY[0x24BEBD538], "currentDevice"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "userInterfaceIdiom"),
        v7,
        v8 == 2))
  {
    x = self->_bounds.origin.x;
    y = self->_bounds.origin.y;
    width = self->_bounds.size.width;
    height = self->_bounds.size.height;
  }
  else
  {
    -[FBSDisplayConfiguration bounds](self->_displayConfiguration, "bounds");
    x = v13;
    y = v14;
    width = v15;
    height = v16;
  }
  objc_msgSend(v17, "setForeground:", self->_foreground);
  objc_msgSend(v17, "setDisplayConfiguration:", self->_displayConfiguration);
  objc_msgSend(v17, "setLevel:", 0.0);
  objc_msgSend(v17, "setDeviceOrientationEventsEnabled:", 0);
  objc_msgSend(v17, "setFrame:", x, y, width, height);
  objc_msgSend(v17, "setInterfaceOrientation:", v6);
  objc_msgSend(v17, "setUserInterfaceStyle:", self->_userInterfaceStyle);
  objc_msgSend(v17, "setSafeAreaInsetsPortrait:", self->_initialSafeAreaInsets.top, self->_initialSafeAreaInsets.left, self->_initialSafeAreaInsets.bottom, self->_initialSafeAreaInsets.right);
  objc_msgSend(v17, "setDeactivationReasons:", self->_deactivationReasonMask);

}

+ (id)stringForInvalidationReason:(unint64_t)a3
{
  NSObject *v5;

  if (a3 < 6)
    return off_24D7A2C38[a3];
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    +[AFUISceneConfiguration stringForInvalidationReason:].cold.1(a3, v5);
  return 0;
}

- (void)_setupPlatformSpecificDefaultSettings
{
  void *v3;
  unint64_t v4;
  int64_t v5;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 2)
  {
    *(_WORD *)&self->_foreground = 0;
    self->_launchIntent = 3;
    v5 = 1;
  }
  else
  {
    if (v4 > 1)
      return;
    v5 = 2;
  }
  self->_preferredDeferralMode = v5;
}

+ (id)defaultSiriSceneConfigurationWithInitialBounds:(CGRect)a3 onDisplay:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  void *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  v9 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithInitialBounds:displayConfiguration:", v8, x, y, width, height);

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithInitialBounds:displayConfiguration:", self->_displayConfiguration, self->_initialBounds.origin.x, self->_initialBounds.origin.y, self->_initialBounds.size.width, self->_initialBounds.size.height);
  objc_msgSend(v4, "setForeground:", self->_foreground);
  objc_msgSend(v4, "setLaunchIntent:", self->_launchIntent);
  objc_msgSend(v4, "setPreferredDeferralMode:", self->_preferredDeferralMode);
  objc_msgSend(v4, "setSceneLoadingTimeOutDuration:", self->_sceneLoadingTimeOutDuration);
  objc_msgSend(v4, "setCancelSceneLoadingAfterTimeout:", self->_cancelSceneLoadingAfterTimeout);
  objc_msgSend(v4, "setUserInterfaceStyle:", self->_userInterfaceStyle);
  v5 = (void *)-[FBSSceneParameters copy](self->_sceneParameters, "copy");
  objc_msgSend(v4, "setSceneParameters:", v5);

  objc_msgSend(v4, "setInitialSafeAreaInsets:", self->_initialSafeAreaInsets.top, self->_initialSafeAreaInsets.left, self->_initialSafeAreaInsets.bottom, self->_initialSafeAreaInsets.right);
  objc_msgSend(v4, "setDeactivationReasonMask:", self->_deactivationReasonMask);
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AFUISceneConfiguration;
  -[AFUISceneConfiguration description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromBOOL();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGRect(self->_bounds);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromUIEdgeInsets(self->_initialSafeAreaInsets);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UIApplicationSceneDeactivationReasonMaskDescriptionComponents();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(", foreground: %@, bounds: %@, safeAreaInsets: %@, deactivationReasonMask: %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)foreground
{
  return self->_foreground;
}

- (void)setForeground:(BOOL)a3
{
  self->_foreground = a3;
}

- (int64_t)launchIntent
{
  return self->_launchIntent;
}

- (void)setLaunchIntent:(int64_t)a3
{
  self->_launchIntent = a3;
}

- (int64_t)preferredDeferralMode
{
  return self->_preferredDeferralMode;
}

- (void)setPreferredDeferralMode:(int64_t)a3
{
  self->_preferredDeferralMode = a3;
}

- (BOOL)cancelSceneLoadingAfterTimeout
{
  return self->_cancelSceneLoadingAfterTimeout;
}

- (void)setCancelSceneLoadingAfterTimeout:(BOOL)a3
{
  self->_cancelSceneLoadingAfterTimeout = a3;
}

- (double)sceneLoadingTimeOutDuration
{
  return self->_sceneLoadingTimeOutDuration;
}

- (void)setSceneLoadingTimeOutDuration:(double)a3
{
  self->_sceneLoadingTimeOutDuration = a3;
}

- (CGRect)initialBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_initialBounds.origin.x;
  y = self->_initialBounds.origin.y;
  width = self->_initialBounds.size.width;
  height = self->_initialBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UIEdgeInsets)initialSafeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_initialSafeAreaInsets.top;
  left = self->_initialSafeAreaInsets.left;
  bottom = self->_initialSafeAreaInsets.bottom;
  right = self->_initialSafeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setInitialSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_initialSafeAreaInsets = a3;
}

- (void)setSceneParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (unint64_t)deactivationReasonMask
{
  return self->_deactivationReasonMask;
}

- (void)setDeactivationReasonMask:(unint64_t)a3
{
  self->_deactivationReasonMask = a3;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneParameters, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
}

+ (void)stringForInvalidationReason:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "+[AFUISceneConfiguration stringForInvalidationReason:]";
  v4 = 2048;
  v5 = a1;
  _os_log_error_impl(&dword_217514000, a2, OS_LOG_TYPE_ERROR, "%s unknown invalidation reason: %li", (uint8_t *)&v2, 0x16u);
}

@end
