@implementation EMObject

- (EMObject)initWithObjectID:(id)a3
{
  id v4;
  EMObject *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)EMObject;
  v5 = -[EMObject init](&v7, sel_init);
  if (v5)
  {
    if (!v4)
      v4 = -[EMObjectID initAsEphemeralID:]([EMObjectID alloc], "initAsEphemeralID:", 1);
    -[EMObject _commonInitWithObjectID:](v5, "_commonInitWithObjectID:", v4);
  }

  return v5;
}

- (void)_commonInitWithObjectID:(id)a3
{
  EMObjectID *v4;
  EMObjectID *objectID;
  id v6;

  v6 = a3;
  v4 = (EMObjectID *)objc_msgSend(v6, "copy");
  objectID = self->_objectID;
  self->_objectID = v4;

}

- (BOOL)isEqual:(id)a3
{
  EMObject *v4;
  EMObject *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (EMObject *)a3;
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
      -[EMObject objectID](self, "objectID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMObject objectID](v5, "objectID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[EMObject objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (EMObjectID)objectID
{
  return self->_objectID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectID, 0);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[EMObject objectID](self, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_objectID"));

}

- (NSString)ef_publicDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[EMObject objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringHash");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ef_publicDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p: %@>"), v4, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (EMObject)initWithCoder:(id)a3
{
  id v4;
  EMObject *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EMObject;
  v5 = -[EMObject init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_objectID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMObject _commonInitWithObjectID:](v5, "_commonInitWithObjectID:", v6);

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[EMObject objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>\n\tObjectID: %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)setObjectID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

@end
