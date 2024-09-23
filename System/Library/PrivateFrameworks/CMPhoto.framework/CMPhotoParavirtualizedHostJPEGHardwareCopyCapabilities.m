@implementation CMPhotoParavirtualizedHostJPEGHardwareCopyCapabilities

void __CMPhotoParavirtualizedHostJPEGHardwareCopyCapabilities_block_invoke(uint64_t a1)
{
  const __CFAllocator *v1;
  uint64_t v2;
  uint64_t v3;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;

  v1 = *(const __CFAllocator **)(a1 + 32);
  v2 = JPEGDeviceInterface_openDriverConnection();
  if (!(_DWORD)v2)
  {
    v11 = -16994;
    goto LABEL_11;
  }
  v3 = v2;
  Mutable = CFDictionaryCreateMutable(v1, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!Mutable)
  {
    v11 = -16991;
    goto LABEL_10;
  }
  v5 = Mutable;
  v6 = JPEGDeviceInterface_numberOfJPEGCores();
  v7 = JPEGDeviceInterface_supportsAppleInterchangeFormats();
  v8 = JPEGDeviceInterface_supportsMissingEOI();
  v9 = JPEGDeviceInterface_supportsRSTLogging();
  v10 = CMPhotoCFDictionarySetInt32(v5, CFSTR("Version"), 1);
  if (v10
    || (v10 = CMPhotoCFDictionarySetInt32(v5, CFSTR("NumberOfCores"), v6)) != 0
    || (v10 = CMPhotoCFDictionarySetBoolean(v5, CFSTR("SupportsInterchangeFormats"), v7)) != 0
    || (v10 = CMPhotoCFDictionarySetBoolean(v5, CFSTR("SupportsMissingEOI"), v8)) != 0
    || (v10 = CMPhotoCFDictionarySetBoolean(v5, CFSTR("SupportsRSTLogging"), v9)) != 0)
  {
    v11 = v10;
    goto LABEL_13;
  }
  v11 = CMPhotoCFDictionarySetBoolean(v5, CFSTR("Supports16BitQuantizationTables"), 1);
  if (v11)
  {
LABEL_13:
    JPEGDeviceInterface_closeDriverConnection(v3);
    CFRelease(v5);
    goto LABEL_11;
  }
  CMPhotoParavirtualizedHostJPEGHardwareCopyCapabilities_sCapabilities = (uint64_t)v5;
LABEL_10:
  JPEGDeviceInterface_closeDriverConnection(v3);
LABEL_11:
  CMPhotoParavirtualizedHostJPEGHardwareCopyCapabilities_err = v11;
}

@end
