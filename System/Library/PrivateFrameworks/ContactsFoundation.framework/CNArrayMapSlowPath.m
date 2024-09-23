@implementation CNArrayMapSlowPath

void __CNArrayMapSlowPath_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  CNNilToNull_block_invoke_2((uint64_t)&__block_literal_global_1_2, v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end
