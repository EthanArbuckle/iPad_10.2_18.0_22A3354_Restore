@implementation CKTranscriptExtensionViewController

+ (void)initialize
{
  dispatch_queue_global_t global_queue;
  NSObject *v3;

  if (CKIsRunningInMessagesTranscriptExtension(a1, a2))
  {
    if (qword_100008E38 != -1)
      dispatch_once(&qword_100008E38, &stru_100004240);
    global_queue = dispatch_get_global_queue(2, 0);
    v3 = objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_async(v3, &stru_100004260);

    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100004280);
  }
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
  uint64_t v10;
  NSObject *v11;
  uint8_t v12[16];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKTranscriptExtensionViewController;
  -[CKTranscriptExtensionViewController viewDidLoad](&v13, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKTranscriptExtensionViewController extensionContext](self, "extensionContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "inputItems"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKey:", CFSTR("messageGUID")));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("attachmentGUID")));

    if (!objc_msgSend(v7, "length"))
    {
      if (IMOSLoggingEnabled())
      {
        v10 = OSLogHandleForIMFoundationCategory("CKTranscriptExtensionViewController");
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "chatGUID or messageGUID key not provided in extension context", v12, 2u);
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
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CKSocialLayerChatController chatIdentifierForMessageWithGUID:](CKSocialLayerChatController, "chatIdentifierForMessageWithGUID:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "existingChatWithChatIdentifier:", v8));

  if (!v10)
  {
    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory("CKTranscriptExtensionViewController");
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = 138412290;
        v17 = v6;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "The messageGUID %@ doesn't correspond to a chat. Nothing to present.", (uint8_t *)&v16, 0xCu);
      }

    }
    exit(0);
  }
  v11 = objc_msgSend(objc_alloc((Class)CKConversation), "initWithChat:", v10);
  objc_msgSend(v11, "setLoadedMessageCount:", 50);
  v12 = objc_msgSend(objc_alloc((Class)CKSocialLayerChatController), "initWithConversation:", v11);
  objc_msgSend(v12, "setMessageGUID:", v6);
  objc_msgSend(v12, "setAttachmentGUID:", v7);
  objc_msgSend(v12, "setDelegate:", self);
  v18 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  -[CKTranscriptExtensionViewController setViewControllers:](self, "setViewControllers:", v13);

}

- (UIEdgeInsets)initialSystemMinimumLayoutMarginsForChatController:(id)a3
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = UIEdgeInsetsZero.top;
  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)initialSafeAreaInsetsForChatController:(id)a3
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = UIEdgeInsetsZero.top;
  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)doneButtonPressedForChatController:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKTranscriptExtensionViewController extensionContext](self, "extensionContext", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_auxiliaryConnection"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remoteObjectProxy"));

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
