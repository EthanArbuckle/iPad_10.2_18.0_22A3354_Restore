@implementation CheckPageForSpecialBlends

BOOL __CheckPageForSpecialBlends_block_invoke_2(uint64_t a1, CGPDFDictionaryRef dict)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = __CheckPageForSpecialBlends_block_invoke_3;
  block[3] = &unk_1E165ED78;
  block[4] = *(_QWORD *)(a1 + 32);
  CGPDFDictionaryApplyBlock(dict, block, 0);
  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0;
}

BOOL __CheckPageForSpecialBlends_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  CGPDFDictionary *v5;
  CGPDFDictionaryRef value;

  if (a3 && *(_DWORD *)(a3 + 8) == 9)
  {
    v4 = *(_QWORD *)(a3 + 32);
    value = 0;
    if (v4)
      v5 = *(CGPDFDictionary **)(v4 + 48);
    else
      v5 = 0;
    if (CGPDFDictionaryGetDictionary(v5, "Resources", &value))
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CheckExtGStateForSpecialBlends(value);
  }
  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0;
}

BOOL __CheckPageForSpecialBlends_block_invoke(uint64_t a1, CGPDFDictionary *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CheckExtGStateForSpecialBlends(a2);
  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0;
}

@end
