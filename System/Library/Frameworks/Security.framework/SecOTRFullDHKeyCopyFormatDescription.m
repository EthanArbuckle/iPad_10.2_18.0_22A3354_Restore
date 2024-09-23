@implementation SecOTRFullDHKeyCopyFormatDescription

void __SecOTRFullDHKeyCopyFormatDescription_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[8];

  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 0x40000000;
  v5[2] = __SecOTRFullDHKeyCopyFormatDescription_block_invoke_2;
  v5[3] = &unk_1E1FD8368;
  v5[4] = v4;
  v5[5] = v3;
  v5[6] = a2;
  v5[7] = a3;
  BufferPerformWithHexString((UInt8 *)(v3 + 160), 20, (uint64_t)v5);
}

CFStringRef __SecOTRFullDHKeyCopyFormatDescription_block_invoke_2(_QWORD *a1, uint64_t a2)
{
  CFStringRef result;

  result = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("<SecOTRFullDHKeyRef@%p: x: %@ y: %@ [%@]>"), a1[5], a1[6], a1[7], a2);
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

@end
