@implementation SecItemUpdateWithError

uint64_t __SecItemUpdateWithError_block_invoke(uint64_t a1, void *a2, const __CFDictionary *a3, const __CFDictionary *a4, uint64_t a5, CFTypeRef *a6)
{
  id v9;
  id v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;
  const __CFDictionary *v15;

  v9 = a2;
  if ((isModifyingAPIRateWithinLimits() & 1) == 0)
    __security_simulatecrash(CFSTR("BUG IN CLIENT OF SECITEM: too many writes. See https://at.apple.com/secitemratelimit"), 0x53C0000Fu);
  if (v9)
  {
    v10 = v9;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __SecTokenItemUpdate_block_invoke;
    v13[3] = &unk_1E1FD6268;
    v14 = v10;
    v15 = a4;
    v11 = SecTokenItemForEachMatching(a3, a6, v13);

  }
  else
  {
    v11 = SecItemRawUpdate((const __CFString *)a3, a4, a6);
  }

  return v11;
}

@end
