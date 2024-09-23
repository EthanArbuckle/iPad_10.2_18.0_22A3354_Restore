@implementation CKTranscriptChatItemRules

- (BOOL)shouldShowRaiseMessageStatus
{
  return +[CKRaiseGesture isRaiseGestureEnabled](CKRaiseGesture, "isRaiseGestureEnabled");
}

@end
