@implementation C3DTextureSamplerBilinearNoAnisotropy

uint64_t __C3DTextureSamplerBilinearNoAnisotropy_block_invoke()
{
  uint64_t result;

  result = C3DTextureSamplerCreate();
  C3DTextureSamplerBilinearNoAnisotropy_states = result;
  *(_DWORD *)(result + 72) = 2;
  *(_DWORD *)(result + 64) = 1065353216;
  *(_QWORD *)(result + 80) = (2 * *(_DWORD *)(result + 16)) | (16 * *(_DWORD *)(result + 20)) | (*(_DWORD *)(result + 24) << 7) | (*(_DWORD *)(result + 28) << 10) | (*(_DWORD *)(result + 32) << 12) | (*(_DWORD *)(result + 36) << 14) | (*(unsigned __int8 *)(result + 68) << 16) | 0x10000001u;
  return result;
}

@end
