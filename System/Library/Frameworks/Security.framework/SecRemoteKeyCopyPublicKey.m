@implementation SecRemoteKeyCopyPublicKey

void __SecRemoteKeyCopyPublicKey_block_invoke(uint64_t a1, uint64_t a2)
{
  __SecKey *v3;
  uint64_t v4;
  void *v5;

  if (a2)
  {
    v3 = +[SecKeyProxy createKeyFromEndpoint:error:](SecKeyProxy, "createKeyFromEndpoint:error:", a2, 0);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

@end
