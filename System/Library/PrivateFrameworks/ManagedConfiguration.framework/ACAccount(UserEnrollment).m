@implementation ACAccount(UserEnrollment)

- (uint64_t)mc_isUserEnrollmentAccount
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;

  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("userEnrollmentAccount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0D44770], "sharedConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "refreshDetailsFromDisk");

    objc_msgSend(a1, "accountProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EFC8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D44770], "sharedConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "personaID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", v7))
    {
      objc_msgSend(MEMORY[0x1E0D44770], "sharedConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isUserEnrollment");

    }
    else
    {
      v9 = 0;
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setAccountProperty:forKey:", v10, CFSTR("userEnrollmentAccount"));

  }
  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("userEnrollmentAccount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  return v12;
}

- (void)unenrollAccountWithCompletionHandler:()UserEnrollment
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if ((objc_msgSend(a1, "mc_isUserEnrollmentAccount") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D44770], "sharedConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "memberQueueManagingProfileIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __66__ACAccount_UserEnrollment__unenrollAccountWithCompletionHandler___block_invoke;
    v8[3] = &unk_1E41E45B0;
    v9 = v4;
    objc_msgSend(v7, "removeProfileWithIdentifier:completion:", v6, v8);

  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
  }

}

@end
