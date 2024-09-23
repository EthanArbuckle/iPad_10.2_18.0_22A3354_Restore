@implementation MKLookAroundDismissAnimationController

- (MKLookAroundDismissAnimationController)initWithSourceView:(id)a3 finalFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  MKLookAroundDismissAnimationController *v11;
  MKLookAroundDismissAnimationController *v12;
  objc_super v14;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MKLookAroundDismissAnimationController;
  v11 = -[MKLookAroundDismissAnimationController init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_sourceView, a3);
    v12->_finalFrame.origin.x = x;
    v12->_finalFrame.origin.y = y;
    v12->_finalFrame.size.width = width;
    v12->_finalFrame.size.height = height;
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
  CGSize size;
  double v9;
  double v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  UIView *v15;
  id *v16;
  id *v17;
  id *v18;
  id v19;
  UIView *v20;
  uint64_t v21;
  UIView *v22;
  id v23;
  UIView *v24;
  id *v25;
  _QWORD v26[4];
  UIView *v27;
  id v28;
  void *v29;
  _QWORD v30[4];
  UIView *v31;
  CGPoint v32;
  CGSize v33;
  _QWORD v34[4];
  UIView *v35;
  id v36;
  void *v37;
  _QWORD v38[4];
  UIView *v39;
  CGPoint v40;
  CGSize v41;
  CGPoint origin;
  CGSize v43;

  v4 = a3;
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0CEBDB8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "containerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = self->_sourceView;
    size = self->_finalFrame.size;
    origin = self->_finalFrame.origin;
    v43 = size;
    -[MKLookAroundDismissAnimationController transitionDuration:](self, "transitionDuration:", v4);
    v10 = v9;
    objc_msgSend(v4, "viewForKey:", *MEMORY[0x1E0CEBDC0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v6, "insertSubview:atIndex:", v11, 0);
    objc_msgSend(v6, "addSubview:", v7);
    v12 = -[MKLookAroundDismissAnimationController _shouldUseSpringWithDampingAnimationStyle](self, "_shouldUseSpringWithDampingAnimationStyle");
    v13 = (void *)MEMORY[0x1E0CEABB0];
    if (v12)
    {
      v14 = MEMORY[0x1E0C809B0];
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __60__MKLookAroundDismissAnimationController_animateTransition___block_invoke;
      v38[3] = &unk_1E20D8E40;
      v25 = (id *)&v39;
      v15 = v7;
      v40 = origin;
      v39 = v15;
      v41 = v43;
      v34[0] = v14;
      v34[1] = 3221225472;
      v34[2] = __60__MKLookAroundDismissAnimationController_animateTransition___block_invoke_2;
      v34[3] = &unk_1E20D8E68;
      v16 = (id *)&v35;
      v35 = v15;
      v17 = &v36;
      v18 = &v37;
      v36 = v4;
      v37 = v11;
      v19 = v11;
      v20 = v15;
      objc_msgSend(v13, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v38, v34, v10, 0.0, 0.666666687, 0.0);
    }
    else
    {
      v21 = MEMORY[0x1E0C809B0];
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __60__MKLookAroundDismissAnimationController_animateTransition___block_invoke_3;
      v30[3] = &unk_1E20D8E40;
      v25 = (id *)&v31;
      v22 = v7;
      v32 = origin;
      v33 = v43;
      v31 = v22;
      v26[0] = v21;
      v26[1] = 3221225472;
      v26[2] = __60__MKLookAroundDismissAnimationController_animateTransition___block_invoke_4;
      v26[3] = &unk_1E20D8E68;
      v16 = (id *)&v27;
      v27 = v22;
      v17 = &v28;
      v18 = &v29;
      v28 = v4;
      v29 = v11;
      v23 = v11;
      v24 = v22;
      objc_msgSend(v13, "animateWithDuration:delay:options:animations:completion:", 0, v30, v26, v10, 0.0);
    }

  }
}

uint64_t __60__MKLookAroundDismissAnimationController_animateTransition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __60__MKLookAroundDismissAnimationController_animateTransition___block_invoke_2(id *a1)
{
  objc_msgSend(a1[4], "removeFromSuperview");
  if (objc_msgSend(a1[5], "transitionWasCancelled"))
    objc_msgSend(a1[6], "removeFromSuperview");
  return objc_msgSend(a1[5], "completeTransition:", objc_msgSend(a1[5], "transitionWasCancelled") ^ 1);
}

uint64_t __60__MKLookAroundDismissAnimationController_animateTransition___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __60__MKLookAroundDismissAnimationController_animateTransition___block_invoke_4(id *a1)
{
  objc_msgSend(a1[4], "removeFromSuperview");
  if (objc_msgSend(a1[5], "transitionWasCancelled"))
    objc_msgSend(a1[6], "removeFromSuperview");
  return objc_msgSend(a1[5], "completeTransition:", objc_msgSend(a1[5], "transitionWasCancelled") ^ 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceView, 0);
}

@end
