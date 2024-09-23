@implementation NSArray(NSArrayPathExtensions)

- (void)pathsMatchingExtensions:()NSArrayPathExtensions
{
  uint64_t v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;

  v5 = objc_msgSend(a1, "count");
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (v5 >= 1)
  {
    for (i = 0; i != v5; ++i)
    {
      v8 = (void *)objc_msgSend(a1, "objectAtIndex:", i);
      v9 = (void *)objc_msgSend(v8, "pathExtension");
      if ((objc_msgSend(v9, "isEqual:", &stru_1E0F56070) & 1) == 0
        && objc_msgSend(a3, "containsObject:", v9))
      {
        objc_msgSend(v6, "addObject:", v8);
      }
    }
  }
  return v6;
}

- (void)stringsByAppendingPathComponent:()NSArrayPathExtensions
{
  uint64_t v5;
  void *v6;
  uint64_t i;

  v5 = objc_msgSend(a1, "count");
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (v5 >= 1)
  {
    for (i = 0; i != v5; ++i)
      objc_msgSend(v6, "addObject:", objc_msgSend((id)objc_msgSend(a1, "objectAtIndex:", i), "stringByAppendingPathComponent:", a3));
  }
  return v6;
}

@end
