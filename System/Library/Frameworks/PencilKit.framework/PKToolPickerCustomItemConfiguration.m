@implementation PKToolPickerCustomItemConfiguration

- (PKToolPickerCustomItemConfiguration)initWithIdentifier:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  PKToolPickerCustomItemConfiguration *v8;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  NSString *name;
  NSDictionary *v13;
  NSDictionary *widthVariants;
  uint64_t v15;
  UIColor *defaultColor;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PKToolPickerCustomItemConfiguration;
  v8 = -[PKToolPickerCustomItemConfiguration init](&v18, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v11;

    v8->_defaultWidth = 0.0;
    v13 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    widthVariants = v8->_widthVariants;
    v8->_widthVariants = v13;

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v15 = objc_claimAutoreleasedReturnValue();
    defaultColor = v8->_defaultColor;
    v8->_defaultColor = (UIColor *)v15;

    *(_WORD *)&v8->_allowsColorSelection = 0;
    v8->_toolAttributeControls = 3;
  }

  return v8;
}

- (PKToolConfiguration)_toolConfigurationWithCustomToolItem:(uint64_t)a1
{
  id v3;
  id v4;
  id v5;
  PKToolConfiguration *v6;
  unint64_t v7;
  uint64_t v8;
  PKToolConfiguration *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD newValue[4];
  id v21;
  id v22;
  BOOL v23;
  id from;
  id location;

  v3 = a2;
  if (a1)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3870]);
    v5 = objc_alloc_init(MEMORY[0x1E0DC3508]);
    v6 = -[PKToolConfiguration initWithLocalizedName:baseImage:shadowPath:]([PKToolConfiguration alloc], "initWithLocalizedName:baseImage:shadowPath:", *(_QWORD *)(a1 + 24), v4, v5);
    v7 = objc_msgSend(*(id *)(a1 + 56), "count");
    if (v7 >= 2)
      -[PKToolConfiguration setStrokeWeightsToButtonImages:](v6, "setStrokeWeightsToButtonImages:", *(_QWORD *)(a1 + 56));
    if (*(_BYTE *)(a1 + 8))
    {
      v8 = *(_QWORD *)(a1 + 64);
      v9 = v6;
      v10 = 1;
      v11 = 1;
    }
    else
    {
      v9 = v6;
      v10 = 0;
      v11 = 0;
      v8 = 0;
    }
    -[PKToolConfiguration setSupportsColor:andOpacity:defaultColor:](v9, "setSupportsColor:andOpacity:defaultColor:", v10, v11, v8);
    if (v6)
    {
      v6->_wantsStrokeWeightControl = *(_BYTE *)(a1 + 72) & 1;
      v6->_wantsOpacityControl = (*(_BYTE *)(a1 + 72) & 2) != 0;
      v6->_supportsLassoBehaviors = *(_BYTE *)(a1 + 9);
    }
    objc_initWeak(&location, (id)a1);
    objc_initWeak(&from, v3);
    objc_msgSend((id)a1, "imageProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = MEMORY[0x1E0C809B0];
    if (v12)
    {
      newValue[0] = MEMORY[0x1E0C809B0];
      newValue[1] = 3221225472;
      newValue[2] = __76__PKToolPickerCustomItemConfiguration__toolConfigurationWithCustomToolItem___block_invoke;
      newValue[3] = &unk_1E77791C8;
      objc_copyWeak(&v21, &location);
      objc_copyWeak(&v22, &from);
      v23 = v7 > 1;
      if (v6)
        objc_setProperty_nonatomic_copy(v6, v14, newValue, 160);
      objc_destroyWeak(&v22);
      objc_destroyWeak(&v21);
    }
    objc_msgSend((id)a1, "viewControllerProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v17[0] = v13;
      v17[1] = 3221225472;
      v17[2] = __76__PKToolPickerCustomItemConfiguration__toolConfigurationWithCustomToolItem___block_invoke_2;
      v17[3] = &unk_1E77791F0;
      objc_copyWeak(&v18, &location);
      objc_copyWeak(&v19, &from);
      -[PKToolConfiguration setViewControllerProvider:](v6, "setViewControllerProvider:", v17);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&v18);
    }
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id __76__PKToolPickerCustomItemConfiguration__toolConfigurationWithCustomToolItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BYTE *WeakRetained;
  id v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = v5;
  if (WeakRetained && v5)
  {
    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(v3, "weight");
      objc_msgSend(v6, "setWidth:");
    }
    if (WeakRetained[8])
    {
      objc_msgSend(v3, "color");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setColor:", v7);

    }
    objc_msgSend(WeakRetained, "imageProvider");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v8)[2](v8, v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0DC3870]);
  }

  return v9;
}

id __76__PKToolPickerCustomItemConfiguration__toolConfigurationWithCustomToolItem___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = v3;
  if (WeakRetained && v3)
  {
    objc_msgSend(WeakRetained, "viewControllerProvider");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithIdentifier:name:", self->_identifier, self->_name);
  v5 = (void *)objc_msgSend(self->_imageProvider, "copy");
  objc_msgSend(v4, "setImageProvider:", v5);

  v6 = (void *)objc_msgSend(self->_viewControllerProvider, "copy");
  objc_msgSend(v4, "setViewControllerProvider:", v6);

  objc_msgSend(v4, "setDefaultWidth:", self->_defaultWidth);
  v7 = (void *)-[NSDictionary copy](self->_widthVariants, "copy");
  objc_msgSend(v4, "setWidthVariants:", v7);

  objc_msgSend(v4, "setDefaultColor:", self->_defaultColor);
  objc_msgSend(v4, "setAllowsColorSelection:", self->_allowsColorSelection);
  objc_msgSend(v4, "setToolAttributeControls:", self->_toolAttributeControls);
  objc_msgSend(v4, "_setSupportsLassoBehaviors:", self->_supportsLassoBehaviors);
  return v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PKToolPickerCustomItemConfiguration identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)imageProvider
{
  return self->_imageProvider;
}

- (void)setImageProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)viewControllerProvider
{
  return self->_viewControllerProvider;
}

- (void)setViewControllerProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (double)defaultWidth
{
  return self->_defaultWidth;
}

- (void)setDefaultWidth:(double)a3
{
  self->_defaultWidth = a3;
}

- (NSDictionary)widthVariants
{
  return self->_widthVariants;
}

- (void)setWidthVariants:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (UIColor)defaultColor
{
  return self->_defaultColor;
}

- (void)setDefaultColor:(id)a3
{
  objc_storeStrong((id *)&self->_defaultColor, a3);
}

- (BOOL)allowsColorSelection
{
  return self->_allowsColorSelection;
}

- (void)setAllowsColorSelection:(BOOL)a3
{
  self->_allowsColorSelection = a3;
}

- (unint64_t)toolAttributeControls
{
  return self->_toolAttributeControls;
}

- (void)setToolAttributeControls:(unint64_t)a3
{
  self->_toolAttributeControls = a3;
}

- (BOOL)_supportsLassoBehaviors
{
  return self->_supportsLassoBehaviors;
}

- (void)_setSupportsLassoBehaviors:(BOOL)a3
{
  self->_supportsLassoBehaviors = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultColor, 0);
  objc_storeStrong((id *)&self->_widthVariants, 0);
  objc_storeStrong(&self->_viewControllerProvider, 0);
  objc_storeStrong(&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
