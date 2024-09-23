@implementation ARCoachingRoundedButton

- (ARCoachingRoundedButton)initWithTitle:(id)a3 buttonStyle:(int64_t)a4 textStyle:(int64_t)a5 controlStyle:(int64_t)a6 adjustsFontForContentSizeCategory:(BOOL)a7
{
  ARCoachingRoundedButton *v7;
  ARCoachingRoundedButton *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ARCoachingRoundedButton;
  v7 = -[ARCoachingButton initWithTitle:buttonStyle:textStyle:controlStyle:adjustsFontForContentSizeCategory:](&v10, sel_initWithTitle_buttonStyle_textStyle_controlStyle_adjustsFontForContentSizeCategory_, a3, a4, a5, a6, a7);
  v8 = v7;
  if (v7)
    -[ARCoachingRoundedButton _setupViewWithCornerRadius:](v7, "_setupViewWithCornerRadius:", 16.0);
  return v8;
}

- (ARCoachingRoundedButton)initWithTitle:(id)a3 buttonStyle:(int64_t)a4 textStyle:(int64_t)a5 controlStyle:(int64_t)a6 cornerRadius:(double)a7
{
  return -[ARCoachingRoundedButton initWithTitle:buttonStyle:textStyle:controlStyle:cornerRadius:adjustsFontForContentSizeCategory:](self, "initWithTitle:buttonStyle:textStyle:controlStyle:cornerRadius:adjustsFontForContentSizeCategory:", a3, a4, a5, a6, 0, a7);
}

- (ARCoachingRoundedButton)initWithTitle:(id)a3 buttonStyle:(int64_t)a4 textStyle:(int64_t)a5 controlStyle:(int64_t)a6 cornerRadius:(double)a7 adjustsFontForContentSizeCategory:(BOOL)a8
{
  ARCoachingRoundedButton *v9;
  ARCoachingRoundedButton *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ARCoachingRoundedButton;
  v9 = -[ARCoachingButton initWithTitle:buttonStyle:textStyle:controlStyle:adjustsFontForContentSizeCategory:](&v12, sel_initWithTitle_buttonStyle_textStyle_controlStyle_adjustsFontForContentSizeCategory_, a3, a4, a5, a6, a8);
  v10 = v9;
  if (v9)
    -[ARCoachingRoundedButton _setupViewWithCornerRadius:](v9, "_setupViewWithCornerRadius:", a7);
  return v10;
}

- (void)_setupViewWithCornerRadius:(double)a3
{
  -[ARCoachingRoundedButton _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", a3);
  -[ARCoachingRoundedButton setClipsToBounds:](self, "setClipsToBounds:", 1);
}

@end
