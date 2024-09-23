@implementation ZN18HTTPServerResponseC2EP17HTTPServerRequest

_QWORD *___ZN18HTTPServerResponseC2EP17HTTPServerRequest_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  const __CFAllocator *v4;
  _QWORD *v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = CFGetAllocator((CFTypeRef)(v3 - 16));
  v5 = CFAllocatorAllocate(v4, 32, 0);
  v5[2] = 0;
  v5[3] = 0;
  *v5 = &off_1E14EB5F0;
  v5[1] = a2;
  *((_BYTE *)v5 + 24) = 0;
  v5[2] = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v3 + 64) + 48))(v3 + 64);
  return v5;
}

@end
