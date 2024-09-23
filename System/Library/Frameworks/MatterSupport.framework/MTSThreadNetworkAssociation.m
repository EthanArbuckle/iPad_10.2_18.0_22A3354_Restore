@implementation MTSThreadNetworkAssociation

- (MTSThreadNetworkAssociation)initWithExtendedPANID:(id)a3
{
  id v5;
  void *v6;
  MTSThreadNetworkAssociation *v7;
  MTSThreadNetworkAssociation *v8;
  MTSThreadNetworkAssociation *v10;
  SEL v11;
  _NSZone *v12;
  objc_super v13;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v13.receiver = self;
    v13.super_class = (Class)MTSThreadNetworkAssociation;
    v7 = -[MTSThreadNetworkAssociation init](&v13, sel_init);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_extendedPANID, a3);

    return v8;
  }
  else
  {
    v10 = (MTSThreadNetworkAssociation *)_HMFPreconditionFailure();
    return (MTSThreadNetworkAssociation *)-[MTSThreadNetworkAssociation copyWithZone:](v10, v11, v12);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[MTSThreadNetworkAssociation extendedPANID](self, "extendedPANID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "extendedPANID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToNumber:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MTSThreadNetworkAssociation extendedPANID](self, "extendedPANID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (MTSThreadNetworkAssociation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MTSThreadNetworkAssociation *v6;
  MTSThreadNetworkAssociation *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSTNA.ck.extendedPANID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[MTSThreadNetworkAssociation initWithExtendedPANID:](self, "initWithExtendedPANID:", v5);
    v7 = v6;
  }
  else
  {
    v8 = (void *)MEMORY[0x23493F978]();
    v6 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = 0;
      _os_log_impl(&dword_2344FE000, v9, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded extendedPANID: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTSThreadNetworkAssociation extendedPANID](self, "extendedPANID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("MTSTNA.ck.extendedPANID"));

}

- (NSNumber)extendedPANID
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendedPANID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
