@implementation IOHIDLogCategory

os_log_t ___IOHIDLogCategory_block_invoke()
{
  os_log_t result;

  _IOHIDLogCategory_log[0] = (uint64_t)os_log_create("com.apple.iohid", "default");
  qword_1ECD37928 = (uint64_t)os_log_create("com.apple.iohid", "trace");
  qword_1ECD37930 = (uint64_t)os_log_create("com.apple.iohid", "property");
  qword_1ECD37938 = (uint64_t)os_log_create("com.apple.iohid", "activity");
  qword_1ECD37940 = (uint64_t)os_log_create("com.apple.iohid", "fastpath");
  qword_1ECD37948 = (uint64_t)os_log_create("com.apple.iohid", "userdevice");
  qword_1ECD37950 = (uint64_t)os_log_create("com.apple.iohid", "service");
  qword_1ECD37958 = (uint64_t)os_log_create("com.apple.iohid", "serviceplugin");
  qword_1ECD37960 = (uint64_t)os_log_create("com.apple.iohid", "service.carplay");
  qword_1ECD37968 = (uint64_t)os_log_create("com.apple.iohid", "connection");
  qword_1ECD37970 = (uint64_t)os_log_create("com.apple.iohid", "cursor");
  qword_1ECD37978 = (uint64_t)os_log_create("com.apple.iohid", "hidsignpost");
  qword_1ECD37980 = (uint64_t)os_log_create("com.apple.iohid", "ups");
  qword_1ECD37988 = (uint64_t)os_log_create("com.apple.iohid", "client");
  result = os_log_create("com.apple.iohid", "oversized");
  qword_1ECD37990 = (uint64_t)result;
  return result;
}

@end
