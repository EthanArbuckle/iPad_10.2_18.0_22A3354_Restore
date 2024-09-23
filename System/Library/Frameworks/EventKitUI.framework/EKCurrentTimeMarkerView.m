@implementation EKCurrentTimeMarkerView

- (void)drawRect:(CGRect)a3
{
  void *v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat MinY;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  void *v25;
  double MinX;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  if (self->_showsLine)
  {
    if (self->_showsThumb)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "cuik_todayTimelineColor", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[EKCurrentTimeMarkerView todayWidth](self, "todayWidth", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
      if (v5 != 0.0)
      {
        -[EKCurrentTimeMarkerView _lineFrame](self, "_lineFrame");
        x = v31.origin.x;
        y = v31.origin.y;
        width = v31.size.width;
        height = v31.size.height;
        v13 = CGRectGetHeight(v31);
        v32.origin.x = x;
        v32.origin.y = y;
        v32.size.width = width;
        v32.size.height = height;
        MinY = CGRectGetMinY(v32);
        objc_msgSend(MEMORY[0x1E0DC3658], "cuik_todayTimelineColor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "set");

        -[EKCurrentTimeMarkerView todayStart](self, "todayStart");
        v23 = v22;
        -[EKCurrentTimeMarkerView todayWidth](self, "todayWidth");
        v33.size.width = v24;
        v33.origin.x = v23;
        v33.origin.y = MinY;
        v33.size.height = v13;
        UIRectFill(v33);
        objc_msgSend(MEMORY[0x1E0DC3658], "cuik_nonTodayTimelineColor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "set");

        v34.origin.x = x;
        v34.origin.y = y;
        v34.size.width = width;
        v34.size.height = height;
        MinX = CGRectGetMinX(v34);
        -[EKCurrentTimeMarkerView todayStart](self, "todayStart");
        v35.size.width = v27 - MinX;
        v35.origin.x = MinX;
        v35.origin.y = MinY;
        v35.size.height = v13;
        UIRectFill(v35);
        -[EKCurrentTimeMarkerView todayStart](self, "todayStart");
        v29 = v28;
        -[EKCurrentTimeMarkerView todayWidth](self, "todayWidth");
        v9 = v29 + v30;
        v36.origin.x = x;
        v36.origin.y = y;
        v36.size.width = width;
        v36.size.height = height;
        v7 = CGRectGetMaxX(v36) - v9;
        goto LABEL_8;
      }
      objc_msgSend(MEMORY[0x1E0DC3658], "cuik_nonTodayTimelineColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = v4;
    objc_msgSend(v4, "set");

    -[EKCurrentTimeMarkerView _lineFrame](self, "_lineFrame");
    v9 = v8;
    MinY = v10;
    v13 = v12;
LABEL_8:
    v14 = v9;
    v15 = MinY;
    v16 = v13;
    UIRectFill(*(CGRect *)(&v7 - 2));
  }
}

- (CGRect)_lineFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int IsLeftToRight;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect result;

  -[EKCurrentTimeMarkerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  if (-[EKCurrentTimeMarkerView showsThumb](self, "showsThumb"))
  {
    IsLeftToRight = CalInterfaceIsLeftToRight();
    -[EKCurrentTimeMarkerView markerWidth](self, "markerWidth");
    v11 = 0.0;
    if (!IsLeftToRight)
      v11 = v10;
    v8 = v8 - v11;
    if (IsLeftToRight)
      v4 = v10;
  }
  -[EKCurrentTimeMarkerView extensionLineHeight](self, "extensionLineHeight");
  v13 = v12;
  -[EKCurrentTimeMarkerView bounds](self, "bounds");
  v14 = v6 + (CGRectGetHeight(v18) - v13) * 0.5;
  v15 = v4;
  v16 = v8;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v14;
  result.origin.x = v15;
  return result;
}

- (double)markerWidth
{
  void *v2;
  double v3;
  double v4;

  -[EKCurrentTimeMarkerView currentTimeLabel](self, "currentTimeLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sizeThatFits:", 10.0, 10.0);
  v4 = v3;

  return v4 + 10.0;
}

- (void)updateTime
{
  -[EKCurrentTimeMarkerView _updateTimeWithForce:](self, "_updateTimeWithForce:", 0);
}

- (void)_updateTimeWithForce:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a3;
  -[EKCurrentTimeMarkerView currentTimeLabel](self, "currentTimeLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  CUIKNowDate();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D0BF28];
  objc_msgSend(MEMORY[0x1E0C99E80], "calendarTimeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:timeZone:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!CalInterfaceIsLeftToRight()
    || (objc_msgSend(v9, "isEqualToString:", v14) ? (v10 = !v3) : (v10 = 0), !v10))
  {
    -[EKCurrentTimeMarkerView currentTimeLabel](self, "currentTimeLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v9);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCurrentTimeMarkerView currentTimeLabel](self, "currentTimeLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextColor:", v12);

  }
}

- (UILabel)currentTimeLabel
{
  return self->_currentTimeLabel;
}

- (BOOL)showsThumb
{
  return self->_showsThumb;
}

- (CGRect)currentTimeFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
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
  CGRect result;

  -[UIView frame](self->_timeLabelPill, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[EKCurrentTimeMarkerView superview](self, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCurrentTimeMarkerView convertRect:toView:](self, "convertRect:toView:", v11, v4, v6, v8, v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (void)setShowsThumb:(BOOL)a3
{
  BOOL v5;
  void *v6;

  if (self->_showsThumb != a3)
  {
    v5 = !a3;
    -[UIView setHidden:](self->_timeLabelPill, "setHidden:", !a3);
    if (v5)
    {
      -[EKCurrentTimeMarkerView subviews](self, "subviews");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "makeObjectsPerformSelector:", sel_removeFromSuperview);

    }
    else
    {
      -[EKCurrentTimeMarkerView updateTime](self, "updateTime");
    }
  }
  self->_showsThumb = a3;
}

- (void)setShowsLine:(BOOL)a3
{
  if (self->_showsLine != a3)
  {
    self->_showsLine = a3;
    -[EKCurrentTimeMarkerView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (EKCurrentTimeMarkerView)initWithFrame:(CGRect)a3 sizeClass:(int64_t)a4
{
  EKCurrentTimeMarkerView *v5;
  EKCurrentTimeMarkerView *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIView *v13;
  UIView *timeLabelPill;
  void *v15;
  void *v16;
  UIView *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  UIView *v23;
  void *v24;
  void *v25;
  void *v26;
  UIView *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;
  _QWORD v38[7];

  v38[6] = *MEMORY[0x1E0C80C00];
  v37.receiver = self;
  v37.super_class = (Class)EKCurrentTimeMarkerView;
  v5 = -[EKCurrentTimeMarkerView initWithFrame:](&v37, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    -[EKCurrentTimeMarkerView setOpaque:](v5, "setOpaque:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCurrentTimeMarkerView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[EKCurrentTimeMarkerView setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 0);
    -[EKCurrentTimeMarkerView setShowsLine:](v6, "setShowsLine:", 1);
    -[EKCurrentTimeMarkerView setShowsThumb:](v6, "setShowsThumb:", 0);
    -[EKCurrentTimeMarkerView setTodayStart:](v6, "setTodayStart:", 0.0);
    -[EKCurrentTimeMarkerView setTodayWidth:](v6, "setTodayWidth:", 0.0);
    v8 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    -[EKCurrentTimeMarkerView setCurrentTimeLabel:](v6, "setCurrentTimeLabel:", v8);

    -[EKCurrentTimeMarkerView currentTimeLabel](v6, "currentTimeLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[EKCurrentTimeMarkerView currentTimeLabel](v6, "currentTimeLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextAlignment:", 1);

    objc_msgSend((id)objc_opt_class(), "timeMarkerFontForSizeClass:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCurrentTimeMarkerView currentTimeLabel](v6, "currentTimeLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFont:", v11);

    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    timeLabelPill = v6->_timeLabelPill;
    v6->_timeLabelPill = v13;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v6->_timeLabelPill, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "cuik_todayTimelineColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6->_timeLabelPill, "setBackgroundColor:", v15);

    -[UIView layer](v6->_timeLabelPill, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setCornerRadius:", 6.0);

    -[UIView setClipsToBounds:](v6->_timeLabelPill, "setClipsToBounds:", 1);
    -[UIView setHidden:](v6->_timeLabelPill, "setHidden:", 1);
    v17 = v6->_timeLabelPill;
    -[EKCurrentTimeMarkerView currentTimeLabel](v6, "currentTimeLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v17, "addSubview:", v18);

    -[EKCurrentTimeMarkerView addSubview:](v6, "addSubview:", v6->_timeLabelPill);
    v19 = (void *)MEMORY[0x1E0CB3718];
    -[EKCurrentTimeMarkerView currentTimeLabel](v6, "currentTimeLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v36, 9, 0, v6->_timeLabelPill, 9, 1.0, 0.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v35;
    v20 = (void *)MEMORY[0x1E0CB3718];
    -[EKCurrentTimeMarkerView currentTimeLabel](v6, "currentTimeLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v34, 10, 0, v6->_timeLabelPill, 10, 1.0, 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v21;
    v22 = (void *)MEMORY[0x1E0CB3718];
    v23 = v6->_timeLabelPill;
    -[EKCurrentTimeMarkerView currentTimeLabel](v6, "currentTimeLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v23, 7, 0, v24, 7, 1.0, 10.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v25;
    v26 = (void *)MEMORY[0x1E0CB3718];
    v27 = v6->_timeLabelPill;
    -[EKCurrentTimeMarkerView currentTimeLabel](v6, "currentTimeLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v27, 8, 0, v28, 8, 1.0, 2.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v38[3] = v29;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 10, 0, v6->_timeLabelPill, 10, 1.0, 0.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v38[4] = v30;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 5, 0, v6->_timeLabelPill, 5, 1.0, 0.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v38[5] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 6);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "activateConstraints:", v32);

  }
  return v6;
}

+ (id)timeMarkerFontForSizeClass:(int64_t)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AA0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pointSize");
  v6 = v5;

  CalRoundToScreenScale(v6 * 1.09090909);
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", fmin(v7, 24.0));
}

- (void)setCurrentTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_currentTimeLabel, a3);
}

- (EKCurrentTimeMarkerView)initWithFrame:(CGRect)a3
{
  return -[EKCurrentTimeMarkerView initWithFrame:sizeClass:](self, "initWithFrame:sizeClass:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (double)markerInset
{
  return 5.0;
}

- (double)extensionLineHeight
{
  void *v2;
  _BOOL4 v3;
  double result;

  -[EKCurrentTimeMarkerView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = EKUIUsesLargeTextLayout(v2);

  result = 2.0;
  if (v3)
    return 3.0;
  return result;
}

+ (double)_spacingAdjustmentFontSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double result;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AA0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pointSize");
  v5 = v4;

  CalRoundToScreenScale(v5 * 0.454545455);
  return result;
}

- (void)invalidateFonts
{
  uint64_t v3;
  void *v4;
  void *v5;

  if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(self))
    v3 = 2;
  else
    v3 = 1;
  objc_msgSend((id)objc_opt_class(), "timeMarkerFontForSizeClass:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCurrentTimeMarkerView currentTimeLabel](self, "currentTimeLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  -[EKCurrentTimeMarkerView _updateTimeWithForce:](self, "_updateTimeWithForce:", 1);
}

- (BOOL)showsLine
{
  return self->_showsLine;
}

- (double)todayStart
{
  return self->_todayStart;
}

- (void)setTodayStart:(double)a3
{
  self->_todayStart = a3;
}

- (double)todayWidth
{
  return self->_todayWidth;
}

- (void)setTodayWidth:(double)a3
{
  self->_todayWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTimeLabel, 0);
  objc_storeStrong((id *)&self->_timeLabelPill, 0);
}

@end
