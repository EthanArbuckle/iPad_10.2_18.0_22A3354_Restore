@implementation CPContactEntity

- (CPContactEntity)initWithName:(id)a3 imageSet:(id)a4
{
  id v6;
  id v7;
  CPContactEntity *v8;
  uint64_t v9;
  NSString *name;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CPContactEntity;
  v8 = -[CPEntity _init](&v12, sel__init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    objc_storeStrong((id *)&v8->_imageSet, a4);
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  char v20;
  void *v22;
  void *v23;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[CPContactEntity name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if (!v8)
      goto LABEL_7;
    -[CPContactEntity name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_7;
    -[CPContactEntity subtitle](self, "subtitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subtitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqual:", v13);

    if (!v14)
      goto LABEL_7;
    -[CPContactEntity informativeText](self, "informativeText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "informativeText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_7;
    -[CPContactEntity imageSet](self, "imageSet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageSet");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18 == v19)
    {
      -[CPContactEntity actionButtons](self, "actionButtons");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "actionButtons");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v22, "isEqualToArray:", v23);

    }
    else
    {
LABEL_7:
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPContactEntity)initWithCoder:(id)a3
{
  id v4;
  CPContactEntity *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *subtitle;
  uint64_t v10;
  NSString *informativeText;
  uint64_t v12;
  CPImageSet *imageSet;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSArray *actionButtons;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CPContactEntity;
  v5 = -[CPEntity _init](&v23, sel__init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPContactEntityName"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPContactEntitySubtitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPContactEntityInformative"));
    v10 = objc_claimAutoreleasedReturnValue();
    informativeText = v5->_informativeText;
    v5->_informativeText = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPContactEntityImageSet"));
    v12 = objc_claimAutoreleasedReturnValue();
    imageSet = v5->_imageSet;
    v5->_imageSet = (CPImageSet *)v12;

    v14 = (void *)MEMORY[0x24BDBCF20];
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, v16, v17, v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("CPContactEntityActionButtons"));
    v20 = objc_claimAutoreleasedReturnValue();
    actionButtons = v5->_actionButtons;
    v5->_actionButtons = (NSArray *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CPContactEntity;
  v4 = a3;
  -[CPEntity encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  -[CPContactEntity name](self, "name", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CPContactEntityName"));

  -[CPContactEntity subtitle](self, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("CPContactEntitySubtitle"));

  -[CPContactEntity informativeText](self, "informativeText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("CPContactEntityInformative"));

  -[CPContactEntity imageSet](self, "imageSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("CPContactEntityImageSet"));

  -[CPContactEntity actionButtons](self, "actionButtons");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("CPContactEntityActionButtons"));

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
  v8.super_class = (Class)CPContactEntity;
  -[CPEntity description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPContactEntity name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: name: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)objectForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[CPContactEntity actionButtons](self, "actionButtons", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CPImageSet)imageSet
{
  return self->_imageSet;
}

- (void)setImageSet:(id)a3
{
  objc_storeStrong((id *)&self->_imageSet, a3);
}

- (NSArray)actionButtons
{
  return self->_actionButtons;
}

- (void)setActionButtons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)informativeText
{
  return self->_informativeText;
}

- (void)setInformativeText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_informativeText, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_actionButtons, 0);
  objc_storeStrong((id *)&self->_imageSet, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
