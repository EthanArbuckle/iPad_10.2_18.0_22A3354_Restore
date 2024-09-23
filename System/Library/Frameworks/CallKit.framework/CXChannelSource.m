@implementation CXChannelSource

- (void)handleAudioSessionActivationStateChangedTo:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  CXChannelSource *v9;

  v4 = a3;
  -[CXAbstractProviderSource queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__CXChannelSource_handleAudioSessionActivationStateChangedTo___block_invoke;
  v7[3] = &unk_1E4B88A20;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __62__CXChannelSource_handleAudioSessionActivationStateChangedTo___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "BOOLValue");
    v5 = 136315394;
    v6 = "-[CXChannelSource handleAudioSessionActivationStateChangedTo:]_block_invoke";
    v7 = 1024;
    v8 = v3;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Sending %s %d", (uint8_t *)&v5, 0x12u);
  }

  objc_msgSend(*(id *)(a1 + 40), "vendorProtocolDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleAudioSessionActivationStateChangedTo:", *(_QWORD *)(a1 + 32));

}

@end
