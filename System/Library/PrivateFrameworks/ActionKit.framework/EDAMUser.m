@implementation EDAMUser

+ (id)structName
{
  return CFSTR("User");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[23];

  v27[21] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_823;
  if (!structFields_structFields_823)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 8, 1, CFSTR("id"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v26;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 1, CFSTR("username"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v25;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 11, 1, CFSTR("email"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v24;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 11, 1, CFSTR("name"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27[3] = v23;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 11, 1, CFSTR("timezone"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27[4] = v22;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 7, 8, 1, CFSTR("privilege"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[5] = v21;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 21, 8, 1, CFSTR("serviceLevel"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27[6] = v20;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 9, 10, 1, CFSTR("created"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27[7] = v19;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 10, 10, 1, CFSTR("updated"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27[8] = v18;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 11, 10, 1, CFSTR("deleted"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27[9] = v17;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 13, 2, 1, CFSTR("active"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27[10] = v16;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 14, 11, 1, CFSTR("shardId"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v27[11] = v3;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 15, 12, 1, CFSTR("attributes"), objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v27[12] = v4;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 16, 12, 1, CFSTR("accounting"), objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v27[13] = v5;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 17, 12, 1, CFSTR("premiumInfo"), objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v27[14] = v6;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 18, 12, 1, CFSTR("businessUserInfo"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v27[15] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 19, 11, 1, CFSTR("photoUrl"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27[16] = v8;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 20, 10, 1, CFSTR("photoLastUpdated"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27[17] = v9;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 22, 12, 1, CFSTR("accountLimits"), objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27[18] = v10;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 23, 12, 1, CFSTR("subscriptionInfo"), objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27[19] = v11;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 24, 12, 1, CFSTR("pricingModel"), objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27[20] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 21);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)structFields_structFields_823;
    structFields_structFields_823 = v13;

    v2 = (void *)structFields_structFields_823;
  }
  return v2;
}

- (NSNumber)id
{
  return self->_id;
}

- (void)setId:(id)a3
{
  objc_storeStrong((id *)&self->_id, a3);
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_storeStrong((id *)&self->_username, a3);
}

- (NSString)email
{
  return self->_email;
}

- (void)setEmail:(id)a3
{
  objc_storeStrong((id *)&self->_email, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)timezone
{
  return self->_timezone;
}

- (void)setTimezone:(id)a3
{
  objc_storeStrong((id *)&self->_timezone, a3);
}

- (NSNumber)privilege
{
  return self->_privilege;
}

- (void)setPrivilege:(id)a3
{
  objc_storeStrong((id *)&self->_privilege, a3);
}

- (NSNumber)serviceLevel
{
  return self->_serviceLevel;
}

- (void)setServiceLevel:(id)a3
{
  objc_storeStrong((id *)&self->_serviceLevel, a3);
}

- (NSNumber)created
{
  return self->_created;
}

- (void)setCreated:(id)a3
{
  objc_storeStrong((id *)&self->_created, a3);
}

- (NSNumber)updated
{
  return self->_updated;
}

- (void)setUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_updated, a3);
}

- (NSNumber)deleted
{
  return self->_deleted;
}

- (void)setDeleted:(id)a3
{
  objc_storeStrong((id *)&self->_deleted, a3);
}

- (NSNumber)active
{
  return self->_active;
}

- (void)setActive:(id)a3
{
  objc_storeStrong((id *)&self->_active, a3);
}

- (NSString)shardId
{
  return self->_shardId;
}

- (void)setShardId:(id)a3
{
  objc_storeStrong((id *)&self->_shardId, a3);
}

- (EDAMUserAttributes)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_attributes, a3);
}

- (EDAMAccounting)accounting
{
  return self->_accounting;
}

- (void)setAccounting:(id)a3
{
  objc_storeStrong((id *)&self->_accounting, a3);
}

- (EDAMPremiumInfo)premiumInfo
{
  return self->_premiumInfo;
}

- (void)setPremiumInfo:(id)a3
{
  objc_storeStrong((id *)&self->_premiumInfo, a3);
}

- (EDAMBusinessUserInfo)businessUserInfo
{
  return self->_businessUserInfo;
}

- (void)setBusinessUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_businessUserInfo, a3);
}

- (NSString)photoUrl
{
  return self->_photoUrl;
}

- (void)setPhotoUrl:(id)a3
{
  objc_storeStrong((id *)&self->_photoUrl, a3);
}

- (NSNumber)photoLastUpdated
{
  return self->_photoLastUpdated;
}

- (void)setPhotoLastUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_photoLastUpdated, a3);
}

- (EDAMAccountLimits)accountLimits
{
  return self->_accountLimits;
}

- (void)setAccountLimits:(id)a3
{
  objc_storeStrong((id *)&self->_accountLimits, a3);
}

- (EDAMSubscriptionInfo)subscriptionInfo
{
  return self->_subscriptionInfo;
}

- (void)setSubscriptionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionInfo, a3);
}

- (EDAMPricingModel)pricingModel
{
  return self->_pricingModel;
}

- (void)setPricingModel:(id)a3
{
  objc_storeStrong((id *)&self->_pricingModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pricingModel, 0);
  objc_storeStrong((id *)&self->_subscriptionInfo, 0);
  objc_storeStrong((id *)&self->_accountLimits, 0);
  objc_storeStrong((id *)&self->_photoLastUpdated, 0);
  objc_storeStrong((id *)&self->_photoUrl, 0);
  objc_storeStrong((id *)&self->_businessUserInfo, 0);
  objc_storeStrong((id *)&self->_premiumInfo, 0);
  objc_storeStrong((id *)&self->_accounting, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_shardId, 0);
  objc_storeStrong((id *)&self->_active, 0);
  objc_storeStrong((id *)&self->_deleted, 0);
  objc_storeStrong((id *)&self->_updated, 0);
  objc_storeStrong((id *)&self->_created, 0);
  objc_storeStrong((id *)&self->_serviceLevel, 0);
  objc_storeStrong((id *)&self->_privilege, 0);
  objc_storeStrong((id *)&self->_timezone, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

@end
