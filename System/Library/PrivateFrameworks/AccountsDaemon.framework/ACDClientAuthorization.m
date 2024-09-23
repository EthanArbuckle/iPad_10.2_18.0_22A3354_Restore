@implementation ACDClientAuthorization

- (id)initForClient:(id)a3
{
  id v5;
  ACDClientAuthorization *v6;
  ACDClientAuthorization *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACDClientAuthorization;
  v6 = -[ACDClientAuthorization init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_client, a3);

  return v7;
}

- (BOOL)isGranted
{
  return self->_isGranted;
}

- (void)setIsGranted:(BOOL)a3
{
  self->_isGranted = a3;
}

- (ACDClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (NSSet)grantedPermissions
{
  return self->_grantedPermissions;
}

- (void)setGrantedPermissions:(id)a3
{
  objc_storeStrong((id *)&self->_grantedPermissions, a3);
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_grantedPermissions, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end
