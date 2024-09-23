@implementation CACentralLogString

os_log_t __CACentralLogString_block_invoke()
{
  _QWORD *v0;
  os_log_t result;

  v0 = (_QWORD *)operator new();
  v0[1] = 0;
  result = os_log_create("com.apple.coreaudio", "central");
  *v0 = result;
  CACentralLogString::gCentralLogScope = (uint64_t)v0;
  return result;
}

@end
