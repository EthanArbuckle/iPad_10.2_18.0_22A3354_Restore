@implementation INMediaSubItem

- (INMediaSubItem)initWithIdentifier:(id)a3 assetInfo:(id)a4
{
  id v6;
  id v7;
  INMediaSubItem *v8;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  NSString *assetInfo;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)INMediaSubItem;
  v8 = -[INMediaSubItem init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    assetInfo = v8->_assetInfo;
    v8->_assetInfo = (NSString *)v11;

  }
  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_identifier, "hash");
  return -[NSString hash](self->_assetInfo, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  INMediaSubItem *v4;
  INMediaSubItem *v5;
  NSString *identifier;
  NSString *assetInfo;
  BOOL v8;

  v4 = (INMediaSubItem *)a3;
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
      identifier = self->_identifier;
      v8 = 0;
      if (identifier == v5->_identifier || -[NSString isEqual:](identifier, "isEqual:"))
      {
        assetInfo = self->_assetInfo;
        if (assetInfo == v5->_assetInfo || -[NSString isEqual:](assetInfo, "isEqual:"))
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

- (INMediaSubItem)initWithCoder:(id)a3
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
  INMediaSubItem *v13;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, CFSTR("assetInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[INMediaSubItem initWithIdentifier:assetInfo:](self, "initWithIdentifier:assetInfo:", v8, v12);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_assetInfo, CFSTR("assetInfo"));

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
  objc_msgSend(v6, "encodeObject:", self->_identifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("identifier"));

  objc_msgSend(v6, "encodeObject:", self->_assetInfo);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("assetInfo"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INMediaSubItem descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INMediaSubItem;
  -[INMediaSubItem description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INMediaSubItem _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  NSString *identifier;
  void *v4;
  NSString *assetInfo;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("identifier");
  identifier = self->_identifier;
  v4 = identifier;
  if (!identifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("assetInfo");
  v10[0] = v4;
  assetInfo = self->_assetInfo;
  v6 = assetInfo;
  if (!assetInfo)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!assetInfo)
  {

    if (identifier)
      return v7;
LABEL_9:

    return v7;
  }
  if (!identifier)
    goto LABEL_9;
  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)assetInfo
{
  return self->_assetInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetInfo, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
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
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("assetInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:assetInfo:", v7, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
