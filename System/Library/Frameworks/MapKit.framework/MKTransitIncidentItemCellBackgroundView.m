@implementation MKTransitIncidentItemCellBackgroundView

- (MKTransitIncidentItemCellBackgroundView)initWithFrame:(CGRect)a3
{
  MKTransitIncidentItemCellBackgroundView *v3;
  MKTransitIncidentItemCellBackgroundView *v4;
  void *v5;
  double v6;
  void *v7;
  uint64_t v8;
  double v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MKTransitIncidentItemCellBackgroundView;
  v3 = -[MKTransitIncidentItemCellBackgroundView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MKTransitIncidentItemCellBackgroundView setOpaque:](v3, "setOpaque:", 0);
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nativeScale");
    v4->_scale = v6;

    -[MKTransitIncidentItemCellBackgroundView traitCollection](v4, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");
    v9 = 10.0;
    if (v8 == 5)
      v9 = 8.0;
    v4->_cornerRadius = v9;

  }
  return v4;
}

- (void)setPosition:(int64_t)a3
{
  if (self->_position != a3)
  {
    self->_position = a3;
    -[MKTransitIncidentItemCellBackgroundView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setFillColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;
  char v7;
  UIColor *v8;

  v5 = (UIColor *)a3;
  v6 = v5;
  if (self->_fillColor != v5)
  {
    v8 = v5;
    v7 = -[UIColor isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_fillColor, a3);
      -[MKTransitIncidentItemCellBackgroundView setNeedsDisplay](self, "setNeedsDisplay");
      v6 = v8;
    }
  }

}

- (void)setStrokeColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;
  char v7;
  UIColor *v8;

  v5 = (UIColor *)a3;
  v6 = v5;
  if (self->_strokeColor != v5)
  {
    v8 = v5;
    v7 = -[UIColor isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_strokeColor, a3);
      -[MKTransitIncidentItemCellBackgroundView setNeedsDisplay](self, "setNeedsDisplay");
      v6 = v8;
    }
  }

}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MKTransitIncidentItemCellBackgroundView;
  -[MKTransitIncidentItemCellBackgroundView didMoveToWindow](&v9, sel_didMoveToWindow);
  -[MKTransitIncidentItemCellBackgroundView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "nativeScale");
    self->_scale = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nativeScale");
    self->_scale = v8;

  }
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double cornerRadius;
  double scale;
  double v14;
  void *v15;
  void *v16;
  CGPath *Mutable;
  double MinX;
  double MinY;
  double MaxX;
  CGFloat MaxY;
  CGPath *v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  void *v28;
  void *v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  objc_super v36;
  CGPoint v37;
  CGFloat v38;
  CGFloat v39;
  CGPoint points;
  double v41;
  CGFloat v42;
  uint64_t v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v43 = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)MKTransitIncidentItemCellBackgroundView;
  -[MKTransitIncidentItemCellBackgroundView drawRect:](&v36, sel_drawRect_);
  -[MKTransitIncidentItemCellBackgroundView fillColor](self, "fillColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MKTransitIncidentItemCellBackgroundView fillColor](self, "fillColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFill");

  }
  -[MKTransitIncidentItemCellBackgroundView strokeColor](self, "strokeColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MKTransitIncidentItemCellBackgroundView strokeColor](self, "strokeColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setStroke");

  }
  cornerRadius = self->_cornerRadius;
  scale = self->_scale;
  if (scale == 0.0)
    v14 = 1.0;
  else
    v14 = 1.0 / scale;
  switch(-[MKTransitIncidentItemCellBackgroundView position](self, "position"))
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1, x, y, width, height, cornerRadius, cornerRadius);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setLineWidth:", v14);
      objc_msgSend(v15, "fill");
      -[MKTransitIncidentItemCellBackgroundView strokeColor](self, "strokeColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
        objc_msgSend(v15, "stroke");
      goto LABEL_19;
    case 1:
      objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 3, x, y, width, height, cornerRadius, cornerRadius);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setLineWidth:", v14);
      objc_msgSend(v15, "fill");
      Mutable = CGPathCreateMutable();
      v44.origin.x = x;
      v44.origin.y = y;
      v44.size.width = width;
      v44.size.height = height;
      MinX = CGRectGetMinX(v44);
      v45.origin.x = x;
      v45.origin.y = y;
      v45.size.width = width;
      v45.size.height = height;
      MinY = CGRectGetMinY(v45);
      v46.origin.x = x;
      v46.origin.y = y;
      v46.size.width = width;
      v46.size.height = height;
      MaxX = CGRectGetMaxX(v46);
      v47.origin.x = x;
      v47.origin.y = y;
      v47.size.width = width;
      v47.size.height = height;
      MaxY = CGRectGetMaxY(v47);
      CGPathMoveToPoint(Mutable, 0, MinX, MaxY);
      CGPathAddLineToPoint(Mutable, 0, MinX, MinY + self->_cornerRadius);
      CGPathAddArcToPoint(Mutable, 0, MinX, MinY, MinX + self->_cornerRadius, MinY, self->_cornerRadius);
      CGPathAddLineToPoint(Mutable, 0, MaxX - self->_cornerRadius, MinY);
      CGPathAddArcToPoint(Mutable, 0, MaxX, MinY, MaxX, MinY + self->_cornerRadius, self->_cornerRadius);
      v22 = Mutable;
      v23 = MaxX;
      v24 = MaxY;
      goto LABEL_15;
    case 2:
      objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 0, x, y, width, height, cornerRadius, cornerRadius);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setLineWidth:", v14);
      objc_msgSend(v15, "fill");
      Mutable = CGPathCreateMutable();
      points.x = x;
      points.y = y;
      v48.origin.x = x;
      v48.origin.y = y;
      v48.size.width = width;
      v48.size.height = height;
      v25 = CGRectGetMaxY(v48);
      v41 = x;
      v42 = v25;
      CGPathAddLines(Mutable, 0, &points, 2uLL);
      v49.origin.x = x;
      v49.origin.y = y;
      v49.size.width = width;
      v49.size.height = height;
      v37.x = CGRectGetMaxX(v49);
      v37.y = y;
      v50.origin.x = x;
      v50.origin.y = y;
      v50.size.width = width;
      v50.size.height = height;
      v26 = CGRectGetMaxX(v50);
      v51.origin.x = x;
      v51.origin.y = y;
      v51.size.width = width;
      v51.size.height = height;
      v27 = CGRectGetMaxY(v51);
      v38 = v26;
      v39 = v27;
      CGPathAddLines(Mutable, 0, &v37, 2uLL);
      -[MKTransitIncidentItemCellBackgroundView strokeColor](self, "strokeColor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28)
        goto LABEL_18;
      v29 = (void *)MEMORY[0x1E0CEA390];
      goto LABEL_17;
    case 3:
      objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 12, x, y, width, height, cornerRadius, cornerRadius);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setLineWidth:", v14);
      objc_msgSend(v15, "fill");
      Mutable = CGPathCreateMutable();
      v52.origin.x = x;
      v52.origin.y = y;
      v52.size.width = width;
      v52.size.height = height;
      v30 = CGRectGetMinX(v52);
      v53.origin.x = x;
      v53.origin.y = y;
      v53.size.width = width;
      v53.size.height = height;
      v31 = CGRectGetMinY(v53);
      v54.origin.x = x;
      v54.origin.y = y;
      v54.size.width = width;
      v54.size.height = height;
      v32 = CGRectGetMaxX(v54);
      v55.origin.x = x;
      v55.origin.y = y;
      v55.size.width = width;
      v55.size.height = height;
      v33 = CGRectGetMaxY(v55);
      CGPathMoveToPoint(Mutable, 0, v30, v31);
      CGPathAddLineToPoint(Mutable, 0, v30, v33 - self->_cornerRadius);
      CGPathAddArcToPoint(Mutable, 0, v30, v33, v30 + self->_cornerRadius, v33, self->_cornerRadius);
      CGPathAddLineToPoint(Mutable, 0, v32 - self->_cornerRadius, v33);
      CGPathAddArcToPoint(Mutable, 0, v32, v33, v32, v33 - self->_cornerRadius, self->_cornerRadius);
      v22 = Mutable;
      v23 = v32;
      v24 = v31;
LABEL_15:
      CGPathAddLineToPoint(v22, 0, v23, v24);
      -[MKTransitIncidentItemCellBackgroundView strokeColor](self, "strokeColor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v34)
        goto LABEL_18;
      v29 = (void *)MEMORY[0x1E0CEA390];
LABEL_17:
      objc_msgSend(v29, "bezierPathWithCGPath:", Mutable);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v35, "setLineWidth:", v14);
      objc_msgSend(v35, "stroke");
      v15 = v35;
LABEL_18:
      CGPathRelease(Mutable);
LABEL_19:

      return;
    default:
      return;
  }
}

- (int64_t)position
{
  return self->_position;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
}

@end
