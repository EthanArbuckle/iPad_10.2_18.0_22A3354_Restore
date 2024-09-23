@implementation AXRotateToScreen

uint64_t __AXRotateToScreen_block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = +[AXBackBoardGlue displayConvertToCAScreen:withDisplayIntegerId:](AXBackBoardGlue, "displayConvertToCAScreen:withDisplayIntegerId:", *(unsigned int *)(a1 + 56), *(double *)(a1 + 40), *(double *)(a1 + 48));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  return result;
}

@end
