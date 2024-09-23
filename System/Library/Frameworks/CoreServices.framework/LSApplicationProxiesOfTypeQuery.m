@implementation LSApplicationProxiesOfTypeQuery

uint64_t __70___LSApplicationProxiesOfTypeQuery__enumerateWithXPCConnection_block___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)_CSStringCopyCFString();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 32));
  else
    v4 = 0;

  return v4;
}

@end
