@implementation MKLookAroundTransitionController

- (void)beginFullScreenDismissalOfViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  BOOL v16;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "presentingViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transitionCoordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __97__MKLookAroundTransitionController_beginFullScreenDismissalOfViewController_animated_completion___block_invoke;
    v12[3] = &unk_1E20D7D20;
    v12[4] = self;
    v13 = v8;
    v14 = v10;
    v16 = v6;
    v15 = v9;
    objc_msgSend(v11, "animateAlongsideTransition:completion:", 0, v12);

  }
  else
  {
    -[MKLookAroundTransitionController _dismiss:fromViewController:animated:completion:](self, "_dismiss:fromViewController:animated:completion:", v8, v10, v6, v9);
  }

}

uint64_t __97__MKLookAroundTransitionController_beginFullScreenDismissalOfViewController_animated_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismiss:fromViewController:animated:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

- (void)beginFullScreenPresentationOfViewController:(id)a3 fromView:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t i;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  BOOL v24;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[MKLookAroundTransitionController setSourceView:](self, "setSourceView:", v11);
  objc_msgSend(v10, "setTransitioningDelegate:", self);
  if (v11
    && (objc_msgSend(MEMORY[0x1E0CEABB8], "_viewControllerForFullScreenPresentationFromView:", v11),
        (v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v14 = (void *)v13;
  }
  else
  {
    v15 = (id *)MEMORY[0x1E0CEB258];
    if ((objc_msgSend((id)*MEMORY[0x1E0CEB258], "supportsMultipleScenes") & 1) != 0)
    {
      v14 = 0;
    }
    else
    {

      objc_msgSend(*v15, "_mklookaround_possibleWindowForControllingOverallAppearance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "rootViewController");
      for (i = objc_claimAutoreleasedReturnValue(); ; i = objc_claimAutoreleasedReturnValue())
      {
        v14 = (void *)i;

        objc_msgSend(v14, "presentedViewController");
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (!v11)
          break;
        v18 = v14;
        objc_msgSend(v14, "presentedViewController");
      }
    }
  }
  if (v10)
  {
    v16 = (void *)objc_msgSend(v12, "copy");

    objc_msgSend(v14, "transitionCoordinator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __109__MKLookAroundTransitionController_beginFullScreenPresentationOfViewController_fromView_animated_completion___block_invoke;
      v20[3] = &unk_1E20D7D20;
      v20[4] = self;
      v21 = v10;
      v22 = v14;
      v24 = v7;
      v23 = v16;
      objc_msgSend(v17, "animateAlongsideTransition:completion:", 0, v20);

    }
    else
    {
      -[MKLookAroundTransitionController _present:fromViewController:animated:completion:](self, "_present:fromViewController:animated:completion:", v10, v14, v7, v16);
    }

  }
  else
  {
    v16 = v12;
  }

}

uint64_t __109__MKLookAroundTransitionController_beginFullScreenPresentationOfViewController_fromView_animated_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_present:fromViewController:animated:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

- (id)animationControllerForDismissedController:(id)a3
{
  MKLookAroundDismissAnimationController *v4;
  void *v5;
  MKLookAroundDismissAnimationController *v6;

  v4 = [MKLookAroundDismissAnimationController alloc];
  -[MKLookAroundTransitionController sourceView](self, "sourceView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKLookAroundTransitionController initialFrame](self, "initialFrame");
  v6 = -[MKLookAroundDismissAnimationController initWithSourceView:finalFrame:](v4, "initWithSourceView:finalFrame:", v5);

  return v6;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  MKLookAroundPresentAnimationController *v6;
  void *v7;
  MKLookAroundPresentAnimationController *v8;

  v6 = [MKLookAroundPresentAnimationController alloc];
  -[MKLookAroundTransitionController sourceView](self, "sourceView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKLookAroundTransitionController initialFrame](self, "initialFrame");
  v8 = -[MKLookAroundPresentAnimationController initWithSourceView:initialFrame:](v6, "initWithSourceView:initialFrame:", v7);

  return v8;
}

- (void)_dismiss:(id)a3 fromViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a5;
  v9 = a6;
  v10 = a3;
  objc_msgSend(a4, "dismissViewControllerAnimated:completion:", v6, 0);
  objc_msgSend(v10, "transitionCoordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __84__MKLookAroundTransitionController__dismiss_fromViewController_animated_completion___block_invoke;
  v13[3] = &unk_1E20D7D48;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "animateAlongsideTransition:completion:", 0, v13);

}

uint64_t __84__MKLookAroundTransitionController__dismiss_fromViewController_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "isCancelled") ^ 1);
}

- (void)_present:(id)a3 fromViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v11, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKLookAroundTransitionController sourceView](self, "sourceView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[MKLookAroundTransitionController sourceView](self, "sourceView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "convertRect:fromView:", v23, v16, v18, v20, v22);
  -[MKLookAroundTransitionController setInitialFrame:](self, "setInitialFrame:");

  objc_msgSend(v11, "presentViewController:animated:completion:", v12, v6, 0);
  objc_msgSend(v12, "transitionCoordinator");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __84__MKLookAroundTransitionController__present_fromViewController_animated_completion___block_invoke;
  v26[3] = &unk_1E20D7D48;
  v27 = v10;
  v25 = v10;
  objc_msgSend(v24, "animateAlongsideTransition:completion:", 0, v26);

}

uint64_t __84__MKLookAroundTransitionController__present_fromViewController_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "isCancelled") ^ 1);
}

- (UIView)sourceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_sourceView);
}

- (void)setSourceView:(id)a3
{
  objc_storeWeak((id *)&self->_sourceView, a3);
}

- (CGRect)initialFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_initialFrame.origin.x;
  y = self->_initialFrame.origin.y;
  width = self->_initialFrame.size.width;
  height = self->_initialFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInitialFrame:(CGRect)a3
{
  self->_initialFrame = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sourceView);
}

@end
