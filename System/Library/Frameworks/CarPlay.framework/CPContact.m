@implementation CPContact

- (CPContact)initWithName:(NSString *)name image:(UIImage *)image
{
  NSString *v6;
  UIImage *v7;
  CPContact *v8;
  CPImageSet *v9;
  CPContactEntity *v10;
  CPContactEntity *contactEntity;
  objc_super v13;

  v6 = name;
  v7 = image;
  v13.receiver = self;
  v13.super_class = (Class)CPContact;
  v8 = -[CPContact init](&v13, sel_init);
  if (v8)
  {
    v9 = -[CPImageSet initWithImage:]([CPImageSet alloc], "initWithImage:", v7);
    v10 = -[CPContactEntity initWithName:imageSet:]([CPContactEntity alloc], "initWithName:imageSet:", v6, v9);
    contactEntity = v8->_contactEntity;
    v8->_contactEntity = v10;

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPContact)initWithCoder:(id)a3
{
  id v4;
  CPContact *v5;
  uint64_t v6;
  CPContactEntity *contactEntity;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPContact;
  v5 = -[CPContact init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPContactEntity"));
    v6 = objc_claimAutoreleasedReturnValue();
    contactEntity = v5->_contactEntity;
    v5->_contactEntity = (CPContactEntity *)v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  CPContact *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (CPContact *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CPContact contactEntity](self, "contactEntity");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPContact contactEntity](v4, "contactEntity");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CPContact contactEntity](self, "contactEntity");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCPContactEntity"));

}

- (void)setName:(NSString *)name
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  NSString *v9;

  v9 = name;
  -[CPContact contactEntity](self, "contactEntity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v9);

  if ((v6 & 1) == 0)
  {
    -[CPContact contactEntity](self, "contactEntity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setName:", v9);

    -[CPContact associatedTemplate](self, "associatedTemplate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsUpdate");

  }
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[CPContact contactEntity](self, "contactEntity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setImage:(UIImage *)image
{
  UIImage *v4;
  void *v5;
  void *v6;
  CPImageSet *v7;

  v4 = image;
  v7 = -[CPImageSet initWithImage:]([CPImageSet alloc], "initWithImage:", v4);

  -[CPContact contactEntity](self, "contactEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImageSet:", v7);

  -[CPContact associatedTemplate](self, "associatedTemplate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsUpdate");

}

- (UIImage)image
{
  void *v2;
  void *v3;
  void *v4;

  -[CPContact contactEntity](self, "contactEntity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v4;
}

- (void)setActions:(NSArray *)actions
{
  NSArray *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = actions;
  -[CPContact associatedTemplate](self, "associatedTemplate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPContact _associateControlsToTemplate:](self, "_associateControlsToTemplate:", v5);

  -[CPContact contactEntity](self, "contactEntity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActionButtons:", v4);

  -[CPContact associatedTemplate](self, "associatedTemplate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsUpdate");

}

- (NSArray)actions
{
  void *v2;
  void *v3;

  -[CPContact contactEntity](self, "contactEntity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionButtons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setSubtitle:(NSString *)subtitle
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  NSString *v9;

  v9 = subtitle;
  -[CPContact contactEntity](self, "contactEntity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v9);

  if ((v6 & 1) == 0)
  {
    -[CPContact contactEntity](self, "contactEntity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSubtitle:", v9);

    -[CPContact associatedTemplate](self, "associatedTemplate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsUpdate");

  }
}

- (NSString)subtitle
{
  void *v2;
  void *v3;

  -[CPContact contactEntity](self, "contactEntity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subtitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setInformativeText:(NSString *)informativeText
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  NSString *v9;

  v9 = informativeText;
  -[CPContact contactEntity](self, "contactEntity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "informativeText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v9);

  if ((v6 & 1) == 0)
  {
    -[CPContact contactEntity](self, "contactEntity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setInformativeText:", v9);

    -[CPContact associatedTemplate](self, "associatedTemplate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsUpdate");

  }
}

- (NSString)informativeText
{
  void *v2;
  void *v3;

  -[CPContact contactEntity](self, "contactEntity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "informativeText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setAssociatedTemplate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_associatedTemplate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_associatedTemplate, obj);
    -[CPContact _associateControlsToTemplate:](self, "_associateControlsToTemplate:", obj);
  }

}

- (void)_associateControlsToTemplate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CPContact actions](self, "actions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v10, "setAssociatedTemplate:", v4);
        objc_msgSend(v10, "setDelegate:", v4);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (CPContactEntity)contactEntity
{
  return self->_contactEntity;
}

- (void)setContactEntity:(id)a3
{
  objc_storeStrong((id *)&self->_contactEntity, a3);
}

- (CPTemplate)associatedTemplate
{
  return (CPTemplate *)objc_loadWeakRetained((id *)&self->_associatedTemplate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_associatedTemplate);
  objc_storeStrong((id *)&self->_contactEntity, 0);
}

@end
