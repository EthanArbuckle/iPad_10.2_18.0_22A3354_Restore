@implementation AKTrustedContact

- (AKTrustedContact)initWithUUID:(id)a3 status:(int64_t)a4
{
  id v7;
  AKTrustedContact *v8;
  AKTrustedContact *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKTrustedContact;
  v8 = -[AKTrustedContact init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_uuid, a3);
    v9->_status = a4;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AKTrustedContact *v4;
  void *v5;
  AKTrustedContact *v6;
  uint64_t v7;
  NSString *hashedWrappingKeyRKC;

  v4 = [AKTrustedContact alloc];
  v5 = (void *)-[NSUUID copy](self->_uuid, "copy");
  v6 = -[AKTrustedContact initWithUUID:status:](v4, "initWithUUID:status:", v5, self->_status);

  v7 = -[NSString copy](self->_hashedWrappingKeyRKC, "copy");
  hashedWrappingKeyRKC = v6->_hashedWrappingKeyRKC;
  v6->_hashedWrappingKeyRKC = (NSString *)v7;

  return v6;
}

- (AKTrustedContact)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSString *v7;
  NSString *hashedWrappingKeyRKC;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_status"));
  if (v5)
    self = -[AKTrustedContact initWithUUID:status:](self, "initWithUUID:status:", v5, v6);
  if (self)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_hashedWrappingKeyRKC"));
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    hashedWrappingKeyRKC = self->_hashedWrappingKeyRKC;
    self->_hashedWrappingKeyRKC = v7;

  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *uuid;
  id v5;

  uuid = self->_uuid;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uuid, CFSTR("_uuid"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_status, CFSTR("_status"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hashedWrappingKeyRKC, CFSTR("_hashedWrappingKeyRKC"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSString)hashedWrappingKeyRKC
{
  return self->_hashedWrappingKeyRKC;
}

- (void)setHashedWrappingKeyRKC:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hashedWrappingKeyRKC, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
