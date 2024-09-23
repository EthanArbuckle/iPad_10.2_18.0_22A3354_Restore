@implementation NSURLQueryItem(AppleMediaServices)

+ (uint64_t)queryItemsFromDictionary:()AppleMediaServices
{
  return objc_msgSend(a3, "ams_arrayUsingTransform:", &__block_literal_global_150);
}

@end
