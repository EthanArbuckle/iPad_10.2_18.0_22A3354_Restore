@implementation NTKCFaceDetailEnumeratedEditOptionCell

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (double)rowHeight
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 44.0);
  v4 = v3;

  return v4;
}

- (NTKCFaceDetailEnumeratedEditOptionCell)initWithEditOption:(id)a3
{
  id v5;
  NTKCFaceDetailEnumeratedEditOptionCell *v6;
  NTKCFaceDetailEnumeratedEditOptionCell *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NTKCFaceDetailEnumeratedEditOptionCell;
  v6 = -[NTKCDetailTableViewCell init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    -[NTKCFaceDetailEnumeratedEditOptionCell setSelectionStyle:](v6, "setSelectionStyle:", 3);
    -[NTKCDetailTableViewCell setShowsSeparator:](v7, "setShowsSeparator:", 1);
    NTKCActionColor();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailEnumeratedEditOptionCell setTintColor:](v7, "setTintColor:", v8);

    objc_storeStrong((id *)&v7->_editOption, a3);
    -[NTKEditOption localizedName](v7->_editOption, "localizedName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailEnumeratedEditOptionCell textLabel](v7, "textLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v9);

    -[NTKCFaceDetailEnumeratedEditOptionCell textLabel](v7, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", &stru_1E6BDC918);
    -[NTKCFaceDetailEnumeratedEditOptionCell textLabel](v7, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHidden:", v13);

  }
  return v7;
}

- (void)setActive:(BOOL)a3
{
  uint64_t v3;

  if (self->_active != a3)
  {
    self->_active = a3;
    if (a3)
      v3 = 3;
    else
      v3 = 0;
    -[NTKCFaceDetailEnumeratedEditOptionCell setAccessoryType:](self, "setAccessoryType:", v3);
  }
}

- (BOOL)active
{
  return self->_active;
}

- (NTKEditOption)editOption
{
  return self->_editOption;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editOption, 0);
}

@end
