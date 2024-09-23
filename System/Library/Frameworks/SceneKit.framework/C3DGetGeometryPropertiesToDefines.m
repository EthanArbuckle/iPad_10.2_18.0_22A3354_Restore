@implementation C3DGetGeometryPropertiesToDefines

CFDictionaryRef __C3DGetGeometryPropertiesToDefines_block_invoke()
{
  CFDictionaryRef result;
  _OWORD v1[3];
  const __CFString *v2;
  void *keys[2];
  __int128 v4;
  __int128 v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)keys = xmmword_1EA5A48C8;
  v4 = *(_OWORD *)&off_1EA5A48D8;
  v6 = CFSTR("_geometry.clipDistance3");
  v5 = xmmword_1EA5A48E8;
  v1[0] = xmmword_1EA5A4900;
  v1[1] = *(_OWORD *)&off_1EA5A4910;
  v1[2] = xmmword_1EA5A4920;
  v2 = CFSTR("USE_CLIP_DISTANCE3");
  result = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)keys, (const void **)v1, 7, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  C3DGetGeometryPropertiesToDefines_s_dic = (uint64_t)result;
  return result;
}

@end
