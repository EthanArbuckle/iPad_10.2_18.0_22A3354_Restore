@implementation CPMapButton

- (CPMapButton)init
{
  return -[CPMapButton initWithHandler:](self, "initWithHandler:", 0);
}

- (CPMapButton)initWithHandler:(void *)handler
{
  void *v4;
  CPMapButton *v5;
  uint64_t v6;
  NSUUID *identifier;
  uint64_t v8;
  id v9;
  objc_super v11;

  v4 = handler;
  v11.receiver = self;
  v11.super_class = (Class)CPMapButton;
  v5 = -[CPMapButton init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v5->_enabled = 1;
    v8 = MEMORY[0x212BA7CA8](v4);
    v9 = v5->_handler;
    v5->_handler = (id)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPMapButton)initWithCoder:(id)a3
{
  id v4;
  CPMapButton *v5;
  uint64_t v6;
  NSUUID *identifier;
  uint64_t v8;
  CPImageSet *imageSet;
  void *v10;
  objc_class *v11;
  uint64_t v12;
  UIImage *focusedImage;

  v4 = a3;
  v5 = -[CPMapButton init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPMapButtonIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CPMapButtonEnabled"));
    v5->_hidden = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CPMapButtonHidden"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPMapButtonImage"));
    v8 = objc_claimAutoreleasedReturnValue();
    imageSet = v5->_imageSet;
    v5->_imageSet = (CPImageSet *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPMapButtonFocusedImage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    CPSanitizeImage(v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    focusedImage = v5->_focusedImage;
    v5->_focusedImage = (UIImage *)v12;

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
  -[CPMapButton identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CPMapButtonIdentifier"));

  objc_msgSend(v4, "encodeBool:forKey:", -[CPMapButton isEnabled](self, "isEnabled"), CFSTR("CPMapButtonEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CPMapButton isHidden](self, "isHidden"), CFSTR("CPMapButtonHidden"));
  -[CPMapButton imageSet](self, "imageSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("CPMapButtonImage"));

  -[CPMapButton focusedImage](self, "focusedImage");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("CPMapButtonFocusedImage"));

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
  v10.super_class = (Class)CPMapButton;
  -[CPMapButton description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPMapButton identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CPSStringFromBOOL(-[CPMapButton isEnabled](self, "isEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CPSStringFromBOOL(-[CPMapButton isHidden](self, "isHidden"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {UUID: %@, enabled: %@, hidden: %@}"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)setEnabled:(BOOL)enabled
{
  id v4;

  if (self->_enabled != enabled)
  {
    self->_enabled = enabled;
    -[CPMapButton controlDelegate](self, "controlDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "control:setEnabled:", self, self->_enabled);

  }
}

- (void)setHidden:(BOOL)hidden
{
  _BOOL8 v3;
  void *v5;

  v3 = hidden;
  -[CPMapButton controlDelegate](self, "controlDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mapButton:setHidden:", self, v3);

  self->_hidden = v3;
}

- (void)setImage:(UIImage *)image
{
  CPImageSet *v4;
  CPImageSet *imageSet;
  void *v6;
  void *v7;
  UIImage *v8;

  v8 = image;
  if (v8)
  {
    v4 = -[CPImageSet initWithImage:]([CPImageSet alloc], "initWithImage:", v8);
    imageSet = self->_imageSet;
    self->_imageSet = v4;
  }
  else
  {
    imageSet = self->_imageSet;
    self->_imageSet = 0;
  }

  -[CPMapButton controlDelegate](self, "controlDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPMapButton imageSet](self, "imageSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mapButton:setImageSet:", self, v7);

}

- (UIImage)image
{
  void *v2;
  void *v3;

  -[CPMapButton imageSet](self, "imageSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setFocusedImage:(UIImage *)focusedImage
{
  UIImage *v4;
  objc_class *v5;
  UIImage *v6;
  UIImage *v7;
  id v8;

  if (self->_focusedImage != focusedImage)
  {
    v4 = focusedImage;
    v5 = (objc_class *)objc_opt_class();
    CPSanitizeImage(v4, v5);
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();

    v7 = self->_focusedImage;
    self->_focusedImage = v6;

    -[CPMapButton controlDelegate](self, "controlDelegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mapButton:setFocusedImage:", self, self->_focusedImage);

  }
}

- (void)handlePrimaryAction
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20D6F4000, a2, OS_LOG_TYPE_ERROR, "%@ action handler nil", (uint8_t *)&v2, 0xCu);
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

- (BOOL)isHidden
{
  return self->_hidden;
}

- (UIImage)focusedImage
{
  return self->_focusedImage;
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

- (CPMapButtonDelegate)controlDelegate
{
  return (CPMapButtonDelegate *)objc_loadWeakRetained((id *)&self->_controlDelegate);
}

- (void)setControlDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_controlDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controlDelegate);
  objc_storeStrong((id *)&self->_imageSet, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_focusedImage, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
