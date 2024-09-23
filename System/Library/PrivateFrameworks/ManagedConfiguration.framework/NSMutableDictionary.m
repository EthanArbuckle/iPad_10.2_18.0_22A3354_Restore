@implementation NSMutableDictionary

void __67__NSMutableDictionary_MCUtilities__MCFilterRestrictionPayloadKeys___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "intersectSet:", v6);
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v9);

  }
}

@end
