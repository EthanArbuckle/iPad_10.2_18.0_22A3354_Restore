@implementation CKDQueuedZoneFetch

- (void)addRequestForZoneID:(id)a3 forOperation:(id)a4 withCompletionHandler:(id)a5
{
  id v9;
  const char *v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  id v32;

  v32 = a3;
  v9 = a4;
  v12 = a5;
  if (!v32)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v10, v11);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v28, v29, (uint64_t)a2, self, CFSTR("CKDQueuedZoneFetch.m"), 21, CFSTR("Zone ID required when fetching zone PCS: %@"), self);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v30, v31, (uint64_t)a2, self, CFSTR("CKDQueuedZoneFetch.m"), 22, CFSTR("Zone ID was submitted to the wrong kind of fetcher: %@"), self);

  }
  objc_msgSend_addCallbackForItemWithID_operation_callback_(self, v13, (uint64_t)v32, v9, v12);
  objc_msgSend_date(MEMORY[0x1E0C99D68], v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLastRequestDate_(self, v18, (uint64_t)v17);

  v21 = objc_msgSend_qualityOfService(v9, v19, v20);
  if (v21 > objc_msgSend_highestQOS(self, v22, v23))
  {
    v26 = objc_msgSend_qualityOfService(v9, v24, v25);
    objc_msgSend_setHighestQOS_(self, v27, v26);
  }

}

- (void)createFetchOperationForItemIDs:(id)a3 operationQueue:(id)a4 operationConfigurationBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  const char *v18;
  _QWORD v19[5];
  id v20;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  objc_msgSend_setRecordZoneIDs_(v11, v12, (uint64_t)v10);

  objc_msgSend_initialOperation(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_class();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1BEA8B348;
  v19[3] = &unk_1E7830A38;
  v19[4] = self;
  v20 = v8;
  v17 = v8;
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_spawnQueue_operationConfigurationBlock_(v15, v18, v16, v11, v9, v19);

}

@end
