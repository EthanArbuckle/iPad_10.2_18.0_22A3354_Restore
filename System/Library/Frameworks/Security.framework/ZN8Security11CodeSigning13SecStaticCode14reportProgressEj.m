@implementation ZN8Security11CodeSigning13SecStaticCode14reportProgressEj

const void **___ZN8Security11CodeSigning13SecStaticCode14reportProgressEj_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const void *v11;

  v1 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v1 + 220))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  *(_DWORD *)(v1 + 216) += *(_DWORD *)(a1 + 48);
  v2 = *(_QWORD *)(v1 + 576);
  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 16))(v1);
  Security::CFTemp<__CFDictionary const*>::CFTemp(&v11, (uint64_t)"{current=%d,total=%d}", v4, v5, v6, v7, v8, v9, *(unsigned int *)(v1 + 216));
  (*(void (**)(uint64_t, uint64_t, const __CFString *, const void *))(v2 + 16))(v2, v3, CFSTR("progress"), v11);
  return Security::CFRef<__CFDictionary const*>::~CFRef(&v11);
}

@end
