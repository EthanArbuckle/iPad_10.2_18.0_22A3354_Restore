@implementation FMInternalOwnerAccount

- (FMInternalOwnerAccount)initWithAccount:(id)a3
{
  id v4;
  FMInternalOwnerAccount *v5;
  uint64_t v6;
  NSString *personId;
  uint64_t v8;
  NSString *firstName;
  uint64_t v10;
  NSString *lastName;
  uint64_t v12;
  NSString *username;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FMInternalOwnerAccount;
  v5 = -[FMInternalOwnerAccount init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "aa_personID");
    v6 = objc_claimAutoreleasedReturnValue();
    personId = v5->_personId;
    v5->_personId = (NSString *)v6;

    objc_msgSend(v4, "aa_firstName");
    v8 = objc_claimAutoreleasedReturnValue();
    firstName = v5->_firstName;
    v5->_firstName = (NSString *)v8;

    objc_msgSend(v4, "aa_lastName");
    v10 = objc_claimAutoreleasedReturnValue();
    lastName = v5->_lastName;
    v5->_lastName = (NSString *)v10;

    objc_msgSend(v4, "username");
    v12 = objc_claimAutoreleasedReturnValue();
    username = v5->_username;
    v5->_username = (NSString *)v12;

  }
  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[FMInternalOwnerAccount username](self, "username");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMInternalOwnerAccount personId](self, "personId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@[%@]>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)personId
{
  return self->_personId;
}

- (void)setPersonId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_personId, 0);
}

@end
