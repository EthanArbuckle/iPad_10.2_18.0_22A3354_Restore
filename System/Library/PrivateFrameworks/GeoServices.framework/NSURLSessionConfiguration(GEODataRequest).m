@implementation NSURLSessionConfiguration(GEODataRequest)

- (uint64_t)geo_isCompatibleWithRequest:()GEODataRequest
{
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v4 = a3;
  objc_msgSend(v4, "auditToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "geo_hasApplicationAttribution:", v5);

  if ((_DWORD)v6)
  {
    v7 = objc_msgSend(a1, "_allowsTLSSessionTickets");
    if (v7 != objc_msgSend(v4, "allowTLSSessionTicketUse"))
      goto LABEL_24;
    v8 = objc_msgSend(a1, "_allowsExpensiveAccess");
    if (v8 == objc_msgSend(v4, "requireInexpensiveNetwork"))
      goto LABEL_24;
    v9 = objc_msgSend(a1, "allowsCellularAccess");
    if (v9 == objc_msgSend(v4, "disallowCellularNetwork"))
      goto LABEL_24;
    v10 = objc_msgSend(a1, "_requiresPowerPluggedIn");
    if (v10 != objc_msgSend(v4, "requirePluggedIn"))
      goto LABEL_24;
    objc_msgSend(v4, "backgroundSessionIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((((v11 != 0) ^ objc_msgSend(a1, "isDiscretionary")) & 1) != 0)
      goto LABEL_24;
    if (v11)
    {
      objc_msgSend(v4, "backgroundSessionIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToString:", v13);

      if (!v14)
        goto LABEL_24;
    }
    objc_msgSend(a1, "connectionProxyDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v15 != 0) == objc_msgSend(v4, "needsProxy"))
    {
      if (v15)
      {
        objc_msgSend(a1, "connectionProxyDictionary");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0C93238]);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1, "connectionProxyDictionary");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0C93240]);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "URL");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "scheme");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("https"));

        v6 = 0;
        if (!v24 || !v19 || !v21)
          goto LABEL_25;
      }
    }
    else if (v15
           || (GEOGetURLWithSource(39, 0),
               v16 = (void *)objc_claimAutoreleasedReturnValue(),
               v17 = GEOAuthProxyURLIsValid(v16),
               v16,
               v17))
    {
LABEL_24:
      v6 = 0;
      goto LABEL_25;
    }
    v25 = objc_msgSend(a1, "multipathServiceType");
    v26 = objc_msgSend(v4, "multipathServiceType");
    if ((unint64_t)(v26 - 1) >= 3)
      v27 = 0;
    else
      v27 = v26;
    if (v25 != v27)
      goto LABEL_24;
    if (objc_msgSend(v4, "multipathServiceType"))
    {
      v28 = objc_msgSend(a1, "_multipathAlternatePort");
      if (v28 != objc_msgSend(v4, "multipathAlternatePort"))
        goto LABEL_24;
    }
    v6 = 1;
  }
LABEL_25:

  return v6;
}

- (void)geo_configureWithRequest:()GEODataRequest
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "auditToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "geo_setApplicationAttribution:", v4);

  if (objc_msgSend(v9, "needsProxy"))
  {
    +[GEOMapsAuthServiceHelper sharedAuthHelper](GEOMapsAuthServiceHelper, "sharedAuthHelper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setConnectionProxyDictionary:url:proxyURL:", a1, v6, 0);

  }
  objc_msgSend(a1, "set_allowsTLSSessionTickets:", objc_msgSend(v9, "allowTLSSessionTicketUse"));
  objc_msgSend(a1, "set_allowsExpensiveAccess:", objc_msgSend(v9, "requireInexpensiveNetwork") ^ 1);
  objc_msgSend(a1, "set_requiresPowerPluggedIn:", objc_msgSend(v9, "requirePluggedIn"));
  if (objc_msgSend(v9, "disallowCellularNetwork"))
    objc_msgSend(a1, "setAllowsCellularAccess:", 0);
  v7 = objc_msgSend(v9, "multipathServiceType");
  if ((unint64_t)(v7 - 1) >= 3)
    v8 = 0;
  else
    v8 = v7;
  objc_msgSend(a1, "setMultipathServiceType:", v8);
  if (objc_msgSend(v9, "multipathServiceType") && objc_msgSend(v9, "multipathAlternatePort"))
    objc_msgSend(a1, "set_multipathAlternatePort:", objc_msgSend(v9, "multipathAlternatePort"));

}

@end
