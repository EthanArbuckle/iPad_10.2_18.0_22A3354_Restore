@implementation ZN8Espresso19spmv

_QWORD *___ZN8Espresso19spmv_sparseblock4x4IffLi0EEEvPKNS_5vec16IT_EEPKNS_4vec4IT0_EEPS8_PKtSD_mm_block_invoke(_QWORD *result, uint64_t a2)
{
  unsigned __int16 *v2;
  uint64_t v3;
  uint64_t v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float *v9;
  uint64_t v10;
  unsigned __int16 *v11;
  unsigned int v12;
  float *v13;
  float v14;
  float v15;
  float v16;
  float *v17;

  v2 = (unsigned __int16 *)(result[4] + 2 * a2);
  v3 = *v2;
  v4 = v2[1];
  v5 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  v8 = 0.0;
  if (v3 < v4)
  {
    v9 = (float *)(result[5] + (v3 << 6));
    v10 = v4 - v3;
    v11 = (unsigned __int16 *)(result[6] + 2 * v3);
    do
    {
      v12 = *v11++;
      v13 = (float *)(result[7] + 16 * v12);
      v14 = v13[1];
      v15 = v13[2];
      v16 = v13[3];
      v5 = (float)((float)((float)(v5 + (float)(*v9 * *v13)) + (float)(v9[1] * v14)) + (float)(v9[2] * v15))
         + (float)(v9[3] * v16);
      v6 = (float)((float)((float)(v6 + (float)(v9[4] * *v13)) + (float)(v9[5] * v14)) + (float)(v9[6] * v15))
         + (float)(v9[7] * v16);
      v7 = (float)((float)((float)(v7 + (float)(v9[8] * *v13)) + (float)(v9[9] * v14)) + (float)(v9[10] * v15))
         + (float)(v9[11] * v16);
      v8 = (float)((float)((float)(v8 + (float)(v9[12] * *v13)) + (float)(v9[13] * v14)) + (float)(v9[14] * v15))
         + (float)(v9[15] * v16);
      v9 += 16;
      --v10;
    }
    while (v10);
  }
  v17 = (float *)(result[8] + 16 * a2);
  *v17 = v5;
  v17[1] = v6;
  v17[2] = v7;
  v17[3] = v8;
  return result;
}

_QWORD *___ZN8Espresso19spmv_sparseblock4x4IDF16_fLi0EEEvPKNS_5vec16IT_EEPKNS_4vec4IT0_EEPS8_PKtSD_mm_block_invoke(_QWORD *result, uint64_t a2)
{
  unsigned __int16 *v2;
  uint64_t v3;
  uint64_t v4;
  float v5;
  float v6;
  float v7;
  float v8;
  __int16 *v9;
  uint64_t v10;
  unsigned __int16 *v11;
  unsigned int v12;
  float *v29;
  float v30;
  float v31;
  float v32;
  float v38;
  float v40;
  float v42;
  float v45;
  float v47;
  float v49;
  float v52;
  float v54;
  float v56;
  float v59;
  float v61;
  float v63;
  float *v65;

  v2 = (unsigned __int16 *)(result[4] + 2 * a2);
  v3 = *v2;
  v4 = v2[1];
  v5 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  v8 = 0.0;
  if (v3 < v4)
  {
    v9 = (__int16 *)(result[5] + 32 * v3);
    v10 = v4 - v3;
    v11 = (unsigned __int16 *)(result[6] + 2 * v3);
    do
    {
      v12 = *v11++;
      _H4 = *v9;
      _H5 = v9[1];
      _H6 = v9[2];
      _H7 = v9[3];
      _H16 = v9[4];
      _H17 = v9[5];
      _H18 = v9[6];
      _H19 = v9[7];
      _H20 = v9[8];
      _H21 = v9[9];
      _H22 = v9[10];
      _H23 = v9[11];
      _H24 = v9[12];
      _H25 = v9[13];
      _H26 = v9[14];
      _H27 = v9[15];
      v29 = (float *)(result[7] + 16 * v12);
      v30 = v29[1];
      v31 = v29[2];
      v32 = v29[3];
      __asm { FCVT            S4, H4 }
      v38 = v5 + (float)(_S4 * *v29);
      __asm { FCVT            S4, H5 }
      v40 = v38 + (float)(_S4 * v30);
      __asm { FCVT            S4, H6 }
      v42 = v40 + (float)(_S4 * v31);
      __asm { FCVT            S4, H7 }
      v5 = v42 + (float)(_S4 * v32);
      __asm { FCVT            S4, H16 }
      v45 = v6 + (float)(_S4 * *v29);
      __asm { FCVT            S4, H17 }
      v47 = v45 + (float)(_S4 * v30);
      __asm { FCVT            S4, H18 }
      v49 = v47 + (float)(_S4 * v31);
      __asm { FCVT            S4, H19 }
      v6 = v49 + (float)(_S4 * v32);
      __asm { FCVT            S4, H20 }
      v52 = v7 + (float)(_S4 * *v29);
      __asm { FCVT            S4, H21 }
      v54 = v52 + (float)(_S4 * v30);
      __asm { FCVT            S4, H22 }
      v56 = v54 + (float)(_S4 * v31);
      __asm { FCVT            S4, H23 }
      v7 = v56 + (float)(_S4 * v32);
      __asm { FCVT            S4, H24 }
      v59 = v8 + (float)(_S4 * *v29);
      __asm { FCVT            S4, H25 }
      v61 = v59 + (float)(_S4 * v30);
      __asm { FCVT            S4, H26 }
      v63 = v61 + (float)(_S4 * v31);
      __asm { FCVT            S4, H27 }
      v8 = v63 + (float)(_S4 * v32);
      v9 += 16;
      --v10;
    }
    while (v10);
  }
  v65 = (float *)(result[8] + 16 * a2);
  *v65 = v5;
  v65[1] = v6;
  v65[2] = v7;
  v65[3] = v8;
  return result;
}

@end
