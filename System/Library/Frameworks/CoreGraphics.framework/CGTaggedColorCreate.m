@implementation CGTaggedColorCreate

os_log_t __CGTaggedColorCreate_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.coregraphics", "color");
  CGTaggedColorCreate_log = (uint64_t)result;
  return result;
}

@end
