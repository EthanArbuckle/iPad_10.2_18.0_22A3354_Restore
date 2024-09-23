@implementation HUPaddedTextField

- (HUPaddedTextField)initWithFrame:(CGRect)a3
{
  HUPaddedTextField *v3;
  HUPaddedTextField *v4;
  HUPaddedTextField *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUPaddedTextField;
  v3 = -[HUPaddedTextField initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[HUPaddedTextField setBorderStyle:](v3, "setBorderStyle:", 3);
    -[HUPaddedTextField _setRoundedRectBackgroundCornerRadius:](v4, "_setRoundedRectBackgroundCornerRadius:", 12.0);
    v5 = v4;
  }

  return v4;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  v5.receiver = self;
  v5.super_class = (Class)HUPaddedTextField;
  -[HUPaddedTextField intrinsicContentSize](&v5, sel_intrinsicContentSize);
  v4 = fmax(v3 + 40.0, 50.0);
  result.height = v4;
  result.width = v2;
  return result;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  double width;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  CGRect result;

  width = a3.size.width;
  v9.receiver = self;
  v9.super_class = (Class)HUPaddedTextField;
  -[HUPaddedTextField textRectForBounds:](&v9, sel_textRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = fmax(v7, 20.0);
  if (width + -40.0 < v5)
    v5 = width + -40.0;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v8;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  double width;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  CGRect result;

  width = a3.size.width;
  v9.receiver = self;
  v9.super_class = (Class)HUPaddedTextField;
  -[HUPaddedTextField editingRectForBounds:](&v9, sel_editingRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = fmax(v7, 20.0);
  if (width + -40.0 < v5)
    v5 = width + -40.0;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v8;
  return result;
}

- (CGRect)placeholderRectForBounds:(CGRect)a3
{
  double width;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  CGRect result;

  width = a3.size.width;
  v9.receiver = self;
  v9.super_class = (Class)HUPaddedTextField;
  -[HUPaddedTextField placeholderRectForBounds:](&v9, sel_placeholderRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = fmax(v7, 20.0);
  if (width + -40.0 < v5)
    v5 = width + -40.0;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v8;
  return result;
}

@end
