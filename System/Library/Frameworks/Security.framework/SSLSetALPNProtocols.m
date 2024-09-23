@implementation SSLSetALPNProtocols

void __SSLSetALPNProtocols_block_invoke(uint64_t a1, CFStringRef theString)
{
  __int128 v4;
  UInt8 bytes;
  char buffer[16];
  __int128 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  bytes = CFStringGetLength(theString);
  if (bytes <= 0x20uLL)
  {
    *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buffer = v4;
    v7 = v4;
    if (CFStringGetCString(theString, buffer, 32, 0x600u))
    {
      CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 32), &bytes, 1);
      CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 32), (const UInt8 *)buffer, bytes);
    }
  }
}

@end
