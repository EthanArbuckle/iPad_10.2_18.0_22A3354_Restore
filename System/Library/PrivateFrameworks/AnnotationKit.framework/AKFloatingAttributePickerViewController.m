@implementation AKFloatingAttributePickerViewController

- (AKFloatingAttributePickerViewController)initWithController:(id)a3
{
  id v4;
  AKFloatingAttributePickerViewController *v5;
  AKFloatingAttributePickerViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKFloatingAttributePickerViewController;
  v5 = -[AKFloatingAttributePickerViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
    -[AKFloatingAttributePickerViewController setController:](v5, "setController:", v4);

  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  AKColorPaletteView *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_super v42;
  _QWORD v43[3];

  v43[2] = *MEMORY[0x24BDAC8D0];
  v42.receiver = self;
  v42.super_class = (Class)AKFloatingAttributePickerViewController;
  -[AKFloatingAttributePickerViewController viewDidLoad](&v42, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKFloatingAttributePickerViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[AKFloatingAttributePickerViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[AKFloatingAttributePickerViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD1628];
  _NSDictionaryOfVariableBindings(CFSTR("view"), v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[view(44)]"), 0, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activateConstraints:", v9);

  -[AKFloatingAttributePickerViewController controller](self, "controller");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x24BDF6F10]);
  v12 = *MEMORY[0x24BDBF090];
  v13 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v14 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v15 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v16 = (void *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x24BDBF090], v13, v14, v15);
  -[AKFloatingAttributePickerViewController setToolbar:](self, "setToolbar:", v16);

  -[AKFloatingAttributePickerViewController toolbar](self, "toolbar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(v10, "toolbarView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "tintColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKFloatingAttributePickerViewController toolbar](self, "toolbar");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTintColor:", v19);

  -[AKFloatingAttributePickerViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKFloatingAttributePickerViewController toolbar](self, "toolbar");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", v22);

  v23 = -[AKColorPaletteView initWithFrame:]([AKColorPaletteView alloc], "initWithFrame:", v12, v13, v14, v15);
  -[AKFloatingAttributePickerViewController setColorPalette:](self, "setColorPalette:", v23);

  -[AKFloatingAttributePickerViewController colorPalette](self, "colorPalette");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setScrollDirection:", 1);

  -[AKFloatingAttributePickerViewController colorPalette](self, "colorPalette");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

  -[AKFloatingAttributePickerViewController colorPalette](self, "colorPalette");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFrame:", 0.0, 0.0, 256.0, 44.0);

  -[AKFloatingAttributePickerViewController colorPalette](self, "colorPalette");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTag:", 765101);

  -[AKFloatingAttributePickerViewController colorPalette](self, "colorPalette");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addTarget:action:forControlEvents:", self, sel_valueChanged_, 4096);

  v29 = objc_alloc(MEMORY[0x24BDF6860]);
  -[AKFloatingAttributePickerViewController colorPalette](self, "colorPalette");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v29, "initWithCustomView:", v30);
  -[AKFloatingAttributePickerViewController setColorPaletteButtonItem:](self, "setColorPaletteButtonItem:", v31);

  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  -[AKFloatingAttributePickerViewController colorPaletteButtonItem](self, "colorPaletteButtonItem");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v33;
  v43[1] = v32;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKFloatingAttributePickerViewController setStaticItems:](self, "setStaticItems:", v34);

  -[AKFloatingAttributePickerViewController staticItems](self, "staticItems");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKFloatingAttributePickerViewController toolbar](self, "toolbar");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setItems:", v35);

  _NSDictionaryOfVariableBindings(CFSTR("_toolbar"), self->_toolbar, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_toolbar]|"), 0, 0, v37);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "activateConstraints:", v39);

  v40 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[_toolbar]|"), 0, 0, v37);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "activateConstraints:", v41);

}

- (void)valueChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[AKFloatingAttributePickerViewController controller](self, "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_color, v5);
  if (-[AKFloatingAttributePickerViewController colorAttributeTag](self, "colorAttributeTag") == 765101)
  {
    objc_msgSend(v4, "performActionForSender:", v8);
  }
  else if (-[AKFloatingAttributePickerViewController colorAttributeTag](self, "colorAttributeTag") == 765106)
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendAction:to:from:forEvent:", sel_performActionForSender_, v7, self, 0);

  }
  else
  {
    NSLog(CFSTR("%s called with incorrect colorAttributeTag %ld"), "-[AKFloatingAttributePickerViewController valueChanged:]", -[AKFloatingAttributePickerViewController colorAttributeTag](self, "colorAttributeTag"));
  }

}

- (void)setColor:(id)a3
{
  void *v5;
  UIColor *v6;

  v6 = (UIColor *)a3;
  if (self->_color != v6)
  {
    objc_storeStrong((id *)&self->_color, a3);
    -[AKFloatingAttributePickerViewController colorPalette](self, "colorPalette");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setColor:", v6);

  }
}

- (void)setRightButtonItems:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  if ((objc_msgSend(v10, "isEqualToArray:", self->_rightButtonItems) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_rightButtonItems, a3);
    -[AKFloatingAttributePickerViewController staticItems](self, "staticItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "addObjectsFromArray:", v10);
    -[AKFloatingAttributePickerViewController toolbar](self, "toolbar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setItems:animated:", v8, v4);

  }
}

- (NSArray)rightButtonItems
{
  return self->_rightButtonItems;
}

- (void)setColorAttributeTag:(int64_t)a3
{
  self->_colorAttributeTag = a3;
  self->_tag = a3;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  CGRect v14;

  -[AKFloatingAttributePickerViewController toolbar](self, "toolbar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v4 = CGRectGetWidth(v14) + -100.0;

  if (v4 > 0.0)
  {
    -[AKFloatingAttributePickerViewController colorPalette](self, "colorPalette");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;

    if (v4 >= 256.0)
      v12 = 256.0;
    else
      v12 = 200.0;
    -[AKFloatingAttributePickerViewController colorPalette](self, "colorPalette");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v7, v9, v12, v11);

  }
}

- (id)convertTextAttributes:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = *MEMORY[0x24BDF6600];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDF6600]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKFloatingAttributePickerViewController color](self, "color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_msgSend(v6, "akIsEqualToColor:", v7) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    if (v4)
    {
      v9 = (void *)objc_msgSend(v4, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = v9;
    objc_msgSend(v9, "setObject:forKey:", v7, v5);
  }
  if (v8)
    v10 = v8;
  else
    v10 = v4;
  v11 = v10;

  return v11;
}

- (UIToolbar)toolbar
{
  return self->_toolbar;
}

- (void)setToolbar:(id)a3
{
  objc_storeStrong((id *)&self->_toolbar, a3);
}

- (UIColor)color
{
  return self->_color;
}

- (int64_t)colorAttributeTag
{
  return self->_colorAttributeTag;
}

- (AKController)controller
{
  return (AKController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (AKColorPaletteView)colorPalette
{
  return self->_colorPalette;
}

- (void)setColorPalette:(id)a3
{
  objc_storeStrong((id *)&self->_colorPalette, a3);
}

- (UIBarButtonItem)colorPaletteButtonItem
{
  return self->_colorPaletteButtonItem;
}

- (void)setColorPaletteButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_colorPaletteButtonItem, a3);
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (NSArray)staticItems
{
  return self->_staticItems;
}

- (void)setStaticItems:(id)a3
{
  objc_storeStrong((id *)&self->_staticItems, a3);
}

- (void)setRightButtonItems:(id)a3
{
  objc_storeStrong((id *)&self->_rightButtonItems, a3);
}

- (int64_t)tag
{
  return self->_tag;
}

- (void)setTag:(int64_t)a3
{
  self->_tag = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightButtonItems, 0);
  objc_storeStrong((id *)&self->_staticItems, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_colorPaletteButtonItem, 0);
  objc_storeStrong((id *)&self->_colorPalette, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
}

@end
