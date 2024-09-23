@implementation NSSet(AXSSDatabaseManager)

- (id)ax_makeObjectsRespondToSelector:()AXSSDatabaseManager
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  uint64_t v14;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __62__NSSet_AXSSDatabaseManager__ax_makeObjectsRespondToSelector___block_invoke;
  v12 = &unk_1E5F99FB0;
  v13 = v5;
  v14 = a3;
  v6 = v5;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", &v9);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v6, v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
