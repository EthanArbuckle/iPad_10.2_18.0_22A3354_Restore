@implementation SFInteractiveDismissController

- (SFInteractiveDismissController)init
{
  SFInteractiveDismissController *v2;
  uint64_t v3;
  UIScreenEdgePanGestureRecognizer *edgeSwipeGestureRecognizer;
  SFInteractiveDismissController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFInteractiveDismissController;
  v2 = -[UIPercentDrivenInteractiveTransition init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C00]), "initWithTarget:action:", v2, sel_swiped_);
    edgeSwipeGestureRecognizer = v2->_edgeSwipeGestureRecognizer;
    v2->_edgeSwipeGestureRecognizer = (UIScreenEdgePanGestureRecognizer *)v3;

    -[UIScreenEdgePanGestureRecognizer setEdges:](v2->_edgeSwipeGestureRecognizer, "setEdges:", 2);
    -[UIScreenEdgePanGestureRecognizer _setHysteresis:](v2->_edgeSwipeGestureRecognizer, "_setHysteresis:", 6.0);
    -[UIScreenEdgePanGestureRecognizer setMaximumNumberOfTouches:](v2->_edgeSwipeGestureRecognizer, "setMaximumNumberOfTouches:", 1);
    -[UIScreenEdgePanGestureRecognizer _setRequiresSystemGesturesToFail:](v2->_edgeSwipeGestureRecognizer, "_setRequiresSystemGesturesToFail:", 1);
    v5 = v2;
  }

  return v2;
}

- (void)startInteractiveTransition:(id)a3
{
  UIViewControllerContextTransitioning **p_transitionContext;
  id v5;
  objc_super v6;

  p_transitionContext = &self->_transitionContext;
  v5 = a3;
  objc_storeWeak((id *)p_transitionContext, v5);
  v6.receiver = self;
  v6.super_class = (Class)SFInteractiveDismissController;
  -[UIPercentDrivenInteractiveTransition startInteractiveTransition:](&v6, sel_startInteractiveTransition_, v5);

}

- (void)cancelInteractiveTransition
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFInteractiveDismissController;
  -[UIPercentDrivenInteractiveTransition cancelInteractiveTransition](&v3, sel_cancelInteractiveTransition);
  -[SFInteractiveDismissController _animateDismissalCancelTransition](self, "_animateDismissalCancelTransition");
  self->_dismissMode = 0;
}

- (void)finishInteractiveTransition
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFInteractiveDismissController;
  -[UIPercentDrivenInteractiveTransition finishInteractiveTransition](&v3, sel_finishInteractiveTransition);
  -[SFInteractiveDismissController _animateDismissalCompleteTransition](self, "_animateDismissalCompleteTransition");
  self->_dismissMode = 0;
}

- (void)swiped:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  uint64_t v12;
  CGRect v13;

  v4 = a3;
  switch(objc_msgSend(v4, "state"))
  {
    case 1:
      self->_interactionState = 1;
      self->_dismissMode = 1;
      WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerToBeDismissed);
      objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);
      objc_msgSend(WeakRetained, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bounds");
      self->_totalDistance = CGRectGetWidth(v13);

      -[SFInteractiveDismissController _updateStatistics:firstSample:finalSample:](self, "_updateStatistics:firstSample:finalSample:", v4, 1, 0);
      v7 = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v7, "interactiveDismissControllerDidBegin:", self);

      break;
    case 2:
      self->_interactionState = 2;
      -[SFInteractiveDismissController _percentComplete:](self, "_percentComplete:", v4);
      -[UIPercentDrivenInteractiveTransition updateInteractiveTransition:](self, "updateInteractiveTransition:");
      -[SFInteractiveDismissController _updateStatistics:firstSample:finalSample:](self, "_updateStatistics:firstSample:finalSample:", v4, 0, 0);
      break;
    case 3:
      -[SFInteractiveDismissController _updateStatistics:firstSample:finalSample:](self, "_updateStatistics:firstSample:finalSample:", v4, 0, 1);
      -[UIPercentDrivenInteractiveTransition duration](self, "duration");
      v9 = v8;
      -[UIPercentDrivenInteractiveTransition percentComplete](self, "percentComplete");
      v12 = 0;
      v11 = -[SFInteractiveDismissController popGesture:withRemainingDuration:shouldPopWithVelocity:](self, "popGesture:withRemainingDuration:shouldPopWithVelocity:", v4, &v12, v9 * (1.0 - v10));
      self->_interactionState = 3;
      if (!v11)
        goto LABEL_8;
      -[SFInteractiveDismissController finishInteractiveTransition](self, "finishInteractiveTransition");
      break;
    case 4:
    case 5:
      self->_interactionState = 0;
LABEL_8:
      -[SFInteractiveDismissController cancelInteractiveTransition](self, "cancelInteractiveTransition");
      break;
    default:
      break;
  }

}

- (double)_percentComplete:(id)a3
{
  UIScreenEdgePanGestureRecognizer *edgeSwipeGestureRecognizer;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  CGRect v16;

  edgeSwipeGestureRecognizer = self->_edgeSwipeGestureRecognizer;
  v5 = a3;
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScreenEdgePanGestureRecognizer translationInView:](edgeSwipeGestureRecognizer, "translationInView:", v6);
  v8 = v7;

  -[SFInteractiveDismissController _translationCoefficient](self, "_translationCoefficient");
  v10 = v8 * v9;
  objc_msgSend(v5, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v13 = v10 / CGRectGetWidth(v16);
  if (v13 < 0.0001)
    v13 = 0.0001;
  v14 = fmin(v13, 0.9999);

  return v14;
}

- (void)_animateDismissalCancelTransition
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  CGFloat v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  _QWORD v47[5];
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[4];
  id v61;
  id v62;
  double v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  double v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  WeakRetained = objc_loadWeakRetained((id *)&self->_transitionContext);
  objc_msgSend(WeakRetained, "viewForKey:", *MEMORY[0x1E0DC55C0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "viewForKey:", *MEMORY[0x1E0DC55D0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "containerView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v7 = v6;
  v44 = v9;
  v45 = v8;
  -[UIPercentDrivenInteractiveTransition percentComplete](self, "percentComplete");
  v11 = v10;
  objc_msgSend(v4, "bounds");
  v12 = v11 * CGRectGetWidth(v71);
  -[SFInteractiveDismissController _translationCoefficient](self, "_translationCoefficient");
  v14 = v12 * v13;
  -[UIPercentDrivenInteractiveTransition percentComplete](self, "percentComplete");
  v16 = 1.0 - v15;
  objc_msgSend(v4, "bounds");
  v17 = CGRectGetWidth(v72) * v16 * -0.25;
  -[SFInteractiveDismissController _translationCoefficient](self, "_translationCoefficient");
  v19 = v18 * v17;
  objc_msgSend(v5, "frame");
  v21 = v20;
  v41 = v22;
  v42 = v20;
  v23 = v22;
  v43 = v24;
  objc_msgSend(v4, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "removeAnimationForKey:", CFSTR("position"));

  objc_msgSend(v5, "layer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "removeAnimationForKey:", CFSTR("position"));

  objc_msgSend(v46, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setBeginTime:", 0.0);
  objc_msgSend(v27, "setTimeOffset:", 0.0);
  LODWORD(v28) = 1.0;
  objc_msgSend(v27, "setSpeed:", v28);
  v29 = (void *)MEMORY[0x1E0DC3F10];
  v30 = MEMORY[0x1E0C809B0];
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __67__SFInteractiveDismissController__animateDismissalCancelTransition__block_invoke;
  v60[3] = &unk_1E4AC71E0;
  v31 = v4;
  v61 = v31;
  v63 = v14;
  v64 = v7;
  v65 = v45;
  v66 = v44;
  v32 = v5;
  v62 = v32;
  v67 = v19;
  v68 = v21;
  v69 = v23;
  v70 = v43;
  objc_msgSend(v29, "performWithoutAnimation:", v60);
  objc_msgSend(v32, "bounds");
  v33 = CGRectGetWidth(v73) * -0.25;
  -[SFInteractiveDismissController _translationCoefficient](self, "_translationCoefficient");
  v35 = v33 * v34;
  -[UIScreenEdgePanGestureRecognizer velocityInView:](self->_edgeSwipeGestureRecognizer, "velocityInView:", v31);
  v36 = (void *)MEMORY[0x1E0DC3F10];
  v49[0] = v30;
  v49[1] = 3221225472;
  v49[2] = __67__SFInteractiveDismissController__animateDismissalCancelTransition__block_invoke_2;
  v49[3] = &unk_1E4AC71E0;
  v50 = v31;
  v52 = 0;
  v38 = fabs(v37 / v14);
  v53 = v7;
  v54 = v45;
  v55 = v44;
  v51 = v32;
  v56 = v35;
  v57 = v42;
  v58 = v41;
  v59 = v43;
  v47[0] = v30;
  v47[1] = 3221225472;
  v47[2] = __67__SFInteractiveDismissController__animateDismissalCancelTransition__block_invoke_3;
  v47[3] = &unk_1E4AC15B8;
  v47[4] = self;
  v48 = v51;
  v39 = v51;
  v40 = v31;
  objc_msgSend(v36, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 4, v49, v47, 0.5, 0.0, 3.0, 1000.0, 500.0, v38);

}

uint64_t __67__SFInteractiveDismissController__animateDismissalCancelTransition__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  return objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
}

uint64_t __67__SFInteractiveDismissController__animateDismissalCancelTransition__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  return objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
}

void __67__SFInteractiveDismissController__animateDismissalCancelTransition__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "removeFromSuperview");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 184);
  *(_QWORD *)(v2 + 184) = 0;

  objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 216));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "interactiveDismissControllerDidCancel:", *(_QWORD *)(a1 + 32));

}

- (void)_animateDismissalCompleteTransition
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  _QWORD v56[5];
  id v57;
  id v58;
  _QWORD v59[4];
  id v60;
  id v61;
  double v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD v70[4];
  id v71;
  id v72;
  double v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  double v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;

  WeakRetained = objc_loadWeakRetained((id *)&self->_transitionContext);
  objc_msgSend(WeakRetained, "viewForKey:", *MEMORY[0x1E0DC55C0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "viewForKey:", *MEMORY[0x1E0DC55D0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v7 = v6;
  v52 = v8;
  v53 = v6;
  v9 = v8;
  v54 = v10;
  objc_msgSend(WeakRetained, "containerView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPercentDrivenInteractiveTransition percentComplete](self, "percentComplete");
  v12 = v11;
  objc_msgSend(v4, "bounds");
  v13 = v12 * CGRectGetWidth(v81);
  -[SFInteractiveDismissController _translationCoefficient](self, "_translationCoefficient");
  v15 = v13 * v14;
  -[UIPercentDrivenInteractiveTransition percentComplete](self, "percentComplete");
  v17 = 1.0 - v16;
  objc_msgSend(v4, "bounds");
  v18 = CGRectGetWidth(v82) * v17 * -0.25;
  -[SFInteractiveDismissController _translationCoefficient](self, "_translationCoefficient");
  v20 = v19 * v18;
  objc_msgSend(v5, "frame");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v51 = v25;
  objc_msgSend(v4, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "removeAnimationForKey:", CFSTR("position"));

  objc_msgSend(v5, "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "removeAnimationForKey:", CFSTR("position"));

  objc_msgSend(v55, "layer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setBeginTime:", 0.0);
  objc_msgSend(v29, "setTimeOffset:", 0.0);
  LODWORD(v30) = 1.0;
  objc_msgSend(v29, "setSpeed:", v30);
  v31 = (void *)MEMORY[0x1E0DC3F10];
  v32 = MEMORY[0x1E0C809B0];
  v70[0] = MEMORY[0x1E0C809B0];
  v70[1] = 3221225472;
  v70[2] = __69__SFInteractiveDismissController__animateDismissalCompleteTransition__block_invoke;
  v70[3] = &unk_1E4AC71E0;
  v33 = v4;
  v71 = v33;
  v73 = v15;
  v74 = v7;
  v75 = v9;
  v76 = v54;
  v34 = v5;
  v72 = v34;
  v77 = v20;
  v78 = v22;
  v35 = v22;
  v79 = v24;
  v80 = v26;
  v36 = v24;
  objc_msgSend(v31, "performWithoutAnimation:", v70);
  objc_msgSend(v33, "frame");
  v38 = v37;
  -[SFInteractiveDismissController _translationCoefficient](self, "_translationCoefficient");
  v40 = v39;
  -[UIScreenEdgePanGestureRecognizer velocityInView:](self->_edgeSwipeGestureRecognizer, "velocityInView:", v33);
  v42 = fabs(v41);
  if (v42 <= 3000.0)
    v43 = v42;
  else
    v43 = 3000.0;
  v44 = v40 * v38;
  objc_msgSend(v33, "bounds");
  v45 = v43 / (CGRectGetWidth(v83) - fabs(v15));
  v46 = objc_loadWeakRetained((id *)&self->_delegate);
  v47 = (void *)MEMORY[0x1E0DC3F10];
  v59[0] = v32;
  v59[1] = 3221225472;
  v59[2] = __69__SFInteractiveDismissController__animateDismissalCompleteTransition__block_invoke_2;
  v59[3] = &unk_1E4AC71E0;
  v62 = v44;
  v63 = v53;
  v64 = v52;
  v65 = v54;
  v60 = v33;
  v61 = v34;
  v66 = 0;
  v67 = v35;
  v68 = v36;
  v69 = v51;
  v56[0] = v32;
  v56[1] = 3221225472;
  v56[2] = __69__SFInteractiveDismissController__animateDismissalCompleteTransition__block_invoke_3;
  v56[3] = &unk_1E4AC2D58;
  v56[4] = self;
  v57 = v60;
  v58 = v46;
  v48 = v46;
  v49 = v60;
  v50 = v34;
  objc_msgSend(v47, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 4, v59, v56, 0.5, 0.0, 3.0, 1000.0, 500.0, v45);

}

uint64_t __69__SFInteractiveDismissController__animateDismissalCompleteTransition__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  return objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
}

uint64_t __69__SFInteractiveDismissController__animateDismissalCompleteTransition__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  return objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
}

uint64_t __69__SFInteractiveDismissController__animateDismissalCompleteTransition__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "removeFromSuperview");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 184);
  *(_QWORD *)(v2 + 184) = 0;

  objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 48), "interactiveDismissControllerDidEnd:", *(_QWORD *)(a1 + 32));
  return result;
}

- (double)_translationCoefficient
{
  id WeakRetained;
  void *v3;
  double v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerToBeDismissed);
  objc_msgSend(WeakRetained, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "_sf_usesLeftToRightLayout"))
    v4 = 1.0;
  else
    v4 = -1.0;

  return v4;
}

- (CGPoint)translationForStatistics
{
  UIScreenEdgePanGestureRecognizer *edgeSwipeGestureRecognizer;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  edgeSwipeGestureRecognizer = self->_edgeSwipeGestureRecognizer;
  -[UIScreenEdgePanGestureRecognizer view](edgeSwipeGestureRecognizer, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScreenEdgePanGestureRecognizer translationInView:](edgeSwipeGestureRecognizer, "translationInView:", v3);
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGPoint)velocityForStatistics
{
  UIScreenEdgePanGestureRecognizer *edgeSwipeGestureRecognizer;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  edgeSwipeGestureRecognizer = self->_edgeSwipeGestureRecognizer;
  -[UIScreenEdgePanGestureRecognizer view](edgeSwipeGestureRecognizer, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScreenEdgePanGestureRecognizer velocityInView:](edgeSwipeGestureRecognizer, "velocityInView:", v3);
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (void)_updateStatistics:(id)a3 firstSample:(BOOL)a4 finalSample:(BOOL)a5
{
  _BOOL4 v5;
  CFAbsoluteTime Current;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double totalDistance;
  double v15;
  double v16;
  double previousTimeStamp;
  double v18;
  double v19;
  unint64_t sampleCount;
  unint64_t v21;
  double v22;
  double previousAcceleration;
  double v24;
  double v25;
  double v26;
  double v27;
  unint64_t v28;

  v5 = a4;
  Current = CFAbsoluteTimeGetCurrent();
  -[SFInteractiveDismissController _translationCoefficient](self, "_translationCoefficient");
  v9 = v8;
  -[SFInteractiveDismissController translationForStatistics](self, "translationForStatistics");
  v11 = v9 * v10;
  -[SFInteractiveDismissController velocityForStatistics](self, "velocityForStatistics");
  v13 = v9 * v12;
  totalDistance = self->_totalDistance;
  v15 = v11 / totalDistance;
  if (v11 < 0.0)
    v15 = 0.0;
  v16 = v13 / totalDistance;
  if (v5)
  {
    self->_previousTimeStamp = Current;
    self->_skipTimeStamp = Current;
    self->_previousDisplacement = v15;
    self->_previousVelocity = v16;
    self->_previousAcceleration = 0.0;
    self->_averageVelocity = v16;
    self->_averageAcceleration = 0.0;
    self->_timestamps[0] = 0.0;
    self->_velocities[0] = v16;
    self->_accelerations[0] = 0.0;
    self->_sampleCount = 1;
  }
  else
  {
    previousTimeStamp = self->_previousTimeStamp;
    v18 = Current - self->_skipTimeStamp;
    self->_skipTimeStamp = Current;
    if (v18 >= 0.01 || v18 > 0.001 && self->_previousDisplacement != v15)
    {
      v19 = Current - previousTimeStamp;
      sampleCount = self->_sampleCount;
      v21 = sampleCount % 3;
      if (sampleCount > 2)
        self->_averageVelocity = (v16 - (self->_velocities[v21] - self->_averageVelocity * 3.0)) / 3.0;
      else
        self->_averageVelocity = (v16 + (double)sampleCount * self->_averageVelocity) / (double)(sampleCount + 1);
      self->_velocities[v21] = v16;
      self->_timestamps[v21] = v19;
      v22 = (v16 - self->_previousVelocity) / v19;
      previousAcceleration = self->_previousAcceleration;
      v24 = vabdd_f64(v22, previousAcceleration);
      v25 = -5.0;
      if (v22 - previousAcceleration > 0.0)
        v25 = 5.0;
      v26 = previousAcceleration + v25;
      if (v24 > 5.0)
        v22 = v26;
      if (sampleCount > 2)
      {
        self->_averageAcceleration = (v22 - (self->_accelerations[v21] - self->_averageAcceleration * 3.0)) / 3.0;
        v28 = sampleCount + 1;
      }
      else
      {
        v27 = (double)sampleCount;
        v28 = sampleCount + 1;
        self->_averageAcceleration = (v22 + v27 * self->_averageAcceleration) / (double)v28;
      }
      self->_accelerations[v21] = v22;
      self->_previousAcceleration = v22;
      self->_previousVelocity = v16;
      self->_previousDisplacement = v15;
      self->_previousTimeStamp = Current;
      self->_sampleCount = v28;
    }
  }
}

- (BOOL)popGesture:(id)a3 withRemainingDuration:(double)a4 shouldPopWithVelocity:(double *)a5
{
  id v8;
  void *v9;
  double v10;
  double v11;
  BOOL v12;
  double v13;
  void *v14;
  double v15;

  v8 = a3;
  v9 = v8;
  if (self->_sampleCount >= 3 && self->_interactionState == 2)
  {
    -[UIPercentDrivenInteractiveTransition percentComplete](self, "percentComplete");
    v11 = v10 + self->_averageVelocity * a4 + self->_averageAcceleration * 0.5 * a4 * a4;
    if (v10 >= 0.5)
      v12 = v11 >= 0.3;
    else
      v12 = v11 > 1.0;
    v13 = self->_previousVelocity * self->_totalDistance;
  }
  else
  {
    objc_msgSend(v8, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "velocityInView:", v14);
    v13 = v15;

    v12 = self->_averageVelocity > 0.0 && self->_interactionState != 1;
  }
  *a5 = v13;

  return v12;
}

- (void)setEdgeSwipeView:(id)a3
{
  UIView *v4;
  UIView *edgeSwipeView;
  UIView *v6;
  uint64_t v7;
  UIView *v8;

  v4 = (UIView *)a3;
  edgeSwipeView = self->_edgeSwipeView;
  if (edgeSwipeView)
    -[UIView removeGestureRecognizer:](edgeSwipeView, "removeGestureRecognizer:", self->_edgeSwipeGestureRecognizer);
  v6 = self->_edgeSwipeView;
  self->_edgeSwipeView = v4;
  v8 = v4;

  if (-[UIView _sf_usesLeftToRightLayout](self->_edgeSwipeView, "_sf_usesLeftToRightLayout"))
    v7 = 2;
  else
    v7 = 8;
  -[UIScreenEdgePanGestureRecognizer setEdges:](self->_edgeSwipeGestureRecognizer, "setEdges:", v7);
  -[UIView addGestureRecognizer:](self->_edgeSwipeView, "addGestureRecognizer:", self->_edgeSwipeGestureRecognizer);

}

- (double)transitionDuration:(id)a3
{
  return 0.5;
}

- (void)animateTransition:(id)a3
{
  uint64_t v4;
  void *v5;
  int v6;
  id v7;

  v4 = *MEMORY[0x1E0DC55C8];
  v7 = a3;
  objc_msgSend(v7, "viewControllerForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isBeingPresented");

  if (v6)
    -[SFInteractiveDismissController _presentAnimateTransition:](self, "_presentAnimateTransition:", v7);
  else
    -[SFInteractiveDismissController _dismissAnimateTransition:](self, "_dismissAnimateTransition:", v7);

}

- (void)_dismissAnimateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  UIView *v15;
  UIView *dimmingView;
  void *v17;
  void *v18;
  double y;
  double width;
  double height;
  CGFloat v22;
  double v23;
  double v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  int v29;
  void *v30;
  id *v31;
  void *v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  _QWORD v36[4];
  _QWORD v37[2];
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD v42[5];
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  double v52;
  CGRect v53;

  v4 = a3;
  objc_msgSend(v4, "viewForKey:", *MEMORY[0x1E0DC55C0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewForKey:", *MEMORY[0x1E0DC55D0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v35 = v7;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[SFInteractiveDismissController transitionDuration:](self, "transitionDuration:", v4);
  v33 = v14;
  if (!self->_dimmingView)
  {
    v15 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    dimmingView = self->_dimmingView;
    self->_dimmingView = v15;

  }
  objc_msgSend(v4, "containerView", v33);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "insertSubview:belowSubview:", v6, v5);
  objc_msgSend(v17, "bounds");
  -[UIView setFrame:](self->_dimmingView, "setFrame:");
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_dimmingView, "setBackgroundColor:", v18);

  -[UIView setAlpha:](self->_dimmingView, "setAlpha:", 0.25);
  -[UIView removeFromSuperview](self->_dimmingView, "removeFromSuperview");
  objc_msgSend(v17, "insertSubview:belowSubview:", self->_dimmingView, v5);
  objc_msgSend(v17, "bounds");
  y = v53.origin.y;
  width = v53.size.width;
  height = v53.size.height;
  v22 = CGRectGetWidth(v53) * -0.25;
  -[SFInteractiveDismissController _translationCoefficient](self, "_translationCoefficient");
  v24 = v22 * v23;
  objc_msgSend(v6, "setFrame:", v24, y, width, height);
  v25 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __60__SFInteractiveDismissController__dismissAnimateTransition___block_invoke;
  v42[3] = &unk_1E4AC7208;
  v45 = v35;
  v46 = v9;
  v47 = v11;
  v48 = v13;
  v42[4] = self;
  v26 = v5;
  v43 = v26;
  v49 = v24;
  v50 = y;
  v51 = width;
  v52 = height;
  v27 = v6;
  v44 = v27;
  v28 = (void *)MEMORY[0x1A8598C40](v42);
  v29 = objc_msgSend(v4, "isInteractive");
  v30 = (void *)MEMORY[0x1E0DC3F10];
  if (v29)
  {
    v39[0] = v25;
    v39[1] = 3221225472;
    v39[2] = __60__SFInteractiveDismissController__dismissAnimateTransition___block_invoke_2;
    v39[3] = &unk_1E4AC15B8;
    v31 = &v40;
    v40 = v4;
    v41 = v26;
    objc_msgSend(v30, "animateWithDuration:delay:options:animations:completion:", 196608, v28, v39, v34, 0.0);
    v32 = v41;
  }
  else
  {
    v36[0] = v25;
    v36[1] = 3221225472;
    v36[2] = __60__SFInteractiveDismissController__dismissAnimateTransition___block_invoke_3;
    v36[3] = &unk_1E4AC2D58;
    v31 = (id *)v37;
    v37[0] = v4;
    v37[1] = self;
    v38 = v26;
    objc_msgSend(v30, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 4, v28, v36, 0.5, 0.0, 3.0, 1000.0, 500.0, 0.0);
    v32 = v38;
  }

}

uint64_t __60__SFInteractiveDismissController__dismissAnimateTransition___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v3 = *(double *)(a1 + 56);
  v2 = *(double *)(a1 + 64);
  v4 = *(double *)(a1 + 72);
  v5 = *(double *)(a1 + 80);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "setAlpha:", 0.0);
  v6 = *(double *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 32), "_translationCoefficient");
  objc_msgSend(*(id *)(a1 + 40), "setFrame:", v3 + v6 * v7, v2, v4, v5);
  return objc_msgSend(*(id *)(a1 + 48), "setFrame:", 0.0, *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
}

uint64_t __60__SFInteractiveDismissController__dismissAnimateTransition___block_invoke_2(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled") ^ 1);
}

void __60__SFInteractiveDismissController__dismissAnimateTransition___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 184), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 48), "removeFromSuperview");
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v2 + 184);
  *(_QWORD *)(v2 + 184) = 0;

}

- (void)_presentAnimateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MaxX;
  double v12;
  UIView *v13;
  UIView *dimmingView;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  double v29;
  _QWORD v30[4];
  id v31;
  SFInteractiveDismissController *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[4];
  id v39;
  SFInteractiveDismissController *v40;
  id v41;
  double v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  CGRect v50;

  v4 = a3;
  objc_msgSend(v4, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewForKey:", *MEMORY[0x1E0DC55D0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewForKey:", *MEMORY[0x1E0DC55C0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);
  objc_msgSend(v5, "bounds");
  y = v50.origin.y;
  width = v50.size.width;
  height = v50.size.height;
  MaxX = CGRectGetMaxX(v50);
  -[SFInteractiveDismissController _translationCoefficient](self, "_translationCoefficient");
  v29 = MaxX * v12;
  objc_msgSend(v6, "setFrame:");
  if (!self->_dimmingView)
  {
    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    dimmingView = self->_dimmingView;
    self->_dimmingView = v13;

  }
  objc_msgSend(v5, "bounds");
  -[UIView setFrame:](self->_dimmingView, "setFrame:");
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_dimmingView, "setBackgroundColor:", v15);

  -[UIView setAlpha:](self->_dimmingView, "setAlpha:", 0.0);
  -[UIView removeFromSuperview](self->_dimmingView, "removeFromSuperview");
  objc_msgSend(v5, "insertSubview:belowSubview:", self->_dimmingView, v6);
  objc_msgSend(v7, "frame");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v24 = (void *)MEMORY[0x1E0DC3F10];
  v25 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __60__SFInteractiveDismissController__presentAnimateTransition___block_invoke;
  v38[3] = &unk_1E4AC7208;
  v42 = v29;
  v43 = y;
  v44 = width;
  v45 = height;
  v39 = v6;
  v40 = self;
  v46 = v16;
  v47 = v20;
  v48 = v22;
  v49 = v18;
  v41 = v7;
  v30[0] = v25;
  v30[1] = 3221225472;
  v30[2] = __60__SFInteractiveDismissController__presentAnimateTransition___block_invoke_2;
  v30[3] = &unk_1E4AC7230;
  v31 = v4;
  v32 = self;
  v33 = v41;
  v34 = v17;
  v35 = v21;
  v36 = v23;
  v37 = v19;
  v26 = v41;
  v27 = v4;
  v28 = v6;
  objc_msgSend(v24, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 4, v38, v30, 0.5, 0.0, 3.0, 1000.0, 500.0, 0.0);

}

uint64_t __60__SFInteractiveDismissController__presentAnimateTransition___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  CGFloat v5;
  double v6;
  CGRect v8;

  objc_msgSend(*(id *)(a1 + 32), "setFrame:", 0.0, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 184), "setAlpha:", 0.25);
  v8.origin.x = *(CGFloat *)(a1 + 88);
  v2 = *(double *)(a1 + 96);
  v3 = *(double *)(a1 + 104);
  v4 = *(double *)(a1 + 112);
  v8.origin.y = v2;
  v8.size.width = v3;
  v8.size.height = v4;
  v5 = CGRectGetWidth(v8) * -0.25;
  objc_msgSend(*(id *)(a1 + 40), "_translationCoefficient");
  return objc_msgSend(*(id *)(a1 + 48), "setFrame:", v5 * v6, v2, v3, v4);
}

void __60__SFInteractiveDismissController__presentAnimateTransition___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 184), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v2 + 184);
  *(_QWORD *)(v2 + 184) = 0;

}

- (id)interactionControllerForDismissal:(id)a3
{
  if (!self->_dismissMode)
    self = 0;
  return self;
}

- (UIScreenEdgePanGestureRecognizer)edgeSwipeGestureRecognizer
{
  return self->_edgeSwipeGestureRecognizer;
}

- (UIViewController)viewControllerToBeDismissed
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewControllerToBeDismissed);
}

- (void)setViewControllerToBeDismissed:(id)a3
{
  objc_storeWeak((id *)&self->_viewControllerToBeDismissed, a3);
}

- (UIView)edgeSwipeView
{
  return self->_edgeSwipeView;
}

- (SFInteractiveDismissControllerDelegate)delegate
{
  return (SFInteractiveDismissControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)sampleCount
{
  return self->_sampleCount;
}

- (void)setSampleCount:(unint64_t)a3
{
  self->_sampleCount = a3;
}

- (double)totalDistance
{
  return self->_totalDistance;
}

- (void)setTotalDistance:(double)a3
{
  self->_totalDistance = a3;
}

- (double)skipTimeStamp
{
  return self->_skipTimeStamp;
}

- (void)setSkipTimeStamp:(double)a3
{
  self->_skipTimeStamp = a3;
}

- (double)previousTimeStamp
{
  return self->_previousTimeStamp;
}

- (void)setPreviousTimeStamp:(double)a3
{
  self->_previousTimeStamp = a3;
}

- (double)previousDisplacement
{
  return self->_previousDisplacement;
}

- (void)setPreviousDisplacement:(double)a3
{
  self->_previousDisplacement = a3;
}

- (double)previousVelocity
{
  return self->_previousVelocity;
}

- (void)setPreviousVelocity:(double)a3
{
  self->_previousVelocity = a3;
}

- (double)previousAcceleration
{
  return self->_previousAcceleration;
}

- (void)setPreviousAcceleration:(double)a3
{
  self->_previousAcceleration = a3;
}

- (double)averageVelocity
{
  return self->_averageVelocity;
}

- (void)setAverageVelocity:(double)a3
{
  self->_averageVelocity = a3;
}

- (double)averageAcceleration
{
  return self->_averageAcceleration;
}

- (void)setAverageAcceleration:(double)a3
{
  self->_averageAcceleration = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_edgeSwipeView, 0);
  objc_destroyWeak((id *)&self->_viewControllerToBeDismissed);
  objc_storeStrong((id *)&self->_edgeSwipeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_destroyWeak((id *)&self->_transitionContext);
}

@end
