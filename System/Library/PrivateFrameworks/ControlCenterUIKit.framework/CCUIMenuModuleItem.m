@implementation CCUIMenuModuleItem

- (CCUIMenuModuleItem)initWithTitle:(id)a3 identifier:(id)a4 handler:(id)a5
{
  return -[CCUIMenuModuleItem initWithTitle:identifier:image:handler:](self, "initWithTitle:identifier:image:handler:", a3, a4, 0, a5);
}

- (CCUIMenuModuleItem)initWithTitle:(id)a3 identifier:(id)a4 image:(id)a5 handler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CCUIMenuModuleItem *v15;
  CCUIMenuModuleItem *v16;
  uint64_t v17;
  id handler;
  uint64_t v19;
  UIImage *image;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CCUIMenuModuleItem;
  v15 = -[CCUIMenuModuleItem init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_title, a3);
    objc_storeStrong((id *)&v16->_identifier, a4);
    v17 = objc_msgSend(v14, "copy");
    handler = v16->_handler;
    v16->_handler = (id)v17;

    v19 = objc_msgSend(v13, "copy");
    image = v16->_image;
    v16->_image = (UIImage *)v19;

  }
  return v16;
}

- (BOOL)isEqual:(id)a3
{
  CCUIMenuModuleItem *v4;
  CCUIMenuModuleItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v15;

  v4 = (CCUIMenuModuleItem *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[CCUIMenuModuleItem identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CCUIMenuModuleItem identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!BSEqualObjects())
      {
        v13 = 0;
LABEL_20:

        goto LABEL_21;
      }
      -[CCUIMenuModuleItem title](self, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CCUIMenuModuleItem title](v5, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!BSEqualObjects())
      {
        v13 = 0;
LABEL_19:

        goto LABEL_20;
      }
      -[CCUIMenuModuleItem image](self, "image");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CCUIMenuModuleItem image](v5, "image");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!BSEqualObjects())
      {
        v13 = 0;
LABEL_18:

        goto LABEL_19;
      }
      -[CCUIMenuModuleItem subtitle](self, "subtitle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CCUIMenuModuleItem subtitle](v5, "subtitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!BSEqualObjects())
        goto LABEL_15;
      -[CCUIMenuModuleItem isBusy](self, "isBusy");
      -[CCUIMenuModuleItem isBusy](v5, "isBusy");
      if (!BSEqualBools())
      {
        v13 = 0;
        goto LABEL_17;
      }
      -[CCUIMenuModuleItem isPlaceholder](self, "isPlaceholder");
      -[CCUIMenuModuleItem isPlaceholder](v5, "isPlaceholder");
      if (BSEqualBools())
      {
        -[CCUIMenuModuleItem isSelected](self, "isSelected");
        -[CCUIMenuModuleItem isSelected](v5, "isSelected");
        v13 = BSEqualBools();
      }
      else
      {
LABEL_15:
        v13 = 0;
      }
LABEL_17:

      goto LABEL_18;
    }
    v13 = 0;
  }
LABEL_21:

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  unint64_t v16;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIMenuModuleItem identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  -[CCUIMenuModuleItem title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:", v6);

  -[CCUIMenuModuleItem image](self, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CCUIMenuModuleItem image](self, "image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v3, "appendObject:", v9);

  }
  -[CCUIMenuModuleItem subtitle](self, "subtitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "appendObject:", v11);

  v13 = (id)objc_msgSend(v3, "appendBool:", -[CCUIMenuModuleItem isBusy](self, "isBusy"));
  v14 = (id)objc_msgSend(v3, "appendBool:", -[CCUIMenuModuleItem isPlaceholder](self, "isPlaceholder"));
  v15 = (id)objc_msgSend(v3, "appendBool:", -[CCUIMenuModuleItem isSelected](self, "isSelected"));
  v16 = objc_msgSend(v3, "hash");

  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIMenuModuleItem identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("identifier"));

  -[CCUIMenuModuleItem title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("title"));

  -[CCUIMenuModuleItem image](self, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v6, CFSTR("image"), 1);

  -[CCUIMenuModuleItem subtitle](self, "subtitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v8, CFSTR("subtitle"), 1);

  v9 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[CCUIMenuModuleItem isPlaceholder](self, "isPlaceholder"), CFSTR("placeholder"), 1);
  v10 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[CCUIMenuModuleItem isSelected](self, "isSelected"), CFSTR("selected"), 1);
  v11 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[CCUIMenuModuleItem isBusy](self, "isBusy"), CFSTR("busy"), 1);
  objc_msgSend(v3, "build");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)performAction
{
  uint64_t (**handler)(void);

  handler = (uint64_t (**)(void))self->_handler;
  if (handler)
    LOBYTE(handler) = handler[2]();
  return (char)handler;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isBusy
{
  return self->_busy;
}

- (void)setBusy:(BOOL)a3
{
  self->_busy = a3;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isPlaceholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(BOOL)a3
{
  self->_placeholder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
