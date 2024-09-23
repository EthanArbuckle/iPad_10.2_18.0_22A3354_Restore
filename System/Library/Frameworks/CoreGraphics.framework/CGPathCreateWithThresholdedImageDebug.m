@implementation CGPathCreateWithThresholdedImageDebug

const void *__CGPathCreateWithThresholdedImageDebug_block_invoke()
{
  get_BOOLean_property("DEBUG_AUTO_TRACE", (const void *(*)(const char *))copy_local_domain_value, (BOOL *)&debug_auto_trace);
  get_BOOLean_property("DEBUG_AUTO_TRACE_SYNTAX", (const void *(*)(const char *))copy_local_domain_value, (BOOL *)&debug_auto_trace_syntax);
  get_BOOLean_property("DEBUG_AUTO_TRACE_NAN_INF_CHECK", (const void *(*)(const char *))copy_local_domain_value, (BOOL *)&debug_auto_trace_nan_inf_check);
  return get_BOOLean_property("DEBUG_AUTO_TRACE_UNINITIALIZED_TESTING", (const void *(*)(const char *))copy_local_domain_value, (BOOL *)&debug_auto_trace_uninitialized_testing);
}

@end
