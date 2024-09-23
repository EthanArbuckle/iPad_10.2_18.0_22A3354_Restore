@implementation MKPlaceInfoContactRowView

+ (id)icon
{
  return 0;
}

- (id)_valueString
{
  return 0;
}

- (id)_icon
{
  return 0;
}

- (id)_iconAccessibilityLabel
{
  return 0;
}

- (void)copy:(id)a3
{
  void *v3;
  id v4;

  -[MKPlaceInfoContactRowView _valueString](self, "_valueString", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CEA810], "generalPasteboard");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setString:", v4);

  }
}

- (Class)_labeledValueExpectedValueType
{
  return (Class)objc_opt_class();
}

- (MKPlaceInfoContactRowView)initWithFrame:(CGRect)a3
{
  MKPlaceInfoContactRowView *v3;
  MKPlaceInfoContactRowView *v4;
  void *v5;
  MKVibrantLabel *v6;
  CNLabeledValue *labeledValue;
  _MKUILabel *v8;
  uint64_t v9;
  MKVibrantLabel *titleLabel;
  void *v11;
  void *v12;
  uint64_t v13;
  MKPlaceSectionHeaderView *headerView;
  void *v15;
  void *v16;
  uint64_t v17;
  NSLayoutConstraint *topToIconConstraint;
  void *v19;
  void *v20;
  uint64_t v21;
  id iconSelectedBlock;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSLayoutConstraint *titleToValueConstraint;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSArray *iconConstraints;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v43[4];
  id v44;
  id location;
  objc_super v46;
  _QWORD v47[3];
  _QWORD v48[5];

  v48[4] = *MEMORY[0x1E0C80C00];
  v46.receiver = self;
  v46.super_class = (Class)MKPlaceInfoContactRowView;
  v3 = -[MKPlaceSectionItemView initWithFrame:](&v46, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MKPlaceInfoContactRowView setPreservesSuperviewLayoutMargins:](v3, "setPreservesSuperviewLayoutMargins:", 1);
    objc_initWeak(&location, v4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__contentSizeDidChange, *MEMORY[0x1E0CEB3F0], 0);

    v6 = -[MKVibrantLabel initWithStyle:]([MKVibrantLabel alloc], "initWithStyle:", 1);
    labeledValue = v4->_labeledValue;
    v4->_labeledValue = (CNLabeledValue *)v6;

    -[CNLabeledValue setTextAlignment:](v4->_labeledValue, "setTextAlignment:", 4);
    -[CNLabeledValue setTranslatesAutoresizingMaskIntoConstraints:](v4->_labeledValue, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNLabeledValue setClipsToBounds:](v4->_labeledValue, "setClipsToBounds:", 0);
    v8 = [_MKUILabel alloc];
    v9 = -[_MKUILabel initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (MKVibrantLabel *)v9;

    v43[1] = 3221225472;
    v43[2] = __43__MKPlaceInfoContactRowView_initWithFrame___block_invoke;
    v43[3] = &unk_1E20DB0D8;
    v43[0] = MEMORY[0x1E0C809B0];
    objc_copyWeak(&v44, &location);
    -[MKVibrantLabel set_mapkit_themeColorProvider:](v4->_titleLabel, "set_mapkit_themeColorProvider:", v43);
    -[MKVibrantLabel setTextAlignment:](v4->_titleLabel, "setTextAlignment:", 4);
    -[MKVibrantLabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MKVibrantLabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 0);
    -[MKVibrantLabel setUserInteractionEnabled:](v4->_titleLabel, "setUserInteractionEnabled:", 1);
    -[MKPlaceInfoContactRowView addSubview:](v4, "addSubview:", v4->_labeledValue);
    -[MKPlaceInfoContactRowView addSubview:](v4, "addSubview:", v4->_titleLabel);
    -[CNLabeledValue firstBaselineAnchor](v4->_labeledValue, "firstBaselineAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceInfoContactRowView topAnchor](v4, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    headerView = v4->_headerView;
    v4->_headerView = (MKPlaceSectionHeaderView *)v13;

    -[MKVibrantLabel firstBaselineAnchor](v4->_titleLabel, "firstBaselineAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLabeledValue lastBaselineAnchor](v4->_labeledValue, "lastBaselineAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    topToIconConstraint = v4->_topToIconConstraint;
    v4->_topToIconConstraint = (NSLayoutConstraint *)v17;

    -[MKPlaceInfoContactRowView bottomAnchor](v4, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKVibrantLabel lastBaselineAnchor](v4->_titleLabel, "lastBaselineAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    iconSelectedBlock = v4->_iconSelectedBlock;
    v4->_iconSelectedBlock = (id)v21;

    -[MKPlaceInfoContactRowView _contentSizeDidChange](v4, "_contentSizeDidChange");
    -[MKPlaceInfoContactRowView layoutMarginsGuide](v4, "layoutMarginsGuide");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKVibrantLabel trailingAnchor](v4->_titleLabel, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintGreaterThanOrEqualToAnchor:", v25);
    v26 = objc_claimAutoreleasedReturnValue();
    titleToValueConstraint = v4->_titleToValueConstraint;
    v4->_titleToValueConstraint = (NSLayoutConstraint *)v26;

    v48[0] = v4->_headerView;
    v48[1] = v4->_topToIconConstraint;
    -[CNLabeledValue leadingAnchor](v4->_labeledValue, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKVibrantLabel leadingAnchor](v4->_titleLabel, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v48[2] = v30;
    -[CNLabeledValue trailingAnchor](v4->_labeledValue, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKVibrantLabel trailingAnchor](v4->_titleLabel, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintLessThanOrEqualToAnchor:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v48[3] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 4);
    v34 = objc_claimAutoreleasedReturnValue();
    iconConstraints = v4->_iconConstraints;
    v4->_iconConstraints = (NSArray *)v34;

    v36 = (void *)MEMORY[0x1E0CB3718];
    v47[0] = v4->_titleToValueConstraint;
    v47[1] = v4->_iconSelectedBlock;
    -[MKVibrantLabel leadingAnchor](v4->_titleLabel, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceInfoContactRowView layoutMarginsGuide](v4, "layoutMarginsGuide");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v40;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 3);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "activateConstraints:", v41);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v4->_iconConstraints);
    -[MKPlaceInfoContactRowView tintColorDidChange](v4, "tintColorDidChange");
    -[MKPlaceInfoContactRowView _contentSizeDidChange](v4, "_contentSizeDidChange");
    -[MKPlaceSectionItemView infoCardThemeChanged](v4, "infoCardThemeChanged");
    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);
  }
  return v4;
}

id __43__MKPlaceInfoContactRowView_initWithFrame___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  void *v3;
  id v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && (v3 = (void *)WeakRetained[71]) != 0)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(WeakRetained, "mk_theme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)_contentSizeDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  +[MKFontManager sharedManager](MKFontManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionHeaderFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNLabeledValue setFont:](self->_labeledValue, "setFont:", v4);

  +[MKFontManager sharedManager](MKFontManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bodyFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKVibrantLabel setFont:](self->_titleLabel, "setFont:", v6);

  +[MKFontManager sharedManager](MKFontManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bodyFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_mapkit_scaledValueForValue:", 12.0);
  -[NSLayoutConstraint setConstant:](self->_topToTitleConstraint, "setConstant:");

  +[MKFontManager sharedManager](MKFontManager, "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bodyFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_mapkit_scaledValueForValue:", 27.0);
  -[MKPlaceSectionHeaderView setConstant:](self->_headerView, "setConstant:");

  +[MKFontManager sharedManager](MKFontManager, "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bodyFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_mapkit_scaledValueForValue:", 22.0);
  -[NSLayoutConstraint setConstant:](self->_topToIconConstraint, "setConstant:");

  +[MKFontManager sharedManager](MKFontManager, "sharedManager");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bodyFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_mapkit_scaledValueForValue:", 17.0);
  objc_msgSend(self->_iconSelectedBlock, "setConstant:");

}

- (void)setLabelColor:(id)a3
{
  NSLayoutConstraint *v5;
  void *v6;
  void *v7;
  NSLayoutConstraint *v8;

  v5 = (NSLayoutConstraint *)a3;
  if (self->_valueToBottomConstraint != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_valueToBottomConstraint, a3);
    if (self->_valueToBottomConstraint)
    {
      -[MKVibrantLabel setTextColor:](self->_titleLabel, "setTextColor:");
    }
    else
    {
      -[UIView mk_theme](self, "mk_theme");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "textColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKVibrantLabel setTextColor:](self->_titleLabel, "setTextColor:", v7);

    }
    v5 = v8;
  }

}

- (void)setLabeledValue:(id)a3
{
  BOOL *p_isInRightMouseDownEvent;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id obj;

  p_isInRightMouseDownEvent = &self->_isInRightMouseDownEvent;
  obj = a3;
  if ((objc_msgSend(*(id *)p_isInRightMouseDownEvent, "isEqual:") & 1) == 0)
  {
    v5 = obj;
    if (obj)
    {
      -[MKPlaceInfoContactRowView _labeledValueExpectedValueType](self, "_labeledValueExpectedValueType");
      objc_msgSend(obj, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 && (objc_opt_isKindOfClass() & 1) == 0)
      {

        obj = 0;
      }

      v5 = obj;
    }
    obj = v5;
    objc_storeStrong((id *)&self->_isInRightMouseDownEvent, v5);
    objc_msgSend(*(id *)p_isInRightMouseDownEvent, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && objc_msgSend(v7, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C97338], "localizedStringForLabel:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNLabeledValue setText:](self->_labeledValue, "setText:", v9);

    }
    -[MKPlaceInfoContactRowView _valueString](self, "_valueString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKVibrantLabel setText:](self->_titleLabel, "setText:", v10);

  }
}

- (NSItemProviderWriting)draggableContent
{
  return 0;
}

- (int)analyticsTarget
{
  return 0;
}

- (CNLabeledValue)labeledValue
{
  return *(CNLabeledValue **)&self->_isInRightMouseDownEvent;
}

- (MKVibrantLabel)titleLabel
{
  return (MKVibrantLabel *)self->_labeledValue;
}

- (_MKUILabel)valueLabel
{
  return (_MKUILabel *)self->_titleLabel;
}

- (id)iconSelectedBlock
{
  return self->_valueLabel;
}

- (void)setIconSelectedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (NSLayoutConstraint)valueToBottomConstraint
{
  return (NSLayoutConstraint *)self->_iconSelectedBlock;
}

- (void)setValueToBottomConstraint:(id)a3
{
  objc_storeStrong(&self->_iconSelectedBlock, a3);
}

- (UIColor)labelColor
{
  return (UIColor *)self->_valueToBottomConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueToBottomConstraint, 0);
  objc_storeStrong(&self->_iconSelectedBlock, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_labeledValue, 0);
  objc_storeStrong((id *)&self->_isInRightMouseDownEvent, 0);
  objc_storeStrong((id *)&self->_iconConstraints, 0);
  objc_storeStrong((id *)&self->_valueToTrailingViewConstraint, 0);
  objc_storeStrong((id *)&self->_titleToValueConstraint, 0);
  objc_storeStrong((id *)&self->_topToIconConstraint, 0);
  objc_storeStrong((id *)&self->_topToTitleConstraint, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->super._selected, 0);
}

@end
