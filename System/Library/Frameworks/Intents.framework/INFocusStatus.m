@implementation INFocusStatus

- (INFocusStatus)initWithIsFocused:(NSNumber *)isFocused
{
  NSNumber *v4;
  INFocusStatus *v5;
  uint64_t v6;
  NSNumber *v7;
  objc_super v9;

  v4 = isFocused;
  v9.receiver = self;
  v9.super_class = (Class)INFocusStatus;
  v5 = -[INFocusStatus init](&v9, sel_init);
  if (v5)
  {
    v6 = -[NSNumber copy](v4, "copy");
    v7 = v5->_isFocused;
    v5->_isFocused = (NSNumber *)v6;

  }
  return v5;
}

- (unint64_t)hash
{
  return -[NSNumber hash](self->_isFocused, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INFocusStatus *v4;
  INFocusStatus *v5;
  NSNumber *isFocused;
  BOOL v7;

  v4 = (INFocusStatus *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      isFocused = self->_isFocused;
      v7 = isFocused == v5->_isFocused || -[NSNumber isEqual:](isFocused, "isEqual:");

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (INFocusStatus)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  INFocusStatus *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isFocused"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[INFocusStatus initWithIsFocused:](self, "initWithIsFocused:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_isFocused, CFSTR("isFocused"));
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_isFocused);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("isFocused"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INFocusStatus descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INFocusStatus;
  -[INFocusStatus description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INFocusStatus _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  NSNumber *isFocused;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("isFocused");
  isFocused = self->_isFocused;
  v3 = isFocused;
  if (!isFocused)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!isFocused)

  return v4;
}

- (NSNumber)isFocused
{
  return self->_isFocused;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isFocused, 0);
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

  v6 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isFocused"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIsFocused:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
