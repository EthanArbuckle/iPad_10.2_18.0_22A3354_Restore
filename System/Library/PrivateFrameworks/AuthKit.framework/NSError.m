@implementation NSError

void __74__NSError_AuthKit__errorDescriptionIncludingUnderlyingErrorsWithMaxDepth___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a2;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "code");

  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%ld"), v5, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
}

@end
