@implementation HDConceptIndexEntityPredicateForConceptIdentifier

id __HDConceptIndexEntityPredicateForConceptIdentifier_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0D29840];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("key_path"), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "compoundPredicateWithPredicate:otherPredicate:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
