@implementation NSMutableSet(AXExtras)

- (void)ax_replaceWithMatchingObject:()AXExtras updatingWithBlock:
{
  void (**v6)(id, id, void *);
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  objc_msgSend(a1, "member:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v6)
      v6[2](v6, v8, v7);
    objc_msgSend(a1, "removeObject:", v7);
    objc_msgSend(a1, "addObject:", v8);
  }

}

@end
