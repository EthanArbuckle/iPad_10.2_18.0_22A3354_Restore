@implementation CKTranscriptExtensionViewController

+ (void)initialize
{
  NSObject *v2;

  if (CKIsRunningInMessagesTranscriptExtension())
  {
    if (initialize_token != -1)
      dispatch_once(&initialize_token, &__block_literal_global_257);
    dispatch_get_global_queue(2, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v2, &__block_literal_global_50_2);

    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_52_2);
  }
}

void __49__CKTranscriptExtensionViewController_initialize__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0D357F0], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addListenerID:capabilities:", CFSTR("com.apple.MobileSMS.MessagesTranscriptExtension"), *MEMORY[0x1E0D36D08] | *MEMORY[0x1E0D36CF0] | *MEMORY[0x1E0D36CD0] | *MEMORY[0x1E0D36CE0] | *MEMORY[0x1E0D36CE8] | *MEMORY[0x1E0D36D10] | *MEMORY[0x1E0D36CF8] | (*MEMORY[0x1E0D36D00] | *MEMORY[0x1E0D36D28]));

  objc_msgSend(MEMORY[0x1E0D357F0], "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "blockUntilConnected");

  objc_msgSend(MEMORY[0x1E0D357F0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setBlocksConnectionAtResume:", 1);

}

id __49__CKTranscriptExtensionViewController_initialize__block_invoke_2()
{
  return (id)objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
}

uint64_t __49__CKTranscriptExtensionViewController_initialize__block_invoke_3()
{
  return +[CKSocialLayerChatController initialize](CKSocialLayerChatController, "initialize");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKTranscriptExtensionViewController;
  -[CKTranscriptExtensionViewController viewDidLoad](&v12, sel_viewDidLoad);
  -[CKTranscriptExtensionViewController extensionContext](self, "extensionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForKey:", CFSTR("messageGUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForKey:", CFSTR("attachmentGUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v7, "length"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v11 = 0;
          _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "chatGUID or messageGUID key not provided in extension context", v11, 2u);
        }

      }
      exit(0);
    }
    -[CKTranscriptExtensionViewController presentConversationWithMessageGUID:attachmentGUID:](self, "presentConversationWithMessageGUID:attachmentGUID:", v7, v9);

  }
}

- (void)presentConversationWithMessageGUID:(id)a3 attachmentGUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  CKConversation *v11;
  CKSocialLayerChatController *v12;
  void *v13;
  NSObject *v14;
  int v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[CKSocialLayerChatController chatIdentifierForMessageWithGUID:](CKSocialLayerChatController, "chatIdentifierForMessageWithGUID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "existingChatWithChatIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = 138412290;
        v16 = v6;
        _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "The messageGUID %@ doesn't correspond to a chat. Nothing to present.", (uint8_t *)&v15, 0xCu);
      }

    }
    exit(0);
  }
  v11 = -[CKConversation initWithChat:]([CKConversation alloc], "initWithChat:", v10);
  -[CKConversation setLoadedMessageCount:](v11, "setLoadedMessageCount:", 50);
  v12 = -[CKSocialLayerChatController initWithConversation:]([CKSocialLayerChatController alloc], "initWithConversation:", v11);
  -[CKSocialLayerChatController setMessageGUID:](v12, "setMessageGUID:", v6);
  -[CKSocialLayerChatController setAttachmentGUID:](v12, "setAttachmentGUID:", v7);
  -[CKCoreChatController setDelegate:](v12, "setDelegate:", self);
  v17[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptExtensionViewController setViewControllers:](self, "setViewControllers:", v13);

}

- (UIEdgeInsets)initialSystemMinimumLayoutMarginsForChatController:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = *MEMORY[0x1E0CEB4B0];
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v6 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)initialSafeAreaInsetsForChatController:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = *MEMORY[0x1E0CEB4B0];
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v6 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)doneButtonPressedForChatController:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[CKTranscriptExtensionViewController extensionContext](self, "extensionContext", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_auxiliaryConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "requestDismissal");
}

- (NSUUID)requestUUID
{
  return self->_requestUUID;
}

- (void)setRequestUUID:(id)a3
{
  objc_storeStrong((id *)&self->_requestUUID, a3);
}

- (NSExtension)weakExtension
{
  return (NSExtension *)objc_loadWeakRetained((id *)&self->_weakExtension);
}

- (void)setWeakExtension:(id)a3
{
  objc_storeWeak((id *)&self->_weakExtension, a3);
}

- (CKDetailsNavigationController)detailsNavigationController
{
  return (CKDetailsNavigationController *)objc_loadWeakRetained((id *)&self->_detailsNavigationController);
}

- (void)setDetailsNavigationController:(id)a3
{
  objc_storeWeak((id *)&self->_detailsNavigationController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_detailsNavigationController);
  objc_destroyWeak((id *)&self->_weakExtension);
  objc_storeStrong((id *)&self->_requestUUID, 0);
}

@end
