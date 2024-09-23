@implementation AMUIPasscodeButton

- (AMUIPasscodeButton)initWithFrame:(CGRect)a3
{
  AMUIPasscodeButton *v3;
  id v4;
  uint64_t v5;
  UIView *pillView;
  UIView *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  UIView *v11;
  UIView *backdropView;
  void *v13;
  CABackdropLayer *v14;
  CABackdropLayer *backdropLayer;
  CABackdropLayer *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  UILabel *titleLabel;
  UILabel *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_super v41;
  _QWORD v42[2];
  _QWORD v43[2];

  v43[1] = *MEMORY[0x24BDAC8D0];
  v41.receiver = self;
  v41.super_class = (Class)AMUIPasscodeButton;
  v3 = -[AMUIPasscodeButton initWithFrame:](&v41, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6F90]);
    -[AMUIPasscodeButton bounds](v3, "bounds");
    v5 = objc_msgSend(v4, "initWithFrame:");
    pillView = v3->_pillView;
    v3->_pillView = (UIView *)v5;

    -[UIView setAlpha:](v3->_pillView, "setAlpha:", 0.1);
    v7 = v3->_pillView;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v7, "setBackgroundColor:", v8);

    -[UIView layer](v3->_pillView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x24BDE58E8];
    objc_msgSend(v9, "setCornerCurve:", *MEMORY[0x24BDE58E8]);

    -[AMUIPasscodeButton addSubview:](v3, "addSubview:", v3->_pillView);
    v11 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
    backdropView = v3->_backdropView;
    v3->_backdropView = v11;

    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5A10]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setName:", CFSTR("saturation"));
    objc_msgSend(v13, "setValue:forKey:", &unk_250778B68, CFSTR("inputAmount"));
    v14 = (CABackdropLayer *)objc_alloc_init(MEMORY[0x24BDE5640]);
    backdropLayer = v3->_backdropLayer;
    v3->_backdropLayer = v14;

    v16 = v3->_backdropLayer;
    v43[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CABackdropLayer setFilters:](v16, "setFilters:", v17);

    -[CABackdropLayer setCornerCurve:](v3->_backdropLayer, "setCornerCurve:", v10);
    -[UIView layer](v3->_backdropView, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSublayer:", v3->_backdropLayer);

    -[AMUIPasscodeButton addSubview:](v3, "addSubview:", v3->_backdropView);
    v19 = objc_alloc(MEMORY[0x24BDF6B68]);
    v20 = objc_msgSend(v19, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v20;

    v22 = v3->_titleLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.48);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v22, "setTextColor:", v23);

    -[UILabel layer](v3->_titleLabel, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BD8]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setCompositingFilter:", v25);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[AMUIPasscodeButton addSubview:](v3, "addSubview:", v3->_titleLabel);
    v26 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("_titleLabel"), v3->_titleLabel, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-(>=16)-[_titleLabel]-(>=16)-|"), 0, 0, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activateConstraints:", v28);

    v29 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("_titleLabel"), v3->_titleLabel, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(14)-[_titleLabel]-(14)-|"), 0, 0, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "activateConstraints:", v31);

    v32 = (void *)MEMORY[0x24BDD1628];
    -[UILabel centerXAnchor](v3->_titleLabel, "centerXAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMUIPasscodeButton centerXAnchor](v3, "centerXAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v35;
    -[UILabel centerYAnchor](v3->_titleLabel, "centerYAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMUIPasscodeButton centerYAnchor](v3, "centerYAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v38;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "activateConstraints:", v39);

  }
  return v3;
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
}

- (UIFont)font
{
  return -[UILabel font](self->_titleLabel, "font");
}

- (void)setFont:(id)a3
{
  -[UILabel setFont:](self->_titleLabel, "setFont:", a3);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  double v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;
  id location;
  objc_super v12;

  v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMUIPasscodeButton;
  -[AMUIPasscodeButton setHighlighted:](&v12, sel_setHighlighted_);
  objc_initWeak(&location, self->_pillView);
  v5 = objc_alloc(MEMORY[0x24BDF6FA8]);
  if (v3)
    v6 = 0.0;
  else
    v6 = 0.85;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __37__AMUIPasscodeButton_setHighlighted___block_invoke;
  v8[3] = &unk_2507634F8;
  objc_copyWeak(&v9, &location);
  v10 = v3;
  v7 = (void *)objc_msgSend(v5, "initWithDuration:controlPoint1:controlPoint2:animations:", v8, v6, 0.0, 0.0, 0.0, 1.0);
  objc_msgSend(v7, "startAnimation");

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __37__AMUIPasscodeButton_setHighlighted___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setAlpha:", dbl_23603B220[*(_BYTE *)(a1 + 40) == 0]);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  AMUIPasscodeButton *v7;
  CGPoint v9;
  CGRect v10;

  y = a3.y;
  x = a3.x;
  -[AMUIPasscodeButton bounds](self, "bounds", a4);
  v9.x = x;
  v9.y = y;
  if (CGRectContainsPoint(v10, v9))
    v7 = self;
  else
    v7 = 0;
  return v7;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  CABackdropLayer *backdropLayer;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AMUIPasscodeButton;
  -[AMUIPasscodeButton layoutSubviews](&v7, sel_layoutSubviews);
  -[AMUIPasscodeButton bounds](self, "bounds");
  v4 = v3 * 0.5;
  -[UIView setFrame:](self->_pillView, "setFrame:");
  -[UIView layer](self->_pillView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", v4);

  backdropLayer = self->_backdropLayer;
  -[UIView frame](self->_pillView, "frame");
  -[CABackdropLayer setFrame:](backdropLayer, "setFrame:");
  -[CABackdropLayer setCornerRadius:](self->_backdropLayer, "setCornerRadius:", v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropLayer, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_pillView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
