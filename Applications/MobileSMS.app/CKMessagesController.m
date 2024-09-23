@implementation CKMessagesController

- (id)ppt_chatController
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKMessagesController composeChatController](self, "composeChatController"));

  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKMessagesController composeChatController](self, "composeChatController"));
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKMessagesController chatController](self, "chatController"));
  return v4;
}

@end
