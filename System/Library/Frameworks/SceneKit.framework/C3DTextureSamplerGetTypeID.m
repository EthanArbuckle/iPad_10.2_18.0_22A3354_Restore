@implementation C3DTextureSamplerGetTypeID

double __C3DTextureSamplerGetTypeID_block_invoke()
{
  double result;

  C3DTextureSamplerGetTypeID_typeID = _CFRuntimeRegisterClass();
  result = *(double *)&kC3DC3DTextureSamplerContextClassSerializable;
  unk_1F03C1958 = kC3DC3DTextureSamplerContextClassSerializable;
  unk_1F03C1968 = *(_OWORD *)&off_1EA59D088;
  qword_1F03C1910 = (uint64_t)_C3DTextureSamplerCopyInstanceVariables;
  return result;
}

@end
