@implementation MRMediaRemoteServiceGetRecentAVOutputDeviceUIDs

void __MRMediaRemoteServiceGetRecentAVOutputDeviceUIDs_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint8_t v10[16];

  v3 = a2;
  v4 = v3;
  if (v3 == (id)MEMORY[0x1E0C81258] || v3 == (id)MEMORY[0x1E0C81260])
  {
    _MRServiceLogReplyError();
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  v6 = MRCreatePropertyListFromXPCMessage(v3, "MRXPC_OUTPUT_DEVICE_UID_ARRAY_DATA_KEY");
  v7 = (void *)v6;
  if (!v6)
  {
    _MRLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_DEFAULT, "Didn't receive any pickable routes from the reply.", v10, 2u);
    }

    goto LABEL_11;
  }
LABEL_12:
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v7);
  kdebug_trace();

}

@end
