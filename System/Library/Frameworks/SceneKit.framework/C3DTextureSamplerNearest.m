@implementation C3DTextureSamplerNearest

double __C3DTextureSamplerNearest_block_invoke()
{
  uint64_t v0;
  double result;

  v0 = C3DTextureSamplerCreate();
  C3DTextureSamplerNearest_states = v0;
  *(_QWORD *)&result = 0x100000001;
  *(_QWORD *)(v0 + 28) = 0x100000001;
  *(_DWORD *)(v0 + 36) = 0;
  *(_DWORD *)(v0 + 72) = 2;
  *(_DWORD *)(v0 + 64) = 1065353216;
  *(_QWORD *)(v0 + 80) = (2 * *(_DWORD *)(v0 + 16)) | (16 * *(_DWORD *)(v0 + 20)) | (*(_DWORD *)(v0 + 24) << 7) | (*(unsigned __int8 *)(v0 + 68) << 16) | 0x10001401u;
  return result;
}

@end
