@implementation C3DGlyphGetTypeID

uint64_t __C3DGlyphGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DGlyphGetTypeID_typeID = result;
  return result;
}

@end
