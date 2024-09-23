@implementation CNPluginResponseDeliver

void __CNPluginResponseDeliver_block_invoke(uint64_t a1)
{
  _CNPluginProvideResponse(*(const __CFDictionary **)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
