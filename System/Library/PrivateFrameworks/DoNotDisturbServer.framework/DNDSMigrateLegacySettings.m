@implementation DNDSMigrateLegacySettings

uint64_t __DNDSMigrateLegacySettings_block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v3 = a2;
  if (a1[6] == 1)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D1D6F8]);
    objc_msgSend(v4, "setIdentifier:", CFSTR("legacy-toggle"));
    objc_msgSend(MEMORY[0x1E0D1D630], "lifetimeUntilEndOfScheduleWithIdentifier:", *MEMORY[0x1E0D1D3C8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLifetime:", v5);

    objc_msgSend(v4, "setReason:", 1);
    v6 = (id)objc_msgSend(v3, "takeAssertionWithDetails:source:startDate:", v4, a1[4], a1[5]);
  }
  else
  {
    +[DNDSModeAssertionInvalidationPredicate predicateForAnyAssertion](DNDSModeAssertionInvalidationPredicate, "predicateForAnyAssertion");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    +[DNDSModeAssertionInvalidationRequest requestWithPredicate:requestDate:source:reason:](DNDSModeAssertionInvalidationRequest, "requestWithPredicate:requestDate:source:reason:", v4, a1[5], a1[4], 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v3, "invalidateAssertionsForRequest:", v7);

  }
  return 1;
}

@end
