@implementation C3DEffectCommonProfileGetTypeID

double __C3DEffectCommonProfileGetTypeID_block_invoke()
{
  double result;

  C3DEffectCommonProfileGetTypeID_typeID = _CFRuntimeRegisterClass();
  unk_1F03BFE28 = kC3DC3DEffectCommonProfileContextClassSerializable;
  unk_1F03BFE38 = *(_OWORD *)&off_1EA59CA58;
  qword_1F03BFDE0 = (uint64_t)_C3DEffectCommonProfileCopyInstanceVariables;
  result = *(double *)&kC3DC3DEffectCommonProfileContextClassAnimatable;
  xmmword_1F03BFDD0 = kC3DC3DEffectCommonProfileContextClassAnimatable;
  return result;
}

@end
