@implementation _NTKCollectionClientProxy

- (_NTKCollectionClientProxy)initWithWeakProxy:(id)a3
{
  id v4;
  _NTKCollectionClientProxy *v5;
  _NTKCollectionClientProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_NTKCollectionClientProxy;
  v5 = -[_NTKCollectionClientProxy init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_proxy, v4);

  return v6;
}

- (void)loadFullCollectionWithOrderedUUIDs:(id)a3 selectedUUID:(id)a4 facesDescriptorsByUUID:(id)a5 seqId:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(_QWORD);
  NTKCollectionClient **p_proxy;
  id v18;
  NSObject *v19;
  _QWORD v20[4];
  void (**v21)(_QWORD);
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id WeakRetained;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(_QWORD))a7;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__14;
  v27 = __Block_byref_object_dispose__14;
  p_proxy = &self->_proxy;
  WeakRetained = objc_loadWeakRetained((id *)p_proxy);
  if (v24[5])
  {
    v18 = objc_loadWeakRetained((id *)p_proxy);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __117___NTKCollectionClientProxy_loadFullCollectionWithOrderedUUIDs_selectedUUID_facesDescriptorsByUUID_seqId_completion___block_invoke;
    v20[3] = &unk_1E6BD1738;
    v21 = v16;
    v22 = &v23;
    objc_msgSend(v18, "loadFullCollectionWithOrderedUUIDs:selectedUUID:facesDescriptorsByUUID:seqId:completion:", v12, v13, v14, v15, v20);

  }
  else
  {
    _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[_NTKCollectionClientProxy loadFullCollectionWithOrderedUUIDs:selectedUUID:facesDescriptorsByUUID:seqId:completion:].cold.1();

    if (v16)
      v16[2](v16);
  }
  _Block_object_dispose(&v23, 8);

}

- (void)updateSelectedFaceUUID:(id)a3 seqId:(id)a4
{
  NTKCollectionClient **p_proxy;
  id v6;
  id v7;
  id WeakRetained;

  p_proxy = &self->_proxy;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_proxy);
  objc_msgSend(WeakRetained, "updateSelectedFaceUUID:seqId:", v7, v6);

}

- (void)updateOrderedFaceUUIDs:(id)a3 seqId:(id)a4
{
  NTKCollectionClient **p_proxy;
  id v6;
  id v7;
  id WeakRetained;

  p_proxy = &self->_proxy;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_proxy);
  objc_msgSend(WeakRetained, "updateOrderedFaceUUIDs:seqId:", v7, v6);

}

- (void)updateFaceForUUID:(id)a3 withConfigurationJSONRepresentation:(id)a4 seqId:(id)a5
{
  NTKCollectionClient **p_proxy;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  p_proxy = &self->_proxy;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_proxy);
  objc_msgSend(WeakRetained, "updateFaceForUUID:withConfigurationJSONRepresentation:seqId:", v10, v9, v8);

}

- (void)updateFaceForUUID:(id)a3 withResourceDirectory:(id)a4 seqId:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  void (**v17)(_QWORD);
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id WeakRetained;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(_QWORD))a6;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__14;
  v23 = __Block_byref_object_dispose__14;
  WeakRetained = objc_loadWeakRetained((id *)&self->_proxy);
  v14 = (void *)v20[5];
  if (v14)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __86___NTKCollectionClientProxy_updateFaceForUUID_withResourceDirectory_seqId_completion___block_invoke;
    v16[3] = &unk_1E6BD1738;
    v17 = v13;
    v18 = &v19;
    objc_msgSend(v14, "updateFaceForUUID:withResourceDirectory:seqId:completion:", v10, v11, v12, v16);

  }
  else
  {
    _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[_NTKCollectionClientProxy updateFaceForUUID:withResourceDirectory:seqId:completion:].cold.1();

    if (v13)
      v13[2](v13);
  }
  _Block_object_dispose(&v19, 8);

}

- (void)removeFaceForUUID:(id)a3 seqId:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  NTKCollectionClient **p_proxy;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  void (**v15)(_QWORD);
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id WeakRetained;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__14;
  v21 = __Block_byref_object_dispose__14;
  p_proxy = &self->_proxy;
  WeakRetained = objc_loadWeakRetained((id *)p_proxy);
  if (v18[5])
  {
    v12 = objc_loadWeakRetained((id *)p_proxy);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __64___NTKCollectionClientProxy_removeFaceForUUID_seqId_completion___block_invoke;
    v14[3] = &unk_1E6BD1738;
    v15 = v10;
    v16 = &v17;
    objc_msgSend(v12, "removeFaceForUUID:seqId:completion:", v8, v9, v14);

  }
  else
  {
    _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[_NTKCollectionClientProxy removeFaceForUUID:seqId:completion:].cold.1();

    if (v10)
      v10[2](v10);
  }
  _Block_object_dispose(&v17, 8);

}

- (void)resetClientCollectionWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  NTKCollectionClient **p_proxy;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  void (**v9)(_QWORD);
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id WeakRetained;

  v4 = (void (**)(_QWORD))a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__14;
  v15 = __Block_byref_object_dispose__14;
  p_proxy = &self->_proxy;
  WeakRetained = objc_loadWeakRetained((id *)p_proxy);
  if (v12[5])
  {
    v6 = objc_loadWeakRetained((id *)p_proxy);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65___NTKCollectionClientProxy_resetClientCollectionWithCompletion___block_invoke;
    v8[3] = &unk_1E6BD1738;
    v9 = v4;
    v10 = &v11;
    objc_msgSend(v6, "resetClientCollectionWithCompletion:", v8);

  }
  else
  {
    _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_NTKCollectionClientProxy resetClientCollectionWithCompletion:].cold.1();

    if (v4)
      v4[2](v4);
  }
  _Block_object_dispose(&v11, 8);

}

- (void)flushCompleteForIdentifier:(id)a3
{
  NTKCollectionClient **p_proxy;
  id v4;
  id WeakRetained;

  p_proxy = &self->_proxy;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_proxy);
  objc_msgSend(WeakRetained, "flushCompleteForIdentifier:", v4);

}

- (void)addFaceInstanceDescriptor:(id)a3 forUUID:(id)a4 seqId:(id)a5
{
  NTKCollectionClient **p_proxy;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  p_proxy = &self->_proxy;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_proxy);
  objc_msgSend(WeakRetained, "addFaceInstanceDescriptor:forUUID:seqId:", v10, v9, v8);

}

- (void)upgradeFaceInstanceDescriptor:(id)a3 forUUID:(id)a4 seqID:(id)a5
{
  NTKCollectionClient **p_proxy;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  p_proxy = &self->_proxy;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_proxy);
  objc_msgSend(WeakRetained, "upgradeFaceInstanceDescriptor:forUUID:seqID:", v10, v9, v8);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_proxy);
}

- (void)loadFullCollectionWithOrderedUUIDs:selectedUUID:facesDescriptorsByUUID:seqId:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_5(&dword_1B72A3000, v0, v1, "Proxy is nil - cannot load collection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_1();
}

- (void)updateFaceForUUID:withResourceDirectory:seqId:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_5(&dword_1B72A3000, v0, v1, "Proxy is nil - cannot update face for UUID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_1();
}

- (void)removeFaceForUUID:seqId:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_5(&dword_1B72A3000, v0, v1, "Proxy is nil - cannot remove face for UUID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_1();
}

- (void)resetClientCollectionWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_5(&dword_1B72A3000, v0, v1, "Proxy is nil - cannot reset client collection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_1();
}

@end
