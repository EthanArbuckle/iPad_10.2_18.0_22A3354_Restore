@implementation SOSBSKBAllPeersBackupKeysAreInKeyBag

uint64_t __SOSBSKBAllPeersBackupKeysAreInKeyBag_block_invoke(uint64_t result, CFTypeRef cf)
{
  uint64_t v3;
  CFTypeID v4;
  uint64_t v5;
  char v6;

  if (cf)
  {
    v3 = result;
    v4 = CFGetTypeID(cf);
    result = SOSPeerInfoGetTypeID();
    if (v4 == result)
    {
      result = SOSPeerInfoHasBackupKey((uint64_t)cf);
      if ((_DWORD)result)
      {
        result = SOSBKSBPeerBackupKeyIsInKeyBag(*(_QWORD *)(v3 + 40), cf);
        v5 = *(_QWORD *)(*(_QWORD *)(v3 + 32) + 8);
        if (*(_BYTE *)(v5 + 24))
          v6 = result;
        else
          v6 = 0;
        *(_BYTE *)(v5 + 24) = v6;
      }
    }
  }
  return result;
}

@end
