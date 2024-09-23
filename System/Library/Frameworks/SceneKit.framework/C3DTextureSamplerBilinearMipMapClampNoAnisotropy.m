@implementation C3DTextureSamplerBilinearMipMapClampNoAnisotropy

double __C3DTextureSamplerBilinearMipMapClampNoAnisotropy_block_invoke()
{
  uint64_t v0;
  double result;

  v0 = C3DTextureSamplerCreate();
  C3DTextureSamplerBilinearMipMapClampNoAnisotropy_states = v0;
  *(_QWORD *)(v0 + 32) = 0x100000002;
  *(_QWORD *)&result = 0x100000001;
  *(_OWORD *)(v0 + 16) = xmmword_1DD0092F0;
  *(_DWORD *)(v0 + 72) = 2;
  *(_DWORD *)(v0 + 64) = 1065353216;
  *(_QWORD *)(v0 + 80) = ((unint64_t)*(unsigned __int8 *)(v0 + 68) << 16) | 0x10006893;
  return result;
}

@end
