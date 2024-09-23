@implementation IDSDictionaryInvitationContext

- (IDSDictionaryInvitationContext)initWithDictionary:(id)a3 schema:(id)a4
{
  id v7;
  id v8;
  IDSDictionaryInvitationContext *v9;
  IDSDictionaryInvitationContext *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSDictionaryInvitationContext;
  v9 = -[IDSDictionaryInvitationContext init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_schemaIdentifier, a4);
    v10->_contextType = 1;
    objc_storeStrong((id *)&v10->_dictionary, a3);
  }

  return v10;
}

- (IDSDictionaryInvitationContext)initWithPayload:(id)a3
{
  id v4;
  IDSDictionaryInvitationContext *v5;
  uint64_t v6;
  NSString *schemaIdentifier;
  void *v8;
  uint64_t v9;
  NSDictionary *dictionary;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IDSDictionaryInvitationContext;
  v5 = -[IDSDictionaryInvitationContext init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D344B0]);
    v6 = objc_claimAutoreleasedReturnValue();
    schemaIdentifier = v5->_schemaIdentifier;
    v5->_schemaIdentifier = (NSString *)v6;

    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D344B8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_contextType = (int)objc_msgSend(v8, "intValue");

    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D344A0]);
    v9 = objc_claimAutoreleasedReturnValue();
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v9;

  }
  return v5;
}

- (id)payload
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKey:", self->_schemaIdentifier, *MEMORY[0x1E0D344B0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_contextType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, *MEMORY[0x1E0D344B8]);

  objc_msgSend(v3, "setObject:forKey:", self->_dictionary, *MEMORY[0x1E0D344A0]);
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IDSDictionaryInvitationContext schemaIdentifier](self, "schemaIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[IDSDictionaryInvitationContext contextType](self, "contextType");
  -[IDSDictionaryInvitationContext payload](self, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<IDSDictionaryInvitationContext %p>: schemaIdentifier %@ contextType %ld payload %@"), self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[IDSDictionaryInvitationContext contextType](self, "contextType");
    if (v6 == objc_msgSend(v5, "contextType")
      && (-[IDSDictionaryInvitationContext schemaIdentifier](self, "schemaIdentifier"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v5, "schemaIdentifier"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v7, "isEqual:", v8),
          v8,
          v7,
          v9))
    {
      -[IDSDictionaryInvitationContext dictionary](self, "dictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dictionary");
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

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IDSDictionaryInvitationContext payload](self, "payload");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("contextPayload"));

}

- (IDSDictionaryInvitationContext)initWithCoder:(id)a3
{
  objc_class *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  IDSDictionaryInvitationContext *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;

  v3 = (objc_class *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v22 = [v3 alloc];
  v21 = objc_opt_class();
  v20 = objc_opt_class();
  v19 = objc_opt_class();
  v18 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = (void *)objc_msgSend(v22, "initWithObjects:", v21, v20, v19, v18, v5, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("contextPayload"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[IDSDictionaryInvitationContext initWithPayload:](self, "initWithPayload:", v15);
  return v16;
}

- (NSString)schemaIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)contextType
{
  return self->_contextType;
}

- (NSDictionary)dictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_schemaIdentifier, 0);
}

@end
