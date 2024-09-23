@implementation SSSScreenshotBorderView

- (SSSScreenshotBorderView)initWithFrame:(CGRect)a3
{
  SSSScreenshotBorderView *v3;
  _SSSAnimatableBorderCornerRadiusView *v4;
  _SSSAnimatableBorderCornerRadiusView *outerHairlineView;
  _SSSAnimatableBorderCornerRadiusView *v6;
  _SSSAnimatableBorderCornerRadiusView *thickBorderView;
  _SSSAnimatableBorderCornerRadiusView *v8;
  _SSSAnimatableBorderCornerRadiusView *innerHairlineView;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SSSScreenshotBorderView;
  v3 = -[SSSScreenshotBorderView initWithFrame:](&v16, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v3->_geometryMultiplier = 1.0;
  v4 = objc_opt_new(_SSSAnimatableBorderCornerRadiusView);
  outerHairlineView = v3->_outerHairlineView;
  v3->_outerHairlineView = v4;

  v6 = objc_opt_new(_SSSAnimatableBorderCornerRadiusView);
  thickBorderView = v3->_thickBorderView;
  v3->_thickBorderView = v6;

  v8 = objc_opt_new(_SSSAnimatableBorderCornerRadiusView);
  innerHairlineView = v3->_innerHairlineView;
  v3->_innerHairlineView = v8;

  v3->_unitRectForContent.origin.x = 0.0;
  v3->_unitRectForContent.origin.y = 0.0;
  __asm { FMOV            V0.2D, #1.0 }
  v3->_unitRectForContent.size = _Q0;
  -[SSSScreenshotBorderView addSubview:](v3, "addSubview:", v3->_outerHairlineView);
  -[SSSScreenshotBorderView addSubview:](v3, "addSubview:", v3->_thickBorderView);
  -[SSSScreenshotBorderView addSubview:](v3, "addSubview:", v3->_innerHairlineView);
  return v3;
}

- (void)layoutSubviews
{
  int64_t v3;
  double x;
  double y;
  double width;
  double height;
  double v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
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
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  __int128 v88;
  __int128 v89;
  uint64_t v90;
  CGRect v91;

  v3 = -[SSSScreenshotBorderView borderStyle](self, "borderStyle");
  -[SSSScreenshotBorderView bounds](self, "bounds");
  x = v91.origin.x;
  y = v91.origin.y;
  width = v91.size.width;
  height = v91.size.height;
  if (!CGRectIsEmpty(v91))
  {
    -[SSSScreenshotBorderView geometryMultiplier](self, "geometryMultiplier");
    v87 = v8;
    v90 = 0;
    v88 = 0u;
    v89 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotBorderView traitCollection](self, "traitCollection"));
    sub_10000FFDC(v9, (uint64_t)&v88);

    v10 = -[SSSScreenshotBorderView unitRectForContent](self, "unitRectForContent");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    if (SSRectIsValid(v10, v19))
    {
      v20 = sub_100010074();
      v84 = *((double *)&v88 + 1);
      v85 = *(double *)&v88;
      v86 = *(double *)&v89;
      v21 = round(v87 * 0.5);
      v22 = width * v12;
      v23 = height * v18;
      v24 = v87 * v20;
      v25 = width + v24 * 2.0;
      v26 = height + v24 * 2.0;
      if (v3 == 1)
        v27 = v26;
      else
        v27 = height;
      if (v3 == 1)
        v28 = v25;
      else
        v28 = width;
      v82 = width * v16 + v21 * 2.0;
      v80 = v23 + v21 * 2.0;
      v74 = v22 - v21;
      v29 = height * v14 - v21;
      v30 = SSRoundRectToScale(x, y, v28 + v87 * 2.0, v27 + v87 * 2.0, v87);
      v76 = v31;
      v78 = v30;
      v67 = v33;
      v68 = v32;
      v34 = SSRoundRectToScale(x, y, v28, v27, v87);
      v36 = v35;
      v69 = v38;
      v71 = v37;
      v39 = SSRoundRectToScale(v74, v29, v82, v80, v87);
      v41 = v40;
      v73 = v43;
      v75 = v42;
      v44 = UIRectCenteredIntegralRect(v78, v76, v68, v67, x, y, width, height);
      v81 = v45;
      v83 = v44;
      v77 = v47;
      v79 = v46;
      v48 = UIRectCenteredIntegralRect(v34, v36, v71, v69, x, y, width, height);
      v50 = v49;
      v70 = v52;
      v72 = v51;
      v53 = UIRectCenteredIntegralRect(v39, v41, v75, v73, x, y, width, height);
      v55 = v54;
      v57 = v56;
      v59 = v58;
      -[_SSSAnimatableBorderCornerRadiusView setFrame:](self->_outerHairlineView, "setFrame:", v83, v81, v79, v77);
      -[_SSSAnimatableBorderCornerRadiusView setFrame:](self->_thickBorderView, "setFrame:", v48, v50, v72, v70);
      -[_SSSAnimatableBorderCornerRadiusView setFrame:](self->_innerHairlineView, "setFrame:", v53, v55, v57, v59);
      if (v3 == 2)
        v60 = 0.0;
      else
        v60 = 1.0;
      -[_SSSAnimatableBorderCornerRadiusView setAlpha:](self->_outerHairlineView, "setAlpha:", v60, *(_QWORD *)&v67, *(_QWORD *)&v68);
      -[_SSSAnimatableBorderCornerRadiusView setAlpha:](self->_thickBorderView, "setAlpha:", v60);
      -[_SSSAnimatableBorderCornerRadiusView setAlpha:](self->_innerHairlineView, "setAlpha:", v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.82, 1.0));
      if (v3 == 1)
        v62 = objc_claimAutoreleasedReturnValue(+[UIColor sss_miniatureBorderColor](UIColor, "sss_miniatureBorderColor"));
      else
        v62 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      v63 = (void *)v62;
      v64 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.65, 1.0));
      -[_SSSAnimatableBorderCornerRadiusView setBackgroundColor:](self->_outerHairlineView, "setBackgroundColor:", v61);
      -[_SSSAnimatableBorderCornerRadiusView setBackgroundColor:](self->_thickBorderView, "setBackgroundColor:", v63);
      -[_SSSAnimatableBorderCornerRadiusView setBackgroundColor:](self->_innerHairlineView, "setBackgroundColor:", v64);
      v65 = UIRoundToViewScale(self, v87 * v86);
      v66 = UIRoundToViewScale(self, v87 * v84);
      -[_SSSAnimatableBorderCornerRadiusView setCornerRadius:](self->_outerHairlineView, "setCornerRadius:", UIRoundToViewScale(self, v87 * v85));
      -[_SSSAnimatableBorderCornerRadiusView setCornerRadius:](self->_thickBorderView, "setCornerRadius:", v66);
      -[_SSSAnimatableBorderCornerRadiusView setCornerRadius:](self->_innerHairlineView, "setCornerRadius:", v65);

    }
  }
}

- (CGRect)extent
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  _SSSAnimatableBorderCornerRadiusView *thickBorderView;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _QWORD v31[3];
  CGRect v32;
  CGRect v33;
  CGRect result;
  CGRect v35;

  -[SSSScreenshotBorderView bounds](self, "bounds");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  thickBorderView = self->_thickBorderView;
  v31[0] = self->_outerHairlineView;
  v31[1] = thickBorderView;
  v31[2] = self->_innerHairlineView;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 3));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v17, "bounds", (_QWORD)v26);
        -[SSSScreenshotBorderView convertRect:fromView:](self, "convertRect:fromView:", v17);
        v35.origin.x = v18;
        v35.origin.y = v19;
        v35.size.width = v20;
        v35.size.height = v21;
        v32.origin.x = x;
        v32.origin.y = y;
        v32.size.width = width;
        v32.size.height = height;
        v33 = CGRectUnion(v32, v35);
        x = v33.origin.x;
        y = v33.origin.y;
        width = v33.size.width;
        height = v33.size.height;
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v14);
  }

  v22 = x;
  v23 = y;
  v24 = width;
  v25 = height;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void)setBorderStyle:(int64_t)a3
{
  if (self->_borderStyle != a3)
  {
    self->_borderStyle = a3;
    -[SSSScreenshotBorderView setNeedsLayout](self, "setNeedsLayout");
    -[SSSScreenshotBorderView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)setGeometryMultiplier:(double)a3
{
  if (self->_geometryMultiplier != a3)
  {
    self->_geometryMultiplier = a3;
    -[SSSScreenshotBorderView setNeedsLayout](self, "setNeedsLayout");
    -[SSSScreenshotBorderView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)setUnitRectForContent:(CGRect)a3
{
  self->_unitRectForContent = a3;
  -[SSSScreenshotBorderView setNeedsLayout](self, "setNeedsLayout");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  id v5;
  SSSScreenshotBorderView *v6;
  SSSScreenshotBorderView *v7;
  SSSScreenshotBorderView *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SSSScreenshotBorderView;
  v5 = -[SSSScreenshotBorderView hitTest:withEvent:](&v10, "hitTest:withEvent:", a4, a3.x, a3.y);
  v6 = (SSSScreenshotBorderView *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v6 == self)
    v8 = 0;
  else
    v8 = v6;

  return v8;
}

- (int64_t)borderStyle
{
  return self->_borderStyle;
}

- (double)geometryMultiplier
{
  return self->_geometryMultiplier;
}

- (CGRect)unitRectForContent
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_unitRectForContent.origin.x;
  y = self->_unitRectForContent.origin.y;
  width = self->_unitRectForContent.size.width;
  height = self->_unitRectForContent.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerHairlineView, 0);
  objc_storeStrong((id *)&self->_thickBorderView, 0);
  objc_storeStrong((id *)&self->_outerHairlineView, 0);
}

@end
