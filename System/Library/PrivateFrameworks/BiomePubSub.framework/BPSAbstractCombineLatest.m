@implementation BPSAbstractCombineLatest

uint64_t __55___BPSAbstractCombineLatest_receiveCompletion_atIndex___block_invoke(uint64_t result, void *a2, uint64_t a3)
{
  if (*(_QWORD *)(result + 32) != a3)
    return objc_msgSend(a2, "cancel");
  return result;
}

@end
