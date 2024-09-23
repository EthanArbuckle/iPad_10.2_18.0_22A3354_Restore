@implementation AMSFamilyMember

- (AMSFamilyMember)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  AMSFamilyMember *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  AMSFamilyMember *v12;
  void *v13;
  NSString *v14;
  NSString *firstName;
  void *v16;
  NSNumber *v17;
  NSNumber *iCloudDSID;
  void *v19;
  NSString *v20;
  NSString *iCloudUsername;
  void *v22;
  NSString *v23;
  NSString *iTunesUsername;
  void *v25;
  NSString *v26;
  NSString *lastName;
  void *v28;
  id v29;
  objc_super v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ITunesPreferredDsid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;

    if (v6)
    {
      v31.receiver = self;
      v31.super_class = (Class)AMSFamilyMember;
      v7 = -[AMSFamilyMember init](&v31, sel_init);
      if (v7)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("askToBuy"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v9 = v8;
        else
          v9 = 0;

        v7->_askToBuyEnabled = objc_msgSend(v9, "BOOLValue");
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstName"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;

        firstName = v7->_firstName;
        v7->_firstName = v14;

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICloudDsid"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v17 = v16;
        else
          v17 = 0;

        iCloudDSID = v7->_iCloudDSID;
        v7->_iCloudDSID = v17;

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accountName"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v20 = v19;
        else
          v20 = 0;

        iCloudUsername = v7->_iCloudUsername;
        v7->_iCloudUsername = v20;

        objc_storeStrong((id *)&v7->_iTunesDSID, v5);
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ITunesPreferredAccountName"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v23 = v22;
        else
          v23 = 0;

        iTunesUsername = v7->_iTunesUsername;
        v7->_iTunesUsername = v23;

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastName"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v26 = v25;
        else
          v26 = 0;

        lastName = v7->_lastName;
        v7->_lastName = v26;

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sharingPurchases"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v29 = v28;
        else
          v29 = 0;

        v7->_sharingPurchases = objc_msgSend(v29, "BOOLValue");
      }
      self = v7;
      v12 = self;
      goto LABEL_33;
    }
  }
  else
  {

  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v4;
    _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "AMSFamilyMember: Received an invalid server response for AMSFamilyMember. serverResponse = %@", buf, 0xCu);
  }

  v6 = 0;
  v12 = 0;
LABEL_33:

  return v12;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSFamilyMember isAskToBuyEnabled](self, "isAskToBuyEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("askToBuy"));

  -[AMSFamilyMember iTunesDSID](self, "iTunesDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("ITunesPreferredDsid"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSFamilyMember isSharingPurchases](self, "isSharingPurchases"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("sharingPurchases"));

  -[AMSFamilyMember firstName](self, "firstName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v7, CFSTR("firstName"));

  -[AMSFamilyMember iCloudDSID](self, "iCloudDSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v8, CFSTR("ICloudDsid"));

  -[AMSFamilyMember iCloudUsername](self, "iCloudUsername");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v9, CFSTR("accountName"));

  -[AMSFamilyMember iTunesUsername](self, "iTunesUsername");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v10, CFSTR("ITunesPreferredAccountName"));

  -[AMSFamilyMember lastName](self, "lastName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v11, CFSTR("lastName"));

  v12 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[9];
  _QWORD v16[10];

  v16[9] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("firstName");
  -[AMSFamilyMember firstName](self, "firstName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = CFSTR("iCloudDSID");
  -[AMSFamilyMember iCloudDSID](self, "iCloudDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v4;
  v15[2] = CFSTR("iCloudUsername");
  -[AMSFamilyMember iCloudUsername](self, "iCloudUsername");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v5;
  v15[3] = CFSTR("isCurrentSignedInUser");
  if (-[AMSFamilyMember isCurrentSignedInUser](self, "isCurrentSignedInUser"))
    v6 = CFSTR("true");
  else
    v6 = CFSTR("false");
  v16[3] = v6;
  v15[4] = CFSTR("iTunesDSID");
  -[AMSFamilyMember iTunesDSID](self, "iTunesDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v7;
  v15[5] = CFSTR("iTunesUsername");
  -[AMSFamilyMember iTunesUsername](self, "iTunesUsername");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v8;
  v15[6] = CFSTR("isAskToBuyEnabled");
  if (-[AMSFamilyMember isAskToBuyEnabled](self, "isAskToBuyEnabled"))
    v9 = CFSTR("true");
  else
    v9 = CFSTR("false");
  v16[6] = v9;
  v15[7] = CFSTR("isSharingPurchases");
  if (-[AMSFamilyMember isSharingPurchases](self, "isSharingPurchases"))
    v10 = CFSTR("true");
  else
    v10 = CFSTR("false");
  v16[7] = v10;
  v15[8] = CFSTR("lastName");
  -[AMSFamilyMember lastName](self, "lastName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[8] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject ams_generateDescriptionWithSubObjects:](self, "ams_generateDescriptionWithSubObjects:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)isAskToBuyEnabled
{
  return self->_askToBuyEnabled;
}

- (BOOL)isCurrentSignedInUser
{
  return self->_currentSignedInUser;
}

- (void)setCurrentSignedInUser:(BOOL)a3
{
  self->_currentSignedInUser = a3;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSNumber)iCloudDSID
{
  return self->_iCloudDSID;
}

- (NSString)iCloudUsername
{
  return self->_iCloudUsername;
}

- (NSNumber)iTunesDSID
{
  return self->_iTunesDSID;
}

- (NSString)iTunesUsername
{
  return self->_iTunesUsername;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (BOOL)isSharingPurchases
{
  return self->_sharingPurchases;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_iTunesUsername, 0);
  objc_storeStrong((id *)&self->_iTunesDSID, 0);
  objc_storeStrong((id *)&self->_iCloudUsername, 0);
  objc_storeStrong((id *)&self->_iCloudDSID, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
}

@end
