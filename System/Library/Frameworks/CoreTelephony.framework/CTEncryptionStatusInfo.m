@implementation CTEncryptionStatusInfo

- (CTEncryptionStatusInfo)initWithStatus:(int64_t)a3
{
  CTEncryptionStatusInfo *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CTEncryptionStatusInfo;
  result = -[CTEncryptionStatusInfo init](&v5, sel_init);
  if (result)
    result->_status = a3;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  CTEncryptionStatusInfo *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (CTEncryptionStatusInfo *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[CTEncryptionStatusInfo status](v4, "status");
      v6 = v5 == -[CTEncryptionStatusInfo status](self, "status");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setStatus:", -[CTEncryptionStatusInfo status](self, "status"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTEncryptionStatusInfo status](self, "status"), CFSTR("status"));

}

- (CTEncryptionStatusInfo)initWithCoder:(id)a3
{
  id v4;
  CTEncryptionStatusInfo *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTEncryptionStatusInfo;
  v5 = -[CTEncryptionStatusInfo init](&v7, sel_init);
  if (v5)
    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

@end
