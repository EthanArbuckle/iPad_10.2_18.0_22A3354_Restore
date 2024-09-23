@implementation NSData(CTAdditions)

+ (uint64_t)nonOwningDataWithBytes:()CTAdditions length:
{
  return objc_msgSend((id)objc_opt_class(), "dataWithBytesNoCopy:length:freeWhenDone:", a3, a4, 0);
}

@end
