@implementation THThreadNetwork

- (THThreadNetwork)initWithName:(id)a3 extendedPANID:(id)a4
{
  id v6;
  id v7;
  THThreadNetwork *v8;
  uint64_t v9;
  NSString *networkName;
  uint64_t v11;
  NSData *extendedPANID;
  THThreadNetwork *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "length") == 8)
  {
    v15.receiver = self;
    v15.super_class = (Class)THThreadNetwork;
    v8 = -[THThreadNetwork init](&v15, sel_init);
    if (v8)
    {
      v9 = objc_msgSend(v6, "copy");
      networkName = v8->_networkName;
      v8->_networkName = (NSString *)v9;

      v11 = objc_msgSend(v7, "copy");
      extendedPANID = v8->_extendedPANID;
      v8->_extendedPANID = (NSData *)v11;

    }
    self = v8;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (THThreadNetwork)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  THThreadNetwork *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("xp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[THThreadNetwork initWithName:extendedPANID:](self, "initWithName:extendedPANID:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[THThreadNetwork networkName](self, "networkName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  -[THThreadNetwork extendedPANID](self, "extendedPANID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("xp"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)networkName
{
  return self->_networkName;
}

- (NSData)extendedPANID
{
  return self->_extendedPANID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendedPANID, 0);
  objc_storeStrong((id *)&self->_networkName, 0);
}

@end
