@implementation WFAsyncTransformedImageFromImage

void __WFAsyncTransformedImageFromImage_block_invoke(uint64_t a1)
{
  id v2;

  WFTransformedImageFromImage(*(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

@end
