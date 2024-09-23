@implementation _HKAppURLSpecification

+ (BOOL)isClinicalOnboardingURL:(id)a3
{
  id v3;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v4, "setHost:", CFSTR("provider-universal.health.apple.com"));
  objc_msgSend(v4, "setPath:", CFSTR("/o"));
  objc_msgSend(v4, "setScheme:", CFSTR("https"));
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 != v7)
  {
    objc_msgSend(v5, "scheme");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v19 = 0;
      goto LABEL_15;
    }
    v9 = (void *)v8;
    objc_msgSend(v3, "scheme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scheme");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "isEqual:", v11))
    {
      v19 = 0;
LABEL_14:

      goto LABEL_15;
    }
    v26 = v11;
    v27 = v10;
    v28 = v9;
  }
  objc_msgSend(v3, "host");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lowercaseString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "host");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lowercaseString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 == v15)
  {
    v19 = 1;
  }
  else
  {
    objc_msgSend(v5, "host");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "lowercaseString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v3, "host");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "lowercaseString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "host");
      v24 = v12;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lowercaseString");
      v23 = v13;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v21, "isEqual:", v18);

      v13 = v23;
      v12 = v24;

    }
    else
    {
      v19 = 0;
    }

  }
  v10 = v27;
  v9 = v28;
  v11 = v26;
  if (v6 != v7)
    goto LABEL_14;
LABEL_15:

  return v19;
}

+ (BOOL)parseClinicalOnboardingURL:(id)a3 resultHandler:(id)a4 errorHandler:(id)a5
{
  id v8;
  uint64_t (**v9)(id, void *, void *, void *, _QWORD);
  uint64_t (**v10)(id, void *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a3;
  v9 = (uint64_t (**)(id, void *, void *, void *, _QWORD))a4;
  v10 = (uint64_t (**)(id, void *))a5;
  if ((objc_msgSend(a1, "isClinicalOnboardingURL:", v8) & 1) != 0)
  {
    objc_msgSend(v8, "hk_valueForFirstInstanceOfParameterNamed:", CFSTR("g"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hk_valueForFirstInstanceOfParameterNamed:", CFSTR("b"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hk_valueForFirstInstanceOfParameterNamed:", CFSTR("src"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && v12)
    {
      objc_msgSend(v8, "hk_valueForFirstInstanceOfParameterNamed:", CFSTR("f"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v9[2](v9, v11, v12, v13, objc_msgSend(v14, "isEqualToString:", CFSTR("clinical-sharing")));
    }
    else
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      HKSensitiveLogItem(v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "hk_error:format:", 3, CFSTR("Failed to parse onboarding URL: %@"), v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v10[2](v10, v18);

    }
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    HKSensitiveLogItem(v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hk_error:format:", 3, CFSTR("Invalid onboarding URL: %@"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v10[2](v10, v12);
  }

  return v15;
}

+ (BOOL)isClinicalLoginRedirectURL:(id)a3
{
  void *i;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  BOOL v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id obj;
  void *v66;
  void *v67;
  char v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  _QWORD v88[2];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("code"), CFSTR("state"), 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("error"));
  v48 = v5;
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v50 = v6;
  objc_msgSend(v6, "queryItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v83, v89, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v84;
    do
    {
      for (i = 0; i != (void *)v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v84 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * (_QWORD)i), "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v12);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v83, v89, 16);
    }
    while (v10);
  }

  if ((objc_msgSend(v51, "isSubsetOfSet:", v7) & 1) == 0 && !objc_msgSend(v49, "isSubsetOfSet:", v7))
  {
    v46 = 0;
    goto LABEL_60;
  }
  objc_msgSend(v50, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  if (!v14)
    objc_msgSend(v50, "setPath:", CFSTR("/"));
  objc_msgSend(v50, "URL");
  v52 = objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v15, "setHost:", CFSTR("HealthProviderLogin"));
  objc_msgSend(v15, "setPath:", CFSTR("/"));
  objc_msgSend(v15, "setScheme:", CFSTR("x-argonaut-app"));
  objc_msgSend(v15, "URL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v88[0] = v16;
  v17 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v17, "setHost:", CFSTR("redirect.health.apple.com"));
  objc_msgSend(CFSTR("/"), "stringByAppendingPathComponent:", CFSTR("HealthProviderLogin"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPath:", v18);

  objc_msgSend(v17, "setScheme:", CFSTR("https"));
  objc_msgSend(v17, "URL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v88[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v21 = v20;
  v76 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v79, v87, 16);
  if (!v76)
  {
    v46 = 0;
    v22 = (void *)v52;
    goto LABEL_58;
  }
  v75 = *(_QWORD *)v80;
  v22 = (void *)v52;
  obj = v21;
  while (2)
  {
    for (j = 0; j != v76; ++j)
    {
      v24 = i;
      if (*(_QWORD *)v80 != v75)
        objc_enumerationMutation(obj);
      v25 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * j);
      objc_msgSend(v22, "scheme");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "scheme");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26 != v27)
      {
        objc_msgSend(v25, "scheme");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v20)
        {
          v34 = v27;
          i = v24;
          goto LABEL_38;
        }
        objc_msgSend(v22, "scheme");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "scheme");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = v28;
        if (!objc_msgSend(v28, "isEqual:"))
        {
          i = v24;
          goto LABEL_37;
        }
      }
      v78 = v20;
      objc_msgSend(v22, "port");
      v29 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "port");
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)v30;
      v77 = (void *)v29;
      if (v29 == v30)
      {
        v69 = (void *)v30;
        v33 = v4;
        v32 = v72;
      }
      else
      {
        objc_msgSend(v25, "port");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v4)
          goto LABEL_36;
        objc_msgSend(v22, "port");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "port");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v24, "isEqual:", v32) & 1) == 0)
        {
          v72 = v32;

LABEL_36:
          v34 = v26;
          v20 = v78;
          i = v24;
          if (v26 != v27)
          {
LABEL_37:

            v34 = v27;
          }
LABEL_38:

          continue;
        }
        v69 = v31;
        v33 = v4;
      }
      objc_msgSend(v22, "host");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "lowercaseString");
      v35 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "host");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "lowercaseString");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = (void *)v35;
      v72 = v32;
      if ((void *)v35 == v70)
      {
        v64 = v33;
        goto LABEL_32;
      }
      objc_msgSend(v25, "host");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "lowercaseString");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v33;
      if (v62)
      {
        v64 = v33;
        objc_msgSend(v22, "host");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "lowercaseString");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "host");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "lowercaseString");
        v58 = v36;
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v69;
        if (!objc_msgSend(v36, "isEqual:"))
        {
          v68 = 0;
          i = v24;
          v4 = v64;
          v45 = v77;
LABEL_45:

          goto LABEL_46;
        }
LABEL_32:
        objc_msgSend(v22, "path");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "lowercaseString");
        v38 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "path");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "lowercaseString");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = (void *)v38;
        if ((void *)v38 == v40)
        {
          v68 = 1;
          i = v24;
          v45 = v77;
          v37 = v69;
        }
        else
        {
          objc_msgSend(v25, "path");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "lowercaseString");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if (v41)
          {
            v54 = v41;
            objc_msgSend(v22, "path");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "lowercaseString");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "path");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "lowercaseString");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = objc_msgSend(v42, "isEqual:", v44);

            v22 = (void *)v52;
            v41 = v54;
          }
          else
          {
            v68 = 0;
          }
          i = v24;
          v37 = v69;

          v45 = v77;
        }

        v32 = v72;
        v4 = v64;
        if (v71 == v70)
          goto LABEL_47;
        goto LABEL_45;
      }
      v68 = 0;
      v62 = 0;
      i = v24;
      v45 = v77;
      v37 = v69;
LABEL_46:

LABEL_47:
      if (v45 != v37)
      {

      }
      if (v26 == v27)
      {

        v20 = v78;
      }
      else
      {

        v20 = v78;
      }
      if ((v68 & 1) != 0)
      {
        v46 = 1;
        v21 = obj;
        goto LABEL_58;
      }
    }
    v21 = obj;
    v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v87, 16);
    if (v76)
      continue;
    break;
  }
  v46 = 0;
LABEL_58:

LABEL_60:
  return v46;
}

+ (BOOL)parseClinicalLoginRedirectURL:(id)a3 resultHandler:(id)a4 errorHandler:(id)a5
{
  id v8;
  uint64_t (**v9)(id, void *, uint64_t);
  uint64_t (**v10)(id, void *, _QWORD);
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;

  v8 = a3;
  v9 = (uint64_t (**)(id, void *, uint64_t))a4;
  v10 = (uint64_t (**)(id, void *, _QWORD))a5;
  if ((objc_msgSend(a1, "isClinicalLoginRedirectURL:", v8) & 1) != 0)
  {
    objc_msgSend(v8, "hk_valueForFirstInstanceOfParameterNamed:", CFSTR("code"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hk_valueForFirstInstanceOfParameterNamed:", CFSTR("state"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v12);
      v14 = (void *)v13;
      if (v11)
      {
        if (v13)
        {
          v15 = v9[2](v9, v11, v13);
LABEL_9:
          v17 = v15;
LABEL_12:

          goto LABEL_13;
        }
LABEL_8:
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v10[2](v10, v14, 0);
        goto LABEL_9;
      }
    }
    else
    {
      if (v11)
        goto LABEL_8;
      v14 = 0;
    }
    objc_msgSend(v8, "hk_valueForFirstInstanceOfParameterNamed:", CFSTR("error"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_OAuth2_errorFromErrorValue:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = ((uint64_t (**)(id, void *, void *))v10)[2](v10, v19, v14);

    goto LABEL_12;
  }
  v16 = (void *)MEMORY[0x1E0CB35C8];
  HKSensitiveLogItem(v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hk_error:format:", 3, CFSTR("Invalid redirect URL: %@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v10[2](v10, v12, 0);
LABEL_13:

  return v17;
}

+ (BOOL)isAtrialFibrillationEventURL:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x1E0C99E98];
  v4 = a3;
  objc_msgSend(v3, "_hk_urlForAtrialFibrillationEventType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

@end
