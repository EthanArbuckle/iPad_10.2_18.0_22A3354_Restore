@implementation HKAttachmentStore

- (HKAttachmentStore)initWithHealthStore:(HKHealthStore *)healthStore
{
  HKHealthStore *v5;
  HKAttachmentStore *v6;
  HKAttachmentStore *v7;
  HKTaskServerProxyProvider *v8;
  void *v9;
  uint64_t v10;
  HKTaskServerProxyProvider *proxyProvider;
  NSMutableDictionary *v12;
  NSMutableDictionary *attachmentDataHandlersByIdentifier;
  NSMutableDictionary *v14;
  NSMutableDictionary *dataStreamProgressByIdentifier;
  NSObject *v16;
  objc_super v18;
  uint8_t buf[4];
  HKAttachmentStore *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = healthStore;
  v18.receiver = self;
  v18.super_class = (Class)HKAttachmentStore;
  v6 = -[HKAttachmentStore init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, healthStore);
    v8 = [HKTaskServerProxyProvider alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:](v8, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v5, CFSTR("HKAttachmentStoreServerIdentifier"), v7, v9);
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = (HKTaskServerProxyProvider *)v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    attachmentDataHandlersByIdentifier = v7->_attachmentDataHandlersByIdentifier;
    v7->_attachmentDataHandlersByIdentifier = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    dataStreamProgressByIdentifier = v7->_dataStreamProgressByIdentifier;
    v7->_dataStreamProgressByIdentifier = v14;

    v7->_lock._os_unfair_lock_opaque = 0;
    -[HKProxyProvider setShouldRetryOnInterruption:](v7->_proxyProvider, "setShouldRetryOnInterruption:", 1);
    _HKInitializeLogging();
    v16 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v7;
      _os_log_impl(&dword_19A0E6000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Created new attachment store", buf, 0xCu);
    }
  }

  return v7;
}

+ (id)clientInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3CE788);
}

+ (id)serverInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40F768);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_remote_addReferenceWithAttachment_toObjectWithIdentifier_schemaIdentifier_metadata_completion_, 0, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_remote_attachmentReferencesForObjectIdentifier_schemaIdentifier_completion_, 0, 1);

  return v2;
}

- (id)exportedInterface
{
  return +[HKAttachmentStore clientInterface](HKAttachmentStore, "clientInterface");
}

- (id)remoteInterface
{
  return +[HKAttachmentStore serverInterface](HKAttachmentStore, "serverInterface");
}

- (void)addAttachmentToObject:(HKObject *)object name:(NSString *)name contentType:(UTType *)contentType URL:(NSURL *)URL metadata:(NSDictionary *)metadata completion:(void *)completion
{
  HKObject *v14;
  NSString *v15;
  UTType *v16;
  NSURL *v17;
  NSDictionary *v18;
  void *v19;
  BOOL v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v14 = object;
  v15 = name;
  v16 = contentType;
  v17 = URL;
  v18 = metadata;
  v19 = completion;
  v26 = 0;
  v20 = -[HKAttachmentStore _validateInputWithObject:contentType:URL:error:](self, "_validateInputWithObject:contentType:URL:error:", v14, v16, v17, &v26);
  v21 = v26;
  if (v20)
  {
    -[HKObject attachmentObjectIdentifier](v14, "attachmentObjectIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKObject attachmentSchemaIdentifier](v14, "attachmentSchemaIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __84__HKAttachmentStore_addAttachmentToObject_name_contentType_URL_metadata_completion___block_invoke;
    v24[3] = &unk_1E37F0FB0;
    v25 = v19;
    -[HKAttachmentStore addAttachmentWithName:contentType:URL:toObjectWithIdentifier:schemaIdentifier:attachmentMetadata:referenceMetadata:completion:](self, "addAttachmentWithName:contentType:URL:toObjectWithIdentifier:schemaIdentifier:attachmentMetadata:referenceMetadata:completion:", v15, v16, v17, v22, v23, v18, 0, v24);

  }
  else
  {
    (*((void (**)(void *, _QWORD, id))v19 + 2))(v19, 0, v21);
  }

}

void __84__HKAttachmentStore_addAttachmentToObject_name_contentType_URL_metadata_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "attachment");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (void)removeAttachment:(HKAttachment *)attachment fromObject:(HKObject *)object completion:(void *)completion
{
  HKAttachment *v8;
  HKObject *v9;
  void *v10;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v12;
  id v13;
  HKObject *v14;
  HKAttachment *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  HKAttachment *v19;
  HKObject *v20;
  id v21;

  v8 = attachment;
  v9 = object;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", completion);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __60__HKAttachmentStore_removeAttachment_fromObject_completion___block_invoke;
  v18[3] = &unk_1E37F0FD8;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __60__HKAttachmentStore_removeAttachment_fromObject_completion___block_invoke_2;
  v16[3] = &unk_1E37E6B38;
  v17 = v21;
  v13 = v21;
  v14 = v9;
  v15 = v8;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v18, v16);

}

void __60__HKAttachmentStore_removeAttachment_fromObject_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "attachmentObjectIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "attachmentSchemaIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remote_removeAllReferencesWithAttachmentIdentifier:objectIdentifier:schemaIdentifier:completion:", v7, v5, v6, *(_QWORD *)(a1 + 48));

}

uint64_t __60__HKAttachmentStore_removeAttachment_fromObject_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getAttachmentsForObject:(HKObject *)object completion:(void *)completion
{
  void *v6;
  HKObject *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = completion;
  v7 = object;
  -[HKObject attachmentObjectIdentifier](v7, "attachmentObjectIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKObject attachmentSchemaIdentifier](v7, "attachmentSchemaIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__HKAttachmentStore_getAttachmentsForObject_completion___block_invoke;
  v11[3] = &unk_1E37EFDB8;
  v12 = v6;
  v10 = v6;
  -[HKAttachmentStore attachmentReferencesForObjectIdentifier:schemaIdentifier:completion:](self, "attachmentReferencesForObjectIdentifier:schemaIdentifier:completion:", v8, v9, v11);

}

void __56__HKAttachmentStore_getAttachmentsForObject_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(a2, "hk_map:", &__block_literal_global_75);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __56__HKAttachmentStore_getAttachmentsForObject_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "attachment");
}

- (NSProgress)getDataForAttachment:(HKAttachment *)attachment completion:(void *)completion
{
  HKTaskServerProxyProvider *proxyProvider;
  HKAttachment *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;

  proxyProvider = self->_proxyProvider;
  v7 = attachment;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](proxyProvider, "clientQueueObjectHandlerWithCompletion:", completion);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__HKAttachmentStore_getDataForAttachment_completion___block_invoke;
  v14[3] = &unk_1E37F1040;
  v15 = v9;
  v16 = v8;
  v10 = v9;
  v11 = v8;
  -[HKAttachmentStore streamDataForAttachment:dataHandler:](self, "streamDataForAttachment:dataHandler:", v7, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSProgress *)v12;
}

void __53__HKAttachmentStore_getDataForAttachment_completion___block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v7 = a3;
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "appendData:");
    if (a4)
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
      (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, 0);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (NSProgress)streamDataForAttachment:(HKAttachment *)attachment dataHandler:(void *)dataHandler
{
  HKAttachment *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *attachmentDataHandlersByIdentifier;
  void *v13;
  NSMutableDictionary *dataStreamProgressByIdentifier;
  void *v15;
  HKTaskServerProxyProvider *proxyProvider;
  id v17;
  HKAttachment *v18;
  _QWORD v20[5];
  HKAttachment *v21;
  id v22;
  _QWORD v23[4];
  HKAttachment *v24;
  _QWORD aBlock[5];
  id v26;

  v6 = attachment;
  v7 = dataHandler;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__HKAttachmentStore_streamDataForAttachment_dataHandler___block_invoke;
  aBlock[3] = &unk_1E37F1068;
  aBlock[4] = self;
  v26 = v7;
  v9 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", -[HKAttachment size](v6, "size"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  v11 = _Block_copy(v9);
  attachmentDataHandlersByIdentifier = self->_attachmentDataHandlersByIdentifier;
  -[HKAttachment identifier](v6, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](attachmentDataHandlersByIdentifier, "setObject:forKeyedSubscript:", v11, v13);

  dataStreamProgressByIdentifier = self->_dataStreamProgressByIdentifier;
  -[HKAttachment identifier](v6, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](dataStreamProgressByIdentifier, "setObject:forKeyedSubscript:", v10, v15);

  os_unfair_lock_unlock(&self->_lock);
  proxyProvider = self->_proxyProvider;
  v23[0] = v8;
  v23[1] = 3221225472;
  v23[2] = __57__HKAttachmentStore_streamDataForAttachment_dataHandler___block_invoke_3;
  v23[3] = &unk_1E37F1090;
  v24 = v6;
  v20[0] = v8;
  v20[1] = 3221225472;
  v20[2] = __57__HKAttachmentStore_streamDataForAttachment_dataHandler___block_invoke_4;
  v20[3] = &unk_1E37E89B8;
  v20[4] = self;
  v21 = v24;
  v22 = v9;
  v17 = v9;
  v18 = v24;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v23, v20);

  return (NSProgress *)v10;
}

void __57__HKAttachmentStore_streamDataForAttachment_dataHandler___block_invoke(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  char v17;

  v7 = a2;
  v8 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "clientQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__HKAttachmentStore_streamDataForAttachment_dataHandler___block_invoke_2;
  v13[3] = &unk_1E37EA9C8;
  v10 = *(id *)(a1 + 40);
  v15 = v8;
  v16 = v10;
  v14 = v7;
  v17 = a4;
  v11 = v8;
  v12 = v7;
  dispatch_async(v9, v13);

}

uint64_t __57__HKAttachmentStore_streamDataForAttachment_dataHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  return result;
}

uint64_t __57__HKAttachmentStore_streamDataForAttachment_dataHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_streamDataForAttachment:", *(_QWORD *)(a1 + 32));
}

void __57__HKAttachmentStore_streamDataForAttachment_dataHandler___block_invoke_4(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 24);
  v8 = a2;
  os_unfair_lock_lock(v3);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, v5);

  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v7);

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)addReferenceWithAttachment:(id)a3 toObjectWithIdentifier:(id)a4 schemaIdentifier:(id)a5 metadata:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v18 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __108__HKAttachmentStore_addReferenceWithAttachment_toObjectWithIdentifier_schemaIdentifier_metadata_completion___block_invoke;
  v26[3] = &unk_1E37F10B8;
  v27 = v12;
  v28 = v13;
  v29 = v14;
  v30 = v15;
  v31 = v16;
  v24[0] = v18;
  v24[1] = 3221225472;
  v24[2] = __108__HKAttachmentStore_addReferenceWithAttachment_toObjectWithIdentifier_schemaIdentifier_metadata_completion___block_invoke_2;
  v24[3] = &unk_1E37E6B38;
  v25 = v31;
  v19 = v31;
  v20 = v15;
  v21 = v14;
  v22 = v13;
  v23 = v12;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v26, v24);

}

uint64_t __108__HKAttachmentStore_addReferenceWithAttachment_toObjectWithIdentifier_schemaIdentifier_metadata_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_addReferenceWithAttachment:toObjectWithIdentifier:schemaIdentifier:metadata:completion:", a1[4], a1[5], a1[6], a1[7], a1[8]);
}

uint64_t __108__HKAttachmentStore_addReferenceWithAttachment_toObjectWithIdentifier_schemaIdentifier_metadata_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeReference:(id)a3 schemaIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __65__HKAttachmentStore_removeReference_schemaIdentifier_completion___block_invoke;
  v18[3] = &unk_1E37F0FD8;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __65__HKAttachmentStore_removeReference_schemaIdentifier_completion___block_invoke_2;
  v16[3] = &unk_1E37E6B38;
  v17 = v21;
  v13 = v21;
  v14 = v9;
  v15 = v8;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v18, v16);

}

void __65__HKAttachmentStore_removeReference_schemaIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "attachment");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remote_removeAllReferencesWithAttachmentIdentifier:objectIdentifier:schemaIdentifier:completion:", v5, v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __65__HKAttachmentStore_removeReference_schemaIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addAttachmentWithName:(id)a3 contentType:(id)a4 URL:(id)a5 toObjectWithIdentifier:(id)a6 schemaIdentifier:(id)a7 attachmentMetadata:(id)a8 referenceMetadata:(id)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  HKTaskServerProxyProvider *proxyProvider;
  id v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  void *v23;
  id v24;
  uint64_t v25;
  void (**v26)(_QWORD, _QWORD, _QWORD);
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  HKTaskServerProxyProvider *v34;
  void *v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  void (**v49)(_QWORD, _QWORD, _QWORD);
  id v50[2];

  v37 = a3;
  v36 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  proxyProvider = self->_proxyProvider;
  v21 = a5;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](proxyProvider, "clientQueueObjectHandlerWithCompletion:", a10);
  v22 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v50[0] = 0;
  objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingFromURL:error:", v21, v50);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v50[0];
  if (!v23)
    ((void (**)(_QWORD, _QWORD, id))v22)[2](v22, 0, v24);
  v34 = self->_proxyProvider;
  v25 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __147__HKAttachmentStore_addAttachmentWithName_contentType_URL_toObjectWithIdentifier_schemaIdentifier_attachmentMetadata_referenceMetadata_completion___block_invoke;
  v41[3] = &unk_1E37F10E0;
  v42 = v37;
  v43 = v36;
  v35 = v24;
  v44 = v23;
  v45 = v16;
  v46 = v17;
  v47 = v18;
  v48 = v19;
  v49 = v22;
  v38[0] = v25;
  v38[1] = 3221225472;
  v38[2] = __147__HKAttachmentStore_addAttachmentWithName_contentType_URL_toObjectWithIdentifier_schemaIdentifier_attachmentMetadata_referenceMetadata_completion___block_invoke_2;
  v38[3] = &unk_1E37E69F8;
  v39 = v44;
  v40 = v49;
  v26 = v49;
  v27 = v44;
  v28 = v19;
  v29 = v18;
  v30 = v17;
  v31 = v16;
  v32 = v36;
  v33 = v37;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](v34, "fetchProxyWithHandler:errorHandler:", v41, v38);

}

void __147__HKAttachmentStore_addAttachmentWithName_contentType_URL_toObjectWithIdentifier_schemaIdentifier_attachmentMetadata_referenceMetadata_completion___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v3 = a1[4];
  v4 = (void *)a1[5];
  v5 = a2;
  objc_msgSend(v4, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remote_addAttachmentWithName:contentTypeIdentifier:fileHandle:toObjectWithIdentifier:schemaIdentifier:attachmentMetadata:referenceMetadata:completion:", v3, v6, a1[6], a1[7], a1[8], a1[9], a1[10], a1[11]);

}

void __147__HKAttachmentStore_addAttachmentWithName_contentType_URL_toObjectWithIdentifier_schemaIdentifier_attachmentMetadata_referenceMetadata_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "closeFile");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)attachmentReferencesForObjectIdentifier:(id)a3 schemaIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __89__HKAttachmentStore_attachmentReferencesForObjectIdentifier_schemaIdentifier_completion___block_invoke;
  v18[3] = &unk_1E37F0FD8;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __89__HKAttachmentStore_attachmentReferencesForObjectIdentifier_schemaIdentifier_completion___block_invoke_2;
  v16[3] = &unk_1E37E6B38;
  v17 = v21;
  v13 = v21;
  v14 = v9;
  v15 = v8;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v18, v16);

}

uint64_t __89__HKAttachmentStore_attachmentReferencesForObjectIdentifier_schemaIdentifier_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_attachmentReferencesForObjectIdentifier:schemaIdentifier:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __89__HKAttachmentStore_attachmentReferencesForObjectIdentifier_schemaIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getDataChunkForAttachment:(id)a3 chunkSize:(unint64_t)a4 offset:(unint64_t)a5 completion:(id)a6
{
  id v10;
  void *v11;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  unint64_t v21;
  unint64_t v22;

  v10 = a3;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v13 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __75__HKAttachmentStore_getDataChunkForAttachment_chunkSize_offset_completion___block_invoke;
  v18[3] = &unk_1E37F1108;
  v19 = v10;
  v21 = a4;
  v22 = a5;
  v20 = v11;
  v16[0] = v13;
  v16[1] = 3221225472;
  v16[2] = __75__HKAttachmentStore_getDataChunkForAttachment_chunkSize_offset_completion___block_invoke_2;
  v16[3] = &unk_1E37E6B38;
  v17 = v20;
  v14 = v20;
  v15 = v10;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v18, v16);

}

uint64_t __75__HKAttachmentStore_getDataChunkForAttachment_chunkSize_offset_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_getDataChunkForAttachment:chunkSize:offset:completion:", a1[4], a1[6], a1[7], a1[5]);
}

uint64_t __75__HKAttachmentStore_getDataChunkForAttachment_chunkSize_offset_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_validateInputWithObject:(id)a3 contentType:(id)a4 URL:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  char v24;
  id v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v35;
  id v36;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v9;
    objc_msgSend(v12, "sampleType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "supportsAttachments");

    if ((v14 & 1) != 0)
    {
      if ((objc_msgSend(v11, "isFileURL") & 1) != 0)
      {
        v15 = (void *)MEMORY[0x1E0CEC3F8];
        objc_msgSend(v11, "pathExtension");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "typeWithFilenameExtension:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17 && (objc_msgSend(v10, "conformsToType:", v17) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("Content Type is not equal to URL extension type"));
          v31 = (id)objc_claimAutoreleasedReturnValue();
          v32 = v31;
          if (v31)
          {
            if (a6)
              *a6 = objc_retainAutorelease(v31);
            else
              _HKLogDroppedError(v31);
          }

          v24 = 0;
          goto LABEL_31;
        }
        v18 = objc_alloc_init(MEMORY[0x1E0CB3620]);
        objc_msgSend(v11, "path");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 0;
        objc_msgSend(v18, "attributesOfItemAtPath:error:", v19, &v36);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v36;

        v35 = v21;
        if (v20)
        {
          v22 = objc_msgSend(v20, "fileSize", v21);
          objc_msgSend(v12, "sampleType");
          v23 = (id)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "canAttachFileOfType:size:error:", v10, v22, a6);
LABEL_30:

LABEL_31:
LABEL_32:

          goto LABEL_33;
        }
        v33 = v21;
        v23 = v33;
        if (v33)
        {
          if (a6)
          {
            v23 = objc_retainAutorelease(v33);
            v24 = 0;
            *a6 = v23;
            goto LABEL_30;
          }
          _HKLogDroppedError(v33);
        }
        v24 = 0;
        goto LABEL_30;
      }
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v28 = CFSTR("Only file URLs are supported");
    }
    else
    {
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v28 = CFSTR("The object type is not supported");
    }
    objc_msgSend(v27, "hk_error:format:", 3, v28);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
    {
      if (a6)
        *a6 = objc_retainAutorelease(v29);
      else
        _HKLogDroppedError(v29);
    }

    v24 = 0;
    goto LABEL_32;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("The object type is not supported"));
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v25);
    else
      _HKLogDroppedError(v25);
  }

  v24 = 0;
LABEL_33:

  return v24;
}

- (void)clientRemote_streamDataForAttachment:(id)a3 dataChunk:(id)a4 error:(id)a5 done:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *attachmentDataHandlersByIdentifier;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSMutableDictionary *dataStreamProgressByIdentifier;
  void *v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  NSMutableDictionary *v21;
  void *v22;
  id v23;

  v6 = a6;
  v23 = a3;
  v10 = a4;
  v11 = a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  attachmentDataHandlersByIdentifier = self->_attachmentDataHandlersByIdentifier;
  objc_msgSend(v23, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](attachmentDataHandlersByIdentifier, "objectForKeyedSubscript:", v14);
  v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  dataStreamProgressByIdentifier = self->_dataStreamProgressByIdentifier;
  objc_msgSend(v23, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](dataStreamProgressByIdentifier, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_lock);
  if ((objc_msgSend(v18, "isFinished") & 1) != 0)
  {
    if (!v6)
      goto LABEL_3;
LABEL_7:
    os_unfair_lock_lock(&self->_lock);
    v19 = self->_attachmentDataHandlersByIdentifier;
    objc_msgSend(v23, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", 0, v20);

    v21 = self->_dataStreamProgressByIdentifier;
    objc_msgSend(v23, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", 0, v22);

    os_unfair_lock_unlock(p_lock);
    if (!v15)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(v18, "setCompletedUnitCount:", objc_msgSend(v18, "totalUnitCount"));
  if (v6)
    goto LABEL_7;
LABEL_3:
  if (v15)
LABEL_4:
    ((void (**)(_QWORD, id, id, _BOOL8))v15)[2](v15, v10, v11, v6);
LABEL_5:

}

- (HKTaskServerProxyProvider)proxyProvider
{
  return self->_proxyProvider;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_dataStreamProgressByIdentifier, 0);
  objc_storeStrong((id *)&self->_attachmentDataHandlersByIdentifier, 0);
}

@end
