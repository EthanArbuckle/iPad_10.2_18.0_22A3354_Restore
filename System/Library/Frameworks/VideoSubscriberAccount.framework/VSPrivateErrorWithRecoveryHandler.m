@implementation VSPrivateErrorWithRecoveryHandler

uint64_t __VSPrivateErrorWithRecoveryHandler_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 1;
}

@end
