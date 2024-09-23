@implementation NRDeviceIdentifier

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[NRDeviceIdentifier nrDeviceIdentifier](self, "nrDeviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithUUID:", v5);

  objc_msgSend(v6, "setEphemeral:", -[NRDeviceIdentifier ephemeral](self, "ephemeral"));
  return v6;
}

- (NRDeviceIdentifier)initWithCoder:(id)a3
{
  id v4;
  NRDeviceIdentifier *v5;
  NRDeviceIdentifier *v6;
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
  v20.super_class = (Class)NRDeviceIdentifier;
  v5 = -[NRDeviceIdentifier init](&v20, sel_init);
  if (!v5)
  {
    v9 = nrCopyLogObj_757();
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
        *(_QWORD *)(v18 + 4) = "-[NRDeviceIdentifier initWithCoder:]";
        v19 = nrCopyLogObj_757();
        _NRLogAbortWithPack(v19);
      }
    }
    v12 = nrCopyLogObj_757();
    _NRLogWithArgs((uint64_t)v12, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v13, v14, v15, v16, v17, (uint64_t)");

    goto LABEL_8;
  }
  v6 = v5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nrDeviceIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRDeviceIdentifier setNrDeviceIdentifier:](v6, "setNrDeviceIdentifier:", v7);

  -[NRDeviceIdentifier setEphemeral:](v6, "setEphemeral:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ephemeral")));
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NRDeviceIdentifier nrDeviceIdentifier](self, "nrDeviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("nrDeviceIdentifier"));

  objc_msgSend(v5, "encodeBool:forKey:", -[NRDeviceIdentifier ephemeral](self, "ephemeral"), CFSTR("ephemeral"));
}

- (NRDeviceIdentifier)initWithUUID:(id)a3
{
  id v4;
  void *v5;
  NRDeviceIdentifier *v6;
  NRDeviceIdentifier *v7;
  NSObject *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  NSObject *v16;
  _BOOL4 v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  objc_super v40;
  unsigned __int8 uu[8];
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    v9 = nrCopyLogObj_757();
    v10 = v9;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v11 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

      if (!v11)
        goto LABEL_16;
    }
    v18 = nrCopyLogObj_757();
    _NRLogWithArgs((uint64_t)v18, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL nrDeviceIdentifier", v19, v20, v21, v22, v23, (uint64_t)");

LABEL_16:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    v24 = _os_log_pack_fill();
    *(_DWORD *)v24 = 136446466;
    *(_QWORD *)(v24 + 4) = "-[NRDeviceIdentifier initWithUUID:]";
    *(_WORD *)(v24 + 12) = 2080;
    *(_QWORD *)(v24 + 14) = "-[NRDeviceIdentifier initWithUUID:]";
    goto LABEL_23;
  }
  v5 = v4;
  *(_QWORD *)uu = 0;
  v42 = 0;
  objc_msgSend(v4, "getUUIDBytes:", uu);
  if (uuid_is_null(uu))
  {
    v12 = nrCopyLogObj_757();
    v13 = v12;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v14 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);

      if (!v14)
        goto LABEL_19;
    }
    v25 = nrCopyLogObj_757();
    _NRLogWithArgs((uint64_t)v25, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with all-zero nrDeviceIdentifier", v26, v27, v28, v29, v30, (uint64_t)");

LABEL_19:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    v31 = _os_log_pack_fill();
    *(_DWORD *)v31 = 136446466;
    *(_QWORD *)(v31 + 4) = "-[NRDeviceIdentifier initWithUUID:]";
    *(_WORD *)(v31 + 12) = 2080;
    *(_QWORD *)(v31 + 14) = "-[NRDeviceIdentifier initWithUUID:]";
    goto LABEL_23;
  }
  v40.receiver = self;
  v40.super_class = (Class)NRDeviceIdentifier;
  v6 = -[NRDeviceIdentifier init](&v40, sel_init);
  if (!v6)
  {
    v15 = nrCopyLogObj_757();
    v16 = v15;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v17 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

      if (!v17)
        goto LABEL_22;
    }
    v32 = nrCopyLogObj_757();
    _NRLogWithArgs((uint64_t)v32, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v33, v34, v35, v36, v37, (uint64_t)");

LABEL_22:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    v38 = _os_log_pack_fill();
    *(_DWORD *)v38 = 136446210;
    *(_QWORD *)(v38 + 4) = "-[NRDeviceIdentifier initWithUUID:]";
LABEL_23:
    v39 = nrCopyLogObj_757();
    _NRLogAbortWithPack(v39);
  }
  v7 = v6;
  -[NRDeviceIdentifier setNrDeviceIdentifier:](v6, "setNrDeviceIdentifier:", v5);

  return v7;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NRDeviceIdentifier nrDeviceIdentifier](self, "nrDeviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("NRD[%@]"), v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    -[NRDeviceIdentifier nrDeviceIdentifier](self, "nrDeviceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nrDeviceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[NRDeviceIdentifier nrDeviceIdentifier](self, "nrDeviceIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSUUID)bluetoothUUID
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;

  -[NRDeviceIdentifier nrDeviceIdentifier](self, "nrDeviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (nrCopyLogObj_onceToken_746 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_746, &__block_literal_global_747);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_748, OS_LOG_TYPE_INFO))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_748, 1, (uint64_t)"%s%.30s:%-4d Querying BluetoothUUID for nrUUID %@", v2, v3, v4, v5, v6, (uint64_t)");
  os_unfair_lock_lock(&sBluetoothUUIDToNRUUIDMappingLock);
  if (!sBluetoothUUIDToNRUUIDMapping)
  {
LABEL_14:
    v9 = nrXPCCopyBluetoothUUIDForNRUUID(v7);
    if (!v9)
      goto LABEL_23;
    if (nrCopyLogObj_onceToken_746 == -1)
    {
      if (sNRCopyLogToStdErr)
        goto LABEL_18;
    }
    else
    {
      dispatch_once(&nrCopyLogObj_onceToken_746, &__block_literal_global_747);
      if (sNRCopyLogToStdErr)
        goto LABEL_18;
    }
    if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_748, OS_LOG_TYPE_INFO))
    {
LABEL_19:
      v20 = (void *)sBluetoothUUIDToNRUUIDMapping;
      if (!sBluetoothUUIDToNRUUIDMapping)
      {
        v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v22 = (void *)sBluetoothUUIDToNRUUIDMapping;
        sBluetoothUUIDToNRUUIDMapping = (uint64_t)v21;

        v20 = (void *)sBluetoothUUIDToNRUUIDMapping;
      }
      if ((unint64_t)objc_msgSend(v20, "count") <= 0xF)
        objc_msgSend((id)sBluetoothUUIDToNRUUIDMapping, "setObject:forKeyedSubscript:", v7, v9);
      goto LABEL_23;
    }
LABEL_18:
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_748, 1, (uint64_t)"%s%.30s:%-4d Got BluetoothUUID %@ from daemon for nrUUID %@", v15, v16, v17, v18, v19, (uint64_t)");
    goto LABEL_19;
  }
  objc_msgSend((id)sBluetoothUUIDToNRUUIDMapping, "allKeysForObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "count"))
  {

    goto LABEL_14;
  }
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_14;
  if (nrCopyLogObj_onceToken_746 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_12:
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_748, 1, (uint64_t)"%s%.30s:%-4d Got BluetoothUUID %@ from cache for nrUUID %@", v10, v11, v12, v13, v14, (uint64_t)");
      goto LABEL_23;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_746, &__block_literal_global_747);
    if (sNRCopyLogToStdErr)
      goto LABEL_12;
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_748, OS_LOG_TYPE_INFO))
    goto LABEL_12;
LABEL_23:
  os_unfair_lock_unlock(&sBluetoothUUIDToNRUUIDMappingLock);

  return (NSUUID *)v9;
}

- (NSUUID)nrDeviceIdentifier
{
  return self->_nrDeviceIdentifier;
}

- (void)setNrDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)ephemeral
{
  return self->_ephemeral;
}

- (void)setEphemeral:(BOOL)a3
{
  self->_ephemeral = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nrDeviceIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newEphemeralDeviceIdentifier
{
  void *v2;
  NRDeviceIdentifier *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[NRDeviceIdentifier initWithUUID:]([NRDeviceIdentifier alloc], "initWithUUID:", v2);
  -[NRDeviceIdentifier setEphemeral:](v3, "setEphemeral:", 1);
  if (nrCopyLogObj_onceToken_746 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_746, &__block_literal_global_747);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_748, OS_LOG_TYPE_INFO))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_748, 1, (uint64_t)"%s%.30s:%-4d Creating %@ for ephemeral pairing", v4, v5, v6, v7, v8, (uint64_t)");

  return v3;
}

+ (id)newDeviceIdentifierWithBluetoothUUID:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NRDeviceIdentifier *v31;
  NSObject *v32;
  NSObject *v33;
  _BOOL4 v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v42;
  NSObject *v43;
  _BOOL4 v44;
  NSObject *v45;
  NSObject *v46;
  _BOOL4 v47;
  NSObject *v48;
  NSObject *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  _BOOL4 v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unsigned __int8 uu[8];
  uint64_t v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    v42 = nrCopyLogObj_757();
    v43 = v42;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v44 = os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);

      if (!v44)
        goto LABEL_51;
    }
    v50 = nrCopyLogObj_757();
    _NRLogWithArgs((uint64_t)v50, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL bluetoothUUID", v51, v52, v53, v54, v55, (uint64_t)");

LABEL_51:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    v56 = _os_log_pack_fill();
    *(_DWORD *)v56 = 136446466;
    *(_QWORD *)(v56 + 4) = "+[NRDeviceIdentifier newDeviceIdentifierWithBluetoothUUID:]";
    *(_WORD *)(v56 + 12) = 2080;
    *(_QWORD *)(v56 + 14) = "+[NRDeviceIdentifier newDeviceIdentifierWithBluetoothUUID:]";
    goto LABEL_55;
  }
  v4 = v3;
  *(_QWORD *)uu = 0;
  v74 = 0;
  objc_msgSend(v3, "getUUIDBytes:", uu);
  if (uuid_is_null(uu))
  {
    v45 = nrCopyLogObj_757();
    v46 = v45;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v47 = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);

      if (!v47)
        goto LABEL_54;
    }
    v57 = nrCopyLogObj_757();
    _NRLogWithArgs((uint64_t)v57, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with all-zero bluetoothUUID", v58, v59, v60, v61, v62, (uint64_t)");

LABEL_54:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    v63 = _os_log_pack_fill();
    *(_DWORD *)v63 = 136446466;
    *(_QWORD *)(v63 + 4) = "+[NRDeviceIdentifier newDeviceIdentifierWithBluetoothUUID:]";
    *(_WORD *)(v63 + 12) = 2080;
    *(_QWORD *)(v63 + 14) = "+[NRDeviceIdentifier newDeviceIdentifierWithBluetoothUUID:]";
LABEL_55:
    v64 = nrCopyLogObj_757();
    _NRLogAbortWithPack(v64);
  }
  if (nrCopyLogObj_onceToken_746 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_746, &__block_literal_global_747);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_748, OS_LOG_TYPE_INFO))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_748, 1, (uint64_t)"%s%.30s:%-4d Querying NRUUID for bluetoothUUID %@", v5, v6, v7, v8, v9, (uint64_t)");
  os_unfair_lock_lock(&sBluetoothUUIDToNRUUIDMappingLock);
  if (sBluetoothUUIDToNRUUIDMapping)
  {
    objc_msgSend((id)sBluetoothUUIDToNRUUIDMapping, "objectForKeyedSubscript:", v4);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v16 = (void *)v10;
      if (nrCopyLogObj_onceToken_746 == -1)
      {
        if (!sNRCopyLogToStdErr)
          goto LABEL_12;
      }
      else
      {
        dispatch_once(&nrCopyLogObj_onceToken_746, &__block_literal_global_747);
        if (!sNRCopyLogToStdErr)
        {
LABEL_12:
          if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_748, OS_LOG_TYPE_INFO))
            goto LABEL_23;
        }
      }
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_748, 1, (uint64_t)"%s%.30s:%-4d Got NRUUID %@ from cache for bluetoothUUID %@", v11, v12, v13, v14, v15, (uint64_t)");
      goto LABEL_23;
    }
  }
  v17 = nrXPCCopyNRUUIDForBluetoothUUID(v4);
  if (!v17)
  {
    os_unfair_lock_unlock(&sBluetoothUUIDToNRUUIDMappingLock);
    if (nrCopyLogObj_onceToken_746 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_746, &__block_literal_global_747);
    v32 = (id)nrCopyLogObj_sNRLogObj_748;
    v33 = v32;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v34 = os_log_type_enabled(v32, OS_LOG_TYPE_FAULT);

      if (!v34)
      {
LABEL_36:
        v16 = 0;
        goto LABEL_37;
      }
    }
    if (nrCopyLogObj_onceToken_746 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_746, &__block_literal_global_747);
    v35 = (id)nrCopyLogObj_sNRLogObj_748;
    _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"%s called with null nrUUID", v36, v37, v38, v39, v40, (uint64_t)"+[NRDeviceIdentifier newDeviceIdentifierWithBluetoothUUID:]");

    goto LABEL_36;
  }
  v16 = v17;
  if (nrCopyLogObj_onceToken_746 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_18:
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_748, 1, (uint64_t)"%s%.30s:%-4d Got NRUUID %@ from daemon for bluetoothUUID %@", v18, v19, v20, v21, v22, (uint64_t)");
      goto LABEL_19;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_746, &__block_literal_global_747);
    if (sNRCopyLogToStdErr)
      goto LABEL_18;
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_748, OS_LOG_TYPE_INFO))
    goto LABEL_18;
LABEL_19:
  v23 = (void *)sBluetoothUUIDToNRUUIDMapping;
  if (!sBluetoothUUIDToNRUUIDMapping)
  {
    v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v25 = (void *)sBluetoothUUIDToNRUUIDMapping;
    sBluetoothUUIDToNRUUIDMapping = (uint64_t)v24;

    v23 = (void *)sBluetoothUUIDToNRUUIDMapping;
  }
  if ((unint64_t)objc_msgSend(v23, "count") <= 0xF)
    objc_msgSend((id)sBluetoothUUIDToNRUUIDMapping, "setObject:forKeyedSubscript:", v16, v4);
LABEL_23:
  os_unfair_lock_unlock(&sBluetoothUUIDToNRUUIDMappingLock);
  *(_QWORD *)uu = 0;
  v74 = 0;
  objc_msgSend(v16, "getUUIDBytes:", uu);
  if (uuid_is_null(uu))
  {
    v48 = nrCopyLogObj_757();
    v49 = v48;
    if (sNRCopyLogToStdErr)
    {

LABEL_61:
      v66 = nrCopyLogObj_757();
      _NRLogWithArgs((uint64_t)v66, 17, (uint64_t)"called with all-zero nrUUID", v67, v68, v69, v70, v71, v72);

      goto LABEL_37;
    }
    v65 = os_log_type_enabled(v48, OS_LOG_TYPE_FAULT);

    if (v65)
      goto LABEL_61;
LABEL_37:
    v31 = 0;
    goto LABEL_38;
  }
  v31 = -[NRDeviceIdentifier initWithUUID:]([NRDeviceIdentifier alloc], "initWithUUID:", v16);
  if (nrCopyLogObj_onceToken_746 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_27:
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_748, 1, (uint64_t)"%s%.30s:%-4d Found %@ for bluetoothUUID %@", v26, v27, v28, v29, v30, (uint64_t)");
      goto LABEL_38;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_746, &__block_literal_global_747);
    if (sNRCopyLogToStdErr)
      goto LABEL_27;
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_748, OS_LOG_TYPE_INFO))
    goto LABEL_27;
LABEL_38:

  return v31;
}

+ (id)copyDeviceIdentifierWithIDSDeviceID:(id)a3
{
  return +[NRDeviceIdentifier newDeviceIdentifierWithIDSDeviceID:shouldCreate:](NRDeviceIdentifier, "newDeviceIdentifierWithIDSDeviceID:shouldCreate:", a3, 0);
}

- (BOOL)isEphemeral
{
  return self->_ephemeral;
}

+ (id)copyBestTestingDeviceIdentifier
{
  void *v2;
  void *v3;
  NRDeviceIdentifier *v4;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned __int8 uu[8];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = nrXPCCopyBestTestingNRUUID();
  v3 = v2;
  if (!v2)
  {
    v6 = nrCopyLogObj_757();
    v7 = v6;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v10 = os_log_type_enabled(v6, OS_LOG_TYPE_FAULT);

      if (!v10)
        goto LABEL_14;
    }
    v11 = nrCopyLogObj_757();
    _NRLogWithArgs((uint64_t)v11, 17, (uint64_t)"%s called with null nrUUID", v12, v13, v14, v15, v16, (uint64_t)"+[NRDeviceIdentifier(Internal) copyBestTestingDeviceIdentifier]");
LABEL_13:

    goto LABEL_14;
  }
  *(_QWORD *)uu = 0;
  v25 = 0;
  objc_msgSend(v2, "getUUIDBytes:", uu);
  if (uuid_is_null(uu))
  {
    v8 = nrCopyLogObj_757();
    v9 = v8;
    if (sNRCopyLogToStdErr)
    {

LABEL_12:
      v11 = nrCopyLogObj_757();
      _NRLogWithArgs((uint64_t)v11, 17, (uint64_t)"called with all-zero nrUUID", v18, v19, v20, v21, v22, v23);
      goto LABEL_13;
    }
    v17 = os_log_type_enabled(v8, OS_LOG_TYPE_FAULT);

    if (v17)
      goto LABEL_12;
LABEL_14:
    v4 = 0;
    goto LABEL_4;
  }
  v4 = -[NRDeviceIdentifier initWithUUID:]([NRDeviceIdentifier alloc], "initWithUUID:", v3);
LABEL_4:

  return v4;
}

+ (id)newDeviceIdentifierWithIDSDeviceID:(id)a3 shouldCreate:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NRDeviceIdentifier *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v40;
  NSObject *v41;
  _BOOL4 v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;

  v4 = a4;
  v5 = a3;
  if (!v5)
  {
    v40 = nrCopyLogObj_757();
    v41 = v40;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v42 = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);

      if (!v42)
      {
LABEL_40:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v49 = _os_log_pack_fill();
        *(_DWORD *)v49 = 136446466;
        *(_QWORD *)(v49 + 4) = "+[NRDeviceIdentifier(Internal) newDeviceIdentifierWithIDSDeviceID:shouldCreate:]";
        *(_WORD *)(v49 + 12) = 2080;
        *(_QWORD *)(v49 + 14) = "+[NRDeviceIdentifier(Internal) newDeviceIdentifierWithIDSDeviceID:shouldCreate:]";
        v50 = nrCopyLogObj_757();
        _NRLogAbortWithPack(v50);
      }
    }
    v43 = nrCopyLogObj_757();
    _NRLogWithArgs((uint64_t)v43, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL idsDeviceID", v44, v45, v46, v47, v48, (uint64_t)");

    goto LABEL_40;
  }
  v11 = v5;
  if (nrCopyLogObj_onceToken_746 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_746, &__block_literal_global_747);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_748, OS_LOG_TYPE_INFO))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_748, 1, (uint64_t)"%s%.30s:%-4d Querying NRUUID for IDSDeviceID %@", v6, v7, v8, v9, v10, (uint64_t)");
  os_unfair_lock_lock(&sIDSDeviceIDToNRUUIDMappingLock);
  if (sIDSDeviceIDToNRUUIDMapping)
  {
    objc_msgSend((id)sIDSDeviceIDToNRUUIDMapping, "objectForKeyedSubscript:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v18 = (void *)v12;
      if (nrCopyLogObj_onceToken_746 == -1)
      {
        if (!sNRCopyLogToStdErr)
          goto LABEL_11;
      }
      else
      {
        dispatch_once(&nrCopyLogObj_onceToken_746, &__block_literal_global_747);
        if (!sNRCopyLogToStdErr)
        {
LABEL_11:
          if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_748, OS_LOG_TYPE_INFO))
            goto LABEL_21;
        }
      }
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_748, 1, (uint64_t)"%s%.30s:%-4d Got NRUUID %@ from cache for idsDeviceID %@", v13, v14, v15, v16, v17, (uint64_t)");
      goto LABEL_21;
    }
  }
  v19 = nrXPCCopyNRUUIDForIDSDeviceID(v11, v4);
  if (!v19)
  {
    os_unfair_lock_unlock(&sIDSDeviceIDToNRUUIDMappingLock);
    if (v4)
    {
      if (nrCopyLogObj_onceToken_746 == -1)
      {
        if (sNRCopyLogToStdErr)
        {
LABEL_30:
          _NRLogWithArgs(nrCopyLogObj_sNRLogObj_748, 17, (uint64_t)"%s called with null nrUUID", v34, v35, v36, v37, v38, (uint64_t)"+[NRDeviceIdentifier(Internal) newDeviceIdentifierWithIDSDeviceID:shouldCreate:]");
          goto LABEL_31;
        }
      }
      else
      {
        dispatch_once(&nrCopyLogObj_onceToken_746, &__block_literal_global_747);
        if (sNRCopyLogToStdErr)
          goto LABEL_30;
      }
      if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_748, OS_LOG_TYPE_FAULT))
        goto LABEL_30;
    }
LABEL_31:
    v33 = 0;
    goto LABEL_32;
  }
  v18 = v19;
  if (nrCopyLogObj_onceToken_746 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_17:
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_748, 1, (uint64_t)"%s%.30s:%-4d Got NRUUID %@ from daemon for idsDeviceID %@", v20, v21, v22, v23, v24, (uint64_t)");
      goto LABEL_18;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_746, &__block_literal_global_747);
    if (sNRCopyLogToStdErr)
      goto LABEL_17;
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_748, OS_LOG_TYPE_INFO))
    goto LABEL_17;
LABEL_18:
  v25 = (void *)sIDSDeviceIDToNRUUIDMapping;
  if (!sIDSDeviceIDToNRUUIDMapping)
  {
    v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v27 = (void *)sIDSDeviceIDToNRUUIDMapping;
    sIDSDeviceIDToNRUUIDMapping = (uint64_t)v26;

    v25 = (void *)sIDSDeviceIDToNRUUIDMapping;
  }
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v18, v11);
LABEL_21:
  os_unfair_lock_unlock(&sIDSDeviceIDToNRUUIDMappingLock);
  v33 = -[NRDeviceIdentifier initWithUUID:]([NRDeviceIdentifier alloc], "initWithUUID:", v18);
  if (nrCopyLogObj_onceToken_746 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_24:
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_748, 1, (uint64_t)"%s%.30s:%-4d Found %@ for idsDeviceID %@", v28, v29, v30, v31, v32, (uint64_t)");
      goto LABEL_25;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_746, &__block_literal_global_747);
    if (sNRCopyLogToStdErr)
      goto LABEL_24;
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_748, OS_LOG_TYPE_INFO))
    goto LABEL_24;
LABEL_25:

LABEL_32:
  return v33;
}

+ (id)newDeviceIdentifierWithIDSDeviceID:(id)a3
{
  return +[NRDeviceIdentifier newDeviceIdentifierWithIDSDeviceID:shouldCreate:](NRDeviceIdentifier, "newDeviceIdentifierWithIDSDeviceID:shouldCreate:", a3, 1);
}

@end
