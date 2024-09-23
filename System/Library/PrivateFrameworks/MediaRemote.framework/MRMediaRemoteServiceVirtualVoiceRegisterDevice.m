@implementation MRMediaRemoteServiceVirtualVoiceRegisterDevice

void __MRMediaRemoteServiceVirtualVoiceRegisterDevice_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t uint64;
  uint64_t v9;
  uint64_t v10;
  void *Error;
  id v12;

  v3 = a2;
  v4 = v3 == (id)MEMORY[0x1E0C81258] || v3 == (id)MEMORY[0x1E0C81260];
  v12 = v3;
  if (v4)
  {
    _MRServiceLogReplyError();
    v6 = *(_QWORD *)(a1 + 32);
    v5 = (uint64_t *)(a1 + 32);
    if (v6)
    {
      uint64 = 0;
      v7 = 1;
      goto LABEL_10;
    }
  }
  else
  {
    uint64 = xpc_dictionary_get_uint64(v3, "MRXPC_VOICE_INPUT_DEVICE_ID_KEY");
    v7 = MRErrorFromXPCMessage(v12);
    v10 = *(_QWORD *)(a1 + 32);
    v5 = (uint64_t *)(a1 + 32);
    v9 = v10;
    if (v10)
    {
      if (!v7)
      {
        Error = 0;
        goto LABEL_12;
      }
LABEL_10:
      Error = (void *)MRMediaRemoteCreateError(v7);
      v9 = *v5;
LABEL_12:
      (*(void (**)(uint64_t, uint64_t, void *))(v9 + 16))(v9, uint64, Error);

    }
  }
  kdebug_trace();

}

@end
