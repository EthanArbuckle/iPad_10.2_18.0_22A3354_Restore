@implementation C3DAnimationManagerGetTypeID

double __C3DAnimationManagerGetTypeID_block_invoke()
{
  double result;

  C3DAnimationManagerGetTypeID_typeID = _CFRuntimeRegisterClass();
  result = *(double *)&kC3DC3DAnimationManagerContextClassSerializable;
  unk_1F03BFA88 = kC3DC3DAnimationManagerContextClassSerializable;
  unk_1F03BFA98 = *(_OWORD *)&off_1EA59C9B8;
  return result;
}

@end
