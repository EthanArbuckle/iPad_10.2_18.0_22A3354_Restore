@implementation NSObject(BSXPCObjectUtilitiesIndirect)

+ (uint64_t)bs_isXPCObject
{
  return objc_msgSend(a1, "isSubclassOfClass:", BSXPCObjectBaseClass());
}

@end
