@implementation HAP2AccessoryServerSecureTransportThreadPaired

- (id)decryptData:(id)a3 type:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  id v16;
  objc_super v17;
  uint8_t buf[4];
  HAP2AccessoryServerSecureTransportThreadPaired *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (a4 != 1)
  {
    v17.receiver = self;
    v17.super_class = (Class)HAP2AccessoryServerSecureTransportThreadPaired;
    -[HAP2AccessoryServerSecureTransportBase decryptData:type:error:](&v17, sel_decryptData_type_error_, v8, a4, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  -[HAP2AccessoryServerSecureTransportThreadPaired eventEncryption](self, "eventEncryption");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v14 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = self;
      _os_log_error_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "%@ No event key was derived", buf, 0xCu);
      if (a5)
        goto LABEL_10;
    }
    else if (a5)
    {
LABEL_10:
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 1);
      v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    v11 = 0;
    goto LABEL_14;
  }
  -[HAP2AccessoryServerSecureTransportThreadPaired eventEncryption](self, "eventEncryption");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v10, "decrypt:additionalAuthenticatedData:error:", v8, 0, &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v16;

  if (v11)
  {
    v13 = v11;
  }
  else
  {
    -[HAP2AccessoryServerTransportBase closeWithError:completion:](self, "closeWithError:completion:", v12, &__block_literal_global_23685);
    if (a5)
      *a5 = objc_retainAutorelease(v12);
  }

LABEL_14:
  return v11;
}

- (id)securitySessionDidRequestAdditionalDerivedKeyTuples:(id)a3
{
  HAPSecuritySessionDelegateAdditionalDerivedKeyTuple *v3;
  void *v4;
  void *v5;
  HAPSecuritySessionDelegateAdditionalDerivedKeyTuple *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = [HAPSecuritySessionDelegateAdditionalDerivedKeyTuple alloc];
  objc_msgSend(CFSTR("Event-Salt"), "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("Event-Read-Encryption-Key"), "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HAPSecuritySessionDelegateAdditionalDerivedKeyTuple initWithName:saltData:infoData:](v3, "initWithName:saltData:infoData:", CFSTR("Event-Salt"), v4, v5);
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)securitySessionDidOpen:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  HAP2AccessoryServerSecureTransportThreadPaired *v13;

  v4 = a3;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __73__HAP2AccessoryServerSecureTransportThreadPaired_securitySessionDidOpen___block_invoke;
  v11 = &unk_1E894E0F8;
  v12 = v4;
  v13 = self;
  v5 = v4;
  v6 = (void *)MEMORY[0x1D17B7400](&v8);
  -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue", v8, v9, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addConcurrentBlock:", v6);

}

- (void)securitySession:(id)a3 didCloseWithError:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __84__HAP2AccessoryServerSecureTransportThreadPaired_securitySession_didCloseWithError___block_invoke;
  v12[3] = &unk_1E894E120;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  v10 = (void *)MEMORY[0x1D17B7400](v12);
  -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addConcurrentBlock:", v10);

}

- (HAPSecuritySessionEncryption)eventEncryption
{
  return self->_eventEncryption;
}

- (void)setEventEncryption:(id)a3
{
  objc_storeStrong((id *)&self->_eventEncryption, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventEncryption, 0);
}

id __84__HAP2AccessoryServerSecureTransportThreadPaired_securitySession_didCloseWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  objc_msgSend(*(id *)(a1 + 32), "setEventEncryption:", 0);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)HAP2AccessoryServerSecureTransportThreadPaired;
  return objc_msgSendSuper2(&v5, sel_securitySession_didCloseWithError_, v2, v3);
}

void __73__HAP2AccessoryServerSecureTransportThreadPaired_securitySessionDidOpen___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  HAPSecuritySessionEncryption *v4;
  void *v5;
  HAPSecuritySessionEncryption *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  objc_super v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "additionalDerivedKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Event-Salt"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = [HAPSecuritySessionEncryption alloc];
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HAPSecuritySessionEncryption initWithInputKey:outputKey:](v4, "initWithInputKey:outputKey:", v3, v5);
    objc_msgSend(*(id *)(a1 + 40), "setEventEncryption:", v6);

    v7 = *(_QWORD *)(a1 + 32);
    v10.receiver = *(id *)(a1 + 40);
    v10.super_class = (Class)HAP2AccessoryServerSecureTransportThreadPaired;
    objc_msgSendSuper2(&v10, sel_securitySessionDidOpen_, v7);
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v8 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v12 = v9;
      _os_log_error_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_ERROR, "%@ No event key was derived", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "close");
  }

}

void __73__HAP2AccessoryServerSecureTransportThreadPaired_decryptData_type_error___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v0 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1CCE01000, v0, OS_LOG_TYPE_INFO, "Security session closed", v1, 2u);
  }
}

@end
