@implementation NTKDigitalTimeLabelStyle

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NTKDigitalTimeLabelStyle;
  v5 = -[CLKUITimeLabelStyle copyWithZone:](&v9, sel_copyWithZone_);
  -[NTKDigitalTimeLabelStyle layoutRule](self, "layoutRule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setLayoutRule:", v7);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  NTKDigitalTimeLabelStyle *v4;
  void *v5;
  char v6;
  objc_super v8;

  v4 = (NTKDigitalTimeLabelStyle *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKDigitalTimeLabelStyle;
    if (-[CLKUITimeLabelStyle isEqual:](&v8, sel_isEqual_, v4)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[NTKDigitalTimeLabelStyle layoutRule](v4, "layoutRule");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqual:", self->_layoutRule);

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  double v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKDigitalTimeLabelStyle;
  v3 = (double)-[CLKUITimeLabelStyle hash](&v5, sel_hash);
  return (unint64_t)((double)-[NTKLayoutRule hash](self->_layoutRule, "hash") * 1000.0 + v3 * 100.0);
}

+ (id)defaultStyleForBounds:(CGRect)a3 withRightSideMargin:(double)a4 applyAdvanceFudge:(BOOL)a5 forDevice:(id)a6
{
  _BOOL8 v6;
  double height;
  double width;
  double y;
  double x;
  id v13;
  void *v14;
  _OWORD v16[3];
  uint64_t v17;

  v6 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = 0;
  memset(v16, 0, sizeof(v16));
  v13 = a6;
  _LayoutConstants_11(v13, (uint64_t)v16);
  objc_msgSend(a1, "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:forDevice:", v6, v13, x, y, width, height, a4, *(double *)v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)defaultStyleForBounds:(CGRect)a3 withRightSideMargin:(double)a4 applyAdvanceFudge:(BOOL)a5 font:(id)a6 forDevice:(id)a7
{
  _BOOL8 v8;
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  void *v17;
  _OWORD v19[3];
  uint64_t v20;

  v8 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v20 = 0;
  memset(v19, 0, sizeof(v19));
  v15 = a7;
  v16 = a6;
  _LayoutConstants_11(v15, (uint64_t)v19);
  objc_msgSend(a1, "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:", v8, v16, v15, x, y, width, height, a4, *(double *)v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)defaultStyleForBounds:(CGRect)a3 withRightSideMargin:(double)a4 applyAdvanceFudge:(BOOL)a5 withBaselineY:(double)a6 forDevice:(id)a7
{
  _BOOL8 v8;
  double height;
  double width;
  double y;
  double x;
  double v15;
  id v16;
  void *v17;
  void *v18;

  v8 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15 = *MEMORY[0x1E0DC1430];
  v16 = a7;
  objc_msgSend(a1, "_fontForDesign:withWeight:onDevice:", 0, v16, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:", v8, v17, v16, x, y, width, height, a4, a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)defaultRoundedStyleForBounds:(CGRect)a3 withRightSideMargin:(double)a4 applyAdvanceFudge:(BOOL)a5 forDevice:(id)a6
{
  _BOOL8 v6;
  double height;
  double width;
  double y;
  double x;
  uint64_t v13;
  double v14;
  id v15;
  void *v16;
  void *v17;
  _OWORD v19[3];
  uint64_t v20;

  v6 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = *MEMORY[0x1E0C940A8];
  v14 = *MEMORY[0x1E0DC1440];
  v15 = a6;
  objc_msgSend(a1, "_fontForDesign:withWeight:onDevice:", v13, v15, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  memset(v19, 0, sizeof(v19));
  _LayoutConstants_11(v15, (uint64_t)v19);
  objc_msgSend(a1, "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:", v6, v16, v15, x, y, width, height, a4, *(double *)v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)_fontForDesign:(id)a3 withWeight:(double)a4 onDevice:(id)a5
{
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v11 = 0;
  v9 = 0u;
  v10 = 0u;
  v8 = 0u;
  _LayoutConstants_11(a5, (uint64_t)&v8);
  if (a3)
    objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:design:", *MEMORY[0x1E0C940A8], *((double *)&v9 + 1), a4);
  else
    objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:", *((double *)&v9 + 1), a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)defaultStyleForBounds:(CGRect)a3 withRightSideMargin:(double)a4 applyAdvanceFudge:(BOOL)a5 withBaselineY:(double)a6 withFont:(id)a7 forDevice:(id)a8
{
  _BOOL4 v10;
  CGFloat height;
  CGFloat width;
  double y;
  CGFloat x;
  id v16;
  id v17;
  NTKDigitalTimeLabelStyle *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  CGFloat v24;
  double v25;
  _OWORD v27[3];
  uint64_t v28;
  CGRect v29;

  v10 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = a7;
  v17 = a8;
  v18 = objc_alloc_init(NTKDigitalTimeLabelStyle);
  -[CLKUITimeLabelStyle setThreeDigitFont:](v18, "setThreeDigitFont:", v16);
  -[CLKUITimeLabelStyle setFourDigitFont:](v18, "setFourDigitFont:", v16);
  -[CLKUITimeLabelStyle setDesignatorFont:](v18, "setDesignatorFont:", v16);
  objc_msgSend(v16, "lineHeight");
  v20 = v19;
  objc_msgSend(v16, "descender");
  v22 = v21;
  if (v10)
  {
    v28 = 0;
    memset(v27, 0, sizeof(v27));
    _LayoutConstants_11(v17, (uint64_t)v27);
    a4 = a4 - *((double *)v27 + 1);
  }
  v23 = -[NTKLayoutRule initForDevice:]([NTKLayoutRule alloc], "initForDevice:", v17);
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  v24 = CGRectGetWidth(v29) - a4;
  objc_msgSend(v16, "lineHeight");
  objc_msgSend(v23, "setReferenceFrame:", 0.0, y + a6 - (v20 + v22), v24, v25);
  objc_msgSend(v23, "setHorizontalLayout:", 2);
  objc_msgSend(v23, "setVerticalLayout:", 0);
  -[NTKDigitalTimeLabelStyle setLayoutRule:](v18, "setLayoutRule:", v23);

  return v18;
}

+ (id)smallInUpperRightCornerStyleForBounds:(CGRect)a3 weight:(double)a4 forDevice:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v18 = 0;
  v16 = 0u;
  v17 = 0u;
  v15 = 0u;
  v11 = a5;
  _LayoutConstants_11(v11, (uint64_t)&v15);
  objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:", *(double *)&v17, a4, v15, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "smallInUpperRightCornerStyleForBounds:withFont:forDevice:", v12, v11, x, y, width, height);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)smallInUpperRightCornerStyleForBounds:(CGRect)a3 forDevice:(id)a4
{
  return (id)objc_msgSend(a1, "smallInUpperRightCornerStyleForBounds:weight:forDevice:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, *MEMORY[0x1E0DC1430]);
}

+ (id)smallInUpperRightCornerStyleForBounds:(CGRect)a3 withFont:(id)a4 forDevice:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  void *v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a5;
  v12 = a4;
  objc_msgSend(v12, "lineHeight");
  v14 = v13;
  objc_msgSend(v12, "descender");
  objc_msgSend(a1, "smallInUpperRightCornerStyleForBounds:withBaselineY:withFont:forDevice:", v12, v11, x, y, width, height, v14 + v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)smallInUpperRightCornerStyleForBounds:(CGRect)a3 withBaselineY:(double)a4 withFont:(id)a5 forDevice:(id)a6
{
  CGFloat height;
  CGFloat width;
  double y;
  CGFloat x;
  id v12;
  id v13;
  NTKDigitalTimeLabelStyle *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  CGFloat v21;
  double v22;
  double v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  CGRect v29;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a6;
  v13 = a5;
  v14 = objc_alloc_init(NTKDigitalTimeLabelStyle);
  -[CLKUITimeLabelStyle setThreeDigitFont:](v14, "setThreeDigitFont:", v13);
  -[CLKUITimeLabelStyle setFourDigitFont:](v14, "setFourDigitFont:", v13);
  -[CLKUITimeLabelStyle setDesignatorFont:](v14, "setDesignatorFont:", v13);
  v28 = 0;
  v26 = 0u;
  v27 = 0u;
  v25 = 0u;
  _LayoutConstants_11(v12, (uint64_t)&v25);
  v15 = *(double *)&v26 + *((double *)&v27 + 1);
  objc_msgSend(v13, "lineHeight");
  v17 = v16;
  objc_msgSend(v13, "descender");
  v19 = a4 - (v17 + v18);
  v20 = -[NTKLayoutRule initForDevice:]([NTKLayoutRule alloc], "initForDevice:", v12);

  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  v21 = CGRectGetWidth(v29) + -3.0;
  objc_msgSend(v13, "lineHeight");
  v23 = v22;

  objc_msgSend(v20, "setReferenceFrame:", 0.0, v15 + y + v19, v21, v23);
  objc_msgSend(v20, "setHorizontalLayout:", 2);
  objc_msgSend(v20, "setVerticalLayout:", 0);
  -[NTKDigitalTimeLabelStyle setLayoutRule:](v14, "setLayoutRule:", v20);

  return v14;
}

- (NTKLayoutRule)layoutRule
{
  return self->_layoutRule;
}

- (void)setLayoutRule:(id)a3
{
  objc_storeStrong((id *)&self->_layoutRule, a3);
}

- (NSNumber)tracking
{
  return self->_tracking;
}

- (void)setTracking:(id)a3
{
  objc_storeStrong((id *)&self->_tracking, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracking, 0);
  objc_storeStrong((id *)&self->_layoutRule, 0);
}

@end
