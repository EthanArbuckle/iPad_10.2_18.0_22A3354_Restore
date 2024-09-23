@implementation DDScannerLoaderInitScannerIdentifierMappings

CFDictionaryRef ____DDScannerLoaderInitScannerIdentifierMappings_block_invoke()
{
  const void **v0;
  CFDictionaryRef result;

  v0 = (const void **)malloc_type_malloc(0x20uLL, 0x6004044C4A2DFuLL);
  scannerTypesToScannerIdentifiers = (uint64_t)v0;
  *v0 = CFSTR("com.apple.datadetectors.scanner.standard");
  v0[1] = CFSTR("com.apple.datadetectors.scanner.urlifier");
  v0[2] = CFSTR("com.apple.datadetectors.scanner.iCal");
  v0[3] = CFSTR("com.apple.datadetectors.scanner.test");
  result = CFDictionaryCreate(0, v0, (const void **)&__DDScannerLoaderInitScannerIdentifierMappings_keys, 4, MEMORY[0x1E0C9B390], 0);
  scannerIdentifiersToScannerTypes = (uint64_t)result;
  return result;
}

@end
