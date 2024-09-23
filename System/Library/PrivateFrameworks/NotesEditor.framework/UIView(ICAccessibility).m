@implementation UIView(ICAccessibility)

- (id)icaxRecursiveSubviewsPassingTest:()ICAccessibility
{
  unsigned int (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "subviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);
  while (1)
  {

    if (!objc_msgSend(v6, "count"))
      break;
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectAtIndex:", 0);
    if (v4[2](v4, v7))
      objc_msgSend(v5, "addObject:", v7);
    objc_msgSend(v7, "subviews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v8);

  }
  v9 = (void *)objc_msgSend(v5, "copy");

  return v9;
}

@end
