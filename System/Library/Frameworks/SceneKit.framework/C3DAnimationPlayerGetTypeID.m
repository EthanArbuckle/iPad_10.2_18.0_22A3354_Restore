@implementation C3DAnimationPlayerGetTypeID

double __C3DAnimationPlayerGetTypeID_block_invoke()
{
  void *v0;
  const void *TypeID;
  double result;

  v0 = (void *)_CFRuntimeRegisterClass();
  C3DAnimationPlayerGetTypeID_typeID = (uint64_t)v0;
  TypeID = (const void *)C3DEntityGetTypeID();
  C3DModelPathResolverRegisterClassBegin(v0, TypeID);
  C3DModelPathResolverRegisterProperty(CFSTR("speed"), 0x54u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("blendFactor"), 0x50u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterClassEnd();
  result = *(double *)&kC3DC3DAnimationPlayerContextClassAnimatable;
  xmmword_1F03BFC00 = kC3DC3DAnimationPlayerContextClassAnimatable;
  return result;
}

@end
