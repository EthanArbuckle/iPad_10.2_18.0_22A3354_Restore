@implementation RETextureLoaderASTCHelper

+ (int64_t)isASTCHDRData:(id)a3 textureType:(unint64_t)a4 error:(id *)a5
{
  uint64_t *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int64_t v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __61__RETextureLoaderASTCHelper_isASTCHDRData_textureType_error___block_invoke;
  v12[3] = &unk_24ED7D398;
  v12[4] = &v13;
  v12[5] = a4;
  objc_msgSend(a3, "enumerateByteRangesUsingBlock:", v12);
  v6 = v14;
  if (a5 && v14[3] == -1)
  {
    v7 = *MEMORY[0x24BDD0FC8];
    v17[0] = CFSTR("MTKTextureLoaderErrorKey");
    v17[1] = v7;
    v18[0] = CFSTR("Could not load ASTC texture, data is malformed");
    v18[1] = CFSTR("Could not load ASTC texture, data is malformed");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("MTKTextureLoaderErrorDomain"), -1, v8);

    *a5 = v9;
    v6 = v14;
  }
  v10 = v6[3];
  _Block_object_dispose(&v13, 8);
  return v10;
}

uint64_t __61__RETextureLoaderASTCHelper_isASTCHDRData_textureType_error___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, _BYTE *a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int16x8_t v8;
  unsigned int v9;
  unint64_t v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  int v17;
  int v18;
  unint64_t v19;
  unsigned __int8 *v20;
  unsigned int v21;
  int v22;
  unsigned __int8 *v23;
  unsigned int v24;
  int v25;
  uint64_t v26;
  unsigned int v27;
  BOOL v28;
  int v29;
  unsigned __int8 *v31;
  int v32;
  int v33;
  unsigned __int8 *v34;
  unsigned int v35;
  int v36;
  unsigned __int8 *v37;
  unsigned int v38;
  int v39;
  unsigned __int8 *v40;
  unsigned int v41;
  int v42;
  unint64_t v43;
  unsigned __int8 *v44;
  unsigned int v45;
  int v46;
  unint64_t v47;
  unsigned __int8 *v48;
  unsigned int v49;
  int v50;
  unsigned __int32 v51;
  __int16 v52;
  __int16 v53;
  __int16 v54;
  __int16 v55;
  int16x8_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  if ((a4 & 0xF) != 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = -1;
    *a5 = 1;
  }
  v5 = 0;
  v6 = 1;
  do
  {
    v7 = v5 + 16;
    if (v5 + 16 > a4)
      break;
    v8 = *(int16x8_t *)(a2 + v5);
    v56 = v8;
    v9 = v56.u8[0] | ((v56.i8[1] & 7) << 8);
    if ((v56.u8[0] | ((v56.i8[1] & 7) << 8) & 0x1FF) == 0x1FC)
    {
      if ((v56.i8[1] & 2) != 0)
        goto LABEL_83;
      goto LABEL_57;
    }
    v10 = ((unint64_t)v56.u8[1] >> 3) & 3;
    if (!(_DWORD)v10)
    {
      v14 = ((v56.u8[1] | (v56.u8[2] << 8)) >> 5) & 0xF;
LABEL_15:
      v15 = v14 - 2;
      if (v15 < 0xE && ((0x3223u >> v15) & 1) != 0)
        goto LABEL_83;
      goto LABEL_57;
    }
    v11 = ((v56.u8[2] | (v56.u8[3] << 8)) >> 7) & 3;
    if (!v11)
    {
      v14 = (v56.u8[3] >> 1) & 0xF;
      goto LABEL_15;
    }
    v12 = (v56.i8[1] & 7) << 8;
    if (*(_QWORD *)(result + 40) != 7)
    {
      if ((v56.i8[0] & 3) != 0)
        __asm { BR              X25 }
      if (((v56.u8[0] >> 2) & 3) != 0)
        __asm { BR              X19 }
      goto LABEL_82;
    }
    if ((v56.i8[0] & 3) == 0)
    {
      if (((v56.u8[0] >> 2) & 3) != 0)
        __asm { BR              X19 }
LABEL_82:
      v6 = -1;
LABEL_83:
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = v6;
      *a5 = 1;
      return result;
    }
    v13 = (((v56.u8[0] >> 5) & 3) + 2 + (((v56.u8[0] >> 5) & 3) + 2) * (v12 >> 10))
        * (((v9 >> 7) & 3) + 2)
        * (((v56.u8[0] >> 2) & 3) + 2);
    switch(((v56.u8[0] >> 4) | 0xFFFFFFFE) + 6 * ((v12 >> 9) & 1) + 2 * (v56.i8[0] & 3))
    {
      case 0u:
        goto LABEL_39;
      case 1u:
        v16 = 13108 * ((8 * v13) | 4);
        goto LABEL_35;
      case 2u:
        v13 *= 2;
        goto LABEL_39;
      case 3u:
        v16 = 152922 * v13 + 43692;
        goto LABEL_35;
      case 4u:
        v17 = 13;
        goto LABEL_37;
      case 5u:
        v13 *= 3;
        goto LABEL_39;
      case 6u:
        v18 = 218460;
        goto LABEL_34;
      case 7u:
        v17 = 18;
        goto LABEL_37;
      case 8u:
        v13 *= 4;
        goto LABEL_39;
      case 9u:
        v18 = 283998;
LABEL_34:
        v16 = v13 * v18 + 43692;
LABEL_35:
        v13 = HIWORD(v16);
        goto LABEL_39;
      case 0xAu:
        v17 = 23;
LABEL_37:
        v13 = (26215 * (v13 * v17 + 4)) >> 17;
        goto LABEL_39;
      case 0xBu:
        v13 *= 5;
LABEL_39:
        if (v13 - 129 < 0xFFFFFF80)
          goto LABEL_82;
        if ((_DWORD)v10 == 3)
        {
          if (v13 >= 0x79)
            goto LABEL_49;
          v8.i64[0] = *(_QWORD *)&vshl_u16((uint16x4_t)vdup_n_s16(v56.u8[3]), (uint16x4_t)0xFFFCFFFDFFFEFFFFLL) & 0xFF01FF01FF01FF01;
          v51 = vmovn_s16(v8).u32[0];
          v23 = &v56.u8[(unint64_t)(120 - v13) >> 3];
          v24 = (120 - (_BYTE)v13) & 7;
          if (v24 >= 6)
            v25 = v23[1] << 8;
          else
            v25 = 0;
          v52 = ((v25 | *v23) >> v24) & 3;
          v34 = &v56.u8[(unint64_t)(122 - v13) >> 3];
          v35 = (122 - (_BYTE)v13) & 7;
          if (v35 >= 6)
            v36 = v34[1] << 8;
          else
            v36 = 0;
          v53 = ((v36 | *v34) >> v35) & 3;
          v40 = &v56.u8[(unint64_t)(124 - v13) >> 3];
          v41 = (124 - (_BYTE)v13) & 7;
          if (v41 >= 6)
            v42 = v40[1] << 8;
          else
            v42 = 0;
          v54 = ((v42 | *v40) >> v41) & 3;
          v47 = 126 - v13;
          v48 = &v56.u8[v47 >> 3];
          v49 = v47 & 7;
          if (v49 >= 6)
            v50 = v48[1] << 8;
          else
            v50 = 0;
          v55 = ((v50 | *v48) >> v49) & 3;
        }
        else if ((_DWORD)v10 == 2)
        {
          if (v13 >= 0x7C)
          {
LABEL_49:
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = -1;
            *a5 = 1;
            goto LABEL_50;
          }
          LOBYTE(v51) = (v56.i8[3] & 2) != 0;
          BYTE1(v51) = (v56.i8[3] & 4) != 0;
          BYTE2(v51) = (v56.i8[3] & 8) != 0;
          v31 = &v56.u8[(unint64_t)(123 - v13) >> 3];
          v32 = (123 - (_BYTE)v13) & 7;
          if (v32 == 7)
            v33 = v31[1] << 8;
          else
            v33 = 0;
          v52 = ((v56.i8[3] & 0x10) != 0) | (unsigned __int16)(2 * (((v33 | *v31) >> v32) & 1));
          v37 = &v56.u8[(unint64_t)(124 - v13) >> 3];
          v38 = (124 - (_BYTE)v13) & 7;
          if (v38 >= 6)
            v39 = v37[1] << 8;
          else
            v39 = 0;
          v53 = ((v39 | *v37) >> v38) & 3;
          v43 = 126 - v13;
          v44 = &v56.u8[v43 >> 3];
          v45 = v43 & 7;
          if (v45 >= 6)
            v46 = v44[1] << 8;
          else
            v46 = 0;
          v54 = ((v46 | *v44) >> v45) & 3;
        }
        else
        {
          if (v13 >= 0x7F)
            goto LABEL_49;
          LOBYTE(v51) = (v56.i8[3] & 2) != 0;
          BYTE1(v51) = (v56.i8[3] & 4) != 0;
          v52 = (v56.i8[3] >> 3) & 3;
          v19 = 126 - v13;
          v20 = &v56.u8[v19 >> 3];
          v21 = v19 & 7;
          if (v21 >= 6)
            v22 = v20[1] << 8;
          else
            v22 = 0;
          v53 = ((v22 | *v20) >> v21) & 3;
        }
LABEL_50:
        v26 = 0;
        do
        {
          v27 = (*(&v52 + v26) + 4 * (v11 + 63 + *((_BYTE *)&v51 + v26)));
          v28 = v27 > 0xF;
          v29 = (1 << v27) & 0xC88C;
          if (!v28 && v29 != 0)
          {
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
            *a5 = 1;
          }
          ++v26;
        }
        while (v10 + 1 != v26);
        break;
      default:
        goto LABEL_82;
    }
LABEL_57:
    v5 = v7;
  }
  while (!*a5);
  return result;
}

@end
