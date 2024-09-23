@implementation OSArrayApply

uint64_t __OSArrayApply_block_invoke(uint64_t a1, uint64_t a2, OSSerialization *a3, uint64_t a4)
{
  if ((a4 & 1) != 0)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 64) + 32) + 8 * a2) = OSCreateObjectFromSerializationInternal(a3, HIDWORD(a4));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
