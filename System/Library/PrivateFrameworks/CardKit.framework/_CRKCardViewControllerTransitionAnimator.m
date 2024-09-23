@implementation _CRKCardViewControllerTransitionAnimator

- (void)transitionFromCardViewController:(id)a3 toCardViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _CRKCardViewControllerTransitionCoordinator *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _CRKCardViewControllerTransitionCoordinator *v24;
  id v25;
  id v26;
  void (**v27)(_QWORD, _QWORD);
  uint64_t v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  id v33;
  _QWORD v34[4];
  _CRKCardViewControllerTransitionCoordinator *v35;
  id v36;
  id v37;
  id v38;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v10, "parentViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc_init(_CRKCardViewControllerTransitionCoordinator);
    v31 = v7;
    -[_CRKCardViewControllerTransitionCoordinator setAnimated:](v18, "setAnimated:", v7);
    -[_CRKCardViewControllerTransitionCoordinator setContainerView:](v18, "setContainerView:", v15);
    -[_CRKCardViewControllerTransitionAnimator _prepareAnimationFromCardViewController:toCardViewController:withAnimationCoordinator:](self, "_prepareAnimationFromCardViewController:toCardViewController:withAnimationCoordinator:", v10, v11, v18);
    -[_CRKCardViewControllerTransitionCoordinator initialSetup](v18, "initialSetup");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v19)
      (*(void (**)(uint64_t))(v19 + 16))(v19);
    -[_CRKCardViewControllerTransitionCoordinator setInitialSetup:](v18, "setInitialSetup:", 0);
    objc_msgSend(v14, "addChildViewController:", v11);
    v30 = v15;
    v32 = (void *)v17;
    objc_msgSend(v15, "addSubview:", v17);
    objc_msgSend(v11, "didMoveToParentViewController:", v14);
    -[_CRKCardViewControllerTransitionCoordinator finalSetup](v18, "finalSetup");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21)
      (*(void (**)(uint64_t))(v21 + 16))(v21);
    -[_CRKCardViewControllerTransitionCoordinator setFinalSetup:](v18, "setFinalSetup:", 0);
    -[_CRKCardViewControllerTransitionAnimator delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "transitionAnimator:willTransitionFromCardViewController:toCardViewController:withAnimationCoordinator:", self, v10, v11, v18);

    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __118___CRKCardViewControllerTransitionAnimator_transitionFromCardViewController_toCardViewController_animated_completion___block_invoke;
    v34[3] = &unk_24DA4CC78;
    v24 = v18;
    v35 = v24;
    v25 = v10;
    v36 = v25;
    v37 = v16;
    v33 = v12;
    v38 = v12;
    v26 = v16;
    v27 = (void (**)(_QWORD, _QWORD))MEMORY[0x219A28084](v34);
    -[_CRKCardViewControllerTransitionCoordinator animations](v24, "animations");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v28;
    if (v31)
    {
      objc_msgSend(v14, "transitionFromViewController:toViewController:duration:options:animations:completion:", v25, v11, 129, v28, v27, 0.2);
    }
    else
    {
      if (v28)
        (*(void (**)(uint64_t))(v28 + 16))(v28);
      v27[2](v27, 1);
    }

    v12 = v33;
  }
  else if (v12)
  {
    (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);
  }

}

- (void)_prepareAnimationFromCardViewController:(id)a3 toCardViewController:(id)a4 withAnimationCoordinator:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;

  v7 = a4;
  v8 = a5;
  objc_msgSend(a3, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __130___CRKCardViewControllerTransitionAnimator__prepareAnimationFromCardViewController_toCardViewController_withAnimationCoordinator___block_invoke;
  v28[3] = &unk_24DA4CCA0;
  v12 = v10;
  v29 = v12;
  objc_msgSend(v8, "setInitialSetup:", v28);
  v24[0] = v11;
  v24[1] = 3221225472;
  v24[2] = __130___CRKCardViewControllerTransitionAnimator__prepareAnimationFromCardViewController_toCardViewController_withAnimationCoordinator___block_invoke_2;
  v24[3] = &unk_24DA4CCC8;
  v13 = v9;
  v25 = v13;
  v14 = v12;
  v26 = v14;
  v27 = v7;
  v15 = v7;
  objc_msgSend(v8, "setFinalSetup:", v24);
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __130___CRKCardViewControllerTransitionAnimator__prepareAnimationFromCardViewController_toCardViewController_withAnimationCoordinator___block_invoke_3;
  v21[3] = &unk_24DA4CCF0;
  v16 = v14;
  v22 = v16;
  v23 = v13;
  v17 = v13;
  objc_msgSend(v8, "setAnimations:", v21);
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __130___CRKCardViewControllerTransitionAnimator__prepareAnimationFromCardViewController_toCardViewController_withAnimationCoordinator___block_invoke_4;
  v19[3] = &unk_24DA4CD18;
  v20 = v16;
  v18 = v16;
  objc_msgSend(v8, "setCompletion:", v19);

}

- (_CRKCardViewControllerTransitionAnimatorDelegate)delegate
{
  return (_CRKCardViewControllerTransitionAnimatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

+ (id)sectionShuffleTransitionAnimator
{
  return objc_alloc_init(_CRKSectionShuffleTransitionAnimator);
}

@end
