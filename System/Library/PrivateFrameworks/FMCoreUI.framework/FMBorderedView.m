@implementation FMBorderedView

- (void)setBorderWidth:(double)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  id v10;

  if (a3 >= 0.0)
  {
    v7 = a3;
    -[FMBorderedView setHairlineBorder:](self, "setHairlineBorder:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scale");
    v6 = v5;

    -[FMBorderedView setHairlineBorder:](self, "setHairlineBorder:", 1);
    if (v6 <= 1.0)
    {
      -[FMBorderedView layer](self, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 1.0;
      v10 = v8;
      goto LABEL_7;
    }
    v7 = 1.0 / v6;
  }
  -[FMBorderedView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  v9 = v7;
LABEL_7:
  objc_msgSend(v8, "setBorderWidth:", v9);

}

- (double)borderWidth
{
  void *v4;
  double v5;
  double v6;

  if (-[FMBorderedView hairlineBorder](self, "hairlineBorder"))
    return -1.0;
  -[FMBorderedView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "borderWidth");
  v6 = v5;

  return v6;
}

- (void)setCornerRadius:(double)a3
{
  id v4;

  -[FMBorderedView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", a3);

}

- (double)cornerRadius
{
  void *v2;
  double v3;
  double v4;

  -[FMBorderedView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cornerRadius");
  v4 = v3;

  return v4;
}

- (void)setBorderColor:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = objc_msgSend(objc_retainAutorelease(a3), "CGColor");
  -[FMBorderedView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBorderColor:", v4);

}

- (UIColor)borderColor
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6950];
  -[FMBorderedView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithCGColor:", objc_msgSend(v3, "borderColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v4;
}

- (BOOL)hairlineBorder
{
  return self->_hairlineBorder;
}

- (void)setHairlineBorder:(BOOL)a3
{
  self->_hairlineBorder = a3;
}

@end
