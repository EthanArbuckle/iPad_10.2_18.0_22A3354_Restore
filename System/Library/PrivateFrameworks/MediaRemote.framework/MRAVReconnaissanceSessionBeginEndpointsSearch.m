@implementation MRAVReconnaissanceSessionBeginEndpointsSearch

void __MRAVReconnaissanceSessionBeginEndpointsSearch_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t, uint64_t);
  id v10;

  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16);
  v10 = *(id *)(a1 + 32);
  v9(v8, a2, a3, a5);

}

@end
