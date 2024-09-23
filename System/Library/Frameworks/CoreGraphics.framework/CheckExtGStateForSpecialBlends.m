@implementation CheckExtGStateForSpecialBlends

BOOL __CheckExtGStateForSpecialBlends_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CGPDFDictionary *v4;
  _BOOL8 result;
  CGPDFObjectRef value;

  if (!a3)
    return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0;
  if (*(_DWORD *)(a3 + 8) != 8)
    return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0;
  v4 = *(CGPDFDictionary **)(a3 + 32);
  value = 0;
  if (!CGPDFDictionaryGetObject(v4, "BM", &value)
    || CGPDFBlendModeFromCGPDFObject((uint64_t)value) + 1 < 2)
  {
    return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0;
  }
  result = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

@end
