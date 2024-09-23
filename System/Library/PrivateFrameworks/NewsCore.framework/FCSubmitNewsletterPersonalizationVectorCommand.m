@implementation FCSubmitNewsletterPersonalizationVectorCommand

- (FCSubmitNewsletterPersonalizationVectorCommand)initWithPersonalizationVector:(id)a3
{
  id v5;
  FCSubmitNewsletterPersonalizationVectorCommand *v6;
  FCSubmitNewsletterPersonalizationVectorCommand *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCSubmitNewsletterPersonalizationVectorCommand;
  v6 = -[FCSubmitNewsletterPersonalizationVectorCommand init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_personalizationVector, a3);

  return v7;
}

- (FCSubmitNewsletterPersonalizationVectorCommand)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  FCSubmitNewsletterPersonalizationVectorCommand *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kPersonalizationVectorKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[FCSubmitNewsletterPersonalizationVectorCommand initWithPersonalizationVector:](self, "initWithPersonalizationVector:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FCSubmitNewsletterPersonalizationVectorCommand personalizationVector](self, "personalizationVector");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kPersonalizationVectorKey"));

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
  NSString *personalizationVector;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  FCSubmitNewsletterPersonalizationVectorCommand *v16;
  id v17;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "newsletterEndpointConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  personalizationVector = self->_personalizationVector;
  dispatch_get_global_queue(-2, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __95__FCSubmitNewsletterPersonalizationVectorCommand_executeWithContext_delegate_qualityOfService___block_invoke;
  v14[3] = &unk_1E4640AA0;
  v15 = v8;
  v16 = self;
  v17 = v7;
  v12 = v7;
  v13 = v8;
  objc_msgSend(v9, "submitPersonalizationVector:withCallbackQueue:completion:", personalizationVector, v11, v14);

}

void __95__FCSubmitNewsletterPersonalizationVectorCommand_executeWithContext_delegate_qualityOfService___block_invoke(uint64_t a1, int a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  id v17;

  v17 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "command:didFinishWithStatus:", *(_QWORD *)(a1 + 40), 0);
    objc_msgSend(*(id *)(a1 + 48), "newsletterManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateCacheWithNewsletterString:includeArray:", v17, v9);

  }
  else
  {
    if (objc_msgSend(v10, "fc_isNetworkUnavailableError"))
    {
      v13 = *(void **)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      v15 = 1;
    }
    else
    {
      v16 = objc_msgSend(v11, "fc_shouldRetry");
      v13 = *(void **)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      if (v16)
        v15 = 2;
      else
        v15 = 3;
    }
    objc_msgSend(v13, "command:didFinishWithStatus:", v14, v15);
  }

}

- (NSString)personalizationVector
{
  return self->_personalizationVector;
}

- (void)setPersonalizationVector:(id)a3
{
  objc_storeStrong((id *)&self->_personalizationVector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalizationVector, 0);
}

@end
