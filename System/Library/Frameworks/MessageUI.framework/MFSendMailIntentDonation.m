@implementation MFSendMailIntentDonation

- (void)donateSendActionFromMessageFuture:(id)a3
{
  id v3;

  objc_msgSend(a3, "map:", &__block_literal_global_34);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSuccessBlock:", &__block_literal_global_2);

}

id __62__MFSendMailIntentDonation_donateSendActionFromMessageFuture___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MFMailIntentTransformer *v3;
  void *v4;

  v2 = a2;
  v3 = objc_alloc_init(MFMailIntentTransformer);
  -[MFMailIntentTransformer transformedValue:](v3, "transformedValue:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __62__MFSendMailIntentDonation_donateSendActionFromMessageFuture___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v2 = a2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD9A8]), "initWithIntent:response:", v2, 0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__MFSendMailIntentDonation_donateSendActionFromMessageFuture___block_invoke_3;
  v5[3] = &unk_1E5A67BB0;
  v4 = v2;
  v6 = v4;
  objc_msgSend(v3, "donateInteractionWithCompletion:", v5);

}

void __62__MFSendMailIntentDonation_donateSendActionFromMessageFuture___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    MFLogGeneral();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "description");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1AB96A000, v4, OS_LOG_TYPE_DEFAULT, "donation failed with %@", (uint8_t *)&v7, 0xCu);

    }
  }
  else
  {
    MFLogGeneral();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = *(void **)(a1 + 32);
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_1AB96A000, v4, OS_LOG_TYPE_INFO, "donation with messageInfo %@", (uint8_t *)&v7, 0xCu);
    }
  }

}

@end
