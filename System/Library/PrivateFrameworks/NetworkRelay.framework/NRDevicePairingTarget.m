@implementation NRDevicePairingTarget

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[NRDevicePairingTarget candidate](self, "candidate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCandidate:", v5);

  objc_msgSend(v4, "setAuthMethod:", -[NRDevicePairingTarget authMethod](self, "authMethod"));
  -[NRDevicePairingTarget authData](self, "authData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAuthData:", v6);

  -[NRDevicePairingTarget properties](self, "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperties:", v7);

  -[NRDevicePairingTarget operationalProperties](self, "operationalProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOperationalProperties:", v8);

  return v4;
}

- (NRDevicePairingTarget)initWithCoder:(id)a3
{
  id v4;
  NRDevicePairingTarget *v5;
  NRDevicePairingTarget *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v12;
  NSObject *v13;
  _BOOL4 v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  objc_super v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NRDevicePairingTarget;
  v5 = -[NRDevicePairingTarget init](&v23, sel_init);
  if (!v5)
  {
    v12 = nrCopyLogObj_1090();
    v13 = v12;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v14 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);

      if (!v14)
      {
LABEL_8:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v21 = _os_log_pack_fill();
        *(_DWORD *)v21 = 136446210;
        *(_QWORD *)(v21 + 4) = "-[NRDevicePairingTarget initWithCoder:]";
        v22 = nrCopyLogObj_1090();
        _NRLogAbortWithPack(v22);
      }
    }
    v15 = nrCopyLogObj_1090();
    _NRLogWithArgs((uint64_t)v15, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v16, v17, v18, v19, v20, (uint64_t)");

    goto LABEL_8;
  }
  v6 = v5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("candidate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRDevicePairingTarget setCandidate:](v6, "setCandidate:", v7);

  -[NRDevicePairingTarget setAuthMethod:](v6, "setAuthMethod:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("authMethod")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRDevicePairingTarget setAuthData:](v6, "setAuthData:", v8);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("properties"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRDevicePairingTarget setProperties:](v6, "setProperties:", v9);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("operationalProperties"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRDevicePairingTarget setOperationalProperties:](v6, "setOperationalProperties:", v10);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[NRDevicePairingTarget candidate](self, "candidate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("candidate"));

  objc_msgSend(v4, "encodeInt64:forKey:", -[NRDevicePairingTarget authMethod](self, "authMethod"), CFSTR("authMethod"));
  -[NRDevicePairingTarget authData](self, "authData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("authData"));

  -[NRDevicePairingTarget properties](self, "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("properties"));

  -[NRDevicePairingTarget operationalProperties](self, "operationalProperties");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("operationalProperties"));

}

- (NRDevicePairingCandidate)candidate
{
  return self->_candidate;
}

- (void)setCandidate:(id)a3
{
  objc_storeStrong((id *)&self->_candidate, a3);
}

- (unint64_t)authMethod
{
  return self->_authMethod;
}

- (void)setAuthMethod:(unint64_t)a3
{
  self->_authMethod = a3;
}

- (NSData)authData
{
  return self->_authData;
}

- (void)setAuthData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NRDevicePairingProperties)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NRDeviceOperationalProperties)operationalProperties
{
  return self->_operationalProperties;
}

- (void)setOperationalProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationalProperties, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_authData, 0);
  objc_storeStrong((id *)&self->_candidate, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
