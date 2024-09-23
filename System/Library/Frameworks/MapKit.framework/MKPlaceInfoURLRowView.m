@implementation MKPlaceInfoURLRowView

- (MKPlaceInfoURLRowView)initWithFrame:(CGRect)a3
{
  MKPlaceInfoURLRowView *v3;
  MKPlaceInfoURLRowView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKPlaceInfoURLRowView;
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
  return (id)objc_msgSend(MEMORY[0x1E0CEA638], "_mapkit_imageNamed:", CFSTR("website"));
}

- (id)_iconAccessibilityLabel
{
  return _MKLocalizedStringFromThisBundle(CFSTR("PlaceCard_OpenURL_Button_AccessibilityLabel"));
}

- (id)_valueString
{
  void *v2;
  void *v3;
  void *v4;

  -[MKPlaceInfoContactRowView labeledValue](self, "labeledValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "_mapkit_shortenedURLStringForFullURLString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (Class)_labeledValueExpectedValueType
{
  return (Class)objc_opt_class();
}

- (id)draggableContent
{
  void *v2;
  void *v3;
  void *v4;

  -[MKPlaceInfoContactRowView labeledValue](self, "labeledValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)analyticsTarget
{
  return 1504;
}

@end
