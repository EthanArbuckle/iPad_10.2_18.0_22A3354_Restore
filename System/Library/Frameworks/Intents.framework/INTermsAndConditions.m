@implementation INTermsAndConditions

- (INTermsAndConditions)initWithLocalizedTermsAndConditionsText:(NSString *)localizedTermsAndConditionsText privacyPolicyURL:(NSURL *)privacyPolicyURL termsAndConditionsURL:(NSURL *)termsAndConditionsURL
{
  NSString *v8;
  NSURL *v9;
  NSURL *v10;
  INTermsAndConditions *v11;
  uint64_t v12;
  NSString *v13;
  uint64_t v14;
  NSURL *v15;
  uint64_t v16;
  NSURL *v17;
  objc_super v19;

  v8 = localizedTermsAndConditionsText;
  v9 = privacyPolicyURL;
  v10 = termsAndConditionsURL;
  v19.receiver = self;
  v19.super_class = (Class)INTermsAndConditions;
  v11 = -[INTermsAndConditions init](&v19, sel_init);
  if (v11)
  {
    v12 = -[NSString copy](v8, "copy");
    v13 = v11->_localizedTermsAndConditionsText;
    v11->_localizedTermsAndConditionsText = (NSString *)v12;

    v14 = -[NSURL copy](v9, "copy");
    v15 = v11->_privacyPolicyURL;
    v11->_privacyPolicyURL = (NSURL *)v14;

    v16 = -[NSURL copy](v10, "copy");
    v17 = v11->_termsAndConditionsURL;
    v11->_termsAndConditionsURL = (NSURL *)v16;

  }
  return v11;
}

- (INTermsAndConditions)init
{
  return -[INTermsAndConditions initWithLocalizedTermsAndConditionsText:privacyPolicyURL:termsAndConditionsURL:](self, "initWithLocalizedTermsAndConditionsText:privacyPolicyURL:termsAndConditionsURL:", &stru_1E2295770, 0, 0);
}

- (INTermsAndConditions)initWithCoder:(id)a3
{
  id v4;
  INTermsAndConditions *v5;
  uint64_t v6;
  NSString *localizedTermsAndConditionsText;
  uint64_t v8;
  NSURL *privacyPolicyURL;
  uint64_t v10;
  NSURL *termsAndConditionsURL;
  INTermsAndConditions *v12;
  NSObject *v13;
  int v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[INTermsAndConditions init](self, "init");
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedTermsAndConditionsText"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    localizedTermsAndConditionsText = v5->_localizedTermsAndConditionsText;
    v5->_localizedTermsAndConditionsText = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("privacyPolicyURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    privacyPolicyURL = v5->_privacyPolicyURL;
    v5->_privacyPolicyURL = (NSURL *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("termsAndConditionsURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    termsAndConditionsURL = v5->_termsAndConditionsURL;
    v5->_termsAndConditionsURL = (NSURL *)v10;

LABEL_4:
    v12 = v5;
    goto LABEL_8;
  }
  v13 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    v15 = 136315394;
    v16 = "-[INTermsAndConditions initWithCoder:]";
    v17 = 2080;
    v18 = "_localizedTermsAndConditionsText";
    _os_log_error_impl(&dword_18BEBC000, v13, OS_LOG_TYPE_ERROR, "%s Null value for %s", (uint8_t *)&v15, 0x16u);
  }
  v12 = 0;
LABEL_8:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *localizedTermsAndConditionsText;
  id v5;

  localizedTermsAndConditionsText = self->_localizedTermsAndConditionsText;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", localizedTermsAndConditionsText, CFSTR("localizedTermsAndConditionsText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_privacyPolicyURL, CFSTR("privacyPolicyURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_termsAndConditionsURL, CFSTR("termsAndConditionsURL"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  INTermsAndConditions *v4;
  void *v5;
  void *v6;
  void *v7;
  INTermsAndConditions *v8;

  v4 = [INTermsAndConditions alloc];
  -[INTermsAndConditions localizedTermsAndConditionsText](self, "localizedTermsAndConditionsText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INTermsAndConditions privacyPolicyURL](self, "privacyPolicyURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INTermsAndConditions termsAndConditionsURL](self, "termsAndConditionsURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[INTermsAndConditions initWithLocalizedTermsAndConditionsText:privacyPolicyURL:termsAndConditionsURL:](v4, "initWithLocalizedTermsAndConditionsText:privacyPolicyURL:termsAndConditionsURL:", v5, v6, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  INTermsAndConditions *v6;
  INTermsAndConditions *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;

  v6 = (INTermsAndConditions *)a3;
  if (v6 == self)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      -[INTermsAndConditions privacyPolicyURL](v7, "privacyPolicyURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8
        || (-[INTermsAndConditions privacyPolicyURL](self, "privacyPolicyURL"),
            (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[INTermsAndConditions privacyPolicyURL](v7, "privacyPolicyURL");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[INTermsAndConditions privacyPolicyURL](self, "privacyPolicyURL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v4, "isEqual:", v9);

        if (v8)
        {
LABEL_11:

          -[INTermsAndConditions termsAndConditionsURL](v7, "termsAndConditionsURL");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12
            || (-[INTermsAndConditions termsAndConditionsURL](self, "termsAndConditionsURL"),
                (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            -[INTermsAndConditions termsAndConditionsURL](v7, "termsAndConditionsURL");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[INTermsAndConditions termsAndConditionsURL](self, "termsAndConditionsURL");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v13, "isEqual:", v14);

            if (v12)
            {
LABEL_17:

              -[INTermsAndConditions localizedTermsAndConditionsText](v7, "localizedTermsAndConditionsText");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[INTermsAndConditions localizedTermsAndConditionsText](self, "localizedTermsAndConditionsText");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = objc_msgSend(v16, "isEqualToString:", v17) & v10 & v15;

              goto LABEL_18;
            }
          }
          else
          {
            v15 = 1;
          }

          goto LABEL_17;
        }
      }
      else
      {
        v10 = 1;
      }

      goto LABEL_11;
    }
    LOBYTE(v11) = 0;
  }
LABEL_18:

  return v11;
}

- (NSString)description
{
  return (NSString *)-[INTermsAndConditions descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INTermsAndConditions;
  -[INTermsAndConditions description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INTermsAndConditions _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  NSString *localizedTermsAndConditionsText;
  void *v4;
  NSURL *privacyPolicyURL;
  void *v6;
  NSURL *termsAndConditionsURL;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("localizedTermsAndConditionsText");
  localizedTermsAndConditionsText = self->_localizedTermsAndConditionsText;
  v4 = localizedTermsAndConditionsText;
  if (!localizedTermsAndConditionsText)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v4;
  v11[1] = CFSTR("privacyPolicyURL");
  privacyPolicyURL = self->_privacyPolicyURL;
  v6 = privacyPolicyURL;
  if (!privacyPolicyURL)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v6;
  v11[2] = CFSTR("termsAndConditionsURL");
  termsAndConditionsURL = self->_termsAndConditionsURL;
  v8 = termsAndConditionsURL;
  if (!termsAndConditionsURL)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (termsAndConditionsURL)
  {
    if (privacyPolicyURL)
      goto LABEL_9;
LABEL_12:

    if (localizedTermsAndConditionsText)
      return v9;
LABEL_13:

    return v9;
  }

  if (!privacyPolicyURL)
    goto LABEL_12;
LABEL_9:
  if (!localizedTermsAndConditionsText)
    goto LABEL_13;
  return v9;
}

- (NSString)localizedTermsAndConditionsText
{
  return self->_localizedTermsAndConditionsText;
}

- (NSURL)privacyPolicyURL
{
  return self->_privacyPolicyURL;
}

- (NSURL)termsAndConditionsURL
{
  return self->_termsAndConditionsURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsAndConditionsURL, 0);
  objc_storeStrong((id *)&self->_privacyPolicyURL, 0);
  objc_storeStrong((id *)&self->_localizedTermsAndConditionsText, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
