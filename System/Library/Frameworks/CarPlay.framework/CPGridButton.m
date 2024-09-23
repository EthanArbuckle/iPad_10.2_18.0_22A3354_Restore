@implementation CPGridButton

- (CPGridButton)initWithTitleVariants:(NSArray *)titleVariants image:(UIImage *)image handler:(void *)handler
{
  NSArray *v9;
  UIImage *v10;
  void *v11;
  CPGridButton *v12;
  uint64_t v13;
  NSUUID *identifier;
  CPImageSet *v15;
  CPImageSet *imageSet;
  uint64_t v17;
  id v18;
  objc_super v20;

  v9 = titleVariants;
  v10 = image;
  v11 = handler;
  v20.receiver = self;
  v20.super_class = (Class)CPGridButton;
  v12 = -[CPGridButton init](&v20, sel_init);
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v13 = objc_claimAutoreleasedReturnValue();
    identifier = v12->_identifier;
    v12->_identifier = (NSUUID *)v13;

    v12->_enabled = 1;
    objc_storeStrong((id *)&v12->_titleVariants, titleVariants);
    v15 = -[CPImageSet initWithImage:treatmentBlock:]([CPImageSet alloc], "initWithImage:treatmentBlock:", v10, &__block_literal_global_16);
    imageSet = v12->_imageSet;
    v12->_imageSet = v15;

    v17 = MEMORY[0x212BA7CA8](v11);
    v18 = v12->_handler;
    v12->_handler = (id)v17;

  }
  return v12;
}

id __52__CPGridButton_initWithTitleVariants_image_handler___block_invoke(uint64_t a1, void *a2)
{
  return CPImageByScalingImageToSize(a2, 40.0, 40.0);
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPGridButton;
  return -[CPGridButton init](&v3, sel_init);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[CPGridButton isEqualToGridButton:](self, "isEqualToGridButton:", v4);

  return v5;
}

- (BOOL)isEqualToGridButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;

  v4 = a3;
  -[CPGridButton identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (!v7)
    goto LABEL_5;
  v8 = -[CPGridButton isEnabled](self, "isEnabled");
  if (v8 != objc_msgSend(v4, "isEnabled"))
    goto LABEL_5;
  -[CPGridButton titleVariants](self, "titleVariants");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleVariants");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToArray:", v10);

  if (v11)
  {
    -[CPGridButton imageSet](self, "imageSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqual:", v13);

  }
  else
  {
LABEL_5:
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;

  -[CPGridButton identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CPGridButton titleVariants](self, "titleVariants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[CPGridButton imageSet](self, "imageSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");
  v9 = v8 ^ -[CPGridButton isEnabled](self, "isEnabled");

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPGridButton)initWithCoder:(id)a3
{
  id v4;
  CPGridButton *v5;
  uint64_t v6;
  NSUUID *identifier;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *titleVariants;
  uint64_t v13;
  CPImageSet *imageSet;

  v4 = a3;
  v5 = -[CPGridButton _init](self, "_init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPGridButtonIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CPGridButtonEnabled"));
    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("CPGridButtonTitleVariants"));
    v11 = objc_claimAutoreleasedReturnValue();
    titleVariants = v5->_titleVariants;
    v5->_titleVariants = (NSArray *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPGridButtonImageSet"));
    v13 = objc_claimAutoreleasedReturnValue();
    imageSet = v5->_imageSet;
    v5->_imageSet = (CPImageSet *)v13;

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
  -[CPGridButton identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CPGridButtonIdentifier"));

  objc_msgSend(v4, "encodeBool:forKey:", -[CPGridButton isEnabled](self, "isEnabled"), CFSTR("CPGridButtonEnabled"));
  -[CPGridButton titleVariants](self, "titleVariants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("CPGridButtonTitleVariants"));

  -[CPGridButton imageSet](self, "imageSet");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("CPGridButtonImageSet"));

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
  v9.super_class = (Class)CPGridButton;
  -[CPGridButton description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPGridButton identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CPSStringFromBOOL(-[CPGridButton isEnabled](self, "isEnabled"));
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
    -[CPGridButton delegate](self, "delegate");
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
  CPGridButton *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[CPGridButton handler](self, "handler");
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

    -[CPGridButton handler](self, "handler");
    v5 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, CPGridButton *))(v5 + 16))(v5, self);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    -[CPMapButton handlePrimaryAction].cold.1((uint64_t)self, v5);
  }

}

- (UIImage)image
{
  void *v2;
  void *v3;

  -[CPGridButton imageSet](self, "imageSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
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

- (NSArray)titleVariants
{
  return self->_titleVariants;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CPImageSet)imageSet
{
  return self->_imageSet;
}

- (void)setImageSet:(id)a3
{
  objc_storeStrong((id *)&self->_imageSet, a3);
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
  objc_storeStrong((id *)&self->_imageSet, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_titleVariants, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
