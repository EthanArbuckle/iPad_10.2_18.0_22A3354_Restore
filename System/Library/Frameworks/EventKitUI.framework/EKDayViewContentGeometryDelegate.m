@implementation EKDayViewContentGeometryDelegate

- (BOOL)originIsUpperLeft
{
  return 1;
}

- (BOOL)shouldReverseLayoutDirection
{
  return CalTimeDirectionIsLeftToRight() ^ 1;
}

- (double)dateForPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  double v6;
  double v7;

  y = a3.y;
  x = a3.x;
  -[EKDayViewContentGeometryDelegate dayViewContent](self, "dayViewContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateForPoint:", x, y);
  v7 = v6;

  return v7;
}

- (CGPoint)pointForDate:(double)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  -[EKDayViewContentGeometryDelegate dayViewContent](self, "dayViewContent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pointForDate:", a3);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (double)timeWidth
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[EKDayViewContentGeometryDelegate dayViewContent](self, "dayViewContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "grid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeWidth");
  v5 = v4;

  return v5;
}

- (double)hourHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[EKDayViewContentGeometryDelegate dayViewContent](self, "dayViewContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "grid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hourHeight");
  v5 = v4;

  return v5;
}

- (double)topPadding
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[EKDayViewContentGeometryDelegate dayViewContent](self, "dayViewContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "grid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topPadding");
  v5 = v4;

  return v5;
}

- (EKDayViewContent)dayViewContent
{
  return (EKDayViewContent *)objc_loadWeakRetained((id *)&self->_dayViewContent);
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setDayViewContent:(id)a3
{
  objc_storeWeak((id *)&self->_dayViewContent, a3);
}

- (CGRect)displayedRect
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[EKDayViewContentGeometryDelegate dayViewContent](self, "dayViewContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayViewContentGeometryDelegate frame](self, "frame");
  objc_msgSend(v3, "_occurrencePaddingBetweenDays:");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v14;
  CGRect v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v14.receiver = self;
  v14.super_class = (Class)EKDayViewContentGeometryDelegate;
  -[EKDayViewContentGeometryDelegate description](&v14, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayViewContentGeometryDelegate hourHeight](self, "hourHeight");
  v6 = v5;
  -[EKDayViewContentGeometryDelegate topPadding](self, "topPadding");
  v8 = v7;
  -[EKDayViewContentGeometryDelegate timeWidth](self, "timeWidth");
  v10 = v9;
  -[EKDayViewContentGeometryDelegate displayedRect](self, "displayedRect");
  NSStringFromCGRect(v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %f %f %f %@"), v4, v6, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dayViewContent);
}

@end
