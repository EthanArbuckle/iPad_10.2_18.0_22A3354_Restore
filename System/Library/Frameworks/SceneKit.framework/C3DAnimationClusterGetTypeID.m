@implementation C3DAnimationClusterGetTypeID

double __C3DAnimationClusterGetTypeID_block_invoke()
{
  double result;

  C3DAnimationClusterGetTypeID_typeID = _CFRuntimeRegisterClass();
  result = *(double *)&kC3DC3DAnimationClusterContextClassSerializable;
  unk_1F03BF7D0 = kC3DC3DAnimationClusterContextClassSerializable;
  unk_1F03BF7E0 = *(_OWORD *)&off_1EA59C968;
  return result;
}

@end
