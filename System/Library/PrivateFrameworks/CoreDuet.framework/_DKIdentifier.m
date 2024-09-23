@implementation _DKIdentifier

+ (id)identifierWithString:(id)a3 type:(id)a4
{
  id v5;
  id v6;
  _DKIdentifier *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_DKIdentifier initWithString:type:]([_DKIdentifier alloc], "initWithString:type:", v6, v5);

  return v7;
}

- (_DKIdentifier)initWithString:(id)a3 type:(id)a4
{
  id v7;
  id v8;
  _DKIdentifier *v9;
  _DKIdentifier *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_DKIdentifier;
  v9 = -[_DKObject init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_stringValue, a3);
    objc_storeStrong((id *)&v10->_identifierType, a4);
  }

  return v10;
}

- (id)toPBCodable
{
  _DKPRValue *v3;
  _DKPRValueType *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(_DKPRValue);
  v4 = objc_alloc_init(_DKPRValueType);
  -[_DKPRValue setType:]((uint64_t)v3, v4);
  -[_DKPRValue type]((uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKPRValueType setType:]((uint64_t)v5, 2);

  -[_DKIdentifier identifierType](self, "identifierType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "typeCode");
  -[_DKPRValue type]((uint64_t)v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKPRValueType setTypeCode:]((uint64_t)v8, v7);

  -[_DKIdentifier stringValue](self, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKPRValue setStringValue:]((uint64_t)v3, v9);

  return v3;
}

- (NSString)stringValue
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (_DKIdentifierType)identifierType
{
  return (_DKIdentifierType *)objc_getProperty(self, a2, 48, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_DKIdentifier;
  v4 = a3;
  -[_DKObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_stringValue, CFSTR("stringValue"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifierType, CFSTR("identifierType"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierType, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
}

- (int64_t)typeCode
{
  void *v2;
  int64_t v3;

  -[_DKIdentifier identifierType](self, "identifierType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "typeCode");

  return v3;
}

- (int64_t)integerValue
{
  void *v2;
  int64_t v3;

  -[_DKIdentifier stringValue](self, "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (double)doubleValue
{
  void *v2;
  double v3;

  -[_DKIdentifier stringValue](self, "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (double)(unint64_t)objc_msgSend(v2, "hash");

  return v3;
}

- (_DKIdentifier)initWithCoder:(id)a3
{
  id v4;
  _DKIdentifier *v5;
  uint64_t v6;
  NSString *stringValue;
  uint64_t v8;
  _DKIdentifierType *identifierType;
  _DKIdentifier *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_DKIdentifier;
  v5 = -[_DKObject initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stringValue"));
    v6 = objc_claimAutoreleasedReturnValue();
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifierType"));
    v8 = objc_claimAutoreleasedReturnValue();
    identifierType = v5->_identifierType;
    v5->_identifierType = (_DKIdentifierType *)v8;

    v10 = v5;
  }

  return v5;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSString *stringValue;
  _DKIdentifierType *identifierType;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  stringValue = self->_stringValue;
  identifierType = self->_identifierType;
  v11.receiver = self;
  v11.super_class = (Class)_DKIdentifier;
  -[_DKObject description](&v11, sel_description);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { stringValue=%@, identifierType=%@; %@}"),
    v5,
    stringValue,
    identifierType,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (id)objectType
{
  return self->_identifierType;
}

- (int64_t)compareValue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  unsigned int v11;
  int64_t v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "identifierType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKIdentifier identifierType](self, "identifierType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if (v8)
    {
      objc_msgSend(v5, "stringValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DKIdentifier stringValue](self, "stringValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

      v12 = v11 - 1;
    }
    else
    {
      v12 = -1;
    }

  }
  else
  {
    v12 = -1;
  }

  return v12;
}

- (id)primaryValue
{
  return self->_stringValue;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  _DKIdentifier *v5;
  _DKIdentifier *v6;
  _DKIdentifier *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  objc_super v18;

  v5 = (_DKIdentifier *)a3;
  v6 = v5;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18.receiver = self;
        v18.super_class = (Class)_DKIdentifier;
        if (-[_DKObject isEqual:](&v18, sel_isEqual_, v6))
        {
          v7 = v6;
          -[_DKIdentifier stringValue](self, "stringValue");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[_DKIdentifier stringValue](v7, "stringValue");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8 != v9)
          {
            -[_DKIdentifier stringValue](self, "stringValue");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            -[_DKIdentifier stringValue](v7, "stringValue");
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v10, "isEqualToString:", v3))
            {
              v11 = 0;
LABEL_15:

LABEL_16:
              goto LABEL_17;
            }
            v17 = v10;
          }
          -[_DKIdentifier identifierType](self, "identifierType");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[_DKIdentifier identifierType](v7, "identifierType");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12 == v13)
          {
            v11 = 1;
          }
          else
          {
            -[_DKIdentifier identifierType](self, "identifierType");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[_DKIdentifier identifierType](v7, "identifierType");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v14, "isEqual:", v15);

          }
          v10 = v17;
          if (v8 == v9)
            goto LABEL_16;
          goto LABEL_15;
        }
      }
    }
    v11 = 0;
  }
LABEL_17:

  return v11;
}

- (void)setStringValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void)setIdentifierType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

+ (id)fromPBCodable:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    -[_DKPRValue stringValue]((uint64_t)v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKPRValue type]((uint64_t)v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[_DKObjectType objectTypeWithTypeCode:](_DKIdentifierType, "objectTypeWithTypeCode:", -[_DKPRValueType typeCode]((uint64_t)v6));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKIdentifier identifierWithString:type:](_DKIdentifier, "identifierWithString:type:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)entityName
{
  return CFSTR("Identifier");
}

+ (id)objectFromManagedObject:(id)a3 readMetadata:(BOOL)a4 excludedMetadataKeys:(id)a5 cache:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id *v21;
  id v22;
  BOOL v23;

  v7 = a4;
  v9 = a3;
  v10 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v9;
    v12 = v11;
    if (v10)
    {
      objc_msgSend(v11, "string");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v12, "identifierType"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("id-%@"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __95___DKIdentifier_MOConversion__objectFromManagedObject_readMetadata_excludedMetadataKeys_cache___block_invoke;
      v19[3] = &unk_1E26E6538;
      v22 = a1;
      v20 = v12;
      v23 = v7;
      v21 = (id *)v10;
      -[_DKObjectFromMOCache objectForKey:type:setIfMissingWithBlock:](v21, v13, v16, v19);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(a1, "_identifierFromManagedObject:readMetadata:cache:", v11, v7, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)_identifierFromManagedObject:(id)a3 readMetadata:(BOOL)a4 cache:(id)a5
{
  id v6;
  id *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;

  v6 = a3;
  v7 = (id *)a5;
  objc_msgSend(v6, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[_DKObjectFromMOCache deduplicateString:](v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v6, "identifierType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __79___DKIdentifier_MOConversion___identifierFromManagedObject_readMetadata_cache___block_invoke;
    v15[3] = &unk_1E26E6510;
    v16 = v6;
    -[_DKObjectFromMOCache objectForKey:type:setIfMissingWithBlock:](v7, v10, CFSTR("_DKid"), v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  else
  {
    +[_DKObjectType objectTypeWithTypeCode:](_DKIdentifierType, "objectTypeWithTypeCode:", objc_msgSend(v6, "identifierType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[_DKIdentifier identifierWithString:type:](_DKIdentifier, "identifierWithString:type:", v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "copyBaseObjectInfoFromManagedObject:cache:", v6, v7))
    v13 = v12;
  else
    v13 = 0;

  return v13;
}

- (BOOL)copyToManagedObject:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v10.receiver = self,
        v10.super_class = (Class)_DKIdentifier,
        -[_DKObject copyToManagedObject:](&v10, sel_copyToManagedObject_, v4)))
  {
    v5 = v4;
    -[_DKIdentifier stringValue](self, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setString:", v6);

    -[_DKIdentifier identifierType](self, "identifierType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIdentifierType:", objc_msgSend(v7, "typeCode"));

    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
