@implementation NSBundle(FeedbackCore)

+ (uint64_t)FeedbackCore
{
  return objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
}

@end
