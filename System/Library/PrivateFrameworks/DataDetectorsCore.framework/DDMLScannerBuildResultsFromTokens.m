@implementation DDMLScannerBuildResultsFromTokens

void __DDMLScannerBuildResultsFromTokens_block_invoke(uint64_t a1)
{
  DDMLResult *v2;
  uint64_t v3;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v2 = -[DDMLResult initWithText:resultRange:confidence:resultType:]([DDMLResult alloc], "initWithText:resultRange:confidence:resultType:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v2);

  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 10;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  *(_QWORD *)(v3 + 32) = 0;
  *(_QWORD *)(v3 + 40) = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
}

@end
