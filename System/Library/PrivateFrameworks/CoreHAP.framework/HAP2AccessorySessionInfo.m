@implementation HAP2AccessorySessionInfo

- (HAP2AccessorySessionInfo)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HAP2AccessorySessionInfo)initWithNumIPs:(unint64_t)a3 numIPsTried:(unint64_t)a4 numBonjourNames:(unint64_t)a5
{
  HAP2AccessorySessionInfo *v8;
  HAP2AccessorySessionInfo *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HAP2AccessorySessionInfo;
  v8 = -[HAP2AccessorySessionInfo init](&v11, sel_init);
  v9 = v8;
  if (v8)
    -[HAP2AccessorySessionInfo resetWithNumIPs:numIPsTried:numBonjourNames:](v8, "resetWithNumIPs:numIPsTried:numBonjourNames:", a3, a4, a5);
  return v9;
}

- (void)resetWithNumIPs:(unint64_t)a3 numIPsTried:(unint64_t)a4 numBonjourNames:(unint64_t)a5
{
  self->_numIPAddresses = a3;
  self->_numIPAddressesTried = a4;
  self->_numBonjourNames = a5;
}

- (unint64_t)numIPAddresses
{
  return self->_numIPAddresses;
}

- (unint64_t)numIPAddressesTried
{
  return self->_numIPAddressesTried;
}

- (unint64_t)numBonjourNames
{
  return self->_numBonjourNames;
}

@end
