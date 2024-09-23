@implementation LNLinkEnumerationValueType

- (LNLinkEnumerationValueType)initWithEnumerationIdentifier:(id)a3
{
  id v5;
  LNLinkEnumerationValueType *v6;
  uint64_t v7;
  NSString *enumerationIdentifier;
  LNLinkEnumerationValueType *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNLinkEnumerationValueType.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enumerationIdentifier"));

  }
  v12.receiver = self;
  v12.super_class = (Class)LNLinkEnumerationValueType;
  v6 = -[LNValueType _init](&v12, sel__init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    enumerationIdentifier = v6->_enumerationIdentifier;
    v6->_enumerationIdentifier = (NSString *)v7;

    v9 = v6;
  }

  return v6;
}

- (Class)objectClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isEqual:(id)a3
{
  LNLinkEnumerationValueType *v4;
  LNLinkEnumerationValueType *v5;
  LNLinkEnumerationValueType *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;

  v4 = (LNLinkEnumerationValueType *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[LNLinkEnumerationValueType enumerationIdentifier](self, "enumerationIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNLinkEnumerationValueType enumerationIdentifier](v6, "enumerationIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7;
      v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
        v12 = 1;
      }
      else
      {
        v12 = 0;
        if (v9 && v10)
          v12 = objc_msgSend(v9, "isEqualToString:", v10);
      }

    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (NSString)enumerationIdentifier
{
  return self->_enumerationIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumerationIdentifier, 0);
}

- (id)typeIdentifierAsString
{
  return CFSTR("Enumeration");
}

- (LNLinkEnumerationValueType)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  LNLinkEnumerationValueType *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("enumerationIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[LNLinkEnumerationValueType initWithEnumerationIdentifier:](self, "initWithEnumerationIdentifier:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[LNLinkEnumerationValueType enumerationIdentifier](self, "enumerationIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("enumerationIdentifier"));

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[LNLinkEnumerationValueType enumerationIdentifier](self, "enumerationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (id)objectClassesForCoding
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", objc_opt_class());
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
