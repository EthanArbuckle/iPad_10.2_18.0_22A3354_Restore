@implementation NSNumber(CGFloat)

+ (uint64_t)numberWithCGFloat:()CGFloat
{
  return objc_msgSend((id)objc_opt_class(), "numberWithDouble:", a1);
}

@end
