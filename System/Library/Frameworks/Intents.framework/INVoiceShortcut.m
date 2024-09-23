@implementation INVoiceShortcut

- (id)_initWithIdentifier:(id)a3 invocationPhrase:(id)a4 shortcut:(id)a5
{
  id v9;
  id v10;
  id v11;
  INVoiceShortcut *v12;
  INVoiceShortcut *v13;
  uint64_t v14;
  NSString *invocationPhrase;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)INVoiceShortcut;
  v12 = -[INVoiceShortcut init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    v14 = objc_msgSend(v10, "copy");
    invocationPhrase = v13->_invocationPhrase;
    v13->_invocationPhrase = (NSString *)v14;

    objc_storeStrong((id *)&v13->_shortcut, a5);
  }

  return v13;
}

- (id)_initWithVCVoiceShortcut:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  INVoiceShortcut *v10;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "phrase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithUUIDString:", v7);

  objc_msgSend(v4, "shortcut");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    self = (INVoiceShortcut *)-[INVoiceShortcut _initWithIdentifier:invocationPhrase:shortcut:](self, "_initWithIdentifier:invocationPhrase:shortcut:", v8, v5, v9);
    v10 = self;
  }
  else
  {
    v11 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v13 = 136315394;
      v14 = "-[INVoiceShortcut _initWithVCVoiceShortcut:]";
      v15 = 2112;
      v16 = v4;
      _os_log_error_impl(&dword_18BEBC000, v11, OS_LOG_TYPE_ERROR, "%s Unexpectedly got nil INShortcut for voice shortcut %@", (uint8_t *)&v13, 0x16u);
    }
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p id: %@, phrase: %@, shortcut: %@>"), v5, self, self->_identifier, self->_invocationPhrase, self->_shortcut);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  INVoiceShortcut *v4;
  INVoiceShortcut *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (INVoiceShortcut *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[INVoiceShortcut identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[INVoiceShortcut identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[INVoiceShortcut invocationPhrase](self, "invocationPhrase");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[INVoiceShortcut invocationPhrase](v5, "invocationPhrase");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqual:", v9))
        {
          -[INVoiceShortcut shortcut](self, "shortcut");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[INVoiceShortcut shortcut](v5, "shortcut");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isEqual:", v11);

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (INVoiceShortcut)initWithCoder:(id)a3
{
  id v4;
  INVoiceShortcut *v5;
  uint64_t v6;
  NSUUID *identifier;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSString *invocationPhrase;
  uint64_t v13;
  INShortcut *shortcut;
  INVoiceShortcut *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)INVoiceShortcut;
  v5 = -[INVoiceShortcut init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("invocationPhrase"));
    v11 = objc_claimAutoreleasedReturnValue();
    invocationPhrase = v5->_invocationPhrase;
    v5->_invocationPhrase = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shortcut"));
    v13 = objc_claimAutoreleasedReturnValue();
    shortcut = v5->_shortcut;
    v5->_shortcut = (INShortcut *)v13;

    v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[INVoiceShortcut identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[INVoiceShortcut invocationPhrase](self, "invocationPhrase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("invocationPhrase"));

  -[INVoiceShortcut shortcut](self, "shortcut");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("shortcut"));

}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)invocationPhrase
{
  return self->_invocationPhrase;
}

- (INShortcut)shortcut
{
  return self->_shortcut;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcut, 0);
  objc_storeStrong((id *)&self->_invocationPhrase, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (INVoiceShortcut)initWithIntent:(id)a3
{
  id v4;
  INVoiceShortcut *v5;
  INShortcut *v6;
  INShortcut *shortcut;
  INVoiceShortcut *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)INVoiceShortcut;
  v5 = -[INVoiceShortcut init](&v10, sel_init);
  if (v5)
  {
    v6 = -[INShortcut initWithIntent:]([INShortcut alloc], "initWithIntent:", v4);
    shortcut = v5->_shortcut;
    v5->_shortcut = v6;

    v8 = v5;
  }

  return v5;
}

- (INVoiceShortcut)initWithUserActivity:(id)a3
{
  id v4;
  INVoiceShortcut *v5;
  INShortcut *v6;
  INShortcut *shortcut;
  INVoiceShortcut *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)INVoiceShortcut;
  v5 = -[INVoiceShortcut init](&v10, sel_init);
  if (v5)
  {
    v6 = -[INShortcut initWithUserActivity:]([INShortcut alloc], "initWithUserActivity:", v4);
    shortcut = v5->_shortcut;
    v5->_shortcut = v6;

    v8 = v5;
  }

  return v5;
}

- (id)intent
{
  void *v2;
  void *v3;

  -[INVoiceShortcut shortcut](self, "shortcut");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)userActivity
{
  void *v2;
  void *v3;

  -[INVoiceShortcut shortcut](self, "shortcut");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
