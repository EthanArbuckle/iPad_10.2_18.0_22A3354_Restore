@implementation AFUIASPCoverView

+ (double)screenScale
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  return v4;
}

+ (id)coverForeground:(BOOL)a3 withFrame:(CGRect)a4 isRightToLeft:(BOOL)a5 withTextWidth:(double)a6
{
  _BOOL8 v7;
  double height;
  double width;
  double y;
  double x;
  _BOOL4 v12;
  id v13;
  void *v14;

  v7 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3;
  v13 = objc_alloc((Class)a1);
  if (v12)
    v14 = (void *)objc_msgSend(v13, "initCoverViewWithFrame:isRightToLeft:withTextWidth:", v7, x, y, width, height, a6);
  else
    v14 = (void *)objc_msgSend(v13, "initCoverBackgroundViewWithFrame:isRightToLeft:", v7, x, y, width, height);
  return v14;
}

- (id)initCoverBackgroundViewWithFrame:(CGRect)a3 isRightToLeft:(BOOL)a4
{
  AFUIASPCoverView *v4;
  AFUIASPCoverView *v5;
  id v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AFUIASPCoverView;
  v4 = -[AFUIASPCoverView initWithFrame:](&v10, sel_initWithFrame_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    -[AFUIASPCoverView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    objc_msgSend((id)objc_opt_class(), "ASPCoverViewColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = objc_msgSend(v6, "CGColor");
    -[AFUIASPCoverView layer](v5, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v7);

  }
  return v5;
}

- (id)initCoverViewWithFrame:(CGRect)a3 isRightToLeft:(BOOL)a4 withTextWidth:(double)a5
{
  _BOOL4 v6;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  AFUIASPCoverView *v11;
  id *p_isa;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  id v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  double v46;
  void *v47;
  void *v48;
  double v50;
  objc_super v51;
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[3];
  CGRect v55;
  CGRect v56;
  CGRect v57;

  v6 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v54[2] = *MEMORY[0x24BDAC8D0];
  v51.receiver = self;
  v51.super_class = (Class)AFUIASPCoverView;
  v11 = -[AFUIASPCoverView initWithFrame:](&v51, sel_initWithFrame_);
  p_isa = (id *)&v11->super.super.super.isa;
  if (v11)
  {
    -[AFUIASPCoverView setUserInteractionEnabled:](v11, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = objc_msgSend(v13, "CGColor");
    objc_msgSend(p_isa, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v14);

    objc_msgSend(MEMORY[0x24BDE56B8], "layer");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = p_isa[52];
    p_isa[52] = (id)v16;

    objc_msgSend((id)objc_opt_class(), "screenScale");
    if (v18 == 3.0)
      v19 = 4.0;
    else
      v19 = 6.0;
    objc_msgSend(p_isa, "bounds");
    v50 = v19;
    v21 = v20 - v19;
    objc_msgSend(p_isa, "bounds");
    objc_msgSend(p_isa[52], "setFrame:", 0.0, 0.0, v21);
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.980392157, 1.0, 0.741176471, 0.0);
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v54[0] = objc_msgSend(v22, "CGColor");
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.980392157, 1.0, 0.741176471, 1.0);
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v54[1] = objc_msgSend(v23, "CGColor");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(p_isa[52], "setColors:", v24);
    objc_msgSend(p_isa[52], "frame");
    v25 = CGRectGetWidth(v55);
    v26 = 0.45;
    if (v25 * 0.45 <= a5)
    {
      v27 = 0.1;
    }
    else
    {
      v27 = a5 * 0.1 / v25;
      v26 = a5 * 0.65 / v25;
    }
    v28 = 1.0 - v27;
    if (!v6)
      v28 = v27;
    v29 = 1.0 - v26;
    if (v6)
      v30 = 1.0 - v26;
    else
      v30 = v26;
    objc_msgSend(p_isa[52], "setStartPoint:", v28, 0.0);
    objc_msgSend(p_isa[52], "setEndPoint:", v30, 0.0);
    objc_msgSend(p_isa, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addSublayer:", p_isa[52]);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("Strong Password"), CFSTR("Automatic Strong Password cover view text"), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD5E0], "systemFontOfSize:weight:", 14.0, *MEMORY[0x24BEBE260]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = *MEMORY[0x24BEBD270];
    v53[0] = v34;
    v36 = *MEMORY[0x24BEBD278];
    v52[0] = v35;
    v52[1] = v36;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.8);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v53[1] = v37;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "sizeWithAttributes:", v38);
    v40 = v39;
    objc_msgSend(p_isa[52], "frame");
    v41 = v29 * CGRectGetWidth(v56);
    if (v40 < v41)
    {
      v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v33, v38);
      v57.origin.x = x;
      v57.origin.y = y;
      v57.size.width = width;
      v57.size.height = height;
      v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", 0.0, 0.0, v41, CGRectGetHeight(v57));
      objc_msgSend(v43, "setUserInteractionEnabled:", 0);
      objc_msgSend(v43, "setAttributedText:", v42);
      objc_msgSend(v43, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(p_isa, "addSubview:", v43);
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        v45 = 1;
      else
        v45 = 2;
      v46 = -v50;
      if (v6)
        v46 = (double)v6;
      objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v43, v45, 0, p_isa, v45, 1.0, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "addObject:", v47);

      objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v43, 10, 0, p_isa, 10, 1.0, 0.0);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "addObject:", v48);

      objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v44);
    }

  }
  return p_isa;
}

+ (id)ASPCoverViewColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.980392157, 1.0, 0.741176471, 1.0);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AFUIASPCoverView;
  -[AFUIASPCoverView layoutSubviews](&v10, sel_layoutSubviews);
  objc_msgSend((id)objc_opt_class(), "screenScale");
  if (v3 == 3.0)
    v4 = 4.0;
  else
    v4 = 6.0;
  -[AFUIASPCoverView bounds](self, "bounds");
  v6 = v5 - v4;
  -[AFUIASPCoverView bounds](self, "bounds");
  v8 = v7;
  -[AFUIASPCoverView gradientLayer](self, "gradientLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFrame:", 0.0, 0.0, v6, v8);

}

- (CAGradientLayer)gradientLayer
{
  return self->_gradientLayer;
}

- (void)setGradientLayer:(id)a3
{
  objc_storeStrong((id *)&self->_gradientLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientLayer, 0);
}

@end
