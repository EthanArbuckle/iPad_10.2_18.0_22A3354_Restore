@implementation NSKeyedArchiver(CATSecureCoding)

+ (uint64_t)cat_archivedDataWithRootObject:()CATSecureCoding
{
  return objc_msgSend(a1, "cat_archivedDataWithRootObject:error:", a3, 0);
}

+ (uint64_t)cat_archivedDataWithRootObject:()CATSecureCoding error:
{
  return objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, a4);
}

@end
