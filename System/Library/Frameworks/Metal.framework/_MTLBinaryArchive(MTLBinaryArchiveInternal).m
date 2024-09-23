@implementation _MTLBinaryArchive(MTLBinaryArchiveInternal)

+ (_QWORD)deserializeBinaryArchiveHeader:()MTLBinaryArchiveInternal fileData:device:
{
  unint64_t v2;
  unint64_t v4;
  unint64_t v5;
  uint8x8_t v6;
  _QWORD **v7;
  _QWORD *i;
  unint64_t v9;
  float v10;
  float v11;
  _BOOL4 v12;
  unint64_t v13;
  unint64_t v14;
  int8x8_t prime;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  uint8x8_t v21;
  unint64_t v22;
  uint8x8_t v23;
  uint64_t v24;
  _QWORD *v25;
  unint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  unint64_t v29;
  _QWORD *v31;

  v4 = *a2;
  v5 = *((_QWORD *)a1 + 1);
  if (v5)
  {
    v6 = (uint8x8_t)vcnt_s8((int8x8_t)v5);
    v6.i16[0] = vaddlv_u8(v6);
    if (v6.u32[0] > 1uLL)
    {
      v2 = *a2;
      if (v4 >= v5)
        v2 = v4 % v5;
    }
    else
    {
      v2 = (v5 - 1) & v4;
    }
    v7 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v2);
    if (v7)
    {
      for (i = *v7; i; i = (_QWORD *)*i)
      {
        v9 = i[1];
        if (v9 == v4)
        {
          if (i[2] == v4)
            return i + 3;
        }
        else
        {
          if (v6.u32[0] > 1uLL)
          {
            if (v9 >= v5)
              v9 %= v5;
          }
          else
          {
            v9 &= v5 - 1;
          }
          if (v9 != v2)
            break;
        }
      }
    }
  }
  i = operator new(0x28uLL);
  *i = 0;
  i[1] = v4;
  i[3] = 0;
  i[4] = 0;
  i[2] = v4;
  v10 = (float)(unint64_t)(*((_QWORD *)a1 + 3) + 1);
  v11 = a1[8];
  if (!v5 || (float)(v11 * (float)v5) < v10)
  {
    v12 = (v5 & (v5 - 1)) == 0;
    if (v5 < 3)
      v12 = 0;
    v13 = (2 * v5) | !v12;
    v14 = vcvtps_u32_f32(v10 / v11);
    if (v13 <= v14)
      prime = (int8x8_t)v14;
    else
      prime = (int8x8_t)v13;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v5 = *((_QWORD *)a1 + 1);
    }
    if (*(_QWORD *)&prime > v5)
      goto LABEL_30;
    if (*(_QWORD *)&prime < v5)
    {
      v22 = vcvtps_u32_f32((float)*((unint64_t *)a1 + 3) / a1[8]);
      if (v5 < 3 || (v23 = (uint8x8_t)vcnt_s8((int8x8_t)v5), v23.i16[0] = vaddlv_u8(v23), v23.u32[0] > 1uLL))
      {
        v22 = std::__next_prime(v22);
      }
      else
      {
        v24 = 1 << -(char)__clz(v22 - 1);
        if (v22 >= 2)
          v22 = v24;
      }
      if (*(_QWORD *)&prime <= v22)
        prime = (int8x8_t)v22;
      if (*(_QWORD *)&prime >= v5)
      {
        v5 = *((_QWORD *)a1 + 1);
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v16 = operator new(8 * *(_QWORD *)&prime);
          v17 = *(_QWORD **)a1;
          *(_QWORD *)a1 = v16;
          if (v17)
            operator delete(v17);
          v18 = 0;
          *((int8x8_t *)a1 + 1) = prime;
          do
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v18++) = 0;
          while (*(_QWORD *)&prime != v18);
          v19 = (_QWORD *)*((_QWORD *)a1 + 2);
          if (v19)
          {
            v20 = v19[1];
            v21 = (uint8x8_t)vcnt_s8(prime);
            v21.i16[0] = vaddlv_u8(v21);
            if (v21.u32[0] > 1uLL)
            {
              if (v20 >= *(_QWORD *)&prime)
                v20 %= *(_QWORD *)&prime;
            }
            else
            {
              v20 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v20) = a1 + 4;
            v25 = (_QWORD *)*v19;
            if (*v19)
            {
              do
              {
                v26 = v25[1];
                if (v21.u32[0] > 1uLL)
                {
                  if (v26 >= *(_QWORD *)&prime)
                    v26 %= *(_QWORD *)&prime;
                }
                else
                {
                  v26 &= *(_QWORD *)&prime - 1;
                }
                if (v26 != v20)
                {
                  if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v26))
                  {
                    *(_QWORD *)(*(_QWORD *)a1 + 8 * v26) = v19;
                    goto LABEL_55;
                  }
                  *v19 = *v25;
                  *v25 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v26);
                  **(_QWORD **)(*(_QWORD *)a1 + 8 * v26) = v25;
                  v25 = v19;
                }
                v26 = v20;
LABEL_55:
                v19 = v25;
                v25 = (_QWORD *)*v25;
                v20 = v26;
              }
              while (v25);
            }
          }
          v5 = (unint64_t)prime;
          goto LABEL_59;
        }
        v31 = *(_QWORD **)a1;
        *(_QWORD *)a1 = 0;
        if (v31)
          operator delete(v31);
        v5 = 0;
        *((_QWORD *)a1 + 1) = 0;
      }
    }
LABEL_59:
    if ((v5 & (v5 - 1)) != 0)
    {
      if (v4 >= v5)
        v2 = v4 % v5;
      else
        v2 = v4;
    }
    else
    {
      v2 = (v5 - 1) & v4;
    }
  }
  v27 = *(_QWORD **)a1;
  v28 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v2);
  if (v28)
  {
    *i = *v28;
LABEL_72:
    *v28 = i;
    goto LABEL_73;
  }
  *i = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = i;
  v27[v2] = a1 + 4;
  if (*i)
  {
    v29 = *(_QWORD *)(*i + 8);
    if ((v5 & (v5 - 1)) != 0)
    {
      if (v29 >= v5)
        v29 %= v5;
    }
    else
    {
      v29 &= v5 - 1;
    }
    v28 = (_QWORD *)(*(_QWORD *)a1 + 8 * v29);
    goto LABEL_72;
  }
LABEL_73:
  ++*((_QWORD *)a1 + 3);
  return i + 3;
}

@end
