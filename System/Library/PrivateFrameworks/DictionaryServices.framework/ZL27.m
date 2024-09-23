@implementation ZL27

void *___ZL27_CallAnalyticsSendEventLazyPKcPv_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CoreAnalytics.framework/CoreAnalytics", 1);
  if (result)
  {
    result = dlsym(result, "analytics_send_event_lazy");
    _CallAnalyticsSendEventLazy(char const*,void *)::_AnalyticsSendEventLazyProc = (uint64_t (*)(_QWORD, _QWORD))result;
  }
  return result;
}

@end
