@implementation EAAccessory

- (EAAccessory)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("EAAccessoryInitException"), CFSTR("-init not supported. EAAccessoryManager is responsible for creating all objects."));
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)__gLocationLock, "lock");
  NSLog(CFSTR("[#Location] EA detach in progress, logging remaining NMEA Sentences"));
  while (-[NSMutableArray count](-[EAAccessoryInternal enqueuedNMEASentences](self->_internal, "enqueuedNMEASentences"), "count"))
  {
    -[EAAccessory logNMEATimestampDelays:timestamps:](self, "logNMEATimestampDelays:timestamps:", -[NSMutableArray objectAtIndex:](-[EAAccessoryInternal enqueuedNMEASentences](self->_internal, "enqueuedNMEASentences"), "objectAtIndex:", 0), -[NSMutableArray objectAtIndex:](-[EAAccessoryInternal enqueuedNMEATimestamps](self->_internal, "enqueuedNMEATimestamps"), "objectAtIndex:", 0));
    -[NSMutableArray removeObjectAtIndex:](-[EAAccessoryInternal enqueuedNMEASentences](self->_internal, "enqueuedNMEASentences"), "removeObjectAtIndex:", 0);
    -[NSMutableArray removeObjectAtIndex:](-[EAAccessoryInternal enqueuedNMEATimestamps](self->_internal, "enqueuedNMEATimestamps"), "removeObjectAtIndex:", 0);
  }
  objc_msgSend((id)__gLocationLock, "unlock");
  NSLog(CFSTR("[#Location] EA detach sentence logging done!"));

  v3.receiver = self;
  v3.super_class = (Class)EAAccessory;
  -[EAAccessory dealloc](&v3, sel_dealloc);
}

- (id)description
{
  _BOOL4 v3;
  const __CFString *v4;
  id v6;
  void *v7;
  objc_super v8;

  v7 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)EAAccessory;
  v6 = -[EAAccessory description](&v8, sel_description);
  v3 = -[EAAccessory isConnected](self, "isConnected");
  v4 = CFSTR("NO");
  if (v3)
    v4 = CFSTR("YES");
  return (id)objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ { \n  connected:%@ \n  connectionID:%lu \n  name: %@ \n  manufacturer: %@ \n  modelNumber: %@ \n  serialNumber: %@ \n  ppid: %@ \n  regioncode: %@ \n  firmwareRevisionActive: %@ \n  firmwareRevisionPending: %@ \n  hardwareRevision: %@ \n  dockType: %@ \n  certSerial: %lu bytes \n  certData: %lu bytes \n  protocols: %@ \n  delegate: %@ \n}"), v6, v4, -[EAAccessory connectionID](self, "connectionID"), -[EAAccessory name](self, "name"), -[EAAccessory manufacturer](self, "manufacturer"), -[EAAccessory modelNumber](self, "modelNumber"), -[EAAccessory serialNumber](self, "serialNumber"), -[EAAccessory ppid](self, "ppid"), -[EAAccessory regionCode](self, "regionCode"), -[EAAccessory firmwareRevisionActive](self, "firmwareRevisionActive"), -[EAAccessory firmwareRevisionPending](self, "firmwareRevisionPending"), -[EAAccessory hardwareRevision](self, "hardwareRevision"), -[EAAccessory dockType](self, "dockType"), objc_msgSend(-[EAAccessory certSerial](self, "certSerial"), "length"), objc_msgSend(-[EAAccessory certData](self, "certData"), "length"), -[EAAccessory protocolStrings](self, "protocolStrings"),
               -[EAAccessory delegate](self, "delegate"));
}

- (BOOL)isConnected
{
  return -[EAAccessoryInternal connected](self->_internal, "connected");
}

- (NSUInteger)connectionID
{
  return -[EAAccessoryInternal connectionID](self->_internal, "connectionID");
}

- (NSString)manufacturer
{
  return -[EAAccessoryInternal manufacturer](self->_internal, "manufacturer");
}

- (NSString)name
{
  return -[EAAccessoryInternal name](self->_internal, "name");
}

- (NSString)modelNumber
{
  return -[EAAccessoryInternal modelNumber](self->_internal, "modelNumber");
}

- (NSString)serialNumber
{
  return -[EAAccessoryInternal serialNumber](self->_internal, "serialNumber");
}

- (id)firmwareRevisionActive
{
  return -[EAAccessoryInternal firmwareRevisionActive](self->_internal, "firmwareRevisionActive");
}

- (id)firmwareRevisionPending
{
  return -[EAAccessoryInternal firmwareRevisionPending](self->_internal, "firmwareRevisionPending");
}

- (NSString)hardwareRevision
{
  return -[EAAccessoryInternal hardwareRevision](self->_internal, "hardwareRevision");
}

- (int64_t)transportType
{
  return -[EAAccessoryInternal transportType](self->_internal, "transportType");
}

- (NSString)dockType
{
  return -[EAAccessoryInternal dockType](self->_internal, "dockType");
}

- (void)setDelegate:(id)delegate
{
  -[EAAccessoryInternal setDelegate:](self->_internal, "setDelegate:", delegate);
}

- (NSArray)protocolStrings
{
  NSArray *v2;
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = -[NSDictionary allKeys](-[EAAccessoryInternal protocols](self->_internal, "protocols"), "allKeys");
  if (!-[EAAccessoryManager shouldAllowInternalProtocols](+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"), "shouldAllowInternalProtocols"))
  {
    v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v2);
          v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
          if (objc_msgSend(v8, "caseInsensitiveCompare:", CFSTR("com.apple.update")))
            -[NSArray addObject:](v3, "addObject:", v8);
        }
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }
    return v3;
  }
  return v2;
}

- (id)delegate
{
  return -[EAAccessoryInternal delegate](self->_internal, "delegate");
}

- (id)bonjourName
{
  return 0;
}

- (BOOL)hasIPConnection
{
  return 0;
}

- (BOOL)isAvailableOverBonjour
{
  return 0;
}

- (BOOL)supportsCarPlay
{
  return (-[EAAccessoryInternal capabilities](self->_internal, "capabilities") >> 10) & 1;
}

- (BOOL)supportsOOBBTPairing
{
  return (-[EAAccessoryInternal capabilities](self->_internal, "capabilities") >> 13) & 1;
}

- (BOOL)supportsOOBBTPairing2
{
  return (-[EAAccessoryInternal capabilities](self->_internal, "capabilities") >> 19) & 1;
}

- (BOOL)supportsUSBCarPlay
{
  return (-[EAAccessoryInternal capabilities](self->_internal, "capabilities") >> 14) & 1;
}

- (BOOL)supportsWirelessCarPlay
{
  return (-[EAAccessoryInternal capabilities](self->_internal, "capabilities") >> 12) & 1;
}

- (BOOL)supportsCarPlayAppLinks
{
  return (-[EAAccessoryInternal capabilities](self->_internal, "capabilities") >> 18) & 1;
}

- (BOOL)supportsCarPlayConnectionRequest
{
  return (-[EAAccessoryInternal capabilities](self->_internal, "capabilities") >> 20) & 1;
}

- (BOOL)createdByCoreAccessories
{
  return -[EAAccessoryInternal createdByCoreAccessories](self->_internal, "createdByCoreAccessories");
}

- (id)coreAccessoriesPrimaryUUID
{
  return (id)-[NSString copy](-[EAAccessoryInternal coreAccessoryPrimaryUUID](self->_internal, "coreAccessoryPrimaryUUID"), "copy");
}

- (unsigned)accessoryCapabilities
{
  if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"))
    NSLog(CFSTR("[#ExternalAccessory] %s:%s returning accessory capabilities 0x%X"), "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAAccessory.mm", "-[EAAccessory accessoryCapabilities]", -[EAAccessoryInternal capabilities](self->_internal, "capabilities"));
  return -[EAAccessoryInternal capabilities](self->_internal, "capabilities");
}

- (id)_initWithAccessory:(id)a3
{
  EAAccessory *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EAAccessory;
  v4 = -[EAAccessory init](&v6, sel_init);
  if (v4)
    v4->_internal = (EAAccessoryInternal *)a3;
  return v4;
}

- (void)_updateAccessoryInfo:(id)a3
{
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v5 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D33B78]);
  if (v5)
  {
    v6 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = 0;
    else
      v7 = v6;
    -[EAAccessoryInternal setName:](self->_internal, "setName:", v7);
  }
  v8 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D33B68]);
  if (v8)
  {
    v9 = v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = 0;
    else
      v10 = v9;
    -[EAAccessoryInternal setManufacturer:](self->_internal, "setManufacturer:", v10);
  }
  v11 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D33B70]);
  if (v11)
  {
    v12 = v11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = 0;
    else
      v13 = v12;
    -[EAAccessoryInternal setModelNumber:](self->_internal, "setModelNumber:", v13);
  }
  v14 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D33BE0]);
  if (v14)
  {
    v15 = v14;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = 0;
    else
      v16 = v15;
    -[EAAccessoryInternal setSerialNumber:](self->_internal, "setSerialNumber:", v16);
  }
  v17 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D33B40]);
  if (v17)
  {
    v18 = v17;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = 0;
    else
      v19 = v18;
    -[EAAccessoryInternal setFirmwareRevisionActive:](self->_internal, "setFirmwareRevisionActive:", v19);
  }
  v20 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D33B48]);
  if (v20)
  {
    v21 = v20;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = 0;
    else
      v22 = v21;
    -[EAAccessoryInternal setFirmwareRevisionPending:](self->_internal, "setFirmwareRevisionPending:", v22);
  }
  v23 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D33B50]);
  if (v23)
  {
    v24 = v23;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v25 = 0;
    else
      v25 = v24;
    -[EAAccessoryInternal setHardwareRevision:](self->_internal, "setHardwareRevision:", v25);
  }
  v26 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D33B38]);
  if (v26)
  {
    v27 = v26;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v28 = 0;
    else
      v28 = v27;
    -[EAAccessoryInternal setDockType:](self->_internal, "setDockType:", v28);
  }
  v29 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D33B60]);
  if (v29)
  {
    v30 = v29;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v31 = 0;
    else
      v31 = v30;
    -[EAAccessoryInternal setMacAddress:](self->_internal, "setMacAddress:", v31);
  }
  v32 = *MEMORY[0x1E0D33BA0];
  if (objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D33BA0]))
    -[EAAccessoryInternal setPointOfInterestHandoffEnabled:](self->_internal, "setPointOfInterestHandoffEnabled:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", v32), "BOOLValue"));
}

- (id)_shortDescription
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EAAccessory;
  return -[EAAccessory description](&v3, sel_description);
}

- (void)_setConnected:(BOOL)a3
{
  -[EAAccessoryInternal setConnected:](self->_internal, "setConnected:", a3);
}

- (void)_setNotPresentInIAPAccessoriesArray:(BOOL)a3
{
  -[EAAccessoryInternal setNotPresentInIAPAccessoriesArray:](self->_internal, "setNotPresentInIAPAccessoriesArray:", a3);
}

- (id)_protocolIDForProtocolString:(id)a3
{
  NSDictionary *v4;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  v4 = -[EAAccessoryInternal protocols](self->_internal, "protocols");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__EAAccessory__protocolIDForProtocolString___block_invoke;
  v7[3] = &unk_1E6B07D10;
  v7[4] = a3;
  v7[5] = &v8;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v4, "enumerateKeysAndObjectsUsingBlock:", v7);
  v5 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __44__EAAccessory__protocolIDForProtocolString___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "caseInsensitiveCompare:", *(_QWORD *)(a1 + 32));
  if (!result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a3;
    *a4 = 1;
  }
  return result;
}

- (void)_addSession:(id)a3
{
  -[EAAccessoryInternal addSession:](self->_internal, "addSession:", a3);
}

- (void)_removeSession:(id)a3
{
  -[EAAccessoryInternal removeSession:](self->_internal, "removeSession:", a3);
}

- (void)_openCompleteForSession:(unsigned int)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = -[EAAccessoryInternal sessionsList](self->_internal, "sessionsList");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
      if (objc_msgSend(v9, "_sessionID") == a3)
        break;
      if (v6 == ++v8)
      {
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v9 = 0;
  }
  objc_msgSend(v9, "setOpenCompleted:", 1);
}

- (void)_endSession:(unsigned int)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = -[EAAccessoryInternal sessionsList](self->_internal, "sessionsList");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      v9 = 0;
      v10 = v7 + v6;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "_sessionID") == a3)
        {
          objc_msgSend(-[NSArray objectAtIndex:](v4, "objectAtIndex:", (v7 + v9)), "_endStreams");
          return;
        }
        ++v9;
      }
      while (v6 != v9);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v7 = v10;
      if (v6)
        continue;
      break;
    }
  }
}

- (id)_createWakeToken
{
  uint64_t v2;

  v2 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", -[EAAccessory macAddress](self, "macAddress"), CFSTR("EAAccessoryMacAddress"));
  return (id)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v2, 200, 0, 0);
}

- (unsigned)_internalConnectionID
{
  return -[EAAccessoryInternal connectionID](self->_internal, "connectionID");
}

- (BOOL)_internalNotPresentInIAPAccessoriesArray
{
  return -[EAAccessoryInternal notPresentInIAPAccessoriesArray](self->_internal, "notPresentInIAPAccessoriesArray");
}

- (void)logNMEATimestampDelays:(id)a3 timestamps:(id)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;

  -[EAAccessory getNMEATimestampAverageSamples](self, "getNMEATimestampAverageSamples");
  if (a4)
  {
    v8 = v7;
    objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 0), "doubleValue");
    v10 = v9;
    objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 1), "doubleValue");
    v12 = v11;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "date"), "timeIntervalSince1970");
    v13 = v12 - v10;
    v15 = v14 - v12;
    -[NSNumber doubleValue](-[EAAccessoryInternal highestXPCDelay](self->_internal, "highestXPCDelay"), "doubleValue");
    if (v13 > v16)
      -[EAAccessoryInternal setHighestXPCDelay:](self->_internal, "setHighestXPCDelay:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13));
    -[NSNumber doubleValue](-[EAAccessoryInternal highestFrameworkDelay](self->_internal, "highestFrameworkDelay"), "doubleValue");
    if (v15 > v17)
      -[EAAccessoryInternal setHighestFrameworkDelay:](self->_internal, "setHighestFrameworkDelay:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15));
    -[NSNumber doubleValue](-[EAAccessoryInternal averageXPCDelay](self->_internal, "averageXPCDelay"), "doubleValue");
    v18 = (void *)MEMORY[0x1E0CB37E8];
    if (v19 == 0.0)
    {
      v20 = (void *)MEMORY[0x1E0CB37E8];
      v21 = v13;
    }
    else
    {
      -[NSNumber doubleValue](-[EAAccessoryInternal averageXPCDelay](self->_internal, "averageXPCDelay"), "doubleValue");
      v23 = v22;
      -[NSNumber doubleValue](-[EAAccessoryInternal averageXPCDelay](self->_internal, "averageXPCDelay"), "doubleValue");
      -[EAAccessoryInternal setAverageXPCDelay:](self->_internal, "setAverageXPCDelay:", objc_msgSend(v18, "numberWithDouble:", v23 - v24 / v8));
      v25 = (void *)MEMORY[0x1E0CB37E8];
      -[NSNumber doubleValue](-[EAAccessoryInternal averageXPCDelay](self->_internal, "averageXPCDelay"), "doubleValue");
      v21 = v13 / v8 + v26;
      v20 = v25;
    }
    -[EAAccessoryInternal setAverageXPCDelay:](self->_internal, "setAverageXPCDelay:", objc_msgSend(v20, "numberWithDouble:", v21));
    -[NSNumber doubleValue](-[EAAccessoryInternal averageXPCDelay](self->_internal, "averageXPCDelay"), "doubleValue");
    v27 = (void *)MEMORY[0x1E0CB37E8];
    if (v28 == 0.0)
    {
      -[EAAccessoryInternal setAverageXPCDelay:](self->_internal, "setAverageXPCDelay:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13));
    }
    else
    {
      -[NSNumber doubleValue](-[EAAccessoryInternal averageFrameworkDelay](self->_internal, "averageFrameworkDelay"), "doubleValue");
      v30 = v29;
      -[NSNumber doubleValue](-[EAAccessoryInternal averageFrameworkDelay](self->_internal, "averageFrameworkDelay"), "doubleValue");
      -[EAAccessoryInternal setAverageFrameworkDelay:](self->_internal, "setAverageFrameworkDelay:", objc_msgSend(v27, "numberWithDouble:", v30 - v31 / v8));
      v32 = (void *)MEMORY[0x1E0CB37E8];
      -[NSNumber doubleValue](-[EAAccessoryInternal averageFrameworkDelay](self->_internal, "averageFrameworkDelay"), "doubleValue");
      -[EAAccessoryInternal setAverageFrameworkDelay:](self->_internal, "setAverageFrameworkDelay:", objc_msgSend(v32, "numberWithDouble:", v15 / v8 + v33));
    }
    NSLog(CFSTR("[#Location] Current delays: XPC: %f Framework: %f, Highest: XPC: %@ Framework: %@, Average: XPC: %@ Framework: %@, Sentence: %@"), *(_QWORD *)&v13, *(_QWORD *)&v15, -[EAAccessoryInternal highestXPCDelay](self->_internal, "highestXPCDelay"), -[EAAccessoryInternal highestFrameworkDelay](self->_internal, "highestFrameworkDelay"), -[EAAccessoryInternal averageXPCDelay](self->_internal, "averageXPCDelay"), -[EAAccessoryInternal averageFrameworkDelay](self->_internal, "averageFrameworkDelay"), a3);
  }
  else
  {
    NSLog(CFSTR("[#Location] An NMEA sentence was not timestamped!"));
  }
}

- (id)macAddress
{
  return -[EAAccessoryInternal macAddress](self->_internal, "macAddress");
}

- (id)certSerial
{
  return -[EAAccessoryInternal certSerial](self->_internal, "certSerial");
}

- (id)certData
{
  return -[EAAccessoryInternal certData](self->_internal, "certData");
}

- (id)ppid
{
  return -[EAAccessoryInternal ppid](self->_internal, "ppid");
}

- (id)regionCode
{
  return -[EAAccessoryInternal regionCode](self->_internal, "regionCode");
}

- (id)protocolDetails
{
  return -[EAAccessoryInternal protocolDetails](self->_internal, "protocolDetails");
}

- (BOOL)supportsPublicIap
{
  _BOOL4 v3;

  if ((-[EAAccessoryInternal capabilities](self->_internal, "capabilities") & 1) != 0)
  {
    if (objc_msgSend(-[EAAccessory allPublicProtocolStrings](self, "allPublicProtocolStrings"), "count"))
    {
      LOBYTE(v3) = 1;
      return v3;
    }
    v3 = +[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled");
    if (!v3)
      return v3;
    NSLog(CFSTR("[#ExternalAccessory] %s:%s supports Public iAP but has no public EA protocols"), "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAAccessory.mm", "-[EAAccessory supportsPublicIap]");
  }
  LOBYTE(v3) = 0;
  return v3;
}

- (BOOL)shouldBeHiddenFromUI
{
  return (-[EAAccessoryInternal capabilities](self->_internal, "capabilities") >> 8) & 1;
}

- (id)preferredApp
{
  return -[EAAccessoryInternal preferredApp](self->_internal, "preferredApp");
}

- (int)classType
{
  return -[EAAccessoryInternal classType](self->_internal, "classType");
}

- (id)audioPorts
{
  return -[EAAccessoryInternal audioPorts](self->_internal, "audioPorts");
}

- (id)allPublicProtocolStrings
{
  NSArray *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = -[EAAccessory protocolStrings](self, "protocolStrings");
  v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v2, "count"));
  v17 = 0;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", *MEMORY[0x1E0D33CE0], 1, &v17);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("com.apple.accessory.cli.*"), 1, &v17);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v2);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        if (v3)
        {
          v10 = objc_msgSend(v3, "numberOfMatchesInString:options:range:", v9, 0, 0, objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "length"));
          if (v10)
            goto LABEL_12;
        }
        else
        {
          v10 = 0;
        }
        if (v4)
          v10 = objc_msgSend(v4, "numberOfMatchesInString:options:range:", v9, 0, 0, objc_msgSend(v9, "length"));
LABEL_12:
        if (v10 || !objc_msgSend(v9, "caseInsensitiveCompare:", CFSTR("com.apple.iPodOut")))
        {
          if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"))
            NSLog(CFSTR("[#ExternalAccessory] %s:%s found whitelisted protocol %@"), "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAAccessory.mm", "-[EAAccessory allPublicProtocolStrings]", v9);
        }
        else
        {
          NSLog(CFSTR("[#ExternalAccessory] Adding protocol to array %@"), v9);
          objc_msgSend(v12, "addObject:", v9);
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v6);
  }
  return v12;
}

- (id)dictionaryWithLowercaseKeys:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(a3, "count"));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(a3);
        objc_msgSend(v4, "setObject:forKey:", objc_msgSend(a3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8)), objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "lowercaseString"));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return v4;
}

- (BOOL)containsSameProtocolsAsiAPAccessoryProtocols:(id)a3
{
  return objc_msgSend(-[EAAccessory dictionaryWithLowercaseKeys:](self, "dictionaryWithLowercaseKeys:", a3), "isEqualToDictionary:", -[EAAccessory dictionaryWithLowercaseKeys:](self, "dictionaryWithLowercaseKeys:", -[EAAccessoryInternal protocols](self->_internal, "protocols")));
}

- (void)setEqNames:(id)a3
{
  -[EAAccessoryInternal setEqNames:](self->_internal, "setEqNames:", a3);
}

- (id)eqNames
{
  return -[EAAccessoryInternal eqNames](self->_internal, "eqNames");
}

- (void)setEqIndex:(unsigned int)a3
{
  -[EAAccessoryInternal setEqIndex:](self->_internal, "setEqIndex:");
  -[EAAccessoryInternal connectionID](self->_internal, "connectionID");
  IAPAccessoryEQSelectEqualizerAtIndex();
}

- (unsigned)eqIndex
{
  return -[EAAccessoryInternal eqIndex](self->_internal, "eqIndex");
}

- (void)setPointOfInterestHandoffEnabled:(BOOL)a3
{
  -[EAAccessoryInternal setPointOfInterestHandoffEnabled:](self->_internal, "setPointOfInterestHandoffEnabled:", a3);
}

- (BOOL)pointOfInterestHandoffEnabled
{
  return -[EAAccessoryInternal pointOfInterestHandoffEnabled](self->_internal, "pointOfInterestHandoffEnabled");
}

- (void)setDestinationSharingOptions:(unint64_t)a3
{
  -[EAAccessoryInternal setDestinationSharingOptions:](self->_internal, "setDestinationSharingOptions:", a3);
}

- (unint64_t)destinationSharingOptions
{
  return -[EAAccessoryInternal destinationSharingOptions](self->_internal, "destinationSharingOptions");
}

- (int)locationSentenceTypesMask
{
  return -[EAAccessoryInternal locationSentenceTypesMask](self->_internal, "locationSentenceTypesMask");
}

- (void)setLocationSentenceTypesMask:(int)a3
{
  -[EAAccessoryInternal setLocationSentenceTypesMask:](self->_internal, "setLocationSentenceTypesMask:", *(_QWORD *)&a3);
}

- (BOOL)supportsLocation
{
  return (-[EAAccessoryInternal capabilities](self->_internal, "capabilities") >> 3) & 1;
}

- (BOOL)supportsCamera
{
  return (-[EAAccessoryInternal capabilities](self->_internal, "capabilities") >> 11) & 1;
}

- (BOOL)accessoryHasNMEASentencesAvailable
{
  BOOL v3;

  if (-[EAAccessory createdByCoreAccessories](self, "createdByCoreAccessories"))
  {
    objc_msgSend((id)__gLocationLock, "lock");
    v3 = -[NSMutableArray count](-[EAAccessoryInternal enqueuedNMEASentences](self->_internal, "enqueuedNMEASentences"), "count") != 0;
    objc_msgSend((id)__gLocationLock, "unlock");
  }
  else
  {
    -[EAAccessoryInternal connectionID](self->_internal, "connectionID");
    IAPLocationIsNMEADataAvailable();
    return 0;
  }
  return v3;
}

- (BOOL)getNMEASentence:(id *)a3
{
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  unint64_t v10;
  id v11;
  id v13;

  v13 = 0;
  v5 = (void *)MEMORY[0x1BCC9F98C](self, a2);
  v6 = -[EAAccessoryInternal nmeaSentenceAddCounter](self->_internal, "nmeaSentenceAddCounter");
  if (-[EAAccessory createdByCoreAccessories](self, "createdByCoreAccessories"))
  {
    objc_msgSend((id)__gLocationLock, "lock");
    if (-[NSMutableArray count](-[EAAccessoryInternal enqueuedNMEASentences](self->_internal, "enqueuedNMEASentences"), "count"))
    {
      v7 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](-[EAAccessoryInternal enqueuedNMEASentences](self->_internal, "enqueuedNMEASentences"), "objectAtIndex:", 0), "copy");
      v13 = (id)v7;
      -[NSMutableArray removeObjectAtIndex:](-[EAAccessoryInternal enqueuedNMEASentences](self->_internal, "enqueuedNMEASentences"), "removeObjectAtIndex:", 0);
      v8 = (void *)-[NSMutableArray objectAtIndex:](-[EAAccessoryInternal enqueuedNMEATimestamps](self->_internal, "enqueuedNMEATimestamps"), "objectAtIndex:", 0);
      v9 = v8;
      -[NSMutableArray removeObjectAtIndex:](-[EAAccessoryInternal enqueuedNMEATimestamps](self->_internal, "enqueuedNMEATimestamps"), "removeObjectAtIndex:", 0);
      -[EAAccessoryInternal setNmeaSentenceGetCounter:](self->_internal, "setNmeaSentenceGetCounter:", -[EAAccessoryInternal nmeaSentenceGetCounter](self->_internal, "nmeaSentenceGetCounter") + 1);
      if (v7)
      {
        v10 = v6 % 0xF;
        if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled") || !v10)
          -[EAAccessory logNMEATimestampDelays:timestamps:](self, "logNMEATimestampDelays:timestamps:", v7, v8);

        if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled") || !v10)
          NSLog(CFSTR("[#Location] (%d/%llu/%llu/%d) getNMEASentence: %@, enqueued count %lu"), +[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"), v6, -[EAAccessoryInternal nmeaSentenceGetCounter](self->_internal, "nmeaSentenceGetCounter"), 15, v7, -[NSMutableArray count](-[EAAccessoryInternal enqueuedNMEASentences](self->_internal, "enqueuedNMEASentences"), "count"));
      }
      else
      {

      }
    }
    objc_msgSend((id)__gLocationLock, "unlock");
  }
  else
  {
    -[EAAccessoryInternal connectionID](self->_internal, "connectionID");
    IAPLocationCopyNMEAData();
  }
  objc_autoreleasePoolPop(v5);
  if (v13)
  {
    *a3 = v13;
    v11 = v13;
  }
  return 1;
}

- (void)addNMEASentence:(id)a3 withTimestamps:(id)a4
{
  void *v7;
  void *v8;
  unint64_t v9;

  objc_msgSend((id)__gLocationLock, "lock");
  v7 = (void *)objc_msgSend(a3, "copy");
  v8 = (void *)objc_msgSend(a4, "copy");
  -[NSMutableArray addObject:](-[EAAccessoryInternal enqueuedNMEASentences](self->_internal, "enqueuedNMEASentences"), "addObject:", v7);
  -[NSMutableArray addObject:](-[EAAccessoryInternal enqueuedNMEATimestamps](self->_internal, "enqueuedNMEATimestamps"), "addObject:", v8);
  -[EAAccessoryInternal setNmeaSentenceAddCounter:](self->_internal, "setNmeaSentenceAddCounter:", -[EAAccessoryInternal nmeaSentenceAddCounter](self->_internal, "nmeaSentenceAddCounter") + 1);
  v9 = -[EAAccessoryInternal nmeaSentenceAddCounter](self->_internal, "nmeaSentenceAddCounter");
  if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled")
    || +[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled")
    || !(v9 % 0xF))
  {
    NSLog(CFSTR("[#Location] (%d/%llu/%llu/%d) addNMEASentence: %@, enqueued count %lu"), +[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"), v9, -[EAAccessoryInternal nmeaSentenceGetCounter](self->_internal, "nmeaSentenceGetCounter"), 15, a3, -[NSMutableArray count](-[EAAccessoryInternal enqueuedNMEASentences](self->_internal, "enqueuedNMEASentences"), "count"));
  }

  objc_msgSend((id)__gLocationLock, "unlock");
}

- (BOOL)setNMEASentencesToFilter:(id)a3
{
  if (-[EAAccessory createdByCoreAccessories](self, "createdByCoreAccessories"))
  {
    NSLog(CFSTR("[#Location] setNMEASentencesToFilter: created by core accessories, set NMEA senteneces to filter"));
    -[EAAccessoryManager sendNMEAFilterList:forUUID:](+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"), "sendNMEAFilterList:forUUID:", a3, -[EAAccessory coreAccessoriesPrimaryUUID](self, "coreAccessoriesPrimaryUUID"));
    return 1;
  }
  else
  {
    NSLog(CFSTR("[#Location] setNMEASentencesToFilter: not created by core accessories"));
    -[EAAccessoryInternal connectionID](self->_internal, "connectionID");
    return IAPlocationSetAccessoryNMEAFilter() != 0;
  }
}

- (double)getNMEATimestampAverageSamples
{
  CFPropertyListRef v2;
  double result;

  v2 = CFPreferencesCopyValue(CFSTR("NMEATimestampAverageSamples"), CFSTR("com.apple.logging"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B250]);
  objc_msgSend((id)(id)CFMakeCollectable(v2), "doubleValue");
  if (result == 0.0)
    return *(double *)&EADefaultNMEATimestampAverageSamples;
  return result;
}

- (void)setIAPTimeSyncParams:(id)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("EATimeSyncOffsetUncertaintyThreshold"));
  v6 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("EATimeSyncOffsetMeasurementInterval"));
  -[EAAccessoryInternal connectionID](self->_internal, "connectionID");
  objc_msgSend(v5, "unsignedLongLongValue");
  objc_msgSend(v6, "unsignedIntValue");
  IAPTimeSyncSetParams();
}

- (void)getIAPTimeSyncInfo:(id)a3 completionHandler:(id)a4
{
  -[EAAccessoryInternal connectionID](self->_internal, "connectionID");
  IAPTimeSyncGetInfo();
}

- (void)resetIAPTimeSyncKalmanFilter
{
  -[EAAccessoryInternal connectionID](self->_internal, "connectionID");
  IAPTimeSyncResetKalmanFilter();
}

- (BOOL)getEphemerisURL:(id *)a3
{
  if (!-[EAAccessory createdByCoreAccessories](self, "createdByCoreAccessories"))
  {
    -[EAAccessoryInternal connectionID](self->_internal, "connectionID");
    IAPLocationCopyEphemerisURL();
  }
  return 1;
}

- (BOOL)getEphemerisRecommendRefreshInterval:(double *)a3
{
  double v5;
  int EphemerisRecommendedRefreshInterval;

  v5 = 0.0;
  if (-[EAAccessory createdByCoreAccessories](self, "createdByCoreAccessories"))
  {
    LOBYTE(EphemerisRecommendedRefreshInterval) = 0;
  }
  else
  {
    -[EAAccessoryInternal connectionID](self->_internal, "connectionID");
    EphemerisRecommendedRefreshInterval = IAPLocationGetEphemerisRecommendedRefreshInterval();
    if (EphemerisRecommendedRefreshInterval)
    {
      v5 = (double)0;
      LOBYTE(EphemerisRecommendedRefreshInterval) = 0;
    }
  }
  *a3 = v5;
  return EphemerisRecommendedRefreshInterval;
}

- (BOOL)getEphemerisExpirationInterval:(double *)a3
{
  double v5;
  int EphemerisMaxInterval;

  v5 = 0.0;
  if (-[EAAccessory createdByCoreAccessories](self, "createdByCoreAccessories"))
  {
    LOBYTE(EphemerisMaxInterval) = 0;
  }
  else
  {
    -[EAAccessoryInternal connectionID](self->_internal, "connectionID");
    EphemerisMaxInterval = IAPLocationGetEphemerisMaxInterval();
    if (EphemerisMaxInterval)
    {
      v5 = (double)0;
      LOBYTE(EphemerisMaxInterval) = 0;
    }
  }
  *a3 = v5;
  return EphemerisMaxInterval;
}

- (BOOL)sendGpsWeek:(unint64_t)a3 gpsTOW:(double)a4
{
  if (-[EAAccessory createdByCoreAccessories](self, "createdByCoreAccessories"))
    return 1;
  -[EAAccessoryInternal connectionID](self->_internal, "connectionID");
  return IAPLocationSendGPSTime() != 0;
}

- (BOOL)sendEphemerisPointDataGpsWeek:(unint64_t)a3 gpsTOW:(double)a4 latitude:(double)a5 longitude:(double)a6 accuracy:(unsigned __int16)a7
{
  if (-[EAAccessory createdByCoreAccessories](self, "createdByCoreAccessories"))
    return 1;
  -[EAAccessoryInternal connectionID](self->_internal, "connectionID");
  return IAPLocationSendEphemerisPointData() != 0;
}

- (BOOL)sendEphemeris:(id)a3
{
  if (-[EAAccessory createdByCoreAccessories](self, "createdByCoreAccessories"))
    return 1;
  -[EAAccessoryInternal connectionID](self->_internal, "connectionID");
  return IAPLocationSendEphemeris() != 0;
}

- (BOOL)sendGPRMCDataStatusValueA:(BOOL)a3 ValueV:(BOOL)a4 ValueX:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  _BOOL8 v7;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  if (-[EAAccessory createdByCoreAccessories](self, "createdByCoreAccessories"))
  {
    -[EAAccessoryManager sendGPRMCDataStatus:ValueV:ValueX:forUUID:](+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"), "sendGPRMCDataStatus:ValueV:ValueX:forUUID:", v7, v6, v5, -[EAAccessory coreAccessoriesPrimaryUUID](self, "coreAccessoriesPrimaryUUID"));
    return 1;
  }
  else
  {
    -[EAAccessoryInternal connectionID](self->_internal, "connectionID");
    return IAPlocationSendGPRMCDataStatusValues() != 0;
  }
}

- (BOOL)sendPointOfInterestInformation:(id)a3 identifier:(unsigned __int16)a4
{
  NSLog(CFSTR("[#ExternalAccessory] WARNING: -sendPointOfInterestInformation:identifier is deprecated and will be removed!"), a2, a3, a4);
  return 0;
}

- (BOOL)sendDestinationInformation:(id)a3 identifier:(id)a4
{
  void *v7;

  if (-[EAAccessory createdByCoreAccessories](self, "createdByCoreAccessories"))
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a3);
    objc_msgSend(v7, "setObject:forKey:", a4, *MEMORY[0x1E0D33BB0]);
    -[EAAccessoryManager destinationInformation:forAccessoryUUID:](+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"), "destinationInformation:forAccessoryUUID:", v7, -[EAAccessory coreAccessoriesPrimaryUUID](self, "coreAccessoriesPrimaryUUID"));
    return 1;
  }
  else
  {
    -[EAAccessoryInternal connectionID](self->_internal, "connectionID");
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:", a3);
    return IAPAppSendPointOfInterestInformation();
  }
}

- (void)beginOOBBTPairingWithCompletionBlock:(id)a3
{
  -[EAAccessoryInternal setPairingCompletionBlock:](self->_internal, "setPairingCompletionBlock:", a3);
  -[EAAccessoryInternal connectionID](self->_internal, "connectionID");
  IAPAppBeginOOBBTPairingForConnection();
}

- (void)_OOBBTPairingCompletedWithStatus:(unsigned __int8)a3 forAccessoryWithMACAddress:(id)a4
{
  EAAccessoryInternal *internal;
  uint64_t v7;
  void (**v8)(id, _QWORD, id);

  internal = self->_internal;
  if (internal)
  {
    v7 = a3;
    if (-[EAAccessoryInternal pairingCompletionBlock](internal, "pairingCompletionBlock"))
    {
      v8 = -[EAAccessoryInternal pairingCompletionBlock](self->_internal, "pairingCompletionBlock");
      v8[2](v8, v7, a4);
      -[EAAccessoryInternal setPairingCompletionBlock:](self->_internal, "setPairingCompletionBlock:", 0);
    }
  }
}

- (void)requestIAPAccessoryWiFiCredentials
{
  if (-[EAAccessoryInternal createdByCoreAccessories](self->_internal, "createdByCoreAccessories"))
  {
    -[EAAccessoryManager requestIAPAccessoryWiFiCredentials:](+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"), "requestIAPAccessoryWiFiCredentials:", -[EAAccessory coreAccessoriesPrimaryUUID](self, "coreAccessoriesPrimaryUUID"));
  }
  else
  {
    -[EAAccessoryInternal connectionID](self->_internal, "connectionID");
    IAPAppRequestAccessoryWiFiCredentials();
  }
}

- (void)sendDeviceIdentifierNotification:(id)a3 usbIdentifier:(id)a4
{
  if (-[EAAccessoryInternal createdByCoreAccessories](self->_internal, "createdByCoreAccessories"))
  {
    -[EAAccessoryManager sendDeviceIdentifierNotification:usbIdentifier:forUUID:](+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"), "sendDeviceIdentifierNotification:usbIdentifier:forUUID:", a3, a4, -[EAAccessory coreAccessoriesPrimaryUUID](self, "coreAccessoriesPrimaryUUID"));
  }
  else
  {
    -[EAAccessoryInternal connectionID](self->_internal, "connectionID");
    objc_msgSend(a3, "UTF8String");
    objc_msgSend(a4, "UTF8String");
    IAPAppSendDeviceIdentifierNotification();
  }
}

- (void)sendWiredCarPlayAvailable:(id)a3 usbIdentifier:(id)a4 wirelessCarPlayAvailable:(id)a5 bluetoothIdentifier:(id)a6
{
  -[EAAccessoryManager sendWiredCarPlayAvailable:usbIdentifier:wirelessCarPlayAvailable:bluetoothIdentifier:forUUID:](+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"), "sendWiredCarPlayAvailable:usbIdentifier:wirelessCarPlayAvailable:bluetoothIdentifier:forUUID:", a3, a4, a5, a6, -[EAAccessory coreAccessoriesPrimaryUUID](self, "coreAccessoriesPrimaryUUID"));
}

- (id)vehicleInfoSupportedTypes
{
  return -[EAAccessoryInternal vehicleInfoSupportedTypes](self->_internal, "vehicleInfoSupportedTypes");
}

- (void)setVehicleInfoSupportedTypes:(id)a3
{
  -[EAAccessoryInternal setVehicleInfoSupportedTypes:](self->_internal, "setVehicleInfoSupportedTypes:", a3);
}

- (id)vehicleInfoInitialData
{
  return -[EAAccessoryInternal vehicleInfoInitialData](self->_internal, "vehicleInfoInitialData");
}

- (void)setVehicleInfovehicleInfoInitialData:(id)a3
{
  -[EAAccessoryInternal setVehicleInfoInitialData:](self->_internal, "setVehicleInfoInitialData:", a3);
}

- (id)getVehicleInfoData
{
  return -[EAAccessoryManager currentVehicleInformation:](+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"), "currentVehicleInformation:", -[EAAccessory coreAccessoriesPrimaryUUID](self, "coreAccessoriesPrimaryUUID"));
}

- (id)cameraComponents
{
  return -[EAAccessoryInternal cameraComponents](self->_internal, "cameraComponents");
}

- (void)setCameraComponents:(id)a3
{
  -[EAAccessoryInternal setCameraComponents:](self->_internal, "setCameraComponents:", a3);
}

- (int)startCameraInfo:(unsigned int)a3 forCameraIds:(id)a4
{
  uint64_t v5;
  int v7;
  id v8;
  id v9;

  v5 = *(_QWORD *)&a3;
  v7 = IAPCameraSendCameraControlMessage();
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v8, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 1), CFSTR("EACameraActiveImageCaptureFormatIndex"));
  objc_msgSend(v8, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 1), CFSTR("EACameraExposureMode"));
  objc_msgSend(v8, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 1), CFSTR("EACameraExposureAreaOfInterest"));
  objc_msgSend(v8, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 1), CFSTR("EACameraFocusMode"));
  objc_msgSend(v8, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 1), CFSTR("EACameraFocusAreaOfInterest"));
  objc_msgSend(v8, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 1), CFSTR("EACameraISO"));
  objc_msgSend(v8, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 1), CFSTR("EACameraLensPosition"));
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v9, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 1), CFSTR("EACameraExposureMode"));
  objc_msgSend(v9, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 1), CFSTR("EACameraFocusMode"));
  LODWORD(a4) = -[EAAccessory startCameraUpdates:forCameraIds:withProperties:withCapabilities:](self, "startCameraUpdates:forCameraIds:withProperties:withCapabilities:", v5, a4, v8, v9) | v7;

  return (int)a4;
}

- (int)stopCameraInfo:(unsigned int)a3 forCameraIds:(id)a4
{
  int v4;

  v4 = -[EAAccessory stopCameraUpdates:forCameraIds:](self, "stopCameraUpdates:forCameraIds:");
  return IAPCameraSendCameraControlMessage() | v4;
}

- (int)startCameraUpdates:(unsigned int)a3 forCameraIds:(id)a4 withProperties:(id)a5 withCapabilities:(id)a6
{
  return IAPCameraSendStartCameraUpdates();
}

- (int)stopCameraUpdates:(unsigned int)a3 forCameraIds:(id)a4
{
  return IAPCameraSendCameraControlMessage();
}

- (int)setCameraProperties:(unsigned int)a3 forCameraId:(unsigned __int16)a4 withProperties:(id)a5
{
  return IAPCameraSendSetCameraProperties();
}

- (int)startLivePreview:(unsigned int)a3 forCameraIds:(id)a4
{
  return IAPCameraSendStartLivePreview();
}

- (int)stopLivePreview:(unsigned int)a3 forCameraIds:(id)a4
{
  return IAPCameraSendCameraControlMessage();
}

- (int)captureStillImage:(unsigned int)a3 forCameraIds:(id)a4
{
  return IAPCameraSendCameraControlMessage();
}

- (BOOL)supportsAccessibility
{
  return (-[EAAccessoryInternal capabilities](self->_internal, "capabilities") >> 1) & 1;
}

- (void)updateSystemProperty:(int)a3 withValue:(id)a4
{
  uint64_t v5;

  if ((a3 - 1) <= 2)
  {
    v5 = *(_QWORD *)&a3;
    -[EAAccessoryInternal connectionID](self->_internal, "connectionID");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5), CFSTR("EAAccessoryAccessibilitySystemPropertyKey"), a4, CFSTR("EAAccessoryAccessibilityResponseKey"), 0);
    IAPAppSendAccessibilityResponse();
  }
}

- (void)updateItemProperty:(int)a3 withValue:(id)a4
{
  uint64_t v5;

  if ((a3 - 1) <= 4)
  {
    v5 = *(_QWORD *)&a3;
    -[EAAccessoryInternal connectionID](self->_internal, "connectionID");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5), CFSTR("EAAccessoryAccessibilityItemPropertyKey"), a4, CFSTR("EAAccessoryAccessibilityResponseKey"), 0);
    IAPAppSendAccessibilityResponse();
  }
}

- (BOOL)supportsPointOfInterest
{
  return (-[EAAccessoryInternal capabilities](self->_internal, "capabilities") >> 7) & 1;
}

- (BOOL)supportsDestinationSharing
{
  return (-[EAAccessoryInternal capabilities](self->_internal, "capabilities") >> 17) & 1;
}

@end
