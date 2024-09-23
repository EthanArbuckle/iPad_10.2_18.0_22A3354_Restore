@implementation FAMailInviteConfigurationController

- (FAMailInviteConfigurationController)initWithInviteContext:(id)a3 presentingController:(id)a4 email:(id)a5
{
  id v9;
  id v10;
  id v11;
  FAMailInviteConfigurationController *v12;
  FAMailInviteConfigurationController *v13;
  FAInviteRecipientEvaluator *v14;
  FAInviteRecipientEvaluator *inviteRecipientEvaluator;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[FAMailInviteConfigurationController init](self, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a3);
    objc_storeStrong((id *)&v13->_presentationContext, a4);
    objc_storeStrong((id *)&v13->_familySuggestionEmailAddress, a5);
    v14 = objc_alloc_init(FAInviteRecipientEvaluator);
    inviteRecipientEvaluator = v13->_inviteRecipientEvaluator;
    v13->_inviteRecipientEvaluator = v14;

  }
  return v13;
}

- (void)presentWhenReadyWithCompletion:(id)a3
{
  id v4;
  FAInviteLinkMetadataProvider *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (self->_linkMetadata)
  {
    -[FAMailInviteConfigurationController _presentInviteControllerWithCompletion:](self, "_presentInviteControllerWithCompletion:", v4);
  }
  else
  {
    v5 = -[FAInviteLinkMetadataProvider initWithContext:]([FAInviteLinkMetadataProvider alloc], "initWithContext:", self->_context);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __70__FAMailInviteConfigurationController_presentWhenReadyWithCompletion___block_invoke;
    v6[3] = &unk_24C88BD90;
    v6[4] = self;
    v7 = v4;
    -[FAInviteLinkMetadataProvider loadMetatadataWithCompletion:](v5, "loadMetatadataWithCompletion:", v6);

  }
}

void __70__FAMailInviteConfigurationController_presentWhenReadyWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v5);
  }
  else
  {
    objc_msgSend(v10, "mailMetadata");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 24);
    *(_QWORD *)(v8 + 24) = v7;

    objc_msgSend(*(id *)(a1 + 32), "_presentInviteControllerWithCompletion:", *(_QWORD *)(a1 + 40));
  }

}

- (void)_presentInviteControllerWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  _BOOL4 v8;
  UIViewController *presentationContext;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  _BOOL4 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _FALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v15 = +[FAMailInviteConfigurationController isAvailable](FAMailInviteConfigurationController, "isAvailable");
    _os_log_impl(&dword_20DE41000, v5, OS_LOG_TYPE_DEFAULT, "_presentMailViewController - can send Mail: %d", buf, 8u);
  }

  -[FAMailInviteConfigurationController _mailComposeViewController](self, "_mailComposeViewController");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6
    && (v7 = (void *)v6,
        v8 = +[FAMailInviteConfigurationController isAvailable](FAMailInviteConfigurationController, "isAvailable"), v7, v8))
  {
    presentationContext = self->_presentationContext;
    -[FAMailInviteConfigurationController _mailComposeViewController](self, "_mailComposeViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __78__FAMailInviteConfigurationController__presentInviteControllerWithCompletion___block_invoke;
    v12[3] = &unk_24C88BDB8;
    v13 = v4;
    -[UIViewController presentViewController:animated:completion:](presentationContext, "presentViewController:animated:completion:", v10, 1, v12);

  }
  else
  {
    _FALogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DE41000, v11, OS_LOG_TYPE_DEFAULT, "Unable to present FAMailInviteConfigurationController", buf, 2u);
    }

    if (v4)
      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

uint64_t __78__FAMailInviteConfigurationController__presentInviteControllerWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

+ (BOOL)isAvailable
{
  return objc_msgSend(MEMORY[0x24BDDD0A0], "canSendMail");
}

- (id)_mailComposeViewController
{
  MFMailComposeViewController *mailComposeViewController;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  MFMailComposeViewController *v13;
  MFMailComposeViewController *v14;
  MFMailComposeViewController *v15;
  void *v16;
  MFMailComposeViewController *v17;
  void *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  mailComposeViewController = self->_mailComposeViewController;
  if (!mailComposeViewController)
  {
    v4 = objc_alloc(MEMORY[0x24BDDA8A8]);
    -[LPLinkMetadata originalURL](self->_linkMetadata, "originalURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithURL:", v5);

    objc_msgSend(v6, "setMetadata:", self->_linkMetadata);
    objc_msgSend(v6, "HTMLFragmentString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FAInviteContext mailMessageBodyHTML](self->_context, "mailMessageBodyHTML");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = &stru_24C8A3000;
    if (v8)
      v10 = (__CFString *)v8;
    v11 = v10;

    -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (MFMailComposeViewController *)objc_alloc_init(MEMORY[0x24BDDD0A0]);
    v14 = self->_mailComposeViewController;
    self->_mailComposeViewController = v13;

    -[MFMailComposeViewController setMailComposeDelegate:](self->_mailComposeViewController, "setMailComposeDelegate:", self);
    -[MFMailComposeViewController setMessageBody:isHTML:](self->_mailComposeViewController, "setMessageBody:isHTML:", v12, 1);
    v15 = self->_mailComposeViewController;
    -[FAInviteContext mailMessageSubject](self->_context, "mailMessageSubject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailComposeViewController setSubject:](v15, "setSubject:", v16);

    v17 = self->_mailComposeViewController;
    v20[0] = self->_familySuggestionEmailAddress;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailComposeViewController setToRecipients:](v17, "setToRecipients:", v18);

    mailComposeViewController = self->_mailComposeViewController;
  }
  return mailComposeViewController;
}

- (void)mailComposeController:(id)a3 shouldSendMail:(id)a4 toRecipients:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  NSObject *v10;
  NSArray *v11;
  NSArray *recipientAddresses;
  uint64_t v13;
  id v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a6;
  v9 = a5;
  _FALogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = CFSTR("FAMailInviteConfigurationController.m");
    _os_log_impl(&dword_20DE41000, v10, OS_LOG_TYPE_DEFAULT, "%@ MFMessageComposeVC delegate callback - shouldSendMail", buf, 0xCu);
  }

  -[FAInviteRecipientEvaluator parseRecipientAddresses:](self->_inviteRecipientEvaluator, "parseRecipientAddresses:", v9);
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  recipientAddresses = self->_recipientAddresses;
  self->_recipientAddresses = v11;

  v13 = objc_msgSend(v9, "count");
  if (v13)
  {
    v14 = objc_alloc_init(MEMORY[0x24BE30A88]);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __100__FAMailInviteConfigurationController_mailComposeController_shouldSendMail_toRecipients_completion___block_invoke;
    v15[3] = &unk_24C88C2B0;
    v15[4] = self;
    v16 = v8;
    objc_msgSend(v14, "startRequestWithCompletionHandler:", v15);

  }
  else
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

void __100__FAMailInviteConfigurationController_mailComposeController_shouldSendMail_toRecipients_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(void);
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "recipientAlreadyInFamily:emailOnly:recipients:", a2, 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v8, "count");
  v4 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  if (v3)
  {
    v4();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 40);
    objc_msgSend(*(id *)(v5 + 8), "visibleViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "showAlreadyFamilyMember:presenter:", v8, v7);

  }
  else
  {
    v4();
  }

}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  id v7;
  NSObject *v8;
  id WeakRetained;
  char v10;
  uint64_t v11;
  uint64_t *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  FAMailInviteConfigurationController *v18;
  uint64_t v19;
  uint8_t buf[4];
  const __CFString *v21;
  __int16 v22;
  int64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  _FALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = CFSTR("FAMailInviteConfigurationController.m");
    v22 = 2048;
    v23 = a4;
    _os_log_impl(&dword_20DE41000, v8, OS_LOG_TYPE_DEFAULT, "%@ MFMailComposeVC delegate callback - didFinishWithResult:%ld", buf, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11 = 2 * (a4 != 0);
    if (a4 == 2)
      v11 = 1;
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __87__FAMailInviteConfigurationController_mailComposeController_didFinishWithResult_error___block_invoke;
    v17 = &unk_24C88C2D8;
    v18 = self;
    v19 = v11;
    v12 = &v14;
    v13 = v7;
  }
  else
  {
    v13 = v7;
    v12 = 0;
  }
  objc_msgSend(v13, "dismissViewControllerAnimated:completion:", 1, v12, v14, v15, v16, v17, v18, v19);

}

void __87__FAMailInviteConfigurationController_mailComposeController_didFinishWithResult_error___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(WeakRetained, "inviteController:didFinishWithStatus:recipients:userInfo:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), 0, 0);

}

- (FAInviteControllerDelegate)delegate
{
  return (FAInviteControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (FAInviteContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_familySuggestionEmailAddress, 0);
  objc_storeStrong((id *)&self->_inviteRecipientEvaluator, 0);
  objc_storeStrong((id *)&self->_recipientAddresses, 0);
  objc_storeStrong((id *)&self->_linkMetadata, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_storeStrong((id *)&self->_mailComposeViewController, 0);
}

@end
