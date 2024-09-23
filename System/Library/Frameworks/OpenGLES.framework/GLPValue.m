@implementation GLPValue

uint64_t __deserialize_GLPValue_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v9;
  uint64_t Size;
  unsigned int v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int ScalarType;
  unsigned int ScalarCount;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42[2];

  v42[1] = *MEMORY[0x24BDAC8D0];
  v42[0] = (uint64_t)glpMakeMutableValue(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 240), *(unsigned int **)(a1 + 40), 0, a4, a5, a6, a7, a8, v42[0]);
  v9 = glpABIGetTypeSize(0, *(_QWORD *)(a1 + 40), 0);
  Size = glpTypeSizeGetSize(v9);
  v11 = Size;
  MEMORY[0x24BDAC7A8](Size);
  v13 = (char *)v42 - v12;
  glpTypeGetAppleVec4Types(*(unsigned int **)(a1 + 40), (uint64_t *)((char *)v42 - v12), 1, 0, 0, 0, 0, 0, 0);
  if (v11)
  {
    v14 = 0;
    v15 = v11;
    v16 = v42[0];
    do
    {
      ScalarType = glpPrimitiveTypeGetScalarType(*(unsigned int *)&v13[4 * v14]);
      ScalarCount = glpPrimitiveTypeGetScalarCount(*(unsigned int *)&v13[4 * v14]);
      v19 = ScalarCount;
      if (ScalarType <= 8)
      {
        if (ScalarType == 1)
        {
          if (ScalarCount)
          {
            v39 = 0;
            v40 = 4 * ScalarCount;
            do
            {
              *(float *)(v16 + v39) = deserialize_float(*(_QWORD *)(a1 + 32));
              v39 += 4;
            }
            while (v40 != v39);
          }
        }
        else
        {
          if (ScalarType != 5)
LABEL_38:
            abort();
          if (ScalarCount)
          {
            v25 = 0;
            v21 = *(_QWORD *)(a1 + 32);
            v26 = 4 * v19;
            while (1)
            {
              v27 = *(unsigned int *)(v21 + 260);
              if (v27 >= *(_DWORD *)(v21 + 256))
                break;
              v28 = *(_QWORD *)(v21 + 248);
              v29 = *(char *)(v28 + v27);
              v30 = *(unsigned __int8 *)(v28 + v27);
              *(_DWORD *)(v21 + 260) = v27 + 1;
              if (v29 < 0)
                __asm { BR              X17 }
              *(_DWORD *)(v16 + v25) = v30;
              v25 += 4;
              if (v26 == v25)
                goto LABEL_35;
            }
LABEL_37:
            glpDeserialError(v21, 1u);
          }
        }
      }
      else
      {
        switch(ScalarType)
        {
          case 62:
            if (ScalarCount)
            {
              v31 = 0;
              v32 = 8 * ScalarCount;
              do
              {
                *(double *)(v16 + v31) = deserialize_double(*(_QWORD *)(a1 + 32));
                v31 += 8;
              }
              while (v32 != v31);
            }
            break;
          case 36:
            if (ScalarCount)
            {
              v33 = 0;
              v21 = *(_QWORD *)(a1 + 32);
              v34 = 4 * v19;
              while (1)
              {
                v35 = *(unsigned int *)(v21 + 260);
                if (v35 >= *(_DWORD *)(v21 + 256))
                  goto LABEL_37;
                v36 = *(_QWORD *)(v21 + 248);
                v37 = *(char *)(v36 + v35);
                v38 = *(unsigned __int8 *)(v36 + v35);
                *(_DWORD *)(v21 + 260) = v35 + 1;
                if (v37 < 0)
                  __asm { BR              X17 }
                *(_DWORD *)(v16 + v33) = v38;
                v33 += 4;
                if (v34 == v33)
                  goto LABEL_35;
              }
            }
            break;
          case 9:
            if (ScalarCount)
            {
              v20 = 0;
              v21 = *(_QWORD *)(a1 + 32);
              v22 = 4 * v19;
              while (1)
              {
                v23 = *(unsigned int *)(v21 + 260);
                if (v23 >= *(_DWORD *)(v21 + 256))
                  goto LABEL_37;
                v24 = *(unsigned __int8 *)(*(_QWORD *)(v21 + 248) + v23);
                *(_DWORD *)(v21 + 260) = v23 + 1;
                *(_DWORD *)(v16 + v20) = v24 != 0;
                v20 += 4;
                if (v22 == v20)
                  goto LABEL_35;
              }
            }
            break;
          default:
            goto LABEL_38;
        }
      }
LABEL_35:
      ++v14;
      v16 += 16;
    }
    while (v14 != v15);
  }
  return v42[0];
}

@end
