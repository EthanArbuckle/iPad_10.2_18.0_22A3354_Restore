@implementation CWFApple80211

- (id)perAntennaRSSI:(id *)a3
{
  int v4;
  const char *v5;
  uint64_t v6;
  int v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  int *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  v12 = 0u;
  v13 = 0u;
  __strlcpy_chk();
  v8 = 1;
  LODWORD(v13) = 16;
  DWORD2(v13) = 52;
  v14 = &v8;
  v4 = Apple80211RawGet();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v5, *MEMORY[0x1E0CB2FE0], v4, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  else
  {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v5, (uint64_t)&v8, 52, v6);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)bluetoothCoexistenceMode:(id *)a3
{
  int v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 1;
  v10 = 0u;
  v11 = 0u;
  __strlcpy_chk();
  LODWORD(v11) = 87;
  DWORD2(v11) = 8;
  v12 = &v9;
  v4 = Apple80211RawGet();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v5, *MEMORY[0x1E0CB2FE0], v4, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  else
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v5, HIDWORD(v9), v6, v7);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)__guardInterval:(id *)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;

  v8 = Apple80211CopyValue();
  if (v8)
    v9 = 0;
  else
    v9 = (void *)objc_msgSend_copy(0, v4, v5, v6, v7);
  if (a3 && v8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v4, (uint64_t)CFSTR("com.apple.corewifi.error.apple80211"), v8, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)__numberOfSpatialStreams:(id *)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;

  v8 = Apple80211CopyValue();
  if (v8)
    v9 = 0;
  else
    v9 = (void *)objc_msgSend_copy(0, v4, v5, v6, v7);
  if (a3 && v8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v4, (uint64_t)CFSTR("com.apple.corewifi.error.apple80211"), v8, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)MCSIndex:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  objc_msgSend_activePHYMode_(self, a2, 0, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_unsignedIntValue(v7, v8, v9, v10, v11) & 0x80) != 0)
    objc_msgSend___VHTMCSIndex_(self, v12, (uint64_t)a3, v13, v14);
  else
    objc_msgSend___MCSIndex_(self, v12, (uint64_t)a3, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)guardInterval:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  objc_msgSend_activePHYMode_(self, a2, 0, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_unsignedIntValue(v7, v8, v9, v10, v11) & 0x80) != 0)
    objc_msgSend___VHTGuardInterval_(self, v12, (uint64_t)a3, v13, v14);
  else
    objc_msgSend___guardInterval_(self, v12, (uint64_t)a3, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)numberOfSpatialStreams:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  objc_msgSend_activePHYMode_(self, a2, 0, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_unsignedIntValue(v7, v8, v9, v10, v11) & 0x80) != 0)
    objc_msgSend___VHTNumberOfSpatialStreams_(self, v12, (uint64_t)a3, v13, v14);
  else
    objc_msgSend___numberOfSpatialStreams_(self, v12, (uint64_t)a3, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)channel:(id *)a3
{
  const char *v4;
  int v5;
  CWFChannel *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;

  v5 = Apple80211CopyValue();
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    v6 = objc_alloc_init(CWFChannel);
    objc_msgSend_objectForKeyedSubscript_(0, v7, (uint64_t)CFSTR("CHANNEL"), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_unsignedIntegerValue(v10, v11, v12, v13, v14);
    objc_msgSend_setChannel_(v6, v16, v15, v17, v18);

    objc_msgSend_objectForKeyedSubscript_(0, v19, (uint64_t)CFSTR("CHANNEL_FLAGS"), v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend_intValue(v22, v23, v24, v25, v26);
    objc_msgSend_setFlags_(v6, v28, v27, v29, v30);

  }
  if (a3 && v5)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v4, (uint64_t)CFSTR("com.apple.corewifi.error.apple80211"), v5, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)activePHYMode:(id *)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;

  v7 = Apple80211CopyValue();
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend_objectForKeyedSubscript_(0, v4, (uint64_t)CFSTR("PHYMODE_ACTIVE"), v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (a3 && v7)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v4, (uint64_t)CFSTR("com.apple.corewifi.error.apple80211"), v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)powerOn:(id *)a3
{
  int Power;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  Power = Apple80211GetPower();
  if (Power)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v5, (uint64_t)CFSTR("com.apple.corewifi.error.apple80211"), Power, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  else
  {
    objc_msgSend_numberWithUnsignedChar_(MEMORY[0x1E0CB37E8], v5, 0, v6, v7);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  NSString *interfaceName;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v6 = (void *)MEMORY[0x1E0CB3940];
  interfaceName = self->_interfaceName;
  sub_1B06353E8(self->_virtualInterfaceRole, a2, v2, v3, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v9, (uint64_t)CFSTR("name=%@, role=%@, parent=%@"), v10, v11, interfaceName, v8, self->_virtualInterfaceParent);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (BOOL)isMonitoringEventType:(unsigned int)a3 interfaceName:(id)a4
{
  id v6;
  NSObject *mutexQueue;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  mutexQueue = self->_mutexQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B06334D4;
  v10[3] = &unk_1E6133480;
  v11 = v6;
  v12 = &v14;
  v10[4] = self;
  v13 = a3;
  v8 = v6;
  dispatch_sync(mutexQueue, v10);
  LOBYTE(self) = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

- (int)virtualInterfaceRole
{
  return self->_virtualInterfaceRole;
}

- (id)txRate:(id *)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;

  v8 = Apple80211CopyValue();
  if (v8)
    v9 = 0;
  else
    v9 = (void *)objc_msgSend_copy(0, v4, v5, v6, v7);
  if (a3 && v8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v4, (uint64_t)CFSTR("com.apple.corewifi.error.apple80211"), v8, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)rxRate:(id *)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;

  v8 = Apple80211CopyValue();
  if (v8)
    v9 = 0;
  else
    v9 = (void *)objc_msgSend_copy(0, v4, v5, v6, v7);
  if (a3 && v8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v4, (uint64_t)CFSTR("com.apple.corewifi.error.apple80211"), v8, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)eventHandler
{
  return objc_getProperty(self, a2, 72, 1);
}

- (id)__MCSIndex:(id *)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;

  v8 = Apple80211CopyValue();
  if (v8)
    v9 = 0;
  else
    v9 = (void *)objc_msgSend_copy(0, v4, v5, v6, v7);
  if (a3 && v8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v4, (uint64_t)CFSTR("com.apple.corewifi.error.apple80211"), v8, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (unsigned)__apple80211FindServiceWithInterfaceName:(id)a3
{
  id v3;
  const char *v4;
  void *v5;
  void *v6;
  const char *v7;
  const __CFDictionary *v8;
  const __CFString *v10;
  id v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v5 = v3;
  if (v3)
  {
    v11 = v3;
    v12 = CFSTR("IOPropertyMatch");
    v10 = CFSTR("IOInterfaceName");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v4, (uint64_t)&v11, (uint64_t)&v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v7, (uint64_t)v13, (uint64_t)&v12, 1);
    v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    if (v8)
      LODWORD(v8) = IOServiceGetMatchingService(*MEMORY[0x1E0CBBAA8], v8);
  }
  else
  {
    LODWORD(v8) = 0;
  }

  return v8;
}

- (_Apple80211)__apple80211RefWithInterfaceName:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  io_object_t ServiceWithInterfaceName;
  io_object_t v9;

  v4 = a3;
  if (Apple80211Open())
  {
    v9 = 0;
    goto LABEL_11;
  }
  if (v4)
  {
    ServiceWithInterfaceName = objc_msgSend___apple80211FindServiceWithInterfaceName_(self, v5, (uint64_t)v4, v6, v7);
    if (!ServiceWithInterfaceName)
      goto LABEL_9;
    v9 = ServiceWithInterfaceName;
    if (Apple80211BindToInterfaceWithService())
    {
LABEL_11:
      Apple80211Close();
      if (!v9)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else
  {
    v9 = 0;
  }
  if (v9)
LABEL_8:
    IOObjectRelease(v9);
LABEL_9:

  return 0;
}

- (CWFApple80211)initWithInterfaceName:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CWFApple80211 *v9;
  uint64_t v10;
  NSString *interfaceName;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *mutexQueue;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *eventQueue;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSString *virtualInterfaceParent;
  NSMutableDictionary *v35;
  NSMutableDictionary *mutableInterfaceNameEventMap;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)CWFApple80211;
  v9 = -[CWFApple80211 init](&v38, sel_init);
  if (!v9)
    goto LABEL_6;
  v10 = objc_msgSend_copy(v4, v5, v6, v7, v8);
  interfaceName = v9->_interfaceName;
  v9->_interfaceName = (NSString *)v10;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = dispatch_queue_create("com.apple.corewifi.apple80211-mutex", v12);
  mutexQueue = v9->_mutexQueue;
  v9->_mutexQueue = (OS_dispatch_queue *)v13;

  if (!v9->_mutexQueue)
    goto LABEL_6;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = dispatch_queue_create("com.apple.corewifi.apple80211-event", v15);
  eventQueue = v9->_eventQueue;
  v9->_eventQueue = (OS_dispatch_queue *)v16;

  if (!v9->_eventQueue)
    goto LABEL_6;
  v21 = objc_msgSend___apple80211RefWithInterfaceName_(v9, v18, (uint64_t)v4, v19, v20);
  v9->_a11Ref = (_Apple80211 *)v21;
  if (!v21)
    goto LABEL_6;
  objc_msgSend_virtualInterfaceRole_(v9, v22, 0, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_virtualInterfaceRole = objc_msgSend_unsignedIntValue(v25, v26, v27, v28, v29);

  objc_msgSend_virtualInterfaceParent_(v9, v30, 0, v31, v32);
  v33 = objc_claimAutoreleasedReturnValue();
  virtualInterfaceParent = v9->_virtualInterfaceParent;
  v9->_virtualInterfaceParent = (NSString *)v33;

  v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  mutableInterfaceNameEventMap = v9->_mutableInterfaceNameEventMap;
  v9->_mutableInterfaceNameEventMap = v35;

  if (!v9->_mutableInterfaceNameEventMap)
  {
LABEL_6:

    v9 = 0;
  }

  return v9;
}

- (CWFApple80211)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("-[CWFApple80211 init] unavailable"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)invalidate
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_setEventHandler_(self, a2, 0, v2, v3);
  if (self->_a11Ref)
    Apple80211EventMonitoringHalt();
}

- (void)dealloc
{
  objc_super v3;

  if (self->_a11Ref)
    Apple80211Close();
  v3.receiver = self;
  v3.super_class = (Class)CWFApple80211;
  -[CWFApple80211 dealloc](&v3, sel_dealloc);
}

- (BOOL)__setupEventMonitoring
{
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;

  if (Apple80211RawEventMonitoringInit())
  {
    CWFGetOSLog();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      CWFGetOSLog();
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = MEMORY[0x1E0C81028];
      v7 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    goto LABEL_13;
  }
  if (!Apple80211RawStartMonitoringEventAll())
    return 1;
  CWFGetOSLog();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    CWFGetOSLog();
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v12 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
LABEL_13:
    objc_msgSend_interfaceName(self, v8, v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _os_log_send_and_compose_impl();

  }
LABEL_14:

  return 0;
}

- (int)startMonitoringEventWithType:(unsigned int)a3 interfaceName:(id)a4
{
  id v6;
  NSObject *mutexQueue;
  id v8;
  _QWORD block[5];
  id v11;
  unsigned int v12;

  v6 = a4;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06585A4;
  block[3] = &unk_1E6133458;
  block[4] = self;
  v11 = v6;
  v12 = a3;
  v8 = v6;
  dispatch_sync(mutexQueue, block);

  return 0;
}

- (void)stopMonitoringEventWithType:(unsigned int)a3 interfaceName:(id)a4
{
  id v6;
  NSObject *mutexQueue;
  id v8;
  _QWORD block[4];
  id v10;
  CWFApple80211 *v11;
  unsigned int v12;

  v6 = a4;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06586E8;
  block[3] = &unk_1E6133458;
  v10 = v6;
  v11 = self;
  v12 = a3;
  v8 = v6;
  dispatch_sync(mutexQueue, block);

}

- (id)interfaceNames:(id *)a3
{
  int IfListCopy;
  const char *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  IfListCopy = Apple80211GetIfListCopy();
  if (IfListCopy)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v5, (uint64_t)CFSTR("com.apple.corewifi.error.apple80211"), IfListCopy, 0);
      v10 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0C99D20]);
    v10 = (void *)objc_msgSend_initWithArray_(v6, v7, 0, v8, v9);
  }
  return v10;
}

- (id)virtualInterfaceNames:(id *)a3
{
  int VirtualIfListCopy;
  const char *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  VirtualIfListCopy = Apple80211GetVirtualIfListCopy();
  if (VirtualIfListCopy)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v5, (uint64_t)CFSTR("com.apple.corewifi.error.apple80211"), VirtualIfListCopy, 0);
      v10 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0C99D20]);
    v10 = (void *)objc_msgSend_initWithArray_(v6, v7, 0, v8, v9);
  }
  return v10;
}

- (id)DTIMInterval:(id *)a3
{
  int v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 1;
  v10 = 0u;
  v11 = 0u;
  __strlcpy_chk();
  LODWORD(v11) = 41;
  DWORD2(v11) = 8;
  v12 = &v9;
  v4 = Apple80211RawGet();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v5, *MEMORY[0x1E0CB2FE0], v4, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  else
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v5, HIDWORD(v9), v6, v7);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)RSSI:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  objc_msgSend_perAntennaRSSI_(self, a2, 0, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  if (objc_msgSend_length(v5, v6, v7, v8, v9) == 52)
  {
    v11 = objc_retainAutorelease(v5);
    v16 = objc_msgSend_bytes(v11, v12, v13, v14, v15);
    v20 = 28;
    if (*(_DWORD *)(v16 + 4) == 1)
      v20 = 12;
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v17, *(unsigned int *)(v16 + v20), v18, v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)noise:(id *)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;

  v7 = Apple80211CopyValue();
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend_objectForKeyedSubscript_(0, v4, (uint64_t)CFSTR("NOISE_CTL_AGR"), v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (a3 && v7)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v4, (uint64_t)CFSTR("com.apple.corewifi.error.apple80211"), v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)authType:(id *)a3
{
  int v4;
  const char *v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  int v10;
  __int128 v11;
  __int128 v12;
  int *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v9 = 0;
  v11 = 0u;
  v12 = 0u;
  __strlcpy_chk();
  v8 = 1;
  LODWORD(v12) = 2;
  DWORD2(v12) = 16;
  v13 = &v8;
  v4 = Apple80211RawGet();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v5, *MEMORY[0x1E0CB2FE0], v4, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  else
  {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v5, (uint64_t)&v8, 16, v6);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)supportedPHYModes:(id *)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;

  v7 = Apple80211CopyValue();
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend_objectForKeyedSubscript_(0, v4, (uint64_t)CFSTR("PHYMODE_SUPPORTED"), v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (a3 && v7)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v4, (uint64_t)CFSTR("com.apple.corewifi.error.apple80211"), v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)txPower:(id *)a3
{
  int v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  int *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = 0u;
  v12 = 0u;
  __strlcpy_chk();
  v9 = 1;
  LODWORD(v12) = 7;
  DWORD2(v12) = 12;
  v13 = &v9;
  v4 = Apple80211RawGet();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v5, *MEMORY[0x1E0CB2FE0], v4, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  else
  {
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v5, HIDWORD(v10), v6, v7);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)opMode:(id *)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;

  v8 = Apple80211CopyValue();
  if (v8)
    v9 = 0;
  else
    v9 = (void *)objc_msgSend_copy(0, v4, v5, v6, v7);
  if (a3 && v8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v4, (uint64_t)CFSTR("com.apple.corewifi.error.apple80211"), v8, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)capabilities:(id *)a3
{
  CFMutableArrayRef Mutable;
  const char *v5;
  CFMutableArrayRef v6;
  int v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  if (!Mutable)
  {
    v12 = 0;
    v7 = -3901;
    if (!a3)
      return v12;
    goto LABEL_5;
  }
  v6 = Mutable;
  v7 = Apple80211Get();
  if (v7)
  {
    v12 = 0;
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x1E0C99D20]);
    v12 = (void *)objc_msgSend_initWithArray_(v8, v9, (uint64_t)v6, v10, v11);
  }
  CFRelease(v6);
  if (a3)
  {
LABEL_5:
    if (v7)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v5, (uint64_t)CFSTR("com.apple.corewifi.error.apple80211"), v7, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v12;
}

- (id)SSID:(id *)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;

  v8 = Apple80211CopyValue();
  if (v8)
    v9 = 0;
  else
    v9 = (void *)objc_msgSend_copy(0, v4, v5, v6, v7);
  if (a3 && v8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v4, (uint64_t)CFSTR("com.apple.corewifi.error.apple80211"), v8, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)BSSID:(id *)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  void *v10;

  v8 = Apple80211CopyValue();
  if (v8)
  {
    v10 = 0;
  }
  else
  {
    v9 = (void *)objc_msgSend_copy(0, v4, v5, v6, v7);
    CWFCorrectEthernetAddressString(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (a3 && v8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v4, (uint64_t)CFSTR("com.apple.corewifi.error.apple80211"), v8, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (id)countryCode:(id *)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;

  v8 = Apple80211CopyValue();
  if (v8)
    v9 = 0;
  else
    v9 = (void *)objc_msgSend_copy(0, v4, v5, v6, v7);
  if (a3 && v8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v4, (uint64_t)CFSTR("com.apple.corewifi.error.apple80211"), v8, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)virtualInterfaceParent:(id *)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;

  v8 = Apple80211CopyValue();
  if (v8)
    v9 = 0;
  else
    v9 = (void *)objc_msgSend_copy(0, v4, v5, v6, v7);
  if (a3 && v8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v4, (uint64_t)CFSTR("com.apple.corewifi.error.apple80211"), v8, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)virtualInterfaceRole:(id *)a3
{
  int v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = Apple80211Get();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v5, (uint64_t)CFSTR("com.apple.corewifi.error.apple80211"), v4, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  else
  {
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v5, 0, v6, v7);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)wowEnabled:(id *)a3
{
  int v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = Apple80211Get();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v5, (uint64_t)CFSTR("com.apple.corewifi.error.apple80211"), v4, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  else
  {
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v5, 0, v6, v7);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)linkChangedEventData:(id *)a3
{
  int v4;
  const char *v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  __strlcpy_chk();
  LODWORD(v11) = 156;
  DWORD2(v11) = 32;
  v12 = &v8;
  v4 = Apple80211RawGet();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v5, *MEMORY[0x1E0CB2FE0], v4, 0, v8, v9, v10);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  else
  {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v5, (uint64_t)&v8, 32, v6);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)setChannel:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  int v37;
  const char *v38;
  int v39;

  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a3;
  objc_msgSend_dictionary(v6, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB37E8];
  v18 = objc_msgSend_channel(v7, v14, v15, v16, v17);
  objc_msgSend_numberWithUnsignedInteger_(v13, v19, v18, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v12, v23, (uint64_t)v22, (uint64_t)CFSTR("CHANNEL"), v24);

  v25 = (void *)MEMORY[0x1E0CB37E8];
  v30 = objc_msgSend_flags(v7, v26, v27, v28, v29);

  objc_msgSend_numberWithUnsignedInt_(v25, v31, v30, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v12, v35, (uint64_t)v34, (uint64_t)CFSTR("CHANNEL_FLAGS"), v36);

  v37 = MEMORY[0x1B5E09B8C](self->_a11Ref, 4, 0, v12, 0xFFFFFFFFLL);
  v39 = v37;
  if (a4 && v37)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v38, (uint64_t)CFSTR("com.apple.corewifi.error.apple80211"), v37, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v39 == 0;
}

- (id)__supportedChannelsWithCountryCode:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  unsigned int *v20;
  void *v21;
  unsigned int v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v34;
  id *v35;
  id v36;
  _QWORD v37[2];
  _DWORD v38[1200];
  char v39;
  __int16 v40;
  char v41;
  _QWORD v42[2];
  _QWORD v43[2];
  __int128 v44;
  __int128 v45;
  _QWORD *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  bzero((char *)v37 + 4, 0x12D4uLL);
  LODWORD(v37[0]) = 1;
  v38[1198] = -1;
  if (v5)
  {
    v39 = 1;
    v6 = objc_retainAutorelease(v5);
    v11 = objc_msgSend_UTF8String(v6, v7, v8, v9, v10);
    v12 = *(_WORD *)v11;
    v41 = *(_BYTE *)(v11 + 2);
    v40 = v12;
  }
  v46 = 0;
  v44 = 0u;
  v45 = 0u;
  __strlcpy_chk();
  LODWORD(v45) = 27;
  DWORD2(v45) = 4824;
  v46 = v37;
  v17 = Apple80211RawGet();
  if ((_DWORD)v17)
  {
    v18 = 0;
    if (!a4)
      goto LABEL_10;
  }
  else
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v13, v14, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!HIDWORD(v37[0]))
      goto LABEL_10;
    v34 = v17;
    v35 = a4;
    v36 = v5;
    v19 = 0;
    v20 = v38;
    do
    {
      v42[0] = CFSTR("SUP_CHANNEL");
      objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v13, *(v20 - 1), v15, v16, v34, v35, v36, v37[0]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v42[1] = CFSTR("SUP_CHANNEL_FLAGS");
      v43[0] = v21;
      v22 = *v20;
      v20 += 3;
      objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v23, v22, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v43[1] = v26;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v27, (uint64_t)v43, (uint64_t)v42, 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_addObject_(v18, v29, (uint64_t)v28, v30, v31);
      ++v19;
    }
    while (v19 < HIDWORD(v37[0]));
    a4 = v35;
    v5 = v36;
    LODWORD(v17) = v34;
    if (!v35)
      goto LABEL_10;
  }
  if ((_DWORD)v17)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v13, *MEMORY[0x1E0CB2FE0], (int)v17, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_10:
  v32 = (void *)objc_msgSend_copy(v18, v13, v14, v15, v16);

  return v32;
}

- (id)supportedChannelsWithCountryCode:(id)a3 error:(id *)a4
{
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  int v33;
  CWFChannel *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  CWFChannel *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  CWFChannel *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  CWFChannel *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v96;
  id *v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  id v102;
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v102 = 0;
  objc_msgSend___supportedChannelsWithCountryCode_error_(self, a2, (uint64_t)a3, (uint64_t)&v102, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v102;
  if (v11)
  {
    v12 = 0;
    if (a4)
      goto LABEL_20;
    goto LABEL_22;
  }
  v97 = a4;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v7, v8, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v96 = v6;
  v13 = v6;
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v98, (uint64_t)v103, 16);
  if (!v15)
    goto LABEL_19;
  v19 = v15;
  v20 = *(_QWORD *)v99;
  do
  {
    v21 = 0;
    do
    {
      if (*(_QWORD *)v99 != v20)
        objc_enumerationMutation(v13);
      v22 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * v21);
      objc_msgSend_objectForKeyedSubscript_(v22, v16, (uint64_t)CFSTR("SUP_CHANNEL"), v17, v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v22, v24, (uint64_t)CFSTR("SUP_CHANNEL_FLAGS"), v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend_unsignedIntValue(v27, v28, v29, v30, v31);
      v33 = v32;
      if ((v32 & 2) != 0)
      {
        v49 = objc_alloc_init(CWFChannel);
        v54 = objc_msgSend_unsignedIntegerValue(v23, v50, v51, v52, v53);
        objc_msgSend_setChannel_(v49, v55, v54, v56, v57);
        objc_msgSend_setFlags_(v49, v58, v33 & 0xFFFFF3FA, v59, v60);
        objc_msgSend_addObject_(v12, v61, (uint64_t)v49, v62, v63);

        if ((v33 & 4) == 0)
        {
LABEL_9:
          if ((v33 & 0x400) == 0)
            goto LABEL_10;
          goto LABEL_16;
        }
      }
      else if ((v32 & 4) == 0)
      {
        goto LABEL_9;
      }
      v64 = objc_alloc_init(CWFChannel);
      v69 = objc_msgSend_unsignedIntegerValue(v23, v65, v66, v67, v68);
      objc_msgSend_setChannel_(v64, v70, v69, v71, v72);
      objc_msgSend_setFlags_(v64, v73, v33 & 0xFFFFF3FC, v74, v75);
      objc_msgSend_addObject_(v12, v76, (uint64_t)v64, v77, v78);

      if ((v33 & 0x400) == 0)
      {
LABEL_10:
        if ((v33 & 0x800) == 0)
          goto LABEL_12;
LABEL_11:
        v34 = objc_alloc_init(CWFChannel);
        v39 = objc_msgSend_unsignedIntegerValue(v23, v35, v36, v37, v38);
        objc_msgSend_setChannel_(v34, v40, v39, v41, v42);
        objc_msgSend_setFlags_(v34, v43, v33 & 0xFFFFFBF8, v44, v45);
        objc_msgSend_addObject_(v12, v46, (uint64_t)v34, v47, v48);

        goto LABEL_12;
      }
LABEL_16:
      v79 = objc_alloc_init(CWFChannel);
      v84 = objc_msgSend_unsignedIntegerValue(v23, v80, v81, v82, v83);
      objc_msgSend_setChannel_(v79, v85, v84, v86, v87);
      objc_msgSend_setFlags_(v79, v88, v33 & 0xFFFFF7F8, v89, v90);
      objc_msgSend_addObject_(v12, v91, (uint64_t)v79, v92, v93);

      if ((v33 & 0x800) != 0)
        goto LABEL_11;
LABEL_12:

      ++v21;
    }
    while (v19 != v21);
    v94 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v98, (uint64_t)v103, 16);
    v19 = v94;
  }
  while (v94);
LABEL_19:

  v6 = v96;
  a4 = v97;
  v11 = 0;
  if (v97)
  {
LABEL_20:
    if (v11)
      *a4 = objc_retainAutorelease(v11);
  }
LABEL_22:

  return v12;
}

- (id)__hardwareSupportedChannels:(id *)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  unint64_t v10;
  unsigned int *v11;
  void *v12;
  unsigned int v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id *v25;
  int v26;
  _DWORD v27[3];
  _DWORD v28[1200];
  char v29;
  _QWORD v30[2];
  _QWORD v31[2];
  __int128 v32;
  __int128 v33;
  int *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  bzero(v27, 0x12D4uLL);
  v26 = 1;
  v28[1198] = -1;
  v29 = 1;
  v34 = 0;
  v32 = 0u;
  v33 = 0u;
  __strlcpy_chk();
  LODWORD(v33) = 27;
  DWORD2(v33) = 4824;
  v34 = &v26;
  v8 = Apple80211RawGet();
  if (v8)
  {
    v9 = 0;
    if (!a3)
      goto LABEL_8;
  }
  else
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v4, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v27[0])
      goto LABEL_8;
    v25 = a3;
    v10 = 0;
    v11 = v28;
    do
    {
      v30[0] = CFSTR("SUP_CHANNEL");
      objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v4, *(v11 - 1), v6, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v30[1] = CFSTR("SUP_CHANNEL_FLAGS");
      v31[0] = v12;
      v13 = *v11;
      v11 += 3;
      objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v14, v13, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v31[1] = v17;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v18, (uint64_t)v31, (uint64_t)v30, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_addObject_(v9, v20, (uint64_t)v19, v21, v22);
      ++v10;
    }
    while (v10 < v27[0]);
    a3 = v25;
    if (!v25)
      goto LABEL_8;
  }
  if (v8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v4, *MEMORY[0x1E0CB2FE0], v8, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_8:
  v23 = (void *)objc_msgSend_copy(v9, v4, v5, v6, v7);

  return v23;
}

- (id)hardwareSupportedChannels:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  int v33;
  CWFChannel *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  CWFChannel *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  CWFChannel *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  CWFChannel *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v96;
  id *v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  id v102;
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v102 = 0;
  objc_msgSend___hardwareSupportedChannels_(self, a2, (uint64_t)&v102, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v102;
  if (v11)
  {
    v12 = 0;
    if (a3)
      goto LABEL_20;
    goto LABEL_22;
  }
  v97 = a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v7, v8, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v96 = v6;
  v13 = v6;
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v98, (uint64_t)v103, 16);
  if (!v15)
    goto LABEL_19;
  v19 = v15;
  v20 = *(_QWORD *)v99;
  do
  {
    v21 = 0;
    do
    {
      if (*(_QWORD *)v99 != v20)
        objc_enumerationMutation(v13);
      v22 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * v21);
      objc_msgSend_objectForKeyedSubscript_(v22, v16, (uint64_t)CFSTR("SUP_CHANNEL"), v17, v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v22, v24, (uint64_t)CFSTR("SUP_CHANNEL_FLAGS"), v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend_unsignedIntValue(v27, v28, v29, v30, v31);
      v33 = v32;
      if ((v32 & 2) != 0)
      {
        v49 = objc_alloc_init(CWFChannel);
        v54 = objc_msgSend_unsignedIntegerValue(v23, v50, v51, v52, v53);
        objc_msgSend_setChannel_(v49, v55, v54, v56, v57);
        objc_msgSend_setFlags_(v49, v58, v33 & 0xFFFFF3FA, v59, v60);
        objc_msgSend_addObject_(v12, v61, (uint64_t)v49, v62, v63);

        if ((v33 & 4) == 0)
        {
LABEL_9:
          if ((v33 & 0x400) == 0)
            goto LABEL_10;
          goto LABEL_16;
        }
      }
      else if ((v32 & 4) == 0)
      {
        goto LABEL_9;
      }
      v64 = objc_alloc_init(CWFChannel);
      v69 = objc_msgSend_unsignedIntegerValue(v23, v65, v66, v67, v68);
      objc_msgSend_setChannel_(v64, v70, v69, v71, v72);
      objc_msgSend_setFlags_(v64, v73, v33 & 0xFFFFF3FC, v74, v75);
      objc_msgSend_addObject_(v12, v76, (uint64_t)v64, v77, v78);

      if ((v33 & 0x400) == 0)
      {
LABEL_10:
        if ((v33 & 0x800) == 0)
          goto LABEL_12;
LABEL_11:
        v34 = objc_alloc_init(CWFChannel);
        v39 = objc_msgSend_unsignedIntegerValue(v23, v35, v36, v37, v38);
        objc_msgSend_setChannel_(v34, v40, v39, v41, v42);
        objc_msgSend_setFlags_(v34, v43, v33 & 0xFFFFFBF8, v44, v45);
        objc_msgSend_addObject_(v12, v46, (uint64_t)v34, v47, v48);

        goto LABEL_12;
      }
LABEL_16:
      v79 = objc_alloc_init(CWFChannel);
      v84 = objc_msgSend_unsignedIntegerValue(v23, v80, v81, v82, v83);
      objc_msgSend_setChannel_(v79, v85, v84, v86, v87);
      objc_msgSend_setFlags_(v79, v88, v33 & 0xFFFFF7F8, v89, v90);
      objc_msgSend_addObject_(v12, v91, (uint64_t)v79, v92, v93);

      if ((v33 & 0x800) != 0)
        goto LABEL_11;
LABEL_12:

      ++v21;
    }
    while (v19 != v21);
    v94 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v98, (uint64_t)v103, 16);
    v19 = v94;
  }
  while (v94);
LABEL_19:

  v6 = v96;
  a3 = v97;
  v11 = 0;
  if (v97)
  {
LABEL_20:
    if (v11)
      *a3 = objc_retainAutorelease(v11);
  }
LABEL_22:

  return v12;
}

- (BOOL)isAWDLEnabled
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;

  objc_msgSend_AWDLSyncEnabled_(self, a2, 0, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_retainAutorelease(v4);
    v11 = *(_DWORD *)(objc_msgSend_bytes(v6, v7, v8, v9, v10) + 8) != 0;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)AWDLSyncEnabled:(id *)a3
{
  int v4;
  const char *v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  int *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = 0u;
  v11 = 0u;
  __strlcpy_chk();
  v8 = 1;
  LODWORD(v11) = 117;
  DWORD2(v11) = 12;
  v12 = &v8;
  v4 = Apple80211RawGet();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v5, *MEMORY[0x1E0CB2FE0], v4, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  else
  {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v5, (uint64_t)&v8, 12, v6);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)AWDLSyncChannelSequence:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  int v7;
  uint64_t v8;
  int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _DWORD v34[7];
  __int128 v35;
  __int128 v36;
  int *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    v33 = 0u;
    memset(v34, 0, sizeof(v34));
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v26 = 0u;
    v25 = 0u;
    v24 = 0u;
    v23 = 0u;
    v22 = 0u;
    v21 = 0u;
    v20 = 0u;
    v19 = 0u;
    v18 = 0u;
    v17 = 0u;
    v16 = 0u;
    v15 = 0u;
    v14 = 0u;
    v13 = 0u;
    v12 = 0u;
    v11 = 0u;
    v35 = 0u;
    v36 = 0u;
    __strlcpy_chk();
    v10 = 1;
    LODWORD(v36) = 129;
    DWORD2(v36) = 400;
    v37 = &v10;
    v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v6, (uint64_t)&v10, 400, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 6;
  }
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v6, *MEMORY[0x1E0CB2FE0], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)AWDLSyncState:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  int v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  __int128 v14;
  __int128 v15;
  int *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    v12 = 0;
    v11 = 0;
    v13 = 0;
    v14 = 0u;
    v15 = 0u;
    __strlcpy_chk();
    v10 = 1;
    LODWORD(v15) = 134;
    DWORD2(v15) = 24;
    v16 = &v10;
    v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v6, (uint64_t)&v10, 24, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 6;
  }
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v6, *MEMORY[0x1E0CB2FE0], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)AWDLSyncParameters:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  int v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  __int128 v14;
  __int128 v15;
  int *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    v12 = 0;
    v11 = 0;
    v13 = 0;
    v14 = 0u;
    v15 = 0u;
    __strlcpy_chk();
    v10 = 1;
    LODWORD(v15) = 116;
    DWORD2(v15) = 24;
    v16 = &v10;
    v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v6, (uint64_t)&v10, 24, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 6;
  }
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v6, *MEMORY[0x1E0CB2FE0], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)AWDLElectionID:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  int v7;
  uint64_t v8;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    v10 = 1;
    v11 = 0u;
    v12 = 0u;
    __strlcpy_chk();
    LODWORD(v12) = 122;
    DWORD2(v12) = 8;
    v13 = &v10;
    v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v6, (uint64_t)&v10, 8, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 6;
  }
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v6, *MEMORY[0x1E0CB2FE0], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)AWDLElectionParameters:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  int v7;
  uint64_t v8;
  int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  int v14;
  __int128 v15;
  __int128 v16;
  int *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    v14 = 0;
    v13 = 0u;
    v12 = 0u;
    v11 = 0u;
    v15 = 0u;
    v16 = 0u;
    __strlcpy_chk();
    v10 = 1;
    LODWORD(v16) = 155;
    DWORD2(v16) = 56;
    v17 = &v10;
    v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v6, (uint64_t)&v10, 56, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 6;
  }
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v6, *MEMORY[0x1E0CB2FE0], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)AWDLElectionRSSIThresholds:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  int v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  int *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    v11 = 0;
    v12 = 0;
    v13 = 0u;
    v14 = 0u;
    __strlcpy_chk();
    v10 = 1;
    LODWORD(v14) = 135;
    DWORD2(v14) = 20;
    v15 = &v10;
    v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v6, (uint64_t)&v10, 20, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 6;
  }
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v6, *MEMORY[0x1E0CB2FE0], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)AWDLSocialTimeSlots:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  int v7;
  uint64_t v8;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    v10 = 1;
    v11 = 0u;
    v12 = 0u;
    __strlcpy_chk();
    LODWORD(v12) = 163;
    DWORD2(v12) = 8;
    v13 = &v10;
    v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v6, (uint64_t)&v10, 8, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 6;
  }
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v6, *MEMORY[0x1E0CB2FE0], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)AWDLPeerDatabase:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  int v7;
  uint64_t v8;
  __int128 v10;
  _DWORD v11[52120];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    bzero(v11, 0x32E60uLL);
    v10 = 0u;
    __strlcpy_chk();
    v11[0] = 1;
    LODWORD(v10) = 203;
    DWORD2(v10) = 208480;
    v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v6, (uint64_t)v11, 208480, v8, 0, 0, v10, v11);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 6;
  }
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v6, *MEMORY[0x1E0CB2FE0], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)AWDLStatistics:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  int v7;
  uint64_t v8;
  _DWORD v10[928];
  __int128 v11;
  __int128 v12;
  _DWORD *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    bzero(v10, 0xE80uLL);
    v13 = 0;
    v11 = 0u;
    v12 = 0u;
    __strlcpy_chk();
    v10[0] = 1;
    LODWORD(v12) = 223;
    DWORD2(v12) = 3712;
    v13 = v10;
    v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v6, (uint64_t)v10, 3712, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 6;
  }
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v6, *MEMORY[0x1E0CB2FE0], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)AWDLMasterChannel:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  int v7;
  uint64_t v8;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    v10 = 1;
    v11 = 0u;
    v12 = 0u;
    __strlcpy_chk();
    LODWORD(v12) = 132;
    DWORD2(v12) = 8;
    v13 = &v10;
    v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v6, (uint64_t)&v10, 8, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 6;
  }
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v6, *MEMORY[0x1E0CB2FE0], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)AWDLSecondaryMasterChannel:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  int v7;
  uint64_t v8;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    v10 = 1;
    v11 = 0u;
    v12 = 0u;
    __strlcpy_chk();
    LODWORD(v12) = 205;
    DWORD2(v12) = 8;
    v13 = &v10;
    v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v6, (uint64_t)&v10, 8, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 6;
  }
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v6, *MEMORY[0x1E0CB2FE0], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)AWDLPreferredChannels:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  int v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  int *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    v11 = 0;
    v12 = 0u;
    v13 = 0u;
    __strlcpy_chk();
    v10 = 1;
    LODWORD(v13) = 244;
    DWORD2(v13) = 12;
    v14 = &v10;
    v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v6, (uint64_t)&v10, 12, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 6;
  }
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v6, *MEMORY[0x1E0CB2FE0], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)AWDLOpMode:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  int v7;
  uint64_t v8;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    v10 = 1;
    v11 = 0u;
    v12 = 0u;
    __strlcpy_chk();
    LODWORD(v12) = 217;
    DWORD2(v12) = 8;
    v13 = &v10;
    v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v6, (uint64_t)&v10, 8, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 6;
  }
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v6, *MEMORY[0x1E0CB2FE0], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)AWDLStrategy:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  int v7;
  uint64_t v8;
  _QWORD v10[3];
  __int128 v11;
  __int128 v12;
  _QWORD *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    v10[1] = 0;
    v10[2] = 0;
    v11 = 0u;
    v12 = 0u;
    __strlcpy_chk();
    v10[0] = 1;
    LODWORD(v12) = 148;
    DWORD2(v12) = 24;
    v13 = v10;
    v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v6, (uint64_t)v10, 24, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 6;
  }
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v6, *MEMORY[0x1E0CB2FE0], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)rangingCapabilities:(id *)a3
{
  int v4;
  const char *v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  __int128 v12;
  __int128 v13;
  int *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v9 = 0;
  v11 = 0;
  v12 = 0u;
  v13 = 0u;
  __strlcpy_chk();
  v8 = 1;
  LODWORD(v13) = 266;
  DWORD2(v13) = 24;
  v14 = &v8;
  v4 = Apple80211RawGet();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v5, *MEMORY[0x1E0CB2FE0], v4, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  else
  {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v5, (uint64_t)&v8, 24, v6);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)AWDLSidecarDiagnostics:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  int v7;
  uint64_t v8;
  __int128 v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _DWORD v15[7];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    memset(v15, 0, sizeof(v15));
    v14 = 0u;
    v13 = 0u;
    v12 = 0u;
    v10 = 0u;
    __strlcpy_chk();
    v11 = 1;
    LODWORD(v10) = 351;
    DWORD2(v10) = 80;
    v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v6, (uint64_t)&v11, 80, v8, 0, 0, v10, &v11);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 6;
  }
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v6, *MEMORY[0x1E0CB2FE0], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)powerState:(id *)a3
{
  int v4;
  const char *v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  __int128 v12;
  __int128 v13;
  int *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v9 = 0;
  v11 = 0;
  v12 = 0u;
  v13 = 0u;
  __strlcpy_chk();
  v8 = 1;
  LODWORD(v13) = 19;
  DWORD2(v13) = 24;
  v14 = &v8;
  v4 = Apple80211RawGet();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v5, *MEMORY[0x1E0CB2FE0], v4, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  else
  {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v5, (uint64_t)&v8, 24, v6);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)chainAck:(id *)a3
{
  int v4;
  const char *v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  __int128 v12;
  __int128 v13;
  int *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v9 = 0;
  v11 = 0;
  v12 = 0u;
  v13 = 0u;
  __strlcpy_chk();
  v8 = 1;
  LODWORD(v13) = 174;
  DWORD2(v13) = 24;
  v14 = &v8;
  v4 = Apple80211RawGet();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v5, *MEMORY[0x1E0CB2FE0], v4, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  else
  {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v5, (uint64_t)&v8, 24, v6);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)txChainPower:(id *)a3
{
  int v4;
  const char *v5;
  uint64_t v6;
  int v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  int v14;
  __int128 v15;
  __int128 v16;
  int *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v13 = 0u;
  v12 = 0u;
  v11 = 0u;
  v10 = 0u;
  v9 = 0u;
  v15 = 0u;
  v16 = 0u;
  __strlcpy_chk();
  v8 = 1;
  LODWORD(v16) = 108;
  DWORD2(v16) = 88;
  v17 = &v8;
  v4 = Apple80211RawGet();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v5, *MEMORY[0x1E0CB2FE0], v4, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  else
  {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v5, (uint64_t)&v8, 88, v6);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)desense:(id *)a3
{
  int v4;
  const char *v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  int v10;
  __int128 v11;
  __int128 v12;
  int *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v9 = 0;
  v11 = 0u;
  v12 = 0u;
  __strlcpy_chk();
  v8 = 1;
  LODWORD(v12) = 175;
  DWORD2(v12) = 16;
  v13 = &v8;
  v4 = Apple80211RawGet();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v5, *MEMORY[0x1E0CB2FE0], v4, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  else
  {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v5, (uint64_t)&v8, 16, v6);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)desenseLevel:(id *)a3
{
  int v4;
  const char *v5;
  uint64_t v6;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 1;
  v9 = 0u;
  v10 = 0u;
  __strlcpy_chk();
  LODWORD(v10) = 194;
  DWORD2(v10) = 8;
  v11 = &v8;
  v4 = Apple80211RawGet();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v5, *MEMORY[0x1E0CB2FE0], v4, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  else
  {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v5, (uint64_t)&v8, 8, v6);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)bluetoothCoexistenceConfig:(id *)a3
{
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], a2, *MEMORY[0x1E0CB2FE0], 45, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)bluetoothCoexistenceProfiles2GHz:(id *)a3
{
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], a2, *MEMORY[0x1E0CB2FE0], 45, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)bluetoothCoexistenceProfiles5GHz:(id *)a3
{
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], a2, *MEMORY[0x1E0CB2FE0], 45, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)leakyAPStats:(id *)a3
{
  int v4;
  const char *v5;
  uint64_t v6;
  __int128 v8;
  int v9;
  _BYTE v10[9052];

  *(_QWORD *)&v10[9044] = *MEMORY[0x1E0C80C00];
  bzero(v10, 0x2354uLL);
  v8 = 0u;
  __strlcpy_chk();
  v9 = 1;
  LODWORD(v8) = 232;
  DWORD2(v8) = 9048;
  v4 = Apple80211RawGet();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v5, *MEMORY[0x1E0CB2FE0], v4, 0, 0, 0, v8, &v9);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  else
  {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v5, (uint64_t)&v9, 9048, v6, 0, 0, v8, &v9);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)LQMSummary:(id *)a3
{
  int v4;
  const char *v5;
  uint64_t v6;
  _OWORD v8[347];
  __int128 v9;
  _OWORD *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  bzero(v8, 0x15A0uLL);
  v10 = 0;
  v8[346] = 0u;
  v9 = 0u;
  __strlcpy_chk();
  LODWORD(v9) = 386;
  DWORD2(v9) = 5536;
  v10 = v8;
  v4 = Apple80211RawGet();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v5, *MEMORY[0x1E0CB2FE0], v4, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  else
  {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v5, (uint64_t)v8, 5536, v6);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)AWDLExtensionStateMachineParameters:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  int v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  int *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    v11 = 0;
    v12 = 0;
    v13 = 0u;
    v14 = 0u;
    __strlcpy_chk();
    v10 = 1;
    LODWORD(v14) = 118;
    DWORD2(v14) = 20;
    v15 = &v10;
    v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v6, (uint64_t)&v10, 20, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 6;
  }
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v6, *MEMORY[0x1E0CB2FE0], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)AWDLElectionMetric:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  int v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  int *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    v11 = 0;
    v12 = 0u;
    v13 = 0u;
    __strlcpy_chk();
    v10 = 1;
    LODWORD(v13) = 126;
    DWORD2(v13) = 12;
    v14 = &v10;
    v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v6, (uint64_t)&v10, 12, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 6;
  }
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v6, *MEMORY[0x1E0CB2FE0], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)AWDLPresenceMode:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  int v7;
  uint64_t v8;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    v10 = 1;
    v11 = 0u;
    v12 = 0u;
    __strlcpy_chk();
    LODWORD(v12) = 136;
    DWORD2(v12) = 8;
    v13 = &v10;
    v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v6, (uint64_t)&v10, 8, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 6;
  }
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v6, *MEMORY[0x1E0CB2FE0], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)AWDLGuardTime:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  int v7;
  uint64_t v8;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    v10 = 1;
    v11 = 0u;
    v12 = 0u;
    __strlcpy_chk();
    LODWORD(v12) = 124;
    DWORD2(v12) = 8;
    v13 = &v10;
    v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v6, (uint64_t)&v10, 8, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 6;
  }
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v6, *MEMORY[0x1E0CB2FE0], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)AWDLAvailabilityWindowAPAlignment:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  int v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  int v12;
  __int128 v13;
  __int128 v14;
  int *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    v12 = 0;
    v11 = 0;
    v13 = 0u;
    v14 = 0u;
    __strlcpy_chk();
    v10 = 1;
    LODWORD(v14) = 127;
    DWORD2(v14) = 16;
    v15 = &v10;
    v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v6, (uint64_t)&v10, 16, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 6;
  }
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v6, *MEMORY[0x1E0CB2FE0], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)AWDLContinuousElectionAlgorithmEnabled:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  int v7;
  uint64_t v8;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    v10 = 1;
    v11 = 0u;
    v12 = 0u;
    __strlcpy_chk();
    LODWORD(v12) = 121;
    DWORD2(v12) = 8;
    v13 = &v10;
    v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v6, (uint64_t)&v10, 8, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 6;
  }
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v6, *MEMORY[0x1E0CB2FE0], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)AWDLAFTxMode:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  int v7;
  uint64_t v8;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    v10 = 1;
    v11 = 0u;
    v12 = 0u;
    __strlcpy_chk();
    LODWORD(v12) = 208;
    DWORD2(v12) = 8;
    v13 = &v10;
    v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v6, (uint64_t)&v10, 8, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 6;
  }
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v6, *MEMORY[0x1E0CB2FE0], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)AWDLPeerTrafficRegistration:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  int v7;
  uint64_t v8;
  __int128 v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    v23 = 0;
    v22 = 0u;
    v21 = 0u;
    v20 = 0u;
    v19 = 0u;
    v18 = 0u;
    v17 = 0u;
    v16 = 0u;
    v15 = 0u;
    v14 = 0u;
    v13 = 0u;
    v12 = 0u;
    v10 = 0u;
    __strlcpy_chk();
    v11 = 1;
    LODWORD(v10) = 164;
    DWORD2(v10) = 184;
    v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v6, (uint64_t)&v11, 184, v8, 0, 0, v10, &v11);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 6;
  }
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v6, *MEMORY[0x1E0CB2FE0], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)AWDLEncryptionType:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  int v7;
  uint64_t v8;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    v10 = 1;
    v11 = 0u;
    v12 = 0u;
    __strlcpy_chk();
    LODWORD(v12) = 220;
    DWORD2(v12) = 8;
    v13 = &v10;
    v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v6, (uint64_t)&v10, 8, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 6;
  }
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v6, *MEMORY[0x1E0CB2FE0], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)AWDLBTLEStateParameters:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  int v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  int *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isAWDLEnabled(self, a2, (uint64_t)a3, v3, v4))
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0u;
    v15 = 0u;
    __strlcpy_chk();
    v10 = 1;
    LODWORD(v15) = 202;
    DWORD2(v15) = 28;
    v16 = &v10;
    v7 = Apple80211RawGet();
    if (!v7)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v6, (uint64_t)&v10, 28, v8);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 6;
  }
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v6, *MEMORY[0x1E0CB2FE0], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)powerDebugInfo:(id *)a3
{
  CFMutableDictionaryRef Mutable;
  const char *v5;
  CFMutableDictionaryRef v6;
  int v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!Mutable)
  {
    v12 = 0;
    v7 = -3901;
    if (!a3)
      return v12;
    goto LABEL_5;
  }
  v6 = Mutable;
  v7 = Apple80211Get();
  if (v7)
  {
    v12 = 0;
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x1E0C99D80]);
    v12 = (void *)objc_msgSend_initWithDictionary_(v8, v9, (uint64_t)v6, v10, v11);
  }
  CFRelease(v6);
  if (a3)
  {
LABEL_5:
    if (v7)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v5, (uint64_t)CFSTR("com.apple.corewifi.error.apple80211"), v7, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v12;
}

- (id)cca:(id *)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;

  v8 = Apple80211CopyValue();
  if (v8)
    v9 = 0;
  else
    v9 = (void *)objc_msgSend_copy(0, v4, v5, v6, v7);
  if (a3 && v8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v4, (uint64_t)CFSTR("com.apple.corewifi.error.apple80211"), v8, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)maxLinkSpeed:(id *)a3
{
  int v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = Apple80211MaxLinkSpeed();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v5, (uint64_t)CFSTR("com.apple.corewifi.error.apple80211"), v4, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  else
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v5, 0, v6, v7);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)state:(id *)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;

  v8 = Apple80211CopyValue();
  if (v8)
    v9 = 0;
  else
    v9 = (void *)objc_msgSend_copy(0, v4, v5, v6, v7);
  if (a3 && v8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v4, (uint64_t)CFSTR("com.apple.corewifi.error.apple80211"), v8, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)powersave:(id *)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;

  v8 = Apple80211CopyValue();
  if (v8)
    v9 = 0;
  else
    v9 = (void *)objc_msgSend_copy(0, v4, v5, v6, v7);
  if (a3 && v8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v4, (uint64_t)CFSTR("com.apple.corewifi.error.apple80211"), v8, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)maxNSSForAP:(id *)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;

  v8 = Apple80211CopyValue();
  if (v8)
    v9 = 0;
  else
    v9 = (void *)objc_msgSend_copy(0, v4, v5, v6, v7);
  if (a3 && v8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v4, (uint64_t)CFSTR("com.apple.corewifi.error.apple80211"), v8, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)txNSS:(id *)a3
{
  int v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = Apple80211Get();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v5, (uint64_t)CFSTR("com.apple.corewifi.error.apple80211"), v4, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  else
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v5, 0, v6, v7);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)countryBandSupport:(id *)a3
{
  int v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = Apple80211Get();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v5, (uint64_t)CFSTR("com.apple.corewifi.error.apple80211"), v4, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  else
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v5, 0, v6, v7);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)beaconCache:(id *)a3
{
  CFMutableArrayRef Mutable;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFArray *v9;
  int v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  CFIndex v16;
  const void *ValueAtIndex;
  CWFScanResult *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;

  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  if (!Mutable)
  {
    v15 = 0;
    v25 = -3901;
    if (!a3)
      goto LABEL_12;
    goto LABEL_10;
  }
  v9 = Mutable;
  v10 = Apple80211Get();
  if (v10)
  {
    v25 = v10;
    v15 = 0;
  }
  else
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (CFArrayGetCount(v9) >= 1)
    {
      v16 = 0;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v9, v16);
        v18 = [CWFScanResult alloc];
        v24 = (void *)objc_msgSend_initWithScanRecord_includeProperties_(v18, v19, (uint64_t)ValueAtIndex, 0, v20);
        if (v24)
          objc_msgSend_addObject_(v15, v21, (uint64_t)v24, v22, v23);

        ++v16;
      }
      while (CFArrayGetCount(v9) > v16);
    }
    v25 = 0;
  }
  CFRelease(v9);
  if (a3)
  {
LABEL_10:
    if (v25)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v5, (uint64_t)CFSTR("com.apple.corewifi.error.apple80211"), v25, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_12:
  v26 = (void *)objc_msgSend_copy(v15, v5, v6, v7, v8);

  return v26;
}

- (id)backgroundScanCache:(id *)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  CWFScanResult *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  NSObject *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  id v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  int *v83;
  uint64_t v84;
  void *v85;
  int v86;
  __int128 v88;
  int v89;
  _DWORD v90[1602];
  uint64_t v91;
  int v92;
  const char *v93;
  __int16 v94;
  const char *v95;
  __int16 v96;
  int v97;
  __int16 v98;
  void *v99;
  char __str[18];
  __int128 v101;
  __int128 v102;
  _DWORD *v103;
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  bzero(v90, 0x1910uLL);
  v103 = 0;
  v101 = 0u;
  v102 = 0u;
  __strlcpy_chk();
  LODWORD(v102) = 215;
  DWORD2(v102) = 6416;
  v103 = v90;
  v3 = 0;
  v86 = Apple80211RawGet();
  if (v86)
    v8 = 1;
  else
    v8 = v90[0] == 0;
  if (!v8)
  {
    v11 = 0;
    v3 = 0;
    v12 = 1;
    while (1)
    {
      v88 = *(_OWORD *)&v90[v12];
      v89 = v90[v12 + 4];
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v4, v5, v6, v7, v83, v84);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (snprintf(__str, 0x12uLL, "%02x:%02x:%02x:%02x:%02x:%02x", v88, BYTE1(v88), BYTE2(v88), BYTE3(v88), BYTE4(v88), BYTE5(v88)) != 17)break;
      objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v14, (uint64_t)__str, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      CWFCorrectEthernetAddressString(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v13, v19, (uint64_t)v18, (uint64_t)CFSTR("BSSID"), v20);

      objc_msgSend_numberWithShort_(MEMORY[0x1E0CB37E8], v21, (char)v89, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v13, v25, (uint64_t)v24, (uint64_t)CFSTR("RSSI"), v26);

      if (HIDWORD(v88))
      {
        objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v27, HIDWORD(v88), v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v13, v31, (uint64_t)v30, (uint64_t)CFSTR("CHANNEL"), v32);

        if (HIDWORD(v88) <= 0xE)
          v36 = 10;
        else
          v36 = 18;
        objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v33, BYTE6(v88) & 1, v34, v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v13, v38, (uint64_t)v37, (uint64_t)CFSTR("CONNECTED_BSSID"), v39);

        objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v40, v36, v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v13, v44, (uint64_t)v43, (uint64_t)CFSTR("CHANNEL_FLAGS"), v45);

        objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v46, 1000 * DWORD2(v88), v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v13, v50, (uint64_t)v49, (uint64_t)CFSTR("AGE"), v51);

        objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v52, v91 - 1000000000 * DWORD2(v88), v53, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v13, v56, (uint64_t)v55, (uint64_t)CFSTR("TIMESTAMP"), v57);

        objc_msgSend_setObject_forKeyedSubscript_(v13, v58, (uint64_t)&unk_1E6160860, (uint64_t)CFSTR("SCAN_RESULT_NET_FLAGS"), v59);
        objc_msgSend_setObject_forKeyedSubscript_(v13, v60, MEMORY[0x1E0C9AAB0], (uint64_t)CFSTR("SCAN_RESULT_FROM_BG_SCAN"), v61);
        v62 = [CWFScanResult alloc];
        objc_msgSend_setWithObjects_(MEMORY[0x1E0C99E60], v63, (uint64_t)&unk_1E615DD70, v64, v65, &unk_1E615DD88, &unk_1E615DDA0, &unk_1E615DDB8, &unk_1E615DDD0, &unk_1E615DDE8, 0);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = objc_msgSend_initWithScanRecord_includeProperties_(v62, v67, (uint64_t)v13, (uint64_t)v66, v68);

        if (!v3)
        {
          objc_msgSend_array(MEMORY[0x1E0C99DE8], v70, v71, v72, v73);
          v3 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend_addObject_(v3, v70, (uint64_t)v69, v72, v73);
      }
      else
      {
        CWFGetOSLog();
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        if (v74)
        {
          CWFGetOSLog();
          v69 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v69 = MEMORY[0x1E0C81028];
          v75 = MEMORY[0x1E0C81028];
        }

        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v76, (uint64_t)&v88, 20, v77);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          CWFHexadecimalStringFromData(v85, v78, v79, v80, v81);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v92 = 136446978;
          v93 = "-[CWFApple80211 backgroundScanCache:]";
          v94 = 2082;
          v95 = "CWFApple80211.m";
          v96 = 1024;
          v97 = 2468;
          v98 = 2112;
          v99 = v82;
          LODWORD(v84) = 38;
          v83 = &v92;
          _os_log_send_and_compose_impl();

        }
      }

      ++v11;
      v12 += 5;
      if (v11 >= v90[0])
        goto LABEL_6;
    }

  }
LABEL_6:
  if (a3 && v86)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v4, (uint64_t)CFSTR("com.apple.corewifi.error.apple80211"), v86, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)objc_msgSend_copy(v3, v4, v5, v6, v7, v83, v84);

  return v9;
}

- (id)blockedBands:(id *)a3
{
  CFMutableArrayRef Mutable;
  const char *v5;
  CFMutableArrayRef v6;
  int v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  if (!Mutable)
  {
    v12 = 0;
    v7 = -3901;
    if (!a3)
      return v12;
    goto LABEL_5;
  }
  v6 = Mutable;
  v7 = Apple80211Get();
  if (v7)
  {
    v12 = 0;
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x1E0C99D20]);
    v12 = (void *)objc_msgSend_initWithArray_(v8, v9, (uint64_t)v6, v10, v11);
  }
  CFRelease(v6);
  if (a3)
  {
LABEL_5:
    if (v7)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v5, (uint64_t)CFSTR("com.apple.corewifi.error.apple80211"), v7, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v12;
}

- (id)hostAPStationList:(id *)a3
{
  CFMutableArrayRef Mutable;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CFMutableArrayRef v9;
  int v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __CFArray *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  CWFHostAPStation *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  int v36;
  void *v37;
  __CFArray *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  if (!Mutable)
  {
    v15 = 0;
    v36 = -3901;
    if (!a3)
      goto LABEL_14;
    goto LABEL_12;
  }
  v9 = Mutable;
  v10 = Apple80211Get();
  if (v10)
  {
    v36 = v10;
    v15 = 0;
  }
  else
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v39 = v9;
    v16 = v9;
    v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v40, (uint64_t)v44, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v41 != v20)
            objc_enumerationMutation(v16);
          v22 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          v23 = objc_alloc_init(CWFHostAPStation);
          objc_msgSend_objectForKeyedSubscript_(v22, v24, (uint64_t)CFSTR("STATION_MAC"), v25, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          CWFCorrectEthernetAddressString(v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setBSSID_(v23, v29, (uint64_t)v28, v30, v31);

          objc_msgSend_addObject_(v15, v32, (uint64_t)v23, v33, v34);
        }
        v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v35, (uint64_t)&v40, (uint64_t)v44, 16);
      }
      while (v19);
    }

    v36 = 0;
    v9 = v39;
  }
  CFRelease(v9);
  if (a3)
  {
LABEL_12:
    if (v36)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v5, (uint64_t)CFSTR("com.apple.corewifi.error.apple80211"), v36, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_14:
  v37 = (void *)objc_msgSend_copy(v15, v5, v6, v7, v8, v39);

  return v37;
}

- (id)LQMConfig:(id *)a3
{
  CFMutableDictionaryRef Mutable;
  const char *v5;
  CFMutableDictionaryRef v6;
  int v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!Mutable)
  {
    v12 = 0;
    v7 = -3901;
    if (!a3)
      return v12;
    goto LABEL_5;
  }
  v6 = Mutable;
  v7 = Apple80211Get();
  if (v7)
  {
    v12 = 0;
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x1E0C99D80]);
    v12 = (void *)objc_msgSend_initWithDictionary_(v8, v9, (uint64_t)v6, v10, v11);
  }
  CFRelease(v6);
  if (a3)
  {
LABEL_5:
    if (v7)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v5, (uint64_t)CFSTR("com.apple.corewifi.error.apple80211"), v7, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v12;
}

- (BOOL)setLQMConfig:(id)a3 error:(id *)a4
{
  int v5;
  const char *v6;
  int v7;

  v5 = MEMORY[0x1B5E09B8C](self->_a11Ref, 337, 0, a3, 0xFFFFFFFFLL);
  v7 = v5;
  if (a4 && v5)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v6, (uint64_t)CFSTR("com.apple.corewifi.error.apple80211"), v5, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7 == 0;
}

- (id)currentNetwork:(id *)a3
{
  const char *v4;
  int v5;
  CWFScanResult *v6;
  const char *v7;
  uint64_t v8;
  void *v9;

  v5 = Apple80211CopyCurrentNetwork();
  if (v5)
  {
    v9 = 0;
  }
  else
  {
    v6 = [CWFScanResult alloc];
    v9 = (void *)objc_msgSend_initWithScanRecord_includeProperties_(v6, v7, 0, 0, v8);
  }
  if (a3 && v5)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v4, (uint64_t)CFSTR("com.apple.corewifi.error.apple80211"), v5, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)hardwareMACAddress:(id *)a3
{
  int v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  int *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = 0u;
  v14 = 0u;
  __strlcpy_chk();
  v11 = 1;
  LODWORD(v14) = 359;
  DWORD2(v14) = 12;
  v15 = &v11;
  v4 = Apple80211RawGet();
  if (v4)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v5, *MEMORY[0x1E0CB2FE0], v4, 0);
      v9 = 0;
      v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
      v8 = 0;
    }
  }
  else
  {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v5, (uint64_t)&v12, 6, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      CWFEthernetAddressStringFromData(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (NSString)virtualInterfaceParent
{
  return self->_virtualInterfaceParent;
}

- (void)setEventHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_virtualInterfaceParent, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_mutableInterfaceNameEventMap, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_callbackThread, 0);
  objc_storeStrong((id *)&self->_mutexQueue, 0);
}

@end
