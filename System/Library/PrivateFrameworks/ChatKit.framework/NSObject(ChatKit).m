@implementation NSObject(ChatKit)

+ (uint64_t)__ck_isKindOfClass:()ChatKit
{
  if ((objc_msgSend(a1, "isEqual:") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "isSubclassOfClass:", a3);
}

- (uint64_t)ck_constrainedSizeThatFits:()ChatKit
{
  return objc_msgSend(a1, "sizeThatFits:");
}

@end
