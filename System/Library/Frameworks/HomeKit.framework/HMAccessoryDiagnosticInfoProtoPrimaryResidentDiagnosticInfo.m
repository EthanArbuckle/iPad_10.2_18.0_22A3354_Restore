@implementation HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo

- (BOOL)hasWifiInfo
{
  return self->_wifiInfo != 0;
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

- (BOOL)hasEventRouterServerInfo
{
  return self->_eventRouterServerInfo != 0;
}

- (void)clearVisibleAccessoriesInfos
{
  -[NSMutableArray removeAllObjects](self->_visibleAccessoriesInfos, "removeAllObjects");
}

- (void)addVisibleAccessoriesInfo:(id)a3
{
  id v4;
  NSMutableArray *visibleAccessoriesInfos;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  visibleAccessoriesInfos = self->_visibleAccessoriesInfos;
  v8 = v4;
  if (!visibleAccessoriesInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_visibleAccessoriesInfos;
    self->_visibleAccessoriesInfos = v6;

    v4 = v8;
    visibleAccessoriesInfos = self->_visibleAccessoriesInfos;
  }
  -[NSMutableArray addObject:](visibleAccessoriesInfos, "addObject:", v4);

}

- (unint64_t)visibleAccessoriesInfosCount
{
  return -[NSMutableArray count](self->_visibleAccessoriesInfos, "count");
}

- (id)visibleAccessoriesInfoAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_visibleAccessoriesInfos, "objectAtIndex:", a3);
}

- (void)clearVisibleIDSDevices
{
  -[NSMutableArray removeAllObjects](self->_visibleIDSDevices, "removeAllObjects");
}

- (void)addVisibleIDSDevices:(id)a3
{
  id v4;
  NSMutableArray *visibleIDSDevices;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  visibleIDSDevices = self->_visibleIDSDevices;
  v8 = v4;
  if (!visibleIDSDevices)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_visibleIDSDevices;
    self->_visibleIDSDevices = v6;

    v4 = v8;
    visibleIDSDevices = self->_visibleIDSDevices;
  }
  -[NSMutableArray addObject:](visibleIDSDevices, "addObject:", v4);

}

- (unint64_t)visibleIDSDevicesCount
{
  return -[NSMutableArray count](self->_visibleIDSDevices, "count");
}

- (id)visibleIDSDevicesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_visibleIDSDevices, "objectAtIndex:", a3);
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

- (void)clearProximityVisibleDeviceInfos
{
  -[NSMutableArray removeAllObjects](self->_proximityVisibleDeviceInfos, "removeAllObjects");
}

- (void)addProximityVisibleDeviceInfos:(id)a3
{
  id v4;
  NSMutableArray *proximityVisibleDeviceInfos;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  proximityVisibleDeviceInfos = self->_proximityVisibleDeviceInfos;
  v8 = v4;
  if (!proximityVisibleDeviceInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_proximityVisibleDeviceInfos;
    self->_proximityVisibleDeviceInfos = v6;

    v4 = v8;
    proximityVisibleDeviceInfos = self->_proximityVisibleDeviceInfos;
  }
  -[NSMutableArray addObject:](proximityVisibleDeviceInfos, "addObject:", v4);

}

- (unint64_t)proximityVisibleDeviceInfosCount
{
  return -[NSMutableArray count](self->_proximityVisibleDeviceInfos, "count");
}

- (id)proximityVisibleDeviceInfosAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_proximityVisibleDeviceInfos, "objectAtIndex:", a3);
}

- (void)setNumAppleMediaAccessories:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_numAppleMediaAccessories = a3;
}

- (void)setHasNumAppleMediaAccessories:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumAppleMediaAccessories
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setNumResidents:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numResidents = a3;
}

- (void)setHasNumResidents:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumResidents
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo;
  -[HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HMAccessoryInfoProtoWifiNetworkInfoEvent *wifiInfo;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  HMRemoteEventRouterProtoServerDiagnosticInfo *eventRouterServerInfo;
  void *v21;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  NSMutableArray *visibleIDSDevices;
  void *v30;
  NSMutableArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t m;
  void *v36;
  void *v37;
  NSMutableArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t n;
  void *v43;
  char has;
  void *v45;
  void *v46;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
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
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  wifiInfo = self->_wifiInfo;
  if (wifiInfo)
  {
    -[HMAccessoryInfoProtoWifiNetworkInfoEvent dictionaryRepresentation](wifiInfo, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("wifiInfo"));

  }
  if (-[NSMutableArray count](self->_networkInfos, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_networkInfos, "count"));
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v7 = self->_networkInfos;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v65 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("networkInfo"));
  }
  if (-[NSMutableArray count](self->_networkServiceInfos, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_networkServiceInfos, "count"));
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v14 = self->_networkServiceInfos;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v61;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v61 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * j), "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
      }
      while (v16);
    }

    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("networkServiceInfo"));
  }
  eventRouterServerInfo = self->_eventRouterServerInfo;
  if (eventRouterServerInfo)
  {
    -[HMRemoteEventRouterProtoServerDiagnosticInfo dictionaryRepresentation](eventRouterServerInfo, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("eventRouterServerInfo"));

  }
  if (-[NSMutableArray count](self->_visibleAccessoriesInfos, "count"))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_visibleAccessoriesInfos, "count"));
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v23 = self->_visibleAccessoriesInfos;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v56, v70, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v57;
      do
      {
        for (k = 0; k != v25; ++k)
        {
          if (*(_QWORD *)v57 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * k), "dictionaryRepresentation");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v28);

        }
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v56, v70, 16);
      }
      while (v25);
    }

    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("visibleAccessoriesInfo"));
  }
  visibleIDSDevices = self->_visibleIDSDevices;
  if (visibleIDSDevices)
    objc_msgSend(v3, "setObject:forKey:", visibleIDSDevices, CFSTR("visibleIDSDevices"));
  if (-[NSMutableArray count](self->_networkVisibleDeviceInfos, "count"))
  {
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_networkVisibleDeviceInfos, "count"));
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v31 = self->_networkVisibleDeviceInfos;
    v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v52, v69, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v53;
      do
      {
        for (m = 0; m != v33; ++m)
        {
          if (*(_QWORD *)v53 != v34)
            objc_enumerationMutation(v31);
          objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * m), "dictionaryRepresentation");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addObject:", v36);

        }
        v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v52, v69, 16);
      }
      while (v33);
    }

    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("networkVisibleDeviceInfos"));
  }
  if (-[NSMutableArray count](self->_proximityVisibleDeviceInfos, "count"))
  {
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_proximityVisibleDeviceInfos, "count"));
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v38 = self->_proximityVisibleDeviceInfos;
    v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v48, v68, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v49;
      do
      {
        for (n = 0; n != v40; ++n)
        {
          if (*(_QWORD *)v49 != v41)
            objc_enumerationMutation(v38);
          objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * n), "dictionaryRepresentation", (_QWORD)v48);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "addObject:", v43);

        }
        v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v48, v68, 16);
      }
      while (v40);
    }

    objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("proximityVisibleDeviceInfos"));
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_numAppleMediaAccessories);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("numAppleMediaAccessories"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_numResidents);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v46, CFSTR("numResidents"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfoReadFrom((uint64_t)self, (uint64_t)a3);
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
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t n;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t ii;
  char has;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
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
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_wifiInfo)
    PBDataWriterWriteSubmessage();
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v5 = self->_networkInfos;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v57 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
    }
    while (v7);
  }

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v10 = self->_networkServiceInfos;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v53;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v53 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
    }
    while (v12);
  }

  if (self->_eventRouterServerInfo)
    PBDataWriterWriteSubmessage();
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v15 = self->_visibleAccessoriesInfos;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v49;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v49 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
    }
    while (v17);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v20 = self->_visibleIDSDevices;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v44, v62, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v45;
    do
    {
      for (m = 0; m != v22; ++m)
      {
        if (*(_QWORD *)v45 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteStringField();
      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v44, v62, 16);
    }
    while (v22);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v25 = self->_networkVisibleDeviceInfos;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v40, v61, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v41;
    do
    {
      for (n = 0; n != v27; ++n)
      {
        if (*(_QWORD *)v41 != v28)
          objc_enumerationMutation(v25);
        PBDataWriterWriteSubmessage();
      }
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v40, v61, 16);
    }
    while (v27);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v30 = self->_proximityVisibleDeviceInfos;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v36, v60, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v37;
    do
    {
      for (ii = 0; ii != v32; ++ii)
      {
        if (*(_QWORD *)v37 != v33)
          objc_enumerationMutation(v30);
        PBDataWriterWriteSubmessage();
      }
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v36, v60, 16);
    }
    while (v32);
  }

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt64Field();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t n;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t ii;
  void *v27;
  char has;
  id v29;

  v29 = a3;
  if (self->_wifiInfo)
    objc_msgSend(v29, "setWifiInfo:");
  if (-[HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo networkInfosCount](self, "networkInfosCount"))
  {
    objc_msgSend(v29, "clearNetworkInfos");
    v4 = -[HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo networkInfosCount](self, "networkInfosCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo networkInfoAtIndex:](self, "networkInfoAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addNetworkInfo:", v7);

      }
    }
  }
  if (-[HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo networkServiceInfosCount](self, "networkServiceInfosCount"))
  {
    objc_msgSend(v29, "clearNetworkServiceInfos");
    v8 = -[HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo networkServiceInfosCount](self, "networkServiceInfosCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo networkServiceInfoAtIndex:](self, "networkServiceInfoAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addNetworkServiceInfo:", v11);

      }
    }
  }
  if (self->_eventRouterServerInfo)
    objc_msgSend(v29, "setEventRouterServerInfo:");
  if (-[HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo visibleAccessoriesInfosCount](self, "visibleAccessoriesInfosCount"))
  {
    objc_msgSend(v29, "clearVisibleAccessoriesInfos");
    v12 = -[HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo visibleAccessoriesInfosCount](self, "visibleAccessoriesInfosCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo visibleAccessoriesInfoAtIndex:](self, "visibleAccessoriesInfoAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addVisibleAccessoriesInfo:", v15);

      }
    }
  }
  if (-[HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo visibleIDSDevicesCount](self, "visibleIDSDevicesCount"))
  {
    objc_msgSend(v29, "clearVisibleIDSDevices");
    v16 = -[HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo visibleIDSDevicesCount](self, "visibleIDSDevicesCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
      {
        -[HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo visibleIDSDevicesAtIndex:](self, "visibleIDSDevicesAtIndex:", m);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addVisibleIDSDevices:", v19);

      }
    }
  }
  if (-[HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo networkVisibleDeviceInfosCount](self, "networkVisibleDeviceInfosCount"))
  {
    objc_msgSend(v29, "clearNetworkVisibleDeviceInfos");
    v20 = -[HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo networkVisibleDeviceInfosCount](self, "networkVisibleDeviceInfosCount");
    if (v20)
    {
      v21 = v20;
      for (n = 0; n != v21; ++n)
      {
        -[HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo networkVisibleDeviceInfosAtIndex:](self, "networkVisibleDeviceInfosAtIndex:", n);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addNetworkVisibleDeviceInfos:", v23);

      }
    }
  }
  if (-[HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo proximityVisibleDeviceInfosCount](self, "proximityVisibleDeviceInfosCount"))
  {
    objc_msgSend(v29, "clearProximityVisibleDeviceInfos");
    v24 = -[HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo proximityVisibleDeviceInfosCount](self, "proximityVisibleDeviceInfosCount");
    if (v24)
    {
      v25 = v24;
      for (ii = 0; ii != v25; ++ii)
      {
        -[HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo proximityVisibleDeviceInfosAtIndex:](self, "proximityVisibleDeviceInfosAtIndex:", ii);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addProximityVisibleDeviceInfos:", v27);

      }
    }
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v29 + 1) = self->_numAppleMediaAccessories;
    *((_BYTE *)v29 + 88) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_QWORD *)v29 + 2) = self->_numResidents;
    *((_BYTE *)v29 + 88) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  id v20;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t m;
  void *v33;
  NSMutableArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t n;
  void *v39;
  NSMutableArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t ii;
  void *v45;
  char has;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
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
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HMAccessoryInfoProtoWifiNetworkInfoEvent copyWithZone:](self->_wifiInfo, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v6;

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v8 = self->_networkInfos;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v69 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addNetworkInfo:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
    }
    while (v10);
  }

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v14 = self->_networkServiceInfos;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v65;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v65 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addNetworkServiceInfo:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
    }
    while (v16);
  }

  v20 = -[HMRemoteEventRouterProtoServerDiagnosticInfo copyWithZone:](self->_eventRouterServerInfo, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v20;

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v22 = self->_visibleAccessoriesInfos;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v60, v75, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v61;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v61 != v25)
          objc_enumerationMutation(v22);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addVisibleAccessoriesInfo:", v27);

      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v60, v75, 16);
    }
    while (v24);
  }

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v28 = self->_visibleIDSDevices;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v56, v74, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v57;
    do
    {
      for (m = 0; m != v30; ++m)
      {
        if (*(_QWORD *)v57 != v31)
          objc_enumerationMutation(v28);
        v33 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addVisibleIDSDevices:", v33);

      }
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v56, v74, 16);
    }
    while (v30);
  }

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v34 = self->_networkVisibleDeviceInfos;
  v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v52, v73, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v53;
    do
    {
      for (n = 0; n != v36; ++n)
      {
        if (*(_QWORD *)v53 != v37)
          objc_enumerationMutation(v34);
        v39 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * n), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addNetworkVisibleDeviceInfos:", v39);

      }
      v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v52, v73, 16);
    }
    while (v36);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v40 = self->_proximityVisibleDeviceInfos;
  v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v48, v72, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v49;
    do
    {
      for (ii = 0; ii != v42; ++ii)
      {
        if (*(_QWORD *)v49 != v43)
          objc_enumerationMutation(v40);
        v45 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * ii), "copyWithZone:", a3, (_QWORD)v48);
        objc_msgSend((id)v5, "addProximityVisibleDeviceInfos:", v45);

      }
      v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v48, v72, 16);
    }
    while (v42);
  }

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_numAppleMediaAccessories;
    *(_BYTE *)(v5 + 88) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_numResidents;
    *(_BYTE *)(v5 + 88) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HMAccessoryInfoProtoWifiNetworkInfoEvent *wifiInfo;
  NSMutableArray *networkInfos;
  NSMutableArray *networkServiceInfos;
  HMRemoteEventRouterProtoServerDiagnosticInfo *eventRouterServerInfo;
  NSMutableArray *visibleAccessoriesInfos;
  NSMutableArray *visibleIDSDevices;
  NSMutableArray *networkVisibleDeviceInfos;
  NSMutableArray *proximityVisibleDeviceInfos;
  BOOL v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  wifiInfo = self->_wifiInfo;
  if ((unint64_t)wifiInfo | *((_QWORD *)v4 + 10))
  {
    if (!-[HMAccessoryInfoProtoWifiNetworkInfoEvent isEqual:](wifiInfo, "isEqual:"))
      goto LABEL_27;
  }
  networkInfos = self->_networkInfos;
  if ((unint64_t)networkInfos | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](networkInfos, "isEqual:"))
      goto LABEL_27;
  }
  networkServiceInfos = self->_networkServiceInfos;
  if ((unint64_t)networkServiceInfos | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](networkServiceInfos, "isEqual:"))
      goto LABEL_27;
  }
  eventRouterServerInfo = self->_eventRouterServerInfo;
  if ((unint64_t)eventRouterServerInfo | *((_QWORD *)v4 + 3))
  {
    if (!-[HMRemoteEventRouterProtoServerDiagnosticInfo isEqual:](eventRouterServerInfo, "isEqual:"))
      goto LABEL_27;
  }
  visibleAccessoriesInfos = self->_visibleAccessoriesInfos;
  if ((unint64_t)visibleAccessoriesInfos | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](visibleAccessoriesInfos, "isEqual:"))
      goto LABEL_27;
  }
  visibleIDSDevices = self->_visibleIDSDevices;
  if ((unint64_t)visibleIDSDevices | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](visibleIDSDevices, "isEqual:"))
      goto LABEL_27;
  }
  networkVisibleDeviceInfos = self->_networkVisibleDeviceInfos;
  if ((unint64_t)networkVisibleDeviceInfos | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](networkVisibleDeviceInfos, "isEqual:"))
      goto LABEL_27;
  }
  proximityVisibleDeviceInfos = self->_proximityVisibleDeviceInfos;
  if ((unint64_t)proximityVisibleDeviceInfos | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](proximityVisibleDeviceInfos, "isEqual:"))
      goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 1) == 0 || self->_numAppleMediaAccessories != *((_QWORD *)v4 + 1))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 88) & 1) != 0)
  {
LABEL_27:
    v13 = 0;
    goto LABEL_28;
  }
  v13 = (*((_BYTE *)v4 + 88) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 2) == 0 || self->_numResidents != *((_QWORD *)v4 + 2))
      goto LABEL_27;
    v13 = 1;
  }
LABEL_28:

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = -[HMAccessoryInfoProtoWifiNetworkInfoEvent hash](self->_wifiInfo, "hash");
  v4 = -[NSMutableArray hash](self->_networkInfos, "hash");
  v5 = -[NSMutableArray hash](self->_networkServiceInfos, "hash");
  v6 = -[HMRemoteEventRouterProtoServerDiagnosticInfo hash](self->_eventRouterServerInfo, "hash");
  v7 = -[NSMutableArray hash](self->_visibleAccessoriesInfos, "hash");
  v8 = -[NSMutableArray hash](self->_visibleIDSDevices, "hash");
  v9 = -[NSMutableArray hash](self->_networkVisibleDeviceInfos, "hash");
  v10 = -[NSMutableArray hash](self->_proximityVisibleDeviceInfos, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v11 = 2654435761 * self->_numAppleMediaAccessories;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
  v11 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v12 = 2654435761 * self->_numResidents;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HMAccessoryInfoProtoWifiNetworkInfoEvent *wifiInfo;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  HMRemoteEventRouterProtoServerDiagnosticInfo *eventRouterServerInfo;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t n;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t ii;
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
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  wifiInfo = self->_wifiInfo;
  v6 = *((_QWORD *)v4 + 10);
  if (wifiInfo)
  {
    if (v6)
      -[HMAccessoryInfoProtoWifiNetworkInfoEvent mergeFrom:](wifiInfo, "mergeFrom:");
  }
  else if (v6)
  {
    -[HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo setWifiInfo:](self, "setWifiInfo:");
  }
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v7 = *((id *)v4 + 4);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v61 != v10)
          objc_enumerationMutation(v7);
        -[HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo addNetworkInfo:](self, "addNetworkInfo:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
    }
    while (v9);
  }

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v12 = *((id *)v4 + 5);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v57;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v57 != v15)
          objc_enumerationMutation(v12);
        -[HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo addNetworkServiceInfo:](self, "addNetworkServiceInfo:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
    }
    while (v14);
  }

  eventRouterServerInfo = self->_eventRouterServerInfo;
  v18 = *((_QWORD *)v4 + 3);
  if (eventRouterServerInfo)
  {
    if (v18)
      -[HMRemoteEventRouterProtoServerDiagnosticInfo mergeFrom:](eventRouterServerInfo, "mergeFrom:");
  }
  else if (v18)
  {
    -[HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo setEventRouterServerInfo:](self, "setEventRouterServerInfo:");
  }
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v19 = *((id *)v4 + 8);
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v52, v67, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v53;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v53 != v22)
          objc_enumerationMutation(v19);
        -[HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo addVisibleAccessoriesInfo:](self, "addVisibleAccessoriesInfo:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * k));
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v52, v67, 16);
    }
    while (v21);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v24 = *((id *)v4 + 9);
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v48, v66, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v49;
    do
    {
      for (m = 0; m != v26; ++m)
      {
        if (*(_QWORD *)v49 != v27)
          objc_enumerationMutation(v24);
        -[HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo addVisibleIDSDevices:](self, "addVisibleIDSDevices:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * m));
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v48, v66, 16);
    }
    while (v26);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v29 = *((id *)v4 + 6);
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v65, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v45;
    do
    {
      for (n = 0; n != v31; ++n)
      {
        if (*(_QWORD *)v45 != v32)
          objc_enumerationMutation(v29);
        -[HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo addNetworkVisibleDeviceInfos:](self, "addNetworkVisibleDeviceInfos:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * n));
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v65, 16);
    }
    while (v31);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v34 = *((id *)v4 + 7);
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v40, v64, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v41;
    do
    {
      for (ii = 0; ii != v36; ++ii)
      {
        if (*(_QWORD *)v41 != v37)
          objc_enumerationMutation(v34);
        -[HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo addProximityVisibleDeviceInfos:](self, "addProximityVisibleDeviceInfos:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * ii), (_QWORD)v40);
      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v40, v64, 16);
    }
    while (v36);
  }

  v39 = *((_BYTE *)v4 + 88);
  if ((v39 & 1) != 0)
  {
    self->_numAppleMediaAccessories = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v39 = *((_BYTE *)v4 + 88);
  }
  if ((v39 & 2) != 0)
  {
    self->_numResidents = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (HMAccessoryInfoProtoWifiNetworkInfoEvent)wifiInfo
{
  return self->_wifiInfo;
}

- (void)setWifiInfo:(id)a3
{
  objc_storeStrong((id *)&self->_wifiInfo, a3);
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

- (HMRemoteEventRouterProtoServerDiagnosticInfo)eventRouterServerInfo
{
  return self->_eventRouterServerInfo;
}

- (void)setEventRouterServerInfo:(id)a3
{
  objc_storeStrong((id *)&self->_eventRouterServerInfo, a3);
}

- (NSMutableArray)visibleAccessoriesInfos
{
  return self->_visibleAccessoriesInfos;
}

- (void)setVisibleAccessoriesInfos:(id)a3
{
  objc_storeStrong((id *)&self->_visibleAccessoriesInfos, a3);
}

- (NSMutableArray)visibleIDSDevices
{
  return self->_visibleIDSDevices;
}

- (void)setVisibleIDSDevices:(id)a3
{
  objc_storeStrong((id *)&self->_visibleIDSDevices, a3);
}

- (NSMutableArray)networkVisibleDeviceInfos
{
  return self->_networkVisibleDeviceInfos;
}

- (void)setNetworkVisibleDeviceInfos:(id)a3
{
  objc_storeStrong((id *)&self->_networkVisibleDeviceInfos, a3);
}

- (NSMutableArray)proximityVisibleDeviceInfos
{
  return self->_proximityVisibleDeviceInfos;
}

- (void)setProximityVisibleDeviceInfos:(id)a3
{
  objc_storeStrong((id *)&self->_proximityVisibleDeviceInfos, a3);
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
  objc_storeStrong((id *)&self->_visibleIDSDevices, 0);
  objc_storeStrong((id *)&self->_visibleAccessoriesInfos, 0);
  objc_storeStrong((id *)&self->_proximityVisibleDeviceInfos, 0);
  objc_storeStrong((id *)&self->_networkVisibleDeviceInfos, 0);
  objc_storeStrong((id *)&self->_networkServiceInfos, 0);
  objc_storeStrong((id *)&self->_networkInfos, 0);
  objc_storeStrong((id *)&self->_eventRouterServerInfo, 0);
}

+ (Class)networkInfoType
{
  return (Class)objc_opt_class();
}

+ (Class)networkServiceInfoType
{
  return (Class)objc_opt_class();
}

+ (Class)visibleAccessoriesInfoType
{
  return (Class)objc_opt_class();
}

+ (Class)visibleIDSDevicesType
{
  return (Class)objc_opt_class();
}

+ (Class)networkVisibleDeviceInfosType
{
  return (Class)objc_opt_class();
}

+ (Class)proximityVisibleDeviceInfosType
{
  return (Class)objc_opt_class();
}

@end
