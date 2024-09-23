@implementation AAUniversalLinkHelper

+ (id)infoForComponents:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "queryItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (!v5)
  {
    v7 = 0;
    v27 = 0;
    v26 = 0;
    goto LABEL_26;
  }
  v6 = v5;
  v30 = v3;
  v31 = 0;
  v32 = 0;
  v7 = 0;
  v8 = 0;
  v9 = *(_QWORD *)v34;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v34 != v9)
        objc_enumerationMutation(v4);
      v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
      objc_msgSend(v11, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("id"));

      if (v13)
      {
        objc_msgSend(v11, "value");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = v7;
        v7 = (void *)v14;
      }
      else
      {
        objc_msgSend(v11, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("flow"));

        if (v17)
        {
          objc_msgSend(v11, "value");
          v18 = objc_claimAutoreleasedReturnValue();
          v15 = v8;
          v8 = (void *)v18;
        }
        else
        {
          objc_msgSend(v11, "name");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("domainState"));

          if (v20)
          {
            objc_msgSend(v11, "value");
            v21 = objc_claimAutoreleasedReturnValue();
            v15 = v32;
            v32 = (void *)v21;
          }
          else
          {
            objc_msgSend(v11, "name");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("state"));

            if (!v23)
              continue;
            objc_msgSend(v11, "value");
            v24 = objc_claimAutoreleasedReturnValue();
            v15 = v31;
            v31 = (void *)v24;
          }
        }
      }

    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  }
  while (v6);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setValue:forKey:", v8, CFSTR("flow"));
    v3 = v30;
    v26 = v31;
    v27 = v32;
    if (v7)
      objc_msgSend(v25, "setValue:forKey:", v7, CFSTR("id"));
    if (v32)
      objc_msgSend(v25, "setValue:forKey:", v32, CFSTR("domainState"));
    if (v31)
      objc_msgSend(v25, "setValue:forKey:", v31, CFSTR("state"));
    goto LABEL_29;
  }
  v3 = v30;
  v26 = v31;
  v27 = v32;
LABEL_26:
  _AALogSystem();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    +[AAUniversalLinkHelper infoForComponents:].cold.1(v28);

  v8 = 0;
  v25 = 0;
LABEL_29:

  return v25;
}

+ (id)stringForCustodianMessagesURLWithUUID:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("AAUniversalLinkHelper.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uuid"));

  }
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("https://setup.icloud.com/private/trustedcontact?%@=%@&%@=%@"), CFSTR("flow"), CFSTR("custodian"), CFSTR("id"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)stringForBenefiaryMessagesURLWithUUID:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("AAUniversalLinkHelper.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uuid"));

  }
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("https://setup.icloud.com/private/trustedcontact?%@=%@&%@=%@"), CFSTR("flow"), CFSTR("digitalLegacy"), CFSTR("id"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)infoForComponents:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19EACA000, log, OS_LOG_TYPE_ERROR, "Flow was nil.", v1, 2u);
}

@end
