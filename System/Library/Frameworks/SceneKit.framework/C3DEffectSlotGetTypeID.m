@implementation C3DEffectSlotGetTypeID

double __C3DEffectSlotGetTypeID_block_invoke()
{
  double result;

  C3DEffectSlotGetTypeID_typeID = _CFRuntimeRegisterClass();
  result = *(double *)&kC3DC3DEffectSlotContextClassAnimatable;
  xmmword_1F03BFEB8 = kC3DC3DEffectSlotContextClassAnimatable;
  qword_1F03BFEC8 = (uint64_t)_C3DEffectSlotCopyInstanceVariables;
  return result;
}

@end
