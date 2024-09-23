@implementation SGMessageKey

- (SGMessageKey)initWithSource:(id)a3 uniqueIdentifier:(id)a4
{
  id v8;
  id v9;
  void *v10;
  SGMessageKey *v11;
  SGMessageKey *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGMessageKey.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("source"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGMessageKey.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uniqueIdentifier"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)SGMessageKey;
  v11 = -[SGMessageKey init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_uniqueIdentifier, a4);
    objc_storeStrong((id *)&v12->_source, a3);
  }

  return v12;
}

- (SGMessageKey)initWithSerialized:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  SGMessageKey *v9;
  void *v11;
  void *v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGMessageKey.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serialized"));

  }
  SGDelimitedStringsDeserialize();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") != 2 && objc_msgSend(v6, "count") != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGMessageKey.m"), 38, CFSTR("Invalid serialization"));

  }
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SGMessageKey initWithSource:uniqueIdentifier:](self, "initWithSource:uniqueIdentifier:", v7, v8);

  return v9;
}

- (id)serialize
{
  return (id)SGDelimitedStringsSerialize();
}

- (BOOL)isEqual:(id)a3
{
  SGMessageKey *v4;
  SGMessageKey *v5;
  BOOL v6;

  v4 = (SGMessageKey *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGMessageKey isEqualToMessageKey:](self, "isEqualToMessageKey:", v5);

  return v6;
}

- (BOOL)isEqualToMessageKey:(id)a3
{
  SGMessageKey *v4;
  SGMessageKey *v5;
  NSString *source;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  char v11;
  NSString *v12;
  NSString *v13;

  v4 = (SGMessageKey *)a3;
  v5 = v4;
  if (self == v4)
  {
    v11 = 1;
    goto LABEL_11;
  }
  source = self->_source;
  v7 = v4->_source;
  if (source == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = source;
    v10 = -[NSString isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
    {
      v11 = 0;
      goto LABEL_11;
    }
  }
  v12 = self->_uniqueIdentifier;
  v13 = v12;
  if (v12 == v5->_uniqueIdentifier)
    v11 = 1;
  else
    v11 = -[NSString isEqual:](v12, "isEqual:");

LABEL_11:
  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_source, "hash");
  return -[NSString hash](self->_uniqueIdentifier, "hash") - v3 + 32 * v3;
}

- (NSString)description
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<SGMessageKey source:%@ uniqueIdentifier:%@>"), self->_source, self->_uniqueIdentifier);
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)source
{
  return self->_source;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

+ (BOOL)isSupportedEntityType:(int64_t)a3
{
  _BOOL4 v4;
  void *v7;

  if ((unint64_t)a3 >= 0x1C)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGMessageKey.m"), 81, CFSTR("Unknown entity type: %lu"), a3);

    LOBYTE(v4) = 0;
  }
  else
  {
    return (0x52020u >> a3) & 1;
  }
  return v4;
}

@end
