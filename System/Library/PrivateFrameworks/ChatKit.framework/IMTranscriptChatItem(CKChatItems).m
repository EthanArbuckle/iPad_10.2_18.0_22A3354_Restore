@implementation IMTranscriptChatItem(CKChatItems)

- (uint64_t)__ck_chatItemClass
{
  NSLog(CFSTR("No CKChatItem class for %@"), a1);
  return 0;
}

@end
