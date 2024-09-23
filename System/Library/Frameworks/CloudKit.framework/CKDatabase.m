@implementation CKDatabase

- (int64_t)scope
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;

  objc_msgSend_implementation(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_scope(v4, v5, v6, v7);

  return v8;
}

- (CKDatabaseScope)databaseScope
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CKDatabaseScope v8;

  objc_msgSend_implementation(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_databaseScope(v4, v5, v6, v7);

  return v8;
}

- (CKDatabaseImplementation)implementation
{
  return self->_implementation;
}

- (CKContainer)container
{
  return (CKContainer *)objc_loadWeakRetained((id *)&self->_container);
}

- (id)initInternalWithImplementation:(id)a3 container:(id)a4
{
  id v7;
  id v8;
  CKDatabase *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKDatabase;
  v9 = -[CKDatabase init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_implementation, a3);
    objc_storeWeak(p_isa + 1, v8);
  }

  return p_isa;
}

- (void)addOperation:(CKDatabaseOperation *)operation
{
  CKDatabaseOperation *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  id v17;

  v4 = operation;
  objc_msgSend_implementation(self, v5, v6, v7);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_convenienceConfiguration(v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addOperation_wrappingDatabase_convenienceConfiguration_(v17, v16, (uint64_t)v4, (uint64_t)self, v15);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_implementation, 0);
  objc_destroyWeak((id *)&self->_container);
}

+ (void)initialize
{
  objc_class *v2;
  uint64_t v3;

  v2 = (objc_class *)objc_opt_class();
  v3 = objc_opt_self();
  sub_18A5CEF4C(v3, v2, 0, 0, 0);
}

- (CKDatabase)init
{
  uint64_t v2;
  uint64_t v3;
  void *v6;
  const char *v7;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, (uint64_t)self, CFSTR("CKDatabase.m"), 449, CFSTR("Use +[CKContainer privateCloudDatabase] or +[CKContainer publicCloudDatabase] instead of creating your own"));

  return 0;
}

- (id)_initWithContainer:(id)a3 scope:(int64_t)a4
{
  id v6;
  CKDatabase *v7;
  CKDatabaseImplementation *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t inited;
  CKDatabaseImplementation *implementation;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CKDatabase;
  v7 = -[CKDatabase init](&v17, sel_init);
  if (v7)
  {
    v8 = [CKDatabaseImplementation alloc];
    objc_msgSend_implementation(v6, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    inited = objc_msgSend_initInternalWithContainerImplementation_scope_(v8, v13, (uint64_t)v12, a4);
    implementation = v7->_implementation;
    v7->_implementation = (CKDatabaseImplementation *)inited;

    objc_storeWeak((id *)&v7->_container, v6);
  }

  return v7;
}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_implementation(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKPropertiesDescription(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDatabase *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (NSOperationQueue)operationQueue
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_implementation(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationQueue(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSOperationQueue *)v8;
}

- (void)fetchRecordWithID:(CKRecordID *)recordID completionHandler:(void *)completionHandler
{
  void *v6;
  CKRecordID *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  id v20;

  v6 = completionHandler;
  v7 = recordID;
  objc_msgSend_implementation(self, v8, v9, v10);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_convenienceConfiguration(v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchRecordWithID_wrappingDatabase_convenienceConfiguration_completionHandler_(v20, v19, (uint64_t)v7, (uint64_t)self, v18, v6);

}

- (void)saveRecord:(CKRecord *)record completionHandler:(void *)completionHandler
{
  void *v6;
  CKRecord *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  id v20;

  v6 = completionHandler;
  v7 = record;
  objc_msgSend_implementation(self, v8, v9, v10);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_convenienceConfiguration(v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_saveRecord_wrappingDatabase_convenienceConfiguration_completionHandler_(v20, v19, (uint64_t)v7, (uint64_t)self, v18, v6);

}

- (void)deleteRecordWithID:(CKRecordID *)recordID completionHandler:(void *)completionHandler
{
  void *v6;
  CKRecordID *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  id v20;

  v6 = completionHandler;
  v7 = recordID;
  objc_msgSend_implementation(self, v8, v9, v10);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_convenienceConfiguration(v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deleteRecordWithID_wrappingDatabase_convenienceConfiguration_completionHandler_(v20, v19, (uint64_t)v7, (uint64_t)self, v18, v6);

}

- (void)performQuery:(CKQuery *)query inZoneWithID:(CKRecordZoneID *)zoneID completionHandler:(void *)completionHandler
{
  void *v8;
  CKRecordZoneID *v9;
  CKQuery *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  id v23;

  v8 = completionHandler;
  v9 = zoneID;
  v10 = query;
  objc_msgSend_implementation(self, v11, v12, v13);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_convenienceConfiguration(v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_performQuery_inZoneWithID_wrappingDatabase_convenienceConfiguration_completionHandler_(v23, v22, (uint64_t)v10, (uint64_t)v9, self, v21, v8);

}

- (void)fetchAllRecordZonesWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  id v17;

  v4 = completionHandler;
  objc_msgSend_implementation(self, v5, v6, v7);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_convenienceConfiguration(v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchAllRecordZonesWithWrappingDatabase_convenienceConfiguration_completionHandler_(v17, v16, (uint64_t)self, (uint64_t)v15, v4);

}

- (void)fetchRecordZoneWithID:(CKRecordZoneID *)zoneID completionHandler:(void *)completionHandler
{
  void *v6;
  CKRecordZoneID *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  id v20;

  v6 = completionHandler;
  v7 = zoneID;
  objc_msgSend_implementation(self, v8, v9, v10);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_convenienceConfiguration(v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchRecordZoneWithID_wrappingDatabase_convenienceConfiguration_completionHandler_(v20, v19, (uint64_t)v7, (uint64_t)self, v18, v6);

}

- (void)saveRecordZone:(CKRecordZone *)zone completionHandler:(void *)completionHandler
{
  void *v6;
  CKRecordZone *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  id v20;

  v6 = completionHandler;
  v7 = zone;
  objc_msgSend_implementation(self, v8, v9, v10);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_convenienceConfiguration(v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_saveRecordZone_wrappingDatabase_convenienceConfiguration_completionHandler_(v20, v19, (uint64_t)v7, (uint64_t)self, v18, v6);

}

- (void)deleteRecordZoneWithID:(CKRecordZoneID *)zoneID completionHandler:(void *)completionHandler
{
  void *v6;
  CKRecordZoneID *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  id v20;

  v6 = completionHandler;
  v7 = zoneID;
  objc_msgSend_implementation(self, v8, v9, v10);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_convenienceConfiguration(v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deleteRecordZoneWithID_wrappingDatabase_convenienceConfiguration_completionHandler_(v20, v19, (uint64_t)v7, (uint64_t)self, v18, v6);

}

- (void)checkSupportedDeviceCapabilities:(id)a3 inZone:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  id v26;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend_implementation(self, v14, v15, v16);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_convenienceConfiguration(v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_checkSupportedDeviceCapabilitiesInZone_desiredCapabilities_options_wrappingDatabase_convenienceConfiguration_completionHandler_(v26, v25, (uint64_t)v12, (uint64_t)v13, v11, self, v24, v10);

}

- (void)saveSubscription:(CKSubscription *)subscription completionHandler:(void *)completionHandler
{
  void *v6;
  CKSubscription *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  id v20;

  v6 = completionHandler;
  v7 = subscription;
  objc_msgSend_implementation(self, v8, v9, v10);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_convenienceConfiguration(v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_saveSubscription_wrappingDatabase_convenienceConfiguration_completionHandler_(v20, v19, (uint64_t)v7, (uint64_t)self, v18, v6);

}

- (void)deleteSubscriptionWithID:(CKSubscriptionID)subscriptionID completionHandler:(void *)completionHandler
{
  void *v6;
  NSString *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  id v20;

  v6 = completionHandler;
  v7 = subscriptionID;
  objc_msgSend_implementation(self, v8, v9, v10);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_convenienceConfiguration(v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deleteSubscriptionWithID_wrappingDatabase_convenienceConfiguration_completionHandler_(v20, v19, (uint64_t)v7, (uint64_t)self, v18, v6);

}

- (void)fetchSubscriptionWithID:(CKSubscriptionID)subscriptionID completionHandler:(void *)completionHandler
{
  void *v6;
  NSString *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  id v20;

  v6 = completionHandler;
  v7 = subscriptionID;
  objc_msgSend_implementation(self, v8, v9, v10);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_convenienceConfiguration(v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchSubscriptionWithID_wrappingDatabase_convenienceConfiguration_completionHandler_(v20, v19, (uint64_t)v7, (uint64_t)self, v18, v6);

}

- (void)fetchAllSubscriptionsWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  id v17;

  v4 = completionHandler;
  objc_msgSend_implementation(self, v5, v6, v7);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_convenienceConfiguration(v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchAllSubscriptionsWithWrappingDatabase_convenienceConfiguration_completionHandler_(v17, v16, (uint64_t)self, (uint64_t)v15, v4);

}

- (void)clearRecordCache
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend_implementation(self, a2, v2, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clearRecordCache(v7, v4, v5, v6);

}

@end
