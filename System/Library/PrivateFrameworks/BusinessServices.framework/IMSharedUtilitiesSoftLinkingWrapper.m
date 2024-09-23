@implementation IMSharedUtilitiesSoftLinkingWrapper

- (BOOL)isRCSChatBot:(id)a3
{
  return objc_msgSend(a3, "__im_isChatBot");
}

@end
