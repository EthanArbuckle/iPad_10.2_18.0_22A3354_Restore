@implementation CMSM_IDSConnection

- (id)copyNearbyPairedDevice
{
  IDSDevice *v3;

  if (sIDSConnectedInitializationDone != 1)
    return 0;
  MEMORY[0x1940352BC](qword_1EE2B3088, a2);
  v3 = self->pNearbyPairedDevice;
  MEMORY[0x1940352C8](qword_1EE2B3088);
  return v3;
}

- (CMSM_IDSConnection)init
{
  CMSM_IDSConnection *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CMSM_IDSConnection;
  v2 = -[CMSM_IDSConnection init](&v6, sel_init);
  v2->pNearbyPairedDevice = 0;
  v2->pIdsService = (IDSService *)objc_msgSend(objc_alloc((Class)CMSM_GetIDSServiceClass()), "initWithService:", CFSTR("com.apple.private.alloy.cmsession"));
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = dispatch_queue_create("com.apple.cmsession.ids.server.dispatch", v3);
  v2->idsDispatchQueue = (OS_dispatch_queue *)v4;
  -[IDSService addDelegate:queue:](v2->pIdsService, "addDelegate:queue:", v2, v4);
  return v2;
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  int IsNearbyPairedDevicePresentAndConnected;

  IsNearbyPairedDevicePresentAndConnected = CMSM_IDSConnection_IsNearbyPairedDevicePresentAndConnected();
  if (IsNearbyPairedDevicePresentAndConnected != service_connectedDevicesChanged__nearbyPairedDeviceIsConnectedOldValue)
  {
    service_connectedDevicesChanged__nearbyPairedDeviceIsConnectedOldValue = IsNearbyPairedDevicePresentAndConnected;
    CMSM_IDSConnection_HandleNearbyDeviceStatusChange();
  }
}

- (void)updateNearbyPairedDevice
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  IDSDevice *v9;
  IDSDevice *pNearbyPairedDevice;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[IDSService devices](self->pIdsService, "devices");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "isLocallyPaired") && objc_msgSend(v8, "isNearby"))
        {
          v9 = v8;
          goto LABEL_12;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_12:
  MEMORY[0x1940352BC](qword_1EE2B3088);
  pNearbyPairedDevice = self->pNearbyPairedDevice;

  self->pNearbyPairedDevice = v9;
  MEMORY[0x1940352C8](qword_1EE2B3088);
  if (pNearbyPairedDevice != v9)
  {
    CMSM_IDSConnection_HandleNearbyDeviceStatusChange();
    cmsm_IDSConnection_UpdateOtherDevicesConnectedInfoInPickableRoutesCache();
  }
}

- (id)copyNearbyPairedDeviceUniqueID
{
  IDSDevice *pNearbyPairedDevice;
  id v4;

  MEMORY[0x1940352BC](qword_1EE2B3088, a2);
  pNearbyPairedDevice = self->pNearbyPairedDevice;
  if (pNearbyPairedDevice)
    v4 = (id)-[IDSDevice uniqueIDOverride](pNearbyPairedDevice, "uniqueIDOverride");
  else
    v4 = 0;
  MEMORY[0x1940352C8](qword_1EE2B3088);
  return v4;
}

- (id)copyNearbyPairedDeviceProductName
{
  IDSDevice *pNearbyPairedDevice;
  id v4;

  MEMORY[0x1940352BC](qword_1EE2B3088, a2);
  pNearbyPairedDevice = self->pNearbyPairedDevice;
  if (pNearbyPairedDevice)
    v4 = (id)-[IDSDevice productName](pNearbyPairedDevice, "productName");
  else
    v4 = 0;
  MEMORY[0x1940352C8](qword_1EE2B3088);
  return v4;
}

- (id)copyNearbyPairedDeviceModelIdentifier
{
  IDSDevice *pNearbyPairedDevice;
  id v4;

  MEMORY[0x1940352BC](qword_1EE2B3088, a2);
  pNearbyPairedDevice = self->pNearbyPairedDevice;
  if (pNearbyPairedDevice)
    v4 = (id)-[IDSDevice modelIdentifier](pNearbyPairedDevice, "modelIdentifier");
  else
    v4 = 0;
  MEMORY[0x1940352C8](qword_1EE2B3088);
  return v4;
}

- (id)copyNearbyPairedDeviceName
{
  IDSDevice *pNearbyPairedDevice;
  id v4;

  MEMORY[0x1940352BC](qword_1EE2B3088, a2);
  pNearbyPairedDevice = self->pNearbyPairedDevice;
  if (pNearbyPairedDevice)
    v4 = (id)-[IDSDevice name](pNearbyPairedDevice, "name");
  else
    v4 = 0;
  MEMORY[0x1940352C8](qword_1EE2B3088);
  return v4;
}

@end
