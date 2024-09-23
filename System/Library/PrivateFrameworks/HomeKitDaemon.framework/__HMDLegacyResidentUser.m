@implementation __HMDLegacyResidentUser

- (__HMDLegacyResidentUser)initWithResidentUser:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  __HMDLegacyResidentUser *v9;
  void *v10;
  objc_super v12;

  v5 = a3;
  objc_msgSend(v5, "accountHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pairingIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)__HMDLegacyResidentUser;
  v9 = -[HMDUser initWithAccountHandle:home:pairingIdentity:privilege:](&v12, sel_initWithAccountHandle_home_pairingIdentity_privilege_, v6, v7, v8, objc_msgSend(v5, "privilege"));

  if (v9)
  {
    objc_msgSend(v5, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUser _setUuidUnsafely:](v9, "_setUuidUnsafely:", v10);

    objc_storeStrong((id *)&v9->_residentUser, a3);
  }

  return v9;
}

- (BOOL)isRemoteGateway
{
  return 1;
}

- (__HMDLegacyResidentUser)initWithCoder:(id)a3
{

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[__HMDLegacyResidentUser residentUser](self, "residentUser");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeWithCoder:", v4);

}

- (HMDResidentUser)residentUser
{
  return self->_residentUser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_residentUser, 0);
}

+ (void)initialize
{
  void *v3;
  objc_class *v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDD1618];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClassName:forClass:", v5, a1);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
