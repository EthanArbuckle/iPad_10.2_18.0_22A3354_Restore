@implementation CKDAccountNotifier

- (void)registerObserver:(id)a3 forAccountChangeNotification:(id)a4
{
  id v7;
  const char *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *, char);
  void *v30;
  id v31;
  id v32;

  v7 = a3;
  v10 = a4;
  if (!v7)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)a2, self, CFSTR("CKDAccountNotifier.m"), 141, CFSTR("Observer cannot be nil"));

  }
  objc_msgSend_unregisterObserverForAccountChangeNotification_(self, v8, (uint64_t)v7);
  objc_msgSend_notificationHandlers(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v13);
  CKCurrentPersonaID();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = MEMORY[0x1E0C809B0];
  v28 = 3221225472;
  v29 = sub_1BEB5BE6C;
  v30 = &unk_1E7834A38;
  v15 = v14;
  v31 = v15;
  v16 = v10;
  v32 = v16;
  v17 = _Block_copy(&v27);
  objc_msgSend_notificationHandlers(self, v18, v19, v27, v28, v29, v30);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend_copy(v17, v21, v22);
  objc_msgSend_setObject_forKey_(v20, v24, (uint64_t)v23, v7);

  objc_sync_exit(v13);
}

- (void)unregisterObserverForAccountChangeNotification:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  id v12;

  v4 = a3;
  if (v4)
  {
    v12 = v4;
    objc_msgSend_notificationHandlers(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v7);
    objc_msgSend_notificationHandlers(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObjectForKey_(v10, v11, (uint64_t)v12);

    objc_sync_exit(v7);
    v4 = v12;
  }

}

- (NSMapTable)notificationHandlers
{
  return self->_notificationHandlers;
}

+ (id)sharedNotifier
{
  if (qword_1ED7009F8 != -1)
    dispatch_once(&qword_1ED7009F8, &unk_1E78349A0);
  return (id)qword_1ED700A00;
}

- (CKDAccountNotifier)init
{
  const char *v2;
  uint64_t v3;
  CKDAccountNotifier *v4;
  uint64_t v5;
  NSMapTable *notificationHandlers;
  uint64_t v7;
  NSOperationQueue *accountChangeHandlerQueue;
  const char *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKDAccountNotifier;
  v4 = -[CKDAccountNotifier init](&v11, sel_init);
  if (v4)
  {
    objc_msgSend_weakToStrongObjectsMapTable(MEMORY[0x1E0CB3748], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    notificationHandlers = v4->_notificationHandlers;
    v4->_notificationHandlers = (NSMapTable *)v5;

    v7 = objc_opt_new();
    accountChangeHandlerQueue = v4->_accountChangeHandlerQueue;
    v4->_accountChangeHandlerQueue = (NSOperationQueue *)v7;

    objc_msgSend_setMaxConcurrentOperationCount_(v4->_accountChangeHandlerQueue, v9, 4);
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  objc_super v7;

  objc_msgSend_notificationHandlers(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v4, v5, v6);

  v7.receiver = self;
  v7.super_class = (Class)CKDAccountNotifier;
  -[CKDAccountNotifier dealloc](&v7, sel_dealloc);
}

- (void)postAccountChangedNotificationWithAccountID:(id)a3 changeType:(int64_t)a4
{
  void *v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t isWarmingUp;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  void *v39;
  void *v40;
  id v41;
  const char *v42;
  void *v43;
  const char *v44;
  const char *v45;
  id v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  uint64_t v53;
  void *v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  NSObject *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  NSObject *v66;
  id obj;
  id v68;
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD v74[4];
  id v75;
  id v76;
  BOOL v77;
  uint8_t v78[128];
  uint8_t buf[4];
  id v80;
  __int16 v81;
  void *v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v68 = a3;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v6 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    v9 = v6;
    CKStringFromAccountChangeType();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v80 = v68;
    v81 = 2114;
    v82 = v10;
    _os_log_impl(&dword_1BE990000, v9, OS_LOG_TYPE_INFO, "Account with ID %@ changed with type: %{public}@", buf, 0x16u);

  }
  if (a4)
  {
    isWarmingUp = a4 == 5;
    objc_msgSend_setWarmingUp_(self, v7, isWarmingUp);
  }
  else
  {
    isWarmingUp = objc_msgSend_isWarmingUp(self, v7, v8);
  }
  objc_msgSend__accountChangeNotificationOperation_(self, v12, isWarmingUp);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_notificationHandlers(self, v13, v14);
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v15 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend_notificationHandlers(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_count(v18, v19, v20);
  objc_msgSend_arrayWithCapacity_(v15, v22, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_notificationHandlers(self, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyEnumerator(v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0;
  v33 = MEMORY[0x1E0C809B0];
  while (1)
  {
    objc_msgSend_nextObject(v29, v30, v31);
    v34 = objc_claimAutoreleasedReturnValue();

    if (!v34)
      break;
    objc_msgSend_notificationHandlers(self, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v37, v38, v34);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = (void *)MEMORY[0x1E0CB34C8];
    v74[0] = v33;
    v74[1] = 3221225472;
    v74[2] = sub_1BEB5BB00;
    v74[3] = &unk_1E78349C8;
    v41 = v39;
    v76 = v41;
    v75 = v68;
    v77 = a4 == 3;
    objc_msgSend_blockOperationWithBlock_(v40, v42, (uint64_t)v74);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addDependency_(v69, v44, (uint64_t)v43);
    objc_msgSend_addObject_(v23, v45, (uint64_t)v43);

    v32 = (void *)v34;
  }

  objc_sync_exit(obj);
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v46 = v23;
  v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v70, v78, 16);
  if (v50)
  {
    v51 = *(_QWORD *)v71;
    do
    {
      for (i = 0; i != v50; ++i)
      {
        if (*(_QWORD *)v71 != v51)
          objc_enumerationMutation(v46);
        v53 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i);
        objc_msgSend_accountChangeHandlerQueue(self, v48, v49);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addOperation_(v54, v55, v53);

      }
      v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v48, (uint64_t)&v70, v78, 16);
    }
    while (v50);
  }

  objc_msgSend_accountChangeHandlerQueue(self, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addOperation_(v58, v59, (uint64_t)v69);

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v60 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE990000, v60, OS_LOG_TYPE_INFO, "Waiting for all account notification handlers to run", buf, 2u);
  }
  objc_msgSend_accountChangeHandlerQueue(self, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_waitUntilAllOperationsAreFinished(v63, v64, v65);

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v66 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE990000, v66, OS_LOG_TYPE_INFO, "Account notification handlers are complete", buf, 2u);
  }

}

- (void)postAccountChangedNotificationToClients
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t isWarmingUp;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint8_t v13[16];

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1BE990000, v3, OS_LOG_TYPE_INFO, "Notifying clients of updated account info", v13, 2u);
  }
  isWarmingUp = objc_msgSend_isWarmingUp(self, v4, v5);
  objc_msgSend__accountChangeNotificationOperation_(self, v7, isWarmingUp);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountChangeHandlerQueue(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addOperation_(v11, v12, (uint64_t)v8);

}

- (id)_accountChangeNotificationOperation:(BOOL)a3
{
  _QWORD v4[4];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1BEB5BC68;
  v4[3] = &unk_1E78349E8;
  v5 = a3;
  objc_msgSend_blockOperationWithBlock_(MEMORY[0x1E0CB34C8], a2, (uint64_t)v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)accountChangedToken
{
  return self->_accountChangedToken;
}

- (void)setAccountChangedToken:(int)a3
{
  self->_accountChangedToken = a3;
}

- (void)setNotificationHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_notificationHandlers, a3);
}

- (NSOperationQueue)accountChangeHandlerQueue
{
  return self->_accountChangeHandlerQueue;
}

- (void)setAccountChangeHandlerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accountChangeHandlerQueue, a3);
}

- (BOOL)isWarmingUp
{
  return self->_warmingUp;
}

- (void)setWarmingUp:(BOOL)a3
{
  self->_warmingUp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountChangeHandlerQueue, 0);
  objc_storeStrong((id *)&self->_notificationHandlers, 0);
}

@end
