@implementation HDDataEntityPredicateForSourceRevisionsSet

void __HDDataEntityPredicateForSourceRevisionsSet_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0D29838];
  v7 = *(_QWORD *)(a1 + 32);
  v8 = a2;
  objc_msgSend(v6, "predicateWithProperty:value:comparisonType:", a3, a4, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

}

@end
