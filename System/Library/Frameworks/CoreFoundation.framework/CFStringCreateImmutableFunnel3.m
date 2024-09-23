@implementation CFStringCreateImmutableFunnel3

uint64_t ____CFStringCreateImmutableFunnel3_block_invoke()
{
  uint64_t result;
  char v1;

  result = (uint64_t)getenv("CFStringDisableROM");
  __CFStringCreateImmutableFunnel3_sDisableStringROM = result != 0;
  if (result)
  {
    v1 = 1;
  }
  else
  {
    result = _os_feature_enabled_impl();
    v1 = result ^ 1;
  }
  __CFStringCreateImmutableFunnel3_sDisableStringROM = v1;
  return result;
}

@end
