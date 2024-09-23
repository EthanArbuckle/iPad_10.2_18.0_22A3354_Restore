@implementation C3DReverseZIsSupported

BOOL __C3DReverseZIsSupported_block_invoke()
{
  int v0;
  BOOL v1;
  char v2;
  _BOOL8 result;
  char v4;

  v0 = C3DWasLinkedBeforeMajorOSYear2019() ^ 1;
  if (!C3DReverseZIsSupported_useReverseZ)
    LOBYTE(v0) = 0;
  C3DReverseZIsSupported_useReverseZ = v0;
  if (C3DMetalIsSupported_onceToken != -1)
    dispatch_once(&C3DMetalIsSupported_onceToken, &__block_literal_global_50);
  if (C3DMetalIsSupported_supported)
    v1 = C3DReverseZIsSupported_useReverseZ == 0;
  else
    v1 = 1;
  v2 = !v1;
  C3DReverseZIsSupported_useReverseZ = v2;
  result = C3DPreferencesGetBool(19);
  v4 = !result;
  if (!C3DReverseZIsSupported_useReverseZ)
    v4 = 0;
  C3DReverseZIsSupported_useReverseZ = v4;
  return result;
}

@end
