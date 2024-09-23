@implementation FCDeleteNewsletterPersonalizationVectorCommand

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)executeWithContext:(id)a3 delegate:(id)a4 qualityOfService:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  FCDeleteNewsletterPersonalizationVectorCommand *v13;

  v7 = a4;
  objc_msgSend(a3, "newsletterEndpointConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(-2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __95__FCDeleteNewsletterPersonalizationVectorCommand_executeWithContext_delegate_qualityOfService___block_invoke;
  v11[3] = &unk_1E463BC78;
  v12 = v7;
  v13 = self;
  v10 = v7;
  objc_msgSend(v8, "deletePersonalizationVectorWithCallbackQueue:completion:", v9, v11);

}

void __95__FCDeleteNewsletterPersonalizationVectorCommand_executeWithContext_delegate_qualityOfService___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  id v10;

  v5 = a3;
  v10 = v5;
  if (a2)
  {
    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 0;
  }
  else if (objc_msgSend(v5, "fc_isNetworkUnavailableError"))
  {
    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 1;
  }
  else
  {
    v9 = objc_msgSend(v10, "fc_shouldRetry");
    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    if (v9)
      v8 = 2;
    else
      v8 = 3;
  }
  objc_msgSend(v6, "command:didFinishWithStatus:", v7, v8);

}

@end
