@implementation CGPDFPageGetReferenceForAnnotation

uint64_t __CGPDFPageGetReferenceForAnnotation_block_invoke(uint64_t a1, char *a2, CFArrayRef theArray)
{
  uint64_t result;
  uint64_t v5;
  CFIndex v6;

  v5 = 0;
  result = AppendModeFindAnnotation(a2, theArray, *(_QWORD *)(a1 + 40), &v6, &v5);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
  return result;
}

@end
