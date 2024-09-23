@implementation GKDebugHighlightView

- (GKDebugHighlightView)init
{
  GKDebugHighlightView *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKDebugHighlightView;
  v2 = -[GKDebugHighlightView init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDebugHighlightView setBackgroundColor:](v2, "setBackgroundColor:", v3);

    -[GKDebugHighlightView setAutoresizingMask:](v2, "setAutoresizingMask:", 0);
    -[GKDebugHighlightView setOpaque:](v2, "setOpaque:", 0);
  }
  return v2;
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  CGContext *CurrentContext;
  void *v15;
  void *v16;
  id v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  -[GKDebugHighlightView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[GKDebugHighlightView color](self, "color");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "colorWithAlphaComponent:", 0.75);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "colorWithAlphaComponent:", 0.25);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setStroke");
  objc_msgSend(v13, "setFill");
  CurrentContext = UIGraphicsGetCurrentContext();
  if (-[GKDebugHighlightView isOval](self, "isOval"))
  {
    v18.origin.x = v5;
    v18.origin.y = v7;
    v18.size.width = v9;
    v18.size.height = v11;
    CGContextStrokeEllipseInRect(CurrentContext, v18);
    v19.origin.x = v5;
    v19.origin.y = v7;
    v19.size.width = v9;
    v19.size.height = v11;
    CGContextFillEllipseInRect(CurrentContext, v19);
  }
  else
  {
    v20.origin.x = v5;
    v20.origin.y = v7;
    v20.size.width = v9;
    v20.size.height = v11;
    CGContextStrokeRect(CurrentContext, v20);
    v21.origin.x = v5;
    v21.origin.y = v7;
    v21.size.width = v9;
    v21.size.height = v11;
    CGContextFillRect(CurrentContext, v21);
  }
  objc_msgSend(v17, "set");
  -[GKDebugHighlightView caption](self, "caption");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 9.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_legacy_drawInRect:withFont:", v16, v5, v7, v9, v11);

}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (NSString)caption
{
  return self->_caption;
}

- (void)setCaption:(id)a3
{
  objc_storeStrong((id *)&self->_caption, a3);
}

- (BOOL)isOval
{
  return self->_isOval;
}

- (void)setIsOval:(BOOL)a3
{
  self->_isOval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
