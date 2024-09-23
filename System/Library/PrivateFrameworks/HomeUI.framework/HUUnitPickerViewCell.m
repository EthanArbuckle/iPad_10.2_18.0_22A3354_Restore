@implementation HUUnitPickerViewCell

- (HUUnitPickerViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUUnitPickerViewCell *v4;
  HUUnitPickerViewCell *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HUUnitPickerViewCell;
  v4 = -[HUPickerViewCell initWithStyle:reuseIdentifier:](&v15, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_longestValueSize = (CGSize)*MEMORY[0x1E0C9D820];
    v6 = objc_alloc_init(MEMORY[0x1E0CEA700]);
    -[HUUnitPickerViewCell setUnitLabel:](v5, "setUnitLabel:", v6);

    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 20.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUnitPickerViewCell unitLabel](v5, "unitLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v7);

    -[HUPickerViewCell pickerView](v5, "pickerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_textColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUnitPickerViewCell unitLabel](v5, "unitLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTextColor:", v10);

    -[HUUnitPickerViewCell contentView](v5, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUnitPickerViewCell unitLabel](v5, "unitLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v13);

  }
  return v5;
}

- (void)prepareForReuse
{
  NSAttributedString *longestValue;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUUnitPickerViewCell;
  -[HUPickerViewCell prepareForReuse](&v4, sel_prepareForReuse);
  longestValue = self->_longestValue;
  self->_longestValue = 0;

  self->_longestValueSize = (CGSize)*MEMORY[0x1E0C9D820];
}

- (void)reloadPickerView
{
  NSAttributedString *longestValue;
  objc_super v4;

  longestValue = self->_longestValue;
  self->_longestValue = 0;

  self->_longestValueSize = (CGSize)*MEMORY[0x1E0C9D820];
  v4.receiver = self;
  v4.super_class = (Class)HUUnitPickerViewCell;
  -[HUPickerViewCell reloadPickerView](&v4, sel_reloadPickerView);
}

- (void)setUnitText:(id)a3
{
  id v5;
  NSString *v6;
  NSString *v7;
  char v8;
  NSString *v9;

  v5 = a3;
  v6 = self->_unitText;
  v7 = (NSString *)v5;
  v9 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v6)
    {
      v8 = -[NSString isEqual:](v6, "isEqual:", v7);

      if ((v8 & 1) != 0)
        goto LABEL_8;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_unitText, a3);
    -[HUUnitPickerViewCell updateUIWithAnimation:](self, "updateUIWithAnimation:", 1);
  }
LABEL_8:

}

- (void)updateUIWithAnimation:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HUUnitPickerViewCell;
  -[HUPickerViewCell updateUIWithAnimation:](&v13, sel_updateUIWithAnimation_, a3);
  -[HUUnitPickerViewCell unitLabel](self, "unitLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUnitPickerViewCell effectiveUnitText](self, "effectiveUnitText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v6;
  if (v7 == v8)
  {

    return;
  }
  v9 = v8;
  if (!v7)
  {

    goto LABEL_7;
  }
  v10 = objc_msgSend(v7, "isEqual:", v8);

  if ((v10 & 1) == 0)
  {
LABEL_7:
    -[HUUnitPickerViewCell effectiveUnitText](self, "effectiveUnitText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUnitPickerViewCell unitLabel](self, "unitLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v11);

    -[HUUnitPickerViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)HUUnitPickerViewCell;
  -[HUUnitPickerViewCell layoutSubviews](&v18, sel_layoutSubviews);
  -[HUUnitPickerViewCell unitLabel](self, "unitLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeToFit");

  -[HUUnitPickerViewCell unitLabel](self, "unitLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;

  -[HUPickerViewCell pickerView](self, "pickerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "center");
  v11 = v10;
  -[HUUnitPickerViewCell longestValueSize](self, "longestValueSize");
  v13 = v11 + v12 * 0.5 + 8.0;
  -[HUPickerViewCell pickerView](self, "pickerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "center");
  v16 = v15 - v8 * 0.5;

  -[HUUnitPickerViewCell unitLabel](self, "unitLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v13, v16, v6, v8);

}

- (id)effectiveUnitText
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  -[HUUnitPickerViewCell unitText](self, "unitText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[HUPickerViewCell item](self, "item");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "latestResults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D30]);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (NSAttributedString)longestValue
{
  NSAttributedString *longestValue;
  NSAttributedString *v4;
  uint64_t v5;
  double v6;
  void *v7;
  NSAttributedString *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  NSAttributedString *v13;

  longestValue = self->_longestValue;
  if (!longestValue)
  {
    v4 = 0;
    if (-[HUPickerViewCell numberOfValues](self, "numberOfValues"))
    {
      v5 = 0;
      v6 = 0.0;
      while (1)
      {
        -[HUPickerViewCell pickerView](self, "pickerView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUPickerViewCell pickerView:attributedTitleForRow:forComponent:](self, "pickerView:attributedTitleForRow:forComponent:", v7, v5, 0);
        v8 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();

        if (v8)
          break;
        -[HUPickerViewCell pickerView](self, "pickerView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUPickerViewCell pickerView:titleForRow:forComponent:](self, "pickerView:titleForRow:forComponent:", v11, v5, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v8 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v12);

          if (v8)
            break;
        }
        else
        {
          v8 = 0;
        }
LABEL_11:

        if (++v5 >= (unint64_t)-[HUPickerViewCell numberOfValues](self, "numberOfValues"))
          goto LABEL_12;
      }
      -[HUUnitPickerViewCell _estimatedSizeForAttributedString:](self, "_estimatedSizeForAttributedString:", v8);
      if (v9 > v6)
      {
        v10 = v9;
        v8 = v8;

        v4 = v8;
        v6 = v10;
      }
      goto LABEL_11;
    }
LABEL_12:
    v13 = self->_longestValue;
    self->_longestValue = v4;

    longestValue = self->_longestValue;
  }
  return longestValue;
}

- (CGSize)longestValueSize
{
  CGSize *p_longestValueSize;
  double width;
  double height;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGSize result;

  p_longestValueSize = &self->_longestValueSize;
  width = self->_longestValueSize.width;
  height = self->_longestValueSize.height;
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[HUUnitPickerViewCell longestValue](self, "longestValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUnitPickerViewCell _estimatedSizeForAttributedString:](self, "_estimatedSizeForAttributedString:", v7);
    p_longestValueSize->width = v8;
    p_longestValueSize->height = v9;

    width = p_longestValueSize->width;
    height = p_longestValueSize->height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)_estimatedSizeForAttributedString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  _QWORD v17[2];
  CGSize result;

  v17[1] = *MEMORY[0x1E0C80C00];
  v16 = *MEMORY[0x1E0CEA098];
  v4 = a3;
  -[HUUnitPickerViewCell unitLabel](self, "unitLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_attributedStringWithDefaultAttributes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "hf_attributedStringScaledByFactor:", 1.2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "size");
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (NSString)unitText
{
  return self->_unitText;
}

- (UILabel)unitLabel
{
  return self->_unitLabel;
}

- (void)setUnitLabel:(id)a3
{
  objc_storeStrong((id *)&self->_unitLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitLabel, 0);
  objc_storeStrong((id *)&self->_unitText, 0);
  objc_storeStrong((id *)&self->_longestValue, 0);
}

@end
