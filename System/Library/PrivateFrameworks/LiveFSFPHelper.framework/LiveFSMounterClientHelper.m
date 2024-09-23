@implementation LiveFSMounterClientHelper

- (void)createDomain:(id)a3 how:(int)a4 reply:(id)a5
{
  -[LiveFSMounterClientHelper createDomain:displayName:how:reply:](self, "createDomain:displayName:how:reply:", a3, a3, *(_QWORD *)&a4, a5);
}

- (void)LiveMounterClientCreateDomain:(id)a3 displayName:(id)a4 how:(int)a5 storageName:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD);
  dispatch_semaphore_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSString *providerName;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  _QWORD v26[4];
  NSObject *v27;
  _QWORD v28[4];
  NSObject *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  NSString *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = (void (**)(id, _QWORD))a7;
  v16 = dispatch_semaphore_create(0);
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__1;
  v35 = __Block_byref_object_dispose__1;
  v36 = 0;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC83C0]), "initWithIdentifier:displayName:pathRelativeToDocumentStorage:hidden:", v12, v13, v14, (a5 >> 7) & 1);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC83F0]), "_initWithProviderIdentifier:", self->_providerName);
  livefs_std_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    providerName = self->_providerName;
    *(_DWORD *)buf = 136315906;
    v38 = "-[LiveFSMounterClientHelper LiveMounterClientCreateDomain:displayName:how:storageName:reply:]";
    v39 = 2112;
    v40 = v12;
    v41 = 2112;
    v42 = v13;
    v43 = 2112;
    v44 = providerName;
    _os_log_impl(&dword_21F8A5000, v19, OS_LOG_TYPE_DEFAULT, "%s : LiveMounterClientCreateDomain: name(%@), displayName(%@) providerName(%@)", buf, 0x2Au);
  }

  if ((a5 & 0x20) != 0)
    objc_msgSend(v17, "setContainsPhotos:", 1);
  if ((a5 & 0x1000) != 0)
    objc_msgSend(v17, "setErasable:", 1);
  if ((a5 & 0x800) != 0)
    objc_msgSend(v17, "setReadOnly:", 1);
  v21 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __93__LiveFSMounterClientHelper_LiveMounterClientCreateDomain_displayName_how_storageName_reply___block_invoke;
  v28[3] = &unk_24E46B5A8;
  v30 = &v31;
  v22 = v16;
  v29 = v22;
  objc_msgSend(v18, "addDomain:completionHandler:", v17, v28);
  dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
  v23 = v32[5];
  if ((a5 & 1) == 0 || v23)
  {
    v24 = v18;
  }
  else
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC83F0]), "_initWithProviderIdentifier:domain:", self->_providerName, v17);

    v26[0] = v21;
    v26[1] = 3221225472;
    v26[2] = __93__LiveFSMounterClientHelper_LiveMounterClientCreateDomain_displayName_how_storageName_reply___block_invoke_2;
    v26[3] = &unk_24E46B5D0;
    v25 = v22;
    v27 = v25;
    objc_msgSend(v24, "setConnected:completionHandler:", 1, v26);
    dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);

    v23 = v32[5];
  }
  v15[2](v15, v23);

  _Block_object_dispose(&v31, 8);
}

void __93__LiveFSMounterClientHelper_LiveMounterClientCreateDomain_displayName_how_storageName_reply___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a2;
  if (v4)
  {
    livefs_std_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __93__LiveFSMounterClientHelper_LiveMounterClientCreateDomain_displayName_how_storageName_reply___block_invoke_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __93__LiveFSMounterClientHelper_LiveMounterClientCreateDomain_displayName_how_storageName_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  livefs_std_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __93__LiveFSMounterClientHelper_LiveMounterClientCreateDomain_displayName_how_storageName_reply___block_invoke_2_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = 0;
    _os_log_impl(&dword_21F8A5000, v5, OS_LOG_TYPE_DEFAULT, "setConnected:completionHandler: returned %@", (uint8_t *)&v12, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)createDomain:(id)a3 displayName:(id)a4 how:(int)a5 reply:(id)a6
{
  -[LiveFSMounterClientHelper LiveMounterClientCreateDomain:displayName:how:storageName:reply:](self, "LiveMounterClientCreateDomain:displayName:how:storageName:reply:", a3, a4, *(_QWORD *)&a5, a3, a6);
}

- (id)destroyDomain:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1;
  v18 = __Block_byref_object_dispose__1;
  v19 = 0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC83C0]), "initWithIdentifier:displayName:pathRelativeToDocumentStorage:", v4, v4, v4);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC83F0]), "_initWithProviderIdentifier:", self->_providerName);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __43__LiveFSMounterClientHelper_destroyDomain___block_invoke;
  v11[3] = &unk_24E46B5A8;
  v13 = &v14;
  v8 = v5;
  v12 = v8;
  objc_msgSend(v7, "removeDomain:completionHandler:", v6, v11);
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __43__LiveFSMounterClientHelper_destroyDomain___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a2;
  if (v4)
  {
    livefs_std_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __43__LiveFSMounterClientHelper_destroyDomain___block_invoke_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)internalSetProviderName:(id)a3
{
  objc_storeStrong((id *)&self->_providerName, a3);
}

- (NSString)providerName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setProviderName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerName, 0);
}

void __93__LiveFSMounterClientHelper_LiveMounterClientCreateDomain_displayName_how_storageName_reply___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_21F8A5000, a2, a3, "LiveMounterClientCreateDomain: addDomain returned error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

void __93__LiveFSMounterClientHelper_LiveMounterClientCreateDomain_displayName_how_storageName_reply___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_21F8A5000, a2, a3, "setConnected:completionHandler: returned %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

void __43__LiveFSMounterClientHelper_destroyDomain___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_21F8A5000, a2, a3, "RemoveDomain returned error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

@end
