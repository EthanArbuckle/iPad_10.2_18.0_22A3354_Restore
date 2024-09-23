@implementation AVAction

+ (id)actionWithHandler:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AVAction;
  v3 = a3;
  objc_msgSendSuper2(&v6, sel_actionWithHandler_, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocalHandler:", v3, v6.receiver, v6.super_class);

  return v4;
}

+ (id)actionWithTitle:(id)a3 image:(id)a4 identifier:(id)a5 handler:(id)a6
{
  id v9;
  void *v10;
  objc_super v12;

  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___AVAction;
  v9 = a6;
  objc_msgSendSuper2(&v12, sel_actionWithTitle_image_identifier_handler_, a3, a4, a5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLocalHandler:", v9, v12.receiver, v12.super_class);

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
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
  void *v14;
  void *v15;

  v4 = (void *)objc_opt_class();
  -[UIMenuElement title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIMenuElement image](self, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAction identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAction localHandler](self, "localHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVAction contextMenu](self, "contextMenu");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContextMenu:", v10);

  objc_msgSend(v9, "setAttributes:", -[AVAction attributes](self, "attributes"));
  -[AVAction discoverabilityTitle](self, "discoverabilityTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDiscoverabilityTitle:", v11);

  objc_msgSend(v9, "setState:", -[AVAction state](self, "state"));
  -[AVAction tintColor](self, "tintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTintColor:", v12);

  -[AVAction accessibilityHint](self, "accessibilityHint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityHint:", v13);

  -[AVAction accessibilityLabel](self, "accessibilityLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityLabel:", v14);

  -[UIMenuElement accessibilityIdentifier](self, "accessibilityIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityIdentifier:", v15);

  return v9;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (UIMenu)contextMenu
{
  return self->_contextMenu;
}

- (void)setContextMenu:(id)a3
{
  objc_storeStrong((id *)&self->_contextMenu, a3);
}

- (id)localHandler
{
  return self->_localHandler;
}

- (void)setLocalHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_localHandler, 0);
  objc_storeStrong((id *)&self->_contextMenu, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
}

@end
