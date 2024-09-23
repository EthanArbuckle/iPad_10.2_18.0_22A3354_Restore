@implementation C3DTimingFunctionGetTypeID

double __C3DTimingFunctionGetTypeID_block_invoke()
{
  double result;

  C3DTimingFunctionGetTypeID_typeID = _CFRuntimeRegisterClass();
  result = *(double *)&kC3DC3DTimingFunctionContextClassSerializable;
  unk_1F03C1A40 = kC3DC3DTimingFunctionContextClassSerializable;
  unk_1F03C1A50 = *(_OWORD *)off_1EA59D0A8;
  return result;
}

@end
