@implementation SecCertificateGetTypeID

CFDictionaryRef __SecCertificateGetTypeID_block_invoke(uint64_t a1)
{
  CFDictionaryRef result;

  **(_QWORD **)(a1 + 32) = _CFRuntimeRegisterClass();
  result = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)SecCertificateInitializeExtensionParsers_extnOIDs, (const void **)SecCertificateInitializeExtensionParsers_extnParsers, 20, &SecDERItemKeyCallBacks, 0);
  sExtensionParsers = (uint64_t)result;
  return result;
}

@end
