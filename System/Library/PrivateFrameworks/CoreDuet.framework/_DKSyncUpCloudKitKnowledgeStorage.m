@implementation _DKSyncUpCloudKitKnowledgeStorage

+ (id)sharedInstance
{
  if (sharedInstance_initialized_388 != -1)
    dispatch_once(&sharedInstance_initialized_388, &__block_literal_global_390);
  return (id)sharedInstance_sharedInstance_389;
}

- (_DKSyncUpCloudKitKnowledgeStorage)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DKSyncUpCloudKitKnowledgeStorage;
  return -[_DKSyncUpCloudKitKnowledgeStorage init](&v3, sel_init);
}

- (BOOL)isAvailable
{
  _DKSyncCloudKitKnowledgeStorage *common;

  common = self->_common;
  return common && common->_available;
}

- (void)setAvailable:(BOOL)a3
{
  _DKSyncCloudKitKnowledgeStorage *common;

  common = self->_common;
  if (common)
    common->_available = a3;
}

- (void)start
{
  _DKSyncCloudKitKnowledgeStorage *v3;
  _DKSyncCloudKitKnowledgeStorage *common;
  const char *v5;
  _DKSyncCloudKitKnowledgeStorage *v6;

  +[_DKSyncCloudKitKnowledgeStorage sharedInstance]();
  v3 = (_DKSyncCloudKitKnowledgeStorage *)objc_claimAutoreleasedReturnValue();
  common = self->_common;
  self->_common = v3;

  v6 = self->_common;
  if (v6)
  {
    objc_setProperty_atomic(v6, v5, self->_delegate, 160);
    v6 = self->_common;
  }
  -[_DKSyncCloudKitKnowledgeStorage start](v6, "start");
}

- (void)cancelOutstandingOperations
{
  _DKSyncCloudKitKnowledgeStorage *common;

  common = self->_common;
  if (common)
  {
    objc_setProperty_atomic(common, a2, self->_delegate, 160);
    common = self->_common;
  }
  -[_DKSyncCloudKitKnowledgeStorage cancelOutstandingOperations](common, "cancelOutstandingOperations");
}

- (void)prewarmFetchWithCompletion:(id)a3
{
  const char *v4;
  _DKSyncCloudKitKnowledgeStorage *common;
  id v6;

  v6 = a3;
  common = self->_common;
  if (common)
  {
    objc_setProperty_atomic(common, v4, self->_delegate, 160);
    common = self->_common;
  }
  -[_DKSyncCloudKitKnowledgeStorage prewarmFetchWithCompletion:](common, "prewarmFetchWithCompletion:", v6);

}

- (BOOL)hasAdditionsFlagForPeer:(id)a3
{
  return -[_DKSyncCloudKitKnowledgeStorage hasAdditionsFlagForPeer:](self->_common, "hasAdditionsFlagForPeer:", a3);
}

- (void)setHasAdditionsFlag:(BOOL)a3 forPeer:(id)a4
{
  -[_DKSyncCloudKitKnowledgeStorage setHasAdditionsFlag:forPeer:](self->_common, "setHasAdditionsFlag:forPeer:", a3, a4);
}

- (BOOL)hasDeletionsFlagForPeer:(id)a3
{
  return -[_DKSyncCloudKitKnowledgeStorage hasDeletionsFlagForPeer:](self->_common, "hasDeletionsFlagForPeer:", a3);
}

- (void)setHasDeletionsFlag:(BOOL)a3 forPeer:(id)a4
{
  -[_DKSyncCloudKitKnowledgeStorage setHasDeletionsFlag:forPeer:](self->_common, "setHasDeletionsFlag:forPeer:", a3, a4);
}

- (void)clearPrewarmedFlag
{
  -[_DKSyncCloudKitKnowledgeStorage clearPrewarmedFlag](self->_common, "clearPrewarmedFlag");
}

- (void)fetchEventsFromPeer:(id)a3 windows:(id)a4 streamNames:(id)a5 limit:(unint64_t)a6 fetchOrder:(int64_t)a7 highPriority:(BOOL)a8 completion:(id)a9
{
  _BOOL8 v9;
  id v15;
  id v16;
  const char *v17;
  id v18;
  _DKSyncCloudKitKnowledgeStorage *common;
  id v20;

  v9 = a8;
  v20 = a3;
  v15 = a4;
  v16 = a5;
  v18 = a9;
  common = self->_common;
  if (common)
  {
    objc_setProperty_atomic(common, v17, self->_delegate, 160);
    common = self->_common;
  }
  -[_DKSyncCloudKitKnowledgeStorage fetchEventsFromPeer:windows:streamNames:limit:fetchOrder:highPriority:completion:](common, "fetchEventsFromPeer:windows:streamNames:limit:fetchOrder:highPriority:completion:", v20, v15, v16, a6, a7, v9, v18);

}

- (void)fetchAdditionsHighWaterMarkWithPeer:(id)a3 highPriority:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  const char *v8;
  id v9;
  _DKSyncCloudKitKnowledgeStorage *common;
  id v11;

  v6 = a4;
  v11 = a3;
  v9 = a5;
  common = self->_common;
  if (common)
  {
    objc_setProperty_atomic(common, v8, self->_delegate, 160);
    common = self->_common;
  }
  -[_DKSyncCloudKitKnowledgeStorage fetchAdditionsHighWaterMarkWithPeer:highPriority:completion:](common, "fetchAdditionsHighWaterMarkWithPeer:highPriority:completion:", v11, v6, v9);

}

- (void)fetchDeletedEventIDsFromPeer:(id)a3 sinceDate:(id)a4 streamNames:(id)a5 limit:(unint64_t)a6 highPriority:(BOOL)a7 completion:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  const char *v16;
  id v17;
  _DKSyncCloudKitKnowledgeStorage *common;
  id v19;

  v9 = a7;
  v19 = a3;
  v14 = a4;
  v15 = a5;
  v17 = a8;
  common = self->_common;
  if (common)
  {
    objc_setProperty_atomic(common, v16, self->_delegate, 160);
    common = self->_common;
  }
  -[_DKSyncCloudKitKnowledgeStorage fetchDeletedEventIDsFromPeer:sinceDate:streamNames:limit:highPriority:completion:](common, "fetchDeletedEventIDsFromPeer:sinceDate:streamNames:limit:highPriority:completion:", v19, v14, v15, a6, v9, v17);

}

- (void)fetchDeletionsHighWaterMarkWithPeer:(id)a3 highPriority:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  const char *v8;
  id v9;
  _DKSyncCloudKitKnowledgeStorage *common;
  id v11;

  v6 = a4;
  v11 = a3;
  v9 = a5;
  common = self->_common;
  if (common)
  {
    objc_setProperty_atomic(common, v8, self->_delegate, 160);
    common = self->_common;
  }
  -[_DKSyncCloudKitKnowledgeStorage fetchDeletionsHighWaterMarkWithPeer:highPriority:completion:](common, "fetchDeletionsHighWaterMarkWithPeer:highPriority:completion:", v11, v6, v9);

}

- (void)fetchSourceDeviceIDFromPeer:(id)a3 highPriority:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  const char *v8;
  id v9;
  _DKSyncCloudKitKnowledgeStorage *common;
  id v11;

  v6 = a4;
  v11 = a3;
  v9 = a5;
  common = self->_common;
  if (common)
  {
    objc_setProperty_atomic(common, v8, self->_delegate, 160);
    common = self->_common;
  }
  -[_DKSyncCloudKitKnowledgeStorage fetchSourceDeviceIDFromPeer:highPriority:completion:](common, "fetchSourceDeviceIDFromPeer:highPriority:completion:", v11, v6, v9);

}

- (void)setFetchDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void)updateStorageWithAddedEvents:(id)a3 deletedEventIDs:(id)a4 highPriority:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  const char *v11;
  id v12;
  _DKSyncCloudKitKnowledgeStorage *common;
  id v14;

  v7 = a5;
  v14 = a3;
  v10 = a4;
  v12 = a6;
  common = self->_common;
  if (common)
  {
    objc_setProperty_atomic(common, v11, self->_delegate, 160);
    common = self->_common;
  }
  -[_DKSyncCloudKitKnowledgeStorage updateStorageWithAddedEvents:deletedEventIDs:highPriority:completion:](common, "updateStorageWithAddedEvents:deletedEventIDs:highPriority:completion:", v14, v10, v7, v12);

}

- (id)name
{
  return CFSTR("Cloud(Up)");
}

- (int64_t)transportType
{
  return 8;
}

- (_DKSyncCloudKitKnowledgeStorage)common
{
  return (_DKSyncCloudKitKnowledgeStorage *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCommon:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (_DKSyncRemoteKnowledgeStorageFetchDelegate)delegate
{
  return (_DKSyncRemoteKnowledgeStorageFetchDelegate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_common, 0);
}

@end
