@implementation NPKOpenURLRouter

- (NPKOpenURLRouter)initWithDelegate:(id)a3
{
  id v4;
  NPKOpenURLRouter *v5;
  NPKOpenURLRouter *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NPKOpenURLRouter;
  v5 = -[NPKOpenURLRouter init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (BOOL)handleOpenURL:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_General_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "scheme");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "path");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v8;
      v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Handling open URL for URL with scheme: %@, path: %@", (uint8_t *)&v18, 0x16u);

    }
  }
  objc_msgSend(v4, "scheme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("shoebox")))
  {

  }
  else
  {
    objc_msgSend(v4, "scheme");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("wallet"));

    if (!v12)
      goto LABEL_11;
  }
  if (-[NPKOpenURLRouter handleUniversalLinkWithURL:](self, "handleUniversalLinkWithURL:", v4)
    || -[NPKOpenURLRouter _processShoeboxSchemeForURL:](self, "_processShoeboxSchemeForURL:", v4))
  {
    v13 = 1;
    goto LABEL_15;
  }
LABEL_11:
  pk_General_log();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  v13 = 0;
  if (v15)
  {
    pk_General_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v4;
      _os_log_impl(&dword_213518000, v16, OS_LOG_TYPE_DEFAULT, "Notice: Didn't understand URL: %@", (uint8_t *)&v18, 0xCu);
    }

    v13 = 0;
  }
LABEL_15:

  return v13;
}

- (BOOL)handleUniversalLinkWithUserActivity:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  objc_msgSend(v4, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", *MEMORY[0x24BDD13E8]);

  if (v6)
  {
    objc_msgSend(v4, "webpageURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NPKOpenURLRouter handleUniversalLinkWithURL:](self, "handleUniversalLinkWithURL:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)canOpenURLInSafariForURL:(id)a3
{
  return 0;
}

+ (void)openURLInSafariForURL:(id)a3 fromNavigationController:(id)a4
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((objc_msgSend(a1, "canOpenURLInSafariForURL:", v5) & 1) == 0)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

    if (v7)
    {
      pk_General_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = 138412290;
        v10 = v5;
        _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_ERROR, "Error: Unable to re-direct url: %@ to Safari.", (uint8_t *)&v9, 0xCu);
      }

    }
  }

}

+ (void)openDeepLinkForURL:(id)a3 isSensitive:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "openDeepLinkForURL:isSensitive:completion:", v5, v4, 0);

}

+ (void)openDeepLinkForURL:(id)a3 isSensitive:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  void (**v14)(_QWORD, _QWORD);

  v6 = a4;
  v7 = a3;
  v8 = a5;
  v9 = (void (**)(_QWORD, _QWORD))v8;
  if (v7)
  {
    v10 = objc_alloc_init(MEMORY[0x24BDC15A0]);
    objc_msgSend(v10, "setSensitive:", v6);
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __62__NPKOpenURLRouter_openDeepLinkForURL_isSensitive_completion___block_invoke;
    v12[3] = &unk_24CFE93A8;
    v13 = v7;
    v14 = v9;
    objc_msgSend(v11, "openURL:configuration:completionHandler:", v13, v10, v12);

LABEL_5:
    goto LABEL_6;
  }
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.NPKErrorDomain"), -1007, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v9)[2](v9, v10);
    goto LABEL_5;
  }
LABEL_6:

}

void __62__NPKOpenURLRouter_openDeepLinkForURL_isSensitive_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v8)
    {
      pk_General_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 32);
        v12 = 138412546;
        v13 = v10;
        v14 = 2112;
        v15 = v6;
        _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Failed to open deep link for url: %@ with error: %@", (uint8_t *)&v12, 0x16u);
      }

    }
  }
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v6);

}

- (BOOL)handleUniversalLinkWithURL:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  int v19;
  BOOL v20;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_General_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Handling universal link with URL: %@", buf, 0xCu);
    }

  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v4, 1);
  objc_msgSend(v8, "scheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "host");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pathComponents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(&unk_24D0564A0, "containsObject:", v9))
  {
    v22 = v12;
    v13 = -[NPKOpenURLRouter _isValidRelayServerURL:outPathComponents:](self, "_isValidRelayServerURL:outPathComponents:", v4, &v22);
    v14 = v22;

    if (!v13)
    {
      v15 = (void *)*MEMORY[0x24BE6F9E8];
      v16 = v10;
      v17 = v15;
      if (v16 == v17)
      {

      }
      else
      {
        v18 = v17;
        if (!v16 || !v17)
        {

LABEL_16:
          v20 = 0;
          goto LABEL_17;
        }
        v19 = objc_msgSend(v16, "isEqualToString:", v17);

        if (!v19)
          goto LABEL_16;
      }
    }
    v20 = -[NPKOpenURLRouter _handleUniversalLinkURLAsShoeboxURLForPathComponents:shouldParsePathComponents:urlComponents:](self, "_handleUniversalLinkURLAsShoeboxURLForPathComponents:shouldParsePathComponents:urlComponents:", v14, !v13, v8);
  }
  else
  {
    v20 = 0;
    v14 = v12;
  }
LABEL_17:

  return v20;
}

- (BOOL)_processShoeboxSchemeForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v4, 0);

  LOBYTE(self) = -[NPKOpenURLRouter _processShoeboxSchemeForHost:pathComponents:urlComponents:](self, "_processShoeboxSchemeForHost:pathComponents:urlComponents:", v5, v6, v7);
  return (char)self;
}

- (BOOL)_processShoeboxSchemeForHost:(id)a3 pathComponents:(id)a4 urlComponents:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  BOOL v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "queryItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE6F9A0]))
  {
    v12 = -[NPKOpenURLRouter _processCardHostWithPathComponents:queryItems:](self, "_processCardHostWithPathComponents:queryItems:", v9, v11);
  }
  else if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE6F838]))
  {
    v12 = -[NPKOpenURLRouter _processShareableCredentialsHostWithQueryItems:](self, "_processShareableCredentialsHostWithQueryItems:", v11);
  }
  else if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE6F1A0]))
  {
    v12 = -[NPKOpenURLRouter _processSubcredentialInvitationHostWithQueryItems:](self, "_processSubcredentialInvitationHostWithQueryItems:", v11);
  }
  else if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE6F9B0]))
  {
    v12 = -[NPKOpenURLRouter _processTransactionHostWithQueryItems:](self, "_processTransactionHostWithQueryItems:", v11);
  }
  else if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE6F928]))
  {
    v12 = -[NPKOpenURLRouter _processShareHostWithPathComponents:urlComponents:](self, "_processShareHostWithPathComponents:urlComponents:", v9, v10);
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("passes")))
  {
    v12 = -[NPKOpenURLRouter _processPassesHostWithPathComponents:urlComponents:](self, "_processPassesHostWithPathComponents:urlComponents:", v9, v10);
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("listActions")))
  {
    v12 = -[NPKOpenURLRouter _processListActionsMenuHostWithPathComponents:](self, "_processListActionsMenuHostWithPathComponents:", v9);
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("addCard")))
  {
    v12 = -[NPKOpenURLRouter _processAddCardHostWithPathComponents:](self, "_processAddCardHostWithPathComponents:", v9);
  }
  else if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE6F990]))
  {
    v12 = -[NPKOpenURLRouter _processDailyCashHostWithPathComponents:queryItems:](self, "_processDailyCashHostWithPathComponents:queryItems:", v9, v11);
  }
  else if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE6F920]))
  {
    v12 = -[NPKOpenURLRouter _processSavingsHostWithPathComponents:](self, "_processSavingsHostWithPathComponents:", v9);
  }
  else
  {
    if (!objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE6F988]))
    {
      v13 = 0;
      goto LABEL_24;
    }
    v12 = -[NPKOpenURLRouter _processPassUpdateHostWithPathComponents:](self, "_processPassUpdateHostWithPathComponents:", v9);
  }
  v13 = v12;
LABEL_24:

  return v13;
}

- (BOOL)_processCardHostWithPathComponents:(id)a3 queryItems:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  BOOL v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  BOOL v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v33;
  NPKOpenURLRouter *v34;
  void *v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  if (v8 == 3)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    pk_General_log();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

    if (v16)
    {
      pk_General_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v44 = v14;
        v45 = 2112;
        v46 = v9;
        _os_log_impl(&dword_213518000, v17, OS_LOG_TYPE_DEFAULT, "Notice: Handling action %@ for pass ID %@", buf, 0x16u);
      }

    }
    if (objc_msgSend(v14, "isEqualToString:", CFSTR("persistent_emulation")))
    {
      v18 = -[NPKOpenURLRouter _handleServiceModeRequestedForPassWithUniqueID:](self, "_handleServiceModeRequestedForPassWithUniqueID:", v9);
    }
    else
    {
      if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BE6F9A8]))
      {
        v33 = v14;
        v34 = self;
        v35 = v9;
        v36 = v7;
        v37 = v6;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v19 = v7;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        if (v20)
        {
          v21 = v20;
          v22 = 0;
          v23 = *(_QWORD *)v39;
          v24 = *MEMORY[0x24BE6F970];
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v39 != v23)
                objc_enumerationMutation(v19);
              v26 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
              objc_msgSend(v26, "name");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v27, "isEqualToString:", v24);

              if (v28)
              {
                objc_msgSend(v26, "value");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "componentsSeparatedByString:", CFSTR(","));
                v30 = objc_claimAutoreleasedReturnValue();

                v22 = (void *)v30;
              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
          }
          while (v21);
        }
        else
        {
          v22 = 0;
        }

        if ((unint64_t)objc_msgSend(v22, "count") > 1)
        {
          v31 = 0;
        }
        else
        {
          objc_msgSend(v22, "firstObject");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v7 = v36;
        v6 = v37;
        v9 = v35;
        v14 = v33;
        v13 = -[NPKOpenURLRouter _presentShareDetailsForPassUniqueID:shareIdentifier:](v34, "_presentShareDetailsForPassUniqueID:shareIdentifier:", v35, v31);

        goto LABEL_36;
      }
      if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BE6F998]))
      {
        v18 = -[NPKOpenURLRouter _presentEntitlementDetailsForPassUniqueID:](self, "_presentEntitlementDetailsForPassUniqueID:", v9);
      }
      else
      {
        if (!PKPaymentPassActionTypeFromString())
        {

          v13 = 0;
          goto LABEL_37;
        }
        v18 = -[NPKOpenURLRouter _presentPassDetailsForPassWithUniqueID:](self, "_presentPassDetailsForPassWithUniqueID:", v9);
      }
    }
    v13 = v18;
LABEL_36:

LABEL_37:
    goto LABEL_38;
  }
  if (v8 == 2)
  {
    objc_msgSend(v6, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      pk_General_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v44 = v9;
        _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Handling regular pass with pass ID %@", buf, 0xCu);
      }

    }
    v13 = -[NPKOpenURLRouter _presentPassDetailsForPassWithUniqueID:](self, "_presentPassDetailsForPassWithUniqueID:", v9);
    goto LABEL_37;
  }
  v13 = 0;
LABEL_38:

  return v13;
}

- (BOOL)_processShareableCredentialsHostWithQueryItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  BOOL v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  BOOL v34;
  NPKOpenURLRouter *v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v5)
  {
    v6 = v5;
    v36 = self;
    v7 = 0;
    v42 = 0;
    v8 = *(_QWORD *)v50;
    v9 = (void *)*MEMORY[0x24BE6F830];
    v10 = *MEMORY[0x24BDD0E88];
    v43 = (void *)*MEMORY[0x24BE6F840];
    v37 = v4;
    v38 = (void *)*MEMORY[0x24BE6F830];
    v39 = *(_QWORD *)v50;
    do
    {
      v11 = 0;
      v40 = v6;
      do
      {
        if (*(_QWORD *)v50 != v8)
          objc_enumerationMutation(v4);
        v12 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v11);
        objc_msgSend(v12, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqualToString:", v13))
        {
          objc_msgSend(v12, "value");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "pk_decodeHexadecimal");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            v41 = v7;
            v16 = objc_alloc(MEMORY[0x24BDD1620]);
            v48 = 0;
            v17 = (void *)objc_msgSend(v16, "initForReadingFromData:error:", v15, &v48);
            v18 = v48;
            if (v17)
              v19 = v18 == 0;
            else
              v19 = 0;
            if (v19)
            {
              v22 = (void *)MEMORY[0x24BDBCF20];
              v23 = objc_opt_class();
              objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = 0;
              objc_msgSend(v17, "decodeTopLevelObjectOfClasses:forKey:error:", v24, v10, &v47);
              v21 = objc_claimAutoreleasedReturnValue();
              v20 = v47;

              if (!v21)
              {
                v25 = (void *)MEMORY[0x24BDBCF20];
                v26 = objc_opt_class();
                objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = v20;
                objc_msgSend(v17, "decodeTopLevelObjectOfClasses:forKey:error:", v27, v10, &v46);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = v46;

                if (v28)
                {
                  objc_msgSend(v28, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_13);
                  v21 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v21 = 0;
                }

                v20 = v29;
              }
              v4 = v37;
            }
            else
            {
              v20 = v18;
              v21 = (uint64_t)v42;
            }
            objc_msgSend(v17, "finishDecoding");

            v42 = (void *)v21;
            v7 = v41;
            v9 = v38;
            v8 = v39;
          }

          v6 = v40;
        }
        if (objc_msgSend(v43, "isEqualToString:", v13))
        {
          objc_msgSend(v12, "value");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "pk_decodeHexadecimal");
          v31 = objc_claimAutoreleasedReturnValue();

          v7 = (id)v31;
        }

        ++v11;
      }
      while (v6 != v11);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    }
    while (v6);
    v32 = v42;
    if (v42)
    {
      v44[0] = MEMORY[0x24BDAC760];
      v44[1] = 3221225472;
      v44[2] = __67__NPKOpenURLRouter__processShareableCredentialsHostWithQueryItems___block_invoke_2;
      v44[3] = &unk_24CFEA0B0;
      v7 = v7;
      v45 = v7;
      objc_msgSend(v42, "pk_arrayByApplyingBlock:", v44);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v33 = 0;
    }
    self = v36;
  }
  else
  {
    v32 = 0;
    v7 = 0;
    v33 = 0;
  }
  v34 = -[NPKOpenURLRouter _handleShareableCredentialsAcceptanceWithShareableCredentials:thumbnailImageData:](self, "_handleShareableCredentialsAcceptanceWithShareableCredentials:thumbnailImageData:", v33, v7);

  return v34;
}

uint64_t __67__NPKOpenURLRouter__processShareableCredentialsHostWithQueryItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "encryptedPushProvisioningTarget");
}

id __67__NPKOpenURLRouter__processShareableCredentialsHostWithQueryItems___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BE6ED68];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithEncryptedProvisioningTarget:provisioningSharingIdentifier:passThumbnailImageData:", v4, 0, *(_QWORD *)(a1 + 32));

  return v5;
}

- (BOOL)_processSubcredentialInvitationHostWithQueryItems:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  void *v15;
  int v16;
  BOOL v17;
  void *v18;
  int v19;
  BOOL v20;
  void *v21;
  int v22;
  void *v23;
  BOOL v24;
  NPKOpenURLRouter *v26;
  void *v27;
  void *v28;
  void *v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v26 = self;
  v36 = *MEMORY[0x24BDAC8D0];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = a3;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v29 = 0;
    v28 = 0;
    v6 = 0;
    v7 = *(_QWORD *)v32;
    v8 = (void *)*MEMORY[0x24BE6F188];
    v9 = (void *)*MEMORY[0x24BE6F198];
    v27 = (void *)*MEMORY[0x24BE6F190];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v32 != v7)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v11, "name", v26);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v8, "isEqualToString:", v12);

        if (v13)
          v14 = v6 == 0;
        else
          v14 = 0;
        if (v14)
        {
          objc_msgSend(v11, "value");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v11, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v9, "isEqualToString:", v15);

          if (v16)
            v17 = v5 == 0;
          else
            v17 = 0;
          if (v17)
          {
            objc_msgSend(v11, "value");
            v5 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v11, "name");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(CFSTR("contact_name"), "isEqualToString:", v18);

            if (v19)
              v20 = v29 == 0;
            else
              v20 = 0;
            if (v20)
            {
              objc_msgSend(v11, "value");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v11, "name");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v27, "isEqualToString:", v21);

              if (v22 && !v28)
              {
                objc_msgSend(v11, "value");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "pk_decodeHexadecimal");
                v28 = (void *)objc_claimAutoreleasedReturnValue();

              }
            }
          }
        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
    v29 = 0;
    v28 = 0;
    v6 = 0;
  }
  v24 = -[NPKOpenURLRouter _handleSubcredentialInvitationAcceptanceForLocalInvitationIdentifier:remoteInvitationIdentifier:contactName:thumbnailImageData:](v26, "_handleSubcredentialInvitationAcceptanceForLocalInvitationIdentifier:remoteInvitationIdentifier:contactName:thumbnailImageData:", v6, v5, v29, v28, v26);

  return v24;
}

- (BOOL)_processTransactionHostWithQueryItems:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  NSObject *v22;
  id v23;
  _QWORD *v24;
  dispatch_time_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  NPKOpenURLRouter *v31;
  void *v32;
  void *v33;
  void *v34;
  id obj;
  _QWORD v36[6];
  _QWORD v37[6];
  _QWORD v38[6];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__10;
  v47 = __Block_byref_object_dispose__10;
  v48 = 0;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
  v31 = self;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  if (v4)
  {
    v8 = *(_QWORD *)v40;
    v9 = (void *)*MEMORY[0x24BE6F960];
    v34 = (void *)*MEMORY[0x24BE6F978];
    v33 = (void *)*MEMORY[0x24BE6F968];
    v32 = (void *)*MEMORY[0x24BE6F980];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v40 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        if (v44[5]
          || (objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "name"),
              v12 = (void *)objc_claimAutoreleasedReturnValue(),
              v13 = objc_msgSend(v9, "isEqualToString:", v12),
              v12,
              !v13))
        {
          if (v7
            || (objc_msgSend(v11, "name"),
                v16 = (void *)objc_claimAutoreleasedReturnValue(),
                v17 = objc_msgSend(v34, "isEqualToString:", v16),
                v16,
                !v17))
          {
            if (v6
              || (objc_msgSend(v11, "name"),
                  v18 = (void *)objc_claimAutoreleasedReturnValue(),
                  v19 = objc_msgSend(v33, "isEqualToString:", v18),
                  v18,
                  !v19))
            {
              if (!v5)
              {
                objc_msgSend(v11, "name");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = objc_msgSend(v32, "isEqualToString:", v20);

                if (v21)
                {
                  objc_msgSend(v11, "value");
                  v5 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v5 = 0;
                }
              }
            }
            else
            {
              objc_msgSend(v11, "value");
              v6 = (void *)objc_claimAutoreleasedReturnValue();
            }
          }
          else
          {
            objc_msgSend(v11, "value");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          objc_msgSend(v11, "value");
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = (void *)v44[5];
          v44[5] = v14;

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
    }
    while (v4);
  }

  v22 = dispatch_group_create();
  if (!v44[5])
  {
    if (objc_msgSend(v7, "length"))
    {
      dispatch_group_enter(v22);
      v23 = objc_alloc_init(MEMORY[0x24BE6ED30]);
      v38[0] = MEMORY[0x24BDAC760];
      v38[1] = 3221225472;
      v38[2] = __58__NPKOpenURLRouter__processTransactionHostWithQueryItems___block_invoke;
      v38[3] = &unk_24CFEA0D8;
      v38[5] = &v43;
      v24 = v38;
      v38[4] = v22;
      objc_msgSend(v23, "passUniqueIdentifierForTransactionWithIdentifier:completion:", v7, v38);
    }
    else
    {
      if (!objc_msgSend(v6, "length"))
      {
        v29 = 0;
        goto LABEL_34;
      }
      dispatch_group_enter(v22);
      v23 = objc_alloc_init(MEMORY[0x24BE6ED30]);
      if (objc_msgSend(v5, "length"))
      {
        v37[0] = MEMORY[0x24BDAC760];
        v37[1] = 3221225472;
        v37[2] = __58__NPKOpenURLRouter__processTransactionHostWithQueryItems___block_invoke_2;
        v37[3] = &unk_24CFEA0D8;
        v37[5] = &v43;
        v24 = v37;
        v37[4] = v22;
        objc_msgSend(v23, "passUniqueIdentifierForTransactionWithServiceIdentifier:transactionSourceIdentifier:completion:", v6, v5, v37);
      }
      else
      {
        v36[0] = MEMORY[0x24BDAC760];
        v36[1] = 3221225472;
        v36[2] = __58__NPKOpenURLRouter__processTransactionHostWithQueryItems___block_invoke_3;
        v36[3] = &unk_24CFEA0D8;
        v36[5] = &v43;
        v24 = v36;
        v36[4] = v22;
        objc_msgSend(v23, "ambiguousPassUniqueIdentifierForTransactionWithServiceIdentifier:completion:", v6, v36);
      }
    }

  }
  v25 = dispatch_time(0, 300000000000);
  dispatch_group_wait(v22, v25);
  if (objc_msgSend(v7, "length"))
  {
    v26 = -[NPKOpenURLRouter _presentTransactionDetailsForPassWithUniqueID:transactionIdentifier:](v31, "_presentTransactionDetailsForPassWithUniqueID:transactionIdentifier:", v44[5], v7);
  }
  else
  {
    v27 = objc_msgSend(v6, "length");
    v28 = v44[5];
    if (v27)
      v26 = -[NPKOpenURLRouter _presentTransactionDetailsForPassWithUniqueID:transactionServiceIdentifier:transactionSourceIdentifier:](v31, "_presentTransactionDetailsForPassWithUniqueID:transactionServiceIdentifier:transactionSourceIdentifier:", v28, v6, v5);
    else
      v26 = -[NPKOpenURLRouter _presentPassDetailsForPassWithUniqueID:](v31, "_presentPassDetailsForPassWithUniqueID:", v28);
  }
  v29 = v26;
LABEL_34:

  _Block_object_dispose(&v43, 8);
  return v29;
}

void __58__NPKOpenURLRouter__processTransactionHostWithQueryItems___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __58__NPKOpenURLRouter__processTransactionHostWithQueryItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __58__NPKOpenURLRouter__processTransactionHostWithQueryItems___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (BOOL)_processShareHostWithPathComponents:(id)a3 urlComponents:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  __CFString *v13;
  __CFString *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  BOOL v23;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  if (v8 == 2)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_17;
  }
  else
  {
    v10 = v8;
    if (v8 < 3)
    {
      v9 = 0;
LABEL_17:
      v22 = 0;
      goto LABEL_18;
    }
    v11 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    v12 = 1;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v12);
      v13 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13 == CFSTR("https:")
        || v13
        && (v15 = -[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("https:")), v14, v15))
      {
        objc_msgSend(v11, "appendFormat:", CFSTR("%@//"), v14);
      }
      else
      {
        objc_msgSend(v11, "appendFormat:", CFSTR("%@/"), v14);
      }

      ++v12;
    }
    while (v10 != v12);
    objc_msgSend(v7, "fragment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendFormat:", CFSTR("#%@"), v16);

    v9 = (void *)objc_msgSend(v11, "copy");
    if (!v9)
      goto LABEL_17;
  }
  objc_msgSend(v7, "queryItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pk_firstObjectPassingTest:", &__block_literal_global_75);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "value");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  v21 = (void *)*MEMORY[0x24BE6F128];
  if (v19)
    v21 = (void *)v19;
  v22 = v21;

LABEL_18:
  v23 = -[NPKOpenURLRouter _handleShareForMailboxAddress:referralSource:](self, "_handleShareForMailboxAddress:referralSource:", v9, v22);

  return v23;
}

uint64_t __70__NPKOpenURLRouter__processShareHostWithPathComponents_urlComponents___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)*MEMORY[0x24BE6F938];
  v4 = v2;
  v5 = v3;
  v6 = v5;
  if (v4 == v5)
  {
    v7 = 1;
  }
  else
  {
    v7 = 0;
    if (v4 && v5)
      v7 = objc_msgSend(v4, "isEqualToString:", v5);
  }

  return v7;
}

- (BOOL)_processPassesHostWithPathComponents:(id)a3 urlComponents:(id)a4
{
  id v5;
  void *v6;
  BOOL v7;
  BOOL v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (objc_msgSend(v5, "count") == 2)
  {
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("preventAppUninstall")))
    {
      v7 = -[NPKOpenURLRouter _presentPassListPreventAppUninstall](self, "_presentPassListPreventAppUninstall");
    }
    else
    {
      pk_General_log();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

      if (v10)
      {
        pk_General_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v13 = 138412290;
          v14 = v6;
          _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_ERROR, "Error: Cannot handle unsupported pass list action: %@. Presenting pass list.", (uint8_t *)&v13, 0xCu);
        }

      }
      v7 = -[NPKOpenURLRouter _presentPassList](self, "_presentPassList");
    }
    v8 = v7;

  }
  else
  {
    v8 = -[NPKOpenURLRouter _presentPassList](self, "_presentPassList");
  }

  return v8;
}

- (BOOL)_processDailyCashHostWithPathComponents:(id)a3 queryItems:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count") < 2)
  {
    objc_msgSend(v7, "npkFindFirstObjectMatchingCondition:", &__block_literal_global_76);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = -[NPKOpenURLRouter _presentPassBalanceDetailsForPassWiithUniqueID:](self, "_presentPassBalanceDetailsForPassWiithUniqueID:", v8);

  return v11;
}

uint64_t __71__NPKOpenURLRouter__processDailyCashHostWithPathComponents_queryItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BE6F960]);

  return v3;
}

- (BOOL)_processSavingsHostWithPathComponents:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_time_t v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__10;
  v20 = __Block_byref_object_dispose__10;
  v21 = 0;
  objc_msgSend(MEMORY[0x24BE6E970], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __58__NPKOpenURLRouter__processSavingsHostWithPathComponents___block_invoke;
  v13 = &unk_24CFEA160;
  v15 = &v16;
  v7 = v6;
  v14 = v7;
  objc_msgSend(v5, "defaultAccountForFeature:completion:", 2, &v10);
  v8 = dispatch_time(0, 300000000000);
  dispatch_group_wait(v7, v8);
  LOBYTE(self) = -[NPKOpenURLRouter _presentSavingsDetailsWithPassUniqueID:](self, "_presentSavingsDetailsWithPassUniqueID:", v17[5], v10, v11, v12, v13);

  _Block_object_dispose(&v16, 8);
  return (char)self;
}

void __58__NPKOpenURLRouter__processSavingsHostWithPathComponents___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: (account-pass-provisioning) fetched account %@", (uint8_t *)&v14, 0xCu);
    }

  }
  if (v3)
  {
    objc_msgSend(v3, "associatedPassUniqueID");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      pk_General_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        v14 = 138412290;
        v15 = v13;
        _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Found account with card unique id %@ ", (uint8_t *)&v14, 0xCu);
      }

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (BOOL)_processPassUpdateHostWithPathComponents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  BOOL v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  BOOL v16;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count") == 2)
  {
    objc_msgSend(v4, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE6EC00], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "diffForPassUpdateUserNotificationWithIdentifier:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "passUniqueID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      pk_General_log();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

      if (v10)
      {
        pk_General_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 138412290;
          v19 = v8;
          _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Successfully retrieved passUniqueID from notificationID: %@", (uint8_t *)&v18, 0xCu);
        }

      }
      v12 = -[NPKOpenURLRouter _presentPassDetailsForPassWithUniqueID:](self, "_presentPassDetailsForPassWithUniqueID:", v8);
    }
    else
    {
      v12 = -[NPKOpenURLRouter _presentPassList](self, "_presentPassList");
    }
    v16 = v12;

  }
  else
  {
    pk_General_log();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      pk_General_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_DEFAULT, "Notice: Unsupported pass update notification. Presenting pass list instead.", (uint8_t *)&v18, 2u);
      }

    }
    v16 = -[NPKOpenURLRouter _presentPassList](self, "_presentPassList");
  }

  return v16;
}

- (BOOL)_presentPassDetailsForPassWithUniqueID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v5)
  {
    -[NPKOpenURLRouter delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "urlRouter:requestPassDetailsPresentationForPassWithUniqueID:", self, v4);

  }
  return v5 != 0;
}

- (BOOL)_handleServiceModeRequestedForPassWithUniqueID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v5)
  {
    -[NPKOpenURLRouter delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "urlRouter:requestServiceModeForPassWithUniqueID:", self, v4);

  }
  return v5 != 0;
}

- (BOOL)_presentShareDetailsForPassUniqueID:(id)a3 shareIdentifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "length");
  if (v8)
  {
    -[NPKOpenURLRouter delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "urlRouter:requestShareDetailsPresentationForPassWithUniqueID:shareIdentifier:", self, v6, v7);

  }
  return v8 != 0;
}

- (BOOL)_presentEntitlementDetailsForPassUniqueID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v5)
  {
    -[NPKOpenURLRouter delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "urlRouter:requestEntitlementDetailsPresentationForPassWithUniqueID:", self, v4);

  }
  return v5 != 0;
}

- (BOOL)_handleShareableCredentialsAcceptanceWithShareableCredentials:(id)a3 thumbnailImageData:(id)a4
{
  id v6;
  id v7;
  void *v8;

  if (a3)
  {
    v6 = a4;
    v7 = a3;
    -[NPKOpenURLRouter delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "urlRouter:requestShareableCredentialAcceptanceFlowPresentationWithShareableCredentials:thumbnailImageData:", self, v7, v6);

  }
  return a3 != 0;
}

- (BOOL)_handleSubcredentialInvitationAcceptanceForLocalInvitationIdentifier:(id)a3 remoteInvitationIdentifier:(id)a4 contactName:(id)a5 thumbnailImageData:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_msgSend(v10, "length");
  if (v14)
  {
    -[NPKOpenURLRouter delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "urlRouter:requestSubcredentialInvitationAcceptanceFlowPresentationWithLocalInvitationIdentifier:remoteInvitationIdentifier:contactName:thumbnailImageData:", self, v10, v11, v12, v13);

  }
  return v14 != 0;
}

- (BOOL)_handleShareForMailboxAddress:(id)a3 referralSource:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "length");
  if (v8)
  {
    -[NPKOpenURLRouter delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "urlRouter:requestSharedInvitationAcceptanceFlowPresentationWithMailboxAddress:referralSource:", self, v6, v7);

  }
  return v8 != 0;
}

- (BOOL)_presentTransactionDetailsForPassWithUniqueID:(id)a3 transactionServiceIdentifier:(id)a4 transactionSourceIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "length");
  if (v11)
  {
    -[NPKOpenURLRouter delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "urlRouter:requestTransactionDetailsForPassWithUniqueID:transactionServiceIdentifier:transactionSourceIdentifier:", self, v8, v9, v10);

  }
  return v11 != 0;
}

- (BOOL)_presentTransactionDetailsForPassWithUniqueID:(id)a3 transactionIdentifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "length");
  if (v8)
  {
    -[NPKOpenURLRouter delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "urlRouter:requestTransactionDetailsForPassWithUniqueID:transactionIdentifier:", self, v6, v7);

  }
  return v8 != 0;
}

- (BOOL)_presentPassList
{
  void *v3;

  -[NPKOpenURLRouter delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestPassListForURLRouter:", self);

  return 1;
}

- (BOOL)_presentListActionsMenu
{
  void *v3;

  -[NPKOpenURLRouter delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestListActionsMenuForURLRouter:", self);

  return 1;
}

- (BOOL)_presentPassListPreventAppUninstall
{
  void *v3;

  -[NPKOpenURLRouter delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestPassListPreventAppUninstallForURLRouter:", self);

  return 1;
}

- (BOOL)_presentProvisioningFlow
{
  void *v3;

  -[NPKOpenURLRouter delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestProvisioningFlowForURLRouter:", self);

  return 1;
}

- (BOOL)_presentPassBalanceDetailsForPassWiithUniqueID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v5)
  {
    -[NPKOpenURLRouter delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "urlRouter:requestPassBalanceDetailsPresentationForPassWithUniqueID:", self, v4);

  }
  else
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v8)
    {
      pk_General_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v11 = 138412290;
        v12 = v4;
        _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_ERROR, "Error: Could not find pass with uniqueID: %@", (uint8_t *)&v11, 0xCu);
      }

    }
  }

  return v5 != 0;
}

- (BOOL)_presentSavingsDetailsWithPassUniqueID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v5)
  {
    -[NPKOpenURLRouter delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "urlRouter:requestSavingsDetailsPresentationWithPassUniqueID:", self, v4);

  }
  else
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v8)
    {
      pk_General_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v11 = 138412290;
        v12 = v4;
        _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_ERROR, "Error: Could not find card with uniqueID: %@", (uint8_t *)&v11, 0xCu);
      }

    }
  }

  return v5 != 0;
}

- (BOOL)_isValidRelayServerURL:(id)a3 outPathComponents:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BE6ED30]);
  objc_msgSend(v6, "sharedPaymentWebServiceContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKCurrentRegion();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allowedRelayServerHostsForRegion:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "host");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "containsObject:", v11);

  if (v12)
  {
    v15[0] = *MEMORY[0x24BE6F928];
    objc_msgSend(v5, "absoluteString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (BOOL)_handleUniversalLinkURLAsShoeboxURLForPathComponents:(id)a3 shouldParsePathComponents:(BOOL)a4 urlComponents:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  BOOL v15;
  void *v16;
  id v17;
  unint64_t v18;
  void *v19;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(v8, "count");
  v11 = v10;
  if (!v6)
  {
    v12 = 0;
    goto LABEL_10;
  }
  if (v10 < 1)
    goto LABEL_8;
  v12 = 0;
  while (1)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v13, "isEqualToString:", CFSTR("/")))
      break;

LABEL_7:
    if (v11 == ++v12)
      goto LABEL_8;
  }
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("apple-card"));

  if (v14)
    goto LABEL_7;
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_8:
    v15 = 0;
    goto LABEL_13;
  }
LABEL_10:
  objc_msgSend(v8, "objectAtIndexedSubscript:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v17, "addObject:", CFSTR("/"));
  v18 = v12 + 1;
  if (v18 < v11)
  {
    do
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v19);

      ++v18;
    }
    while (v11 != v18);
  }
  v15 = -[NPKOpenURLRouter _processShoeboxSchemeForHost:pathComponents:urlComponents:](self, "_processShoeboxSchemeForHost:pathComponents:urlComponents:", v16, v17, v9);

LABEL_13:
  return v15;
}

- (NPKOpenURLRouterDelegate)delegate
{
  return (NPKOpenURLRouterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
