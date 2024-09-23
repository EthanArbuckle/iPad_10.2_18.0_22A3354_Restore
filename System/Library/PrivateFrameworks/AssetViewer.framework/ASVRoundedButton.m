@implementation ASVRoundedButton

- (ASVRoundedButton)initWithTitle:(id)a3 buttonStyle:(int64_t)a4 textStyle:(int64_t)a5 controlStyle:(int64_t)a6 adjustsFontForContentSizeCategory:(BOOL)a7
{
  ASVRoundedButton *v7;
  ASVRoundedButton *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ASVRoundedButton;
  v7 = -[ASVButton initWithTitle:buttonStyle:textStyle:controlStyle:adjustsFontForContentSizeCategory:](&v10, sel_initWithTitle_buttonStyle_textStyle_controlStyle_adjustsFontForContentSizeCategory_, a3, a4, a5, a6, a7);
  v8 = v7;
  if (v7)
    -[ASVRoundedButton _setupViewWithCornerRadius:](v7, "_setupViewWithCornerRadius:", 16.0);
  return v8;
}

- (void)_setupViewWithCornerRadius:(double)a3
{
  -[ASVRoundedButton _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", a3);
  -[ASVRoundedButton setClipsToBounds:](self, "setClipsToBounds:", 1);
}

- (ASVRoundedButton)initWithImage:(id)a3 buttonStyle:(int64_t)a4 textStyle:(int64_t)a5 controlStyle:(int64_t)a6 largeImageInsets:(UIEdgeInsets)a7
{
  ASVRoundedButton *v7;
  ASVRoundedButton *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ASVRoundedButton;
  v7 = -[ASVButton initWithImage:buttonStyle:textStyle:controlStyle:largeImageInsets:](&v10, sel_initWithImage_buttonStyle_textStyle_controlStyle_largeImageInsets_, a3, a4, a5, a6, a7.top, a7.left, a7.bottom, a7.right);
  v8 = v7;
  if (v7)
    -[ASVRoundedButton _setupViewWithCornerRadius:](v7, "_setupViewWithCornerRadius:", 16.0);
  return v8;
}

- (ASVRoundedButton)initWithTitle:(id)a3 buttonStyle:(int64_t)a4 textStyle:(int64_t)a5 controlStyle:(int64_t)a6 cornerRadius:(double)a7
{
  return -[ASVRoundedButton initWithTitle:buttonStyle:textStyle:controlStyle:cornerRadius:adjustsFontForContentSizeCategory:](self, "initWithTitle:buttonStyle:textStyle:controlStyle:cornerRadius:adjustsFontForContentSizeCategory:", a3, a4, a5, a6, 0, a7);
}

- (ASVRoundedButton)initWithTitle:(id)a3 buttonStyle:(int64_t)a4 textStyle:(int64_t)a5 controlStyle:(int64_t)a6 cornerRadius:(double)a7 adjustsFontForContentSizeCategory:(BOOL)a8
{
  ASVRoundedButton *v9;
  ASVRoundedButton *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ASVRoundedButton;
  v9 = -[ASVButton initWithTitle:buttonStyle:textStyle:controlStyle:adjustsFontForContentSizeCategory:](&v12, sel_initWithTitle_buttonStyle_textStyle_controlStyle_adjustsFontForContentSizeCategory_, a3, a4, a5, a6, a8);
  v10 = v9;
  if (v9)
    -[ASVRoundedButton _setupViewWithCornerRadius:](v9, "_setupViewWithCornerRadius:", a7);
  return v10;
}

@end
