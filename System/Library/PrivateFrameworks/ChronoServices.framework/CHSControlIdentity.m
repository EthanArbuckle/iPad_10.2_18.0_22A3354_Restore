@implementation CHSControlIdentity

- (CHSControlIdentity)initWithExtensionIdentity:(id)a3 kind:(id)a4 intent:(id)a5
{
  id v8;
  id v9;
  id v10;
  CHSIntentReference *v11;
  CHSControlIdentity *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
    v11 = -[CHSIntentReference initWithIntent:]([CHSIntentReference alloc], "initWithIntent:", v10);
  else
    v11 = 0;
  v12 = -[CHSControlIdentity initWithExtensionIdentity:kind:intentReference:](self, "initWithExtensionIdentity:kind:intentReference:", v8, v9, v11);

  return v12;
}

- (CHSControlIdentity)initWithExtensionIdentity:(id)a3 kind:(id)a4 intentReference:(id)a5
{
  id v8;
  id v9;
  id v10;
  CHSControlIdentity *v11;
  uint64_t v12;
  CHSExtensionIdentity *extensionIdentity;
  uint64_t v14;
  NSString *kind;
  uint64_t v16;
  CHSIntentReference *intentReference;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CHSControlIdentity;
  v11 = -[CHSControlIdentity init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    extensionIdentity = v11->_extensionIdentity;
    v11->_extensionIdentity = (CHSExtensionIdentity *)v12;

    v14 = objc_msgSend(v9, "copy");
    kind = v11->_kind;
    v11->_kind = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    intentReference = v11->_intentReference;
    v11->_intentReference = (CHSIntentReference *)v16;

  }
  return v11;
}

- (BOOL)matches:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[CHSControlIdentity extensionIdentity](self, "extensionIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (BSEqualObjects())
  {
    -[CHSControlIdentity kind](self, "kind");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "kind");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = BSEqualStrings();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  CHSControlIdentity *v4;
  CHSControlIdentity *v5;
  int64_t v6;
  BOOL v7;

  v4 = (CHSControlIdentity *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[CHSExtensionIdentity isEqual:](self->_extensionIdentity, "isEqual:", v5->_extensionIdentity)
        && -[NSString isEqualToString:](self->_kind, "isEqualToString:", v5->_kind))
      {
        v6 = -[CHSIntentReference stableHash](self->_intentReference, "stableHash");
        v7 = v6 == -[CHSIntentReference stableHash](v5->_intentReference, "stableHash");
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHSControlIdentity extensionIdentity](self, "extensionIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  -[CHSControlIdentity kind](self, "kind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendString:", v6);

  v8 = (id)objc_msgSend(v3, "appendInt64:", -[CHSIntentReference stableHash](self->_intentReference, "stableHash"));
  v9 = objc_msgSend(v3, "hash");

  return v9;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CHSControlIdentity *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__CHSControlIdentity_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E2A5A290;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", 0, v6);

}

id __51__CHSControlIdentity_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "extensionIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("extensionIdentity"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "kind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:", v6, CFSTR("kind"));

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("intent"), 1);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (id)_loggingIdentifier
{
  CHSIntentReference *intentReference;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  intentReference = self->_intentReference;
  if (intentReference)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[CHSIntentReference stableHash](intentReference, "stableHash"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringValue");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = CFSTR("-");
  }
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[CHSExtensionIdentity description](self->_extensionIdentity, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("[%@:%@:%@]"), v7, self->_kind, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_extensionIdentity, CFSTR("extId"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_kind, CFSTR("kind"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_intentReference, CFSTR("intentRef"));

}

- (CHSControlIdentity)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CHSControlIdentity *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kind"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("intentRef")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intentRef"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v8 = -[CHSControlIdentity initWithExtensionIdentity:kind:intentReference:](self, "initWithExtensionIdentity:kind:intentReference:", v5, v6, v7);

  return v8;
}

- (CHSExtensionIdentity)extensionIdentity
{
  return self->_extensionIdentity;
}

- (NSString)kind
{
  return self->_kind;
}

- (CHSIntentReference)intentReference
{
  return self->_intentReference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentReference, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_extensionIdentity, 0);
}

@end
