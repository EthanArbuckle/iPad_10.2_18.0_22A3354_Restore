@implementation AKAnisetteData

- (void)setRoutingInfo:(unint64_t)a3
{
  self->_routingInfo = a3;
}

- (void)setOneTimePassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setMachineID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *machineID;
  id v5;
  id v6;

  machineID = self->_machineID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", machineID, CFSTR("_machineID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_oneTimePassword, CFSTR("_oneTimePassword"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_routingInfo);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("_routingInfo"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oneTimePassword, 0);
  objc_storeStrong((id *)&self->_machineID, 0);
}

- (AKAnisetteData)initWithCoder:(id)a3
{
  id v4;
  AKAnisetteData *v5;
  uint64_t v6;
  NSString *machineID;
  uint64_t v8;
  NSString *oneTimePassword;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AKAnisetteData;
  v5 = -[AKAnisetteData init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_machineID"));
    v6 = objc_claimAutoreleasedReturnValue();
    machineID = v5->_machineID;
    v5->_machineID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_oneTimePassword"));
    v8 = objc_claimAutoreleasedReturnValue();
    oneTimePassword = v5->_oneTimePassword;
    v5->_oneTimePassword = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_routingInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_routingInfo = objc_msgSend(v10, "unsignedLongLongValue");

  }
  return v5;
}

- (NSString)machineID
{
  return self->_machineID;
}

- (unint64_t)routingInfo
{
  return self->_routingInfo;
}

- (NSString)oneTimePassword
{
  return self->_oneTimePassword;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_machineID, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSString copy](self->_oneTimePassword, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  v4[3] = self->_routingInfo;
  return v4;
}

- (id)description
{
  void *v3;
  NSString *machineID;
  NSString *oneTimePassword;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  machineID = self->_machineID;
  oneTimePassword = self->_oneTimePassword;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_routingInfo);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("AKAnisetteData <%p>: {MID: %@ - OTP: %@ - RD: %@}"), self, machineID, oneTimePassword, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
