@implementation CNScanListFilterGet

_OWORD *__CNScanListFilterGet_block_invoke()
{
  _OWORD *result;

  result = CNMonitorCreate(5, (uint64_t)CNScanListFilterHandleCommand, (uint64_t)CNScanListFilterCopyControl);
  CNScanListFilterGet_monitor = (uint64_t)result;
  return result;
}

@end
