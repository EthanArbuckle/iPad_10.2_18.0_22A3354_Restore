@implementation HUCameraEventReachabilityCell

- (HUCameraEventReachabilityCell)initWithFrame:(CGRect)a3
{
  HUCameraEventReachabilityCell *v3;
  HUCameraEventReachabilityCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUCameraEventReachabilityCell;
  v3 = -[HUCameraEventReachabilityCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[HUCameraEventReachabilityCell setOpaque:](v3, "setOpaque:", 0);
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
  _BOOL4 v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetLineDash(CurrentContext, 2.0, drawRect__lengths, 2uLL);
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLineWidth:", 2.0);
  objc_msgSend(v9, "setLineCapStyle:", 1);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  MidY = CGRectGetMidY(v18);
  objc_msgSend(v9, "moveToPoint:", 0.0, MidY);
  v11 = -[HUCameraEventReachabilityCell needsFullDashedLineWidth](self, "needsFullDashedLineWidth");
  v12 = -9.0;
  if (v11)
    v12 = 1.0;
  objc_msgSend(v9, "addLineToPoint:", width + v12, MidY);
  v16 = 0.0;
  v17 = 0.0;
  v15 = 0.0;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "getRed:green:blue:alpha:", &v17, &v16, &v15, 0);

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v17, v16, v15, 0.35);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setStroke");

  objc_msgSend(v9, "stroke");
}

- (CALayer)badgeLayer
{
  CALayer *badgeLayer;
  CALayer *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  CALayer *v16;

  badgeLayer = self->_badgeLayer;
  if (!badgeLayer)
  {
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v4 = (CALayer *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](v4, "setBackgroundColor:", objc_msgSend(v5, "CGColor"));

    -[CALayer setCornerRadius:](v4, "setCornerRadius:", 9.0);
    -[CALayer setOpaque:](v4, "setOpaque:", 0);
    -[HUCameraEventReachabilityCell layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSublayer:", v4);

    HUImageNamed(CFSTR("CameraEventMarkerCameraOffline"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraEventReachabilityCell bounds](self, "bounds");
    v9 = v8;
    v11 = v10;
    objc_msgSend(v7, "size");
    v13 = v12;
    objc_msgSend(v7, "size");
    -[CALayer setFrame:](v4, "setFrame:", v9 + 18.0, v11 * 0.5 + -9.0, v13, v14);
    v15 = objc_retainAutorelease(v7);
    -[CALayer setContents:](v4, "setContents:", objc_msgSend(v15, "CGImage"));
    -[CALayer setHidden:](v4, "setHidden:", 1);
    v16 = self->_badgeLayer;
    self->_badgeLayer = v4;

    badgeLayer = self->_badgeLayer;
  }
  return badgeLayer;
}

+ (id)backgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.22);
}

- (void)updateWithReachabilityEventContainer:(id)a3 mode:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[HUCameraEventReachabilityCell setDisplayMode:](self, "setDisplayMode:", a4);
  -[HUCameraEventReachabilityCell setReachabilityEvent:](self, "setReachabilityEvent:", v9);
  objc_msgSend(v9, "endEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v9, "endEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraEventReachabilityCell setNeedsFullDashedLineWidth:](self, "setNeedsFullDashedLineWidth:", objc_msgSend(v7, "containerType") == 2);

  }
  else
  {
    -[HUCameraEventReachabilityCell setNeedsFullDashedLineWidth:](self, "setNeedsFullDashedLineWidth:", 1);
  }

  if (!self->_badgeLayer)
  {
    -[HUCameraEventReachabilityCell badgeLayer](self, "badgeLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 0);

  }
  -[HUCameraEventReachabilityCell setNeedsDisplay](self, "setNeedsDisplay");

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (objc_msgSend(MEMORY[0x1E0D319D0], "isInternalInstall"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    -[HUCameraEventReachabilityCell reachabilityEvent](self, "reachabilityEvent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraEventReachabilityCell reachabilityEvent](self, "reachabilityEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateOfOccurrence");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("Reachability Event UUID:%@ Date:%@"), v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HUCameraEventReachabilityCell reachabilityEvent](self, "reachabilityEvent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (unint64_t)displayMode
{
  return self->_displayMode;
}

- (void)setDisplayMode:(unint64_t)a3
{
  self->_displayMode = a3;
}

- (HFCameraScrubberReachabilityEventContainer)reachabilityEvent
{
  return self->_reachabilityEvent;
}

- (void)setReachabilityEvent:(id)a3
{
  objc_storeStrong((id *)&self->_reachabilityEvent, a3);
}

- (void)setBadgeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_badgeLayer, a3);
}

- (BOOL)needsFullDashedLineWidth
{
  return self->_needsFullDashedLineWidth;
}

- (void)setNeedsFullDashedLineWidth:(BOOL)a3
{
  self->_needsFullDashedLineWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeLayer, 0);
  objc_storeStrong((id *)&self->_reachabilityEvent, 0);
}

@end
