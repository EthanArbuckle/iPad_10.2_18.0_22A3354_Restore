@implementation AppendModeObjectGetTypeID

uint64_t __AppendModeObjectGetTypeID_block_invoke()
{
  uint64_t result;

  result = pdf_register_cftype((uint64_t)&AppendModeObjectGetTypeID_class);
  AppendModeObjectGetTypeID_id = result;
  return result;
}

@end
