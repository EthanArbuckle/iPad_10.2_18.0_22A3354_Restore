@implementation CGPDFDrawingContextGetOperatorTable

void __CGPDFDrawingContextGetOperatorTable_block_invoke()
{
  uint64_t i;

  CGPDFDrawingContextGetOperatorTable_operator_table = (uint64_t)CGPDFOperatorTableCreate();
  if (CGPDFDrawingContextGetOperatorTable_operator_table)
  {
    for (i = 0; i != 132; i += 2)
      CGPDFOperatorTableSetCallback((CGPDFOperatorTableRef)CGPDFDrawingContextGetOperatorTable_operator_table, (&operators)[i], (CGPDFOperatorCallback)(&operators)[i + 1]);
  }
}

@end
