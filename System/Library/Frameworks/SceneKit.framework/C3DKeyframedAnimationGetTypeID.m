@implementation C3DKeyframedAnimationGetTypeID

double __C3DKeyframedAnimationGetTypeID_block_invoke()
{
  double result;

  C3DKeyframedAnimationGetTypeID_typeID = _CFRuntimeRegisterClass();
  result = *(double *)&kC3DC3DKeyframedAnimationContextClassSerializable;
  unk_1F03C0820 = kC3DC3DKeyframedAnimationContextClassSerializable;
  unk_1F03C0830 = *(_OWORD *)&off_1EA59CBF0;
  return result;
}

@end
