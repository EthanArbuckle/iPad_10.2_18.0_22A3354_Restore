@implementation ASDPlugin

- (id)objectForObjectID:(unsigned int)a3
{
  ASDPlugin *v4;
  uint64_t v5;
  os_unfair_lock_s *p_objectsLock;
  NSMapTable *objects;
  void *v8;

  if (a3 == 1)
  {
    v4 = self;
  }
  else
  {
    v5 = *(_QWORD *)&a3;
    p_objectsLock = &self->_objectsLock;
    os_unfair_lock_lock(&self->_objectsLock);
    objects = self->_objects;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](objects, "objectForKey:", v8);
    v4 = (ASDPlugin *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(p_objectsLock);
  }
  return v4;
}

- (ASDPlugin)init
{
  ASDPlugin *v2;
  ASDPlugin *v3;
  void *v4;
  NSString *v5;
  NSString *bundleID;
  NSString *v7;
  uint64_t v8;
  NSMapTable *objects;
  NSMutableDictionary *v10;
  NSMutableDictionary *boxes;
  id v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *boxQueue;
  NSMutableDictionary *v15;
  NSMutableDictionary *audioDevices;
  id v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *audioDeviceQueue;
  NSMutableDictionary *v20;
  NSMutableDictionary *clockDevices;
  id v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *clockDeviceQueue;
  id v25;
  dispatch_queue_t v26;
  OS_dispatch_queue *powerNotificationQueue;
  NSString *manufacturerName;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)ASDPlugin;
  v2 = -[ASDObject init](&v30, sel_init);
  v3 = v2;
  if (v2)
  {
    -[ASDObject setObjectID:](v2, "setObjectID:", 1);
    v3->_nextObjectID = 2;
    v3->_transportType = 0;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    bundleID = v3->_bundleID;
    v3->_bundleID = v5;
    v7 = v5;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 0, 5, 0);
    objects = v3->_objects;
    v3->_objects = (NSMapTable *)v8;

    v3->_objectsLock._os_unfair_lock_opaque = 0;
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    boxes = v3->_boxes;
    v3->_boxes = v10;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.boxes"), v7);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = dispatch_queue_create((const char *)objc_msgSend(v12, "UTF8String"), 0);
    boxQueue = v3->_boxQueue;
    v3->_boxQueue = (OS_dispatch_queue *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    audioDevices = v3->_audioDevices;
    v3->_audioDevices = v15;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.audioDevices"), v7);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = dispatch_queue_create((const char *)objc_msgSend(v17, "UTF8String"), 0);
    audioDeviceQueue = v3->_audioDeviceQueue;
    v3->_audioDeviceQueue = (OS_dispatch_queue *)v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    clockDevices = v3->_clockDevices;
    v3->_clockDevices = v20;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.clockDevices"), v7);
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23 = dispatch_queue_create((const char *)objc_msgSend(v22, "UTF8String"), 0);
    clockDeviceQueue = v3->_clockDeviceQueue;
    v3->_clockDeviceQueue = (OS_dispatch_queue *)v23;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.powerNotifications"), v7);
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v26 = dispatch_queue_create((const char *)objc_msgSend(v25, "UTF8String"), 0);
    powerNotificationQueue = v3->_powerNotificationQueue;
    v3->_powerNotificationQueue = (OS_dispatch_queue *)v26;

    v3->_interfacePtr = (AudioServerPlugInDriverInterface *)ASD_CreateDriverInterface(v3);
    v3->_driverRef = &v3->_interfacePtr;
    manufacturerName = v3->_manufacturerName;
    v3->_manufacturerName = (NSString *)CFSTR("Apple Inc.");

    -[ASDObject setupDiagnosticStateDumpHandlerWithTreeWalk:](v3, "setupDiagnosticStateDumpHandlerWithTreeWalk:", 0);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  ASD_DestroyDriverInterface((ASDPluginInterfaceInfo *)self->_interfacePtr);
  v3.receiver = self;
  v3.super_class = (Class)ASDPlugin;
  -[ASDObject dealloc](&v3, sel_dealloc);
}

- (void)setMaximumNumberOfObjects:(unsigned int)a3
{
  self->_maximumNumberOfObjects = a3;
  ASD_SetRealtimeOperationTableSize((uint64_t)self->_driverRef, a3);
}

- (void)halInitializeWithPluginHost:(AudioServerPlugInHostInterface *)a3
{
  self->_pluginHost = a3;
}

- (unsigned)objectClass
{
  return 1634757735;
}

- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3
{
  AudioObjectPropertySelector mSelector;
  BOOL v4;
  objc_super v9;

  if (!a3)
    return 0;
  mSelector = a3->mSelector;
  v4 = 1;
  if ((int)a3->mSelector > 1819107690)
  {
    if (mSelector - 1969841250 >= 3 && mSelector != 1819107691)
    {
      if (mSelector != 1920168547)
      {
LABEL_18:
        v9.receiver = self;
        v9.super_class = (Class)ASDPlugin;
        return -[ASDObject hasProperty:](&v9, sel_hasProperty_);
      }
      return 0;
    }
  }
  else if (mSelector != 1651472419 && mSelector != 1668049699 && mSelector != 1684370979)
  {
    goto LABEL_18;
  }
  return v4;
}

- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5
{
  signed int mSelector;
  unsigned int v7;
  NSObject *audioDeviceQueue;
  _QWORD *v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *boxQueue;
  objc_super v15;
  _QWORD v16[6];
  _QWORD v17[6];
  _QWORD block[6];
  _QWORD v19[6];
  _QWORD v20[6];
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  if (!a3)
    return 0;
  mSelector = a3->mSelector;
  v7 = 8;
  if ((int)a3->mSelector <= 1870098019)
  {
    if (mSelector > 1684370978)
    {
      if (mSelector != 1684370979)
      {
        v10 = 1819107691;
        goto LABEL_16;
      }
      if (a4)
        goto LABEL_22;
      v22 = 0;
      v23 = &v22;
      v24 = 0x2020000000;
      v25 = 0;
      audioDeviceQueue = self->_audioDeviceQueue;
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __68__ASDPlugin_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_2;
      v21[3] = &unk_24DBCA398;
      v21[4] = self;
      v21[5] = &v22;
      v9 = v21;
    }
    else if (mSelector == 1651472419)
    {
      v22 = 0;
      v23 = &v22;
      v24 = 0x2020000000;
      v25 = 0;
      audioDeviceQueue = self->_boxQueue;
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __68__ASDPlugin_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_3;
      v20[3] = &unk_24DBCA398;
      v20[4] = self;
      v20[5] = &v22;
      v9 = v20;
    }
    else
    {
      if (mSelector != 1668049699)
        goto LABEL_17;
      v22 = 0;
      v23 = &v22;
      v24 = 0x2020000000;
      v25 = 0;
      audioDeviceQueue = self->_clockDeviceQueue;
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __68__ASDPlugin_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_4;
      v19[3] = &unk_24DBCA398;
      v19[4] = self;
      v19[5] = &v22;
      v9 = v19;
    }
    goto LABEL_26;
  }
  if (mSelector <= 1969841249)
  {
    if (mSelector != 1870098020)
    {
      v10 = 1920168547;
LABEL_16:
      if (mSelector == v10)
        return v7;
LABEL_17:
      v15.receiver = self;
      v15.super_class = (Class)ASDPlugin;
      return -[ASDObject dataSizeForProperty:withQualifierSize:andQualifierData:](&v15, sel_dataSizeForProperty_withQualifierSize_andQualifierData_);
    }
    if (a4)
    {
LABEL_22:
      if ((a4 & 3) == 0)
      {
        v22 = 0;
        v23 = &v22;
        v24 = 0x2020000000;
        v25 = 0;
        _Block_object_dispose(&v22, 8);
      }
      return 0;
    }
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    v11 = self->_audioDeviceQueue;
    v12 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __68__ASDPlugin_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_8;
    block[3] = &unk_24DBCA398;
    block[4] = self;
    block[5] = &v22;
    dispatch_sync(v11, block);
    boxQueue = self->_boxQueue;
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __68__ASDPlugin_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_9;
    v17[3] = &unk_24DBCA398;
    v17[4] = self;
    v17[5] = &v22;
    dispatch_sync(boxQueue, v17);
    audioDeviceQueue = self->_clockDeviceQueue;
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __68__ASDPlugin_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_10;
    v16[3] = &unk_24DBCA398;
    v16[4] = self;
    v16[5] = &v22;
    v9 = v16;
LABEL_26:
    dispatch_sync(audioDeviceQueue, v9);
    v7 = 4 * *((_DWORD *)v23 + 6);
    _Block_object_dispose(&v22, 8);
    return v7;
  }
  if (mSelector != 1969841250 && mSelector != 1969841251 && mSelector != 1969841252)
    goto LABEL_17;
  return 4;
}

uint64_t __68__ASDPlugin_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += result;
  return result;
}

uint64_t __68__ASDPlugin_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __68__ASDPlugin_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __68__ASDPlugin_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_8(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += result;
  return result;
}

uint64_t __68__ASDPlugin_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_9(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += result;
  return result;
}

uint64_t __68__ASDPlugin_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_10(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += result;
  return result;
}

- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8
{
  BOOL result;
  uint64_t v13;
  signed int mSelector;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  NSString *manufacturerName;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  OS_dispatch_queue *audioDeviceQueue;
  _QWORD *v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *clockDeviceQueue;
  objc_super v36;
  _QWORD v37[8];
  _QWORD v38[8];
  _QWORD block[8];
  _QWORD v40[8];
  _QWORD v41[8];
  _QWORD v42[8];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;

  result = 0;
  if (!a3 || !a6 || !a7)
    return result;
  v13 = *(_QWORD *)&a4;
  mSelector = a3->mSelector;
  if ((int)a3->mSelector <= 1870098019)
  {
    if (mSelector > 1684370978)
    {
      if (mSelector != 1684370979)
      {
        if (mSelector != 1819107691)
          goto LABEL_47;
        if (*a6 >= 8)
        {
          manufacturerName = self->_manufacturerName;
          *(_QWORD *)a7 = manufacturerName;
          if (manufacturerName)
            CFRetain(manufacturerName);
          v19 = 8;
          goto LABEL_28;
        }
        return 0;
      }
      if (a4)
      {
        if ((a4 & 3) != 0)
          return 0;
        v43 = 0;
        v44 = &v43;
        v45 = 0x2020000000;
        v46 = 0;
        v30 = *a6;
        if (v30 >= -[ASDPlugin dataSizeForProperty:withQualifierSize:andQualifierData:](self, "dataSizeForProperty:withQualifierSize:andQualifierData:", a3, *(_QWORD *)&a4, a5))LABEL_38:-[ASDPlugin dataSizeForProperty:withQualifierSize:andQualifierData:](self, "dataSizeForProperty:withQualifierSize:andQualifierData:", a3, v13, a5);
LABEL_64:
        *a6 = 4 * *((_DWORD *)v44 + 6);
        _Block_object_dispose(&v43, 8);
        return 1;
      }
      v43 = 0;
      v44 = &v43;
      v45 = 0x2020000000;
      v46 = 0;
      v28 = *a6;
      if (v28 >= -[ASDPlugin dataSizeForProperty:withQualifierSize:andQualifierData:](self, "dataSizeForProperty:withQualifierSize:andQualifierData:", a3, 0, a5))v29 = -[ASDPlugin dataSizeForProperty:withQualifierSize:andQualifierData:](self, "dataSizeForProperty:withQualifierSize:andQualifierData:", a3, 0, a5);
      else
        v29 = *a6;
      audioDeviceQueue = self->_audioDeviceQueue;
      v42[0] = MEMORY[0x24BDAC760];
      v42[1] = 3221225472;
      v42[2] = __84__ASDPlugin_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_2;
      v42[3] = &unk_24DBCA3C0;
      v42[4] = self;
      v42[5] = &v43;
      v42[6] = v29 >> 2;
      v42[7] = a7;
      v25 = v42;
    }
    else if (mSelector == 1651472419)
    {
      v43 = 0;
      v44 = &v43;
      v45 = 0x2020000000;
      v46 = 0;
      v21 = *a6;
      if (v21 >= -[ASDPlugin dataSizeForProperty:withQualifierSize:andQualifierData:](self, "dataSizeForProperty:withQualifierSize:andQualifierData:", a3, *(_QWORD *)&a4, a5))v22 = -[ASDPlugin dataSizeForProperty:withQualifierSize:andQualifierData:](self, "dataSizeForProperty:withQualifierSize:andQualifierData:", a3, v13, a5);
      else
        v22 = *a6;
      audioDeviceQueue = self->_boxQueue;
      v41[0] = MEMORY[0x24BDAC760];
      v41[1] = 3221225472;
      v41[2] = __84__ASDPlugin_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_3;
      v41[3] = &unk_24DBCA3C0;
      v41[4] = self;
      v41[5] = &v43;
      v41[6] = v22 >> 2;
      v41[7] = a7;
      v25 = v41;
    }
    else
    {
      if (mSelector != 1668049699)
        goto LABEL_47;
      v43 = 0;
      v44 = &v43;
      v45 = 0x2020000000;
      v46 = 0;
      v17 = *a6;
      if (v17 >= -[ASDPlugin dataSizeForProperty:withQualifierSize:andQualifierData:](self, "dataSizeForProperty:withQualifierSize:andQualifierData:", a3, *(_QWORD *)&a4, a5))v18 = -[ASDPlugin dataSizeForProperty:withQualifierSize:andQualifierData:](self, "dataSizeForProperty:withQualifierSize:andQualifierData:", a3, v13, a5);
      else
        v18 = *a6;
      audioDeviceQueue = self->_clockDeviceQueue;
      v40[0] = MEMORY[0x24BDAC760];
      v40[1] = 3221225472;
      v40[2] = __84__ASDPlugin_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_4;
      v40[3] = &unk_24DBCA3C0;
      v40[4] = self;
      v40[5] = &v43;
      v40[6] = v18 >> 2;
      v40[7] = a7;
      v25 = v40;
    }
    clockDeviceQueue = audioDeviceQueue;
LABEL_63:
    dispatch_sync(clockDeviceQueue, v25);
    goto LABEL_64;
  }
  if (mSelector <= 1969841249)
  {
    if (mSelector != 1870098020)
    {
      if (mSelector != 1953653102)
        goto LABEL_47;
      if (*a6 >= 4)
      {
        *(_DWORD *)a7 = -[ASDPlugin transportType](self, "transportType");
        v19 = 4;
LABEL_28:
        *a6 = v19;
        return 1;
      }
      return 0;
    }
    if (a4)
    {
      if ((a4 & 3) != 0)
        return 0;
      v43 = 0;
      v44 = &v43;
      v45 = 0x2020000000;
      v46 = 0;
      v23 = *a6;
      if (v23 >= -[ASDPlugin dataSizeForProperty:withQualifierSize:andQualifierData:](self, "dataSizeForProperty:withQualifierSize:andQualifierData:", a3, *(_QWORD *)&a4, a5))goto LABEL_38;
      goto LABEL_64;
    }
    v43 = 0;
    v44 = &v43;
    v45 = 0x2020000000;
    v46 = 0;
    v26 = *a6;
    if (v26 >= -[ASDPlugin dataSizeForProperty:withQualifierSize:andQualifierData:](self, "dataSizeForProperty:withQualifierSize:andQualifierData:", a3, 0, a5))v27 = -[ASDPlugin dataSizeForProperty:withQualifierSize:andQualifierData:](self, "dataSizeForProperty:withQualifierSize:andQualifierData:", a3, 0, a5);
    else
      v27 = *a6;
    v31 = self->_audioDeviceQueue;
    v32 = v27 >> 2;
    v33 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __84__ASDPlugin_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_8;
    block[3] = &unk_24DBCA3C0;
    block[4] = self;
    block[5] = &v43;
    block[6] = v32;
    block[7] = a7;
    dispatch_sync(v31, block);
    v34 = self->_audioDeviceQueue;
    v38[0] = v33;
    v38[1] = 3221225472;
    v38[2] = __84__ASDPlugin_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_9;
    v38[3] = &unk_24DBCA3C0;
    v38[4] = self;
    v38[5] = &v43;
    v38[6] = v32;
    v38[7] = a7;
    dispatch_sync(v34, v38);
    clockDeviceQueue = self->_clockDeviceQueue;
    v37[0] = v33;
    v37[1] = 3221225472;
    v37[2] = __84__ASDPlugin_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_10;
    v37[3] = &unk_24DBCA3C0;
    v37[4] = self;
    v37[5] = &v43;
    v37[6] = v32;
    v37[7] = a7;
    v25 = v37;
    goto LABEL_63;
  }
  if (mSelector != 1969841250)
  {
    if (mSelector == 1969841251)
    {
      result = 0;
      if (a5 && a4 == 8 && *a6 >= 4)
      {
        *a6 = 4;
        v16 = -[ASDPlugin objectIDForClockDeviceUID:](self, "objectIDForClockDeviceUID:", a5);
        goto LABEL_46;
      }
      return result;
    }
    if (mSelector == 1969841252)
    {
      result = 0;
      if (a5 && a4 == 8 && *a6 >= 4)
      {
        *a6 = 4;
        v16 = -[ASDPlugin objectIDForDeviceUID:](self, "objectIDForDeviceUID:", a5);
LABEL_46:
        *(_DWORD *)a7 = v16;
        return 1;
      }
      return result;
    }
LABEL_47:
    v36.receiver = self;
    v36.super_class = (Class)ASDPlugin;
    return -[ASDObject getProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v36, sel_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_, a3, *(_QWORD *)&a4, a5, a6, a7, *(_QWORD *)&a8);
  }
  result = 0;
  if (a5 && a4 == 8 && *a6 >= 4)
  {
    *a6 = 4;
    v16 = -[ASDPlugin objectIDForBoxUID:](self, "objectIDForBoxUID:", a5);
    goto LABEL_46;
  }
  return result;
}

void __84__ASDPlugin_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_2(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(id *)(a1[4] + 96);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v6)
        objc_enumerationMutation(v3);
      if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) == a1[6])
        break;
      objc_msgSend(*(id *)(a1[4] + 96), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7), (_QWORD)v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)(a1[7] + 4 * (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24))++) = objc_msgSend(v8, "objectID");

      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_autoreleasePoolPop(v2);
}

void __84__ASDPlugin_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_3(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(id *)(a1[4] + 80);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v6)
        objc_enumerationMutation(v3);
      if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) == a1[6])
        break;
      objc_msgSend(*(id *)(a1[4] + 80), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7), (_QWORD)v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)(a1[7] + 4 * (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24))++) = objc_msgSend(v8, "objectID");

      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_autoreleasePoolPop(v2);
}

void __84__ASDPlugin_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_4(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(id *)(a1[4] + 112);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v6)
        objc_enumerationMutation(v3);
      if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) == a1[6])
        break;
      objc_msgSend(*(id *)(a1[4] + 112), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7), (_QWORD)v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)(a1[7] + 4 * (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24))++) = objc_msgSend(v8, "objectID");

      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_autoreleasePoolPop(v2);
}

void __84__ASDPlugin_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_8(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(id *)(a1[4] + 96);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v6)
        objc_enumerationMutation(v3);
      if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) == a1[6])
        break;
      objc_msgSend(*(id *)(a1[4] + 96), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7), (_QWORD)v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)(a1[7] + 4 * (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24))++) = objc_msgSend(v8, "objectID");

      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_autoreleasePoolPop(v2);
}

void __84__ASDPlugin_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_9(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(id *)(a1[4] + 96);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v6)
        objc_enumerationMutation(v3);
      if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) == a1[6])
        break;
      objc_msgSend(*(id *)(a1[4] + 96), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7), (_QWORD)v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)(a1[7] + 4 * (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24))++) = objc_msgSend(v8, "objectID");

      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_autoreleasePoolPop(v2);
}

void __84__ASDPlugin_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_10(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(id *)(a1[4] + 112);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v6)
        objc_enumerationMutation(v3);
      if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) == a1[6])
        break;
      objc_msgSend(*(id *)(a1[4] + 112), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7), (_QWORD)v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)(a1[7] + 4 * (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24))++) = objc_msgSend(v8, "objectID");

      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_autoreleasePoolPop(v2);
}

- (unsigned)addRef
{
  unsigned int v2;

  v2 = self->_pluginRefCount + 1;
  self->_pluginRefCount = v2;
  return v2;
}

- (unsigned)removeRef
{
  unsigned int v2;

  v2 = self->_pluginRefCount - 1;
  self->_pluginRefCount = v2;
  return v2;
}

- (void)addCAObject:(id)a3
{
  uint64_t i;
  NSMapTable *objects;
  void *v6;
  void *v7;
  uint64_t nextObjectID;
  NSMapTable *v9;
  void *v10;
  id v11;

  v11 = a3;
  os_unfair_lock_lock(&self->_objectsLock);
  for (i = self->_nextObjectID; ; self->_nextObjectID = i)
  {
    objects = self->_objects;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](objects, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    nextObjectID = self->_nextObjectID;
    if (!v7)
      break;
    i = (nextObjectID + 1);
  }
  objc_msgSend(v11, "setObjectID:", nextObjectID);
  ++self->_nextObjectID;
  v9 = self->_objects;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v11, "objectID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](v9, "setObject:forKey:", v11, v10);

  objc_msgSend(v11, "setPlugin:", self);
  os_unfair_lock_unlock(&self->_objectsLock);

}

- (void)removeCAObject:(id)a3
{
  os_unfair_lock_s *p_objectsLock;
  id v5;
  NSMapTable *objects;
  void *v7;
  uint64_t v8;
  void *v9;

  p_objectsLock = &self->_objectsLock;
  v5 = a3;
  os_unfair_lock_lock(p_objectsLock);
  objects = self->_objects;
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = objc_msgSend(v5, "objectID");

  objc_msgSend(v7, "numberWithUnsignedInt:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable removeObjectForKey:](objects, "removeObjectForKey:", v9);

  os_unfair_lock_unlock(p_objectsLock);
}

- (void)addAudioDevice:(id)a3
{
  id v5;
  NSObject *audioDeviceQueue;
  id v7;
  char v8[9];
  char v9;
  __int16 v10;
  _QWORD block[5];
  id v12;
  SEL v13;

  v5 = a3;
  audioDeviceQueue = self->_audioDeviceQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__ASDPlugin_addAudioDevice___block_invoke;
  block[3] = &unk_24DBCA3E8;
  block[4] = self;
  v12 = v5;
  v13 = a2;
  v7 = v5;
  dispatch_sync(audioDeviceQueue, block);
  v9 = 0;
  v10 = 0;
  strcpy(v8, "#vedbolg");
  -[ASDPlugin changedProperty:forObject:](self, "changedProperty:forObject:", v8, self);
  *(_DWORD *)v8 = 1870098020;
  -[ASDPlugin changedProperty:forObject:](self, "changedProperty:forObject:", v8, self);

}

void __28__ASDPlugin_addAudioDevice___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)MEMORY[0x22073330C]();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  objc_msgSend(*(id *)(a1 + 40), "deviceUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("ASDPlugin.m"), 704, CFSTR("Device already exists"));

  }
  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  objc_msgSend(v6, "deviceUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v6, v8);

  ASD_AddAudioDeviceRealTimeOperations(objc_msgSend(*(id *)(a1 + 32), "driverRef"), *(void **)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

- (void)removeAudioDevice:(id)a3
{
  id v5;
  NSObject *audioDeviceQueue;
  id v7;
  char v8[9];
  char v9;
  __int16 v10;
  _QWORD block[5];
  id v12;
  SEL v13;

  v5 = a3;
  audioDeviceQueue = self->_audioDeviceQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__ASDPlugin_removeAudioDevice___block_invoke;
  block[3] = &unk_24DBCA3E8;
  block[4] = self;
  v12 = v5;
  v13 = a2;
  v7 = v5;
  dispatch_sync(audioDeviceQueue, block);
  v9 = 0;
  v10 = 0;
  strcpy(v8, "#vedbolg");
  -[ASDPlugin changedProperty:forObject:](self, "changedProperty:forObject:", v8, self);
  *(_DWORD *)v8 = 1870098020;
  -[ASDPlugin changedProperty:forObject:](self, "changedProperty:forObject:", v8, self);

}

void __31__ASDPlugin_removeAudioDevice___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)MEMORY[0x22073330C]();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  objc_msgSend(*(id *)(a1 + 40), "deviceUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("ASDPlugin.m"), 732, CFSTR("Device doesn't exist"));

  }
  objc_msgSend(*(id *)(a1 + 40), "systemHasPoweredOn");
  ASD_RemoveAudioDeviceRealTimeOperations(objc_msgSend(*(id *)(a1 + 32), "driverRef"), *(void **)(a1 + 40));
  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  objc_msgSend(v6, "deviceUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v8);

  objc_autoreleasePoolPop(v2);
}

- (void)addAudioDevices:(id)a3
{
  id v5;
  NSObject *audioDeviceQueue;
  id v7;
  char v8[9];
  char v9;
  __int16 v10;
  _QWORD block[4];
  id v12;
  ASDPlugin *v13;
  SEL v14;

  v5 = a3;
  audioDeviceQueue = self->_audioDeviceQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__ASDPlugin_addAudioDevices___block_invoke;
  block[3] = &unk_24DBCA3E8;
  v12 = v5;
  v13 = self;
  v14 = a2;
  v7 = v5;
  dispatch_sync(audioDeviceQueue, block);
  v9 = 0;
  v10 = 0;
  strcpy(v8, "#vedbolg");
  -[ASDPlugin changedProperty:forObject:](self, "changedProperty:forObject:", v8, self);
  *(_DWORD *)v8 = 1870098020;
  -[ASDPlugin changedProperty:forObject:](self, "changedProperty:forObject:", v8, self);

}

void __29__ASDPlugin_addAudioDevices___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *context;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  context = (void *)MEMORY[0x22073330C]();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v8 = *(void **)(*(_QWORD *)(a1 + 40) + 96);
        objc_msgSend(v7, "deviceUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), CFSTR("ASDPlugin.m"), 763, CFSTR("Device already exists"));

        }
        v11 = *(void **)(*(_QWORD *)(a1 + 40) + 96);
        objc_msgSend(v7, "deviceUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v7, v12);

        ASD_AddAudioDeviceRealTimeOperations(objc_msgSend(*(id *)(a1 + 40), "driverRef"), v7);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

  objc_autoreleasePoolPop(context);
}

- (void)removeAudioDevices:(id)a3
{
  id v5;
  NSObject *audioDeviceQueue;
  id v7;
  char v8[9];
  char v9;
  __int16 v10;
  _QWORD block[4];
  id v12;
  ASDPlugin *v13;
  SEL v14;

  v5 = a3;
  audioDeviceQueue = self->_audioDeviceQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__ASDPlugin_removeAudioDevices___block_invoke;
  block[3] = &unk_24DBCA3E8;
  v12 = v5;
  v13 = self;
  v14 = a2;
  v7 = v5;
  dispatch_sync(audioDeviceQueue, block);
  v9 = 0;
  v10 = 0;
  strcpy(v8, "#vedbolg");
  -[ASDPlugin changedProperty:forObject:](self, "changedProperty:forObject:", v8, self);
  *(_DWORD *)v8 = 1870098020;
  -[ASDPlugin changedProperty:forObject:](self, "changedProperty:forObject:", v8, self);

}

void __32__ASDPlugin_removeAudioDevices___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *context;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  context = (void *)MEMORY[0x22073330C]();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v8 = *(void **)(*(_QWORD *)(a1 + 40) + 96);
        objc_msgSend(v7, "deviceUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), CFSTR("ASDPlugin.m"), 794, CFSTR("Device doesn't exist"));

        }
        objc_msgSend(v7, "systemHasPoweredOn");
        ASD_RemoveAudioDeviceRealTimeOperations(objc_msgSend(*(id *)(a1 + 40), "driverRef"), v7);
        v11 = *(void **)(*(_QWORD *)(a1 + 40) + 96);
        objc_msgSend(v7, "deviceUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeObjectForKey:", v12);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

  objc_autoreleasePoolPop(context);
}

- (id)audioDevices
{
  NSObject *audioDeviceQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  audioDeviceQueue = self->_audioDeviceQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __25__ASDPlugin_audioDevices__block_invoke;
  v5[3] = &unk_24DBCA398;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(audioDeviceQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __25__ASDPlugin_audioDevices__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "allValues");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithArray:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (unsigned)objectIDForDeviceUID:(id)a3
{
  id v4;
  NSObject *audioDeviceQueue;
  uint64_t v6;
  id v7;
  unsigned int v8;
  NSObject *clockDeviceQueue;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  _QWORD block[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  audioDeviceQueue = self->_audioDeviceQueue;
  v6 = MEMORY[0x24BDAC760];
  v20 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__ASDPlugin_objectIDForDeviceUID___block_invoke;
  block[3] = &unk_24DBCA410;
  block[4] = self;
  v7 = v4;
  v15 = v7;
  v16 = &v17;
  dispatch_sync(audioDeviceQueue, block);
  v8 = *((_DWORD *)v18 + 6);
  if (!v8)
  {
    clockDeviceQueue = self->_clockDeviceQueue;
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __34__ASDPlugin_objectIDForDeviceUID___block_invoke_2;
    v11[3] = &unk_24DBCA410;
    v11[4] = self;
    v12 = v7;
    v13 = &v17;
    dispatch_sync(clockDeviceQueue, v11);

    v8 = *((_DWORD *)v18 + 6);
  }

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __34__ASDPlugin_objectIDForDeviceUID___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x22073330C]();
  objc_msgSend(*(id *)(a1[4] + 96), "objectForKey:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v3, "objectID");

  objc_autoreleasePoolPop(v2);
}

void __34__ASDPlugin_objectIDForDeviceUID___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x22073330C]();
  objc_msgSend(*(id *)(a1[4] + 112), "objectForKey:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v3, "objectID");

  objc_autoreleasePoolPop(v2);
}

- (void)addStreamRealTimeOperations:(id)a3
{
  id v4;

  v4 = a3;
  ASD_AddStreamRealTimeOperations((uint64_t)-[ASDPlugin driverRef](self, "driverRef"), v4);

}

- (void)removeStreamRealTimeOperations:(id)a3
{
  id v4;

  v4 = a3;
  ASD_RemoveStreamRealTimeOperations((uint64_t)-[ASDPlugin driverRef](self, "driverRef"), v4);

}

- (void)addBox:(id)a3
{
  id v4;
  NSObject *boxQueue;
  id v6;
  char v7[9];
  char v8;
  __int16 v9;
  _QWORD block[5];
  id v11;

  v4 = a3;
  boxQueue = self->_boxQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __20__ASDPlugin_addBox___block_invoke;
  block[3] = &unk_24DBCA438;
  block[4] = self;
  v11 = v4;
  v6 = v4;
  dispatch_sync(boxQueue, block);
  objc_msgSend(v6, "setOwner:", self);
  v8 = 0;
  v9 = 0;
  strcpy(v7, "#xobbolg");
  -[ASDPlugin changedProperty:forObject:](self, "changedProperty:forObject:", v7, self);
  *(_DWORD *)v7 = 1870098020;
  -[ASDPlugin changedProperty:forObject:](self, "changedProperty:forObject:", v7, self);

}

void __20__ASDPlugin_addBox___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x22073330C]();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(v3 + 80);
  objc_msgSend(v4, "boxUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, v6);

  objc_autoreleasePoolPop(v2);
}

- (void)removeBox:(id)a3
{
  id v4;
  NSObject *boxQueue;
  id v6;
  char v7[9];
  char v8;
  __int16 v9;
  _QWORD block[5];
  id v11;

  v4 = a3;
  boxQueue = self->_boxQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __23__ASDPlugin_removeBox___block_invoke;
  block[3] = &unk_24DBCA438;
  block[4] = self;
  v11 = v4;
  v6 = v4;
  dispatch_sync(boxQueue, block);
  v8 = 0;
  v9 = 0;
  strcpy(v7, "#xobbolg");
  -[ASDPlugin changedProperty:forObject:](self, "changedProperty:forObject:", v7, self);
  *(_DWORD *)v7 = 1870098020;
  -[ASDPlugin changedProperty:forObject:](self, "changedProperty:forObject:", v7, self);

}

void __23__ASDPlugin_removeBox___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x22073330C]();
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  objc_msgSend(v3, "boxUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v5);

  objc_autoreleasePoolPop(v2);
}

- (id)boxes
{
  NSObject *boxQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  boxQueue = self->_boxQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __18__ASDPlugin_boxes__block_invoke;
  v5[3] = &unk_24DBCA398;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(boxQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __18__ASDPlugin_boxes__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "allValues");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithArray:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (unsigned)objectIDForBoxUID:(id)a3
{
  id v4;
  NSObject *boxQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  boxQueue = self->_boxQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__ASDPlugin_objectIDForBoxUID___block_invoke;
  block[3] = &unk_24DBCA410;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(boxQueue, block);
  LODWORD(boxQueue) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return boxQueue;
}

void __31__ASDPlugin_objectIDForBoxUID___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x22073330C]();
  objc_msgSend(*(id *)(a1[4] + 80), "objectForKey:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v3, "objectID");

  objc_autoreleasePoolPop(v2);
}

- (void)addClockDevice:(id)a3
{
  id v5;
  NSObject *clockDeviceQueue;
  id v7;
  uint64_t v8;
  int v9;
  _QWORD block[5];
  id v11;
  SEL v12;

  v5 = a3;
  clockDeviceQueue = self->_clockDeviceQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__ASDPlugin_addClockDevice___block_invoke;
  block[3] = &unk_24DBCA3E8;
  block[4] = self;
  v11 = v5;
  v12 = a2;
  v7 = v5;
  dispatch_sync(clockDeviceQueue, block);
  v9 = 0;
  v8 = 0x676C6F62636C6B23;
  -[ASDPlugin changedProperty:forObject:](self, "changedProperty:forObject:", &v8, self);

}

void __28__ASDPlugin_addClockDevice___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)MEMORY[0x22073330C]();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  objc_msgSend(*(id *)(a1 + 40), "deviceUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("ASDPlugin.m"), 944, CFSTR("Clock Device already exists"));

  }
  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  objc_msgSend(v6, "deviceUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v6, v8);

  ASD_AddClockDeviceRealTimeOperations(objc_msgSend(*(id *)(a1 + 32), "driverRef"), *(void **)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

- (void)addClockDevices:(id)a3
{
  id v5;
  NSObject *clockDeviceQueue;
  id v7;
  char v8[9];
  char v9;
  __int16 v10;
  _QWORD block[4];
  id v12;
  ASDPlugin *v13;
  SEL v14;

  v5 = a3;
  clockDeviceQueue = self->_clockDeviceQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__ASDPlugin_addClockDevices___block_invoke;
  block[3] = &unk_24DBCA3E8;
  v12 = v5;
  v13 = self;
  v14 = a2;
  v7 = v5;
  dispatch_sync(clockDeviceQueue, block);
  v9 = 0;
  v10 = 0;
  strcpy(v8, "#klcbolg");
  -[ASDPlugin changedProperty:forObject:](self, "changedProperty:forObject:", v8, self);
  *(_DWORD *)v8 = 1870098020;
  -[ASDPlugin changedProperty:forObject:](self, "changedProperty:forObject:", v8, self);

}

void __29__ASDPlugin_addClockDevices___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *context;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  context = (void *)MEMORY[0x22073330C]();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v8 = *(void **)(*(_QWORD *)(a1 + 40) + 112);
        objc_msgSend(v7, "deviceUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), CFSTR("ASDPlugin.m"), 965, CFSTR("Device already exists"));

        }
        v11 = *(void **)(*(_QWORD *)(a1 + 40) + 112);
        objc_msgSend(v7, "deviceUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v7, v12);

        ASD_AddClockDeviceRealTimeOperations(objc_msgSend(*(id *)(a1 + 40), "driverRef"), v7);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

  objc_autoreleasePoolPop(context);
}

- (void)removeClockDevice:(id)a3
{
  id v5;
  NSObject *clockDeviceQueue;
  id v7;
  uint64_t v8;
  int v9;
  _QWORD block[5];
  id v11;
  SEL v12;

  v5 = a3;
  clockDeviceQueue = self->_clockDeviceQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__ASDPlugin_removeClockDevice___block_invoke;
  block[3] = &unk_24DBCA3E8;
  block[4] = self;
  v11 = v5;
  v12 = a2;
  v7 = v5;
  dispatch_sync(clockDeviceQueue, block);
  v9 = 0;
  v8 = 0x676C6F62636C6B23;
  -[ASDPlugin changedProperty:forObject:](self, "changedProperty:forObject:", &v8, self);

}

void __31__ASDPlugin_removeClockDevice___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)MEMORY[0x22073330C]();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  objc_msgSend(*(id *)(a1 + 40), "deviceUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("ASDPlugin.m"), 989, CFSTR("Clock Device doesn't exist"));

  }
  objc_msgSend(*(id *)(a1 + 40), "systemHasPoweredOn");
  ASD_RemoveClockDeviceRealTimeOperations(objc_msgSend(*(id *)(a1 + 32), "driverRef"), *(void **)(a1 + 40));
  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  objc_msgSend(v6, "deviceUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v8);

  objc_autoreleasePoolPop(v2);
}

- (void)removeClockDevices:(id)a3
{
  id v5;
  NSObject *clockDeviceQueue;
  id v7;
  char v8[9];
  char v9;
  __int16 v10;
  _QWORD block[4];
  id v12;
  ASDPlugin *v13;
  SEL v14;

  v5 = a3;
  clockDeviceQueue = self->_clockDeviceQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__ASDPlugin_removeClockDevices___block_invoke;
  block[3] = &unk_24DBCA3E8;
  v12 = v5;
  v13 = self;
  v14 = a2;
  v7 = v5;
  dispatch_sync(clockDeviceQueue, block);
  v9 = 0;
  v10 = 0;
  strcpy(v8, "#klcbolg");
  -[ASDPlugin changedProperty:forObject:](self, "changedProperty:forObject:", v8, self);
  *(_DWORD *)v8 = 1870098020;
  -[ASDPlugin changedProperty:forObject:](self, "changedProperty:forObject:", v8, self);

}

void __32__ASDPlugin_removeClockDevices___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *context;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  context = (void *)MEMORY[0x22073330C]();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v8 = *(void **)(*(_QWORD *)(a1 + 40) + 112);
        objc_msgSend(v7, "deviceUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), CFSTR("ASDPlugin.m"), 1011, CFSTR("Device doesn't exist"));

        }
        objc_msgSend(v7, "systemHasPoweredOn");
        ASD_RemoveClockDeviceRealTimeOperations(objc_msgSend(*(id *)(a1 + 40), "driverRef"), v7);
        v11 = *(void **)(*(_QWORD *)(a1 + 40) + 112);
        objc_msgSend(v7, "deviceUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeObjectForKey:", v12);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

  objc_autoreleasePoolPop(context);
}

- (id)clockDevices
{
  NSObject *clockDeviceQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  clockDeviceQueue = self->_clockDeviceQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __25__ASDPlugin_clockDevices__block_invoke;
  v5[3] = &unk_24DBCA398;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(clockDeviceQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __25__ASDPlugin_clockDevices__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "allValues");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithArray:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (unsigned)objectIDForClockDeviceUID:(id)a3
{
  id v4;
  NSObject *clockDeviceQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  clockDeviceQueue = self->_clockDeviceQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__ASDPlugin_objectIDForClockDeviceUID___block_invoke;
  block[3] = &unk_24DBCA410;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(clockDeviceQueue, block);
  LODWORD(clockDeviceQueue) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return clockDeviceQueue;
}

void __39__ASDPlugin_objectIDForClockDeviceUID___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x22073330C]();
  objc_msgSend(*(id *)(a1[4] + 112), "objectForKey:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v3, "objectID");

  objc_autoreleasePoolPop(v2);
}

- (void)changedProperty:(const AudioObjectPropertyAddress *)a3 forObject:(id)a4
{
  id v6;
  AudioServerPlugInHostInterface *pluginHost;
  AudioObjectPropertySelector mSelector;
  int v9;
  id v10;

  v6 = a4;
  if (v6)
  {
    if (a3)
    {
      pluginHost = self->_pluginHost;
      if (pluginHost)
      {
        mSelector = a3->mSelector;
        if ((int)a3->mSelector > 1885762591)
        {
          if (mSelector == 1885762592)
            goto LABEL_11;
          v9 = 1936092532;
        }
        else
        {
          if (mSelector == 1667523955)
            goto LABEL_11;
          v9 = 1853059700;
        }
        if (mSelector != v9)
        {
          v10 = v6;
          ((void (*)(AudioServerPlugInHostInterface *, uint64_t, uint64_t, const AudioObjectPropertyAddress *))pluginHost->PropertiesChanged)(pluginHost, objc_msgSend(v6, "objectID"), 1, a3);
          v6 = v10;
        }
      }
    }
  }
LABEL_11:

}

- (void)changedProperty:(const AudioObjectPropertyAddress *)a3 forObjectID:(unsigned int)a4
{
  AudioServerPlugInHostInterface *pluginHost;
  AudioObjectPropertySelector mSelector;
  BOOL v6;
  int v7;

  if (a3)
  {
    pluginHost = self->_pluginHost;
    if (pluginHost)
    {
      mSelector = a3->mSelector;
      if ((int)a3->mSelector > 1885762591)
      {
        v6 = mSelector == 1885762592;
        v7 = 1936092532;
      }
      else
      {
        v6 = mSelector == 1667523955;
        v7 = 1853059700;
      }
      if (!v6 && mSelector != v7)
        ((void (*)(AudioServerPlugInHostInterface *, _QWORD, uint64_t, const AudioObjectPropertyAddress *))pluginHost->PropertiesChanged)(pluginHost, *(_QWORD *)&a4, 1, a3);
    }
  }
}

- (BOOL)requestConfigurationChangeForDevice:(id)a3 withBlock:(id)a4
{
  id v6;
  void *v7;
  AudioServerPlugInHostInterface *pluginHost;
  int v9;
  int v10;
  NSObject *v11;
  BOOL v12;

  v6 = a3;
  v7 = (void *)MEMORY[0x220733498](a4);
  pluginHost = self->_pluginHost;
  if (pluginHost)
  {
    v9 = ((uint64_t (*)(AudioServerPlugInHostInterface *, uint64_t, _QWORD, void *))pluginHost->RequestDeviceConfigurationChange)(pluginHost, objc_msgSend(v6, "objectID"), 0, v7);
    if (!v9)
    {
      v12 = 1;
      goto LABEL_9;
    }
    v10 = v9;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDPlugin requestConfigurationChangeForDevice:withBlock:].cold.2(v10);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[ASDPlugin requestConfigurationChangeForDevice:withBlock:].cold.1();
  }
  dispatch_get_global_queue(21, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v11, v7);

  v12 = 0;
LABEL_9:

  return v12;
}

- (id)dictionaryForKey:(id)a3
{
  void (**pluginHost)(void *, id, id *);
  id v5;

  pluginHost = (void (**)(void *, id, id *))self->_pluginHost;
  if (pluginHost)
  {
    v5 = 0;
    pluginHost[1](pluginHost, a3, &v5);
    pluginHost = (void (**)(void *, id, id *))v5;
  }
  return pluginHost;
}

- (void)setDictionary:(id)a3 forKey:(id)a4
{
  id v6;
  AudioServerPlugInHostInterface *pluginHost;
  id v8;

  v8 = a3;
  v6 = a4;
  pluginHost = self->_pluginHost;
  if (pluginHost)
  {
    if (v8)
      ((void (*)(AudioServerPlugInHostInterface *, id))pluginHost->WriteToStorage)(pluginHost, v6);
    else
      ((void (*)(AudioServerPlugInHostInterface *, id))pluginHost->DeleteFromStorage)(pluginHost, v6);
  }

}

- (id)arrayForKey:(id)a3
{
  void (**pluginHost)(void *, id, id *);
  id v5;

  pluginHost = (void (**)(void *, id, id *))self->_pluginHost;
  if (pluginHost)
  {
    v5 = 0;
    pluginHost[1](pluginHost, a3, &v5);
    pluginHost = (void (**)(void *, id, id *))v5;
  }
  return pluginHost;
}

- (void)setArray:(id)a3 forKey:(id)a4
{
  id v6;
  AudioServerPlugInHostInterface *pluginHost;
  id v8;

  v8 = a3;
  v6 = a4;
  pluginHost = self->_pluginHost;
  if (pluginHost)
  {
    if (v8)
      ((void (*)(AudioServerPlugInHostInterface *, id))pluginHost->WriteToStorage)(pluginHost, v6);
    else
      ((void (*)(AudioServerPlugInHostInterface *, id))pluginHost->DeleteFromStorage)(pluginHost, v6);
  }

}

- (BOOL)registerForSystemSleepNotifications
{
  id v3;
  IONotificationPort **p_powerNotificationPort;
  IONotificationPort *v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    -[ASDPlugin bundleID](self, "bundleID");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = 136315138;
    v8 = objc_msgSend(v3, "UTF8String");
    _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s registered for system sleep notifications", (uint8_t *)&v7, 0xCu);

  }
  p_powerNotificationPort = &self->_powerNotificationPort;
  LODWORD(v5) = IORegisterForSystemPower(self, &self->_powerNotificationPort, (IOServiceInterestCallback)IOPowerNotifierCallback, &self->_powerNotifier);
  self->_powerConnection = v5;
  if ((_DWORD)v5)
  {
    if (self->_powerNotifier)
    {
      v5 = *p_powerNotificationPort;
      if (*p_powerNotificationPort)
      {
        IONotificationPortSetDispatchQueue(v5, (dispatch_queue_t)self->_powerNotificationQueue);
        LOBYTE(v5) = 1;
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return (char)v5;
}

- (void)_handlePowerNotificationWithMessageType:(unsigned int)a3 andArgument:(int64_t)a4
{
  unint64_t v6;
  id v8;
  NSObject *v9;
  const char *v10;
  id v11;
  uint32_t v12;
  id v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  unsigned int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  HIDWORD(v6) = a3;
  LODWORD(v6) = a3 + 536870288;
  switch((v6 >> 4))
  {
    case 0u:
      IOAllowPowerChange(self->_powerConnection, a4);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        -[ASDPlugin bundleID](self, "bundleID");
        v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v14 = 136315138;
        v15 = objc_msgSend(v8, "UTF8String");
        v9 = MEMORY[0x24BDACB70];
        v10 = "%s received power notification kIOMessageCanSystemSleep";
        goto LABEL_16;
      }
      break;
    case 1u:
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        -[ASDPlugin bundleID](self, "bundleID");
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v14 = 136315138;
        v15 = objc_msgSend(v11, "UTF8String");
        _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s received power notification kIOMessageSystemWillSleep", (uint8_t *)&v14, 0xCu);

      }
      -[ASDPlugin systemWillSleep](self, "systemWillSleep");
      IOAllowPowerChange(self->_powerConnection, a4);
      break;
    case 2u:
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        -[ASDPlugin bundleID](self, "bundleID");
        v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v14 = 136315138;
        v15 = objc_msgSend(v8, "UTF8String");
        v9 = MEMORY[0x24BDACB70];
        v10 = "%s received power notification kIOMessageSystemWillNotSleep";
        goto LABEL_16;
      }
      break;
    case 9u:
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        -[ASDPlugin bundleID](self, "bundleID");
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v14 = 136315138;
        v15 = objc_msgSend(v13, "UTF8String");
        _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s received power notification kIOMessageSystemHasPoweredOn", (uint8_t *)&v14, 0xCu);

      }
      -[ASDPlugin systemHasPoweredOn](self, "systemHasPoweredOn");
      break;
    case 0xBu:
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        -[ASDPlugin bundleID](self, "bundleID");
        v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v14 = 136315138;
        v15 = objc_msgSend(v8, "UTF8String");
        v9 = MEMORY[0x24BDACB70];
        v10 = "%s received power notification kIOMessageSystemWillPowerOn";
LABEL_16:
        v12 = 12;
        goto LABEL_17;
      }
      break;
    default:
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        -[ASDPlugin bundleID](self, "bundleID");
        v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v14 = 136315394;
        v15 = objc_msgSend(v8, "UTF8String");
        v16 = 1024;
        v17 = a3;
        v9 = MEMORY[0x24BDACB70];
        v10 = "%s received unhandled power notification 0x%x";
        v12 = 18;
LABEL_17:
        _os_log_impl(&dword_219C60000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v12);

      }
      break;
  }
}

- (void)systemWillSleep
{
  void *v3;
  NSObject *boxQueue;
  uint64_t v5;
  id v6;
  NSObject *audioDeviceQueue;
  NSObject *clockDeviceQueue;
  id v9;
  _QWORD v10[5];
  _QWORD v11[5];
  id v12;
  _QWORD block[5];
  id v14;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  boxQueue = self->_boxQueue;
  v5 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__ASDPlugin_systemWillSleep__block_invoke;
  block[3] = &unk_24DBCA438;
  block[4] = self;
  v6 = v3;
  v14 = v6;
  dispatch_sync(boxQueue, block);
  audioDeviceQueue = self->_audioDeviceQueue;
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __28__ASDPlugin_systemWillSleep__block_invoke_2;
  v11[3] = &unk_24DBCA438;
  v11[4] = self;
  v12 = v6;
  v9 = v6;
  dispatch_sync(audioDeviceQueue, v11);
  clockDeviceQueue = self->_clockDeviceQueue;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __28__ASDPlugin_systemWillSleep__block_invoke_3;
  v10[3] = &unk_24DBCA460;
  v10[4] = self;
  dispatch_sync(clockDeviceQueue, v10);

}

void __28__ASDPlugin_systemWillSleep__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "systemWillSleep");
        v9 = *(void **)(a1 + 40);
        objc_msgSend(v8, "audioDevices");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObjectsFromArray:", v10);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  objc_autoreleasePoolPop(v2);
}

void __28__ASDPlugin_systemWillSleep__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v8) & 1) == 0)
          objc_msgSend(v8, "systemWillSleep");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  objc_autoreleasePoolPop(v2);
}

void __28__ASDPlugin_systemWillSleep__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "systemWillSleep");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  objc_autoreleasePoolPop(v2);
}

- (void)systemHasPoweredOn
{
  void *v3;
  NSObject *boxQueue;
  uint64_t v5;
  id v6;
  NSObject *audioDeviceQueue;
  NSObject *clockDeviceQueue;
  id v9;
  _QWORD v10[5];
  _QWORD v11[5];
  id v12;
  _QWORD block[5];
  id v14;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  boxQueue = self->_boxQueue;
  v5 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__ASDPlugin_systemHasPoweredOn__block_invoke;
  block[3] = &unk_24DBCA438;
  block[4] = self;
  v6 = v3;
  v14 = v6;
  dispatch_sync(boxQueue, block);
  audioDeviceQueue = self->_audioDeviceQueue;
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __31__ASDPlugin_systemHasPoweredOn__block_invoke_2;
  v11[3] = &unk_24DBCA438;
  v11[4] = self;
  v12 = v6;
  v9 = v6;
  dispatch_sync(audioDeviceQueue, v11);
  clockDeviceQueue = self->_clockDeviceQueue;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __31__ASDPlugin_systemHasPoweredOn__block_invoke_3;
  v10[3] = &unk_24DBCA460;
  v10[4] = self;
  dispatch_sync(clockDeviceQueue, v10);

}

void __31__ASDPlugin_systemHasPoweredOn__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "systemHasPoweredOn");
        v9 = *(void **)(a1 + 40);
        objc_msgSend(v8, "audioDevices");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObjectsFromArray:", v10);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  objc_autoreleasePoolPop(v2);
}

void __31__ASDPlugin_systemHasPoweredOn__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v8) & 1) == 0)
          objc_msgSend(v8, "systemHasPoweredOn");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  objc_autoreleasePoolPop(v2);
}

void __31__ASDPlugin_systemHasPoweredOn__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "systemHasPoweredOn");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  objc_autoreleasePoolPop(v2);
}

- (BOOL)deregisterForSystemSleepNotifications
{
  id v3;
  io_connect_t powerConnection;
  IONotificationPort *powerNotificationPort;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    -[ASDPlugin bundleID](self, "bundleID");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = 136315138;
    v8 = objc_msgSend(v3, "UTF8String");
    _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s deregistered for system sleep notifications", (uint8_t *)&v7, 0xCu);

  }
  if (self->_powerNotifier)
  {
    IODeregisterForSystemPower(&self->_powerNotifier);
    self->_powerNotifier = 0;
  }
  powerConnection = self->_powerConnection;
  if (powerConnection)
  {
    IOServiceClose(powerConnection);
    self->_powerConnection = 0;
  }
  powerNotificationPort = self->_powerNotificationPort;
  if (powerNotificationPort)
  {
    IONotificationPortDestroy(powerNotificationPort);
    self->_powerNotificationPort = 0;
  }
  return 1;
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  id v40;
  uint64_t v41;
  void *v43;
  void *v44;
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
  objc_super v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v4 = a4;
  v61 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v57.receiver = self;
  v57.super_class = (Class)ASDPlugin;
  -[ASDObject diagnosticDescriptionWithIndent:walkTree:](&v57, sel_diagnosticDescriptionWithIndent_walkTree_, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("|        "));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDPlugin bundleID](self, "bundleID");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Bundle ID: %s\n"), v6, objc_msgSend(v8, "UTF8String"));

  v44 = v6;
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Manufacturer: %s\n"), v6, -[NSString UTF8String](self->_manufacturerName, "UTF8String"));
  -[ASDPlugin boxes](self, "boxes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Box Objects:\n"), v6);
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    -[ASDPlugin boxes](self, "boxes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v54 != v15)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          if (v4)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "diagnosticDescriptionWithIndent:walkTree:", v43, 1);
            v18 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendString:", v18);
          }
          else
          {
            v19 = objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "objectID");
            objc_msgSend(v17, "boxUID");
            v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            objc_msgSend(v7, "appendFormat:", CFSTR("%@|        %u: %u (%s)\n"), v44, v14 + i, v19, objc_msgSend(v18, "UTF8String"));
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
        v14 = (v14 + i);
      }
      while (v13);
    }

  }
  -[ASDPlugin audioDevices](self, "audioDevices");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v21)
  {
    objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Audio Device Objects:\n"), v44);
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    -[ASDPlugin audioDevices](self, "audioDevices");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    if (v23)
    {
      v24 = v23;
      v25 = 0;
      v26 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v50 != v26)
            objc_enumerationMutation(v22);
          v28 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
          if (v4)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * j), "diagnosticDescriptionWithIndent:walkTree:", v43, 1);
            v29 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendString:", v29);
          }
          else
          {
            v30 = objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * j), "objectID");
            objc_msgSend(v28, "deviceUID");
            v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            objc_msgSend(v7, "appendFormat:", CFSTR("%@|        %u: %u (%s)\n"), v44, v25 + j, v30, objc_msgSend(v29, "UTF8String"));
          }

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
        v25 = (v25 + j);
      }
      while (v24);
    }

  }
  -[ASDPlugin clockDevices](self, "clockDevices");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count");

  if (v32)
  {
    objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Clock Device Objects:\n"), v44);
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    -[ASDPlugin clockDevices](self, "clockDevices");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
    if (v34)
    {
      v35 = v34;
      v36 = 0;
      v37 = *(_QWORD *)v46;
      do
      {
        for (k = 0; k != v35; ++k)
        {
          if (*(_QWORD *)v46 != v37)
            objc_enumerationMutation(v33);
          v39 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * k);
          if (v4)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * k), "diagnosticDescriptionWithIndent:walkTree:", v43, 1);
            v40 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendString:", v40);
          }
          else
          {
            v41 = objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * k), "objectID");
            objc_msgSend(v39, "deviceUID");
            v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            objc_msgSend(v7, "appendFormat:", CFSTR("%@|        %u: %u (%s)\n"), v44, v36 + k, v41, objc_msgSend(v40, "UTF8String"));
          }

        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
        v36 = (v36 + k);
      }
      while (v35);
    }

  }
  return v7;
}

- (id)driverClassName
{
  return CFSTR("AudioPlugin");
}

- (AudioServerPlugInDriverInterface)driverRef
{
  return self->_driverRef;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (unsigned)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(unsigned int)a3
{
  self->_transportType = a3;
}

- (unsigned)maximumNumberOfObjects
{
  return self->_maximumNumberOfObjects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_powerNotificationQueue, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);
  objc_storeStrong((id *)&self->_clockDeviceQueue, 0);
  objc_storeStrong((id *)&self->_clockDevices, 0);
  objc_storeStrong((id *)&self->_audioDeviceQueue, 0);
  objc_storeStrong((id *)&self->_audioDevices, 0);
  objc_storeStrong((id *)&self->_boxQueue, 0);
  objc_storeStrong((id *)&self->_boxes, 0);
  objc_storeStrong((id *)&self->_objects, 0);
}

- (void)requestConfigurationChangeForDevice:withBlock:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "request config change with no plugin host", v0, 2u);
}

- (void)requestConfigurationChangeForDevice:(int)a1 withBlock:.cold.2(int a1)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "request config change error %u", (uint8_t *)v1, 8u);
}

@end
