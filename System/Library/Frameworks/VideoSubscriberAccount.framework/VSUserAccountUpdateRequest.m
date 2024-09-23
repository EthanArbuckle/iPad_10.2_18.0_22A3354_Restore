@implementation VSUserAccountUpdateRequest

- (VSUserAccountUpdateRequest)initWithUserAccount:(id)a3
{
  id v5;
  VSUserAccountUpdateRequest *v6;
  VSUserAccountUpdateRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VSUserAccountUpdateRequest;
  v6 = -[VSUserAccountUpdateRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_userAccount, a3);

  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUserAccountUpdateRequest userAccount](self, "userAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUserAccountUpdateRequest updatedUserAccount](self, "updatedUserAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUserAccountUpdateRequest updateError](self, "updateError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p %@=%@, %@=%@, %@=%@>"), v5, self, CFSTR("userAccount"), v6, CFSTR("updatedUserAccount"), v7, CFSTR("updateError"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (VSUserAccount)userAccount
{
  return self->_userAccount;
}

- (void)setUserAccount:(id)a3
{
  objc_storeStrong((id *)&self->_userAccount, a3);
}

- (VSUserAccount)updatedUserAccount
{
  return self->_updatedUserAccount;
}

- (void)setUpdatedUserAccount:(id)a3
{
  objc_storeStrong((id *)&self->_updatedUserAccount, a3);
}

- (NSError)updateError
{
  return self->_updateError;
}

- (void)setUpdateError:(id)a3
{
  objc_storeStrong((id *)&self->_updateError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateError, 0);
  objc_storeStrong((id *)&self->_updatedUserAccount, 0);
  objc_storeStrong((id *)&self->_userAccount, 0);
}

@end
