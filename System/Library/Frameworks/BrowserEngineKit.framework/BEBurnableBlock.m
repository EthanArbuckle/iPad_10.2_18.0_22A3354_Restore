@implementation BEBurnableBlock

void __63___BEBurnableBlock_initWithTimeout_block_defaultInputProvider___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v4 = (id)v3;
  objc_msgSend(*(id *)(a1 + 32), "performWithInput:", v3);

}

@end
