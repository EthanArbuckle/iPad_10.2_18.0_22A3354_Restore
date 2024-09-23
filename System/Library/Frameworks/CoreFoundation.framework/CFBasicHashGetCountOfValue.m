@implementation CFBasicHashGetCountOfValue

uint64_t __CFBasicHashGetCountOfValue_block_invoke(_QWORD *a1, uint64_t a2)
{
  unsigned int (*v4)(void);

  if (a1[5] == *(_QWORD *)(a2 + 16)
    || (v4 = *(unsigned int (**)(void))(CFBasicHashCallBackPtrs[((*(_QWORD *)(a1[6] + 32) >> 34) >> 5) & 0x1F]
                                      + 8 * ((*(_QWORD *)(a1[6] + 32) >> 34) & 0x1FLL))) != 0
    && v4())
  {
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) += *(_QWORD *)(a2 + 24);
  }
  return 1;
}

@end
