@implementation NSPredicate(RemoteQuery)

- (uint64_t)rq_restrictedToLocal
{
  return objc_msgSend(a1, "mg_evaluateConstraint:", &__block_literal_global_2);
}

- (uint64_t)rq_containsLocal
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BE64B90], "rq_predicateForLocal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "isEqual:", v2);

  return v3;
}

@end
