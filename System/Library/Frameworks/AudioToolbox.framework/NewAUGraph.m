@implementation NewAUGraph

os_log_t __NewAUGraph_block_invoke()
{
  _QWORD *v0;
  os_log_t result;

  v0 = (_QWORD *)operator new();
  v0[1] = 0;
  result = os_log_create("com.apple.coreaudio", "augraph");
  *v0 = result;
  kAUGraphScope = (uint64_t)v0;
  return result;
}

@end
