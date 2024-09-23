@implementation NPKRemotePassActionSelectItemResponse

- (NPKRemotePassActionSelectItemResponse)initWithRenewalAmount:(id)a3 serviceProviderData:(id)a4 fromRequest:(id)a5 withResult:(int)a6
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NPKRemotePassActionSelectItemResponse *v35;

  v8 = a5;
  v32 = a4;
  v9 = a3;
  objc_msgSend(v8, "commutePlanField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "detailLabel");
  v11 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "passLocalizedDescription");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.NanoPassKit"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("RESPONSE_REMOTE_PAYMENT_PASS_ACTION_RENEW_CAPTION"), &stru_24CFF06D8, CFSTR("NanoPassKit-RemotePaymentPassAction"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)v11;
  objc_msgSend(v12, "localizedStringWithFormat:", v14, v11);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.NanoPassKit"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("RESPONSE_REMOTE_PAYMENT_PASS_ACTION_RENEW_SUMMARY_TEXT"), &stru_24CFF06D8, CFSTR("NanoPassKit-RemotePaymentPassAction"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringWithFormat:", v17, v11, v29);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v8, "cardType");
  objc_msgSend(v8, "passOrganizationName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "amount");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = PKCurrencyDecimalToStorageInteger();
  objc_msgSend(v9, "currency");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  NPKSecureArchiveObject(v32);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "image");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "underlyingMessage");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = -[NPKRemotePassActionSelectItemResponse initWithIdentifier:cardType:passOrganizationName:result:incrementAmount:currencyCode:serviceProviderDataData:image:passLocalizedDesciption:caption:summaryText:message:](self, "initWithIdentifier:cardType:passOrganizationName:result:incrementAmount:currencyCode:serviceProviderDataData:image:passLocalizedDesciption:caption:summaryText:message:", v19, v20, v28, a6, v27, v22, v23, v24, v29, v30, v18, v25);
  return v35;
}

- (NPKRemotePassActionSelectItemResponse)initWithIdentifier:(id)a3 cardType:(unint64_t)a4 passOrganizationName:(id)a5 result:(int)a6 incrementAmount:(int64_t)a7 currencyCode:(id)a8 serviceProviderDataData:(id)a9 image:(id)a10 passLocalizedDesciption:(id)a11 caption:(id)a12 summaryText:(id)a13 message:(id)a14
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  NPKProtoRemotePassActionEnvelope *v25;
  NPKProtoRemotePassActionSelectItemResponse *v26;
  void *v27;
  NPKRemotePassActionSelectItemResponse *v28;
  id v33;
  objc_super v35;

  v33 = a14;
  v17 = a13;
  v18 = a12;
  v19 = a11;
  v20 = a10;
  v21 = a9;
  v22 = a8;
  v23 = a5;
  v24 = a3;
  v25 = objc_alloc_init(NPKProtoRemotePassActionEnvelope);
  -[NPKProtoRemotePassActionEnvelope setVersion:](v25, "setVersion:", 2);
  -[NPKProtoRemotePassActionEnvelope setIsResponse:](v25, "setIsResponse:", 1);
  -[NPKProtoRemotePassActionEnvelope setMessageType:](v25, "setMessageType:", 2);
  -[NPKProtoRemotePassActionEnvelope setPassLocalizedDescription:](v25, "setPassLocalizedDescription:", v19);

  -[NPKProtoRemotePassActionEnvelope setCaption:](v25, "setCaption:", v18);
  -[NPKProtoRemotePassActionEnvelope setSummaryText:](v25, "setSummaryText:", v17);

  -[NPKProtoRemotePassActionEnvelope setPassOrganizationName:](v25, "setPassOrganizationName:", v23);
  -[NPKProtoRemotePassActionEnvelope setCardType:](v25, "setCardType:", NPKProtoRemotePassActionCardTypeForNPKRemotePassActionCardType(a4));
  v26 = objc_alloc_init(NPKProtoRemotePassActionSelectItemResponse);
  -[NPKProtoRemotePassActionSelectItemResponse setResult:](v26, "setResult:", NPKProtoRemotePassActionResultForNPKProtoRemotePassActionResponseResult(a6));
  -[NPKProtoRemotePassActionSelectItemResponse setRequestUniqueID:](v26, "setRequestUniqueID:", v24);

  -[NPKProtoRemotePassActionSelectItemResponse setIncrementAmount:](v26, "setIncrementAmount:", a7);
  -[NPKProtoRemotePassActionSelectItemResponse setIncrementCurrency:](v26, "setIncrementCurrency:", v22);

  -[NPKProtoRemotePassActionSelectItemResponse setServiceProviderDataData:](v26, "setServiceProviderDataData:", v21);
  -[NPKProtoRemotePassActionSelectItemResponse data](v26, "data");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoRemotePassActionEnvelope setMessageProtoData:](v25, "setMessageProtoData:", v27);
  v35.receiver = self;
  v35.super_class = (Class)NPKRemotePassActionSelectItemResponse;
  v28 = -[NPKRemotePassAction initWithMessage:protoEnvelope:image:](&v35, sel_initWithMessage_protoEnvelope_image_, v33, v25, v20);

  return v28;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NPKRemotePassActionSelectItemResponse;
  -[NPKRemotePassActionResponse description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKRemotePassActionSelectItemResponse serviceProviderData](self, "serviceProviderData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" (serviceProviderData:%@)"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)identifier
{
  void *v2;
  void *v3;

  -[NPKRemotePassActionSelectItemResponse protoResponse](self, "protoResponse");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestUniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int)result
{
  void *v2;
  int v3;

  -[NPKRemotePassActionSelectItemResponse protoResponse](self, "protoResponse");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = NPKRemotePassActionResponseResultForNPKProtoRemotePassActionResult(objc_msgSend(v2, "result"));

  return v3;
}

- (NPKProtoRemotePassActionSelectItemResponse)protoResponse
{
  NPKProtoRemotePassActionSelectItemResponse *protoResponse;
  void *v4;
  void *v5;
  NPKProtoRemotePassActionSelectItemResponse *v6;
  NPKProtoRemotePassActionSelectItemResponse *v7;

  protoResponse = self->_protoResponse;
  if (!protoResponse)
  {
    -[NPKRemotePassAction protoEnvelope](self, "protoEnvelope");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageProtoData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = -[NPKProtoRemotePassActionSelectItemResponse initWithData:]([NPKProtoRemotePassActionSelectItemResponse alloc], "initWithData:", v5);
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
    -[NPKRemotePassActionSelectItemResponse protoResponse](self, "protoResponse");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "incrementAmount");
    PKCurrencyStorageIntegerToCurrencyDecimal();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[NPKRemotePassActionSelectItemResponse protoResponse](self, "protoResponse");
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

- (id)serviceProviderData
{
  NSDictionary *cachedServiceProviderData;
  NSDictionary *v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSDictionary *v13;
  NSDictionary *v14;

  cachedServiceProviderData = self->_cachedServiceProviderData;
  if (cachedServiceProviderData)
  {
    v3 = cachedServiceProviderData;
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBCF20];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKRemotePassActionSelectItemResponse protoResponse](self, "protoResponse");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "serviceProviderDataData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NPKSecureUnarchiveObjectOfClasses(v12, v10);
    v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v14 = self->_cachedServiceProviderData;
    self->_cachedServiceProviderData = v13;

    v3 = self->_cachedServiceProviderData;
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
  objc_storeStrong((id *)&self->_cachedServiceProviderData, 0);
  objc_storeStrong((id *)&self->_cachedCurrencyAmount, 0);
}

@end
