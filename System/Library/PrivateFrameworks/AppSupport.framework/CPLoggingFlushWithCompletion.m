@implementation CPLoggingFlushWithCompletion

uint64_t __CPLoggingFlushWithCompletion_block_invoke(uint64_t a1)
{
  _BOOL8 v2;
  uint64_t result;

  v2 = CPLoggingFlush(*(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _BOOL8))(result + 16))(result, v2);
  return result;
}

@end
