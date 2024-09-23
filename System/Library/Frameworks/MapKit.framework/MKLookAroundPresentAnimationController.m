@implementation MKLookAroundPresentAnimationController

- (MKLookAroundPresentAnimationController)initWithSourceView:(id)a3 initialFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  MKLookAroundPresentAnimationController *v11;
  MKLookAroundPresentAnimationController *v12;
  objc_super v14;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MKLookAroundPresentAnimationController;
  v11 = -[MKLookAroundPresentAnimationController init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_sourceView, a3);
    v12->_initialFrame.origin.x = x;
    v12->_initialFrame.origin.y = y;
    v12->_initialFrame.size.width = width;
    v12->_initialFrame.size.height = height;
  }

  return v12;
}

- (BOOL)_shouldUseSpringWithDampingAnimationStyle
{
  return GEOConfigGetBOOL();
}

- (double)transitionDuration:(id)a3
{
  double result;

  GEOConfigGetDouble();
  return result;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UIView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  uint64_t v21;
  UIView *v22;
  id *v23;
  id *v24;
  id *v25;
  UIView *v26;
  id v27;
  UIView *v28;
  UIView *v29;
  id v30;
  id *v31;
  _QWORD v32[4];
  void *v33;
  UIView *v34;
  id v35;
  _QWORD v36[4];
  _QWORD v37[5];
  _QWORD v38[4];
  void *v39;
  UIView *v40;
  id v41;
  _QWORD v42[4];
  _QWORD v43[6];

  v4 = a3;
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0CEBDB8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "containerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = self->_sourceView;
    objc_msgSend(v4, "finalFrameForViewController:", v5);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[MKLookAroundPresentAnimationController transitionDuration:](self, "transitionDuration:", v4);
    v17 = v16;
    objc_msgSend(v4, "viewForKey:", *MEMORY[0x1E0CEBDC0]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      objc_msgSend(v6, "addSubview:", v18);
    objc_msgSend(v6, "addSubview:", v7);
    objc_msgSend(v18, "setHidden:", 1);
    -[UIView setFrame:](v7, "setFrame:", self->_initialFrame.origin.x, self->_initialFrame.origin.y, self->_initialFrame.size.width, self->_initialFrame.size.height);
    objc_msgSend(v18, "setFrame:", v9, v11, v13, v15);
    v19 = -[MKLookAroundPresentAnimationController _shouldUseSpringWithDampingAnimationStyle](self, "_shouldUseSpringWithDampingAnimationStyle");
    v20 = (void *)MEMORY[0x1E0CEABB0];
    v21 = MEMORY[0x1E0C809B0];
    if (v19)
    {
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __60__MKLookAroundPresentAnimationController_animateTransition___block_invoke;
      v42[3] = &unk_1E20D8E40;
      v31 = (id *)v43;
      v22 = v7;
      v43[0] = v22;
      *(double *)&v43[1] = v9;
      *(double *)&v43[2] = v11;
      *(double *)&v43[3] = v13;
      *(double *)&v43[4] = v15;
      v38[0] = v21;
      v38[1] = 3221225472;
      v38[2] = __60__MKLookAroundPresentAnimationController_animateTransition___block_invoke_2;
      v38[3] = &unk_1E20D8E68;
      v23 = &v39;
      v24 = (id *)&v40;
      v25 = &v41;
      v39 = v18;
      v40 = v22;
      v41 = v4;
      v26 = v22;
      v27 = v18;
      objc_msgSend(v20, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v42, v38, v17, 0.0, 0.666666687, 0.0);
    }
    else
    {
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __60__MKLookAroundPresentAnimationController_animateTransition___block_invoke_3;
      v36[3] = &unk_1E20D8E40;
      v31 = (id *)v37;
      v28 = v7;
      v37[0] = v28;
      *(double *)&v37[1] = v9;
      *(double *)&v37[2] = v11;
      *(double *)&v37[3] = v13;
      *(double *)&v37[4] = v15;
      v32[0] = v21;
      v32[1] = 3221225472;
      v32[2] = __60__MKLookAroundPresentAnimationController_animateTransition___block_invoke_4;
      v32[3] = &unk_1E20D8E68;
      v23 = &v33;
      v24 = (id *)&v34;
      v25 = &v35;
      v33 = v18;
      v34 = v28;
      v35 = v4;
      v29 = v28;
      v30 = v18;
      objc_msgSend(v20, "animateWithDuration:delay:options:animations:completion:", 0, v36, v32, v17, 0.0);
    }

  }
}

uint64_t __60__MKLookAroundPresentAnimationController_animateTransition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __60__MKLookAroundPresentAnimationController_animateTransition___block_invoke_2(id *a1)
{
  objc_msgSend(a1[4], "setHidden:", 0);
  objc_msgSend(a1[5], "removeFromSuperview");
  return objc_msgSend(a1[6], "completeTransition:", objc_msgSend(a1[6], "transitionWasCancelled") ^ 1);
}

uint64_t __60__MKLookAroundPresentAnimationController_animateTransition___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __60__MKLookAroundPresentAnimationController_animateTransition___block_invoke_4(id *a1)
{
  objc_msgSend(a1[4], "setHidden:", 0);
  objc_msgSend(a1[5], "removeFromSuperview");
  return objc_msgSend(a1[6], "completeTransition:", objc_msgSend(a1[6], "transitionWasCancelled") ^ 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceView, 0);
}

@end
