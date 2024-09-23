@implementation C3DAnimationNodeGetTypeID

double __C3DAnimationNodeGetTypeID_block_invoke()
{
  double result;

  C3DAnimationNodeGetTypeID_typeID = _CFRuntimeRegisterClass();
  unk_1F03BFB70 = kC3DC3DAnimationNodeContextClassSerializable;
  unk_1F03BFB80 = *(_OWORD *)&off_1EA59C9E8;
  result = *(double *)&kC3DC3DAnimationNodeContextClassAnimatable;
  xmmword_1F03BFB18 = kC3DC3DAnimationNodeContextClassAnimatable;
  return result;
}

@end
