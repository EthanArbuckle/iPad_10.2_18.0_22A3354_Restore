@implementation CKMeCardSharingNameProvider

+ (id)nameProviderForContact:(id)a3
{
  id v3;
  CKMeCardSharingNameProvider *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v11[16];

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(CKMeCardSharingNameProvider);
    if (v4)
    {
      objc_msgSend(v3, "givenName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMeCardSharingNameProvider setGivenName:](v4, "setGivenName:", v5);

      objc_msgSend(v3, "middleName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMeCardSharingNameProvider setMiddleName:](v4, "setMiddleName:", v6);

      objc_msgSend(v3, "familyName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMeCardSharingNameProvider setFamilyName:](v4, "setFamilyName:", v7);

      objc_msgSend(v3, "nickname");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMeCardSharingNameProvider setNickname:](v4, "setNickname:", v8);

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "nameProviderForContact: called with nil contact", v11, 2u);
      }

    }
    v4 = 0;
  }

  return v4;
}

+ (id)nameProviderForNickname:(id)a3
{
  id v3;
  CKMeCardSharingNameProvider *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(CKMeCardSharingNameProvider);
    if (v4)
    {
      objc_msgSend(v3, "firstName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMeCardSharingNameProvider setGivenName:](v4, "setGivenName:", v5);

      objc_msgSend(v3, "lastName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMeCardSharingNameProvider setFamilyName:](v4, "setFamilyName:", v6);

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "nameProviderForNickname: called with nil contact", v9, 2u);
      }

    }
    v4 = 0;
  }

  return v4;
}

+ (id)nameProviderForAccount:(id)a3
{
  id v3;
  CKMeCardSharingNameProvider *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v10[16];

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(CKMeCardSharingNameProvider);
    if (v4)
    {
      objc_msgSend(v3, "aa_firstName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMeCardSharingNameProvider setGivenName:](v4, "setGivenName:", v5);

      objc_msgSend(v3, "aa_middleName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMeCardSharingNameProvider setMiddleName:](v4, "setMiddleName:", v6);

      objc_msgSend(v3, "aa_lastName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMeCardSharingNameProvider setFamilyName:](v4, "setFamilyName:", v7);

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "nameProviderForAccount: called with nil account", v10, 2u);
      }

    }
    v4 = 0;
  }

  return v4;
}

+ (id)nameProviderForPrimaryAccount
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v8;
  uint8_t v9[16];

  v3 = (objc_class *)MEMORY[0x193FF3C18](CFSTR("ACAccountStore"), CFSTR("Accounts"));
  if (v3)
  {
    v4 = objc_alloc_init(v3);
    objc_msgSend(v4, "aa_primaryAppleAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "nameProviderForAccount:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "CKMeCardSharingNameProvider: Failed linking Accounts", v9, 2u);
      }

    }
    return 0;
  }
}

+ (id)nameContactForPrimaryAccount
{
  objc_class *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v9;
  uint8_t v10[16];

  v2 = (objc_class *)MEMORY[0x193FF3C18](CFSTR("ACAccountStore"), CFSTR("Accounts"));
  if (v2)
  {
    v3 = objc_alloc_init(v2);
    objc_msgSend(v3, "aa_primaryAppleAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(MEMORY[0x1E0C97360]);
    objc_msgSend(v4, "aa_firstName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setGivenName:", v6);

    objc_msgSend(v4, "aa_lastName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFamilyName:", v7);

    return v5;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "CKMeCardSharingNameProvider: Failed linking Accounts", v10, 2u);
      }

    }
    return 0;
  }
}

- (NSString)givenName
{
  return self->_givenName;
}

- (void)setGivenName:(id)a3
{
  objc_storeStrong((id *)&self->_givenName, a3);
}

- (NSString)middleName
{
  return self->_middleName;
}

- (void)setMiddleName:(id)a3
{
  objc_storeStrong((id *)&self->_middleName, a3);
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setFamilyName:(id)a3
{
  objc_storeStrong((id *)&self->_familyName, a3);
}

- (NSString)nickname
{
  return self->_nickname;
}

- (void)setNickname:(id)a3
{
  objc_storeStrong((id *)&self->_nickname, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
}

@end
