@implementation CPButton

- (CPButton)initWithImage:(UIImage *)image handler:(void *)handler
{
  UIImage *v6;
  void *v7;
  CPButton *v8;
  uint64_t v9;
  NSUUID *identifier;
  uint64_t v11;
  id v12;
  objc_super v14;

  v6 = image;
  v7 = handler;
  v14.receiver = self;
  v14.super_class = (Class)CPButton;
  v8 = -[CPButton init](&v14, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v9 = objc_claimAutoreleasedReturnValue();
    identifier = v8->_identifier;
    v8->_identifier = (NSUUID *)v9;

    v8->_enabled = 1;
    v11 = MEMORY[0x212BA7CA8](v7);
    v12 = v8->_handler;
    v8->_handler = (id)v11;

    if (v6)
      -[CPButton setImage:](v8, "setImage:", v6);
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPButton)initWithCoder:(id)a3
{
  id v4;
  CPButton *v5;
  uint64_t v6;
  NSUUID *identifier;
  uint64_t v8;
  CPImageSet *imageSet;
  uint64_t v10;
  NSString *title;

  v4 = a3;
  v5 = -[CPButton init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPButtonIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CPButtonEnabled"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPButtonImageSet"));
    v8 = objc_claimAutoreleasedReturnValue();
    imageSet = v5->_imageSet;
    v5->_imageSet = (CPImageSet *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPButtonTitleKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CPButton identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CPButtonIdentifier"));

  objc_msgSend(v4, "encodeBool:forKey:", -[CPButton isEnabled](self, "isEnabled"), CFSTR("CPButtonEnabled"));
  -[CPButton imageSet](self, "imageSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("CPButtonImageSet"));

  -[CPButton title](self, "title");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("CPButtonTitleKey"));

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
  v9.super_class = (Class)CPButton;
  -[CPButton description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPButton identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CPSStringFromBOOL(-[CPButton isEnabled](self, "isEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {UUID: %@, enabled: %@}"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)setEnabled:(BOOL)enabled
{
  id v4;

  if (self->_enabled != enabled)
  {
    self->_enabled = enabled;
    -[CPButton delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "control:setEnabled:", self, self->_enabled);

  }
}

- (void)setImage:(id)a3
{
  void *v4;
  char v5;
  CPImageSet *v6;
  CPImageSet *imageSet;
  void *v8;
  id v9;

  v9 = a3;
  -[CPButton image](self, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v9);

  if ((v5 & 1) == 0)
  {
    if (v9)
    {
      v6 = -[CPImageSet initWithImage:treatmentBlock:]([CPImageSet alloc], "initWithImage:treatmentBlock:", v9, &__block_literal_global_4);
      imageSet = self->_imageSet;
      self->_imageSet = v6;

    }
    -[CPButton associatedTemplate](self, "associatedTemplate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsUpdate");

  }
}

id __21__CPButton_setImage___block_invoke(uint64_t a1, void *a2)
{
  return CPImageByScalingImageToSize(a2, 50.0, 50.0);
}

- (UIImage)image
{
  void *v2;
  void *v3;

  -[CPButton imageSet](self, "imageSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setTitle:(NSString *)title
{
  void *v4;
  char v5;
  NSString *v6;
  NSString *v7;
  void *v8;
  NSString *v9;

  v9 = title;
  -[CPButton title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v9);

  if ((v5 & 1) == 0)
  {
    v6 = (NSString *)-[NSString copy](v9, "copy");
    v7 = self->_title;
    self->_title = v6;

    -[CPButton associatedTemplate](self, "associatedTemplate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsUpdate");

  }
}

- (void)handlePrimaryAction
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  CPButton *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[CPButton handler](self, "handler");
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

    -[CPButton handler](self, "handler");
    v5 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, CPButton *))(v5 + 16))(v5, self);
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

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CPControlDelegate)delegate
{
  return (CPControlDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CPImageSet)imageSet
{
  return self->_imageSet;
}

- (void)setImageSet:(id)a3
{
  objc_storeStrong((id *)&self->_imageSet, a3);
}

- (CPTemplate)associatedTemplate
{
  return (CPTemplate *)objc_loadWeakRetained((id *)&self->_associatedTemplate);
}

- (void)setAssociatedTemplate:(id)a3
{
  objc_storeWeak((id *)&self->_associatedTemplate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_associatedTemplate);
  objc_storeStrong((id *)&self->_imageSet, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
