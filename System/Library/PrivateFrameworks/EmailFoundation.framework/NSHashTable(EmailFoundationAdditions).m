@implementation NSHashTable(EmailFoundationAdditions)

- (id)ef_uniquedObject:()EmailFoundationAdditions
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "member:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (id)objc_msgSend(v4, "copy");
    else
      v6 = v4;
    v5 = v6;
    objc_msgSend(a1, "addObject:", v6);
  }

  return v5;
}

@end
