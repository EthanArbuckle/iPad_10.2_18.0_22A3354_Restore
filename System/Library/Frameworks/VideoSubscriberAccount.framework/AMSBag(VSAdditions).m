@implementation AMSBag(VSAdditions)

+ (uint64_t)vs_defaultBag
{
  return objc_msgSend(MEMORY[0x1E0CFD9E8], "bagForProfile:profileVersion:", CFSTR("VideoSubscriberAccount"), CFSTR("1"));
}

@end
