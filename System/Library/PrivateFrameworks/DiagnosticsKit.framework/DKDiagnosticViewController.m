@implementation DKDiagnosticViewController

- (DKDiagnosticViewController)init
{
  DKDiagnosticViewController *v2;
  DKDiagnosticViewController *v3;
  NSLock *v4;
  NSLock *finishedLock;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DKDiagnosticViewController;
  v2 = -[DKDiagnosticViewController init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_cancelled = 0;
    v2->_setup = 0;
    v2->_finished = 0;
    v4 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    finishedLock = v3->_finishedLock;
    v3->_finishedLock = v4;

    v3->_shouldShowPressHomeLabel = 1;
  }
  return v3;
}

- (void)viewDidLoad
{
  dispatch_time_t v3;
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DKDiagnosticViewController;
  -[DKDiagnosticViewController viewDidLoad](&v5, sel_viewDidLoad);
  v3 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__DKDiagnosticViewController_viewDidLoad__block_invoke;
  block[3] = &unk_24F99AA50;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x24BDAC9B8], block);
}

uint64_t __41__DKDiagnosticViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "displayPressHomeLabelFor:", 4.0);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  int v7;
  void *v8;
  void *v9;
  objc_super v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  Class (*v16)(uint64_t);
  void *v17;
  uint64_t *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)DKDiagnosticViewController;
  -[DKDiagnosticViewController viewWillAppear:](&v10, sel_viewWillAppear_, a3);
  -[DKDiagnosticViewController context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsPresentingView:", 1);

  if (!CheckerBoardServicesLibraryCore_frameworkLibrary)
  {
    v15 = xmmword_24F99AA90;
    v16 = 0;
    CheckerBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (CheckerBoardServicesLibraryCore_frameworkLibrary)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2050000000;
    v5 = (void *)getCBSUtilitiesClass_softClass;
    v14 = getCBSUtilitiesClass_softClass;
    if (!getCBSUtilitiesClass_softClass)
    {
      *(_QWORD *)&v15 = MEMORY[0x24BDAC760];
      *((_QWORD *)&v15 + 1) = 3221225472;
      v16 = __getCBSUtilitiesClass_block_invoke;
      v17 = &unk_24F99AAB0;
      v18 = &v11;
      __getCBSUtilitiesClass_block_invoke((uint64_t)&v15);
      v5 = (void *)v12[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v11, 8);
    if (objc_msgSend(v6, "isCheckerBoardActive"))
    {
      v7 = -[DKDiagnosticViewController prefersStatusBarHidden](self, "prefersStatusBarHidden");
      -[DKDiagnosticViewController context](self, "context");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v7)
      {
        objc_msgSend(v8, "hideStatusBar");
      }
      else
      {
        objc_msgSend(v8, "showStatusBar");

        -[DKDiagnosticViewController context](self, "context");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setStatusBarStyle:", -[DKDiagnosticViewController preferredStatusBarStyle](self, "preferredStatusBarStyle"));
      }

    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DKDiagnosticViewController;
  -[DKDiagnosticViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[DKDiagnosticViewController context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsPresentingView:", 0);

}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4;
  id v5;
  DKMutableDiagnosticResult *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DKDiagnosticViewController;
  v4 = a3;
  -[DKDiagnosticViewController beginRequestWithExtensionContext:](&v7, sel_beginRequestWithExtensionContext_, v4);
  -[DKDiagnosticViewController setContext:](self, "setContext:", v4, v7.receiver, v7.super_class);

  v5 = objc_alloc_init(MEMORY[0x24BDD1768]);
  -[DKDiagnosticViewController setProgress:](self, "setProgress:", v5);

  v6 = objc_alloc_init(DKMutableDiagnosticResult);
  -[DKDiagnosticViewController setResult:](self, "setResult:", v6);

  -[DKDiagnosticViewController monitorIncomingCall](self, "monitorIncomingCall");
}

- (void)setFinished:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];

  v3 = a3;
  -[DKDiagnosticViewController finishedLock](self, "finishedLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  if (self->_finished || !v3)
  {
    -[DKDiagnosticViewController finishedLock](self, "finishedLock");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "unlock");

  }
  else
  {
    self->_finished = 1;
    -[DKDiagnosticViewController finishedLock](self, "finishedLock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unlock");

    if (-[DKDiagnosticViewController isSetup](self, "isSetup"))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[DKDiagnosticViewController teardown](self, "teardown");
    }
    -[DKDiagnosticViewController result](self, "result");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[DKUtilities moveFilesToSharedContainerInMutableResult:](DKUtilities, "moveFilesToSharedContainerInMutableResult:", v8);

    -[DKDiagnosticViewController context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKDiagnosticViewController result](self, "result");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __42__DKDiagnosticViewController_setFinished___block_invoke;
    v13[3] = &unk_24F99AA50;
    v13[4] = self;
    objc_msgSend(v9, "completeWithDiagnosticResult:completion:", v11, v13);

  }
}

void __42__DKDiagnosticViewController_setFinished___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "completeRequestReturningItems:completionHandler:", MEMORY[0x24BDBD1A8], 0);

}

- (void)setCancelled:(BOOL)a3
{
  DKDiagnosticViewController *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_cancelled = a3;
  objc_sync_exit(obj);

}

- (BOOL)isCancelled
{
  DKDiagnosticViewController *v2;
  BOOL cancelled;

  v2 = self;
  objc_sync_enter(v2);
  cancelled = v2->_cancelled;
  objc_sync_exit(v2);

  return cancelled;
}

- (void)setProgress:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_progress, a3);
  v5 = a3;
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("fractionCompleted"), 1, ProgressObserverContext_0);
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("totalUnitCount"), 1, ProgressObserverContext_0);
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("indeterminate"), 1, ProgressObserverContext_0);
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("userInfo.NSProgressEstimatedTimeRemainingKey"), 1, ProgressObserverContext_0);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  DKDiagnosticProgress *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  DKDiagnosticProgress *v12;
  objc_super v13;

  if ((void *)ProgressObserverContext_0 == a6)
  {
    v7 = [DKDiagnosticProgress alloc];
    -[DKDiagnosticViewController progress](self, "progress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[DKDiagnosticProgress initWithProgress:](v7, "initWithProgress:", v8);

    -[DKDiagnosticViewController context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKDiagnosticViewController context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "testID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateProgress:forTest:", v12, v11);

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)DKDiagnosticViewController;
    -[DKDiagnosticViewController observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)monitorIncomingCall
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  dispatch_queue_t v7;
  id v8;

  v3 = objc_alloc_init(MEMORY[0x24BDB7898]);
  -[DKDiagnosticViewController setCallObserver:](self, "setCallObserver:", v3);

  -[DKDiagnosticViewController callObserver](self, "callObserver");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", CFSTR(".incomingCallCancelQueue"));
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = dispatch_queue_create((const char *)objc_msgSend(v6, "UTF8String"), 0);
  objc_msgSend(v8, "setDelegate:queue:", self, v7);

}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  void *v5;
  id v6;

  if (a4)
  {
    v6 = a3;
    -[DKDiagnosticViewController context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancelRemoteDiagnosticWithCompletion:", 0);

    objc_msgSend(v6, "setDelegate:queue:", 0, 0);
  }
}

- (void)displayPressHomeLabelFor:(double)a3
{
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  uint64_t v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  dispatch_time_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _QWORD block[5];
  _QWORD v58[2];
  _QWORD v59[4];
  uint8_t buf[4];
  double v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  DiagnosticsKitLogHandleForCategory(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v61 = a3;
    _os_log_impl(&dword_22DE4C000, v5, OS_LOG_TYPE_DEFAULT, "Displaying press home label for %f", buf, 0xCu);
  }

  if (-[DKDiagnosticViewController shouldShowPressHomeLabel](self, "shouldShowPressHomeLabel"))
  {
    -[DKDiagnosticViewController pressHomeLabel](self, "pressHomeLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = objc_alloc(MEMORY[0x24BEBDC90]);
      objc_msgSend(MEMORY[0x24BEBDC98], "sharedInstanceForStyle:", 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("PRESS_BUTTON_TO_SKIP"), "localizedString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 17.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v7, "initWithSettings:strength:string:font:", v8, v9, v10, 0.25);
      -[DKDiagnosticViewController setPressHomeLabel:](self, "setPressHomeLabel:", v11);

      -[DKDiagnosticViewController pressHomeLabel](self, "pressHomeLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setUserInteractionEnabled:", 0);

      -[DKDiagnosticViewController pressHomeLabel](self, "pressHomeLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[DKDiagnosticViewController view](self, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[DKDiagnosticViewController pressHomeLabel](self, "pressHomeLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addSubview:", v15);

      -[DKDiagnosticViewController pressHomeLabel](self, "pressHomeLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setZPosition:", 999.0);

      v48 = (void *)MEMORY[0x24BDD1628];
      -[DKDiagnosticViewController pressHomeLabel](self, "pressHomeLabel");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "bottomAnchor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[DKDiagnosticViewController view](self, "view");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "bottomAnchor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "constraintEqualToAnchor:constant:", v53, -38.0);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v59[0] = v52;
      -[DKDiagnosticViewController pressHomeLabel](self, "pressHomeLabel");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "leadingAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[DKDiagnosticViewController view](self, "view");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "leadingAnchor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "constraintEqualToAnchor:", v47);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v59[1] = v46;
      -[DKDiagnosticViewController pressHomeLabel](self, "pressHomeLabel");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "trailingAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[DKDiagnosticViewController view](self, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "trailingAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToAnchor:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v59[2] = v21;
      -[DKDiagnosticViewController pressHomeLabel](self, "pressHomeLabel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "heightAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToConstant:", 19.0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v59[3] = v24;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 4);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "activateConstraints:", v25);

    }
    -[DKDiagnosticViewController pressHomeLabel](self, "pressHomeLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAlpha:", 1.0);

    -[DKDiagnosticViewController createGradientLayer](self, "createGradientLayer");
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setFromValue:", &unk_24F9A3678);
    objc_msgSend(v27, "setToValue:", &unk_24F9A3688);
    objc_msgSend(v27, "setDuration:", 0.6);
    LODWORD(v28) = 0;
    LODWORD(v29) = 1.0;
    LODWORD(v30) = 1028443341;
    LODWORD(v31) = 1041865114;
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v30, v28, v31, v29);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setTimingFunction:", v32);

    v33 = *MEMORY[0x24BDE5968];
    objc_msgSend(v27, "setFillMode:", *MEMORY[0x24BDE5968]);
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("locations"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setFromValue:", &unk_24F9A3708);
    objc_msgSend(v34, "setToValue:", &unk_24F9A3720);
    objc_msgSend(v34, "setDuration:", 0.6);
    LODWORD(v35) = 0;
    LODWORD(v36) = 1.0;
    LODWORD(v37) = 1028443341;
    LODWORD(v38) = 1041865114;
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v37, v35, v38, v36);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setTimingFunction:", v39);

    objc_msgSend(v34, "setFillMode:", v33);
    objc_msgSend(MEMORY[0x24BDE5638], "animation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setDuration:", 0.6);
    v58[0] = v27;
    v58[1] = v34;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 2);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setAnimations:", v41);

    objc_msgSend(v40, "setFillMode:", v33);
    -[DKDiagnosticViewController gradientLayer](self, "gradientLayer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "removeAllAnimations");

    -[DKDiagnosticViewController gradientLayer](self, "gradientLayer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addAnimation:forKey:", v40, CFSTR("fade-in-animation"));

    v44 = dispatch_time(0, (uint64_t)((a3 + 0.6) * 1000000000.0));
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__DKDiagnosticViewController_displayPressHomeLabelFor___block_invoke;
    block[3] = &unk_24F99AA50;
    block[4] = self;
    dispatch_after(v44, MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __55__DKDiagnosticViewController_displayPressHomeLabelFor___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD v4[5];
  uint8_t buf[16];

  DiagnosticsKitLogHandleForCategory(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22DE4C000, v2, OS_LOG_TYPE_DEFAULT, "Fading out the press home label", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "resetGradientAndLabelBefore:", 0);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__DKDiagnosticViewController_displayPressHomeLabelFor___block_invoke_49;
  v4[3] = &unk_24F99AA50;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v4, 0.7);
}

void __55__DKDiagnosticViewController_displayPressHomeLabelFor___block_invoke_49(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  uint8_t v3[16];

  objc_msgSend(*(id *)(a1 + 32), "pressHomeLabel");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

  DiagnosticsKitLogHandleForCategory(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_22DE4C000, v2, OS_LOG_TYPE_DEFAULT, "Press home label alpha is 0 now", v3, 2u);
  }

}

- (void)createGradientLayer
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  long double v14;
  void *v15;
  long double v16;
  double v17;
  double v18;
  void *v19;
  double MidX;
  void *v21;
  double MidY;
  void *v23;
  void *v24;
  _QWORD v25[3];
  CGRect v26;
  CGRect v27;

  v25[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDE56B8]);
  objc_msgSend(v3, "setType:", *MEMORY[0x24BDE5C58]);
  objc_msgSend(v3, "setStartPoint:", 0.5, 0.5);
  objc_msgSend(v3, "setEndPoint:", 1.0, 1.0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v25[0] = objc_msgSend(v4, "CGColor");
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v25[1] = objc_msgSend(v5, "CGColor");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColors:", v6);

  -[DKDiagnosticViewController resetGradientAndLabelBefore:](self, "resetGradientAndLabelBefore:", 1);
  -[DKDiagnosticViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSublayer:", v3);

  -[DKDiagnosticViewController setGradientLayer:](self, "setGradientLayer:", v3);
  -[DKDiagnosticViewController pressHomeLabel](self, "pressHomeLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMask:", v3);

  -[DKDiagnosticViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutIfNeeded");

  -[DKDiagnosticViewController pressHomeLabel](self, "pressHomeLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;
  -[DKDiagnosticViewController pressHomeLabel](self, "pressHomeLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "frame");
  v17 = hypot(v14, v16);

  v18 = fmax(v17 * 2.0 + 32.0, 364.0);
  -[DKDiagnosticViewController pressHomeLabel](self, "pressHomeLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  MidX = CGRectGetMidX(v26);
  -[DKDiagnosticViewController pressHomeLabel](self, "pressHomeLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bounds");
  MidY = CGRectGetMidY(v27);

  -[DKDiagnosticViewController gradientLayer](self, "gradientLayer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setBounds:", 0.0, 0.0, v18, v18);

  -[DKDiagnosticViewController gradientLayer](self, "gradientLayer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setPosition:", MidX, MidY + 32.0);

}

- (void)resetGradientAndLabelBefore:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CATransform3D *v9;
  CATransform3D v10;
  CATransform3D v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  -[DKDiagnosticViewController pressHomeLabel](self, "pressHomeLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 1.0);

  -[DKDiagnosticViewController gradientLayer](self, "gradientLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    objc_msgSend(v6, "setLocations:", &unk_24F9A3738);

    -[DKDiagnosticViewController gradientLayer](self, "gradientLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CATransform3DMakeScale(&v11, 0.0, 0.0, 1.0);
    v9 = &v11;
  }
  else
  {
    objc_msgSend(v6, "setLocations:", &unk_24F9A3750);

    -[DKDiagnosticViewController gradientLayer](self, "gradientLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CATransform3DMakeScale(&v10, 1.0, 1.0, 1.0);
    v9 = &v10;
  }
  objc_msgSend(v8, "setTransform:", v9);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (BOOL)shouldPresentInHostApp
{
  return 1;
}

- (void)shouldShowViewControllerInHostApp:(id)a3
{
  id v5;

  v5 = a3;
  (*((void (**)(id, BOOL))a3 + 2))(v5, -[DKDiagnosticViewController shouldPresentInHostApp](self, "shouldPresentInHostApp"));

}

- (void)dismissInHostApp
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  DiagnosticsKitLogHandleForCategory(2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22DE4C000, v3, OS_LOG_TYPE_DEFAULT, "Telling host app that this DK's view controller should not be shown", v5, 2u);
  }

  -[DKDiagnosticViewController context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissRemoteDiagnosticViewControllerWithCompletion:", &__block_literal_global_3);

}

- (NSProgress)progress
{
  return self->_progress;
}

- (DKMutableDiagnosticResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (BOOL)isSetup
{
  return self->_setup;
}

- (void)setSetup:(BOOL)a3
{
  self->_setup = a3;
}

- (BOOL)shouldShowPressHomeLabel
{
  return self->_shouldShowPressHomeLabel;
}

- (void)setShouldShowPressHomeLabel:(BOOL)a3
{
  self->_shouldShowPressHomeLabel = a3;
}

- (CXCallObserver)callObserver
{
  return self->_callObserver;
}

- (void)setCallObserver:(id)a3
{
  objc_storeStrong((id *)&self->_callObserver, a3);
}

- (DKDiagnosticContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSLock)finishedLock
{
  return self->_finishedLock;
}

- (void)setFinishedLock:(id)a3
{
  objc_storeStrong((id *)&self->_finishedLock, a3);
}

- (_UILegibilityLabel)pressHomeLabel
{
  return self->_pressHomeLabel;
}

- (void)setPressHomeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_pressHomeLabel, a3);
}

- (CAGradientLayer)gradientLayer
{
  return self->_gradientLayer;
}

- (void)setGradientLayer:(id)a3
{
  objc_storeStrong((id *)&self->_gradientLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_pressHomeLabel, 0);
  objc_storeStrong((id *)&self->_finishedLock, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

@end
