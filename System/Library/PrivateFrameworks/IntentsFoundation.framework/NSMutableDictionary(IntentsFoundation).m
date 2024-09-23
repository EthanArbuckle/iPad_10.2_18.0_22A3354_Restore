@implementation NSMutableDictionary(IntentsFoundation)

- (void)if_setObjectIfNonNil:()IntentsFoundation forKey:
{
  if (a3)
    return (void *)objc_msgSend(a1, "setObject:forKey:");
  return a1;
}

- (void)if_setBoolIfYES:()IntentsFoundation forKey:
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
    objc_msgSend(a1, "setObject:forKey:", v7, v6);

  }
}

- (id)if_popObjectForKey:()IntentsFoundation
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(a1, "removeObjectForKey:", v4);

  return v5;
}

@end
