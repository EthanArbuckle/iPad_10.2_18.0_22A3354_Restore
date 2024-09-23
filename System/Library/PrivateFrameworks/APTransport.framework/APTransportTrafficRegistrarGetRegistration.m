@implementation APTransportTrafficRegistrarGetRegistration

_QWORD *__APTransportTrafficRegistrarGetRegistration_block_invoke(_QWORD *result)
{
  BOOL *v1;
  BOOL *v2;

  v1 = (BOOL *)result[4];
  if (v1)
    *v1 = *(_DWORD *)(result[5] + 40) != 0;
  v2 = (BOOL *)result[6];
  if (v2)
    *v2 = *(_DWORD *)(result[5] + 44) != 0;
  return result;
}

@end
