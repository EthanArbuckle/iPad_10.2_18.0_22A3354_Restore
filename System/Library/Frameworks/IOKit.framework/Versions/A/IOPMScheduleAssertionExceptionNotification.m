@implementation IOPMScheduleAssertionExceptionNotification

uint64_t __IOPMScheduleAssertionExceptionNotification_block_invoke(uint64_t a1, int token)
{
  uint64_t result;
  uint64_t state64;

  state64 = 0;
  result = notify_get_state(token, &state64);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return result;
}

@end
