@implementation NRDeviceProxyProviderFlowMatchRule

- (NRDeviceProxyProviderFlowMatchRule)initWithReceivedData:(id)a3
{
  id v4;
  NRDeviceProxyProviderFlowMatchRule *v5;
  NRDeviceProxyProviderFlowMatchRule *v6;
  NRDeviceProxyProviderFlowMatchRule *v7;
  NSObject *v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  _QWORD v20[4];
  NRDeviceProxyProviderFlowMatchRule *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  objc_super v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)NRDeviceProxyProviderFlowMatchRule;
  v5 = -[NRDeviceProxyProviderFlowMatchRule init](&v27, sel_init);
  if (!v5)
  {
    v9 = nrCopyLogObj_617();
    v10 = v9;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v11 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

      if (!v11)
      {
LABEL_11:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v18 = _os_log_pack_fill();
        *(_DWORD *)v18 = 136446210;
        *(_QWORD *)(v18 + 4) = "-[NRDeviceProxyProviderFlowMatchRule initWithReceivedData:]";
        v19 = nrCopyLogObj_617();
        _NRLogAbortWithPack(v19);
      }
    }
    v12 = nrCopyLogObj_617();
    _NRLogWithArgs((uint64_t)v12, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v13, v14, v15, v16, v17, (uint64_t)");

    goto LABEL_11;
  }
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 1;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __59__NRDeviceProxyProviderFlowMatchRule_initWithReceivedData___block_invoke;
  v20[3] = &unk_1EA3F70E0;
  v22 = &v23;
  v6 = v5;
  v21 = v6;
  NRTLVParse(v4, v20);
  if (*((_BYTE *)v24 + 24))
    v7 = v6;
  else
    v7 = 0;

  _Block_object_dispose(&v23, 8);
  return v7;
}

- (id)copySendData
{
  id v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  NSArray *matchTokens;
  NSArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  id v29;
  id v30;
  NSArray *excludedBundleIdentifiers;
  NSArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  id v37;
  id v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  char v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  if (-[NRDeviceProxyProviderFlowMatchRule trafficClass](self, "trafficClass"))
  {
    v4 = -[NRDeviceProxyProviderFlowMatchRule trafficClass](self, "trafficClass");
    if (v4 > 499)
    {
      if (v4 <= 699)
      {
        if (v4 == 500)
        {
          v10 = 5;
          goto LABEL_30;
        }
        if (v4 == 600)
        {
          v10 = 6;
          goto LABEL_30;
        }
      }
      else
      {
        switch(v4)
        {
          case 700:
            v10 = 7;
            goto LABEL_30;
          case 800:
            v10 = 8;
            goto LABEL_30;
          case 900:
            v10 = 9;
            goto LABEL_30;
        }
      }
    }
    else if (v4 <= 199)
    {
      if (!v4)
      {
LABEL_29:
        v10 = 0;
        goto LABEL_30;
      }
      if (v4 == 100)
      {
        v10 = 1;
        goto LABEL_30;
      }
    }
    else
    {
      switch(v4)
      {
        case 200:
          v10 = 2;
          goto LABEL_30;
        case 300:
          v10 = 3;
          goto LABEL_30;
        case 400:
          v10 = 4;
LABEL_30:
          v49 = v10;
          NRTLVAdd(v3, 1, 1u, (uint64_t)&v49);
          goto LABEL_31;
      }
    }
    if (nrCopyLogObj_onceToken_620 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_620, &__block_literal_global_621);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_622, OS_LOG_TYPE_ERROR))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_622, 16, (uint64_t)"%s%.30s:%-4d unexpected SOTraffic class %u", v5, v6, v7, v8, v9, (uint64_t)");
    goto LABEL_29;
  }
LABEL_31:
  if (-[NRDeviceProxyProviderFlowMatchRule transportProtocol](self, "transportProtocol"))
    NRTLVAdd(v3, 2, 1u, (uint64_t)&self->_transportProtocol);
  -[NRDeviceProxyProviderFlowMatchRule domain](self, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[NRDeviceProxyProviderFlowMatchRule domain](self, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dataUsingEncoding:", 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v13;
    v15 = v3;
    NRTLVAdd(v15, 3, (unsigned __int16)objc_msgSend(v14, "length"), objc_msgSend(v14, "bytes"));

  }
  -[NRDeviceProxyProviderFlowMatchRule entitlements](self, "entitlements");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    v18 = (void *)MEMORY[0x1E0CB38B0];
    -[NRDeviceProxyProviderFlowMatchRule entitlements](self, "entitlements");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0;
    objc_msgSend(v18, "dataWithPropertyList:format:options:error:", v19, 200, 0, &v48);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = v20;
    v22 = v3;
    NRTLVAdd(v22, 4, (unsigned __int16)objc_msgSend(v21, "length"), objc_msgSend(v21, "bytes"));

  }
  if (self)
  {
    if (!-[NSArray count](self->_matchTokens, "count"))
      goto LABEL_49;
  }
  else if (!objc_msgSend(0, "count"))
  {
    goto LABEL_49;
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  if (self)
    matchTokens = self->_matchTokens;
  else
    matchTokens = 0;
  v24 = matchTokens;
  v25 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v45 != v27)
          objc_enumerationMutation(v24);
        v29 = *(id *)(*((_QWORD *)&v44 + 1) + 8 * i);
        v30 = v3;
        NRTLVAdd(v30, 5, (unsigned __int16)objc_msgSend(v29, "length"), objc_msgSend(v29, "bytes"));

      }
      v26 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    }
    while (v26);
  }

LABEL_49:
  if (self)
  {
    if (!-[NSArray count](self->_excludedBundleIdentifiers, "count"))
      return v3;
  }
  else if (!objc_msgSend(0, "count"))
  {
    return v3;
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  if (self)
    excludedBundleIdentifiers = self->_excludedBundleIdentifiers;
  else
    excludedBundleIdentifiers = 0;
  v32 = excludedBundleIdentifiers;
  v33 = -[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v41 != v35)
          objc_enumerationMutation(v32);
        objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "dataUsingEncoding:", 4);
        v37 = (id)objc_claimAutoreleasedReturnValue();
        v38 = v3;
        NRTLVAdd(v38, 6, (unsigned __int16)objc_msgSend(v37, "length"), objc_msgSend(v37, "bytes"));

      }
      v34 = -[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    }
    while (v34);
  }

  return v3;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSArray *matchTokens;
  NSArray *excludedBundleIdentifiers;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendString:", CFSTR("NRDPPMatchRule["));
  objc_msgSend(v3, "appendFormat:", CFSTR("tc: %u"), -[NRDeviceProxyProviderFlowMatchRule trafficClass](self, "trafficClass"));
  if (-[NRDeviceProxyProviderFlowMatchRule transportProtocol](self, "transportProtocol"))
    objc_msgSend(v3, "appendFormat:", CFSTR(", proto: %u"), -[NRDeviceProxyProviderFlowMatchRule transportProtocol](self, "transportProtocol"));
  -[NRDeviceProxyProviderFlowMatchRule domain](self, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NRDeviceProxyProviderFlowMatchRule domain](self, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", domain: %@"), v5);

  }
  -[NRDeviceProxyProviderFlowMatchRule entitlements](self, "entitlements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    -[NRDeviceProxyProviderFlowMatchRule entitlements](self, "entitlements");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", entitlements: %@"), v8);

  }
  if (self)
  {
    if (!-[NSArray count](self->_matchTokens, "count"))
      goto LABEL_12;
  }
  else if (!objc_msgSend(0, "count"))
  {
    goto LABEL_12;
  }
  if (self)
    matchTokens = self->_matchTokens;
  else
    matchTokens = 0;
  objc_msgSend(v3, "appendFormat:", CFSTR(", tokens: %@"), matchTokens);
LABEL_12:
  if (self)
  {
    if (!-[NSArray count](self->_excludedBundleIdentifiers, "count"))
      goto LABEL_17;
  }
  else if (!objc_msgSend(0, "count"))
  {
    goto LABEL_17;
  }
  if (self)
    excludedBundleIdentifiers = self->_excludedBundleIdentifiers;
  else
    excludedBundleIdentifiers = 0;
  objc_msgSend(v3, "appendFormat:", CFSTR(", excl-bndl: %@"), excludedBundleIdentifiers);
LABEL_17:
  -[NRDeviceProxyProviderFlowMatchRule matchResultAccountID](self, "matchResultAccountID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    -[NRDeviceProxyProviderFlowMatchRule matchResultAccountID](self, "matchResultAccountID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", res-acc-id: %@"), v13);

  }
  -[NRDeviceProxyProviderFlowMatchRule matchResultBundleID](self, "matchResultBundleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (v15)
  {
    -[NRDeviceProxyProviderFlowMatchRule matchResultBundleID](self, "matchResultBundleID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", res-bndl-id: %@"), v16);

  }
  objc_msgSend(v3, "appendString:", CFSTR("]"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  int v6;
  int v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSArray *v19;
  uint64_t v20;
  NSArray *matchTokens;
  NSArray *v22;
  int v23;
  NSArray *v24;
  uint64_t v25;
  NSArray *excludedBundleIdentifiers;
  NSArray *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[NRDeviceProxyProviderFlowMatchRule trafficClass](self, "trafficClass");
      if (v6 != objc_msgSend(v5, "trafficClass"))
        goto LABEL_35;
      v7 = -[NRDeviceProxyProviderFlowMatchRule transportProtocol](self, "transportProtocol");
      if (v7 != objc_msgSend(v5, "transportProtocol"))
        goto LABEL_35;
      -[NRDeviceProxyProviderFlowMatchRule domain](self, "domain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {

      }
      else
      {
        objc_msgSend(v5, "domain");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
          goto LABEL_10;
      }
      -[NRDeviceProxyProviderFlowMatchRule domain](self, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "domain");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

      if (!v13)
        goto LABEL_35;
LABEL_10:
      -[NRDeviceProxyProviderFlowMatchRule entitlements](self, "entitlements");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {

      }
      else
      {
        objc_msgSend(v5, "entitlements");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
          goto LABEL_14;
      }
      -[NRDeviceProxyProviderFlowMatchRule entitlements](self, "entitlements");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "entitlements");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_35;
LABEL_14:
      if (self)
      {
        v19 = self->_matchTokens;
        if (v19)
        {

          v20 = v5[3];
        }
        else
        {
          v20 = v5[3];
          if (!v20)
          {
LABEL_21:
            v24 = self->_excludedBundleIdentifiers;
            if (v24)
            {

              v25 = v5[4];
            }
            else
            {
              v25 = v5[4];
              if (!v25)
                goto LABEL_26;
            }
            excludedBundleIdentifiers = self->_excludedBundleIdentifiers;
            goto LABEL_25;
          }
        }
        matchTokens = self->_matchTokens;
      }
      else
      {
        v20 = v5[3];
        if (!v20)
          goto LABEL_40;
        matchTokens = 0;
      }
      v22 = matchTokens;
      v23 = -[NSArray isEqual:](v22, "isEqual:", v20);

      if (!v23)
        goto LABEL_35;
      if (self)
        goto LABEL_21;
LABEL_40:
      v25 = v5[4];
      if (!v25)
        goto LABEL_26;
      excludedBundleIdentifiers = 0;
LABEL_25:
      v27 = excludedBundleIdentifiers;
      v28 = -[NSArray isEqual:](v27, "isEqual:", v25);

      if (!v28)
        goto LABEL_35;
LABEL_26:
      -[NRDeviceProxyProviderFlowMatchRule matchResultAccountID](self, "matchResultAccountID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {

      }
      else
      {
        objc_msgSend(v5, "matchResultAccountID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v30)
        {
LABEL_30:
          -[NRDeviceProxyProviderFlowMatchRule matchResultBundleID](self, "matchResultBundleID");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (v34)
          {

          }
          else
          {
            objc_msgSend(v5, "matchResultBundleID");
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v35)
            {
LABEL_34:
              v9 = 1;
LABEL_36:

              goto LABEL_37;
            }
          }
          -[NRDeviceProxyProviderFlowMatchRule matchResultBundleID](self, "matchResultBundleID");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "matchResultBundleID");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v36, "isEqual:", v37);

          if (v38)
            goto LABEL_34;
LABEL_35:
          v9 = 0;
          goto LABEL_36;
        }
      }
      -[NRDeviceProxyProviderFlowMatchRule matchResultAccountID](self, "matchResultAccountID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "matchResultAccountID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v31, "isEqual:", v32);

      if (!v33)
        goto LABEL_35;
      goto LABEL_30;
    }
  }
  v9 = 0;
LABEL_37:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *matchTokens;
  NSArray *v10;
  void *v11;
  NSArray *excludedBundleIdentifiers;
  NSArray *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setTrafficClass:", -[NRDeviceProxyProviderFlowMatchRule trafficClass](self, "trafficClass"));
  objc_msgSend(v4, "setTransportProtocol:", -[NRDeviceProxyProviderFlowMatchRule transportProtocol](self, "transportProtocol"));
  -[NRDeviceProxyProviderFlowMatchRule domain](self, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setDomain:", v6);

  -[NRDeviceProxyProviderFlowMatchRule entitlements](self, "entitlements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setEntitlements:", v8);

  if (self)
    matchTokens = self->_matchTokens;
  else
    matchTokens = 0;
  v10 = matchTokens;
  v11 = (void *)-[NSArray copy](v10, "copy");
  if (v4)
    objc_storeStrong(v4 + 3, v11);

  if (self)
    excludedBundleIdentifiers = self->_excludedBundleIdentifiers;
  else
    excludedBundleIdentifiers = 0;
  v13 = excludedBundleIdentifiers;
  v14 = (void *)-[NSArray copy](v13, "copy");
  if (v4)
    objc_storeStrong(v4 + 4, v14);

  -[NRDeviceProxyProviderFlowMatchRule matchResultAccountID](self, "matchResultAccountID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setMatchResultAccountID:", v16);

  -[NRDeviceProxyProviderFlowMatchRule matchResultBundleID](self, "matchResultBundleID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setMatchResultBundleID:", v18);

  return v4;
}

- (NRDeviceProxyProviderFlowMatchRule)initWithCoder:(id)a3
{
  id v4;
  NRDeviceProxyProviderFlowMatchRule *v5;
  NRDeviceProxyProviderFlowMatchRule *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSArray *matchTokens;
  uint64_t v12;
  NSArray *excludedBundleIdentifiers;
  void *v14;
  void *v15;
  NSObject *v17;
  NSObject *v18;
  _BOOL4 v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  objc_super v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)NRDeviceProxyProviderFlowMatchRule;
  v5 = -[NRDeviceProxyProviderFlowMatchRule init](&v28, sel_init);
  if (!v5)
  {
    v17 = nrCopyLogObj_617();
    v18 = v17;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v19 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);

      if (!v19)
      {
LABEL_8:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v26 = _os_log_pack_fill();
        *(_DWORD *)v26 = 136446210;
        *(_QWORD *)(v26 + 4) = "-[NRDeviceProxyProviderFlowMatchRule initWithCoder:]";
        v27 = nrCopyLogObj_617();
        _NRLogAbortWithPack(v27);
      }
    }
    v20 = nrCopyLogObj_617();
    _NRLogWithArgs((uint64_t)v20, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v21, v22, v23, v24, v25, (uint64_t)");

    goto LABEL_8;
  }
  v6 = v5;
  -[NRDeviceProxyProviderFlowMatchRule setTrafficClass:](v5, "setTrafficClass:", (unsigned __int16)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("trafficClass")));
  -[NRDeviceProxyProviderFlowMatchRule setTransportProtocol:](v6, "setTransportProtocol:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("transportProtocol")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("domain"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRDeviceProxyProviderFlowMatchRule setDomain:](v6, "setDomain:", v7);

  v8 = objc_opt_class();
  objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v8, objc_opt_class(), CFSTR("entitlements"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRDeviceProxyProviderFlowMatchRule setEntitlements:](v6, "setEntitlements:", v9);

  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("matchTokens"));
  v10 = objc_claimAutoreleasedReturnValue();
  matchTokens = v6->_matchTokens;
  v6->_matchTokens = (NSArray *)v10;

  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("excludedBundleIdentifiers"));
  v12 = objc_claimAutoreleasedReturnValue();
  excludedBundleIdentifiers = v6->_excludedBundleIdentifiers;
  v6->_excludedBundleIdentifiers = (NSArray *)v12;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("matchResultAccountID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRDeviceProxyProviderFlowMatchRule setMatchResultAccountID:](v6, "setMatchResultAccountID:", v14);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("matchResultBundleID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRDeviceProxyProviderFlowMatchRule setMatchResultBundleID:](v6, "setMatchResultBundleID:", v15);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  NSArray *excludedBundleIdentifiers;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "encodeInt32:forKey:", -[NRDeviceProxyProviderFlowMatchRule trafficClass](self, "trafficClass"), CFSTR("trafficClass"));
  objc_msgSend(v9, "encodeInt32:forKey:", -[NRDeviceProxyProviderFlowMatchRule transportProtocol](self, "transportProtocol"), CFSTR("transportProtocol"));
  -[NRDeviceProxyProviderFlowMatchRule domain](self, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("domain"));

  -[NRDeviceProxyProviderFlowMatchRule entitlements](self, "entitlements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("entitlements"));

  if (self)
  {
    objc_msgSend(v9, "encodeObject:forKey:", self->_matchTokens, CFSTR("matchTokens"));
    excludedBundleIdentifiers = self->_excludedBundleIdentifiers;
  }
  else
  {
    objc_msgSend(v9, "encodeObject:forKey:", 0, CFSTR("matchTokens"));
    excludedBundleIdentifiers = 0;
  }
  objc_msgSend(v9, "encodeObject:forKey:", excludedBundleIdentifiers, CFSTR("excludedBundleIdentifiers"));
  -[NRDeviceProxyProviderFlowMatchRule matchResultAccountID](self, "matchResultAccountID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("matchResultAccountID"));

  -[NRDeviceProxyProviderFlowMatchRule matchResultBundleID](self, "matchResultBundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("matchResultBundleID"));

}

- (void)addMatchRuleForClientsWithEntitlement:(id)a3 entitlementValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;

  v26 = a3;
  v6 = a4;
  if (v26)
  {
    if (v6)
    {
      v7 = objc_alloc(MEMORY[0x1E0C99E08]);
      -[NRDeviceProxyProviderFlowMatchRule entitlements](self, "entitlements");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)objc_msgSend(v7, "initWithDictionary:", v8);

      objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, v26);
      -[NRDeviceProxyProviderFlowMatchRule setEntitlements:](self, "setEntitlements:", v9);
    }
    else
    {
      v12 = nrCopyLogObj_617();
      v13 = v12;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v20 = os_log_type_enabled(v12, OS_LOG_TYPE_FAULT);

        if (!v20)
          goto LABEL_5;
      }
      v9 = nrCopyLogObj_617();
      _NRLogWithArgs((uint64_t)v9, 17, (uint64_t)"%s called with null entitlementValue", v21, v22, v23, v24, v25, (uint64_t)"-[NRDeviceProxyProviderFlowMatchRule addMatchRuleForClientsWithEntitlement:entitlementValue:]");
    }
  }
  else
  {
    v10 = nrCopyLogObj_617();
    v11 = v10;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v14 = os_log_type_enabled(v10, OS_LOG_TYPE_FAULT);

      if (!v14)
        goto LABEL_5;
    }
    v9 = nrCopyLogObj_617();
    _NRLogWithArgs((uint64_t)v9, 17, (uint64_t)"%s called with null entitlement", v15, v16, v17, v18, v19, (uint64_t)"-[NRDeviceProxyProviderFlowMatchRule addMatchRuleForClientsWithEntitlement:entitlementValue:]");
  }

LABEL_5:
}

- (id)copyMatchTokens
{
  if (self)
    self = (NRDeviceProxyProviderFlowMatchRule *)self->_matchTokens;
  return self;
}

- (void)addMatchToken:(id)a3
{
  uint64_t v4;
  void *v5;
  NSArray *v6;
  BOOL v7;
  id v8;
  NSArray *matchTokens;
  void *v10;
  id v11;

  v11 = a3;
  v4 = objc_msgSend(v11, "length");
  v5 = v11;
  if (v4)
  {
    v6 = self ? self->_matchTokens : 0;
    v7 = -[NSArray containsObject:](v6, "containsObject:", v11);
    v5 = v11;
    if (!v7)
    {
      v8 = objc_alloc(MEMORY[0x1E0C99DE8]);
      if (self)
        matchTokens = self->_matchTokens;
      else
        matchTokens = 0;
      v10 = (void *)objc_msgSend(v8, "initWithArray:", matchTokens);
      objc_msgSend(v10, "addObject:", v11);
      if (self)
        objc_storeStrong((id *)&self->_matchTokens, v10);

      v5 = v11;
    }
  }

}

- (id)copyExcludedBundleIdentifiers
{
  if (self)
    self = (NRDeviceProxyProviderFlowMatchRule *)self->_excludedBundleIdentifiers;
  return self;
}

- (void)excludeBundleIdentifier:(id)a3
{
  uint64_t v4;
  void *v5;
  NSArray *v6;
  BOOL v7;
  id v8;
  NSArray *excludedBundleIdentifiers;
  void *v10;
  id v11;

  v11 = a3;
  v4 = objc_msgSend(v11, "length");
  v5 = v11;
  if (v4)
  {
    v6 = self ? self->_excludedBundleIdentifiers : 0;
    v7 = -[NSArray containsObject:](v6, "containsObject:", v11);
    v5 = v11;
    if (!v7)
    {
      v8 = objc_alloc(MEMORY[0x1E0C99DE8]);
      if (self)
        excludedBundleIdentifiers = self->_excludedBundleIdentifiers;
      else
        excludedBundleIdentifiers = 0;
      v10 = (void *)objc_msgSend(v8, "initWithArray:", excludedBundleIdentifiers);
      objc_msgSend(v10, "addObject:", v11);
      if (self)
        objc_storeStrong((id *)&self->_excludedBundleIdentifiers, v10);

      v5 = v11;
    }
  }

}

- (BOOL)hasMatchRulesExcludingEntitlements
{
  BOOL v3;
  void *v5;

  if (-[NRDeviceProxyProviderFlowMatchRule trafficClass](self, "trafficClass")
    || -[NRDeviceProxyProviderFlowMatchRule transportProtocol](self, "transportProtocol"))
  {
    return 1;
  }
  -[NRDeviceProxyProviderFlowMatchRule domain](self, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v5 != 0;

  return v3;
}

- (BOOL)hasMatchRulesWithTokens
{
  if (self)
    self = (NRDeviceProxyProviderFlowMatchRule *)self->_matchTokens;
  return -[NRDeviceProxyProviderFlowMatchRule count](self, "count") != 0;
}

- (unsigned)transportProtocol
{
  return self->_transportProtocol;
}

- (void)setTransportProtocol:(unsigned __int8)a3
{
  self->_transportProtocol = a3;
}

- (unsigned)trafficClass
{
  return self->_trafficClass;
}

- (void)setTrafficClass:(unsigned __int16)a3
{
  self->_trafficClass = a3;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (NSDictionary)entitlements
{
  return self->_entitlements;
}

- (void)setEntitlements:(id)a3
{
  objc_storeStrong((id *)&self->_entitlements, a3);
}

- (NSString)matchResultAccountID
{
  return self->_matchResultAccountID;
}

- (void)setMatchResultAccountID:(id)a3
{
  objc_storeStrong((id *)&self->_matchResultAccountID, a3);
}

- (NSString)matchResultBundleID
{
  return self->_matchResultBundleID;
}

- (void)setMatchResultBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_matchResultBundleID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchResultBundleID, 0);
  objc_storeStrong((id *)&self->_matchResultAccountID, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_excludedBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_matchTokens, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

uint64_t __59__NRDeviceProxyProviderFlowMatchRule_initWithReceivedData___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v24;

  v9 = *(unsigned __int16 *)(a2 + 1);
  v10 = __rev16(v9);
  switch(*(_BYTE *)a2)
  {
    case 1:
      if (v9 != 256)
      {
        if (nrCopyLogObj_onceToken_620 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_620, &__block_literal_global_621);
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_622, OS_LOG_TYPE_ERROR))
        {
          v22 = nrCopyLogObj_sNRLogObj_622;
          goto LABEL_35;
        }
        goto LABEL_36;
      }
      v11 = *(unsigned __int8 *)(a2 + 3);
      if (v11 >= 0xA)
      {
        if (nrCopyLogObj_onceToken_620 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_620, &__block_literal_global_621);
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_622, OS_LOG_TYPE_ERROR))
          _NRLogWithArgs(nrCopyLogObj_sNRLogObj_622, 16, (uint64_t)"%s%.30s:%-4d unexpected NRTraffic class %u", a4, a5, a6, a7, a8, (uint64_t)");
        v12 = 0;
      }
      else
      {
        v12 = 100 * v11;
      }
      objc_msgSend(*(id *)(a1 + 32), "setTrafficClass:", v12);
      return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    case 2:
      if (v9 == 256)
      {
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = *(_BYTE *)(a2 + 3);
      }
      else
      {
        if (nrCopyLogObj_onceToken_620 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_620, &__block_literal_global_621);
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_622, OS_LOG_TYPE_ERROR))
        {
          v22 = nrCopyLogObj_sNRLogObj_622;
LABEL_35:
          _NRLogWithArgs(v22, 16, (uint64_t)"%s%.30s:%-4d invalid length", a4, a5, a6, a7, a8, (uint64_t)");
        }
LABEL_36:
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      }
      return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    case 3:
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a2 + 3, v10, 4);
      objc_msgSend(*(id *)(a1 + 32), "setDomain:", v14);
      break;
    case 4:
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a2 + 3, v10);
      v24 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v14, 0, 0, &v24);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v24;
      objc_msgSend(*(id *)(a1 + 32), "setEntitlements:", v15);

      if (v16)
      {
        if (nrCopyLogObj_onceToken_620 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_620, &__block_literal_global_621);
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_622, OS_LOG_TYPE_ERROR))
          _NRLogWithArgs(nrCopyLogObj_sNRLogObj_622, 16, (uint64_t)"%s%.30s:%-4d deserialization error %@", v17, v18, v19, v20, v21, (uint64_t)");
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      }

      break;
    case 5:
      if (!*(_WORD *)(a2 + 1))
        return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a2 + 3, v10);
      objc_msgSend(*(id *)(a1 + 32), "addMatchToken:", v14);
      break;
    default:
      if (*(_BYTE *)a2 != 6 || v9 == 0)
        return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a2 + 3, v10, 4);
      if (v14)
        objc_msgSend(*(id *)(a1 + 32), "excludeBundleIdentifier:", v14);
      break;
  }

  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)copyMatchRulesForCellularSlicing
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NRDeviceProxyProviderFlowMatchRule *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v19 = objc_msgSend(&unk_1EA4011A0, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v19)
  {
    v18 = *(_QWORD *)v27;
    do
    {
      v2 = 0;
      do
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(&unk_1EA4011A0);
        v3 = *(id *)(*((_QWORD *)&v26 + 1) + 8 * v2);
        objc_opt_self();
        objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("-"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = v2;
        if ((unint64_t)objc_msgSend(v4, "count") < 2)
        {
          v5 = 0;
        }
        else
        {
          objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
        }

        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        v6 = objc_msgSend(&unk_1EA401230, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v23;
          do
          {
            v9 = 0;
            do
            {
              if (*(_QWORD *)v23 != v8)
                objc_enumerationMutation(&unk_1EA401230);
              v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v9);
              v13 = objc_alloc_init(NRDeviceProxyProviderFlowMatchRule);
              objc_msgSend(&unk_1EA401258, "objectForKeyedSubscript:", v12);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[NRDeviceProxyProviderFlowMatchRule setTrafficClass:](v13, "setTrafficClass:", (unsigned __int16)objc_msgSend(v14, "unsignedIntValue"));
              v15 = v12;
              objc_opt_self();
              objc_msgSend(v15, "componentsSeparatedByString:", CFSTR("-"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if ((unint64_t)objc_msgSend(v16, "count") >= 2)
              {
                objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
                v10 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v10 = 0;
              }

              v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.%@.%@"), CFSTR("com.apple.networkrelay.tethering"), v10, v5);
              -[NRDeviceProxyProviderFlowMatchRule setMatchResultAccountID:](v13, "setMatchResultAccountID:", v11);

              -[NRDeviceProxyProviderFlowMatchRule setMatchResultBundleID:](v13, "setMatchResultBundleID:", CFSTR("com.apple.datausage.personalhotspot"));
              -[NRDeviceProxyProviderFlowMatchRule addMatchRuleForClientsWithEntitlement:entitlementValue:](v13, "addMatchRuleForClientsWithEntitlement:entitlementValue:", CFSTR("com.apple.developer.networking.slicing.appcategory"), v3);
              -[NRDeviceProxyProviderFlowMatchRule addMatchRuleForClientsWithEntitlement:entitlementValue:](v13, "addMatchRuleForClientsWithEntitlement:entitlementValue:", CFSTR("com.apple.developer.networking.slicing.trafficcategory"), v15);
              objc_msgSend(v21, "addObject:", v13);

              ++v9;
            }
            while (v7 != v9);
            v7 = objc_msgSend(&unk_1EA401230, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v7);
        }

        v2 = v20 + 1;
      }
      while (v20 + 1 != v19);
      v19 = objc_msgSend(&unk_1EA4011A0, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v19);
  }
  return v21;
}

@end
