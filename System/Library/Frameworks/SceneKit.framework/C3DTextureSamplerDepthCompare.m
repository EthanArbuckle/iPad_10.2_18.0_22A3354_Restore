@implementation C3DTextureSamplerDepthCompare

double __C3DTextureSamplerDepthCompare_block_invoke()
{
  uint64_t v0;
  double result;

  v0 = C3DTextureSamplerCreate();
  C3DTextureSamplerDepthCompare_states = v0;
  *(_QWORD *)(v0 + 32) = 2;
  *(_QWORD *)&result = 0x100000001;
  *(_OWORD *)(v0 + 16) = xmmword_1DD0092F0;
  *(_BYTE *)(v0 + 68) = 7;
  *(_DWORD *)(v0 + 72) = 2;
  *(_DWORD *)(v0 + 64) = 1065353216;
  *(_QWORD *)(v0 + 80) = 268904595;
  return result;
}

@end
