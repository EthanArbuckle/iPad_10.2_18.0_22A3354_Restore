@implementation SOSCloudTransportHasPendingKey

intptr_t __SOSCloudTransportHasPendingKey_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  BOOL v3;
  NSObject *v4;

  v3 = xpc_dictionary_get_BOOL(xdict, "value");
  v4 = *(NSObject **)(a1 + 40);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
  return dispatch_semaphore_signal(v4);
}

@end
