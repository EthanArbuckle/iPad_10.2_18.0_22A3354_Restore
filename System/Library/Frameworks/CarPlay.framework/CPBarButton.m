@implementation CPBarButton

- (CPBarButton)initWithImage:(UIImage *)image handler:(CPBarButtonHandler)handler
{
  UIImage *v7;
  CPBarButtonHandler v8;
  CPBarButton *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSUUID *identifier;
  objc_super v15;

  v7 = image;
  v8 = handler;
  v15.receiver = self;
  v15.super_class = (Class)CPBarButton;
  v9 = -[CPBarButton init](&v15, sel_init);
  if (v9)
  {
    v10 = MEMORY[0x212BA7CA8](v8);
    v11 = v9->_handler;
    v9->_handler = (id)v10;

    objc_storeStrong((id *)&v9->_image, image);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v12 = objc_claimAutoreleasedReturnValue();
    identifier = v9->_identifier;
    v9->_identifier = (NSUUID *)v12;

    v9->_enabled = 1;
    v9->_buttonStyle = 0;
  }

  return v9;
}

- (CPBarButton)initWithTitle:(NSString *)title handler:(CPBarButtonHandler)handler
{
  NSString *v7;
  CPBarButtonHandler v8;
  CPBarButton *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSUUID *identifier;
  objc_super v15;

  v7 = title;
  v8 = handler;
  v15.receiver = self;
  v15.super_class = (Class)CPBarButton;
  v9 = -[CPBarButton init](&v15, sel_init);
  if (v9)
  {
    v10 = MEMORY[0x212BA7CA8](v8);
    v11 = v9->_handler;
    v9->_handler = (id)v10;

    objc_storeStrong((id *)&v9->_title, title);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v12 = objc_claimAutoreleasedReturnValue();
    identifier = v9->_identifier;
    v9->_identifier = (NSUUID *)v12;

    v9->_enabled = 1;
    v9->_buttonStyle = 0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPBarButton)initWithCoder:(id)a3
{
  id v4;
  CPBarButton *v5;
  uint64_t v6;
  NSUUID *identifier;
  uint64_t v8;
  NSString *title;
  void *v10;
  objc_class *v11;
  uint64_t v12;
  UIImage *image;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CPBarButton;
  v5 = -[CPBarButton init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPBarButtonIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CPBarButtonEnabled"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPBarButtonTitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPBarButtonImage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    CPSanitizeImage(v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    image = v5->_image;
    v5->_image = (UIImage *)v12;

    v5->_buttonStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CPBarButtonStyle"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CPBarButton identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("CPBarButtonIdentifier"));

  objc_msgSend(v7, "encodeBool:forKey:", -[CPBarButton isEnabled](self, "isEnabled"), CFSTR("CPBarButtonEnabled"));
  -[CPBarButton title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("CPBarButtonTitle"));

  -[CPBarButton image](self, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("CPBarButtonImage"));

  objc_msgSend(v7, "encodeInteger:forKey:", -[CPBarButton buttonStyle](self, "buttonStyle"), CFSTR("CPBarButtonStyle"));
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)CPBarButton;
  -[CPBarButton description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPBarButton identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CPSStringFromBOOL(-[CPBarButton isEnabled](self, "isEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {UUID: %@, enabled: %@}"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)setEnabled:(BOOL)enabled
{
  _BOOL8 v3;
  id v5;

  if (self->_enabled != enabled)
  {
    v3 = enabled;
    self->_enabled = enabled;
    -[CPBarButton delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "control:setEnabled:", self, v3);

  }
}

- (void)setImage:(UIImage *)image
{
  UIImage *v4;
  objc_class *v5;
  UIImage *v6;
  UIImage *v7;
  id v8;

  if (self->_image != image)
  {
    v4 = image;
    v5 = (objc_class *)objc_opt_class();
    CPSanitizeImage(v4, v5);
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();

    v7 = self->_image;
    self->_image = v6;

    -[CPBarButton delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "barButton:setImage:", self, self->_image);

  }
}

- (void)setTitle:(NSString *)title
{
  NSString *v4;
  NSString *v5;
  void *v6;
  NSString *v7;

  v7 = title;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    v4 = (NSString *)-[NSString copy](v7, "copy");
    v5 = self->_title;
    self->_title = v4;

    -[CPBarButton delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "barButton:setTitle:", self, v7);

  }
}

- (void)handlePrimaryAction
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  CPBarButton *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[CPBarButton handler](self, "handler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  CarPlayFrameworkGeneralLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (uint64_t)v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = self;
      _os_log_impl(&dword_20D6F4000, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "%@ will call action handler", (uint8_t *)&v6, 0xCu);
    }

    -[CPBarButton handler](self, "handler");
    v5 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, CPBarButton *))(v5 + 16))(v5, self);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    -[CPMapButton handlePrimaryAction].cold.1((uint64_t)self, v5);
  }

}

- (CPBarButton)initWithType:(CPBarButtonType)type handler:(CPBarButtonHandler)handler
{
  CPBarButtonHandler v7;
  CPBarButton *v8;
  CPBarButton *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v7 = handler;
  if (type == CPBarButtonTypeImage)
  {
    v8 = -[CPBarButton initWithImage:handler:](self, "initWithImage:handler:", 0, v7);
  }
  else
  {
    if (type)
    {
      v10 = (void *)MEMORY[0x24BDBCE88];
      v11 = *MEMORY[0x24BDBCAB8];
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "raise:format:", v11, CFSTR("Invalid button type passed to %@"), v12);

      v9 = 0;
      goto LABEL_7;
    }
    v8 = -[CPBarButton initWithTitle:handler:](self, "initWithTitle:handler:", 0, v7);
  }
  self = v8;
  v9 = self;
LABEL_7:

  return v9;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (CPBarButtonStyle)buttonStyle
{
  return self->_buttonStyle;
}

- (void)setButtonStyle:(CPBarButtonStyle)buttonStyle
{
  self->_buttonStyle = buttonStyle;
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)title
{
  return self->_title;
}

- (CPBarButtonType)buttonType
{
  return self->_buttonType;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (CPBarButtonDelegate)delegate
{
  return (CPBarButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
