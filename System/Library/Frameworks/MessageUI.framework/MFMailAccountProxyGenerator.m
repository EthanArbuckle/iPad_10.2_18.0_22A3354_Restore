@implementation MFMailAccountProxyGenerator

- (MFMailAccountProxyGenerator)init
{
  return -[MFMailAccountProxyGenerator initWithAllowsRestrictedAccounts:](self, "initWithAllowsRestrictedAccounts:", 0);
}

- (MFMailAccountProxyGenerator)initWithAllowsRestrictedAccounts:(BOOL)a3
{
  MFMailAccountProxyGenerator *v4;
  MFMailAccountProxyGenerator *v5;
  _MFMailAccountProxySource *v6;
  _MFMailAccountProxySource *proxySource;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MFMailAccountProxyGenerator;
  v4 = -[MFMailAccountProxyGenerator init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_allowsRestrictedAccounts = a3;
    v6 = objc_alloc_init(_MFMailAccountProxySource);
    proxySource = v5->_proxySource;
    v5->_proxySource = v6;

  }
  return v5;
}

- (id)defaultMailAccountProxyForDeliveryOriginatingBundleID:(id)a3 sourceAccountManagement:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint8_t v18[16];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v4 = *(_QWORD *)&a4;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[_MFMailAccountProxySource accountProxiesOriginatingBundleID:sourceAccountManagement:](self->_proxySource, "accountProxiesOriginatingBundleID:sourceAccountManagement:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = 0;
    v10 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v12, "_isActive")
          && (self->_allowsRestrictedAccounts || (objc_msgSend(v12, "_isRestricted") & 1) == 0))
        {
          if (objc_msgSend(v12, "isDefaultDeliveryAccount"))
          {
            v13 = v12;
            goto LABEL_17;
          }
          if (!v9)
            v9 = v12;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v8)
        continue;
      break;
    }
    v13 = 0;
  }
  else
  {
    v13 = 0;
    v9 = 0;
  }
LABEL_17:

  if (!(v13 | v9))
  {
    +[MFMailAccountProxy log](MFMailAccountProxy, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1AB96A000, v14, OS_LOG_TYPE_DEFAULT, "defaultAccount, firstUnrestrictedAccount are nil", v18, 2u);
    }

  }
  if (v13)
    v15 = (void *)v13;
  else
    v15 = (void *)v9;
  v16 = v15;

  return v16;
}

- (id)accountProxyContainingEmailAddress:(id)a3 includingInactive:(BOOL)a4
{
  -[MFMailAccountProxyGenerator accountProxyContainingEmailAddress:includingInactive:originatingBundleID:sourceAccountManagement:](self, "accountProxyContainingEmailAddress:includingInactive:originatingBundleID:sourceAccountManagement:", a3, a4, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)accountProxyContainingEmailAddress:(id)a3 includingInactive:(BOOL)a4 originatingBundleID:(id)a5 sourceAccountManagement:(int)a6
{
  uint64_t v6;
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v40;
  void *v41;
  id obj;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  id v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v6 = *(_QWORD *)&a6;
  v8 = a4;
  v59 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v41 = v11;
  if (v8)
    -[MFMailAccountProxyGenerator allAccountProxies](self, "allAccountProxies");
  else
    -[MFMailAccountProxyGenerator activeAccountProxiesOriginatingBundleID:sourceAccountManagement:](self, "activeAccountProxiesOriginatingBundleID:sourceAccountManagement:", v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v10;
  objc_msgSend(v13, "emailAddressValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "simpleAddress");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v48 = v15;
  }
  else
  {
    objc_msgSend(v13, "stringValue");
    v48 = (id)objc_claimAutoreleasedReturnValue();
  }

  v17 = v13;
  objc_msgSend(v17, "emailAddressValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "displayName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    v46 = v19;
  }
  else
  {
    objc_msgSend(v17, "stringValue");
    v46 = (id)objc_claimAutoreleasedReturnValue();
  }

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v12;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  v40 = v17;
  if (!v21)
  {
    v23 = 0;
    v24 = 0;
    goto LABEL_40;
  }
  v22 = v21;
  v23 = 0;
  v24 = 0;
  v43 = *(_QWORD *)v54;
  do
  {
    v44 = v22;
    for (i = 0; i != v44; ++i)
    {
      if (*(_QWORD *)v54 != v43)
        objc_enumerationMutation(obj);
      v25 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
      objc_msgSend(v25, "_emailAddressesAndAliases");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "ef_map:", &__block_literal_global_19);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v47 = v27;
      v28 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      if (v28)
      {
        v29 = *(_QWORD *)v50;
        do
        {
          for (j = 0; j != v28; ++j)
          {
            if (*(_QWORD *)v50 != v29)
              objc_enumerationMutation(v47);
            if (!objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * j), "caseInsensitiveCompare:", v48))
            {
              objc_msgSend(v25, "fullUserName");
              v31 = objc_claimAutoreleasedReturnValue();
              v32 = (void *)v31;
              if (v46 && (!v31 || objc_msgSend(v46, "caseInsensitiveCompare:", v31)))
              {
                if (v24)
                {
                  v33 = v24;
                  v34 = v24;
                  v35 = v23;
                  v24 = v25;
                  if (!objc_msgSend(v25, "isDefaultDeliveryAccount"))
                    goto LABEL_33;
                }
                else
                {
                  v34 = 0;
                  v24 = v25;
                }
              }
              else if (v23)
              {
                v35 = v23;
                v34 = v23;
                v23 = v25;
                v33 = v24;
                if ((objc_msgSend(v25, "isDefaultDeliveryAccount") & 1) == 0)
                  goto LABEL_33;
              }
              else
              {
                v34 = 0;
                v23 = v25;
              }
              v36 = v25;

              v35 = v23;
              v33 = v24;
LABEL_33:

              v23 = v35;
              v24 = v33;
              continue;
            }
          }
          v28 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
        }
        while (v28);
      }

    }
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  }
  while (v22);
LABEL_40:

  if (v23)
    v37 = v23;
  else
    v37 = v24;
  v38 = v37;

  return v38;
}

id __128__MFMailAccountProxyGenerator_accountProxyContainingEmailAddress_includingInactive_originatingBundleID_sourceAccountManagement___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "emailAddressValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "simpleAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v2, "stringValue");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)activeAccountProxiesOriginatingBundleID:(id)a3 sourceAccountManagement:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v4 = *(_QWORD *)&a4;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[_MFMailAccountProxySource accountProxiesOriginatingBundleID:sourceAccountManagement:](self->_proxySource, "accountProxiesOriginatingBundleID:sourceAccountManagement:", v6, v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v12, "_isActive")
          && (self->_allowsRestrictedAccounts || (objc_msgSend(v12, "_isRestricted") & 1) == 0))
        {
          objc_msgSend(v7, "addObject:", v12);
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v7;
}

- (id)allAccountProxies
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[_MFMailAccountProxySource accountProxiesOriginatingBundleID:sourceAccountManagement:](self->_proxySource, "accountProxiesOriginatingBundleID:sourceAccountManagement:", 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (self->_allowsRestrictedAccounts
          || (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "_isRestricted") & 1) == 0)
        {
          objc_msgSend(v3, "addObject:", v8);
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxySource, 0);
}

@end
