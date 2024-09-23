@implementation MRUStepper

- (MRUStepper)initWithFrame:(CGRect)a3
{
  MRUStepper *v3;
  UIView *v4;
  UIView *decrementBackground;
  UIView *v6;
  UIView *incrementBackground;
  uint64_t v8;
  MRUTransportButton *decrementButton;
  void *v10;
  uint64_t v11;
  MRUTransportButton *incrementButton;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MRUStepper;
  v3 = -[MRUStepper initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    decrementBackground = v3->_decrementBackground;
    v3->_decrementBackground = v4;

    -[MRUStepper addSubview:](v3, "addSubview:", v3->_decrementBackground);
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    incrementBackground = v3->_incrementBackground;
    v3->_incrementBackground = v6;

    -[MRUStepper addSubview:](v3, "addSubview:", v3->_incrementBackground);
    +[MPButton easyTouchButtonWithType:](MRUTransportButton, "easyTouchButtonWithType:", 0);
    v8 = objc_claimAutoreleasedReturnValue();
    decrementButton = v3->_decrementButton;
    v3->_decrementButton = (MRUTransportButton *)v8;

    -[MRUTransportButton setShowHighlightCircle:](v3->_decrementButton, "setShowHighlightCircle:", 0);
    -[MRUTransportButton setPointerStyle:](v3->_decrementButton, "setPointerStyle:", 1);
    -[MRUTransportButton imageView](v3->_decrementButton, "imageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setContentMode:", 1);

    -[MRUTransportButton addTarget:action:forControlEvents:](v3->_decrementButton, "addTarget:action:forControlEvents:", v3, sel_decreaseTouchUpInside_, 64);
    -[MRUTransportButton addTarget:action:forControlEvents:](v3->_decrementButton, "addTarget:action:forControlEvents:", v3, sel_decreaseButtonHoldBegan_, 0x1000000);
    -[MRUTransportButton addTarget:action:forControlEvents:](v3->_decrementButton, "addTarget:action:forControlEvents:", v3, sel_decreaseButtonHoldReleased_, 0x2000000);
    -[MRUStepper addSubview:](v3, "addSubview:", v3->_decrementButton);
    +[MPButton easyTouchButtonWithType:](MRUTransportButton, "easyTouchButtonWithType:", 0);
    v11 = objc_claimAutoreleasedReturnValue();
    incrementButton = v3->_incrementButton;
    v3->_incrementButton = (MRUTransportButton *)v11;

    -[MRUTransportButton setShowHighlightCircle:](v3->_incrementButton, "setShowHighlightCircle:", 0);
    -[MRUTransportButton setPointerStyle:](v3->_incrementButton, "setPointerStyle:", 1);
    -[MRUTransportButton imageView](v3->_incrementButton, "imageView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContentMode:", 1);

    -[MRUTransportButton addTarget:action:forControlEvents:](v3->_incrementButton, "addTarget:action:forControlEvents:", v3, sel_increaseTouchUpInside_, 64);
    -[MRUTransportButton addTarget:action:forControlEvents:](v3->_incrementButton, "addTarget:action:forControlEvents:", v3, sel_increaseButtonHoldBegan_, 0x1000000);
    -[MRUTransportButton addTarget:action:forControlEvents:](v3->_incrementButton, "addTarget:action:forControlEvents:", v3, sel_increaseButtonHoldReleased_, 0x2000000);
    -[MRUStepper addSubview:](v3, "addSubview:", v3->_incrementButton);
  }
  return v3;
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double MinX;
  double MinY;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  objc_super v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v15.receiver = self;
  v15.super_class = (Class)MRUStepper;
  -[MRUStepper layoutSubviews](&v15, sel_layoutSubviews);
  -[MRUStepper bounds](self, "bounds");
  x = v16.origin.x;
  y = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;
  CGRectGetWidth(v16);
  UIRoundToViewScale();
  v8 = v7;
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  MinX = CGRectGetMinX(v17);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  MinY = CGRectGetMinY(v18);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v11 = CGRectGetHeight(v19);
  -[MRUStepper bounds](self, "bounds");
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[MRUTransportButton setFrame:](self->_decrementButton, "setFrame:");
  v20.origin.x = MinX;
  v20.origin.y = MinY;
  v20.size.width = v8;
  v20.size.height = v11;
  -[MRUTransportButton _setContinuousCornerRadius:](self->_decrementButton, "_setContinuousCornerRadius:", CGRectGetHeight(v20) * 0.5);
  -[UIView setFrame:](self->_decrementBackground, "setFrame:", MinX, MinY, v8, v11);
  v21.origin.x = MinX;
  v21.origin.y = MinY;
  v21.size.width = v8;
  v21.size.height = v11;
  -[UIView _setContinuousCornerRadius:](self->_decrementBackground, "_setContinuousCornerRadius:", CGRectGetHeight(v21) * 0.5);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  v12 = CGRectGetMaxX(v22) - v8;
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v13 = CGRectGetMinY(v23);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  v14 = CGRectGetHeight(v24);
  -[MRUStepper bounds](self, "bounds");
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[MRUTransportButton setFrame:](self->_incrementButton, "setFrame:");
  v25.origin.x = v12;
  v25.origin.y = v13;
  v25.size.width = v8;
  v25.size.height = v14;
  -[MRUTransportButton _setContinuousCornerRadius:](self->_incrementButton, "_setContinuousCornerRadius:", CGRectGetHeight(v25) * 0.5);
  -[UIView setFrame:](self->_incrementBackground, "setFrame:", v12, v13, v8, v14);
  v26.origin.x = v12;
  v26.origin.y = v13;
  v26.size.width = v8;
  v26.size.height = v14;
  -[UIView _setContinuousCornerRadius:](self->_incrementBackground, "_setContinuousCornerRadius:", CGRectGetHeight(v26) * 0.5);
}

- (void)setDecrementImage:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_decrementImage, a3);
  v5 = a3;
  -[MRUTransportButton setImage:forState:](self->_decrementButton, "setImage:forState:", v5, 0);

}

- (void)setIncrementImage:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_incrementImage, a3);
  v5 = a3;
  -[MRUTransportButton setImage:forState:](self->_incrementButton, "setImage:forState:", v5, 0);

}

- (void)setPreferredSymbolConfiguration:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_preferredSymbolConfiguration, a3);
  v5 = a3;
  -[MRUTransportButton setPreferredSymbolConfiguration:forImageInState:](self->_incrementButton, "setPreferredSymbolConfiguration:forImageInState:", v5, 0);
  -[MRUTransportButton setPreferredSymbolConfiguration:forImageInState:](self->_decrementButton, "setPreferredSymbolConfiguration:forImageInState:", v5, 0);

}

- (void)setStylingProvider:(id)a3
{
  MRUVisualStylingProvider *v5;
  MRUVisualStylingProvider *stylingProvider;
  MRUVisualStylingProvider *v7;

  v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  v7 = v5;
  if (stylingProvider != v5)
  {
    -[MRUVisualStylingProvider removeObserver:](stylingProvider, "removeObserver:", self);
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    -[MRUVisualStylingProvider addObserver:](self->_stylingProvider, "addObserver:", self);
    -[MRUStepper updateVisualStyling](self, "updateVisualStyling");
    -[MRUTransportButton setStylingProvider:](self->_incrementButton, "setStylingProvider:", v7);
    -[MRUTransportButton setStylingProvider:](self->_decrementButton, "setStylingProvider:", v7);
  }

}

- (void)setDimmed:(BOOL)a3
{
  if (self->_dimmed != a3)
  {
    self->_dimmed = a3;
    -[MRUTransportButton setDimmed:](self->_incrementButton, "setDimmed:");
    -[MRUTransportButton setDimmed:](self->_decrementButton, "setDimmed:", self->_dimmed);
  }
}

- (void)decreaseTouchUpInside:(id)a3
{
  id WeakRetained;

  if (!-[MPButton isHolding](self->_decrementButton, "isHolding", a3))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "stepperDidDecrement:", self);

  }
}

- (void)decreaseButtonHoldBegan:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(0, "stepperDecrementHoldBegan:", self);
}

- (void)decreaseButtonHoldReleased:(id)a3
{
  if (-[MPButton isHolding](self->_decrementButton, "isHolding", a3))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(0, "stepperDecrementHoldEnded:", self);
  }
}

- (void)increaseTouchUpInside:(id)a3
{
  id WeakRetained;

  if (!-[MPButton isHolding](self->_incrementButton, "isHolding", a3))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "stepperDidIncrement:", self);

  }
}

- (void)increaseButtonHoldBegan:(id)a3
{
  if (-[MPButton isHolding](self->_incrementButton, "isHolding", a3))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(0, "stepperIncrementHoldBegan:", self);
  }
}

- (void)increaseButtonHoldReleased:(id)a3
{
  if (-[MPButton isHolding](self->_incrementButton, "isHolding", a3))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(0, "stepperIncrementHoldEnded:", self);
  }
}

- (void)updateVisualStyling
{
  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 2, self->_decrementBackground);
  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 2, self->_incrementBackground);
}

- (MRUStepperDelegate)delegate
{
  return (MRUStepperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIImage)decrementImage
{
  return self->_decrementImage;
}

- (UIImage)incrementImage
{
  return self->_incrementImage;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (UIImageSymbolConfiguration)preferredSymbolConfiguration
{
  return self->_preferredSymbolConfiguration;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (UIView)decrementBackground
{
  return self->_decrementBackground;
}

- (void)setDecrementBackground:(id)a3
{
  objc_storeStrong((id *)&self->_decrementBackground, a3);
}

- (UIView)incrementBackground
{
  return self->_incrementBackground;
}

- (void)setIncrementBackground:(id)a3
{
  objc_storeStrong((id *)&self->_incrementBackground, a3);
}

- (MRUTransportButton)decrementButton
{
  return self->_decrementButton;
}

- (void)setDecrementButton:(id)a3
{
  objc_storeStrong((id *)&self->_decrementButton, a3);
}

- (MRUTransportButton)incrementButton
{
  return self->_incrementButton;
}

- (void)setIncrementButton:(id)a3
{
  objc_storeStrong((id *)&self->_incrementButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incrementButton, 0);
  objc_storeStrong((id *)&self->_decrementButton, 0);
  objc_storeStrong((id *)&self->_incrementBackground, 0);
  objc_storeStrong((id *)&self->_decrementBackground, 0);
  objc_storeStrong((id *)&self->_preferredSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_incrementImage, 0);
  objc_storeStrong((id *)&self->_decrementImage, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
