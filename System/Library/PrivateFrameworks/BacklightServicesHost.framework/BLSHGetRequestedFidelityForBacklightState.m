@implementation BLSHGetRequestedFidelityForBacklightState

void __BLSHGetRequestedFidelityForBacklightState_block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  BSDispatchMain();

}

uint64_t __BLSHGetRequestedFidelityForBacklightState_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

@end
