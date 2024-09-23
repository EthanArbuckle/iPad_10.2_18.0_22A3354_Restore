@implementation NSData

void __66__NSData_AppleMediaServices___AESKeyForDataProtectionClass_error___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.AppleMediaServices.AESKeyGeneration", MEMORY[0x1E0C80D50]);
  v1 = (void *)qword_1ECEADA28;
  qword_1ECEADA28 = (uint64_t)v0;

}

void __66__NSData_AppleMediaServices___AESKeyForDataProtectionClass_error___block_invoke_26()
{
  AMSThreadSafeDictionary *v0;
  void *v1;

  v0 = objc_alloc_init(AMSThreadSafeDictionary);
  v1 = (void *)qword_1ECEADA38;
  qword_1ECEADA38 = (uint64_t)v0;

}

void __66__NSData_AppleMediaServices___AESKeyForDataProtectionClass_error___block_invoke_29(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CFTypeRef result;

  result = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = SecItemCopyMatching(*(CFDictionaryRef *)(a1 + 48), &result);
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = result;

  }
}

void __66__NSData_AppleMediaServices___AESKeyForDataProtectionClass_error___block_invoke_30(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CFTypeRef result;

  result = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = SecItemCopyMatching(*(CFDictionaryRef *)(a1 + 48), &result);
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)
    || (CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 48), (const void *)*MEMORY[0x1E0CD68A0], (const void *)objc_msgSend(*(id *)(a1 + 56), "_accessibleAttributeForDataProtectionClass:", *(_QWORD *)(a1 + 64))), CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 48), (const void *)*MEMORY[0x1E0CD70D8], (const void *)objc_msgSend(*(id *)(a1 + 56), "ams_generateEncryptionKey")), (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = SecItemAdd(*(CFDictionaryRef *)(a1 + 48), &result)) == 0))
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = result;

  }
}

@end
