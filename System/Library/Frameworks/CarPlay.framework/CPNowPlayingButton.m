@implementation CPNowPlayingButton

- (CPNowPlayingButton)initWithHandler:(void *)handler
{
  void *v4;
  CPNowPlayingButton *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  NSUUID *identifier;
  objc_super v11;

  v4 = handler;
  v11.receiver = self;
  v11.super_class = (Class)CPNowPlayingButton;
  v5 = -[CPNowPlayingButton init](&v11, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x212BA7CA8](v4);
    v7 = v5->_handler;
    v5->_handler = (id)v6;

    v5->_enabled = 1;
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v8;

    v5->_selected = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPNowPlayingButton)initWithCoder:(id)a3
{
  id v4;
  CPNowPlayingButton *v5;
  uint64_t v6;
  NSUUID *identifier;

  v4 = a3;
  v5 = -[CPNowPlayingButton init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPNowPlayingButtonIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CPNowPlayingButtonEnabled"));
    v5->_selected = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kCPNowPlayingButtonSelectedKey"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CPNowPlayingButton identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("CPNowPlayingButtonIdentifier"));

  objc_msgSend(v5, "encodeBool:forKey:", -[CPNowPlayingButton isEnabled](self, "isEnabled"), CFSTR("CPNowPlayingButtonEnabled"));
  objc_msgSend(v5, "encodeBool:forKey:", -[CPNowPlayingButton isSelected](self, "isSelected"), CFSTR("kCPNowPlayingButtonSelectedKey"));

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
  v10.super_class = (Class)CPNowPlayingButton;
  -[CPNowPlayingButton description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPNowPlayingButton identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CPSStringFromBOOL(-[CPNowPlayingButton isEnabled](self, "isEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CPSStringFromBOOL(-[CPNowPlayingButton isSelected](self, "isSelected"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {UUID: %@, enabled: %@, selected: %@}"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)setEnabled:(BOOL)enabled
{
  id v4;

  if (self->_enabled != enabled)
  {
    self->_enabled = enabled;
    -[CPNowPlayingButton delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "control:setEnabled:", self, self->_enabled);

  }
}

- (void)setSelected:(BOOL)selected
{
  _BOOL8 v3;
  id v5;

  if (self->_selected != selected)
  {
    v3 = selected;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      self->_selected = v3;
      -[CPNowPlayingButton delegate](self, "delegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "control:setSelected:", self, v3);

    }
  }
}

- (void)handlePrimaryAction
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  CPNowPlayingButton *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[CPNowPlayingButton handler](self, "handler");
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

    -[CPNowPlayingButton handler](self, "handler");
    v5 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, CPNowPlayingButton *))(v5 + 16))(v5, self);
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

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CPControlDelegate)delegate
{
  return (CPControlDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
