@implementation ARCoachingOverlayView

- (ARCoachingOverlayView)initWithFrame:(CGRect)a3
{
  ARCoachingOverlayView *v3;
  ARCoachingOverlayView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ARCoachingOverlayView;
  v3 = -[ARCoachingOverlayView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[ARCoachingOverlayView setupView](v3, "setupView");
  return v4;
}

- (ARCoachingOverlayView)initWithCoder:(id)a3
{
  id v4;
  ARCoachingOverlayView *v5;
  ARCoachingOverlayView *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ARCoachingOverlayView;
  v5 = -[ARCoachingOverlayView initWithCoder:](&v8, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    -[ARCoachingOverlayView setupView](v5, "setupView");
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("goal")))
      -[ARCoachingOverlayView setGoal:](v6, "setGoal:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("goal")));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("activatesAutomatically")))
      -[ARCoachingOverlayView setActivatesAutomatically:](v6, "setActivatesAutomatically:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("activatesAutomatically")));
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ARCoachingOverlayView;
  v4 = a3;
  -[ARCoachingOverlayView encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_goal, CFSTR("goal"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_activatesAutomatically, CFSTR("activatesAutomatically"));

}

- (void)dealloc
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  ARCoachingOverlayView *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _ARLogCoaching_2();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v9 = v5;
    v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_1DCC73000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Deallocate the overlay", buf, 0x16u);

  }
  -[ARSession _removeObserver:](self->_session, "_removeObserver:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB450], 0);

  v7.receiver = self;
  v7.super_class = (Class)ARCoachingOverlayView;
  -[ARCoachingOverlayView dealloc](&v7, sel_dealloc);
}

- (void)setupView
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  ARCoachingHeuristicCollection *v6;
  ARCoachingHeuristicCollection *heuristics;
  ARCoachingMotionTracker *v8;
  ARCoachingMotionTracker *motionTracker;
  ARCoachingSessionCache *v10;
  ARCoachingSessionCache *coachingSessionCache;
  NSMutableArray *v12;
  NSMutableArray *uiAnimationQueue;
  UIView *v14;
  UIView *background;
  void *v16;
  ARCoachingAnimationView *v17;
  ARCoachingAnimationView *coachingAnimationView;
  UILabel *v19;
  UILabel *coachingText;
  void *v21;
  void *v22;
  ARCoachingPillButton *v23;
  void *v24;
  void *v25;
  ARCoachingPillButton *v26;
  ARCoachingPillButton *resetButton;
  void *v28;
  void *v29;
  NSLayoutConstraint *v30;
  NSLayoutConstraint *coachingTextLeftAnchorConstraint;
  void *v32;
  void *v33;
  NSLayoutConstraint *v34;
  NSLayoutConstraint *coachingTextRightAnchorConstraint;
  double v36;
  NSLayoutConstraint *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  ARCoachingStateHidden *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  _QWORD v69[11];
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  ARCoachingOverlayView *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  _ARLogCoaching_2();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v71 = v5;
    v72 = 2048;
    v73 = self;
    _os_log_impl(&dword_1DCC73000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Set up the overlay", buf, 0x16u);

  }
  self->_goal = 0;
  self->_requestedGoal = 0;
  self->_activatesAutomatically = 1;
  v6 = objc_alloc_init(ARCoachingHeuristicCollection);
  heuristics = self->_heuristics;
  self->_heuristics = v6;

  v8 = objc_alloc_init(ARCoachingMotionTracker);
  motionTracker = self->_motionTracker;
  self->_motionTracker = v8;

  v10 = objc_alloc_init(ARCoachingSessionCache);
  coachingSessionCache = self->_coachingSessionCache;
  self->_coachingSessionCache = v10;

  v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  uiAnimationQueue = self->_uiAnimationQueue;
  self->_uiAnimationQueue = v12;

  self->_currentConstraintDeviceOrientation = 0;
  self->_resetButtonLandscapeVerticalOffset = 80.0;
  self->_resetButtonPortraitVerticalOffset = 80.0;
  v14 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
  background = self->_background;
  self->_background = v14;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_background, "setBackgroundColor:", v16);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_background, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v17 = objc_alloc_init(ARCoachingAnimationView);
  coachingAnimationView = self->_coachingAnimationView;
  self->_coachingAnimationView = v17;

  -[ARCoachingAnimationView setTranslatesAutoresizingMaskIntoConstraints:](self->_coachingAnimationView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v19 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
  coachingText = self->_coachingText;
  self->_coachingText = v19;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_coachingText, "setTextColor:", v21);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB568]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_coachingText, "setFont:", v22);

  -[UILabel setTextAlignment:](self->_coachingText, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_coachingText, "setNumberOfLines:", 0);
  -[UILabel setLineBreakMode:](self->_coachingText, "setLineBreakMode:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_coachingText, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v23 = [ARCoachingPillButton alloc];
  ARKitCoreBundle();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Start Over"), &stru_1EA587300, CFSTR("Localizable_iOS"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[ARCoachingRoundedButton initWithTitle:buttonStyle:textStyle:controlStyle:adjustsFontForContentSizeCategory:](v23, "initWithTitle:buttonStyle:textStyle:controlStyle:adjustsFontForContentSizeCategory:", v25, 0, 1, 2, 1);
  resetButton = self->_resetButton;
  self->_resetButton = v26;

  -[ARCoachingPillButton setTranslatesAutoresizingMaskIntoConstraints:](self->_resetButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ARCoachingButton setContentEdgeInsets:](self->_resetButton, "setContentEdgeInsets:", 12.0, 20.0, 12.0, 20.0);
  -[ARCoachingButton addTarget:action:forControlEvents:](self->_resetButton, "addTarget:action:forControlEvents:", self, sel_buttonPress_, 64);
  -[ARCoachingOverlayView addSubview:](self, "addSubview:", self->_background);
  -[ARCoachingOverlayView addSubview:](self, "addSubview:", self->_coachingAnimationView);
  -[ARCoachingOverlayView addSubview:](self, "addSubview:", self->_coachingText);
  -[ARCoachingOverlayView addSubview:](self, "addSubview:", self->_resetButton);
  -[UILabel leftAnchor](self->_coachingText, "leftAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARCoachingOverlayView centerXAnchor](self, "centerXAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, -154.0);
  v30 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  coachingTextLeftAnchorConstraint = self->_coachingTextLeftAnchorConstraint;
  self->_coachingTextLeftAnchorConstraint = v30;

  -[UILabel rightAnchor](self->_coachingText, "rightAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARCoachingOverlayView centerXAnchor](self, "centerXAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:constant:", v33, 154.0);
  v34 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  coachingTextRightAnchorConstraint = self->_coachingTextRightAnchorConstraint;
  self->_coachingTextRightAnchorConstraint = v34;

  if (ARDeviceIsiPad())
    v36 = 100.0;
  else
    v36 = 75.0;
  v57 = (void *)MEMORY[0x1E0CB3718];
  -[UIView centerXAnchor](self->_background, "centerXAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARCoachingOverlayView centerXAnchor](self, "centerXAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintEqualToAnchor:", v67);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = v66;
  -[UIView centerYAnchor](self->_background, "centerYAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARCoachingOverlayView centerYAnchor](self, "centerYAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:", v64);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v69[1] = v63;
  -[ARCoachingAnimationView leftAnchor](self->_coachingAnimationView, "leftAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARCoachingOverlayView leftAnchor](self, "leftAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:", v61);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v69[2] = v60;
  -[ARCoachingAnimationView topAnchor](self->_coachingAnimationView, "topAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARCoachingOverlayView topAnchor](self, "topAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:", v58);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v69[3] = v56;
  -[ARCoachingAnimationView rightAnchor](self->_coachingAnimationView, "rightAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARCoachingOverlayView rightAnchor](self, "rightAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v54);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v69[4] = v53;
  -[ARCoachingAnimationView bottomAnchor](self->_coachingAnimationView, "bottomAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARCoachingOverlayView bottomAnchor](self, "bottomAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:", v51);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = self->_coachingTextLeftAnchorConstraint;
  v69[5] = v50;
  v69[6] = v37;
  v69[7] = self->_coachingTextRightAnchorConstraint;
  -[UILabel topAnchor](self->_coachingText, "topAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARCoachingOverlayView centerYAnchor](self, "centerYAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:constant:", v38, v36);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v69[8] = v39;
  -[ARCoachingPillButton centerXAnchor](self->_resetButton, "centerXAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARCoachingOverlayView centerXAnchor](self, "centerXAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v69[9] = v42;
  -[ARCoachingPillButton topAnchor](self->_resetButton, "topAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_coachingText, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v44, 1.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v69[10] = v45;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 11);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "activateConstraints:", v46);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "addObserver:selector:name:object:", self, sel_orientationChanged, *MEMORY[0x1E0CEB450], 0);

  v48 = -[ARCoachingState initWithView:]([ARCoachingStateHidden alloc], "initWithView:", self);
  -[ARCoachingOverlayView swapState:](self, "swapState:", v48);

}

- (void)setSessionProvider:(NSObject *)sessionProvider
{
  NSObject *WeakRetained;
  id v5;
  id v6;
  NSObject *obj;

  obj = sessionProvider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_sessionProvider);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_sessionProvider);
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("session"), kARCoachingSessionProviderSessionContext);

    v6 = objc_storeWeak((id *)&self->_sessionProvider, obj);
    -[NSObject addObserver:forKeyPath:options:context:](obj, "addObserver:forKeyPath:options:context:", self, CFSTR("session"), 4, kARCoachingSessionProviderSessionContext);

  }
}

- (void)setSession:(ARSession *)session
{
  ARSession *v5;
  ARSession **p_session;
  ARSession *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  ARCoachingOverlayView *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = session;
  p_session = &self->_session;
  v7 = self->_session;
  if (v7 != v5)
  {
    -[ARSession _removeObserver:](v7, "_removeObserver:", self);
    objc_storeStrong((id *)&self->_session, session);
    -[ARSession _addObserver:](*p_session, "_addObserver:", self);
    -[ARCoachingSessionCache sessionChanged](self->_coachingSessionCache, "sessionChanged");
    if ((isSessionValidForCoaching((uint64_t)*p_session) & 1) != 0)
    {
      self->_goal = validateCoachingGoalForSession(self->_requestedGoal, *p_session);
      _ARLogCoaching_2();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543618;
        v15 = v10;
        v16 = 2048;
        v17 = self;
        _os_log_impl(&dword_1DCC73000, v8, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Restarting coaching due to session change", (uint8_t *)&v14, 0x16u);

      }
      -[ARCoachingOverlayView restartIfActive](self, "restartIfActive");
    }
    else
    {
      _ARLogCoaching_2();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543618;
        v15 = v13;
        v16 = 2048;
        v17 = self;
        _os_log_impl(&dword_1DCC73000, v11, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Deactivating coaching due to invalid session", (uint8_t *)&v14, 0x16u);

      }
      -[ARCoachingOverlayView setActive:animated:](self, "setActive:animated:", 0, 0);
    }
  }

}

- (void)setGoal:(ARCoachingGoal)goal
{
  int64_t v4;
  int64_t v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  ARCoachingOverlayView *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = self->_goal;
  self->_requestedGoal = goal;
  v5 = validateCoachingGoalForSession(goal, self->_session);
  self->_goal = v5;
  if (v4 != v5)
  {
    _ARLogCoaching_2();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v8;
      v11 = 2048;
      v12 = self;
      _os_log_impl(&dword_1DCC73000, v6, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Restarting coaching due to goal change", (uint8_t *)&v9, 0x16u);

    }
    -[ARCoachingOverlayView restartIfActive](self, "restartIfActive");
  }
}

- (BOOL)isActive
{
  return -[ARCoachingState isViewActiveForState](self->_state, "isViewActiveForState");
}

- (void)setActive:(BOOL)active animated:(BOOL)animated
{
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  ARCoachingOverlayView *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (active)
  {
    if ((isSessionValidForCoaching((uint64_t)self->_session) & 1) != 0)
    {
      if (-[ARCoachingOverlayView isRelocalizing](self, "isRelocalizing"))
        v6 = 5;
      else
        v6 = 1;
      -[ARCoachingOverlayView doStateAction:](self, "doStateAction:", v6);
      if (!animated)
      {
        -[ARCoachingOverlayView doStateAction:](self, "doStateAction:", 6);
        -[ARCoachingOverlayView finishAllUIAnimations](self, "finishAllUIAnimations");
      }
    }
    else
    {
      _ARLogCoaching_2();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543618;
        v12 = v10;
        v13 = 2048;
        v14 = self;
        _os_log_impl(&dword_1DCC73000, v8, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Coaching requires an AR session, and must be run on a supported device. Run a session with a valid configuration, and set session or sessionProvider before activation.", (uint8_t *)&v11, 0x16u);

      }
    }
  }
  else
  {
    if (animated)
      v7 = 2;
    else
      v7 = 0;
    -[ARCoachingOverlayView doStateAction:](self, "doStateAction:", v7);
  }
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[ARCoachingAnimationView intrinsicContentSize](self->_coachingAnimationView, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setResetButtonLandscapeVerticalOffset:(float)a3
{
  self->_resetButtonLandscapeVerticalOffset = a3;
  self->_currentConstraintDeviceOrientation = 0;
  -[ARCoachingOverlayView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)setResetButtonPortraitVerticalOffset:(float)a3
{
  self->_resetButtonPortraitVerticalOffset = a3;
  self->_currentConstraintDeviceOrientation = 0;
  -[ARCoachingOverlayView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (BOOL)isUIAnimating
{
  return -[NSMutableArray count](self->_uiAnimationQueue, "count") != 0;
}

- (BOOL)isRelocalizing
{
  BOOL v2;
  void *v4;
  void *v5;
  void *v7;
  void *v8;

  if (self->_trackingStateReasonOverride == 4)
    return 1;
  -[ARSession currentFrame](self->_session, "currentFrame");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (self->_isSessionRelocalizingMap || v4 == 0)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(v4, "camera");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "trackingState") == 1)
    {
      objc_msgSend(v5, "camera");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = objc_msgSend(v8, "trackingStateReason") == 4;

    }
    else
    {
      v2 = 0;
    }

  }
  return v2;
}

- (void)startup
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  ARCoachingFrame *v7;
  void *v8;
  ARCoachingFrame *v9;
  CADisplayLink *v10;
  CADisplayLink *displayLink;
  CADisplayLink *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  ARCoachingOverlayView *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _ARLogCoaching_2();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v5;
    v16 = 2048;
    v17 = self;
    _os_log_impl(&dword_1DCC73000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Start rendering the overlay", (uint8_t *)&v14, 0x16u);

  }
  kdebug_trace();
  self->_wasEverActivated = 1;
  self->_isSessionRelocalizingMap = isSessionLoadingMap(self->_session);
  -[ARCoachingOverlayView generateHeuristicsForActive:](self, "generateHeuristicsForActive:", 1);
  -[ARCoachingAnimationView startCoachingAnimation:](self->_coachingAnimationView, "startCoachingAnimation:", self->_goal);
  -[ARCoachingMotionTracker clear](self->_motionTracker, "clear");
  -[ARCoachingSessionCache clear](self->_coachingSessionCache, "clear");
  self->_nextCoachingMessageType = 0;
  -[ARSession metrics](self->_session, "metrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordCoachingOverlayUsage:", LODWORD(self->_goal));

  v7 = [ARCoachingFrame alloc];
  -[ARSession currentFrame](self->_session, "currentFrame");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ARCoachingFrame initWithFrame:](v7, "initWithFrame:", v8);

  -[ARCoachingHeuristicCollection updateWithFrame:cache:](self->_heuristics, "updateWithFrame:cache:", v9, self->_coachingSessionCache);
  -[ARCoachingMotionTracker updateWithFrame:](self->_motionTracker, "updateWithFrame:", v9);
  -[ARCoachingOverlayView updateCoachingMessagingWithMotionTracker:frame:](self, "updateCoachingMessagingWithMotionTracker:frame:", 1, v9);
  -[ARCoachingOverlayView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  if (!self->_displayLink)
  {
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel_updateFromDisplayLink);
    v10 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    displayLink = self->_displayLink;
    self->_displayLink = v10;

    v12 = self->_displayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v12, "addToRunLoop:forMode:", v13, *MEMORY[0x1E0C99748]);

  }
}

- (void)didMoveToWindow
{
  void *v3;
  CADisplayLink *v4;
  CADisplayLink *displayLink;
  CADisplayLink *v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  ARCoachingOverlayView *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)ARCoachingOverlayView;
  -[ARCoachingOverlayView didMoveToWindow](&v11, sel_didMoveToWindow);
  -[ARCoachingOverlayView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (self->_displayLink)
      return;
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel_updateFromDisplayLink);
    v4 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    displayLink = self->_displayLink;
    self->_displayLink = v4;

    v6 = self->_displayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v6, "addToRunLoop:forMode:", v7, *MEMORY[0x1E0C99748]);
  }
  else
  {
    _ARLogCoaching_2();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v10;
      v14 = 2048;
      v15 = self;
      _os_log_impl(&dword_1DCC73000, v8, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Tearing down because the view no longer has a window.", buf, 0x16u);

    }
    -[CADisplayLink invalidate](self->_displayLink, "invalidate");
    v7 = self->_displayLink;
    self->_displayLink = 0;
  }

}

- (void)teardown
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  CADisplayLink *displayLink;
  ARCoachingFrame *v7;
  void *v8;
  ARCoachingFrame *v9;
  int v10;
  void *v11;
  __int16 v12;
  ARCoachingOverlayView *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _ARLogCoaching_2();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v5;
    v12 = 2048;
    v13 = self;
    _os_log_impl(&dword_1DCC73000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Stop rendering the overlay", (uint8_t *)&v10, 0x16u);

  }
  kdebug_trace();
  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  -[ARCoachingOverlayView killUIAnimations](self, "killUIAnimations");
  -[ARCoachingOverlayView generateHeuristicsForActive:](self, "generateHeuristicsForActive:", 0);
  -[ARCoachingAnimationView killCoachingAnimation](self->_coachingAnimationView, "killCoachingAnimation");
  -[UIView setAlpha:](self->_background, "setAlpha:", 0.0);
  -[UILabel setAlpha:](self->_coachingText, "setAlpha:", 0.0);
  -[ARCoachingPillButton setAlpha:](self->_resetButton, "setAlpha:", 0.0);
  -[ARCoachingPillButton setHidden:](self->_resetButton, "setHidden:", 1);
  self->_nextCoachingMessageType = 0;
  v7 = [ARCoachingFrame alloc];
  -[ARSession currentFrame](self->_session, "currentFrame");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ARCoachingFrame initWithFrame:](v7, "initWithFrame:", v8);

  -[ARCoachingHeuristicCollection updateWithFrame:cache:](self->_heuristics, "updateWithFrame:cache:", v9, self->_coachingSessionCache);
}

- (void)fadeInWithButton:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];

  v3 = a3;
  if (self->_goal == 4)
    -[ARCoachingAnimationView setAlpha:](self->_coachingAnimationView, "setAlpha:", 0.0);
  -[ARCoachingOverlayView calcFadeDurationIn:withButton:](self, "calcFadeDurationIn:withButton:", 1, v3);
  v6 = v5;
  v7 = objc_alloc(MEMORY[0x1E0CEABC8]);
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __42__ARCoachingOverlayView_fadeInWithButton___block_invoke;
  v14[3] = &unk_1EA586888;
  v14[4] = self;
  v9 = (void *)objc_msgSend(v7, "initWithDuration:curve:animations:", 2, v14, v6);
  v10 = v9;
  if (v3)
  {
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __42__ARCoachingOverlayView_fadeInWithButton___block_invoke_2;
    v13[3] = &unk_1EA586888;
    v13[4] = self;
    objc_msgSend(v9, "addAnimations:", v13);
  }
  else
  {
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __42__ARCoachingOverlayView_fadeInWithButton___block_invoke_3;
    v12[3] = &unk_1EA586888;
    v12[4] = self;
    objc_msgSend(v9, "addAnimations:", v12);
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __42__ARCoachingOverlayView_fadeInWithButton___block_invoke_4;
    v11[3] = &unk_1EA5869B8;
    v11[4] = self;
    objc_msgSend(v10, "addCompletion:", v11);
  }
  -[NSMutableArray addObject:](self->_uiAnimationQueue, "addObject:", v10);

}

uint64_t __42__ARCoachingOverlayView_fadeInWithButton___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setAlpha:", 1.0);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", 1.0);
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v3 + 608) == 4)
    return objc_msgSend(*(id *)(v3 + 544), "setAlpha:", 1.0);
  return result;
}

uint64_t __42__ARCoachingOverlayView_fadeInWithButton___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setHidden:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 1.0);
}

uint64_t __42__ARCoachingOverlayView_fadeInWithButton___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 0.0);
}

uint64_t __42__ARCoachingOverlayView_fadeInWithButton___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setHidden:", 1);
}

- (void)fadeOut
{
  double v3;
  double lastCoachingUpdateTime;
  unint64_t v5;
  BOOL v6;
  double v7;
  double v8;
  ARCoachingDelayedAnimation *v9;
  uint64_t v10;
  double v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];

  v3 = CACurrentMediaTime();
  lastCoachingUpdateTime = self->_lastCoachingUpdateTime;
  v5 = -[ARCoachingAnimationView animationState](self->_coachingAnimationView, "animationState");
  v6 = v5 > 6 || ((1 << v5) & 0x52) == 0;
  v7 = fmax(lastCoachingUpdateTime - v3 + 1.0, 0.0);
  if (v6)
    v8 = 0.3;
  else
    v8 = v7;
  -[ARCoachingAnimationView setAnimationState:](self->_coachingAnimationView, "setAnimationState:", 6, 0.3);
  v9 = -[UIViewPropertyAnimator initWithDuration:curve:animations:]([ARCoachingDelayedAnimation alloc], "initWithDuration:curve:animations:", 3, &__block_literal_global_10, 0.0);
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __32__ARCoachingOverlayView_fadeOut__block_invoke_2;
  v15[3] = &unk_1EA5869B8;
  v15[4] = self;
  -[UIViewPropertyAnimator addCompletion:](v9, "addCompletion:", v15);
  -[ARCoachingDelayedAnimation setCoachingDelayTime:](v9, "setCoachingDelayTime:", v3 + v8);
  -[ARCoachingOverlayView calcFadeDurationIn:withButton:](self, "calcFadeDurationIn:withButton:", 0, 0);
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __32__ARCoachingOverlayView_fadeOut__block_invoke_3;
  v14[3] = &unk_1EA586888;
  v14[4] = self;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABC8]), "initWithDuration:curve:animations:", 1, v14, v11);
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __32__ARCoachingOverlayView_fadeOut__block_invoke_4;
  v13[3] = &unk_1EA5869B8;
  v13[4] = self;
  objc_msgSend(v12, "addCompletion:", v13);
  -[NSMutableArray addObject:](self->_uiAnimationQueue, "addObject:", v9);
  -[NSMutableArray addObject:](self->_uiAnimationQueue, "addObject:", v12);

}

uint64_t __32__ARCoachingOverlayView_fadeOut__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "setAnimationState:", 1);
}

uint64_t __32__ARCoachingOverlayView_fadeOut__block_invoke_3(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", 0.0);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 0.0);
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v3 + 608) == 4)
    return objc_msgSend(*(id *)(v3 + 544), "setAlpha:", 0.0);
  return result;
}

uint64_t __32__ARCoachingOverlayView_fadeOut__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setHidden:", 1);
}

- (BOOL)checkActivationHeuristics
{
  if (self->_activatesAutomatically)
    return !-[ARCoachingHeuristic satisfied](self->_heuristics, "satisfied");
  else
    return 0;
}

- (BOOL)checkDeactivationHeuristics
{
  return self->_activatesAutomatically && -[ARCoachingHeuristic satisfied](self->_heuristics, "satisfied");
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v5;
  ARCoachingFrame *v6;
  ARCoachingFrame *v7;
  _QWORD v8[5];
  ARCoachingFrame *v9;

  v5 = a4;
  v6 = -[ARCoachingFrame initWithFrame:]([ARCoachingFrame alloc], "initWithFrame:", v5);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__ARCoachingOverlayView_session_didUpdateFrame___block_invoke;
  v8[3] = &unk_1EA5868F8;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __48__ARCoachingOverlayView_session_didUpdateFrame___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "frameWithOverrides:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "updateWithFrame:", v2);

}

- (id)frameWithOverrides:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  int64_t trackingStateReasonOverride;
  void *v17;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  int64_t geoTrackingStateOverride;
  int64_t v23;
  void *v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  int64_t geoTrackingStateReasonOverride;
  int64_t v29;
  void *v30;
  int v32;
  void *v33;
  __int16 v34;
  ARCoachingOverlayView *v35;
  __int16 v36;
  int64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_trackingStateNormalOverride)
  {
    _ARLogCoaching_2();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543618;
      v33 = v7;
      v34 = 2048;
      v35 = self;
      _os_log_impl(&dword_1DCC73000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Overriding ARFrame tracking state to be .normal", (uint8_t *)&v32, 0x16u);

    }
    objc_msgSend(v4, "camera");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTrackingState:", 2);

    objc_msgSend(v4, "camera");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = 0;
  }
  else
  {
    if (!self->_trackingStateReasonOverride)
    {
      if (!self->_geoTrackingStateOverrideEnabled && !self->_geoTrackingStateReasonOverrideEnabled)
        return v4;
      goto LABEL_10;
    }
    _ARLogCoaching_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543618;
      v33 = v14;
      v34 = 2048;
      v35 = self;
      _os_log_impl(&dword_1DCC73000, v12, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Overriding ARFrame tracking state to be .limited", (uint8_t *)&v32, 0x16u);

    }
    objc_msgSend(v4, "camera");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTrackingState:", 1);

    trackingStateReasonOverride = self->_trackingStateReasonOverride;
    objc_msgSend(v4, "camera");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = trackingStateReasonOverride;
  }
  objc_msgSend(v9, "setTrackingStateReason:", v11);

LABEL_10:
  objc_msgSend(v4, "geoTrackingStatus");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CF2108], "initialStatus");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setGeoTrackingStatus:", v18);

  }
  if (self->_geoTrackingStateOverrideEnabled)
  {
    _ARLogCoaching_2();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      geoTrackingStateOverride = self->_geoTrackingStateOverride;
      v32 = 138543874;
      v33 = v21;
      v34 = 2048;
      v35 = self;
      v36 = 2048;
      v37 = geoTrackingStateOverride;
      _os_log_impl(&dword_1DCC73000, v19, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Overriding ARFrame geo tracking state to be state %ld", (uint8_t *)&v32, 0x20u);

    }
    v23 = self->_geoTrackingStateOverride;
    objc_msgSend(v4, "geoTrackingStatus");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setState:", v23);

  }
  if (self->_geoTrackingStateReasonOverrideEnabled)
  {
    _ARLogCoaching_2();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      geoTrackingStateReasonOverride = self->_geoTrackingStateReasonOverride;
      v32 = 138543874;
      v33 = v27;
      v34 = 2048;
      v35 = self;
      v36 = 2048;
      v37 = geoTrackingStateReasonOverride;
      _os_log_impl(&dword_1DCC73000, v25, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Overriding ARFrame geo tracking state reason to be state %ld", (uint8_t *)&v32, 0x20u);

    }
    v29 = self->_geoTrackingStateReasonOverride;
    objc_msgSend(v4, "geoTrackingStatus");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setStateReason:", v29);

  }
  return v4;
}

- (void)session:(id)a3 willRunWithConfiguration:(id)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__ARCoachingOverlayView_session_willRunWithConfiguration___block_invoke;
  block[3] = &unk_1EA586888;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __58__ARCoachingOverlayView_session_willRunWithConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 608);
  result = validateCoachingGoalForSession(*(_QWORD *)(v2 + 472), *(void **)(v2 + 600));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 608) = result;
  if (v3 != *(_QWORD *)(*(_QWORD *)(a1 + 32) + 608))
  {
    _ARLogCoaching_2();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138543618;
      v10 = v7;
      v11 = 2048;
      v12 = v8;
      _os_log_impl(&dword_1DCC73000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Restarting coaching after configuration change resulted in goal change", (uint8_t *)&v9, 0x16u);

    }
    return objc_msgSend(*(id *)(a1 + 32), "restartIfActive");
  }
  return result;
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  ARCoachingOverlayView *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _ARLogCoaching_2();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v8;
    v14 = 2048;
    v15 = self;
    _os_log_impl(&dword_1DCC73000, v6, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Coaching recieved session failure callback", buf, 0x16u);

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__ARCoachingOverlayView_session_didFailWithError___block_invoke;
  v10[3] = &unk_1EA5868F8;
  v10[4] = self;
  v11 = v5;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

uint64_t __50__ARCoachingOverlayView_session_didFailWithError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v8;
  NSObject *v9;
  _BOOL4 v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  uint64_t v19;
  objc_class *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  uint64_t v27;
  int v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  _ARLogCoaching_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v28 = 138543874;
    v29 = v4;
    v30 = 2048;
    v31 = v5;
    v32 = 2112;
    v33 = v6;
    _os_log_impl(&dword_1DCC73000, v2, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Processing session failure for coaching\n%@", (uint8_t *)&v28, 0x20u);

  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 608) = validateCoachingGoalForSession(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 472), *(void **)(*(_QWORD *)(a1 + 32) + 600));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  _ARLogCoaching_2();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if ((v8 & 1) != 0)
  {
    if (v10)
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 32);
      v28 = 138543618;
      v29 = v12;
      v30 = 2048;
      v31 = v13;
      _os_log_impl(&dword_1DCC73000, v9, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Asking delegate if we should show coaching session failure UI", (uint8_t *)&v28, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "coachingOverlayViewShouldShowSessionFailure:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    if ((v15 & 1) != 0)
    {
      _ARLogCoaching_2();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *(_QWORD *)(a1 + 32);
        v28 = 138543618;
        v29 = v18;
        v30 = 2048;
        v31 = v19;
        _os_log_impl(&dword_1DCC73000, v16, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Preparing to show coaching session failure UI", (uint8_t *)&v28, 0x16u);

      }
      return objc_msgSend(*(id *)(a1 + 32), "doStateAction:", 7);
    }
  }
  else
  {
    if (v10)
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(a1 + 32);
      v28 = 138543618;
      v29 = v22;
      v30 = 2048;
      v31 = v23;
      _os_log_impl(&dword_1DCC73000, v9, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Coaching delegate does not implement coaching session UI callback", (uint8_t *)&v28, 0x16u);

    }
  }
  _ARLogCoaching_2();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *(_QWORD *)(a1 + 32);
    v28 = 138543618;
    v29 = v26;
    v30 = 2048;
    v31 = v27;
    _os_log_impl(&dword_1DCC73000, v24, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Deactivating coaching due to session failure", (uint8_t *)&v28, 0x16u);

  }
  return objc_msgSend(*(id *)(a1 + 32), "setActive:animated:", 0, 0);
}

- (void)session:(id)a3 didRemoveAnchors:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__ARCoachingOverlayView_session_didRemoveAnchors___block_invoke;
  v7[3] = &unk_1EA5868F8;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __50__ARCoachingOverlayView_session_didRemoveAnchors___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 616), "anchorsRemoved:", *(_QWORD *)(a1 + 40));
}

- (void)session:(id)a3 didAddAnchors:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__ARCoachingOverlayView_session_didAddAnchors___block_invoke;
  v7[3] = &unk_1EA5868F8;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __47__ARCoachingOverlayView_session_didAddAnchors___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 616), "anchorsAdded:", *(_QWORD *)(a1 + 40));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  id WeakRetained;
  objc_super v9;

  if ((void *)kARCoachingSessionProviderSessionContext == a6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_sessionProvider);
    objc_msgSend(WeakRetained, "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARCoachingOverlayView setSession:](self, "setSession:", v7);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ARCoachingOverlayView;
    -[ARCoachingOverlayView observeValueForKeyPath:ofObject:change:context:](&v9, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)restartIfActive
{
  -[ARCoachingOverlayView doStateAction:](self, "doStateAction:", 8);
  if (-[ARCoachingOverlayView isActive](self, "isActive"))
    -[ARCoachingOverlayView startup](self, "startup");
  else
    -[ARCoachingOverlayView generateHeuristicsForActive:](self, "generateHeuristicsForActive:", 0);
}

- (void)resolveCoachingMessageWithFrame:(id)a3
{
  id v4;
  uint64_t v5;
  int64_t coachingRequirements;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  ARCoachingOverlayView *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;

  v4 = a3;
  v28 = v4;
  switch(self->_goal)
  {
    case 0:
    case 1:
      v5 = 2;
      goto LABEL_6;
    case 2:
      v5 = 3;
      goto LABEL_6;
    case 3:
      v5 = 5;
      goto LABEL_6;
    case 4:
      objc_msgSend(v4, "geoTrackingStatus");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        v16 = 6;
        goto LABEL_44;
      }
      objc_msgSend(v28, "geoTrackingStatus");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "stateReason");

      if (v21 == 7)
      {
        v16 = 8;
        goto LABEL_44;
      }
      objc_msgSend(v28, "geoTrackingStatus");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "stateReason") == 3)
      {
        objc_msgSend(v28, "camera");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "trackingStateReason") == 1)
        {

LABEL_40:
          v16 = 9;
          goto LABEL_44;
        }
        objc_msgSend(v28, "camera");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "trackingStateReason");

        if (v25 == 2)
          goto LABEL_40;
      }
      else
      {

      }
      objc_msgSend(v28, "geoTrackingStatus");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "stateReason");

      if (v27 == 8)
        v16 = 7;
      else
        v16 = 6;
LABEL_44:
      v18 = self;
      v17 = 7;
LABEL_30:
      -[ARCoachingOverlayView setCoachingMessage:animationState:](v18, "setCoachingMessage:animationState:", v16, v17);

      return;
    default:
      v5 = 4;
LABEL_6:
      coachingRequirements = self->_coachingRequirements;
      v7 = 2;
      v8 = 3;
      v9 = 4;
      v10 = 1;
      if ((coachingRequirements & 0x20) != 0)
        v11 = 4;
      else
        v11 = v5;
      if ((coachingRequirements & 0x20) != 0)
        v10 = 4;
      else
        v9 = 2;
      if ((coachingRequirements & 0x10) == 0)
      {
        v5 = v11;
        v8 = v10;
        v7 = v9;
      }
      if ((coachingRequirements & 0x40) != 0)
        v12 = 6;
      else
        v12 = v5;
      if ((coachingRequirements & 0x40) != 0)
        v13 = 5;
      else
        v13 = v8;
      if ((coachingRequirements & 0x40) != 0)
        v14 = 5;
      else
        v14 = v7;
      v15 = -[ARCoachingMotionTracker isMoving](self->_motionTracker, "isMoving");
      if (v15)
        v16 = v14;
      else
        v16 = v13;
      if (v15)
        v17 = 4;
      else
        v17 = v12;
      v18 = self;
      goto LABEL_30;
  }
}

- (void)setCoachingMessage:(int64_t)a3 animationState:(int64_t)a4
{
  CFTimeInterval v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  ARCoachingOverlayView *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (self->_coachingMessageType != a3
    || -[ARCoachingAnimationView animationState](self->_coachingAnimationView, "animationState") != a4)
  {
    v7 = CACurrentMediaTime();
    if (-[ARCoachingOverlayView isHidden](self, "isHidden"))
    {
      self->_coachingMessageType = a3;
      getCoachingText(a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](self->_coachingText, "setText:", v8);

      if (-[ARCoachingOverlayView hideCoachingMessageLabel](self, "hideCoachingMessageLabel"))
      {
        -[ARCoachingOverlayView delegate](self, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_opt_respondsToSelector();

        if ((v10 & 1) != 0)
        {
          _ARLogCoaching_2();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            v12 = (objc_class *)objc_opt_class();
            NSStringFromClass(v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = 138543618;
            v24 = v13;
            v25 = 2048;
            v26 = self;
            _os_log_impl(&dword_1DCC73000, v11, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Asking delegate to display the coaching message", (uint8_t *)&v23, 0x16u);

          }
          -[ARCoachingOverlayView delegate](self, "delegate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          getCoachingText(a3);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "displayCoachingMessage:forCoachingView:", v15, self);

        }
      }
    }
    else
    {
      if (v7 - self->_lastCoachingUpdateTime < 1.0)
      {
        self->_nextCoachingMessageType = a3;
        self->_nextCoachingAnimationState = a4;
        return;
      }
      -[ARCoachingOverlayView crossFadeCoachingMessage:](self, "crossFadeCoachingMessage:", a3);
      if (-[ARCoachingOverlayView hideCoachingMessageLabel](self, "hideCoachingMessageLabel"))
      {
        -[ARCoachingOverlayView delegate](self, "delegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_opt_respondsToSelector();

        if ((v17 & 1) != 0)
        {
          _ARLogCoaching_2();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            v19 = (objc_class *)objc_opt_class();
            NSStringFromClass(v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = 138543618;
            v24 = v20;
            v25 = 2048;
            v26 = self;
            _os_log_impl(&dword_1DCC73000, v18, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Asking delegate to display the coaching message", (uint8_t *)&v23, 0x16u);

          }
          -[ARCoachingOverlayView delegate](self, "delegate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          getCoachingText(a3);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "displayCoachingMessage:forCoachingView:", v22, self);

        }
      }
    }
    -[ARCoachingAnimationView setAnimationState:](self->_coachingAnimationView, "setAnimationState:", a4);
    self->_nextCoachingMessageType = 0;
    self->_lastCoachingUpdateTime = v7;
  }
}

- (void)crossFadeCoachingMessage:(int64_t)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[6];
  _QWORD v10[5];

  if (self->_coachingMessageType != a3)
  {
    self->_coachingMessageType = a3;
    v5 = objc_alloc(MEMORY[0x1E0CEABC8]);
    v6 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50__ARCoachingOverlayView_crossFadeCoachingMessage___block_invoke;
    v10[3] = &unk_1EA586888;
    v10[4] = self;
    v7 = (void *)objc_msgSend(v5, "initWithDuration:curve:animations:", 1, v10, 0.15);
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __50__ARCoachingOverlayView_crossFadeCoachingMessage___block_invoke_2;
    v9[3] = &unk_1EA586A00;
    v9[4] = self;
    v9[5] = a3;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABC8]), "initWithDuration:curve:animations:", 2, v9, 0.15);
    -[NSMutableArray addObject:](self->_uiAnimationQueue, "addObject:", v7);
    -[NSMutableArray addObject:](self->_uiAnimationQueue, "addObject:", v8);

  }
}

uint64_t __50__ARCoachingOverlayView_crossFadeCoachingMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", 0.0);
}

uint64_t __50__ARCoachingOverlayView_crossFadeCoachingMessage___block_invoke_2(uint64_t a1)
{
  void *v2;

  getCoachingText(*(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setText:", v2);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", 1.0);
}

- (void)doStateAction:(int64_t)a3
{
  void *v4;
  void *v5;

  -[ARCoachingState doAction:](self->_state, "doAction:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[ARCoachingOverlayView swapState:](self, "swapState:", v4);
    v4 = v5;
  }

}

- (void)swapState:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  ARCoachingOverlayView *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[ARCoachingState exit](self->_state, "exit");
  _ARLogCoaching_2();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543874;
    v17 = v8;
    v18 = 2048;
    v19 = self;
    v20 = 2112;
    v21 = v10;
    _os_log_impl(&dword_1DCC73000, v6, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Exited coaching state %@", (uint8_t *)&v16, 0x20u);

  }
  objc_storeStrong((id *)&self->_state, a3);
  objc_opt_class();
  -[ARCoachingAnimationView setIsDeactivating:](self->_coachingAnimationView, "setIsDeactivating:", objc_opt_isKindOfClass() & 1);
  -[ARCoachingState enter](self->_state, "enter");
  _ARLogCoaching_2();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543874;
    v17 = v13;
    v18 = 2048;
    v19 = self;
    v20 = 2112;
    v21 = v15;
    _os_log_impl(&dword_1DCC73000, v11, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Entered coaching state %@", (uint8_t *)&v16, 0x20u);

  }
}

- (void)updateWithFrame:(id)a3
{
  id v4;

  v4 = a3;
  -[ARCoachingHeuristicCollection updateWithFrame:cache:](self->_heuristics, "updateWithFrame:cache:");
  -[ARCoachingOverlayView doStateAction:](self, "doStateAction:", 4);
  if (-[ARCoachingOverlayView isActive](self, "isActive"))
  {
    -[ARCoachingAnimationView updateWithFrame:motionTracker:](self->_coachingAnimationView, "updateWithFrame:motionTracker:", v4, self->_motionTracker);
    -[ARCoachingMotionTracker updateWithFrame:](self->_motionTracker, "updateWithFrame:", v4);
    -[ARCoachingOverlayView updateCoachingMessagingWithMotionTracker:frame:](self, "updateCoachingMessagingWithMotionTracker:frame:", 1, v4);
  }

}

- (void)updateFromDisplayLink
{
  ARCoachingFrame *v3;
  void *v4;
  void *v5;
  ARCoachingFrame *v6;

  if (self->_wasEverActivated)
  {
    -[ARCoachingOverlayView doStateAction:](self, "doStateAction:", 3);
    v3 = [ARCoachingFrame alloc];
    -[ARSession currentFrame](self->_session, "currentFrame");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[ARCoachingFrame initWithFrame:](v3, "initWithFrame:", v4);

    -[ARCoachingOverlayView frameWithOverrides:](self, "frameWithOverrides:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARCoachingOverlayView updateCoachingMessagingWithMotionTracker:frame:](self, "updateCoachingMessagingWithMotionTracker:frame:", 0, v5);
    -[ARCoachingOverlayView updateUIAnimations](self, "updateUIAnimations");

  }
}

- (void)updateCoachingMessagingWithMotionTracker:(BOOL)a3 frame:(id)a4
{
  _BOOL4 v4;
  int64_t coachingRequirements;
  int64_t v7;
  int64_t v8;
  int64_t nextCoachingMessageType;
  UILabel **p_coachingText;
  uint64_t v11;
  id v12;

  v4 = a3;
  v12 = a4;
  coachingRequirements = self->_coachingRequirements;
  v7 = -[ARCoachingState requirements](self->_state, "requirements");
  v8 = -[ARCoachingHeuristicCollection requirements](self->_heuristics, "requirements") | v7;
  self->_coachingRequirements = v8;
  if (v4
    && (-[ARCoachingMotionTracker didStartMoving](self->_motionTracker, "didStartMoving")
     || -[ARCoachingMotionTracker didStopMoving](self->_motionTracker, "didStopMoving"))
    || v8 != coachingRequirements
    || self->_goal == 4)
  {
    -[ARCoachingOverlayView resolveCoachingMessageWithFrame:](self, "resolveCoachingMessageWithFrame:", v12);
  }
  nextCoachingMessageType = self->_nextCoachingMessageType;
  if (nextCoachingMessageType)
    -[ARCoachingOverlayView setCoachingMessage:animationState:](self, "setCoachingMessage:animationState:", nextCoachingMessageType, self->_nextCoachingAnimationState);
  if (-[ARCoachingOverlayView hideCoachingMessageLabel](self, "hideCoachingMessageLabel"))
  {
    p_coachingText = &self->_coachingText;
    if (!-[UILabel isHidden](self->_coachingText, "isHidden"))
    {
      v11 = 1;
      goto LABEL_15;
    }
  }
  if (!-[ARCoachingOverlayView hideCoachingMessageLabel](self, "hideCoachingMessageLabel"))
  {
    p_coachingText = &self->_coachingText;
    if (-[UILabel isHidden](self->_coachingText, "isHidden"))
    {
      v11 = 0;
LABEL_15:
      -[UILabel setHidden:](*p_coachingText, "setHidden:", v11);
    }
  }

}

- (double)calcFadeDurationIn:(BOOL)a3 withButton:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v4 = a4;
  v5 = a3;
  -[UIView alpha](self->_background, "alpha");
  if (v5)
  {
    v8 = fmax(1.0 - v7, 0.0);
    -[UILabel alpha](self->_coachingText, "alpha");
    v10 = fmax(v8, 1.0 - v9);
    if (v4)
    {
      -[ARCoachingPillButton alpha](self->_resetButton, "alpha");
      v12 = 1.0 - v11;
      goto LABEL_6;
    }
  }
  else
  {
    v13 = fmax(v7, 0.0);
    -[UILabel alpha](self->_coachingText, "alpha");
    v10 = fmax(v13, v14);
  }
  -[ARCoachingPillButton alpha](self->_resetButton, "alpha");
LABEL_6:
  v15 = fmax(v10, v12);
  v16 = 0.3;
  if (!v5)
    v16 = 0.75;
  return v16 * v15;
}

- (void)generateHeuristicsForActive:(BOOL)a3
{
  _BOOL4 v3;
  ARCoachingHeuristicCollection *heuristics;
  ARCoachingHeuristicDelay *v6;
  ARCoachingHeuristicCollection *v7;
  __objc2_class *v8;
  ARCoachingHeuristicCollection *v9;
  ARCoachingHeuristicTracking *v10;
  ARCoachingHeuristicCollection *v11;
  ARCoachingHeuristicTracking *v12;
  ARCoachingHeuristicCollection *v13;
  ARCoachingHeuristicTracking *v14;
  id v15;

  v3 = a3;
  -[ARCoachingHeuristicCollection clear](self->_heuristics, "clear");
  if (v3)
  {
    heuristics = self->_heuristics;
    v6 = -[ARCoachingHeuristicDelay initWithDuration:]([ARCoachingHeuristicDelay alloc], "initWithDuration:", 1.0);
    -[ARCoachingHeuristicCollection addHeuristic:](heuristics, "addHeuristic:", v6);

  }
  switch(self->_goal)
  {
    case 0:
      v7 = self->_heuristics;
      v8 = ARCoachingHeuristicTracking;
      goto LABEL_9;
    case 1:
      v9 = self->_heuristics;
      v10 = objc_alloc_init(ARCoachingHeuristicTracking);
      -[ARCoachingHeuristicCollection addHeuristic:](v9, "addHeuristic:", v10);

      v7 = self->_heuristics;
      v8 = ARCoachingHeuristicHorizontalPlane;
      goto LABEL_9;
    case 2:
      v11 = self->_heuristics;
      v12 = objc_alloc_init(ARCoachingHeuristicTracking);
      -[ARCoachingHeuristicCollection addHeuristic:](v11, "addHeuristic:", v12);

      v7 = self->_heuristics;
      v8 = ARCoachingHeuristicVerticalPlane;
      goto LABEL_9;
    case 3:
      v13 = self->_heuristics;
      v14 = objc_alloc_init(ARCoachingHeuristicTracking);
      -[ARCoachingHeuristicCollection addHeuristic:](v13, "addHeuristic:", v14);

      v7 = self->_heuristics;
      v8 = ARCoachingHeuristicAnyPlane;
      goto LABEL_9;
    case 4:
      v7 = self->_heuristics;
      v8 = ARCoachingHeuristicGeoTracking;
LABEL_9:
      v15 = objc_alloc_init(v8);
      -[ARCoachingHeuristicCollection addHeuristic:](v7, "addHeuristic:");

      break;
    default:
      return;
  }
}

- (void)buttonPress:(id)a3
{
  ARCoachingPillButton *v4;
  id WeakRetained;
  char v6;
  void *v7;
  ARSession *session;
  ARCoachingPillButton *v9;

  v4 = (ARCoachingPillButton *)a3;
  if (self->_resetButton == v4)
  {
    v9 = v4;
    if (self->_activatesAutomatically)
      -[ARCoachingOverlayView setActive:animated:](self, "setActive:animated:", 0, 1);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v7, "coachingOverlayViewDidRequestSessionReset:", self);
    }
    else
    {
      session = self->_session;
      -[ARSession configuration](session, "configuration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARSession runWithConfiguration:options:](session, "runWithConfiguration:options:", v7, 3);
    }

    v4 = v9;
  }

}

- (void)updateUIAnimations
{
  id v3;
  double v4;
  double v5;
  double v6;
  id v7;

  if (-[NSMutableArray count](self->_uiAnimationQueue, "count"))
  {
    while (1)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_uiAnimationQueue, "objectAtIndexedSubscript:", 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isRunning") & 1) != 0)
        break;
      if (!self->_uiAnimationQueueRunning)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (v3 = v7,
              v4 = CACurrentMediaTime(),
              objc_msgSend(v3, "coachingDelayTime"),
              v6 = v5,
              v3,
              v6 <= v4))
        {
          objc_msgSend(v7, "startAnimation");
          self->_uiAnimationQueueRunning = 1;
        }
        break;
      }
      -[NSMutableArray removeObjectAtIndex:](self->_uiAnimationQueue, "removeObjectAtIndex:", 0);
      self->_uiAnimationQueueRunning = 0;

      if (!-[NSMutableArray count](self->_uiAnimationQueue, "count"))
        return;
    }

  }
}

- (void)killUIAnimations
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_uiAnimationQueue;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "isRunning", (_QWORD)v9))
          objc_msgSend(v8, "stopAnimation:", 1);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_uiAnimationQueue, "removeAllObjects");
  self->_uiAnimationQueueRunning = 0;
}

- (void)finishAllUIAnimations
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_uiAnimationQueue;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "isRunning", (_QWORD)v9))
        {
          objc_msgSend(v8, "stopAnimation:", 1);
        }
        else
        {
          objc_msgSend(v8, "startAnimation");
          objc_msgSend(v8, "stopAnimation:", 0);
          objc_msgSend(v8, "finishAnimationAtPosition:", 0);
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_uiAnimationQueue, "removeAllObjects");
  self->_uiAnimationQueueRunning = 0;
}

- (void)orientationChanged
{
  -[ARCoachingAnimationView orientationChanged](self->_coachingAnimationView, "orientationChanged");
  -[ARCoachingOverlayView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ARCoachingOverlayView;
  -[ARCoachingOverlayView layoutSubviews](&v7, sel_layoutSubviews);
  -[ARCoachingOverlayView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[ARCoachingOverlayView bounds](self, "bounds");
  v4 = v3;
  -[ARCoachingOverlayView bounds](self, "bounds");
  if (v4 >= v5)
    v6 = v4;
  else
    v6 = v5;
  -[UIView setBounds:](self->_background, "setBounds:", 0.0, 0.0, v6 * 1.25, v6 * 1.25);
}

- (int64_t)currentDeviceOrientation
{
  void *v3;
  uint64_t currentConstraintDeviceOrientation;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  currentConstraintDeviceOrientation = objc_msgSend(v3, "orientation");

  if ((unint64_t)(currentConstraintDeviceOrientation - 1) >= 4)
  {
    currentConstraintDeviceOrientation = self->_currentConstraintDeviceOrientation;
    if ((unint64_t)(currentConstraintDeviceOrientation - 1) >= 4)
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "connectedScenes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v15;
        while (2)
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v15 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
            if (objc_msgSend(v11, "isMemberOfClass:", objc_opt_class()))
            {
              v12 = objc_msgSend(v11, "interfaceOrientation");
              if ((unint64_t)(v12 - 1) < 4)
              {
                currentConstraintDeviceOrientation = v12;
                goto LABEL_14;
              }
            }
            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v8)
            continue;
          break;
        }
      }
      currentConstraintDeviceOrientation = 1;
LABEL_14:

    }
  }
  return currentConstraintDeviceOrientation;
}

- (void)updateConstraints
{
  int64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ARCoachingOverlayView;
  -[ARCoachingOverlayView updateConstraints](&v4, sel_updateConstraints);
  v3 = -[ARCoachingOverlayView currentDeviceOrientation](self, "currentDeviceOrientation");
  if (v3 != self->_currentConstraintDeviceOrientation)
    -[ARCoachingOverlayView createConstraintsForDeviceOrientation:](self, "createConstraintsForDeviceOrientation:", v3);
}

- (void)createConstraintsForDeviceOrientation:(int64_t)a3
{
  void *v5;
  int *v6;
  float v7;
  void *v8;
  void *v9;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *resetButtonBottomLayoutConstraint;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  ARCoachingOverlayView *v16;
  int8x8_t v17;

  -[ARCoachingOverlayView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __63__ARCoachingOverlayView_createConstraintsForDeviceOrientation___block_invoke;
  v15 = &unk_1EA586A00;
  v16 = self;
  v17 = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32((unint64_t)(a3 - 3) < 2), 0x1FuLL)), (int8x8_t)0x43670000C3670000, (int8x8_t)0x431A0000C31A0000);
  if ((unint64_t)(a3 - 3) >= 2)
    v6 = &OBJC_IVAR___ARCoachingOverlayView__resetButtonPortraitVerticalOffset;
  else
    v6 = &OBJC_IVAR___ARCoachingOverlayView__resetButtonLandscapeVerticalOffset;
  dispatch_async(MEMORY[0x1E0C80D38], &v12);
  v7 = *(float *)((char *)&self->super.super.super.isa + *v6);
  -[NSLayoutConstraint setActive:](self->_resetButtonBottomLayoutConstraint, "setActive:", 0, v12, v13, v14, v15, v16, *(_QWORD *)&v17);
  -[ARCoachingPillButton bottomAnchor](self->_resetButton, "bottomAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintGreaterThanOrEqualToAnchor:constant:", v9, (float)-v7);
  v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  resetButtonBottomLayoutConstraint = self->_resetButtonBottomLayoutConstraint;
  self->_resetButtonBottomLayoutConstraint = v10;

  -[NSLayoutConstraint setActive:](self->_resetButtonBottomLayoutConstraint, "setActive:", 1);
  self->_currentConstraintDeviceOrientation = a3;

}

uint64_t __63__ARCoachingOverlayView_createConstraintsForDeviceOrientation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "setActive:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "setActive:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "leftAnchor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "centerXAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constraintEqualToAnchor:constant:", v3, *(float *)(a1 + 40));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 528);
  *(_QWORD *)(v5 + 528) = v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "rightAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "centerXAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, *(float *)(a1 + 44));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 536);
  *(_QWORD *)(v10 + 536) = v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "setActive:", 1);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "setActive:", 1);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (NSObject)sessionProvider
{
  return objc_loadWeakRetained((id *)&self->_sessionProvider);
}

- (ARSession)session
{
  return self->_session;
}

- (ARCoachingGoal)goal
{
  return self->_goal;
}

- (BOOL)activatesAutomatically
{
  return self->_activatesAutomatically;
}

- (void)setActivatesAutomatically:(BOOL)activatesAutomatically
{
  self->_activatesAutomatically = activatesAutomatically;
}

- (BOOL)wasEverActivated
{
  return self->_wasEverActivated;
}

- (ARCoachingSessionCache)coachingSessionCache
{
  return self->_coachingSessionCache;
}

- (int64_t)trackingStateReasonOverride
{
  return self->_trackingStateReasonOverride;
}

- (void)setTrackingStateReasonOverride:(int64_t)a3
{
  self->_trackingStateReasonOverride = a3;
}

- (BOOL)trackingStateNormalOverride
{
  return self->_trackingStateNormalOverride;
}

- (void)setTrackingStateNormalOverride:(BOOL)a3
{
  self->_trackingStateNormalOverride = a3;
}

- (BOOL)geoTrackingStateOverrideEnabled
{
  return self->_geoTrackingStateOverrideEnabled;
}

- (void)setGeoTrackingStateOverrideEnabled:(BOOL)a3
{
  self->_geoTrackingStateOverrideEnabled = a3;
}

- (int64_t)geoTrackingStateOverride
{
  return self->_geoTrackingStateOverride;
}

- (void)setGeoTrackingStateOverride:(int64_t)a3
{
  self->_geoTrackingStateOverride = a3;
}

- (BOOL)geoTrackingStateReasonOverrideEnabled
{
  return self->_geoTrackingStateReasonOverrideEnabled;
}

- (void)setGeoTrackingStateReasonOverrideEnabled:(BOOL)a3
{
  self->_geoTrackingStateReasonOverrideEnabled = a3;
}

- (int64_t)geoTrackingStateReasonOverride
{
  return self->_geoTrackingStateReasonOverride;
}

- (void)setGeoTrackingStateReasonOverride:(int64_t)a3
{
  self->_geoTrackingStateReasonOverride = a3;
}

- (float)resetButtonLandscapeVerticalOffset
{
  return self->_resetButtonLandscapeVerticalOffset;
}

- (float)resetButtonPortraitVerticalOffset
{
  return self->_resetButtonPortraitVerticalOffset;
}

- (BOOL)hideCoachingMessageLabel
{
  return self->_hideCoachingMessageLabel;
}

- (void)setHideCoachingMessageLabel:(BOOL)a3
{
  self->_hideCoachingMessageLabel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coachingSessionCache, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_destroyWeak((id *)&self->_sessionProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_uiAnimationQueue, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_coachingAnimationView, 0);
  objc_storeStrong((id *)&self->_coachingTextRightAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_coachingTextLeftAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_resetButtonBottomLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_motionTracker, 0);
  objc_storeStrong((id *)&self->_heuristics, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_resetButton, 0);
  objc_storeStrong((id *)&self->_coachingText, 0);
  objc_storeStrong((id *)&self->_background, 0);
}

@end
