@implementation NPKPaymentOptionsSerialization

+ (id)setTransactionDefaultsRequest
{
  id v2;
  NPKProtoSetTransactionDefaultsRequest *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  int v28;
  void *v29;
  _DWORD v31[2];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BE6ECC0]);
  v3 = objc_alloc_init(NPKProtoSetTransactionDefaultsRequest);
  objc_msgSend(v2, "defaultShippingAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      pk_Payment_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v31[0]) = 0;
        _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Sending default shipping address", (uint8_t *)v31, 2u);
      }

    }
    NPKSecureArchiveObject(v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKProtoSetTransactionDefaultsRequest setDefaultShippingAddress:](v3, "setDefaultShippingAddress:", v8);

  }
  objc_msgSend(v2, "defaultContactEmail");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      pk_Payment_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v31[0]) = 0;
        _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Sending default contact email", (uint8_t *)v31, 2u);
      }

    }
    NPKSecureArchiveObject(v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKProtoSetTransactionDefaultsRequest setDefaultContactEmail:](v3, "setDefaultContactEmail:", v13);

  }
  objc_msgSend(v2, "defaultContactPhone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    pk_Payment_log();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

    if (v16)
    {
      pk_Payment_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v31[0]) = 0;
        _os_log_impl(&dword_213518000, v17, OS_LOG_TYPE_DEFAULT, "Notice: Sending default contact phone", (uint8_t *)v31, 2u);
      }

    }
    NPKSecureArchiveObject(v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKProtoSetTransactionDefaultsRequest setDefaultContactPhone:](v3, "setDefaultContactPhone:", v18);

  }
  objc_msgSend(v2, "defaultContactName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    pk_Payment_log();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

    if (v21)
    {
      pk_Payment_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v31[0]) = 0;
        _os_log_impl(&dword_213518000, v22, OS_LOG_TYPE_DEFAULT, "Notice: Sending default contact name", (uint8_t *)v31, 2u);
      }

    }
    NPKSecureArchiveObject(v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKProtoSetTransactionDefaultsRequest setDefaultContactName:](v3, "setDefaultContactName:", v23);

  }
  objc_msgSend(v2, "_rawDefaultBillingAddresses");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    pk_Payment_log();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

    if (v26)
    {
      pk_Payment_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = objc_msgSend(v24, "count");
        v31[0] = 67109120;
        v31[1] = v28;
        _os_log_impl(&dword_213518000, v27, OS_LOG_TYPE_DEFAULT, "Notice: Sending %d default billing addresses", (uint8_t *)v31, 8u);
      }

    }
    NPKSecureArchiveObject(v24);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKProtoSetTransactionDefaultsRequest setDefaultBillingAddresses:](v3, "setDefaultBillingAddresses:", v29);

  }
  return v3;
}

+ (void)handleSetTransactionDefaultsRequest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  NSObject *v30;
  int v31;
  _DWORD v32[2];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE6ECC0]);
  if (objc_msgSend(v4, "hasDefaultShippingAddress"))
  {
    objc_msgSend(v4, "defaultShippingAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_contactFromEncodedData:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      pk_Payment_log();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

      if (v9)
      {
        pk_Payment_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v32[0]) = 0;
          _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Decoded default shipping address", (uint8_t *)v32, 2u);
        }

      }
      objc_msgSend(v5, "setDefaultShippingAddress:", v7);
    }

  }
  else
  {
    objc_msgSend(v5, "deleteDefaultShippingAddress");
  }
  if (objc_msgSend(v4, "hasDefaultContactEmail"))
  {
    objc_msgSend(v4, "defaultContactEmail");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_contactFromEncodedData:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      pk_Payment_log();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

      if (v14)
      {
        pk_Payment_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v32[0]) = 0;
          _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_DEFAULT, "Notice: Decoded default contact email", (uint8_t *)v32, 2u);
        }

      }
      objc_msgSend(v5, "setDefaultContactEmail:", v12);
    }

  }
  else
  {
    objc_msgSend(v5, "deleteDefaultContactEmail");
  }
  if (objc_msgSend(v4, "hasDefaultContactPhone"))
  {
    objc_msgSend(v4, "defaultContactPhone");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_contactFromEncodedData:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      pk_Payment_log();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

      if (v19)
      {
        pk_Payment_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v32[0]) = 0;
          _os_log_impl(&dword_213518000, v20, OS_LOG_TYPE_DEFAULT, "Notice: Decoded default contact phone", (uint8_t *)v32, 2u);
        }

      }
      objc_msgSend(v5, "setDefaultContactPhone:", v17);
    }

  }
  else
  {
    objc_msgSend(v5, "deleteDefaultContactPhone");
  }
  if (objc_msgSend(v4, "hasDefaultContactName"))
  {
    objc_msgSend(v4, "defaultContactName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_contactFromEncodedData:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      pk_Payment_log();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

      if (v24)
      {
        pk_Payment_log();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v32[0]) = 0;
          _os_log_impl(&dword_213518000, v25, OS_LOG_TYPE_DEFAULT, "Notice: Decoded default contact name", (uint8_t *)v32, 2u);
        }

      }
      objc_msgSend(v5, "setDefaultContactName:", v22);
    }

  }
  else
  {
    objc_msgSend(v5, "deleteDefaultContactName");
  }
  if (objc_msgSend(v4, "hasDefaultBillingAddresses"))
  {
    objc_msgSend(v4, "defaultBillingAddresses");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_billingAddressDictionaryFromEncodedData:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      pk_Payment_log();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);

      if (v29)
      {
        pk_Payment_log();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = objc_msgSend(v27, "count");
          v32[0] = 67109120;
          v32[1] = v31;
          _os_log_impl(&dword_213518000, v30, OS_LOG_TYPE_DEFAULT, "Notice: Decoded %d default billing addresses", (uint8_t *)v32, 8u);
        }

      }
      objc_msgSend(v5, "_setRawDefaultBillingAddresses:", v27);
    }

  }
  else
  {
    objc_msgSend(a1, "_deleteAllDefaultBillingAddresses:", v5);
  }

}

+ (void)_deleteAllDefaultBillingAddresses:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDBCE70];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setRawDefaultBillingAddresses:", v5);

}

+ (id)_contactFromEncodedData:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;

  v3 = a3;
  v4 = objc_opt_class();
  NPKSecureUnarchiveObject(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_billingAddressDictionaryFromEncodedData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  uint8_t buf[24];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v3, 0);
  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, *MEMORY[0x24BDD0E88]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    pk_General_log();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);

    if (v13)
    {
      pk_General_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_ERROR, "Error: Billing address is not a dictionary", buf, 2u);
      }

    }
    v11 = 0;
  }

  return v11;
}

@end
