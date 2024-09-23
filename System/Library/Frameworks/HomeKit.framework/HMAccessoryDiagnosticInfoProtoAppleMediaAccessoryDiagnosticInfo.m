@implementation HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo

- (BOOL)hasMediaRouteIdString
{
  return self->_mediaRouteIdString != 0;
}

- (BOOL)hasWifiInfo
{
  return self->_wifiInfo != 0;
}

- (BOOL)hasCurrentAccessoryInfo
{
  return self->_currentAccessoryInfo != 0;
}

- (BOOL)hasCloudInfo
{
  return self->_cloudInfo != 0;
}

- (BOOL)hasIdsInfo
{
  return self->_idsInfo != 0;
}

- (BOOL)hasEventRouterServerInfo
{
  return self->_eventRouterServerInfo != 0;
}

- (void)setGenerationTime:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_generationTime = a3;
}

- (void)setHasGenerationTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGenerationTime
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasSerialNumber
{
  return self->_serialNumber != 0;
}

- (BOOL)hasModelIdentifier
{
  return self->_modelIdentifier != 0;
}

- (BOOL)hasSoftwareVersion
{
  return self->_softwareVersion != 0;
}

- (BOOL)hasRegionInfo
{
  return self->_regionInfo != 0;
}

- (BOOL)hasManufacturer
{
  return self->_manufacturer != 0;
}

- (BOOL)hasSoftwareUpdateDescriptor
{
  return self->_softwareUpdateDescriptor != 0;
}

- (BOOL)hasSoftwareUpdateProgress
{
  return self->_softwareUpdateProgress != 0;
}

- (void)setSfProblemFlags:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_sfProblemFlags = a3;
}

- (void)setHasSfProblemFlags:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSfProblemFlags
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)clearNetworkInfos
{
  -[NSMutableArray removeAllObjects](self->_networkInfos, "removeAllObjects");
}

- (void)addNetworkInfo:(id)a3
{
  id v4;
  NSMutableArray *networkInfos;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  networkInfos = self->_networkInfos;
  v8 = v4;
  if (!networkInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_networkInfos;
    self->_networkInfos = v6;

    v4 = v8;
    networkInfos = self->_networkInfos;
  }
  -[NSMutableArray addObject:](networkInfos, "addObject:", v4);

}

- (unint64_t)networkInfosCount
{
  return -[NSMutableArray count](self->_networkInfos, "count");
}

- (id)networkInfoAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_networkInfos, "objectAtIndex:", a3);
}

- (void)clearNetworkServiceInfos
{
  -[NSMutableArray removeAllObjects](self->_networkServiceInfos, "removeAllObjects");
}

- (void)addNetworkServiceInfo:(id)a3
{
  id v4;
  NSMutableArray *networkServiceInfos;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  networkServiceInfos = self->_networkServiceInfos;
  v8 = v4;
  if (!networkServiceInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_networkServiceInfos;
    self->_networkServiceInfos = v6;

    v4 = v8;
    networkServiceInfos = self->_networkServiceInfos;
  }
  -[NSMutableArray addObject:](networkServiceInfos, "addObject:", v4);

}

- (unint64_t)networkServiceInfosCount
{
  return -[NSMutableArray count](self->_networkServiceInfos, "count");
}

- (id)networkServiceInfoAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_networkServiceInfos, "objectAtIndex:", a3);
}

- (void)clearNetworkVisibleDeviceInfos
{
  -[NSMutableArray removeAllObjects](self->_networkVisibleDeviceInfos, "removeAllObjects");
}

- (void)addNetworkVisibleDeviceInfos:(id)a3
{
  id v4;
  NSMutableArray *networkVisibleDeviceInfos;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  networkVisibleDeviceInfos = self->_networkVisibleDeviceInfos;
  v8 = v4;
  if (!networkVisibleDeviceInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_networkVisibleDeviceInfos;
    self->_networkVisibleDeviceInfos = v6;

    v4 = v8;
    networkVisibleDeviceInfos = self->_networkVisibleDeviceInfos;
  }
  -[NSMutableArray addObject:](networkVisibleDeviceInfos, "addObject:", v4);

}

- (unint64_t)networkVisibleDeviceInfosCount
{
  return -[NSMutableArray count](self->_networkVisibleDeviceInfos, "count");
}

- (id)networkVisibleDeviceInfosAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_networkVisibleDeviceInfos, "objectAtIndex:", a3);
}

- (void)clearNearbyVisibleDeviceInfos
{
  -[NSMutableArray removeAllObjects](self->_nearbyVisibleDeviceInfos, "removeAllObjects");
}

- (void)addNearbyVisibleDeviceInfos:(id)a3
{
  id v4;
  NSMutableArray *nearbyVisibleDeviceInfos;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  nearbyVisibleDeviceInfos = self->_nearbyVisibleDeviceInfos;
  v8 = v4;
  if (!nearbyVisibleDeviceInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_nearbyVisibleDeviceInfos;
    self->_nearbyVisibleDeviceInfos = v6;

    v4 = v8;
    nearbyVisibleDeviceInfos = self->_nearbyVisibleDeviceInfos;
  }
  -[NSMutableArray addObject:](nearbyVisibleDeviceInfos, "addObject:", v4);

}

- (unint64_t)nearbyVisibleDeviceInfosCount
{
  return -[NSMutableArray count](self->_nearbyVisibleDeviceInfos, "count");
}

- (id)nearbyVisibleDeviceInfosAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_nearbyVisibleDeviceInfos, "objectAtIndex:", a3);
}

- (void)setNumAppleMediaAccessories:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numAppleMediaAccessories = a3;
}

- (void)setHasNumAppleMediaAccessories:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumAppleMediaAccessories
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setNumResidents:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_numResidents = a3;
}

- (void)setHasNumResidents:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumResidents
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)primaryResidentStatus
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_primaryResidentStatus;
  else
    return 0;
}

- (void)setPrimaryResidentStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_primaryResidentStatus = a3;
}

- (void)setHasPrimaryResidentStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPrimaryResidentStatus
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)primaryResidentStatusAsString:(int)a3
{
  if (a3 < 3)
    return off_1E3AB2600[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPrimaryResidentStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NoKnownPrimary")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("KnownPrimary")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo;
  -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *mediaRouteIdString;
  HMAccessoryInfoProtoWifiNetworkInfoEvent *wifiInfo;
  void *v7;
  HMAccessoryDiagnosticInfoProtoCurrentAccessoryInfo *currentAccessoryInfo;
  void *v9;
  HMAccessoryDiagnosticInfoProtoCloudInfo *cloudInfo;
  void *v11;
  HMAccessoryDiagnosticInfoProtoIdsInfo *idsInfo;
  void *v13;
  HMRemoteEventRouterProtoServerDiagnosticInfo *eventRouterServerInfo;
  void *v15;
  void *v16;
  NSString *serialNumber;
  NSString *modelIdentifier;
  NSString *softwareVersion;
  NSString *regionInfo;
  NSString *manufacturer;
  HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor *softwareUpdateDescriptor;
  void *v23;
  HMSoftwareUpdateEventProtoSoftwareUpdateProgress *softwareUpdateProgress;
  void *v25;
  void *v26;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  NSMutableArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  NSMutableArray *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  void *v48;
  NSMutableArray *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t m;
  void *v54;
  char has;
  void *v56;
  void *v57;
  uint64_t primaryResidentStatus;
  __CFString *v59;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  mediaRouteIdString = self->_mediaRouteIdString;
  if (mediaRouteIdString)
    objc_msgSend(v3, "setObject:forKey:", mediaRouteIdString, CFSTR("mediaRouteIdString"));
  wifiInfo = self->_wifiInfo;
  if (wifiInfo)
  {
    -[HMAccessoryInfoProtoWifiNetworkInfoEvent dictionaryRepresentation](wifiInfo, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("wifiInfo"));

  }
  currentAccessoryInfo = self->_currentAccessoryInfo;
  if (currentAccessoryInfo)
  {
    -[HMAccessoryDiagnosticInfoProtoCurrentAccessoryInfo dictionaryRepresentation](currentAccessoryInfo, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("currentAccessoryInfo"));

  }
  cloudInfo = self->_cloudInfo;
  if (cloudInfo)
  {
    -[HMAccessoryDiagnosticInfoProtoCloudInfo dictionaryRepresentation](cloudInfo, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("cloudInfo"));

  }
  idsInfo = self->_idsInfo;
  if (idsInfo)
  {
    -[HMAccessoryDiagnosticInfoProtoIdsInfo dictionaryRepresentation](idsInfo, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("idsInfo"));

  }
  eventRouterServerInfo = self->_eventRouterServerInfo;
  if (eventRouterServerInfo)
  {
    -[HMRemoteEventRouterProtoServerDiagnosticInfo dictionaryRepresentation](eventRouterServerInfo, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("eventRouterServerInfo"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_generationTime);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("generationTime"));

  }
  serialNumber = self->_serialNumber;
  if (serialNumber)
    objc_msgSend(v4, "setObject:forKey:", serialNumber, CFSTR("serialNumber"));
  modelIdentifier = self->_modelIdentifier;
  if (modelIdentifier)
    objc_msgSend(v4, "setObject:forKey:", modelIdentifier, CFSTR("modelIdentifier"));
  softwareVersion = self->_softwareVersion;
  if (softwareVersion)
    objc_msgSend(v4, "setObject:forKey:", softwareVersion, CFSTR("softwareVersion"));
  regionInfo = self->_regionInfo;
  if (regionInfo)
    objc_msgSend(v4, "setObject:forKey:", regionInfo, CFSTR("regionInfo"));
  manufacturer = self->_manufacturer;
  if (manufacturer)
    objc_msgSend(v4, "setObject:forKey:", manufacturer, CFSTR("manufacturer"));
  softwareUpdateDescriptor = self->_softwareUpdateDescriptor;
  if (softwareUpdateDescriptor)
  {
    -[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor dictionaryRepresentation](softwareUpdateDescriptor, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("softwareUpdateDescriptor"));

  }
  softwareUpdateProgress = self->_softwareUpdateProgress;
  if (softwareUpdateProgress)
  {
    -[HMSoftwareUpdateEventProtoSoftwareUpdateProgress dictionaryRepresentation](softwareUpdateProgress, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("softwareUpdateProgress"));

  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_sfProblemFlags);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("sfProblemFlags"));

  }
  if (-[NSMutableArray count](self->_networkInfos, "count"))
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_networkInfos, "count"));
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v28 = self->_networkInfos;
    v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v74 != v31)
            objc_enumerationMutation(v28);
          objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * i), "dictionaryRepresentation");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v33);

        }
        v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
      }
      while (v30);
    }

    objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("networkInfo"));
  }
  if (-[NSMutableArray count](self->_networkServiceInfos, "count"))
  {
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_networkServiceInfos, "count"));
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v35 = self->_networkServiceInfos;
    v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v70;
      do
      {
        for (j = 0; j != v37; ++j)
        {
          if (*(_QWORD *)v70 != v38)
            objc_enumerationMutation(v35);
          objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * j), "dictionaryRepresentation");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "addObject:", v40);

        }
        v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
      }
      while (v37);
    }

    objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("networkServiceInfo"));
  }
  if (-[NSMutableArray count](self->_networkVisibleDeviceInfos, "count"))
  {
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_networkVisibleDeviceInfos, "count"));
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v42 = self->_networkVisibleDeviceInfos;
    v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v66;
      do
      {
        for (k = 0; k != v44; ++k)
        {
          if (*(_QWORD *)v66 != v45)
            objc_enumerationMutation(v42);
          objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * k), "dictionaryRepresentation");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "addObject:", v47);

        }
        v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
      }
      while (v44);
    }

    objc_msgSend(v4, "setObject:forKey:", v41, CFSTR("networkVisibleDeviceInfos"));
  }
  if (-[NSMutableArray count](self->_nearbyVisibleDeviceInfos, "count"))
  {
    v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_nearbyVisibleDeviceInfos, "count"));
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v49 = self->_nearbyVisibleDeviceInfos;
    v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v62;
      do
      {
        for (m = 0; m != v51; ++m)
        {
          if (*(_QWORD *)v62 != v52)
            objc_enumerationMutation(v49);
          objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * m), "dictionaryRepresentation");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "addObject:", v54);

        }
        v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
      }
      while (v51);
    }

    objc_msgSend(v4, "setObject:forKey:", v48, CFSTR("nearbyVisibleDeviceInfos"));
  }
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_69;
LABEL_72:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_numResidents);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v57, CFSTR("numResidents"));

    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      return v4;
    goto LABEL_73;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_numAppleMediaAccessories);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v56, CFSTR("numAppleMediaAccessories"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_72;
LABEL_69:
  if ((has & 0x10) == 0)
    return v4;
LABEL_73:
  primaryResidentStatus = self->_primaryResidentStatus;
  if (primaryResidentStatus >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_primaryResidentStatus);
    v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v59 = off_1E3AB2600[primaryResidentStatus];
  }
  objc_msgSend(v4, "setObject:forKey:", v59, CFSTR("primaryResidentStatus"));

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t m;
  char has;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_mediaRouteIdString)
    PBDataWriterWriteStringField();
  if (self->_wifiInfo)
    PBDataWriterWriteSubmessage();
  if (self->_currentAccessoryInfo)
    PBDataWriterWriteSubmessage();
  if (self->_cloudInfo)
    PBDataWriterWriteSubmessage();
  if (self->_idsInfo)
    PBDataWriterWriteSubmessage();
  if (self->_eventRouterServerInfo)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_serialNumber)
    PBDataWriterWriteStringField();
  if (self->_modelIdentifier)
    PBDataWriterWriteStringField();
  if (self->_softwareVersion)
    PBDataWriterWriteStringField();
  if (self->_regionInfo)
    PBDataWriterWriteStringField();
  if (self->_manufacturer)
    PBDataWriterWriteStringField();
  if (self->_softwareUpdateDescriptor)
    PBDataWriterWriteSubmessage();
  if (self->_softwareUpdateProgress)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteUint64Field();
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v5 = self->_networkInfos;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v39 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    }
    while (v7);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v10 = self->_networkServiceInfos;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v35 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    }
    while (v12);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v15 = self->_networkVisibleDeviceInfos;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v31;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v31 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
    }
    while (v17);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v20 = self->_nearbyVisibleDeviceInfos;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v27;
    do
    {
      for (m = 0; m != v22; ++m)
      {
        if (*(_QWORD *)v27 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteSubmessage();
      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
    }
    while (v22);
  }

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_61;
LABEL_65:
    PBDataWriterWriteInt64Field();
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_63;
    goto LABEL_62;
  }
  PBDataWriterWriteInt64Field();
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_65;
LABEL_61:
  if ((has & 0x10) != 0)
LABEL_62:
    PBDataWriterWriteInt32Field();
LABEL_63:

}

- (void)copyTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t m;
  void *v20;
  char has;
  id v22;

  v4 = a3;
  v22 = v4;
  if (self->_mediaRouteIdString)
  {
    objc_msgSend(v4, "setMediaRouteIdString:");
    v4 = v22;
  }
  if (self->_wifiInfo)
  {
    objc_msgSend(v22, "setWifiInfo:");
    v4 = v22;
  }
  if (self->_currentAccessoryInfo)
  {
    objc_msgSend(v22, "setCurrentAccessoryInfo:");
    v4 = v22;
  }
  if (self->_cloudInfo)
  {
    objc_msgSend(v22, "setCloudInfo:");
    v4 = v22;
  }
  if (self->_idsInfo)
  {
    objc_msgSend(v22, "setIdsInfo:");
    v4 = v22;
  }
  if (self->_eventRouterServerInfo)
  {
    objc_msgSend(v22, "setEventRouterServerInfo:");
    v4 = v22;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_generationTime;
    *((_BYTE *)v4 + 184) |= 1u;
  }
  if (self->_serialNumber)
  {
    objc_msgSend(v22, "setSerialNumber:");
    v4 = v22;
  }
  if (self->_modelIdentifier)
  {
    objc_msgSend(v22, "setModelIdentifier:");
    v4 = v22;
  }
  if (self->_softwareVersion)
  {
    objc_msgSend(v22, "setSoftwareVersion:");
    v4 = v22;
  }
  if (self->_regionInfo)
  {
    objc_msgSend(v22, "setRegionInfo:");
    v4 = v22;
  }
  if (self->_manufacturer)
  {
    objc_msgSend(v22, "setManufacturer:");
    v4 = v22;
  }
  if (self->_softwareUpdateDescriptor)
  {
    objc_msgSend(v22, "setSoftwareUpdateDescriptor:");
    v4 = v22;
  }
  if (self->_softwareUpdateProgress)
  {
    objc_msgSend(v22, "setSoftwareUpdateProgress:");
    v4 = v22;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_QWORD *)v4 + 4) = self->_sfProblemFlags;
    *((_BYTE *)v4 + 184) |= 8u;
  }
  if (-[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo networkInfosCount](self, "networkInfosCount"))
  {
    objc_msgSend(v22, "clearNetworkInfos");
    v5 = -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo networkInfosCount](self, "networkInfosCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo networkInfoAtIndex:](self, "networkInfoAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addNetworkInfo:", v8);

      }
    }
  }
  if (-[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo networkServiceInfosCount](self, "networkServiceInfosCount"))
  {
    objc_msgSend(v22, "clearNetworkServiceInfos");
    v9 = -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo networkServiceInfosCount](self, "networkServiceInfosCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo networkServiceInfoAtIndex:](self, "networkServiceInfoAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addNetworkServiceInfo:", v12);

      }
    }
  }
  if (-[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo networkVisibleDeviceInfosCount](self, "networkVisibleDeviceInfosCount"))
  {
    objc_msgSend(v22, "clearNetworkVisibleDeviceInfos");
    v13 = -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo networkVisibleDeviceInfosCount](self, "networkVisibleDeviceInfosCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo networkVisibleDeviceInfosAtIndex:](self, "networkVisibleDeviceInfosAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addNetworkVisibleDeviceInfos:", v16);

      }
    }
  }
  if (-[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo nearbyVisibleDeviceInfosCount](self, "nearbyVisibleDeviceInfosCount"))
  {
    objc_msgSend(v22, "clearNearbyVisibleDeviceInfos");
    v17 = -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo nearbyVisibleDeviceInfosCount](self, "nearbyVisibleDeviceInfosCount");
    if (v17)
    {
      v18 = v17;
      for (m = 0; m != v18; ++m)
      {
        -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo nearbyVisibleDeviceInfosAtIndex:](self, "nearbyVisibleDeviceInfosAtIndex:", m);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addNearbyVisibleDeviceInfos:", v20);

      }
    }
  }
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_49;
LABEL_53:
    *((_QWORD *)v22 + 3) = self->_numResidents;
    *((_BYTE *)v22 + 184) |= 4u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_51;
    goto LABEL_50;
  }
  *((_QWORD *)v22 + 2) = self->_numAppleMediaAccessories;
  *((_BYTE *)v22 + 184) |= 2u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_53;
LABEL_49:
  if ((has & 0x10) != 0)
  {
LABEL_50:
    *((_DWORD *)v22 + 32) = self->_primaryResidentStatus;
    *((_BYTE *)v22 + 184) |= 0x10u;
  }
LABEL_51:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  NSMutableArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  NSMutableArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  NSMutableArray *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t k;
  void *v49;
  NSMutableArray *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t m;
  void *v55;
  char has;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_mediaRouteIdString, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v6;

  v8 = -[HMAccessoryInfoProtoWifiNetworkInfoEvent copyWithZone:](self->_wifiInfo, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v8;

  v10 = -[HMAccessoryDiagnosticInfoProtoCurrentAccessoryInfo copyWithZone:](self->_currentAccessoryInfo, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  v12 = -[HMAccessoryDiagnosticInfoProtoCloudInfo copyWithZone:](self->_cloudInfo, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  v14 = -[HMAccessoryDiagnosticInfoProtoIdsInfo copyWithZone:](self->_idsInfo, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v14;

  v16 = -[HMRemoteEventRouterProtoServerDiagnosticInfo copyWithZone:](self->_eventRouterServerInfo, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v16;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_generationTime;
    *(_BYTE *)(v5 + 184) |= 1u;
  }
  v18 = -[NSString copyWithZone:](self->_serialNumber, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v18;

  v20 = -[NSString copyWithZone:](self->_modelIdentifier, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v20;

  v22 = -[NSString copyWithZone:](self->_softwareVersion, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v22;

  v24 = -[NSString copyWithZone:](self->_regionInfo, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v24;

  v26 = -[NSString copyWithZone:](self->_manufacturer, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v26;

  v28 = -[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor copyWithZone:](self->_softwareUpdateDescriptor, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v28;

  v30 = -[HMSoftwareUpdateEventProtoSoftwareUpdateProgress copyWithZone:](self->_softwareUpdateProgress, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v30;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_sfProblemFlags;
    *(_BYTE *)(v5 + 184) |= 8u;
  }
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v32 = self->_networkInfos;
  v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v71;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v71 != v35)
          objc_enumerationMutation(v32);
        v37 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addNetworkInfo:", v37);

      }
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
    }
    while (v34);
  }

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v38 = self->_networkServiceInfos;
  v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v67;
    do
    {
      for (j = 0; j != v40; ++j)
      {
        if (*(_QWORD *)v67 != v41)
          objc_enumerationMutation(v38);
        v43 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addNetworkServiceInfo:", v43);

      }
      v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
    }
    while (v40);
  }

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v44 = self->_networkVisibleDeviceInfos;
  v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v63;
    do
    {
      for (k = 0; k != v46; ++k)
      {
        if (*(_QWORD *)v63 != v47)
          objc_enumerationMutation(v44);
        v49 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addNetworkVisibleDeviceInfos:", v49);

      }
      v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
    }
    while (v46);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v50 = self->_nearbyVisibleDeviceInfos;
  v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v59;
    do
    {
      for (m = 0; m != v52; ++m)
      {
        if (*(_QWORD *)v59 != v53)
          objc_enumerationMutation(v50);
        v55 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * m), "copyWithZone:", a3, (_QWORD)v58);
        objc_msgSend((id)v5, "addNearbyVisibleDeviceInfos:", v55);

      }
      v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
    }
    while (v52);
  }

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_35;
LABEL_39:
    *(_QWORD *)(v5 + 24) = self->_numResidents;
    *(_BYTE *)(v5 + 184) |= 4u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      return (id)v5;
    goto LABEL_36;
  }
  *(_QWORD *)(v5 + 16) = self->_numAppleMediaAccessories;
  *(_BYTE *)(v5 + 184) |= 2u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_39;
LABEL_35:
  if ((has & 0x10) != 0)
  {
LABEL_36:
    *(_DWORD *)(v5 + 128) = self->_primaryResidentStatus;
    *(_BYTE *)(v5 + 184) |= 0x10u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *mediaRouteIdString;
  HMAccessoryInfoProtoWifiNetworkInfoEvent *wifiInfo;
  HMAccessoryDiagnosticInfoProtoCurrentAccessoryInfo *currentAccessoryInfo;
  HMAccessoryDiagnosticInfoProtoCloudInfo *cloudInfo;
  HMAccessoryDiagnosticInfoProtoIdsInfo *idsInfo;
  HMRemoteEventRouterProtoServerDiagnosticInfo *eventRouterServerInfo;
  NSString *serialNumber;
  NSString *modelIdentifier;
  NSString *softwareVersion;
  NSString *regionInfo;
  NSString *manufacturer;
  HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor *softwareUpdateDescriptor;
  HMSoftwareUpdateEventProtoSoftwareUpdateProgress *softwareUpdateProgress;
  NSMutableArray *networkInfos;
  NSMutableArray *networkServiceInfos;
  NSMutableArray *networkVisibleDeviceInfos;
  NSMutableArray *nearbyVisibleDeviceInfos;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_61;
  mediaRouteIdString = self->_mediaRouteIdString;
  if ((unint64_t)mediaRouteIdString | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](mediaRouteIdString, "isEqual:"))
      goto LABEL_61;
  }
  wifiInfo = self->_wifiInfo;
  if ((unint64_t)wifiInfo | *((_QWORD *)v4 + 22))
  {
    if (!-[HMAccessoryInfoProtoWifiNetworkInfoEvent isEqual:](wifiInfo, "isEqual:"))
      goto LABEL_61;
  }
  currentAccessoryInfo = self->_currentAccessoryInfo;
  if ((unint64_t)currentAccessoryInfo | *((_QWORD *)v4 + 6))
  {
    if (!-[HMAccessoryDiagnosticInfoProtoCurrentAccessoryInfo isEqual:](currentAccessoryInfo, "isEqual:"))
      goto LABEL_61;
  }
  cloudInfo = self->_cloudInfo;
  if ((unint64_t)cloudInfo | *((_QWORD *)v4 + 5))
  {
    if (!-[HMAccessoryDiagnosticInfoProtoCloudInfo isEqual:](cloudInfo, "isEqual:"))
      goto LABEL_61;
  }
  idsInfo = self->_idsInfo;
  if ((unint64_t)idsInfo | *((_QWORD *)v4 + 8))
  {
    if (!-[HMAccessoryDiagnosticInfoProtoIdsInfo isEqual:](idsInfo, "isEqual:"))
      goto LABEL_61;
  }
  eventRouterServerInfo = self->_eventRouterServerInfo;
  if ((unint64_t)eventRouterServerInfo | *((_QWORD *)v4 + 7))
  {
    if (!-[HMRemoteEventRouterProtoServerDiagnosticInfo isEqual:](eventRouterServerInfo, "isEqual:"))
      goto LABEL_61;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 184) & 1) == 0 || self->_generationTime != *((double *)v4 + 1))
      goto LABEL_61;
  }
  else if ((*((_BYTE *)v4 + 184) & 1) != 0)
  {
LABEL_61:
    v22 = 0;
    goto LABEL_62;
  }
  serialNumber = self->_serialNumber;
  if ((unint64_t)serialNumber | *((_QWORD *)v4 + 18)
    && !-[NSString isEqual:](serialNumber, "isEqual:"))
  {
    goto LABEL_61;
  }
  modelIdentifier = self->_modelIdentifier;
  if ((unint64_t)modelIdentifier | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](modelIdentifier, "isEqual:"))
      goto LABEL_61;
  }
  softwareVersion = self->_softwareVersion;
  if ((unint64_t)softwareVersion | *((_QWORD *)v4 + 21))
  {
    if (!-[NSString isEqual:](softwareVersion, "isEqual:"))
      goto LABEL_61;
  }
  regionInfo = self->_regionInfo;
  if ((unint64_t)regionInfo | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](regionInfo, "isEqual:"))
      goto LABEL_61;
  }
  manufacturer = self->_manufacturer;
  if ((unint64_t)manufacturer | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](manufacturer, "isEqual:"))
      goto LABEL_61;
  }
  softwareUpdateDescriptor = self->_softwareUpdateDescriptor;
  if ((unint64_t)softwareUpdateDescriptor | *((_QWORD *)v4 + 19))
  {
    if (!-[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor isEqual:](softwareUpdateDescriptor, "isEqual:"))
      goto LABEL_61;
  }
  softwareUpdateProgress = self->_softwareUpdateProgress;
  if ((unint64_t)softwareUpdateProgress | *((_QWORD *)v4 + 20))
  {
    if (!-[HMSoftwareUpdateEventProtoSoftwareUpdateProgress isEqual:](softwareUpdateProgress, "isEqual:"))
      goto LABEL_61;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 184) & 8) == 0 || self->_sfProblemFlags != *((_QWORD *)v4 + 4))
      goto LABEL_61;
  }
  else if ((*((_BYTE *)v4 + 184) & 8) != 0)
  {
    goto LABEL_61;
  }
  networkInfos = self->_networkInfos;
  if ((unint64_t)networkInfos | *((_QWORD *)v4 + 13)
    && !-[NSMutableArray isEqual:](networkInfos, "isEqual:"))
  {
    goto LABEL_61;
  }
  networkServiceInfos = self->_networkServiceInfos;
  if ((unint64_t)networkServiceInfos | *((_QWORD *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](networkServiceInfos, "isEqual:"))
      goto LABEL_61;
  }
  networkVisibleDeviceInfos = self->_networkVisibleDeviceInfos;
  if ((unint64_t)networkVisibleDeviceInfos | *((_QWORD *)v4 + 15))
  {
    if (!-[NSMutableArray isEqual:](networkVisibleDeviceInfos, "isEqual:"))
      goto LABEL_61;
  }
  nearbyVisibleDeviceInfos = self->_nearbyVisibleDeviceInfos;
  if ((unint64_t)nearbyVisibleDeviceInfos | *((_QWORD *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](nearbyVisibleDeviceInfos, "isEqual:"))
      goto LABEL_61;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 184) & 2) == 0 || self->_numAppleMediaAccessories != *((_QWORD *)v4 + 2))
      goto LABEL_61;
  }
  else if ((*((_BYTE *)v4 + 184) & 2) != 0)
  {
    goto LABEL_61;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 184) & 4) == 0 || self->_numResidents != *((_QWORD *)v4 + 3))
      goto LABEL_61;
  }
  else if ((*((_BYTE *)v4 + 184) & 4) != 0)
  {
    goto LABEL_61;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 184) & 0x10) == 0 || self->_primaryResidentStatus != *((_DWORD *)v4 + 32))
      goto LABEL_61;
    v22 = 1;
  }
  else
  {
    v22 = (*((_BYTE *)v4 + 184) & 0x10) == 0;
  }
LABEL_62:

  return v22;
}

- (unint64_t)hash
{
  double generationTime;
  double v4;
  long double v5;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  NSUInteger v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSUInteger v23;
  NSUInteger v24;
  NSUInteger v25;
  NSUInteger v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  NSUInteger v33;

  v33 = -[NSString hash](self->_mediaRouteIdString, "hash");
  v32 = -[HMAccessoryInfoProtoWifiNetworkInfoEvent hash](self->_wifiInfo, "hash");
  v31 = -[HMAccessoryDiagnosticInfoProtoCurrentAccessoryInfo hash](self->_currentAccessoryInfo, "hash");
  v30 = -[HMAccessoryDiagnosticInfoProtoCloudInfo hash](self->_cloudInfo, "hash");
  v29 = -[HMAccessoryDiagnosticInfoProtoIdsInfo hash](self->_idsInfo, "hash");
  v28 = -[HMRemoteEventRouterProtoServerDiagnosticInfo hash](self->_eventRouterServerInfo, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    generationTime = self->_generationTime;
    v4 = -generationTime;
    if (generationTime >= 0.0)
      v4 = self->_generationTime;
    v5 = floor(v4 + 0.5);
    v6 = (v4 - v5) * 1.84467441e19;
    v7 = fmod(v5, 1.84467441e19);
    v8 = 2654435761u * (unint64_t)v7;
    v9 = v8 + (unint64_t)v6;
    if (v6 <= 0.0)
      v9 = 2654435761u * (unint64_t)v7;
    v10 = v8 - (unint64_t)fabs(v6);
    if (v6 >= 0.0)
      v10 = v9;
    v27 = v10;
  }
  else
  {
    v27 = 0;
  }
  v26 = -[NSString hash](self->_serialNumber, "hash");
  v25 = -[NSString hash](self->_modelIdentifier, "hash");
  v24 = -[NSString hash](self->_softwareVersion, "hash");
  v23 = -[NSString hash](self->_regionInfo, "hash");
  v11 = -[NSString hash](self->_manufacturer, "hash");
  v12 = -[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor hash](self->_softwareUpdateDescriptor, "hash");
  v13 = -[HMSoftwareUpdateEventProtoSoftwareUpdateProgress hash](self->_softwareUpdateProgress, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v14 = 2654435761u * self->_sfProblemFlags;
  else
    v14 = 0;
  v15 = -[NSMutableArray hash](self->_networkInfos, "hash");
  v16 = -[NSMutableArray hash](self->_networkServiceInfos, "hash");
  v17 = -[NSMutableArray hash](self->_networkVisibleDeviceInfos, "hash");
  v18 = -[NSMutableArray hash](self->_nearbyVisibleDeviceInfos, "hash");
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v19 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_15;
LABEL_18:
    v20 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_16;
LABEL_19:
    v21 = 0;
    return v32 ^ v33 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21;
  }
  v19 = 2654435761 * self->_numAppleMediaAccessories;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_18;
LABEL_15:
  v20 = 2654435761 * self->_numResidents;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_19;
LABEL_16:
  v21 = 2654435761 * self->_primaryResidentStatus;
  return v32 ^ v33 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HMAccessoryInfoProtoWifiNetworkInfoEvent *wifiInfo;
  uint64_t v6;
  HMAccessoryDiagnosticInfoProtoCurrentAccessoryInfo *currentAccessoryInfo;
  uint64_t v8;
  HMAccessoryDiagnosticInfoProtoCloudInfo *cloudInfo;
  uint64_t v10;
  HMAccessoryDiagnosticInfoProtoIdsInfo *idsInfo;
  uint64_t v12;
  HMRemoteEventRouterProtoServerDiagnosticInfo *eventRouterServerInfo;
  uint64_t v14;
  HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor *softwareUpdateDescriptor;
  uint64_t v16;
  HMSoftwareUpdateEventProtoSoftwareUpdateProgress *softwareUpdateProgress;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t m;
  char v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 10))
    -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo setMediaRouteIdString:](self, "setMediaRouteIdString:");
  wifiInfo = self->_wifiInfo;
  v6 = *((_QWORD *)v4 + 22);
  if (wifiInfo)
  {
    if (v6)
      -[HMAccessoryInfoProtoWifiNetworkInfoEvent mergeFrom:](wifiInfo, "mergeFrom:");
  }
  else if (v6)
  {
    -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo setWifiInfo:](self, "setWifiInfo:");
  }
  currentAccessoryInfo = self->_currentAccessoryInfo;
  v8 = *((_QWORD *)v4 + 6);
  if (currentAccessoryInfo)
  {
    if (v8)
      -[HMAccessoryDiagnosticInfoProtoCurrentAccessoryInfo mergeFrom:](currentAccessoryInfo, "mergeFrom:");
  }
  else if (v8)
  {
    -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo setCurrentAccessoryInfo:](self, "setCurrentAccessoryInfo:");
  }
  cloudInfo = self->_cloudInfo;
  v10 = *((_QWORD *)v4 + 5);
  if (cloudInfo)
  {
    if (v10)
      -[HMAccessoryDiagnosticInfoProtoCloudInfo mergeFrom:](cloudInfo, "mergeFrom:");
  }
  else if (v10)
  {
    -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo setCloudInfo:](self, "setCloudInfo:");
  }
  idsInfo = self->_idsInfo;
  v12 = *((_QWORD *)v4 + 8);
  if (idsInfo)
  {
    if (v12)
      -[HMAccessoryDiagnosticInfoProtoIdsInfo mergeFrom:](idsInfo, "mergeFrom:");
  }
  else if (v12)
  {
    -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo setIdsInfo:](self, "setIdsInfo:");
  }
  eventRouterServerInfo = self->_eventRouterServerInfo;
  v14 = *((_QWORD *)v4 + 7);
  if (eventRouterServerInfo)
  {
    if (v14)
      -[HMRemoteEventRouterProtoServerDiagnosticInfo mergeFrom:](eventRouterServerInfo, "mergeFrom:");
  }
  else if (v14)
  {
    -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo setEventRouterServerInfo:](self, "setEventRouterServerInfo:");
  }
  if ((*((_BYTE *)v4 + 184) & 1) != 0)
  {
    self->_generationTime = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 18))
    -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo setSerialNumber:](self, "setSerialNumber:");
  if (*((_QWORD *)v4 + 11))
    -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo setModelIdentifier:](self, "setModelIdentifier:");
  if (*((_QWORD *)v4 + 21))
    -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo setSoftwareVersion:](self, "setSoftwareVersion:");
  if (*((_QWORD *)v4 + 17))
    -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo setRegionInfo:](self, "setRegionInfo:");
  if (*((_QWORD *)v4 + 9))
    -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo setManufacturer:](self, "setManufacturer:");
  softwareUpdateDescriptor = self->_softwareUpdateDescriptor;
  v16 = *((_QWORD *)v4 + 19);
  if (softwareUpdateDescriptor)
  {
    if (v16)
      -[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor mergeFrom:](softwareUpdateDescriptor, "mergeFrom:");
  }
  else if (v16)
  {
    -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo setSoftwareUpdateDescriptor:](self, "setSoftwareUpdateDescriptor:");
  }
  softwareUpdateProgress = self->_softwareUpdateProgress;
  v18 = *((_QWORD *)v4 + 20);
  if (softwareUpdateProgress)
  {
    if (v18)
      -[HMSoftwareUpdateEventProtoSoftwareUpdateProgress mergeFrom:](softwareUpdateProgress, "mergeFrom:");
  }
  else if (v18)
  {
    -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo setSoftwareUpdateProgress:](self, "setSoftwareUpdateProgress:");
  }
  if ((*((_BYTE *)v4 + 184) & 8) != 0)
  {
    self->_sfProblemFlags = *((_QWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
  }
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v19 = *((id *)v4 + 13);
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v53 != v22)
          objc_enumerationMutation(v19);
        -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo addNetworkInfo:](self, "addNetworkInfo:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i));
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
    }
    while (v21);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v24 = *((id *)v4 + 14);
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v49 != v27)
          objc_enumerationMutation(v24);
        -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo addNetworkServiceInfo:](self, "addNetworkServiceInfo:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j));
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
    }
    while (v26);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v29 = *((id *)v4 + 15);
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v45;
    do
    {
      for (k = 0; k != v31; ++k)
      {
        if (*(_QWORD *)v45 != v32)
          objc_enumerationMutation(v29);
        -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo addNetworkVisibleDeviceInfos:](self, "addNetworkVisibleDeviceInfos:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * k));
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
    }
    while (v31);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v34 = *((id *)v4 + 12);
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v41;
    do
    {
      for (m = 0; m != v36; ++m)
      {
        if (*(_QWORD *)v41 != v37)
          objc_enumerationMutation(v34);
        -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo addNearbyVisibleDeviceInfos:](self, "addNearbyVisibleDeviceInfos:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * m), (_QWORD)v40);
      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
    }
    while (v36);
  }

  v39 = *((_BYTE *)v4 + 184);
  if ((v39 & 2) == 0)
  {
    if ((*((_BYTE *)v4 + 184) & 4) == 0)
      goto LABEL_82;
LABEL_86:
    self->_numResidents = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
    if ((*((_BYTE *)v4 + 184) & 0x10) == 0)
      goto LABEL_84;
    goto LABEL_83;
  }
  self->_numAppleMediaAccessories = *((_QWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v39 = *((_BYTE *)v4 + 184);
  if ((v39 & 4) != 0)
    goto LABEL_86;
LABEL_82:
  if ((v39 & 0x10) != 0)
  {
LABEL_83:
    self->_primaryResidentStatus = *((_DWORD *)v4 + 32);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_84:

}

- (NSString)mediaRouteIdString
{
  return self->_mediaRouteIdString;
}

- (void)setMediaRouteIdString:(id)a3
{
  objc_storeStrong((id *)&self->_mediaRouteIdString, a3);
}

- (HMAccessoryInfoProtoWifiNetworkInfoEvent)wifiInfo
{
  return self->_wifiInfo;
}

- (void)setWifiInfo:(id)a3
{
  objc_storeStrong((id *)&self->_wifiInfo, a3);
}

- (HMAccessoryDiagnosticInfoProtoCurrentAccessoryInfo)currentAccessoryInfo
{
  return self->_currentAccessoryInfo;
}

- (void)setCurrentAccessoryInfo:(id)a3
{
  objc_storeStrong((id *)&self->_currentAccessoryInfo, a3);
}

- (HMAccessoryDiagnosticInfoProtoCloudInfo)cloudInfo
{
  return self->_cloudInfo;
}

- (void)setCloudInfo:(id)a3
{
  objc_storeStrong((id *)&self->_cloudInfo, a3);
}

- (HMAccessoryDiagnosticInfoProtoIdsInfo)idsInfo
{
  return self->_idsInfo;
}

- (void)setIdsInfo:(id)a3
{
  objc_storeStrong((id *)&self->_idsInfo, a3);
}

- (HMRemoteEventRouterProtoServerDiagnosticInfo)eventRouterServerInfo
{
  return self->_eventRouterServerInfo;
}

- (void)setEventRouterServerInfo:(id)a3
{
  objc_storeStrong((id *)&self->_eventRouterServerInfo, a3);
}

- (double)generationTime
{
  return self->_generationTime;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumber, a3);
}

- (NSString)modelIdentifier
{
  return self->_modelIdentifier;
}

- (void)setModelIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_modelIdentifier, a3);
}

- (NSString)softwareVersion
{
  return self->_softwareVersion;
}

- (void)setSoftwareVersion:(id)a3
{
  objc_storeStrong((id *)&self->_softwareVersion, a3);
}

- (NSString)regionInfo
{
  return self->_regionInfo;
}

- (void)setRegionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_regionInfo, a3);
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (void)setManufacturer:(id)a3
{
  objc_storeStrong((id *)&self->_manufacturer, a3);
}

- (HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor)softwareUpdateDescriptor
{
  return self->_softwareUpdateDescriptor;
}

- (void)setSoftwareUpdateDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateDescriptor, a3);
}

- (HMSoftwareUpdateEventProtoSoftwareUpdateProgress)softwareUpdateProgress
{
  return self->_softwareUpdateProgress;
}

- (void)setSoftwareUpdateProgress:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateProgress, a3);
}

- (unint64_t)sfProblemFlags
{
  return self->_sfProblemFlags;
}

- (NSMutableArray)networkInfos
{
  return self->_networkInfos;
}

- (void)setNetworkInfos:(id)a3
{
  objc_storeStrong((id *)&self->_networkInfos, a3);
}

- (NSMutableArray)networkServiceInfos
{
  return self->_networkServiceInfos;
}

- (void)setNetworkServiceInfos:(id)a3
{
  objc_storeStrong((id *)&self->_networkServiceInfos, a3);
}

- (NSMutableArray)networkVisibleDeviceInfos
{
  return self->_networkVisibleDeviceInfos;
}

- (void)setNetworkVisibleDeviceInfos:(id)a3
{
  objc_storeStrong((id *)&self->_networkVisibleDeviceInfos, a3);
}

- (NSMutableArray)nearbyVisibleDeviceInfos
{
  return self->_nearbyVisibleDeviceInfos;
}

- (void)setNearbyVisibleDeviceInfos:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyVisibleDeviceInfos, a3);
}

- (int64_t)numAppleMediaAccessories
{
  return self->_numAppleMediaAccessories;
}

- (int64_t)numResidents
{
  return self->_numResidents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiInfo, 0);
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_softwareUpdateProgress, 0);
  objc_storeStrong((id *)&self->_softwareUpdateDescriptor, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_regionInfo, 0);
  objc_storeStrong((id *)&self->_networkVisibleDeviceInfos, 0);
  objc_storeStrong((id *)&self->_networkServiceInfos, 0);
  objc_storeStrong((id *)&self->_networkInfos, 0);
  objc_storeStrong((id *)&self->_nearbyVisibleDeviceInfos, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaRouteIdString, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_idsInfo, 0);
  objc_storeStrong((id *)&self->_eventRouterServerInfo, 0);
  objc_storeStrong((id *)&self->_currentAccessoryInfo, 0);
  objc_storeStrong((id *)&self->_cloudInfo, 0);
}

+ (Class)networkInfoType
{
  return (Class)objc_opt_class();
}

+ (Class)networkServiceInfoType
{
  return (Class)objc_opt_class();
}

+ (Class)networkVisibleDeviceInfosType
{
  return (Class)objc_opt_class();
}

+ (Class)nearbyVisibleDeviceInfosType
{
  return (Class)objc_opt_class();
}

@end
