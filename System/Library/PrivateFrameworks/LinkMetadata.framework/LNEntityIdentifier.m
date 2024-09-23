@implementation LNEntityIdentifier

- (BOOL)isEqual:(id)a3
{
  LNEntityIdentifier *v4;
  LNEntityIdentifier *v5;
  LNEntityIdentifier *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v4 = (LNEntityIdentifier *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_20:

      goto LABEL_21;
    }
    -[LNEntityIdentifier typeIdentifier](self, "typeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNEntityIdentifier typeIdentifier](v6, "typeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      v14 = v9;
      if (!v9 || !v10)
      {
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      v12 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v12)
        goto LABEL_19;
    }
    -[LNEntityIdentifier instanceIdentifier](self, "instanceIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNEntityIdentifier instanceIdentifier](v6, "instanceIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v15;
    v17 = v16;
    v13 = v17;
    if (v14 == v17)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v14 && v17)
        LOBYTE(v12) = objc_msgSend(v14, "isEqualToString:", v17);
    }

    goto LABEL_18;
  }
  LOBYTE(v12) = 1;
LABEL_21:

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[LNEntityIdentifier typeIdentifier](self, "typeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNEntityIdentifier instanceIdentifier](self, "instanceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSString)instanceIdentifier
{
  return self->_instanceIdentifier;
}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceIdentifier, 0);
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
}

- (LNEntityIdentifier)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  LNEntityIdentifier *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("typeIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("instanceIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = -[LNEntityIdentifier initWithTypeIdentifier:instanceIdentifier:](self, "initWithTypeIdentifier:instanceIdentifier:", v5, v6);
    v8 = self;
  }

  return v8;
}

- (LNEntityIdentifier)initWithTypeIdentifier:(id)a3 instanceIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  LNEntityIdentifier *v10;
  uint64_t v11;
  NSString *typeIdentifier;
  unint64_t v13;
  NSObject *instanceIdentifier;
  uint64_t v15;
  NSString *v16;
  uint64_t v17;
  LNEntityIdentifier *v18;
  void *v20;
  void *v21;
  objc_super v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNEntityIdentifier.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("typeIdentifier"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNEntityIdentifier.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("instanceIdentifier"));

LABEL_3:
  v22.receiver = self;
  v22.super_class = (Class)LNEntityIdentifier;
  v10 = -[LNEntityIdentifier init](&v22, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    typeIdentifier = v10->_typeIdentifier;
    v10->_typeIdentifier = (NSString *)v11;

    v13 = objc_msgSend(v9, "length");
    if (v13 <= LNEntityIdentifierMaximumValueLength)
    {
      v17 = objc_msgSend(v9, "copy");
      instanceIdentifier = v10->_instanceIdentifier;
      v10->_instanceIdentifier = (NSString *)v17;
    }
    else
    {
      instanceIdentifier = os_log_create("com.apple.runtime-issues", "Link Runtime Issues");
      if (os_log_type_enabled(instanceIdentifier, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        v24 = LNEntityIdentifierMaximumValueLength;
        _os_log_fault_impl(&dword_19A9C7000, instanceIdentifier, OS_LOG_TYPE_FAULT, "Excessive identifier value length. Identifiers should be %ld characters or less, the supplied value was truncated.", buf, 0xCu);
      }
      objc_msgSend(v9, "substringToIndex:", LNEntityIdentifierMaximumValueLength);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v10->_instanceIdentifier;
      v10->_instanceIdentifier = (NSString *)v15;

    }
    v18 = v10;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[LNEntityIdentifier typeIdentifier](self, "typeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("typeIdentifier"));

  -[LNEntityIdentifier instanceIdentifier](self, "instanceIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("instanceIdentifier"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNEntityIdentifier)initWithString:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  LNEntityIdentifier *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v19;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNEntityIdentifier.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifierString"));

  }
  v6 = objc_msgSend(v5, "rangeOfString:", CFSTR("/"));
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    v9 = v6;
    v10 = v7;
    objc_msgSend(v5, "substringToIndex:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("."));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastObject");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (void *)v13;
    else
      v15 = v11;
    v16 = v15;

    objc_msgSend(v5, "substringFromIndex:", v9 + v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "length") && objc_msgSend(v17, "length"))
    {
      self = -[LNEntityIdentifier initWithTypeIdentifier:instanceIdentifier:](self, "initWithTypeIdentifier:instanceIdentifier:", v16, v17);
      v8 = self;
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[LNEntityIdentifier typeIdentifier](self, "typeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNEntityIdentifier instanceIdentifier](self, "instanceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)scope
{
  return 0;
}

- (LNEntityIdentifier)initWithValue:(id)a3 typeName:(id)a4
{
  return -[LNEntityIdentifier initWithTypeIdentifier:instanceIdentifier:](self, "initWithTypeIdentifier:instanceIdentifier:", a4, a3);
}

- (LNEntityIdentifier)initWithValue:(id)a3 scope:(int64_t)a4 typeName:(id)a5
{
  return -[LNEntityIdentifier initWithValue:typeName:](self, "initWithValue:typeName:", a3, a5);
}

@end
