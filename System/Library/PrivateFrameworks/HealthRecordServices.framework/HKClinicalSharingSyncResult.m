@implementation HKClinicalSharingSyncResult

- (HKClinicalSharingSyncResult)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKClinicalSharingSyncResult)initWithAccountID:(id)a3 lookupInfo:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKClinicalSharingSyncResult *v11;
  uint64_t v12;
  NSUUID *accountID;
  uint64_t v14;
  NSString *lookupInfo;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HKClinicalSharingSyncResult;
  v11 = -[HKClinicalSharingSyncResult init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    accountID = v11->_accountID;
    v11->_accountID = (NSUUID *)v12;

    v14 = objc_msgSend(v9, "copy");
    lookupInfo = v11->_lookupInfo;
    v11->_lookupInfo = (NSString *)v14;

    objc_storeStrong((id *)&v11->_error, a5);
  }

  return v11;
}

- (HKClinicalSharingSyncResult)initWithAccountID:(id)a3 lookupInfo:(id)a4
{
  return -[HKClinicalSharingSyncResult initWithAccountID:lookupInfo:error:](self, "initWithAccountID:lookupInfo:error:", a3, a4, 0);
}

- (HKClinicalSharingSyncResult)initWithAccountID:(id)a3 error:(id)a4
{
  return -[HKClinicalSharingSyncResult initWithAccountID:lookupInfo:error:](self, "initWithAccountID:lookupInfo:error:", a3, 0, a4);
}

- (BOOL)isEqual:(id)a3
{
  HKClinicalSharingSyncResult *v4;
  HKClinicalSharingSyncResult *v5;
  HKClinicalSharingSyncResult *v6;
  NSUUID *accountID;
  NSUUID *v8;
  uint64_t v9;
  void *v10;
  NSUUID *v11;
  void *v12;
  void *v13;
  NSString *lookupInfo;
  NSString *v15;
  NSString *v16;
  void *v17;
  NSError *error;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v4 = (HKClinicalSharingSyncResult *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      LOBYTE(v13) = 0;
LABEL_31:

      goto LABEL_32;
    }
    accountID = self->_accountID;
    -[HKClinicalSharingSyncResult accountID](v6, "accountID");
    v8 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    if (accountID != v8)
    {
      -[HKClinicalSharingSyncResult accountID](v6, "accountID");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        LOBYTE(v13) = 0;
        goto LABEL_30;
      }
      v10 = (void *)v9;
      v11 = self->_accountID;
      -[HKClinicalSharingSyncResult accountID](v6, "accountID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSUUID isEqual:](v11, "isEqual:", v12))
      {
        LOBYTE(v13) = 0;
LABEL_29:

        goto LABEL_30;
      }
      v29 = v10;
      v30 = v12;
    }
    lookupInfo = self->_lookupInfo;
    -[HKClinicalSharingSyncResult lookupInfo](v6, "lookupInfo");
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (lookupInfo != v15)
    {
      -[HKClinicalSharingSyncResult lookupInfo](v6, "lookupInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
        goto LABEL_24;
      v16 = self->_lookupInfo;
      -[HKClinicalSharingSyncResult lookupInfo](v6, "lookupInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSString isEqualToString:](v16, "isEqualToString:", v17))
      {

        LOBYTE(v13) = 0;
LABEL_27:
        v24 = accountID == v8;
        v10 = v29;
LABEL_28:
        v12 = v30;
        if (!v24)
          goto LABEL_29;
LABEL_30:

        goto LABEL_31;
      }
      v26 = v17;
      v28 = v13;
    }
    error = self->_error;
    -[HKClinicalSharingSyncResult error](v6, "error", v26);
    v19 = objc_claimAutoreleasedReturnValue();
    LOBYTE(v13) = error == (NSError *)v19;
    if (error == (NSError *)v19)
    {

    }
    else
    {
      v20 = (void *)v19;
      -[HKClinicalSharingSyncResult error](v6, "error");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v22 = (void *)v21;
        v13 = self->_error;
        -[HKClinicalSharingSyncResult error](v6, "error");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v13) = objc_msgSend(v13, "isEqual:", v23);

        if (lookupInfo == v15)
        {

          goto LABEL_27;
        }

        goto LABEL_25;
      }

    }
    if (lookupInfo == v15)
    {
LABEL_25:

      goto LABEL_27;
    }

LABEL_24:
    v10 = v29;

    v24 = accountID == v8;
    goto LABEL_28;
  }
  LOBYTE(v13) = 1;
LABEL_32:

  return (char)v13;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  v3 = -[NSUUID hash](self->_accountID, "hash");
  v4 = -[NSString hash](self->_lookupInfo, "hash") ^ v3;
  return v4 ^ -[NSError hash](self->_error, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *accountID;
  id v5;

  accountID = self->_accountID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", accountID, CFSTR("accountID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lookupInfo, CFSTR("lookupInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_error, CFSTR("error"));

}

- (HKClinicalSharingSyncResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HKClinicalSharingSyncResult *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lookupInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[HKClinicalSharingSyncResult initWithAccountID:lookupInfo:error:](self, "initWithAccountID:lookupInfo:error:", v5, v6, v7);

    v8 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v8 = 0;
  }

  return v8;
}

- (NSUUID)accountID
{
  return self->_accountID;
}

- (NSError)error
{
  return self->_error;
}

- (NSString)lookupInfo
{
  return self->_lookupInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookupInfo, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

@end
