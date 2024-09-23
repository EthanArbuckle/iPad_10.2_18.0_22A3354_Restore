@implementation CKVAdminXPCServiceWrapper

- (CKVAdminXPCServiceWrapper)init
{
  CKVAdminXPCServiceWrapper *v2;
  CKVXPCServiceBridge *v3;
  CKVXPCServiceBridge *xpcServiceBridge;
  CKVAdminXPCServiceWrapper *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKVAdminXPCServiceWrapper;
  v2 = -[CKVAdminXPCServiceWrapper init](&v7, sel_init);
  if (v2
    && (v3 = -[CKVXPCServiceBridge initWithServiceProtocol:machServiceName:]([CKVXPCServiceBridge alloc], "initWithServiceProtocol:machServiceName:", &unk_1EE783730, CFSTR("com.apple.siriknowledged.vocabulary.admin")), xpcServiceBridge = v2->_xpcServiceBridge, v2->_xpcServiceBridge = v3, xpcServiceBridge, !v2->_xpcServiceBridge))
  {
    v5 = 0;
  }
  else
  {
    v5 = v2;
  }

  return v5;
}

- (void)startEventSimulation:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  CKVXPCServiceBridge *xpcServiceBridge;
  id v6;
  id v7;

  v4 = a3;
  xpcServiceBridge = self->_xpcServiceBridge;
  v6 = a4;
  -[CKVXPCServiceBridge service](xpcServiceBridge, "service");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startEventSimulation:completion:", v4, v6);

}

- (void)handleTask:(unsigned __int16)a3 reason:(unsigned __int16)a4 completion:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  CKVXPCServiceBridge *xpcServiceBridge;
  id v8;
  id v9;

  v5 = a4;
  v6 = a3;
  xpcServiceBridge = self->_xpcServiceBridge;
  v8 = a5;
  -[CKVXPCServiceBridge service](xpcServiceBridge, "service");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleTask:reason:completion:", v6, v5, v8);

}

- (void)finishEventSimulation:(id)a3
{
  CKVXPCServiceBridge *xpcServiceBridge;
  id v4;
  id v5;

  xpcServiceBridge = self->_xpcServiceBridge;
  v4 = a3;
  -[CKVXPCServiceBridge service](xpcServiceBridge, "service");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishEventSimulation:", v4);

}

- (void)triggerMigration:(BOOL)a3 completeAfterTrigger:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  CKVXPCServiceBridge *xpcServiceBridge;
  id v8;
  id v9;

  v5 = a4;
  v6 = a3;
  xpcServiceBridge = self->_xpcServiceBridge;
  v8 = a5;
  -[CKVXPCServiceBridge service](xpcServiceBridge, "service");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "triggerMigration:completeAfterTrigger:completion:", v6, v5, v8);

}

- (void)triggerMaintenance:(id)a3
{
  CKVXPCServiceBridge *xpcServiceBridge;
  id v4;
  id v5;

  xpcServiceBridge = self->_xpcServiceBridge;
  v4 = a3;
  -[CKVXPCServiceBridge service](xpcServiceBridge, "service");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "triggerMaintenance:", v4);

}

- (void)captureVocabularySnapshot:(id)a3 completion:(id)a4
{
  CKVXPCServiceBridge *xpcServiceBridge;
  id v6;
  id v7;
  id v8;

  xpcServiceBridge = self->_xpcServiceBridge;
  v6 = a4;
  v7 = a3;
  -[CKVXPCServiceBridge service](xpcServiceBridge, "service");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "captureVocabularySnapshot:completion:", v7, v6);

}

- (void)rebuildSpeechProfileForUserId:(id)a3 completion:(id)a4
{
  CKVXPCServiceBridge *xpcServiceBridge;
  id v6;
  id v7;
  id v8;

  xpcServiceBridge = self->_xpcServiceBridge;
  v6 = a4;
  v7 = a3;
  -[CKVXPCServiceBridge service](xpcServiceBridge, "service");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rebuildSpeechProfileForUserId:completion:", v7, v6);

}

- (void)deleteAllItemsWithUserId:(id)a3 completion:(id)a4
{
  CKVXPCServiceBridge *xpcServiceBridge;
  id v6;
  id v7;
  id v8;

  xpcServiceBridge = self->_xpcServiceBridge;
  v6 = a4;
  v7 = a3;
  -[CKVXPCServiceBridge service](xpcServiceBridge, "service");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deleteAllItemsWithUserId:completion:", v7, v6);

}

- (void)deleteAllItemsWithUserId:(id)a3 deviceId:(id)a4 completion:(id)a5
{
  CKVXPCServiceBridge *xpcServiceBridge;
  id v8;
  id v9;
  id v10;
  id v11;

  xpcServiceBridge = self->_xpcServiceBridge;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CKVXPCServiceBridge service](xpcServiceBridge, "service");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deleteAllItemsWithUserId:deviceId:completion:", v10, v9, v8);

}

- (void)beginEvaluation:(id)a3 clean:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  CKVXPCServiceBridge *xpcServiceBridge;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  xpcServiceBridge = self->_xpcServiceBridge;
  v8 = a5;
  v9 = a3;
  -[CKVXPCServiceBridge service](xpcServiceBridge, "service");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "beginEvaluation:clean:completion:", v9, v5, v8);

}

- (void)endEvaluation:(id)a3
{
  CKVXPCServiceBridge *xpcServiceBridge;
  id v4;
  id v5;

  xpcServiceBridge = self->_xpcServiceBridge;
  v4 = a3;
  -[CKVXPCServiceBridge service](xpcServiceBridge, "service");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endEvaluation:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcServiceBridge, 0);
}

@end
