@implementation MKPlaceInfoEmailRowView

- (MKPlaceInfoEmailRowView)initWithFrame:(CGRect)a3
{
  MKPlaceInfoEmailRowView *v3;
  MKPlaceInfoEmailRowView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKPlaceInfoEmailRowView;
  v3 = -[MKPlaceInfoContactRowView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MKPlaceInfoContactRowView valueLabel](v3, "valueLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLineBreakMode:", 1);

  }
  return v4;
}

- (id)_icon
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA638], "_mapkit_imageNamed:", CFSTR("email"));
}

- (id)_iconAccessibilityLabel
{
  return _MKLocalizedStringFromThisBundle(CFSTR("PlaceCard_Send_Email_Button_AccessibilityLabel"));
}

- (id)_valueString
{
  void *v2;
  void *v3;

  -[MKPlaceInfoContactRowView labeledValue](self, "labeledValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (Class)_labeledValueExpectedValueType
{
  return (Class)objc_opt_class();
}

- (int)analyticsTarget
{
  return 0;
}

@end
