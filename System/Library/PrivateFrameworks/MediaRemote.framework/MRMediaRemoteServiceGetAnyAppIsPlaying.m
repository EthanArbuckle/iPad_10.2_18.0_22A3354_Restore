@implementation MRMediaRemoteServiceGetAnyAppIsPlaying

void __MRMediaRemoteServiceGetAnyAppIsPlaying_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  _BOOL8 v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  v4 = v3 == (id)MEMORY[0x1E0C81258] || v3 == (id)MEMORY[0x1E0C81260];
  v7 = v3;
  if (v4)
  {
    _MRServiceLogReplyError();
    v5 = 0;
  }
  else
  {
    v5 = xpc_dictionary_get_BOOL(v3, "MRXPC_APP_IS_PLAYING_KEY");
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, _BOOL8))(v6 + 16))(v6, v5);
  kdebug_trace();

}

@end
