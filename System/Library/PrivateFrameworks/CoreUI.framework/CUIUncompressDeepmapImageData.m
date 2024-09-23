@implementation CUIUncompressDeepmapImageData

uint64_t __CUIUncompressDeepmapImageData_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int8x16_t v13;
  uint64_t v14;

  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 80);
  v4 = *(_QWORD *)(a1 + 64) + *(_QWORD *)(a1 + 72) * v2;
  v13 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  v14 = v2;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = v4;
  result = vImageDeepmapDecodeStreamCreate(&v9, &v12, *(unsigned int *)(a1 + 96), 0);
  if (!(_DWORD)result)
  {
    v9 = v3 + 16;
    v7 = v3 + 16 + v5;
    while ((_DWORD)result != -1)
    {
      if ((_DWORD)result)
      {
        if ((_DWORD)result != 1)
          __CUIUncompressDeepmapImageData_block_invoke_cold_1();
        result = vImageDeepmapDecodeStreamRelease(&v9);
        if ((_DWORD)result)
          break;
        return result;
      }
      v8 = v7 - v9;
      if ((unint64_t)(v7 - v9) >= 0x20000)
        v8 = 0x20000;
      v10 = v8;
      result = vImageDeepmapDecodeStreamProcess(&v9);
    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  return result;
}

uint64_t __CUIUncompressDeepmapImageData_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*((uint64_t (**)(void))objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2) + 2))();
}

void __CUIUncompressDeepmapImageData_block_invoke_cold_1()
{
  __assert_rtn("CUIUncompressDeepmapImageData_block_invoke", "CUIDeepmapCompression.m", 438, "status == kDeepmapStreamStatusEND");
}

@end
