@implementation DNDAppInfo

- (DNDAppInfo)initWithSource:(int64_t)a3 applicationIdentifier:(id)a4 displayName:(id)a5 storeIconURL:(id)a6 cachedIconURL:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  DNDAppInfo *v16;
  DNDAppInfo *v17;
  uint64_t v18;
  DNDApplicationIdentifier *applicationIdentifier;
  uint64_t v20;
  NSString *displayName;
  uint64_t v22;
  NSURL *storeIconURL;
  uint64_t v24;
  NSURL *cachedIconURL;
  objc_super v27;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)DNDAppInfo;
  v16 = -[DNDAppInfo init](&v27, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_source = a3;
    v18 = objc_msgSend(v12, "copy");
    applicationIdentifier = v17->_applicationIdentifier;
    v17->_applicationIdentifier = (DNDApplicationIdentifier *)v18;

    v20 = objc_msgSend(v13, "copy");
    displayName = v17->_displayName;
    v17->_displayName = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    storeIconURL = v17->_storeIconURL;
    v17->_storeIconURL = (NSURL *)v22;

    v24 = objc_msgSend(v15, "copy");
    cachedIconURL = v17->_cachedIconURL;
    v17->_cachedIconURL = (NSURL *)v24;

  }
  return v17;
}

- (id)_initWithAppInfo:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  DNDAppInfo *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "source");
  objc_msgSend(v4, "applicationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storeIconURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cachedIconURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[DNDAppInfo initWithSource:applicationIdentifier:displayName:storeIconURL:cachedIconURL:](self, "initWithSource:applicationIdentifier:displayName:storeIconURL:cachedIconURL:", v5, v6, v7, v8, v9);
  return v10;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;

  v3 = -[DNDAppInfo source](self, "source");
  -[DNDAppInfo applicationIdentifier](self, "applicationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  -[DNDAppInfo displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[DNDAppInfo storeIconURL](self, "storeIconURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");
  -[DNDAppInfo cachedIconURL](self, "cachedIconURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  DNDAppInfo *v4;
  DNDAppInfo *v5;
  int64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;

  v4 = (DNDAppInfo *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[DNDAppInfo source](self, "source");
      if (v6 != -[DNDAppInfo source](v5, "source"))
      {
        v15 = 0;
LABEL_53:

        goto LABEL_54;
      }
      -[DNDAppInfo applicationIdentifier](self, "applicationIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDAppInfo applicationIdentifier](v5, "applicationIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[DNDAppInfo applicationIdentifier](self, "applicationIdentifier");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          v15 = 0;
          goto LABEL_52;
        }
        v10 = (void *)v9;
        -[DNDAppInfo applicationIdentifier](v5, "applicationIdentifier");
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v15 = 0;
LABEL_51:

          goto LABEL_52;
        }
        v12 = (void *)v11;
        -[DNDAppInfo applicationIdentifier](self, "applicationIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDAppInfo applicationIdentifier](v5, "applicationIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:", v14))
        {
          v15 = 0;
LABEL_50:

          goto LABEL_51;
        }
        v51 = v14;
        v52 = v13;
        v53 = v12;
        v54 = v10;
      }
      -[DNDAppInfo displayName](self, "displayName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDAppInfo displayName](v5, "displayName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 != v17)
      {
        -[DNDAppInfo displayName](self, "displayName");
        v18 = objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v19 = (void *)v18;
          -[DNDAppInfo displayName](v5, "displayName");
          v20 = objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            v21 = (void *)v20;
            v50 = v16;
            -[DNDAppInfo displayName](self, "displayName");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDAppInfo displayName](v5, "displayName");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v22, "isEqual:", v23) & 1) == 0)
            {

              goto LABEL_40;
            }
            v45 = v22;
            v46 = v21;
            v47 = v19;
            v16 = v23;
            goto LABEL_19;
          }

        }
        goto LABEL_40;
      }
      v50 = v16;
LABEL_19:
      -[DNDAppInfo storeIconURL](self, "storeIconURL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDAppInfo storeIconURL](v5, "storeIconURL");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24 == v49)
      {
        v48 = v24;
        goto LABEL_27;
      }
      -[DNDAppInfo storeIconURL](self, "storeIconURL");
      v25 = objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v26 = (void *)v25;
        -[DNDAppInfo storeIconURL](v5, "storeIconURL");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          v42 = v16;
          v44 = v27;
          -[DNDAppInfo storeIconURL](self, "storeIconURL");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDAppInfo storeIconURL](v5, "storeIconURL");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v28, "isEqual:", v29) & 1) != 0)
          {
            v39 = v29;
            v40 = v28;
            v41 = v26;
            v48 = v24;
            v16 = v42;
LABEL_27:
            -[DNDAppInfo cachedIconURL](self, "cachedIconURL");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDAppInfo cachedIconURL](v5, "cachedIconURL");
            v31 = objc_claimAutoreleasedReturnValue();
            if (v30 == (void *)v31)
            {

              v15 = 1;
            }
            else
            {
              v32 = (void *)v31;
              -[DNDAppInfo cachedIconURL](self, "cachedIconURL");
              v33 = objc_claimAutoreleasedReturnValue();
              if (v33)
              {
                v43 = (void *)v33;
                -[DNDAppInfo cachedIconURL](v5, "cachedIconURL");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                if (v34)
                {
                  v38 = v34;
                  -[DNDAppInfo cachedIconURL](self, "cachedIconURL");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  -[DNDAppInfo cachedIconURL](v5, "cachedIconURL");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  v15 = objc_msgSend(v37, "isEqual:", v35);

                  v34 = v38;
                }
                else
                {
                  v15 = 0;
                }

              }
              else
              {

                v15 = 0;
              }
            }
            if (v48 != v49)
            {

            }
            if (v50 != v17)
            {

            }
LABEL_49:
            v12 = v53;
            v10 = v54;
            v13 = v52;
            v14 = v51;
            if (v7 != v8)
              goto LABEL_50;
LABEL_52:

            goto LABEL_53;
          }

          v16 = v42;
          v27 = v44;
        }

      }
      if (v50 != v17)
      {

      }
LABEL_40:
      v15 = 0;
      goto LABEL_49;
    }
    v15 = 0;
  }
LABEL_54:

  return v15;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[DNDAppInfo source](self, "source"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDAppInfo applicationIdentifier](self, "applicationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDAppInfo displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDAppInfo storeIconURL](self, "storeIconURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDAppInfo cachedIconURL](self, "cachedIconURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; source: %@; applicationIdentifier: %@; displayName: %@; storeIconURL: %@; cachedIconURL: %@>"),
    v4,
    self,
    v5,
    v6,
    v7,
    v9,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDAppInfo _initWithAppInfo:](+[DNDMutableAppInfo allocWithZone:](DNDMutableAppInfo, "allocWithZone:", a3), "_initWithAppInfo:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDAppInfo)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  DNDAppInfo *v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("source"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeIconURL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLWithString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cachedIconURL"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  v13 = -[DNDAppInfo initWithSource:applicationIdentifier:displayName:storeIconURL:cachedIconURL:](self, "initWithSource:applicationIdentifier:displayName:storeIconURL:cachedIconURL:", v5, v6, v7, v10, v12);

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDAppInfo source](self, "source"), CFSTR("source"));
  -[DNDAppInfo applicationIdentifier](self, "applicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("applicationIdentifier"));

  -[DNDAppInfo displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("displayName"));

  -[DNDAppInfo storeIconURL](self, "storeIconURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("storeIconURL"));

  -[DNDAppInfo cachedIconURL](self, "cachedIconURL");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("cachedIconURL"));

}

- (int64_t)source
{
  return self->_source;
}

- (DNDApplicationIdentifier)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSURL)storeIconURL
{
  return self->_storeIconURL;
}

- (NSURL)cachedIconURL
{
  return self->_cachedIconURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedIconURL, 0);
  objc_storeStrong((id *)&self->_storeIconURL, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end
