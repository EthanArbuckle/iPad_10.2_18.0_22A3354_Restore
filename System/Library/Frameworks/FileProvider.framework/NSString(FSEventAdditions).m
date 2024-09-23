@implementation NSString(FSEventAdditions)

+ (__CFString)fpfs_initWithFSEventsFlags:()FSEventAdditions
{
  id v4;
  uint64_t i;
  void *v6;
  __CFString *v7;

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = 0; i != 92; i += 4)
  {
    if ((mapping[i] & a3) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *(_QWORD *)&mapping[i + 2]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v6);

    }
  }
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("none");
  }

  return v7;
}

@end
