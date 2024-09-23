@implementation Settings

void __nanophotos_log_Settings_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.NanoPhotos", "Settings");
  v1 = (void *)qword_254D081F8;
  qword_254D081F8 = (uint64_t)v0;

}

@end
