@implementation BKIOHIDService

- (NSString)displayUUID
{
  return self->_displayUUID;
}

- (id)senderDescriptorForEventType:(unsigned int)a3
{
  uint64_t v3;

  v3 = 80;
  if (a3 == 3)
    v3 = 56;
  return *(id *)((char *)&self->super.isa + v3);
}

- (unsigned)primaryUsage
{
  return self->_primaryUsage;
}

- (unsigned)primaryUsagePage
{
  return self->_primaryUsagePage;
}

- (NSString)description
{
  return (NSString *)-[BKIOHIDService descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (BKSHIDEventSenderDescriptor)senderDescriptor
{
  return self->_senderDescriptor;
}

- (BOOL)isBuiltIn
{
  return self->_builtIn;
}

void __33__BKIOHIDService_propertyForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  IOHIDServiceGetProperty();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (int)eventSource
{
  return self->_eventSource;
}

uint64_t __46__BKIOHIDService__workQueue_serviceWasRemoved__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "serviceDidDisappear:", *(_QWORD *)(a1 + 40));
}

- (unint64_t)senderID
{
  return self->_senderID;
}

- (void)_serviceWasRemoved
{
  NSObject *v3;
  _QWORD block[5];

  -[BKIOHIDService setServiceStatus:](self, "setServiceStatus:", 2);
  -[BKIOHIDService _workQueue]((uint64_t)self);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__BKIOHIDService__serviceWasRemoved__block_invoke;
  block[3] = &unk_1E81F7460;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)setServiceStatus:(int64_t)a3
{
  self->_serviceStatus = a3;
}

- (void)addDisappearanceObserver:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[BKIOHIDService _workQueue]((uint64_t)self);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__BKIOHIDService_addDisappearanceObserver_queue___block_invoke;
  block[3] = &unk_1E81F7BE8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[BKIOHIDService _workQueue]((uint64_t)self);
  v8 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __37__BKIOHIDService_setProperty_forKey___block_invoke;
  v12[3] = &unk_1E81F72C0;
  v12[4] = self;
  v13 = v7;
  v14 = v6;
  v15 = &v16;
  v9 = v6;
  v10 = v7;
  dispatch_sync(v8, v12);

  LOBYTE(v7) = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return (char)v7;
}

- (BOOL)setProperties:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[BKIOHIDService _workQueue]((uint64_t)self);
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __32__BKIOHIDService_setProperties___block_invoke;
  v8[3] = &unk_1E81F7CF8;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  dispatch_sync(v5, v8);

  return 0;
}

uint64_t __32__BKIOHIDService_setProperties___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(v2 + 96);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__BKIOHIDService_setProperties___block_invoke_2;
  v5[3] = &__block_descriptor_40_e25_v32__0__NSString_8_16_B24l;
  v5[4] = v3;
  return objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v5);
}

- (void)asyncSetProperty:(id)a3 forKey:(id)a4 andDelayForSeconds:(double)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16[2];
  id location;

  v8 = a3;
  v9 = a4;
  objc_initWeak(&location, self);
  -[BKIOHIDService _workQueue]((uint64_t)self);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__BKIOHIDService_asyncSetProperty_forKey_andDelayForSeconds___block_invoke;
  block[3] = &unk_1E81F7308;
  objc_copyWeak(v16, &location);
  v14 = v9;
  v15 = v8;
  v16[1] = *(id *)&a5;
  v11 = v8;
  v12 = v9;
  dispatch_async(v10, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

- (BKIOHIDService)initWithHIDServiceRef:(__IOHIDService *)a3
{
  BKIOHIDService *v5;
  void *v6;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  BKIOHIDService *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("hidService"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v15 = v10;
      v16 = 2114;
      v17 = v12;
      v18 = 2048;
      v19 = self;
      v20 = 2114;
      v21 = CFSTR("BKIOHIDService.m");
      v22 = 1024;
      v23 = 242;
      v24 = 2114;
      v25 = v9;
      _os_log_error_impl(&dword_1C8914000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1C891B5D8);
  }
  v13.receiver = self;
  v13.super_class = (Class)BKIOHIDService;
  v5 = -[BKIOHIDService init](&v13, sel_init);
  if (v5)
  {
    CFRetain(a3);
    v5->_IOHIDService = a3;
    IOHIDServiceGetRegistryID();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_senderID = objc_msgSend(v6, "unsignedLongLongValue");
    -[BKIOHIDService _setUpInitialProperties](v5, "_setUpInitialProperties");

  }
  return v5;
}

void __49__BKIOHIDService_addDisappearanceObserver_queue___block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  id v7;
  _BKIOHIDServiceDisappearanceObserverInfo *v8;
  id *p_isa;
  _QWORD v10[4];
  id v11;
  id *v12;

  v1 = *(id **)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(id *)(a1 + 40);
  v4 = v2;
  if (v1)
  {
    -[BKIOHIDService _workQueue]((uint64_t)v1);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v5);

    if (objc_msgSend(v1, "serviceStatus") == 2)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __60__BKIOHIDService__workQueue_addDisappearanceObserver_queue___block_invoke;
      v10[3] = &unk_1E81F7CF8;
      v11 = v3;
      v12 = v1;
      dispatch_async(v4, v10);

    }
    else
    {
      if (!v1[6])
      {
        v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v7 = v1[6];
        v1[6] = v6;

      }
      v8 = objc_alloc_init(_BKIOHIDServiceDisappearanceObserverInfo);
      p_isa = (id *)&v8->super.isa;
      if (v8)
      {
        objc_storeWeak((id *)&v8->_observer, v3);
        objc_storeWeak(p_isa + 2, v4);
      }
      objc_msgSend(v1[6], "addObject:", p_isa);
      objc_msgSend(v1, "_workQueue_startIOServiceRemovalNotifications");

    }
  }

}

- (int64_t)serviceStatus
{
  return self->_serviceStatus;
}

- (void)_workQueue_startIOServiceRemovalNotifications
{
  NSObject *v3;

  -[BKIOHIDService _workQueue]((uint64_t)self);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!self->_workQueue_removalNotification)
  {
    objc_storeStrong((id *)&self->_strongSelf, self);
    self->_workQueue_removalNotification = (__IOHIDNotification *)IOHIDServiceCreateRemovalNotification();
    self->_workQueue_willTerminateNotification = (__IOHIDNotification *)IOHIDServiceCreateRequestTerminationNotification();
  }
}

- (void)_setUpInitialProperties
{
  void *v3;
  NSString *v4;
  NSString *displayUUID;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  unsigned int v13;
  int v14;
  BKIOHIDService *v15;
  void *v16;
  int v17;
  id v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t primaryUsagePage;
  NSObject *v27;
  void *v28;
  BKSHIDEventSenderDescriptor *senderDescriptorForKeyboardEvents;
  BKSHIDEventSenderDescriptor *v30;
  unsigned int primaryUsage;
  void *v32;
  int v33;
  _DWORD v34[2];
  __int16 v35;
  BKIOHIDService *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[BKIOHIDService propertyForKey:](self, "propertyForKey:", CFSTR("displayUUID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (NSString *)objc_msgSend(v3, "copy");
  displayUUID = self->_displayUUID;
  self->_displayUUID = v4;

  -[BKIOHIDService propertyForKey:](self, "propertyForKey:", CFSTR("PrimaryUsagePage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_primaryUsagePage = objc_msgSend(v6, "intValue");

  -[BKIOHIDService propertyForKey:](self, "propertyForKey:", CFSTR("PrimaryUsage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_primaryUsage = objc_msgSend(v7, "intValue");

  -[BKIOHIDService propertyForKey:](self, "propertyForKey:", CFSTR("Authenticated"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v8, "BOOLValue"))
        self->_authenticated = 1;
    }
  }
  -[BKIOHIDService propertyForKey:](self, "propertyForKey:", CFSTR("Built-In"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v9, "BOOLValue"))
        self->_builtIn = 1;
    }
  }
  -[BKIOHIDService propertyForKey:](self, "propertyForKey:", CFSTR("IAPHIDAccessoryCategory"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[BKIOHIDService propertyForKey:](self, "propertyForKey:", CFSTR("DeviceTypeHint"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("Mouse")) & 1) != 0)
    {
      v12 = 11;
    }
    else
    {
      if (!objc_msgSend(v11, "isEqualToString:", CFSTR("Trackpad")))
      {

        v13 = objc_msgSend(v10, "intValue");
        if (v13 > 6)
          v14 = 5;
        else
          v14 = dword_1C8937048[v13];
        self->_eventSource = v14;
        goto LABEL_24;
      }
      v12 = 12;
    }
    self->_eventSource = v12;

LABEL_24:
    self->_authenticated = 1;
    goto LABEL_25;
  }
  if (self->_builtIn)
  {
    self->_eventSource = 0;
    goto LABEL_24;
  }
  v15 = self;
  if (!-[BKIOHIDService claimsToConformToUsagePage:usage:](v15, "claimsToConformToUsagePage:usage:", 1, 2))
  {

    if (v15->_authenticated)
    {
      if (-[BKIOHIDService claimsToConformToUsagePage:usage:](v15, "claimsToConformToUsagePage:usage:", 1, 5))
      {
        v21 = 4;
LABEL_83:
        v15->_eventSource = v21;
        goto LABEL_25;
      }
      if (v15->_authenticated)
      {
        if (-[BKIOHIDService claimsToConformToUsagePage:usage:](v15, "claimsToConformToUsagePage:usage:", 1, 6))
        {
          v21 = 3;
          goto LABEL_83;
        }
        if (v15->_authenticated)
        {
          v21 = 5;
          goto LABEL_83;
        }
      }
    }
    -[BKIOHIDService propertyForKey:](v15, "propertyForKey:", CFSTR("AppleBluetoothRemote"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v33 = objc_msgSend(v32, "BOOLValue");

      if (v33)
      {
        v21 = 8;
        goto LABEL_83;
      }
    }
    else
    {

    }
    if (-[BKIOHIDService claimsToConformToUsagePage:usage:](v15, "claimsToConformToUsagePage:usage:", 1, 5))
    {
      v21 = 9;
    }
    else if (-[BKIOHIDService claimsToConformToUsagePage:usage:](v15, "claimsToConformToUsagePage:usage:", 1, 15))
    {
      v21 = 10;
    }
    else if (-[BKIOHIDService claimsToConformToUsagePage:usage:](v15, "claimsToConformToUsagePage:usage:", 11, 5))
    {
      v21 = 7;
    }
    else if (-[BKIOHIDService _isProbablyHeadset](v15))
    {
      v21 = 6;
    }
    else
    {
      if (-[BKIOHIDService claimsToConformToUsagePage:usage:](v15, "claimsToConformToUsagePage:usage:", 1, 6))
      {
        v15->_eventSource = 1;
        goto LABEL_25;
      }
      v21 = 2;
    }
    goto LABEL_83;
  }
  -[BKIOHIDService propertyForKey:](v15, "propertyForKey:", CFSTR("DeviceTypeHint"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v16, "isEqualToString:", CFSTR("Mouse")) & 1) != 0)
  {
    v17 = 11;
  }
  else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("Trackpad")) & 1) != 0)
  {
    v17 = 12;
  }
  else
  {
    v17 = 11;
    if (self->_primaryUsagePage == 13)
    {
      if (self->_primaryUsage == 12)
        v17 = 12;
      else
        v17 = 11;
    }
  }
  v15->_eventSource = v17;

LABEL_25:
  v18 = objc_alloc_init(MEMORY[0x1E0D00DB0]);
  objc_msgSend(v18, "setAuthenticated:", self->_authenticated);
  switch(self->_eventSource)
  {
    case 0:
      v19 = 0;
      v20 = 1;
      break;
    case 1:
    case 3:
      v19 = 0;
      v20 = 3;
      break;
    case 2:
    case 5:
      v19 = 0;
      v20 = 2;
      break;
    case 4:
    case 9:
      v19 = 0;
      v20 = 4;
      break;
    case 6:
    case 7:
      v19 = 0;
      v20 = 5;
      break;
    case 8:
      v19 = 0;
      v20 = 6;
      break;
    case 0xA:
      v19 = 0;
      v20 = 7;
      break;
    case 0xB:
      v19 = 0;
      v20 = 8;
      break;
    case 0xC:
      v19 = 1;
      v20 = 9;
      break;
    case 0xD:
      v19 = 0;
      v20 = 10;
      break;
    default:
      v19 = 0;
      v20 = 0;
      break;
  }
  if (self->_displayUUID)
  {
    objc_msgSend(MEMORY[0x1E0D00CF8], "displayWithHardwareIdentifier:");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BKIOHIDService propertyOfClass:forKey:](self, "propertyOfClass:forKey:", objc_opt_class(), CFSTR("DisplayIntegrated"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "BOOLValue");

    if (!v24)
      goto LABEL_45;
    objc_msgSend(MEMORY[0x1E0D00CF8], "builtinDisplay");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v22;
  objc_msgSend(v18, "setAssociatedDisplay:", v22);

LABEL_45:
  objc_msgSend(v18, "setSenderID:", self->_senderID);
  objc_msgSend(v18, "setHardwareType:", v20);
  objc_msgSend(v18, "setAuthenticated:", self->_authenticated);
  primaryUsagePage = self->_primaryUsagePage;
  if ((_DWORD)primaryUsagePage)
  {
    objc_msgSend(v18, "setPrimaryPage:primaryUsage:", primaryUsagePage, self->_primaryUsage);
  }
  else
  {
    BKLogHID();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      primaryUsage = self->_primaryUsage;
      v34[0] = 67109378;
      v34[1] = primaryUsage;
      v35 = 2114;
      v36 = self;
      _os_log_error_impl(&dword_1C8914000, v27, OS_LOG_TYPE_ERROR, "strangeness: primary page is zero; primary usage is:%X %{public}@",
        (uint8_t *)v34,
        0x12u);
    }

  }
  objc_storeStrong((id *)&self->_senderDescriptor, v18);
  if (v19 && -[BKIOHIDService claimsToConformToUsagePage:usage:](self, "claimsToConformToUsagePage:usage:", 1, 6))
  {
    v28 = (void *)objc_msgSend(v18, "mutableCopy");
    objc_msgSend(v28, "setHardwareType:", 3);
    senderDescriptorForKeyboardEvents = self->_senderDescriptorForKeyboardEvents;
    self->_senderDescriptorForKeyboardEvents = (BKSHIDEventSenderDescriptor *)v28;
  }
  else
  {
    v30 = (BKSHIDEventSenderDescriptor *)v18;
    senderDescriptorForKeyboardEvents = self->_senderDescriptorForKeyboardEvents;
    self->_senderDescriptorForKeyboardEvents = v30;
  }

}

- (id)propertyForKey:(id)a3
{
  id v4;
  NSObject *v5;
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
  -[BKIOHIDService _workQueue]((uint64_t)self);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__BKIOHIDService_propertyForKey___block_invoke;
  block[3] = &unk_1E81F7298;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)_workQueue
{
  os_unfair_lock_s *v2;
  id *v3;
  id Serial;
  void *v5;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    v3 = (id *)(a1 + 24);
    Serial = *(id *)(a1 + 24);
    if (!Serial)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p.workQueue"), objc_opt_class(), a1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      Serial = (id)BSDispatchQueueCreateSerial();

      objc_storeStrong(v3, Serial);
    }
    os_unfair_lock_unlock(v2);
  }
  else
  {
    Serial = 0;
  }
  return Serial;
}

- (id)propertyOfClass:(Class)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v10;
  int v11;
  id v12;
  __int16 v13;
  Class v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[BKIOHIDService propertyForKey:](self, "propertyForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    BKLogHID();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = 138543874;
      v12 = v6;
      v13 = 2114;
      v14 = a3;
      v15 = 2114;
      v16 = (id)objc_opt_class();
      v10 = v16;
      _os_log_error_impl(&dword_1C8914000, v8, OS_LOG_TYPE_ERROR, "expected %{public}@ to be of class kind %{public}@, got %{public}@ instead", (uint8_t *)&v11, 0x20u);

    }
    v7 = 0;
  }

  return v7;
}

uint64_t __36__BKIOHIDService__serviceWasRemoved__block_invoke(uint64_t result)
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id WeakRetained;
  BOOL v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 32);
  if (v1)
  {
    objc_msgSend(*(id *)(result + 32), "_workQueue_stopIOServiceRemovalNotifications");
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v2 = *(id *)(v1 + 48);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v16;
      v6 = MEMORY[0x1E0C809B0];
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v16 != v5)
            objc_enumerationMutation(v2);
          v8 = *(NSObject **)(*((_QWORD *)&v15 + 1) + 8 * v7);
          if (v8)
          {
            WeakRetained = objc_loadWeakRetained((id *)&v8[1].isa);
            v8 = objc_loadWeakRetained((id *)&v8[2].isa);
            if (v8)
              v10 = WeakRetained == 0;
            else
              v10 = 1;
            if (!v10)
            {
              v12[0] = v6;
              v12[1] = 3221225472;
              v12[2] = __46__BKIOHIDService__workQueue_serviceWasRemoved__block_invoke;
              v12[3] = &unk_1E81F7CF8;
              WeakRetained = WeakRetained;
              v13 = WeakRetained;
              v14 = v1;
              dispatch_async(v8, v12);

            }
          }
          else
          {
            WeakRetained = 0;
          }

          ++v7;
        }
        while (v4 != v7);
        v11 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v4 = v11;
      }
      while (v11);
    }

    return objc_msgSend(*(id *)(v1 + 48), "removeAllObjects");
  }
  return result;
}

- (void)_workQueue_stopIOServiceRemovalNotifications
{
  NSObject *v3;
  __IOHIDNotification *workQueue_removalNotification;
  __IOHIDNotification *workQueue_willTerminateNotification;
  BKIOHIDService *strongSelf;

  -[BKIOHIDService _workQueue]((uint64_t)self);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  workQueue_removalNotification = self->_workQueue_removalNotification;
  if (workQueue_removalNotification)
  {
    CFRelease(workQueue_removalNotification);
    self->_workQueue_removalNotification = 0;
    workQueue_willTerminateNotification = self->_workQueue_willTerminateNotification;
    if (!workQueue_willTerminateNotification)
      goto LABEL_6;
  }
  else
  {
    workQueue_willTerminateNotification = self->_workQueue_willTerminateNotification;
    if (!workQueue_willTerminateNotification)
      return;
  }
  CFRelease(workQueue_willTerminateNotification);
  self->_workQueue_willTerminateNotification = 0;
LABEL_6:
  strongSelf = self->_strongSelf;
  self->_strongSelf = 0;

}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BKIOHIDService descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  unint64_t serviceStatus;
  __CFString *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;

  -[BKIOHIDService succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  serviceStatus = self->_serviceStatus;
  if (serviceStatus >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<bogus:%d>"), self->_serviceStatus);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = off_1E81F7378[serviceStatus];
  }
  v7 = (id)objc_msgSend(v4, "appendObject:withName:", v6, CFSTR("serviceStatus"));

  v8 = (id)objc_msgSend(v4, "appendObject:withName:", self->_IOHIDService, CFSTR("IOHIDService"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%llX"), self->_senderID);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v4, "appendObject:withName:", v9, CFSTR("senderID"));

  v11 = (id)objc_msgSend(v4, "appendObject:withName:", self->_displayUUID, CFSTR("displayUUID"));
  NSStringFromBKSHIDEventSource();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v4, "appendObject:withName:", v12, CFSTR("eventSource"));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%X"), self->_primaryUsagePage);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v4, "appendObject:withName:", v14, CFSTR("primaryUsagePage"));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%X"), self->_primaryUsage);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v4, "appendObject:withName:", v16, CFSTR("primaryUsage"));

  v18 = (id)objc_msgSend(v4, "appendBool:withName:", self->_authenticated, CFSTR("authenticated"));
  v19 = (id)objc_msgSend(v4, "appendBool:withName:", self->_builtIn, CFSTR("builtIn"));
  return v4;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (void)asyncSetProperty:(id)a3 forKey:(id)a4
{
  -[BKIOHIDService asyncSetProperty:forKey:andDelayForSeconds:](self, "asyncSetProperty:forKey:andDelayForSeconds:", a3, a4, 0.0);
}

uint64_t __32__BKIOHIDService_setProperties___block_invoke_2()
{
  return IOHIDServiceSetProperty();
}

- (void)dealloc
{
  __IOHIDService *IOHIDService;
  __IOHIDNotification *workQueue_removalNotification;
  __IOHIDNotification *workQueue_willTerminateNotification;
  objc_super v6;

  IOHIDService = self->_IOHIDService;
  if (IOHIDService)
    CFRelease(IOHIDService);
  workQueue_removalNotification = self->_workQueue_removalNotification;
  if (workQueue_removalNotification)
    CFRelease(workQueue_removalNotification);
  workQueue_willTerminateNotification = self->_workQueue_willTerminateNotification;
  if (workQueue_willTerminateNotification)
    CFRelease(workQueue_willTerminateNotification);
  v6.receiver = self;
  v6.super_class = (Class)BKIOHIDService;
  -[BKIOHIDService dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayUUID, 0);
  objc_storeStrong((id *)&self->_senderDescriptor, 0);
  objc_storeStrong((id *)&self->_senderDescriptorForKeyboardEvents, 0);
  objc_storeStrong((id *)&self->_workQueue_disappearanceObservers, 0);
  objc_storeStrong((id *)&self->_workQueue_do_not_touch_directly, 0);
  objc_storeStrong((id *)&self->_strongSelf, 0);
}

uint64_t __37__BKIOHIDService_setProperty_forKey___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = IOHIDServiceSetProperty();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (_DWORD)result != 0;
  return result;
}

void __61__BKIOHIDService_asyncSetProperty_forKey_andDelayForSeconds___block_invoke(uint64_t a1)
{
  id WeakRetained;
  double v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    IOHIDServiceSetProperty();
    WeakRetained = v4;
    v3 = *(double *)(a1 + 56);
    if (v3 > 0.0)
    {
      usleep((v3 * 1000000.0));
      WeakRetained = v4;
    }
  }

}

- (id)_initForTestingWithSenderID:(unint64_t)a3 setUpInitialProperties:(BOOL)a4
{
  _BOOL4 v4;
  BKIOHIDService *v6;
  BKIOHIDService *v7;
  objc_super v9;

  v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)BKIOHIDService;
  v6 = -[BKIOHIDService init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_senderID = a3;
    if (v4)
      -[BKIOHIDService _setUpInitialProperties](v6, "_setUpInitialProperties");
  }
  return v7;
}

- (id)initForSimulatorWithDisplayUUID:(id)a3
{
  id v4;
  BKIOHIDService *v5;
  BKIOHIDService *v6;
  void *v7;
  uint64_t v8;
  NSString *displayUUID;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKIOHIDService;
  v5 = -[BKIOHIDService init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v5->_IOHIDService)
    {
      IOHIDServiceGetRegistryID();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_senderID = objc_msgSend(v7, "unsignedLongLongValue");

    }
    v8 = objc_msgSend(v4, "copy");
    displayUUID = v6->_displayUUID;
    v6->_displayUUID = (NSString *)v8;

  }
  return v6;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BKIOHIDService succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)claimsToConformToUsagePage:(unsigned __int16)a3 usage:(unsigned __int16)a4
{
  int v4;
  int v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  unsigned __int16 v26;
  unsigned __int16 v27;
  int v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v4 = a4;
  v5 = a3;
  v36 = *MEMORY[0x1E0C80C00];
  if (self->_primaryUsagePage == a3 && self->_primaryUsage == a4)
    return 1;
  -[BKIOHIDService propertyForKey:](self, "propertyForKey:", CFSTR("DeviceUsagePairs"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v7)
  {
    v8 = v7;
    v29 = v4;
    v9 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v12 = objc_opt_class();
        v13 = v11;
        if (v12)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v14 = v13;
          else
            v14 = 0;
        }
        else
        {
          v14 = 0;
        }
        v15 = v14;

        if (v15)
        {
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("DeviceUsagePage"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_opt_class();
          v18 = v16;
          if (v17)
            v19 = (objc_opt_isKindOfClass() & 1) != 0 ? v18 : 0;
          else
            v19 = 0;
          v20 = v19;

          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("DeviceUsage"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_opt_class();
          v23 = v21;
          if (v22)
            v24 = (objc_opt_isKindOfClass() & 1) != 0 ? v23 : 0;
          else
            v24 = 0;
          v25 = v24;

          v26 = objc_msgSend(v20, "intValue");
          v27 = objc_msgSend(v25, "intValue");

          if (v5 == v26 && v27 == v29)
          {

            v6 = 1;
            goto LABEL_31;
          }
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v8)
        continue;
      break;
    }
  }
  v6 = 0;
LABEL_31:

  return v6;
}

- (BOOL)isVirtualService
{
  void *v2;
  char v3;

  -[BKIOHIDService propertyOfClass:forKey:](self, "propertyOfClass:forKey:", objc_opt_class(), CFSTR("HIDVirtualDevice"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)asyncSetProperties:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[BKIOHIDService _workQueue]((uint64_t)self);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__BKIOHIDService_asyncSetProperties___block_invoke;
  block[3] = &unk_1E81F7330;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)setElementValue:(unsigned int)a3 forUsagePage:(unsigned int)a4 usage:(unsigned int)a5
{
  NSObject *v9;
  _QWORD block[5];
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;

  -[BKIOHIDService _workQueue]((uint64_t)self);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__BKIOHIDService_setElementValue_forUsagePage_usage___block_invoke;
  block[3] = &unk_1E81F7358;
  block[4] = self;
  v11 = a4;
  v12 = a5;
  v13 = a3;
  dispatch_async(v9, block);

}

- (void)removeDisappearanceObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[BKIOHIDService _workQueue]((uint64_t)self);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__BKIOHIDService_removeDisappearanceObserver___block_invoke;
  block[3] = &unk_1E81F7CF8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (NSString)uniqueProductIdentifier
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v20;

  -[BKIOHIDService propertyForKey:](self, "propertyForKey:", CFSTR("VendorID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  -[BKIOHIDService propertyForKey:](self, "propertyForKey:", CFSTR("ProductID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  v10 = v8;
  if (v9)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  -[BKIOHIDService propertyForKey:](self, "propertyForKey:", CFSTR("HIDVirtualDevice"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  v15 = v13;
  if (v14)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
  }
  else
  {
    v16 = 0;
  }
  v17 = v16;

  if (objc_msgSend(v17, "BOOLValue"))
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-v%@"), v7, v12, v17);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v7, v12, v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v18;
}

- (id)_disappearanceObservers
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  -[BKIOHIDService _workQueue]((uint64_t)self);
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__BKIOHIDService__disappearanceObservers__block_invoke;
  v6[3] = &unk_1E81F73E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)setSenderDescriptor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (__IOHIDService)IOHIDService
{
  return self->_IOHIDService;
}

- (void)setIOHIDService:(__IOHIDService *)a3
{
  self->_IOHIDService = a3;
}

- (void)setDisplayUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setEventSource:(int)a3
{
  self->_eventSource = a3;
}

- (void)setSenderID:(unint64_t)a3
{
  self->_senderID = a3;
}

- (void)setPrimaryUsagePage:(unsigned int)a3
{
  self->_primaryUsagePage = a3;
}

- (void)setPrimaryUsage:(unsigned int)a3
{
  self->_primaryUsage = a3;
}

- (BOOL)isAuthenticated
{
  return self->_authenticated;
}

- (void)setAuthenticated:(BOOL)a3
{
  self->_authenticated = a3;
}

- (void)setBuiltIn:(BOOL)a3
{
  self->_builtIn = a3;
}

void __41__BKIOHIDService__disappearanceObservers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __46__BKIOHIDService_removeDisappearanceObserver___block_invoke(uint64_t a1)
{
  id *v1;
  id v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id *v9;
  id WeakRetained;
  uint64_t v11;
  id *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v1 = *(id **)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  if (v1)
  {
    -[BKIOHIDService _workQueue]((uint64_t)v1);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v3);

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = v1[6];
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(id **)(*((_QWORD *)&v13 + 1) + 8 * v8);
          if (v9)
            WeakRetained = objc_loadWeakRetained(v9 + 1);
          else
            WeakRetained = 0;

          if (WeakRetained == v2)
          {
            v12 = v9;

            if (!v9)
              goto LABEL_17;
            objc_msgSend(v1[6], "removeObject:", v12, (_QWORD)v13);
            goto LABEL_18;
          }
          ++v8;
        }
        while (v6 != v8);
        v11 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        v6 = v11;
        if (v11)
          continue;
        break;
      }
    }

LABEL_17:
    v12 = 0;
LABEL_18:
    if (!objc_msgSend(v1[6], "count", (_QWORD)v13))
      objc_msgSend(v1, "_workQueue_stopIOServiceRemovalNotifications");

  }
}

uint64_t __60__BKIOHIDService__workQueue_addDisappearanceObserver_queue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "serviceDidDisappear:", *(_QWORD *)(a1 + 40));
}

void __53__BKIOHIDService_setElementValue_forUsagePage_usage___block_invoke(_DWORD *a1)
{
  int v2;
  int v3;
  NSObject *v4;
  int v5;
  int v6;
  int v7;
  _DWORD v8[2];
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = IOHIDServiceSetElementValue();
  if (v2)
  {
    v3 = v2;
    BKLogHID();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = a1[11];
      v5 = a1[12];
      v7 = a1[10];
      v8[0] = 67109888;
      v8[1] = v5;
      v9 = 1024;
      v10 = v7;
      v11 = 1024;
      v12 = v6;
      v13 = 1024;
      v14 = v3;
      _os_log_error_impl(&dword_1C8914000, v4, OS_LOG_TYPE_ERROR, "setElementValue:(%X) page:%X usage:%X failed:%X", (uint8_t *)v8, 0x1Au);
    }

  }
}

void __37__BKIOHIDService_asyncSetProperties___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  _QWORD v6[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained[12];
    v5 = WeakRetained;
    v6[0] = MEMORY[0x1E0C809B0];
    v4 = *(void **)(a1 + 32);
    v6[1] = 3221225472;
    v6[2] = __37__BKIOHIDService_asyncSetProperties___block_invoke_2;
    v6[3] = &__block_descriptor_40_e25_v32__0__NSString_8_16_B24l;
    v6[4] = v3;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);
    WeakRetained = v5;
  }

}

uint64_t __37__BKIOHIDService_asyncSetProperties___block_invoke_2()
{
  return IOHIDServiceSetProperty();
}

- (uint64_t)_isProbablyHeadset
{
  void *v1;
  uint64_t v2;

  if (!a1)
    return 0;
  objc_msgSend(a1, "propertyForKey:", CFSTR("DeviceTypeHint"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = objc_msgSend(v1, "isEqual:", CFSTR("Headset"));
  else
    v2 = 0;

  return v2;
}

@end
