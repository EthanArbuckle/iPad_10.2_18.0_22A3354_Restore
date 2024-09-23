@implementation ASCBorderView

- (ASCBorderView)initWithFrame:(CGRect)a3
{
  ASCBorderView *v3;
  uint64_t v4;
  UIColor *color;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ASCBorderView;
  v3 = -[ASCBorderView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = objc_claimAutoreleasedReturnValue();
    color = v3->_color;
    v3->_color = (UIColor *)v4;

    -[ASCBorderView updateBorderColor](v3, "updateBorderColor");
    objc_msgSend(MEMORY[0x1E0DC3E88], "systemTraitsAffectingColorAppearance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)-[ASCBorderView registerForTraitChanges:withAction:](v3, "registerForTraitChanges:withAction:", v6, sel_updateBorderColor);

  }
  return v3;
}

- (ASCBorderView)initWithCoder:(id)a3
{
  -[ASCBorderView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  -[ASCBorderView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
  -[ASCBorderView updateBorderColor](self, "updateBorderColor");
}

- (double)width
{
  void *v2;
  double v3;
  double v4;

  -[ASCBorderView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "borderWidth");
  v4 = v3;

  return v4;
}

- (void)setWidth:(double)a3
{
  id v4;

  -[ASCBorderView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBorderWidth:", a3);

}

- (double)cornerRadius
{
  void *v2;
  double v3;
  double v4;

  -[ASCBorderView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cornerRadius");
  v4 = v3;

  return v4;
}

- (void)setCornerRadius:(double)a3
{
  id v4;

  -[ASCBorderView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", a3);

}

- (NSString)cornerCurve
{
  void *v2;
  void *v3;

  -[ASCBorderView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cornerCurve");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setCornerCurve:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASCBorderView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerCurve:", v4);

}

- (unint64_t)cornerMask
{
  void *v2;
  unint64_t v3;

  -[ASCBorderView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maskedCorners");

  return v3;
}

- (void)setCornerMask:(unint64_t)a3
{
  id v4;

  -[ASCBorderView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaskedCorners:", a3);

}

- (void)updateBorderColor
{
  uint64_t v3;
  void *v4;
  id v5;

  -[ASCBorderView color](self, "color");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = objc_msgSend(v5, "CGColor");
  -[ASCBorderView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBorderColor:", v3);

}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
