@implementation AKAttributesPickerButton

- (void)layoutSubviews
{
  double v3;
  double v4;
  objc_super v5;
  CGRect v6;
  CGRect v7;

  v5.receiver = self;
  v5.super_class = (Class)AKAttributesPickerButton;
  -[AKAttributesPickerButton layoutSubviews](&v5, sel_layoutSubviews);
  -[AKAttributesPickerButton bounds](self, "bounds");
  v3 = CGRectGetWidth(v6) * 0.5;
  -[AKAttributesPickerButton bounds](self, "bounds");
  v4 = CGRectGetHeight(v7) * 0.5;
  if (v3 < v4)
    v4 = v3;
  -[AKAttributesPickerButton _setCornerRadius:](self, "_setCornerRadius:", v4);
}

@end
