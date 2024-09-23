@implementation LPContactsBadgeView

- (LPContactsBadgeView)initWithHost:(id)a3
{

  return 0;
}

- (LPContactsBadgeView)initWithHost:(id)a3 contacts:(id)a4 highlighted:(BOOL)a5 style:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  LPContactsBadgeView *v12;
  LPContactsBadgeView *v13;
  id *p_style;
  void *v15;
  objc_class *v16;
  id v17;
  UIImageView *v18;
  UIImageView *highlightIndicatorView;
  void *v20;
  void *v21;
  void *v22;
  UIImageView *v23;
  void *v24;
  UIImageView *v25;
  void *v26;
  UIView *v27;
  UIView *highlightShadowView;
  UIView *v29;
  void *v30;
  CAShapeLayer *v31;
  CAShapeLayer *maskLayer;
  id v33;
  CAShapeLayer *v34;
  void *v35;
  void *v36;
  LPContactsBadgeView *v37;
  id v39;
  objc_super v40;
  _QWORD v41[5];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v39 = a6;
  v40.receiver = self;
  v40.super_class = (Class)LPContactsBadgeView;
  v12 = -[LPComponentView initWithHost:](&v40, sel_initWithHost_, v10);
  v13 = v12;
  if (v12)
  {
    p_style = (id *)&v12->_style;
    objc_storeStrong((id *)&v12->_style, a6);
    -[LPContactsBadgeView setUserInteractionEnabled:](v13, "setUserInteractionEnabled:", 0);
    v42 = 0;
    v43 = &v42;
    v44 = 0x2050000000;
    v15 = (void *)getCNAvatarViewClass_softClass;
    v45 = getCNAvatarViewClass_softClass;
    if (!getCNAvatarViewClass_softClass)
    {
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __getCNAvatarViewClass_block_invoke;
      v41[3] = &unk_1E44A7DB0;
      v41[4] = &v42;
      __getCNAvatarViewClass_block_invoke((uint64_t)v41);
      v15 = (void *)v43[3];
    }
    v16 = objc_retainAutorelease(v15);
    _Block_object_dispose(&v42, 8);
    v17 = objc_alloc_init(v16);
    objc_msgSend(v17, "setContacts:", v11);
    objc_storeStrong((id *)&v13->_avatarView, v17);
    -[LPContactsBadgeView addSubview:](v13, "addSubview:", v13->_avatarView);
    if (v7)
    {
      v18 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
      highlightIndicatorView = v13->_highlightIndicatorView;
      v13->_highlightIndicatorView = v18;

      objc_msgSend(MEMORY[0x1E0DC3870], "_lp_systemImageNamed:", CFSTR("pin.fill"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3888], "_lp_configurationWithPointSize:", 11.0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_lp_imageByApplyingSymbolConfiguration:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](v13->_highlightIndicatorView, "setImage:", v22);

      v23 = v13->_highlightIndicatorView;
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView _lp_setTintColor:](v23, "_lp_setTintColor:", v24);

      v25 = v13->_highlightIndicatorView;
      objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView _lp_setBackgroundColor:](v25, "_lp_setBackgroundColor:", v26);

      -[UIView _lp_insertSubview:belowSubview:](v13, "_lp_insertSubview:belowSubview:", v13->_highlightIndicatorView, v13->_avatarView);
      -[UIImageView setContentMode:](v13->_highlightIndicatorView, "setContentMode:", 4);
      if (objc_msgSend(*p_style, "useShadow"))
      {
        v27 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
        highlightShadowView = v13->_highlightShadowView;
        v13->_highlightShadowView = v27;

        -[UIView _lp_setShadowRadius:](v13->_highlightShadowView, "_lp_setShadowRadius:", 10.0);
        -[UIView _lp_setShadowOffset:](v13->_highlightShadowView, "_lp_setShadowOffset:", 0.0, 3.0);
        -[UIView _lp_setShadowOpacity:](v13->_highlightShadowView, "_lp_setShadowOpacity:", 0.5);
        v29 = v13->_highlightShadowView;
        objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView _lp_setShadowColor:](v29, "_lp_setShadowColor:", v30);

        -[UIView _lp_insertSubview:belowSubview:](v13, "_lp_insertSubview:belowSubview:", v13->_highlightShadowView, v13->_highlightIndicatorView);
      }
      v31 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
      maskLayer = v13->_maskLayer;
      v13->_maskLayer = v31;

      -[CAShapeLayer setFillRule:](v13->_maskLayer, "setFillRule:", *MEMORY[0x1E0CD2B70]);
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CAShapeLayer setFillColor:](v13->_maskLayer, "setFillColor:", objc_msgSend(v33, "CGColor"));

      v34 = v13->_maskLayer;
      -[UIImageView layer](v13->_highlightIndicatorView, "layer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setMask:", v34);

    }
    if (objc_msgSend(*p_style, "useShadow"))
    {
      -[UIView _lp_setShadowRadius:](v13, "_lp_setShadowRadius:", 4.0);
      -[UIView _lp_setShadowOffset:](v13, "_lp_setShadowOffset:", 0.0, 2.0);
      -[UIView _lp_setShadowOpacity:](v13, "_lp_setShadowOpacity:", 0.5);
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView _lp_setShadowColor:](v13, "_lp_setShadowColor:", v36);

    }
    v37 = v13;

  }
  return v13;
}

- (void)layoutComponentView
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  UIImageView *highlightIndicatorView;
  void *v25;
  double v26;
  CGPath *Mutable;
  void *v28;
  CGPath *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  -[LPContactsBadgeStyle margin](self->_style, "margin");
  v4 = v3;
  -[LPContactsBadgeStyle margin](self->_style, "margin");
  v6 = v5;
  -[LPContactsBadgeStyle size](self->_style, "size");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  v9 = v8;
  -[LPContactsBadgeStyle size](self->_style, "size");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "value");
  -[UIView setFrame:](self->_avatarView, "setFrame:", v4, v6, v9, v11);

  if (self->_highlightIndicatorView)
  {
    -[LPContactsBadgeStyle margin](self->_style, "margin");
    v13 = v12;
    -[LPContactsBadgeStyle size](self->_style, "size");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "value");
    v16 = v15;
    -[LPContactsBadgeStyle margin](self->_style, "margin");
    v18 = v17;
    -[LPContactsBadgeStyle size](self->_style, "size");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "value");
    v21 = v20;
    -[LPContactsBadgeStyle size](self->_style, "size");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "value");
    -[UIImageView setFrame:](self->_highlightIndicatorView, "setFrame:", v13 + v16 * 0.5 + 2.0, v18, v21, v23);

    highlightIndicatorView = self->_highlightIndicatorView;
    -[LPContactsBadgeStyle size](self->_style, "size");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "value");
    -[UIImageView _lp_setCornerRadius:](highlightIndicatorView, "_lp_setCornerRadius:", v26 * 0.5);

    if (-[LPContactsBadgeStyle useShadow](self->_style, "useShadow"))
    {
      -[UIImageView frame](self->_highlightIndicatorView, "frame");
      -[UIView setFrame:](self->_highlightShadowView, "setFrame:");
      Mutable = CGPathCreateMutable();
      -[UIView bounds](self->_highlightShadowView, "bounds");
      CGPathAddEllipseInRect(Mutable, 0, v38);
      -[UIView layer](self->_highlightShadowView, "layer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setShadowPath:", Mutable);

      CGPathRelease(Mutable);
    }
    v29 = CGPathCreateMutable();
    -[LPContactsBadgeStyle size](self->_style, "size");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "value");
    v32 = v31;
    -[LPContactsBadgeStyle size](self->_style, "size");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "value");
    v35 = v34;
    -[LPContactsBadgeStyle size](self->_style, "size");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "value");
    v39.size.width = v35 + 4.0;
    v39.size.height = v37 + 4.0;
    v39.origin.y = -2.0;
    v39.origin.x = v32 * -0.5 + -4.0;
    CGPathAddEllipseInRect(v29, 0, v39);

    -[UIImageView bounds](self->_highlightIndicatorView, "bounds");
    CGPathAddRect(v29, 0, v40);
    -[CAShapeLayer setPath:](self->_maskLayer, "setPath:", v29);
    CGPathRelease(v29);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  UIImageView *highlightIndicatorView;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
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
  CGSize result;

  highlightIndicatorView = self->_highlightIndicatorView;
  -[LPContactsBadgeStyle size](self->_style, "size", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v7 = v6;
  if (highlightIndicatorView)
  {
    -[LPContactsBadgeStyle size](self->_style, "size");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "value");
    v10 = v9;
    -[LPContactsBadgeStyle margin](self->_style, "margin");
    v12 = v11;
    -[LPContactsBadgeStyle size](self->_style, "size");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "value");
    v15 = v14;
    -[LPContactsBadgeStyle margin](self->_style, "margin");
    v16 = v7 + v10 * 0.5 + v12 * 2.0 + 2.0;
    v18 = v15 + v17 * 2.0;

  }
  else
  {
    -[LPContactsBadgeStyle margin](self->_style, "margin");
    v20 = v19;
    -[LPContactsBadgeStyle size](self->_style, "size");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "value");
    v22 = v21;
    -[LPContactsBadgeStyle margin](self->_style, "margin");
    v16 = v7 + v20 * 2.0;
    v18 = v22 + v23 * 2.0;
  }

  v24 = v16;
  v25 = v18;
  result.height = v25;
  result.width = v24;
  return result;
}

- (CGRect)layoutExclusionRect
{
  UIImageView *highlightIndicatorView;
  double v4;
  CGFloat x;
  double v6;
  CGFloat y;
  double v8;
  CGFloat width;
  double v10;
  CGFloat height;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v20;

  highlightIndicatorView = self->_highlightIndicatorView;
  -[UIView frame](self->_avatarView, "frame");
  x = v4;
  y = v6;
  width = v8;
  height = v10;
  if (highlightIndicatorView)
  {
    -[UIImageView frame](self->_highlightIndicatorView, "frame");
    v20.origin.x = v12;
    v20.origin.y = v13;
    v20.size.width = v14;
    v20.size.height = v15;
    v16.origin.x = x;
    v16.origin.y = y;
    v16.size.width = width;
    v16.size.height = height;
    v17 = CGRectUnion(v16, v20);
    x = v17.origin.x;
    y = v17.origin.y;
    width = v17.size.width;
    height = v17.size.height;
  }
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  return CGRectInset(v18, -6.0, -6.0);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)LPContactsBadgeView;
  -[LPContactsBadgeView dealloc](&v2, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_storeStrong((id *)&self->_highlightShadowView, 0);
  objc_storeStrong((id *)&self->_highlightIndicatorView, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

@end
