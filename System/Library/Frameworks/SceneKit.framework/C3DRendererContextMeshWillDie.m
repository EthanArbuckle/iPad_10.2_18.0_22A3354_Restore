@implementation C3DRendererContextMeshWillDie

void ___C3DRendererContextMeshWillDie_block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD v3[5];
  int v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 0x40000000;
  v3[2] = ___C3DRendererContextMeshWillDie_block_invoke_2;
  v3[3] = &__block_descriptor_tmp_27_0;
  v3[4] = v2;
  v4 = *(_DWORD *)(a1 + 40);
  C3DRendererContextExecuteOnContext(v2, (uint64_t)v3);
  C3DRendererContextReleaseContext(*(_QWORD *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

uint64_t ___C3DRendererContextMeshWillDie_block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  int v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(a1 + 40);
  result = (*(uint64_t (**)(uint64_t, int *, uint64_t))(v1 + 1944))(1, &v3, v1);
  --*(_DWORD *)(v1 + 428);
  return result;
}

@end
