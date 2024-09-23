@implementation HMDPairedAccessoryInformation

- (HMDPairedAccessoryInformation)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDPairedAccessoryInformation)initWithIdentifier:(id)a3 transports:(unint64_t)a4 setupHash:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  HMDPairedAccessoryInformation *v13;
  uint64_t v14;
  NSString *identifier;
  uint64_t v16;
  NSData *setupHash;
  objc_super v19;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HMDPairedAccessoryInformation;
  v13 = -[HMDPairedAccessoryInformation init](&v19, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    v13->_transports = a4;
    v16 = objc_msgSend(v11, "copy");
    setupHash = v13->_setupHash;
    v13->_setupHash = (NSData *)v16;

    objc_storeWeak((id *)&v13->_delegate, v12);
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  HMDPairedAccessoryInformation *v4;
  HMDPairedAccessoryInformation *v5;
  HMDPairedAccessoryInformation *v6;
  HMDPairedAccessoryInformation *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (HMDPairedAccessoryInformation *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    v7 = v6;
    if (v6)
    {
      -[HMDPairedAccessoryInformation identifier](v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDPairedAccessoryInformation identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDPairedAccessoryInformation identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDPairedAccessoryInformation identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPairedAccessoryInformation setupHash](self, "setupHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Identifier: %@, setupHash: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)setupHash
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)transports
{
  return self->_transports;
}

- (HMDAccessoryBrowserDelegate)delegate
{
  return (HMDAccessoryBrowserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_setupHash, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
