@implementation NSMutableArray(GC)

- (void)gc_transformElementsWithOptions:()GC usingBlock:
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL v12;

  v7 = objc_msgSend(a1, "count");
  v8 = 0;
  if (v7)
  {
    v9 = 0;
    v10 = a3 & 1;
    do
    {
      (*(void (**)(uint64_t, id))(a4 + 16))(a4, (id)objc_msgSend(a1, "objectAtIndexedSubscript:", v9));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        v12 = 1;
      else
        v12 = v10 == 0;
      if (v12)
        objc_msgSend(a1, "replaceObjectAtIndex:withObject:", v8++, v11);

      ++v9;
    }
    while (v7 != v9);
  }
  if (v7 != v8)
    objc_msgSend(a1, "removeObjectsInRange:", v8, v7 - v8);
}

- (uint64_t)gc_transformElementsUsingBlock:()GC
{
  return objc_msgSend(a1, "gc_transformElementsWithOptions:usingBlock:", 0, a3);
}

@end
