@implementation APSPowerLog

uint64_t (*__APSPowerLog_block_invoke())(_QWORD, _QWORD, _QWORD, _QWORD)
{
  uint64_t (*result)(_QWORD, _QWORD, _QWORD, _QWORD);

  result = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))CUTWeakLinkSymbol();
  APSPowerLog__PLLogTimeSensitiveRegisteredEvent = result;
  return result;
}

@end
