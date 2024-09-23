@implementation NREndpoint

- (NREndpoint)initWithDeviceIdentifier:(id)a3 portString:(id)a4 dataProtectionClass:(unsigned __int8)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  NREndpoint *v11;
  NREndpoint *v12;
  void *v13;
  void *v14;
  NSObject *v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  NSObject *v26;
  _BOOL4 v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  objc_super v55;
  uint64_t v56;

  v5 = a5;
  v56 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    v16 = nrCopyLogObj();
    v17 = v16;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v18 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

      if (!v18)
        goto LABEL_24;
    }
    v28 = nrCopyLogObj();
    _NRLogWithArgs((uint64_t)v28, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL deviceIdentifier", v29, v30, v31, v32, v33, (uint64_t)");

LABEL_24:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    v46 = _os_log_pack_fill();
    *(_DWORD *)v46 = 136446466;
    *(_QWORD *)(v46 + 4) = "-[NREndpoint initWithDeviceIdentifier:portString:dataProtectionClass:]";
    *(_WORD *)(v46 + 12) = 2080;
    *(_QWORD *)(v46 + 14) = "-[NREndpoint initWithDeviceIdentifier:portString:dataProtectionClass:]";
    goto LABEL_28;
  }
  v10 = v9;
  if (!v9)
  {
    v19 = nrCopyLogObj();
    v20 = v19;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v21 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

      if (!v21)
        goto LABEL_24;
    }
    v34 = nrCopyLogObj();
    _NRLogWithArgs((uint64_t)v34, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL portString", v35, v36, v37, v38, v39, (uint64_t)");

    goto LABEL_24;
  }
  if ((v5 - 5) <= 0xFDu)
  {
    v22 = nrCopyLogObj();
    v23 = v22;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v24 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);

      if (!v24)
        goto LABEL_24;
    }
    v40 = nrCopyLogObj();
    _NRLogWithArgs((uint64_t)v40, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL dataProtectionClass == NRDataProtectionClassC || dataProtectionClass == NRDataProtectionClassD", v41, v42, v43, v44, v45, (uint64_t)");

    goto LABEL_24;
  }
  v55.receiver = self;
  v55.super_class = (Class)NREndpoint;
  v11 = -[NREndpoint init](&v55, sel_init);
  if (!v11)
  {
    v25 = nrCopyLogObj();
    v26 = v25;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v27 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);

      if (!v27)
        goto LABEL_27;
    }
    v47 = nrCopyLogObj();
    _NRLogWithArgs((uint64_t)v47, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v48, v49, v50, v51, v52, (uint64_t)");

LABEL_27:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    v53 = _os_log_pack_fill();
    *(_DWORD *)v53 = 136446210;
    *(_QWORD *)(v53 + 4) = "-[NREndpoint initWithDeviceIdentifier:portString:dataProtectionClass:]";
LABEL_28:
    v54 = nrCopyLogObj();
    _NRLogAbortWithPack(v54);
  }
  v12 = v11;
  v13 = (void *)objc_msgSend(v8, "copy");
  -[NREndpoint setDeviceIdentifier:](v12, "setDeviceIdentifier:", v13);

  v14 = (void *)objc_msgSend(v10, "copy");
  -[NREndpoint setPortString:](v12, "setPortString:", v14);

  -[NREndpoint setDataProtectionClass:](v12, "setDataProtectionClass:", v5);
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[NREndpoint deviceIdentifier](self, "deviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NREndpoint portString](self, "portString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithDeviceIdentifier:portString:dataProtectionClass:", v5, v6, -[NREndpoint dataProtectionClass](self, "dataProtectionClass"));

  return v7;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  __CFString *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NREndpoint deviceIdentifier](self, "deviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NREndpoint portString](self, "portString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NREndpoint dataProtectionClass](self, "dataProtectionClass");
  if (v6 < 5 && ((0x1Bu >> v6) & 1) != 0)
    v7 = off_1EA3F6C10[v6];
  else
    v7 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown[%lld]"), v6);
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("NREndpoint[%@ port:%@ %@]"), v4, v5, v7);

  return v8;
}

- (id)copyEndpoint
{
  id v2;
  void *v3;

  v2 = -[NREndpoint copyNWEndpoint](self, "copyNWEndpoint");
  v3 = (void *)objc_msgSend(v2, "copyCEndpoint");

  return v3;
}

- (id)copyNWEndpoint
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  id v25;
  void *v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  __CFString *v34;
  uint64_t v35;
  void *v36;
  _BYTE state64[28];
  int check;

  -[NREndpoint deviceIdentifier](self, "deviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nrDeviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NREndpoint dataProtectionClass](self, "dataProtectionClass");
  -[NREndpoint portString](self, "portString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  v8 = v6;
  v9 = v7;
  v10 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v9, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("%@/%llu"), v11, v5);

  os_unfair_lock_lock((os_unfair_lock_t)&sAddressCacheLock);
  v13 = NREndpointCacheValidLocked_sAddressCacheChangeToken;
  if (NREndpointCacheValidLocked_sAddressCacheChangeToken != -1)
    goto LABEL_2;
  if (notify_register_check("com.apple.networkrelay.endpointcache", &NREndpointCacheValidLocked_sAddressCacheChangeToken))
  {
    NREndpointCacheValidLocked_sAddressCacheChangeToken = -1;
    if (nrCopyLogObj_onceToken != -1)
      dispatch_once(&nrCopyLogObj_onceToken, &__block_literal_global);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj, OS_LOG_TYPE_FAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj, 17, (uint64_t)"notify_register_check(%s) failed: %u", v15, v16, v17, v18, v19, (uint64_t)"com.apple.networkrelay.endpointcache");
    goto LABEL_33;
  }
  v13 = NREndpointCacheValidLocked_sAddressCacheChangeToken;
  if (NREndpointCacheValidLocked_sAddressCacheChangeToken != -1)
  {
LABEL_2:
    v14 = NREndpointCacheValidLocked_sAddressCacheGeneration;
    *(_QWORD *)state64 = NREndpointCacheValidLocked_sAddressCacheGeneration;
    check = 0;
    if (notify_check(v13, &check))
    {
      if (nrCopyLogObj_onceToken != -1)
        dispatch_once(&nrCopyLogObj_onceToken, &__block_literal_global);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj, OS_LOG_TYPE_FAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj, 17, (uint64_t)"notify_check(%s, %d) failed: %u", v15, v16, v17, v18, v19, (uint64_t)"com.apple.networkrelay.endpointcache");
      goto LABEL_8;
    }
    if (check)
    {
      if (notify_get_state(NREndpointCacheValidLocked_sAddressCacheChangeToken, (uint64_t *)state64))
      {
        if (nrCopyLogObj_onceToken != -1)
          dispatch_once(&nrCopyLogObj_onceToken, &__block_literal_global);
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj, OS_LOG_TYPE_FAULT))
          _NRLogWithArgs(nrCopyLogObj_sNRLogObj, 17, (uint64_t)"notify_get_state(%s, %d) failed: %u", v15, v16, v17, v18, v19, (uint64_t)"com.apple.networkrelay.endpointcache");
LABEL_8:
        notify_cancel(NREndpointCacheValidLocked_sAddressCacheChangeToken);
        NREndpointCacheValidLocked_sAddressCacheChangeToken = -1;
        *(_QWORD *)state64 = 0;
        if (!NREndpointCacheValidLocked_sAddressCacheGeneration)
          goto LABEL_33;
LABEL_9:
        if (nrCopyLogObj_onceToken != -1)
          dispatch_once(&nrCopyLogObj_onceToken, &__block_literal_global);
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj, OS_LOG_TYPE_INFO))
          _NRLogWithArgs(nrCopyLogObj_sNRLogObj, 1, (uint64_t)"%s%.30s:%-4d NREndpoint cache generation changed: %llu -> %llu", v15, v16, v17, v18, v19, (uint64_t)");
        NREndpointCacheValidLocked_sAddressCacheGeneration = *(_QWORD *)state64;
        goto LABEL_33;
      }
      v14 = *(_QWORD *)state64;
    }
    if (NREndpointCacheValidLocked_sAddressCacheGeneration == v14)
    {
      if (v14)
        goto LABEL_39;
      goto LABEL_33;
    }
    goto LABEL_9;
  }
LABEL_33:
  if (nrCopyLogObj_onceToken != -1)
    dispatch_once(&nrCopyLogObj_onceToken, &__block_literal_global);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj, OS_LOG_TYPE_INFO))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj, 1, (uint64_t)"%s%.30s:%-4d Clearing NREndpoint cache", v15, v16, v17, v18, v19, (uint64_t)");
  v20 = (void *)sAddressDataCache;
  sAddressDataCache = 0;

LABEL_39:
  if (!sAddressDataCache
    || (objc_msgSend((id)sAddressDataCache, "objectForKeyedSubscript:", v12),
        (v21 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v22 = nrXPCCopyResolvedEndpoint(v9, v5);
    v21 = v22;
    if (v22)
    {
      if (objc_msgSend(v22, "length") == 16)
      {
        *(_QWORD *)state64 = 0;
        *(_QWORD *)&state64[8] = 0;
        objc_msgSend(v21, "getBytes:length:", state64, 16);
        v23 = state64[9] != 12 && v5 == 3;
        if (!v23 && *(_WORD *)&state64[10] && *(_WORD *)&state64[12] && *(_WORD *)&state64[14])
        {
          v24 = (void *)sAddressDataCache;
          if (!sAddressDataCache)
          {
            v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v26 = (void *)sAddressDataCache;
            sAddressDataCache = (uint64_t)v25;

            v24 = (void *)sAddressDataCache;
          }
          if ((unint64_t)objc_msgSend(v24, "count") <= 0x1F)
            objc_msgSend((id)sAddressDataCache, "setObject:forKeyedSubscript:", v21, v12);
        }
      }
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sAddressCacheLock);

  if (objc_msgSend(v21, "length") == 16)
  {
    if (v8)
      v27 = bswap32(objc_msgSend(v8, "intValue")) >> 16;
    else
      LOWORD(v27) = 0;
    memset(&state64[4], 0, 24);
    *(_WORD *)state64 = 7708;
    *(_WORD *)&state64[2] = v27;
    objc_msgSend(v21, "getBytes:length:", &state64[8], 16);
    objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithAddress:", state64);
    v35 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (nrCopyLogObj_onceToken != -1)
      dispatch_once(&nrCopyLogObj_onceToken, &__block_literal_global);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj, OS_LOG_TYPE_ERROR))
    {
      v33 = (id)nrCopyLogObj_sNRLogObj;
      if (v5 < 5 && ((0x1Bu >> v5) & 1) != 0)
        v34 = off_1EA3F6C10[v5];
      else
        v34 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown[%lld]"), v5);
      _NRLogWithArgs((uint64_t)v33, 16, (uint64_t)"%s%.30s:%-4d Failed to resolve endpoint for %@ %@", v28, v29, v30, v31, v32, (uint64_t)");

    }
    objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithHostname:port:", CFSTR("::"), v8);
    v35 = objc_claimAutoreleasedReturnValue();
  }
  v36 = (void *)v35;

  return v36;
}

- (NRDeviceIdentifier)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_deviceIdentifier, a3);
}

- (NSString)portString
{
  return self->_portString;
}

- (void)setPortString:(id)a3
{
  objc_storeStrong((id *)&self->_portString, a3);
}

- (unsigned)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (void)setDataProtectionClass:(unsigned __int8)a3
{
  self->_dataProtectionClass = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portString, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end
