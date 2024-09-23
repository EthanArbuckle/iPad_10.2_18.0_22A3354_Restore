@implementation WFRemoveNull

void __WFRemoveNull_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  WFRemoveNull(a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  v8 = (id)v6;
  if (v6)
    objc_msgSend(v7, "setObject:forKey:", v6, v5);
  else
    objc_msgSend(v7, "removeObjectForKey:", v5);

}

void __WFRemoveNull_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  WFRemoveNull(v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v7 = (id)v4;
  if (v4)
  {
    v6 = objc_msgSend(v5, "indexOfObject:", v3);

    objc_msgSend(v5, "replaceObjectAtIndex:withObject:", v6, v7);
  }
  else
  {
    objc_msgSend(v5, "removeObjectIdenticalTo:", v3);

  }
}

@end
