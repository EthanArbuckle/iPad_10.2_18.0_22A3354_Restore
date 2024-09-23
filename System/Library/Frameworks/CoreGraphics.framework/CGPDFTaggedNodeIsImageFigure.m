@implementation CGPDFTaggedNodeIsImageFigure

BOOL __CGPDFTaggedNodeIsImageFigure_block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CGPDFTaggedNodeIsImageFigure(a2);
  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0;
}

@end
