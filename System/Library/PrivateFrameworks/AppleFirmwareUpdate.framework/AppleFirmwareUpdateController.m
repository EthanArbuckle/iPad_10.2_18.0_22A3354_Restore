@implementation AppleFirmwareUpdateController

- (AppleFirmwareUpdateController)initWithRegistryEntryID:(id)a3 fwAssetDirectory:(id)a4
{
  id v7;
  id v8;
  AppleFirmwareUpdateController *v9;
  os_log_t v10;
  OS_os_log *log;
  NSMutableArray *v12;
  NSMutableArray *pendingCriticalEarlyBootEntriesInternal;
  dispatch_queue_t v14;
  OS_dispatch_queue *delegateQueue;
  dispatch_queue_t v16;
  OS_dispatch_queue *workQueue;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)AppleFirmwareUpdateController;
  v9 = -[AppleFirmwareUpdateController init](&v19, sel_init);
  if (v9)
  {
    v10 = os_log_create("com.apple.accessoryfirmwareupdate", "default");
    log = v9->_log;
    v9->_log = (OS_os_log *)v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    pendingCriticalEarlyBootEntriesInternal = v9->_pendingCriticalEarlyBootEntriesInternal;
    v9->_pendingCriticalEarlyBootEntriesInternal = v12;

    v14 = dispatch_queue_create("com.apple.appleFirmwareUpdate.delegateQueue", 0);
    delegateQueue = v9->_delegateQueue;
    v9->_delegateQueue = (OS_dispatch_queue *)v14;

    v16 = dispatch_queue_create("com.apple.appleFirmwareUpdate.workQueue", 0);
    workQueue = v9->_workQueue;
    v9->_workQueue = (OS_dispatch_queue *)v16;

    objc_storeStrong((id *)&v9->_registryEntryID, a3);
    objc_storeStrong((id *)&v9->_fwAssetDirectory, a4);
  }

  return v9;
}

- (void)dealloc
{
  IONotificationPort *iokitNotifyPort;
  objc_super v4;

  iokitNotifyPort = self->_iokitNotifyPort;
  if (iokitNotifyPort)
  {
    IONotificationPortDestroy(iokitNotifyPort);
    self->_iokitNotifyPort = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AppleFirmwareUpdateController;
  -[AppleFirmwareUpdateController dealloc](&v4, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__AppleFirmwareUpdateController_setDelegate___block_invoke;
  block[3] = &unk_24D9B23A0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(workQueue, block);

}

id __45__AppleFirmwareUpdateController_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

- (void)enableEarlyBootLoggingMode
{
  FudLogSetMode(1);
}

- (BOOL)getEarlyBootList:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__AppleFirmwareUpdateController_getEarlyBootList___block_invoke;
  block[3] = &unk_24D9B23C8;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(workQueue, block);
  LOBYTE(workQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)workQueue;
}

void __50__AppleFirmwareUpdateController_getEarlyBootList___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "getEarlyBootListInternal:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "sortEarlyBootListWithLoadingGroup:", *(_QWORD *)(a1 + 40));
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = 136315394;
    v5 = "-[AppleFirmwareUpdateController getEarlyBootList:]_block_invoke";
    v6 = 2112;
    v7 = v3;
    _os_log_impl(&dword_218BD4000, v2, OS_LOG_TYPE_INFO, "%s: Ealyboot List: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)sortEarlyBootListWithLoadingGroup:(id)a3
{
  objc_msgSend(a3, "sortUsingComparator:", &__block_literal_global_0);
}

uint64_t __67__AppleFirmwareUpdateController_sortEarlyBootListWithLoadingGroup___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LoadingGroup")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LoadingGroup"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &unk_24D9B3E80;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LoadingGroup")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        v10 = objc_opt_isKindOfClass(),
        v9,
        (v10 & 1) != 0))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LoadingGroup"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = &unk_24D9B3E80;
  }
  v12 = objc_msgSend(v11, "compare:", v8);

  return v12;
}

- (BOOL)getEarlyBootListInternal:(id)a3
{
  const __CFDictionary *v4;
  uint64_t v5;
  const __CFAllocator *v6;
  io_registry_entry_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  io_registry_entry_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *CFProperty;
  void *v19;
  void *v20;
  void *v21;
  NSObject *log;
  char v23;
  NSObject *v24;
  __CFString *v25;
  id v27;
  uint64_t entryID;
  io_iterator_t existing;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  __CFString *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v27 = a3;
  existing = 0;
  FudLogSetMode(1);
  -[AppleFirmwareUpdateController readCriticalEarlyBootEntries](self, "readCriticalEarlyBootEntries");
  v4 = IOServiceMatching("AppleFirmwareUpdateKext");
  if (v4 && !IOServiceGetMatchingServices(*MEMORY[0x24BDD8B20], v4, &existing))
  {
    v5 = 0;
    v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    while (1)
    {
      v7 = IOIteratorNext(existing);
      if (!v7)
      {
LABEL_23:
        if (v5)
          goto LABEL_24;
        goto LABEL_27;
      }
      v14 = v7;
      entryID = 0;
      if (IORegistryEntryGetRegistryEntryID(v7, &entryID))
        break;
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        v16 = 0;
LABEL_22:
        v23 = 0;
        v5 = 14;
        goto LABEL_18;
      }
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
        goto LABEL_22;
      objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("com.apple.mau.plugin.generickext"), CFSTR("DeviceClassName"));
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", entryID);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("IOMatchLaunchServiceID"));

      objc_msgSend(v15, "setObject:forKey:", v16, CFSTR("OptionsDict"));
      CFProperty = (void *)IORegistryEntryCreateCFProperty(v14, CFSTR("Image Tag"), v6, 0);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[NSMutableArray removeObject:](self->_pendingCriticalEarlyBootEntriesInternal, "removeObject:", CFProperty);
      v19 = (void *)IORegistryEntryCreateCFProperty(v14, CFSTR("LoadingGroup"), v6, 0);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = v15;
        v21 = v19;
      }
      else
      {
        v20 = v15;
        v21 = &unk_24D9B3E80;
      }
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("LoadingGroup"));
      objc_msgSend(v27, "addObject:", v15);
      if (v5 == 1)
        goto LABEL_14;
LABEL_17:
      IOObjectRelease(v14);

      v23 = 1;
LABEL_18:

      if ((v23 & 1) == 0)
        goto LABEL_23;
    }
    v19 = 0;
    CFProperty = 0;
    v15 = 0;
    v16 = 0;
LABEL_14:
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[AppleFirmwareUpdateController getEarlyBootListInternal:]";
      v32 = 1024;
      LODWORD(v33) = v14;
      _os_log_impl(&dword_218BD4000, log, OS_LOG_TYPE_INFO, "%s: registry entry not found for service=%d", buf, 0x12u);
    }
    v5 = 1;
    goto LABEL_17;
  }
  v5 = 13;
LABEL_24:
  v24 = self->_log;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = errorString[v5];
    *(_DWORD *)buf = 136315650;
    v31 = "-[AppleFirmwareUpdateController getEarlyBootListInternal:]";
    v32 = 2112;
    v33 = v25;
    v34 = 2048;
    v35 = v5;
    _os_log_impl(&dword_218BD4000, v24, OS_LOG_TYPE_INFO, "%s: Error:%@ code=0x%0lx", buf, 0x20u);
  }
  objc_msgSend(v27, "removeAllObjects");
LABEL_27:
  FudLog(7, (uint64_t)CFSTR("%s: Pending critical earlyBoot entries %@"), v8, v9, v10, v11, v12, v13, (uint64_t)"-[AppleFirmwareUpdateController getEarlyBootListInternal:]");

  return 0;
}

- (BOOL)registerForPendingEarlyBootAccessories
{
  NSObject *workQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __71__AppleFirmwareUpdateController_registerForPendingEarlyBootAccessories__block_invoke;
  v5[3] = &unk_24D9B2430;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __71__AppleFirmwareUpdateController_registerForPendingEarlyBootAccessories__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "registerForPendingEarlyBootAccessoriesInternal");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)registerForPendingEarlyBootAccessoriesInternal
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  CFMutableDictionaryRef v9;
  void *v10;
  IONotificationPort *iokitNotifyPort;
  const __CFDictionary *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  NSMutableArray *obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  io_iterator_t notification;
  const __CFString *v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = -[NSMutableArray count](self->_pendingCriticalEarlyBootEntriesInternal, "count");
  if (v3)
  {
    v20 = v3;
    if (!self->_iokitNotifyPort)
      self->_iokitNotifyPort = IONotificationPortCreate(*MEMORY[0x24BDD8B20]);
    notification = 0;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = self->_pendingCriticalEarlyBootEntriesInternal;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v23 != v6)
            objc_enumerationMutation(obj);
          v8 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          v9 = IOServiceMatching("AppleFirmwareUpdateKext");
          v27 = CFSTR("Image Tag");
          v28 = v8;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFDictionary setObject:forKey:](v9, "setObject:forKey:", v10, CFSTR("IOPropertyMatch"));

          iokitNotifyPort = self->_iokitNotifyPort;
          v12 = v9;
          if (IOServiceAddMatchingNotification(iokitNotifyPort, "IOServiceMatched", v12, (IOServiceMatchingCallback)serviceRegistered, self, &notification))
          {
            FudLog(7, (uint64_t)CFSTR("%s: Failed to registered for tag %@"), v13, v14, v15, v16, v17, v18, (uint64_t)"-[AppleFirmwareUpdateController registerForPendingEarlyBootAccessoriesInternal]");
          }
          else
          {
            FudLog(7, (uint64_t)CFSTR("%s: Registered for tag %@"), v13, v14, v15, v16, v17, v18, (uint64_t)"-[AppleFirmwareUpdateController registerForPendingEarlyBootAccessoriesInternal]");
            if (notification)
            {
              -[AppleFirmwareUpdateController earlyBootAccessoryAttachedInternal:](self, "earlyBootAccessoryAttachedInternal:");
              IOObjectRelease(notification);
            }
          }

        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
      }
      while (v5);
    }

    v3 = v20;
  }
  return v3 != 0;
}

- (void)earlyBootAccessoryAttached:(unsigned int)a3
{
  NSObject *workQueue;
  _QWORD v4[5];
  unsigned int v5;

  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __60__AppleFirmwareUpdateController_earlyBootAccessoryAttached___block_invoke;
  v4[3] = &unk_24D9B2458;
  v4[4] = self;
  v5 = a3;
  dispatch_async(workQueue, v4);
}

uint64_t __60__AppleFirmwareUpdateController_earlyBootAccessoryAttached___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "earlyBootAccessoryAttachedInternal:", *(unsigned int *)(a1 + 40));
}

- (void)earlyBootAccessoryAttachedInternal:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  io_object_t v10;
  io_object_t v11;
  const __CFAllocator *v12;
  void *v13;
  void *v14;
  void *v15;
  void *CFProperty;
  NSObject *delegateQueue;
  id v18;
  _QWORD block[5];
  id v20;
  uint64_t entryID;

  FudLog(7, (uint64_t)CFSTR("%s: %u"), *(uint64_t *)&a3, v3, v4, v5, v6, v7, (uint64_t)"-[AppleFirmwareUpdateController earlyBootAccessoryAttachedInternal:]");
  v10 = IOIteratorNext(a3);
  if (v10)
  {
    v11 = v10;
    v12 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    do
    {
      entryID = 0;
      if (IORegistryEntryGetRegistryEntryID(v11, &entryID))
      {
        IOObjectRelease(v11);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", CFSTR("com.apple.mau.plugin.generickext"), CFSTR("DeviceClassName"));
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", entryID);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("IOMatchLaunchServiceID"));

        objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("OptionsDict"));
        CFProperty = (void *)IORegistryEntryCreateCFProperty(v11, CFSTR("Image Tag"), v12, 0);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[NSMutableArray removeObject:](self->_pendingCriticalEarlyBootEntriesInternal, "removeObject:", CFProperty);
        delegateQueue = self->_delegateQueue;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __68__AppleFirmwareUpdateController_earlyBootAccessoryAttachedInternal___block_invoke;
        block[3] = &unk_24D9B23A0;
        block[4] = self;
        v20 = v13;
        v18 = v13;
        dispatch_async(delegateQueue, block);
        IOObjectRelease(v11);

      }
      v11 = IOIteratorNext(a3);
    }
    while (v11);
  }
  if (!-[NSMutableArray count](self->_pendingCriticalEarlyBootEntriesInternal, "count"))
  {
    IONotificationPortDestroy(self->_iokitNotifyPort);
    self->_iokitNotifyPort = 0;
  }
}

void __68__AppleFirmwareUpdateController_earlyBootAccessoryAttachedInternal___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(WeakRetained, "earlyBootAccessoryAttached:", *(_QWORD *)(a1 + 40));

}

- (void)readCriticalEarlyBootEntries
{
  io_object_t v3;
  io_registry_entry_t v4;
  const __CFAllocator *v5;
  void *CFProperty;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableArray *pendingCriticalEarlyBootEntriesInternal;
  void *v15;
  unsigned int v16;
  io_iterator_t iterator;

  iterator = 0;
  if (!IORegistryCreateIterator(0, "IODeviceTree", 1u, &iterator))
  {
    v3 = IOIteratorNext(iterator);
    if (v3)
    {
      v4 = v3;
      v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      do
      {
        CFProperty = (void *)IORegistryEntryCreateCFProperty(v4, CFSTR("aud-early-boot-critical"), v5, 0);
        if (CFProperty)
        {
          v7 = (void *)IORegistryEntryCreateCFProperty(v4, CFSTR("image-tag"), v5, 0);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "length") == 4)
          {
            v16 = 0;
            objc_msgSend(v7, "getBytes:length:", &v16, 4);
            FudLog(7, (uint64_t)CFSTR("%s: Critical earlyBoot entry: imageTag %u"), v8, v9, v10, v11, v12, v13, (uint64_t)"-[AppleFirmwareUpdateController readCriticalEarlyBootEntries]");
            pendingCriticalEarlyBootEntriesInternal = self->_pendingCriticalEarlyBootEntriesInternal;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v16);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray addObject:](pendingCriticalEarlyBootEntriesInternal, "addObject:", v15);

          }
        }
        IOObjectRelease(v4);

        v4 = IOIteratorNext(iterator);
      }
      while (v4);
    }
    IOObjectRelease(iterator);
  }
}

- (id)getPendingEarlyBootAccessories
{
  NSObject *workQueue;
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
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __63__AppleFirmwareUpdateController_getPendingEarlyBootAccessories__block_invoke;
  v5[3] = &unk_24D9B2430;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __63__AppleFirmwareUpdateController_getPendingEarlyBootAccessories__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)createFWAssetInfo
{
  NSObject *workQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __50__AppleFirmwareUpdateController_createFWAssetInfo__block_invoke;
  v5[3] = &unk_24D9B2430;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__AppleFirmwareUpdateController_createFWAssetInfo__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "createFWAssetInfoInternal");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)createFWAssetInfoInternal
{
  AppleFirmwareUpdateController *v2;
  NSString *fwAssetDirectory;
  NSString *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *log;
  NSObject *v9;
  io_registry_entry_t v10;
  io_registry_entry_t v11;
  const __CFAllocator *v12;
  void *CFProperty;
  AppleFirmwareUpdateController *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  char isKindOfClass;
  NSObject *v22;
  _BOOL4 v23;
  BOOL v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  NSNumber *img4Tag;
  NSNumber *fwAssetSize;
  NSNumber *registryEntryID;
  NSString *v40;
  NSString *fwAssetFile;
  NSString *fwAssetSignatureType;
  NSNumber *fwAssetVersion;
  NSObject *v45;
  const char *v46;
  NSObject *v47;
  uint32_t v48;
  io_registry_entry_t v49;
  void *v50;
  NSString *v51;
  id v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint8_t buf[4];
  _BYTE v62[28];
  __int16 v63;
  NSString *v64;
  __int16 v65;
  NSString *v66;
  __int16 v67;
  NSString *v68;
  __int16 v69;
  NSNumber *v70;
  __int16 v71;
  NSNumber *v72;
  _BYTE v73[128];
  uint64_t v74;

  v2 = self;
  v74 = *MEMORY[0x24BDAC8D0];
  v59 = 0;
  v60 = 0;
  fwAssetDirectory = self->_fwAssetDirectory;
  if (fwAssetDirectory)
  {
    v4 = fwAssetDirectory;
    v5 = 0;
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE63540], "sharedDataAccessor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0;
    v6 = (void *)objc_msgSend(v7, "copyPathForPersonalizedData:error:", 0, &v58);
    v5 = v58;

    log = v2->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v62 = v6;
      _os_log_impl(&dword_218BD4000, log, OS_LOG_TYPE_DEFAULT, "personalizedDataPath: %@", buf, 0xCu);
    }
    if (!v6)
    {
      CFProperty = 0;
      v24 = 0;
      v4 = 0;
      goto LABEL_34;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), v6, CFSTR("FUD"));
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v2->_log;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v62 = v4;
    _os_log_impl(&dword_218BD4000, v9, OS_LOG_TYPE_DEFAULT, "Firmware directory path: %@", buf, 0xCu);
  }
  v10 = -[AppleFirmwareUpdateController getServiceForRegistryID:](v2, "getServiceForRegistryID:", &v60);
  if (!v10)
  {
    CFProperty = 0;
    goto LABEL_41;
  }
  v11 = v10;
  v12 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v10, CFSTR("FDR Classes"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v49 = v11;
    v51 = v4;
    v52 = v5;
    v53 = v6;
    v50 = CFProperty;
    -[AppleFirmwareUpdateController setFdrClasses:](v2, "setFdrClasses:", CFProperty);
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v14 = v2;
    -[AppleFirmwareUpdateController fdrClasses](v2, "fdrClasses");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v54, v73, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v55;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v55 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          v22 = v14->_log;
          v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
          if ((isKindOfClass & 1) == 0)
          {
            if (v23)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_218BD4000, v22, OS_LOG_TYPE_INFO, "Invalid FDR class in registry entry", buf, 2u);
            }

            v24 = 0;
            v5 = v52;
            v6 = v53;
            CFProperty = v50;
            v4 = v51;
            goto LABEL_34;
          }
          if (v23)
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v62 = v20;
            _os_log_impl(&dword_218BD4000, v22, OS_LOG_TYPE_INFO, "FDR class from registry entry='%@'", buf, 0xCu);
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v54, v73, 16);
        if (v17)
          continue;
        break;
      }
    }

    v5 = v52;
    v6 = v53;
    CFProperty = v50;
    v4 = v51;
    v2 = v14;
    v11 = v49;
  }
  if (-[AppleFirmwareUpdateController shouldSkipImage4Download](v2, "shouldSkipImage4Download"))
  {
    v24 = 1;
    goto LABEL_34;
  }
  v25 = (void *)IORegistryEntryCreateCFProperty(v11, CFSTR("Image Tag"), v12, 0);
  -[AppleFirmwareUpdateController setImg4Tag:](v2, "setImg4Tag:", v25);

  -[AppleFirmwareUpdateController img4Tag](v2, "img4Tag");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
LABEL_41:
    v24 = 0;
    goto LABEL_34;
  }
  -[AppleFirmwareUpdateController img4Tag](v2, "img4Tag");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "unsignedIntValue");

  if (!(_DWORD)v28)
  {
    v45 = v2->_log;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v46 = "Zero tag value in registry entry";
      v47 = v45;
      v48 = 2;
LABEL_40:
      _os_log_impl(&dword_218BD4000, v47, OS_LOG_TYPE_INFO, v46, buf, v48);
      goto LABEL_41;
    }
    goto LABEL_41;
  }
  -[AppleFirmwareUpdateController findFWAssetFromTag:tag:size:](v2, "findFWAssetFromTag:tag:size:", v4, v28, &v59);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppleFirmwareUpdateController setFwAssetFile:](v2, "setFwAssetFile:", v29);

  -[AppleFirmwareUpdateController fwAssetFile](v2, "fwAssetFile");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = v2->_log;
  if (!v30)
  {
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v62 = v28;
      v46 = "FW asset for tag=0x%0x not found";
      v47 = v31;
      v48 = 8;
      goto LABEL_40;
    }
    goto LABEL_41;
  }
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v32 = v31;
    -[AppleFirmwareUpdateController fwAssetFile](v2, "fwAssetFile");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v62 = v28;
    *(_WORD *)&v62[4] = 2112;
    *(_QWORD *)&v62[6] = v33;
    *(_WORD *)&v62[14] = 2048;
    *(_QWORD *)&v62[16] = v59;
    _os_log_impl(&dword_218BD4000, v32, OS_LOG_TYPE_DEFAULT, "Found FW file for tag=0x%0x - %@ [size=%zu]", buf, 0x1Cu);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v59);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppleFirmwareUpdateController setFwAssetSize:](v2, "setFwAssetSize:", v34);

  -[AppleFirmwareUpdateController setFwAssetSignatureType:](v2, "setFwAssetSignatureType:", CFSTR("IMG4"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppleFirmwareUpdateController setFwAssetVersion:](v2, "setFwAssetVersion:", v35);

  v36 = v2->_log;
  v24 = 1;
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    fwAssetSize = v2->_fwAssetSize;
    img4Tag = v2->_img4Tag;
    registryEntryID = v2->_registryEntryID;
    v40 = v2->_fwAssetDirectory;
    fwAssetFile = v2->_fwAssetFile;
    fwAssetSignatureType = v2->_fwAssetSignatureType;
    fwAssetVersion = v2->_fwAssetVersion;
    *(_DWORD *)buf = 136316930;
    *(_QWORD *)v62 = "-[AppleFirmwareUpdateController createFWAssetInfoInternal]";
    *(_WORD *)&v62[8] = 2112;
    *(_QWORD *)&v62[10] = registryEntryID;
    *(_WORD *)&v62[18] = 2112;
    *(_QWORD *)&v62[20] = img4Tag;
    v63 = 2112;
    v64 = v40;
    v65 = 2112;
    v66 = fwAssetFile;
    v67 = 2112;
    v68 = fwAssetSignatureType;
    v69 = 2112;
    v70 = fwAssetVersion;
    v71 = 2112;
    v72 = fwAssetSize;
    _os_log_impl(&dword_218BD4000, v36, OS_LOG_TYPE_INFO, "%s:\n registryID=%@\n fwTag=%@ fwDirectory=%@ fwFile=%@\n fwSignType=%@\n fwVersion=%@\n fwSize=%@", buf, 0x52u);
  }
LABEL_34:

  return v24;
}

- (unsigned)getServiceForRegistryID:(int64_t *)a3
{
  const __CFDictionary *v4;
  io_service_t MatchingService;
  unsigned int v6;
  kern_return_t v7;
  CFMutableDictionaryRef v8;
  BOOL v9;
  CFMutableDictionaryRef properties;

  properties = 0;
  *a3 = 0;
  v4 = IORegistryEntryIDMatching(-[NSNumber unsignedLongLongValue](self->_registryEntryID, "unsignedLongLongValue"));
  if (v4 && (MatchingService = IOServiceGetMatchingService(*MEMORY[0x24BDD8B20], v4)) != 0)
  {
    v6 = MatchingService;
    v7 = IORegistryEntryCreateCFProperties(MatchingService, &properties, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    v8 = properties;
    if (v7)
      v9 = 1;
    else
      v9 = properties == 0;
    if (!v9 || (*a3 = 2, v8))
      CFRelease(v8);
  }
  else
  {
    v6 = 0;
    *a3 = 2;
  }
  return v6;
}

- (id)updateFirmwareWithOptions:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__AppleFirmwareUpdateController_updateFirmwareWithOptions___block_invoke;
  block[3] = &unk_24D9B23C8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(workQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __59__AppleFirmwareUpdateController_updateFirmwareWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "updateFirmwareWithOptionsInternal:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)updateFirmwareWithOptionsInternal:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  mach_port_t v14;
  uint64_t v15;
  id v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *log;
  const __CFString *v25;
  void *v26;
  NSNumber *registryEntryID;
  NSObject *v28;
  NSNumber *v29;
  NSNumber *img4Tag;
  NSNumber *fwAssetSize;
  NSString *fwAssetFile;
  NSString *fwAssetSignatureType;
  NSNumber *fwAssetVersion;
  uint64_t v36;
  uint64_t v37;
  _BYTE input[24];
  uint64_t v39;
  __int16 v40;
  NSString *v41;
  __int16 v42;
  NSString *v43;
  __int16 v44;
  NSNumber *v45;
  __int16 v46;
  NSNumber *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v37 = 0;
  if (!self->_registryEntryID)
  {
    v36 = 1;
    goto LABEL_33;
  }
  if (-[AppleFirmwareUpdateController shouldSkipImage4Download](self, "shouldSkipImage4Download"))
    goto LABEL_9;
  -[AppleFirmwareUpdateController fwAssetFile](self, "fwAssetFile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v36 = 6;
    goto LABEL_33;
  }
  -[AppleFirmwareUpdateController fwAssetVersion](self, "fwAssetVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  if (v7)
  {
    v36 = 5;
    goto LABEL_33;
  }
  -[AppleFirmwareUpdateController fwAssetSize](self, "fwAssetSize");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedLongLongValue");

  if (!v9)
  {
    v36 = 7;
    goto LABEL_33;
  }
  -[AppleFirmwareUpdateController fwAssetSignatureType](self, "fwAssetSignatureType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("IMG4")))
  {

    goto LABEL_9;
  }
  -[AppleFirmwareUpdateController fwAssetSignatureType](self, "fwAssetSignatureType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("NONE"));

  if ((v12 & 1) == 0)
  {
    v36 = 4;
LABEL_33:
    v37 = v36;
    goto LABEL_22;
  }
LABEL_9:
  if (!-[AppleFirmwareUpdateController isFWDownloadNeeded:](self, "isFWDownloadNeeded:", self->_registryEntryID))
  {
    v36 = 15;
    goto LABEL_33;
  }
  v13 = -[AppleFirmwareUpdateController getConnectionForRegistryID:](self, "getConnectionForRegistryID:", &v37);
  v14 = v13;
  v15 = v37;
  if ((_DWORD)v13 && !v37)
  {
    v37 = -[AppleFirmwareUpdateController sendFDRData:](self, "sendFDRData:", v13);
    if (!v37 && !-[AppleFirmwareUpdateController shouldSkipImage4Download](self, "shouldSkipImage4Download"))
    {
      -[AppleFirmwareUpdateController fwAssetFile](self, "fwAssetFile");
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v17 = open((const char *)objc_msgSend(v16, "UTF8String"), 0, 0);

      if (v17 == -1)
      {
        v37 = 8;
      }
      else
      {
        -[AppleFirmwareUpdateController fwAssetSize](self, "fwAssetSize");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = mmap(0, objc_msgSend(v18, "unsignedLongLongValue"), 1, 2, v17, 0);

        if (v19 == (void *)-1)
        {
          v37 = 9;
        }
        else
        {
          *(_QWORD *)input = v19;
          -[AppleFirmwareUpdateController fwAssetSize](self, "fwAssetSize");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&input[8] = objc_msgSend(v20, "unsignedLongLongValue");
          -[AppleFirmwareUpdateController fwAssetSignatureType](self, "fwAssetSignatureType");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&input[16] = objc_msgSend(v21, "isEqualToString:", CFSTR("NONE"));
          -[AppleFirmwareUpdateController fwAssetVersion](self, "fwAssetVersion");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v22, "unsignedLongLongValue");

          if (IOConnectCallScalarMethod(v14, 0, (const uint64_t *)input, 4u, 0, 0) == 1)
            v37 = 10;
          -[AppleFirmwareUpdateController fwAssetSize](self, "fwAssetSize");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          munmap(v19, objc_msgSend(v23, "unsignedLongLongValue"));

        }
        close(v17);
      }
    }
    goto LABEL_20;
  }
  if ((_DWORD)v13)
  {
LABEL_20:
    IOServiceClose(v14);
    v15 = v37;
  }
  if (!v15)
  {
    v26 = 0;
    goto LABEL_29;
  }
LABEL_22:
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    if (v37 > 16)
      v25 = CFSTR("Unknown Error");
    else
      v25 = errorString[v37];
    registryEntryID = self->_registryEntryID;
    *(_DWORD *)input = 138412802;
    *(_QWORD *)&input[4] = v25;
    *(_WORD *)&input[12] = 2048;
    *(_QWORD *)&input[14] = v37;
    *(_WORD *)&input[22] = 2112;
    v39 = (uint64_t)registryEntryID;
    _os_log_impl(&dword_218BD4000, log, OS_LOG_TYPE_INFO, "Bootstrap Error:%@ code=0x%0lx registryEntryID=%@", input, 0x20u);
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AppleFirmwareUpdate"), v37, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_29:
  v28 = self->_log;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    v29 = self->_registryEntryID;
    fwAssetSize = self->_fwAssetSize;
    img4Tag = self->_img4Tag;
    fwAssetFile = self->_fwAssetFile;
    fwAssetSignatureType = self->_fwAssetSignatureType;
    fwAssetVersion = self->_fwAssetVersion;
    *(_DWORD *)input = 136317186;
    *(_QWORD *)&input[4] = "-[AppleFirmwareUpdateController updateFirmwareWithOptionsInternal:]";
    *(_WORD *)&input[12] = 2112;
    *(_QWORD *)&input[14] = v29;
    *(_WORD *)&input[22] = 2112;
    v39 = (uint64_t)img4Tag;
    v40 = 2112;
    v41 = fwAssetFile;
    v42 = 2112;
    v43 = fwAssetSignatureType;
    v44 = 2112;
    v45 = fwAssetVersion;
    v46 = 2112;
    v47 = fwAssetSize;
    v48 = 2112;
    v49 = v4;
    v50 = 2112;
    v51 = v26;
    _os_log_impl(&dword_218BD4000, v28, OS_LOG_TYPE_INFO, "%s:\n registryID=%@\n fwTag=%@ fwFile=%@\n fwSignType=%@\n fwVersion=%@\n fwSize=%@\n options=%@ error=%@", input, 0x5Cu);
  }

  return v26;
}

- (BOOL)isFWDownloadNeeded:(id)a3
{
  io_registry_entry_t v4;
  void *CFProperty;
  char v6;
  NSObject *log;
  uint8_t v9[8];
  uint64_t v10;

  v10 = 0;
  v4 = -[AppleFirmwareUpdateController getServiceForRegistryID:](self, "getServiceForRegistryID:", &v10);
  if (!v4)
    return 1;
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v4, CFSTR("Need FUD Download"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_msgSend(CFProperty, "BOOLValue");
  }
  else
  {
    log = self->_log;
    v6 = 1;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_218BD4000, log, OS_LOG_TYPE_INFO, "download needed property not in registry entry", v9, 2u);
    }
  }

  return v6;
}

- (BOOL)shouldSkipImage4Download
{
  io_registry_entry_t v2;
  io_object_t v3;
  const __CFBoolean *CFProperty;
  const __CFBoolean *v5;
  CFTypeID v6;
  BOOL v7;
  uint64_t v9;

  v9 = 0;
  v2 = -[AppleFirmwareUpdateController getServiceForRegistryID:](self, "getServiceForRegistryID:", &v9);
  if (!v2)
    return 0;
  v3 = v2;
  CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v2, CFSTR("skip-image-loading"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v5 = CFProperty;
    v6 = CFGetTypeID(CFProperty);
    v7 = v6 == CFBooleanGetTypeID() && CFBooleanGetValue(v5) != 0;
    CFRelease(v5);
  }
  else
  {
    v7 = 0;
  }
  IOObjectRelease(v3);
  return v7;
}

- (unsigned)getConnectionForRegistryID:(int64_t *)a3
{
  unsigned int result;
  io_object_t v5;
  BOOL v6;
  io_connect_t connect;

  connect = 0;
  *a3 = 0;
  result = -[AppleFirmwareUpdateController getServiceForRegistryID:](self, "getServiceForRegistryID:");
  if (result)
  {
    v5 = result;
    if (IOServiceOpen(result, *MEMORY[0x24BDAEC58], 0, &connect))
      v6 = 1;
    else
      v6 = connect == 0;
    if (v6)
      *a3 = 3;
    IOObjectRelease(v5);
    return connect;
  }
  return result;
}

- (id)findFWAssetFromTag:(id)a3 tag:(unsigned int)a4 size:(unint64_t *)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  int v23;
  NSObject *v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  NSObject *log;
  unint64_t *v32;
  void *v33;
  void *v34;
  id obj;
  void *v37;
  id v38;
  int v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  uint8_t v49[16];
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
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  v37 = v7;
  objc_msgSend(v8, "contentsOfDirectoryAtPath:error:", v7, &v44);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v44;
  if (!v9)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v49 = 0;
      _os_log_impl(&dword_218BD4000, log, OS_LOG_TYPE_INFO, "No asset files found", v49, 2u);
    }
    goto LABEL_22;
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v9;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v78, 16);
  if (!v11)
    goto LABEL_21;
  v12 = v11;
  v32 = a5;
  v33 = v9;
  v34 = v8;
  v13 = 0;
  v14 = 0;
  v15 = *(_QWORD *)v41;
  while (2)
  {
    for (i = 0; i != v12; ++i)
    {
      v17 = v10;
      v18 = v14;
      v19 = v13;
      if (*(_QWORD *)v41 != v15)
        objc_enumerationMutation(obj);
      v20 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
      v21 = (void *)MEMORY[0x219A2072C]();
      v77 = 0;
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      *(_OWORD *)v49 = 0u;
      v50 = 0u;
      v39 = 0;
      objc_msgSend(v37, "stringByAppendingPathComponent:", v20);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = v17;
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", v14, 1, &v38);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v38;

      if (v13)
      {
        v22 = objc_retainAutorelease(v13);
        Img4DecodeInit(objc_msgSend(v22, "bytes"), objc_msgSend(v22, "length"), (uint64_t)v49);
        if (v23)
        {
          v24 = self->_log;
          if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            goto LABEL_18;
          *(_DWORD *)buf = 138412290;
          v46 = v14;
          v25 = v24;
          v26 = "IMG4 decode init failed - %@";
LABEL_16:
          _os_log_impl(&dword_218BD4000, v25, OS_LOG_TYPE_INFO, v26, buf, 0xCu);
          goto LABEL_18;
        }
        if (Img4DecodeGetPayloadType((uint64_t)v49, &v39))
        {
          v28 = self->_log;
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            goto LABEL_18;
          *(_DWORD *)buf = 138412290;
          v46 = v14;
          v25 = v28;
          v26 = "IMG4 get tag failed - %@";
          goto LABEL_16;
        }
        if (v39 == a4)
        {
          if (v32)
            *v32 = objc_msgSend(v22, "length");
          v29 = (void *)objc_msgSend(v14, "copy");
          objc_autoreleasePoolPop(v21);

          v9 = v33;
          v8 = v34;
          goto LABEL_26;
        }
      }
      else
      {
        v27 = self->_log;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v46 = v14;
          v47 = 2114;
          v48 = v10;
          _os_log_error_impl(&dword_218BD4000, v27, OS_LOG_TYPE_ERROR, "Failed to read %{public}@ with error %{public}@ ", buf, 0x16u);
        }
      }
LABEL_18:
      objc_autoreleasePoolPop(v21);
    }
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v78, 16);
    if (v12)
      continue;
    break;
  }

  v9 = v33;
  v8 = v34;
LABEL_21:

LABEL_22:
  v29 = 0;
LABEL_26:

  return v29;
}

- (int64_t)sendFDRData:(unsigned int)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  kern_return_t v17;
  NSObject *log;
  NSObject *v19;
  int v20;
  int64_t v21;
  kern_return_t v22;
  NSObject *v23;
  __int128 v25;
  AppleFirmwareUpdateController *v26;
  uint64_t v28;
  id obj;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[4];
  void *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  kern_return_t v40;
  _BYTE buf[24];
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  MEMORY[0x219A20480](fdrLogHandler, a2);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[AppleFirmwareUpdateController fdrClasses](self, "fdrClasses");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v32;
    v25 = 0x8400302uLL;
    v26 = self;
    while (2)
    {
      v7 = 0;
      v28 = v5;
      do
      {
        if (*(_QWORD *)v32 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v7);
        v30 = 0;
        -[AppleFirmwareUpdateController extractFDRDataWithClassKey:error:](self, "extractFDRDataWithClassKey:error:", v8, &v30, v25);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v30;
        v11 = v10;
        if (v9)
          v12 = v10 == 0;
        else
          v12 = 0;
        if (v12)
        {
          objc_msgSend(v8, "dataUsingEncoding:", 4);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", objc_msgSend(v9, "length") + objc_msgSend(v8, "length"));
          objc_msgSend(v15, "appendData:", v14);
          objc_msgSend(v15, "appendData:", v9);
          v16 = objc_retainAutorelease(v15);
          *(_QWORD *)buf = objc_msgSend(v16, "bytes");
          *(_QWORD *)&buf[8] = objc_msgSend(v16, "length");
          *(_QWORD *)&buf[16] = objc_msgSend(v14, "length");
          v42 = xmmword_218BDE8A0;
          v17 = IOConnectCallScalarMethod(a3, 1u, (const uint64_t *)buf, 5u, 0, 0);
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
          {
            v19 = log;
            v20 = objc_msgSend(v9, "length");
            *(_DWORD *)v35 = v25;
            v36 = v8;
            v37 = 1024;
            v38 = v20;
            v39 = 1024;
            v40 = v17;
            _os_log_impl(&dword_218BD4000, v19, OS_LOG_TYPE_INFO, "LoadFDR class='%@' with %u bytes ret=%d", v35, 0x18u);

          }
          v5 = v28;
          self = v26;
          if (v17 == 1)
          {

            v21 = 16;
            goto LABEL_18;
          }
        }
        else
        {
          v13 = self->_log;
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v8;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v11;
            _os_log_impl(&dword_218BD4000, v13, OS_LOG_TYPE_INFO, "Cannot find FDR data for class '%@': %@", buf, 0x16u);
          }
        }

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
      if (v5)
        continue;
      break;
    }
  }
  v21 = 0;
LABEL_18:

  v22 = IOConnectCallScalarMethod(a3, 2u, 0, 0, 0, 0);
  v23 = self->_log;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v22;
    _os_log_impl(&dword_218BD4000, v23, OS_LOG_TYPE_INFO, "LoadFDRDataComplete ret=%d", buf, 8u);
  }
  return v21;
}

- (id)extractFDRDataWithClassKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const __CFDictionary *v10;
  void *v11;
  void *Value;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v6)
  {
    v14 = CFSTR("CopyAllowUnsealed");
    v15[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "containsString:", CFSTR("/")))
    {
      objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("/"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count") == 2)
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", 0);

        v9 = AMFDRSealingMapCopyLocalDictForClass();
        if (v9)
        {
          v10 = (const __CFDictionary *)v9;
          objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          Value = (void *)CFDictionaryGetValue(v10, v11);
          if (!a4)
            goto LABEL_15;
          goto LABEL_9;
        }
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
          -[AppleFirmwareUpdateController extractFDRDataWithClassKey:error:].cold.1();
      }
      else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      {
        -[AppleFirmwareUpdateController extractFDRDataWithClassKey:error:].cold.2();
      }

      Value = 0;
      goto LABEL_15;
    }
    Value = (void *)AMFDRSealingMapCopyLocalDataForClass();
    if (!a4)
    {
LABEL_15:

      goto LABEL_16;
    }
LABEL_9:
    *a4 = 0;
    goto LABEL_15;
  }
  Value = 0;
LABEL_16:

  return Value;
}

- (NSString)fwAssetFile
{
  return self->_fwAssetFile;
}

- (void)setFwAssetFile:(id)a3
{
  objc_storeStrong((id *)&self->_fwAssetFile, a3);
}

- (NSString)fwAssetSignatureType
{
  return self->_fwAssetSignatureType;
}

- (void)setFwAssetSignatureType:(id)a3
{
  objc_storeStrong((id *)&self->_fwAssetSignatureType, a3);
}

- (NSNumber)fwAssetVersion
{
  return self->_fwAssetVersion;
}

- (void)setFwAssetVersion:(id)a3
{
  objc_storeStrong((id *)&self->_fwAssetVersion, a3);
}

- (NSNumber)fwAssetSize
{
  return self->_fwAssetSize;
}

- (void)setFwAssetSize:(id)a3
{
  objc_storeStrong((id *)&self->_fwAssetSize, a3);
}

- (NSNumber)img4Tag
{
  return self->_img4Tag;
}

- (void)setImg4Tag:(id)a3
{
  objc_storeStrong((id *)&self->_img4Tag, a3);
}

- (NSArray)fdrClasses
{
  return self->_fdrClasses;
}

- (void)setFdrClasses:(id)a3
{
  objc_storeStrong((id *)&self->_fdrClasses, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fdrClasses, 0);
  objc_storeStrong((id *)&self->_img4Tag, 0);
  objc_storeStrong((id *)&self->_fwAssetSize, 0);
  objc_storeStrong((id *)&self->_fwAssetVersion, 0);
  objc_storeStrong((id *)&self->_fwAssetSignatureType, 0);
  objc_storeStrong((id *)&self->_fwAssetFile, 0);
  objc_storeStrong((id *)&self->_fwAssetDirectory, 0);
  objc_storeStrong((id *)&self->_registryEntryID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pendingCriticalEarlyBootEntriesInternal, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)extractFDRDataWithClassKey:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_218BD4000, v0, v1, "%s: localDict is NULL for key (%@).", v2, v3, v4, v5, 2u);
}

- (void)extractFDRDataWithClassKey:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_218BD4000, v0, v1, "%s: key (%@) is not valid.", v2, v3, v4, v5, 2u);
}

@end
