@implementation CNArrayConcurrentMapSlowPath

void __CNArrayConcurrentMapSlowPath_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  CNNilToNull_block_invoke_2((uint64_t)&__block_literal_global_1_2, v8);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(v6 + 8 * a3);
  *(_QWORD *)(v6 + 8 * a3) = v5;

}

@end
