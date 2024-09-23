@implementation SCDynamicStoreNullSession

SCDynamicStoreRef ____SCDynamicStoreNullSession_block_invoke()
{
  SCDynamicStoreRef result;

  result = SCDynamicStoreCreateWithOptions(0, CFSTR("null"), 0, 0, 0);
  S_null_session = (uint64_t)result;
  return result;
}

@end
