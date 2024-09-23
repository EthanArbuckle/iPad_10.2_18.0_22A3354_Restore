@implementation DAAlishaKeyInformation

+ (id)withEndpoint:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  KmlDeviceConfigurationData *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  unsigned int v38;
  void *v39;
  id v41;

  v3 = a3;
  v4 = objc_opt_new();
  objc_msgSend(v3, "friendlyName");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v5;

  objc_msgSend(v3, "subjectIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v7;

  objc_msgSend(v3, "readerInfo");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v9;

  objc_msgSend(v3, "invitationIdentifier");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v11;

  objc_msgSend(v3, "sharingSessionUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = objc_alloc(MEMORY[0x24BDD1880]);
    objc_msgSend(v3, "sharingSessionUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithUUIDString:", v15);
    v17 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = v16;

  }
  else
  {
    v15 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = 0;
  }

  objc_msgSend(v3, "ownerIDSIdentifier");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = *(void **)(v4 + 56);
  *(_QWORD *)(v4 + 56) = v18;

  objc_msgSend(v3, "trackingReceipt");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = *(void **)(v4 + 64);
  *(_QWORD *)(v4 + 64) = v20;

  objc_msgSend(v3, "revocationAttestation");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = *(void **)(v4 + 72);
  *(_QWORD *)(v4 + 72) = v22;

  objc_msgSend(v3, "trackingRequest");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    objc_msgSend(v3, "trackingRequest");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    +[DAAlishaKeyEncryptedRequest decodeWithData:error:](DAAlishaKeyEncryptedRequest, "decodeWithData:error:", v26, &v41);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v41;
    v29 = *(void **)(v4 + 80);
    *(_QWORD *)(v4 + 80) = v27;

    if (v28)
      NSLog(CFSTR("DAAlishaKeyEncryptedRequest decodeWithData error: %@"), v28);
  }
  else
  {
    v30 = *(void **)(v4 + 80);
    *(_QWORD *)(v4 + 80) = 0;

    v28 = 0;
  }
  v31 = [KmlDeviceConfigurationData alloc];
  objc_msgSend(v3, "deviceConfiguration");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)-[KmlDeviceConfigurationData initWithData:]((uint64_t)v31, v32);

  *(_BYTE *)(v4 + 8) = -[KmlDeviceConfigurationData isFriendImmoTokenOrSlotOnline]((uint64_t)v33);
  -[KmlDeviceConfigurationData readerSupportedTransports]((uint64_t)v33);
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = *(void **)(v4 + 96);
  *(_QWORD *)(v4 + 96) = v34;

  *(_BYTE *)(v4 + 9) = -[KmlDeviceConfigurationData sharingPasswordRequired]((_BOOL8)v33);
  v36 = (void *)-[KmlVersions initWithEndpoint:]((uint64_t)[KmlVersions alloc], v3);
  *(_QWORD *)(v4 + 104) = objc_msgSend(v36, "agreedKmlVehicleVersion");
  *(_QWORD *)(v4 + 112) = objc_msgSend(v36, "agreedAppletVehicleVersion");
  *(_QWORD *)(v4 + 120) = objc_msgSend(v36, "agreedKmlVehicleServerVersion");
  objc_msgSend(v3, "configuration");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "opt2");

  *(_BYTE *)(v4 + 11) = kmlUtilIsFleetKey(v38);
  *(_BYTE *)(v4 + 10) = kmlUtilIsServerIssuedKey(v38);
  objc_msgSend(v3, "longTermSharedSecret");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(v4 + 88) = objc_msgSend(v39, "length");

  return (id)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[DAAlishaKeyInformation name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v4, CFSTR("name"));

  -[DAAlishaKeyInformation localIdentifier](self, "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v5, CFSTR("localIdentifier"));

  -[DAAlishaKeyInformation pairedEntityIdentifier](self, "pairedEntityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v6, CFSTR("pairedEntityIdentifier"));

  -[DAAlishaKeyInformation invitationIdentifier](self, "invitationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v7, CFSTR("invitationIdentifier"));

  -[DAAlishaKeyInformation sharingSessionUUID](self, "sharingSessionUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v8, CFSTR("sharingSessionUUID"));

  -[DAAlishaKeyInformation ownerIDSIdentifier](self, "ownerIDSIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v9, CFSTR("ownerIDSIdentifier"));

  -[DAAlishaKeyInformation trackingReceipt](self, "trackingReceipt");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v10, CFSTR("trackingReceipt"));

  -[DAAlishaKeyInformation revocationAttestation](self, "revocationAttestation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v11, CFSTR("revocationAttestation"));

  -[DAAlishaKeyInformation trackingRequest](self, "trackingRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v12, CFSTR("trackingRequest"));

  objc_msgSend(v14, "encodeBool:forKey:", -[DAAlishaKeyInformation onlineImmobilizerToken](self, "onlineImmobilizerToken"), CFSTR("onlineImmobilizerToken"));
  -[DAAlishaKeyInformation supportedTransports](self, "supportedTransports");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v13, CFSTR("supportedTransports"));

  objc_msgSend(v14, "encodeBool:forKey:", -[DAAlishaKeyInformation vehicleSupportsSharingPassword](self, "vehicleSupportsSharingPassword"), CFSTR("vehicleSupportsSharingPassword"));
  objc_msgSend(v14, "encodeInt:forKey:", -[DAAlishaKeyInformation longTermSharedSecretLength](self, "longTermSharedSecretLength"), CFSTR("longTermSharedSecretLength"));
  objc_msgSend(v14, "encodeInt:forKey:", -[DAAlishaKeyInformation agreedFrameworkVersion](self, "agreedFrameworkVersion"), CFSTR("agreedFrameworkVersion"));
  objc_msgSend(v14, "encodeInt:forKey:", -[DAAlishaKeyInformation agreedAppletVersion](self, "agreedAppletVersion"), CFSTR("agreedAppletVersion"));
  objc_msgSend(v14, "encodeInt:forKey:", -[DAAlishaKeyInformation agreedVehicleServerVersion](self, "agreedVehicleServerVersion"), CFSTR("agreedVehicleServerVersion"));
  objc_msgSend(v14, "encodeBool:forKey:", -[DAAlishaKeyInformation fleetVehicle](self, "fleetVehicle"), CFSTR("isFleetVehicle"));
  objc_msgSend(v14, "encodeBool:forKey:", -[DAAlishaKeyInformation serverIssued](self, "serverIssued"), CFSTR("isServerIssued"));

}

- (DAAlishaKeyInformation)initWithCoder:(id)a3
{
  id v4;
  DAAlishaKeyInformation *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *localIdentifier;
  uint64_t v10;
  NSString *pairedEntityIdentifier;
  uint64_t v12;
  NSString *invitationIdentifier;
  uint64_t v14;
  NSUUID *sharingSessionUUID;
  uint64_t v16;
  NSString *ownerIDSIdentifier;
  uint64_t v18;
  NSData *trackingReceipt;
  uint64_t v20;
  NSData *revocationAttestation;
  uint64_t v22;
  DAAlishaKeyEncryptedRequest *trackingRequest;
  uint64_t v24;
  NSArray *supportedTransports;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)DAAlishaKeyInformation;
  v5 = -[DAAlishaKeyInformation init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    localIdentifier = v5->_localIdentifier;
    v5->_localIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pairedEntityIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    pairedEntityIdentifier = v5->_pairedEntityIdentifier;
    v5->_pairedEntityIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("invitationIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    invitationIdentifier = v5->_invitationIdentifier;
    v5->_invitationIdentifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharingSessionUUID"));
    v14 = objc_claimAutoreleasedReturnValue();
    sharingSessionUUID = v5->_sharingSessionUUID;
    v5->_sharingSessionUUID = (NSUUID *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ownerIDSIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    ownerIDSIdentifier = v5->_ownerIDSIdentifier;
    v5->_ownerIDSIdentifier = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trackingReceipt"));
    v18 = objc_claimAutoreleasedReturnValue();
    trackingReceipt = v5->_trackingReceipt;
    v5->_trackingReceipt = (NSData *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("revocationAttestation"));
    v20 = objc_claimAutoreleasedReturnValue();
    revocationAttestation = v5->_revocationAttestation;
    v5->_revocationAttestation = (NSData *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trackingRequest"));
    v22 = objc_claimAutoreleasedReturnValue();
    trackingRequest = v5->_trackingRequest;
    v5->_trackingRequest = (DAAlishaKeyEncryptedRequest *)v22;

    v5->_onlineImmobilizerToken = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("onlineImmobilizerToken"));
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("supportedTransports"));
    v24 = objc_claimAutoreleasedReturnValue();
    supportedTransports = v5->_supportedTransports;
    v5->_supportedTransports = (NSArray *)v24;

    v5->_vehicleSupportsSharingPassword = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("vehicleSupportsSharingPassword"));
    v5->_longTermSharedSecretLength = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("longTermSharedSecretLength"));
    v5->_agreedFrameworkVersion = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("agreedFrameworkVersion"));
    v5->_agreedAppletVersion = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("agreedAppletVersion"));
    v5->_agreedVehicleServerVersion = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("agreedVehicleServerVersion"));
    v5->_fleetVehicle = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isFleetVehicle"));
    v5->_serverIssued = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isServerIssued"));
  }

  return v5;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Alisha Key Information:\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    KeyName         : %@\n"), self->_name);
  objc_msgSend(v3, "appendFormat:", CFSTR("    KeyLocalId      : %@\n"), self->_localIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("    ReaderId        : %@\n"), self->_pairedEntityIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("    InvitationId    : %@\n"), self->_invitationIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("    Session UUID    : %@\n"), self->_sharingSessionUUID);
  objc_msgSend(v3, "appendFormat:", CFSTR("    OwnerIDSId      : %@\n"), self->_ownerIDSIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("    OnlineImmoToken : %d\n"), self->_onlineImmobilizerToken);
  if (self->_fleetVehicle)
    v4 = CFSTR("Fleet");
  else
    v4 = CFSTR("Private");
  objc_msgSend(v3, "appendFormat:", CFSTR("    VehicleType     : %@\n"), v4);
  if (self->_serverIssued)
    v5 = CFSTR("Server");
  else
    v5 = CFSTR("Device");
  objc_msgSend(v3, "appendFormat:", CFSTR("    KeyIssueSource  : %@\n"), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR("    VEP supported   : %d\n"), self->_vehicleSupportsSharingPassword);
  objc_msgSend(v3, "appendFormat:", CFSTR("    LongTermSecretLength   : %lu\n"), self->_longTermSharedSecretLength);
  objc_msgSend(v3, "appendFormat:", CFSTR("    SupportedTransports :"));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_supportedTransports;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        DAKeyTransportTypeAsString((int)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "shortValue"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@,"), v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  kmlUtilHexStringFromData(self->_trackingReceipt);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  TrackingReceipt : %@\n"), v12);

  kmlUtilHexStringFromData(self->_revocationAttestation);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    RevocationAttestation : %@\n"), v13);

  objc_msgSend(v3, "appendFormat:", CFSTR("    TrackingRequest : { %@ }\n"), self->_trackingRequest);
  objc_msgSend(v3, "appendFormat:", CFSTR("    AgreedFrameworkVersion       : %02lx\n"), self->_agreedFrameworkVersion);
  objc_msgSend(v3, "appendFormat:", CFSTR("    AgreedAppletVersion          : %02lx\n"), self->_agreedAppletVersion);
  objc_msgSend(v3, "appendFormat:", CFSTR("    AgreedVehicleServerVersion   : %02lx\n"), self->_agreedVehicleServerVersion);
  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (NSString)pairedEntityIdentifier
{
  return self->_pairedEntityIdentifier;
}

- (NSString)invitationIdentifier
{
  return self->_invitationIdentifier;
}

- (NSUUID)sharingSessionUUID
{
  return self->_sharingSessionUUID;
}

- (NSString)ownerIDSIdentifier
{
  return self->_ownerIDSIdentifier;
}

- (NSData)trackingReceipt
{
  return self->_trackingReceipt;
}

- (NSData)revocationAttestation
{
  return self->_revocationAttestation;
}

- (DAAlishaKeyEncryptedRequest)trackingRequest
{
  return self->_trackingRequest;
}

- (BOOL)onlineImmobilizerToken
{
  return self->_onlineImmobilizerToken;
}

- (BOOL)vehicleSupportsSharingPassword
{
  return self->_vehicleSupportsSharingPassword;
}

- (unint64_t)longTermSharedSecretLength
{
  return self->_longTermSharedSecretLength;
}

- (NSArray)supportedTransports
{
  return self->_supportedTransports;
}

- (unint64_t)agreedFrameworkVersion
{
  return self->_agreedFrameworkVersion;
}

- (unint64_t)agreedAppletVersion
{
  return self->_agreedAppletVersion;
}

- (unint64_t)agreedVehicleServerVersion
{
  return self->_agreedVehicleServerVersion;
}

- (BOOL)serverIssued
{
  return self->_serverIssued;
}

- (BOOL)fleetVehicle
{
  return self->_fleetVehicle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedTransports, 0);
  objc_storeStrong((id *)&self->_trackingRequest, 0);
  objc_storeStrong((id *)&self->_revocationAttestation, 0);
  objc_storeStrong((id *)&self->_trackingReceipt, 0);
  objc_storeStrong((id *)&self->_ownerIDSIdentifier, 0);
  objc_storeStrong((id *)&self->_sharingSessionUUID, 0);
  objc_storeStrong((id *)&self->_invitationIdentifier, 0);
  objc_storeStrong((id *)&self->_pairedEntityIdentifier, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
