@implementation HMDUIDialogPresenter

- (HMDUIDialogPresenter)init
{
  HMDUIDialogPresenter *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *workQueue;
  dispatch_semaphore_t v6;
  OS_dispatch_semaphore *notificationSem;
  uint64_t v8;
  NSMutableArray *pendingContexts;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HMDUIDialogPresenter;
  v2 = -[HMDUIDialogPresenter init](&v11, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.dialog", v3);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v4;

    v6 = dispatch_semaphore_create(1);
    notificationSem = v2->_notificationSem;
    v2->_notificationSem = (OS_dispatch_semaphore *)v6;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    pendingContexts = v2->_pendingContexts;
    v2->_pendingContexts = (NSMutableArray *)v8;

  }
  return v2;
}

- (void)dealloc
{
  __CFUserNotification *currentNotification;
  objc_super v4;

  currentNotification = self->_currentNotification;
  if (currentNotification)
    CFRelease(currentNotification);
  v4.receiver = self;
  v4.super_class = (Class)HMDUIDialogPresenter;
  -[HMDUIDialogPresenter dealloc](&v4, sel_dealloc);
}

- (void)setCurrentNotification:(__CFUserNotification *)a3
{
  __CFUserNotification *currentNotification;

  currentNotification = self->_currentNotification;
  if (currentNotification != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      currentNotification = self->_currentNotification;
    }
    if (currentNotification)
      CFRelease(currentNotification);
    self->_currentNotification = a3;
  }
}

- (void)dismissPendingDialogWithContext:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  id v15;

  v15 = a3;
  v8 = a5;
  v9 = a4;
  -[HMDUIDialogPresenter notificationSem](self, "notificationSem");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);

  -[HMDUIDialogPresenter currentContext](self, "currentContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", v15);

  if (v12)
  {
    CFUserNotificationCancel(-[HMDUIDialogPresenter currentNotification](self, "currentNotification"));
  }
  else
  {
    -[HMDUIDialogPresenter pendingContexts](self, "pendingContexts");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObject:", v15);

  }
  -[HMDUIDialogPresenter notificationSem](self, "notificationSem");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v14);

  dispatch_async(v9, v8);
}

- (void)dismissPendingDialogDueToPeerDeviceSelection:(BOOL)a3 context:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  _BOOL8 v8;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;

  v8 = a3;
  v16 = a4;
  v10 = a6;
  v11 = a5;
  -[HMDUIDialogPresenter notificationSem](self, "notificationSem");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

  -[HMDUIDialogPresenter setSelectedByPeerDevice:](self, "setSelectedByPeerDevice:", 1);
  -[HMDUIDialogPresenter setPeerDeviceAcceptedSelection:](self, "setPeerDeviceAcceptedSelection:", v8);
  -[HMDUIDialogPresenter currentContext](self, "currentContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = objc_msgSend(v13, "isEqual:", v16);

  if ((_DWORD)v12)
  {
    CFUserNotificationCancel(-[HMDUIDialogPresenter currentNotification](self, "currentNotification"));
  }
  else
  {
    -[HMDUIDialogPresenter pendingContexts](self, "pendingContexts");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObject:", v16);

  }
  -[HMDUIDialogPresenter notificationSem](self, "notificationSem");
  v15 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v15);

  dispatch_async(v11, v10);
}

- (BOOL)_isPendingContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  NSObject *v8;

  v4 = a3;
  -[HMDUIDialogPresenter notificationSem](self, "notificationSem");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  -[HMDUIDialogPresenter pendingContexts](self, "pendingContexts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  -[HMDUIDialogPresenter notificationSem](self, "notificationSem");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v8);

  return v7;
}

- (BOOL)_addToPendingContext:(id)a3
{
  id v4;
  char v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;

  v4 = a3;
  if (v4 && !isAppleTV())
  {
    -[HMDUIDialogPresenter notificationSem](self, "notificationSem");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

    -[HMDUIDialogPresenter pendingContexts](self, "pendingContexts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v4);
    v5 = v8 ^ 1;

    if ((v8 & 1) == 0)
    {
      -[HMDUIDialogPresenter pendingContexts](self, "pendingContexts");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v4);

    }
    -[HMDUIDialogPresenter notificationSem](self, "notificationSem");
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v10);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_addCurrentNotification:(__CFUserNotification *)a3 withContext:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  NSObject *v10;

  v6 = a4;
  -[HMDUIDialogPresenter notificationSem](self, "notificationSem");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

  -[HMDUIDialogPresenter pendingContexts](self, "pendingContexts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v6);

  if (v9)
  {
    -[HMDUIDialogPresenter setCurrentNotification:](self, "setCurrentNotification:", a3);
    -[HMDUIDialogPresenter setCurrentContext:](self, "setCurrentContext:", v6);
  }
  -[HMDUIDialogPresenter notificationSem](self, "notificationSem");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v10);

  return v9;
}

- (BOOL)_removeCurrentNotification:(__CFUserNotification *)a3 currentSelection:(BOOL)a4 selectedByPeerDevice:(BOOL *)a5 andContext:(id)a6
{
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;

  if (a5)
    *a5 = 0;
  v10 = a6;
  -[HMDUIDialogPresenter notificationSem](self, "notificationSem");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);

  -[HMDUIDialogPresenter pendingContexts](self, "pendingContexts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObject:", v10);

  if (-[HMDUIDialogPresenter currentNotification](self, "currentNotification")
    && -[HMDUIDialogPresenter currentNotification](self, "currentNotification") == a3)
  {
    if (-[HMDUIDialogPresenter selectedByPeerDevice](self, "selectedByPeerDevice"))
    {
      a4 = -[HMDUIDialogPresenter peerDeviceAcceptedSelection](self, "peerDeviceAcceptedSelection");
      if (a5)
        *a5 = 1;
    }
    -[HMDUIDialogPresenter setCurrentNotification:](self, "setCurrentNotification:", 0);
    -[HMDUIDialogPresenter setCurrentContext:](self, "setCurrentContext:", 0);
  }
  -[HMDUIDialogPresenter setSelectedByPeerDevice:](self, "setSelectedByPeerDevice:", 0);
  -[HMDUIDialogPresenter setPeerDeviceAcceptedSelection:](self, "setPeerDeviceAcceptedSelection:", 0);
  -[HMDUIDialogPresenter notificationSem](self, "notificationSem");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v13);

  return a4;
}

- (void)requestUserPermissionForUnauthenticatedAccessory:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  NSObject *v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (-[HMDUIDialogPresenter _addToPendingContext:](self, "_addToPendingContext:", v11))
  {
    -[HMDUIDialogPresenter workQueue](self, "workQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __109__HMDUIDialogPresenter_requestUserPermissionForUnauthenticatedAccessory_withContext_queue_completionHandler___block_invoke;
    block[3] = &unk_1E89C0598;
    block[4] = self;
    v21 = v10;
    v22 = v11;
    v23 = v12;
    v24 = v13;
    v15 = v13;
    dispatch_async(v14, block);

    v16 = v21;
  }
  else
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __109__HMDUIDialogPresenter_requestUserPermissionForUnauthenticatedAccessory_withContext_queue_completionHandler___block_invoke_2;
    v18[3] = &unk_1E89C0870;
    v19 = v13;
    v17 = v13;
    dispatch_async(v12, v18);
    v16 = v19;
  }

}

- (void)_requestUserPermissionForUnauthenticatedAccessory:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD block[4];
  id v21;
  char v22;
  _QWORD v23[4];
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  v9 = a6;
  v10 = a5;
  v11 = a4;
  HMDLocalizedStringForKey(CFSTR("ACCESSORY_NOAUTH_TITLE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HMDLocalizedStringForKey(CFSTR("ACCESSORY_NOAUTH_DETAIL"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  HMDLocalizedStringForKey(CFSTR("ADD_ANYWAY"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  HMDLocalizedStringForKey(CFSTR("CANCEL"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0C9B810];
  v23[0] = *MEMORY[0x1E0C9B800];
  v23[1] = v16;
  v24[0] = v12;
  v24[1] = v13;
  v17 = *MEMORY[0x1E0C9B838];
  v23[2] = *MEMORY[0x1E0C9B830];
  v23[3] = v17;
  v24[2] = v14;
  v24[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[HMDUIDialogPresenter _presentDialogWithInfo:options:textField:withContext:](self, "_presentDialogWithInfo:options:textField:withContext:", v18, 0, 0, v11);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __110__HMDUIDialogPresenter__requestUserPermissionForUnauthenticatedAccessory_withContext_queue_completionHandler___block_invoke;
  block[3] = &unk_1E89AD398;
  v21 = v9;
  v22 = (char)self;
  v19 = v9;
  dispatch_async(v10, block);

}

- (void)requestUserPermissionForBridgeAccessory:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  NSObject *v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (-[HMDUIDialogPresenter _addToPendingContext:](self, "_addToPendingContext:", v11))
  {
    -[HMDUIDialogPresenter workQueue](self, "workQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __100__HMDUIDialogPresenter_requestUserPermissionForBridgeAccessory_withContext_queue_completionHandler___block_invoke;
    block[3] = &unk_1E89C0598;
    block[4] = self;
    v21 = v10;
    v22 = v11;
    v23 = v12;
    v24 = v13;
    v15 = v13;
    dispatch_async(v14, block);

    v16 = v21;
  }
  else
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __100__HMDUIDialogPresenter_requestUserPermissionForBridgeAccessory_withContext_queue_completionHandler___block_invoke_2;
    v18[3] = &unk_1E89C0870;
    v19 = v13;
    v17 = v13;
    dispatch_async(v12, v18);
    v16 = v19;
  }

}

- (void)_requestUserPermissionForBridgeAccessory:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD block[4];
  id v21;
  char v22;
  _QWORD v23[4];
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  v9 = a6;
  v10 = a5;
  v11 = a4;
  HMDLocalizedStringForKey(CFSTR("BRIDGE_ACCESSORIES_HOME_BEHAVIOR_TITLE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HMDLocalizedStringForKey(CFSTR("BRIDGE_ACCESSORIES_HOME_BEHAVIOR_DETAIL"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  HMDLocalizedStringForKey(CFSTR("OK"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  HMDLocalizedStringForKey(CFSTR("CANCEL"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0C9B810];
  v23[0] = *MEMORY[0x1E0C9B800];
  v23[1] = v16;
  v24[0] = v12;
  v24[1] = v13;
  v17 = *MEMORY[0x1E0C9B838];
  v23[2] = *MEMORY[0x1E0C9B830];
  v23[3] = v17;
  v24[2] = v14;
  v24[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[HMDUIDialogPresenter _presentDialogWithInfo:options:textField:withContext:](self, "_presentDialogWithInfo:options:textField:withContext:", v18, 0, 0, v11);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__HMDUIDialogPresenter__requestUserPermissionForBridgeAccessory_withContext_queue_completionHandler___block_invoke;
  block[3] = &unk_1E89AD398;
  v21 = v9;
  v22 = (char)self;
  v19 = v9;
  dispatch_async(v10, block);

}

- (void)requestUserPermissionForLegacyWACAccessory:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  NSObject *v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (-[HMDUIDialogPresenter _addToPendingContext:](self, "_addToPendingContext:", v11))
  {
    -[HMDUIDialogPresenter workQueue](self, "workQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __103__HMDUIDialogPresenter_requestUserPermissionForLegacyWACAccessory_withContext_queue_completionHandler___block_invoke;
    block[3] = &unk_1E89C0598;
    block[4] = self;
    v21 = v10;
    v22 = v11;
    v23 = v12;
    v24 = v13;
    v15 = v13;
    dispatch_async(v14, block);

    v16 = v21;
  }
  else
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __103__HMDUIDialogPresenter_requestUserPermissionForLegacyWACAccessory_withContext_queue_completionHandler___block_invoke_2;
    v18[3] = &unk_1E89C0870;
    v19 = v13;
    v17 = v13;
    dispatch_async(v12, v18);
    v16 = v19;
  }

}

- (void)requestUserPermissionWithAccessoryPPIDInfo:(id)a3 name:(id)a4 category:(id)a5 withContext:(id)a6 queue:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD block[5];
  id v27;
  id v28;
  id v29;
  id v30;
  NSObject *v31;
  id v32;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (-[HMDUIDialogPresenter _addToPendingContext:](self, "_addToPendingContext:", v17))
  {
    -[HMDUIDialogPresenter workQueue](self, "workQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __117__HMDUIDialogPresenter_requestUserPermissionWithAccessoryPPIDInfo_name_category_withContext_queue_completionHandler___block_invoke;
    block[3] = &unk_1E89BF160;
    block[4] = self;
    v27 = v14;
    v28 = v15;
    v29 = v16;
    v30 = v17;
    v31 = v18;
    v32 = v19;
    v21 = v19;
    dispatch_async(v20, block);

    v22 = v27;
  }
  else
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __117__HMDUIDialogPresenter_requestUserPermissionWithAccessoryPPIDInfo_name_category_withContext_queue_completionHandler___block_invoke_2;
    v24[3] = &unk_1E89C0870;
    v25 = v19;
    v23 = v19;
    dispatch_async(v18, v24);
    v22 = v25;
  }

}

- (void)_requestUserPermissionWithAccessoryPPIDInfo:(id)a3 name:(id)a4 category:(id)a5 withContext:(id)a6 queue:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  __CFString *v18;
  void *v19;
  HMDUIDialogPresenter *v20;
  NSObject *v21;
  void *v22;
  __CFString *v23;
  NSObject *v24;
  __CFString *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  __CFString *v29;
  id v30;
  __CFString *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  __CFString *v42;
  id v43;
  __CFString *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  __CFString *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  BOOL v54;
  __CFString *v55;
  id v56;
  id v57;
  HMDUIDialogPresenter *v58;
  id v59;
  NSObject *queue;
  _QWORD v61[4];
  __CFString *v62;
  BOOL v63;
  id v64;
  id v65;
  _QWORD block[4];
  __CFString *v67;
  _QWORD v68[4];
  _QWORD v69[4];
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  const __CFString *v73;
  __int16 v74;
  const __CFString *v75;
  __int16 v76;
  id v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  queue = a7;
  v18 = (__CFString *)a8;
  if (objc_msgSend(v14, "isDenylisted"))
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v71 = v22;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Accessory is Blacklisted - Rejecting", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __118__HMDUIDialogPresenter__requestUserPermissionWithAccessoryPPIDInfo_name_category_withContext_queue_completionHandler___block_invoke;
    block[3] = &unk_1E89C0870;
    v67 = v18;
    v23 = v18;
    v24 = queue;
    dispatch_async(queue, block);
    v25 = v67;
  }
  else
  {
    v58 = self;
    HMDLocalizedStringForKey(CFSTR("ACCESSORY_CONFIRM_PPID_INFO_TITLE"));
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v59 = v16;
    v57 = v17;
    if ((objc_msgSend(v14, "isCertified") & 1) == 0)
    {
      HMDLocalizedStringForKey(CFSTR("ACCESSORY_CONFIRM_UNCERTIFIED_PPID_INFO_TITLE"));
      v26 = objc_claimAutoreleasedReturnValue();

      v23 = (__CFString *)v26;
    }
    v27 = (void *)MEMORY[0x1E0CB3940];
    HMDLocalizedStringForKey(CFSTR("ACCESSORY_CONFIRM_UNKNOWN_DETAIL"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = 0;
    objc_msgSend(v27, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v28, CFSTR("%@"), &v65, v15);
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v30 = v65;

    v31 = v29;
    if (!v29)
    {
      v32 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v56 = v15;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v71 = v34;
        v72 = 2112;
        v73 = CFSTR("ACCESSORY_CONFIRM_UNKNOWN_DETAIL");
        v74 = 2112;
        v75 = CFSTR("%@");
        v76 = 2112;
        v77 = v30;
        _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

        v15 = v56;
      }

      objc_autoreleasePoolPop(v32);
      v31 = CFSTR("ACCESSORY_CONFIRM_UNKNOWN_DETAIL");
    }
    v25 = v31;

    objc_msgSend(v14, "category");
    v35 = objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      v36 = (void *)v35;
      objc_msgSend(v14, "manufacturer");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
      {
        v38 = (void *)MEMORY[0x1E0CB3940];
        HMDLocalizedStringForKey(CFSTR("ACCESSORY_CONFIRM_PPID_DETAIL"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = 0;
        objc_msgSend(v14, "manufacturer");
        v40 = v15;
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v39, CFSTR("%@ %@"), &v64, v59, v41);
        v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v43 = v64;

        v15 = v40;
        v44 = v42;
        if (!v42)
        {
          v45 = (void *)MEMORY[0x1D17BA0A0]();
          HMFGetOSLogHandle();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v71 = v47;
            v72 = 2112;
            v73 = CFSTR("ACCESSORY_CONFIRM_PPID_DETAIL");
            v74 = 2112;
            v75 = CFSTR("%@ %@");
            v76 = 2112;
            v77 = v43;
            _os_log_impl(&dword_1CD062000, v46, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

            v15 = v40;
          }

          objc_autoreleasePoolPop(v45);
          v44 = CFSTR("ACCESSORY_CONFIRM_PPID_DETAIL");
        }
        v48 = v44;

        v25 = v48;
      }
    }
    HMDLocalizedStringForKey(CFSTR("DONT_ALLOW"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    HMDLocalizedStringForKey(CFSTR("ALLOW"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = *MEMORY[0x1E0C9B810];
    v68[0] = *MEMORY[0x1E0C9B800];
    v68[1] = v51;
    v69[0] = v23;
    v69[1] = v25;
    v52 = *MEMORY[0x1E0C9B838];
    v68[2] = *MEMORY[0x1E0C9B830];
    v68[3] = v52;
    v69[2] = v49;
    v69[3] = v50;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 4);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v57;
    v54 = -[HMDUIDialogPresenter _presentDialogWithInfo:options:textField:withContext:](v58, "_presentDialogWithInfo:options:textField:withContext:", v53, 0, 0, v57);
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __118__HMDUIDialogPresenter__requestUserPermissionWithAccessoryPPIDInfo_name_category_withContext_queue_completionHandler___block_invoke_36;
    v61[3] = &unk_1E89AD398;
    v62 = v18;
    v63 = v54;
    v55 = v18;
    v24 = queue;
    dispatch_async(queue, v61);

    v16 = v59;
  }

}

- (void)requestUserPermissionForDeletionOfHomeWithName:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  NSObject *v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (-[HMDUIDialogPresenter _addToPendingContext:](self, "_addToPendingContext:", v11))
  {
    -[HMDUIDialogPresenter workQueue](self, "workQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __107__HMDUIDialogPresenter_requestUserPermissionForDeletionOfHomeWithName_withContext_queue_completionHandler___block_invoke;
    block[3] = &unk_1E89C0598;
    block[4] = self;
    v21 = v10;
    v22 = v11;
    v23 = v12;
    v24 = v13;
    v15 = v13;
    dispatch_async(v14, block);

    v16 = v21;
  }
  else
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __107__HMDUIDialogPresenter_requestUserPermissionForDeletionOfHomeWithName_withContext_queue_completionHandler___block_invoke_2;
    v18[3] = &unk_1E89C0870;
    v19 = v13;
    v17 = v13;
    dispatch_async(v12, v18);
    v16 = v19;
  }

}

- (void)_requestUserPermissionForDeletionOfHomeWithName:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  __CFString *v13;
  id v14;
  __CFString *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  id v23;
  __CFString *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  __CFString *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  BOOL v33;
  id v34;
  NSObject *queue;
  id v37;
  _QWORD block[4];
  id v39;
  BOOL v40;
  id v41;
  id v42;
  _QWORD v43[4];
  _QWORD v44[4];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  const __CFString *v48;
  __int16 v49;
  const __CFString *v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v37 = a4;
  queue = a5;
  v10 = a6;
  v11 = (void *)MEMORY[0x1E0CB3940];
  HMDLocalizedStringForKey(CFSTR("HOME_DELETION_CONFIRM_TITLE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  objc_msgSend(v11, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%@"), &v42, v9);
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v14 = v42;

  v15 = v13;
  if (!v13)
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v46 = v18;
      v47 = 2112;
      v48 = CFSTR("HOME_DELETION_CONFIRM_TITLE");
      v49 = 2112;
      v50 = CFSTR("%@");
      v51 = 2112;
      v52 = v14;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v16);
    v15 = CFSTR("HOME_DELETION_CONFIRM_TITLE");
  }
  v19 = v15;

  v20 = (void *)MEMORY[0x1E0CB3940];
  HMDLocalizedStringForKey(CFSTR("HOME_DELETION_CONFIRM_BUTTON"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  objc_msgSend(v20, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v21, CFSTR("%@"), &v41, v9);
  v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v23 = v41;

  v24 = v22;
  if (!v22)
  {
    v25 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v46 = v27;
      v47 = 2112;
      v48 = CFSTR("HOME_DELETION_CONFIRM_BUTTON");
      v49 = 2112;
      v50 = CFSTR("%@");
      v51 = 2112;
      v52 = v23;
      _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v25);
    v24 = CFSTR("HOME_DELETION_CONFIRM_BUTTON");
  }
  v28 = v24;

  HMDLocalizedStringForKey(CFSTR("DONT_ALLOW"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = *MEMORY[0x1E0C9B830];
  v43[0] = *MEMORY[0x1E0C9B800];
  v43[1] = v30;
  v44[0] = v19;
  v44[1] = v28;
  v31 = *MEMORY[0x1E0C9B838];
  v43[2] = *MEMORY[0x1E0DABB28];
  v43[3] = v31;
  v44[2] = &unk_1E8B32E08;
  v44[3] = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[HMDUIDialogPresenter _presentDialogWithInfo:options:textField:withContext:](self, "_presentDialogWithInfo:options:textField:withContext:", v32, 0, 0, v37);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __108__HMDUIDialogPresenter__requestUserPermissionForDeletionOfHomeWithName_withContext_queue_completionHandler___block_invoke;
  block[3] = &unk_1E89AD398;
  v39 = v10;
  v40 = v33;
  v34 = v10;
  dispatch_async(queue, block);

}

- (void)requestUserPermissionForRemovalOfRouter:(id)a3 accessoriesRequiringManualReconfiguration:(id)a4 withContext:(id)a5 queue:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[HMDUIDialogPresenter workQueue](self, "workQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __142__HMDUIDialogPresenter_requestUserPermissionForRemovalOfRouter_accessoriesRequiringManualReconfiguration_withContext_queue_completionHandler___block_invoke;
  v23[3] = &unk_1E89C0790;
  v23[4] = self;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  dispatch_async(v17, v23);

}

- (void)_requestUserPermissionForRemovalOfRouter:(id)a3 accessoriesRequiringManualReconfiguration:(id)a4 withContext:(id)a5 queue:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  BOOL v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  id v34;
  __CFString *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  NSObject *queue;
  id v53;
  id v54;
  _QWORD block[4];
  id v57;
  BOOL v58;
  id v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  const __CFString *v63;
  __int16 v64;
  const __CFString *v65;
  __int16 v66;
  id v67;
  _QWORD v68[5];
  _QWORD v69[5];
  _QWORD v70[5];
  _QWORD v71[7];

  v71[5] = *MEMORY[0x1E0C80C00];
  v54 = a3;
  v11 = a4;
  v12 = a5;
  queue = a6;
  v51 = a7;
  v53 = v11;
  v13 = objc_msgSend(v11, "count");
  v45 = *MEMORY[0x1E0C9B800];
  v70[0] = *MEMORY[0x1E0C9B800];
  localizedWiFiStringKey();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  HMDLocalizedStringForKey(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = v15;
  v16 = *MEMORY[0x1E0C9B810];
  v70[1] = *MEMORY[0x1E0C9B810];
  localizedWiFiStringKey();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  HMDLocalizedStringForKey(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v71[1] = v18;
  v50 = *MEMORY[0x1E0C9B830];
  v70[2] = *MEMORY[0x1E0C9B830];
  HMDLocalizedStringForKey(CFSTR("CANCEL"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v71[2] = v19;
  v49 = *MEMORY[0x1E0C9B838];
  v70[3] = *MEMORY[0x1E0C9B838];
  if (v13)
    v20 = CFSTR("CONTINUE");
  else
    v20 = CFSTR("REMOVE");
  if (v13)
    v21 = &unk_1E8B32E20;
  else
    v21 = &unk_1E8B32E08;
  HMDLocalizedStringForKey(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = *MEMORY[0x1E0DABB70];
  v70[4] = *MEMORY[0x1E0DABB70];
  v71[3] = v22;
  v71[4] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, v70, 5);
  v23 = objc_claimAutoreleasedReturnValue();

  v24 = v12;
  if (!-[HMDUIDialogPresenter _addToPendingContext:](self, "_addToPendingContext:", v12))
  {
    v25 = (void *)v23;
    v27 = 0;
    goto LABEL_17;
  }
  v25 = (void *)v23;
  v26 = -[HMDUIDialogPresenter _presentDialogWithInfo:options:textField:withContext:](self, "_presentDialogWithInfo:options:textField:withContext:", v23, 0, 0, v24);
  v27 = v26;
  if (!v26)
  {
LABEL_17:
    v28 = v53;
    goto LABEL_20;
  }
  v28 = v53;
  if (v13)
  {
    v44 = v24;
    objc_msgSend(MEMORY[0x1E0CB3738], "localizedStringByJoiningStrings:", v53);
    v29 = objc_claimAutoreleasedReturnValue();
    v68[0] = v45;
    HMDLocalizedStringForKey(CFSTR("ROUTER_REMOVAL_CONFIRM_MANUAL_RECONFIGURATION_TITLE"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = v30;
    v68[1] = v16;
    v31 = (void *)MEMORY[0x1E0CB3940];
    HMDLocalizedStringForKey(CFSTR("ROUTER_REMOVAL_CONFIRM_MANUAL_RECONFIGURATION_DETAIL"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0;
    objc_msgSend(v31, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v32, CFSTR("%@"), &v59, v29);
    v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v34 = v59;

    v35 = v33;
    if (!v33)
    {
      v36 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v46 = v36;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v61 = v38;
        v62 = 2112;
        v63 = CFSTR("ROUTER_REMOVAL_CONFIRM_MANUAL_RECONFIGURATION_DETAIL");
        v64 = 2112;
        v65 = CFSTR("%@");
        v66 = 2112;
        v67 = v34;
        _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

        v36 = v46;
      }

      objc_autoreleasePoolPop(v36);
      v35 = CFSTR("ROUTER_REMOVAL_CONFIRM_MANUAL_RECONFIGURATION_DETAIL");
    }
    v47 = (void *)v29;
    v39 = v35;

    v69[1] = v39;
    v68[2] = v50;
    HMDLocalizedStringForKey(CFSTR("CANCEL"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v69[2] = v40;
    v68[3] = v49;
    HMDLocalizedStringForKey(CFSTR("REMOVE"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v68[4] = v48;
    v69[3] = v41;
    v69[4] = &unk_1E8B32E08;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 5);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = v44;
    if (-[HMDUIDialogPresenter _addToPendingContext:](self, "_addToPendingContext:", v44))
      v27 = -[HMDUIDialogPresenter _presentDialogWithInfo:options:textField:withContext:](self, "_presentDialogWithInfo:options:textField:withContext:", v42, 0, 0, v44);
    else
      v27 = 0;

  }
LABEL_20:
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __143__HMDUIDialogPresenter__requestUserPermissionForRemovalOfRouter_accessoriesRequiringManualReconfiguration_withContext_queue_completionHandler___block_invoke;
  block[3] = &unk_1E89AD398;
  v57 = v51;
  v58 = v27;
  v43 = v51;
  dispatch_async(queue, block);

}

- (void)requestUserPermissionForRemovalOfSpecificWiFiCredentialedAccessory:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HMDUIDialogPresenter workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __127__HMDUIDialogPresenter_requestUserPermissionForRemovalOfSpecificWiFiCredentialedAccessory_withContext_queue_completionHandler___block_invoke;
  block[3] = &unk_1E89C0598;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(v14, block);

}

- (void)_requestUserPermissionForRemovalOfSpecificWiFiCredentialedAccessory:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  __CFString *v16;
  id v17;
  __CFString *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  id v28;
  void *v29;
  void *v30;
  _QWORD block[4];
  id v32;
  BOOL v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  id v42;
  _QWORD v43[5];
  _QWORD v44[7];

  v44[5] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v43[0] = *MEMORY[0x1E0C9B800];
  v14 = (void *)MEMORY[0x1E0CB3940];
  HMDLocalizedStringForKey(CFSTR("ACCESSORY_WITH_SPECIFIC_WIFI_CREDENTIAL_REMOVAL_CONFIRM_TITLE"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v30 = v10;
  objc_msgSend(v14, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v15, CFSTR("%@"), &v34, v10);
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v17 = v34;

  v18 = v16;
  if (!v16)
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = v19;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v36 = v21;
      v37 = 2112;
      v38 = CFSTR("ACCESSORY_WITH_SPECIFIC_WIFI_CREDENTIAL_REMOVAL_CONFIRM_TITLE");
      v39 = 2112;
      v40 = CFSTR("%@");
      v41 = 2112;
      v42 = v17;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

      v19 = v29;
    }

    objc_autoreleasePoolPop(v19);
    v18 = CFSTR("ACCESSORY_WITH_SPECIFIC_WIFI_CREDENTIAL_REMOVAL_CONFIRM_TITLE");
  }
  v22 = v18;

  v44[0] = v22;
  v43[1] = *MEMORY[0x1E0C9B810];
  HMDLocalizedStringForKey(CFSTR("ACCESSORY_WITH_SPECIFIC_WIFI_CREDENTIAL_REMOVAL_CONFIRM_DETAIL"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v23;
  v43[2] = *MEMORY[0x1E0C9B830];
  HMDLocalizedStringForKey(CFSTR("CANCEL"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v24;
  v43[3] = *MEMORY[0x1E0C9B838];
  HMDLocalizedStringForKey(CFSTR("REMOVE"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = *MEMORY[0x1E0DABB70];
  v44[3] = v25;
  v44[4] = &unk_1E8B32E08;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = -[HMDUIDialogPresenter _addToPendingContext:](self, "_addToPendingContext:", v11);
  if (v27)
    LOBYTE(v27) = -[HMDUIDialogPresenter _presentDialogWithInfo:options:textField:withContext:](self, "_presentDialogWithInfo:options:textField:withContext:", v26, 0, 0, v11);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __128__HMDUIDialogPresenter__requestUserPermissionForRemovalOfSpecificWiFiCredentialedAccessory_withContext_queue_completionHandler___block_invoke;
  block[3] = &unk_1E89AD398;
  v32 = v13;
  v33 = v27;
  v28 = v13;
  dispatch_async(v12, block);

}

- (void)showUserDialogForIncompatibleAccessory:(id)a3 name:(id)a4 category:(id)a5 withContext:(id)a6 queue:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD block[5];
  id v27;
  id v28;
  id v29;
  id v30;
  NSObject *v31;
  id v32;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (-[HMDUIDialogPresenter _addToPendingContext:](self, "_addToPendingContext:", v17))
  {
    -[HMDUIDialogPresenter workQueue](self, "workQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __113__HMDUIDialogPresenter_showUserDialogForIncompatibleAccessory_name_category_withContext_queue_completionHandler___block_invoke;
    block[3] = &unk_1E89BF160;
    block[4] = self;
    v27 = v14;
    v28 = v15;
    v29 = v16;
    v30 = v17;
    v31 = v18;
    v32 = v19;
    v21 = v19;
    dispatch_async(v20, block);

    v22 = v27;
  }
  else
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __113__HMDUIDialogPresenter_showUserDialogForIncompatibleAccessory_name_category_withContext_queue_completionHandler___block_invoke_2;
    v24[3] = &unk_1E89C0870;
    v25 = v19;
    v23 = v19;
    dispatch_async(v18, v24);
    v22 = v25;
  }

}

- (void)_showUserDialogForIncompatibleAccessory:(id)a3 name:(id)a4 category:(id)a5 withContext:(id)a6 queue:(id)a7 completionHandler:(id)a8
{
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v11 = a8;
  v12 = a7;
  v13 = a6;
  HMDLocalizedStringForKey(CFSTR("ACCESSORY_INCOMPATIBLE_HEADER"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  HMDLocalizedStringForKey(CFSTR("ACCESSORY_INCOMPATIBLE_DETAIL"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  HMDLocalizedStringForKey(CFSTR("OK"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x1E0C9B810];
  v22[0] = *MEMORY[0x1E0C9B800];
  v22[1] = v17;
  v23[0] = v14;
  v23[1] = v15;
  v22[2] = *MEMORY[0x1E0C9B838];
  v23[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUIDialogPresenter _presentDialogWithInfo:options:textField:withContext:](self, "_presentDialogWithInfo:options:textField:withContext:", v18, 0, 0, v13);

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __114__HMDUIDialogPresenter__showUserDialogForIncompatibleAccessory_name_category_withContext_queue_completionHandler___block_invoke;
  v20[3] = &unk_1E89C0870;
  v21 = v11;
  v19 = v11;
  dispatch_async(v12, v20);

}

- (void)_requestUserPermissionForLegacyWACAccessory:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  BOOL v30;
  id v31;
  id v32;
  void *v33;
  _QWORD block[4];
  id v36;
  BOOL v37;
  id v38;
  _QWORD v39[4];
  _QWORD v40[4];
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  const __CFString *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  HMDLocalizedStringForKey(CFSTR("ACCESSORY_LEGACYWAC_TITLE"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB3940];
  localizedWiFiStringKey();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  HMDLocalizedStringForKey(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  objc_msgSend(v14, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v16, CFSTR("%@"), &v38, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v38;

  if (v17)
  {
    v19 = v17;
  }
  else
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = v9;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      localizedWiFiStringKey();
      v33 = v20;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v42 = v22;
      v43 = 2112;
      v44 = v23;
      v45 = 2112;
      v46 = CFSTR("%@");
      v47 = 2112;
      v48 = v18;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

      v20 = v33;
      v9 = v32;
    }

    objc_autoreleasePoolPop(v20);
    localizedWiFiStringKey();
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v24 = v19;

  HMDLocalizedStringForKey(CFSTR("DONT_ALLOW"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  HMDLocalizedStringForKey(CFSTR("ALLOW"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = *MEMORY[0x1E0C9B810];
  v39[0] = *MEMORY[0x1E0C9B800];
  v39[1] = v27;
  v40[0] = v13;
  v40[1] = v24;
  v28 = *MEMORY[0x1E0C9B838];
  v39[2] = *MEMORY[0x1E0C9B830];
  v39[3] = v28;
  v40[2] = v25;
  v40[3] = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[HMDUIDialogPresenter _presentDialogWithInfo:options:textField:withContext:](self, "_presentDialogWithInfo:options:textField:withContext:", v29, 0, 0, v10);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104__HMDUIDialogPresenter__requestUserPermissionForLegacyWACAccessory_withContext_queue_completionHandler___block_invoke;
  block[3] = &unk_1E89AD398;
  v36 = v12;
  v37 = v30;
  v31 = v12;
  dispatch_async(v11, block);

}

- (void)displayKeychainSyncForHome:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  NSObject *v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (-[HMDUIDialogPresenter _addToPendingContext:](self, "_addToPendingContext:", v11))
  {
    -[HMDUIDialogPresenter workQueue](self, "workQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__HMDUIDialogPresenter_displayKeychainSyncForHome_withContext_queue_completionHandler___block_invoke;
    block[3] = &unk_1E89C0598;
    block[4] = self;
    v21 = v10;
    v22 = v11;
    v23 = v12;
    v24 = v13;
    v15 = v13;
    dispatch_async(v14, block);

    v16 = v21;
  }
  else
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __87__HMDUIDialogPresenter_displayKeychainSyncForHome_withContext_queue_completionHandler___block_invoke_2;
    v18[3] = &unk_1E89C0870;
    v19 = v13;
    v17 = v13;
    dispatch_async(v12, v18);
    v16 = v19;
  }

}

- (void)_displayKeychainSyncForHome:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  id v18;
  __CFString *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  BOOL v29;
  id v30;
  id v31;
  void *v32;
  _QWORD block[4];
  id v34;
  BOOL v35;
  id v36;
  _QWORD v37[4];
  _QWORD v38[4];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  const __CFString *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  HMDLocalizedStringForKey(CFSTR("ENABLE_KEYCHAIN_SYNC_TITLE"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB3940];
  HMDLocalizedStringForKey(CFSTR("KEYCHAIN_SYNC_INFO"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v32 = v10;
  objc_msgSend(v15, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v16, CFSTR("%@"), &v36, v10);
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v18 = v36;

  v19 = v17;
  if (!v17)
  {
    v31 = v13;
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v40 = v22;
      v41 = 2112;
      v42 = CFSTR("KEYCHAIN_SYNC_INFO");
      v43 = 2112;
      v44 = CFSTR("%@");
      v45 = 2112;
      v46 = v18;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v20);
    v19 = CFSTR("KEYCHAIN_SYNC_INFO");
    v13 = v31;
  }
  v23 = v19;

  HMDLocalizedStringForKey(CFSTR("SETTINGS"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  HMDLocalizedStringForKey(CFSTR("OK"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *MEMORY[0x1E0C9B810];
  v37[0] = *MEMORY[0x1E0C9B800];
  v37[1] = v26;
  v38[0] = v14;
  v38[1] = v23;
  v27 = *MEMORY[0x1E0C9B830];
  v37[2] = *MEMORY[0x1E0C9B838];
  v37[3] = v27;
  v38[2] = v25;
  v38[3] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[HMDUIDialogPresenter _presentDialogWithInfo:options:textField:withContext:](self, "_presentDialogWithInfo:options:textField:withContext:", v28, 0, 0, v11);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__HMDUIDialogPresenter__displayKeychainSyncForHome_withContext_queue_completionHandler___block_invoke;
  block[3] = &unk_1E89AD398;
  v34 = v13;
  v35 = v29;
  v30 = v13;
  dispatch_async(v12, block);

}

- (void)displayiCloudSwitchWithContext:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD block[5];
  id v18;
  NSObject *v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[HMDUIDialogPresenter _addToPendingContext:](self, "_addToPendingContext:", v8))
  {
    -[HMDUIDialogPresenter workQueue](self, "workQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__HMDUIDialogPresenter_displayiCloudSwitchWithContext_queue_completionHandler___block_invoke;
    block[3] = &unk_1E89C0448;
    block[4] = self;
    v18 = v8;
    v19 = v9;
    v20 = v10;
    v12 = v10;
    dispatch_async(v11, block);

    v13 = v18;
  }
  else
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __79__HMDUIDialogPresenter_displayiCloudSwitchWithContext_queue_completionHandler___block_invoke_2;
    v15[3] = &unk_1E89C0870;
    v16 = v10;
    v14 = v10;
    dispatch_async(v9, v15);
    v13 = v16;
  }

}

- (void)_displayiCloudSwitchWithContext:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  _QWORD block[4];
  id v20;
  char v21;
  _QWORD v22[4];
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  HMDLocalizedStringForKey(CFSTR("ENABLE_ICLOUD_SWITCH_TITLE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HMDLocalizedStringForKey(CFSTR("ICLOUD_SWITCH_INFO"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HMDLocalizedStringForKey(CFSTR("CANCEL"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  HMDLocalizedStringForKey(CFSTR("USE_ICLOUD"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0C9B810];
  v22[0] = *MEMORY[0x1E0C9B800];
  v22[1] = v15;
  v23[0] = v11;
  v23[1] = v12;
  v16 = *MEMORY[0x1E0C9B830];
  v22[2] = *MEMORY[0x1E0C9B838];
  v22[3] = v16;
  v23[2] = v14;
  v23[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[HMDUIDialogPresenter _presentDialogWithInfo:options:textField:withContext:](self, "_presentDialogWithInfo:options:textField:withContext:", v17, 0, 0, v10);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__HMDUIDialogPresenter__displayiCloudSwitchWithContext_queue_completionHandler___block_invoke;
  block[3] = &unk_1E89AD398;
  v20 = v8;
  v21 = (char)self;
  v18 = v8;
  dispatch_async(v9, block);

}

- (void)displayUpgradeNeededWithContext:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD block[5];
  id v18;
  NSObject *v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[HMDUIDialogPresenter _addToPendingContext:](self, "_addToPendingContext:", v8))
  {
    -[HMDUIDialogPresenter workQueue](self, "workQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__HMDUIDialogPresenter_displayUpgradeNeededWithContext_queue_completionHandler___block_invoke;
    block[3] = &unk_1E89C0448;
    block[4] = self;
    v18 = v8;
    v19 = v9;
    v20 = v10;
    v12 = v10;
    dispatch_async(v11, block);

    v13 = v18;
  }
  else
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __80__HMDUIDialogPresenter_displayUpgradeNeededWithContext_queue_completionHandler___block_invoke_2;
    v15[3] = &unk_1E89C0870;
    v16 = v10;
    v14 = v10;
    dispatch_async(v9, v15);
    v13 = v16;
  }

}

- (void)_displayUpgradeNeededWithContext:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  HMDLocalizedStringForKey(CFSTR("OS_UPGRADE_NEEDED_TITLE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HMDLocalizedStringForKey(CFSTR("OS_UPGRADE_NEEDED_INFO"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HMDLocalizedStringForKey(CFSTR("OK"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0C9B810];
  v19[0] = *MEMORY[0x1E0C9B800];
  v19[1] = v14;
  v20[0] = v11;
  v20[1] = v12;
  v19[2] = *MEMORY[0x1E0C9B838];
  v20[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUIDialogPresenter _presentDialogWithInfo:options:textField:withContext:](self, "_presentDialogWithInfo:options:textField:withContext:", v15, 0, 0, v10);

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __81__HMDUIDialogPresenter__displayUpgradeNeededWithContext_queue_completionHandler___block_invoke;
  v17[3] = &unk_1E89C0870;
  v18 = v8;
  v16 = v8;
  dispatch_async(v9, v17);

}

- (void)displayInternalTTRErrorWithContext:(id)a3 message:(id)a4 waitForResponse:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (isInternalBuild()
    && -[HMDUIDialogPresenter _addToPendingContext:](self, "_addToPendingContext:", v10))
  {
    -[HMDUIDialogPresenter workQueue](self, "workQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __101__HMDUIDialogPresenter_displayInternalTTRErrorWithContext_message_waitForResponse_completionHandler___block_invoke;
    block[3] = &unk_1E89C0448;
    block[4] = self;
    v20 = v10;
    v21 = v11;
    v22 = v12;
    dispatch_async(v13, block);

    v14 = v20;
  }
  else
  {
    -[HMDUIDialogPresenter workQueue](self, "workQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __101__HMDUIDialogPresenter_displayInternalTTRErrorWithContext_message_waitForResponse_completionHandler___block_invoke_2;
    v17[3] = &unk_1E89C0870;
    v18 = v12;
    dispatch_async(v15, v17);

    v14 = v18;
  }

  if (v7)
  {
    -[HMDUIDialogPresenter workQueue](self, "workQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    dispatch_sync(v16, &__block_literal_global_84);

  }
}

- (void)_displayInternalTTRErrorWithContext:(id)a3 message:(id)a4 completionHandler:(id)a5
{
  void (**v8)(id, _BOOL8);
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _BOOL8 v16;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, _BOOL8))a5;
  v9 = a4;
  v10 = a3;
  HMDLocalizedStringForKey(CFSTR("REPORT_PROBLEM"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HMDLocalizedStringForKey(CFSTR("NOT_NOW"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0C9B810];
  v17[0] = *MEMORY[0x1E0C9B800];
  v17[1] = v13;
  v18[0] = v11;
  v18[1] = v9;
  v14 = *MEMORY[0x1E0C9B838];
  v17[2] = *MEMORY[0x1E0C9B868];
  v17[3] = v14;
  v18[2] = v12;
  v18[3] = CFSTR("Tap-to-Radar");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[HMDUIDialogPresenter _presentDialogWithInfo:options:textField:withContext:](self, "_presentDialogWithInfo:options:textField:withContext:", v15, 0, 0, v10);
  v8[2](v8, v16);

}

- (void)confirmReportAccessory:(id)a3 context:(id)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id *v15;
  _QWORD v16[4];
  id v17;
  _QWORD block[4];
  _QWORD v19[2];
  id v20;
  NSObject *v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (-[HMDUIDialogPresenter _addToPendingContext:](self, "_addToPendingContext:", v11))
  {
    -[HMDUIDialogPresenter workQueue](self, "workQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __89__HMDUIDialogPresenter_confirmReportAccessory_context_completionQueue_completionHandler___block_invoke;
    block[3] = &unk_1E89C0598;
    v15 = (id *)v19;
    v19[0] = v10;
    v19[1] = self;
    v20 = v11;
    v21 = v12;
    v22 = v13;
    dispatch_async(v14, block);

LABEL_6:
    goto LABEL_7;
  }
  if (v12 && v13)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __89__HMDUIDialogPresenter_confirmReportAccessory_context_completionQueue_completionHandler___block_invoke_2;
    v16[3] = &unk_1E89C0870;
    v15 = &v17;
    v17 = v13;
    dispatch_async(v12, v16);
    goto LABEL_6;
  }
LABEL_7:

}

- (void)displayExecutionErrorOfTrigger:(id)a3 partialSuccess:(BOOL)a4 context:(id)a5 completionQueue:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  BOOL v26;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  -[HMDUIDialogPresenter workQueue](self, "workQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __112__HMDUIDialogPresenter_displayExecutionErrorOfTrigger_partialSuccess_context_completionQueue_completionHandler___block_invoke;
  v21[3] = &unk_1E89A9F98;
  v21[4] = self;
  v22 = v13;
  v24 = v12;
  v25 = v15;
  v26 = a4;
  v23 = v14;
  v17 = v12;
  v18 = v15;
  v19 = v14;
  v20 = v13;
  dispatch_async(v16, v21);

}

- (BOOL)shouldSkipAuthPromptDialog
{
  return skipAuthPromptDialog;
}

- (void)displayRestrictedBluetoothCharacteristicsWarningWithDeviceName:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  HMDUIDialogPresenter *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HMDUIDialogPresenter workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105__HMDUIDialogPresenter_displayRestrictedBluetoothCharacteristicsWarningWithDeviceName_completionHandler___block_invoke;
  block[3] = &unk_1E89C1B48;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (BOOL)_presentDialogWithInfo:(id)a3 options:(unint64_t)a4 targetResponse:(unint64_t)a5 textField:(id *)a6 withContext:(id)a7 selectedByPeerDevice:(BOOL *)a8 timeout:(double)a9
{
  id v16;
  __CFUserNotification *v17;
  uint64_t v18;
  BOOL v19;
  CFOptionFlags v21;
  SInt32 error;

  v16 = a7;
  error = -1;
  v17 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a9, a4, &error, (CFDictionaryRef)a3);
  if (error
    || !-[HMDUIDialogPresenter _addCurrentNotification:withContext:](self, "_addCurrentNotification:withContext:", v17, v16)|| (v21 = 0, CFUserNotificationReceiveResponse(v17, 0.0, &v21))|| (v21 & 3) != a5)
  {
    v18 = 0;
  }
  else
  {
    if (a6)
    {
      CFUserNotificationGetResponseValue(v17, (CFStringRef)*MEMORY[0x1E0C9B880], 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = 1;
  }
  v19 = -[HMDUIDialogPresenter _removeCurrentNotification:currentSelection:selectedByPeerDevice:andContext:](self, "_removeCurrentNotification:currentSelection:selectedByPeerDevice:andContext:", v17, v18, a8, v16);
  if (v17)
    CFRelease(v17);

  return v19;
}

- (BOOL)_presentDialogWithInfo:(id)a3 options:(unint64_t)a4 textField:(id *)a5 withContext:(id)a6
{
  return -[HMDUIDialogPresenter _presentDialogWithInfo:options:targetResponse:textField:withContext:selectedByPeerDevice:timeout:](self, "_presentDialogWithInfo:options:targetResponse:textField:withContext:selectedByPeerDevice:timeout:", a3, a4, 0, a5, a6, 0, 0.0);
}

- (BOOL)_presentDialogWithInfo:(id)a3 options:(unint64_t)a4 targetResponse:(unint64_t)a5 textField:(id *)a6 withContext:(id)a7
{
  return -[HMDUIDialogPresenter _presentDialogWithInfo:options:targetResponse:textField:withContext:selectedByPeerDevice:timeout:](self, "_presentDialogWithInfo:options:targetResponse:textField:withContext:selectedByPeerDevice:timeout:", a3, a4, a5, a6, a7, 0, 0.0);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (__CFUserNotification)currentNotification
{
  return self->_currentNotification;
}

- (id)currentContext
{
  return self->_currentContext;
}

- (void)setCurrentContext:(id)a3
{
  objc_storeStrong(&self->_currentContext, a3);
}

- (NSMutableArray)pendingContexts
{
  return self->_pendingContexts;
}

- (void)setPendingContexts:(id)a3
{
  objc_storeStrong((id *)&self->_pendingContexts, a3);
}

- (BOOL)selectedByPeerDevice
{
  return self->_selectedByPeerDevice;
}

- (void)setSelectedByPeerDevice:(BOOL)a3
{
  self->_selectedByPeerDevice = a3;
}

- (BOOL)peerDeviceAcceptedSelection
{
  return self->_peerDeviceAcceptedSelection;
}

- (void)setPeerDeviceAcceptedSelection:(BOOL)a3
{
  self->_peerDeviceAcceptedSelection = a3;
}

- (OS_dispatch_semaphore)notificationSem
{
  return self->_notificationSem;
}

- (void)setNotificationSem:(id)a3
{
  objc_storeStrong((id *)&self->_notificationSem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationSem, 0);
  objc_storeStrong((id *)&self->_pendingContexts, 0);
  objc_storeStrong(&self->_currentContext, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __105__HMDUIDialogPresenter_displayRestrictedBluetoothCharacteristicsWarningWithDeviceName_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  id v6;
  __CFString *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v17[3];
  _QWORD v18[3];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  HMDLocalizedStringForKey(CFSTR("RESTRICTED_BT_CHARS_ACCESS_TITLE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  HMDLocalizedStringForKey(CFSTR("RESTRICTED_BT_CHARS_ACCESS_MESSAGE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 32);
  v16 = 0;
  objc_msgSend(v3, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v4, CFSTR("%@"), &v16, v15);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v16;

  v7 = v5;
  if (!v5)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v20 = v10;
      v21 = 2112;
      v22 = CFSTR("RESTRICTED_BT_CHARS_ACCESS_MESSAGE");
      v23 = 2112;
      v24 = CFSTR("%@");
      v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v8);
    v7 = CFSTR("RESTRICTED_BT_CHARS_ACCESS_MESSAGE");
  }
  v11 = v7;

  HMDLocalizedStringForKey(CFSTR("OK"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0C9B810];
  v17[0] = *MEMORY[0x1E0C9B800];
  v17[1] = v13;
  v18[0] = v2;
  v18[1] = v11;
  v17[2] = *MEMORY[0x1E0C9B838];
  v18[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_presentDialogWithInfo:options:textField:withContext:", v14, 0, 0, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __112__HMDUIDialogPresenter_displayExecutionErrorOfTrigger_partialSuccess_context_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char v22;
  NSObject *v23;
  void *v24;
  char v25;
  _QWORD v26[4];
  id v27;
  id v28;
  char v29;
  id v30;
  id v31;
  _QWORD block[4];
  id v33;
  id v34;
  _QWORD v35[6];
  _QWORD v36[6];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "_addToPendingContext:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    if (*(_BYTE *)(a1 + 72))
    {
      HMDLocalizedStringForKey(CFSTR("TRIGGER_EXECUTION_ERROR_TITLE_PARTIAL_SUCCESS"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = (void *)MEMORY[0x1E0CB3940];
      HMDLocalizedStringForKey(CFSTR("TRIGGER_EXECUTION_ERROR_BODY_PARTIAL_SUCCESS"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0;
      objc_msgSend(v3, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v4, CFSTR("%@"), &v31, *(_QWORD *)(a1 + 56));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v6 = v31;

      if (!v5)
      {
        v7 = (void *)MEMORY[0x1D17BA0A0]();
        HMFGetOSLogHandle();
        v8 = objc_claimAutoreleasedReturnValue();
        v5 = CFSTR("TRIGGER_EXECUTION_ERROR_BODY_PARTIAL_SUCCESS");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v38 = v9;
          v39 = 2112;
          v40 = CFSTR("TRIGGER_EXECUTION_ERROR_BODY_PARTIAL_SUCCESS");
          v41 = 2112;
          v42 = CFSTR("%@");
          v43 = 2112;
          v44 = v6;
LABEL_13:
          _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

          goto LABEL_14;
        }
        goto LABEL_14;
      }
    }
    else
    {
      HMDLocalizedStringForKey(CFSTR("TRIGGER_EXECUTION_ERROR_TITLE"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CB3940];
      HMDLocalizedStringForKey(CFSTR("TRIGGER_EXECUTION_ERROR_BODY"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0;
      objc_msgSend(v12, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v13, CFSTR("%@"), &v30, *(_QWORD *)(a1 + 56));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v6 = v30;

      if (!v5)
      {
        v7 = (void *)MEMORY[0x1D17BA0A0]();
        HMFGetOSLogHandle();
        v8 = objc_claimAutoreleasedReturnValue();
        v5 = CFSTR("TRIGGER_EXECUTION_ERROR_BODY");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v38 = v9;
          v39 = 2112;
          v40 = CFSTR("TRIGGER_EXECUTION_ERROR_BODY");
          v41 = 2112;
          v42 = CFSTR("%@");
          v43 = 2112;
          v44 = v6;
          goto LABEL_13;
        }
LABEL_14:

        objc_autoreleasePoolPop(v7);
        v14 = 0;
        goto LABEL_15;
      }
    }
    v14 = v5;
LABEL_15:
    v15 = v5;

    HMDLocalizedStringForKey(CFSTR("CLOSE"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HMDLocalizedStringForKey(CFSTR("OPEN_HOME_APP"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x1E0C9B810];
    v35[0] = *MEMORY[0x1E0C9B800];
    v35[1] = v18;
    v36[0] = v2;
    v36[1] = v15;
    v19 = *MEMORY[0x1E0C9B830];
    v35[2] = *MEMORY[0x1E0C9B838];
    v35[3] = v19;
    v36[2] = v17;
    v36[3] = v16;
    v20 = *MEMORY[0x1E0DABBB0];
    v35[4] = *MEMORY[0x1E0C9B820];
    v35[5] = v20;
    v36[4] = MEMORY[0x1E0C9AAB0];
    v36[5] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(*(id *)(a1 + 32), "_presentDialogWithInfo:options:textField:withContext:", v21, 0, 0, *(_QWORD *)(a1 + 40));
    v23 = *(NSObject **)(a1 + 48);
    if (v23)
    {
      v24 = *(void **)(a1 + 64);
      if (v24)
      {
        v25 = v22;
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __112__HMDUIDialogPresenter_displayExecutionErrorOfTrigger_partialSuccess_context_completionQueue_completionHandler___block_invoke_108;
        v26[3] = &unk_1E89B6038;
        v28 = v24;
        v29 = v25;
        v27 = *(id *)(a1 + 40);
        dispatch_async(v23, v26);

      }
    }

    goto LABEL_19;
  }
  v10 = *(NSObject **)(a1 + 48);
  if (v10)
  {
    v11 = *(void **)(a1 + 64);
    if (v11)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __112__HMDUIDialogPresenter_displayExecutionErrorOfTrigger_partialSuccess_context_completionQueue_completionHandler___block_invoke_2;
      block[3] = &unk_1E89C1D68;
      v34 = v11;
      v33 = *(id *)(a1 + 40);
      dispatch_async(v10, block);

      v2 = v34;
LABEL_19:

    }
  }
}

uint64_t __112__HMDUIDialogPresenter_displayExecutionErrorOfTrigger_partialSuccess_context_completionQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __112__HMDUIDialogPresenter_displayExecutionErrorOfTrigger_partialSuccess_context_completionQueue_completionHandler___block_invoke_108(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __89__HMDUIDialogPresenter_confirmReportAccessory_context_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  __CFString *v4;
  id v5;
  __CFString *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  NSObject *v18;
  void *v19;
  char v20;
  _QWORD block[4];
  id v22;
  char v23;
  id v24;
  _QWORD v25[4];
  _QWORD v26[4];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  HMDLocalizedStringForKey(CFSTR("REPORT_ACCESSORY_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v2, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v3, CFSTR("%@"), &v24, *(_QWORD *)(a1 + 32));
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v24;

  v6 = v4;
  if (!v4)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v28 = v9;
      v29 = 2112;
      v30 = CFSTR("REPORT_ACCESSORY_TITLE");
      v31 = 2112;
      v32 = CFSTR("%@");
      v33 = 2112;
      v34 = v5;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v7);
    v6 = CFSTR("REPORT_ACCESSORY_TITLE");
  }
  v10 = v6;

  HMDLocalizedStringForKey(CFSTR("REPORT_ACCESSORY_DESCRIPTION"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HMDLocalizedStringForKey(CFSTR("NOT_NOW"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HMDLocalizedStringForKey(CFSTR("REPORT_PROBLEM"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0C9B810];
  v25[0] = *MEMORY[0x1E0C9B800];
  v25[1] = v14;
  v26[0] = v10;
  v26[1] = v11;
  v15 = *MEMORY[0x1E0C9B830];
  v25[2] = *MEMORY[0x1E0C9B868];
  v25[3] = v15;
  v26[2] = v12;
  v26[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(*(id *)(a1 + 40), "_presentDialogWithInfo:options:targetResponse:textField:withContext:", v16, 35, 1, 0, *(_QWORD *)(a1 + 48));
  v18 = *(NSObject **)(a1 + 56);
  if (v18)
  {
    v19 = *(void **)(a1 + 64);
    if (v19)
    {
      v20 = v17;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __89__HMDUIDialogPresenter_confirmReportAccessory_context_completionQueue_completionHandler___block_invoke_95;
      block[3] = &unk_1E89AD398;
      v22 = v19;
      v23 = v20;
      dispatch_async(v18, block);

    }
  }

}

uint64_t __89__HMDUIDialogPresenter_confirmReportAccessory_context_completionQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __89__HMDUIDialogPresenter_confirmReportAccessory_context_completionQueue_completionHandler___block_invoke_95(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __101__HMDUIDialogPresenter_displayInternalTTRErrorWithContext_message_waitForResponse_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_displayInternalTTRErrorWithContext:message:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __101__HMDUIDialogPresenter_displayInternalTTRErrorWithContext_message_waitForResponse_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __81__HMDUIDialogPresenter__displayUpgradeNeededWithContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__HMDUIDialogPresenter_displayUpgradeNeededWithContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_displayUpgradeNeededWithContext:queue:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __80__HMDUIDialogPresenter_displayUpgradeNeededWithContext_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__HMDUIDialogPresenter__displayiCloudSwitchWithContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __79__HMDUIDialogPresenter_displayiCloudSwitchWithContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_displayiCloudSwitchWithContext:queue:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __79__HMDUIDialogPresenter_displayiCloudSwitchWithContext_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __88__HMDUIDialogPresenter__displayKeychainSyncForHome_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40) == 0);
}

uint64_t __87__HMDUIDialogPresenter_displayKeychainSyncForHome_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_displayKeychainSyncForHome:withContext:queue:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __87__HMDUIDialogPresenter_displayKeychainSyncForHome_withContext_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __104__HMDUIDialogPresenter__requestUserPermissionForLegacyWACAccessory_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40) == 0);
}

uint64_t __114__HMDUIDialogPresenter__showUserDialogForIncompatibleAccessory_name_category_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __113__HMDUIDialogPresenter_showUserDialogForIncompatibleAccessory_name_category_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showUserDialogForIncompatibleAccessory:name:category:withContext:queue:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
}

uint64_t __113__HMDUIDialogPresenter_showUserDialogForIncompatibleAccessory_name_category_withContext_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __128__HMDUIDialogPresenter__requestUserPermissionForRemovalOfSpecificWiFiCredentialedAccessory_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40) == 0);
}

uint64_t __127__HMDUIDialogPresenter_requestUserPermissionForRemovalOfSpecificWiFiCredentialedAccessory_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestUserPermissionForRemovalOfSpecificWiFiCredentialedAccessory:withContext:queue:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __143__HMDUIDialogPresenter__requestUserPermissionForRemovalOfRouter_accessoriesRequiringManualReconfiguration_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40) == 0);
}

uint64_t __142__HMDUIDialogPresenter_requestUserPermissionForRemovalOfRouter_accessoriesRequiringManualReconfiguration_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestUserPermissionForRemovalOfRouter:accessoriesRequiringManualReconfiguration:withContext:queue:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

uint64_t __108__HMDUIDialogPresenter__requestUserPermissionForDeletionOfHomeWithName_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __107__HMDUIDialogPresenter_requestUserPermissionForDeletionOfHomeWithName_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestUserPermissionForDeletionOfHomeWithName:withContext:queue:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __107__HMDUIDialogPresenter_requestUserPermissionForDeletionOfHomeWithName_withContext_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __118__HMDUIDialogPresenter__requestUserPermissionWithAccessoryPPIDInfo_name_category_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __118__HMDUIDialogPresenter__requestUserPermissionWithAccessoryPPIDInfo_name_category_withContext_queue_completionHandler___block_invoke_36(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40) == 0);
}

uint64_t __117__HMDUIDialogPresenter_requestUserPermissionWithAccessoryPPIDInfo_name_category_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestUserPermissionWithAccessoryPPIDInfo:name:category:withContext:queue:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
}

uint64_t __117__HMDUIDialogPresenter_requestUserPermissionWithAccessoryPPIDInfo_name_category_withContext_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __103__HMDUIDialogPresenter_requestUserPermissionForLegacyWACAccessory_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestUserPermissionForLegacyWACAccessory:withContext:queue:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __103__HMDUIDialogPresenter_requestUserPermissionForLegacyWACAccessory_withContext_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __101__HMDUIDialogPresenter__requestUserPermissionForBridgeAccessory_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __100__HMDUIDialogPresenter_requestUserPermissionForBridgeAccessory_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestUserPermissionForBridgeAccessory:withContext:queue:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __100__HMDUIDialogPresenter_requestUserPermissionForBridgeAccessory_withContext_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __110__HMDUIDialogPresenter__requestUserPermissionForUnauthenticatedAccessory_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __109__HMDUIDialogPresenter_requestUserPermissionForUnauthenticatedAccessory_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestUserPermissionForUnauthenticatedAccessory:withContext:queue:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __109__HMDUIDialogPresenter_requestUserPermissionForUnauthenticatedAccessory_withContext_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)sharedUIDialogPresenter
{
  if (sharedUIDialogPresenter_onceToken != -1)
    dispatch_once(&sharedUIDialogPresenter_onceToken, &__block_literal_global_40284);
  return (id)sharedUIDialogPresenter_singleton;
}

void __47__HMDUIDialogPresenter_sharedUIDialogPresenter__block_invoke()
{
  HMDUIDialogPresenter *v0;
  void *v1;

  v0 = objc_alloc_init(HMDUIDialogPresenter);
  v1 = (void *)sharedUIDialogPresenter_singleton;
  sharedUIDialogPresenter_singleton = (uint64_t)v0;

}

@end
