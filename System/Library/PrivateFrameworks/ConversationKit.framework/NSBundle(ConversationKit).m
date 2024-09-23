@implementation NSBundle(ConversationKit)

+ (uint64_t)conversationKit
{
  return objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
}

@end
