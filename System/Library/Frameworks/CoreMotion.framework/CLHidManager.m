@implementation CLHidManager

- (CLHidManager)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  _QWORD v39[5];
  objc_super v40;
  int v41;
  uint64_t v42;
  uint8_t buf[4];
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v40.receiver = self;
  v40.super_class = (Class)CLHidManager;
  v6 = -[CLHidManager init](&v40, sel_init);
  if (v6)
  {
    *((_QWORD *)v6 + 4) = objc_opt_new();
    *((_QWORD *)v6 + 1) = a3;
    *((_QWORD *)v6 + 2) = a4;
    v7 = objc_alloc(MEMORY[0x1E0D27CB8]);
    v11 = (void *)objc_msgSend_initWithOptions_(v7, v8, 8, v9, v10);
    *((_QWORD *)v6 + 3) = v11;
    objc_msgSend_setDeviceMatching_(v11, v12, MEMORY[0x1E0C9AA70], v13, v14);
    objc_msgSend_setDispatchQueue_(*((void **)v6 + 3), v15, *((_QWORD *)v6 + 2), v16, v17);
    v18 = (void *)*((_QWORD *)v6 + 3);
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = sub_18F446968;
    v39[3] = &unk_1E29580B0;
    v39[4] = v6;
    objc_msgSend_setDeviceNotificationHandler_(v18, v19, (uint64_t)v39, v20, v21);
    objc_msgSend_activate(*((void **)v6 + 3), v22, v23, v24, v25);
    if (qword_1ECEDEE98 != -1)
      dispatch_once(&qword_1ECEDEE98, &unk_1E2953A48);
    v26 = off_1ECEDEE90;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE90, OS_LOG_TYPE_DEBUG))
    {
      v31 = objc_msgSend_devices(*((void **)v6 + 3), v27, v28, v29, v30);
      *(_DWORD *)buf = 138412290;
      v44 = v31;
      _os_log_impl(&dword_18F1DC000, v26, OS_LOG_TYPE_DEBUG, "[CLHidManager] enumerated these devices: %@", buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE98 != -1)
        dispatch_once(&qword_1ECEDEE98, &unk_1E2953A48);
      v37 = objc_msgSend_devices(*((void **)v6 + 3), v33, v34, v35, v36);
      v41 = 138412290;
      v42 = v37;
      v38 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CLHidManager initWithDelegate:queue:]", "CoreLocation: %s\n", v38);
      if (v38 != (char *)buf)
        free(v38);
    }
  }
  return (CLHidManager *)v6;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v14;

  objc_msgSend_cancel(self->_manager, a2, v2, v3, v4);
  objc_msgSend_close(self->_manager, v6, v7, v8, v9);

  objc_msgSend_removeAllObjects(self->_clientDevices, v10, v11, v12, v13);
  v14.receiver = self;
  v14.super_class = (Class)CLHidManager;
  -[CLHidManager dealloc](&v14, sel_dealloc);
}

- (void)sendMonitorUpdateForDevice:(id)a3 added:(BOOL)a4
{
  uint64_t v4;
  NSObject *v8;
  _QWORD block[6];
  BOOL v10;

  v8 = objc_msgSend_delegateQueue(self, a2, (uint64_t)a3, a4, v4);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F446AA0;
  block[3] = &unk_1E29580D8;
  block[4] = self;
  block[5] = a3;
  v10 = a4;
  dispatch_async(v8, block);
}

- (id)createDeviceForMatchingDictionary:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t HidDeviceFromEnumeratedDevicesMatching;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *ClientDeviceMatchingDict;
  CLHidDevice *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;

  HidDeviceFromEnumeratedDevicesMatching = objc_msgSend_getHidDeviceFromEnumeratedDevicesMatching_(self, a2, (uint64_t)a3, v3, v4);
  ClientDeviceMatchingDict = (void *)objc_msgSend_getClientDeviceMatchingDict_(self, v8, (uint64_t)a3, v9, v10);
  if (!ClientDeviceMatchingDict)
  {
    v15 = [CLHidDevice alloc];
    ClientDeviceMatchingDict = (void *)objc_msgSend_initWithHidDevice_matchingDict_(v15, v16, HidDeviceFromEnumeratedDevicesMatching, (uint64_t)a3, v17);
    v22 = (void *)objc_msgSend_clientDevices(self, v18, v19, v20, v21);
    objc_msgSend_addObject_(v22, v23, (uint64_t)ClientDeviceMatchingDict, v24, v25);
    objc_msgSend_activateClientDevice_(self, v26, (uint64_t)ClientDeviceMatchingDict, v27, v28);
    if (!HidDeviceFromEnumeratedDevicesMatching)
      return ClientDeviceMatchingDict;
    goto LABEL_3;
  }
  if (HidDeviceFromEnumeratedDevicesMatching)
LABEL_3:
    objc_msgSend_sendMonitorUpdateForDevice_added_(self, v11, (uint64_t)ClientDeviceMatchingDict, 1, v12);
  return ClientDeviceMatchingDict;
}

- (void)updateClientDeviceWithHidDevice:(id)a3 added:(BOOL)a4
{
  uint64_t v4;
  _BOOL8 v5;
  void *ClientDeviceMatchingHIDDevice;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;

  v5 = a4;
  ClientDeviceMatchingHIDDevice = (void *)objc_msgSend_getClientDeviceMatchingHIDDevice_(self, a2, (uint64_t)a3, a4, v4);
  if (ClientDeviceMatchingHIDDevice)
  {
    v12 = (uint64_t)ClientDeviceMatchingHIDDevice;
    if (v5)
    {
      objc_msgSend_setHidDevice_(ClientDeviceMatchingHIDDevice, v9, (uint64_t)a3, v10, v11);
      objc_msgSend_activateClientDevice_(self, v13, v12, v14, v15);
    }
    else
    {
      objc_msgSend_setHidDevice_(ClientDeviceMatchingHIDDevice, v9, 0, v10, v11);
    }
    objc_msgSend_sendMonitorUpdateForDevice_added_(self, v16, v12, v5, v17);
  }
}

- (void)activateClientDevice:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[7];

  if (objc_msgSend_hidDevice(a3, a2, (uint64_t)a3, v3, v4))
  {
    v11 = (void *)objc_msgSend_hidDevice(a3, v7, v8, v9, v10);
    v16 = objc_msgSend_delegateQueue(self, v12, v13, v14, v15);
    objc_msgSend_setDispatchQueue_(v11, v17, v16, v18, v19);
    v24 = (void *)objc_msgSend_hidDevice(a3, v20, v21, v22, v23);
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = sub_18F446CC4;
    v46[3] = &unk_1E2958128;
    v46[4] = self;
    v46[5] = a3;
    v46[6] = self;
    objc_msgSend_setInputReportHandler_(v24, v25, (uint64_t)v46, v26, v27);
    v32 = (void *)objc_msgSend_hidDevice(a3, v28, v29, v30, v31);
    objc_msgSend_open(v32, v33, v34, v35, v36);
    v41 = (void *)objc_msgSend_hidDevice(a3, v37, v38, v39, v40);
    objc_msgSend_activate(v41, v42, v43, v44, v45);
  }
}

- (id)getClientDeviceMatchingDict:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  char *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  int v28;
  id v29;
  uint8_t buf[4];
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = (void *)objc_msgSend_clientDevices(self, a2, (uint64_t)a3, v3, v4);
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v24, (uint64_t)v32, 16);
  if (v8)
  {
    v13 = v8;
    v14 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v6);
        v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v17 = (void *)objc_msgSend_matching(v16, v9, v10, v11, v12);
        if (objc_msgSend_isEqual_(v17, v18, (uint64_t)a3, v19, v20))
        {
          if (qword_1ECEDEE98 != -1)
            dispatch_once(&qword_1ECEDEE98, &unk_1E2953A48);
          v21 = off_1ECEDEE90;
          if (os_log_type_enabled((os_log_t)off_1ECEDEE90, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v31 = a3;
            _os_log_impl(&dword_18F1DC000, v21, OS_LOG_TYPE_INFO, "[CLHidManager], matched CLHidDevice for %@", buf, 0xCu);
          }
          if (sub_18F1FCA08(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1ECEDEE98 != -1)
              dispatch_once(&qword_1ECEDEE98, &unk_1E2953A48);
            v28 = 138412290;
            v29 = a3;
            v23 = (char *)_os_log_send_and_compose_impl();
            sub_18F419700("Generic", 1, 0, 2, "-[CLHidManager getClientDeviceMatchingDict:]", "CoreLocation: %s\n", v23);
            if (v23 != (char *)buf)
              free(v23);
          }
          return v16;
        }
      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v24, (uint64_t)v32, 16);
      if (v13)
        continue;
      break;
    }
  }
  return 0;
}

- (id)getHidDeviceFromEnumeratedDevicesMatching:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
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
  NSObject *v33;
  char *v34;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  int v45;
  id v46;
  uint8_t buf[4];
  id v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v6 = (void *)objc_msgSend_manager(self, a2, (uint64_t)a3, v3, v4);
  obj = (id)objc_msgSend_devices(v6, v7, v8, v9, v10);
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v41, (uint64_t)v50, 16);
  if (!v12)
    return 0;
  v14 = v12;
  v15 = *(_QWORD *)v42;
  while (1)
  {
    v16 = 0;
LABEL_4:
    if (*(_QWORD *)v42 != v15)
      objc_enumerationMutation(obj);
    v17 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v16);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v13, (uint64_t)&v37, (uint64_t)v49, 16);
    if (!v18)
      break;
    v21 = v18;
    v22 = *(_QWORD *)v38;
LABEL_8:
    v23 = 0;
    while (1)
    {
      if (*(_QWORD *)v38 != v22)
        objc_enumerationMutation(a3);
      v24 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v23);
      v25 = (void *)objc_msgSend_propertyForKey_(v17, v13, v24, v19, v20);
      v29 = objc_msgSend_objectForKey_(a3, v26, v24, v27, v28);
      if (!objc_msgSend_isEqual_(v25, v30, v29, v31, v32))
        break;
      if (v21 == ++v23)
      {
        v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v13, (uint64_t)&v37, (uint64_t)v49, 16);
        if (v21)
          goto LABEL_8;
        goto LABEL_18;
      }
    }
    if (++v16 != v14)
      goto LABEL_4;
    v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v41, (uint64_t)v50, 16);
    v17 = 0;
    if (!v14)
      return v17;
  }
LABEL_18:
  if (qword_1ECEDEE98 != -1)
    dispatch_once(&qword_1ECEDEE98, &unk_1E2953A48);
  v33 = off_1ECEDEE90;
  if (os_log_type_enabled((os_log_t)off_1ECEDEE90, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v48 = a3;
    _os_log_impl(&dword_18F1DC000, v33, OS_LOG_TYPE_INFO, "[CLHidManager], matched device for %@", buf, 0xCu);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE98 != -1)
      dispatch_once(&qword_1ECEDEE98, &unk_1E2953A48);
    v45 = 138412290;
    v46 = a3;
    v34 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CLHidManager getHidDeviceFromEnumeratedDevicesMatching:]", "CoreLocation: %s\n", v34);
    if (v34 != (char *)buf)
      free(v34);
  }
  return v17;
}

- (id)getClientDeviceMatchingHIDDevice:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  id obj;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = (id)objc_msgSend_clientDevices(self, a2, (uint64_t)a3, v3, v4);
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v42, (uint64_t)v47, 16);
  if (!v7)
    return 0;
  v12 = v7;
  v37 = *(_QWORD *)v43;
  do
  {
    v13 = 0;
LABEL_4:
    if (*(_QWORD *)v43 != v37)
      objc_enumerationMutation(obj);
    v14 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v13);
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v15 = (void *)objc_msgSend_matching(v14, v8, v9, v10, v11);
    v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v38, (uint64_t)v46, 16);
    if (!v17)
      break;
    v18 = v17;
    v19 = *(_QWORD *)v39;
LABEL_8:
    v20 = 0;
    while (1)
    {
      if (*(_QWORD *)v39 != v19)
        objc_enumerationMutation(v15);
      v21 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v20);
      v22 = (void *)objc_msgSend_propertyForKey_(a3, v8, v21, v10, v11);
      v27 = (void *)objc_msgSend_matching(v14, v23, v24, v25, v26);
      v31 = objc_msgSend_objectForKey_(v27, v28, v21, v29, v30);
      if (!objc_msgSend_isEqual_(v22, v32, v31, v33, v34))
        break;
      if (v18 == ++v20)
      {
        v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v8, (uint64_t)&v38, (uint64_t)v46, 16);
        if (v18)
          goto LABEL_8;
        return v14;
      }
    }
    if (++v13 != v12)
      goto LABEL_4;
    v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v42, (uint64_t)v47, 16);
    v14 = 0;
  }
  while (v12);
  return v14;
}

- (id)registerForDeviceMatching:(id)a3
{
  return (id)((uint64_t (*)(CLHidManager *, char *, id))MEMORY[0x1E0DE7D20])(self, sel_createDeviceForMatchingDictionary_, a3);
}

- (void)unregisterForDeviceMatching:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = (void *)objc_msgSend_clientDevices(self, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_removeObject_(v6, v7, (uint64_t)a3, v8, v9);
}

- (CLHidManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CLHidManagerDelegate *)a3;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (HIDManager)manager
{
  return self->_manager;
}

- (NSMutableArray)clientDevices
{
  return self->_clientDevices;
}

- (void)setClientDevices:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
