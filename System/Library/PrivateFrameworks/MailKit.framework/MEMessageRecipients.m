@implementation MEMessageRecipients

- (MEMessageRecipients)initWithStringsTo:(id)a3 cc:(id)a4 bcc:(id)a5 replyTo:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  MEMessageRecipients *v17;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  +[MEMessageRecipients emailAddressesForEmailAddressStrings:](MEMessageRecipients, "emailAddressesForEmailAddressStrings:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[MEMessageRecipients emailAddressesForEmailAddressStrings:](MEMessageRecipients, "emailAddressesForEmailAddressStrings:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MEMessageRecipients emailAddressesForEmailAddressStrings:](MEMessageRecipients, "emailAddressesForEmailAddressStrings:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[MEMessageRecipients emailAddressesForEmailAddressStrings:](MEMessageRecipients, "emailAddressesForEmailAddressStrings:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[MEMessageRecipients initWithTo:cc:bcc:replyTo:](self, "initWithTo:cc:bcc:replyTo:", v13, v14, v15, v16);

  return v17;
}

- (MEMessageRecipients)initWithTo:(id)a3 cc:(id)a4 bcc:(id)a5 replyTo:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  MEMessageRecipients *v15;
  MEMessageRecipients *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MEMessageRecipients;
  v15 = -[MEMessageRecipients init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_to, a3);
    objc_storeStrong((id *)&v16->_cc, a4);
    objc_storeStrong((id *)&v16->_bcc, a5);
    objc_storeStrong((id *)&v16->_replyTo, a6);
  }

  return v16;
}

+ (id)emailAddressesForEmailAddressStrings:(id)a3
{
  objc_msgSend(a3, "ef_map:", &__block_literal_global_6);
  return (id)objc_claimAutoreleasedReturnValue();
}

MEEmailAddress *__60__MEMessageRecipients_emailAddressesForEmailAddressStrings___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MEEmailAddress *v3;

  v2 = a2;
  v3 = -[MEEmailAddress initWithRawString:]([MEEmailAddress alloc], "initWithRawString:", v2);

  return v3;
}

- (NSArray)allRecipients
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  -[MEMessageRecipients to](self, "to");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[MEMessageRecipients to](self, "to");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v6);

  }
  -[MEMessageRecipients cc](self, "cc");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    -[MEMessageRecipients cc](self, "cc");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v9);

  }
  -[MEMessageRecipients bcc](self, "bcc");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    -[MEMessageRecipients bcc](self, "bcc");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v12);

  }
  -[MEMessageRecipients replyTo](self, "replyTo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    -[MEMessageRecipients replyTo](self, "replyTo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v15);

  }
  objc_msgSend(v3, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MEMessageRecipients)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  MEMessageRecipients *v21;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("EFPropertyKey_to"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDBCF20];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("EFPropertyKey_cc"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BDBCF20];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("EFPropertyKey_bcc"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x24BDBCF20];
  v18 = objc_opt_class();
  objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("EFPropertyKey_replyTo"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = -[MEMessageRecipients initWithTo:cc:bcc:replyTo:](self, "initWithTo:cc:bcc:replyTo:", v8, v12, v16, v20);
  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[MEMessageRecipients to](self, "to");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_to"));

  -[MEMessageRecipients cc](self, "cc");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_cc"));

  -[MEMessageRecipients bcc](self, "bcc");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_bcc"));

  -[MEMessageRecipients replyTo](self, "replyTo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("EFPropertyKey_replyTo"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v15;
  void *v16;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  if ((objc_msgSend(v5, "isEqual:", objc_opt_class()) & 1) != 0)
  {
    v6 = v4;
    -[MEMessageRecipients to](self, "to");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "to");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (EFObjectsAreEqual())
    {
      -[MEMessageRecipients cc](self, "cc");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cc");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (EFObjectsAreEqual())
      {
        -[MEMessageRecipients bcc](self, "bcc");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "bcc");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (EFObjectsAreEqual())
        {
          -[MEMessageRecipients replyTo](self, "replyTo");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "replyTo");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = EFObjectsAreEqual();

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[MEMessageRecipients to](self, "to");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[MEMessageRecipients cc](self, "cc");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  -[MEMessageRecipients bcc](self, "bcc");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[MEMessageRecipients replyTo](self, "replyTo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 33 * (33 * (33 * v4 + v6) + v8) + objc_msgSend(v9, "hash") + 1185921;

  return v10;
}

- (NSArray)to
{
  return self->_to;
}

- (NSArray)cc
{
  return self->_cc;
}

- (NSArray)bcc
{
  return self->_bcc;
}

- (NSArray)replyTo
{
  return self->_replyTo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyTo, 0);
  objc_storeStrong((id *)&self->_bcc, 0);
  objc_storeStrong((id *)&self->_cc, 0);
  objc_storeStrong((id *)&self->_to, 0);
}

@end
