@implementation NSPredicate(CNVisitation)

- (uint64_t)_cn_acceptVisitor:()CNVisitation
{
  return objc_msgSend(a3, "visitNSPredicate:", a1);
}

@end
