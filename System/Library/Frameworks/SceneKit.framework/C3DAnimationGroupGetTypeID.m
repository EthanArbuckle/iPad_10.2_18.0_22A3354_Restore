@implementation C3DAnimationGroupGetTypeID

double __C3DAnimationGroupGetTypeID_block_invoke()
{
  double result;

  C3DAnimationGroupGetTypeID_typeID = _CFRuntimeRegisterClass();
  result = *(double *)&kC3DC3DAnimationGroupContextClassSerializable;
  unk_1F03BF9A0 = kC3DC3DAnimationGroupContextClassSerializable;
  unk_1F03BF9B0 = *(_OWORD *)&off_1EA59C998;
  return result;
}

@end
