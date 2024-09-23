@implementation NSNumber(GKServerTimestamp)

+ (uint64_t)_gkServerTimeInterval:()GKServerTimestamp
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (uint64_t)(a1 * 1000.0));
}

@end
