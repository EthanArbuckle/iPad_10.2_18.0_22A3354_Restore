@implementation CLSEILogging

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
  if (sharedLogging_onceToken_2007 != -1)
    dispatch_once(&sharedLogging_onceToken_2007, &__block_literal_global_2008);
  return (id)sharedLogging_sharedLogging_2009;
}

void __29__CLSEILogging_sharedLogging__block_invoke()
{
  CLSEILogging *v0;
  void *v1;
  os_log_t v2;
  void *v3;

  v0 = objc_alloc_init(CLSEILogging);
  v1 = (void *)sharedLogging_sharedLogging_2009;
  sharedLogging_sharedLogging_2009 = (uint64_t)v0;

  v2 = os_log_create("com.apple.photos.mediamining.eventsingest", "default");
  v3 = *(void **)(sharedLogging_sharedLogging_2009 + 8);
  *(_QWORD *)(sharedLogging_sharedLogging_2009 + 8) = v2;

}

@end
