@implementation CreateColorAttributesForColorSpace

uint64_t __CreateColorAttributesForColorSpace_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  int v6;

  if (*(_QWORD *)(a2 + 36) != 1)
    return 0;
  if (*(uint64_t *)(a2 + 44) > 0)
    return 0;
  v3 = *(_QWORD *)(a2 + 28);
  if (v3 > 1)
    return 0;
  if (!v3)
    goto LABEL_8;
  CGColorTRCGetFunction();
  if (v6 == 5)
    return 0;
  if (!*(_QWORD *)(a2 + 28))
LABEL_8:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *MEMORY[0x1E0CA8EB8];
  return 1;
}

BOOL __CreateColorAttributesForColorSpace_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v10;
  uint64_t v11;
  int v12;

  v6 = *a5;
  if (a4 >= 2)
  {
    if (a5[1] != v6)
      return 0;
    v7 = 2;
    while (a4 != v7)
    {
      v8 = a5[v7++];
      if (v8 != v6)
        return v7 - 1 >= a4;
    }
  }
  CGColorTRCGetFunction();
  switch(CGColorTRCGetGammaID())
  {
    case 0u:
      if (!CGColorTRCPureGammaOriginal())
        goto LABEL_11;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *MEMORY[0x1E0CA8ED8];
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      return 1;
    case 1u:
      v10 = (_QWORD *)MEMORY[0x1E0CA8EE0];
      goto LABEL_20;
    case 2u:
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *MEMORY[0x1E0CA8ED8];
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v12 = 1074580685;
      goto LABEL_18;
    case 3u:
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *MEMORY[0x1E0CA8ED8];
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v12 = 1072064102;
LABEL_18:
      *(_DWORD *)(v11 + 24) = v12;
      return 1;
    case 7u:
      v10 = (_QWORD *)MEMORY[0x1E0CA8EB8];
      goto LABEL_20;
    case 8u:
      v10 = (_QWORD *)MEMORY[0x1E0CA8EC8];
      goto LABEL_20;
    case 0xAu:
      v10 = (_QWORD *)MEMORY[0x1E0CA8EA8];
      goto LABEL_20;
    case 0xEu:
      v10 = (_QWORD *)MEMORY[0x1E0CA8EB0];
LABEL_20:
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *v10;
      break;
    default:
LABEL_11:
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      break;
  }
  return 1;
}

uint64_t __CreateColorAttributesForColorSpace_block_invoke_3(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  _BOOL4 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  CGColorMatrixGetMatrix();
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  if (near_matrix((float *)&v6, flt_192499AA4))
  {
    v2 = (uint64_t *)MEMORY[0x1E0CA8D88];
LABEL_7:
    v3 = *v2;
    goto LABEL_8;
  }
  v6 = v9;
  v7 = v10;
  v8 = v11;
  if (near_matrix((float *)&v6, flt_192499AD4))
  {
    v2 = (uint64_t *)MEMORY[0x1E0CA8D98];
    goto LABEL_7;
  }
  v6 = v9;
  v7 = v10;
  v8 = v11;
  if (near_matrix((float *)&v6, flt_192499B04))
  {
    v2 = (uint64_t *)MEMORY[0x1E0CA8D80];
    goto LABEL_7;
  }
  v6 = v9;
  v7 = v10;
  v8 = v11;
  v5 = near_matrix((float *)&v6, flt_192499B34);
  v3 = *MEMORY[0x1E0CA8D70];
  if (!v5)
    v3 = 0;
LABEL_8:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
  return 1;
}

uint64_t __CreateColorAttributesForColorSpace_block_invoke_4()
{
  return 0;
}

@end
