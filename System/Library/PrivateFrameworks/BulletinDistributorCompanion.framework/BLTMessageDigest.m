@implementation BLTMessageDigest

- (BLTMessageDigest)initWithMessage:(id)a3
{
  id v4;
  BLTMessageDigest *v5;
  uint64_t v6;
  NSData *messageDigest;
  objc_super v9;
  _BYTE v10[16];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLTMessageDigest;
  v5 = -[BLTMessageDigest init](&v9, sel_init);
  if (v5)
  {
    if (!v4)
      v4 = objc_alloc_init(MEMORY[0x24BDBCE50]);
    objc_msgSend(v4, "MD5:", v10);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v10, 16);
    v6 = objc_claimAutoreleasedReturnValue();
    messageDigest = v5->_messageDigest;
    v5->_messageDigest = (NSData *)v6;

  }
  return v5;
}

- (BLTMessageDigest)initWithCoder:(id)a3
{
  id v4;
  BLTMessageDigest *v5;
  uint64_t v6;
  NSData *messageDigest;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLTMessageDigest;
  v5 = -[BLTMessageDigest init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("messageDigest"));
    v6 = objc_claimAutoreleasedReturnValue();
    messageDigest = v5->_messageDigest;
    v5->_messageDigest = (NSData *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_messageDigest, CFSTR("messageDigest"));
}

- (BOOL)isEqualToMessageDigest:(id)a3
{
  NSData *messageDigest;
  void *v4;

  messageDigest = self->_messageDigest;
  objc_msgSend(a3, "messageDigest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(messageDigest) = -[NSData isEqual:](messageDigest, "isEqual:", v4);

  return (char)messageDigest;
}

- (BOOL)isEqual:(id)a3
{
  BLTMessageDigest *v4;
  BOOL v5;

  v4 = (BLTMessageDigest *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[BLTMessageDigest isEqualToMessageDigest:](self, "isEqualToMessageDigest:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSData hash](self->_messageDigest, "hash");
}

- (NSData)messageDigest
{
  return self->_messageDigest;
}

- (void)setMessageDigest:(id)a3
{
  objc_storeStrong((id *)&self->_messageDigest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageDigest, 0);
}

@end
