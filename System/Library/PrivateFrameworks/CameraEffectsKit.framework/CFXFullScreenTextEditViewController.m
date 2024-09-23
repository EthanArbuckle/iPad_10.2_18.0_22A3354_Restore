@implementation CFXFullScreenTextEditViewController

+ (BOOL)displayFullScreenTextEditorForEffect:(id)a3 inViewController:(id)a4 delegate:(id)a5 cameraViewWindowFrame:(CGRect)a6 insertingEffect:(BOOL)a7
{
  uint64_t v7;
  _BOOL8 v8;
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  id v17;
  CFXFullScreenTextEditViewController *v18;
  void *v19;

  v7 = s_CurrentFullScreenTextEditorController;
  if (!s_CurrentFullScreenTextEditorController)
  {
    v8 = a7;
    height = a6.size.height;
    width = a6.size.width;
    y = a6.origin.y;
    x = a6.origin.x;
    v15 = a5;
    v16 = a4;
    v17 = a3;
    v18 = -[CFXFullScreenTextEditViewController initWithTextEffect:CGSize:insertingEffect:delegate:]([CFXFullScreenTextEditViewController alloc], "initWithTextEffect:CGSize:insertingEffect:delegate:", v17, v8, v15, x, y, width, height);

    v19 = (void *)s_CurrentFullScreenTextEditorController;
    s_CurrentFullScreenTextEditorController = (uint64_t)v18;

    objc_msgSend(v16, "jfxAddChildViewController:constrainRelativeToSafeAreas:", s_CurrentFullScreenTextEditorController, 0);
  }
  return v7 == 0;
}

+ (void)removeFullScreenTextEditor
{
  void *v2;

  if (s_CurrentFullScreenTextEditorController)
  {
    objc_msgSend((id)s_CurrentFullScreenTextEditorController, "jfxRemoveFromParentViewController");
    v2 = (void *)s_CurrentFullScreenTextEditorController;
    s_CurrentFullScreenTextEditorController = 0;

  }
}

+ (BOOL)isFullScreenTextEditorPresented
{
  return s_CurrentFullScreenTextEditorController != 0;
}

+ (void)notifyCameraViewWindowFrameChanged:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  id v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v19 = (id)s_CurrentFullScreenTextEditorController;
  if (v19)
  {
    objc_msgSend(v19, "setEffectEditorFrameRelativeToScreen:", x, y, width, height);
    objc_msgSend(v19, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v19, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "effectEditorFrameRelativeToScreen");
      objc_msgSend(v9, "convertRect:fromView:", 0);
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      objc_msgSend(v19, "effectEditor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

    }
  }

}

+ (void)resign
{
  id v2;

  if (s_CurrentFullScreenTextEditorController)
  {
    objc_msgSend((id)s_CurrentFullScreenTextEditorController, "effectEditor");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "endEditingAnimated:withCompletionBlock:", 1, 0);

  }
}

- (CFXFullScreenTextEditViewController)initWithTextEffect:(id)a3 CGSize:(CGRect)a4 insertingEffect:(BOOL)a5 delegate:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v14;
  id v15;
  CFXFullScreenTextEditViewController *v16;
  void *v17;
  char isKindOfClass;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  CFXEffect *workingEffect;
  void *v25;
  uint64_t v26;
  void *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  id v31;
  objc_super v32;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v14 = a3;
  v15 = a6;
  v32.receiver = self;
  v32.super_class = (Class)CFXFullScreenTextEditViewController;
  v16 = -[CFXFullScreenTextEditViewController initWithNibName:bundle:](&v32, sel_initWithNibName_bundle_, 0, 0);
  if (v16)
  {
    objc_msgSend(v14, "jtEffect");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v25 = (void *)MEMORY[0x24BDBCE88];
      v26 = *MEMORY[0x24BDBCAB8];
      v27 = (void *)MEMORY[0x24BDD17C8];
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringWithFormat:", CFSTR("overlay required to initialize class %@ "), v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "exceptionWithName:reason:userInfo:", v26, v30, 0);
      v31 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v31);
    }
    objc_storeStrong((id *)&v16->_textEffect, a3);
    -[CFXFullScreenTextEditViewController textEffect](v16, "textEffect");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "jtEffect");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "copy");

    +[CFXEffect effectWithJTEffect:](CFXEffect, "effectWithJTEffect:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    workingEffect = v16->_workingEffect;
    v16->_workingEffect = (CFXEffect *)v22;

    objc_storeWeak((id *)&v16->_delegate, v15);
    v16->_insertingEffect = a5;
    v16->_effectEditorFrameRelativeToScreen.origin.x = x;
    v16->_effectEditorFrameRelativeToScreen.origin.y = y;
    v16->_effectEditorFrameRelativeToScreen.size.width = width;
    v16->_effectEditorFrameRelativeToScreen.size.height = height;

  }
  return v16;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CFXFullScreenTextEditViewController;
  -[CFXFullScreenTextEditViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  int v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  objc_super v82;
  _QWORD v83[6];

  v83[4] = *MEMORY[0x24BDAC8D0];
  v82.receiver = self;
  v82.super_class = (Class)CFXFullScreenTextEditViewController;
  -[CFXFullScreenTextEditViewController viewDidLoad](&v82, sel_viewDidLoad);
  v3 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  -[CFXFullScreenTextEditViewController setDimmingView:](self, "setDimmingView:", v3);

  -[CFXFullScreenTextEditViewController dimmingView](self, "dimmingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CFXFullScreenTextEditViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXFullScreenTextEditViewController dimmingView](self, "dimmingView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  v72 = (void *)MEMORY[0x24BDD1628];
  -[CFXFullScreenTextEditViewController dimmingView](self, "dimmingView");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "topAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXFullScreenTextEditViewController view](self, "view");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "topAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintEqualToAnchor:", v78);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v83[0] = v77;
  -[CFXFullScreenTextEditViewController dimmingView](self, "dimmingView");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "bottomAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXFullScreenTextEditViewController view](self, "view");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "bottomAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToAnchor:", v73);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v83[1] = v71;
  -[CFXFullScreenTextEditViewController dimmingView](self, "dimmingView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "leadingAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXFullScreenTextEditViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v83[2] = v9;
  -[CFXFullScreenTextEditViewController dimmingView](self, "dimmingView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXFullScreenTextEditViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v83[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v83, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "activateConstraints:", v15);

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "colorWithAlphaComponent:", 0.5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXFullScreenTextEditViewController dimmingView](self, "dimmingView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBackgroundColor:", v17);

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel_didTappedEmptyDimmedArea_);
  -[CFXFullScreenTextEditViewController dimmingView](self, "dimmingView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addGestureRecognizer:", v19);

  -[CFXFullScreenTextEditViewController dimmingView](self, "dimmingView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAlpha:", 0.0);

  JFX_getDrawOverlayBoundsOptionsDictionary();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[JFXOverlayEffectDebugViewOptions debugViewOptionsWithDictionary:](JFXOverlayEffectDebugViewOptions, "debugViewOptionsWithDictionary:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXFullScreenTextEditViewController setDebugOptions:](self, "setDebugOptions:", v23);

  if (JFX_isDrawOverlayBoundsEnabled())
  {
    -[CFXFullScreenTextEditViewController debugOptions](self, "debugOptions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "showTextBoundingBoxes");

    if (v25)
    {
      v26 = objc_alloc(MEMORY[0x24BDF6F90]);
      v27 = *MEMORY[0x24BDBF090];
      v28 = *(double *)(MEMORY[0x24BDBF090] + 8);
      v29 = *(double *)(MEMORY[0x24BDBF090] + 16);
      v30 = *(double *)(MEMORY[0x24BDBF090] + 24);
      v31 = (void *)objc_msgSend(v26, "initWithFrame:", *MEMORY[0x24BDBF090], v28, v29, v30);
      -[CFXFullScreenTextEditViewController setDebugView:](self, "setDebugView:", v31);

      -[CFXFullScreenTextEditViewController debugView](self, "debugView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "layer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setBorderWidth:", 2.0);

      objc_msgSend(MEMORY[0x24BDF6950], "greenColor");
      v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v35 = objc_msgSend(v34, "CGColor");
      -[CFXFullScreenTextEditViewController debugView](self, "debugView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "layer");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setBorderColor:", v35);

      -[CFXFullScreenTextEditViewController view](self, "view");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXFullScreenTextEditViewController debugView](self, "debugView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addSubview:", v39);

      v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v27, v28, v29, v30);
      objc_msgSend(v40, "setTag:", 1);
      objc_msgSend(v40, "layer");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setBorderWidth:", 4.0);

      objc_msgSend(MEMORY[0x24BDF6950], "yellowColor");
      v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v43 = objc_msgSend(v42, "CGColor");
      objc_msgSend(v40, "layer");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setBorderColor:", v43);

      -[CFXFullScreenTextEditViewController debugView](self, "debugView");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "addSubview:", v40);

      v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v27, v28, v29, v30);
      objc_msgSend(v46, "setTag:", 2);
      objc_msgSend(v46, "layer");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setBorderWidth:", 2.0);

      objc_msgSend(MEMORY[0x24BDF6950], "orangeColor");
      v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v49 = objc_msgSend(v48, "CGColor");
      objc_msgSend(v46, "layer");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setBorderColor:", v49);

      -[CFXFullScreenTextEditViewController debugView](self, "debugView");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "addSubview:", v46);

      v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", 0.0, 0.0, 4.0, 4.0);
      objc_msgSend(v52, "setTag:", 3);
      objc_msgSend(MEMORY[0x24BDF6950], "magentaColor");
      v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v54 = objc_msgSend(v53, "CGColor");
      objc_msgSend(v52, "layer");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setBackgroundColor:", v54);

      -[CFXFullScreenTextEditViewController debugView](self, "debugView");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "addSubview:", v52);

      v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v27, v28, v29, v30);
      objc_msgSend(v57, "setTag:", 4);
      objc_msgSend(v57, "layer");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setBorderWidth:", 2.0);

      objc_msgSend(MEMORY[0x24BDF6950], "redColor");
      v59 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v60 = objc_msgSend(v59, "CGColor");
      objc_msgSend(v57, "layer");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setBorderColor:", v60);

      -[CFXFullScreenTextEditViewController debugView](self, "debugView");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "addSubview:", v57);

      v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v27, v28, v29, v30);
      objc_msgSend(v63, "setTag:", 5);
      objc_msgSend(v63, "layer");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setBorderWidth:", 4.0);

      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      v65 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v66 = objc_msgSend(v65, "CGColor");
      objc_msgSend(v63, "layer");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "setBorderColor:", v66);

      -[CFXFullScreenTextEditViewController debugView](self, "debugView");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "addSubview:", v63);

    }
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  CFXEffectEditorView *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  int v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id location;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)CFXFullScreenTextEditViewController;
  -[CFXFullScreenTextEditViewController viewDidAppear:](&v28, sel_viewDidAppear_, a3);
  -[CFXFullScreenTextEditViewController configureWorkingEffect](self, "configureWorkingEffect");
  v4 = -[CFXEffectEditorView initWithMode:delegate:]([CFXEffectEditorView alloc], "initWithMode:delegate:", 2, self);
  -[CFXFullScreenTextEditViewController setEffectEditor:](self, "setEffectEditor:", v4);

  -[CFXFullScreenTextEditViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXFullScreenTextEditViewController effectEditor](self, "effectEditor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  -[CFXFullScreenTextEditViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXFullScreenTextEditViewController effectEditorFrameRelativeToScreen](self, "effectEditorFrameRelativeToScreen");
  objc_msgSend(v7, "convertRect:fromView:", 0);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[CFXFullScreenTextEditViewController effectEditor](self, "effectEditor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  v17 = -[CFXFullScreenTextEditViewController insertingEffect](self, "insertingEffect");
  -[CFXFullScreenTextEditViewController delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) != 0)
  {
    -[CFXFullScreenTextEditViewController delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXFullScreenTextEditViewController workingEffect](self, "workingEffect");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "fullScreenTextEditViewController:shouldDisableEditingAnimationForEffect:", self, v21);

    v17 |= v22;
  }
  objc_initWeak(&location, self);
  -[CFXFullScreenTextEditViewController effectEditor](self, "effectEditor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXFullScreenTextEditViewController workingEffect](self, "workingEffect");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __53__CFXFullScreenTextEditViewController_viewDidAppear___block_invoke;
  v25[3] = &unk_24EE59890;
  objc_copyWeak(&v26, &location);
  v25[4] = self;
  objc_msgSend(v23, "beginEditingEffect:animated:withCompletionBlock:", v24, v17 ^ 1u, v25);

  if (v17)
    -[CFXFullScreenTextEditViewController CFX_animateWithDuration:animatingIn:completion:](self, "CFX_animateWithDuration:animatingIn:completion:", 1, 0, 0.4);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __53__CFXFullScreenTextEditViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textEffect");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fullScreenTextEditViewController:didBeginEditingEffect:", v7, v4);

    objc_msgSend(v7, "effectEditor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "beginTextEditing");

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_keyboardDidHide_, *MEMORY[0x24BDF79F8], 0);

    WeakRetained = v7;
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CFXFullScreenTextEditViewController;
  -[CFXFullScreenTextEditViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BDF79F8], 0);

  -[CFXFullScreenTextEditViewController effectEditor](self, "effectEditor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endEditingAnimated:withCompletionBlock:", 0, 0);

}

- (void)keyboardDidHide:(id)a3
{
  id v3;

  -[CFXFullScreenTextEditViewController effectEditor](self, "effectEditor", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endEditingAnimated:withCompletionBlock:", 1, 0);

}

- (void)didTappedEmptyDimmedArea:(id)a3
{
  id v4;

  if (objc_msgSend(a3, "state") == 3)
  {
    -[CFXFullScreenTextEditViewController effectEditor](self, "effectEditor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endEditingAnimated:withCompletionBlock:", 1, 0);

  }
}

- (void)configureWorkingEffect
{
  void *v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double Height;
  double Width;
  double v28;
  double v29;
  BOOL v30;
  double v31;
  __int128 v32;
  uint64_t v33;
  _BYTE _150[16];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  CGRect v43;
  CGRect v44;

  -[CFXFullScreenTextEditViewController workingEffect](self, "workingEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jtEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setHidden:", 0);
  v5 = *(_OWORD *)(MEMORY[0x24BDAEDE8] + 80);
  v39 = *(_OWORD *)(MEMORY[0x24BDAEDE8] + 64);
  v40 = v5;
  v6 = *(_OWORD *)(MEMORY[0x24BDAEDE8] + 112);
  v41 = *(_OWORD *)(MEMORY[0x24BDAEDE8] + 96);
  v42 = v6;
  v7 = *(_OWORD *)(MEMORY[0x24BDAEDE8] + 16);
  v35 = *MEMORY[0x24BDAEDE8];
  v36 = v7;
  v8 = *(_OWORD *)(MEMORY[0x24BDAEDE8] + 48);
  v37 = *(_OWORD *)(MEMORY[0x24BDAEDE8] + 32);
  v38 = v8;
  objc_msgSend(v4, "setTopLevelTransform:", &v35);
  -[CFXFullScreenTextEditViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0
    && (-[CFXFullScreenTextEditViewController delegate](self, "delegate"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        -[CFXFullScreenTextEditViewController workingEffect](self, "workingEffect"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v11, "fullScreenTextEditViewController:shouldDisableEditingAnimationForEffect:", self, v12),
        v12,
        v11,
        v13))
  {
    objc_msgSend(v4, "trackingProps");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = 0;
  }
  else
  {
    objc_msgSend(v4, "trackingProps");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "trackingType");

    if (v18 != 1)
      goto LABEL_7;
    objc_msgSend(v4, "trackingProps");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = 2;
  }
  objc_msgSend(v14, "setTrackingType:", v16);

LABEL_7:
  if (objc_msgSend(v4, "isTextFlipped"))
  {
    CGAffineTransformMakeRotation((CGAffineTransform *)_150, 3.14159265);
    -[CFXFullScreenTextEditViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bounds");
    v32 = *MEMORY[0x24BDC0D88];
    v33 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    objc_msgSend(v4, "addTransform:withComponentTime:relativeTo:basisOrigin:", _150, &v32, 1);

  }
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "userInterfaceIdiom");

  if (v21 == 1)
  {
    objc_msgSend(v4, "renderSize");
    v23 = v22;
    v25 = v24;
    -[CFXFullScreenTextEditViewController effectEditorFrameRelativeToScreen](self, "effectEditorFrameRelativeToScreen");
    Height = CGRectGetHeight(v43);
    -[CFXFullScreenTextEditViewController effectEditorFrameRelativeToScreen](self, "effectEditorFrameRelativeToScreen");
    Width = CGRectGetWidth(v44);
    if (v23 >= v25)
      v28 = v25;
    else
      v28 = v23;
    if (v23 >= v25)
      v29 = v23;
    else
      v29 = v25;
    v30 = Height <= Width;
    if (Height <= Width)
      v31 = v29;
    else
      v31 = v28;
    if (!v30)
      v28 = v29;
    objc_msgSend(v4, "setRenderSize:", v31, v28);
  }
  -[CFXFullScreenTextEditViewController scaleTextToFitTextEditingBounds:](self, "scaleTextToFitTextEditingBounds:", 1);

}

- (void)scaleTextToFitTextEditingBounds:(BOOL)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double MidX;
  CGFloat v19;
  CGFloat x;
  double y;
  double width;
  double height;
  void *v24;
  void *v25;
  char v26;
  __int128 *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  double MaxX;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  double MaxY;
  double v56;
  CGFloat v57;
  double v58;
  double MidY;
  CGFloat v60;
  void *v61;
  int v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  double v81;
  double v82;
  CGFloat v83;
  double v84;
  double v85;
  double v86;
  double v87;
  CGFloat v88;
  double v89;
  CGFloat v90;
  CGFloat v91;
  CGFloat v92;
  double v93;
  CGFloat v94;
  CGFloat v95;
  double v96;
  double v97;
  __int128 v98;
  double rect;
  __int128 v100;
  uint64_t v101;
  __int128 v102;
  uint64_t v103;
  CGAffineTransform v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;

  if (!-[CFXFullScreenTextEditViewController isRunningAnimation](self, "isRunningAnimation"))
  {
    -[CFXFullScreenTextEditViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXFullScreenTextEditViewController effectEditorFrameRelativeToScreen](self, "effectEditorFrameRelativeToScreen");
    objc_msgSend(v5, "convertRect:fromView:", 0);
    v86 = v6;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    -[CFXFullScreenTextEditViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v15 = v14;
    v17 = v16;
    v105.origin.x = 0.0;
    v105.origin.y = 0.0;
    v105.size.width = v10;
    v105.size.height = v12;
    MidX = CGRectGetMidX(v105);
    v106.origin.x = 0.0;
    v106.origin.y = 0.0;
    v106.size.width = v10;
    v106.size.height = v12;
    v19 = CGRectGetMidY(v106) - v17 * 0.5;

    v107.origin.x = 0.0;
    v107.origin.y = 0.0;
    v107.size.width = v10;
    v107.size.height = v12;
    v124.origin.x = MidX - v15 * 0.5;
    v124.origin.y = v19;
    v124.size.width = v15;
    v124.size.height = v17;
    v108 = CGRectIntersection(v107, v124);
    x = v108.origin.x;
    y = v108.origin.y;
    width = v108.size.width;
    height = v108.size.height;
    -[CFXFullScreenTextEditViewController workingEffect](self, "workingEffect");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "jtEffect");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_msgSend(v25, "isEmoji");
    v27 = (__int128 *)MEMORY[0x24BDC0D88];
    if (a3)
      goto LABEL_4;
    v102 = *MEMORY[0x24BDC0D88];
    v103 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    objc_msgSend(v25, "imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", &v102, 1, 1, 1, 0.0, 0.0, v10, v12);
    v125.origin.x = v28 + -24.0;
    v125.origin.y = v29 + -34.0;
    v125.size.width = v30 + 48.0;
    v125.size.height = v31 + 58.0;
    v109.origin.x = x;
    v109.origin.y = y;
    v109.size.width = width;
    v109.size.height = height;
    if (!CGRectContainsRect(v109, v125))
    {
LABEL_4:
      v96 = x;
      v85 = v8;
      if ((v26 & 1) != 0)
      {
        v32 = 0.32;
      }
      else
      {
        objc_msgSend(v25, "strings");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "firstObject");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v34, "length") >= 4)
          v32 = 0.5;
        else
          v32 = 0.32;

      }
      if (width >= height)
        v35 = height;
      else
        v35 = width;
      v102 = *v27;
      v98 = v102;
      v103 = *((_QWORD *)v27 + 2);
      v36 = v103;
      v84 = v35 * v32;
      objc_msgSend(v25, "applyScaleToFitFrame:withComponentTime:relativeRect:", &v102, 0.0, 0.0, v84, v84, 0.0, 0.0, v10, v12);
      v102 = v98;
      v103 = v36;
      objc_msgSend(v25, "imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", &v102, 1, 1, 1, 0.0, 0.0, v10, v12);
      v94 = v40;
      v95 = v39;
      if (width <= height)
        v41 = 0.5;
      else
        v41 = width / height * 0.5 - (width / height + -1.0) * 0.5;
      v91 = v37;
      v92 = v38;
      if (v10 > v12)
        v41 = ((v10 / v12 + -1.0) * 0.5 + v41) / (v10 / v12);
      v93 = v12;
      v42 = CGRectMakeWithSizeAndCenterPoint(v37 + 48.0, v38 + 58.0, v10 * v41);
      rect = v45;
      v46 = v42;
      v87 = y;
      v88 = v42;
      v97 = v44;
      if (v44 <= width)
      {
        v46 = v96;
        if (v42 >= v96)
        {
          v47 = v43;
          MaxX = CGRectGetMaxX(*(CGRect *)&v42);
          v110.origin.x = v96;
          v110.origin.y = y;
          v110.size.width = width;
          v110.size.height = height;
          v49 = CGRectGetMaxX(v110);
          v43 = v47;
          v44 = v97;
          v46 = v88;
          if (MaxX > v49)
          {
            v111.origin.x = v96;
            v111.origin.y = y;
            v111.size.width = width;
            v111.size.height = height;
            v50 = CGRectGetMaxX(v111);
            v112.origin.x = v88;
            v112.origin.y = v47;
            v112.size.width = v97;
            v112.size.height = rect;
            v51 = CGRectGetWidth(v112);
            v43 = v47;
            v44 = v97;
            v46 = v50 - v51;
          }
        }
      }
      v83 = v43;
      if (rect <= height)
      {
        if (v43 >= y)
        {
          v52 = v46;
          v53 = v43;
          v54 = rect;
          MaxY = CGRectGetMaxY(*(CGRect *)(&v43 - 1));
          v113.origin.x = v96;
          v113.origin.y = y;
          v113.size.width = width;
          v113.size.height = height;
          if (MaxY <= CGRectGetMaxY(v113))
          {
            v43 = v53;
          }
          else
          {
            v114.origin.x = v96;
            v114.origin.y = y;
            v114.size.width = width;
            v114.size.height = height;
            v56 = CGRectGetMaxY(v114);
            v115.origin.x = v46;
            v115.origin.y = v53;
            v115.size.width = v97;
            v115.size.height = rect;
            v43 = v56 - CGRectGetHeight(v115);
          }
          v44 = v97;
        }
        else
        {
          v43 = y;
        }
      }
      v81 = v43;
      v116.origin.x = v46 + 24.0;
      v116.origin.y = v43 + 34.0;
      v57 = v116.origin.y;
      v116.size.width = v44 + -48.0;
      v58 = v116.size.width;
      v116.size.height = rect + -58.0;
      v89 = CGRectGetMidX(v116);
      v117.origin.x = v95;
      v117.origin.y = v94;
      v117.size.width = v91;
      v117.size.height = v92;
      v90 = v89 - CGRectGetMidX(v117);
      v118.origin.x = v46 + 24.0;
      v82 = v57;
      v118.origin.y = v57;
      v118.size.width = v58;
      v118.size.height = rect + -58.0;
      MidY = CGRectGetMidY(v118);
      v119.origin.x = v95;
      v119.origin.y = v94;
      v119.size.width = v91;
      v119.size.height = v92;
      v60 = CGRectGetMidY(v119);
      CGAffineTransformMakeTranslation(&v104, v90, MidY - v60);
      v100 = v98;
      v101 = v36;
      objc_msgSend(v25, "addTransform:withComponentTime:relativeTo:basisOrigin:", &v104, &v100, 1, 0.0, 0.0, v10, v93);
      if (JFX_isDrawOverlayBoundsEnabled())
      {
        -[CFXFullScreenTextEditViewController debugOptions](self, "debugOptions");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(v61, "showTextBoundingBoxes");

        if (v62)
        {
          -[CFXFullScreenTextEditViewController debugView](self, "debugView");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "setFrame:", v86, v85, v10, v93);

          -[CFXFullScreenTextEditViewController debugView](self, "debugView");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "viewWithTag:", 1);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "setFrame:", v96, v87, width, height);

          -[CFXFullScreenTextEditViewController debugView](self, "debugView");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "viewWithTag:", 2);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "setFrame:", 0.0, 0.0, v84, v84);

          v120.origin.x = v46 + 24.0;
          v120.origin.y = v82;
          v120.size.width = v58;
          v120.size.height = rect + -58.0;
          v68 = CGRectGetMidX(v120);
          v121.origin.x = v46 + 24.0;
          v121.origin.y = v82;
          v121.size.width = v58;
          v121.size.height = rect + -58.0;
          v69 = CGRectGetMidY(v121);
          -[CFXFullScreenTextEditViewController debugView](self, "debugView");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "viewWithTag:", 2);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "setCenter:", v68, v69);

          v122.origin.x = v88;
          v122.origin.y = v83;
          v122.size.width = v97;
          v122.size.height = rect;
          v72 = CGRectGetMidX(v122);
          v123.origin.x = v88;
          v123.origin.y = v83;
          v123.size.width = v97;
          v123.size.height = rect;
          v73 = CGRectGetMidY(v123);
          -[CFXFullScreenTextEditViewController debugView](self, "debugView");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "viewWithTag:", 3);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "setCenter:", v72, v73);

          -[CFXFullScreenTextEditViewController debugView](self, "debugView");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "viewWithTag:", 4);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "setFrame:", v46, v81, v97, rect);

          -[CFXFullScreenTextEditViewController debugView](self, "debugView");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "viewWithTag:", 5);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "setFrame:", v46 + 24.0, v82, v58, rect + -58.0);

        }
      }
      -[CFXFullScreenTextEditViewController effectEditor](self, "effectEditor", *(_QWORD *)&height);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "notifyEffectTransformDidChange");

    }
  }
}

- (void)effectEditorViewDidBeginEditing:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  -[CFXFullScreenTextEditViewController workingEffect](self, "workingEffect", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jtEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[JFXEffectEditingUtilities disableAnimationForEffects:](JFXEffectEditingUtilities, "disableAnimationForEffects:", v5);

}

- (void)effectEditorViewDidEndEditing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (!-[CFXFullScreenTextEditViewController effectWasRemoved](self, "effectWasRemoved", a3))
  {
    -[CFXFullScreenTextEditViewController workingEffect](self, "workingEffect");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "jtEffect");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[JFXEffectEditingUtilities textForEffect:](JFXEffectEditingUtilities, "textForEffect:", v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[CFXFullScreenTextEditViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXFullScreenTextEditViewController textEffect](self, "textEffect");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fullScreenTextEditViewController:didFinishEditingEffect:withUpdatedText:", self, v7, v8);

    +[CFXFullScreenTextEditViewController removeFullScreenTextEditor](CFXFullScreenTextEditViewController, "removeFullScreenTextEditor");
  }
}

- (id)effectEditorView:(id)a3 effectAtPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  __int128 v25;
  uint64_t v26;
  _QWORD v27[2];

  y = a4.y;
  x = a4.x;
  v27[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  -[CFXFullScreenTextEditViewController workingEffect](self, "workingEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "jtEffect");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CFXFullScreenTextEditViewController workingEffect](self, "workingEffect");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "jtEffect");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "bounds");
    v14 = 44.0 / v13;
    v27[0] = v12;
    v16 = 44.0 / v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v25 = *MEMORY[0x24BDC0D88];
    v26 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    +[JFXEffectEditingUtilities hitTestOverlaysAtPosterFrame:atPoint:relativeToBounds:atTime:adjustForMinimumSize:normalizedMinimumSize:](JFXEffectEditingUtilities, "hitTestOverlaysAtPosterFrame:atPoint:relativeToBounds:atTime:adjustForMinimumSize:normalizedMinimumSize:", v17, &v25, 1, x, y, v18, v19, v20, v21, v14, v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      +[CFXEffect effectWithJTEffect:](CFXEffect, "effectWithJTEffect:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (BOOL)effectEditorView:(id)a3 isEffectAtPoint:(CGPoint)a4 effect:(id)a5
{
  double y;
  double x;
  id v8;
  id v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  BOOL v23;
  __int128 v25;
  uint64_t v26;
  _QWORD v27[2];

  y = a4.y;
  x = a4.x;
  v27[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "jtEffect");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v9, "jtEffect");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v14 = 44.0 / v13;
    v27[0] = v12;
    v16 = 44.0 / v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v25 = *MEMORY[0x24BDC0D88];
    v26 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    +[JFXEffectEditingUtilities hitTestOverlaysAtPosterFrame:atPoint:relativeToBounds:atTime:adjustForMinimumSize:normalizedMinimumSize:](JFXEffectEditingUtilities, "hitTestOverlaysAtPosterFrame:atPoint:relativeToBounds:atTime:adjustForMinimumSize:normalizedMinimumSize:", v17, &v25, 1, x, y, v18, v19, v20, v21, v14, v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = v22 != 0;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)effectEditorView:(id)a3 didEditTextForEffect:(id)a4 newText:(id)a5
{
  id v7;
  void *v8;
  _QWORD block[5];

  v7 = a5;
  objc_msgSend(a4, "jtEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[JFXEffectEditingUtilities updateEffectText:newText:](JFXEffectEditingUtilities, "updateEffectText:newText:", v8, v7);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__CFXFullScreenTextEditViewController_effectEditorView_didEditTextForEffect_newText___block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __85__CFXFullScreenTextEditViewController_effectEditorView_didEditTextForEffect_newText___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scaleTextToFitTextEditingBounds:", 0);
}

- (void)effectEditorView:(id)a3 didRemoveEffect:(id)a4
{
  void *v5;
  void *v6;

  -[CFXFullScreenTextEditViewController setEffectWasRemoved:](self, "setEffectWasRemoved:", 1, a4);
  -[CFXFullScreenTextEditViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXFullScreenTextEditViewController textEffect](self, "textEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fullScreenTextEditViewController:didFinishEditingByRemovingEffect:", self, v6);

  +[CFXFullScreenTextEditViewController removeFullScreenTextEditor](CFXFullScreenTextEditViewController, "removeFullScreenTextEditor");
}

- (CGRect)effectEditorView:(id)a3 frameForEffect:(id)a4 relativeToBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  char isKindOfClass;
  void *v12;
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
  __int128 v25;
  uint64_t v26;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4;
  objc_msgSend(v9, "jtEffect");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v9, "jtEffect");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *MEMORY[0x24BDC0D88];
    v26 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    objc_msgSend(v12, "imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", &v25, 1, 1, 1, x, y, width, height);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

  }
  else
  {
    v14 = *MEMORY[0x24BDBF090];
    v16 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v18 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v20 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGRect)effectEditorView:(id)a3 hitAreaBoundingFrameForEffect:(id)a4 adjustForMinimumSize:(BOOL)a5 relativeToBounds:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v10;
  id v12;
  id v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  __int128 v31;
  uint64_t v32;
  CGRect result;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v10 = a5;
  v12 = a3;
  v13 = a4;
  objc_msgSend(v13, "jtEffect");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v13, "jtEffect");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v31 = *MEMORY[0x24BDC0D88];
    v32 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    objc_msgSend(v16, "hitAreaBoundingFrameAtTime:forcePosterFrame:includeDropShadow:adjustForMinimumSize:normalizedMinimumSize:relativeTo:basisOrigin:", &v31, 1, 1, v10, 1, 44.0 / v17, 44.0 / v18, x, y, width, height);
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;

  }
  else
  {
    v20 = *MEMORY[0x24BDBF090];
    v22 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v24 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v26 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }

  v27 = v20;
  v28 = v22;
  v29 = v24;
  v30 = v26;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (id)effectEditorView:(id)a3 overlayEffectFrameForEffect:(id)a4 relativeToBounds:(CGRect)a5
{
  double height;
  double width;
  void *v7;
  void *v8;
  __int128 v10;
  uint64_t v11;

  height = a5.size.height;
  width = a5.size.width;
  objc_msgSend(a4, "jtEffect", a3, a5.origin.x, a5.origin.y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = *MEMORY[0x24BDC0D88];
    v11 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    +[JFXOverlayEffectFrame frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:](JFXOverlayEffectFrame, "frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:", v7, 1, &v10, 1, 1, 1, width, height);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)removeButtonRelativeBoundsIsViewSpace
{
  return 1;
}

- (CGPoint)effectEditorView:(id)a3 removeButtonPositionForEffect:(id)a4 relativeToBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  __int128 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _OWORD v17[3];
  __int128 v18;
  uint64_t v19;
  CGPoint result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  objc_msgSend(a4, "jtEffect", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x24BDC0D88];
  v19 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  v10 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v17[0] = *MEMORY[0x24BDBD8B8];
  v17[1] = v10;
  v17[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  +[JFXEffectEditingUtilities removeButtonPositionForEffect:atTime:atPosterFrameRelativeToBounds:viewCorrectionTransform:](JFXEffectEditingUtilities, "removeButtonPositionForEffect:atTime:atPosterFrameRelativeToBounds:viewCorrectionTransform:", v9, &v18, v17, x, y, width, height);
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.y = v16;
  result.x = v15;
  return result;
}

- (id)effectEditorView:(id)a3 textEditingPropertiesForEffect:(id)a4 relativeToBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  id v10;
  __int128 v12;
  uint64_t v13;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  objc_msgSend(a4, "jtEffect", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x24BDC0D88];
  v13 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  v10 = +[JFXEffectEditingUtilities newTextEditingPropertiesForEffect:relativeTo:atTime:withNewText:](JFXEffectEditingUtilities, "newTextEditingPropertiesForEffect:relativeTo:atTime:withNewText:", v9, &v12, 0, x, y, width, height);

  return v10;
}

- (id)effectEditorView:(id)a3 textForEffect:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a4, "jtEffect", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[JFXEffectEditingUtilities textForEffect:](JFXEffectEditingUtilities, "textForEffect:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)effectEditorView:(id)a3 didBeginEditingTextForEffect:(id)a4
{
  id v4;

  objc_msgSend(a4, "jtEffect", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[JFXEffectEditingUtilities beginTextEditingForEffect:](JFXEffectEditingUtilities, "beginTextEditingForEffect:", v4);

}

- (void)effectEditorView:(id)a3 didEndEditingTextForEffect:(id)a4 wasCancelled:(BOOL)a5
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  if (!-[CFXFullScreenTextEditViewController effectWasRemoved](self, "effectWasRemoved"))
  {
    objc_msgSend(v8, "jtEffect");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[JFXEffectEditingUtilities updateEffectToDefaultTextIfEmpty:](JFXEffectEditingUtilities, "updateEffectToDefaultTextIfEmpty:", v6);

    objc_msgSend(v8, "jtEffect");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[JFXEffectEditingUtilities endTextEditingForEffect:](JFXEffectEditingUtilities, "endTextEditingForEffect:", v7);

  }
}

- (BOOL)effectEditorView:(id)a3 shouldEditTextForEffect:(id)a4
{
  void *v4;
  BOOL v5;

  objc_msgSend(a4, "jtEffect", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[JFXEffectEditingUtilities canEditTextForEffect:](JFXEffectEditingUtilities, "canEditTextForEffect:", v4);

  return v5;
}

- (BOOL)effectEditorViewShouldPreviewEditEffect:(id)a3
{
  return 1;
}

- (unint64_t)effectEditorView:(id)a3 maximumTextLengthForEffect:(id)a4
{
  void *v4;
  unint64_t v5;

  objc_msgSend(a4, "jtEffect", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[JFXEffectEditingUtilities maximumTextLengthForEffect:](JFXEffectEditingUtilities, "maximumTextLengthForEffect:", v4);

  return v5;
}

- (CGPoint)effectEditorView:(id)a3 spacingBetweenCenterPointOfEffect:(id)a4 point:(CGPoint)a5 relativeToBounds:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  uint64_t v20;
  CGPoint result;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v10 = a5.y;
  v11 = a5.x;
  objc_msgSend(a4, "jtEffect", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x24BDC0D88];
  v20 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  +[JFXEffectEditingUtilities spacingBetweenCenterPointOfEffect:point:relativeToBounds:atTime:](JFXEffectEditingUtilities, "spacingBetweenCenterPointOfEffect:point:relativeToBounds:atTime:", v12, &v19, v11, v10, x, y, width, height);
  v14 = v13;
  v16 = v15;

  v17 = v14;
  v18 = v16;
  result.y = v18;
  result.x = v17;
  return result;
}

- (BOOL)effectEditorView:(id)a3 isFaceTrackingEffect:(id)a4
{
  void *v4;
  char v5;

  objc_msgSend(a4, "jtEffect", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCurrentlyTracking");

  return v5;
}

- (BOOL)effectEditorView:(id)a3 isFaceTrackingDataAvailableForEffect:(id)a4
{
  return +[JFXEffectEditingUtilities isFaceTrackingDataAvailable](JFXEffectEditingUtilities, "isFaceTrackingDataAvailable", a3, a4);
}

- (void)effectEditorView:(id)a3 applyAnimationTransformsToEffect:(id)a4 transforms:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  objc_msgSend(a4, "jtEffect");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applyToEffect:", v7);

}

- (BOOL)effectEditorView:(id)a3 shouldDisableEditingAnimationForEffect:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  char v9;

  v5 = a4;
  -[CFXFullScreenTextEditViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CFXFullScreenTextEditViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "fullScreenTextEditViewController:shouldDisableEditingAnimationForEffect:", self, v5);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (double)effectEditorView:(id)a3 durationForBeginEditingAnimationForEffect:(id)a4
{
  return 0.4;
}

- (void)effectEditorView:(id)a3 willBeginAnimationBeforeEditingEffect:(id)a4
{
  void *v5;
  id v6;

  -[CFXFullScreenTextEditViewController delegate](self, "delegate", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CFXFullScreenTextEditViewController textEffect](self, "textEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fullScreenTextEditViewController:willBeginAnimationBeforeEditingEffect:", self, v5);

}

- (id)effectEditorView:(id)a3 beginEditingAnimationFromFrameForEffect:(id)a4 relativeToBounds:(CGRect)a5
{
  double height;
  double width;
  void *v7;
  void *v8;
  void *v9;
  __int128 v11;
  uint64_t v12;

  height = a5.size.height;
  width = a5.size.width;
  -[CFXFullScreenTextEditViewController textEffect](self, "textEffect", a3, a4, a5.origin.x, a5.origin.y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "jtEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = *MEMORY[0x24BDC0D88];
    v12 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    +[JFXOverlayEffectFrame frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:](JFXOverlayEffectFrame, "frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:", v8, 1, &v11, 1, 1, 1, width, height);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)effectEditorView:(id)a3 beginEditingAnimationToFrameForEffect:(id)a4 relativeToBounds:(CGRect)a5
{
  double height;
  double width;
  void *v7;
  void *v8;
  __int128 v10;
  uint64_t v11;

  height = a5.size.height;
  width = a5.size.width;
  objc_msgSend(a4, "jtEffect", a3, a5.origin.x, a5.origin.y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = *MEMORY[0x24BDC0D88];
    v11 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    +[JFXOverlayEffectFrame frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:](JFXOverlayEffectFrame, "frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:", v7, 1, &v10, 1, 1, 1, width, height);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)effectEditorView:(id)a3 didStartBeginEditingAnimationForEffect:(id)a4 completion:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a5;
  -[CFXFullScreenTextEditViewController setIsRunningAnimation:](self, "setIsRunningAnimation:", 1);
  -[CFXFullScreenTextEditViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXFullScreenTextEditViewController textEffect](self, "textEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __106__CFXFullScreenTextEditViewController_effectEditorView_didStartBeginEditingAnimationForEffect_completion___block_invoke;
  v10[3] = &unk_24EE58FF0;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v7, "fullScreenTextEditViewController:didBeginAnimationBeforeEditingEffect:completion:", self, v8, v10);

}

uint64_t __106__CFXFullScreenTextEditViewController_effectEditorView_didStartBeginEditingAnimationForEffect_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "CFX_animateWithDuration:animatingIn:completion:", 1, 0, 0.4);
}

- (void)effectEditorView:(id)a3 didCompleteBeginEditingAnimationForEffect:(id)a4
{
  -[CFXFullScreenTextEditViewController setIsRunningAnimation:](self, "setIsRunningAnimation:", 0, a4);
}

- (double)effectEditorView:(id)a3 durationForEndEditingAnimationForEffect:(id)a4
{
  _BOOL4 v4;
  double result;

  v4 = -[CFXFullScreenTextEditViewController effectWasRemoved](self, "effectWasRemoved", a3, a4);
  result = 0.4;
  if (v4)
    return 0.0;
  return result;
}

- (void)effectEditorView:(id)a3 willBeginAnimationAfterEditingEffect:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a4, "jtEffect", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[JFXEffectEditingUtilities textForEffect:](JFXEffectEditingUtilities, "textForEffect:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[CFXFullScreenTextEditViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXFullScreenTextEditViewController textEffect](self, "textEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fullScreenTextEditViewController:willBeginAnimationAfterEditingEffect:updatedText:", self, v7, v8);

}

- (id)effectEditorView:(id)a3 endEditingAnimationFromFrameForEffect:(id)a4 relativeToBounds:(CGRect)a5
{
  double height;
  double width;
  void *v7;
  void *v8;
  __int128 v10;
  uint64_t v11;

  height = a5.size.height;
  width = a5.size.width;
  objc_msgSend(a4, "jtEffect", a3, a5.origin.x, a5.origin.y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = *MEMORY[0x24BDC0D88];
    v11 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    +[JFXOverlayEffectFrame frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:](JFXOverlayEffectFrame, "frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:", v7, 1, &v10, 1, 1, 1, width, height);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)effectEditorView:(id)a3 endEditingAnimationToFrameForEffect:(id)a4 relativeToBounds:(CGRect)a5
{
  double height;
  double width;
  void *v7;
  void *v8;
  void *v9;
  __int128 v11;
  uint64_t v12;

  height = a5.size.height;
  width = a5.size.width;
  -[CFXFullScreenTextEditViewController textEffect](self, "textEffect", a3, a4, a5.origin.x, a5.origin.y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "jtEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = *MEMORY[0x24BDC0D88];
    v12 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    +[JFXOverlayEffectFrame frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:](JFXOverlayEffectFrame, "frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:", v8, 1, &v11, 1, 1, 1, width, height);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)effectEditorView:(id)a3 didStartEndEditingAnimationForEffect:(id)a4
{
  -[CFXFullScreenTextEditViewController setIsRunningAnimation:](self, "setIsRunningAnimation:", 1, a4);
  -[CFXFullScreenTextEditViewController CFX_animateWithDuration:animatingIn:completion:](self, "CFX_animateWithDuration:animatingIn:completion:", 0, 0, 0.4);
}

- (void)effectEditorView:(id)a3 didCompleteEndEditingAnimationForEffect:(id)a4 completion:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(void);

  v9 = (void (**)(void))a5;
  -[CFXFullScreenTextEditViewController setIsRunningAnimation:](self, "setIsRunningAnimation:", 0);
  -[CFXFullScreenTextEditViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CFXFullScreenTextEditViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXFullScreenTextEditViewController textEffect](self, "textEffect");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fullScreenTextEditViewController:didFinishAnimationAfterEditingEffect:completion:", self, v8, v9);

  }
  else
  {
    v9[2]();
  }

}

- (id)effectEditorView:(id)a3 calculateAnimatedFaceTrackingTransformWithCurrentFaceTrackingDataFromTrackingType:(int64_t)a4 interpolatedWithFaceTrackingTransform:(id)a5 toTrackingType:(int64_t)a6 atAnimationProgress:(float)a7
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  JFXFaceTrackingTransformCalculator *v17;
  void *v18;
  JFXFaceTrackingTransformCalculator *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  JFXFaceTrackedEffectTransform *v41;
  JFXFaceTrackedEffectTransform *v42;
  uint64_t v44;
  uint64_t v45;
  double v46;
  __int128 v47;
  double v48;
  __int128 v49;
  double v50;
  __int128 v51;
  double v52;
  __int128 v53;
  double v54;
  double v55;
  double v56;
  double v57;

  v11 = a5;
  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mostRecentARMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "faceAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[CFXFullScreenTextEditViewController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "faceTrackingInterfaceOrientationForfullScreenTextEditViewController:", self);

    v17 = [JFXFaceTrackingTransformCalculator alloc];
    +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "renderSize");
    v19 = -[JFXFaceTrackingTransformCalculator initWithARMetaData:outputSize:playableInterfaceOrientation:](v17, "initWithARMetaData:outputSize:playableInterfaceOrientation:", v13, v16);

    -[JFXFaceTrackingTransformCalculator calculateFaceTrackingTransform](v19, "calculateFaceTrackingTransform");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cameraTransform");
    v56 = v22;
    v57 = v21;
    v54 = v24;
    v55 = v23;
    objc_msgSend(v20, "cameraTransform");
    *(float *)&v44 = a7;
    +[JFXFaceTrackingTransformCalculator interpolateFrom:to:fraction:](JFXFaceTrackingTransformCalculator, "interpolateFrom:to:fraction:", v57, v56, v55, v54, v25, v26, v27, v28, v44);
    objc_msgSend(v11, "transformForTrackingType:", a4);
    v50 = v30;
    v52 = v29;
    v46 = v32;
    v48 = v31;
    objc_msgSend(v20, "transformForTrackingType:", a6);
    *(float *)&v45 = a7;
    +[JFXFaceTrackingTransformCalculator interpolateFrom:to:fraction:](JFXFaceTrackingTransformCalculator, "interpolateFrom:to:fraction:", v52, v50, v48, v46, v33, v34, v35, v36, v45);
    v51 = v38;
    v53 = v37;
    v47 = v40;
    v49 = v39;
    v41 = [JFXFaceTrackedEffectTransform alloc];
    objc_msgSend(v11, "cameraProjection");
    v42 = -[JFXFaceTrackedEffectTransform initWithCameraProjection:cameraTransform:onFaceTransform:billboardTransform:](v41, "initWithCameraProjection:cameraTransform:onFaceTransform:billboardTransform:", v53, v51, v49, v47, v53, v51, v49, v47);

  }
  else
  {
    v42 = 0;
  }

  return v42;
}

+ (id)CFX_fadeTimingParameters
{
  if (CFX_fadeTimingParameters_onceToken != -1)
    dispatch_once(&CFX_fadeTimingParameters_onceToken, &__block_literal_global_26);
  return (id)CFX_fadeTimingParameters_sFadeTimingParameters;
}

void __63__CFXFullScreenTextEditViewController_CFX_fadeTimingParameters__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6DC8]), "initWithDampingRatio:", 0.968245837);
  v1 = (void *)CFX_fadeTimingParameters_sFadeTimingParameters;
  CFX_fadeTimingParameters_sFadeTimingParameters = v0;

}

- (void)CFX_animateWithDuration:(double)a3 animatingIn:(BOOL)a4 completion:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  BOOL v15;

  v8 = a5;
  objc_msgSend((id)objc_opt_class(), "CFX_fadeTimingParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6FA8]), "initWithDuration:timingParameters:", v9, a3);
  v11 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __86__CFXFullScreenTextEditViewController_CFX_animateWithDuration_animatingIn_completion___block_invoke;
  v14[3] = &unk_24EE57C98;
  v14[4] = self;
  v15 = a4;
  objc_msgSend(v10, "addAnimations:", v14);
  if (v8)
  {
    v12[0] = v11;
    v12[1] = 3221225472;
    v12[2] = __86__CFXFullScreenTextEditViewController_CFX_animateWithDuration_animatingIn_completion___block_invoke_2;
    v12[3] = &unk_24EE587E0;
    v13 = v8;
    objc_msgSend(v10, "addCompletion:", v12);

  }
  objc_msgSend(v10, "setUserInteractionEnabled:", 0);
  objc_msgSend(v10, "startAnimation");

}

void __86__CFXFullScreenTextEditViewController_CFX_animateWithDuration_animatingIn_completion___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  if (*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  else
    v1 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "dimmingView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

uint64_t __86__CFXFullScreenTextEditViewController_CFX_animateWithDuration_animatingIn_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (CFXEffect)textEffect
{
  return self->_textEffect;
}

- (CFXEffect)workingEffect
{
  return self->_workingEffect;
}

- (void)setWorkingEffect:(id)a3
{
  objc_storeStrong((id *)&self->_workingEffect, a3);
}

- (CFXEffectEditorView)effectEditor
{
  return self->_effectEditor;
}

- (void)setEffectEditor:(id)a3
{
  objc_storeStrong((id *)&self->_effectEditor, a3);
}

- (CFXFullScreenTextEditViewControllerDelegate)delegate
{
  return (CFXFullScreenTextEditViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)effectWasRemoved
{
  return self->_effectWasRemoved;
}

- (void)setEffectWasRemoved:(BOOL)a3
{
  self->_effectWasRemoved = a3;
}

- (CGRect)effectEditorFrameRelativeToScreen
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_effectEditorFrameRelativeToScreen.origin.x;
  y = self->_effectEditorFrameRelativeToScreen.origin.y;
  width = self->_effectEditorFrameRelativeToScreen.size.width;
  height = self->_effectEditorFrameRelativeToScreen.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setEffectEditorFrameRelativeToScreen:(CGRect)a3
{
  self->_effectEditorFrameRelativeToScreen = a3;
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
  objc_storeStrong((id *)&self->_dimmingView, a3);
}

- (BOOL)isRunningAnimation
{
  return self->_isRunningAnimation;
}

- (void)setIsRunningAnimation:(BOOL)a3
{
  self->_isRunningAnimation = a3;
}

- (BOOL)insertingEffect
{
  return self->_insertingEffect;
}

- (void)setInsertingEffect:(BOOL)a3
{
  self->_insertingEffect = a3;
}

- (JFXOverlayEffectDebugViewOptions)debugOptions
{
  return self->_debugOptions;
}

- (void)setDebugOptions:(id)a3
{
  objc_storeStrong((id *)&self->_debugOptions, a3);
}

- (UIView)debugView
{
  return self->_debugView;
}

- (void)setDebugView:(id)a3
{
  objc_storeStrong((id *)&self->_debugView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugView, 0);
  objc_storeStrong((id *)&self->_debugOptions, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_effectEditor, 0);
  objc_storeStrong((id *)&self->_workingEffect, 0);
  objc_storeStrong((id *)&self->_textEffect, 0);
}

@end
