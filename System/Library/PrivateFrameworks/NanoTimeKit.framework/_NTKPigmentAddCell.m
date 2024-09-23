@implementation _NTKPigmentAddCell

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (_NTKPigmentAddCell)initWithFrame:(CGRect)a3
{
  _NTKPigmentAddCell *v3;
  uint64_t v4;
  UIImageView *swatch;
  uint64_t v6;
  UIImageView *check;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_NTKPigmentAddCell;
  v3 = -[_NTKPigmentAddCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new();
    swatch = v3->_swatch;
    v3->_swatch = (UIImageView *)v4;

    -[_NTKPigmentAddCell addSubview:](v3, "addSubview:", v3->_swatch);
    v6 = objc_opt_new();
    check = v3->_check;
    v3->_check = (UIImageView *)v6;

    BPSBackgroundColor();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v3->_check, "setTintColor:", v8);

    -[UIImageView setHidden:](v3->_check, "setHidden:", 1);
    -[_NTKPigmentAddCell addSubview:](v3, "addSubview:", v3->_check);
  }
  return v3;
}

- (void)setDevice:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_device) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_device, a3);
    -[_NTKPigmentAddCell _updateCheck](self, "_updateCheck");
  }

}

- (void)setPrimaryColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_primaryColor) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_primaryColor, a3);
    -[_NTKPigmentAddCell _updateCheck](self, "_updateCheck");
  }

}

- (void)_updateCheck
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  if (_LayoutConstants_onceToken != -1)
    dispatch_once(&_LayoutConstants_onceToken, &__block_literal_global_338);
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 7, *(double *)&_LayoutConstants__constants_1_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_primaryColor)
  {
    v4 = (void *)MEMORY[0x1E0DC3888];
    v10[0] = self->_primaryColor;
    BPSBackgroundColor();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configurationWithPaletteColors:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "configurationByApplyingConfiguration:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v8;
  }
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("checkmark.circle.fill"), v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_check, "setImage:", v9);
  -[UIImageView sizeToFit](self->_check, "sizeToFit");
  -[_NTKPigmentAddCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NTKPigmentAddCell;
  -[_NTKPigmentAddCell layoutSubviews](&v3, sel_layoutSubviews);
  -[_NTKPigmentAddCell bounds](self, "bounds");
  -[UIImageView setFrame:](self->_swatch, "setFrame:");
  -[UIImageView frame](self->_check, "frame");
  UIRectCenteredRect();
  -[UIImageView setFrame:](self->_check, "setFrame:");
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_NTKPigmentAddCell;
  -[_NTKPigmentAddCell setSelected:](&v5, sel_setSelected_);
  -[UIImageView setHidden:](self->_check, "setHidden:", !v3);
}

- (void)setImage:(id)a3
{
  -[UIImageView setImage:](self->_swatch, "setImage:", a3);
}

- (CLKDevice)device
{
  return self->_device;
}

- (UIColor)primaryColor
{
  return self->_primaryColor;
}

- (NTKPigmentEditOption)pigmentEditOption
{
  return self->_pigmentEditOption;
}

- (void)setPigmentEditOption:(id)a3
{
  objc_storeStrong((id *)&self->_pigmentEditOption, a3);
}

- (UIImageView)swatch
{
  return self->_swatch;
}

- (UIImageView)check
{
  return self->_check;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_check, 0);
  objc_storeStrong((id *)&self->_swatch, 0);
  objc_storeStrong((id *)&self->_pigmentEditOption, 0);
  objc_storeStrong((id *)&self->_primaryColor, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
