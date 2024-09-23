@implementation NEDNSSettingsNetworkAgent

+ (id)agentDomain
{
  return CFSTR("SystemConfig");
}

+ (id)agentType
{
  return CFSTR("DNSAgent");
}

+ (id)agentFromData:(id)a3
{
  return 0;
}

- (id)copyAgentData
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char isKindOfClass;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _QWORD v63[3];

  v63[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)nw_resolver_config_create();
  nw_resolver_config_set_class();
  -[NEDNSSettingsNetworkAgent settings](self, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "dnsProtocol");

  if (v5 != 1)
  {
    if (v5 == 3)
    {
      -[NEDNSSettingsNetworkAgent settings](self, "settings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "proxyAgentUUID");

    }
    else if (v5 != 2)
    {
      v46 = 0;
      goto LABEL_40;
    }
  }
  nw_resolver_config_set_protocol();
  v63[0] = 0;
  v63[1] = 0;
  -[NENetworkAgent configurationUUID](self, "configurationUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getUUIDBytes:", v63);

  nw_resolver_config_set_identifier();
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  -[NEDNSSettingsNetworkAgent settings](self, "settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "servers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v57 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "UTF8String");
        nw_resolver_config_add_name_server();
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    }
    while (v11);
  }

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  -[NEDNSSettingsNetworkAgent settings](self, "settings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "searchDomains");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v53;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v53 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * j), "UTF8String");
        nw_resolver_config_add_search_domain();
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
    }
    while (v17);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  -[NEDNSSettingsNetworkAgent settings](self, "settings", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "matchDomains");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v49;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v49 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * k), "UTF8String");
        nw_resolver_config_add_match_domain();
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
    }
    while (v23);
  }

  -[NEDNSSettingsNetworkAgent settings](self, "settings");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "proxyAgentUUID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[NEDNSSettingsNetworkAgent settings](self, "settings");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "proxyAgentUUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "UUIDString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "UTF8String");
    nw_resolver_config_set_proxy_agent();

  }
  -[NEDNSSettingsNetworkAgent settings](self, "settings");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[NEDNSSettingsNetworkAgent settings](self, "settings");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "serverName");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v34, "UTF8String");
    nw_resolver_config_set_provider_name();
    -[NEDNSSettingsNetworkAgent settings](self, "settings");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "identityReference");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      objc_msgSend(v36, "bytes");
      objc_msgSend(v36, "length");
      nw_resolver_config_set_identity_reference();
    }

  }
  -[NEDNSSettingsNetworkAgent settings](self, "settings");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v38 = objc_opt_isKindOfClass();

  if ((v38 & 1) != 0)
  {
    -[NEDNSSettingsNetworkAgent settings](self, "settings");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "serverURL");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v40, 0);
    objc_msgSend(v41, "percentEncodedHost");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "percentEncodedPath");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "UTF8String");
    nw_resolver_config_set_provider_name();
    objc_msgSend(v43, "UTF8String");
    nw_resolver_config_set_provider_path();
    -[NEDNSSettingsNetworkAgent settings](self, "settings");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "identityReference");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      objc_msgSend(v45, "bytes");
      objc_msgSend(v45, "length");
      nw_resolver_config_set_identity_reference();
    }

  }
  v46 = (void *)nw_resolver_config_copy_plist_data();
LABEL_40:

  return v46;
}

- (NEDNSSettings)settings
{
  return (NEDNSSettings *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
