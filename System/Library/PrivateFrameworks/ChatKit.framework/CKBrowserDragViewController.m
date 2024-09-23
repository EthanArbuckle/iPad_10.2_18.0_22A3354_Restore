@implementation CKBrowserDragViewController

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CKBrowserDragViewController;
  -[CKBrowserDragViewController dealloc](&v4, sel_dealloc);
}

- (CKBrowserDragViewController)initWithDragImage:(id)a3 inSourceRect:(CGRect)a4 withSourcePoint:(CGPoint)a5 keyboardSourceRect:(CGRect)a6 keyboardSourcePoint:(CGPoint)a7 withGestureRecognizer:(id)a8
{
  CGFloat x;
  CGFloat y;
  CGFloat v10;
  double height;
  double width;
  double v13;
  double v14;
  id v16;
  id v17;
  CKBrowserDragViewController *v18;
  CKBrowserDragViewController *v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  objc_super v27;
  float64_t v28;
  float64_t v29;

  x = a7.x;
  y = a5.y;
  v10 = a5.x;
  height = a4.size.height;
  width = a4.size.width;
  v13 = a4.origin.y;
  v14 = a4.origin.x;
  v16 = a3;
  v17 = *(id *)&x;
  v27.receiver = self;
  v27.super_class = (Class)CKBrowserDragViewController;
  v18 = -[CKBrowserDragViewController initWithNibName:bundle:](&v27, sel_initWithNibName_bundle_, 0, 0);
  v19 = v18;
  if (v18)
  {
    -[CKBrowserDragViewController setGestureRecognizer:](v18, "setGestureRecognizer:", v17);
    -[CKBrowserDragViewController setDragImage:](v19, "setDragImage:", v16);
    -[CKBrowserDragViewController setSourceRect:](v19, "setSourceRect:", v14, v13, width, height);
    -[CKBrowserDragViewController setKeyboardSourceRect:](v19, "setKeyboardSourceRect:", a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
    v20.f64[0] = v14;
    v21.f64[0] = width;
    v22.f64[0] = v10;
    -[CKBrowserDragViewController setAnchorOffset:](v19, "setAnchorOffset:", CKAnchorOffset(v20, v13, v21, height, v22, y));
    v23.f64[0] = a6.origin.x;
    v24.f64[0] = a6.size.width;
    v25.f64[0] = v28;
    -[CKBrowserDragViewController setKeyboardAnchorOffset:](v19, "setKeyboardAnchorOffset:", CKAnchorOffset(v23, a6.origin.y, v24, a6.size.height, v25, v29));
  }

  return v19;
}

- (double)absoluteScale
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  -[CKBrowserDragViewController dragViewScale](self, "dragViewScale");
  v4 = v3;
  -[CKBrowserDragViewController normalDragView](self, "normalDragView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "initialScale");
  v7 = v4 * v6;

  return v7;
}

- (void)animateBackToSourceCompletionBlock:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
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
  uint64_t v25;
  double v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  double v30;
  id v31;

  v31 = a3;
  -[CKBrowserDragViewController sourceRect](self, "sourceRect");
  v27 = v5;
  v29 = v4;
  v25 = v6;
  v8 = v7;
  v9 = MEMORY[0x1E0C9D648];
  if (CKMainScreenScale_once_84 != -1)
    dispatch_once(&CKMainScreenScale_once_84, &__block_literal_global_257_1);
  v10 = *(double *)(v9 + 16);
  v11 = *(double *)(v9 + 24);
  v12 = *(double *)&CKMainScreenScale_sMainScreenScale_84;
  -[CKBrowserDragViewController keyboardSourceRect](self, "keyboardSourceRect", v25, v27, v29);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  if (CKMainScreenScale_once_84 != -1)
    dispatch_once(&CKMainScreenScale_once_84, &__block_literal_global_257_1);
  if (v12 == 0.0)
    v21 = 1.0;
  else
    v21 = v12;
  v22 = 1.0 / v21 * (v26 * v21 + floor((v8 * v21 - v11 * v21) * 0.5));
  v23 = 1.0 / v21 * (v30 * v21 + floor((v28 * v21 - v10 * v21) * 0.5));
  v24 = *(double *)&CKMainScreenScale_sMainScreenScale_84;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_84 == 0.0)
    v24 = 1.0;
  -[CKBrowserDragViewController _reversePeelAnimationToPoint:keyboardPoint:forPlacement:shouldShrink:completionBlock:](self, "_reversePeelAnimationToPoint:keyboardPoint:forPlacement:shouldShrink:completionBlock:", 0, 0, v31, v23, v22, 1.0 / v24 * (v14 * v24 + floor((v18 * v24 - v10 * v24) * 0.5)), 1.0 / v24 * (v16 * v24 + floor((v20 * v24 - v11 * v24) * 0.5)));

}

- (void)animatePlacementAtPoint:(CGPoint)a3 shouldShrink:(BOOL)a4 completionBlock:(id)a5
{
  -[CKBrowserDragViewController _reversePeelAnimationToPoint:keyboardPoint:forPlacement:shouldShrink:completionBlock:](self, "_reversePeelAnimationToPoint:keyboardPoint:forPlacement:shouldShrink:completionBlock:", 1, a4, a5, a3.x, a3.y, a3.x, a3.y);
}

- (void)_reversePeelAnimationToPoint:(CGPoint)a3 keyboardPoint:(CGPoint)a4 forPlacement:(BOOL)a5 shouldShrink:(BOOL)a6 completionBlock:(id)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  double y;
  double x;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v7 = a6;
  v8 = a5;
  y = a3.y;
  x = a3.x;
  v12 = a7;
  -[CKBrowserDragViewController normalDragView](self, "normalDragView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __116__CKBrowserDragViewController__reversePeelAnimationToPoint_keyboardPoint_forPlacement_shouldShrink_completionBlock___block_invoke;
  v15[3] = &unk_1E274AED0;
  v16 = v12;
  v14 = v12;
  objc_msgSend(v13, "reversePeelAnimationToPoint:forPlacement:shouldShrink:completionBlock:", v8, v7, v15, x, y);

}

uint64_t __116__CKBrowserDragViewController__reversePeelAnimationToPoint_keyboardPoint_forPlacement_shouldShrink_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setPlusImageViewHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[CKBrowserDragViewController normalDragView](self, "normalDragView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlusImageViewHidden:", v3);

  -[CKBrowserDragViewController keyboardDragView](self, "keyboardDragView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPlusImageViewHidden:", v3);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  CKBrowserDragStickerView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  CKBrowserDragStickerView *v15;
  _BOOL8 v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CKBrowserDragStickerView *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  CKBrowserDragStickerView *v33;
  _BOOL8 v34;
  void *v35;
  _BOOL8 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  objc_super v46;

  v46.receiver = self;
  v46.super_class = (Class)CKBrowserDragViewController;
  -[CKBrowserDragViewController viewDidLoad](&v46, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_applicationDidEnterBackground_, *MEMORY[0x1E0CEB288], 0);
  -[CKBrowserDragViewController dragImage](self, "dragImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = [CKBrowserDragStickerView alloc];
    -[CKBrowserDragViewController sourceRect](self, "sourceRect");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[CKBrowserDragViewController dragImage](self, "dragImage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[CKBrowserDragStickerView initWithSourceRect:dragImage:](v5, "initWithSourceRect:dragImage:", v14, v7, v9, v11, v13);
    -[CKBrowserDragViewController setNormalDragView:](self, "setNormalDragView:", v15);

    v16 = -[CKBrowserDragViewController canPeel](self, "canPeel");
    -[CKBrowserDragViewController normalDragView](self, "normalDragView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCanPeel:", v16);

    v18 = -[CKBrowserDragViewController isPressed](self, "isPressed");
    -[CKBrowserDragViewController normalDragView](self, "normalDragView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPressed:", v18);

    -[CKBrowserDragViewController view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserDragViewController normalDragView](self, "normalDragView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSubview:", v21);

    -[CKBrowserDragViewController keyboardWindowSourceView](self, "keyboardWindowSourceView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = [CKBrowserDragStickerView alloc];
      -[CKBrowserDragViewController sourceRect](self, "sourceRect");
      v25 = v24;
      v27 = v26;
      v29 = v28;
      v31 = v30;
      -[CKBrowserDragViewController dragImage](self, "dragImage");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[CKBrowserDragStickerView initWithSourceRect:dragImage:](v23, "initWithSourceRect:dragImage:", v32, v25, v27, v29, v31);
      -[CKBrowserDragViewController setKeyboardDragView:](self, "setKeyboardDragView:", v33);

      v34 = -[CKBrowserDragViewController canPeel](self, "canPeel");
      -[CKBrowserDragViewController keyboardDragView](self, "keyboardDragView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setCanPeel:", v34);

      v36 = -[CKBrowserDragViewController isPressed](self, "isPressed");
      -[CKBrowserDragViewController keyboardDragView](self, "keyboardDragView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setPressed:", v36);

      -[CKBrowserDragViewController keyboardWindowSourceView](self, "keyboardWindowSourceView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBrowserDragViewController keyboardDragView](self, "keyboardDragView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addSubview:", v39);

    }
  }
  -[CKBrowserDragViewController gestureRecognizer](self, "gestureRecognizer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addTarget:action:", self, sel_gestureRecognized_);

  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7F8]), "initWithTarget:action:", self, sel_panGestureRecognized_);
  -[CKBrowserDragViewController view](self, "view");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addGestureRecognizer:", v41);

  -[CKBrowserDragViewController setPanGestureRecognizer:](self, "setPanGestureRecognizer:", v41);
  -[CKBrowserDragViewController keyboardWindowSourceView](self, "keyboardWindowSourceView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7F8]), "initWithTarget:action:", self, sel_panGestureRecognized_);
    -[CKBrowserDragViewController keyboardWindowSourceView](self, "keyboardWindowSourceView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addGestureRecognizer:", v44);

    -[CKBrowserDragViewController setKeyboardPanGestureRecognizer:](self, "setKeyboardPanGestureRecognizer:", v44);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)CKBrowserDragViewController;
  -[CKBrowserDragViewController viewDidAppear:](&v26, sel_viewDidAppear_, a3);
  -[CKBrowserDragViewController keyboardDragView](self, "keyboardDragView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "animatePeelWithCompletion:", 0);

  -[CKBrowserDragViewController normalDragView](self, "normalDragView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "animatePeelWithCompletion:", 0);

  -[CKBrowserDragViewController gestureRecognizer](self, "gestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserDragViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationInView:", v7);
  v9 = v8;
  v11 = v10;
  -[CKBrowserDragViewController normalDragView](self, "normalDragView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setInitialDragStartPosition:", v9, v11);

  -[CKBrowserDragViewController gestureRecognizer](self, "gestureRecognizer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserDragViewController keyboardWindowSourceView](self, "keyboardWindowSourceView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "locationInView:", v14);
  v16 = v15;
  v18 = v17;
  -[CKBrowserDragViewController keyboardDragView](self, "keyboardDragView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setInitialDragStartPosition:", v16, v18);

  if (!-[CKBrowserDragViewController isPressed](self, "isPressed"))
  {
    -[CKBrowserDragViewController setPressed:](self, "setPressed:", 1);
    -[CKBrowserDragViewController normalDragView](self, "normalDragView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserDragViewController normalDragView](self, "normalDragView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "initialDragStartPosition");
    objc_msgSend(v20, "attachElasticEffectsForLocation:");

    -[CKBrowserDragViewController keyboardDragView](self, "keyboardDragView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserDragViewController keyboardDragView](self, "keyboardDragView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "initialDragStartPosition");
    objc_msgSend(v22, "attachElasticEffectsForLocation:");

  }
  -[CKBrowserDragViewController normalDragView](self, "normalDragView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "updateAnimationTimerObserving");

  -[CKBrowserDragViewController keyboardDragView](self, "keyboardDragView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "updateAnimationTimerObserving");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKBrowserDragViewController;
  -[CKBrowserDragViewController viewDidDisappear:](&v9, sel_viewDidDisappear_, a3);
  -[CKBrowserDragViewController normalDragView](self, "normalDragView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateAnimationTimerObserving");

  -[CKBrowserDragViewController keyboardDragView](self, "keyboardDragView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateAnimationTimerObserving");

  -[CKBrowserDragViewController keyboardDragView](self, "keyboardDragView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  -[CKBrowserDragViewController keyboardWindowSourceView](self, "keyboardWindowSourceView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserDragViewController keyboardPanGestureRecognizer](self, "keyboardPanGestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeGestureRecognizer:", v8);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  id v5;

  -[CKBrowserDragViewController delegate](self, "delegate", a4, a3.width, a3.height);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "browserDragViewController:dragEndedWithTarget:", self, 0);

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKBrowserDragViewController;
  -[CKBrowserDragViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v5, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  -[CKBrowserDragViewController setHasMovedToWindow:](self, "setHasMovedToWindow:", 1);
}

- (void)gestureRecognized:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;

  v35 = a3;
  -[CKBrowserDragViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5 && -[CKBrowserDragViewController hasMovedToWindow](self, "hasMovedToWindow"))
  {

LABEL_13:
    -[CKBrowserDragViewController setPressed:](self, "setPressed:", 0);
    -[CKBrowserDragViewController normalDragView](self, "normalDragView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "detachElasticEffects");

    -[CKBrowserDragViewController keyboardDragView](self, "keyboardDragView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "detachElasticEffects");

    -[CKBrowserDragViewController commitDrag](self, "commitDrag");
    goto LABEL_14;
  }
  if (objc_msgSend(v35, "state") == 1)
  {

  }
  else
  {
    v6 = objc_msgSend(v35, "state");

    if (v6 != 2)
      goto LABEL_13;
  }
  if (-[CKBrowserDragViewController isPressed](self, "isPressed"))
  {
    -[CKBrowserDragViewController normalDragView](self, "normalDragView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserDragViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "locationInView:", v8);
    objc_msgSend(v7, "updateElasticEffectsForLocation:");

    -[CKBrowserDragViewController keyboardDragView](self, "keyboardDragView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserDragViewController keyboardWindowSourceView](self, "keyboardWindowSourceView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "locationInView:", v10);
    objc_msgSend(v9, "updateElasticEffectsForLocation:");

  }
  if (-[CKBrowserDragViewController _orbScalingEnabled](self, "_orbScalingEnabled")
    && -[CKBrowserDragViewController canScale](self, "canScale"))
  {
    objc_msgSend(v35, "touches");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "force");
    v14 = v13;
    objc_msgSend(v12, "maximumPossibleForce");
    v16 = v14 / v15 + v14 / v15;
    -[CKBrowserDragViewController normalDragView](self, "normalDragView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDragViewScale:", v16);

    -[CKBrowserDragViewController keyboardDragView](self, "keyboardDragView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDragViewScale:", v16);

  }
  -[CKBrowserDragViewController dragViewCenter](self, "dragViewCenter");
  v20 = v19;
  v22 = v21;
  -[CKBrowserDragViewController normalDragView](self, "normalDragView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "initialSize");
  v25 = v24;
  v27 = v26;
  -[CKBrowserDragViewController absoluteScale](self, "absoluteScale");
  v29 = v28;
  -[CKBrowserDragViewController rotationAngle](self, "rotationAngle");
  +[CKBrowserDragControllerTarget targetWithScreenCoordinate:initialSize:scale:meshScaleFactor:rotation:associatedLayoutIntent:](CKBrowserDragControllerTarget, "targetWithScreenCoordinate:initialSize:scale:meshScaleFactor:rotation:associatedLayoutIntent:", 0, v20, v22, v25, v27, v29, 1.4, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKBrowserDragViewController delegate](self, "delegate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "browserDragViewController:draggedWithTarget:", self, v31);

LABEL_14:
}

- (CGPoint)dragViewCenter
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[CKBrowserDragViewController normalDragView](self, "normalDragView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dragViewCenter");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGPoint)keyboardDragViewCenter
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[CKBrowserDragViewController keyboardDragView](self, "keyboardDragView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dragViewCenter");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)manuallyInitializeDragAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  id v7;

  y = a3.y;
  x = a3.x;
  -[CKBrowserDragViewController setPressed:](self, "setPressed:", 1);
  -[CKBrowserDragViewController normalDragView](self, "normalDragView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attachElasticEffectsForLocation:", x, y);

  -[CKBrowserDragViewController keyboardDragView](self, "keyboardDragView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attachElasticEffectsForLocation:", x, y);

}

- (void)manuallyUpdateDragPositionToPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  id v7;

  y = a3.y;
  x = a3.x;
  -[CKBrowserDragViewController normalDragView](self, "normalDragView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateElasticEffectsForLocation:", x, y);

  -[CKBrowserDragViewController keyboardDragView](self, "keyboardDragView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateElasticEffectsForLocation:", x, y);

}

- (void)panGestureRecognized:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  CKBrowserDragViewController *v8;
  double v9;
  double v10;
  CKBrowserDragViewController *v11;
  double v12;
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
  double v25;
  double v26;
  double v27;
  double v28;
  long double v29;
  double v30;
  float v31;
  float v32;
  double v33;
  float v34;
  float v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  id v45;

  v45 = a3;
  -[CKBrowserDragViewController keyboardPanGestureRecognizer](self, "keyboardPanGestureRecognizer");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v45)
  {
    -[CKBrowserDragViewController keyboardWindowSourceView](self, "keyboardWindowSourceView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v45, "state") == 1)
    {
      objc_msgSend(v45, "locationInView:", v5);
      v11 = self;
      goto LABEL_21;
    }
  }
  else
  {
    -[CKBrowserDragViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v45, "state") == 1)
    {
      objc_msgSend(v45, "locationInView:", v5);
      v8 = self;
LABEL_19:
      -[CKBrowserDragViewController setPreviousPanLocationInView:](v8, "setPreviousPanLocationInView:", v6, v7);
      goto LABEL_22;
    }
  }
  if (objc_msgSend(v45, "state") == 2)
  {
    objc_msgSend(v45, "locationInView:", v5);
    v13 = v12;
    v15 = v14;
    if (v4 == v45)
    {
      -[CKBrowserDragViewController previousPanLocationInKeyboardView](self, "previousPanLocationInKeyboardView");
      v17 = v24;
      v19 = v25;
      -[CKBrowserDragViewController keyboardDragViewCenter](self, "keyboardDragViewCenter");
    }
    else
    {
      -[CKBrowserDragViewController previousPanLocationInView](self, "previousPanLocationInView");
      v17 = v16;
      v19 = v18;
      -[CKBrowserDragViewController dragViewCenter](self, "dragViewCenter");
    }
    v26 = v20;
    v27 = v21;
    if (-[CKBrowserDragViewController canRotate](self, "canRotate"))
    {
      v28 = atan2(v15 - v27, v13 - v26);
      v29 = v28 - atan2(v19 - v27, v17 - v26);
      -[CKBrowserDragViewController rotationAngle](self, "rotationAngle");
      -[CKBrowserDragViewController setRotationAngle:](self, "setRotationAngle:", (double)(v29 + v30));
    }
    if (!-[CKBrowserDragViewController _orbScalingEnabled](self, "_orbScalingEnabled")
      && -[CKBrowserDragViewController canScale](self, "canScale"))
    {
      v31 = v26 - v17;
      v32 = v27 - v19;
      v33 = hypotf(v31, v32);
      v34 = v26 - v13;
      v35 = v27 - v15;
      v36 = hypotf(v34, v35) - v33;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "dragPinchGestureScaleFactor");
      v39 = v36 / v38;

      -[CKBrowserDragViewController normalDragView](self, "normalDragView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "dragViewScale");
      v42 = v39 + v41;

      -[CKBrowserDragViewController normalDragView](self, "normalDragView");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setDragViewScale:", v42);

      -[CKBrowserDragViewController keyboardDragView](self, "keyboardDragView");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setDragViewScale:", v42);

    }
    -[CKBrowserDragViewController setPreviousPanLocationInView:](self, "setPreviousPanLocationInView:", v13, v15);
    if (v4 != v45)
    {
      v8 = self;
      v6 = v13;
      v7 = v15;
      goto LABEL_19;
    }
    v11 = self;
    v9 = v13;
    v10 = v15;
LABEL_21:
    -[CKBrowserDragViewController setPreviousPanLocationInKeyboardView:](v11, "setPreviousPanLocationInKeyboardView:", v9, v10);
    goto LABEL_22;
  }
  if (objc_msgSend(v45, "state") == 3)
  {
    v22 = *MEMORY[0x1E0C9D538];
    v23 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[CKBrowserDragViewController setPreviousPanLocationInView:](self, "setPreviousPanLocationInView:", *MEMORY[0x1E0C9D538], v23);
    v11 = self;
    v9 = v22;
    v10 = v23;
    goto LABEL_21;
  }
LABEL_22:

}

- (BOOL)_orbScalingEnabled
{
  return 0;
}

- (double)dragViewScale
{
  void *v2;
  double v3;
  double v4;

  -[CKBrowserDragViewController normalDragView](self, "normalDragView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dragViewScale");
  v4 = v3;

  return v4;
}

- (void)applicationDidEnterBackground:(id)a3
{
  id v4;

  -[CKBrowserDragViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "browserDragViewController:dragEndedWithTarget:", self, 0);

}

- (void)commitDrag
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;

  -[CKBrowserDragViewController gestureRecognizer](self, "gestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTarget:action:", self, sel_gestureRecognized_);

  -[CKBrowserDragViewController setGestureRecognizer:](self, "setGestureRecognizer:", 0);
  -[CKBrowserDragViewController dragViewCenter](self, "dragViewCenter");
  v5 = v4;
  v7 = v6;
  -[CKBrowserDragViewController normalDragView](self, "normalDragView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "initialSize");
  v10 = v9;
  v12 = v11;
  -[CKBrowserDragViewController absoluteScale](self, "absoluteScale");
  v14 = v13;
  -[CKBrowserDragViewController rotationAngle](self, "rotationAngle");
  +[CKBrowserDragControllerTarget targetWithScreenCoordinate:initialSize:scale:meshScaleFactor:rotation:associatedLayoutIntent:](CKBrowserDragControllerTarget, "targetWithScreenCoordinate:initialSize:scale:meshScaleFactor:rotation:associatedLayoutIntent:", 0, v5, v7, v10, v12, v14, 1.4, v15);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  -[CKBrowserDragViewController delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "browserDragViewController:dragEndedWithTarget:", self, v17);

}

- (void)setRotationAngle:(double)a3
{
  void *v5;
  id v6;

  -[CKBrowserDragViewController normalDragView](self, "normalDragView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRotationAngle:", a3);

  -[CKBrowserDragViewController keyboardDragView](self, "keyboardDragView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRotationAngle:", a3);

}

- (double)rotationAngle
{
  void *v2;
  double v3;
  double v4;

  -[CKBrowserDragViewController normalDragView](self, "normalDragView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rotationAngle");
  v4 = v3;

  return v4;
}

- (void)setPressed:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  if (self->_pressed != a3)
  {
    v3 = a3;
    self->_pressed = a3;
    -[CKBrowserDragViewController normalDragView](self, "normalDragView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPressed:", v3);

    -[CKBrowserDragViewController keyboardDragView](self, "keyboardDragView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPressed:", v3);

  }
}

- (void)setCanPeel:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  if (self->_canPeel != a3)
  {
    v3 = a3;
    self->_canPeel = a3;
    -[CKBrowserDragViewController normalDragView](self, "normalDragView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCanPeel:", v3);

    -[CKBrowserDragViewController keyboardDragView](self, "keyboardDragView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCanPeel:", v3);

  }
}

+ (BOOL)supportsForceTouch
{
  if (supportsForceTouch_once != -1)
    dispatch_once(&supportsForceTouch_once, &__block_literal_global_204);
  return supportsForceTouch_supportsForceTouch;
}

uint64_t __49__CKBrowserDragViewController_supportsForceTouch__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  supportsForceTouch_supportsForceTouch = result;
  return result;
}

- (id)draggedSticker
{
  void *v2;
  void *v3;

  -[CKBrowserDragViewController normalDragView](self, "normalDragView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "draggedSticker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CKBrowserDragViewControllerDelegate)delegate
{
  return (CKBrowserDragViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)dragViewRotation
{
  return self->_dragViewRotation;
}

- (BOOL)canRotate
{
  return self->_canRotate;
}

- (void)setCanRotate:(BOOL)a3
{
  self->_canRotate = a3;
}

- (BOOL)canScale
{
  return self->_canScale;
}

- (void)setCanScale:(BOOL)a3
{
  self->_canScale = a3;
}

- (BOOL)canPeel
{
  return self->_canPeel;
}

- (UIView)keyboardWindowSourceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_keyboardWindowSourceView);
}

- (void)setKeyboardWindowSourceView:(id)a3
{
  objc_storeWeak((id *)&self->_keyboardWindowSourceView, a3);
}

- (UILongPressGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void)setGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_gestureRecognizer, a3);
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_panGestureRecognizer, a3);
}

- (CKAnimatedImage)dragImage
{
  return self->_dragImage;
}

- (void)setDragImage:(id)a3
{
  objc_storeStrong((id *)&self->_dragImage, a3);
}

- (CKBrowserDragStickerView)normalDragView
{
  return self->_normalDragView;
}

- (void)setNormalDragView:(id)a3
{
  objc_storeStrong((id *)&self->_normalDragView, a3);
}

- (CKBrowserDragStickerView)keyboardDragView
{
  return self->_keyboardDragView;
}

- (void)setKeyboardDragView:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardDragView, a3);
}

- (BOOL)isPressed
{
  return self->_pressed;
}

- (UIPanGestureRecognizer)keyboardPanGestureRecognizer
{
  return self->_keyboardPanGestureRecognizer;
}

- (void)setKeyboardPanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardPanGestureRecognizer, a3);
}

- (CGRect)sourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceRect.origin.x;
  y = self->_sourceRect.origin.y;
  width = self->_sourceRect.size.width;
  height = self->_sourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (CGRect)keyboardSourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_keyboardSourceRect.origin.x;
  y = self->_keyboardSourceRect.origin.y;
  width = self->_keyboardSourceRect.size.width;
  height = self->_keyboardSourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setKeyboardSourceRect:(CGRect)a3
{
  self->_keyboardSourceRect = a3;
}

- (CGPoint)anchorOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_anchorOffset.x;
  y = self->_anchorOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAnchorOffset:(CGPoint)a3
{
  self->_anchorOffset = a3;
}

- (CGPoint)keyboardAnchorOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_keyboardAnchorOffset.x;
  y = self->_keyboardAnchorOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setKeyboardAnchorOffset:(CGPoint)a3
{
  self->_keyboardAnchorOffset = a3;
}

- (CGPoint)previousPanLocationInView
{
  double x;
  double y;
  CGPoint result;

  x = self->_previousPanLocationInView.x;
  y = self->_previousPanLocationInView.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPreviousPanLocationInView:(CGPoint)a3
{
  self->_previousPanLocationInView = a3;
}

- (CGPoint)previousPanLocationInKeyboardView
{
  double x;
  double y;
  CGPoint result;

  x = self->_previousPanLocationInKeyboardView.x;
  y = self->_previousPanLocationInKeyboardView.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPreviousPanLocationInKeyboardView:(CGPoint)a3
{
  self->_previousPanLocationInKeyboardView = a3;
}

- (BOOL)hasMovedToWindow
{
  return self->_hasMovedToWindow;
}

- (void)setHasMovedToWindow:(BOOL)a3
{
  self->_hasMovedToWindow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_keyboardDragView, 0);
  objc_storeStrong((id *)&self->_normalDragView, 0);
  objc_storeStrong((id *)&self->_dragImage, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_keyboardWindowSourceView);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
