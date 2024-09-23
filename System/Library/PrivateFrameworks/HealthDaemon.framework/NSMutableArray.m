@implementation NSMutableArray

- (void)incrementReference
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (a1)
  {
    objc_msgSend(a1, "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v2;
    if (v2)
    {
      v3 = objc_msgSend(v2, "unsignedIntegerValue");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3 + 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "replaceObjectAtIndex:withObject:", 0, v4);

    }
    else
    {
      objc_msgSend(a1, "addObject:", &unk_1E6DFAF28);
    }

  }
}

- (uint64_t)currentReferenceCount
{
  void *v1;
  void *v2;
  uint64_t v3;

  if (!a1)
    return 0;
  objc_msgSend(a1, "firstObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "unsignedIntegerValue");
  else
    v3 = 0;

  return v3;
}

@end
