@implementation BMMessagesSharedWithYouFeedback_v3

- (int)feedbackType
{
  unsigned int v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BMMessagesSharedWithYouFeedback_v3;
  v2 = -[BMMessagesSharedWithYouFeedback feedbackType](&v4, sel_feedbackType);
  if (v2 < 0xB)
    return v2 + 1;
  else
    return 0;
}

@end
