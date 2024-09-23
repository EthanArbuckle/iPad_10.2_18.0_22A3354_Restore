@implementation CGRegionGetTypeID

uint64_t __CGRegionGetTypeID_block_invoke()
{
  uint64_t result;

  __kCGRegionTypeID = _CFRuntimeRegisterClass();
  result = _CFRuntimeInitStaticInstance();
  qword_1ECDA5C88 = (uint64_t)&the_empty_shape;
  return result;
}

@end
