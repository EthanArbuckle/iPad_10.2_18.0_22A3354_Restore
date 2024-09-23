@implementation CKAdaptivePresentationController

+ (id)sharedInstance
{
  if (sharedInstance_once_0 != -1)
    dispatch_once(&sharedInstance_once_0, &__block_literal_global_102);
  return (id)sharedInstance_sSharedInstance_0;
}

void __50__CKAdaptivePresentationController_sharedInstance__block_invoke()
{
  CKAdaptivePresentationController *v0;
  void *v1;

  v0 = objc_alloc_init(CKAdaptivePresentationController);
  v1 = (void *)sharedInstance_sSharedInstance_0;
  sharedInstance_sSharedInstance_0 = (uint64_t)v0;

}

- (void)dealloc
{
  objc_super v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[UIViewController setAlertDelegate:](self->_presentedViewController, "setAlertDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CKAdaptivePresentationController;
  -[CKAdaptivePresentationController dealloc](&v3, sel_dealloc);
}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  void (**presentationHandler)(id, CGRect *, id *);

  presentationHandler = (void (**)(id, CGRect *, id *))self->_presentationHandler;
  if (presentationHandler)
    presentationHandler[2](presentationHandler, a4, a5);
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  id v4;
  void *v5;
  void (**dismissalHandler)(id, id);
  id v7;

  v7 = a3;
  -[CKAdaptivePresentationController currentPresentationController](self, "currentPresentationController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4 == v7)
  {
    dismissalHandler = (void (**)(id, id))self->_dismissalHandler;
    if (dismissalHandler)
      dismissalHandler[2](dismissalHandler, v7);
    -[CKAdaptivePresentationController _cleanup](self, "_cleanup");
    v5 = v7;
  }

}

- (void)presentViewController:(id)a3 fromViewController:(id)a4 barButtonItemPresentationHandler:(id)a5 dismissalHandler:(id)a6 animated:(BOOL)a7 completion:(id)a8
{
  -[CKAdaptivePresentationController _presentViewController:fromViewController:presentationHandler:barButtonItemPresentationHandler:dismissalHandler:animated:completion:](self, "_presentViewController:fromViewController:presentationHandler:barButtonItemPresentationHandler:dismissalHandler:animated:completion:", a3, a4, 0, a5, a6, a7, a8);
}

- (void)presentViewController:(id)a3 fromViewController:(id)a4 presentationHandler:(id)a5 dismissalHandler:(id)a6 animated:(BOOL)a7 completion:(id)a8
{
  -[CKAdaptivePresentationController _presentViewController:fromViewController:presentationHandler:barButtonItemPresentationHandler:dismissalHandler:animated:completion:](self, "_presentViewController:fromViewController:presentationHandler:barButtonItemPresentationHandler:dismissalHandler:animated:completion:", a3, a4, a5, 0, a6, a7, a8);
}

- (void)_presentViewController:(id)a3 fromViewController:(id)a4 presentationHandler:(id)a5 barButtonItemPresentationHandler:(id)a6 dismissalHandler:(id)a7 animated:(BOOL)a8 completion:(id)a9
{
  _BOOL4 v9;
  id v15;
  id v16;
  void (**v17)(id, _OWORD *, id *);
  void (**v18)(id, id *);
  id v19;
  void (**v20)(_QWORD);
  id v21;
  void *v22;
  int v23;
  void *v24;
  char v25;
  void *v26;
  int v27;
  void *v28;
  __int128 v29;
  id v30;
  id v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  CKPresentationControllerWindow *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  CKPresentationControllerWindow *v61;
  char v62;
  uint64_t v63;
  void *v64;
  unsigned int v65;
  void (**v66)(id, _OWORD *, id *);
  _BOOL4 v67;
  id v68;
  void (**v69)(id, id *);
  id v70;
  id v71;
  __int128 v72;
  __int128 v73;

  v9 = a8;
  v15 = a3;
  v16 = a4;
  v17 = (void (**)(id, _OWORD *, id *))a5;
  v18 = (void (**)(id, id *))a6;
  v19 = a7;
  v20 = (void (**)(_QWORD))a9;
  -[CKAdaptivePresentationController presentedViewController](self, "presentedViewController");
  v21 = (id)objc_claimAutoreleasedReturnValue();

  if (v21 == v15)
  {
    if (_IMWillLog())
      _IMAlwaysLog();
    if (v20)
      v20[2](v20);
  }
  else
  {
    -[CKAdaptivePresentationController presentedViewController](self, "presentedViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
      -[CKAdaptivePresentationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
    -[CKAdaptivePresentationController setPresentedViewController:](self, "setPresentedViewController:", v15);
    -[CKAdaptivePresentationController setPresentationHandler:](self, "setPresentationHandler:", v17);
    -[CKAdaptivePresentationController setDismissalHandler:](self, "setDismissalHandler:", v19);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v23 = objc_msgSend(v15, "forceWindowedPresentation");
    else
      v23 = 0;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "canPresentOverKeyboard")
      && (objc_msgSend(v15, "wantsWindowedPresentation") & 1) != 0)
    {
      v23 = 1;
    }

    v25 = objc_msgSend(v15, "preserveModalPresentationStyle");
    v68 = v19;
    v69 = v18;
    v26 = v16;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v27 = objc_msgSend(v15, "constrainToPresentingVCBounds") ^ 1;
    else
      v27 = 1;
    v67 = v9;
    if ((v25 & 1) != 0)
    {
      v28 = 0;
    }
    else
    {
      objc_msgSend(v15, "setModalPresentationStyle:", 7);
      objc_msgSend(v15, "popoverPresentationController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setDelegate:", self);
      if ((v23 & 1) == 0)
      {
        if (v17)
        {
          v29 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
          v72 = *MEMORY[0x1E0C9D648];
          v73 = v29;
          v71 = 0;
          v17[2](v17, &v72, &v71);
          v30 = v71;
          objc_msgSend(v28, "setSourceView:", v30);
          objc_msgSend(v28, "setSourceRect:", v72, v73);

        }
        if (v18)
        {
          v70 = 0;
          v18[2](v18, &v70);
          v31 = v70;
          objc_msgSend(v28, "setBarButtonItem:", v31);

        }
      }
    }
    -[CKAdaptivePresentationController setCurrentPresentationController:](self, "setCurrentPresentationController:", v28);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v15, "setAlertDelegate:", self);
    if (v23)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v65 = objc_msgSend(v15, "allowsRotation");
      else
        v65 = 0;
      v66 = v17;
      if (v27)
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "bounds");
        v34 = v33;
        v36 = v35;
        v38 = v37;
        v40 = v39;
        v41 = v26;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEAC18], "keyWindow");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v26;
        objc_msgSend(v26, "view");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "bounds");
        v44 = v43;
        v46 = v45;
        v48 = v47;
        v50 = v49;
        objc_msgSend(v26, "view");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "convertRect:fromView:", v51, v44, v46, v48, v50);
        v34 = v52;
        v36 = v53;
        v38 = v54;
        v40 = v55;

      }
      v56 = [CKPresentationControllerWindow alloc];
      v57 = v41;
      objc_msgSend(v41, "view");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "window");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "windowScene");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = -[CKPresentationControllerWindow initWithWindowScene:allowsRotation:restrictedToPortraitOrientation:](v56, "initWithWindowScene:allowsRotation:restrictedToPortraitOrientation:", v60, v65, 0);

      -[CKPresentationControllerWindow setFrame:](v61, "setFrame:", v34, v36, v38, v40);
      -[CKAdaptivePresentationController setPresentationWindow:](self, "setPresentationWindow:", v61);
      v62 = objc_opt_respondsToSelector();
      v63 = 0;
      if ((v62 & 1) != 0)
        v63 = objc_msgSend(v15, "shouldHidePresentingWindow", 0);
      -[CKPresentationControllerWindow setHidden:](v61, "setHidden:", v63);
      -[CKPresentationControllerWindow rootViewController](v61, "rootViewController");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "presentViewController:animated:completion:", v15, v67, v20);

      v16 = v57;
      v17 = v66;
    }
    else
    {
      v16 = v26;
      objc_msgSend(v26, "presentViewController:animated:completion:", v15, v67, v20);
    }
    v19 = v68;
    v18 = v69;

  }
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  CKAdaptivePresentationController *v17;
  id v18;

  v4 = a3;
  v6 = a4;
  -[CKAdaptivePresentationController presentedViewController](self, "presentedViewController");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_4;
  v8 = (void *)v7;
  -[CKAdaptivePresentationController presentedViewController](self, "presentedViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentingViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CKAdaptivePresentationController presentedViewController](self, "presentedViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentingViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __77__CKAdaptivePresentationController_dismissViewControllerAnimated_completion___block_invoke;
    v16 = &unk_1E274DA38;
    v17 = self;
    v18 = v6;
    objc_msgSend(v12, "dismissViewControllerAnimated:completion:", v4, &v13);

    -[CKAdaptivePresentationController setPresentedViewController:](self, "setPresentedViewController:", 0, v13, v14, v15, v16);
  }
  else
  {
LABEL_4:
    -[CKAdaptivePresentationController _cleanup](self, "_cleanup");
  }

}

uint64_t __77__CKAdaptivePresentationController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(_QWORD **)(a1 + 32);
  v4 = v3[5];
  if (v4)
  {
    (*(void (**)(_QWORD, _QWORD))(v4 + 16))(v3[5], 0);
    v3 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v3, "_cleanup");
}

- (void)_cleanup
{
  void *v3;

  -[CKAdaptivePresentationController setPresentedViewController:](self, "setPresentedViewController:", 0);
  -[CKAdaptivePresentationController setCurrentPresentationController:](self, "setCurrentPresentationController:", 0);
  -[CKAdaptivePresentationController presentationWindow](self, "presentationWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[CKAdaptivePresentationController setPresentationWindow:](self, "setPresentationWindow:", 0);
  -[CKAdaptivePresentationController setPresentationHandler:](self, "setPresentationHandler:", 0);
  -[CKAdaptivePresentationController setDismissalHandler:](self, "setDismissalHandler:", 0);
}

- (UIViewController)presentedViewController
{
  return self->_presentedViewController;
}

- (void)setPresentedViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentedViewController, a3);
}

- (UIPopoverPresentationController)currentPresentationController
{
  return self->_currentPresentationController;
}

- (void)setCurrentPresentationController:(id)a3
{
  objc_storeStrong((id *)&self->_currentPresentationController, a3);
}

- (CKPresentationControllerWindow)presentationWindow
{
  return self->_presentationWindow;
}

- (void)setPresentationWindow:(id)a3
{
  objc_storeStrong((id *)&self->_presentationWindow, a3);
}

- (id)presentationHandler
{
  return self->_presentationHandler;
}

- (void)setPresentationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)dismissalHandler
{
  return self->_dismissalHandler;
}

- (void)setDismissalHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissalHandler, 0);
  objc_storeStrong(&self->_presentationHandler, 0);
  objc_storeStrong((id *)&self->_presentationWindow, 0);
  objc_storeStrong((id *)&self->_currentPresentationController, 0);
  objc_storeStrong((id *)&self->_presentedViewController, 0);
}

@end
