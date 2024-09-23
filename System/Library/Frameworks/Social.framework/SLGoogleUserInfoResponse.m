@implementation SLGoogleUserInfoResponse

- (void)_populateDataFromResponseDictionary:(id)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  char isKindOfClass;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  SLGoogleUserInfoResponse *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v35 = self;
  -[SLWebUserInfoResponse setUserInfo:](self, "setUserInfo:", v5);
  _SLLog(v3, 7, CFSTR("SLGoogleUserInfoResponse got _userInfo: %@"));
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v36 = v5;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("names"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v43;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v43 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("metadata"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("primary"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "BOOLValue");

        if (v14)
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("displayName"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[SLWebUserInfoResponse setDisplayName:](v35, "setDisplayName:", v15);

          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("emailAddresses"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v39 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("value"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("metadata"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("primary"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "BOOLValue");

          if (v25)
            objc_msgSend(v37, "insertObject:atIndex:", v22, 0);
          else
            objc_msgSend(v37, "addObject:", v22);
        }

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v18);
  }

  v26 = (void *)objc_msgSend(v37, "copy");
  -[SLWebUserInfoResponse setEmailAddresses:](v35, "setEmailAddresses:", v26);

  -[SLWebUserInfoResponse emailAddresses](v35, "emailAddresses");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27)
  {
    v34 = v36;
    _SLLog(v3, 3, CFSTR("Couldn't get an email address. userInfo was: %@"));
  }
  objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("error"), v34);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("error"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("message"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v32 = objc_opt_isKindOfClass();

    if ((v32 & 1) != 0)
    {
      objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("message"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLWebUserInfoResponse setErrorMessage:](v35, "setErrorMessage:", v33);

    }
  }

}

@end
