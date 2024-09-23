@implementation DELogging

+ (id)fwHandle
{
  if (fwHandle_onceToken != -1)
    dispatch_once(&fwHandle_onceToken, &__block_literal_global_6);
  return (id)fwHandle_handle;
}

void __21__DELogging_fwHandle__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.diagnosticextensions", "Framework");
  v1 = (void *)fwHandle_handle;
  fwHandle_handle = (uint64_t)v0;

}

@end
