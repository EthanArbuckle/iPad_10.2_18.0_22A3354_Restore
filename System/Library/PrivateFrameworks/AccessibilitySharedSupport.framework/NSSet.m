@implementation NSSet

void __62__NSSet_AXSSDatabaseManager__ax_makeObjectsRespondToSelector___block_invoke(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = objc_opt_respondsToSelector();
  v4 = v6;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v6, "performSelector:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

    v4 = v6;
  }

}

@end
