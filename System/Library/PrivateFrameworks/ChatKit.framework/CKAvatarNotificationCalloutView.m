@implementation CKAvatarNotificationCalloutView

- (CKAvatarNotificationCalloutView)initWithFrame:(CGRect)a3 previewText:(id)a4 mode:(int64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  CKAvatarNotificationCalloutView *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  objc_super v49;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v49.receiver = self;
  v49.super_class = (Class)CKAvatarNotificationCalloutView;
  v11 = -[CKAvatarNotificationCalloutView initWithFrame:](&v49, sel_initWithFrame_, x, y, width, height);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAvatarNotificationCalloutView setBackgroundColor:](v11, "setBackgroundColor:", v12);

    v13 = objc_alloc_init(MEMORY[0x1E0CEAB18]);
    -[CKAvatarNotificationCalloutView setTextView:](v11, "setTextView:", v13);

    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAvatarNotificationCalloutView textView](v11, "textView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v14);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB540]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAvatarNotificationCalloutView textView](v11, "textView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFont:", v16);

    -[CKAvatarNotificationCalloutView textView](v11, "textView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", v10);

    -[CKAvatarNotificationCalloutView textView](v11, "textView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setEditable:", 0);

    -[CKAvatarNotificationCalloutView textView](v11, "textView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setScrollEnabled:", 0);

    -[CKAvatarNotificationCalloutView textView](v11, "textView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setUserInteractionEnabled:", 0);

    -[CKAvatarNotificationCalloutView textView](v11, "textView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTextContainerInset:", 3.0, 5.0, 3.0, 5.0);

    -[CKAvatarNotificationCalloutView textView](v11, "textView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setCornerRadius:", 12.5);

    if (-[CKAvatarNotificationCalloutView _shouldShowShadow](v11, "_shouldShowShadow"))
    {
      -[CKAvatarNotificationCalloutView textView](v11, "textView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "layer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setMasksToBounds:", 0);

      -[CKAvatarNotificationCalloutView textView](v11, "textView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "layer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v29) = 1050253722;
      objc_msgSend(v28, "setShadowOpacity:", v29);

      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
      v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v31 = objc_msgSend(v30, "CGColor");
      -[CKAvatarNotificationCalloutView textView](v11, "textView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "layer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setShadowColor:", v31);

      -[CKAvatarNotificationCalloutView textView](v11, "textView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "layer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setShadowOffset:", 0.0, 0.0);

      -[CKAvatarNotificationCalloutView textView](v11, "textView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "layer");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setShadowRadius:", 12.5);

    }
    -[CKAvatarNotificationCalloutView textView](v11, "textView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "sizeToFit");

    -[CKAvatarNotificationCalloutView textView](v11, "textView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAvatarNotificationCalloutView addSubview:](v11, "addSubview:", v39);

    v40 = objc_alloc_init(MEMORY[0x1E0CEA658]);
    -[CKAvatarNotificationCalloutView setTailImageView:](v11, "setTailImageView:", v40);

    objc_msgSend(MEMORY[0x1E0CEA638], "ckTemplateImageNamed:", CFSTR("Message-Callout-Tail"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAvatarNotificationCalloutView tailImageView](v11, "tailImageView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setImage:", v41);

    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAvatarNotificationCalloutView tailImageView](v11, "tailImageView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setTintColor:", v43);

    -[CKAvatarNotificationCalloutView tailImageView](v11, "tailImageView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAvatarNotificationCalloutView addSubview:](v11, "addSubview:", v45);

    -[CKAvatarNotificationCalloutView setUserInteractionEnabled:](v11, "setUserInteractionEnabled:", 1);
    v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v11, sel__handleTap_);
    -[CKAvatarNotificationCalloutView setTapGestureRecognizer:](v11, "setTapGestureRecognizer:", v46);

    -[CKAvatarNotificationCalloutView tapGestureRecognizer](v11, "tapGestureRecognizer");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAvatarNotificationCalloutView addGestureRecognizer:](v11, "addGestureRecognizer:", v47);

  }
  return v11;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  void *v23;
  double Width;
  CGFloat v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  CGFloat v41;
  CGFloat v42;
  objc_super v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v43.receiver = self;
  v43.super_class = (Class)CKAvatarNotificationCalloutView;
  -[CKAvatarNotificationCalloutView layoutSubviews](&v43, sel_layoutSubviews);
  -[CKAvatarNotificationCalloutView sizeToFit](self, "sizeToFit");
  -[CKAvatarNotificationCalloutView bounds](self, "bounds");
  v4 = v3;
  v41 = v5;
  v42 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKAvatarNotificationCalloutView tailImageView](self, "tailImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeToFit");

  -[CKAvatarNotificationCalloutView tailImageView](self, "tailImageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v44.origin.x = v4;
  v44.origin.y = v6;
  v44.size.width = v8;
  v44.size.height = v10;
  v21 = CGRectGetWidth(v44) * 0.5;
  v45.origin.x = v14;
  v45.origin.y = v16;
  v45.size.width = v18;
  v45.size.height = v20;
  v22 = v21 - CGRectGetWidth(v45) * 0.5;
  -[CKAvatarNotificationCalloutView tailImageView](self, "tailImageView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFrame:", v22, 0.0, v18, v20);

  v46.origin.x = v42;
  v46.origin.y = v41;
  v46.size.width = v8;
  v46.size.height = v10;
  Width = CGRectGetWidth(v46);
  v47.origin.x = v42;
  v47.origin.y = v41;
  v47.size.width = v8;
  v47.size.height = v10;
  v25 = CGRectGetHeight(v47) + -9.0;
  -[CKAvatarNotificationCalloutView textView](self, "textView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFrame:", 0.0, 9.0, Width, v25);

  v48.origin.x = v42;
  v48.origin.y = v41;
  v48.size.width = v8;
  v48.size.height = v10;
  if (CGRectGetWidth(v48) == 50.0)
  {
    -[CKAvatarNotificationCalloutView textView](self, "textView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setTextAlignment:", 1);

  }
  if (-[CKAvatarNotificationCalloutView _shouldShowShadow](self, "_shouldShowShadow"))
  {
    -[CKAvatarNotificationCalloutView textView](self, "textView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bounds");
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;

    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRect:", v30 + -1.0, v32 + -1.0, v34 + 2.0, v36 + 2.0);
    v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v38 = objc_msgSend(v37, "CGPath");
    -[CKAvatarNotificationCalloutView textView](self, "textView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "layer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setShadowPath:", v38);

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  void *v4;
  CGFloat v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;
  CGRect v14;
  CGRect v15;

  -[CKAvatarNotificationCalloutView textView](self, "textView", a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = CGRectGetWidth(v14) * 0.7;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  objc_msgSend(v3, "sizeThatFits:", v5, CGRectGetHeight(v15) * 0.5);
  v8 = v7;
  v10 = v9;

  v11 = fmax(v8, 50.0);
  v12 = v10 + 9.0;
  if (v10 > 200.0)
    v12 = 209.0;
  result.height = v12;
  result.width = v11;
  return result;
}

- (BOOL)_shouldShowShadow
{
  return -[CKAvatarNotificationCalloutView mode](self, "mode") == 0;
}

- (void)animateIn
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  CATransform3D v10;
  CATransform3D v11;

  alphaAnimation(1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);
  -[CKAvatarNotificationCalloutView setStarterAniamtion:](self, "setStarterAniamtion:", v3);
  -[CKAvatarNotificationCalloutView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAnimation:forKey:", v3, CFSTR("message-in-opacity-animation"));

  -[CKAvatarNotificationCalloutView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 1.0;
  objc_msgSend(v5, "setOpacity:", v6);

  -[CKAvatarNotificationCalloutView layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  scaleAnimation(1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAnimation:forKey:", v8, CFSTR("message-in-scale-animation"));

  CATransform3DMakeScale(&v11, 1.0, 1.0, 0.0);
  -[CKAvatarNotificationCalloutView layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v11;
  objc_msgSend(v9, "setTransform:", &v10);

}

- (void)animateOut
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  CATransform3D v10;
  CATransform3D v11;

  alphaAnimation(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);
  -[CKAvatarNotificationCalloutView setFinisherAnimation:](self, "setFinisherAnimation:", v3);
  -[CKAvatarNotificationCalloutView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAnimation:forKey:", v3, CFSTR("message-out-opacity-animation"));

  -[CKAvatarNotificationCalloutView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 0;
  objc_msgSend(v5, "setOpacity:", v6);

  scaleAnimation(0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAvatarNotificationCalloutView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAnimation:forKey:", v7, CFSTR("message-out-scale-animation"));

  CATransform3DMakeScale(&v11, 0.001, 0.001, 1.0);
  -[CKAvatarNotificationCalloutView layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v11;
  objc_msgSend(v9, "setTransform:", &v10);

}

- (void)animationDidStart:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  -[CKAvatarNotificationCalloutView starterAniamtion](self, "starterAniamtion");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[CKAvatarNotificationCalloutView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "avatarNotificationCalloutViewWillFadeIn:", self);

  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  id v8;

  v4 = a4;
  v6 = a3;
  -[CKAvatarNotificationCalloutView finisherAnimation](self, "finisherAnimation");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6 && v4)
  {
    -[CKAvatarNotificationCalloutView delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "avatarNotificationCalloutViewDidFinishFadeOut:", self);

  }
}

- (void)_handleTap:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CKAvatarNotificationCalloutView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CKAvatarNotificationCalloutView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "avatarNotificationCalloutViewReceivedTouch:", self);

  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKAvatarNotificationCalloutView;
  return -[CKAvatarNotificationCalloutView pointInside:withEvent:](&v5, sel_pointInside_withEvent_, a4, a3.x, a3.y);
}

- (CKAvatarNotificationCalloutViewDelegate)delegate
{
  return (CKAvatarNotificationCalloutViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (UIImageView)tailImageView
{
  return self->_tailImageView;
}

- (void)setTailImageView:(id)a3
{
  objc_storeStrong((id *)&self->_tailImageView, a3);
}

- (CAAnimation)starterAniamtion
{
  return self->_starterAniamtion;
}

- (void)setStarterAniamtion:(id)a3
{
  objc_storeStrong((id *)&self->_starterAniamtion, a3);
}

- (CAAnimation)finisherAnimation
{
  return self->_finisherAnimation;
}

- (void)setFinisherAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_finisherAnimation, a3);
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_finisherAnimation, 0);
  objc_storeStrong((id *)&self->_starterAniamtion, 0);
  objc_storeStrong((id *)&self->_tailImageView, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
