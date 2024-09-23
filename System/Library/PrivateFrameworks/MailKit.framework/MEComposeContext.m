@implementation MEComposeContext

- (MEComposeContext)initWithAction:(int64_t)a3 originalMessage:(id)a4 shouldSign:(BOOL)a5 isSigned:(BOOL)a6 shouldEncrypt:(BOOL)a7 isEncrypted:(BOOL)a8
{
  id v15;
  MEComposeContext *v16;
  uint64_t v17;
  NSUUID *contextID;
  objc_super v20;

  v15 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MEComposeContext;
  v16 = -[MEComposeContext init](&v20, sel_init);
  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v17 = objc_claimAutoreleasedReturnValue();
    contextID = v16->_contextID;
    v16->_contextID = (NSUUID *)v17;

    v16->_action = a3;
    objc_storeStrong((id *)&v16->_originalMessage, a4);
    v16->_shouldSign = a5;
    v16->_isSigned = a6;
    v16->_shouldEncrypt = a7;
    v16->_isEncrypted = a8;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MEComposeContext contextID](self, "contextID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_contextID"));

  -[MEComposeContext originalMessage](self, "originalMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_originalMessage"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[MEComposeContext action](self, "action"), CFSTR("EFPropertyKey_action"));
  objc_msgSend(v6, "encodeBool:forKey:", -[MEComposeContext isEncrypted](self, "isEncrypted"), CFSTR("EFPropertyKey_isEncrypted"));
  objc_msgSend(v6, "encodeBool:forKey:", -[MEComposeContext shouldEncrypt](self, "shouldEncrypt"), CFSTR("EFPropertyKey_shouldEncrypt"));
  objc_msgSend(v6, "encodeBool:forKey:", -[MEComposeContext isSigned](self, "isSigned"), CFSTR("EFPropertyKey_isSigned"));
  objc_msgSend(v6, "encodeBool:forKey:", -[MEComposeContext shouldSign](self, "shouldSign"), CFSTR("EFPropertyKey_shouldSign"));

}

- (MEComposeContext)initWithCoder:(id)a3
{
  id v4;
  MEComposeContext *v5;
  uint64_t v6;
  NSUUID *contextID;
  uint64_t v8;
  MEMessage *originalMessage;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MEComposeContext;
  v5 = -[MEComposeContext init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_contextID"));
    v6 = objc_claimAutoreleasedReturnValue();
    contextID = v5->_contextID;
    v5->_contextID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_originalMessage"));
    v8 = objc_claimAutoreleasedReturnValue();
    originalMessage = v5->_originalMessage;
    v5->_originalMessage = (MEMessage *)v8;

    v5->_action = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_action"));
    v5->_isEncrypted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_isEncrypted"));
    v5->_shouldEncrypt = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_shouldEncrypt"));
    v5->_isSigned = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_isSigned"));
    v5->_shouldSign = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_shouldSign"));
  }

  return v5;
}

- (NSUUID)contextID
{
  return self->_contextID;
}

- (void)setContextID:(id)a3
{
  objc_storeStrong((id *)&self->_contextID, a3);
}

- (MEMessage)originalMessage
{
  return self->_originalMessage;
}

- (void)setOriginalMessage:(id)a3
{
  objc_storeStrong((id *)&self->_originalMessage, a3);
}

- (MEComposeUserAction)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (BOOL)isEncrypted
{
  return self->_isEncrypted;
}

- (void)setIsEncrypted:(BOOL)a3
{
  self->_isEncrypted = a3;
}

- (BOOL)shouldEncrypt
{
  return self->_shouldEncrypt;
}

- (void)setShouldEncrypt:(BOOL)a3
{
  self->_shouldEncrypt = a3;
}

- (BOOL)isSigned
{
  return self->_isSigned;
}

- (void)setIsSigned:(BOOL)a3
{
  self->_isSigned = a3;
}

- (BOOL)shouldSign
{
  return self->_shouldSign;
}

- (void)setShouldSign:(BOOL)a3
{
  self->_shouldSign = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalMessage, 0);
  objc_storeStrong((id *)&self->_contextID, 0);
}

@end
