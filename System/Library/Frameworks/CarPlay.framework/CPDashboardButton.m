@implementation CPDashboardButton

- (CPDashboardButton)initWithTitleVariants:(NSArray *)titleVariants subtitleVariants:(NSArray *)subtitleVariants image:(UIImage *)image handler:(void *)handler
{
  NSArray *v10;
  NSArray *v11;
  UIImage *v12;
  void *v13;
  CPDashboardButton *v14;
  uint64_t v15;
  NSUUID *identifier;
  uint64_t v17;
  NSArray *v18;
  void *v19;
  uint64_t v20;
  NSArray *v21;
  CPImageSet *v22;
  CPImageSet *imageSet;
  uint64_t v24;
  id v25;
  objc_super v27;

  v10 = titleVariants;
  v11 = subtitleVariants;
  v12 = image;
  v13 = handler;
  v27.receiver = self;
  v27.super_class = (Class)CPDashboardButton;
  v14 = -[CPDashboardButton init](&v27, sel_init);
  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v15 = objc_claimAutoreleasedReturnValue();
    identifier = v14->_identifier;
    v14->_identifier = (NSUUID *)v15;

    v17 = -[NSArray copy](v10, "copy");
    v18 = v14->_titleVariants;
    v14->_titleVariants = (NSArray *)v17;

    -[NSArray bs_compactMap:](v11, "bs_compactMap:", &__block_literal_global_20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    v21 = v14->_subtitleVariants;
    v14->_subtitleVariants = (NSArray *)v20;

    v22 = -[CPImageSet initWithImage:]([CPImageSet alloc], "initWithImage:", v12);
    imageSet = v14->_imageSet;
    v14->_imageSet = v22;

    v24 = MEMORY[0x212BA7CA8](v13);
    v25 = v14->_handler;
    v14->_handler = (id)v24;

  }
  return v14;
}

id __74__CPDashboardButton_initWithTitleVariants_subtitleVariants_image_handler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (objc_msgSend(v2, "length"))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPDashboardButton;
  return -[CPDashboardButton init](&v3, sel_init);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPDashboardButton)initWithCoder:(id)a3
{
  id v4;
  CPDashboardButton *v5;
  uint64_t v6;
  NSUUID *identifier;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *titleVariants;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSArray *subtitleVariants;
  uint64_t v18;
  CPImageSet *imageSet;

  v4 = a3;
  v5 = -[CPDashboardButton _init](self, "_init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPDashboardButtonIdentifierKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("kCPDashboardButtonTitlesKey"));
    v11 = objc_claimAutoreleasedReturnValue();
    titleVariants = v5->_titleVariants;
    v5->_titleVariants = (NSArray *)v11;

    v13 = (void *)MEMORY[0x24BDBCF20];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("kCPDashboardButtonSubtitlesKey"));
    v16 = objc_claimAutoreleasedReturnValue();
    subtitleVariants = v5->_subtitleVariants;
    v5->_subtitleVariants = (NSArray *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPDashboardButtonImageSetKey"));
    v18 = objc_claimAutoreleasedReturnValue();
    imageSet = v5->_imageSet;
    v5->_imageSet = (CPImageSet *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CPDashboardButton identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCPDashboardButtonIdentifierKey"));

  -[CPDashboardButton titleVariants](self, "titleVariants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kCPDashboardButtonTitlesKey"));

  -[CPDashboardButton subtitleVariants](self, "subtitleVariants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kCPDashboardButtonSubtitlesKey"));

  -[CPDashboardButton imageSet](self, "imageSet");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("kCPDashboardButtonImageSetKey"));

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)CPDashboardButton;
  -[CPDashboardButton description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPDashboardButton identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {UUID: %@}"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)handlePrimaryAction
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  CPDashboardButton *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[CPDashboardButton handler](self, "handler");
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

    -[CPDashboardButton handler](self, "handler");
    v5 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, CPDashboardButton *))(v5 + 16))(v5, self);
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

  -[CPDashboardButton imageSet](self, "imageSet");
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

- (NSArray)titleVariants
{
  return self->_titleVariants;
}

- (NSArray)subtitleVariants
{
  return self->_subtitleVariants;
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
  objc_storeStrong((id *)&self->_subtitleVariants, 0);
  objc_storeStrong((id *)&self->_titleVariants, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
