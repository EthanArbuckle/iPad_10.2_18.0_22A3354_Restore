@implementation LNAppShortcutOptionsCollectionMetadata

- (LNAppShortcutOptionsCollectionMetadata)initWithTitle:(id)a3 systemImageName:(id)a4
{
  id v7;
  id v8;
  LNAppShortcutOptionsCollectionMetadata *v9;
  uint64_t v10;
  LNStaticDeferredLocalizedString *title;
  uint64_t v12;
  NSString *systemImageName;
  LNAppShortcutOptionsCollectionMetadata *v14;
  void *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAppShortcutOptionsCollectionMetadata.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title"));

  }
  v17.receiver = self;
  v17.super_class = (Class)LNAppShortcutOptionsCollectionMetadata;
  v9 = -[LNAppShortcutOptionsCollectionMetadata init](&v17, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v7, "copy");
    title = v9->_title;
    v9->_title = (LNStaticDeferredLocalizedString *)v10;

    v12 = objc_msgSend(v8, "copy");
    systemImageName = v9->_systemImageName;
    v9->_systemImageName = (NSString *)v12;

    v14 = v9;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[LNAppShortcutOptionsCollectionMetadata title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("title"));

  -[LNAppShortcutOptionsCollectionMetadata systemImageName](self, "systemImageName");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("systemImageName"));

}

- (LNAppShortcutOptionsCollectionMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  LNAppShortcutOptionsCollectionMetadata *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemImageName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[LNAppShortcutOptionsCollectionMetadata initWithTitle:systemImageName:](self, "initWithTitle:systemImageName:", v5, v6);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAppShortcutOptionsCollectionMetadata title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAppShortcutOptionsCollectionMetadata systemImageName](self, "systemImageName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, title: %@, systemImageName: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[LNAppShortcutOptionsCollectionMetadata title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNAppShortcutOptionsCollectionMetadata systemImageName](self, "systemImageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  LNAppShortcutOptionsCollectionMetadata *v4;
  LNAppShortcutOptionsCollectionMetadata *v5;
  LNAppShortcutOptionsCollectionMetadata *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v4 = (LNAppShortcutOptionsCollectionMetadata *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_20:

      goto LABEL_21;
    }
    -[LNAppShortcutOptionsCollectionMetadata title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAppShortcutOptionsCollectionMetadata title](v6, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      v14 = v9;
      if (!v9 || !v10)
      {
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      v12 = objc_msgSend(v9, "isEqual:", v10);

      if (!v12)
        goto LABEL_19;
    }
    -[LNAppShortcutOptionsCollectionMetadata systemImageName](self, "systemImageName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAppShortcutOptionsCollectionMetadata systemImageName](v6, "systemImageName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v15;
    v17 = v16;
    v13 = v17;
    if (v14 == v17)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v14 && v17)
        LOBYTE(v12) = objc_msgSend(v14, "isEqualToString:", v17);
    }

    goto LABEL_18;
  }
  LOBYTE(v12) = 1;
LABEL_21:

  return v12;
}

- (LNStaticDeferredLocalizedString)title
{
  return self->_title;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
