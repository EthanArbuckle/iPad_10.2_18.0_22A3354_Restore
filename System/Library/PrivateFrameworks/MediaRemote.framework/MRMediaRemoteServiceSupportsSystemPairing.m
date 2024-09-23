@implementation MRMediaRemoteServiceSupportsSystemPairing

intptr_t __MRMediaRemoteServiceSupportsSystemPairing_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  if (xdict == (xpc_object_t)MEMORY[0x1E0C81258] || xdict == (xpc_object_t)MEMORY[0x1E0C81260])
    _MRServiceLogReplyError();
  else
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "MRXPC_APP_INSTALLED_KEY");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
