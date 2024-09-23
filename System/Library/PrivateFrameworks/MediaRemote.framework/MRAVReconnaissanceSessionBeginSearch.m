@implementation MRAVReconnaissanceSessionBeginSearch

void __MRAVReconnaissanceSessionBeginSearch_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t);
  id v9;

  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16);
  v9 = *(id *)(a1 + 32);
  v8(v7, a2, a3, a4);

}

@end
