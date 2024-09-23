@implementation ILMessageFilterQueryRequest

- (ILMessageFilterQueryRequest)initWithExtensionIdentifier:(id)a3
{
  id v4;
  ILMessageFilterQueryRequest *v5;
  uint64_t v6;
  NSString *extensionIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ILMessageFilterQueryRequest;
  v5 = -[ILMessageFilterQueryRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    extensionIdentifier = v5->_extensionIdentifier;
    v5->_extensionIdentifier = (NSString *)v6;

  }
  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[ILMessageFilterQueryRequest extensionIdentifier](self, "extensionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ILMessageFilterQueryRequest sender](self, "sender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p extensionIdentifier=%@ sender=%@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[ILMessageFilterQueryRequest isEqualToRequest:](self, "isEqualToRequest:", v4);

  return v5;
}

- (BOOL)isEqualToRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  -[ILMessageFilterQueryRequest extensionIdentifier](self, "extensionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[ILMessageFilterQueryRequest sender](self, "sender");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sender");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if ((objc_msgSend(v7, "isEqualToString:", v8) & 1) != 0)
        goto LABEL_4;
    }
    else if (!v7)
    {
LABEL_4:
      -[ILMessageFilterQueryRequest messageBody](self, "messageBody");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messageBody");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        if ((objc_msgSend(v9, "isEqualToString:", v10) & 1) != 0)
        {
LABEL_6:
          -[ILMessageFilterQueryRequest receiverISOCountryCode](self, "receiverISOCountryCode");
          v11 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "receiverISOCountryCode");
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = (v11 | v12) == 0;
          if (v12)
            v13 = objc_msgSend((id)v11, "isEqualToString:", v12);

          goto LABEL_14;
        }
      }
      else if (!v9)
      {
        goto LABEL_6;
      }
      v13 = 0;
LABEL_14:

      goto LABEL_15;
    }
    v13 = 0;
LABEL_15:

    goto LABEL_16;
  }
  v13 = 0;
LABEL_16:

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

  -[ILMessageFilterQueryRequest extensionIdentifier](self, "extensionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[ILMessageFilterQueryRequest sender](self, "sender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[ILMessageFilterQueryRequest messageBody](self, "messageBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[ILMessageFilterQueryRequest receiverISOCountryCode](self, "receiverISOCountryCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ILMessageFilterQueryRequest)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  ILMessageFilterQueryRequest *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSString *sender;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSString *messageBody;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSString *receiverISOCountryCode;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_extensionIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[ILMessageFilterQueryRequest initWithExtensionIdentifier:](self, "initWithExtensionIdentifier:", v7);
  if (v8)
  {
    v9 = objc_opt_class();
    NSStringFromSelector(sel_sender);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    sender = v8->_sender;
    v8->_sender = (NSString *)v11;

    v13 = objc_opt_class();
    NSStringFromSelector(sel_messageBody);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    messageBody = v8->_messageBody;
    v8->_messageBody = (NSString *)v15;

    v17 = objc_opt_class();
    NSStringFromSelector(sel_receiverISOCountryCode);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    receiverISOCountryCode = v8->_receiverISOCountryCode;
    v8->_receiverISOCountryCode = (NSString *)v19;

  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[ILMessageFilterQueryRequest extensionIdentifier](self, "extensionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_extensionIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[ILMessageFilterQueryRequest sender](self, "sender");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sender);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[ILMessageFilterQueryRequest messageBody](self, "messageBody");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_messageBody);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[ILMessageFilterQueryRequest receiverISOCountryCode](self, "receiverISOCountryCode");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_receiverISOCountryCode);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, v11);

}

- (NSString)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)messageBody
{
  return self->_messageBody;
}

- (void)setMessageBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)receiverISOCountryCode
{
  return self->_receiverISOCountryCode;
}

- (void)setReceiverISOCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
  objc_storeStrong((id *)&self->_receiverISOCountryCode, 0);
  objc_storeStrong((id *)&self->_messageBody, 0);
  objc_storeStrong((id *)&self->_sender, 0);
}

@end
