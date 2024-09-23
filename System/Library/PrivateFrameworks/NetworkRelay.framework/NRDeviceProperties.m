@implementation NRDeviceProperties

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setPairingProtocolVersion:", -[NRDeviceProperties pairingProtocolVersion](self, "pairingProtocolVersion"));
  objc_msgSend(v4, "setPeerNetworkRelayVersion:", -[NRDeviceProperties peerNetworkRelayVersion](self, "peerNetworkRelayVersion"));
  return v4;
}

- (NRDeviceProperties)initWithCoder:(id)a3
{
  id v4;
  NRDeviceProperties *v5;
  NRDeviceProperties *v6;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  objc_super v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NRDeviceProperties;
  v5 = -[NRDeviceProperties init](&v19, sel_init);
  if (!v5)
  {
    v8 = nrCopyLogObj_896();
    v9 = v8;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v10 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

      if (!v10)
      {
LABEL_8:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v17 = _os_log_pack_fill();
        *(_DWORD *)v17 = 136446210;
        *(_QWORD *)(v17 + 4) = "-[NRDeviceProperties initWithCoder:]";
        v18 = nrCopyLogObj_896();
        _NRLogAbortWithPack(v18);
      }
    }
    v11 = nrCopyLogObj_896();
    _NRLogWithArgs((uint64_t)v11, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v12, v13, v14, v15, v16, (uint64_t)");

    goto LABEL_8;
  }
  v6 = v5;
  -[NRDeviceProperties setPairingProtocolVersion:](v5, "setPairingProtocolVersion:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("pairingProtocolVersion")));
  -[NRDeviceProperties setPeerNetworkRelayVersion:](v6, "setPeerNetworkRelayVersion:", (unsigned __int16)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("peerNetworkRelayVersion")));

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[NRDeviceProperties pairingProtocolVersion](self, "pairingProtocolVersion"), CFSTR("pairingProtocolVersion"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[NRDeviceProperties peerNetworkRelayVersion](self, "peerNetworkRelayVersion"), CFSTR("peerNetworkRelayVersion"));

}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("[NRDeviceProp pairProtVers=%llu/nr:%u]"), -[NRDeviceProperties pairingProtocolVersion](self, "pairingProtocolVersion"), -[NRDeviceProperties peerNetworkRelayVersion](self, "peerNetworkRelayVersion"));
}

- (unint64_t)pairingProtocolVersion
{
  return self->_pairingProtocolVersion;
}

- (void)setPairingProtocolVersion:(unint64_t)a3
{
  self->_pairingProtocolVersion = a3;
}

- (unsigned)peerNetworkRelayVersion
{
  return self->_peerNetworkRelayVersion;
}

- (void)setPeerNetworkRelayVersion:(unsigned __int16)a3
{
  self->_peerNetworkRelayVersion = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (unsigned)getNetworkRelayVersion
{
  if (getNetworkRelayVersion_onceToken != -1)
    dispatch_once(&getNetworkRelayVersion_onceToken, &__block_literal_global_908);
  return getNetworkRelayVersion_version;
}

uint64_t __44__NRDeviceProperties_getNetworkRelayVersion__block_invoke()
{
  uint64_t result;

  result = nrXPCGetNetworkRelayVersion();
  getNetworkRelayVersion_version = result;
  return result;
}

@end
