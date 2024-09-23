@implementation ZN17FlatbufferEncoder13encodeSegmentE10

void *___ZN17FlatbufferEncoder13encodeSegmentE10_CSTypeRef_block_invoke_3(uint64_t a1, const void *a2, size_t size)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = malloc_type_malloc(size, 0x100004077774924uLL);
  return memcpy(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), a2, size);
}

@end
