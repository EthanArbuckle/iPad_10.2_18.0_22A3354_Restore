@implementation FCNewsletterSubscribeCommand

- (FCNewsletterSubscribeCommand)initWithNewsletter:(id)a3 includeArray:(id)a4
{
  id v7;
  id v8;
  FCNewsletterSubscribeCommand *v9;
  FCNewsletterSubscribeCommand *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCNewsletterSubscribeCommand;
  v9 = -[FCNewsletterSubscribeCommand init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_newsletter, a3);
    objc_storeStrong((id *)&v10->_includeArray, a4);
  }

  return v10;
}

- (FCNewsletterSubscribeCommand)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  FCNewsletterSubscribeCommand *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNewsletterKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kIncludeKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[FCNewsletterSubscribeCommand initWithNewsletter:includeArray:](self, "initWithNewsletter:includeArray:", v5, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FCNewsletterSubscribeCommand newsletter](self, "newsletter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kNewsletterKey"));

  -[FCNewsletterSubscribeCommand includeArray](self, "includeArray");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kIncludeKey"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)executeWithContext:(id)a3 delegate:(id)a4 qualityOfService:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  NSString *newsletter;
  NSArray *includeArray;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  FCNewsletterSubscribeCommand *v17;
  id v18;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "newsletterEndpointConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  newsletter = self->_newsletter;
  includeArray = self->_includeArray;
  dispatch_get_global_queue(-2, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__FCNewsletterSubscribeCommand_executeWithContext_delegate_qualityOfService___block_invoke;
  v15[3] = &unk_1E46452D0;
  v16 = v8;
  v17 = self;
  v18 = v7;
  v13 = v7;
  v14 = v8;
  objc_msgSend(v9, "newsletterSubscribeTo:includeArray:callbackQueue:completion:", newsletter, includeArray, v12, v15);

}

void __77__FCNewsletterSubscribeCommand_executeWithContext_delegate_qualityOfService___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "command:didFinishWithStatus:", *(_QWORD *)(a1 + 40), 0);
    objc_msgSend(*(id *)(a1 + 48), "newsletterManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateCacheWithNewsletterString:includeArray:", v11, v7);

  }
  else
  {
    if ((objc_msgSend(v8, "fc_isNetworkUnavailableError") & 1) != 0)
    {
      v10 = 1;
    }
    else if (objc_msgSend(v8, "fc_shouldRetry"))
    {
      v10 = 2;
    }
    else
    {
      v10 = 3;
    }
    objc_msgSend(*(id *)(a1 + 32), "command:didFinishWithStatus:", *(_QWORD *)(a1 + 40), v10);
  }

}

- (NSString)newsletter
{
  return self->_newsletter;
}

- (void)setNewsletter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)includeArray
{
  return self->_includeArray;
}

- (void)setIncludeArray:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_includeArray, 0);
  objc_storeStrong((id *)&self->_newsletter, 0);
}

@end
