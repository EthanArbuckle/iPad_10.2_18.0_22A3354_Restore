@implementation ICDeviceManager

- (ICDeviceManager)init
{
  ICDeviceManager *v2;
  uint64_t v3;
  NSMutableDictionary *devices;
  uint64_t v5;
  NSDictionary *deviceMatchingInfo;
  NSOperationQueue *v7;
  NSOperationQueue *deviceOperationQueue;
  NSMutableArray *v9;
  NSMutableArray *deviceHandles;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)ICDeviceManager;
  v2 = -[ICDeviceManager init](&v18, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
    devices = v2->_devices;
    v2->_devices = (NSMutableDictionary *)v3;

    v2->_managerIsRunning = 0;
    v2->_managerInvalidationCount = 0;
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", CFSTR("/System/Library/Frameworks/ImageCaptureCore.framework/DeviceMatchingInfo.plist"));
    deviceMatchingInfo = v2->_deviceMatchingInfo;
    v2->_deviceMatchingInfo = (NSDictionary *)v5;

    v7 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    deviceOperationQueue = v2->_deviceOperationQueue;
    v2->_deviceOperationQueue = v7;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_deviceOperationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v2->_deviceOperationQueue, "setQualityOfService:", 25);
    -[NSOperationQueue setName:](v2->_deviceOperationQueue, "setName:", CFSTR("ICDeviceOperationQueue"));
    v2->_deviceOperationQueueSuspended = 0;
    v2->_deviceOperationQueueLock._os_unfair_lock_opaque = 0;
    v2->_deviceHandlesLock._os_unfair_lock_opaque = 0;
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    deviceHandles = v2->_deviceHandles;
    v2->_deviceHandles = v9;

    v2->_controlAuthorizedOnce = 0;
    if (!_gImageIOSupportedFileExtensions)
    {
      v11 = (void *)CGImageSourceCopyTypeExtensions();
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v11);
      v13 = (void *)_gImageIOSupportedFileExtensions;
      _gImageIOSupportedFileExtensions = v12;

    }
    if (!_gKnownRawExtensions)
    {
      v14 = (void *)CGImageSourceCopyTypeExtensions();
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v14);
      v16 = (void *)_gKnownRawExtensions;
      _gKnownRawExtensions = v15;

      objc_msgSend((id)_gKnownRawExtensions, "removeObject:", CFSTR("tif"));
    }
  }
  return v2;
}

- (void)startRunning
{
  if (!self->_managerIsRunning)
  {
    self->_managerIsRunning = 1;
    if (-[ICDeviceManager openRemoteDeviceManager](self, "openRemoteDeviceManager"))
      -[ICDeviceManager getDeviceList](self, "getDeviceList");
  }
}

- (void)stopRunning
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_managerIsRunning)
  {
    self->_managerIsRunning = 0;
    v3 = (void *)-[NSMutableDictionary copy](self->_devices, "copy");
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v3, "allKeys", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "internalUUID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICDeviceManager closeDeviceHandle:](self, "closeDeviceHandle:", v10);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
}

- (void)restartRunning
{
  -[ICDeviceManager stopRunning](self, "stopRunning");
  -[ICDeviceManager startRunning](self, "startRunning");
}

- (void)addSelectorToInterface:(id)a3 selectorString:(id)a4 origin:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v7;
  NSString *v8;
  uint64_t v9;
  SEL v10;
  id v11;

  v5 = a5;
  v7 = addSelectorToInterface_selectorString_origin__onceToken_0;
  v8 = (NSString *)a4;
  v11 = a3;
  if (v7 != -1)
    dispatch_once(&addSelectorToInterface_selectorString_origin__onceToken_0, &__block_literal_global_6);
  v9 = addSelectorToInterface_selectorString_origin__incomingClasses_0;
  v10 = NSSelectorFromString(v8);

  objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v9, v10, 0, v5);
}

void __64__ICDeviceManager_addSelectorToInterface_selectorString_origin___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = objc_alloc(MEMORY[0x1E0C99E60]);
  v12 = objc_opt_class();
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_msgSend(v13, "initWithObjects:", v12, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  v11 = (void *)addSelectorToInterface_selectorString_origin__incomingClasses_0;
  addSelectorToInterface_selectorString_origin__incomingClasses_0 = v10;

}

- (void)openDeviceHandle:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  __CFString *v9;
  _QWORD v10[4];
  void (**v11)(_QWORD);
  _QWORD v12[4];
  id v13;
  ICDeviceManager *v14;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __36__ICDeviceManager_openDeviceHandle___block_invoke;
  v12[3] = &unk_1E70C71C0;
  v6 = v4;
  v13 = v6;
  v14 = self;
  v7 = (void (**)(_QWORD))MEMORY[0x1BCCC74B4](v12);
  +[ICPrefManager defaultAuthManager](ICPrefManager, "defaultAuthManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getContentsAuthorizationStatus");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v9 == CFSTR("ICAuthorizationStatusAuthorized"))
  {
    v7[2](v7);
  }
  else
  {
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __36__ICDeviceManager_openDeviceHandle___block_invoke_2;
    v10[3] = &unk_1E70C7B18;
    v11 = v7;
    objc_msgSend(v8, "requestContentsAuthorizationShouldPrompt:completion:", 1, v10);

  }
}

void __36__ICDeviceManager_openDeviceHandle___block_invoke(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[5];
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  __ICOSLogCreate();
  v2 = CFSTR("device");
  if ((unint64_t)objc_msgSend(CFSTR("device"), "length") >= 0x15)
  {
    objc_msgSend(CFSTR("device"), "substringWithRange:", 0, 18);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingString:", CFSTR(".."));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%12s : %@"), "authorized", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v2);
    v7 = v5;
    *(_DWORD *)buf = 136446466;
    v21 = -[__CFString UTF8String](v6, "UTF8String");
    v22 = 2114;
    v23 = v4;
    _os_log_impl(&dword_1B98FC000, v7, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "devices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(*(id *)(a1 + 40), "remoteManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      __ICOSLogCreate();
      v11 = CFSTR("device");
      if ((unint64_t)objc_msgSend(CFSTR("device"), "length") >= 0x15)
      {
        objc_msgSend(CFSTR("device"), "substringWithRange:", 0, 18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringByAppendingString:", CFSTR(".."));
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%12s : %@"), "opening", *(_QWORD *)(a1 + 32));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v15 = objc_retainAutorelease(v11);
        v16 = v14;
        v17 = -[__CFString UTF8String](v15, "UTF8String");
        *(_DWORD *)buf = 136446466;
        v21 = v17;
        v22 = 2114;
        v23 = v13;
        _os_log_impl(&dword_1B98FC000, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __36__ICDeviceManager_openDeviceHandle___block_invoke_36;
      v19[3] = &unk_1E70C7AF0;
      v18 = *(_QWORD *)(a1 + 32);
      v19[4] = *(_QWORD *)(a1 + 40);
      objc_msgSend(v10, "openDevice:withReply:", v18, v19);
    }

  }
}

void __36__ICDeviceManager_openDeviceHandle___block_invoke_36(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  ICCameraDevice *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  _BYTE *v34;
  uint8_t v35[4];
  uint64_t v36;
  __int16 v37;
  void *v38;
  _BYTE buf[24];
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICDeviceEndpoint"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    __ICOSLogCreate();
    v5 = CFSTR("devEndpoint");
    if ((unint64_t)objc_msgSend(CFSTR("devEndpoint"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("devEndpoint"), "substringWithRange:", 0, 18);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByAppendingString:", CFSTR(".."));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_retainAutorelease(v5);
      v10 = v8;
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = -[__CFString UTF8String](v9, "UTF8String");
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v7;
      _os_log_impl(&dword_1B98FC000, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v40 = __Block_byref_object_copy__2;
    v41 = __Block_byref_object_dispose__2;
    v42 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v4);
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      __ICOSLogCreate();
      if ((unint64_t)objc_msgSend(CFSTR("devConnection"), "length") < 0x15)
      {
        v12 = CFSTR("devConnection");
      }
      else
      {
        objc_msgSend(CFSTR("devConnection"), "substringWithRange:", 0, 18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringByAppendingString:", CFSTR(".."));
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (id)_gICOSLog;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v35 = 136446466;
        v36 = -[__CFString UTF8String](objc_retainAutorelease(v12), "UTF8String");
        v37 = 2114;
        v38 = v13;
        _os_log_impl(&dword_1B98FC000, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", v35, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF23FFE8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF23FFE8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v15, CFSTR("imageCaptureEventNotification:completion:"), 1);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v15, CFSTR("openDeviceSessionWithReply:"), 1);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v15, CFSTR("postNotification:"), 0);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v15, CFSTR("notifyAddedItems:"), 0);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v15, CFSTR("notifyRemovedItems:"), 0);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v15, CFSTR("notifyUpdatedItems:"), 0);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v15, CFSTR("notifyStatus:"), 0);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v15, CFSTR("notifyPtpEvent:"), 0);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v15, CFSTR("registerInterestedEventNotifications:"), 0);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v15, CFSTR("unregisterInterestedEventNotifications:"), 0);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v15, CFSTR("requestReadDataFromObjectHandle:options:withReply:"), 1);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v15, CFSTR("requestThumbnailDataForObjectHandle:options:withReply:"), 1);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v15, CFSTR("requestMetadataForObjectHandle:options:withReply:"), 1);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v15, CFSTR("requestStartUsingDeviceWithReply:"), 1);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v15, CFSTR("requestDownloadObjectHandle:options:withReply:"), 1);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v15, CFSTR("requestDeleteObjectHandle:options:withReply:"), 1);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v15, CFSTR("sendPTPCommand:andPayload:withReply:"), 1);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v15, CFSTR("requestSecurityScopedURLForObjectHandle:withReply:"), 1);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v15, CFSTR("requestFingerprintForObjectHandle:withReply:"), 1);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v15, CFSTR("requestRefreshObjectHandleInfo:withReply:"), 1);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v16, CFSTR("imageCaptureEventNotification:completion:"), 1);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v16, CFSTR("openDeviceSessionWithReply:"), 1);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v16, CFSTR("postNotification:"), 0);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v16, CFSTR("notifyAddedItems:"), 0);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v16, CFSTR("notifyRemovedItems:"), 0);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v16, CFSTR("notifyUpdatedItems:"), 0);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v16, CFSTR("notifyStatus:"), 0);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v16, CFSTR("notifyPtpEvent:"), 0);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v16, CFSTR("registerInterestedEventNotifications:"), 0);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v16, CFSTR("unregisterInterestedEventNotifications:"), 0);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v16, CFSTR("requestThumbnailDataForObjectHandle:options:withReply:"), 1);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v16, CFSTR("requestMetadataForObjectHandle:options:withReply:"), 1);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v16, CFSTR("requestDownloadObjectHandle:options:withReply:"), 1);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v16, CFSTR("requestStartUsingDeviceWithReply:"), 1);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v16, CFSTR("requestDeleteObjectHandle:options:withReply:"), 1);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v16, CFSTR("requestReadDataFromObjectHandle:options:withReply:"), 1);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v16, CFSTR("sendPTPCommand:andPayload:withReply:"), 1);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v16, CFSTR("requestSecurityScopedURLForObjectHandle:withReply:"), 1);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v16, CFSTR("requestFingerprintForObjectHandle:withReply:"), 1);
      objc_msgSend(*(id *)(a1 + 32), "addSelectorToInterface:selectorString:origin:", v16, CFSTR("requestRefreshObjectHandleInfo:withReply:"), 1);
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICInternalDeviceUUID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      do
        v19 = __ldaxr((unsigned int *)&NextDeviceHandle__sLastDeviceHandle);
      while (__stlxr(v19 + 1, (unsigned int *)&NextDeviceHandle__sLastDeviceHandle));
      v20 = atomic_load((unsigned int *)&NextDeviceHandle__sLastDeviceHandle);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("ICADeviceBrowserDeviceRefKey"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v22, CFSTR("ICAConnectionIDKey"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v23, CFSTR("objectID"));

      objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, CFSTR("UUIDString"));
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, CFSTR("persistentIDString"));
      v24 = -[ICCameraDevice initWithDictionary:]([ICCameraDevice alloc], "initWithDictionary:", v18);
      v25 = *(id *)(a1 + 32);
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __36__ICDeviceManager_openDeviceHandle___block_invoke_136;
      v32[3] = &unk_1E70C7AC8;
      v32[4] = v25;
      v26 = v17;
      v33 = v26;
      v34 = buf;
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setInvalidationHandler:", v32);
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "invalidationHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setInterruptionHandler:", v27);

      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setExportedInterface:", v15);
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setRemoteObjectInterface:", v16);
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setExportedObject:", *(_QWORD *)(a1 + 32));
      -[ICCameraDevice setDevConnection:](v24, "setDevConnection:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
      -[ICCameraDevice setDevEndpoint:](v24, "setDevEndpoint:", v4);
      -[ICDevice setDeviceManager:](v24, "setDeviceManager:", *(_QWORD *)(a1 + 32));
      -[ICDevice setInternalUUID:](v24, "setInternalUUID:", v26);
      objc_msgSend(*(id *)(a1 + 32), "devices");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v24, v26);

      -[ICCameraDevice devConnection](v24, "devConnection");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "resume");

      v30 = *(void **)(a1 + 32);
      -[ICDevice internalUUID](v24, "internalUUID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "startDeviceWithHandle:", v31);

    }
    _Block_object_dispose(buf, 8);

  }
}

void __36__ICDeviceManager_openDeviceHandle___block_invoke_136(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = *(id *)(a1 + 32);
  v8 = v2;
  if (v2)
  {
    objc_msgSend(v2, "devices");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      objc_msgSend(v4, "executeConnectionFailureBlock");

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setInterruptionHandler:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "invalidate");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

void __36__ICDeviceManager_openDeviceHandle___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("ICAuthorizationStatus"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("ICAuthorizationStatusAuthorized")))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getDeviceList
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(9, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__ICDeviceManager_getDeviceList__block_invoke;
  block[3] = &unk_1E70C7198;
  block[4] = self;
  dispatch_async(v3, block);

}

void __32__ICDeviceManager_getDeviceList__block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  dispatch_time_t v4;
  _QWORD v5[5];
  NSObject *v6;

  v2 = dispatch_semaphore_create(0);
  objc_msgSend(*(id *)(a1 + 32), "remoteManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __32__ICDeviceManager_getDeviceList__block_invoke_2;
    v5[3] = &unk_1E70C7280;
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v2;
    objc_msgSend(v3, "requestDeviceListWithOptions:reply:", &unk_1E70DBF20, v5);

  }
  v4 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v2, v4);

}

intptr_t __32__ICDeviceManager_getDeviceList__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  if (a2)
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("ICDeviceContexts"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __32__ICDeviceManager_getDeviceList__block_invoke_3;
    v7[3] = &unk_1E70C71C0;
    v4 = *(_QWORD *)(a1 + 32);
    v8 = v3;
    v9 = v4;
    v5 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __32__ICDeviceManager_getDeviceList__block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "notifyAddedDevice:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)notifyAddedDevice:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  os_unfair_lock_s *p_deviceHandlesLock;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  ICDeviceManager *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __ICOSLogCreate();
  v5 = CFSTR("notifyAddedDevice");
  if ((unint64_t)objc_msgSend(CFSTR("notifyAddedDevice"), "length") >= 0x15)
  {
    objc_msgSend(CFSTR("notifyAddedDevice"), "substringWithRange:", 0, 18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingString:", CFSTR(".."));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_retainAutorelease(v5);
    v10 = v8;
    *(_DWORD *)buf = 136446466;
    v30 = -[__CFString UTF8String](v9, "UTF8String");
    v31 = 2114;
    v32 = v7;
    _os_log_impl(&dword_1B98FC000, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  p_deviceHandlesLock = &self->_deviceHandlesLock;
  os_unfair_lock_lock(&self->_deviceHandlesLock);
  v23 = self;
  v12 = (void *)-[NSMutableArray copy](self->_deviceHandles, "copy");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v25;
    while (2)
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v17), "objectForKeyedSubscript:", CFSTR("ICDeviceHandle"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICDeviceHandle"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqualToString:", v19);

        if ((v20 & 1) != 0)
        {
          v21 = v13;
          goto LABEL_15;
        }
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v15)
        continue;
      break;
    }
  }

  -[NSMutableArray addObject:](v23->_deviceHandles, "addObject:", v4);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v23, CFSTR("ICDeviceDelegate"));
  SharedICDeviceHardwareHandler();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addDeviceContext:", v21);

LABEL_15:
  os_unfair_lock_unlock(p_deviceHandlesLock);

}

- (void)notifyRemovedDevice:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  ICDeviceManager *v16;
  os_unfair_lock_t lock;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  lock = &self->_deviceHandlesLock;
  os_unfair_lock_lock(&self->_deviceHandlesLock);
  v16 = self;
  v5 = (void *)-[NSMutableArray copy](self->_deviceHandles, "copy");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ICDeviceHandle"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICDeviceHandle"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToString:", v13);

        if (v14)
        {
          -[NSMutableArray removeObject:](v16->_deviceHandles, "removeObject:", v11);

          os_unfair_lock_unlock(lock);
          SharedICDeviceHardwareHandler();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "removeDeviceContext:", v4);

          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
        continue;
      break;
    }
  }

  os_unfair_lock_unlock(lock);
LABEL_11:

}

- (void)closeDeviceHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[2];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1BCCC7334]();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    __ICOSLogCreate();
    v7 = CFSTR("device");
    if ((unint64_t)objc_msgSend(CFSTR("device"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("device"), "substringWithRange:", 0, 18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByAppendingString:", CFSTR(".."));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("removing device: %@"), v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_retainAutorelease(v7);
      v12 = v10;
      *(_DWORD *)buf = 136446466;
      v17 = -[__CFString UTF8String](v11, "UTF8String");
      v18 = 2114;
      v19 = v9;
      _os_log_impl(&dword_1B98FC000, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    -[NSMutableDictionary removeObjectForKey:](self->_devices, "removeObjectForKey:", v4);
    v14[0] = CFSTR("device");
    v14[1] = CFSTR("type");
    v15[0] = v6;
    v15[1] = CFSTR("ICDeviceRemoved");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDeviceManager performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_postNotification_, v13, 0);

  }
  objc_autoreleasePoolPop(v5);

}

- (void)closeDeviceImp:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("device"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "internalUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDeviceManager closeDeviceHandle:](self, "closeDeviceHandle:", v5);

    v4 = v6;
  }

}

- (void)openSessionImp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("device"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("options"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("info"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cbBlock"));
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v5, CFSTR("device"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isAccessRestrictedAppleDevice"))
    v10 = -9943;
  else
    v10 = 0;
  if ((objc_msgSend(v5, "hasOpenSession") & 1) != 0)
  {
    v10 = -21347;
  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ICEnumerationPrioritizeTethering"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11
      || (v12 = (void *)v11,
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ICEnumerationPrioritizeTethering")),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "BOOLValue"),
          v13,
          v12,
          (v14 & 1) == 0))
    {
      v15 = (void *)MEMORY[0x1E0CB34C8];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __34__ICDeviceManager_openSessionImp___block_invoke;
      v18[3] = &unk_1E70C71C0;
      v19 = v5;
      v20 = v6;
      objc_msgSend(v15, "blockOperationWithBlock:", v18);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDeviceManager addInteractiveOperation:](self, "addInteractiveOperation:", v16);

    }
  }
  if (v7)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("info"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, CFSTR("errCode"));

  if (v8)
    ((void (**)(_QWORD, void *, void *))v8)[2](v8, v5, v9);

}

void __34__ICDeviceManager_openSessionImp___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "remoteCamera");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateContentWithOptions:", *(_QWORD *)(a1 + 40));

}

- (void)enumerateContentImp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("device"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("options"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("info"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cbBlock"));
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v5, CFSTR("device"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "hasOpenSession"))
  {
    v12 = -9927;
    if (!v7)
      goto LABEL_6;
    goto LABEL_5;
  }
  v10 = (void *)MEMORY[0x1E0CB34C8];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __39__ICDeviceManager_enumerateContentImp___block_invoke;
  v14[3] = &unk_1E70C71C0;
  v15 = v5;
  v16 = v6;
  objc_msgSend(v10, "blockOperationWithBlock:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDeviceManager addInteractiveOperation:](self, "addInteractiveOperation:", v11);

  v12 = 0;
  if (v7)
LABEL_5:
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("info"));
LABEL_6:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("errCode"));

  if (v8)
    ((void (**)(_QWORD, void *, void *))v8)[2](v8, v5, v9);

}

void __39__ICDeviceManager_enumerateContentImp___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "remoteCamera");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateContentWithOptions:", *(_QWORD *)(a1 + 40));

}

- (void)closeSessionImp:(id)a3
{
  id v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("device"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("info"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("cbBlock"));
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v9, CFSTR("device"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "hasOpenSession"))
    v7 = 0;
  else
    v7 = -9928;
  if (v4)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, CFSTR("info"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("errCode"));

  if (v5)
    ((void (**)(_QWORD, id, void *))v5)[2](v5, v9, v6);

}

- (id)deviceManagerConnection
{
  return 0;
}

- (id)remoteManager
{
  uint64_t v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  -[ICDeviceManager managerConnection](self, "managerConnection");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0;
  v4 = (void *)v3;
  v5 = -[ICDeviceManager managerInvalidationCount](self, "managerInvalidationCount");

  if (v5 > 4)
    return 0;
  -[ICDeviceManager managerConnection](self, "managerConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __32__ICDeviceManager_remoteManager__block_invoke;
  v9[3] = &unk_1E70C7150;
  v9[4] = self;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __32__ICDeviceManager_remoteManager__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    __ICOSLogCreate();
    v4 = CFSTR("remoteManager");
    if ((unint64_t)objc_msgSend(CFSTR("remoteManager"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("remoteManager"), "substringWithRange:", 0, 18);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByAppendingString:", CFSTR(".."));
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_retainAutorelease(v4);
      v9 = v7;
      *(_DWORD *)buf = 136446466;
      v11 = -[__CFString UTF8String](v8, "UTF8String");
      v12 = 2114;
      v13 = v6;
      _os_log_impl(&dword_1B98FC000, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    if (objc_msgSend(v3, "code") == 4099)
      objc_msgSend(*(id *)(a1 + 32), "setManagerInvalidationCount:", objc_msgSend(*(id *)(a1 + 32), "managerInvalidationCount") + 1);
  }

}

- (BOOL)openRemoteDeviceManager
{
  void *v3;
  void *v4;
  void *v5;
  ICDeviceManager *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  ICDeviceManager *v13;
  ICDeviceManager *v14;

  -[ICDeviceManager deviceManagerConnection](self, "deviceManagerConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF240048);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF240048);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDeviceManager addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v4, CFSTR("notifyAddedDevice:"), 0);
    -[ICDeviceManager addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v4, CFSTR("notifyRemovedDevice:"), 0);
    -[ICDeviceManager addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v5, CFSTR("requestDeviceListWithOptions:reply:"), 1);
    -[ICDeviceManager addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v5, CFSTR("openDevice:withReply:"), 1);
    -[ICDeviceManager addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v5, CFSTR("closeDevice:withReply:"), 1);
    objc_msgSend(v3, "setExportedInterface:", v4);
    objc_msgSend(v3, "setRemoteObjectInterface:", v5);
    objc_msgSend(v3, "setExportedObject:", self);
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __42__ICDeviceManager_openRemoteDeviceManager__block_invoke;
    v12 = &unk_1E70C71C0;
    v13 = self;
    v14 = self;
    v6 = self;
    objc_msgSend(v3, "setInvalidationHandler:", &v9);
    objc_msgSend(v3, "invalidationHandler", v9, v10, v11, v12, v13, v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setInterruptionHandler:", v7);

    -[ICDeviceManager setManagerConnection:](v6, "setManagerConnection:", v3);
    objc_msgSend(v3, "resume");

  }
  return v3 != 0;
}

void __42__ICDeviceManager_openRemoteDeviceManager__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  double v29;
  dispatch_time_t v30;
  id obj;
  id v32;
  uint64_t v33;
  _QWORD block[5];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  const __CFString *v39;
  uint64_t v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v1 = a1;
  v46 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(v1 + 40), "devices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v6)
  {
    v7 = v6;
    v8 = CFSTR("Device ▼");
    v9 = *(_QWORD *)v36;
    v10 = 0x1E0CB3000uLL;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(obj);
        v33 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        __ICOSLogCreate();
        v32 = v8;
        if ((unint64_t)-[__CFString length](v8, "length") >= 0x15)
        {
          -[__CFString substringWithRange:](v8, "substringWithRange:", 0, 18);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringByAppendingString:", CFSTR(".."));
          v32 = (id)objc_claimAutoreleasedReturnValue();

        }
        v13 = *(void **)(v10 + 2368);
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ - %@"), v15, v33);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          v18 = v10;
          v19 = v8;
          v20 = v7;
          v21 = v9;
          v22 = v1;
          v23 = v2;
          v24 = objc_retainAutorelease(v32);
          v25 = v17;
          v26 = v24;
          v2 = v23;
          v1 = v22;
          v9 = v21;
          v7 = v20;
          v8 = v19;
          v10 = v18;
          v27 = objc_msgSend(v26, "UTF8String");
          *(_DWORD *)buf = 136446466;
          v42 = v27;
          v43 = 2114;
          v44 = v16;
          _os_log_impl(&dword_1B98FC000, v25, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

        }
        v39 = CFSTR("ICDeviceHandle");
        v40 = v33;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "notifyRemovedDevice:", v28);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v7);
  }

  objc_msgSend(v2, "setManagerConnection:", 0);
  v29 = drand48();
  v30 = dispatch_time(0, (uint64_t)(v29 + 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__ICDeviceManager_openRemoteDeviceManager__block_invoke_197;
  block[3] = &unk_1E70C7198;
  block[4] = *(_QWORD *)(v1 + 40);
  dispatch_after(v30, MEMORY[0x1E0C80D38], block);

}

uint64_t __42__ICDeviceManager_openRemoteDeviceManager__block_invoke_197(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "restartRunning");
}

- (void)dealloc
{
  objc_super v3;

  -[ICDeviceManager resumeOperations](self, "resumeOperations");
  -[NSOperationQueue cancelAllOperations](self->_deviceOperationQueue, "cancelAllOperations");
  -[NSOperationQueue waitUntilAllOperationsAreFinished](self->_deviceOperationQueue, "waitUntilAllOperationsAreFinished");
  v3.receiver = self;
  v3.super_class = (Class)ICDeviceManager;
  -[ICDeviceManager dealloc](&v3, sel_dealloc);
}

- (id)deviceForConnection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSMutableDictionary allKeys](self->_devices, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "devConnection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if (v13)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (id)deviceForUUID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSMutableDictionary allKeys](self->_devices, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "internalUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if (v13)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (int64_t)openDevice:(id)a3 contextInfo:(void *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v17[0] = a3;
  v16[0] = CFSTR("params");
  v16[1] = CFSTR("info");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithUnsignedLong:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB34C8];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __42__ICDeviceManager_openDevice_contextInfo___block_invoke;
  v14[3] = &unk_1E70C71C0;
  v14[4] = self;
  v15 = v9;
  v11 = v9;
  objc_msgSend(v10, "blockOperationWithBlock:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDeviceManager addInteractiveOperation:](self, "addInteractiveOperation:", v12);

  return 0;
}

uint64_t __42__ICDeviceManager_openDevice_contextInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "openDeviceImp:", *(_QWORD *)(a1 + 40));
}

- (int64_t)closeDevice:(id)a3 contextInfo:(void *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v17[0] = a3;
  v16[0] = CFSTR("device");
  v16[1] = CFSTR("info");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithUnsignedLong:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB34C8];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __43__ICDeviceManager_closeDevice_contextInfo___block_invoke;
  v14[3] = &unk_1E70C71C0;
  v14[4] = self;
  v15 = v9;
  v11 = v9;
  objc_msgSend(v10, "blockOperationWithBlock:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDeviceManager addInteractiveOperation:](self, "addInteractiveOperation:", v12);

  return 0;
}

uint64_t __43__ICDeviceManager_closeDevice_contextInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "closeDeviceImp:", *(_QWORD *)(a1 + 40));
}

- (int64_t)getFileThumbnail:(id)a3 fromDevice:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v21[0] = CFSTR("file");
  v21[1] = CFSTR("device");
  v22[0] = a3;
  v22[1] = a4;
  v21[2] = CFSTR("cbBlock");
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(a6, "copy");
  v21[3] = CFSTR("options");
  v22[2] = v13;
  v22[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CB34C8];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __70__ICDeviceManager_getFileThumbnail_fromDevice_withOptions_completion___block_invoke;
  v19[3] = &unk_1E70C71C0;
  v19[4] = self;
  v20 = v14;
  v16 = v14;
  objc_msgSend(v15, "blockOperationWithBlock:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDeviceManager addInteractiveOperation:](self, "addInteractiveOperation:", v17);

  return 0;
}

uint64_t __70__ICDeviceManager_getFileThumbnail_fromDevice_withOptions_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "getFileThumbnailImp:", *(_QWORD *)(a1 + 40));
}

- (int64_t)getFileMetadata:(id)a3 fromDevice:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v19[0] = CFSTR("file");
  v19[1] = CFSTR("device");
  v20[0] = a3;
  v20[1] = a4;
  v19[2] = CFSTR("cbBlock");
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(a6, "copy");
  v20[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB34C8];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __69__ICDeviceManager_getFileMetadata_fromDevice_withOptions_completion___block_invoke;
  v17[3] = &unk_1E70C71C0;
  v17[4] = self;
  v18 = v12;
  v14 = v12;
  objc_msgSend(v13, "blockOperationWithBlock:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDeviceManager addInteractiveOperation:](self, "addInteractiveOperation:", v15);

  return 0;
}

uint64_t __69__ICDeviceManager_getFileMetadata_fromDevice_withOptions_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "getFileMetadataImp:", *(_QWORD *)(a1 + 40));
}

- (int64_t)getFileData:(id)a3 fromDevice:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v21[0] = CFSTR("file");
  v21[1] = CFSTR("device");
  v22[0] = a3;
  v22[1] = a4;
  v21[2] = CFSTR("cbBlock");
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(a6, "copy");
  v21[3] = CFSTR("options");
  v22[2] = v13;
  v22[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CB34C8];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __65__ICDeviceManager_getFileData_fromDevice_withOptions_completion___block_invoke;
  v19[3] = &unk_1E70C71C0;
  v19[4] = self;
  v20 = v14;
  v16 = v14;
  objc_msgSend(v15, "blockOperationWithBlock:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDeviceManager addInteractiveOperation:](self, "addInteractiveOperation:", v17);

  return 0;
}

uint64_t __65__ICDeviceManager_getFileData_fromDevice_withOptions_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "getFileDataImp:", *(_QWORD *)(a1 + 40));
}

- (int64_t)openSession:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v9 = (id)MEMORY[0x1E0C9AA70];
  if (a4)
    v9 = a4;
  v21[0] = CFSTR("device");
  v21[1] = CFSTR("options");
  v22[0] = a3;
  v22[1] = v9;
  v21[2] = CFSTR("cbBlock");
  v10 = v9;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(a5, "copy");
  v22[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CB34C8];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __54__ICDeviceManager_openSession_withOptions_completion___block_invoke;
  v19[3] = &unk_1E70C71C0;
  v19[4] = self;
  v20 = v14;
  v16 = v14;
  objc_msgSend(v15, "blockOperationWithBlock:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDeviceManager addInteractiveOperation:](self, "addInteractiveOperation:", v17);

  return 0;
}

uint64_t __54__ICDeviceManager_openSession_withOptions_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "openSessionImp:", *(_QWORD *)(a1 + 40));
}

- (int64_t)enumerateContent:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v9 = (id)MEMORY[0x1E0C9AA70];
  if (a4)
    v9 = a4;
  v21[0] = CFSTR("device");
  v21[1] = CFSTR("options");
  v22[0] = a3;
  v22[1] = v9;
  v21[2] = CFSTR("cbBlock");
  v10 = v9;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(a5, "copy");
  v22[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CB34C8];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __59__ICDeviceManager_enumerateContent_withOptions_completion___block_invoke;
  v19[3] = &unk_1E70C71C0;
  v19[4] = self;
  v20 = v14;
  v16 = v14;
  objc_msgSend(v15, "blockOperationWithBlock:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDeviceManager addInteractiveOperation:](self, "addInteractiveOperation:", v17);

  return 0;
}

uint64_t __59__ICDeviceManager_enumerateContent_withOptions_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enumerateContentImp:", *(_QWORD *)(a1 + 40));
}

- (int64_t)closeSession:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v17[0] = a3;
  v16[0] = CFSTR("device");
  v16[1] = CFSTR("cbBlock");
  v7 = a3;
  v8 = (void *)objc_msgSend(a5, "copy");
  v17[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB34C8];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__ICDeviceManager_closeSession_withOptions_completion___block_invoke;
  v14[3] = &unk_1E70C71C0;
  v14[4] = self;
  v15 = v9;
  v11 = v9;
  objc_msgSend(v10, "blockOperationWithBlock:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDeviceManager addInteractiveOperation:](self, "addInteractiveOperation:", v12);

  return 0;
}

uint64_t __55__ICDeviceManager_closeSession_withOptions_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "closeSessionImp:", *(_QWORD *)(a1 + 40));
}

- (int64_t)syncClock:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v16[0] = a3;
  v15[0] = CFSTR("device");
  v15[1] = CFSTR("cbBlock");
  v6 = a3;
  v7 = (void *)objc_msgSend(a4, "copy");
  v16[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB34C8];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __40__ICDeviceManager_syncClock_completion___block_invoke;
  v13[3] = &unk_1E70C71C0;
  v13[4] = self;
  v14 = v8;
  v10 = v8;
  objc_msgSend(v9, "blockOperationWithBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDeviceManager addInitiatedOperation:](self, "addInitiatedOperation:", v11);

  return 0;
}

uint64_t __40__ICDeviceManager_syncClock_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "syncClockImp:", *(_QWORD *)(a1 + 40));
}

- (int64_t)deleteFile:(id)a3 fromDevice:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("file");
  v18[1] = CFSTR("device");
  v19[0] = a3;
  v19[1] = a4;
  v18[2] = CFSTR("cbBlock");
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(a5, "copy");
  v19[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB34C8];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __52__ICDeviceManager_deleteFile_fromDevice_completion___block_invoke;
  v16[3] = &unk_1E70C71C0;
  v16[4] = self;
  v17 = v11;
  v13 = v11;
  objc_msgSend(v12, "blockOperationWithBlock:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDeviceManager addInteractiveOperation:](self, "addInteractiveOperation:", v14);

  return 0;
}

uint64_t __52__ICDeviceManager_deleteFile_fromDevice_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteFileImp:", *(_QWORD *)(a1 + 40));
}

- (int64_t)downloadFile:(id)a3 fromDevice:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v21[0] = CFSTR("file");
  v21[1] = CFSTR("device");
  v22[0] = a3;
  v22[1] = a4;
  v22[2] = a5;
  v21[2] = CFSTR("opts");
  v21[3] = CFSTR("cbBlock");
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(a6, "copy");
  v22[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CB34C8];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __66__ICDeviceManager_downloadFile_fromDevice_withOptions_completion___block_invoke;
  v19[3] = &unk_1E70C71C0;
  v19[4] = self;
  v20 = v14;
  v16 = v14;
  objc_msgSend(v15, "blockOperationWithBlock:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDeviceManager addInteractiveOperation:](self, "addInteractiveOperation:", v17);

  return 0;
}

uint64_t __66__ICDeviceManager_downloadFile_fromDevice_withOptions_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "downloadFileImp:", *(_QWORD *)(a1 + 40));
}

- (int64_t)sendDevice:(id)a3 ptpCommand:(id)a4 andPayload:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void (**v20)(_QWORD);
  void *v21;
  void *v22;
  int v23;
  _QWORD v25[5];
  void (**v26)(_QWORD);
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  ICDeviceManager *v31;
  id v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __63__ICDeviceManager_sendDevice_ptpCommand_andPayload_completion___block_invoke;
  v27[3] = &unk_1E70C7B40;
  v15 = v10;
  v28 = v15;
  v16 = v11;
  v29 = v16;
  v17 = v13;
  v32 = v17;
  v18 = v12;
  v30 = v18;
  v31 = self;
  v19 = MEMORY[0x1BCCC74B4](v27);
  v20 = (void (**)(_QWORD))v19;
  if (self->_controlAuthorizedOnce)
  {
    (*(void (**)(uint64_t))(v19 + 16))(v19);
  }
  else
  {
    +[ICPrefManager defaultAuthManager](ICPrefManager, "defaultAuthManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "getControlAuthorizationStatus");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("ICAuthorizationStatusAuthorized"));

    if (v23)
    {
      v20[2](v20);
      -[ICDeviceManager setControlAuthorizedOnce:](self, "setControlAuthorizedOnce:", 1);
    }
    else
    {
      v25[0] = v14;
      v25[1] = 3221225472;
      v25[2] = __63__ICDeviceManager_sendDevice_ptpCommand_andPayload_completion___block_invoke_3;
      v25[3] = &unk_1E70C7B68;
      v25[4] = self;
      v26 = v20;
      objc_msgSend(v21, "requestControlAuthorizationShouldPrompt:completion:", 1, v25);

    }
  }

  return 0;
}

void __63__ICDeviceManager_sendDevice_ptpCommand_andPayload_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v2 = (void *)MEMORY[0x1E0C99E08];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = (void *)objc_msgSend(*(id *)(a1 + 64), "copy");
  objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("device"), v4, CFSTR("ICPTPCommandBuffer"), v5, CFSTR("cbBlock"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("ICPTPDataBuffer"));
  v8 = *(void **)(a1 + 56);
  v9 = (void *)MEMORY[0x1E0CB34C8];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__ICDeviceManager_sendDevice_ptpCommand_andPayload_completion___block_invoke_2;
  v12[3] = &unk_1E70C71C0;
  v12[4] = v8;
  v13 = v6;
  v10 = v6;
  objc_msgSend(v9, "blockOperationWithBlock:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addInteractiveOperation:", v11);

}

uint64_t __63__ICDeviceManager_sendDevice_ptpCommand_andPayload_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendDevicePTPCommandImp:", *(_QWORD *)(a1 + 40));
}

void __63__ICDeviceManager_sendDevice_ptpCommand_andPayload_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("ICAuthorizationStatus"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("ICAuthorizationStatusAuthorized")))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "setControlAuthorizedOnce:", 1);
  }

}

- (int64_t)registerDevice:(id)a3 forImageCaptureEventNotifications:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CB34C8];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__ICDeviceManager_registerDevice_forImageCaptureEventNotifications___block_invoke;
  v13[3] = &unk_1E70C7630;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "blockOperationWithBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDeviceManager addInteractiveOperation:](self, "addInteractiveOperation:", v11);

  return 0;
}

uint64_t __68__ICDeviceManager_registerDevice_forImageCaptureEventNotifications___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerDevice:forImageCaptureEventNotificationsImp:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (int64_t)unregisterDevice:(id)a3 forImageCaptureEventNotifications:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CB34C8];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__ICDeviceManager_unregisterDevice_forImageCaptureEventNotifications___block_invoke;
  v13[3] = &unk_1E70C7630;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "blockOperationWithBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDeviceManager addInteractiveOperation:](self, "addInteractiveOperation:", v11);

  return 0;
}

uint64_t __70__ICDeviceManager_unregisterDevice_forImageCaptureEventNotifications___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unregisterDevice:forImageCaptureEventNotificationsImp:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (int64_t)ejectDevice:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v16[0] = a3;
  v15[0] = CFSTR("device");
  v15[1] = CFSTR("cbBlock");
  v6 = a3;
  v7 = (void *)objc_msgSend(a4, "copy");
  v16[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB34C8];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __42__ICDeviceManager_ejectDevice_completion___block_invoke;
  v13[3] = &unk_1E70C71C0;
  v13[4] = self;
  v14 = v8;
  v10 = v8;
  objc_msgSend(v9, "blockOperationWithBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDeviceManager addInteractiveOperation:](self, "addInteractiveOperation:", v11);

  return 0;
}

uint64_t __42__ICDeviceManager_ejectDevice_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "ejectImp:", *(_QWORD *)(a1 + 40));
}

- (int64_t)getSecurityScopedURL:(id)a3 fromDevice:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("file");
  v18[1] = CFSTR("device");
  v19[0] = a3;
  v19[1] = a4;
  v18[2] = CFSTR("cbBlock");
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(a5, "copy");
  v19[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB34C8];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __62__ICDeviceManager_getSecurityScopedURL_fromDevice_completion___block_invoke;
  v16[3] = &unk_1E70C71C0;
  v16[4] = self;
  v17 = v11;
  v13 = v11;
  objc_msgSend(v12, "blockOperationWithBlock:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDeviceManager addInteractiveOperation:](self, "addInteractiveOperation:", v14);

  return 0;
}

uint64_t __62__ICDeviceManager_getSecurityScopedURL_fromDevice_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "getSecurityScopedURLImp:", *(_QWORD *)(a1 + 40));
}

- (int64_t)refreshObjectHandleInfo:(id)a3 fromDevice:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("file");
  v18[1] = CFSTR("device");
  v19[0] = a3;
  v19[1] = a4;
  v18[2] = CFSTR("cbBlock");
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(a5, "copy");
  v19[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB34C8];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65__ICDeviceManager_refreshObjectHandleInfo_fromDevice_completion___block_invoke;
  v16[3] = &unk_1E70C71C0;
  v16[4] = self;
  v17 = v11;
  v13 = v11;
  objc_msgSend(v12, "blockOperationWithBlock:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDeviceManager addInteractiveOperation:](self, "addInteractiveOperation:", v14);

  return 0;
}

uint64_t __65__ICDeviceManager_refreshObjectHandleInfo_fromDevice_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "refreshObjectHandleInfoImp:", *(_QWORD *)(a1 + 40));
}

- (int64_t)getFingerprint:(id)a3 fromDevice:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("file");
  v18[1] = CFSTR("device");
  v19[0] = a3;
  v19[1] = a4;
  v18[2] = CFSTR("cbBlock");
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(a5, "copy");
  v19[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB34C8];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __56__ICDeviceManager_getFingerprint_fromDevice_completion___block_invoke;
  v16[3] = &unk_1E70C71C0;
  v16[4] = self;
  v17 = v11;
  v13 = v11;
  objc_msgSend(v12, "blockOperationWithBlock:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDeviceManager addInteractiveOperation:](self, "addInteractiveOperation:", v14);

  return 0;
}

uint64_t __56__ICDeviceManager_getFingerprint_fromDevice_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "getFingerprintImp:", *(_QWORD *)(a1 + 40));
}

- (void)postCommandCompletionNotification:(id)a3
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__ICDeviceManager_postCommandCompletionNotification___block_invoke;
  block[3] = &unk_1E70C7198;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __53__ICDeviceManager_postCommandCompletionNotification___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("ICCommandCompletionNotification"), 0, *(_QWORD *)(a1 + 32));

}

- (void)postNotification:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD block[4];
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __ICOSLogCreate();
  v5 = CFSTR("post");
  if ((unint64_t)objc_msgSend(CFSTR("post"), "length") >= 0x15)
  {
    objc_msgSend(CFSTR("post"), "substringWithRange:", 0, 18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingString:", CFSTR(".."));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Device Posted: %@"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_retainAutorelease(v5);
    v10 = v8;
    *(_DWORD *)buf = 136446466;
    v19 = -[__CFString UTF8String](v9, "UTF8String");
    v20 = 2114;
    v21 = v7;
    _os_log_impl(&dword_1B98FC000, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  v11 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ICInternalDeviceUUID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("device"));

    }
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__ICDeviceManager_postNotification___block_invoke;
  block[3] = &unk_1E70C7198;
  v17 = v11;
  v15 = v11;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __36__ICDeviceManager_postNotification___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("ICEventNotification"), 0, *(_QWORD *)(a1 + 32));

}

- (void)addInitiatedOperation:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setQueuePriority:", 0);
  objc_msgSend(v4, "setQualityOfService:", 25);
  -[NSOperationQueue addOperation:](self->_deviceOperationQueue, "addOperation:", v4);

}

- (void)addInteractiveOperation:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setQueuePriority:", 4);
  objc_msgSend(v4, "setQualityOfService:", 33);
  -[NSOperationQueue addOperation:](self->_deviceOperationQueue, "addOperation:", v4);

}

- (void)suspendOperations
{
  os_unfair_lock_s *p_deviceOperationQueueLock;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  p_deviceOperationQueueLock = &self->_deviceOperationQueueLock;
  os_unfair_lock_lock(&self->_deviceOperationQueueLock);
  if (!self->_deviceOperationQueueSuspended)
  {
    __ICOSLogCreate();
    v4 = CFSTR("Restriction");
    if ((unint64_t)objc_msgSend(CFSTR("Restriction"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("Restriction"), "substringWithRange:", 0, 18);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByAppendingString:", CFSTR(".."));
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Removing device access: backgrounded"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_retainAutorelease(v4);
      v9 = v7;
      v10 = 136446466;
      v11 = -[__CFString UTF8String](v8, "UTF8String");
      v12 = 2114;
      v13 = v6;
      _os_log_impl(&dword_1B98FC000, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v10, 0x16u);

    }
    self->_deviceOperationQueueSuspended = 1;
    -[NSOperationQueue setSuspended:](self->_deviceOperationQueue, "setSuspended:", 1);
  }
  os_unfair_lock_unlock(p_deviceOperationQueueLock);
}

- (void)resumeOperations
{
  os_unfair_lock_s *p_deviceOperationQueueLock;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  p_deviceOperationQueueLock = &self->_deviceOperationQueueLock;
  os_unfair_lock_lock(&self->_deviceOperationQueueLock);
  if (self->_deviceOperationQueueSuspended)
  {
    __ICOSLogCreate();
    v4 = CFSTR("Restriction");
    if ((unint64_t)objc_msgSend(CFSTR("Restriction"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("Restriction"), "substringWithRange:", 0, 18);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByAppendingString:", CFSTR(".."));
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Device access allowed: foreground"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_retainAutorelease(v4);
      v9 = v7;
      v10 = 136446466;
      v11 = -[__CFString UTF8String](v8, "UTF8String");
      v12 = 2114;
      v13 = v6;
      _os_log_impl(&dword_1B98FC000, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v10, 0x16u);

    }
    self->_deviceOperationQueueSuspended = 0;
    -[NSOperationQueue setSuspended:](self->_deviceOperationQueue, "setSuspended:", 0);
  }
  os_unfair_lock_unlock(p_deviceOperationQueueLock);
}

- (void)setDeviceOperationQueueName:(id)a3
{
  -[NSOperationQueue setName:](self->_deviceOperationQueue, "setName:", a3);
}

- (void)setDeviceOperationQueueMaxConcurrentOperationCount:(unint64_t)a3
{
  -[NSOperationQueue setMaxConcurrentOperationCount:](self->_deviceOperationQueue, "setMaxConcurrentOperationCount:", a3);
}

- (NSDictionary)deviceMatchingInfo
{
  return self->_deviceMatchingInfo;
}

- (void)setDeviceMatchingInfo:(id)a3
{
  objc_storeStrong((id *)&self->_deviceMatchingInfo, a3);
}

- (NSOperationQueue)deviceOperationQueue
{
  return self->_deviceOperationQueue;
}

- (void)setDeviceOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_deviceOperationQueue, a3);
}

- (os_unfair_lock_s)deviceOperationQueueLock
{
  return self->_deviceOperationQueueLock;
}

- (void)setDeviceOperationQueueLock:(os_unfair_lock_s)a3
{
  self->_deviceOperationQueueLock = a3;
}

- (BOOL)deviceOperationQueueSuspended
{
  return self->_deviceOperationQueueSuspended;
}

- (void)setDeviceOperationQueueSuspended:(BOOL)a3
{
  self->_deviceOperationQueueSuspended = a3;
}

- (NSXPCConnection)managerConnection
{
  return self->_managerConnection;
}

- (void)setManagerConnection:(id)a3
{
  objc_storeStrong((id *)&self->_managerConnection, a3);
}

- (NSMutableDictionary)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_storeStrong((id *)&self->_devices, a3);
}

- (NSMutableArray)deviceHandles
{
  return self->_deviceHandles;
}

- (void)setDeviceHandles:(id)a3
{
  objc_storeStrong((id *)&self->_deviceHandles, a3);
}

- (os_unfair_lock_s)deviceHandlesLock
{
  return self->_deviceHandlesLock;
}

- (void)setDeviceHandlesLock:(os_unfair_lock_s)a3
{
  self->_deviceHandlesLock = a3;
}

- (BOOL)managerIsRunning
{
  return self->_managerIsRunning;
}

- (void)setManagerIsRunning:(BOOL)a3
{
  self->_managerIsRunning = a3;
}

- (unsigned)managerInvalidationCount
{
  return self->_managerInvalidationCount;
}

- (void)setManagerInvalidationCount:(unsigned int)a3
{
  self->_managerInvalidationCount = a3;
}

- (BOOL)controlAuthorizedOnce
{
  return self->_controlAuthorizedOnce;
}

- (void)setControlAuthorizedOnce:(BOOL)a3
{
  self->_controlAuthorizedOnce = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceHandles, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_managerConnection, 0);
  objc_storeStrong((id *)&self->_deviceOperationQueue, 0);
  objc_storeStrong((id *)&self->_deviceMatchingInfo, 0);
}

@end
