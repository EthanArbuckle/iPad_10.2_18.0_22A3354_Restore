@implementation CADeviceSupportsUniversalCompression

void __CADeviceSupportsUniversalCompression_block_invoke()
{
  const __CFDictionary *v0;
  const __CFDictionary *v1;
  const void *Value;

  v0 = (const __CFDictionary *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    Value = CFDictionaryGetValue(v0, CFSTR("universal-buffer-compression"));
    if (Value)
      LOBYTE(Value) = CA_CFBoolValue(Value);
    CADeviceSupportsUniversalCompression::universal = (char)Value;
    CFRelease(v1);
  }
}

@end
