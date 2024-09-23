@implementation SLYahooUserInfoResponse

- (void)_populateDataFromResponseDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("error"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("error"));
    v23 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("description"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLWebUserInfoResponse setErrorMessage:](self, "setErrorMessage:", v6);

    return;
  }
  -[SLWebUserInfoResponse setUserInfo:](self, "setUserInfo:", v4);

  -[SLWebUserInfoResponse userInfo](self, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("email"));
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_9;
  v9 = (void *)v8;
  -[SLWebUserInfoResponse userInfo](self, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("email"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_8;
  }
  -[SLWebUserInfoResponse userInfo](self, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("email"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", &stru_1E7592238);

  if ((v14 & 1) == 0)
  {
    -[SLWebUserInfoResponse userInfo](self, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("email"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLWebUserInfoResponse setEmailAddresses:](self, "setEmailAddresses:", v10);
LABEL_8:

LABEL_9:
  }
  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("FULL_NAME_PATTERN"), &stru_1E7592238, CFSTR("Localizable"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLWebUserInfoResponse userInfo](self, "userInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("given_name"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLWebUserInfoResponse userInfo](self, "userInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("family_name"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", v17, v19, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLWebUserInfoResponse setDisplayName:](self, "setDisplayName:", v22);

}

@end
