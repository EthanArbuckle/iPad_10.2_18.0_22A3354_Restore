@implementation AMSUISlideAnimator

- (double)transitionDuration:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  double v10;

  v3 = *MEMORY[0x24BEBE9A0];
  v4 = a3;
  objc_msgSend(v4, "viewControllerForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x24BEBE9B0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    objc_msgSend(MEMORY[0x24BDE5760], "animationWithKeyPath:", CFSTR("position.y"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMass:", 1.0);
    objc_msgSend(v9, "setStiffness:", 150.0);
    objc_msgSend(v9, "setDamping:", 19.0);
    objc_msgSend(v9, "setInitialVelocity:", 0.0);
    objc_msgSend(v9, "settlingDuration");
    v8 = v10;

  }
  else
  {
    v8 = 0.18;
  }

  return v8;
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id *v22;
  id *v23;
  id v24;
  uint64_t *v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void *v43;
  id v44;
  _QWORD v45[4];
  _QWORD v46[5];
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  _QWORD v50[5];

  v4 = a3;
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x24BEBE9A0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x24BEBE9B0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "containerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUISlideAnimator transitionDuration:](self, "transitionDuration:", v4);
  v10 = v9;
  if (v7 == v6)
  {
    objc_msgSend(v4, "finalFrameForViewController:", v6);
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;
    objc_msgSend(v8, "frame");
    v35 = v34;
    objc_msgSend(v6, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setFrame:", v27, v35, v31, v33);

    objc_msgSend(v6, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v37);

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD970]), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 150.0, 19.0, 0.0, 0.0);
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB20]), "initWithDuration:timingParameters:", v19, v10);
    v38 = MEMORY[0x24BDAC760];
    v49[0] = MEMORY[0x24BDAC760];
    v49[1] = 3221225472;
    v49[2] = __40__AMSUISlideAnimator_animateTransition___block_invoke;
    v49[3] = &unk_24CB508B0;
    v22 = (id *)v50;
    v50[0] = v6;
    *(double *)&v50[1] = v27;
    v50[2] = v29;
    *(double *)&v50[3] = v31;
    *(double *)&v50[4] = v33;
    objc_msgSend(v20, "addAnimations:", v49);
    v47[0] = v38;
    v47[1] = 3221225472;
    v47[2] = __40__AMSUISlideAnimator_animateTransition___block_invoke_2;
    v47[3] = &unk_24CB4FC48;
    v23 = &v48;
    v48 = v4;
    v39 = v4;
    v25 = v47;
  }
  else
  {
    objc_msgSend(v4, "initialFrameForViewController:", v5);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    objc_msgSend(v8, "frame");
    v18 = v17;
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD518]), "initWithControlPoint1:controlPoint2:", 0.33, 0.0, 0.65, 0.0);
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB20]), "initWithDuration:timingParameters:", v19, v10);
    v21 = MEMORY[0x24BDAC760];
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __40__AMSUISlideAnimator_animateTransition___block_invoke_3;
    v45[3] = &unk_24CB508B0;
    v22 = (id *)v46;
    v46[0] = v5;
    v46[1] = v12;
    v46[2] = v18;
    v46[3] = v14;
    v46[4] = v16;
    objc_msgSend(v20, "addAnimations:", v45);
    v40 = v21;
    v41 = 3221225472;
    v42 = __40__AMSUISlideAnimator_animateTransition___block_invoke_4;
    v43 = &unk_24CB4FC48;
    v23 = &v44;
    v44 = v4;
    v24 = v4;
    v25 = &v40;
  }
  objc_msgSend(v20, "addCompletion:", v25, v40, v41, v42, v43);
  objc_msgSend(v20, "startAnimation");

}

void __40__AMSUISlideAnimator_animateTransition___block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  id v5;

  v1 = *(double *)(a1 + 40);
  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  v4 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);

}

uint64_t __40__AMSUISlideAnimator_animateTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", a2 == 0);
}

void __40__AMSUISlideAnimator_animateTransition___block_invoke_3(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  id v5;

  v1 = *(double *)(a1 + 40);
  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  v4 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);

}

uint64_t __40__AMSUISlideAnimator_animateTransition___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", a2 == 0);
}

- (CASpringAnimation)animation
{
  return self->_animation;
}

- (void)setAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_animation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animation, 0);
}

@end
