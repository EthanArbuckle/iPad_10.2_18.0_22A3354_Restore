@implementation MKPlaceInfoPhoneNumberView

- (MKPlaceInfoPhoneNumberView)initWithFrame:(CGRect)a3
{
  MKPlaceInfoPhoneNumberView *v3;
  MKPlaceInfoPhoneNumberView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKPlaceInfoPhoneNumberView;
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
  return (id)objc_msgSend(MEMORY[0x1E0CEA638], "_mapkit_imageNamed:", CFSTR("call"));
}

- (id)_iconAccessibilityLabel
{
  return _MKLocalizedStringFromThisBundle(CFSTR("PlaceCard_Call_PhoneNumber_Button_AccessibilityLabel"));
}

- (id)_valueString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MKPlaceInfoContactRowView labeledValue](self, "labeledValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceInfoPhoneNumberView formatPhoneNumber:](self, "formatPhoneNumber:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)formatPhoneNumber:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const void *v8;
  __CFString *String;

  v3 = *MEMORY[0x1E0C9AE00];
  v4 = (void *)MEMORY[0x1E0D27008];
  v5 = a3;
  objc_msgSend(v4, "sharedConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "countryCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (const void *)mk_CFPhoneNumberCreate(v3, (uint64_t)v5, (uint64_t)v7);

  if (v8)
  {
    String = (__CFString *)mk_CFPhoneNumberCreateString(v3, (uint64_t)v8, 5);
    CFRelease(v8);
  }
  else
  {
    String = &stru_1E20DFC00;
  }
  return String;
}

- (Class)_labeledValueExpectedValueType
{
  return (Class)objc_opt_class();
}

- (void)setOptsOutOfAds:(BOOL)a3
{
  UIColor *labelColor;
  _MKUILabel *v5;
  UIColor *v6;
  UIColor *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  UIColor *v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  if (LOBYTE(self->_optsOutOfAdsView) != a3)
  {
    LOBYTE(self->_optsOutOfAdsView) = a3;
    labelColor = self->super._labelColor;
    if (a3)
    {
      if (!labelColor)
      {
        v5 = [_MKUILabel alloc];
        v6 = -[_MKUILabel initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        v7 = self->super._labelColor;
        self->super._labelColor = v6;

        -[UIColor setTranslatesAutoresizingMaskIntoConstraints:](self->super._labelColor, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[MKPlaceInfoContactRowView valueLabel](self, "valueLabel");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "font");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIColor setFont:](self->super._labelColor, "setFont:", v9);

        -[MKPlaceInfoContactRowView valueLabel](self, "valueLabel");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "textColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIColor setTextColor:](self->super._labelColor, "setTextColor:", v11);

        _MKLocalizedStringFromThisBundle(CFSTR("PlaceOptsOutOfTelephoneAds"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIColor setText:](self->super._labelColor, "setText:", v12);

        -[MKPlaceInfoPhoneNumberView addSubview:](self, "addSubview:", self->super._labelColor);
        v13 = (void *)MEMORY[0x1E0CB3718];
        -[UIColor leadingAnchor](self->super._labelColor, "leadingAnchor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKPlaceInfoContactRowView valueLabel](self, "valueLabel");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "trailingAnchor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, 5.0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = v17;
        -[UIColor firstBaselineAnchor](self->super._labelColor, "firstBaselineAnchor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKPlaceInfoContactRowView valueLabel](self, "valueLabel");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "firstBaselineAnchor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "constraintEqualToAnchor:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v24[1] = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "activateConstraints:", v22);

      }
    }
    else if (labelColor)
    {
      -[UIColor removeFromSuperview](labelColor, "removeFromSuperview");
      v23 = self->super._labelColor;
      self->super._labelColor = 0;

    }
  }
}

- (int)analyticsTarget
{
  return 1503;
}

- (BOOL)optsOutOfAds
{
  return (BOOL)self->_optsOutOfAdsView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->super._labelColor, 0);
}

@end
