@implementation DEPDeviceUploadOrganization

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DEPDeviceUploadOrganization)initWithOrgId:(id)a3 orgName:(id)a4 approvers:(id)a5 skipItrackCheck:(BOOL)a6 deviceAdditionDepEnabled:(BOOL)a7 idmsWhitelistingEnabled:(BOOL)a8 idmsRemoveDeviceEnabled:(BOOL)a9 deviceAdditionGbiEnabled:(BOOL)a10
{
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  id v17;
  id v18;
  id v19;
  DEPDeviceUploadOrganization *v20;
  DEPDeviceUploadOrganization *v21;
  uint64_t v22;
  NSNumber *skipItrackCheckNum;
  uint64_t v24;
  NSNumber *deviceAdditionDepEnabledNum;
  uint64_t v26;
  NSNumber *idmsWhitelistingEnabledNum;
  uint64_t v28;
  NSNumber *idmsRemoveDeviceEnabledNum;
  uint64_t v30;
  NSNumber *deviceAdditionGbiEnabledNum;
  objc_super v33;

  v10 = a8;
  v11 = a7;
  v12 = a6;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v33.receiver = self;
  v33.super_class = (Class)DEPDeviceUploadOrganization;
  v20 = -[DEPDeviceUploadOrganization init](&v33, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_orgId, a3);
    objc_storeStrong((id *)&v21->_orgName, a4);
    objc_storeStrong((id *)&v21->_approvers, a5);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
    v22 = objc_claimAutoreleasedReturnValue();
    skipItrackCheckNum = v21->_skipItrackCheckNum;
    v21->_skipItrackCheckNum = (NSNumber *)v22;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
    v24 = objc_claimAutoreleasedReturnValue();
    deviceAdditionDepEnabledNum = v21->_deviceAdditionDepEnabledNum;
    v21->_deviceAdditionDepEnabledNum = (NSNumber *)v24;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
    v26 = objc_claimAutoreleasedReturnValue();
    idmsWhitelistingEnabledNum = v21->_idmsWhitelistingEnabledNum;
    v21->_idmsWhitelistingEnabledNum = (NSNumber *)v26;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a9);
    v28 = objc_claimAutoreleasedReturnValue();
    idmsRemoveDeviceEnabledNum = v21->_idmsRemoveDeviceEnabledNum;
    v21->_idmsRemoveDeviceEnabledNum = (NSNumber *)v28;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a10);
    v30 = objc_claimAutoreleasedReturnValue();
    deviceAdditionGbiEnabledNum = v21->_deviceAdditionGbiEnabledNum;
    v21->_deviceAdditionGbiEnabledNum = (NSNumber *)v30;

  }
  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *orgId;
  id v5;

  orgId = self->_orgId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", orgId, CFSTR("orgId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_orgName, CFSTR("orgName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_approvers, CFSTR("approvers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_skipItrackCheckNum, CFSTR("skipItrackCheckNum"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceAdditionDepEnabledNum, CFSTR("deviceAdditionDepEnabledNum"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_idmsWhitelistingEnabledNum, CFSTR("idmsWhitelistingEnabledNum"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_idmsRemoveDeviceEnabledNum, CFSTR("idmsRemoveDeviceEnabledNum"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceAdditionGbiEnabledNum, CFSTR("deviceAdditionGbiEnabledNum"));

}

- (DEPDeviceUploadOrganization)initWithCoder:(id)a3
{
  id v4;
  DEPDeviceUploadOrganization *v5;
  uint64_t v6;
  NSString *orgId;
  uint64_t v8;
  NSString *orgName;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *approvers;
  uint64_t v15;
  NSNumber *skipItrackCheckNum;
  uint64_t v17;
  NSNumber *deviceAdditionDepEnabledNum;
  uint64_t v19;
  NSNumber *idmsWhitelistingEnabledNum;
  uint64_t v21;
  NSNumber *idmsRemoveDeviceEnabledNum;
  uint64_t v23;
  NSNumber *deviceAdditionGbiEnabledNum;
  objc_super v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)DEPDeviceUploadOrganization;
  v5 = -[DEPDeviceUploadOrganization init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("orgId"));
    v6 = objc_claimAutoreleasedReturnValue();
    orgId = v5->_orgId;
    v5->_orgId = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("orgName"));
    v8 = objc_claimAutoreleasedReturnValue();
    orgName = v5->_orgName;
    v5->_orgName = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("approvers"));
    v13 = objc_claimAutoreleasedReturnValue();
    approvers = v5->_approvers;
    v5->_approvers = (NSArray *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("skipItrackCheckNum"));
    v15 = objc_claimAutoreleasedReturnValue();
    skipItrackCheckNum = v5->_skipItrackCheckNum;
    v5->_skipItrackCheckNum = (NSNumber *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceAdditionDepEnabledNum"));
    v17 = objc_claimAutoreleasedReturnValue();
    deviceAdditionDepEnabledNum = v5->_deviceAdditionDepEnabledNum;
    v5->_deviceAdditionDepEnabledNum = (NSNumber *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("idmsWhitelistingEnabledNum"));
    v19 = objc_claimAutoreleasedReturnValue();
    idmsWhitelistingEnabledNum = v5->_idmsWhitelistingEnabledNum;
    v5->_idmsWhitelistingEnabledNum = (NSNumber *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("idmsRemoveDeviceEnabledNum"));
    v21 = objc_claimAutoreleasedReturnValue();
    idmsRemoveDeviceEnabledNum = v5->_idmsRemoveDeviceEnabledNum;
    v5->_idmsRemoveDeviceEnabledNum = (NSNumber *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceAdditionGbiEnabledNum"));
    v23 = objc_claimAutoreleasedReturnValue();
    deviceAdditionGbiEnabledNum = v5->_deviceAdditionGbiEnabledNum;
    v5->_deviceAdditionGbiEnabledNum = (NSNumber *)v23;

  }
  return v5;
}

- (DEPDeviceUploadOrganization)initWithDict:(id)a3
{
  id v4;
  DEPDeviceUploadOrganization *v5;
  uint64_t v6;
  NSString *orgId;
  uint64_t v8;
  NSString *orgName;
  void *v10;
  uint64_t v11;
  NSArray *approvers;
  uint64_t v13;
  NSNumber *skipItrackCheckNum;
  uint64_t v15;
  NSNumber *deviceAdditionDepEnabledNum;
  uint64_t v17;
  NSNumber *idmsWhitelistingEnabledNum;
  uint64_t v19;
  NSNumber *idmsRemoveDeviceEnabledNum;
  uint64_t v21;
  NSNumber *deviceAdditionGbiEnabledNum;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)DEPDeviceUploadOrganization;
  v5 = -[DEPDeviceUploadOrganization init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("orgId"));
    v6 = objc_claimAutoreleasedReturnValue();
    orgId = v5->_orgId;
    v5->_orgId = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("orgName"));
    v8 = objc_claimAutoreleasedReturnValue();
    orgName = v5->_orgName;
    v5->_orgName = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("approverList"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEPDeviceUploadOrganization _approversFromApproversArray:](v5, "_approversFromApproversArray:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    approvers = v5->_approvers;
    v5->_approvers = (NSArray *)v11;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("skipItrackCheck"));
    v13 = objc_claimAutoreleasedReturnValue();
    skipItrackCheckNum = v5->_skipItrackCheckNum;
    v5->_skipItrackCheckNum = (NSNumber *)v13;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceAdditionDepEnabled"));
    v15 = objc_claimAutoreleasedReturnValue();
    deviceAdditionDepEnabledNum = v5->_deviceAdditionDepEnabledNum;
    v5->_deviceAdditionDepEnabledNum = (NSNumber *)v15;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("idmsWhitelistingEnabled"));
    v17 = objc_claimAutoreleasedReturnValue();
    idmsWhitelistingEnabledNum = v5->_idmsWhitelistingEnabledNum;
    v5->_idmsWhitelistingEnabledNum = (NSNumber *)v17;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("idmsRemoveDeviceEnabled"));
    v19 = objc_claimAutoreleasedReturnValue();
    idmsRemoveDeviceEnabledNum = v5->_idmsRemoveDeviceEnabledNum;
    v5->_idmsRemoveDeviceEnabledNum = (NSNumber *)v19;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceAdditionGbiEnabled"));
    v21 = objc_claimAutoreleasedReturnValue();
    deviceAdditionGbiEnabledNum = v5->_deviceAdditionGbiEnabledNum;
    v5->_deviceAdditionGbiEnabledNum = (NSNumber *)v21;

  }
  return v5;
}

- (id)_approversFromApproversArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  DEPDeviceUploadUser *v11;
  DEPDeviceUploadUser *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = [DEPDeviceUploadUser alloc];
        v12 = -[DEPDeviceUploadUser initWithApproverDict:](v11, "initWithApproverDict:", v10, (_QWORD)v15);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

- (BOOL)skipItrackCheck
{
  return -[NSNumber BOOLValue](self->_skipItrackCheckNum, "BOOLValue");
}

- (BOOL)deviceAdditionDepEnabled
{
  return -[NSNumber BOOLValue](self->_deviceAdditionDepEnabledNum, "BOOLValue");
}

- (BOOL)idmsWhitelistingEnabled
{
  return -[NSNumber BOOLValue](self->_idmsWhitelistingEnabledNum, "BOOLValue");
}

- (BOOL)idmsRemoveDeviceEnabled
{
  return -[NSNumber BOOLValue](self->_idmsRemoveDeviceEnabledNum, "BOOLValue");
}

- (BOOL)deviceAdditionGbiEnabled
{
  return -[NSNumber BOOLValue](self->_deviceAdditionGbiEnabledNum, "BOOLValue");
}

- (NSString)orgId
{
  return self->_orgId;
}

- (NSString)orgName
{
  return self->_orgName;
}

- (NSArray)approvers
{
  return self->_approvers;
}

- (NSNumber)skipItrackCheckNum
{
  return self->_skipItrackCheckNum;
}

- (void)setSkipItrackCheckNum:(id)a3
{
  objc_storeStrong((id *)&self->_skipItrackCheckNum, a3);
}

- (NSNumber)deviceAdditionDepEnabledNum
{
  return self->_deviceAdditionDepEnabledNum;
}

- (void)setDeviceAdditionDepEnabledNum:(id)a3
{
  objc_storeStrong((id *)&self->_deviceAdditionDepEnabledNum, a3);
}

- (NSNumber)idmsWhitelistingEnabledNum
{
  return self->_idmsWhitelistingEnabledNum;
}

- (void)setIdmsWhitelistingEnabledNum:(id)a3
{
  objc_storeStrong((id *)&self->_idmsWhitelistingEnabledNum, a3);
}

- (NSNumber)idmsRemoveDeviceEnabledNum
{
  return self->_idmsRemoveDeviceEnabledNum;
}

- (void)setIdmsRemoveDeviceEnabledNum:(id)a3
{
  objc_storeStrong((id *)&self->_idmsRemoveDeviceEnabledNum, a3);
}

- (NSNumber)deviceAdditionGbiEnabledNum
{
  return self->_deviceAdditionGbiEnabledNum;
}

- (void)setDeviceAdditionGbiEnabledNum:(id)a3
{
  objc_storeStrong((id *)&self->_deviceAdditionGbiEnabledNum, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceAdditionGbiEnabledNum, 0);
  objc_storeStrong((id *)&self->_idmsRemoveDeviceEnabledNum, 0);
  objc_storeStrong((id *)&self->_idmsWhitelistingEnabledNum, 0);
  objc_storeStrong((id *)&self->_deviceAdditionDepEnabledNum, 0);
  objc_storeStrong((id *)&self->_skipItrackCheckNum, 0);
  objc_storeStrong((id *)&self->_approvers, 0);
  objc_storeStrong((id *)&self->_orgName, 0);
  objc_storeStrong((id *)&self->_orgId, 0);
}

@end
