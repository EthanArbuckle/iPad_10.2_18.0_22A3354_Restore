@implementation SOSCloudCopyKVSState

intptr_t __SOSCloudCopyKVSState_block_invoke_2(uint64_t a1, uint64_t a2)
{
  const void *v3;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  v3 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v3)
    CFRetain(v3);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

dispatch_queue_t __SOSCloudCopyKVSState_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("KVSStateCapture", 0);
  SOSCloudCopyKVSState_processQueue = (uint64_t)result;
  return result;
}

@end
