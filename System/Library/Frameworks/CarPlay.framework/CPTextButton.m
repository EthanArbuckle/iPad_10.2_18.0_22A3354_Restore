@implementation CPTextButton

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPTextButton)initWithTitle:(NSString *)title textStyle:(CPTextButtonStyle)textStyle handler:(void *)handler
{
  NSString *v8;
  void *v9;
  CPTextButton *v10;
  uint64_t v11;
  NSUUID *identifier;
  uint64_t v13;
  id v14;
  uint64_t v15;
  NSString *v16;
  objc_super v18;

  v8 = title;
  v9 = handler;
  v18.receiver = self;
  v18.super_class = (Class)CPTextButton;
  v10 = -[CPTextButton init](&v18, sel_init);
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v11 = objc_claimAutoreleasedReturnValue();
    identifier = v10->_identifier;
    v10->_identifier = (NSUUID *)v11;

    v10->_enabled = 1;
    v13 = MEMORY[0x212BA7CA8](v9);
    v14 = v10->_handler;
    v10->_handler = (id)v13;

    v15 = -[NSString copy](v8, "copy");
    v16 = v10->_title;
    v10->_title = (NSString *)v15;

    v10->_textStyle = textStyle;
  }

  return v10;
}

- (CPTextButton)initWithCoder:(id)a3
{
  id v4;
  CPTextButton *v5;
  uint64_t v6;
  NSUUID *identifier;
  uint64_t v8;
  NSString *title;

  v4 = a3;
  v5 = -[CPTextButton init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPControlIdentifierKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kCPControlEnabledKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPControlTitleKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    v5->_textStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kCPTextButtonStyleKey"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CPTextButton identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("kCPControlIdentifierKey"));

  objc_msgSend(v6, "encodeBool:forKey:", -[CPTextButton isEnabled](self, "isEnabled"), CFSTR("kCPControlEnabledKey"));
  -[CPTextButton title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("kCPControlTitleKey"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[CPTextButton textStyle](self, "textStyle"), CFSTR("kCPTextButtonStyleKey"));
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v10.receiver = self;
  v10.super_class = (Class)CPTextButton;
  -[CPTextButton description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPTextButton identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CPSStringFromBOOL(-[CPTextButton isEnabled](self, "isEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPTextButton title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {UUID: %@, enabled: %@, title: %@}"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)setEnabled:(BOOL)a3
{
  id v4;

  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[CPTextButton delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "control:setEnabled:", self, self->_enabled);

  }
}

- (void)handlePrimaryAction
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  CPTextButton *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[CPTextButton handler](self, "handler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  CarPlayFrameworkGeneralLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (uint64_t)v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = self;
      _os_log_impl(&dword_20D6F4000, (os_log_t)v5, OS_LOG_TYPE_INFO, "%@ will call action handler", (uint8_t *)&v6, 0xCu);
    }

    -[CPTextButton handler](self, "handler");
    v5 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, CPTextButton *))(v5 + 16))(v5, self);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    -[CPMapButton handlePrimaryAction].cold.1((uint64_t)self, v5);
  }

}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(NSString *)title
{
  objc_setProperty_nonatomic_copy(self, a2, title, 24);
}

- (CPTextButtonStyle)textStyle
{
  return self->_textStyle;
}

- (void)setTextStyle:(CPTextButtonStyle)textStyle
{
  self->_textStyle = textStyle;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (CPControlDelegate)delegate
{
  return (CPControlDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
