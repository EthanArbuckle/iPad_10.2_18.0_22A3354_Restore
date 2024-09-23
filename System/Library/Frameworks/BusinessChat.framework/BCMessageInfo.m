@implementation BCMessageInfo

- (BCMessageInfo)initWithTitle:(id)a3 subtitle:(id)a4 style:(id)a5 alternateTitle:(id)a6 imageIdentifier:(id)a7 imageDescription:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  BCMessageInfo *v19;
  BCMessageInfo *v20;
  objc_super v22;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v22.receiver = self;
  v22.super_class = (Class)BCMessageInfo;
  v19 = -[BCMessageInfo init](&v22, sel_init);
  v20 = v19;
  if (v19)
  {
    -[BCMessageInfo setTitle:](v19, "setTitle:", v14);
    -[BCMessageInfo setSubtitle:](v20, "setSubtitle:", v15);
    v20->__style = (NSString *)a5;
    -[BCMessageInfo setImageIdentifier:](v20, "setImageIdentifier:", v17);
    -[BCMessageInfo setImageDescription:](v20, "setImageDescription:", v18);
    -[BCMessageInfo setAlternateTitle:](v20, "setAlternateTitle:", v16);
  }

  return v20;
}

- (BCMessageInfo)initWithDictionary:(id)a3
{
  id v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  BCMessageInfo *v24;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subtitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == v9)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subtitle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("style"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 == v12)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("style"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alternateTitle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 == v15)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alternateTitle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("imageIdentifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 == v18)
  {
    v19 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("imageIdentifier"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("imageDescription"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20 == v21)
  {
    v22 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("imageDescription"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v23 = CFSTR("small");
  if ((objc_msgSend(v13, "isEqualToString:", CFSTR("small")) & 1) == 0)
  {
    v23 = CFSTR("large");
    if (!objc_msgSend(v13, "isEqualToString:", CFSTR("large")))
      v23 = CFSTR("icon");
  }
  if (v7)
  {
    self = -[BCMessageInfo initWithTitle:subtitle:style:alternateTitle:imageIdentifier:imageDescription:](self, "initWithTitle:subtitle:style:alternateTitle:imageIdentifier:imageDescription:", v7, v10, v23, v16, v19, v22);
    v24 = self;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (BCMessageInfo)initWithDictionary:(id)a3 imageDictionary:(id)a4
{
  id v6;
  BCMessageInfo *v7;
  BCMessageInfo *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = -[BCMessageInfo initWithDictionary:](self, "initWithDictionary:", a3);
  v8 = v7;
  if (v7)
  {
    -[BCMessageInfo imageIdentifier](v7, "imageIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[BCMessageInfo imageIdentifier](v8, "imageIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "image");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[BCMessageInfo setImage:](v8, "setImage:", v12);

      objc_msgSend(v11, "imageDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[BCMessageInfo setImageDescription:](v8, "setImageDescription:", v13);

    }
  }

  return v8;
}

- (NSDictionary)dictionaryValue
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_title, CFSTR("title"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_subtitle, CFSTR("subtitle"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->__style, CFSTR("style"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_imageIdentifier, CFSTR("imageIdentifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_imageDescription, CFSTR("imageDescription"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_alternateTitle, CFSTR("alternateTitle"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v4;
}

- (NSString)style
{
  return self->__style;
}

- (NSString)debugDescription
{
  return (NSString *)-[BCMessageInfo descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BCMessageInfo succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCMessageInfo title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("title"));

  -[BCMessageInfo subtitle](self, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v6, CFSTR("subtitle"), 1);

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BCMessageInfo descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  -[BCMessageInfo succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCMessageInfo alternateTitle](self, "alternateTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v5, CFSTR("alternateTitle"), 1);

  -[BCMessageInfo imageIdentifier](self, "imageIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v7, CFSTR("imageIdentifier"), 1);

  -[BCMessageInfo imageDescription](self, "imageDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v9, CFSTR("imageDescription"), 1);

  -[BCMessageInfo style](self, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v4, "appendObject:withName:", v11, CFSTR("style"));

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (NSString)alternateTitle
{
  return self->_alternateTitle;
}

- (void)setAlternateTitle:(id)a3
{
  objc_storeStrong((id *)&self->_alternateTitle, a3);
}

- (NSString)imageIdentifier
{
  return self->_imageIdentifier;
}

- (void)setImageIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_imageIdentifier, a3);
}

- (NSString)imageDescription
{
  return self->_imageDescription;
}

- (void)setImageDescription:(id)a3
{
  objc_storeStrong((id *)&self->_imageDescription, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageDescription, 0);
  objc_storeStrong((id *)&self->_imageIdentifier, 0);
  objc_storeStrong((id *)&self->_alternateTitle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
