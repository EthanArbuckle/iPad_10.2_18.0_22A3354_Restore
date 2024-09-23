@implementation CSAudioRecordContext(Helper)

- (uint64_t)shouldUseLocalAudioFileWriter
{
  return objc_msgSend(a1, "isContinuousConversation") ^ 1;
}

@end
