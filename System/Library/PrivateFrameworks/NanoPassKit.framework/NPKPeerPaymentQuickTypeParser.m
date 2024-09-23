@implementation NPKPeerPaymentQuickTypeParser

- (NPKPeerPaymentQuickTypeParser)initWithSupportedCurrencyCodes:(id)a3 allowedPayloadIDs:(id)a4
{
  id v6;
  id v7;
  NPKPeerPaymentQuickTypeParser *v8;
  uint64_t v9;
  NSSet *supportedCurrencyCodes;
  uint64_t v11;
  NSSet *allowedPayloadIDs;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NPKPeerPaymentQuickTypeParser;
  v8 = -[NPKPeerPaymentQuickTypeParser init](&v14, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    supportedCurrencyCodes = v8->_supportedCurrencyCodes;
    v8->_supportedCurrencyCodes = (NSSet *)v9;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v7);
    v11 = objc_claimAutoreleasedReturnValue();
    allowedPayloadIDs = v8->_allowedPayloadIDs;
    v8->_allowedPayloadIDs = (NSSet *)v11;

  }
  return v8;
}

- (id)parsePayload:(id)a3 payloadID:(id)a4
{
  return -[NPKPeerPaymentQuickTypeParser parsePayload:payloadID:maxCount:](self, "parsePayload:payloadID:maxCount:", a3, a4, 0);
}

- (id)parsePayload:(id)a3 payloadID:(id)a4 maxCount:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  _BOOL4 v24;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  pk_General_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_General_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v33 = v9;
      v34 = 2112;
      v35 = v8;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Starting Parse payload for PayloadID:%@ payload:%@", buf, 0x16u);
    }

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPeerPaymentQuickTypeParser allowedPayloadIDs](self, "allowedPayloadIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v9;
  v16 = v14;
  if (!objc_msgSend(v16, "count"))
  {

    goto LABEL_10;
  }
  if (v15)
  {
    v17 = objc_msgSend(v16, "containsObject:", v15);

    if (!v17)
      goto LABEL_13;
LABEL_10:
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    -[NPKPeerPaymentQuickTypeParser supportedCurrencyCodes](self, "supportedCurrencyCodes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "npk_objectForKey:class:", CFSTR("Currency"), objc_opt_class());
    v21 = objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __65__NPKPeerPaymentQuickTypeParser_parsePayload_payloadID_maxCount___block_invoke;
    v26[3] = &unk_24CFE89B8;
    v29 = v18;
    v30 = v19;
    v27 = v20;
    v28 = v13;
    v31 = a5;
    v22 = v20;
    -[NSObject enumerateObjectsUsingBlock:](v21, "enumerateObjectsUsingBlock:", v26);

    goto LABEL_11;
  }

LABEL_13:
  pk_General_log();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

  if (!v24)
    goto LABEL_16;
  pk_General_log();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v15;
    _os_log_impl(&dword_213518000, v21, OS_LOG_TYPE_DEFAULT, "Warning: PayloadID:%@ Not allowed", buf, 0xCu);
  }
LABEL_11:

LABEL_16:
  return v13;
}

void __65__NPKPeerPaymentQuickTypeParser_parsePayload_payloadID_maxCount___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  NSDecimalNumber *v16;
  void *v17;
  char v18;
  NSObject *v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  _BOOL4 v25;
  int v26;
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSObject npk_objectForKey:class:](v6, "npk_objectForKey:class:", CFSTR("CurrencyType"), *(_QWORD *)(a1 + 56));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 32);
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9)
    {
      if (!objc_msgSend(v10, "count"))
      {

        goto LABEL_11;
      }
      v12 = objc_msgSend(v11, "containsObject:", v9);

      if (v12)
      {
LABEL_11:
        -[NSObject npk_objectForKey:class:](v6, "npk_objectForKey:class:", CFSTR("CurrencyValue"), *(_QWORD *)(a1 + 56));
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", v15);
          v16 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            objc_msgSend(MEMORY[0x24BDD1518], "notANumber");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = -[NSDecimalNumber isEqual:](v16, "isEqual:", v17);

            if ((v18 & 1) == 0)
            {
              PKCurrencyAmountCreate(v16, (NSString *)v9);
              v19 = objc_claimAutoreleasedReturnValue();
              if (v19)
                objc_msgSend(*(id *)(a1 + 40), "addObject:", v19);
              pk_General_log();
              v20 = objc_claimAutoreleasedReturnValue();
              v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

              if (v21)
              {
                pk_General_log();
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  v26 = 138412290;
                  v27 = v19;
                  _os_log_impl(&dword_213518000, v22, OS_LOG_TYPE_DEFAULT, "Notice: found valid amount:%@", (uint8_t *)&v26, 0xCu);
                }

              }
              v23 = *(_QWORD *)(a1 + 64);
              if (v23)
                LOBYTE(v23) = objc_msgSend(*(id *)(a1 + 40), "count") == *(_QWORD *)(a1 + 64);
              *a4 = v23;
              goto LABEL_27;
            }
          }
        }
        else
        {
          v16 = 0;
        }
        pk_General_log();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

        if (!v25)
        {
LABEL_28:

          goto LABEL_29;
        }
        pk_General_log();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v26 = 138412290;
          v27 = v6;
          _os_log_impl(&dword_213518000, v19, OS_LOG_TYPE_DEFAULT, "Warning: Not supported value from info:%@", (uint8_t *)&v26, 0xCu);
        }
LABEL_27:

        goto LABEL_28;
      }
    }
    else
    {

    }
    pk_General_log();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (!v14)
    {
LABEL_30:

      goto LABEL_31;
    }
    pk_General_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 138412290;
      v27 = v6;
      _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_DEFAULT, "Warning: Not supported currency code from info:%@", (uint8_t *)&v26, 0xCu);
    }
LABEL_29:

    goto LABEL_30;
  }
LABEL_31:

}

- (NSSet)supportedCurrencyCodes
{
  return self->_supportedCurrencyCodes;
}

- (NSSet)allowedPayloadIDs
{
  return self->_allowedPayloadIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedPayloadIDs, 0);
  objc_storeStrong((id *)&self->_supportedCurrencyCodes, 0);
}

@end
