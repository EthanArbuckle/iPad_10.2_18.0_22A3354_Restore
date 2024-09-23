@implementation AVSecondScreen

- (AVSecondScreen)initWithScene:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  AVSecondScreen *v7;
  AVSecondScreen *v8;
  void *v9;
  AVObservationController *v10;
  AVObservationController *observationController;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v4 = a3;
  objc_msgSend(v4, "avkit_asWindowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "avkit_screenType");

  if ((unint64_t)(v6 - 5) >= 0xFFFFFFFFFFFFFFFELL)
  {
    v20.receiver = self;
    v20.super_class = (Class)AVSecondScreen;
    v8 = -[AVSecondScreen init](&v20, sel_init);
    if (v8)
    {
      objc_msgSend(v5, "screen");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&v8->_windowScene, v5);
      objc_storeWeak((id *)&v8->_screen, v9);
      v8->_TVOutScreen = v6 == 3;
      if ((unint64_t)objc_msgSend(v5, "activationState") <= 1
        && (objc_msgSend(v5, "avkit_screenHasWindowsExcludingWindow:", 0) & 1) == 0)
      {
        v8->_state = 1;
      }
      v10 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", v8);
      observationController = v8->_observationController;
      v8->_observationController = v10;

      -[AVSecondScreen observationController](v8, "observationController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0DC5308], v5, 0, &__block_literal_global_5111);

      -[AVSecondScreen observationController](v8, "observationController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0DC5330], v5, 0, &__block_literal_global_7);

      -[AVSecondScreen observationController](v8, "observationController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0DC5338], v5, 0, &__block_literal_global_9);

      -[AVSecondScreen observationController](v8, "observationController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0DC5318], v5, 0, &__block_literal_global_11_5112);

      -[AVSecondScreen observationController](v8, "observationController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0DC5310], v5, 0, &__block_literal_global_13_5113);

      -[AVSecondScreen observationController](v8, "observationController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0DC5610], 0, 0, &__block_literal_global_17);

      -[AVSecondScreen observationController](v8, "observationController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVSecondScreenConnectionPreferredDisplayCriteriaDidChangeNotification"), 0, 0, &__block_literal_global_19_5114);

    }
    self = v8;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[AVSecondScreen observationController](self, "observationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAllObservation");

  -[AVSecondScreen setState:](self, "setState:", 0);
  _AVLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[AVSecondScreen dealloc]";
    v8 = 1024;
    v9 = 159;
    _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
  }

  v5.receiver = self;
  v5.super_class = (Class)AVSecondScreen;
  -[AVSecondScreen dealloc](&v5, sel_dealloc);
}

- (void)connectWithSecondScreenConnection:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AVSecondScreen secondScreenConnection](self, "secondScreenConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    _AVLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 136315394;
      v27 = "-[AVSecondScreen connectWithSecondScreenConnection:]";
      v28 = 2112;
      v29 = v4;
      _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v26, 0x16u);
    }

    -[AVSecondScreen secondScreenConnection](self, "secondScreenConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "connectWithScreen:active:", 0, 0);
    objc_msgSend(v7, "debugAssistant");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setScene:", 0);

    -[AVSecondScreen setSecondScreenConnection:](self, "setSecondScreenConnection:", v4);
    if (v4)
    {
      if (!-[AVSecondScreen isAvailable](self, "isAvailable"))
      {
        _AVLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v26) = 0;
          _os_log_error_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_ERROR, "Attempted to connect with a screen that is not available.", (uint8_t *)&v26, 2u);
        }

      }
      objc_msgSend(v4, "debugAssistant");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVSecondScreen windowScene](self, "windowScene");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setScene:", v11);

      -[AVSecondScreen _updatePreferredDisplayCriteria](self, "_updatePreferredDisplayCriteria");
      -[AVSecondScreen window](self, "window");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        v13 = objc_alloc(MEMORY[0x1E0DC3F98]);
        -[AVSecondScreen windowScene](self, "windowScene");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v13, "initWithWindowScene:", v14);
        -[AVSecondScreen setWindow:](self, "setWindow:", v15);

        _AVLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          -[AVSecondScreen window](self, "window");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[AVSecondScreen window](self, "window");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "screen");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 136315650;
          v27 = "-[AVSecondScreen connectWithSecondScreenConnection:]";
          v28 = 2048;
          v29 = v17;
          v30 = 2112;
          v31 = v19;
          _os_log_impl(&dword_1AC4B1000, v16, OS_LOG_TYPE_DEFAULT, "%s Created second window %p on %@", (uint8_t *)&v26, 0x20u);

        }
      }
      -[AVSecondScreen window](self, "window");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contentViewController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setRootViewController:", v21);

      objc_msgSend(v4, "connectWithScreen:active:", self, 1);
      -[AVSecondScreen window](self, "window");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setHidden:", 0);

    }
    else
    {
      -[AVSecondScreen window](self, "window");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setHidden:", 1);

      -[AVSecondScreen window](self, "window");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setRootViewController:", 0);

      -[AVSecondScreen window](self, "window");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setWindowScene:", 0);

      -[AVSecondScreen setWindow:](self, "setWindow:", 0);
    }

  }
}

- (void)setState:(int64_t)a3
{
  BOOL v5;
  void *v6;
  void *v7;
  int v8;
  unint64_t state;
  NSObject *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_state != a3)
  {
    v5 = -[AVSecondScreen isAvailable](self, "isAvailable");
    -[AVSecondScreen window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[AVSecondScreen window](self, "window");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isHidden") ^ 1;

    }
    else
    {
      v8 = 0;
    }

    state = self->_state;
    _AVLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if (state > 2)
        v11 = CFSTR("Invalid");
      else
        v11 = off_1E5BB1518[state];
      if ((unint64_t)a3 > 2)
        v12 = CFSTR("Invalid");
      else
        v12 = off_1E5BB1518[a3];
      v14 = 136315650;
      v15 = "-[AVSecondScreen setState:]";
      v16 = 2112;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_1AC4B1000, v10, OS_LOG_TYPE_DEFAULT, "%s %@ -> %@", (uint8_t *)&v14, 0x20u);
    }

    self->_state = a3;
    switch(a3)
    {
      case 2:
        -[AVSecondScreen secondScreenConnection](self, "secondScreenConnection");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "connectWithScreen:active:", self, 1);
        goto LABEL_21;
      case 1:
        if (v5)
          return;
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "postNotificationName:object:", CFSTR("AVSecondScreenConnectionDidBecomePossibleNotification"), self);
        goto LABEL_21;
      case 0:
        -[AVSecondScreen connectWithSecondScreenConnection:](self, "connectWithSecondScreenConnection:", 0);
        if (v8)
        {
          -[AVSecondScreen windowScene](self, "windowScene");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "avkit_resetPreferredModeSwitchRequest");
LABEL_21:

        }
        break;
    }
  }
}

- (BOOL)isAvailable
{
  return -[AVSecondScreen state](self, "state") != 0;
}

- (CGRect)sceneBounds
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[AVSecondScreen windowScene](self, "windowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coordinateSpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)_updatePreferredDisplayCriteria
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;
  float v7;
  id v8;

  -[AVSecondScreen secondScreenConnection](self, "secondScreenConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredDisplayCriteria");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v8, "videoDynamicRange") - 1;
  if (v4 > 4)
    v5 = -1;
  else
    v5 = qword_1AC5F80A0[v4];
  -[AVSecondScreen windowScene](self, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "refreshRate");
  objc_msgSend(v6, "avkit_setPreferredRefreshRate:HDRMode:", v5, v7);

}

- (BOOL)_isWindowSceneAvailable
{
  void *v3;
  void *v4;
  char v5;

  -[AVSecondScreen windowScene](self, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVSecondScreen window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "avkit_screenHasWindowsExcludingWindow:", v4) ^ 1;

  return v5;
}

- (BOOL)isTVOutScreen
{
  return self->_TVOutScreen;
}

- (AVObservationController)observationController
{
  return self->_observationController;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (UIWindowScene)windowScene
{
  return (UIWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (UIScreen)screen
{
  return (UIScreen *)objc_loadWeakRetained((id *)&self->_screen);
}

- (AVSecondScreenConnection)secondScreenConnection
{
  return self->_secondScreenConnection;
}

- (void)setSecondScreenConnection:(id)a3
{
  objc_storeStrong((id *)&self->_secondScreenConnection, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (CADisplay)debugInfoDisplay
{
  return self->_debugInfoDisplay;
}

- (void)setDebugInfoDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_debugInfoDisplay, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugInfoDisplay, 0);
  objc_storeStrong((id *)&self->_secondScreenConnection, 0);
  objc_destroyWeak((id *)&self->_screen);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_observationController, 0);
}

void __32__AVSecondScreen_initWithScene___block_invoke_18(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v5;
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(a4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "secondScreenConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
    objc_msgSend(v8, "_updatePreferredDisplayCriteria");

}

void __32__AVSecondScreen_initWithScene___block_invoke_15(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a4;
  _AVLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315394;
    v12 = "-[AVSecondScreen initWithScene:]_block_invoke";
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v11, 0x16u);
  }

  v8 = objc_msgSend(v5, "state");
  if (objc_msgSend(v5, "_isWindowSceneAvailable"))
  {
    if ((objc_msgSend(v5, "isAvailable") & 1) == 0)
    {
      objc_msgSend(v5, "windowScene");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "avkit_isForeground");

      if (v10)
        v8 = 1;
    }
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v5, "setState:", v8);

}

void __32__AVSecondScreen_initWithScene___block_invoke_12(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a2;
  _AVLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[AVSecondScreen initWithScene:]_block_invoke";
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("AVSecondScreenDidDisconnectNotification"), v6);

}

void __32__AVSecondScreen_initWithScene___block_invoke_10(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a2;
  _AVLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[AVSecondScreen initWithScene:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(v6, "setState:", 0);
}

void __32__AVSecondScreen_initWithScene___block_invoke_8(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a4;
  _AVLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[AVSecondScreen initWithScene:]_block_invoke";
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v8, 0x16u);
  }

  if (objc_msgSend(v5, "_isWindowSceneAvailable"))
    objc_msgSend(v5, "setState:", 1);

}

void __32__AVSecondScreen_initWithScene___block_invoke_6(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = a4;
  _AVLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315906;
    v11 = "-[AVSecondScreen initWithScene:]_block_invoke";
    v12 = 2112;
    v13 = v8;
    v14 = 1024;
    v15 = objc_msgSend(v7, "avkit_isForeground");
    v16 = 1024;
    v17 = objc_msgSend(v7, "avkit_screenHasWindowsExcludingWindow:", 0);
    _os_log_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_DEFAULT, "%s %@ foreground: %d haswindows: %d", (uint8_t *)&v10, 0x22u);
  }

  if (objc_msgSend(v6, "_isWindowSceneAvailable"))
    objc_msgSend(v6, "setState:", 1);

}

void __32__AVSecondScreen_initWithScene___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = a4;
  _AVLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315394;
    v14 = "-[AVSecondScreen initWithScene:]_block_invoke";
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v13, 0x16u);
  }

  objc_msgSend(v6, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isHidden"))
  {

  }
  else
  {
    objc_msgSend(v6, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "windowScene");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12 == v7)
      objc_msgSend(v6, "setState:", 2);
  }

}

@end
