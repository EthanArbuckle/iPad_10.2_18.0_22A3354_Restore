@implementation PKToolPickerInkingItem

- (PKToolPickerInkingItem)initWithInkType:(id)a3
{
  id v4;
  void *v5;
  PKToolPickerInkingItem *v6;

  v4 = a3;
  +[PKToolConfiguration defaultColorForInkingToolWithIdentifier:]((uint64_t)PKToolConfiguration, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKInkingTool defaultWidthForInkType:](PKInkingTool, "defaultWidthForInkType:", v4);
  v6 = -[PKToolPickerInkingItem initWithInkType:color:width:identifier:](self, "initWithInkType:color:width:identifier:", v4, v5, 0);

  return v6;
}

- (PKToolPickerInkingItem)initWithInkType:(id)a3 color:(id)a4
{
  id v6;
  id v7;
  PKToolPickerInkingItem *v8;

  v6 = a4;
  v7 = a3;
  +[PKInkingTool defaultWidthForInkType:](PKInkingTool, "defaultWidthForInkType:", v7);
  v8 = -[PKToolPickerInkingItem initWithInkType:color:width:identifier:](self, "initWithInkType:color:width:identifier:", v7, v6, 0);

  return v8;
}

- (PKToolPickerInkingItem)initWithInkType:(id)a3 width:(double)a4
{
  id v6;
  void *v7;
  PKToolPickerInkingItem *v8;

  v6 = a3;
  +[PKToolConfiguration defaultColorForInkingToolWithIdentifier:]((uint64_t)PKToolConfiguration, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PKToolPickerInkingItem initWithInkType:color:width:identifier:](self, "initWithInkType:color:width:identifier:", v6, v7, 0, a4);

  return v8;
}

- (PKToolPickerInkingItem)initWithInkType:(id)a3 color:(id)a4 width:(double)a5
{
  return -[PKToolPickerInkingItem initWithInkType:color:width:identifier:](self, "initWithInkType:color:width:identifier:", a3, a4, 0, a5);
}

- (PKToolPickerInkingItem)initWithInkType:(id)a3 color:(id)a4 width:(double)a5 identifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  PKInkingTool *v13;
  PKToolPickerInkingItem *v14;
  objc_super v16;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = -[PKInkingTool initWithInkType:color:width:]([PKInkingTool alloc], "initWithInkType:color:width:", v12, v11, a5);

  v16.receiver = self;
  v16.super_class = (Class)PKToolPickerInkingItem;
  v14 = -[PKToolPickerItem initWithTool:identifier:](&v16, sel_initWithTool_identifier_, v13, v10);

  return v14;
}

- (PKInkingTool)inkingTool
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class();
  -[PKToolPickerItem _tool](self, "_tool");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKDynamicCast(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKInkingTool *)v5;
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
  PKInkingTool *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a3;
  -[PKToolPickerItem _tool](self, "_tool");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v6, "copy");

  objc_msgSend(v14, "defaultColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSupportsColor:andOpacity:defaultColor:", v3, v3, v7);

  v8 = [PKInkingTool alloc];
  -[PKToolPickerInkingItem inkingTool](self, "inkingTool");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ink");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PKTool _initWithInk:configuration:](v8, "_initWithInk:configuration:", v10, v14);

  -[PKToolPickerItem _tool](self, "_tool");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_toolPickerItemIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setToolPickerItemIdentifier:", v13);

  -[PKToolPickerItem _updateTool:shouldCallObserver:](self, "_updateTool:shouldCallObserver:", v11, 1);
}

- (double)width
{
  void *v2;
  double v3;
  double v4;

  -[PKToolPickerInkingItem inkingTool](self, "inkingTool");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "width");
  v4 = v3;

  return v4;
}

+ (PKToolPickerInkingItem)_defaultInkingItemForType:(uint64_t)a1
{
  id v2;
  void *v3;
  double v4;
  PKToolPickerInkingItem *v5;

  v2 = a2;
  objc_opt_self();
  +[PKToolConfiguration defaultColorForInkingToolWithIdentifier:]((uint64_t)PKToolConfiguration, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKInkingTool defaultWidthForInkType:](PKInkingTool, "defaultWidthForInkType:", v2);
  v5 = -[PKToolPickerInkingItem initWithInkType:color:width:]([PKToolPickerInkingItem alloc], "initWithInkType:color:width:", v2, v3, v4);

  return v5;
}

- (id)_toolCopyWithWidth:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  PKInkingTool *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  -[PKToolPickerInkingItem inkingTool](self, "inkingTool");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inkType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKInkingTool _weightForWidth:type:](PKInkingTool, "_weightForWidth:type:", v7, a3);
  v9 = v8;

  objc_msgSend(v6, "inkType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "color");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKInk inkWithType:color:weight:](PKInk, "inkWithType:color:weight:", v10, v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = [PKInkingTool alloc];
  objc_msgSend(v5, "_configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PKTool _initWithInk:configuration:](v13, "_initWithInk:configuration:", v12, v14);

  -[PKToolPickerItem _tool](self, "_tool");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_toolPickerItemIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_setToolPickerItemIdentifier:", v17);

  return v15;
}

- (id)_toolCopyWithColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PKInkingTool *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[PKToolPickerInkingItem inkingTool](self, "inkingTool");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inkType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "weight");
  +[PKInk inkWithType:color:weight:](PKInk, "inkWithType:color:weight:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [PKInkingTool alloc];
  objc_msgSend(v5, "_configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PKTool _initWithInk:configuration:](v9, "_initWithInk:configuration:", v8, v10);

  -[PKToolPickerItem _tool](self, "_tool");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_toolPickerItemIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setToolPickerItemIdentifier:", v13);

  return v11;
}

- (BOOL)_toolShouldBeSetOnCanvasView
{
  return 1;
}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PKToolPickerInkingItem inkingTool](self, "inkingTool");
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

@end
