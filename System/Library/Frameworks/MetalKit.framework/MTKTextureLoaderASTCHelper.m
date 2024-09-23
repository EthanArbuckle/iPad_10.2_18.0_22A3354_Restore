@implementation MTKTextureLoaderASTCHelper

+ (int64_t)isASTCHDRData:(id)a3 is3DBlocks:(BOOL)a4 error:(id *)a5
{
  id v7;
  uint64_t *v8;
  int64_t v9;
  _QWORD v11[5];
  BOOL v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v7 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __61__MTKTextureLoaderASTCHelper_isASTCHDRData_is3DBlocks_error___block_invoke;
  v11[3] = &unk_24C3D4DE8;
  v11[4] = &v13;
  v12 = a4;
  objc_msgSend(v7, "enumerateByteRangesUsingBlock:", v11);
  v8 = v14;
  if (a5 && v14[3] == -1)
  {
    _newMTKTextureErrorWithCodeAndErrorString(-1, (uint64_t)CFSTR("Could not load ASTC texture, data is malformed"));
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v14;
  }
  v9 = v8[3];
  _Block_object_dispose(&v13, 8);

  return v9;
}

unint64_t __61__MTKTextureLoaderASTCHelper_isASTCHDRData_is3DBlocks_error___block_invoke(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, _BYTE *a5)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  unsigned int v10;
  unint64_t v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  unsigned int v18;
  int16x8_t v19;
  uint64_t v20;
  __int16 *v21;
  uint64_t v22;
  unsigned int v23;
  BOOL v24;
  int v25;
  uint64_t v27;
  unint64_t v28;
  char v29;
  unsigned __int32 v30;
  __int16 v31;
  __int16 v32;
  __int16 v33;
  __int16 v34;
  __int128 v35;
  uint64_t v36;

  v6 = result;
  v36 = *MEMORY[0x24BDAC8D0];
  if ((a4 & 0xF) == 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = -1;
    *a5 = 1;
  }
  if (a4 < 0x10)
    return result;
  v7 = 0;
  v8 = 16;
  v27 = a2;
  v28 = a4;
  while (1)
  {
    v9 = *(_OWORD *)(a2 + v7);
    v7 = v8;
    v35 = v9;
    v10 = v9 | ((BYTE1(v9) & 7) << 8);
    if ((v9 | ((BYTE1(v9) & 7) << 8) & 0x1FF) == 0x1FC)
    {
      if ((BYTE1(v9) & 2) != 0)
        goto LABEL_41;
      goto LABEL_38;
    }
    v11 = ((unint64_t)BYTE1(v9) >> 3) & 3;
    if (!(_DWORD)v11)
    {
      v17 = ((BYTE1(v9) | (BYTE2(v35) << 8)) >> 5) & 0xF;
LABEL_15:
      v18 = v17 - 2;
      if (v18 < 0xE && ((0x3223u >> v18) & 1) != 0)
      {
LABEL_41:
        v20 = 1;
        goto LABEL_42;
      }
      goto LABEL_38;
    }
    v12 = BYTE3(v35);
    result = ((BYTE2(v35) | (BYTE3(v35) << 8)) >> 7) & 3;
    if (!(_DWORD)result)
    {
      v17 = (BYTE3(v35) >> 1) & 0xF;
      goto LABEL_15;
    }
    v13 = (BYTE1(v9) & 7) << 8;
    v14 = (v13 >> 9) & 1;
    v15 = v13 >> 10;
    v29 = ((BYTE2(v35) | (BYTE3(v35) << 8)) >> 7) & 3;
    if (!*(_BYTE *)(v6 + 40))
      break;
    v16 = (v9 >> 2) & 3;
    if ((v9 & 3) == 0)
    {
      if (v16)
        __asm { BR              X12 }
      goto LABEL_44;
    }
    result = ComputeSequenceLengthInBits((((v9 >> 5) & 3) + 2 + (((v9 >> 5) & 3) + 2) * v15)* (((v10 >> 7) & 3) + 2)* (v16 + 2), ((v9 >> 4) | 0xFFFFFFFE) + 2 * (v9 & 3) + 6 * v14);
    v20 = -1;
    if ((int)result < 8 || (int)result > 105)
      goto LABEL_42;
    if ((_DWORD)v11 == 3)
    {
      v19.i64[0] = *(_QWORD *)&vshl_u16((uint16x4_t)vdup_n_s16(v12), (uint16x4_t)0xFFFCFFFDFFFEFFFFLL) & 0xFF01FF01FF01FF01;
      v30 = vmovn_s16(v19).u32[0];
      v31 = (*(unsigned __int16 *)((char *)&v35 + ((120 - (int)result) >> 3)) >> ((120 - result) & 7)) & 3;
      v32 = (*(unsigned __int16 *)((char *)&v35 + ((122 - (int)result) >> 3)) >> ((122 - result) & 7)) & 3;
      v33 = (*(unsigned __int16 *)((char *)&v35 + ((124 - (int)result) >> 3)) >> ((124 - result) & 7)) & 3;
      v21 = &v34;
      a2 = v27;
      a4 = v28;
    }
    else
    {
      a2 = v27;
      a4 = v28;
      LOBYTE(v30) = (v12 & 2) != 0;
      BYTE1(v30) = (v12 & 4) != 0;
      if ((_DWORD)v11 == 2)
      {
        BYTE2(v30) = (v12 & 8) != 0;
        v31 = (v12 >> 4) & 1 | (2
                              * ((*(unsigned __int16 *)((char *)&v35 + ((123 - (int)result) >> 3)) >> ((123 - result) & 7)) & 1));
        v32 = (*(unsigned __int16 *)((char *)&v35 + ((124 - (int)result) >> 3)) >> ((124 - result) & 7)) & 3;
        v21 = &v33;
      }
      else
      {
        v31 = (v12 >> 3) & 3;
        v21 = &v32;
      }
    }
    v22 = 0;
    *v21 = (*(unsigned __int16 *)((char *)&v35 + ((126 - (int)result) >> 3)) >> ((126 - result) & 7)) & 3;
    do
    {
      v23 = (*(&v31 + v22) + 4 * (v29 + 63 + *((_BYTE *)&v30 + v22)));
      v24 = v23 > 0xF;
      v25 = (1 << v23) & 0xC88C;
      if (!v24 && v25 != 0)
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 32) + 8) + 24) = 1;
        *a5 = 1;
      }
      ++v22;
    }
    while (v11 + 1 != v22);
LABEL_38:
    if (!*a5)
    {
      v8 = v7 + 16;
      if (v7 + 16 <= a4)
        continue;
    }
    return result;
  }
  if ((v9 & 3) != 0)
    __asm { BR              X17 }
  if (((v9 >> 2) & 3) != 0)
    __asm { BR              X15 }
LABEL_44:
  v20 = -1;
LABEL_42:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 32) + 8) + 24) = v20;
  *a5 = 1;
  return result;
}

void __61__MTKTextureLoaderASTCHelper_isASTCHDRData_is3DBlocks_error___block_invoke_cold_1()
{
  __assert_rtn("+[MTKTextureLoaderASTCHelper isASTCHDRData:is3DBlocks:error:]_block_invoke", "MTKTextureLoaderASTCHelper.m", 502, "!\"Incorrect partition information\");
}

@end
