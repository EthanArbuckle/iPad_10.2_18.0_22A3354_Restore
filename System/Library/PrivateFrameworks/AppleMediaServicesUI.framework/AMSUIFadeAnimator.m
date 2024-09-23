@implementation AMSUIFadeAnimator

- (double)transitionDuration:(id)a3
{
  return 0.3;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;
  void (*v15)(uint64_t);
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  uint64_t v33;

  v4 = a3;
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x24BEBE9A0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x24BEBE9B0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentedViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSUIFadeAnimator transitionDuration:](self, "transitionDuration:", v4);
  v10 = v9;
  v11 = MEMORY[0x24BDAC760];
  if (v8 == v6)
  {
    objc_msgSend(v4, "finalFrameForViewController:", v6);
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    objc_msgSend(v6, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAlpha:", 0.0);

    objc_msgSend(v6, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFrame:", v17, v19, v21, v23);

    objc_msgSend(v6, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v26);

    v33 = v11;
    v12 = &v33;
    v13 = 1;
    v14 = v6;
    v15 = __39__AMSUIFadeAnimator_animateTransition___block_invoke;
  }
  else
  {
    v32 = MEMORY[0x24BDAC760];
    v12 = &v32;
    v13 = 2;
    v14 = v5;
    v15 = __39__AMSUIFadeAnimator_animateTransition___block_invoke_2;
  }
  v12[1] = 3221225472;
  v12[2] = (uint64_t)v15;
  v12[3] = (uint64_t)&unk_24CB4F0E8;
  v12[4] = (uint64_t)v14;
  v27 = _Block_copy(v12);

  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB20]), "initWithDuration:curve:animations:", v13, v27, v10);
  v30[0] = v11;
  v30[1] = 3221225472;
  v30[2] = __39__AMSUIFadeAnimator_animateTransition___block_invoke_3;
  v30[3] = &unk_24CB4FC48;
  v31 = v4;
  v29 = v4;
  objc_msgSend(v28, "addCompletion:", v30);
  objc_msgSend(v28, "startAnimation");

}

void __39__AMSUIFadeAnimator_animateTransition___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __39__AMSUIFadeAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

uint64_t __39__AMSUIFadeAnimator_animateTransition___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", a2 == 0);
}

@end
