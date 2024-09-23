@implementation HUClipScrubberPlayheadView

- (HUClipScrubberPlayheadView)initWithFrame:(CGRect)a3
{
  HUClipScrubberPlayheadView *v3;
  HUClipScrubberPlayheadView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUClipScrubberPlayheadView;
  v3 = -[HUClipScrubberPlayheadView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[HUClipScrubberPlayheadView setOpaque:](v3, "setOpaque:", 0);
    -[HUClipScrubberPlayheadView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    -[HUClipScrubberPlayheadView setAutoresizingMask:](v4, "setAutoresizingMask:", 5);
  }
  return v4;
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CGContext *CurrentContext;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect v20;

  height = a3.size.height;
  width = a3.size.width;
  v17 = 0.0;
  v18 = 0.0;
  v16 = 0.0;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor", a3.origin.x, a3.origin.y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getRed:green:blue:alpha:", &v18, &v17, &v16, 0);

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v18, v17, v16, 0.4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFill");
  if (-[HUClipScrubberPlayheadView drawsUpperContent](self, "drawsUpperContent"))
  {
    objc_msgSend(v7, "setStroke");
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v18, v17, v16, 0.08);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFill");
    objc_msgSend(v8, "setStroke");
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRect:", 0.0, 8.0, width, 6.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fill");
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(CurrentContext, 2.0);
    v19.origin.x = 0.0;
    v19.origin.y = 8.0;
    v19.size.height = 6.0;
    v19.size.width = width;
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 3, CGRectGetMidX(v19) + -2.0, 0.0, 4.0, height, 4.0, 4.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFill");

    objc_msgSend(v11, "fill");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRect:", 0.0, 14.0, width, 47.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fill");
    v20.origin.x = 0.0;
    v20.origin.y = 14.0;
    v20.size.width = width;
    v20.size.height = 47.0;
    v13 = CGRectGetMidX(v20) + -2.0;
    if (-[HUClipScrubberPlayheadView editing](self, "editing"))
      v14 = 12.0;
    else
      v14 = 14.0;
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRect:", v13, v14, 4.0, height);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFill");

    objc_msgSend(v9, "fill");
  }

}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    -[HUClipScrubberPlayheadView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (BOOL)drawsUpperContent
{
  return self->_drawsUpperContent;
}

- (void)setDrawsUpperContent:(BOOL)a3
{
  self->_drawsUpperContent = a3;
}

- (BOOL)editing
{
  return self->_editing;
}

@end
