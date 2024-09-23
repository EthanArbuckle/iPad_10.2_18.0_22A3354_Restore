@implementation CGFontGetTypeID

uint64_t __CGFontGetTypeID_block_invoke_2()
{
  uint64_t result;

  result = __CGTypeRegisterInternal(CGFontGetTypeID_class);
  CGFontGetTypeID_font_type_id = result;
  return result;
}

@end
