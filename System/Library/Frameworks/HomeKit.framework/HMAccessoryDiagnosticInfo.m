@implementation HMAccessoryDiagnosticInfo

- (HMAccessoryDiagnosticInfo)initWithProtoData:(id)a3
{
  id v4;
  HMAccessoryDiagnosticInfo *v5;
  HMAccessoryDiagnosticInfoProtoDiagnosticInfo *v6;
  HMAccessoryDiagnosticInfoProtoDiagnosticInfo *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *currentAccessoryMediaRouteId;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSUUID *currentAccessoryUUID;
  void *v22;
  void *v23;
  uint64_t v24;
  NSString *idsIdentifier;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSDate *serverLastConnected;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const __CFString *v43;
  uint64_t v44;
  __CFString *v45;
  void *v46;
  NSString *connectedClientsDescription;
  void *v48;
  void *v49;
  uint64_t v50;
  HMFWiFiNetworkInfo *wifiInfo;
  uint64_t v52;
  NSString *model;
  uint64_t v54;
  NSString *manufacturer;
  uint64_t v56;
  NSString *serialNumber;
  id v58;
  void *v59;
  uint64_t v60;
  HMFSoftwareVersion *softwareVersion;
  HMSoftwareUpdateDescriptor *v62;
  void *v63;
  uint64_t v64;
  HMSoftwareUpdateDescriptor *softwareUpdateDescriptor;
  HMSoftwareUpdateProgress *v66;
  void *v67;
  uint64_t v68;
  HMSoftwareUpdateProgress *softwareUpdateProgress;
  HMAccessoryDiagnosticInfoProtoDiagnosticInfo *v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  objc_super v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v77.receiver = self;
  v77.super_class = (Class)HMAccessoryDiagnosticInfo;
  v5 = -[HMAccessoryDiagnosticInfo init](&v77, sel_init);
  if (v5)
  {
    v6 = -[HMAccessoryDiagnosticInfoProtoDiagnosticInfo initWithData:]([HMAccessoryDiagnosticInfoProtoDiagnosticInfo alloc], "initWithData:", v4);
    v7 = v6;
    if (v6)
    {
      v5->_version = -[HMAccessoryDiagnosticInfoProtoDiagnosticInfo version](v6, "version");
      if (-[HMAccessoryDiagnosticInfoProtoDiagnosticInfo hasAppleMediaAccessoryDiagnosticInfo](v7, "hasAppleMediaAccessoryDiagnosticInfo"))
      {
        -[HMAccessoryDiagnosticInfoProtoDiagnosticInfo appleMediaAccessoryDiagnosticInfo](v7, "appleMediaAccessoryDiagnosticInfo");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "cloudInfo");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_cloudkitAccountStatusGood = objc_msgSend(v9, "cloudState") == 1;

        objc_msgSend(v8, "cloudInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_cdpStatusGood = objc_msgSend(v10, "octagonState") == 1;

        objc_msgSend(v8, "cloudInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_firstCloudImportDone = objc_msgSend(v11, "firstCloudImportComplete");

        objc_msgSend(v8, "mediaRouteIdString");
        v12 = objc_claimAutoreleasedReturnValue();
        currentAccessoryMediaRouteId = v5->_currentAccessoryMediaRouteId;
        v5->_currentAccessoryMediaRouteId = (NSString *)v12;

        objc_msgSend(v8, "currentAccessoryInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v8, "currentAccessoryInfo");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "uuidString");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            v17 = objc_alloc(MEMORY[0x1E0CB3A28]);
            objc_msgSend(v8, "currentAccessoryInfo");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "uuidString");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v17, "initWithUUIDString:", v19);
            currentAccessoryUUID = v5->_currentAccessoryUUID;
            v5->_currentAccessoryUUID = (NSUUID *)v20;

          }
        }
        objc_msgSend(v8, "idsInfo");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          objc_msgSend(v8, "idsInfo");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "idsIdentifierString");
          v24 = objc_claimAutoreleasedReturnValue();
          idsIdentifier = v5->_idsIdentifier;
          v5->_idsIdentifier = (NSString *)v24;

          objc_msgSend(v8, "idsInfo");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v5->_idsStatusGood = objc_msgSend(v26, "idsState") == 1;

        }
        objc_msgSend(v8, "eventRouterServerInfo");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          objc_msgSend(v8, "eventRouterServerInfo");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v5->_isEventRouterServerConnected = objc_msgSend(v28, "connectionState") == 1;

          objc_msgSend(v8, "eventRouterServerInfo");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "hasLastConnected");

          if (v30)
          {
            v31 = (void *)MEMORY[0x1E0C99D68];
            objc_msgSend(v8, "eventRouterServerInfo");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "lastConnected");
            objc_msgSend(v31, "dateWithTimeIntervalSinceReferenceDate:");
            v33 = objc_claimAutoreleasedReturnValue();
            serverLastConnected = v5->_serverLastConnected;
            v5->_serverLastConnected = (NSDate *)v33;

          }
          objc_msgSend(v8, "eventRouterServerInfo");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "connectedClients");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "count");

          if (v37)
          {
            v71 = v7;
            v72 = v4;
            v75 = 0u;
            v76 = 0u;
            v73 = 0u;
            v74 = 0u;
            objc_msgSend(v8, "eventRouterServerInfo");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "connectedClients");
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
            if (v40)
            {
              v41 = v40;
              v42 = *(_QWORD *)v74;
              v43 = &stru_1E3AB7688;
              do
              {
                v44 = 0;
                v45 = (__CFString *)v43;
                do
                {
                  if (*(_QWORD *)v74 != v42)
                    objc_enumerationMutation(v39);
                  objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * v44), "connectedClientIdentifierString");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  -[__CFString stringByAppendingFormat:](v45, "stringByAppendingFormat:", CFSTR(" %@"), v46);
                  v43 = (const __CFString *)objc_claimAutoreleasedReturnValue();

                  ++v44;
                  v45 = (__CFString *)v43;
                }
                while (v41 != v44);
                v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
              }
              while (v41);
            }
            else
            {
              v43 = &stru_1E3AB7688;
            }

            connectedClientsDescription = v5->_connectedClientsDescription;
            v5->_connectedClientsDescription = &v43->isa;

            v7 = v71;
            v4 = v72;
          }
        }
        if (objc_msgSend(v8, "hasWifiInfo"))
        {
          v48 = (void *)MEMORY[0x1E0D286F0];
          objc_msgSend(v8, "wifiInfo");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "wifiNetworkInfoFromProto:", v49);
          v50 = objc_claimAutoreleasedReturnValue();
          wifiInfo = v5->_wifiInfo;
          v5->_wifiInfo = (HMFWiFiNetworkInfo *)v50;

        }
        objc_msgSend(v8, "modelIdentifier");
        v52 = objc_claimAutoreleasedReturnValue();
        model = v5->_model;
        v5->_model = (NSString *)v52;

        objc_msgSend(v8, "manufacturer");
        v54 = objc_claimAutoreleasedReturnValue();
        manufacturer = v5->_manufacturer;
        v5->_manufacturer = (NSString *)v54;

        objc_msgSend(v8, "serialNumber");
        v56 = objc_claimAutoreleasedReturnValue();
        serialNumber = v5->_serialNumber;
        v5->_serialNumber = (NSString *)v56;

        if (objc_msgSend(v8, "hasSoftwareVersion"))
        {
          v58 = objc_alloc(MEMORY[0x1E0D286A0]);
          objc_msgSend(v8, "softwareVersion");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = objc_msgSend(v58, "initWithVersionString:", v59);
          softwareVersion = v5->_softwareVersion;
          v5->_softwareVersion = (HMFSoftwareVersion *)v60;

        }
        if (objc_msgSend(v8, "hasSoftwareUpdateDescriptor"))
        {
          v62 = [HMSoftwareUpdateDescriptor alloc];
          objc_msgSend(v8, "softwareUpdateDescriptor");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = -[HMSoftwareUpdateDescriptor initWithProtoPayload:](v62, "initWithProtoPayload:", v63);
          softwareUpdateDescriptor = v5->_softwareUpdateDescriptor;
          v5->_softwareUpdateDescriptor = (HMSoftwareUpdateDescriptor *)v64;

        }
        if (objc_msgSend(v8, "hasSoftwareUpdateProgress"))
        {
          v66 = [HMSoftwareUpdateProgress alloc];
          objc_msgSend(v8, "softwareUpdateProgress");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = -[HMSoftwareUpdateProgress initWithProtoPayload:](v66, "initWithProtoPayload:", v67);
          softwareUpdateProgress = v5->_softwareUpdateProgress;
          v5->_softwareUpdateProgress = (HMSoftwareUpdateProgress *)v68;

        }
      }
      if (-[HMAccessoryDiagnosticInfoProtoDiagnosticInfo hasPrimaryResidentDiagnosticInfo](v7, "hasPrimaryResidentDiagnosticInfo"))
      {
        v5->_isPrimaryResident = 1;
      }
      v5->_numHomes = -[HMAccessoryDiagnosticInfoProtoDiagnosticInfo numHomes](v7, "numHomes");
      v5->_isRunningHH2 = -[HMAccessoryDiagnosticInfoProtoDiagnosticInfo homeHubVersion](v7, "homeHubVersion") == 2;
    }

  }
  return v5;
}

- (HMSoftwareUpdateV2)softwareUpdate
{
  void *v2;
  void *v3;

  -[HMAccessoryDiagnosticInfo softwareUpdateDescriptor](self, "softwareUpdateDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[HMSoftwareUpdateV2 softwareUpdateFromDescriptor:](HMSoftwareUpdateV2, "softwareUpdateFromDescriptor:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (HMSoftwareUpdateV2 *)v3;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v12;
  unint64_t v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  _BOOL4 v22;
  _BOOL4 v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;

  v26 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[HMAccessoryDiagnosticInfo cloudkitAccountStatusGood](self, "cloudkitAccountStatusGood");
  v23 = -[HMAccessoryDiagnosticInfo cdpStatusGood](self, "cdpStatusGood");
  v22 = -[HMAccessoryDiagnosticInfo firstCloudImportDone](self, "firstCloudImportDone");
  v21 = -[HMAccessoryDiagnosticInfo idsStatusGood](self, "idsStatusGood");
  -[HMAccessoryDiagnosticInfo idsIdentifier](self, "idsIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryDiagnosticInfo manufacturer](self, "manufacturer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryDiagnosticInfo model](self, "model");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryDiagnosticInfo serialNumber](self, "serialNumber");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryDiagnosticInfo softwareVersion](self, "softwareVersion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryDiagnosticInfo softwareUpdateDescriptor](self, "softwareUpdateDescriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryDiagnosticInfo softwareUpdateProgress](self, "softwareUpdateProgress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HMAccessoryDiagnosticInfo isRunningHH2](self, "isRunningHH2");
  v13 = -[HMAccessoryDiagnosticInfo numHomes](self, "numHomes");
  -[HMAccessoryDiagnosticInfo currentAccessoryUUID](self, "currentAccessoryUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryDiagnosticInfo currentAccessoryMediaRouteId](self, "currentAccessoryMediaRouteId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMAccessoryDiagnosticInfo isPrimaryResident](self, "isPrimaryResident");
  -[HMAccessoryDiagnosticInfo wifiInfo](self, "wifiInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMAccessoryDiagnosticInfo isEventRouterServerConnected](self, "isEventRouterServerConnected");
  -[HMAccessoryDiagnosticInfo serverLastConnected](self, "serverLastConnected");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryDiagnosticInfo connectedClientsDescription](self, "connectedClientsDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", CFSTR("<%@ [cloudkit=> accountStatus: %d, cdp: %d, firstImport: %d>] [ids=> status: %d identifier: %@ ] [device=> %@ - %@ - %@, s/w: %@, upd: (%@, %@)] hh2: %d, numHomes: %lu, uuid: %@, mediaRouteID: %@, isPrimary: %d, wifi: %@, [eventrouter=> connected: %d date: %@, clients: %@] >"), v25, v24, v23, v22, v21, v20, v19, v18, v16, v17, v14, v4, v15, v13, v12, v5,
    v6,
    v7,
    v8,
    v9,
    v10);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (BOOL)cloudkitAccountStatusGood
{
  return self->_cloudkitAccountStatusGood;
}

- (BOOL)cdpStatusGood
{
  return self->_cdpStatusGood;
}

- (BOOL)firstCloudImportDone
{
  return self->_firstCloudImportDone;
}

- (BOOL)isRunningHH2
{
  return self->_isRunningHH2;
}

- (unint64_t)numHomes
{
  return self->_numHomes;
}

- (NSUUID)currentAccessoryUUID
{
  return self->_currentAccessoryUUID;
}

- (NSString)currentAccessoryMediaRouteId
{
  return self->_currentAccessoryMediaRouteId;
}

- (BOOL)idsStatusGood
{
  return self->_idsStatusGood;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (HMFWiFiNetworkInfo)wifiInfo
{
  return self->_wifiInfo;
}

- (BOOL)isEventRouterServerConnected
{
  return self->_isEventRouterServerConnected;
}

- (NSDate)serverLastConnected
{
  return self->_serverLastConnected;
}

- (BOOL)isPrimaryResident
{
  return self->_isPrimaryResident;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (HMFSoftwareVersion)softwareVersion
{
  return self->_softwareVersion;
}

- (HMSoftwareUpdateDescriptor)softwareUpdateDescriptor
{
  return self->_softwareUpdateDescriptor;
}

- (HMSoftwareUpdateProgress)softwareUpdateProgress
{
  return self->_softwareUpdateProgress;
}

- (unint64_t)version
{
  return self->_version;
}

- (NSString)connectedClientsDescription
{
  return self->_connectedClientsDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectedClientsDescription, 0);
  objc_storeStrong((id *)&self->_softwareUpdateProgress, 0);
  objc_storeStrong((id *)&self->_softwareUpdateDescriptor, 0);
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_serverLastConnected, 0);
  objc_storeStrong((id *)&self->_wifiInfo, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_currentAccessoryMediaRouteId, 0);
  objc_storeStrong((id *)&self->_currentAccessoryUUID, 0);
}

@end
