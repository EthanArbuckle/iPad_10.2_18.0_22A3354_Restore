@implementation C3DImageGetTypeID

double __C3DImageGetTypeID_block_invoke()
{
  double result;

  C3DImageGetTypeID_typeID = _CFRuntimeRegisterClass();
  result = *(double *)&kC3DC3DImageContextClassSerializable;
  unk_1F03C0568 = kC3DC3DImageContextClassSerializable;
  unk_1F03C0578 = *(_OWORD *)&off_1EA59CBA0;
  qword_1F03C0520 = (uint64_t)_C3DImageCopyInstanceVariables;
  return result;
}

@end
