@implementation SecTrustGetNetworkFetchAllowed

__CFArray *__SecTrustGetNetworkFetchAllowed_block_invoke(uint64_t a1)
{
  __CFArray *result;

  result = SecTrustCopyOptionsFromPolicies(*(const __CFArray **)(*(_QWORD *)(a1 + 40) + 32));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __SecTrustGetNetworkFetchAllowed_block_invoke_2(uint64_t result, CFTypeRef cf)
{
  uint64_t v3;
  CFTypeID v4;

  if (cf)
  {
    v3 = result;
    v4 = CFGetTypeID(cf);
    result = CFBooleanGetTypeID();
    if (v4 == result)
    {
      result = CFBooleanGetValue((CFBooleanRef)cf);
      **(_BYTE **)(v3 + 32) = (_DWORD)result == 0;
    }
  }
  return result;
}

@end
