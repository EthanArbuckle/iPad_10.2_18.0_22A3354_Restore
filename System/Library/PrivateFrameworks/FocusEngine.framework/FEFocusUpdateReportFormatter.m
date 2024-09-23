@implementation FEFocusUpdateReportFormatter

uint64_t __48___FEFocusUpdateReportFormatter__bodyForReport___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (!*(_BYTE *)(v3 + 24))
  {
    result = objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v3 + 24) = 0;
  return result;
}

@end
