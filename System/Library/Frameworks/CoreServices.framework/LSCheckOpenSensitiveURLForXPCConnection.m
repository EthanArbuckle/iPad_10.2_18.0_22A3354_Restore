@implementation LSCheckOpenSensitiveURLForXPCConnection

uint64_t ___LSCheckOpenSensitiveURLForXPCConnection_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  int v7;

  v4 = a3;
  if (object_getClass(v4) == (Class)MEMORY[0x1E0C81390])
  {
    v6 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    v7 = objc_msgSend(*(id *)(a1 + 40), "hasPrefix:", v6);
    if (v7)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    v5 = v7 ^ 1u;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

@end
