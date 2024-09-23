@implementation ASCAppearMetricsPresenter

+ (OS_os_log)log
{
  if (log_onceToken != -1)
    dispatch_once(&log_onceToken, &__block_literal_global_1);
  return (OS_os_log *)(id)log_log;
}

void __32__ASCAppearMetricsPresenter_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppStoreComponents", "ASCAppearMetricsPresenter");
  v1 = (void *)log_log;
  log_log = (uint64_t)v0;

}

- (ASCAppearMetricsPresenter)initWithView:(id)a3 metrics:(id)a4 notificationCenter:(id)a5
{
  id v8;
  id v9;
  id v10;
  ASCAppearMetricsPresenter *v11;
  ASCAppearMetricsPresenter *v12;
  ASCMetricsActivity *v13;
  ASCMetricsActivity *activity;
  uint64_t v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ASCAppearMetricsPresenter;
  v11 = -[ASCAppearMetricsPresenter init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_view, v8);
    objc_storeStrong((id *)&v12->_metrics, a4);
    v13 = objc_alloc_init(ASCMetricsActivity);
    activity = v12->_activity;
    v12->_activity = v13;

    *(_WORD *)&v12->_enabled = 1;
    objc_storeStrong((id *)&v12->_notificationCenter, a5);
    -[NSNotificationCenter addObserver:selector:name:object:](v12->_notificationCenter, "addObserver:selector:name:object:", v12, sel_hostDidEnterBackground, *MEMORY[0x1E0CB29F0], 0);
    -[NSNotificationCenter addObserver:selector:name:object:](v12->_notificationCenter, "addObserver:selector:name:object:", v12, sel_hostWillEnterForeground, *MEMORY[0x1E0CB29F8], 0);
    v15 = *MEMORY[0x1E0DC4860];
    -[NSNotificationCenter addObserver:selector:name:object:](v12->_notificationCenter, "addObserver:selector:name:object:", v12, sel_hostDidEnterBackground, *MEMORY[0x1E0DC4768], 0);
    -[NSNotificationCenter addObserver:selector:name:object:](v12->_notificationCenter, "addObserver:selector:name:object:", v12, sel_hostWillEnterForeground, v15, 0);
  }

  return v12;
}

- (ASCAppearMetricsPresenter)initWithView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ASCAppearMetricsPresenter *v7;

  v4 = a3;
  +[ASCMetrics sharedMetrics](ASCMetrics, "sharedMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ASCAppearMetricsPresenter initWithView:metrics:notificationCenter:](self, "initWithView:metrics:notificationCenter:", v4, v5, v6);

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[ASCAppearMetricsPresenter notificationCenter](self, "notificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ASCAppearMetricsPresenter;
  -[ASCAppearMetricsPresenter dealloc](&v4, sel_dealloc);
}

- (void)setScrollObserver:(id)a3
{
  ASCMetricsScrollObserver *v5;
  NSObject *v6;
  ASCMetricsScrollObserver **p_scrollObserver;
  ASCMetricsScrollObserver *v8;
  ASCMetricsScrollObserver *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  int v15;
  ASCAppearMetricsPresenter *v16;
  __int16 v17;
  ASCMetricsScrollObserver *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (ASCMetricsScrollObserver *)a3;
  +[ASCAppearMetricsPresenter log](ASCAppearMetricsPresenter, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v15 = 138543618;
    v16 = self;
    v17 = 2114;
    v18 = v5;
    _os_log_impl(&dword_1BCB7B000, v6, OS_LOG_TYPE_INFO, "%{public}@ set scroll observer: %{public}@", (uint8_t *)&v15, 0x16u);
  }

  p_scrollObserver = &self->_scrollObserver;
  v8 = self->_scrollObserver;
  v9 = v8;
  if (v5 && v8)
  {
    v10 = -[ASCMetricsScrollObserver isEqual:](v8, "isEqual:", v5);

    if ((v10 & 1) != 0)
      goto LABEL_14;
  }
  else
  {

    if (v9 == v5)
      goto LABEL_14;
  }
  if (*p_scrollObserver)
    -[ASCMetricsScrollObserver removeDelegate:](*p_scrollObserver, "removeDelegate:", self);
  objc_storeStrong((id *)&self->_scrollObserver, a3);
  if (v5)
  {
    -[ASCAppearMetricsPresenter model](self, "model");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11
      || (v12 = (void *)v11,
          -[ASCAppearMetricsPresenter model](self, "model"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = -[ASCMetricsScrollObserver hasModelAppeared:](v5, "hasModelAppeared:", v13),
          v13,
          v12,
          !v14))
    {
      -[ASCMetricsScrollObserver addDelegate:](v5, "addDelegate:", self);
    }
  }
LABEL_14:

}

- (void)setModel:(id)a3
{
  ASCViewModel *v4;
  NSObject *v5;
  ASCViewModel *v6;
  ASCViewModel *v7;
  char v8;
  NSObject *v9;
  ASCViewModel *v10;
  ASCViewModel *model;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  ASCAppearMetricsPresenter *v18;
  __int16 v19;
  ASCViewModel *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (ASCViewModel *)a3;
  +[ASCAppearMetricsPresenter log](ASCAppearMetricsPresenter, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v17 = 138543618;
    v18 = self;
    v19 = 2114;
    v20 = v4;
    _os_log_impl(&dword_1BCB7B000, v5, OS_LOG_TYPE_INFO, "%{public}@ set model: %{public}@", (uint8_t *)&v17, 0x16u);
  }

  v6 = self->_model;
  v7 = v6;
  if (v4 && v6)
  {
    v8 = -[ASCViewModel isEqual:](v6, "isEqual:", v4);

    if ((v8 & 1) != 0)
      goto LABEL_22;
  }
  else
  {

    if (v7 == v4)
      goto LABEL_22;
  }
  +[ASCAppearMetricsPresenter log](ASCAppearMetricsPresenter, "log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v17 = 138543362;
    v18 = self;
    _os_log_impl(&dword_1BCB7B000, v9, OS_LOG_TYPE_INFO, "%{public}@ begin setting model", (uint8_t *)&v17, 0xCu);
  }

  -[ASCAppearMetricsPresenter setSettingModel:](self, "setSettingModel:", 1);
  if (self->_model)
    -[ASCAppearMetricsPresenter disappearIfNeeded](self, "disappearIfNeeded");
  v10 = (ASCViewModel *)-[ASCViewModel copyWithZone:](v4, "copyWithZone:", 0);
  model = self->_model;
  self->_model = v10;

  if (v4)
  {
    -[ASCAppearMetricsPresenter scrollObserver](self, "scrollObserver");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      v14 = -[ASCAppearMetricsPresenter isAppeared](self, "isAppeared");

      if (v14)
      {
        +[ASCAppearMetricsPresenter log](ASCAppearMetricsPresenter, "log");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v17 = 138543362;
          v18 = self;
          _os_log_impl(&dword_1BCB7B000, v15, OS_LOG_TYPE_INFO, "%{public}@ model id changed, reset appearance flag", (uint8_t *)&v17, 0xCu);
        }

        -[ASCAppearMetricsPresenter setAppeared:](self, "setAppeared:", 0);
      }
    }
    -[ASCAppearMetricsPresenter appearIfNeeded](self, "appearIfNeeded");
  }
  +[ASCAppearMetricsPresenter log](ASCAppearMetricsPresenter, "log");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = 138543362;
    v18 = self;
    _os_log_impl(&dword_1BCB7B000, v16, OS_LOG_TYPE_INFO, "%{public}@ end setting model", (uint8_t *)&v17, 0xCu);
  }

  -[ASCAppearMetricsPresenter setSettingModel:](self, "setSettingModel:", 0);
LABEL_22:

}

- (NSString)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCAppearMetricsPresenter model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, CFSTR("model.id"));

  -[ASCDescriber addBool:withName:](v3, "addBool:withName:", -[ASCAppearMetricsPresenter isAppeared](self, "isAppeared"), CFSTR("isAppeared"));
  -[ASCAppearMetricsPresenter view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addBool:withName:](v3, "addBool:withName:", v7 != 0, CFSTR("isInWindow"));

  -[ASCAppearMetricsPresenter view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addBool:withName:](v3, "addBool:withName:", objc_msgSend(v8, "isHidden"), CFSTR("isHidden"));

  -[ASCAppearMetricsPresenter scrollObserver](self, "scrollObserver");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addBool:withName:](v3, "addBool:withName:", v9 != 0, CFSTR("isInScrollView"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (void)hostDidEnterBackground
{
  NSObject *v3;
  int v4;
  ASCAppearMetricsPresenter *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  +[ASCAppearMetricsPresenter log](ASCAppearMetricsPresenter, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_1BCB7B000, v3, OS_LOG_TYPE_INFO, "%{public}@ host did enter background", (uint8_t *)&v4, 0xCu);
  }

  -[ASCAppearMetricsPresenter setEnteringBackground:](self, "setEnteringBackground:", 1);
  -[ASCAppearMetricsPresenter disappearIfNeeded](self, "disappearIfNeeded");
  -[ASCAppearMetricsPresenter setEnteringBackground:](self, "setEnteringBackground:", 0);
}

- (void)hostWillEnterForeground
{
  NSObject *v3;
  int v4;
  ASCAppearMetricsPresenter *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  +[ASCAppearMetricsPresenter log](ASCAppearMetricsPresenter, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_1BCB7B000, v3, OS_LOG_TYPE_INFO, "%{public}@ host will enter foreground", (uint8_t *)&v4, 0xCu);
  }

  -[ASCAppearMetricsPresenter setEnteringForeground:](self, "setEnteringForeground:", 1);
  -[ASCAppearMetricsPresenter appearIfNeeded](self, "appearIfNeeded");
  -[ASCAppearMetricsPresenter setEnteringForeground:](self, "setEnteringForeground:", 0);
}

- (void)viewDidMoveToWindow
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  ASCAppearMetricsPresenter *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[ASCAppearMetricsPresenter log](ASCAppearMetricsPresenter, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[ASCAppearMetricsPresenter view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = self;
    v14 = 2114;
    v15 = v5;
    _os_log_impl(&dword_1BCB7B000, v3, OS_LOG_TYPE_INFO, "%{public}@ did move to window %{public}@", (uint8_t *)&v12, 0x16u);

  }
  -[ASCAppearMetricsPresenter view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ASCAppearMetricsPresenter view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "asc_nearestSuperviewPassingTest:", &__block_literal_global_23);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[ASCAppearMetricsPresenter log](ASCAppearMetricsPresenter, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = 138543618;
      v13 = self;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1BCB7B000, v10, OS_LOG_TYPE_INFO, "%{public}@ enclosing scroll view is %@", (uint8_t *)&v12, 0x16u);
    }

    if (v9)
    {
      +[ASCMetricsScrollObserver observerForScrollView:](ASCMetricsScrollObserver, "observerForScrollView:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCAppearMetricsPresenter setScrollObserver:](self, "setScrollObserver:", v11);

    }
    else
    {
      -[ASCAppearMetricsPresenter setScrollObserver:](self, "setScrollObserver:", 0);
    }
    -[ASCAppearMetricsPresenter appearIfNeeded](self, "appearIfNeeded");

  }
  else
  {
    -[ASCAppearMetricsPresenter setScrollObserver:](self, "setScrollObserver:", 0);
    -[ASCAppearMetricsPresenter disappearIfNeeded](self, "disappearIfNeeded");
  }
}

uint64_t __48__ASCAppearMetricsPresenter_viewDidMoveToWindow__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)viewDidSetHidden
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  ASCAppearMetricsPresenter *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[ASCAppearMetricsPresenter log](ASCAppearMetricsPresenter, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[ASCAppearMetricsPresenter view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = self;
    v9 = 1026;
    v10 = objc_msgSend(v4, "isHidden");
    _os_log_impl(&dword_1BCB7B000, v3, OS_LOG_TYPE_INFO, "%{public}@ set hidden %{public}d", (uint8_t *)&v7, 0x12u);

  }
  -[ASCAppearMetricsPresenter view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isHidden");

  if (v6)
    -[ASCAppearMetricsPresenter disappearIfNeeded](self, "disappearIfNeeded");
  else
    -[ASCAppearMetricsPresenter appearIfNeeded](self, "appearIfNeeded");
}

- (void)viewDidAction
{
  void *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  ASCAppearMetricsPresenter *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[ASCAppearMetricsPresenter model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[ASCAppearMetricsPresenter log](ASCAppearMetricsPresenter, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      v11 = 138543362;
      v12 = self;
      _os_log_impl(&dword_1BCB7B000, v5, OS_LOG_TYPE_INFO, "%{public}@ did action", (uint8_t *)&v11, 0xCu);
    }

    -[ASCAppearMetricsPresenter metrics](self, "metrics");
    v5 = objc_claimAutoreleasedReturnValue();
    -[ASCAppearMetricsPresenter model](self, "model");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "metrics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCAppearMetricsPresenter activity](self, "activity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)-[NSObject processViewMetrics:atInvocationPoint:withActivity:](v5, "processViewMetrics:atInvocationPoint:withActivity:", v8, CFSTR("click"), v9);

  }
  else if (v6)
  {
    v11 = 138543362;
    v12 = self;
    _os_log_impl(&dword_1BCB7B000, v5, OS_LOG_TYPE_INFO, "%{public}@ has no metrics for action", (uint8_t *)&v11, 0xCu);
  }

}

- (void)viewDidEndRenderWithPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;

  v4 = a3;
  -[ASCAppearMetricsPresenter model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v17 = objc_alloc(MEMORY[0x1E0C99DA0]);
    objc_exception_throw((id)objc_msgSend(v17, "initWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Cannot end view render without a model"), 0));
  }
  -[ASCAppearMetricsPresenter scrollObserver](self, "scrollObserver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ASCAppearMetricsPresenter scrollObserver](self, "scrollObserver");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCAppearMetricsPresenter model](self, "model");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "hasModelRendered:", v8);

    if ((v9 & 1) != 0)
      goto LABEL_10;
    -[ASCAppearMetricsPresenter scrollObserver](self, "scrollObserver");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCAppearMetricsPresenter model](self, "model");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "modelDidRender:", v11);

  }
  -[ASCAppearMetricsPresenter model](self, "model");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "metrics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[ASCAppearMetricsPresenter metrics](self, "metrics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v14, "processViewRenderWithPredicate:", v4);

  }
  else
  {
    +[ASCAppearMetricsPresenter log](ASCAppearMetricsPresenter, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ASCAppearMetricsPresenter viewDidEndRenderWithPredicate:].cold.1((uint64_t)self, v16);

  }
LABEL_10:

}

- (void)viewDidFailRequest:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  ASCMetricsData *v15;
  void *v16;
  void *v17;
  ASCMetricsData *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[6];
  _QWORD v23[7];

  v23[6] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB28A8]) || objc_msgSend(v7, "code") < 4096)
  {

    goto LABEL_7;
  }
  v9 = objc_msgSend(v7, "code");

  if (v9 > 4224)
  {
LABEL_7:
    v22[0] = CFSTR("eventType");
    v22[1] = CFSTR("page");
    v23[0] = CFSTR("page");
    v23[1] = CFSTR("Error");
    v23[2] = CFSTR("AppStoreError");
    v22[2] = CFSTR("pageType");
    v22[3] = CFSTR("pageId");
    objc_msgSend(v6, "id");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[3] = v12;
    v22[4] = CFSTR("pageContext");
    objc_msgSend(v6, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[4] = v13;
    v22[5] = CFSTR("errorDescription");
    objc_msgSend(v7, "localizedDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[5] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 6);
    v10 = objc_claimAutoreleasedReturnValue();

    v15 = [ASCMetricsData alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[ASCMetricsData initWithTopic:shouldFlush:fields:includingFields:excludingFields:](v15, "initWithTopic:shouldFlush:fields:includingFields:excludingFields:", 0, 0, v10, v16, v17);

    -[ASCAppearMetricsPresenter metrics](self, "metrics");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCAppearMetricsPresenter activity](self, "activity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (id)objc_msgSend(v19, "processMetricsData:withActivity:", v18, v20);

    goto LABEL_8;
  }
  +[ASCAppearMetricsPresenter log](ASCAppearMetricsPresenter, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[ASCAppearMetricsPresenter viewDidFailRequest:withError:].cold.1((uint64_t)self, (uint64_t)v7, v10);
LABEL_8:

}

- (void)viewDidRetryFailedRequest
{
  NSObject *v3;
  ASCMetricsData *v4;
  void *v5;
  void *v6;
  ASCMetricsData *v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  ASCAppearMetricsPresenter *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[ASCAppearMetricsPresenter log](ASCAppearMetricsPresenter, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v11 = 138543362;
    v12 = self;
    _os_log_impl(&dword_1BCB7B000, v3, OS_LOG_TYPE_INFO, "%{public}@ did retry failed request", (uint8_t *)&v11, 0xCu);
  }

  v4 = [ASCMetricsData alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ASCMetricsData initWithTopic:shouldFlush:fields:includingFields:excludingFields:](v4, "initWithTopic:shouldFlush:fields:includingFields:excludingFields:", 0, 0, &unk_1E757A648, v5, v6);

  -[ASCAppearMetricsPresenter metrics](self, "metrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAppearMetricsPresenter activity](self, "activity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "processMetricsData:withActivity:", v7, v9);

}

- (BOOL)canAppear
{
  NSObject *v3;
  const char *v4;
  BOOL v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  void *v25;
  void *v26;
  CGFloat v27;
  CGFloat v28;
  BOOL v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  double v36;
  BOOL v37;
  int v38;
  ASCAppearMetricsPresenter *v39;
  uint64_t v40;
  CGPoint v41;
  CGRect v42;

  v40 = *MEMORY[0x1E0C80C00];
  if (!-[ASCAppearMetricsPresenter isEnabled](self, "isEnabled"))
  {
    +[ASCAppearMetricsPresenter log](ASCAppearMetricsPresenter, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v38 = 138543362;
      v39 = self;
      v4 = "%{public}@ can appear: no, reason: not enabled";
      goto LABEL_7;
    }
LABEL_8:
    v5 = 0;
    goto LABEL_9;
  }
  if (-[ASCAppearMetricsPresenter isAppeared](self, "isAppeared"))
  {
    +[ASCAppearMetricsPresenter log](ASCAppearMetricsPresenter, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v38 = 138543362;
      v39 = self;
      v4 = "%{public}@ can appear: no, reason: already appeared";
LABEL_7:
      _os_log_impl(&dword_1BCB7B000, v3, OS_LOG_TYPE_INFO, v4, (uint8_t *)&v38, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  -[ASCAppearMetricsPresenter model](self, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "metrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    +[ASCAppearMetricsPresenter log](ASCAppearMetricsPresenter, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      goto LABEL_8;
    v38 = 138543362;
    v39 = self;
    v4 = "%{public}@ can appear: no, reason: no metrics";
    goto LABEL_7;
  }
  -[ASCAppearMetricsPresenter view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    +[ASCAppearMetricsPresenter log](ASCAppearMetricsPresenter, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      goto LABEL_8;
    v38 = 138543362;
    v39 = self;
    v4 = "%{public}@ can appear: no, reason: no window";
    goto LABEL_7;
  }
  -[ASCAppearMetricsPresenter view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isHidden");

  if (v12)
  {
    +[ASCAppearMetricsPresenter log](ASCAppearMetricsPresenter, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      goto LABEL_8;
    v38 = 138543362;
    v39 = self;
    v4 = "%{public}@ can appear: no, reason: is hidden";
    goto LABEL_7;
  }
  -[ASCAppearMetricsPresenter scrollObserver](self, "scrollObserver");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[ASCAppearMetricsPresenter scrollObserver](self, "scrollObserver");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCAppearMetricsPresenter model](self, "model");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "hasModelAppeared:", v15)
      && !-[ASCAppearMetricsPresenter isSettingModel](self, "isSettingModel"))
    {
      v37 = -[ASCAppearMetricsPresenter isEnteringForeground](self, "isEnteringForeground");

      if (!v37)
      {
        +[ASCAppearMetricsPresenter log](ASCAppearMetricsPresenter, "log");
        v3 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
          goto LABEL_8;
        v38 = 138543362;
        v39 = self;
        v4 = "%{public}@ can appear: no, reason: already appeared in scroll view";
        goto LABEL_7;
      }
    }
    else
    {

    }
    -[ASCAppearMetricsPresenter scrollObserver](self, "scrollObserver");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "visibleRect");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    -[ASCAppearMetricsPresenter scrollObserver](self, "scrollObserver");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCAppearMetricsPresenter view](self, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "centerOfView:", v26);
    v41.x = v27;
    v41.y = v28;
    v42.origin.x = v18;
    v42.origin.y = v20;
    v42.size.width = v22;
    v42.size.height = v24;
    v29 = CGRectContainsPoint(v42, v41);

    if (!v29)
    {
      +[ASCAppearMetricsPresenter log](ASCAppearMetricsPresenter, "log");
      v3 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
        goto LABEL_8;
      v38 = 138543362;
      v39 = self;
      v4 = "%{public}@ can appear: no, reason: model is not visible";
      goto LABEL_7;
    }
    -[ASCAppearMetricsPresenter scrollObserver](self, "scrollObserver");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "contentSize");
    v32 = v31;
    v34 = v33;
    v35 = MEMORY[0x1E0C9D820];
    v36 = *MEMORY[0x1E0C9D820];

    if (v32 == v36 && v34 == *(double *)(v35 + 8))
    {
      +[ASCAppearMetricsPresenter log](ASCAppearMetricsPresenter, "log");
      v3 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
        goto LABEL_8;
      v38 = 138543362;
      v39 = self;
      v4 = "%{public}@ can appear: no, reason: scroll view content size is zero";
      goto LABEL_7;
    }
  }
  +[ASCAppearMetricsPresenter log](ASCAppearMetricsPresenter, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  v5 = 1;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v38 = 138543362;
    v39 = self;
    _os_log_impl(&dword_1BCB7B000, v3, OS_LOG_TYPE_INFO, "%{public}@ can appear: yes", (uint8_t *)&v38, 0xCu);
  }
LABEL_9:

  return v5;
}

- (void)appearIfNeeded
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  ASCAppearMetricsPresenter *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[ASCAppearMetricsPresenter canAppear](self, "canAppear"))
  {
    +[ASCAppearMetricsPresenter log](ASCAppearMetricsPresenter, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v13 = 138543362;
      v14 = self;
      _os_log_impl(&dword_1BCB7B000, v3, OS_LOG_TYPE_INFO, "%{public}@ did appear", (uint8_t *)&v13, 0xCu);
    }

    -[ASCAppearMetricsPresenter metrics](self, "metrics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCAppearMetricsPresenter model](self, "model");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "metrics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCAppearMetricsPresenter activity](self, "activity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v4, "processViewMetrics:atInvocationPoint:withActivity:", v6, CFSTR("appear"), v7);

    -[ASCAppearMetricsPresenter scrollObserver](self, "scrollObserver");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[ASCAppearMetricsPresenter scrollObserver](self, "scrollObserver");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCAppearMetricsPresenter model](self, "model");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "modelDidAppear:", v11);

      -[ASCAppearMetricsPresenter scrollObserver](self, "scrollObserver");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeDelegate:", self);

    }
    -[ASCAppearMetricsPresenter setAppeared:](self, "setAppeared:", 1);
  }
}

- (BOOL)canDisappear
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  BOOL v12;
  BOOL v14;
  _BOOL4 v15;
  void *v16;
  int v17;
  ASCAppearMetricsPresenter *v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!-[ASCAppearMetricsPresenter isEnabled](self, "isEnabled"))
  {
    +[ASCAppearMetricsPresenter log](ASCAppearMetricsPresenter, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v17 = 138543362;
      v18 = self;
      v11 = "%{public}@ can disappear: no, reason: not enabled";
      goto LABEL_21;
    }
LABEL_22:
    v12 = 0;
    goto LABEL_23;
  }
  if (!-[ASCAppearMetricsPresenter isAppeared](self, "isAppeared"))
  {
    +[ASCAppearMetricsPresenter log](ASCAppearMetricsPresenter, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v17 = 138543362;
      v18 = self;
      v11 = "%{public}@ can disappear: no, reason: not appeared yet";
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  -[ASCAppearMetricsPresenter model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[ASCAppearMetricsPresenter log](ASCAppearMetricsPresenter, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v17 = 138543362;
      v18 = self;
      v11 = "%{public}@ can disappear: no, reason: no metrics";
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  -[ASCAppearMetricsPresenter view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_8;
  v7 = (void *)v6;
  -[ASCAppearMetricsPresenter view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isHidden") & 1) != 0 || -[ASCAppearMetricsPresenter isSettingModel](self, "isSettingModel"))
  {

LABEL_8:
    goto LABEL_9;
  }
  v14 = -[ASCAppearMetricsPresenter isEnteringBackground](self, "isEnteringBackground");

  if (!v14)
  {
    +[ASCAppearMetricsPresenter log](ASCAppearMetricsPresenter, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v15 = -[ASCAppearMetricsPresenter isSettingModel](self, "isSettingModel");
      -[ASCAppearMetricsPresenter view](self, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = self;
      v19 = 1026;
      v20 = v15;
      v21 = 1026;
      v22 = objc_msgSend(v16, "isHidden");
      _os_log_impl(&dword_1BCB7B000, v10, OS_LOG_TYPE_INFO, "%{public}@ can disappear: no, reason: is not setting model (%{public}d) and window is hidden (%{public}d)", (uint8_t *)&v17, 0x18u);

    }
    goto LABEL_22;
  }
LABEL_9:
  if (-[ASCAppearMetricsPresenter isSettingModel](self, "isSettingModel"))
  {
    -[ASCAppearMetricsPresenter scrollObserver](self, "scrollObserver");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      +[ASCAppearMetricsPresenter log](ASCAppearMetricsPresenter, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v17 = 138543362;
        v18 = self;
        v11 = "%{public}@ can disappear: no, reason: is settings model and has scroll observer";
LABEL_21:
        _os_log_impl(&dword_1BCB7B000, v10, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v17, 0xCu);
        goto LABEL_22;
      }
      goto LABEL_22;
    }
  }
  +[ASCAppearMetricsPresenter log](ASCAppearMetricsPresenter, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  v12 = 1;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v17 = 138543362;
    v18 = self;
    _os_log_impl(&dword_1BCB7B000, v10, OS_LOG_TYPE_INFO, "%{public}@ can disappear: yes", (uint8_t *)&v17, 0xCu);
  }
LABEL_23:

  return v12;
}

- (void)disappearIfNeeded
{
  BOOL v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  ASCAppearMetricsPresenter *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = -[ASCAppearMetricsPresenter canDisappear](self, "canDisappear");
  +[ASCAppearMetricsPresenter log](ASCAppearMetricsPresenter, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      v11 = 138543362;
      v12 = self;
      _os_log_impl(&dword_1BCB7B000, v4, OS_LOG_TYPE_INFO, "%{public}@ did disappear", (uint8_t *)&v11, 0xCu);
    }

    -[ASCAppearMetricsPresenter metrics](self, "metrics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCAppearMetricsPresenter model](self, "model");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "metrics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCAppearMetricsPresenter activity](self, "activity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v6, "processViewMetrics:atInvocationPoint:withActivity:", v8, CFSTR("disappear"), v9);

    -[ASCAppearMetricsPresenter setAppeared:](self, "setAppeared:", 0);
  }
  else
  {
    if (v5)
    {
      v11 = 138543362;
      v12 = self;
      _os_log_impl(&dword_1BCB7B000, v4, OS_LOG_TYPE_INFO, "%{public}@ can't disappear", (uint8_t *)&v11, 0xCu);
    }

  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  ASCAppearMetricsPresenter *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[ASCAppearMetricsPresenter log](ASCAppearMetricsPresenter, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138543618;
    v7 = self;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1BCB7B000, v5, OS_LOG_TYPE_INFO, "%{public}@ enclosing scroll view did scroll %{public}@", (uint8_t *)&v6, 0x16u);
  }

  -[ASCAppearMetricsPresenter appearIfNeeded](self, "appearIfNeeded");
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (ASCMetricsActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (ASCViewModel)model
{
  return self->_model;
}

- (ASCMetrics)metrics
{
  return self->_metrics;
}

- (BOOL)isAppeared
{
  return self->_appeared;
}

- (void)setAppeared:(BOOL)a3
{
  self->_appeared = a3;
}

- (BOOL)isSettingModel
{
  return self->_settingModel;
}

- (void)setSettingModel:(BOOL)a3
{
  self->_settingModel = a3;
}

- (ASCMetricsScrollObserver)scrollObserver
{
  return self->_scrollObserver;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (BOOL)isEnteringBackground
{
  return self->_enteringBackground;
}

- (void)setEnteringBackground:(BOOL)a3
{
  self->_enteringBackground = a3;
}

- (BOOL)isEnteringForeground
{
  return self->_enteringForeground;
}

- (void)setEnteringForeground:(BOOL)a3
{
  self->_enteringForeground = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_scrollObserver, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_destroyWeak((id *)&self->_view);
}

- (void)viewDidEndRenderWithPredicate:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1BCB7B000, a2, OS_LOG_TYPE_ERROR, "%{public}@ cannot process view render for model with missing metrics data", (uint8_t *)&v2, 0xCu);
}

- (void)viewDidFailRequest:(os_log_t)log withError:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_1BCB7B000, log, OS_LOG_TYPE_DEBUG, "%{public}@ not generating page event for %@", (uint8_t *)&v3, 0x16u);
}

@end
