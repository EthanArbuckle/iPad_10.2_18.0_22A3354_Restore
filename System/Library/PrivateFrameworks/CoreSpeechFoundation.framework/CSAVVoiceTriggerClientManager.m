@implementation CSAVVoiceTriggerClientManager

+ (id)sharedVoiceTriggerClient
{
  return (id)objc_msgSend(MEMORY[0x1E0C89C20], "sharedInstance");
}

@end
