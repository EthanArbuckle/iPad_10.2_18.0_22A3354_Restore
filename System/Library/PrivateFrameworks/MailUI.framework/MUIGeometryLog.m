@implementation MUIGeometryLog

void __MUIGeometryLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "MUIGeometry");
  v1 = (void *)MUIGeometryLog_os_log;
  MUIGeometryLog_os_log = (uint64_t)v0;

}

@end
