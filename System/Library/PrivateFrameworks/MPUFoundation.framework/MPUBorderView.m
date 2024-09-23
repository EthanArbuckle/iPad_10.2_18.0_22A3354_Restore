@implementation MPUBorderView

+ (double)requiredOutsetForDropShadow
{
  return 1.0;
}

- (MPUBorderView)initWithFrame:(CGRect)a3
{
  MPUBorderView *v3;
  MPUBorderView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPUBorderView;
  v3 = -[MPUBorderView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_hidesWhenFullyTransparent = 1;
    -[MPUBorderView setOpaque:](v3, "setOpaque:", 0);
    -[MPUBorderView setBackgroundColor:](v4, "setBackgroundColor:", 0);
    -[MPUBorderView setContentMode:](v4, "setContentMode:", 3);
  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[MPUBorderView requiredOutsetForDropShadow](self, "requiredOutsetForDropShadow", a3.width, a3.height);
  v5 = v4 + v4;
  -[MPUBorderConfiguration borderWidth](self->_borderConfiguration, "borderWidth");
  v7 = v5 + v6 * 2.0 + 1.0;
  v8 = v7;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setBorderConfiguration:(id)a3
{
  MPUBorderConfiguration *v4;
  MPUBorderConfiguration *borderConfiguration;
  BOOL v6;
  MPUBorderConfiguration *v7;
  MPUBorderConfiguration *v8;
  _BOOL8 v9;
  MPUBorderConfiguration *v10;

  v4 = (MPUBorderConfiguration *)a3;
  borderConfiguration = self->_borderConfiguration;
  if (borderConfiguration != v4)
  {
    v10 = v4;
    v6 = -[MPUBorderConfiguration isEqual:](borderConfiguration, "isEqual:", v4);
    v4 = v10;
    if (!v6)
    {
      v7 = (MPUBorderConfiguration *)-[MPUBorderConfiguration copy](v10, "copy");
      v8 = self->_borderConfiguration;
      self->_borderConfiguration = v7;

      if (!self->_hidesWhenFullyTransparent
        || (v9 = -[MPUBorderConfiguration isFullyTransparent](self->_borderConfiguration, "isFullyTransparent"),
            -[MPUBorderView setHidden:](self, "setHidden:", v9),
            v4 = v10,
            !v9))
      {
        -[MPUBorderView setNeedsDisplay](self, "setNeedsDisplay");
        v4 = v10;
      }
    }
  }

}

- (double)requiredOutsetForDropShadow
{
  double result;

  objc_msgSend((id)objc_opt_class(), "requiredOutsetForDropShadow");
  return result;
}

- (UIEdgeInsets)resizableImageCapInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIEdgeInsets result;

  -[MPUBorderView requiredOutsetForDropShadow](self, "requiredOutsetForDropShadow");
  v4 = v3;
  -[MPUBorderConfiguration borderWidth](self->_borderConfiguration, "borderWidth");
  v6 = v4 + v5;
  v7 = v6;
  v8 = v6;
  v9 = v6;
  result.right = v9;
  result.bottom = v8;
  result.left = v7;
  result.top = v6;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  CGFloat v5;
  double x;
  double y;
  double width;
  double height;
  double v10;
  CGFloat v11;
  double v12;
  BOOL v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  BOOL v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  unint64_t v29;
  BOOL v30;
  char v33;
  void *v34;
  double MinX;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat MaxY;
  double v45;
  double v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat MaxX;
  CGFloat MinY;
  id v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  -[MPUBorderView requiredOutsetForDropShadow](self, "requiredOutsetForDropShadow", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  -[MPUBorderView bounds](self, "bounds");
  v53 = CGRectInset(v52, v5, v5);
  x = v53.origin.x;
  y = v53.origin.y;
  width = v53.size.width;
  height = v53.size.height;
  -[MPUBorderConfiguration borderWidth](self->_borderConfiguration, "borderWidth");
  v11 = v10;
  -[MPUBorderConfiguration fillColor](self->_borderConfiguration, "fillColor");
  v51 = (id)objc_claimAutoreleasedReturnValue();
  -[MPUBorderConfiguration fillAlpha](self->_borderConfiguration, "fillAlpha");
  if (v51)
    v13 = v12 <= 0.00000011920929;
  else
    v13 = 1;
  if (!v13)
  {
    objc_msgSend(v51, "colorWithAlphaComponent:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFill");

    v54.origin.x = x;
    v54.origin.y = y;
    v54.size.width = width;
    v54.size.height = height;
    v55 = CGRectInset(v54, v11, v11);
    UIRectFillUsingBlendMode(v55, kCGBlendModeNormal);
  }
  -[MPUBorderConfiguration borderColor](self->_borderConfiguration, "borderColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPUBorderConfiguration borderAlpha](self->_borderConfiguration, "borderAlpha");
  v17 = v16;
  if (v15)
    v18 = v11 <= 0.00000011920929;
  else
    v18 = 1;
  if (!v18 && v16 > 0.00000011920929)
  {
    objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRect:", x, y, width, height);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x24BDF6870];
    v56.origin.x = x;
    v56.origin.y = y;
    v56.size.width = width;
    v56.size.height = height;
    v57 = CGRectInset(v56, v11, v11);
    objc_msgSend(v21, "bezierPathWithRect:", v57.origin.x, v57.origin.y, v57.size.width, v57.size.height);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "appendPath:", v22);

    objc_msgSend(v20, "setUsesEvenOddFillRule:", 1);
    objc_msgSend(v15, "colorWithAlphaComponent:", v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFill");

    objc_msgSend(v20, "fillWithBlendMode:alpha:", 0, 1.0);
  }
  -[MPUBorderConfiguration dropShadowColor](self->_borderConfiguration, "dropShadowColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPUBorderConfiguration dropShadowAlpha](self->_borderConfiguration, "dropShadowAlpha");
  v26 = v25;
  -[MPUBorderConfiguration dropShadowWidth](self->_borderConfiguration, "dropShadowWidth");
  v28 = v27;
  v29 = -[MPUBorderConfiguration dropShadowEdges](self->_borderConfiguration, "dropShadowEdges");
  if (v24)
    v30 = v28 <= 0.00000011920929;
  else
    v30 = 1;
  if (!v30 && v26 > 0.00000011920929 && v29 != 0)
  {
    v33 = v29;
    objc_msgSend(v24, "colorWithAlphaComponent:", v26);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setFill");

    if ((v33 & 1) != 0)
    {
      v58.origin.x = x;
      v58.origin.y = y;
      v58.size.width = width;
      v58.size.height = height;
      MinX = CGRectGetMinX(v58);
      if ((v33 & 2) != 0)
        v36 = v28;
      else
        v36 = 0.0;
      v37 = MinX - v36;
      v59.origin.x = x;
      v59.origin.y = y;
      v59.size.width = width;
      v59.size.height = height;
      v38 = CGRectGetMinY(v59) - v28;
      v60.origin.x = x;
      v60.origin.y = y;
      v60.size.width = width;
      v60.size.height = height;
      v39 = v36 + CGRectGetWidth(v60);
      v40 = 0.0;
      if ((v33 & 8) != 0)
        v40 = v28;
      v61.size.width = v40 + v39;
      v61.origin.x = v37;
      v61.origin.y = v38;
      v61.size.height = v28;
      UIRectFillUsingBlendMode(v61, kCGBlendModeNormal);
    }
    if ((v33 & 4) != 0)
    {
      v62.origin.x = x;
      v62.origin.y = y;
      v62.size.width = width;
      v62.size.height = height;
      v41 = CGRectGetMinX(v62);
      if ((v33 & 2) != 0)
        v42 = v28;
      else
        v42 = 0.0;
      v43 = v41 - v42;
      v63.origin.x = x;
      v63.origin.y = y;
      v63.size.width = width;
      v63.size.height = height;
      MaxY = CGRectGetMaxY(v63);
      v64.origin.x = x;
      v64.origin.y = y;
      v64.size.width = width;
      v64.size.height = height;
      v45 = v42 + CGRectGetWidth(v64);
      v46 = 0.0;
      if ((v33 & 8) != 0)
        v46 = v28;
      v65.size.width = v46 + v45;
      v65.origin.x = v43;
      v65.origin.y = MaxY;
      v65.size.height = v28;
      UIRectFillUsingBlendMode(v65, kCGBlendModeNormal);
      if ((v33 & 2) == 0)
        goto LABEL_41;
    }
    else if ((v33 & 2) == 0)
    {
LABEL_41:
      if ((v33 & 8) != 0)
      {
        v70.origin.x = x;
        v70.origin.y = y;
        v70.size.width = width;
        v70.size.height = height;
        MaxX = CGRectGetMaxX(v70);
        v71.origin.x = x;
        v71.origin.y = y;
        v71.size.width = width;
        v71.size.height = height;
        MinY = CGRectGetMinY(v71);
        v72.origin.x = x;
        v72.origin.y = y;
        v72.size.width = width;
        v72.size.height = height;
        v73.size.height = CGRectGetHeight(v72);
        v73.origin.x = MaxX;
        v73.origin.y = MinY;
        v73.size.width = v28;
        UIRectFillUsingBlendMode(v73, kCGBlendModeNormal);
      }
      goto LABEL_43;
    }
    v66.origin.x = x;
    v66.origin.y = y;
    v66.size.width = width;
    v66.size.height = height;
    v47 = CGRectGetMinX(v66) - v28;
    v67.origin.x = x;
    v67.origin.y = y;
    v67.size.width = width;
    v67.size.height = height;
    v48 = CGRectGetMinY(v67);
    v68.origin.x = x;
    v68.origin.y = y;
    v68.size.width = width;
    v68.size.height = height;
    v69.size.height = CGRectGetHeight(v68);
    v69.origin.x = v47;
    v69.origin.y = v48;
    v69.size.width = v28;
    UIRectFillUsingBlendMode(v69, kCGBlendModeNormal);
    goto LABEL_41;
  }
LABEL_43:

}

- (MPUBorderConfiguration)borderConfiguration
{
  return self->_borderConfiguration;
}

- (BOOL)hidesWhenFullyTransparent
{
  return self->_hidesWhenFullyTransparent;
}

- (void)setHidesWhenFullyTransparent:(BOOL)a3
{
  self->_hidesWhenFullyTransparent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderConfiguration, 0);
}

@end
