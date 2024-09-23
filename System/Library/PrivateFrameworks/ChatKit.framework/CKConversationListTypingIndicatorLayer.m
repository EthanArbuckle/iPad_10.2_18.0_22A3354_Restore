@implementation CKConversationListTypingIndicatorLayer

- (id)defaultBubbleColor
{
  void *v2;
  void *v3;
  void *v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "theme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unselectedConversationListTypingIndicatorBubbleColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)defaultThinkingDotColor
{
  void *v2;
  void *v3;
  void *v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "theme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unselectedConversationListTypingIndicatorDotColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
