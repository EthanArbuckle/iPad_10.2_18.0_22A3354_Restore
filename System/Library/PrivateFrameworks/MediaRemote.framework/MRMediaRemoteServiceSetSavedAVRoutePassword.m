@implementation MRMediaRemoteServiceSetSavedAVRoutePassword

uint64_t __MRMediaRemoteServiceSetSavedAVRoutePassword_block_invoke(uint64_t a1, void *a2)
{
  if (a2 == (void *)MEMORY[0x1E0C81258] || a2 == (void *)MEMORY[0x1E0C81260])
    _MRServiceLogReplyError();
  else
    _MRServiceGenericErrorCodeFromReply(a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return kdebug_trace();
}

@end
