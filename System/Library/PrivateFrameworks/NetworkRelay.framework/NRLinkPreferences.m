@implementation NRLinkPreferences

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithLinkType:", -[NRLinkPreferences linkType](self, "linkType"));
}

- (NRLinkPreferences)initWithLinkType:(unsigned __int8)a3
{
  NRLinkPreferences *result;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  objc_super v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)NRLinkPreferences;
  result = -[NRLinkPreferences init](&v16, sel_init);
  if (!result)
  {
    v5 = nrCopyLogObj_433();
    v6 = v5;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

      if (!v7)
      {
LABEL_8:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v14 = _os_log_pack_fill();
        *(_DWORD *)v14 = 136446210;
        *(_QWORD *)(v14 + 4) = "-[NRLinkPreferences initWithLinkType:]";
        v15 = nrCopyLogObj_433();
        _NRLogAbortWithPack(v15);
      }
    }
    v8 = nrCopyLogObj_433();
    _NRLogWithArgs((uint64_t)v8, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v9, v10, v11, v12, v13, (uint64_t)");

    goto LABEL_8;
  }
  result->_linkType = a3;
  return result;
}

- (BOOL)isNotEmpty
{
  return 0;
}

- (id)copyEncodedXPCDict
{
  xpc_object_t v3;
  void *v4;
  NSObject *v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v3 = xpc_dictionary_create(0, 0, 0);
  if (!v3)
  {
    v6 = nrCopyLogObj_433();
    v7 = v6;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v8 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

      if (!v8)
      {
LABEL_8:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v15 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v15, (uint64_t)"nr_xpc_dictionary_create");
        v16 = nrCopyLogObj_433();
        _NRLogAbortWithPack(v16);
      }
    }
    v9 = nrCopyLogObj_433();
    _NRLogWithArgs((uint64_t)v9, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v10, v11, v12, v13, v14, (uint64_t)");

    goto LABEL_8;
  }
  v4 = v3;
  xpc_dictionary_set_uint64(v3, "LinkType", -[NRLinkPreferences linkType](self, "linkType"));
  return v4;
}

- (id)description
{
  return -[NRLinkPreferences copyShortDescription](self, "copyShortDescription");
}

- (id)copyLongDescription
{
  id v3;
  void *StringFromNRLinkType;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  StringFromNRLinkType = (void *)createStringFromNRLinkType(-[NRLinkPreferences linkType](self, "linkType"));
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("Link Type: %@"), StringFromNRLinkType);

  return v5;
}

- (id)copyShortDescription
{
  id v3;
  void *StringFromNRLinkType;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  StringFromNRLinkType = (void *)createStringFromNRLinkType(-[NRLinkPreferences linkType](self, "linkType"));
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("LinkPref[%@]"), StringFromNRLinkType);

  return v5;
}

- (unsigned)linkType
{
  return self->_linkType;
}

+ (id)createFromEncodedXPCDict:(id)a3
{
  id v3;
  void *v4;
  NRBluetoothLinkPreferences *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v9 = nrCopyLogObj_433();
    v10 = v9;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v13 = os_log_type_enabled(v9, OS_LOG_TYPE_FAULT);

      if (!v13)
        goto LABEL_15;
    }
    v8 = nrCopyLogObj_433();
    _NRLogWithArgs((uint64_t)v8, 17, (uint64_t)"%s called with null encodedDict", v14, v15, v16, v17, v18, (uint64_t)"+[NRLinkPreferences createFromEncodedXPCDict:]");
LABEL_14:
    v5 = 0;
    goto LABEL_5;
  }
  if (MEMORY[0x1DF0BA7A8](v3) != MEMORY[0x1E0C812F8])
  {
    v11 = nrCopyLogObj_433();
    v12 = v11;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v19 = os_log_type_enabled(v11, OS_LOG_TYPE_FAULT);

      if (!v19)
        goto LABEL_15;
    }
    v8 = nrCopyLogObj_433();
    _NRLogWithArgs((uint64_t)v8, 17, (uint64_t)"%s called with null xpc_get_type(encodedDict) == (&_xpc_type_dictionary)", v20, v21, v22, v23, v24, (uint64_t)"+[NRLinkPreferences createFromEncodedXPCDict:]");
    goto LABEL_14;
  }
  if (xpc_dictionary_get_uint64(v4, "LinkType") != 1)
  {
LABEL_15:
    v5 = 0;
    goto LABEL_16;
  }
  v5 = objc_alloc_init(NRBluetoothLinkPreferences);
  NRLPCopyUInt64NSNumberFromXPCDict(v4, "InputBPS");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRBluetoothLinkPreferences setInputBytesPerSecond:](v5, "setInputBytesPerSecond:", v6);

  NRLPCopyUInt64NSNumberFromXPCDict(v4, "OutputBPS");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRBluetoothLinkPreferences setOutputBytesPerSecond:](v5, "setOutputBytesPerSecond:", v7);

  NRLPCopyUInt64NSNumberFromXPCDict(v4, "PacketsPerSecond");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRBluetoothLinkPreferences setPacketsPerSecond:](v5, "setPacketsPerSecond:", v8);
LABEL_5:

LABEL_16:
  return v5;
}

@end
