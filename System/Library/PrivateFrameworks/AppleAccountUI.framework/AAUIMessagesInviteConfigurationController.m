@implementation AAUIMessagesInviteConfigurationController

- (AAUIMessagesInviteConfigurationController)initWithInviteContext:(id)a3 flow:(unint64_t)a4 presentingController:(id)a5
{
  id v9;
  id v10;
  AAUIMessagesInviteConfigurationController *v11;
  AAUIMessagesInviteConfigurationController *v12;

  v9 = a3;
  v10 = a5;
  v11 = -[AAUIMessagesInviteConfigurationController init](self, "init");
  v12 = v11;
  if (v11)
  {
    v11->_flow = a4;
    objc_storeStrong((id *)&v11->_context, a3);
    objc_storeStrong((id *)&v12->_presentingViewController, a5);
  }

  return v12;
}

- (void)presentWhenReadyWithCompletion:(id)a3
{
  id v4;
  AAUIInviteLinkMetadataProvider *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self->_linkMetadata)
  {
    -[AAUIMessagesInviteConfigurationController _presentInviteControllerWithCompletion:](self, "_presentInviteControllerWithCompletion:", v4);
  }
  else
  {
    v5 = -[AAUIInviteLinkMetadataProvider initWithContext:]([AAUIInviteLinkMetadataProvider alloc], "initWithContext:", self->_context);
    -[AAUIMessagesInviteConfigurationController _bubbleImageForFlow:](self, "_bubbleImageForFlow:", self->_flow);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __76__AAUIMessagesInviteConfigurationController_presentWhenReadyWithCompletion___block_invoke;
    v7[3] = &unk_1EA2DC310;
    v7[4] = self;
    v8 = v4;
    -[AAUIInviteLinkMetadataProvider loadMetadataWithImage:completion:](v5, "loadMetadataWithImage:completion:", v6, v7);

  }
}

void __76__AAUIMessagesInviteConfigurationController_presentWhenReadyWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
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
    v9 = *(void **)(v8 + 24);
    *(_QWORD *)(v8 + 24) = v7;

    objc_msgSend(*(id *)(a1 + 32), "_presentInviteControllerWithCompletion:", *(_QWORD *)(a1 + 40));
  }

}

- (id)_bubbleImageForFlow:(unint64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  if (a3 == 1)
  {
    v3 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("beneficiary_message_bubble");
  }
  else
  {
    if (a3)
    {
      v6 = 0;
      return v6;
    }
    v3 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("custodian_message_bubble");
  }
  objc_msgSend(v3, "imageNamed:inBundle:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_messageComposeViewController
{
  MFMessageComposeViewController *messageComposeViewController;
  MFMessageComposeViewController *v4;
  MFMessageComposeViewController *v5;
  MFMessageComposeViewController *v6;
  void *v7;
  void *v8;
  MFMessageComposeViewController *v9;
  void *v10;
  MFMessageComposeViewController *v11;
  void *v12;

  messageComposeViewController = self->_messageComposeViewController;
  if (!messageComposeViewController)
  {
    v4 = (MFMessageComposeViewController *)objc_alloc_init(MEMORY[0x1E0CC68C8]);
    v5 = self->_messageComposeViewController;
    self->_messageComposeViewController = v4;

    -[MFMessageComposeViewController setMessageComposeDelegate:](self->_messageComposeViewController, "setMessageComposeDelegate:", self);
    v6 = self->_messageComposeViewController;
    -[LPLinkMetadata dataRepresentation](self->_linkMetadata, "dataRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAMessagesInviteContext inviteURL](self->_context, "inviteURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessageComposeViewController addRichLinkData:withWebpageURL:](v6, "addRichLinkData:withWebpageURL:", v7, v8);

    v9 = self->_messageComposeViewController;
    -[AAMessagesInviteContext recipients](self->_context, "recipients");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessageComposeViewController setRecipients:](v9, "setRecipients:", v10);

    -[MFMessageComposeViewController _setCanEditRecipients:](self->_messageComposeViewController, "_setCanEditRecipients:", 0);
    v11 = self->_messageComposeViewController;
    -[AAMessagesInviteContext messageBody](self->_context, "messageBody");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessageComposeViewController setBody:](v11, "setBody:", v12);

    messageComposeViewController = self->_messageComposeViewController;
  }
  return messageComposeViewController;
}

+ (BOOL)isAvailable
{
  return objc_msgSend(MEMORY[0x1E0CC68C8], "isiMessageEnabled");
}

- (void)_presentInviteControllerWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  _BOOL4 v10;
  UIViewController *presentingViewController;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  _BOOL4 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  _AAUILogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v17 = +[AAUIMessagesInviteConfigurationController isAvailable](AAUIMessagesInviteConfigurationController, "isAvailable");
    _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "_presentMessagesViewController - can send text: %d", buf, 8u);
  }

  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = self->_messageComposeViewController != 0;
    *(_DWORD *)buf = 67109120;
    v17 = v7;
    _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "_presentMessagesViewController - has : _messageComposeViewController %d", buf, 8u);
  }

  -[AAUIMessagesInviteConfigurationController _messageComposeViewController](self, "_messageComposeViewController");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8
    && (v9 = (void *)v8,
        v10 = +[AAUIMessagesInviteConfigurationController isAvailable](AAUIMessagesInviteConfigurationController, "isAvailable"), v9, v10))
  {
    presentingViewController = self->_presentingViewController;
    -[AAUIMessagesInviteConfigurationController _messageComposeViewController](self, "_messageComposeViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __84__AAUIMessagesInviteConfigurationController__presentInviteControllerWithCompletion___block_invoke;
    v14[3] = &unk_1EA2DB138;
    v14[4] = self;
    v15 = v4;
    -[UIViewController presentViewController:animated:completion:](presentingViewController, "presentViewController:animated:completion:", v12, 1, v14);

  }
  else
  {
    _AAUILogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v13, OS_LOG_TYPE_DEFAULT, "Unable to present AAUIMessagesInViteConfigurationController", buf, 2u);
    }

    if (v4)
      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

uint64_t __84__AAUIMessagesInviteConfigurationController__presentInviteControllerWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  uint64_t result;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _AAUILogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) != 0;
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_1DB4ED000, v2, OS_LOG_TYPE_DEFAULT, "_presentMessagesViewController - has : _messageComposeViewController %d", (uint8_t *)v5, 8u);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  id WeakRetained;
  char v12;
  NSObject *v13;
  const __CFString *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[5];
  id v33;
  id v34;
  int64_t v35;
  const __CFString *v36;
  const __CFString *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  int64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  _AAUILogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v39 = v10;
    v40 = 2048;
    v41 = a4;
    _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "%@ MFMessageComposeVC delegate callback - didFinishWithResult:%ld", buf, 0x16u);

  }
  objc_storeStrong((id *)&self->_presentingViewController, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    _AAUILogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v13, OS_LOG_TYPE_DEFAULT, "Calling back to controller delegate", buf, 2u);
    }

    if (a4 == 1)
    {
      v14 = CFSTR("0");
    }
    else if (a4)
    {
      v14 = CFSTR("0");
      a4 = 2;
    }
    else
    {
      v14 = CFSTR("1");
    }
    v36 = CFSTR("userCancelled");
    v37 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __94__AAUIMessagesInviteConfigurationController_messageComposeViewController_didFinishWithResult___block_invoke;
    v32[3] = &unk_1EA2DC338;
    v32[4] = self;
    v34 = v16;
    v35 = a4;
    v33 = v7;
    v17 = v16;
    dispatch_async(MEMORY[0x1E0C80D38], v32);

  }
  else
  {
    if (a4)
    {
      if (a4 == 1)
      {
        _AAUILogSystem();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DB4ED000, v15, OS_LOG_TYPE_DEFAULT, "Message sent successfully", buf, 2u);
        }
      }
      else
      {
        _AAUILogSystem();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[AAUIMessagesInviteConfigurationController messageComposeViewController:didFinishWithResult:].cold.1(v15, v25, v26, v27, v28, v29, v30, v31);
      }
    }
    else
    {
      _AAUILogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[AAUIMessagesInviteConfigurationController messageComposeViewController:didFinishWithResult:].cold.2(v15, v18, v19, v20, v21, v22, v23, v24);
    }

    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

void __94__AAUIMessagesInviteConfigurationController_messageComposeViewController_didFinishWithResult___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 48));
  objc_msgSend(WeakRetained, "inviteController:didFinishWithStatus:recipients:userInfo:error:", a1[5], a1[7], *(_QWORD *)(a1[4] + 40), a1[6], 0);

}

- (void)messageComposeViewController:(id)a3 shouldSendMessage:(id)a4 toRecipients:(id)a5 completion:(id)a6
{
  NSArray *v8;
  void (**v9)(id, BOOL);
  NSObject *v10;
  objc_class *v11;
  void *v12;
  NSArray *recipientAddresses;
  NSArray *v14;
  uint64_t v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = (NSArray *)a5;
  v9 = (void (**)(id, BOOL))a6;
  _AAUILogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412290;
    v17 = v12;
    _os_log_impl(&dword_1DB4ED000, v10, OS_LOG_TYPE_DEFAULT, "%@ MFMessageComposeVC delegate callback - shouldSendMessage", (uint8_t *)&v16, 0xCu);

  }
  recipientAddresses = self->_recipientAddresses;
  self->_recipientAddresses = v8;
  v14 = v8;

  v15 = -[NSArray count](v14, "count");
  v9[2](v9, v15 != 0);

}

- (AAUIInviteControllerDelegate)delegate
{
  return (AAUIInviteControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AAMessagesInviteContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recipientAddresses, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_linkMetadata, 0);
  objc_storeStrong((id *)&self->_messageComposeViewController, 0);
}

- (void)messageComposeViewController:(uint64_t)a3 didFinishWithResult:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, a1, a3, "Message failure", a5, a6, a7, a8, 0);
}

- (void)messageComposeViewController:(uint64_t)a3 didFinishWithResult:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, a1, a3, "Message cancelled", a5, a6, a7, a8, 0);
}

@end
