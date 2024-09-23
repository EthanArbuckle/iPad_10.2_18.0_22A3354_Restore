@implementation MEMessageSenderMetadata

- (MEMessageSenderMetadata)initWithSenderEmailAddress:(id)a3 isVIP:(BOOL)a4 isContact:(BOOL)a5 isUnsubscribeHeaderPresent:(BOOL)a6 isPrimarySender:(BOOL)a7
{
  id v13;
  MEMessageSenderMetadata *v14;
  MEMessageSenderMetadata *v15;
  objc_super v17;

  v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MEMessageSenderMetadata;
  v14 = -[MEMessageSenderMetadata init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_senderEmailAddress, a3);
    v15->_isVIP = a4;
    v15->_isContact = a5;
    v15->_isUnsubscribeHeaderPresent = a6;
    v15->_isPrimarySender = a7;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", -[MEMessageSenderMetadata isVIP](self, "isVIP"), CFSTR("EFPropertyKey_isVIP"));
  objc_msgSend(v5, "encodeBool:forKey:", -[MEMessageSenderMetadata isContact](self, "isContact"), CFSTR("EFPropertyKey_isContact"));
  objc_msgSend(v5, "encodeBool:forKey:", -[MEMessageSenderMetadata isUnsubscribeHeaderPresent](self, "isUnsubscribeHeaderPresent"), CFSTR("EFPropertyKey_isUnsubscribeHeaderPresent"));
  -[MEMessageSenderMetadata senderEmailAddress](self, "senderEmailAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_senderEmailAddress"));

  objc_msgSend(v5, "encodeBool:forKey:", -[MEMessageSenderMetadata isPrimarySender](self, "isPrimarySender"), CFSTR("EFPropertyKey_isPrimarySender"));
}

- (MEMessageSenderMetadata)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  MEMessageSenderMetadata *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_isVIP"));
  self->_isVIP = v5;
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_isContact"));
  self->_isContact = v6;
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_isUnsubscribeHeaderPresent"));
  self->_isUnsubscribeHeaderPresent = v7;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_senderEmailAddress"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_isPrimarySender"));
  self->_isPrimarySender = v9;
  v10 = -[MEMessageSenderMetadata initWithSenderEmailAddress:isVIP:isContact:isUnsubscribeHeaderPresent:isPrimarySender:](self, "initWithSenderEmailAddress:isVIP:isContact:isUnsubscribeHeaderPresent:isPrimarySender:", v8, v5, v6, v7, v9);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  _BOOL4 v14;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  if ((objc_msgSend(v5, "isEqual:", objc_opt_class()) & 1) != 0)
  {
    v6 = v4;
    -[MEMessageSenderMetadata senderEmailAddress](self, "senderEmailAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "senderEmailAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8)
      && (v9 = -[MEMessageSenderMetadata isVIP](self, "isVIP"), v9 == objc_msgSend(v6, "isVIP"))
      && (v10 = -[MEMessageSenderMetadata isContact](self, "isContact"),
          v10 == objc_msgSend(v6, "isContact"))
      && (v11 = -[MEMessageSenderMetadata isUnsubscribeHeaderPresent](self, "isUnsubscribeHeaderPresent"),
          v11 == objc_msgSend(v6, "isUnsubscribeHeaderPresent")))
    {
      v14 = -[MEMessageSenderMetadata isPrimarySender](self, "isPrimarySender");
      v12 = v14 ^ objc_msgSend(v6, "isPrimarySender") ^ 1;
    }
    else
    {
      LOBYTE(v12) = 0;
    }

  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  -[MEMessageSenderMetadata senderEmailAddress](self, "senderEmailAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  v5 = 33 * (33 * v4 + -[MEMessageSenderMetadata isVIP](self, "isVIP"));
  v6 = 33 * (v5 + -[MEMessageSenderMetadata isContact](self, "isContact"));
  v7 = 33 * (v6 + -[MEMessageSenderMetadata isUnsubscribeHeaderPresent](self, "isUnsubscribeHeaderPresent"));
  return v7 + -[MEMessageSenderMetadata isPrimarySender](self, "isPrimarySender") + 39135393;
}

- (NSString)senderEmailAddress
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isVIP
{
  return self->_isVIP;
}

- (BOOL)isContact
{
  return self->_isContact;
}

- (BOOL)isUnsubscribeHeaderPresent
{
  return self->_isUnsubscribeHeaderPresent;
}

- (BOOL)isPrimarySender
{
  return self->_isPrimarySender;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderEmailAddress, 0);
}

@end
