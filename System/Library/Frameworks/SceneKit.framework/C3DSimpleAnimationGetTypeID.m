@implementation C3DSimpleAnimationGetTypeID

double __C3DSimpleAnimationGetTypeID_block_invoke()
{
  double result;

  C3DSimpleAnimationGetTypeID_typeID = _CFRuntimeRegisterClass();
  result = *(double *)&kC3DC3DSimpleAnimationContextClassSerializable;
  unk_1F03C14D0 = kC3DC3DSimpleAnimationContextClassSerializable;
  unk_1F03C14E0 = *(_OWORD *)&off_1EA59CF50;
  return result;
}

@end
