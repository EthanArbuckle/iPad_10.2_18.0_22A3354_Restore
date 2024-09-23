@implementation DNDModeAssertion

uint64_t __76__DNDModeAssertion_Predicates__predicateForModeAssertionsWithLifetimeClass___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "details");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lifetime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_class();
  if (!v5)
    v5 = (void *)objc_opt_class();

  return objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));
}

@end
