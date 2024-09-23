@implementation SUUIGiftValidator

- (SUUIGiftValidator)initWithValidationURL:(id)a3 clientContext:(id)a4
{
  id v6;
  id v7;
  SUUIGiftValidator *v8;
  SUUIGiftValidator *v9;
  uint64_t v10;
  NSURL *validationURL;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SUUIGiftValidator;
  v8 = -[SUUIGiftValidator init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_clientContext, a4);
    v10 = objc_msgSend(v6, "copy");
    validationURL = v9->_validationURL;
    v9->_validationURL = (NSURL *)v10;

  }
  return v9;
}

- (void)cancelValidation
{
  SSVLoadURLOperation *validationOperation;

  -[SSVLoadURLOperation setOutputBlock:](self->_validationOperation, "setOutputBlock:", 0);
  -[SSVLoadURLOperation cancel](self->_validationOperation, "cancel");
  validationOperation = self->_validationOperation;
  self->_validationOperation = 0;

}

- (BOOL)isValidating
{
  return self->_validationOperation != 0;
}

- (void)validateDonation:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "HTTPBodyDictionary");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIGiftValidator _validateWithBodyDictionary:completionBlock:](self, "_validateWithBodyDictionary:completionBlock:", v7, v6);

}

- (void)validateGift:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "HTTPBodyDictionary");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIGiftValidator _validateWithBodyDictionary:completionBlock:](self, "_validateWithBodyDictionary:completionBlock:", v7, v6);

}

- (void)_finishValidationWithResponse:(id)a3 error:(id)a4 attemptNumber:(int64_t)a5 block:(id)a6
{
  id v10;
  void (**v11)(id, SUUIGiftValidationResponse *, id);
  SSVLoadURLOperation *validationOperation;
  SUUIGiftValidationResponse *v13;
  id v14;

  v14 = a3;
  v10 = a4;
  v11 = (void (**)(id, SUUIGiftValidationResponse *, id))a6;
  if (self->_validationCount == a5)
  {
    -[SSVLoadURLOperation setOutputBlock:](self->_validationOperation, "setOutputBlock:", 0);
    validationOperation = self->_validationOperation;
    self->_validationOperation = 0;

    if (v11)
    {
      v13 = -[SUUIGiftValidationResponse initWithValidationDictionary:]([SUUIGiftValidationResponse alloc], "initWithValidationDictionary:", v14);
      v11[2](v11, v13, v10);

    }
  }

}

- (void)_validateWithBodyDictionary:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  SSVLoadURLOperation *v12;
  SSVLoadURLOperation *validationOperation;
  SSVLoadURLOperation *v14;
  void *v15;
  SSVLoadURLOperation *v16;
  void *v17;
  SSVLoadURLOperation *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22[2];
  id location;
  id v24;

  v6 = a3;
  v7 = a4;
  -[SUUIGiftValidator cancelValidation](self, "cancelValidation");
  v24 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v6, 0, &v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v24;
  if (v8)
  {
    v10 = (void *)(self->_validationCount + 1);
    self->_validationCount = (int64_t)v10;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB7458]), "initWithURL:", self->_validationURL);
    objc_msgSend(v11, "setHTTPBody:", v8);
    objc_msgSend(v11, "setHTTPMethod:", CFSTR("POST"));
    objc_msgSend(v11, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
    v12 = (SSVLoadURLOperation *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2040]), "initWithURLRequest:", v11);
    validationOperation = self->_validationOperation;
    self->_validationOperation = v12;

    v14 = self->_validationOperation;
    +[SSVURLDataConsumer consumer](SUUIJSONDataConsumer, "consumer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVLoadURLOperation setDataConsumer:](v14, "setDataConsumer:", v15);

    v16 = self->_validationOperation;
    -[SUUIClientContext valueForConfigurationKey:](self->_clientContext, "valueForConfigurationKey:", CFSTR("sfsuffix"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVLoadURLOperation setStoreFrontSuffix:](v16, "setStoreFrontSuffix:", v17);

    objc_initWeak(&location, self);
    v18 = self->_validationOperation;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __65__SUUIGiftValidator__validateWithBodyDictionary_completionBlock___block_invoke;
    v20[3] = &unk_2511FD928;
    objc_copyWeak(v22, &location);
    v22[1] = v10;
    v21 = v7;
    -[SSVLoadURLOperation setOutputBlock:](v18, "setOutputBlock:", v20);
    -[SUUIGiftValidator operationQueue](self, "operationQueue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addOperation:", self->_validationOperation);

    objc_destroyWeak(v22);
    objc_destroyWeak(&location);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v9);
  }

}

void __65__SUUIGiftValidator__validateWithBodyDictionary_completionBlock___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  id v13[2];

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__SUUIGiftValidator__validateWithBodyDictionary_completionBlock___block_invoke_2;
  block[3] = &unk_2511F6890;
  objc_copyWeak(v13, a1 + 5);
  v10 = v5;
  v11 = v6;
  v13[1] = a1[6];
  v12 = a1[4];
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(v13);
}

void __65__SUUIGiftValidator__validateWithBodyDictionary_completionBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_finishValidationWithResponse:error:attemptNumber:block:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));

}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationURL, 0);
  objc_storeStrong((id *)&self->_validationOperation, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
