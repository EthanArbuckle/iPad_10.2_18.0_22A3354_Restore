@implementation VSStorefrontCodeLoadOperation

- (VSStorefrontCodeLoadOperation)init
{
  VSStorefrontCodeLoadOperation *v2;
  VSOptional *v3;
  VSOptional *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  NSOperationQueue *privateQueue;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VSStorefrontCodeLoadOperation;
  v2 = -[VSStorefrontCodeLoadOperation init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(VSOptional);
    v4 = v2->_result;
    v2->_result = v3;

    v5 = (void *)MEMORY[0x1E0CB3828];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queueWithName:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    privateQueue = v2->_privateQueue;
    v2->_privateQueue = (NSOperationQueue *)v8;

  }
  return v2;
}

- (void)executionDidBegin
{
  __CFString *v3;
  VSAMSBagLoadOperation *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;
  id from;
  id location;

  v3 = CFSTR("countryCode");
  v4 = objc_alloc_init(VSAMSBagLoadOperation);
  -[VSAMSBagLoadOperation setBagKey:](v4, "setBagKey:", v3);
  objc_initWeak(&location, v4);
  objc_initWeak(&from, self);
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __50__VSStorefrontCodeLoadOperation_executionDidBegin__block_invoke;
  v9 = &unk_1E939ED60;
  objc_copyWeak(&v10, &location);
  objc_copyWeak(&v11, &from);
  -[VSAMSBagLoadOperation setCompletionBlock:](v4, "setCompletionBlock:", &v6);
  -[VSStorefrontCodeLoadOperation privateQueue](self, "privateQueue", v6, v7, v8, v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addOperation:", v4);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __50__VSStorefrontCodeLoadOperation_executionDidBegin__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  char isKindOfClass;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!v3)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The value parameter must not be nil."));
    v4 = v3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v6 = (void *)MEMORY[0x1E0C99DA0];
      v7 = *MEMORY[0x1E0C99778];
      if (!v3)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The value parameter must not be nil."));
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "raise:format:", v7, CFSTR("Unexpectedly, VSForceUnwrapNullable(value) was %@, instead of NSString."), v9);

    }
    if (!v3)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The value parameter must not be nil."));
    objc_msgSend(v4, "lowercaseString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[VSFailable failableWithObject:](VSFailable, "failableWithObject:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(WeakRetained, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      VSPrivateError(-25, 0);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v14;

    +[VSFailable failableWithError:](VSFailable, "failableWithError:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v11;
  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setResult:", v16);

  objc_msgSend(v2, "finishExecutionIfPossible");
}

- (VSOptional)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

@end
