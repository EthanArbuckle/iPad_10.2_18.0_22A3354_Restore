@implementation MRMediaRemoteServiceGetAudioFormatContentInfoForOrigin

MRNowPlayingAudioFormatContentInfo *__MRMediaRemoteServiceGetAudioFormatContentInfoForOrigin_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  MRNowPlayingAudioFormatContentInfo *v3;

  v2 = a2;
  v3 = -[MRNowPlayingAudioFormatContentInfo initWithData:]([MRNowPlayingAudioFormatContentInfo alloc], "initWithData:", v2);

  return v3;
}

void __MRMediaRemoteServiceGetAudioFormatContentInfoForOrigin_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *Error;
  void *v7;
  UInt8 *v8;
  UInt8 *v9;
  NSObject *v10;
  uint64_t v11;
  uint8_t v12[16];

  v3 = a2;
  v4 = v3;
  if (v3 == (id)MEMORY[0x1E0C81258] || v3 == (id)MEMORY[0x1E0C81260])
  {
    _MRServiceLogReplyError();
    Error = (void *)MRMediaRemoteCreateError(1);
    v7 = 0;
  }
  else
  {
    v8 = (UInt8 *)MRCreateDataFromXPCMessage(v3, "MRXPC_AUDIO_FORMAT_CONTENT_INFO");
    v9 = v8;
    if (v8)
    {
      MRCreateArrayFromData(v8, &__block_literal_global_173);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _MRLogForCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_193827000, v10, OS_LOG_TYPE_DEFAULT, "Didn't receive the audio format content info from the reply.", v12, 2u);
      }

      v7 = 0;
    }
    Error = (void *)MRCreateClientErrorFromXPCMessage(v4);

  }
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(uint64_t, void *, void *))(v11 + 16))(v11, v7, Error);
  kdebug_trace();

}

@end
