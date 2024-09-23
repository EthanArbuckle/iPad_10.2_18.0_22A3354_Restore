@implementation GEOSimpleTileRequesterOperation

void __41___GEOSimpleTileRequesterOperation_start__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "operationFailed:error:", *(_QWORD *)(a1 + 32), 0);

}

@end
