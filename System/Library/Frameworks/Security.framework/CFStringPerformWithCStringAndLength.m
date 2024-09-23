@implementation CFStringPerformWithCStringAndLength

uint64_t __CFStringPerformWithCStringAndLength_block_invoke(uint64_t result, int a2, UInt8 *buffer)
{
  uint64_t v4;
  const __CFString *v5;
  CFIndex v6;
  CFIndex usedBufLen;
  CFRange v8;

  if (buffer)
  {
    v4 = result;
    v5 = *(const __CFString **)(result + 40);
    v8 = *(CFRange *)(v4 + 48);
    v6 = *(_QWORD *)(v4 + 64);
    usedBufLen = 0xAAAAAAAAAAAAAAAALL;
    CFStringGetBytes(v5, v8, 0x8000100u, 0, 0, buffer, v6, &usedBufLen);
    buffer[usedBufLen] = 0;
    return (*(uint64_t (**)(void))(*(_QWORD *)(v4 + 32) + 16))();
  }
  return result;
}

@end
