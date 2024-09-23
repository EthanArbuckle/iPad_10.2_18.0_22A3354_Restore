@implementation CKPinnedConversationTypingBubbleActivityItem

- (NSString)activityItemIdentifier
{
  return (NSString *)CFSTR("typing");
}

- (BOOL)activityItemAppearsWithAnimation
{
  return 1;
}

- (BOOL)activityItemDisappearsWithAnimation
{
  return 0;
}

- (id)activityItemView
{
  return -[CKPinnedConversationTypingBubble initWithActivityItem:]([CKPinnedConversationTypingBubble alloc], "initWithActivityItem:", self);
}

- (double)activityItemContentScale
{
  return 1.0;
}

- (NSString)attachedContactItemIdentifier
{
  return 0;
}

@end
