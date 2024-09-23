@implementation EMMailboxObjectID

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

- (EMMailboxObjectID)initWithURL:(id)a3
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  id *v9;
  EMMailboxObjectID *v10;
  objc_super v12;
  objc_super v13;

  v5 = a3;
  objc_msgSend(v5, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("ephemeral"));

  if (v7)
  {
    objc_msgSend(v5, "host");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13.receiver = self;
    v13.super_class = (Class)EMMailboxObjectID;
    v9 = -[EMObjectID initAsEphemeralID:representedObjectID:](&v13, sel_initAsEphemeralID_representedObjectID_, 1, v8);

    if (!v9)
      goto LABEL_6;
    goto LABEL_5;
  }
  v12.receiver = self;
  v12.super_class = (Class)EMMailboxObjectID;
  v9 = -[EMObjectID initAsEphemeralID:](&v12, sel_initAsEphemeralID_, 0);
  if (v9)
LABEL_5:
    objc_storeStrong(v9 + 5, a3);
LABEL_6:
  objc_msgSend(v9, "cachedSelf");
  v10 = (EMMailboxObjectID *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  EMMailboxObjectID *v4;
  EMMailboxObjectID *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = (EMMailboxObjectID *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[EMObjectID isEphemeral](self, "isEphemeral"))
      {
        v10.receiver = self;
        v10.super_class = (Class)EMMailboxObjectID;
        v6 = -[EMObjectID isEqual:](&v10, sel_isEqual_, v5);
      }
      else
      {
        -[EMMailboxObjectID url](self, "url");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[EMMailboxObjectID url](v5, "url");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v7, "isEqual:", v8);

      }
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  objc_super v6;

  if (-[EMObjectID isEphemeral](self, "isEphemeral"))
  {
    v6.receiver = self;
    v6.super_class = (Class)EMMailboxObjectID;
    return -[EMObjectID hash](&v6, sel_hash);
  }
  else
  {
    -[EMMailboxObjectID url](self, "url");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "hash");

  }
  return v3;
}

- (NSURL)url
{
  return self->_url;
}

void __37__EMMailboxObjectID_encodeWithCoder___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  objc_super v5;

  v2 = *(_QWORD *)(a1 + 32);
  v5.receiver = *(id *)(a1 + 40);
  v5.super_class = (Class)EMMailboxObjectID;
  objc_msgSendSuper2(&v5, sel_encodeWithCoder_, v2);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_url"));

}

- (void)encodeWithCoder:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  EFEncodeCacheableInstance();

}

- (EMMailboxObjectID)initWithCoder:(id)a3
{
  EMMailboxObjectID *v4;
  id v5;
  EMMailboxObjectID *v6;
  id v8;
  EMMailboxObjectID *v9;

  v8 = a3;
  v9 = self;
  v4 = self;
  v5 = v8;
  EFDecodeCacheableInstance();
  v6 = (EMMailboxObjectID *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)ef_publicDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D1EF48];
  -[EMMailboxObjectID url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ec_redactedStringForMailboxURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)debugDescription
{
  void *v2;
  void *v3;

  -[EMMailboxObjectID url](self, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (EMMailboxObjectID)init
{
  void *v3;
  _QWORD *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  EMMailboxObjectID *v9;
  objc_super v11;

  objc_msgSend(MEMORY[0x1E0CB3940], "ef_UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)EMMailboxObjectID;
  v4 = -[EMObjectID initAsEphemeralID:representedObjectID:](&v11, sel_initAsEphemeralID_representedObjectID_, 1, v3);

  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    objc_msgSend(v5, "setScheme:", CFSTR("ephemeral"));
    objc_msgSend(v4, "representedObjectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHost:", v6);

    objc_msgSend(v5, "URL");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v4[5];
    v4[5] = v7;

  }
  objc_msgSend(v4, "cachedSelf");
  v9 = (EMMailboxObjectID *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

id __35__EMMailboxObjectID_initWithCoder___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v2 = *(id *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 32);
  v9.receiver = v2;
  v9.super_class = (Class)EMMailboxObjectID;
  v4 = objc_msgSendSuper2(&v9, sel_initWithCoder_, v3);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_url"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  return v4;
}

- (NSString)accountIdentifier
{
  void *v2;
  void *v3;

  -[EMMailboxObjectID url](self, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

@end
