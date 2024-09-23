@implementation MRMediaRemoteSetPlaybackStateForPlayerWithTimestamp

void __MRMediaRemoteSetPlaybackStateForPlayerWithTimestamp_block_invoke_2()
{
  id v0;
  __CFString *v1;
  __CFString *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = (__CFString *)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
  v6[0] = v1;
  v2 = (__CFString *)MRMediaRemoteCopyLocalDeviceSystemPodcastApplicationDisplayID();
  v6[1] = v2;
  v6[2] = CFSTR("com.apple.SessionTrackerApp");
  v6[3] = CFSTR("com.apple.iBooks");
  v6[4] = CFSTR("com.apple.NanoBooks");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v0, "initWithArray:", v3, v6[0]);
  v5 = (void *)MRMediaRemoteSetPlaybackStateForPlayerWithTimestamp_allowList;
  MRMediaRemoteSetPlaybackStateForPlayerWithTimestamp_allowList = v4;

}

void __MRMediaRemoteSetPlaybackStateForPlayerWithTimestamp_block_invoke(uint64_t a1)
{
  __SecTask *v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *(_QWORD *)(a1 + 32);
  v1 = MRMediaRemoteCopyEntitlements((const __CFArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1));
  v2 = (void *)MRMediaRemoteSetPlaybackStateForPlayerWithTimestamp_entitlements;
  MRMediaRemoteSetPlaybackStateForPlayerWithTimestamp_entitlements = (uint64_t)v1;

}

void __MRMediaRemoteSetPlaybackStateForPlayerWithTimestamp_block_invoke_403(uint64_t a1)
{
  uint64_t v1;
  id Error;

  v1 = *(_QWORD *)(a1 + 32);
  Error = (id)MRMediaRemoteCreateError(3);
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, Error);

}

@end
