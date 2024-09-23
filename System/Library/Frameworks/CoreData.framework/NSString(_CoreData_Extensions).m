@implementation NSString(_CoreData_Extensions)

- (uint64_t)_caseInsensitiveNumericCompare:()_CoreData_Extensions
{
  return objc_msgSend(a1, "compare:options:range:", a3, 65, 0, objc_msgSend(a1, "length"));
}

@end
