@implementation CRKSetAirPlayRouteRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKSetAirPlayRouteRequest)initWithCoder:(id)a3
{
  id v4;
  CRKSetAirPlayRouteRequest *v5;
  void *v6;
  uint64_t v7;
  NSString *routeUID;
  void *v9;
  uint64_t v10;
  NSString *password;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRKSetAirPlayRouteRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("routeUID"));
    v7 = objc_claimAutoreleasedReturnValue();
    routeUID = v5->_routeUID;
    v5->_routeUID = (NSString *)v7;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("password"));
    v10 = objc_claimAutoreleasedReturnValue();
    password = v5->_password;
    v5->_password = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suppressPasscodePrompt"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_suppressPasscodePrompt = objc_msgSend(v12, "BOOLValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRKSetAirPlayRouteRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[CRKSetAirPlayRouteRequest routeUID](self, "routeUID", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("routeUID"));

  -[CRKSetAirPlayRouteRequest password](self, "password");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("password"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKSetAirPlayRouteRequest suppressPasscodePrompt](self, "suppressPasscodePrompt"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("suppressPasscodePrompt"));

}

- (NSString)routeUID
{
  return self->_routeUID;
}

- (void)setRouteUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)suppressPasscodePrompt
{
  return self->_suppressPasscodePrompt;
}

- (void)setSuppressPasscodePrompt:(BOOL)a3
{
  self->_suppressPasscodePrompt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_routeUID, 0);
}

@end
