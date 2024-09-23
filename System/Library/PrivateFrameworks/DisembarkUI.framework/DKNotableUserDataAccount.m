@implementation DKNotableUserDataAccount

- (DKNotableUserDataAccount)initWithProfilePicture:(id)a3 name:(id)a4 username:(id)a5
{
  id v9;
  id v10;
  id v11;
  DKNotableUserDataAccount *v12;
  DKNotableUserDataAccount *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)DKNotableUserDataAccount;
  v12 = -[DKNotableUserDataAccount init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_profilePicture, a3);
    objc_storeStrong((id *)&v13->_name, a4);
    objc_storeStrong((id *)&v13->_username, a5);
  }

  return v13;
}

- (UIImage)profilePicture
{
  return self->_profilePicture;
}

- (void)setProfilePicture:(id)a3
{
  objc_storeStrong((id *)&self->_profilePicture, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_storeStrong((id *)&self->_username, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_profilePicture, 0);
}

@end
