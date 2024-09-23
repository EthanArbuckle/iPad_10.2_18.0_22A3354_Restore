@implementation INAppIdentifier

- (INAppIdentifier)initWithBundleIdentifier:(id)a3 bundleVersion:(id)a4 appName:(id)a5
{
  id v8;
  id v9;
  id v10;
  INAppIdentifier *v11;
  uint64_t v12;
  NSString *bundleIdentifier;
  uint64_t v14;
  NSString *bundleVersion;
  uint64_t v16;
  NSString *appName;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)INAppIdentifier;
  v11 = -[INAppIdentifier init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    bundleIdentifier = v11->_bundleIdentifier;
    v11->_bundleIdentifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    bundleVersion = v11->_bundleVersion;
    v11->_bundleVersion = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    appName = v11->_appName;
    v11->_appName = (NSString *)v16;

  }
  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_bundleIdentifier, "hash");
  v4 = -[NSString hash](self->_bundleVersion, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_appName, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INAppIdentifier *v4;
  INAppIdentifier *v5;
  NSString *bundleIdentifier;
  NSString *bundleVersion;
  NSString *appName;
  BOOL v9;

  v4 = (INAppIdentifier *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      bundleIdentifier = self->_bundleIdentifier;
      v9 = 0;
      if (bundleIdentifier == v5->_bundleIdentifier || -[NSString isEqual:](bundleIdentifier, "isEqual:"))
      {
        bundleVersion = self->_bundleVersion;
        if (bundleVersion == v5->_bundleVersion || -[NSString isEqual:](bundleVersion, "isEqual:"))
        {
          appName = self->_appName;
          if (appName == v5->_appName || -[NSString isEqual:](appName, "isEqual:"))
            v9 = 1;
        }
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (INAppIdentifier)initWithCoder:(id)a3
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
  uint64_t v14;
  void *v15;
  void *v16;
  INAppIdentifier *v17;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("bundleIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, CFSTR("bundleVersion"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v15, CFSTR("appName"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[INAppIdentifier initWithBundleIdentifier:bundleVersion:appName:](self, "initWithBundleIdentifier:bundleVersion:appName:", v8, v12, v16);
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bundleIdentifier;
  id v5;

  bundleIdentifier = self->_bundleIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleVersion, CFSTR("bundleVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appName, CFSTR("appName"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_bundleIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("bundleIdentifier"));

  objc_msgSend(v6, "encodeObject:", self->_bundleVersion);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("bundleVersion"));

  objc_msgSend(v6, "encodeObject:", self->_appName);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("appName"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INAppIdentifier descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INAppIdentifier;
  -[INAppIdentifier description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppIdentifier _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  NSString *bundleIdentifier;
  void *v4;
  NSString *bundleVersion;
  void *v6;
  NSString *appName;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("bundleIdentifier");
  bundleIdentifier = self->_bundleIdentifier;
  v4 = bundleIdentifier;
  if (!bundleIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v4;
  v11[1] = CFSTR("bundleVersion");
  bundleVersion = self->_bundleVersion;
  v6 = bundleVersion;
  if (!bundleVersion)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v6;
  v11[2] = CFSTR("appName");
  appName = self->_appName;
  v8 = appName;
  if (!appName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (appName)
  {
    if (bundleVersion)
      goto LABEL_9;
LABEL_12:

    if (bundleIdentifier)
      return v9;
LABEL_13:

    return v9;
  }

  if (!bundleVersion)
    goto LABEL_12;
LABEL_9:
  if (!bundleIdentifier)
    goto LABEL_13;
  return v9;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (NSString)appName
{
  return self->_appName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBundleIdentifier:bundleVersion:appName:", v7, v8, v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
