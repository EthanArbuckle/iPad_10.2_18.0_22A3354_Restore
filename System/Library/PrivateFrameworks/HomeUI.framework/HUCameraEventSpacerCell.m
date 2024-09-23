@implementation HUCameraEventSpacerCell

- (HUCameraEventSpacerCell)initWithFrame:(CGRect)a3
{
  HUCameraEventSpacerCell *v3;
  HUCameraEventSpacerCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUCameraEventSpacerCell;
  v3 = -[HUCameraEventSpacerCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[HUCameraEventSpacerCell setOpaque:](v3, "setOpaque:", 0);
  return v4;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  double width;
  CGFloat y;
  CGFloat x;
  CGContext *CurrentContext;
  void *v9;
  double MidY;
  float MidX;
  _BOOL4 v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  CGRect v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetLineDash(CurrentContext, 2.0, drawRect__lengths_0, 2uLL);
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLineWidth:", 2.0);
  objc_msgSend(v9, "setLineCapStyle:", 1);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  MidY = CGRectGetMidY(v21);
  objc_msgSend(v9, "moveToPoint:", 0.0, MidY);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  MidX = CGRectGetMidX(v22);
  if (-[HUCameraEventSpacerCell spansMultipleDays](self, "spansMultipleDays"))
  {
    objc_msgSend(v9, "moveToPoint:", 2.0, MidY);
    objc_msgSend(v9, "addLineToPoint:", MidX + -3.0, MidY);
    objc_msgSend(v9, "moveToPoint:", MidX + 3.0, MidY);
  }
  v12 = -[HUCameraEventSpacerCell needsFullDashedLineWidth](self, "needsFullDashedLineWidth");
  v13 = -9.0;
  if (v12)
    v13 = 1.0;
  objc_msgSend(v9, "addLineToPoint:", width + v13, MidY);
  v19 = 0.0;
  v20 = 0.0;
  v18 = 0.0;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemMidGrayColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "getRed:green:blue:alpha:", &v20, &v19, &v18, 0);

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v20, v19, v18, 0.35);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setStroke");

  objc_msgSend(v9, "stroke");
  if (-[HUCameraEventSpacerCell spansMultipleDays](self, "spansMultipleDays"))
  {
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:cornerRadius:", MidX, 7.0, 1.0, 33.0, 2.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setStroke");

    CGContextSetLineDash(CurrentContext, 0.0, 0, 0);
    objc_msgSend(v16, "stroke");
    v9 = v16;
  }

}

- (void)updateWithRecordingEvent:(id)a3 previousEvent:(id)a4 spanningMultipleDays:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v7;

  v5 = a5;
  v7 = objc_msgSend(a3, "containerType");
  if (-[HUCameraEventSpacerCell spansMultipleDays](self, "spansMultipleDays") != v5
    || (v7 == 2) != -[HUCameraEventSpacerCell needsFullDashedLineWidth](self, "needsFullDashedLineWidth"))
  {
    -[HUCameraEventSpacerCell setSpansMultipleDays:](self, "setSpansMultipleDays:", v5);
    -[HUCameraEventSpacerCell setNeedsFullDashedLineWidth:](self, "setNeedsFullDashedLineWidth:", v7 == 2);
    -[HUCameraEventSpacerCell setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (BOOL)spansMultipleDays
{
  return self->_spansMultipleDays;
}

- (void)setSpansMultipleDays:(BOOL)a3
{
  self->_spansMultipleDays = a3;
}

- (BOOL)needsFullDashedLineWidth
{
  return self->_needsFullDashedLineWidth;
}

- (void)setNeedsFullDashedLineWidth:(BOOL)a3
{
  self->_needsFullDashedLineWidth = a3;
}

@end
