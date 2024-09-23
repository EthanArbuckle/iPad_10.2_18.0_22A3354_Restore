@implementation NRBluetoothPacketParser

- (NSString)description
{
  id v3;
  void *v4;
  id v5;
  unint64_t identifier;
  uint64_t state;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = v3;
  if (self->_readContextForMedium)
    objc_msgSend(v3, "appendFormat:", CFSTR("%sr"), "M");
  if (self->_writeContextForMedium)
    objc_msgSend(v4, "appendFormat:", CFSTR("%sw"), "M");
  if (self->_readContextForHigh)
    objc_msgSend(v4, "appendFormat:", CFSTR("%sr"), "H");
  if (self->_writeContextForHigh)
    objc_msgSend(v4, "appendFormat:", CFSTR("%sw"), "H");
  if (self->_readContextForIsochronous)
    objc_msgSend(v4, "appendFormat:", CFSTR("%sr"), "D");
  if (self->_writeContextForIsochronous)
    objc_msgSend(v4, "appendFormat:", CFSTR("%sw"), "D");
  v5 = objc_alloc(MEMORY[0x1E0CB37A0]);
  identifier = self->_identifier;
  state = self->_state;
  if (state >= 5)
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown(%d)"), state);
  else
    v8 = (void *)*((_QWORD *)&off_1EA3F7030 + state);
  v9 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("[%llu %@ %@]"), identifier, v8, v4);

  return (NSString *)v9;
}

- (NRBluetoothPacketParser)initWithBluetoothUUID:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  NRBluetoothPacketParser *v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  os_log_t v16;
  os_log_t v17;
  NRBluetoothPacketParser *v18;
  _BOOL4 v19;
  os_log_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v27;
  NSObject *v28;
  _BOOL4 v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  objc_super v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v38.receiver = self;
  v38.super_class = (Class)NRBluetoothPacketParser;
  v9 = -[NRBluetoothPacketParser init](&v38, sel_init);
  if (!v9)
  {
    v27 = nrCopyLogObj_506();
    v28 = v27;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v29 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);

      if (!v29)
      {
LABEL_17:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v36 = _os_log_pack_fill();
        *(_DWORD *)v36 = 136446210;
        *(_QWORD *)(v36 + 4) = "-[NRBluetoothPacketParser initWithBluetoothUUID:queue:]";
        v37 = nrCopyLogObj_506();
        _NRLogAbortWithPack(v37);
      }
    }
    v30 = nrCopyLogObj_506();
    _NRLogWithArgs((uint64_t)v30, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v31, v32, v33, v34, v35, (uint64_t)");

    goto LABEL_17;
  }
  v10 = (uint64_t)v9;
  objc_storeStrong((id *)&v9->_queue, a4);
  do
    v11 = __ldxr(&initializeWithQueue__sNRParserID);
  while (__stxr(v11 + 1, &initializeWithQueue__sNRParserID));
  *(_QWORD *)(v10 + 48) = v11;
  -[NRBluetoothPacketParser changeStateTo:](v10, 1u);
  v12 = +[NRDeviceIdentifier newDeviceIdentifierWithBluetoothUUID:](NRDeviceIdentifier, "newDeviceIdentifierWithBluetoothUUID:", v7);
  v13 = *(void **)(v10 + 32);
  *(_QWORD *)(v10 + 32) = v12;

  if (*(_QWORD *)(v10 + 32))
  {
    objc_storeStrong((id *)(v10 + 24), a3);
    objc_msgSend(*(id *)(v10 + 32), "nrDeviceIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v14;

    _NRAddEligibleNRUUIDForLogObject(*(void **)(v10 + 40));
    v16 = _NRCopyLogObjectForNRUUID(*(void **)(v10 + 40));
    v17 = v16;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v19 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

      if (!v19)
      {
LABEL_10:
        v18 = (NRBluetoothPacketParser *)(id)v10;
        goto LABEL_11;
      }
    }
    v20 = _NRCopyLogObjectForNRUUID(*(void **)(v10 + 40));
    _NRLogWithArgs((uint64_t)v20, 0, (uint64_t)"%s%.30s:%-4d Created (%p)", v21, v22, v23, v24, v25, (uint64_t)");

    goto LABEL_10;
  }
  v18 = 0;
LABEL_11:

  return v18;
}

- (NRBluetoothPacketParser)initWithDeviceIdentifier:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  NRBluetoothPacketParser *v9;
  NRBluetoothPacketParser *v10;
  unint64_t v11;
  uint64_t v12;
  NSUUID *nrUUID;
  os_log_t v14;
  os_log_t v15;
  _BOOL4 v16;
  os_log_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v24;
  NSObject *v25;
  _BOOL4 v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  objc_super v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v35.receiver = self;
  v35.super_class = (Class)NRBluetoothPacketParser;
  v9 = -[NRBluetoothPacketParser init](&v35, sel_init);
  if (!v9)
  {
    v24 = nrCopyLogObj_506();
    v25 = v24;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v26 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);

      if (!v26)
      {
LABEL_14:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v33 = _os_log_pack_fill();
        *(_DWORD *)v33 = 136446210;
        *(_QWORD *)(v33 + 4) = "-[NRBluetoothPacketParser initWithDeviceIdentifier:queue:]";
        v34 = nrCopyLogObj_506();
        _NRLogAbortWithPack(v34);
      }
    }
    v27 = nrCopyLogObj_506();
    _NRLogWithArgs((uint64_t)v27, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v28, v29, v30, v31, v32, (uint64_t)");

    goto LABEL_14;
  }
  v10 = v9;
  objc_storeStrong((id *)&v9->_queue, a4);
  do
    v11 = __ldxr(&initializeWithQueue__sNRParserID);
  while (__stxr(v11 + 1, &initializeWithQueue__sNRParserID));
  v10->_identifier = v11;
  -[NRBluetoothPacketParser changeStateTo:]((uint64_t)v10, 1u);
  objc_storeStrong((id *)&v10->_deviceIdentifier, a3);
  -[NRDeviceIdentifier nrDeviceIdentifier](v10->_deviceIdentifier, "nrDeviceIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  nrUUID = v10->_nrUUID;
  v10->_nrUUID = (NSUUID *)v12;

  _NRAddEligibleNRUUIDForLogObject(v10->_nrUUID);
  v14 = _NRCopyLogObjectForNRUUID(v10->_nrUUID);
  v15 = v14;
  if (sNRCopyLogToStdErr)
  {

LABEL_7:
    v17 = _NRCopyLogObjectForNRUUID(v10->_nrUUID);
    _NRLogWithArgs((uint64_t)v17, 0, (uint64_t)"%s%.30s:%-4d Created (%p)", v18, v19, v20, v21, v22, (uint64_t)");

    goto LABEL_8;
  }
  v16 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  if (v16)
    goto LABEL_7;
LABEL_8:

  return v10;
}

- (BOOL)start
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__NRBluetoothPacketParser_start__block_invoke;
  block[3] = &unk_1EA3F72A0;
  block[4] = self;
  dispatch_async(queue, block);
  return 1;
}

- (void)dealloc
{
  $B174F4C94D76BD0ED270DA150CD5266A *readContextForMedium;
  void **var0;
  $B174F4C94D76BD0ED270DA150CD5266A *readContextForHigh;
  void **v6;
  $B174F4C94D76BD0ED270DA150CD5266A *readContextForIsochronous;
  void **v8;
  $3D27A55567FB06BC0E416B979767FD15 *writeContextForMedium;
  void **var3;
  $3D27A55567FB06BC0E416B979767FD15 *writeContextForHigh;
  void **v12;
  $3D27A55567FB06BC0E416B979767FD15 *writeContextForIsochronous;
  void **v14;
  os_log_t v15;
  os_log_t v16;
  _BOOL4 v17;
  os_log_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSUUID *v24;
  objc_super v25;

  -[NRBluetoothPacketParser cancel](self, "cancel");
  readContextForMedium = self->_readContextForMedium;
  if (readContextForMedium)
  {
    var0 = (void **)readContextForMedium->var0;
    if (!readContextForMedium->var0)
      goto LABEL_6;
    if (*var0)
    {
      free(*var0);
      *(_QWORD *)self->_readContextForMedium->var0 = 0;
      readContextForMedium = self->_readContextForMedium;
      var0 = (void **)readContextForMedium->var0;
      if (!readContextForMedium->var0)
        goto LABEL_6;
    }
    free(var0);
    self->_readContextForMedium->var0 = 0;
    readContextForMedium = self->_readContextForMedium;
    if (readContextForMedium)
    {
LABEL_6:
      free(readContextForMedium);
      self->_readContextForMedium = 0;
    }
  }
  readContextForHigh = self->_readContextForHigh;
  if (readContextForHigh)
  {
    v6 = (void **)readContextForHigh->var0;
    if (!readContextForHigh->var0)
      goto LABEL_12;
    if (*v6)
    {
      free(*v6);
      *(_QWORD *)self->_readContextForHigh->var0 = 0;
      readContextForHigh = self->_readContextForHigh;
      v6 = (void **)readContextForHigh->var0;
      if (!readContextForHigh->var0)
        goto LABEL_12;
    }
    free(v6);
    self->_readContextForHigh->var0 = 0;
    readContextForHigh = self->_readContextForHigh;
    if (readContextForHigh)
    {
LABEL_12:
      free(readContextForHigh);
      self->_readContextForHigh = 0;
    }
  }
  readContextForIsochronous = self->_readContextForIsochronous;
  if (readContextForIsochronous)
  {
    v8 = (void **)readContextForIsochronous->var0;
    if (!readContextForIsochronous->var0)
      goto LABEL_18;
    if (*v8)
    {
      free(*v8);
      *(_QWORD *)self->_readContextForIsochronous->var0 = 0;
      readContextForIsochronous = self->_readContextForIsochronous;
      v8 = (void **)readContextForIsochronous->var0;
      if (!readContextForIsochronous->var0)
        goto LABEL_18;
    }
    free(v8);
    self->_readContextForIsochronous->var0 = 0;
    readContextForIsochronous = self->_readContextForIsochronous;
    if (readContextForIsochronous)
    {
LABEL_18:
      free(readContextForIsochronous);
      self->_readContextForIsochronous = 0;
    }
  }
  writeContextForMedium = self->_writeContextForMedium;
  if (writeContextForMedium)
  {
    var3 = (void **)writeContextForMedium->var3;
    if (!var3)
      goto LABEL_26;
    if (*var3)
    {
      free(*var3);
      *(_QWORD *)self->_writeContextForMedium->var3 = 0;
      var3 = (void **)self->_writeContextForMedium->var3;
    }
    if (var3[1]
      && (free(var3[1]),
          *((_QWORD *)self->_writeContextForMedium->var3 + 1) = 0,
          writeContextForMedium = self->_writeContextForMedium,
          (var3 = (void **)writeContextForMedium->var3) == 0)
      || (free(var3),
          self->_writeContextForMedium->var3 = 0,
          (writeContextForMedium = self->_writeContextForMedium) != 0))
    {
LABEL_26:
      free(writeContextForMedium);
      self->_writeContextForMedium = 0;
    }
  }
  writeContextForHigh = self->_writeContextForHigh;
  if (writeContextForHigh)
  {
    v12 = (void **)writeContextForHigh->var3;
    if (!v12)
      goto LABEL_34;
    if (*v12)
    {
      free(*v12);
      *(_QWORD *)self->_writeContextForHigh->var3 = 0;
      v12 = (void **)self->_writeContextForHigh->var3;
    }
    if (v12[1]
      && (free(v12[1]),
          *((_QWORD *)self->_writeContextForHigh->var3 + 1) = 0,
          writeContextForHigh = self->_writeContextForHigh,
          (v12 = (void **)writeContextForHigh->var3) == 0)
      || (free(v12), self->_writeContextForHigh->var3 = 0, (writeContextForHigh = self->_writeContextForHigh) != 0))
    {
LABEL_34:
      free(writeContextForHigh);
      self->_writeContextForHigh = 0;
    }
  }
  writeContextForIsochronous = self->_writeContextForIsochronous;
  if (writeContextForIsochronous)
  {
    v14 = (void **)writeContextForIsochronous->var3;
    if (!v14)
      goto LABEL_42;
    if (*v14)
    {
      free(*v14);
      *(_QWORD *)self->_writeContextForIsochronous->var3 = 0;
      v14 = (void **)self->_writeContextForIsochronous->var3;
    }
    if (v14[1]
      && (free(v14[1]),
          *((_QWORD *)self->_writeContextForIsochronous->var3 + 1) = 0,
          writeContextForIsochronous = self->_writeContextForIsochronous,
          (v14 = (void **)writeContextForIsochronous->var3) == 0)
      || (free(v14),
          self->_writeContextForIsochronous->var3 = 0,
          (writeContextForIsochronous = self->_writeContextForIsochronous) != 0))
    {
LABEL_42:
      free(writeContextForIsochronous);
      self->_writeContextForIsochronous = 0;
    }
  }
  v15 = _NRCopyLogObjectForNRUUID(self->_nrUUID);
  v16 = v15;
  if (sNRCopyLogToStdErr)
  {

LABEL_46:
    v18 = _NRCopyLogObjectForNRUUID(self->_nrUUID);
    _NRLogWithArgs((uint64_t)v18, 0, (uint64_t)"%s%.30s:%-4d Dealloc", v19, v20, v21, v22, v23, (uint64_t)");

    goto LABEL_47;
  }
  v17 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

  if (v17)
    goto LABEL_46;
LABEL_47:
  v24 = self->_nrUUID;
  os_unfair_lock_lock(&sNRLogLock);
  objc_msgSend((id)sNRUUIDsEligibleForLogObject, "removeObject:", v24);

  os_unfair_lock_unlock(&sNRLogLock);
  v25.receiver = self;
  v25.super_class = (Class)NRBluetoothPacketParser;
  -[NRBluetoothPacketParser dealloc](&v25, sel_dealloc);
}

- (void)cancel
{
  os_log_t v3;
  os_log_t v4;
  _BOOL4 v5;
  os_log_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = _NRCopyLogObjectForNRUUID(self->_nrUUID);
  v4 = v3;
  if (sNRCopyLogToStdErr)
  {

LABEL_4:
    v6 = _NRCopyLogObjectForNRUUID(self->_nrUUID);
    _NRLogWithArgs((uint64_t)v6, 0, (uint64_t)"%s%.30s:%-4d Cancel", v7, v8, v9, v10, v11, (uint64_t)");

    goto LABEL_5;
  }
  v5 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v5)
    goto LABEL_4;
LABEL_5:
  -[NRBluetoothPacketParser teardown]((uint64_t)self);
}

- (void)resetContextForPriority:(unsigned __int8)a3
{
  -[NRBluetoothPacketParser resetContextForPriorityInner:teardownContext:]((uint64_t)self, a3, 1);
}

- ($B174F4C94D76BD0ED270DA150CD5266A)createReadContextForPriority:(unsigned __int8)a3 readAvailableCallback:(void *)a4 readAvailableContext:(void *)a5
{
  unsigned int v6;
  $B174F4C94D76BD0ED270DA150CD5266A *v9;
  $B174F4C94D76BD0ED270DA150CD5266A *v10;
  _QWORD *v11;
  _BYTE *v12;
  void *v13;
  unsigned __int8 v14;
  os_log_t v15;
  os_log_t v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __CFString *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  _BOOL4 v29;
  NSObject *v30;
  NSObject *v31;
  _BOOL4 v32;
  NSObject *v33;
  NSObject *v34;
  _BOOL4 v35;
  _BOOL4 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
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

  if (self->_state == 4)
    return 0;
  if (!a4)
  {
    v25 = nrCopyLogObj_506();
    v26 = v25;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v36 = os_log_type_enabled(v25, OS_LOG_TYPE_FAULT);

      if (!v36)
        return 0;
    }
    v23 = nrCopyLogObj_506();
    _NRLogWithArgs((uint64_t)v23, 17, (uint64_t)"%s called with null callback", v37, v38, v39, v40, v41, (uint64_t)"-[NRBluetoothPacketParser createReadContextForPriority:readAvailableCallback:readAvailableContext:]");
    v10 = 0;
LABEL_16:

    return v10;
  }
  v6 = a3;
  if (!a3)
    return 0;
  v9 = ($B174F4C94D76BD0ED270DA150CD5266A *)malloc_type_calloc(1uLL, 0x28uLL, 0xF1748037uLL);
  if (!v9)
  {
    v27 = nrCopyLogObj_506();
    v28 = v27;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v29 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);

      if (!v29)
        goto LABEL_34;
    }
    v43 = nrCopyLogObj_506();
    _NRLogWithArgs((uint64_t)v43, 16, (uint64_t)"%s%.30s:%-4d ABORTING: strict_calloc(%zu, %zu) failed", v44, v45, v46, v47, v48, (uint64_t)");

LABEL_34:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    v49 = _os_log_pack_fill();
    v50 = 40;
LABEL_38:
    __os_log_helper_1_2_3_8_34_8_0_8_0(v49, v50);
    goto LABEL_42;
  }
  v10 = v9;
  v11 = malloc_type_calloc(1uLL, 0x20uLL, 0xF1748037uLL);
  if (!v11)
  {
    v30 = nrCopyLogObj_506();
    v31 = v30;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v32 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);

      if (!v32)
        goto LABEL_37;
    }
    v51 = nrCopyLogObj_506();
    _NRLogWithArgs((uint64_t)v51, 16, (uint64_t)"%s%.30s:%-4d ABORTING: strict_calloc(%zu, %zu) failed", v52, v53, v54, v55, v56, (uint64_t)");

LABEL_37:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    v49 = _os_log_pack_fill();
    v50 = 32;
    goto LABEL_38;
  }
  v12 = v11;
  v11[1] = self;
  v13 = malloc_type_malloc(0xFFFFuLL, 0xA172743EuLL);
  if (!v13)
  {
    v33 = nrCopyLogObj_506();
    v34 = v33;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v35 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);

      if (!v35)
        goto LABEL_41;
    }
    v57 = nrCopyLogObj_506();
    _NRLogWithArgs((uint64_t)v57, 16, (uint64_t)"%s%.30s:%-4d ABORTING: strict_malloc(%zu) failed", v58, v59, v60, v61, v62, (uint64_t)");

LABEL_41:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    v63 = _os_log_pack_fill();
    *(_DWORD *)v63 = 136446466;
    *(_QWORD *)(v63 + 4) = "strict_malloc";
    *(_WORD *)(v63 + 12) = 2048;
    *(_QWORD *)(v63 + 14) = 0xFFFFLL;
LABEL_42:
    v64 = nrCopyLogObj_506();
    _NRLogAbortWithPack(v64);
  }
  *(_QWORD *)v12 = v13;
  v12[26] = v6;
  v10->var3 = a4;
  v10->var4 = a5;
  v14 = v6 - 1;
  v10->var0 = v12;
  v10->var1 = NRBluetoothParserReadInputCallback;
  v10->var2 = NRBluetoothParserReadFlushCallback;
  if (v6 <= 3)
    *((_QWORD *)&self->_readContextForMedium + 2 * v14) = v10;
  ++self->_totalContextCount;
  v15 = _NRCopyLogObjectForNRUUID(self->_nrUUID);
  v16 = v15;
  if (sNRCopyLogToStdErr)
  {

LABEL_12:
    v23 = _NRCopyLogObjectForNRUUID(self->_nrUUID);
    if (v6 >= 4)
      v24 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown(%d)"), v6);
    else
      v24 = off_1EA3F7088[(char)v14];
    _NRLogWithArgs((uint64_t)v23, 0, (uint64_t)"%s%.30s:%-4d Created read context (%p) for %@ (total: %llu)", v18, v19, v20, v21, v22, (uint64_t)");

    goto LABEL_16;
  }
  v17 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

  if (v17)
    goto LABEL_12;
  return v10;
}

- ($3D27A55567FB06BC0E416B979767FD15)createWriteContextForPriority:(unsigned __int8)a3 writeOutputCallback:(void *)a4 writeOutputContext:(void *)a5
{
  unsigned int v6;
  $3D27A55567FB06BC0E416B979767FD15 *v9;
  $3D27A55567FB06BC0E416B979767FD15 *v10;
  _BYTE *v11;
  _BYTE *v12;
  void *v13;
  os_log_t v14;
  os_log_t v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  _BOOL4 v28;
  NSObject *v29;
  NSObject *v30;
  _BOOL4 v31;
  NSObject *v32;
  NSObject *v33;
  _BOOL4 v34;
  _BOOL4 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;

  if (self->_state == 4)
    return 0;
  if (!a4)
  {
    v24 = nrCopyLogObj_506();
    v25 = v24;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v35 = os_log_type_enabled(v24, OS_LOG_TYPE_FAULT);

      if (!v35)
        return 0;
    }
    v22 = nrCopyLogObj_506();
    _NRLogWithArgs((uint64_t)v22, 17, (uint64_t)"%s called with null callback", v36, v37, v38, v39, v40, (uint64_t)"-[NRBluetoothPacketParser createWriteContextForPriority:writeOutputCallback:writeOutputContext:]");
    v10 = 0;
LABEL_16:

    return v10;
  }
  v6 = a3;
  if (!a3)
    return 0;
  v9 = ($3D27A55567FB06BC0E416B979767FD15 *)malloc_type_calloc(1uLL, 0x20uLL, 0xF1748037uLL);
  if (!v9)
  {
    v26 = nrCopyLogObj_506();
    v27 = v26;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v28 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);

      if (!v28)
        goto LABEL_34;
    }
    v42 = nrCopyLogObj_506();
    _NRLogWithArgs((uint64_t)v42, 16, (uint64_t)"%s%.30s:%-4d ABORTING: strict_calloc(%zu, %zu) failed", v43, v44, v45, v46, v47, (uint64_t)");

LABEL_34:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    v48 = _os_log_pack_fill();
    v49 = 32;
LABEL_38:
    __os_log_helper_1_2_3_8_34_8_0_8_0(v48, v49);
    goto LABEL_42;
  }
  v10 = v9;
  v11 = malloc_type_calloc(1uLL, 0x58uLL, 0xF1748037uLL);
  if (!v11)
  {
    v29 = nrCopyLogObj_506();
    v30 = v29;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v31 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);

      if (!v31)
        goto LABEL_37;
    }
    v50 = nrCopyLogObj_506();
    _NRLogWithArgs((uint64_t)v50, 16, (uint64_t)"%s%.30s:%-4d ABORTING: strict_calloc(%zu, %zu) failed", v51, v52, v53, v54, v55, (uint64_t)");

LABEL_37:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    v48 = _os_log_pack_fill();
    v49 = 88;
    goto LABEL_38;
  }
  v12 = v11;
  v13 = malloc_type_malloc(0x4000uLL, 0xA172743EuLL);
  if (!v13)
  {
    v32 = nrCopyLogObj_506();
    v33 = v32;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v34 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);

      if (!v34)
        goto LABEL_41;
    }
    v56 = nrCopyLogObj_506();
    _NRLogWithArgs((uint64_t)v56, 16, (uint64_t)"%s%.30s:%-4d ABORTING: strict_malloc(%zu) failed", v57, v58, v59, v60, v61, (uint64_t)");

LABEL_41:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    v62 = _os_log_pack_fill();
    *(_DWORD *)v62 = 136446466;
    *(_QWORD *)(v62 + 4) = "strict_malloc";
    *(_WORD *)(v62 + 12) = 2048;
    *(_QWORD *)(v62 + 14) = 0x4000;
LABEL_42:
    v63 = nrCopyLogObj_506();
    _NRLogAbortWithPack(v63);
  }
  *(_QWORD *)v12 = v13;
  v12[83] = v6;
  *((_QWORD *)v12 + 2) = self;
  v10->var0 = a5;
  v10->var1 = a4;
  v10->var2 = NRParserLinkWriteAvailable;
  v10->var3 = v12;
  if (v6 <= 3)
    *((_QWORD *)&self->_writeContextForMedium + 2 * (v6 - 1)) = v10;
  v14 = _NRCopyLogObjectForNRUUID(self->_nrUUID);
  v15 = v14;
  if (sNRCopyLogToStdErr)
  {

LABEL_12:
    v22 = _NRCopyLogObjectForNRUUID(self->_nrUUID);
    if (v6 >= 4)
      v23 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown(%d)"), v6);
    else
      v23 = off_1EA3F70A0[v6];
    _NRLogWithArgs((uint64_t)v22, 0, (uint64_t)"%s%.30s:%-4d Created write context (%p) for %@", v17, v18, v19, v20, v21, (uint64_t)");

    goto LABEL_16;
  }
  v16 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  if (v16)
    goto LABEL_12;
  return v10;
}

- (NSUUID)bluetoothUUID
{
  return self->_bluetoothUUID;
}

- (void)setBluetoothUUID:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkStatTimerSource, 0);
  objc_storeStrong((id *)&self->_poolPurgeTimer, 0);
  objc_storeStrong((id *)&self->_xpcComm, 0);
  objc_storeStrong((id *)&self->_nexusBKGroup, 0);
  objc_storeStrong((id *)&self->_nexusBEGroup, 0);
  objc_storeStrong((id *)&self->_nexusVIGroup, 0);
  objc_storeStrong((id *)&self->_nexusVOGroup, 0);
  objc_storeStrong((id *)&self->_dNexusBKOutputSource, 0);
  objc_storeStrong((id *)&self->_dNexusBKInputSource, 0);
  objc_storeStrong((id *)&self->_dNexusBEOutputSource, 0);
  objc_storeStrong((id *)&self->_dNexusBEInputSource, 0);
  objc_storeStrong((id *)&self->_dNexusVIOutputSource, 0);
  objc_storeStrong((id *)&self->_dNexusVIInputSource, 0);
  objc_storeStrong((id *)&self->_dNexusVOOutputSource, 0);
  objc_storeStrong((id *)&self->_dNexusVOInputSource, 0);
  objc_storeStrong((id *)&self->_remoteEndpoint, 0);
  objc_storeStrong((id *)&self->_localEndpoint, 0);
  objc_storeStrong((id *)&self->_nexusInstances, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_nrUUID, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_bluetoothUUID, 0);
}

- (void)handleInternalError:(uint64_t)a3
{
  id v10;
  void *v11;
  void *v12;
  os_log_t v13;
  os_log_t v14;
  _BOOL4 v15;
  os_log_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  _BOOL4 v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v10 = a2;
  v11 = v10;
  if (a1 && *(_BYTE *)(a1 + 8) != 4)
  {
    if (!v10)
    {
      v23 = nrCopyLogObj_506();
      v24 = v23;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v25 = os_log_type_enabled(v23, OS_LOG_TYPE_FAULT);

        if (!v25)
          goto LABEL_9;
      }
      v26 = nrCopyLogObj_506();
      _NRLogWithArgs((uint64_t)v26, 17, (uint64_t)"%s called with null errorFormat", v27, v28, v29, v30, v31, (uint64_t)"-[NRBluetoothPacketParser handleInternalError:]");

      goto LABEL_9;
    }
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v10, &a9);
    v13 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    v14 = v13;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v15 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

      if (!v15)
      {
LABEL_8:
        v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v12, CFSTR("error"));
        objc_msgSend(*(id *)(a1 + 400), "sendXPCCommDictionary:", v22);
        -[NRBluetoothPacketParser teardown](a1);

        goto LABEL_9;
      }
    }
    v16 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v16, 0, (uint64_t)"%s%.30s:%-4d internal error: %@", v17, v18, v19, v20, v21, (uint64_t)");

    goto LABEL_8;
  }
LABEL_9:

}

- (void)handleIncomingWakePacket:(uint64_t)a3 spi:
{
  void *v6;
  void *v7;
  id v8;

  if (a1)
  {
    if (*(_BYTE *)(a1 + 8) != 4)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("wake-pkt-sn"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("wake-pkt-spi"));

      objc_msgSend(*(id *)(a1 + 400), "sendXPCCommDictionary:", v8);
    }
  }
}

- (void)handleIncomingIKEData:(int)a3 linkPriority:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  os_log_t v10;
  os_log_t v11;
  _BOOL4 v12;
  os_log_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v5 = a2;
  if (!a1 || *(_BYTE *)(a1 + 8) == 4)
    goto LABEL_8;
  v19 = v5;
  if (gNRPacketLoggingEnabled)
  {
    v10 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    v11 = v10;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v12 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);

      if (!v12)
        goto LABEL_4;
    }
    v13 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    objc_msgSend(v19, "length");
    _NRLogWithArgs((uint64_t)v13, 1, (uint64_t)"%s%.30s:%-4d handling uIKE packet of %llu bytes", v14, v15, v16, v17, v18, (uint64_t)");

  }
LABEL_4:
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = v6;
  if ((a3 - 1) > 2)
    v8 = &unk_1EA400ED0;
  else
    v8 = (void *)qword_1EA3F70C0[(a3 - 1)];
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("channel-id"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, CFSTR("message-data"));
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("message"));
  objc_msgSend(*(id *)(a1 + 400), "sendXPCCommDictionary:", v9);

  v5 = v19;
LABEL_8:

}

- (void)teardown
{
  os_log_t v2;
  os_log_t v3;
  _BOOL4 v4;
  os_log_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  os_log_t v42;
  os_log_t v43;
  os_log_t v44;
  os_log_t v45;
  os_log_t v46;
  os_log_t v47;
  os_log_t v48;
  os_log_t v49;
  os_log_t v50;
  os_log_t v51;
  os_log_t v52;
  os_log_t v53;
  os_log_t v54;
  os_log_t v55;
  os_log_t v56;
  os_log_t v57;
  _BOOL4 v58;
  os_log_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _BOOL4 v65;
  os_log_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _BOOL4 v72;
  os_log_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _BOOL4 v79;
  os_log_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  _BOOL4 v86;
  os_log_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  _BOOL4 v93;
  os_log_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  _BOOL4 v100;
  os_log_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  _BOOL4 v107;
  os_log_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;

  if (!a1)
    return;
  v2 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
  v3 = v2;
  if (sNRCopyLogToStdErr)
  {

  }
  else
  {
    v4 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (!v4)
      goto LABEL_6;
  }
  v5 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
  _NRLogWithArgs((uint64_t)v5, 0, (uint64_t)"%s%.30s:%-4d Teardown", v6, v7, v8, v9, v10, (uint64_t)");

LABEL_6:
  -[NRBluetoothPacketParser changeStateTo:](a1, 4u);
  *(_BYTE *)(a1 + 10) = 0;
  v11 = *(void **)(a1 + 400);
  if (v11)
  {
    objc_msgSend(v11, "cancel");
    v12 = *(void **)(a1 + 400);
    *(_QWORD *)(a1 + 400) = 0;

  }
  v13 = *(NSObject **)(a1 + 304);
  if (v13)
  {
    v14 = *(_QWORD *)(a1 + 136);
    if ((v14 & 8) == 0)
    {
LABEL_12:
      dispatch_source_cancel(v13);
      v15 = *(void **)(a1 + 304);
      *(_QWORD *)(a1 + 304) = 0;

      goto LABEL_13;
    }
    *(_QWORD *)(a1 + 136) = v14 & 0xFFFFFFFFFFFFFFF7;
    if (!gNRPacketLoggingEnabled)
    {
LABEL_11:
      dispatch_resume(*(dispatch_object_t *)(a1 + 304));
      v13 = *(NSObject **)(a1 + 304);
      goto LABEL_12;
    }
    v42 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    v43 = v42;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v58 = os_log_type_enabled(v42, OS_LOG_TYPE_INFO);

      if (!v58)
        goto LABEL_11;
    }
    v59 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v59, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v60, v61, v62, v63, v64, (uint64_t)");

    goto LABEL_11;
  }
LABEL_13:
  v16 = *(NSObject **)(a1 + 312);
  if (!v16)
    goto LABEL_18;
  v17 = *(_QWORD *)(a1 + 136);
  if ((v17 & 0x80) != 0)
  {
    *(_QWORD *)(a1 + 136) = v17 & 0xFFFFFFFFFFFFFF7FLL;
    if (!gNRPacketLoggingEnabled)
    {
LABEL_16:
      dispatch_resume(*(dispatch_object_t *)(a1 + 312));
      v16 = *(NSObject **)(a1 + 312);
      goto LABEL_17;
    }
    v44 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    v45 = v44;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v65 = os_log_type_enabled(v44, OS_LOG_TYPE_INFO);

      if (!v65)
        goto LABEL_16;
    }
    v66 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v66, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOOutput", v67, v68, v69, v70, v71, (uint64_t)");

    goto LABEL_16;
  }
LABEL_17:
  dispatch_source_cancel(v16);
  v18 = *(void **)(a1 + 312);
  *(_QWORD *)(a1 + 312) = 0;

LABEL_18:
  if (*(_QWORD *)(a1 + 208))
  {
    if (!*(_QWORD *)(a1 + 368))
      os_channel_destroy();
    *(_QWORD *)(a1 + 208) = 0;
  }
  *(_QWORD *)(a1 + 240) = 0;
  *(_QWORD *)(a1 + 248) = 0;
  v19 = *(NSObject **)(a1 + 320);
  if (v19)
  {
    v20 = *(_QWORD *)(a1 + 136);
    if ((v20 & 0x10) == 0)
    {
LABEL_26:
      dispatch_source_cancel(v19);
      v21 = *(void **)(a1 + 320);
      *(_QWORD *)(a1 + 320) = 0;

      goto LABEL_27;
    }
    *(_QWORD *)(a1 + 136) = v20 & 0xFFFFFFFFFFFFFFEFLL;
    if (!gNRPacketLoggingEnabled)
    {
LABEL_25:
      dispatch_resume(*(dispatch_object_t *)(a1 + 320));
      v19 = *(NSObject **)(a1 + 320);
      goto LABEL_26;
    }
    v46 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    v47 = v46;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v72 = os_log_type_enabled(v46, OS_LOG_TYPE_INFO);

      if (!v72)
        goto LABEL_25;
    }
    v73 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v73, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVIInput", v74, v75, v76, v77, v78, (uint64_t)");

    goto LABEL_25;
  }
LABEL_27:
  v22 = *(NSObject **)(a1 + 328);
  if (!v22)
    goto LABEL_32;
  v23 = *(_QWORD *)(a1 + 136);
  if ((v23 & 0x100) != 0)
  {
    *(_QWORD *)(a1 + 136) = v23 & 0xFFFFFFFFFFFFFEFFLL;
    if (!gNRPacketLoggingEnabled)
    {
LABEL_30:
      dispatch_resume(*(dispatch_object_t *)(a1 + 328));
      v22 = *(NSObject **)(a1 + 328);
      goto LABEL_31;
    }
    v48 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    v49 = v48;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v79 = os_log_type_enabled(v48, OS_LOG_TYPE_INFO);

      if (!v79)
        goto LABEL_30;
    }
    v80 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v80, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVIOutput", v81, v82, v83, v84, v85, (uint64_t)");

    goto LABEL_30;
  }
LABEL_31:
  dispatch_source_cancel(v22);
  v24 = *(void **)(a1 + 328);
  *(_QWORD *)(a1 + 328) = 0;

LABEL_32:
  if (*(_QWORD *)(a1 + 216))
  {
    if (!*(_QWORD *)(a1 + 376))
      os_channel_destroy();
    *(_QWORD *)(a1 + 216) = 0;
  }
  *(_QWORD *)(a1 + 256) = 0;
  *(_QWORD *)(a1 + 264) = 0;
  v25 = *(NSObject **)(a1 + 336);
  if (v25)
  {
    v26 = *(_QWORD *)(a1 + 136);
    if ((v26 & 0x20) == 0)
    {
LABEL_40:
      dispatch_source_cancel(v25);
      v27 = *(void **)(a1 + 336);
      *(_QWORD *)(a1 + 336) = 0;

      goto LABEL_41;
    }
    *(_QWORD *)(a1 + 136) = v26 & 0xFFFFFFFFFFFFFFDFLL;
    if (!gNRPacketLoggingEnabled)
    {
LABEL_39:
      dispatch_resume(*(dispatch_object_t *)(a1 + 336));
      v25 = *(NSObject **)(a1 + 336);
      goto LABEL_40;
    }
    v50 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    v51 = v50;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v86 = os_log_type_enabled(v50, OS_LOG_TYPE_INFO);

      if (!v86)
        goto LABEL_39;
    }
    v87 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v87, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBEInput", v88, v89, v90, v91, v92, (uint64_t)");

    goto LABEL_39;
  }
LABEL_41:
  v28 = *(NSObject **)(a1 + 344);
  if (!v28)
    goto LABEL_46;
  v29 = *(_QWORD *)(a1 + 136);
  if ((v29 & 0x200) != 0)
  {
    *(_QWORD *)(a1 + 136) = v29 & 0xFFFFFFFFFFFFFDFFLL;
    if (!gNRPacketLoggingEnabled)
    {
LABEL_44:
      dispatch_resume(*(dispatch_object_t *)(a1 + 344));
      v28 = *(NSObject **)(a1 + 344);
      goto LABEL_45;
    }
    v52 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    v53 = v52;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v93 = os_log_type_enabled(v52, OS_LOG_TYPE_INFO);

      if (!v93)
        goto LABEL_44;
    }
    v94 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v94, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBEOutput", v95, v96, v97, v98, v99, (uint64_t)");

    goto LABEL_44;
  }
LABEL_45:
  dispatch_source_cancel(v28);
  v30 = *(void **)(a1 + 344);
  *(_QWORD *)(a1 + 344) = 0;

LABEL_46:
  if (*(_QWORD *)(a1 + 224))
  {
    if (!*(_QWORD *)(a1 + 384))
      os_channel_destroy();
    *(_QWORD *)(a1 + 224) = 0;
  }
  *(_QWORD *)(a1 + 272) = 0;
  *(_QWORD *)(a1 + 280) = 0;
  v31 = *(NSObject **)(a1 + 352);
  if (v31)
  {
    v32 = *(_QWORD *)(a1 + 136);
    if ((v32 & 0x40) == 0)
    {
LABEL_54:
      dispatch_source_cancel(v31);
      v33 = *(void **)(a1 + 352);
      *(_QWORD *)(a1 + 352) = 0;

      goto LABEL_55;
    }
    *(_QWORD *)(a1 + 136) = v32 & 0xFFFFFFFFFFFFFFBFLL;
    if (!gNRPacketLoggingEnabled)
    {
LABEL_53:
      dispatch_resume(*(dispatch_object_t *)(a1 + 352));
      v31 = *(NSObject **)(a1 + 352);
      goto LABEL_54;
    }
    v54 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    v55 = v54;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v100 = os_log_type_enabled(v54, OS_LOG_TYPE_INFO);

      if (!v100)
        goto LABEL_53;
    }
    v101 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v101, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBKInput", v102, v103, v104, v105, v106, (uint64_t)");

    goto LABEL_53;
  }
LABEL_55:
  v34 = *(NSObject **)(a1 + 360);
  if (v34)
  {
    v35 = *(_QWORD *)(a1 + 136);
    if ((v35 & 0x400) == 0)
    {
LABEL_59:
      dispatch_source_cancel(v34);
      v36 = *(void **)(a1 + 360);
      *(_QWORD *)(a1 + 360) = 0;

      goto LABEL_60;
    }
    *(_QWORD *)(a1 + 136) = v35 & 0xFFFFFFFFFFFFFBFFLL;
    if (!gNRPacketLoggingEnabled)
    {
LABEL_58:
      dispatch_resume(*(dispatch_object_t *)(a1 + 360));
      v34 = *(NSObject **)(a1 + 360);
      goto LABEL_59;
    }
    v56 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    v57 = v56;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v107 = os_log_type_enabled(v56, OS_LOG_TYPE_INFO);

      if (!v107)
        goto LABEL_58;
    }
    v108 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v108, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBKOutput", v109, v110, v111, v112, v113, (uint64_t)");

    goto LABEL_58;
  }
LABEL_60:
  if (*(_QWORD *)(a1 + 232))
  {
    if (!*(_QWORD *)(a1 + 392))
      os_channel_destroy();
    *(_QWORD *)(a1 + 232) = 0;
  }
  *(_QWORD *)(a1 + 288) = 0;
  *(_QWORD *)(a1 + 296) = 0;
  v37 = *(void **)(a1 + 64);
  *(_QWORD *)(a1 + 64) = 0;

  *(_BYTE *)(a1 + 11) = 0;
  v38 = *(NSObject **)(a1 + 424);
  if (v38)
  {
    dispatch_source_cancel(v38);
    v39 = *(void **)(a1 + 424);
    *(_QWORD *)(a1 + 424) = 0;

  }
  v40 = *(NSObject **)(a1 + 656);
  if (v40)
  {
    dispatch_source_cancel(v40);
    v41 = *(void **)(a1 + 656);
    *(_QWORD *)(a1 + 656) = 0;

  }
}

- (void)changeStateTo:(uint64_t)a1
{
  int v2;
  os_log_t v5;
  os_log_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  os_log_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  os_log_t v23;

  v2 = *(unsigned __int8 *)(a1 + 8);
  if (v2 == a2)
    return;
  v5 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
  v6 = v5;
  if (v2 != 4)
  {
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v13 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

      if (!v13)
      {
LABEL_14:
        *(_BYTE *)(a1 + 8) = a2;
        return;
      }
    }
    v19 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    v20 = *(unsigned __int8 *)(a1 + 8);
    if (v20 >= 5)
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown(%d)"), v20);
    else
      v21 = (void *)*((_QWORD *)&off_1EA3F7030 + *(unsigned __int8 *)(a1 + 8));
    v22 = (void *)*((_QWORD *)&off_1EA3F7030 + a2);
    _NRLogWithArgs((uint64_t)v19, 0, (uint64_t)"%s%.30s:%-4d Changing state: %@ -> %@", v14, v15, v16, v17, v18, (uint64_t)");

    goto LABEL_14;
  }
  if (sNRCopyLogToStdErr)
  {

  }
  else
  {
    v7 = os_log_type_enabled(v5, OS_LOG_TYPE_FAULT);

    if (!v7)
      return;
  }
  v23 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
  _NRLogWithArgs((uint64_t)v23, 17, (uint64_t)"Invalid state change %@", v8, v9, v10, v11, v12, a1);

}

- (void)resetContextForPriorityInner:(int)a3 teardownContext:
{
  os_log_t v6;
  os_log_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  os_log_t v14;
  __CFString *v15;
  unsigned int v16;
  uint64_t v17;
  os_log_t v18;
  os_log_t v19;
  _BOOL4 v20;
  os_log_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void ***v27;
  void **v28;
  _QWORD *v29;
  uint64_t v30;
  void ***v31;
  void **v32;
  void ***v33;
  void **v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  os_log_t v38;
  os_log_t v39;
  os_log_t v40;
  os_log_t v41;
  os_log_t v42;
  os_log_t v43;
  os_log_t v44;
  os_log_t v45;
  _BOOL4 v46;
  os_log_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _BOOL4 v53;
  os_log_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _BOOL4 v60;
  os_log_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _BOOL4 v67;
  os_log_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;

  if (!a1)
    return;
  v6 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
  v7 = v6;
  if (sNRCopyLogToStdErr)
  {

  }
  else
  {
    v8 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (!v8)
      goto LABEL_9;
  }
  v14 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
  if (a2 >= 4)
    v15 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown(%d)"), a2);
  else
    v15 = off_1EA3F70A0[a2];
  _NRLogWithArgs((uint64_t)v14, 0, (uint64_t)"%s%.30s:%-4d Resetting context for priority: %@ (%d)", v9, v10, v11, v12, v13, (uint64_t)");

LABEL_9:
  v16 = 0xF7FBFDFF >> (8 * a2);
  if (a2 >= 4)
    LOBYTE(v16) = -1;
  *(_BYTE *)(a1 + 10) &= v16;
  if (!a3)
    goto LABEL_53;
  if ((a2 - 1) >= 3)
  {
    v18 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    v19 = v18;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v20 = os_log_type_enabled(v18, OS_LOG_TYPE_FAULT);

      if (!v20)
        goto LABEL_20;
    }
    v21 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v21, 17, (uint64_t)"Invalid priority %d", v22, v23, v24, v25, v26, a2);

  }
  else if (*(_QWORD *)(a1 + 16 * (a2 - 1) + 88))
  {
    v17 = *(_QWORD *)(a1 + 664);
    if (v17)
      *(_QWORD *)(a1 + 664) = v17 - 1;
  }
LABEL_20:
  switch((_DWORD)a2)
  {
    case 1:
      v31 = *(void ****)(a1 + 88);
      if (v31)
      {
        v32 = *v31;
        if (!*v31)
          goto LABEL_36;
        if (*v32)
        {
          free(*v32);
          ***(_QWORD ***)(a1 + 88) = 0;
          v31 = *(void ****)(a1 + 88);
          v32 = *v31;
          if (!*v31)
            goto LABEL_36;
        }
        free(v32);
        **(_QWORD **)(a1 + 88) = 0;
        v31 = *(void ****)(a1 + 88);
        if (v31)
        {
LABEL_36:
          free(v31);
          *(_QWORD *)(a1 + 88) = 0;
        }
      }
      v30 = a1 + 96;
      v29 = *(_QWORD **)(a1 + 96);
      if (v29)
        goto LABEL_46;
      break;
    case 2:
      v33 = *(void ****)(a1 + 104);
      if (v33)
      {
        v34 = *v33;
        if (!*v33)
          goto LABEL_44;
        if (*v34)
        {
          free(*v34);
          ***(_QWORD ***)(a1 + 104) = 0;
          v33 = *(void ****)(a1 + 104);
          v34 = *v33;
          if (!*v33)
            goto LABEL_44;
        }
        free(v34);
        **(_QWORD **)(a1 + 104) = 0;
        v33 = *(void ****)(a1 + 104);
        if (v33)
        {
LABEL_44:
          free(v33);
          *(_QWORD *)(a1 + 104) = 0;
        }
      }
      v30 = a1 + 112;
      v29 = *(_QWORD **)(a1 + 112);
      if (v29)
        goto LABEL_46;
      break;
    case 3:
      v27 = *(void ****)(a1 + 120);
      if (v27)
      {
        v28 = *v27;
        if (!*v27)
          goto LABEL_28;
        if (*v28)
        {
          free(*v28);
          ***(_QWORD ***)(a1 + 120) = 0;
          v27 = *(void ****)(a1 + 120);
          v28 = *v27;
          if (!*v27)
            goto LABEL_28;
        }
        free(v28);
        **(_QWORD **)(a1 + 120) = 0;
        v27 = *(void ****)(a1 + 120);
        if (v27)
        {
LABEL_28:
          free(v27);
          *(_QWORD *)(a1 + 120) = 0;
        }
      }
      v30 = a1 + 128;
      v29 = *(_QWORD **)(a1 + 128);
      if (!v29)
        break;
LABEL_46:
      v35 = v29[3];
      if (!v35)
        goto LABEL_52;
      if (*(_QWORD *)v35)
      {
        free(*(void **)v35);
        **(_QWORD **)(*(_QWORD *)v30 + 24) = 0;
        v35 = *(_QWORD *)(*(_QWORD *)v30 + 24);
      }
      v36 = *(void **)(v35 + 8);
      if (v36)
      {
        free(v36);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v30 + 24) + 8) = 0;
        v29 = *(_QWORD **)v30;
        v35 = *(_QWORD *)(*(_QWORD *)v30 + 24);
        if (!v35)
          goto LABEL_52;
      }
      free((void *)v35);
      *(_QWORD *)(*(_QWORD *)v30 + 24) = 0;
      v29 = *(_QWORD **)v30;
      if (*(_QWORD *)v30)
      {
LABEL_52:
        free(v29);
        *(_QWORD *)v30 = 0;
      }
      break;
    default:
      break;
  }
LABEL_53:
  v37 = *(_QWORD *)(a1 + 136);
  if ((v37 & 8) != 0 && *(_QWORD *)(a1 + 304))
  {
    *(_QWORD *)(a1 + 136) = v37 & 0xFFFFFFFFFFFFFFF7;
    if (!gNRPacketLoggingEnabled)
    {
LABEL_56:
      dispatch_resume(*(dispatch_object_t *)(a1 + 304));
      v37 = *(_QWORD *)(a1 + 136);
      goto LABEL_57;
    }
    v38 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    v39 = v38;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v46 = os_log_type_enabled(v38, OS_LOG_TYPE_INFO);

      if (!v46)
        goto LABEL_56;
    }
    v47 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v47, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v48, v49, v50, v51, v52, (uint64_t)");

    goto LABEL_56;
  }
LABEL_57:
  if ((v37 & 0x10) != 0 && *(_QWORD *)(a1 + 320))
  {
    *(_QWORD *)(a1 + 136) = v37 & 0xFFFFFFFFFFFFFFEFLL;
    if (!gNRPacketLoggingEnabled)
    {
LABEL_60:
      dispatch_resume(*(dispatch_object_t *)(a1 + 320));
      v37 = *(_QWORD *)(a1 + 136);
      goto LABEL_61;
    }
    v40 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    v41 = v40;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v53 = os_log_type_enabled(v40, OS_LOG_TYPE_INFO);

      if (!v53)
        goto LABEL_60;
    }
    v54 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v54, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVIInput", v55, v56, v57, v58, v59, (uint64_t)");

    goto LABEL_60;
  }
LABEL_61:
  if ((v37 & 0x20) != 0 && *(_QWORD *)(a1 + 336))
  {
    *(_QWORD *)(a1 + 136) = v37 & 0xFFFFFFFFFFFFFFDFLL;
    if (!gNRPacketLoggingEnabled)
    {
LABEL_64:
      dispatch_resume(*(dispatch_object_t *)(a1 + 336));
      v37 = *(_QWORD *)(a1 + 136);
      goto LABEL_65;
    }
    v42 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    v43 = v42;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v60 = os_log_type_enabled(v42, OS_LOG_TYPE_INFO);

      if (!v60)
        goto LABEL_64;
    }
    v61 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v61, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBEInput", v62, v63, v64, v65, v66, (uint64_t)");

    goto LABEL_64;
  }
LABEL_65:
  if ((v37 & 0x40) != 0 && *(_QWORD *)(a1 + 352))
  {
    *(_QWORD *)(a1 + 136) = v37 & 0xFFFFFFFFFFFFFFBFLL;
    if (!gNRPacketLoggingEnabled)
    {
LABEL_68:
      dispatch_resume(*(dispatch_object_t *)(a1 + 352));
      return;
    }
    v44 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    v45 = v44;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v67 = os_log_type_enabled(v44, OS_LOG_TYPE_INFO);

      if (!v67)
        goto LABEL_68;
    }
    v68 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v68, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBKInput", v69, v70, v71, v72, v73, (uint64_t)");

    goto LABEL_68;
  }
}

void __32__NRBluetoothPacketParser_start__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NRXPCComm *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  dispatch_source_t v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id location;
  _QWORD handler[4];
  id v22[2];
  id from;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    if (*(_BYTE *)(v2 + 8) == 4 || *(_BYTE *)(v2 + 9))
      return;
    *(_BYTE *)(v2 + 9) = 1;
    v3 = *(void **)(a1 + 32);
  }
  else
  {
    v3 = 0;
  }
  objc_initWeak(&location, v3);
  v4 = [NRXPCComm alloc];
  v5 = *(_QWORD **)(a1 + 32);
  if (v5)
    v5 = (_QWORD *)v5[4];
  v6 = v5;
  v7 = *(_QWORD **)(a1 + 32);
  if (v7)
    v7 = (_QWORD *)v7[7];
  v8 = v7;
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __32__NRBluetoothPacketParser_start__block_invoke_2;
  v18[3] = &unk_1EA3F6F80;
  objc_copyWeak(&v19, &location);
  v10 = -[NRXPCComm initWithDeviceIdentifier:notificationQueue:notificationBlock:](v4, "initWithDeviceIdentifier:notificationQueue:notificationBlock:", v6, v8, v18);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 400);
  *(_QWORD *)(v11 + 400) = v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 400), "activate");
  v13 = *(_QWORD *)(a1 + 32);
  if (v13)
  {
    if (!*(_QWORD *)(v13 + 656))
    {
      v14 = *(id *)(v13 + 56);
      v15 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v14);
      v16 = *(void **)(v13 + 656);
      *(_QWORD *)(v13 + 656) = v15;

      dispatch_source_set_timer(*(dispatch_source_t *)(v13 + 656), 0, 0x12A05F200uLL, 0x1DCD6500uLL);
      objc_initWeak(&from, (id)v13);
      v17 = *(NSObject **)(v13 + 656);
      handler[0] = v9;
      handler[1] = 3221225472;
      handler[2] = __44__NRBluetoothPacketParser_armLinkStatsTimer__block_invoke;
      handler[3] = &unk_1EA3F6FA8;
      objc_copyWeak(v22, &from);
      v22[1] = (id)5;
      dispatch_source_set_event_handler(v17, handler);
      dispatch_resume(*(dispatch_object_t *)(v13 + 656));
      objc_destroyWeak(v22);
      objc_destroyWeak(&from);
    }
  }
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __32__NRBluetoothPacketParser_start__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void **WeakRetained;
  uint64_t v5;
  void **v6;
  os_log_t v7;
  os_log_t v8;
  _BOOL4 v9;
  os_log_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  unsigned int v25;
  uint64_t v26;
  os_log_t v27;
  os_log_t v28;
  _BOOL4 v29;
  os_log_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  os_log_t v37;
  os_log_t v38;
  _BOOL4 v39;
  os_log_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(_QWORD);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  os_log_t v51;
  os_log_t v52;
  os_log_t v53;
  os_log_t v54;
  uint64_t v55;
  _BOOL4 v56;
  os_log_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  os_log_t v64;
  os_log_t v65;
  void *v66;
  _BOOL4 v67;
  os_log_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  __CFString *v76;
  int v77;
  size_t v78;
  void *v79;
  os_log_t v80;
  os_log_t v81;
  os_log_t v82;
  os_log_t v83;
  _BOOL4 v84;
  os_log_t v85;
  __CFString *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  int v92;
  void *v93;
  _BOOL4 v94;
  os_log_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  _BOOL4 v101;
  os_log_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  int v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void (*v114)(uint64_t);
  os_log_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  id v121;
  os_log_t v122;
  os_log_t v123;
  _BOOL4 v124;
  os_log_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  id v132;
  unint64_t v133;
  uint64_t v134;
  uint64_t v135;
  _QWORD *v136;
  char v137;
  int v138;
  const char *v139;
  _QWORD *v140;
  uint64_t v141;
  int v142;
  __int16 v143;
  int v144;
  char *v145;
  uint64_t v146;
  BOOL v147;
  uint64_t v148;
  int v149;
  os_log_t v150;
  os_log_t v151;
  _BOOL4 v152;
  os_log_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  os_log_t v159;
  os_log_t v160;
  os_log_t v161;
  _BOOL4 v162;
  os_log_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  int v169;
  uint64_t v170;
  unsigned int v171;
  uint64_t v172;
  size_t v173;
  char *v174;
  unsigned int v175;
  unsigned int v176;
  int v177;
  os_log_t next_slot;
  unsigned int v179;
  unsigned int data_offset;
  uint64_t object_address;
  unsigned int data_length;
  unsigned __int16 v183;
  int v184;
  unsigned __int8 *v185;
  uint64_t v186;
  unsigned int v187;
  unsigned int v188;
  os_log_t v189;
  os_log_t v190;
  os_log_t v191;
  os_log_t v192;
  os_log_t v193;
  _BOOL4 v194;
  os_log_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  os_log_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  os_log_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  NSObject *v213;
  int v214;
  uint64_t v215;
  char v216;
  int v217;
  unint64_t v218;
  os_log_t v219;
  uint64_t v220;
  os_log_t v221;
  uint64_t v222;
  os_log_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  unint64_t v231;
  unsigned int v232;
  unsigned int v233;
  int v234;
  os_log_t v235;
  os_log_t v236;
  os_log_t v237;
  os_log_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  os_log_t v249;
  os_log_t v250;
  os_log_t v251;
  os_log_t v252;
  os_log_t v253;
  os_log_t v254;
  os_log_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  os_log_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  os_log_t v277;
  os_log_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  _BOOL4 v299;
  int v300;
  os_log_t v301;
  os_log_t v302;
  _BOOL4 v303;
  os_log_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  unsigned int v310;
  unsigned int v311;
  int v312;
  os_log_t v313;
  os_log_t v314;
  int v315;
  os_log_t v316;
  _BOOL4 v317;
  os_log_t v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  _BOOL4 v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  unsigned int v330;
  void **v331;
  uint64_t v332;
  dispatch_object_t *v333;
  os_log_t v334;
  os_log_t v335;
  uint64_t v336;
  uint64_t v337;
  os_log_t v338;
  os_log_t v339;
  int v340;
  unsigned int v341;
  unsigned int v342;
  void *v343;
  void *v344;
  void *v345;
  void *v346;
  void *v347;
  id v348;
  id v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t i;
  void *v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  id v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  void *v368;
  void *v369;
  void *v370;
  char *v371;
  int v372;
  unsigned int v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  int v381;
  void *v382;
  void *v383;
  id v384;
  uint64_t v385;
  uint64_t v386;
  unsigned int v387;
  uint64_t v388;
  uint64_t *v389;
  uint64_t v390;
  uint64_t v391;
  void (*v392)(_QWORD);
  unsigned int v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  unsigned int v400;
  unsigned int v401;
  void **v402;
  os_log_t v403;
  os_log_t v404;
  void *v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  uint64_t v412;
  void **v413;
  void *v414;
  void *v415;
  void *v416;
  void *v417;
  os_log_t v418;
  os_log_t v419;
  os_log_t v420;
  os_log_t v421;
  _BOOL4 v422;
  os_log_t v423;
  uint64_t v424;
  uint64_t v425;
  uint64_t v426;
  uint64_t v427;
  uint64_t v428;
  os_log_t v429;
  os_log_t v430;
  _BOOL4 v431;
  os_log_t v432;
  __CFString *v433;
  uint64_t v434;
  uint64_t v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t v438;
  os_log_t v439;
  os_log_t v440;
  _BOOL4 v441;
  uint64_t v442;
  uint64_t v443;
  uint64_t v444;
  uint64_t v445;
  uint64_t v446;
  _BOOL4 v447;
  os_log_t v448;
  uint64_t v449;
  uint64_t v450;
  uint64_t v451;
  uint64_t v452;
  uint64_t v453;
  _BOOL4 v454;
  os_log_t v455;
  uint64_t v456;
  uint64_t v457;
  uint64_t v458;
  uint64_t v459;
  uint64_t v460;
  uint64_t v461;
  uint64_t v462;
  uint64_t v463;
  uint64_t v464;
  uint64_t v465;
  uint64_t v466;
  uint64_t v467;
  size_t v468;
  __CFString *v469;
  __CFString *v470;
  int v471;
  uint64_t v472;
  uint64_t v473;
  uint64_t v474;
  uint64_t v475;
  uint64_t v476;
  void (*v477)(uint64_t);
  id v478;
  unint64_t v479;
  uint64_t v480;
  _QWORD *v481;
  char v482;
  int v483;
  const char *v484;
  _QWORD *v485;
  uint64_t v486;
  int v487;
  __int16 v488;
  int v489;
  uint64_t v490;
  uint64_t v491;
  uint64_t v492;
  int v493;
  os_log_t v494;
  os_log_t v495;
  _BOOL4 v496;
  os_log_t v497;
  uint64_t v498;
  uint64_t v499;
  uint64_t v500;
  uint64_t v501;
  uint64_t v502;
  os_log_t v503;
  os_log_t v504;
  os_log_t v505;
  _BOOL4 v506;
  os_log_t v507;
  uint64_t v508;
  uint64_t v509;
  uint64_t v510;
  uint64_t v511;
  uint64_t v512;
  int v513;
  uint64_t v514;
  unsigned int v515;
  uint64_t v516;
  size_t v517;
  char *v518;
  unsigned int v519;
  unsigned int v520;
  int v521;
  os_log_t v522;
  unsigned int v523;
  unsigned int v524;
  uint64_t v525;
  unsigned int v526;
  unsigned __int16 v527;
  int v528;
  unsigned __int8 *v529;
  uint64_t v530;
  unsigned int v531;
  unsigned int v532;
  os_log_t v533;
  os_log_t v534;
  os_log_t v535;
  os_log_t v536;
  os_log_t v537;
  _BOOL4 v538;
  os_log_t v539;
  uint64_t v540;
  uint64_t v541;
  uint64_t v542;
  uint64_t v543;
  uint64_t v544;
  os_log_t v545;
  uint64_t v546;
  uint64_t v547;
  uint64_t v548;
  uint64_t v549;
  uint64_t v550;
  os_log_t v551;
  uint64_t v552;
  uint64_t v553;
  uint64_t v554;
  uint64_t v555;
  uint64_t v556;
  NSObject *v557;
  int v558;
  uint64_t v559;
  char v560;
  int v561;
  unint64_t v562;
  os_log_t v563;
  uint64_t v564;
  uint64_t v565;
  os_log_t v566;
  uint64_t v567;
  os_log_t v568;
  uint64_t v569;
  uint64_t v570;
  uint64_t v571;
  uint64_t v572;
  uint64_t v573;
  uint64_t v574;
  unint64_t v575;
  unsigned int v576;
  unsigned int v577;
  int v578;
  os_log_t v579;
  os_log_t v580;
  os_log_t v581;
  os_log_t v582;
  uint64_t v583;
  uint64_t v584;
  uint64_t v585;
  uint64_t v586;
  uint64_t v587;
  uint64_t v588;
  uint64_t v589;
  uint64_t v590;
  uint64_t v591;
  uint64_t v592;
  os_log_t v593;
  os_log_t v594;
  os_log_t v595;
  os_log_t v596;
  os_log_t v597;
  os_log_t v598;
  _BOOL4 v599;
  os_log_t v600;
  uint64_t v601;
  uint64_t v602;
  uint64_t v603;
  uint64_t v604;
  uint64_t v605;
  os_log_t v606;
  uint64_t v607;
  uint64_t v608;
  uint64_t v609;
  uint64_t v610;
  uint64_t v611;
  uint64_t v612;
  uint64_t v613;
  uint64_t v614;
  uint64_t v615;
  uint64_t v616;
  uint64_t v617;
  uint64_t v618;
  uint64_t v619;
  uint64_t v620;
  uint64_t v621;
  os_log_t v622;
  os_log_t v623;
  uint64_t v624;
  uint64_t v625;
  uint64_t v626;
  uint64_t v627;
  uint64_t v628;
  uint64_t v629;
  uint64_t v630;
  uint64_t v631;
  uint64_t v632;
  uint64_t v633;
  uint64_t v634;
  uint64_t v635;
  uint64_t v636;
  uint64_t v637;
  uint64_t v638;
  uint64_t v639;
  uint64_t v640;
  uint64_t v641;
  uint64_t v642;
  uint64_t v643;
  _BOOL4 v644;
  int v645;
  os_log_t v646;
  os_log_t v647;
  _BOOL4 v648;
  os_log_t v649;
  uint64_t v650;
  uint64_t v651;
  uint64_t v652;
  uint64_t v653;
  uint64_t v654;
  unsigned int v655;
  unsigned int v656;
  int v657;
  os_log_t v658;
  os_log_t v659;
  int v660;
  os_log_t v661;
  _BOOL4 v662;
  os_log_t v663;
  uint64_t v664;
  uint64_t v665;
  uint64_t v666;
  uint64_t v667;
  uint64_t v668;
  _BOOL4 v669;
  uint64_t v670;
  uint64_t v671;
  uint64_t v672;
  uint64_t v673;
  uint64_t v674;
  NSObject *v675;
  NSObject *v676;
  _BOOL4 v677;
  id v678;
  uint64_t v679;
  uint64_t v680;
  uint64_t v681;
  uint64_t v682;
  uint64_t v683;
  uint64_t v684;
  id v685;
  unsigned int v686;
  uint64_t v687;
  dispatch_object_t *v688;
  os_log_t v689;
  os_log_t v690;
  uint64_t v691;
  uint64_t v692;
  uint64_t v693;
  os_log_t v694;
  os_log_t v695;
  uint64_t v696;
  uint64_t v697;
  uint64_t v698;
  unsigned int v699;
  unsigned int v700;
  _BOOL4 v701;
  os_log_t v702;
  uint64_t v703;
  uint64_t v704;
  uint64_t v705;
  uint64_t v706;
  uint64_t v707;
  NSObject *v708;
  NSObject *v709;
  _BOOL4 v710;
  NSObject *v711;
  NSObject *v712;
  _BOOL4 v713;
  os_log_t v714;
  os_log_t v715;
  uint64_t v716;
  void **v717;
  os_log_t v718;
  os_log_t v719;
  id v720;
  uint64_t v721;
  uint64_t v722;
  uint64_t v723;
  uint64_t v724;
  uint64_t v725;
  uint64_t v726;
  id v727;
  uint64_t v728;
  uint64_t v729;
  uint64_t v730;
  uint64_t v731;
  uint64_t v732;
  uint64_t v733;
  os_log_t v734;
  os_log_t v735;
  os_log_t v736;
  uint64_t v737;
  uint64_t v738;
  uint64_t v739;
  uint64_t v740;
  uint64_t v741;
  _BOOL4 v742;
  os_log_t v743;
  uint64_t v744;
  uint64_t v745;
  uint64_t v746;
  uint64_t v747;
  uint64_t v748;
  _BOOL4 v749;
  os_log_t v750;
  uint64_t v751;
  uint64_t v752;
  uint64_t v753;
  uint64_t v754;
  uint64_t v755;
  char v756;
  os_log_t v757;
  os_log_t v758;
  os_log_t v759;
  id v760;
  os_log_t v761;
  os_log_t v762;
  _BOOL4 v763;
  uint64_t v764;
  uint64_t v765;
  uint64_t v766;
  uint64_t v767;
  uint64_t v768;
  _BOOL4 v769;
  os_log_t v770;
  uint64_t v771;
  uint64_t v772;
  uint64_t v773;
  uint64_t v774;
  uint64_t v775;
  id v776;
  os_log_t v777;
  os_log_t v778;
  uint64_t v779;
  void **v780;
  os_log_t v781;
  os_log_t v782;
  os_log_t v783;
  uint64_t v784;
  uint64_t v785;
  uint64_t v786;
  uint64_t v787;
  uint64_t v788;
  NSObject *v789;
  NSObject *v790;
  _BOOL4 v791;
  void **v792;
  os_log_t v793;
  os_log_t v794;
  os_log_t v795;
  uint64_t v796;
  uint64_t v797;
  uint64_t v798;
  uint64_t v799;
  uint64_t v800;
  _BOOL4 v801;
  os_log_t v802;
  uint64_t v803;
  uint64_t v804;
  uint64_t v805;
  uint64_t v806;
  uint64_t v807;
  id v808;
  uint64_t v809;
  uint64_t v810;
  uint64_t v811;
  uint64_t v812;
  uint64_t v813;
  uint64_t v814;
  os_log_t v815;
  os_log_t v816;
  os_log_t v817;
  os_log_t v818;
  _BOOL4 v819;
  os_log_t v820;
  uint64_t v821;
  uint64_t v822;
  uint64_t v823;
  uint64_t v824;
  uint64_t v825;
  os_log_t v826;
  os_log_t v827;
  os_log_t v828;
  os_log_t v829;
  char v830;
  os_log_t v831;
  os_log_t v832;
  os_log_t v833;
  os_log_t v834;
  os_log_t v835;
  id v836;
  os_log_t v837;
  os_log_t v838;
  _BOOL4 v839;
  os_log_t v840;
  uint64_t v841;
  uint64_t v842;
  uint64_t v843;
  uint64_t v844;
  uint64_t v845;
  _BOOL4 v846;
  os_log_t v847;
  uint64_t v848;
  uint64_t v849;
  uint64_t v850;
  uint64_t v851;
  uint64_t v852;
  _BOOL4 v853;
  os_log_t v854;
  uint64_t v855;
  uint64_t v856;
  uint64_t v857;
  uint64_t v858;
  uint64_t v859;
  _BOOL4 v860;
  os_log_t v861;
  uint64_t v862;
  uint64_t v863;
  uint64_t v864;
  uint64_t v865;
  uint64_t v866;
  _BOOL4 v867;
  uint64_t v868;
  uint64_t v869;
  uint64_t v870;
  uint64_t v871;
  uint64_t v872;
  _BOOL4 v873;
  os_log_t v874;
  uint64_t v875;
  uint64_t v876;
  uint64_t v877;
  uint64_t v878;
  uint64_t v879;
  _BOOL4 v880;
  uint64_t v881;
  uint64_t v882;
  uint64_t v883;
  uint64_t v884;
  uint64_t v885;
  _BOOL4 v886;
  uint64_t v887;
  uint64_t v888;
  uint64_t v889;
  uint64_t v890;
  uint64_t v891;
  _BOOL4 v892;
  os_log_t v893;
  uint64_t v894;
  uint64_t v895;
  uint64_t v896;
  uint64_t v897;
  uint64_t v898;
  _BOOL4 v899;
  os_log_t v900;
  uint64_t v901;
  uint64_t v902;
  uint64_t v903;
  uint64_t v904;
  uint64_t v905;
  os_log_t v906;
  os_log_t v907;
  os_log_t v908;
  os_log_t v909;
  os_log_t v910;
  os_log_t v911;
  os_log_t v912;
  os_log_t v913;
  os_log_t v914;
  os_log_t v915;
  os_log_t v916;
  os_log_t v917;
  _BOOL4 v918;
  os_log_t v919;
  uint64_t v920;
  uint64_t v921;
  uint64_t v922;
  uint64_t v923;
  uint64_t v924;
  _BOOL4 v925;
  os_log_t v926;
  uint64_t v927;
  uint64_t v928;
  uint64_t v929;
  uint64_t v930;
  uint64_t v931;
  _BOOL4 v932;
  os_log_t v933;
  uint64_t v934;
  uint64_t v935;
  uint64_t v936;
  uint64_t v937;
  uint64_t v938;
  _BOOL4 v939;
  os_log_t v940;
  uint64_t v941;
  uint64_t v942;
  uint64_t v943;
  uint64_t v944;
  uint64_t v945;
  _BOOL4 v946;
  os_log_t v947;
  uint64_t v948;
  uint64_t v949;
  uint64_t v950;
  uint64_t v951;
  uint64_t v952;
  _BOOL4 v953;
  uint64_t v954;
  uint64_t v955;
  uint64_t v956;
  uint64_t v957;
  uint64_t v958;
  _BOOL4 v959;
  uint64_t v960;
  uint64_t v961;
  uint64_t v962;
  uint64_t v963;
  uint64_t v964;
  _BOOL4 v965;
  os_log_t v966;
  uint64_t v967;
  uint64_t v968;
  uint64_t v969;
  uint64_t v970;
  uint64_t v971;
  os_log_t v972;
  os_log_t v973;
  _BOOL4 v974;
  os_log_t v975;
  uint64_t v976;
  uint64_t v977;
  uint64_t v978;
  uint64_t v979;
  uint64_t v980;
  __CFString *StringFromNRLinkChannelPriority;
  uint64_t v982;
  uint64_t v983;
  __CFString *v984;
  uint64_t v985;
  int v986;
  id v987;
  const char *v988;
  uint64_t *v989;
  uint64_t *v990;
  id v991;
  void *v992;
  uint64_t v993;
  __CFString *v994;
  id v995;
  uint64_t v996;
  uint64_t ESPSequenceNumberFromPacket;
  char *v998;
  void **v999;
  void (*v1000)(uint64_t);
  uint64_t v1001;
  uint64_t v1002;
  _QWORD **v1003;
  uint64_t v1004;
  int v1005;
  os_log_t v1006;
  uint64_t v1007;
  uint64_t v1008;
  _QWORD *v1009;
  _BYTE *v1010;
  _BOOL4 v1011;
  uint64_t v1012;
  __int128 v1013;
  __int128 v1014;
  __int128 v1015;
  __int128 v1016;
  unint64_t v1017;
  uint64_t v1018;
  __int128 v1019;
  __int128 v1020;
  __int128 v1021;
  __int128 v1022;
  _BYTE v1023[128];
  uint64_t v1024;

  v1024 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (uint64_t)WeakRetained;
  if (!WeakRetained || *((_BYTE *)WeakRetained + 8) == 4)
    goto LABEL_347;
  v6 = WeakRetained + 5;
  v7 = _NRCopyLogObjectForNRUUID(WeakRetained[5]);
  v8 = v7;
  if (sNRCopyLogToStdErr)
  {

  }
  else
  {
    v9 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (!v9)
      goto LABEL_7;
  }
  v10 = _NRCopyLogObjectForNRUUID(*v6);
  _NRLogWithArgs((uint64_t)v10, 0, (uint64_t)"%s%.30s:%-4d Received notification: %@", v11, v12, v13, v14, v15, (uint64_t)");

LABEL_7:
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("packet-logging"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("packet-logging"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    gNRPacketLoggingEnabled = objc_msgSend(v17, "BOOLValue");

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("test-wake-pkt"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("test-wake-pkt"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(v5 + 18) = objc_msgSend(v19, "BOOLValue");

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("message"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v1004 = v5;
  if (!v20)
    goto LABEL_322;
  if (*(_BYTE *)(v5 + 8) == 1)
    -[NRBluetoothPacketParser changeStateTo:](v5, 2u);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("message"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("message-data"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("channel-id"));
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v999 = (void **)(v5 + 40);
  v996 = (uint64_t)v21;
  if (objc_msgSend(v23, "integerValue") == 2)
  {
    v24 = v22;
    v25 = 2;
    v26 = 104;
LABEL_18:

    goto LABEL_19;
  }
  if (objc_msgSend(v23, "integerValue") == 1)
  {
    v24 = v22;
    v25 = 1;
    v26 = 88;
    goto LABEL_18;
  }
  v55 = objc_msgSend(v23, "integerValue");

  if (v55 != 3)
  {
    v82 = _NRCopyLogObjectForNRUUID(*v6);
    v83 = v82;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v25 = os_log_type_enabled(v82, OS_LOG_TYPE_FAULT);

      if (!v25)
        goto LABEL_70;
    }
    v115 = _NRCopyLogObjectForNRUUID(*v6);
    _NRLogWithArgs((uint64_t)v115, 17, (uint64_t)"Invalid priority %d", v116, v117, v118, v119, v120, 0);

    v25 = 0;
LABEL_70:
    v121 = v23;
    v122 = _NRCopyLogObjectForNRUUID(*(void **)(v5 + 40));
    v123 = v122;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v124 = os_log_type_enabled(v122, OS_LOG_TYPE_ERROR);

      if (!v124)
      {
        v92 = 1;
        v93 = (void *)v996;
        v66 = v121;
        v6 = v999;
        goto LABEL_321;
      }
    }
    v125 = _NRCopyLogObjectForNRUUID(*v999);
    StringFromNRLinkChannelPriority = createStringFromNRLinkChannelPriority(v25);
    _NRLogWithArgs((uint64_t)v125, 16, (uint64_t)"%s%.30s:%-4d Invalid read context %sptr for prio %@", v126, v127, v128, v129, v130, (uint64_t)");

    v92 = 1;
    v93 = (void *)v996;
    v66 = v121;
    v6 = v999;
    goto LABEL_321;
  }
  v24 = v22;
  v25 = 3;
  v26 = 120;
LABEL_19:
  if (!*(_QWORD *)(v5 + v26))
  {
    v22 = v24;
    goto LABEL_70;
  }
  v995 = v23;
  v27 = _NRCopyLogObjectForNRUUID(*v6);
  v28 = v27;
  if (sNRCopyLogToStdErr)
  {

  }
  else
  {
    v29 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);

    if (!v29)
      goto LABEL_24;
  }
  v30 = _NRCopyLogObjectForNRUUID(*(void **)(v5 + 40));
  _NRLogWithArgs((uint64_t)v30, 1, (uint64_t)"%s%.30s:%-4d Read context: %p", v31, v32, v33, v34, v35, (uint64_t)");

LABEL_24:
  v36 = **(_QWORD **)(v5 + v26);
  v37 = _NRCopyLogObjectForNRUUID(*(void **)(v5 + 40));
  v38 = v37;
  if (sNRCopyLogToStdErr)
  {

  }
  else
  {
    v39 = os_log_type_enabled(v37, OS_LOG_TYPE_INFO);

    if (!v39)
      goto LABEL_28;
  }
  v40 = _NRCopyLogObjectForNRUUID(*v999);
  _NRLogWithArgs((uint64_t)v40, 1, (uint64_t)"%s%.30s:%-4d Link Read context: %p", v41, v42, v43, v44, v45, (uint64_t)");

LABEL_28:
  if (!v36)
  {
    v6 = v999;
    v53 = _NRCopyLogObjectForNRUUID(*v999);
    v54 = v53;
    if (sNRCopyLogToStdErr)
    {

      v22 = v24;
    }
    else
    {
      v84 = os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);

      v22 = v24;
      if (!v84)
      {
LABEL_57:
        v92 = 1;
        v66 = v995;
        v93 = (void *)v996;
        goto LABEL_321;
      }
    }
    v85 = _NRCopyLogObjectForNRUUID(*v999);
    v86 = off_1EA3F7088[(v25 - 1)];
    _NRLogWithArgs((uint64_t)v85, 16, (uint64_t)"%s%.30s:%-4d Invalid link-read context ptr for prio %@", v87, v88, v89, v90, v91, (uint64_t)");

    goto LABEL_57;
  }
  if ((*(_BYTE *)(v36 + 27) & 1) == 0)
  {
    *(_BYTE *)(v36 + 27) |= 1u;
    v46 = *(_QWORD *)(v5 + v26);
    v47 = *(void (**)(_QWORD))(v46 + 24);
    if (v47)
      v47(*(_QWORD *)(v46 + 32));
  }
  v48 = (v25 - 1);
  v49 = 16 * v48 + 96;
  v994 = off_1EA3F7088[v48];
  v50 = *(_QWORD *)(v5 + v49);
  v51 = _NRCopyLogObjectForNRUUID(*(void **)(v5 + 40));
  v52 = v51;
  if (!v50)
  {
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v701 = os_log_type_enabled(v51, OS_LOG_TYPE_ERROR);

      if (!v701)
      {
        v92 = 1;
        v5 = v1004;
        v6 = v999;
        goto LABEL_679;
      }
    }
    v6 = v999;
    v702 = _NRCopyLogObjectForNRUUID(*v999);
    v984 = createStringFromNRLinkChannelPriority(v25);
    _NRLogWithArgs((uint64_t)v702, 16, (uint64_t)"%s%.30s:%-4d Invalid write context %sptr for prio %@", v703, v704, v705, v706, v707, (uint64_t)");

    v92 = 1;
    v5 = v1004;
LABEL_679:
    v22 = v24;
    v76 = v994;
    v66 = v995;
    goto LABEL_320;
  }
  v6 = v999;
  if (sNRCopyLogToStdErr)
  {

  }
  else
  {
    v56 = os_log_type_enabled(v51, OS_LOG_TYPE_INFO);

    if (!v56)
      goto LABEL_41;
  }
  v57 = _NRCopyLogObjectForNRUUID(*(void **)(v5 + 40));
  _NRLogWithArgs((uint64_t)v57, 1, (uint64_t)"%s%.30s:%-4d Write context: %p", v58, v59, v60, v61, v62, (uint64_t)");

LABEL_41:
  v63 = *(_QWORD *)(*(_QWORD *)(v5 + v49) + 24);
  v64 = _NRCopyLogObjectForNRUUID(*(void **)(v5 + 40));
  v65 = v64;
  if (v63)
  {
    if (sNRCopyLogToStdErr)
    {

      v22 = v24;
    }
    else
    {
      v67 = os_log_type_enabled(v64, OS_LOG_TYPE_INFO);

      v22 = v24;
      if (!v67)
        goto LABEL_48;
    }
    v68 = _NRCopyLogObjectForNRUUID(*v999);
    _NRLogWithArgs((uint64_t)v68, 1, (uint64_t)"%s%.30s:%-4d link Write context: %p", v69, v70, v71, v72, v73, (uint64_t)");

LABEL_48:
    v74 = *(unsigned int *)(v63 + 24);
    v75 = *(unsigned int *)(v63 + 28);
    v76 = v994;
    if (objc_msgSend(v22, "length") + v75 <= v74)
      goto LABEL_62;
    v77 = *(_DWORD *)(v63 + 28);
    v78 = v77 + objc_msgSend(v22, "length");
    *(_DWORD *)(v63 + 24) = v78;
    if ((_DWORD)v78)
    {
      v79 = reallocf(*(void **)(v63 + 8), v78);
      if (v79)
      {
        *(_QWORD *)(v63 + 8) = 0;
        *(_QWORD *)(v63 + 8) = v79;
        v80 = _NRCopyLogObjectForNRUUID(*v6);
        v81 = v80;
        if (sNRCopyLogToStdErr)
        {

        }
        else
        {
          v101 = os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT);

          if (!v101)
            goto LABEL_62;
        }
        v102 = _NRCopyLogObjectForNRUUID(*v6);
        _NRLogWithArgs((uint64_t)v102, 0, (uint64_t)"%s%.30s:%-4d %@ link Write context staging buffer allocated: %u bytes", v103, v104, v105, v106, v107, (uint64_t)");

LABEL_62:
        memcpy((void *)(*(_QWORD *)(v63 + 8) + *(unsigned int *)(v63 + 28)), (const void *)objc_msgSend(v22, "bytes"), objc_msgSend(v22, "length"));
        *(_DWORD *)(v63 + 28) += objc_msgSend(v22, "length");
        if (*(_BYTE *)(v5 + 8) == 4)
        {
LABEL_319:
          v92 = 0;
          v66 = v995;
          goto LABEL_320;
        }
        v989 = &v985;
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v5 + 56));
        v990 = (uint64_t *)v22;
        if (v25 == 3)
        {
          v108 = 1;
          v109 = 14;
          v110 = 432;
          v111 = 304;
          v112 = 240;
          v113 = 208;
          v114 = NRBluetoothPacketParserSuspendNexusVOInputSource;
        }
        else if ((0x64656600u >> (8 * v25)) == 101)
        {
          v108 = 1;
          v109 = 15;
          v110 = 448;
          v111 = 320;
          v112 = 256;
          v113 = 216;
          v114 = NRBluetoothPacketParserSuspendNexusVIInputSource;
        }
        else
        {
          if ((0x64656600u >> (8 * v25)) != 102)
          {
            v1009 = 0;
            v1010 = 0;
            v1000 = 0;
            v108 = 0;
            v132 = 0;
            v131 = 0;
            v992 = 0;
LABEL_77:
            v133 = 0x1ED368000uLL;
            if (!gNRPacketLoggingEnabled)
              goto LABEL_78;
            v991 = v132;
            v714 = _NRCopyLogObjectForNRUUID(*v999);
            v715 = v714;
            if (sNRCopyLogToStdErr)
            {

              v5 = v1004;
              v76 = v994;
            }
            else
            {
              LODWORD(v1012) = os_log_type_enabled(v714, OS_LOG_TYPE_INFO);

              v5 = v1004;
              v76 = v994;
              v132 = v991;
              if (!(_DWORD)v1012)
                goto LABEL_78;
            }
            v736 = _NRCopyLogObjectForNRUUID(*v999);
            _NRLogWithArgs((uint64_t)v736, 1, (uint64_t)"%s%.30s:%-4d starting NtL fast-path for %u", v737, v738, v739, v740, v741, (uint64_t)");

            v132 = v991;
LABEL_78:
            if (v25 == 3 && (*(_BYTE *)(v5 + 10) & 8) != 0)
            {
              v136 = (_QWORD *)(v5 + 128);
              v138 = 3;
              v1011 = 1;
              v139 = "Isochronous";
              v134 = v131;
              goto LABEL_98;
            }
            v134 = v131;
            if (!v108)
              goto LABEL_95;
            if ((*(_BYTE *)(v5 + 10) & 4) != 0)
            {
              v136 = (_QWORD *)(v5 + 112);
LABEL_97:
              v1011 = 0;
              v139 = "High";
              v138 = 2;
LABEL_98:
              v140 = (_QWORD *)*v136;
              v991 = v132;
              if (v140)
              {
                v141 = v140[3];
                if ((*(_BYTE *)(v141 + 84) & 1) == 0)
                {
                  v986 = v138;
                  v1003 = (_QWORD **)v136;
                  v1012 = v134;
                  v987 = v3;
                  v988 = v139;
                  v142 = 0;
                  v143 = 0;
                  v1005 = 0;
                  v144 = *(unsigned __int8 *)(v141 + 83);
                  v145 = *(char **)(v141 + 8);
                  v146 = 568;
                  if (v144 == 3)
                    v146 = 584;
                  v147 = v144 == 2;
                  v148 = 600;
                  if (!v147)
                    v148 = v146;
                  v1001 = v148;
                  v1007 = v1004 + 688;
                  v1008 = v1004 + 672;
                  v149 = 9;
                  v998 = v145;
                  if (!*(_BYTE *)(v133 + 1513))
                    goto LABEL_109;
LABEL_105:
                  v150 = _NRCopyLogObjectForNRUUID(*v999);
                  v151 = v150;
                  if (sNRCopyLogToStdErr)
                  {

LABEL_108:
                    v153 = _NRCopyLogObjectForNRUUID(*v999);
                    _NRLogWithArgs((uint64_t)v153, 1, (uint64_t)"%s%.30s:%-4d %s: starting NtL outer loop", v154, v155, v156, v157, v158, (uint64_t)");

                    goto LABEL_109;
                  }
                  v152 = os_log_type_enabled(v150, OS_LOG_TYPE_INFO);

                  if (v152)
                    goto LABEL_108;
LABEL_109:
                  v1006 = 0;
                  v159 = 0;
                  v1002 = 0;
                  v1021 = 0u;
                  v1022 = 0u;
                  v1019 = 0u;
                  v1020 = 0u;
                  if (*(_BYTE *)(v133 + 1513))
                    goto LABEL_110;
                  while (1)
                  {
                    v169 = v149 | 0x10;
                    if (!v1011)
                    {
                      v171 = *(_DWORD *)(v141 + 28);
                      v170 = *(unsigned int *)(v141 + 32);
                      if (v171 > v170)
                        break;
                    }
LABEL_124:
                    next_slot = v1006;
                    if (v1012)
                      next_slot = (os_log_t)os_channel_get_next_slot();
                    if (!next_slot)
                    {
                      v213 = 0;
                      goto LABEL_161;
                    }
                    while (1)
                    {
                      v179 = 0x4000 - *(unsigned __int16 *)(v141 + 80);
                      if (v179 < nrMaxTLVLengthForPacket(v1020, WORD1(v1019)))
                      {
                        v169 |= 0x40u;
                        if (!gNRPacketLoggingEnabled)
                        {
LABEL_159:
                          v213 = next_slot;
                          v133 = 0x1ED368000;
                          goto LABEL_161;
                        }
                        v249 = _NRCopyLogObjectForNRUUID(*v999);
                        v250 = v249;
                        if (sNRCopyLogToStdErr)
                        {

                        }
                        else
                        {
                          LODWORD(v1006) = os_log_type_enabled(v249, OS_LOG_TYPE_INFO);

                          if (!(_DWORD)v1006)
                            goto LABEL_159;
                        }
                        v261 = _NRCopyLogObjectForNRUUID(*v999);
                        _NRLogWithArgs((uint64_t)v261, 1, (uint64_t)"%s%.30s:%-4d %s: not enough room %u to fit maxTLVLen %u", v262, v263, v264, v265, v266, (uint64_t)");

                        goto LABEL_159;
                      }
                      os_channel_slot_get_packet();
                      os_packet_get_next_buflet();
                      data_offset = os_buflet_get_data_offset();
                      object_address = os_buflet_get_object_address();
                      data_length = os_buflet_get_data_length();
                      if (data_length >= 0x10000)
                      {
LABEL_614:
                        v675 = nrCopyLogObj_506();
                        v676 = v675;
                        if (sNRCopyLogToStdErr)
                        {

                        }
                        else
                        {
                          v677 = os_log_type_enabled(v675, OS_LOG_TYPE_ERROR);

                          if (!v677)
                          {
LABEL_619:
                            _os_log_pack_size();
                            MEMORY[0x1E0C80A78]();
                            __error();
                            v684 = _os_log_pack_fill();
                            *(_DWORD *)v684 = 136446210;
                            *(_QWORD *)(v684 + 4) = "NRBluetoothPacketParserNexusToLinkLoop";
                            goto LABEL_620;
                          }
                        }
                        v678 = nrCopyLogObj_506();
                        _NRLogWithArgs((uint64_t)v678, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: dataLen <= 65535", v679, v680, v681, v682, v683, (uint64_t)");

                        goto LABEL_619;
                      }
                      v183 = data_length;
                      if (!(_WORD)data_length && WORD1(v1019))
                      {
                        v1017 = 0;
                        v1018 = 0;
                        v1017 = *(_QWORD *)v141 + *(unsigned __int16 *)(v141 + 80);
                        LODWORD(v1018) = v179;
                        v184 = nrPacketToTLV((unsigned __int8 *)v1020, WORD1(v1019), (uint64_t)&v1017, 1u, v1008, v1007);
                        v133 = 0x1ED368000uLL;
                        if (!gNRPacketLoggingEnabled)
                        {
LABEL_132:
                          v169 |= 0x80u;
                          goto LABEL_138;
                        }
                        v189 = _NRCopyLogObjectForNRUUID(*v999);
                        v190 = v189;
                        if (sNRCopyLogToStdErr)
                        {

                        }
                        else
                        {
                          v194 = os_log_type_enabled(v189, OS_LOG_TYPE_INFO);

                          if (!v194)
                            goto LABEL_132;
                        }
                        v195 = _NRCopyLogObjectForNRUUID(*v999);
                        getESPSequenceNumberFromPacket(v1020, WORD1(v1019));
                        getESPSPIFromPacket(v1020, WORD1(v1019));
                        _NRLogWithArgs((uint64_t)v195, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u bytes from nexus for ESP seq: %u (spi: %u)", v196, v197, v198, v199, v200, (uint64_t)");

                        goto LABEL_132;
                      }
                      if ((_WORD)data_length)
                      {
                        v185 = (unsigned __int8 *)(object_address + data_offset);
                        v1017 = 0;
                        v1018 = 0;
                        v1017 = *(_QWORD *)v141 + *(unsigned __int16 *)(v141 + 80);
                        LODWORD(v1018) = v179;
                        v184 = nrPacketToTLV(v185, (unsigned __int16)data_length, (uint64_t)&v1017, 1u, v1008, v1007);
                        v133 = 0x1ED368000uLL;
                        if (!gNRPacketLoggingEnabled)
                        {
LABEL_135:
                          v169 |= 0x100u;
                          goto LABEL_138;
                        }
                        v191 = _NRCopyLogObjectForNRUUID(*v999);
                        if (sNRCopyLogToStdErr)
                        {

                        }
                        else
                        {
                          v1006 = v191;
                          LODWORD(ESPSequenceNumberFromPacket) = os_log_type_enabled(v191, OS_LOG_TYPE_INFO);

                          if (!(_DWORD)ESPSequenceNumberFromPacket)
                            goto LABEL_135;
                        }
                        v1006 = _NRCopyLogObjectForNRUUID(*v999);
                        ESPSequenceNumberFromPacket = getESPSequenceNumberFromPacket((uint64_t)v185, v183);
                        getESPSPIFromPacket((uint64_t)v185, v183);
                        v201 = v1006;
                        _NRLogWithArgs((uint64_t)v1006, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u bytes from nexus for ESP seq: %u (spi: %u)", v202, v203, v204, v205, v206, (uint64_t)");

                        goto LABEL_135;
                      }
                      v169 |= 0x200u;
                      v133 = 0x1ED368000uLL;
                      if (!gNRPacketLoggingEnabled)
                        goto LABEL_137;
                      v192 = _NRCopyLogObjectForNRUUID(*v999);
                      v193 = v192;
                      if (sNRCopyLogToStdErr)
                      {

LABEL_156:
                        v207 = _NRCopyLogObjectForNRUUID(*v999);
                        _NRLogWithArgs((uint64_t)v207, 1, (uint64_t)"%s%.30s:%-4d %s: No data to write", v208, v209, v210, v211, v212, (uint64_t)");

LABEL_137:
                        v184 = 0;
                        goto LABEL_138;
                      }
                      v184 = os_log_type_enabled(v192, OS_LOG_TYPE_INFO);

                      if (v184)
                        goto LABEL_156;
LABEL_138:
                      *(_WORD *)(v141 + 80) += v184;
                      v186 = v1011 ? 0 : os_channel_get_next_slot();
                      ++v143;
                      ++*v1009;
                      *v1010 = 1;
                      v142 += v184;
                      if (!v186)
                        break;
                      v187 = *(unsigned __int8 *)(v141 + 82);
                      if (v187 >= 0xB)
                      {
                        v187 = *(unsigned __int8 *)(v141 + 82)
                             - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v141 + 82)) >> 32);
                        *(_BYTE *)(v141 + 82) = v187;
                      }
                      *(_DWORD *)(v141 + 4 * v187 + 36) = v169;
                      v188 = (117 * (*(_BYTE *)(v141 + 82) + 1)) >> 8;
                      *(_BYTE *)(v141 + 82) = *(_BYTE *)(v141 + 82)
                                            + 1
                                            - 11
                                            * ((v188
                                              + (((*(_BYTE *)(v141 + 82) + 1 - v188) & 0xFE) >> 1)) >> 3);
                      v159 = next_slot;
                      next_slot = (os_log_t)v186;
                      v169 = 0;
                    }
                    v213 = 0;
                    v159 = next_slot;
LABEL_161:
                    v214 = *(unsigned __int16 *)(v141 + 80);
                    LODWORD(v215) = *(_WORD *)(v141 + 80) != 0;
                    if (!*(_WORD *)(v141 + 80))
                    {
                      v217 = v169 | 0x400;
                      if (*(_BYTE *)(v133 + 1513))
                      {
                        LODWORD(ESPSequenceNumberFromPacket) = *(_WORD *)(v141 + 80) != 0;
                        v301 = _NRCopyLogObjectForNRUUID(*v999);
                        v302 = v301;
                        if (sNRCopyLogToStdErr)
                        {

                          goto LABEL_242;
                        }
                        v303 = os_log_type_enabled(v301, OS_LOG_TYPE_INFO);

                        if (v303)
                        {
LABEL_242:
                          v304 = _NRCopyLogObjectForNRUUID(*v999);
                          _NRLogWithArgs((uint64_t)v304, 1, (uint64_t)"%s%.30s:%-4d %s: nothing to read from nexus", v305, v306, v307, v308, v309, (uint64_t)");

                        }
                        v133 = 0x1ED368000uLL;
                        LODWORD(v215) = ESPSequenceNumberFromPacket;
LABEL_244:
                        v299 = v214 == 0;
                        if (!*(_BYTE *)(v133 + 1513))
                        {
                          v300 = v217 | 0x8000;
                          if (v159)
                            goto LABEL_246;
                          goto LABEL_237;
                        }
                        v312 = v215;
                        v313 = _NRCopyLogObjectForNRUUID(*v999);
                        v314 = v313;
                        if (sNRCopyLogToStdErr)
                        {

                          goto LABEL_262;
                        }
                        v317 = os_log_type_enabled(v313, OS_LOG_TYPE_INFO);

                        if (v317)
                        {
LABEL_262:
                          v318 = _NRCopyLogObjectForNRUUID(*v999);
                          _NRLogWithArgs((uint64_t)v318, 1, (uint64_t)"%s%.30s:%-4d %s: out of NtL inner loop", v319, v320, v321, v322, v323, (uint64_t)");

                        }
                        LODWORD(v215) = v312;
                        v300 = v217 | 0x8000;
                        if (v159)
                          goto LABEL_246;
LABEL_237:
                        if (*(_BYTE *)(v1004 + 13))
                          goto LABEL_247;
                        goto LABEL_252;
                      }
                      LODWORD(v215) = 0;
                      v299 = 1;
                      v300 = v217 | 0x8000;
                      if (!v159)
                        goto LABEL_237;
LABEL_246:
                      os_channel_advance_slot();
                      *(_BYTE *)(v1004 + 13) = 1;
LABEL_247:
                      if (v1005 > 8u || v1012 && os_channel_available_slot_count() <= 1)
                      {
                        if (!gNRPacketLoggingEnabled)
                          goto LABEL_251;
                        v315 = v215;
                        v316 = _NRCopyLogObjectForNRUUID(*v999);
                        v215 = (uint64_t)v316;
                        if (sNRCopyLogToStdErr)
                        {

                          goto LABEL_266;
                        }
                        v324 = os_log_type_enabled(v316, OS_LOG_TYPE_INFO);

                        LODWORD(v215) = v315;
                        if (v324)
                        {
LABEL_266:
                          v215 = (uint64_t)_NRCopyLogObjectForNRUUID(*(void **)(v1004 + 40));
                          _NRLogWithArgs(v215, 1, (uint64_t)"%s%.30s:%-4d %s: performing RX sync (%u packets, %u bytes, %u pending, %0.2f msec, canWriteMore %d, memmove %u)", v325, v326, v327, v328, v329, (uint64_t)");

                          LODWORD(v215) = v315;
                        }
LABEL_251:
                        v300 = v217 | 0x18000;
                        os_channel_sync();
                        *(_BYTE *)(v1004 + 13) = 0;
                      }
LABEL_252:
                      if ((v215 & v299) != 1)
                      {
                        if (!gNRPacketLoggingEnabled)
                          goto LABEL_274;
                        v756 = v215;
                        v757 = _NRCopyLogObjectForNRUUID(*v999);
                        v215 = (uint64_t)v757;
                        if (sNRCopyLogToStdErr)
                        {

                          goto LABEL_714;
                        }
                        v763 = os_log_type_enabled(v757, OS_LOG_TYPE_INFO);

                        LOBYTE(v215) = v756;
                        if (v763)
                        {
LABEL_714:
                          v215 = (uint64_t)_NRCopyLogObjectForNRUUID(*v999);
                          _NRLogWithArgs(v215, 1, (uint64_t)"%s%.30s:%-4d %s: out of NtL outer loop", v764, v765, v766, v767, v768, (uint64_t)");

                          LOBYTE(v215) = v756;
                        }
LABEL_274:
                        v3 = v987;
                        v5 = v1004;
                        v331 = v999;
                        v76 = v994;
                        if ((v215 & 1) != 0)
                          goto LABEL_313;
                        if (v986 == 1)
                        {
                          v336 = *(_QWORD *)(v1004 + 136);
                          if ((*(_BYTE *)(v1004 + 10) & 4) == 0)
                            goto LABEL_297;
                          goto LABEL_305;
                        }
                        if (v986 != 2)
                        {
                          if (v986 == 3)
                          {
                            v332 = *(_QWORD *)(v1004 + 136);
                            if ((v332 & 8) != 0 && *(_QWORD *)(v1004 + 304))
                            {
                              v333 = (dispatch_object_t *)(v1004 + 304);
                              *(_QWORD *)(v1004 + 136) = v332 & 0xFFFFFFFFFFFFFFF7;
                              if (gNRPacketLoggingEnabled)
                              {
                                v334 = _NRCopyLogObjectForNRUUID(*v331);
                                v335 = v334;
                                if (sNRCopyLogToStdErr)
                                {

                                  goto LABEL_767;
                                }
                                v880 = os_log_type_enabled(v334, OS_LOG_TYPE_INFO);

                                if (v880)
                                {
LABEL_767:
                                  v840 = _NRCopyLogObjectForNRUUID(*v999);
                                  _NRLogWithArgs((uint64_t)v840, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v881, v882, v883, v884, v885, (uint64_t)");
                                  goto LABEL_770;
                                }
                                goto LABEL_771;
                              }
                              goto LABEL_312;
                            }
                            goto LABEL_313;
                          }
                          v336 = *(_QWORD *)(v1004 + 136);
LABEL_297:
                          if ((v336 & 8) != 0 && *(_QWORD *)(v1004 + 304))
                          {
                            *(_QWORD *)(v1004 + 136) = v336 & 0xFFFFFFFFFFFFFFF7;
                            if (!gNRPacketLoggingEnabled)
                              goto LABEL_300;
                            v826 = _NRCopyLogObjectForNRUUID(*v331);
                            v827 = v826;
                            if (sNRCopyLogToStdErr)
                            {

                              v3 = v987;
                              v5 = v1004;
                              v331 = v999;
                              v76 = v994;
                              goto LABEL_759;
                            }
                            v853 = os_log_type_enabled(v826, OS_LOG_TYPE_INFO);

                            v3 = v987;
                            v5 = v1004;
                            v331 = v999;
                            v76 = v994;
                            if (v853)
                            {
LABEL_759:
                              v854 = _NRCopyLogObjectForNRUUID(*v331);
                              _NRLogWithArgs((uint64_t)v854, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v855, v856, v857, v858, v859, (uint64_t)");

                            }
LABEL_300:
                            dispatch_resume(*(dispatch_object_t *)(v5 + 304));
                            v336 = *(_QWORD *)(v5 + 136);
                          }
                          if ((v336 & 0x10) != 0 && *(_QWORD *)(v5 + 320))
                          {
                            *(_QWORD *)(v5 + 136) = v336 & 0xFFFFFFFFFFFFFFEFLL;
                            if (!gNRPacketLoggingEnabled)
                              goto LABEL_304;
                            v828 = _NRCopyLogObjectForNRUUID(*v331);
                            v829 = v828;
                            if (sNRCopyLogToStdErr)
                            {

                              v3 = v987;
                              v5 = v1004;
                              v331 = v999;
                              v76 = v994;
                              goto LABEL_761;
                            }
                            v860 = os_log_type_enabled(v828, OS_LOG_TYPE_INFO);

                            v3 = v987;
                            v5 = v1004;
                            v331 = v999;
                            v76 = v994;
                            if (v860)
                            {
LABEL_761:
                              v861 = _NRCopyLogObjectForNRUUID(*v331);
                              _NRLogWithArgs((uint64_t)v861, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVIInput", v862, v863, v864, v865, v866, (uint64_t)");

                            }
LABEL_304:
                            dispatch_resume(*(dispatch_object_t *)(v5 + 320));
                            v336 = *(_QWORD *)(v5 + 136);
                          }
LABEL_305:
                          if ((v336 & 0x20) != 0 && *(_QWORD *)(v5 + 336))
                          {
                            *(_QWORD *)(v5 + 136) = v336 & 0xFFFFFFFFFFFFFFDFLL;
                            if (!gNRPacketLoggingEnabled)
                              goto LABEL_308;
                            v815 = _NRCopyLogObjectForNRUUID(*v331);
                            v816 = v815;
                            if (sNRCopyLogToStdErr)
                            {

                              v3 = v987;
                              v5 = v1004;
                              v331 = v999;
                              v76 = v994;
                              goto LABEL_757;
                            }
                            v846 = os_log_type_enabled(v815, OS_LOG_TYPE_INFO);

                            v3 = v987;
                            v5 = v1004;
                            v331 = v999;
                            v76 = v994;
                            if (v846)
                            {
LABEL_757:
                              v847 = _NRCopyLogObjectForNRUUID(*v331);
                              _NRLogWithArgs((uint64_t)v847, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBEInput", v848, v849, v850, v851, v852, (uint64_t)");

                            }
LABEL_308:
                            dispatch_resume(*(dispatch_object_t *)(v5 + 336));
                            v336 = *(_QWORD *)(v5 + 136);
                          }
                          if ((v336 & 0x40) != 0 && *(_QWORD *)(v5 + 352))
                          {
                            v333 = (dispatch_object_t *)(v5 + 352);
                            *(_QWORD *)(v5 + 136) = v336 & 0xFFFFFFFFFFFFFFBFLL;
                            if (gNRPacketLoggingEnabled)
                            {
                              v817 = _NRCopyLogObjectForNRUUID(*v331);
                              v818 = v817;
                              if (sNRCopyLogToStdErr)
                              {

                              }
                              else
                              {
                                v839 = os_log_type_enabled(v817, OS_LOG_TYPE_INFO);

                                if (!v839)
                                  goto LABEL_771;
                              }
                              v840 = _NRCopyLogObjectForNRUUID(*v999);
                              _NRLogWithArgs((uint64_t)v840, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBKInput", v841, v842, v843, v844, v845, (uint64_t)");
                              goto LABEL_770;
                            }
                            goto LABEL_312;
                          }
                          goto LABEL_313;
                        }
                        v337 = *(_QWORD *)(v1004 + 136);
                        if ((v337 & 8) != 0 && *(_QWORD *)(v1004 + 304))
                        {
                          *(_QWORD *)(v1004 + 136) = v337 & 0xFFFFFFFFFFFFFFF7;
                          if (!gNRPacketLoggingEnabled)
                            goto LABEL_290;
                          v834 = _NRCopyLogObjectForNRUUID(*v331);
                          v835 = v834;
                          if (sNRCopyLogToStdErr)
                          {

                            v3 = v987;
                            v5 = v1004;
                            v331 = v999;
                            v76 = v994;
                            goto LABEL_773;
                          }
                          v892 = os_log_type_enabled(v834, OS_LOG_TYPE_INFO);

                          v3 = v987;
                          v5 = v1004;
                          v331 = v999;
                          v76 = v994;
                          if (v892)
                          {
LABEL_773:
                            v893 = _NRCopyLogObjectForNRUUID(*v331);
                            _NRLogWithArgs((uint64_t)v893, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v894, v895, v896, v897, v898, (uint64_t)");

                          }
LABEL_290:
                          dispatch_resume(*(dispatch_object_t *)(v5 + 304));
                          v337 = *(_QWORD *)(v5 + 136);
                        }
                        if ((v337 & 0x10) != 0 && *(_QWORD *)(v5 + 320))
                        {
                          v333 = (dispatch_object_t *)(v5 + 320);
                          *(_QWORD *)(v5 + 136) = v337 & 0xFFFFFFFFFFFFFFEFLL;
                          if (gNRPacketLoggingEnabled)
                          {
                            v338 = _NRCopyLogObjectForNRUUID(*v331);
                            v339 = v338;
                            if (sNRCopyLogToStdErr)
                            {

                            }
                            else
                            {
                              v886 = os_log_type_enabled(v338, OS_LOG_TYPE_INFO);

                              if (!v886)
                                goto LABEL_771;
                            }
                            v840 = _NRCopyLogObjectForNRUUID(*v999);
                            _NRLogWithArgs((uint64_t)v840, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVIInput", v887, v888, v889, v890, v891, (uint64_t)");
LABEL_770:

LABEL_771:
                            v3 = v987;
                            v5 = v1004;
                            v331 = v999;
                            v76 = v994;
                          }
LABEL_312:
                          dispatch_resume(*v333);
                        }
LABEL_313:
                        v340 = v300 | 0x60000;
                        if (gNRPacketLoggingEnabled)
                        {
                          v758 = _NRCopyLogObjectForNRUUID(*v331);
                          v759 = v758;
                          if (sNRCopyLogToStdErr)
                          {

                            v3 = v987;
                            v5 = v1004;
                            v331 = v999;
                            v76 = v994;
                          }
                          else
                          {
                            v769 = os_log_type_enabled(v758, OS_LOG_TYPE_INFO);

                            v3 = v987;
                            v5 = v1004;
                            v331 = v999;
                            v76 = v994;
                            if (!v769)
                              goto LABEL_314;
                          }
                          v770 = _NRCopyLogObjectForNRUUID(*v331);
                          _NRLogWithArgs((uint64_t)v770, 1, (uint64_t)"%s%.30s:%-4d %s: done with NtL fast-path", v771, v772, v773, v774, v775, (uint64_t)");

                        }
LABEL_314:
                        v341 = *(unsigned __int8 *)(v141 + 82);
                        v6 = v331;
                        if (v341 >= 0xB)
                        {
                          v341 = *(unsigned __int8 *)(v141 + 82)
                               - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v141 + 82)) >> 32);
                          *(_BYTE *)(v141 + 82) = v341;
                        }
                        *(_DWORD *)(v141 + 4 * v341 + 36) = v340;
LABEL_317:
                        v342 = (117 * (*(_BYTE *)(v141 + 82) + 1)) >> 8;
                        *(_BYTE *)(v141 + 82) = *(_BYTE *)(v141 + 82)
                                              + 1
                                              - 11
                                              * ((v342
                                                + (((*(_BYTE *)(v141 + 82) + 1 - v342) & 0xFE) >> 1)) >> 3);
                        goto LABEL_318;
                      }
                      v310 = *(unsigned __int8 *)(v141 + 82);
                      v133 = 0x1ED368000uLL;
                      if (v310 >= 0xB)
                      {
                        v310 = *(unsigned __int8 *)(v141 + 82)
                             - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v141 + 82)) >> 32);
                        *(_BYTE *)(v141 + 82) = v310;
                      }
                      *(_DWORD *)(v141 + 4 * v310 + 36) = v300;
                      v311 = (117 * (*(_BYTE *)(v141 + 82) + 1)) >> 8;
                      *(_BYTE *)(v141 + 82) = *(_BYTE *)(v141 + 82)
                                            + 1
                                            - 11
                                            * ((v311
                                              + (((*(_BYTE *)(v141 + 82) + 1 - v311) & 0xFE) >> 1)) >> 3);
                      v149 = 8;
                      if (gNRPacketLoggingEnabled)
                        goto LABEL_105;
                      goto LABEL_109;
                    }
                    v1006 = v213;
                    v1017 = 0;
                    if (!*(_BYTE *)(v133 + 1513))
                      goto LABEL_163;
                    v234 = v215;
                    v235 = _NRCopyLogObjectForNRUUID(*v999);
                    v215 = (uint64_t)v235;
                    if (sNRCopyLogToStdErr)
                    {

                      goto LABEL_204;
                    }
                    LODWORD(ESPSequenceNumberFromPacket) = os_log_type_enabled(v235, OS_LOG_TYPE_INFO);

                    LODWORD(v215) = v234;
                    if ((_DWORD)ESPSequenceNumberFromPacket)
                    {
LABEL_204:
                      v215 = (uint64_t)_NRCopyLogObjectForNRUUID(*v999);
                      _NRLogWithArgs(v215, 1, (uint64_t)"%s%.30s:%-4d %s: invoking send callback w/ written %u", v239, v240, v241, v242, v243, (uint64_t)");

                      LODWORD(v215) = v234;
                    }
LABEL_163:
                    v216 = ((uint64_t (*)(_QWORD, _QWORD, _QWORD, unint64_t *, _QWORD, _QWORD))(*v1003)[1])(**v1003, *(_QWORD *)v141, *(unsigned __int16 *)(v141 + 80), &v1017, 0, 0);
                    if (*(_BYTE *)(v133 + 1513))
                    {
                      LODWORD(ESPSequenceNumberFromPacket) = v215;
                      v236 = _NRCopyLogObjectForNRUUID(*v999);
                      v215 = (uint64_t)v236;
                      if (sNRCopyLogToStdErr)
                      {

                      }
                      else
                      {
                        LODWORD(v993) = os_log_type_enabled(v236, OS_LOG_TYPE_INFO);

                        LODWORD(v215) = ESPSequenceNumberFromPacket;
                        if (!(_DWORD)v993)
                          goto LABEL_164;
                      }
                      v215 = (uint64_t)_NRCopyLogObjectForNRUUID(*v999);
                      _NRLogWithArgs(v215, 1, (uint64_t)"%s%.30s:%-4d %s: canWriteMore: %d bufferHandled=%zu/%u", v244, v245, v246, v247, v248, (uint64_t)");

                      LODWORD(v215) = ESPSequenceNumberFromPacket;
                    }
LABEL_164:
                    if ((v216 & 1) != 0)
                    {
                      v217 = v169 | 0x800;
                      v218 = v1017;
                      if (!v1017)
                        goto LABEL_192;
LABEL_186:
                      if (v218 < *(unsigned __int16 *)(v141 + 80))
                      {
                        if (!*(_BYTE *)(v133 + 1513))
                          goto LABEL_188;
                        LODWORD(ESPSequenceNumberFromPacket) = v215;
                        v251 = _NRCopyLogObjectForNRUUID(*v999);
                        v215 = (uint64_t)v251;
                        if (sNRCopyLogToStdErr)
                        {

                          goto LABEL_222;
                        }
                        LODWORD(v993) = os_log_type_enabled(v251, OS_LOG_TYPE_INFO);

                        LODWORD(v215) = ESPSequenceNumberFromPacket;
                        if ((_DWORD)v993)
                        {
LABEL_222:
                          v215 = (uint64_t)_NRCopyLogObjectForNRUUID(*v999);
                          _NRLogWithArgs(v215, 1, (uint64_t)"%s%.30s:%-4d %s: memmoving filledIn=%u, bufferHandled=%zu", v267, v268, v269, v270, v271, (uint64_t)");

                          LODWORD(v215) = ESPSequenceNumberFromPacket;
                        }
LABEL_188:
                        v217 |= 0x2000u;
                        memmove(*(void **)v141, (const void *)(*(_QWORD *)v141 + v1017), *(unsigned __int16 *)(v141 + 80) - v1017);
                        v231 = v1017;
                        *(_WORD *)(v141 + 80) -= v1017;
                        v1002 = (v1002 + 1);
LABEL_191:
                        *(_QWORD *)(v1004 + v1001) += v231;
                        goto LABEL_192;
                      }
                      if (!*(_BYTE *)(v133 + 1513))
                      {
LABEL_190:
                        v217 |= 0x4000u;
                        *(_WORD *)(v141 + 80) = 0;
                        v231 = v1017;
                        goto LABEL_191;
                      }
                      LODWORD(ESPSequenceNumberFromPacket) = v215;
                      v252 = _NRCopyLogObjectForNRUUID(*v999);
                      v215 = (uint64_t)v252;
                      if (sNRCopyLogToStdErr)
                      {

                      }
                      else
                      {
                        LODWORD(v993) = os_log_type_enabled(v252, OS_LOG_TYPE_INFO);

                        LODWORD(v215) = ESPSequenceNumberFromPacket;
                        if (!(_DWORD)v993)
                          goto LABEL_190;
                      }
                      v215 = (uint64_t)_NRCopyLogObjectForNRUUID(*v999);
                      _NRLogWithArgs(v215, 1, (uint64_t)"%s%.30s:%-4d %s: not memmoving filledIn=%u, bufferHandled=%zu", v272, v273, v274, v275, v276, (uint64_t)");

                      LODWORD(v215) = ESPSequenceNumberFromPacket;
                      goto LABEL_190;
                    }
                    if (v1000)
                      v1000(v1004);
                    *(_BYTE *)(v141 + 84) |= 1u;
                    switch(*(_BYTE *)(v141 + 83))
                    {
                      case 0:
                        LODWORD(ESPSequenceNumberFromPacket) = v215;
                        v219 = _NRCopyLogObjectForNRUUID(*v999);
                        v215 = (uint64_t)v219;
                        if (sNRCopyLogToStdErr)
                        {

                        }
                        else
                        {
                          LODWORD(v993) = os_log_type_enabled(v219, OS_LOG_TYPE_ERROR);

                          LODWORD(v215) = ESPSequenceNumberFromPacket;
                          if (!(_DWORD)v993)
                            goto LABEL_184;
                        }
                        v215 = (uint64_t)_NRCopyLogObjectForNRUUID(*v999);
                        _NRLogWithArgs(v215, 16, (uint64_t)"%s%.30s:%-4d invalid link channel priority", v226, v227, v228, v229, v230, (uint64_t)");
                        goto LABEL_183;
                      case 1:
                        v224 = v1004;
                        v225 = *(_QWORD *)(v1004 + 136);
                        ++*(_QWORD *)(v1004 + 144);
                        *(_QWORD *)(v224 + 136) = v225 & 0xFFFFFFFFFFFFFFFELL | *(_BYTE *)(v141 + 84) & 1;
                        if (!*(_BYTE *)(v133 + 1513))
                          goto LABEL_179;
                        LODWORD(ESPSequenceNumberFromPacket) = v215;
                        v277 = _NRCopyLogObjectForNRUUID(*v999);
                        v215 = (uint64_t)v277;
                        if (sNRCopyLogToStdErr)
                        {

                        }
                        else
                        {
                          LODWORD(v993) = os_log_type_enabled(v277, OS_LOG_TYPE_INFO);

                          LODWORD(v215) = ESPSequenceNumberFromPacket;
                          if (!(_DWORD)v993)
                            goto LABEL_184;
                        }
                        v215 = (uint64_t)_NRCopyLogObjectForNRUUID(*v999);
                        _NRLogWithArgs(v215, 1, (uint64_t)"%s%.30s:%-4d source-%s: Medium", v294, v295, v296, v297, v298, (uint64_t)");
                        goto LABEL_183;
                      case 2:
                        v220 = v1004;
                        ++*(_QWORD *)(v1004 + 160);
                        *(_QWORD *)(v220 + 136) = *(_QWORD *)(v220 + 136) & 0xFFFFFFFFFFFFFFFDLL | (2
                                                                                                  * (*(_BYTE *)(v141 + 84) & 1));
                        if (!*(_BYTE *)(v133 + 1513))
                          goto LABEL_179;
                        LODWORD(ESPSequenceNumberFromPacket) = v215;
                        v221 = _NRCopyLogObjectForNRUUID(*v999);
                        v215 = (uint64_t)v221;
                        if (sNRCopyLogToStdErr)
                        {

                        }
                        else
                        {
                          LODWORD(v993) = os_log_type_enabled(v221, OS_LOG_TYPE_INFO);

                          LODWORD(v215) = ESPSequenceNumberFromPacket;
                          if (!(_DWORD)v993)
                            goto LABEL_184;
                        }
                        v215 = (uint64_t)_NRCopyLogObjectForNRUUID(*v999);
                        _NRLogWithArgs(v215, 1, (uint64_t)"%s%.30s:%-4d source-%s: High", v284, v285, v286, v287, v288, (uint64_t)");
                        goto LABEL_183;
                      case 3:
                        v222 = v1004;
                        ++*(_QWORD *)(v1004 + 176);
                        *(_QWORD *)(v222 + 136) = *(_QWORD *)(v222 + 136) & 0xFFFFFFFFFFFFFFFBLL | (4
                                                                                                  * (*(_BYTE *)(v141 + 84) & 1));
                        if (!*(_BYTE *)(v133 + 1513))
                        {
LABEL_179:
                          v217 = v169 | 0x1800;
                          v218 = v1017;
                          if (v1017)
                            goto LABEL_186;
                          break;
                        }
                        LODWORD(ESPSequenceNumberFromPacket) = v215;
                        v223 = _NRCopyLogObjectForNRUUID(*v999);
                        v215 = (uint64_t)v223;
                        if (sNRCopyLogToStdErr)
                        {

                        }
                        else
                        {
                          LODWORD(v993) = os_log_type_enabled(v223, OS_LOG_TYPE_INFO);

                          LODWORD(v215) = ESPSequenceNumberFromPacket;
                          if (!(_DWORD)v993)
                            goto LABEL_184;
                        }
                        v215 = (uint64_t)_NRCopyLogObjectForNRUUID(*v999);
                        _NRLogWithArgs(v215, 1, (uint64_t)"%s%.30s:%-4d source-%s: Isochronous", v289, v290, v291, v292, v293, (uint64_t)");
LABEL_183:

                        LODWORD(v215) = ESPSequenceNumberFromPacket;
LABEL_184:
                        v217 = v169 | 0x1800;
                        if (!*(_BYTE *)(v133 + 1513))
                        {
                          v218 = v1017;
                          if (!v1017)
                            break;
                          goto LABEL_186;
                        }
                        LODWORD(ESPSequenceNumberFromPacket) = v215;
                        v237 = _NRCopyLogObjectForNRUUID(*v999);
                        v238 = v237;
                        if (sNRCopyLogToStdErr)
                        {

                        }
                        else
                        {
                          LODWORD(v993) = os_log_type_enabled(v237, OS_LOG_TYPE_INFO);

                          if (!(_DWORD)v993)
                            goto LABEL_217;
                        }
                        v255 = _NRCopyLogObjectForNRUUID(*v999);
                        _NRLogWithArgs((uint64_t)v255, 1, (uint64_t)"%s%.30s:%-4d ", v256, v257, v258, v259, v260, (uint64_t)");

LABEL_217:
                        LODWORD(v215) = ESPSequenceNumberFromPacket;
                        v218 = v1017;
                        if (v1017)
                          goto LABEL_186;
                        break;
                      default:
                        goto LABEL_184;
                    }
LABEL_192:
                    ++v1005;
                    if ((v216 & 1) == 0)
                      goto LABEL_244;
                    v232 = *(unsigned __int8 *)(v141 + 82);
                    if (v232 >= 0xB)
                    {
                      v232 = *(unsigned __int8 *)(v141 + 82)
                           - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v141 + 82)) >> 32);
                      *(_BYTE *)(v141 + 82) = v232;
                    }
                    v149 = 0;
                    *(_DWORD *)(v141 + 4 * v232 + 36) = v217;
                    v233 = (117 * (*(_BYTE *)(v141 + 82) + 1)) >> 8;
                    *(_BYTE *)(v141 + 82) = *(_BYTE *)(v141 + 82)
                                          + 1
                                          - 11
                                          * ((v233 + (((*(_BYTE *)(v141 + 82) + 1 - v233) & 0xFE) >> 1)) >> 3);
                    if (*(_BYTE *)(v133 + 1513))
                    {
LABEL_110:
                      v160 = _NRCopyLogObjectForNRUUID(*v999);
                      v161 = v160;
                      if (sNRCopyLogToStdErr)
                      {

                        goto LABEL_113;
                      }
                      v162 = os_log_type_enabled(v160, OS_LOG_TYPE_INFO);

                      if (v162)
                      {
LABEL_113:
                        v163 = _NRCopyLogObjectForNRUUID(*v999);
                        _NRLogWithArgs((uint64_t)v163, 1, (uint64_t)"%s%.30s:%-4d %s: starting NtL inner loop", v164, v165, v166, v167, v168, (uint64_t)");

                      }
                    }
                  }
                  v172 = *(unsigned __int16 *)(v141 + 80);
                  if ((unsigned __int16)(v171 - v170) >= (unsigned __int16)(0x4000 - v172))
                    v173 = (unsigned __int16)(0x4000 - v172);
                  else
                    v173 = (unsigned __int16)(v171 - v170);
                  v174 = v998;
                  memcpy((void *)(*(_QWORD *)v141 + v172), &v998[v170], v173);
                  v175 = *(_DWORD *)(v141 + 28);
                  v176 = *(_DWORD *)(v141 + 32) + v173;
                  *(_DWORD *)(v141 + 32) = v176;
                  if (v175 <= v176)
                  {
                    v177 = 0;
                  }
                  else
                  {
                    memmove(v174, &v174[v176], v175 - v176);
                    v177 = *(_DWORD *)(v141 + 28) - *(_DWORD *)(v141 + 32);
                  }
                  *(_DWORD *)(v141 + 28) = v177;
                  *(_DWORD *)(v141 + 32) = 0;
                  *(_WORD *)(v141 + 80) += v173;
                  if (!gNRPacketLoggingEnabled)
                  {
LABEL_123:
                    v169 = v149 | 0x30;
                    v142 += v173;
                    v133 = 0x1ED368000;
                    goto LABEL_124;
                  }
                  v253 = _NRCopyLogObjectForNRUUID(*v999);
                  v254 = v253;
                  if (sNRCopyLogToStdErr)
                  {

                  }
                  else
                  {
                    LODWORD(ESPSequenceNumberFromPacket) = os_log_type_enabled(v253, OS_LOG_TYPE_INFO);

                    if (!(_DWORD)ESPSequenceNumberFromPacket)
                      goto LABEL_123;
                  }
                  v278 = _NRCopyLogObjectForNRUUID(*v999);
                  _NRLogWithArgs((uint64_t)v278, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u (%u/%u) bytes from linkWriteBuffer", v279, v280, v281, v282, v283, (uint64_t)");

                  goto LABEL_123;
                }
                if (!*(_BYTE *)(v133 + 1513))
                {
LABEL_268:
                  v5 = v1004;
                  v6 = v999;
                  if (v1000)
                    v1000(v1004);
                  v330 = *(unsigned __int8 *)(v141 + 82);
                  if (v330 >= 0xB)
                  {
                    v330 = *(unsigned __int8 *)(v141 + 82)
                         - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v141 + 82)) >> 32);
                    *(_BYTE *)(v141 + 82) = v330;
                  }
                  *(_DWORD *)(v141 + 4 * v330 + 36) = 3;
                  goto LABEL_317;
                }
                v734 = _NRCopyLogObjectForNRUUID(*v999);
                v735 = v734;
                if (sNRCopyLogToStdErr)
                {

                  v76 = v994;
                }
                else
                {
                  v749 = os_log_type_enabled(v734, OS_LOG_TYPE_INFO);

                  v76 = v994;
                  if (!v749)
                    goto LABEL_268;
                }
                v750 = _NRCopyLogObjectForNRUUID(*v999);
                _NRLogWithArgs((uint64_t)v750, 1, (uint64_t)"%s%.30s:%-4d %s: ignoring NtL fast-path for %u, as waiting for link output available", v751, v752, v753, v754, v755, (uint64_t)");

                goto LABEL_268;
              }
              v716 = (uint64_t)v139;
              v717 = v999;
              if (!*(_BYTE *)(v133 + 1513))
                goto LABEL_689;
              v910 = _NRCopyLogObjectForNRUUID(*v999);
              v911 = v910;
              if (sNRCopyLogToStdErr)
              {

              }
              else
              {
                v932 = os_log_type_enabled(v910, OS_LOG_TYPE_INFO);

                if (!v932)
                  goto LABEL_689;
              }
              v933 = _NRCopyLogObjectForNRUUID(*v717);
              _NRLogWithArgs((uint64_t)v933, 1, (uint64_t)"%s%.30s:%-4d ", v934, v935, v936, v937, v938, (uint64_t)");

LABEL_689:
              v718 = _NRCopyLogObjectForNRUUID(*v717);
              v719 = v718;
              if (sNRCopyLogToStdErr)
              {

                v5 = v1004;
                v6 = v717;
                v76 = v994;
              }
              else
              {
                v742 = os_log_type_enabled(v718, OS_LOG_TYPE_FAULT);

                v5 = v1004;
                v6 = v717;
                v76 = v994;
                if (!v742)
                  goto LABEL_318;
              }
              v743 = _NRCopyLogObjectForNRUUID(*v6);
              _NRLogWithArgs((uint64_t)v743, 17, (uint64_t)"%s: Invalid write context for nexus priority: %u", v744, v745, v746, v747, v748, v716);

LABEL_318:
              v22 = v990;
              goto LABEL_319;
            }
            v135 = *(_QWORD *)(v5 + 104);
            if (!v135)
            {
LABEL_95:
              v1011 = 0;
              v136 = (_QWORD *)(v5 + 96);
              v138 = 1;
              v139 = "Medium";
              goto LABEL_98;
            }
            if ((*(_BYTE *)(*(_QWORD *)v135 + 27) & 3) == 1 && !*(_BYTE *)(v5 + 12))
            {

              v137 = 0;
              v1000 = 0;
              v132 = 0;
              v131 = 0;
              v992 = 0;
              v136 = (_QWORD *)(v5 + 112);
              if (!*(_BYTE *)(v5 + 12))
                goto LABEL_87;
            }
            else
            {
              v136 = 0;
              v137 = 1;
              if (!*(_BYTE *)(v5 + 12))
                goto LABEL_87;
            }
            if (gNRPacketLoggingEnabled)
            {
              v760 = v132;
              v761 = _NRCopyLogObjectForNRUUID(*v999);
              v762 = v761;
              if (sNRCopyLogToStdErr)
              {

                v5 = v1004;
                v76 = v994;
              }
              else
              {
                LODWORD(v1012) = os_log_type_enabled(v761, OS_LOG_TYPE_INFO);

                v5 = v1004;
                v76 = v994;
                v132 = v760;
                if (!(_DWORD)v1012)
                  goto LABEL_87;
              }
              v783 = _NRCopyLogObjectForNRUUID(*v999);
              _NRLogWithArgs((uint64_t)v783, 1, (uint64_t)"%s%.30s:%-4d sending packets over medium pipe", v784, v785, v786, v787, v788, (uint64_t)");

              v132 = v760;
            }
LABEL_87:
            if (v136)
            {
              if ((v137 & 1) != 0)
              {
                v1011 = 0;
                v138 = 0;
                v139 = "Invalid";
                v133 = 0x1ED368000;
                v134 = v131;
                goto LABEL_98;
              }
              v133 = 0x1ED368000uLL;
              v134 = v131;
              goto LABEL_97;
            }
            v133 = 0x1ED368000;
            v134 = v131;
            goto LABEL_95;
          }
          v108 = 0;
          v109 = 16;
          v110 = 464;
          v111 = 336;
          v112 = 272;
          v113 = 224;
          v114 = NRBluetoothPacketParserSuspendNexusBEInputSource;
        }
        v1000 = v114;
        v992 = *(void **)(v5 + v113);
        v131 = *(_QWORD *)(v5 + v112);
        v132 = *(id *)(v5 + v111);
        v1009 = (_QWORD *)(v5 + v110);
        v1010 = (_BYTE *)(v5 + v109);
        goto LABEL_77;
      }
      v711 = nrCopyLogObj_506();
      v712 = v711;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v713 = os_log_type_enabled(v711, OS_LOG_TYPE_ERROR);

        if (!v713)
          goto LABEL_697;
      }
      v727 = nrCopyLogObj_506();
      _NRLogWithArgs((uint64_t)v727, 16, (uint64_t)"%s%.30s:%-4d ABORTING: _strict_reallocf(%zu) failed", v728, v729, v730, v731, v732, (uint64_t)");

LABEL_697:
      _os_log_pack_size();
      MEMORY[0x1E0C80A78]();
      __error();
      v733 = _os_log_pack_fill();
      *(_DWORD *)v733 = 136446466;
      *(_QWORD *)(v733 + 4) = "_strict_reallocf";
      *(_WORD *)(v733 + 12) = 2048;
      *(_QWORD *)(v733 + 14) = v78;
      goto LABEL_620;
    }
    v708 = nrCopyLogObj_506();
    v709 = v708;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v710 = os_log_type_enabled(v708, OS_LOG_TYPE_ERROR);

      if (!v710)
        goto LABEL_694;
    }
    v720 = nrCopyLogObj_506();
    _NRLogWithArgs((uint64_t)v720, 16, (uint64_t)"%s%.30s:%-4d ABORTING: _strict_reallocf called with size 0", v721, v722, v723, v724, v725, (uint64_t)");

LABEL_694:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    v726 = _os_log_pack_fill();
    *(_DWORD *)v726 = 136446210;
    *(_QWORD *)(v726 + 4) = "_strict_reallocf";
    goto LABEL_620;
  }
  v66 = v995;
  if (sNRCopyLogToStdErr)
  {

    v22 = v24;
  }
  else
  {
    v94 = os_log_type_enabled(v64, OS_LOG_TYPE_ERROR);

    v22 = v24;
    if (!v94)
    {
      v92 = 1;
      v76 = v994;
      goto LABEL_320;
    }
  }
  v95 = _NRCopyLogObjectForNRUUID(*v999);
  v76 = v994;
  _NRLogWithArgs((uint64_t)v95, 16, (uint64_t)"%s%.30s:%-4d Invalid link-write context ptr for prio %@", v96, v97, v98, v99, v100, (uint64_t)");

  v92 = 1;
LABEL_320:

  v93 = (void *)v996;
LABEL_321:

  if (v92)
    goto LABEL_347;
LABEL_322:
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("source-address-bytes"));
  v343 = (void *)objc_claimAutoreleasedReturnValue();

  if (v343)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("source-address-bytes"));
    v344 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v344, "length") != 16)
    {
      v982 = objc_msgSend(v344, "length");
      -[NRBluetoothPacketParser handleInternalError:](v5, CFSTR("invalid src addr length (%llu != &zu)"), v355, v356, v357, v358, v359, v360, v982);
LABEL_346:

      goto LABEL_347;
    }
    objc_msgSend(v344, "getBytes:length:", v5 + 672, objc_msgSend(v344, "length"));

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("destination-address-bytes"));
  v345 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v345)
    goto LABEL_328;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("destination-address-bytes"));
  v344 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v344, "length") != 16)
  {
    v983 = objc_msgSend(v344, "length");
    -[NRBluetoothPacketParser handleInternalError:](v5, CFSTR("invalid dst addr length (%llu != &zu)"), v374, v375, v376, v377, v378, v379, v983);
    goto LABEL_346;
  }
  objc_msgSend(v344, "getBytes:length:", v5 + 688, objc_msgSend(v344, "length"));

LABEL_328:
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("nexus-instances"));
  v346 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v346)
    goto LABEL_342;
  v999 = v6;
  if (*(_BYTE *)(v5 + 8) == 1)
    -[NRBluetoothPacketParser changeStateTo:](v5, 2u);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("nexus-instances"));
  v347 = (void *)objc_claimAutoreleasedReturnValue();
  v348 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v1013 = 0u;
  v1014 = 0u;
  v1015 = 0u;
  v1016 = 0u;
  v349 = v347;
  v350 = objc_msgSend(v349, "countByEnumeratingWithState:objects:count:", &v1013, v1023, 16);
  if (v350)
  {
    v351 = v350;
    v352 = *(_QWORD *)v1014;
    do
    {
      for (i = 0; i != v351; ++i)
      {
        if (*(_QWORD *)v1014 != v352)
          objc_enumerationMutation(v349);
        v354 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", *(_QWORD *)(*((_QWORD *)&v1013 + 1) + 8 * i));
        objc_msgSend(v348, "addObject:", v354);

      }
      v351 = objc_msgSend(v349, "countByEnumeratingWithState:objects:count:", &v1013, v1023, 16);
    }
    while (v351);
  }

  v361 = v348;
  v368 = v361;
  v6 = v999;
  if (*(_BYTE *)(v5 + 8) != 4 && !*(_BYTE *)(v5 + 11))
  {
    if (!v361)
    {
      -[NRBluetoothPacketParser handleInternalError:](v5, CFSTR("Invalid nexus instances"), v362, v363, v364, v365, v366, v367, v985);
      goto LABEL_341;
    }
    v406 = objc_msgSend(v361, "count");
    if ((_DWORD)v406 != 4)
    {
      -[NRBluetoothPacketParser handleInternalError:](v5, CFSTR("invalid nexus count %u"), v407, v408, v409, v410, v411, v412, v406);
      goto LABEL_341;
    }
    v413 = v6;
    objc_msgSend(v368, "objectAtIndexedSubscript:", 0);
    v414 = (void *)objc_claimAutoreleasedReturnValue();
    -[NRBluetoothPacketParser setupNexusChannelForPriority:channelUUID:](v5, 0x64u, v414);

    objc_msgSend(v368, "objectAtIndexedSubscript:", 1);
    v415 = (void *)objc_claimAutoreleasedReturnValue();
    -[NRBluetoothPacketParser setupNexusChannelForPriority:channelUUID:](v5, 0x65u, v415);

    objc_msgSend(v368, "objectAtIndexedSubscript:", 2);
    v416 = (void *)objc_claimAutoreleasedReturnValue();
    -[NRBluetoothPacketParser setupNexusChannelForPriority:channelUUID:](v5, 0x66u, v416);

    objc_msgSend(v368, "objectAtIndexedSubscript:", 3);
    v417 = (void *)objc_claimAutoreleasedReturnValue();
    -[NRBluetoothPacketParser setupNexusChannelForPriority:channelUUID:](v5, 0x67u, v417);

    v418 = _NRCopyLogObjectForNRUUID(*(void **)(v5 + 40));
    v419 = v418;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v447 = os_log_type_enabled(v418, OS_LOG_TYPE_DEFAULT);

      if (!v447)
      {
LABEL_401:
        *(_BYTE *)(v5 + 11) = 1;
        objc_storeStrong((id *)(v5 + 64), v348);
        v6 = v413;
        if (*(_BYTE *)(v5 + 8) != 3 && objc_msgSend(*(id *)(v5 + 64), "count") && *(_BYTE *)(v5 + 10))
          -[NRBluetoothPacketParser changeStateTo:](v5, 3u);
        goto LABEL_341;
      }
    }
    v448 = _NRCopyLogObjectForNRUUID(*v413);
    _NRLogWithArgs((uint64_t)v448, 0, (uint64_t)"%s%.30s:%-4d Setup nexus channels: %@", v449, v450, v451, v452, v453, (uint64_t)");

    goto LABEL_401;
  }
LABEL_341:

LABEL_342:
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("activate-datapath"));
  v369 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v369)
    goto LABEL_356;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("activate-datapath"));
  v344 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("activate-datapath-offset"));
  v370 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("channel-id"));
  v371 = (char *)(id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v371, "integerValue") == 2)
  {

    v372 = 4;
    v373 = 2;
  }
  else if (objc_msgSend(v371, "integerValue") == 1)
  {

    v372 = 2;
    v373 = 1;
  }
  else
  {
    v380 = objc_msgSend(v371, "integerValue");

    if (v380 == 3)
      v373 = 3;
    else
      v373 = 0;
    v372 = 8 * (v380 == 3);
  }
  v381 = *(unsigned __int8 *)(v5 + 10);
  if ((v381 & v372) == 0)
  {
    v998 = v371;
    if (v373 - 1 < 3)
    {
      v386 = (v373 - 1);
      v387 = 0x80402u >> (8 * v386);
      v388 = 16 * v386 + 88;
      *(_BYTE *)(v5 + 10) = v381 | v387;
      v389 = *(uint64_t **)(v5 + v388);
      if (v389)
      {
        v390 = *v389;
        if (*v389)
        {
          v999 = v6;
          *(_BYTE *)(v390 + 27) |= 3u;
          v391 = *(_QWORD *)(v5 + v388);
          v392 = *(void (**)(_QWORD))(v391 + 24);
          if (v392)
            v392(*(_QWORD *)(v391 + 32));
          v393 = objc_msgSend(v370, "unsignedIntValue");
          v400 = v393;
          v401 = *(_DWORD *)(v390 + 16);
          if (v401 > v393)
          {
            v995 = v344;
            v402 = v999;
            v403 = _NRCopyLogObjectForNRUUID(*v999);
            v404 = v403;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v454 = os_log_type_enabled(v403, OS_LOG_TYPE_DEFAULT);

              if (!v454)
                goto LABEL_407;
            }
            v455 = _NRCopyLogObjectForNRUUID(*v402);
            objc_msgSend(v370, "intValue");
            _NRLogWithArgs((uint64_t)v455, 0, (uint64_t)"%s%.30s:%-4d received more data than moveOffset (%u > %u), off %d", v456, v457, v458, v459, v460, (uint64_t)");

LABEL_407:
            if (v400 >= 0x10000)
            {
              v461 = *(unsigned int *)(v390 + 16);
              objc_msgSend(v370, "intValue");
              -[NRBluetoothPacketParser handleInternalError:](v5, CFSTR("received more data than moveOffset (%u > %u), off %d"), v462, v463, v464, v465, v466, v467, v461);
              v344 = v995;
              goto LABEL_398;
            }
            if (v400)
            {
              memmove(*(void **)v390, (const void *)(*(_QWORD *)v390 + v400), *(_DWORD *)(v390 + 16) - v400);
              *(_DWORD *)(v390 + 16) -= v400;
            }
            bzero(&v1019, 0x5DCuLL);
            v468 = *(unsigned int *)(v390 + 16);
            *(_DWORD *)(v390 + 16) = 0;
            v469 = (__CFString *)&v1019;
            if (v468 < 0x5DD)
              goto LABEL_414;
            v470 = (__CFString *)malloc_type_calloc(1uLL, v468, 0xF1748037uLL);
            if (v470)
            {
              v469 = v470;
LABEL_414:
              memcpy(v469, *(const void **)v390, v468);
              NRBluetoothPacketParserLinkToNexusLoopFastPath(v5, v390, v469, v468, 0, 0);
              if (v469 != (__CFString *)&v1019)
                free(v469);
              v344 = v995;
              v371 = v998;
LABEL_417:
              -[NRBluetoothPacketParser updateReadyStateIfApplicable](v5);
              if (*(_BYTE *)(v5 + 8) == 4)
                goto LABEL_355;
              v995 = v344;
              dispatch_assert_queue_V2(*(dispatch_queue_t *)(v5 + 56));
              v990 = &v985;
              if (v373 == 3)
              {
                v471 = 1;
                v472 = 14;
                v473 = 432;
                v474 = 304;
                v475 = 240;
                v476 = 208;
                v477 = NRBluetoothPacketParserSuspendNexusVOInputSource;
              }
              else if ((0x64656600u >> (8 * v373)) == 101)
              {
                v471 = 1;
                v472 = 15;
                v473 = 448;
                v474 = 320;
                v475 = 256;
                v476 = 216;
                v477 = NRBluetoothPacketParserSuspendNexusVIInputSource;
              }
              else
              {
                if ((0x64656600u >> (8 * v373)) != 102)
                {
                  v1009 = 0;
                  v1010 = 0;
                  v1000 = 0;
                  v471 = 0;
                  v478 = 0;
                  v1012 = 0;
                  v993 = 0;
LABEL_425:
                  v479 = 0x1ED368000uLL;
                  if (!gNRPacketLoggingEnabled)
                    goto LABEL_426;
                  v776 = v478;
                  v777 = _NRCopyLogObjectForNRUUID(*v999);
                  v778 = v777;
                  if (sNRCopyLogToStdErr)
                  {

                    v5 = v1004;
                  }
                  else
                  {
                    v1011 = os_log_type_enabled(v777, OS_LOG_TYPE_INFO);

                    v5 = v1004;
                    v478 = v776;
                    if (!v1011)
                      goto LABEL_426;
                  }
                  v795 = _NRCopyLogObjectForNRUUID(*v999);
                  _NRLogWithArgs((uint64_t)v795, 1, (uint64_t)"%s%.30s:%-4d starting NtL fast-path for %u", v796, v797, v798, v799, v800, (uint64_t)");

                  v478 = v776;
LABEL_426:
                  if (v373 == 3 && (*(_BYTE *)(v5 + 10) & 8) != 0)
                  {
                    v481 = (_QWORD *)(v5 + 128);
                    v483 = 3;
                    v1011 = 1;
                    v484 = "Isochronous";
                    goto LABEL_445;
                  }
                  if (!v471)
                    goto LABEL_442;
                  if ((*(_BYTE *)(v5 + 10) & 4) != 0)
                  {
                    v481 = (_QWORD *)(v5 + 112);
LABEL_444:
                    v1011 = 0;
                    v484 = "High";
                    v483 = 2;
LABEL_445:
                    v1003 = (_QWORD **)v481;
                    v485 = (_QWORD *)*v481;
                    v991 = v478;
                    v992 = v370;
                    if (v485)
                    {
                      v486 = v485[3];
                      if ((*(_BYTE *)(v486 + 84) & 1) == 0)
                      {
                        LODWORD(v988) = v483;
                        v989 = (uint64_t *)v484;
                        v987 = v3;
                        v487 = 0;
                        v488 = 0;
                        v1005 = 0;
                        v489 = *(unsigned __int8 *)(v486 + 83);
                        v490 = *(_QWORD *)(v486 + 8);
                        v491 = 568;
                        if (v489 == 3)
                          v491 = 584;
                        v147 = v489 == 2;
                        v492 = 600;
                        if (!v147)
                          v492 = v491;
                        v1001 = v492;
                        v1007 = v5 + 688;
                        v1008 = v5 + 672;
                        v493 = 9;
                        ESPSequenceNumberFromPacket = v490;
                        if (!*(_BYTE *)(v479 + 1513))
                          goto LABEL_456;
LABEL_452:
                        v494 = _NRCopyLogObjectForNRUUID(*v999);
                        v495 = v494;
                        if (sNRCopyLogToStdErr)
                        {

                          v479 = 0x1ED368000;
LABEL_455:
                          v497 = _NRCopyLogObjectForNRUUID(*v999);
                          _NRLogWithArgs((uint64_t)v497, 1, (uint64_t)"%s%.30s:%-4d %s: starting NtL outer loop", v498, v499, v500, v501, v502, (uint64_t)");

                          goto LABEL_456;
                        }
                        v496 = os_log_type_enabled(v494, OS_LOG_TYPE_INFO);

                        v479 = 0x1ED368000uLL;
                        if (v496)
                          goto LABEL_455;
LABEL_456:
                        v1006 = 0;
                        v503 = 0;
                        v1002 = 0;
                        v1021 = 0u;
                        v1022 = 0u;
                        v1019 = 0u;
                        v1020 = 0u;
                        if (*(_BYTE *)(v479 + 1513))
                          goto LABEL_457;
                        while (1)
                        {
                          v513 = v493 | 0x10;
                          if (!v1011)
                          {
                            v515 = *(_DWORD *)(v486 + 28);
                            v514 = *(unsigned int *)(v486 + 32);
                            if (v515 > v514)
                              break;
                          }
LABEL_471:
                          v522 = v1006;
                          if (v1012)
                            v522 = (os_log_t)os_channel_get_next_slot();
                          if (!v522)
                          {
                            v557 = 0;
                            goto LABEL_508;
                          }
                          while (1)
                          {
                            v523 = 0x4000 - *(unsigned __int16 *)(v486 + 80);
                            if (v523 < nrMaxTLVLengthForPacket(v1020, WORD1(v1019)))
                            {
                              v513 |= 0x40u;
                              if (!gNRPacketLoggingEnabled)
                              {
LABEL_506:
                                v557 = v522;
                                v479 = 0x1ED368000;
                                goto LABEL_508;
                              }
                              v593 = _NRCopyLogObjectForNRUUID(*v999);
                              v594 = v593;
                              if (sNRCopyLogToStdErr)
                              {

                              }
                              else
                              {
                                LODWORD(v1006) = os_log_type_enabled(v593, OS_LOG_TYPE_INFO);

                                if (!(_DWORD)v1006)
                                  goto LABEL_506;
                              }
                              v606 = _NRCopyLogObjectForNRUUID(*v999);
                              _NRLogWithArgs((uint64_t)v606, 1, (uint64_t)"%s%.30s:%-4d %s: not enough room %u to fit maxTLVLen %u", v607, v608, v609, v610, v611, (uint64_t)");

                              goto LABEL_506;
                            }
                            os_channel_slot_get_packet();
                            os_packet_get_next_buflet();
                            v524 = os_buflet_get_data_offset();
                            v525 = os_buflet_get_object_address();
                            v526 = os_buflet_get_data_length();
                            if (v526 >= 0x10000)
                              goto LABEL_614;
                            v527 = v526;
                            if (!(_WORD)v526 && WORD1(v1019))
                            {
                              v1017 = 0;
                              v1018 = 0;
                              v1017 = *(_QWORD *)v486 + *(unsigned __int16 *)(v486 + 80);
                              LODWORD(v1018) = v523;
                              v528 = nrPacketToTLV((unsigned __int8 *)v1020, WORD1(v1019), (uint64_t)&v1017, 1u, v1008, v1007);
                              v479 = 0x1ED368000uLL;
                              if (!gNRPacketLoggingEnabled)
                              {
LABEL_479:
                                v513 |= 0x80u;
                                goto LABEL_483;
                              }
                              v533 = _NRCopyLogObjectForNRUUID(*v999);
                              v534 = v533;
                              if (sNRCopyLogToStdErr)
                              {

                              }
                              else
                              {
                                v538 = os_log_type_enabled(v533, OS_LOG_TYPE_INFO);

                                if (!v538)
                                  goto LABEL_479;
                              }
                              v539 = _NRCopyLogObjectForNRUUID(*v999);
                              getESPSequenceNumberFromPacket(v1020, WORD1(v1019));
                              getESPSPIFromPacket(v1020, WORD1(v1019));
                              _NRLogWithArgs((uint64_t)v539, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u bytes from nexus for ESP seq: %u (spi: %u)", v540, v541, v542, v543, v544, (uint64_t)");

                              goto LABEL_479;
                            }
                            if ((_WORD)v526)
                            {
                              v529 = (unsigned __int8 *)(v525 + v524);
                              v1017 = 0;
                              v1018 = 0;
                              v1017 = *(_QWORD *)v486 + *(unsigned __int16 *)(v486 + 80);
                              LODWORD(v1018) = v523;
                              v528 = nrPacketToTLV(v529, (unsigned __int16)v526, (uint64_t)&v1017, 1u, v1008, v1007);
                              v479 = 0x1ED368000uLL;
                              if (!gNRPacketLoggingEnabled)
                              {
LABEL_482:
                                v513 |= 0x100u;
                                goto LABEL_483;
                              }
                              v535 = _NRCopyLogObjectForNRUUID(*v999);
                              if (sNRCopyLogToStdErr)
                              {

                              }
                              else
                              {
                                v1006 = v535;
                                LODWORD(v996) = os_log_type_enabled(v535, OS_LOG_TYPE_INFO);

                                if (!(_DWORD)v996)
                                  goto LABEL_482;
                              }
                              v1006 = _NRCopyLogObjectForNRUUID(*v999);
                              v996 = getESPSequenceNumberFromPacket((uint64_t)v529, v527);
                              getESPSPIFromPacket((uint64_t)v529, v527);
                              v545 = v1006;
                              _NRLogWithArgs((uint64_t)v1006, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u bytes from nexus for ESP seq: %u (spi: %u)", v546, v547, v548, v549, v550, (uint64_t)");

                              goto LABEL_482;
                            }
                            v513 |= 0x200u;
                            v479 = 0x1ED368000uLL;
                            if (!gNRPacketLoggingEnabled)
                            {
                              v528 = 0;
                              goto LABEL_483;
                            }
                            v536 = _NRCopyLogObjectForNRUUID(*v999);
                            v537 = v536;
                            if (sNRCopyLogToStdErr)
                            {

                            }
                            else
                            {
                              v528 = os_log_type_enabled(v536, OS_LOG_TYPE_INFO);

                              if (!v528)
                                goto LABEL_483;
                            }
                            v551 = _NRCopyLogObjectForNRUUID(*v999);
                            _NRLogWithArgs((uint64_t)v551, 1, (uint64_t)"%s%.30s:%-4d %s: No data to write", v552, v553, v554, v555, v556, (uint64_t)");

                            v528 = 0;
LABEL_483:
                            *(_WORD *)(v486 + 80) += v528;
                            v530 = v1011 ? 0 : os_channel_get_next_slot();
                            ++v488;
                            ++*v1009;
                            *v1010 = 1;
                            v487 += v528;
                            if (!v530)
                              break;
                            v531 = *(unsigned __int8 *)(v486 + 82);
                            if (v531 >= 0xB)
                            {
                              v531 = *(unsigned __int8 *)(v486 + 82)
                                   - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v486 + 82)) >> 32);
                              *(_BYTE *)(v486 + 82) = v531;
                            }
                            *(_DWORD *)(v486 + 4 * v531 + 36) = v513;
                            v532 = (117 * (*(_BYTE *)(v486 + 82) + 1)) >> 8;
                            *(_BYTE *)(v486 + 82) = *(_BYTE *)(v486 + 82)
                                                  + 1
                                                  - 11
                                                  * ((v532
                                                    + (((*(_BYTE *)(v486 + 82) + 1 - v532) & 0xFE) >> 1)) >> 3);
                            v503 = v522;
                            v522 = (os_log_t)v530;
                            v513 = 0;
                          }
                          v557 = 0;
                          v503 = v522;
LABEL_508:
                          v558 = *(unsigned __int16 *)(v486 + 80);
                          LODWORD(v559) = *(_WORD *)(v486 + 80) != 0;
                          if (!*(_WORD *)(v486 + 80))
                          {
                            v561 = v513 | 0x400;
                            if (*(_BYTE *)(v479 + 1513))
                            {
                              LODWORD(v996) = *(_WORD *)(v486 + 80) != 0;
                              v646 = _NRCopyLogObjectForNRUUID(*v999);
                              v647 = v646;
                              if (sNRCopyLogToStdErr)
                              {

                                goto LABEL_589;
                              }
                              v648 = os_log_type_enabled(v646, OS_LOG_TYPE_INFO);

                              if (v648)
                              {
LABEL_589:
                                v649 = _NRCopyLogObjectForNRUUID(*v999);
                                _NRLogWithArgs((uint64_t)v649, 1, (uint64_t)"%s%.30s:%-4d %s: nothing to read from nexus", v650, v651, v652, v653, v654, (uint64_t)");

                              }
                              v479 = 0x1ED368000uLL;
                              LODWORD(v559) = v996;
LABEL_591:
                              v644 = v558 == 0;
                              if (!*(_BYTE *)(v479 + 1513))
                              {
                                v645 = v561 | 0x8000;
                                if (v503)
                                  goto LABEL_593;
                                goto LABEL_584;
                              }
                              v657 = v559;
                              v658 = _NRCopyLogObjectForNRUUID(*v999);
                              v659 = v658;
                              if (sNRCopyLogToStdErr)
                              {

                                goto LABEL_609;
                              }
                              v662 = os_log_type_enabled(v658, OS_LOG_TYPE_INFO);

                              if (v662)
                              {
LABEL_609:
                                v663 = _NRCopyLogObjectForNRUUID(*v999);
                                _NRLogWithArgs((uint64_t)v663, 1, (uint64_t)"%s%.30s:%-4d %s: out of NtL inner loop", v664, v665, v666, v667, v668, (uint64_t)");

                              }
                              LODWORD(v559) = v657;
                              v645 = v561 | 0x8000;
                              if (v503)
                                goto LABEL_593;
LABEL_584:
                              if (*(_BYTE *)(v1004 + 13))
                                goto LABEL_594;
                              goto LABEL_599;
                            }
                            LODWORD(v559) = 0;
                            v644 = 1;
                            v645 = v561 | 0x8000;
                            if (!v503)
                              goto LABEL_584;
LABEL_593:
                            os_channel_advance_slot();
                            *(_BYTE *)(v1004 + 13) = 1;
LABEL_594:
                            if (v1005 > 8u
                              || v1012 && os_channel_available_slot_count() <= 1)
                            {
                              if (!gNRPacketLoggingEnabled)
                                goto LABEL_598;
                              v660 = v559;
                              v661 = _NRCopyLogObjectForNRUUID(*v999);
                              v559 = (uint64_t)v661;
                              if (sNRCopyLogToStdErr)
                              {

                                goto LABEL_613;
                              }
                              v669 = os_log_type_enabled(v661, OS_LOG_TYPE_INFO);

                              LODWORD(v559) = v660;
                              if (v669)
                              {
LABEL_613:
                                v559 = (uint64_t)_NRCopyLogObjectForNRUUID(*(void **)(v1004 + 40));
                                _NRLogWithArgs(v559, 1, (uint64_t)"%s%.30s:%-4d %s: performing RX sync (%u packets, %u bytes, %u pending, %0.2f msec, canWriteMore %d, memmove %u)", v670, v671, v672, v673, v674, (uint64_t)");

                                LODWORD(v559) = v660;
                              }
LABEL_598:
                              v645 = v561 | 0x18000;
                              os_channel_sync();
                              *(_BYTE *)(v1004 + 13) = 0;
                            }
LABEL_599:
                            if ((v559 & v644) != 1)
                            {
                              v3 = v987;
                              v5 = v1004;
                              if (!gNRPacketLoggingEnabled)
                                goto LABEL_628;
                              v830 = v559;
                              v831 = _NRCopyLogObjectForNRUUID(*v999);
                              v559 = (uint64_t)v831;
                              if (sNRCopyLogToStdErr)
                              {

                                v3 = v987;
                                v5 = v1004;
                                goto LABEL_763;
                              }
                              v867 = os_log_type_enabled(v831, OS_LOG_TYPE_INFO);

                              v3 = v987;
                              v5 = v1004;
                              LOBYTE(v559) = v830;
                              if (v867)
                              {
LABEL_763:
                                v559 = (uint64_t)_NRCopyLogObjectForNRUUID(*v999);
                                _NRLogWithArgs(v559, 1, (uint64_t)"%s%.30s:%-4d %s: out of NtL outer loop", v868, v869, v870, v871, v872, (uint64_t)");

                                LOBYTE(v559) = v830;
                              }
LABEL_628:
                              if ((v559 & 1) != 0)
                                goto LABEL_670;
                              if ((_DWORD)v988 == 1)
                              {
                                v691 = *(_QWORD *)(v5 + 136);
                                if ((*(_BYTE *)(v5 + 10) & 4) == 0)
                                  goto LABEL_654;
                                goto LABEL_662;
                              }
                              if ((_DWORD)v988 != 2)
                              {
                                if ((_DWORD)v988 == 3)
                                {
                                  v5 = v1004;
                                  v687 = *(_QWORD *)(v1004 + 136);
                                  v3 = v987;
                                  if ((v687 & 8) != 0 && *(_QWORD *)(v1004 + 304))
                                  {
                                    v688 = (dispatch_object_t *)(v1004 + 304);
                                    *(_QWORD *)(v1004 + 136) = v687 & 0xFFFFFFFFFFFFFFF7;
                                    if (gNRPacketLoggingEnabled)
                                    {
                                      v689 = _NRCopyLogObjectForNRUUID(*v999);
                                      v690 = v689;
                                      if (sNRCopyLogToStdErr)
                                      {

                                        goto LABEL_799;
                                      }
                                      v953 = os_log_type_enabled(v689, OS_LOG_TYPE_INFO);

                                      if (v953)
                                      {
LABEL_799:
                                        v919 = _NRCopyLogObjectForNRUUID(*v999);
                                        _NRLogWithArgs((uint64_t)v919, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v954, v955, v956, v957, v958, (uint64_t)");
                                        goto LABEL_802;
                                      }
                                    }
                                    goto LABEL_669;
                                  }
                                  goto LABEL_670;
                                }
                                v691 = *(_QWORD *)(v1004 + 136);
LABEL_654:
                                if ((v691 & 8) != 0 && *(_QWORD *)(v1004 + 304))
                                {
                                  *(_QWORD *)(v1004 + 136) = v691 & 0xFFFFFFFFFFFFFFF7;
                                  if (!gNRPacketLoggingEnabled)
                                    goto LABEL_657;
                                  v912 = _NRCopyLogObjectForNRUUID(*v999);
                                  v913 = v912;
                                  if (sNRCopyLogToStdErr)
                                  {

                                    goto LABEL_795;
                                  }
                                  v939 = os_log_type_enabled(v912, OS_LOG_TYPE_INFO);

                                  if (v939)
                                  {
LABEL_795:
                                    v940 = _NRCopyLogObjectForNRUUID(*v999);
                                    _NRLogWithArgs((uint64_t)v940, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v941, v942, v943, v944, v945, (uint64_t)");

                                  }
LABEL_657:
                                  v696 = v1004;
                                  dispatch_resume(*(dispatch_object_t *)(v1004 + 304));
                                  v691 = *(_QWORD *)(v696 + 136);
                                }
                                if ((v691 & 0x10) != 0 && *(_QWORD *)(v1004 + 320))
                                {
                                  *(_QWORD *)(v1004 + 136) = v691 & 0xFFFFFFFFFFFFFFEFLL;
                                  if (!gNRPacketLoggingEnabled)
                                    goto LABEL_661;
                                  v914 = _NRCopyLogObjectForNRUUID(*v999);
                                  v915 = v914;
                                  if (sNRCopyLogToStdErr)
                                  {

                                    goto LABEL_797;
                                  }
                                  v946 = os_log_type_enabled(v914, OS_LOG_TYPE_INFO);

                                  if (v946)
                                  {
LABEL_797:
                                    v947 = _NRCopyLogObjectForNRUUID(*v999);
                                    _NRLogWithArgs((uint64_t)v947, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVIInput", v948, v949, v950, v951, v952, (uint64_t)");

                                  }
LABEL_661:
                                  v697 = v1004;
                                  dispatch_resume(*(dispatch_object_t *)(v1004 + 320));
                                  v691 = *(_QWORD *)(v697 + 136);
                                }
LABEL_662:
                                if ((v691 & 0x20) != 0 && *(_QWORD *)(v1004 + 336))
                                {
                                  *(_QWORD *)(v1004 + 136) = v691 & 0xFFFFFFFFFFFFFFDFLL;
                                  if (!gNRPacketLoggingEnabled)
                                    goto LABEL_665;
                                  v906 = _NRCopyLogObjectForNRUUID(*v999);
                                  v907 = v906;
                                  if (sNRCopyLogToStdErr)
                                  {

                                    goto LABEL_791;
                                  }
                                  v925 = os_log_type_enabled(v906, OS_LOG_TYPE_INFO);

                                  if (v925)
                                  {
LABEL_791:
                                    v926 = _NRCopyLogObjectForNRUUID(*v999);
                                    _NRLogWithArgs((uint64_t)v926, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBEInput", v927, v928, v929, v930, v931, (uint64_t)");

                                  }
LABEL_665:
                                  v698 = v1004;
                                  dispatch_resume(*(dispatch_object_t *)(v1004 + 336));
                                  v691 = *(_QWORD *)(v698 + 136);
                                }
                                v3 = v987;
                                v5 = v1004;
                                if ((v691 & 0x40) != 0 && *(_QWORD *)(v1004 + 352))
                                {
                                  v688 = (dispatch_object_t *)(v1004 + 352);
                                  *(_QWORD *)(v1004 + 136) = v691 & 0xFFFFFFFFFFFFFFBFLL;
                                  if (!gNRPacketLoggingEnabled)
                                    goto LABEL_669;
                                  v908 = _NRCopyLogObjectForNRUUID(*v999);
                                  v909 = v908;
                                  if (sNRCopyLogToStdErr)
                                  {

                                  }
                                  else
                                  {
                                    v918 = os_log_type_enabled(v908, OS_LOG_TYPE_INFO);

                                    if (!v918)
                                      goto LABEL_669;
                                  }
                                  v919 = _NRCopyLogObjectForNRUUID(*v999);
                                  _NRLogWithArgs((uint64_t)v919, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBKInput", v920, v921, v922, v923, v924, (uint64_t)");
                                  goto LABEL_802;
                                }
                                goto LABEL_670;
                              }
                              v692 = *(_QWORD *)(v1004 + 136);
                              if ((v692 & 8) != 0 && *(_QWORD *)(v1004 + 304))
                              {
                                *(_QWORD *)(v1004 + 136) = v692 & 0xFFFFFFFFFFFFFFF7;
                                if (!gNRPacketLoggingEnabled)
                                  goto LABEL_647;
                                v916 = _NRCopyLogObjectForNRUUID(*v999);
                                v917 = v916;
                                if (sNRCopyLogToStdErr)
                                {

                                  goto LABEL_804;
                                }
                                v965 = os_log_type_enabled(v916, OS_LOG_TYPE_INFO);

                                if (v965)
                                {
LABEL_804:
                                  v966 = _NRCopyLogObjectForNRUUID(*v999);
                                  _NRLogWithArgs((uint64_t)v966, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v967, v968, v969, v970, v971, (uint64_t)");

                                }
LABEL_647:
                                v693 = v1004;
                                dispatch_resume(*(dispatch_object_t *)(v1004 + 304));
                                v692 = *(_QWORD *)(v693 + 136);
                              }
                              v3 = v987;
                              v5 = v1004;
                              if ((v692 & 0x10) != 0 && *(_QWORD *)(v1004 + 320))
                              {
                                v688 = (dispatch_object_t *)(v1004 + 320);
                                *(_QWORD *)(v1004 + 136) = v692 & 0xFFFFFFFFFFFFFFEFLL;
                                if (!gNRPacketLoggingEnabled)
                                  goto LABEL_669;
                                v694 = _NRCopyLogObjectForNRUUID(*v999);
                                v695 = v694;
                                if (sNRCopyLogToStdErr)
                                {

                                }
                                else
                                {
                                  v959 = os_log_type_enabled(v694, OS_LOG_TYPE_INFO);

                                  if (!v959)
                                    goto LABEL_669;
                                }
                                v919 = _NRCopyLogObjectForNRUUID(*v999);
                                _NRLogWithArgs((uint64_t)v919, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVIInput", v960, v961, v962, v963, v964, (uint64_t)");
LABEL_802:

LABEL_669:
                                dispatch_resume(*v688);
                                v3 = v987;
                                v5 = v1004;
                              }
LABEL_670:
                              if (gNRPacketLoggingEnabled)
                              {
                                v832 = _NRCopyLogObjectForNRUUID(*v999);
                                v833 = v832;
                                if (sNRCopyLogToStdErr)
                                {

                                  v3 = v987;
                                  v5 = v1004;
                                }
                                else
                                {
                                  v873 = os_log_type_enabled(v832, OS_LOG_TYPE_INFO);

                                  v3 = v987;
                                  v5 = v1004;
                                  if (!v873)
                                    goto LABEL_671;
                                }
                                v874 = _NRCopyLogObjectForNRUUID(*v999);
                                _NRLogWithArgs((uint64_t)v874, 1, (uint64_t)"%s%.30s:%-4d %s: done with NtL fast-path", v875, v876, v877, v878, v879, (uint64_t)");

                              }
LABEL_671:
                              v699 = *(unsigned __int8 *)(v486 + 82);
                              if (v699 >= 0xB)
                              {
                                v699 = *(unsigned __int8 *)(v486 + 82)
                                     - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v486 + 82)) >> 32);
                                *(_BYTE *)(v486 + 82) = v699;
                              }
                              *(_DWORD *)(v486 + 4 * v699 + 36) = v645 | 0x60000;
LABEL_674:
                              v700 = (117 * (*(_BYTE *)(v486 + 82) + 1)) >> 8;
                              *(_BYTE *)(v486 + 82) = *(_BYTE *)(v486 + 82)
                                                    + 1
                                                    - 11
                                                    * ((v700
                                                      + (((*(_BYTE *)(v486 + 82) + 1 - v700) & 0xFE) >> 1)) >> 3);
                              goto LABEL_675;
                            }
                            v655 = *(unsigned __int8 *)(v486 + 82);
                            v479 = 0x1ED368000uLL;
                            if (v655 >= 0xB)
                            {
                              v655 = *(unsigned __int8 *)(v486 + 82)
                                   - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v486 + 82)) >> 32);
                              *(_BYTE *)(v486 + 82) = v655;
                            }
                            *(_DWORD *)(v486 + 4 * v655 + 36) = v645;
                            v656 = (117 * (*(_BYTE *)(v486 + 82) + 1)) >> 8;
                            *(_BYTE *)(v486 + 82) = *(_BYTE *)(v486 + 82)
                                                  + 1
                                                  - 11
                                                  * ((v656
                                                    + (((*(_BYTE *)(v486 + 82) + 1 - v656) & 0xFE) >> 1)) >> 3);
                            v493 = 8;
                            if (gNRPacketLoggingEnabled)
                              goto LABEL_452;
                            goto LABEL_456;
                          }
                          v1006 = v557;
                          v1017 = 0;
                          if (!*(_BYTE *)(v479 + 1513))
                            goto LABEL_510;
                          v578 = v559;
                          v579 = _NRCopyLogObjectForNRUUID(*v999);
                          v559 = (uint64_t)v579;
                          if (sNRCopyLogToStdErr)
                          {

                            v479 = 0x1ED368000;
                            goto LABEL_551;
                          }
                          LODWORD(v996) = os_log_type_enabled(v579, OS_LOG_TYPE_INFO);

                          v479 = 0x1ED368000;
                          LODWORD(v559) = v578;
                          if ((_DWORD)v996)
                          {
LABEL_551:
                            v559 = (uint64_t)_NRCopyLogObjectForNRUUID(*v999);
                            _NRLogWithArgs(v559, 1, (uint64_t)"%s%.30s:%-4d %s: invoking send callback w/ written %u", v583, v584, v585, v586, v587, (uint64_t)");

                            LODWORD(v559) = v578;
                          }
LABEL_510:
                          v560 = ((uint64_t (*)(_QWORD, _QWORD, _QWORD, unint64_t *, _QWORD, _QWORD))(*v1003)[1])(**v1003, *(_QWORD *)v486, *(unsigned __int16 *)(v486 + 80), &v1017, 0, 0);
                          if (*(_BYTE *)(v479 + 1513))
                          {
                            LODWORD(v996) = v559;
                            v580 = _NRCopyLogObjectForNRUUID(*v999);
                            v559 = (uint64_t)v580;
                            if (sNRCopyLogToStdErr)
                            {

                              v479 = 0x1ED368000;
                            }
                            else
                            {
                              LODWORD(v994) = os_log_type_enabled(v580, OS_LOG_TYPE_INFO);

                              v479 = 0x1ED368000;
                              LODWORD(v559) = v996;
                              if (!(_DWORD)v994)
                                goto LABEL_511;
                            }
                            v559 = (uint64_t)_NRCopyLogObjectForNRUUID(*v999);
                            _NRLogWithArgs(v559, 1, (uint64_t)"%s%.30s:%-4d %s: canWriteMore: %d bufferHandled=%zu/%u", v588, v589, v590, v591, v592, (uint64_t)");

                            LODWORD(v559) = v996;
                          }
LABEL_511:
                          if ((v560 & 1) != 0)
                          {
                            v561 = v513 | 0x800;
                            v562 = v1017;
                            if (!v1017)
                              goto LABEL_539;
LABEL_533:
                            if (v562 < *(unsigned __int16 *)(v486 + 80))
                            {
                              if (!*(_BYTE *)(v479 + 1513))
                                goto LABEL_535;
                              LODWORD(v996) = v559;
                              v595 = _NRCopyLogObjectForNRUUID(*v999);
                              v559 = (uint64_t)v595;
                              if (sNRCopyLogToStdErr)
                              {

                                v479 = 0x1ED368000;
                                goto LABEL_569;
                              }
                              LODWORD(v994) = os_log_type_enabled(v595, OS_LOG_TYPE_INFO);

                              v479 = 0x1ED368000;
                              LODWORD(v559) = v996;
                              if ((_DWORD)v994)
                              {
LABEL_569:
                                v559 = (uint64_t)_NRCopyLogObjectForNRUUID(*v999);
                                _NRLogWithArgs(v559, 1, (uint64_t)"%s%.30s:%-4d %s: memmoving filledIn=%u, bufferHandled=%zu", v612, v613, v614, v615, v616, (uint64_t)");

                                LODWORD(v559) = v996;
                              }
LABEL_535:
                              v561 |= 0x2000u;
                              memmove(*(void **)v486, (const void *)(*(_QWORD *)v486 + v1017), *(unsigned __int16 *)(v486 + 80) - v1017);
                              v575 = v1017;
                              *(_WORD *)(v486 + 80) -= v1017;
                              v1002 = (v1002 + 1);
LABEL_538:
                              *(_QWORD *)(v1004 + v1001) += v575;
                              goto LABEL_539;
                            }
                            if (!*(_BYTE *)(v479 + 1513))
                            {
LABEL_537:
                              v561 |= 0x4000u;
                              *(_WORD *)(v486 + 80) = 0;
                              v575 = v1017;
                              goto LABEL_538;
                            }
                            LODWORD(v996) = v559;
                            v596 = _NRCopyLogObjectForNRUUID(*v999);
                            v559 = (uint64_t)v596;
                            if (sNRCopyLogToStdErr)
                            {

                              v479 = 0x1ED368000;
                            }
                            else
                            {
                              LODWORD(v994) = os_log_type_enabled(v596, OS_LOG_TYPE_INFO);

                              v479 = 0x1ED368000;
                              LODWORD(v559) = v996;
                              if (!(_DWORD)v994)
                                goto LABEL_537;
                            }
                            v559 = (uint64_t)_NRCopyLogObjectForNRUUID(*v999);
                            _NRLogWithArgs(v559, 1, (uint64_t)"%s%.30s:%-4d %s: not memmoving filledIn=%u, bufferHandled=%zu", v617, v618, v619, v620, v621, (uint64_t)");

                            LODWORD(v559) = v996;
                            goto LABEL_537;
                          }
                          if (v1000)
                            v1000(v1004);
                          *(_BYTE *)(v486 + 84) |= 1u;
                          switch(*(_BYTE *)(v486 + 83))
                          {
                            case 0:
                              LODWORD(v996) = v559;
                              v563 = _NRCopyLogObjectForNRUUID(*v999);
                              v559 = (uint64_t)v563;
                              if (sNRCopyLogToStdErr)
                              {

                              }
                              else
                              {
                                LODWORD(v994) = os_log_type_enabled(v563, OS_LOG_TYPE_ERROR);

                                LODWORD(v559) = v996;
                                if (!(_DWORD)v994)
                                  goto LABEL_531;
                              }
                              v559 = (uint64_t)_NRCopyLogObjectForNRUUID(*v999);
                              _NRLogWithArgs(v559, 16, (uint64_t)"%s%.30s:%-4d invalid link channel priority", v570, v571, v572, v573, v574, (uint64_t)");
                              goto LABEL_530;
                            case 1:
                              v564 = v1004;
                              v565 = *(_QWORD *)(v1004 + 136);
                              ++*(_QWORD *)(v1004 + 144);
                              *(_QWORD *)(v564 + 136) = v565 & 0xFFFFFFFFFFFFFFFELL | *(_BYTE *)(v486 + 84) & 1;
                              if (!*(_BYTE *)(v479 + 1513))
                                goto LABEL_526;
                              LODWORD(v996) = v559;
                              v566 = _NRCopyLogObjectForNRUUID(*v999);
                              v559 = (uint64_t)v566;
                              if (sNRCopyLogToStdErr)
                              {

                                v479 = 0x1ED368000;
                              }
                              else
                              {
                                LODWORD(v994) = os_log_type_enabled(v566, OS_LOG_TYPE_INFO);

                                v479 = 0x1ED368000;
                                LODWORD(v559) = v996;
                                if (!(_DWORD)v994)
                                  goto LABEL_531;
                              }
                              v559 = (uint64_t)_NRCopyLogObjectForNRUUID(*v999);
                              _NRLogWithArgs(v559, 1, (uint64_t)"%s%.30s:%-4d source-%s: Medium", v629, v630, v631, v632, v633, (uint64_t)");
                              goto LABEL_530;
                            case 2:
                              v567 = v1004;
                              ++*(_QWORD *)(v1004 + 160);
                              *(_QWORD *)(v567 + 136) = *(_QWORD *)(v567 + 136) & 0xFFFFFFFFFFFFFFFDLL | (2 * (*(_BYTE *)(v486 + 84) & 1));
                              if (!*(_BYTE *)(v479 + 1513))
                                goto LABEL_526;
                              LODWORD(v996) = v559;
                              v568 = _NRCopyLogObjectForNRUUID(*v999);
                              v559 = (uint64_t)v568;
                              if (sNRCopyLogToStdErr)
                              {

                                v479 = 0x1ED368000;
                              }
                              else
                              {
                                LODWORD(v994) = os_log_type_enabled(v568, OS_LOG_TYPE_INFO);

                                v479 = 0x1ED368000;
                                LODWORD(v559) = v996;
                                if (!(_DWORD)v994)
                                  goto LABEL_531;
                              }
                              v559 = (uint64_t)_NRCopyLogObjectForNRUUID(*v999);
                              _NRLogWithArgs(v559, 1, (uint64_t)"%s%.30s:%-4d source-%s: High", v634, v635, v636, v637, v638, (uint64_t)");
                              goto LABEL_530;
                            case 3:
                              v569 = v1004;
                              ++*(_QWORD *)(v1004 + 176);
                              *(_QWORD *)(v569 + 136) = *(_QWORD *)(v569 + 136) & 0xFFFFFFFFFFFFFFFBLL | (4 * (*(_BYTE *)(v486 + 84) & 1));
                              if (!*(_BYTE *)(v479 + 1513))
                              {
LABEL_526:
                                v561 = v513 | 0x1800;
                                v562 = v1017;
                                if (v1017)
                                  goto LABEL_533;
                                break;
                              }
                              LODWORD(v996) = v559;
                              v622 = _NRCopyLogObjectForNRUUID(*v999);
                              v559 = (uint64_t)v622;
                              if (sNRCopyLogToStdErr)
                              {

                                v479 = 0x1ED368000;
                              }
                              else
                              {
                                LODWORD(v994) = os_log_type_enabled(v622, OS_LOG_TYPE_INFO);

                                v479 = 0x1ED368000;
                                LODWORD(v559) = v996;
                                if (!(_DWORD)v994)
                                  goto LABEL_531;
                              }
                              v559 = (uint64_t)_NRCopyLogObjectForNRUUID(*v999);
                              _NRLogWithArgs(v559, 1, (uint64_t)"%s%.30s:%-4d source-%s: Isochronous", v639, v640, v641, v642, v643, (uint64_t)");
LABEL_530:

                              LODWORD(v559) = v996;
LABEL_531:
                              v561 = v513 | 0x1800;
                              if (!*(_BYTE *)(v479 + 1513))
                              {
                                v562 = v1017;
                                if (!v1017)
                                  break;
                                goto LABEL_533;
                              }
                              LODWORD(v996) = v559;
                              v581 = _NRCopyLogObjectForNRUUID(*v999);
                              v582 = v581;
                              if (sNRCopyLogToStdErr)
                              {

                              }
                              else
                              {
                                v599 = os_log_type_enabled(v581, OS_LOG_TYPE_INFO);

                                if (!v599)
                                  goto LABEL_564;
                              }
                              v600 = _NRCopyLogObjectForNRUUID(*v999);
                              _NRLogWithArgs((uint64_t)v600, 1, (uint64_t)"%s%.30s:%-4d ", v601, v602, v603, v604, v605, (uint64_t)");

LABEL_564:
                              v479 = 0x1ED368000;
                              LODWORD(v559) = v996;
                              v562 = v1017;
                              if (v1017)
                                goto LABEL_533;
                              break;
                            default:
                              goto LABEL_531;
                          }
LABEL_539:
                          ++v1005;
                          if ((v560 & 1) == 0)
                            goto LABEL_591;
                          v576 = *(unsigned __int8 *)(v486 + 82);
                          if (v576 >= 0xB)
                          {
                            v576 = *(unsigned __int8 *)(v486 + 82)
                                 - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v486 + 82)) >> 32);
                            *(_BYTE *)(v486 + 82) = v576;
                          }
                          v493 = 0;
                          *(_DWORD *)(v486 + 4 * v576 + 36) = v561;
                          v577 = (117 * (*(_BYTE *)(v486 + 82) + 1)) >> 8;
                          *(_BYTE *)(v486 + 82) = *(_BYTE *)(v486 + 82)
                                                + 1
                                                - 11
                                                * ((v577
                                                  + (((*(_BYTE *)(v486 + 82) + 1 - v577) & 0xFE) >> 1)) >> 3);
                          if (*(_BYTE *)(v479 + 1513))
                          {
LABEL_457:
                            v504 = _NRCopyLogObjectForNRUUID(*v999);
                            v505 = v504;
                            if (sNRCopyLogToStdErr)
                            {

                              v479 = 0x1ED368000;
                              goto LABEL_460;
                            }
                            v506 = os_log_type_enabled(v504, OS_LOG_TYPE_INFO);

                            v479 = 0x1ED368000;
                            if (v506)
                            {
LABEL_460:
                              v507 = _NRCopyLogObjectForNRUUID(*v999);
                              _NRLogWithArgs((uint64_t)v507, 1, (uint64_t)"%s%.30s:%-4d %s: starting NtL inner loop", v508, v509, v510, v511, v512, (uint64_t)");

                            }
                          }
                        }
                        v516 = *(unsigned __int16 *)(v486 + 80);
                        if ((unsigned __int16)(v515 - v514) >= (unsigned __int16)(0x4000 - v516))
                          v517 = (unsigned __int16)(0x4000 - v516);
                        else
                          v517 = (unsigned __int16)(v515 - v514);
                        v518 = (char *)ESPSequenceNumberFromPacket;
                        memcpy((void *)(*(_QWORD *)v486 + v516), (const void *)(ESPSequenceNumberFromPacket + v514), v517);
                        v519 = *(_DWORD *)(v486 + 28);
                        v520 = *(_DWORD *)(v486 + 32) + v517;
                        *(_DWORD *)(v486 + 32) = v520;
                        if (v519 <= v520)
                        {
                          v521 = 0;
                        }
                        else
                        {
                          memmove(v518, &v518[v520], v519 - v520);
                          v521 = *(_DWORD *)(v486 + 28) - *(_DWORD *)(v486 + 32);
                        }
                        *(_DWORD *)(v486 + 28) = v521;
                        *(_DWORD *)(v486 + 32) = 0;
                        *(_WORD *)(v486 + 80) += v517;
                        if (!gNRPacketLoggingEnabled)
                        {
LABEL_470:
                          v513 = v493 | 0x30;
                          v487 += v517;
                          v479 = 0x1ED368000;
                          goto LABEL_471;
                        }
                        v597 = _NRCopyLogObjectForNRUUID(*v999);
                        v598 = v597;
                        if (sNRCopyLogToStdErr)
                        {

                        }
                        else
                        {
                          LODWORD(v996) = os_log_type_enabled(v597, OS_LOG_TYPE_INFO);

                          if (!(_DWORD)v996)
                            goto LABEL_470;
                        }
                        v623 = _NRCopyLogObjectForNRUUID(*v999);
                        _NRLogWithArgs((uint64_t)v623, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u (%u/%u) bytes from linkWriteBuffer", v624, v625, v626, v627, v628, (uint64_t)");

                        goto LABEL_470;
                      }
                      if (!*(_BYTE *)(v479 + 1513))
                      {
LABEL_622:
                        if (v1000)
                          v1000(v5);
                        v686 = *(unsigned __int8 *)(v486 + 82);
                        if (v686 >= 0xB)
                        {
                          v686 = *(unsigned __int8 *)(v486 + 82)
                               - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v486 + 82)) >> 32);
                          *(_BYTE *)(v486 + 82) = v686;
                        }
                        *(_DWORD *)(v486 + 4 * v686 + 36) = 3;
                        goto LABEL_674;
                      }
                      v792 = v999;
                      v793 = _NRCopyLogObjectForNRUUID(*v999);
                      v794 = v793;
                      if (sNRCopyLogToStdErr)
                      {

                        v5 = v1004;
                      }
                      else
                      {
                        v819 = os_log_type_enabled(v793, OS_LOG_TYPE_INFO);

                        v5 = v1004;
                        if (!v819)
                          goto LABEL_622;
                      }
                      v820 = _NRCopyLogObjectForNRUUID(*v792);
                      _NRLogWithArgs((uint64_t)v820, 1, (uint64_t)"%s%.30s:%-4d %s: ignoring NtL fast-path for %u, as waiting for link output available", v821, v822, v823, v824, v825, (uint64_t)");

                      goto LABEL_622;
                    }
                    v779 = (uint64_t)v484;
                    v780 = v999;
                    if (*(_BYTE *)(v479 + 1513))
                    {
                      v972 = _NRCopyLogObjectForNRUUID(*v999);
                      v973 = v972;
                      if (sNRCopyLogToStdErr)
                      {

                      }
                      else
                      {
                        v974 = os_log_type_enabled(v972, OS_LOG_TYPE_INFO);

                        if (!v974)
                          goto LABEL_720;
                      }
                      v975 = _NRCopyLogObjectForNRUUID(*v780);
                      _NRLogWithArgs((uint64_t)v975, 1, (uint64_t)"%s%.30s:%-4d ", v976, v977, v978, v979, v980, (uint64_t)");

                    }
LABEL_720:
                    v781 = _NRCopyLogObjectForNRUUID(*v780);
                    v782 = v781;
                    if (sNRCopyLogToStdErr)
                    {

                      v5 = v1004;
                    }
                    else
                    {
                      v801 = os_log_type_enabled(v781, OS_LOG_TYPE_FAULT);

                      v5 = v1004;
                      if (!v801)
                        goto LABEL_675;
                    }
                    v802 = _NRCopyLogObjectForNRUUID(*v780);
                    _NRLogWithArgs((uint64_t)v802, 17, (uint64_t)"%s: Invalid write context for nexus priority: %u", v803, v804, v805, v806, v807, v779);

LABEL_675:
                    v344 = v995;
                    v370 = v992;
                    v371 = v998;
                    goto LABEL_355;
                  }
                  v480 = *(_QWORD *)(v5 + 104);
                  if (!v480)
                  {
LABEL_442:
                    v1011 = 0;
                    v481 = (_QWORD *)(v5 + 96);
                    v483 = 1;
                    v484 = "Medium";
                    goto LABEL_445;
                  }
                  if ((*(_BYTE *)(*(_QWORD *)v480 + 27) & 3) == 1 && !*(_BYTE *)(v5 + 12))
                  {

                    v482 = 0;
                    v1000 = 0;
                    v478 = 0;
                    v1012 = 0;
                    v993 = 0;
                    v481 = (_QWORD *)(v5 + 112);
                    if (!*(_BYTE *)(v5 + 12))
                      goto LABEL_435;
                  }
                  else
                  {
                    v481 = 0;
                    v482 = 1;
                    if (!*(_BYTE *)(v5 + 12))
                      goto LABEL_435;
                  }
                  if (gNRPacketLoggingEnabled)
                  {
                    v836 = v478;
                    v837 = _NRCopyLogObjectForNRUUID(*v999);
                    v838 = v837;
                    if (sNRCopyLogToStdErr)
                    {

                      v5 = v1004;
                    }
                    else
                    {
                      v899 = os_log_type_enabled(v837, OS_LOG_TYPE_INFO);

                      v5 = v1004;
                      v478 = v836;
                      if (!v899)
                        goto LABEL_435;
                    }
                    v900 = _NRCopyLogObjectForNRUUID(*v999);
                    _NRLogWithArgs((uint64_t)v900, 1, (uint64_t)"%s%.30s:%-4d sending packets over medium pipe", v901, v902, v903, v904, v905, (uint64_t)");

                    v478 = v836;
                  }
LABEL_435:
                  if (v481)
                  {
                    if ((v482 & 1) != 0)
                    {
                      v1011 = 0;
                      v483 = 0;
                      v484 = "Invalid";
                      v479 = 0x1ED368000;
                      goto LABEL_445;
                    }
                    v479 = 0x1ED368000uLL;
                    goto LABEL_444;
                  }
                  v479 = 0x1ED368000;
                  goto LABEL_442;
                }
                v471 = 0;
                v472 = 16;
                v473 = 464;
                v474 = 336;
                v475 = 272;
                v476 = 224;
                v477 = NRBluetoothPacketParserSuspendNexusBEInputSource;
              }
              v1000 = v477;
              v993 = *(_QWORD *)(v5 + v476);
              v1012 = *(_QWORD *)(v5 + v475);
              v478 = *(id *)(v5 + v474);
              v1009 = (_QWORD *)(v5 + v473);
              v1010 = (_BYTE *)(v5 + v472);
              goto LABEL_425;
            }
            v789 = nrCopyLogObj_506();
            v790 = v789;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v791 = os_log_type_enabled(v789, OS_LOG_TYPE_ERROR);

              if (!v791)
                goto LABEL_735;
            }
            v808 = nrCopyLogObj_506();
            _NRLogWithArgs((uint64_t)v808, 16, (uint64_t)"%s%.30s:%-4d ABORTING: strict_calloc(%zu, %zu) failed", v809, v810, v811, v812, v813, (uint64_t)");

LABEL_735:
            _os_log_pack_size();
            MEMORY[0x1E0C80A78]();
            __error();
            v814 = _os_log_pack_fill();
            __os_log_helper_1_2_3_8_34_8_0_8_0(v814, v468);
LABEL_620:
            v685 = nrCopyLogObj_506();
            _NRLogAbortWithPack(v685);
          }
          if (v401 == v393)
          {
            *(_DWORD *)(v390 + 16) = 0;
            goto LABEL_417;
          }
          -[NRBluetoothPacketParser handleInternalError:](v5, CFSTR("filledIn != moveOffset (%u != %llu)"), v394, v395, v396, v397, v398, v399, *(unsigned int *)(v390 + 16));
LABEL_398:

          goto LABEL_346;
        }
        v439 = _NRCopyLogObjectForNRUUID(*v6);
        v440 = v439;
        if (sNRCopyLogToStdErr)
        {

        }
        else
        {
          v441 = os_log_type_enabled(v439, OS_LOG_TYPE_ERROR);

          if (!v441)
            goto LABEL_398;
        }
        v432 = _NRCopyLogObjectForNRUUID(*v6);
        v433 = createStringFromNRLinkChannelPriority(v373);
        _NRLogWithArgs((uint64_t)v432, 16, (uint64_t)"%s%.30s:%-4d Invalid link-read context ptr for prio %@", v442, v443, v444, v445, v446, (uint64_t)");
LABEL_397:

        goto LABEL_398;
      }
LABEL_385:
      v429 = _NRCopyLogObjectForNRUUID(*v6);
      v430 = v429;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v431 = os_log_type_enabled(v429, OS_LOG_TYPE_ERROR);

        if (!v431)
          goto LABEL_398;
      }
      v432 = _NRCopyLogObjectForNRUUID(*v6);
      v433 = createStringFromNRLinkChannelPriority(v373);
      _NRLogWithArgs((uint64_t)v432, 16, (uint64_t)"%s%.30s:%-4d Invalid read context %sptr for prio %@", v434, v435, v436, v437, v438, (uint64_t)");
      goto LABEL_397;
    }
    v420 = _NRCopyLogObjectForNRUUID(*v6);
    v421 = v420;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v422 = os_log_type_enabled(v420, OS_LOG_TYPE_FAULT);

      if (!v422)
        goto LABEL_385;
    }
    v423 = _NRCopyLogObjectForNRUUID(*v6);
    _NRLogWithArgs((uint64_t)v423, 17, (uint64_t)"Invalid priority %d", v424, v425, v426, v427, v428, v373);

    goto LABEL_385;
  }
LABEL_355:

LABEL_356:
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("deactivate-datapath"));
  v382 = (void *)objc_claimAutoreleasedReturnValue();

  if (v382)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("deactivate-datapath"));
    v383 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v383, "objectForKeyedSubscript:", CFSTR("channel-id"));
    v384 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v384, "integerValue") == 2)
    {
      v385 = 2;
    }
    else if (objc_msgSend(v384, "integerValue") == 1)
    {
      v385 = 1;
    }
    else if (objc_msgSend(v384, "integerValue") == 3)
    {
      v385 = 3;
    }
    else
    {
      v385 = 0;
    }

    -[NRBluetoothPacketParser resetContextForPriorityInner:teardownContext:](v5, v385, 0);
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("teardown"));
  v405 = (void *)objc_claimAutoreleasedReturnValue();

  if (v405)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("teardown"));
    v344 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v344, "BOOLValue"))
      -[NRBluetoothPacketParser teardown](v5);
    goto LABEL_346;
  }
LABEL_347:

}

void __44__NRBluetoothPacketParser_armLinkStatsTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  os_log_t v17;
  os_log_t v18;
  os_log_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  os_log_t v27;
  os_log_t v28;
  _BOOL4 v29;
  os_log_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  os_log_t v36;
  os_log_t v37;
  _BOOL4 v38;
  os_log_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  id v52;
  uint64_t i;
  void *v54;
  uint64_t v55;
  void **v56;
  unsigned __int8 v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  unsigned int v61;
  os_log_t v62;
  int v63;
  os_log_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unsigned int v71;
  int v72;
  int v73;
  os_log_t v74;
  os_log_t v75;
  _BOOL4 v76;
  os_log_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  os_log_t v83;
  os_log_t v84;
  _BOOL4 v85;
  os_log_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  os_log_t v92;
  os_log_t v93;
  _BOOL4 v94;
  os_log_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  os_log_t v101;
  os_log_t v102;
  _BOOL4 v103;
  os_log_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  os_log_t v110;
  os_log_t v111;
  _BOOL4 v112;
  os_log_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  os_log_t v119;
  os_log_t v120;
  _BOOL4 v121;
  os_log_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  os_log_t v128;
  os_log_t v129;
  _BOOL4 v130;
  os_log_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  os_log_t v137;
  os_log_t v138;
  _BOOL4 v139;
  os_log_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  os_log_t v146;
  os_log_t v147;
  _BOOL4 v148;
  os_log_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  os_log_t v155;
  os_log_t v156;
  _BOOL4 v157;
  os_log_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  os_log_t v164;
  os_log_t v165;
  _BOOL4 v166;
  os_log_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  os_log_t v173;
  os_log_t v174;
  _BOOL4 v175;
  os_log_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  os_log_t v182;
  os_log_t v183;
  _BOOL4 v184;
  os_log_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  os_log_t v191;
  os_log_t v192;
  _BOOL4 v193;
  os_log_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  os_log_t v200;
  os_log_t v201;
  _BOOL4 v202;
  os_log_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  os_log_t v209;
  os_log_t v210;
  _BOOL4 v211;
  os_log_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  os_log_t v218;
  os_log_t v219;
  _BOOL4 v220;
  os_log_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  os_log_t v227;
  os_log_t v228;
  _BOOL4 v229;
  os_log_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  os_log_t v236;
  os_log_t v237;
  _BOOL4 v238;
  os_log_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  os_log_t v245;
  os_log_t v246;
  _BOOL4 v247;
  os_log_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  os_log_t v254;
  os_log_t v255;
  _BOOL4 v256;
  os_log_t v257;
  os_log_t v258;
  _BOOL4 v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  id v265;
  uint64_t v266;
  id v267;
  NSObject *v268;
  NSObject *v269;
  _BOOL4 v270;
  id v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  _BOOL4 v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  id v290;
  uint64_t v291;
  id v292;
  uint64_t v293;
  id v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  void **v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  _BYTE v304[128];
  uint64_t v305;

  v305 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *((_BYTE *)WeakRetained + 8) != 4)
  {
    v3 = *((_QWORD *)WeakRetained + 71);
    v4 = *((_QWORD *)WeakRetained + 76);
    *((_QWORD *)WeakRetained + 76) = v3;
    v5 = *((_QWORD *)WeakRetained + 70);
    v6 = *((_QWORD *)WeakRetained + 79);
    *((_QWORD *)WeakRetained + 79) = v5;
    v293 = *((_QWORD *)WeakRetained + 77);
    v280 = *((_QWORD *)WeakRetained + 75);
    *((_QWORD *)WeakRetained + 77) = v280;
    v289 = *((_QWORD *)WeakRetained + 80);
    v291 = *((_QWORD *)WeakRetained + 74);
    *((_QWORD *)WeakRetained + 80) = v291;
    v283 = *((_QWORD *)WeakRetained + 78);
    v284 = *((_QWORD *)WeakRetained + 73);
    *((_QWORD *)WeakRetained + 78) = v284;
    v281 = *((_QWORD *)WeakRetained + 81);
    v282 = *((_QWORD *)WeakRetained + 72);
    *((_QWORD *)WeakRetained + 81) = v282;
    v7 = *((_QWORD *)WeakRetained + 66);
    v8 = *((_QWORD *)WeakRetained + 58);
    v9 = *((_QWORD *)WeakRetained + 59);
    *((_QWORD *)WeakRetained + 66) = v8;
    v10 = *((_QWORD *)WeakRetained + 67);
    *((_QWORD *)WeakRetained + 67) = v9;
    v11 = *((_QWORD *)WeakRetained + 68);
    v13 = *((_QWORD *)WeakRetained + 60);
    v12 = *((_QWORD *)WeakRetained + 61);
    *((_QWORD *)WeakRetained + 68) = v13;
    v14 = *((_QWORD *)WeakRetained + 69);
    *((_QWORD *)WeakRetained + 69) = v12;
    v15 = *((_QWORD *)WeakRetained + 54);
    v16 = *((_QWORD *)WeakRetained + 62);
    v295 = *((_QWORD *)WeakRetained + 63);
    v297 = *((_QWORD *)WeakRetained + 55);
    *((_QWORD *)WeakRetained + 62) = v15;
    *((_QWORD *)WeakRetained + 63) = v297;
    v288 = *((_QWORD *)WeakRetained + 64);
    v286 = *((_QWORD *)WeakRetained + 57);
    v287 = *((_QWORD *)WeakRetained + 56);
    *((_QWORD *)WeakRetained + 64) = v287;
    v285 = *((_QWORD *)WeakRetained + 65);
    *((_QWORD *)WeakRetained + 65) = v286;
    v299 = (void **)WeakRetained;
    if (v3 != v4 || v5 != v6 || v8 != v7 || v13 != v11 || v9 != v10 || v12 != v14)
    {
      v278 = v16;
      v17 = _NRCopyLogObjectForNRUUID(*((void **)WeakRetained + 5));
      v18 = v17;
      if (sNRCopyLogToStdErr)
      {

        WeakRetained = v299;
LABEL_12:
        v19 = _NRCopyLogObjectForNRUUID(*((void **)WeakRetained + 5));
        _NRLogWithArgs((uint64_t)v19, 0, (uint64_t)"LinkStats - BT(M): Tx [ be %4llu, bk %4llu, %8llu B, %8llu B/s ] Rx [ be %4llu, bk %4llu, %8llu B, %8llu B/s ]", v20, v21, v22, v23, v24, v8 - v7);

        v16 = v278;
        WeakRetained = v299;
        goto LABEL_13;
      }
      v277 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

      WeakRetained = v299;
      v16 = v278;
      if (v277)
        goto LABEL_12;
    }
LABEL_13:
    v279 = v15 - v16;
    v26 = v295;
    v25 = v297;
    if (v280 != v293 || v291 != v289 || v287 != v288 || v15 != v16 || v286 != v285 || v297 != v295)
    {
      v27 = _NRCopyLogObjectForNRUUID(*((void **)WeakRetained + 5));
      v28 = v27;
      if (sNRCopyLogToStdErr)
      {

        WeakRetained = v299;
LABEL_22:
        v30 = _NRCopyLogObjectForNRUUID(*((void **)WeakRetained + 5));
        v26 = v295;
        v25 = v297;
        _NRLogWithArgs((uint64_t)v30, 0, (uint64_t)"LinkStats - BT(U): Tx [ vo %4llu, vi %4llu, %8llu B, %8llu B/s ] Rx [ vo %4llu, vi %4llu, %8llu B, %8llu B/s ]", v31, v32, v33, v34, v35, v279);

        WeakRetained = v299;
        goto LABEL_23;
      }
      v29 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);

      WeakRetained = v299;
      if (v29)
        goto LABEL_22;
    }
LABEL_23:
    if (v284 != v283 || v282 != v281 || v25 != v26)
    {
      v36 = _NRCopyLogObjectForNRUUID(*((void **)WeakRetained + 5));
      v37 = v36;
      if (sNRCopyLogToStdErr)
      {

        WeakRetained = v299;
      }
      else
      {
        v38 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);

        WeakRetained = v299;
        if (!v38)
          goto LABEL_30;
      }
      v39 = _NRCopyLogObjectForNRUUID(*((void **)WeakRetained + 5));
      _NRLogWithArgs((uint64_t)v39, 0, (uint64_t)"LinkStats - BT(D): Tx [ vo %4llu, %8llu B, %8llu B/s ] Rx [ vo %4llu, %8llu B, %8llu B/s ]", v40, v41, v42, v43, v44, v279);

      WeakRetained = v299;
    }
LABEL_30:
    *((_BYTE *)WeakRetained + 19) = *((_BYTE *)WeakRetained + 18);
    v45 = (void *)*((_QWORD *)WeakRetained + 24);
    if (*(_QWORD *)(a1 + 40) * (_QWORD)v45 < 0xFuLL)
    {
LABEL_187:
      *((_QWORD *)WeakRetained + 24) = (char *)v45 + 1;
      goto LABEL_188;
    }
    v46 = (void *)*((_QWORD *)WeakRetained + 17);
    if ((v46 & 1) != 0)
    {
      v47 = *((_QWORD *)WeakRetained + 19);
      if (!v47)
      {
LABEL_36:
        v48 = 0;
        goto LABEL_37;
      }
      if (v47 == *((_QWORD *)WeakRetained + 18))
      {
        v48 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v48, "addObject:", &unk_1EA400E40);
        WeakRetained = v299;
        v46 = v299[17];
        LODWORD(v47) = 1;
LABEL_37:
        *((_QWORD *)WeakRetained + 19) = *((_QWORD *)WeakRetained + 18);
        if ((v46 & 2) != 0)
        {
          v49 = *((_QWORD *)WeakRetained + 21);
          if (v49)
          {
            if (v49 == *((_QWORD *)WeakRetained + 20))
            {
              if (!v48)
                v48 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend(v48, "addObject:", &unk_1EA400E58);
              WeakRetained = v299;
              v46 = v299[17];
              LODWORD(v47) = 1;
            }
          }
        }
        *((_QWORD *)WeakRetained + 21) = *((_QWORD *)WeakRetained + 20);
        if ((v46 & 4) != 0
          && (v50 = *((_QWORD *)WeakRetained + 23)) != 0
          && v50 == *((_QWORD *)WeakRetained + 22))
        {
          if (!v48)
            v48 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v48, "addObject:", &unk_1EA400E70);
          v299[23] = v299[22];
          v299[24] = 0;
        }
        else
        {
          *((_QWORD *)WeakRetained + 23) = *((_QWORD *)WeakRetained + 22);
          *((_QWORD *)WeakRetained + 24) = 0;
          if (!(_DWORD)v47)
            goto LABEL_185;
        }
        v48 = v48;
        if (*((_BYTE *)v299 + 8) != 4)
        {
          if (v48)
          {
            v51 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v300 = 0u;
            v301 = 0u;
            v302 = 0u;
            v303 = 0u;
            v290 = v48;
            v52 = v48;
            v298 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v300, v304, 16);
            if (v298)
            {
              v294 = v51;
              v296 = *(_QWORD *)v301;
              v292 = v52;
              do
              {
                for (i = 0; i != v298; ++i)
                {
                  if (*(_QWORD *)v301 != v296)
                    objc_enumerationMutation(v52);
                  v55 = objc_msgSend(*(id *)(*((_QWORD *)&v300 + 1) + 8 * i), "unsignedCharValue");
                  v56 = v299;
                  if (*((_BYTE *)v299 + 8) == 4)
                  {
                    v57 = v55 - 1;
                  }
                  else
                  {
                    v57 = v55 - 1;
                    if ((v55 - 1) < 3)
                    {
                      v58 = (v55 - 1);
                      v59 = v299[2 * v57 + 12];
                      if (!v59)
                        goto LABEL_56;
                      v60 = v59[3];
                      if (!v60)
                        goto LABEL_56;
                      v61 = 0;
                      v62 = (os_log_t)off_1EA3F7088[v58];
                      v63 = *(unsigned __int8 *)(v60 + 82);
                      while (2)
                      {
                        v71 = (((117 * v63) >> 8)
                             + (((v63 - ((unsigned __int16)(117 * v63) >> 8)) & 0xFE) >> 1)) >> 3;
                        v72 = v63 - 11 * v71;
                        v73 = *(_DWORD *)(v60 + 4 * (v63 - 11 * v71) + 36);
                        if (v73)
                        {
                          v74 = _NRCopyLogObjectForNRUUID(v56[5]);
                          v75 = v74;
                          if (sNRCopyLogToStdErr)
                          {

                            goto LABEL_73;
                          }
                          v76 = os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT);

                          if (v76)
                          {
LABEL_73:
                            v77 = _NRCopyLogObjectForNRUUID(v299[5]);
                            _NRLogWithArgs((uint64_t)v77, 0, (uint64_t)"LinkStats : %@ -----------------------------------", v78, v79, v80, v81, v82, (uint64_t)v62);

                          }
                          v56 = v299;
                          if ((v73 & 1) != 0)
                          {
                            v83 = _NRCopyLogObjectForNRUUID(v299[5]);
                            v84 = v83;
                            if (sNRCopyLogToStdErr)
                            {

                              v56 = v299;
                              goto LABEL_78;
                            }
                            v85 = os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT);

                            v56 = v299;
                            if (v85)
                            {
LABEL_78:
                              v86 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v86, 0, (uint64_t)"LinkStats : %@ NtL - StartNtL", v87, v88, v89, v90, v91, (uint64_t)v62);

                              v56 = v299;
                            }
                          }
                          if ((v73 & 2) != 0)
                          {
                            v92 = _NRCopyLogObjectForNRUUID(v56[5]);
                            v93 = v92;
                            if (sNRCopyLogToStdErr)
                            {

                              v56 = v299;
                              goto LABEL_83;
                            }
                            v94 = os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT);

                            v56 = v299;
                            if (v94)
                            {
LABEL_83:
                              v95 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v95, 0, (uint64_t)"LinkStats : %@ NtL - WaitForLinkOutput", v96, v97, v98, v99, v100, (uint64_t)v62);

                              v56 = v299;
                            }
                          }
                          if ((v73 & 4) != 0)
                          {
                            v101 = _NRCopyLogObjectForNRUUID(v56[5]);
                            v102 = v101;
                            if (sNRCopyLogToStdErr)
                            {

                              v56 = v299;
                              goto LABEL_88;
                            }
                            v103 = os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT);

                            v56 = v299;
                            if (v103)
                            {
LABEL_88:
                              v104 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v104, 0, (uint64_t)"LinkStats : %@ NtL - WriteContextInvalid", v105, v106, v107, v108, v109, (uint64_t)v62);

                              v56 = v299;
                            }
                          }
                          if ((v73 & 8) != 0)
                          {
                            v110 = _NRCopyLogObjectForNRUUID(v56[5]);
                            v111 = v110;
                            if (sNRCopyLogToStdErr)
                            {

                              v56 = v299;
                              goto LABEL_93;
                            }
                            v112 = os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT);

                            v56 = v299;
                            if (v112)
                            {
LABEL_93:
                              v113 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v113, 0, (uint64_t)"LinkStats : %@ NtL - StartNtLOuter", v114, v115, v116, v117, v118, (uint64_t)v62);

                              v56 = v299;
                            }
                          }
                          if ((v73 & 0x10) != 0)
                          {
                            v119 = _NRCopyLogObjectForNRUUID(v56[5]);
                            v120 = v119;
                            if (sNRCopyLogToStdErr)
                            {

                              v56 = v299;
                              goto LABEL_98;
                            }
                            v121 = os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT);

                            v56 = v299;
                            if (v121)
                            {
LABEL_98:
                              v122 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v122, 0, (uint64_t)"LinkStats : %@ NtL - StartNtLInner", v123, v124, v125, v126, v127, (uint64_t)v62);

                              v56 = v299;
                            }
                          }
                          if ((v73 & 0x20) != 0)
                          {
                            v128 = _NRCopyLogObjectForNRUUID(v56[5]);
                            v129 = v128;
                            if (sNRCopyLogToStdErr)
                            {

                              v56 = v299;
                              goto LABEL_103;
                            }
                            v130 = os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT);

                            v56 = v299;
                            if (v130)
                            {
LABEL_103:
                              v131 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v131, 0, (uint64_t)"LinkStats : %@ NtL - WroteBytesLWB", v132, v133, v134, v135, v136, (uint64_t)v62);

                              v56 = v299;
                            }
                          }
                          if ((v73 & 0x40) != 0)
                          {
                            v137 = _NRCopyLogObjectForNRUUID(v56[5]);
                            v138 = v137;
                            if (sNRCopyLogToStdErr)
                            {

                              v56 = v299;
                              goto LABEL_108;
                            }
                            v139 = os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT);

                            v56 = v299;
                            if (v139)
                            {
LABEL_108:
                              v140 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v140, 0, (uint64_t)"LinkStats : %@ NtL - NotEnoughRoomForMaxTLVLen", v141, v142, v143, v144, v145, (uint64_t)v62);

                              v56 = v299;
                            }
                          }
                          if ((v73 & 0x80) != 0)
                          {
                            v146 = _NRCopyLogObjectForNRUUID(v56[5]);
                            v147 = v146;
                            if (sNRCopyLogToStdErr)
                            {

                              v56 = v299;
                              goto LABEL_113;
                            }
                            v148 = os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT);

                            v56 = v299;
                            if (v148)
                            {
LABEL_113:
                              v149 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v149, 0, (uint64_t)"LinkStats : %@ NtL - WroteBytesSlot", v150, v151, v152, v153, v154, (uint64_t)v62);

                              v56 = v299;
                            }
                          }
                          if ((v73 & 0x100) != 0)
                          {
                            v155 = _NRCopyLogObjectForNRUUID(v56[5]);
                            v156 = v155;
                            if (sNRCopyLogToStdErr)
                            {

                              v56 = v299;
                              goto LABEL_118;
                            }
                            v157 = os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT);

                            v56 = v299;
                            if (v157)
                            {
LABEL_118:
                              v158 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v158, 0, (uint64_t)"LinkStats : %@ NtL - WroteBytesBuflet", v159, v160, v161, v162, v163, (uint64_t)v62);

                              v56 = v299;
                            }
                          }
                          if ((v73 & 0x200) != 0)
                          {
                            v164 = _NRCopyLogObjectForNRUUID(v56[5]);
                            v165 = v164;
                            if (sNRCopyLogToStdErr)
                            {

                              v56 = v299;
                              goto LABEL_123;
                            }
                            v166 = os_log_type_enabled(v164, OS_LOG_TYPE_DEFAULT);

                            v56 = v299;
                            if (v166)
                            {
LABEL_123:
                              v167 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v167, 0, (uint64_t)"LinkStats : %@ NtL - NoDataToWrite", v168, v169, v170, v171, v172, (uint64_t)v62);

                              v56 = v299;
                            }
                          }
                          if ((v73 & 0x400) != 0)
                          {
                            v173 = _NRCopyLogObjectForNRUUID(v56[5]);
                            v174 = v173;
                            if (sNRCopyLogToStdErr)
                            {

                              v56 = v299;
                              goto LABEL_128;
                            }
                            v175 = os_log_type_enabled(v173, OS_LOG_TYPE_DEFAULT);

                            v56 = v299;
                            if (v175)
                            {
LABEL_128:
                              v176 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v176, 0, (uint64_t)"LinkStats : %@ NtL - NoDataFromNexus", v177, v178, v179, v180, v181, (uint64_t)v62);

                              v56 = v299;
                            }
                          }
                          if ((v73 & 0x800) != 0)
                          {
                            v182 = _NRCopyLogObjectForNRUUID(v56[5]);
                            v183 = v182;
                            if (sNRCopyLogToStdErr)
                            {

                              v56 = v299;
                              goto LABEL_133;
                            }
                            v184 = os_log_type_enabled(v182, OS_LOG_TYPE_DEFAULT);

                            v56 = v299;
                            if (v184)
                            {
LABEL_133:
                              v185 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v185, 0, (uint64_t)"LinkStats : %@ NtL - InvokeSendCallback", v186, v187, v188, v189, v190, (uint64_t)v62);

                              v56 = v299;
                            }
                          }
                          if ((v73 & 0x1000) != 0)
                          {
                            v191 = _NRCopyLogObjectForNRUUID(v56[5]);
                            v192 = v191;
                            if (sNRCopyLogToStdErr)
                            {

                              v56 = v299;
                              goto LABEL_138;
                            }
                            v193 = os_log_type_enabled(v191, OS_LOG_TYPE_DEFAULT);

                            v56 = v299;
                            if (v193)
                            {
LABEL_138:
                              v194 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v194, 0, (uint64_t)"LinkStats : %@ NtL - NoOutputSpace", v195, v196, v197, v198, v199, (uint64_t)v62);

                              v56 = v299;
                            }
                          }
                          if ((v73 & 0x2000) != 0)
                          {
                            v200 = _NRCopyLogObjectForNRUUID(v56[5]);
                            v201 = v200;
                            if (sNRCopyLogToStdErr)
                            {

                              v56 = v299;
                              goto LABEL_143;
                            }
                            v202 = os_log_type_enabled(v200, OS_LOG_TYPE_DEFAULT);

                            v56 = v299;
                            if (v202)
                            {
LABEL_143:
                              v203 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v203, 0, (uint64_t)"LinkStats : %@ NtL - MemmovingLWB", v204, v205, v206, v207, v208, (uint64_t)v62);

                              v56 = v299;
                            }
                          }
                          if ((v73 & 0x4000) != 0)
                          {
                            v209 = _NRCopyLogObjectForNRUUID(v56[5]);
                            v210 = v209;
                            if (sNRCopyLogToStdErr)
                            {

                              v56 = v299;
                              goto LABEL_148;
                            }
                            v211 = os_log_type_enabled(v209, OS_LOG_TYPE_DEFAULT);

                            v56 = v299;
                            if (v211)
                            {
LABEL_148:
                              v212 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v212, 0, (uint64_t)"LinkStats : %@ NtL - NotMemmovingLWB", v213, v214, v215, v216, v217, (uint64_t)v62);

                              v56 = v299;
                            }
                          }
                          if ((v73 & 0x8000) != 0)
                          {
                            v218 = _NRCopyLogObjectForNRUUID(v56[5]);
                            v219 = v218;
                            if (sNRCopyLogToStdErr)
                            {

                              v56 = v299;
                              goto LABEL_153;
                            }
                            v220 = os_log_type_enabled(v218, OS_LOG_TYPE_DEFAULT);

                            v56 = v299;
                            if (v220)
                            {
LABEL_153:
                              v221 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v221, 0, (uint64_t)"LinkStats : %@ NtL - EndNtLInner", v222, v223, v224, v225, v226, (uint64_t)v62);

                              v56 = v299;
                            }
                          }
                          if ((v73 & 0x10000) != 0)
                          {
                            v227 = _NRCopyLogObjectForNRUUID(v56[5]);
                            v228 = v227;
                            if (sNRCopyLogToStdErr)
                            {

                              v56 = v299;
                              goto LABEL_158;
                            }
                            v229 = os_log_type_enabled(v227, OS_LOG_TYPE_DEFAULT);

                            v56 = v299;
                            if (v229)
                            {
LABEL_158:
                              v230 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v230, 0, (uint64_t)"LinkStats : %@ NtL - RxSync", v231, v232, v233, v234, v235, (uint64_t)v62);

                              v56 = v299;
                            }
                          }
                          if ((v73 & 0x20000) != 0)
                          {
                            v236 = _NRCopyLogObjectForNRUUID(v56[5]);
                            v237 = v236;
                            if (sNRCopyLogToStdErr)
                            {

                              v56 = v299;
                              goto LABEL_163;
                            }
                            v238 = os_log_type_enabled(v236, OS_LOG_TYPE_DEFAULT);

                            v56 = v299;
                            if (v238)
                            {
LABEL_163:
                              v239 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v239, 0, (uint64_t)"LinkStats : %@ NtL - EndNtLOuter", v240, v241, v242, v243, v244, (uint64_t)v62);

                              v56 = v299;
                            }
                          }
                          if ((v73 & 0x40000) != 0)
                          {
                            v245 = _NRCopyLogObjectForNRUUID(v56[5]);
                            v246 = v245;
                            if (sNRCopyLogToStdErr)
                            {

                              v56 = v299;
                              goto LABEL_168;
                            }
                            v247 = os_log_type_enabled(v245, OS_LOG_TYPE_DEFAULT);

                            v56 = v299;
                            if (v247)
                            {
LABEL_168:
                              v248 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v248, 0, (uint64_t)"LinkStats : %@ NtL - FinishNtL", v249, v250, v251, v252, v253, (uint64_t)v62);

                              v56 = v299;
                            }
                          }
                          if ((v73 & 0x80000) != 0)
                          {
                            v254 = _NRCopyLogObjectForNRUUID(v56[5]);
                            v255 = v254;
                            if (sNRCopyLogToStdErr)
                            {

                              v56 = v299;
                            }
                            else
                            {
                              v256 = os_log_type_enabled(v254, OS_LOG_TYPE_DEFAULT);

                              v56 = v299;
                              if (!v256)
                                goto LABEL_68;
                            }
                            v64 = _NRCopyLogObjectForNRUUID(v56[5]);
                            _NRLogWithArgs((uint64_t)v64, 0, (uint64_t)"LinkStats : %@ NtL - LinkOutputAvailable", v65, v66, v67, v68, v69, (uint64_t)v62);

                            v56 = v299;
                          }
                        }
LABEL_68:
                        v63 = v72 + 1;
                        if (v61++ >= 0xA)
                        {
                          v52 = v292;
                          v51 = v294;
                          goto LABEL_178;
                        }
                        continue;
                      }
                    }
                    v257 = _NRCopyLogObjectForNRUUID(v299[5]);
                    v258 = v257;
                    if (sNRCopyLogToStdErr)
                    {

                    }
                    else
                    {
                      v259 = os_log_type_enabled(v257, OS_LOG_TYPE_FAULT);

                      v54 = &unk_1EA400ED0;
                      if (!v259)
                        goto LABEL_57;
                    }
                    v62 = _NRCopyLogObjectForNRUUID(v299[5]);
                    _NRLogWithArgs((uint64_t)v62, 17, (uint64_t)"Invalid priority %d", v260, v261, v262, v263, v264, v55);
LABEL_178:

                  }
                  v54 = &unk_1EA400ED0;
                  if (v57 <= 2u)
                  {
                    v58 = v57;
LABEL_56:
                    v54 = (void *)qword_1EA3F70C0[v58];
                  }
LABEL_57:
                  objc_msgSend(v51, "addObject:", v54);
                }
                v298 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v300, v304, 16);
              }
              while (v298);
            }

            v265 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend(v265, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("datapath-report-stall"));
            objc_msgSend(v265, "setObject:forKeyedSubscript:", v51, CFSTR("channel-id-list"));
            -[NRBluetoothPacketParser sendDatapathReport:]((uint64_t)v299, v265);

            v48 = v290;
            goto LABEL_182;
          }
          v268 = nrCopyLogObj_506();
          v269 = v268;
          if (sNRCopyLogToStdErr)
          {

LABEL_192:
            v271 = nrCopyLogObj_506();
            _NRLogWithArgs((uint64_t)v271, 17, (uint64_t)"%s called with null linkChannelPriorityArray", v272, v273, v274, v275, v276, (uint64_t)"-[NRBluetoothPacketParser reportDataStall:]");

            goto LABEL_182;
          }
          v270 = os_log_type_enabled(v268, OS_LOG_TYPE_FAULT);

          if (v270)
            goto LABEL_192;
        }
LABEL_182:

        WeakRetained = v299;
        v266 = (uint64_t)v299[25] + 1;
        v299[25] = (void *)v266;
        if ((unint64_t)(15 * v266) < 0xB4)
        {
LABEL_186:

          WeakRetained = v299;
          v45 = v299[24];
          goto LABEL_187;
        }
        if (*((_BYTE *)v299 + 8) != 4)
        {
          v267 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v267, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("datapath-report-remediate"));
          -[NRBluetoothPacketParser sendDatapathReport:]((uint64_t)v299, v267);

          WeakRetained = v299;
        }
LABEL_185:
        *((_QWORD *)WeakRetained + 25) = 0;
        goto LABEL_186;
      }
    }
    LODWORD(v47) = 0;
    goto LABEL_36;
  }
LABEL_188:

}

- (void)sendDatapathReport:(uint64_t)a1
{
  os_log_t v3;
  os_log_t v4;
  _BOOL4 v5;
  os_log_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;

  v13 = a2;
  v3 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
  v4 = v3;
  if (sNRCopyLogToStdErr)
  {

LABEL_4:
    v6 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v6, 0, (uint64_t)"%s%.30s:%-4d sending datapath report: %@", v7, v8, v9, v10, v11, (uint64_t)");

    goto LABEL_5;
  }
  v5 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v5)
    goto LABEL_4;
LABEL_5:
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("datapath-report"));
  objc_msgSend(*(id *)(a1 + 400), "sendXPCCommDictionary:", v12);

}

- (void)updateReadyStateIfApplicable
{
  if (*(_BYTE *)(a1 + 8) != 3 && objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    if (*(_BYTE *)(a1 + 10))
      -[NRBluetoothPacketParser changeStateTo:](a1, 3u);
  }
}

- (void)setupNexusChannelForPriority:(void *)a3 channelUUID:
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t extended;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int fd;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uintptr_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  unsigned __int8 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __CFString *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  NSObject *v51;
  _QWORD block[5];
  _QWORD v53[4];
  NSObject *v54;
  _QWORD v55[5];
  char v56;
  _QWORD v57[4];
  NSObject *v58;
  _QWORD handler[5];
  char v60;
  _QWORD v61[4];

  v61[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!os_channel_attr_create())
  {
    v46 = CFSTR("os_channel_attr_create() failed");
LABEL_16:
    -[NRBluetoothPacketParser handleInternalError:](a1, v46, v6, v7, v8, v9, v10, v11, v47);
    goto LABEL_17;
  }
  os_channel_attr_set();
  v61[0] = 0;
  v61[1] = 0;
  objc_msgSend(v5, "getUUIDBytes:", v61);
  extended = os_channel_create_extended();
  if (!extended)
  {
    v46 = CFSTR("os_channel_create_extended() failed");
    goto LABEL_16;
  }
  v13 = extended;
  os_channel_attr_destroy();
  os_channel_ring_id();
  v14 = os_channel_rx_ring();
  if (!v14)
  {
    v46 = CFSTR("os_channel_rx_ring() failed");
    goto LABEL_16;
  }
  v15 = v14;
  os_channel_ring_id();
  v16 = os_channel_tx_ring();
  if (!v16)
  {
    v46 = CFSTR("os_channel_tx_ring() failed");
    goto LABEL_16;
  }
  v17 = v16;
  fd = os_channel_get_fd();
  if ((fd & 0x80000000) != 0)
  {
    v46 = CFSTR("os_channel_get_fd() failed");
    goto LABEL_16;
  }
  v19 = fd;
  v26 = dispatch_group_create();
  if (v26)
  {
    v27 = v19;
    v28 = dispatch_source_create(MEMORY[0x1E0C80DB8], v19, 0, *(dispatch_queue_t *)(a1 + 56));
    v29 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __68__NRBluetoothPacketParser_setupNexusChannelForPriority_channelUUID___block_invoke;
    handler[3] = &unk_1EA3F6FD0;
    handler[4] = a1;
    v60 = a2;
    dispatch_source_set_event_handler(v28, handler);
    dispatch_group_enter(v26);
    v57[0] = v29;
    v57[1] = 3221225472;
    v57[2] = __68__NRBluetoothPacketParser_setupNexusChannelForPriority_channelUUID___block_invoke_2;
    v57[3] = &unk_1EA3F72A0;
    v30 = v26;
    v58 = v30;
    dispatch_source_set_cancel_handler(v28, v57);
    dispatch_activate(v28);
    v31 = dispatch_source_create(MEMORY[0x1E0C80DF0], v27, 0, *(dispatch_queue_t *)(a1 + 56));
    v38 = v31;
    if (v31)
    {
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __68__NRBluetoothPacketParser_setupNexusChannelForPriority_channelUUID___block_invoke_3;
      v55[3] = &unk_1EA3F6FD0;
      v55[4] = a1;
      v56 = a2;
      dispatch_source_set_event_handler(v31, v55);
      dispatch_group_enter(v30);
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __68__NRBluetoothPacketParser_setupNexusChannelForPriority_channelUUID___block_invoke_4;
      v53[3] = &unk_1EA3F72A0;
      v39 = v30;
      v54 = v39;
      dispatch_source_set_cancel_handler(v38, v53);
      v40 = *(NSObject **)(a1 + 56);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __68__NRBluetoothPacketParser_setupNexusChannelForPriority_channelUUID___block_invoke_5;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = v13;
      dispatch_group_notify(v39, v40, block);
      v51 = v28;
      v50 = v38;
      v41 = v39;
      v42 = a2 - 100;
      if ((a2 - 100) <= 3u)
      {
        v43 = 8 * (char)(a2 - 100);
        v48 = *(_QWORD *)((char *)&unk_1DBDAAED8 + v43);
        v49 = *(_QWORD *)((char *)&unk_1DBDAAEB8 + v43);
        v44 = a1 + 8 * (a2 - 100);
        *(_QWORD *)(v44 + 208) = v13;
        v45 = a1 + 16 * v42;
        *(_QWORD *)(v45 + 240) = v15;
        *(_QWORD *)(v45 + 248) = v17;
        objc_storeStrong((id *)(v45 + 304), v28);
        objc_storeStrong((id *)(v45 + 312), v38);
        objc_storeStrong((id *)(v44 + 368), v26);
        *(_QWORD *)(a1 + 136) = *(_QWORD *)(a1 + 136) & v49 | v48;
      }

    }
    else
    {
      -[NRBluetoothPacketParser handleInternalError:](a1, CFSTR("invalid output dispatch source (prio %u)"), v32, v33, v34, v35, v36, v37, a2);
    }

  }
  else
  {
    -[NRBluetoothPacketParser handleInternalError:](a1, CFSTR("invalid nexus group (prio %u)"), v20, v21, v22, v23, v24, v25, a2);
  }

LABEL_17:
}

void __68__NRBluetoothPacketParser_setupNexusChannelForPriority_channelUUID___block_invoke(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD *v14;
  char v15;
  _QWORD *v16;
  int v17;
  const char *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  int v28;
  os_log_t v29;
  os_log_t v30;
  _BOOL4 v31;
  os_log_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t next_slot;
  uint64_t v39;
  os_log_t v40;
  os_log_t v41;
  _BOOL4 v42;
  os_log_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  unsigned int v51;
  uint64_t v52;
  size_t v53;
  unsigned int v54;
  unsigned int v55;
  int v56;
  uint64_t v57;
  unsigned int v58;
  unsigned int data_offset;
  uint64_t object_address;
  unsigned int data_length;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unsigned __int16 v67;
  int v68;
  unsigned __int8 *v69;
  uint64_t v70;
  unsigned int v71;
  unsigned int v72;
  os_log_t v73;
  os_log_t v74;
  os_log_t v75;
  os_log_t v76;
  NSObject *v77;
  NSObject *v78;
  _BOOL4 v79;
  os_log_t v80;
  uint64_t v81;
  unsigned int v82;
  uint64_t v83;
  unsigned int v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  _BOOL4 v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  os_log_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  int v102;
  _BOOL4 v103;
  char v104;
  int v105;
  unint64_t v106;
  os_log_t v107;
  os_log_t v108;
  uint64_t v109;
  os_log_t v110;
  os_log_t v111;
  os_log_t v112;
  os_log_t v113;
  os_log_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t v120;
  unsigned int v121;
  unsigned int v122;
  os_log_t v123;
  os_log_t v124;
  os_log_t v125;
  os_log_t v126;
  os_log_t v127;
  os_log_t v128;
  _BOOL4 v129;
  os_log_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  os_log_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  os_log_t v142;
  os_log_t v143;
  os_log_t v144;
  os_log_t v145;
  os_log_t v146;
  os_log_t v147;
  os_log_t v148;
  os_log_t v149;
  os_log_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  _BOOL4 v156;
  os_log_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  os_log_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  os_log_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  os_log_t v175;
  os_log_t v176;
  _BOOL4 v177;
  os_log_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  _BOOL4 v199;
  int v200;
  os_log_t v201;
  os_log_t v202;
  _BOOL4 v203;
  os_log_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  unsigned int v210;
  unsigned int v211;
  os_log_t v212;
  os_log_t v213;
  os_log_t v214;
  os_log_t v215;
  _BOOL4 v216;
  os_log_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  _BOOL4 v223;
  os_log_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  unsigned int v230;
  uint64_t v231;
  id v232;
  BOOL v233;
  uint64_t v234;
  uint64_t v235;
  dispatch_object_t *v236;
  os_log_t v237;
  os_log_t v238;
  os_log_t v239;
  os_log_t v240;
  uint64_t v241;
  uint64_t v242;
  os_log_t v243;
  os_log_t v244;
  unsigned int v245;
  unsigned int v246;
  os_log_t v247;
  os_log_t v248;
  os_log_t v249;
  os_log_t v250;
  _BOOL4 v251;
  os_log_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  os_log_t v258;
  os_log_t v259;
  _BOOL4 v260;
  os_log_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  _BOOL4 v267;
  os_log_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  _BOOL4 v274;
  os_log_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  os_log_t v281;
  os_log_t v282;
  os_log_t v283;
  os_log_t v284;
  uint64_t v285;
  os_log_t v286;
  os_log_t v287;
  _BOOL4 v288;
  os_log_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  _BOOL4 v295;
  os_log_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  _BOOL4 v302;
  os_log_t v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  os_log_t v309;
  os_log_t v310;
  os_log_t v311;
  os_log_t v312;
  os_log_t v313;
  os_log_t v314;
  os_log_t v315;
  os_log_t v316;
  os_log_t v317;
  os_log_t v318;
  _BOOL4 v319;
  os_log_t v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  _BOOL4 v326;
  os_log_t v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  _BOOL4 v333;
  os_log_t v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  _BOOL4 v340;
  os_log_t v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  _BOOL4 v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  _BOOL4 v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  _BOOL4 v359;
  os_log_t v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  os_log_t v366;
  os_log_t v367;
  _BOOL4 v368;
  os_log_t v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  __CFString *StringForNRNexusChannelPriority;
  int v376;
  id v377;
  uint64_t v378;
  char *v379;
  void (*v380)(uint64_t);
  os_log_t v381;
  _BOOL4 v382;
  _BOOL4 v383;
  _BOOL4 v384;
  _BOOL4 v385;
  _BOOL4 v386;
  _BOOL4 v387;
  _BOOL4 v388;
  _BOOL4 v389;
  uint64_t v390;
  int v391;
  _QWORD **v392;
  uint64_t v393;
  unsigned __int8 v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  _QWORD *v398;
  _BYTE *v399;
  char v400;
  unint64_t v401;
  uint64_t v402;
  __int128 v403;
  __int128 v404;
  __int128 v405;
  __int128 v406;
  uint64_t v407;

  v1 = a1;
  v407 = *MEMORY[0x1E0C80C00];
  v2 = 0x1ED368000uLL;
  if (gNRPacketLoggingEnabled)
  {
    v247 = _NRCopyLogObjectForNRUUID(*(void **)(*(_QWORD *)(a1 + 32) + 40));
    v248 = v247;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v251 = os_log_type_enabled(v247, OS_LOG_TYPE_INFO);

      v2 = 0x1ED368000;
      if (!v251)
        goto LABEL_2;
    }
    v252 = _NRCopyLogObjectForNRUUID(*(void **)(*(_QWORD *)(v1 + 32) + 40));
    StringForNRNexusChannelPriority = (__CFString *)createStringForNRNexusChannelPriority(*(unsigned __int8 *)(v1 + 40));
    _NRLogWithArgs((uint64_t)v252, 1, (uint64_t)"%s%.30s:%-4d Nexus input available - %@", v253, v254, v255, v256, v257, (uint64_t)");

    v2 = 0x1ED368000;
  }
LABEL_2:
  *(_BYTE *)(*(_QWORD *)(v1 + 32) + 12) = 1;
  v3 = *(_QWORD *)(v1 + 32);
  if (*(_BYTE *)(v3 + 8) == 4)
    goto LABEL_268;
  v4 = *(unsigned __int8 *)(v1 + 40);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
  switch(v4)
  {
    case 'd':
      v5 = 1;
      v6 = 14;
      v7 = 432;
      v8 = 304;
      v9 = 240;
      v10 = NRBluetoothPacketParserSuspendNexusVOInputSource;
      break;
    case 'e':
      v5 = 1;
      v6 = 15;
      v7 = 448;
      v8 = 320;
      v9 = 256;
      v10 = NRBluetoothPacketParserSuspendNexusVIInputSource;
      break;
    case 'g':
      v5 = 0;
      v6 = 17;
      v7 = 480;
      v8 = 352;
      v9 = 288;
      v10 = NRBluetoothPacketParserSuspendNexusBKInputSource;
      break;
    case 'f':
      v5 = 0;
      v6 = 16;
      v7 = 464;
      v8 = 336;
      v9 = 272;
      v10 = NRBluetoothPacketParserSuspendNexusBEInputSource;
      break;
    default:
      v398 = 0;
      v399 = 0;
      v10 = 0;
      v5 = 0;
      v12 = 0;
      v11 = 0;
      if (!*(_BYTE *)(v2 + 1513))
        goto LABEL_6;
LABEL_230:
      v239 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
      v240 = v239;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v260 = os_log_type_enabled(v239, OS_LOG_TYPE_INFO);

        v2 = 0x1ED368000;
        if (!v260)
          goto LABEL_6;
      }
      v261 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
      _NRLogWithArgs((uint64_t)v261, 1, (uint64_t)"%s%.30s:%-4d starting NtL fast-path for %u", v262, v263, v264, v265, v266, (uint64_t)");

      v2 = 0x1ED368000;
      goto LABEL_6;
  }
  v11 = *(_QWORD *)(v3 + v9);
  v12 = *(id *)(v3 + v8);
  v398 = (_QWORD *)(v3 + v7);
  v399 = (_BYTE *)(v3 + v6);
  v2 = 0x1ED368000uLL;
  if (gNRPacketLoggingEnabled)
    goto LABEL_230;
LABEL_6:
  v393 = v3;
  if (v4 == 100 && (*(_BYTE *)(v3 + 10) & 8) != 0)
  {
    v16 = (_QWORD *)(v3 + 128);
    v17 = 3;
    v400 = 1;
    v18 = "Isochronous";
    goto LABEL_26;
  }
  if (!v5)
    goto LABEL_22;
  if ((*(_BYTE *)(v3 + 10) & 4) == 0)
  {
    v13 = *(_QWORD *)(v3 + 104);
    if (!v13)
      goto LABEL_22;
    if ((*(_BYTE *)(*(_QWORD *)v13 + 27) & 3) == 1 && !*(_BYTE *)(v3 + 12))
    {

      v15 = 0;
      v10 = 0;
      v12 = 0;
      v11 = 0;
      v14 = (_QWORD *)(v3 + 112);
      if (!*(_BYTE *)(v3 + 12))
        goto LABEL_15;
    }
    else
    {
      v14 = 0;
      v15 = 1;
      if (!*(_BYTE *)(v3 + 12))
        goto LABEL_15;
    }
    if (!*(_BYTE *)(v2 + 1513))
      goto LABEL_15;
    v286 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
    v287 = v286;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v302 = os_log_type_enabled(v286, OS_LOG_TYPE_INFO);

      v2 = 0x1ED368000;
      if (!v302)
        goto LABEL_15;
    }
    v303 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
    _NRLogWithArgs((uint64_t)v303, 1, (uint64_t)"%s%.30s:%-4d sending packets over medium pipe", v304, v305, v306, v307, v308, (uint64_t)");

    v2 = 0x1ED368000;
LABEL_15:
    if (v14)
    {
      v16 = v14;
      if ((v15 & 1) != 0)
      {
        v400 = 0;
        v17 = 0;
        v18 = "Invalid";
        goto LABEL_26;
      }
      goto LABEL_25;
    }
LABEL_22:
    v400 = 0;
    v16 = (_QWORD *)(v3 + 96);
    v17 = 1;
    v18 = "Medium";
    goto LABEL_26;
  }
  v16 = (_QWORD *)(v3 + 112);
LABEL_25:
  v400 = 0;
  v18 = "High";
  v17 = 2;
LABEL_26:
  v392 = (_QWORD **)v16;
  v19 = (_QWORD *)*v16;
  if (v19)
  {
    v20 = v19[3];
    if ((*(_BYTE *)(v20 + 84) & 1) == 0)
    {
      v376 = v17;
      v395 = v11;
      v380 = v10;
      v377 = v12;
      v378 = v1;
      v21 = v3;
      v22 = 0;
      v23 = 0;
      v394 = 0;
      v24 = *(unsigned __int8 *)(v20 + 83);
      v25 = 568;
      if (v24 == 3)
        v25 = 584;
      v26 = v24 == 2;
      v27 = 600;
      if (!v26)
        v27 = v25;
      v390 = v27;
      v396 = v21 + 688;
      v397 = v21 + 672;
      v28 = 9;
      v379 = *(char **)(v20 + 8);
      if (!*(_BYTE *)(v2 + 1513))
        goto LABEL_37;
LABEL_33:
      v29 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
      v30 = v29;
      if (sNRCopyLogToStdErr)
      {

LABEL_36:
        v32 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
        _NRLogWithArgs((uint64_t)v32, 1, (uint64_t)"%s%.30s:%-4d %s: starting NtL outer loop", v33, v34, v35, v36, v37, (uint64_t)");

        v2 = 0x1ED368000uLL;
        goto LABEL_37;
      }
      v31 = os_log_type_enabled(v29, OS_LOG_TYPE_INFO);

      v2 = 0x1ED368000;
      if (v31)
        goto LABEL_36;
LABEL_37:
      next_slot = 0;
      v39 = 0;
      v391 = 0;
      v405 = 0u;
      v406 = 0u;
      v403 = 0u;
      v404 = 0u;
      if (*(_BYTE *)(v2 + 1513))
      {
LABEL_38:
        v40 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
        v41 = v40;
        if (sNRCopyLogToStdErr)
        {

        }
        else
        {
          v42 = os_log_type_enabled(v40, OS_LOG_TYPE_INFO);

          v2 = 0x1ED368000;
          if (!v42)
            goto LABEL_42;
        }
        v43 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
        _NRLogWithArgs((uint64_t)v43, 1, (uint64_t)"%s%.30s:%-4d %s: starting NtL inner loop", v44, v45, v46, v47, v48, (uint64_t)");

        v2 = 0x1ED368000uLL;
      }
LABEL_42:
      while (1)
      {
        v49 = v28 | 0x10;
        if ((v400 & 1) == 0)
        {
          v51 = *(_DWORD *)(v20 + 28);
          v50 = *(unsigned int *)(v20 + 32);
          if (v51 > v50)
            break;
        }
LABEL_52:
        if (v395)
          next_slot = os_channel_get_next_slot();
        if (next_slot)
        {
          v57 = next_slot;
          while (1)
          {
            v58 = 0x4000 - *(unsigned __int16 *)(v20 + 80);
            if (v58 < nrMaxTLVLengthForPacket(v404, WORD1(v403)))
            {
              v49 |= 0x40u;
              if (!gNRPacketLoggingEnabled)
              {
LABEL_97:
                next_slot = v57;
                v2 = 0x1ED368000;
                goto LABEL_99;
              }
              v142 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
              v143 = v142;
              if (sNRCopyLogToStdErr)
              {

              }
              else
              {
                v156 = os_log_type_enabled(v142, OS_LOG_TYPE_INFO);

                if (!v156)
                  goto LABEL_97;
              }
              v157 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
              _NRLogWithArgs((uint64_t)v157, 1, (uint64_t)"%s%.30s:%-4d %s: not enough room %u to fit maxTLVLen %u", v158, v159, v160, v161, v162, (uint64_t)");

              goto LABEL_97;
            }
            os_channel_slot_get_packet();
            os_packet_get_next_buflet();
            data_offset = os_buflet_get_data_offset();
            object_address = os_buflet_get_object_address();
            data_length = os_buflet_get_data_length();
            if (data_length >= 0x10000)
            {
              if (nrCopyLogObj_onceToken_509 != -1)
                dispatch_once(&nrCopyLogObj_onceToken_509, &__block_literal_global_353);
              if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_510, OS_LOG_TYPE_ERROR))
                _NRLogWithArgs(nrCopyLogObj_sNRLogObj_510, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: dataLen <= 65535", v62, v63, v64, v65, v66, (uint64_t)");
              _os_log_pack_size();
              MEMORY[0x1E0C80A78]();
              __error();
              v231 = _os_log_pack_fill();
              *(_DWORD *)v231 = 136446210;
              *(_QWORD *)(v231 + 4) = "NRBluetoothPacketParserNexusToLinkLoop";
              v232 = nrCopyLogObj_506();
              _NRLogAbortWithPack(v232);
            }
            v67 = data_length;
            if (!(_WORD)data_length && WORD1(v403))
            {
              v401 = 0;
              v402 = 0;
              v401 = *(_QWORD *)v20 + *(unsigned __int16 *)(v20 + 80);
              LODWORD(v402) = v58;
              v68 = nrPacketToTLV((unsigned __int8 *)v404, WORD1(v403), (uint64_t)&v401, 1u, v397, v396);
              v2 = 0x1ED368000uLL;
              if (!gNRPacketLoggingEnabled)
              {
LABEL_61:
                v49 |= 0x80u;
                goto LABEL_67;
              }
              v73 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
              v74 = v73;
              if (sNRCopyLogToStdErr)
              {

              }
              else
              {
                v79 = os_log_type_enabled(v73, OS_LOG_TYPE_INFO);

                v2 = 0x1ED368000;
                if (!v79)
                  goto LABEL_61;
              }
              v80 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
              v81 = v404;
              v82 = WORD1(v403);
              if (isPacketValidIPv6((_BYTE *)v404, WORD1(v403)))
                isNextHeaderValidESP(v81, v82);
              v83 = v404;
              v84 = WORD1(v403);
              if (isPacketValidIPv6((_BYTE *)v404, WORD1(v403)))
                isNextHeaderValidESP(v83, v84);
              _NRLogWithArgs((uint64_t)v80, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u bytes from nexus for ESP seq: %u (spi: %u)", v85, v86, v87, v88, v89, (uint64_t)");

              v2 = 0x1ED368000;
              goto LABEL_61;
            }
            if ((_WORD)data_length)
            {
              v69 = (unsigned __int8 *)(object_address + data_offset);
              v401 = 0;
              v402 = 0;
              v401 = *(_QWORD *)v20 + *(unsigned __int16 *)(v20 + 80);
              LODWORD(v402) = v58;
              v68 = nrPacketToTLV(v69, (unsigned __int16)data_length, (uint64_t)&v401, 1u, v397, v396);
              v2 = 0x1ED368000uLL;
              if (!gNRPacketLoggingEnabled)
              {
LABEL_64:
                v49 |= 0x100u;
                goto LABEL_67;
              }
              v75 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
              v76 = v75;
              if (sNRCopyLogToStdErr)
              {

              }
              else
              {
                v90 = os_log_type_enabled(v75, OS_LOG_TYPE_INFO);

                v2 = 0x1ED368000;
                if (!v90)
                  goto LABEL_64;
              }
              v381 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
              if (isPacketValidIPv6(v69, v67))
                isNextHeaderValidESP((uint64_t)v69, v67);
              v2 = 0x1ED368000;
              if (isPacketValidIPv6(v69, v67))
                isNextHeaderValidESP((uint64_t)v69, v67);
              _NRLogWithArgs((uint64_t)v381, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u bytes from nexus for ESP seq: %u (spi: %u)", v91, v92, v93, v94, v95, (uint64_t)");

              goto LABEL_64;
            }
            v49 |= 0x200u;
            v2 = 0x1ED368000uLL;
            if (!gNRPacketLoggingEnabled)
            {
              v68 = 0;
              goto LABEL_67;
            }
            v77 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
            v78 = v77;
            if (sNRCopyLogToStdErr)
              break;
            v68 = os_log_type_enabled(v77, OS_LOG_TYPE_INFO);

            if (v68)
              goto LABEL_93;
LABEL_94:
            v2 = 0x1ED368000;
LABEL_67:
            *(_WORD *)(v20 + 80) += v68;
            if ((v400 & 1) != 0)
              v70 = 0;
            else
              v70 = os_channel_get_next_slot();
            ++v23;
            ++*v398;
            *v399 = 1;
            v22 += v68;
            if (!v70)
            {
              next_slot = 0;
              v39 = v57;
              goto LABEL_99;
            }
            v71 = *(unsigned __int8 *)(v20 + 82);
            if (v71 >= 0xB)
            {
              v71 = *(unsigned __int8 *)(v20 + 82)
                  - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v20 + 82)) >> 32);
              *(_BYTE *)(v20 + 82) = v71;
            }
            *(_DWORD *)(v20 + 4 * v71 + 36) = v49;
            v72 = (117 * (*(_BYTE *)(v20 + 82) + 1)) >> 8;
            *(_BYTE *)(v20 + 82) = *(_BYTE *)(v20 + 82)
                                 + 1
                                 - 11 * ((v72 + (((*(_BYTE *)(v20 + 82) + 1 - v72) & 0xFE) >> 1)) >> 3);
            v39 = v57;
            v57 = v70;
            v49 = 0;
          }

LABEL_93:
          v96 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
          _NRLogWithArgs((uint64_t)v96, 1, (uint64_t)"%s%.30s:%-4d %s: No data to write", v97, v98, v99, v100, v101, (uint64_t)");

          v68 = 0;
          goto LABEL_94;
        }
LABEL_99:
        v102 = *(unsigned __int16 *)(v20 + 80);
        v103 = *(_WORD *)(v20 + 80) != 0;
        if (!*(_WORD *)(v20 + 80))
        {
          v105 = v49 | 0x400;
          if (!*(_BYTE *)(v2 + 1513))
          {
            v103 = 0;
            v199 = 1;
            v200 = v105 | 0x8000;
            if (!v39)
              goto LABEL_175;
LABEL_184:
            os_channel_advance_slot();
            *(_BYTE *)(v393 + 13) = 1;
LABEL_185:
            if (v394 > 8u || v395 && os_channel_available_slot_count() <= 1)
            {
              if (!*(_BYTE *)(v2 + 1513))
                goto LABEL_189;
              v214 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
              v215 = v214;
              if (sNRCopyLogToStdErr)
              {

                goto LABEL_204;
              }
              v223 = os_log_type_enabled(v214, OS_LOG_TYPE_INFO);

              v2 = 0x1ED368000;
              if (v223)
              {
LABEL_204:
                v224 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
                _NRLogWithArgs((uint64_t)v224, 1, (uint64_t)"%s%.30s:%-4d %s: performing RX sync (%u packets, %u bytes, %u pending, %0.2f msec, canWriteMore %d, memmove %u)", v225, v226, v227, v228, v229, (uint64_t)");

                v2 = 0x1ED368000;
              }
LABEL_189:
              v200 = v105 | 0x18000;
              os_channel_sync();
              *(_BYTE *)(v393 + 13) = 0;
            }
LABEL_190:
            if (v103 && v199)
            {
              v210 = *(unsigned __int8 *)(v20 + 82);
              if (v210 >= 0xB)
              {
                v210 = *(unsigned __int8 *)(v20 + 82)
                     - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v20 + 82)) >> 32);
                *(_BYTE *)(v20 + 82) = v210;
              }
              *(_DWORD *)(v20 + 4 * v210 + 36) = v200;
              v211 = (117 * (*(_BYTE *)(v20 + 82) + 1)) >> 8;
              *(_BYTE *)(v20 + 82) = *(_BYTE *)(v20 + 82)
                                   + 1
                                   - 11
                                   * ((v211 + (((*(_BYTE *)(v20 + 82) + 1 - v211) & 0xFE) >> 1)) >> 3);
              v28 = 8;
              if (*(_BYTE *)(v2 + 1513))
                goto LABEL_33;
              goto LABEL_37;
            }
            v233 = v103;
            if (*(_BYTE *)(v2 + 1513))
            {
              v281 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
              v282 = v281;
              if (sNRCopyLogToStdErr)
              {

              }
              else
              {
                v288 = os_log_type_enabled(v281, OS_LOG_TYPE_INFO);

                v2 = 0x1ED368000;
                if (!v288)
                  goto LABEL_218;
              }
              v289 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
              _NRLogWithArgs((uint64_t)v289, 1, (uint64_t)"%s%.30s:%-4d %s: out of NtL outer loop", v290, v291, v292, v293, v294, (uint64_t)");

              v2 = 0x1ED368000;
            }
LABEL_218:
            v1 = v378;
            v234 = v393;
            v12 = v377;
            if (v233)
              goto LABEL_262;
            if (v376 == 1)
            {
              v241 = *(_QWORD *)(v393 + 136);
              if ((*(_BYTE *)(v393 + 10) & 4) == 0)
                goto LABEL_246;
              goto LABEL_254;
            }
            if (v376 != 2)
            {
              if (v376 == 3)
              {
                v235 = *(_QWORD *)(v393 + 136);
                if ((v235 & 8) != 0 && *(_QWORD *)(v393 + 304))
                {
                  v236 = (dispatch_object_t *)(v393 + 304);
                  *(_QWORD *)(v393 + 136) = v235 & 0xFFFFFFFFFFFFFFF7;
                  if (*(_BYTE *)(v2 + 1513))
                  {
                    v237 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
                    v238 = v237;
                    if (sNRCopyLogToStdErr)
                    {

                      goto LABEL_315;
                    }
                    v347 = os_log_type_enabled(v237, OS_LOG_TYPE_INFO);

                    if (v347)
                    {
LABEL_315:
                      v320 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
                      _NRLogWithArgs((uint64_t)v320, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v348, v349, v350, v351, v352, (uint64_t)");
                      goto LABEL_318;
                    }
                    goto LABEL_319;
                  }
                  goto LABEL_261;
                }
                goto LABEL_262;
              }
              v241 = *(_QWORD *)(v393 + 136);
LABEL_246:
              if ((v241 & 8) != 0 && *(_QWORD *)(v393 + 304))
              {
                *(_QWORD *)(v393 + 136) = v241 & 0xFFFFFFFFFFFFFFF7;
                if (!*(_BYTE *)(v2 + 1513))
                  goto LABEL_249;
                v313 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
                v314 = v313;
                if (sNRCopyLogToStdErr)
                {

                  v1 = v378;
                  v234 = v393;
                  v12 = v377;
                  goto LABEL_311;
                }
                v333 = os_log_type_enabled(v313, OS_LOG_TYPE_INFO);

                v1 = v378;
                v234 = v393;
                v12 = v377;
                v2 = 0x1ED368000;
                if (v333)
                {
LABEL_311:
                  v334 = _NRCopyLogObjectForNRUUID(*(void **)(v234 + 40));
                  _NRLogWithArgs((uint64_t)v334, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v335, v336, v337, v338, v339, (uint64_t)");

                  v2 = 0x1ED368000;
                }
LABEL_249:
                dispatch_resume(*(dispatch_object_t *)(v234 + 304));
                v241 = *(_QWORD *)(v234 + 136);
              }
              if ((v241 & 0x10) != 0 && *(_QWORD *)(v234 + 320))
              {
                *(_QWORD *)(v234 + 136) = v241 & 0xFFFFFFFFFFFFFFEFLL;
                if (!*(_BYTE *)(v2 + 1513))
                  goto LABEL_253;
                v315 = _NRCopyLogObjectForNRUUID(*(void **)(v234 + 40));
                v316 = v315;
                if (sNRCopyLogToStdErr)
                {

                  v1 = v378;
                  v234 = v393;
                  v12 = v377;
                  goto LABEL_313;
                }
                v340 = os_log_type_enabled(v315, OS_LOG_TYPE_INFO);

                v1 = v378;
                v234 = v393;
                v12 = v377;
                v2 = 0x1ED368000;
                if (v340)
                {
LABEL_313:
                  v341 = _NRCopyLogObjectForNRUUID(*(void **)(v234 + 40));
                  _NRLogWithArgs((uint64_t)v341, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVIInput", v342, v343, v344, v345, v346, (uint64_t)");

                  v2 = 0x1ED368000;
                }
LABEL_253:
                dispatch_resume(*(dispatch_object_t *)(v234 + 320));
                v241 = *(_QWORD *)(v234 + 136);
              }
LABEL_254:
              if ((v241 & 0x20) != 0 && *(_QWORD *)(v234 + 336))
              {
                *(_QWORD *)(v234 + 136) = v241 & 0xFFFFFFFFFFFFFFDFLL;
                if (!*(_BYTE *)(v2 + 1513))
                  goto LABEL_257;
                v309 = _NRCopyLogObjectForNRUUID(*(void **)(v234 + 40));
                v310 = v309;
                if (sNRCopyLogToStdErr)
                {

                  v1 = v378;
                  v234 = v393;
                  v12 = v377;
                  goto LABEL_309;
                }
                v326 = os_log_type_enabled(v309, OS_LOG_TYPE_INFO);

                v1 = v378;
                v234 = v393;
                v12 = v377;
                v2 = 0x1ED368000;
                if (v326)
                {
LABEL_309:
                  v327 = _NRCopyLogObjectForNRUUID(*(void **)(v234 + 40));
                  _NRLogWithArgs((uint64_t)v327, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBEInput", v328, v329, v330, v331, v332, (uint64_t)");

                  v2 = 0x1ED368000;
                }
LABEL_257:
                dispatch_resume(*(dispatch_object_t *)(v234 + 336));
                v241 = *(_QWORD *)(v234 + 136);
              }
              if ((v241 & 0x40) != 0 && *(_QWORD *)(v234 + 352))
              {
                v236 = (dispatch_object_t *)(v234 + 352);
                *(_QWORD *)(v234 + 136) = v241 & 0xFFFFFFFFFFFFFFBFLL;
                if (*(_BYTE *)(v2 + 1513))
                {
                  v311 = _NRCopyLogObjectForNRUUID(*(void **)(v234 + 40));
                  v312 = v311;
                  if (sNRCopyLogToStdErr)
                  {

                  }
                  else
                  {
                    v319 = os_log_type_enabled(v311, OS_LOG_TYPE_INFO);

                    if (!v319)
                      goto LABEL_319;
                  }
                  v320 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
                  _NRLogWithArgs((uint64_t)v320, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBKInput", v321, v322, v323, v324, v325, (uint64_t)");
                  goto LABEL_318;
                }
                goto LABEL_261;
              }
              goto LABEL_262;
            }
            v242 = *(_QWORD *)(v393 + 136);
            if ((v242 & 8) != 0 && *(_QWORD *)(v393 + 304))
            {
              *(_QWORD *)(v393 + 136) = v242 & 0xFFFFFFFFFFFFFFF7;
              if (!*(_BYTE *)(v2 + 1513))
                goto LABEL_239;
              v317 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
              v318 = v317;
              if (sNRCopyLogToStdErr)
              {

                v1 = v378;
                v234 = v393;
                v12 = v377;
                goto LABEL_321;
              }
              v359 = os_log_type_enabled(v317, OS_LOG_TYPE_INFO);

              v1 = v378;
              v234 = v393;
              v12 = v377;
              v2 = 0x1ED368000;
              if (v359)
              {
LABEL_321:
                v360 = _NRCopyLogObjectForNRUUID(*(void **)(v234 + 40));
                _NRLogWithArgs((uint64_t)v360, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v361, v362, v363, v364, v365, (uint64_t)");

                v2 = 0x1ED368000;
              }
LABEL_239:
              dispatch_resume(*(dispatch_object_t *)(v234 + 304));
              v242 = *(_QWORD *)(v234 + 136);
            }
            if ((v242 & 0x10) != 0 && *(_QWORD *)(v234 + 320))
            {
              v236 = (dispatch_object_t *)(v234 + 320);
              *(_QWORD *)(v234 + 136) = v242 & 0xFFFFFFFFFFFFFFEFLL;
              if (*(_BYTE *)(v2 + 1513))
              {
                v243 = _NRCopyLogObjectForNRUUID(*(void **)(v234 + 40));
                v244 = v243;
                if (sNRCopyLogToStdErr)
                {

                }
                else
                {
                  v353 = os_log_type_enabled(v243, OS_LOG_TYPE_INFO);

                  if (!v353)
                    goto LABEL_319;
                }
                v320 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
                _NRLogWithArgs((uint64_t)v320, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVIInput", v354, v355, v356, v357, v358, (uint64_t)");
LABEL_318:

LABEL_319:
                v1 = v378;
                v234 = v393;
                v12 = v377;
                v2 = 0x1ED368000;
              }
LABEL_261:
              dispatch_resume(*v236);
            }
LABEL_262:
            if (*(_BYTE *)(v2 + 1513))
            {
              v283 = _NRCopyLogObjectForNRUUID(*(void **)(v234 + 40));
              v284 = v283;
              if (sNRCopyLogToStdErr)
              {

                v1 = v378;
                v285 = v393;
                v12 = v377;
              }
              else
              {
                v295 = os_log_type_enabled(v283, OS_LOG_TYPE_INFO);

                v1 = v378;
                v285 = v393;
                v12 = v377;
                if (!v295)
                  goto LABEL_263;
              }
              v296 = _NRCopyLogObjectForNRUUID(*(void **)(v285 + 40));
              _NRLogWithArgs((uint64_t)v296, 1, (uint64_t)"%s%.30s:%-4d %s: done with NtL fast-path", v297, v298, v299, v300, v301, (uint64_t)");

            }
LABEL_263:
            v245 = *(unsigned __int8 *)(v20 + 82);
            if (v245 >= 0xB)
            {
              v245 = *(unsigned __int8 *)(v20 + 82)
                   - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v20 + 82)) >> 32);
              *(_BYTE *)(v20 + 82) = v245;
            }
            *(_DWORD *)(v20 + 4 * v245 + 36) = v200 | 0x60000;
LABEL_266:
            v246 = (117 * (*(_BYTE *)(v20 + 82) + 1)) >> 8;
            *(_BYTE *)(v20 + 82) = *(_BYTE *)(v20 + 82)
                                 + 1
                                 - 11
                                 * ((v246 + (((*(_BYTE *)(v20 + 82) + 1 - v246) & 0xFE) >> 1)) >> 3);
            goto LABEL_267;
          }
          v201 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
          v202 = v201;
          if (sNRCopyLogToStdErr)
          {

            goto LABEL_180;
          }
          v203 = os_log_type_enabled(v201, OS_LOG_TYPE_INFO);

          if (v203)
          {
LABEL_180:
            v204 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
            _NRLogWithArgs((uint64_t)v204, 1, (uint64_t)"%s%.30s:%-4d %s: nothing to read from nexus", v205, v206, v207, v208, v209, (uint64_t)");

          }
          v2 = 0x1ED368000uLL;
LABEL_182:
          v199 = v102 == 0;
          if (!*(_BYTE *)(v2 + 1513))
          {
            v200 = v105 | 0x8000;
            if (v39)
              goto LABEL_184;
            goto LABEL_175;
          }
          v212 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
          v213 = v212;
          if (sNRCopyLogToStdErr)
          {

            goto LABEL_200;
          }
          v216 = os_log_type_enabled(v212, OS_LOG_TYPE_INFO);

          if (v216)
          {
LABEL_200:
            v217 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
            _NRLogWithArgs((uint64_t)v217, 1, (uint64_t)"%s%.30s:%-4d %s: out of NtL inner loop", v218, v219, v220, v221, v222, (uint64_t)");

          }
          v2 = 0x1ED368000;
          v200 = v105 | 0x8000;
          if (v39)
            goto LABEL_184;
LABEL_175:
          if (*(_BYTE *)(v393 + 13))
            goto LABEL_185;
          goto LABEL_190;
        }
        v401 = 0;
        if (*(_BYTE *)(v2 + 1513))
        {
          v123 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
          v124 = v123;
          if (sNRCopyLogToStdErr)
          {

          }
          else
          {
            v129 = os_log_type_enabled(v123, OS_LOG_TYPE_INFO);

            v2 = 0x1ED368000;
            if (!v129)
              goto LABEL_101;
          }
          v130 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
          _NRLogWithArgs((uint64_t)v130, 1, (uint64_t)"%s%.30s:%-4d %s: invoking send callback w/ written %u", v131, v132, v133, v134, v135, (uint64_t)");

          v2 = 0x1ED368000;
        }
LABEL_101:
        v104 = ((uint64_t (*)(_QWORD, _QWORD, _QWORD, unint64_t *, _QWORD, _QWORD))(*v392)[1])(**v392, *(_QWORD *)v20, *(unsigned __int16 *)(v20 + 80), &v401, 0, 0);
        if (!*(_BYTE *)(v2 + 1513))
          goto LABEL_102;
        v125 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
        v126 = v125;
        if (sNRCopyLogToStdErr)
        {

        }
        else
        {
          v383 = os_log_type_enabled(v125, OS_LOG_TYPE_INFO);

          v2 = 0x1ED368000;
          if (!v383)
            goto LABEL_102;
        }
        v136 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
        _NRLogWithArgs((uint64_t)v136, 1, (uint64_t)"%s%.30s:%-4d %s: canWriteMore: %d bufferHandled=%zu/%u", v137, v138, v139, v140, v141, (uint64_t)");

        v2 = 0x1ED368000;
LABEL_102:
        if ((v104 & 1) == 0)
        {
          if (v380)
            v380(v393);
          *(_BYTE *)(v20 + 84) |= 1u;
          switch(*(_BYTE *)(v20 + 83))
          {
            case 0:
              v107 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
              v108 = v107;
              if (sNRCopyLogToStdErr)
              {

              }
              else
              {
                v382 = os_log_type_enabled(v107, OS_LOG_TYPE_ERROR);

                v2 = 0x1ED368000;
                if (!v382)
                  goto LABEL_122;
              }
              v114 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
              _NRLogWithArgs((uint64_t)v114, 16, (uint64_t)"%s%.30s:%-4d invalid link channel priority", v115, v116, v117, v118, v119, (uint64_t)");
              goto LABEL_121;
            case 1:
              v109 = *(_QWORD *)(v393 + 136);
              ++*(_QWORD *)(v393 + 144);
              *(_QWORD *)(v393 + 136) = v109 & 0xFFFFFFFFFFFFFFFELL | *(_BYTE *)(v20 + 84) & 1;
              if (!*(_BYTE *)(v2 + 1513))
                goto LABEL_117;
              v110 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
              v111 = v110;
              if (sNRCopyLogToStdErr)
              {

              }
              else
              {
                v387 = os_log_type_enabled(v110, OS_LOG_TYPE_INFO);

                v2 = 0x1ED368000;
                if (!v387)
                  goto LABEL_122;
              }
              v114 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
              _NRLogWithArgs((uint64_t)v114, 1, (uint64_t)"%s%.30s:%-4d source-%s: Medium", v184, v185, v186, v187, v188, (uint64_t)");
              goto LABEL_121;
            case 2:
              ++*(_QWORD *)(v393 + 160);
              *(_QWORD *)(v393 + 136) = *(_QWORD *)(v393 + 136) & 0xFFFFFFFFFFFFFFFDLL | (2
                                                                                        * (*(_BYTE *)(v20 + 84) & 1));
              if (!*(_BYTE *)(v2 + 1513))
                goto LABEL_117;
              v112 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
              v113 = v112;
              if (sNRCopyLogToStdErr)
              {

              }
              else
              {
                v388 = os_log_type_enabled(v112, OS_LOG_TYPE_INFO);

                v2 = 0x1ED368000;
                if (!v388)
                  goto LABEL_122;
              }
              v114 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
              _NRLogWithArgs((uint64_t)v114, 1, (uint64_t)"%s%.30s:%-4d source-%s: High", v189, v190, v191, v192, v193, (uint64_t)");
              goto LABEL_121;
            case 3:
              ++*(_QWORD *)(v393 + 176);
              *(_QWORD *)(v393 + 136) = *(_QWORD *)(v393 + 136) & 0xFFFFFFFFFFFFFFFBLL | (4
                                                                                        * (*(_BYTE *)(v20 + 84) & 1));
              if (!*(_BYTE *)(v2 + 1513))
              {
LABEL_117:
                v105 = v49 | 0x1800;
                v106 = v401;
                if (v401)
                  goto LABEL_124;
                goto LABEL_130;
              }
              v175 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
              v176 = v175;
              if (sNRCopyLogToStdErr)
              {

              }
              else
              {
                v389 = os_log_type_enabled(v175, OS_LOG_TYPE_INFO);

                v2 = 0x1ED368000;
                if (!v389)
                  goto LABEL_122;
              }
              v114 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
              _NRLogWithArgs((uint64_t)v114, 1, (uint64_t)"%s%.30s:%-4d source-%s: Isochronous", v194, v195, v196, v197, v198, (uint64_t)");
LABEL_121:

              v2 = 0x1ED368000uLL;
LABEL_122:
              v105 = v49 | 0x1800;
              if (!*(_BYTE *)(v2 + 1513))
              {
                v106 = v401;
                if (!v401)
                  goto LABEL_130;
                goto LABEL_124;
              }
              v127 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
              v128 = v127;
              if (sNRCopyLogToStdErr)
              {

              }
              else
              {
                v384 = os_log_type_enabled(v127, OS_LOG_TYPE_INFO);

                if (!v384)
                  goto LABEL_155;
              }
              v150 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
              _NRLogWithArgs((uint64_t)v150, 1, (uint64_t)"%s%.30s:%-4d ", v151, v152, v153, v154, v155, (uint64_t)");

LABEL_155:
              v2 = 0x1ED368000;
              v106 = v401;
              if (v401)
                goto LABEL_124;
              break;
            default:
              goto LABEL_122;
          }
          goto LABEL_130;
        }
        v105 = v49 | 0x800;
        v106 = v401;
        if (v401)
        {
LABEL_124:
          if (v106 < *(unsigned __int16 *)(v20 + 80))
          {
            if (!*(_BYTE *)(v2 + 1513))
              goto LABEL_126;
            v144 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
            v145 = v144;
            if (sNRCopyLogToStdErr)
            {

              goto LABEL_160;
            }
            v385 = os_log_type_enabled(v144, OS_LOG_TYPE_INFO);

            v2 = 0x1ED368000;
            if (v385)
            {
LABEL_160:
              v163 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
              _NRLogWithArgs((uint64_t)v163, 1, (uint64_t)"%s%.30s:%-4d %s: memmoving filledIn=%u, bufferHandled=%zu", v164, v165, v166, v167, v168, (uint64_t)");

              v2 = 0x1ED368000;
            }
LABEL_126:
            v105 |= 0x2000u;
            memmove(*(void **)v20, (const void *)(*(_QWORD *)v20 + v401), *(unsigned __int16 *)(v20 + 80) - v401);
            v120 = v401;
            *(_WORD *)(v20 + 80) -= v401;
            ++v391;
LABEL_129:
            *(_QWORD *)(v393 + v390) += v120;
            goto LABEL_130;
          }
          if (!*(_BYTE *)(v2 + 1513))
          {
LABEL_128:
            v105 |= 0x4000u;
            *(_WORD *)(v20 + 80) = 0;
            v120 = v401;
            goto LABEL_129;
          }
          v146 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
          v147 = v146;
          if (sNRCopyLogToStdErr)
          {

          }
          else
          {
            v386 = os_log_type_enabled(v146, OS_LOG_TYPE_INFO);

            v2 = 0x1ED368000;
            if (!v386)
              goto LABEL_128;
          }
          v169 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
          _NRLogWithArgs((uint64_t)v169, 1, (uint64_t)"%s%.30s:%-4d %s: not memmoving filledIn=%u, bufferHandled=%zu", v170, v171, v172, v173, v174, (uint64_t)");

          v2 = 0x1ED368000;
          goto LABEL_128;
        }
LABEL_130:
        ++v394;
        if ((v104 & 1) == 0)
          goto LABEL_182;
        v121 = *(unsigned __int8 *)(v20 + 82);
        if (v121 >= 0xB)
        {
          v121 = *(unsigned __int8 *)(v20 + 82)
               - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v20 + 82)) >> 32);
          *(_BYTE *)(v20 + 82) = v121;
        }
        v28 = 0;
        *(_DWORD *)(v20 + 4 * v121 + 36) = v105;
        v122 = (117 * (*(_BYTE *)(v20 + 82) + 1)) >> 8;
        *(_BYTE *)(v20 + 82) = *(_BYTE *)(v20 + 82)
                             + 1
                             - 11 * ((v122 + (((*(_BYTE *)(v20 + 82) + 1 - v122) & 0xFE) >> 1)) >> 3);
        if (*(_BYTE *)(v2 + 1513))
          goto LABEL_38;
      }
      v52 = *(unsigned __int16 *)(v20 + 80);
      if ((unsigned __int16)(v51 - v50) >= (unsigned __int16)(0x4000 - v52))
        v53 = (unsigned __int16)(0x4000 - v52);
      else
        v53 = (unsigned __int16)(v51 - v50);
      memcpy((void *)(*(_QWORD *)v20 + v52), &v379[v50], v53);
      v54 = *(_DWORD *)(v20 + 28);
      v55 = *(_DWORD *)(v20 + 32) + v53;
      *(_DWORD *)(v20 + 32) = v55;
      if (v54 <= v55)
      {
        v56 = 0;
      }
      else
      {
        memmove(v379, &v379[v55], v54 - v55);
        v56 = *(_DWORD *)(v20 + 28) - *(_DWORD *)(v20 + 32);
      }
      *(_DWORD *)(v20 + 28) = v56;
      *(_DWORD *)(v20 + 32) = 0;
      *(_WORD *)(v20 + 80) += v53;
      if (!*(_BYTE *)(v2 + 1513))
      {
LABEL_51:
        v49 = v28 | 0x30;
        v22 += v53;
        goto LABEL_52;
      }
      v148 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
      v149 = v148;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v177 = os_log_type_enabled(v148, OS_LOG_TYPE_INFO);

        v2 = 0x1ED368000;
        if (!v177)
          goto LABEL_51;
      }
      v178 = _NRCopyLogObjectForNRUUID(*(void **)(v393 + 40));
      _NRLogWithArgs((uint64_t)v178, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u (%u/%u) bytes from linkWriteBuffer", v179, v180, v181, v182, v183, (uint64_t)");

      v2 = 0x1ED368000;
      goto LABEL_51;
    }
    if (!*(_BYTE *)(v2 + 1513))
    {
LABEL_206:
      if (v10)
        v10(v3);
      v230 = *(unsigned __int8 *)(v20 + 82);
      if (v230 >= 0xB)
      {
        v230 = *(unsigned __int8 *)(v20 + 82)
             - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v20 + 82)) >> 32);
        *(_BYTE *)(v20 + 82) = v230;
      }
      *(_DWORD *)(v20 + 4 * v230 + 36) = 3;
      goto LABEL_266;
    }
    v258 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
    v259 = v258;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v274 = os_log_type_enabled(v258, OS_LOG_TYPE_INFO);

      if (!v274)
        goto LABEL_206;
    }
    v275 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
    _NRLogWithArgs((uint64_t)v275, 1, (uint64_t)"%s%.30s:%-4d %s: ignoring NtL fast-path for %u, as waiting for link output available", v276, v277, v278, v279, v280, (uint64_t)");

    goto LABEL_206;
  }
  if (!*(_BYTE *)(v2 + 1513))
    goto LABEL_272;
  v366 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
  v367 = v366;
  if (sNRCopyLogToStdErr)
  {

  }
  else
  {
    v368 = os_log_type_enabled(v366, OS_LOG_TYPE_INFO);

    if (!v368)
      goto LABEL_272;
  }
  v369 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
  _NRLogWithArgs((uint64_t)v369, 1, (uint64_t)"%s%.30s:%-4d ", v370, v371, v372, v373, v374, (uint64_t)");

LABEL_272:
  v249 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
  v250 = v249;
  if (sNRCopyLogToStdErr)
  {

  }
  else
  {
    v267 = os_log_type_enabled(v249, OS_LOG_TYPE_FAULT);

    if (!v267)
      goto LABEL_267;
  }
  v268 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
  _NRLogWithArgs((uint64_t)v268, 17, (uint64_t)"%s: Invalid write context for nexus priority: %u", v269, v270, v271, v272, v273, (uint64_t)v18);

LABEL_267:
  v3 = *(_QWORD *)(v1 + 32);
LABEL_268:
  *(_BYTE *)(v3 + 12) = 0;
}

void __68__NRBluetoothPacketParser_setupNexusChannelForPriority_channelUUID___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __68__NRBluetoothPacketParser_setupNexusChannelForPriority_channelUUID___block_invoke_3(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(_QWORD);
  os_log_t v8;
  os_log_t v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  os_log_t v16;
  os_log_t v17;
  _BOOL4 v18;
  os_log_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __CFString *StringForNRNexusChannelPriority;
  os_log_t v26;

  if (!gNRPacketLoggingEnabled)
    goto LABEL_2;
  v16 = _NRCopyLogObjectForNRUUID(*(void **)(*(_QWORD *)(a1 + 32) + 40));
  if (sNRCopyLogToStdErr)
  {

  }
  else
  {
    v17 = v16;
    v18 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);

    if (!v18)
      goto LABEL_2;
  }
  v19 = _NRCopyLogObjectForNRUUID(*(void **)(*(_QWORD *)(a1 + 32) + 40));
  StringForNRNexusChannelPriority = (__CFString *)createStringForNRNexusChannelPriority(*(unsigned __int8 *)(a1 + 40));
  _NRLogWithArgs((uint64_t)v19, 1, (uint64_t)"%s%.30s:%-4d Nexus output available - %@", v20, v21, v22, v23, v24, (uint64_t)");

LABEL_2:
  v2 = *(_BYTE *)(a1 + 40) & 0xFE;
  if (v2 == 100)
    v3 = 2;
  else
    v3 = v2 == 102;
  v4 = *(_QWORD *)(a1 + 32);
  if ((_DWORD)v3 == 2)
  {
    v5 = 104;
  }
  else
  {
    if ((_DWORD)v3 != 1)
    {
      v8 = _NRCopyLogObjectForNRUUID(*(void **)(v4 + 40));
      v9 = v8;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v10 = os_log_type_enabled(v8, OS_LOG_TYPE_FAULT);

        if (!v10)
          return;
      }
      v26 = _NRCopyLogObjectForNRUUID(*(void **)(v4 + 40));
      _NRLogWithArgs((uint64_t)v26, 17, (uint64_t)"Invalid priority %d", v11, v12, v13, v14, v15, v3);

      return;
    }
    v5 = 88;
  }
  v6 = *(_QWORD *)(v4 + v5);
  if (v6)
  {
    v7 = *(void (**)(_QWORD))(v6 + 24);
    if (v7)
      v7(*(_QWORD *)(v6 + 32));
  }
}

void __68__NRBluetoothPacketParser_setupNexusChannelForPriority_channelUUID___block_invoke_4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __68__NRBluetoothPacketParser_setupNexusChannelForPriority_channelUUID___block_invoke_5()
{
  return os_channel_destroy();
}

@end
