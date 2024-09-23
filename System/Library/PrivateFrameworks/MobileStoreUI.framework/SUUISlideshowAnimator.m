@implementation SUUISlideshowAnimator

- (double)transitionDuration:(id)a3
{
  return 0.400000006;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
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
  UIImageView *imageView;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  SUUISlideshowAnimator *v38;
  id v39;
  id v40;
  double v41;
  double v42;
  double v43;
  double v44;
  _QWORD v45[4];
  id v46;
  SUUISlideshowAnimator *v47;
  double v48;
  double v49;
  double v50;
  double v51;

  v4 = a3;
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x24BEBE9A0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x24BEBE9B0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finalFrameForViewController:", v6);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v7, "setAlpha:", 0.0);
  objc_msgSend(v7, "setFrame:", v11, v13, v15, v17);
  objc_msgSend(v9, "insertSubview:aboveSubview:", v7, v8);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB78]), "initWithFrame:privateStyle:", 2020, v11, v13, v15, v17);
  objc_msgSend(v18, "setAlpha:", 0.0);
  objc_msgSend(v18, "setAutoresizingMask:", 18);
  objc_msgSend(v9, "addSubview:", v18);
  imageView = self->_imageView;
  -[UIImageView frame](imageView, "frame");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  -[UIImageView superview](self->_imageView, "superview");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertRect:fromView:", v28, v21, v23, v25, v27);
  -[UIImageView setFrame:](imageView, "setFrame:");

  objc_msgSend(v9, "addSubview:", self->_imageView);
  v29 = (void *)MEMORY[0x24BEBDB00];
  -[SUUISlideshowAnimator transitionDuration:](self, "transitionDuration:", v4);
  v31 = v30;
  v32 = MEMORY[0x24BDAC760];
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __43__SUUISlideshowAnimator_animateTransition___block_invoke;
  v45[3] = &unk_2511F7C70;
  v46 = v18;
  v47 = self;
  v48 = v11;
  v49 = v13;
  v50 = v15;
  v51 = v17;
  v36[0] = v32;
  v36[1] = 3221225472;
  v36[2] = __43__SUUISlideshowAnimator_animateTransition___block_invoke_2;
  v36[3] = &unk_2511F7C98;
  v41 = v11;
  v42 = v13;
  v43 = v15;
  v44 = v17;
  v37 = v7;
  v38 = self;
  v39 = v46;
  v40 = v4;
  v33 = v4;
  v34 = v46;
  v35 = v7;
  objc_msgSend(v29, "animateWithDuration:animations:completion:", v45, v36, v31);

}

uint64_t __43__SUUISlideshowAnimator_animateTransition___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __43__SUUISlideshowAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "removeFromSuperview");
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

  objc_msgSend(*(id *)(a1 + 48), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 56), "completeTransition:", 1);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
