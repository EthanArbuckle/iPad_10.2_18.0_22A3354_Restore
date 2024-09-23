@implementation ISDecoratedIcon

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ISDecoratedIcon)initWithIcon:(id)a3 decorations:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  ISDecoratedIcon *v18;
  ISDecoratedIcon *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  objc_super v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_opt_new();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "digest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v13);
  }

  objc_msgSend(MEMORY[0x1E0CB3A28], "_IF_UUIDByXORingUUIDs:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24.receiver = self;
  v24.super_class = (Class)ISDecoratedIcon;
  v18 = -[ISConcreteIcon initWithDigest:](&v24, sel_initWithDigest_, v17);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_icon, a3);
    v20 = objc_msgSend(v11, "copy");
    v21 = (void *)v20;
    if (v20)
      v22 = (void *)v20;
    else
      v22 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v19->_decorations, v22);

  }
  return v19;
}

- (ISDecoratedIcon)initWithCoder:(id)a3
{
  id v4;
  ISDecoratedIcon *v5;
  uint64_t v6;
  ISIcon *icon;
  uint64_t v8;
  NSArray *decorations;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ISDecoratedIcon;
  v5 = -[ISConcreteIcon initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    if (initWithCoder__onceToken != -1)
      dispatch_once(&initWithCoder__onceToken, &__block_literal_global_13);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("icon"));
    v6 = objc_claimAutoreleasedReturnValue();
    icon = v5->_icon;
    v5->_icon = (ISIcon *)v6;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__classes, CFSTR("decorations"));
    v8 = objc_claimAutoreleasedReturnValue();
    decorations = v5->_decorations;
    v5->_decorations = (NSArray *)v8;

  }
  return v5;
}

void __33__ISDecoratedIcon_initWithCoder___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__classes;
  initWithCoder__classes = v2;

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)ISDecoratedIcon;
  -[ISConcreteIcon encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_icon, CFSTR("icon"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_decorations, CFSTR("decorations"));

}

- (ISDecoratedIcon)iconWithDecorations:(id)a3
{
  id v4;
  ISDecoratedIcon *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = -[ISDecoratedIcon initWithIcon:decorations:]([ISDecoratedIcon alloc], "initWithIcon:decorations:", self->_icon, v4);

  +[ISIconManager sharedInstance](ISIconManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findOrRegisterIcon:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (ISDecoratedIcon *)v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)ISDecoratedIcon;
  -[ISDecoratedIcon description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISDecoratedIcon icon](self, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISDecoratedIcon decorations](self, "decorations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ icon: %@ decorations: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)decorations
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[ISIcon decorations](self->_icon, "decorations");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = (void *)MEMORY[0x1E0C9AA60];
  if (v3)
    v5 = (void *)v3;
  v6 = v5;

  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", self->_decorations);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (id)makeResourceProvider
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[ISDecoratedIcon icon](self, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v26 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "makeResourceProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v27 = (void *)objc_opt_new();
  v5 = objc_alloc(MEMORY[0x1E0C99DF0]);
  v25 = v4;
  objc_msgSend(v4, "resourceToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithData:", v6);

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[ISDecoratedIcon decorations](self, "decorations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = objc_msgSend(v13, "identifierKind");
          if (v14 == 1)
          {
            v18 = objc_alloc(MEMORY[0x1E0CA5870]);
            objc_msgSend(v13, "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v18, "initWithBundleIdentifier:allowPlaceholder:error:", v16, 1, 0);
LABEL_14:
            v19 = (void *)v17;

          }
          else
          {
            if (v14 == 2)
            {
              v15 = (void *)MEMORY[0x1E0CA5928];
              objc_msgSend(v13, "identifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "typeRecordWithIdentifier:", v16);
              v17 = objc_claimAutoreleasedReturnValue();
              goto LABEL_14;
            }
            v19 = 0;
          }
          +[ISResourceProvider resourceWithRecord:options:](ISResourceProvider, "resourceWithRecord:options:", v19, 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            objc_msgSend(v19, "persistentIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendData:", v21);

            objc_msgSend(v13, "uuid");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "setObject:forKey:", v20, v22);

          }
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v10);
  }

  objc_msgSend(v25, "setDecorationResources:", v27);
  v23 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v25, "setResourceToken:", v23);

  return v25;
}

- (id)symbol
{
  return -[ISIcon symbol](self->_icon, "symbol");
}

- (ISIcon)icon
{
  return (ISIcon *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_decorations, 0);
}

@end
