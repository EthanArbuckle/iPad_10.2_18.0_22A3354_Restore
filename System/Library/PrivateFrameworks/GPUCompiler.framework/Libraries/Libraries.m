__n128 MTLGPUCompilerHashFunctionScript(int *a1)
{
  uint64_t v2;
  unsigned __int16 *v3;
  unsigned int v4;
  int *v5;
  unsigned __int16 *v6;
  unsigned int v7;
  unsigned __int16 *v8;
  unsigned __int16 *v9;
  unsigned __int16 *v10;
  unsigned __int16 *v11;
  char *v12;
  __n128 *v13;
  __n128 result;
  uint64_t v15;
  char *v16;
  __n128 v17;
  __n128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v2 = operator new();
  *(_OWORD *)v2 = 0u;
  *(_OWORD *)(v2 + 16) = 0u;
  *(_OWORD *)(v2 + 32) = 0u;
  *(_OWORD *)(v2 + 48) = 0u;
  *(_OWORD *)(v2 + 64) = 0u;
  *(_OWORD *)(v2 + 80) = 0u;
  *(_QWORD *)(v2 + 96) = 0;
  v15 = v2;
  CC_SHA256_Init((CC_SHA256_CTX *)v2);
  v16 = 0;
  v3 = (unsigned __int16 *)((char *)a1 - *a1);
  v4 = *v3;
  if (v4 >= 9 && v3[4])
  {
    switch(*((_BYTE *)a1 + v3[4]))
    {
      case 1:
        if (v4 < 0xB)
        {
          v5 = 0;
        }
        else
        {
          v5 = (int *)v3[5];
          if (v5)
            v5 = (int *)((char *)v5 + (_QWORD)a1 + *(unsigned int *)((char *)v5 + (_QWORD)a1));
        }
        v8 = (unsigned __int16 *)((char *)v5 - *v5);
        if (*v8 >= 0x2Du)
        {
          v7 = v8[22];
          if (v7)
            goto LABEL_38;
        }
        goto LABEL_39;
      case 2:
        if (v4 < 0xB)
        {
          v5 = 0;
        }
        else
        {
          v5 = (int *)v3[5];
          if (v5)
            v5 = (int *)((char *)v5 + (_QWORD)a1 + *(unsigned int *)((char *)v5 + (_QWORD)a1));
        }
        v9 = (unsigned __int16 *)((char *)v5 - *v5);
        if (*v9 < 0x37u)
          goto LABEL_39;
        v7 = v9[27];
        if (!v7)
          goto LABEL_39;
        goto LABEL_38;
      case 3:
      case 4:
        if (v4 < 0xB)
        {
          v5 = 0;
        }
        else
        {
          v5 = (int *)v3[5];
          if (v5)
            v5 = (int *)((char *)v5 + (_QWORD)a1 + *(unsigned int *)((char *)v5 + (_QWORD)a1));
        }
        v6 = (unsigned __int16 *)((char *)v5 - *v5);
        if (*v6 < 0x17u)
          goto LABEL_39;
        v7 = v6[11];
        if (!v7)
          goto LABEL_39;
        goto LABEL_38;
      case 7:
        if (v4 < 0xB)
        {
          v5 = 0;
        }
        else
        {
          v5 = (int *)v3[5];
          if (v5)
            v5 = (int *)((char *)v5 + (_QWORD)a1 + *(unsigned int *)((char *)v5 + (_QWORD)a1));
        }
        v10 = (unsigned __int16 *)((char *)v5 - *v5);
        if (*v10 < 0x1Du)
          goto LABEL_39;
        v7 = v10[14];
        if (!v7)
          goto LABEL_39;
        goto LABEL_38;
      case 8:
        if (v4 < 0xB)
        {
          v5 = 0;
        }
        else
        {
          v5 = (int *)v3[5];
          if (v5)
            v5 = (int *)((char *)v5 + (_QWORD)a1 + *(unsigned int *)((char *)v5 + (_QWORD)a1));
        }
        v11 = (unsigned __int16 *)((char *)v5 - *v5);
        if (*v11 >= 0x1Fu && (v7 = v11[15]) != 0)
LABEL_38:
          v12 = (char *)v5 + v7 + *(int *)((char *)v5 + v7);
        else
LABEL_39:
          v12 = 0;
        v16 = v12;
        break;
      default:
        break;
    }
  }
  sub_22A711D30((char *)&v17, (uint64_t)&v15);
  MEMORY[0x22E2E0410](v2, 0x1000C40ED882C02);
  v13 = (__n128 *)malloc_type_malloc(0x20uLL, 0x100004077774924uLL);
  result = v18;
  *v13 = v17;
  v13[1] = result;
  return result;
}

char *sub_22A711D30(char *result, uint64_t a2)
{
  unsigned __int8 *v2;
  int *v3;
  unsigned __int16 *v4;
  unsigned int v5;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  _BOOL4 v20;
  BOOL v21;
  unsigned int *v22;
  int *v23;
  unsigned __int16 *v24;
  uint64_t v25;
  unsigned int *v26;
  int *v27;
  unsigned __int16 *v28;
  uint64_t v29;
  unsigned int *v30;
  uint64_t v31;
  int **v32;
  uint64_t v33;
  unsigned int *v34;
  unsigned int v35;
  int **v36;
  unsigned int *v37;
  int **v38;
  int **v39;
  int *v40;
  unsigned __int16 *v41;
  uint64_t v42;
  int **v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  char *v47;
  int **v48;
  int *v49;
  int **v50;
  int **v51;
  int **v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  int *v56;
  unsigned __int16 *v57;
  uint64_t v58;
  unsigned int *v59;
  uint64_t v60;
  __n128 *v61;
  char *v62;
  unsigned __int16 *v63;
  uint64_t v64;
  unsigned int *v65;
  uint64_t v66;
  unsigned int *v67;
  unsigned int v68;
  __n128 *v69;
  unsigned int *v70;
  unsigned int *v71;
  _DWORD *v72;
  unint64_t v73;
  unsigned int v74;
  __n128 *v75;
  __n128 *v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  unint64_t v80;
  char *v81;
  __n128 *v82;
  __n128 *v83;
  __n128 *v84;
  __n128 *v85;
  unint64_t v86;
  uint64_t v87;
  __n128 *v88;
  const void *v89;
  uint64_t v90;
  unsigned __int8 *md;
  int **__p;
  int **v93;
  __n128 *data;
  __n128 *v95;
  __n128 *v96;
  uint64_t v97;

  v2 = (unsigned __int8 *)result;
  v3 = *(int **)(a2 + 8);
  if (!v3)
    goto LABEL_23;
  v4 = (unsigned __int16 *)((char *)v3 - *v3);
  v5 = *v4;
  if (v5 < 5)
    goto LABEL_23;
  v7 = v4[2];
  if (v4[2])
    v8 = *(int *)((char *)v3 + v7 + *(unsigned int *)((char *)v3 + v7));
  else
    v8 = 0;
  if (v5 < 7)
  {
    LODWORD(v9) = 0;
LABEL_20:
    v21 = 0;
    goto LABEL_21;
  }
  v9 = v4[3];
  if (v4[3])
    LODWORD(v9) = *(int *)((char *)v3 + v9 + *(unsigned int *)((char *)v3 + v9));
  if (v5 < 9)
    goto LABEL_20;
  v10 = v4[4];
  if (!v4[4])
    goto LABEL_20;
  v11 = *(unsigned int *)((char *)v3 + v10);
  v12 = (unsigned int *)((char *)v3 + v10 + v11);
  v13 = *v12;
  if (!(_DWORD)v13)
    goto LABEL_20;
  v14 = 0;
  v15 = 0;
  v16 = 4 * v13;
  v17 = (char *)v3 + v10 + v11;
  do
  {
    v18 = v12[v14 / 4 + 1];
    result = &v17[v14 + v18 - *(int *)((char *)&v12[v14 / 4 + 1] + v18)];
    if (*((unsigned __int16 *)result + 2) >= 5u && (result = (char *)*((unsigned __int16 *)result + 4)) != 0)
    {
      v19 = &result[v18];
      result = (char *)*(unsigned int *)&v17[v14 + 4 + (_QWORD)v19];
      v20 = *(_DWORD *)&v19[(_QWORD)v17 + 4 + v14 + (unint64_t)result] != 0;
    }
    else
    {
      v20 = 0;
    }
    v15 += v20;
    v14 += 4;
  }
  while (v16 != v14);
  v21 = v15 != 0;
LABEL_21:
  if (!(v8 + (_DWORD)v9) && !v21)
  {
LABEL_23:
    *(_OWORD *)v2 = 0u;
    *((_OWORD *)v2 + 1) = 0u;
    return result;
  }
  if ((_DWORD)v7)
    v22 = (unsigned int *)((char *)v3 + v7 + *(unsigned int *)((char *)v3 + v7));
  else
    v22 = 0;
  sub_22A7129B0((CC_SHA256_CTX **)a2, v22);
  v23 = *(int **)(a2 + 8);
  v24 = (unsigned __int16 *)((char *)v23 - *v23);
  if (*v24 >= 7u && (v25 = v24[3]) != 0)
    v26 = (unsigned int *)((char *)v23 + v25 + *(unsigned int *)((char *)v23 + v25));
  else
    v26 = 0;
  sub_22A7129B0((CC_SHA256_CTX **)a2, v26);
  v27 = *(int **)(a2 + 8);
  v28 = (unsigned __int16 *)((char *)v27 - *v27);
  md = v2;
  if (*v28 >= 9u && (v29 = v28[4]) != 0)
  {
    v30 = (unsigned int *)((char *)v27 + v29 + *(unsigned int *)((char *)v27 + v29));
    v31 = *v30;
    if ((_DWORD)v31)
    {
      v32 = (int **)operator new(8 * v31);
      v35 = *v30;
      v34 = v30 + 1;
      v33 = v35;
      if (v35)
      {
        v36 = v32;
        v37 = &v34[v33];
        v38 = &v32[v31];
        do
        {
          v39 = v32;
          v40 = (int *)((char *)v34 + *v34);
          v41 = (unsigned __int16 *)((char *)v40 - *v40);
          if (*v41 >= 5u && (v42 = v41[2]) != 0 && *(int *)((char *)v40 + v42 + *(unsigned int *)((char *)v40 + v42)))
          {
            if (v36 >= v38)
            {
              v44 = v36 - v32;
              v45 = v44 + 1;
              if ((unint64_t)(v44 + 1) >> 61)
LABEL_111:
                abort();
              if (((char *)v38 - (char *)v32) >> 2 > v45)
                v45 = ((char *)v38 - (char *)v32) >> 2;
              if ((unint64_t)((char *)v38 - (char *)v32) >= 0x7FFFFFFFFFFFFFF8)
                v46 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v46 = v45;
              if (v46)
              {
                if (v46 >> 61)
LABEL_112:
                  sub_22A712DB0();
                v47 = (char *)operator new(8 * v46);
              }
              else
              {
                v47 = 0;
              }
              v48 = (int **)&v47[8 * v44];
              *v48 = v40;
              v43 = v48 + 1;
              while (v36 != v39)
              {
                v49 = *--v36;
                *--v48 = v49;
              }
              v38 = (int **)&v47[8 * v46];
              if (v39)
              {
                v50 = v43;
                operator delete(v39);
                v43 = v50;
              }
              v32 = v48;
            }
            else
            {
              *v36 = v40;
              v43 = v36 + 1;
            }
          }
          else
          {
            v43 = v36;
          }
          ++v34;
          v36 = v43;
        }
        while (v34 != v37);
      }
      else
      {
        v43 = v32;
      }
    }
    else
    {
      v32 = 0;
      v43 = 0;
    }
    v53 = v43 - v32;
    v51 = v32;
    v54 = 126 - 2 * __clz(v53);
    if (v43 == v32)
      v55 = 0;
    else
      v55 = v54;
    v52 = v43;
    sub_22A713D44((uint64_t)v32, v43, v55, 1);
  }
  else
  {
    v51 = 0;
    v52 = 0;
    v53 = 0;
  }
  data = (__n128 *)v53;
  CC_SHA256_Update(*(CC_SHA256_CTX **)a2, &data, 8u);
  __p = v51;
  if (v51 != v52)
  {
    v93 = v52;
    do
    {
      v56 = *v51;
      v57 = (unsigned __int16 *)((char *)*v51 - **v51);
      if (*v57 >= 5u && (v58 = v57[2]) != 0)
      {
        v59 = (unsigned int *)((char *)v56 + v58);
        v60 = *v59;
        v62 = (char *)v59 + v60 + 4;
        v61 = (__n128 *)*(unsigned int *)((char *)v59 + v60);
      }
      else
      {
        v61 = 0;
        v62 = 0;
      }
      data = v61;
      CC_SHA256_Update(*(CC_SHA256_CTX **)a2, &data, 8u);
      CC_SHA256_Update(*(CC_SHA256_CTX **)a2, v62, (CC_LONG)v61);
      v63 = (unsigned __int16 *)((char *)v56 - *v56);
      if (*v63 >= 7u && (v64 = v63[3]) != 0)
      {
        v65 = (unsigned int *)((char *)v56 + v64 + *(unsigned int *)((char *)v56 + v64));
        data = 0;
        v95 = 0;
        v96 = 0;
        sub_22A712D0C((uint64_t)&data, *v65);
        v68 = *v65;
        v67 = v65 + 1;
        v66 = v68;
        v69 = v95;
        if (v68)
        {
          v70 = &v67[v66];
          do
          {
            v71 = (unsigned int *)((char *)v67 + *v67);
            v74 = *v71;
            v72 = v71 + 1;
            v73 = v74;
            if (v69 >= v96)
            {
              v76 = data;
              v77 = v69 - data;
              v78 = v77 + 1;
              if ((unint64_t)(v77 + 1) >> 60)
                goto LABEL_111;
              v79 = (char *)v96 - (char *)data;
              if (((char *)v96 - (char *)data) >> 3 > v78)
                v78 = v79 >> 3;
              if ((unint64_t)v79 >= 0x7FFFFFFFFFFFFFF0)
                v80 = 0xFFFFFFFFFFFFFFFLL;
              else
                v80 = v78;
              if (v80)
              {
                if (v80 >> 60)
                  goto LABEL_112;
                v81 = (char *)operator new(16 * v80);
              }
              else
              {
                v81 = 0;
              }
              v82 = (__n128 *)&v81[16 * v77];
              v82->n128_u64[0] = (unint64_t)v72;
              v82->n128_u64[1] = v73;
              v83 = v82;
              if (v69 != v76)
              {
                do
                {
                  v83[-1] = v69[-1];
                  --v83;
                  --v69;
                }
                while (v69 != v76);
                v69 = data;
              }
              v75 = v82 + 1;
              data = v83;
              v95 = v82 + 1;
              v96 = (__n128 *)&v81[16 * v80];
              if (v69)
                operator delete(v69);
            }
            else
            {
              v69->n128_u64[0] = (unint64_t)v72;
              v69->n128_u64[1] = v73;
              v75 = v69 + 1;
            }
            v95 = v75;
            ++v67;
            v69 = v75;
          }
          while (v67 != v70);
        }
        else
        {
          v75 = v95;
        }
        v86 = 126 - 2 * __clz(v75 - data);
        if (v75 == data)
          v87 = 0;
        else
          v87 = v86;
        sub_22A712DBC(data, v75, v87, 1);
        v84 = data;
        v85 = v95;
      }
      else
      {
        v84 = 0;
        v85 = 0;
      }
      v97 = v85 - v84;
      CC_SHA256_Update(*(CC_SHA256_CTX **)a2, &v97, 8u);
      v88 = v84;
      while (v88 != v85)
      {
        v89 = (const void *)v88->n128_u64[0];
        v90 = v88->n128_i64[1];
        ++v88;
        v97 = v90;
        CC_SHA256_Update(*(CC_SHA256_CTX **)a2, &v97, 8u);
        CC_SHA256_Update(*(CC_SHA256_CTX **)a2, v89, v90);
      }
      if (v84)
        operator delete(v84);
      ++v51;
    }
    while (v51 != v93);
  }
  if (__p)
    operator delete(__p);
  return (char *)CC_SHA256_Final(md, *(CC_SHA256_CTX **)a2);
}

__n128 MTLGPUCompilerHashComputePipelineScript(int *a1)
{
  __n128 *v1;
  __n128 result;
  uint64_t v3[2];
  __n128 v4;
  __n128 v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 0u;
  v5 = 0u;
  sub_22A7123C8(v3, a1, 0);
  sub_22A711D30((char *)&v4, (uint64_t)v3);
  if (v3[0])
    MEMORY[0x22E2E0410](v3[0], 0x1000C40ED882C02);
  v1 = (__n128 *)malloc_type_malloc(0x20uLL, 0x100004077774924uLL);
  result = v5;
  *v1 = v4;
  v1[1] = result;
  return result;
}

uint64_t *sub_22A7123C8(uint64_t *a1, int *a2, unsigned int a3)
{
  uint64_t v6;
  unsigned __int16 *v7;
  unsigned int v8;
  int *v9;
  int *v10;
  int *v11;
  unsigned __int16 *v12;
  uint64_t v13;
  int *v14;
  unsigned __int16 *v15;
  unsigned int v16;
  int *v17;
  int *v18;
  unsigned __int16 *v19;
  uint64_t v20;
  unsigned __int16 *v21;
  unsigned __int16 *v22;
  uint64_t v23;
  unsigned __int16 *v24;
  uint64_t v25;
  unsigned __int16 *v26;
  unsigned __int16 *v27;
  unsigned __int16 *v28;
  unsigned __int16 *v29;
  uint64_t v30;
  unsigned __int16 *v31;
  char *v32;

  v6 = operator new();
  *(_OWORD *)v6 = 0u;
  *(_OWORD *)(v6 + 16) = 0u;
  *(_OWORD *)(v6 + 32) = 0u;
  *(_OWORD *)(v6 + 48) = 0u;
  *(_OWORD *)(v6 + 64) = 0u;
  *(_OWORD *)(v6 + 80) = 0u;
  *(_QWORD *)(v6 + 96) = 0;
  *a1 = v6;
  CC_SHA256_Init((CC_SHA256_CTX *)v6);
  a1[1] = 0;
  v7 = (unsigned __int16 *)((char *)a2 - *a2);
  v8 = *v7;
  if (v8 >= 9 && v7[4])
  {
    switch(*((_BYTE *)a2 + v7[4]))
    {
      case 1:
        if (a3 == 1)
        {
          if (v8 < 0xB)
          {
            v17 = 0;
          }
          else
          {
            v17 = (int *)v7[5];
            if (v17)
              v17 = (int *)((char *)v17 + (_QWORD)a2 + *(unsigned int *)((char *)v17 + (_QWORD)a2));
          }
          v22 = (unsigned __int16 *)((char *)v17 - *v17);
          if (*v22 >= 0xBu)
          {
            v23 = v22[5];
            if (v23)
              goto LABEL_55;
          }
        }
        else if (a3 == 4)
        {
          if (v8 < 0xB)
          {
            v9 = 0;
          }
          else
          {
            v9 = (int *)v7[5];
            if (v9)
              v9 = (int *)((char *)v9 + (_QWORD)a2 + *(unsigned int *)((char *)v9 + (_QWORD)a2));
          }
          v19 = (unsigned __int16 *)((char *)v9 - *v9);
          if (*v19 >= 9u)
          {
            v20 = v19[4];
            if (v20)
            {
              v14 = (int *)((char *)v9 + v20 + *(unsigned int *)((char *)v9 + v20));
              v21 = (unsigned __int16 *)((char *)v14 - *v14);
              if (*v21 >= 0x2Du)
              {
                v16 = v21[22];
                if (v16)
                  goto LABEL_63;
              }
              goto LABEL_64;
            }
          }
        }
        return a1;
      case 2:
        if (!a3)
          goto LABEL_12;
        return a1;
      case 3:
        if (a3 <= 1)
        {
LABEL_12:
          if (v8 < 0xB)
          {
            v10 = 0;
          }
          else
          {
            v10 = (int *)v7[5];
            if (v10)
              v10 = (int *)((char *)v10 + (_QWORD)a2 + *(unsigned int *)((char *)v10 + (_QWORD)a2));
          }
          v12 = (unsigned __int16 *)((char *)v10 - *v10);
          if (*v12 >= 7u)
          {
            v13 = v12[3];
            if (v13)
            {
              v14 = (int *)((char *)v10 + v13 + *(unsigned int *)((char *)v10 + v13));
              v15 = (unsigned __int16 *)((char *)v14 - *v14);
              if (*v15 >= 0x17u)
              {
                v16 = v15[11];
                if (v16)
                  goto LABEL_63;
              }
              goto LABEL_64;
            }
          }
        }
        return a1;
      case 4:
        switch(a3)
        {
          case 1u:
            if (v8 < 0xB)
            {
              v17 = 0;
            }
            else
            {
              v17 = (int *)v7[5];
              if (v17)
                v17 = (int *)((char *)v17 + (_QWORD)a2 + *(unsigned int *)((char *)v17 + (_QWORD)a2));
            }
            v27 = (unsigned __int16 *)((char *)v17 - *v17);
            if (*v27 >= 0xFu)
            {
              v23 = v27[7];
              if (v23)
              {
LABEL_55:
                v14 = (int *)((char *)v17 + v23 + *(unsigned int *)((char *)v17 + v23));
                v28 = (unsigned __int16 *)((char *)v14 - *v14);
                if (*v28 < 0x37u || (v16 = v28[27]) == 0)
                {
LABEL_64:
                  v32 = 0;
                  goto LABEL_65;
                }
LABEL_63:
                v32 = (char *)v14 + v16 + *(int *)((char *)v14 + v16);
LABEL_65:
                a1[1] = (uint64_t)v32;
                return a1;
              }
            }
            break;
          case 2u:
            if (v8 < 0xB)
            {
              v18 = 0;
            }
            else
            {
              v18 = (int *)v7[5];
              if (v18)
                v18 = (int *)((char *)v18 + (_QWORD)a2 + *(unsigned int *)((char *)v18 + (_QWORD)a2));
            }
            v29 = (unsigned __int16 *)((char *)v18 - *v18);
            if (*v29 >= 0xDu)
            {
              v30 = v29[6];
              if (v30)
              {
                v14 = (int *)((char *)v18 + v30 + *(unsigned int *)((char *)v18 + v30));
                v31 = (unsigned __int16 *)((char *)v14 - *v14);
                if (*v31 < 0x1Fu)
                  goto LABEL_64;
                v16 = v31[15];
                if (!v16)
                  goto LABEL_64;
                goto LABEL_63;
              }
            }
            break;
          case 3u:
            if (v8 < 0xB)
            {
              v11 = 0;
            }
            else
            {
              v11 = (int *)v7[5];
              if (v11)
                v11 = (int *)((char *)v11 + (_QWORD)a2 + *(unsigned int *)((char *)v11 + (_QWORD)a2));
            }
            v24 = (unsigned __int16 *)((char *)v11 - *v11);
            if (*v24 >= 0xBu)
            {
              v25 = v24[5];
              if (v25)
              {
                v14 = (int *)((char *)v11 + v25 + *(unsigned int *)((char *)v11 + v25));
                v26 = (unsigned __int16 *)((char *)v14 - *v14);
                if (*v26 < 0x1Du)
                  goto LABEL_64;
                v16 = v26[14];
                if (!v16)
                  goto LABEL_64;
                goto LABEL_63;
              }
            }
            break;
        }
        break;
      default:
        return a1;
    }
  }
  return a1;
}

__n128 MTLGPUCompilerHashVertexPipelineScript(int *a1)
{
  __n128 *v1;
  __n128 result;
  uint64_t v3[2];
  __n128 v4;
  __n128 v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 0u;
  v5 = 0u;
  sub_22A7123C8(v3, a1, 4u);
  sub_22A711D30((char *)&v4, (uint64_t)v3);
  if (v3[0])
    MEMORY[0x22E2E0410](v3[0], 0x1000C40ED882C02);
  v1 = (__n128 *)malloc_type_malloc(0x20uLL, 0x100004077774924uLL);
  result = v5;
  *v1 = v4;
  v1[1] = result;
  return result;
}

__n128 MTLGPUCompilerHashObjectPipelineScript(int *a1)
{
  __n128 *v1;
  __n128 result;
  uint64_t v3[2];
  __n128 v4;
  __n128 v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 0u;
  v5 = 0u;
  sub_22A7123C8(v3, a1, 3u);
  sub_22A711D30((char *)&v4, (uint64_t)v3);
  if (v3[0])
    MEMORY[0x22E2E0410](v3[0], 0x1000C40ED882C02);
  v1 = (__n128 *)malloc_type_malloc(0x20uLL, 0x100004077774924uLL);
  result = v5;
  *v1 = v4;
  v1[1] = result;
  return result;
}

__n128 MTLGPUCompilerHashMeshPipelineScript(int *a1)
{
  __n128 *v1;
  __n128 result;
  uint64_t v3[2];
  __n128 v4;
  __n128 v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 0u;
  v5 = 0u;
  sub_22A7123C8(v3, a1, 2u);
  sub_22A711D30((char *)&v4, (uint64_t)v3);
  if (v3[0])
    MEMORY[0x22E2E0410](v3[0], 0x1000C40ED882C02);
  v1 = (__n128 *)malloc_type_malloc(0x20uLL, 0x100004077774924uLL);
  result = v5;
  *v1 = v4;
  v1[1] = result;
  return result;
}

__n128 MTLGPUCompilerHashFragmentPipelineScript(int *a1)
{
  __n128 *v1;
  __n128 result;
  uint64_t v3[2];
  __n128 v4;
  __n128 v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 0u;
  v5 = 0u;
  sub_22A7123C8(v3, a1, 1u);
  sub_22A711D30((char *)&v4, (uint64_t)v3);
  if (v3[0])
    MEMORY[0x22E2E0410](v3[0], 0x1000C40ED882C02);
  v1 = (__n128 *)malloc_type_malloc(0x20uLL, 0x100004077774924uLL);
  result = v5;
  *v1 = v4;
  v1[1] = result;
  return result;
}

void sub_22A7129B0(CC_SHA256_CTX **a1, unsigned int *a2)
{
  CC_SHA256_CTX **v2;
  uint64_t v4;
  unsigned int *v5;
  __n128 *v6;
  __n128 *v7;
  __n128 *v8;
  char *v9;
  uint64_t v10;
  __n128 *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  char *v17;
  _QWORD *v18;
  unint64_t v21;
  int v22;
  unsigned __int8 *v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  __n128 *v30;
  __n128 *v31;
  __n128 *v32;
  unint64_t v33;
  uint64_t v34;
  __n128 *v35;
  __n128 *v36;
  uint64_t v37;
  __n128 *v38;
  const void *v39;
  unint64_t v40;
  unsigned int *v42;
  char *v43;
  __n128 *v44;
  __n128 *v45;
  __n128 *v46;
  uint64_t data;

  v2 = a1;
  v44 = 0;
  v45 = 0;
  v46 = 0;
  if (a2)
  {
    sub_22A712D0C((uint64_t)&v44, *a2);
    v5 = a2 + 1;
    v4 = *a2;
    v6 = v45;
    if ((_DWORD)v4)
    {
      v7 = v46;
      v8 = v44;
      v9 = (char *)a2 + 7;
      v10 = MEMORY[0x24BDAC740];
      v42 = &v5[v4];
      do
      {
        v11 = v7;
        v12 = *v5;
        v43 = (char *)v5 + v12;
        v13 = (uint64_t)v5 + v12 + 4;
        v14 = *(unsigned int *)((char *)v5 + v12);
        v15 = (_BYTE *)(v13 + v14);
        if (v14 >= 0x12)
        {
          v16 = *(unsigned int *)((char *)v5 + v12);
          v17 = (char *)v5 + v12 + 4;
          do
          {
            v18 = memchr(v17, 95, v16 - 17);
            if (!v18)
              break;
            if (*v18 == 0x65725F7269615F5FLL && v18[1] == 0x5F5F6465766C6F73 && *((_WORD *)v18 + 8) == 14906)
              goto LABEL_16;
            v17 = (char *)v18 + 1;
            v16 = v15 - v17;
          }
          while (v15 - v17 > 17);
        }
        v18 = (_QWORD *)(v13 + v14);
LABEL_16:
        if ((_DWORD)v14)
        {
          v21 = v14;
          while (v21)
          {
            v22 = v9[v12 + v21--];
            if (v22 == 95)
              goto LABEL_22;
          }
        }
        v21 = -1;
LABEL_22:
        if (v18 == (_QWORD *)v15 || v18 != (_QWORD *)v13)
        {
          v7 = v11;
        }
        else
        {
          v7 = v11;
          if (v21 - 19 <= 0xFFFFFFFFFFFFFFEBLL && v21 < v14 - 1)
          {
            if (v21 >= v14)
              goto LABEL_69;
            if (v21 + 1 == v14)
            {
LABEL_32:
              if (v14 <= 0x11)
                goto LABEL_69;
              v25 = v21 - 18;
              v13 = (uint64_t)(v43 + 22);
              if (v14 - 18 >= v25)
                v14 = v25;
              else
                v14 -= 18;
            }
            else
            {
              v23 = (unsigned __int8 *)(v13 + v21 + 1);
              v24 = ~v21 + v14;
              while (((char)*v23 & 0x80000000) == 0 && (*(_DWORD *)(v10 + 4 * *v23 + 60) & 0x400) != 0)
              {
                ++v23;
                if (!--v24)
                  goto LABEL_32;
              }
            }
          }
        }
        if (v6 >= v7)
        {
          v26 = v6 - v8;
          v27 = v26 + 1;
          if ((unint64_t)(v26 + 1) >> 60)
LABEL_69:
            abort();
          if (((char *)v7 - (char *)v8) >> 3 > v27)
            v27 = ((char *)v7 - (char *)v8) >> 3;
          if ((unint64_t)((char *)v7 - (char *)v8) >= 0x7FFFFFFFFFFFFFF0)
            v28 = 0xFFFFFFFFFFFFFFFLL;
          else
            v28 = v27;
          if (v28)
          {
            if (v28 >> 60)
              sub_22A712DB0();
            v29 = (char *)operator new(16 * v28);
          }
          else
          {
            v29 = 0;
          }
          v30 = (__n128 *)&v29[16 * v26];
          v30->n128_u64[0] = v13;
          v30->n128_u64[1] = v14;
          if (v6 == v8)
          {
            v32 = (__n128 *)&v29[16 * v26];
          }
          else
          {
            v31 = (__n128 *)&v29[16 * v26];
            do
            {
              v32 = v31 - 1;
              v31[-1] = v6[-1];
              --v6;
              --v31;
            }
            while (v6 != v8);
          }
          v7 = (__n128 *)&v29[16 * v28];
          v6 = v30 + 1;
          v44 = v32;
          v46 = v7;
          if (v8)
            operator delete(v8);
          v8 = v32;
        }
        else
        {
          v6->n128_u64[0] = v13;
          v6->n128_u64[1] = v14;
          ++v6;
        }
        v45 = v6;
        ++v5;
        v9 += 4;
      }
      while (v5 != v42);
    }
    v33 = 126 - 2 * __clz(v6 - v44);
    if (v6 == v44)
      v34 = 0;
    else
      v34 = v33;
    sub_22A712DBC(v44, v6, v34, 1);
    v36 = v44;
    v35 = v45;
    v37 = v45 - v44;
    v2 = a1;
  }
  else
  {
    v35 = 0;
    v36 = 0;
    v37 = 0;
  }
  data = v37;
  CC_SHA256_Update(*v2, &data, 8u);
  if (v36 != v35)
  {
    v38 = v36;
    do
    {
      v39 = (const void *)v38->n128_u64[0];
      v40 = v38->n128_u64[1];
      ++v38;
      data = v40;
      CC_SHA256_Update(*v2, &data, 8u);
      CC_SHA256_Update(*v2, v39, v40);
    }
    while (v38 != v35);
  }
  if (v36)
    operator delete(v36);
}

void sub_22A712D0C(uint64_t a1, unint64_t a2)
{
  _BYTE *v2;
  _BYTE *v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;

  v2 = *(_BYTE **)a1;
  if (a2 > (uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 4)
  {
    v5 = *(_BYTE **)(a1 + 8);
    v6 = (char *)operator new(16 * a2);
    v7 = &v6[(v5 - v2) & 0xFFFFFFFFFFFFFFF0];
    v8 = v7;
    if (v5 != v2)
    {
      v9 = &v6[(v5 - v2) & 0xFFFFFFFFFFFFFFF0];
      do
      {
        v8 = v9 - 16;
        *((_OWORD *)v9 - 1) = *((_OWORD *)v5 - 1);
        v5 -= 16;
        v9 -= 16;
      }
      while (v5 != v2);
    }
    *(_QWORD *)a1 = v8;
    *(_QWORD *)(a1 + 8) = v7;
    *(_QWORD *)(a1 + 16) = &v6[16 * a2];
    if (v2)
      operator delete(v2);
  }
}

void sub_22A712DB0()
{
  abort();
}

__n128 sub_22A712DBC(__n128 *a1, __n128 *a2, uint64_t a3, char a4)
{
  __int128 *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  const void *v12;
  size_t v13;
  size_t v14;
  size_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  size_t v20;
  size_t v21;
  int v22;
  unint64_t v23;
  __int128 *v24;
  unint64_t v25;
  size_t v26;
  size_t v27;
  int v28;
  __int128 *v29;
  unint64_t v30;
  size_t v31;
  size_t v32;
  int v33;
  size_t v34;
  size_t v35;
  int v36;
  __n128 result;
  unint64_t v38;
  size_t v39;
  size_t v40;
  int v41;
  _OWORD *v42;
  unint64_t v43;
  size_t v44;
  size_t v45;
  int v46;
  _OWORD *v47;
  size_t v48;
  size_t v49;
  int v50;
  BOOL v51;
  BOOL v52;
  unint64_t v53;
  size_t v54;
  size_t v55;
  int v56;
  __int128 *v57;
  __int128 *v58;
  size_t v59;
  size_t v60;
  int v61;
  unint64_t v62;
  size_t v63;
  size_t v64;
  int v65;
  __int128 *v66;
  size_t v67;
  size_t v68;
  int v69;
  __n128 *v70;
  const void *v71;
  size_t v72;
  __n128 *v73;
  size_t v74;
  size_t v75;
  int v76;
  __n128 *v77;
  BOOL v79;
  uint64_t v80;
  unint64_t v81;
  const void *v82;
  size_t v83;
  const void *v84;
  size_t v85;
  size_t v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  size_t v91;
  size_t v92;
  int v93;
  _QWORD *v94;
  int64_t v95;
  int64_t v96;
  int64_t v97;
  uint64_t v98;
  __n128 *v99;
  uint64_t v100;
  unint64_t v101;
  unint64_t v102;
  size_t v103;
  int v104;
  int v105;
  __n128 *v106;
  unint64_t v107;
  const void *v108;
  unint64_t v109;
  size_t v110;
  int v111;
  __n128 *v112;
  uint64_t v113;
  unint64_t v114;
  unint64_t v115;
  const void *v116;
  unint64_t v117;
  size_t v118;
  int v119;
  BOOL v120;
  int v121;
  unint64_t v122;
  size_t v123;
  int v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  _OWORD *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  unint64_t v133;
  unint64_t v134;
  size_t v135;
  int v136;
  int v137;
  __n128 *v138;
  uint64_t v139;
  unint64_t v140;
  __n128 *v141;
  size_t v142;
  const void *v143;
  size_t v144;
  size_t v145;
  int v146;
  _OWORD *v147;
  size_t v148;
  size_t v149;
  int v150;
  __n128 *v152;
  const void *v153;
  unint64_t v154;
  unint64_t v155;
  size_t v156;
  int v157;
  __n128 *v158;
  const void *v159;
  const void *v160;
  unint64_t v161;
  size_t v162;
  int v163;
  __int128 *v164;
  __int128 *v165;
  int64_t v166;
  __n128 *v167;
  uint64_t v169;
  uint64_t v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __n128 v174;
  __n128 v175;

LABEL_1:
  v7 = (__int128 *)&a2[-1];
  v164 = (__int128 *)&a2[-3];
  v165 = (__int128 *)&a2[-2];
  v8 = (unint64_t)a1;
  v169 = (uint64_t)a2;
  while (2)
  {
    a1 = (__n128 *)v8;
    v9 = (uint64_t)a2 - v8;
    v10 = (uint64_t)((uint64_t)a2 - v8) >> 4;
    switch(v10)
    {
      case 0:
      case 1:
        return result;
      case 2:
        v71 = (const void *)a2[-1].n128_u64[0];
        v72 = a2[-1].n128_u64[1];
        v73 = a2 - 1;
        v74 = *(_QWORD *)(v8 + 8);
        if (v74 >= v72)
          v75 = v72;
        else
          v75 = *(_QWORD *)(v8 + 8);
        v76 = memcmp(v71, *(const void **)v8, v75);
        if (v76)
        {
          if ((v76 & 0x80000000) == 0)
            return result;
        }
        else if (v72 >= v74)
        {
          return result;
        }
        v175 = *(__n128 *)v8;
        *(__n128 *)v8 = *v73;
        result = v175;
        *v73 = v175;
        return result;
      case 3:
        result.n128_u64[0] = sub_22A7137F4((__int128 *)v8, (__int128 *)(v8 + 16), v7).n128_u64[0];
        return result;
      case 4:
        result.n128_u64[0] = sub_22A713B28(v8, v8 + 16, v8 + 32, (uint64_t)v7).n128_u64[0];
        return result;
      case 5:
        result.n128_u64[0] = sub_22A713C14(v8, v8 + 16, v8 + 32, v8 + 48, (uint64_t)v7).n128_u64[0];
        return result;
      default:
        if (v9 <= 383)
        {
          v77 = (__n128 *)(v8 + 16);
          v79 = (__n128 *)v8 == a2 || v77 == a2;
          if ((a4 & 1) == 0)
          {
            if (v79)
              return result;
            while (1)
            {
              v152 = a1;
              a1 = v77;
              v153 = (const void *)v152[1].n128_u64[0];
              v154 = v152[1].n128_u64[1];
              v155 = v152->n128_u64[1];
              if (v155 >= v154)
                v156 = v152[1].n128_u64[1];
              else
                v156 = v152->n128_u64[1];
              v157 = memcmp((const void *)v152[1].n128_u64[0], (const void *)v152->n128_u64[0], v156);
              if (v157)
              {
                if (v157 < 0)
                  goto LABEL_278;
              }
              else if (v154 < v155)
              {
                do
                {
LABEL_278:
                  while (1)
                  {
                    v158 = v152;
                    v152[1] = *v152;
                    v160 = (const void *)v152[-1].n128_u64[0];
                    --v152;
                    v159 = v160;
                    v161 = v158[-1].n128_u64[1];
                    v162 = v161 >= v154 ? v154 : v158[-1].n128_u64[1];
                    v163 = memcmp(v153, v159, v162);
                    if (!v163)
                      break;
                    if ((v163 & 0x80000000) == 0)
                      goto LABEL_285;
                  }
                }
                while (v154 < v161);
LABEL_285:
                v158->n128_u64[0] = (unint64_t)v153;
                v158->n128_u64[1] = v154;
              }
              v77 = a1 + 1;
              if (&a1[1] == a2)
                return result;
            }
          }
          if (v79)
            return result;
          v80 = 0;
          v81 = v8;
          while (1)
          {
            v82 = *(const void **)(v81 + 16);
            v83 = *(_QWORD *)(v81 + 24);
            v84 = *(const void **)v81;
            v85 = *(_QWORD *)(v81 + 8);
            v81 = (unint64_t)v77;
            if (v85 >= v83)
              v86 = v83;
            else
              v86 = v85;
            v87 = memcmp(v82, v84, v86);
            if (v87)
            {
              if ((v87 & 0x80000000) == 0)
                goto LABEL_176;
            }
            else if (v83 >= v85)
            {
              goto LABEL_176;
            }
            v88 = v80;
            while (1)
            {
              v89 = v88;
              v90 = v8 + v88;
              result = *(__n128 *)v90;
              *(_OWORD *)(v90 + 16) = *(_OWORD *)v90;
              if (!v89)
                break;
              v91 = *(_QWORD *)(v90 - 8);
              if (v91 >= v83)
                v92 = v83;
              else
                v92 = *(_QWORD *)(v90 - 8);
              v93 = memcmp(v82, *(const void **)(v90 - 16), v92);
              if (!v93)
              {
                if (v83 >= v91)
                  goto LABEL_173;
                v93 = -1;
              }
              v88 = v89 - 16;
              if ((v93 & 0x80000000) == 0)
              {
LABEL_173:
                v94 = (_QWORD *)(v8 + v89);
                goto LABEL_175;
              }
            }
            v94 = (_QWORD *)v8;
LABEL_175:
            *v94 = v82;
            v94[1] = v83;
LABEL_176:
            v77 = (__n128 *)(v81 + 16);
            v80 += 16;
            if ((__n128 *)(v81 + 16) == a2)
              return result;
          }
        }
        if (a3)
        {
          v11 = (_OWORD *)(v8 + 16 * ((unint64_t)v10 >> 1));
          if ((unint64_t)v9 < 0x801)
          {
            sub_22A7137F4((__int128 *)(v8 + 16 * ((unint64_t)v10 >> 1)), (__int128 *)v8, v7);
          }
          else
          {
            sub_22A7137F4((__int128 *)v8, (__int128 *)(v8 + 16 * ((unint64_t)v10 >> 1)), v7);
            sub_22A7137F4((__int128 *)(v8 + 16), v11 - 1, v165);
            sub_22A7137F4((__int128 *)(v8 + 32), (__int128 *)(v8 + 16 + 16 * ((unint64_t)v10 >> 1)), v164);
            sub_22A7137F4(v11 - 1, (__int128 *)(v8 + 16 * ((unint64_t)v10 >> 1)), (__int128 *)(v8 + 16 + 16 * ((unint64_t)v10 >> 1)));
            v171 = *(_OWORD *)v8;
            *(_OWORD *)v8 = *v11;
            *v11 = v171;
          }
          --a3;
          v12 = *(const void **)v8;
          if ((a4 & 1) == 0)
          {
            v14 = *(_QWORD *)(v8 - 8);
            v13 = *(_QWORD *)(v8 + 8);
            if (v13 >= v14)
              v15 = *(_QWORD *)(v8 - 8);
            else
              v15 = *(_QWORD *)(v8 + 8);
            v16 = memcmp(*(const void **)(v8 - 16), *(const void **)v8, v15);
            if (v16)
            {
              if (v16 < 0)
                goto LABEL_15;
            }
            else if (v14 < v13)
            {
              goto LABEL_15;
            }
            v34 = a2[-1].n128_u64[1];
            if (v34 >= v13)
              v35 = v13;
            else
              v35 = a2[-1].n128_u64[1];
            v36 = memcmp(v12, (const void *)a2[-1].n128_u64[0], v35);
            if (v36)
            {
              if (v36 < 0)
                goto LABEL_52;
            }
            else if (v13 < v34)
            {
LABEL_52:
              v38 = v8 + 16;
              do
              {
                v8 = v38;
                v39 = *(_QWORD *)(v38 + 8);
                if (v39 >= v13)
                  v40 = v13;
                else
                  v40 = *(_QWORD *)(v38 + 8);
                v41 = memcmp(v12, *(const void **)v38, v40);
                if (!v41)
                {
                  if (v13 == v39)
                  {
                    v41 = 0;
                  }
                  else
                  {
                    if (v13 < v39)
                      goto LABEL_104;
                    v41 = 1;
                  }
                }
                v38 = v8 + 16;
              }
              while ((v41 & 0x80000000) == 0);
              goto LABEL_104;
            }
            v53 = v8 + 16;
            do
            {
              v8 = v53;
              if (v53 >= (unint64_t)a2)
                break;
              v54 = *(_QWORD *)(v53 + 8);
              if (v54 >= v13)
                v55 = v13;
              else
                v55 = *(_QWORD *)(v53 + 8);
              v56 = memcmp(v12, *(const void **)v53, v55);
              if (!v56)
              {
                if (v13 == v54)
                {
                  v56 = 0;
                }
                else
                {
                  if (v13 < v54)
                    break;
                  v56 = 1;
                }
              }
              v53 = v8 + 16;
            }
            while ((v56 & 0x80000000) == 0);
LABEL_104:
            v57 = (__int128 *)a2;
            if (v8 < (unint64_t)a2)
            {
              v58 = v7;
              do
              {
                v57 = v58;
                v59 = *((_QWORD *)v58 + 1);
                if (v59 >= v13)
                  v60 = v13;
                else
                  v60 = *((_QWORD *)v58 + 1);
                v61 = memcmp(v12, *(const void **)v58, v60);
                if (!v61)
                {
                  if (v13 >= v59)
                    break;
                  v61 = -1;
                }
                v58 = v57 - 1;
              }
              while (v61 < 0);
            }
LABEL_132:
            while (v8 < (unint64_t)v57)
            {
              v173 = *(_OWORD *)v8;
              *(_OWORD *)v8 = *v57;
              *v57 = v173;
              v62 = v8 + 16;
              do
              {
                v8 = v62;
                v63 = *(_QWORD *)(v62 + 8);
                if (v63 >= v13)
                  v64 = v13;
                else
                  v64 = *(_QWORD *)(v62 + 8);
                v65 = memcmp(v12, *(const void **)v62, v64);
                if (!v65)
                {
                  if (v13 == v63)
                  {
                    v65 = 0;
                  }
                  else
                  {
                    if (v13 < v63)
                      break;
                    v65 = 1;
                  }
                }
                v62 = v8 + 16;
              }
              while ((v65 & 0x80000000) == 0);
              v66 = v57 - 1;
              do
              {
                v57 = v66;
                v67 = *((_QWORD *)v66 + 1);
                if (v67 >= v13)
                  v68 = v13;
                else
                  v68 = *((_QWORD *)v66 + 1);
                v69 = memcmp(v12, *(const void **)v66, v68);
                if (!v69)
                {
                  if (v13 >= v67)
                    goto LABEL_132;
                  v69 = -1;
                }
                v66 = v57 - 1;
              }
              while (v69 < 0);
            }
            v70 = (__n128 *)(v8 - 16);
            if ((__n128 *)(v8 - 16) != a1)
            {
              result = *v70;
              *a1 = *v70;
            }
            a4 = 0;
            *(_QWORD *)(v8 - 16) = v12;
            *(_QWORD *)(v8 - 8) = v13;
            continue;
          }
          v13 = *(_QWORD *)(v8 + 8);
LABEL_15:
          v17 = 0;
          do
          {
            v18 = v17;
            v19 = v8 + v17;
            v20 = *(_QWORD *)(v19 + 24);
            if (v13 >= v20)
              v21 = *(_QWORD *)(v19 + 24);
            else
              v21 = v13;
            v22 = memcmp(*(const void **)(v19 + 16), v12, v21);
            if (!v22)
            {
              if (v20 >= v13)
                break;
              v22 = -1;
            }
            v17 = v18 + 16;
          }
          while (v22 < 0);
          v23 = v8 + v18 + 16;
          v24 = v7;
          if (v18)
          {
            do
            {
              v25 = (unint64_t)v24;
              v26 = *((_QWORD *)v24 + 1);
              if (v13 >= v26)
                v27 = *((_QWORD *)v24 + 1);
              else
                v27 = v13;
              v28 = memcmp(*(const void **)v24, v12, v27);
              if (!v28)
              {
                if (v26 == v13)
                {
                  v28 = 0;
                }
                else
                {
                  if (v26 < v13)
                    break;
                  v28 = 1;
                }
              }
              v24 = (__int128 *)(v25 - 16);
            }
            while ((v28 & 0x80000000) == 0);
          }
          else
          {
            v29 = v7;
            while (1)
            {
              v25 = (unint64_t)v29;
              v30 = (unint64_t)(v29 + 1);
              if (v23 >= v30)
                break;
              v31 = *(_QWORD *)(v25 + 8);
              if (v13 >= v31)
                v32 = *(_QWORD *)(v25 + 8);
              else
                v32 = v13;
              v33 = memcmp(*(const void **)v25, v12, v32);
              if (!v33)
              {
                if (v31 == v13)
                {
                  v33 = 0;
                }
                else
                {
                  if (v31 < v13)
                    goto LABEL_64;
                  v33 = 1;
                }
              }
              v29 = (__int128 *)(v25 - 16);
              if (v33 < 0)
                goto LABEL_64;
            }
            v25 = v30;
          }
LABEL_64:
          v8 = v23;
          if (v23 < v25)
          {
            v42 = (_OWORD *)v25;
            do
            {
              v172 = *(_OWORD *)v8;
              *(_OWORD *)v8 = *v42;
              *v42 = v172;
              v43 = v8 + 16;
              do
              {
                v8 = v43;
                v44 = *(_QWORD *)(v43 + 8);
                if (v13 >= v44)
                  v45 = *(_QWORD *)(v43 + 8);
                else
                  v45 = v13;
                v46 = memcmp(*(const void **)v43, v12, v45);
                if (!v46)
                {
                  if (v44 >= v13)
                    break;
                  v46 = -1;
                }
                v43 = v8 + 16;
              }
              while (v46 < 0);
              v47 = v42 - 1;
              do
              {
                v42 = v47;
                v48 = *((_QWORD *)v47 + 1);
                if (v13 >= v48)
                  v49 = *((_QWORD *)v47 + 1);
                else
                  v49 = v13;
                v50 = memcmp(*(const void **)v47, v12, v49);
                if (!v50)
                {
                  if (v48 == v13)
                  {
                    v50 = 0;
                  }
                  else
                  {
                    if (v48 < v13)
                      break;
                    v50 = 1;
                  }
                }
                v47 = v42 - 1;
              }
              while ((v50 & 0x80000000) == 0);
            }
            while (v8 < (unint64_t)v42);
          }
          if ((__n128 *)(v8 - 16) != a1)
            *a1 = *(__n128 *)(v8 - 16);
          *(_QWORD *)(v8 - 16) = v12;
          *(_QWORD *)(v8 - 8) = v13;
          v51 = v23 >= v25;
          a2 = (__n128 *)v169;
          if (!v51)
          {
LABEL_91:
            sub_22A712DBC(a1, v8 - 16, a3, a4 & 1);
            a4 = 0;
            continue;
          }
          v52 = sub_22A713948((uint64_t)a1, v8 - 16);
          if (!sub_22A713948(v8, v169))
          {
            if (v52)
              continue;
            goto LABEL_91;
          }
          a2 = (__n128 *)(v8 - 16);
          if (v52)
            return result;
          goto LABEL_1;
        }
        if ((__n128 *)v8 == a2)
          return result;
        v95 = (unint64_t)(v10 - 2) >> 1;
        v96 = v95;
        v167 = (__n128 *)v8;
        do
        {
          v97 = v96;
          if (v95 < v96)
            goto LABEL_229;
          v98 = (2 * v96) | 1;
          v99 = &a1[v98];
          v100 = 2 * v96 + 2;
          v166 = v96;
          if (v100 < v10)
          {
            v101 = v99->n128_u64[1];
            v102 = v99[1].n128_u64[1];
            if (v102 >= v101)
              v103 = v99->n128_u64[1];
            else
              v103 = v99[1].n128_u64[1];
            v104 = memcmp((const void *)v99->n128_u64[0], (const void *)v99[1].n128_u64[0], v103);
            v97 = v166;
            if (v101 < v102)
              v105 = -1;
            else
              v105 = 1;
            if (v101 == v102)
              v105 = 0;
            if (v104)
              v105 = v104;
            if (v105 < 0)
            {
              ++v99;
              v98 = v100;
            }
          }
          v106 = &a1[v97];
          v107 = v99->n128_u64[1];
          v108 = (const void *)v106->n128_u64[0];
          v109 = v106->n128_u64[1];
          if (v109 >= v107)
            v110 = v99->n128_u64[1];
          else
            v110 = v106->n128_u64[1];
          v111 = memcmp((const void *)v99->n128_u64[0], (const void *)v106->n128_u64[0], v110);
          if (!v111)
          {
            v97 = v166;
            if (v107 < v109)
              goto LABEL_229;
            while (1)
            {
              while (1)
              {
LABEL_201:
                v112 = v106;
                v106 = v99;
                *v112 = *v99;
                if (v95 < v98)
                {
LABEL_228:
                  v106->n128_u64[0] = (unint64_t)v108;
                  v106->n128_u64[1] = v109;
                  v97 = v166;
                  goto LABEL_229;
                }
                v113 = (2 * v98) | 1;
                v99 = &a1[v113];
                v98 = 2 * v98 + 2;
                if (v98 >= v10)
                {
                  v98 = v113;
                }
                else
                {
                  v114 = v99->n128_u64[1];
                  v115 = v109;
                  v116 = v108;
                  v117 = v99[1].n128_u64[1];
                  if (v117 >= v114)
                    v118 = v99->n128_u64[1];
                  else
                    v118 = v99[1].n128_u64[1];
                  v119 = memcmp((const void *)v99->n128_u64[0], (const void *)v99[1].n128_u64[0], v118);
                  v51 = v114 >= v117;
                  v120 = v114 == v117;
                  v108 = v116;
                  v109 = v115;
                  if (v51)
                    v121 = 1;
                  else
                    v121 = -1;
                  if (v120)
                    v121 = 0;
                  if (v119)
                    v121 = v119;
                  if (v121 < 0)
                    ++v99;
                  a1 = v167;
                  v95 = (unint64_t)(v10 - 2) >> 1;
                  if (v121 >= 0)
                    v98 = v113;
                }
                v122 = v99->n128_u64[1];
                v123 = v109 >= v122 ? v99->n128_u64[1] : v109;
                v124 = memcmp((const void *)v99->n128_u64[0], v108, v123);
                if (!v124)
                  break;
LABEL_225:
                if (v124 < 0)
                  goto LABEL_228;
              }
              if (v122 == v109)
              {
                v124 = 0;
                goto LABEL_225;
              }
              if (v122 < v109)
                goto LABEL_228;
            }
          }
          v97 = v166;
          if ((v111 & 0x80000000) == 0)
            goto LABEL_201;
LABEL_229:
          v96 = v97 - 1;
        }
        while (v97);
        v125 = v169;
        do
        {
          v126 = 0;
          v174 = *a1;
          v127 = v10 - 2;
          v170 = v125;
          if (v10 < 2)
            v127 = v10 - 1;
          v128 = v127 >> 1;
          v129 = a1;
          do
          {
            v130 = (uint64_t)&v129[v126 + 1];
            v131 = (2 * v126) | 1;
            v132 = 2 * v126 + 2;
            if (v132 < v10)
            {
              v133 = *((_QWORD *)&v129[v126 + 1] + 1);
              v134 = *((_QWORD *)&v129[v126 + 2] + 1);
              if (v134 >= v133)
                v135 = *((_QWORD *)&v129[v126 + 1] + 1);
              else
                v135 = *((_QWORD *)&v129[v126 + 2] + 1);
              v136 = memcmp(*(const void **)v130, *(const void **)&v129[v126 + 2], v135);
              if (v133 < v134)
                v137 = -1;
              else
                v137 = 1;
              if (v133 == v134)
                v137 = 0;
              if (v136)
                v137 = v136;
              if (v137 < 0)
              {
                v130 += 16;
                v131 = v132;
              }
            }
            *v129 = *(_OWORD *)v130;
            v129 = (_OWORD *)v130;
            v126 = v131;
          }
          while (v131 <= v128);
          v138 = (__n128 *)(v170 - 16);
          if (v130 == v170 - 16)
          {
            v125 = v170 - 16;
            result = v174;
            *(__n128 *)v130 = v174;
          }
          else
          {
            *(__n128 *)v130 = *v138;
            result = v174;
            v125 = v170 - 16;
            *v138 = v174;
            v139 = v130 - (_QWORD)a1 + 16;
            if (v139 >= 17)
            {
              v140 = (((unint64_t)v139 >> 4) - 2) >> 1;
              v141 = &a1[v140];
              v142 = v141->n128_u64[1];
              v143 = *(const void **)v130;
              v144 = *(_QWORD *)(v130 + 8);
              if (v144 >= v142)
                v145 = v141->n128_u64[1];
              else
                v145 = *(_QWORD *)(v130 + 8);
              v146 = memcmp((const void *)v141->n128_u64[0], *(const void **)v130, v145);
              if (v146)
              {
                if (v146 < 0)
                  goto LABEL_258;
              }
              else if (v142 < v144)
              {
LABEL_258:
                while (1)
                {
                  v147 = (_OWORD *)v130;
                  v130 = (uint64_t)v141;
                  result = *v141;
                  *v147 = *v141;
                  if (!v140)
                    break;
                  v140 = (v140 - 1) >> 1;
                  v141 = &a1[v140];
                  v148 = v141->n128_u64[1];
                  if (v144 >= v148)
                    v149 = v141->n128_u64[1];
                  else
                    v149 = v144;
                  v150 = memcmp((const void *)v141->n128_u64[0], v143, v149);
                  if (v150)
                  {
                    if ((v150 & 0x80000000) == 0)
                      break;
                  }
                  else if (v148 >= v144)
                  {
                    break;
                  }
                }
                *(_QWORD *)v130 = v143;
                *(_QWORD *)(v130 + 8) = v144;
              }
            }
          }
        }
        while (v10-- > 2);
        return result;
    }
  }
}

__n128 sub_22A7137F4(__int128 *a1, __int128 *a2, __int128 *a3)
{
  const void *v6;
  size_t v7;
  size_t v8;
  size_t v9;
  int v10;
  size_t v11;
  size_t v12;
  int v13;
  __n128 result;
  size_t v15;
  size_t v16;
  int v17;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  size_t v21;
  int v22;
  __int128 v23;
  unint64_t v24;
  unint64_t v25;
  size_t v26;
  int v27;

  v6 = *(const void **)a2;
  v7 = *((_QWORD *)a2 + 1);
  v8 = *((_QWORD *)a1 + 1);
  if (v8 >= v7)
    v9 = *((_QWORD *)a2 + 1);
  else
    v9 = *((_QWORD *)a1 + 1);
  v10 = memcmp(v6, *(const void **)a1, v9);
  if (v10)
  {
    if (v10 < 0)
      goto LABEL_6;
  }
  else if (v7 < v8)
  {
LABEL_6:
    v11 = *((_QWORD *)a3 + 1);
    if (v7 >= v11)
      v12 = *((_QWORD *)a3 + 1);
    else
      v12 = v7;
    v13 = memcmp(*(const void **)a3, v6, v12);
    if (v13)
    {
      if (v13 < 0)
      {
LABEL_11:
        result = (__n128)*a1;
        *a1 = *a3;
LABEL_35:
        *a3 = (__int128)result;
        return result;
      }
    }
    else if (v11 < v7)
    {
      goto LABEL_11;
    }
    v18 = *a1;
    *a1 = *a2;
    *a2 = v18;
    v19 = *((_QWORD *)a3 + 1);
    v20 = *((_QWORD *)a2 + 1);
    if (v20 >= v19)
      v21 = *((_QWORD *)a3 + 1);
    else
      v21 = *((_QWORD *)a2 + 1);
    v22 = memcmp(*(const void **)a3, *(const void **)a2, v21);
    if (v22)
    {
      if ((v22 & 0x80000000) == 0)
        return result;
    }
    else if (v19 >= v20)
    {
      return result;
    }
    result = (__n128)*a2;
    *a2 = *a3;
    goto LABEL_35;
  }
  v15 = *((_QWORD *)a3 + 1);
  if (v7 >= v15)
    v16 = *((_QWORD *)a3 + 1);
  else
    v16 = v7;
  v17 = memcmp(*(const void **)a3, v6, v16);
  if (v17)
  {
    if ((v17 & 0x80000000) == 0)
      return result;
  }
  else if (v15 >= v7)
  {
    return result;
  }
  v23 = *a2;
  *a2 = *a3;
  *a3 = v23;
  v24 = *((_QWORD *)a2 + 1);
  v25 = *((_QWORD *)a1 + 1);
  if (v25 >= v24)
    v26 = *((_QWORD *)a2 + 1);
  else
    v26 = *((_QWORD *)a1 + 1);
  v27 = memcmp(*(const void **)a2, *(const void **)a1, v26);
  if (!v27)
  {
    if (v24 >= v25)
      return result;
    goto LABEL_37;
  }
  if (v27 < 0)
  {
LABEL_37:
    result = (__n128)*a1;
    *a1 = *a2;
    *a2 = (__int128)result;
  }
  return result;
}

BOOL sub_22A713948(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _BOOL8 result;
  _OWORD *v6;
  unint64_t v7;
  unint64_t v8;
  size_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  const void *v15;
  size_t v16;
  const void *v17;
  size_t v18;
  size_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  size_t v24;
  size_t v25;
  int v26;
  _QWORD *v27;
  __int128 v28;

  v4 = (a2 - a1) >> 4;
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v7 = *(_QWORD *)(a2 - 8);
      v6 = (_OWORD *)(a2 - 16);
      v8 = *(_QWORD *)(a1 + 8);
      if (v8 >= v7)
        v9 = *(_QWORD *)(a2 - 8);
      else
        v9 = *(_QWORD *)(a1 + 8);
      v10 = memcmp(*(const void **)(a2 - 16), *(const void **)a1, v9);
      if (v10)
      {
        if ((v10 & 0x80000000) == 0)
          return 1;
      }
      else if (v7 >= v8)
      {
        return 1;
      }
      v28 = *(_OWORD *)a1;
      *(_OWORD *)a1 = *v6;
      *v6 = v28;
      return 1;
    case 3:
      sub_22A7137F4((__int128 *)a1, (__int128 *)(a1 + 16), (__int128 *)(a2 - 16));
      return 1;
    case 4:
      sub_22A713B28(a1, a1 + 16, a1 + 32, a2 - 16);
      return 1;
    case 5:
      sub_22A713C14(a1, a1 + 16, a1 + 32, a1 + 48, a2 - 16);
      return 1;
    default:
      v11 = a1 + 32;
      sub_22A7137F4((__int128 *)a1, (__int128 *)(a1 + 16), (__int128 *)(a1 + 32));
      v12 = a1 + 48;
      if (a1 + 48 == a2)
        return 1;
      v13 = 0;
      v14 = 0;
      break;
  }
  while (1)
  {
    v15 = *(const void **)v12;
    v16 = *(_QWORD *)(v12 + 8);
    v17 = *(const void **)v11;
    v18 = *(_QWORD *)(v11 + 8);
    v19 = v18 >= v16 ? *(_QWORD *)(v12 + 8) : v18;
    v20 = memcmp(*(const void **)v12, v17, v19);
    if (!v20)
      break;
    if (v20 < 0)
      goto LABEL_17;
LABEL_29:
    v11 = v12;
    v13 += 16;
    v12 += 16;
    if (v12 == a2)
      return 1;
  }
  if (v16 >= v18)
    goto LABEL_29;
LABEL_17:
  v21 = v13;
  while (1)
  {
    v22 = v21;
    v23 = a1 + v21;
    *(_OWORD *)(v23 + 48) = *(_OWORD *)(v23 + 32);
    if (v22 == -32)
      break;
    v24 = *(_QWORD *)(v23 + 24);
    if (v24 >= v16)
      v25 = v16;
    else
      v25 = *(_QWORD *)(v23 + 24);
    v26 = memcmp(v15, *(const void **)(v23 + 16), v25);
    if (!v26)
    {
      if (v16 >= v24)
        goto LABEL_26;
      v26 = -1;
    }
    v21 = v22 - 16;
    if ((v26 & 0x80000000) == 0)
    {
LABEL_26:
      v27 = (_QWORD *)(a1 + v22 + 32);
      goto LABEL_28;
    }
  }
  v27 = (_QWORD *)a1;
LABEL_28:
  *v27 = v15;
  v27[1] = v16;
  if (++v14 != 8)
    goto LABEL_29;
  return v12 + 16 == a2;
}

__n128 sub_22A713B28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8;
  unint64_t v9;
  size_t v10;
  int v11;
  __n128 result;
  __int128 v13;
  unint64_t v14;
  unint64_t v15;
  size_t v16;
  int v17;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  size_t v21;
  int v22;

  sub_22A7137F4((__int128 *)a1, (__int128 *)a2, (__int128 *)a3);
  v8 = *(_QWORD *)(a4 + 8);
  v9 = *(_QWORD *)(a3 + 8);
  if (v9 >= v8)
    v10 = *(_QWORD *)(a4 + 8);
  else
    v10 = *(_QWORD *)(a3 + 8);
  v11 = memcmp(*(const void **)a4, *(const void **)a3, v10);
  if (v11)
  {
    if ((v11 & 0x80000000) == 0)
      return result;
  }
  else if (v8 >= v9)
  {
    return result;
  }
  v13 = *(_OWORD *)a3;
  *(_OWORD *)a3 = *(_OWORD *)a4;
  *(_OWORD *)a4 = v13;
  v14 = *(_QWORD *)(a3 + 8);
  v15 = *(_QWORD *)(a2 + 8);
  if (v15 >= v14)
    v16 = *(_QWORD *)(a3 + 8);
  else
    v16 = *(_QWORD *)(a2 + 8);
  v17 = memcmp(*(const void **)a3, *(const void **)a2, v16);
  if (v17)
  {
    if ((v17 & 0x80000000) == 0)
      return result;
  }
  else if (v14 >= v15)
  {
    return result;
  }
  v18 = *(_OWORD *)a2;
  *(_OWORD *)a2 = *(_OWORD *)a3;
  *(_OWORD *)a3 = v18;
  v19 = *(_QWORD *)(a2 + 8);
  v20 = *(_QWORD *)(a1 + 8);
  if (v20 >= v19)
    v21 = *(_QWORD *)(a2 + 8);
  else
    v21 = *(_QWORD *)(a1 + 8);
  v22 = memcmp(*(const void **)a2, *(const void **)a1, v21);
  if (v22)
  {
    if ((v22 & 0x80000000) == 0)
      return result;
  }
  else if (v19 >= v20)
  {
    return result;
  }
  result = *(__n128 *)a1;
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(__n128 *)a2 = result;
  return result;
}

__n128 sub_22A713C14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v10;
  unint64_t v11;
  size_t v12;
  int v13;
  __n128 result;
  __int128 v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  int v19;
  __int128 v20;
  unint64_t v21;
  unint64_t v22;
  size_t v23;
  int v24;
  __int128 v25;
  unint64_t v26;
  unint64_t v27;
  size_t v28;
  int v29;

  sub_22A713B28(a1, a2, a3, a4);
  v10 = *(_QWORD *)(a5 + 8);
  v11 = *(_QWORD *)(a4 + 8);
  if (v11 >= v10)
    v12 = *(_QWORD *)(a5 + 8);
  else
    v12 = *(_QWORD *)(a4 + 8);
  v13 = memcmp(*(const void **)a5, *(const void **)a4, v12);
  if (v13)
  {
    if ((v13 & 0x80000000) == 0)
      return result;
  }
  else if (v10 >= v11)
  {
    return result;
  }
  v15 = *(_OWORD *)a4;
  *(_OWORD *)a4 = *(_OWORD *)a5;
  *(_OWORD *)a5 = v15;
  v16 = *(_QWORD *)(a4 + 8);
  v17 = *(_QWORD *)(a3 + 8);
  if (v17 >= v16)
    v18 = *(_QWORD *)(a4 + 8);
  else
    v18 = *(_QWORD *)(a3 + 8);
  v19 = memcmp(*(const void **)a4, *(const void **)a3, v18);
  if (v19)
  {
    if ((v19 & 0x80000000) == 0)
      return result;
  }
  else if (v16 >= v17)
  {
    return result;
  }
  v20 = *(_OWORD *)a3;
  *(_OWORD *)a3 = *(_OWORD *)a4;
  *(_OWORD *)a4 = v20;
  v21 = *(_QWORD *)(a3 + 8);
  v22 = *(_QWORD *)(a2 + 8);
  if (v22 >= v21)
    v23 = *(_QWORD *)(a3 + 8);
  else
    v23 = *(_QWORD *)(a2 + 8);
  v24 = memcmp(*(const void **)a3, *(const void **)a2, v23);
  if (v24)
  {
    if ((v24 & 0x80000000) == 0)
      return result;
  }
  else if (v21 >= v22)
  {
    return result;
  }
  v25 = *(_OWORD *)a2;
  *(_OWORD *)a2 = *(_OWORD *)a3;
  *(_OWORD *)a3 = v25;
  v26 = *(_QWORD *)(a2 + 8);
  v27 = *(_QWORD *)(a1 + 8);
  if (v27 >= v26)
    v28 = *(_QWORD *)(a2 + 8);
  else
    v28 = *(_QWORD *)(a1 + 8);
  v29 = memcmp(*(const void **)a2, *(const void **)a1, v28);
  if (v29)
  {
    if ((v29 & 0x80000000) == 0)
      return result;
  }
  else if (v26 >= v27)
  {
    return result;
  }
  result = *(__n128 *)a1;
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(__n128 *)a2 = result;
  return result;
}

uint64_t sub_22A713D44(uint64_t result, int **a2, uint64_t a3, char a4)
{
  int **v5;
  int **v6;
  int **v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int **v11;
  int *v12;
  int *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  int *v17;
  unsigned __int16 *v18;
  uint64_t v19;
  unsigned int *v20;
  uint64_t v21;
  char *v22;
  size_t v23;
  uint64_t v24;
  char *v25;
  unsigned int *v26;
  uint64_t v27;
  char *v28;
  size_t v29;
  size_t v30;
  int v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  int *v35;
  unsigned __int16 *v36;
  uint64_t v37;
  unsigned int *v38;
  uint64_t v39;
  char *v40;
  size_t v41;
  unsigned int *v42;
  uint64_t v43;
  char *v44;
  size_t v45;
  size_t v46;
  int v47;
  int **v48;
  int **v49;
  int *v50;
  unsigned __int16 *v51;
  uint64_t v52;
  unsigned int *v53;
  uint64_t v54;
  char *v55;
  size_t v56;
  unsigned int *v57;
  uint64_t v58;
  char *v59;
  size_t v60;
  size_t v61;
  int v62;
  int **v63;
  int **v64;
  unsigned __int16 *v65;
  uint64_t v66;
  unsigned int *v67;
  uint64_t v68;
  char *v69;
  size_t v70;
  unsigned int *v71;
  uint64_t v72;
  char *v73;
  size_t v74;
  size_t v75;
  int v76;
  unsigned int *v77;
  uint64_t v78;
  char *v79;
  size_t v80;
  int *v81;
  int **v82;
  int **v83;
  unsigned __int16 *v84;
  uint64_t v85;
  unsigned int *v86;
  uint64_t v87;
  char *v88;
  size_t v89;
  unsigned int *v90;
  uint64_t v91;
  char *v92;
  size_t v93;
  size_t v94;
  int v95;
  int **v96;
  unsigned __int16 *v97;
  uint64_t v98;
  unsigned int *v99;
  uint64_t v100;
  char *v101;
  size_t v102;
  unsigned int *v103;
  uint64_t v104;
  char *v105;
  size_t v106;
  size_t v107;
  int v108;
  int **v109;
  BOOL v110;
  unsigned __int16 *v111;
  uint64_t v112;
  unsigned int *v113;
  uint64_t v114;
  char *v115;
  size_t v116;
  size_t v117;
  int **v118;
  unsigned int *v119;
  uint64_t v120;
  char *v121;
  size_t v122;
  unsigned __int16 *v123;
  uint64_t v124;
  unsigned int *v125;
  uint64_t v126;
  char *v127;
  size_t v128;
  size_t v129;
  int **v130;
  unsigned int *v131;
  uint64_t v132;
  char *v133;
  size_t v134;
  unsigned __int16 *v135;
  uint64_t v136;
  unsigned int *v137;
  uint64_t v138;
  char *v139;
  size_t v140;
  size_t v141;
  int **v142;
  int **v143;
  unsigned int *v144;
  uint64_t v145;
  char *v146;
  size_t v147;
  unsigned __int16 *v148;
  uint64_t v149;
  unsigned int *v150;
  uint64_t v151;
  char *v152;
  size_t v153;
  size_t v154;
  int *v155;
  int *v156;
  int **v157;
  unsigned int *v158;
  uint64_t v159;
  char *v160;
  size_t v161;
  unsigned __int16 *v162;
  uint64_t v163;
  unsigned int *v164;
  uint64_t v165;
  char *v166;
  size_t v167;
  size_t v168;
  int v169;
  int **v170;
  unsigned int *v171;
  uint64_t v172;
  char *v173;
  size_t v174;
  unsigned __int16 *v175;
  uint64_t v176;
  unsigned int *v177;
  uint64_t v178;
  char *v179;
  size_t v180;
  size_t v181;
  int **v182;
  int *v183;
  int *v184;
  unsigned __int16 *v185;
  uint64_t v186;
  unsigned int *v187;
  uint64_t v188;
  char *v189;
  size_t v190;
  int **v191;
  int **v192;
  int **v193;
  int *v194;
  int *v195;
  unsigned __int16 *v196;
  uint64_t v197;
  unsigned int *v198;
  uint64_t v199;
  char *v200;
  size_t v201;
  int **v202;
  BOOL v203;
  char v204;
  uint64_t v205;
  int **v206;
  int *v207;
  unsigned __int16 *v208;
  unsigned int v209;
  unsigned int *v210;
  uint64_t v211;
  char *v212;
  size_t v213;
  int *v214;
  unsigned __int16 *v215;
  uint64_t v216;
  unsigned int *v217;
  uint64_t v218;
  char *v219;
  size_t v220;
  size_t v221;
  uint64_t v222;
  int **v223;
  unsigned int *v224;
  uint64_t v225;
  char *v226;
  size_t v227;
  unsigned __int16 *v228;
  uint64_t v229;
  unsigned int *v230;
  uint64_t v231;
  char *v232;
  size_t v233;
  size_t v234;
  int64_t v235;
  int64_t v236;
  uint64_t v237;
  int **v238;
  unsigned __int16 *v239;
  uint64_t v240;
  unsigned int *v241;
  uint64_t v242;
  char *v243;
  size_t v244;
  int *v245;
  int *v246;
  unsigned __int16 *v247;
  uint64_t v248;
  unsigned int *v249;
  uint64_t v250;
  char *v251;
  size_t v252;
  size_t v253;
  int v254;
  int v255;
  int **v256;
  int *v257;
  unsigned __int16 *v258;
  uint64_t v259;
  unsigned int *v260;
  uint64_t v261;
  char *v262;
  size_t v263;
  unsigned __int16 *v264;
  unsigned int v265;
  unsigned int *v266;
  uint64_t v267;
  char *v268;
  size_t v269;
  size_t v270;
  int **v271;
  uint64_t v272;
  unsigned __int16 *v273;
  uint64_t v274;
  unsigned int *v275;
  uint64_t v276;
  char *v277;
  size_t v278;
  int *v279;
  int *v280;
  unsigned __int16 *v281;
  uint64_t v282;
  unsigned int *v283;
  uint64_t v284;
  char *v285;
  size_t v286;
  size_t v287;
  int v288;
  int v289;
  unsigned __int16 *v290;
  uint64_t v291;
  unsigned int *v292;
  uint64_t v293;
  char *v294;
  size_t v295;
  unsigned int *v296;
  uint64_t v297;
  char *v298;
  size_t v299;
  size_t v300;
  uint64_t v301;
  int **v302;
  int **v303;
  int **v304;
  uint64_t v305;
  uint64_t v306;
  unsigned __int16 *v307;
  uint64_t v308;
  unsigned int *v309;
  uint64_t v310;
  char *v311;
  size_t v312;
  int *v313;
  unsigned __int16 *v314;
  uint64_t v315;
  unsigned int *v316;
  uint64_t v317;
  char *v318;
  size_t v319;
  size_t v320;
  int v321;
  int **v322;
  uint64_t v323;
  unint64_t v324;
  int **v325;
  int *v326;
  unsigned __int16 *v327;
  uint64_t v328;
  unsigned int *v329;
  uint64_t v330;
  char *v331;
  size_t v332;
  unsigned __int16 *v333;
  unsigned int v334;
  unsigned int *v335;
  uint64_t v336;
  char *v337;
  size_t v338;
  size_t v339;
  int **v340;
  unsigned __int16 *v341;
  uint64_t v342;
  unsigned int *v343;
  uint64_t v344;
  char *v345;
  size_t v346;
  unsigned int *v347;
  uint64_t v348;
  char *v349;
  size_t v350;
  size_t v351;
  unsigned __int16 *v353;
  uint64_t v354;
  unsigned int *v355;
  uint64_t v356;
  char *v357;
  size_t v358;
  unsigned __int16 *v359;
  uint64_t v360;
  unsigned int *v361;
  uint64_t v362;
  char *v363;
  size_t v364;
  size_t v365;
  size_t v366;
  int **v367;
  int *v368;
  unsigned __int16 *v369;
  unsigned int v370;
  unsigned int *v371;
  uint64_t v372;
  char *v373;
  size_t v374;
  int *v375;
  unsigned __int16 *v376;
  uint64_t v377;
  unsigned int *v378;
  uint64_t v379;
  char *v380;
  size_t v381;
  size_t v382;
  int **v383;
  int *v384;
  int *v385;
  unsigned int *v386;
  uint64_t v387;
  char *v388;
  unint64_t v389;
  unsigned __int16 *v390;
  uint64_t v391;
  unsigned int *v392;
  uint64_t v393;
  char *v394;
  unint64_t v395;
  size_t v396;
  int *v397;
  int *v398;
  unsigned __int16 *v399;
  unsigned int v400;
  unsigned int *v401;
  uint64_t v402;
  char *v403;
  size_t v404;
  unsigned __int16 *v405;
  uint64_t v406;
  unsigned int *v407;
  uint64_t v408;
  char *v409;
  size_t v410;
  size_t v411;
  int *v412;
  unsigned int *v413;
  uint64_t v414;
  char *v415;
  size_t v416;
  unsigned __int16 *v417;
  uint64_t v418;
  unsigned int *v419;
  uint64_t v420;
  char *v421;
  size_t v422;
  size_t v423;
  int *v424;
  unsigned int *v425;
  uint64_t v426;
  char *v427;
  size_t v428;
  unsigned __int16 *v429;
  uint64_t v430;
  unsigned int *v431;
  uint64_t v432;
  char *v433;
  size_t v434;
  size_t v435;
  int **v437;
  unsigned __int16 *v438;
  uint64_t v439;
  int *v440;
  int **v441;
  int64_t v442;
  int *v443;
  int *v444;
  int **v446;

  v446 = (int **)result;
LABEL_2:
  v5 = a2;
  v6 = v446;
  v441 = a2 - 1;
  while (2)
  {
    v7 = v6;
    v8 = (char *)v5 - (char *)v6;
    v9 = v5 - v6;
    v446 = v7;
    switch(v9)
    {
      case 0:
      case 1:
        return result;
      case 2:
        v183 = *(a2 - 1);
        v184 = *v7;
        v185 = (unsigned __int16 *)((char *)v183 - *v183);
        if (*v185 >= 5u && (v186 = v185[2]) != 0)
        {
          v187 = (unsigned int *)((char *)v183 + v186);
          v188 = *v187;
          v189 = (char *)v187 + v188 + 4;
          v190 = *(unsigned int *)((char *)v187 + v188);
        }
        else
        {
          v190 = 0;
          v189 = 0;
        }
        v353 = (unsigned __int16 *)((char *)v184 - *v184);
        if (*v353 >= 5u && (v354 = v353[2]) != 0)
        {
          v355 = (unsigned int *)((char *)v184 + v354);
          v356 = *v355;
          v357 = (char *)v355 + v356 + 4;
          v358 = *(unsigned int *)((char *)v355 + v356);
        }
        else
        {
          v358 = 0;
          v357 = 0;
        }
        if (v358 >= v190)
          v365 = v190;
        else
          v365 = v358;
        result = memcmp(v189, v357, v365);
        if ((_DWORD)result)
        {
          if ((result & 0x80000000) == 0)
            return result;
        }
        else if (v190 >= v358)
        {
          return result;
        }
        *v446 = v183;
        *(a2 - 1) = v184;
        return result;
      case 3:
        return sub_22A715364(v7, v7 + 1, v441);
      case 4:
        return sub_22A715C4C(v7, v7 + 1, v7 + 2, v441);
      case 5:
        v191 = v7 + 1;
        v192 = v7 + 2;
        v193 = v446 + 3;
        sub_22A715C4C(v446, v446 + 1, v446 + 2, v446 + 3);
        v194 = *(a2 - 1);
        v195 = v446[3];
        v196 = (unsigned __int16 *)((char *)v194 - *v194);
        if (*v196 >= 5u && (v197 = v196[2]) != 0)
        {
          v198 = (unsigned int *)((char *)v194 + v197);
          v199 = *v198;
          v200 = (char *)v198 + v199 + 4;
          v201 = *(unsigned int *)((char *)v198 + v199);
        }
        else
        {
          v201 = 0;
          v200 = 0;
        }
        v359 = (unsigned __int16 *)((char *)v195 - *v195);
        if (*v359 >= 5u && (v360 = v359[2]) != 0)
        {
          v361 = (unsigned int *)((char *)v195 + v360);
          v362 = *v361;
          v363 = (char *)v361 + v362 + 4;
          v364 = *(unsigned int *)((char *)v361 + v362);
        }
        else
        {
          v364 = 0;
          v363 = 0;
        }
        if (v364 >= v201)
          v366 = v201;
        else
          v366 = v364;
        result = memcmp(v200, v363, v366);
        if ((_DWORD)result)
        {
          if ((result & 0x80000000) == 0)
            return result;
        }
        else if (v201 >= v364)
        {
          return result;
        }
        *v193 = v194;
        *(a2 - 1) = v195;
        v397 = *v193;
        v398 = *v192;
        v399 = (unsigned __int16 *)((char *)*v193 - **v193);
        v400 = *v399;
        if (v400 >= 5 && v399[2])
        {
          v401 = (unsigned int *)((char *)v397 + v399[2]);
          v402 = *v401;
          v403 = (char *)v401 + v402 + 4;
          v404 = *(unsigned int *)((char *)v401 + v402);
        }
        else
        {
          v404 = 0;
          v403 = 0;
        }
        v405 = (unsigned __int16 *)((char *)v398 - *v398);
        if (*v405 >= 5u && (v406 = v405[2]) != 0)
        {
          v407 = (unsigned int *)((char *)v398 + v406);
          v408 = *v407;
          v409 = (char *)v407 + v408 + 4;
          v410 = *(unsigned int *)((char *)v407 + v408);
        }
        else
        {
          v410 = 0;
          v409 = 0;
        }
        if (v410 >= v404)
          v411 = v404;
        else
          v411 = v410;
        result = memcmp(v403, v409, v411);
        if ((_DWORD)result)
        {
          if ((result & 0x80000000) == 0)
            return result;
        }
        else if (v404 >= v410)
        {
          return result;
        }
        *v192 = v397;
        *v193 = v398;
        v412 = *v191;
        if (v400 >= 5 && v399[2])
        {
          v413 = (unsigned int *)((char *)v397 + v399[2]);
          v414 = *v413;
          v415 = (char *)v413 + v414 + 4;
          v416 = *(unsigned int *)((char *)v413 + v414);
        }
        else
        {
          v416 = 0;
          v415 = 0;
        }
        v417 = (unsigned __int16 *)((char *)v412 - *v412);
        if (*v417 >= 5u && (v418 = v417[2]) != 0)
        {
          v419 = (unsigned int *)((char *)v412 + v418);
          v420 = *v419;
          v421 = (char *)v419 + v420 + 4;
          v422 = *(unsigned int *)((char *)v419 + v420);
        }
        else
        {
          v422 = 0;
          v421 = 0;
        }
        if (v422 >= v416)
          v423 = v416;
        else
          v423 = v422;
        result = memcmp(v415, v421, v423);
        if ((_DWORD)result)
        {
          if ((result & 0x80000000) == 0)
            return result;
        }
        else if (v416 >= v422)
        {
          return result;
        }
        v446[1] = v397;
        v446[2] = v412;
        v424 = *v446;
        if (v400 >= 5 && v399[2])
        {
          v425 = (unsigned int *)((char *)v397 + v399[2]);
          v426 = *v425;
          v427 = (char *)v425 + v426 + 4;
          v428 = *(unsigned int *)((char *)v425 + v426);
        }
        else
        {
          v428 = 0;
          v427 = 0;
        }
        v429 = (unsigned __int16 *)((char *)v424 - *v424);
        if (*v429 >= 5u && (v430 = v429[2]) != 0)
        {
          v431 = (unsigned int *)((char *)v424 + v430);
          v432 = *v431;
          v433 = (char *)v431 + v432 + 4;
          v434 = *(unsigned int *)((char *)v431 + v432);
        }
        else
        {
          v434 = 0;
          v433 = 0;
        }
        if (v434 >= v428)
          v435 = v428;
        else
          v435 = v434;
        result = memcmp(v427, v433, v435);
        if ((_DWORD)result)
        {
          if ((result & 0x80000000) == 0)
            return result;
        }
        else if (v428 >= v434)
        {
          return result;
        }
        *v446 = v397;
        v446[1] = v424;
        return result;
      default:
        if (v8 <= 191)
        {
          v202 = v7 + 1;
          v203 = v7 == v5 || v202 == v5;
          v204 = v203;
          if ((a4 & 1) == 0)
          {
            if ((v204 & 1) != 0)
              return result;
            while (1)
            {
              v367 = v446;
              v446 = v202;
              v368 = v367[1];
              v369 = (unsigned __int16 *)((char *)v368 - *v368);
              v370 = *v369;
              if (v370 >= 5 && v369[2])
              {
                v371 = (unsigned int *)((char *)v368 + v369[2]);
                v372 = *v371;
                v373 = (char *)v371 + v372 + 4;
                v374 = *(unsigned int *)((char *)v371 + v372);
              }
              else
              {
                v374 = 0;
                v373 = 0;
              }
              v375 = *v367;
              v376 = (unsigned __int16 *)((char *)*v367 - **v367);
              if (*v376 >= 5u && (v377 = v376[2]) != 0)
              {
                v378 = (unsigned int *)((char *)v375 + v377);
                v379 = *v378;
                v380 = (char *)v378 + v379 + 4;
                v381 = *(unsigned int *)((char *)v378 + v379);
              }
              else
              {
                v381 = 0;
                v380 = 0;
              }
              if (v381 >= v374)
                v382 = v374;
              else
                v382 = v381;
              result = memcmp(v373, v380, v382);
              if ((_DWORD)result)
              {
                if ((result & 0x80000000) != 0)
                {
                  do
                  {
LABEL_475:
                    while (1)
                    {
                      v383 = v367;
                      v384 = v375;
                      v385 = *--v367;
                      v375 = v385;
                      v367[2] = v384;
                      if (v370 >= 5 && v369[2])
                      {
                        v386 = (unsigned int *)((char *)v368 + v369[2]);
                        v387 = *v386;
                        v388 = (char *)v386 + v387 + 4;
                        v389 = *(unsigned int *)((char *)v386 + v387);
                      }
                      else
                      {
                        v389 = 0;
                        v388 = 0;
                      }
                      v390 = (unsigned __int16 *)((char *)v375 - *v375);
                      if (*v390 >= 5u && (v391 = v390[2]) != 0)
                      {
                        v392 = (unsigned int *)((char *)v375 + v391);
                        v393 = *v392;
                        v394 = (char *)v392 + v393 + 4;
                        v395 = *(unsigned int *)((char *)v392 + v393);
                      }
                      else
                      {
                        v395 = 0;
                        v394 = 0;
                      }
                      v396 = v395 >= v389 ? v389 : v395;
                      result = memcmp(v388, v394, v396);
                      if (!(_DWORD)result)
                        break;
                      if ((result & 0x80000000) == 0)
                        goto LABEL_490;
                    }
                  }
                  while (v389 < v395);
LABEL_490:
                  *v383 = v368;
                }
              }
              else if (v374 < v381)
              {
                goto LABEL_475;
              }
              v202 = v446 + 1;
              if (v446 + 1 == a2)
                return result;
            }
          }
          if ((v204 & 1) != 0)
            return result;
          v205 = 0;
LABEL_253:
          v206 = v7;
          v7 = v202;
          v207 = v206[1];
          v208 = (unsigned __int16 *)((char *)v207 - *v207);
          v209 = *v208;
          if (v209 >= 5 && v208[2])
          {
            v210 = (unsigned int *)((char *)v207 + v208[2]);
            v211 = *v210;
            v212 = (char *)v210 + v211 + 4;
            v213 = *(unsigned int *)((char *)v210 + v211);
          }
          else
          {
            v213 = 0;
            v212 = 0;
          }
          v214 = *v206;
          v215 = (unsigned __int16 *)((char *)*v206 - **v206);
          if (*v215 >= 5u && (v216 = v215[2]) != 0)
          {
            v217 = (unsigned int *)((char *)v214 + v216);
            v218 = *v217;
            v219 = (char *)v217 + v218 + 4;
            v220 = *(unsigned int *)((char *)v217 + v218);
          }
          else
          {
            v220 = 0;
            v219 = 0;
          }
          if (v220 >= v213)
            v221 = v213;
          else
            v221 = v220;
          result = memcmp(v212, v219, v221);
          if ((_DWORD)result)
          {
            if ((result & 0x80000000) == 0)
              goto LABEL_289;
          }
          else if (v213 >= v220)
          {
            goto LABEL_289;
          }
          v222 = v205;
          while (1)
          {
            *(int **)((char *)v446 + v222 + 8) = v214;
            if (!v222)
            {
              v223 = v446;
              goto LABEL_288;
            }
            v223 = v206;
            if (v209 >= 5 && v208[2])
            {
              v224 = (unsigned int *)((char *)v207 + v208[2]);
              v225 = *v224;
              v226 = (char *)v224 + v225 + 4;
              v227 = *(unsigned int *)((char *)v224 + v225);
            }
            else
            {
              v227 = 0;
              v226 = 0;
            }
            v214 = *(int **)((char *)v446 + v222 - 8);
            v228 = (unsigned __int16 *)((char *)v214 - *v214);
            if (*v228 >= 5u && (v229 = v228[2]) != 0)
            {
              v230 = (unsigned int *)((char *)v214 + v229);
              v231 = *v230;
              v232 = (char *)v230 + v231 + 4;
              v233 = *(unsigned int *)((char *)v230 + v231);
            }
            else
            {
              v233 = 0;
              v232 = 0;
            }
            if (v233 >= v227)
              v234 = v227;
            else
              v234 = v233;
            result = memcmp(v226, v232, v234);
            if (!(_DWORD)result)
            {
              if (v227 >= v233)
              {
                v223 = (int **)((char *)v446 + v222);
LABEL_288:
                *v223 = v207;
LABEL_289:
                v202 = v7 + 1;
                v205 += 8;
                if (v7 + 1 == a2)
                  return result;
                goto LABEL_253;
              }
              result = 0xFFFFFFFFLL;
            }
            v206 = v223 - 1;
            v222 -= 8;
            if ((result & 0x80000000) == 0)
              goto LABEL_288;
          }
        }
        if (a3)
        {
          v10 = (unint64_t)v9 >> 1;
          v11 = &v7[(unint64_t)v9 >> 1];
          if ((unint64_t)v8 < 0x401)
          {
            sub_22A715364(v11, v7, v441);
          }
          else
          {
            sub_22A715364(v7, v11, v441);
            sub_22A715364(v7 + 1, v11 - 1, a2 - 2);
            sub_22A715364(v7 + 2, &v7[v10 + 1], a2 - 3);
            sub_22A715364(v11 - 1, v11, &v7[v10 + 1]);
            v12 = *v7;
            *v7 = *v11;
            *v11 = v12;
          }
          v13 = *v7;
          v439 = a3 - 1;
          if ((a4 & 1) == 0)
          {
            v17 = *(v7 - 1);
            v18 = (unsigned __int16 *)((char *)v17 - *v17);
            if (*v18 >= 5u && (v19 = v18[2]) != 0)
            {
              v20 = (unsigned int *)((char *)v17 + v19);
              v21 = *v20;
              v22 = (char *)v20 + v21 + 4;
              v23 = *(unsigned int *)((char *)v20 + v21);
            }
            else
            {
              v23 = 0;
              v22 = 0;
            }
            v24 = *v13;
            v25 = (char *)v13 - v24;
            v16 = *(unsigned __int16 *)((char *)v13 - v24);
            if (v16 >= 5 && *((_WORD *)v25 + 2))
            {
              v26 = (unsigned int *)((char *)v13 + *((unsigned __int16 *)v25 + 2));
              v27 = *v26;
              v28 = (char *)v26 + v27 + 4;
              v29 = *(unsigned int *)((char *)v26 + v27);
            }
            else
            {
              v29 = 0;
              v28 = 0;
            }
            v15 = -v24;
            if (v29 >= v23)
              v30 = v23;
            else
              v30 = v29;
            v31 = memcmp(v22, v28, v30);
            if (v31)
            {
              if (v31 < 0)
                goto LABEL_24;
            }
            else if (v23 < v29)
            {
              goto LABEL_24;
            }
            if (v16 >= 5 && *((_WORD *)v25 + 2))
            {
              v77 = (unsigned int *)((char *)v13 + *((unsigned __int16 *)v25 + 2));
              v78 = *v77;
              v79 = (char *)v77 + v78 + 4;
              v80 = *(unsigned int *)((char *)v77 + v78);
            }
            else
            {
              v80 = 0;
              v79 = 0;
            }
            v111 = (unsigned __int16 *)((char *)*v441 - **v441);
            if (*v111 >= 5u && (v112 = v111[2]) != 0)
            {
              v113 = (unsigned int *)((char *)*v441 + v112);
              v114 = *v113;
              v115 = (char *)v113 + v114 + 4;
              v116 = *(unsigned int *)((char *)v113 + v114);
            }
            else
            {
              v116 = 0;
              v115 = 0;
            }
            if (v116 >= v80)
              v117 = v80;
            else
              v117 = v116;
            result = memcmp(v79, v115, v117);
            if ((_DWORD)result)
            {
              if ((result & 0x80000000) != 0)
                goto LABEL_137;
            }
            else if (v80 < v116)
            {
LABEL_137:
              v118 = v7 + 1;
              do
              {
                v6 = v118;
                if (v16 >= 5 && *((_WORD *)v25 + 2))
                {
                  v119 = (unsigned int *)((char *)v13 + *((unsigned __int16 *)v25 + 2));
                  v120 = *v119;
                  v121 = (char *)v119 + v120 + 4;
                  v122 = *(unsigned int *)((char *)v119 + v120);
                }
                else
                {
                  v122 = 0;
                  v121 = 0;
                }
                v123 = (unsigned __int16 *)((char *)*v6 - **v6);
                if (*v123 >= 5u && (v124 = v123[2]) != 0)
                {
                  v125 = (unsigned int *)((char *)*v6 + v124);
                  v126 = *v125;
                  v127 = (char *)v125 + v126 + 4;
                  v128 = *(unsigned int *)((char *)v125 + v126);
                }
                else
                {
                  v128 = 0;
                  v127 = 0;
                }
                if (v128 >= v122)
                  v129 = v122;
                else
                  v129 = v128;
                result = memcmp(v121, v127, v129);
                if (!(_DWORD)result)
                {
                  if (v122 == v128)
                  {
                    result = 0;
                  }
                  else
                  {
                    if (v122 < v128)
                      goto LABEL_176;
                    result = 1;
                  }
                }
                v118 = v6 + 1;
              }
              while ((result & 0x80000000) == 0);
              goto LABEL_176;
            }
            v130 = v7 + 1;
            do
            {
              v6 = v130;
              if (v130 >= v5)
                break;
              if (v16 >= 5 && *((_WORD *)v25 + 2))
              {
                v131 = (unsigned int *)((char *)v13 + *((unsigned __int16 *)v25 + 2));
                v132 = *v131;
                v133 = (char *)v131 + v132 + 4;
                v134 = *(unsigned int *)((char *)v131 + v132);
              }
              else
              {
                v134 = 0;
                v133 = 0;
              }
              v135 = (unsigned __int16 *)((char *)*v6 - **v6);
              if (*v135 >= 5u && (v136 = v135[2]) != 0)
              {
                v137 = (unsigned int *)((char *)*v6 + v136);
                v138 = *v137;
                v139 = (char *)v137 + v138 + 4;
                v140 = *(unsigned int *)((char *)v137 + v138);
              }
              else
              {
                v140 = 0;
                v139 = 0;
              }
              if (v140 >= v134)
                v141 = v134;
              else
                v141 = v140;
              result = memcmp(v133, v139, v141);
              if (!(_DWORD)result)
              {
                if (v134 == v140)
                {
                  result = 0;
                }
                else
                {
                  if (v134 < v140)
                    break;
                  result = 1;
                }
              }
              v130 = v6 + 1;
            }
            while ((result & 0x80000000) == 0);
LABEL_176:
            v142 = v5;
            if (v6 < v5)
            {
              v143 = a2 - 1;
              do
              {
                v142 = v143;
                if (v16 >= 5 && *((_WORD *)v25 + 2))
                {
                  v144 = (unsigned int *)((char *)v13 + *((unsigned __int16 *)v25 + 2));
                  v145 = *v144;
                  v146 = (char *)v144 + v145 + 4;
                  v147 = *(unsigned int *)((char *)v144 + v145);
                }
                else
                {
                  v147 = 0;
                  v146 = 0;
                }
                v148 = (unsigned __int16 *)((char *)*v142 - **v142);
                if (*v148 >= 5u && (v149 = v148[2]) != 0)
                {
                  v150 = (unsigned int *)((char *)*v142 + v149);
                  v151 = *v150;
                  v152 = (char *)v150 + v151 + 4;
                  v153 = *(unsigned int *)((char *)v150 + v151);
                }
                else
                {
                  v153 = 0;
                  v152 = 0;
                }
                if (v153 >= v147)
                  v154 = v147;
                else
                  v154 = v153;
                result = memcmp(v146, v152, v154);
                if (!(_DWORD)result)
                {
                  if (v147 >= v153)
                    break;
                  result = 0xFFFFFFFFLL;
                }
                v143 = v142 - 1;
              }
              while ((result & 0x80000000) != 0);
            }
            if (v6 < v142)
            {
              v155 = *v6;
              v156 = *v142;
              do
              {
                *v6 = v156;
                *v142 = v155;
                v157 = v6 + 1;
                do
                {
                  v6 = v157;
                  v155 = *v157;
                  if (v16 >= 5 && *((_WORD *)v25 + 2))
                  {
                    v158 = (unsigned int *)((char *)v13 + *((unsigned __int16 *)v25 + 2));
                    v159 = *v158;
                    v160 = (char *)v158 + v159 + 4;
                    v161 = *(unsigned int *)((char *)v158 + v159);
                  }
                  else
                  {
                    v161 = 0;
                    v160 = 0;
                  }
                  v162 = (unsigned __int16 *)((char *)v155 - *v155);
                  if (*v162 >= 5u && (v163 = v162[2]) != 0)
                  {
                    v164 = (unsigned int *)((char *)v155 + v163);
                    v165 = *v164;
                    v166 = (char *)v164 + v165 + 4;
                    v167 = *(unsigned int *)((char *)v164 + v165);
                  }
                  else
                  {
                    v167 = 0;
                    v166 = 0;
                  }
                  if (v167 >= v161)
                    v168 = v161;
                  else
                    v168 = v167;
                  v169 = memcmp(v160, v166, v168);
                  if (!v169)
                  {
                    if (v161 == v167)
                    {
                      v169 = 0;
                    }
                    else
                    {
                      if (v161 < v167)
                        break;
                      v169 = 1;
                    }
                  }
                  v157 = v6 + 1;
                }
                while ((v169 & 0x80000000) == 0);
                v170 = v142 - 1;
                do
                {
                  v142 = v170;
                  v156 = *v170;
                  if (v16 >= 5 && *((_WORD *)v25 + 2))
                  {
                    v171 = (unsigned int *)((char *)v13 + *((unsigned __int16 *)v25 + 2));
                    v172 = *v171;
                    v173 = (char *)v171 + v172 + 4;
                    v174 = *(unsigned int *)((char *)v171 + v172);
                  }
                  else
                  {
                    v174 = 0;
                    v173 = 0;
                  }
                  v175 = (unsigned __int16 *)((char *)v156 - *v156);
                  if (*v175 >= 5u && (v176 = v175[2]) != 0)
                  {
                    v177 = (unsigned int *)((char *)v156 + v176);
                    v178 = *v177;
                    v179 = (char *)v177 + v178 + 4;
                    v180 = *(unsigned int *)((char *)v177 + v178);
                  }
                  else
                  {
                    v180 = 0;
                    v179 = 0;
                  }
                  if (v180 >= v174)
                    v181 = v174;
                  else
                    v181 = v180;
                  result = memcmp(v173, v179, v181);
                  if (!(_DWORD)result)
                  {
                    if (v174 >= v180)
                      break;
                    result = 0xFFFFFFFFLL;
                  }
                  v170 = v142 - 1;
                }
                while ((result & 0x80000000) != 0);
              }
              while (v6 < v142);
            }
            v182 = v6 - 1;
            v5 = a2;
            if (v6 - 1 != v446)
              *v446 = *v182;
            a4 = 0;
            *v182 = v13;
            a3 = v439;
            continue;
          }
          v14 = *v13;
          v15 = -v14;
          v16 = *(unsigned __int16 *)((char *)v13 - v14);
LABEL_24:
          v32 = (char *)v13 + v15;
          v33 = 8;
          do
          {
            v34 = v33;
            v35 = *(int **)((char *)v7 + v33);
            v36 = (unsigned __int16 *)((char *)v35 - *v35);
            if (*v36 >= 5u && (v37 = v36[2]) != 0)
            {
              v38 = (unsigned int *)((char *)v35 + v37);
              v39 = *v38;
              v40 = (char *)v38 + v39 + 4;
              v41 = *(unsigned int *)((char *)v38 + v39);
            }
            else
            {
              v41 = 0;
              v40 = 0;
            }
            if (v16 >= 5 && *((_WORD *)v32 + 2))
            {
              v42 = (unsigned int *)((char *)v13 + *((unsigned __int16 *)v32 + 2));
              v43 = *v42;
              v44 = (char *)v42 + v43 + 4;
              v45 = *(unsigned int *)((char *)v42 + v43);
            }
            else
            {
              v45 = 0;
              v44 = 0;
            }
            if (v45 >= v41)
              v46 = v41;
            else
              v46 = v45;
            v47 = memcmp(v40, v44, v46);
            if (!v47)
            {
              if (v41 >= v45)
                break;
              v47 = -1;
            }
            v33 = v34 + 8;
          }
          while (v47 < 0);
          v6 = (int **)((char *)v7 + v34);
          v48 = a2 - 1;
          if (v34 == 8)
          {
            v63 = a2 - 1;
            while (1)
            {
              v49 = v63;
              v64 = v63 + 1;
              if (v6 >= v64)
                break;
              v65 = (unsigned __int16 *)((char *)*v49 - **v49);
              if (*v65 >= 5u && (v66 = v65[2]) != 0)
              {
                v67 = (unsigned int *)((char *)*v49 + v66);
                v68 = *v67;
                v69 = (char *)v67 + v68 + 4;
                v70 = *(unsigned int *)((char *)v67 + v68);
              }
              else
              {
                v70 = 0;
                v69 = 0;
              }
              if (v16 >= 5 && *((_WORD *)v32 + 2))
              {
                v71 = (unsigned int *)((char *)v13 + *((unsigned __int16 *)v32 + 2));
                v72 = *v71;
                v73 = (char *)v71 + v72 + 4;
                v74 = *(unsigned int *)((char *)v71 + v72);
              }
              else
              {
                v74 = 0;
                v73 = 0;
              }
              if (v74 >= v70)
                v75 = v70;
              else
                v75 = v74;
              v76 = memcmp(v69, v73, v75);
              if (!v76)
              {
                if (v70 == v74)
                {
                  v76 = 0;
                }
                else
                {
                  if (v70 < v74)
                    goto LABEL_84;
                  v76 = 1;
                }
              }
              v63 = v49 - 1;
              if (v76 < 0)
                goto LABEL_84;
            }
            v49 = v64;
          }
          else
          {
            do
            {
              v49 = v48;
              v50 = *v48;
              v51 = (unsigned __int16 *)((char *)v50 - *v50);
              if (*v51 >= 5u && (v52 = v51[2]) != 0)
              {
                v53 = (unsigned int *)((char *)v50 + v52);
                v54 = *v53;
                v55 = (char *)v53 + v54 + 4;
                v56 = *(unsigned int *)((char *)v53 + v54);
              }
              else
              {
                v56 = 0;
                v55 = 0;
              }
              if (v16 >= 5 && *((_WORD *)v32 + 2))
              {
                v57 = (unsigned int *)((char *)v13 + *((unsigned __int16 *)v32 + 2));
                v58 = *v57;
                v59 = (char *)v57 + v58 + 4;
                v60 = *(unsigned int *)((char *)v57 + v58);
              }
              else
              {
                v60 = 0;
                v59 = 0;
              }
              if (v60 >= v56)
                v61 = v56;
              else
                v61 = v60;
              v62 = memcmp(v55, v59, v61);
              if (!v62)
              {
                if (v56 == v60)
                {
                  v62 = 0;
                }
                else
                {
                  if (v56 < v60)
                    break;
                  v62 = 1;
                }
              }
              v48 = v49 - 1;
            }
            while ((v62 & 0x80000000) == 0);
          }
LABEL_84:
          v437 = v6;
          if (v6 < v49)
          {
            v81 = *v49;
            v82 = v49;
            do
            {
              *v6 = v81;
              *v82 = v35;
              v83 = v6 + 1;
              do
              {
                v6 = v83;
                v35 = *v83;
                v84 = (unsigned __int16 *)((char *)*v83 - **v83);
                if (*v84 >= 5u && (v85 = v84[2]) != 0)
                {
                  v86 = (unsigned int *)((char *)v35 + v85);
                  v87 = *v86;
                  v88 = (char *)v86 + v87 + 4;
                  v89 = *(unsigned int *)((char *)v86 + v87);
                }
                else
                {
                  v89 = 0;
                  v88 = 0;
                }
                if (v16 >= 5 && *((_WORD *)v32 + 2))
                {
                  v90 = (unsigned int *)((char *)v13 + *((unsigned __int16 *)v32 + 2));
                  v91 = *v90;
                  v92 = (char *)v90 + v91 + 4;
                  v93 = *(unsigned int *)((char *)v90 + v91);
                }
                else
                {
                  v93 = 0;
                  v92 = 0;
                }
                if (v93 >= v89)
                  v94 = v89;
                else
                  v94 = v93;
                v95 = memcmp(v88, v92, v94);
                if (!v95)
                {
                  if (v89 >= v93)
                    break;
                  v95 = -1;
                }
                v83 = v6 + 1;
              }
              while (v95 < 0);
              v96 = v82 - 1;
              do
              {
                v82 = v96;
                v81 = *v96;
                v97 = (unsigned __int16 *)((char *)*v96 - **v96);
                if (*v97 >= 5u && (v98 = v97[2]) != 0)
                {
                  v99 = (unsigned int *)((char *)v81 + v98);
                  v100 = *v99;
                  v101 = (char *)v99 + v100 + 4;
                  v102 = *(unsigned int *)((char *)v99 + v100);
                }
                else
                {
                  v102 = 0;
                  v101 = 0;
                }
                if (v16 >= 5 && *((_WORD *)v32 + 2))
                {
                  v103 = (unsigned int *)((char *)v13 + *((unsigned __int16 *)v32 + 2));
                  v104 = *v103;
                  v105 = (char *)v103 + v104 + 4;
                  v106 = *(unsigned int *)((char *)v103 + v104);
                }
                else
                {
                  v106 = 0;
                  v105 = 0;
                }
                if (v106 >= v102)
                  v107 = v102;
                else
                  v107 = v106;
                v108 = memcmp(v101, v105, v107);
                if (!v108)
                {
                  if (v102 == v106)
                  {
                    v108 = 0;
                  }
                  else
                  {
                    if (v102 < v106)
                      break;
                    v108 = 1;
                  }
                }
                v96 = v82 - 1;
              }
              while ((v108 & 0x80000000) == 0);
            }
            while (v6 < v82);
          }
          v109 = v6 - 1;
          if (v6 - 1 != v446)
            *v446 = *v109;
          *v109 = v13;
          a3 = v439;
          v5 = a2;
          if (v437 < v49)
            goto LABEL_126;
          v110 = sub_22A7156B4(v446, v6 - 1);
          result = sub_22A7156B4(v6, a2);
          if (!(_DWORD)result)
          {
            if (v110)
              continue;
LABEL_126:
            result = sub_22A713D44(v446, v6 - 1, v439, a4 & 1);
            a4 = 0;
            continue;
          }
          a2 = v6 - 1;
          if (v110)
            return result;
          goto LABEL_2;
        }
        if (v7 == v5)
          return result;
        v235 = (unint64_t)(v9 - 2) >> 1;
        v442 = v235;
        while (2)
        {
          v236 = v235;
          if (v442 >= v235)
          {
            v237 = (2 * v235) | 1;
            v238 = &v446[v237];
            if (2 * v235 + 2 < v9)
            {
              v239 = (unsigned __int16 *)((char *)*v238 - **v238);
              if (*v239 >= 5u && (v240 = v239[2]) != 0)
              {
                v241 = (unsigned int *)((char *)*v238 + v240);
                v242 = *v241;
                v243 = (char *)v241 + v242 + 4;
                v244 = *(unsigned int *)((char *)v241 + v242);
              }
              else
              {
                v244 = 0;
                v243 = 0;
              }
              v246 = v238[1];
              ++v238;
              v245 = v246;
              v247 = (unsigned __int16 *)((char *)v246 - *v246);
              if (*v247 >= 5u && (v248 = v247[2]) != 0)
              {
                v249 = (unsigned int *)((char *)v245 + v248);
                v250 = *v249;
                v251 = (char *)v249 + v250 + 4;
                v252 = *(unsigned int *)((char *)v249 + v250);
              }
              else
              {
                v252 = 0;
                v251 = 0;
              }
              if (v252 >= v244)
                v253 = v244;
              else
                v253 = v252;
              v254 = memcmp(v243, v251, v253);
              if (v244 < v252)
                v255 = -1;
              else
                v255 = 1;
              if (v244 == v252)
                v255 = 0;
              if (v254)
                v255 = v254;
              if (v255 < 0)
                v237 = 2 * v236 + 2;
              else
                v238 = &v446[v237];
            }
            v256 = &v446[v236];
            v257 = *v238;
            v440 = *v256;
            v258 = (unsigned __int16 *)((char *)v257 - *v257);
            if (*v258 >= 5u && (v259 = v258[2]) != 0)
            {
              v260 = (unsigned int *)((char *)v257 + v259);
              v261 = *v260;
              v262 = (char *)v260 + v261 + 4;
              v263 = *(unsigned int *)((char *)v260 + v261);
            }
            else
            {
              v263 = 0;
              v262 = 0;
            }
            v264 = (unsigned __int16 *)((char *)v440 - *v440);
            v265 = *v264;
            if (v265 >= 5 && v264[2])
            {
              v266 = (unsigned int *)((char *)v440 + v264[2]);
              v267 = *v266;
              v268 = (char *)v266 + v267 + 4;
              v269 = *(unsigned int *)((char *)v266 + v267);
            }
            else
            {
              v269 = 0;
              v268 = 0;
            }
            if (v269 >= v263)
              v270 = v263;
            else
              v270 = v269;
            result = memcmp(v262, v268, v270);
            if ((_DWORD)result)
            {
              if ((result & 0x80000000) != 0)
                goto LABEL_374;
            }
            else if (v263 < v269)
            {
              goto LABEL_374;
            }
            v438 = v264;
            do
            {
              v271 = v238;
              *v256 = v257;
              if (v442 < v237)
                break;
              v272 = (2 * v237) | 1;
              v238 = &v446[v272];
              if (2 * v237 + 2 >= v9)
              {
                v237 = (2 * v237) | 1;
              }
              else
              {
                v273 = (unsigned __int16 *)((char *)*v238 - **v238);
                if (*v273 >= 5u && (v274 = v273[2]) != 0)
                {
                  v275 = (unsigned int *)((char *)*v238 + v274);
                  v276 = *v275;
                  v277 = (char *)v275 + v276 + 4;
                  v278 = *(unsigned int *)((char *)v275 + v276);
                }
                else
                {
                  v278 = 0;
                  v277 = 0;
                }
                v280 = v238[1];
                ++v238;
                v279 = v280;
                v281 = (unsigned __int16 *)((char *)v280 - *v280);
                if (*v281 >= 5u && (v282 = v281[2]) != 0)
                {
                  v283 = (unsigned int *)((char *)v279 + v282);
                  v284 = *v283;
                  v285 = (char *)v283 + v284 + 4;
                  v286 = *(unsigned int *)((char *)v283 + v284);
                }
                else
                {
                  v286 = 0;
                  v285 = 0;
                }
                if (v286 >= v278)
                  v287 = v278;
                else
                  v287 = v286;
                v288 = memcmp(v277, v285, v287);
                if (v278 < v286)
                  v289 = -1;
                else
                  v289 = 1;
                if (v278 == v286)
                  v289 = 0;
                if (v288)
                  v289 = v288;
                if (v289 < 0)
                {
                  v237 = 2 * v237 + 2;
                }
                else
                {
                  v238 = &v446[v272];
                  v237 = (2 * v237) | 1;
                }
              }
              v257 = *v238;
              v290 = (unsigned __int16 *)((char *)*v238 - **v238);
              if (*v290 >= 5u && (v291 = v290[2]) != 0)
              {
                v292 = (unsigned int *)((char *)v257 + v291);
                v293 = *v292;
                v294 = (char *)v292 + v293 + 4;
                v295 = *(unsigned int *)((char *)v292 + v293);
              }
              else
              {
                v295 = 0;
                v294 = 0;
              }
              if (v265 >= 5 && v438[2])
              {
                v296 = (unsigned int *)((char *)v440 + v438[2]);
                v297 = *v296;
                v298 = (char *)v296 + v297 + 4;
                v299 = *(unsigned int *)((char *)v296 + v297);
              }
              else
              {
                v299 = 0;
                v298 = 0;
              }
              if (v299 >= v295)
                v300 = v295;
              else
                v300 = v299;
              result = memcmp(v294, v298, v300);
              if (!(_DWORD)result)
              {
                if (v295 == v299)
                {
                  result = 0;
                }
                else
                {
                  if (v295 < v299)
                    break;
                  result = 1;
                }
              }
              v256 = v271;
            }
            while ((result & 0x80000000) == 0);
            *v271 = v440;
          }
LABEL_374:
          v235 = v236 - 1;
          if (v236)
            continue;
          break;
        }
        do
        {
          v301 = 0;
          v302 = v446;
          v443 = *v446;
          do
          {
            v303 = &v302[v301 + 1];
            v304 = v303;
            v305 = (2 * v301) | 1;
            v306 = 2 * v301 + 2;
            if (v306 < v9)
            {
              v307 = (unsigned __int16 *)((char *)*v303 - **v303);
              if (*v307 >= 5u && (v308 = v307[2]) != 0)
              {
                v309 = (unsigned int *)((char *)*v303 + v308);
                v310 = *v309;
                v311 = (char *)v309 + v310 + 4;
                v312 = *(unsigned int *)((char *)v309 + v310);
              }
              else
              {
                v312 = 0;
                v311 = 0;
              }
              v304 = v303 + 1;
              v313 = v303[1];
              v314 = (unsigned __int16 *)((char *)v313 - *v313);
              if (*v314 >= 5u && (v315 = v314[2]) != 0)
              {
                v316 = (unsigned int *)((char *)v313 + v315);
                v317 = *v316;
                v318 = (char *)v316 + v317 + 4;
                v319 = *(unsigned int *)((char *)v316 + v317);
              }
              else
              {
                v319 = 0;
                v318 = 0;
              }
              if (v319 >= v312)
                v320 = v312;
              else
                v320 = v319;
              result = memcmp(v311, v318, v320);
              if (v312 < v319)
                v321 = -1;
              else
                v321 = 1;
              if (v312 == v319)
                v321 = 0;
              if ((_DWORD)result)
                v321 = result;
              if (v321 < 0)
                v305 = v306;
              else
                v304 = v303;
            }
            *v302 = *v304;
            v302 = v304;
            v301 = v305;
          }
          while (v305 <= (uint64_t)((unint64_t)(v9 - 2) >> 1));
          v322 = a2 - 1;
          v203 = v304 == --a2;
          if (v203)
          {
            *v304 = v443;
          }
          else
          {
            *v304 = *v322;
            *v322 = v443;
            v323 = (char *)v304 - (char *)v446 + 8;
            if (v323 >= 9)
            {
              v324 = (((unint64_t)v323 >> 3) - 2) >> 1;
              v325 = &v446[v324];
              v326 = *v325;
              v327 = (unsigned __int16 *)((char *)*v325 - **v325);
              if (*v327 >= 5u && (v328 = v327[2]) != 0)
              {
                v329 = (unsigned int *)((char *)v326 + v328);
                v330 = *v329;
                v331 = (char *)v329 + v330 + 4;
                v332 = *(unsigned int *)((char *)v329 + v330);
              }
              else
              {
                v332 = 0;
                v331 = 0;
              }
              v444 = *v304;
              v333 = (unsigned __int16 *)((char *)*v304 - **v304);
              v334 = *v333;
              if (v334 >= 5 && v333[2])
              {
                v335 = (unsigned int *)((char *)v444 + v333[2]);
                v336 = *v335;
                v337 = (char *)v335 + v336 + 4;
                v338 = *(unsigned int *)((char *)v335 + v336);
              }
              else
              {
                v338 = 0;
                v337 = 0;
              }
              if (v338 >= v332)
                v339 = v332;
              else
                v339 = v338;
              result = memcmp(v331, v337, v339);
              if ((_DWORD)result)
              {
                if ((result & 0x80000000) != 0)
                  goto LABEL_417;
              }
              else if (v332 < v338)
              {
                do
                {
LABEL_417:
                  v340 = v325;
                  *v304 = v326;
                  if (!v324)
                    break;
                  v324 = (v324 - 1) >> 1;
                  v325 = &v446[v324];
                  v326 = *v325;
                  v341 = (unsigned __int16 *)((char *)*v325 - **v325);
                  if (*v341 >= 5u && (v342 = v341[2]) != 0)
                  {
                    v343 = (unsigned int *)((char *)v326 + v342);
                    v344 = *v343;
                    v345 = (char *)v343 + v344 + 4;
                    v346 = *(unsigned int *)((char *)v343 + v344);
                  }
                  else
                  {
                    v346 = 0;
                    v345 = 0;
                  }
                  if (v334 >= 5 && v333[2])
                  {
                    v347 = (unsigned int *)((char *)v444 + v333[2]);
                    v348 = *v347;
                    v349 = (char *)v347 + v348 + 4;
                    v350 = *(unsigned int *)((char *)v347 + v348);
                  }
                  else
                  {
                    v350 = 0;
                    v349 = 0;
                  }
                  if (v350 >= v346)
                    v351 = v346;
                  else
                    v351 = v350;
                  result = memcmp(v345, v349, v351);
                  if (!(_DWORD)result)
                  {
                    if (v346 >= v350)
                      break;
                    result = 0xFFFFFFFFLL;
                  }
                  v304 = v340;
                }
                while ((result & 0x80000000) != 0);
                *v340 = v444;
              }
            }
          }
        }
        while (v9-- > 2);
        return result;
    }
  }
}

uint64_t sub_22A715364(int **a1, int **a2, int **a3)
{
  int *v4;
  int *v5;
  unsigned __int16 *v6;
  unsigned int v7;
  int **v8;
  unsigned int *v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  unsigned __int16 *v13;
  unsigned int v14;
  unsigned int *v15;
  uint64_t v16;
  char *v17;
  size_t v18;
  size_t v19;
  int v20;
  int *v21;
  unsigned __int16 *v22;
  uint64_t v23;
  unsigned int *v24;
  uint64_t v25;
  char *v26;
  size_t v27;
  int *v28;
  unsigned __int16 *v29;
  uint64_t v30;
  unsigned int *v31;
  uint64_t v32;
  char *v33;
  size_t v34;
  unsigned int *v35;
  uint64_t v36;
  char *v37;
  size_t v38;
  unsigned int *v39;
  uint64_t v40;
  char *v41;
  size_t v42;
  size_t v43;
  uint64_t result;
  size_t v45;
  int **v46;
  int *v47;
  unsigned __int16 *v48;
  uint64_t v49;
  unsigned int *v50;
  uint64_t v51;
  char *v52;
  size_t v53;
  int *v54;
  int *v55;
  unsigned __int16 *v56;
  uint64_t v57;
  unsigned int *v58;
  uint64_t v59;
  char *v60;
  size_t v61;
  unsigned int *v62;
  uint64_t v63;
  char *v64;
  size_t v65;
  unsigned __int16 *v66;
  uint64_t v67;
  unsigned int *v68;
  uint64_t v69;
  char *v70;
  size_t v71;
  size_t v72;
  size_t v73;

  v4 = *a2;
  v5 = *a1;
  v6 = (unsigned __int16 *)((char *)v4 - *v4);
  v7 = *v6;
  if (v7 >= 5 && v6[2])
  {
    v8 = a2;
    v9 = (unsigned int *)((char *)v4 + v6[2]);
    v10 = *v9;
    v11 = (char *)v9 + v10 + 4;
    v12 = *(unsigned int *)((char *)v9 + v10);
  }
  else
  {
    v8 = a2;
    v12 = 0;
    v11 = 0;
  }
  v13 = (unsigned __int16 *)((char *)v5 - *v5);
  v14 = *v13;
  if (v14 >= 5 && v13[2])
  {
    v15 = (unsigned int *)((char *)v5 + v13[2]);
    v16 = *v15;
    v17 = (char *)v15 + v16 + 4;
    v18 = *(unsigned int *)((char *)v15 + v16);
  }
  else
  {
    v18 = 0;
    v17 = 0;
  }
  if (v18 >= v12)
    v19 = v12;
  else
    v19 = v18;
  v20 = memcmp(v11, v17, v19);
  if (v20)
  {
    if (v20 < 0)
    {
LABEL_14:
      v21 = *a3;
      v22 = (unsigned __int16 *)((char *)*a3 - **a3);
      if (*v22 >= 5u && (v23 = v22[2]) != 0)
      {
        v24 = (unsigned int *)((char *)v21 + v23);
        v25 = *v24;
        v26 = (char *)v24 + v25 + 4;
        v27 = *(unsigned int *)((char *)v24 + v25);
      }
      else
      {
        v27 = 0;
        v26 = 0;
      }
      if (v7 >= 5 && v6[2])
      {
        v35 = (unsigned int *)((char *)v4 + v6[2]);
        v36 = *v35;
        v37 = (char *)v35 + v36 + 4;
        v38 = *(unsigned int *)((char *)v35 + v36);
      }
      else
      {
        v38 = 0;
        v37 = 0;
      }
      if (v38 >= v27)
        v43 = v27;
      else
        v43 = v38;
      result = memcmp(v26, v37, v43);
      if ((_DWORD)result)
      {
        if ((result & 0x80000000) != 0)
        {
LABEL_35:
          *a1 = v21;
LABEL_75:
          *a3 = v5;
          return result;
        }
      }
      else if (v27 < v38)
      {
        goto LABEL_35;
      }
      *a1 = v4;
      v46 = v8;
      *v8 = v5;
      v47 = *a3;
      v48 = (unsigned __int16 *)((char *)*a3 - **a3);
      if (*v48 >= 5u && (v49 = v48[2]) != 0)
      {
        v50 = (unsigned int *)((char *)v47 + v49);
        v51 = *v50;
        v52 = (char *)v50 + v51 + 4;
        v53 = *(unsigned int *)((char *)v50 + v51);
      }
      else
      {
        v53 = 0;
        v52 = 0;
      }
      if (v14 >= 5 && v13[2])
      {
        v62 = (unsigned int *)((char *)v5 + v13[2]);
        v63 = *v62;
        v64 = (char *)v62 + v63 + 4;
        v65 = *(unsigned int *)((char *)v62 + v63);
      }
      else
      {
        v65 = 0;
        v64 = 0;
      }
      if (v65 >= v53)
        v72 = v53;
      else
        v72 = v65;
      result = memcmp(v52, v64, v72);
      if ((_DWORD)result)
      {
        if ((result & 0x80000000) == 0)
          return result;
      }
      else if (v53 >= v65)
      {
        return result;
      }
      *v46 = v47;
      goto LABEL_75;
    }
  }
  else if (v12 < v18)
  {
    goto LABEL_14;
  }
  v28 = *a3;
  v29 = (unsigned __int16 *)((char *)*a3 - **a3);
  if (*v29 >= 5u && (v30 = v29[2]) != 0)
  {
    v31 = (unsigned int *)((char *)v28 + v30);
    v32 = *v31;
    v33 = (char *)v31 + v32 + 4;
    v34 = *(unsigned int *)((char *)v31 + v32);
  }
  else
  {
    v34 = 0;
    v33 = 0;
  }
  if (v7 >= 5 && v6[2])
  {
    v39 = (unsigned int *)((char *)v4 + v6[2]);
    v40 = *v39;
    v41 = (char *)v39 + v40 + 4;
    v42 = *(unsigned int *)((char *)v39 + v40);
  }
  else
  {
    v42 = 0;
    v41 = 0;
  }
  if (v42 >= v34)
    v45 = v34;
  else
    v45 = v42;
  result = memcmp(v33, v41, v45);
  if ((_DWORD)result)
  {
    if ((result & 0x80000000) == 0)
      return result;
  }
  else if (v34 >= v42)
  {
    return result;
  }
  *v8 = v28;
  *a3 = v4;
  v54 = *v8;
  v55 = *a1;
  v56 = (unsigned __int16 *)((char *)*v8 - **v8);
  if (*v56 >= 5u && (v57 = v56[2]) != 0)
  {
    v58 = (unsigned int *)((char *)v54 + v57);
    v59 = *v58;
    v60 = (char *)v58 + v59 + 4;
    v61 = *(unsigned int *)((char *)v58 + v59);
  }
  else
  {
    v61 = 0;
    v60 = 0;
  }
  v66 = (unsigned __int16 *)((char *)v55 - *v55);
  if (*v66 >= 5u && (v67 = v66[2]) != 0)
  {
    v68 = (unsigned int *)((char *)v55 + v67);
    v69 = *v68;
    v70 = (char *)v68 + v69 + 4;
    v71 = *(unsigned int *)((char *)v68 + v69);
  }
  else
  {
    v71 = 0;
    v70 = 0;
  }
  if (v71 >= v61)
    v73 = v61;
  else
    v73 = v71;
  result = memcmp(v60, v70, v73);
  if (!(_DWORD)result)
  {
    if (v61 >= v71)
      return result;
    goto LABEL_77;
  }
  if ((result & 0x80000000) != 0)
  {
LABEL_77:
    *a1 = v54;
    *v8 = v55;
  }
  return result;
}

BOOL sub_22A7156B4(int **a1, int **a2)
{
  int **v2;
  uint64_t v3;
  _BOOL8 result;
  int *v5;
  int *v6;
  unsigned __int16 *v7;
  uint64_t v8;
  unsigned int *v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  int **v13;
  int **v14;
  uint64_t v15;
  int v16;
  int *v17;
  unsigned __int16 *v18;
  unsigned int v19;
  unsigned int *v20;
  uint64_t v21;
  char *v22;
  size_t v23;
  int *v24;
  unsigned __int16 *v25;
  uint64_t v26;
  unsigned int *v27;
  uint64_t v28;
  char *v29;
  size_t v30;
  size_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  unsigned int *v36;
  uint64_t v37;
  char *v38;
  size_t v39;
  unsigned __int16 *v40;
  uint64_t v41;
  unsigned int *v42;
  uint64_t v43;
  char *v44;
  size_t v45;
  size_t v46;
  int v47;
  int **v48;
  int **v49;
  int **v50;
  int *v51;
  int *v52;
  unsigned __int16 *v53;
  uint64_t v54;
  unsigned int *v55;
  uint64_t v56;
  char *v57;
  size_t v58;
  unsigned __int16 *v59;
  uint64_t v60;
  unsigned int *v61;
  uint64_t v62;
  char *v63;
  size_t v64;
  unsigned __int16 *v65;
  uint64_t v66;
  unsigned int *v67;
  uint64_t v68;
  char *v69;
  size_t v70;
  size_t v71;
  int v72;
  size_t v73;
  int v74;
  int *v75;
  int *v76;
  unsigned __int16 *v77;
  unsigned int v78;
  unsigned int *v79;
  uint64_t v80;
  char *v81;
  size_t v82;
  unsigned __int16 *v83;
  uint64_t v84;
  unsigned int *v85;
  uint64_t v86;
  char *v87;
  size_t v88;
  size_t v89;
  int v90;
  int *v91;
  unsigned int *v92;
  uint64_t v93;
  char *v94;
  size_t v95;
  unsigned __int16 *v96;
  uint64_t v97;
  unsigned int *v98;
  uint64_t v99;
  char *v100;
  size_t v101;
  size_t v102;
  int v103;
  int *v104;
  unsigned int *v105;
  uint64_t v106;
  char *v107;
  size_t v108;
  unsigned __int16 *v109;
  uint64_t v110;
  unsigned int *v111;
  uint64_t v112;
  char *v113;
  size_t v114;
  size_t v115;
  int v116;
  int **v117;

  v2 = a2;
  v3 = a2 - a1;
  result = 1;
  switch(v3)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v5 = *(a2 - 1);
      v6 = *a1;
      v7 = (unsigned __int16 *)((char *)v5 - *v5);
      if (*v7 >= 5u && (v8 = v7[2]) != 0)
      {
        v9 = (unsigned int *)((char *)v5 + v8);
        v10 = *v9;
        v11 = (char *)v9 + v10 + 4;
        v12 = *(unsigned int *)((char *)v9 + v10);
      }
      else
      {
        v12 = 0;
        v11 = 0;
      }
      v59 = (unsigned __int16 *)((char *)v6 - *v6);
      if (*v59 >= 5u && (v60 = v59[2]) != 0)
      {
        v61 = (unsigned int *)((char *)v6 + v60);
        v62 = *v61;
        v63 = (char *)v61 + v62 + 4;
        v64 = *(unsigned int *)((char *)v61 + v62);
      }
      else
      {
        v64 = 0;
        v63 = 0;
      }
      if (v64 >= v12)
        v71 = v12;
      else
        v71 = v64;
      v72 = memcmp(v11, v63, v71);
      if (v72)
      {
        if ((v72 & 0x80000000) == 0)
          return 1;
      }
      else if (v12 >= v64)
      {
        return 1;
      }
      *a1 = v5;
      *(v2 - 1) = v6;
      return 1;
    case 3:
      sub_22A715364(a1, a1 + 1, a2 - 1);
      return 1;
    case 4:
      sub_22A715C4C(a1, a1 + 1, a1 + 2, a2 - 1);
      return 1;
    case 5:
      v49 = a1 + 2;
      v50 = a1 + 3;
      sub_22A715C4C(a1, a1 + 1, a1 + 2, a1 + 3);
      v51 = *(v2 - 1);
      v52 = a1[3];
      v53 = (unsigned __int16 *)((char *)v51 - *v51);
      if (*v53 >= 5u && (v54 = v53[2]) != 0)
      {
        v55 = (unsigned int *)((char *)v51 + v54);
        v56 = *v55;
        v57 = (char *)v55 + v56 + 4;
        v58 = *(unsigned int *)((char *)v55 + v56);
      }
      else
      {
        v58 = 0;
        v57 = 0;
      }
      v65 = (unsigned __int16 *)((char *)v52 - *v52);
      if (*v65 >= 5u && (v66 = v65[2]) != 0)
      {
        v67 = (unsigned int *)((char *)v52 + v66);
        v68 = *v67;
        v69 = (char *)v67 + v68 + 4;
        v70 = *(unsigned int *)((char *)v67 + v68);
      }
      else
      {
        v70 = 0;
        v69 = 0;
      }
      if (v70 >= v58)
        v73 = v58;
      else
        v73 = v70;
      v74 = memcmp(v57, v69, v73);
      if (v74)
      {
        if ((v74 & 0x80000000) == 0)
          return 1;
      }
      else if (v58 >= v70)
      {
        return 1;
      }
      *v50 = v51;
      *(v2 - 1) = v52;
      v75 = *v50;
      v76 = *v49;
      v77 = (unsigned __int16 *)((char *)*v50 - **v50);
      v78 = *v77;
      if (v78 >= 5 && v77[2])
      {
        v79 = (unsigned int *)((char *)v75 + v77[2]);
        v80 = *v79;
        v81 = (char *)v79 + v80 + 4;
        v82 = *(unsigned int *)((char *)v79 + v80);
      }
      else
      {
        v82 = 0;
        v81 = 0;
      }
      v83 = (unsigned __int16 *)((char *)v76 - *v76);
      if (*v83 >= 5u && (v84 = v83[2]) != 0)
      {
        v85 = (unsigned int *)((char *)v76 + v84);
        v86 = *v85;
        v87 = (char *)v85 + v86 + 4;
        v88 = *(unsigned int *)((char *)v85 + v86);
      }
      else
      {
        v88 = 0;
        v87 = 0;
      }
      if (v88 >= v82)
        v89 = v82;
      else
        v89 = v88;
      v90 = memcmp(v81, v87, v89);
      if (v90)
      {
        if ((v90 & 0x80000000) == 0)
          return 1;
      }
      else if (v82 >= v88)
      {
        return 1;
      }
      *v49 = v75;
      *v50 = v76;
      v91 = a1[1];
      if (v78 >= 5 && v77[2])
      {
        v92 = (unsigned int *)((char *)v75 + v77[2]);
        v93 = *v92;
        v94 = (char *)v92 + v93 + 4;
        v95 = *(unsigned int *)((char *)v92 + v93);
      }
      else
      {
        v95 = 0;
        v94 = 0;
      }
      v96 = (unsigned __int16 *)((char *)v91 - *v91);
      if (*v96 >= 5u && (v97 = v96[2]) != 0)
      {
        v98 = (unsigned int *)((char *)v91 + v97);
        v99 = *v98;
        v100 = (char *)v98 + v99 + 4;
        v101 = *(unsigned int *)((char *)v98 + v99);
      }
      else
      {
        v101 = 0;
        v100 = 0;
      }
      if (v101 >= v95)
        v102 = v95;
      else
        v102 = v101;
      v103 = memcmp(v94, v100, v102);
      if (v103)
      {
        if ((v103 & 0x80000000) == 0)
          return 1;
      }
      else if (v95 >= v101)
      {
        return 1;
      }
      a1[1] = v75;
      a1[2] = v91;
      v104 = *a1;
      if (v78 >= 5 && v77[2])
      {
        v105 = (unsigned int *)((char *)v75 + v77[2]);
        v106 = *v105;
        v107 = (char *)v105 + v106 + 4;
        v108 = *(unsigned int *)((char *)v105 + v106);
      }
      else
      {
        v108 = 0;
        v107 = 0;
      }
      v109 = (unsigned __int16 *)((char *)v104 - *v104);
      if (*v109 >= 5u && (v110 = v109[2]) != 0)
      {
        v111 = (unsigned int *)((char *)v104 + v110);
        v112 = *v111;
        v113 = (char *)v111 + v112 + 4;
        v114 = *(unsigned int *)((char *)v111 + v112);
      }
      else
      {
        v114 = 0;
        v113 = 0;
      }
      if (v114 >= v108)
        v115 = v108;
      else
        v115 = v114;
      v116 = memcmp(v107, v113, v115);
      if (v116)
      {
        if ((v116 & 0x80000000) == 0)
          return 1;
        goto LABEL_118;
      }
      if (v108 < v114)
      {
LABEL_118:
        *a1 = v75;
        a1[1] = v104;
      }
      return 1;
    default:
      v13 = a1 + 2;
      sub_22A715364(a1, a1 + 1, a1 + 2);
      v14 = a1 + 3;
      if (a1 + 3 == v2)
        return 1;
      v15 = 0;
      v16 = 0;
      v117 = v2;
      while (2)
      {
        v17 = *v14;
        v18 = (unsigned __int16 *)((char *)*v14 - **v14);
        v19 = *v18;
        if (v19 >= 5 && v18[2])
        {
          v20 = (unsigned int *)((char *)v17 + v18[2]);
          v21 = *v20;
          v22 = (char *)v20 + v21 + 4;
          v23 = *(unsigned int *)((char *)v20 + v21);
        }
        else
        {
          v23 = 0;
          v22 = 0;
        }
        v24 = *v13;
        v25 = (unsigned __int16 *)((char *)v24 - *v24);
        if (*v25 >= 5u && (v26 = v25[2]) != 0)
        {
          v27 = (unsigned int *)((char *)v24 + v26);
          v28 = *v27;
          v29 = (char *)v27 + v28 + 4;
          v30 = *(unsigned int *)((char *)v27 + v28);
        }
        else
        {
          v30 = 0;
          v29 = 0;
        }
        if (v30 >= v23)
          v31 = v23;
        else
          v31 = v30;
        v32 = memcmp(v22, v29, v31);
        if (v32)
        {
          if ((v32 & 0x80000000) == 0)
            goto LABEL_42;
        }
        else if (v23 >= v30)
        {
          goto LABEL_42;
        }
        v33 = v15;
        while (1)
        {
          v34 = v33;
          v35 = (char *)a1 + v33;
          *((_QWORD *)v35 + 3) = v24;
          if (v34 == -16)
            break;
          if (v19 >= 5 && v18[2])
          {
            v36 = (unsigned int *)((char *)v17 + v18[2]);
            v37 = *v36;
            v38 = (char *)v36 + v37 + 4;
            v39 = *(unsigned int *)((char *)v36 + v37);
          }
          else
          {
            v39 = 0;
            v38 = 0;
          }
          v24 = (int *)*((_QWORD *)v35 + 1);
          v40 = (unsigned __int16 *)((char *)v24 - *v24);
          if (*v40 >= 5u && (v41 = v40[2]) != 0)
          {
            v42 = (unsigned int *)((char *)v24 + v41);
            v43 = *v42;
            v44 = (char *)v42 + v43 + 4;
            v45 = *(unsigned int *)((char *)v42 + v43);
          }
          else
          {
            v45 = 0;
            v44 = 0;
          }
          if (v45 >= v39)
            v46 = v39;
          else
            v46 = v45;
          v47 = memcmp(v38, v44, v46);
          if (!v47)
          {
            if (v39 >= v45)
              goto LABEL_39;
            v47 = -1;
          }
          v33 = v34 - 8;
          if ((v47 & 0x80000000) == 0)
          {
LABEL_39:
            v48 = (int **)((char *)a1 + v34 + 16);
            goto LABEL_41;
          }
        }
        v48 = a1;
LABEL_41:
        v2 = v117;
        *v48 = v17;
        if (++v16 != 8)
        {
LABEL_42:
          v13 = v14;
          v15 += 8;
          if (++v14 == v2)
            return 1;
          continue;
        }
        return v14 + 1 == v117;
      }
  }
}

uint64_t sub_22A715C4C(int **a1, int **a2, int **a3, int **a4)
{
  int *v8;
  int *v9;
  unsigned __int16 *v10;
  uint64_t v11;
  unsigned int *v12;
  uint64_t v13;
  char *v14;
  size_t v15;
  unsigned __int16 *v16;
  uint64_t v17;
  unsigned int *v18;
  uint64_t v19;
  char *v20;
  size_t v21;
  size_t v22;
  uint64_t result;
  int *v24;
  int *v25;
  unsigned __int16 *v26;
  uint64_t v27;
  unsigned int *v28;
  uint64_t v29;
  char *v30;
  size_t v31;
  unsigned __int16 *v32;
  uint64_t v33;
  unsigned int *v34;
  uint64_t v35;
  char *v36;
  size_t v37;
  size_t v38;
  int *v39;
  int *v40;
  unsigned __int16 *v41;
  uint64_t v42;
  unsigned int *v43;
  uint64_t v44;
  char *v45;
  size_t v46;
  unsigned __int16 *v47;
  uint64_t v48;
  unsigned int *v49;
  uint64_t v50;
  char *v51;
  size_t v52;
  size_t v53;

  sub_22A715364(a1, a2, a3);
  v8 = *a4;
  v9 = *a3;
  v10 = (unsigned __int16 *)((char *)*a4 - **a4);
  if (*v10 >= 5u && (v11 = v10[2]) != 0)
  {
    v12 = (unsigned int *)((char *)v8 + v11);
    v13 = *v12;
    v14 = (char *)v12 + v13 + 4;
    v15 = *(unsigned int *)((char *)v12 + v13);
  }
  else
  {
    v15 = 0;
    v14 = 0;
  }
  v16 = (unsigned __int16 *)((char *)v9 - *v9);
  if (*v16 >= 5u && (v17 = v16[2]) != 0)
  {
    v18 = (unsigned int *)((char *)v9 + v17);
    v19 = *v18;
    v20 = (char *)v18 + v19 + 4;
    v21 = *(unsigned int *)((char *)v18 + v19);
  }
  else
  {
    v21 = 0;
    v20 = 0;
  }
  if (v21 >= v15)
    v22 = v15;
  else
    v22 = v21;
  result = memcmp(v14, v20, v22);
  if ((_DWORD)result)
  {
    if ((result & 0x80000000) == 0)
      return result;
  }
  else if (v15 >= v21)
  {
    return result;
  }
  *a3 = v8;
  *a4 = v9;
  v24 = *a3;
  v25 = *a2;
  v26 = (unsigned __int16 *)((char *)*a3 - **a3);
  if (*v26 >= 5u && (v27 = v26[2]) != 0)
  {
    v28 = (unsigned int *)((char *)v24 + v27);
    v29 = *v28;
    v30 = (char *)v28 + v29 + 4;
    v31 = *(unsigned int *)((char *)v28 + v29);
  }
  else
  {
    v31 = 0;
    v30 = 0;
  }
  v32 = (unsigned __int16 *)((char *)v25 - *v25);
  if (*v32 >= 5u && (v33 = v32[2]) != 0)
  {
    v34 = (unsigned int *)((char *)v25 + v33);
    v35 = *v34;
    v36 = (char *)v34 + v35 + 4;
    v37 = *(unsigned int *)((char *)v34 + v35);
  }
  else
  {
    v37 = 0;
    v36 = 0;
  }
  if (v37 >= v31)
    v38 = v31;
  else
    v38 = v37;
  result = memcmp(v30, v36, v38);
  if ((_DWORD)result)
  {
    if ((result & 0x80000000) == 0)
      return result;
  }
  else if (v31 >= v37)
  {
    return result;
  }
  *a2 = v24;
  *a3 = v25;
  v39 = *a2;
  v40 = *a1;
  v41 = (unsigned __int16 *)((char *)*a2 - **a2);
  if (*v41 >= 5u && (v42 = v41[2]) != 0)
  {
    v43 = (unsigned int *)((char *)v39 + v42);
    v44 = *v43;
    v45 = (char *)v43 + v44 + 4;
    v46 = *(unsigned int *)((char *)v43 + v44);
  }
  else
  {
    v46 = 0;
    v45 = 0;
  }
  v47 = (unsigned __int16 *)((char *)v40 - *v40);
  if (*v47 >= 5u && (v48 = v47[2]) != 0)
  {
    v49 = (unsigned int *)((char *)v40 + v48);
    v50 = *v49;
    v51 = (char *)v49 + v50 + 4;
    v52 = *(unsigned int *)((char *)v49 + v50);
  }
  else
  {
    v52 = 0;
    v51 = 0;
  }
  if (v52 >= v46)
    v53 = v46;
  else
    v53 = v52;
  result = memcmp(v45, v51, v53);
  if ((_DWORD)result)
  {
    if ((result & 0x80000000) == 0)
      return result;
  }
  else if (v46 >= v52)
  {
    return result;
  }
  *a1 = v39;
  *a2 = v40;
  return result;
}

const char *MTLGPUCompilerTimeStamp()
{
  return "Aug  3 2024 08:28:51";
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC360](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC368](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC370](c, data, *(_QWORD *)&len);
}

void operator delete(void *__p)
{
  off_24F488880(__p);
}

uint64_t operator delete()
{
  return off_24F488888();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24F488890(__sz);
}

uint64_t operator new()
{
  return off_24F488898();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

