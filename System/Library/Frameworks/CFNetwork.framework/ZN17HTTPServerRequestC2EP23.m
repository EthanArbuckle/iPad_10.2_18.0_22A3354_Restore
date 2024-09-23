@implementation ZN17HTTPServerRequestC2EP23

_QWORD *___ZN17HTTPServerRequestC2EP23_CFHTTPServerConnection_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _QWORD *v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = CFAllocatorAllocate(*(CFAllocatorRef *)(a1 + 40), 32, 0);
  v4[2] = 0;
  v4[3] = 0;
  *v4 = &off_1E14EB5F0;
  v4[1] = a2;
  *((_BYTE *)v4 + 24) = 0;
  v4[2] = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v3 + 120) + 48))(v3 + 120);
  return v4;
}

@end
