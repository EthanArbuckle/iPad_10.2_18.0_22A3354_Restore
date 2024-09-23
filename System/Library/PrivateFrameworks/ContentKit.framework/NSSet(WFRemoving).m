@implementation NSSet(WFRemoving)

- (id)setByRemovingObject:()WFRemoving
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDBCEF0];
  v5 = a3;
  objc_msgSend(v4, "setWithSet:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v5);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
