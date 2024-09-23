@implementation NSObject(IntentsFoundation)

- (void)if_setValueIfNonNil:()IntentsFoundation forKey:
{
  if (a3)
    return (void *)objc_msgSend(a1, "setValue:forKey:");
  return a1;
}

- (void)if_setValueIfYES:()IntentsFoundation forKey:
{
  void *v5;
  id v6;
  id v7;

  if (a3)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    v6 = a4;
    objc_msgSend(v5, "numberWithBool:", 1);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forKey:", v7, v6);

  }
}

@end
