@implementation KGLoggingConnection

void __KGLoggingConnection_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.graph", "KnowledgeGraph");
  v1 = (void *)KGLoggingConnection_log;
  KGLoggingConnection_log = (uint64_t)v0;

}

@end
