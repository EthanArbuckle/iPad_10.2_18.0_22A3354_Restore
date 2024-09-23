@implementation AKColorPickerViewController

- (AKColorPickerViewController)initWithController:(id)a3
{
  id v4;
  AKColorPickerViewController *v5;
  AKColorPickerViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKColorPickerViewController;
  v5 = -[AKColorPickerViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    -[AKColorPickerViewController setController:](v5, "setController:", v4);
    -[AKColorPickerViewController setPreferredContentSize:](v6, "setPreferredContentSize:", 60.0, 382.0);
  }

  return v6;
}

- (void)viewDidLoad
{
  AKColorPaletteView *v3;
  double v4;
  double v5;
  double v6;
  AKColorPaletteView *v7;
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
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)AKColorPickerViewController;
  -[AKColorPickerViewController viewDidLoad](&v19, sel_viewDidLoad);
  v3 = [AKColorPaletteView alloc];
  -[AKColorPickerViewController preferredContentSize](self, "preferredContentSize");
  v5 = v4;
  -[AKColorPickerViewController preferredContentSize](self, "preferredContentSize");
  v7 = -[AKColorPaletteView initWithFrame:](v3, "initWithFrame:", 0.0, 0.0, v5, v6);
  -[AKColorPickerViewController setColorPalette:](self, "setColorPalette:", v7);

  -[AKColorPickerViewController colorPalette](self, "colorPalette");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setScrollDirection:", 0);

  -[AKColorPickerViewController colorPalette](self, "colorPalette");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[AKColorPickerViewController colorPalette](self, "colorPalette");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTag:", 765101);

  -[AKColorPickerViewController colorPalette](self, "colorPalette");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel_valueChanged_, 4096);

  -[AKColorPickerViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKColorPickerViewController colorPalette](self, "colorPalette");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v13);

  _NSDictionaryOfVariableBindings(CFSTR("_colorPalette"), self->_colorPalette, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_colorPalette]|"), 0, 0, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activateConstraints:", v16);

  v17 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_colorPalette]|"), 0, 0, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "activateConstraints:", v18);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKColorPickerViewController;
  -[AKColorPickerViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[AKColorPickerViewController color](self, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKColorPickerViewController colorPalette](self, "colorPalette");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColor:", v4);

}

- (void)valueChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[AKColorPickerViewController colorPalette](self, "colorPalette");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKColorPickerViewController setColor:](self, "setColor:", v5);

  -[AKColorPickerViewController controller](self, "controller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AKColorPickerViewController colorAttributeTag](self, "colorAttributeTag") == 765101)
  {
    objc_msgSend(v6, "performActionForSender:", v9);
  }
  else if (-[AKColorPickerViewController colorAttributeTag](self, "colorAttributeTag") == 765106)
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sendAction:to:from:forEvent:", sel_performActionForSender_, v8, self, 0);

  }
  else
  {
    NSLog(CFSTR("%s called with incorrect colorAttributeTag %ld"), "-[AKColorPickerViewController valueChanged:]", -[AKColorPickerViewController colorAttributeTag](self, "colorAttributeTag"));
  }

}

- (void)setColorAttributeTag:(int64_t)a3
{
  self->_colorAttributeTag = a3;
  self->_tag = a3;
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
  -[AKColorPickerViewController color](self, "color");
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

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
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
  objc_storeStrong((id *)&self->_colorPalette, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
