@implementation AMSFinanceResponse

- (BOOL)supportedProtocolVersion
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[AMSFinanceResponse _valueForProtocolKey:](self, "_valueForProtocolKey:", CFSTR("store-version"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("1.0"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3
      || (objc_msgSend(v2, "objectForKey:", CFSTR("*")), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v3, "objectForKey:", CFSTR("redirect-url"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4 == 0;

    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (NSError)serverError
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;

  -[AMSFinanceResponse _valueForProtocolKey:](self, "_valueForProtocolKey:", CFSTR("failureType"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v5 = 0;
LABEL_7:

    return (NSError *)v5;
  }
  -[AMSFinanceResponse _valueForProtocolKey:](self, "_valueForProtocolKey:", CFSTR("failureType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "longLongValue");

  if (v5)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("AMSServerErrorCode"));

    -[AMSFinanceResponse _valueForProtocolKey:](self, "_valueForProtocolKey:", CFSTR("m-allowed"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("AMSServerAllowed"));

    -[AMSFinanceResponse responseDictionary](self, "responseDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("AMSServerPayload"));

    -[AMSFinanceResponse _valueForProtocolKey:](self, "_valueForProtocolKey:", CFSTR("customerMessage"));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!-[__CFString length](v9, "length"))
    {

      v9 = CFSTR("The server encountered an error");
    }
    AMSCustomError(CFSTR("AMSErrorDomain"), 305, CFSTR("Server Error"), v9, v3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  return (NSError *)v5;
}

- (NSArray)pingURLs
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[AMSFinanceResponse _valueForProtocolKey:](self, "_valueForProtocolKey:", CFSTR("pings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[AMSFinanceResponse _valueForProtocolKey:](self, "_valueForProtocolKey:", CFSTR("ping"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v4, 0);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11));
          objc_msgSend(v12, "host");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
            objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
  return (NSArray *)v6;
}

- (id)_valueForProtocolKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AMSFinanceResponse responseDictionary](self, "responseDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSFinanceResponse valueForProtocolKey:inResponse:](AMSFinanceResponse, "valueForProtocolKey:inResponse:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

+ (id)valueForProtocolKey:(id)a3 inResponse:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("protocol"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v6, "objectForKey:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (NSArray)actions
{
  uint64_t v3;
  AMSFinanceResponse *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  switch(-[AMSFinanceResponse dialogKind](self, "dialogKind"))
  {
    case 1:
    case 5:
      -[AMSFinanceResponse _performerForDialog](self, "_performerForDialog");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2:
      -[AMSFinanceResponse _performerForAuthenticate](self, "_performerForAuthenticate");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3:
    case 4:
      v4 = self;
      v5 = 0;
      goto LABEL_7;
    case 6:
      v4 = self;
      v5 = 1;
LABEL_7:
      -[AMSFinanceResponse _performerForPaymentSheetWithDelegateAuthentication:](v4, "_performerForPaymentSheetWithDelegateAuthentication:", v5);
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 7:
      -[AMSFinanceResponse _performerForExpressCheckout](self, "_performerForExpressCheckout");
      v3 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v6 = (void *)v3;
      break;
    default:
      v6 = 0;
      break;
  }
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v7, "ams_addNullableObject:", v6);
  -[AMSFinanceResponse _performerForActionDictionary](self, "_performerForActionDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ams_addNullableObject:", v8);

  -[AMSFinanceResponse _performerForCreditDisplay](self, "_performerForCreditDisplay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ams_addNullableObject:", v9);

  return (NSArray *)v7;
}

- (int64_t)dialogKind
{
  return self->_dialogKind;
}

- (id)_performerForCreditDisplay
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AMSFinanceResponse _valueForProtocolKey:](self, "_valueForProtocolKey:", CFSTR("creditDisplay"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[AMSFinanceResponse account](self, "account");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSFinanceResponse taskInfo](self, "taskInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSFinanceActionResponse actionWithUpdatedCreditString:account:taskInfo:](AMSFinanceActionResponse, "actionWithUpdatedCreditString:account:taskInfo:", v3, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_performerForActionDictionary
{
  void *v3;
  void *v4;
  void *v5;

  -[AMSFinanceResponse _valueForProtocolKey:](self, "_valueForProtocolKey:", CFSTR("action"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[AMSFinanceResponse taskInfo](self, "taskInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSFinanceActionResponse actionWithActionDictionary:taskInfo:](AMSFinanceActionResponse, "actionWithActionDictionary:taskInfo:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskInfo, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
  objc_storeStrong((id *)&self->_cachedPaymentSheetResponse, 0);
  objc_storeStrong((id *)&self->_cachedDialogResponse, 0);
  objc_storeStrong((id *)&self->_cachedAuthenticateResponse, 0);
}

- (AMSFinanceResponse)initWithTaskInfo:(id)a3 decodedObject:(id)a4
{
  id v7;
  id v8;
  AMSFinanceResponse *v9;
  AMSFinanceResponse *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AMSFinanceResponse;
  v9 = -[AMSFinanceResponse init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_taskInfo, a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v8;
    else
      v11 = 0;
    objc_storeStrong((id *)&v10->_responseDictionary, v11);
    v10->_dialogKind = +[AMSFinanceDialogResponse dialogKindForTaskInfo:withResponseDictionary:](AMSFinanceDialogResponse, "dialogKindForTaskInfo:withResponseDictionary:", v10->_taskInfo, v10->_responseDictionary);
  }

  return v10;
}

- (ACAccount)account
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[AMSFinanceResponse _valueForProtocolKey:](self, "_valueForProtocolKey:", CFSTR("dsPersonId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[AMSFinanceResponse _valueForProtocolKey:](self, "_valueForProtocolKey:", CFSTR("dsid"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "integerValue"));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0C8F2B8];
    -[AMSFinanceResponse taskInfo](self, "taskInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "properties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clientInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ams_sharedAccountStoreForProcessInfo:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "ams_iTunesAccountWithDSID:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return (ACAccount *)v10;
}

- (NSURL)versionMismatchURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[AMSFinanceResponse _valueForProtocolKey:](self, "_valueForProtocolKey:", CFSTR("store-version"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("1.0"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      objc_msgSend(v2, "objectForKey:", CFSTR("*"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "objectForKey:", CFSTR("redirect-url"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return (NSURL *)v5;
}

- (id)_performerForAuthenticate
{
  void *v3;
  AMSFinanceAuthenticateResponse *v4;
  AMSFinanceAuthenticateResponse *v5;
  void *v6;
  void *v7;

  -[AMSFinanceResponse cachedAuthenticateResponse](self, "cachedAuthenticateResponse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AMSFinanceResponse cachedAuthenticateResponse](self, "cachedAuthenticateResponse");
    v4 = (AMSFinanceAuthenticateResponse *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[AMSFinanceResponse dialogKind](self, "dialogKind") == 2)
    {
      v5 = [AMSFinanceAuthenticateResponse alloc];
      -[AMSFinanceResponse responseDictionary](self, "responseDictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSFinanceResponse taskInfo](self, "taskInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = -[AMSFinanceAuthenticateResponse initWithResponseDictionary:taskInfo:](v5, "initWithResponseDictionary:taskInfo:", v6, v7);

    }
    else
    {
      v4 = 0;
    }
    -[AMSFinanceResponse setCachedAuthenticateResponse:](self, "setCachedAuthenticateResponse:", v4);
  }
  return v4;
}

- (id)_performerForDialog
{
  void *v3;
  void *v4;
  int64_t v5;
  AMSFinanceVerifyPurchaseResponse *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  AMSFinanceDialogResponse *v10;

  -[AMSFinanceResponse cachedDialogResponse](self, "cachedDialogResponse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v5 = -[AMSFinanceResponse dialogKind](self, "dialogKind");
    if (v5 == 1)
    {
      v10 = [AMSFinanceDialogResponse alloc];
      -[AMSFinanceResponse responseDictionary](self, "responseDictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSFinanceResponse taskInfo](self, "taskInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[AMSFinanceDialogResponse initWithResponseDictionary:kind:taskInfo:](v10, "initWithResponseDictionary:kind:taskInfo:", v7, 1, v8);
    }
    else
    {
      if (v5 != 5)
      {
        v4 = 0;
        goto LABEL_9;
      }
      v6 = [AMSFinanceVerifyPurchaseResponse alloc];
      -[AMSFinanceResponse responseDictionary](self, "responseDictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSFinanceResponse taskInfo](self, "taskInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[AMSFinanceVerifyPurchaseResponse initWithPayload:taskInfo:](v6, "initWithPayload:taskInfo:", v7, v8);
    }
    v4 = (void *)v9;

LABEL_9:
    -[AMSFinanceResponse setCachedDialogResponse:](self, "setCachedDialogResponse:", v4);
    return v4;
  }
  -[AMSFinanceResponse cachedDialogResponse](self, "cachedDialogResponse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (id)_performerForPaymentSheetWithDelegateAuthentication:(BOOL)a3
{
  _BOOL8 v3;
  AMSFinancePaymentSheetResponse *v5;
  unint64_t v6;
  _BOOL8 v7;
  AMSFinancePaymentSheetResponse *v8;
  void *v9;
  void *v10;

  v3 = a3;
  -[AMSFinanceResponse cachedPaymentSheetResponse](self, "cachedPaymentSheetResponse");
  v5 = (AMSFinancePaymentSheetResponse *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AMSFinanceResponse cachedPaymentSheetResponse](self, "cachedPaymentSheetResponse");
    v5 = (AMSFinancePaymentSheetResponse *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = -[AMSFinanceResponse dialogKind](self, "dialogKind");
    if (v6 <= 6 && ((1 << v6) & 0x58) != 0)
    {
      v7 = v6 == 4;
      v8 = [AMSFinancePaymentSheetResponse alloc];
      -[AMSFinanceResponse responseDictionary](self, "responseDictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSFinanceResponse taskInfo](self, "taskInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[AMSFinancePaymentSheetResponse initWithResponseDictionary:confirmationOnly:delegateAuthenticationRequired:biometricSignatureRequired:taskInfo:](v8, "initWithResponseDictionary:confirmationOnly:delegateAuthenticationRequired:biometricSignatureRequired:taskInfo:", v9, v7, v3, 1, v10);

    }
    -[AMSFinanceResponse setCachedPaymentSheetResponse:](self, "setCachedPaymentSheetResponse:", v5);
  }
  return v5;
}

- (id)_performerForExpressCheckout
{
  AMSFinanceExpressCheckoutResponse *v3;
  void *v4;
  void *v5;
  AMSFinanceExpressCheckoutResponse *v6;

  v3 = [AMSFinanceExpressCheckoutResponse alloc];
  -[AMSFinanceResponse responseDictionary](self, "responseDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSFinanceResponse taskInfo](self, "taskInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AMSFinanceExpressCheckoutResponse initWithResponseDictionary:taskInfo:](v3, "initWithResponseDictionary:taskInfo:", v4, v5);

  return v6;
}

- (AMSFinanceAuthenticateResponse)cachedAuthenticateResponse
{
  return self->_cachedAuthenticateResponse;
}

- (void)setCachedAuthenticateResponse:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAuthenticateResponse, a3);
}

- (AMSFinanceDialogResponse)cachedDialogResponse
{
  return self->_cachedDialogResponse;
}

- (void)setCachedDialogResponse:(id)a3
{
  objc_storeStrong((id *)&self->_cachedDialogResponse, a3);
}

- (AMSFinancePaymentSheetResponse)cachedPaymentSheetResponse
{
  return self->_cachedPaymentSheetResponse;
}

- (void)setCachedPaymentSheetResponse:(id)a3
{
  objc_storeStrong((id *)&self->_cachedPaymentSheetResponse, a3);
}

- (void)setResponseDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_responseDictionary, a3);
}

- (AMSURLTaskInfo)taskInfo
{
  return self->_taskInfo;
}

- (void)setTaskInfo:(id)a3
{
  objc_storeStrong((id *)&self->_taskInfo, a3);
}

@end
