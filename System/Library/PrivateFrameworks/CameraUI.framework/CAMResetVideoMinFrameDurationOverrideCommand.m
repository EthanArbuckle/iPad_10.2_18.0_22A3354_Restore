@implementation CAMResetVideoMinFrameDurationOverrideCommand

- (void)executeWithContext:(id)a3
{
  void *v3;
  __int128 v4;
  uint64_t v5;

  objc_msgSend(a3, "currentVideoDeviceInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CA2E18];
  v5 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  objc_msgSend(v3, "setVideoMinFrameDurationOverride:", &v4);

}

@end
