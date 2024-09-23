@implementation FKPendingApplePayOrderDetails

- (FKPendingApplePayOrderDetails)initWithTransactionIdentifier:(id)a3 orderTypeIdentifier:(id)a4 orderIdentifier:(id)a5 webServiceBaseURL:(id)a6 authenticationToken:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  FKPendingApplePayOrderDetails *v17;
  uint64_t v18;
  NSString *transactionIdentifier;
  uint64_t v20;
  NSString *orderTypeIdentifier;
  uint64_t v22;
  NSString *orderIdentifier;
  uint64_t v24;
  NSURL *webServiceBaseURL;
  uint64_t v26;
  NSString *authenticationToken;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)FKPendingApplePayOrderDetails;
  v17 = -[FKPendingApplePayOrderDetails init](&v29, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    transactionIdentifier = v17->_transactionIdentifier;
    v17->_transactionIdentifier = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    orderTypeIdentifier = v17->_orderTypeIdentifier;
    v17->_orderTypeIdentifier = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    orderIdentifier = v17->_orderIdentifier;
    v17->_orderIdentifier = (NSString *)v22;

    v24 = objc_msgSend(v15, "copy");
    webServiceBaseURL = v17->_webServiceBaseURL;
    v17->_webServiceBaseURL = (NSURL *)v24;

    v26 = objc_msgSend(v16, "copy");
    authenticationToken = v17->_authenticationToken;
    v17->_authenticationToken = (NSString *)v26;

  }
  return v17;
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (NSString)orderTypeIdentifier
{
  return self->_orderTypeIdentifier;
}

- (NSString)orderIdentifier
{
  return self->_orderIdentifier;
}

- (NSURL)webServiceBaseURL
{
  return self->_webServiceBaseURL;
}

- (NSString)authenticationToken
{
  return self->_authenticationToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationToken, 0);
  objc_storeStrong((id *)&self->_webServiceBaseURL, 0);
  objc_storeStrong((id *)&self->_orderIdentifier, 0);
  objc_storeStrong((id *)&self->_orderTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
}

@end
