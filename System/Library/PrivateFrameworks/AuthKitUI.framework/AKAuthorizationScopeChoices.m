@implementation AKAuthorizationScopeChoices

- (AKAuthorizationScopeChoices)initWithScopes:(id)a3 userInformation:(id)a4
{
  id v6;
  id v7;
  char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AKAuthorizationScopeChoices;
  v8 = -[AKAuthorizationScopeChoices init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    v10 = (void *)*((_QWORD *)v8 + 2);
    *((_QWORD *)v8 + 2) = v9;

    v11 = objc_msgSend(v7, "copy");
    v12 = (void *)*((_QWORD *)v8 + 3);
    *((_QWORD *)v8 + 3) = v11;

    *(int64x2_t *)(v8 + 40) = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    objc_msgSend(*((id *)v8 + 3), "reachableEmails");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)v8 + 8) = objc_msgSend(v13, "count");

  }
  return (AKAuthorizationScopeChoices *)v8;
}

- (void)setGivenName:(id)a3 familyName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[AKAuthorizationScopeChoices userInformation](self, "userInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setGivenName:", v7);

  -[AKAuthorizationScopeChoices userInformation](self, "userInformation");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFamilyName:", v6);

}

- (NSString)chosenEmail
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  unint64_t v8;

  -[AKAuthorizationScopeChoices userInformation](self, "userInformation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isManagedAppleID");

  if (v4)
  {
    -[AKAuthorizationScopeChoices userInformation](self, "userInformation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sharedEmailForManagedAppleID");
    v6 = objc_claimAutoreleasedReturnValue();

    if (v6)
      v7 = (__CFString *)v6;
    else
      v7 = &stru_1E7679C68;
  }
  else if (-[AKAuthorizationScopeChoices indexOfChosenEmail](self, "indexOfChosenEmail") == 0x7FFFFFFFFFFFFFFFLL
         || (v8 = -[AKAuthorizationScopeChoices indexOfChosenEmail](self, "indexOfChosenEmail"),
             v8 >= -[AKAuthorizationScopeChoices emailCount](self, "emailCount")))
  {
    v7 = &stru_1E7679C68;
  }
  else
  {
    -[AKAuthorizationScopeChoices emailAtIndex:](self, "emailAtIndex:", -[AKAuthorizationScopeChoices indexOfChosenEmail](self, "indexOfChosenEmail"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v7;
}

- (NSString)forwardingEmail
{
  return (NSString *)-[AKUserInformation forwardingEmail](self->_userInformation, "forwardingEmail");
}

- (AKAuthorizationUserResponse)userResponse
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0D00188]);
  -[AKAuthorizationScopeChoices loginChoice](self, "loginChoice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "setUserSelection:", 0);
  }
  else
  {
    -[AKAuthorizationScopeChoices _userSelection](self, "_userSelection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setUserSelection:", v6);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AKAuthorizationScopeChoices indexOfChosenLogin](self, "indexOfChosenLogin"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLoginChoiceIndex:", v7);

  -[AKAuthorizationScopeChoices loginChoice](self, "loginChoice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLoginChoice:", v8);

  -[AKAuthorizationScopeChoices selectedRequest](self, "selectedRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSelectedRequest:", v9);

  return (AKAuthorizationUserResponse *)v3;
}

- (id)_userSelection
{
  id v3;
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t v20[16];
  uint8_t buf[16];

  v3 = objc_alloc_init(MEMORY[0x1E0D00178]);
  v4 = objc_alloc_init(MEMORY[0x1E0D002B0]);
  -[AKAuthorizationScopeChoices selectedRequest](self, "selectedRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[AKAuthorizationScopeChoices selectedRequest](self, "selectedRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "requestedScopes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", *MEMORY[0x1E0CFFFD0]);

    if (v9)
    {
      _AKLogSiwa();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BD795000, v10, OS_LOG_TYPE_DEFAULT, "Selected request contains email scope.", buf, 2u);
      }

      if (-[AKAuthorizationScopeChoices wantsPrivateEmail](self, "wantsPrivateEmail"))
        -[AKAuthorizationScopeChoices forwardingEmail](self, "forwardingEmail");
      else
        -[AKAuthorizationScopeChoices chosenEmail](self, "chosenEmail");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setSelectedEmail:", v11);

      objc_msgSend(v3, "setMakePrivateEmail:", -[AKAuthorizationScopeChoices wantsPrivateEmail](self, "wantsPrivateEmail"));
    }
    objc_msgSend(v7, "requestedScopes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", *MEMORY[0x1E0CFFFD8]);

    if (v13)
    {
      _AKLogSiwa();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_1BD795000, v14, OS_LOG_TYPE_DEFAULT, "Selected request contains name scope.", v20, 2u);
      }

      -[AKAuthorizationScopeChoices userInformation](self, "userInformation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "givenName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setGivenName:", v16);

      -[AKAuthorizationScopeChoices userInformation](self, "userInformation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "familyName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setFamilyName:", v18);

    }
    objc_msgSend(v3, "setUserInformation:", v4);

  }
  return v3;
}

- (id)emailAtIndex:(unint64_t)a3
{
  void *v5;
  __CFString *v6;
  NSObject *v7;

  if (-[AKAuthorizationScopeChoices emailCount](self, "emailCount") <= a3)
  {
    _AKLogSiwa();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[AKAuthorizationScopeChoices emailAtIndex:].cold.1(a3, self, v7);

    v6 = &stru_1E7679C68;
  }
  else
  {
    -[AKUserInformation reachableEmails](self->_userInformation, "reachableEmails");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (unint64_t)personNameComponentsOrder
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1E0CB3858];
  -[AKAuthorizationScopeChoices _personNameComponents](self, "_personNameComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "_nameOrderWithOverridesForComponents:options:", v3, 0);

  return v4 == 2;
}

- (NSString)localizedName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3858];
  -[AKAuthorizationScopeChoices _personNameComponents](self, "_personNameComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringFromPersonNameComponents:style:options:", v3, 2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)localizedChosenEmail
{
  void *v3;
  void *v4;

  if (-[AKAuthorizationScopeChoices wantsPrivateEmail](self, "wantsPrivateEmail"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("AUTHORIZE_PRIVATE_EMAIL_TITLE"), &stru_1E7679C68, CFSTR("Localizable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[AKAuthorizationScopeChoices chosenEmail](self, "chosenEmail");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v4;
}

- (id)_personNameComponents
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3850]);
  -[AKUserInformation givenName](self->_userInformation, "givenName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGivenName:", v4);

  -[AKUserInformation familyName](self->_userInformation, "familyName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFamilyName:", v5);

  return v3;
}

+ (NSString)localizedGivenNameLabel
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("AUTHORIZE_GIVEN_NAME"), &stru_1E7679C68, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)localizedFamilyNameLabel
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("AUTHORIZE_FAMILY_NAME"), &stru_1E7679C68, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (id)obfuscatedEmail:(id)a3
{
  id v4;
  unint64_t v5;
  id v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "rangeOfString:", CFSTR("@"));
  if (v5 == 0x7FFFFFFFFFFFFFFFLL || v5 == 0)
  {
    v7 = v4;
  }
  else
  {
    if (v5 <= 2)
      v8 = 1;
    else
      v8 = v5 - 2;
    v9 = v5 - v8;
    objc_msgSend(a1, "_dotsWithLength:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", v9, v8, v10);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)_dotsWithLength:(unint64_t)a3
{
  return (id)objc_msgSend(&stru_1E7679C68, "stringByPaddingToLength:withString:startingAtIndex:", a3, CFSTR("•"), 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  const __CFString *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AKAuthorizationScopeChoices scopes](self, "scopes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeChoices userInformation](self, "userInformation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AKAuthorizationScopeChoices indexOfChosenEmail](self, "indexOfChosenEmail");
  v7 = -[AKAuthorizationScopeChoices indexOfChosenLogin](self, "indexOfChosenLogin");
  if (-[AKAuthorizationScopeChoices wantsPrivateEmail](self, "wantsPrivateEmail"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v9 = -[AKAuthorizationScopeChoices emailCount](self, "emailCount");
  -[AKAuthorizationScopeChoices chosenEmail](self, "chosenEmail");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeChoices forwardingEmail](self, "forwardingEmail");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeChoices userResponse](self, "userResponse");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Scope Choices:\n    scopes: %@\n    userinformation: %@\n    indexOfChosenEmail: %lu\n    indexOfChosenLogin: %lu\n    wantsPrivateEmail: %@\n    emailCount: %lu\n    chosenEmail: %@\n    forwardingEmail: %@\n    userResponse: %@"), v4, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSArray)scopes
{
  return self->_scopes;
}

- (void)setScopes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (AKUserInformation)userInformation
{
  return self->_userInformation;
}

- (void)setUserInformation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (AKCredentialRequestProtocol)selectedRequest
{
  return self->_selectedRequest;
}

- (void)setSelectedRequest:(id)a3
{
  objc_storeStrong((id *)&self->_selectedRequest, a3);
}

- (unint64_t)indexOfChosenEmail
{
  return self->_indexOfChosenEmail;
}

- (void)setIndexOfChosenEmail:(unint64_t)a3
{
  self->_indexOfChosenEmail = a3;
}

- (unint64_t)indexOfChosenLogin
{
  return self->_indexOfChosenLogin;
}

- (void)setIndexOfChosenLogin:(unint64_t)a3
{
  self->_indexOfChosenLogin = a3;
}

- (AKAuthorizationLoginChoice)loginChoice
{
  return self->_loginChoice;
}

- (void)setLoginChoice:(id)a3
{
  objc_storeStrong((id *)&self->_loginChoice, a3);
}

- (BOOL)wantsPrivateEmail
{
  return self->_wantsPrivateEmail;
}

- (void)setWantsPrivateEmail:(BOOL)a3
{
  self->_wantsPrivateEmail = a3;
}

- (unint64_t)emailCount
{
  return self->_emailCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loginChoice, 0);
  objc_storeStrong((id *)&self->_selectedRequest, 0);
  objc_storeStrong((id *)&self->_userInformation, 0);
  objc_storeStrong((id *)&self->_scopes, 0);
}

- (void)emailAtIndex:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "emailCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_1BD795000, a3, OS_LOG_TYPE_ERROR, "index %@ beyond email address count %@", (uint8_t *)&v7, 0x16u);

}

@end
