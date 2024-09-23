@implementation SFDialogTextField

- (SFDialogTextField)initWithFrame:(CGRect)a3
{
  SFDialogTextField *v3;
  SFDialogTextField *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  SFDialogTextField *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SFDialogTextField;
  v3 = -[SFDialogTextField initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SFDialogTextField setAdjustsFontForContentSizeCategory:](v3, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDialogTextField setBackgroundColor:](v4, "setBackgroundColor:", v5);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDialogTextField setFont:](v4, "setFont:", v6);

    -[SFDialogTextField _setContinuousCornerRadius:](v4, "_setContinuousCornerRadius:", 5.0);
    -[SFDialogTextField layer](v4, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.78, 1.0);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "setBorderColor:", objc_msgSend(v8, "CGColor"));

    objc_msgSend(v7, "setBorderWidth:", _SFOnePixel());
    v9 = v4;

  }
  return v4;
}

- (void)layoutSubviews
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFDialogTextField;
  -[SFDialogTextField layoutSubviews](&v6, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x1E0DC3658], "opaqueSeparatorColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "CGColor");
  -[SFDialogTextField layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBorderColor:", v4);

}

- (id)_placeholderColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.73, 1.0);
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  return CGRectInset(a3, 7.0, 7.0);
}

- (void)setStackPosition:(unint64_t)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  if (self->_stackPosition != a3)
  {
    self->_stackPosition = a3;
    switch(a3)
    {
      case 2uLL:
        -[SFDialogTextField layer](self, "layer");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v3;
        v4 = 12;
        goto LABEL_9;
      case 1uLL:
        -[SFDialogTextField layer](self, "layer");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v3;
        v4 = 3;
        goto LABEL_9;
      case 0uLL:
        -[SFDialogTextField layer](self, "layer");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v3;
        v4 = 15;
LABEL_9:
        objc_msgSend(v3, "setMaskedCorners:", v4);

        break;
    }
  }
}

- (unint64_t)stackPosition
{
  return self->_stackPosition;
}

@end
