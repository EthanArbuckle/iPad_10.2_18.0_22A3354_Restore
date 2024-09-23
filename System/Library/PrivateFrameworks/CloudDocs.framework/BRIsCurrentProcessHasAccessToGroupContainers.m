@implementation BRIsCurrentProcessHasAccessToGroupContainers

uint64_t __BRIsCurrentProcessHasAccessToGroupContainers_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 40));
  else
    v4 = 0;

  return v4;
}

@end
