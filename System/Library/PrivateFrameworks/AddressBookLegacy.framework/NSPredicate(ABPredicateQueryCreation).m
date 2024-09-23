@implementation NSPredicate(ABPredicateQueryCreation)

- (uint64_t)ab_addCallbackContextToArray:()ABPredicateQueryCreation
{
  objc_msgSend(a3, "addObject:", objc_msgSend(MEMORY[0x1E0C99E38], "null"));
  return objc_msgSend(a3, "addObject:", objc_msgSend(MEMORY[0x1E0C99E38], "null"));
}

- (uint64_t)ab_hasCallback
{
  return 0;
}

- (uint64_t)ab_newQueryWithSortOrder:()ABPredicateQueryCreation ranked:addressBook:propertyIndices:
{
  return 0;
}

- (uint64_t)ab_metadataForMatchingRow:()ABPredicateQueryCreation columnOffset:
{
  return 0;
}

@end
