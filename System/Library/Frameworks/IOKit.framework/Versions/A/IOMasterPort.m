@implementation IOMasterPort

uint64_t __IOMasterPort_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = io_server_version(**(_DWORD **)(a1 + 32));
  if ((_DWORD)result)
  {
    gIOKitLibServerVersion = 0;
  }
  else if ((unint64_t)gIOKitLibServerVersion > 0x1335184)
  {
    return result;
  }
  gIOKitLibSerializeOptions &= ~1uLL;
  return result;
}

@end
