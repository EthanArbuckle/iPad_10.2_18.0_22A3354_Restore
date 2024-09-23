@implementation MRMediaRemoteServiceResetOutputContext

void __MRMediaRemoteServiceResetOutputContext_block_invoke(uint64_t a1, void *a2)
{
  uint64_t Error;
  id v5;

  if (a2 == (void *)MEMORY[0x1E0C81258] || a2 == (void *)MEMORY[0x1E0C81260])
  {
    _MRServiceLogReplyError();
    Error = MRMediaRemoteCreateError(1);
  }
  else
  {
    Error = MRCreateClientErrorFromXPCMessage(a2);
  }
  v5 = (id)Error;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
