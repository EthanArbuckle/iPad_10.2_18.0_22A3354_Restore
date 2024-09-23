@implementation MPCCreateDelegateAccountPlaybackRequestEnvironment

void ____MPCCreateDelegateAccountPlaybackRequestEnvironment_block_invoke_184(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t ____MPCCreateDelegateAccountPlaybackRequestEnvironment_block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t result;

  if (a3)
    return objc_msgSend(a2, "setDelegated:", 1);
  return result;
}

@end
