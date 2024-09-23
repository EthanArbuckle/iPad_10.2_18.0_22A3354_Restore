@implementation CFDataCreateWithRandomBytes

CFDataRef __CFDataCreateWithRandomBytes_block_invoke(uint64_t a1, size_t a2, void *bytes)
{
  CFDataRef result;

  CCRandomGenerateBytes(bytes, a2);
  result = CFDataCreate(0, (const UInt8 *)bytes, a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
