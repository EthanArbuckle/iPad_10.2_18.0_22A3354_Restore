@implementation PerformWithCFDataBuffer

void __PerformWithCFDataBuffer_block_invoke(uint64_t a1, CFIndex length, UInt8 *bytes)
{
  CFDataRef v4;

  v4 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], bytes, length, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  CFRelease(v4);
}

@end
