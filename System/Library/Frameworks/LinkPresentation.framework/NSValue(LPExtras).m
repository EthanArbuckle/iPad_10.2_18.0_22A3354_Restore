@implementation NSValue(LPExtras)

+ (uint64_t)_lp_valueWithCGRect:()LPExtras
{
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:");
}

+ (uint64_t)_lp_valueWithCGSize:()LPExtras
{
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:");
}

@end
