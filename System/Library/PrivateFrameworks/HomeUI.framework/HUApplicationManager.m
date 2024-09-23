@implementation HUApplicationManager

+ (id)sharedInstance
{
  if (qword_1ED580B80 != -1)
    dispatch_once(&qword_1ED580B80, &__block_literal_global_172);
  return (id)_MergedGlobals_629;
}

void __38__HUApplicationManager_sharedInstance__block_invoke()
{
  HUApplicationManager *v0;
  void *v1;

  v0 = objc_alloc_init(HUApplicationManager);
  v1 = (void *)_MergedGlobals_629;
  _MergedGlobals_629 = (uint64_t)v0;

}

- (HUApplicationManager)init
{
  HUApplicationManager *v2;
  void *v3;
  void *v4;
  HUDefaultStatusBarVisiblityHandler *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUApplicationManager;
  v2 = -[HUApplicationManager init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUApplicationManager setStatusBarHidingRequesters:](v2, "setStatusBarHidingRequesters:", v3);

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUApplicationManager setIdleTimerDisabledRequesters:](v2, "setIdleTimerDisabledRequesters:", v4);

    v5 = objc_alloc_init(HUDefaultStatusBarVisiblityHandler);
    -[HUApplicationManager setStatusBarVisibilityHandler:](v2, "setStatusBarVisibilityHandler:", v5);

  }
  return v2;
}

- (BOOL)isStatusBarHidden
{
  void *v2;
  char v3;

  -[HUApplicationManager statusBarVisibilityHandler](self, "statusBarVisibilityHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isStatusBarHidden");

  return v3;
}

- (void)setStatusBarHidden:(BOOL)a3 forRequester:(id)a4
{
  -[HUApplicationManager setStatusBarHidden:forRequester:withAnimationSettings:](self, "setStatusBarHidden:forRequester:withAnimationSettings:", a3, a4, 0);
}

- (void)setStatusBarHidden:(BOOL)a3 forRequester:(id)a4 withAnimationSettings:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  v6 = a3;
  v18 = a5;
  v8 = a4;
  -[HUApplicationManager statusBarHidingRequesters](self, "statusBarHidingRequesters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  -[HUApplicationManager statusBarHidingRequesters](self, "statusBarHidingRequesters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v6)
    objc_msgSend(v11, "addObject:", v8);
  else
    objc_msgSend(v11, "removeObject:", v8);
  v13 = v10 == 0;

  -[HUApplicationManager statusBarHidingRequesters](self, "statusBarHidingRequesters");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (((v13 ^ (v15 != 0)) & 1) == 0)
  {
    if (v15)
    {
      -[HUApplicationManager setWasStatusBarVisible:](self, "setWasStatusBarVisible:", -[HUApplicationManager isStatusBarHidden](self, "isStatusBarHidden") ^ 1);
      if (!-[HUApplicationManager isStatusBarHidden](self, "isStatusBarHidden"))
      {
        v16 = 1;
LABEL_9:
        -[HUApplicationManager statusBarVisibilityHandler](self, "statusBarVisibilityHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setStatusBarHidden:withAnimationSettings:", v16, v18);

      }
    }
    else
    {
      v16 = -[HUApplicationManager wasStatusBarVisible](self, "wasStatusBarVisible") ^ 1;
      if (-[HUApplicationManager isStatusBarHidden](self, "isStatusBarHidden") != (_DWORD)v16)
        goto LABEL_9;
    }
  }

}

- (BOOL)isIdleTimerDisabled
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "isIdleTimerDisabled");
}

- (void)setIdleTimerDisabled:(BOOL)a3 forRequester:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  id v10;

  v4 = a3;
  v6 = a4;
  -[HUApplicationManager idleTimerDisabledRequesters](self, "idleTimerDisabledRequesters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
    objc_msgSend(v7, "addObject:", v6);
  else
    objc_msgSend(v7, "removeObject:", v6);

  -[HUApplicationManager idleTimerDisabledRequesters](self, "idleTimerDisabledRequesters");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v10, "count") != 0;
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "setIdleTimerDisabled:", v9);

}

- (HUStatusBarVisibilityHandling)statusBarVisibilityHandler
{
  return self->_statusBarVisibilityHandler;
}

- (void)setStatusBarVisibilityHandler:(id)a3
{
  objc_storeStrong((id *)&self->_statusBarVisibilityHandler, a3);
}

- (NSHashTable)statusBarHidingRequesters
{
  return self->_statusBarHidingRequesters;
}

- (void)setStatusBarHidingRequesters:(id)a3
{
  objc_storeStrong((id *)&self->_statusBarHidingRequesters, a3);
}

- (NSHashTable)idleTimerDisabledRequesters
{
  return self->_idleTimerDisabledRequesters;
}

- (void)setIdleTimerDisabledRequesters:(id)a3
{
  objc_storeStrong((id *)&self->_idleTimerDisabledRequesters, a3);
}

- (BOOL)wasStatusBarVisible
{
  return self->_wasStatusBarVisible;
}

- (void)setWasStatusBarVisible:(BOOL)a3
{
  self->_wasStatusBarVisible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleTimerDisabledRequesters, 0);
  objc_storeStrong((id *)&self->_statusBarHidingRequesters, 0);
  objc_storeStrong((id *)&self->_statusBarVisibilityHandler, 0);
}

@end
