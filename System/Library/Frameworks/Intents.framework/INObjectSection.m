@implementation INObjectSection

- (INObjectSection)initWithTitle:(NSString *)title items:(NSArray *)items
{
  NSArray *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  void *v11;
  void *v12;
  INObjectSection *v13;

  if (title)
  {
    v7 = items;
    v8 = (void *)-[NSString copy](title, "copy");
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB3A28];
    v10 = items;
    objc_msgSend(v9, "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v12, "copy");

  }
  v13 = -[INObjectSection initWithIdentifier:title:subtitle:image:items:](self, "initWithIdentifier:title:subtitle:image:items:", v8, title, 0, 0, items);

  return v13;
}

- (INObjectSection)initWithIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5 image:(id)a6 items:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  INObjectSection *v17;
  uint64_t v18;
  NSString *title;
  uint64_t v20;
  NSArray *items;
  uint64_t v22;
  NSString *subtitle;
  uint64_t v24;
  INImage *image;
  uint64_t v26;
  NSString *identifier;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)INObjectSection;
  v17 = -[INObjectSection init](&v29, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v13, "copy");
    title = v17->_title;
    v17->_title = (NSString *)v18;

    v20 = objc_msgSend(v16, "copy");
    items = v17->_items;
    v17->_items = (NSArray *)v20;

    v22 = objc_msgSend(v14, "copy");
    subtitle = v17->_subtitle;
    v17->_subtitle = (NSString *)v22;

    v24 = objc_msgSend(v15, "copy");
    image = v17->_image;
    v17->_image = (INImage *)v24;

    v26 = objc_msgSend(v12, "copy");
    identifier = v17->_identifier;
    v17->_identifier = (NSString *)v26;

  }
  return v17;
}

- (NSArray)items
{
  return self->_items;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (INImage)image
{
  return self->_image;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (INObjectSection)initWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5 items:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  INObjectSection *v21;

  if (a3)
  {
    v11 = a6;
    v12 = a5;
    v13 = a4;
    v14 = (void *)objc_msgSend(a3, "copy");
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB3A28];
    v16 = a6;
    v17 = a5;
    v18 = a4;
    objc_msgSend(v15, "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v20, "copy");

  }
  v21 = -[INObjectSection initWithIdentifier:title:subtitle:image:items:](self, "initWithIdentifier:title:subtitle:image:items:", v14, a3, a4, a5, a6);

  return v21;
}

- (INObjectSection)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  INObjectSection *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, CFSTR("subtitle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[INSchema _supportedClasses](INSchema, "_supportedClasses");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_opt_class();
  v25 = objc_opt_class();
  v26 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setByAddingObjectsFromArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v16, CFSTR("items"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0C99E60];
  v19 = objc_opt_class();
  objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0, v24, v25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v20, CFSTR("_identifier"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    self = -[INObjectSection initWithIdentifier:title:subtitle:image:items:](self, "initWithIdentifier:title:subtitle:image:items:", v21, v8, v12, v13, v17);
    v22 = self;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitle, CFSTR("subtitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_image, CFSTR("image"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_items, CFSTR("items"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("_identifier"));

}

- (NSString)_identifier
{
  return self->_identifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
