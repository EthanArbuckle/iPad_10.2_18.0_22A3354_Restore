@implementation CNActionItem

- (NSString)type
{
  return self->_type;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (CNActionItem)initWithImage:(id)a3 type:(id)a4
{
  id v7;
  id v8;
  CNActionItem *v9;
  CNActionItem *v10;
  CNActionItem *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNActionItem;
  v9 = -[CNActionItem init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_image, a3);
    objc_storeStrong((id *)&v10->_type, a4);
    v11 = v10;
  }

  return v10;
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNActionItem title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("title"), v4);

  -[CNActionItem type](self, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("type"), v6);

  v8 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("disabled"), -[CNActionItem disabled](self, "disabled"));
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
