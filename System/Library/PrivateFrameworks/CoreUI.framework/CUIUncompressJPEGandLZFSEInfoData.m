@implementation CUIUncompressJPEGandLZFSEInfoData

vImage_Error __CUIUncompressJPEGandLZFSEInfoData_block_invoke(uint64_t a1)
{
  vImage_Error result;

  result = vImageBuffer_InitWithCGImage((vImage_Buffer *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), (vImage_CGImageFormat *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), 0, *(CGImageRef *)(a1 + 56), 0x300u);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __CUIUncompressJPEGandLZFSEInfoData_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int v9;
  int v11;
  int v12;
  uint64_t v13;
  char v14;
  int v15;
  const uint8_t *v16;
  size_t Height;
  uint8_t *v18;
  size_t v19;

  v9 = *(_DWORD *)(a1 + 80);
  if ((v9 & 0x1Fu) > 6)
  {
    _CUILog(4, (uint64_t)"CoreUI: not expecting to get an AlphaOnly image don't know how to handle this", a3, a4, a5, a6, a7, a8, a9);
    return;
  }
  v11 = 1 << (v9 & 0x1F);
  if ((v11 & 0x2A) == 0)
  {
    if ((v11 & 0x54) == 0)
      return;
    v12 = v9 & 0x7000;
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (v12 != 0x2000)
      goto LABEL_5;
LABEL_7:
    v14 = 1;
    goto LABEL_8;
  }
  v15 = v9 & 0x7000;
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v15 != 0x2000)
    goto LABEL_7;
LABEL_5:
  v14 = 8;
LABEL_8:
  *(_BYTE *)(v13 + 24) = v14;
  v16 = (const uint8_t *)(*(_QWORD *)(a1 + 56) + 20);
  Height = CGImageGetHeight(*(CGImageRef *)(a1 + 64));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = malloc_type_malloc(Height* *(unsigned int *)(*(_QWORD *)(a1 + 72) + 12), 0x582AC792uLL);
  __CFSetLastAllocationEventName(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), "CUIUncompressJPEGandLZFSEInfoData");
  v18 = *(uint8_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v19 = CGImageGetHeight(*(CGImageRef *)(a1 + 64));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = compression_decode_buffer(v18, v19 * *(unsigned int *)(*(_QWORD *)(a1 + 72) + 12), v16, *(unsigned int *)(*(_QWORD *)(a1 + 72) + 8), 0, COMPRESSION_LZFSE);
}

uint64_t __CUIUncompressJPEGandLZFSEInfoData_block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*((uint64_t (**)(void))objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2) + 2))();
}

@end
