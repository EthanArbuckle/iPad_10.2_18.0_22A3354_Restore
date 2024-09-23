@implementation FAMessagesInviteConfigurationController

- (FAMessagesInviteConfigurationController)initWithInviteContext:(id)a3 presentingController:(id)a4
{
  id v7;
  id v8;
  FAMessagesInviteConfigurationController *v9;
  FAMessagesInviteConfigurationController *v10;
  FAInviteRecipientEvaluator *v11;
  FAInviteRecipientEvaluator *inviteRecipientEvaluator;

  v7 = a3;
  v8 = a4;
  v9 = -[FAMessagesInviteConfigurationController init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_presentationContext, a4);
    v11 = objc_alloc_init(FAInviteRecipientEvaluator);
    inviteRecipientEvaluator = v10->_inviteRecipientEvaluator;
    v10->_inviteRecipientEvaluator = v11;

  }
  return v10;
}

- (FAMessagesInviteConfigurationController)initWithInviteContext:(id)a3 presentingController:(id)a4 familySuggestionHandle:(id)a5
{
  id v9;
  id v10;
  id v11;
  FAMessagesInviteConfigurationController *v12;
  FAMessagesInviteConfigurationController *v13;
  FAInviteRecipientEvaluator *v14;
  FAInviteRecipientEvaluator *inviteRecipientEvaluator;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[FAMessagesInviteConfigurationController init](self, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a3);
    objc_storeStrong((id *)&v13->_presentationContext, a4);
    v14 = objc_alloc_init(FAInviteRecipientEvaluator);
    inviteRecipientEvaluator = v13->_inviteRecipientEvaluator;
    v13->_inviteRecipientEvaluator = v14;

    objc_storeStrong((id *)&v13->_familySuggestionHandle, a5);
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
    -[FAMessagesInviteConfigurationController _presentInviteControllerWithCompletion:](self, "_presentInviteControllerWithCompletion:", v4);
  }
  else
  {
    v5 = -[FAInviteLinkMetadataProvider initWithContext:]([FAInviteLinkMetadataProvider alloc], "initWithContext:", self->_context);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __74__FAMessagesInviteConfigurationController_presentWhenReadyWithCompletion___block_invoke;
    v6[3] = &unk_24C88BD90;
    v6[4] = self;
    v7 = v4;
    -[FAInviteLinkMetadataProvider loadMetatadataWithCompletion:](v5, "loadMetatadataWithCompletion:", v6);

  }
}

void __74__FAMessagesInviteConfigurationController_presentWhenReadyWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(v10, "bubbleMetadata");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 16);
    *(_QWORD *)(v8 + 16) = v7;

    objc_msgSend(*(id *)(a1 + 32), "_presentInviteControllerWithCompletion:", *(_QWORD *)(a1 + 40));
  }

}

- (id)_messageComposeViewController
{
  MFMessageComposeViewController *messageComposeViewController;
  MFMessageComposeViewController *v4;
  MFMessageComposeViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  MFMessageComposeViewController *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  MFMessageComposeViewController *v20;
  uint64_t v21;
  void *v22;
  NSString *familySuggestionHandle;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  messageComposeViewController = self->_messageComposeViewController;
  if (!messageComposeViewController)
  {
    v4 = (MFMessageComposeViewController *)objc_alloc_init(MEMORY[0x24BDDD0A8]);
    v5 = self->_messageComposeViewController;
    self->_messageComposeViewController = v4;

    -[MFMessageComposeViewController setMessageComposeDelegate:](self->_messageComposeViewController, "setMessageComposeDelegate:", self);
    -[FAInviteContext messageBubbleTitle](self->_context, "messageBubbleTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDD0D0]), "initWithLinkMetadata:", self->_linkMetadata);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDD0C8]), "initWithAlternateLayout:", v7);
      v25[0] = *MEMORY[0x24BE4FDA0];
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setRequiredCapabilities:", v9);

      v10 = objc_alloc(MEMORY[0x24BDDD0C0]);
      v11 = objc_alloc_init(MEMORY[0x24BDDD0E8]);
      v12 = (void *)objc_msgSend(v10, "initWithSession:", v11);

      objc_msgSend(v12, "setLayout:", v8);
      -[FAInviteContext buildInviteMessageBubbleURL:](self->_context, "buildInviteMessageBubbleURL:", self->_familySuggestionHandle);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setURL:", v13);

      -[FAInviteContext messageBubbleSubTitle](self->_context, "messageBubbleSubTitle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSummaryText:", v14);

      -[MFMessageComposeViewController setMessage:](self->_messageComposeViewController, "setMessage:", v12);
    }
    else
    {
      v15 = self->_messageComposeViewController;
      -[LPLinkMetadata dataRepresentation](self->_linkMetadata, "dataRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[FAInviteContext inviteURL](self->_context, "inviteURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMessageComposeViewController addRichLinkData:withWebpageURL:](v15, "addRichLinkData:withWebpageURL:", v16, v17);

    }
    -[FAInviteContext invitees](self->_context, "invitees");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (v19)
    {
      v20 = self->_messageComposeViewController;
      -[FAInviteContext invitees](self->_context, "invitees");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!self->_familySuggestionHandle)
      {
LABEL_10:
        -[MFMessageComposeViewController _setCanEditRecipients:](self->_messageComposeViewController, "_setCanEditRecipients:", -[FAInviteContext canEditRecipients](self->_context, "canEditRecipients"));
        messageComposeViewController = self->_messageComposeViewController;
        return messageComposeViewController;
      }
      v20 = self->_messageComposeViewController;
      familySuggestionHandle = self->_familySuggestionHandle;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &familySuggestionHandle, 1);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    v22 = (void *)v21;
    -[MFMessageComposeViewController setRecipients:](v20, "setRecipients:", v21);

    goto LABEL_10;
  }
  return messageComposeViewController;
}

+ (BOOL)isAvailable
{
  NSObject *v2;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  _FALogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = objc_msgSend(MEMORY[0x24BDDD0A8], "canSendText");
    _os_log_impl(&dword_20DE41000, v2, OS_LOG_TYPE_DEFAULT, "can send text %d", (uint8_t *)v4, 8u);
  }

  return objc_msgSend(MEMORY[0x24BDDD0A8], "isiMessageEnabled");
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
    v15 = +[FAMessagesInviteConfigurationController isAvailable](FAMessagesInviteConfigurationController, "isAvailable");
    _os_log_impl(&dword_20DE41000, v5, OS_LOG_TYPE_DEFAULT, "_presentMessagesViewController - can send text: %d", buf, 8u);
  }

  -[FAMessagesInviteConfigurationController _messageComposeViewController](self, "_messageComposeViewController");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6
    && (v7 = (void *)v6,
        v8 = +[FAMessagesInviteConfigurationController isAvailable](FAMessagesInviteConfigurationController, "isAvailable"), v7, v8))
  {
    presentationContext = self->_presentationContext;
    -[FAMessagesInviteConfigurationController _messageComposeViewController](self, "_messageComposeViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __82__FAMessagesInviteConfigurationController__presentInviteControllerWithCompletion___block_invoke;
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
      _os_log_impl(&dword_20DE41000, v11, OS_LOG_TYPE_DEFAULT, "Unable to present FAMessagesInViteConfigurationController", buf, 2u);
    }

    if (v4)
      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

uint64_t __82__FAMessagesInviteConfigurationController__presentInviteControllerWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  id WeakRetained;
  char v11;
  const __CFString *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  int64_t v17;
  const __CFString *v18;
  const __CFString *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  int64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  _FALogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v21 = v9;
    v22 = 2048;
    v23 = a4;
    _os_log_impl(&dword_20DE41000, v7, OS_LOG_TYPE_DEFAULT, "%@ MFMessageComposeVC delegate callback - didFinishWithResult:%ld", buf, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    if (a4 == 1)
    {
      v12 = CFSTR("0");
    }
    else if (a4)
    {
      v12 = CFSTR("0");
      a4 = 2;
    }
    else
    {
      v12 = CFSTR("1");
    }
    v18 = CFSTR("userCancelled");
    v19 = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __92__FAMessagesInviteConfigurationController_messageComposeViewController_didFinishWithResult___block_invoke;
    v15[3] = &unk_24C88BDE0;
    v16 = v13;
    v17 = a4;
    v15[4] = self;
    v14 = v13;
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v15);

  }
  else
  {
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

void __92__FAMessagesInviteConfigurationController_messageComposeViewController_didFinishWithResult___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 56));
  objc_msgSend(WeakRetained, "inviteController:didFinishWithStatus:recipients:userInfo:error:", a1[4], a1[6], *(_QWORD *)(a1[4] + 32), a1[5], 0);

}

- (void)messageComposeViewController:(id)a3 shouldSendMessage:(id)a4 toRecipients:(id)a5 completion:(id)a6
{
  NSArray *v8;
  id v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  NSArray *recipientAddresses;
  NSArray *v14;
  FAInviteRecipientEvaluator *inviteRecipientEvaluator;
  FAInviteContext *context;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = (NSArray *)a5;
  v9 = a6;
  _FALogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412290;
    v19 = v12;
    _os_log_impl(&dword_20DE41000, v10, OS_LOG_TYPE_DEFAULT, "%@ MFMessageComposeVC delegate callback - shouldSendMessage", (uint8_t *)&v18, 0xCu);

  }
  recipientAddresses = self->_recipientAddresses;
  self->_recipientAddresses = v8;
  v14 = v8;

  inviteRecipientEvaluator = self->_inviteRecipientEvaluator;
  context = self->_context;
  -[MFMessageComposeViewController visibleViewController](self->_messageComposeViewController, "visibleViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAInviteRecipientEvaluator validateRecipients:inviteContext:presenter:completion:](inviteRecipientEvaluator, "validateRecipients:inviteContext:presenter:completion:", v14, context, v17, v9);

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
  objc_storeStrong((id *)&self->_inviteRecipientEvaluator, 0);
  objc_storeStrong((id *)&self->_familySuggestionHandle, 0);
  objc_storeStrong((id *)&self->_recipientAddresses, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_storeStrong((id *)&self->_linkMetadata, 0);
  objc_storeStrong((id *)&self->_messageComposeViewController, 0);
}

@end
