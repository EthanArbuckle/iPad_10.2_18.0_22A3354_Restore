@implementation CGPDFAppenderCreateCGPDFStreamObjectFromCGDisplayList

uint64_t __CGPDFAppenderCreateCGPDFStreamObjectFromCGDisplayList_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  CGPDFDictionary *v5;
  uint64_t result;
  char *value;

  if (!a3)
    return 1;
  if (*(_DWORD *)(a3 + 8) != 9)
    return 1;
  v4 = *(_QWORD *)(a3 + 32);
  value = 0;
  v5 = v4 ? *(CGPDFDictionary **)(v4 + 48) : 0;
  if (!CGPDFDictionaryGetName(v5, "Subtype", (const char **)&value))
    return 1;
  result = strcmp(value, "Form");
  if ((_DWORD)result)
    return 1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

@end
