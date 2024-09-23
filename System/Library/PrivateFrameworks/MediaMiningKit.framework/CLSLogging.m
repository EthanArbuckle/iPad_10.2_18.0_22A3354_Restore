@implementation CLSLogging

- (OS_os_log)loggingConnection
{
  return (OS_os_log *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
}

+ (id)sharedLogging
{
  if (sharedLogging_onceToken != -1)
    dispatch_once(&sharedLogging_onceToken, &__block_literal_global_1460);
  return (id)sharedLogging_sharedLogging;
}

void __27__CLSLogging_sharedLogging__block_invoke()
{
  CLSLogging *v0;
  void *v1;
  os_log_t v2;
  void *v3;

  v0 = objc_alloc_init(CLSLogging);
  v1 = (void *)sharedLogging_sharedLogging;
  sharedLogging_sharedLogging = (uint64_t)v0;

  v2 = os_log_create("com.apple.mediaminingkit", "default");
  v3 = *(void **)(sharedLogging_sharedLogging + 8);
  *(_QWORD *)(sharedLogging_sharedLogging + 8) = v2;

}

@end
