@implementation JFXSignPostIntervalCategory

void __JFXSignPostIntervalCategory_block_invoke(uint64_t a1)
{
  os_log_t v2;
  void **v3;
  void *v4;

  v2 = os_log_create("com.apple.CameraEffectsKit", *(const char **)(a1 + 40));
  v3 = *(void ***)(a1 + 32);
  v4 = *v3;
  *v3 = v2;

}

@end
