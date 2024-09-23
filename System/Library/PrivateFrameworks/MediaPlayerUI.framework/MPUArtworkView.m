@implementation MPUArtworkView

- (MPUArtworkView)initWithImage:(id)a3
{
  MPUArtworkView *v3;
  MPUArtworkView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPUArtworkView;
  v3 = -[MPUArtworkView initWithImage:](&v6, sel_initWithImage_, a3);
  v4 = v3;
  if (v3)
  {
    -[MPUArtworkView setContentMode:](v3, "setContentMode:", 1);
    -[MPUArtworkView setOpaque:](v4, "setOpaque:", 1);
  }
  return v4;
}

- (MPUArtworkView)initWithFrame:(CGRect)a3
{
  MPUArtworkView *v3;
  MPUArtworkView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPUArtworkView;
  v3 = -[MPUArtworkView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MPUArtworkView setContentMode:](v3, "setContentMode:", 1);
    -[MPUArtworkView setOpaque:](v4, "setOpaque:", 1);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v2;

  self->_isDeallocating = 1;
  v2.receiver = self;
  v2.super_class = (Class)MPUArtworkView;
  -[MPUArtworkView dealloc](&v2, sel_dealloc);
}

- (void)updateConstraints
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  -[MPUArtworkView image](self, "image");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[MPUArtworkView automaticallyApplyAspectConstraints](self, "automaticallyApplyAspectConstraints");

    if (v5)
    {
      -[MPUArtworkView image](self, "image");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "size");
      v8 = v7;
      v10 = v9;

      if (v10 > 0.0 && v8 > 0.0)
        -[MPUArtworkView _setAspectConstraintMultiplier:](self, "_setAspectConstraintMultiplier:", v10 / v8);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)MPUArtworkView;
  -[MPUArtworkView updateConstraints](&v11, sel_updateConstraints);
}

- (void)setHighlighted:(BOOL)a3
{
  -[MPUArtworkView setHighlighted:animated:](self, "setHighlighted:animated:", a3, 0);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  objc_super v6;

  v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)MPUArtworkView;
  -[MPUArtworkView setHighlighted:](&v6, sel_setHighlighted_, a3);
  if (self->_dimsWhenHighlighted)
    -[MPUArtworkView _updateHighlightViewAnimated:](self, "_updateHighlightViewAnimated:", v4);
}

- (void)setHighlightedImage:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MPUArtworkView;
  -[MPUArtworkView setHighlightedImage:](&v4, sel_setHighlightedImage_, a3);
  if (self->_dimsWhenHighlighted)
    -[MPUArtworkView _updateHighlightViewAnimated:](self, "_updateHighlightViewAnimated:", 0);
}

- (void)setHighlightedAnimationImages:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MPUArtworkView;
  -[MPUArtworkView setHighlightedAnimationImages:](&v4, sel_setHighlightedAnimationImages_, a3);
  if (self->_dimsWhenHighlighted)
    -[MPUArtworkView _updateHighlightViewAnimated:](self, "_updateHighlightViewAnimated:", 0);
}

- (void)setImage:(id)a3
{
  UIImage *v4;
  UIImage *externalImage;
  objc_super v6;

  v4 = (UIImage *)a3;
  if (-[MPUArtworkView isDisplayingPlaceholder](self, "isDisplayingPlaceholder"))
    -[MPUArtworkView _setPlaceholderHidden:](self, "_setPlaceholderHidden:", 1);
  v6.receiver = self;
  v6.super_class = (Class)MPUArtworkView;
  -[MPUArtworkView setImage:](&v6, sel_setImage_, v4);
  externalImage = self->_externalImage;
  self->_externalImage = v4;

  if (-[MPUArtworkView shouldDisplayPlaceholder](self, "shouldDisplayPlaceholder"))
    -[MPUArtworkView _setPlaceholderHidden:](self, "_setPlaceholderHidden:", 0);
  -[MPUArtworkView _imageDidChange](self, "_imageDidChange");
}

- (void)startAnimating
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPUArtworkView;
  -[MPUArtworkView startAnimating](&v3, sel_startAnimating);
  if (self->_dimsWhenHighlighted)
    -[MPUArtworkView _updateHighlightViewAnimated:](self, "_updateHighlightViewAnimated:", 0);
}

- (void)stopAnimating
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPUArtworkView;
  -[MPUArtworkView stopAnimating](&v3, sel_stopAnimating);
  if (self->_dimsWhenHighlighted)
    -[MPUArtworkView _updateHighlightViewAnimated:](self, "_updateHighlightViewAnimated:", 0);
}

- (void)setAutomaticallyApplyAspectConstraints:(BOOL)a3
{
  NSLayoutConstraint *aspectConstraint;

  if (self->_automaticallyApplyAspectConstraints != a3)
  {
    self->_automaticallyApplyAspectConstraints = a3;
    if (a3)
    {
      -[MPUArtworkView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    }
    else
    {
      -[MPUArtworkView removeConstraint:](self, "removeConstraint:", self->_aspectConstraint);
      aspectConstraint = self->_aspectConstraint;
      self->_aspectConstraint = 0;

    }
  }
}

- (void)setDimsWhenHighlighted:(BOOL)a3
{
  UIView *highlightView;

  if (self->_dimsWhenHighlighted != a3)
  {
    self->_dimsWhenHighlighted = a3;
    if (a3)
    {
      -[MPUArtworkView _updateHighlightViewAnimated:](self, "_updateHighlightViewAnimated:", 1);
    }
    else
    {
      -[UIView removeFromSuperview](self->_highlightView, "removeFromSuperview");
      highlightView = self->_highlightView;
      self->_highlightView = 0;

    }
  }
}

- (void)setPlaceholderImage:(id)a3
{
  UIImage *v5;
  UIImage *placeholderImage;
  objc_super v7;

  v5 = (UIImage *)a3;
  if (self->_placeholderImage != v5)
  {
    objc_storeStrong((id *)&self->_placeholderImage, a3);
    if (-[MPUArtworkView isDisplayingPlaceholder](self, "isDisplayingPlaceholder"))
    {
      placeholderImage = self->_placeholderImage;
      v7.receiver = self;
      v7.super_class = (Class)MPUArtworkView;
      -[MPUArtworkView setImage:](&v7, sel_setImage_, placeholderImage);
      -[MPUArtworkView _imageDidChange](self, "_imageDidChange");
    }
    -[MPUArtworkView _setPlaceholderHidden:](self, "_setPlaceholderHidden:", -[MPUArtworkView shouldDisplayPlaceholder](self, "shouldDisplayPlaceholder") ^ 1);
  }

}

- (BOOL)shouldDisplayPlaceholder
{
  BOOL v3;
  void *v4;

  if (-[MPUArtworkView isDisplayingPlaceholder](self, "isDisplayingPlaceholder"))
    return 0;
  -[MPUArtworkView placeholderImage](self, "placeholderImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v3 = self->_externalImage == 0;
  else
    v3 = 0;

  return v3;
}

- (double)_aspectConstraintMultiplier
{
  double result;

  -[NSLayoutConstraint multiplier](self->_aspectConstraint, "multiplier");
  return result;
}

- (void)_setAspectConstraintMultiplier:(double)a3
{
  double v5;
  NSLayoutConstraint *v6;
  NSLayoutConstraint *aspectConstraint;

  -[NSLayoutConstraint multiplier](self->_aspectConstraint, "multiplier");
  if (v5 != a3)
  {
    -[MPUArtworkView removeConstraint:](self, "removeConstraint:", self->_aspectConstraint);
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 8, 0, self, 7, a3, 0.0);
    v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    aspectConstraint = self->_aspectConstraint;
    self->_aspectConstraint = v6;

    -[MPUArtworkView addConstraint:](self, "addConstraint:", self->_aspectConstraint);
  }
}

- (void)_imageDidChange
{
  if (-[MPUArtworkView automaticallyApplyAspectConstraints](self, "automaticallyApplyAspectConstraints"))
    -[MPUArtworkView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)_setPlaceholderHidden:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  UIImage *placeholderImage;
  objc_super v7;
  objc_super v8;

  v3 = a3;
  if (a3)
  {
    -[MPUArtworkView _externalImage](self, "_externalImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8.receiver = self;
    v8.super_class = (Class)MPUArtworkView;
    -[MPUArtworkView setImage:](&v8, sel_setImage_, v5);

  }
  else
  {
    placeholderImage = self->_placeholderImage;
    v7.receiver = self;
    v7.super_class = (Class)MPUArtworkView;
    -[MPUArtworkView setImage:](&v7, sel_setImage_, placeholderImage);
  }
  -[MPUArtworkView setDisplayingPlaceholder:](self, "setDisplayingPlaceholder:", !v3);
  -[MPUArtworkView _imageDidChange](self, "_imageDidChange");
}

- (BOOL)_shouldShowHighlightView
{
  void *v3;
  uint64_t v4;
  BOOL v5;

  if (!-[MPUArtworkView isHighlighted](self, "isHighlighted"))
    return 0;
  if (-[MPUArtworkView isAnimating](self, "isAnimating"))
  {
    -[MPUArtworkView highlightedAnimationImages](self, "highlightedAnimationImages");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");
  }
  else
  {
    -[MPUArtworkView highlightedImage](self, "highlightedImage");
    v4 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)v4;
  }
  v5 = v4 == 0;

  return v5;
}

- (void)_updateHighlightViewAnimated:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  _BOOL4 v6;
  double v7;
  BOOL v8;
  _BOOL4 v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  float v14;
  float v15;
  UIView *highlightView;
  id v17;
  UIView *v18;
  UIView *v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];

  if (self->_isDeallocating)
    return;
  v3 = a3;
  v5 = -[MPUArtworkView _shouldShowHighlightView](self, "_shouldShowHighlightView");
  v6 = -[UIView isHidden](self->_highlightView, "isHidden");
  -[UIView alpha](self->_highlightView, "alpha");
  v8 = v7 < 1.0 || v6;
  if (!v5 || !v8)
  {
    v9 = v7 <= 0.0 && v6;
    if (v5 || v9)
      return;
  }
  v10 = 0.0;
  if (v5)
    v11 = 1.0;
  else
    v11 = 0.0;
  -[UIView layer](self->_highlightView, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "presentationLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "opacity");
  v15 = v14;
  if (v3 || v5)
  {
    if (!v3)
      goto LABEL_19;
    goto LABEL_18;
  }
  if (-[MPUArtworkView forcesAnimatedUnhighlighting](self, "forcesAnimatedUnhighlighting"))
LABEL_18:
    v10 = vabdd_f64(v15, v11) * 0.2;
LABEL_19:
  if (v5)
  {
    highlightView = self->_highlightView;
    if (highlightView)
    {
      if (-[UIView isHidden](highlightView, "isHidden"))
        -[UIView setHidden:](self->_highlightView, "setHidden:", 0);
    }
    else
    {
      v17 = objc_alloc(MEMORY[0x24BDF6F90]);
      -[MPUArtworkView bounds](self, "bounds");
      v18 = (UIView *)objc_msgSend(v17, "initWithFrame:");
      v19 = self->_highlightView;
      self->_highlightView = v18;

      -[UIView setAutoresizingMask:](self->_highlightView, "setAutoresizingMask:", 18);
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_highlightView, "setBackgroundColor:", v20);

      -[UIView setAlpha:](self->_highlightView, "setAlpha:", 0.0);
      -[MPUArtworkView addSubview:](self, "addSubview:", self->_highlightView);
    }
    if (v10 <= 0.0)
    {
      -[UIView setAlpha:](self->_highlightView, "setAlpha:", 1.0);
    }
    else
    {
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __47__MPUArtworkView__updateHighlightViewAnimated___block_invoke;
      v23[3] = &unk_24DD2FA40;
      v23[4] = self;
      objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v23, v10);
    }
  }
  else if (v10 <= 0.0)
  {
    -[UIView setAlpha:](self->_highlightView, "setAlpha:", 0.0);
    -[UIView setHidden:](self->_highlightView, "setHidden:", 1);
  }
  else
  {
    v21[4] = self;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __47__MPUArtworkView__updateHighlightViewAnimated___block_invoke_2;
    v22[3] = &unk_24DD2FA40;
    v22[4] = self;
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __47__MPUArtworkView__updateHighlightViewAnimated___block_invoke_3;
    v21[3] = &unk_24DD2FAE0;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v22, v21, v10);
  }

}

uint64_t __47__MPUArtworkView__updateHighlightViewAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "setAlpha:", 1.0);
}

uint64_t __47__MPUArtworkView__updateHighlightViewAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "setAlpha:", 0.0);
}

uint64_t __47__MPUArtworkView__updateHighlightViewAnimated___block_invoke_3(uint64_t result, int a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = result;
    result = objc_msgSend(*(id *)(result + 32), "_shouldShowHighlightView");
    if ((result & 1) == 0)
      return objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 528), "setHidden:", 1);
  }
  return result;
}

- (UIImage)_externalImage
{
  return self->_externalImage;
}

- (BOOL)automaticallyApplyAspectConstraints
{
  return self->_automaticallyApplyAspectConstraints;
}

- (BOOL)dimsWhenHighlighted
{
  return self->_dimsWhenHighlighted;
}

- (BOOL)forcesAnimatedUnhighlighting
{
  return self->_forcesAnimatedUnhighlighting;
}

- (void)setForcesAnimatedUnhighlighting:(BOOL)a3
{
  self->_forcesAnimatedUnhighlighting = a3;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (BOOL)isDisplayingPlaceholder
{
  return self->_displayingPlaceholder;
}

- (void)setDisplayingPlaceholder:(BOOL)a3
{
  self->_displayingPlaceholder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_externalImage, 0);
  objc_storeStrong((id *)&self->_aspectConstraint, 0);
}

@end
