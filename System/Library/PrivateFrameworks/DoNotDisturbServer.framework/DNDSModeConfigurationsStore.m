@implementation DNDSModeConfigurationsStore

- (DNDSModeConfigurationsStore)initWithBackingStore:(id)a3 syncEngine:(id)a4 idsSyncEngine:(id)a5
{
  id v9;
  id v10;
  id v11;
  DNDSModeConfigurationsStore *v12;
  DNDSModeConfigurationsStore *v13;
  void *v14;
  uint64_t v15;
  NSData *contactHistoryToken;
  uint64_t v17;
  NSMutableSet *ckRecordIDsToForceSave;
  uint64_t v19;
  NSMutableSet *idsRecordIDsToForceSave;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)DNDSModeConfigurationsStore;
  v12 = -[DNDSModeConfigurationsStore init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_backingStore, a3);
    -[DNDSBackingStore setDelegate:](v13->_backingStore, "setDelegate:", v13);
    objc_storeStrong((id *)&v13->_syncEngine, a4);
    -[DNDSSyncEngine setDataSource:forZoneName:](v13->_syncEngine, "setDataSource:forZoneName:", v13, CFSTR("DNDSModeConfigurations"));
    objc_storeStrong((id *)&v13->_idsSyncEngine, a5);
    -[DNDSIDSSyncEngine setDataSource:forZone:](v13->_idsSyncEngine, "setDataSource:forZone:", v13, CFSTR("DNDSModeConfigurations"));
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dataForKey:", CFSTR("DNDSModeConfigurationsContactHistoryToken"));
    v15 = objc_claimAutoreleasedReturnValue();
    contactHistoryToken = v13->_contactHistoryToken;
    v13->_contactHistoryToken = (NSData *)v15;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v17 = objc_claimAutoreleasedReturnValue();
    ckRecordIDsToForceSave = v13->_ckRecordIDsToForceSave;
    v13->_ckRecordIDsToForceSave = (NSMutableSet *)v17;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v19 = objc_claimAutoreleasedReturnValue();
    idsRecordIDsToForceSave = v13->_idsRecordIDsToForceSave;
    v13->_idsRecordIDsToForceSave = (NSMutableSet *)v19;

  }
  return v13;
}

- (id)readRecordWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[DNDSBackingStore readRecordWithError:](self->_backingStore, "readRecordWithError:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (unint64_t)writeRecord:(id)a3 error:(id *)a4
{
  return -[DNDSModeConfigurationsStore writeRecord:writePartition:error:](self, "writeRecord:writePartition:error:", a3, 1, a4);
}

- (unint64_t)writeRecord:(id)a3 writePartition:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  os_unfair_lock_s *p_lock;
  id v9;
  unint64_t v10;

  v6 = a4;
  p_lock = &self->_lock;
  v9 = a3;
  os_unfair_lock_lock(p_lock);
  v10 = -[DNDSModeConfigurationsStore _lock_writeRecord:writePartition:error:](self, "_lock_writeRecord:writePartition:error:", v9, v6, a5);

  os_unfair_lock_unlock(p_lock);
  -[DNDSModeConfigurationsStore _notifyDelegateOfAvailableModes](self, "_notifyDelegateOfAvailableModes");
  return v10;
}

- (id)backingStore:(id)a3 migrateDictionaryRepresentation:(id)a4 fromVersionNumber:(unint64_t)a5 toVersionNumber:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;

  v10 = a4;
  v11 = a3;
  -[DNDSModeConfigurationsStore delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "backingStore:migrateDictionaryRepresentation:fromVersionNumber:toVersionNumber:", v11, v10, a5, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)cachedBackingStoreDidPurgeCache:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  v4 = DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "Backing store was purged", v5, 2u);
  }
  -[DNDSModeConfigurationsStore _notifyDelegateOfAvailableModes](self, "_notifyDelegateOfAvailableModes");
}

- (int64_t)syncEngine:(id)a3 wantsRecord:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSNumber *compatibilityVersion;
  int64_t v17;
  void *v18;
  unsigned int v19;

  v5 = a4;
  objc_msgSend(v5, "recordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "zoneName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("DNDSModeConfigurations"));

  if (v9)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("DNDSModeConfigurationsMinimumRequiredVersion"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");
    objc_msgSend(v5, "objectForKey:", CFSTR("DNDSModeConfigurationsVersion"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue");
    DNDSModeConfigurationsVersionSupported();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "integerValue");

    if (os_variant_has_internal_content())
    {
      compatibilityVersion = self->_compatibilityVersion;
      if (compatibilityVersion)
        v15 = -[NSNumber integerValue](compatibilityVersion, "integerValue");
    }
    if (v11 <= v15)
    {
      if (v13 <= v15)
      {
        objc_msgSend(v5, "recordType");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("DNDSModeConfigurationsRecord"));

        v17 = v19;
      }
      else
      {
        v17 = 2;
      }
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)_lock_mergeLocalConfigurationRecord:(id)a3 withRemoteConfigurationRecord:(id)a4 modeIdentifier:(id)a5 sourceDeviceIdentifier:(id)a6 sourceFrameworkVersion:(id *)a7 sourceIsCloud:(BOOL)a8 sourceWantsToForce:(BOOL)a9 deleteModeOnCorruption:(BOOL)a10
{
  _BOOL4 v10;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  BOOL v25;
  _BOOL4 v26;
  DNDSModeConfigurationsStore *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  DNDSSyncEngine *v33;
  void *v34;
  DNDSIDSSyncEngine *v35;
  DNDSIDSRecordID *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  NSObject *v41;
  DNDSIDSRecordID *v42;
  void *v43;
  DNDSIDSRecordID *v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  void *v48;
  void *v49;
  DNDSIDSRecordID *v50;
  id v51;
  void *v52;
  void *v53;
  DNDSSyncEngine *v54;
  void *v55;
  DNDSIDSSyncEngine *v56;
  void *v57;
  _BOOL4 v58;
  void *v59;
  NSObject *v60;
  DNDSModeConfigurationsStore *v61;
  void *v62;
  uint64_t v63;
  NSObject *v64;
  const char *v65;
  NSObject *v66;
  DNDSModeConfigurationsStore *v67;
  void *v68;
  DNDSIDSRecordID *v69;
  void *v70;
  void *v71;
  id v72;
  NSObject *v73;
  DNDSModeConfigurationsStore *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  NSObject *v78;
  const char *v79;
  NSObject *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  NSObject *v85;
  void *v86;
  void *v87;
  DNDSModeConfigurationsStore *v88;
  DNDSIDSRecordID *v89;
  void *v90;
  void *v91;
  DNDSIDSRecordID *v92;
  id v93;
  id v94;
  NSObject *v95;
  DNDSModeConfigurationsStore *v96;
  void *v97;
  void *v98;
  void *v99;
  DNDSIDSSyncEngine *idsSyncEngine;
  DNDSIDSSyncEngine *v101;
  id v102;
  DNDSModeConfigurationsStore *v103;
  void *v104;
  DNDSSyncEngine *v105;
  void *v106;
  DNDSIDSRecordID *v108;
  void *v109;
  NSObject *log;
  os_log_t loga;
  DNDSModeConfigurationsStore *v112;
  DNDSModeConfigurationsStore *v113;
  id v114;
  DNDSSyncEngine *syncEngine;
  id v116;
  id v117;
  _BOOL4 v118;
  id v119;
  __int128 v120;
  DNDSIDSRecordID *v121;
  void *v122;
  DNDSIDSRecordID *v123;
  void *v124;
  void *v125;
  DNDSIDSRecordID *v126;
  DNDSIDSRecordID *v127;
  void *v128;
  uint8_t buf[24];
  DNDSIDSRecordID *v130;
  __int16 v131;
  void *v132;
  __int16 v133;
  void *v134;
  uint64_t v135;

  v10 = a8;
  v135 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = v19;
  if (v17)
  {
    v118 = v10;
    v119 = v19;
    objc_msgSend(MEMORY[0x1E0D1D650], "modeConfigurationForRecord:", v17);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1D650], "modeConfigurationForRecord:", v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "log:withMessage:", DNDSLogModeConfigurations, CFSTR("Local configuration"));
    objc_msgSend(v21, "log:withMessage:", DNDSLogModeConfigurations, CFSTR("Remote configuration"));
    v23 = objc_alloc_init(MEMORY[0x1E0D1D5D0]);
    objc_msgSend(v23, "diffObject:againstObject:withDescription:", v22, v21, CFSTR("modeConfiguration"));
    if (objc_msgSend(v23, "hasDifferences"))
      objc_msgSend(v23, "log:withPrefix:", DNDSLogModeConfigurations, v18);

    if (objc_msgSend(v22, "isEqual:", v21))
    {
      v24 = DNDSLogModeConfigurations;
      if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v18;
        _os_log_impl(&dword_1CB895000, v24, OS_LOG_TYPE_DEFAULT, "Record for %{public}@ does not contain configuration changes.", buf, 0xCu);
      }

      v25 = 0;
      goto LABEL_79;
    }
    if (v22)
    {
      objc_msgSend(v22, "mergeWithRemoteModeConfiguration:", v21);
      v38 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v38 = v21;
    }
    v116 = v16;
    v117 = v38;
    if (a9)
    {
      if (v21)
        objc_msgSend(v21, "lastModifiedByVersion");
      if (v22)
        objc_msgSend(v22, "lastModifiedByVersion");
      v120 = 0uLL;
      +[DNDSDevice currentDevice](DNDSDevice, "currentDevice");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v39;
      if (v39)
        objc_msgSend(v39, "frameworkVersion");
      else
        v120 = 0uLL;

      v57 = (void *)DNDSLogModeConfigurations;
      v58 = os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT);
      if (v117 == v21)
      {
        if (v58)
        {
          *(_OWORD *)buf = *(_OWORD *)&a7->var0;
          *(_QWORD *)&buf[16] = a7->var2;
          v66 = v57;
          DNDStringFromOperatingSystemVersion();
          loga = v18;
          v67 = self;
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          *(_OWORD *)buf = v120;
          *(_QWORD *)&buf[16] = 0;
          DNDStringFromOperatingSystemVersion();
          v69 = (DNDSIDSRecordID *)objc_claimAutoreleasedReturnValue();
          memset(buf, 0, sizeof(buf));
          DNDStringFromOperatingSystemVersion();
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          memset(buf, 0, sizeof(buf));
          DNDStringFromOperatingSystemVersion();
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          *(_QWORD *)&buf[4] = v119;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v68;
          *(_WORD *)&buf[22] = 2114;
          v130 = v69;
          v131 = 2114;
          v132 = v70;
          v133 = 2114;
          v134 = v71;
          _os_log_impl(&dword_1CB895000, v66, OS_LOG_TYPE_DEFAULT, "Remote device is forcing a write that we agree with. device: %@; sourceFrameworkVersion: %{public}@; current"
            "FrameworkVersion: %{public}@; remoteRecordVersion: %{public}@; localRecordVersion: %{public}@;",
            buf,
            0x34u);

          self = v67;
          v18 = loga;

        }
LABEL_64:
        v80 = DNDSLogModeConfigurations;
        if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v18;
          _os_log_impl(&dword_1CB895000, v80, OS_LOG_TYPE_DEFAULT, "Fetched data with ID %{public}@ is current; applying update",
            buf,
            0xCu);
        }
        -[DNDSModeConfigurationsStore _lock_updateModeConfigurationWithConfiguration:](self, "_lock_updateModeConfigurationWithConfiguration:", v17);
        objc_msgSend(v21, "lastModifiedByDeviceID");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v81)
        {
          v82 = objc_msgSend(v21, "rawResolvedCompatibilityVersion");
          if (v82 == objc_msgSend(v21, "resolvedCompatibilityVersion"))
            goto LABEL_75;
          objc_msgSend(v21, "lastModified");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "dateByAddingTimeInterval:", 60.0);
          v81 = (void *)objc_claimAutoreleasedReturnValue();

          v84 = (void *)DNDSLogModeConfigurations;
          if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
          {
            v85 = v84;
            objc_msgSend(v21, "rawResolvedCompatibilityVersion");
            DNDCompatibilityVersionToString();
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "resolvedCompatibilityVersion");
            DNDCompatibilityVersionToString();
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "lastModified");
            v88 = self;
            v89 = (DNDSIDSRecordID *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            *(_QWORD *)&buf[4] = v86;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v87;
            *(_WORD *)&buf[22] = 2114;
            v130 = v89;
            v131 = 2114;
            v132 = v81;
            _os_log_impl(&dword_1CB895000, v85, OS_LOG_TYPE_DEFAULT, "Remote configuration is from a device that has a different version resolution. Updating resolvedCompatibilityVersion from %{public}@ to %{public}@ and bumping lastModified from %{public}@ to %{public}@ and resyncing.", buf, 0x2Au);

            self = v88;
          }
          v90 = (void *)objc_msgSend(v21, "mutableCopy");
          objc_msgSend(v90, "setLastModified:", v81);
          objc_msgSend(v90, "makeRecord");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDSModeConfigurationsStore _lock_updateModeConfigurationWithConfiguration:](self, "_lock_updateModeConfigurationWithConfiguration:", v91);

          v113 = self;
          if (v118)
          {
            v92 = (DNDSIDSRecordID *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneName:", CFSTR("DNDSModeConfigurations"));
            v93 = objc_alloc(MEMORY[0x1E0C95070]);
            -[DNDSIDSRecordID zoneID](v92, "zoneID");
            v94 = v17;
            v95 = v18;
            v96 = self;
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            v98 = (void *)objc_msgSend(v93, "initWithRecordName:zoneID:", v95, v97);

            syncEngine = v96->_syncEngine;
            v18 = v95;
            v17 = v94;
            v128 = v98;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v128, 1);
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSSyncEngine addRecordIDsToSave:recordIDsToDelete:](syncEngine, "addRecordIDsToSave:recordIDsToDelete:", v99, 0);

          }
          else
          {
            -[DNDSModeConfigurationsStore _lock_updateModeConfigurationWithConfiguration:](self, "_lock_updateModeConfigurationWithConfiguration:", v17);
            v92 = -[DNDSIDSRecordID initWithIdentifier:zone:]([DNDSIDSRecordID alloc], "initWithIdentifier:zone:", v18, CFSTR("DNDSModeConfigurations"));
            idsSyncEngine = self->_idsSyncEngine;
            v127 = v92;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v127, 1);
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSIDSSyncEngine addRecordIDsToSave:recordIDsToDelete:](idsSyncEngine, "addRecordIDsToSave:recordIDsToDelete:", v98, 0);
          }

          self = v113;
        }

LABEL_75:
        if (v118)
        {
          v42 = -[DNDSIDSRecordID initWithIdentifier:zone:]([DNDSIDSRecordID alloc], "initWithIdentifier:zone:", v18, CFSTR("DNDSModeConfigurations"));
          v101 = self->_idsSyncEngine;
          v126 = v42;
          v25 = 1;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v126, 1);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDSIDSSyncEngine addRecordIDsToSave:recordIDsToDelete:](v101, "addRecordIDsToSave:recordIDsToDelete:", v43, 0);
        }
        else
        {
          v42 = (DNDSIDSRecordID *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneName:", CFSTR("DNDSModeConfigurations"));
          v102 = objc_alloc(MEMORY[0x1E0C95070]);
          -[DNDSIDSRecordID zoneID](v42, "zoneID");
          v103 = self;
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = (void *)objc_msgSend(v102, "initWithRecordName:zoneID:", v18, v104);

          v105 = v103->_syncEngine;
          v125 = v43;
          v25 = 1;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v125, 1);
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDSSyncEngine addRecordIDsToSave:recordIDsToDelete:](v105, "addRecordIDsToSave:recordIDsToDelete:", v106, 0);

        }
LABEL_78:

        v16 = v116;
LABEL_79:
        v20 = v119;
        goto LABEL_80;
      }
      if (v58)
      {
        *(_OWORD *)buf = *(_OWORD *)&a7->var0;
        *(_QWORD *)&buf[16] = a7->var2;
        log = v57;
        DNDStringFromOperatingSystemVersion();
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        *(_OWORD *)buf = v120;
        *(_QWORD *)&buf[16] = 0;
        DNDStringFromOperatingSystemVersion();
        v108 = (DNDSIDSRecordID *)objc_claimAutoreleasedReturnValue();
        memset(buf, 0, sizeof(buf));
        DNDStringFromOperatingSystemVersion();
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        memset(buf, 0, sizeof(buf));
        DNDStringFromOperatingSystemVersion();
        v114 = v17;
        v60 = v18;
        v61 = self;
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        *(_QWORD *)&buf[4] = v119;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v109;
        *(_WORD *)&buf[22] = 2114;
        v130 = v108;
        v131 = 2114;
        v132 = v59;
        v133 = 2114;
        v134 = v62;
        _os_log_impl(&dword_1CB895000, log, OS_LOG_TYPE_DEFAULT, "Remote device is forcing a write that we disagree with. device: %@; sourceFrameworkVersion: %{public}@; curren"
          "tFrameworkVersion: %{public}@; remoteRecordVersion: %{public}@; localRecordVersion: %{public}@;",
          buf,
          0x34u);

        self = v61;
        v18 = v60;
        v17 = v114;

      }
      *(_OWORD *)buf = v120;
      *(_QWORD *)&buf[16] = 0;
      v63 = DNDOperatingSystemVersionCompare();
      if (v63)
      {
        if (v63 == -1)
        {
          v64 = DNDSLogModeConfigurations;
          if (!os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
            goto LABEL_64;
          *(_WORD *)buf = 0;
          v65 = "Accepting forced write because the remote framework revision is newer than the current version.";
LABEL_63:
          _os_log_impl(&dword_1CB895000, v64, OS_LOG_TYPE_DEFAULT, v65, buf, 2u);
          goto LABEL_64;
        }
        v78 = DNDSLogModeConfigurations;
        if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v79 = "Rejecting forced write because the remote framework revision is older than the current version.";
LABEL_60:
          _os_log_impl(&dword_1CB895000, v78, OS_LOG_TYPE_DEFAULT, v79, buf, 2u);
        }
      }
      else
      {
        v72 = v17;
        v73 = v18;
        v74 = self;
        +[DNDSDevice currentDevice](DNDSDevice, "currentDevice");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "identifier");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = objc_msgSend(v76, "compare:options:", v119, 769);

        if (v77 == 1)
        {
          v78 = DNDSLogModeConfigurations;
          self = v74;
          v18 = v73;
          v17 = v72;
          if (!os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
            goto LABEL_28;
          *(_WORD *)buf = 0;
          v79 = "Accepting forced write because the remote framework revision is the same as the current version but lost"
                " the tie-breaker.";
          goto LABEL_60;
        }
        self = v74;
        if (!v77)
        {
          v64 = DNDSLogModeConfigurations;
          v18 = v73;
          v17 = v72;
          if (!os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
            goto LABEL_64;
          *(_WORD *)buf = 0;
          v65 = "Accepting forced write because it came from this device.";
          goto LABEL_63;
        }
        v18 = v73;
        v17 = v72;
        if (v77 == -1)
        {
          v64 = DNDSLogModeConfigurations;
          if (!os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
            goto LABEL_64;
          *(_WORD *)buf = 0;
          v65 = "Accepting forced write because the remote framework revision is the same as the current version and won "
                "the tie-breaker.";
          goto LABEL_63;
        }
      }
    }
    else if (v38 == v21)
    {
      goto LABEL_64;
    }
LABEL_28:
    v112 = self;
    v41 = DNDSLogModeConfigurations;
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v18;
      _os_log_impl(&dword_1CB895000, v41, OS_LOG_TYPE_DEFAULT, "Fetched data with ID %{public}@ is outdated; ignoring update and resending local data",
        buf,
        0xCu);
    }
    objc_msgSend(v21, "lastModified");
    v42 = (DNDSIDSRecordID *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "lastModified");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "lastModifiedByDeviceID");
    v44 = (DNDSIDSRecordID *)objc_claimAutoreleasedReturnValue();
    if (!v44)
    {
      objc_msgSend(v43, "laterDate:", v42);
      v44 = (DNDSIDSRecordID *)objc_claimAutoreleasedReturnValue();
      if (v42 == v44)
      {
        v45 = objc_msgSend(v21, "rawResolvedCompatibilityVersion");
        v46 = *MEMORY[0x1E0D1D3B0];

        if (v45 > v46)
        {
LABEL_37:
          if (v118)
          {
            v50 = (DNDSIDSRecordID *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneName:", CFSTR("DNDSModeConfigurations"));
            v51 = objc_alloc(MEMORY[0x1E0C95070]);
            -[DNDSIDSRecordID zoneID](v50, "zoneID");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = (void *)objc_msgSend(v51, "initWithRecordName:zoneID:", v18, v52);

            -[NSMutableSet addObject:](v112->_ckRecordIDsToForceSave, "addObject:", v53);
            v54 = v112->_syncEngine;
            v124 = v53;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v124, 1);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSSyncEngine addRecordIDsToSave:recordIDsToDelete:](v54, "addRecordIDsToSave:recordIDsToDelete:", v55, 0);

          }
          else
          {
            v50 = -[DNDSIDSRecordID initWithIdentifier:zone:]([DNDSIDSRecordID alloc], "initWithIdentifier:zone:", v18, CFSTR("DNDSModeConfigurations"));
            -[NSMutableSet addObject:](v112->_idsRecordIDsToForceSave, "addObject:", v50);
            v56 = v112->_idsSyncEngine;
            v123 = v50;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v123, 1);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSIDSSyncEngine addRecordIDsToSave:recordIDsToDelete:](v56, "addRecordIDsToSave:recordIDsToDelete:", v53, 0);
          }

          v25 = 0;
          goto LABEL_78;
        }
        -[DNDSIDSRecordID dateByAddingTimeInterval:](v42, "dateByAddingTimeInterval:", 60.0);
        v44 = (DNDSIDSRecordID *)objc_claimAutoreleasedReturnValue();
        v47 = DNDSLogModeConfigurations;
        if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v43;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v44;
          *(_WORD *)&buf[22] = 2114;
          v130 = v42;
          _os_log_error_impl(&dword_1CB895000, v47, OS_LOG_TYPE_ERROR, "Remote configuration is from a device that doesn't agree with this resolution. Bumping lastModified from %{public}@ to %{public}@ to overcome remote lastModified of %{public}@ and resyncing.", buf, 0x20u);
        }
        v48 = (void *)objc_msgSend(v22, "mutableCopy");
        objc_msgSend(v48, "setLastModified:", v44);
        objc_msgSend(v48, "makeRecord");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSModeConfigurationsStore _lock_updateModeConfigurationWithConfiguration:](v112, "_lock_updateModeConfigurationWithConfiguration:", v49);

      }
    }

    goto LABEL_37;
  }
  v26 = os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR);
  if (a10)
  {
    v27 = self;
    v28 = v20;
    if (v26)
      -[DNDSModeConfigurationsStore _lock_mergeLocalConfigurationRecord:withRemoteConfigurationRecord:modeIdentifier:sourceDeviceIdentifier:sourceFrameworkVersion:sourceIsCloud:sourceWantsToForce:deleteModeOnCorruption:].cold.1();
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneName:", CFSTR("DNDSModeConfigurations"));
    v30 = objc_alloc(MEMORY[0x1E0C95070]);
    objc_msgSend(v29, "zoneID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v30, "initWithRecordName:zoneID:", v18, v31);

    v33 = self->_syncEngine;
    v122 = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v122, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSSyncEngine addRecordIDsToSave:recordIDsToDelete:](v33, "addRecordIDsToSave:recordIDsToDelete:", 0, v34);

    v35 = self->_idsSyncEngine;
    v36 = -[DNDSIDSRecordID initWithIdentifier:zone:]([DNDSIDSRecordID alloc], "initWithIdentifier:zone:", v18, CFSTR("DNDSModeConfigurations"));
    v121 = v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v121, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSIDSSyncEngine addRecordIDsToSave:recordIDsToDelete:](v35, "addRecordIDsToSave:recordIDsToDelete:", 0, v37);

    v25 = v16 != 0;
    if (v16)
      -[DNDSModeConfigurationsStore _lock_removeModeConfigurationWithModeIdentifier:](v27, "_lock_removeModeConfigurationWithModeIdentifier:", v18);

    v20 = v28;
    v17 = 0;
  }
  else
  {
    if (v26)
      -[DNDSModeConfigurationsStore _lock_mergeLocalConfigurationRecord:withRemoteConfigurationRecord:modeIdentifier:sourceDeviceIdentifier:sourceFrameworkVersion:sourceIsCloud:sourceWantsToForce:deleteModeOnCorruption:].cold.2();
    v25 = 0;
  }
LABEL_80:

  return v25;
}

- (BOOL)_lock_mergeLocalConfigurationRecord:(id)a3 withRemoteCKRecord:(id)a4 deleteModeOnCorruption:(BOOL)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _BOOL4 v20;
  const __CFString *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  id v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  NSObject *v31;
  BOOL v32;
  uint64_t v34;
  __int128 v36;
  uint64_t v37;
  _BYTE buf[24];
  uint64_t v39;
  __int16 v40;
  const __CFString *v41;
  uint64_t v42;

  HIDWORD(v34) = a5;
  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "recordID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "encryptedValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("DNDSModeConfigurationsRecordForceUpdate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "BOOLValue");
  objc_msgSend(v7, "encryptedValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("DNDSModeConfigurationsSourceDeviceIdentifier"));
  v14 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "encryptedValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", CFSTR("DNDSModeConfigurationsSourceFrameworkVersion"));
  v16 = objc_claimAutoreleasedReturnValue();

  v36 = 0uLL;
  v37 = 0;
  DNDOperatingSystemVersionFromString();
  objc_msgSend(v7, "encryptedValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", CFSTR("DNDSModeConfigurationsLastModified"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = DNDSLogModeConfigurations;
  v20 = os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT);
  if (v14 | v16)
  {
    if (v20)
    {
      v21 = CFSTR("NO");
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v9;
      if (v12)
        v21 = CFSTR("YES");
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2112;
      v39 = v16;
      v40 = 2114;
      v41 = v21;
      v22 = "Fetched record with ID: %{public}@ from device %@ / %@ (force: %{public}@).";
      v23 = v19;
      v24 = 42;
      goto LABEL_8;
    }
  }
  else if (v20)
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v9;
    v22 = "Fetched record with ID: %{public}@ from legacy device.";
    v23 = v19;
    v24 = 12;
LABEL_8:
    _os_log_impl(&dword_1CB895000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
  }
  v25 = +[DNDSModeConfigurationRecord newWithCKRecord:currentRecord:](DNDSModeConfigurationRecord, "newWithCKRecord:currentRecord:", v7, v6);
  v26 = v25;
  if (!v18)
    goto LABEL_13;
  objc_msgSend(v25, "lastModified");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "timeIntervalSinceDate:", v18);
  v29 = v28;

  v30 = -v29;
  if (v29 >= 0.0)
    v30 = v29;
  if (v30 > 1.0)
  {
LABEL_13:

    v36 = *MEMORY[0x1E0D1D440];
    v37 = *(_QWORD *)(MEMORY[0x1E0D1D440] + 16);
    v31 = DNDSLogModeConfigurations;
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB895000, v31, OS_LOG_TYPE_DEFAULT, "Record has source info set but the mdate doesn't match. Ignoring source and treating as legacy.", buf, 2u);
    }
    v14 = 0;
    LOBYTE(v12) = 0;
  }
  *(_OWORD *)buf = v36;
  *(_QWORD *)&buf[16] = v37;
  BYTE1(v34) = BYTE4(v34);
  LOBYTE(v34) = v12;
  v32 = -[DNDSModeConfigurationsStore _lock_mergeLocalConfigurationRecord:withRemoteConfigurationRecord:modeIdentifier:sourceDeviceIdentifier:sourceFrameworkVersion:sourceIsCloud:sourceWantsToForce:deleteModeOnCorruption:](self, "_lock_mergeLocalConfigurationRecord:withRemoteConfigurationRecord:modeIdentifier:sourceDeviceIdentifier:sourceFrameworkVersion:sourceIsCloud:sourceWantsToForce:deleteModeOnCorruption:", v6, v26, v9, v14, buf, 1, v34);

  return v32;
}

- (void)syncEngine:(id)a3 didFetchRecord:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  id v10;

  v5 = a4;
  objc_msgSend(v5, "recordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordName");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock(&self->_lock);
  -[DNDSModeConfigurationsStore _lock_existingConfigurations](self, "_lock_existingConfigurations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "modeConfigurationForModeIdentifier:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[DNDSModeConfigurationsStore _lock_mergeLocalConfigurationRecord:withRemoteCKRecord:deleteModeOnCorruption:](self, "_lock_mergeLocalConfigurationRecord:withRemoteCKRecord:deleteModeOnCorruption:", v8, v5, 1);

  os_unfair_lock_unlock(&self->_lock);
  if (v9)
    -[DNDSModeConfigurationsStore _notifyDelegateOfAvailableModes](self, "_notifyDelegateOfAvailableModes");

}

- (void)syncEngine:(id)a3 failedToDeleteRecordWithID:(id)a4 error:(id)a5
{
  id v6;
  void *v7;

  v6 = a5;
  v7 = (void *)DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR))
    -[DNDSModeConfigurationsStore syncEngine:failedToDeleteRecordWithID:error:].cold.1(v7, a4, (uint64_t)v6);

}

- (void)syncEngine:(id)a3 resolveConflictBetweenClientRecord:(id)a4 andServerRecord:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  objc_msgSend(v7, "recordID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recordName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock(&self->_lock);
  v11 = DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138543362;
    v17 = v10;
    _os_log_impl(&dword_1CB895000, v11, OS_LOG_TYPE_DEFAULT, "Encountered conflict while saving configuration: %{public}@", (uint8_t *)&v16, 0xCu);
  }
  -[DNDSModeConfigurationsStore _lock_modeConfigurationForModeIdentifier:](self, "_lock_modeConfigurationForModeIdentifier:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = +[DNDSModeConfigurationRecord newWithCKRecord:currentRecord:](DNDSModeConfigurationRecord, "newWithCKRecord:currentRecord:", v8, v12);

  if ((objc_msgSend(v12, "isEqual:", v13) & 1) == 0)
  {
    v14 = DNDSLogModeConfigurations;
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1CB895000, v14, OS_LOG_TYPE_DEFAULT, "Server version of the record from this device is out of date.", (uint8_t *)&v16, 2u);
    }
  }
  v15 = -[DNDSModeConfigurationsStore _lock_mergeLocalConfigurationRecord:withRemoteCKRecord:deleteModeOnCorruption:](self, "_lock_mergeLocalConfigurationRecord:withRemoteCKRecord:deleteModeOnCorruption:", v12, v7, 0);
  os_unfair_lock_unlock(&self->_lock);
  if (v15)
    -[DNDSModeConfigurationsStore _notifyDelegateOfAvailableModes](self, "_notifyDelegateOfAvailableModes");

}

- (int64_t)syncEngine:(id)a3 prepareRecordToSave:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  os_unfair_lock_s *p_lock;
  int64_t v14;
  NSMutableSet *ckRecordIDsToForceSave;
  void *v16;
  uint64_t v17;
  NSMutableSet *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "recordID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v31 = v9;
    _os_log_impl(&dword_1CB895000, v10, OS_LOG_TYPE_DEFAULT, "Preparing to save record %{public}@", buf, 0xCu);
  }
  objc_msgSend(v6, "recordID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastChanceRecordForRecordID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v14 = -[DNDSModeConfigurationsStore _lock_populateCKRecord:lastChanceRecord:](self, "_lock_populateCKRecord:lastChanceRecord:", v6, v12);
  ckRecordIDsToForceSave = self->_ckRecordIDsToForceSave;
  objc_msgSend(v6, "recordID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[NSMutableSet containsObject:](ckRecordIDsToForceSave, "containsObject:", v16);

  v18 = self->_ckRecordIDsToForceSave;
  objc_msgSend(v6, "recordID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet removeObject:](v18, "removeObject:", v19);

  objc_msgSend(v6, "encryptedValues");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKey:", v21, CFSTR("DNDSModeConfigurationsRecordForceUpdate"));

  objc_msgSend(v6, "encryptedValues");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[DNDSDevice currentDevice](DNDSDevice, "currentDevice");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
    objc_msgSend(v23, "frameworkVersion");
  DNDStringFromOperatingSystemVersion();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKey:", v25, CFSTR("DNDSModeConfigurationsSourceFrameworkVersion"));

  objc_msgSend(v6, "encryptedValues");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[DNDSDevice currentDevice](DNDSDevice, "currentDevice");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "identifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKey:", v28, CFSTR("DNDSModeConfigurationsSourceDeviceIdentifier"));

  os_unfair_lock_unlock(p_lock);
  return v14;
}

- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  DNDSIDSRecordID *v8;
  DNDSIDSSyncEngine *idsSyncEngine;
  void *v10;
  DNDSIDSRecordID *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "recordName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v6;
    _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Server removed record %{public}@", buf, 0xCu);
  }
  os_unfair_lock_lock(&self->_lock);
  -[DNDSModeConfigurationsStore _lock_removeModeConfigurationWithCKRecordID:](self, "_lock_removeModeConfigurationWithCKRecordID:", v5);

  v8 = -[DNDSIDSRecordID initWithIdentifier:zone:]([DNDSIDSRecordID alloc], "initWithIdentifier:zone:", v6, CFSTR("DNDSModeConfigurations"));
  idsSyncEngine = self->_idsSyncEngine;
  v11 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSIDSSyncEngine addRecordIDsToSave:recordIDsToDelete:](idsSyncEngine, "addRecordIDsToSave:recordIDsToDelete:", 0, v10);

  os_unfair_lock_unlock(&self->_lock);
  -[DNDSModeConfigurationsStore _notifyDelegateOfAvailableModes](self, "_notifyDelegateOfAvailableModes");

}

- (id)syncEngine:(id)a3 recordTypeForRecordID:(id)a4
{
  return CFSTR("DNDSModeConfigurationsRecord");
}

- (void)syncEngine:(id)a3 zoneWithIDWasDeleted:(id)a4 removingRecordIDs:(id)a5
{
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v6 = a5;
  v7 = DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Removing all records because zone was deleted", v8, 2u);
  }
  -[DNDSModeConfigurationsStore _purgeRecordIDs:](self, "_purgeRecordIDs:", v6);

}

- (id)recordIDsForSyncEngine:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  -[DNDSModeConfigurationsStore _lock_modeIdentifiers](self, "_lock_modeIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneName:", CFSTR("DNDSModeConfigurations"));
  objc_msgSend(v6, "zoneID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12);
        v14 = objc_alloc(MEMORY[0x1E0C95070]);
        v15 = (void *)objc_msgSend(v14, "initWithRecordName:zoneID:", v13, v7, (_QWORD)v20);
        objc_msgSend(v4, "addObject:", v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v10);
  }

  v16 = (void *)DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    v18 = objc_msgSend(v4, "count");
    *(_DWORD *)buf = 134349056;
    v25 = v18;
    _os_log_impl(&dword_1CB895000, v17, OS_LOG_TYPE_DEFAULT, "Fetched %{public}llu record IDs for the sync engine", buf, 0xCu);

  }
  return v4;
}

- (void)idsSyncEngine:(id)a3 prepareRecordToSave:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  os_unfair_lock_s *p_lock;
  NSMutableSet *idsRecordIDsToForceSave;
  void *v11;
  uint64_t v12;
  NSMutableSet *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "recordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v7;
    _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "Preparing to save record for IDS sync engine: %{public}@", buf, 0xCu);
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[DNDSModeConfigurationsStore _lock_populateDNDSIDSRecord:](self, "_lock_populateDNDSIDSRecord:", v5);
  idsRecordIDsToForceSave = self->_idsRecordIDsToForceSave;
  objc_msgSend(v5, "recordID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[NSMutableSet containsObject:](idsRecordIDsToForceSave, "containsObject:", v11);

  v13 = self->_idsRecordIDsToForceSave;
  objc_msgSend(v5, "recordID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet removeObject:](v13, "removeObject:", v14);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v15, CFSTR("DNDSModeConfigurationsRecordForceUpdate"));

  +[DNDSDevice currentDevice](DNDSDevice, "currentDevice");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
    objc_msgSend(v16, "frameworkVersion");
  DNDStringFromOperatingSystemVersion();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v18, CFSTR("DNDSModeConfigurationsSourceFrameworkVersion"));

  +[DNDSDevice currentDevice](DNDSDevice, "currentDevice");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v20, CFSTR("DNDSModeConfigurationsSourceDeviceIdentifier"));

  os_unfair_lock_unlock(p_lock);
}

- (void)idsSyncEngine:(id)a3 didFetchRecord:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  const __CFString *v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  _BYTE buf[24];
  void *v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "recordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v7;
    _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "Fetched record from IDS sync engine with ID: %{public}@", buf, 0xCu);
  }
  os_unfair_lock_lock(&self->_lock);
  -[DNDSModeConfigurationsStore _lock_modeConfigurationForModeIdentifier:](self, "_lock_modeConfigurationForModeIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[DNDSModeConfigurationRecord newWithDNDSIDSRecord:currentRecord:](DNDSModeConfigurationRecord, "newWithDNDSIDSRecord:currentRecord:", v5, v9);
  objc_msgSend(v5, "objectForKey:", CFSTR("DNDSModeConfigurationsRecordForceUpdate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");
  objc_msgSend(v5, "objectForKey:", CFSTR("DNDSModeConfigurationsSourceDeviceIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("DNDSModeConfigurationsSourceFrameworkVersion"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0uLL;
  v26 = 0;
  DNDOperatingSystemVersionFromString();
  objc_msgSend(v5, "objectForKey:", CFSTR("DNDSModeConfigurationsLastModified"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    goto LABEL_7;
  objc_msgSend(v10, "lastModified");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSinceDate:", v15);
  v18 = v17;

  v19 = -v18;
  if (v18 >= 0.0)
    v19 = v18;
  if (v19 <= 1.0)
  {
    v22 = DNDSLogModeConfigurations;
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
    {
      v23 = CFSTR("NO");
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v7;
      if (v12)
        v23 = CFSTR("YES");
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v13;
      *(_WORD *)&buf[22] = 2112;
      v28 = v14;
      v29 = 2114;
      v30 = v23;
      _os_log_impl(&dword_1CB895000, v22, OS_LOG_TYPE_DEFAULT, "Fetched record with ID: %{public}@ from device %@ / %@ (force: %{public}@).", buf, 0x2Au);
    }
  }
  else
  {
LABEL_7:

    v25 = *MEMORY[0x1E0D1D440];
    v26 = *(_QWORD *)(MEMORY[0x1E0D1D440] + 16);
    v20 = DNDSLogModeConfigurations;
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v7;
      _os_log_impl(&dword_1CB895000, v20, OS_LOG_TYPE_DEFAULT, "Fetched record with ID: %{public}@ from legacy device.", buf, 0xCu);
    }
    v13 = 0;
    LOBYTE(v12) = 0;
  }
  *(_OWORD *)buf = v25;
  *(_QWORD *)&buf[16] = v26;
  BYTE1(v24) = 1;
  LOBYTE(v24) = v12;
  v21 = -[DNDSModeConfigurationsStore _lock_mergeLocalConfigurationRecord:withRemoteConfigurationRecord:modeIdentifier:sourceDeviceIdentifier:sourceFrameworkVersion:sourceIsCloud:sourceWantsToForce:deleteModeOnCorruption:](self, "_lock_mergeLocalConfigurationRecord:withRemoteConfigurationRecord:modeIdentifier:sourceDeviceIdentifier:sourceFrameworkVersion:sourceIsCloud:sourceWantsToForce:deleteModeOnCorruption:", v9, v10, v7, v13, buf, 0, v24);
  os_unfair_lock_unlock(&self->_lock);
  if (v21)
    -[DNDSModeConfigurationsStore _notifyDelegateOfAvailableModes](self, "_notifyDelegateOfAvailableModes");

}

- (void)idsSyncEngine:(id)a3 recordWithIDWasDeleted:(id)a4
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  DNDSSyncEngine *syncEngine;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "identifier", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v5;
    _os_log_impl(&dword_1CB895000, v6, OS_LOG_TYPE_DEFAULT, "IDS sync engine removed record %{public}@", buf, 0xCu);
  }
  os_unfair_lock_lock(&self->_lock);
  -[DNDSModeConfigurationsStore _lock_removeModeConfigurationWithModeIdentifier:](self, "_lock_removeModeConfigurationWithModeIdentifier:", v5);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneName:", CFSTR("DNDSModeConfigurations"));
  objc_msgSend(v7, "zoneID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v5, v8);
  syncEngine = self->_syncEngine;
  v12 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSSyncEngine addRecordIDsToSave:recordIDsToDelete:](syncEngine, "addRecordIDsToSave:recordIDsToDelete:", 0, v11);

  os_unfair_lock_unlock(&self->_lock);
  -[DNDSModeConfigurationsStore _notifyDelegateOfAvailableModes](self, "_notifyDelegateOfAvailableModes");

}

- (id)recordIDsForIDSSyncEngine:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[DNDSModeConfigurationsStore _lock_recordIDsForIDSSyncEngine:](self, "_lock_recordIDsForIDSSyncEngine:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)purgeRecordsForIDSSyncEngine:(id)a3
{
  os_unfair_lock_s *p_lock;
  NSObject *v5;
  void *v6;
  void *v7;
  DNDSMutableModeConfigurationsRecord *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  DNDSBackingStore *backingStore;
  id v13;
  id v14;
  uint8_t v15[16];
  uint8_t buf[16];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Purging data for IDS sync engine", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0D1D650], "defaultModeConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "makeRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(DNDSMutableModeConfigurationsRecord);
  objc_msgSend(v6, "mode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "modeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableModeConfigurationsRecord setModeConfiguration:forModeIdentifier:](v8, "setModeConfiguration:forModeIdentifier:", v7, v10);

  v11 = DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_1CB895000, v11, OS_LOG_TYPE_DEFAULT, "Replacing records with default mode configuration", v15, 2u);
  }
  backingStore = self->_backingStore;
  v14 = 0;
  -[DNDSBackingStore writeRecord:writePartition:error:](backingStore, "writeRecord:writePartition:error:", v8, 1, &v14);
  v13 = v14;
  if (v13 && os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR))
    -[DNDSModeConfigurationsStore purgeRecordsForIDSSyncEngine:].cold.1();
  os_unfair_lock_unlock(p_lock);
  -[DNDSModeConfigurationsStore _notifyDelegateOfAvailableModes](self, "_notifyDelegateOfAvailableModes");

}

- (NSData)contactHistoryToken
{
  return self->_contactHistoryToken;
}

- (NSSet)monitoredContacts
{
  void *v3;
  os_unfair_lock_s *p_lock;
  DNDSBackingStore *backingStore;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  void *v31;
  id obj;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  backingStore = self->_backingStore;
  v46 = 0;
  -[DNDSBackingStore readRecordWithError:](backingStore, "readRecordWithError:", &v46);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v46;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR))
      -[DNDSModeConfigurationsStore monitoredContacts].cold.1();
  }
  else
  {
    v31 = v6;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(v6, "modeConfigurations");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
    if (v8)
    {
      v9 = v8;
      v33 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v43 != v33)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_msgSend(v11, "secureConfiguration");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "senderConfiguration");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "allowedContacts");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v40 = 0u;
          v41 = 0u;
          v38 = 0u;
          v39 = 0u;
          v15 = v14;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v39;
            do
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v39 != v18)
                  objc_enumerationMutation(v15);
                objc_msgSend(MEMORY[0x1E0D1D5C0], "contactForRecord:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j));
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "addObject:", v20);

              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
            }
            while (v17);
          }

          objc_msgSend(v11, "secureConfiguration");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "senderConfiguration");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "deniedContacts");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v36 = 0u;
          v37 = 0u;
          v34 = 0u;
          v35 = 0u;
          v24 = v23;
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v35;
            do
            {
              for (k = 0; k != v26; ++k)
              {
                if (*(_QWORD *)v35 != v27)
                  objc_enumerationMutation(v24);
                objc_msgSend(MEMORY[0x1E0D1D5C0], "contactForRecord:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * k));
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "addObject:", v29);

              }
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
            }
            while (v26);
          }

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
      }
      while (v9);
    }

    v6 = v31;
    v7 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return (NSSet *)v3;
}

- (void)contactMonitor:(id)a3 didReceiveUpdatedContactsForContactsWithoutIdentifiers:(id)a4
{
  id v5;
  os_unfair_lock_s *p_lock;
  NSObject *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t i;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  DNDSModeConfigurationsStore *v47;
  os_unfair_lock_s *v48;
  char v49;
  void *v50;
  id obj;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint8_t v76[128];
  uint8_t buf[4];
  id v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (objc_msgSend(v5, "count"))
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v7 = DNDSLogModeConfigurations;
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v78 = v5;
      _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Received updated identifierless contacts: %{private}@", buf, 0xCu);
    }
    -[DNDSModeConfigurationsStore _lock_mutableExistingConfigurations](self, "_lock_mutableExistingConfigurations");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "modeConfigurations");
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
    if (!v53)
      goto LABEL_37;
    v47 = self;
    v48 = &self->_lock;
    v49 = 0;
    v52 = *(_QWORD *)v71;
    v8 = 0x1E0C99000uLL;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v71 != v52)
          objc_enumerationMutation(obj);
        v57 = v9;
        v10 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v9);
        v56 = (void *)objc_msgSend(v10, "mutableCopy", v47, v48);
        objc_msgSend(v56, "secureConfiguration");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v11, "mutableCopy");

        v55 = v12;
        objc_msgSend(v12, "senderConfiguration");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = (void *)objc_msgSend(v13, "mutableCopy");

        objc_msgSend(*(id *)(v8 + 3616), "set");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v10;
        objc_msgSend(v10, "secureConfiguration");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "senderConfiguration");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "allowedContacts");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v68 = 0u;
        v69 = 0u;
        v66 = 0u;
        v67 = 0u;
        v60 = v16;
        v17 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
        if (v17)
        {
          v18 = v17;
          v19 = 0;
          v20 = *(_QWORD *)v67;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v67 != v20)
                objc_enumerationMutation(v60);
              v22 = *(id *)(*((_QWORD *)&v66 + 1) + 8 * i);
              objc_msgSend(MEMORY[0x1E0D1D5C0], "contactForRecord:", v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "objectForKeyedSubscript:", v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = v24;
              if (v24)
              {
                objc_msgSend(v24, "makeRecord");
                v26 = objc_claimAutoreleasedReturnValue();

                v19 = 1;
                v22 = (id)v26;
              }
              objc_msgSend(v61, "addObject:", v22);

            }
            v18 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
          }
          while (v18);
        }
        else
        {
          v19 = 0;
        }

        objc_msgSend(*(id *)(v8 + 3616), "set");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "secureConfiguration");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "senderConfiguration");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "deniedContacts");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        v59 = v30;
        v31 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v63;
          do
          {
            for (j = 0; j != v32; ++j)
            {
              if (*(_QWORD *)v63 != v33)
                objc_enumerationMutation(v59);
              v35 = *(id *)(*((_QWORD *)&v62 + 1) + 8 * j);
              objc_msgSend(MEMORY[0x1E0D1D5C0], "contactForRecord:", v35);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "objectForKeyedSubscript:", v36);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = v37;
              if (v37)
              {
                objc_msgSend(v37, "makeRecord");
                v39 = objc_claimAutoreleasedReturnValue();

                v19 = 1;
                v35 = (id)v39;
              }
              objc_msgSend(v27, "addObject:", v35);

            }
            v32 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
          }
          while (v32);
        }

        if ((v19 & 1) != 0)
        {
          v40 = (void *)DNDSLogModeConfigurations;
          if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
          {
            v41 = v40;
            objc_msgSend(v58, "mode");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "modeIdentifier");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v78 = v43;
            _os_log_impl(&dword_1CB895000, v41, OS_LOG_TYPE_DEFAULT, "Detected matching contact in configuration: %{public}@", buf, 0xCu);

          }
          objc_msgSend(v54, "setAllowedContacts:", v61);
          objc_msgSend(v54, "setDeniedContacts:", v27);
          objc_msgSend(v55, "setSenderConfiguration:", v54);
          objc_msgSend(v56, "setSecureConfiguration:", v55);
          objc_msgSend(v56, "mode");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "modeIdentifier");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "setModeConfiguration:forModeIdentifier:", v56, v45);

          v49 = 1;
        }

        v9 = v57 + 1;
        v8 = 0x1E0C99000;
      }
      while (v57 + 1 != v53);
      v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
    }
    while (v53);
    p_lock = v48;
    if ((v49 & 1) != 0)
    {
      objc_msgSend(v50, "log:withMessage:", DNDSLogModeConfigurations, CFSTR("Writing updated configurations"));
      -[DNDSModeConfigurationsStore _lock_writeRecord:writePartition:error:](v47, "_lock_writeRecord:writePartition:error:", v50, 1, 0);
      os_unfair_lock_unlock(v48);
      -[DNDSModeConfigurationsStore _notifyDelegateOfAvailableModes](v47, "_notifyDelegateOfAvailableModes");
    }
    else
    {
LABEL_37:
      v46 = DNDSLogModeConfigurations;
      if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CB895000, v46, OS_LOG_TYPE_DEFAULT, "Did not encounter any matching configurations", buf, 2u);
      }
      os_unfair_lock_unlock(p_lock);
    }

  }
}

- (void)contactMonitor:(id)a3 didReceiveUpdatedContacts:(id)a4 deletedContactIdentifiers:(id)a5 withContactHistoryToken:(id)a6
{
  NSObject *v9;
  NSObject *v10;
  NSData *v11;
  NSData *contactHistoryToken;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  id v26;
  uint64_t v27;
  id v28;
  void *v29;
  int v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t j;
  id v48;
  void *v49;
  int v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t k;
  void *v57;
  void *v58;
  void *v59;
  char v60;
  uint64_t v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  os_unfair_lock_s *lock;
  DNDSModeConfigurationsStore *v70;
  id v71;
  id v72;
  char v73;
  void *v74;
  id obj;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  uint64_t v84;
  id v85;
  id v86;
  id v87;
  void *v88;
  int v89;
  int v90;
  id v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  uint8_t v119[128];
  uint8_t buf[4];
  id v121;
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v91 = a4;
  v72 = a5;
  v70 = self;
  v71 = a6;
  os_unfair_lock_lock(&self->_lock);
  v9 = DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v121 = v91;
    _os_log_impl(&dword_1CB895000, v9, OS_LOG_TYPE_DEFAULT, "Received updated contacts: %{private}@", buf, 0xCu);
  }
  v10 = DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v121 = v72;
    _os_log_impl(&dword_1CB895000, v10, OS_LOG_TYPE_DEFAULT, "Received deleted contact identifiers: %{private}@", buf, 0xCu);
  }
  v11 = (NSData *)objc_msgSend(v71, "copy", &self->_lock);
  contactHistoryToken = self->_contactHistoryToken;
  self->_contactHistoryToken = v11;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", self->_contactHistoryToken, CFSTR("DNDSModeConfigurationsContactHistoryToken"));

  if (!objc_msgSend(v91, "count") && !objc_msgSend(v72, "count"))
    goto LABEL_70;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v72);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeConfigurationsStore _lock_mutableExistingConfigurations](self, "_lock_mutableExistingConfigurations");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "modeConfigurations");
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v119, 16);
  if (!v77)
    goto LABEL_67;
  v73 = 0;
  v76 = *(_QWORD *)v112;
  v88 = v14;
  do
  {
    v15 = 0;
    do
    {
      if (*(_QWORD *)v112 != v76)
        objc_enumerationMutation(obj);
      v81 = v15;
      v16 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * v15);
      v80 = (void *)objc_msgSend(v16, "mutableCopy");
      objc_msgSend(v80, "secureConfiguration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "mutableCopy");

      v79 = v18;
      objc_msgSend(v18, "senderConfiguration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = (void *)objc_msgSend(v19, "mutableCopy");

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = v16;
      objc_msgSend(v16, "secureConfiguration");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "senderConfiguration");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "allowedContacts");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v109 = 0u;
      v110 = 0u;
      v107 = 0u;
      v108 = 0u;
      v87 = v22;
      v23 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v107, v118, 16);
      if (v23)
      {
        v24 = v23;
        v25 = 0;
        v26 = *(id *)v108;
        v85 = *(id *)v108;
        do
        {
          v27 = 0;
          v93 = v24;
          do
          {
            if (*(id *)v108 != v26)
              objc_enumerationMutation(v87);
            v28 = *(id *)(*((_QWORD *)&v107 + 1) + 8 * v27);
            objc_msgSend(v28, "contactIdentifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v14, "containsObject:", v29);

            if (v30)
            {
              v31 = (void *)objc_msgSend(v28, "mutableCopy");
              objc_msgSend(v31, "setContactIdentifier:", 0);
              v25 = 1;
              v32 = v28;
              v28 = v31;
            }
            else
            {
              v105 = 0u;
              v106 = 0u;
              v103 = 0u;
              v104 = 0u;
              v32 = v91;
              v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v103, v117, 16);
              if (v33)
              {
                v34 = v33;
                v89 = v25;
                v35 = *(_QWORD *)v104;
                do
                {
                  for (i = 0; i != v34; ++i)
                  {
                    if (*(_QWORD *)v104 != v35)
                      objc_enumerationMutation(v32);
                    v37 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * i);
                    objc_msgSend(v28, "contactIdentifier");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v37, "contactIdentifier");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v38, "isEqualToString:", v39))
                    {
                      v40 = objc_msgSend(v28, "isEqual:", v37);

                      if ((v40 & 1) == 0)
                      {
                        objc_msgSend(v37, "makeRecord");
                        v41 = objc_claimAutoreleasedReturnValue();

                        v25 = 1;
                        v28 = (id)v41;
                        v14 = v88;
                        goto LABEL_31;
                      }
                    }
                    else
                    {

                    }
                  }
                  v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v103, v117, 16);
                }
                while (v34);
                v14 = v88;
                v25 = v89;
LABEL_31:
                v26 = v85;
                v24 = v93;
              }
            }

            objc_msgSend(v92, "addObject:", v28);
            ++v27;
          }
          while (v27 != v24);
          v24 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v107, v118, 16);
        }
        while (v24);
      }
      else
      {
        v25 = 0;
      }

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "secureConfiguration");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "senderConfiguration");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "deniedContacts");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      v101 = 0u;
      v102 = 0u;
      v99 = 0u;
      v100 = 0u;
      v86 = v45;
      v83 = v42;
      v94 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v99, v116, 16);
      if (v94)
      {
        v46 = *(_QWORD *)v100;
        v84 = *(_QWORD *)v100;
        do
        {
          for (j = 0; j != v94; ++j)
          {
            if (*(_QWORD *)v100 != v46)
              objc_enumerationMutation(v86);
            v48 = *(id *)(*((_QWORD *)&v99 + 1) + 8 * j);
            objc_msgSend(v48, "contactIdentifier");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v14, "containsObject:", v49);

            if (v50)
            {
              v51 = (void *)objc_msgSend(v48, "mutableCopy");
              objc_msgSend(v51, "setContactIdentifier:", 0);
              v25 = 1;
              v52 = v48;
              v48 = v51;
            }
            else
            {
              v97 = 0u;
              v98 = 0u;
              v95 = 0u;
              v96 = 0u;
              v52 = v91;
              v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v95, v115, 16);
              if (v53)
              {
                v54 = v53;
                v90 = v25;
                v55 = *(_QWORD *)v96;
                do
                {
                  for (k = 0; k != v54; ++k)
                  {
                    if (*(_QWORD *)v96 != v55)
                      objc_enumerationMutation(v52);
                    v57 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * k);
                    objc_msgSend(v48, "contactIdentifier");
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v57, "contactIdentifier");
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v58, "isEqualToString:", v59))
                    {
                      v60 = objc_msgSend(v48, "isEqual:", v57);

                      if ((v60 & 1) == 0)
                      {
                        objc_msgSend(v57, "makeRecord");
                        v61 = objc_claimAutoreleasedReturnValue();

                        v25 = 1;
                        v48 = (id)v61;
                        v14 = v88;
                        goto LABEL_55;
                      }
                    }
                    else
                    {

                    }
                  }
                  v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v95, v115, 16);
                }
                while (v54);
                v14 = v88;
                v25 = v90;
LABEL_55:
                v42 = v83;
              }
              v46 = v84;
            }

            objc_msgSend(v42, "addObject:", v48);
          }
          v94 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v99, v116, 16);
        }
        while (v94);
      }

      if ((v25 & 1) != 0)
      {
        v62 = (void *)DNDSLogModeConfigurations;
        if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
        {
          v63 = v62;
          objc_msgSend(v82, "mode");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "modeIdentifier");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v121 = v65;
          _os_log_impl(&dword_1CB895000, v63, OS_LOG_TYPE_DEFAULT, "Detected matching contact in configuration: %{public}@", buf, 0xCu);

        }
        objc_msgSend(v78, "setAllowedContacts:", v92);
        objc_msgSend(v78, "setDeniedContacts:", v83);
        objc_msgSend(v79, "setSenderConfiguration:", v78);
        objc_msgSend(v80, "setSecureConfiguration:", v79);
        objc_msgSend(v80, "mode");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "modeIdentifier");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "setModeConfiguration:forModeIdentifier:", v80, v67);

        v73 = 1;
      }

      v15 = v81 + 1;
    }
    while (v81 + 1 != v77);
    v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v119, 16);
  }
  while (v77);
  if ((v73 & 1) == 0)
  {
LABEL_67:
    v68 = DNDSLogModeConfigurations;
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB895000, v68, OS_LOG_TYPE_DEFAULT, "Did not encounter any matching configurations", buf, 2u);
    }

LABEL_70:
    os_unfair_lock_unlock(lock);
    goto LABEL_71;
  }
  objc_msgSend(v74, "log:withMessage:", DNDSLogModeConfigurations, CFSTR("Writing updated configurations"));
  -[DNDSModeConfigurationsStore _lock_writeRecord:writePartition:error:](v70, "_lock_writeRecord:writePartition:error:", v74, 1, 0);

  os_unfair_lock_unlock(lock);
  -[DNDSModeConfigurationsStore _notifyDelegateOfAvailableModes](v70, "_notifyDelegateOfAvailableModes");
LABEL_71:

}

- (id)_lock_mutableExistingConfigurations
{
  void *v2;
  void *v3;

  -[DNDSModeConfigurationsStore _lock_existingConfigurations](self, "_lock_existingConfigurations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  return v3;
}

- (id)_lock_existingConfigurations
{
  DNDSBackingStore *backingStore;
  void *v4;
  id v5;
  id v7;

  os_unfair_lock_assert_owner(&self->_lock);
  backingStore = self->_backingStore;
  v7 = 0;
  -[DNDSBackingStore readRecordWithError:](backingStore, "readRecordWithError:", &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  if (v5 && os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR))
    -[DNDSModeConfigurationsStore _lock_existingConfigurations].cold.1();

  return v4;
}

- (BOOL)_lock_populateDNDSIDSRecord:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  objc_msgSend(v5, "recordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeConfigurationsStore _lock_modeConfigurationForDNDSIDSRecordID:](self, "_lock_modeConfigurationForDNDSIDSRecordID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "lastModified");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("DNDSModeConfigurationsLastModified"));

  LOBYTE(v8) = objc_msgSend(v7, "populateDNDSIDSRecord:", v5);
  return (char)v8;
}

- (int64_t)_lock_populateCKRecord:(id)a3 lastChanceRecord:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int64_t v16;

  v6 = a3;
  v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend(v6, "recordID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeConfigurationsStore _lock_modeConfigurationForCKRecordID:](self, "_lock_modeConfigurationForCKRecordID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "encryptedValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastModified");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("DNDSModeConfigurationsLastModified"));

  if (objc_msgSend(v9, "wasLastModifiedByThisDevice"))
  {
    v12 = (void *)objc_msgSend(v9, "mutableCopy");
    +[DNDSDevice currentDevice](DNDSDevice, "currentDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLastModifiedByDeviceID:", v14);

    v15 = objc_msgSend(v12, "copy");
    v9 = (void *)v15;
  }
  v16 = objc_msgSend(v9, "populateCKRecord:lastChanceRecord:", v6, v7);

  return v16;
}

- (id)_lock_modeConfigurationForDNDSIDSRecordID:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeConfigurationsStore _lock_modeConfigurationForModeIdentifier:](self, "_lock_modeConfigurationForModeIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_lock_modeConfigurationForCKRecordID:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "recordName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeConfigurationsStore _lock_modeConfigurationForModeIdentifier:](self, "_lock_modeConfigurationForModeIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_lock_modeConfigurationForModeIdentifier:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  -[DNDSModeConfigurationsStore _lock_existingConfigurations](self, "_lock_existingConfigurations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "modeConfigurationForModeIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_lock_removeModeConfigurationWithCKRecordID:(id)a3
{
  id v4;

  objc_msgSend(a3, "recordName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DNDSModeConfigurationsStore _lock_removeModeConfigurationWithModeIdentifier:](self, "_lock_removeModeConfigurationWithModeIdentifier:", v4);

}

- (void)_lock_removeModeConfigurationWithModeIdentifier:(id)a3
{
  id v4;
  void *v5;
  DNDSBackingStore *backingStore;
  id v7;
  id v8;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  -[DNDSModeConfigurationsStore _lock_mutableExistingConfigurations](self, "_lock_mutableExistingConfigurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setModeConfiguration:forModeIdentifier:", 0, v4);
  backingStore = self->_backingStore;
  v8 = 0;
  -[DNDSBackingStore writeRecord:writePartition:error:](backingStore, "writeRecord:writePartition:error:", v5, 1, &v8);
  v7 = v8;
  if (v7 && os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR))
    -[DNDSModeConfigurationsStore _lock_removeModeConfigurationWithModeIdentifier:].cold.1();

}

- (void)_lock_updateModeConfigurationWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  DNDSBackingStore *backingStore;
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v5 = (void *)DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    objc_msgSend(v4, "mode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "modeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v8;
    _os_log_impl(&dword_1CB895000, v6, OS_LOG_TYPE_DEFAULT, "Writing updated configuration with identifier: %{public}@", buf, 0xCu);

  }
  objc_msgSend(v4, "log:withMessage:", DNDSLogModeConfigurations, CFSTR("Configuration"));
  -[DNDSModeConfigurationsStore _lock_mutableExistingConfigurations](self, "_lock_mutableExistingConfigurations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "modeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setModeConfiguration:forModeIdentifier:", v4, v11);

  backingStore = self->_backingStore;
  v14 = 0;
  -[DNDSBackingStore writeRecord:writePartition:error:](backingStore, "writeRecord:writePartition:error:", v9, 1, &v14);
  v13 = v14;
  if (v13 && os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR))
    -[DNDSModeConfigurationsStore _lock_updateModeConfigurationWithConfiguration:].cold.1();

}

- (unint64_t)_lock_writeRecord:(id)a3 writePartition:(BOOL)a4 error:(id *)a5
{
  void *v7;
  uint64_t v8;
  DNDSModeConfigurationsRecordDiff *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  DNDSIDSRecordID *v29;
  DNDSIDSSyncEngine *idsSyncEngine;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  DNDSIDSRecordID *v38;
  DNDSIDSSyncEngine *v39;
  void *v40;
  unint64_t v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  DNDSSyncEngine *syncEngine;
  void *v50;
  void *v51;
  _BOOL4 v53;
  void *v54;
  id *v55;
  void *v56;
  DNDSModeConfigurationsRecordDiff *v57;
  void *v58;
  id obj;
  DNDSModeConfigurationsStore *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  DNDSIDSRecordID *v69;
  _BYTE v70[128];
  DNDSIDSRecordID *v71;
  uint8_t v72[128];
  uint8_t buf[4];
  void *v74;
  uint64_t v75;

  v53 = a4;
  v75 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(a3, "mutableCopy");
  v60 = self;
  v55 = a5;
  -[DNDSBackingStore readRecordWithError:](self->_backingStore, "readRecordWithError:", a5);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "log:withMessage:", DNDSLogModeConfigurations, CFSTR("Writing configurations"));
  v56 = (void *)v8;
  v58 = v7;
  v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneName:", CFSTR("DNDSModeConfigurations"));
  v9 = -[DNDSModeConfigurationsRecordDiff initWithOriginalModeConfigurations:updatedModeConfigurations:zone:]([DNDSModeConfigurationsRecordDiff alloc], "initWithOriginalModeConfigurations:updatedModeConfigurations:zone:", v8, v7, v54);
  v10 = (void *)DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    -[DNDSModeConfigurationsRecordDiff modifiedIDs](v9, "modifiedIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v74 = v12;
    _os_log_impl(&dword_1CB895000, v11, OS_LOG_TYPE_DEFAULT, "Merge diff modified: %{public}@", buf, 0xCu);

  }
  v13 = (void *)DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    -[DNDSModeConfigurationsRecordDiff removedIDs](v9, "removedIDs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v74 = v15;
    _os_log_impl(&dword_1CB895000, v14, OS_LOG_TYPE_DEFAULT, "Merge diff deleted: %{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v57 = v9;
  -[DNDSModeConfigurationsRecordDiff modifiedIDs](v9, "modifiedIDs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v66 != v19)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "recordName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "modeConfigurationForModeIdentifier:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v22, "mutableCopy");

        objc_msgSend(v23, "lastModified");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "earlierDate:", v16);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25 == v16)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setLastModified:", v26);

        }
        else
        {
          objc_msgSend(v23, "setLastModified:", v16);
        }
        objc_msgSend(v23, "mode");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "modeIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setModeConfiguration:forModeIdentifier:", v23, v28);

        v29 = -[DNDSIDSRecordID initWithIdentifier:zone:]([DNDSIDSRecordID alloc], "initWithIdentifier:zone:", v21, CFSTR("DNDSModeConfigurations"));
        idsSyncEngine = v60->_idsSyncEngine;
        v71 = v29;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSIDSSyncEngine addRecordIDsToSave:recordIDsToDelete:](idsSyncEngine, "addRecordIDsToSave:recordIDsToDelete:", v31, 0);

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
    }
    while (v18);
  }

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  -[DNDSModeConfigurationsRecordDiff removedIDs](v57, "removedIDs");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v62;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v62 != v35)
          objc_enumerationMutation(v32);
        objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * j), "recordName");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = -[DNDSIDSRecordID initWithIdentifier:zone:]([DNDSIDSRecordID alloc], "initWithIdentifier:zone:", v37, CFSTR("DNDSModeConfigurations"));
        v39 = v60->_idsSyncEngine;
        v69 = v38;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSIDSSyncEngine addRecordIDsToSave:recordIDsToDelete:](v39, "addRecordIDsToSave:recordIDsToDelete:", 0, v40);

      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
    }
    while (v34);
  }

  v41 = -[DNDSBackingStore writeRecord:writePartition:error:](v60->_backingStore, "writeRecord:writePartition:error:", v58, v53, v55);
  if (v55)
  {
    if (*v55)
    {
      v42 = DNDSLogModeConfigurations;
      if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR))
        -[DNDSModeConfigurationsStore _lock_writeRecord:writePartition:error:].cold.1((uint64_t)v55, v42, v43, v44, v45, v46, v47, v48);
    }
  }
  syncEngine = v60->_syncEngine;
  -[DNDSModeConfigurationsRecordDiff modifiedIDs](v57, "modifiedIDs");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeConfigurationsRecordDiff removedIDs](v57, "removedIDs");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSSyncEngine addRecordIDsToSave:recordIDsToDelete:](syncEngine, "addRecordIDsToSave:recordIDsToDelete:", v50, v51);

  return v41;
}

- (void)_lock_purgeRecordIDs:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v5 = DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v30 = v4;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Purging record IDs: %{public}@", buf, 0xCu);
  }
  -[DNDSModeConfigurationsStore _lock_mutableExistingConfigurations](self, "_lock_mutableExistingConfigurations", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1D650], "defaultModeConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v12), "recordName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "mode");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "modeIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v13, "isEqualToString:", v15);

        if (v16)
        {
          objc_msgSend(v7, "makeRecord");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "mode");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "modeIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setModeConfiguration:forModeIdentifier:", v17, v19);

        }
        else
        {
          objc_msgSend(v6, "setModeConfiguration:forModeIdentifier:", 0, v13);
        }

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v10);
  }

  v20 = *(void **)(v22 + 8);
  v23 = 0;
  objc_msgSend(v20, "writeRecord:writePartition:error:", v6, 1, &v23);
  v21 = v23;
  if (v21 && os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR))
    -[DNDSModeConfigurationsStore _lock_purgeRecordIDs:].cold.1();

}

- (void)_lock_purgeData
{
  NSObject *v3;
  void *v4;
  void *v5;
  DNDSIDSRecordID *v6;
  void *v7;
  void *v8;
  DNDSIDSRecordID *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  DNDSMutableModeConfigurationsRecord *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  DNDSBackingStore *backingStore;
  id v26;
  NSData *contactHistoryToken;
  void *v28;
  uint64_t v29;
  void *v30;
  DNDSModeConfigurationsStore *v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[8];
  _BYTE v39[128];
  _QWORD v40[3];

  v40[1] = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  v3 = DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB895000, v3, OS_LOG_TYPE_DEFAULT, "Purging data", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0D1D650], "defaultModeConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = self;
  -[DNDSModeConfigurationsStore _lock_recordIDsForIDSSyncEngine:](self, "_lock_recordIDsForIDSSyncEngine:", self->_idsSyncEngine);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [DNDSIDSRecordID alloc];
  objc_msgSend(v4, "mode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "modeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[DNDSIDSRecordID initWithIdentifier:zone:](v6, "initWithIdentifier:zone:", v8, CFSTR("DNDSModeConfigurations"));
  v40[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
  v29 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v35 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v15, "identifier", v29);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "mode");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "modeIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v16, "isEqualToString:", v18);

        if ((v19 & 1) == 0)
          objc_msgSend(v32, "addObject:", v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v12);
  }

  objc_msgSend(v4, "makeRecord");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc_init(DNDSMutableModeConfigurationsRecord);
  objc_msgSend(v4, "mode");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "modeIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableModeConfigurationsRecord setModeConfiguration:forModeIdentifier:](v21, "setModeConfiguration:forModeIdentifier:", v20, v23);

  v24 = DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB895000, v24, OS_LOG_TYPE_DEFAULT, "Replacing records with default mode configuration", buf, 2u);
  }
  backingStore = v31->_backingStore;
  v33 = 0;
  -[DNDSBackingStore writeRecord:writePartition:error:](backingStore, "writeRecord:writePartition:error:", v21, 1, &v33, v29);
  v26 = v33;
  -[DNDSIDSSyncEngine addRecordIDsToSave:recordIDsToDelete:](v31->_idsSyncEngine, "addRecordIDsToSave:recordIDsToDelete:", v30, v32);
  if (v26 && os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR))
    -[DNDSModeConfigurationsStore purgeRecordsForIDSSyncEngine:].cold.1();
  contactHistoryToken = v31->_contactHistoryToken;
  v31->_contactHistoryToken = 0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "removeObjectForKey:", CFSTR("DNDSModeConfigurationsContactHistoryToken"));

}

- (id)_lock_modeIdentifiers
{
  void *v3;
  DNDSBackingStore *backingStore;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  backingStore = self->_backingStore;
  v22 = 0;
  -[DNDSBackingStore readRecordWithError:](backingStore, "readRecordWithError:", &v22);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v22;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR))
      -[DNDSModeConfigurationsStore _lock_modeIdentifiers].cold.1();
  }
  else
  {
    objc_msgSend(v5, "modeConfigurations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "mode");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "modeIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v3, "addObject:", v13);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
      }
      while (v9);
    }

  }
  v14 = (void *)DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    v16 = objc_msgSend(v3, "count");
    *(_DWORD *)buf = 134349056;
    v24 = v16;
    _os_log_impl(&dword_1CB895000, v15, OS_LOG_TYPE_DEFAULT, "Fetched %{public}llu mode identifiers", buf, 0xCu);

  }
  return v3;
}

- (id)_lock_recordIDsForIDSSyncEngine:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  DNDSIDSRecordID *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeConfigurationsStore _lock_modeIdentifiers](self, "_lock_modeIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = -[DNDSIDSRecordID initWithIdentifier:zone:]([DNDSIDSRecordID alloc], "initWithIdentifier:zone:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9), CFSTR("DNDSModeConfigurations"));
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v7);
  }
  v11 = (void *)DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    v13 = objc_msgSend(v4, "count");
    *(_DWORD *)buf = 134349056;
    v20 = v13;
    _os_log_impl(&dword_1CB895000, v12, OS_LOG_TYPE_DEFAULT, "Fetched %{public}llu record IDs for the IDS sync engine", buf, 0xCu);

  }
  return v4;
}

- (void)_notifyDelegateOfAvailableModes
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  id WeakRetained;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[DNDSModeConfigurationsStore _lock_existingConfigurations](self, "_lock_existingConfigurations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v4, "modeConfigurations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "mode");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D1D5F0], "modeForRecord:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "isPlaceholder") & 1) == 0)
          objc_msgSend(v5, "addObject:", v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v8);
  }

  os_unfair_lock_unlock(p_lock);
  v13 = DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v5;
    _os_log_impl(&dword_1CB895000, v13, OS_LOG_TYPE_DEFAULT, "Notifying delegate of available modes: %{public}@", buf, 0xCu);
  }
  objc_msgSend(WeakRetained, "modeConfigurationStore:didUpdateAvailableModes:", self, v5);

}

- (void)_purgeData
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[DNDSModeConfigurationsStore _lock_purgeData](self, "_lock_purgeData");
  os_unfair_lock_unlock(p_lock);
  -[DNDSModeConfigurationsStore _notifyDelegateOfAvailableModes](self, "_notifyDelegateOfAvailableModes");
}

- (void)_purgeRecordIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  DNDSIDSRecordID *v12;
  void *v13;
  DNDSIDSRecordID *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[DNDSModeConfigurationsStore _lock_purgeRecordIDs:](self, "_lock_purgeRecordIDs:", v4);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v12 = [DNDSIDSRecordID alloc];
        objc_msgSend(v11, "recordName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[DNDSIDSRecordID initWithIdentifier:zone:](v12, "initWithIdentifier:zone:", v13, CFSTR("DNDSModeConfigurations"));

        objc_msgSend(v5, "addObject:", v14);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  -[DNDSIDSSyncEngine addRecordIDsToSave:recordIDsToDelete:](self->_idsSyncEngine, "addRecordIDsToSave:recordIDsToDelete:", 0, v5);
  os_unfair_lock_unlock(&self->_lock);
  -[DNDSModeConfigurationsStore _notifyDelegateOfAvailableModes](self, "_notifyDelegateOfAvailableModes");

}

- (DNDSModeConfigurationsStoreDelegate)delegate
{
  return (DNDSModeConfigurationsStoreDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setContactHistoryToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (void)setCompatibilityVersion:(id)a3
{
  objc_storeStrong((id *)&self->_compatibilityVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compatibilityVersion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_idsRecordIDsToForceSave, 0);
  objc_storeStrong((id *)&self->_ckRecordIDsToForceSave, 0);
  objc_storeStrong((id *)&self->_contactHistoryToken, 0);
  objc_storeStrong((id *)&self->_idsSyncEngine, 0);
  objc_storeStrong((id *)&self->_syncEngine, 0);
  objc_storeStrong((id *)&self->_contactMonitor, 0);
  objc_storeStrong((id *)&self->_backingStore, 0);
}

- (void)_lock_mergeLocalConfigurationRecord:withRemoteConfigurationRecord:modeIdentifier:sourceDeviceIdentifier:sourceFrameworkVersion:sourceIsCloud:sourceWantsToForce:deleteModeOnCorruption:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Fetched data with ID %{public}@ could not be reconstructed into a configuration; deleting local configuration",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1();
}

- (void)_lock_mergeLocalConfigurationRecord:withRemoteConfigurationRecord:modeIdentifier:sourceDeviceIdentifier:sourceFrameworkVersion:sourceIsCloud:sourceWantsToForce:deleteModeOnCorruption:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Fetched data with ID %{public}@ could not be reconstructed into a configuration; ignoring update",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1();
}

- (void)syncEngine:(void *)a1 failedToDeleteRecordWithID:(void *)a2 error:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[14];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  objc_msgSend(a2, "recordName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  v9 = a3;
  OUTLINED_FUNCTION_7(&dword_1CB895000, v5, v7, "Failed to delete record %{public}@: %{public}@", v8);

}

- (void)purgeRecordsForIDSSyncEngine:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Error deleting records: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)monitoredContacts
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Could not read current configuration for monitored contacts: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_lock_existingConfigurations
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Failed to fetch existing configurations: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_lock_removeModeConfigurationWithModeIdentifier:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_1();
  v3 = v0;
  OUTLINED_FUNCTION_7(&dword_1CB895000, v1, (uint64_t)v1, "Failed to remove record %{public}@: %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_lock_updateModeConfigurationWithConfiguration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Error writing fetched configurations: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_lock_writeRecord:(uint64_t)a3 writePartition:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CB895000, a2, a3, "Error writing record: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_lock_purgeRecordIDs:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Error purging record IDs: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_lock_modeIdentifiers
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Could not read records to extract mode identifiers: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
