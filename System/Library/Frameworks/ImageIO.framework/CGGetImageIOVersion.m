@implementation CGGetImageIOVersion

double __CGGetImageIOVersion_block_invoke()
{
  __CFBundle *BundleWithIdentifier;
  double result;
  CFTypeRef ValueForInfoDictionaryKey;
  const char *v3;
  _QWORD v4[3];

  BundleWithIdentifier = CFBundleGetBundleWithIdentifier(CFSTR("com.apple.ImageIO"));
  if (BundleWithIdentifier)
  {
    ValueForInfoDictionaryKey = CFBundleGetValueForInfoDictionaryKey(BundleWithIdentifier, (CFStringRef)*MEMORY[0x1E0C9AE90]);
    if (ValueForInfoDictionaryKey)
    {
      memset(v4, 0, sizeof(v4));
      IIOString::IIOString((IIOString *)v4, ValueForInfoDictionaryKey);
      v3 = (const char *)IIOString::utf8String((IIOString *)v4);
      strncpy((char *)&CGGetImageIOVersion::gIIOVersion, v3, 0x20uLL);
      IIOString::~IIOString((IIOString *)v4);
    }
  }
  if (!(_BYTE)CGGetImageIOVersion::gIIOVersion)
  {
    result = *(double *)"unknown";
    CGGetImageIOVersion::gIIOVersion = *(_OWORD *)"unknown";
    unk_1EDF037D8 = *(_OWORD *)&algn_1882124A2[8];
  }
  return result;
}

@end
