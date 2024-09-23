@implementation NRDevicePairingProperties

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NRDevicePairingProperties;
  v4 = -[NRDeviceProperties copyWithZone:](&v12, sel_copyWithZone_, a3);
  -[NRDevicePairingProperties outOfBandKey](self, "outOfBandKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setOutOfBandKey:", v6);

  objc_msgSend(v4, "setWasInitiallySetupUsingIDSPairing:", -[NRDevicePairingProperties wasInitiallySetupUsingIDSPairing](self, "wasInitiallySetupUsingIDSPairing"));
  objc_msgSend(v4, "setPairWithSPPLink:", -[NRDevicePairingProperties pairWithSPPLink](self, "pairWithSPPLink"));
  objc_msgSend(v4, "setIsAltAccountPairing:", -[NRDevicePairingProperties isAltAccountPairing](self, "isAltAccountPairing"));
  -[NRDevicePairingProperties bluetoothMACAddress](self, "bluetoothMACAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setBluetoothMACAddress:", v8);

  -[NRDevicePairingProperties peerEndpointDictionary](self, "peerEndpointDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setPeerEndpointDictionary:", v10);

  return v4;
}

- (NRDevicePairingProperties)initWithCoder:(id)a3
{
  id v4;
  NRDevicePairingProperties *v5;
  NRDevicePairingProperties *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v11;
  NSObject *v12;
  _BOOL4 v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  objc_super v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)NRDevicePairingProperties;
  v5 = -[NRDeviceProperties initWithCoder:](&v22, sel_initWithCoder_, v4);
  if (!v5)
  {
    v11 = nrCopyLogObj_896();
    v12 = v11;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v13 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

      if (!v13)
      {
LABEL_8:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v20 = _os_log_pack_fill();
        *(_DWORD *)v20 = 136446210;
        *(_QWORD *)(v20 + 4) = "-[NRDevicePairingProperties initWithCoder:]";
        v21 = nrCopyLogObj_896();
        _NRLogAbortWithPack(v21);
      }
    }
    v14 = nrCopyLogObj_896();
    _NRLogWithArgs((uint64_t)v14, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super initWithCoder:] failed", v15, v16, v17, v18, v19, (uint64_t)");

    goto LABEL_8;
  }
  v6 = v5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("outOfBandKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRDevicePairingProperties setOutOfBandKey:](v6, "setOutOfBandKey:", v7);

  -[NRDevicePairingProperties setWasInitiallySetupUsingIDSPairing:](v6, "setWasInitiallySetupUsingIDSPairing:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wasInitiallySetupUsingIDSPairing")));
  -[NRDevicePairingProperties setPairWithSPPLink:](v6, "setPairWithSPPLink:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pairWithSPPLink")));
  -[NRDevicePairingProperties setIsAltAccountPairing:](v6, "setIsAltAccountPairing:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAltAccountPairing")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bluetoothMACAddress"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRDevicePairingProperties setBluetoothMACAddress:](v6, "setBluetoothMACAddress:", v8);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("peerEndpointDictionary"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRDevicePairingProperties setPeerEndpointDictionary:](v6, "setPeerEndpointDictionary:", v9);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NRDevicePairingProperties;
  v4 = a3;
  -[NRDeviceProperties encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[NRDevicePairingProperties outOfBandKey](self, "outOfBandKey", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("outOfBandKey"));

  objc_msgSend(v4, "encodeBool:forKey:", -[NRDevicePairingProperties wasInitiallySetupUsingIDSPairing](self, "wasInitiallySetupUsingIDSPairing"), CFSTR("wasInitiallySetupUsingIDSPairing"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NRDevicePairingProperties pairWithSPPLink](self, "pairWithSPPLink"), CFSTR("pairWithSPPLink"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NRDevicePairingProperties isAltAccountPairing](self, "isAltAccountPairing"), CFSTR("isAltAccountPairing"));
  -[NRDevicePairingProperties bluetoothMACAddress](self, "bluetoothMACAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bluetoothMACAddress"));

  -[NRDevicePairingProperties peerEndpointDictionary](self, "peerEndpointDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("peerEndpointDictionary"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *LogString;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("[NRDevicePairProp pairProtVers=%llu/nr:%u"), -[NRDeviceProperties pairingProtocolVersion](self, "pairingProtocolVersion"), -[NRDeviceProperties peerNetworkRelayVersion](self, "peerNetworkRelayVersion"));
  -[NRDevicePairingProperties outOfBandKey](self, "outOfBandKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NRDevicePairingProperties outOfBandKey](self, "outOfBandKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LogString = (__CFString *)_NRKeyCreateLogString(v5);
    objc_msgSend(v3, "appendFormat:", CFSTR(", oobk %@"), LogString);

  }
  if (-[NRDevicePairingProperties wasInitiallySetupUsingIDSPairing](self, "wasInitiallySetupUsingIDSPairing"))
    objc_msgSend(v3, "appendString:", CFSTR(", IDS"));
  if (-[NRDevicePairingProperties pairWithSPPLink](self, "pairWithSPPLink"))
    objc_msgSend(v3, "appendString:", CFSTR(", SPP"));
  if (-[NRDevicePairingProperties isAltAccountPairing](self, "isAltAccountPairing"))
    objc_msgSend(v3, "appendString:", CFSTR(", ALT-ACC"));
  -[NRDevicePairingProperties bluetoothMACAddress](self, "bluetoothMACAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NRDevicePairingProperties bluetoothMACAddress](self, "bluetoothMACAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = _NRCreateMACAddressString(v8);
    objc_msgSend(v3, "appendFormat:", CFSTR(", btMAC %@"), v9);

  }
  -[NRDevicePairingProperties peerEndpointDictionary](self, "peerEndpointDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NRDevicePairingProperties peerEndpointDictionary](self, "peerEndpointDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", peerIP %@"), v11);

  }
  objc_msgSend(v3, "appendString:", CFSTR("]"));
  return v3;
}

- (void)setAwdlAddressData:(id)a3
{
  NSDictionary *v4;
  uint64_t v5;
  void *v6;
  NSDictionary *peerEndpointDictionary;
  id v8;

  v8 = a3;
  v4 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (self->_peerEndpointDictionary)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", self->_peerEndpointDictionary);

    v4 = (NSDictionary *)v5;
  }
  objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithAddress:", objc_msgSend(v8, "bytes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v6, &unk_1EA400FC0);

  peerEndpointDictionary = self->_peerEndpointDictionary;
  self->_peerEndpointDictionary = v4;

}

- (NSData)awdlAddressData
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKeyedSubscript:](self->_peerEndpointDictionary, "objectForKeyedSubscript:", &unk_1EA400FC0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addressData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (NSData)outOfBandKey
{
  return self->_outOfBandKey;
}

- (void)setOutOfBandKey:(id)a3
{
  objc_storeStrong((id *)&self->_outOfBandKey, a3);
}

- (BOOL)wasInitiallySetupUsingIDSPairing
{
  return self->_wasInitiallySetupUsingIDSPairing;
}

- (void)setWasInitiallySetupUsingIDSPairing:(BOOL)a3
{
  self->_wasInitiallySetupUsingIDSPairing = a3;
}

- (BOOL)pairWithSPPLink
{
  return self->_pairWithSPPLink;
}

- (void)setPairWithSPPLink:(BOOL)a3
{
  self->_pairWithSPPLink = a3;
}

- (BOOL)isAltAccountPairing
{
  return self->_isAltAccountPairing;
}

- (void)setIsAltAccountPairing:(BOOL)a3
{
  self->_isAltAccountPairing = a3;
}

- (NSData)bluetoothMACAddress
{
  return self->_bluetoothMACAddress;
}

- (void)setBluetoothMACAddress:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothMACAddress, a3);
}

- (NSDictionary)peerEndpointDictionary
{
  return self->_peerEndpointDictionary;
}

- (void)setPeerEndpointDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_peerEndpointDictionary, a3);
}

- (NSString)candidateService
{
  return self->_candidateService;
}

- (void)setCandidateService:(id)a3
{
  objc_storeStrong((id *)&self->_candidateService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateService, 0);
  objc_storeStrong((id *)&self->_peerEndpointDictionary, 0);
  objc_storeStrong((id *)&self->_bluetoothMACAddress, 0);
  objc_storeStrong((id *)&self->_outOfBandKey, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
