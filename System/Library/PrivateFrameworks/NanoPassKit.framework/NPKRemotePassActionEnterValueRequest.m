@implementation NPKRemotePassActionEnterValueRequest

- (NPKRemotePassActionEnterValueRequest)initWithPass:(id)a3 image:(id)a4 balanceField:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NPKRemotePassActionEnterValueRequest *v27;
  void *v29;
  id v30;

  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = a5;
  v30 = a4;
  v9 = a3;
  objc_msgSend(v9, "uniqueID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "action");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "type");
  PKPaymentPassActionTypeToString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "action");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@:%@:%@"), v10, v12, v14);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.NanoPassKit"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("REQUEST_REMOTE_PAYMENT_PASS_ACTION_RELOAD_CAPTION"), &stru_24CFF06D8, CFSTR("NanoPassKit-RemotePaymentPassAction"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "localizedDescription");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.NanoPassKit"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("REQUEST_REMOTE_PAYMENT_PASS_ACTION_RELOAD_SUMMARY_TEXT"), &stru_24CFF06D8, CFSTR("NanoPassKit-RemotePaymentPassAction"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringWithFormat:", v23, v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = NPKRemotePassActionCardTypeForPass(v9);
  objc_msgSend(v9, "organizationName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = -[NPKRemotePassActionEnterValueRequest initWithIdentifier:cardType:passOrganizationName:balanceField:image:passLocalizedDesciption:caption:summaryText:](self, "initWithIdentifier:cardType:passOrganizationName:balanceField:image:passLocalizedDesciption:caption:summaryText:", v29, v25, v26, v8, v30, v20, v19, v24);
  return v27;
}

- (NPKRemotePassActionEnterValueRequest)initWithIdentifier:(id)a3 cardType:(unint64_t)a4 passOrganizationName:(id)a5 balanceField:(id)a6 image:(id)a7 passLocalizedDesciption:(id)a8 caption:(id)a9 summaryText:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NPKProtoRemotePassActionEnvelope *v22;
  NPKProtoRemotePassActionEnterValueRequest *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NPKRemotePassActionEnterValueRequest *v36;
  id v38;
  objc_super v40;

  v16 = a10;
  v17 = a9;
  v18 = a8;
  v38 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a3;
  v22 = objc_alloc_init(NPKProtoRemotePassActionEnvelope);
  -[NPKProtoRemotePassActionEnvelope setVersion:](v22, "setVersion:", 2);
  -[NPKProtoRemotePassActionEnvelope setIsResponse:](v22, "setIsResponse:", 0);
  -[NPKProtoRemotePassActionEnvelope setMessageType:](v22, "setMessageType:", 1);
  -[NPKProtoRemotePassActionEnvelope setPassLocalizedDescription:](v22, "setPassLocalizedDescription:", v18);

  -[NPKProtoRemotePassActionEnvelope setCaption:](v22, "setCaption:", v17);
  -[NPKProtoRemotePassActionEnvelope setSummaryText:](v22, "setSummaryText:", v16);

  -[NPKProtoRemotePassActionEnvelope setPassOrganizationName:](v22, "setPassOrganizationName:", v20);
  -[NPKProtoRemotePassActionEnvelope setCardType:](v22, "setCardType:", NPKProtoRemotePassActionCardTypeForNPKRemotePassActionCardType(a4));
  v23 = objc_alloc_init(NPKProtoRemotePassActionEnterValueRequest);
  objc_msgSend(v19, "action");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  NPKSecureArchiveObject(v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoRemotePassActionEnterValueRequest setPaymentPassActionData:](v23, "setPaymentPassActionData:", v25);

  objc_msgSend(v19, "balance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "identifiers");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "anyObject");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoRemotePassActionEnterValueRequest setBalanceIdentifier:](v23, "setBalanceIdentifier:", v28);

  objc_msgSend(v19, "label");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoRemotePassActionEnterValueRequest setBalanceLabel:](v23, "setBalanceLabel:", v29);

  objc_msgSend(v19, "balance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "currencyCode");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoRemotePassActionEnterValueRequest setCurrentBalanceCurrency:](v23, "setCurrentBalanceCurrency:", v31);

  objc_msgSend(v19, "balance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "currencyValue");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "amount");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoRemotePassActionEnterValueRequest setCurrentBalanceAmount:](v23, "setCurrentBalanceAmount:", PKCurrencyDecimalToStorageInteger());

  -[NPKProtoRemotePassActionEnterValueRequest setRequestUniqueID:](v23, "setRequestUniqueID:", v21);
  -[NPKProtoRemotePassActionEnterValueRequest data](v23, "data");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoRemotePassActionEnvelope setMessageProtoData:](v22, "setMessageProtoData:", v35);
  v40.receiver = self;
  v40.super_class = (Class)NPKRemotePassActionEnterValueRequest;
  v36 = -[NPKRemotePassAction initWithProtoEnvelope:image:](&v40, sel_initWithProtoEnvelope_image_, v22, v38);

  return v36;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NPKRemotePassActionEnterValueRequest;
  -[NPKRemotePassActionRequest description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKRemotePassActionEnterValueRequest balanceField](self, "balanceField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" (balanceField:%@)"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)identifier
{
  void *v2;
  void *v3;

  -[NPKRemotePassActionEnterValueRequest protoRequest](self, "protoRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestUniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)action
{
  void *v2;
  void *v3;

  -[NPKRemotePassActionEnterValueRequest balanceField](self, "balanceField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NPKProtoRemotePassActionEnterValueRequest)protoRequest
{
  NPKProtoRemotePassActionEnterValueRequest *protoRequest;
  NPKProtoRemotePassActionEnterValueRequest *v4;
  void *v5;
  void *v6;
  NPKProtoRemotePassActionEnterValueRequest *v7;
  NPKProtoRemotePassActionEnterValueRequest *v8;

  protoRequest = self->_protoRequest;
  if (!protoRequest)
  {
    v4 = [NPKProtoRemotePassActionEnterValueRequest alloc];
    -[NPKRemotePassAction protoEnvelope](self, "protoEnvelope");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "messageProtoData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NPKProtoRemotePassActionEnterValueRequest initWithData:](v4, "initWithData:", v6);
    v8 = self->_protoRequest;
    self->_protoRequest = v7;

    protoRequest = self->_protoRequest;
  }
  return protoRequest;
}

- (NPKBalanceField)balanceField
{
  NPKBalanceField *cachedBalanceField;
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NPKBalanceField *v15;
  void *v16;
  void *v17;
  void *v18;
  NPKBalanceField *v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  NPKBalanceField *v27;
  void *v29;
  uint8_t v30[16];
  uint8_t v31[16];
  uint8_t buf[16];

  cachedBalanceField = self->_cachedBalanceField;
  if (!cachedBalanceField)
  {
    -[NPKRemotePassActionEnterValueRequest protoRequest](self, "protoRequest");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "paymentPassActionData");
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = objc_opt_class();
        NPKSecureUnarchiveObject(v6, v7);
        v8 = objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = v8;
          objc_msgSend(v5, "currentBalanceAmount");
          PKCurrencyStorageIntegerToCurrencyDecimal();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "currentBalanceCurrency");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          PKCurrencyAmountMake();
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = objc_alloc(MEMORY[0x24BE6EC40]);
          objc_msgSend(v5, "balanceIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(v12, "initWithIdentifier:forCurrencyAmount:", v13, v29);

          v15 = [NPKBalanceField alloc];
          objc_msgSend(v5, "balanceLabel");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "formattedValue");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "balanceIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[NPKBalanceField initWithBalance:label:formattedValue:identifier:primaryBalance:action:pendingUpdateExpireDate:](v15, "initWithBalance:label:formattedValue:identifier:primaryBalance:action:pendingUpdateExpireDate:", v14, v16, v17, v18, 1, v9, 0);

LABEL_19:
LABEL_22:

          goto LABEL_23;
        }
        pk_RemotePassAction_log();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);

        if (v25)
        {
          pk_RemotePassAction_log();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v30 = 0;
            _os_log_impl(&dword_213518000, v26, OS_LOG_TYPE_ERROR, "Error: Missing Action", v30, 2u);
          }

        }
        v9 = 0;
LABEL_18:
        v19 = 0;
        goto LABEL_19;
      }
      pk_RemotePassAction_log();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);

      if (v23)
      {
        pk_RemotePassAction_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v31 = 0;
          _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_ERROR, "Error: Missing action data", v31, 2u);
        }
        goto LABEL_18;
      }
      v6 = 0;
    }
    else
    {
      pk_RemotePassAction_log();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);

      if (!v21)
      {
        v19 = 0;
LABEL_23:

        v27 = self->_cachedBalanceField;
        self->_cachedBalanceField = v19;

        cachedBalanceField = self->_cachedBalanceField;
        return cachedBalanceField;
      }
      pk_RemotePassAction_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: Missing proto request", buf, 2u);
      }
    }
    v19 = 0;
    goto LABEL_22;
  }
  return cachedBalanceField;
}

- (void)setProtoRequest:(id)a3
{
  objc_storeStrong((id *)&self->_protoRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protoRequest, 0);
  objc_storeStrong((id *)&self->_cachedBalanceField, 0);
}

@end
