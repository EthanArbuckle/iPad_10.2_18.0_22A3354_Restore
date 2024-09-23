@implementation CNPluginMonitorGet

_OWORD *__CNPluginMonitorGet_block_invoke()
{
  _OWORD *result;

  result = CNMonitorCreate(6, (uint64_t)CNPluginMonitorHandleCommand, (uint64_t)CNPluginMonitorCopyControl);
  CNPluginMonitorGet_monitor = (uint64_t)result;
  return result;
}

@end
