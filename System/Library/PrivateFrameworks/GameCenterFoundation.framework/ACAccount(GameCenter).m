@implementation ACAccount(GameCenter)

- (uint64_t)_gkIsPrimaryForEnvironment:()GameCenter
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("playerID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "_gkCredentialsForEnvironment:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_msgSend(v7, "scope") >> 2) & 1;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_gkTokenForEnvironment:()GameCenter
{
  void *v4;
  void *v5;
  id v6;

  if (a3 == 5)
  {
    objc_msgSend(a1, "credential");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "token");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("<gone>")) & 1) != 0)
      v6 = 0;
    else
      v6 = v5;

  }
  else
  {
    GKTokenKeyForEnvironment(a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "accountPropertyForKey:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)_gkSetToken:()GameCenter forEnvironment:
{
  __CFString *v6;
  NSObject *v7;
  id v8;
  id v9;

  v6 = a3;
  v7 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v8 = GKOSLoggers();
    v7 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ACAccount(GameCenter) _gkSetToken:forEnvironment:].cold.1();
  if (a4 == 5)
  {
    objc_msgSend(a1, "credential");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9)
      v9 = objc_alloc_init(MEMORY[0x1E0C8F2B0]);
    if (!-[__CFString length](v6, "length"))
    {

      v6 = CFSTR("<gone>");
    }
    objc_msgSend(v9, "setToken:", v6);
    objc_msgSend(a1, "setCredential:", v9);
  }
  else
  {
    GKTokenKeyForEnvironment(a4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setAccountProperty:forKey:", v6, v9);
  }

}

- (id)_gkPerEnvironmentTokens
{
  void *v2;
  uint64_t i;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 12; ++i)
  {
    objc_msgSend(a1, "_gkTokenForEnvironment:", i);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", v4, v5);

    }
  }
  return v2;
}

- (id)_gkPlayerInternal
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v17;

  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("GKPlayerInternal"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0C99E60];
    v4 = objc_opt_class();
    objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v5, v2, &v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v17;
    if (v7)
    {
      if (!os_log_GKGeneral)
        v8 = GKOSLoggers();
      v9 = os_log_GKAccount;
      if (os_log_type_enabled((os_log_t)os_log_GKAccount, OS_LOG_TYPE_ERROR))
        -[ACAccount(GameCenter) _gkPlayerInternal].cold.3((uint64_t)v7, (uint64_t)v6, v9);
    }
    if (objc_msgSend(v6, "isMemberOfClass:", objc_opt_class()))
    {
      v10 = os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        v11 = GKOSLoggers();
        v10 = os_log_GKGeneral;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[ACAccount(GameCenter) _gkPlayerInternal].cold.1();
      +[GKLocalPlayerInternal minimalInternalFromSourcePlayer:](GKLocalPlayerInternal, "minimalInternalFromSourcePlayer:", v6);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v6, "isMemberOfClass:", objc_opt_class()))
      {
        if (!os_log_GKGeneral)
          v14 = GKOSLoggers();
        if (os_log_type_enabled((os_log_t)os_log_GKAccount, OS_LOG_TYPE_ERROR))
          -[ACAccount(GameCenter) _gkPlayerInternal].cold.2();
        v13 = 0;
LABEL_21:

        if (v13)
          goto LABEL_26;
        goto LABEL_22;
      }
      v12 = v6;
    }
    v13 = v12;
    goto LABEL_21;
  }
LABEL_22:
  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("playerID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    +[GKInternalRepresentation internalRepresentation](GKLocalPlayerInternal, "internalRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPlayerID:", v15);
  }
  else
  {
    v13 = 0;
  }

LABEL_26:
  return v13;
}

- (void)_gkSetPlayerInternal:()GameCenter
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;

  v4 = a3;
  objc_msgSend(v4, "contactsAssociationID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (int)objc_msgSend(v4, "contactsIntegrationConsent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceLastUpdatedTimestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minimalInternal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (!os_log_GKGeneral)
      v9 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKContacts, OS_LOG_TYPE_DEBUG))
      -[ACAccount(GameCenter) _gkSetPlayerInternal:].cold.1();
    if (objc_msgSend(v5, "length"))
      v10 = v5;
    else
      v10 = 0;
    objc_msgSend(a1, "setAccountProperty:forKey:", v10, CFSTR("GKContactsAssociationID"));
    objc_msgSend(a1, "setAccountProperty:forKey:", v6, CFSTR("GKContactsSharingState"));
    objc_msgSend(a1, "setAccountProperty:forKey:", v7, CFSTR("GKContactsLastUpdated"));
  }
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAccountProperty:forKey:", v11, CFSTR("GKPlayerInternal"));
  objc_msgSend(v8, "playerID");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = &stru_1E75BB5A8;
  objc_msgSend(a1, "setAccountProperty:forKey:", v14, CFSTR("playerID"));

}

- (uint64_t)_gkCredentials
{
  return objc_msgSend(a1, "_gkCredentialsForEnvironment:", 0);
}

- (uint64_t)_gkCredentialsForEnvironment:()GameCenter
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint64_t v23;

  objc_msgSend(a1, "credential");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v13 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v14 = GKOSLoggers();
      v13 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[ACAccount(GameCenter) _gkCredentialsForEnvironment:].cold.1();
    goto LABEL_14;
  }
  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("playerID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length"))
  {
    v15 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v16 = GKOSLoggers();
      v15 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[ACAccount(GameCenter) _gkCredentialsForEnvironment:].cold.2();

LABEL_14:
    return (uint64_t *)0;
  }
  objc_msgSend(a1, "_gkPerEnvironmentTokens");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __54__ACAccount_GameCenter___gkCredentialsForEnvironment___block_invoke;
    v20[3] = &unk_1E75B5598;
    v23 = a3;
    v20[4] = a1;
    v21 = v6;
    v10 = v9;
    v22 = v10;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v20);
    v11 = v22;
    v12 = (uint64_t *)v10;

  }
  else
  {
    v12 = &os_log_GKGeneral;
    v18 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v19 = GKOSLoggers();
      v18 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[ACAccount(GameCenter) _gkCredentialsForEnvironment:].cold.3();
  }

  if (!v8)
    return (uint64_t *)0;
  return v12;
}

- (id)_gkCredentialForEnvironment:()GameCenter
{
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__11;
  v12 = __Block_byref_object_dispose__11;
  v13 = 0;
  objc_msgSend(a1, "_gkCredentials");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__ACAccount_GameCenter___gkCredentialForEnvironment___block_invoke;
  v7[3] = &unk_1E75B55C0;
  v7[4] = &v8;
  v7[5] = a3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  v5 = (id)v9[5];

  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)_gkModifiedDateForProperty:()GameCenter environment:
{
  void *v5;
  void *v6;

  objc_msgSend(a3, "stringByAppendingFormat:", CFSTR("-%d-mod-date"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "accountPropertyForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_gkPropertyForKey:()GameCenter environment:
{
  void *v5;
  void *v6;

  objc_msgSend(a3, "stringByAppendingFormat:", CFSTR("-%d"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "accountPropertyForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_gkSetProperty:()GameCenter forKey:environment:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("-%d"), a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAccountProperty:forKey:", v9, v10);

  objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("-%d-mod-date"), a5);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAccountProperty:forKey:", v11, v12);

}

- (void)_gkSetToken:()GameCenter forEnvironment:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_5_0(&dword_1BCDE3000, v0, v1, "setting token:%@ for environment:%d");
  OUTLINED_FUNCTION_2();
}

- (void)_gkPlayerInternal
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_0_4(&dword_1BCDE3000, a3, (uint64_t)a3, "error while decoding playerInternal archive:%@ and playerInternal:%@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

- (void)_gkSetPlayerInternal:()GameCenter .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2_2(&dword_1BCDE3000, v0, v1, "Updating contacts assocationID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_gkCredentialsForEnvironment:()GameCenter .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_5(&dword_1BCDE3000, v0, v1, "LOADING ACCOUNT:%@: no credential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_gkCredentialsForEnvironment:()GameCenter .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_5(&dword_1BCDE3000, v0, v1, "LOADING ACCOUNT:%@: no player ID in this account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_gkCredentialsForEnvironment:()GameCenter .cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_5(&dword_1BCDE3000, v0, v1, "LOADING ACCOUNT:%@: No auth tokens", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
