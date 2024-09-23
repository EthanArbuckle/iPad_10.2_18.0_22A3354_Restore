@implementation MEMessageSigner

- (MEMessageSigner)initWithEmailAddresses:(NSArray *)emailAddresses signatureLabel:(NSString *)label context:(NSData *)context
{
  NSArray *v9;
  NSString *v10;
  NSData *v11;
  MEMessageSigner *v12;
  MEMessageSigner *v13;
  objc_super v15;

  v9 = emailAddresses;
  v10 = label;
  v11 = context;
  v15.receiver = self;
  v15.super_class = (Class)MEMessageSigner;
  v12 = -[MEMessageSigner init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_emailAddresses, emailAddresses);
    objc_storeStrong((id *)&v13->_label, label);
    objc_storeStrong((id *)&v13->_context, context);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MEMessageSigner)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MEMessageSigner *v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("EFPropertyKey_emailAddresses"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_label"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_context"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MEMessageSigner initWithEmailAddresses:signatureLabel:context:](self, "initWithEmailAddresses:signatureLabel:context:", v8, v9, v10);

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[MEMessageSigner emailAddresses](self, "emailAddresses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_emailAddresses"));

  -[MEMessageSigner label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_label"));

  -[MEMessageSigner context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_context"));

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

  v4 = a3;
  v5 = (void *)objc_opt_class();
  if ((objc_msgSend(v5, "isEqual:", objc_opt_class()) & 1) != 0)
  {
    v6 = v4;
    -[MEMessageSigner emailAddresses](self, "emailAddresses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "emailAddresses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[MEMessageSigner label](self, "label");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "label");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqual:", v10))
      {
        -[MEMessageSigner context](self, "context");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "context");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

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
  unint64_t v8;

  -[MEMessageSigner emailAddresses](self, "emailAddresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[MEMessageSigner label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  -[MEMessageSigner context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 33 * (33 * v4 + v6) + objc_msgSend(v7, "hash") + 35937;

  return v8;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (NSString)label
{
  return self->_label;
}

- (NSData)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
}

@end
