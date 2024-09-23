@implementation NSPredicate(HKFilterExtension)

- (uint64_t)hk_filterRepresentationForDataTypes:()HKFilterExtension
{
  return objc_msgSend(a1, "hk_filterRepresentationForDataTypes:isSubpredicate:", a3, 0);
}

- (uint64_t)hk_filterRepresentationForDataTypes:()HKFilterExtension isSubpredicate:
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end
