@implementation SUUISlideshowDismissalAnimator

- (double)transitionDuration:(id)a3
{
  return 0.25;
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  _QWORD v43[5];
  id v44;
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  SUUISlideshowDismissalAnimator *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

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
  objc_msgSend(v7, "setFrame:");
  objc_msgSend(v8, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[UIImageView frame](self->_imageView, "frame");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  -[UIImageView superview](self->_imageView, "superview");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertRect:fromView:", v26, v19, v21, v23, v25);
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;

  objc_msgSend(v8, "setAlpha:", 0.0);
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB78]), "initWithFrame:privateStyle:", 2020, v11, v13, v15, v17);
  objc_msgSend(v35, "setAlpha:", 1.0);
  objc_msgSend(v35, "setAutoresizingMask:", 18);
  objc_msgSend(v9, "addSubview:", v35);
  -[UIImageView setFrame:](self->_imageView, "setFrame:", self->_imageRect.origin.x, self->_imageRect.origin.y, self->_imageRect.size.width, self->_imageRect.size.height);
  objc_msgSend(v9, "addSubview:", self->_imageView);
  v36 = (void *)MEMORY[0x24BEBDB00];
  -[SUUISlideshowDismissalAnimator transitionDuration:](self, "transitionDuration:", v4);
  v38 = v37;
  v39 = MEMORY[0x24BDAC760];
  v47[0] = MEMORY[0x24BDAC760];
  v47[1] = 3221225472;
  v47[2] = __52__SUUISlideshowDismissalAnimator_animateTransition___block_invoke;
  v47[3] = &unk_2511F7C70;
  v48 = v35;
  v49 = self;
  v50 = v28;
  v51 = v30;
  v52 = v32;
  v53 = v34;
  v43[0] = v39;
  v43[1] = 3221225472;
  v43[2] = __52__SUUISlideshowDismissalAnimator_animateTransition___block_invoke_2;
  v43[3] = &unk_2511F7890;
  v43[4] = self;
  v44 = v48;
  v45 = v8;
  v46 = v4;
  v40 = v4;
  v41 = v8;
  v42 = v48;
  objc_msgSend(v36, "animateWithDuration:animations:completion:", v47, v43, v38);

}

uint64_t __52__SUUISlideshowDismissalAnimator_animateTransition___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __52__SUUISlideshowDismissalAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeFromSuperview");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

  objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
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

- (CGRect)imageRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_imageRect.origin.x;
  y = self->_imageRect.origin.y;
  width = self->_imageRect.size.width;
  height = self->_imageRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setImageRect:(CGRect)a3
{
  self->_imageRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
