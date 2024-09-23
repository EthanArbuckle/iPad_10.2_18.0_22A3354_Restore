@implementation OneTimeInitialization

uint64_t __remoteDeviceClock_OneTimeInitialization_block_invoke()
{
  const char *v0;
  uint64_t result;
  _OWORD v2[4];

  v2[0] = xmmword_1E28DD040;
  memset(&v2[1], 0, 48);
  FigRemote_ShouldConnectToMediaparserdForFileParsing();
  if (FigRemote_ShouldConnectToMediaplaybackd())
    v0 = "com.apple.coremedia.mediaplaybackd.audiodeviceclock.xpc";
  else
    v0 = "com.apple.coremedia.audiodeviceclock.xpc";
  result = FigXPCRemoteClientCreate((uint64_t)v0, (uint64_t)v2, 0, &gAudioDeviceClockRemoteClient);
  remoteDeviceClock_OneTimeInitialization_err = result;
  return result;
}

@end
