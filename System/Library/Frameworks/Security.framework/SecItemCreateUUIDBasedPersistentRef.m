@implementation SecItemCreateUUIDBasedPersistentRef

void ___SecItemCreateUUIDBasedPersistentRef_block_invoke(uint64_t a1, CFDataRef theData)
{
  __CFData *v3;
  const UInt8 *BytePtr;
  CFIndex Length;

  v3 = *(__CFData **)(a1 + 32);
  BytePtr = CFDataGetBytePtr(theData);
  Length = CFDataGetLength(theData);
  CFDataAppendBytes(v3, BytePtr, Length);
}

@end
