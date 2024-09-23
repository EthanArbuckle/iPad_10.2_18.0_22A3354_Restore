@implementation SUUIGiftPurchaseRequest

- (SUUIGiftPurchaseRequest)initWithDonation:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  SUUIGiftPurchaseRequest *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  SUUIURLConnectionRequest *request;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SUUIGiftPurchaseRequest;
  v8 = -[SUUIGiftPurchaseRequest init](&v14, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "donationPurchaseURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "HTTPBodyDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftPurchaseRequest _requestWithURL:bodyDictionary:](v8, "_requestWithURL:bodyDictionary:", v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    request = v8->_request;
    v8->_request = (SUUIURLConnectionRequest *)v11;

  }
  return v8;
}

- (SUUIGiftPurchaseRequest)initWithGift:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  SUUIGiftPurchaseRequest *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  SUUIURLConnectionRequest *request;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SUUIGiftPurchaseRequest;
  v8 = -[SUUIGiftPurchaseRequest init](&v14, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "giftPurchaseURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "HTTPBodyDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftPurchaseRequest _requestWithURL:bodyDictionary:](v8, "_requestWithURL:bodyDictionary:", v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    request = v8->_request;
    v8->_request = (SUUIURLConnectionRequest *)v11;

  }
  return v8;
}

- (void)purchaseWithCompletionBlock:(id)a3
{
  id v4;
  SUUIURLConnectionRequest *request;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  request = self->_request;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__SUUIGiftPurchaseRequest_purchaseWithCompletionBlock___block_invoke;
  v7[3] = &unk_2511FB688;
  v8 = v4;
  v6 = v4;
  -[SUUIURLConnectionRequest startWithConnectionResponseBlock:](request, "startWithConnectionResponseBlock:", v7);

}

void __55__SUUIGiftPurchaseRequest_purchaseWithCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(a2, "bodyData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v5, 0, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("status"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0 && !objc_msgSend(v7, "integerValue"))
      {
        v9 = 0;
      }
      else
      {
        objc_msgSend(v6, "objectForKey:", CFSTR("dialog"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = 0;
        }
        else
        {
          objc_msgSend(v6, "objectForKey:", CFSTR("userPresentableErrorMessage"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v9 = v10;
          else
            v9 = 0;

        }
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    objc_msgSend(v11, "localizedDescription");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)_requestWithURL:(id)a3 bodyDictionary:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  SUUIURLConnectionRequest *v10;

  v5 = (objc_class *)MEMORY[0x24BEB1F30];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithURL:", v7);

  objc_msgSend(v8, "setAllowedRetryCount:", 0);
  objc_msgSend(v8, "setITunesStoreRequest:", 1);
  objc_msgSend(v8, "setKBSyncType:", 2);
  objc_msgSend(v8, "setRequestParameters:", v6);

  objc_msgSend(v8, "setShouldProcessProtocol:", 1);
  objc_msgSend(v8, "setShouldSendSecureToken:", 1);
  SSVDefaultUserAgent();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forHTTPHeaderField:", v9, CFSTR("User-Agent"));

  objc_msgSend(v8, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v8, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  v10 = -[SSURLConnectionRequest initWithRequestProperties:]([SUUIURLConnectionRequest alloc], "initWithRequestProperties:", v8);
  -[SSURLConnectionRequest setShouldMescalSign:](v10, "setShouldMescalSign:", 1);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
}

@end
