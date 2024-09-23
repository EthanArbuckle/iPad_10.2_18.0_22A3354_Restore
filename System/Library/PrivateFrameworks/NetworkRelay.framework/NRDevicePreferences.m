@implementation NRDevicePreferences

- (NRDevicePreferences)initWithDeviceIdentifier:(id)a3
{
  id v5;
  void *v6;
  NRDevicePreferences *v7;
  NRDevicePreferences *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  NSObject *v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  NSObject *v20;
  _BOOL4 v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  objc_super v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    v16 = nrCopyLogObj_115();
    v17 = v16;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v18 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

      if (!v18)
        goto LABEL_19;
    }
    v22 = nrCopyLogObj_115();
    _NRLogWithArgs((uint64_t)v22, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL deviceIdentifier", v23, v24, v25, v26, v27, (uint64_t)");

LABEL_19:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    v28 = _os_log_pack_fill();
    *(_DWORD *)v28 = 136446466;
    *(_QWORD *)(v28 + 4) = "-[NRDevicePreferences initWithDeviceIdentifier:]";
    *(_WORD *)(v28 + 12) = 2080;
    *(_QWORD *)(v28 + 14) = "-[NRDevicePreferences initWithDeviceIdentifier:]";
    goto LABEL_23;
  }
  v6 = v5;
  v37.receiver = self;
  v37.super_class = (Class)NRDevicePreferences;
  v7 = -[NRDevicePreferences init](&v37, sel_init);
  if (!v7)
  {
    v19 = nrCopyLogObj_115();
    v20 = v19;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v21 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

      if (!v21)
        goto LABEL_22;
    }
    v29 = nrCopyLogObj_115();
    _NRLogWithArgs((uint64_t)v29, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v30, v31, v32, v33, v34, (uint64_t)");

LABEL_22:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    v35 = _os_log_pack_fill();
    *(_DWORD *)v35 = 136446210;
    *(_QWORD *)(v35 + 4) = "-[NRDevicePreferences initWithDeviceIdentifier:]";
LABEL_23:
    v36 = nrCopyLogObj_115();
    _NRLogAbortWithPack(v36);
  }
  v8 = v7;
  objc_storeStrong((id *)&v7->_deviceIdentifier, a3);
  v8->_lock._os_unfair_lock_opaque = 0;
  do
    v14 = __ldxr(&initWithDeviceIdentifier__sNRDevicePreferencesIndex);
  while (__stxr(v14 + 1, &initWithDeviceIdentifier__sNRDevicePreferencesIndex));
  v8->_identifier = v14;
  if (nrCopyLogObj_onceToken_109 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_109, &__block_literal_global_110);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_111, OS_LOG_TYPE_DEFAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_111, 0, (uint64_t)"%s%.30s:%-4d Init: %@", v9, v10, v11, v12, v13, (uint64_t)");

  return v8;
}

- (void)cancel
{
  os_unfair_lock_s *p_lock;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NRBluetoothLinkPreferences *internalBluetoothLinkPreferences;
  os_unfair_lock *v11;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (nrCopyLogObj_onceToken_109 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_109, &__block_literal_global_110);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_111, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (id)nrCopyLogObj_sNRLogObj_111;
    v11 = (os_unfair_lock *)-[NRDevicePreferences copyDetailsLocked]((const os_unfair_lock *)self);
    _NRLogWithArgs((uint64_t)v4, 0, (uint64_t)"%s%.30s:%-4d Cancel: %@ %@", v5, v6, v7, v8, v9, (uint64_t)");

  }
  while (self->_preferWiFiRequestCount)
    -[NRDevicePreferences removePreferWiFiRequestLocked]((uint64_t)self);
  -[NRDevicePreferences removeQuickRelayRequestLocked:]((uint64_t)self, 1);
  internalBluetoothLinkPreferences = self->_internalBluetoothLinkPreferences;
  self->_internalBluetoothLinkPreferences = 0;

  *(_WORD *)&self->_internalDeviceSetupStarted = 0;
  -[NRDevicePreferences resetCompanionLinkPreferencesLocked]((uint64_t)self);
  -[NRDevicePreferences cancelConnectionLocked]((uint64_t)self);
  os_unfair_lock_unlock(p_lock);
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  if (nrCopyLogObj_onceToken_109 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_109, &__block_literal_global_110);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_111, OS_LOG_TYPE_DEFAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_111, 0, (uint64_t)"%s%.30s:%-4d Dealloc: %@", v2, v3, v4, v5, v6, (uint64_t)");
  -[NRDevicePreferences cancel](self, "cancel");
  v8.receiver = self;
  v8.super_class = (Class)NRDevicePreferences;
  -[NRDevicePreferences dealloc](&v8, sel_dealloc);
}

- (id)description
{
  id v3;
  unint64_t identifier;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self)
    identifier = self->_identifier;
  else
    identifier = 0;
  -[NRDevicePreferences deviceIdentifier](self, "deviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nrDeviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("DevPref[%llu %@]"), identifier, v7);

  return v8;
}

- (void)deviceSetupStarted
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  *(_WORD *)&self->_internalDeviceSetupStarted = 1;
  -[NRDevicePreferences sendDevicePreferencesLocked]((uint64_t)self);
  os_unfair_lock_unlock(p_lock);
}

- (void)deviceSetupCompleted
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  *(_WORD *)&self->_internalDeviceSetupStarted = 256;
  -[NRDevicePreferences sendDevicePreferencesLocked]((uint64_t)self);
  os_unfair_lock_unlock(p_lock);
}

- (void)addPreferWiFiRequest
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  ++self->_preferWiFiRequestCount;
  if (nrCopyLogObj_onceToken_109 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_109, &__block_literal_global_110);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_111, OS_LOG_TYPE_DEFAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_111, 0, (uint64_t)"%s%.30s:%-4d %@ adding prefer Wi-Fi request (count is now %llu)", v4, v5, v6, v7, v8, (uint64_t)");
  NRPreferWiFiSet(1);
  os_unfair_lock_unlock(p_lock);
}

- (void)removePreferWiFiRequest
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NRDevicePreferences removePreferWiFiRequestLocked]((uint64_t)self);
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)hasPreferWiFiRequest
{
  NRDevicePreferences *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_preferWiFiRequestCount != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)addQuickRelayRequest
{
  os_unfair_lock_s *p_lock;
  unint64_t quickRelayRequestCount;
  NRDevicePreferencesQuickRelay *v5;
  void *v6;
  void *v7;
  NRDevicePreferencesQuickRelay *v8;
  NRDevicePreferencesQuickRelay *quickRelayPreference;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  quickRelayRequestCount = self->_quickRelayRequestCount;
  if (!quickRelayRequestCount)
  {
    if (self->_quickRelayPreference)
    {
      quickRelayRequestCount = 0;
    }
    else
    {
      v5 = [NRDevicePreferencesQuickRelay alloc];
      -[NRDevicePreferences deviceIdentifier](self, "deviceIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "nrDeviceIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[NRDevicePreferencesQuickRelay initWithNRUUID:](v5, "initWithNRUUID:", v7);
      quickRelayPreference = self->_quickRelayPreference;
      self->_quickRelayPreference = v8;

      quickRelayRequestCount = self->_quickRelayRequestCount;
    }
  }
  self->_quickRelayRequestCount = quickRelayRequestCount + 1;
  -[NRDevicePreferencesQuickRelay addQuickRelayRequest](self->_quickRelayPreference, "addQuickRelayRequest");
  os_unfair_lock_unlock(p_lock);
}

- (void)removeQuickRelayRequest
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NRDevicePreferences removeQuickRelayRequestLocked:]((uint64_t)self, 0);
  os_unfair_lock_unlock(p_lock);
}

- (void)removeAllQuickRelayRequests
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NRDevicePreferences removeQuickRelayRequestLocked:]((uint64_t)self, 1);
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)hasQuickRelayRequest
{
  NRDevicePreferences *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_quickRelayRequestCount != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NRBluetoothLinkPreferences)bluetoothLinkPreferences
{
  os_unfair_lock_s *p_lock;
  NRBluetoothLinkPreferences *internalBluetoothLinkPreferences;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self)
    internalBluetoothLinkPreferences = self->_internalBluetoothLinkPreferences;
  else
    internalBluetoothLinkPreferences = 0;
  v5 = (void *)-[NRBluetoothLinkPreferences copy](internalBluetoothLinkPreferences, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NRBluetoothLinkPreferences *)v5;
}

- (void)setBluetoothLinkPreferences:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  if (self)
  {
    self->_hasCmpnLnkPrefsForBT = 0;
    -[NRDevicePreferences setBluetoothLinkPreferencesLocked:]((uint64_t)self, v5);
  }
  else
  {

  }
  os_unfair_lock_unlock(p_lock);
}

- (NRCompanionLinkPreferences)companionLinkPreferences
{
  os_unfair_lock_s *p_lock;
  NRCompanionLinkPreferences *internalCompanionLinkPreferences;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self)
    internalCompanionLinkPreferences = self->_internalCompanionLinkPreferences;
  else
    internalCompanionLinkPreferences = 0;
  v5 = (void *)-[NRCompanionLinkPreferences copy](internalCompanionLinkPreferences, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NRCompanionLinkPreferences *)v5;
}

- (void)setCompanionLinkPreferences:(id)a3
{
  id v5;
  NRCompanionLinkPreferences *v6;
  NRCompanionLinkPreferences *v7;
  int v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NRBluetoothLinkPreferences *v16;
  id v17;
  void *v18;
  void *evaluator_for_endpoint;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD applier[4];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (!v5
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (!self
     || (v6 = self->_internalCompanionLinkPreferences) == 0
     || (v7 = v6, v8 = objc_msgSend(v5, "isEqual:", self->_internalCompanionLinkPreferences), v7, !v8)))
  {
    if (nrCopyLogObj_onceToken_109 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_109, &__block_literal_global_110);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_111, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)nrCopyLogObj_sNRLogObj_111;
      v10 = (id)nrCopyLogObj_sNRLogObj_111;
      _NRLogWithArgs((uint64_t)v10, 0, (uint64_t)"%s%.30s:%-4d %@ setting link preferences from %@ to %@", v11, v12, v13, v14, v15, (uint64_t)");

    }
    -[NRDevicePreferences resetCompanionLinkPreferencesLocked]((uint64_t)self);
    if (!v5)
      goto LABEL_32;
    if (objc_msgSend(v5, "serviceClass") == 2
      || objc_msgSend(v5, "serviceClass") == 3
      || objc_msgSend(v5, "serviceClass") == 4)
    {
      v16 = objc_alloc_init(NRBluetoothLinkPreferences);
      -[NRBluetoothLinkPreferences setPacketsPerSecond:](v16, "setPacketsPerSecond:", &unk_1EA400E10);
      -[NRDevicePreferences setBluetoothLinkPreferencesLocked:]((uint64_t)self, v16);
      if (self)
        self->_hasCmpnLnkPrefsForBT = 1;

    }
    if (objc_msgSend(v5, "serviceClass") == 3)
    {
      v17 = objc_alloc_init(MEMORY[0x1E0CCECA0]);
      objc_msgSend(v17, "requireNetworkAgentWithDomain:type:", CFSTR("com.apple.networkrelay"), CFSTR("PhoneCallRelayAgent"));
      v18 = (void *)objc_msgSend(v17, "copyCParameters");
      evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();

      v20 = (void *)nw_path_evaluator_copy_path();
      v21 = (void *)nw_path_copy_netagent_dictionary();
      v26 = 0;
      v27 = &v26;
      v28 = 0x2020000000;
      v29 = 0;
      if (v21)
      {
        applier[0] = MEMORY[0x1E0C809B0];
        applier[1] = 3221225472;
        applier[2] = __51__NRDevicePreferences_setCompanionLinkPreferences___block_invoke;
        applier[3] = &unk_1EA3F6E00;
        v25 = &v26;
        v24 = v20;
        xpc_dictionary_apply(v21, applier);

        if (self)
        {
          if (*((_BYTE *)v27 + 24))
          {
            self->_hasCmpnLnkPrefsForIsoch = 1;
            objc_storeStrong((id *)&self->_cmpnLnkPrefsEvaluator, evaluator_for_endpoint);
          }
        }
      }
      _Block_object_dispose(&v26, 8);

    }
    if (!objc_msgSend(v5, "highThroughput"))
    {
LABEL_32:
      if (!self)
        goto LABEL_38;
      goto LABEL_37;
    }
    if (objc_msgSend(v5, "includeP2P"))
    {
      if (objc_msgSend(v5, "serviceClass") != 2
        && objc_msgSend(v5, "serviceClass") != 3
        && objc_msgSend(v5, "serviceClass") != 4
        && objc_msgSend(v5, "serviceClass") != 5)
      {
        NRPreferP2PSet(1);
        if (!self)
          goto LABEL_38;
        v22 = 10;
        goto LABEL_36;
      }
      NRPreferP2PImmediatelySet(1);
      if (self)
      {
        v22 = 11;
LABEL_36:
        *((_BYTE *)&self->super.isa + v22) = 1;
LABEL_37:
        objc_storeStrong((id *)&self->_internalCompanionLinkPreferences, a3);
      }
    }
    else
    {
      NRPreferWiFiSet(1);
      if (self)
      {
        v22 = 12;
        goto LABEL_36;
      }
    }
  }
LABEL_38:
  os_unfair_lock_unlock(&self->_lock);

}

- (NSSet)policyTrafficClassifiers
{
  os_unfair_lock_s *p_lock;
  objc_class *v4;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self)
  {
    v4 = (objc_class *)MEMORY[0x1E0C99E60];
    goto LABEL_5;
  }
  v4 = (objc_class *)MEMORY[0x1E0C99E60];
  if (!self->_internalPolicyTrafficClassifiers)
  {
LABEL_5:
    v5 = objc_alloc_init(v4);
    goto LABEL_6;
  }
  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithSet:copyItems:", self->_internalPolicyTrafficClassifiers, 1);
LABEL_6:
  v6 = v5;
  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v6;
}

- (void)setPolicyTrafficClassifiers:(id)a3
{
  id v4;
  void *v5;
  NSSet *internalPolicyTrafficClassifiers;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSSet *v14;
  NSSet *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  id v25;

  v25 = a3;
  if (v25)
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithSet:copyItems:", v25, 1);
  else
    v4 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  v5 = v4;
  os_unfair_lock_lock(&self->_lock);
  if (self)
    internalPolicyTrafficClassifiers = self->_internalPolicyTrafficClassifiers;
  else
    internalPolicyTrafficClassifiers = 0;
  if (objc_msgSend(v5, "isEqual:", internalPolicyTrafficClassifiers))
  {
    if (nrCopyLogObj_onceToken_109 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_109, &__block_literal_global_110);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_111, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (id)nrCopyLogObj_sNRLogObj_111;
      v22 = _NRCopyPolicyTrafficClassifiersDescription(v5);
      _NRLogWithArgs((uint64_t)v7, 0, (uint64_t)"%s%.30s:%-4d %@ policy traffic classifiers already set to %@", v8, v9, v10, v11, v12, (uint64_t)");

    }
  }
  else
  {
    if (nrCopyLogObj_onceToken_109 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_109, &__block_literal_global_110);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_111, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)nrCopyLogObj_sNRLogObj_111;
      if (self)
        v14 = self->_internalPolicyTrafficClassifiers;
      else
        v14 = 0;
      v15 = v14;
      v16 = v13;
      v23 = _NRCopyPolicyTrafficClassifiersDescription(v15);
      v24 = _NRCopyPolicyTrafficClassifiersDescription(v5);
      _NRLogWithArgs((uint64_t)v16, 0, (uint64_t)"%s%.30s:%-4d %@ setting policy traffic classifiers from %@ to %@", v17, v18, v19, v20, v21, (uint64_t)");

    }
    if (self)
    {
      objc_storeStrong((id *)&self->_internalPolicyTrafficClassifiers, v5);
      -[NRDevicePreferences sendDevicePreferencesLocked]((uint64_t)self);
    }
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NRDeviceIdentifier)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_deviceIdentifier, a3);
}

- (BOOL)isNRDTestServer
{
  return self->_isNRDTestServer;
}

- (void)setIsNRDTestServer:(BOOL)a3
{
  self->_isNRDTestServer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cmpnLnkPrefsEvaluator, 0);
  objc_storeStrong((id *)&self->_internalPolicyTrafficClassifiers, 0);
  objc_storeStrong((id *)&self->_internalCompanionLinkPreferences, 0);
  objc_storeStrong((id *)&self->_internalBluetoothLinkPreferences, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_quickRelayPreference, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

- (void)sendDevicePreferencesLocked
{
  const os_unfair_lock *v2;
  id v3;
  NSObject *v4;
  xpc_connection_t mach_service;
  void *v6;
  _xpc_connection_s *v7;
  _xpc_connection_s *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  os_unfair_lock *v16;
  xpc_object_t v17;
  void *v18;
  void *v19;
  xpc_object_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  _xpc_connection_s *v25;
  NSObject *v26;
  os_unfair_lock *v27;
  int v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  NSObject *v36;
  _BOOL4 v37;
  NSObject *v38;
  NSObject *v39;
  _BOOL4 v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  os_unfair_lock *v56;
  _QWORD v57[4];
  os_unfair_lock *v58;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[4];
  id v66;
  _BYTE v67[128];
  id location[4];

  location[2] = *(id *)MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v2 = (const os_unfair_lock *)(a1 + 16);
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
  if ((objc_msgSend((id)a1, "isNRDTestServer") & 1) != 0)
    return;
  os_unfair_lock_assert_owner(v2);
  v3 = *(id *)(a1 + 64);
  if ((objc_msgSend(v3, "isNotEmpty") & 1) != 0 || objc_msgSend(*(id *)(a1 + 80), "count") || *(_BYTE *)(a1 + 8))
  {

    goto LABEL_7;
  }
  v28 = *(unsigned __int8 *)(a1 + 9);

  if (v28)
  {
LABEL_7:
    if (!*(_QWORD *)(a1 + 56))
    {
      if (nrXPCCopyQueue_onceToken != -1)
        dispatch_once(&nrXPCCopyQueue_onceToken, &__block_literal_global_2127);
      v4 = (id)nrXPCCopyQueue_nrXPCQueue;
      mach_service = xpc_connection_create_mach_service("com.apple.terminusd", v4, 2uLL);
      v6 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = mach_service;

      objc_initWeak(location, (id)a1);
      v7 = (_xpc_connection_s *)*(id *)(a1 + 56);
      v65[0] = MEMORY[0x1E0C809B0];
      v65[1] = 3221225472;
      v65[2] = __50__NRDevicePreferences_sendDevicePreferencesLocked__block_invoke;
      v65[3] = &unk_1EA3F7400;
      objc_copyWeak(&v66, location);
      xpc_connection_set_event_handler(v7, v65);

      v8 = (_xpc_connection_s *)*(id *)(a1 + 56);
      xpc_connection_activate(v8);

      objc_destroyWeak(&v66);
      objc_destroyWeak(location);
    }
    location[0] = 0;
    location[1] = 0;
    objc_msgSend((id)a1, "deviceIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "nrDeviceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "getUUIDBytes:", location);

    v16 = (os_unfair_lock *)-[NRDevicePreferences copyDetailsLocked]((const os_unfair_lock *)a1);
    if (nrCopyLogObj_onceToken_109 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_109, &__block_literal_global_110);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_111, OS_LOG_TYPE_DEFAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_111, 0, (uint64_t)"%s%.30s:%-4d %@ sending device preferences: %@", v11, v12, v13, v14, v15, (uint64_t)");
    v17 = xpc_dictionary_create(0, 0, 0);
    v18 = v17;
    if (v17)
    {
      xpc_dictionary_set_uint64(v17, "Type", 0xBuLL);
      xpc_dictionary_set_uuid(v18, "DeviceIdentifier", (const unsigned __int8 *)location);
      xpc_dictionary_set_BOOL(v18, "DevicePreferencesIsDeviceSetupInProgress", *(_BYTE *)(a1 + 8));
      if (objc_msgSend(*(id *)(a1 + 64), "isNotEmpty"))
      {
        v19 = (void *)objc_msgSend(*(id *)(a1 + 64), "copyEncodedXPCDict");
        xpc_dictionary_set_value(v18, "DevicePreferencesBTLinkPreferences", v19);

      }
      if (!objc_msgSend(*(id *)(a1 + 80), "count"))
        goto LABEL_29;
      v20 = xpc_array_create(0, 0);
      if (v20)
      {
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        v21 = *(id *)(a1 + 80);
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
        if (v22)
        {
          v23 = *(_QWORD *)v62;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v62 != v23)
                objc_enumerationMutation(v21);
              xpc_array_set_string(v20, 0xFFFFFFFFFFFFFFFFLL, (const char *)objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "UTF8String"));
            }
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
          }
          while (v22);
        }

        xpc_dictionary_set_value(v18, "DevicePreferencesPolicyTrafficClassifiers", v20);
LABEL_29:
        objc_initWeak(&v60, (id)a1);
        v25 = (_xpc_connection_s *)*(id *)(a1 + 56);
        if (nrXPCCopyQueue_onceToken != -1)
          dispatch_once(&nrXPCCopyQueue_onceToken, &__block_literal_global_2127);
        v26 = (id)nrXPCCopyQueue_nrXPCQueue;
        v57[0] = MEMORY[0x1E0C809B0];
        v57[1] = 3221225472;
        v57[2] = __50__NRDevicePreferences_sendDevicePreferencesLocked__block_invoke_2;
        v57[3] = &unk_1EA3F6E98;
        objc_copyWeak(&v59, &v60);
        v27 = v16;
        v58 = v27;
        xpc_connection_send_message_with_reply(v25, v18, v26, v57);

        objc_destroyWeak(&v59);
        objc_destroyWeak(&v60);

        return;
      }
      v38 = nrCopyLogObj_115();
      v39 = v38;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v40 = os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);

        if (!v40)
          goto LABEL_51;
      }
      v48 = nrCopyLogObj_115();
      _NRLogWithArgs((uint64_t)v48, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_array_create(%p, %u) failed", v49, v50, v51, v52, v53, (uint64_t)");

LABEL_51:
      _os_log_pack_size();
      MEMORY[0x1E0C80A78]();
      __error();
      v54 = _os_log_pack_fill();
      __os_log_helper_1_2_3_8_34_8_0_4_0(v54, (uint64_t)"nr_xpc_array_create");
LABEL_52:
      v55 = nrCopyLogObj_115();
      _NRLogAbortWithPack(v55);
    }
    v35 = nrCopyLogObj_115();
    v36 = v35;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v37 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);

      if (!v37)
        goto LABEL_48;
    }
    v41 = nrCopyLogObj_115();
    _NRLogWithArgs((uint64_t)v41, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v42, v43, v44, v45, v46, (uint64_t)");

LABEL_48:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    v47 = _os_log_pack_fill();
    __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v47, (uint64_t)"nr_xpc_dictionary_create");
    goto LABEL_52;
  }
  if (nrCopyLogObj_onceToken_109 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_109, &__block_literal_global_110);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_111, OS_LOG_TYPE_DEFAULT))
  {
    v29 = (id)nrCopyLogObj_sNRLogObj_111;
    v56 = (os_unfair_lock *)-[NRDevicePreferences copyDetailsLocked]((const os_unfair_lock *)a1);
    _NRLogWithArgs((uint64_t)v29, 0, (uint64_t)"%s%.30s:%-4d %@ cancelling connection because not needed %@", v30, v31, v32, v33, v34, (uint64_t)");

  }
  -[NRDevicePreferences cancelConnectionLocked](a1);
}

- (const)copyDetailsLocked
{
  const os_unfair_lock *v1;
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  __CFString *v7;
  uint64_t v8;

  if (result)
  {
    v1 = result;
    os_unfair_lock_assert_owner(result + 4);
    v2 = objc_alloc(MEMORY[0x1E0CB3940]);
    v3 = *(_QWORD *)&v1[8]._os_unfair_lock_opaque;
    v4 = *(void **)&v1[16]._os_unfair_lock_opaque;
    v5 = *(id *)&v1[20]._os_unfair_lock_opaque;
    v6 = v4;
    v7 = _NRCopyPolicyTrafficClassifiersDescription(v5);
    v8 = objc_msgSend(v2, "initWithFormat:", CFSTR("%llu preferWiFi, %@, %@"), v3, v6, v7);

    return (const os_unfair_lock *)v8;
  }
  return result;
}

- (void)cancelConnectionLocked
{
  const os_unfair_lock *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _xpc_connection_s *v16;
  void *v17;

  if (a1)
  {
    v2 = (const os_unfair_lock *)(a1 + 16);
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
    if (nrCopyLogObj_onceToken_109 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_109, &__block_literal_global_110);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_111, OS_LOG_TYPE_DEFAULT))
    {
      v3 = (id)nrCopyLogObj_sNRLogObj_111;
      os_unfair_lock_assert_owner(v2);
      v4 = objc_alloc(MEMORY[0x1E0CB3940]);
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(a1 + 80);
      v7 = *(id *)(a1 + 64);
      v8 = v6;
      v9 = _NRCopyPolicyTrafficClassifiersDescription(v8);
      v10 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%llu preferWiFi, %@, %@"), v5, v7, v9);

      _NRLogWithArgs((uint64_t)v3, 0, (uint64_t)"%s%.30s:%-4d %@ cancelling connection %@", v11, v12, v13, v14, v15, (uint64_t)");
    }
    v16 = *(_xpc_connection_s **)(a1 + 56);
    if (v16)
    {
      xpc_connection_cancel(v16);
      v17 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = 0;

    }
  }
}

void __50__NRDevicePreferences_sendDevicePreferencesLocked__block_invoke(uint64_t a1, void *a2)
{
  os_unfair_lock_s *WeakRetained;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (MEMORY[0x1DF0BA7A8](v14) == MEMORY[0x1E0C81310])
    {
      os_unfair_lock_lock(WeakRetained + 4);
      if (v14 == (id)MEMORY[0x1E0C81258])
      {
        if (nrCopyLogObj_onceToken_109 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_109, &__block_literal_global_110);
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_111, OS_LOG_TYPE_DEFAULT))
          _NRLogWithArgs(nrCopyLogObj_sNRLogObj_111, 0, (uint64_t)"%s%.30s:%-4d %@ interrupted, resubmitting device preferences", v9, v10, v11, v12, v13, (uint64_t)");
        -[NRDevicePreferences sendDevicePreferencesLocked](WeakRetained);
      }
      else
      {
        if (v14 == (id)MEMORY[0x1E0C81260])
        {
          if (nrCopyLogObj_onceToken_109 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_109, &__block_literal_global_110);
          if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_111, OS_LOG_TYPE_DEFAULT))
            _NRLogWithArgs(nrCopyLogObj_sNRLogObj_111, 0, (uint64_t)"%s%.30s:%-4d %@ received XPC error invalid", v9, v10, v11, v12, v13, (uint64_t)");
        }
        else
        {
          if (nrCopyLogObj_onceToken_109 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_109, &__block_literal_global_110);
          if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_111, OS_LOG_TYPE_ERROR))
            _NRLogWithArgs(nrCopyLogObj_sNRLogObj_111, 16, (uint64_t)"%s%.30s:%-4d %@ received unknown XPC error: %@", v9, v10, v11, v12, v13, (uint64_t)");
        }
        -[NRDevicePreferences restartConnectionLocked]((uint64_t)WeakRetained);
      }
      os_unfair_lock_unlock(WeakRetained + 4);
    }
    else
    {
      if (nrCopyLogObj_onceToken_109 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_109, &__block_literal_global_110);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_111, OS_LOG_TYPE_ERROR))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_111, 16, (uint64_t)"%s%.30s:%-4d %@ received unexpected XPC message %@", v4, v5, v6, v7, v8, (uint64_t)");
    }
  }

}

void __50__NRDevicePreferences_sendDevicePreferencesLocked__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (MEMORY[0x1DF0BA7A8](v9) == MEMORY[0x1E0C81310])
    {
      if (nrCopyLogObj_onceToken_109 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_109, &__block_literal_global_110);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_111, OS_LOG_TYPE_ERROR))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_111, 16, (uint64_t)"%s%.30s:%-4d %@ failed to send device preferences: %@, error %@", v4, v5, v6, v7, v8, (uint64_t)");
    }
    else
    {
      if (nrCopyLogObj_onceToken_109 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_109, &__block_literal_global_110);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_111, OS_LOG_TYPE_DEFAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_111, 0, (uint64_t)"%s%.30s:%-4d %@ sent device preferences: %@", v4, v5, v6, v7, v8, (uint64_t)");
    }
  }

}

- (uint64_t)restartConnectionLocked
{
  const os_unfair_lock *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = (const os_unfair_lock *)(a1 + 16);
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
  if (nrCopyLogObj_onceToken_109 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_109, &__block_literal_global_110);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_111, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (id)nrCopyLogObj_sNRLogObj_111;
    os_unfair_lock_assert_owner(v2);
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 80);
    v7 = *(id *)(a1 + 64);
    v8 = v6;
    v9 = _NRCopyPolicyTrafficClassifiersDescription(v8);
    v10 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%llu preferWiFi, %@, %@"), v5, v7, v9);

    _NRLogWithArgs((uint64_t)v3, 0, (uint64_t)"%s%.30s:%-4d %@ restarting connection %@", v11, v12, v13, v14, v15, (uint64_t)");
  }
  -[NRDevicePreferences cancelConnectionLocked](a1);
  return -[NRDevicePreferences sendDevicePreferencesLocked](a1);
}

- (void)resetCompanionLinkPreferencesLocked
{
  void *v2;

  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
    if (*(_QWORD *)(a1 + 72))
    {
      if (*(_BYTE *)(a1 + 13))
      {
        -[NRDevicePreferences setBluetoothLinkPreferencesLocked:](a1, 0);
        *(_BYTE *)(a1 + 13) = 0;
      }
      if (*(_BYTE *)(a1 + 14))
      {
        nw_path_evaluator_cancel();
        objc_msgSend((id)a1, "setCompanionLinkPreferences:", 0);
        *(_BYTE *)(a1 + 14) = 0;
      }
      if (*(_BYTE *)(a1 + 10))
      {
        NRPreferP2PSet(0);
        *(_BYTE *)(a1 + 10) = 0;
      }
      if (*(_BYTE *)(a1 + 11))
      {
        NRPreferP2PImmediatelySet(0);
        *(_BYTE *)(a1 + 11) = 0;
      }
      if (*(_BYTE *)(a1 + 12))
      {
        NRPreferWiFiSet(0);
        *(_BYTE *)(a1 + 12) = 0;
      }
      v2 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = 0;

    }
  }
}

- (void)setBluetoothLinkPreferencesLocked:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v16 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (nrCopyLogObj_onceToken_109 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_109, &__block_literal_global_110);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_111, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (id)nrCopyLogObj_sNRLogObj_111;
        _NRLogWithArgs((uint64_t)v9, 0, (uint64_t)"%s%.30s:%-4d %@ setting Bluetooth link preferences from %@ to %@", v10, v11, v12, v13, v14, (uint64_t)");

      }
      objc_storeStrong((id *)(a1 + 64), a2);
      -[NRDevicePreferences sendDevicePreferencesLocked](a1);
    }
    else
    {
      if (nrCopyLogObj_onceToken_109 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_109, &__block_literal_global_110);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_111, OS_LOG_TYPE_FAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_111, 17, (uint64_t)"Invalid bluetooth link preferences", v4, v5, v6, v7, v8, v15);
    }
  }

}

uint64_t __51__NRDevicePreferences_setCompanionLinkPreferences___block_invoke(uint64_t a1, int a2, xpc_object_t xdict)
{
  const char *data;
  uint64_t result;
  char v6;
  size_t length;

  length = 0;
  data = (const char *)xpc_dictionary_get_data(xdict, "data", &length);
  result = 1;
  if (data && length >= 0xD8 && length == *((unsigned int *)data + 53) + 216)
  {
    if (!strcmp(data + 16, "com.apple.networkrelay") && !strcmp(data + 48, "PhoneCallRelayAgent"))
    {
      v6 = nw_path_assert_agent();
      result = 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (void)removeQuickRelayRequestLocked:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  if (!a1)
    return;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
  v9 = *(_QWORD *)(a1 + 40);
  if (!v9)
    return;
  if (a2)
  {
    *(_QWORD *)(a1 + 40) = 0;
    if (nrCopyLogObj_onceToken_109 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_109, &__block_literal_global_110);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_111, OS_LOG_TYPE_DEFAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_111, 0, (uint64_t)"%s%.30s:%-4d %@ removing all quick relay requests (count is now %llu)", v4, v5, v6, v7, v8, (uint64_t)");
    objc_msgSend(*(id *)(a1 + 48), "removeAllQuickRelayRequests");
    if (*(_QWORD *)(a1 + 40))
      return;
LABEL_17:
    v10 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = 0;

    return;
  }
  *(_QWORD *)(a1 + 40) = v9 - 1;
  if (nrCopyLogObj_onceToken_109 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_109, &__block_literal_global_110);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_111, OS_LOG_TYPE_DEFAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_111, 0, (uint64_t)"%s%.30s:%-4d %@ removing quick relay request (count is now %llu)", v4, v5, v6, v7, v8, (uint64_t)");
  objc_msgSend(*(id *)(a1 + 48), "removeQuickRelayRequest");
  if (!*(_QWORD *)(a1 + 40))
    goto LABEL_17;
}

- (void)removePreferWiFiRequestLocked
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
    {
      *(_QWORD *)(a1 + 32) = v7 - 1;
      if (nrCopyLogObj_onceToken_109 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_109, &__block_literal_global_110);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_111, OS_LOG_TYPE_DEFAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_111, 0, (uint64_t)"%s%.30s:%-4d %@ removing prefer Wi-Fi request (count is now %llu)", v2, v3, v4, v5, v6, (uint64_t)");
      NRPreferWiFiSet(0);
    }
    else
    {
      if (nrCopyLogObj_onceToken_109 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_109, &__block_literal_global_110);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_111, OS_LOG_TYPE_ERROR))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_111, 16, (uint64_t)"%s%.30s:%-4d %@ not removing prefer Wi-Fi request because count is 0", v2, v3, v4, v5, v6, (uint64_t)");
    }
  }
}

@end
