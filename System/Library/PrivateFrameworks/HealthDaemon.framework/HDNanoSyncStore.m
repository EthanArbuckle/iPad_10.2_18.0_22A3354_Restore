@implementation HDNanoSyncStore

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (HKNanoSyncPairedDeviceInfo)deviceInfo
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB6910]);
  -[HDNanoSyncStore sourceBundleIdentifier](self, "sourceBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithSourceBundleIdentifier:systemBuildVersion:productType:active:restoreComplete:protocolVersion:", v4, self->_remoteSystemBuildVersion, self->_remoteProductType, -[HDNanoSyncStore isActive](self, "isActive"), -[HDNanoSyncStore isRestoreComplete](self, "isRestoreComplete"), self->_protocolVersion);

  return (HKNanoSyncPairedDeviceInfo *)v5;
}

- (NSString)sourceBundleIdentifier
{
  return -[HDNanoPairingEntity defaultSourceBundleIdentifier](self->_pairingEntity, "defaultSourceBundleIdentifier");
}

- (BOOL)isRestoreComplete
{
  return self->_restoreState == 3;
}

- (int64_t)restoreState
{
  return self->_restoreState;
}

- (NSUUID)nanoRegistryUUID
{
  return -[HDNanoPairingEntity nanoRegistryUUID](self->_pairingEntity, "nanoRegistryUUID");
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  NRDevice *nanoRegistryDevice;
  void *v6;
  const char *v7;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (self)
    nanoRegistryDevice = self->_nanoRegistryDevice;
  else
    nanoRegistryDevice = 0;
  -[NRDevice hd_productType](nanoRegistryDevice, "hd_productType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_active)
    v7 = "active";
  else
    v7 = "inactive";
  if (-[HDNanoSyncStore isAltAccount](self, "isAltAccount"))
    v8 = "alt account";
  else
    v8 = "standard account";
  -[HDNanoSyncStore nanoRegistryUUID](self, "nanoRegistryUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDNanoSyncStore device](self, "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hd_deviceIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p \"%@\" (%s) (%s) registry-id:%@ device-id:%@>"), v4, self, v6, v7, v8, v10, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (NSString)deviceName
{
  return (NSString *)-[NRDevice hd_name](self->_nanoRegistryDevice, "hd_name");
}

- (IDSDevice)device
{
  return self->_identityServicesDevice;
}

- (BOOL)enforceSyncEntityOrdering
{
  return 1;
}

- (id)orderedSyncEntities
{
  NSArray *orderedSyncEntities;
  id WeakRetained;
  void *v5;
  NSArray *v6;
  NSArray *v7;
  _QWORD v9[5];

  orderedSyncEntities = self->_orderedSyncEntities;
  if (!orderedSyncEntities)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    +[HDNanoSyncStore orderedSyncEntitiesForProfile:protocolVersion:companion:](HDNanoSyncStore, "orderedSyncEntitiesForProfile:protocolVersion:companion:", WeakRetained, self->_protocolVersion, self->_master);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __38__HDNanoSyncStore_orderedSyncEntities__block_invoke;
    v9[3] = &unk_1E6CFC3C8;
    v9[4] = self;
    objc_msgSend(v5, "hk_filter:", v9);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_orderedSyncEntities;
    self->_orderedSyncEntities = v6;

    orderedSyncEntities = self->_orderedSyncEntities;
  }
  return orderedSyncEntities;
}

- (id)syncEntityDependenciesForSyncEntity:(Class)a3
{
  return (id)-[objc_class syncEntityDependenciesForSyncProtocolVersion:](a3, "syncEntityDependenciesForSyncProtocolVersion:", self->_protocolVersion);
}

- (int)protocolVersion
{
  return self->_protocolVersion;
}

- (int64_t)syncProvenance
{
  return -[HDNanoPairingEntity syncProvenance](self->_pairingEntity, "syncProvenance");
}

- (NSUUID)persistentUUID
{
  return -[HDNanoPairingEntity persistentUUID](self->_pairingEntity, "persistentUUID");
}

- (NSUUID)healthUUID
{
  return -[HDNanoPairingEntity healthDatabaseUUID](self->_pairingEntity, "healthDatabaseUUID");
}

- (id)createRequestWithMessageID:(unsigned __int16)a3
{
  uint64_t v3;
  HDIDSParticipant *v5;
  void *v6;
  int v7;
  int v8;
  double v9;
  double v10;

  v3 = a3;
  v5 = -[HDIDSParticipant initWithDevice:]([HDIDSParticipant alloc], "initWithDevice:", self->_identityServicesDevice);
  +[HDIDSOutgoingRequest requestWithMessageID:participant:](HDIDSOutgoingRequest, "requestWithMessageID:participant:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HDNanoSyncStore isMaster](self, "isMaster"))
    v7 = !-[HDNanoSyncStore isActive](self, "isActive");
  else
    v7 = 0;
  v8 = objc_msgSend(v6, "messageID");
  v9 = 300.0;
  switch(v8)
  {
    case 13:
      v10 = 0.0;
      break;
    case 7:
      v10 = 0.0;
      v9 = 172800.0;
      break;
    case 2:
      if (v7)
        v9 = 172800.0;
      else
        v9 = 3600.0;
      if (v7)
        v10 = 172800.0;
      else
        v10 = 7200.0;
      break;
    default:
      v10 = 600.0;
      break;
  }
  objc_msgSend(v6, "setForceLocalDelivery:", 1);
  objc_msgSend(v6, "setSendTimeout:", v9);
  objc_msgSend(v6, "setResponseTimeout:", v10);

  return v6;
}

- (BOOL)isMaster
{
  return self->_master;
}

- (BOOL)validatePairingUUIDsWithIncomingMessage:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v6 = a3;
  objc_msgSend(v6, "decodedPersistentPairingUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "decodedHealthPairingUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDNanoSyncStore persistentUUID](self, "persistentUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 != v9)
  {
    -[HDNanoSyncStore persistentUUID](self, "persistentUUID");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v11 = 0;
      goto LABEL_13;
    }
    v3 = (void *)v10;
    -[HDNanoSyncStore persistentUUID](self, "persistentUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "isEqual:", v4))
    {
      v11 = 0;
LABEL_12:

      goto LABEL_13;
    }
  }
  -[HDNanoSyncStore healthUUID](self, "healthUUID");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v8 == (void *)v12)
  {

    v11 = 1;
  }
  else
  {
    v13 = (void *)v12;
    -[HDNanoSyncStore healthUUID](self, "healthUUID");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      -[HDNanoSyncStore healthUUID](self, "healthUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v8, "isEqual:", v16);

    }
    else
    {

      v11 = 0;
    }
  }
  if (v7 != v9)
    goto LABEL_12;
LABEL_13:

  return v11;
}

- (void)didReceiveRequestWithChangeSet:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  os_log_t *v9;
  os_log_t v10;
  double v11;
  os_log_t v12;
  NSUUID *lastIncompleteIncomingSyncUUID;
  NSUUID *v14;
  NSDate *lastIncompleteIncomingSyncDate;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "statusCode");
  objc_msgSend(v4, "decodedSessionUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodedSessionStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodedSessionError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (os_log_t *)MEMORY[0x1E0CB5370];
  if (v8 && (_HKInitializeLogging(), v10 = *v9, os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR)))
  {
    v19 = v10;
    objc_msgSend(v6, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v20;
    v23 = 2114;
    v24 = v8;
    _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "incoming sync session %{public}@ error: %{public}@", (uint8_t *)&v21, 0x16u);

    if (!v6)
      goto LABEL_6;
  }
  else if (!v6)
  {
    goto LABEL_6;
  }
  if (!v7 || (objc_msgSend(v7, "timeIntervalSinceNow"), v11 > 3600.0))
  {
LABEL_6:
    _HKInitializeLogging();
    v12 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
    {
      v17 = v12;
      objc_msgSend(v6, "UUIDString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v18;
      v23 = 2114;
      v24 = v7;
      _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, "unexpected session UUID (%{public}@) or date (%{public}@) in change set", (uint8_t *)&v21, 0x16u);

    }
    goto LABEL_8;
  }
  lastIncompleteIncomingSyncUUID = self->_lastIncompleteIncomingSyncUUID;
  if (!lastIncompleteIncomingSyncUUID
    || (-[NSUUID isEqual:](lastIncompleteIncomingSyncUUID, "isEqual:", v6) & 1) != 0
    || objc_msgSend(v7, "hk_isAfterDate:", self->_lastIncompleteIncomingSyncDate))
  {
    if ((v5 - 2) >= 2)
    {
      if (v5 == 1)
      {
        objc_storeStrong((id *)&self->_lastIncompleteIncomingSyncUUID, v6);
        objc_storeStrong((id *)&self->_lastIncompleteIncomingSyncDate, v7);
      }
      else
      {
        _HKInitializeLogging();
        v16 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
        {
          v21 = 67109120;
          LODWORD(v22) = v5;
          _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "unexpected change set status code %d", (uint8_t *)&v21, 8u);
        }
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_lastCompleteIncomingSyncDate, v7);
      objc_storeStrong((id *)&self->_lastCompleteIncomingSyncError, v8);
      v14 = self->_lastIncompleteIncomingSyncUUID;
      self->_lastIncompleteIncomingSyncUUID = 0;

      lastIncompleteIncomingSyncDate = self->_lastIncompleteIncomingSyncDate;
      self->_lastIncompleteIncomingSyncDate = 0;

      -[HDNanoSyncStore _notifyIncomingSyncObservers]((uint64_t)self);
    }
  }
LABEL_8:

}

- (void)_notifyIncomingSyncObservers
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 80), "dateByAddingTimeInterval:", 30.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 56);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __47__HDNanoSyncStore__notifyIncomingSyncObservers__block_invoke;
    v7[3] = &unk_1E6D0EFC0;
    v8 = v3;
    v9 = v2;
    v5 = v2;
    v6 = v3;
    objc_msgSend(v4, "hk_removeObjectsPassingTest:", v7);

  }
}

- (void)configureOutgoingResponse:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setForceLocalDelivery:", 1);
  objc_msgSend(v3, "setSendTimeout:", 300.0);

}

+ (id)_observedDeviceProperties
{
  uint64_t v0;
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v0 = *MEMORY[0x1E0D51728];
  v2[0] = *MEMORY[0x1E0D51760];
  v2[1] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldEnforceSequenceOrdering
{
  return 1;
}

- (int64_t)expectedSequenceNumberForSyncEntityClass:(Class)a3
{
  NSMutableDictionary *expectedSequenceNumbers;
  void *v4;
  void *v5;
  int64_t v6;

  expectedSequenceNumbers = self->_expectedSequenceNumbers;
  NSStringFromClass(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](expectedSequenceNumbers, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  return v6;
}

- (void)setExpectedSequenceNumber:(int64_t)a3 forSyncEntityClass:(Class)a4
{
  NSMutableDictionary *v7;
  NSMutableDictionary *expectedSequenceNumbers;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  if (!self->_expectedSequenceNumbers)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    expectedSequenceNumbers = self->_expectedSequenceNumbers;
    self->_expectedSequenceNumbers = v7;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v9 = self->_expectedSequenceNumbers;
  NSStringFromClass(a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v11, v10);

}

- (id)_initWithIdentityServicesDevice:(void *)a3 nanoRegistryDevice:(void *)a4 pairingEntity:(void *)a5 obliteratedDatabaseUUIDs:(int)a6 protocolVersion:(void *)a7 delegate:(void *)a8 profile:(char)a9 tinkerPairing:
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  int v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v35;
  void *v36;
  void *v37;
  id v39;
  objc_super v40;

  v16 = a2;
  v17 = a3;
  v18 = a4;
  v39 = a5;
  v19 = a7;
  v20 = a8;
  if (!a1)
    goto LABEL_11;
  if (v17)
  {
    if (v16)
      goto LABEL_4;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithIdentityServicesDevice_nanoRegistryDevice_pairingEntity_obliteratedDatabaseUUIDs_protocolVersion_delegate_profile_tinkerPairing_, a1, CFSTR("HDNanoSyncStore.m"), 115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identityServicesDevice != nil"));

    if (v18)
      goto LABEL_5;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithIdentityServicesDevice_nanoRegistryDevice_pairingEntity_obliteratedDatabaseUUIDs_protocolVersion_delegate_profile_tinkerPairing_, a1, CFSTR("HDNanoSyncStore.m"), 114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("registryDevice != nil"));

  if (!v16)
    goto LABEL_13;
LABEL_4:
  if (v18)
    goto LABEL_5;
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithIdentityServicesDevice_nanoRegistryDevice_pairingEntity_obliteratedDatabaseUUIDs_protocolVersion_delegate_profile_tinkerPairing_, a1, CFSTR("HDNanoSyncStore.m"), 116, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pairingEntity != nil"));

LABEL_5:
  v40.receiver = a1;
  v40.super_class = (Class)HDNanoSyncStore;
  v21 = (id *)objc_msgSendSuper2(&v40, sel_init);
  a1 = v21;
  if (v21)
  {
    objc_storeWeak(v21 + 1, v20);
    objc_storeWeak(a1 + 17, v19);
    *((_BYTE *)a1 + 114) = objc_msgSend(v19, "isMaster");
    objc_msgSend(v17, "hd_systemBuildVersion");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = a1[2];
    a1[2] = (id)v22;

    objc_msgSend(v17, "hd_productType");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = a1[3];
    a1[3] = (id)v24;

    v26 = objc_msgSend(v39, "copy");
    v27 = a1[20];
    a1[20] = (id)v26;

    *((_DWORD *)a1 + 12) = a6;
    *((_BYTE *)a1 + 52) = objc_msgSend(v16, "isActive");
    v28 = objc_msgSend(v18, "isRestoreComplete");
    v29 = 3;
    if (!v28)
      v29 = 1;
    a1[18] = (id)v29;
    objc_storeStrong(a1 + 16, a3);
    objc_storeStrong(a1 + 4, a4);
    *((_BYTE *)a1 + 112) = a9;
    if ((a9 & 1) == 0)
    {
      v30 = a1[16];
      +[HDNanoSyncStore _observedDeviceProperties]();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addPropertyObserver:forPropertyChanges:", a1, v31);

    }
    objc_storeStrong(a1 + 15, a2);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = a1[5];
    a1[5] = (id)v32;

  }
LABEL_11:

  return a1;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDNanoSyncStore.m"), 166, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_invalidated"));

  }
  v5.receiver = self;
  v5.super_class = (Class)HDNanoSyncStore;
  -[HDNanoSyncStore dealloc](&v5, sel_dealloc);
}

+ (HDNanoSyncStore)nanoSyncStoreWithProfile:(id)a3 device:(id)a4 delegate:(id)a5 tinkerPaired:(BOOL)a6
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id *v17;
  id *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  id *v42;
  const char *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  int v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  int v59;
  uint64_t v60;
  void *v61;
  void *v62;
  char v63;
  int v64;
  void *v65;
  void *v66;
  void *v67;
  char v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  char v73;
  void *v74;
  void *v75;
  char v76;
  void *v77;
  id *v78;
  uint64_t v79;
  void *v80;
  NSObject *v81;
  _BOOL4 v82;
  void *v83;
  void *v84;
  void *v85;
  HDNanoSyncStore *v86;
  void *v87;
  void *v88;
  id *v89;
  void *v90;
  NSObject *v92;
  id *v93;
  NSObject *v94;
  id *v95;
  NSObject *v96;
  id *v97;
  NSObject *v98;
  id *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id *v104;
  void *v105;
  NSObject *v106;
  void *v107;
  uint64_t v108;
  id v109;
  void *v110;
  int v111;
  void *v112;
  void *v113;
  id *v114;
  void *v115;
  void *v116;
  id v117;
  int v118;
  int v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  id v125;
  id v126;
  id v127;
  uint8_t buf[4];
  id *v129;
  __int16 v130;
  uint64_t v131;
  uint64_t v132;

  v132 = *MEMORY[0x1E0C80C00];
  if (!a6)
  {
    v8 = a3;
    v9 = a4;
    v10 = a5;
    v22 = objc_opt_self();
    if (v9)
    {
      if (v10)
        goto LABEL_10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "handleFailureInMethod:object:file:lineNumber:description:", sel__nanoSyncStoreWithProfile_device_delegate_, v22, CFSTR("HDNanoSyncStore.m"), 230, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identityServicesDevice != nil"));

      if (v10)
        goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "handleFailureInMethod:object:file:lineNumber:description:", sel__nanoSyncStoreWithProfile_device_delegate_, v22, CFSTR("HDNanoSyncStore.m"), 231, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate != nil"));

LABEL_10:
    objc_msgSend(v8, "daemon");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "nanoPairedDeviceRegistry");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "hd_deviceForIDSDevice:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      _HKInitializeLogging();
      v44 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v41 = v44;
        objc_msgSend(v9, "hd_shortDescription");
        v42 = (id *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v129 = v42;
        v43 = "unable to find NanoRegistry device for IDS device %{public}@";
        goto LABEL_29;
      }
LABEL_33:
      v18 = 0;
      goto LABEL_108;
    }
    objc_msgSend(v14, "valueForProperty:", *MEMORY[0x1E0D516E8]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "BOOLValue");

    if ((v25 & 1) == 0)
    {
      _HKInitializeLogging();
      v45 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v41 = v45;
        objc_msgSend(v9, "hd_shortDescription");
        v42 = (id *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v129 = v42;
        _os_log_impl(&dword_1B7802000, v41, OS_LOG_TYPE_DEFAULT, "NanoRegistry device for IDS device %{public}@ is not paired", buf, 0xCu);
        goto LABEL_32;
      }
      goto LABEL_33;
    }
    objc_msgSend(v14, "hd_pairingID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      _HKInitializeLogging();
      v47 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v92 = v47;
        objc_msgSend(v14, "hd_shortDescription");
        v93 = (id *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v129 = v93;
        _os_log_error_impl(&dword_1B7802000, v92, OS_LOG_TYPE_ERROR, "missing pairing ID for NanoRegistry device %{public}@", buf, 0xCu);

      }
      v18 = 0;
      goto LABEL_107;
    }
    v27 = objc_msgSend(v10, "isMaster");
    objc_msgSend(v14, "hd_systemBuildVersion");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v29 = objc_msgSend(MEMORY[0x1E0CB6F18], "nanoSyncProtocolVersionForWatchSystemBuildVersion:", v28);
      if (v29 >= 6)
      {
        v111 = v29;
        v115 = v28;
        objc_msgSend(v12, "healthDomainAccessorWithPairedDevice:", v14);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringForKey:", CFSTR("LastRegistryUUID"));
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = v26;
        v33 = (void *)v31;
        v120 = v32;
        objc_msgSend(v32, "UUIDString");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v116 = v33;
        v122 = v34;
        if (v33)
        {
          v35 = v34;
          if (!objc_msgSend(v34, "isEqualToString:", v33))
          {
            v124 = 0;
            v39 = 0;
            if (v35 == v33)
              goto LABEL_51;
            goto LABEL_47;
          }
        }
        objc_msgSend(v30, "stringForKey:", CFSTR("PersistentPairingUUID"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
        {
          v37 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v36);
          if (v37)
          {
LABEL_22:
            objc_msgSend(v30, "stringForKey:", CFSTR("DeviceSourceIdentifier"));
            v124 = (void *)objc_claimAutoreleasedReturnValue();

            v39 = (void *)v37;
            if (v122 == v33)
              goto LABEL_48;
            if (!v33)
            {
LABEL_50:
              objc_msgSend(v30, "setObject:forKey:", v122, CFSTR("LastRegistryUUID"));
              if (v39)
              {
LABEL_52:
                v53 = v39;
                objc_msgSend(v30, "synchronize");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                if (v54)
                {
                  _HKInitializeLogging();
                  v55 = (void *)*MEMORY[0x1E0CB5370];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
                  {
                    v98 = v55;
                    v99 = (id *)objc_opt_class();
                    *(_DWORD *)buf = 138543618;
                    v129 = v99;
                    v130 = 2114;
                    v131 = (uint64_t)v54;
                    v114 = v99;
                    _os_log_error_impl(&dword_1B7802000, v98, OS_LOG_TYPE_ERROR, "failed to synchronize %{public}@: %{public}@", buf, 0x16u);

                  }
                  v124 = 0;
                  v53 = 0;
                }

                v39 = v53;
                v33 = v116;
                goto LABEL_57;
              }
LABEL_51:
              v50 = v120;
              objc_msgSend(MEMORY[0x1E0CB6C18], "_generateIdentifierForAppleDeviceWithUUID:", v50);
              v51 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v50, "UUIDString");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "setObject:forKey:", v52, CFSTR("PersistentPairingUUID"));

              v39 = v50;
              objc_msgSend(v30, "setObject:forKey:", v51, CFSTR("DeviceSourceIdentifier"));
              v124 = (void *)v51;
              goto LABEL_52;
            }
LABEL_47:
            if (!objc_msgSend(v122, "isEqualToString:", v33))
              goto LABEL_50;
LABEL_48:
            if (v39)
            {
LABEL_57:
              objc_msgSend(v30, "stringArrayForKey:", CFSTR("ObliteratedDatabaseUUIDs"));
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "hk_map:", &__block_literal_global_231);
              v112 = (void *)objc_claimAutoreleasedReturnValue();

              v26 = v120;
LABEL_58:
              objc_msgSend(v8, "database");
              v123 = (void *)objc_claimAutoreleasedReturnValue();
              v127 = 0;
              +[HDNanoPairingEntity nanoPairingEntityWithRegistryUUID:profile:error:](HDNanoPairingEntity, "nanoPairingEntityWithRegistryUUID:profile:error:", v26, v8, &v127);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v58 = v127;
              if (v57)
                v59 = v27;
              else
                v59 = 0;
              v113 = v39;
              if (!v39 || !v59)
              {
                v117 = v58;
LABEL_97:
                if (v57)
                {
                  v86 = [HDNanoSyncStore alloc];
                  if (v112)
                    v87 = v112;
                  else
                    v87 = (void *)MEMORY[0x1E0C9AA60];
                  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v87);
                  v88 = (void *)objc_claimAutoreleasedReturnValue();
                  v89 = -[HDNanoSyncStore _initWithIdentityServicesDevice:nanoRegistryDevice:pairingEntity:obliteratedDatabaseUUIDs:protocolVersion:delegate:profile:tinkerPairing:]((id *)&v86->super.isa, v9, v14, v57, v88, v111, v10, v8, 0);

                }
                else
                {
                  _HKInitializeLogging();
                  v90 = (void *)*MEMORY[0x1E0CB5370];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
                  {
                    v96 = v90;
                    objc_msgSend(v9, "hd_shortDescription");
                    v97 = (id *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v129 = v97;
                    v130 = 2114;
                    v131 = (uint64_t)v117;
                    _os_log_error_impl(&dword_1B7802000, v96, OS_LOG_TYPE_ERROR, "failed to create sync store for IDS device %{public}@: %{public}@", buf, 0x16u);

                  }
                  v89 = 0;
                }
                v18 = v89;

                v28 = v115;
LABEL_106:

LABEL_107:
                goto LABEL_108;
              }
              v107 = v58;
              objc_msgSend(v57, "persistentUUID");
              v60 = objc_claimAutoreleasedReturnValue();
              v121 = v26;
              if ((void *)v60 == v39)
              {

              }
              else
              {
                v61 = (void *)v60;
                objc_msgSend(v57, "persistentUUID");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                v63 = objc_msgSend(v62, "isEqual:", v39);

                if ((v63 & 1) == 0)
                {
                  objc_msgSend(v57, "setPersistentUUID:", v39);
                  objc_msgSend(v57, "setRestoreComplete:", 0);
                  v64 = 1;
                  goto LABEL_69;
                }
              }
              v64 = 0;
LABEL_69:
              objc_msgSend(v57, "defaultSourceBundleIdentifier");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              if (v65 == v124)
              {

                goto LABEL_76;
              }
              v66 = v65;
              if (v124)
              {
                objc_msgSend(v57, "defaultSourceBundleIdentifier");
                v118 = v64;
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                v68 = objc_msgSend(v67, "isEqualToString:", v124);

                v64 = v118;
                if ((v68 & 1) != 0)
                {
LABEL_76:
                  objc_msgSend(v9, "hd_deviceIdentifier");
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v57, "deviceIdentifier");
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  v110 = v69;
                  if (v70 == v69)
                  {

                    goto LABEL_83;
                  }
                  v71 = v70;
                  if (v69)
                  {
                    objc_msgSend(v57, "deviceIdentifier");
                    v119 = v64;
                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                    v73 = objc_msgSend(v72, "isEqualToString:", v69);

                    v64 = v119;
                    if ((v73 & 1) != 0)
                    {
LABEL_83:
                      objc_msgSend(v57, "healthDatabaseUUID");
                      v74 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v74)
                      {
                        if (!v64)
                        {
                          v117 = v107;
LABEL_89:
                          objc_msgSend(v8, "sourceManager");
                          v77 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v14, "hd_name");
                          v78 = (id *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v14, "hd_productType");
                          v79 = objc_claimAutoreleasedReturnValue();
                          v80 = (void *)v79;
                          if (!v78 || !v79)
                          {
                            v108 = v79;
                            _HKInitializeLogging();
                            v81 = *MEMORY[0x1E0CB5370];
                            v82 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR);
                            v80 = (void *)v108;
                            if (v82)
                            {
                              *(_DWORD *)buf = 138543618;
                              v129 = v78;
                              v130 = 2114;
                              v131 = v108;
                              _os_log_error_impl(&dword_1B7802000, v81, OS_LOG_TYPE_ERROR, "unexpectedly nil NRDevice properties: name=\"%{public}@\", productType=\"%{public}@\", buf, 0x16u);
                              v80 = (void *)v108;
                            }
                          }
                          v125 = 0;
                          v83 = v39;
                          v84 = v80;
                          objc_msgSend(v77, "sourceForAppleDeviceWithUUID:identifier:name:productType:createIfNecessary:error:", v83, v124, v78, v80, 1, &v125);
                          v85 = (void *)objc_claimAutoreleasedReturnValue();
                          v109 = v125;
                          if (!v85)
                          {
                            _HKInitializeLogging();
                            v105 = (void *)*MEMORY[0x1E0CB5370];
                            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
                            {
                              v106 = v105;
                              objc_msgSend(v14, "hd_shortDescription");
                              v104 = (id *)objc_claimAutoreleasedReturnValue();
                              *(_DWORD *)buf = 138543618;
                              v129 = v104;
                              v130 = 2114;
                              v131 = (uint64_t)v109;
                              _os_log_error_impl(&dword_1B7802000, v106, OS_LOG_TYPE_ERROR, "failed to get source for paired device %{public}@: %{public}@", buf, 0x16u);

                            }
                          }

                          v26 = v121;
                          goto LABEL_97;
                        }
                      }
                      else
                      {
                        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
                        v75 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v57, "setHealthDatabaseUUID:", v75);

                      }
                      v126 = v107;
                      v76 = objc_msgSend(v57, "saveWithHealthDatabase:error:", v123, &v126);
                      v117 = v126;

                      if ((v76 & 1) == 0)
                      {

                        v57 = 0;
                      }
                      goto LABEL_89;
                    }
                  }
                  else
                  {

                  }
                  objc_msgSend(v57, "setDeviceIdentifier:", v110);
                  v64 = 1;
                  goto LABEL_83;
                }
              }
              else
              {

              }
              objc_msgSend(v57, "setDefaultSourceBundleIdentifier:", v124);
              v64 = 1;
              goto LABEL_76;
            }
            goto LABEL_51;
          }
          _HKInitializeLogging();
          v38 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v129 = (id *)v36;
            _os_log_error_impl(&dword_1B7802000, v38, OS_LOG_TYPE_ERROR, "invalid persistent pairing UUID string \"%{public}@\" in NPS", buf, 0xCu);
          }
        }
        v37 = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v48 = objc_msgSend(MEMORY[0x1E0CB6F18], "nanoSyncProtocolVersionForCompanionSystemBuildVersion:", v28);
      if (v48 > 7)
      {
        v111 = v48;
        v115 = v28;
        v112 = 0;
        v124 = 0;
        v39 = 0;
        goto LABEL_58;
      }
    }
    _HKInitializeLogging();
    v49 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v94 = v49;
      objc_msgSend(v9, "hd_shortDescription");
      v95 = (id *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v129 = v95;
      v130 = 2114;
      v131 = (uint64_t)v28;
      _os_log_error_impl(&dword_1B7802000, v94, OS_LOG_TYPE_ERROR, "IDS device %{public}@ has unsupported system build version %{public}@", buf, 0x16u);

    }
    v18 = 0;
    goto LABEL_106;
  }
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_opt_self();
  if (v9)
  {
    if (v10)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "handleFailureInMethod:object:file:lineNumber:description:", sel__tinkerNanoSyncStoreWithProfile_device_delegate_, v11, CFSTR("HDNanoSyncStore.m"), 189, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("idsDevice != nil"));

    if (v10)
      goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "handleFailureInMethod:object:file:lineNumber:description:", sel__tinkerNanoSyncStoreWithProfile_device_delegate_, v11, CFSTR("HDNanoSyncStore.m"), 190, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate != nil"));

LABEL_4:
  objc_msgSend(v8, "daemon");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "nanoPairedDeviceRegistry");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hd_deviceForIDSDevice:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    _HKInitializeLogging();
    v40 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v41 = v40;
      objc_msgSend(v9, "hd_shortDescription");
      v42 = (id *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v129 = v42;
      v43 = "Unable to find NanoRegistry device for IDS device %{public}@ (#t0)";
LABEL_29:
      _os_log_error_impl(&dword_1B7802000, v41, OS_LOG_TYPE_ERROR, v43, buf, 0xCu);
LABEL_32:

      goto LABEL_33;
    }
    goto LABEL_33;
  }
  objc_msgSend(v14, "hd_pairingID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = 0;
  +[HDNanoPairingEntity nanoPairingEntityWithRegistryUUID:profile:error:](HDNanoPairingEntity, "nanoPairingEntityWithRegistryUUID:profile:error:", v15, v8, &v127);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id *)v127;

  if (v16)
  {
    v18 = -[HDNanoSyncStore _initWithIdentityServicesDevice:nanoRegistryDevice:pairingEntity:obliteratedDatabaseUUIDs:protocolVersion:delegate:profile:tinkerPairing:]((id *)[HDNanoSyncStore alloc], v9, v14, v16, 0, 16, v10, v8, 1);
    _HKInitializeLogging();
    v19 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      objc_msgSend(v9, "hd_shortDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v129 = v18;
      v130 = 2114;
      v131 = (uint64_t)v21;
      _os_log_impl(&dword_1B7802000, v20, OS_LOG_TYPE_DEFAULT, "Created sync store %{public}@ for IDS device %{public}@ (#t0)", buf, 0x16u);

    }
  }
  else
  {
    _HKInitializeLogging();
    v46 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v129 = v17;
      _os_log_error_impl(&dword_1B7802000, v46, OS_LOG_TYPE_ERROR, "Unable to create entity for pairing %{public}@ (#t0)", buf, 0xCu);
    }
    v18 = 0;
  }

LABEL_108:
  return (HDNanoSyncStore *)v18;
}

id __61__HDNanoSyncStore__nanoSyncStoreWithProfile_device_delegate___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CB3A28];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithUUIDString:", v3);

  return v4;
}

- (id)nanoSyncStoreForProtocolVersion:(int)a3
{
  HDNanoSyncStore *v5;
  IDSDevice *identityServicesDevice;
  NRDevice *nanoRegistryDevice;
  HDNanoPairingEntity *pairingEntity;
  NSSet *obliteratedDatabaseUUIDs;
  id WeakRetained;
  id v11;
  id *v12;

  v5 = [HDNanoSyncStore alloc];
  identityServicesDevice = self->_identityServicesDevice;
  nanoRegistryDevice = self->_nanoRegistryDevice;
  pairingEntity = self->_pairingEntity;
  obliteratedDatabaseUUIDs = self->_obliteratedDatabaseUUIDs;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = objc_loadWeakRetained((id *)&self->_profile);
  v12 = -[HDNanoSyncStore _initWithIdentityServicesDevice:nanoRegistryDevice:pairingEntity:obliteratedDatabaseUUIDs:protocolVersion:delegate:profile:tinkerPairing:]((id *)&v5->super.isa, identityServicesDevice, nanoRegistryDevice, pairingEntity, obliteratedDatabaseUUIDs, a3, WeakRetained, v11, self->_isTinkerPairing);

  return v12;
}

- (void)invalidate
{
  NRDevice *nanoRegistryDevice;
  void *v5;
  void *v6;
  HDNanoSyncRestoreSession *restoreSession;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableArray *incomingSyncObserverTimers;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    objc_storeWeak((id *)&self->_delegate, 0);
    nanoRegistryDevice = self->_nanoRegistryDevice;
    +[HDNanoSyncStore _observedDeviceProperties]();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NRDevice removePropertyObserver:forPropertyChanges:](nanoRegistryDevice, "removePropertyObserver:forPropertyChanges:", self, v5);

    if (self->_restoreSession)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Canceled by invalidation"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDNanoSyncStore finishRestoreSessionWithError:](self, "finishRestoreSessionWithError:", v6);

      restoreSession = self->_restoreSession;
      self->_restoreSession = 0;

    }
    if (-[NSMutableArray count](self->_incomingSyncObserverTimers, "count"))
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = objc_opt_class();
      -[HDNanoSyncStore nanoRegistryUUID](self, "nanoRegistryUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v9, a2, CFSTR("Sync store for device with pairingID \"%@\" was invalidated"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v12 = self->_incomingSyncObserverTimers;
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v19;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v19 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v16++), "invalidateAndInvokeCompletionWithError:", v11);
          }
          while (v14 != v16);
          v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v14);
      }

      incomingSyncObserverTimers = self->_incomingSyncObserverTimers;
      self->_incomingSyncObserverTimers = 0;

    }
  }
}

- (void)prepareForObliteration
{
  void *v3;
  NSSet *v4;
  NSSet *obliteratedDatabaseUUIDs;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  -[HDNanoPairingEntity healthDatabaseUUID](self->_pairingEntity, "healthDatabaseUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v12 = v3;
    -[NSSet setByAddingObject:](self->_obliteratedDatabaseUUIDs, "setByAddingObject:", v3);
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
    obliteratedDatabaseUUIDs = self->_obliteratedDatabaseUUIDs;
    self->_obliteratedDatabaseUUIDs = v4;

    -[NSSet allObjects](self->_obliteratedDatabaseUUIDs, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hk_map:", &__block_literal_global_233_1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDNanoSyncStore profile](self, "profile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "daemon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "healthDomainAccessorWithPairedDevice:", self->_nanoRegistryDevice);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(v10, "setObject:forKey:", v7, CFSTR("ObliteratedDatabaseUUIDs"));
    else
      objc_msgSend(v10, "removeObjectForKey:", CFSTR("ObliteratedDatabaseUUIDs"));
    v11 = (id)objc_msgSend(v10, "synchronize");

    v3 = v12;
  }

}

uint64_t __41__HDNanoSyncStore_prepareForObliteration__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUIDString");
}

- (id)profile
{
  return objc_loadWeakRetained((id *)&self->_profile);
}

- (NSString)remoteSystemBuildVersion
{
  return self->_remoteSystemBuildVersion;
}

- (NSString)remoteProductType
{
  return self->_remoteProductType;
}

- (NSDate)lastInactiveDate
{
  return (NSDate *)-[NRDevice hd_lastInactiveDate](self->_nanoRegistryDevice, "hd_lastInactiveDate");
}

- (int64_t)syncStoreType
{
  return 1;
}

- (BOOL)isAltAccount
{
  return -[NRDevice hd_isAltAccount](self->_nanoRegistryDevice, "hd_isAltAccount");
}

- (void)setHealthUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  -[HDNanoPairingEntity healthDatabaseUUID](self->_pairingEntity, "healthDatabaseUUID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v9)
  {

  }
  else
  {
    v5 = v4;
    if (v9)
    {
      -[HDNanoPairingEntity healthDatabaseUUID](self->_pairingEntity, "healthDatabaseUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqual:", v9);

      v8 = v9;
      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[HDNanoPairingEntity setHealthDatabaseUUID:](self->_pairingEntity, "setHealthDatabaseUUID:", v9);
    -[HDNanoSyncStore _savePairingEntity]((uint64_t)self);
  }
  v8 = v9;
LABEL_9:

}

- (void)_savePairingEntity
{
  void *v2;
  id WeakRetained;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = *(void **)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "database");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v5 = objc_msgSend(v2, "saveWithHealthDatabase:error:", v4, &v9);
    v6 = v9;

    if ((v5 & 1) == 0)
    {
      _HKInitializeLogging();
      v7 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v8 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v11 = v8;
        v12 = 2114;
        v13 = v6;
        _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "failed to save pairing entity %{public}@: %{public}@", buf, 0x16u);
      }
    }

  }
}

- (void)setPersistentUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  -[HDNanoPairingEntity persistentUUID](self->_pairingEntity, "persistentUUID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v9)
  {

  }
  else
  {
    v5 = v4;
    if (v9)
    {
      -[HDNanoPairingEntity persistentUUID](self->_pairingEntity, "persistentUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqual:", v9);

      v8 = v9;
      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[HDNanoPairingEntity setPersistentUUID:](self->_pairingEntity, "setPersistentUUID:", v9);
    -[HDNanoSyncStore _savePairingEntity]((uint64_t)self);
  }
  v8 = v9;
LABEL_9:

}

- (id)beginRestoreSessionWithUUID:(id)a3 timeout:(double)a4 timeoutHandler:(id)a5
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  HDNanoSyncRestoreSession *v13;
  HDNanoSyncRestoreSession *restoreSession;
  HDNanoSyncRestoreSession *v15;
  void *v17;

  v9 = a5;
  v10 = (void *)MEMORY[0x1E0CB35C8];
  v11 = a3;
  objc_msgSend(v10, "hk_error:description:", 100, CFSTR("Canceled by new restore session"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDNanoSyncStore finishRestoreSessionWithError:](self, "finishRestoreSessionWithError:", v12);

  v13 = -[HDNanoSyncRestoreSession initWithSyncStore:sessionUUID:]([HDNanoSyncRestoreSession alloc], "initWithSyncStore:sessionUUID:", self, v11);
  restoreSession = self->_restoreSession;
  self->_restoreSession = v13;

  if (a4 > 0.0)
  {
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDNanoSyncStore.m"), 608, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("timeoutHandler != NULL"));

    }
    -[HDNanoSyncRestoreSession scheduleTimeoutWithInterval:handler:](self->_restoreSession, "scheduleTimeoutWithInterval:handler:", v9, a4);
  }
  -[HDNanoSyncStore _setRestoreState:]((uint64_t)self, 2);
  v15 = self->_restoreSession;

  return v15;
}

- (void)_setRestoreState:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  NSObject *v11;
  void *v12;
  _BYTE v13[24];
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a1 && *(_QWORD *)(a1 + 144) != a2)
  {
    _HKInitializeLogging();
    v4 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 144);
      if (v5 == 2)
        v6 = CFSTR("In Progress");
      else
        v6 = CFSTR("Incomplete");
      if (v5 == 3)
        v7 = CFSTR("Complete");
      else
        v7 = (__CFString *)v6;
      v8 = v7;
      if (a2 == 2)
        v9 = CFSTR("In Progress");
      else
        v9 = CFSTR("Incomplete");
      if (a2 == 3)
        v9 = CFSTR("Complete");
      v10 = v9;
      *(_DWORD *)v13 = 138543874;
      *(_QWORD *)&v13[4] = a1;
      *(_WORD *)&v13[12] = 2112;
      *(_QWORD *)&v13[14] = v8;
      *(_WORD *)&v13[22] = 2112;
      v14 = v10;
      v11 = v4;
      _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "store %{public}@ transitioning from %@ to %@", v13, 0x20u);

    }
    *(_QWORD *)(a1 + 144) = a2;
    if ((a2 == 3) != objc_msgSend(*(id *)(a1 + 32), "isRestoreComplete", *(_OWORD *)v13, *(_QWORD *)&v13[16], v14))
    {
      objc_msgSend(*(id *)(a1 + 32), "setRestoreComplete:", a2 == 3);
      -[HDNanoSyncStore _savePairingEntity](a1);
    }
    objc_msgSend((id)a1, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "nanoSyncStore:restoreStateDidChange:", a1, a2);

  }
}

- (void)finishRestoreSessionWithError:(id)a3
{
  HDNanoSyncRestoreSession *restoreSession;
  HDNanoSyncRestoreSession *v6;
  uint64_t v7;

  restoreSession = self->_restoreSession;
  if (restoreSession)
  {
    -[HDNanoSyncRestoreSession finishWithError:](restoreSession, "finishWithError:", a3);
    v6 = self->_restoreSession;
    self->_restoreSession = 0;

  }
  if (a3)
    v7 = 1;
  else
    v7 = 3;
  -[HDNanoSyncStore _setRestoreState:]((uint64_t)self, v7);
}

- (BOOL)resetProvenanceWithError:(id *)a3
{
  HDNanoPairingEntity **p_pairingEntity;
  HDNanoPairingEntity *pairingEntity;
  id WeakRetained;
  void *v7;

  p_pairingEntity = &self->_pairingEntity;
  pairingEntity = self->_pairingEntity;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  -[HDNanoPairingEntity resetProvenanceForProfile:error:](pairingEntity, "resetProvenanceForProfile:error:", WeakRetained, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_storeStrong((id *)p_pairingEntity, v7);

  return v7 != 0;
}

- (void)addPendingRequestContext:(id)a3 forUUID:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pendingRequestContexts, "setObject:forKeyedSubscript:", a3, a4);
}

- (id)pendingRequestContextForUUID:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_pendingRequestContexts, "objectForKeyedSubscript:", a3);
}

- (void)removePendingRequestContextForUUID:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_pendingRequestContexts, "removeObjectForKey:", a3);
}

- (void)addIncomingSyncObserverWithTimeout:(double)a3 timeoutHandler:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSMutableArray *v10;
  NSMutableArray *incomingSyncObserverTimers;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  double v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (!self->_incomingSyncObserverTimers)
  {
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    incomingSyncObserverTimers = self->_incomingSyncObserverTimers;
    self->_incomingSyncObserverTimers = v10;

  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6F98]), "initWithCompletion:", v9);
  -[NSMutableArray addObject:](self->_incomingSyncObserverTimers, "addObject:", v12);
  objc_msgSend(v12, "startWithTimeoutInterval:handler:", v8, a3);
  _HKInitializeLogging();
  v13 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEBUG))
  {
    v14 = v13;
    objc_msgSend(v12, "startDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 134218498;
    v17 = v12;
    v18 = 2048;
    v19 = a3;
    v20 = 2112;
    v21 = v15;
    _os_log_debug_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEBUG, "added incoming sync observer %p with %.2f timeout at %@", (uint8_t *)&v16, 0x20u);

  }
  -[HDNanoSyncStore _notifyIncomingSyncObservers]((uint64_t)self);

}

uint64_t __47__HDNanoSyncStore__notifyIncomingSyncObservers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hk_isBeforeDate:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)v5)
  {
    objc_msgSend(v3, "invalidateAndInvokeCompletionWithError:", 0);
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEBUG))
    {
      v8 = *(void **)(a1 + 40);
      v9 = v6;
      objc_msgSend(v3, "startDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervalSinceDate:", v10);
      v12 = 134218240;
      v13 = v3;
      v14 = 2048;
      v15 = v11;
      _os_log_debug_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEBUG, "notified sync observer %p after %.3f seconds", (uint8_t *)&v12, 0x16u);

    }
  }

  return v5;
}

- (void)removeExpiredIncomingSyncObservers
{
  void *v3;
  void *v4;
  NSMutableArray *incomingSyncObserverTimers;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  if (-[NSMutableArray count](self->_incomingSyncObserverTimers, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 103, CFSTR("Sync request timed out"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    incomingSyncObserverTimers = self->_incomingSyncObserverTimers;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __53__HDNanoSyncStore_removeExpiredIncomingSyncObservers__block_invoke;
    v8[3] = &unk_1E6D0EFC0;
    v9 = v4;
    v10 = v3;
    v6 = v3;
    v7 = v4;
    -[NSMutableArray hk_removeObjectsPassingTest:](incomingSyncObserverTimers, "hk_removeObjectsPassingTest:", v8);

  }
}

uint64_t __53__HDNanoSyncStore_removeExpiredIncomingSyncObservers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "isExpired");
  if ((_DWORD)v4)
  {
    objc_msgSend(v3, "invalidateAndInvokeCompletionWithError:", *(_QWORD *)(a1 + 32));
    _HKInitializeLogging();
    v5 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEBUG))
    {
      v7 = *(void **)(a1 + 40);
      v8 = v5;
      objc_msgSend(v3, "startDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceDate:", v9);
      v11 = 134218240;
      v12 = v3;
      v13 = 2048;
      v14 = v10;
      _os_log_debug_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEBUG, "removed expired sync observer %p after %.3f seconds", (uint8_t *)&v11, 0x16u);

    }
  }

  return v4;
}

- (int64_t)syncEpoch
{
  return 0;
}

- (id)databaseIdentifier
{
  return 0;
}

uint64_t __38__HDNanoSyncStore_orderedSyncEntities__block_invoke(uint64_t a1, void *a2)
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(a2, "supportsSyncStore:", *(_QWORD *)(a1 + 32));
  else
    return 1;
}

- (BOOL)canRecieveSyncObjectsForEntityClass:(Class)a3
{
  return 1;
}

+ (id)orderedSyncEntitiesForProfile:(id)a3 protocolVersion:(int)a4 companion:(BOOL)a5
{
  int v5;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  int v15;
  _QWORD v16[7];

  v16[6] = *MEMORY[0x1E0C80C00];
  if (a5)
    v5 = 6;
  else
    v5 = 8;
  if (v5 > a4)
    return MEMORY[0x1E0C9AA60];
  if (a5)
    v8 = 1;
  else
    v8 = 2;
  objc_msgSend(a3, "syncEngine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allOrderedSyncEntities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  v16[2] = objc_opt_class();
  v16[3] = objc_opt_class();
  v16[4] = objc_opt_class();
  v16[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayByExcludingObjectsInArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75__HDNanoSyncStore_orderedSyncEntitiesForProfile_protocolVersion_companion___block_invoke;
  v14[3] = &__block_descriptor_44_e8_B16__0_8l;
  v14[4] = v8;
  v15 = a4;
  objc_msgSend(v12, "hk_filter:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

BOOL __75__HDNanoSyncStore_orderedSyncEntitiesForProfile_protocolVersion_companion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;

  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 1;
  v4 = *(_QWORD *)(a1 + 32);
  return (objc_msgSend(a2, "supportedNanoSyncDirectionsForProtocolVersion:", *(unsigned int *)(a1 + 40)) & v4) != 0;
}

- (BOOL)supportsSpeculativeChangesForSyncEntityClass:(Class)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[objc_class supportsSpeculativeNanoSyncChanges](a3, "supportsSpeculativeNanoSyncChanges");
  else
    return 0;
}

- (BOOL)shouldContinueAfterAnchorValidationError:(id)a3
{
  return 0;
}

- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D51760]))
  {
    -[HDNanoSyncStore delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hd_systemBuildVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nanoSyncStore:remoteSystemBuildVersionDidChange:", self, v9);
LABEL_5:

    goto LABEL_6;
  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D51728]))
  {
    -[HDNanoSyncStore delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hd_name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nanoSyncStore:deviceNameDidChange:", self, v9);
    goto LABEL_5;
  }
LABEL_6:

}

- (id)diagnosticDescription
{
  void *v3;
  NRDevice *nanoRegistryDevice;
  NRDevice *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int64_t restoreState;
  const __CFString *v28;
  const __CFString *v29;
  HDNanoSyncRestoreSession *restoreSession;
  const char *v31;
  void *v32;
  void *v33;
  __CFString *v34;
  void *v35;
  void *v36;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@:%p {"), objc_opt_class(), self);
  if (self)
    nanoRegistryDevice = self->_nanoRegistryDevice;
  else
    nanoRegistryDevice = 0;
  v5 = nanoRegistryDevice;
  -[NRDevice hd_productType](v5, "hd_productType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tDevice:(%@)"), v6);

  if (-[HDNanoSyncStore isMaster](self, "isMaster"))
  {
    -[NRDevice hd_lastActiveDate](v5, "hd_lastActiveDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NRDevice hd_lastInactiveDate](v5, "hd_lastInactiveDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HDNanoSyncStore isActive](self, "isActive"))
    {
      HKDiagnosticStringFromDate();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      HKDiagnosticStringFromDate();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("\n\tLast Inactive: %@ - %@"), v9, v10);
    }
    else
    {
      HKDiagnosticStringFromDate();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      HKDiagnosticStringFromDate();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("\n\tLast Active: %@ - %@"), v9, v10);
    }

  }
  -[IDSDevice hd_deviceIdentifier](self->_identityServicesDevice, "hd_deviceIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tIDS Device ID: %@"), v11);

  -[HDNanoSyncStore nanoRegistryUUID](self, "nanoRegistryUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = CFSTR("<none>");
  if (v13)
    v16 = (const __CFString *)v13;
  else
    v16 = CFSTR("<none>");
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tRegistry UUID: %@"), v16);

  -[HDNanoSyncStore persistentUUID](self, "persistentUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = (const __CFString *)v18;
  else
    v20 = CFSTR("<none>");
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tPersistent UUID: %@"), v20);

  if (-[HDNanoSyncStore isMaster](self, "isMaster"))
  {
    -[HDNanoSyncStore sourceBundleIdentifier](self, "sourceBundleIdentifier");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21)
      v23 = (const __CFString *)v21;
    else
      v23 = CFSTR("<none>");
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\tSource identifier: %@"), v23);

  }
  -[HDNanoSyncStore remoteSystemBuildVersion](self, "remoteSystemBuildVersion");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if (v24)
    v15 = (const __CFString *)v24;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[HDNanoSyncStore protocolVersion](self, "protocolVersion"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tSystem build: %@ (protocol vers %@)"), v15, v26);

  restoreState = self->_restoreState;
  v28 = CFSTR("Incomplete");
  if (restoreState == 2)
    v28 = CFSTR("In Progress");
  if (restoreState == 3)
    v29 = CFSTR("Complete");
  else
    v29 = v28;
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tRestore state: %@"), v29);
  restoreSession = self->_restoreSession;
  if (restoreSession)
  {
    if (-[HDNanoSyncRestoreSession isFinished](restoreSession, "isFinished"))
      v31 = "finished";
    else
      v31 = "unfinished";
    -[HDNanoSyncRestoreSession sessionUUID](self->_restoreSession, "sessionUUID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "UUIDString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\tRestore %s, id:\"%@\"), v31, v33);

  }
  if (self->_lastCompleteIncomingSyncDate)
  {
    if (self->_lastCompleteIncomingSyncError)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" (error: %@)"), self->_lastCompleteIncomingSyncError);
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = &stru_1E6D11BB8;
    }
    HKDiagnosticStringFromDate();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\tLast complete sync began %@%@"), v35, v34);

  }
  if (self->_lastIncompleteIncomingSyncDate)
  {
    HKDiagnosticStringFromDate();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\tLast incomplete sync began %@"), v36);

  }
  if (-[HDNanoSyncStore needsSyncOnUnlock](self, "needsSyncOnUnlock"))
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\tNeeds sync on unlock: YES"));
  objc_msgSend(v3, "appendString:", CFSTR("\n}"));

  return v3;
}

- (HDNanoSyncStoreDelegate)delegate
{
  return (HDNanoSyncStoreDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HDNanoSyncRestoreSession)restoreSession
{
  return self->_restoreSession;
}

- (NSSet)obliteratedDatabaseUUIDs
{
  return self->_obliteratedDatabaseUUIDs;
}

- (BOOL)needsSyncOnUnlock
{
  return self->_needsSyncOnUnlock;
}

- (void)setNeedsSyncOnUnlock:(BOOL)a3
{
  self->_needsSyncOnUnlock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_obliteratedDatabaseUUIDs, 0);
  objc_storeStrong((id *)&self->_restoreSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_nanoRegistryDevice, 0);
  objc_storeStrong((id *)&self->_identityServicesDevice, 0);
  objc_storeStrong((id *)&self->_orderedSyncEntities, 0);
  objc_storeStrong((id *)&self->_expectedSequenceNumbers, 0);
  objc_storeStrong((id *)&self->_lastCompleteIncomingSyncError, 0);
  objc_storeStrong((id *)&self->_lastCompleteIncomingSyncDate, 0);
  objc_storeStrong((id *)&self->_lastIncompleteIncomingSyncDate, 0);
  objc_storeStrong((id *)&self->_lastIncompleteIncomingSyncUUID, 0);
  objc_storeStrong((id *)&self->_incomingSyncObserverTimers, 0);
  objc_storeStrong((id *)&self->_pendingRequestContexts, 0);
  objc_storeStrong((id *)&self->_pairingEntity, 0);
  objc_storeStrong((id *)&self->_remoteProductType, 0);
  objc_storeStrong((id *)&self->_remoteSystemBuildVersion, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
