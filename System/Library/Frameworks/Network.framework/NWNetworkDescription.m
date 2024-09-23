@implementation NWNetworkDescription

- (BOOL)matchesPath:(id)a3
{
  Class *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  char *v14;
  NSObject *v15;
  os_log_type_t v16;
  const char *v17;
  char *backtrace_string;
  os_log_type_t v19;
  _BOOL4 v20;
  int v21;
  int v22;
  int64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  char v30;
  NSObject *v31;
  os_log_type_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  double v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  int matched;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  char v59;
  os_log_type_t type[16];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t v64[128];
  uint8_t buf[4];
  const char *v66;
  __int16 v67;
  char *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v13 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v66 = "-[NWNetworkDescription matchesPath:]";
    v14 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    v59 = 0;
    if (__nwlog_fault(v14, type, &v59))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v15 = (id)gLogObj;
        v16 = type[0];
        if (!os_log_type_enabled(v15, type[0]))
          goto LABEL_39;
        *(_DWORD *)buf = 136446210;
        v66 = "-[NWNetworkDescription matchesPath:]";
        v17 = "%{public}s called with null path";
LABEL_37:
        v31 = v15;
        v32 = v16;
        goto LABEL_38;
      }
      if (!v59)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v15 = (id)gLogObj;
        v16 = type[0];
        if (!os_log_type_enabled(v15, type[0]))
          goto LABEL_39;
        *(_DWORD *)buf = 136446210;
        v66 = "-[NWNetworkDescription matchesPath:]";
        v17 = "%{public}s called with null path, backtrace limit exceeded";
        goto LABEL_37;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v15 = (id)gLogObj;
      v19 = type[0];
      v20 = os_log_type_enabled(v15, type[0]);
      if (!backtrace_string)
      {
        if (!v20)
        {
LABEL_39:

          if (!v14)
            goto LABEL_24;
          goto LABEL_23;
        }
        *(_DWORD *)buf = 136446210;
        v66 = "-[NWNetworkDescription matchesPath:]";
        v17 = "%{public}s called with null path, no backtrace";
        v31 = v15;
        v32 = v19;
LABEL_38:
        _os_log_impl(&dword_182FBE000, v31, v32, v17, buf, 0xCu);
        goto LABEL_39;
      }
      if (v20)
      {
        *(_DWORD *)buf = 136446466;
        v66 = "-[NWNetworkDescription matchesPath:]";
        v67 = 2082;
        v68 = backtrace_string;
        _os_log_impl(&dword_182FBE000, v15, v19, "%{public}s called with null path, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
    if (!v14)
      goto LABEL_24;
LABEL_23:
    free(v14);
    goto LABEL_24;
  }
  if (objc_msgSend(v5, "status") == 1)
  {
    -[NWNetworkDescription interfaceTypeOptions](self, "interfaceTypeOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v9 = v7;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
      if (v10)
      {
        v11 = v10;
        v3 = *(Class **)v56;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(Class **)v56 != v3)
              objc_enumerationMutation(v9);
            if ((objc_msgSend(v6, "usesInterfaceType:", objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "integerValue")) & 1) != 0)
            {

              goto LABEL_26;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
          if (v11)
            continue;
          break;
        }
      }
      goto LABEL_81;
    }
LABEL_26:
    v22 = objc_msgSend(v6, "isRoaming");
    v23 = -[NWNetworkDescription roamingPreference](self, "roamingPreference");
    v24 = 1;
    if (v22)
      v24 = 2;
    if (v23 && v24 == v23)
      goto LABEL_79;
    -[NWNetworkDescription ssidOptions](self, "ssidOptions");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v6, "interface");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "subtype") == 5001)
      {
        v27 = objc_msgSend(v6, "usesInterfaceType:", 1);

        if (v27)
        {
          v28 = (void *)objc_msgSend(v6, "copyDataFromNetworkAgentWithDomain:type:", CFSTR("com.apple.networkrelay"), CFSTR("CompanionNetworkDescription"));
          v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v28, 4);
          -[NWNetworkDescription ssidOptions](self, "ssidOptions");
          v3 = (Class *)objc_claimAutoreleasedReturnValue();
          v30 = NWUtilsStringMatchesPatternSet(v29, v3);

          if ((v30 & 1) != 0)
            goto LABEL_58;
        }
      }
      else
      {

      }
      objc_msgSend(v6, "interface");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "type");

      if (v34 != 1)
        goto LABEL_79;
      objc_msgSend(v6, "interface");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "interfaceName");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      gotLoadHelper_x24__OBJC_CLASS___CWFInterface(v36);
      if (!objc_opt_class())
      {

LABEL_81:
        LOBYTE(v21) = 0;
        goto LABEL_84;
      }
      v3 = (Class *)objc_alloc_init(v3[329]);
      -[Class activate](v3, "activate");
      v62 = 0u;
      v63 = 0u;
      *(_OWORD *)type = 0u;
      v61 = 0u;
      -[Class interfaceNames](v3, "interfaceNames");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", type, buf, 16);
      if (v38)
      {
        v39 = v38;
        v40 = *(_QWORD *)v61;
        while (2)
        {
          for (j = 0; j != v39; ++j)
          {
            if (*(_QWORD *)v61 != v40)
              objc_enumerationMutation(v37);
            if ((objc_msgSend(*(id *)(*(_QWORD *)&type[8] + 8 * j), "isEqual:", v35) & 1) != 0)
            {

              -[Class networkName](v3, "networkName");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_56;
            }
          }
          v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", type, buf, 16);
          if (v39)
            continue;
          break;
        }
      }

      v42 = 0;
LABEL_56:
      -[Class invalidate](v3, "invalidate");

      if (!v42)
        goto LABEL_79;
      -[NWNetworkDescription ssidOptions](self, "ssidOptions");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = NWUtilsStringMatchesPatternSet(v42, v43);

      if (!v44)
        goto LABEL_79;
    }
LABEL_58:
    -[NWNetworkDescription dnsServerAddressOptions](self, "dnsServerAddressOptions");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      objc_msgSend(v6, "dnsServersAsStrings");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "overrideDNSServersAsStrings");
      v46 = objc_claimAutoreleasedReturnValue();
      v47 = (void *)v46;
      if (v9)
      {
        -[NWNetworkDescription dnsServerAddressOptions](self, "dnsServerAddressOptions");
        v3 = (Class *)objc_claimAutoreleasedReturnValue();
        if (NWUtilsAnyStringsMatchPatternSet(v9, v3))
        {

          goto LABEL_70;
        }
        if (!v47)
        {
LABEL_80:

          goto LABEL_81;
        }
      }
      else if (!v46)
      {
        goto LABEL_79;
      }
      -[NWNetworkDescription dnsServerAddressOptions](self, "dnsServerAddressOptions");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      matched = NWUtilsAnyStringsMatchPatternSet(v47, v48);

      if (v9)
      {

        if ((matched & 1) == 0)
          goto LABEL_79;
      }
      else
      {

        if (!matched)
          goto LABEL_79;
      }
    }
LABEL_70:
    -[NWNetworkDescription dnsSearchDomainOptions](self, "dnsSearchDomainOptions");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v50)
      goto LABEL_83;
    objc_msgSend(v6, "dnsSearchDomains");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "overrideDNSSearchDomains");
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = (void *)v51;
    if (!v9)
    {
      if (!v51)
        goto LABEL_79;
      goto LABEL_77;
    }
    -[NWNetworkDescription dnsSearchDomainOptions](self, "dnsSearchDomainOptions");
    v3 = (Class *)objc_claimAutoreleasedReturnValue();
    if (NWUtilsAnyStringsMatchPatternSet(v9, v3))
    {

      goto LABEL_83;
    }
    if (v52)
    {
LABEL_77:
      -[NWNetworkDescription dnsSearchDomainOptions](self, "dnsSearchDomainOptions");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = NWUtilsAnyStringsMatchPatternSet(v52, v53);

      if (v9)
      {

        if ((v21 & 1) != 0)
          goto LABEL_83;
LABEL_79:
        LOBYTE(v21) = 0;
LABEL_84:

        goto LABEL_85;
      }

      if (!v21)
        goto LABEL_84;
LABEL_83:
      LOBYTE(v21) = 1;
      goto LABEL_84;
    }
    goto LABEL_80;
  }
LABEL_24:
  LOBYTE(v21) = 0;
LABEL_85:

  return v21;
}

- (void)updateStateWithPath:(id)a3
{
  _BOOL8 v4;
  int64_t v5;
  id v6;

  v4 = -[NWNetworkDescription matchesPath:](self, "matchesPath:", a3);
  v5 = -[NWNetworkDescription state](self, "state");
  -[NWNetworkDescription probeURL](self, "probeURL");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NWNetworkDescription setState:](self, "setState:", +[NWNetworkDescription getNewStateFromPathMatch:oldState:probeExists:](NWNetworkDescription, "getNewStateFromPathMatch:oldState:probeExists:", v4, v5, v6 != 0));

}

- (NWNetworkDescription)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  NWNetworkDescription *v13;
  __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  __CFString *v20;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[NWNetworkDescription interfaceTypeOptions](self, "interfaceTypeOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v8, CFSTR("interfaceType"), v5, 1);

  -[NWNetworkDescription ssidOptions](self, "ssidOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v9, CFSTR("ssid"), v5, 1);

  -[NWNetworkDescription dnsSearchDomainOptions](self, "dnsSearchDomainOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v10, CFSTR("dnsSearchDomain"), v5, 1);

  -[NWNetworkDescription dnsServerAddressOptions](self, "dnsServerAddressOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v11, CFSTR("dnsServerAddress"), v5, 1);

  v12 = -[NWNetworkDescription roamingPreference](self, "roamingPreference");
  v13 = (NWNetworkDescription *)v7;
  v14 = CFSTR("roaming");
  if (v12 == 1)
  {
    v15 = CFSTR("%@Required");
  }
  else
  {
    if (v12 != 2)
      goto LABEL_6;
    v15 = CFSTR("%@Prohibited");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v15, CFSTR("roaming"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWNetworkDescription appendPrettyBOOL:withName:indent:](v13, "appendPrettyBOOL:withName:indent:", 1, v16, v5);

LABEL_6:
  -[NWNetworkDescription probeURL](self, "probeURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "absoluteString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWNetworkDescription appendPrettyObject:withName:indent:showFullContent:](v13, "appendPrettyObject:withName:indent:showFullContent:", v18, CFSTR("probeURL"), v5, 1);

  if (v4)
  {
    v19 = -[NWNetworkDescription state](self, "state");
    if (v19 >= 4)
      v20 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown[%lld]"), v19);
    else
      v20 = off_1E14A2150[v19];
    -[NWNetworkDescription appendPrettyObject:withName:indent:showFullContent:](v13, "appendPrettyObject:withName:indent:showFullContent:", v20, CFSTR("state"), v5, 1);

  }
  return v13;
}

- (id)description
{
  return -[NWNetworkDescription descriptionWithIndent:showFullContent:](self, "descriptionWithIndent:showFullContent:", 0, 0);
}

- (NSString)privateDescription
{
  return (NSString *)-[NWNetworkDescription descriptionWithIndent:showFullContent:](self, "descriptionWithIndent:showFullContent:", 0, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = (void *)objc_opt_new();
  -[NWNetworkDescription interfaceTypeOptions](self, "interfaceTypeOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0C99E60]);
    -[NWNetworkDescription interfaceTypeOptions](self, "interfaceTypeOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithSet:copyItems:", v8, 1);
    objc_msgSend(v4, "setInterfaceTypeOptions:", v9);

  }
  -[NWNetworkDescription ssidOptions](self, "ssidOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x1E0C99E60]);
    -[NWNetworkDescription ssidOptions](self, "ssidOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithSet:copyItems:", v13, 1);
    objc_msgSend(v4, "setSsidOptions:", v14);

  }
  -[NWNetworkDescription dnsSearchDomainOptions](self, "dnsSearchDomainOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    v17 = objc_alloc(MEMORY[0x1E0C99E60]);
    -[NWNetworkDescription dnsSearchDomainOptions](self, "dnsSearchDomainOptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithSet:copyItems:", v18, 1);
    objc_msgSend(v4, "setDnsSearchDomainOptions:", v19);

  }
  -[NWNetworkDescription dnsServerAddressOptions](self, "dnsServerAddressOptions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v21)
  {
    v22 = objc_alloc(MEMORY[0x1E0C99E60]);
    -[NWNetworkDescription dnsServerAddressOptions](self, "dnsServerAddressOptions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithSet:copyItems:", v23, 1);
    objc_msgSend(v4, "setDnsServerAddressOptions:", v24);

  }
  objc_msgSend(v4, "setRoamingPreference:", -[NWNetworkDescription roamingPreference](self, "roamingPreference"));
  -[NWNetworkDescription probeURL](self, "probeURL");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[NWNetworkDescription probeURL](self, "probeURL");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "copy");
    objc_msgSend(v4, "setProbeURL:", v27);

  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  int64_t v18;
  void *v19;
  void *v20;
  char v21;

  v4 = a3;
  if (v4 && objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[NWNetworkDescription interfaceTypeOptions](self, "interfaceTypeOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "interfaceTypeOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = areNSSetsEqual(v6, v7);

    if (!v8)
      goto LABEL_10;
    -[NWNetworkDescription ssidOptions](self, "ssidOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ssidOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = areNSSetsEqual(v9, v10);

    if (!v11)
      goto LABEL_10;
    -[NWNetworkDescription dnsSearchDomainOptions](self, "dnsSearchDomainOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dnsSearchDomainOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = areNSSetsEqual(v12, v13);

    if (!v14)
      goto LABEL_10;
    -[NWNetworkDescription dnsServerAddressOptions](self, "dnsServerAddressOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dnsServerAddressOptions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = areNSSetsEqual(v15, v16);

    if (!v17)
      goto LABEL_10;
    v18 = -[NWNetworkDescription roamingPreference](self, "roamingPreference");
    if (v18 == objc_msgSend(v5, "roamingPreference"))
    {
      -[NWNetworkDescription probeURL](self, "probeURL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "probeURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = NWUtilsAreNSObjectsEqual(v19, v20);

    }
    else
    {
LABEL_10:
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int64_t v11;
  void *v12;
  unint64_t v13;

  -[NWNetworkDescription interfaceTypeOptions](self, "interfaceTypeOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[NWNetworkDescription ssidOptions](self, "ssidOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[NWNetworkDescription dnsSearchDomainOptions](self, "dnsSearchDomainOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[NWNetworkDescription dnsServerAddressOptions](self, "dnsServerAddressOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  v11 = -[NWNetworkDescription roamingPreference](self, "roamingPreference");
  -[NWNetworkDescription probeURL](self, "probeURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v10 ^ v11 ^ objc_msgSend(v12, "hash");

  return v13;
}

- (NSSet)interfaceTypeOptions
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInterfaceTypeOptions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSSet)ssidOptions
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSsidOptions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSSet)dnsSearchDomainOptions
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDnsSearchDomainOptions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSSet)dnsServerAddressOptions
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDnsServerAddressOptions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (int64_t)roamingPreference
{
  return self->_roamingPreference;
}

- (void)setRoamingPreference:(int64_t)a3
{
  self->_roamingPreference = a3;
}

- (NSURL)probeURL
{
  return (NSURL *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProbeURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_probeURL, 0);
  objc_storeStrong((id *)&self->_dnsServerAddressOptions, 0);
  objc_storeStrong((id *)&self->_dnsSearchDomainOptions, 0);
  objc_storeStrong((id *)&self->_ssidOptions, 0);
  objc_storeStrong((id *)&self->_interfaceTypeOptions, 0);
}

+ (int64_t)getNewStateFromPathMatch:(BOOL)a3 oldState:(int64_t)a4 probeExists:(BOOL)a5
{
  int64_t v5;
  int64_t v6;

  v5 = 1;
  if (a5)
    v5 = 2;
  if (a3)
    v6 = a4;
  else
    v6 = 0;
  if (!a3)
    v5 = 0;
  if (a4)
    return v6;
  else
    return v5;
}

@end
