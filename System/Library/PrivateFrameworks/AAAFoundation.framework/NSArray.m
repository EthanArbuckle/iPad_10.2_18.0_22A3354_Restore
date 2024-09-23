@implementation NSArray

uint64_t __53__NSArray_AAAFoundation__aaf_firstObjectPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __37__NSArray_AAAFoundation__aaf_filter___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

uint64_t __34__NSArray_AAAFoundation__aaf_map___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __43__NSArray_AAAFoundation__aaf_mapStoppable___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);
    v2 = v3;
  }

}

@end
