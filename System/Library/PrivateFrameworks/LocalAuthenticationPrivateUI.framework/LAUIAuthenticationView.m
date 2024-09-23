@implementation LAUIAuthenticationView

- (LAUIAuthenticationView)initWithFrame:(CGRect)a3
{
  return -[LAUIAuthenticationView initWithFrame:mechanisms:](self, "initWithFrame:mechanisms:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (LAUIAuthenticationView)initWithCoder:(id)a3
{
  LAUIAuthenticationView *v3;
  LAUIAuthenticationView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LAUIAuthenticationView;
  v3 = -[LAUIAuthenticationView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[LAUIAuthenticationView _setupMechanisms:context:](v3, "_setupMechanisms:context:", 0, 0);
  return v4;
}

- (LAUIAuthenticationView)initWithMechanisms:(unint64_t)a3
{
  return -[LAUIAuthenticationView initWithMechanisms:context:](self, "initWithMechanisms:context:", a3, 0);
}

- (LAUIAuthenticationView)initWithMechanisms:(unint64_t)a3 context:(id)a4
{
  id v6;
  LAUIAuthenticationView *v7;

  v6 = a4;
  +[LAUIAuthenticationView defaultRect](LAUIAuthenticationView, "defaultRect");
  v7 = -[LAUIAuthenticationView initWithFrame:mechanisms:context:](self, "initWithFrame:mechanisms:context:", a3, v6);

  return v7;
}

- (LAUIAuthenticationView)initWithFrame:(CGRect)a3 mechanisms:(unint64_t)a4
{
  return -[LAUIAuthenticationView initWithFrame:mechanisms:context:](self, "initWithFrame:mechanisms:context:", a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (LAUIAuthenticationView)initWithFrame:(CGRect)a3 mechanisms:(unint64_t)a4 context:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  LAUIAuthenticationView *v12;
  LAUIAuthenticationView *v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)LAUIAuthenticationView;
  v12 = -[LAUIAuthenticationView initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  v13 = v12;
  if (v12)
    -[LAUIAuthenticationView _setupMechanisms:context:](v12, "_setupMechanisms:context:", a4, v11);

  return v13;
}

- (void)_setupMechanisms:(unint64_t)a3 context:(id)a4
{
  id v6;
  LAUIAuthenticationCore *v7;
  LAUIAuthenticationCore *authenticationCore;

  v6 = a4;
  v7 = -[LAUIAuthenticationCore initWithMechanisms:context:]([LAUIAuthenticationCore alloc], "initWithMechanisms:context:", a3, v6);

  authenticationCore = self->_authenticationCore;
  self->_authenticationCore = v7;

  -[LAUIAuthenticationCore setView:](self->_authenticationCore, "setView:", self);
  -[LAUIAuthenticationCore setDelegate:](self->_authenticationCore, "setDelegate:", self);
}

- (BOOL)isMechanismAvailable:(unint64_t)a3 error:(id *)a4
{
  void *v6;

  -[LAUIAuthenticationView authenticationCore](self, "authenticationCore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v6, "isMechanismAvailable:error:", a3, a4);

  return (char)a4;
}

- (BOOL)isMechanismEnabled:(unint64_t)a3
{
  void *v4;

  -[LAUIAuthenticationView authenticationCore](self, "authenticationCore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "isMechanismEnabled:", a3);

  return a3;
}

- (BOOL)isMechanismActive:(unint64_t)a3
{
  void *v4;

  -[LAUIAuthenticationView authenticationCore](self, "authenticationCore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "isMechanismActive:", a3);

  return a3;
}

- (BOOL)enableMechanism:(unint64_t)a3 error:(id *)a4
{
  void *v6;

  -[LAUIAuthenticationView authenticationCore](self, "authenticationCore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v6, "enableMechanism:error:", a3, a4);

  return (char)a4;
}

- (BOOL)disableMechanism:(unint64_t)a3 error:(id *)a4
{
  void *v6;

  -[LAUIAuthenticationView authenticationCore](self, "authenticationCore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v6, "disableMechanism:error:", a3, a4);

  return (char)a4;
}

+ (CGRect)defaultRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = 64.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 64.0;
  result.size.height = v5;
  result.size.width = v2;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)willMoveToSuperview:(id)a3
{
  if (a3)
    -[LAUIAuthenticationView _setupView](self, "_setupView");
}

- (void)didMoveToSuperview
{
  id v2;

  -[LAUIAuthenticationView authenticationCore](self, "authenticationCore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "checkView");

}

- (void)didMoveToWindow
{
  id v2;

  -[LAUIAuthenticationView authenticationCore](self, "authenticationCore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "checkView");

}

- (void)_setupView
{
  NSObject *v3;
  int64_t v4;
  LAUIPKGlyphWrapper *v5;
  LAUIPKGlyphWrapper *glyphWrapper;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  LAUIAuthenticationView *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  LA_LOG_LAUIAuthenticationView();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315394;
    v13 = "-[LAUIAuthenticationView _setupView]";
    v14 = 2112;
    v15 = self;
    _os_log_impl(&dword_209E00000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v12, 0x16u);
  }

  v4 = -[LAUIAuthenticationView style](self, "style");
  -[LAUIAuthenticationView frame](self, "frame");
  +[LAUIPKGlyphWrapper glyphWithStyle:frame:](LAUIPKGlyphWrapper, "glyphWithStyle:frame:", v4);
  v5 = (LAUIPKGlyphWrapper *)objc_claimAutoreleasedReturnValue();
  glyphWrapper = self->_glyphWrapper;
  self->_glyphWrapper = v5;

  -[LAUIPKGlyphWrapper setFastAnimations:](self->_glyphWrapper, "setFastAnimations:", -[LAUIAuthenticationView fastAnimations](self, "fastAnimations"));
  -[LAUIAuthenticationView glyphWrapper](self, "glyphWrapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[LAUIAuthenticationView addSubview:](self, "addSubview:", v8);
    -[LAUIAuthenticationView authenticationCore](self, "authenticationCore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "biometryType");

    if (v10 == 2)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel_tappedFaceID_);
      objc_msgSend(v8, "addGestureRecognizer:", v11);

    }
  }

}

- (void)tappedFaceID:(id)a3
{
  -[LAUIAuthenticationView enableMechanism:error:](self, "enableMechanism:error:", 4, 0);
}

- (void)biometryState:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  LA_LOG_LAUIAuthenticationView();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[LAUIAuthenticationView biometryState:completionHandler:].cold.1(a3, (uint64_t)self, v7);

  -[LAUIAuthenticationView authenticationCore](self, "authenticationCore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "biometryType");

  switch(a3)
  {
    case 0:
      if (self->_lastState)
        -[LAUIAuthenticationView _biometryIdle](self, "_biometryIdle");
      goto LABEL_6;
    case 1:
      v10 = 4 * (v9 == 2);
      break;
    case 2:
      if (v9 == 2)
        v10 = 5;
      else
        v10 = 1;
      break;
    case 3:
      v10 = 7;
      break;
    case 4:
      v10 = -[LAUIAuthenticationView _stateOfSuccess](self, "_stateOfSuccess");
      break;
    case 5:
      if (v9 == 2)
        v10 = 3;
      else
        v10 = 0;
      break;
    default:
LABEL_6:
      v10 = 0;
      break;
  }
  if (a3)
    v11 = 1;
  else
    v11 = v9 == 2;
  v12 = !v11;
  self->_lastState = a3;
  -[LAUIAuthenticationView glyphWrapper](self, "glyphWrapper");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __58__LAUIAuthenticationView_biometryState_completionHandler___block_invoke;
  v15[3] = &unk_24C27EAA0;
  v16 = v6;
  v14 = v6;
  objc_msgSend(v13, "setState:idleTouchID:animated:completionHandler:", v10, v12, 1, v15);

}

uint64_t __58__LAUIAuthenticationView_biometryState_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (int64_t)_stateOfSuccess
{
  int64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  _QWORD v11[4];
  id v12[2];
  id location;

  if (-[LAUIAuthenticationView idleWhenDone](self, "idleWhenDone"))
    v3 = 12;
  else
    v3 = 11;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __41__LAUIAuthenticationView__stateOfSuccess__block_invoke;
  v11[3] = &unk_24C27EAE8;
  objc_copyWeak(v12, &location);
  v12[1] = (id)v3;
  v4 = (void *)MEMORY[0x20BD1B708](v11);
  -[LAUIAuthenticationView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[LAUIAuthenticationView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "processAuthenticationSuccessWithCompletionHandler:", v4);
LABEL_8:

    v3 = 7;
    goto LABEL_9;
  }
  -[LAUIAuthenticationView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[LAUIAuthenticationView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "processBiometricMatchWithCompletionHandler:", v4);
    goto LABEL_8;
  }
LABEL_9:

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
  return v3;
}

void __41__LAUIAuthenticationView__stateOfSuccess__block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3[2];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __41__LAUIAuthenticationView__stateOfSuccess__block_invoke_2;
  v2[3] = &unk_24C27EAE8;
  objc_copyWeak(v3, (id *)(a1 + 32));
  v3[1] = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
  objc_destroyWeak(v3);
}

void __41__LAUIAuthenticationView__stateOfSuccess__block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "glyphWrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setState:idleTouchID:animated:completionHandler:", *(_QWORD *)(a1 + 40), 0, 1, &__block_literal_global_1);

}

- (void)authenticationResult:(id)a3 error:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  NSObject *v13;
  id v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  LAUIAuthenticationView *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[LAUIAuthenticationView delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    LA_LOG_LAUIAuthenticationView();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      if (v8)
        v14 = v8;
      else
        v14 = v9;
      v16 = 136315906;
      v17 = "-[LAUIAuthenticationView authenticationResult:error:context:]";
      v18 = 2114;
      v19 = v14;
      v20 = 2114;
      v21 = v10;
      v22 = 2112;
      v23 = self;
      _os_log_impl(&dword_209E00000, v13, OS_LOG_TYPE_DEFAULT, "%s %{public}@, %{public}@ on %@", (uint8_t *)&v16, 0x2Au);
    }

    -[LAUIAuthenticationView delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "authenticationResult:error:context:", v8, v9, v10);

  }
}

- (void)biometricNoMatch
{
  void *v3;
  char v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  LAUIAuthenticationView *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[LAUIAuthenticationView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    LA_LOG_LAUIAuthenticationView();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315394;
      v8 = "-[LAUIAuthenticationView biometricNoMatch]";
      v9 = 2112;
      v10 = self;
      _os_log_impl(&dword_209E00000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v7, 0x16u);
    }

    -[LAUIAuthenticationView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "biometricNoMatch");

  }
}

- (void)_biometryIdle
{
  void *v3;
  char v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  LAUIAuthenticationView *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[LAUIAuthenticationView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    LA_LOG_LAUIAuthenticationView();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315394;
      v8 = "-[LAUIAuthenticationView _biometryIdle]";
      v9 = 2112;
      v10 = self;
      _os_log_impl(&dword_209E00000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v7, 0x16u);
    }

    -[LAUIAuthenticationView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "biometryDidBecomeIdle");

  }
}

- (id)callerIconPath
{
  void *v3;
  void *v4;
  void *v5;

  -[LAUIAuthenticationView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[LAUIAuthenticationView delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "callerIconPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)callerIconBundlePath
{
  void *v3;
  void *v4;
  void *v5;

  -[LAUIAuthenticationView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[LAUIAuthenticationView delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "callerIconBundlePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)localizedCallerName
{
  void *v3;
  void *v4;
  void *v5;

  -[LAUIAuthenticationView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[LAUIAuthenticationView delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedCallerName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setFastAnimations:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_fastAnimations = a3;
  -[LAUIAuthenticationView glyphWrapper](self, "glyphWrapper");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFastAnimations:", v3);

}

- (LAUIAuthenticationDelegate)delegate
{
  return (LAUIAuthenticationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)glyphStyle
{
  return self->_glyphStyle;
}

- (void)setGlyphStyle:(int64_t)a3
{
  self->_glyphStyle = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (BOOL)idleWhenDone
{
  return self->_idleWhenDone;
}

- (void)setIdleWhenDone:(BOOL)a3
{
  self->_idleWhenDone = a3;
}

- (BOOL)fastAnimations
{
  return self->_fastAnimations;
}

- (LAUIAuthenticationCore)authenticationCore
{
  return self->_authenticationCore;
}

- (LAUIPKGlyphWrapper)glyphWrapper
{
  return self->_glyphWrapper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphWrapper, 0);
  objc_storeStrong((id *)&self->_authenticationCore, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)biometryState:(os_log_t)log completionHandler:.cold.1(int a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a2 + 416);
  v4[0] = 67109376;
  v4[1] = a1;
  v5 = 1024;
  v6 = v3;
  _os_log_debug_impl(&dword_209E00000, log, OS_LOG_TYPE_DEBUG, "biometryState: %d last state: %d", (uint8_t *)v4, 0xEu);
}

@end
