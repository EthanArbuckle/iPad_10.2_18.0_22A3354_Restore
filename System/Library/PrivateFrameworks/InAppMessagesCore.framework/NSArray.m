@implementation NSArray

void __30__NSArray_Utilities__iam_map___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
}

void __37__NSArray_Utilities__iam_compactMap___block_invoke(uint64_t a1)
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
