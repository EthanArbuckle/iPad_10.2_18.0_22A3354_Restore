@implementation FigPreferAudioSessionClock

BOOL __FigPreferAudioSessionClock_block_invoke(_BOOL8 result)
{
  if (!*(_BYTE *)(result + 32))
  {
    result = FigServer_IsServerProcess();
    if ((_DWORD)result)
      return FigServer_IsMediaserverd();
  }
  return result;
}

@end
