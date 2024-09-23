@implementation SecOTRCopyIncomingBytes

char *__SecOTRCopyIncomingBytes_block_invoke(uint64_t a1, unint64_t a2, UInt8 *a3)
{
  unsigned __int8 *BytePtr;
  CFIndex Length;
  char *result;
  int v9;
  unsigned __int8 *v10;

  BytePtr = (unsigned __int8 *)CFDataGetBytePtr(*(CFDataRef *)(a1 + 40));
  Length = CFDataGetLength(*(CFDataRef *)(a1 + 40));
  result = SecBase64Decode_(BytePtr, Length, a3, a2, 0, &v10, &v9);
  if ((unint64_t)(result - 1) < a2)
  {
    result = (char *)CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a3, (CFIndex)result);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

@end
