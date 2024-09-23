@implementation ILMessageFilterReportRequest

- (ILMessageFilterReportRequest)initWithExtensionIdentifier:(id)a3
{
  id v4;
  ILMessageFilterReportRequest *v5;
  uint64_t v6;
  NSString *extensionIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ILMessageFilterReportRequest;
  v5 = -[ILMessageFilterReportRequest init](&v9, sel_init);
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
  -[ILMessageFilterReportRequest extensionIdentifier](self, "extensionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ILMessageFilterReportRequest sender](self, "sender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p extensionIdentifier=%@ sender=%@ suggestedAction=%ld>"), v4, self, v5, v6, -[ILMessageFilterReportRequest suggestedAction](self, "suggestedAction"));
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
    && -[ILMessageFilterReportRequest isEqualToRequest:](self, "isEqualToRequest:", v4);

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
  void *v11;
  void *v12;
  int64_t v13;
  BOOL v14;

  v4 = a3;
  -[ILMessageFilterReportRequest extensionIdentifier](self, "extensionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[ILMessageFilterReportRequest sender](self, "sender");
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
      -[ILMessageFilterReportRequest messageBody](self, "messageBody");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messageBody");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        if ((objc_msgSend(v9, "isEqualToString:", v10) & 1) != 0)
          goto LABEL_6;
      }
      else if (!v9)
      {
LABEL_6:
        -[ILMessageFilterReportRequest receiverISOCountryCode](self, "receiverISOCountryCode");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "receiverISOCountryCode");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          if ((objc_msgSend(v11, "isEqualToString:", v12) & 1) != 0)
          {
LABEL_8:
            v13 = -[ILMessageFilterReportRequest suggestedAction](self, "suggestedAction");
            v14 = v13 == objc_msgSend(v4, "suggestedAction");
LABEL_16:

            goto LABEL_17;
          }
        }
        else if (!v11)
        {
          goto LABEL_8;
        }
        v14 = 0;
        goto LABEL_16;
      }
      v14 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v14 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v14 = 0;
LABEL_19:

  return v14;
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
  uint64_t v10;
  unint64_t v11;

  -[ILMessageFilterReportRequest extensionIdentifier](self, "extensionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[ILMessageFilterReportRequest sender](self, "sender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[ILMessageFilterReportRequest messageBody](self, "messageBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[ILMessageFilterReportRequest receiverISOCountryCode](self, "receiverISOCountryCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  v11 = v10 ^ -[ILMessageFilterReportRequest suggestedAction](self, "suggestedAction");

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ILMessageFilterReportRequest)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  ILMessageFilterReportRequest *v8;
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
  void *v21;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_extensionIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[ILMessageFilterReportRequest initWithExtensionIdentifier:](self, "initWithExtensionIdentifier:", v7);
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

    NSStringFromSelector(sel_suggestedAction);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_suggestedAction = objc_msgSend(v4, "decodeIntegerForKey:", v21);

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
  void *v12;
  int64_t v13;
  id v14;

  v4 = a3;
  -[ILMessageFilterReportRequest extensionIdentifier](self, "extensionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_extensionIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[ILMessageFilterReportRequest sender](self, "sender");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sender);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[ILMessageFilterReportRequest messageBody](self, "messageBody");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_messageBody);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[ILMessageFilterReportRequest receiverISOCountryCode](self, "receiverISOCountryCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_receiverISOCountryCode);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  v13 = -[ILMessageFilterReportRequest suggestedAction](self, "suggestedAction");
  NSStringFromSelector(sel_suggestedAction);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v13, v14);

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

- (int64_t)suggestedAction
{
  return self->_suggestedAction;
}

- (void)setSuggestedAction:(int64_t)a3
{
  self->_suggestedAction = a3;
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
