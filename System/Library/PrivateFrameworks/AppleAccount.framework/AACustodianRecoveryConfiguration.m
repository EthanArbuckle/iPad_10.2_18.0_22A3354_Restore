@implementation AACustodianRecoveryConfiguration

- (AACustodianRecoveryConfiguration)initWithConfigurationDictionary:(id)a3
{
  id v4;
  AACustodianRecoveryConfiguration *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AACustodianRecoveryConfiguration;
  v5 = -[AACustodianRecoveryConfiguration init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("codeLength"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_codeLength = objc_msgSend(v6, "integerValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxSessionTTL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_maxSessionTime = objc_msgSend(v7, "integerValue");

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AACustodianRecoveryConfiguration)initWithCoder:(id)a3
{
  id v4;
  AACustodianRecoveryConfiguration *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AACustodianRecoveryConfiguration;
  v5 = -[AACustodianRecoveryConfiguration init](&v7, sel_init);
  if (v5)
  {
    v5->_codeLength = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("codeLength"));
    v5->_maxSessionTime = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxSessionTTL"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t codeLength;
  id v5;

  codeLength = self->_codeLength;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", codeLength, CFSTR("codeLength"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_maxSessionTime, CFSTR("maxSessionTTL"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = -[AACustodianRecoveryConfiguration init](+[AACustodianRecoveryConfiguration allocWithZone:](AACustodianRecoveryConfiguration, "allocWithZone:", a3), "init");
  *((_QWORD *)result + 1) = self->_codeLength;
  *((_QWORD *)result + 2) = self->_maxSessionTime;
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_codeLength);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_maxSessionTime);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> codeLength: %@, maxSessionTime: %@"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)codeLength
{
  return self->_codeLength;
}

- (void)setCodeLength:(int64_t)a3
{
  self->_codeLength = a3;
}

- (int64_t)maxSessionTime
{
  return self->_maxSessionTime;
}

- (void)setMaxSessionTime:(int64_t)a3
{
  self->_maxSessionTime = a3;
}

@end
