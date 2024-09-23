@implementation MDUnicodeConverterGetTypeID

uint64_t __MDUnicodeConverterGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kMDUnicodeConverterTypeID = result;
  return result;
}

@end
