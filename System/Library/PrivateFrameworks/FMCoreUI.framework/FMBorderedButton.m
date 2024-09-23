@implementation FMBorderedButton

- (void)awakeFromNib
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FMBorderedButton;
  -[FMBorderedButton awakeFromNib](&v3, sel_awakeFromNib);
  -[FMBorderedButton _bbUpdateLayer](self, "_bbUpdateLayer");
}

- (void)prepareForInterfaceBuilder
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FMBorderedButton;
  -[FMBorderedButton prepareForInterfaceBuilder](&v3, sel_prepareForInterfaceBuilder);
  -[FMBorderedButton _bbUpdateLayer](self, "_bbUpdateLayer");
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FMBorderedButton;
  -[FMBorderedButton tintColorDidChange](&v3, sel_tintColorDidChange);
  -[FMBorderedButton _bbUpdateLayer](self, "_bbUpdateLayer");
}

- (void)setEnabled:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FMBorderedButton;
  -[FMBorderedButton setEnabled:](&v4, sel_setEnabled_, a3);
  -[FMBorderedButton _bbUpdateLayer](self, "_bbUpdateLayer");
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FMBorderedButton;
  -[FMBorderedButton setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[FMBorderedButton _bbUpdateLayer](self, "_bbUpdateLayer");
}

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
    -[FMBorderedButton setHairlineBorder:](self, "setHairlineBorder:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scale");
    v6 = v5;

    -[FMBorderedButton setHairlineBorder:](self, "setHairlineBorder:", 1);
    if (v6 <= 1.0)
    {
      -[FMBorderedButton layer](self, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 1.0;
      v10 = v8;
      goto LABEL_7;
    }
    v7 = 1.0 / v6;
  }
  -[FMBorderedButton layer](self, "layer");
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

  if (-[FMBorderedButton hairlineBorder](self, "hairlineBorder"))
    return -1.0;
  -[FMBorderedButton layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "borderWidth");
  v6 = v5;

  return v6;
}

- (void)setCornerRadius:(double)a3
{
  id v4;

  -[FMBorderedButton layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", a3);

}

- (double)cornerRadius
{
  void *v2;
  double v3;
  double v4;

  -[FMBorderedButton layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cornerRadius");
  v4 = v3;

  return v4;
}

- (void)_bbUpdateLayer
{
  id v2;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;

  if ((-[FMBorderedButton isEnabled](self, "isEnabled") & 1) != 0)
  {
    if (!-[FMBorderedButton isHighlighted](self, "isHighlighted"))
    {
      if (-[FMBorderedButton buttonType](self, "buttonType") == 1)
      {
        objc_msgSend(MEMORY[0x24BDE5648], "animation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setDuration:", 0.215);
        -[FMBorderedButton layer](self, "layer");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addAnimation:forKey:", v7, CFSTR("borderColor"));

      }
      -[FMBorderedButton titleColorForState:](self, "titleColorForState:", 0);
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v9 = objc_msgSend(v14, "CGColor");
      -[FMBorderedButton layer](self, "layer");
      v2 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setBorderColor:", v9);
LABEL_11:
      v10 = v14;
LABEL_18:
      v15 = v10;

      v10 = v15;
      goto LABEL_19;
    }
    -[FMBorderedButton titleColorForState:](self, "titleColorForState:", 1);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (-[FMBorderedButton buttonType](self, "buttonType") == 1)
    {
      if (v14)
      {
        objc_msgSend(v14, "colorWithAlphaComponent:", 0.2);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v2 = v4;
      }
      else
      {
        -[FMBorderedButton titleColorForState:](self, "titleColorForState:", 0);
        v2 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "colorWithAlphaComponent:", 0.2);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v12 = objc_msgSend(objc_retainAutorelease(v4), "CGColor");
      -[FMBorderedButton layer](self, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBorderColor:", v12);

      v10 = v14;
      if (v14)
        goto LABEL_18;

      goto LABEL_11;
    }
    v5 = v14;
    if (!v14)
      goto LABEL_13;
LABEL_7:
    v6 = objc_msgSend(objc_retainAutorelease(v5), "CGColor");
    goto LABEL_14;
  }
  -[FMBorderedButton titleColorForState:](self, "titleColorForState:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v5;
  if (v5)
    goto LABEL_7;
LABEL_13:
  -[FMBorderedButton titleColorForState:](self, "titleColorForState:", 0);
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v2, "CGColor");
LABEL_14:
  -[FMBorderedButton layer](self, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBorderColor:", v6);

  v10 = v14;
  if (!v14)
    goto LABEL_18;
LABEL_19:

}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(id)a3
{
  objc_storeStrong((id *)&self->_borderColor, a3);
}

- (BOOL)hairlineBorder
{
  return self->_hairlineBorder;
}

- (void)setHairlineBorder:(BOOL)a3
{
  self->_hairlineBorder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderColor, 0);
}

@end
