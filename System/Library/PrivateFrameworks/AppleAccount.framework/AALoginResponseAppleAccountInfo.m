@implementation AALoginResponseAppleAccountInfo

- (AALoginResponseAppleAccountInfo)initWithDictionary:(id)a3
{
  id v4;
  AALoginResponseAppleAccountInfo *v5;
  uint64_t v6;
  NSString *personID;
  uint64_t v8;
  NSString *v9;
  uint64_t v10;
  NSString *altDSID;
  uint64_t v12;
  NSString *appleID;
  uint64_t v14;
  NSArray *appleIDAliases;
  uint64_t v16;
  NSString *firstName;
  uint64_t v18;
  NSString *lastName;
  uint64_t v20;
  NSString *primaryEmail;
  uint64_t v22;
  NSNumber *primaryEmailVerified;
  uint64_t v24;
  NSNumber *cloudDocsMigrated;
  uint64_t v26;
  NSNumber *notesMigrated;
  uint64_t v28;
  NSNumber *remindersMigrated;
  uint64_t v30;
  NSNumber *remindersAutoMigratableToCK;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)AALoginResponseAppleAccountInfo;
  v5 = -[AALoginResponseAppleAccountInfo init](&v37, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("dsid"));
    v6 = objc_claimAutoreleasedReturnValue();
    personID = v5->_personID;
    v5->_personID = (NSString *)v6;

    if (!v5->_personID)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("dsPrsID"));
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v5->_personID;
      v5->_personID = (NSString *)v8;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("aDsID"));
    v10 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v10;

    objc_msgSend(v4, "objectForKey:", CFSTR("appleId"));
    v12 = objc_claimAutoreleasedReturnValue();
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v12;

    objc_msgSend(v4, "objectForKey:", CFSTR("appleIdAliases"));
    v14 = objc_claimAutoreleasedReturnValue();
    appleIDAliases = v5->_appleIDAliases;
    v5->_appleIDAliases = (NSArray *)v14;

    objc_msgSend(v4, "objectForKey:", CFSTR("firstName"));
    v16 = objc_claimAutoreleasedReturnValue();
    firstName = v5->_firstName;
    v5->_firstName = (NSString *)v16;

    objc_msgSend(v4, "objectForKey:", CFSTR("lastName"));
    v18 = objc_claimAutoreleasedReturnValue();
    lastName = v5->_lastName;
    v5->_lastName = (NSString *)v18;

    objc_msgSend(v4, "objectForKey:", CFSTR("primaryEmail"));
    v20 = objc_claimAutoreleasedReturnValue();
    primaryEmail = v5->_primaryEmail;
    v5->_primaryEmail = (NSString *)v20;

    objc_msgSend(v4, "objectForKey:", CFSTR("primaryEmailVerified"));
    v22 = objc_claimAutoreleasedReturnValue();
    primaryEmailVerified = v5->_primaryEmailVerified;
    v5->_primaryEmailVerified = (NSNumber *)v22;

    objc_msgSend(v4, "objectForKey:", CFSTR("brMigrated"));
    v24 = objc_claimAutoreleasedReturnValue();
    cloudDocsMigrated = v5->_cloudDocsMigrated;
    v5->_cloudDocsMigrated = (NSNumber *)v24;

    objc_msgSend(v4, "objectForKey:", CFSTR("notesMigrated"));
    v26 = objc_claimAutoreleasedReturnValue();
    notesMigrated = v5->_notesMigrated;
    v5->_notesMigrated = (NSNumber *)v26;

    objc_msgSend(v4, "objectForKey:", CFSTR("tantorMigrated"));
    v28 = objc_claimAutoreleasedReturnValue();
    remindersMigrated = v5->_remindersMigrated;
    v5->_remindersMigrated = (NSNumber *)v28;

    objc_msgSend(v4, "objectForKey:", CFSTR("autoMigrateToTantor"));
    v30 = objc_claimAutoreleasedReturnValue();
    remindersAutoMigratableToCK = v5->_remindersAutoMigratableToCK;
    v5->_remindersAutoMigratableToCK = (NSNumber *)v30;

    objc_msgSend(v4, "objectForKey:", CFSTR("isManagedAppleID"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_managedAppleID = objc_msgSend(v32, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("isSandboxAcct"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sandboxAccount = objc_msgSend(v33, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("hasOptionalTerms"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_optionalTerms = objc_msgSend(v34, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("familyEligible"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_familyEligible = objc_msgSend(v35, "BOOLValue");

  }
  return v5;
}

- (NSString)personID
{
  return self->_personID;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (NSArray)appleIDAliases
{
  return self->_appleIDAliases;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSString)primaryEmail
{
  return self->_primaryEmail;
}

- (NSNumber)primaryEmailVerified
{
  return self->_primaryEmailVerified;
}

- (NSNumber)cloudDocsMigrated
{
  return self->_cloudDocsMigrated;
}

- (NSNumber)notesMigrated
{
  return self->_notesMigrated;
}

- (NSNumber)remindersMigrated
{
  return self->_remindersMigrated;
}

- (NSNumber)remindersAutoMigratableToCK
{
  return self->_remindersAutoMigratableToCK;
}

- (BOOL)isManagedAppleID
{
  return self->_managedAppleID;
}

- (BOOL)isSandboxAccount
{
  return self->_sandboxAccount;
}

- (BOOL)hasOptionalTerms
{
  return self->_optionalTerms;
}

- (BOOL)isFamilyEligible
{
  return self->_familyEligible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remindersAutoMigratableToCK, 0);
  objc_storeStrong((id *)&self->_remindersMigrated, 0);
  objc_storeStrong((id *)&self->_notesMigrated, 0);
  objc_storeStrong((id *)&self->_cloudDocsMigrated, 0);
  objc_storeStrong((id *)&self->_primaryEmailVerified, 0);
  objc_storeStrong((id *)&self->_primaryEmail, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_appleIDAliases, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_personID, 0);
}

@end
