@implementation SOSBSKBCopyRecoveryKey

CFTypeID __SOSBSKBCopyRecoveryKey_block_invoke(CFTypeID result, int a2, CFTypeRef cf)
{
  uint64_t v3;
  CFTypeRef v4;
  CFTypeID v5;

  v3 = result;
  if (!cf || (v4 = cf, v5 = CFGetTypeID(cf), result = CFDataGetTypeID(), v5 != result))
    v4 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 8) + 24) = v4;
  return result;
}

@end
