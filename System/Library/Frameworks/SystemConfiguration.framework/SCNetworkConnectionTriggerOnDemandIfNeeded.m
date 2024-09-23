@implementation SCNetworkConnectionTriggerOnDemandIfNeeded

void __SCNetworkConnectionTriggerOnDemandIfNeeded_block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;

  v3 = *(NSObject **)(a1 + 40);
  if (a2 == 1)
  {
    dispatch_retain(v3);
    if (__SCNetworkConnectionQueue_once != -1)
      dispatch_once(&__SCNetworkConnectionQueue_once, &__block_literal_global_91_0);
    ne_session_set_event_handler();
    ne_session_start_with_options();
  }
  else
  {
    dispatch_semaphore_signal(v3);
  }
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  xpc_release(*(xpc_object_t *)(a1 + 56));
}

void __SCNetworkConnectionTriggerOnDemandIfNeeded_block_invoke_2(uint64_t a1, int a2)
{
  if (a2 == 2)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    dispatch_release(*(dispatch_object_t *)(a1 + 40));
  }
  else if (a2 == 1)
  {
    dispatch_retain(*(dispatch_object_t *)(a1 + 40));
    if (__SCNetworkConnectionQueue_once != -1)
      dispatch_once(&__SCNetworkConnectionQueue_once, &__block_literal_global_91_0);
    ne_session_get_status();
  }
}

void __SCNetworkConnectionTriggerOnDemandIfNeeded_block_invoke_3(uint64_t a1, int a2)
{
  if (a2 != 2)
  {
    if (*(_DWORD *)(a1 + 56) == 3)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    ne_session_cancel();
  }
  dispatch_release(*(dispatch_object_t *)(a1 + 48));
}

@end
