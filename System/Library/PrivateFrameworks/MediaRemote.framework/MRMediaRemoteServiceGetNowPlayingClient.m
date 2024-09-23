@implementation MRMediaRemoteServiceGetNowPlayingClient

void __MRMediaRemoteServiceGetNowPlayingClient_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  void *Error;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = a2;
  v4 = v3 == (id)MEMORY[0x1E0C81258] || v3 == (id)MEMORY[0x1E0C81260];
  v8 = v3;
  if (v4)
  {
    _MRServiceLogReplyError();
    Error = (void *)MRMediaRemoteCreateError(1);
    v6 = 0;
  }
  else
  {
    Error = (void *)MRCreateClientErrorFromXPCMessage(v3);
    MRCreateClientFromXPCMessage(v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v6, Error);
  kdebug_trace();

}

@end
