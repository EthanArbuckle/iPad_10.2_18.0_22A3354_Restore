@implementation NPKRemotePassActionEnterValueResponse

- (NPKRemotePassActionEnterValueResponse)initWithTopUpAmount:(id)a3 fromRequest:(id)a4 withResult:(int)a5
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NPKRemotePassActionEnterValueResponse *v23;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "minimalFormattedStringValue");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "passLocalizedDescription");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.NanoPassKit"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("RESPONSE_REMOTE_PAYMENT_PASS_ACTION_RELOAD_CAPTION"), &stru_24CFF06D8, CFSTR("NanoPassKit-RemotePaymentPassAction"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)v8;
  objc_msgSend(v9, "localizedStringWithFormat:", v11, v8);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.NanoPassKit"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("RESPONSE_REMOTE_PAYMENT_PASS_ACTION_RELOAD_SUMMARY_TEXT"), &stru_24CFF06D8, CFSTR("NanoPassKit-RemotePaymentPassAction"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringWithFormat:", v14, v8, v26);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v6, "cardType");
  objc_msgSend(v6, "passOrganizationName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "amount");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = PKCurrencyDecimalToStorageInteger();
  objc_msgSend(v7, "currency");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "image");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "underlyingMessage");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = -[NPKRemotePassActionEnterValueResponse initWithIdentifier:cardType:passOrganizationName:result:incrementAmount:currencyCode:image:passLocalizedDesciption:caption:summaryText:message:](self, "initWithIdentifier:cardType:passOrganizationName:result:incrementAmount:currencyCode:image:passLocalizedDesciption:caption:summaryText:message:", v16, v25, v17, a5, v19, v20, v21, v26, v27, v15, v22);
  return v23;
}

- (NPKRemotePassActionEnterValueResponse)initWithIdentifier:(id)a3 cardType:(unint64_t)a4 passOrganizationName:(id)a5 result:(int)a6 incrementAmount:(int64_t)a7 currencyCode:(id)a8 image:(id)a9 passLocalizedDesciption:(id)a10 caption:(id)a11 summaryText:(id)a12 message:(id)a13
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  NPKProtoRemotePassActionEnvelope *v24;
  NPKProtoRemotePassActionEnterValueResponse *v25;
  void *v26;
  NPKRemotePassActionEnterValueResponse *v27;
  objc_super v33;

  v16 = a13;
  v17 = a12;
  v18 = a11;
  v19 = a10;
  v20 = a9;
  v21 = a8;
  v22 = a5;
  v23 = a3;
  v24 = objc_alloc_init(NPKProtoRemotePassActionEnvelope);
  -[NPKProtoRemotePassActionEnvelope setVersion:](v24, "setVersion:", 2);
  -[NPKProtoRemotePassActionEnvelope setIsResponse:](v24, "setIsResponse:", 1);
  -[NPKProtoRemotePassActionEnvelope setMessageType:](v24, "setMessageType:", 1);
  -[NPKProtoRemotePassActionEnvelope setPassLocalizedDescription:](v24, "setPassLocalizedDescription:", v19);

  -[NPKProtoRemotePassActionEnvelope setCaption:](v24, "setCaption:", v18);
  -[NPKProtoRemotePassActionEnvelope setSummaryText:](v24, "setSummaryText:", v17);

  -[NPKProtoRemotePassActionEnvelope setPassOrganizationName:](v24, "setPassOrganizationName:", v22);
  -[NPKProtoRemotePassActionEnvelope setCardType:](v24, "setCardType:", NPKProtoRemotePassActionCardTypeForNPKRemotePassActionCardType(a4));
  v25 = objc_alloc_init(NPKProtoRemotePassActionEnterValueResponse);
  -[NPKProtoRemotePassActionEnterValueResponse setResult:](v25, "setResult:", NPKProtoRemotePassActionResultForNPKProtoRemotePassActionResponseResult(a6));
  -[NPKProtoRemotePassActionEnterValueResponse setRequestUniqueID:](v25, "setRequestUniqueID:", v23);

  -[NPKProtoRemotePassActionEnterValueResponse setIncrementAmount:](v25, "setIncrementAmount:", a7);
  -[NPKProtoRemotePassActionEnterValueResponse setIncrementCurrency:](v25, "setIncrementCurrency:", v21);

  -[NPKProtoRemotePassActionEnterValueResponse data](v25, "data");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoRemotePassActionEnvelope setMessageProtoData:](v24, "setMessageProtoData:", v26);
  v33.receiver = self;
  v33.super_class = (Class)NPKRemotePassActionEnterValueResponse;
  v27 = -[NPKRemotePassAction initWithMessage:protoEnvelope:image:](&v33, sel_initWithMessage_protoEnvelope_image_, v16, v24, v20);

  return v27;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NPKRemotePassActionEnterValueResponse;
  -[NPKRemotePassActionResponse description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKRemotePassActionEnterValueResponse currencyAmount](self, "currencyAmount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" (currencyAmount:%@)"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)identifier
{
  void *v2;
  void *v3;

  -[NPKRemotePassActionEnterValueResponse protoResponse](self, "protoResponse");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestUniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int)result
{
  void *v2;
  int v3;

  -[NPKRemotePassActionEnterValueResponse protoResponse](self, "protoResponse");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = NPKRemotePassActionResponseResultForNPKProtoRemotePassActionResult(objc_msgSend(v2, "result"));

  return v3;
}

- (NPKProtoRemotePassActionEnterValueResponse)protoResponse
{
  NPKProtoRemotePassActionEnterValueResponse *protoResponse;
  void *v4;
  void *v5;
  NPKProtoRemotePassActionEnterValueResponse *v6;
  NPKProtoRemotePassActionEnterValueResponse *v7;

  protoResponse = self->_protoResponse;
  if (!protoResponse)
  {
    -[NPKRemotePassAction protoEnvelope](self, "protoEnvelope");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageProtoData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = -[NPKProtoRemotePassActionEnterValueResponse initWithData:]([NPKProtoRemotePassActionEnterValueResponse alloc], "initWithData:", v5);
    v7 = self->_protoResponse;
    self->_protoResponse = v6;

    protoResponse = self->_protoResponse;
  }
  return protoResponse;
}

- (id)currencyAmount
{
  PKCurrencyAmount *cachedCurrencyAmount;
  PKCurrencyAmount *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PKCurrencyAmount *v9;
  PKCurrencyAmount *v10;

  cachedCurrencyAmount = self->_cachedCurrencyAmount;
  if (cachedCurrencyAmount)
  {
    v3 = cachedCurrencyAmount;
  }
  else
  {
    -[NPKRemotePassActionEnterValueResponse protoResponse](self, "protoResponse");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "incrementAmount");
    PKCurrencyStorageIntegerToCurrencyDecimal();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[NPKRemotePassActionEnterValueResponse protoResponse](self, "protoResponse");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "incrementCurrency");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (PKCurrencyAmount *)objc_msgSend(objc_alloc(MEMORY[0x24BE6EAB8]), "initWithAmount:currency:exponent:", v6, v8, 1);
    v10 = self->_cachedCurrencyAmount;
    self->_cachedCurrencyAmount = v9;

    v3 = self->_cachedCurrencyAmount;
  }
  return v3;
}

- (void)setProtoResponse:(id)a3
{
  objc_storeStrong((id *)&self->_protoResponse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protoResponse, 0);
  objc_storeStrong((id *)&self->_cachedCurrencyAmount, 0);
}

@end
