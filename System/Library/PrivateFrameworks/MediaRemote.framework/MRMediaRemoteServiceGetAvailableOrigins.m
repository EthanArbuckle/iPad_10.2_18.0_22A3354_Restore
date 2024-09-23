@implementation MRMediaRemoteServiceGetAvailableOrigins

void __MRMediaRemoteServiceGetAvailableOrigins_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;

  if (a2 == (void *)MEMORY[0x1E0C81258] || a2 == (void *)MEMORY[0x1E0C81260])
  {
    _MRServiceLogReplyError();
    v4 = 0;
  }
  else
  {
    v4 = MRCreateOriginArrayFromXPCMessage(a2);
  }
  v5 = (id)v4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  kdebug_trace();

}

@end
