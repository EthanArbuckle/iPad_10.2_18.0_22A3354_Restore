@implementation MRMediaRemoteServiceGetExternalScreenType

uint64_t __MRMediaRemoteServiceGetExternalScreenType_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  if (xdict == (xpc_object_t)MEMORY[0x1E0C81258] || xdict == (xpc_object_t)MEMORY[0x1E0C81260])
    _MRServiceLogReplyError();
  else
    xpc_dictionary_get_uint64(xdict, "MRXPC_ROUTE_EXTERNAL_SCREEN_TYPE_KEY");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return kdebug_trace();
}

@end
