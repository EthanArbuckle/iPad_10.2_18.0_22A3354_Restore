@implementation LSEnumerateExtensionPoints

void ___LSEnumerateExtensionPoints_block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  unint64_t v3;
  _DWORD *v6;
  _DWORD *v7;
  uint64_t v8;
  int v9;
  int v10;
  unsigned int v11;
  unint64_t v12;
  unint64_t v13;
  uint8x8_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *i;
  unint64_t v19;
  _DWORD *v20;
  _QWORD *v21;
  _QWORD *j;
  unint64_t v23;
  _DWORD *v24;
  _QWORD *v25;
  float v26;
  float v27;
  _BOOL4 v28;
  unint64_t v29;
  unint64_t v30;
  int8x8_t prime;
  void *v32;
  void *v33;
  uint64_t v34;
  _QWORD *v35;
  unint64_t v36;
  uint8x8_t v37;
  unint64_t v38;
  uint8x8_t v39;
  uint64_t v40;
  _QWORD *v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  unint64_t v46;
  void *v47;

  v6 = (_DWORD *)_LSGetExtensionPointData(*(_QWORD *)(a1 + 32), a3);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = v6[1];
    v10 = v6[11];
    v11 = v6[14];
    v12 = v10 ^ v9 ^ v11;
    v13 = *(_QWORD *)(v8 + 56);
    if (v13)
    {
      v14 = (uint8x8_t)vcnt_s8((int8x8_t)v13);
      v14.i16[0] = vaddlv_u8(v14);
      if (v14.u32[0] > 1uLL)
      {
        v15 = v10 ^ v9 ^ v11;
        if (v13 <= v12)
          v15 = v12 % v13;
      }
      else
      {
        v15 = ((_DWORD)v13 - 1) & v12;
      }
      v16 = *(_QWORD *)(v8 + 48);
      v17 = *(_QWORD **)(v16 + 8 * v15);
      if (v17)
      {
        for (i = (_QWORD *)*v17; i; i = (_QWORD *)*i)
        {
          v19 = i[1];
          if (v19 == v12)
          {
            v20 = (_DWORD *)i[2];
            if (v20[1] == v9 && v20[11] == v10 && v20[14] == v11)
              return;
          }
          else
          {
            if (v14.u32[0] > 1uLL)
            {
              if (v19 >= v13)
                v19 %= v13;
            }
            else
            {
              v19 &= v13 - 1;
            }
            if (v19 != v15)
              break;
          }
        }
      }
      if (v14.u32[0] > 1uLL)
      {
        v3 = v10 ^ v9 ^ v11;
        if (v13 <= v12)
          v3 = v12 % v13;
      }
      else
      {
        v3 = ((_DWORD)v13 - 1) & v12;
      }
      v21 = *(_QWORD **)(v16 + 8 * v3);
      if (v21)
      {
        for (j = (_QWORD *)*v21; j; j = (_QWORD *)*j)
        {
          v23 = j[1];
          if (v23 == v12)
          {
            v24 = (_DWORD *)j[2];
            if (v24[1] == v9 && v24[11] == v10 && v24[14] == v11)
              return;
          }
          else
          {
            if (v14.u32[0] > 1uLL)
            {
              if (v23 >= v13)
                v23 %= v13;
            }
            else
            {
              v23 &= v13 - 1;
            }
            if (v23 != v3)
              break;
          }
        }
      }
    }
    v25 = operator new(0x20uLL);
    *v25 = 0;
    v25[1] = v12;
    v25[2] = v7;
    *((_DWORD *)v25 + 6) = a3;
    v26 = (float)(unint64_t)(*(_QWORD *)(v8 + 72) + 1);
    v27 = *(float *)(v8 + 80);
    if (v13 && (float)(v27 * (float)v13) >= v26)
    {
      v12 = v3;
      goto LABEL_84;
    }
    v28 = (v13 & (v13 - 1)) == 0;
    if (v13 < 3)
      v28 = 0;
    v29 = (2 * v13) | !v28;
    v30 = vcvtps_u32_f32(v26 / v27);
    if (v29 <= v30)
      prime = (int8x8_t)v30;
    else
      prime = (int8x8_t)v29;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v13 = *(_QWORD *)(v8 + 56);
    }
    if (*(_QWORD *)&prime <= v13)
    {
      if (*(_QWORD *)&prime >= v13)
        goto LABEL_80;
      v38 = vcvtps_u32_f32((float)*(unint64_t *)(v8 + 72) / *(float *)(v8 + 80));
      if (v13 < 3 || (v39 = (uint8x8_t)vcnt_s8((int8x8_t)v13), v39.i16[0] = vaddlv_u8(v39), v39.u32[0] > 1uLL))
      {
        v38 = std::__next_prime(v38);
      }
      else
      {
        v40 = 1 << -(char)__clz(v38 - 1);
        if (v38 >= 2)
          v38 = v40;
      }
      if (*(_QWORD *)&prime <= v38)
        prime = (int8x8_t)v38;
      if (*(_QWORD *)&prime >= v13)
      {
        v13 = *(_QWORD *)(v8 + 56);
        goto LABEL_80;
      }
      if (!*(_QWORD *)&prime)
      {
        v47 = *(void **)(v8 + 48);
        *(_QWORD *)(v8 + 48) = 0;
        if (v47)
          operator delete(v47);
        v13 = 0;
        *(_QWORD *)(v8 + 56) = 0;
        goto LABEL_80;
      }
    }
    if (*(_QWORD *)&prime >> 61)
      std::__throw_bad_array_new_length[abi:nn180100]();
    v32 = operator new(8 * *(_QWORD *)&prime);
    v33 = *(void **)(v8 + 48);
    *(_QWORD *)(v8 + 48) = v32;
    if (v33)
      operator delete(v33);
    v34 = 0;
    *(int8x8_t *)(v8 + 56) = prime;
    do
      *(_QWORD *)(*(_QWORD *)(v8 + 48) + 8 * v34++) = 0;
    while (*(_QWORD *)&prime != v34);
    v35 = *(_QWORD **)(v8 + 64);
    if (v35)
    {
      v36 = v35[1];
      v37 = (uint8x8_t)vcnt_s8(prime);
      v37.i16[0] = vaddlv_u8(v37);
      if (v37.u32[0] > 1uLL)
      {
        if (v36 >= *(_QWORD *)&prime)
          v36 %= *(_QWORD *)&prime;
      }
      else
      {
        v36 &= *(_QWORD *)&prime - 1;
      }
      *(_QWORD *)(*(_QWORD *)(v8 + 48) + 8 * v36) = v8 + 64;
      v41 = (_QWORD *)*v35;
      if (*v35)
      {
        do
        {
          v42 = v41[1];
          if (v37.u32[0] > 1uLL)
          {
            if (v42 >= *(_QWORD *)&prime)
              v42 %= *(_QWORD *)&prime;
          }
          else
          {
            v42 &= *(_QWORD *)&prime - 1;
          }
          if (v42 != v36)
          {
            v43 = *(_QWORD *)(v8 + 48);
            if (!*(_QWORD *)(v43 + 8 * v42))
            {
              *(_QWORD *)(v43 + 8 * v42) = v35;
              goto LABEL_76;
            }
            *v35 = *v41;
            *v41 = **(_QWORD **)(*(_QWORD *)(v8 + 48) + 8 * v42);
            **(_QWORD **)(*(_QWORD *)(v8 + 48) + 8 * v42) = v41;
            v41 = v35;
          }
          v42 = v36;
LABEL_76:
          v35 = v41;
          v41 = (_QWORD *)*v41;
          v36 = v42;
        }
        while (v41);
      }
    }
    v13 = (unint64_t)prime;
LABEL_80:
    if ((v13 & (v13 - 1)) != 0)
    {
      if (v13 <= v12)
        v12 %= v13;
    }
    else
    {
      v12 = ((_DWORD)v13 - 1) & v12;
    }
LABEL_84:
    v44 = *(_QWORD *)(v8 + 48);
    v45 = *(_QWORD **)(v44 + 8 * v12);
    if (v45)
    {
      *v25 = *v45;
    }
    else
    {
      *v25 = *(_QWORD *)(v8 + 64);
      *(_QWORD *)(v8 + 64) = v25;
      *(_QWORD *)(v44 + 8 * v12) = v8 + 64;
      if (!*v25)
      {
LABEL_93:
        ++*(_QWORD *)(v8 + 72);
        return;
      }
      v46 = *(_QWORD *)(*v25 + 8);
      if ((v13 & (v13 - 1)) != 0)
      {
        if (v46 >= v13)
          v46 %= v13;
      }
      else
      {
        v46 &= v13 - 1;
      }
      v45 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 8 * v46);
    }
    *v45 = v25;
    goto LABEL_93;
  }
}

void ___LSEnumerateExtensionPoints_block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  _CSArrayEnumerateAllValues();

}

@end
