@implementation AKMarkupBarButtonItem

+ (id)markupBarButtonWithTarget:(id)a3 action:(SEL)a4
{
  id v5;
  AKMarkupBarButtonItem *v6;

  v5 = a3;
  v6 = objc_alloc_init(AKMarkupBarButtonItem);
  -[AKMarkupBarButtonItem setTarget:](v6, "setTarget:", v5);

  -[AKMarkupBarButtonItem setAction:](v6, "setAction:", a4);
  return v6;
}

- (AKMarkupBarButtonItem)init
{
  AKMarkupBarButtonItem *v2;
  AKMarkupButtonContainerView *v3;
  uint64_t v4;
  AKMarkupButtonContainerView *toggleView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AKMarkupBarButtonItem;
  v2 = -[UIBarItem init](&v7, sel_init);
  if (v2)
  {
    v3 = [AKMarkupButtonContainerView alloc];
    v4 = -[AKMarkupButtonContainerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    toggleView = v2->_toggleView;
    v2->_toggleView = (AKMarkupButtonContainerView *)v4;

    -[AKMarkupBarButtonItem setCustomView:](v2, "setCustomView:", v2->_toggleView);
  }
  return v2;
}

- (void)setTarget:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AKMarkupBarButtonItem;
  -[AKMarkupBarButtonItem setTarget:](&v9, sel_setTarget_, a3);
  -[AKMarkupBarButtonItem toggleView](self, "toggleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL);

  -[AKMarkupBarButtonItem toggleView](self, "toggleView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "button");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKMarkupBarButtonItem target](self, "target");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addTarget:action:forControlEvents:", v8, -[AKMarkupBarButtonItem action](self, "action"), 64);

}

- (void)setAction:(SEL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AKMarkupBarButtonItem;
  -[AKMarkupBarButtonItem setAction:](&v9, sel_setAction_, a3);
  -[AKMarkupBarButtonItem toggleView](self, "toggleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL);

  -[AKMarkupBarButtonItem toggleView](self, "toggleView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "button");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKMarkupBarButtonItem target](self, "target");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addTarget:action:forControlEvents:", v8, -[AKMarkupBarButtonItem action](self, "action"), 64);

}

- (void)setSelected:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKMarkupBarButtonItem;
  -[AKMarkupBarButtonItem setSelected:](&v5, sel_setSelected_, a3);
  -[AKMarkupBarButtonItem toggleView](self, "toggleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelected:", -[AKMarkupBarButtonItem isSelected](self, "isSelected"));

}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AKMarkupBarButtonItem;
  -[AKMarkupBarButtonItem setEnabled:](&v7, sel_setEnabled_);
  -[AKMarkupBarButtonItem toggleView](self, "toggleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v3);

}

- (UIButton)toggleButton
{
  return self->_toggleButton;
}

- (void)setToggleButton:(id)a3
{
  objc_storeStrong((id *)&self->_toggleButton, a3);
}

- (AKMarkupButtonContainerView)toggleView
{
  return self->_toggleView;
}

- (void)setToggleView:(id)a3
{
  objc_storeStrong((id *)&self->_toggleView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggleView, 0);
  objc_storeStrong((id *)&self->_toggleButton, 0);
}

@end
