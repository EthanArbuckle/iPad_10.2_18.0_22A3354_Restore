@implementation AppleIDAuthSupportGetClientInfo

void __AppleIDAuthSupportGetClientInfo_block_invoke()
{
  const __CFDictionary *v0;
  const __CFDictionary *v1;
  const void *Value;
  const void *v3;
  const void *v4;
  BOOL v5;
  CFStringRef v7;

  v0 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  if (v0)
  {
    v1 = v0;
    Value = CFDictionaryGetValue(v0, (const void *)*MEMORY[0x24BDBD1F0]);
    v3 = CFDictionaryGetValue(v1, (const void *)*MEMORY[0x24BDBD200]);
    v4 = CFDictionaryGetValue(v1, (const void *)*MEMORY[0x24BDBD1F8]);
    if (Value)
      v5 = v3 == 0;
    else
      v5 = 1;
    if (v5 || v4 == 0)
      v7 = 0;
    else
      v7 = CFStringCreateWithFormat(0, 0, CFSTR("%@;%@;%@"), v4, v3, Value);
    CFRelease(v1);
  }
  else
  {
    v7 = 0;
  }
  AppleIDAuthSupportGetClientInfo_clientInfo = (uint64_t)CFStringCreateWithFormat(0, 0, CFSTR("<%@> <%@> <%@>"), CFSTR("iOS"), v7, CFSTR("AppleIDAuthSupport"));
  CFRelease(CFSTR("iOS"));
  CFRelease(v7);
  CFRelease(CFSTR("AppleIDAuthSupport"));
}

@end
