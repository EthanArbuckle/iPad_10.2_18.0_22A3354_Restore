@implementation VTPixelBlitterColorHandlingOptimized

uint64_t __VTPixelBlitterColorHandlingOptimized_setup_block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(_QWORD *)(a2 + 4);
  return 1;
}

uint64_t __VTPixelBlitterColorHandlingOptimized_setup_block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  CGColorTRCGetFunction();
  *(_QWORD *)(a1[10] + ((unint64_t)*(unsigned __int8 *)(*(_QWORD *)(a1[4] + 8) + 24) << 7)) = 0;
  v5 = a1[10];
  *(_QWORD *)(v5 + ((unint64_t)*(unsigned __int8 *)(*(_QWORD *)(a1[4] + 8) + 24) << 7) + 24) = 0;
  *(_DWORD *)(v5 + ((unint64_t)*(unsigned __int8 *)(*(_QWORD *)(a1[4] + 8) + 24) << 7) + 32) = 0;
  *(_QWORD *)(v5 + ((unint64_t)*(unsigned __int8 *)(*(_QWORD *)(a1[4] + 8) + 24) << 7) + 36) = 0;
  *(_DWORD *)(v5 + ((unint64_t)*(unsigned __int8 *)(*(_QWORD *)(a1[4] + 8) + 24) << 7) + 44) = 0;
  *(_DWORD *)(v5 + ((unint64_t)*(unsigned __int8 *)(*(_QWORD *)(a1[4] + 8) + 24) << 7) + 48) = 0;
  if (a3)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) - 1 == a3)
      v6 = a1[7];
    else
      v6 = a1[8];
  }
  else
  {
    v6 = a1[5];
  }
  *(_BYTE *)(*(_QWORD *)(v6 + 8) + 24) = 1;
  *(_QWORD *)(a1[10] + ((unint64_t)(*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))++ << 7)) = vtptsPixelOpTrcType0;
  return 1;
}

uint64_t __VTPixelBlitterColorHandlingOptimized_setup_block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  CGColorMatrixGetMatrix();
  if (!*(_BYTE *)(a1 + 56))
  {
    v2 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)(v2 + 72) = 0;
    *(_OWORD *)(v2 + 76) = 0uLL;
    *(_DWORD *)(v2 + 92) = 0;
    *(_QWORD *)(v2 + 96) = 0;
    *(_DWORD *)(v2 + 104) = 0;
  }
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v3 + 24))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  *(_BYTE *)(v3 + 24) = 1;
  return 1;
}

uint64_t __VTPixelBlitterColorHandlingOptimized_setup_block_invoke_4(uint64_t a1)
{
  CGColorNxMTransformGetTransform();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  return 1;
}

@end
