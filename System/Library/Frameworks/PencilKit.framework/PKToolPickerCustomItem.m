@implementation PKToolPickerCustomItem

- (PKToolPickerCustomItem)initWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  PKCustomTool *v14;
  void *v15;
  PKCustomTool *v16;
  PKToolPickerCustomItem *v17;
  id *p_isa;
  void *v19;
  void *v20;
  const char *v21;
  void *v22;
  uint64_t v24;
  id v25;
  id location;
  objc_super v27;

  v4 = a3;
  objc_msgSend(v4, "defaultColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultWidth");
  v7 = v6;
  v8 = v4;
  v9 = v5;
  if (self)
  {
    v10 = (void *)objc_msgSend(v8, "copy");
    -[PKToolPickerCustomItemConfiguration _toolConfigurationWithCustomToolItem:]((uint64_t)v10, self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "supportsColor"))
      v12 = v9;
    else
      v12 = 0;
    v13 = v12;
    if (!objc_msgSend(v11, "supportsStrokeWeight"))
      v7 = 0.0;
    v14 = [PKCustomTool alloc];
    objc_msgSend(v10, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PKCustomTool initWithCustomIdentifier:configuration:color:weight:](v14, "initWithCustomIdentifier:configuration:color:weight:", v15, v11, v13, v7);

    v27.receiver = self;
    v27.super_class = (Class)PKToolPickerCustomItem;
    v17 = -[PKToolPickerItem initWithTool:](&v27, sel_initWithTool_, v16);
    p_isa = (id *)&v17->super.super.isa;
    if (v17)
    {
      objc_storeStrong((id *)&v17->_configuration, v10);
      objc_msgSend(p_isa[3], "imageProvider");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_initWeak(&location, p_isa);
        v24 = MEMORY[0x1E0C809B0];
        objc_copyWeak(&v25, &location);
        -[PKTool _configuration](v16, "_configuration", v24, 3221225472, __60__PKToolPickerCustomItem_initWithConfiguration_color_width___block_invoke, &unk_1E777D558);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v20;
        if (v20)
          objc_setProperty_nonatomic_copy(v20, v21, &v24, 160);

        objc_destroyWeak(&v25);
        objc_destroyWeak(&location);
      }
    }
    self = p_isa;

  }
  return self;
}

id __60__PKToolPickerCustomItem_initWithConfiguration_color_width___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  id v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (void *)objc_msgSend(WeakRetained, "copy");
    objc_msgSend(v3, "color");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setColor:shouldCallObserver:", v7, 0);
    objc_msgSend(v3, "weight");
    v9 = v8;
    v10 = 0.0;
    if (v9 >= 0.0)
      objc_msgSend(v3, "weight", 0.0);
    objc_msgSend(v6, "_setWidth:shouldCallObserver:", 0, v10);
    objc_msgSend(v5, "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageProvider");
    v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v12)[2](v12, v6);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = objc_alloc_init(MEMORY[0x1E0DC3870]);
  }

  return v13;
}

- (BOOL)allowsColorSelection
{
  void *v2;
  void *v3;
  char v4;

  -[PKToolPickerItem _tool](self, "_tool");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsColor");

  return v4;
}

- (void)setAllowsColorSelection:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  PKCustomTool *v11;
  void *v12;
  void *v13;
  PKCustomTool *v14;
  id v15;

  v3 = a3;
  -[PKToolPickerItem _tool](self, "_tool");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v6, "copy");

  objc_msgSend(v15, "defaultColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSupportsColor:andOpacity:defaultColor:", v3, v3, v7);

  if (objc_msgSend(v15, "supportsColor"))
  {
    -[PKToolPickerItem color](self, "color");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9 = 0.0;
  if (objc_msgSend(v15, "supportsStrokeWeight"))
  {
    -[PKToolPickerItem width](self, "width");
    v9 = v10;
  }
  v11 = [PKCustomTool alloc];
  -[PKToolPickerCustomItem configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PKCustomTool initWithCustomIdentifier:configuration:color:weight:](v11, "initWithCustomIdentifier:configuration:color:weight:", v13, v15, v8, v9);

  -[PKToolPickerItem _updateTool:shouldCallObserver:](self, "_updateTool:shouldCallObserver:", v14, 1);
}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PKToolPickerItem _tool](self, "_tool");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ink");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[PKToolPickerItem identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("identifier"));

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[PKToolPickerItem _tool](self, "_tool");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (_QWORD *)objc_msgSend(v4, "initWithTool:", v5);

  if (v6)
  {
    v7 = -[PKToolPickerCustomItemConfiguration copy](self->_configuration, "copy");
    v8 = (void *)v6[3];
    v6[3] = v7;

  }
  return v6;
}

- (id)_toolCopyWithColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  PKCustomTool *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PKCustomTool *v14;

  v4 = a3;
  -[PKToolPickerItem _tool](self, "_tool");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0.0;
  if (objc_msgSend(v6, "supportsStrokeWeight"))
  {
    -[PKToolPickerItem width](self, "width");
    v7 = v8;
  }

  v9 = [PKCustomTool alloc];
  -[PKToolPickerCustomItem configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKToolPickerItem _tool](self, "_tool");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PKCustomTool initWithCustomIdentifier:configuration:color:weight:](v9, "initWithCustomIdentifier:configuration:color:weight:", v11, v13, v4, v7);

  return v14;
}

- (id)_toolCopyWithWidth:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  PKCustomTool *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PKCustomTool *v13;

  -[PKToolPickerItem _tool](self, "_tool");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "supportsColor"))
  {
    -[PKToolPickerItem color](self, "color");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  v8 = [PKCustomTool alloc];
  -[PKToolPickerCustomItem configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKToolPickerItem _tool](self, "_tool");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PKCustomTool initWithCustomIdentifier:configuration:color:weight:](v8, "initWithCustomIdentifier:configuration:color:weight:", v10, v12, v7, a3);

  return v13;
}

- (PKToolPickerCustomItemConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
