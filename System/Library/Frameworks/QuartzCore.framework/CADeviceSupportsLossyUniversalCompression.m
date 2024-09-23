@implementation CADeviceSupportsLossyUniversalCompression

void __CADeviceSupportsLossyUniversalCompression_block_invoke()
{
  const __CFDictionary *v0;
  const __CFDictionary *v1;
  const void *Value;

  v0 = (const __CFDictionary *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    Value = CFDictionaryGetValue(v0, CFSTR("universal-lossy-buffer-compression"));
    if (Value)
      LOBYTE(Value) = CA_CFBoolValue(Value);
    CADeviceSupportsLossyUniversalCompression::lossy = (char)Value;
    CFRelease(v1);
  }
}

@end
