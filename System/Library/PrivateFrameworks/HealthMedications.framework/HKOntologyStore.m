@implementation HKOntologyStore

- (void)_markShardRequiredWithIdentifier:(void *)a3 completion:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v9 = a2;
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = a3;
    v7 = a2;
    objc_msgSend(v5, "arrayWithObjects:count:", &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "markShardsWithIdentifiers:options:completion:", v8, 5, v6, v9, v10);
  }
}

@end
