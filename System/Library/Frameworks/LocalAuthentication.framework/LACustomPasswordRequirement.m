@implementation LACustomPasswordRequirement

- (LACustomPasswordRequirement)initWithCustomPassword:(id)a3
{
  id v5;
  LACustomPasswordRequirement *v6;
  LACustomPasswordRequirement *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACustomPasswordRequirement;
  v6 = -[LACustomPasswordRequirement init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_password, a3);

  return v7;
}

+ (void)requestCreationWithLocalizedReason:(id)a3 completion:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  +[LAAuthorizationError missingImplementation](LAAuthorizationError, "missingImplementation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a4 + 2))(v5, 0, v6);

}

- (void)encodeWithACLCoder:(id)a3
{
  NSString *password;
  id v4;
  id v5;

  password = self->_password;
  v4 = a3;
  -[NSString dataUsingEncoding:](password, "dataUsingEncoding:", 4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addCredential:credentialType:", v5, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
}

@end
