@implementation INVoiceCommandStepInfo

- (INVoiceCommandStepInfo)initWithApplicationIdentifier:(id)a3 category:(int64_t)a4 name:(id)a5
{
  id v8;
  id v9;
  INVoiceCommandStepInfo *v10;
  uint64_t v11;
  NSString *applicationIdentifier;
  uint64_t v13;
  NSString *name;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)INVoiceCommandStepInfo;
  v10 = -[INVoiceCommandStepInfo init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    applicationIdentifier = v10->_applicationIdentifier;
    v10->_applicationIdentifier = (NSString *)v11;

    v10->_category = a4;
    v13 = objc_msgSend(v9, "copy");
    name = v10->_name;
    v10->_name = (NSString *)v13;

  }
  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  uint64_t v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_applicationIdentifier, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_category);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ v3 ^ -[NSString hash](self->_name, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  INVoiceCommandStepInfo *v4;
  INVoiceCommandStepInfo *v5;
  NSString *applicationIdentifier;
  NSString *name;
  BOOL v8;

  v4 = (INVoiceCommandStepInfo *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      applicationIdentifier = self->_applicationIdentifier;
      v8 = 0;
      if ((applicationIdentifier == v5->_applicationIdentifier
         || -[NSString isEqual:](applicationIdentifier, "isEqual:"))
        && self->_category == v5->_category)
      {
        name = self->_name;
        if (name == v5->_name || -[NSString isEqual:](name, "isEqual:"))
          v8 = 1;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (INVoiceCommandStepInfo)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  INVoiceCommandStepInfo *v14;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("applicationIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("category"));
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v12, CFSTR("name"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[INVoiceCommandStepInfo initWithApplicationIdentifier:category:name:](self, "initWithApplicationIdentifier:category:name:", v8, v9, v13);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *applicationIdentifier;
  id v5;

  applicationIdentifier = self->_applicationIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", applicationIdentifier, CFSTR("applicationIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_category, CFSTR("category"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_applicationIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("applicationIdentifier"));

  v9 = self->_category - 1;
  if (v9 > 0x13)
    v10 = CFSTR("unknown");
  else
    v10 = off_1E2292DC8[v9];
  v11 = v10;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("category"));

  objc_msgSend(v6, "encodeObject:", self->_name);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("name"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INVoiceCommandStepInfo descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INVoiceCommandStepInfo;
  -[INVoiceCommandStepInfo description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INVoiceCommandStepInfo _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  NSString *applicationIdentifier;
  void *v4;
  void *v5;
  NSString *name;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("applicationIdentifier");
  applicationIdentifier = self->_applicationIdentifier;
  v4 = applicationIdentifier;
  if (!applicationIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = v4;
  v10[1] = CFSTR("category");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_category);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  v10[2] = CFSTR("name");
  name = self->_name;
  v7 = name;
  if (!name)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!name)

  if (!applicationIdentifier)
  return v8;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (int64_t)category
{
  return self->_category;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
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
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("applicationIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = INIntentCategoryWithString(v8);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithApplicationIdentifier:category:name:", v7, v9, v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
