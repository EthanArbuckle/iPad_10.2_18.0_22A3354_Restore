@implementation NSObject(BSXPCSecureCoding)

- (uint64_t)supportsBSXPCSecureCoding
{
  return objc_msgSend((id)objc_opt_class(), "supportsBSXPCSecureCoding");
}

+ (uint64_t)supportsBSXPCSecureCoding
{
  return 0;
}

@end
