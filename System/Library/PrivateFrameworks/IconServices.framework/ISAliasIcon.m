@implementation ISAliasIcon

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)aliasUUID
{
  if (aliasUUID_onceToken != -1)
    dispatch_once(&aliasUUID_onceToken, &__block_literal_global_34);
  return (id)aliasUUID_aliasUUID;
}

void __24__ISAliasIcon_aliasUUID__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3A28], "_IS_UUIDWithString:", CFSTR("com.apple.icon-decoration.system.alias"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)aliasUUID_aliasUUID;
  aliasUUID_aliasUUID = v0;

}

- (ISAliasIcon)initWithAliasURL:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  ISIconDecoration *v11;
  void *v12;
  ISAliasIcon *v13;
  ISAliasIcon *v14;
  ISIconDecoration *v15;
  uint64_t v16;
  NSArray *decorations;
  NSObject *v18;
  objc_super v20;
  ISIconDecoration *v21;
  uint8_t buf[4];
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "__is__isSymLink"))
  {
    v6 = (void *)MEMORY[0x1E0CB3A28];
    objc_msgSend(v5, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_IF_UUIDWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[ISURLResourcePropertySpecification sharedInstance](ISURLResourcePropertySpecification, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "iconInitWithURLProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "__is_resourceValuesForKeys:error:", v10, 0);
    v11 = (ISIconDecoration *)objc_claimAutoreleasedReturnValue();

    +[ISAliasIcon _iconForValues:](ISAliasIcon, "_iconForValues:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20.receiver = self;
    v20.super_class = (Class)ISAliasIcon;
    v13 = -[ISConcreteIcon initWithDigest:](&v20, sel_initWithDigest_, v8);
    v14 = v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_icon, v12);
      objc_storeStrong(&v14->_alias, a3);
      v15 = -[ISIconDecoration initWithType:]([ISIconDecoration alloc], "initWithType:", CFSTR("com.apple.icon-decoration.system.alias"));
      v24[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
      v16 = objc_claimAutoreleasedReturnValue();
      decorations = v14->_decorations;
      v14->_decorations = (NSArray *)v16;

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "bookmarkDataWithContentsOfURL:error:", v5, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      _ISDefaultLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v23 = 0;
        _os_log_impl(&dword_1AA928000, v18, OS_LOG_TYPE_DEFAULT, "Could not read bookmark from alias file with error: %@", buf, 0xCu);
      }

    }
    v11 = -[ISIconDecoration initWithType:]([ISIconDecoration alloc], "initWithType:", CFSTR("com.apple.icon-decoration.system.alias"));
    v21 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[ISAliasIcon initWithBookmarkData:decorations:](self, "initWithBookmarkData:decorations:", v8, v12);
  }

  return v14;
}

- (ISAliasIcon)initWithBookmarkData:(id)a3
{
  return -[ISAliasIcon initWithBookmarkData:decorations:](self, "initWithBookmarkData:decorations:", a3, MEMORY[0x1E0C9AA60]);
}

- (ISAliasIcon)initWithBookmarkData:(id)a3 decorations:(id)a4
{
  id v7;
  id v8;
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
  NSObject *v19;
  void *v20;
  ISIconDecoration *v21;
  ISAliasIcon *v22;
  ISAliasIcon *v23;
  objc_super v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0C99E98];
  +[ISURLResourcePropertySpecification sharedInstance](ISURLResourcePropertySpecification, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "iconInitWithURLProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resourceValuesForKeys:fromBookmarkData:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[ISAliasIcon _iconForValues:](ISAliasIcon, "_iconForValues:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "_IF_UUIDWithData:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB3A28];
  v26[0] = v14;
  objc_msgSend(v13, "digest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_IF_UUIDByXORingUUIDs:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v12, "_IF_BOOLForKey:", *MEMORY[0x1E0C999B8]) & 1) != 0
    || objc_msgSend(v12, "_IF_BOOLForKey:", *MEMORY[0x1E0C99A28]))
  {
    _ISDefaultLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[ISAliasIcon initWithBookmarkData:decorations:].cold.1();

    if (v8)
      v20 = v8;
    else
      v20 = (void *)MEMORY[0x1E0C9AA60];
    v21 = -[ISIconDecoration initWithType:]([ISIconDecoration alloc], "initWithType:", CFSTR("com.apple.icon-decoration.system.alias"));
    objc_msgSend(v20, "arrayByAddingObject:", v21);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  v25.receiver = self;
  v25.super_class = (Class)ISAliasIcon;
  v22 = -[ISConcreteIcon initWithDigest:](&v25, sel_initWithDigest_, v18);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_icon, v13);
    objc_storeStrong(&v23->_alias, a3);
    objc_storeStrong((id *)&v23->_decorations, v8);
  }

  return v23;
}

- (ISAliasIcon)initWithCoder:(id)a3
{
  id v4;
  ISAliasIcon *v5;
  uint64_t v6;
  id alias;
  uint64_t v8;
  NSArray *decorations;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ISAliasIcon;
  v5 = -[ISConcreteIcon initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    if (initWithCoder__onceToken_0 != -1)
      dispatch_once(&initWithCoder__onceToken_0, &__block_literal_global_8);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__classes_0, CFSTR("alias"));
    v6 = objc_claimAutoreleasedReturnValue();
    alias = v5->_alias;
    v5->_alias = (id)v6;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__classes_0, CFSTR("decorations"));
    v8 = objc_claimAutoreleasedReturnValue();
    decorations = v5->_decorations;
    v5->_decorations = (NSArray *)v8;

  }
  return v5;
}

void __29__ISAliasIcon_initWithCoder___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__classes_0;
  initWithCoder__classes_0 = v2;

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ISAliasIcon;
  v4 = a3;
  -[ISConcreteIcon encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_alias, CFSTR("alias"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_decorations, CFSTR("decorations"));

}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ISAliasIcon;
  -[ISAliasIcon description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("Icon: %@, Alias: %@"), self->_icon, self->_alias);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)resolve
{
  objc_class *v5;
  void *v6;
  uint8_t v7[14];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2();
  v8 = a2;

}

- (ISConcreteIcon)icon
{
  ISConcreteIcon *v3;
  ISConcreteIcon *icon;
  ISConcreteIcon *v5;

  -[ISAliasIcon resolvedIcon](self, "resolvedIcon");
  v3 = (ISConcreteIcon *)objc_claimAutoreleasedReturnValue();
  icon = v3;
  if (!v3)
    icon = self->_icon;
  v5 = icon;

  return v5;
}

- (id)makeResourceProvider
{
  void *v3;
  void *v4;

  -[ISAliasIcon resolve](self, "resolve");
  -[ISAliasIcon icon](self, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeResourceProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)decorations
{
  return self->_decorations;
}

- (id)alias
{
  return objc_getProperty(self, a2, 56, 1);
}

- (ISConcreteIcon)resolvedIcon
{
  return (ISConcreteIcon *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedIcon, 0);
  objc_storeStrong(&self->_alias, 0);
  objc_storeStrong((id *)&self->_decorations, 0);
  objc_storeStrong((id *)&self->_icon, 0);
}

+ (id)_iconForBookmarkData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C99E98];
  v4 = a3;
  +[ISURLResourcePropertySpecification sharedInstance](ISURLResourcePropertySpecification, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconInitWithURLProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resourceValuesForKeys:fromBookmarkData:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[ISAliasIcon _iconForValues:](ISAliasIcon, "_iconForValues:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_iconForValues:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  ISBundleIcon *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  ISTagIcon *v15;
  _QWORD *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  ISTypeIcon *v24;
  NSObject *v25;
  ISTypeIcon *v26;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  ISTypeIcon *v32;

  v3 = a3;
  if (objc_msgSend(v3, "_IF_BOOLForKey:", *MEMORY[0x1E0C999C0]))
  {
    _ISDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      +[ISAliasIcon(Factory) _iconForValues:].cold.2();

    objc_msgSend(v3, "_IF_stringForKey:", *MEMORY[0x1E0C998C8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(v3, "_IF_stringForKey:", *MEMORY[0x1E0C99AA8]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[ISBundleIcon initWithBundleURL:]([ISBundleIcon alloc], "initWithBundleURL:", v6);
    goto LABEL_16;
  }
  if (objc_msgSend(v3, "_IF_BOOLForKey:", *MEMORY[0x1E0C99A00]))
  {
    objc_msgSend(v3, "_IF_stringForKey:", *MEMORY[0x1E0C99AA8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _ISDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      +[ISAliasIcon(Factory) _iconForValues:].cold.3((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);

    v15 = [ISTagIcon alloc];
    v16 = (_QWORD *)MEMORY[0x1E0CA5C18];
LABEL_15:
    v7 = -[ISTagIcon initWithFileExtension:baseType:](v15, "initWithFileExtension:baseType:", v6, *v16);
    goto LABEL_16;
  }
  if (objc_msgSend(v3, "_IF_BOOLForKey:", *MEMORY[0x1E0C99A18]))
  {
    objc_msgSend(v3, "_IF_stringForKey:", *MEMORY[0x1E0C99AA8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _ISDefaultLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      +[ISAliasIcon(Factory) _iconForValues:].cold.4((uint64_t)v6, v17, v18, v19, v20, v21, v22, v23);

    v15 = [ISTagIcon alloc];
    v16 = (_QWORD *)MEMORY[0x1E0CA5BA0];
    goto LABEL_15;
  }
  if (objc_msgSend(v3, "_IF_BOOLForKey:", *MEMORY[0x1E0C999D0]))
  {
    _ISDefaultLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      +[ISAliasIcon(Factory) _iconForValues:].cold.6();

    objc_msgSend(v3, "_IF_stringForKey:", *MEMORY[0x1E0C99AA8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v6, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[ISCustomIconManager sharedInstance](ISCustomIconManager, "sharedInstance");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "specialFolderTypeForURL:", v5);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        _ISDefaultLog();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          +[ISAliasIcon(Factory) _iconForValues:].cold.5();

        v24 = -[ISTypeIcon initWithType:]([ISTypeIcon alloc], "initWithType:", v30);
LABEL_17:

        if (v24)
          goto LABEL_21;
        goto LABEL_18;
      }
    }
    else
    {
      v5 = 0;
    }
    v32 = [ISTypeIcon alloc];
    v7 = -[ISTypeIcon initWithType:](v32, "initWithType:", *MEMORY[0x1E0CA5B58]);
LABEL_16:
    v24 = (ISTypeIcon *)v7;
    goto LABEL_17;
  }
LABEL_18:
  _ISDefaultLog();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    +[ISAliasIcon(Factory) _iconForValues:].cold.1();

  v26 = [ISTypeIcon alloc];
  v24 = -[ISTypeIcon initWithType:](v26, "initWithType:", *MEMORY[0x1E0CA5BA0]);
LABEL_21:

  return v24;
}

- (void)initWithBookmarkData:decorations:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_1AA928000, v0, v1, "Adding alias decoration for bookmark icon", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

@end
