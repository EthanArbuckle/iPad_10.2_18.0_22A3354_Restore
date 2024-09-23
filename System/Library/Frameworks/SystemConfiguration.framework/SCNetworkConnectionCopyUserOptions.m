@implementation SCNetworkConnectionCopyUserOptions

intptr_t __SCNetworkConnectionCopyUserOptions_block_invoke(uint64_t a1, xpc_object_t object)
{
  if (object)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_retain(object);
  ne_session_release();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

@end
