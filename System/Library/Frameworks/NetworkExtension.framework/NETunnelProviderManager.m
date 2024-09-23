@implementation NETunnelProviderManager

- (NETunnelProviderManager)initWithSessionType:(int)a3 tunnelType:(int64_t)a4
{
  id *v6;
  NETunnelProviderManager *v7;
  NSArray *v8;
  NSArray *mailDomains;
  NSArray *v10;
  NSArray *calendarDomains;
  NSArray *v12;
  NSArray *contactsDomains;
  NSArray *v14;
  NSArray *safariDomains;
  NSArray *v16;
  NSArray *excludedDomains;
  NSArray *v18;
  NSArray *associatedDomains;
  objc_super v21;

  v6 = -[NEVPNConnection initWithType:]([NETunnelProviderSession alloc], a3);
  v21.receiver = self;
  v21.super_class = (Class)NETunnelProviderManager;
  v7 = -[NEVPNManager initWithGrade:connection:tunnelType:](&v21, sel_initWithGrade_connection_tunnelType_, 1, v6, a4);

  if (v7)
  {
    *(_WORD *)&v7->super._hasLoaded = 1;
    v8 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    mailDomains = v7->_mailDomains;
    v7->_mailDomains = v8;

    v10 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    calendarDomains = v7->_calendarDomains;
    v7->_calendarDomains = v10;

    v12 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    contactsDomains = v7->_contactsDomains;
    v7->_contactsDomains = v12;

    v14 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    safariDomains = v7->_safariDomains;
    v7->_safariDomains = v14;

    v16 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    excludedDomains = v7->_excludedDomains;
    v7->_excludedDomains = v16;

    v18 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    associatedDomains = v7->_associatedDomains;
    v7->_associatedDomains = v18;

  }
  return v7;
}

- (NETunnelProviderManager)init
{
  return -[NETunnelProviderManager initWithSessionType:tunnelType:](self, "initWithSessionType:tunnelType:", 1, 1);
}

- (BOOL)isProtocolTypeValid:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (void)additionalSetup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  id v16;

  -[NEVPNManager configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appVPN");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NEVPNManager configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "appVPN");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "protocol");
    v16 = (id)objc_claimAutoreleasedReturnValue();

    -[NEVPNManager configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appVPN");
  }
  else
  {
    objc_msgSend(v5, "VPN");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "protocol");
    v16 = (id)objc_claimAutoreleasedReturnValue();

    -[NEVPNManager configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "VPN");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "tunnelType");

  if ((unint64_t)(v11 - 1) <= 1)
  {
    objc_msgSend(v16, "providerBundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    objc_msgSend(v16, "setProviderBundleIdentifier:", v12);
    -[NEVPNManager configuration](self, "configuration");
    v13 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (v13)
      v13[20] = 0;

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPluginType:", v15);

}

- (void)loadFromPreferencesWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  if (v4)
  {
    +[NEVPNManager configurationManager]();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEVPNManager configuration](self, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __68__NETunnelProviderManager_loadFromPreferencesWithCompletionHandler___block_invoke;
    v8[3] = &unk_1E3CC46F8;
    v8[4] = self;
    v9 = v4;
    objc_msgSend(v5, "loadConfigurationWithID:withCompletionQueue:handler:", v7, MEMORY[0x1E0C80D38], v8);

  }
}

- (NSArray)copyAppRules
{
  NETunnelProviderManager *v2;
  void *v3;
  NSArray *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v2 = self;
  objc_sync_enter(v2);
  -[NEVPNManager configuration](v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appVPN");
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NEVPNManager configuration](v2, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appVPN");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appRules");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v4 = 0;
      goto LABEL_6;
    }
    v8 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[NEVPNManager configuration](v2, "configuration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appVPN");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appRules");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (NSArray *)objc_msgSend(v8, "initWithArray:copyItems:", v10, 1);

  }
LABEL_6:
  objc_sync_exit(v2);

  return v4;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v14.receiver = self;
  v14.super_class = (Class)NETunnelProviderManager;
  -[NEVPNManager descriptionWithIndent:options:](&v14, sel_descriptionWithIndent_options_, v5, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithString:", v8);

  -[NEVPNManager configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appVPN");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appRules");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v12, CFSTR("appRules"), v5, a4);

  return v9;
}

- (NETunnelProviderRoutingMethod)routingMethod
{
  NETunnelProviderManager *v2;
  void *v3;
  void *v4;
  NETunnelProviderRoutingMethod v5;

  v2 = self;
  objc_sync_enter(v2);
  -[NEVPNManager configuration](v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appVPN");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = NETunnelProviderRoutingMethodSourceApplication;
  else
    v5 = NETunnelProviderRoutingMethodDestinationIP;

  objc_sync_exit(v2);
  return v5;
}

- (NSArray)safariDomains
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSafariDomains:(NSArray *)safariDomains
{
  objc_setProperty_atomic_copy(self, a2, safariDomains, 32);
}

- (NSArray)mailDomains
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMailDomains:(NSArray *)mailDomains
{
  objc_setProperty_atomic_copy(self, a2, mailDomains, 40);
}

- (NSArray)calendarDomains
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCalendarDomains:(NSArray *)calendarDomains
{
  objc_setProperty_atomic_copy(self, a2, calendarDomains, 48);
}

- (NSArray)contactsDomains
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setContactsDomains:(NSArray *)contactsDomains
{
  objc_setProperty_atomic_copy(self, a2, contactsDomains, 56);
}

- (NSArray)appRules
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAppRules:(NSArray *)appRules
{
  objc_setProperty_atomic_copy(self, a2, appRules, 64);
}

- (NSArray)excludedDomains
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setExcludedDomains:(NSArray *)excludedDomains
{
  objc_setProperty_atomic_copy(self, a2, excludedDomains, 72);
}

- (NSArray)associatedDomains
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAssociatedDomains:(NSArray *)associatedDomains
{
  objc_setProperty_atomic_copy(self, a2, associatedDomains, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedDomains, 0);
  objc_storeStrong((id *)&self->_excludedDomains, 0);
  objc_storeStrong((id *)&self->_appRules, 0);
  objc_storeStrong((id *)&self->_contactsDomains, 0);
  objc_storeStrong((id *)&self->_calendarDomains, 0);
  objc_storeStrong((id *)&self->_mailDomains, 0);
  objc_storeStrong((id *)&self->_safariDomains, 0);
}

void __68__NETunnelProviderManager_loadFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  if (v6)
  {
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v28 = 138412290;
      v29 = v6;
      _os_log_error_impl(&dword_19BD16000, v8, OS_LOG_TYPE_ERROR, "Failed to load the configuration: %@", (uint8_t *)&v28, 0xCu);
    }

    +[NEVPNManager mapError:]((uint64_t)NEVPNManager, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_16;
  }
  v10 = *(void **)(a1 + 32);
  if (!v5)
  {
    objc_msgSend(v10, "configuration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "appVPN");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      objc_msgSend(v22, "appVPN");
    else
      objc_msgSend(v22, "VPN");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setEnabled:", 0);

    +[NEVPNManager loadedManagers]();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "removeObjectForKey:", v26);

    objc_msgSend(*(id *)(a1 + 32), "connection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEVPNConnection destroySession](v27);

    goto LABEL_15;
  }
  objc_msgSend(v10, "setConfiguration:", v5);
  -[NETunnelProviderManager loadAppRules](*(void **)(a1 + 32));
  v11 = *(_QWORD *)(a1 + 32);
  +[NEVPNManager loadedManagers]();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v14);

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v15 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = v15[7];

    if (v16)
    {
LABEL_15:
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v9 = 0;
      goto LABEL_16;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    -[NEVPNConnection createSessionWithConfigurationIdentifier:forceInfoFetch:completionHandler:](v17, v19, 0, *(void **)(a1 + 40));

  v9 = 0;
LABEL_16:
  objc_sync_exit(v7);

}

- (void)loadAppRules
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  uint64_t v44;
  void *v45;
  int v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  id obj;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "configuration");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appVPN");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appRules");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99D20]);
      objc_msgSend(a1, "setMailDomains:", v6);

      v7 = objc_alloc_init(MEMORY[0x1E0C99D20]);
      objc_msgSend(a1, "setCalendarDomains:", v7);

      v8 = objc_alloc_init(MEMORY[0x1E0C99D20]);
      objc_msgSend(a1, "setContactsDomains:", v8);

      v9 = objc_alloc_init(MEMORY[0x1E0C99D20]);
      objc_msgSend(a1, "setSafariDomains:", v9);

      v10 = objc_alloc_init(MEMORY[0x1E0C99D20]);
      objc_msgSend(a1, "setExcludedDomains:", v10);

      v11 = objc_alloc_init(MEMORY[0x1E0C99D20]);
      objc_msgSend(a1, "setAssociatedDomains:", v11);

      v58 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v59 = a1;
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      objc_msgSend(a1, "configuration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appVPN");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "appRules");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      obj = v14;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v62;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v62 != v17)
              objc_enumerationMutation(obj);
            v19 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v18);
            objc_msgSend(v19, "matchSigningIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) != 0)
              goto LABEL_13;
            objc_msgSend(v19, "matchSigningIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v21, "isEqualToString:", CFSTR("com.apple.email.maild")) & 1) != 0)
              goto LABEL_12;
            objc_msgSend(v19, "matchSigningIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v22, "isEqualToString:", CFSTR("com.apple.datausage.dataaccess.activesync")))
            {

LABEL_12:
LABEL_13:

LABEL_14:
              objc_msgSend(v19, "matchSigningIdentifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v23, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) != 0)
              {
                objc_msgSend(v19, "matchDomains");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v24, "count");

                if (!v25)
                  goto LABEL_40;
                objc_msgSend(v19, "matchDomains");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v59, "setMailDomains:", v26);
                goto LABEL_17;
              }
LABEL_39:

              goto LABEL_40;
            }
            objc_msgSend(v19, "matchSigningIdentifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("com.apple.mobilenotes"));

            if ((v28 & 1) != 0)
              goto LABEL_14;
            objc_msgSend(v19, "matchSigningIdentifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v29, "isEqualToString:", CFSTR("com.apple.mobilecal")) & 1) != 0)
              goto LABEL_22;
            objc_msgSend(v19, "matchSigningIdentifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v30, "isEqualToString:", CFSTR("com.apple.calaccessd")))
            {

LABEL_22:
LABEL_23:
              objc_msgSend(v19, "matchSigningIdentifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v23, "isEqualToString:", CFSTR("com.apple.mobilecal")) & 1) == 0)
                goto LABEL_39;
              objc_msgSend(v19, "matchDomains");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v31, "count");

              if (v32)
              {
                objc_msgSend(v19, "matchDomains");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v59, "setCalendarDomains:", v26);
LABEL_17:

                goto LABEL_40;
              }
              goto LABEL_40;
            }
            objc_msgSend(v19, "matchSigningIdentifier");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("com.apple.reminders"));

            if ((v34 & 1) != 0)
              goto LABEL_23;
            objc_msgSend(v19, "matchSigningIdentifier");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v35, "isEqualToString:", CFSTR("com.apple.MobileAddressBook")))
            {

LABEL_30:
              objc_msgSend(v19, "matchSigningIdentifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v23, "isEqualToString:", CFSTR("com.apple.MobileAddressBook")) & 1) == 0)
                goto LABEL_39;
              objc_msgSend(v19, "matchDomains");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = objc_msgSend(v38, "count");

              if (v39)
              {
                objc_msgSend(v19, "matchDomains");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v59, "setContactsDomains:", v26);
                goto LABEL_17;
              }
              goto LABEL_40;
            }
            objc_msgSend(v19, "matchSigningIdentifier");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("com.apple.dataaccessd"));

            if (v37)
              goto LABEL_30;
            objc_msgSend(v19, "matchSigningIdentifier");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v40, "isEqualToString:", CFSTR("com.apple.mobilesafari")))
            {

            }
            else
            {
              objc_msgSend(v19, "matchSigningIdentifier");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = objc_msgSend(v41, "isEqualToString:", CFSTR("com.apple.webapp"));

              if (!v42)
              {
                objc_msgSend(v19, "matchSigningIdentifier");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = objc_msgSend(v45, "isEqualToString:", CFSTR("com.apple.swcd"));

                if (v46)
                {
                  objc_msgSend(v19, "matchDomains");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  v48 = objc_msgSend(v47, "count");

                  if (v48)
                  {
                    objc_msgSend(v19, "matchDomains");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v59, "setAssociatedDomains:", v26);
                    goto LABEL_17;
                  }
                }
                else
                {
                  objc_msgSend(v58, "addObject:", v19);
                }
                goto LABEL_40;
              }
            }
            objc_msgSend(v19, "matchSigningIdentifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v23, "isEqualToString:", CFSTR("com.apple.mobilesafari")) & 1) == 0)
              goto LABEL_39;
            objc_msgSend(v19, "matchDomains");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_msgSend(v43, "count");

            if (v44)
            {
              objc_msgSend(v19, "matchDomains");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "setSafariDomains:", v26);
              goto LABEL_17;
            }
LABEL_40:
            ++v18;
          }
          while (v16 != v18);
          v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
          v16 = v49;
        }
        while (v49);
      }

      v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v58);
      objc_msgSend(v59, "setAppRules:", v50);

      objc_msgSend(v59, "configuration");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "appVPN");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "excludedDomains");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "count");

      if (v54)
      {
        objc_msgSend(v59, "configuration");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "appVPN");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "excludedDomains");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setExcludedDomains:", v57);

      }
    }
  }
}

+ (NETunnelProviderManager)forPerAppVPN
{
  return -[NETunnelProviderManager initWithSessionType:tunnelType:]([NETunnelProviderManager alloc], "initWithSessionType:tunnelType:", 2, 1);
}

+ (void)loadAllFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = completionHandler;
  if (v4)
  {
    v5 = +[NEVPNManager loadedManagers]();
    +[NEVPNManager configurationManager]();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __71__NETunnelProviderManager_loadAllFromPreferencesWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E3CC4310;
    v9 = a1;
    v8 = v4;
    objc_msgSend(v6, "loadConfigurationsWithCompletionQueue:handler:", MEMORY[0x1E0C80D38], v7);

  }
}

void __71__NETunnelProviderManager_loadAllFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  NETunnelProviderManager *v17;
  _BOOL4 v18;
  NETunnelProviderManager *v19;
  void *v20;
  BOOL v21;
  NETunnelProviderManager *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id obj;
  id v32;
  id v33;
  NSObject *group;
  _QWORD block[4];
  id v36;
  id v37;
  uint64_t *v38;
  _QWORD v39[5];
  NSObject *v40;
  uint64_t *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v32 = a2;
  v5 = a3;
  v30 = a1;
  obj = *(id *)(a1 + 40);
  objc_sync_enter(obj);
  v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__20881;
  v50 = __Block_byref_object_dispose__20882;
  v6 = v5;
  v51 = v6;
  v29 = v6;
  if (v6)
  {
    +[NEVPNManager mapError:]((uint64_t)NEVPNManager, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v47[5];
    v47[5] = v7;

    v9 = v47[5];
  }
  else
  {
    v9 = 0;
  }
  if (!v32 || v9 || !objc_msgSend(v32, "count", v29))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_35;
  }
  group = dispatch_group_create();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v10 = v32;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
  if (!v11)
    goto LABEL_33;
  v12 = *(_QWORD *)v43;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v43 != v12)
        objc_enumerationMutation(v10);
      v14 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
      objc_msgSend(v14, "VPN");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        objc_msgSend(v14, "VPN");
      else
        objc_msgSend(v14, "appVPN");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v16, "protocol");
        v17 = (NETunnelProviderManager *)objc_claimAutoreleasedReturnValue();
        if (-[NETunnelProviderManager type](v17, "type") == 4)
        {
          v18 = objc_msgSend(v16, "tunnelType") == 1;

          if (!v18)
            goto LABEL_31;
          objc_msgSend(v14, "pluginType");
          v19 = (NETunnelProviderManager *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            if (+[NETunnelProviderProtocol isLegacyPluginType:](NETunnelProviderProtocol, "isLegacyPluginType:", v19))
            {
              v17 = v19;
            }
            else
            {
              objc_msgSend(v14, "VPN");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = v20 == 0;

              if (v21)
              {
                v22 = [NETunnelProviderManager alloc];
                v23 = objc_msgSend(v16, "tunnelType");
                v24 = 2;
              }
              else
              {
                v22 = [NETunnelProviderManager alloc];
                v23 = objc_msgSend(v16, "tunnelType");
                v24 = 1;
              }
              v17 = -[NETunnelProviderManager initWithSessionType:tunnelType:](v22, "initWithSessionType:tunnelType:", v24, v23);
              -[NEVPNManager setConfiguration:](v17, "setConfiguration:", v14);
              -[NETunnelProviderManager loadAppRules](v17);
              objc_msgSend(v33, "addObject:", v17);
              +[NEVPNManager loadedManagers]();
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "identifier");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "setObject:forKeyedSubscript:", v17, v26);

              if (v17)
                v17->super._hasLoaded = 1;
              dispatch_group_enter(group);
              -[NEVPNManager connection](v17, "connection");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "identifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v39[0] = MEMORY[0x1E0C809B0];
              v39[1] = 3221225472;
              v39[2] = __71__NETunnelProviderManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_33;
              v39[3] = &unk_1E3CC42C0;
              v39[4] = v14;
              v41 = &v46;
              v40 = group;
              if (v27)
                -[NEVPNConnection createSessionWithConfigurationIdentifier:forceInfoFetch:completionHandler:](v27, v28, 0, v39);

            }
          }
          else
          {
            v17 = 0;
          }
        }

      }
LABEL_31:

    }
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
  }
  while (v11);
LABEL_33:

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__NETunnelProviderManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_35;
  block[3] = &unk_1E3CC42E8;
  v38 = &v46;
  v36 = v33;
  v37 = *(id *)(v30 + 32);
  dispatch_group_notify(group, MEMORY[0x1E0C80D38], block);

LABEL_35:
  _Block_object_dispose(&v46, 8);

  objc_sync_exit(obj);
}

void __71__NETunnelProviderManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_33(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = v4;
      _os_log_error_impl(&dword_19BD16000, v5, OS_LOG_TYPE_ERROR, "Error creating connection for configuration %@: %@", (uint8_t *)&v7, 0x16u);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __71__NETunnelProviderManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_35(uint64_t a1)
{
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
