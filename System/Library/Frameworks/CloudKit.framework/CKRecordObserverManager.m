@implementation CKRecordObserverManager

+ (CKRecordObserverManager)sharedManager
{
  if (qword_1ECD96EB0 != -1)
    dispatch_once(&qword_1ECD96EB0, &unk_1E1F58978);
  return (CKRecordObserverManager *)(id)qword_1ECD96EA8;
}

- (CKRecordObserverManager)init
{
  CKRecordObserverManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSMapTable *recordObservers;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKRecordObserverManager;
  v2 = -[CKRecordObserverManager init](&v11, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.cloudkit.recordObserver", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    objc_msgSend_weakToStrongObjectsMapTable(MEMORY[0x1E0CB3748], v5, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    recordObservers = v2->_recordObservers;
    v2->_recordObservers = (NSMapTable *)v8;

  }
  return v2;
}

- (void)addRecordObserver:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  CKRecordObserverManager *v9;
  NSMapTable *recordObservers;
  NSMapTable *v11;
  void *v12;
  const char *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v8 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v6;
    _os_log_impl(&dword_18A5C5000, v8, OS_LOG_TYPE_DEFAULT, "Adding record observer: %@", (uint8_t *)&v14, 0xCu);
  }
  v9 = self;
  objc_sync_enter(v9);
  if (v9)
    recordObservers = v9->_recordObservers;
  else
    recordObservers = 0;
  v11 = recordObservers;
  v12 = _Block_copy(v7);
  objc_msgSend_setObject_forKey_(v11, v13, (uint64_t)v12, (uint64_t)v6);

  objc_sync_exit(v9);
}

- (void)removeRecordObserver:(id)a3
{
  id v4;
  NSObject *v5;
  CKRecordObserverManager *v6;
  NSMapTable *recordObservers;
  NSMapTable *v8;
  const char *v9;
  uint64_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v5 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_impl(&dword_18A5C5000, v5, OS_LOG_TYPE_DEFAULT, "Removing record observer: %@", (uint8_t *)&v11, 0xCu);
  }
  v6 = self;
  objc_sync_enter(v6);
  if (v6)
    recordObservers = v6->_recordObservers;
  else
    recordObservers = 0;
  v8 = recordObservers;
  objc_msgSend_removeObjectForKey_(v8, v9, (uint64_t)v4, v10);

  objc_sync_exit(v6);
}

- (void)handleRecordChange:(id)a3 container:(id)a4 completionHandler:(id)a5
{
  id v8;
  CKRecordObserverManager *v9;
  NSMapTable *recordObservers;
  NSMapTable *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *queue;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  id obj;
  _QWORD v31[4];
  id v32;
  _QWORD block[4];
  id v34;
  NSObject *v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  id v43;
  uint8_t buf[16];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v28 = a4;
  v29 = a5;
  v27 = v8;
  if (v8)
  {
    v9 = self;
    objc_sync_enter(v9);
    if (v9)
      recordObservers = v9->_recordObservers;
    else
      recordObservers = 0;
    v11 = recordObservers;
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = sub_18A7C1310;
    v41[3] = &unk_1E1F65700;
    v42 = v28;
    v12 = v8;
    v43 = v12;
    objc_msgSend_CKFlatMap_(v11, v13, (uint64_t)v41, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v9);
    v16 = dispatch_group_create();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = v15;
    v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v37, (uint64_t)v45, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v38;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v38 != v19)
            objc_enumerationMutation(obj);
          v21 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v20);
          dispatch_group_enter(v16);
          if (v9)
            queue = v9->_queue;
          else
            queue = 0;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = sub_18A7C1560;
          block[3] = &unk_1E1F61508;
          v34 = v12;
          v36 = v21;
          v35 = v16;
          dispatch_async(queue, block);

          ++v20;
        }
        while (v18 != v20);
        v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v37, (uint64_t)v45, 16);
        v18 = v24;
      }
      while (v24);
    }

    if (v29)
    {
      if (v9)
        v9 = (CKRecordObserverManager *)v9->_queue;
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = sub_18A7C164C;
      v31[3] = &unk_1E1F61CC8;
      v32 = v29;
      dispatch_group_notify(v16, &v9->super, v31);

    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v25 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18A5C5000, v25, OS_LOG_TYPE_INFO, "Received a nil recordChange", buf, 2u);
    }
    if (v29)
      (*((void (**)(id, uint64_t))v29 + 2))(v29, v26);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordObservers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
