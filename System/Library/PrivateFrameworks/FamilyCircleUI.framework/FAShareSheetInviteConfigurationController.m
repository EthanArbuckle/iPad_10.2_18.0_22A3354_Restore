@implementation FAShareSheetInviteConfigurationController

- (FAShareSheetInviteConfigurationController)initWithInviteContext:(id)a3 presentingController:(id)a4
{
  id v7;
  id v8;
  FAShareSheetInviteConfigurationController *v9;
  FAShareSheetInviteConfigurationController *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[FAShareSheetInviteConfigurationController init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_presentationContext, a4);
  }

  return v10;
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
    -[FAShareSheetInviteConfigurationController _presentInviteControllerWithCompletion:](self, "_presentInviteControllerWithCompletion:", v4);
  }
  else
  {
    v5 = -[FAInviteLinkMetadataProvider initWithContext:]([FAInviteLinkMetadataProvider alloc], "initWithContext:", self->_context);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __76__FAShareSheetInviteConfigurationController_presentWhenReadyWithCompletion___block_invoke;
    v6[3] = &unk_24C88BD90;
    v6[4] = self;
    v7 = v4;
    -[FAInviteLinkMetadataProvider loadMetatadataWithCompletion:](v5, "loadMetatadataWithCompletion:", v6);

  }
}

void __76__FAShareSheetInviteConfigurationController_presentWhenReadyWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, 1, v6);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), a2);
    objc_msgSend(*(id *)(a1 + 32), "_presentInviteControllerWithCompletion:", *(_QWORD *)(a1 + 40));
  }

}

- (id)_parameterForActivityType:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE8F6B8]) & 1) != 0)
  {
    v4 = CFSTR("messages");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE8F6A8]) & 1) != 0)
  {
    v4 = CFSTR("mail");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE8F690]) & 1) != 0)
  {
    v4 = CFSTR("airdrop");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FAInviteInPersonActivity")))
  {
    v4 = CFSTR("inPerson");
  }
  else
  {
    v4 = 0;
  }

  return (id)v4;
}

- (void)_presentInviteControllerWithCompletion:(id)a3
{
  id v4;
  FAActivityViewController *v5;
  void *v6;
  FAActivityViewController *v7;
  uint64_t v8;
  void *v9;
  id activityControllerCompletionHandler;
  void *v11;
  uint64_t v12;
  UIViewController *presentationContext;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD aBlock[4];
  id v18;
  id v19;
  id from;
  id location;

  v4 = a3;
  v5 = [FAActivityViewController alloc];
  -[FAInviteContext eventType](self->_context, "eventType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FAActivityViewController initWithItemSource:eventType:](v5, "initWithItemSource:eventType:", self, v6);

  -[FAActivityViewController setDelegate:](v7, "setDelegate:", self);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v7);
  v8 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__FAShareSheetInviteConfigurationController__presentInviteControllerWithCompletion___block_invoke;
  aBlock[3] = &unk_24C88C7A0;
  objc_copyWeak(&v18, &location);
  objc_copyWeak(&v19, &from);
  v9 = _Block_copy(aBlock);
  activityControllerCompletionHandler = self->_activityControllerCompletionHandler;
  self->_activityControllerCompletionHandler = v9;

  -[FAActivityViewController setCompletionWithItemsHandler:](v7, "setCompletionWithItemsHandler:", self->_activityControllerCompletionHandler);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  if (v12 == 1)
    -[FAActivityViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 2);
  presentationContext = self->_presentationContext;
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __84__FAShareSheetInviteConfigurationController__presentInviteControllerWithCompletion___block_invoke_2;
  v15[3] = &unk_24C88BDB8;
  v14 = v4;
  v16 = v14;
  -[UIViewController presentViewController:animated:completion:](presentationContext, "presentViewController:animated:completion:", v7, 1, v15);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __84__FAShareSheetInviteConfigurationController__presentInviteControllerWithCompletion___block_invoke(uint64_t a1, void *a2, int a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  _QWORD *WeakRetained;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  _QWORD v24[4];
  id v25;
  _QWORD *v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a4;
  v11 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v13 = objc_loadWeakRetained((id *)(a1 + 40));
  _FALogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v23 = CFSTR("NO");
    *(_DWORD *)buf = 138413058;
    v28 = v9;
    if (a3)
      v23 = CFSTR("YES");
    v29 = 2112;
    v30 = v23;
    v31 = 2112;
    v32 = v10;
    v33 = 2112;
    v34 = v11;
    _os_log_debug_impl(&dword_20DE41000, v14, OS_LOG_TYPE_DEBUG, "_activityControllerCompletionHandler type: %@\ncompleted: %@\nreturnedItems: %@\nerror:%@", buf, 0x2Au);
  }

  if (objc_msgSend(v9, "isEqualToString:", CFSTR("FAInviteInPersonActivity")))
  {
    objc_msgSend(WeakRetained, "activityViewController:didCompleteActivityType:", v13, v9);
    if ((objc_msgSend(WeakRetained, "alwaysNotifyServer") & 1) == 0)
    {
      if (!a3)
        goto LABEL_17;
      objc_msgSend(v13, "activity");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "response");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dismissWithUserInfo:", v22);

LABEL_16:
      goto LABEL_17;
    }
  }
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE8F690])
    && (objc_msgSend(v13, "didCompleteAirdropTransfer") & 1) == 0)
  {
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __84__FAShareSheetInviteConfigurationController__presentInviteControllerWithCompletion___block_invoke_21;
    v24[3] = &unk_24C88B958;
    v25 = v13;
    v26 = WeakRetained;
    dispatch_async(MEMORY[0x24BDAC9B8], v24);

    v18 = v25;
    goto LABEL_16;
  }
  if (v9 && (v11 || a3))
  {
    if (v11)
      v15 = 2;
    else
      v15 = 1;
    objc_msgSend(v13, "recipientAddresses");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)WeakRetained[4];
    WeakRetained[4] = v16;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_parameterForActivityType:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BE30940]);

    objc_msgSend(WeakRetained, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "inviteController:didFinishWithStatus:recipients:userInfo:error:", WeakRetained, v15, WeakRetained[4], v18, v11);

    goto LABEL_16;
  }
LABEL_17:

}

uint64_t __84__FAShareSheetInviteConfigurationController__presentInviteControllerWithCompletion___block_invoke_21(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCompletionWithItemsHandler:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
}

uint64_t __84__FAShareSheetInviteConfigurationController__presentInviteControllerWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  return -[FAInviteLinkMetadata bubbleMetadata](self->_linkMetadata, "bubbleMetadata", a3);
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE8F690]))
  {
    -[FAInviteLinkMetadata bubbleMetadata](self->_linkMetadata, "bubbleMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "originalURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fa_URLByAddingAirdropInviteParams");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
    goto LABEL_7;
  }
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE8F6B8]) & 1) == 0)
  {
    -[FAInviteLinkMetadata bubbleMetadata](self->_linkMetadata, "bubbleMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "originalURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v8 = 0;
LABEL_7:

  return v8;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  void *v3;
  void *v4;

  -[FAInviteLinkMetadata bubbleMetadata](self->_linkMetadata, "bubbleMetadata", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)activityViewController:(id)a3 willStartAsyncActivity:(id)a4
{
  void *v5;
  char v6;
  id v7;

  -[FAShareSheetInviteConfigurationController delegate](self, "delegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[FAShareSheetInviteConfigurationController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inviteControllerDidStartAsyncLoading:", self);

  }
}

- (void)activityViewController:(id)a3 didCompleteActivityType:(id)a4
{
  void *v5;
  char v6;
  id v7;

  -[FAShareSheetInviteConfigurationController delegate](self, "delegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[FAShareSheetInviteConfigurationController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inviteControllerDidEndAsyncLoading:", self);

  }
}

- (id)linkMetadataForActivityViewController:(id)a3
{
  return self->_linkMetadata;
}

- (FAInviteControllerDelegate)delegate
{
  return (FAInviteControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)alwaysNotifyServer
{
  return self->_alwaysNotifyServer;
}

- (void)setAlwaysNotifyServer:(BOOL)a3
{
  self->_alwaysNotifyServer = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_activityControllerCompletionHandler, 0);
  objc_storeStrong((id *)&self->_recipientAddresses, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_storeStrong((id *)&self->_linkMetadata, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
