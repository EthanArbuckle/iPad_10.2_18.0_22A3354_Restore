@implementation LNAppShortcutActionData

- (LNAppShortcutActionData)initWithAction:(id)a3 typeMap:(id)a4
{
  id v7;
  id v8;
  void *v9;
  LNAppShortcutActionData *v10;
  uint64_t v11;
  LNAction *action;
  uint64_t v13;
  NSDictionary *identifiersByTypeMap;
  LNAppShortcutActionData *v15;
  void *v17;
  void *v18;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAppShortcutActionData.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAppShortcutActionData.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("typeMap"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)LNAppShortcutActionData;
  v10 = -[LNAppShortcutActionData init](&v19, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    action = v10->_action;
    v10->_action = (LNAction *)v11;

    v13 = objc_msgSend(v9, "copy");
    identifiersByTypeMap = v10->_identifiersByTypeMap;
    v10->_identifiersByTypeMap = (NSDictionary *)v13;

    v15 = v10;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  LNAppShortcutActionData *v4;
  LNAppShortcutActionData *v5;
  LNAppShortcutActionData *v6;
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

  v4 = (LNAppShortcutActionData *)a3;
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
    -[LNAppShortcutActionData action](self, "action");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAppShortcutActionData action](v6, "action");
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
    -[LNAppShortcutActionData identifiersByTypeMap](self, "identifiersByTypeMap");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAppShortcutActionData identifiersByTypeMap](v6, "identifiersByTypeMap");
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
        LOBYTE(v12) = objc_msgSend(v14, "isEqual:", v17);
    }

    goto LABEL_18;
  }
  LOBYTE(v12) = 1;
LABEL_21:

  return v12;
}

- (LNAppShortcutActionData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  LNAppShortcutActionData *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("action"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifiersByTypeMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[LNAppShortcutActionData initWithAction:typeMap:](self, "initWithAction:typeMap:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[LNAppShortcutActionData action](self, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("action"));

  -[LNAppShortcutActionData identifiersByTypeMap](self, "identifiersByTypeMap");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("identifiersByTypeMap"));

}

- (LNAction)action
{
  return self->_action;
}

- (NSDictionary)identifiersByTypeMap
{
  return self->_identifiersByTypeMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersByTypeMap, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
