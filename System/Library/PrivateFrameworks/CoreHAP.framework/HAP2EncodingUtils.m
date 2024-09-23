@implementation HAP2EncodingUtils

+ (id)removePairingRequestWithIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  HAP2TLVPairingStateWrapper *v6;
  HAP2TLVPairingMethodWrapper *v7;
  HAP2TLVRemovePairingRequest *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[HAP2TLVPairingStateWrapper initWithValue:]([HAP2TLVPairingStateWrapper alloc], "initWithValue:", 1);
  v7 = -[HAP2TLVPairingMethodWrapper initWithValue:]([HAP2TLVPairingMethodWrapper alloc], "initWithValue:", 4);
  v8 = -[HAP2TLVRemovePairingRequest initWithState:method:identifier:]([HAP2TLVRemovePairingRequest alloc], "initWithState:method:identifier:", v6, v7, v5);

  -[HAP2TLVRemovePairingRequest serializeWithError:](v8, "serializeWithError:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v12 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      if (a4)
        v14 = *a4;
      else
        v14 = 0;
      v15 = 138412290;
      v16 = v14;
      _os_log_error_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_ERROR, "Couldn't serialize request TLVs: %@", (uint8_t *)&v15, 0xCu);
    }
  }

  return v10;
}

+ (id)addPairingRequestWithIdentity:(id)a3 error:(id *)a4
{
  id v5;
  HAP2TLVPairingStateWrapper *v6;
  HAP2TLVPairingMethodWrapper *v7;
  HAPTLVUnsignedNumberValue *v8;
  void *v9;
  HAPTLVUnsignedNumberValue *v10;
  HAP2TLVAddPairingRequest *v11;
  void *v12;
  void *v13;
  void *v14;
  HAP2TLVAddPairingRequest *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v21;
  int v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[HAP2TLVPairingStateWrapper initWithValue:]([HAP2TLVPairingStateWrapper alloc], "initWithValue:", 1);
  v7 = -[HAP2TLVPairingMethodWrapper initWithValue:]([HAP2TLVPairingMethodWrapper alloc], "initWithValue:", 3);
  v8 = [HAPTLVUnsignedNumberValue alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "permissions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HAPTLVNumberValueBase initWithValue:](v8, "initWithValue:", v9);

  v11 = [HAP2TLVAddPairingRequest alloc];
  objc_msgSend(v5, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "publicKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "data");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HAP2TLVAddPairingRequest initWithState:method:identifier:publicKey:permissions:](v11, "initWithState:method:identifier:publicKey:permissions:", v6, v7, v12, v14, v10);

  -[HAP2TLVAddPairingRequest serializeWithError:](v15, "serializeWithError:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = v16;
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v19 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      if (a4)
        v21 = *a4;
      else
        v21 = 0;
      v22 = 138412290;
      v23 = v21;
      _os_log_error_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_ERROR, "Couldn't serialize request TLVs: %@", (uint8_t *)&v22, 0xCu);
    }
  }

  return v17;
}

+ (BOOL)parseAddOrRemovePairingRequestResponse:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  +[HAP2TLVAddOrRemovePairingResponse parsedFromData:error:](HAP2TLVAddOrRemovePairingResponse, "parsedFromData:error:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v13 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      if (a4)
        v14 = *a4;
      else
        v14 = 0;
      v24 = 138412290;
      v25 = v14;
      _os_log_error_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_ERROR, "Pairing request response failed to parse: %@", (uint8_t *)&v24, 0xCu);
    }
    goto LABEL_27;
  }
  objc_msgSend(v5, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "value");

  if (v8 != 2)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v15 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v17 = v15;
      objc_msgSend(v6, "state");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      HAP2TLVPairingStateAsString(objc_msgSend(v18, "value"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412290;
      v25 = v19;
      _os_log_error_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, "Pairing request response had invalid state: %@", (uint8_t *)&v24, 0xCu);

      if (!a4)
        goto LABEL_27;
    }
    else if (!a4)
    {
      goto LABEL_27;
    }
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = 15;
    goto LABEL_19;
  }
  objc_msgSend(v6, "responseError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v16 = 1;
    goto LABEL_28;
  }
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v10 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    v20 = v10;
    objc_msgSend(v6, "responseError");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    HAP2TLVErrorsAsString(objc_msgSend(v21, "value"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412290;
    v25 = v22;
    _os_log_error_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_ERROR, "Pairing request response had an error: %@", (uint8_t *)&v24, 0xCu);

    if (a4)
      goto LABEL_8;
LABEL_27:
    v16 = 0;
    goto LABEL_28;
  }
  if (!a4)
    goto LABEL_27;
LABEL_8:
  v11 = (void *)MEMORY[0x1E0CB35C8];
  v12 = 16;
LABEL_19:
  objc_msgSend(v11, "hapErrorWithCode:", v12);
  v16 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:

  return v16;
}

@end
