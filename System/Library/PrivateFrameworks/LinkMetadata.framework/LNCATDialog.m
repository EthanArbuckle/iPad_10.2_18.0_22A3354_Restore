@implementation LNCATDialog

- (LNCATDialog)initWithIdentifier:(id)a3 templateDirectoryURL:(id)a4 parameters:(id)a5 localeIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  LNCATDialog *v15;
  uint64_t v16;
  NSString *identifier;
  uint64_t v18;
  NSURL *templateDirectoryURL;
  uint64_t v20;
  NSDictionary *parameters;
  LNCATDialog *v22;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNCATDialog.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("templateDirectoryURL"));

    if (v13)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNCATDialog.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  if (!v12)
    goto LABEL_8;
LABEL_3:
  if (v13)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNCATDialog.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameters"));

LABEL_4:
  v27.receiver = self;
  v27.super_class = (Class)LNCATDialog;
  v15 = -[LNDialog initWithLocaleIdentifier:](&v27, sel_initWithLocaleIdentifier_, v14);
  if (v15)
  {
    v16 = objc_msgSend(v11, "copy");
    identifier = v15->_identifier;
    v15->_identifier = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    templateDirectoryURL = v15->_templateDirectoryURL;
    v15->_templateDirectoryURL = (NSURL *)v18;

    v20 = objc_msgSend(v13, "copy");
    parameters = v15->_parameters;
    v15->_parameters = (NSDictionary *)v20;

    v22 = v15;
  }

  return v15;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)LNCATDialog;
  v3 = -[LNDialog hash](&v11, sel_hash);
  -[LNCATDialog identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[LNCATDialog templateDirectoryURL](self, "templateDirectoryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[LNCATDialog parameters](self, "parameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash") ^ v3;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  LNCATDialog *v4;
  LNCATDialog *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  objc_super v24;

  v4 = (LNCATDialog *)a3;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)LNCATDialog;
    if (-[LNDialog isEqual:](&v24, sel_isEqual_, v4))
    {
      v5 = v4;
      if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        LOBYTE(v11) = 0;
LABEL_29:

        goto LABEL_30;
      }
      -[LNCATDialog identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNCATDialog identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {

      }
      else
      {
        LOBYTE(v11) = 0;
        v12 = v9;
        v13 = v8;
        if (!v8 || !v9)
          goto LABEL_27;
        v14 = objc_msgSend(v8, "isEqual:", v9);

        if (!v14)
        {
          LOBYTE(v11) = 0;
LABEL_28:

          goto LABEL_29;
        }
      }
      -[LNCATDialog templateDirectoryURL](self, "templateDirectoryURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNCATDialog templateDirectoryURL](v5, "templateDirectoryURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v15;
      v17 = v16;
      v12 = v17;
      if (v13 == v17)
      {

      }
      else
      {
        LOBYTE(v11) = 0;
        v18 = v17;
        v19 = v13;
        if (!v13 || !v17)
        {
LABEL_26:

LABEL_27:
          goto LABEL_28;
        }
        v11 = objc_msgSend(v13, "isEqual:", v17);

        if (!v11)
          goto LABEL_27;
      }
      -[LNCATDialog parameters](self, "parameters");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNCATDialog parameters](v5, "parameters");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v20;
      v22 = v21;
      v18 = v22;
      if (v19 == v22)
      {
        LOBYTE(v11) = 1;
      }
      else
      {
        LOBYTE(v11) = 0;
        if (v19 && v22)
          LOBYTE(v11) = objc_msgSend(v19, "isEqualToDictionary:", v22);
      }

      goto LABEL_26;
    }
    LOBYTE(v11) = 0;
  }
LABEL_30:

  return v11;
}

- (LNCATDialog)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  LNCATDialog *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("templateDirectoryURL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("securityScopeData"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        MEMORY[0x19AECEE88](v6, v7);
      v8 = (void *)MEMORY[0x1E0C99E60];
      v9 = objc_opt_class();
      v10 = objc_opt_class();
      objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("parameters"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localeIdentifier"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          self = -[LNCATDialog initWithIdentifier:templateDirectoryURL:parameters:localeIdentifier:](self, "initWithIdentifier:templateDirectoryURL:parameters:localeIdentifier:", v5, v6, v12, v13);
          v14 = self;
        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
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
  v10.super_class = (Class)LNCATDialog;
  v4 = a3;
  -[LNDialog encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  -[LNCATDialog identifier](self, "identifier", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[LNCATDialog templateDirectoryURL](self, "templateDirectoryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("templateDirectoryURL"));

  -[LNCATDialog templateDirectoryURL](self, "templateDirectoryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x19AECEE94]();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("securityScopeData"));

  -[LNCATDialog parameters](self, "parameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("parameters"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSURL)templateDirectoryURL
{
  return self->_templateDirectoryURL;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (NSData)securityScopeData
{
  return self->_securityScopeData;
}

- (void)setSecurityScopeData:(id)a3
{
  objc_storeStrong((id *)&self->_securityScopeData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_securityScopeData, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_templateDirectoryURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
