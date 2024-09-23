@implementation MTStaticColorPillView

- (MTStaticColorPillView)initWithFrame:(CGRect)a3 settings:(id)a4
{
  MTStaticColorPillView *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v10;
  CGSize v11;
  CGRect v12;

  v10.receiver = self;
  v10.super_class = (Class)MTStaticColorPillView;
  v4 = -[MTPillView initWithFrame:settings:](&v10, sel_initWithFrame_settings_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    v11.width = 1.0;
    v11.height = 1.0;
    UIGraphicsBeginImageContextWithOptions(v11, 1, 1.0);
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFill");

    v12.origin.x = 0.0;
    v12.origin.y = 0.0;
    v12.size.width = 1.0;
    v12.size.height = 1.0;
    UIRectFill(v12);
    UIGraphicsGetImageFromCurrentImageContext();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    -[MTStaticColorPillView layer](v4, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_retainAutorelease(v6);
    objc_msgSend(v7, "setContents:", objc_msgSend(v8, "CGImage"));

  }
  return v4;
}

- (id)backgroundColor:(id)a3
{
  void *v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTStaticColorPillView.m"), 34, CFSTR("cannot call %s use pillColor instead"), "-[MTStaticColorPillView backgroundColor:]");

  v7.receiver = self;
  v7.super_class = (Class)MTStaticColorPillView;
  -[MTStaticColorPillView backgroundColor](&v7, sel_backgroundColor);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setBackgroundColor:(id)a3
{
  void *v5;
  void *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTStaticColorPillView.m"), 39, CFSTR("cannot call %s use setPillColor: instead"), "-[MTStaticColorPillView setBackgroundColor:]");

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)MTStaticColorPillView;
  -[MTStaticColorPillView setBackgroundColor:](&v7, sel_setBackgroundColor_, v6);

}

- (void)setPillColor:(id)a3
{
  UIColor *v5;
  UIColor **p_pillColor;
  void *v7;
  UIColor *v8;

  v5 = (UIColor *)a3;
  p_pillColor = &self->_pillColor;
  if (self->_pillColor != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_pillColor, a3);
    -[MTStaticColorPillView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContentsMultiplyColor:", -[UIColor CGColor](*p_pillColor, "CGColor"));

    v5 = v8;
  }

}

- (UIColor)pillColor
{
  return self->_pillColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pillColor, 0);
}

@end
