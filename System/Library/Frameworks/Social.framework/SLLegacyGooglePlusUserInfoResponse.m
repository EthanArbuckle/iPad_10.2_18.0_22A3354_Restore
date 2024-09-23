@implementation SLLegacyGooglePlusUserInfoResponse

- (void)_populateDataFromResponseDictionary:(id)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char isKindOfClass;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[SLWebUserInfoResponse setUserInfo:](self, "setUserInfo:", v5);
  _SLLog(v3, 7, CFSTR("SLLegacyGooglePlusUserInfoResponse got _userInfo: %@"));
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("displayName"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLWebUserInfoResponse setDisplayName:](self, "setDisplayName:", v6);

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v25 = v5;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("emails"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("type"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("account")))
        {

        }
        else
        {
          -[SLWebUserInfoResponse emailAddresses](self, "emailAddresses");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
            continue;
        }
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("value"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SLWebUserInfoResponse setEmailAddresses:](self, "setEmailAddresses:", v16);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v9);
  }

  -[SLWebUserInfoResponse emailAddresses](self, "emailAddresses");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    v24 = v25;
    _SLLog(v3, 3, CFSTR("Couldn't get an email address. userInfo was: %@"));
  }
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("error"), v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("error"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("message"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v22 = objc_opt_isKindOfClass();

    if ((v22 & 1) != 0)
    {
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("message"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLWebUserInfoResponse setErrorMessage:](self, "setErrorMessage:", v23);

    }
  }

}

@end
