@implementation CreateLegacyCallbackErrorDict

uint64_t ___CreateLegacyCallbackErrorDict_block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  int v6;

  v4 = a2;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D3ACC0]);

  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);

  return v6 ^ 1u;
}

@end
