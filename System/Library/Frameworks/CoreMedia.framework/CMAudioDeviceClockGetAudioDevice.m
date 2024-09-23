@implementation CMAudioDeviceClockGetAudioDevice

_QWORD *__CMAudioDeviceClockGetAudioDevice_block_invoke(_QWORD *result)
{
  _QWORD *v1;
  _DWORD *v2;
  _BYTE *v3;

  v1 = (_QWORD *)result[4];
  if (v1)
    *v1 = *(_QWORD *)(result[5] + 80);
  v2 = (_DWORD *)result[6];
  if (v2)
    *v2 = *(_DWORD *)(result[5] + 88);
  v3 = (_BYTE *)result[7];
  if (v3)
    *v3 = *(_BYTE *)(result[5] + 72);
  return result;
}

@end
