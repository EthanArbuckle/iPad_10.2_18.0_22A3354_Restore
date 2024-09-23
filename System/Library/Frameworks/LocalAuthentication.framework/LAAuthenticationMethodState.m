@implementation LAAuthenticationMethodState

- (LAAuthenticationMethodState)initWithAvailableUsers:(id)a3
{
  id v5;
  LAAuthenticationMethodState *v6;
  LAAuthenticationMethodState *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LAAuthenticationMethodState;
  v6 = -[LAAuthenticationMethodState init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_availableUsers, a3);

  return v7;
}

- (NSArray)availableUsers
{
  return self->_availableUsers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableUsers, 0);
}

@end
