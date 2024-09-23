@implementation PKDrawingAdjustmentKnob

- (PKDrawingAdjustmentKnob)init
{
  PKDrawingAdjustmentKnob *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  UIImage *knobImage;
  uint64_t v8;
  UIImage *knobImageFlipped;
  uint64_t v10;
  UIImageView *knobView;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKDrawingAdjustmentKnob;
  v2 = -[PKDrawingAdjustmentKnob init](&v13, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("PKDrawingAdjustmentKnob"), v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "imageWithRenderingMode:", 2);
    v6 = objc_claimAutoreleasedReturnValue();
    knobImage = v2->_knobImage;
    v2->_knobImage = (UIImage *)v6;

    -[UIImage imageFlippedForRightToLeftLayoutDirection](v2->_knobImage, "imageFlippedForRightToLeftLayoutDirection");
    v8 = objc_claimAutoreleasedReturnValue();
    knobImageFlipped = v2->_knobImageFlipped;
    v2->_knobImageFlipped = (UIImage *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v5);
    knobView = v2->_knobView;
    v2->_knobView = (UIImageView *)v10;

    -[PKDrawingAdjustmentKnob addSubview:](v2, "addSubview:", v2->_knobView);
  }
  return v2;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;

  -[PKDrawingAdjustmentKnob tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](self->_knobView, "setTintColor:", v3);

  -[PKDrawingAdjustmentKnob bounds](self, "bounds");
  v5 = v4;
  -[PKDrawingAdjustmentKnob bounds](self, "bounds");
  -[UIImageView setFrame:](self->_knobView, "setFrame:", 0.0, 0.0, v5);
  -[UIImageView setImage:](self->_knobView, "setImage:", *(Class *)((char *)&self->super.super.super.isa+ OBJC_IVAR___PKDrawingAdjustmentKnob__knobImage[-[PKDrawingAdjustmentKnob effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1]));
}

+ (double)leftMargin
{
  void *v2;
  double v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "userInterfaceIdiom") == 1)
    v3 = 10.0;
  else
    v3 = 6.0;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knobImageFlipped, 0);
  objc_storeStrong((id *)&self->_knobImage, 0);
  objc_storeStrong((id *)&self->_knobView, 0);
}

@end
