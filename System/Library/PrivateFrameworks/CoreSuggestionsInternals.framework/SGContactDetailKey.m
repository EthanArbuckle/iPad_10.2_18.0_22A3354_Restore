@implementation SGContactDetailKey

- (SGContactDetailKey)initWithSerialized:(id)a3
{
  id v5;
  void *v6;
  SGIdentityKey *v7;
  void *v8;
  SGIdentityKey *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  SGContactDetailKey *v14;
  void *v15;
  void *v17;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGContactDetailKey.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serialized"));

  }
  SGDelimitedStringsDeserialize();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [SGIdentityKey alloc];
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SGIdentityKey initWithSerialized:](v7, "initWithSerialized:", v8);
  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", &stru_1E7DB83A8);
  if ((v11 & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEqualToString:", &stru_1E7DB83A8))
  {
    v14 = -[SGContactDetailKey initWithIdentityKey:label:normalizedValue:](self, "initWithIdentityKey:label:normalizedValue:", v9, v12, 0);
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SGContactDetailKey initWithIdentityKey:label:normalizedValue:](self, "initWithIdentityKey:label:normalizedValue:", v9, v12, v15);

  }
  if ((v11 & 1) == 0)

  return v14;
}

- (id)serialize
{
  void *v2;
  void *v3;

  -[SGIdentityKey serialize](self->_identityKey, "serialize");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SGDelimitedStringsSerialize();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (SGContactDetailKey)initWithIdentityKey:(id)a3 label:(id)a4 normalizedValue:(id)a5
{
  id v9;
  id v10;
  id v11;
  SGContactDetailKey *v12;
  SGContactDetailKey *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SGContactDetailKey;
  v12 = -[SGContactDetailKey init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identityKey, a3);
    objc_storeStrong((id *)&v13->_label, a4);
    objc_storeStrong((id *)&v13->_value, a5);
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  SGContactDetailKey *v4;
  SGContactDetailKey *v5;
  BOOL v6;

  v4 = (SGContactDetailKey *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGContactDetailKey isEqualToContactDetailKey:](self, "isEqualToContactDetailKey:", v5);

  return v6;
}

- (BOOL)isEqualToContactDetailKey:(id)a3
{
  SGContactDetailKey *v4;
  SGContactDetailKey *v5;
  SGIdentityKey *identityKey;
  SGIdentityKey *v7;
  SGIdentityKey *v8;
  SGIdentityKey *v9;
  BOOL v10;
  char v11;
  NSString *label;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  char v16;
  NSString *v17;
  NSString *v18;

  v4 = (SGContactDetailKey *)a3;
  v5 = v4;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    identityKey = self->_identityKey;
    v7 = v4->_identityKey;
    if (identityKey == v7)
    {

    }
    else
    {
      v8 = v7;
      v9 = identityKey;
      v10 = -[SGIdentityKey isEqual:](v9, "isEqual:", v8);

      if (!v10)
        goto LABEL_9;
    }
    label = self->_label;
    v13 = v5->_label;
    if (label == v13)
    {

    }
    else
    {
      v14 = v13;
      v15 = label;
      v16 = -[NSString isEqual:](v15, "isEqual:", v14);

      if ((v16 & 1) == 0)
      {
LABEL_9:
        v11 = 0;
        goto LABEL_15;
      }
    }
    v17 = self->_value;
    v18 = v17;
    if (v17 == v5->_value)
      v11 = 1;
    else
      v11 = -[NSString isEqual:](v17, "isEqual:");

  }
LABEL_15:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;

  v3 = -[SGIdentityKey hash](self->_identityKey, "hash");
  v4 = -[NSString hash](self->_label, "hash") - v3 + 32 * v3;
  return -[NSString hash](self->_value, "hash") - v4 + 32 * v4;
}

- (NSString)description
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<SGContactDetailKey identityKey:%@ label:%@ value:%@>"), self->_identityKey, self->_label, self->_value);
}

- (SGIdentityKey)identityKey
{
  return self->_identityKey;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identityKey, 0);
}

+ (id)prefixForForIdentityKey:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "serialize");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SGDelimitedStringsSerialize();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)isSupportedEntityType:(int64_t)a3
{
  _BOOL4 v4;
  void *v7;

  if ((unint64_t)a3 >= 0x1C)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGContactDetailKey.m"), 84, CFSTR("Unknown entity type: %lu"), a3);

    LOBYTE(v4) = 0;
  }
  else
  {
    return (0xF8CFC0u >> a3) & 1;
  }
  return v4;
}

@end
