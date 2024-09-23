@implementation CNAvatarCardPresentationController

- (CNAvatarCardPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  CNAvatarCardPresentationController *v4;
  CNAvatarCardTransition *v5;
  CNAvatarCardTransition *transition;
  void *v7;
  uint64_t v8;
  UIVisualEffectView *backgroundView;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  UIView *dimmingView;
  void *v17;
  void *v18;
  uint64_t v19;
  UIVisualEffectView *vibrancyView;
  void *v21;
  uint64_t v22;
  UIView *cardView;
  void *v24;
  uint64_t v25;
  UIView *contentView;
  void *v27;
  id v28;
  double v29;
  void *v30;
  uint64_t v31;
  UITapGestureRecognizer *tapGestureRecognizer;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)CNAvatarCardPresentationController;
  v4 = -[CNAvatarCardPresentationController initWithPresentedViewController:presentingViewController:](&v34, sel_initWithPresentedViewController_presentingViewController_, a3, a4);
  v5 = objc_alloc_init(CNAvatarCardTransition);
  transition = v4->_transition;
  v4->_transition = v5;

  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v7);
  backgroundView = v4->_backgroundView;
  v4->_backgroundView = (UIVisualEffectView *)v8;

  v10 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v11 = *MEMORY[0x1E0C9D648];
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v15 = objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E0C9D648], v12, v13, v14);
  dimmingView = v4->_dimmingView;
  v4->_dimmingView = (UIView *)v15;

  +[CNUIColorRepository orbCardBackgroundDimmedColor](CNUIColorRepository, "orbCardBackgroundDimmedColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v4->_dimmingView, "setBackgroundColor:", v17);

  -[UIVisualEffectView contentView](v4->_backgroundView, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v4->_dimmingView);

  v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v7);
  vibrancyView = v4->_vibrancyView;
  v4->_vibrancyView = (UIVisualEffectView *)v19;

  -[UIVisualEffectView contentView](v4->_backgroundView, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", v4->_vibrancyView);

  v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v11, v12, v13, v14);
  cardView = v4->_cardView;
  v4->_cardView = (UIView *)v22;

  -[UIView setBackgroundColor:](v4->_cardView, "setBackgroundColor:", 0);
  -[UIVisualEffectView contentView](v4->_vibrancyView, "contentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addSubview:", v4->_cardView);

  v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v11, v12, v13, v14);
  contentView = v4->_contentView;
  v4->_contentView = (UIView *)v25;

  -[UIView addSubview:](v4->_cardView, "addSubview:", v4->_contentView);
  -[UIView layer](v4->_cardView, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUIColorRepository orbCardBackgroundShadowColor](CNUIColorRepository, "orbCardBackgroundShadowColor");
  v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v27, "setShadowColor:", objc_msgSend(v28, "CGColor"));

  objc_msgSend(v27, "setShadowRadius:", 10.0);
  LODWORD(v29) = 1036831949;
  objc_msgSend(v27, "setShadowOpacity:", v29);
  objc_msgSend(v27, "setShadowOffset:", 0.0, 4.0);
  -[UIView layer](v4->_contentView, "layer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setCornerRadius:", 23.0);
  v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v4, sel_tapGestureRecognized_);
  tapGestureRecognizer = v4->_tapGestureRecognizer;
  v4->_tapGestureRecognizer = (UITapGestureRecognizer *)v31;

  return v4;
}

- (BOOL)shouldPresentInFullscreen
{
  return 0;
}

- (void)containerViewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNAvatarCardPresentationController;
  -[CNAvatarCardPresentationController containerViewWillLayoutSubviews](&v3, sel_containerViewWillLayoutSubviews);
  -[CNAvatarCardPresentationController _layoutViews](self, "_layoutViews");
}

- (void)_layoutViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CNAvatarCardPresentationController containerView](self, "containerView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCardPresentationController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "bounds");
  -[UIVisualEffectView setFrame:](self->_backgroundView, "setFrame:");
  -[UIVisualEffectView contentView](self->_backgroundView, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  -[UIVisualEffectView setFrame:](self->_vibrancyView, "setFrame:");

  -[UIVisualEffectView contentView](self->_vibrancyView, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  -[UIView setFrame:](self->_dimmingView, "setFrame:");

  -[CNAvatarCardPresentationController frameOfPresentedViewInContainerView](self, "frameOfPresentedViewInContainerView");
  -[UIView setFrame:](self->_cardView, "setFrame:");
  -[UIView bounds](self->_cardView, "bounds");
  -[UIView setFrame:](self->_contentView, "setFrame:");
  -[UIView bounds](self->_contentView, "bounds");
  objc_msgSend(v4, "setFrame:");

}

- (void)presentationTransitionWillBegin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CNAvatarCardPresentationController containerView](self, "containerView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_backgroundView);
  -[CNAvatarCardPresentationController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setBackgroundColor:", 0);
  -[CNAvatarCardPresentationController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewWillAppear:", 0);

  -[UIView addSubview:](self->_contentView, "addSubview:", v4);
  -[CNAvatarCardPresentationController cardView](self, "cardView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 0.0);

  -[CNAvatarCardPresentationController _layoutViews](self, "_layoutViews");
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  if (a3)
    -[UIVisualEffectView addGestureRecognizer:](self->_backgroundView, "addGestureRecognizer:", self->_tapGestureRecognizer);
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  id v4;

  if (a3)
  {
    -[UIVisualEffectView removeGestureRecognizer:](self->_backgroundView, "removeGestureRecognizer:", self->_tapGestureRecognizer);
    -[UIVisualEffectView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
    -[CNAvatarCardPresentationController originalTransitioning](self, "originalTransitioning");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTransitioningImageVisible:", 1);

  }
}

- (id)presentedView
{
  return self->_backgroundView;
}

- (CGRect)frameOfPresentedViewInContainerView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double MidX;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect result;

  -[CNAvatarCardPresentationController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSize");
  v5 = v4;
  v7 = v6;

  -[CNAvatarCardPresentationController containerView](self, "containerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  if (v5 == 0.0)
  {
    v32.origin.x = v10;
    v32.origin.y = v12;
    v32.size.width = v14;
    v32.size.height = v16;
    v5 = CGRectGetWidth(v32) + -14.0;
  }
  if (v7 == 0.0)
  {
    v33.origin.x = v10;
    v33.origin.y = v12;
    v33.size.width = v14;
    v33.size.height = v16;
    v7 = CGRectGetHeight(v33) + -48.0;
  }
  v34.origin.x = v10;
  v34.origin.y = v12;
  v34.size.width = v14;
  v34.size.height = v16;
  MidX = CGRectGetMidX(v34);
  v35.origin.x = v10;
  v35.origin.y = v12;
  v35.size.width = v14;
  v35.size.height = v16;
  v18 = CGRectGetMidY(v35) + v7 * -0.5;
  -[CNAvatarCardPresentationController alignmentY](self, "alignmentY");
  if (v19 >= 0.0)
  {
    if (-[CNAvatarCardPresentationController alignmentEdge](self, "alignmentEdge") == 1)
    {
      -[CNAvatarCardPresentationController alignmentY](self, "alignmentY");
      v18 = 48.0;
      if (v20 >= 48.0)
      {
        -[CNAvatarCardPresentationController alignmentY](self, "alignmentY");
        v22 = v7 + v21;
        v36.origin.x = v10;
        v36.origin.y = v12;
        v36.size.width = v14;
        v36.size.height = v16;
        if (v22 <= CGRectGetMaxY(v36) + -48.0)
        {
          -[CNAvatarCardPresentationController alignmentY](self, "alignmentY");
          v18 = v23;
        }
        else
        {
          v37.origin.x = v10;
          v37.origin.y = v12;
          v37.size.width = v14;
          v37.size.height = v16;
          v18 = CGRectGetMaxY(v37) - v7 + -48.0;
        }
      }
    }
    if (-[CNAvatarCardPresentationController alignmentEdge](self, "alignmentEdge") == 3)
    {
      -[CNAvatarCardPresentationController alignmentY](self, "alignmentY");
      v25 = v24;
      v38.origin.x = v10;
      v38.origin.y = v12;
      v38.size.width = v14;
      v38.size.height = v16;
      if (v25 <= CGRectGetMaxY(v38) + -48.0)
      {
        -[CNAvatarCardPresentationController alignmentY](self, "alignmentY");
        v18 = 48.0;
        if (v26 - v7 >= 48.0)
        {
          -[CNAvatarCardPresentationController alignmentY](self, "alignmentY");
          v18 = v27 - v7;
        }
      }
      else
      {
        v39.origin.x = v10;
        v39.origin.y = v12;
        v39.size.width = v14;
        v39.size.height = v16;
        v18 = CGRectGetMaxY(v39) - v7 + -48.0;
      }
    }
  }
  v28 = MidX + v5 * -0.5;
  v29 = v18;
  v30 = v5;
  v31 = v7;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(id)a3
{
  id v3;

  -[CNAvatarCardPresentationController containerView](self, "containerView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)tapGestureRecognized:(id)a3
{
  id v3;

  -[CNAvatarCardPresentationController presentedViewController](self, "presentedViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (CGRect)sourceTargetRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceTargetRect.origin.x;
  y = self->_sourceTargetRect.origin.y;
  width = self->_sourceTargetRect.size.width;
  height = self->_sourceTargetRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSourceTargetRect:(CGRect)a3
{
  self->_sourceTargetRect = a3;
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_sourceView, a3);
}

- (CGRect)sourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceRect.origin.x;
  y = self->_sourceRect.origin.y;
  width = self->_sourceRect.size.width;
  height = self->_sourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (double)alignmentY
{
  return self->_alignmentY;
}

- (void)setAlignmentY:(double)a3
{
  self->_alignmentY = a3;
}

- (unsigned)alignmentEdge
{
  return self->_alignmentEdge;
}

- (void)setAlignmentEdge:(unsigned int)a3
{
  self->_alignmentEdge = a3;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (UIViewController)sourceViewController
{
  return self->_sourceViewController;
}

- (void)setSourceViewController:(id)a3
{
  objc_storeStrong((id *)&self->_sourceViewController, a3);
}

- (CNAvatarCardTransition)transition
{
  return self->_transition;
}

- (void)setTransition:(id)a3
{
  objc_storeStrong((id *)&self->_transition, a3);
}

- (CNCardTransitioning)originalTransitioning
{
  return self->_originalTransitioning;
}

- (void)setOriginalTransitioning:(id)a3
{
  objc_storeStrong((id *)&self->_originalTransitioning, a3);
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UIVisualEffectView)vibrancyView
{
  return self->_vibrancyView;
}

- (void)setVibrancyView:(id)a3
{
  objc_storeStrong((id *)&self->_vibrancyView, a3);
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
  objc_storeStrong((id *)&self->_dimmingView, a3);
}

- (UIView)cardView
{
  return self->_cardView;
}

- (void)setCardView:(id)a3
{
  objc_storeStrong((id *)&self->_cardView, a3);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_cardView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_vibrancyView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_originalTransitioning, 0);
  objc_storeStrong((id *)&self->_transition, 0);
  objc_storeStrong((id *)&self->_sourceViewController, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
}

@end
