@implementation NSCompoundPredicate(CNVisitation)

- (uint64_t)_cn_acceptVisitor:()CNVisitation
{
  return objc_msgSend(a3, "visitNSCompoundPredicate:", a1);
}

@end
