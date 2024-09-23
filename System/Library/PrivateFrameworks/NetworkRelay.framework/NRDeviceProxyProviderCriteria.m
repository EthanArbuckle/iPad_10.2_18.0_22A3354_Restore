@implementation NRDeviceProxyProviderCriteria

- (NRDeviceProxyProviderCriteria)initWithReceivedData:(id)a3
{
  id v4;
  NRDeviceProxyProviderCriteria *v5;
  NRDeviceProxyProviderCriteria *v6;
  NRDeviceProxyProviderCriteria *v7;
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
  NRDeviceProxyProviderCriteria *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  objc_super v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)NRDeviceProxyProviderCriteria;
  v5 = -[NRDeviceProxyProviderCriteria init](&v29, sel_init);
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
LABEL_13:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v18 = _os_log_pack_fill();
        *(_DWORD *)v18 = 136446210;
        *(_QWORD *)(v18 + 4) = "-[NRDeviceProxyProviderCriteria initWithReceivedData:]";
        v19 = nrCopyLogObj_617();
        _NRLogAbortWithPack(v19);
      }
    }
    v12 = nrCopyLogObj_617();
    _NRLogWithArgs((uint64_t)v12, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v13, v14, v15, v16, v17, (uint64_t)");

    goto LABEL_13;
  }
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __54__NRDeviceProxyProviderCriteria_initWithReceivedData___block_invoke;
  v20[3] = &unk_1EA3F70E0;
  v22 = &v23;
  v6 = v5;
  v21 = v6;
  NRTLVParse(v4, v20);
  if (objc_msgSend((id)v24[5], "count"))
    -[NRDeviceProxyProviderCriteria setProxyUsageRules:](v6, "setProxyUsageRules:", v24[5]);
  if (-[NRDeviceProxyProviderCriteria hasValidProxyCriteria](v6, "hasValidProxyCriteria"))
    v7 = v6;
  else
    v7 = 0;

  _Block_object_dispose(&v23, 8);
  return v7;
}

- (id)copySendData
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  unint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  -[NRDeviceProxyProviderCriteria proxyUsageRules](self, "proxyUsageRules");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[NRDeviceProxyProviderCriteria proxyUsageRules](self, "proxyUsageRules");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = (id)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "copySendData");
          v12 = v3;
          NRTLVAdd(v12, 50, (unsigned __int16)objc_msgSend(v11, "length"), objc_msgSend(v11, "bytes"));

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
  if (-[NRDeviceProxyProviderCriteria flags](self, "flags"))
  {
    v14 = bswap64(-[NRDeviceProxyProviderCriteria flags](self, "flags"));
    NRTLVAdd(v3, 51, 8u, (uint64_t)&v14);
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[NRDeviceProxyProviderCriteria flags](self, "flags");
      if (v6 == objc_msgSend(v5, "flags"))
      {
        -[NRDeviceProxyProviderCriteria proxyUsageRules](self, "proxyUsageRules");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {

        }
        else
        {
          objc_msgSend(v5, "proxyUsageRules");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v9)
          {
LABEL_9:
            v8 = 1;
LABEL_11:

            goto LABEL_12;
          }
        }
        -[NRDeviceProxyProviderCriteria proxyUsageRules](self, "proxyUsageRules");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "proxyUsageRules");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (v12)
          goto LABEL_9;
      }
      v8 = 0;
      goto LABEL_11;
    }
  }
  v8 = 0;
LABEL_12:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setFlags:", -[NRDeviceProxyProviderCriteria flags](self, "flags"));
  -[NRDeviceProxyProviderCriteria proxyUsageRules](self, "proxyUsageRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setProxyUsageRules:", v6);

  return v4;
}

- (NRDeviceProxyProviderCriteria)initWithCoder:(id)a3
{
  id v4;
  NRDeviceProxyProviderCriteria *v5;
  NRDeviceProxyProviderCriteria *v6;
  void *v7;
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
  objc_super v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NRDeviceProxyProviderCriteria;
  v5 = -[NRDeviceProxyProviderCriteria init](&v20, sel_init);
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
LABEL_8:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v18 = _os_log_pack_fill();
        *(_DWORD *)v18 = 136446210;
        *(_QWORD *)(v18 + 4) = "-[NRDeviceProxyProviderCriteria initWithCoder:]";
        v19 = nrCopyLogObj_617();
        _NRLogAbortWithPack(v19);
      }
    }
    v12 = nrCopyLogObj_617();
    _NRLogWithArgs((uint64_t)v12, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v13, v14, v15, v16, v17, (uint64_t)");

    goto LABEL_8;
  }
  v6 = v5;
  -[NRDeviceProxyProviderCriteria setFlags:](v5, "setFlags:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("flags")));
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("proxyUsageRules"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRDeviceProxyProviderCriteria setProxyUsageRules:](v6, "setProxyUsageRules:", v7);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[NRDeviceProxyProviderCriteria flags](self, "flags"), CFSTR("flags"));
  -[NRDeviceProxyProviderCriteria proxyUsageRules](self, "proxyUsageRules");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("proxyUsageRules"));

}

- (void)setForwardNonMatchingTraffic:(BOOL)a3
{
  self->_flags = self->_flags & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (BOOL)forwardNonMatchingTraffic
{
  return self->_flags & 1;
}

- (BOOL)excludeLegacyClients
{
  return (LOBYTE(self->_flags) >> 1) & 1;
}

- (BOOL)excludeNonMatchingLegacyClients
{
  return (LOBYTE(self->_flags) >> 4) & 1;
}

- (BOOL)excludeVPNClients
{
  return (LOBYTE(self->_flags) >> 2) & 1;
}

- (BOOL)excludeClientApplication
{
  return (LOBYTE(self->_flags) >> 3) & 1;
}

- (BOOL)allowsListenerClients
{
  return (LOBYTE(self->_flags) >> 5) & 1;
}

- (BOOL)allowsDemuxForwarding
{
  return (LOBYTE(self->_flags) >> 6) & 1;
}

- (BOOL)hasValidProxyCriteria
{
  void *v3;
  uint64_t v4;

  -[NRDeviceProxyProviderCriteria proxyUsageRules](self, "proxyUsageRules");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4 || -[NRDeviceProxyProviderCriteria forwardNonMatchingTraffic](self, "forwardNonMatchingTraffic");
}

- (BOOL)hasProxyCriteriaAssigningTokens
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NRDeviceProxyProviderCriteria proxyUsageRules](self, "proxyUsageRules", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "hasMatchRulesWithTokens") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("["));
  -[NRDeviceProxyProviderCriteria proxyUsageRules](self, "proxyUsageRules");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[NRDeviceProxyProviderCriteria proxyUsageRules](self, "proxyUsageRules");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("%@ "), v6);

  }
  if (-[NRDeviceProxyProviderCriteria forwardNonMatchingTraffic](self, "forwardNonMatchingTraffic"))
    objc_msgSend(v3, "appendString:", CFSTR("fwd "));
  if (-[NRDeviceProxyProviderCriteria excludeLegacyClients](self, "excludeLegacyClients"))
    objc_msgSend(v3, "appendString:", CFSTR("excl-l "));
  if (-[NRDeviceProxyProviderCriteria excludeNonMatchingLegacyClients](self, "excludeNonMatchingLegacyClients"))
    objc_msgSend(v3, "appendString:", CFSTR("excl-nm-l "));
  if (-[NRDeviceProxyProviderCriteria excludeVPNClients](self, "excludeVPNClients"))
    objc_msgSend(v3, "appendString:", CFSTR("excl-v "));
  if (-[NRDeviceProxyProviderCriteria excludeClientApplication](self, "excludeClientApplication"))
    objc_msgSend(v3, "appendString:", CFSTR("excl-c "));
  objc_msgSend(v3, "appendString:", CFSTR("]"));
  return v3;
}

- (NSArray)proxyUsageRules
{
  return self->_proxyUsageRules;
}

- (void)setProxyUsageRules:(id)a3
{
  objc_storeStrong((id *)&self->_proxyUsageRules, a3);
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyUsageRules, 0);
}

uint64_t __54__NRDeviceProxyProviderCriteria_initWithReceivedData___block_invoke(uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v9;
  uint64_t v10;
  int v11;
  void *v12;
  NRDeviceProxyProviderFlowMatchRule *v13;

  v9 = *(unsigned __int16 *)(a2 + 1);
  v10 = __rev16(v9);
  v11 = *a2;
  if (v11 == 51)
  {
    if (v9 == 2048)
    {
      objc_msgSend(*(id *)(a1 + 32), "setFlags:", bswap64(*(_QWORD *)(a2 + 3)));
    }
    else
    {
      if (nrCopyLogObj_onceToken_620 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_620, &__block_literal_global_621);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_622, OS_LOG_TYPE_ERROR))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_622, 16, (uint64_t)"%s%.30s:%-4d invalid size for flags %u != %zu", a4, a5, a6, a7, a8, (uint64_t)");
    }
  }
  else if (v11 == 50)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a2 + 3, v10);
    v13 = -[NRDeviceProxyProviderFlowMatchRule initWithReceivedData:]([NRDeviceProxyProviderFlowMatchRule alloc], "initWithReceivedData:", v12);
    if (v13)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v13);

  }
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)copyCriteriaForCellularSlicing
{
  NRDeviceProxyProviderCriteria *v2;
  id v3;

  v2 = objc_alloc_init(NRDeviceProxyProviderCriteria);
  v3 = +[NRDeviceProxyProviderFlowMatchRule copyMatchRulesForCellularSlicing](NRDeviceProxyProviderFlowMatchRule, "copyMatchRulesForCellularSlicing");
  -[NRDeviceProxyProviderCriteria setProxyUsageRules:](v2, "setProxyUsageRules:", v3);

  -[NRDeviceProxyProviderCriteria setFlags:](v2, "setFlags:", -[NRDeviceProxyProviderCriteria flags](v2, "flags") | 0x10);
  -[NRDeviceProxyProviderCriteria setFlags:](v2, "setFlags:", -[NRDeviceProxyProviderCriteria flags](v2, "flags") | 4);
  -[NRDeviceProxyProviderCriteria setFlags:](v2, "setFlags:", -[NRDeviceProxyProviderCriteria flags](v2, "flags") | 0x20);
  -[NRDeviceProxyProviderCriteria setFlags:](v2, "setFlags:", -[NRDeviceProxyProviderCriteria flags](v2, "flags") | 0x40);
  -[NRDeviceProxyProviderCriteria setFlags:](v2, "setFlags:", -[NRDeviceProxyProviderCriteria flags](v2, "flags") | 8);
  return v2;
}

@end
