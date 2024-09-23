@implementation LNStaticDeferredLocalizedString

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedStringResource, 0);
  objc_storeStrong((id *)&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (NSString)table
{
  void (**v3)(_QWORD);
  NSString *v4;
  NSString *table;
  NSString *v6;
  _QWORD v8[5];

  os_unfair_lock_lock(&self->_getterLock);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__LNStaticDeferredLocalizedString_table__block_invoke;
  v8[3] = &unk_1E39A0FF0;
  v8[4] = self;
  v3 = (void (**)(_QWORD))MEMORY[0x19AECF158](v8);
  -[_NSLocalizedStringResource table](self->_localizedStringResource, "table");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  table = v4;
  if (!v4)
    table = self->_table;
  v6 = table;

  v3[2](v3);
  return v6;
}

void __40__LNStaticDeferredLocalizedString_table__block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

- (NSString)key
{
  void (**v3)(_QWORD);
  NSString *v4;
  NSString *key;
  NSString *v6;
  _QWORD v8[5];

  os_unfair_lock_lock(&self->_getterLock);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__LNStaticDeferredLocalizedString_key__block_invoke;
  v8[3] = &unk_1E39A0FF0;
  v8[4] = self;
  v3 = (void (**)(_QWORD))MEMORY[0x19AECF158](v8);
  -[_NSLocalizedStringResource key](self->_localizedStringResource, "key");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  key = v4;
  if (!v4)
    key = self->_key;
  v6 = key;

  v3[2](v3);
  return v6;
}

void __38__LNStaticDeferredLocalizedString_key__block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

- (NSURL)bundleURL
{
  void (**v3)(_QWORD);
  NSURL *v4;
  NSURL *bundleURL;
  NSURL *v6;
  _QWORD v8[5];

  os_unfair_lock_lock(&self->_getterLock);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__LNStaticDeferredLocalizedString_bundleURL__block_invoke;
  v8[3] = &unk_1E39A0FF0;
  v8[4] = self;
  v3 = (void (**)(_QWORD))MEMORY[0x19AECF158](v8);
  -[_NSLocalizedStringResource bundleURL](self->_localizedStringResource, "bundleURL");
  v4 = (NSURL *)objc_claimAutoreleasedReturnValue();
  bundleURL = v4;
  if (!v4)
    bundleURL = self->_bundleURL;
  v6 = bundleURL;

  v3[2](v3);
  return v6;
}

void __44__LNStaticDeferredLocalizedString_bundleURL__block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

- (BOOL)isEqual:(id)a3
{
  LNStaticDeferredLocalizedString *v4;
  LNStaticDeferredLocalizedString *v5;
  LNStaticDeferredLocalizedString *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  int v16;
  void *v17;
  void *v18;
  id v19;
  int v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  int v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  int v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  id v47;

  v4 = (LNStaticDeferredLocalizedString *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v15 = 0;
LABEL_52:

      goto LABEL_53;
    }
    -[LNStaticDeferredLocalizedString localizedStringResource](self, "localizedStringResource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[LNStaticDeferredLocalizedString localizedStringResource](self, "localizedStringResource");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "key");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNStaticDeferredLocalizedString localizedStringResource](v6, "localizedStringResource");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "key");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v9;
      v13 = v11;
      v14 = v13;
      if (v12 == v13)
      {

        goto LABEL_18;
      }
      v15 = 0;
      if (v12 && v13)
      {
        v16 = objc_msgSend(v12, "isEqualToString:", v13);

        if (!v16)
          goto LABEL_29;
LABEL_18:
        v47 = v10;
        -[LNStaticDeferredLocalizedString localizedStringResource](self, "localizedStringResource");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "defaultValue");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[LNStaticDeferredLocalizedString localizedStringResource](v6, "localizedStringResource");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "defaultValue");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v21;
        v24 = v22;
        v25 = v24;
        v45 = v8;
        if (v23 == v24)
        {

        }
        else
        {
          v15 = 0;
          v26 = v24;
          v27 = v23;
          if (!v23 || !v24)
          {
LABEL_44:

            goto LABEL_45;
          }
          v28 = objc_msgSend(v23, "isEqualToString:", v24);

          if (!v28)
          {
            v15 = 0;
LABEL_45:
            v29 = v44;
            v8 = v45;
LABEL_46:
            v41 = v14;

            v14 = v23;
            v10 = v47;
LABEL_49:

            v14 = v41;
            goto LABEL_50;
          }
        }
        -[LNStaticDeferredLocalizedString localizedStringResource](self, "localizedStringResource");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "table");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[LNStaticDeferredLocalizedString localizedStringResource](v6, "localizedStringResource");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "table");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v34;
        v36 = v35;
        v37 = v36;
        if (v26 == v36)
        {
          v15 = 1;
        }
        else
        {
          v15 = 0;
          if (v26 && v36)
            v15 = objc_msgSend(v26, "isEqualToString:", v36);
        }

        goto LABEL_44;
      }
      v29 = v12;
LABEL_48:
      v41 = v14;
      goto LABEL_49;
    }
    -[LNStaticDeferredLocalizedString key](self, "key");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNStaticDeferredLocalizedString key](v6, "key");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v17;
    v19 = v18;
    v12 = v19;
    if (v8 == v19)
    {

    }
    else
    {
      v15 = 0;
      if (!v8 || !v19)
      {
        v14 = v19;
        v10 = v8;
        goto LABEL_50;
      }
      v20 = objc_msgSend(v8, "isEqualToString:", v19);

      if (!v20)
      {
        v15 = 0;
LABEL_51:

        goto LABEL_52;
      }
    }
    -[LNStaticDeferredLocalizedString defaultValue](self, "defaultValue");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNStaticDeferredLocalizedString defaultValue](v6, "defaultValue");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v30;
    v32 = v31;
    v14 = v32;
    if (v10 == v32)
    {

    }
    else
    {
      v15 = 0;
      if (!v10 || !v32)
      {
        v29 = v10;
        goto LABEL_48;
      }
      v33 = objc_msgSend(v10, "isEqualToString:", v32);

      if (!v33)
      {
LABEL_29:
        v15 = 0;
LABEL_50:

        goto LABEL_51;
      }
    }
    -[LNStaticDeferredLocalizedString table](self, "table");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNStaticDeferredLocalizedString table](v6, "table");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v38;
    v40 = v39;
    v46 = v29;
    v47 = v10;
    if (v29 == v40)
    {
      v15 = 1;
      v25 = v29;
      v23 = v29;
    }
    else
    {
      v25 = v40;
      v15 = 0;
      if (v29 && v40)
        v15 = objc_msgSend(v29, "isEqualToString:", v40);
      v23 = v25;
    }
    goto LABEL_46;
  }
  v15 = 1;
LABEL_53:

  return v15;
}

- (_NSLocalizedStringResource)localizedStringResource
{
  void (**v3)(_QWORD);
  _NSLocalizedStringResource *localizedStringResource;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _NSLocalizedStringResource *v14;
  _NSLocalizedStringResource *v15;
  _NSLocalizedStringResource *v16;
  _QWORD v18[5];

  os_unfair_lock_lock(&self->_localizedStringResourceLock);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __58__LNStaticDeferredLocalizedString_localizedStringResource__block_invoke;
  v18[3] = &unk_1E39A0FF0;
  v18[4] = self;
  v3 = (void (**)(_QWORD))MEMORY[0x19AECF158](v18);
  localizedStringResource = self->_localizedStringResource;
  if (!localizedStringResource)
  {
    -[LNStaticDeferredLocalizedString bundleURL](self, "bundleURL");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForCurrentProcess");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "URL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v5 = v7;

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "bundleURL");
        v5 = (id)objc_claimAutoreleasedReturnValue();

        if (!v5)
        {
          v16 = 0;
          goto LABEL_8;
        }
      }
    }
    v9 = objc_alloc(MEMORY[0x1E0CB3B78]);
    -[LNStaticDeferredLocalizedString key](self, "key");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNStaticDeferredLocalizedString defaultValue](self, "defaultValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNStaticDeferredLocalizedString table](self, "table");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (_NSLocalizedStringResource *)objc_msgSend(v9, "initWithKey:defaultValue:table:locale:bundleURL:", v10, v11, v12, v13, v5);
    v15 = self->_localizedStringResource;
    self->_localizedStringResource = v14;

    localizedStringResource = self->_localizedStringResource;
  }
  v16 = localizedStringResource;
LABEL_8:
  v3[2](v3);

  return v16;
}

void __58__LNStaticDeferredLocalizedString_localizedStringResource__block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  -[LNStaticDeferredLocalizedString localizedStringResource](self, "localizedStringResource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[LNStaticDeferredLocalizedString localizedStringResource](self, "localizedStringResource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "key");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hash");
    -[LNStaticDeferredLocalizedString localizedStringResource](self, "localizedStringResource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "table");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hash") ^ v6;

  }
  else
  {
    -[LNStaticDeferredLocalizedString key](self, "key");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "hash");
    -[LNStaticDeferredLocalizedString defaultValue](self, "defaultValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v5, "hash") ^ v10;
    -[LNStaticDeferredLocalizedString table](self, "table");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11 ^ objc_msgSend(v7, "hash");
  }

  return v9;
}

- (NSString)defaultValue
{
  void (**v3)(_QWORD);
  NSString *v4;
  NSString *defaultValue;
  NSString *v6;
  _QWORD v8[5];

  os_unfair_lock_lock(&self->_getterLock);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__LNStaticDeferredLocalizedString_defaultValue__block_invoke;
  v8[3] = &unk_1E39A0FF0;
  v8[4] = self;
  v3 = (void (**)(_QWORD))MEMORY[0x19AECF158](v8);
  -[_NSLocalizedStringResource defaultValue](self->_localizedStringResource, "defaultValue");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  defaultValue = v4;
  if (!v4)
    defaultValue = self->_defaultValue;
  v6 = defaultValue;

  v3[2](v3);
  return v6;
}

void __47__LNStaticDeferredLocalizedString_defaultValue__block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

- (LNStaticDeferredLocalizedString)initWithKey:(id)a3 defaultValue:(id)a4 table:(id)a5 bundleURL:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  LNStaticDeferredLocalizedString *v15;
  uint64_t v16;
  NSString *key;
  uint64_t v18;
  NSString *defaultValue;
  uint64_t v20;
  NSString *table;
  uint64_t v22;
  NSURL *bundleURL;
  LNStaticDeferredLocalizedString *v24;
  void *v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNStaticDeferredLocalizedString.m"), 158, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  v15 = -[LNStaticDeferredLocalizedString _init](self, "_init");
  if (v15)
  {
    v16 = objc_msgSend(v11, "copy");
    key = v15->_key;
    v15->_key = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    defaultValue = v15->_defaultValue;
    v15->_defaultValue = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    table = v15->_table;
    v15->_table = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    bundleURL = v15->_bundleURL;
    v15->_bundleURL = (NSURL *)v22;

    v24 = v15;
  }

  return v15;
}

- (LNStaticDeferredLocalizedString)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  LNStaticDeferredLocalizedString *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedStringResource"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    self = -[LNStaticDeferredLocalizedString initWithLocalizedStringResource:](self, "initWithLocalizedStringResource:", v5);
    v7 = self;
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("table"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultValue"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleURL"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[LNStaticDeferredLocalizedString initWithKey:defaultValue:table:bundleURL:](self, "initWithKey:defaultValue:table:bundleURL:", v6, v9, v8, v10);

      v7 = self;
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (LNStaticDeferredLocalizedString)initWithLocalizedStringResource:(id)a3
{
  id v6;
  id *v7;
  LNStaticDeferredLocalizedString *v8;
  LNStaticDeferredLocalizedString *v9;
  void *v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNStaticDeferredLocalizedString.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("localizedStringResource"));

  }
  v7 = -[LNStaticDeferredLocalizedString _init](self, "_init");
  v8 = (LNStaticDeferredLocalizedString *)v7;
  if (v7)
  {
    objc_storeStrong(v7 + 6, a3);
    v9 = v8;
  }

  return v8;
}

- (id)_init
{
  LNStaticDeferredLocalizedString *v2;
  LNStaticDeferredLocalizedString *v3;
  LNStaticDeferredLocalizedString *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LNStaticDeferredLocalizedString;
  v2 = -[LNStaticDeferredLocalizedString init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)&v2->_getterLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (LNStaticDeferredLocalizedString)localizedStringWithPluralizationNumber:(id)a3 forLocaleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[LNStaticDeferredLocalizedString localizedStringResource](self, "localizedStringResource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[LNStaticDeferredLocalizedString localizedStringResource](self, "localizedStringResource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");

    if (v7)
      objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v7);
    else
      objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLocale:", v12);

    v13 = objc_alloc_init(MEMORY[0x1E0CB3B80]);
    objc_msgSend(v13, "setPluralizationNumber:", v6);
    objc_msgSend(v10, "localizeWithOptions:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[LNStaticDeferredLocalizedString key](self, "key");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (LNStaticDeferredLocalizedString *)v11;
}

- (id)localizedStringForLocaleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[LNStaticDeferredLocalizedString localizedStringResource](self, "localizedStringResource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[LNStaticDeferredLocalizedString localizedStringResource](self, "localizedStringResource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    if (v4)
      objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v4);
    else
      objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLocale:", v9);

    objc_msgSend(v7, "localize");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[LNStaticDeferredLocalizedString key](self, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[LNStaticDeferredLocalizedString localizedStringResource](self, "localizedStringResource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("localizedStringResource"));

  -[LNStaticDeferredLocalizedString key](self, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("key"));

  -[LNStaticDeferredLocalizedString defaultValue](self, "defaultValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("defaultValue"));

  -[LNStaticDeferredLocalizedString bundleURL](self, "bundleURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("bundleURL"));

  -[LNStaticDeferredLocalizedString table](self, "table");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("table"));

}

- (LNStaticDeferredLocalizedString)initWithKey:(id)a3 table:(id)a4 bundleURL:(id)a5
{
  return -[LNStaticDeferredLocalizedString initWithKey:defaultValue:table:bundleURL:](self, "initWithKey:defaultValue:table:bundleURL:", a3, 0, a4, a5);
}

- (id)_dictionaryRepresenation
{
  LNStaticDeferredLocalizedString *v2;
  void *v3;

  v2 = self;
  LNStaticDeferredLocalizedString._dictionaryRepresentation()();

  v3 = (void *)sub_19AB82578();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)_initWithDictionary:(id)a3
{
  id result;

  sub_19AB82584();
  LNStaticDeferredLocalizedString.init(dictionary:)();
  return result;
}

- (id)localizedStringForLocaleIdentifier:(id)a3 bundleURL:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0CB3B78];
  v8 = a4;
  v9 = [v7 alloc];
  -[LNStaticDeferredLocalizedString key](self, "key");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNStaticDeferredLocalizedString defaultValue](self, "defaultValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNStaticDeferredLocalizedString table](self, "table");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v9, "initWithKey:defaultValue:table:locale:bundleURL:", v10, v11, v12, v13, v8);

  if (v6)
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v6);
  else
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLocale:", v15);

  objc_msgSend(v14, "localize");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (LNStaticDeferredLocalizedString)localizedStringWithReplacements:(id)a3 forLocaleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v6 = a3;
  v7 = a4;
  -[LNStaticDeferredLocalizedString localizedStringResource](self, "localizedStringResource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[LNStaticDeferredLocalizedString key](self, "key");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[LNStaticDeferredLocalizedString table](self, "table");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNStaticDeferredLocalizedString bundleURL](self, "bundleURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithReplacements:table:bundleURL:localeIdentifier:", v6, v10, v11, v7);
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v12;
  }

  return (LNStaticDeferredLocalizedString *)v9;
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[LNStaticDeferredLocalizedString localizedStringResource](self, "localizedStringResource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[LNStaticDeferredLocalizedString localizedStringResource](self, "localizedStringResource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p, localizedStringResource: %@>"), v6, self, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[LNStaticDeferredLocalizedString key](self, "key");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNStaticDeferredLocalizedString defaultValue](self, "defaultValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNStaticDeferredLocalizedString table](self, "table");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNStaticDeferredLocalizedString bundleURL](self, "bundleURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p, key: %@, defaultValue: %@, table: %@, bundleURL: %@>"), v6, self, v7, v9, v10, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v8;
}

- (unint64_t)length
{
  void *v2;
  unint64_t v3;

  -[LNStaticDeferredLocalizedString key](self, "key");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  void *v4;

  -[LNStaticDeferredLocalizedString key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(a3) = objc_msgSend(v4, "characterAtIndex:", a3);

  return a3;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;

  length = a4.length;
  location = a4.location;
  -[LNStaticDeferredLocalizedString key](self, "key");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getCharacters:range:", a3, location, length);

}

- (Class)classForKeyedArchiver
{
  return (Class)objc_opt_class();
}

- (LNStaticDeferredLocalizedString)initWithLocalizedKey:(id)a3 bundleIdentifier:(id)a4 bundleURL:(id)a5 table:(id)a6
{
  return -[LNStaticDeferredLocalizedString initWithKey:table:bundleURL:](self, "initWithKey:table:bundleURL:", a3, a6, a5);
}

- (NSString)bundleIdentifier
{
  return 0;
}

- (NSString)localizedKey
{
  return (NSString *)-[LNStaticDeferredLocalizedString localizedStringForLocaleIdentifier:](self, "localizedStringForLocaleIdentifier:", 0);
}

@end
