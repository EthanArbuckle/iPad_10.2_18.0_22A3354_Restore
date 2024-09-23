@implementation CUIUncompressDeepmap2ImageData

void __CUIUncompressDeepmap2ImageData_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int8x16_t v21;
  uint64_t v22;

  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 80);
  v20 = *(_QWORD *)(a1 + 64) + *(_QWORD *)(a1 + 72) * v2;
  v21 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  v22 = v2;
  v4 = v3 + 16;
  v5 = *(_QWORD *)(a1 + 88);
  v6 = *(_QWORD *)(v5 + 8);
  if (v6 <= 0x100000)
  {
    if (vImageDeepmap2Decode(&v20, *(unsigned int *)(a1 + 96), v3 + 16, *(_QWORD *)(v5 + 8), 0))
      return;
    _CUILog(4, (uint64_t)"CoreUI: vImageDeepmap2Decode() returned 0.", v10, v11, v12, v13, v14, v15, v16);
  }
  else
  {
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v7 = vImageDeepmap2DecodeStreamCreate(&v17, &v20, *(unsigned int *)(a1 + 96), 0);
    if (!v7)
    {
      v17 = v4;
      v8 = v4 + v6;
      while (v7 != -1)
      {
        if (v7)
        {
          if (v7 != 1)
            __CUIUncompressDeepmap2ImageData_block_invoke_cold_1();
          if (!vImageDeepmap2DecodeStreamRelease(&v17))
            return;
          break;
        }
        v9 = v8 - v17;
        if ((unint64_t)(v8 - v17) >= 0x20000)
          v9 = 0x20000;
        v18 = v9;
        v7 = vImageDeepmap2DecodeStreamProcess(&v17);
      }
    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
}

uint64_t __CUIUncompressDeepmap2ImageData_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*((uint64_t (**)(void))objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2) + 2))();
}

void __CUIUncompressDeepmap2ImageData_block_invoke_cold_1()
{
  __assert_rtn("CUIUncompressDeepmap2ImageData_block_invoke", "CUIDeepmap2Compression.m", 481, "status == kDeepmap2StreamStatusEND");
}

@end
