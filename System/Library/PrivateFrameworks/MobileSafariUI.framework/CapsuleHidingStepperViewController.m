@implementation CapsuleHidingStepperViewController

- (void)viewDidLoad
{
  UIPanGestureRecognizer *v3;
  UIPanGestureRecognizer *panRecognizer;
  UITapGestureRecognizer *v5;
  UITapGestureRecognizer *tapRecognizer;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CapsuleHidingStepperViewController;
  -[StepperViewController viewDidLoad](&v7, sel_viewDidLoad);
  v3 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", self, sel__didReceivePan_);
  panRecognizer = self->_panRecognizer;
  self->_panRecognizer = v3;

  -[UIPanGestureRecognizer setDelegate:](self->_panRecognizer, "setDelegate:", self);
  v5 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__didReceiveTap_);
  tapRecognizer = self->_tapRecognizer;
  self->_tapRecognizer = v5;

  -[UITapGestureRecognizer setDelegate:](self->_tapRecognizer, "setDelegate:", self);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CapsuleHidingStepperViewController;
  -[CapsuleHidingStepperViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  WeakRetained = objc_loadWeakRetained((id *)&self->_capsuleViewController);
  objc_msgSend(WeakRetained, "beginHidingCapsuleAnimated:", v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CapsuleHidingStepperViewController;
  -[CapsuleHidingStepperViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[CapsuleHidingStepperViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addGestureRecognizer:", self->_panRecognizer);
  objc_msgSend(v5, "addGestureRecognizer:", self->_tapRecognizer);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CapsuleHidingStepperViewController;
  -[CapsuleHidingStepperViewController viewWillDisappear:](&v8, sel_viewWillDisappear_);
  WeakRetained = objc_loadWeakRetained((id *)&self->_capsuleViewController);
  objc_msgSend(WeakRetained, "endHidingCapsuleAnimated:", v3);

  -[UIPanGestureRecognizer view](self->_panRecognizer, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeGestureRecognizer:", self->_panRecognizer);

  -[UITapGestureRecognizer view](self->_tapRecognizer, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeGestureRecognizer:", self->_tapRecognizer);

}

- (void)_didReceiveTap:(id)a3
{
  -[CapsuleHidingStepperViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_didReceivePan:(id)a3
{
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  id WeakRetained;
  id v9;

  v9 = a3;
  v4 = objc_msgSend(v9, "state");
  if ((unint64_t)(v4 - 3) >= 3)
  {
    if (v4 != 2)
      goto LABEL_3;
    -[CapsuleHidingStepperViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "translationInView:", v5);
    v7 = v6;

    if (v7 < 0.0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_capsuleViewController);
      objc_msgSend(WeakRetained, "transitionToState:animated:completionHandler:", 1, 0, 0);

    }
  }
  -[CapsuleHidingStepperViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
LABEL_3:

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  int v4;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  if (self->_tapRecognizer == a3)
  {
    v6 = a4;
    -[CapsuleHidingStepperViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locationInView:", v7);
    v9 = v8;
    v11 = v10;

    v4 = objc_msgSend(v7, "pointInside:withEvent:", 0, v9, v11) ^ 1;
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (CapsuleNavigationBarViewController)capsuleViewController
{
  return (CapsuleNavigationBarViewController *)objc_loadWeakRetained((id *)&self->_capsuleViewController);
}

- (void)setCapsuleViewController:(id)a3
{
  objc_storeWeak((id *)&self->_capsuleViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_capsuleViewController);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_panRecognizer, 0);
}

@end
