@implementation NRDevicePairingCriteria

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setDeviceType:", -[NRDevicePairingCriteria deviceType](self, "deviceType"));
  objc_msgSend(v4, "setPairingTransport:", -[NRDevicePairingCriteria pairingTransport](self, "pairingTransport"));
  -[NRDevicePairingCriteria rssi](self, "rssi");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRssi:", v5);

  return v4;
}

- (NRDevicePairingCriteria)initWithCoder:(id)a3
{
  id v4;
  NRDevicePairingCriteria *v5;
  NRDevicePairingCriteria *v6;
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
  v20.super_class = (Class)NRDevicePairingCriteria;
  v5 = -[NRDevicePairingCriteria init](&v20, sel_init);
  if (!v5)
  {
    v9 = nrCopyLogObj_1090();
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
        *(_QWORD *)(v18 + 4) = "-[NRDevicePairingCriteria initWithCoder:]";
        v19 = nrCopyLogObj_1090();
        _NRLogAbortWithPack(v19);
      }
    }
    v12 = nrCopyLogObj_1090();
    _NRLogWithArgs((uint64_t)v12, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v13, v14, v15, v16, v17, (uint64_t)");

    goto LABEL_8;
  }
  v6 = v5;
  -[NRDevicePairingCriteria setDeviceType:](v5, "setDeviceType:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("deviceType")));
  -[NRDevicePairingCriteria setPairingTransport:](v6, "setPairingTransport:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("pairingTransport")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rssi"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRDevicePairingCriteria setRssi:](v6, "setRssi:", v7);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[NRDevicePairingCriteria deviceType](self, "deviceType"), CFSTR("deviceType"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[NRDevicePairingCriteria pairingTransport](self, "pairingTransport"), CFSTR("pairingTransport"));
  -[NRDevicePairingCriteria rssi](self, "rssi");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("rssi"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("Type %zu Transport %u"), -[NRDevicePairingCriteria deviceType](self, "deviceType"), -[NRDevicePairingCriteria pairingTransport](self, "pairingTransport"));
  -[NRDevicePairingCriteria rssi](self, "rssi");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NRDevicePairingCriteria rssi](self, "rssi");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" RSSI %@"), v5);

  }
  return v3;
}

- (unint64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(unint64_t)a3
{
  self->_deviceType = a3;
}

- (unsigned)pairingTransport
{
  return self->_pairingTransport;
}

- (void)setPairingTransport:(unsigned __int8)a3
{
  self->_pairingTransport = a3;
}

- (NSNumber)rssi
{
  return self->_rssi;
}

- (void)setRssi:(id)a3
{
  objc_storeStrong((id *)&self->_rssi, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rssi, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
