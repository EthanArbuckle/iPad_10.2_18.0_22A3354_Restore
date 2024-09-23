@implementation NSMutableURLRequest(AppleAccount)

- (void)aa_addTokenAuthHeaderWithAccount:()AppleAccount
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t buf[16];

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(v5, "aa_personID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "aa_authToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@:%@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "dataUsingEncoding:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "base64EncodedStringWithOptions:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("X-MobileMe-AuthToken %@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "Using token auth", buf, 2u);
  }

  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v11, CFSTR("Authorization"));
}

- (void)aa_addBasicAuthPasswordWithAccount:()AppleAccount
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t buf[16];

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(v5, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "aa_password");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@:%@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "dataUsingEncoding:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "base64EncodedStringWithOptions:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Basic %@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "Using password auth", buf, 2u);
  }

  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v11, CFSTR("Authorization"));
}

- (void)aa_addAltDSIDAndRepairStateWithAccount:()AppleAccount
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "aa_altDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v4, CFSTR("X-Apple-ADSID"));
  objc_msgSend(v8, "aa_repairState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v7, CFSTR("X-Apple-I-Repair"));

  }
}

- (void)aa_addBasicAuthorizationHeaderWithAccount:()AppleAccount preferUsingPassword:
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    if ((a4 & 1) != 0)
    {
      objc_msgSend(v6, "username");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)v8;
        objc_msgSend(v7, "aa_password");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v11 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v7, "username");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "aa_password");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringWithFormat:", CFSTR("%@:%@"), v12, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          _AALogSystem();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19EACA000, v15, OS_LOG_TYPE_DEFAULT, "Using password auth", buf, 2u);
          }

          if (!objc_msgSend(MEMORY[0x1E0CF0ED0], "isInternalBuild"))
            goto LABEL_27;
          _AALogSystem();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
LABEL_25:
            objc_msgSend(v7, "aa_password");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "unredactedSuffixOfLength:", 4);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v44 = v37;
            _os_log_impl(&dword_19EACA000, v16, OS_LOG_TYPE_DEFAULT, "Using PET: %@", buf, 0xCu);

          }
LABEL_26:

LABEL_27:
          if (v14)
          {
            objc_msgSend(v14, "dataUsingEncoding:", 4);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "base64EncodedStringWithOptions:", 0);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Basic %@"), v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(MEMORY[0x1E0CF0ED0], "isInternalBuild"))
            {
              _AALogSystem();
              v41 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v44 = v14;
                _os_log_impl(&dword_19EACA000, v41, OS_LOG_TYPE_DEFAULT, "Authentication Header before Base64: %@", buf, 0xCu);
              }

              _AALogSystem();
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v44 = v40;
                _os_log_impl(&dword_19EACA000, v42, OS_LOG_TYPE_DEFAULT, "Authentication Header after Base64: %@", buf, 0xCu);
              }

            }
            objc_msgSend(a1, "setValue:forHTTPHeaderField:", v40, CFSTR("Authorization"));

          }
          goto LABEL_35;
        }
      }
      objc_msgSend(v7, "aa_personID");
      v23 = objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v24 = (void *)v23;
        objc_msgSend(v7, "aa_authToken");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          v26 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v7, "aa_personID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "aa_authToken");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "stringWithFormat:", CFSTR("%@:%@"), v27, v28);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          _AALogSystem();
          v16 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            goto LABEL_26;
          *(_WORD *)buf = 0;
          goto LABEL_18;
        }
      }
    }
    else
    {
      objc_msgSend(v6, "aa_personID");
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = (void *)v17;
        objc_msgSend(v7, "aa_authToken");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          v20 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v7, "aa_personID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "aa_authToken");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringWithFormat:", CFSTR("%@:%@"), v21, v22);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          _AALogSystem();
          v16 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            goto LABEL_26;
          *(_WORD *)buf = 0;
LABEL_18:
          _os_log_impl(&dword_19EACA000, v16, OS_LOG_TYPE_DEFAULT, "Using token auth (basic)", buf, 2u);
          goto LABEL_26;
        }
      }
      objc_msgSend(v7, "username");
      v29 = objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        v30 = (void *)v29;
        objc_msgSend(v7, "aa_password");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          v32 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v7, "username");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "aa_password");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "stringWithFormat:", CFSTR("%@:%@"), v33, v34);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          _AALogSystem();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19EACA000, v35, OS_LOG_TYPE_DEFAULT, "Using password auth", buf, 2u);
          }

          if (!objc_msgSend(MEMORY[0x1E0CF0ED0], "isInternalBuild"))
            goto LABEL_27;
          _AALogSystem();
          v16 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            goto LABEL_26;
          goto LABEL_25;
        }
      }
    }
LABEL_35:
    objc_msgSend(a1, "aa_addAltDSIDAndRepairStateWithAccount:", v7);
  }

}

- (void)aa_addBasicAuthorizationHeaderWithAccount:()AppleAccount authToken:
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    _AALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v9, OS_LOG_TYPE_DEFAULT, "Signing Request with basic authoriation w/ authToken", buf, 2u);
    }

    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "aa_personID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@:%@"), v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "dataUsingEncoding:", 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "base64EncodedStringWithOptions:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Basic %@"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v15, CFSTR("Authorization"));
    objc_msgSend(a1, "aa_addAltDSIDAndRepairStateWithAccount:", v6);

  }
  else if (v6)
  {
    objc_msgSend(a1, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", v6, 0);
  }

}

- (uint64_t)aa_addAuthTokenOrBasicAuthHeaderWithAccount:()AppleAccount preferUsingPassword:
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint8_t *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  __int16 v24;
  __int16 v25;

  v6 = a3;
  v7 = v6;
  if (a4)
  {
    objc_msgSend(v6, "username");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8
      || (v9 = (void *)v8,
          objc_msgSend(v7, "aa_password"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          !v10))
    {
      objc_msgSend(v7, "aa_personID");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11
        || (v12 = (void *)v11,
            objc_msgSend(v7, "aa_authToken"),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            v13,
            v12,
            !v13))
      {
        _AALogSystem();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v25 = 0;
          v15 = (uint8_t *)&v25;
LABEL_17:
          _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "Unable to add auth header. No pertinent information in account.", v15, 2u);
          goto LABEL_18;
        }
        goto LABEL_18;
      }
      goto LABEL_10;
    }
LABEL_13:
    objc_msgSend(a1, "aa_addBasicAuthPasswordWithAccount:", v7);
    goto LABEL_14;
  }
  objc_msgSend(v6, "aa_personID");
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16
    || (v17 = (void *)v16,
        objc_msgSend(v7, "aa_authToken"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v18,
        v17,
        !v18))
  {
    objc_msgSend(v7, "username");
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19
      || (v20 = (void *)v19,
          objc_msgSend(v7, "aa_password"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v21,
          v20,
          !v21))
    {
      _AALogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v24 = 0;
        v15 = (uint8_t *)&v24;
        goto LABEL_17;
      }
LABEL_18:

      v22 = 0;
      goto LABEL_19;
    }
    goto LABEL_13;
  }
LABEL_10:
  objc_msgSend(a1, "aa_addTokenAuthHeaderWithAccount:", v7);
LABEL_14:
  objc_msgSend(a1, "aa_addAltDSIDAndRepairStateWithAccount:", v7);
  v22 = 1;
LABEL_19:

  return v22;
}

- (void)aa_setBodyWithParameters:()AppleAccount
{
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a3, 100, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  if (v4)
  {
    objc_msgSend(a1, "setHTTPBody:", v4);
  }
  else
  {
    _AALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v5;
      _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "Error adding body %@", buf, 0xCu);
    }

  }
}

- (id)aa_setXMLBodyWithParameters:()AppleAccount
{
  void *v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a3, 100, 0, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (v4)
  {
    objc_msgSend(a1, "setHTTPBody:", v4);
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", CFSTR("application/xml"), CFSTR("Content-Type"));
  }
  else
  {
    _AALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "Error adding body %@", buf, 0xCu);
    }

  }
  return v4;
}

- (void)aa_setJSONBodyWithParameters:()AppleAccount
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8[5];

  v8[4] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  v8[0] = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v4, 0, v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8[0];
  if (v6)
  {
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[NSMutableURLRequest(AppleAccount) aa_setJSONBodyWithParameters:].cold.2((uint64_t)v6, v7);

  }
  else
  {
    objc_msgSend(a1, "setHTTPBody:", v5);
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  }

}

- (void)aa_signBodyData:()AppleAccount withSigningSession:
{
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "signatureForData:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v6, CFSTR("X-Mme-Nas-Qualify"));
  _AALogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_19EACA000, v7, OS_LOG_TYPE_DEFAULT, "X-Mme-Nas-Qualify: %@", (uint8_t *)&v8, 0xCu);
  }

}

- (void)aa_setXMLBodyWithParameters:()AppleAccount signingSession:
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a1, "aa_setXMLBodyWithParameters:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "aa_signBodyData:withSigningSession:", v7, v6);

}

- (uint64_t)aa_addGrandSlamAuthorizationHeaderWithAccount:()AppleAccount grandslamToken:
{
  id v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  objc_msgSend(a3, "aa_personID");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  v10 = !v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v7, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dataUsingEncoding:", 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "base64EncodedStringWithOptions:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v13, CFSTR("X-Apple-GS-Token"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Basic %@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v14, CFSTR("Authorization"));

  }
  return v10;
}

- (uint64_t)aa_addGrandslamAuthorizationHeaderWithAltDSID:()AppleAccount grandslamToken:
{
  BOOL v4;
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;

  if (a3)
    v4 = a4 == 0;
  else
    v4 = 1;
  v5 = !v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), a3, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataUsingEncoding:", 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v9, CFSTR("X-Apple-GS-Token"));
  }
  return v5;
}

- (uint64_t)aa_addGrandslamAuthorizationheaderWithAltDSID:()AppleAccount heartbeatToken:
{
  BOOL v4;
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;

  if (a3)
    v4 = a4 == 0;
  else
    v4 = 1;
  v5 = !v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), a3, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataUsingEncoding:", 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v9, CFSTR("X-Apple-HB-Token"));
  }
  return v5;
}

- (void)aa_addDeviceProvisioningInfoHeadersWithAccount:()AppleAccount
{
  id v4;

  objc_msgSend(a3, "aa_personID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "aa_addDeviceProvisioningInfoHeadersWithDSID:", v4);

}

- (uint64_t)aa_addDeviceProvisioningInfoHeadersWithDSID:()AppleAccount
{
  return objc_msgSend(a1, "aa_addDeviceProvisioningInfoHeadersWithDSID:sendEmptyValues:", a3, 0);
}

- (void)aa_addDeviceProvisioningInfoHeadersWithDSID:()AppleAccount sendEmptyValues:
{
  id v6;
  AADeviceProvisioningSession *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v7 = -[AADeviceProvisioningSession initWithDSID:]([AADeviceProvisioningSession alloc], "initWithDSID:", v6);
    -[AADeviceProvisioningSession addProvisioningInfoToURLRequest:sendEmptyValues:](v7, "addProvisioningInfoToURLRequest:sendEmptyValues:", a1, a4);

  }
  else
  {
    _AALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_19EACA000, v8, OS_LOG_TYPE_DEFAULT, "BADNESS!!! No DSID passed to aa_addDeviceProvisioningInfoHeadersWithDSID: %@", (uint8_t *)&v10, 0xCu);

    }
  }

}

- (uint64_t)aa_addDeviceInternalDevHeaderIfEnabled
{
  uint64_t result;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 1;
  result = CFPreferencesGetAppBooleanValue(CFSTR("AAUISendInternalDevHeader"), CFSTR("com.apple.appleaccount"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = (_DWORD)result == 0;
  else
    v3 = 0;
  if (!v3)
  {
    result = objc_msgSend(MEMORY[0x1E0CF0ED0], "isInternalBuild");
    if ((_DWORD)result)
      return objc_msgSend(a1, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("X-Mme-Setup-AEBB-653C-D843-8834"));
  }
  return result;
}

- (void)aa_addDeviceIDHeader
{
  AADeviceInfo *v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v2 = objc_alloc_init(AADeviceInfo);
  if (v2)
  {
    _AALogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_19EACA000, v3, OS_LOG_TYPE_DEFAULT, "Adding device udid to the request header", v5, 2u);
    }

    -[AADeviceInfo udid](v2, "udid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v4, CFSTR("X-Mme-Device-Id"));

  }
}

- (void)aa_addMultiUserDeviceHeaderIfEnabled
{
  if (aa_addMultiUserDeviceHeaderIfEnabled_onceToken != -1)
    dispatch_once(&aa_addMultiUserDeviceHeaderIfEnabled_onceToken, &__block_literal_global_19);
  if (aa_addMultiUserDeviceHeaderIfEnabled_isMultiUserDevice == 1)
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("X-MMe-Multi-User"));
}

- (void)aa_addLoggedInAppleIDHeaderWithAccount:()AppleAccount
{
  id v4;

  if (a3)
  {
    objc_msgSend(a3, "username");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v4, CFSTR("X-MMe-LoggedIn-AppleID"));

  }
}

- (uint64_t)aa_addDeviceProvisioningInfoHeadersWithDSIDFromReponse:()AppleAccount
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  NSObject *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  void *v30;
  uint8_t buf[16];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C92C00];
  objc_msgSend(v4, "allHeaderFields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cookiesWithResponseHeaderFields:forURL:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (!v10)
  {

    v13 = 0;
LABEL_20:
    v28 = 0;
    goto LABEL_21;
  }
  v11 = v10;
  v30 = a1;
  v12 = 0;
  v13 = 0;
  v14 = *(_QWORD *)v33;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v33 != v14)
        objc_enumerationMutation(v9);
      v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
      objc_msgSend(v16, "name", v30);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("dsid"));

      if (v18)
      {
        objc_msgSend(v16, "value");
        v19 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v19;
      }
      else
      {
        objc_msgSend(v16, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "isEqualToString:", CFSTR("hsa-action")))
        {
          objc_msgSend(v16, "value");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("LinkiTunes"));

        }
        else
        {
          v22 = 0;
        }

        v12 |= v22;
      }
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  }
  while (v11);

  if (((v13 != 0) & v12) != 1)
    goto LABEL_20;
  _AALogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19EACA000, v23, OS_LOG_TYPE_DEFAULT, "Server is asking for device provisioning information", buf, 2u);
  }

  objc_msgSend(v30, "allHTTPHeaderFields");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  objc_msgSend(v30, "aa_addDeviceProvisioningInfoHeadersWithDSID:", v13);
  objc_msgSend(v30, "allHTTPHeaderFields");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "count");

  if (v27 <= v25)
    goto LABEL_20;
  v28 = 1;
LABEL_21:

  return v28;
}

- (void)aa_addClientInfoHeaders
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  id v16;

  +[AADeviceInfo userAgentHeader](AADeviceInfo, "userAgentHeader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v2, CFSTR("User-Agent"));

  +[AADeviceInfo clientInfoHeader](AADeviceInfo, "clientInfoHeader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v3, CFSTR("X-MMe-Client-Info"));

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v6, CFSTR("X-MMe-Country"));

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(","));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = CFSTR("en");
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v10, CFSTR("X-MMe-Language"));

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "minimizedLanguagesFromLanguages:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR(","));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (__CFString *)v12;
  else
    v14 = CFSTR("en");
  v15 = v14;

  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v15, CFSTR("Accept-Language"));
}

- (void)aa_addContentTypeHeaders:()AppleAccount
{
  id v4;

  v4 = a3;
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v4, CFSTR("Content-Type"));
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v4, CFSTR("Accept"));

}

- (uint64_t)aa_addLocationSharingAllowedHeader
{
  const __CFString *v2;

  if (MGGetBoolAnswer())
    v2 = CFSTR("true");
  else
    v2 = CFSTR("false");
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", v2, CFSTR("X-MMe-FMFAllowed"));
}

- (void)aa_addProxiedAuthHeaderWithAccount:()AppleAccount
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t buf[16];

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(v5, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "aa_password");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@:%@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "dataUsingEncoding:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "base64EncodedStringWithOptions:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Basic %@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v11, CFSTR("Authorization-Proxied"));
  _AALogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "Using proxied auth credentials", buf, 2u);
  }

}

- (uint64_t)aa_addAppProvidedContext:()AppleAccount
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", a3, CFSTR("X-Apple-I-App-Provided-Context"));
}

- (void)aa_addSpyglassModeHeaderWithMask:()AppleAccount
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v4, CFSTR("X-Apple-I-Spyglass-Mode"));

}

- (void)aa_setJSONBodyWithParameters:()AppleAccount .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_19EACA000, log, OS_LOG_TYPE_ERROR, "JSON Serialization exception: %@\nInvalid JSON input: %@", buf, 0x16u);

}

- (void)aa_setJSONBodyWithParameters:()AppleAccount .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19EACA000, a2, OS_LOG_TYPE_ERROR, "Unable to serialize request parameters! Error: %@", (uint8_t *)&v2, 0xCu);
}

@end
