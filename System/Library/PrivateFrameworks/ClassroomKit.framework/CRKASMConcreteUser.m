@implementation CRKASMConcreteUser

- (CRKASMConcreteUser)initWithBackingPerson:(id)a3
{
  id v5;
  CRKASMConcreteUser *v6;
  uint64_t v7;
  NSString *identifier;
  uint64_t v9;
  NSString *appleID;
  CRKASMConcreteNameComponents *v11;
  CRKASMNameComponents *nameComponents;
  uint64_t v13;
  NSDate *backingPersonInitialModificationDate;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CRKASMConcreteUser;
  v6 = -[CRKASMConcreteUser init](&v16, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "objectID");
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v7;

    objc_msgSend(v5, "appleID");
    v9 = objc_claimAutoreleasedReturnValue();
    appleID = v6->_appleID;
    v6->_appleID = (NSString *)v9;

    v11 = -[CRKASMConcreteNameComponents initWithPerson:]([CRKASMConcreteNameComponents alloc], "initWithPerson:", v5);
    nameComponents = v6->_nameComponents;
    v6->_nameComponents = (CRKASMNameComponents *)v11;

    objc_storeStrong((id *)&v6->_backingPerson, a3);
    objc_msgSend(v5, "dateLastModified");
    v13 = objc_claimAutoreleasedReturnValue();
    backingPersonInitialModificationDate = v6->_backingPersonInitialModificationDate;
    v6->_backingPersonInitialModificationDate = (NSDate *)v13;

    v6->_federated = objc_msgSend(v5, "isFederatedAccount");
    v6->_accountLockedDueToFailedLoginAttempts = objc_msgSend(v5, "isAccountFailedPasswordLocked");
    v6->_accountATOLocked = objc_msgSend(v5, "isAccountATOLocked");
  }

  return v6;
}

- (BOOL)isEqualToConcreteUser:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  _BOOL4 v17;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  int v26;

  v8 = a3;
  if (!v8)
  {
    LOBYTE(v11) = 0;
    goto LABEL_39;
  }
  -[CRKASMConcreteUser identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 || (objc_msgSend(v8, "identifier"), (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CRKASMConcreteUser identifier](self, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "isEqual:", v4))
    {
      LOBYTE(v11) = 0;
      goto LABEL_35;
    }
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }
  -[CRKASMConcreteUser appleID](self, "appleID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 || (objc_msgSend(v8, "appleID"), (v23 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CRKASMConcreteUser appleID](self, "appleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v13, "isEqual:", v5))
    {
      LOBYTE(v11) = 0;
      goto LABEL_32;
    }
    v22 = v13;
    v26 = 1;
  }
  else
  {
    v23 = 0;
    v26 = 0;
  }
  -[CRKASMConcreteUser nameComponents](self, "nameComponents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v10;
  v24 = v5;
  if (v14 || (objc_msgSend(v8, "nameComponents"), (v19 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CRKASMConcreteUser nameComponents](self, "nameComponents");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nameComponents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend((id)v10, "isEqual:", v5))
    {
      LOBYTE(v11) = 0;
LABEL_25:

      goto LABEL_28;
    }
    v20 = v6;
    v21 = 1;
  }
  else
  {
    v19 = 0;
    v20 = v6;
    v21 = 0;
  }
  v15 = -[CRKASMConcreteUser isFederated](self, "isFederated");
  if (v15 == objc_msgSend(v8, "isFederated")
    && (v16 = -[CRKASMConcreteUser isAccountLockedDueToFailedLoginAttempts](self, "isAccountLockedDueToFailedLoginAttempts"), v16 == objc_msgSend(v8, "isAccountLockedDueToFailedLoginAttempts")))
  {
    v17 = -[CRKASMConcreteUser isAccountATOLocked](self, "isAccountATOLocked");
    v11 = v17 ^ objc_msgSend(v8, "isAccountATOLocked") ^ 1;
    if ((v21 & 1) != 0)
      goto LABEL_24;
  }
  else
  {
    LOBYTE(v11) = 0;
    if (v21)
    {
LABEL_24:
      v6 = v20;
      goto LABEL_25;
    }
  }
  v6 = v20;
LABEL_28:
  LODWORD(v10) = v25;
  v5 = v24;
  if (v14)
  {

    if (!v26)
      goto LABEL_33;
    v13 = v22;
  }
  else
  {

    v13 = v22;
    if ((v26 & 1) == 0)
      goto LABEL_33;
  }
LABEL_32:

LABEL_33:
  if (!v12)
  {

    if ((v10 & 1) == 0)
      goto LABEL_36;
    goto LABEL_35;
  }

  if ((_DWORD)v10)
  {
LABEL_35:

  }
LABEL_36:
  if (!v9)

LABEL_39:
  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  -[CRKASMConcreteUser identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CRKASMConcreteUser appleID](self, "appleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[CRKASMConcreteUser nameComponents](self, "nameComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");
  v9 = -[CRKASMConcreteUser isFederated](self, "isFederated");
  v10 = v8 ^ v9 ^ -[CRKASMConcreteUser isAccountLockedDueToFailedLoginAttempts](self, "isAccountLockedDueToFailedLoginAttempts");
  v11 = v10 ^ -[CRKASMConcreteUser isAccountATOLocked](self, "isAccountATOLocked");

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  CRKASMConcreteUser *v4;
  BOOL v5;

  v4 = (CRKASMConcreteUser *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else if (-[CRKASMConcreteUser isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[CRKASMConcreteUser isEqualToConcreteUser:](self, "isEqualToConcreteUser:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  const __CFString *v12;
  void *v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CRKASMConcreteUser identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMConcreteUser appleID](self, "appleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMConcreteUser nameComponents](self, "nameComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CRKASMConcreteUser isFederated](self, "isFederated"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v9 = v8;
  if (-[CRKASMConcreteUser isAccountLockedDueToFailedLoginAttempts](self, "isAccountLockedDueToFailedLoginAttempts"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  v11 = v10;
  if (-[CRKASMConcreteUser isAccountATOLocked](self, "isAccountATOLocked"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { identifier = %@, appleID = %@, nameComponents = %@, isFederated = %@, isAccountLockedDueToFailedLoginAttempts = %@, isAccountATOLocked = %@ }>"), v4, self, v5, v6, v7, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (CRKASMNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (BOOL)isFederated
{
  return self->_federated;
}

- (BOOL)isAccountLockedDueToFailedLoginAttempts
{
  return self->_accountLockedDueToFailedLoginAttempts;
}

- (BOOL)isAccountATOLocked
{
  return self->_accountATOLocked;
}

- (CRKClassKitPerson)backingPerson
{
  return self->_backingPerson;
}

- (NSDate)backingPersonInitialModificationDate
{
  return self->_backingPersonInitialModificationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingPersonInitialModificationDate, 0);
  objc_storeStrong((id *)&self->_backingPerson, 0);
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
