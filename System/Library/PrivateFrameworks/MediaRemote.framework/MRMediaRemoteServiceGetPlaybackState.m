@implementation MRMediaRemoteServiceGetPlaybackState

void __MRMediaRemoteServiceGetPlaybackState_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  uint64_t uint64;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = a2;
  v4 = v3 == (id)MEMORY[0x1E0C81258] || v3 == (id)MEMORY[0x1E0C81260];
  v8 = v3;
  if (v4)
  {
    _MRServiceLogReplyError();
    uint64 = 0;
    v6 = 0;
  }
  else
  {
    uint64 = xpc_dictionary_get_uint64(v3, "MRXPC_PLAYBACK_STATE_KEY");
    v6 = (void *)MRCreateClientErrorFromXPCMessage(v8);
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, void *))(v7 + 16))(v7, uint64, v6);
  kdebug_trace();

}

@end
