@implementation OTOperationConfiguration

- (OTOperationConfiguration)init
{
  OTOperationConfiguration *v2;
  OTOperationConfiguration *v3;
  OTOperationConfiguration *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OTOperationConfiguration;
  v2 = -[OTOperationConfiguration init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_timeoutWaitForCKAccount = xmmword_18AA61B20;
    *(_WORD *)&v2->_discretionaryNetwork = 0;
    v4 = v2;
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t timeoutWaitForCKAccount;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  timeoutWaitForCKAccount = self->_timeoutWaitForCKAccount;
  v6 = a3;
  objc_msgSend(v4, "numberWithUnsignedLongLong:", timeoutWaitForCKAccount);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("timeoutWaitForCKAccount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_qualityOfService);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("qualityOfService"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_discretionaryNetwork);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("discretionaryNetwork"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_useCachedAccountStatus);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v10, CFSTR("useCachedAccountStatus"));

}

- (OTOperationConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeoutWaitForCKAccount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_timeoutWaitForCKAccount = objc_msgSend(v5, "unsignedLongLongValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("qualityOfService"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_qualityOfService = objc_msgSend(v6, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("discretionaryNetwork"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_discretionaryNetwork = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("useCachedAccountStatus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  self->_useCachedAccountStatus = objc_msgSend(v8, "BOOLValue");
  return self;
}

- (unint64_t)timeoutWaitForCKAccount
{
  return self->_timeoutWaitForCKAccount;
}

- (void)setTimeoutWaitForCKAccount:(unint64_t)a3
{
  self->_timeoutWaitForCKAccount = a3;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (BOOL)discretionaryNetwork
{
  return self->_discretionaryNetwork;
}

- (void)setDiscretionaryNetwork:(BOOL)a3
{
  self->_discretionaryNetwork = a3;
}

- (BOOL)useCachedAccountStatus
{
  return self->_useCachedAccountStatus;
}

- (void)setUseCachedAccountStatus:(BOOL)a3
{
  self->_useCachedAccountStatus = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
