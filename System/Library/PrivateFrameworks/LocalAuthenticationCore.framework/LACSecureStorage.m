@implementation LACSecureStorage

- (LACSecureStorage)initWithConfig:(id)a3
{
  id v5;
  LACSecureStorage *v6;
  LACSecureStorage *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACSecureStorage;
  v6 = -[LACSecureStorage init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_config, a3);

  return v7;
}

- (void)objectForRequest:(id)a3 connection:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  _QWORD aBlock[4];
  id v31;
  id v32;
  uint8_t buf[4];
  int v34;
  __int16 v35;
  LACSecureStorage *v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = objc_msgSend(v8, "key");
  LACLogStorage();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    v34 = v11;
    v35 = 2114;
    v36 = self;
    v37 = 1024;
    v38 = objc_msgSend(v8, "identifier");
    _os_log_impl(&dword_2409DC000, v12, OS_LOG_TYPE_DEFAULT, "objectForKey:%d on %{public}@ rid:%u", buf, 0x18u);
  }

  v13 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__LACSecureStorage_objectForRequest_connection_completionHandler___block_invoke;
  aBlock[3] = &unk_2510C29A0;
  v14 = v8;
  v31 = v14;
  v15 = v9;
  v32 = v15;
  v16 = _Block_copy(aBlock);
  v17 = -[LACSecureStorage _checkEntitlementForKey:operation:value:connection:failureHandler:](self, "_checkEntitlementForKey:operation:value:connection:failureHandler:", v11, 1, 0, v10, v16);

  if (v17)
  {
    if (v11 == 2)
    {
      -[LACSecureStorage delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bundleIDForRequest:", v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "contextID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[LACSecureStorage _protectedDataWithBundleId:contextID:completionHandler:](self, "_protectedDataWithBundleId:contextID:completionHandler:", v19, v20, v16);

    }
    else if (v11 == 21)
    {
      +[LACPasscodeHelper sharedInstance](LACPasscodeHelper, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "passcodeSuccessAge");
      v23 = v22;

      if (v23 <= 0.0)
      {
        (*((void (**)(void *, _QWORD, _QWORD))v16 + 2))(v16, 0, 0);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", (unint64_t)(v23 * 1000.0));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(void *, void *, _QWORD))v16 + 2))(v16, v24, 0);

      }
    }
    else
    {
      v25[0] = v13;
      v25[1] = 3221225472;
      v25[2] = __66__LACSecureStorage_objectForRequest_connection_completionHandler___block_invoke_2;
      v25[3] = &unk_2510C29F0;
      v25[4] = self;
      v26 = v14;
      v29 = v11;
      v27 = v15;
      v28 = v16;
      -[LACSecureStorage _acmVariableForKey:completionHandler:](self, "_acmVariableForKey:completionHandler:", v11, v25);

    }
  }

}

void __66__LACSecureStorage_objectForRequest_connection_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  int v10;
  id v11;
  _DWORD v12[2];
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  LACLogStorage();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    v9 = OS_LOG_TYPE_ERROR;
  else
    v9 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(v7, v9))
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "identifier");
    if (v6)
      v11 = v6;
    else
      v11 = v5;
    v12[0] = 67109378;
    v12[1] = v10;
    v13 = 2114;
    v14 = v11;
    _os_log_impl(&dword_2409DC000, v8, v9, "objectForKey rid:%u returned %{public}@", (uint8_t *)v12, 0x12u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __66__LACSecureStorage_objectForRequest_connection_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;

  if ((_DWORD)a2)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "contextID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __66__LACSecureStorage_objectForRequest_connection_completionHandler___block_invoke_2;
    v7[3] = &unk_2510C29C8;
    v6 = *(_QWORD *)(a1 + 64);
    v7[4] = *(_QWORD *)(a1 + 32);
    v9 = v6;
    v8 = *(id *)(a1 + 48);
    objc_msgSend(v4, "_variable:withcontextID:completionHandler:", a2, v5, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void __66__LACSecureStorage_objectForRequest_connection_completionHandler___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  v5 = (void *)a1[4];
  v6 = a1[6];
  v11 = 0;
  v7 = a3;
  objc_msgSend(v5, "_storageObjectForKey:data:error:", v6, a2, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v11;
  if (v9)
    v10 = v9;
  else
    v10 = v7;
  (*(void (**)(_QWORD, void *, id))(a1[5] + 16))(a1[5], v8, v10);

}

- (void)removeObjectForRequest:(id)a3 connection:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD aBlock[4];
  id v25;
  id v26;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  LACSecureStorage *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = objc_msgSend(v8, "key");
  LACLogStorage();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    v28 = v11;
    v29 = 2114;
    v30 = self;
    v31 = 1024;
    v32 = objc_msgSend(v8, "identifier");
    _os_log_impl(&dword_2409DC000, v12, OS_LOG_TYPE_DEFAULT, "removeObjectForKey:%d on %{public}@ rid:%u", buf, 0x18u);
  }

  v13 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__LACSecureStorage_removeObjectForRequest_connection_completionHandler___block_invoke;
  aBlock[3] = &unk_2510C29A0;
  v14 = v8;
  v25 = v14;
  v15 = v9;
  v26 = v15;
  v16 = _Block_copy(aBlock);
  v17 = -[LACSecureStorage _checkEntitlementForKey:operation:value:connection:failureHandler:](self, "_checkEntitlementForKey:operation:value:connection:failureHandler:", v11, 3, 0, v10, v16);

  if (v17)
  {
    if ((objc_msgSend((id)objc_opt_class(), "checkKey:supportsOperation:", v11, 3) & 1) != 0)
    {
      if (v11 == 2)
      {
        objc_msgSend(v14, "contextID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[LACSecureStorage _setProtectedData:acl:contextID:completionHandler:](self, "_setProtectedData:acl:contextID:completionHandler:", 0, 0, v18, v16);

      }
      else
      {
        v21[0] = v13;
        v21[1] = 3221225472;
        v21[2] = __72__LACSecureStorage_removeObjectForRequest_connection_completionHandler___block_invoke_10;
        v21[3] = &unk_2510C2A18;
        v21[4] = self;
        v22 = v14;
        v23 = v16;
        -[LACSecureStorage _acmVariableForKey:completionHandler:](self, "_acmVariableForKey:completionHandler:", v11, v21);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Operation not supported for key: %d."), v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[LACStorageError errorWithCode:debugDescription:](LACStorageError, "errorWithCode:debugDescription:", 3, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v15 + 2))(v15, 0, v20);

    }
  }

}

void __72__LACSecureStorage_removeObjectForRequest_connection_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  int v10;
  const __CFString *v11;
  _DWORD v12[2];
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a2;
  LACLogStorage();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
    v9 = OS_LOG_TYPE_ERROR;
  else
    v9 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(v7, v9))
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "identifier");
    v11 = CFSTR("success");
    if (v5)
      v11 = v5;
    v12[0] = 67109378;
    v12[1] = v10;
    v13 = 2114;
    v14 = v11;
    _os_log_impl(&dword_2409DC000, v8, v9, "removeObjectForKey rid:%u returned %{public}@", (uint8_t *)v12, 0x12u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __72__LACSecureStorage_removeObjectForRequest_connection_completionHandler___block_invoke_10(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  if ((_DWORD)a2)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "contextID");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setVariable:value:contextID:completionHandler:", a2, 0, v5, *(_QWORD *)(a1 + 48));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

- (void)setObject:(id)a3 forRequest:(id)a4 connection:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  _QWORD aBlock[4];
  id v37;
  id v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  int v42;
  __int16 v43;
  LACSecureStorage *v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_msgSend(v11, "key");
  if (objc_msgSend((id)objc_opt_class(), "isKeyAvailableForDataExchange:", v14))
  {
    -[LACSecureStorage _exchangeObject:request:connection:completionHandler:](self, "_exchangeObject:request:connection:completionHandler:", v10, v11, v12, v13);
  }
  else
  {
    LACLogStorage();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v40 = v10;
      v41 = 1024;
      v42 = v14;
      v43 = 2114;
      v44 = self;
      v45 = 1024;
      v46 = objc_msgSend(v11, "identifier");
      _os_log_impl(&dword_2409DC000, v15, OS_LOG_TYPE_DEFAULT, "setObject:%@ forKey:%d on %{public}@ rid:%u", buf, 0x22u);
    }

    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __70__LACSecureStorage_setObject_forRequest_connection_completionHandler___block_invoke;
    aBlock[3] = &unk_2510C29A0;
    v16 = v11;
    v37 = v16;
    v17 = v13;
    v38 = v17;
    v18 = _Block_copy(aBlock);
    if (-[LACSecureStorage _checkEntitlementForKey:operation:value:connection:failureHandler:](self, "_checkEntitlementForKey:operation:value:connection:failureHandler:", v14, 2, v10, v12, v18))
    {
      if ((objc_msgSend((id)objc_opt_class(), "checkKey:supportsOperation:", v14, 2) & 1) != 0)
      {
        v19 = (void *)objc_msgSend((id)objc_opt_class(), "classForKey:", v14);
        if (objc_msgSend(v19, "isEqual:", objc_opt_class()) && objc_msgSend(v10, "length") != 1)
        {
          +[LACStorageError errorWithCode:debugDescription:](LACStorageError, "errorWithCode:debugDescription:", 1, CFSTR("Expected BOOL in NSNumber."));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, _QWORD, void *))v17 + 2))(v17, 0, v20);
        }
        else
        {
          objc_msgSend((id)objc_opt_class(), "maxDataLengthForKey:", v14);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20 && (v30 = objc_msgSend(v10, "length"), v30 > objc_msgSend(v20, "unsignedIntegerValue")))
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Expected max %u bytes."), objc_msgSend(v20, "unsignedIntValue"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            +[LACStorageError errorWithCode:debugDescription:](LACStorageError, "errorWithCode:debugDescription:", 1, v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, _QWORD, void *))v17 + 2))(v17, 0, v22);

          }
          else
          {
            v31 = v20;
            objc_msgSend((id)objc_opt_class(), "minDataLengthForKey:", v14);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (v29 && (v24 = objc_msgSend(v10, "length"), v24 < objc_msgSend(v31, "unsignedIntegerValue")))
            {
              v21 = v29;
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Expected min %u bytes."), objc_msgSend(v29, "unsignedIntValue"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              +[LACStorageError errorWithCode:debugDescription:](LACStorageError, "errorWithCode:debugDescription:", 1, v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              (*((void (**)(id, _QWORD, void *))v17 + 2))(v17, 0, v26);

              v20 = v31;
            }
            else
            {
              if (v14 == 2)
              {
                objc_msgSend(v16, "acl");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "contextID");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                -[LACSecureStorage _setProtectedData:acl:contextID:completionHandler:](self, "_setProtectedData:acl:contextID:completionHandler:", v10, v27, v28, v18);

              }
              else
              {
                v32[0] = MEMORY[0x24BDAC760];
                v32[1] = 3221225472;
                v32[2] = __70__LACSecureStorage_setObject_forRequest_connection_completionHandler___block_invoke_17;
                v32[3] = &unk_2510C2A40;
                v32[4] = self;
                v33 = v10;
                v34 = v16;
                v35 = v18;
                -[LACSecureStorage _acmVariableForKey:completionHandler:](self, "_acmVariableForKey:completionHandler:", v14, v32);

              }
              v21 = v29;
              v20 = v31;
            }
          }

        }
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Operation not supported for key: %d."), v14);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[LACStorageError errorWithCode:debugDescription:](LACStorageError, "errorWithCode:debugDescription:", 3, v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *))v17 + 2))(v17, 0, v23);

      }
    }

  }
}

void __70__LACSecureStorage_setObject_forRequest_connection_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  int v10;
  const __CFString *v11;
  _DWORD v12[2];
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a2;
  LACLogStorage();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    v9 = OS_LOG_TYPE_INFO;
  else
    v9 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(v7, v9))
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "identifier");
    v11 = CFSTR("success");
    if (v5)
      v11 = v5;
    v12[0] = 67109378;
    v12[1] = v10;
    v13 = 2114;
    v14 = v11;
    _os_log_impl(&dword_2409DC000, v8, v9, "setObject rid:%u returned %{public}@", (uint8_t *)v12, 0x12u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __70__LACSecureStorage_setObject_forRequest_connection_completionHandler___block_invoke_17(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  id v6;

  if ((_DWORD)a2)
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "contextID");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setVariable:value:contextID:completionHandler:", a2, v5, v6, *(_QWORD *)(a1 + 56));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

- (void)aclForRequest:(id)a3 connection:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  id v15;
  void (**v16)(void *, _QWORD, void *);
  void *v17;
  __ACMHandle *v18;
  uint64_t DataProperty;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  _QWORD aBlock[4];
  id v25;
  id v26;
  uint8_t buf[8];
  __int128 v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "key");
  LACLogStorage();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&buf[4] = v11;
    LOWORD(v28) = 2114;
    *(_QWORD *)((char *)&v28 + 2) = self;
    WORD5(v28) = 1024;
    HIDWORD(v28) = objc_msgSend(v8, "identifier");
    _os_log_impl(&dword_2409DC000, v12, OS_LOG_TYPE_DEFAULT, "aclForKey:%d on %{public}@ rid:%u", buf, 0x18u);
  }

  v13 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__LACSecureStorage_aclForRequest_connection_completionHandler___block_invoke;
  aBlock[3] = &unk_2510C29A0;
  v14 = v8;
  v25 = v14;
  v15 = v10;
  v26 = v15;
  v16 = (void (**)(void *, _QWORD, void *))_Block_copy(aBlock);
  objc_msgSend(v14, "contextID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[LACSecureStorage _acmContextForUUID:failureHandler:](self, "_acmContextForUUID:failureHandler:", v17, v16);

  if (v18)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&v28 = buf;
    *((_QWORD *)&v28 + 1) = 0x3032000000;
    v29 = __Block_byref_object_copy__8;
    v30 = __Block_byref_object_dispose__8;
    v31 = 0;
    v23[0] = v13;
    v23[1] = 3221225472;
    v23[2] = __63__LACSecureStorage_aclForRequest_connection_completionHandler___block_invoke_18;
    v23[3] = &unk_2510C21E0;
    v23[4] = buf;
    DataProperty = ACMContextGetDataProperty(v18, 7u, 2u, (uint64_t)v23);
    if ((_DWORD)DataProperty == -7)
      goto LABEL_8;
    if ((_DWORD)DataProperty)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ACM failed to retrieve the ACL: %d"), DataProperty);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[LACStorageError errorWithCode:debugDescription:](LACStorageError, "errorWithCode:debugDescription:", 2, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v16[2](v16, 0, v22);

      goto LABEL_10;
    }
    v20 = *(_QWORD *)(v28 + 40);
    if (!v20)
LABEL_8:
      v16[2](v16, 0, 0);
    else
      v16[2](v16, v20, 0);
LABEL_10:
    _Block_object_dispose(buf, 8);

  }
}

void __63__LACSecureStorage_aclForRequest_connection_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  int v10;
  const __CFString *v11;
  _DWORD v12[2];
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a2;
  LACLogStorage();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    v9 = OS_LOG_TYPE_INFO;
  else
    v9 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(v7, v9))
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "identifier");
    v11 = CFSTR("success");
    if (v5)
      v11 = v5;
    v12[0] = 67109378;
    v12[1] = v10;
    v13 = 2114;
    v14 = v11;
    _os_log_impl(&dword_2409DC000, v8, v9, "setObject rid:%u returned %{public}@", (uint8_t *)v12, 0x12u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __63__LACSecureStorage_aclForRequest_connection_completionHandler___block_invoke_18(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  id v5;

  v3 = a2;
  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a2, a3);
    a2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v3)

}

+ (BOOL)isKeyAvailable:(int64_t)a3 operation:(int64_t)a4
{
  int v7;

  v7 = objc_msgSend(a1, "isKeyAvailable:");
  if (v7)
    LOBYTE(v7) = objc_msgSend(a1, "checkKey:supportsOperation:", a3, a4);
  return v7;
}

+ (BOOL)isKeyAvailable:(int64_t)a3
{
  if ((unint64_t)a3 > 0x17)
    return 0;
  if (((1 << a3) & 0xE359DE) != 0)
    return 1;
  return (((1 << a3) & 0x1C0000) != 0 || ((1 << a3) & 0xA000) != 0)
      && +[LACSysUtility isTXMDevice](LACSysUtility, "isTXMDevice");
}

+ (BOOL)isKeyAvailableForDataExchange:(int64_t)a3
{
  return a3 == 13;
}

+ (BOOL)checkKey:(int64_t)a3 supportsOperation:(int64_t)a4
{
  uint64_t *v4;
  BOOL result;

  switch(a3)
  {
    case 12:
    case 14:
    case 15:
    case 21:
    case 22:
      v4 = &LACStorageOperationQuery;
      goto LABEL_3;
    case 13:
      v4 = &LACStorageOperationDataExchange;
LABEL_3:
      result = *v4 == a4;
      break;
    default:
      result = a4 != 4;
      break;
  }
  return result;
}

+ (Class)classForKey:(int64_t)a3
{
  void *v3;

  if ((unint64_t)(a3 - 1) <= 0x16 && ((0x7FECEFu >> (a3 - 1)) & 1) != 0)
  {
    objc_opt_class();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (Class)v3;
}

+ (id)maxDataLengthForKey:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x13)
    return 0;
  else
    return (id)qword_2510C2B18[a3 - 1];
}

+ (id)minDataLengthForKey:(int64_t)a3
{
  if (a3 == 4 || a3 == 1)
    return &unk_2510F6CA0;
  else
    return 0;
}

+ (id)additionalBoolEntitlementForKey:(int64_t)a3 operation:(int64_t)a4 value:(id)a5
{
  __CFString *v5;
  __CFString **v6;
  BOOL v7;
  __CFString **v8;
  __CFString *v9;

  v5 = 0;
  switch(a3)
  {
    case 4:
      v7 = a4 == 3 || a4 == 2;
      v8 = LACEntitlementStorageSetOwnerPresence;
      goto LABEL_20;
    case 6:
      v7 = a4 == 3 || a4 == 2;
      v8 = LACEntitlementStorageSetLockdownMode;
      goto LABEL_20;
    case 7:
      v7 = a4 == 3 || a4 == 2;
      v8 = LACEntitlementStorageSetDSLModeEnabled;
      goto LABEL_20;
    case 8:
      v7 = a4 == 3 || a4 == 2;
      v8 = LACEntitlementStorageSetDSLMode;
LABEL_20:
      v9 = *v8;
      if (!v7)
        v9 = 0;
      goto LABEL_28;
    case 12:
      v6 = LACEntitlementStorageBiometricLivenessFlag;
      goto LABEL_27;
    case 13:
    case 15:
      v6 = LACEntitlementStorageUPP;
      goto LABEL_27;
    case 14:
      v6 = LACEntitlementStorageBiometricSuccessAge;
      goto LABEL_27;
    case 16:
      v6 = LACEntitlementStoragePSSO;
      goto LABEL_27;
    case 17:
    case 18:
    case 19:
    case 20:
      v6 = &LACEntitlementStoragePreboard;
      goto LABEL_27;
    case 21:
      v6 = LACEntitlementStoragePasscodeSuccessAge;
LABEL_27:
      v9 = *v6;
LABEL_28:
      v5 = v9;
      break;
    default:
      return v5;
  }
  return v5;
}

+ (int64_t)policyForKey:(int64_t)a3 operation:(int64_t)a4 value:(id)a5
{
  id v7;
  int64_t v8;
  int v9;
  uint64_t *v10;
  int64_t v11;
  int64_t *v12;
  void *v13;

  v7 = a5;
  v8 = 0;
  switch(a3)
  {
    case 1:
    case 17:
      if (a4 != 2)
        goto LABEL_28;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_28;
      v9 = objc_msgSend(v7, "BOOLValue");
      v10 = &LACPolicyDoublePressBypass;
      goto LABEL_8;
    case 3:
      if (a4 != 2)
        goto LABEL_28;
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", v13))
        v8 = 0;
      else
        v8 = 1024;

      break;
    case 6:
      if (a4 != 3)
      {
        if (a4 != 2)
          goto LABEL_28;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v7, "BOOLValue") & 1) != 0)
          goto LABEL_28;
      }
      v12 = &LACPolicyDeviceOwnerAuthentication;
      goto LABEL_20;
    case 7:
      if (a4 != 3)
      {
        if (a4 != 2)
          goto LABEL_28;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v7, "BOOLValue") & 1) != 0)
          goto LABEL_28;
      }
      v12 = &LACPolicyLocationBasedDeviceOwnerAuthenticationWithBiometricRatchet;
LABEL_20:
      v8 = *v12;
      break;
    case 18:
    case 19:
    case 20:
      if (a4 == 2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v9 = objc_msgSend(v7, "BOOLValue");
        v10 = &LACPolicyTouchIDEnrollment;
LABEL_8:
        v11 = *v10;
        if (v9)
          v8 = v11;
        else
          v8 = 0;
      }
      else
      {
LABEL_28:
        v8 = 0;
      }
      break;
    default:
      break;
  }

  return v8;
}

- (void)_exchangeObject:(id)a3 request:(id)a4 connection:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  _QWORD aBlock[4];
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  int v33;
  __int16 v34;
  LACSecureStorage *v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a5;
  v14 = objc_msgSend(v11, "key");
  LACLogStorage();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v31 = v10;
    v32 = 1024;
    v33 = v14;
    v34 = 2114;
    v35 = self;
    v36 = 1024;
    v37 = objc_msgSend(v11, "identifier");
    _os_log_impl(&dword_2409DC000, v15, OS_LOG_TYPE_DEFAULT, "exchangeObject:%@ forKey:%d on %{public}@ rid:%u", buf, 0x22u);
  }

  v16 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__LACSecureStorage__exchangeObject_request_connection_completionHandler___block_invoke;
  aBlock[3] = &unk_2510C29A0;
  v17 = v11;
  v28 = v17;
  v18 = v12;
  v29 = v18;
  v19 = _Block_copy(aBlock);
  v20 = -[LACSecureStorage _checkEntitlementForKey:operation:value:connection:failureHandler:](self, "_checkEntitlementForKey:operation:value:connection:failureHandler:", v14, 4, v10, v13, v19);

  if (v20)
  {
    if ((unint64_t)objc_msgSend(v10, "length") < 0x101)
    {
      v23[0] = v16;
      v23[1] = 3221225472;
      v23[2] = __73__LACSecureStorage__exchangeObject_request_connection_completionHandler___block_invoke_27;
      v23[3] = &unk_2510C2A40;
      v23[4] = self;
      v24 = v10;
      v25 = v17;
      v26 = v19;
      -[LACSecureStorage _acmSEPControlForKey:completionHandler:](self, "_acmSEPControlForKey:completionHandler:", v14, v23);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Expected max %u bytes."), 256);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[LACStorageError errorWithCode:debugDescription:](LACStorageError, "errorWithCode:debugDescription:", 1, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v18 + 2))(v18, 0, v22);

    }
  }

}

void __73__LACSecureStorage__exchangeObject_request_connection_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  int v10;
  const __CFString *v11;
  _DWORD v12[2];
  __int16 v13;
  id v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  LACLogStorage();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
    v9 = OS_LOG_TYPE_INFO;
  else
    v9 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(v7, v9))
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "identifier");
    v11 = CFSTR("success");
    v12[0] = 67109634;
    v12[1] = v10;
    if (v6)
      v11 = v6;
    v13 = 2112;
    v14 = v5;
    v15 = 2114;
    v16 = v11;
    _os_log_impl(&dword_2409DC000, v8, v9, "exchangeObject rid:%u returned %@, error: %{public}@", (uint8_t *)v12, 0x1Cu);
  }

  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
}

void __73__LACSecureStorage__exchangeObject_request_connection_completionHandler___block_invoke_27(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  id v6;

  if ((_DWORD)a2)
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "contextID");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_sepControl:value:contextID:completionHandler:", a2, v5, v6, *(_QWORD *)(a1 + 56));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

- (BOOL)_checkEntitlementForKey:(int64_t)a3 operation:(int64_t)a4 value:(id)a5 connection:(id)a6 failureHandler:(id)a7
{
  id v12;
  void (**v13)(id, _QWORD, void *);
  id v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;
  void *v20;

  v12 = a6;
  v13 = (void (**)(id, _QWORD, void *))a7;
  v14 = a5;
  objc_msgSend((id)objc_opt_class(), "additionalBoolEntitlementForKey:operation:value:", a3, a4, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15
    || -[LACSecureStorageConfiguration bypassEntitlementChecks](self->_config, "bypassEntitlementChecks")
    || (objc_msgSend(v12, "valueForEntitlement:", v15),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v16, "BOOLValue"),
        v16,
        (v17 & 1) != 0))
  {
    v18 = 1;
  }
  else
  {
    +[LACError missingEntitlementError:](LACError, "missingEntitlementError:", v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, v20);

    v18 = 0;
  }

  return v18;
}

- (void)_acmSEPControlForKey:(int64_t)a3 completionHandler:(id)a4
{
  void (*v5)(void);
  id v6;
  id v7;

  if (a3 == 13)
  {
    v5 = (void (*)(void))*((_QWORD *)a4 + 2);
    v7 = a4;
    v5();
  }
  else
  {
    v6 = a4;
    +[LACStorageError errorWithCode:debugDescription:](LACStorageError, "errorWithCode:debugDescription:", 2, CFSTR("Unknown storage for data exchange"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD))a4 + 2))(v6, 0);

  }
}

- (void)_acmVariableForKey:(int64_t)a3 completionHandler:(id)a4
{
  void (**v5)(void);
  void (*v6)(void);
  void *v7;
  void (**v8)(void);

  v5 = (void (**)(void))a4;
  v8 = v5;
  switch(a3)
  {
    case 1:
      v6 = v5[2];
      goto LABEL_19;
    case 3:
      v6 = v5[2];
      goto LABEL_19;
    case 4:
      v6 = v5[2];
      goto LABEL_19;
    case 6:
      v6 = v5[2];
      goto LABEL_19;
    case 7:
      v6 = v5[2];
      goto LABEL_19;
    case 8:
      v6 = v5[2];
      goto LABEL_19;
    case 11:
      v6 = v5[2];
      goto LABEL_19;
    case 12:
    case 14:
      v6 = v5[2];
      goto LABEL_19;
    case 15:
      v6 = v5[2];
      goto LABEL_19;
    case 16:
      v6 = v5[2];
      goto LABEL_19;
    case 17:
      v6 = v5[2];
      goto LABEL_19;
    case 18:
      v6 = v5[2];
      goto LABEL_19;
    case 19:
      v6 = v5[2];
      goto LABEL_19;
    case 20:
      v6 = v5[2];
      goto LABEL_19;
    case 22:
      v6 = v5[2];
      goto LABEL_19;
    case 23:
      v6 = v5[2];
LABEL_19:
      v6();
      break;
    default:
      +[LACStorageError errorWithCode:debugDescription:](LACStorageError, "errorWithCode:debugDescription:", 2, CFSTR("Unknown storage"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (*)(void (**)(void), _QWORD, void *))v8[2])(v8, 0, v7);

      break;
  }

}

- (void)_setStandardSecureBootModeCompletionHandler:(id)a3
{
  id v3;

  v3 = a3;
  AMFIGetSecurityBootModeArmed();
  (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, MEMORY[0x24BDBD1C8], 0);

}

- (void)_setSecureBootModeForACMVariable:(unsigned int)a3 completionHandler:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(id, _QWORD, void *);

  v9 = (void (**)(id, _QWORD, void *))a4;
  if (a3 == 54 || a3 == 60 || a3 == 55)
  {
    v5 = AMFIArmSecurityBootMode();
    if ((_DWORD)v5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected AMFI error when setting boot mode, amfiErr: %u"), v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[LACStorageError errorWithCode:debugDescription:](LACStorageError, "errorWithCode:debugDescription:", 2, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, 0, v7);

    }
    else
    {
      v9[2](v9, MEMORY[0x24BDBD1C8], 0);
    }
  }
  else
  {
    +[LACStorageError errorWithCode:debugDescription:](LACStorageError, "errorWithCode:debugDescription:", 2, CFSTR("Unexpected ACM var when reboot is requested"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v8);

  }
}

- (void)_setVariable:(unsigned int)a3 value:(id)a4 contextID:(id)a5 completionHandler:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  __ACMHandle *v13;
  __ACMHandle *v14;
  uint64_t bag_uuid;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  __int128 v29;
  uint64_t v30;

  v8 = *(_QWORD *)&a3;
  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v29 = 0uLL;
  if (!v11)
  {
    v14 = 0;
LABEL_7:
    v18 = objc_retainAutorelease(v10);
    v19 = ACMSetEnvironmentVariableWithAccessPolicy(v8, v14, &v29, 16, (const void *)objc_msgSend(v18, "bytes"), objc_msgSend(v18, "length"));
    if ((_DWORD)v19 == -17)
      goto LABEL_15;
    if (!(_DWORD)v19)
    {
      if (v8 > 0x3C || ((1 << v8) & 0x10C0000000000000) == 0)
      {
        (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, MEMORY[0x24BDBD1C8], 0);
        goto LABEL_17;
      }
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __67__LACSecureStorage__setVariable_value_contextID_completionHandler___block_invoke;
      v27[3] = &unk_2510C21B8;
      v28 = v12;
      -[LACSecureStorage _setStandardSecureBootModeCompletionHandler:](self, "_setStandardSecureBootModeCompletionHandler:", v27);
      v20 = v28;
      goto LABEL_12;
    }
    if (!v11 && (_DWORD)v19 == -3)
    {
LABEL_15:
      +[LACStorageError errorWithCode:debugDescription:](LACStorageError, "errorWithCode:debugDescription:", 0, CFSTR("Storage policy not satisfied."));
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((_DWORD)v19 == -27)
      {
        v25[0] = MEMORY[0x24BDAC760];
        v25[1] = 3221225472;
        v25[2] = __67__LACSecureStorage__setVariable_value_contextID_completionHandler___block_invoke_2;
        v25[3] = &unk_2510C21B8;
        v26 = v12;
        -[LACSecureStorage _setSecureBootModeForACMVariable:completionHandler:](self, "_setSecureBootModeForACMVariable:completionHandler:", v8, v25);
        v20 = v26;
LABEL_12:

        goto LABEL_17;
      }
      if ((_DWORD)v19 != -14)
      {
        v23 = "store";
        if (!v18)
          v23 = "remove";
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ACM failed to %s the value: %d"), v23, v19);
        goto LABEL_5;
      }
      -[LACSecureStorage _errorNotSupported](self, "_errorNotSupported");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    v22 = (void *)v21;
    (*((void (**)(id, _QWORD, uint64_t))v12 + 2))(v12, 0, v21);

    goto LABEL_17;
  }
  v13 = -[LACSecureStorage _acmContextForUUID:failureHandler:](self, "_acmContextForUUID:failureHandler:", v11, v12);
  if (v13)
  {
    v14 = v13;
    bag_uuid = aks_get_bag_uuid(0, &v29);
    if ((_DWORD)bag_uuid)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("AKS failed to get the keybag UUID: %x"), bag_uuid, v24);
LABEL_5:
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[LACStorageError errorWithCode:debugDescription:](LACStorageError, "errorWithCode:debugDescription:", 2, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v17);

      goto LABEL_17;
    }
    goto LABEL_7;
  }
LABEL_17:

}

uint64_t __67__LACSecureStorage__setVariable_value_contextID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__LACSecureStorage__setVariable_value_contextID_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    (*(void (**)(_QWORD))(v3 + 16))(*(_QWORD *)(a1 + 32));
  }
  else
  {
    +[LACStorageError errorWithCode:debugDescription:](LACStorageError, "errorWithCode:debugDescription:", 5, CFSTR("Storage requires reboot"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v4);

  }
}

- (void)_sepControl:(unsigned int)a3 value:(id)a4 contextID:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD, void *);
  __ACMHandle *v12;
  id v13;
  const void *v14;
  size_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v9 = a4;
  v10 = a5;
  v11 = (void (**)(id, _QWORD, void *))a6;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__8;
  v24 = __Block_byref_object_dispose__8;
  objc_msgSend(MEMORY[0x24BDBCE50], "data");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
    v12 = -[LACSecureStorage _acmContextForUUID:failureHandler:](self, "_acmContextForUUID:failureHandler:", v10, v11);
  else
    v12 = 0;
  v13 = objc_retainAutorelease(v9);
  v14 = (const void *)objc_msgSend(v13, "bytes");
  v15 = objc_msgSend(v13, "length");
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __66__LACSecureStorage__sepControl_value_contextID_completionHandler___block_invoke;
  v19[3] = &unk_2510C21E0;
  v19[4] = &v20;
  v16 = ACMSEPControlEx((uint64_t)v12, 0, 0, v14, v15, (uint64_t)v19);
  if ((_DWORD)v16 == -17)
    goto LABEL_9;
  if ((_DWORD)v16)
  {
    if (v10 || (_DWORD)v16 != -3)
    {
      if ((_DWORD)v16 == -14)
      {
        -[LACSecureStorage _errorNotSupported](self, "_errorNotSupported");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v11[2](v11, 0, v17);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ACMSEPControl failed: %d"), v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[LACStorageError errorWithCode:debugDescription:](LACStorageError, "errorWithCode:debugDescription:", 2, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v11[2](v11, 0, v18);

      }
      goto LABEL_10;
    }
LABEL_9:
    +[LACStorageError errorWithCode:debugDescription:](LACStorageError, "errorWithCode:debugDescription:", 0, CFSTR("Storage policy not satisfied."));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v17);
LABEL_10:

    goto LABEL_11;
  }
  v11[2](v11, v21[5], 0);
LABEL_11:
  _Block_object_dispose(&v20, 8);

}

void __66__LACSecureStorage__sepControl_value_contextID_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a2)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a2, a3);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

    }
  }
}

- (void)_variable:(unsigned int)a3 withcontextID:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__8;
  v19 = __Block_byref_object_dispose__8;
  v20 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __62__LACSecureStorage__variable_withcontextID_completionHandler___block_invoke;
  v14[3] = &unk_2510C21E0;
  v14[4] = &v15;
  v10 = ACMGetEnvironmentVariable(a3, (uint64_t)v14);
  if ((_DWORD)v10 == -14)
  {
    -[LACSecureStorage _errorNotSupported](self, "_errorNotSupported");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v12);
LABEL_9:

    goto LABEL_10;
  }
  if ((_DWORD)v10 == -7)
  {
LABEL_6:
    v9[2](v9, 0, 0);
    goto LABEL_10;
  }
  if ((_DWORD)v10)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ACM failed to query the value: %d"), v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[LACStorageError errorWithCode:debugDescription:](LACStorageError, "errorWithCode:debugDescription:", 2, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v13);

    goto LABEL_9;
  }
  v11 = v16[5];
  if (!v11)
    goto LABEL_6;
  v9[2](v9, v11, 0);
LABEL_10:
  _Block_object_dispose(&v15, 8);

}

void __62__LACSecureStorage__variable_withcontextID_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a2, a3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

- (void)_setProtectedData:(id)a3 acl:(id)a4 contextID:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD, void *);
  __ACMHandle *v13;
  __ACMHandle *v14;
  id v15;
  BOOL v16;
  unsigned int v17;
  _DWORD *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[3];

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD, void *))a6;
  v13 = -[LACSecureStorage _acmContextForUUID:failureHandler:](self, "_acmContextForUUID:failureHandler:", a5, v12);
  if (v13)
  {
    v14 = v13;
    v23[0] = 11;
    v15 = objc_retainAutorelease(v11);
    v23[1] = objc_msgSend(v15, "bytes");
    v23[2] = objc_msgSend(v15, "length");
    v16 = v15 == 0;
    v17 = v15 != 0;
    if (v16)
      v18 = 0;
    else
      v18 = v23;
    v19 = objc_retainAutorelease(v10);
    v20 = ACMContextSetDataEx(v14, 7, v18, v17, (const void *)objc_msgSend(v19, "bytes"), objc_msgSend(v19, "length"));
    if ((_DWORD)v20)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ACM failed to set protected data: %d"), v20, v23[0]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[LACStorageError errorWithCode:debugDescription:](LACStorageError, "errorWithCode:debugDescription:", 2, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, 0, v22);

    }
    else
    {
      v12[2](v12, MEMORY[0x24BDBD1C8], 0);
    }
  }

}

- (void)_protectedDataWithBundleId:(id)a3 contextID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  __ACMHandle *v11;
  __ACMHandle *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t Data;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _QWORD v27[3];
  __int16 v28;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  v11 = -[LACSecureStorage _acmContextForUUID:failureHandler:](self, "_acmContextForUUID:failureHandler:", v9, v10);
  if (v11)
  {
    v12 = v11;
    v28 = 4620;
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", &v28, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataUsingEncoding:", 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendData:", v14);

    v27[0] = 3;
    v15 = objc_retainAutorelease(v13);
    v27[1] = objc_msgSend(v15, "bytes");
    v27[2] = objc_msgSend(v15, "length");
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__8;
    v25 = __Block_byref_object_dispose__8;
    v26 = 0;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __75__LACSecureStorage__protectedDataWithBundleId_contextID_completionHandler___block_invoke;
    v20[3] = &unk_2510C21E0;
    v20[4] = &v21;
    Data = ACMContextGetDataEx(v12, 7, v27, 1u, (uint64_t)v20);
    if ((_DWORD)Data == -7)
      goto LABEL_6;
    if ((_DWORD)Data)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ACM failed to retrieve protected data: %d"), Data);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[LACStorageError errorWithCode:debugDescription:](LACStorageError, "errorWithCode:debugDescription:", 2, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, 0, v19);

      goto LABEL_8;
    }
    v17 = v22[5];
    if (!v17)
LABEL_6:
      v10[2](v10, 0, 0);
    else
      v10[2](v10, v17, 0);
LABEL_8:
    _Block_object_dispose(&v21, 8);

  }
}

void __75__LACSecureStorage__protectedDataWithBundleId_contextID_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  id v5;

  v3 = a2;
  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a2, a3);
    a2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v3)

}

- (id)_errorNotSupported
{
  return +[LACStorageError errorWithCode:debugDescription:](LACStorageError, "errorWithCode:debugDescription:", 3, CFSTR("Storage not supported on this device."));
}

- (__ACMHandle)_acmContextForUUID:(id)a3 failureHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  void *v8;
  void *v9;
  void *v10;
  id v11;
  __ACMHandle *v12;
  void *v13;
  id v14;
  id v16;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  -[LACSecureStorage delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[LACSecureStorage delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v9, "acmContextForUUID:error:", v6, &v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v16;

    if (v11)
    {
      v7[2](v7, 0, v11);
      v12 = 0;
    }
    else
    {
      v14 = objc_retainAutorelease(v10);
      v12 = (__ACMHandle *)ACMContextCreateWithExternalForm((_OWORD *)objc_msgSend(v14, "bytes"), objc_msgSend(v14, "length"));
    }

  }
  else
  {
    +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1000, CFSTR("Missing delegate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v13);

    v12 = 0;
  }

  return v12;
}

- (id)_storageObjectForKey:(int64_t)a3 data:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  id v15;

  v8 = a4;
  v9 = v8;
  if (a5)
    *a5 = 0;
  if (!v8)
    goto LABEL_16;
  v10 = (void *)objc_msgSend((id)objc_opt_class(), "classForKey:", a3);
  if ((objc_msgSend(v10, "isEqual:", objc_opt_class()) & 1) == 0)
  {
    v15 = v9;
LABEL_13:
    v14 = v15;
    goto LABEL_19;
  }
  if (a3 == 14)
  {
    -[LACSecureStorage _lastBioAuthDataToNumber:](self, "_lastBioAuthDataToNumber:", v9);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (a3 != 12)
  {
    if (objc_msgSend(v9, "length") == 1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v9), "bytes"));
      v15 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    if (a5)
    {
      +[LACStorageError errorWithCode:debugDescription:](LACStorageError, "errorWithCode:debugDescription:", 1, CFSTR("Expected BOOL in NSNumber"));
      v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
LABEL_16:
    v14 = 0;
    goto LABEL_19;
  }
  -[LACSecureStorage _lastBioAuthDataToNumber:](self, "_lastBioAuthDataToNumber:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = (unint64_t)objc_msgSend(v11, "integerValue") < 0x5265C01;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = (void *)MEMORY[0x24BDBD1C0];
  }

LABEL_19:
  return v14;
}

- (id)_lastBioAuthDataToNumber:(id)a3
{
  void *v3;

  if (*(_QWORD *)objc_msgSend(objc_retainAutorelease(a3), "bytes"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (LACSecureStorageDelegate)delegate
{
  return (LACSecureStorageDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (LACSecureStorageConfiguration)config
{
  return self->_config;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
