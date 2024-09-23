@implementation PreorderTraverseGroupsWithBlock

void ___PreorderTraverseGroupsWithBlock_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "keyPath");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  _PreorderTraverseGroupsWithBlock(v4, v5, *(_QWORD *)(a1 + 40));

}

@end
