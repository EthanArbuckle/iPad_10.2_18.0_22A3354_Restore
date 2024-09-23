@implementation INWorkoutCustomization

- (INWorkoutCustomization)initWithFocus:(id)a3 environment:(id)a4
{
  id v6;
  id v7;
  INWorkoutCustomization *v8;
  uint64_t v9;
  NSString *focus;
  uint64_t v11;
  NSString *environment;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)INWorkoutCustomization;
  v8 = -[INWorkoutCustomization init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    focus = v8->_focus;
    v8->_focus = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    environment = v8->_environment;
    v8->_environment = (NSString *)v11;

  }
  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_focus, "hash");
  return -[NSString hash](self->_environment, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  INWorkoutCustomization *v4;
  INWorkoutCustomization *v5;
  NSString *focus;
  NSString *environment;
  BOOL v8;

  v4 = (INWorkoutCustomization *)a3;
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
      focus = self->_focus;
      v8 = 0;
      if (focus == v5->_focus || -[NSString isEqual:](focus, "isEqual:"))
      {
        environment = self->_environment;
        if (environment == v5->_environment || -[NSString isEqual:](environment, "isEqual:"))
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

- (INWorkoutCustomization)initWithCoder:(id)a3
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
  INWorkoutCustomization *v13;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("focus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, CFSTR("environment"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[INWorkoutCustomization initWithFocus:environment:](self, "initWithFocus:environment:", v8, v12);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *focus;
  id v5;

  focus = self->_focus;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", focus, CFSTR("focus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_environment, CFSTR("environment"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_focus);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("focus"));

  objc_msgSend(v6, "encodeObject:", self->_environment);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("environment"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INWorkoutCustomization descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INWorkoutCustomization;
  -[INWorkoutCustomization description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INWorkoutCustomization _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  NSString *focus;
  void *v4;
  NSString *environment;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("focus");
  focus = self->_focus;
  v4 = focus;
  if (!focus)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("environment");
  v10[0] = v4;
  environment = self->_environment;
  v6 = environment;
  if (!environment)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!environment)
  {

    if (focus)
      return v7;
LABEL_9:

    return v7;
  }
  if (!focus)
    goto LABEL_9;
  return v7;
}

- (NSString)focus
{
  return self->_focus;
}

- (NSString)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_focus, 0);
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

  v6 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("focus"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("environment"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFocus:environment:", v7, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
