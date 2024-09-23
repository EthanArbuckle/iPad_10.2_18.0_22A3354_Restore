@implementation MRMediaRemoteServiceRequestAudioAmplitudeSamples

void __MRMediaRemoteServiceRequestAudioAmplitudeSamples_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  void *Error;
  void *v6;
  const UInt8 *v7;
  UInt8 *v8;
  id v9;

  v3 = a2;
  v4 = v3 == (id)MEMORY[0x1E0C81258] || v3 == (id)MEMORY[0x1E0C81260];
  v9 = v3;
  if (v4)
  {
    _MRServiceLogReplyError();
    Error = (void *)MRMediaRemoteCreateError(1);
    v6 = 0;
  }
  else
  {
    v7 = MRCreateDataFromXPCMessage(v3, "MRXPC_AUDIO_AMPLITUDE_ARRAY_DATA_KEY");
    v8 = (UInt8 *)v7;
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v7, 0, 0, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    Error = (void *)MRCreateClientErrorFromXPCMessage(v9);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  kdebug_trace();

}

@end
