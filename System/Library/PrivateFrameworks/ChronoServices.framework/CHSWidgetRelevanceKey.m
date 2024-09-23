@implementation CHSWidgetRelevanceKey

- (CHSWidgetRelevanceKey)initWithExtensionIdentity:(id)a3 kind:(id)a4
{
  id v6;
  id v7;
  CHSWidgetRelevanceKey *v8;
  uint64_t v9;
  CHSExtensionIdentity *extensionIdentity;
  uint64_t v11;
  NSString *kind;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CHSWidgetRelevanceKey;
  v8 = -[CHSWidgetRelevanceKey init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    extensionIdentity = v8->_extensionIdentity;
    v8->_extensionIdentity = (CHSExtensionIdentity *)v9;

    v11 = objc_msgSend(v7, "copy");
    kind = v8->_kind;
    v8->_kind = (NSString *)v11;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  CHSExtensionIdentity *extensionIdentity;
  uint64_t v7;
  id v8;
  id v9;
  NSString *kind;
  id v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  id (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  extensionIdentity = self->_extensionIdentity;
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __33__CHSWidgetRelevanceKey_isEqual___block_invoke;
  v19[3] = &unk_1E2A5A268;
  v8 = v4;
  v20 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", extensionIdentity, v19);
  kind = self->_kind;
  v14 = v7;
  v15 = 3221225472;
  v16 = __33__CHSWidgetRelevanceKey_isEqual___block_invoke_2;
  v17 = &unk_1E2A5A268;
  v11 = v8;
  v18 = v11;
  v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", kind, &v14);
  LOBYTE(v8) = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);

  return (char)v8;
}

id __33__CHSWidgetRelevanceKey_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

id __33__CHSWidgetRelevanceKey_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_extensionIdentity);
  v5 = (id)objc_msgSend(v3, "appendString:", self->_kind);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (id)description
{
  void *v2;
  CHSExtensionIdentity *extensionIdentity;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  extensionIdentity = self->_extensionIdentity;
  -[CHSWidgetRelevanceKey kind](self, "kind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@-%@"), extensionIdentity, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)matches:(id)a3
{
  id v4;
  CHSExtensionIdentity *extensionIdentity;
  void *v6;
  NSString *kind;
  void *v8;
  BOOL v9;

  v4 = a3;
  extensionIdentity = self->_extensionIdentity;
  objc_msgSend(v4, "extensionIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CHSExtensionIdentity isEqual:](extensionIdentity, "isEqual:", v6))
  {
    kind = self->_kind;
    objc_msgSend(v4, "kind");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NSString isEqualToString:](kind, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CHSWidgetRelevanceKey)initWithCoder:(id)a3
{
  id v4;
  CHSWidgetRelevanceKey *v5;
  uint64_t v6;
  CHSExtensionIdentity *extensionIdentity;
  uint64_t v8;
  NSString *kind;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CHSWidgetRelevanceKey;
  v5 = -[CHSWidgetRelevanceKey init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensionIdentity"));
    v6 = objc_claimAutoreleasedReturnValue();
    extensionIdentity = v5->_extensionIdentity;
    v5->_extensionIdentity = (CHSExtensionIdentity *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kind"));
    v8 = objc_claimAutoreleasedReturnValue();
    kind = v5->_kind;
    v5->_kind = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_extensionIdentity, CFSTR("extensionIdentity"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_kind, CFSTR("kind"));

}

- (CHSExtensionIdentity)extensionIdentity
{
  return self->_extensionIdentity;
}

- (NSString)kind
{
  return self->_kind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_extensionIdentity, 0);
}

@end
