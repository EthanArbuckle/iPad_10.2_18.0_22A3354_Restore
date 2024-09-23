@implementation CFPrefsCopyUserNameForUID

const __CFString *___CFPrefsCopyUserNameForUID_block_invoke(uint64_t a1)
{
  const __CFString *result;

  result = _calculateUserNameForUID(*(_DWORD *)(a1 + 32));
  _CFPrefsCopyUserNameForUID_ourUIDName = (uint64_t)result;
  return result;
}

const __CFString *___CFPrefsCopyUserNameForUID_block_invoke_2(uint64_t a1)
{
  uid_t v1;
  const __CFString *result;

  if (*(_DWORD *)(a1 + 32))
    v1 = 0;
  else
    v1 = 501;
  _CFPrefsCopyUserNameForUID_otherCommonUID = v1;
  result = _calculateUserNameForUID(v1);
  _CFPrefsCopyUserNameForUID_otherCommonUIDName = (uint64_t)result;
  return result;
}

@end
