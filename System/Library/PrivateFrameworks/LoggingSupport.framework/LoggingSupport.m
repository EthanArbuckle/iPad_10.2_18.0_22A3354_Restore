uint64_t _uuidpath_pathcache_compare_key(int a1, uint64_t a2, unsigned __int8 *uu2)
{
  return uuid_compare((const unsigned __int8 *)(a2 + 24), uu2);
}

uint64_t ___os_log_fdscandir_trace_block_invoke_2(uint64_t a1, const dirent **a2, const dirent **a3)
{
  int v5;
  int v6;

  v5 = strncmp((*a2)->d_name, "logdata.Persistent.", 0x13uLL);
  v6 = strncmp((*a3)->d_name, "logdata.Persistent.", 0x13uLL);
  if ((v5 == 0) != (v6 == 0))
    return (v5 != 0) - (v6 != 0);
  else
    return alphasort(a2, a3);
}

uint64_t _timesync_range_copy(char *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  if (*(_QWORD *)a1)
    v2 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  else
    v2 = 0;
  v3 = _os_trace_zalloc();
  *(_QWORD *)v3 = 0;
  *(_OWORD *)(v3 + 8) = xmmword_19EA7F230;
  v4 = operator new();
  *(_OWORD *)v4 = 0u;
  *(_OWORD *)(v4 + 16) = 0u;
  *(_DWORD *)(v4 + 32) = 1065353216;
  *(_QWORD *)(v3 + 16) = *((_QWORD *)a1 + 2);
  v5 = *((_QWORD *)a1 + 1);
  *(_QWORD *)v3 = v4;
  *(_QWORD *)(v3 + 8) = v5;
  v6 = a1 + 24;
  memcpy((void *)(v3 + 24), v6, 16 * v2);
  if (v2)
  {
    v7 = 0;
    do
    {
      _os_trace_uuid_map_insert(*(float **)v3, (uint64_t *)v6, ++v7);
      v6 += 16;
    }
    while (v2 != v7);
  }
  return v3;
}

BOOL catalog_chunk_parse_entries(unint64_t *a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  BOOL v10;
  unint64_t i;
  unint64_t v12;

  if (a4)
  {
    v10 = 0;
    for (i = 0; i != a4; v10 = i >= a4)
    {
      v12 = *a1;
      if (a2)
      {
        if (a2 < v12 || a2 - v12 < a3)
          break;
      }
      *a1 = v12 + a3;
      if (!v12)
        break;
      if (((*(uint64_t (**)(uint64_t, unint64_t, unint64_t, unint64_t *))(a5 + 16))(a5, i, v12, a1) & 1) == 0)break;
      ++i;
    }
  }
  else
  {
    return 1;
  }
  return v10;
}

uint64_t __catalog_chunk_parse_uuid_v2_block_invoke(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  _os_trace_uuid_map_insert(*(float **)(*(_QWORD *)(a1 + 32) + 16), a3, a2);
  if (*(_BYTE *)(a1 + 40))
    _chunk_print_uuid(a2, (unsigned __int8 *)a3);
  return 1;
}

uint64_t _os_trace_uuid_map_insert(float *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint8x8_t v10;
  unint64_t v11;
  _QWORD *v12;
  _QWORD *i;
  unint64_t v14;
  _QWORD *v16;
  float v17;
  float v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  int8x8_t prime;
  void *v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  unint64_t v27;
  uint8x8_t v28;
  unint64_t v29;
  uint8x8_t v30;
  uint64_t v31;
  _QWORD *v32;
  unint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  unint64_t v37;
  _QWORD *v39;

  v5 = *a2;
  v6 = a2[1];
  v7 = __ROR8__(v6 + 16, 16);
  v8 = (0x9DDFEA08EB382D69
      * ((0x9DDFEA08EB382D69 * (v7 ^ ((0x9DDFEA08EB382D69 * (*a2 ^ v7)) >> 47) ^ (0x9DDFEA08EB382D69 * (*a2 ^ v7)))) ^ ((0x9DDFEA08EB382D69 * (v7 ^ ((0x9DDFEA08EB382D69 * (*a2 ^ v7)) >> 47) ^ (0x9DDFEA08EB382D69 * (*a2 ^ v7)))) >> 47))) ^ v6;
  v9 = *((_QWORD *)a1 + 1);
  if (v9)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      v11 = (0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69
             * (v7 ^ ((0x9DDFEA08EB382D69 * (*a2 ^ v7)) >> 47) ^ (0x9DDFEA08EB382D69 * (*a2 ^ v7)))) ^ ((0x9DDFEA08EB382D69 * (v7 ^ ((0x9DDFEA08EB382D69 * (*a2 ^ v7)) >> 47) ^ (0x9DDFEA08EB382D69 * (*a2 ^ v7)))) >> 47))) ^ v6;
      if (v8 >= v9)
        v11 = v8 % v9;
    }
    else
    {
      v11 = v8 & (v9 - 1);
    }
    v12 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v11);
    if (v12)
    {
      for (i = (_QWORD *)*v12; i; i = (_QWORD *)*i)
      {
        v14 = i[1];
        if (v14 == v8)
        {
          if (i[2] == v5 && i[3] == v6)
            return 0;
        }
        else
        {
          if (v10.u32[0] > 1uLL)
          {
            if (v14 >= v9)
              v14 %= v9;
          }
          else
          {
            v14 &= v9 - 1;
          }
          if (v14 != v11)
            break;
        }
      }
    }
  }
  else
  {
    v11 = 0xAAAAAAAAAAAAAAAALL;
  }
  v16 = operator new(0x28uLL);
  *v16 = 0;
  v16[1] = v8;
  v16[2] = v5;
  v16[3] = v6;
  v16[4] = a3;
  v17 = (float)(unint64_t)(*((_QWORD *)a1 + 3) + 1);
  v18 = a1[8];
  if (!v9 || (float)(v18 * (float)v9) < v17)
  {
    v19 = 1;
    if (v9 >= 3)
      v19 = (v9 & (v9 - 1)) != 0;
    v20 = v19 | (2 * v9);
    v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21)
      prime = (int8x8_t)v21;
    else
      prime = (int8x8_t)v20;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v9 = *((_QWORD *)a1 + 1);
    }
    if (*(_QWORD *)&prime > v9)
      goto LABEL_34;
    if (*(_QWORD *)&prime < v9)
    {
      v29 = vcvtps_u32_f32((float)*((unint64_t *)a1 + 3) / a1[8]);
      if (v9 < 3 || (v30 = (uint8x8_t)vcnt_s8((int8x8_t)v9), v30.i16[0] = vaddlv_u8(v30), v30.u32[0] > 1uLL))
      {
        v29 = std::__next_prime(v29);
      }
      else
      {
        v31 = 1 << -(char)__clz(v29 - 1);
        if (v29 >= 2)
          v29 = v31;
      }
      if (*(_QWORD *)&prime <= v29)
        prime = (int8x8_t)v29;
      if (*(_QWORD *)&prime >= v9)
      {
        v9 = *((_QWORD *)a1 + 1);
      }
      else
      {
        if (prime)
        {
LABEL_34:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:nn180100]();
          v23 = operator new(8 * *(_QWORD *)&prime);
          v24 = *(_QWORD **)a1;
          *(_QWORD *)a1 = v23;
          if (v24)
            operator delete(v24);
          v25 = 0;
          *((int8x8_t *)a1 + 1) = prime;
          do
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v25++) = 0;
          while (*(_QWORD *)&prime != v25);
          v26 = (_QWORD *)*((_QWORD *)a1 + 2);
          if (v26)
          {
            v27 = v26[1];
            v28 = (uint8x8_t)vcnt_s8(prime);
            v28.i16[0] = vaddlv_u8(v28);
            if (v28.u32[0] > 1uLL)
            {
              if (v27 >= *(_QWORD *)&prime)
                v27 %= *(_QWORD *)&prime;
            }
            else
            {
              v27 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v27) = a1 + 4;
            v32 = (_QWORD *)*v26;
            if (*v26)
            {
              do
              {
                v33 = v32[1];
                if (v28.u32[0] > 1uLL)
                {
                  if (v33 >= *(_QWORD *)&prime)
                    v33 %= *(_QWORD *)&prime;
                }
                else
                {
                  v33 &= *(_QWORD *)&prime - 1;
                }
                if (v33 != v27)
                {
                  if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v33))
                  {
                    *(_QWORD *)(*(_QWORD *)a1 + 8 * v33) = v26;
                    goto LABEL_59;
                  }
                  *v26 = *v32;
                  *v32 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v33);
                  **(_QWORD **)(*(_QWORD *)a1 + 8 * v33) = v32;
                  v32 = v26;
                }
                v33 = v27;
LABEL_59:
                v26 = v32;
                v32 = (_QWORD *)*v32;
                v27 = v33;
              }
              while (v32);
            }
          }
          v9 = (unint64_t)prime;
          goto LABEL_63;
        }
        v39 = *(_QWORD **)a1;
        *(_QWORD *)a1 = 0;
        if (v39)
          operator delete(v39);
        v9 = 0;
        *((_QWORD *)a1 + 1) = 0;
      }
    }
LABEL_63:
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9)
        v11 = v8 % v9;
      else
        v11 = v8;
    }
    else
    {
      v11 = (v9 - 1) & v8;
    }
  }
  v34 = *(_QWORD **)a1;
  v35 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v11);
  if (v35)
  {
    *v16 = *v35;
LABEL_76:
    *v35 = v16;
    goto LABEL_77;
  }
  v36 = *((_QWORD *)a1 + 2);
  *v16 = v36;
  *((_QWORD *)a1 + 2) = v16;
  v34[v11] = a1 + 4;
  if (v36)
  {
    v37 = *(_QWORD *)(v36 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v37 >= v9)
        v37 %= v9;
    }
    else
    {
      v37 &= v9 - 1;
    }
    v35 = (_QWORD *)(*(_QWORD *)a1 + 8 * v37);
    goto LABEL_76;
  }
LABEL_77:
  ++*((_QWORD *)a1 + 3);
  return 1;
}

uint64_t __catalog_chunk_parse_procinfo_v2_block_invoke(uint64_t a1, unsigned __int16 a2, uint64_t a3, unsigned __int16 **a4)
{
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int **v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  int v28;
  __int128 v29;
  uuid_string_t out;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (_os_procinfo_map_lookup(*(_QWORD **)(*(_QWORD *)(a1 + 32) + 40), *(_QWORD *)(a3 + 8), *(_DWORD *)(a3 + 16)))
    return 1;
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_DWORD *)(v9 + 4);
  v11 = v9 + 40;
  v12 = v9 + 32;
  v13 = v10 == 17;
  if (v10 == 17)
    v14 = v9 + 40;
  else
    v14 = v9 + 32;
  v15 = *(unsigned __int16 *)(v9 + 16);
  v16 = v11 + v15;
  v17 = v12 + v15;
  if (v13)
    v18 = v16;
  else
    v18 = v17;
  v19 = _os_trace_calloc();
  v20 = (unsigned int **)v19;
  *(_DWORD *)v19 = *(_DWORD *)a3;
  *(_DWORD *)(v19 + 4) = *(_DWORD *)(a3 + 20);
  *(_QWORD *)(v19 + 8) = *(_QWORD *)(a3 + 8);
  *(_DWORD *)(v19 + 16) = *(_DWORD *)(a3 + 16);
  *(_DWORD *)(v19 + 20) = *(_DWORD *)(a3 + 24);
  v21 = *(unsigned __int16 *)(a3 + 4);
  v22 = v18 - v14;
  if (v22 >= 16 * v21 && v22 - 16 * v21 > 0xF)
    *(_OWORD *)(v19 + 24) = *(_OWORD *)(v14 + 16 * v21);
  else
    _os_assumes_log();
  v24 = *(unsigned __int16 *)(a3 + 6);
  if (v24 != 0xFFFF)
  {
    if (v22 >= 16 * v24 && v22 - 16 * v24 > 0xF)
      *(_OWORD *)(v20 + 5) = *(_OWORD *)(v14 + 16 * v24);
    else
      _os_assumes_log();
  }
  v26 = _os_trace_calloc();
  *(_QWORD *)v26 = 16;
  *(_BYTE *)(v26 + 8) = 2;
  *(_QWORD *)(v26 + 16) = _os_trace_calloc();
  v20[7] = (unsigned int *)v26;
  v27 = _os_trace_calloc();
  *(_QWORD *)v27 = 16;
  *(_BYTE *)(v27 + 8) = 1;
  *(_QWORD *)(v27 + 16) = _os_trace_calloc();
  v20[8] = (unsigned int *)v27;
  v28 = *(unsigned __int8 *)(a1 + 56);
  if (*(_BYTE *)(a1 + 56))
  {
    printf("[%03u]\n\t%10s : %llu@%u\n\t%10s : %d\n\t%10s : %u\n\t%10s : %u\n\t%10s : %x\n", a2, "proc id", v20[1], *((_DWORD *)v20 + 4), "pid", *((_DWORD *)v20 + 1), "euid", *((_DWORD *)v20 + 5), "index", *(unsigned __int16 *)v20, "flags", *((unsigned __int16 *)v20 + 1));
    v28 = *(unsigned __int8 *)(a1 + 56);
    if (*(_BYTE *)(a1 + 56))
    {
      *(_QWORD *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
      *(_QWORD *)&v29 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)out = v29;
      *(_OWORD *)&out[16] = v29;
      uuid_unparse((const unsigned __int8 *)v20 + 24, out);
      if (*(_BYTE *)(a1 + 56))
        printf("\t%10s : %s\n", "main uuid", out);
      out[0] = 0;
      if (!uuid_is_null((const unsigned __int8 *)v20 + 40))
        uuid_unparse((const unsigned __int8 *)v20 + 40, out);
      v28 = *(unsigned __int8 *)(a1 + 56);
      if (*(_BYTE *)(a1 + 56))
      {
        printf("\t%10s : %s\n", "dsc uuid", out);
        v28 = *(unsigned __int8 *)(a1 + 56);
      }
    }
  }
  if (catalog_chunk_parse_procinfo_uuidinfo(a4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), (uint64_t)v20, v28 != 0, *(_QWORD *)(a1 + 40))&& catalog_chunk_parse_procinfo_subsystem(a4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), (uint64_t)v20, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40)))
  {
    if ((_os_procinfo_map_insert((uint64_t *)(*(_QWORD *)(a1 + 32) + 40), (uint64_t)v20[1], *((_DWORD *)v20 + 4), (uint64_t)v20) & 1) != 0)return 1;
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  _catalog_procinfo_free(v20);
  return 0;
}

uint64_t _os_procinfo_map_insert(uint64_t *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint8x8_t v14;
  unint64_t v15;
  uint64_t **v16;
  uint64_t *i;
  unint64_t v18;
  _QWORD *v20;
  float v21;
  float v22;
  _BOOL8 v23;
  unint64_t v24;
  unint64_t v25;
  int8x8_t prime;
  void *v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  uint8x8_t v32;
  unint64_t v33;
  uint8x8_t v34;
  uint64_t v35;
  _QWORD *v36;
  unint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  unint64_t v41;
  _QWORD *v43;

  v7 = *a1;
  if (!*a1)
  {
    v7 = operator new();
    *(_OWORD *)v7 = 0u;
    *(_OWORD *)(v7 + 16) = 0u;
    *(_DWORD *)(v7 + 32) = 1065353216;
    *a1 = v7;
  }
  v9 = 0x9DDFEA08EB382D69 * (a2 ^ __ROR8__(__PAIR64__(a3, HIDWORD(a2)) + 12, 12));
  v10 = __ROR8__(__PAIR64__(a3, HIDWORD(a2)) + 12, 12) ^ (v9 >> 47);
  v11 = 0x9DDFEA08EB382D69 * ((0x9DDFEA08EB382D69 * (v10 ^ v9)) ^ ((0x9DDFEA08EB382D69 * (v10 ^ v9)) >> 47));
  v12 = v11 ^ __PAIR64__(a3, HIDWORD(a2));
  v13 = *(_QWORD *)(v7 + 8);
  if (v13)
  {
    v14 = (uint8x8_t)vcnt_s8((int8x8_t)v13);
    v14.i16[0] = vaddlv_u8(v14);
    if (v14.u32[0] > 1uLL)
    {
      v15 = v11 ^ __PAIR64__(a3, HIDWORD(a2));
      if (v12 >= v13)
        v15 = v12 % v13;
    }
    else
    {
      v15 = v12 & (v13 - 1);
    }
    v16 = *(uint64_t ***)(*(_QWORD *)v7 + 8 * v15);
    if (v16)
    {
      for (i = *v16; i; i = (uint64_t *)*i)
      {
        v18 = i[1];
        if (v18 == v12)
        {
          if (*((_DWORD *)i + 6) == a3 && i[2] == a2)
            return 0;
        }
        else
        {
          if (v14.u32[0] > 1uLL)
          {
            if (v18 >= v13)
              v18 %= v13;
          }
          else
          {
            v18 &= v13 - 1;
          }
          if (v18 != v15)
            break;
        }
      }
    }
  }
  else
  {
    v15 = 0xAAAAAAAAAAAAAAAALL;
  }
  v20 = operator new(0x28uLL);
  *v20 = 0;
  v20[1] = v12;
  v20[2] = a2;
  *((_DWORD *)v20 + 6) = a3;
  v20[4] = a4;
  v21 = (float)(unint64_t)(*(_QWORD *)(v7 + 24) + 1);
  v22 = *(float *)(v7 + 32);
  if (!v13 || (float)(v22 * (float)v13) < v21)
  {
    v23 = 1;
    if (v13 >= 3)
      v23 = (v13 & (v13 - 1)) != 0;
    v24 = v23 | (2 * v13);
    v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25)
      prime = (int8x8_t)v25;
    else
      prime = (int8x8_t)v24;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    }
    v13 = *(_QWORD *)(v7 + 8);
    if (*(_QWORD *)&prime > v13)
      goto LABEL_36;
    if (*(_QWORD *)&prime < v13)
    {
      v33 = vcvtps_u32_f32((float)*(unint64_t *)(v7 + 24) / *(float *)(v7 + 32));
      if (v13 < 3 || (v34 = (uint8x8_t)vcnt_s8((int8x8_t)v13), v34.i16[0] = vaddlv_u8(v34), v34.u32[0] > 1uLL))
      {
        v33 = std::__next_prime(v33);
      }
      else
      {
        v35 = 1 << -(char)__clz(v33 - 1);
        if (v33 >= 2)
          v33 = v35;
      }
      if (*(_QWORD *)&prime <= v33)
        prime = (int8x8_t)v33;
      if (*(_QWORD *)&prime >= v13)
      {
        v13 = *(_QWORD *)(v7 + 8);
      }
      else
      {
        if (prime)
        {
LABEL_36:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:nn180100]();
          v27 = operator new(8 * *(_QWORD *)&prime);
          v28 = *(_QWORD **)v7;
          *(_QWORD *)v7 = v27;
          if (v28)
            operator delete(v28);
          v29 = 0;
          *(int8x8_t *)(v7 + 8) = prime;
          do
            *(_QWORD *)(*(_QWORD *)v7 + 8 * v29++) = 0;
          while (*(_QWORD *)&prime != v29);
          v30 = *(_QWORD **)(v7 + 16);
          if (v30)
          {
            v31 = v30[1];
            v32 = (uint8x8_t)vcnt_s8(prime);
            v32.i16[0] = vaddlv_u8(v32);
            if (v32.u32[0] > 1uLL)
            {
              if (v31 >= *(_QWORD *)&prime)
                v31 %= *(_QWORD *)&prime;
            }
            else
            {
              v31 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)v7 + 8 * v31) = v7 + 16;
            v36 = (_QWORD *)*v30;
            if (*v30)
            {
              do
              {
                v37 = v36[1];
                if (v32.u32[0] > 1uLL)
                {
                  if (v37 >= *(_QWORD *)&prime)
                    v37 %= *(_QWORD *)&prime;
                }
                else
                {
                  v37 &= *(_QWORD *)&prime - 1;
                }
                if (v37 != v31)
                {
                  if (!*(_QWORD *)(*(_QWORD *)v7 + 8 * v37))
                  {
                    *(_QWORD *)(*(_QWORD *)v7 + 8 * v37) = v30;
                    goto LABEL_61;
                  }
                  *v30 = *v36;
                  *v36 = **(_QWORD **)(*(_QWORD *)v7 + 8 * v37);
                  **(_QWORD **)(*(_QWORD *)v7 + 8 * v37) = v36;
                  v36 = v30;
                }
                v37 = v31;
LABEL_61:
                v30 = v36;
                v36 = (_QWORD *)*v36;
                v31 = v37;
              }
              while (v36);
            }
          }
          v13 = (unint64_t)prime;
          goto LABEL_65;
        }
        v43 = *(_QWORD **)v7;
        *(_QWORD *)v7 = 0;
        if (v43)
          operator delete(v43);
        v13 = 0;
        *(_QWORD *)(v7 + 8) = 0;
      }
    }
LABEL_65:
    if ((v13 & (v13 - 1)) != 0)
    {
      if (v12 >= v13)
        v15 = v12 % v13;
      else
        v15 = v12;
    }
    else
    {
      v15 = (v13 - 1) & v12;
    }
  }
  v38 = *(_QWORD **)v7;
  v39 = *(_QWORD **)(*(_QWORD *)v7 + 8 * v15);
  if (v39)
  {
    *v20 = *v39;
LABEL_78:
    *v39 = v20;
    goto LABEL_79;
  }
  v40 = *(_QWORD *)(v7 + 16);
  *v20 = v40;
  *(_QWORD *)(v7 + 16) = v20;
  v38[v15] = v7 + 16;
  if (v40)
  {
    v41 = *(_QWORD *)(v40 + 8);
    if ((v13 & (v13 - 1)) != 0)
    {
      if (v41 >= v13)
        v41 %= v13;
    }
    else
    {
      v41 &= v13 - 1;
    }
    v39 = (_QWORD *)(*(_QWORD *)v7 + 8 * v41);
    goto LABEL_78;
  }
LABEL_79:
  ++*(_QWORD *)(v7 + 24);
  return 1;
}

uint64_t catalog_chunk_parse_procinfo_uuidinfo(_QWORD *a1, unint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  _QWORD *v11;
  int v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v23;
  unsigned __int8 *v24;
  unint64_t v25;
  __int128 v27;
  unint64_t v29;
  uint64_t v30;
  uuid_string_t out;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v11 = (_QWORD *)*a1;
  if (a2)
  {
    if (a2 < (unint64_t)v11 || a2 - (unint64_t)v11 < 8)
      return 0;
  }
  *a1 = v11 + 1;
  if (!v11)
    return 0;
  v13 = *(_DWORD *)(a6 + 4);
  v14 = v13 == 17;
  if (v13 == 17)
    v15 = a6 + 40;
  else
    v15 = a6 + 32;
  v16 = *(unsigned __int16 *)(a6 + 16);
  v17 = a6 + 40 + v16;
  v18 = a6 + 32 + v16;
  if (v14)
    v19 = v17;
  else
    v19 = v18;
  if (a5)
    printf("\t%10s : %llu\n", "uuidinfos", *v11);
  if (*v11)
  {
    v20 = 0;
    v29 = v19 - v15;
    while (1)
    {
      v21 = (_QWORD *)*a1;
      if (a2)
      {
        if (a2 < (unint64_t)v21 || a2 - (unint64_t)v21 < 0x10)
          break;
      }
      *a1 = v21 + 2;
      if (!v21)
        break;
      v30 = v21[1] >> 16;
      if (!hashtable_lookup(*(_QWORD *)(a4 + 56), (uint64_t)&v30))
      {
        v23 = _os_trace_calloc();
        v24 = (unsigned __int8 *)v23;
        *(_QWORD *)v23 = v21[1] >> 16;
        *(_QWORD *)(v23 + 8) = *v21;
        v25 = 16 * (unsigned __int16)*((_DWORD *)v21 + 2);
        if (v29 >= v25 && v29 - v25 > 0xF)
          *(_OWORD *)(v23 + 16) = *(_OWORD *)(v15 + 16 * (unsigned __int16)*((_DWORD *)v21 + 2));
        else
          _os_assumes_log();
        hashtable_insert(*(int **)(a4 + 56), v24, (uint64_t)v24);
        ++*(_QWORD *)(a3 + 48);
        if (a5)
        {
          *(_QWORD *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
          *(_QWORD *)&v27 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
          *(_OWORD *)out = v27;
          *(_OWORD *)&out[16] = v27;
          uuid_unparse(v24 + 16, out);
          printf("\t\t<%10s : 0x%llx, %10s : %10llu, %10s : %s>\n", "load addr", *(_QWORD *)v24, "size", *((_QWORD *)v24 + 1), "uuid", out);
        }
      }
      if ((unint64_t)++v20 >= *v11)
        return 1;
    }
    return 0;
  }
  return 1;
}

uint64_t __catalog_chunk_parse_subchunk_v2_block_invoke(uint64_t a1, unsigned __int16 a2, uint64_t *a3, unint64_t *a4)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  unsigned __int16 *v13;
  _BOOL4 v14;
  unint64_t v15;
  uint64_t result;
  int v17;
  unsigned __int16 *v18;
  unint64_t v20;
  int v21;
  unsigned __int16 *v22;
  int v23;
  unsigned __int16 *v24;
  unint64_t v26;

  v8 = _catalog_subchunk_entry_alloc(*(_QWORD *)(a1 + 32));
  v9 = *a3;
  v10 = a3[1];
  v8[2] = *a3;
  v8[3] = v10;
  v11 = *((_DWORD *)a3 + 4);
  v12 = *((_DWORD *)a3 + 5);
  *((_DWORD *)v8 + 8) = v11;
  *((_DWORD *)v8 + 9) = v12;
  v13 = (unsigned __int16 *)(a3 + 3);
  *a4 = (unint64_t)(a3 + 3);
  if (*(_BYTE *)(a1 + 48))
  {
    printf("[%03u]\n\t%10s : %llu\n\t%10s : %llu\n\t%10s : %u\n\t%10s : %u\n", a2, "startts", v9, "endts", v10, "uncomp sz", v11, "comp algo", v12);
    v14 = *(_BYTE *)(a1 + 48) != 0;
    v13 = (unsigned __int16 *)*a4;
  }
  else
  {
    v14 = 0;
  }
  v15 = *(_QWORD *)(a1 + 40);
  if (v15)
  {
    result = 0;
    if (v15 < (unint64_t)v13 || v15 - (unint64_t)v13 < 4)
      return result;
  }
  *a4 = (unint64_t)(v13 + 2);
  if (!v13)
    return 0;
  if (v14)
    printf("\t\t%10s : %u\n\t\t%10s : ", "procinfos", *(_DWORD *)v13, "indexes");
  if (*(_DWORD *)v13)
  {
    v17 = 0;
    do
    {
      v18 = (unsigned __int16 *)*a4;
      if (v15)
      {
        if (v15 < (unint64_t)v18 || v15 - (unint64_t)v18 < 2)
          return 0;
      }
      *a4 = (unint64_t)(v18 + 1);
      if (!v18)
        return 0;
      if (v8)
        hashtable_insert((int *)v8[6], v18, 0);
      if (v14)
        printf("%u,", *v18);
    }
    while (++v17 < *(_DWORD *)v13);
  }
  if (v14)
    putchar(10);
  v20 = *(_QWORD *)(a1 + 40);
  v21 = *(unsigned __int8 *)(a1 + 48);
  v22 = (unsigned __int16 *)*a4;
  if (v20)
  {
    result = 0;
    if (v20 < (unint64_t)v22 || v20 - (unint64_t)v22 < 4)
      return result;
  }
  *a4 = (unint64_t)(v22 + 2);
  if (!v22)
    return 0;
  if (v21)
    printf("\t\t%10s : %u\n\t\t%10s : ", "subcats", *(_DWORD *)v22, "offsets");
  if (*(_DWORD *)v22)
  {
    v23 = 0;
    do
    {
      v24 = (unsigned __int16 *)*a4;
      if (v20)
      {
        if (v20 < (unint64_t)v24 || v20 - (unint64_t)v24 < 2)
          return 0;
      }
      *a4 = (unint64_t)(v24 + 1);
      if (!v24)
        return 0;
      if (v8)
        hashtable_insert((int *)v8[5], v24, 0);
      if (v21)
        printf("%u,", *v24);
    }
    while (++v23 < *(_DWORD *)v22);
  }
  if (v21)
    putchar(10);
  v26 = *a4;
  if ((*a4 & 7) != 0)
    v26 = (*a4 & 0xFFFFFFFFFFFFFFF8) + 8;
  *a4 = v26;
  return 1;
}

_QWORD *_catalog_subchunk_entry_alloc(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v2 = (_QWORD *)_os_trace_calloc();
  v2[2] = -1;
  v3 = _os_trace_calloc();
  *(_QWORD *)v3 = 16;
  *(_BYTE *)(v3 + 8) = 1;
  *(_QWORD *)(v3 + 16) = _os_trace_calloc();
  v2[6] = v3;
  v4 = _os_trace_calloc();
  *(_QWORD *)v4 = 16;
  *(_BYTE *)(v4 + 8) = 1;
  *(_QWORD *)(v4 + 16) = _os_trace_calloc();
  v2[5] = v4;
  v5 = *(_QWORD **)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 80);
  *v2 = 0;
  v2[1] = v5;
  *v5 = v2;
  *(_QWORD *)(a1 + 72) = v2;
  *(_QWORD *)(a1 + 80) = v6 + 1;
  return v2;
}

uint64_t _catalog_create_with_chunk(uint64_t a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unint64_t v12;
  unsigned int v13;
  unsigned int v14;
  unint64_t v15;
  char v16;
  char *v18;
  uint64_t v19;
  char *v20;
  unsigned __int16 v21;
  size_t v22;
  BOOL v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  const char *v27;
  unint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  unint64_t v33;
  char v34;
  uint64_t *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)a1 != 24587)
  {
    if (a2)
      puts("Error: Incorrect catalog chunk preamble tag");
    return 0;
  }
  v4 = _os_trace_calloc();
  *(_QWORD *)(v4 + 64) = 0;
  *(_QWORD *)(v4 + 72) = v4 + 64;
  *(_QWORD *)(v4 + 8) = -1;
  v5 = operator new();
  *(_OWORD *)v5 = 0u;
  *(_OWORD *)(v5 + 16) = 0u;
  *(_DWORD *)(v5 + 32) = 1065353216;
  *(_QWORD *)(v4 + 16) = v5;
  v36 = 0;
  v6 = *(_DWORD *)a1;
  if (*(int *)a1 > 7679)
  {
    switch(v6)
    {
      case 24577:
      case 24578:
      case 24579:
      case 24580:
        if (!*(_DWORD *)(a1 + 4))
          goto LABEL_19;
        goto LABEL_35;
      case 24581:
      case 24582:
      case 24583:
      case 24584:
      case 24585:
      case 24586:
      case 24590:
      case 24591:
        goto LABEL_35;
      case 24587:
      case 24588:
      case 24592:
        if ((*(_DWORD *)(a1 + 4) - 14) >= 4)
          goto LABEL_35;
        goto LABEL_19;
      case 24589:
        goto LABEL_19;
      default:
        if (v6 == 7680 || v6 == 0x2000)
          goto LABEL_19;
        goto LABEL_35;
    }
  }
  if (v6 > 7167)
  {
    if (v6 == 7168)
      goto LABEL_19;
    v7 = 7424;
  }
  else
  {
    if (v6 == 4096)
      goto LABEL_19;
    v7 = 6912;
  }
  if (v6 != v7)
  {
LABEL_35:
    if (a2)
      printf("Invalid catalog subtag");
    goto LABEL_37;
  }
LABEL_19:
  v8 = *(_DWORD *)(a1 + 4);
  if (v8 != 17)
  {
    *(_WORD *)v4 = v8;
    *(_QWORD *)(v4 + 8) = -1;
    v9 = a1 + 24;
    v36 = (char *)(a1 + 24);
    v10 = *(unsigned __int16 *)(a1 + 16);
    v13 = *(unsigned __int16 *)(a1 + 18);
    if (v10 < v13)
    {
      v14 = *(unsigned __int16 *)(a1 + 20);
      if (v13 < v14)
      {
        v15 = *(unsigned __int16 *)(a1 + 22);
        if (v14 < v15 && *(_QWORD *)(a1 + 8) > v15)
        {
          if ((a2 & 1) == 0)
          {
            v16 = 0;
            goto LABEL_44;
          }
          printf("\n----- %-30s -----\n", "CATALOG_V2 Metadata");
          printf("%-30s : %hu\n", "Subsystem Offset", *(unsigned __int16 *)(a1 + 16));
          printf("%-30s : %hu\n", "Activity ID Offset", *(unsigned __int16 *)(a1 + 18));
          printf("%-30s : %hu\n", "Procinfo Offset", *(unsigned __int16 *)(a1 + 20));
          printf("%-30s : %hu\n");
          goto LABEL_31;
        }
      }
    }
LABEL_33:
    if (a2)
      puts("Error: Incorrect section offsets");
    goto LABEL_37;
  }
  *(_WORD *)v4 = 17;
  *(_QWORD *)(v4 + 8) = *(_QWORD *)(a1 + 32);
  v9 = a1 + 40;
  v36 = (char *)(a1 + 40);
  v10 = *(unsigned __int16 *)(a1 + 16);
  v11 = *(unsigned __int16 *)(a1 + 18);
  if (v10 > v11)
    goto LABEL_33;
  v12 = *(unsigned __int16 *)(a1 + 22);
  if (v11 > v12 || *(_QWORD *)(a1 + 8) < v12)
    goto LABEL_33;
  if ((a2 & 1) == 0)
  {
    v16 = 0;
    goto LABEL_41;
  }
  printf("\n----- %-30s -----\n", "CATALOG_V3 Metadata");
  printf("%-30s : %hu\n", "Subsystem Offset", *(unsigned __int16 *)(a1 + 16));
  printf("%-30s : %hu\n", "Procinfo Offset", *(unsigned __int16 *)(a1 + 18));
  printf("%-30s : %hu\n", "Procinfo Count", *(unsigned __int16 *)(a1 + 20));
  printf("%-30s : %hu\n", "Subchunk Offset", *(unsigned __int16 *)(a1 + 22));
  printf("%-30s : %hu\n", "Subchunk Count", *(unsigned __int16 *)(a1 + 24));
  printf("%-30s : %llu\n");
LABEL_31:
  printf("\n----- %-30s -----\n", "Catalog UUID Section");
  v10 = *(unsigned __int16 *)(a1 + 16);
  v16 = 1;
  if (*(_DWORD *)(a1 + 4) != 17)
  {
LABEL_44:
    v18 = (char *)(a1 + v10 + 24);
    v37 = MEMORY[0x1E0C809B0];
    v38 = 0x40000000;
    v39 = __catalog_chunk_parse_uuid_legacy_block_invoke;
    v40 = &__block_descriptor_tmp_34;
    v41 = v4;
    LOBYTE(v42) = v16;
    if (!catalog_chunk_parse_section((unint64_t *)&v36, (unint64_t)v18, 0x10uLL, (uint64_t)&v37))
      goto LABEL_37;
    goto LABEL_45;
  }
LABEL_41:
  v18 = (char *)(a1 + v10 + 40);
  v37 = MEMORY[0x1E0C809B0];
  v38 = 0x40000000;
  v39 = __catalog_chunk_parse_uuid_v2_block_invoke;
  v40 = &__block_descriptor_tmp_32;
  v41 = v4;
  LOBYTE(v42) = v16;
  if (!catalog_chunk_parse_entries((unint64_t *)&v36, (unint64_t)v18, 0x10uLL, (unint64_t)&v18[-v9] >> 4, (uint64_t)&v37))goto LABEL_37;
LABEL_45:
  if (v36 != v18)
    goto LABEL_37;
  if (a2)
  {
    printf("\n----- %-30s -----\n", "Catalog Subsystems Section");
    v18 = v36;
  }
  v19 = a1 + *(unsigned __int16 *)(a1 + 18);
  if (*(_DWORD *)(a1 + 4) == 17)
  {
    v20 = (char *)(v19 + 40);
    if ((unint64_t)v18 < v19 + 40)
    {
      v21 = 0;
      do
      {
        v22 = strlen(v18) + 1;
        if (_os_trace_str_map_insert((uint64_t *)(v4 + 24), v18, *(_QWORD *)(v4 + 32)))
        {
          if (a2)
            printf("[%03u] [Offset: %6llu] %-30s\n", v21, *(_QWORD *)(v4 + 32), v36);
          *(_QWORD *)(v4 + 32) += v22;
          ++v21;
        }
        v18 = &v36[v22];
        v36 = v18;
      }
      while (v18 < v20);
    }
  }
  else
  {
    v20 = (char *)(v19 + 24);
    v23 = v19 + 24 >= (unint64_t)v18;
    v24 = v19 + 24 - (_QWORD)v18;
    if (!v23)
      goto LABEL_37;
    if (v24 < 8)
      goto LABEL_37;
    v36 = v18 + 8;
    if (!v18)
      goto LABEL_37;
    if (*(_QWORD *)v18)
    {
      v25 = 0;
      v35 = (uint64_t *)(v4 + 24);
      v26 = (unint64_t)(v18 + 8);
      v34 = v16;
      while ((unint64_t)v20 >= v26)
      {
        if ((unint64_t)&v20[-v26] < 2)
          break;
        v27 = (const char *)(v26 + 2);
        v36 = (char *)(v26 + 2);
        if (!v26)
          break;
        if (v20 < v27)
          break;
        v28 = *(unsigned __int8 *)(v26 + 1) + (unint64_t)*(unsigned __int8 *)v26;
        if (v20 - v27 < v28)
          break;
        v36 = (char *)&v27[v28];
        if (a2)
          printf("[%03u] [Offset: %6llu] Subsystem: %-30s Category: %-30s\n", (unsigned __int16)v25, v26 - (_QWORD)(v18 + 8) + 2, (const char *)(v26 + 2), (const char *)(v26 + *(unsigned __int8 *)v26 + 2));
        _os_trace_str_map_insert(v35, (char *)(v26 + 2), *(_QWORD *)(v4 + 32));
        catalog_subchunk_string_insert(v4, *(_WORD *)(v4 + 32));
        v29 = *(_QWORD *)(v4 + 32) + *(unsigned __int8 *)v26;
        *(_QWORD *)(v4 + 32) = v29;
        _os_trace_str_map_insert(v35, (char *)(v26 + *(unsigned __int8 *)v26 + 2), v29);
        catalog_subchunk_string_insert(v4, *(_WORD *)(v4 + 32));
        *(_QWORD *)(v4 + 32) += *(unsigned __int8 *)(v26 + 1);
        v26 = (unint64_t)&v36[v28 & 1];
        v36 = (char *)v26;
        ++v25;
        v16 = v34;
        if (v25 >= *(_QWORD *)v18)
          goto LABEL_73;
      }
      goto LABEL_37;
    }
    v26 = (unint64_t)(v18 + 8);
LABEL_73:
    if ((v26 & 7) != 0)
      v18 = (char *)((v26 & 0xFFFFFFFFFFFFFFF8) + 8);
    else
      v18 = (char *)v26;
    v36 = v18;
  }
  if (v18 != v20)
    goto LABEL_37;
  if (*(_DWORD *)(a1 + 4) != 17)
  {
    if (a2)
      printf("\n----- %-30s -----\n", "Catalog Activites Section");
    v30 = (const char *)(a1 + *(unsigned __int16 *)(a1 + 20) + 24);
    if (!catalog_chunk_parse_section((unint64_t *)&v36, (unint64_t)v30, 8uLL, (uint64_t)&__block_literal_global)|| v36 != v30)
    {
      goto LABEL_37;
    }
  }
  if (a2)
    printf("\n----- %-30s -----\n", "Catalog Procinfo Section");
  v31 = a1 + *(unsigned __int16 *)(a1 + 22);
  if (*(_DWORD *)(a1 + 4) == 17)
  {
    v32 = (const char *)(v31 + 40);
    v33 = *(unsigned __int16 *)(a1 + 20);
    v37 = MEMORY[0x1E0C809B0];
    v38 = 0x40000000;
    v39 = __catalog_chunk_parse_procinfo_v2_block_invoke;
    v40 = &__block_descriptor_tmp_50;
    v41 = v4;
    v42 = a1;
    v44 = v16;
    v43 = v31 + 40;
    if (catalog_chunk_parse_entries((unint64_t *)&v36, v31 + 40, 0x20uLL, v33, (uint64_t)&v37))
      goto LABEL_89;
LABEL_37:
    _catalog_destroy(v4);
    return 0;
  }
  v32 = (const char *)(v31 + 24);
  v37 = MEMORY[0x1E0C809B0];
  v38 = 0x40000000;
  v39 = __catalog_chunk_parse_procinfo_legacy_block_invoke;
  v40 = &__block_descriptor_tmp_65;
  v41 = v4;
  v42 = a1;
  v44 = v16;
  v43 = v31 + 24;
  if (!catalog_chunk_parse_section((unint64_t *)&v36, v31 + 24, 0x10uLL, (uint64_t)&v37))
    goto LABEL_37;
LABEL_89:
  if (v36 != v32 || !catalog_chunk_parse_subchunk((unint64_t *)&v36, v4, a2, a1))
    goto LABEL_37;
  return v4;
}

uint64_t _os_trace_str_map_insert(uint64_t *a1, char *__s, uint64_t a3)
{
  uint64_t v5;
  char v7;
  uint64_t *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint8x8_t v13;
  unint64_t v14;
  unint64_t v15;
  unsigned __int8 **v16;
  unsigned __int8 *v17;
  unint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  float v22;
  float v23;
  _BOOL8 v24;
  unint64_t v25;
  unint64_t v26;
  int8x8_t prime;
  void *v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  unint64_t v32;
  uint8x8_t v33;
  unint64_t v34;
  uint8x8_t v35;
  uint64_t v36;
  _QWORD *v37;
  unint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  _QWORD *v41;
  unint64_t v42;
  uint64_t v43;
  _QWORD *v45;
  void *__p[2];
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = *a1;
  if (!*a1)
  {
    v5 = operator new();
    *(_OWORD *)v5 = 0u;
    *(_OWORD *)(v5 + 16) = 0u;
    *(_DWORD *)(v5 + 32) = 1065353216;
    *a1 = v5;
  }
  std::string::basic_string[abi:nn180100]<0>(__p, __s);
  v7 = HIBYTE(v47);
  if (v47 >= 0)
    v8 = (uint64_t *)__p;
  else
    v8 = (uint64_t *)__p[0];
  if (v47 >= 0)
    v9 = HIBYTE(v47);
  else
    v9 = (unint64_t)__p[1];
  v10 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](v8, v9);
  v11 = v10;
  v12 = *(_QWORD *)(v5 + 8);
  if (!v12)
  {
    v15 = 0xAAAAAAAAAAAAAAAALL;
    goto LABEL_26;
  }
  v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
  v13.i16[0] = vaddlv_u8(v13);
  v14 = v13.u32[0];
  if (v13.u32[0] > 1uLL)
  {
    v15 = v10;
    if (v10 >= v12)
      v15 = v10 % v12;
  }
  else
  {
    v15 = (v12 - 1) & v10;
  }
  v16 = *(unsigned __int8 ***)(*(_QWORD *)v5 + 8 * v15);
  if (!v16 || (v17 = *v16) == 0)
  {
LABEL_26:
    v19 = (_QWORD *)(v5 + 16);
    v20 = operator new(0x30uLL);
    *v20 = 0;
    v20[1] = v11;
    v21 = v47;
    *((_OWORD *)v20 + 1) = *(_OWORD *)__p;
    __p[1] = 0;
    v47 = 0;
    __p[0] = 0;
    v20[4] = v21;
    v20[5] = a3;
    v22 = (float)(unint64_t)(*(_QWORD *)(v5 + 24) + 1);
    v23 = *(float *)(v5 + 32);
    if (v12 && (float)(v23 * (float)v12) >= v22)
    {
LABEL_72:
      v39 = *(_QWORD **)v5;
      v40 = *(_QWORD **)(*(_QWORD *)v5 + 8 * v15);
      if (v40)
      {
        *v20 = *v40;
      }
      else
      {
        v41 = (_QWORD *)*v19;
        *v20 = *v19;
        *v19 = v20;
        v39[v15] = v19;
        if (!v41)
          goto LABEL_81;
        v42 = v41[1];
        if ((v12 & (v12 - 1)) != 0)
        {
          if (v42 >= v12)
            v42 %= v12;
        }
        else
        {
          v42 &= v12 - 1;
        }
        v40 = (_QWORD *)(*(_QWORD *)v5 + 8 * v42);
      }
      *v40 = v20;
LABEL_81:
      ++*(_QWORD *)(v5 + 24);
      v43 = 1;
      if (v47 < 0)
        goto LABEL_82;
      return v43;
    }
    v24 = 1;
    if (v12 >= 3)
      v24 = (v12 & (v12 - 1)) != 0;
    v25 = v24 | (2 * v12);
    v26 = vcvtps_u32_f32(v22 / v23);
    if (v25 <= v26)
      prime = (int8x8_t)v26;
    else
      prime = (int8x8_t)v25;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    }
    v12 = *(_QWORD *)(v5 + 8);
    if (*(_QWORD *)&prime > v12)
      goto LABEL_38;
    if (*(_QWORD *)&prime < v12)
    {
      v34 = vcvtps_u32_f32((float)*(unint64_t *)(v5 + 24) / *(float *)(v5 + 32));
      if (v12 < 3 || (v35 = (uint8x8_t)vcnt_s8((int8x8_t)v12), v35.i16[0] = vaddlv_u8(v35), v35.u32[0] > 1uLL))
      {
        v34 = std::__next_prime(v34);
      }
      else
      {
        v36 = 1 << -(char)__clz(v34 - 1);
        if (v34 >= 2)
          v34 = v36;
      }
      if (*(_QWORD *)&prime <= v34)
        prime = (int8x8_t)v34;
      if (*(_QWORD *)&prime >= v12)
      {
        v12 = *(_QWORD *)(v5 + 8);
      }
      else
      {
        if (prime)
        {
LABEL_38:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:nn180100]();
          v28 = operator new(8 * *(_QWORD *)&prime);
          v29 = *(_QWORD **)v5;
          *(_QWORD *)v5 = v28;
          if (v29)
            operator delete(v29);
          v30 = 0;
          *(int8x8_t *)(v5 + 8) = prime;
          do
            *(_QWORD *)(*(_QWORD *)v5 + 8 * v30++) = 0;
          while (*(_QWORD *)&prime != v30);
          v31 = (_QWORD *)*v19;
          if (*v19)
          {
            v32 = v31[1];
            v33 = (uint8x8_t)vcnt_s8(prime);
            v33.i16[0] = vaddlv_u8(v33);
            if (v33.u32[0] > 1uLL)
            {
              if (v32 >= *(_QWORD *)&prime)
                v32 %= *(_QWORD *)&prime;
            }
            else
            {
              v32 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)v5 + 8 * v32) = v19;
            v37 = (_QWORD *)*v31;
            if (*v31)
            {
              do
              {
                v38 = v37[1];
                if (v33.u32[0] > 1uLL)
                {
                  if (v38 >= *(_QWORD *)&prime)
                    v38 %= *(_QWORD *)&prime;
                }
                else
                {
                  v38 &= *(_QWORD *)&prime - 1;
                }
                if (v38 != v32)
                {
                  if (!*(_QWORD *)(*(_QWORD *)v5 + 8 * v38))
                  {
                    *(_QWORD *)(*(_QWORD *)v5 + 8 * v38) = v31;
                    goto LABEL_63;
                  }
                  *v31 = *v37;
                  *v37 = **(_QWORD **)(*(_QWORD *)v5 + 8 * v38);
                  **(_QWORD **)(*(_QWORD *)v5 + 8 * v38) = v37;
                  v37 = v31;
                }
                v38 = v32;
LABEL_63:
                v31 = v37;
                v37 = (_QWORD *)*v37;
                v32 = v38;
              }
              while (v37);
            }
          }
          v12 = (unint64_t)prime;
          goto LABEL_67;
        }
        v45 = *(_QWORD **)v5;
        *(_QWORD *)v5 = 0;
        if (v45)
          operator delete(v45);
        v12 = 0;
        *(_QWORD *)(v5 + 8) = 0;
      }
    }
LABEL_67:
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12)
        v15 = v11 % v12;
      else
        v15 = v11;
    }
    else
    {
      v15 = (v12 - 1) & v11;
    }
    goto LABEL_72;
  }
  while (1)
  {
    v18 = *((_QWORD *)v17 + 1);
    if (v18 == v11)
      break;
    if (v14 > 1)
    {
      if (v18 >= v12)
        v18 %= v12;
    }
    else
    {
      v18 &= v12 - 1;
    }
    if (v18 != v15)
      goto LABEL_26;
LABEL_25:
    v17 = *(unsigned __int8 **)v17;
    if (!v17)
      goto LABEL_26;
  }
  if (!std::equal_to<std::string>::operator()[abi:nn180100](v17 + 16, (unsigned __int8 *)__p))
    goto LABEL_25;
  v43 = 0;
  if (v7 < 0)
LABEL_82:
    operator delete(__p[0]);
  return v43;
}

_QWORD *_os_procinfo_map_clear(_QWORD *result, uint64_t (*a2)(_QWORD))
{
  _QWORD *v3;
  _QWORD *i;
  _QWORD *v5;
  uint64_t v6;
  uint64_t j;

  if (result)
  {
    v3 = result;
    if (a2)
    {
      for (i = (_QWORD *)result[2]; i; i = (_QWORD *)*i)
        result = (_QWORD *)a2(i[4]);
    }
    if (v3[3])
    {
      result = (_QWORD *)v3[2];
      if (result)
      {
        do
        {
          v5 = (_QWORD *)*result;
          operator delete(result);
          result = v5;
        }
        while (v5);
      }
      v3[2] = 0;
      v6 = v3[1];
      if (v6)
      {
        for (j = 0; j != v6; ++j)
          *(_QWORD *)(*v3 + 8 * j) = 0;
      }
      v3[3] = 0;
    }
  }
  return result;
}

void _catalog_procinfo_free(unsigned int **a1)
{
  void (*v2)(_QWORD);

  v2 = (void (*)(_QWORD))MEMORY[0x1E0C834A8];
  hashtable_destroy(a1[7], (void (*)(_QWORD))MEMORY[0x1E0C834A8]);
  hashtable_destroy(a1[8], v2);
  free(a1);
}

void hashtable_destroy(unsigned int *a1, void (*a2)(_QWORD))
{
  unint64_t v3;
  unint64_t i;
  _QWORD *v6;
  _QWORD *v7;

  if (!*((_QWORD *)a1 + 2))
    goto LABEL_12;
  v3 = *a1;
  if ((_DWORD)v3)
  {
    for (i = 0; i < v3; ++i)
    {
      v6 = *(_QWORD **)(*((_QWORD *)a1 + 2) + 8 * i);
      if (v6)
      {
        do
        {
          v7 = (_QWORD *)*v6;
          if (a2)
            a2(v6[2]);
          free(v6);
          --a1[1];
          v6 = v7;
        }
        while (v7);
        v3 = *a1;
      }
    }
  }
  if (!a1[1])
  {
    free(*((void **)a1 + 2));
LABEL_12:
    free(a1);
    return;
  }
  _os_assert_log();
  _os_crash();
  __break(1u);
}

uint64_t _OSLogIndexOrderForClosing(void *a1, void *a2, char a3)
{
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v5 = a1;
  v6 = a2;
  if ((a3 & 8) == 0)
  {
    v7 = objc_msgSend(v5, "endTime");
    if (v7 != objc_msgSend(v6, "endTime"))
    {
      v8 = objc_msgSend(v5, "endTime");
      if (v8 < objc_msgSend(v6, "endTime"))
        v9 = -1;
      else
        v9 = 1;
      goto LABEL_11;
    }
LABEL_7:
    v9 = 0;
    goto LABEL_11;
  }
  v10 = objc_msgSend(v5, "oldestTime");
  if (v10 == objc_msgSend(v6, "oldestTime"))
    goto LABEL_7;
  v11 = objc_msgSend(v5, "oldestTime");
  if (v11 > objc_msgSend(v6, "oldestTime"))
    v9 = -1;
  else
    v9 = 1;
LABEL_11:

  return v9;
}

void _oltb_allocate_row(void *a1)
{
  _BYTE *v1;
  _BYTE *v2;
  _BYTE *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v2 = a1;
  if (!v2[40])
  {
    qword_1EE52EA58 = (uint64_t)"BUG IN LIBTRACE: oltb maniplation while immutable";
    __break(1u);
    goto LABEL_17;
  }
  v1 = v2;

  v3 = v1;
  if (!v1[40])
  {
LABEL_17:
    qword_1EE52EA58 = (uint64_t)"BUG IN LIBTRACE: oltb maniplation while immutable";
    __break(1u);
    goto LABEL_18;
  }
  v4 = v3;

  v5 = v4[2];
  v6 = v4[4] - v4[3];

  if (!(v6 + v5))
  {
    v7 = v4[4];
    if (v7)
      v8 = v7 >> 1;
    else
      v8 = 1024;
    v9 = v4;
    _oltb_consolidate(v9);
    v10 = v4[3] + v8;
    v11 = (void *)_os_trace_malloc();
    v12 = v11;
    v13 = (void *)v9[1];
    if (v13)
    {
      v14 = v4[3];
      if (v14)
      {
        memcpy(v11, v13, 1120 * v14);
        v13 = (void *)v9[1];
      }
    }
    free(v13);
    v9[1] = v12;
    v4[4] = v10;

  }
  v15 = v4[2];
  if (v15)
  {
    v4[2] = v15 - 1;
LABEL_15:

    return;
  }
  v1 = (_BYTE *)v4[3];
  if ((unint64_t)v1 < v4[4])
  {
    v4[3] = v1 + 1;
    goto LABEL_15;
  }
LABEL_18:
  qword_1EE52EA58 = (uint64_t)"BUG IN LIBTRACE: oltb table overflow";
  qword_1EE52EA88 = (uint64_t)v1;
  __break(1u);
}

uint64_t _OSLogEventUnpackChunk(int *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  unint64_t v5;
  unint64_t v6;
  unsigned __int16 *v7;
  _BOOL4 v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  BOOL v22;
  int v23;
  __int16 v25;

  *(_QWORD *)a3 = a1;
  v3 = (_QWORD *)(a3 + 16);
  v4 = *a1;
  switch(*a1)
  {
    case 24577:
      v5 = *((_QWORD *)a1 + 1);
      v6 = v5 - 16;
      if (v5 < 0x10)
        goto LABEL_22;
      v7 = (unsigned __int16 *)(a1 + 8);
      v8 = *((_BYTE *)a1 + 29) != 0;
      goto LABEL_16;
    case 24578:
      v11 = *((_QWORD *)a1 + 1);
      v6 = v11 - 32;
      if (v11 < 0x20)
        goto LABEL_22;
      v8 = 0;
      v7 = (unsigned __int16 *)(a1 + 12);
      goto LABEL_16;
    case 24579:
      v12 = *((_QWORD *)a1 + 1);
      v6 = v12 - 48;
      if (v12 < 0x30)
        goto LABEL_22;
      v8 = 0;
      v7 = (unsigned __int16 *)(a1 + 16);
      goto LABEL_16;
    case 24580:
      v13 = *((_QWORD *)a1 + 1);
      v6 = v13 - 72;
      if (v13 < 0x48)
        goto LABEL_22;
      v8 = 0;
      v7 = (unsigned __int16 *)(a1 + 22);
      goto LABEL_16;
    case 24581:
    case 24582:
    case 24583:
    case 24584:
    case 24585:
    case 24586:
    case 24587:
      goto LABEL_7;
    case 24588:
      v14 = *((_QWORD *)a1 + 1);
      v6 = v14 - 16;
      if (v14 < 0x10)
        goto LABEL_22;
      v8 = 0;
      v7 = (unsigned __int16 *)a1 + 15;
      goto LABEL_16;
    default:
      if (v4 != 24592)
      {
LABEL_7:
        v10 = 0;
        *(_OWORD *)(a3 + 24) = 0u;
        *(_OWORD *)(a3 + 8) = 0u;
        return v10;
      }
      v9 = *((_QWORD *)a1 + 1);
      v6 = v9 - 16;
      if (v9 < 0x10)
        goto LABEL_22;
      v8 = 0;
      v7 = (unsigned __int16 *)(a1 + 8);
LABEL_16:
      if (v6 - 4097 < 0xFFFFFFFFFFFFF00FLL)
        goto LABEL_17;
      v15 = *v7;
      if (v6 < v15)
      {
LABEL_22:
        v10 = 0;
        *(_QWORD *)(a3 + 8) = 0;
        *(_QWORD *)(a3 + 32) = 0;
        return v10;
      }
      v17 = v7[1];
      if (v17 > 0xFFF)
        goto LABEL_17;
      if (!v8)
      {
        if (v6 == 4096)
        {
          *v3 = (char *)v7 + v17;
          v18 = (unsigned __int16)(4096 - v17);
          goto LABEL_45;
        }
LABEL_17:
        *v3 = 0;
        *(_QWORD *)(a3 + 24) = 0;
        goto LABEL_18;
      }
      if (v6 > v15 + (unsigned __int16)(4096 - v17))
        goto LABEL_17;
      v18 = (unsigned __int16)(4096 - v17);
      *v3 = (char *)v7 + v15;
LABEL_45:
      *(_QWORD *)(a3 + 24) = v18;
LABEL_18:
      *(_QWORD *)(a3 + 8) = v7;
      *(_QWORD *)(a3 + 32) = 0;
      if ((v4 - 24577) < 4)
      {
        if (a2)
          *(_QWORD *)(a3 + 32) = _os_procinfo_map_lookup(*(_QWORD **)(a2 + 40), *((_QWORD *)a1 + 2), a1[6]);
        return 1;
      }
      if (v4 == 24592)
      {
        v16 = 0;
        goto LABEL_31;
      }
      v10 = 0;
      if (v4 == 24588)
      {
        v16 = *((unsigned __int8 *)a1 + 29);
LABEL_31:
        if (a2)
        {
          v19 = *(_QWORD *)(a2 + 40);
          if (v19)
          {
            v20 = (_QWORD *)(v19 + 16);
            while (1)
            {
              v20 = (_QWORD *)*v20;
              if (!v20)
                break;
              if (v20[2] == *((_QWORD *)a1 + 2))
              {
                v21 = v20[4];
                *(_QWORD *)(a3 + 32) = v21;
                if (v21)
                  v22 = v16 == 0;
                else
                  v22 = 1;
                if (!v22)
                {
                  v23 = *(__int16 *)(v21 + 2);
                  if (v23 < 0)
                  {
                    v25 = v23 & 0x7FFF;
                    *(_WORD *)(v21 + 2) = v25;
                    if (v16 == 4)
                      *(_WORD *)(v21 + 2) = v25 | 1;
                  }
                }
                return 1;
              }
            }
          }
        }
        return 1;
      }
      return v10;
  }
}

_QWORD *_os_procinfo_map_lookup(_QWORD *result, uint64_t a2, unsigned int a3)
{
  int8x8_t v3;
  uint64_t v4;
  unint64_t v5;
  uint8x8_t v6;
  unint64_t v7;
  uint64_t **v8;
  uint64_t *i;
  unint64_t v10;

  if (result)
  {
    v3 = (int8x8_t)result[1];
    if (v3)
    {
      v4 = __ROR8__(__PAIR64__(a3, HIDWORD(a2)) + 12, 12);
      v5 = (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (a2 ^ v4)) >> 47) ^ (0x9DDFEA08EB382D69 * (a2 ^ v4)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (a2 ^ v4)) >> 47) ^ (0x9DDFEA08EB382D69 * (a2 ^ v4)))) >> 47))) ^ __PAIR64__(a3, HIDWORD(a2));
      v6 = (uint8x8_t)vcnt_s8(v3);
      v6.i16[0] = vaddlv_u8(v6);
      if (v6.u32[0] > 1uLL)
      {
        v7 = (0x9DDFEA08EB382D69
            * ((0x9DDFEA08EB382D69
              * (v4 ^ ((0x9DDFEA08EB382D69 * (a2 ^ v4)) >> 47) ^ (0x9DDFEA08EB382D69 * (a2 ^ v4)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (a2 ^ v4)) >> 47) ^ (0x9DDFEA08EB382D69 * (a2 ^ v4)))) >> 47))) ^ __PAIR64__(a3, HIDWORD(a2));
        if (v5 >= *(_QWORD *)&v3)
          v7 = v5 % *(_QWORD *)&v3;
      }
      else
      {
        v7 = v5 & (*(_QWORD *)&v3 - 1);
      }
      v8 = *(uint64_t ***)(*result + 8 * v7);
      if (v8)
      {
        for (i = *v8; i; i = (uint64_t *)*i)
        {
          v10 = i[1];
          if (v5 == v10)
          {
            if (*((_DWORD *)i + 6) == a3 && i[2] == a2)
              return (_QWORD *)i[4];
          }
          else
          {
            if (v6.u32[0] > 1uLL)
            {
              if (v10 >= *(_QWORD *)&v3)
                v10 %= *(_QWORD *)&v3;
            }
            else
            {
              v10 &= *(_QWORD *)&v3 - 1;
            }
            if (v10 != v7)
              return 0;
          }
        }
      }
    }
    return 0;
  }
  return result;
}

uint64_t catalog_chunk_parse_procinfo_subsystem(unsigned __int16 **a1, unint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  int v7;
  unsigned __int16 **v11;
  unsigned __int16 *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unsigned __int16 *v18;
  _QWORD *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unsigned __int16 *v26;
  unint64_t v28;
  unint64_t v29;
  char *v30;
  _QWORD *v31;
  _QWORD *v32;
  unint64_t v33;
  unsigned __int16 **v35;
  int v36;
  uint64_t v37;
  uint64_t v38;

  v7 = a5;
  v11 = a1;
  v12 = *a1;
  if (*(_DWORD *)(a6 + 4) != 17)
  {
    if (!a2 || (a2 >= (unint64_t)v12 ? (v21 = a2 - (unint64_t)v12 >= 8) : (v21 = 0), v21))
    {
      *a1 = v12 + 4;
      if (v12)
      {
        v22 = *(unsigned __int16 *)(a6 + 16);
        v23 = *(unsigned __int16 *)(a6 + 18);
        if (a5)
          printf("\t%10s : %llu\n", "subsystems", *(_QWORD *)v12);
        if (*(_QWORD *)v12)
        {
          v24 = 0;
          v38 = a6 + 24 + v22 + 8;
          v25 = v23 - (v22 + 8);
          v36 = v7;
          while (1)
          {
            v26 = *v11;
            if (a2)
            {
              if (a2 < (unint64_t)v26 || a2 - (unint64_t)v26 < 4)
                return 0;
            }
            *v11 = v26 + 2;
            if (!v26)
              return 0;
            if (v7)
              printf("\t\t<%10s : %3u, %10s : %5hu>\n", "id", *v26, "offset", v26[1]);
            v28 = v26[1];
            if (v25 < v28)
            {
LABEL_59:
              _os_assumes_log();
              return 0;
            }
            if (!hashtable_lookup(*(_QWORD *)(a4 + 64), (uint64_t)v26))
            {
              v29 = v25;
              v30 = (char *)(v38 + v28);
              v31 = (_QWORD *)_os_trace_calloc();
              *(_WORD *)v31 = *v26;
              v31[1] = _os_trace_str_map_entry(*(_QWORD **)(a3 + 24), v30 + 2);
              v32 = _os_trace_str_map_entry(*(_QWORD **)(a3 + 24), &v30[*v30 + 2]);
              v31[2] = v32;
              if (!v32 || !v31[1])
                _os_assumes_log();
              hashtable_insert(*(int **)(a4 + 64), v31, (uint64_t)v31);
              ++*(_QWORD *)(a3 + 56);
              v25 = v29;
              v7 = v36;
            }
            if ((unint64_t)++v24 >= *(_QWORD *)v12)
              goto LABEL_56;
          }
        }
        goto LABEL_56;
      }
    }
    return 0;
  }
  if (a2)
  {
    if (a2 < (unint64_t)v12 || a2 - (unint64_t)v12 < 8)
      return 0;
  }
  *a1 = v12 + 4;
  if (!v12)
    return 0;
  v14 = *(unsigned __int16 *)(a6 + 16);
  v15 = *(unsigned __int16 *)(a6 + 18);
  if (a5)
    printf("\t%10s : %llu\n", "subsystems", *(_QWORD *)v12);
  if (*(_QWORD *)v12)
  {
    v16 = 0;
    v37 = a6 + 40 + v14;
    v17 = v15 - v14;
    v35 = v11;
    do
    {
      v18 = *v11;
      if (a2)
      {
        if (a2 < (unint64_t)v18 || a2 - (unint64_t)v18 < 6)
          return 0;
      }
      *v11 = v18 + 3;
      if (!v18)
        return 0;
      if (v7)
        printf("\t\t<%10s : %3u, %10s : %5hu, %10s : %5hu>\n", "id", *v18, "subsystem", v18[1], "category", v18[2]);
      if (v17 < v18[1] || v17 < v18[2])
        goto LABEL_59;
      if (!hashtable_lookup(*(_QWORD *)(a4 + 64), (uint64_t)v18))
      {
        v20 = (_QWORD *)_os_trace_calloc();
        *(_WORD *)v20 = *v18;
        v20[1] = _os_trace_str_map_entry(*(_QWORD **)(a3 + 24), (char *)(v37 + v18[1]));
        v11 = v35;
        v20[2] = _os_trace_str_map_entry(*(_QWORD **)(a3 + 24), (char *)(v37 + v18[2]));
        hashtable_insert(*(int **)(a4 + 64), v20, (uint64_t)v20);
        ++*(_QWORD *)(a3 + 56);
      }
    }
    while ((unint64_t)++v16 < *(_QWORD *)v12);
  }
LABEL_56:
  v33 = (unint64_t)*v11;
  if (((unint64_t)*v11 & 7) != 0)
    v33 = ((unint64_t)*v11 & 0xFFFFFFFFFFFFFFF8) + 8;
  *v11 = (unsigned __int16 *)v33;
  return 1;
}

_QWORD *_os_trace_str_map_entry(_QWORD *result, char *a2)
{
  _QWORD *v2;
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  void *__p[2];
  char v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = result;
    std::string::basic_string[abi:nn180100]<0>(__p, a2);
    v3 = std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::find<std::string>(v2, (uint64_t)__p);
    v4 = v3;
    if (v6 < 0)
    {
      operator delete(__p[0]);
      if (v4)
      {
LABEL_4:
        result = v4 + 16;
        if ((char)v4[39] < 0)
          return (_QWORD *)*result;
        return result;
      }
    }
    else if (v3)
    {
      goto LABEL_4;
    }
    return 0;
  }
  return result;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::find<std::string>(_QWORD *a1, uint64_t a2)
{
  int v4;
  uint64_t *v5;
  unint64_t v6;
  unint64_t v7;
  int8x8_t v8;
  unint64_t v9;
  uint8x8_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int8 **v13;
  unsigned __int8 *i;
  unint64_t v15;

  v4 = *(char *)(a2 + 23);
  if (v4 >= 0)
    v5 = (uint64_t *)a2;
  else
    v5 = *(uint64_t **)a2;
  if (v4 >= 0)
    v6 = *(unsigned __int8 *)(a2 + 23);
  else
    v6 = *(_QWORD *)(a2 + 8);
  v7 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](v5, v6);
  v8 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v8)
    return 0;
  v9 = v7;
  v10 = (uint8x8_t)vcnt_s8(v8);
  v10.i16[0] = vaddlv_u8(v10);
  v11 = v10.u32[0];
  if (v10.u32[0] > 1uLL)
  {
    v12 = v7;
    if (v7 >= *(_QWORD *)&v8)
      v12 = v7 % *(_QWORD *)&v8;
  }
  else
  {
    v12 = (*(_QWORD *)&v8 - 1) & v7;
  }
  v13 = *(unsigned __int8 ***)(*a1 + 8 * v12);
  if (!v13)
    return 0;
  for (i = *v13; i; i = *(unsigned __int8 **)i)
  {
    v15 = *((_QWORD *)i + 1);
    if (v9 == v15)
    {
      if (std::equal_to<std::string>::operator()[abi:nn180100](i + 16, (unsigned __int8 *)a2))
        return i;
    }
    else
    {
      if (v11 > 1)
      {
        if (v15 >= *(_QWORD *)&v8)
          v15 %= *(_QWORD *)&v8;
      }
      else
      {
        v15 &= *(_QWORD *)&v8 - 1;
      }
      if (v15 != v12)
        return 0;
    }
  }
  return i;
}

uint64_t hashtable_lookup(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  unsigned int (*v5)(_QWORD, uint64_t);

  if (*(_QWORD *)(a1 + 16))
  {
    v4 = (_QWORD *)(*(_QWORD *)(a1 + 16) + 8 * (hash_fn_array[*(unsigned __int8 *)(a1 + 8)](a2) % *(_DWORD *)a1));
    v5 = (unsigned int (*)(_QWORD, uint64_t))hashkey_compare_array[*(unsigned __int8 *)(a1 + 8)];
    while (1)
    {
      v4 = (_QWORD *)*v4;
      if (!v4)
        break;
      if (v5(v4[1], a2))
        return v4[2];
    }
  }
  return 0;
}

uint64_t hashtable_insert(int *a1, _QWORD *a2, uint64_t a3)
{
  unsigned int v6;
  unsigned int v7;
  _QWORD *v8;
  uint64_t (*v9)(_QWORD, _QWORD *);
  unsigned int v11;
  int v12;
  _QWORD *v13;
  uint64_t v14;

  v6 = ((unsigned int (**)(_QWORD *))hash_fn_array)[*((unsigned __int8 *)a1 + 8)](a2);
  v7 = *a1;
  if (!*((_QWORD *)a1 + 2))
    goto LABEL_8;
  v8 = (_QWORD *)(*((_QWORD *)a1 + 2)
                + 8
                * (((unsigned int (**)(_QWORD *))hash_fn_array)[*((unsigned __int8 *)a1 + 8)](a2) % *a1));
  v9 = (uint64_t (*)(_QWORD, _QWORD *))hashkey_compare_array[*((unsigned __int8 *)a1 + 8)];
  while (1)
  {
    v8 = (_QWORD *)*v8;
    if (!v8)
      break;
    if ((v9(v8[1], a2) & 1) != 0)
      return 0;
  }
  if (!*((_QWORD *)a1 + 2))
LABEL_8:
    *((_QWORD *)a1 + 2) = _os_trace_calloc();
  v11 = v6 % v7;
  v12 = *((unsigned __int8 *)a1 + 8);
  v13 = (_QWORD *)_os_trace_calloc();
  *v13 = 0;
  v13[2] = a3;
  if (v12 == 2)
  {
    v13[1] = *a2;
  }
  else if (v12 == 1)
  {
    *((_WORD *)v13 + 4) = *(_WORD *)a2;
  }
  else
  {
    free(v13);
    v13 = 0;
  }
  v14 = *((_QWORD *)a1 + 2);
  *v13 = *(_QWORD *)(v14 + 8 * v11);
  *(_QWORD *)(v14 + 8 * v11) = v13;
  ++a1[1];
  return 1;
}

uint64_t hash_uint16(unsigned __int16 *a1)
{
  return *a1;
}

BOOL hashkey_compare_uint16(unsigned __int16 a1, unsigned __int16 *a2)
{
  return *a2 == a1;
}

uint64_t ___os_trace_formatters_list_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;
  char v7;
  size_t v8;
  const char *v9;

  v3 = result;
  v4 = 0;
  v5 = 0;
  v6 = 1;
  do
  {
    v7 = v6;
    if ((v4 & 1) != 0 || !*(_BYTE *)(v3 + 56))
    {
      v8 = strlen((&plugin_dirs)[2 * v5]);
      v9 = *(const char **)(a2 + 40);
      result = strncmp(v9, (&plugin_dirs)[2 * v5], v8);
      if (!(_DWORD)result)
      {
        result = _os_trace_formatter_record(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 8) + 24), (char *)&v9[v8], v5, (uint64_t *)(*(_QWORD *)(*(_QWORD *)(v3 + 40) + 8) + 24), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 48) + 8) + 24));
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 8) + 24) = result;
      }
    }
    v6 = 0;
    v4 = 1;
    v5 = 1;
  }
  while ((v7 & 1) != 0);
  return result;
}

uint64_t _OSLogIndexOrderForOpening(void *a1, void *a2, char a3)
{
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v5 = a1;
  v6 = a2;
  if ((a3 & 8) == 0)
  {
    v7 = objc_msgSend(v5, "oldestTime");
    if (v7 != objc_msgSend(v6, "oldestTime"))
    {
      v8 = objc_msgSend(v5, "oldestTime");
      if (v8 < objc_msgSend(v6, "oldestTime"))
        v9 = -1;
      else
        v9 = 1;
      goto LABEL_11;
    }
LABEL_7:
    v9 = 0;
    goto LABEL_11;
  }
  v10 = objc_msgSend(v5, "endTime");
  if (v10 == objc_msgSend(v6, "endTime"))
    goto LABEL_7;
  v11 = objc_msgSend(v5, "endTime");
  if (v11 > objc_msgSend(v6, "endTime"))
    v9 = -1;
  else
    v9 = 1;
LABEL_11:

  return v9;
}

uint64_t hash_uint64(_QWORD *a1)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v1 = *a1 + ~(*a1 << 32);
  v2 = 9 * (((v1 ^ (v1 >> 22)) + ~((v1 ^ (v1 >> 22)) << 13)) ^ (((v1 ^ (v1 >> 22)) + ~((v1 ^ (v1 >> 22)) << 13)) >> 8));
  v3 = (v2 ^ (v2 >> 15)) + ~((v2 ^ (v2 >> 15)) << 27);
  return (v3 >> 31) ^ v3;
}

uint64_t _os_trace_formatter_record(uint64_t a1, char *__s1, uint64_t a3, uint64_t *a4, _QWORD *a5)
{
  char *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;

  if (!strncmp(__s1, "liblog_", 7uLL) && !strchr(__s1, 47))
  {
    v11 = strrchr(__s1, 46);
    if (v11)
    {
      v12 = v11;
      if (!strcmp(v11, ".dylib"))
      {
        v13 = strndup(__s1 + 7, v12 - (__s1 + 7));
        v14 = *a4;
        if (*a4)
        {
          v15 = 8;
          v16 = *a4;
          while (strcasecmp(*(const char **)(a1 + v15), v13))
          {
            v15 += 40;
            if (!--v16)
              goto LABEL_10;
          }
          free(v13);
        }
        else
        {
LABEL_10:
          if (v14 == *a5)
          {
            *a5 = v14 + 8;
            a1 = _os_trace_realloc();
            v14 = *a4;
          }
          *a4 = v14 + 1;
          v17 = (_QWORD *)(a1 + 40 * v14);
          *v17 = 0;
          v17[1] = v13;
          v17[3] = 0;
          v17[4] = 0;
          v17[2] = a3;
        }
      }
    }
  }
  return a1;
}

BOOL catalog_chunk_parse_subchunk(unint64_t *a1, uint64_t a2, int a3, uint64_t a4)
{
  char v5;
  unint64_t v8;
  unint64_t v9;
  _BOOL8 result;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, unsigned __int16, uint64_t *, unint64_t *);
  void *v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t v18;

  v5 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v8 = *(_QWORD *)(a4 + 8) + a4 + 16;
  if (a3)
    printf("\n----- %-30s -----\n", "Catalog Subchunk Section");
  if (*(_DWORD *)(a4 + 4) == 17)
  {
    v9 = *(unsigned __int16 *)(a4 + 24);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 0x40000000;
    v13 = __catalog_chunk_parse_subchunk_v2_block_invoke;
    v14 = &__block_descriptor_tmp_72;
    v17 = v5;
    v15 = a2;
    v16 = v8;
    if (!catalog_chunk_parse_entries(a1, v8, 0x18uLL, v9, (uint64_t)&v11))
      return 0;
  }
  else
  {
    v11 = MEMORY[0x1E0C809B0];
    v12 = 0x40000000;
    v13 = __catalog_chunk_parse_subchunk_legacy_block_invoke;
    v14 = &__block_descriptor_tmp_75;
    v17 = v5;
    v15 = a2;
    v16 = v8;
    result = catalog_chunk_parse_section(a1, v8, 0x20uLL, (uint64_t)&v11);
    if (!result)
      return result;
  }
  return *a1 <= v8;
}

BOOL hashkey_compare_uint64(uint64_t a1, _QWORD *a2)
{
  return *a2 == a1;
}

uint64_t _catalog_for_each_uuid(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  _QWORD *i;
  _QWORD v4[2];
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(result + 16);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v5 = ___catalog_for_each_uuid_block_invoke;
  v6 = &unk_1E41563C0;
  v7 = a2;
  for (i = *(_QWORD **)(v2 + 16); i; i = (_QWORD *)*i)
    result = ((uint64_t (*)(_QWORD *, _QWORD *, _QWORD))v5)(v4, i + 2, i[4]);
  return result;
}

uint64_t ___catalog_for_each_uuid_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

const __CFString *_compose_log_message(uint64_t a1)
{
  char *v2;
  unint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  unsigned __int8 *pubdata;
  size_t v8;
  uint64_t v9;
  char *v10;
  _BYTE *v11;
  const __CFString *v12;
  size_t v13;
  _BYTE *v14;
  uint64_t v16;
  uint64_t v17;
  void *v19;
  char *v20;
  const char *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  unsigned int v31;
  char v32;
  char *v33;
  uint64_t v34;
  char *old_signpost_name_end;
  uint64_t v36;
  uint64_t v37;
  unsigned __int8 *v38;
  __int128 v39;
  int v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[130];

  v50[128] = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)(a1 + 168) & 2) == 0)
  {
    if ((*(_QWORD *)(a1 + 336) & 3) == 1)
      _resolve_uuid_slow(a1);
    v49 = 0x10000;
    v47 = (uint64_t)v50;
    v48 = 0x40000000000;
    v2 = *(char **)(a1 + 192);
    if (!v2)
    {
      if (!*(_QWORD *)(a1 + 176))
        return CFSTR("<compose failure [missing precomposed log]>");
      v19 = (void *)MEMORY[0x1E0CB3940];
      return (const __CFString *)objc_msgSend(v19, "stringWithUTF8String:");
    }
    v3 = *(_QWORD *)(a1 + 200);
    if (!(v3 >> 16) && !(*(_QWORD *)(a1 + 240) >> 16))
    {
      if (*(_QWORD *)(a1 + 8) == 768)
      {
        if (v3 - 1733 >= 0xFFFFFFFFFFFFF93CLL)
        {
          v5 = &v2[v3 - 1];
          v4 = *v5;
          if ((_WORD)v3 + ~(_WORD)v4 + 2 * (_WORD)v4 != 0xFFFE)
          {
            MEMORY[0x1E0C80A78]();
            pubdata = (unsigned __int8 *)&v37 - v6;
            bzero((char *)&v37 - v6, v8);
            *pubdata = 0;
            pubdata[1] = v4;
            if ((_DWORD)v4)
            {
              v9 = -v4;
              v10 = &v2[v3 + ~v4];
              v38 = pubdata;
              v11 = pubdata + 2;
              v12 = CFSTR("<compose failure [corrupt log]>");
              while (1)
              {
                v13 = v5[v9] & 0x3F;
                if (&v2[v13] > v10)
                  return v12;
                *v11 = 0;
                v11[1] = v13;
                v14 = v11 + 2;
                memcpy(v11 + 2, v2, v13);
                v11 = &v14[v13];
                v2 += v13;
                if (__CFADD__(v9++, 1))
                {
                  pubdata = v38;
                  goto LABEL_28;
                }
              }
            }
            goto LABEL_28;
          }
        }
      }
      else
      {
        pubdata = *(unsigned __int8 **)(a1 + 208);
        if (pubdata
          || (pubdata = os_log_fmt_extract_pubdata(*(_BYTE **)(a1 + 192), (unsigned __int16)*(_QWORD *)(a1 + 200), (_QWORD *)(a1 + 216), (unsigned __int16 *)(a1 + 224))) != 0)
        {
LABEL_28:
          objc_msgSend((id)a1, "set_unreliableIdentifier:", 0);
          if ((*(_QWORD *)(a1 + 8) | 0x200) == 0x600 && (*pubdata & 0x10) != 0)
            objc_msgSend((id)a1, "set_unreliableIdentifier:", 1);
          v20 = *(char **)(a1 + 176);
          if (v20)
            goto LABEL_34;
          v46 = 0;
          v21 = _os_log_resolve_format(*(__n128 **)(a1 + 112), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 160), &v46);
          *(_QWORD *)(a1 + 176) = v21;
          if (v21)
          {
            v20 = (char *)v21;
LABEL_34:
            if (*(_QWORD *)(a1 + 8) == 768)
              v22 = 1;
            else
              v22 = 2;
            v23 = *(unsigned __int8 *)(a1 + 364);
            if ((*(_DWORD *)(a1 + 168) & 1) != 0)
              v24 = 4;
            else
              v24 = 8;
            v25 = *(_QWORD *)(a1 + 216);
            v26 = *(unsigned __int16 *)(a1 + 224);
            v27 = *(_QWORD *)(a1 + 232);
            v28 = *(_QWORD *)(a1 + 240);
            v29 = *(_DWORD *)(a1 + 352);
            v30 = *(_QWORD *)(a1 + 72);
            v39 = *(_OWORD *)(a1 + 104);
            v41 = 0;
            v42 = v30;
            v40 = v29;
            v44 = 0;
            v45 = 0;
            v43 = 0;
            if (v23)
              v31 = 3;
            else
              v31 = 1;
            os_log_fmt_compose((size_t)&v47, v20, v22, v31, v24, pubdata, v25, v26, v27, v28, (uint64_t)&v39);
            v32 = BYTE4(v49);
            v33 = (char *)v47;
            v47 = 3954044928;
            WORD2(v49) = 0;
            v34 = v48;
            if ((v32 & 1) == 0)
              v33 = (char *)_os_trace_memdup();
            if (*(_QWORD *)(a1 + 8) == 1536 && !*(_QWORD *)(a1 + 288))
            {
              old_signpost_name_end = _find_old_signpost_name_end(v33, *(const char **)(a1 + 176));
              if (old_signpost_name_end)
              {
                v34 += (uint64_t)&v33[~(unint64_t)old_signpost_name_end];
                v36 = _os_trace_memdup();
                free(v33);
                v33 = (char *)v36;
              }
            }
            v12 = (const __CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v33, v34, 4, 1);
            *(_QWORD *)(a1 + 408) = v12;
            if (!v12)
            {
              free(v33);
              return CFSTR("<compose failure [illegible log arguments]>");
            }
            return v12;
          }
          v19 = (void *)MEMORY[0x1E0CB3940];
          return (const __CFString *)objc_msgSend(v19, "stringWithUTF8String:");
        }
      }
    }
    return CFSTR("<compose failure [corrupt log]>");
  }
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 328) + 1072);
  if (*(_DWORD *)v16 == 24580 && !*(_DWORD *)(v16 + 4) && *(_QWORD *)(v16 + 8) >= 0x49uLL)
  {
    v17 = _simple_support_validate_payload(v16, 0);
    if (v17)
      return (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v17 + *(unsigned int *)(v17 + 4) + 12);
  }
  return 0;
}

_BYTE *os_log_fmt_extract_pubdata(_BYTE *result, int a2, _QWORD *a3, unsigned __int16 *a4)
{
  char *v4;
  unsigned __int16 v5;
  int v6;
  unint64_t v7;

  *a3 = 0;
  *a4 = 0;
  if (!a2)
    return &os_log_fmt_extract_pubdata_empty_hdr;
  if (a2 == 1)
    return 0;
  v4 = result + 2;
  v5 = a2 - 2;
  if (result[1])
  {
    v6 = 0;
    while (v5 >= 2u)
    {
      v7 = v4[1] + 2;
      if (v7 > v5)
        break;
      v4 += v7;
      v5 -= v7;
      if (result[1] <= (unsigned __int16)++v6)
        goto LABEL_10;
    }
    return 0;
  }
LABEL_10:
  *a3 = v4;
  *a4 = v5;
  return result;
}

unint64_t os_log_fmt_compose(size_t a1, char *__s, uint64_t a3, unsigned int a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7, int a8, uint64_t a9, unsigned __int16 a10, uint64_t a11)
{
  unint64_t result;
  unint64_t v17;
  uint64_t v18;
  unsigned int v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  int8x8_t v27;
  unsigned __int16 v28;
  unsigned __int8 *v29;
  char v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t data;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int v41;
  unsigned __int8 *v42;
  uint64_t v43;
  _BOOL4 v44;
  uint64_t v45;
  uint64_t v46;
  unsigned int v47;
  _BOOL4 v48;
  const char *v49;
  size_t v50;
  unint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  size_t v55;
  char *v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  unsigned int *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  __n128 *p_src;
  uint64_t v68;
  unsigned int *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unsigned __int16 *v73;
  unsigned int *v74;
  unsigned int *v75;
  unsigned int v76;
  unsigned int *v77;
  size_t v78;
  __objc2_class *dsc_map_impl;
  _QWORD *v80;
  uint64_t v81;
  const char **v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  int v92;
  uint64_t v93;
  unsigned int v94;
  char v95;
  char *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  char *v100;
  size_t v101;
  uint64_t v102;
  uint64_t v103;
  unsigned int v104;
  unsigned int v105;
  uint64_t v106;
  int v107;
  char *__source;
  unsigned int v109;
  unsigned __int8 *p_scalar;
  unsigned int v111;
  BOOL v114;
  unsigned __int16 v115;
  unsigned __int8 *v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  unsigned __int16 v121;
  unsigned __int8 *v122;
  uint64_t scalar;
  char *__sa;
  uint64_t p_sa;
  uint64_t v126;
  uint64_t v127;
  size_t __src;
  uint64_t v129;
  BOOL (*v130)(uint64_t, unsigned __int16 *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v131;
  char **v132;
  char __dst[255];
  uint64_t v134;

  v134 = *MEMORY[0x1E0C80C00];
  v111 = (*a6 >> 5) & 3;
  v122 = a6 + 2;
  v121 = a6[1];
  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  while (1)
  {
    result = strcspn(__s, "%");
    v17 = result;
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      v18 = *(unsigned int *)(a1 + 8);
      if (result > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v18 - 1))
      {
        result = os_trace_blob_add_slow(a1, __s, result);
      }
      else
      {
        result = (unint64_t)memcpy((void *)(*(_QWORD *)a1 + v18), __s, result);
        v19 = *(_DWORD *)(a1 + 8) + v17;
        *(_DWORD *)(a1 + 8) = v19;
        if (!*(_BYTE *)(a1 + 22))
          *(_BYTE *)(*(_QWORD *)a1 + v19) = 0;
      }
    }
    v20 = &__s[v17];
    if (!__s[v17])
      break;
    result = (unint64_t)os_log_fmt_delimit(&__s[v17], a3, (uint64_t)&v117);
    if (result)
    {
      if ((BYTE8(v117) & 1) != 0)
        return _os_log_fmt_decode_give_up(a1, v117, WORD6(v117), v21, v22, v23, v24, v25);
      v26 = result;
      os_log_fmt_read_aster_if_necessary((uint64_t)&v117, &v121, &v122);
      v116 = 0;
      v115 = 0;
      v28 = v121;
      if (v121)
      {
        v29 = v122;
        v28 = --v121;
        v122 += v122[1] + 2;
      }
      else
      {
        v29 = 0;
      }
      v114 = 0;
      data = os_log_fmt_get_data((uint64_t)&v117, v111, a4, v29, v28, a5, &v116, &v115, v27, &v114, a7, a8, a9, a10);
      switch((int)data)
      {
        case 0:
          if ((BYTE8(v117) & 0x40) == 0)
            goto LABEL_21;
          v48 = v114;
          if ((BYTE8(v117) & 0x80) != 0)
          {
            if ((_os_log_fmt_builtin_annotated(a1, a5, (uint64_t)&v117, (uint64_t)v29, (uint64_t)v116, v115, v114) & 1) != 0)
              goto LABEL_107;
LABEL_21:
            if ((BYTE8(v117) & 0x10) != 0)
              _os_log_fmt_compose_scalar(a1, (uint64_t)&v117, a5, v116, v115);
            else
              _os_log_fmt_compose_data(a1, (uint64_t)&v117, v29, (const char *)v116, v115, v114);
            goto LABEL_107;
          }
          p_scalar = v116;
          v109 = v115;
          v49 = (const char *)v119;
          v50 = HIWORD(v117);
          if (!ctf_is_type((const char *)v119, HIWORD(v117)))
          {
            if ((_os_log_fmt_plugin_annotated(a1, a5, (uint64_t)&v117, v29, p_scalar, v109, v48) & 1) != 0)
              goto LABEL_107;
            goto LABEL_21;
          }
          if (!a11 || v48)
            goto LABEL_21;
          __source = (char *)*((_QWORD *)&v119 + 1);
          v51 = (unsigned __int16)v118;
          if (!ctf_is_type(v49, v50))
          {
            _os_assert_log();
            _os_crash();
            __break(1u);
LABEL_128:
            _os_assert_log();
            _os_crash();
            __break(1u);
LABEL_129:
            _os_assert_log();
            _os_crash();
            __break(1u);
LABEL_130:
            _os_assert_log();
            _os_crash();
            __break(1u);
LABEL_131:
            _os_assert_log();
            _os_crash();
            __break(1u);
LABEL_132:
            _os_assert_log();
            _os_crash();
            __break(1u);
          }
          v52 = *v49;
          if (v52 > 115)
          {
            if (v52 == 117)
            {
LABEL_60:
              if (v50 >= 0xFE)
                goto LABEL_130;
              strncpy(__dst, v49, v50);
              __dst[v50] = 32;
              v56 = &__dst[v50 + 1];
              if (254 - v50 >= v51 + 1)
                v55 = v51 + 1;
              else
                v55 = 254 - v50;
            }
            else
            {
              if (v52 != 116)
                goto LABEL_65;
              if (strncmp(v49, "type", 4uLL))
                goto LABEL_131;
              v54 = 254;
              if (v51 < 0xFE)
                v54 = v51;
              v55 = v54 + 1;
              v56 = __dst;
            }
            strlcpy(v56, __source, v55);
            goto LABEL_65;
          }
          if (v52 == 101 || v52 == 115)
            goto LABEL_60;
LABEL_65:
          v57 = a11;
          if (*(_QWORD *)(a11 + 32))
            goto LABEL_128;
          __sa = 0;
          p_sa = (uint64_t)&__sa;
          v126 = 0x2000000000;
          v127 = 0;
          if ((((*(_WORD *)(a11 + 26) & 0xE) - 4) & 0xFFFFFFF7) != 0)
          {
            __src = 0;
            v58 = *(_DWORD *)(a11 + 16);
            v59 = *(_QWORD *)(a11 + 8);
            if (v58)
              v60 = (unsigned int *)uuidpath_map_header_fd(v58, v59, &__src);
            else
              v60 = uuidpath_map_header(0, v59, &__src);
            v69 = v60;
            if (v60)
            {
              v70 = v60[3];
              v71 = *(_QWORD *)(p_sa + 24);
              v107 = a8;
              v106 = a5;
              if ((_DWORD)v70 && !v71)
              {
                v72 = 0;
                v73 = (unsigned __int16 *)&v69[2 * v70 + 4];
                v74 = v69 + 5;
                v75 = v69 + 5;
                while (1)
                {
                  v76 = *v75;
                  v75 += 2;
                  v77 = v69;
                  v71 = _ctf_open_buffer(v73, v76, v61, v62, v63, v64, v65, v66);
                  v69 = v77;
                  *(_QWORD *)(p_sa + 24) = v71;
                  if (++v72 >= (unint64_t)v77[3])
                    break;
                  v73 = (unsigned __int16 *)((char *)v73 + *v74);
                  v74 = v75;
                  if (v71)
                    goto LABEL_83;
                }
              }
              if (v71)
              {
LABEL_83:
                v78 = __src;
                v57 = a11;
                *(_QWORD *)(a11 + 40) = v69;
                *(_QWORD *)(a11 + 48) = v78;
                a8 = v107;
              }
              else
              {
                munmap(v69, __src);
                a8 = v107;
                v57 = a11;
              }
              a5 = v106;
            }
          }
          else
          {
            p_src = *(__n128 **)a11;
            if (*(_QWORD *)a11)
            {
              v68 = *(unsigned int *)(a11 + 16);
            }
            else
            {
              __src = 0;
              v129 = 0;
              if ((_dyld_get_shared_cache_uuid() & 1) == 0)
                goto LABEL_132;
              p_src = (__n128 *)&__src;
              v68 = 0xFFFFFFFFLL;
            }
            dsc_map_impl = _os_trace_uuiddb_get_dsc_map_impl(v68, 0, p_src, 1);
            if (dsc_map_impl)
            {
              v80 = *(_QWORD **)(a11 + 8);
              __src = MEMORY[0x1E0C809B0];
              v129 = 0x40000000;
              v130 = __ctf_metadata_open_ctf_block_invoke;
              v131 = &unk_1E41576A8;
              v132 = &__sa;
              _os_trace_uuiddb_dsc_foreach_range_with_uuid((uint64_t)dsc_map_impl, v80, (uint64_t)&__src);
            }
          }
          v81 = p_sa;
          *(_QWORD *)(v57 + 32) = *(_QWORD *)(p_sa + 24);
          v82 = *(const char ***)(v81 + 24);
          _Block_object_dispose(&__sa, 8);
          if (!v82)
            goto LABEL_21;
          scalar = 0;
          if ((BYTE8(v117) & 0x10) != 0)
          {
            scalar = os_log_fmt_read_scalar((uint64_t)&v117, p_scalar, v109);
            p_scalar = (unsigned __int8 *)&scalar;
          }
          v126 = 0;
          __sa = (char *)&__src;
          p_sa = 0x40000000000;
          v83 = ctf_lookup_by_name(v82, __dst);
          if (v83 == -1 || !ctf_type_parse((uint64_t)v82, v83, (uint64_t)&__sa, (uint64_t)p_scalar, v109))
          {
            v95 = 0;
          }
          else
          {
            v91 = strlen(__sa);
            if ((*(_WORD *)(a1 + 20) & 2) == 0)
            {
              v92 = v91;
              v93 = *(unsigned int *)(a1 + 8);
              if (v91 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v93 - 1))
              {
                os_trace_blob_add_slow(a1, __sa, v91);
              }
              else
              {
                memcpy((void *)(*(_QWORD *)a1 + v93), __sa, v91);
                v94 = *(_DWORD *)(a1 + 8) + v92;
                *(_DWORD *)(a1 + 8) = v94;
                if (!*(_BYTE *)(a1 + 22))
                  *(_BYTE *)(*(_QWORD *)a1 + v94) = 0;
              }
            }
            v95 = 1;
          }
          if ((v126 & 0x100000000) != 0)
          {
            v96 = __sa;
            __sa = (char *)3954044928;
            WORD2(v126) = 0;
            free(v96);
          }
          v97 = *(_QWORD *)(a11 + 32);
          if (!v97)
            goto LABEL_129;
          ctf_close(v97, v84, v85, v86, v87, v88, v89, v90);
          v98 = *(void **)(a11 + 40);
          if (v98)
            munmap(v98, *(_QWORD *)(a11 + 48));
          *(_QWORD *)(a11 + 32) = 0;
          if ((v95 & 1) == 0)
            goto LABEL_21;
LABEL_107:
          __s = &v20[v26];
          break;
        case 5:
          v42 = v116;
          v43 = v115;
          v44 = v114;
          os_trace_blob_addf(a1, "<mask.%.*s: ", v34, data, v35, v36, v37, v38, SBYTE2(v118));
          if (v43 || v44)
          {
            os_trace_blob_add_base64(a1, (uint64_t)v42, v43);
          }
          else if ((*(_WORD *)(a1 + 20) & 2) == 0)
          {
            v45 = *(unsigned int *)(a1 + 8);
            if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v45 - 1) <= 5)
            {
              os_trace_blob_add_slow(a1, "(null)", 6uLL);
            }
            else
            {
              v46 = *(_QWORD *)a1 + v45;
              *(_WORD *)(v46 + 4) = 10604;
              *(_DWORD *)v46 = 1819635240;
              v47 = *(_DWORD *)(a1 + 8) + 6;
              *(_DWORD *)(a1 + 8) = v47;
              if (!*(_BYTE *)(a1 + 22))
                *(_BYTE *)(*(_QWORD *)a1 + v47) = 0;
            }
          }
          if ((*(_WORD *)(a1 + 20) & 2) == 0)
          {
            v53 = *(unsigned int *)(a1 + 8);
            if (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - 1 == (_DWORD)v53)
            {
              v99 = a1;
              v100 = ">";
              v101 = 1;
LABEL_113:
              os_trace_blob_add_slow(v99, v100, v101);
            }
            else
            {
              *(_BYTE *)(*(_QWORD *)a1 + v53) = 62;
              v41 = *(_DWORD *)(a1 + 8) + 1;
LABEL_46:
              *(_DWORD *)(a1 + 8) = v41;
              if (!*(_BYTE *)(a1 + 22))
                *(_BYTE *)(*(_QWORD *)a1 + v41) = 0;
            }
          }
          goto LABEL_107;
        case 6:
        case 7:
          _os_log_fmt_compose_masked_partial_redacted(a1, (char *)v116, v115, v114, v35, v36, v37, v38);
          goto LABEL_107;
        default:
          switch((int)data)
          {
            case 1:
              if ((*(_WORD *)(a1 + 20) & 2) == 0)
              {
                v39 = *(unsigned int *)(a1 + 8);
                if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v39 - 1) > 8)
                {
                  v40 = *(_QWORD *)a1 + v39;
                  *(_QWORD *)v40 = *(_QWORD *)"<private>";
                  *(_BYTE *)(v40 + 8) = 62;
                  v41 = *(_DWORD *)(a1 + 8) + 9;
                  goto LABEL_46;
                }
                v99 = a1;
                v100 = "<private>";
                v101 = 9;
                goto LABEL_113;
              }
              break;
            case 2:
              _os_log_fmt_decode_error(a1);
              break;
            case 3:
              _os_log_fmt_decode_cmd_mismatch(a1, v117, WORD6(v117), v29, v115, v115, v37, v38);
              break;
            case 4:
              _os_log_fmt_decode_bad_range(a1, v117, WORD6(v117), *((unsigned __int16 *)v29 + 1), *((unsigned __int16 *)v29 + 2), v115, v37, v38);
              break;
            case 8:
            case 9:
            case 10:
              _os_log_fmt_decode_masked_unknown(a1, SBYTE2(v118), v120, data, v35, v115, v37, v38);
              break;
            default:
              goto LABEL_107;
          }
          goto LABEL_107;
      }
    }
    else
    {
      v30 = v20[1];
      if (!v30)
        break;
      LOBYTE(__src) = v20[1];
      if ((*(_BYTE *)(a1 + 20) & 2) == 0)
      {
        v31 = *(unsigned int *)(a1 + 8);
        if (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - 1 == (_DWORD)v31)
        {
          os_trace_blob_add_slow(a1, &__src, 1uLL);
        }
        else
        {
          *(_BYTE *)(*(_QWORD *)a1 + v31) = v30;
          v32 = *(_DWORD *)(a1 + 8) + 1;
          *(_DWORD *)(a1 + 8) = v32;
          if (!*(_BYTE *)(a1 + 22))
            *(_BYTE *)(*(_QWORD *)a1 + v32) = 0;
        }
      }
      __s = v20 + 2;
    }
  }
  v102 = *(unsigned int *)(a1 + 8) - 1;
  v103 = MEMORY[0x1E0C80978];
  while (v102 != -1)
  {
    v104 = *(char *)(*(_QWORD *)a1 + v102);
    if ((v104 & 0x80000000) != 0)
      result = __maskrune(v104, 0x4000uLL);
    else
      result = *(_DWORD *)(v103 + 4 * v104 + 60) & 0x4000;
    --v102;
    if (!(_DWORD)result)
    {
      v105 = v102 + 2;
      goto LABEL_123;
    }
  }
  v105 = 0;
LABEL_123:
  *(_DWORD *)(a1 + 8) = v105;
  if (!*(_BYTE *)(a1 + 22))
    *(_BYTE *)(*(_QWORD *)a1 + v105) = 0;
  return result;
}

uint64_t os_log_fmt_get_data(uint64_t result, unsigned int a2, unsigned int a3, unsigned __int8 *a4, int a5, unsigned __int16 a6, unsigned __int8 **a7, _WORD *a8, int8x8_t a9, BOOL *a10, uint64_t a11, unsigned __int16 a12, uint64_t a13, unsigned __int16 a14)
{
  int v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v18;
  _BOOL4 v19;
  unsigned __int8 *v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  int v25;
  __int16 v26;
  int v27;
  unsigned int v28;
  unsigned int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;

  if (!a4)
    goto LABEL_52;
  v14 = *a4 & 0xF0;
  if (v14 == 224)
  {
    v15 = *(_QWORD *)(result + 56);
    if (v15 > 0x656D616E6C69616CLL)
    {
      if (v15 > 0x6F6363616C69616CLL)
      {
        if (v15 == 0x6F6363616C69616DLL || v15 == 0x7075626D6C69616DLL)
          goto LABEL_30;
        v16 = 0x726464616C69616DLL;
      }
      else
      {
        if (v15 == 0x656D616E6C69616DLL || v15 == 0x6A6275736C69616DLL)
          goto LABEL_30;
        v16 = 0x6D6D75736C69616DLL;
      }
    }
    else
    {
      if (v15 <= 0x786F626C69616CLL)
      {
        if (v15)
        {
          if (v15 != 1752392040)
          {
            v16 = 0x68736168766564;
            goto LABEL_29;
          }
LABEL_30:
          LOBYTE(v20) = 8;
          goto LABEL_69;
        }
LABEL_68:
        LOBYTE(v20) = 3;
        goto LABEL_69;
      }
      if (v15 == 0x786F626C69616DLL || v15 == 0x35646D6E69616C70)
        goto LABEL_30;
      v16 = 0x617474616C69616DLL;
    }
LABEL_29:
    if (v15 != v16)
    {
      LOBYTE(v20) = 10;
      goto LABEL_69;
    }
    goto LABEL_30;
  }
  if ((*a4 & 1) == 0)
  {
    v18 = a12;
    goto LABEL_10;
  }
  v21 = *a4 & 7;
  if (((0xD8uLL >> v21) & 1) != 0)
    goto LABEL_68;
  v22 = privacy_flags2opt[v21];
  if (v22 > a3)
  {
LABEL_22:
    LOBYTE(v20) = 1;
    goto LABEL_69;
  }
  a11 = a13;
  v18 = a14;
  if (a2 - 1 >= 3)
  {
    if (a2)
      goto LABEL_10;
    if (a13)
    {
      v19 = 0;
      goto LABEL_35;
    }
    goto LABEL_22;
  }
  if (v14 != 128 && v22 > a2)
    goto LABEL_22;
LABEL_10:
  v19 = a11 == 0;
  if (!a11 && v18)
  {
LABEL_12:
    LOBYTE(v20) = 4;
LABEL_69:
    *a7 = 0;
    *a8 = 0;
    return v20;
  }
LABEL_35:
  *a10 = 0;
  v23 = *a4;
  if ((v23 & 0xFFFFFFF1) != 0)
  {
    if ((v23 & 0xFFFFFFE1) == 0 || a4[1] != 4)
      goto LABEL_68;
    v24 = *((unsigned __int16 *)a4 + 1);
    if (v24 > v18)
      goto LABEL_12;
    v25 = v18 - v24;
    v26 = *((_WORD *)a4 + 2);
    if (v25 < (v26 & 0x7FFF))
      goto LABEL_12;
    v27 = v26;
    if (v23 <= 0xF && v26 < 0)
    {
LABEL_52:
      LOBYTE(v20) = 2;
      goto LABEL_69;
    }
    v20 = (unsigned __int8 *)(a11 + v24);
    if (v19)
      v20 = 0;
    v28 = (v26 >> 15) & 1;
    *a10 = v26 < 0;
    v29 = *((_WORD *)a4 + 2) & 0x7FFF;
    if (!a5 && v27 < 0 && (*((_WORD *)a4 + 2) & 0x7FFF) == 0)
    {
      if (v25 < 0x8000)
      {
        v29 = 0;
      }
      else
      {
        v28 = 0;
        *a10 = 0;
        v29 = 0x8000;
      }
    }
    if (*a4 >= 0xF0u)
    {
      v31 = *(_QWORD *)(result + 56);
      if (v31 > 0x656D616E6C69616CLL)
      {
        if (v31 <= 0x6F6363616C69616CLL)
        {
          if (v31 == 0x656D616E6C69616DLL || v31 == 0x6A6275736C69616DLL)
            goto LABEL_93;
          v33 = 0x6D6D75736C69616DLL;
          goto LABEL_86;
        }
        if (v31 != 0x6F6363616C69616DLL)
        {
          if (v31 == 0x726464616C69616DLL)
          {
            *a7 = v20;
            *a8 = v29;
            LOBYTE(v20) = 7;
            return v20;
          }
          v32 = 0x7075626D6C69616DLL;
LABEL_91:
          if (v31 == v32)
            goto LABEL_92;
LABEL_105:
          LOBYTE(v20) = 9;
          goto LABEL_69;
        }
      }
      else
      {
        if (v31 <= 0x786F626C69616CLL)
        {
          if (!v31)
            goto LABEL_68;
          if (v31 != 1752392040)
          {
            v32 = 0x68736168766564;
            goto LABEL_91;
          }
LABEL_92:
          *a7 = v20;
          *a8 = v29;
          LOBYTE(v20) = 5;
          return v20;
        }
        if (v31 != 0x786F626C69616DLL)
        {
          if (v31 == 0x35646D6E69616C70)
            goto LABEL_92;
          v33 = 0x617474616C69616DLL;
LABEL_86:
          if (v31 != v33)
            goto LABEL_105;
        }
      }
LABEL_93:
      *a7 = v20;
      *a8 = v29;
      LOBYTE(v20) = 6;
      return v20;
    }
  }
  else
  {
    v20 = a4 + 2;
    v29 = a4[1];
    v28 = a4[1] == 0;
    *a10 = v28;
  }
  if (v28 && *a4 < 0x10u)
    goto LABEL_52;
  *a7 = v20;
  *a8 = v29;
  v30 = *a4;
  if ((v30 & 0xF0) != 0x10 && *a4 < 0x10u == (*(_WORD *)(result + 8) & 0x10) >> 4)
  {
    if ((*(_WORD *)(result + 8) & 0x10) == 0 || (a9.i32[0] = v29, vaddlv_u8((uint8x8_t)vcnt_s8(a9)) == 1))
    {
      switch(*(_BYTE *)(result + 10))
      {
        case 1:
        case 2:
          if (v29 > 4)
            break;
          goto LABEL_103;
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
          if (v29 >= 5)
            break;
          goto LABEL_103;
        case 9:
        case 0xA:
          if (v29 > a6)
            break;
          goto LABEL_103;
        case 0xB:
        case 0xC:
          if (v29 >= 9)
            break;
          goto LABEL_103;
        case 0xD:
          if (v29 != a6)
            break;
          goto LABEL_103;
        case 0xE:
        case 0xF:
          if (v29 != 8)
            break;
          goto LABEL_103;
        case 0x10:
          if ((v30 & 0xF0) != 0x20)
            break;
          goto LABEL_103;
        case 0x11:
          if ((v30 & 0xF0) != 0x50)
            break;
          goto LABEL_103;
        case 0x12:
          v34 = (v30 >> 4) - 2;
          if (v34 >= 7)
            break;
          return (0x30303000000uLL >> (8 * v34));
        case 0x13:
          if ((v30 & 0xF0) != 0x30)
            break;
LABEL_103:
          LOBYTE(v20) = 0;
          return v20;
        default:
          qword_1EE52EA58 = (uint64_t)"BUG IN LIBTRACE: Unexpected type";
          qword_1EE52EA88 = v30 & 0xFFFFFFF0;
          __break(1u);
          return result;
      }
    }
  }
  LOBYTE(v20) = 3;
  return v20;
}

uint64_t os_log_fmt_read_aster_if_necessary(uint64_t result, _WORD *a2, unsigned __int8 **a3)
{
  __int16 v3;
  unsigned __int8 *v4;
  _DWORD *v5;
  _DWORD *v6;
  unsigned int v7;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  int *v11;
  int *v12;
  unsigned int v13;
  int v15;

  v3 = *(_WORD *)(result + 8);
  if ((v3 & 2) == 0)
  {
LABEL_10:
    if ((v3 & 8) == 0)
      return result;
    goto LABEL_14;
  }
  if (!*a2)
  {
    v6 = (_DWORD *)(result + 20);
    goto LABEL_13;
  }
  v4 = *a3;
  --*a2;
  v5 = v4 + 2;
  *a3 = &v4[v4[1] + 2];
  v6 = (_DWORD *)(result + 20);
  if (v4[1] == 4)
  {
    v7 = *v4;
    if (v7 < 0x10 || (v7 & 0xF0) == 16)
    {
      *v6 = *v5;
      goto LABEL_10;
    }
  }
LABEL_13:
  *v6 = 0;
  if ((v3 & 8) == 0)
    return result;
LABEL_14:
  if ((v3 & 4) != 0 || (v3 & 0x10) == 0 && *(_BYTE *)(result + 10) != 18)
  {
    if (*a2)
    {
      v10 = *a3;
      --*a2;
      v11 = (int *)(v10 + 2);
      *a3 = &v10[v10[1] + 2];
      v12 = (int *)(result + 24);
      if (v10[1] == 4)
      {
        v13 = *v10;
        if (v13 < 0x10 || (v13 & 0xF0) == 16)
        {
          v15 = *v11;
LABEL_31:
          *v12 = v15;
          return result;
        }
      }
    }
    else
    {
      v12 = (int *)(result + 24);
    }
    v15 = -1;
    goto LABEL_31;
  }
  if (*a2)
  {
    v9 = *a3;
    if ((**a3 & 0xF0) == 0x10)
    {
      --*a2;
      *a3 = &v9[v9[1] + 2];
    }
  }
  *(_WORD *)(result + 8) = v3 & 0xFFF7;
  return result;
}

char *os_log_fmt_delimit(char *a1, uint64_t a2, uint64_t a3)
{
  char *result;
  uint64_t v5;
  uint64_t v6;
  const char *v9;
  unsigned int v10;
  char *v11;
  size_t v12;
  int v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  int v22;
  unsigned int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  char *v32;
  char v33;
  int v34;
  char *v35;
  char v36;
  int v37;
  int v38;
  char v39;
  char v40;
  char v41;
  __int16 v42;
  char *v43;

  v6 = *a1;
  result = a1 + 1;
  v5 = v6;
  if (v6 == 37)
  {
    *(_QWORD *)(a3 + 56) = 0;
    *(_OWORD *)(a3 + 40) = 0u;
    *(_OWORD *)(a3 + 24) = 0u;
    *(_OWORD *)(a3 + 8) = 0u;
    *(_QWORD *)a3 = a1;
    if (a1[1] != 123)
    {
      v10 = 0;
LABEL_50:
      v23 = 0;
      while (1)
      {
        while (1)
        {
          v25 = *result++;
          v24 = v25;
LABEL_52:
          if ((v24 - 49) >= 9)
            break;
          do
          {
            v26 = *result++;
            v24 = v26;
          }
          while ((v26 - 48) < 0xA);
          if (v24 != 36)
            goto LABEL_52;
          v10 |= 1u;
          *(_WORD *)(a3 + 8) = v10;
        }
        switch(v24)
        {
          case ' ':
          case '#':
          case '\'':
          case '+':
          case '-':
          case '0':
            continue;
          case '*':
            if ((v10 & 8) != 0)
            {
              v10 |= 1u;
              *(_WORD *)(a3 + 8) = v10;
            }
            v32 = result;
            do
            {
              v34 = *v32++;
              v33 = v34;
            }
            while ((v34 - 48) < 0xA);
            if (v33 == 36)
              v10 |= 1u;
            else
              v10 |= (v10 >> 1) & 1 | 2;
            if (v33 == 36)
              result = v32;
            *(_WORD *)(a3 + 8) = v10;
            continue;
          case '.':
            v27 = *result++;
            v24 = v27;
            if (v27 != 42)
            {
              *(_DWORD *)(a3 + 24) = 0;
              v28 = v24 - 48;
              if ((v24 - 48) <= 9)
              {
                v29 = 0;
                do
                {
                  v29 = v28 + 10 * v29;
                  *(_DWORD *)(a3 + 24) = v29;
                  v30 = *result++;
                  v24 = v30;
                  v28 = v30 - 48;
                }
                while ((v30 - 48) < 0xA);
              }
              v31 = (v10 >> 3) & 1 | v10;
              v10 = v31 | 8;
              *(_WORD *)(a3 + 8) = v31 | 8;
              goto LABEL_52;
            }
            v35 = result;
            do
            {
              v37 = *v35++;
              v36 = v37;
            }
            while ((v37 - 48) < 0xA);
            if (v36 == 36)
            {
              v10 |= 1u;
              *(_WORD *)(a3 + 8) = v10;
              result = v35;
            }
            else
            {
              v38 = v10 | ((v10 & 0xC) != 0);
              v10 = v38 | 0xC;
              *(_WORD *)(a3 + 8) = v38 | 0xC;
            }
            break;
          case '@':
            v40 = 18;
            goto LABEL_130;
          case 'A':
          case 'E':
          case 'F':
          case 'G':
          case 'a':
          case 'e':
          case 'f':
          case 'g':
            if ((v23 & 8) != 0)
              v39 = 15;
            else
              v39 = 14;
            goto LABEL_132;
          case 'C':
            LOBYTE(v23) = 16;
            goto LABEL_107;
          case 'D':
            LOWORD(v23) = v23 | 0x10;
            goto LABEL_111;
          case 'L':
            v23 |= 8u;
            continue;
          case 'O':
          case 'U':
            LOWORD(v23) = v23 | 0x10;
            goto LABEL_92;
          case 'P':
            if (a2 != 2)
              return 0;
            if ((v10 & 8) == 0)
              *(_WORD *)(a3 + 8) = v10 | 1;
            v40 = 19;
            goto LABEL_130;
          case 'S':
            LOBYTE(v23) = 16;
            goto LABEL_127;
          case 'X':
          case 'o':
          case 'u':
          case 'x':
LABEL_92:
            if ((v23 & 0x1000) != 0)
              goto LABEL_103;
            if ((v23 & 0xC00) != 0)
              goto LABEL_94;
            if ((v23 & 0x20) != 0)
            {
LABEL_103:
              v40 = 12;
            }
            else if ((v23 & 0x10) != 0)
            {
LABEL_94:
              v40 = 10;
            }
            else
            {
              if ((v23 & 0x2000) != 0)
                v41 = 2;
              else
                v41 = 6;
              if ((v23 & 0x40) != 0)
                v40 = 4;
              else
                v40 = v41;
            }
            *(_WORD *)(a3 + 8) = v10 | 0x30;
LABEL_130:
            *(_BYTE *)(a3 + 10) = v40;
            goto LABEL_134;
          case 'c':
LABEL_107:
            if ((v23 & 0x10) != 0)
              v39 = 7;
            else
              v39 = 5;
            goto LABEL_132;
          case 'd':
          case 'i':
LABEL_111:
            if ((v23 & 0x1000) != 0)
              goto LABEL_119;
            if ((v23 & 0x400) != 0 || (v23 & 0x800) != 0)
              goto LABEL_120;
            if ((v23 & 0x20) != 0)
            {
LABEL_119:
              v39 = 11;
            }
            else if ((v23 & 0x10) != 0)
            {
LABEL_120:
              v39 = 9;
            }
            else if ((v23 & 0x40) != 0)
            {
              v39 = 3;
            }
            else if ((v23 & 0x2000) != 0)
            {
              v39 = 1;
            }
            else
            {
              v39 = 5;
            }
LABEL_132:
            *(_BYTE *)(a3 + 10) = v39;
            v42 = v10 | 0x10;
LABEL_133:
            *(_WORD *)(a3 + 8) = v42;
LABEL_134:
            *(_WORD *)(a3 + 12) = (_WORD)result - (_WORD)a1;
            return (char *)(unsigned __int16)((_WORD)result - (_WORD)a1);
          case 'h':
            if ((v23 & 0x40) != 0)
              v23 = v23 & 0xFFFFDFBF | 0x2000;
            else
              v23 |= 0x40u;
            continue;
          case 'j':
            v23 |= 0x1000u;
            continue;
          case 'l':
            if ((v23 & 0x10) != 0)
              v23 = v23 & 0xFFFFFFCF | 0x20;
            else
              v23 |= 0x10u;
            continue;
          case 'm':
            v39 = 8;
            goto LABEL_132;
          case 'n':
            v42 = v10 | 1;
            goto LABEL_133;
          case 'p':
            *(_BYTE *)(a3 + 10) = 13;
            v42 = v10 | 0x30;
            goto LABEL_133;
          case 'q':
            v23 |= 0x20u;
            continue;
          case 's':
LABEL_127:
            if ((v23 & 0x10) != 0)
              v40 = 17;
            else
              v40 = 16;
            goto LABEL_130;
          case 't':
            v23 |= 0x800u;
            continue;
          case 'z':
            v23 |= 0x400u;
            continue;
          default:
            return 0;
        }
      }
    }
    if (a2 == 2)
    {
      result = strchr(result, 125);
      if (result)
      {
        v9 = a1 + 2;
        if (a1[2] == 125)
        {
          v10 = 0;
LABEL_49:
          ++result;
          goto LABEL_50;
        }
        v43 = result;
        v10 = 0;
        do
        {
          v11 = (char *)&v9[strspn(v9, ", ")];
          v12 = strcspn(v11, ",}");
          switch(v12)
          {
            case 0uLL:
              result = v43;
              goto LABEL_49;
            case 6uLL:
              if (*(_DWORD *)v11 != 1818391920 || *((_WORD *)v11 + 2) != 25449)
                goto LABEL_26;
              v10 |= 0x100u;
              goto LABEL_38;
            case 7uLL:
              if (*(_DWORD *)v11 != 1986622064 || *(_DWORD *)(v11 + 3) != 1702125942)
                goto LABEL_26;
              v10 |= 0x200u;
              goto LABEL_38;
            case 9uLL:
              if (*(_QWORD *)v11 != 0x76697469736E6573 || v11[8] != 101)
                goto LABEL_26;
              v10 |= 0x400u;
LABEL_38:
              *(_WORD *)(a3 + 8) = v10;
              break;
            default:
LABEL_26:
              if (!memchr(v11, 61, v12))
              {
                if (!strncmp(v11, "mask.", 5uLL))
                {
                  if (v12 - 6 <= 7)
                  {
                    v18 = 0;
                    v19 = 0;
                    v10 |= 0x800u;
                    *(_WORD *)(a3 + 8) = v10;
                    v20 = v11 + 5;
                    *(_QWORD *)(a3 + 48) = v11 + 5;
                    *(_WORD *)(a3 + 18) = v12 - 5;
                    do
                    {
                      v21 = *v20++;
                      v19 |= v21 << v18;
                      v18 += 8;
                    }
                    while (8 * (unsigned __int16)(v12 - 5) != v18);
                    *(_QWORD *)(a3 + 56) = v19;
                  }
                }
                else
                {
                  v16 = v10 | 0x40;
                  *(_WORD *)(a3 + 8) = v10 | 0x40;
                  if (!strncmp(v11, "builtin:", 8uLL))
                  {
                    v10 |= 0xC0u;
                    *(_WORD *)(a3 + 8) = v10;
                    *(_WORD *)(a3 + 14) = 7;
                    *(_QWORD *)(a3 + 32) = "builtin";
                    *(_QWORD *)(a3 + 40) = v11 + 8;
                    *(_WORD *)(a3 + 16) = v12 - 8;
                  }
                  else
                  {
                    v17 = (char *)memchr(v11, 58, v12);
                    if (v17)
                    {
                      if ((v10 & 0x80) != 0)
                      {
                        v16 ^= 0x80u;
                        *(_WORD *)(a3 + 8) = v16;
                      }
                      *(_WORD *)(a3 + 14) = (_WORD)v17 - (_WORD)v11;
                      *(_QWORD *)(a3 + 32) = v11;
                      *(_QWORD *)(a3 + 40) = v17 + 1;
                      *(_WORD *)(a3 + 16) = (_WORD)v11 + v12 - ((_WORD)v17 + 1);
                      v10 = v16;
                    }
                    else
                    {
                      v10 |= 0xC0u;
                      *(_WORD *)(a3 + 8) = v10;
                      *(_WORD *)(a3 + 14) = 7;
                      *(_QWORD *)(a3 + 32) = "builtin";
                      *(_QWORD *)(a3 + 40) = v11;
                      *(_WORD *)(a3 + 16) = v12;
                    }
                  }
                }
              }
              break;
          }
          v9 = &v11[v12];
        }
        while (*v9 != 125);
        if ((v10 & 0x400) != 0)
        {
          v22 = 64767;
          result = v43;
        }
        else
        {
          result = v43;
          if ((v10 & 0x200) == 0)
            goto LABEL_49;
          v22 = 65279;
        }
        v10 &= v22;
        *(_WORD *)(a3 + 8) = v10;
        goto LABEL_49;
      }
    }
    else
    {
      return 0;
    }
  }
  else
  {
    qword_1EE52EA58 = (uint64_t)"BUG IN LIBTRACE: Should start with '%'";
    qword_1EE52EA88 = v5;
    __break(1u);
  }
  return result;
}

unint64_t _os_log_fmt_compose_scalar(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, int a5)
{
  uint64_t scalar;
  __int16 v9;
  unsigned int v10;
  uint64_t v11;
  const char *v12;
  unint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  char *v25;
  int v26;
  uint64_t v27;
  unsigned int v28;
  unsigned int v29;
  uint64_t v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  scalar = os_log_fmt_read_scalar(a2, a4, a5);
  v9 = *(_WORD *)(a2 + 8);
  if ((v9 & 2) == 0)
  {
    v10 = 0;
    if ((v9 & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v31 = *(_DWORD *)(a2 + 20);
  v10 = 1;
  if ((v9 & 4) != 0)
LABEL_5:
    *(&v31 + v10++) = *(_DWORD *)(a2 + 24);
LABEL_6:
  MEMORY[0x1E0C80A78]();
  v12 = (char *)&v31 - v11;
  result = _os_log_fmt_compose_format_copy((_BYTE *)&v31 - v11, *(void **)a2, *(_WORD *)(a2 + 12));
  v20 = *(unsigned __int8 *)(a2 + 10);
  switch(*(_BYTE *)(a2 + 10))
  {
    case 0:
    case 0x10:
    case 0x11:
    case 0x12:
    case 0x13:
      qword_1EE52EA58 = (uint64_t)"BUG IN LIBTRACE: Unexpected type";
      qword_1EE52EA88 = v20;
      __break(1u);
      return result;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
      goto LABEL_7;
    case 8:
      v25 = strerror(scalar);
      result = strlen(v25);
      if ((*(_WORD *)(a1 + 20) & 2) == 0)
      {
        v26 = result;
        v27 = *(unsigned int *)(a1 + 8);
        if (result > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v27 - 1))
        {
          return os_trace_blob_add_slow(a1, v25, result);
        }
        else
        {
          result = (unint64_t)memcpy((void *)(*(_QWORD *)a1 + v27), v25, result);
          v28 = *(_DWORD *)(a1 + 8) + v26;
          *(_DWORD *)(a1 + 8) = v28;
          if (!*(_BYTE *)(a1 + 22))
            *(_BYTE *)(*(_QWORD *)a1 + v28) = 0;
        }
      }
      return result;
    case 9:
    case 0xA:
    case 0xD:
      if (a3 == 8 || (_DWORD)v20 == 13)
        goto LABEL_34;
      v21 = result;
      v22 = result;
      v23 = result - 1;
      v24 = v12[v23];
      if (a3 == 4)
      {
        if ((v24 & 0x80000000) != 0)
          result = __maskrune(v12[v23], 0x8000uLL);
        else
          result = *(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v24 + 60) & 0x8000;
        if ((_DWORD)result)
          result = __tolower(v24);
        else
          v12[v21 - 2] = v24;
        v12[v23] = result;
LABEL_7:
        if (v10 != 2)
        {
          if (v10 != 1)
          {
            if (v10)
              return result;
            return os_trace_blob_addf(a1, v12, v14, v15, v16, v17, v18, v19, scalar);
          }
LABEL_38:
          HIWORD(v30) = HIWORD(scalar);
          return os_trace_blob_addf(a1, v12, v14, v15, v16, v17, v18, v19, v31);
        }
      }
      else
      {
        if ((v24 & 0x80000000) != 0)
          result = __maskrune(v12[v23], 0x8000uLL);
        else
          result = *(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v24 + 60) & 0x8000;
        if ((_DWORD)result)
        {
          v12[v21] = 108;
          result = __tolower(v24);
          LOBYTE(v24) = result;
          v22 = v21 + 1;
          v29 = 2;
        }
        else
        {
          v12[v21 - 2] = 108;
          v29 = 1;
        }
        v12[v23] = 108;
        v12[v22] = v24;
        v12[v29 + (unint64_t)v21] = 0;
LABEL_34:
        if (v10 != 2)
        {
          if (v10 != 1)
          {
            if (v10)
              return result;
            return os_trace_blob_addf(a1, v12, v14, v15, v16, v17, v18, v19, scalar);
          }
          goto LABEL_38;
        }
      }
      return os_trace_blob_addf(a1, v12, v14, v15, v16, v17, v18, v19, v31);
    case 0xB:
    case 0xC:
    case 0xE:
    case 0xF:
      goto LABEL_34;
    default:
      return result;
  }
}

uint64_t os_log_fmt_read_scalar(uint64_t a1, unsigned __int8 *a2, int a3)
{
  int v3;
  uint64_t result;

  v3 = *(unsigned __int8 *)(a1 + 10);
  if (v3 == 15 || v3 == 14)
    return *(_QWORD *)a2;
  if ((*(_WORD *)(a1 + 8) & 0x20) != 0)
  {
    switch(a3)
    {
      case 1:
        result = *a2;
        break;
      case 2:
        result = *(unsigned __int16 *)a2;
        break;
      case 4:
        result = *(unsigned int *)a2;
        break;
      case 8:
        return *(_QWORD *)a2;
      default:
LABEL_14:
        result = _os_crash();
        __break(1u);
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 1:
        result = (char)*a2;
        break;
      case 2:
        result = *(__int16 *)a2;
        break;
      case 4:
        result = *(int *)a2;
        break;
      case 8:
        return *(_QWORD *)a2;
      default:
        goto LABEL_14;
    }
  }
  return result;
}

uint64_t os_trace_blob_addf(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (*(_BYTE *)(a1 + 22))
  {
    qword_1EE52EA58 = (uint64_t)"BUG IN LIBTRACE: Can't use addf() in binary blobs";
    __break(1u);
    return 0;
  }
  if ((*(_WORD *)(a1 + 20) & 2) != 0)
    return 0;
  v12 = *(_DWORD *)(a1 + 8);
  v11 = *(_DWORD *)(a1 + 12);
  *__error() = 0;
  v13 = vsnprintf((char *)(*(_QWORD *)a1 + *(unsigned int *)(a1 + 8)), (v11 - v12), a2, &a9);
  if ((v13 & 0x80000000) != 0)
  {
    v14 = 0;
    *(_BYTE *)(*(_QWORD *)a1 + *(unsigned int *)(a1 + 8)) = 0;
  }
  else
  {
    v14 = v13;
    v15 = (v11 + ~v12);
    if (v13 > v15)
    {
      if (*(_DWORD *)(a1 + 12) < *(_DWORD *)(a1 + 16))
      {
        v15 = os_trace_blob_grow(a1, v13);
        *__error() = 0;
        vsnprintf((char *)(*(_QWORD *)a1 + *(unsigned int *)(a1 + 8)), (v15 + 1), a2, &a9);
      }
      if (v14 > v15)
      {
        *(_WORD *)(a1 + 20) |= 2u;
        v14 = v15;
      }
    }
    *(_DWORD *)(a1 + 8) += v14;
  }
  return v14;
}

uint64_t _os_log_fmt_compose_format_copy(_BYTE *a1, void *__s, unsigned __int16 a3)
{
  unsigned __int16 v3;
  size_t v6;
  void *v7;

  v3 = a3;
  v6 = a3;
  v7 = memchr(__s, 125, a3);
  if (v7)
  {
    v3 += (_WORD)__s - (_WORD)v7;
    v6 = v3;
    memcpy(a1, v7, v3);
    *a1 = 37;
  }
  else
  {
    memcpy(a1, __s, v6);
  }
  a1[v6] = 0;
  return v3;
}

BOOL ctf_is_type(const char *a1, size_t a2)
{
  unint64_t v4;
  BOOL v5;

  v4 = 0;
  v5 = 1;
  do
  {
    if (strlen(BUILTIN_LIBRARY[v4]) == a2 && !strncmp(a1, BUILTIN_LIBRARY[v4], a2))
      break;
    v5 = v4++ < 3;
  }
  while (v4 != 4);
  return v5;
}

unint64_t _os_log_fmt_plugin_annotated(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, unsigned __int8 *a5, unsigned int a6, char a7)
{
  _QWORD *plugin;
  unint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  char *v21;
  unint64_t v22;
  unsigned int v23;
  unint64_t v24;
  unsigned int v25;
  uint64_t v27;
  _QWORD v28[257];

  v28[256] = *MEMORY[0x1E0C80C00];
  plugin = os_log_fmt_get_plugin(*(const char **)(a3 + 32), *(unsigned __int16 *)(a3 + 14));
  v15 = (unint64_t)plugin;
  if (plugin)
  {
    if (plugin[3] && (v16 = os_log_fmt_object_for_data(a3, *a4 >> 4, a5, a6, a2)) != 0)
    {
      v17 = v16;
      v27 = 1;
      BYTE4(v27) = a7;
      __strlcpy_chk();
      v18 = (void *)(*(uint64_t (**)(_QWORD *, void *, uint64_t *))(v15 + 24))(v28, v17, &v27);
      v19 = (void *)objc_msgSend(v18, "string");
      v15 = v19 != 0;
      if (v19)
      {
        v20 = objc_retainAutorelease(v19);
        v21 = (char *)objc_msgSend(v20, "_fastCStringContents:", 1);
        if (v21)
        {
          os_trace_blob_addns(a1, v21, 0xFFFFFFFFFFFFFFFFLL);
        }
        else
        {
          v22 = objc_msgSend(v20, "lengthOfBytesUsingEncoding:", 4);
          v28[0] = v22;
          v23 = *(_DWORD *)(a1 + 8);
          v24 = *(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v23 - 1;
          if (v22 > v24)
          {
            os_trace_blob_grow(a1, v22);
            v23 = *(_DWORD *)(a1 + 8);
            v24 = *(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v23 - 1;
            if (v22 > v24)
              *(_WORD *)(a1 + 20) |= 2u;
          }
          objc_msgSend(v20, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", *(_QWORD *)a1 + v23, v24, v28, 4, 1, 0, objc_msgSend(v20, "length"), 0);
          v25 = *(_DWORD *)(a1 + 8) + LODWORD(v28[0]);
          *(_DWORD *)(a1 + 8) = v25;
          if (!*(_BYTE *)(a1 + 22))
            *(_BYTE *)(*(_QWORD *)a1 + v25) = 0;
        }

      }
    }
    else
    {
      return 0;
    }
  }
  return v15;
}

#error "19EA2E0F0: call analysis failed (funcsize=18)"

id os_log_fmt_object_for_data(uint64_t a1, int a2, unsigned __int8 *a3, unsigned int a4, uint64_t a5)
{
  uint64_t scalar;
  id result;

  if (os_log_fmt_object_for_data_onceToken != -1)
    dispatch_once(&os_log_fmt_object_for_data_onceToken, &__block_literal_global_1656);
  if ((*(_WORD *)(a1 + 8) & 0x10) != 0)
    scalar = os_log_fmt_read_scalar(a1, a3, a4);
  else
    scalar = 0;
  switch(*(_BYTE *)(a1 + 10))
  {
    case 1:
      return (id)objc_msgSend(objc_alloc((Class)os_log_fmt_object_for_data__NSNumber), "initWithChar:", (char)scalar);
    case 2:
      return (id)objc_msgSend(objc_alloc((Class)os_log_fmt_object_for_data__NSNumber), "initWithUnsignedChar:", scalar);
    case 3:
      return (id)objc_msgSend(objc_alloc((Class)os_log_fmt_object_for_data__NSNumber), "initWithShort:", (__int16)scalar);
    case 4:
      return (id)objc_msgSend(objc_alloc((Class)os_log_fmt_object_for_data__NSNumber), "initWithUnsignedShort:", (unsigned __int16)scalar);
    case 5:
    case 7:
    case 8:
      goto LABEL_24;
    case 6:
      goto LABEL_15;
    case 9:
      if (a5 == 4)
      {
LABEL_24:
        result = (id)objc_msgSend(objc_alloc((Class)os_log_fmt_object_for_data__NSNumber), "initWithInt:", scalar);
      }
      else
      {
        if (a5 == 8)
          goto LABEL_23;
LABEL_25:
        result = (id)objc_msgSend(objc_alloc((Class)os_log_fmt_object_for_data__NSNumber), "initWithLongLong:", scalar);
      }
      break;
    case 0xA:
    case 0xD:
      if (a5 == 4)
      {
LABEL_15:
        result = (id)objc_msgSend(objc_alloc((Class)os_log_fmt_object_for_data__NSNumber), "initWithUnsignedInt:", scalar);
      }
      else if (a5 == 8)
      {
LABEL_23:
        result = (id)objc_msgSend(objc_alloc((Class)os_log_fmt_object_for_data__NSNumber), "initWithLong:", scalar);
      }
      else
      {
LABEL_11:
        result = (id)objc_msgSend(objc_alloc((Class)os_log_fmt_object_for_data__NSNumber), "initWithUnsignedLongLong:", scalar);
      }
      break;
    case 0xB:
      goto LABEL_25;
    case 0xC:
      goto LABEL_11;
    case 0xE:
    case 0xF:
      return (id)objc_msgSend(objc_alloc((Class)os_log_fmt_object_for_data__NSNumber), "initWithDouble:", *(double *)&scalar);
    case 0x10:
    case 0x11:
    case 0x12:
    case 0x13:
      if (a2 == 3)
        return (id)objc_msgSend(objc_alloc((Class)os_log_fmt_object_for_data__NSData), "initWithBytes:length:", a3, a4);
      if (a4)
        return (id)objc_msgSend(objc_alloc((Class)os_log_fmt_object_for_data__NSString), "initWithBytes:length:encoding:", a3, a4 - 1, 4);
      return objc_alloc_init((Class)os_log_fmt_object_for_data__NSString);
    default:
      return 0;
  }
  return result;
}

_QWORD *os_log_fmt_get_plugin(const char *a1, size_t a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  const char *v8;
  int v9;
  _QWORD *v10;

  if ((_dyld_dlsym_blocked() & 1) != 0)
    return 0;
  if (qword_1ED022660 != -1)
    dispatch_once_f(&qword_1ED022660, 0, (dispatch_function_t)_os_trace_formatters_list);
  v4 = qword_1ED022658;
  if (!qword_1ED022658)
    return 0;
  v5 = 0;
  v6 = _formatters;
  while (1)
  {
    v7 = (v4 + v5) >> 1;
    v8 = *(const char **)(v6 + 40 * v7 + 8);
    v9 = strncasecmp(a1, v8, a2);
    if (!v9)
      break;
LABEL_9:
    if (v9 < 0)
      v4 = (v4 + v5) >> 1;
    else
      v5 = v7 + 1;
    if (v5 >= v4)
      return 0;
  }
  if (v8[a2])
  {
    v9 = -v8[a2];
    goto LABEL_9;
  }
  v10 = (_QWORD *)(v6 + 40 * v7);
  if (*v10 != -1)
    dispatch_once_f((dispatch_once_t *)(v6 + 40 * v7), (void *)(v6 + 40 * v7), (dispatch_function_t)_os_trace_load_formatter);
  return v10;
}

unint64_t os_trace_blob_addns(uint64_t a1, char *__src, unint64_t a3)
{
  unint64_t v3;
  char *v4;
  int v6;
  int v7;
  unint64_t v8;
  int v9;
  size_t v10;
  uint64_t v11;
  size_t v12;
  size_t v13;
  size_t v14;
  uint64_t v15;
  unsigned int v16;
  size_t v17;
  char *v18;
  int v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  size_t v24;
  size_t v25;
  uint64_t v26;
  unsigned int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  char v32;
  __int16 *p_srca;
  uint64_t v34;
  size_t v35;
  int v37;
  int __srca;
  __int16 v39;
  char v40;

  if ((*(_WORD *)(a1 + 20) & 2) != 0)
    return 0;
  v3 = a3;
  v4 = __src;
  v6 = *(_DWORD *)(a1 + 8);
  if (!*(_BYTE *)(a1 + 22))
    ++v6;
  v7 = *(_DWORD *)(a1 + 16);
  if (v7)
  {
    v8 = (v7 - v6);
  }
  else
  {
    v9 = *(_DWORD *)(a1 + 12);
    LODWORD(v8) = v9 - v6;
    if (v9)
      v8 = v8;
    else
      v8 = 0;
  }
  if (v8 < a3)
    v3 = v8;
  if (*__src)
  {
    v10 = 0;
    v11 = MEMORY[0x1E0C80978];
    while (1)
    {
      v12 = 0;
      v13 = v3 - v10;
      if (v3 != v10)
      {
        while (v4[v12] >= 1 && (*(_DWORD *)(v11 + 4 * v4[v12] + 60) & 0x4200) != 0x200)
        {
          if (v13 == ++v12)
          {
            v12 = v3 - v10;
            break;
          }
        }
      }
      if (v12 >= v13)
        v14 = v3 - v10;
      else
        v14 = v12;
      if ((*(_WORD *)(a1 + 20) & 2) == 0)
      {
        v15 = *(unsigned int *)(a1 + 8);
        if (v14 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v15 - 1))
        {
          os_trace_blob_add_slow(a1, v4, v14);
        }
        else
        {
          memcpy((void *)(*(_QWORD *)a1 + v15), v4, v14);
          v16 = *(_DWORD *)(a1 + 8) + v14;
          *(_DWORD *)(a1 + 8) = v16;
          if (!*(_BYTE *)(a1 + 22))
            *(_BYTE *)(*(_QWORD *)a1 + v16) = 0;
        }
      }
      v17 = v14 + v10;
      if (v3 == v14 + v10)
        return v3;
      v18 = &v4[v14];
      v19 = *v18;
      if (!*v18)
        return v17;
      if ((v19 & 0x80) == 0)
        break;
      v24 = _os_trace_utf8_len(v18, v3 - (v14 + v10));
      if (v24 == -1)
      {
        v10 = v17 + 4;
        if (v17 + 4 > v3)
          return v17;
        v28 = v19 & 0x7F;
        if ((*(_DWORD *)(v11 + 4 * (v19 & 0x7F) + 60) & 0x200) == 0)
        {
          qmemcpy(&v37, "\\M-", 3);
          HIBYTE(v37) = v19 & 0x7F;
          if ((*(_BYTE *)(a1 + 20) & 2) == 0)
          {
            v29 = *(unsigned int *)(a1 + 8);
            if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v29 - 1) > 3)
            {
              v30 = *(_QWORD *)a1;
              v31 = v37;
              goto LABEL_53;
            }
            p_srca = (__int16 *)&v37;
LABEL_64:
            v34 = a1;
            v35 = 4;
LABEL_65:
            os_trace_blob_add_slow(v34, p_srca, v35);
          }
LABEL_56:
          v4 = v18 + 1;
          goto LABEL_57;
        }
        if (v28 == 127)
          v32 = 63;
        else
          v32 = v28 + 64;
        qmemcpy(&__srca, "\\M^", 3);
        HIBYTE(__srca) = v32;
        if ((*(_BYTE *)(a1 + 20) & 2) != 0)
          goto LABEL_56;
        v29 = *(unsigned int *)(a1 + 8);
        if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v29 - 1) <= 3)
        {
          p_srca = (__int16 *)&__srca;
          goto LABEL_64;
        }
        v30 = *(_QWORD *)a1;
        v31 = __srca;
LABEL_53:
        *(_DWORD *)(v30 + v29) = v31;
        v23 = *(_DWORD *)(a1 + 8) + 4;
LABEL_54:
        *(_DWORD *)(a1 + 8) = v23;
        if (!*(_BYTE *)(a1 + 22))
          *(_BYTE *)(*(_QWORD *)a1 + v23) = 0;
        goto LABEL_56;
      }
      v25 = v24;
      if (v24 == -2)
        return v17;
      if ((*(_WORD *)(a1 + 20) & 2) == 0)
      {
        v26 = *(unsigned int *)(a1 + 8);
        if (v24 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v26 - 1))
        {
          os_trace_blob_add_slow(a1, v18, v24);
        }
        else
        {
          memcpy((void *)(*(_QWORD *)a1 + v26), v18, v24);
          v27 = *(_DWORD *)(a1 + 8) + v25;
          *(_DWORD *)(a1 + 8) = v27;
          if (!*(_BYTE *)(a1 + 22))
            *(_BYTE *)(*(_QWORD *)a1 + v27) = 0;
        }
      }
      v10 = v25 + v17;
      if (v25 + v17 == v3)
        return v3;
      v4 = &v18[v25];
LABEL_57:
      v17 = v10;
      if (!*v4)
        return v17;
    }
    v10 = v17 + 3;
    if (v17 + 3 > v3)
      return v17;
    v20 = v19 + 64;
    if (v19 == 127)
      v20 = 63;
    v39 = 24156;
    v40 = v20;
    if ((*(_BYTE *)(a1 + 20) & 2) != 0)
      goto LABEL_56;
    v21 = *(unsigned int *)(a1 + 8);
    if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v21 - 1) <= 2)
    {
      p_srca = &v39;
      v34 = a1;
      v35 = 3;
      goto LABEL_65;
    }
    v22 = *(_QWORD *)a1 + v21;
    *(_WORD *)v22 = v39;
    *(_BYTE *)(v22 + 2) = v40;
    v23 = *(_DWORD *)(a1 + 8) + 3;
    goto LABEL_54;
  }
  return 0;
}

_DWORD *_os_log_fmt_compose_data(uint64_t a1, uint64_t a2, _BYTE *a3, const char *a4, unsigned int a5, int a6)
{
  uint64_t v12;
  char *v13;
  void **v14;
  _DWORD *result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;
  unint64_t v25;
  __int16 v26;
  uint64_t v27;
  unsigned int v28;
  char v29;
  uint64_t v30;
  unsigned int v31;
  char v32;
  uint64_t v33;
  unsigned int v34;
  __int16 v35;
  unsigned int v36;
  unsigned int v37;
  uint64_t v38;
  unsigned int v39;
  char *v40;
  uint64_t v41;
  unsigned int v42;
  uint64_t v43;
  int __src;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1E0C80A78]();
  v13 = (char *)&__src - v12;
  result = (_DWORD *)_os_log_fmt_compose_format_copy((_BYTE *)&__src - v12, *v14, *(_WORD *)(a2 + 12));
  if ((*a3 & 0xF0) == 0x30)
  {
    LOBYTE(__src) = 39;
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      v22 = *(unsigned int *)(a1 + 8);
      if (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - 1 == (_DWORD)v22)
      {
        result = (_DWORD *)os_trace_blob_add_slow(a1, &__src, 1uLL);
        if (a5)
        {
LABEL_7:
          v24 = 0;
          do
          {
            v25 = a4[v24];
            v26 = *(_WORD *)(a1 + 20);
            if (v24)
            {
              LOBYTE(__src) = 32;
              if ((v26 & 2) == 0)
              {
                v27 = *(unsigned int *)(a1 + 8);
                if (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - 1 == (_DWORD)v27)
                {
                  result = (_DWORD *)os_trace_blob_add_slow(a1, &__src, 1uLL);
                }
                else
                {
                  *(_BYTE *)(*(_QWORD *)a1 + v27) = 32;
                  v28 = *(_DWORD *)(a1 + 8) + 1;
                  *(_DWORD *)(a1 + 8) = v28;
                  if (!*(_BYTE *)(a1 + 22))
                    *(_BYTE *)(*(_QWORD *)a1 + v28) = 0;
                }
              }
              v26 = *(_WORD *)(a1 + 20);
            }
            v29 = a0123456789abcd_0[v25 >> 4];
            LOBYTE(__src) = v29;
            if ((v26 & 2) == 0)
            {
              v30 = *(unsigned int *)(a1 + 8);
              if (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - 1 == (_DWORD)v30)
              {
                result = (_DWORD *)os_trace_blob_add_slow(a1, &__src, 1uLL);
              }
              else
              {
                *(_BYTE *)(*(_QWORD *)a1 + v30) = v29;
                v31 = *(_DWORD *)(a1 + 8) + 1;
                *(_DWORD *)(a1 + 8) = v31;
                if (!*(_BYTE *)(a1 + 22))
                  *(_BYTE *)(*(_QWORD *)a1 + v31) = 0;
              }
            }
            v32 = a0123456789abcd_0[v25 & 0xF];
            LOBYTE(__src) = v32;
            if ((*(_WORD *)(a1 + 20) & 2) == 0)
            {
              v33 = *(unsigned int *)(a1 + 8);
              if (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - 1 == (_DWORD)v33)
              {
                result = (_DWORD *)os_trace_blob_add_slow(a1, &__src, 1uLL);
              }
              else
              {
                *(_BYTE *)(*(_QWORD *)a1 + v33) = v32;
                v34 = *(_DWORD *)(a1 + 8) + 1;
                *(_DWORD *)(a1 + 8) = v34;
                if (!*(_BYTE *)(a1 + 22))
                  *(_BYTE *)(*(_QWORD *)a1 + v34) = 0;
              }
            }
            ++v24;
          }
          while (a5 != v24);
        }
LABEL_54:
        if ((a6 & 1) != 0)
        {
          v40 = "…'";
          return (_DWORD *)os_trace_blob_addns(a1, v40, 0xFFFFFFFFFFFFFFFFLL);
        }
        LOBYTE(__src) = 39;
        if ((*(_WORD *)(a1 + 20) & 2) == 0)
        {
          v41 = *(unsigned int *)(a1 + 8);
          if (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - 1 == (_DWORD)v41)
          {
            return (_DWORD *)os_trace_blob_add_slow(a1, &__src, 1uLL);
          }
          else
          {
            *(_BYTE *)(*(_QWORD *)a1 + v41) = 39;
            v42 = *(_DWORD *)(a1 + 8) + 1;
            *(_DWORD *)(a1 + 8) = v42;
            if (!*(_BYTE *)(a1 + 22))
              *(_BYTE *)(*(_QWORD *)a1 + v42) = 0;
          }
        }
        return result;
      }
      *(_BYTE *)(*(_QWORD *)a1 + v22) = 39;
      v23 = *(_DWORD *)(a1 + 8) + 1;
      *(_DWORD *)(a1 + 8) = v23;
      if (!*(_BYTE *)(a1 + 22))
        *(_BYTE *)(*(_QWORD *)a1 + v23) = 0;
    }
    if (a5)
      goto LABEL_7;
    goto LABEL_54;
  }
  if (*(_BYTE *)(a2 + 10) == 18)
    v13[result - 1] = 115;
  v35 = *(_WORD *)(a2 + 8);
  if ((v35 & 2) != 0)
  {
    __src = *(_DWORD *)(a2 + 20);
    v36 = 1;
    if (a5)
      goto LABEL_31;
LABEL_34:
    if (a6)
      a4 = (const char *)&_CTF_NULLSTR;
    else
      a4 = "(null)";
    if ((v35 & 4) != 0)
    {
      v37 = v36 + 1;
      *(&__src + v36) = 0x7FFFFFFF;
    }
    else
    {
      v37 = v36;
    }
    goto LABEL_45;
  }
  v36 = 0;
  if (!a5)
    goto LABEL_34;
LABEL_31:
  if ((v35 & 8) == 0)
  {
    *(_DWORD *)&v13[result - 1] = 7547438;
    v37 = v36 + 1;
    *(&__src + v36) = a5;
    goto LABEL_45;
  }
  v37 = v36 + 1;
  v38 = v36;
  if ((v35 & 4) == 0)
  {
    result = strrchr(v13, 46);
    *result = 7547438;
LABEL_43:
    *(&__src + v38) = a5;
    goto LABEL_45;
  }
  v39 = *(_DWORD *)(a2 + 24);
  if (v39 > a5)
    goto LABEL_43;
  *(&__src + v38) = v39;
LABEL_45:
  switch(v37)
  {
    case 2u:
      result = (_DWORD *)os_trace_blob_addf(a1, v13, v16, v17, v18, v19, v20, v21, __src);
      break;
    case 1u:
      HIBYTE(v43) = HIBYTE(a4);
      result = (_DWORD *)os_trace_blob_addf(a1, v13, v16, v17, v18, v19, v20, v21, __src);
      break;
    case 0u:
      result = (_DWORD *)os_trace_blob_addf(a1, v13, v16, v17, v18, v19, v20, v21, (char)a4);
      break;
  }
  if (a6)
  {
    v40 = "<…>";
    return (_DWORD *)os_trace_blob_addns(a1, v40, 0xFFFFFFFFFFFFFFFFLL);
  }
  return result;
}

uint64_t ___os_trace_formatters_list_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return strcasecmp(*(const char **)(a2 + 8), *(const char **)(a3 + 8));
}

void sub_19EA30574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___oie_advance_cursor_open_store_block_invoke(_QWORD *a1, int *a2, uint64_t a3, uint64_t a4)
{
  int v5;
  void *v7;
  _OSLogEnumeratorCatalog *v8;
  uint64_t v9;
  void *v10;

  v5 = *a2;
  if (*a2 <= 24587)
  {
    if (v5 == 4096)
    {
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a2;
    }
    else if (v5 == 24587)
    {
      if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24))
      {
        v8 = -[_OSLogEnumeratorCatalog initWithStore:index:fileHeader:range:chunk:]([_OSLogEnumeratorCatalog alloc], "initWithStore:index:fileHeader:range:chunk:", a1[4], *(_QWORD *)(a1[5] + 128), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24), a3, a4, a2);
        v9 = *(_QWORD *)(a1[7] + 8);
        v10 = *(void **)(v9 + 40);
        *(_QWORD *)(v9 + 40) = v8;

        if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
          objc_msgSend(*(id *)(a1[5] + 24), "addObject:");
      }
    }
  }
  else if ((v5 - 24588) < 2 || v5 == 24592)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24))
    {
      v7 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
      if (v7)
        objc_msgSend(v7, "unionWithRange:", a3, a4);
    }
  }
  return 1;
}

void _catalog_lite_read_limits(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *i;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[2];
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t *);
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];
  void (*v16)(_QWORD *);
  void *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;

  v3 = *(unsigned __int16 *)(a1 + 22);
  v4 = *(_QWORD *)(a1 + 8) + a1 + 16;
  if (*(_DWORD *)(a1 + 4) == 17)
  {
    v5 = *(unsigned __int16 *)(a1 + 24);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v16 = (void (*)(_QWORD *))___catalog_lite_read_limits_block_invoke;
    v17 = &__block_descriptor_56_e12_v24__0_8__16l;
    v18 = a2;
    v19 = a3;
    v20 = v4;
    v21 = a1 + v3 + 40;
    for (i = v15; v5; --v5)
    {
      if (v4 < v21 || v4 - v21 < 0x18)
        break;
      v21 += 24;
      v16(i);
    }
  }
  else
  {
    v8 = a1 + v3;
    v9 = *(unsigned __int16 *)(v8 + 24);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v11 = ___catalog_lite_read_limits_block_invoke_2;
    v12 = &__block_descriptor_48_e12_v24__0_8__16l;
    v13 = a2;
    v14 = a3;
    v21 = v8 + 32;
    for (i = v10; v9; --v9)
    {
      if (v4 < v21)
        break;
      if (v4 - v21 < 0x20)
        break;
      v21 += 32;
      ((void (*)(_QWORD *))v11)(i);
    }
  }

}

_QWORD *___catalog_lite_read_limits_block_invoke(_QWORD *result, uint64_t a2, unint64_t *a3)
{
  _QWORD *v3;
  unint64_t v4;
  unint64_t *v5;
  unsigned int *v6;
  unint64_t v7;
  unint64_t v8;

  v3 = (_QWORD *)result[4];
  if (*(_QWORD *)a2 < *v3)
    *v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = (unint64_t *)result[5];
  if (v4 > *v5)
    *v5 = v4;
  v6 = (unsigned int *)(a2 + 2 * *(unsigned int *)(a2 + 24) + 28);
  v7 = result[6];
  if ((unint64_t)v6 <= v7)
  {
    v8 = (unint64_t)v6 + 2 * *v6 + 4;
    if (v8 <= v7)
    {
      v7 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v8 & 7) == 0)
        v7 = v8;
    }
  }
  *a3 = v7;
  return result;
}

uint64_t ___oie_advance_cursor_open_catalog_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = a2;
  objc_msgSend(v3, "addObject:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", v4);

  return 1;
}

uint64_t __enumerateAndDecompressSubchunk_block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = enumerateAndDecompressSubchunk(*(_QWORD *)(a1 + 32), a2, objc_msgSend(*(id *)(a1 + 40), "data"), *(_QWORD *)(a1 + 48));
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
}

uint64_t enumerateAndDecompressSubchunk(void *a1, _DWORD *a2, uint64_t a3, void *a4)
{
  _QWORD *v7;
  id v8;
  void *v9;
  uint64_t v10;
  unsigned int v11;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  _QWORD *v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD v20[2];
  uint64_t (*v21)(uint64_t, uint64_t);
  void *v22;
  _QWORD *v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v7 = a1;
  v8 = a4;
  v9 = v8;
  v10 = 1;
  v11 = *a2 - 24577;
  if (v11 <= 0xF)
  {
    if (((1 << v11) & 0x880F) != 0)
    {
      v10 = (*((uint64_t (**)(id, _DWORD *, uint64_t))v8 + 2))(v8, a2, a3);
    }
    else if (*a2 == 24589)
    {
      objc_msgSend(v7, "_decompressedBufferForChunk:subchunk:", a2, v7[2]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      v28 = &v27;
      v29 = 0x2020000000;
      v30 = 1;
      v14 = objc_msgSend(v13, "data");
      v15 = objc_msgSend(v13, "size");
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v21 = __enumerateAndDecompressSubchunk_block_invoke;
      v22 = &unk_1E4156D18;
      v26 = &v27;
      v23 = v7;
      v16 = v13;
      v24 = v16;
      v25 = v9;
      v17 = v20;
      v18 = 0;
      do
      {
        if (v15 - v18 < 0x10)
          break;
        v19 = *(_QWORD *)(v14 + v18 + 8);
        if (v15 - v18 - 16 < v19)
          break;
        if (!((unsigned int (*)(_QWORD *))v21)(v17))
          break;
        v18 = (v18 + v19 + 23) & 0xFFFFFFFFFFFFFFF8;
      }
      while (v18 - 1 < v15);

      v10 = *((_BYTE *)v28 + 24) != 0;
      _Block_object_dispose(&v27, 8);

    }
  }

  return v10;
}

void sub_19EA31158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___oie_advance_cursor_open_subchunk_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _OSLogEnumeratorOversizeChunk *v8;
  unint64_t v10;

  switch(*(_DWORD *)a2)
  {
    case 0x6001:
    case 0x600C:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "insertTracepoints:chunkOffset:chunkSetStartAddr:subchunk:options:", a2, a3, a4, *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));
      break;
    case 0x6002:
      goto LABEL_4;
    case 0x6003:
      v10 = 0;
      if (_oie_validate_subchunk_ttl(*(void **)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a2 + 28), &v10)&& *(_QWORD *)(a2 + 32) >= v10)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "insertStatedumpChunk:chunkOffset:chunkSetStartAddr:subchunk:", a2, a3, a4, *(_QWORD *)(a1 + 40));
      }
      break;
    case 0x6004:
      v10 = 0;
      if (_oie_validate_subchunk_ttl(*(void **)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a2 + 28), &v10)&& *(_QWORD *)(a2 + 32) >= v10)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "insertSimpleChunk:chunkOffset:chunkSetStartAddr:subchunk:options:", a2, a3, a4, *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));
      }
      break;
    case 0x6005:
    case 0x6006:
    case 0x6007:
    case 0x6008:
    case 0x6009:
    case 0x600A:
    case 0x600B:
      return 1;
    default:
      if (*(_DWORD *)a2 == 24592)
      {
LABEL_4:
        v8 = -[_OSLogEnumeratorOversizeChunk initWithSubchunk:chunk:]([_OSLogEnumeratorOversizeChunk alloc], "initWithSubchunk:chunk:", *(_QWORD *)(a1 + 40), a2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "addObject:", v8);

      }
      break;
  }
  return 1;
}

uint8_t *_tracev3_chunk_decompress(uint64_t a1, uint64_t a2, compression_algorithm *a3, size_t *a4)
{
  compression_algorithm v7;
  size_t v8;
  unsigned int v9;
  BOOL v10;
  uint8_t *v11;
  size_t v12;
  size_t v13;

  v7 = COMPRESSION_LZ4;
  v8 = 0x10000;
  if (a2)
  {
    v9 = *(_DWORD *)(a2 + 32);
    v10 = v9 == 0;
    if (v9)
      v8 = v9;
    else
      v8 = 0x10000;
    if (v9)
      v7 = *(_DWORD *)(a2 + 36);
    else
      v7 = COMPRESSION_LZ4;
    if (!v7)
    {
      v11 = (uint8_t *)(a1 + 16);
      v12 = *(_QWORD *)(a1 + 8);
      if (!a3)
        goto LABEL_20;
LABEL_19:
      *a3 = v7;
      goto LABEL_20;
    }
  }
  else
  {
    v10 = 1;
  }
  v11 = (uint8_t *)_os_trace_malloc();
  v13 = compression_decode_buffer(v11, v8, (const uint8_t *)(a1 + 16), *(_QWORD *)(a1 + 8), 0, v7);
  v12 = v13;
  if (!v13)
  {
    free(v11);
    v11 = 0;
LABEL_18:
    if (!a3)
      goto LABEL_20;
    goto LABEL_19;
  }
  if (v10)
    goto LABEL_18;
  if (v13 == v8)
  {
    v12 = v8;
    if (a3)
      goto LABEL_19;
  }
  else
  {
    _os_assumes_log();
    if (a3)
      goto LABEL_19;
  }
LABEL_20:
  if (a4)
    *a4 = v12;
  return v11;
}

unsigned __int8 *_uuidpath_pathcache_add(uint64_t a1, const unsigned __int8 *a2, unint64_t a3)
{
  uint64_t v4;
  unint64_t v5;
  unsigned int *v6;
  unsigned int v7;
  BOOL v8;
  size_t v9;
  const void *v10;
  size_t v11;
  size_t v12;
  unsigned __int8 *v13;
  rb_tree_t *v14;
  unsigned __int8 *inserted;

  if (a3 >= 0x10 && (*(_BYTE *)(a1 + 8) & 1) != 0)
  {
    v4 = *(unsigned int *)(a1 + 12);
    v5 = 8 * v4 + 16;
    if (v5 < a3)
    {
      if ((_DWORD)v4)
      {
        v6 = (unsigned int *)(a1 + 20);
        while (1)
        {
          v7 = *v6;
          v6 += 2;
          v8 = __CFADD__(v5, v7);
          v5 += v7;
          if (v8)
            break;
          if (!--v4)
            goto LABEL_8;
        }
      }
      else
      {
LABEL_8:
        v9 = a3 - v5;
        if (a3 > v5)
        {
          v10 = (const void *)(a1 + v5);
          v11 = strnlen((const char *)(a1 + v5), a3 - v5);
          if (v11 < v9)
          {
            v12 = v11;
            goto LABEL_12;
          }
        }
      }
    }
  }
  v12 = 0;
  v10 = &_CTF_NULLSTR;
LABEL_12:
  v13 = (unsigned __int8 *)_os_trace_malloc();
  uuid_copy(v13 + 24, a2);
  memcpy(v13 + 40, v10, v12 + 1);
  v14 = _uuidpath_pathcache();
  inserted = (unsigned __int8 *)rb_tree_insert_node(v14, v13);
  if (v13 != inserted)
    free(v13);
  return inserted;
}

void _resolve_uuid_slow(uint64_t a1)
{
  const void *v1;
  _QWORD *v3;
  uint64_t v4;
  int v5;
  const char **v6;
  const char **v7;
  uint64_t v8;
  __n128 *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v1 = *(const void **)(a1 + 40);
  if (!v1)
    return;
  v3 = (_QWORD *)(a1 + 112);
  if (!*(_QWORD *)(a1 + 112))
    return;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 328) + 1112);
  if (v4)
  {
    if (!*(_QWORD *)(a1 + 160))
      return;
  }
  uuidpath_lookup_fd(*(_DWORD *)(a1 + 352), v1, (_QWORD *)(a1 + 48));
  if (*(_QWORD *)(a1 + 8) == 2560 || (*(_BYTE *)(a1 + 168) & 2) != 0)
  {
    if (uuidpath_lookup_fd(*(_DWORD *)(a1 + 352), *(const void **)(a1 + 112), (_QWORD *)(a1 + 120))
      || (*(_BYTE *)(a1 + 168) & 2) == 0)
    {
      goto LABEL_19;
    }
    v8 = *(unsigned int *)(a1 + 352);
    v9 = *(__n128 **)(a1 + 104);
    v10 = *(_QWORD *)(a1 + 152);
    v13 = 0;
    uuidpath_sharedcache_resolve_fd(v8, v9, 0, v10, 0, 0, 0, 0, a1 + 120, &v13, 0);
LABEL_18:
    *(_QWORD *)(a1 + 152) -= v13;
    goto LABEL_19;
  }
  if (v4)
  {
    v13 = 0;
    v5 = *(__int16 *)(v4 + 2);
    v6 = (const char **)(a1 + 288);
    if (v5 >= 0)
      v6 = 0;
    if (*(_BYTE *)v4 == 6)
      v7 = v6;
    else
      v7 = 0;
    if ((v5 & 6 | 8) != 0xC)
    {
      uuidpath_resolve_fd(*(_DWORD *)(a1 + 352), *(const void **)(a1 + 112), *(_QWORD *)(a1 + 160), *(_QWORD *)(a1 + 280), (const char **)(a1 + 176), v7, (_QWORD *)(a1 + 120), 0);
      goto LABEL_19;
    }
    uuidpath_sharedcache_resolve_fd(*(unsigned int *)(a1 + 352), *(__n128 **)(a1 + 112), *(_QWORD *)(a1 + 160), *(_QWORD *)(a1 + 152), *(_QWORD *)(a1 + 280), (const char **)(a1 + 176), v7, v3, a1 + 120, &v13, 0);
    goto LABEL_18;
  }
LABEL_19:
  v11 = *(void **)(a1 + 384);
  if (v11)
  {

    *(_QWORD *)(a1 + 384) = 0;
  }
  v12 = *(void **)(a1 + 392);
  if (v12)
  {

    *(_QWORD *)(a1 + 392) = 0;
  }
  if (*(_QWORD *)(a1 + 48))
    *(_QWORD *)(a1 + 384) = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
  if (*(_QWORD *)(a1 + 120))
    *(_QWORD *)(a1 + 392) = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
  *(_QWORD *)(a1 + 336) |= 2uLL;
}

BOOL uuidpath_lookup_fd(int a1, const void *a2, _QWORD *a3)
{
  rb_tree_t *v6;
  char *node;
  char *v8;
  char *v9;
  char *v10;
  size_t v12;

  v6 = _uuidpath_pathcache();
  node = (char *)rb_tree_find_node(v6, a2);
  if (!node)
  {
    v12 = 0;
    v8 = _uuidpath_headercache_lookup((const unsigned __int8 *)a2, &v12);
    if (v8)
    {
LABEL_8:
      node = (char *)_uuidpath_pathcache_add((uint64_t)v8, (const unsigned __int8 *)a2, v12);
      goto LABEL_9;
    }
    if (a1 == -3)
      v9 = (char *)uuidpath_map_header(0, (uint64_t)a2, &v12);
    else
      v9 = (char *)uuidpath_map_header_fd(a1, (uint64_t)a2, &v12);
    v8 = v9;
    if (v9)
    {
      _uuidpath_headercache_add((const unsigned __int8 *)a2, (uint64_t)v9, v12);
      goto LABEL_8;
    }
    node = 0;
  }
LABEL_9:
  v10 = node + 40;
  if (!node)
    v10 = 0;
  *a3 = v10;
  return node != 0;
}

rb_tree_t *_uuidpath_pathcache()
{
  rb_tree_t *v0;

  if (_uuidpath_pathcache_onceToken != -1)
    dispatch_once(&_uuidpath_pathcache_onceToken, &__block_literal_global_20);
  v0 = (rb_tree_t *)pthread_getspecific(_uuidpath_pathcache_key);
  if (!v0)
  {
    v0 = (rb_tree_t *)malloc_type_calloc(1uLL, 0x40uLL, 0x80040A284212CuLL);
    rb_tree_init(v0, (const rb_tree_ops_t *)&_uuidpath_pathcache_ops);
    pthread_setspecific(_uuidpath_pathcache_key, v0);
  }
  return v0;
}

uint64_t uuidpath_sharedcache_resolve_fd(uint64_t a1, __n128 *a2, unint64_t a3, unint64_t a4, unint64_t a5, const char **a6, const char **a7, _QWORD *a8, unint64_t a9, _QWORD *a10, const char **a11)
{
  int v17;
  __objc2_class *dsc_map_impl;
  uint64_t v19;
  const char *v20;
  uint64_t result;
  const char *v22;
  void *v23;
  _BYTE *v24;
  _BYTE *v25;
  void *v26;
  size_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  _QWORD *v31;
  unint64_t v32;
  _BYTE *v33;
  size_t v35[2];

  v17 = a1;
  v35[1] = *MEMORY[0x1E0C80C00];
  dsc_map_impl = _os_trace_uuiddb_get_dsc_map_impl(a1, 0, a2, 1);
  if (dsc_map_impl)
  {
    v19 = (uint64_t)dsc_map_impl;
    if (!a6 || (v20 = _os_trace_uuiddb_dsc_map_resolve_string((uint64_t)dsc_map_impl, a3), (*a6 = v20) != 0))
    {
      if (a7)
        *a7 = _os_trace_uuiddb_dsc_map_resolve_string(v19, a5);
      if (!a8 && !a9 && !a10 || (_os_trace_uuiddb_dsc_map_resolve_entry(v19, a4, a8, (_QWORD *)a9, a10) & 1) != 0)
        return 1;
      if (a11)
      {
        result = 0;
        v22 = "<Invalid shared cache code pointer offset>";
        goto LABEL_20;
      }
      return 0;
    }
    if (a11)
    {
      result = 0;
      v22 = "<Invalid shared cache format string offset>";
      goto LABEL_20;
    }
    return 0;
  }
  if (headercache_once == -1)
  {
    if (!a2)
      goto LABEL_14;
  }
  else
  {
    dispatch_once(&headercache_once, &__block_literal_global_881);
    if (!a2)
    {
LABEL_14:
      if (a11)
      {
        result = 0;
        v22 = "<Invalid shared cache is NULL>";
LABEL_20:
        *a11 = v22;
        return result;
      }
      return 0;
    }
  }
  if (uuid_is_null((const unsigned __int8 *)a2))
    goto LABEL_14;
  v23 = pthread_getspecific(headercache_key);
  if (!v23)
  {
    v23 = malloc_type_calloc(1uLL, 0xC8uLL, 0x1020040FD027848uLL);
    pthread_setspecific(headercache_key, v23);
  }
  if (uuid_compare((const unsigned __int8 *)v23 + 24, (const unsigned __int8 *)a2))
  {
    v35[0] = 0;
    v24 = uuidpath_map_header_fd(v17, (uint64_t)a2, v35);
    if (!v24)
    {
      if (a11)
        *a11 = "<Invalid - Unable to find matching cache information>";
      return 0;
    }
    v25 = v24;
    if ((v24[8] & 2) == 0)
    {
      if (a11)
        *a11 = "<Invalid - Not shared cache information>";
      munmap(v24, v35[0]);
      return 0;
    }
    v26 = (void *)*((_QWORD *)v23 + 1);
    if (v26)
      munmap(v26, *((_QWORD *)v23 + 2));
    v27 = v35[0];
    *((_QWORD *)v23 + 1) = v25;
    *((_QWORD *)v23 + 2) = v27;
    uuid_copy((unsigned __int8 *)v23 + 24, (const unsigned __int8 *)a2);
  }
  else
  {
    v25 = (_BYTE *)*((_QWORD *)v23 + 1);
    if (!v25)
    {
      if (a11)
      {
        result = 0;
        v22 = "<Invalid - Unable to find matching cache information>";
        goto LABEL_20;
      }
      return 0;
    }
  }
  v28 = *((unsigned int *)v25 + 3);
  if (!(_DWORD)v28)
  {
LABEL_42:
    if (a11)
    {
      result = 0;
      v22 = "<Invalid shared cache offset>";
      goto LABEL_20;
    }
    return 0;
  }
  v29 = 0;
  v30 = a3 & 0x7FFFFFFFFFFFFFFFLL;
  v31 = v25 + 48;
  while (1)
  {
    v32 = *(v31 - 1) - *((_QWORD *)v25 + 2);
    if (v30 >= v32 && v30 <= *v31 + v32)
      break;
    ++v29;
    v31 += 4;
    if (v28 == v29)
      goto LABEL_42;
  }
  v33 = &v25[32 * v29 + 24];
  if (a8)
    *a8 = v33;
  if (!((unint64_t)a6 | a9))
    return 1;
  return uuidpath_resolve_fd(v17, v33, (v30 - v32) | a3 & 0x8000000000000000, 0, a6, 0, (_QWORD *)a9, a11);
}

const char *_os_trace_uuiddb_dsc_map_resolve_string(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  unint64_t v9;

  if ((a2 & 0x8000000000000000) != 0)
    return "%s";
  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(unsigned int *)(v2 + 8);
  if (!(_DWORD)v3)
    return 0;
  v4 = 0;
  v5 = *(_QWORD *)(a1 + 16);
  while (1)
  {
    v6 = (v3 + v4) >> 1;
    v7 = *(_QWORD *)(v5 + 24 * v6);
    v8 = a2 >= v7;
    v9 = a2 - v7;
    if (!v8)
      goto LABEL_8;
    if (v9 < *(unsigned int *)(v5 + 24 * v6 + 12))
      return (const char *)(v2 + *(unsigned int *)(v5 + 24 * v6 + 8) + v9);
    v4 = v6 + 1;
    v6 = v3;
LABEL_8:
    v3 = v6;
    if (v4 >= v6)
      return 0;
  }
}

uint64_t _os_trace_uuiddb_dsc_map_resolve_entry(uint64_t a1, unint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v11;
  BOOL v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;

  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_DWORD *)(v5 + 12);
  if (!v6)
    return 0;
  v7 = 0;
  v8 = *(_QWORD *)(a1 + 24);
  v9 = *(_DWORD *)(v5 + 12);
  do
  {
    v10 = (v9 + v7) >> 1;
    v11 = *(_QWORD *)(v8 + 32 * v10);
    v12 = a2 >= v11;
    v13 = a2 - v11;
    if (v12)
    {
      if (v13 < *(unsigned int *)(v8 + 32 * v10 + 8))
        goto LABEL_10;
      v7 = v10 + 1;
    }
    else
    {
      v9 = (v9 + v7) >> 1;
    }
  }
  while (v7 < v9);
  v14 = 0;
  if (*(_DWORD *)(v8 + 8))
    return v14;
  LODWORD(v10) = 0;
LABEL_10:
  if (v10 >= v6)
    return 0;
  v15 = (_QWORD *)(v8 + 32 * v10);
  if (a3)
    *a3 = (char *)v15 + 12;
  if (a4)
    *a4 = *(_QWORD *)(a1 + 8) + *(unsigned int *)(v8 + 32 * v10 + 28);
  if (a5)
    *a5 = *v15;
  return 1;
}

__objc2_class *_os_trace_uuiddb_get_dsc_map_impl(uint64_t a1, char *a2, __n128 *a3, int a4)
{
  __objc2_class **v7;
  __objc2_class *v8;
  __objc2_class *v9;
  __objc2_class *v10;
  dispatch_once_t *v11;
  __objc2_class *superclass;
  __objc2_class *v13;
  __objc2_class *v14;
  __objc2_class *v15;
  dispatch_once_t *v16;
  __objc2_class *v17;
  char *v18;
  __objc2_class **v19;
  int v20;
  unint64_t v21;
  int v22;
  __objc2_class *result;
  dispatch_once_t *v24;
  __objc2_class *v25;
  char *v26;
  int v27;

  v7 = 0;
  v8 = &OBJC_METACLASS____OSLogTracepointBuffer;
  v9 = &OBJC_METACLASS____OSLogTracepointBuffer;
  v10 = &OBJC_METACLASS____OSLogTracepointBuffer;
  v11 = &_os_trace_shared_paths_init_once;
  while (1)
  {
    superclass = v8[42].superclass;
    if (superclass)
    {
      v13 = v8[42].superclass;
      while (v13->info != (__objc2_class_ro *)a3->n128_u64[0] || v13[1].isa != (__objc2_class *)a3->n128_u64[1])
      {
        v13 = v13->isa;
        if (!v13)
          goto LABEL_7;
      }
      if (v7)
        _os_trace_uuiddb_dsc_map_destroy((uint64_t)v7);
      return v13;
    }
LABEL_7:
    if (!a4)
      return 0;
    if (!v7)
      break;
LABEL_19:
    *v7 = superclass;
    while (1)
    {
      v21 = __ldxr((unint64_t *)&_os_trace_uuiddb_get_dsc_map_impl__dsc_map_head);
      if ((__objc2_class *)v21 != superclass)
        break;
      if (!__stlxr((unint64_t)v7, (unint64_t *)&_os_trace_uuiddb_get_dsc_map_impl__dsc_map_head))
        return (__objc2_class *)v7;
    }
    __clrex();
  }
  v27 = a4;
  if ((_DWORD)a1 == -1)
  {
    if (!a2)
    {
      if (v9[39].info != (__objc2_class_ro *)-1)
      {
        v24 = v11;
        v25 = v9;
        dispatch_once(v11, &__block_literal_global_55);
        v11 = v24;
        v9 = v25;
      }
      a2 = (char *)v10[40].superclass;
    }
    v14 = v8;
    v15 = v10;
    v16 = v11;
    v17 = v9;
    v18 = a2;
    a1 = open(a2, 0, v26);
    if ((_DWORD)a1 == -1)
    {
      __error();
      _os_assumes_log();
      return 0;
    }
  }
  else
  {
    v14 = v8;
    v15 = v10;
    v16 = v11;
    v17 = v9;
    v18 = a2;
  }
  _os_trace_uuiddb_dsc_map_create(a1, a3);
  v7 = v19;
  a2 = v18;
  if (!v18 || (v26 = v18, v20 = close(a1), a2 = v18, v20 != -1))
  {
LABEL_18:
    v9 = v17;
    v11 = v16;
    v10 = v15;
    v8 = v14;
    a4 = v27;
    if (!v7)
      return (__objc2_class *)v7;
    goto LABEL_19;
  }
  v22 = *__error();
  result = (__objc2_class *)*__error();
  if (v22 != 9)
  {
    _os_assumes_log();
    a2 = v26;
    goto LABEL_18;
  }
  qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EE52EA88 = (uint64_t)result;
  __break(1u);
  return result;
}

void *uuidpath_map_header_fd(int a1, uint64_t a2, _QWORD *a3)
{
  void *result;
  char __str[1024];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (a3)
    *a3 = 0;
  if (a2)
  {
    _os_trace_uuiddb_get_pathsuffix(a2, 1, __str, 0x400uLL);
    result = (void *)_os_trace_mmap_at();
    if (!result)
      return result;
    munmap(result, 0);
  }
  return 0;
}

uint64_t _os_trace_uuiddb_get_pathsuffix(uint64_t result, int a2, char *__str, size_t __size)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;

  v6 = result;
  if (a2 <= 16)
  {
    if ((a2 - 1) < 2)
    {
      v7 = 1;
LABEL_5:
      result = snprintf(__str, __size, "%02X");
      goto LABEL_10;
    }
    if (a2 == 3)
    {
      v7 = 0;
      goto LABEL_9;
    }
LABEL_17:
    qword_1EE52EA58 = (uint64_t)"BUG IN LIBTRACE: Invalid type";
    qword_1EE52EA88 = a2;
    __break(1u);
    return result;
  }
  v7 = -1;
  if ((a2 - 17) < 2)
    goto LABEL_5;
  if (a2 != 19)
    goto LABEL_17;
LABEL_9:
  result = snprintf(__str, __size, "dsc");
LABEL_10:
  if (v7 == -1)
    return result;
  v8 = (int)result + 1;
  if (v8 + 2 * (16 - v7) >= __size)
  {
    qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: Path buffer is too small";
    qword_1EE52EA88 = __size;
    __break(1u);
    goto LABEL_17;
  }
  __str[(int)result] = 47;
  v9 = &__str[v8];
  do
  {
    *v9 = a0123456789abcd_0[(unint64_t)*(unsigned __int8 *)(v6 + v7) >> 4];
    v9[1] = a0123456789abcd_0[*(_BYTE *)(v6 + v7) & 0xF];
    v9 += 2;
    ++v7;
  }
  while (v7 != 16);
  *v9 = 0;
  return result;
}

char *_uuidpath_headercache_lookup(const unsigned __int8 *a1, _QWORD *a2)
{
  char *result;
  char *v5;
  uint64_t v6;
  const unsigned __int8 *i;
  char *v8;

  if (headercache_once != -1)
    dispatch_once(&headercache_once, &__block_literal_global_22);
  result = (char *)pthread_getspecific(headercache_key);
  if (result)
  {
    v5 = result;
    v6 = 0;
    for (i = (const unsigned __int8 *)(result + 56); uuid_compare(i, a1); i += 32)
    {
      if (++v6 == 5)
        return 0;
    }
    v8 = &v5[32 * v6];
    result = (char *)*((_QWORD *)v8 + 5);
    *a2 = *((_QWORD *)v8 + 6);
  }
  return result;
}

void _uuidpath_headercache_add(const unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  int *v8;
  void *v9;
  int *v10;
  int v11;

  if (a1 && !uuid_is_null(a1))
  {
    if (headercache_once != -1)
      dispatch_once(&headercache_once, &__block_literal_global_24);
    v6 = (int *)pthread_getspecific(headercache_key);
    if (!v6)
    {
      v6 = (int *)malloc_type_calloc(1uLL, 0xC8uLL, 0x1020040FD027848uLL);
      pthread_setspecific(headercache_key, v6);
    }
    v7 = *v6;
    v8 = &v6[8 * v7];
    v9 = (void *)*((_QWORD *)v8 + 5);
    if (v9)
    {
      munmap(v9, *((_QWORD *)v8 + 6));
      v7 = *v6;
    }
    v10 = &v6[8 * v7];
    *((_QWORD *)v10 + 5) = a2;
    *((_QWORD *)v10 + 6) = a3;
    uuid_copy((unsigned __int8 *)v10 + 56, a1);
    if (*v6 == 4)
      v11 = 0;
    else
      v11 = *v6 + 1;
    *v6 = v11;
  }
}

void _os_trace_uuiddb_dsc_map_create(uint64_t a1, __n128 *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  char __b[1024];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  memset(__b, 170, sizeof(__b));
  _os_trace_uuiddb_get_pathsuffix((uint64_t)a2, 3, __b, 0x400uLL);
  v3 = _os_trace_mmap_at();
  if (v3)
  {
    v4 = (void *)v3;
    _os_trace_uuiddb_dsc_validate_hdr(v3, 0xAAAAAAAAuLL, a2);
    if (!v5 && munmap(v4, 0xAAAAAAAAAAAAAAAALL) == -1)
    {
      __error();
      _os_assumes_log();
    }
  }
}

__n128 _os_trace_uuiddb_dsc_validate_hdr(uint64_t a1, unint64_t a2, __n128 *a3)
{
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  BOOL v12;
  unint64_t v13;
  BOOL v14;
  unsigned int *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  int v22;
  uint64_t v23;
  unint64_t v24;
  BOOL v25;
  _DWORD *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unsigned int *v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _DWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int *v43;
  unsigned int v44;
  uint64_t v45;
  __n128 result;

  if (a2 - 0x80000000 < 0xFFFFFFFF80000010 || *(_DWORD *)a1 != 1685283688)
    return result;
  v5 = a2;
  v6 = *(unsigned __int16 *)(a1 + 4);
  if (v6 != 2)
  {
    if (v6 != 1)
      return result;
    v7 = *(unsigned int *)(a1 + 8);
    v8 = (16 * v7) & 0xFFFFFFF0;
    if (16 * v7 != v8 || v8 == 4294967280)
      return result;
    v10 = 16 * v7 + 16;
    v11 = *(unsigned int *)(a1 + 12);
    v12 = __CFADD__(v10, 28 * v11);
    v13 = (v10 + 28 * v11);
    v14 = v12;
    if (v11 > 0x9249249 || v14)
      return result;
    if (v13 <= a2)
    {
      if ((_DWORD)v7)
      {
        v15 = (unsigned int *)(a1 + 28);
        v16 = *(unsigned int *)(a1 + 8);
        while (1)
        {
          v17 = *(v15 - 1);
          v12 = a2 >= v17;
          v18 = a2 - v17;
          if (!v12 || v18 < *v15 || *(v15 - 3) >= v11)
            return result;
          v15 += 4;
          if (!--v16)
            goto LABEL_44;
        }
      }
      if ((_DWORD)v11)
      {
LABEL_44:
        v30 = (unsigned int *)(a1 + 16 * v7 + 40);
        do
        {
          v31 = *v30;
          v30 += 7;
          if (v31 >= a2)
            return result;
        }
        while (--v11);
      }
      if (*(_BYTE *)(a2 + a1 - 1))
        return result;
      v32 = _os_trace_calloc();
      v33 = v32;
      v34 = *(unsigned int *)(a1 + 8);
      if ((_DWORD)v34)
      {
        v35 = (_DWORD *)(v32 + 16);
        v36 = (_QWORD *)(a1 + 24);
        do
        {
          *((_QWORD *)v35 - 2) = *((unsigned int *)v36 - 1);
          *((_QWORD *)v35 - 1) = *v36;
          *v35 = *((_DWORD *)v36 - 2);
          v35 += 6;
          v36 += 2;
          --v34;
        }
        while (v34);
      }
      v37 = _os_trace_calloc();
      v38 = v37;
      if (*(_DWORD *)(a1 + 12))
      {
        v39 = 0;
        v40 = a1 + 16 * v7 + 20;
        v41 = v37;
        do
        {
          *(_QWORD *)v41 = *(unsigned int *)(v40 - 4);
          *(_DWORD *)(v41 + 8) = *(_DWORD *)v40;
          *(_OWORD *)(v41 + 12) = *(_OWORD *)(v40 + 4);
          *(_DWORD *)(v41 + 28) = *(_DWORD *)(v40 + 20);
          ++v39;
          v41 += 32;
          v40 += 28;
        }
        while (v39 < *(unsigned int *)(a1 + 12));
      }
      v42 = _os_trace_calloc();
      *(_QWORD *)(v42 + 8) = a1;
      *(_QWORD *)(v42 + 16) = v33;
      *(_QWORD *)(v42 + 24) = v38;
LABEL_61:
      result = *a3;
      *(__n128 *)(v42 + 32) = *a3;
      *(_DWORD *)(v42 + 48) = v5;
      return result;
    }
LABEL_62:
    _os_assumes_log();
    return result;
  }
  v19 = *(unsigned int *)(a1 + 8);
  v20 = (24 * v19) & 0xFFFFFFF8;
  if (24 * v19 != v20 || v20 > 0xFFFFFFEF)
    return result;
  v22 = 24 * v19 + 16;
  v23 = *(unsigned int *)(a1 + 12);
  v12 = __CFADD__(v22, 32 * v23);
  v24 = (v22 + 32 * v23);
  v25 = v12;
  if (v23 >> 27 || v25)
    return result;
  if (v24 > a2)
    goto LABEL_62;
  if ((_DWORD)v19)
  {
    v26 = (_DWORD *)(a1 + 32);
    v27 = *(unsigned int *)(a1 + 8);
    while (1)
    {
      v28 = *(v26 - 2);
      v12 = a2 >= v28;
      v29 = a2 - v28;
      if (!v12 || v29 < *(v26 - 1) || *v26 >= v23)
        break;
      v26 += 6;
      if (!--v27)
        goto LABEL_56;
    }
  }
  else
  {
    if (!(_DWORD)v23)
    {
LABEL_59:
      if (*(_BYTE *)(a2 + a1 - 1))
        return result;
      v45 = a1 + 16 + 24 * v19;
      v42 = _os_trace_calloc();
      *(_QWORD *)(v42 + 8) = a1;
      *(_QWORD *)(v42 + 16) = a1 + 16;
      *(_QWORD *)(v42 + 24) = v45;
      goto LABEL_61;
    }
LABEL_56:
    v43 = (unsigned int *)(a1 + 24 * v19 + 44);
    while (1)
    {
      v44 = *v43;
      v43 += 8;
      if (v44 >= a2)
        break;
      if (!--v23)
        goto LABEL_59;
    }
  }
  return result;
}

uint64_t uuidpath_resolve_fd(int a1, const void *a2, unint64_t a3, unint64_t a4, const char **a5, const char **a6, _QWORD *a7, _QWORD *a8)
{
  rb_tree_t *v16;
  char *node;
  char *v18;
  char *v19;
  unsigned __int8 *v20;
  uint64_t result;
  uint64_t v22;
  uint64_t v23;
  int v24;
  BOOL v25;
  uint64_t v26;
  int64_t v27;
  char *v28;
  unsigned int *v29;
  int v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  const char *v36;
  uint64_t v37;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char out[40];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v51 = 0;
  if (a2)
  {
    if (!a5)
    {
      if (a7)
      {
        v16 = _uuidpath_pathcache();
        node = (char *)rb_tree_find_node(v16, a2);
        if (node)
        {
          *a7 = node + 40;
          return 1;
        }
      }
    }
    v18 = _uuidpath_headercache_lookup((const unsigned __int8 *)a2, &v51);
    if (v18)
      goto LABEL_9;
    v19 = (char *)uuidpath_map_header_fd(a1, (uint64_t)a2, &v51);
    if (v19)
    {
      v18 = v19;
      _uuidpath_headercache_add((const unsigned __int8 *)a2, (uint64_t)v19, v51);
LABEL_9:
      v20 = _uuidpath_pathcache_add((uint64_t)v18, (const unsigned __int8 *)a2, v51);
      if (a7 && v20)
      {
        *a7 = v20 + 40;
        if (!a5)
          return 1;
      }
      else if (!a5)
      {
        return 1;
      }
      if ((a3 & 0x8000000000000000) != 0)
      {
        *a5 = "%s";
        return 1;
      }
      v22 = *((unsigned int *)v18 + 3);
      if (!(_DWORD)v22)
        goto LABEL_58;
      v23 = 0;
      LOBYTE(v24) = 0;
      v25 = a6 == 0;
      v26 = (uint64_t)&v18[8 * v22 + 16];
      v27 = v51;
      while (1)
      {
        v28 = &v18[8 * v23];
        v30 = *((_DWORD *)v28 + 5);
        v29 = (unsigned int *)(v28 + 20);
        v31 = *(v29 - 1);
        v32 = (v30 + v31);
        if ((v24 & 1) == 0)
        {
          v33 = a3 - v31;
          if (a3 < v31 || v32 <= a3)
          {
            v24 = 0;
            if (v25)
              goto LABEL_47;
            goto LABEL_34;
          }
          if (v33 > v27 || v33 < 0)
            v36 = "<format string calculation error>";
          else
            v36 = (const char *)(v26 + v33);
          *a5 = v36;
        }
        v24 = 1;
        if (v25)
          goto LABEL_47;
LABEL_34:
        v37 = a4 - v31;
        if (a4 >= v31 && v32 > a4)
        {
          if (v37 > v27 || v37 < 0)
            v40 = "<signpost name calculation error>";
          else
            v40 = (const char *)(v26 + v37);
          *a6 = v40;
LABEL_47:
          if ((v24 & 1) != 0)
            return 1;
          if (++v23 >= (unint64_t)*((unsigned int *)v18 + 3))
            goto LABEL_58;
          v25 = 1;
          goto LABEL_50;
        }
        if (++v23 >= (unint64_t)*((unsigned int *)v18 + 3))
        {
          if (v24)
          {
            if (!a8)
              return 0;
LABEL_60:
            memset(out, 0, 37);
            uuid_unparse_upper((const unsigned __int8 *)a2, out);
            _uuidpath_error_message(a3, a8, "Invalid bounds %d for %s", v46, v47, v48, v49, v50, a4);
            return 0;
          }
LABEL_58:
          if (!a8)
            return 0;
          LOBYTE(a4) = a3;
          goto LABEL_60;
        }
        v25 = 0;
LABEL_50:
        v26 += *v29;
      }
    }
    if (a8)
    {
      memset(out, 0, 37);
      uuid_unparse_upper((const unsigned __int8 *)a2, out);
      _uuidpath_error_message(a3, a8, "Invalid image <%s>", v41, v42, v43, v44, v45, (char)out);
    }
    return 0;
  }
  else
  {
    if (!a8)
      return 0;
    result = 0;
    *a8 = "Invalid image UUID (NULL)";
  }
  return result;
}

void sub_19EA340C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  uint64_t v44;

  _Block_object_dispose((const void *)(v44 - 224), 8);
  _Block_object_dispose((const void *)(v44 - 176), 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a44, 8);
  _Unwind_Resume(a1);
}

unint64_t _oie_get_next_major_time(void *a1, char a2, _QWORD *a3)
{
  id *v5;
  id *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v5 = a1;
  v6 = v5;
  if ((a2 & 8) != 0)
    v7 = 0;
  else
    v7 = -1;
  objc_msgSend(v5[1], "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 8) != 0)
    {
      if (objc_msgSend(v8, "endTime") < v7)
        goto LABEL_11;
      v10 = objc_msgSend(v9, "endTime");
    }
    else
    {
      if (objc_msgSend(v8, "oldestTime") > v7)
        goto LABEL_11;
      v10 = objc_msgSend(v9, "oldestTime");
    }
    v7 = v10;
  }
LABEL_11:
  objc_msgSend(v6[3], "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
    goto LABEL_18;
  if ((a2 & 8) != 0)
  {
    if (objc_msgSend(v11, "endTime") < v7)
      goto LABEL_18;
    v13 = objc_msgSend(v12, "endTime");
  }
  else
  {
    if (objc_msgSend(v11, "oldestTime") > v7)
      goto LABEL_18;
    v13 = objc_msgSend(v12, "oldestTime");
  }
  v7 = v13;
LABEL_18:
  objc_msgSend(v6[4], "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
    goto LABEL_29;
  if ((a2 & 8) != 0)
  {
    if (objc_msgSend(v14, "endTime") < v7)
      goto LABEL_29;
  }
  else if (objc_msgSend(v14, "oldestTime") > v7)
  {
    goto LABEL_29;
  }
  v16 = (_QWORD *)objc_msgSend(v15, "bootUUID");
  if (*v16 == *a3 && v16[1] == a3[1])
  {
    if ((a2 & 8) != 0)
      v17 = objc_msgSend(v15, "endTime");
    else
      v17 = objc_msgSend(v15, "oldestTime");
    v7 = v17;
  }
LABEL_29:
  objc_msgSend(v6[2], "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    if ((a2 & 8) != 0)
    {
      v25 = objc_msgSend(v18, "oldestTime");
      v26 = v25 - 1;
      if (v25 - 1 <= v7)
        v26 = v7;
      if (v25)
        v7 = v26;
    }
    else
    {
      v20 = objc_msgSend(v18, "endTime");
      v21 = v20 + 1;
      v22 = v20 == -1;
      v23 = v22 << 63 >> 63;
      v24 = v23 ^ v22;
      if (v7 < v20 + 1)
        v21 = v7;
      if (v23 < 0)
        v21 = v7;
      if (!v24)
        v7 = v21;
    }
  }
  objc_msgSend(v6[5], "firstObject");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    if ((a2 & 8) != 0)
    {
      v34 = objc_msgSend(v27, "oldestTime");
      v35 = v34 - 1;
      if (v34 - 1 <= v7)
        v35 = v7;
      if (v34)
        v7 = v35;
    }
    else
    {
      v29 = objc_msgSend(v27, "endTime");
      v30 = v29 + 1;
      v31 = v29 == -1;
      v32 = v31 << 63 >> 63;
      v33 = v32 ^ v31;
      if (v7 < v29 + 1)
        v30 = v7;
      if (v32 < 0)
        v30 = v7;
      if (!v33)
        v7 = v30;
    }
  }

  return v7;
}

void _oltb_consolidate(void *a1)
{
  _BYTE *v1;
  _QWORD *v2;
  uint64_t i;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v1 = a1;
  if (v1[40])
  {
    v7 = v1;

    v2 = v7;
    for (i = v7[2]; i; i = v7[2])
    {
      v4 = i - 1;
      v5 = v2[1];
      v6 = v7[3] - 1;
      v7[2] = v4;
      v7[3] = v6;
      memcpy((void *)(v5 + 1120 * v4), (const void *)(v5 + 1120 * v6), 0x460uLL);
      v2 = v7;
    }

  }
  else
  {
    qword_1EE52EA58 = (uint64_t)"BUG IN LIBTRACE: oltb maniplation while immutable";
    __break(1u);
  }
}

unint64_t _timesync_continuous_to_wall_time(uint64_t a1, _QWORD *a2, unint64_t a3, _QWORD *a4)
{
  unint64_t v8;
  uint64_t v9;

  if (*a2 != *(_QWORD *)(a1 + 64) || a2[1] != *(_QWORD *)(a1 + 72))
    goto LABEL_8;
  v8 = *(_QWORD *)(a1 + 112);
  v9 = *(_QWORD *)(a1 + 48);
  if (v9 && *(_WORD *)v9 == 29524)
  {
    if (v8 > a3 || *(_QWORD *)(v9 + 8) <= a3)
    {
LABEL_7:
      if (v8 <= a3)
        return _timesync_advance_and_calculate(a1, a3, a4);
LABEL_8:
      _timesync_reset(a1);
      while (*a2 != *(_QWORD *)(a1 + 64) || a2[1] != *(_QWORD *)(a1 + 72))
      {
        if (_timesync_advance_boot((_QWORD *)a1))
          return -1;
      }
      return _timesync_advance_and_calculate(a1, a3, a4);
    }
  }
  else if (v8 > a3)
  {
    goto LABEL_7;
  }
  if (a4)
  {
    *a4 = *(_QWORD *)(a1 + 128);
    v8 = *(_QWORD *)(a1 + 112);
  }
  return (a3 - v8) * *(unsigned int *)(a1 + 80) / *(unsigned int *)(a1 + 84) + *(_QWORD *)(a1 + 120);
}

uint64_t _parse_log_message(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  __int16 v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unsigned __int16 v28;
  __int16 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD **)(a1 + 328);
  v28 = 0;
  v5 = *(_WORD *)(a2 + 2);
  if ((v5 & 1) != 0)
  {
    if (!(*(_QWORD *)(a2 + 16) >> 51))
      return 0;
    LODWORD(v6) = 8;
    v28 = 8;
    v7 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 56) = v7;
    *(_QWORD *)(a1 + 64) = _os_activity_map_find_parent(*(_QWORD **)(a1 + 320), v7);
    v5 = *(_WORD *)(a2 + 2);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 0x100) == 0)
        goto LABEL_13;
      goto LABEL_9;
    }
  }
  else
  {
    LODWORD(v6) = 0;
    if ((v5 & 0x10) == 0)
      goto LABEL_3;
  }
  v6 = (v6 + 8);
  if (*(unsigned __int16 *)(a2 + 22) < v6)
    return 0;
  v28 = v6;
  if ((v5 & 0x100) != 0)
  {
LABEL_9:
    if ((unint64_t)v6 + 4 > *(unsigned __int16 *)(a2 + 22))
      return 0;
    v28 = v6 + 4;
    v8 = a2 + v6;
    v9 = *(unsigned __int16 *)(v8 + 24);
    v10 = *(unsigned __int16 *)(v8 + 26);
    if ((v10 + v9) <= 0x1000)
    {
      v11 = v4[137];
      if (4096 - v11 <= v9)
      {
        *(_QWORD *)(a1 + 232) = v11 + v4[136] + v9 - 4096;
        *(_QWORD *)(a1 + 240) = v10;
        *(_QWORD *)(a1 + 184) += v10;
      }
    }
  }
LABEL_13:
  result = _parse_location((_QWORD *)a1, a2, &v28);
  if (!(_DWORD)result)
    return result;
  LOWORD(v13) = v28;
  if ((*(_WORD *)(a2 + 2) & 0x200) != 0)
  {
    LOWORD(v13) = v28 + 2;
    if ((unint64_t)v28 + 2 > *(unsigned __int16 *)(a2 + 22))
      return 0;
    v14 = v4[138];
    v29 = *(_WORD *)(a2 + v28 + 24);
    v15 = hashtable_lookup(*(_QWORD *)(v14 + 64), (uint64_t)&v29);
    if (v15)
    {
      *(_QWORD *)(a1 + 248) = *(_QWORD *)(v15 + 8);
      *(_QWORD *)(a1 + 256) = *(_QWORD *)(v15 + 16);
    }
  }
  if ((*(_WORD *)(a2 + 2) & 0x400) != 0)
  {
    if (*(unsigned __int16 *)(a2 + 22) <= (unint64_t)(unsigned __int16)v13)
      return 0;
    v16 = (unsigned __int16)v13;
    LOWORD(v13) = v13 + 1;
    *(_BYTE *)(a1 + 268) = *(_BYTE *)(a2 + v16 + 24);
  }
  if (*(_BYTE *)a2 == 6)
  {
    v17 = (unsigned __int16)v13;
    v13 = (unsigned __int16)v13 + 8;
    if (v13 > *(unsigned __int16 *)(a2 + 22))
      return 0;
    v18 = a2 + 24;
    v19 = *(_QWORD *)(a2 + 24 + v17);
    *(_BYTE *)(a1 + 271) = *(_BYTE *)(a2 + 1) & 0x3F;
    *(_BYTE *)(a1 + 270) = *(_BYTE *)(a2 + 1) & 0xC0;
    *(_QWORD *)(a1 + 272) = v19;
    *(_QWORD *)(a1 + 8) = 1536;
    if (*(__int16 *)(a2 + 2) < 0)
    {
      v20 = (unsigned __int16)v13;
      v13 = (unsigned __int16)v13 + 4;
      v21 = *(_QWORD *)(a2 + 16);
      if (v13 > HIWORD(v21))
        return 0;
      v22 = *(_DWORD *)(v18 + v20);
      if ((*(_WORD *)(a2 + 2) & 0x20) != 0)
      {
        v24 = HIWORD(v21);
        v25 = (unsigned __int16)v13;
        v13 = (unsigned __int16)v13 + 2;
        if (v13 > v24)
          return 0;
        v23 = (unint64_t)*(unsigned __int16 *)(v18 + v25) << 31;
      }
      else
      {
        v23 = 0;
      }
      v26 = v23 | v22 & 0x7FFFFFFF;
      if (v22 < 0)
        v26 |= 0x8000000000000000;
      *(_QWORD *)(a1 + 280) = v26;
    }
  }
  if ((*(_WORD *)(a2 + 2) & 0x800) == 0)
    goto LABEL_35;
  v27 = (unsigned __int16)v13;
  v13 = (unsigned __int16)v13 + 4;
  if (v13 > *(unsigned __int16 *)(a2 + 22))
    return 0;
  *(_DWORD *)(a1 + 264) = *(_DWORD *)(a2 + v27 + 24);
LABEL_35:
  *(_QWORD *)(a1 + 192) = a2 + (unsigned __int16)v13 + 24;
  *(_QWORD *)(a1 + 200) = *(unsigned __int16 *)(a2 + 22) - (unint64_t)(unsigned __int16)v13;
  result = 1;
  if ((*(_WORD *)(a2 + 2) & 0x1000) != 0)
    *(_BYTE *)(a1 + 296) = 1;
  return result;
}

uint64_t _parse_location(_QWORD *a1, uint64_t a2, _WORD *a3)
{
  uint64_t v4;
  int v5;
  unsigned int v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned int *v10;
  unsigned int *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v22;

  v4 = *(_QWORD *)(a1[41] + 1104);
  v5 = *(_DWORD *)(a2 + 4);
  if ((*(_WORD *)(v4 + 2) & 1) != 0)
    v6 = 4;
  else
    v6 = 6;
  switch(*(_WORD *)(a2 + 2) & 0xE)
  {
    case 2:
    case 4:
    case 6:
      v6 = 4;
      break;
    case 8:
      break;
    case 0xA:
      v6 = 20;
      break;
    case 0xC:
      v6 = 6;
      break;
    default:
      v6 = 0;
      break;
  }
  v7 = (unsigned __int16)*a3;
  v8 = v7 + v6;
  v9 = *(_QWORD *)(a2 + 16);
  if (v8 > HIWORD(v9))
  {
    v17 = 0;
    v22 = HIWORD(v9);
LABEL_36:
    *a3 = v22;
    return v17;
  }
  *a3 = v8;
  if (!v6)
    return 0;
  v10 = (unsigned int *)(a2 + 24 + v7);
  if (v6 == 6)
  {
    v11 = 0;
    v12 = (unint64_t)*((unsigned __int16 *)v10 + 2) << 32;
  }
  else
  {
    v12 = 0;
    if (v6 == 4)
      v11 = 0;
    else
      v11 = v10 + 1;
  }
  v13 = *v10;
  if ((*(_WORD *)(a2 + 2) & 0x20) == 0)
  {
    v14 = 0;
    goto LABEL_20;
  }
  v15 = *(_QWORD *)(a2 + 16);
  if ((unint64_t)(unsigned __int16)v8 + 2 > HIWORD(v15))
  {
    v17 = 0;
    v22 = HIWORD(v15);
    goto LABEL_36;
  }
  *a3 = v8 + 2;
  v14 = (unint64_t)*(unsigned __int16 *)(a2 + 24 + (unsigned __int16)v8) << 31;
LABEL_20:
  v16 = v14 | v5 & 0x7FFFFFFF;
  if (v5 >= 0)
    v17 = v16;
  else
    v17 = v16 | 0x8000000000000000;
  a1[20] = v17;
  if (v17)
  {
    a1[42] |= 1uLL;
    v17 = 1;
    v18 = v12 | v13;
    switch(*(_WORD *)(a2 + 2) & 0xE)
    {
      case 2:
        a1[19] = v18;
        v11 = (unsigned int *)(v4 + 24);
        goto LABEL_31;
      case 4:
      case 0xC:
        a1[19] = v18;
        v11 = (unsigned int *)(v4 + 40);
        a1[14] = v4 + 40;
        v19 = 13;
        goto LABEL_32;
      case 8:
        v20 = (_QWORD *)_catalog_procinfo_lookup_pc(v4, v12 | v13);
        if (!v20)
          return 0;
        v11 = (unsigned int *)(v20 + 2);
        a1[19] = v18 - *v20;
        goto LABEL_31;
      case 0xA:
        a1[19] = v18;
LABEL_31:
        v19 = 14;
LABEL_32:
        a1[v19] = v11;
        v17 = v11 != 0;
        break;
      default:
        return v17;
    }
  }
  return v17;
}

_QWORD *_os_activity_map_find_parent(_QWORD *result, unint64_t a2)
{
  int8x8_t v2;
  uint8x8_t v3;
  unint64_t v4;
  _QWORD *v5;
  _QWORD *i;
  unint64_t v7;

  if (result)
  {
    v2 = (int8x8_t)result[1];
    if (v2)
    {
      v3 = (uint8x8_t)vcnt_s8(v2);
      v3.i16[0] = vaddlv_u8(v3);
      if (v3.u32[0] > 1uLL)
      {
        v4 = a2;
        if (*(_QWORD *)&v2 <= a2)
          v4 = a2 % *(_QWORD *)&v2;
      }
      else
      {
        v4 = (*(_QWORD *)&v2 - 1) & a2;
      }
      v5 = *(_QWORD **)(*result + 8 * v4);
      if (v5)
      {
        for (i = (_QWORD *)*v5; i; i = (_QWORD *)*i)
        {
          v7 = i[1];
          if (v7 == a2)
          {
            if (i[2] == a2)
              return (_QWORD *)i[3];
          }
          else
          {
            if (v3.u32[0] > 1uLL)
            {
              if (v7 >= *(_QWORD *)&v2)
                v7 %= *(_QWORD *)&v2;
            }
            else
            {
              v7 &= *(_QWORD *)&v2 - 1;
            }
            if (v7 != v4)
              return 0;
          }
        }
      }
    }
    return 0;
  }
  return result;
}

uint64_t _catalog_procinfo_lookup_pc(uint64_t a1, uint64_t a2)
{
  unsigned int *v2;
  uint64_t v3;
  _QWORD v5[7];
  _QWORD v6[4];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = &v7;
  v9 = 0x2000000000;
  v10 = 0;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2000000000;
  v6[3] = -1;
  v2 = *(unsigned int **)(a1 + 56);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 0x40000000;
  v5[2] = ___catalog_procinfo_lookup_pc_block_invoke;
  v5[3] = &unk_1E4156410;
  v5[5] = &v7;
  v5[6] = a2;
  v5[4] = v6;
  hashtable_iterate(v2, (uint64_t)v5);
  v3 = v8[3];
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v7, 8);
  return v3;
}

unsigned int *hashtable_iterate(unsigned int *result, uint64_t a2)
{
  unsigned int *v2;
  unint64_t v3;
  unint64_t i;
  _QWORD *v6;
  int v7;
  _QWORD *v8;
  _QWORD *v9;

  if (*((_QWORD *)result + 2))
  {
    v2 = result;
    v3 = *result;
    if ((_DWORD)v3)
    {
      for (i = 0; i < v3; ++i)
      {
        v6 = *(_QWORD **)(*((_QWORD *)v2 + 2) + 8 * i);
        if (v6)
        {
          do
          {
            v7 = *((unsigned __int8 *)v2 + 8);
            if (v7 == 1)
              v8 = v6 + 1;
            else
              v8 = 0;
            if (v7 == 2)
              v9 = v6 + 1;
            else
              v9 = v8;
            result = (unsigned int *)(*(uint64_t (**)(uint64_t, _QWORD *, _QWORD))(a2 + 16))(a2, v9, v6[2]);
            v6 = (_QWORD *)*v6;
          }
          while (v6);
          v3 = *v2;
        }
      }
    }
  }
  return result;
}

_QWORD *___catalog_procinfo_lookup_pc_block_invoke(_QWORD *result, uint64_t a2, _QWORD *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = result[6];
  if (v3 >= *a3)
  {
    v4 = a3[1];
    if (v3 < v4 + *a3)
    {
      v5 = *(_QWORD *)(result[4] + 8);
      if (v4 < *(_QWORD *)(v5 + 24))
      {
        *(_QWORD *)(v5 + 24) = v4;
        *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24) = a3;
      }
    }
  }
  return result;
}

uint64_t _timesync_advance_boot(_QWORD *a1)
{
  unsigned __int16 *v1;
  uint64_t v3;
  uint64_t v4;

  v1 = (unsigned __int16 *)a1[6];
  if (!v1)
    return 0xFFFFFFFFLL;
  v3 = a1[8];
  v4 = a1[9];
  while (*v1 != 48048 || *((_QWORD *)v1 + 1) == v3 && *((_QWORD *)v1 + 2) == v4)
  {
    _timesync_advance((uint64_t)a1);
    v1 = (unsigned __int16 *)a1[6];
    if (!v1)
      return 0xFFFFFFFFLL;
  }
  _timesync_advance((uint64_t)a1);
  return 0;
}

void _catalog_destroy(uint64_t a1)
{
  unsigned int **v2;
  unsigned int *v3;
  void **v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;

  _os_trace_uuid_map_clear(*(_QWORD **)(a1 + 16));
  _os_trace_str_map_clear(*(_QWORD *)(a1 + 24));
  *(_QWORD *)(a1 + 32) = 0;
  _os_procinfo_map_clear(*(_QWORD **)(a1 + 40), (uint64_t (*)(_QWORD))_catalog_procinfo_free);
  v2 = *(unsigned int ***)(a1 + 64);
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  if (v2)
  {
    do
    {
      v3 = *v2;
      hashtable_destroy(v2[6], 0);
      hashtable_destroy(v2[5], 0);
      free(v2);
      v2 = (unsigned int **)v3;
    }
    while (v3);
  }
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = a1 + 64;
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 8) = -1;
  _os_trace_uuid_map_destroy(*(void ***)(a1 + 16));
  _os_trace_str_map_destroy(*(_QWORD *)(a1 + 24));
  v4 = *(void ***)(a1 + 40);
  _os_procinfo_map_clear(v4, 0);
  if (v4)
  {
    v5 = v4[2];
    if (v5)
    {
      do
      {
        v6 = (_QWORD *)*v5;
        operator delete(v5);
        v5 = v6;
      }
      while (v6);
    }
    v7 = *v4;
    *v4 = 0;
    if (v7)
      operator delete(v7);
    MEMORY[0x1A1AEBB50](v4, 0x10A0C408EF24B1CLL);
  }
  free((void *)a1);
}

void _os_trace_str_map_clear(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;

  if (a1 && *(_QWORD *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::__deallocate_node(*(void ***)(a1 + 16));
    *(_QWORD *)(a1 + 16) = 0;
    v2 = *(_QWORD *)(a1 + 8);
    if (v2)
    {
      for (i = 0; i != v2; ++i)
        *(_QWORD *)(*(_QWORD *)a1 + 8 * i) = 0;
    }
    *(_QWORD *)(a1 + 24) = 0;
  }
}

void std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::__deallocate_node(void **__p)
{
  void **v1;
  void **v2;

  if (__p)
  {
    v1 = __p;
    do
    {
      v2 = (void **)*v1;
      if (*((char *)v1 + 39) < 0)
        operator delete(v1[2]);
      operator delete(v1);
      v1 = v2;
    }
    while (v2);
  }
}

_QWORD *_os_trace_uuid_map_destroy(void **a1)
{
  _QWORD *result;
  _QWORD *v3;
  _QWORD *v4;
  void *v5;

  result = _os_trace_uuid_map_clear(a1);
  if (a1)
  {
    v3 = a1[2];
    if (v3)
    {
      do
      {
        v4 = (_QWORD *)*v3;
        operator delete(v3);
        v3 = v4;
      }
      while (v4);
    }
    v5 = *a1;
    *a1 = 0;
    if (v5)
      operator delete(v5);
    JUMPOUT(0x1A1AEBB50);
  }
  return result;
}

_QWORD *_os_trace_uuid_map_clear(_QWORD *result)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t i;

  if (result)
  {
    v1 = result;
    if (result[3])
    {
      result = (_QWORD *)result[2];
      if (result)
      {
        do
        {
          v2 = (_QWORD *)*result;
          operator delete(result);
          result = v2;
        }
        while (v2);
      }
      v1[2] = 0;
      v3 = v1[1];
      if (v3)
      {
        for (i = 0; i != v3; ++i)
          *(_QWORD *)(*v1 + 8 * i) = 0;
      }
      v1[3] = 0;
    }
  }
  return result;
}

void _os_trace_str_map_destroy(uint64_t a1)
{
  void *v2;

  _os_trace_str_map_clear(a1);
  if (a1)
  {
    std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::__deallocate_node(*(void ***)(a1 + 16));
    v2 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v2)
      operator delete(v2);
    JUMPOUT(0x1A1AEBB50);
  }
}

void sub_19EA36550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va2;

  va_start(va2, a8);
  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v14 = va_arg(va2, _QWORD);
  v16 = va_arg(va2, _QWORD);
  v17 = va_arg(va2, _QWORD);
  v18 = va_arg(va2, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va2, 8);
  _Unwind_Resume(a1);
}

id _index_log()
{
  if (_index_log_o != -1)
    dispatch_once(&_index_log_o, &__block_literal_global_379);
  return (id)_index_log_h;
}

void _OSLogRemovePreferences(unsigned int a1, void *a2)
{
  id v3;
  id v4;
  const char *v5;
  xpc_object_t xdict;

  v3 = a2;
  xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(xdict, "operation", 3uLL);
  xpc_dictionary_set_uint64(xdict, "prefs_type", a1);
  v4 = objc_retainAutorelease(v3);
  v5 = (const char *)objc_msgSend(v4, "UTF8String");

  xpc_dictionary_set_string(xdict, "prefs_name", v5);
  _OSLogPreferencesSendMessage(xdict);

}

void _OSLogInstallPreferences(unsigned int a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  xpc_object_t v8;
  id v9;
  const char *v10;
  id v11;

  v5 = (void *)MEMORY[0x1E0CB38B0];
  v6 = a2;
  objc_msgSend(v5, "dataWithPropertyList:format:options:error:", a3, 200, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v8, "operation", 2uLL);
  xpc_dictionary_set_uint64(v8, "prefs_type", a1);
  v9 = objc_retainAutorelease(v6);
  v10 = (const char *)objc_msgSend(v9, "UTF8String");

  xpc_dictionary_set_string(v8, "prefs_name", v10);
  v11 = objc_retainAutorelease(v7);
  xpc_dictionary_set_data(v8, "prefs_data", (const void *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"));
  _OSLogPreferencesSendMessage(v8);

}

void _OSLogPreferencesSendMessage(void *a1)
{
  id v1;
  xpc_object_t v2;
  _xpc_connection_s *connection;

  v1 = a1;
  connection = xpc_connection_create_mach_service("com.apple.logd.admin", 0, 2uLL);
  xpc_connection_set_event_handler(connection, &__block_literal_global_161);
  xpc_connection_activate(connection);
  v2 = xpc_connection_send_message_with_reply_sync(connection, v1);

}

char *___os_log_fdscandir_trace_block_invoke(uint64_t a1, uint64_t a2)
{
  char *result;
  const char *v4;

  result = strrchr((char *)(a2 + 21), 46);
  if (result)
  {
    if ((*(unsigned __int8 *)(a2 + 20) | 8) == 8)
    {
      v4 = result;
      if (!strcmp(result, ".tracev3")
        || !strcmp(v4, ".log")
        || !strcmp(v4, ".txt")
        || !strcmp(v4, ".plist")
        || !strcmp(v4, ".timesync"))
      {
        return (char *)1;
      }
      else
      {
        return (char *)(strcmp(v4, ".jsonl") == 0);
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t _uuidpath_pathcache_compare_nodes(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return uuid_compare((const unsigned __int8 *)(a2 + 24), (const unsigned __int8 *)(a3 + 24));
}

uint64_t _enumerateArchiveIntoSource(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  int v12;
  int v13;
  int v14;
  DIR *v15;
  DIR *v16;
  uint64_t v17;
  const char *v18;
  int v19;
  int v20;
  DIR *v21;
  DIR *v22;
  int *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  int *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  int *v33;
  void *v34;
  int v35;
  uint64_t result;
  uint64_t v37;
  int v38;
  int *v39;
  void *v40;
  int v41;
  void (**v42)(id, _QWORD, void *);

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  objc_msgSend(v8, "diagnosticsDirectoryReference");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "fileDescriptor");

  v13 = dup(v12);
  if (v13 == -1)
  {
    __error();
    _os_assumes_log();
LABEL_23:
    v39 = __error();
    _OSLogPOSIXError(11, *v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v40);

    v37 = 0;
LABEL_24:

    return v37;
  }
  v14 = v13;
  if (lseek(v13, 0, 0) == -1)
  {
    __error();
    _os_assumes_log();
  }
  v15 = fdopendir(v14);
  if (!v15)
  {
    v38 = *__error();
    if (close(v14) == -1)
    {
      v41 = *__error();
      result = *__error();
      if (v41 == 9)
        goto LABEL_29;
      _os_assumes_log();
    }
    *__error() = v38;
    goto LABEL_23;
  }
  v16 = v15;
  v42 = v10;
  _enumerateDirectoryIntoSource(v7, v12, v15, 0, v8, v9);
  closedir(v16);
  v17 = 0;
  while (1)
  {
    v18 = (&_enumerateArchiveIntoSource_dirs)[v17];
    v19 = openat(v12, v18, 0x100000);
    if (v19 == -1)
    {
      v23 = __error();
      if (v17 * 8 && *v23 == 2)
        goto LABEL_17;
      objc_msgSend(MEMORY[0x1E0CB38A8], "currentProgress");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v9)
      {
        objc_msgSend(v24, "fractionCompleted");
        v27 = v26;
        v28 = __error();
        _OSLogPOSIXError(18, *v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *, double))v9 + 2))(v9, v29, v27);

      }
      goto LABEL_16;
    }
    v20 = v19;
    v21 = fdopendir(v19);
    if (!v21)
      break;
    v22 = v21;
    _enumerateDirectoryIntoSource(v7, v20, v21, v18, v8, v9);
    closedir(v22);
LABEL_17:
    v17 += 2;
    if (v17 == 8)
    {
      v37 = 1;
      v10 = v42;
      goto LABEL_24;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB38A8], "currentProgress");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v30;
  if (v9)
  {
    objc_msgSend(v30, "fractionCompleted");
    v32 = v31;
    v33 = __error();
    _OSLogPOSIXError(18, *v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, double))v9 + 2))(v9, v34, v32);

  }
  if (close(v20) != -1)
  {
LABEL_16:

    goto LABEL_17;
  }
  v35 = *__error();
  result = *__error();
  if (v35 != 9)
  {
    _os_assumes_log();
    goto LABEL_16;
  }
  qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EE52EA88 = result;
  __break(1u);
LABEL_29:
  qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EE52EA88 = result;
  __break(1u);
  return result;
}

void _enumerateDirectoryIntoSource(void *a1, int a2, DIR *a3, const char *a4, void *a5, void *a6)
{
  id v10;
  dirent *v11;
  dirent *v12;
  __objc2_class *v13;
  stat *d_name;
  char *v15;
  int d_type;
  void *v17;
  _OSLogIndexFile *v18;
  _OSLogIndexFile *v19;
  id v20;
  void *v21;
  __objc2_class *v22;
  void *v23;
  BOOL v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void (**v31)(id, void *, double);
  id v32;
  id v33;
  stat v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v32 = a1;
  v10 = a5;
  v31 = a6;
  v11 = readdir(a3);
  if (v11)
  {
    v12 = v11;
    v29 = (void *)*MEMORY[0x1E0CB2FE0];
    v13 = &OBJC_METACLASS____OSLogTracepointBuffer;
    do
    {
      d_name = (stat *)v12->d_name;
      v15 = strrchr(v12->d_name, 46);
      if (v15 && !strcmp(v15, ".tracev3"))
      {
        d_type = v12->d_type;
        if (!v12->d_type)
        {
          memset(&v34, 0, sizeof(v34));
          if (!fstatat(a2, v12->d_name, &v34, 0) && (v34.st_mode & 0xF000) == 0x8000)
            v12->d_type = 8;
          d_type = v12->d_type;
        }
        if (d_type == 8)
        {
          if (a4)
          {
            d_name = &v34;
            snprintf((char *)&v34, 0x400uLL, "%s/%s", a4, v12->d_name);
          }
          v17 = (void *)objc_msgSend(objc_alloc(&v13[6]), "initWithCollection:subpath:", v10, d_name);
          v18 = [_OSLogIndexFile alloc];
          v33 = 0;
          v19 = -[_OSLogIndexFile initWithTraceFile:error:](v18, "initWithTraceFile:error:", v17, &v33);
          v20 = v33;
          v21 = v20;
          if (v19)
          {
            objc_msgSend(v32, "_insertIndexFile:", v19);
          }
          else
          {
            v22 = v13;
            objc_msgSend(v20, "domain");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v23 == v29 && objc_msgSend(v21, "code") == 34;

            v13 = v22;
            if (v31 && !v24)
            {
              objc_msgSend(MEMORY[0x1E0CB38A8], "currentProgress");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "fractionCompleted");
              v27 = v26;
              _OSLogInternalError(17, v21);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v31[2](v31, v28, v27);

              v13 = v22;
            }
          }

        }
      }
      v12 = readdir(a3);
    }
    while (v12);
  }

}

uint64_t OSLogCaptureInflightBuffersToFile(int a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _xpc_connection_s *v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  xpc_object_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  xpc_object_t v25;
  int int64;
  int v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  xpc_object_t v35;
  int *v36;
  int v37;
  char v39;
  stat v40;

  v5 = a3;
  OSLogLogdAdminConnection();
  v6 = objc_claimAutoreleasedReturnValue();
  v13 = (_xpc_connection_s *)v6;
  if (a1 < 0)
  {
    v17 = 1;
  }
  else
  {
    if (v6)
    {
      memset(&v40, 0, sizeof(v40));
      v14 = fstat(a1, &v40);
      if (v14)
      {
        v15 = 0;
        v16 = 0;
      }
      else
      {
        v15 = v40.st_mode & 0xFFF;
        v14 = fchmod(a1, v40.st_mode & 0xFFD | 2);
        v16 = v15;
      }
      if (v14 == -1)
      {
        __error();
        _os_assumes_log();
        v16 = v15;
      }
      v18 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_fd(v18, "snapshot_file_descriptor", a1);
      xpc_dictionary_set_uint64(v18, "logd_snapshot_flags", a2);
      xpc_dictionary_set_uint64(v18, "operation", 1uLL);
      v25 = xpc_connection_send_message_with_reply_sync(v13, v18);
      if (v16 && fchmod(a1, v16) == -1)
      {
        __error();
        _os_assumes_log();
        if (v25)
        {
LABEL_13:
          if (MEMORY[0x1A1AECA14](v25) != MEMORY[0x1E0C81310])
          {
            int64 = xpc_dictionary_get_int64(v25, "st");
            v27 = int64;
            if (int64)
            {
              v28 = strerror(int64);
              _OSLogWarningMessage(v5, "snapshot failed: %s (%d)", v29, v30, v31, v32, v33, v34, v28);
              v17 = 0;
              *__error() = v27;
            }
            else
            {
              v17 = 1;
            }
            goto LABEL_23;
          }
          v35 = (xpc_object_t)MEMORY[0x1E0C81258];
          v36 = __error();
          if (v25 == v35)
          {
            v17 = 0;
            v37 = 1;
LABEL_22:
            *v36 = v37;
LABEL_23:

            goto LABEL_24;
          }
LABEL_21:
          v17 = 0;
          v37 = 2;
          goto LABEL_22;
        }
      }
      else if (v25)
      {
        goto LABEL_13;
      }
      _OSLogWarningMessage(v5, "snapshot failed: no reply from logd", v19, v20, v21, v22, v23, v24, v39);
      v36 = __error();
      goto LABEL_21;
    }
    _OSLogWarningMessage(v5, "snapshot failed: no connection to logd", v7, v8, v9, v10, v11, v12, v39);
    v17 = 0;
    *__error() = 2;
  }
LABEL_24:

  return v17;
}

id OSLogLogdAdminConnection()
{
  if (OSLogLogdAdminConnection_once != -1)
    dispatch_once(&OSLogLogdAdminConnection_once, &__block_literal_global_2058);
  return (id)OSLogLogdAdminConnection_xconn;
}

void _timesync_db_close(int *a1)
{
  int v2;
  uint64_t v3;

  _timesync_munmap_file((uint64_t)a1);
  if (close(*a1) != -1)
    goto LABEL_2;
  v2 = *__error();
  v3 = *__error();
  if (v2 != 9)
  {
    _os_assumes_log();
LABEL_2:
    free(a1);
    return;
  }
  qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EE52EA88 = v3;
  __break(1u);
}

uint64_t _timesync_db_openat(int a1, const char *a2)
{
  _QWORD *v4;
  int v5;
  int v6;
  int v7;
  uint64_t result;
  int v9;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (_QWORD *)_os_trace_zalloc();
  v5 = openat(a1, a2, 0);
  *(_DWORD *)v4 = v5;
  if (v5 == -1)
  {
    __error();
    _os_assumes_log();
  }
  else
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2000000000;
    v22 = 0;
    v15 = 0;
    v16 = &v15;
    v17 = 0x2000000000;
    v18 = -1;
    v11 = 0;
    v12 = &v11;
    v13 = 0x2000000000;
    v14 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 0x40000000;
    v10[2] = ___timesync_tidy_and_count_files_block_invoke;
    v10[3] = &unk_1E4156660;
    v10[4] = &v19;
    v10[5] = &v15;
    v10[6] = &v11;
    _timesync_foreach_reg_file_at(v5, (uint64_t)v10);
    v6 = *((_DWORD *)v20 + 6);
    if (v6 >= 1)
    {
      v4[1] = v16[3];
      v4[2] = v12[3];
    }
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v19, 8);
    if (v6 >= 1 && (_timesync_reset((uint64_t)v4) & 0x80000000) == 0)
      return (uint64_t)v4;
  }
  v7 = *__error();
  if ((*(_DWORD *)v4 & 0x80000000) != 0 || close(*(_DWORD *)v4) != -1)
  {
LABEL_10:
    free(v4);
    v4 = 0;
    *__error() = v7;
    return (uint64_t)v4;
  }
  v9 = *__error();
  result = *__error();
  if (v9 != 9)
  {
    _os_assumes_log();
    goto LABEL_10;
  }
  qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EE52EA88 = result;
  __break(1u);
  return result;
}

uint64_t _timesync_foreach_reg_file_at(int a1, uint64_t a2)
{
  int v3;
  int v4;
  DIR *v5;
  DIR *v6;
  uint64_t v7;
  dirent *v8;
  uint64_t v9;
  char *d_name;
  uint64_t result;
  int v12;
  int v13;

  v3 = dup(a1);
  if (v3 == -1)
  {
LABEL_15:
    __error();
    return _os_assumes_log();
  }
  v4 = v3;
  if (lseek(v3, 0, 0) == -1)
  {
    __error();
    _os_assumes_log();
  }
  v5 = fdopendir(v4);
  if (v5)
  {
    v6 = v5;
    v7 = MEMORY[0x1E0C80978];
LABEL_6:
    while (1)
    {
      v8 = readdir(v6);
      if (!v8)
        break;
      if ((v8->d_type | 8) == 8)
      {
        v9 = 0;
        d_name = v8->d_name;
        while ((d_name[v9] & 0x80000000) == 0
             && (*(_DWORD *)(v7 + 4 * d_name[v9] + 60) & 0x10000) != 0)
        {
          if (++v9 == 16)
          {
            if (strcmp(&v8->d_name[16], ".timesync")
              || ((*(uint64_t (**)(uint64_t, char *))(a2 + 16))(a2, d_name) & 1) != 0)
            {
              goto LABEL_6;
            }
            goto LABEL_14;
          }
        }
      }
    }
LABEL_14:
    result = closedir(v6);
    if ((_DWORD)result == -1)
      goto LABEL_15;
  }
  else
  {
    v12 = *__error();
    if (close(v4) == -1)
    {
      v13 = *__error();
      result = *__error();
      if (v13 == 9)
      {
        qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_1EE52EA88 = result;
        __break(1u);
        return result;
      }
      _os_assumes_log();
    }
    result = (uint64_t)__error();
    *(_DWORD *)result = v12;
  }
  return result;
}

uint64_t ___timesync_tidy_and_count_files_block_invoke(_QWORD *a1, char *__str)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  ++*(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  v3 = strtoull(__str, 0, 16);
  v4 = *(_QWORD *)(a1[5] + 8);
  if (v3 < *(_QWORD *)(v4 + 24))
    *(_QWORD *)(v4 + 24) = v3;
  v5 = *(_QWORD *)(a1[6] + 8);
  if (v3 > *(_QWORD *)(v5 + 24))
    *(_QWORD *)(v5 + 24) = v3;
  return 1;
}

id _findOldestTimeRef(uint64_t *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  void *v8;
  int v9;
  id v10;

  v5 = a2;
  v6 = a3;
  v7 = _timesync_range_contains(a1, (_QWORD *)objc_msgSend(v6, "UUID"), objc_msgSend(v6, "continuousTime"));
  if (v5)
  {
    v8 = v5;
    if (v7)
    {
      v9 = _timesync_range_compare((_QWORD **)a1, (_QWORD *)objc_msgSend(v6, "UUID"), objc_msgSend(v6, "continuousTime"), (_QWORD *)objc_msgSend(v5, "UUID"), objc_msgSend(v5, "continuousTime"));
      v8 = v6;
      if (v9 != -1)
        v8 = v5;
    }
  }
  else
  {
    v8 = v6;
    if (!v7)
    {
      v10 = 0;
      goto LABEL_8;
    }
  }
  v10 = v8;
LABEL_8:

  return v10;
}

void _os_log_index_metadata_determine_oldest(uint64_t a1, uint64_t a2)
{
  uint64_t *impl;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  int v8;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  impl = (uint64_t *)_timesync_range_create_impl(a2, 0, 0xFFFFFFFFFFFFFFFFLL, 0);
  v4 = 0;
  v9[0] = a1;
  v9[1] = a1 + 24;
  v9[2] = a1 + 48;
  v9[3] = a1 + 72;
  v9[4] = a1 + 96;
  *(_QWORD *)(a1 + 144) = 0;
  do
  {
    v5 = v9[v4];
    if (uuid_is_null((const unsigned __int8 *)v5))
      goto LABEL_3;
    v6 = *(_QWORD **)(a1 + 144);
    v7 = *(_QWORD *)(v5 + 16);
    v8 = _timesync_range_contains(impl, (_QWORD *)v5, v7);
    if (!v6)
    {
      if ((v8 & 1) == 0)
        goto LABEL_3;
LABEL_10:
      *(_QWORD *)(a1 + 144) = v5;
      goto LABEL_3;
    }
    if (v8 && _timesync_range_compare((_QWORD **)impl, (_QWORD *)v5, v7, v6, v6[2]) == -1)
      goto LABEL_10;
LABEL_3:
    ++v4;
  }
  while (v4 != 5);
  _os_trace_uuid_map_destroy((void **)*impl);
  free(impl);
}

unint64_t _timesync_range_contains(uint64_t *a1, _QWORD *a2, unint64_t a3)
{
  _QWORD *v5;
  unint64_t result;
  unint64_t v7;

  v5 = (_QWORD *)*a1;
  result = _os_trace_uuid_map_lookup((_QWORD *)*a1, a2);
  if (result)
  {
    if (v5)
      v7 = v5[3];
    else
      v7 = 0;
    return result == 1 && a1[1] <= a3 || v7 == result && a1[2] >= a3 || result > 1 && v7 > result;
  }
  return result;
}

uint64_t _timesync_range_compare(_QWORD **a1, _QWORD *a2, unint64_t a3, _QWORD *a4, unint64_t a5)
{
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  int v12;
  unsigned int v13;

  v9 = *a1;
  v10 = _os_trace_uuid_map_lookup(*a1, a2);
  if (!v10)
  {
    _os_assumes_log();
    v9 = *a1;
  }
  v11 = _os_trace_uuid_map_lookup(v9, a4);
  if (!v11)
    _os_assumes_log();
  if (a3 >= a5)
    v12 = a3 > a5;
  else
    v12 = -1;
  if (v10 <= v11)
    v13 = v12;
  else
    v13 = 1;
  if (v10 >= v11)
    return v13;
  else
    return 0xFFFFFFFFLL;
}

char *_timesync_range_intersect(char *result, _QWORD *a2, float *a3, _QWORD *a4, float *a5)
{
  float **v8;
  void **v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t *v15;
  size_t v16;

  v8 = (float **)result;
  v9 = *(void ***)result;
  if (*(_QWORD *)result)
  {
    v10 = (char *)v9[3];
    if (!a2)
      goto LABEL_10;
  }
  else
  {
    v10 = 0;
    if (!a2)
    {
LABEL_10:
      v11 = 0;
      goto LABEL_11;
    }
  }
  result = (char *)_os_trace_uuid_map_lookup(*(_QWORD **)result, a2);
  if (!result)
    goto LABEL_10;
  v11 = result - 1;
  if (result == (char *)1 && v8[1] > a3)
    a3 = v8[1];
  v8[1] = a3;
LABEL_11:
  v12 = v10;
  if (a4)
  {
    result = (char *)_os_trace_uuid_map_lookup(v9, a4);
    v12 = v10;
    if (result)
    {
      if (v10 == result && v8[2] < a5)
        a5 = v8[2];
      v8[2] = a5;
      v12 = result;
    }
  }
  if (v11 || v12 != v10)
  {
    if (v12 <= v11)
    {
      if (v9)
        v16 = 16 * (_QWORD)v9[3];
      else
        v16 = 0;
      v8[1] = 0;
      v8[2] = 0;
      bzero(v8 + 3, v16);
      return (char *)_os_trace_uuid_map_clear(v9);
    }
    else
    {
      v13 = v12;
      if (v11)
      {
        memmove(v8 + 3, &v8[2 * (_QWORD)v11 + 3], 16 * (v12 - v11));
        v13 = (char *)(v12 - v11);
      }
      _os_trace_uuid_map_destroy(v9);
      result = (char *)operator new();
      *(_OWORD *)result = 0u;
      *((_OWORD *)result + 1) = 0u;
      *((_DWORD *)result + 8) = 1065353216;
      *v8 = (float *)result;
      if (v12 != v11)
      {
        v14 = 0;
        v15 = (uint64_t *)(v8 + 3);
        do
        {
          result = (char *)_os_trace_uuid_map_insert(*v8, v15, (uint64_t)++v14);
          v15 += 2;
        }
        while (v13 != v14);
      }
    }
  }
  return result;
}

uint64_t _timesync_range_find_startboot(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t *a4)
{
  unsigned __int16 *i;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  unint64_t v13;
  unint64_t v14;

  _timesync_reset(a1);
  if (a2 - 1 >= a3)
    a3 = -1;
  for (i = *(unsigned __int16 **)(a1 + 48); i; i = *(unsigned __int16 **)(a1 + 48))
  {
    v9 = *(_QWORD *)(a1 + 120);
    if (v9 <= a3)
    {
      if (v9 > a2)
        break;
      if (*i != 48048)
      {
        v10 = (*((_QWORD *)i + 1) - *(_QWORD *)(a1 + 112))
            * (unint64_t)*(unsigned int *)(a1 + 80)
            / *(unsigned int *)(a1 + 84)
            + v9;
LABEL_10:
        if (v10 > a2)
          break;
        goto LABEL_11;
      }
      v10 = *((_QWORD *)i + 4);
      if (v10 <= a3)
        goto LABEL_10;
    }
LABEL_11:
    _timesync_advance(a1);
  }
  v11 = *(_QWORD *)(a1 + 120);
  v12 = a2 >= v11;
  v13 = a2 - v11;
  if (v12)
    v14 = *(_QWORD *)(a1 + 112) + v13 * *(unsigned int *)(a1 + 84) / *(unsigned int *)(a1 + 80);
  else
    v14 = *(_QWORD *)(a1 + 112);
  *a4 = v14;
  return a1 + 64;
}

_QWORD **_timesync_range_create(uint64_t a1, unint64_t a2, unint64_t a3)
{
  return _timesync_range_create_impl(a1, a2, a3, 0);
}

uint64_t _timesync_advance(uint64_t result)
{
  unsigned __int16 *v1;
  _QWORD *v2;
  unsigned __int16 *v3;
  __int128 v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v1 = *(unsigned __int16 **)(result + 48);
  if (!v1)
    return result;
  v2 = (_QWORD *)result;
  if (*v1 == 48048)
  {
    _timesync_process_boot_entry(result);
    v3 = (unsigned __int16 *)v2[6];
  }
  else
  {
    v4 = *(_OWORD *)v1;
    *(_OWORD *)(result + 120) = *((_OWORD *)v1 + 1);
    *(_OWORD *)(result + 104) = v4;
    v3 = v1;
  }
  v8[0] = v2[4] - (_QWORD)v3 + v2[5];
  while (1)
  {
    result = (uint64_t)_timesync_next_entry(v1, v8);
    v1 = (unsigned __int16 *)result;
    if (!result)
      break;
LABEL_10:
    v7 = *v1;
    if (v7 == 48048)
    {
      if (*((_QWORD *)v1 + 1) != v2[8] || *((_QWORD *)v1 + 2) != v2[9])
        goto LABEL_17;
    }
    else if (v7 == 29524)
    {
      goto LABEL_17;
    }
  }
  result = _timesync_munmap_file((uint64_t)v2);
  v5 = v2[2];
  v6 = v2[3] + 1;
  v2[3] = v6;
  if (v6 <= v5)
  {
    result = _timesync_mmap_file(v2);
    if ((result & 0x80000000) == 0)
    {
      v1 = (unsigned __int16 *)v2[6];
      v8[0] = v2[4];
      if (!v1)
        goto LABEL_17;
      goto LABEL_10;
    }
  }
  v1 = 0;
LABEL_17:
  v2[6] = v1;
  return result;
}

char *_timesync_next_entry(unsigned __int16 *a1, _QWORD *a2)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;

  v2 = *a1;
  if (v2 > 0xBBAF)
  {
    if (v2 == 48048)
    {
      if (a1[1] != 48)
        goto LABEL_17;
      v3 = 48;
    }
    else
    {
      if (v2 != 57005)
        goto LABEL_17;
      v3 = a1[1];
    }
  }
  else
  {
    if (v2 != 27986)
    {
      if (v2 == 29524 && a1[1] == 32)
      {
        v3 = 32;
        goto LABEL_13;
      }
LABEL_17:
      _os_assumes_log();
      return 0;
    }
    if (a1[1] != 88)
      goto LABEL_17;
    v3 = 88;
  }
LABEL_13:
  v4 = *a2 - v3;
  *a2 = v4;
  v5 = (char *)a1 + v3;
  if (v4 >= 1)
    return v5;
  else
    return 0;
}

uint64_t _os_trace_uuid_map_lookup(_QWORD *a1, _QWORD *a2)
{
  int8x8_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  _QWORD *v9;
  _QWORD *i;
  unint64_t v11;

  v2 = (int8x8_t)a1[1];
  if (v2)
  {
    v3 = a2[1];
    v4 = __ROR8__(v3 + 16, 16);
    v5 = 0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (*a2 ^ v4)) >> 47) ^ (0x9DDFEA08EB382D69 * (*a2 ^ v4)));
    v6 = (0x9DDFEA08EB382D69 * (v5 ^ (v5 >> 47))) ^ v3;
    v7 = (uint8x8_t)vcnt_s8(v2);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      v8 = v6;
      if (v6 >= *(_QWORD *)&v2)
        v8 = v6 % *(_QWORD *)&v2;
    }
    else
    {
      v8 = v6 & (*(_QWORD *)&v2 - 1);
    }
    v9 = *(_QWORD **)(*a1 + 8 * v8);
    if (v9)
    {
      for (i = (_QWORD *)*v9; i; i = (_QWORD *)*i)
      {
        v11 = i[1];
        if (v6 == v11)
        {
          if (i[2] == *a2 && i[3] == v3)
            return i[4];
        }
        else
        {
          if (v7.u32[0] > 1uLL)
          {
            if (v11 >= *(_QWORD *)&v2)
              v11 %= *(_QWORD *)&v2;
          }
          else
          {
            v11 &= *(_QWORD *)&v2 - 1;
          }
          if (v11 != v8)
            return 0;
        }
      }
    }
  }
  return 0;
}

uint64_t _timesync_process_boot_entry(uint64_t result)
{
  __int128 *v1;
  __int128 v2;
  __int128 v3;

  v1 = *(__int128 **)(result + 48);
  if (*((_DWORD *)v1 + 6))
  {
    if (*((_DWORD *)v1 + 7))
    {
      v2 = *v1;
      v3 = v1[1];
      *(_OWORD *)(result + 88) = v1[2];
      *(_OWORD *)(result + 72) = v3;
      *(_OWORD *)(result + 56) = v2;
      *(_QWORD *)(result + 112) = 0;
      *(_OWORD *)(result + 120) = *(_OWORD *)(result + 88);
      return result;
    }
  }
  else
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  _os_assert_log();
  result = _os_crash();
  __break(1u);
  return result;
}

uint64_t _timesync_reset(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t result;
  char *entry;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  _timesync_munmap_file(a1);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a1 + 8);
  while ((_timesync_mmap_file((_QWORD *)a1) & 0x80000000) != 0)
  {
    v2 = *(_QWORD *)(a1 + 16);
    v3 = *(_QWORD *)(a1 + 24) + 1;
    *(_QWORD *)(a1 + 24) = v3;
    if (v3 > v2)
      return 0xFFFFFFFFLL;
  }
  _timesync_process_boot_entry(a1);
  v6[0] = *(_QWORD *)(a1 + 32);
  entry = _timesync_next_entry(*(unsigned __int16 **)(a1 + 48), v6);
  result = 0;
  *(_QWORD *)(a1 + 48) = entry;
  return result;
}

uint64_t _timesync_munmap_file(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;

  v3 = (_QWORD *)(a1 + 40);
  result = *(_QWORD *)(a1 + 40);
  if ((unint64_t)(result + 1) >= 2)
  {
    result = munmap((void *)result, *(_QWORD *)(a1 + 32));
    if ((_DWORD)result == -1)
    {
      __error();
      result = _os_assumes_log();
    }
    *v3 = 0;
    v3[1] = 0;
  }
  return result;
}

uint64_t _timesync_mmap_file(_QWORD *a1)
{
  unsigned __int16 *v2;
  uint64_t v3;
  uint64_t v5;
  char __str[8];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  memset(v7, 170, 18);
  v5 = a1[3];
  *(_QWORD *)__str = 0xAAAAAAAAAAAAAAAALL;
  snprintf(__str, 0x1AuLL, "%016llx.timesync", v5);
  v2 = (unsigned __int16 *)_os_trace_mmap_at();
  a1[5] = v2;
  if (!v2)
  {
    if (*__error())
      _os_assumes_log();
    return 0xFFFFFFFFLL;
  }
  if ((uint64_t)a1[4] < 80 || *v2 != 48048 || v2[1] != 48 || v2[24] != 29524 || v2[25] != 32)
  {
    _timesync_munmap_file((uint64_t)a1);
    a1[5] = 0;
    return 0xFFFFFFFFLL;
  }
  v3 = 0;
  a1[6] = v2;
  return v3;
}

unint64_t _timesync_advance_and_calculate(uint64_t a1, unint64_t a2, _QWORD *a3)
{
  unint64_t v6;
  uint64_t v7;

  while (1)
  {
    v6 = *(_QWORD *)(a1 + 112);
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
    {
      if (*(_WORD *)v7 == 29524)
        break;
    }
    if (v6 <= a2)
      goto LABEL_8;
LABEL_7:
    _timesync_advance(a1);
  }
  if (v6 > a2 || *(_QWORD *)(v7 + 8) <= a2)
    goto LABEL_7;
LABEL_8:
  if (a3)
  {
    *a3 = *(_QWORD *)(a1 + 128);
    v6 = *(_QWORD *)(a1 + 112);
  }
  return (a2 - v6) * *(unsigned int *)(a1 + 80) / *(unsigned int *)(a1 + 84) + *(_QWORD *)(a1 + 120);
}

void sub_19EA3B9D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

void _invalidate(void *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;

  v8 = a1;
  v5 = a3;
  objc_msgSend(v8, "setInvalidated:", 1);
  objc_msgSend(v8, "invalidationHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v8, "invalidationHandler");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, id))v7)[2](v7, a2, v5);

    objc_msgSend(v8, "setInvalidationHandler:", 0);
  }

}

uint64_t _calculateTimeRefForBook(void *a1, const char *a2)
{
  id v3;
  void *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  _QWORD *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  int v14;
  _OSLogEventStoreTimeRef *v15;
  _OSLogEventStoreTimeRef *v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t result;
  uint64_t v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(v3, "diagnosticsDirectoryReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileDescriptor");

  v6 = openat(v5, a2, 0);
  if (v6 == -1)
  {
    v15 = 0;
    goto LABEL_23;
  }
  v7 = v6;
  v8 = _os_trace_fdscandir_b();
  if (v8 >= 1)
  {
    v9 = 0;
    v10 = 8 * v8;
    do
    {
      v11 = (char *)(*v9 + 21);
      v12 = strrchr(v11, 46);
      if (v12)
      {
        if (!strcmp(v12, ".tracev3"))
        {
          v13 = openat(v7, v11, 0);
          if ((_DWORD)v13 != -1)
          {
            v14 = v13;
            v22[0] = 0;
            v22[1] = 0;
            v21 = 0;
            if (_OSLogFileFindExhaustivePoint(v13, (uint64_t)v22, (uint64_t)&v21) && *__error() == 2)
            {
              v15 = 0;
            }
            else
            {
              v16 = [_OSLogEventStoreTimeRef alloc];
              v15 = -[_OSLogEventStoreTimeRef initWithUUID:continuous:](v16, "initWithUUID:continuous:", v22, v21);
            }
            if (close(v14) == -1)
            {
              v17 = *__error();
              v18 = *__error();
              if (v17 == 9)
              {
                qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
                qword_1EE52EA88 = v18;
                __break(1u);
              }
              _os_assumes_log();
              if (v15)
                goto LABEL_19;
            }
            else if (v15)
            {
              goto LABEL_19;
            }
          }
        }
      }
      ++v9;
    }
    while ((_QWORD *)v10 != v9);
  }
  v15 = 0;
LABEL_19:
  _os_trace_scandir_free_namelist();
  if (close(v7) != -1)
    goto LABEL_23;
  v19 = *__error();
  result = *__error();
  if (v19 != 9)
  {
    _os_assumes_log();
LABEL_23:

    return (uint64_t)v15;
  }
  qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EE52EA88 = result;
  __break(1u);
  return result;
}

uint64_t _OSLogFileFindExhaustivePoint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v5;
  size_t v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD v12[2];
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  size_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v18 = 0;
  v5 = (char *)_os_trace_mmap();
  if (!v5)
    goto LABEL_9;
  v6 = v18;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v13 = ___OSLogFileFindExhaustivePoint_block_invoke;
  v14 = &unk_1E41578B0;
  v15 = &v19;
  v16 = a2;
  v17 = a3;
  v7 = v12;
  v8 = 0;
  do
  {
    if (v6 - v8 < 0x10)
      break;
    v9 = *(_QWORD *)&v5[v8 + 8];
    if (v6 - v8 - 16 < v9)
      break;
    if (!((unsigned int (*)(_QWORD *))v13)(v7))
      break;
    v8 = (v8 + v9 + 23) & 0xFFFFFFFFFFFFFFF8;
  }
  while (v8 - 1 < v6);

  munmap(v5, v18);
  v10 = *((unsigned int *)v20 + 6);
  if ((_DWORD)v10)
  {
    *__error() = v10;
LABEL_9:
    v10 = 0xFFFFFFFFLL;
  }
  _Block_object_dispose(&v19, 8);
  return v10;
}

void sub_19EA3C320(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _os_activity_map_destroy(uint64_t result)
{
  void **v1;
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  if (result)
  {
    v1 = (void **)result;
    v2 = *(_QWORD **)(result + 16);
    if (v2)
    {
      do
      {
        v3 = (_QWORD *)*v2;
        operator delete(v2);
        v2 = v3;
      }
      while (v3);
    }
    v4 = *v1;
    *v1 = 0;
    if (v4)
      operator delete(v4);
    JUMPOUT(0x1A1AEBB50);
  }
  return result;
}

id _OSLogGetSimplePredicate(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  _OSLogSimplePredicate *v11;
  void *v12;

  v7 = a4;
  v8 = a3;
  v9 = a2;
  v10 = a1;
  v11 = -[_OSLogSimplePredicate initWithPredicate:supportedKeys:supportedOperators:supportedCompoundTypes:]([_OSLogSimplePredicate alloc], "initWithPredicate:supportedKeys:supportedOperators:supportedCompoundTypes:", v10, v9, v8, v7);

  -[_OSLogSimplePredicate predicate](v11, "predicate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t ___uuidpath_pathcache_block_invoke()
{
  return pthread_key_create((pthread_key_t *)&_uuidpath_pathcache_key, (void (__cdecl *)(void *))_uuidpath_pathcache_free);
}

uint64_t ___uuidpath_headercache_lookup_block_invoke()
{
  return pthread_key_create((pthread_key_t *)&headercache_key, (void (__cdecl *)(void *))_uuidpath_headercache_free);
}

void *_os_trace_load_formatter(uint64_t a1)
{
  void *result;
  char __str[1024];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  snprintf(__str, 0x400uLL, "%sliblog_%s.dylib", (&plugin_dirs)[2 * *(_QWORD *)(a1 + 16)], *(const char **)(a1 + 8));
  result = dlopen(__str, 6);
  *(_QWORD *)(a1 + 16) = result;
  if (result)
  {
    *(_QWORD *)(a1 + 24) = dlsym(result, "OSLogCopyFormattedString");
    result = dlsym(*(void **)(a1 + 16), "OSStateCreateStringWithData");
    *(_QWORD *)(a1 + 32) = result;
  }
  return result;
}

Class __os_log_fmt_object_for_data_block_invoke()
{
  Class result;

  os_log_fmt_object_for_data__NSString = (uint64_t)objc_getClass("NSString");
  os_log_fmt_object_for_data__NSNumber = (uint64_t)objc_getClass("NSNumber");
  result = objc_getClass("NSData");
  os_log_fmt_object_for_data__NSData = (uint64_t)result;
  return result;
}

void ___index_log_block_invoke()
{
  char *v0;
  os_log_t v1;
  id v2;
  void *v3;

  v0 = getenv("INDEX_SIGNPOSTS");
  if (v0 && !strcmp(v0, "1"))
  {
    v1 = os_log_create("com.apple.loggingsupport", "Index");
  }
  else
  {
    v1 = (os_log_t)MEMORY[0x1E0C81030];
    v2 = MEMORY[0x1E0C81030];
  }
  v3 = (void *)_index_log_h;
  _index_log_h = (uint64_t)v1;

}

void _os_trace_formatters_list()
{
  char *v0;
  uint64_t v1;
  char v2;
  char v3;
  DIR *v4;
  DIR *v5;
  dirent *i;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v0 = getenv("OS_ACTIVITY_FORMATTER");
  if (!v0 || strcmp(v0, "disable"))
  {
    v1 = 0;
    v2 = 1;
    do
    {
      v3 = v2;
      v4 = opendir((&plugin_dirs)[2 * v1]);
      v5 = v4;
      if (v4)
      {
        for (i = readdir(v4); i; i = readdir(v5))
        {
          if (i->d_type == 8)
          {
            v7 = _os_trace_formatter_record(v18[3], i->d_name, v1, v14 + 3, v10 + 3);
            v18[3] = v7;
          }
        }
        closedir(v5);
      }
      v2 = 0;
      v1 = 1;
    }
    while ((v3 & 1) != 0);
    v21 = 0;
    v22 = 0;
    if (_dyld_get_shared_cache_uuid())
      dyld_shared_cache_iterate_text();
    qsort_b((void *)v18[3], v14[3], 0x28uLL, &__block_literal_global_59);
    v8 = v14[3];
    _formatters = v18[3];
    qword_1ED022658 = v8;
  }
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
}

void sub_19EA3DADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v10;
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v10 - 88), 8);
  _Unwind_Resume(a1);
}

uint64_t _catalog_uuid_add(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
    v3 = *(_QWORD *)(v2 + 24);
  else
    v3 = 0;
  return _os_trace_uuid_map_insert((float *)v2, a2, v3);
}

unsigned int *_catalog_procinfo_for_each_uuidinfo(uint64_t a1, uint64_t a2)
{
  unsigned int *v2;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned int **)(a1 + 56);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___catalog_procinfo_for_each_uuidinfo_block_invoke;
  v4[3] = &unk_1E41563E8;
  v4[4] = a2;
  return hashtable_iterate(v2, (uint64_t)v4);
}

uint64_t ___catalog_procinfo_for_each_uuidinfo_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

BOOL _catalog_procinfo_uuidinfo_add(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a1 + 16);
  if (v6)
    v7 = *(_QWORD *)(v6 + 24);
  else
    v7 = 0;
  _os_trace_uuid_map_insert((float *)v6, (uint64_t *)(a3 + 14), v7);
  v11[0] = *(unsigned int *)(a3 + 8) | ((unint64_t)*(unsigned __int16 *)(a3 + 12) << 32);
  v8 = hashtable_lookup(*(_QWORD *)(a2 + 56), (uint64_t)v11);
  if (!v8)
  {
    v9 = _os_trace_calloc();
    *(_QWORD *)v9 = *(unsigned int *)(a3 + 8) | ((unint64_t)*(unsigned __int16 *)(a3 + 12) << 32);
    *(_QWORD *)(v9 + 8) = *(_QWORD *)a3;
    *(_OWORD *)(v9 + 16) = *(_OWORD *)(a3 + 14);
    if ((hashtable_insert(*(int **)(a2 + 56), (_QWORD *)v9, v9) & 1) == 0)
    {
      _os_assert_log();
      _os_crash();
      __break(1u);
    }
    ++*(_QWORD *)(a1 + 48);
  }
  return v8 != 0;
}

uint64_t _catalog_procinfo_uuidinfo_remove(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v5;
  unsigned int (*v6)(_QWORD, _QWORD *);
  _QWORD *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v10[0] = a3;
  v3 = *(_QWORD *)(a2 + 56);
  if (*(_QWORD *)(v3 + 16))
  {
    v5 = (_QWORD *)(*(_QWORD *)(v3 + 16)
                  + 8
                  * (((unsigned int (**)(_QWORD *))hash_fn_array)[*(unsigned __int8 *)(v3 + 8)](v10)
                   % *(_DWORD *)v3));
    v6 = (unsigned int (*)(_QWORD, _QWORD *))hashkey_compare_array[*(unsigned __int8 *)(v3 + 8)];
    while (1)
    {
      v7 = v5;
      v5 = (_QWORD *)*v5;
      if (!v5)
        break;
      if (v6(v5[1], v10))
      {
        *v7 = *v5;
        v8 = (void *)v5[2];
        free(v5);
        --*(_DWORD *)(v3 + 4);
        if (!v8)
          return 0;
        --*(_QWORD *)(a1 + 48);
        free(v8);
        return 1;
      }
    }
  }
  return 0;
}

uint64_t _catalog_procinfo_lookup_subsystem(uint64_t a1, __int16 a2)
{
  __int16 v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  return hashtable_lookup(*(_QWORD *)(a1 + 64), (uint64_t)&v3);
}

uint64_t _catalog_lookup_procinfo_by_procid(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    v3 = (_QWORD *)(v2 + 16);
    while (1)
    {
      v3 = (_QWORD *)*v3;
      if (!v3)
        break;
      if (v3[2] == a2)
        return v3[4];
    }
  }
  return 0;
}

_QWORD *_catalog_lookup_procinfo_by_procinfo_key(uint64_t a1, uint64_t a2, unsigned int a3)
{
  return _os_procinfo_map_lookup(*(_QWORD **)(a1 + 40), a2, a3);
}

uint64_t _catalog_procinfo_create(uint64_t a1, uint64_t a2)
{
  uint64_t *v4;
  _QWORD *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;

  v4 = (uint64_t *)(a1 + 40);
  v5 = _os_procinfo_map_lookup(*(_QWORD **)(a1 + 40), *(_QWORD *)(a2 + 8), *(_DWORD *)(a2 + 16));
  if (v5)
    return (uint64_t)v5;
  v6 = _os_trace_calloc();
  v5 = (_QWORD *)v6;
  *(_OWORD *)v6 = *(_OWORD *)a2;
  v7 = *(_OWORD *)(a2 + 16);
  v8 = *(_OWORD *)(a2 + 32);
  v9 = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(v6 + 64) = *(_QWORD *)(a2 + 64);
  *(_OWORD *)(v6 + 32) = v8;
  *(_OWORD *)(v6 + 48) = v9;
  *(_OWORD *)(v6 + 16) = v7;
  v10 = *v4;
  if (*v4)
    LOWORD(v10) = *(_WORD *)(v10 + 24);
  *(_WORD *)v6 = v10;
  v11 = *(_QWORD *)(a1 + 16);
  if (v11)
    v12 = *(_QWORD *)(v11 + 24);
  else
    v12 = 0;
  _os_trace_uuid_map_insert((float *)v11, v5 + 3, v12);
  if (!uuid_is_null((const unsigned __int8 *)v5 + 40))
  {
    v13 = *(_QWORD *)(a1 + 16);
    if (v13)
      v14 = *(_QWORD *)(v13 + 24);
    else
      v14 = 0;
    _os_trace_uuid_map_insert((float *)v13, v5 + 5, v14);
  }
  v15 = _os_trace_calloc();
  *(_QWORD *)v15 = 16;
  *(_BYTE *)(v15 + 8) = 2;
  *(_QWORD *)(v15 + 16) = _os_trace_calloc();
  v5[7] = v15;
  v16 = _os_trace_calloc();
  *(_QWORD *)v16 = 16;
  *(_BYTE *)(v16 + 8) = 1;
  *(_QWORD *)(v16 + 16) = _os_trace_calloc();
  v5[8] = v16;
  if ((_os_procinfo_map_insert(v4, v5[1], *((_DWORD *)v5 + 4), (uint64_t)v5) & 1) != 0)
    return (uint64_t)v5;
  _os_assert_log();
  result = _os_crash();
  __break(1u);
  return result;
}

uint64_t ___catalog_for_each_procinfo_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

_QWORD *_catalog_subchunk_update_times(uint64_t a1, unint64_t a2)
{
  _QWORD *result;

  if (*(_QWORD *)(a1 + 80))
    result = **(_QWORD ***)(*(_QWORD *)(a1 + 72) + 8);
  else
    result = _catalog_subchunk_entry_alloc(a1);
  if (result[2] > a2)
    result[2] = a2;
  if (result[3] < a2)
    result[3] = a2;
  return result;
}

uint64_t _catalog_subchunk_procinfo_add(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t result;

  if (*(_QWORD *)(a1 + 80))
    v4 = **(_QWORD ***)(*(_QWORD *)(a1 + 72) + 8);
  else
    v4 = _catalog_subchunk_entry_alloc(a1);
  if (_os_procinfo_map_lookup(*(_QWORD **)(a1 + 40), *(_QWORD *)(a2 + 8), *(_DWORD *)(a2 + 16)))
    return hashtable_insert((int *)v4[6], (_QWORD *)a2, 0);
  _os_assert_log();
  result = _os_crash();
  __break(1u);
  return result;
}

uint64_t catalog_subchunk_string_insert(uint64_t a1, __int16 a2)
{
  _QWORD *v2;
  __int16 v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (*(_QWORD *)(a1 + 80))
    v2 = **(_QWORD ***)(*(_QWORD *)(a1 + 72) + 8);
  else
    v2 = _catalog_subchunk_entry_alloc(a1);
  return hashtable_insert((int *)v2[5], &v4, 0);
}

BOOL catalog_chunk_parse_section(unint64_t *a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t *v4;
  BOOL v5;

  v4 = (unint64_t *)*a1;
  if ((!a2 || (a2 >= (unint64_t)v4 ? (v5 = a2 - (unint64_t)v4 >= 8) : (v5 = 0), v5))
    && (*a1 = (unint64_t)(v4 + 1), v4))
  {
    return catalog_chunk_parse_entries(a1, a2, a3, *v4, a4);
  }
  else
  {
    return 0;
  }
}

_QWORD *_catalog_create()
{
  _QWORD *v0;
  uint64_t v1;

  v0 = (_QWORD *)_os_trace_calloc();
  v0[8] = 0;
  v0[9] = v0 + 8;
  v0[1] = -1;
  v1 = operator new();
  *(_OWORD *)v1 = 0u;
  *(_OWORD *)(v1 + 16) = 0u;
  *(_DWORD *)(v1 + 32) = 1065353216;
  v0[2] = v1;
  return v0;
}

uint64_t _catalog_update_earliest_fhbuf_ts(uint64_t result, unint64_t a2)
{
  if (*(_QWORD *)(result + 8) > a2)
    *(_QWORD *)(result + 8) = a2;
  return result;
}

uint64_t __catalog_chunk_parse_uuid_legacy_block_invoke(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  _os_trace_uuid_map_insert(*(float **)(*(_QWORD *)(a1 + 32) + 16), a3, a2);
  if (*(_BYTE *)(a1 + 40))
    _chunk_print_uuid(a2, (unsigned __int8 *)a3);
  return 1;
}

uint64_t __catalog_chunk_parse_procinfo_legacy_block_invoke(uint64_t a1, unint64_t a2, unsigned __int16 *a3, unsigned __int16 **a4)
{
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  int v29;
  __int128 v30;
  uuid_string_t out;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  if (v8)
  {
    v9 = (_QWORD *)(v8 + 16);
    while (1)
    {
      v9 = (_QWORD *)*v9;
      if (!v9)
        break;
      if (v9[2] == *((_QWORD *)a3 + 1))
      {
        if (v9[4])
          return 1;
        break;
      }
    }
  }
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(_DWORD *)(v10 + 4);
  v12 = v10 + 40;
  v13 = v10 + 32;
  v14 = v11 == 17;
  if (v11 == 17)
    v15 = v10 + 40;
  else
    v15 = v10 + 32;
  v16 = *(unsigned __int16 *)(v10 + 16);
  v17 = v12 + v16;
  v18 = v13 + v16;
  if (v14)
    v19 = v17;
  else
    v19 = v18;
  v20 = _os_trace_calloc();
  v21 = v20;
  v22 = *a3;
  v23 = v19 - v15;
  if (v23 >= 16 * v22 && v23 - 16 * v22 > 0xF)
    *(_OWORD *)(v20 + 24) = *(_OWORD *)(v15 + 16 * v22);
  else
    _os_assumes_log();
  v25 = a3[1];
  if (v23 >= 16 * v25 && v23 - 16 * v25 > 0xF)
    *(_OWORD *)(v21 + 40) = *(_OWORD *)(v15 + 16 * v25);
  else
    _os_assumes_log();
  *(_DWORD *)(v21 + 4) = *((_DWORD *)a3 + 1);
  *(_QWORD *)(v21 + 8) = *((_QWORD *)a3 + 1);
  if (a2 >= 0x10000)
    _os_assumes_log();
  *(_WORD *)v21 = a2;
  *(_WORD *)(v21 + 2) = 0x8000;
  v27 = _os_trace_calloc();
  *(_QWORD *)v27 = 16;
  *(_BYTE *)(v27 + 8) = 2;
  *(_QWORD *)(v27 + 16) = _os_trace_calloc();
  *(_QWORD *)(v21 + 56) = v27;
  v28 = _os_trace_calloc();
  *(_QWORD *)v28 = 16;
  *(_BYTE *)(v28 + 8) = 1;
  *(_QWORD *)(v28 + 16) = _os_trace_calloc();
  *(_QWORD *)(v21 + 64) = v28;
  v29 = *(unsigned __int8 *)(a1 + 56);
  if (*(_BYTE *)(a1 + 56))
  {
    printf("[%03u]\n\t%10s : %llu\n\t%10s : %u\n", (unsigned __int16)a2, "proc id", *(_QWORD *)(v21 + 8), "pid", *(_DWORD *)(v21 + 4));
    v29 = *(unsigned __int8 *)(a1 + 56);
    if (*(_BYTE *)(a1 + 56))
    {
      *(_QWORD *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
      *(_QWORD *)&v30 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)out = v30;
      *(_OWORD *)&out[16] = v30;
      uuid_unparse((const unsigned __int8 *)(v21 + 24), out);
      if (*(_BYTE *)(a1 + 56))
        printf("\t%10s : %s\n", "main uuid", out);
      uuid_unparse((const unsigned __int8 *)(v21 + 40), out);
      v29 = *(unsigned __int8 *)(a1 + 56);
      if (*(_BYTE *)(a1 + 56))
      {
        printf("\t%10s : %s\n", "dsc uuid", out);
        v29 = *(unsigned __int8 *)(a1 + 56);
      }
    }
  }
  if ((catalog_chunk_parse_procinfo_uuidinfo(a4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), v21, v29 != 0, *(_QWORD *)(a1 + 40)) & 1) != 0&& (catalog_chunk_parse_procinfo_subsystem(a4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), v21, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    if ((_os_procinfo_map_insert((uint64_t *)(*(_QWORD *)(a1 + 32) + 40), *(_QWORD *)(v21 + 8), *(_DWORD *)(v21 + 16), v21) & 1) == 0)_os_assumes_log();
    return 1;
  }
  else
  {
    _catalog_procinfo_free((unsigned int **)v21);
    return 0;
  }
}

uint64_t __catalog_chunk_parse_subchunk_legacy_block_invoke(uint64_t a1, unsigned __int16 a2, uint64_t *a3, unint64_t *a4)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v15;
  unint64_t v17;

  v8 = _catalog_subchunk_entry_alloc(*(_QWORD *)(a1 + 32));
  v9 = *a3;
  v10 = a3[1];
  v8[2] = *a3;
  v8[3] = v10;
  if (*(_BYTE *)(a1 + 48))
    printf("[%03u]\n\t%10s : %llu\n\t%10s : %llu\n\t%10s : %u\n\t%10s : %u\n", a2, "startts", v9, "endts", v10, "log cnt", *((_DWORD *)a3 + 4), "others cnt", *((_DWORD *)a3 + 5));
  v11 = (unint64_t)a3 + 26;
  *a4 = (unint64_t)a3 + 26;
  v12 = *(_QWORD *)(a1 + 40);
  v13 = *((unsigned __int16 *)a3 + 12);
  if (v12)
  {
    v15 = v12 >= v11;
    v14 = v12 - v11;
    v15 = v15 && v14 >= v13;
    if (!v15)
      return 0;
  }
  v17 = v11 + v13;
  if ((v17 & 7) != 0)
    v17 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
  *a4 = v17;
  return 1;
}

uint64_t __catalog_chunk_parse_activity_legacy_block_invoke()
{
  return 1;
}

uint64_t _chunk_print_uuid(uint64_t a1, unsigned __int8 *uu)
{
  __int128 v3;
  uuid_string_t out;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)out = v3;
  *(_OWORD *)&out[16] = v3;
  uuid_unparse(uu, out);
  return printf("[%03llu] %s\n", a1, out);
}

__n128 __catalog_chunk_unparse_uuid_block_invoke(uint64_t a1, __n128 *a2, unsigned __int16 a3)
{
  __n128 result;

  result = *a2;
  *(__n128 *)(**(_QWORD **)(a1 + 32) + 16 * a3) = *a2;
  return result;
}

char *__catalog_chunk_unparse_subsystem_block_invoke(uint64_t a1, const char *a2, unsigned __int16 a3)
{
  char *result;

  if ((unint64_t)a3 < *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
    return strcpy((char *)(**(_QWORD **)(a1 + 40) + a3), a2);
  _os_assert_log();
  result = (char *)_os_crash();
  __break(1u);
  return result;
}

void __catalog_chunk_unparse_procinfo_block_invoke(_QWORD *a1, uint64_t a2)
{
  unint64_t v4;
  __int16 v5;
  unint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  unsigned int v12;
  void **v13;
  _QWORD *v14;
  void **v15;
  unsigned int *v16;
  uint64_t v17;
  _QWORD *v18;
  void **v19;
  unsigned int *v20;
  size_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void **v26;
  void **v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = _os_trace_uuid_map_lookup(*(_QWORD **)(a1[4] + 16), (_QWORD *)(a2 + 24));
  if (v4 >= 0x10000)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_10;
  }
  v5 = v4;
  if (!uuid_is_null((const unsigned __int8 *)(a2 + 40)))
  {
    v6 = _os_trace_uuid_map_lookup(*(_QWORD **)(a1[4] + 16), (_QWORD *)(a2 + 40));
    if (v6 < 0x10000)
      goto LABEL_5;
LABEL_10:
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  LOWORD(v6) = -1;
LABEL_5:
  v7 = (uint64_t *)a1[5];
  v8 = *v7;
  v9 = *(_QWORD *)(a2 + 8);
  v10 = *(_DWORD *)(a2 + 4);
  v11 = *(_DWORD *)(a2 + 16);
  v12 = *(_DWORD *)(a2 + 20);
  *(_DWORD *)v8 = *(_DWORD *)a2;
  *(_WORD *)(v8 + 4) = v5;
  *(_WORD *)(v8 + 6) = v6;
  *(_QWORD *)(v8 + 8) = v9;
  *(_DWORD *)(v8 + 16) = v11;
  *(_DWORD *)(v8 + 20) = v10;
  *(_QWORD *)(v8 + 24) = v12;
  *v7 = v8 + 32;
  v13 = (void **)a1[5];
  v14 = *v13;
  if (a1[6] - (_QWORD)*v13 > 7uLL)
  {
    v15 = (void **)a1[4];
    *v14 = *(unsigned int *)(*(_QWORD *)(a2 + 56) + 4);
    *v13 = v14 + 1;
    v16 = *(unsigned int **)(a2 + 56);
    v17 = MEMORY[0x1E0C809B0];
    v22 = MEMORY[0x1E0C809B0];
    v23 = 0x40000000;
    v24 = __catalog_chunk_unparse_procinfo_uuidinfo_block_invoke;
    v25 = &__block_descriptor_tmp_80;
    v26 = v15;
    v27 = v13;
    hashtable_iterate(v16, (uint64_t)&v22);
    v13 = (void **)a1[5];
    v18 = *v13;
    if (a1[6] - (_QWORD)*v13 >= 8uLL)
    {
      v19 = (void **)a1[4];
      *v18 = *(unsigned int *)(*(_QWORD *)(a2 + 64) + 4);
      *v13 = v18 + 1;
      v20 = *(unsigned int **)(a2 + 64);
      v22 = v17;
      v23 = 0x40000000;
      v24 = __catalog_chunk_unparse_procinfo_subsystem_block_invoke;
      v25 = &__block_descriptor_tmp_81;
      v26 = v13;
      v27 = v19;
      hashtable_iterate(v20, (uint64_t)&v22);
      v13 = (void **)a1[5];
    }
  }
  v21 = (((unint64_t)*v13 + 7) & 0xFFFFFFFFFFFFFFF8) - (_QWORD)*v13;
  bzero(*v13, v21);
  *(_QWORD *)a1[5] += v21;
}

uint64_t __catalog_chunk_unparse_subchunk_procinfos_block_invoke(uint64_t result, _WORD *a2)
{
  _WORD **v2;
  _WORD *v3;

  v2 = *(_WORD ***)(result + 32);
  v3 = *v2;
  *v3 = *a2;
  *v2 = v3 + 1;
  return result;
}

uint64_t __catalog_chunk_unparse_subchunk_subcats_block_invoke(uint64_t result, _WORD *a2)
{
  _WORD **v2;
  _WORD *v3;

  v2 = *(_WORD ***)(result + 32);
  v3 = *v2;
  *v3 = *a2;
  *v2 = v3 + 1;
  return result;
}

unint64_t __catalog_chunk_unparse_procinfo_uuidinfo_block_invoke(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t result;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;

  result = _os_trace_uuid_map_lookup(*(_QWORD **)(*(_QWORD *)(a1 + 32) + 16), a3 + 2);
  v6 = result;
  if (result >= 0x10000)
    result = _os_assumes_log();
  v7 = **(_QWORD ***)(a1 + 40);
  v8 = *a3;
  v7[1] = *((unsigned __int16 *)v7 + 4) | (unint64_t)(*a3 << 16);
  *v7 = a3[1];
  if (v6 >= 0x10000)
  {
    _os_assert_log();
    result = _os_crash();
    __break(1u);
  }
  else
  {
    v7[1] = (v8 << 16) | (unsigned __int16)v6;
    **(_QWORD **)(a1 + 40) += 16;
  }
  return result;
}

unint64_t __catalog_chunk_unparse_procinfo_subsystem_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _WORD *v5;
  char *v6;
  _QWORD *v7;
  __int16 v8;
  unint64_t result;
  __int16 v10;

  v5 = **(_WORD ***)(a1 + 32);
  *v5 = *(_WORD *)a3;
  v6 = *(char **)(a3 + 8);
  if (!v6 || !*(_QWORD *)(a3 + 16))
  {
    _os_assumes_log();
    v6 = *(char **)(a3 + 8);
  }
  v7 = _os_trace_str_map_lookup(*(_QWORD **)(*(_QWORD *)(a1 + 40) + 24), v6);
  v8 = (__int16)v7;
  if ((unint64_t)v7 >= 0x10000)
    _os_assumes_log();
  v5[1] = v8;
  result = (unint64_t)_os_trace_str_map_lookup(*(_QWORD **)(*(_QWORD *)(a1 + 40) + 24), *(char **)(a3 + 16));
  v10 = result;
  if (result >= 0x10000)
    result = _os_assumes_log();
  v5[2] = v10;
  **(_QWORD **)(a1 + 32) += 6;
  return result;
}

void _tracev3_chunk_decompress_and_enumerate_chunks(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  int v8;
  size_t v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v9[0] = 0xAAAAAAAAAAAAAAAALL;
  v8 = -1431655766;
  v4 = _tracev3_chunk_decompress(a1, a2, (compression_algorithm *)&v8, v9);
  if (v4)
  {
    v5 = 0;
    v6 = v9[0];
    do
    {
      if (v6 - v5 < 0x10)
        break;
      v7 = *(_QWORD *)&v4[v5 + 8];
      if (v6 - v5 - 16 < v7)
        break;
      if (!(*(unsigned int (**)(uint64_t))(a3 + 16))(a3))
        break;
      v5 = (v5 + v7 + 23) & 0xFFFFFFFFFFFFFFF8;
    }
    while (v5 - 1 < v6);
  }
  if (v8)
    free(v4);
}

void _os_activity_map_insert(uint64_t *a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5;
  unint64_t v7;
  uint8x8_t v8;
  unint64_t v9;
  _QWORD *v10;
  _QWORD *i;
  unint64_t v12;
  _QWORD *v13;
  float v14;
  float v15;
  _BOOL8 v16;
  unint64_t v17;
  unint64_t v18;
  int8x8_t prime;
  void *v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  unint64_t v24;
  uint8x8_t v25;
  unint64_t v26;
  uint8x8_t v27;
  uint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  unint64_t v34;
  _QWORD *v35;

  v5 = *a1;
  if (!*a1)
  {
    v5 = operator new();
    *(_OWORD *)v5 = 0u;
    *(_OWORD *)(v5 + 16) = 0u;
    *(_DWORD *)(v5 + 32) = 1065353216;
    *a1 = v5;
  }
  v7 = *(_QWORD *)(v5 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v9 = a2;
      if (v7 <= a2)
        v9 = a2 % v7;
    }
    else
    {
      v9 = (v7 - 1) & a2;
    }
    v10 = *(_QWORD **)(*(_QWORD *)v5 + 8 * v9);
    if (v10)
    {
      for (i = (_QWORD *)*v10; i; i = (_QWORD *)*i)
      {
        v12 = i[1];
        if (v12 == a2)
        {
          if (i[2] == a2)
            return;
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v12 >= v7)
              v12 %= v7;
          }
          else
          {
            v12 &= v7 - 1;
          }
          if (v12 != v9)
            break;
        }
      }
    }
  }
  else
  {
    v9 = 0xAAAAAAAAAAAAAAAALL;
  }
  v13 = operator new(0x20uLL);
  *v13 = 0;
  v13[1] = a2;
  v13[2] = a2;
  v13[3] = a3;
  v14 = (float)(unint64_t)(*(_QWORD *)(v5 + 24) + 1);
  v15 = *(float *)(v5 + 32);
  if (!v7 || (float)(v15 * (float)v7) < v14)
  {
    v16 = 1;
    if (v7 >= 3)
      v16 = (v7 & (v7 - 1)) != 0;
    v17 = v16 | (2 * v7);
    v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18)
      prime = (int8x8_t)v18;
    else
      prime = (int8x8_t)v17;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    }
    v7 = *(_QWORD *)(v5 + 8);
    if (*(_QWORD *)&prime > v7)
      goto LABEL_32;
    if (*(_QWORD *)&prime < v7)
    {
      v26 = vcvtps_u32_f32((float)*(unint64_t *)(v5 + 24) / *(float *)(v5 + 32));
      if (v7 < 3 || (v27 = (uint8x8_t)vcnt_s8((int8x8_t)v7), v27.i16[0] = vaddlv_u8(v27), v27.u32[0] > 1uLL))
      {
        v26 = std::__next_prime(v26);
      }
      else
      {
        v28 = 1 << -(char)__clz(v26 - 1);
        if (v26 >= 2)
          v26 = v28;
      }
      if (*(_QWORD *)&prime <= v26)
        prime = (int8x8_t)v26;
      if (*(_QWORD *)&prime >= v7)
      {
        v7 = *(_QWORD *)(v5 + 8);
      }
      else
      {
        if (prime)
        {
LABEL_32:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:nn180100]();
          v20 = operator new(8 * *(_QWORD *)&prime);
          v21 = *(_QWORD **)v5;
          *(_QWORD *)v5 = v20;
          if (v21)
            operator delete(v21);
          v22 = 0;
          *(int8x8_t *)(v5 + 8) = prime;
          do
            *(_QWORD *)(*(_QWORD *)v5 + 8 * v22++) = 0;
          while (*(_QWORD *)&prime != v22);
          v23 = *(_QWORD **)(v5 + 16);
          if (v23)
          {
            v24 = v23[1];
            v25 = (uint8x8_t)vcnt_s8(prime);
            v25.i16[0] = vaddlv_u8(v25);
            if (v25.u32[0] > 1uLL)
            {
              if (v24 >= *(_QWORD *)&prime)
                v24 %= *(_QWORD *)&prime;
            }
            else
            {
              v24 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)v5 + 8 * v24) = v5 + 16;
            v29 = (_QWORD *)*v23;
            if (*v23)
            {
              do
              {
                v30 = v29[1];
                if (v25.u32[0] > 1uLL)
                {
                  if (v30 >= *(_QWORD *)&prime)
                    v30 %= *(_QWORD *)&prime;
                }
                else
                {
                  v30 &= *(_QWORD *)&prime - 1;
                }
                if (v30 != v24)
                {
                  if (!*(_QWORD *)(*(_QWORD *)v5 + 8 * v30))
                  {
                    *(_QWORD *)(*(_QWORD *)v5 + 8 * v30) = v23;
                    goto LABEL_57;
                  }
                  *v23 = *v29;
                  *v29 = **(_QWORD **)(*(_QWORD *)v5 + 8 * v30);
                  **(_QWORD **)(*(_QWORD *)v5 + 8 * v30) = v29;
                  v29 = v23;
                }
                v30 = v24;
LABEL_57:
                v23 = v29;
                v29 = (_QWORD *)*v29;
                v24 = v30;
              }
              while (v29);
            }
          }
          v7 = (unint64_t)prime;
          goto LABEL_61;
        }
        v35 = *(_QWORD **)v5;
        *(_QWORD *)v5 = 0;
        if (v35)
          operator delete(v35);
        v7 = 0;
        *(_QWORD *)(v5 + 8) = 0;
      }
    }
LABEL_61:
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= a2)
        v9 = a2 % v7;
      else
        v9 = a2;
    }
    else
    {
      v9 = (v7 - 1) & a2;
    }
  }
  v31 = *(_QWORD **)v5;
  v32 = *(_QWORD **)(*(_QWORD *)v5 + 8 * v9);
  if (v32)
  {
    *v13 = *v32;
LABEL_74:
    *v32 = v13;
    goto LABEL_75;
  }
  v33 = *(_QWORD *)(v5 + 16);
  *v13 = v33;
  *(_QWORD *)(v5 + 16) = v13;
  v31[v9] = v5 + 16;
  if (v33)
  {
    v34 = *(_QWORD *)(v33 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v34 >= v7)
        v34 %= v7;
    }
    else
    {
      v34 &= v7 - 1;
    }
    v32 = (_QWORD *)(*(_QWORD *)v5 + 8 * v34);
    goto LABEL_74;
  }
LABEL_75:
  ++*(_QWORD *)(v5 + 24);
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
  abort();
}

_QWORD *std::string::basic_string[abi:nn180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    abort();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](uint64_t *a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v72;
  unint64_t v73;

  if (a2 > 0x20)
  {
    if (a2 <= 0x40)
    {
      v5 = *(uint64_t *)((char *)a1 + a2 - 16);
      v6 = *a1 - 0x3C5A37A36834CED9 * (v5 + a2);
      v8 = a1[2];
      v7 = a1[3];
      v9 = __ROR8__(v6 + v7, 52);
      v10 = v6 + a1[1];
      v11 = __ROR8__(v10, 7);
      v12 = v10 + v8;
      v13 = *(uint64_t *)((char *)a1 + a2 - 32) + v8;
      v14 = *(uint64_t *)((char *)a1 + a2 - 8) + v7;
      v15 = __ROR8__(v14 + v13, 52);
      v16 = v11 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v5 + a2), 37) + v9;
      v17 = __ROR8__(v13, 37);
      v18 = *(uint64_t *)((char *)a1 + a2 - 24) + v13;
      v19 = __ROR8__(v18, 7);
      v20 = v16 + __ROR8__(v12, 31);
      v21 = v18 + v5;
      v22 = v21 + v14;
      v23 = 0x9AE16A3B2F90404FLL;
      v24 = 0xC3A5C85C97CB3127 * (v22 + v20) - 0x651E95C4D06FBFB1 * (v12 + v7 + v17 + v19 + v15 + __ROR8__(v21, 31));
      v25 = v20 - 0x3C5A37A36834CED9 * (v24 ^ (v24 >> 47));
      return (v25 ^ (v25 >> 47)) * v23;
    }
    v4 = 0x9DDFEA08EB382D69;
    v32 = *(uint64_t *)((char *)a1 + a2 - 48);
    v33 = *(uint64_t *)((char *)a1 + a2 - 40);
    v34 = *(uint64_t *)((char *)a1 + a2 - 24);
    v36 = *(uint64_t *)((char *)a1 + a2 - 64);
    v35 = *(uint64_t *)((char *)a1 + a2 - 56);
    v37 = *(uint64_t *)((char *)a1 + a2 - 16);
    v38 = *(uint64_t *)((char *)a1 + a2 - 8);
    v39 = v35 + v37;
    v40 = 0x9DDFEA08EB382D69
        * (v34 ^ ((0x9DDFEA08EB382D69 * (v34 ^ (v32 + a2))) >> 47) ^ (0x9DDFEA08EB382D69 * (v34 ^ (v32 + a2))));
    v41 = 0x9DDFEA08EB382D69 * (v40 ^ (v40 >> 47));
    v42 = v36 + a2 + v35 + v32;
    v43 = v42 + v33;
    v44 = __ROR8__(v42, 44) + v36 + a2 + __ROR8__(v33 + v36 + a2 - 0x622015F714C7D297 * (v40 ^ (v40 >> 47)), 21);
    v45 = v35 + v37 + *(uint64_t *)((char *)a1 + a2 - 32) - 0x4B6D499041670D8DLL;
    v46 = v45 + v34 + v37;
    v47 = __ROR8__(v46, 44);
    v48 = v46 + v38;
    v49 = v47 + v45 + __ROR8__(v45 + v33 + v38, 21);
    v51 = *a1;
    v50 = a1 + 4;
    v52 = v51 - 0x4B6D499041670D8DLL * v33;
    v53 = -(uint64_t)((a2 - 1) & 0xFFFFFFFFFFFFFFC0);
    do
    {
      v54 = *(v50 - 3);
      v55 = v52 + v43 + v39 + v54;
      v56 = v50[2];
      v57 = v50[3];
      v58 = v50[1];
      v39 = v58 + v43 - 0x4B6D499041670D8DLL * __ROR8__(v39 + v44 + v56, 42);
      v59 = v41 + v48;
      v60 = *(v50 - 2);
      v61 = *(v50 - 1);
      v62 = *(v50 - 4) - 0x4B6D499041670D8DLL * v44;
      v63 = v62 + v48 + v61;
      v64 = v62 + v54 + v60;
      v43 = v64 + v61;
      v65 = __ROR8__(v64, 44) + v62;
      v66 = (0xB492B66FBE98F273 * __ROR8__(v55, 37)) ^ v49;
      v52 = 0xB492B66FBE98F273 * __ROR8__(v59, 33);
      v44 = v65 + __ROR8__(v63 + v66, 21);
      v67 = v52 + v49 + *v50;
      v48 = v67 + v58 + v56 + v57;
      v49 = __ROR8__(v67 + v58 + v56, 44) + v67 + __ROR8__(v39 + v60 + v67 + v57, 21);
      v50 += 8;
      v41 = v66;
      v53 += 64;
    }
    while (v53);
    v68 = v52
        - 0x622015F714C7D297
        * ((0x9DDFEA08EB382D69
          * (v49 ^ ((0x9DDFEA08EB382D69 * (v49 ^ v44)) >> 47) ^ (0x9DDFEA08EB382D69 * (v49 ^ v44)))) ^ ((0x9DDFEA08EB382D69 * (v49 ^ ((0x9DDFEA08EB382D69 * (v49 ^ v44)) >> 47) ^ (0x9DDFEA08EB382D69 * (v49 ^ v44)))) >> 47));
    v69 = 0x9DDFEA08EB382D69
        * (v68 ^ (v66
                - 0x4B6D499041670D8DLL * (v39 ^ (v39 >> 47))
                - 0x622015F714C7D297
                * ((0x9DDFEA08EB382D69
                  * (v48 ^ ((0x9DDFEA08EB382D69 * (v48 ^ v43)) >> 47) ^ (0x9DDFEA08EB382D69 * (v48 ^ v43)))) ^ ((0x9DDFEA08EB382D69 * (v48 ^ ((0x9DDFEA08EB382D69 * (v48 ^ v43)) >> 47) ^ (0x9DDFEA08EB382D69 * (v48 ^ v43)))) >> 47))));
    v70 = 0x9DDFEA08EB382D69 * (v68 ^ (v69 >> 47) ^ v69);
    goto LABEL_13;
  }
  if (a2 > 0x10)
  {
    v26 = a1[1];
    v27 = 0xB492B66FBE98F273 * *a1;
    v28 = __ROR8__(0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + a2 - 8), 30) + __ROR8__(v27 - v26, 43);
    v29 = v27 + a2 + __ROR8__(v26 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + a2 - 8);
    v23 = 0x9DDFEA08EB382D69;
    v30 = 0x9DDFEA08EB382D69 * (v29 ^ (v28 - 0x3C5A37A36834CED9 * *(uint64_t *)((char *)a1 + a2 - 16)));
    v31 = v29 ^ (v30 >> 47) ^ v30;
LABEL_8:
    v25 = 0x9DDFEA08EB382D69 * v31;
    return (v25 ^ (v25 >> 47)) * v23;
  }
  if (a2 < 9)
  {
    if (a2 >= 4)
    {
      v72 = *(unsigned int *)((char *)a1 + a2 - 4);
      v23 = 0x9DDFEA08EB382D69;
      v73 = 0x9DDFEA08EB382D69 * (((8 * *(_DWORD *)a1) + a2) ^ v72);
      v31 = v72 ^ (v73 >> 47) ^ v73;
      goto LABEL_8;
    }
    v4 = 0x9AE16A3B2F90404FLL;
    if (!a2)
      return v4;
    v70 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                   * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
LABEL_13:
    v4 *= v70 ^ (v70 >> 47);
    return v4;
  }
  v2 = *(uint64_t *)((char *)a1 + a2 - 8);
  v3 = __ROR8__(v2 + a2, a2);
  return (0x9DDFEA08EB382D69
        * ((0x9DDFEA08EB382D69
          * (v3 ^ ((0x9DDFEA08EB382D69 * (v3 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v3 ^ *a1)))) ^ ((0x9DDFEA08EB382D69 * (v3 ^ ((0x9DDFEA08EB382D69 * (v3 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v3 ^ *a1)))) >> 47))) ^ v2;
}

BOOL std::equal_to<std::string>::operator()[abi:nn180100](unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  BOOL v12;
  BOOL v13;
  _BOOL8 v14;

  v2 = a1[23];
  if ((v2 & 0x80u) == 0)
    v3 = a1[23];
  else
    v3 = *((_QWORD *)a1 + 1);
  v4 = a2[23];
  v5 = (char)v4;
  if ((v4 & 0x80u) != 0)
    v4 = *((_QWORD *)a2 + 1);
  if (v3 != v4)
    return 0;
  if (v5 < 0)
    a2 = *(unsigned __int8 **)a2;
  if ((v2 & 0x80) != 0)
    return memcmp(*(const void **)a1, a2, *((_QWORD *)a1 + 1)) == 0;
  if (!a1[23])
    return 1;
  v6 = v2 - 1;
  do
  {
    v8 = *a1++;
    v7 = v8;
    v10 = *a2++;
    v9 = v10;
    v12 = v6-- != 0;
    v13 = v7 == v9;
    v14 = v7 == v9;
  }
  while (v13 && v12);
  return v14;
}

_QWORD *_os_trace_str_map_lookup(_QWORD *result, char *a2)
{
  _QWORD *v2;
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  void *__p[2];
  char v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = result;
    std::string::basic_string[abi:nn180100]<0>(__p, a2);
    v3 = std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::find<std::string>(v2, (uint64_t)__p);
    v4 = v3;
    if (v6 < 0)
    {
      operator delete(__p[0]);
      if (v4)
        return (_QWORD *)*((_QWORD *)v4 + 5);
    }
    else if (v3)
    {
      return (_QWORD *)*((_QWORD *)v4 + 5);
    }
    return 0;
  }
  return result;
}

uint64_t _os_trace_str_map_for_each(uint64_t result, uint64_t a2)
{
  uint64_t *i;
  _QWORD *v4;

  if (result)
  {
    for (i = *(uint64_t **)(result + 16); i; i = (uint64_t *)*i)
    {
      v4 = i + 2;
      if (*((char *)i + 39) < 0)
        v4 = (_QWORD *)*v4;
      result = (*(uint64_t (**)(uint64_t, _QWORD *, uint64_t))(a2 + 16))(a2, v4, i[5]);
    }
  }
  return result;
}

uint64_t _os_trace_persistdir_path()
{
  if (_os_trace_shared_paths_init_once != -1)
    dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
  return _os_trace_persist_path;
}

void ___os_trace_shared_paths_init_block_invoke()
{
  _os_trace_persist_path = (uint64_t)"/private/var/db/diagnostics";
  _os_trace_timesync_path = (uint64_t)"/private/var/db/diagnostics/timesync";
  _os_trace_uuidtext_path = (uint64_t)"/private/var/db/uuidtext";
}

uint64_t _os_trace_timesyncdir_path()
{
  if (_os_trace_shared_paths_init_once != -1)
    dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
  return _os_trace_timesync_path;
}

uint64_t _os_trace_uuiddb_path()
{
  if (_os_trace_shared_paths_init_once != -1)
    dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
  return _os_trace_uuidtext_path;
}

uint64_t _os_trace_get_path(int a1)
{
  uint64_t result;

  switch(a1)
  {
    case 0:
      if (_os_trace_shared_paths_init_once != -1)
        dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
      result = _os_trace_persist_path;
      break;
    case 1:
      if (_os_trace_shared_paths_init_once != -1)
        dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
      result = _os_trace_timesync_path;
      break;
    case 2:
      if (_os_trace_shared_paths_init_once != -1)
        dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
      result = _os_trace_uuidtext_path;
      break;
    case 3:
      result = _os_trace_prefsdir_path();
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t ___timesync_convert_tracev3_block_invoke(uint64_t a1, unsigned __int8 *src)
{
  _QWORD *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (*(_DWORD *)src == 4096 && *((_QWORD *)src + 1) >= 0xA8uLL)
  {
    v3 = *(_QWORD **)(a1 + 32);
    if (*(_QWORD *)((char *)v3 + 4) != *((_QWORD *)src + 18) || *(_QWORD *)((char *)v3 + 12) != *((_QWORD *)src + 19))
    {
      v4 = v3[4];
      v5 = v3[5];
      v6 = v3[3];
      if (v4 >= v5)
      {
        v7 = 2 * v5;
        v6 = _os_trace_realloc();
        v3[3] = v6;
        v3[5] = v7;
        v4 = v3[4];
      }
      v3[4] = v4 + 1;
      v8 = v6 + (v4 << 6);
      v9 = *((_QWORD *)src + 4);
      v10 = *((_DWORD *)src + 10);
      v11 = *((_QWORD *)src + 2);
      v12 = *((_QWORD *)src + 8);
      v13 = *(_QWORD *)(src + 44);
      *(_QWORD *)v8 = 0;
      *(_QWORD *)(v8 + 8) = 0;
      *(_QWORD *)(v8 + 16) = 0;
      *(_QWORD *)(v8 + 24) = v9;
      *(_DWORD *)(v8 + 32) = v10;
      *(_QWORD *)(v8 + 40) = v13;
      *(_QWORD *)(v8 + 48) = v11;
      *(_QWORD *)(v8 + 56) = v12;
      uuid_copy((unsigned __int8 *)(v3[3] + (v4 << 6) + 8), src + 144);
    }
  }
  return 1;
}

uint64_t ___timesync_converter_close_block_invoke_2(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  unint64_t v3;
  unint64_t v4;
  BOOL v5;
  unsigned int v6;

  if (*a2 == *a3)
  {
    v3 = a2[7];
    v4 = a3[7];
    v5 = v3 == v4;
    if (v3 < v4)
      v6 = -1;
    else
      v6 = 1;
    if (v5)
      return 0;
    else
      return v6;
  }
  else if (*a2 < *a3)
  {
    return 0xFFFFFFFFLL;
  }
  else
  {
    return 1;
  }
}

uint64_t ___timesync_converter_close_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  BOOL v7;
  unsigned int v8;

  v3 = *(_QWORD *)(a2 + 24);
  v4 = *(_QWORD *)(a3 + 24);
  if (v3 == v4)
  {
    v5 = *(_DWORD *)(a2 + 32);
    v6 = *(_DWORD *)(a3 + 32);
    v7 = v5 == v6;
    if (v5 < v6)
      v8 = -1;
    else
      v8 = 1;
    if (v7)
      return 0;
    else
      return v8;
  }
  else if (v3 < v4)
  {
    return 0xFFFFFFFFLL;
  }
  else
  {
    return 1;
  }
}

uint64_t _timesync_validate(uint64_t a1, uint64_t a2, unint64_t *a3, _QWORD *a4)
{
  char *v6;
  uint64_t v7;
  unint64_t i;
  unint64_t v9;
  char *v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;

  v6 = (char *)_os_trace_mmap_at();
  if (!v6)
  {
    v7 = 0xFFFFFFFFLL;
    if (!*__error())
      return v7;
LABEL_28:
    _os_assumes_log();
    return v7;
  }
  for (i = 0; i <= 0xAAAAAAAAAAAAAAAALL; i = v9 + v12)
  {
    if (i >= 0xAAAAAAAAAAAAAAAALL)
    {
      v13 = munmap(v6, 0xAAAAAAAAAAAAAAAALL);
      v14 = 1;
      v7 = 1;
      goto LABEL_25;
    }
    v9 = i;
    v10 = &v6[i];
    v11 = *(unsigned __int16 *)&v6[i];
    if (v11 > 48047)
    {
      if (v11 == 48048)
      {
        if (*((_WORD *)v10 + 1) != 48)
          break;
        v12 = 48;
      }
      else
      {
        if (v11 != 57005)
          break;
        v12 = *((unsigned __int16 *)v10 + 1);
      }
      continue;
    }
    if (v11 == 27986)
    {
      if (*((_WORD *)v10 + 1) != 88)
        break;
      v12 = 88;
      continue;
    }
    if (v11 != 29524 || *((_WORD *)v10 + 1) != 32)
      break;
    v12 = 32;
  }
  if (a3)
    *a3 = v9;
  if (a4)
    *a4 = *(_QWORD *)v10;
  v13 = munmap(v6, 0xAAAAAAAAAAAAAAAALL);
  v14 = 0;
  v7 = 0;
LABEL_25:
  if (v13 == -1)
  {
    __error();
    v7 = v14;
    goto LABEL_28;
  }
  return v7;
}

uint64_t _timesync_repair(int a1, const char *a2, uint64_t a3)
{
  int v4;
  int v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  unsigned int v11;
  unsigned int v12;
  unint64_t v13;
  unsigned __int16 v14;
  char *v15;
  unint64_t v16;
  unsigned __int16 v17;
  uint64_t v18;
  int v19;
  uint64_t result;
  int v21;

  v4 = openat(a1, a2, 16777478);
  if (v4 == -1)
  {
    __error();
    _os_assumes_log();
    return 0xFFFFFFFFLL;
  }
  v5 = v4;
  v6 = _os_trace_mmap_at();
  if (v6)
  {
    v7 = (char *)v6;
    v8 = 0;
    v9 = 0;
    while (1)
    {
      v10 = &v7[v8];
      v11 = *(unsigned __int16 *)&v7[v8];
      if (v11 > 0xBBAF)
      {
        if (v11 == 48048)
        {
          if (*((_WORD *)v10 + 1) != 48)
            goto LABEL_22;
          v12 = 48;
        }
        else
        {
          if (v11 != 57005)
            goto LABEL_22;
          v12 = *((unsigned __int16 *)v10 + 1);
        }
      }
      else if (v11 == 27986)
      {
        if (*((_WORD *)v10 + 1) != 88)
          goto LABEL_22;
        v12 = 88;
      }
      else
      {
        if (v11 != 29524 || *((_WORD *)v10 + 1) != 32)
        {
LABEL_22:
          v14 = *(_WORD *)&v7[v8];
          v15 = &v7[v8];
          v16 = 0xAAAAAAAAAAAAAAAALL - v8;
          while (1)
          {
            if (v14 == 27986)
            {
              if (*((_WORD *)v15 + 1) == 88)
                goto LABEL_34;
            }
            else if (v14 == 29524)
            {
              if (*((_WORD *)v15 + 1) == 32)
                goto LABEL_34;
            }
            else if (v14 == 48048 && *((_WORD *)v15 + 1) == 48)
            {
LABEL_34:
              v13 = v15 - v10;
LABEL_35:
              if (v13 >= 0xFFFF)
              {
                LOWORD(v12) = -8;
              }
              else
              {
LABEL_36:
                LOWORD(v12) = v13;
                if (!(_WORD)v13)
                {
                  LOWORD(v12) = *((_WORD *)v10 + 1);
                  goto LABEL_43;
                }
              }
              (*(void (**)(uint64_t, unint64_t))(a3 + 16))(a3, v8);
              if (lseek(v5, v8, 0) == -1 || (v18 = _os_trace_write(), v18 == -1))
              {
                __error();
                _os_assumes_log();
              }
              else if ((v18 & 0x8000000000000000) == 0)
              {
                v9 = (v9 + 1);
                goto LABEL_43;
              }
              v9 = 0xFFFFFFFFLL;
LABEL_50:
              if (munmap(v7, 0xAAAAAAAAAAAAAAAALL) == -1)
              {
                __error();
                _os_assumes_log();
              }
              if (close(v5) != -1)
                return v9;
              v21 = *__error();
              result = *__error();
              if (v21 != 9)
              {
LABEL_55:
                _os_assumes_log();
                __error();
                _os_assumes_log();
                return v9;
              }
              qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
              qword_1EE52EA88 = result;
              __break(1u);
              goto LABEL_57;
            }
            if (v16 <= 7)
            {
              v13 = (unsigned __int16)(-21846 - v8);
              goto LABEL_35;
            }
            v16 -= 8;
            v17 = *((_WORD *)v15 + 4);
            v15 += 8;
            v14 = v17;
          }
        }
        v12 = 32;
      }
      if (v8 + v12 > 0xAAAAAAAAAAAAAAAALL)
      {
        LOWORD(v13) = -21846 - v8;
        goto LABEL_36;
      }
LABEL_43:
      v8 += (unsigned __int16)v12;
      if (v8 >= 0xAAAAAAAAAAAAAAAALL)
        goto LABEL_50;
    }
  }
  if (*__error())
    _os_assumes_log();
  if (close(v5) != -1)
    return 0xFFFFFFFFLL;
  v19 = *__error();
  result = *__error();
  if (v19 != 9)
  {
    v9 = 0xFFFFFFFFLL;
    goto LABEL_55;
  }
LABEL_57:
  qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EE52EA88 = result;
  __break(1u);
  return result;
}

uint64_t _timesync_db_open(const char *a1)
{
  return _timesync_db_openat(-2, a1);
}

uint64_t _timesync_db_dup(int *a1)
{
  return _timesync_db_openat(*a1, ".");
}

uint64_t _timesync_mach_timebase(uint64_t result, _QWORD *a2)
{
  *a2 = *(_QWORD *)(result + 80);
  return result;
}

unint64_t _timesync_wall_time_to_continuous(uint64_t a1, unint64_t a2, unint64_t a3, _OWORD *a4)
{
  unint64_t v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = 0;
  *a4 = *(_OWORD *)_timesync_range_find_startboot(a1, a2, a3, v5);
  return v5[0];
}

_QWORD **_timesync_range_create_impl(uint64_t a1, unint64_t a2, unint64_t a3, int a4)
{
  unint64_t *v8;
  uint64_t v9;
  uint64_t *startboot;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  float *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  _QWORD **v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  BOOL v24;
  _QWORD *v25;
  int8x8_t v26;
  unint64_t v27;
  uint8x8_t v28;
  _QWORD *v29;
  _QWORD *v30;
  unint64_t v31;
  _QWORD *v32;
  unint64_t v33;
  unint64_t v34;
  _QWORD *v35;
  __n128 *i;
  _QWORD v38[2];
  __n128 (*v39)(uint64_t, __n128 *, uint64_t);
  void *v40;
  _QWORD **v41;
  _QWORD v42[2];
  BOOL (*v43)(uint64_t, uint64_t, unint64_t);
  void *v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = (unint64_t *)_os_trace_zalloc();
  *v8 = 0;
  *(_OWORD *)(v8 + 1) = xmmword_19EA7F230;
  v9 = operator new();
  *(_OWORD *)v9 = 0u;
  *(_OWORD *)(v9 + 16) = 0u;
  *(_DWORD *)(v9 + 32) = 1065353216;
  *v8 = v9;
  startboot = (uint64_t *)_timesync_range_find_startboot(a1, a2, a3, v8 + 1);
  v11 = 1;
  _os_trace_uuid_map_insert((float *)*v8, startboot, 1);
  v12 = *startboot;
  v13 = startboot[1];
  v14 = *(_QWORD *)(a1 + 112) + (a3 - *(_QWORD *)(a1 + 120)) * *(unsigned int *)(a1 + 84) / *(unsigned int *)(a1 + 80);
  v8[2] = v14;
  if (*(_QWORD *)(a1 + 48))
  {
    v11 = 1;
    do
    {
      _timesync_advance(a1);
      v15 = *(_QWORD *)(a1 + 120);
      if (*(_QWORD *)(a1 + 64) != v12 || *(_QWORD *)(a1 + 72) != v13)
      {
        v16 = (float *)*v8;
        if (*v8)
          v17 = *((_QWORD *)v16 + 3);
        else
          v17 = 0;
        if ((_os_trace_uuid_map_insert(v16, (uint64_t *)(a1 + 64), v17 + 1) & 1) == 0)
          _os_assumes_log();
        v12 = *(_QWORD *)(a1 + 64);
        v13 = *(_QWORD *)(a1 + 72);
      }
      if (v15 <= a3)
      {
        v18 = _os_trace_uuid_map_lookup((_QWORD *)*v8, (_QWORD *)(a1 + 64));
        if (v18)
          v11 = v18;
        v19 = *(_QWORD *)(a1 + 112)
            + (a3 - *(_QWORD *)(a1 + 120)) * *(unsigned int *)(a1 + 84) / *(unsigned int *)(a1 + 80);
        v8[2] = v19;
        if ((a4 & (v19 > v14)) != 0)
          v14 = v19;
      }
    }
    while (*(_QWORD *)(a1 + 48));
  }
  if (a3 != -1 && a4 && v14 > v8[2])
  {
    fwrite("Wall Clock adjustment detected - results might be strange while using --end\n", 0x4CuLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
    v8[2] = v14;
  }
  v20 = (_QWORD **)_os_trace_realloc();
  v21 = *v20;
  v22 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 0x40000000;
  v43 = ___timesync_range_create_impl_block_invoke;
  v44 = &__block_descriptor_tmp_17;
  v45 = v11;
  v23 = (_QWORD *)v21[2];
  if (v23)
  {
    while (1)
    {
      v24 = v43((uint64_t)v42, (uint64_t)(v23 + 2), v23[4]);
      v25 = (_QWORD *)*v23;
      if (!v24)
        break;
LABEL_50:
      v23 = v25;
      if (!v25)
        goto LABEL_51;
    }
    v26 = (int8x8_t)v21[1];
    v27 = v23[1];
    v28 = (uint8x8_t)vcnt_s8(v26);
    v28.i16[0] = vaddlv_u8(v28);
    if (v28.u32[0] > 1uLL)
    {
      if (v27 >= *(_QWORD *)&v26)
        v27 %= *(_QWORD *)&v26;
    }
    else
    {
      v27 &= *(_QWORD *)&v26 - 1;
    }
    v29 = *(_QWORD **)(*v21 + 8 * v27);
    do
    {
      v30 = v29;
      v29 = (_QWORD *)*v29;
    }
    while (v29 != v23);
    if (v30 == v21 + 2)
      goto LABEL_56;
    v31 = v30[1];
    if (v28.u32[0] > 1uLL)
    {
      if (v31 >= *(_QWORD *)&v26)
        v31 %= *(_QWORD *)&v26;
    }
    else
    {
      v31 &= *(_QWORD *)&v26 - 1;
    }
    v32 = (_QWORD *)*v23;
    if (v31 != v27)
    {
LABEL_56:
      if (v25)
      {
        v33 = v25[1];
        if (v28.u32[0] > 1uLL)
        {
          if (v33 >= *(_QWORD *)&v26)
            v33 %= *(_QWORD *)&v26;
        }
        else
        {
          v33 &= *(_QWORD *)&v26 - 1;
        }
        v32 = (_QWORD *)*v23;
        if (v33 == v27)
          goto LABEL_43;
      }
      *(_QWORD *)(*v21 + 8 * v27) = 0;
      v32 = (_QWORD *)*v23;
    }
    if (!v32)
    {
LABEL_49:
      *v30 = v32;
      --v21[3];
      operator delete(v23);
      goto LABEL_50;
    }
LABEL_43:
    v34 = v32[1];
    if (v28.u32[0] > 1uLL)
    {
      if (v34 >= *(_QWORD *)&v26)
        v34 %= *(_QWORD *)&v26;
    }
    else
    {
      v34 &= *(_QWORD *)&v26 - 1;
    }
    if (v34 != v27)
    {
      *(_QWORD *)(*v21 + 8 * v34) = v30;
      v32 = (_QWORD *)*v23;
    }
    goto LABEL_49;
  }
LABEL_51:
  v35 = *v20;
  v38[0] = v22;
  v38[1] = 0x40000000;
  v39 = ___timesync_range_create_impl_block_invoke_2;
  v40 = &__block_descriptor_tmp_19;
  v41 = v20;
  for (i = (__n128 *)v35[2]; i; i = (__n128 *)i->n128_u64[0])
    v39((uint64_t)v38, i + 1, i[2].n128_i64[0]);
  _timesync_reset(a1);
  return v20;
}

BOOL ___timesync_range_create_impl_block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  return *(_QWORD *)(a1 + 32) >= a3;
}

__n128 ___timesync_range_create_impl_block_invoke_2(uint64_t a1, __n128 *a2, uint64_t a3)
{
  __n128 result;

  result = *a2;
  *(__n128 *)(*(_QWORD *)(a1 + 32) + 16 * a3 + 8) = *a2;
  return result;
}

_QWORD **_timesync_range_create_true_max(uint64_t a1, unint64_t a2, unint64_t a3)
{
  return _timesync_range_create_impl(a1, a2, a3, 1);
}

uint64_t _timesync_range_create_since_last_boot(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int *v6;
  _OWORD *v7;
  _OWORD *v8;
  unint64_t v9;

  v4 = _os_trace_zalloc();
  *(_QWORD *)v4 = 0;
  *(_OWORD *)(v4 + 8) = xmmword_19EA7F230;
  v5 = operator new();
  *(_OWORD *)v5 = 0u;
  *(_OWORD *)(v5 + 16) = 0u;
  *(_DWORD *)(v5 + 32) = 1065353216;
  *(_QWORD *)v4 = v5;
  _timesync_reset(a1);
  v6 = 0;
  v7 = (_OWORD *)(v4 + 24);
  v8 = (_OWORD *)(a1 + 64);
  do
  {
    if (*(_QWORD *)v7 != *(_QWORD *)v8 || *(_QWORD *)(v4 + 32) != *(_QWORD *)(a1 + 72))
    {
      *v7 = *v8;
      v6 = (unsigned int *)(a1 + 80);
    }
    _timesync_advance(a1);
  }
  while (*(_QWORD *)(a1 + 48));
  if (v6)
    v9 = (unint64_t)v6[1] * a2 / *v6;
  else
    v9 = 0;
  *(_QWORD *)(v4 + 8) = v9;
  *(_QWORD *)(v4 + 16) = -1;
  _os_trace_uuid_map_insert(*(float **)v4, (uint64_t *)(v4 + 24), 1);
  _timesync_reset(a1);
  return v4;
}

uint64_t _timesync_range_count(uint64_t a1)
{
  if (*(_QWORD *)a1)
    return *(_QWORD *)(*(_QWORD *)a1 + 24);
  else
    return 0;
}

void _timesync_range_destroy(void ***a1)
{
  _os_trace_uuid_map_destroy(*a1);
  free(a1);
}

uint64_t _os_trace_device_formatted_for_content_protection()
{
  if (_os_trace_device_formatted_for_content_protection_once != -1)
    dispatch_once(&_os_trace_device_formatted_for_content_protection_once, &__block_literal_global_80);
  return _os_trace_device_formatted_for_content_protection_formatted;
}

uint64_t ___os_trace_device_formatted_for_content_protection_block_invoke()
{
  uint64_t result;

  result = MKBDeviceFormattedForContentProtection();
  _os_trace_device_formatted_for_content_protection_formatted = (_DWORD)result == 1;
  return result;
}

BOOL _os_trace_device_unlocked_since_boot()
{
  _BOOL8 result;

  if (_os_trace_device_unlocked_since_boot_unlocked)
    return 1;
  if (_os_trace_device_formatted_for_content_protection_once != -1)
    dispatch_once(&_os_trace_device_formatted_for_content_protection_once, &__block_literal_global_80);
  if (_os_trace_device_formatted_for_content_protection_formatted)
    result = MKBDeviceUnlockedSinceBoot() == 1;
  else
    result = 1;
  _os_trace_device_unlocked_since_boot_unlocked = result;
  return result;
}

BOOL _os_trace_peer_is_admin(_xpc_connection_s *a1)
{
  return xpc_connection_get_euid(a1) == 0;
}

char *_os_trace_development_getenv(const char *a1)
{
  if (os_variant_allows_internal_security_policies())
    return getenv(a1);
  else
    return 0;
}

uint64_t _os_trace_is_kernel_64_bit()
{
  if (_os_trace_is_kernel_64_bit_k64_once != -1)
    dispatch_once(&_os_trace_is_kernel_64_bit_k64_once, &__block_literal_global_3);
  return _os_trace_is_kernel_64_bit_k64;
}

uint64_t ___os_trace_is_kernel_64_bit_block_invoke()
{
  uint64_t result;
  size_t v1;
  _BYTE __b[648];
  int v3[6];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)v3 = xmmword_19EA7EAE0;
  memset(__b, 170, sizeof(__b));
  v1 = 648;
  result = sysctl(v3, 4u, __b, &v1, 0, 0);
  if ((_DWORD)result == -1)
  {
    __error();
    result = _os_assumes_log();
  }
  _os_trace_is_kernel_64_bit_k64 = (__b[32] & 4) != 0;
  return result;
}

uint64_t _os_trace_uuiddb_get_path(const char *a1, uint64_t a2, int a3, char *__str)
{
  int v7;

  if (!a1)
  {
    if (_os_trace_shared_paths_init_once != -1)
      dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
    a1 = (const char *)_os_trace_uuidtext_path;
  }
  v7 = snprintf(__str, 0x400uLL, "%s/", a1);
  return _os_trace_uuiddb_get_pathsuffix(a2, a3, &__str[v7], 1024 - v7);
}

uint64_t ___os_trace_uuiddb_path_sandbox_can_read_data_block_invoke()
{
  uint64_t result;

  getpid();
  if (_os_trace_shared_paths_init_once != -1)
    dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
  result = sandbox_check();
  _os_trace_uuiddb_path_sandbox_can_read_data_can_read = (_DWORD)result == 0;
  return result;
}

BOOL _os_trace_uuiddb_path_exists(const char *a1, uint64_t a2, int a3)
{
  int v6;
  char __b[1024];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    memset(__b, 170, sizeof(__b));
    v6 = snprintf(__b, 0x400uLL, "%s/", a1);
    _os_trace_uuiddb_get_pathsuffix(a2, a3, &__b[v6], 1024 - v6);
    return access(__b, 0) == 0;
  }
  if (_os_trace_uuiddb_path_sandbox_can_read_data_once != -1)
    dispatch_once(&_os_trace_uuiddb_path_sandbox_can_read_data_once, &__block_literal_global_94);
  if (_os_trace_uuiddb_path_sandbox_can_read_data_can_read)
  {
    memset(__b, 170, sizeof(__b));
    _os_trace_uuiddb_get_path(0, a2, a3, __b);
    return access(__b, 0) == 0;
  }
  return 0;
}

FTS *_os_trace_uuiddb_foreach(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  FTS *result;
  FTS *v10;
  FTSENT *v11;
  FTSENT *v12;
  char v13;
  uint64_t fts_info;
  int fts_level;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unsigned int v19;
  int v20;
  unsigned int v21;
  int v22;
  int v23;
  unsigned int v24;
  int v25;
  unsigned int v26;
  int v27;
  int v28;
  _QWORD v29[2];
  char *v30[3];

  v30[2] = *(char **)MEMORY[0x1E0C80C00];
  v30[0] = a1;
  v30[1] = 0;
  result = fts_open(v30, 84, 0);
  if (result)
  {
    v10 = result;
    (*(void (**)(uint64_t))(a2 + 16))(a2);
    v29[0] = 0xAAAAAAAAAAAAAAAALL;
    v29[1] = 0xAAAAAAAAAAAAAAAALL;
    v11 = fts_read(v10);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      do
      {
        fts_info = v12->fts_info;
        switch(v12->fts_info)
        {
          case 1u:
            if (v12->fts_level == 1)
            {
              if (!strcmp(v12->fts_name, "dsc"))
              {
                v13 = 1;
                goto LABEL_6;
              }
              if (v12->fts_namelen == 2)
              {
                v24 = v12->fts_name[0] - 48;
                v25 = v24 > 0x36 ? -1 : dword_19EA7EAF0[v24];
                v26 = v12->fts_name[1] - 48;
                v27 = v26 > 0x36 ? -1 : dword_19EA7EAF0[v26];
                v28 = v27 | (16 * v25);
                if ((v28 & 0x80000000) == 0)
                {
                  LOBYTE(v29[0]) = v28;
                  goto LABEL_6;
                }
              }
            }
            else if (!v12->fts_level)
            {
              goto LABEL_6;
            }
            (*(void (**)(uint64_t, FTSENT *))(a3 + 16))(a3, v12);
            fts_set(v10, v12, 4);
            goto LABEL_6;
          case 2u:
            v12->fts_errno = 62;
            goto LABEL_5;
          case 3u:
          case 4u:
          case 7u:
          case 0xAu:
          case 0xCu:
          case 0xDu:
            goto LABEL_5;
          case 6u:
            v13 &= v12->fts_level != 1;
            goto LABEL_6;
          case 8u:
            fts_level = (unsigned __int16)v12->fts_level;
            if (fts_level != 2)
              goto LABEL_33;
            if ((v13 & 1) != 0)
              v16 = 32;
            else
              v16 = 30;
            if ((_DWORD)v16 != v12->fts_namelen)
              goto LABEL_5;
            v17 = 0;
            v18 = (v13 & 1) == 0;
            break;
          default:
            qword_1EE52EA58 = (uint64_t)"BUG IN LIBTRACE: unexpected fts entry";
            qword_1EE52EA88 = fts_info;
            __break(1u);
            return result;
        }
        while (1)
        {
          v19 = v12->fts_name[v17] - 48;
          v20 = v19 > 0x36 ? -1 : dword_19EA7EAF0[v19];
          v21 = v12->fts_name[v17 + 1] - 48;
          v22 = v21 > 0x36 ? -1 : dword_19EA7EAF0[v21];
          v23 = v22 | (16 * v20);
          if (v23 < 0)
            break;
          *((_BYTE *)v29 + v18++) = v23;
          v17 += 2;
          if (v17 >= v16)
          {
            (*(void (**)(uint64_t, FTSENT *, _QWORD *, _QWORD))(a4 + 16))(a4, v12, v29, v13 & 1);
            goto LABEL_6;
          }
        }
        fts_level = (unsigned __int16)v12->fts_level;
LABEL_33:
        if (fts_level != 1 || strcmp(v12->fts_name, ".migrated"))
LABEL_5:
          (*(void (**)(uint64_t, FTSENT *))(a3 + 16))(a3, v12);
LABEL_6:
        v12 = fts_read(v10);
      }
      while (v12);
    }
    if (fts_close(v10) == -1)
    {
      __error();
      _os_assumes_log();
    }
    return (FTS *)(*(uint64_t (**)(uint64_t))(a5 + 16))(a5);
  }
  return result;
}

__objc2_class *_os_trace_uuiddb_get_dsc_map_fd(uint64_t a1, __n128 *a2)
{
  return _os_trace_uuiddb_get_dsc_map_impl(a1, 0, a2, 1);
}

void _os_trace_uuiddb_dsc_map_destroy(uint64_t a1)
{
  _WORD *v2;

  v2 = *(_WORD **)(a1 + 8);
  if (v2[2] == 1)
  {
    free(*(void **)(a1 + 16));
    free(*(void **)(a1 + 24));
    v2 = *(_WORD **)(a1 + 8);
  }
  if (munmap(v2, *(unsigned int *)(a1 + 48)) == -1)
  {
    __error();
    _os_assumes_log();
  }
  free((void *)a1);
}

void _os_trace_uuiddb_dsc_run_block_on_map(char *a1, __n128 *a2, uint64_t a3)
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  __objc2_class *dsc_map_impl;
  BOOL v9;
  __objc2_class *v10;
  int v11;
  uint64_t v12;

  v5 = a1;
  if (!a1)
  {
    if (_os_trace_shared_paths_init_once != -1)
      dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
    v5 = (char *)_os_trace_uuidtext_path;
  }
  v6 = open(v5, 0);
  if ((_DWORD)v6 == -1)
  {
    __error();
    _os_assumes_log();
    return;
  }
  v7 = v6;
  dsc_map_impl = _os_trace_uuiddb_get_dsc_map_impl(0xFFFFFFFFLL, v5, a2, 0);
  v9 = dsc_map_impl != 0;
  if (dsc_map_impl || (_os_trace_uuiddb_dsc_map_create(v7, a2), (dsc_map_impl = v10) != 0))
  {
    (*(void (**)(uint64_t, __objc2_class *))(a3 + 16))(a3, dsc_map_impl);
    if (!(_DWORD)v7)
      goto LABEL_10;
  }
  else
  {
    v9 = 1;
    if (!(_DWORD)v7)
      goto LABEL_10;
  }
  if (close(v7) == -1)
  {
    v11 = *__error();
    v12 = *__error();
    if (v11 == 9)
    {
      qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_1EE52EA88 = v12;
      __break(1u);
      return;
    }
    _os_assumes_log();
  }
LABEL_10:
  if (!v9)
    _os_trace_uuiddb_dsc_map_destroy((uint64_t)dsc_map_impl);
}

uint64_t _os_trace_uuiddb_dsc_foreach_range_with_uuid(uint64_t result, _QWORD *a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = *(_QWORD *)(result + 8);
  if (*(_DWORD *)(v3 + 8))
  {
    v6 = (_QWORD *)result;
    v7 = 0;
    v8 = 0;
    do
    {
      v9 = v6[2];
      v10 = v6[3] + 32 * *(unsigned int *)(v9 + v7 + 16);
      v12 = *(_QWORD *)(v10 + 12);
      v11 = v10 + 12;
      if (v12 == *a2 && *(_QWORD *)(v11 + 8) == a2[1])
      {
        result = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a3 + 16))(a3, v3 + *(unsigned int *)(v9 + v7 + 8), *(unsigned int *)(v9 + v7 + 12));
        if (!(_DWORD)result)
          return result;
        v3 = v6[1];
      }
      ++v8;
      v7 += 24;
    }
    while (v8 < *(unsigned int *)(v3 + 8));
  }
  return result;
}

uint64_t _os_trace_uuiddb_dsc_foreach_uuid(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(result + 8);
  if (*(_DWORD *)(v2 + 12))
  {
    v4 = result;
    v5 = 0;
    v6 = 28;
    do
    {
      result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 16))(a2, *(_QWORD *)(v4 + 24) + v6 - 16, v2 + *(unsigned int *)(*(_QWORD *)(v4 + 24) + v6));
      if ((result & 1) == 0)
        break;
      ++v5;
      v2 = *(_QWORD *)(v4 + 8);
      v6 += 32;
    }
    while (v5 < *(unsigned int *)(v2 + 12));
  }
  return result;
}

uint64_t _os_trace_kic_mode()
{
  if (_os_trace_kic_mode_o != -1)
    dispatch_once(&_os_trace_kic_mode_o, &__block_literal_global_11);
  return _os_trace_kic_mode_kic;
}

char *___os_trace_kic_mode_block_invoke()
{
  char *result;
  size_t v1;
  char __b[1024];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  memset(__b, 170, sizeof(__b));
  v1 = 1024;
  _os_trace_kic_mode_kic = sysctlbyname("kern.filesetuuid", __b, &v1, 0, 0) != 0;
  result = (char *)sysctlbyname("kern.bootargs", __b, &v1, 0, 0);
  if (!(_DWORD)result)
  {
    if (strstr(__b, "libtrace_kic=0"))
      _os_trace_kic_mode_kic = 0;
    result = strstr(__b, "libtrace_kic=1");
    if (result)
      _os_trace_kic_mode_kic = 1;
  }
  return result;
}

void _os_trace_uuiddb_make_kernel_cache_uuid(unsigned __int8 *a1, const unsigned __int8 *a2)
{
  __int128 v4;
  size_t v5;
  char in[16];
  _BYTE v7[21];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v7[13] = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)in = v4;
  *(_OWORD *)v7 = v4;
  v5 = 37;
  if (sysctlbyname("kern.kernelcacheuuid", in, &v5, 0, 0))
  {
    uuid_copy(a1, a2);
    a1[15] = ~a1[15];
  }
  else
  {
    uuid_parse(in, a1);
  }
}

uint64_t _internal_log_assumes(uint64_t a1)
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  if (_internal_log_once != -1)
    dispatch_once_f(&_internal_log_once, 0, (dispatch_function_t)_internal_log_queue_init);
  if (!dispatch_get_specific((const void *)_internal_log_q_key))
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 0x40000000;
    v3[2] = ___internal_log_block_invoke;
    v3[3] = &__block_descriptor_tmp_108;
    v3[4] = a1;
    dispatch_sync((dispatch_queue_t)_internal_log_q, v3);
  }
  return 1;
}

int *_internal_log_queue_init()
{
  int *result;
  uint64_t v1;
  uint64_t v2;

  asprintf((char **)&_internal_queue_target, "com.apple.%s.log", "logd");
  if (!_internal_queue_target)
  {
    v1 = *__error();
    qword_1EE52EA58 = (uint64_t)"BUG IN LIBTRACE: failed to create queue target from subsystem";
    qword_1EE52EA88 = v1;
    __break(1u);
LABEL_10:
    result = __error();
    v2 = *result;
    qword_1EE52EA58 = (uint64_t)"BUG IN LIBTRACE: failed to create log file path";
    qword_1EE52EA88 = v2;
    __break(1u);
    return result;
  }
  _internal_log_q = (uint64_t)dispatch_queue_create_with_target_V2((const char *)_internal_queue_target, 0, 0);
  dispatch_queue_set_specific((dispatch_queue_t)_internal_log_q, (const void *)_internal_log_q_key, (void *)_internal_log_q, 0);
  if (_os_trace_shared_paths_init_once != -1)
    dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
  asprintf((char **)&_internal_log_file_0, "%s/%s.0.log", (const char *)_os_trace_persist_path, "logd");
  if (_os_trace_shared_paths_init_once != -1)
    dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
  result = (int *)asprintf((char **)&_internal_log_file_1, "%s/%s.1.log", (const char *)_os_trace_persist_path, "logd");
  if (!_internal_log_file_0 || !_internal_log_file_1)
    goto LABEL_10;
  return result;
}

uint64_t ___internal_log_block_invoke(uint64_t a1)
{
  const char *v1;
  __int128 v2;
  const char *v3;
  pid_t v4;
  uint64_t result;
  time_t v6;
  tm v7;
  char v8[8];
  _QWORD v9[3];
  char __b[1024];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = *(const char **)(a1 + 32);
  dispatch_assert_queue_V2((dispatch_queue_t)_internal_log_q);
  memset(__b, 170, sizeof(__b));
  memset(v9, 170, 18);
  v7.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)v8 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v7.tm_mon = v2;
  *(_OWORD *)&v7.tm_isdst = v2;
  *(_OWORD *)&v7.tm_sec = v2;
  v6 = time(0);
  localtime_r(&v6, &v7);
  strftime(v8, 0x1AuLL, "%F %T%z", &v7);
  v3 = getprogname();
  v4 = getpid();
  result = snprintf(__b, 0x400uLL, "%s %s[%d]: %s\n", v8, v3, v4, v1);
  if ((int)result >= 1)
  {
    if (result >= 0x400)
      __b[1022] = 10;
    dispatch_assert_queue_V2((dispatch_queue_t)_internal_log_q);
    dispatch_assert_queue_V2((dispatch_queue_t)_internal_log_q);
    if ((_internal_log_fd & 0x80000000) == 0
      || (result = _internal_log_open(), (_internal_log_fd & 0x80000000) == 0)
      && (_internal_log_rotate_if_needed(), result = _internal_log_fd,
                                            (_internal_log_fd & 0x80000000) == 0))
    {
      _os_trace_write();
      return _internal_log_rotate_if_needed();
    }
  }
  return result;
}

uint64_t _internal_log_rotate_if_needed()
{
  off_t v0;
  uint64_t result;
  std::error_code *v2;
  int v3;

  dispatch_assert_queue_V2((dispatch_queue_t)_internal_log_q);
  v0 = lseek(_internal_log_fd, 0, 2);
  result = fsync(_internal_log_fd);
  if (v0 >= 0x100000)
  {
    if (close(_internal_log_fd) != -1)
    {
LABEL_3:
      rename((const std::__fs::filesystem::path *)_internal_log_file_0, (const std::__fs::filesystem::path *)_internal_log_file_1, v2);
      return _internal_log_open();
    }
    v3 = *__error();
    result = *__error();
    if (v3 != 9)
    {
      _os_assumes_log();
      goto LABEL_3;
    }
    qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_1EE52EA88 = result;
    __break(1u);
  }
  return result;
}

uint64_t _internal_log_open()
{
  uint64_t result;

  result = open((const char *)_internal_log_file_0, 778, 420);
  _internal_log_fd = result;
  if ((result & 0x80000000) == 0)
    return fchown(result, 0x110u, 0x110u);
  return result;
}

void os_trace_blob_add_base64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = (void *)MEMORY[0x1A1AEC1C8]();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a2, a3);
  objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "UTF8String");
  os_trace_blob_addf(a1, "'%s%s'", v10, v11, v12, v13, v14, v15, v9);

  objc_autoreleasePoolPop(v6);
}

_BYTE *os_log_fmt_convert_trace(_BYTE *a1, char *a2, uint64_t a3)
{
  _BYTE *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  _BYTE *v8;
  size_t v9;
  char *v10;
  _BYTE *v11;

  v3 = a1;
  v5 = &a2[a3 - 1];
  v4 = *v5;
  *a1 = 0;
  a1[1] = v4;
  if (v4)
  {
    v6 = -v4;
    v7 = &a2[a3 + ~v4];
    v8 = a1 + 2;
    while (1)
    {
      v9 = v5[v6] & 0x3F;
      v10 = &a2[v9];
      if (&a2[v9] > v7)
        break;
      *v8 = 0;
      v8[1] = v9;
      v11 = v8 + 2;
      memcpy(v8 + 2, a2, v9);
      v8 = &v11[v9];
      a2 = v10;
      if (__CFADD__(v6++, 1))
        return v3;
    }
    return 0;
  }
  return v3;
}

void _os_log_fmt_compose_masked_partial_redacted(uint64_t a1, char *a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  int v19;
  _BOOL4 v21;
  _BOOL4 v22;
  uint64_t v23;
  unsigned int v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  unsigned int v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int v41;
  uint64_t v42;
  char *v43;
  size_t v44;
  unint64_t v45;

  v8 = a4;
  v10 = a1;
  if (!(_DWORD)a3 && (a4 & 1) == 0)
  {
    if ((*(_WORD *)(a1 + 20) & 2) != 0)
      return;
    v11 = *(unsigned int *)(a1 + 8);
    if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v11 - 1) > 7)
    {
      *(_QWORD *)(*(_QWORD *)a1 + v11) = 0x3E296C6C756E283CLL;
      v12 = *(_DWORD *)(a1 + 8) + 8;
      goto LABEL_69;
    }
    v43 = "<(null)>";
    v44 = 8;
LABEL_76:
    os_trace_blob_add_slow(a1, v43, v44);
    return;
  }
  if (a3 <= 3)
  {
    if ((*(_WORD *)(a1 + 20) & 2) != 0)
      return;
    v13 = *(unsigned int *)(a1 + 8);
    if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v13 - 1) <= 4)
    {
      v43 = "<…>";
      v44 = 5;
      goto LABEL_76;
    }
    v14 = *(_QWORD *)a1 + v13;
    *(_BYTE *)(v14 + 4) = 62;
    *(_DWORD *)v14 = -1501502916;
    v12 = *(_DWORD *)(a1 + 8) + 5;
LABEL_69:
    *(_DWORD *)(v10 + 8) = v12;
    if (!*(_BYTE *)(v10 + 22))
      *(_BYTE *)(*(_QWORD *)v10 + v12) = 0;
    return;
  }
  v15 = a3;
  v16 = *a2;
  v17 = a2[1];
  v18 = a2[2];
  v19 = a2[3];
  v21 = v19 != 2 || v18 == 0;
  if (!(_DWORD)a4 && !*a2 && v21)
  {
    os_trace_blob_addns(a1, a2 + 4, a3 - 4);
    return;
  }
  v22 = v19 == 1;
  if ((*(_WORD *)(a1 + 20) & 2) == 0)
  {
    v23 = *(unsigned int *)(a1 + 8);
    if (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - 1 == (_DWORD)v23)
    {
      os_trace_blob_add_slow(a1, "<", 1uLL);
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)a1 + v23) = 60;
      v24 = *(_DWORD *)(a1 + 8) + 1;
      *(_DWORD *)(a1 + 8) = v24;
      if (!*(_BYTE *)(a1 + 22))
        *(_BYTE *)(*(_QWORD *)a1 + v24) = 0;
    }
  }
  v25 = v16 + 4;
  if (v15 > v16 + 4)
  {
    if (v15 - (v16 + 4) < v18)
      v18 = v15 - (v16 + 4);
    if (v19 == 2)
      a3 = v18;
    else
      a3 = v15 - (v16 + 4);
    if (a3)
    {
      if (v19 == 1 && (*(_WORD *)(v10 + 20) & 2) == 0)
      {
        v26 = *(unsigned int *)(v10 + 8);
        if ((*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - v26 - 1) <= 2)
        {
          v45 = a3;
          os_trace_blob_add_slow(v10, "…", 3uLL);
          a3 = v45;
        }
        else
        {
          v27 = *(_QWORD *)v10 + v26;
          *(_BYTE *)(v27 + 2) = -90;
          *(_WORD *)v27 = -32542;
          v28 = *(_DWORD *)(v10 + 8) + 3;
          *(_DWORD *)(v10 + 8) = v28;
          if (!*(_BYTE *)(v10 + 22))
            *(_BYTE *)(*(_QWORD *)v10 + v28) = 0;
        }
      }
      if (os_trace_blob_addns(v10, &a2[v25], a3))
      {
        if (((v19 | 2) == 2 || v8) && (*(_WORD *)(v10 + 20) & 2) == 0)
        {
          v29 = *(unsigned int *)(v10 + 8);
          if ((*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - v29 - 1) <= 2)
          {
            os_trace_blob_add_slow(v10, "…", 3uLL);
          }
          else
          {
            v30 = *(_QWORD *)v10 + v29;
            *(_BYTE *)(v30 + 2) = -90;
            *(_WORD *)v30 = -32542;
            v31 = *(_DWORD *)(v10 + 8) + 3;
            *(_DWORD *)(v10 + 8) = v31;
            if (!*(_BYTE *)(v10 + 22))
              *(_BYTE *)(*(_QWORD *)v10 + v31) = 0;
          }
        }
        v22 = 1;
      }
    }
    else
    {
      v22 = 0;
    }
    if (v19 == 2
      && (a3 = v15 - (v18 + v25), v15 != v18 + v25)
      && os_trace_blob_addns(v10, &a2[v18 + v25], a3))
    {
      if ((*(_WORD *)(v10 + 20) & 2) == 0)
      {
        v32 = *(unsigned int *)(v10 + 8);
        if ((*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - v32 - 1) <= 2)
        {
          os_trace_blob_add_slow(v10, "…", 3uLL);
        }
        else
        {
          v33 = *(_QWORD *)v10 + v32;
          *(_BYTE *)(v33 + 2) = -90;
          *(_WORD *)v33 = -32542;
          v34 = *(_DWORD *)(v10 + 8) + 3;
          *(_DWORD *)(v10 + 8) = v34;
          if (!*(_BYTE *)(v10 + 22))
            *(_BYTE *)(*(_QWORD *)v10 + v34) = 0;
        }
      }
    }
    else if (!v22)
    {
      goto LABEL_57;
    }
    if ((*(_WORD *)(v10 + 20) & 2) == 0)
    {
      v35 = *(unsigned int *)(v10 + 8);
      if ((*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - v35 - 1) <= 1)
      {
        os_trace_blob_add_slow(v10, ", ", 2uLL);
      }
      else
      {
        *(_WORD *)(*(_QWORD *)v10 + v35) = 8236;
        v36 = *(_DWORD *)(v10 + 8) + 2;
        *(_DWORD *)(v10 + 8) = v36;
        if (!*(_BYTE *)(v10 + 22))
          *(_BYTE *)(*(_QWORD *)v10 + v36) = 0;
      }
    }
  }
LABEL_57:
  os_trace_blob_addf(v10, "length=%u", a3, a4, a5, a6, a7, a8, v17);
  v37 = v15 - 4;
  if (v37 >= v16)
    v38 = v16;
  else
    v38 = v37;
  if (v38)
  {
    v39 = (uint64_t)(a2 + 4);
    if ((*(_WORD *)(v10 + 20) & 2) == 0)
    {
      v40 = *(unsigned int *)(v10 + 8);
      if ((*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - v40 - 1) <= 1)
      {
        os_trace_blob_add_slow(v10, ", ", 2uLL);
      }
      else
      {
        *(_WORD *)(*(_QWORD *)v10 + v40) = 8236;
        v41 = *(_DWORD *)(v10 + 8) + 2;
        *(_DWORD *)(v10 + 8) = v41;
        if (!*(_BYTE *)(v10 + 22))
          *(_BYTE *)(*(_QWORD *)v10 + v41) = 0;
      }
    }
    os_trace_blob_add_base64(v10, v39, v38);
  }
  if ((*(_WORD *)(v10 + 20) & 2) == 0)
  {
    v42 = *(unsigned int *)(v10 + 8);
    if (*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - 1 == (_DWORD)v42)
    {
      v43 = ">";
      a1 = v10;
      v44 = 1;
      goto LABEL_76;
    }
    *(_BYTE *)(*(_QWORD *)v10 + v42) = 62;
    v12 = *(_DWORD *)(v10 + 8) + 1;
    goto LABEL_69;
  }
}

uint64_t _os_log_fmt_builtin_annotated(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, unsigned int a7)
{
  unint64_t v10;
  const char *v11;
  size_t v12;
  unint64_t v13;
  unint64_t v14;
  const char *v15;
  int v16;

  v10 = 0;
  v11 = *(const char **)(a3 + 40);
  v12 = *(unsigned __int16 *)(a3 + 16);
  v13 = 17;
  while (1)
  {
    v14 = (v13 + v10) >> 1;
    v15 = (&_os_log_fmt_builtin_annotated_functions)[2 * v14];
    v16 = strncmp(v11, v15, v12);
    if (!v16)
      break;
LABEL_5:
    if (v16 < 0)
      v13 = (v13 + v10) >> 1;
    else
      v10 = v14 + 1;
    if (v10 >= v13)
      return 0;
  }
  if (v15[v12])
  {
    v16 = -v15[v12];
    goto LABEL_5;
  }
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD))(&_os_log_fmt_builtin_annotated_functions)[2 * v14 + 1])(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t _os_log_fmt_builtin_BOOL(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, unsigned __int8 *a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t scalar;
  __int16 v15;
  char *v16;
  size_t v17;
  uint64_t v18;
  unsigned int v19;

  if (!_os_log_fmt_spec_is_integer(*(_BYTE *)(a3 + 10), 1))
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(_QWORD *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v11, v12, v13);
    return 1;
  }
  scalar = os_log_fmt_read_scalar(a3, a5, a6);
  v15 = *(_WORD *)(a1 + 20);
  if (**(_BYTE **)(a3 + 40) == 66)
  {
    if (scalar)
      v16 = "YES";
    else
      v16 = "NO";
    if (scalar)
      v17 = 3;
    else
      v17 = 2;
    if ((v15 & 2) != 0)
      return 1;
LABEL_18:
    v18 = *(unsigned int *)(a1 + 8);
    if (v17 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v18 - 1))
    {
      os_trace_blob_add_slow(a1, v16, v17);
    }
    else
    {
      memcpy((void *)(*(_QWORD *)a1 + v18), v16, v17);
      v19 = *(_DWORD *)(a1 + 8) + v17;
      *(_DWORD *)(a1 + 8) = v19;
      if (!*(_BYTE *)(a1 + 22))
        *(_BYTE *)(*(_QWORD *)a1 + v19) = 0;
    }
    return 1;
  }
  if (scalar)
    v16 = "true";
  else
    v16 = "false";
  if (scalar)
    v17 = 4;
  else
    v17 = 5;
  if ((v15 & 2) == 0)
    goto LABEL_18;
  return 1;
}

uint64_t _os_log_fmt_builtin_bitrate(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, unsigned __int8 *a5, uint64_t a6)
{
  _os_log_fmt_builtin_scaled(a1, 0x3E8u, a3, a4, a5, a6, _os_log_fmt_builtin_bitrate_suffixes);
  return 1;
}

uint64_t _os_log_fmt_builtin_bytes(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, unsigned __int8 *a5, uint64_t a6)
{
  _os_log_fmt_builtin_scaled(a1, 0x3E8u, a3, a4, a5, a6, _os_log_fmt_builtin_bytes_suffixes);
  return 1;
}

uint64_t _os_log_fmt_builtin_darwin_errno(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, int *a5, uint64_t a6)
{
  BOOL is_integer;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  is_integer = _os_log_fmt_spec_is_integer(*(_BYTE *)(a3 + 10), 0);
  if ((_DWORD)a6 == 4 && is_integer)
  {
    v18 = *a5;
    if (*a5)
    {
      strerror(*a5);
      os_trace_blob_addf(a1, "[%d: %s]", v19, v20, v21, v22, v23, v24, v18);
    }
    else
    {
      os_trace_blob_addf(a1, "[%d: %s]", v12, v13, v14, v15, v16, v17, 0);
    }
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(_QWORD *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v15, v16, v17);
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_darwin_mode(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, unsigned int *a5, uint64_t a6)
{
  BOOL is_integer;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  __int8 v16;
  __int8 v17;
  __int8 v18;
  __int8 v19;
  int8x16_t v20;
  int8x8_t v21;
  int8x8_t v22;
  char v23;
  char v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  _BYTE __src[10];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  is_integer = _os_log_fmt_spec_is_integer(*(_BYTE *)(a3 + 10), 0);
  if ((_DWORD)a6 == 4 && is_integer)
  {
    v15 = *a5;
    __src[0] = aPcDBLSW[(unsigned __int16)*a5 >> 12];
    if ((v15 & 0x40) != 0)
      v16 = 120;
    else
      v16 = 45;
    if ((v15 & 0x40) != 0)
      v17 = 115;
    else
      v17 = 83;
    if ((v15 & 8) != 0)
      v18 = 120;
    else
      v18 = 45;
    if ((v15 & 8) != 0)
      v19 = 115;
    else
      v19 = 83;
    v20 = (int8x16_t)vdupq_n_s32(v15);
    v21.i16[0] = 11565;
    v21.i8[3] = 45;
    v21.i8[4] = 45;
    v21.i16[3] = 11565;
    v21.i8[2] = v16;
    v21.i8[5] = v18;
    v22.i16[0] = 30578;
    v22.i8[2] = v17;
    v22.i8[3] = 114;
    v22.i8[4] = 119;
    v22.i8[5] = v19;
    v22.i16[3] = 30578;
    *(int8x8_t *)&__src[1] = vbsl_s8(vmovn_s16(vuzp1q_s16((int16x8_t)vceqzq_s32((int32x4_t)vandq_s8(v20, (int8x16_t)xmmword_19EA7F240)), (int16x8_t)vceqzq_s32((int32x4_t)vandq_s8(v20, (int8x16_t)xmmword_19EA7F250)))), v21, v22);
    if ((v15 & 1) != 0)
      v23 = 120;
    else
      v23 = 45;
    if ((v15 & 1) != 0)
      v24 = 116;
    else
      v24 = 84;
    if ((v15 & 0x200) != 0)
      v25 = v24;
    else
      v25 = v23;
    __src[9] = v25;
    if ((*(_BYTE *)(a1 + 20) & 2) == 0)
    {
      v26 = *(unsigned int *)(a1 + 8);
      if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v26 - 1) <= 9)
      {
        os_trace_blob_add_slow(a1, __src, 0xAuLL);
      }
      else
      {
        v27 = *(_QWORD *)a1 + v26;
        *(_QWORD *)v27 = *(_QWORD *)__src;
        *(_WORD *)(v27 + 8) = *(_WORD *)&__src[8];
        v28 = *(_DWORD *)(a1 + 8) + 10;
        *(_DWORD *)(a1 + 8) = v28;
        if (!*(_BYTE *)(a1 + 22))
          *(_BYTE *)(*(_QWORD *)a1 + v28) = 0;
      }
    }
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(_QWORD *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v12, v13, v14);
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_darwin_signal(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, _DWORD *a5, uint64_t a6)
{
  BOOL is_integer;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  is_integer = _os_log_fmt_spec_is_integer(*(_BYTE *)(a3 + 10), 0);
  if ((_DWORD)a6 == 4 && is_integer)
  {
    v18 = *a5;
    if (v18 < 0x20)
      os_trace_blob_addf(a1, "[sig%s: %s]", v12, v13, v14, v15, v16, v17, *(_QWORD *)(MEMORY[0x1E0C85788] + 8 * v18));
    else
      os_trace_blob_addf(a1, "[%d: Unknown signal]", v12, v13, v14, v15, v16, v17, *a5);
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(_QWORD *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v15, v16, v17);
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_iec_bitrate(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, unsigned __int8 *a5, uint64_t a6)
{
  _os_log_fmt_builtin_scaled(a1, 0x400u, a3, a4, a5, a6, _os_log_fmt_builtin_iec_bitrate_suffixes);
  return 1;
}

uint64_t _os_log_fmt_builtin_iec_bytes(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, unsigned __int8 *a5, uint64_t a6)
{
  _os_log_fmt_builtin_scaled(a1, 0x400u, a3, a4, a5, a6, _os_log_fmt_builtin_iec_bytes_suffixes);
  return 1;
}

uint64_t _os_log_fmt_builtin_mach_errno(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, kern_return_t *a5, uint64_t a6)
{
  BOOL is_integer;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  kern_return_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  is_integer = _os_log_fmt_spec_is_integer(*(_BYTE *)(a3 + 10), 0);
  if ((_DWORD)a6 == 4 && is_integer)
  {
    v15 = *a5;
    if ((*a5 - 1100) > 6)
      mach_error_string(v15 & 0xFFFFC1FF);
    else
      bootstrap_strerror(*a5);
    os_trace_blob_addf(a1, "[%#x: %s]", v16, v17, v18, v19, v20, v21, v15);
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(_QWORD *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v12, v13, v14);
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_trace_mode(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, int *a5, uint64_t a6)
{
  BOOL is_integer;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  char v20;
  char *v21;
  size_t v22;
  uint64_t v23;
  unsigned int v24;
  char *v25;
  unint64_t v26;
  int v27;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
  unsigned int v31;

  is_integer = _os_log_fmt_spec_is_integer(*(_BYTE *)(a3 + 10), 0);
  if ((_DWORD)a6 != 4 || !is_integer)
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(_QWORD *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v15, v16, v17);
    return 1;
  }
  v18 = *a5;
  os_trace_blob_addf(a1, "0x%X", v12, v13, v14, v15, v16, v17, *a5);
  v19 = 0;
  v20 = 1;
  do
  {
    if ((_os_log_fmt_builtin_trace_mode_masks[v19] & v18) == 0)
      goto LABEL_20;
    if ((v20 & 1) != 0)
      v21 = "(";
    else
      v21 = ", ";
    if ((v20 & 1) != 0)
      v22 = 3;
    else
      v22 = 2;
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      v23 = *(unsigned int *)(a1 + 8);
      if (v22 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v23 - 1))
      {
        os_trace_blob_add_slow(a1, v21, v22);
      }
      else
      {
        memcpy((void *)(*(_QWORD *)a1 + v23), v21, v22);
        v24 = *(_DWORD *)(a1 + 8) + v22;
        *(_DWORD *)(a1 + 8) = v24;
        if (!*(_BYTE *)(a1 + 22))
          *(_BYTE *)(*(_QWORD *)a1 + v24) = 0;
      }
    }
    v25 = *(char **)&_os_log_fmt_builtin_trace_mode_masks[v19 + 2];
    v26 = strlen(v25);
    if ((*(_WORD *)(a1 + 20) & 2) != 0)
      goto LABEL_18;
    v27 = v26;
    v28 = *(unsigned int *)(a1 + 8);
    if (v26 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v28 - 1))
    {
      os_trace_blob_add_slow(a1, v25, v26);
LABEL_18:
      v20 = 0;
      goto LABEL_20;
    }
    memcpy((void *)(*(_QWORD *)a1 + v28), v25, v26);
    v29 = *(_DWORD *)(a1 + 8) + v27;
    *(_DWORD *)(a1 + 8) = v29;
    v20 = *(_BYTE *)(a1 + 22);
    if (v20)
      goto LABEL_18;
    *(_BYTE *)(*(_QWORD *)a1 + v29) = 0;
LABEL_20:
    v19 += 4;
  }
  while (v19 != 28);
  if ((v20 & 1) == 0 && (*(_WORD *)(a1 + 20) & 2) == 0)
  {
    v30 = *(unsigned int *)(a1 + 8);
    if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v30 - 1) <= 1)
    {
      os_trace_blob_add_slow(a1, ")", 2uLL);
    }
    else
    {
      *(_WORD *)(*(_QWORD *)a1 + v30) = 10528;
      v31 = *(_DWORD *)(a1 + 8) + 2;
      *(_DWORD *)(a1 + 8) = v31;
      if (!*(_BYTE *)(a1 + 22))
        *(_BYTE *)(*(_QWORD *)a1 + v31) = 0;
    }
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_time(tm *a1, uint64_t a2, uint64_t a3, _BYTE *a4, time_t *a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  time_t v14;

  if (!_os_log_fmt_spec_is_integer(*(_BYTE *)(a3 + 10), 0))
    goto LABEL_8;
  if ((_DWORD)a6 == 4)
  {
    v14 = *(int *)a5;
    goto LABEL_6;
  }
  if ((_DWORD)a6 != 8)
  {
LABEL_8:
    _os_log_fmt_decode_cmd_mismatch((uint64_t)a1, *(_QWORD *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v11, v12, v13);
    return 1;
  }
  v14 = *a5;
LABEL_6:
  os_trace_blob_add_localtime(a1, v14, 0, 3u);
  return 1;
}

uint64_t _os_log_fmt_builtin_timespec(tm *a1, uint64_t a2, uint64_t a3, _BYTE *a4, time_t *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_BYTE *)(a3 + 10) == 19 && a6 <= 0x10 && ((_DWORD)a6 == 16 || (a7 & 1) != 0))
  {
    if ((_DWORD)a6 != 16 && (_DWORD)a7)
      _os_log_fmt_decode_error((size_t)a1);
    else
      os_trace_blob_add_localtime(a1, *a5, a5[1], 0);
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch((uint64_t)a1, *(_QWORD *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, a6, a7, a8);
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_timeval(tm *a1, uint64_t a2, uint64_t a3, _BYTE *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_BYTE *)(a3 + 10) == 19 && a6 <= 0x10 && ((_DWORD)a6 == 16 || (a7 & 1) != 0))
  {
    if ((_DWORD)a6 != 16 && (_DWORD)a7)
      _os_log_fmt_decode_error((size_t)a1);
    else
      os_trace_blob_add_localtime(a1, *(_QWORD *)a5, *(_DWORD *)(a5 + 8), 1u);
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch((uint64_t)a1, *(_QWORD *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, a6, a7, a8);
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_uuid_t(size_t a1, int a2, uint64_t a3, _BYTE *a4, unsigned __int8 *uu, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  _BYTE v14[37];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a3 + 10) == 19 && a6 <= 0x10 && ((_DWORD)a6 == 16 || (a7 & 1) != 0))
  {
    if ((_DWORD)a6 != 16 && (_DWORD)a7)
    {
      _os_log_fmt_decode_error(a1);
    }
    else
    {
      memset(v14, 0, sizeof(v14));
      uuid_unparse_upper(uu, v14);
      v9 = strlen(v14);
      if ((*(_WORD *)(a1 + 20) & 2) == 0)
      {
        v10 = v9;
        v11 = *(unsigned int *)(a1 + 8);
        if (v9 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v11 - 1))
        {
          os_trace_blob_add_slow(a1, v14, v9);
        }
        else
        {
          memcpy((void *)(*(_QWORD *)a1 + v11), v14, v9);
          v12 = *(_DWORD *)(a1 + 8) + v10;
          *(_DWORD *)(a1 + 8) = v12;
          if (!*(_BYTE *)(a1 + 22))
            *(_BYTE *)(*(_QWORD *)a1 + v12) = 0;
        }
      }
    }
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(_QWORD *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, a6, a7, a8);
  }
  return 1;
}

BOOL _os_log_fmt_spec_is_integer(unsigned __int8 a1, int a2)
{
  int v2;

  v2 = a2 ^ 1;
  if (a1 - 1 < 0xC)
    v2 = 1;
  if (v2)
    return a1 - 1 < 0xC;
  else
    return a1 == 13;
}

uint64_t _os_log_fmt_builtin_scaled(uint64_t a1, unsigned int a2, uint64_t a3, _BYTE *a4, unsigned __int8 *a5, uint64_t a6, _QWORD *a7)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t scalar;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  int v25;
  int v26;
  uint64_t v27;
  unsigned int v28;
  unint64_t v29;

  if (!_os_log_fmt_spec_is_integer(*(_BYTE *)(a3 + 10), 0))
    return _os_log_fmt_decode_cmd_mismatch(a1, *(_QWORD *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v14, v15, v16);
  scalar = os_log_fmt_read_scalar(a3, a5, a6);
  v24 = 0.0;
  v25 = 0;
  if (*a7 && a7[1] && scalar >= 0x3E8)
  {
    v25 = 0;
    do
    {
      v26 = scalar;
      v27 = a7[v25 + 2];
      ++v25;
      scalar /= a2;
    }
    while (v27 && scalar > 0x3E7);
    v24 = (double)(v26 - scalar * a2) * 100.0;
  }
  v28 = vcvtad_u64_f64(v24 / (double)a2);
  if (v28 == 100)
    v29 = scalar + 1;
  else
    v29 = scalar;
  if (v28 == 100)
    v28 = 0;
  if (!v25)
    return os_trace_blob_addf(a1, "%llu %s", v18, v19, v20, v21, v22, v23, v29);
  if (v29 <= 9 && -10 * (v28 / 0xA) != -v28)
    return os_trace_blob_addf(a1, "%llu.%02u %s", v18, v19, v20, v21, v22, v23, v29);
  if (v28 && v29 <= 0x63)
    return os_trace_blob_addf(a1, "%llu.%01u %s", v18, v19, v20, v21, v22, v23, v29);
  else
    return os_trace_blob_addf(a1, "%llu %s", v18, v19, v20, v21, v22, v23, v29);
}

char *_find_old_signpost_name_end(char *a1, const char *a2)
{
  char *result;
  size_t v5;

  result = strchr(a1, 32);
  if (!result)
  {
    v5 = strlen(a1);
    if (!strncmp(a1, a2, v5) && !a1[v5] && a2[v5] == 32)
    {
      if (a2[v5 + 1])
        return 0;
      else
        return &a1[v5 - 1];
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t _parse_activity_swap(uint64_t a1, uint64_t a2)
{
  __int16 v4;
  unint64_t v5;
  unint64_t v6;

  *(_QWORD *)(a1 + 8) = 514;
  v4 = *(_WORD *)(a2 + 2);
  if ((v4 & 1) == 0)
  {
    LODWORD(v5) = 0;
    if ((v4 & 0x10) == 0)
      goto LABEL_7;
LABEL_6:
    v5 = (v5 + 8);
    if (*(unsigned __int16 *)(a2 + 22) < v5)
      return 0;
    goto LABEL_7;
  }
  if (!(*(_QWORD *)(a2 + 16) >> 51))
    return 0;
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 56) = v6;
  *(_QWORD *)(a1 + 64) = _os_activity_map_find_parent(*(_QWORD **)(a1 + 320), v6);
  v4 = *(_WORD *)(a2 + 2);
  LODWORD(v5) = 8;
  if ((v4 & 0x10) != 0)
    goto LABEL_6;
LABEL_7:
  if ((v4 & 0x200) == 0)
    return 1;
  if ((unint64_t)v5 + 8 <= *(unsigned __int16 *)(a2 + 22))
  {
    *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + v5 + 24);
    return 1;
  }
  return 0;
}

uint64_t _parse_activity_create(uint64_t a1, uint64_t a2)
{
  __int16 v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  unint64_t v8;
  uint64_t v9;
  __int16 v10;

  *(_QWORD *)(a1 + 8) = 513;
  v3 = *(_WORD *)(a2 + 2);
  if ((v3 & 1) == 0)
  {
    LODWORD(v4) = 0;
    if ((v3 & 0x10) == 0)
      goto LABEL_3;
LABEL_7:
    v5 = v4;
    v4 = v4 + 8;
    if (v4 > *(unsigned __int16 *)(a2 + 22))
      return 0;
    *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + v5 + 24);
    if ((*(_WORD *)(a2 + 2) & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_9;
  }
  if (!(*(_QWORD *)(a2 + 16) >> 51))
    return 0;
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 24);
  v3 = *(_WORD *)(a2 + 2);
  LODWORD(v4) = 8;
  if ((v3 & 0x10) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v3 & 0x200) != 0)
  {
LABEL_9:
    v6 = v4;
    v4 = v4 + 8;
    if (v4 <= *(unsigned __int16 *)(a2 + 22))
    {
      *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + v6 + 24);
      goto LABEL_11;
    }
    return 0;
  }
LABEL_11:
  if ((unint64_t)v4 + 8 > *(unsigned __int16 *)(a2 + 22))
    return 0;
  v10 = v4 + 8;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + v4 + 24);
  result = _parse_location((_QWORD *)a1, a2, &v10);
  if ((_DWORD)result)
  {
    v8 = *(_QWORD *)(a1 + 56);
    if (v8)
    {
      v9 = *(_QWORD *)(a1 + 64);
      if (v9)
      {
        if (*(_BYTE *)(a1 + 365))
          _os_activity_map_insert((uint64_t *)(a1 + 320), v8, v9);
      }
    }
    else
    {
      *(_QWORD *)(a1 + 176) = "Default/remote activity";
    }
    return 1;
  }
  return result;
}

uint64_t _parse_activity_useraction(uint64_t a1, uint64_t a2)
{
  __int16 v4;
  unint64_t v5;
  unint64_t v6;
  __int16 v8;

  v8 = 0;
  *(_QWORD *)(a1 + 8) = 515;
  v4 = *(_WORD *)(a2 + 2);
  if ((v4 & 1) == 0)
  {
    v5 = 8;
    if ((v4 & 0x10) == 0)
      return _parse_location((_QWORD *)a1, a2, &v8);
    goto LABEL_6;
  }
  if (!(*(_QWORD *)(a2 + 16) >> 51))
    return 0;
  v8 = 8;
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 56) = v6;
  *(_QWORD *)(a1 + 64) = _os_activity_map_find_parent(*(_QWORD **)(a1 + 320), v6);
  v5 = 16;
  if ((*(_WORD *)(a2 + 2) & 0x10) != 0)
  {
LABEL_6:
    if (v5 <= *(unsigned __int16 *)(a2 + 22))
    {
      v8 = v5;
      return _parse_location((_QWORD *)a1, a2, &v8);
    }
    return 0;
  }
  return _parse_location((_QWORD *)a1, a2, &v8);
}

uint64_t _parse_trace(uint64_t a1, uint64_t a2)
{
  __int16 v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;
  uint64_t v8;
  unsigned __int16 v9;

  v9 = 0;
  *(_QWORD *)(a1 + 8) = 768;
  v4 = *(_WORD *)(a2 + 2);
  if ((v4 & 1) != 0)
  {
    if (!(*(_QWORD *)(a2 + 16) >> 51))
      return 0;
    v9 = 8;
    v6 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 56) = v6;
    *(_QWORD *)(a1 + 64) = _os_activity_map_find_parent(*(_QWORD **)(a1 + 320), v6);
    v5 = 16;
    if ((*(_WORD *)(a2 + 2) & 0x10) == 0)
      goto LABEL_8;
LABEL_6:
    if (v5 <= *(unsigned __int16 *)(a2 + 22))
    {
      v9 = v5;
      goto LABEL_8;
    }
    return 0;
  }
  v5 = 8;
  if ((v4 & 0x10) != 0)
    goto LABEL_6;
LABEL_8:
  result = _parse_location((_QWORD *)a1, a2, &v9);
  if ((_DWORD)result)
  {
    v8 = v9;
    *(_QWORD *)(a1 + 192) = a2 + v9 + 24;
    *(_QWORD *)(a1 + 200) = *(unsigned __int16 *)(a2 + 22) - v8;
    return 1;
  }
  return result;
}

BOOL _parse_loss(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v4;
  unint64_t v5;
  int v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;

  *(_QWORD *)(a1 + 8) = 1792;
  v2 = *(_QWORD *)(a2 + 16) >> 51;
  if (v2 >= 3)
  {
    v4 = *(_QWORD *)(a2 + 24);
    v5 = *(_QWORD *)(a2 + 32);
    v6 = *(_DWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 216) = 0;
    v7 = (_QWORD *)(a1 + 216);
    *(_QWORD *)(a1 + 192) = v4;
    *(_QWORD *)(a1 + 200) = 0;
    *(_QWORD *)(a1 + 208) = 0;
    *(_QWORD *)(a1 + 224) = v5;
    *(_QWORD *)(a1 + 232) = 0;
    *(_QWORD *)(a1 + 240) = 0;
    *(_QWORD *)(a1 + 248) = 0;
    *(_DWORD *)(a1 + 256) = v6;
    v8 = *(_QWORD *)(a1 + 328);
    v9 = *(_QWORD *)(v8 + 1056);
    v10 = *(_QWORD *)(a1 + 344);
    if (v10)
    {
      v11 = _timesync_continuous_to_wall_time(v10, (_QWORD *)(v9 + 144), v4, v7);
      v12 = v11 / 0x3B9ACA00;
      v13 = v11 % 0x3B9ACA00 / 0x3E8;
      v14 = *(_QWORD *)(a1 + 328);
      v15 = *(_QWORD *)(a1 + 344);
      *(_QWORD *)(a1 + 200) = v12;
      *(_QWORD *)(a1 + 208) = v13;
      v16 = (_QWORD *)(a1 + 248);
      v17 = *(_QWORD *)(v14 + 1056);
      if (v15)
      {
        v18 = _timesync_continuous_to_wall_time(v15, (_QWORD *)(v17 + 144), v5, v16);
        v19 = v18 / 0x3B9ACA00;
        v20 = v18 % 0x3B9ACA00 / 0x3E8;
LABEL_19:
        *(_QWORD *)(a1 + 232) = v19;
        *(_QWORD *)(a1 + 240) = v20;
        return v2 > 2;
      }
      v23 = *(_QWORD *)(a1 + 356);
    }
    else
    {
      v21 = *(_QWORD *)(v9 + 32);
      v22 = *(_DWORD *)(v9 + 40);
      v23 = *(_QWORD *)(a1 + 356);
      *(_QWORD *)(a1 + 216) = v23;
      v24 = *(_QWORD *)(v9 + 64);
      if (v24 != v4)
      {
        v26 = *(unsigned int *)(v9 + 16);
        v25 = *(unsigned int *)(v9 + 20);
        if (v24 >= v4)
        {
          v28 = (v24 - v4) * v26 / v25;
          v21 -= v28 / 0x3B9ACA00;
          v22 -= v28 % 0x3B9ACA00 / 0x3E8;
          if (v22 < 0)
          {
            --v21;
            v22 += 1000000;
          }
        }
        else
        {
          v27 = (v4 - v24) * v26 / v25;
          v21 += v27 / 0x3B9ACA00;
          v22 += v27 % 0x3B9ACA00 / 0x3E8;
          if (v22 > 999999)
          {
            ++v21;
            v22 -= 1000000;
          }
        }
      }
      *(_QWORD *)(a1 + 200) = v21;
      *(_QWORD *)(a1 + 208) = v22;
      v16 = (_QWORD *)(a1 + 248);
      v17 = *(_QWORD *)(v8 + 1056);
    }
    v19 = *(_QWORD *)(v17 + 32);
    v20 = *(_DWORD *)(v17 + 40);
    *v16 = v23;
    v29 = *(_QWORD *)(v17 + 64);
    if (v29 != v5)
    {
      v31 = *(unsigned int *)(v17 + 16);
      v30 = *(unsigned int *)(v17 + 20);
      if (v29 >= v5)
      {
        v33 = (v29 - v5) * v31 / v30;
        v19 -= v33 / 0x3B9ACA00;
        v20 -= v33 % 0x3B9ACA00 / 0x3E8;
        if (v20 < 0)
        {
          --v19;
          v20 += 1000000;
        }
      }
      else
      {
        v32 = (v5 - v29) * v31 / v30;
        v19 += v32 / 0x3B9ACA00;
        v20 += v32 % 0x3B9ACA00 / 0x3E8;
        if (v20 > 999999)
        {
          ++v19;
          v20 -= 1000000;
        }
      }
    }
    goto LABEL_19;
  }
  return v2 > 2;
}

void __LOGEVENTPROXY_RETAINED_OUTSIDE_OF_ITERATION__()
{
  qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: OSLogEventProxy was retained outside of iteration";
  __break(1u);
}

void logdev_notification_callback(int a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  OSLogDevice *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  OSLogDevice *v13;

  v7 = a4;
  v8 = [OSLogDevice alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[OSLogDevice initWithMobileDevice:andUDID:](v8, "initWithMobileDevice:andUDID:", a3, v9);

  if (a1 == 2)
    v10 = 2;
  else
    v10 = a1 == 1;
  objc_msgSend(v7, "deviceDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activityStream:deviceUDID:deviceID:status:error:", v7, v12, v13, v10, 0);

}

void __watchForSims_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("device"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  _simDeviceUpdate(v3, *(void **)(a1 + 32));

}

void _simDeviceUpdate(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  OSLogDevice *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  OSLogDevice *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(v4, "deviceDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "state") == 3)
  {
    v6 = (void *)_knownSimulators;
    objc_msgSend(v3, "UDID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v8);
    v9 = (OSLogDevice *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_17:

        goto LABEL_18;
      }
      objc_msgSend(v3, "UDID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412546;
      v24 = (uint64_t)v11;
      v25 = 2112;
      v26 = v9;
      _os_log_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "duplicate sim seen: %@, already have %@", (uint8_t *)&v23, 0x16u);

    }
    else
    {
      v9 = -[OSLogDevice initWithSimualatedDevice:]([OSLogDevice alloc], "initWithSimualatedDevice:", v3);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v23 = 138412290;
        v24 = (uint64_t)v9;
        _os_log_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "sim added: %@", (uint8_t *)&v23, 0xCu);
      }
      v20 = (void *)_knownSimulators;
      objc_msgSend(v3, "UDID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "UUIDString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKey:", v9, v22);

      -[OSLogDevice uid](v9, "uid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "activityStream:deviceUDID:deviceID:status:error:", v4, v10, v9, 0, 0);
    }

    goto LABEL_17;
  }
  v12 = objc_msgSend(v3, "state");
  v13 = (void *)_knownSimulators;
  objc_msgSend(v3, "UDID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v15);
  v9 = (OSLogDevice *)objc_claimAutoreleasedReturnValue();

  if (v12 == 4)
  {
    if (v9)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v23 = 138412290;
        v24 = (uint64_t)v9;
        _os_log_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "sim removed: %@", (uint8_t *)&v23, 0xCu);
      }
      -[OSLogDevice uid](v9, "uid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "activityStream:deviceUDID:deviceID:status:error:", v4, v16, v9, 1, 0);

      v17 = (void *)_knownSimulators;
      objc_msgSend(v3, "UDID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "UUIDString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeObjectForKey:", v19);

      goto LABEL_17;
    }
  }
  else if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v23 = 134218242;
      v24 = objc_msgSend(v3, "state");
      v25 = 2112;
      v26 = v9;
      _os_log_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "sim state %lu: %@", (uint8_t *)&v23, 0x16u);
    }
    goto LABEL_17;
  }
LABEL_18:

}

void __watchForSims_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (_coreSimulatorFrameworkPath_once != -1)
    dispatch_once(&_coreSimulatorFrameworkPath_once, &__block_literal_global_170);
  v0 = (id)_coreSimulatorFrameworkPath_path;
  if (v0)
  {
    v5 = v0;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v1;
    if (v1)
    {
      watchForSims_SimServiceContextClass = objc_msgSend(v1, "classNamed:", CFSTR("SimServiceContext"));
      if (watchForSims_SimServiceContextClass)
      {
        v3 = objc_opt_new();
        v4 = (void *)_knownSimulators;
        _knownSimulators = v3;

      }
    }

    v0 = v5;
  }

}

void ___coreSimulatorFrameworkPath_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = objc_msgSend(&unk_1E4164FF0, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v7;
    while (2)
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v7 != v3)
          objc_enumerationMutation(&unk_1E4164FF0);
        v5 = *(void **)(*((_QWORD *)&v6 + 1) + 8 * i);
        if (objc_msgSend(v0, "fileExistsAtPath:", v5))
        {
          objc_storeStrong((id *)&_coreSimulatorFrameworkPath_path, v5);
          goto LABEL_11;
        }
      }
      v2 = objc_msgSend(&unk_1E4164FF0, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_11:

}

void sub_19EA46AE4(void *a1)
{
  objc_begin_catch(a1);
  objc_end_catch();
  JUMPOUT(0x19EA46A60);
}

void logdev_message_callback(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  v7 = a2;
  if (a1)
  {
    +[OSActivityEvent activityEventFromStreamEntry:](OSActivityEvent, "activityEventFromStreamEntry:", a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(v7, "predicate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4
        || (objc_msgSend(v7, "predicate"),
            v5 = (void *)objc_claimAutoreleasedReturnValue(),
            v6 = objc_msgSend(v5, "evaluateWithObject:", v3),
            v5,
            (v6 & 1) != 0))
      {
        objc_msgSend(v7, "streamEvent:error:", v3, 0);
      }
    }

  }
  else
  {
    objc_msgSend(v7, "streamEvent:error:", 0, 0);
  }

}

void sub_19EA46CE4(void *a1)
{
  objc_begin_catch(a1);
  objc_end_catch();
  JUMPOUT(0x19EA46CB4);
}

void sub_19EA46FF0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t ___catalog_lite_read_limits_block_invoke_2(uint64_t result, uint64_t a2, uint64_t *a3)
{
  _QWORD *v3;
  unint64_t v4;
  unint64_t *v5;
  uint64_t v6;

  v3 = *(_QWORD **)(result + 32);
  if (*(_QWORD *)a2 < *v3)
    *v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(unint64_t **)(result + 40);
  if (v4 < *v5)
    *v5 = v4;
  v6 = a2 + *(unsigned __int16 *)(a2 + 24) + 26;
  if ((v6 & 7) != 0)
    v6 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
  *a3 = v6;
  return result;
}

void enumerateOldChunkTracepointLimits(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  unsigned __int16 *v5;
  unint64_t v6;
  uint64_t *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD v18[6];

  if (*(_DWORD *)a1 == 24589)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __enumerateOldChunkTracepointLimits_block_invoke;
    v18[3] = &__block_descriptor_48_e767_B16__0__tracev3_chunk_s__tracev3_chunk_preamble_s_IIQ_____tracev3_chunk_header_s__mach_timebase_info_II_QqiiiI_tracev3_subchunk_preamble_s_II__tracev3_subchunk_continuous_s_Q__tracev3_subchunk_preamble_s_II__tracev3_subchunk_systeminfo_s_ii_16c__32c___tracev3_subchunk_preamble_s_II__tracev3_subchunk_generation_s__16C_ii__tracev3_subchunk_preamble_s_II__tracev3_subchunk_timezone_s__48c____tracev3_chunk_catalog_s_SSSS_0C___tracev3_chunk_catalog_v2_s_SSSSS_3S_Q_0C___tracev3_chunk_log_preamble_s_QIC_3C___tracev3_chunk_firehose_s_QICC_2C__0C___tracev3_chunk_firehose_old_s_QiCC_0C___tracev3_chunk_oversize_s_QIC_3C_QISS_0C___tracev3_chunk_oversize_old_s_QISS_0C___tracev3_chunk_statedump_s_QIC_3C_QQ_16C__0C___tracev3_chunk_simple_s_QICC_2C_QQQ_16C__16C__0C___0C___8l;
    v18[4] = a2;
    v18[5] = a3;
    _tracev3_chunk_decompress_and_enumerate_chunks(a1, 0, (uint64_t)v18);
    return;
  }
  if (*(_DWORD *)a1 == 24588)
  {
    v3 = *(_QWORD *)(a1 + 8);
    v4 = v3 - 16;
    if (v3 >= 0x10)
    {
      v5 = (unsigned __int16 *)(a1 + 30);
      if (v3 - 4113 > 0xFFFFFFFFFFFFF00ELL)
      {
        v6 = *v5;
        if (v4 < v6)
          return;
      }
      else
      {
        v6 = *v5;
      }
      v7 = (uint64_t *)(a1 + 46);
      v8 = (unint64_t)v5 + v6;
      if (v6 > 0x1000)
        v8 = a1 + 46;
      while ((unint64_t)(v7 + 3) < v8)
      {
        v9 = v7[2];
        v10 = HIWORD(v9);
        if (!HIWORD(v9) || v10 > (uint64_t)(v8 - (_QWORD)(v7 + 3)))
          break;
        v12 = v10 + 24;
        v13 = (HIWORD(v9) & 0xFFF8) + 32;
        if ((v9 & 0x7000000000000) == 0)
          v13 = v12;
        v14 = (uint64_t *)((char *)v7 + v13);
        v15 = *v7;
        v7 = v14;
        if (v15)
        {
          v16 = (v9 & 0xFFFFFFFFFFFFLL) + *(_QWORD *)(a1 + 38);
          v17 = *a2;
          if (*a2 >= v16)
            v17 = v16;
          *a2 = v17;
          if (*a3 > v16)
            v16 = *a3;
          *a3 = v16;
          v7 = v14;
        }
      }
    }
  }
}

uint64_t __enumerateOldChunkTracepointLimits_block_invoke(uint64_t a1, uint64_t a2)
{
  enumerateOldChunkTracepointLimits(a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return 1;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

uint64_t _oie_validate_subchunk_ttl(void *a1, void *a2, int a3, _QWORD *a4)
{
  _QWORD *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  id v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v7 = a1;
  v8 = a2;
  v9 = v8;
  v10 = 3;
  v11 = 4;
  v12 = 5;
  if (a3 != 30)
    v12 = 0;
  if (a3 != 14)
    v11 = v12;
  if (a3 != 7)
    v10 = v11;
  v13 = 1;
  v14 = 2;
  if (a3 != 3)
    v14 = 0;
  if (a3 != 1)
    v13 = v14;
  if (a3 <= 6)
    v10 = v13;
  v15 = v7[v10 + 8];
  if (!v15)
    goto LABEL_20;
  v16 = *(_QWORD **)v15;
  objc_msgSend(v8, "catalog");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = _os_trace_uuid_map_lookup(v16, (_QWORD *)objc_msgSend(v17, "bootUUID"));

  if (v18)
  {
    if (v18 <= 1)
      v19 = *(_QWORD *)(v15 + 8);
    else
      v19 = 0;
    *a4 = v19;
LABEL_20:
    v20 = 1;
    goto LABEL_21;
  }
  v20 = 0;
LABEL_21:

  return v20;
}

void sub_19EA4A494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _OSLogError(uint64_t a1)
{
  void *v1;
  const __CFString *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  uint64_t v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  switch(a1)
  {
    case 4:
    case 5:
    case 11:
    case 12:
    case 13:
      v7 = CFSTR("_OSLogErrorInternalCode");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *MEMORY[0x1E0CB2D50];
      v9[0] = v1;
      v2 = CFSTR("The log archive is corrupt or incomplete and cannot be read");
      v3 = 2;
      break;
    case 7:
      v7 = CFSTR("_OSLogErrorInternalCode");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 7);
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *MEMORY[0x1E0CB2D50];
      v9[0] = v1;
      v2 = CFSTR("A system resource shortage prevented the operation from completing successfully");
      v3 = 6;
      break;
    case 8:
      v7 = CFSTR("_OSLogErrorInternalCode");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 8);
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *MEMORY[0x1E0CB2D50];
      v9[0] = v1;
      v2 = CFSTR("The log archive format requires upgrading in order to be opened");
      v3 = 4;
      break;
    case 9:
      v7 = CFSTR("_OSLogErrorInternalCode");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 9);
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *MEMORY[0x1E0CB2D50];
      v9[0] = v1;
      v2 = CFSTR("The log archive upgrade process failed");
      v3 = 5;
      break;
    case 10:
      v7 = CFSTR("_OSLogErrorInternalCode");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 10);
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *MEMORY[0x1E0CB2D50];
      v9[0] = v1;
      v2 = CFSTR("The log archive version is unsupported by this library");
      v3 = 3;
      break;
    case 14:
      v7 = CFSTR("_OSLogErrorInternalCode");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 14);
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *MEMORY[0x1E0CB2D50];
      v9[0] = v1;
      v2 = CFSTR("Client lacks entitlement to perform operation");
      v3 = 9;
      break;
    case 15:
      v7 = CFSTR("_OSLogErrorInternalCode");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 15);
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *MEMORY[0x1E0CB2D50];
      v9[0] = v1;
      v2 = CFSTR("Connection to logd failed");
      v3 = 10;
      break;
    case 16:
    case 17:
    case 18:
      v7 = CFSTR("_OSLogErrorInternalCode");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *MEMORY[0x1E0CB2D50];
      v9[0] = v1;
      v2 = CFSTR("The log archive contains partial or missing metadata");
      v3 = 7;
      break;
    default:
      v7 = CFSTR("_OSLogErrorInternalCode");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *MEMORY[0x1E0CB2D50];
      v9[0] = v1;
      v2 = CFSTR("The specified URL did not refer to a valid log archive");
      v3 = 1;
      break;
  }
  v9[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("OSLogErrorDomain"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id _OSLogPOSIXError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a1 - 4) > 0xE)
    v3 = 1;
  else
    v3 = qword_19EA7F0C0[a1 - 4];
  v11[0] = CFSTR("_OSLogErrorInternalCode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v11[1] = CFSTR("_OSLogErrorPOSIXErrno");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  v11[2] = *MEMORY[0x1E0CB2D50];
  v6 = v3 - 1;
  if ((unint64_t)(v3 - 1) >= 0xA || ((0x37Fu >> v6) & 1) == 0)
  {
    qword_1EE52EA58 = (uint64_t)"BUG IN LIBTRACE: unimplemented log error case";
    qword_1EE52EA88 = v3;
    __break(1u);
  }
  v7 = (void *)v5;
  v12[2] = off_1E4156E30[v6];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("OSLogErrorDomain"), v3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id _OSLogInternalError(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = qword_19EA7F0C0[a1 - 4];
  v10[0] = CFSTR("_OSLogErrorInternalCode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v10[1] = CFSTR("_OSLogErrorInternalError");
  v6 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[1] = v6;
  v10[2] = *MEMORY[0x1E0CB2D50];
  if ((unint64_t)(v4 - 1) >= 0xA)
  {
    qword_1EE52EA58 = (uint64_t)"BUG IN LIBTRACE: unimplemented log error case";
    qword_1EE52EA88 = v4;
    __break(1u);
  }
  v11[2] = off_1E4156E80[v4 - 1];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("OSLogErrorDomain"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void sub_19EA4C334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EA4C6B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EA4CC98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

uint64_t _cmp_uuid_node(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return uuid_compare((const unsigned __int8 *)(a2 + 24), (const unsigned __int8 *)(a3 + 24));
}

uint64_t _cmp_uuid_key(int a1, uint64_t a2, unsigned __int8 *uu2)
{
  return uuid_compare((const unsigned __int8 *)(a2 + 24), uu2);
}

uint64_t __Block_byref_object_copy__838(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__839(uint64_t a1)
{

}

uint64_t _uuidpath_error_message(uint64_t a1, _QWORD *a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  _QWORD *v12;
  _QWORD *v13;
  unsigned int *v14;
  uint64_t result;
  uint64_t v16;

  if (_uuidpath_error_message_onceToken != -1)
    dispatch_once(&_uuidpath_error_message_onceToken, &__block_literal_global_17);
  v12 = pthread_getspecific(_uuidpath_error_message_threadKey);
  v13 = v12;
  if (v12 && *v12 == a1 && *((_DWORD *)v12 + 2) < 5u)
  {
    v14 = (unsigned int *)v12;
  }
  else
  {
    v14 = (unsigned int *)malloc_type_calloc(1uLL, 0x38uLL, 0x1010040662321C7uLL);
    *(_QWORD *)v14 = a1;
    pthread_setspecific(_uuidpath_error_message_threadKey, v14);
    if (v13)
      _uuidpath_error_message_free(v13);
  }
  result = vasprintf((char **)&v14[2 * v14[2] + 4], a3, &a9);
  v16 = v14[2];
  *a2 = *(_QWORD *)&v14[2 * v16 + 4];
  v14[2] = v16 + 1;
  return result;
}

void _uuidpath_error_message_free(_QWORD *a1)
{
  unint64_t v2;
  unint64_t i;
  void *v4;

  v2 = *((unsigned int *)a1 + 2);
  if ((_DWORD)v2)
  {
    for (i = 0; i < v2; ++i)
    {
      v4 = (void *)a1[i + 2];
      if (v4)
      {
        free(v4);
        v2 = *((unsigned int *)a1 + 2);
      }
    }
  }
  free(a1);
}

uint64_t ___uuidpath_error_message_block_invoke()
{
  return pthread_key_create((pthread_key_t *)&_uuidpath_error_message_threadKey, (void (__cdecl *)(void *))_uuidpath_error_message_free);
}

uint64_t ___uuidpath_headercache_add_block_invoke()
{
  return pthread_key_create((pthread_key_t *)&headercache_key, (void (__cdecl *)(void *))_uuidpath_headercache_free);
}

void _uuidpath_headercache_free(_QWORD *a1)
{
  void *v2;
  uint64_t i;
  void *v4;

  v2 = (void *)a1[1];
  if (v2)
    munmap(v2, a1[2]);
  for (i = 0; i != 20; i += 4)
  {
    v4 = (void *)a1[i + 5];
    if (v4)
      munmap(v4, a1[i + 6]);
  }
  free(a1);
}

void _uuidpath_pathcache_free(rb_tree_t *a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = rb_tree_iterate(a1, 0, 1u);
  if (v2)
  {
    v3 = v2;
    do
    {
      v4 = rb_tree_iterate(a1, v3, 1u);
      rb_tree_remove_node(a1, v3);
      free(v3);
      v3 = v4;
    }
    while (v4);
  }
  free(a1);
}

uint64_t ___uuidpath_sharedcache_resolve_fd_legacy_block_invoke()
{
  return pthread_key_create((pthread_key_t *)&headercache_key, (void (__cdecl *)(void *))_uuidpath_headercache_free);
}

_DWORD *uuidpath_map_header(const char *a1, uint64_t a2, size_t *a3)
{
  int v5;
  _DWORD *result;
  char __str[1024];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  *a3 = 0;
  if (!a2)
    return 0;
  if (!a1)
  {
    if (_os_trace_uuiddb_path_sandbox_can_read_data_once != -1)
      dispatch_once(&_os_trace_uuiddb_path_sandbox_can_read_data_once, &__block_literal_global_94);
    if (_os_trace_uuiddb_path_sandbox_can_read_data_can_read)
    {
      _os_trace_uuiddb_get_path(0, a2, 1, __str);
      goto LABEL_8;
    }
    return 0;
  }
  v5 = snprintf(__str, 0x400uLL, "%s/", a1);
  _os_trace_uuiddb_get_pathsuffix(a2, 1, &__str[v5], 1024 - v5);
LABEL_8:
  result = (_DWORD *)_os_trace_mmap_at();
  if (result && (*a3 < 0x10 || *result != 1719109785 || result[1] != 2))
  {
    munmap(result, *a3);
    result = 0;
    *a3 = 0;
  }
  return result;
}

uint64_t uuidpath_resolve(char *a1, const void *a2, unint64_t a3, unint64_t a4, const char **a5, const char **a6, _QWORD *a7, _QWORD *a8)
{
  const char *v15;
  int v16;
  int v17;
  int v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v15 = a1;
  if (!a1)
  {
    if (_os_trace_shared_paths_init_once != -1)
      dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
    v15 = (const char *)_os_trace_uuidtext_path;
  }
  v16 = open(v15, 0);
  if (v16 == -1)
  {
    if (a8)
    {
      __error();
      _uuidpath_error_message(a3, a8, "Unable to open source path <%s> (%d)", v20, v21, v22, v23, v24, (char)v15);
      return 0;
    }
    return (uint64_t)a8;
  }
  v17 = v16;
  a8 = (_QWORD *)uuidpath_resolve_fd(v16, a2, a3, a4, a5, a6, a7, a8);
  if (close(v17) != -1)
    return (uint64_t)a8;
  v18 = *__error();
  result = *__error();
  if (v18 != 9)
  {
    _os_assumes_log();
    return (uint64_t)a8;
  }
  qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EE52EA88 = result;
  __break(1u);
  return result;
}

const char *_os_log_resolve_format(__n128 *a1, int a2, unint64_t a3, const char **a4)
{
  unsigned int v5;
  int v6;
  char v7;
  char v8;
  const char *v9;
  const char *v11;

  v11 = 0;
  v5 = BYTE2(a2) & 0xE;
  if (v5 > 0xC)
    goto LABEL_10;
  v6 = 1 << v5;
  if ((v6 & 0x504) != 0)
  {
    v7 = uuidpath_resolve(0, a1, a3, 0, &v11, 0, 0, 0);
    if (!a4 || (v7 & 1) != 0)
      return v11;
    goto LABEL_11;
  }
  if ((v6 & 0x1010) == 0)
  {
LABEL_10:
    if (!a4)
      return v11;
LABEL_11:
    v9 = "<compose failure [UUID]>";
    goto LABEL_12;
  }
  v8 = uuidpath_sharedcache_resolve_fd(0xFFFFFFFFLL, a1, a3, 0, 0, &v11, 0, 0, 0, 0, 0);
  if (a4 && (v8 & 1) == 0)
  {
    v9 = "<compose failure [shared UUID]>";
LABEL_12:
    *a4 = v9;
  }
  return v11;
}

uint64_t OSLogLookupPathWithUUID(const void *a1, _QWORD *a2, _QWORD *a3)
{
  return uuidpath_resolve(0, a1, 0, 0, 0, 0, a2, a3);
}

void sub_19EA4DB74(void *a1)
{
  _QWORD *v1;

  objc_begin_catch(a1);
  v1[9] = 8;
  objc_msgSend(v1, "invalidate");
  objc_end_catch();
  JUMPOUT(0x19EA4DB58);
}

void sub_19EA4DB98(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_19EA4DF94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t os_trace_blob_grow(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  size_t v4;
  size_t v5;
  unsigned int v6;
  unsigned int v7;
  const void *v8;
  void *v9;

  v3 = *(_DWORD *)(a1 + 8);
  if (*(_BYTE *)(a1 + 22))
    v4 = v3;
  else
    v4 = v3 + 1;
  v5 = v4 + a2;
  if (__CFADD__(v4, a2) || HIDWORD(v5))
  {
    v6 = *(_DWORD *)(a1 + 12);
    v7 = *(_DWORD *)(a1 + 16);
  }
  else
  {
    v6 = *(_DWORD *)(a1 + 12);
    if ((v6 & 0x80000000) != 0)
    {
      v7 = *(_DWORD *)(a1 + 16);
    }
    else
    {
      if (2 * v6 > v5)
        LODWORD(v5) = 2 * v6;
      if (*(_DWORD *)(a1 + 16) >= v5)
        v7 = v5;
      else
        v7 = *(_DWORD *)(a1 + 16);
    }
  }
  if (v7 > v6)
  {
    v8 = *(const void **)a1;
    if ((*(_WORD *)(a1 + 20) & 1) != 0)
    {
      *(_QWORD *)a1 = _os_trace_realloc();
    }
    else
    {
      v9 = (void *)_os_trace_malloc();
      *(_QWORD *)a1 = v9;
      memcpy(v9, v8, v4);
      *(_WORD *)(a1 + 20) |= 1u;
    }
    *(_DWORD *)(a1 + 12) = v7;
  }
  return v7 - v4;
}

size_t os_trace_blob_add_slow(uint64_t a1, void *__src, size_t __n)
{
  size_t v3;
  unsigned int v6;
  size_t v7;
  unsigned int v8;

  if ((*(_WORD *)(a1 + 20) & 2) != 0)
    return 0;
  v3 = __n;
  v6 = *(_DWORD *)(a1 + 12);
  v7 = *(char *)(a1 + 22) + v6 - *(_DWORD *)(a1 + 8) - 1;
  if (v7 < __n)
  {
    if (v6 < *(_DWORD *)(a1 + 16))
      v7 = os_trace_blob_grow(a1, __n);
    if (v7 < v3)
    {
      *(_WORD *)(a1 + 20) |= 2u;
      v3 = v7;
    }
  }
  memcpy((void *)(*(_QWORD *)a1 + *(unsigned int *)(a1 + 8)), __src, v3);
  v8 = *(_DWORD *)(a1 + 8) + v3;
  *(_DWORD *)(a1 + 8) = v8;
  if (!*(_BYTE *)(a1 + 22))
    *(_BYTE *)(*(_QWORD *)a1 + v8) = 0;
  return v3;
}

void os_trace_blob_add_unsafe_bytes(uint64_t a1, char *__src, unint64_t a3)
{
  unint64_t v3;
  int v6;
  int v7;
  unsigned int v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unsigned int v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  int v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  size_t v25;
  size_t v26;
  uint64_t v27;
  unsigned int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  char v33;
  __int16 *p_srca;
  uint64_t v35;
  size_t v36;
  int v37;
  int __srca;
  __int16 v39;
  char v40;

  if ((*(_WORD *)(a1 + 20) & 2) == 0)
  {
    v3 = a3;
    v6 = *(_DWORD *)(a1 + 8);
    if (!*(_BYTE *)(a1 + 22))
      ++v6;
    v7 = *(_DWORD *)(a1 + 16);
    if (v7)
    {
      v8 = v7 - v6;
      if (!a3)
        return;
      goto LABEL_10;
    }
    v9 = *(_DWORD *)(a1 + 12);
    v8 = v9 - v6;
    if (!v9)
      v8 = 0;
    if (a3)
    {
LABEL_10:
      if (!v8)
        return;
      v10 = 0;
      v11 = v8;
      while (1)
      {
        if (!*__src)
          return;
        if (v3 >= v11 - v10)
          v12 = v11 - v10;
        else
          v12 = v3;
        if (v12)
        {
          if (_os_trace_unsafe_ascii_once != -1)
            dispatch_once(&_os_trace_unsafe_ascii_once, &__block_literal_global_1086);
          if (v12 >= 1)
          {
            if (((*(_QWORD *)((char *)_os_trace_unsafe_ascii_tbl
                             + (((unint64_t)*__src >> 3) & 0x18)) >> *__src) & 1) != 0)
            {
              v12 = 0;
            }
            else
            {
              v13 = 1;
              while (v13 < v12)
              {
                v14 = __src[v13++];
                if (((*(_QWORD *)((char *)_os_trace_unsafe_ascii_tbl + ((v14 >> 3) & 0x18)) >> v14) & 1) != 0)
                {
                  v12 = v13 - 1;
                  break;
                }
              }
            }
          }
        }
        if ((*(_WORD *)(a1 + 20) & 2) == 0)
        {
          v15 = *(unsigned int *)(a1 + 8);
          if (v12 > (unint64_t)(*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v15 - 1))
          {
            os_trace_blob_add_slow(a1, __src, v12);
          }
          else
          {
            memcpy((void *)(*(_QWORD *)a1 + v15), __src, v12);
            v16 = *(_DWORD *)(a1 + 8) + v12;
            *(_DWORD *)(a1 + 8) = v16;
            if (!*(_BYTE *)(a1 + 22))
              *(_BYTE *)(*(_QWORD *)a1 + v16) = 0;
          }
        }
        v17 = v3 - v12;
        if (!v17)
          return;
        v18 = v12 + v10;
        if (v18 == v11)
          return;
        v19 = &__src[v12];
        v20 = *v19;
        if (!*v19)
          return;
        if ((v20 & 0x80) == 0)
          break;
        v25 = _os_trace_utf8_len(v19, v17);
        if (v25 == -1)
        {
          v10 = v18 + 4;
          if (v10 > v11)
            return;
          v29 = v20 & 0x7F;
          if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * (v20 & 0x7F) + 60) & 0x200) == 0)
          {
            qmemcpy(&v37, "\\M-", 3);
            HIBYTE(v37) = v20 & 0x7F;
            if ((*(_BYTE *)(a1 + 20) & 2) == 0)
            {
              v30 = *(unsigned int *)(a1 + 8);
              if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v30 - 1) > 3)
              {
                v31 = *(_QWORD *)a1;
                v32 = v37;
                goto LABEL_59;
              }
              p_srca = (__int16 *)&v37;
LABEL_71:
              v35 = a1;
              v36 = 4;
LABEL_72:
              os_trace_blob_add_slow(v35, p_srca, v36);
            }
LABEL_62:
            __src = v19 + 1;
            v3 = v17 - 1;
            goto LABEL_63;
          }
          if (v29 == 127)
            v33 = 63;
          else
            v33 = v29 + 64;
          qmemcpy(&__srca, "\\M^", 3);
          HIBYTE(__srca) = v33;
          if ((*(_BYTE *)(a1 + 20) & 2) != 0)
            goto LABEL_62;
          v30 = *(unsigned int *)(a1 + 8);
          if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v30 - 1) <= 3)
          {
            p_srca = (__int16 *)&__srca;
            goto LABEL_71;
          }
          v31 = *(_QWORD *)a1;
          v32 = __srca;
LABEL_59:
          *(_DWORD *)(v31 + v30) = v32;
          v24 = *(_DWORD *)(a1 + 8) + 4;
LABEL_60:
          *(_DWORD *)(a1 + 8) = v24;
          if (!*(_BYTE *)(a1 + 22))
            *(_BYTE *)(*(_QWORD *)a1 + v24) = 0;
          goto LABEL_62;
        }
        v26 = v25;
        if (v25 == -2)
          return;
        v10 = v25 + v18;
        if (v10 > v11)
          return;
        if ((*(_WORD *)(a1 + 20) & 2) == 0)
        {
          v27 = *(unsigned int *)(a1 + 8);
          if (v25 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v27 - 1))
          {
            os_trace_blob_add_slow(a1, v19, v25);
          }
          else
          {
            memcpy((void *)(*(_QWORD *)a1 + v27), v19, v25);
            v28 = *(_DWORD *)(a1 + 8) + v26;
            *(_DWORD *)(a1 + 8) = v28;
            if (!*(_BYTE *)(a1 + 22))
              *(_BYTE *)(*(_QWORD *)a1 + v28) = 0;
          }
        }
        __src = &v19[v26];
        v3 = v17 - v26;
LABEL_63:
        if (!v3 || v10 >= v11)
          return;
      }
      v10 = v18 + 3;
      if (v10 > v11)
        return;
      v21 = v20 + 64;
      if (v20 == 127)
        v21 = 63;
      v39 = 24156;
      v40 = v21;
      if ((*(_BYTE *)(a1 + 20) & 2) != 0)
        goto LABEL_62;
      v22 = *(unsigned int *)(a1 + 8);
      if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v22 - 1) <= 2)
      {
        p_srca = &v39;
        v35 = a1;
        v36 = 3;
        goto LABEL_72;
      }
      v23 = *(_QWORD *)a1 + v22;
      *(_WORD *)v23 = v39;
      *(_BYTE *)(v23 + 2) = v40;
      v24 = *(_DWORD *)(a1 + 8) + 3;
      goto LABEL_60;
    }
  }
}

uint64_t _os_trace_utf8_len(char *a1, unint64_t a2)
{
  char v2;
  unint64_t v3;
  uint64_t v4;

  v2 = *a1;
  if ((*a1 & 0xF8) == 0xF0)
  {
    v3 = 4;
  }
  else if ((v2 & 0xF0) == 0xE0)
  {
    v3 = 3;
  }
  else
  {
    if ((v2 & 0xE0) != 0xC0)
      return -1;
    v3 = 2;
  }
  if (v3 <= a2)
  {
    v4 = 1;
    while ((a1[v4] & 0xC0) == 0x80)
    {
      if (v3 == ++v4)
        return v3;
    }
    return -1;
  }
  return -2;
}

void __os_trace_safe_ascii_strcspn_block_invoke()
{
  uint64_t v0;
  uint64_t v1;

  v0 = 0;
  v1 = MEMORY[0x1E0C80978];
  do
  {
    if ((v0 - 1) > 0x7E || (*(_DWORD *)(v1 + 4 * v0 + 60) & 0x4200) == 0x200)
      _os_trace_unsafe_ascii_tbl[v0 >> 6] |= 1 << v0;
    ++v0;
  }
  while (v0 != 256);
}

tm *os_trace_blob_add_localtime(tm *result, time_t a2, char a3, unsigned int a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  tm v19;
  time_t v20;

  v20 = a2;
  if (BYTE2(result->tm_year))
  {
    qword_1EE52EA58 = (uint64_t)"BUG IN LIBTRACE: Can't use addf() in binary blobs";
    __break(1u);
  }
  else
  {
    v4 = (uint64_t)result;
    if ((result->tm_year & 2) == 0)
    {
      memset(&v19, 0, sizeof(v19));
      result = localtime_r(&v20, &v19);
      if (result)
      {
        os_trace_blob_addf(v4, "%04d-%02d-%02d %02d:%02d:%02d", v7, v8, v9, v10, v11, v12, LOBYTE(v19.tm_year) + 108);
        if (a4 <= 2)
          os_trace_blob_addf(v4, off_1E41572F0[a4], v13, v14, v15, v16, v17, v18, a3);
        return (tm *)os_trace_blob_addf(v4, "%+05ld", v13, v14, v15, v16, v17, v18, (v19.tm_gmtoff / 60 % 60) + 100 * (v19.tm_gmtoff / 3600));
      }
    }
  }
  return result;
}

uint64_t ctf_type_parse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t result;

  v10 = ctf_type_resolve(a1, a2);
  if (v10 == -1)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  else
  {
    v11 = v10;
    if (ctf_type_size(a1, a2) > a5)
      return 0;
    v12 = ctf_type_kind(a1, v11);
    if (v12 < 31)
    {
      v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))ctf_formatters[v12];
      if (v13)
        return v13(a1, a2, a3, a4, a5);
      return 0;
    }
  }
  _os_assert_log();
  result = _os_crash();
  __break(1u);
  return result;
}

uint64_t ctf_integer(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, unsigned int a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  int v17;

  v8 = ctf_type_size(a1, a2);
  if (v8 > a5)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    JUMPOUT(0x19EA50378);
  }
  v15 = v8;
  result = 0;
  switch(v15)
  {
    case 1:
      LOBYTE(v17) = *a4;
      goto LABEL_6;
    case 2:
      LOWORD(v17) = *(_WORD *)a4;
      goto LABEL_6;
    case 4:
      v17 = *(_DWORD *)a4;
LABEL_6:
      os_trace_blob_addf(a3, "%#x", v9, v10, v11, v12, v13, v14, v17);
      goto LABEL_8;
    case 8:
      os_trace_blob_addf(a3, "%#llx", v9, v10, v11, v12, v13, v14, *(_QWORD *)a4);
LABEL_8:
      result = 1;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t ctf_float(uint64_t a1, uint64_t a2, uint64_t a3, double *a4, unsigned int a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t result;

  v8 = ctf_type_size(a1, a2);
  if (v8 > a5)
  {
    _os_assert_log();
    result = _os_crash();
    __break(1u);
  }
  else
  {
    if (v8 == 8)
    {
      v15 = *a4;
      goto LABEL_6;
    }
    if (v8 == 4)
    {
      v15 = *(float *)a4;
LABEL_6:
      os_trace_blob_addf(a3, "%.20g", v9, v10, v11, v12, v13, v14, SLOBYTE(v15));
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t ctf_pointer(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, unsigned int a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;

  v8 = ctf_type_size(a1, a2);
  if (v8 > a5)
  {
    _os_assert_log();
    result = _os_crash();
    __break(1u);
  }
  else
  {
    if (v8 == 8)
    {
      os_trace_blob_addf(a3, "0x%llx", v9, v10, v11, v12, v13, v14, *a4);
      return 1;
    }
    if (v8 == 4)
    {
      os_trace_blob_addf(a3, "0x%x", v9, v10, v11, v12, v13, v14, *(_DWORD *)a4);
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t ctf_array(uint64_t (***a1)(uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  int v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  unsigned int v25;
  unint64_t v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;
  _DWORD *v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t result;
  uint64_t __src;
  int v37;
  uint64_t v38[2];
  uint64_t v39;

  v38[0] = 0;
  v38[1] = 0;
  v39 = 0;
  if (ctf_array_info(a1, a2, (uint64_t)v38))
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_41;
  }
  v5 = v38[0];
  if (ctf_type_kind((uint64_t)a1, v38[0]) != 1)
    goto LABEL_17;
  v37 = 0;
  __src = 0;
  if (ctf_type_encoding(a1, v5, (unsigned int *)&__src))
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_52;
  }
  if ((__src & 2) == 0)
  {
LABEL_17:
    v22 = ctf_type_size((uint64_t)a1, v5);
    if ((unint64_t)(v22 - 1) < 0xFFFF)
    {
      LODWORD(v6) = v22;
      v7 = v39;
      if ((int)v39 * (int)v22 <= a5)
      {
        LOBYTE(__src) = 91;
        if ((*(_WORD *)(a3 + 20) & 2) != 0)
          goto LABEL_23;
        v23 = *(unsigned int *)(a3 + 8);
        if (*(char *)(a3 + 22) + *(_DWORD *)(a3 + 12) - 1 != (_DWORD)v23)
        {
          *(_BYTE *)(*(_QWORD *)a3 + v23) = 91;
          v24 = *(_DWORD *)(a3 + 8) + 1;
          *(_DWORD *)(a3 + 8) = v24;
          if (!*(_BYTE *)(a3 + 22))
            *(_BYTE *)(*(_QWORD *)a3 + v24) = 0;
LABEL_23:
          if ((_DWORD)v7)
          {
LABEL_24:
            v25 = 0;
            v26 = 0;
            while ((ctf_type_parse((uint64_t)a1, v5, a3, a4 + v25, (unsigned __int16)v6) & 1) != 0)
            {
              if (v26 < (v7 - 1) && (*(_WORD *)(a3 + 20) & 2) == 0)
              {
                v27 = *(unsigned int *)(a3 + 8);
                if ((*(char *)(a3 + 22) + *(_DWORD *)(a3 + 12) - v27 - 1) <= 1)
                {
                  os_trace_blob_add_slow(a3, ", ", 2uLL);
                }
                else
                {
                  *(_WORD *)(*(_QWORD *)a3 + v27) = 8236;
                  v28 = *(_DWORD *)(a3 + 8) + 2;
                  *(_DWORD *)(a3 + 8) = v28;
                  if (!*(_BYTE *)(a3 + 22))
                    *(_BYTE *)(*(_QWORD *)a3 + v28) = 0;
                }
              }
              ++v26;
              v25 += v6;
              if (v7 == v26)
                goto LABEL_44;
            }
            if ((*(_WORD *)(a3 + 20) & 2) != 0)
              goto LABEL_37;
            v29 = *(unsigned int *)(a3 + 8);
            if ((*(char *)(a3 + 22) + *(_DWORD *)(a3 + 12) - v29 - 1) > 6)
            {
              v30 = (_DWORD *)(*(_QWORD *)a3 + v29);
              *(_DWORD *)((char *)v30 + 3) = 1047687026;
              *v30 = 1920099644;
              v31 = *(_DWORD *)(a3 + 8) + 7;
              *(_DWORD *)(a3 + 8) = v31;
              if (*(_BYTE *)(a3 + 22))
              {
LABEL_37:
                v32 = 0;
                goto LABEL_45;
              }
              v32 = 0;
              *(_BYTE *)(*(_QWORD *)a3 + v31) = 0;
LABEL_45:
              LOBYTE(__src) = 93;
              if ((*(_WORD *)(a3 + 20) & 2) == 0)
              {
                v33 = *(unsigned int *)(a3 + 8);
                if (*(char *)(a3 + 22) + *(_DWORD *)(a3 + 12) - 1 == (_DWORD)v33)
                {
                  os_trace_blob_add_slow(a3, &__src, 1uLL);
                }
                else
                {
                  *(_BYTE *)(*(_QWORD *)a3 + v33) = 93;
                  v34 = *(_DWORD *)(a3 + 8) + 1;
                  *(_DWORD *)(a3 + 8) = v34;
                  if (!*(_BYTE *)(a3 + 22))
                    *(_BYTE *)(*(_QWORD *)a3 + v34) = 0;
                }
              }
              return v32;
            }
LABEL_52:
            os_trace_blob_add_slow(a3, "<error>", 7uLL);
            goto LABEL_37;
          }
LABEL_44:
          v32 = 1;
          goto LABEL_45;
        }
LABEL_43:
        os_trace_blob_add_slow(a3, &__src, 1uLL);
        if ((_DWORD)v7)
          goto LABEL_24;
        goto LABEL_44;
      }
LABEL_42:
      _os_assert_log();
      _os_crash();
      __break(1u);
      goto LABEL_43;
    }
LABEL_41:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_42;
  }
  v6 = v39;
  if (v39 <= a5)
  {
    if ((_DWORD)v39)
    {
      v7 = 0;
      v18 = MEMORY[0x1E0C80978];
      while (1)
      {
        v19 = *(char *)(a4 + v7);
        if (!*(_BYTE *)(a4 + v7))
          break;
        if ((v19 & 0x80000000) != 0)
          v20 = __maskrune(v19, 0x40000uLL);
        else
          v20 = *(_DWORD *)(v18 + 4 * v19 + 60) & 0x40000;
        ++v7;
        if (v20)
          v21 = v7 >= v6;
        else
          v21 = 1;
        if (v21)
          goto LABEL_17;
      }
      os_trace_blob_addf(a3, "\"%.*s\"", v12, v13, v14, v15, v16, v17, v6);
      return 1;
    }
    goto LABEL_17;
  }
  _os_assert_log();
  result = _os_crash();
  __break(1u);
  return result;
}

BOOL ctf_recursive(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, __int16 a5)
{
  uint64_t v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  _QWORD v14[3];
  uint64_t v15;
  char __src;

  v14[0] = a1;
  v14[1] = a3;
  v14[2] = a4;
  v15 = 0x10000;
  LOWORD(v15) = a5;
  __src = 123;
  if ((*(_WORD *)(a3 + 20) & 2) == 0)
  {
    v8 = *(unsigned int *)(a3 + 8);
    if (*(char *)(a3 + 22) + *(_DWORD *)(a3 + 12) - 1 == (_DWORD)v8)
    {
      os_trace_blob_add_slow(a3, &__src, 1uLL);
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)a3 + v8) = 123;
      v9 = *(_DWORD *)(a3 + 8) + 1;
      *(_DWORD *)(a3 + 8) = v9;
      if (!*(_BYTE *)(a3 + 22))
        *(_BYTE *)(*(_QWORD *)a3 + v9) = 0;
    }
  }
  v10 = ctf_member_iter(a1, a2, (uint64_t (*)(const char *, _QWORD, unint64_t, uint64_t))ctf_member_parse, (uint64_t)v14);
  __src = 125;
  if ((*(_WORD *)(a3 + 20) & 2) == 0)
  {
    v11 = *(unsigned int *)(a3 + 8);
    if (*(char *)(a3 + 22) + *(_DWORD *)(a3 + 12) - 1 == (_DWORD)v11)
    {
      os_trace_blob_add_slow(a3, &__src, 1uLL);
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)a3 + v11) = 125;
      v12 = *(_DWORD *)(a3 + 8) + 1;
      *(_DWORD *)(a3 + 8) = v12;
      if (!*(_BYTE *)(a3 + 22))
        *(_BYTE *)(*(_QWORD *)a3 + v12) = 0;
    }
  }
  return v10 == 0;
}

uint64_t ctf_enum(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, unsigned int a5)
{
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  char v27;
  _QWORD v28[3];
  void *v29[2];
  uint64_t v30;
  char v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = ctf_type_size(a1, a2);
  if (v10 > a5)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  switch(v10)
  {
    case 1:
      v11 = *a4;
      goto LABEL_7;
    case 2:
      v11 = *(unsigned __int16 *)a4;
      goto LABEL_7;
    case 4:
      v11 = *(unsigned int *)a4;
      goto LABEL_7;
    case 8:
      v11 = *(_QWORD *)a4;
      if (HIDWORD(v11))
      {
        _os_assumes_log();
        v27 = v11;
        goto LABEL_16;
      }
LABEL_7:
      if (ctf_enum_name(a1, a2, v11))
      {
        v27 = v11;
        v18 = "[%#llx %s]";
LABEL_9:
        os_trace_blob_addf(a3, v18, v12, v13, v14, v15, v16, v17, v27);
        return 1;
      }
      if (!v11)
      {
        v27 = 0;
LABEL_16:
        v18 = "%#llx";
        goto LABEL_9;
      }
      v30 = 0;
      v28[2] = 1;
      v29[0] = &v31;
      v29[1] = (void *)0x40000000000;
      v28[1] = v29;
      v28[0] = v11;
      if (ctf_enum_iter(a1, a2, (uint64_t (*)(char *, _QWORD, uint64_t))ctf_enum_flag_parse, (uint64_t)v28) == 1)os_trace_blob_addf(a3, "[%#llx %s]", v20, v21, v22, v23, v24, v25, v11);
      else
        os_trace_blob_addf(a3, "%#llx", v20, v21, v22, v23, v24, v25, v11);
      if ((v30 & 0x100000000) != 0)
      {
        v26 = v29[0];
        v29[0] = (void *)3954044928;
        WORD2(v30) = 0;
        free(v26);
      }
      return 1;
    default:
      _os_assumes_log();
      return 0;
  }
}

BOOL ctf_enum_flag_parse(char *__s, int a2, uint64_t a3)
{
  int v3;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  uint64_t v13;
  unsigned int v14;
  char __src;

  v3 = *(_DWORD *)a3;
  if ((*(_DWORD *)a3 & a2) != 0)
  {
    if (!*(_BYTE *)(a3 + 16))
    {
      v7 = *(_QWORD *)(a3 + 8);
      __src = 124;
      if ((*(_WORD *)(v7 + 20) & 2) == 0)
      {
        v8 = *(unsigned int *)(v7 + 8);
        if (*(char *)(v7 + 22) + *(_DWORD *)(v7 + 12) - 1 == (_DWORD)v8)
        {
          os_trace_blob_add_slow(v7, &__src, 1uLL);
        }
        else
        {
          *(_BYTE *)(*(_QWORD *)v7 + v8) = 124;
          v9 = *(_DWORD *)(v7 + 8) + 1;
          *(_DWORD *)(v7 + 8) = v9;
          if (!*(_BYTE *)(v7 + 22))
            *(_BYTE *)(*(_QWORD *)v7 + v9) = 0;
        }
      }
    }
    *(_BYTE *)(a3 + 16) = 0;
    v10 = *(_QWORD *)(a3 + 8);
    v11 = strlen(__s);
    if ((*(_WORD *)(v10 + 20) & 2) == 0)
    {
      v12 = v11;
      v13 = *(unsigned int *)(v10 + 8);
      if (v11 > (*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - v13 - 1))
      {
        os_trace_blob_add_slow(v10, __s, v11);
      }
      else
      {
        memcpy((void *)(*(_QWORD *)v10 + v13), __s, v11);
        v14 = *(_DWORD *)(v10 + 8) + v12;
        *(_DWORD *)(v10 + 8) = v14;
        if (!*(_BYTE *)(v10 + 22))
          *(_BYTE *)(*(_QWORD *)v10 + v14) = 0;
      }
    }
    v3 = *(_DWORD *)a3 ^ a2;
    *(_DWORD *)a3 = v3;
  }
  return v3 == 0;
}

uint64_t ctf_member_parse(char a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;

  v9 = ctf_type_size(*(_QWORD *)a4, a2);
  if ((unint64_t)(v9 - 1) >= 0xFFFF)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_10;
  }
  v4 = v9;
  if (!*(_BYTE *)(a4 + 26))
  {
    v16 = *(_QWORD *)(a4 + 8);
    if ((*(_WORD *)(v16 + 20) & 2) == 0)
    {
      v17 = *(unsigned int *)(v16 + 8);
      if ((*(char *)(v16 + 22) + *(_DWORD *)(v16 + 12) - v17 - 1) <= 1)
        goto LABEL_11;
      *(_WORD *)(*(_QWORD *)v16 + v17) = 8236;
      v18 = *(_DWORD *)(v16 + 8) + 2;
      *(_DWORD *)(v16 + 8) = v18;
      if (!*(_BYTE *)(v16 + 22))
        *(_BYTE *)(*(_QWORD *)v16 + v18) = 0;
    }
  }
  while (1)
  {
    *(_BYTE *)(a4 + 26) = 0;
    os_trace_blob_addf(*(_QWORD *)(a4 + 8), "%s = ", v10, v11, v12, v13, v14, v15, a1);
    v19 = *(_QWORD *)(a4 + 16);
    v20 = v19 + (a3 >> 3);
    if (v20 + v4 <= v19 + (unint64_t)*(unsigned __int16 *)(a4 + 24))
      break;
LABEL_10:
    _os_assert_log();
    v16 = _os_crash();
    __break(1u);
LABEL_11:
    os_trace_blob_add_slow(v16, ", ", 2uLL);
  }
  return ctf_type_parse(*(_QWORD *)a4, a2, *(_QWORD *)(a4 + 8), v20, (unsigned __int16)v4) - 1;
}

uint64_t _convertUUIDStringToUUID(const char *a1, unsigned __int8 *a2)
{
  unint64_t v4;
  unint64_t v5;
  int v6;
  int v7;
  char __str[37];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (strlen(a1) == 32
    && (*a1 & 0x80000000) == 0
    && (*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * *(unsigned __int8 *)a1 + 60) & 0x10000) != 0)
  {
    v4 = 0;
    while (v4 != 31)
    {
      v5 = v4;
      v6 = a1[v4 + 1];
      if ((v6 & 0x80000000) == 0)
      {
        v7 = *(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v6 + 60);
        v4 = v5 + 1;
        if ((v7 & 0x10000) != 0)
          continue;
      }
      if (v5 <= 0x1E)
        goto LABEL_11;
      break;
    }
    snprintf(__str, 0x25uLL, "%.8s-%.4s-%.4s-%.4s-%.12s", a1, a1 + 8, a1 + 12, a1 + 16, a1 + 20);
    uuid_parse(__str, a2);
    return 1;
  }
  else
  {
LABEL_11:
    _os_assumes_log();
    return 0;
  }
}

BOOL _simple_support_validate_chunk(uint64_t a1)
{
  return *(_DWORD *)a1 == 24580 && !*(_DWORD *)(a1 + 4) && *(_QWORD *)(a1 + 8) > 0x48uLL;
}

uint64_t _simple_support_validate_payload(uint64_t a1, unint64_t *a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 8) - 72;
  if (v2 < 0xC)
    return 0;
  v3 = *(unsigned int *)(a1 + 92);
  v4 = *(unsigned int *)(a1 + 96);
  v5 = v3 + v4 + 12;
  if (v2 < v5
    || !(_DWORD)v4
    || *(_BYTE *)(a1 + 100 + v3 + (v4 - 1))
    || (_DWORD)v3 && *(_BYTE *)(a1 + 100 + (v3 - 1)))
  {
    return 0;
  }
  result = a1 + 88;
  if (a2)
    *a2 = v5;
  return result;
}

void logging_support_test_oslog(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = 136315138;
    v3 = a1;
    _os_log_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LoggingSupportTest: %s", (uint8_t *)&v2, 0xCu);
  }
}

void sub_19EA52704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _os_log_set_nscf_formatter(uint64_t result)
{
  _NSCF_function = result;
  return result;
}

uint64_t _os_log_get_nscf_formatter()
{
  return _NSCF_function;
}

uint64_t requiresLogicalExpression(void *a1)
{
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
    if (objc_msgSend(v2, "compoundPredicateType") == 2)
    {
      v10 = 0u;
      v11 = 0u;
      v8 = 0u;
      v9 = 0u;
      objc_msgSend(v2, "subpredicates", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
      {
        v5 = *(_QWORD *)v9;
        while (2)
        {
          for (i = 0; i != v4; ++i)
          {
            if (*(_QWORD *)v9 != v5)
              objc_enumerationMutation(v3);
            if ((requiresLogicalExpression(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i)) & 1) != 0)
            {
              v4 = 1;
              goto LABEL_15;
            }
          }
          v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
          if (v4)
            continue;
          break;
        }
      }
LABEL_15:

    }
    else
    {
      v4 = 1;
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

BOOL __ctf_metadata_open_ctf_block_invoke(uint64_t a1, unsigned __int16 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = _ctf_open_buffer(a2, a3, a3, a4, a5, a6, a7, a8);
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0;
}

uint64_t _ctf_open_buffer(unsigned __int16 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  const char *v10;
  __int128 v11;
  unsigned __int16 *v12;
  uint64_t v13;
  __int128 v14;

  if (*a1 != 53233 || *((_BYTE *)a1 + 2) != 4)
    return 0;
  v10 = ".SUNW_ctf";
  v11 = xmmword_19EA7F2A0;
  v12 = a1;
  v13 = a2;
  v14 = xmmword_19EA7F2B0;
  v9 = 0;
  return ctf_bufopen((__int128 *)&v10, 0, 0, &v9, a5, a6, a7, a8);
}

void sub_19EA568F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_19EA56D3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location,uint64_t a25,uint64_t a26,char a27)
{
  id *v27;

  _Block_object_dispose(&a27, 8);
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _logHandle()
{
  if (_logHandle_onceToken != -1)
    dispatch_once(&_logHandle_onceToken, &__block_literal_global_193);
  return (id)_logHandle_handle;
}

void ___logHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.loggingsupport", "os_log_statistics");
  v1 = (void *)_logHandle_handle;
  _logHandle_handle = (uint64_t)v0;

}

uint64_t __Block_byref_object_copy__1986(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1987(uint64_t a1)
{

}

uint64_t _state_support_decode_data(uint64_t a1)
{
  size_t v2;
  _QWORD *plugin;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  if ((*(_DWORD *)a1 - 2) >= 2)
  {
    if (*(_DWORD *)a1 == 1 && *(_DWORD *)(a1 + 4))
    {
      v6 = (void *)MEMORY[0x1A1AEC1C8]();
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", a1 + 200, *(unsigned int *)(a1 + 4), 0);
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v7, 0, 0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "description");
      v5 = objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v6);
      return v5;
    }
    return 0;
  }
  v2 = strlen((const char *)(a1 + 8));
  plugin = os_log_fmt_get_plugin((const char *)(a1 + 8), v2);
  if (!plugin)
    return 0;
  v4 = (uint64_t (*)(uint64_t, _QWORD, uint64_t))plugin[4];
  if (!v4)
    return 0;
  return v4(a1 + 72, *(unsigned int *)(a1 + 4), a1 + 200);
}

#error "19EA57250: call analysis failed (funcsize=18)"

BOOL _state_support_validate_chunk(uint64_t a1)
{
  return *(_DWORD *)a1 == 24579 && !*(_DWORD *)(a1 + 4) && *(_QWORD *)(a1 + 8) > 0x30uLL;
}

uint64_t _state_support_validate_payload(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if ((unint64_t)(v1 - 48) < 0xC8)
    return 0;
  if (v1 - 248 >= (unint64_t)*(unsigned int *)(a1 + 68))
    return a1 + 64;
  return 0;
}

_BYTE *_state_support_create_message(uint64_t a1, _QWORD *a2)
{
  unint64_t v3;
  BOOL v4;
  unint64_t v5;
  _BYTE *v6;
  void *v9;
  const void *v10;
  size_t v11;
  uint64_t v12;
  size_t v13;
  _BYTE *v14;

  if (*(_DWORD *)a1 != 24579)
    return 0;
  if (*(_DWORD *)(a1 + 4))
    return 0;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = v3 >= 0xF8;
  v5 = v3 - 248;
  if (!v4 || v5 < *(unsigned int *)(a1 + 68))
    return 0;
  v9 = (void *)_state_support_decode_data(a1 + 64);
  v10 = (const void *)(a1 + 200);
  v11 = strnlen((const char *)(a1 + 200), 0x3FuLL);
  v12 = objc_msgSend(v9, "lengthOfBytesUsingEncoding:", 4);
  if (v11 | v12)
  {
    v13 = v11 + 1;
    v14 = (_BYTE *)_os_trace_malloc();
    v6 = v14;
    if (v11)
    {
      memcpy(v14, v10, v11);
      v6[v11] = 10;
      v6[v13] = 0;
    }
    else
    {
      v13 = 0;
    }
    if (v12)
      objc_msgSend(v9, "getCString:maxLength:encoding:", &v6[v13], v12 + 1, 4);
  }
  else
  {
    v13 = 0;
    v6 = 0;
  }
  if (a2)
    *a2 = v13 + v12;

  return v6;
}

uint64_t _OSLogUUIDMapAddFromCatalog(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *i;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[2];
  uint64_t (*v11)(uint64_t);
  void *v12;
  _QWORD *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = ___OSLogUUIDMapAddFromCatalog_block_invoke;
  v9[3] = &__block_descriptor_40_e69_v16__0__catalog_procinfo_s_SSiQII_16C__16C___hashtable___hashtable__8l;
  v9[4] = a2;
  v10[0] = MEMORY[0x1E0C809B0];
  v5 = *(_QWORD *)(a1 + 40);
  v10[1] = 0x40000000;
  v11 = ___catalog_for_each_procinfo_block_invoke;
  v12 = &unk_1E4156438;
  v13 = v9;
  if (v5)
  {
    for (i = *(_QWORD **)(v5 + 16); i; i = (_QWORD *)*i)
      ((void (*)(_QWORD *, _QWORD))v11)(v10, i[4]);
  }
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = ___OSLogUUIDMapAddFromCatalog_block_invoke_3;
  v8[3] = &__block_descriptor_40_e15_v24__0Q8_16C_16l;
  v8[4] = a2;
  return _catalog_for_each_uuid(a1, (uint64_t)v8);
}

void _OSLogGenerateXattrs(uint64_t a1, unint64_t a2, uint64_t a3)
{
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD v8[2];
  uint64_t (*v9)(uint64_t, uint64_t);
  void *v10;
  uint64_t v11;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v9 = ___OSLogGenerateXattrs_block_invoke;
  v10 = &__block_descriptor_40_e767_B16__0__tracev3_chunk_s__tracev3_chunk_preamble_s_IIQ_____tracev3_chunk_header_s__mach_timebase_info_II_QqiiiI_tracev3_subchunk_preamble_s_II__tracev3_subchunk_continuous_s_Q__tracev3_subchunk_preamble_s_II__tracev3_subchunk_systeminfo_s_ii_16c__32c___tracev3_subchunk_preamble_s_II__tracev3_subchunk_generation_s__16C_ii__tracev3_subchunk_preamble_s_II__tracev3_subchunk_timezone_s__48c____tracev3_chunk_catalog_s_SSSS_0C___tracev3_chunk_catalog_v2_s_SSSSS_3S_Q_0C___tracev3_chunk_log_preamble_s_QIC_3C___tracev3_chunk_firehose_s_QICC_2C__0C___tracev3_chunk_firehose_old_s_QiCC_0C___tracev3_chunk_oversize_s_QIC_3C_QISS_0C___tracev3_chunk_oversize_old_s_QISS_0C___tracev3_chunk_statedump_s_QIC_3C_QQ_16C__0C___tracev3_chunk_simple_s_QICC_2C_QQQ_16C__16C__0C___0C___8l;
  v11 = a3;
  v5 = v8;
  v6 = 0;
  do
  {
    if (a2 - v6 < 0x10)
      break;
    v7 = *(_QWORD *)(a1 + v6 + 8);
    if (a2 - v6 - 16 < v7)
      break;
    if (!((unsigned int (*)(_QWORD *))v9)(v5))
      break;
    v6 = (v6 + v7 + 23) & 0xFFFFFFFFFFFFFFF8;
  }
  while (v6 - 1 < a2);

}

void _OSLogWarningMessage(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  void (**v10)(id, char *);
  char __str[256];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v10 = a1;
    vsnprintf(__str, 0x100uLL, a2, &a9);
    v10[2](v10, __str);

  }
}

uint64_t OSLogCreateArchive(const char *a1, uint64_t a2, int64_t a3, BOOL a4, void *a5)
{
  id v9;
  void *v10;
  uint64_t ArchiveWithDictionary;

  v9 = a5;
  _InitArchiveDictionary(a1, a2, a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ArchiveWithDictionary = OSLogCreateArchiveWithDictionary(v10, v9);

  return ArchiveWithDictionary;
}

id _InitArchiveDictionary(const char *a1, uint64_t a2, int64_t a3, BOOL a4)
{
  xpc_object_t v8;

  v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v8, "path", a1);
  if (a2)
    xpc_dictionary_set_uint64(v8, "base_size", a2);
  xpc_dictionary_set_int64(v8, "base_time", a3);
  xpc_dictionary_set_BOOL(v8, "livedata", a4);
  return v8;
}

uint64_t OSLogCreateArchiveWithDictionary(void *a1, void *a2)
{
  id v3;
  id v4;
  const char *string;
  const char *v6;
  char *v7;
  int v8;
  char v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t int64;
  char v21;
  int *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t uint64;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  void *v56;
  void *v57;
  char *v58;
  char *v59;
  int v60;
  const char *v61;
  int v62;
  id v63;
  void *v64;
  uint64_t result;
  int v66;
  _QWORD aBlock[4];
  id v68;
  int v69;
  int v70;
  int v71;
  char *v72;
  _QWORD v73[5];
  _QWORD v74[7];

  v74[5] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  string = xpc_dictionary_get_string(v3, "path");
  if (string)
    v6 = string;
  else
    v6 = ".";
  v72 = 0;
  if (strcasestr(v6, ".logarchive"))
  {
    v7 = strdup(v6);
    v72 = v7;
  }
  else
  {
    asprintf(&v72, "%s/system_logs.logarchive", v6);
    v7 = v72;
  }
  v8 = mkdir(v7, 0x1FFu);
  v9 = (char)v72;
  if (v8)
  {
    v10 = __error();
    strerror(*v10);
    __error();
    _OSLogWarningMessage(v4, "failed to create directory: %s: %s (%d)", v11, v12, v13, v14, v15, v16, v9);
LABEL_9:
    free(v72);
    v17 = *__error();
LABEL_70:

    return v17;
  }
  v18 = open(v72, 0);
  if (v18 == -1)
  {
    v21 = (char)v72;
    v22 = __error();
    strerror(*v22);
    __error();
    _OSLogWarningMessage(v4, "failed to open directory: %s: %s (%d)", v23, v24, v25, v26, v27, v28, v21);
    goto LABEL_9;
  }
  v19 = v18;
  if (xpc_dictionary_get_int64(v3, "base_time") < 1)
    int64 = 0;
  else
    int64 = xpc_dictionary_get_int64(v3, "base_time");
  if ((uint64_t)xpc_dictionary_get_uint64(v3, "ttl_time") < 1)
    uint64 = 0;
  else
    uint64 = xpc_dictionary_get_uint64(v3, "ttl_time");
  if ((uint64_t)xpc_dictionary_get_uint64(v3, "sp_time") < 1)
    v30 = 0;
  else
    v30 = xpc_dictionary_get_uint64(v3, "sp_time");
  if ((uint64_t)xpc_dictionary_get_uint64(v3, "hv_time") <= 0)
  {
    if (uint64)
      v33 = uint64;
    else
      v33 = int64;
    if (v30)
      v34 = v30;
    else
      v34 = int64;
  }
  else
  {
    v31 = xpc_dictionary_get_uint64(v3, "hv_time");
    v32 = v31;
    if (uint64)
      v33 = uint64;
    else
      v33 = int64;
    if (v30)
      v34 = v30;
    else
      v34 = int64;
    if (v31)
    {
      if (int64)
        goto LABEL_41;
      goto LABEL_38;
    }
  }
  v32 = int64;
  if (int64)
    goto LABEL_41;
LABEL_38:
  if ((uint64_t)xpc_dictionary_get_uint64(v3, "base_time") < 1)
    int64 = 0;
  else
    int64 = xpc_dictionary_get_uint64(v3, "base_time");
LABEL_41:
  xpc_dictionary_get_value(v3, "livedata");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = &unk_1E4165398;
  if (v35 && !xpc_dictionary_get_BOOL(v3, "livedata"))
    v36 = &unk_1E41653B0;

  v73[0] = _OSLogConstructPersistStart;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", int64);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v37;
  v73[1] = _OSLogConstructSpecialStart;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v33);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v74[1] = v38;
  v73[2] = _OSLogConstructSignpostStart;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v34);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v74[2] = v39;
  v73[3] = _OSLogConstructHighVolumeStart;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v32);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v73[4] = CFSTR("_OSLogConstructSkipMemoryStores");
  v74[3] = v40;
  v74[4] = v36;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, v73, 5);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v41, "mutableCopy");

  xpc_dictionary_get_value(v3, "base_size");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    v44 = xpc_dictionary_get_uint64(v3, "base_size");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setObject:forKeyedSubscript:", v45, OSLogConstructPersistSizeLimit);

  }
  else
  {
    v44 = -1;
  }
  xpc_dictionary_get_value(v3, "ttl_size");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", xpc_dictionary_get_uint64(v3, "ttl_size"));
    v47 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v44 == -1)
      goto LABEL_52;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v44);
    v47 = objc_claimAutoreleasedReturnValue();
  }
  v48 = (void *)v47;
  objc_msgSend(v42, "setObject:forKeyedSubscript:", v47, OSLogConstructSpecialSizeLimit);

LABEL_52:
  xpc_dictionary_get_value(v3, "sp_size");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", xpc_dictionary_get_uint64(v3, "sp_size"));
    v50 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v44 == -1)
      goto LABEL_57;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v44);
    v50 = objc_claimAutoreleasedReturnValue();
  }
  v51 = (void *)v50;
  objc_msgSend(v42, "setObject:forKeyedSubscript:", v50, OSLogConstructSignpostSizeLimit);

LABEL_57:
  xpc_dictionary_get_value(v3, "hv_size");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", xpc_dictionary_get_uint64(v3, "hv_size"));
    v53 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v44 == -1)
      goto LABEL_62;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v44);
    v53 = objc_claimAutoreleasedReturnValue();
  }
  v54 = (void *)v53;
  objc_msgSend(v42, "setObject:forKeyedSubscript:", v53, OSLogConstructHighVolumeSizeLimit);

LABEL_62:
  v55 = xpc_dictionary_get_string(v3, "predicate");
  if (v55)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setObject:forKeyedSubscript:", v56, CFSTR("OSLogConstructPredicate"));

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v72);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setObject:forKeyedSubscript:", v57, CFSTR("OSLogConstructTargetDir"));

  }
  free(v72);
  v58 = getenv("SUDO_UID");
  v59 = getenv("SUDO_GID");
  v60 = 0;
  if (v58)
  {
    v61 = v59;
    v62 = 0;
    if (v59)
    {
      v60 = strtoul(v58, 0, 10);
      v62 = strtoul(v61, 0, 10);
    }
  }
  else
  {
    v62 = 0;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __OSLogCreateArchiveWithDictionary_block_invoke;
  aBlock[3] = &unk_1E4157958;
  v63 = v4;
  v68 = v63;
  v69 = v19;
  v70 = v60;
  v71 = v62;
  v64 = _Block_copy(aBlock);
  v17 = OSLogConstructArchive(v42, v63, v64);
  if (close(v19) != -1)
    goto LABEL_69;
  v66 = *__error();
  result = *__error();
  if (v66 != 9)
  {
    _os_assumes_log();
LABEL_69:

    goto LABEL_70;
  }
  qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EE52EA88 = result;
  __break(1u);
  return result;
}

uint64_t OSLogConstructArchive(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  int is_development_build;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const __CFDictionary *v25;
  const __CFDictionary *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  BOOL v50;
  char v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _xpc_connection_s *v67;
  xpc_object_t v68;
  uint64_t v69;
  id v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  NSObject *v112;
  id v113;
  NSObject *v114;
  NSObject *v115;
  NSObject *v116;
  NSObject *v117;
  NSObject *v118;
  NSObject *v119;
  id v120;
  NSObject *v121;
  NSObject *v122;
  id v123;
  id v124;
  _OSLogCollectionReference *v125;
  _OSLogDirectoryReference *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  _OSLogDirectoryReference *v133;
  _OSLogDirectoryReference *v134;
  char v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  char v142;
  uint64_t v143;
  char v144;
  uint64_t v145;
  int v146;
  uint64_t v147;
  int v148;
  uint64_t result;
  int v150;
  int v151;
  void *v152;
  uint64_t v153;
  int *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  int *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  int *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  int v176;
  int v177;
  void *v178;
  int v179;
  void *v180;
  void *v181;
  id v182;
  uint64_t file_at;
  id v184;
  void *v185;
  void *v186;
  id v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  id v194;
  char v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  id v208;
  uint64_t TempDirectory;
  uint64_t v210;
  int *v211;
  char v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  int v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  FILE *v226;
  void *v227;
  _BOOL4 v228;
  uint64_t v229;
  time_t v230;
  unint64_t v231;
  unint64_t v232;
  unint64_t v233;
  unint64_t v234;
  unint64_t v235;
  unint64_t v236;
  unint64_t v237;
  unint64_t v238;
  unint64_t v239;
  unint64_t v240;
  unint64_t v241;
  void *v242;
  uint64_t v243;
  _OSLogPredicateMapper *v244;
  void *v245;
  _BOOL4 v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  void *v253;
  _OSLogCatalogFilter *v254;
  FILE *v255;
  int *v256;
  char v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  id v264;
  void *v265;
  int v266;
  int v267;
  int v268;
  uint64_t v269;
  void *v270;
  int v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  int *v278;
  char v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  int v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  char v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  int *v301;
  char v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  int *v309;
  char v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  int v317;
  int v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  int *v326;
  char v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  int *v334;
  char v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  int v342;
  char v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  int *v350;
  char v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  char v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  BOOL v366;
  id v367;
  void *v368;
  id v369;
  char v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  char v377;
  void *v378;
  uint64_t v379;
  id v380;
  id v381;
  id v382;
  char *impl;
  void *key;
  char *keya;
  void *v386;
  id obj;
  FILE *obja;
  void *v389;
  id v390;
  id v391;
  uint64_t v392;
  void *v393;
  int v394;
  id v395;
  void *v396;
  uint64_t v397;
  _OSLogDirectoryReference *v398;
  int v399;
  uint64_t v400;
  unint64_t v401;
  char *v402;
  void *v403;
  unint64_t v404;
  char *v405;
  void *v406;
  unint64_t v407;
  char *v408;
  void *v409;
  unint64_t v410;
  id v411;
  uint64_t v412;
  void *v413;
  void *v414;
  void *v415;
  id v416;
  id v417;
  id v418;
  float *v419;
  uint64_t v420;
  __int128 v421;
  __int128 v422;
  void *v423;
  id v424;
  _QWORD v425[2];
  _QWORD v426[2];
  __int128 v427;
  __int128 v428;
  __int128 v429;
  __int128 v430;
  __int128 v431;
  __int128 v432;
  _QWORD v433[2];
  size_t v434[16];
  __int128 v435;
  __int128 v436;
  __int128 v437;
  __int128 v438;
  void *v439;
  void *v440;
  void *v441;
  __int128 v442;
  __int128 v443;
  __int128 v444;
  __int128 v445;
  _OWORD buf[64];
  uint64_t v447;

  v447 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v382 = a2;
  v381 = a3;
  objc_msgSend(v5, "objectForKey:", CFSTR("OSLogConstructPredicate"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v378 = v5;
  objc_msgSend(v5, "objectForKey:", CFSTR("OSLogConstructTargetDir"));
  v386 = (void *)objc_claimAutoreleasedReturnValue();
  v431 = 0u;
  v432 = 0u;
  v429 = 0u;
  v430 = 0u;
  v427 = 0u;
  v428 = 0u;
  v423 = 0;
  v421 = 0u;
  v422 = 0u;
  v7 = 0x1E0CB3000;
  v420 = 0;
  if (v6)
    goto LABEL_44;
  v395 = v382;
  is_development_build = _os_trace_is_development_build();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", _os_trace_prefsdir_path());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v439 = v9;
  if (is_development_build)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", _os_trace_intprefsdir_path());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v440 = v10;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", _os_trace_sysprefsdir_path());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v441 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v439, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", _os_trace_sysprefsdir_path());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v440 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v439, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v437 = 0u;
  v438 = 0u;
  v435 = 0u;
  v436 = 0u;
  obj = v12;
  v400 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v435, v434, 16);
  if (v400)
  {
    v397 = *(_QWORD *)v436;
    v393 = (void *)*MEMORY[0x1E0CB28A8];
    key = (void *)*MEMORY[0x1E0C9AB90];
LABEL_7:
    v412 = 0;
    while (1)
    {
      if (*(_QWORD *)v436 != v397)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v435 + 1) + 8 * v412);
      v14 = (void *)MEMORY[0x1E0C99E98];
      v433[0] = v13;
      v433[1] = CFSTR("com.apple.LoggingSupport.collect_override.plist");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v433, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "fileURLWithPathComponents:", v15);
      v409 = (void *)objc_claimAutoreleasedReturnValue();

      v424 = 0;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v409, &v424);
      v403 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v424;
      v406 = v16;
      if (!v16)
      {
        v416 = v395;
        v391 = v403;
        objc_msgSend(v391, "valueForKeyPath:", CFSTR("Events"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v389 = v24;
        if (v24)
        {
          v25 = (const __CFDictionary *)_CFCopySupplementalVersionDictionary();
          v26 = v25;
          if (v25)
          {
            CFDictionaryGetValue(v25, key);
            v414 = (void *)objc_claimAutoreleasedReturnValue();
            CFRelease(v26);
            v444 = 0u;
            v445 = 0u;
            v442 = 0u;
            v443 = 0u;
            v27 = v24;
            v28 = 0;
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v442, buf, 16);
            if (v29)
            {
              v30 = *(_QWORD *)v443;
              do
              {
                for (i = 0; i != v29; ++i)
                {
                  if (*(_QWORD *)v443 != v30)
                    objc_enumerationMutation(v27);
                  v32 = *(void **)(*((_QWORD *)&v442 + 1) + 8 * i);
                  objc_msgSend(v32, "valueForKeyPath:", CFSTR("Predicates"));
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v39)
                  {
                    objc_msgSend(v32, "valueForKeyPath:", CFSTR("Builds"));
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v46)
                    {
                      v377 = (char)v414;
                      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF MATCHES %@"));
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v46, "filteredArrayUsingPredicate:", v47);
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v48, "count"))
                      {
                        if (v28)
                        {
                          v377 = (char)v28;
                          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ && %@"));
                          v49 = objc_claimAutoreleasedReturnValue();

                          v28 = (id)v49;
                        }
                        else
                        {
                          v28 = v39;
                        }
                      }

                    }
                    else
                    {
                    }

                  }
                  else
                  {
                    _OSLogWarningMessage(v416, "Unable to find local predicates. Please make sure you use the 'Predicates' key.", v33, v34, v35, v36, v37, v38, v377);
                  }

                }
                v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v442, buf, 16);
              }
              while (v29);
            }

LABEL_38:
            v6 = v28;

            if (v6)
            {

              goto LABEL_43;
            }
            goto LABEL_39;
          }
          v59 = "Unable to identify build version. Quitting";
        }
        else
        {
          v59 = "Unable to find local events. Please make sure you use the 'Events' key";
        }
        _OSLogWarningMessage(v416, v59, v18, v19, v20, v21, v22, v23, v377);
        v414 = 0;
        v28 = 0;
        goto LABEL_38;
      }
      objc_msgSend(v16, "domain");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17 != v393)
        break;
      v50 = objc_msgSend(v406, "code") == 260;

      if (!v50)
        goto LABEL_34;
LABEL_39:

      if (++v412 == v400)
      {
        v400 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v435, v434, 16);
        if (v400)
          goto LABEL_7;
        goto LABEL_41;
      }
    }

LABEL_34:
    v51 = objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    objc_msgSend(v406, "description");
    v52 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v52, "UTF8String");
    _OSLogWarningMessage(v395, "Unable to read plist %s: %s", v53, v54, v55, v56, v57, v58, v51);

    goto LABEL_39;
  }
LABEL_41:
  v6 = 0;
LABEL_43:

  v7 = 0x1E0CB3000uLL;
  if (v6)
  {
LABEL_44:
    v413 = v6;
    objc_msgSend(*(id *)(v7 + 2176), "predicateWithFormat:argumentArray:", v6, MEMORY[0x1E0C9AA60]);
    v415 = (void *)objc_claimAutoreleasedReturnValue();
    if (v386)
      BYTE8(v422) = 1;
  }
  else
  {
    v413 = 0;
    v415 = 0;
  }
  v60 = v382;
  OSLogLogdAdminConnection();
  v67 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v67)
  {
    v68 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v68, "operation", 0xAuLL);
    xpc_connection_send_message(v67, v68);

  }
  else
  {
    _OSLogWarningMessage(v60, "Coprocessors flush failed: no connection to logd", v61, v62, v63, v64, v65, v66, v377);
  }

  v69 = operator new();
  *(_OWORD *)v69 = 0u;
  *(_OWORD *)(v69 + 16) = 0u;
  *(_DWORD *)(v69 + 32) = 1065353216;
  v417 = v60;
  v70 = v378;
  objc_msgSend(v70, "objectForKeyedSubscript:", OSLogConstructPersistSizeLimit);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v71;
  if (v71)
    v73 = objc_msgSend(v71, "unsignedLongLongValue");
  else
    v73 = -1;
  *(_QWORD *)&v427 = v73;

  objc_msgSend(v70, "objectForKeyedSubscript:", OSLogConstructSpecialSizeLimit);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v74;
  if (v74)
    v76 = objc_msgSend(v74, "unsignedLongLongValue");
  else
    v76 = -1;
  *((_QWORD *)&v428 + 1) = v76;

  objc_msgSend(v70, "objectForKeyedSubscript:", OSLogConstructSignpostSizeLimit);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v77;
  if (v77)
    v79 = objc_msgSend(v77, "unsignedLongLongValue");
  else
    v79 = -1;
  *(_QWORD *)&v430 = v79;

  objc_msgSend(v70, "objectForKeyedSubscript:", OSLogConstructHighVolumeSizeLimit);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v80;
  if (v80)
    v82 = objc_msgSend(v80, "unsignedLongLongValue");
  else
    v82 = -1;
  *((_QWORD *)&v431 + 1) = v82;

  objc_msgSend(v70, "objectForKeyedSubscript:", OSLogConstructPersistAgeLimit);
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  if (v83)
  {
    objc_msgSend(v70, "objectForKeyedSubscript:", OSLogConstructPersistAgeLimit);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v410 = 1000000000 * objc_msgSend(v84, "unsignedLongLongValue");
    *((_QWORD *)&v427 + 1) = v410;

  }
  else
  {
    objc_msgSend(v70, "objectForKeyedSubscript:", _OSLogConstructPersistStart);
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v85)
    {
      v107 = "Required key missing from options dictionary: OSLogConstructPersistAgeLimit";
LABEL_124:
      _OSLogWarningMessage(v417, v107, v86, v87, v88, v89, v90, v91, v377);
      *__error() = 22;

      v152 = 0;
      v125 = 0;
      v153 = 0xFFFFFFFFLL;
      goto LABEL_186;
    }
    objc_msgSend(v70, "objectForKeyedSubscript:", _OSLogConstructPersistStart);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v410 = 1000000000 * objc_msgSend(v92, "unsignedLongLongValue");
    *((_QWORD *)&v427 + 1) = v410;

    LODWORD(v428) = 1;
  }
  objc_msgSend(v70, "objectForKeyedSubscript:", OSLogConstructSpecialAgeLimit);
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  if (v93)
  {
    objc_msgSend(v70, "objectForKeyedSubscript:", OSLogConstructSpecialAgeLimit);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v407 = 1000000000 * objc_msgSend(v94, "unsignedLongLongValue");
    *(_QWORD *)&v429 = v407;

    goto LABEL_70;
  }
  objc_msgSend(v70, "objectForKeyedSubscript:", _OSLogConstructSpecialStart);
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v95)
  {
    v107 = "Required key missing from options dictionary: OSLogConstructSpecialAgeLimit";
    goto LABEL_124;
  }
  objc_msgSend(v70, "objectForKeyedSubscript:", _OSLogConstructSpecialStart);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v407 = 1000000000 * objc_msgSend(v96, "unsignedLongLongValue");
  *(_QWORD *)&v429 = v407;

  DWORD2(v429) = 1;
LABEL_70:
  objc_msgSend(v70, "objectForKeyedSubscript:", OSLogConstructSignpostAgeLimit);
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  if (v97)
  {
    objc_msgSend(v70, "objectForKeyedSubscript:", OSLogConstructSignpostAgeLimit);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v404 = 1000000000 * objc_msgSend(v98, "unsignedLongLongValue");
    *((_QWORD *)&v430 + 1) = v404;

  }
  else
  {
    objc_msgSend(v70, "objectForKeyedSubscript:", _OSLogConstructSignpostStart);
    v99 = (void *)objc_claimAutoreleasedReturnValue();

    if (v99)
    {
      objc_msgSend(v70, "objectForKeyedSubscript:", _OSLogConstructSignpostStart);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v404 = 1000000000 * objc_msgSend(v106, "unsignedLongLongValue");
      *((_QWORD *)&v430 + 1) = v404;

      LODWORD(v431) = 1;
    }
    else
    {
      _OSLogWarningMessage(v417, "Expected key missing from options dictionary: OSLogConstructSignpostAgeLimit (using value of Persist option instead)", v100, v101, v102, v103, v104, v105, v377);
      *((_QWORD *)&v430 + 1) = v410;
      LODWORD(v431) = v428;
      v404 = v410;
    }
  }
  objc_msgSend(v70, "objectForKeyedSubscript:", OSLogConstructHighVolumeAgeLimit);
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  if (v108)
  {
    objc_msgSend(v70, "objectForKeyedSubscript:", OSLogConstructHighVolumeAgeLimit);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v401 = 1000000000 * objc_msgSend(v109, "unsignedLongLongValue");
    *(_QWORD *)&v432 = v401;

    goto LABEL_81;
  }
  objc_msgSend(v70, "objectForKeyedSubscript:", _OSLogConstructHighVolumeStart);
  v110 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v110)
  {
    v107 = "Required key missing from options dictionary: OSLogConstructHighVolumeAgeLimit";
    goto LABEL_124;
  }
  objc_msgSend(v70, "objectForKeyedSubscript:", _OSLogConstructHighVolumeStart);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v401 = 1000000000 * objc_msgSend(v111, "unsignedLongLongValue");
  *(_QWORD *)&v432 = v401;

  DWORD2(v432) = 1;
LABEL_81:

  v112 = MEMORY[0x1E0C81028];
  v113 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Generating archive with the following parameters:", (uint8_t *)buf, 2u);
  }

  v114 = v112;
  if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf[0]) = 134217984;
    *(_QWORD *)((char *)buf + 4) = v73;
    _os_log_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Persist size limit: %lld bytes", (uint8_t *)buf, 0xCu);
  }

  v115 = v112;
  if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf[0]) = 134217984;
    *(_QWORD *)((char *)buf + 4) = v410 / 0x3B9ACA00;
    _os_log_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Persist age limit: %lld seconds", (uint8_t *)buf, 0xCu);
  }

  v116 = v112;
  if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf[0]) = 134217984;
    *(_QWORD *)((char *)buf + 4) = v76;
    _os_log_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Special size limit: %lld bytes", (uint8_t *)buf, 0xCu);
  }

  v117 = v112;
  if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf[0]) = 134217984;
    *(_QWORD *)((char *)buf + 4) = v407 / 0x3B9ACA00;
    _os_log_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Special age limit: %lld seconds", (uint8_t *)buf, 0xCu);
  }

  v118 = v112;
  if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf[0]) = 134217984;
    *(_QWORD *)((char *)buf + 4) = v79;
    _os_log_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Signpost size limit: %lld bytes", (uint8_t *)buf, 0xCu);
  }

  v119 = MEMORY[0x1E0C81028];
  v120 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf[0]) = 134217984;
    *(_QWORD *)((char *)buf + 4) = v404 / 0x3B9ACA00;
    _os_log_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Signpost age limit: %lld seconds", (uint8_t *)buf, 0xCu);
  }

  v121 = v119;
  if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf[0]) = 134217984;
    *(_QWORD *)((char *)buf + 4) = v82;
    _os_log_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "HighVolume size limit: %lld bytes", (uint8_t *)buf, 0xCu);
  }

  v122 = MEMORY[0x1E0C81028];
  v123 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v122, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf[0]) = 134217984;
    *(_QWORD *)((char *)buf + 4) = v401 / 0x3B9ACA00;
    _os_log_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "HighVolume limit: %lld seconds", (uint8_t *)buf, 0xCu);
  }

  v124 = v417;
  if (geteuid())
  {
    *(_QWORD *)&buf[0] = 0;
    +[_OSLogCollectionReference localDBRefWithError:](_OSLogCollectionReference, "localDBRefWithError:", buf);
    v125 = (_OSLogCollectionReference *)objc_claimAutoreleasedReturnValue();
    v126 = (_OSLogDirectoryReference *)*(id *)&buf[0];
    v133 = v126;
    if (v125)
    {
LABEL_127:

      goto LABEL_138;
    }
    if (!v126)
    {
      _OSLogWarningMessage(v124, "unable to get local database reference", v127, v128, v129, v130, v131, v132, v377);
      v133 = 0;
      v125 = 0;
      goto LABEL_127;
    }
    -[_OSLogDirectoryReference localizedDescription](v126, "localizedDescription");
    v134 = (_OSLogDirectoryReference *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v135 = -[_OSLogDirectoryReference UTF8String](v134, "UTF8String");
    _OSLogWarningMessage(v124, "unable to get local database reference due to %s", v136, v137, v138, v139, v140, v141, v135);
    v125 = 0;
LABEL_122:

    goto LABEL_127;
  }
  if (_os_trace_shared_paths_init_once != -1)
    dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
  v142 = _os_trace_persist_path;
  v143 = open((const char *)_os_trace_persist_path, 0);
  if ((_DWORD)v143 == -1)
  {
    v154 = __error();
    strerror(*v154);
    __error();
    _OSLogWarningMessage(v124, "failed to open: %s: %s (%d)", v155, v156, v157, v158, v159, v160, v142);
    goto LABEL_137;
  }
  if (_os_trace_shared_paths_init_once != -1)
    dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
  v144 = _os_trace_timesync_path;
  v145 = open((const char *)_os_trace_timesync_path, 0);
  if ((_DWORD)v145 != -1)
  {
    if (_os_trace_shared_paths_init_once != -1)
      dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
    LOBYTE(v146) = _os_trace_uuidtext_path;
    v147 = open((const char *)_os_trace_uuidtext_path, 0);
    if ((_DWORD)v147 != -1)
    {
      v133 = -[_OSLogDirectoryReference initWithDescriptor:]([_OSLogDirectoryReference alloc], "initWithDescriptor:", v143);
      v134 = -[_OSLogDirectoryReference initWithDescriptor:]([_OSLogDirectoryReference alloc], "initWithDescriptor:", v145);
      v398 = -[_OSLogDirectoryReference initWithDescriptor:]([_OSLogDirectoryReference alloc], "initWithDescriptor:", v147);
      v125 = -[_OSLogCollectionReference initWithDiagnosticsDirectory:timesyncDirectory:UUIDTextDirectory:]([_OSLogCollectionReference alloc], "initWithDiagnosticsDirectory:timesyncDirectory:UUIDTextDirectory:", v133, v134, v398);
      if (close(v143) == -1)
      {
        v148 = *__error();
        result = *__error();
        if (v148 == 9)
        {
LABEL_250:
          qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
          qword_1EE52EA88 = result;
          __break(1u);
          goto LABEL_251;
        }
        _os_assumes_log();
      }
      if (close(v145) == -1)
      {
        v150 = *__error();
        result = *__error();
        if (v150 == 9)
        {
LABEL_251:
          qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
          qword_1EE52EA88 = result;
          __break(1u);
          goto LABEL_252;
        }
        _os_assumes_log();
      }
      if (close(v147) == -1)
      {
        v151 = *__error();
        result = *__error();
        if (v151 == 9)
        {
LABEL_252:
          qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
          qword_1EE52EA88 = result;
          __break(1u);
          goto LABEL_253;
        }
        _os_assumes_log();
      }

      goto LABEL_122;
    }
    goto LABEL_131;
  }
  v161 = __error();
  LODWORD(v145) = strerror(*v161);
  __error();
  _OSLogWarningMessage(v124, "failed to open: %s: %s (%d)", v162, v163, v164, v165, v166, v167, v144);
  if (close(v143) != -1)
  {
LABEL_137:
    v125 = 0;
LABEL_138:

    -[_OSLogCollectionReference diagnosticsDirectoryReference](v125, "diagnosticsDirectoryReference");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    v179 = objc_msgSend(v178, "fileDescriptor");

    -[_OSLogCollectionReference timesyncReference](v125, "timesyncReference");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    v399 = objc_msgSend(v180, "fileDescriptor");

    -[_OSLogCollectionReference UUIDTextReference](v125, "UUIDTextReference");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    v394 = objc_msgSend(v181, "fileDescriptor");

    v182 = v124;
    *(_QWORD *)&buf[0] = 0;
    file_at = _os_trace_read_file_at();
    if (file_at)
    {
      v184 = objc_alloc(MEMORY[0x1E0C99D50]);
      v185 = (void *)objc_msgSend(v184, "initWithBytesNoCopy:length:freeWhenDone:", file_at, *(_QWORD *)&buf[0], 1);
      v434[0] = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v185, 0, 0, v434);
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      v152 = v186;
      if (v186)
      {
        v187 = v186;
      }
      else
      {
        objc_msgSend((id)v434[0], "description");
        v194 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v195 = objc_msgSend(v194, "UTF8String");
        _OSLogWarningMessage(v182, "unable to decode version.plist: %s", v196, v197, v198, v199, v200, v201, v195);

        *__error() = 79;
      }

      if (v152)
      {
        v392 = _timesync_db_openat(v399, ".");
        if (v392)
        {
          v208 = v182;
          v390 = v381;
          v396 = v208;
          TempDirectory = _OSLogCreateTempDirectory(v208, 0x1FFu);
          v210 = TempDirectory;
          if ((_DWORD)TempDirectory == -1)
          {

            v255 = 0;
            v411 = 0;
            v254 = 0;
            v244 = 0;
            v153 = 0xFFFFFFFFLL;
            goto LABEL_244;
          }
          buf[0] = xmmword_19EA7F160;
          buf[1] = *(_OWORD *)algn_19EA7F170;
          if (fsetxattr(TempDirectory, "com.apple.FinderInfo", buf, 0x20uLL, 0, 0) < 0)
          {
            v211 = __error();
            v212 = strerror(*v211);
            __error();
            _OSLogWarningMessage(v396, "unable to set bundle bit: %s (%d)", v213, v214, v215, v216, v217, v218, v212);
          }
          (*((void (**)(id, uint64_t, const char *))v390 + 2))(v390, v210, ".");
          if (close(v210) != -1)
          {
LABEL_151:

            v153 = OSLogStateCaptureForAllPIDs(v396);
            if ((_DWORD)v153)
              _OSLogWarningMessage(v396, "failed to capture state data", v220, v221, v222, v223, v224, v225, v377);
            v226 = tmpfile();
            if (v226)
            {
              obja = v226;
              objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("_OSLogConstructSkipMemoryStores"));
              v227 = (void *)objc_claimAutoreleasedReturnValue();
              v228 = objc_msgSend(v227, "intValue") == 1;

              v229 = 2;
              if (!v228)
                v229 = 3;
              v379 = v229;
              v230 = time(0);
              v231 = 1000000000 * v230;
              v232 = 1000000000 * v230 - v410;
              if (1000000000 * v230 < v410)
                v232 = 0;
              if ((v428 & 1) != 0)
                v233 = v410;
              else
                v233 = v232;
              if ((v428 & 1) != 0)
                v234 = v410;
              else
                v234 = 0;
              if ((v428 & 1) != 0)
                v235 = 1000000000 * v230;
              else
                v235 = -1;
              keya = (char *)_timesync_range_create_impl(v392, v233, v231, 0);
              v236 = v231 - v407;
              if (v231 < v407)
                v236 = 0;
              if ((BYTE8(v429) & 1) != 0)
                v237 = v407;
              else
                v237 = v236;
              impl = (char *)_timesync_range_create_impl(v392, v237, v231, 0);
              v238 = v231 - v404;
              if (v231 < v404)
                v238 = 0;
              if ((v431 & 1) != 0)
                v239 = v404;
              else
                v239 = v238;
              v405 = (char *)_timesync_range_create_impl(v392, v239, v231, 0);
              v240 = v231 - v401;
              if (v231 < v401)
                v240 = 0;
              if ((BYTE8(v432) & 1) != 0)
                v241 = v401;
              else
                v241 = v240;
              v402 = (char *)_timesync_range_create_impl(v392, v241, v231, 0);
              v408 = (char *)_timesync_range_create_impl(v392, v234, v235, 0);
              v426[0] = 0;
              v426[1] = 0;
              v425[0] = 0;
              v425[1] = 0;
              v419 = 0;
              v411 = +[OSLogEventProxy _make](OSLogEventProxy, "_make");
              objc_msgSend(v411, "_setDoNotTrackActivites:", 1);
              objc_msgSend(v411, "_setTimesyncDatabase:", v392);
              -[_OSLogCollectionReference UUIDTextReference](v125, "UUIDTextReference");
              v242 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v411, "_setUUIDDBFileDescriptor:", objc_msgSend(v242, "fileDescriptor"));

              v243 = *(_QWORD *)(v392 + 80);
              if (v415)
              {
                v244 = -[_OSLogPredicateMapper initWithPredicate:]([_OSLogPredicateMapper alloc], "initWithPredicate:", v415);
                -[_OSLogPredicateMapper mappedPredicate](v244, "mappedPredicate");
                v245 = (void *)objc_claimAutoreleasedReturnValue();
                v246 = v245 == 0;

                if (v246)
                {
                  _OSLogWarningMessage(v396, "Unable to validate mapped predicate", v247, v248, v249, v250, v251, v252, v377);
                  v254 = 0;
                  v153 = 0xFFFFFFFFLL;
                  goto LABEL_234;
                }
                -[_OSLogPredicateMapper mappedPredicate](v244, "mappedPredicate");
                v253 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v253, "allowEvaluation");
                v254 = -[_OSLogCatalogFilter initWithPredicate:collection:]([_OSLogCatalogFilter alloc], "initWithPredicate:collection:", v253, v125);
                v415 = v253;
              }
              else
              {
                v254 = 0;
                v244 = 0;
                v415 = 0;
              }
              *((_QWORD *)&v421 + 1) = v243;
              *(_QWORD *)&v422 = v69;
              *(_QWORD *)&v421 = v411;
              v264 = objc_alloc_init(MEMORY[0x1E0C99E20]);
              v265 = v423;
              v423 = v264;

              v266 = fileno(obja);
              if (OSLogCaptureInflightBuffersToFile(v266, v379, v396))
              {
                v267 = fileno(obja);
                v380 = v396;
                v434[0] = 0;
                v268 = v267;
                v269 = _os_trace_mmap();
                v270 = (void *)v269;
                if (!v269)
                {
                  v286 = *__error();
                  if (fcntl(v268, 50, buf) == -1)
                  {
                    __error();
                    _os_assumes_log();
                  }
                  strerror(v286);
                  _OSLogWarningMessage(v380, "could not mmap(): %s: %s (%d)", v287, v288, v289, v290, v291, v292, (char)buf);
                  v271 = -1;
                  goto LABEL_206;
                }
                v271 = _OSLogUUIDMapAddFromFile(v269, v434[0], v69, v380);
                if (munmap(v270, v434[0]) == -1)
                {
                  __error();
                  _os_assumes_log();
                }
                if (v271)
                {
                  if (fcntl(v268, 50, buf) == -1)
                  {
                    __error();
                    _os_assumes_log();
                  }
                  strerror(v271);
                  _OSLogWarningMessage(v380, "failed to index uuids: %s: %s (%d)", v272, v273, v274, v275, v276, v277, (char)buf);
LABEL_206:

                  v293 = strerror(v271);
                  _OSLogWarningMessage(v380, "failed to index LiveData uuids: %s (%d)", v294, v295, v296, v297, v298, v299, v293);
                  goto LABEL_207;
                }

                v317 = fileno(obja);
                if (fchmod(v317, 0x1A4u) == -1)
                {
                  __error();
                  _os_assumes_log();
                }
                v318 = fileno(obja);
                if (lseek(v318, 0, 0) == -1)
                {
                  __error();
                  _os_assumes_log();
                }
                v319 = fileno(obja);
                if ((_OSLogCopyTraceFile(v319, (uint64_t)"logdata.LiveData.tracev3", (_QWORD **)v408, (uint64_t)v425, (uint64_t)&v420, v390, v380, v415, v254, (uint64_t)&v421) & 0x8000000000000000) == 0)goto LABEL_207;
                strerror(0);
                _OSLogWarningMessage(v380, "copy handler failed: %s: %s (%d)", v320, v321, v322, v323, v324, v325, (char)"logdata.LiveData.tracev3");
                v153 = 0;
              }
              else
              {
                v278 = __error();
                v279 = strerror(*v278);
                __error();
                _OSLogWarningMessage(v396, "failed to collect LiveData: %s (%d)", v280, v281, v282, v283, v284, v285, v279);
                if (*__error() == 1)
                {
LABEL_207:
                  v300 = fileno(obja);
                  if (!_OSLogFileFindExhaustivePoint(v300, (uint64_t)v426, (uint64_t)&v419))
                    _timesync_range_intersect(v408, v426, v419, 0, 0);
                  v301 = _OSLogCopyBook(v179, "Persist", v427, keya, v415, v254, (uint64_t)&v421, v390, v396);
                  v153 = (uint64_t)v301;
                  if ((_DWORD)v301)
                  {
                    v302 = strerror((int)v301);
                    _OSLogWarningMessage(v396, "copy book failed: persist: %s (%d)", v303, v304, v305, v306, v307, v308, v302);
                  }
                  else
                  {
                    v309 = _OSLogCopyBook(v179, "Special", *((uint64_t *)&v428 + 1), impl, v415, v254, (uint64_t)&v421, v390, v396);
                    v153 = (uint64_t)v309;
                    if ((_DWORD)v309)
                    {
                      v310 = strerror((int)v309);
                      _OSLogWarningMessage(v396, "copy book failed: special: %s (%d)", v311, v312, v313, v314, v315, v316, v310);
                    }
                    else
                    {
                      v326 = _OSLogCopyBook(v179, "Signpost", v430, v405, v415, v254, (uint64_t)&v421, v390, v396);
                      v153 = (uint64_t)v326;
                      if ((_DWORD)v326)
                      {
                        v327 = strerror((int)v326);
                        _OSLogWarningMessage(v396, "copy book failed: signpost: %s (%d)", v328, v329, v330, v331, v332, v333, v327);
                      }
                      else
                      {
                        v334 = _OSLogCopyBook(v179, "HighVolume", *((uint64_t *)&v431 + 1), v402, v415, v254, (uint64_t)&v421, v390, v396);
                        v153 = (uint64_t)v334;
                        if ((_DWORD)v334)
                        {
                          v335 = strerror((int)v334);
                          _OSLogWarningMessage(v396, "copy book failed: highvol: %s (%d)", v336, v337, v338, v339, v340, v341, v335);
                        }
                        else
                        {
                          v342 = _OSLogCopyDirectory(v179, (uint64_t)"Extra", v390, v396, 1);
                          if (v342)
                          {
                            v343 = strerror(v342);
                            _OSLogWarningMessage(v396, "copy extra failed: %s (%d)", v344, v345, v346, v347, v348, v349, v343);
                          }
                          v350 = _OSLogCopyDirectory(v399, (uint64_t)"timesync", v390, v396, 0);
                          v153 = (uint64_t)v350;
                          if ((_DWORD)v350)
                          {
                            v351 = strerror((int)v350);
                            _OSLogWarningMessage(v396, "copy timesync failed: %s (%d)", v352, v353, v354, v355, v356, v357, v351);
                          }
                          else
                          {
                            v358 = _OSLogUUIDMapCopySet(v394, v69, v390, v396);
                            v153 = v358;
                            if ((_DWORD)v358)
                            {
                              v359 = strerror(v358);
                              _OSLogWarningMessage(v396, "copy uuiddb failed: %s (%d)", v360, v361, v362, v363, v364, v365, v359);
                            }
                            else
                            {
                              if (BYTE8(v422))
                              {
                                v418 = 0;
                                v366 = purge_unused_uuids(v386, v423, &v418);
                                v367 = v418;
                                v368 = v367;
                                if (!v366)
                                {
                                  objc_msgSend(v367, "description");
                                  v369 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                                  v370 = objc_msgSend(v369, "UTF8String");
                                  _OSLogWarningMessage(v396, "Purging UUIDS failed: %s", v371, v372, v373, v374, v375, v376, v370);

                                }
                              }
                              v153 = _OSLogArchiveCreateInfoPlist(v152, (uint64_t)keya, (uint64_t)impl, (uint64_t)v405, (uint64_t)v402, (uint64_t)v408, &v427, v390, v396, v392, (uint64_t)v415);
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
LABEL_234:
              if (keya)
              {
                _os_trace_uuid_map_destroy(*(void ***)keya);
                free(keya);
              }
              v255 = obja;
              if (impl)
              {
                _os_trace_uuid_map_destroy(*(void ***)impl);
                free(impl);
              }
              if (v405)
              {
                _os_trace_uuid_map_destroy(*(void ***)v405);
                free(v405);
              }
              if (v402)
              {
                _os_trace_uuid_map_destroy(*(void ***)v402);
                free(v402);
              }
              if (v408)
              {
                _os_trace_uuid_map_destroy(*(void ***)v408);
                free(v408);
              }
              goto LABEL_244;
            }
            v256 = __error();
            v257 = strerror(*v256);
            __error();
            _OSLogWarningMessage(v396, "failed to create LiveData temp file: %s (%d)", v258, v259, v260, v261, v262, v263, v257);
            v255 = 0;
            v411 = 0;
            v254 = 0;
            v244 = 0;
            v153 = *__error();
LABEL_244:
            _timesync_db_close((int *)v392);
            _os_trace_uuid_map_destroy((void **)v69);
            if (v255 && fclose(v255) == -1)
            {
              __error();
              _os_assumes_log();
            }
            if (v411)
              objc_msgSend(v411, "_unmake");
            goto LABEL_187;
          }
          v219 = *__error();
          result = *__error();
          if (v219 != 9)
          {
            _os_assumes_log();
            goto LABEL_151;
          }
          qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
          qword_1EE52EA88 = result;
          __break(1u);
          goto LABEL_250;
        }
        _OSLogWarningMessage(v182, "failed to open timesync database", v202, v203, v204, v205, v206, v207, v377);
        v153 = 2;
LABEL_186:
        _os_trace_uuid_map_destroy((void **)v69);
        v254 = 0;
        v244 = 0;
LABEL_187:
        -[_OSLogCollectionReference close](v125, "close");

        return v153;
      }
    }
    else
    {

    }
    _OSLogWarningMessage(v182, "failed to read version.plist", v188, v189, v190, v191, v192, v193, v377);
    v152 = 0;
    v153 = *__error();
    goto LABEL_186;
  }
  v146 = *__error();
  v168 = *__error();
  if (v146 != 9)
  {
LABEL_136:
    _os_assumes_log();
    goto LABEL_137;
  }
  qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EE52EA88 = v168;
  __break(1u);
LABEL_131:
  v169 = __error();
  strerror(*v169);
  __error();
  _OSLogWarningMessage(v124, "failed to open: %s: %s (%d)", v170, v171, v172, v173, v174, v175, v146);
  if (close(v143) == -1)
  {
    v176 = *__error();
    result = *__error();
    if (v176 == 9)
    {
LABEL_253:
      qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_1EE52EA88 = result;
      __break(1u);
      goto LABEL_254;
    }
    _os_assumes_log();
  }
  if (close(v145) != -1)
    goto LABEL_137;
  v177 = *__error();
  result = *__error();
  if (v177 != 9)
    goto LABEL_136;
LABEL_254:
  qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EE52EA88 = result;
  __break(1u);
  return result;
}

void sub_19EA5A370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,void *a37)
{

  _Unwind_Resume(a1);
}

uint64_t _OSLogCreateTempDirectory(void *a1, mode_t a2)
{
  id v3;
  char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t result;
  int v17;
  int *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char __str[1024];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (issetugid())
    v4 = 0;
  else
    v4 = getenv("TMPDIR");
  v5 = "/tmp";
  if (v4)
    v5 = v4;
  snprintf(__str, 0x400uLL, "%s/oslogarchive.XXXXXX", v5);
  if (!mkdtemp(__str))
  {
    v17 = *__error();
    v18 = __error();
    strerror(*v18);
    _OSLogWarningMessage(v3, "failed to create temporary directory: %d (%s)", v19, v20, v21, v22, v23, v24, v17);
    goto LABEL_16;
  }
  v6 = open(__str, 2048);
  if ((_DWORD)v6 == -1)
  {
    __error();
    v25 = __error();
    strerror(*v25);
    _OSLogWarningMessage(v3, "failed to open temporary directory: %s (%d - %s)", v26, v27, v28, v29, v30, v31, (char)__str);
    goto LABEL_16;
  }
  v7 = v6;
  if (rmdir(__str) == -1)
  {
    __error();
    _os_assumes_log();
  }
  if (!fchmod(v7, a2))
    goto LABEL_17;
  v8 = __error();
  strerror(*v8);
  __error();
  _OSLogWarningMessage(v3, "failed to set permissions: %s: %s (%d)", v9, v10, v11, v12, v13, v14, (char)__str);
  if (close(v7) != -1)
  {
LABEL_16:
    v7 = 0xFFFFFFFFLL;
LABEL_17:

    return v7;
  }
  v15 = *__error();
  result = *__error();
  if (v15 != 9)
  {
    _os_assumes_log();
    __error();
    _os_assumes_log();
    goto LABEL_16;
  }
  qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EE52EA88 = result;
  __break(1u);
  return result;
}

uint64_t OSLogStateCaptureForAllPIDs(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _DWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  size_t v18;
  size_t v19;
  uint64_t v20;
  uint64_t v21;
  _DWORD *v22;
  _DWORD *v23;
  char v25;
  size_t v26;
  int v27[6];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  *(_OWORD *)v27 = xmmword_19EA7F2D0;
  v26 = 0;
  v2 = sysctl(v27, 4u, 0, &v26, 0, 0);
  if ((_DWORD)v2)
  {
    v9 = v2;
    _OSLogWarningMessage(v1, "Failed to get process list length", v3, v4, v5, v6, v7, v8, v25);
  }
  else
  {
    v10 = (_DWORD *)_os_trace_malloc();
    v9 = sysctl(v27, 4u, v10, &v26, 0, 0);
    if ((_DWORD)v9)
    {
      _OSLogWarningMessage(v1, "Failed to get process list", v11, v12, v13, v14, v15, v16, v25);
      v17 = 0;
    }
    else
    {
      v18 = v26;
      v19 = v26 / 0x288;
      v20 = _os_trace_calloc();
      v17 = (void *)v20;
      if (v18 >= 0x288)
      {
        if (v19 <= 1)
          v21 = 1;
        else
          v21 = v19;
        v22 = v10 + 10;
        v23 = (_DWORD *)v20;
        do
        {
          *v23++ = *v22;
          v22 += 162;
          --v21;
        }
        while (v21);
      }
      _os_state_request_for_pidlist();
      usleep(0x16E360u);
    }
    free(v10);
    free(v17);
  }

  return v9;
}

uint64_t _OSLogCopyTraceFile(uint64_t a1, uint64_t a2, _QWORD **a3, uint64_t a4, uint64_t a5, void *a6, void *a7, void *a8, void *a9, uint64_t a10)
{
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  _DWORD *v18;
  uint64_t v19;
  unint64_t v20;
  FILE *v21;
  FILE *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id *v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int *v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t (**v55)(id, uint64_t, _QWORD);
  id v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  id v79;
  char v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  int v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  int v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  int v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  void *v116;
  FILE *v117;
  id v118;
  id v119;
  unsigned int fd;
  id v124;
  id obj;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  id v130;
  id v131;
  id v132;
  size_t *v133;
  _QWORD *v134;
  _DWORD *v135;
  __int128 *p_value;
  _QWORD **v137;
  _QWORD aBlock[6];
  _QWORD v139[3];
  char v140;
  _QWORD v141[5];
  id v142;
  size_t v143;
  size_t *v144;
  uint64_t v145;
  uint64_t (*v146)(uint64_t, uint64_t);
  void (*v147)(uint64_t);
  id v148;
  __int128 value;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;

  v163 = *MEMORY[0x1E0C80C00];
  v124 = a6;
  v14 = a7;
  v15 = a8;
  v16 = a9;
  v17 = _os_trace_mmap();
  v18 = (_DWORD *)v17;
  if (v17)
  {
    if (*(_DWORD *)v17 == 4096 && *(_QWORD *)(v17 + 8) > 0x27uLL)
    {
      v19 = _os_trace_uuid_map_lookup(*a3, (_QWORD *)(v17 + 144));
      if (!v19)
      {
        v31 = 0;
LABEL_14:
        if (munmap(v18, 0) == -1)
        {
          __error();
          _os_assumes_log();
        }
        goto LABEL_21;
      }
      v20 = v19;
      v21 = tmpfile();
      if (v21)
      {
        v22 = v21;
        fd = fileno(v21);
        v117 = v22;
        if (v15)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "lastPathComponent");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v118 = v24;
          v114 = v14;
          v25 = v15;
          v112 = v16;
          v143 = 0;
          v144 = &v143;
          v145 = 0x3032000000;
          v146 = __Block_byref_object_copy__2184;
          v147 = __Block_byref_object_dispose__2185;
          v148 = 0;
          v141[0] = 0;
          v141[1] = v141;
          v141[2] = 0x3032000000;
          v141[3] = __Block_byref_object_copy__2184;
          v141[4] = __Block_byref_object_dispose__2185;
          v111 = v25;
          v142 = v111;
          v139[0] = 0;
          v139[1] = v139;
          v139[2] = 0x2020000000;
          v140 = 0;
          v161 = 0;
          v160 = 0;
          v158 = 0u;
          v159 = 0u;
          v156 = 0u;
          v157 = 0u;
          v154 = 0u;
          v155 = 0u;
          v152 = 0u;
          v153 = 0u;
          v150 = 0u;
          v151 = 0u;
          *(_QWORD *)&value = 0;
          v162 = a10;
          *((_QWORD *)&value + 1) = -1;
          DWORD1(v157) = 0x10000;
          *((_QWORD *)&v156 + 1) = _os_trace_malloc();
          *((_QWORD *)&v158 + 1) = 0;
          *(_QWORD *)&v159 = v18;
          LODWORD(v160) = fd;
          v26 = MEMORY[0x1E0C809B0];
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = ___OSLogCopyTraceFile_implWithRepack_block_invoke;
          aBlock[3] = &unk_1E41579D0;
          aBlock[4] = v141;
          aBlock[5] = &value;
          v27 = _Block_copy(aBlock);
          v28 = (void *)*((_QWORD *)&v157 + 1);
          *((_QWORD *)&v157 + 1) = v27;

          v126 = v26;
          v127 = 3221225472;
          v128 = (uint64_t)___OSLogCopyTraceFile_implWithRepack_block_invoke_2;
          v129 = &unk_1E41579F8;
          v135 = v18;
          p_value = &value;
          v133 = &v143;
          v115 = v114;
          v132 = v115;
          v134 = v139;
          v113 = v112;
          v130 = v113;
          v119 = v118;
          v131 = v119;
          v137 = a3;

          if (*((_QWORD *)&v150 + 1)
            && (v29 = (id *)(v144 + 5),
                obj = (id)v144[5],
                v30 = _repack_ttl_compact_close_catalog((uint64_t)&value, &obj),
                objc_storeStrong(v29, obj),
                (v30 & 1) == 0))
          {
            objc_msgSend((id)v144[5], "userInfo");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "description");
            v79 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v80 = objc_msgSend(v79, "UTF8String");
            _OSLogWarningMessage(v115, "failed to close catalog: %s", v81, v82, v83, v84, v85, v86, v80);

            v31 = 0;
          }
          else
          {
            v31 = v161;
          }
          _repack_context_cleanup((uint64_t)&value);

          _Block_object_dispose(v139, 8);
          _Block_object_dispose(v141, 8);

          _Block_object_dispose(&v143, 8);
        }
        else
        {
          v54 = *(_QWORD *)(a10 + 16);
          v55 = (uint64_t (**)(id, uint64_t, _QWORD))v124;
          v56 = v14;
          v126 = 0;
          v127 = (uint64_t)&v126;
          v128 = 0x2020000000;
          v129 = 0;
          v116 = v56;
          if (v20 <= 1 && v18[1] > 0x10u)
          {
            *(_QWORD *)&value = MEMORY[0x1E0C809B0];
            *((_QWORD *)&value + 1) = 3221225472;
            *(_QWORD *)&v150 = ___OSLogCopyTraceFile_impl_block_invoke;
            *((_QWORD *)&v150 + 1) = &unk_1E41579A8;
            v152 = (unint64_t)a3;
            *(_QWORD *)&v153 = v18;
            *((_QWORD *)&v153 + 1) = v18;
            *(_QWORD *)&v154 = v54;
            v87 = v56;
            *((_QWORD *)&v154 + 1) = a2;
            *(_QWORD *)&v155 = __PAIR64__(fd, a1);
            *(_QWORD *)&v151 = v87;
            *((_QWORD *)&v151 + 1) = &v126;

            v31 = *(_QWORD *)(v127 + 24);
          }
          else
          {
            v57 = _OSLogUUIDMapAddFromFile((uint64_t)v18, 0, v54, v56);
            if (v57)
            {
              if (fcntl(a1, 50, &value) == -1)
              {
                __error();
                _os_assumes_log();
              }
              strerror(v57);
              _OSLogWarningMessage(v116, "failed to index uuids: '%s' to '%s': %s (%d)", v58, v59, v60, v61, v62, v63, (char)&value);
            }
            *(_QWORD *)(v127 + 24) = 0;
            if (_OSLogFileFindExhaustivePoint(a1, a4, a5) && *__error() != 2)
            {
              v64 = *__error();
              if (fcntl(a1, 50, &value) == -1)
              {
                __error();
                _os_assumes_log();
              }
              strerror(v64);
              _OSLogWarningMessage(v116, "failed to find sparse boundary: %s: %s (%d)", v65, v66, v67, v68, v69, v70, (char)&value);
              *(_QWORD *)(v127 + 24) = 0;
            }
            if (*(_QWORD *)(v127 + 24))
            {
              if (lseek(a1, 0, 0) == -1)
              {
                __error();
                _os_assumes_log();
              }
              v71 = v55[2](v55, a1, a2);
              if (v71)
              {
                if (fcntl(a1, 50, &value) == -1)
                {
                  __error();
                  _os_assumes_log();
                }
                strerror(v71);
                _OSLogWarningMessage(v116, "failed copy: '%s' to '%s': %s (%d)", v72, v73, v74, v75, v76, v77, (char)&value);
                v31 = -1;
                *(_QWORD *)(v127 + 24) = -1;
              }
              else
              {
                v31 = *(_QWORD *)(v127 + 24);
              }
            }
            else
            {
              v31 = 0;
            }
          }
          _Block_object_dispose(&v126, 8);

        }
        if ((v31 & 0x8000000000000000) == 0 && lseek(fd, 0, 2) >= 1)
        {
          if (_OSLogFileFindExhaustivePoint(fd, a4, a5) && *__error() != 2)
          {
            v88 = *__error();
            if (fcntl(a1, 50, &value) == -1)
            {
              __error();
              _os_assumes_log();
            }
            strerror(v88);
            _OSLogWarningMessage(v14, "failed to find sparse boundary: %s: %s (%d)", v89, v90, v91, v92, v93, v94, (char)&value);
            v31 = -1;
          }
          v143 = 0;
          v95 = _os_trace_mmap();
          v96 = (void *)v95;
          if (v95)
          {
            value = 0u;
            *(_QWORD *)&v150 = 0;
            LODWORD(value) = 1;
            *((_QWORD *)&v150 + 1) = -1;
            *(_QWORD *)&v151 = 0;
            _OSLogGenerateXattrs(v95, v143, (uint64_t)&value);
            if (munmap(v96, v143) == -1)
            {
              __error();
              _os_assumes_log();
            }
            if (fsetxattr(fd, "com.apple.logd.metadata", &value, 0x28uLL, 0, 0) == -1)
            {
              __error();
              _os_assumes_log();
            }
          }
          if (fcopyfile(a1, fd, 0, 2u))
          {
            v97 = *__error();
            if (fcntl(a1, 50, &value) == -1)
            {
              __error();
              _os_assumes_log();
            }
            strerror(v97);
            _OSLogWarningMessage(v14, "fcopyfile (stat only): '%s' to '%s': %s (%d)", v98, v99, v100, v101, v102, v103, (char)&value);
            v31 = -1;
          }
          if (lseek(fd, 0, 0) == -1)
          {
            __error();
            _os_assumes_log();
          }
          v104 = (*((uint64_t (**)(id, _QWORD, uint64_t))v124 + 2))(v124, fd, a2);
          if (v104)
          {
            if (fcntl(a1, 50, &value) == -1)
            {
              __error();
              _os_assumes_log();
            }
            strerror(v104);
            _OSLogWarningMessage(v14, "copy handler failed: '%s' to '%s': %s (%d)", v105, v106, v107, v108, v109, v110, (char)&value);
            v31 = -1;
          }
        }
        if (fclose(v117) == -1)
        {
          __error();
          _os_assumes_log();
        }
        goto LABEL_14;
      }
      v46 = __error();
      v47 = strerror(*v46);
      __error();
      _OSLogWarningMessage(v14, "failed to create tmpfile: %s (%d)", v48, v49, v50, v51, v52, v53, v47);
    }
    else
    {
      if (fcntl(a1, 50, &value) == -1)
      {
        __error();
        _os_assumes_log();
      }
      _OSLogWarningMessage(v14, "File started with invalid header: '%s'", v32, v33, v34, v35, v36, v37, (char)&value);
    }
    v31 = -1;
    goto LABEL_14;
  }
  v38 = *__error();
  if (v38 == 34)
  {
    v31 = 0;
  }
  else
  {
    if (fcntl(a1, 50, &value) == -1)
    {
      __error();
      _os_assumes_log();
    }
    strerror(v38);
    _OSLogWarningMessage(v14, "could not mmap(): %s: %s (%d)", v39, v40, v41, v42, v43, v44, (char)&value);
    v31 = -1;
  }
LABEL_21:

  return v31;
}

void sub_19EA5B224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

int *_OSLogCopyBook(int a1, const char *a2, uint64_t a3, char *a4, void *a5, void *a6, uint64_t a7, void *a8, void *a9)
{
  id v16;
  id v17;
  id v18;
  id v19;
  int v20;
  uint64_t TempDirectory;
  int v22;
  uint64_t v23;
  uint64_t v24;
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
  int *result;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  id v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t *v50;
  const char *v51;
  char *v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  int v63;
  _QWORD v64[2];
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v19 = a9;
  v60 = 0;
  v61 = &v60;
  v62 = 0x2020000000;
  v63 = 0;
  if (!a3)
    goto LABEL_14;
  v20 = openat(a1, a2, 0);
  if (v20 == -1)
  {
    v29 = *__error();
    *((_DWORD *)v61 + 6) = v29;
    if (v29 != 2)
    {
      strerror(v29);
      _OSLogWarningMessage(v19, "failed to open '%s': %s", v31, v32, v33, v34, v35, v36, (char)a2);
      goto LABEL_19;
    }
LABEL_14:
    v30 = 0;
LABEL_20:
    _Block_object_dispose(&v60, 8);

    return (int *)v30;
  }
  TempDirectory = _OSLogCreateTempDirectory(v19, 0x1FFu);
  if ((_DWORD)TempDirectory == -1)
  {
    *((_DWORD *)v61 + 6) = *__error();
    if (close(v20) != -1)
      goto LABEL_19;
    if (*__error() != 9)
      goto LABEL_12;
    goto LABEL_32;
  }
  v22 = (*((uint64_t (**)(id, uint64_t, const char *))v18 + 2))(v18, TempDirectory, a2);
  *((_DWORD *)v61 + 6) = v22;
  if (v22)
  {
    if (fcntl(TempDirectory, 50, &v65) == -1)
    {
      __error();
      _os_assumes_log();
    }
    strerror(*((_DWORD *)v61 + 6));
    _OSLogWarningMessage(v19, "copy handler failed for directory fd: '%s' to '%s': %s (%d)", v23, v24, v25, v26, v27, v28, (char)&v65);
    if (close(v20) == -1)
    {
      if (*__error() == 9)
      {
        v38 = *__error();
        qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_1EE52EA88 = v38;
        __break(1u);
LABEL_31:
        v39 = *__error();
        qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_1EE52EA88 = v39;
        __break(1u);
LABEL_32:
        v40 = *__error();
        qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_1EE52EA88 = v40;
        __break(1u);
        goto LABEL_33;
      }
      __error();
      _os_assumes_log();
    }
    if (close(TempDirectory) != -1)
    {
LABEL_19:
      v30 = *((unsigned int *)v61 + 6);
      goto LABEL_20;
    }
    if (*__error() != 9)
    {
LABEL_12:
      __error();
      _os_assumes_log();
      goto LABEL_19;
    }
    goto LABEL_31;
  }
  v64[0] = 0;
  v64[1] = 0;
  v65 = 0;
  v66 = &v65;
  v67 = 0x2020000000;
  v68 = 0;
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v59 = 0;
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = ___OSLogCopyBook_block_invoke;
  v43[3] = &unk_1E4157A20;
  v52 = a4;
  v53 = v64;
  v51 = a2;
  v48 = &v65;
  v46 = v18;
  v47 = v19;
  v44 = v16;
  v45 = v17;
  v49 = &v56;
  v54 = a7;
  v55 = a3;
  v50 = &v60;
  _OSLogEnumerateFiles(v47, v20, v43);
  if (close(TempDirectory) == -1)
  {
    if (*__error() == 9)
    {
LABEL_33:
      v41 = *__error();
      qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_1EE52EA88 = v41;
      __break(1u);
      goto LABEL_34;
    }
    __error();
    _os_assumes_log();
  }
  if (close(v20) != -1)
  {
LABEL_27:
    if (v57[3] >= 1)
      _timesync_range_intersect(a4, v64, (float *)v66[3], 0, 0);
    v30 = *((unsigned int *)v61 + 6);

    _Block_object_dispose(&v56, 8);
    _Block_object_dispose(&v65, 8);
    goto LABEL_20;
  }
  if (*__error() != 9)
  {
    __error();
    _os_assumes_log();
    goto LABEL_27;
  }
LABEL_34:
  result = __error();
  v42 = *result;
  qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EE52EA88 = v42;
  __break(1u);
  return result;
}

void sub_19EA5B764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

int *_OSLogCopyDirectory(int a1, uint64_t a2, void *a3, void *a4, char a5)
{
  uint64_t (**v9)(id, uint64_t, _QWORD);
  id v10;
  uint64_t TempDirectory;
  int v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int *result;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  uint64_t (**v25)(id, uint64_t, _QWORD);
  id v26;
  uint64_t *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int v36;
  _QWORD v37[129];

  v37[128] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  TempDirectory = _OSLogCreateTempDirectory(v10, 0x1FFu);
  if ((_DWORD)TempDirectory == -1)
  {
    v20 = *__error();
    *((_DWORD *)v34 + 6) = v20;
    goto LABEL_14;
  }
  v12 = v9[2](v9, TempDirectory, a2);
  v13 = v34;
  *((_DWORD *)v34 + 6) = v12;
  if (!v12)
  {
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    v37[3] = 0;
    *((_DWORD *)v13 + 6) = 0;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = ___OSLogCopyDirectory_block_invoke;
    v24[3] = &unk_1E4157A48;
    v32 = a5;
    v29 = a2;
    v27 = &v33;
    v25 = v9;
    v31 = TempDirectory;
    v26 = v10;
    v28 = v37;
    v30 = 0;
    _OSLogEnumerateFiles(v26, a1, v24);
    if (close(TempDirectory) == -1)
    {
      if (*__error() == 9)
        goto LABEL_16;
      __error();
      _os_assumes_log();
    }
    v20 = *((unsigned int *)v34 + 6);

    _Block_object_dispose(v37, 8);
    goto LABEL_14;
  }
  if (fcntl(TempDirectory, 50, v37) == -1)
  {
    __error();
    _os_assumes_log();
  }
  strerror(*((_DWORD *)v34 + 6));
  _OSLogWarningMessage(v10, "copy handler failed for directory fd: '%s' to '%s': %s (%d)", v14, v15, v16, v17, v18, v19, (char)v37);
  if (close(TempDirectory) != -1)
    goto LABEL_8;
  if (*__error() != 9)
  {
    __error();
    _os_assumes_log();
LABEL_8:
    v20 = *((unsigned int *)v34 + 6);
LABEL_14:
    _Block_object_dispose(&v33, 8);

    return (int *)v20;
  }
  v22 = *__error();
  qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EE52EA88 = v22;
  __break(1u);
LABEL_16:
  result = __error();
  v23 = *result;
  qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EE52EA88 = v23;
  __break(1u);
  return result;
}

void sub_19EA5BA78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a24, 8);
  _Unwind_Resume(a1);
}

uint64_t _OSLogUUIDMapCopySet(int a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  const unsigned __int8 *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[2];
  void (*v16)(uint64_t, const unsigned __int8 *, int);
  void *v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  int v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v16 = ___OSLogUUIDMapCopySet_block_invoke;
  v17 = &unk_1E4157A70;
  v22 = a1;
  v20 = &v27;
  v21 = &v23;
  v9 = v7;
  v18 = v9;
  v10 = v8;
  v19 = v10;
  v11 = *(const unsigned __int8 **)(a2 + 16);
  if (v11)
  {
    do
    {
      v16((uint64_t)v15, v11 + 16, *((_QWORD *)v11 + 4));
      v11 = *(const unsigned __int8 **)v11;
    }
    while (v11);
    v12 = v24[3];
  }
  else
  {
    v12 = 0;
  }
  _os_trace_str_map_destroy(v12);
  v13 = *((unsigned int *)v28 + 6);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

uint64_t _OSLogArchiveCreateInfoPlist(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7, void *a8, void *a9, uint64_t a10, uint64_t a11)
{
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unsigned __int8 *v43;
  char *v44;
  const char *v45;
  char *v46;
  id v47;
  size_t v48;
  void *v49;
  unint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  FILE *v62;
  FILE *v63;
  id v64;
  int v65;
  void *v66;
  int v67;
  void *v68;
  uint64_t v69;
  int v70;
  int v71;
  int v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  int *v81;
  char v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  int *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char v97;
  id v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  id v111;
  void *v112;
  void *v114;
  void *v116;
  void *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  uint64_t v122;
  _BYTE v123[1024];
  _QWORD v124[3];
  _QWORD v125[3];
  const __CFString *v126;
  void *v127;
  _QWORD v128[3];
  _QWORD v129[3];
  _QWORD v130[15];
  _QWORD v131[15];
  _QWORD v132[3];
  _QWORD v133[3];
  const __CFString *v134;
  void *v135;
  _QWORD v136[3];
  _QWORD v137[3];
  const __CFString *v138;
  void *v139;
  _QWORD v140[3];
  _QWORD v141[3];
  const __CFString *v142;
  void *v143;
  _QWORD v144[3];
  _QWORD v145[3];
  _QWORD v146[2];
  _QWORD v147[2];
  char v148[48];
  char out[40];
  uint64_t v150;

  v150 = *MEMORY[0x1E0C80C00];
  v14 = a1;
  v111 = a8;
  v98 = a9;
  v109 = a2;
  if (*(_QWORD *)a2)
    v107 = *(_QWORD *)(*(_QWORD *)a2 + 24);
  else
    v107 = 0;
  memset(out, 0, 37);
  memset(v148, 0, 37);
  uuid_unparse_upper((const unsigned __int8 *)(a3 + 24), out);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ttl01"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ttl01"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("ttl01"));

  }
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ttl03"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ttl03"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, CFSTR("ttl03"));

  }
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ttl07"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ttl07"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, CFSTR("ttl07"));

  }
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ttl14"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ttl14"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v23, CFSTR("ttl14"));

  }
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ttl30"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ttl30"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v25, CFSTR("ttl30"));

  }
  v120 = v15;
  v112 = v14;
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Identifier"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v121)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "UUIDString");
    v121 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v146[0] = CFSTR("OldestTimeRef");
  v144[0] = CFSTR("UUID");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", out);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v145[0] = v27;
  v144[1] = CFSTR("ContinuousTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a3 + 8));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v145[1] = v28;
  v144[2] = CFSTR("WallTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", _timesync_continuous_to_wall_time(a10, (_QWORD *)(a3 + 24), *(_QWORD *)(a3 + 8), 0));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v145[2] = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v145, v144, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v146[1] = CFSTR("TTL");
  v147[0] = v30;
  v147[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v147, v146, 2);
  v119 = objc_claimAutoreleasedReturnValue();

  uuid_unparse_upper((const unsigned __int8 *)(a4 + 24), out);
  v142 = CFSTR("OldestTimeRef");
  v140[0] = CFSTR("UUID");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", out);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v141[0] = v31;
  v140[1] = CFSTR("ContinuousTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a4 + 8));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v141[1] = v32;
  v140[2] = CFSTR("WallTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", _timesync_continuous_to_wall_time(a10, (_QWORD *)(a4 + 24), *(_QWORD *)(a4 + 8), 0));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v141[2] = v33;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v141, v140, 3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = v34;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v143, &v142, 1);
  v118 = (void *)objc_claimAutoreleasedReturnValue();

  uuid_unparse_upper((const unsigned __int8 *)(a5 + 24), out);
  v138 = CFSTR("OldestTimeRef");
  v136[0] = CFSTR("UUID");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", out);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v137[0] = v35;
  v136[1] = CFSTR("ContinuousTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a5 + 8));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v137[1] = v36;
  v136[2] = CFSTR("WallTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", _timesync_continuous_to_wall_time(a10, (_QWORD *)(a5 + 24), *(_QWORD *)(a5 + 8), 0));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v137[2] = v37;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v137, v136, 3);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = v38;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v139, &v138, 1);
  v116 = (void *)objc_claimAutoreleasedReturnValue();

  if (a6)
  {
    uuid_unparse_upper((const unsigned __int8 *)(a6 + 24), out);
    v134 = CFSTR("OldestTimeRef");
    v132[0] = CFSTR("UUID");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", out);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v133[0] = v39;
    v132[1] = CFSTR("ContinuousTime");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a6 + 8));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v133[1] = v40;
    v132[2] = CFSTR("WallTime");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", _timesync_continuous_to_wall_time(a10, (_QWORD *)(a6 + 24), *(_QWORD *)(a6 + 8), 0));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v133[2] = v41;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v133, v132, 3);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = v42;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v135, &v134, 1);
    v114 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
  }
  uuid_unparse_upper((const unsigned __int8 *)(v109 + 24), out);
  v43 = (unsigned __int8 *)(v109 + 24 + 16 * v107 - 16);
  uuid_unparse_upper(v43, v148);
  v131[0] = &unk_1E41653C8;
  v130[0] = CFSTR("OSArchiveVersion");
  v130[1] = CFSTR("OSLoggingSupportProject");
  v44 = strdup("libtrace-1612.0.4\n");
  if (v44)
  {
    v45 = v44;
    v46 = strchr(v44, 10);
    if (v46)
      *v46 = 0;
    v47 = objc_alloc(MEMORY[0x1E0CB3940]);
    v48 = strlen(v45);
    v49 = v47;
    v50 = 0x1E0CB3000;
    v44 = (char *)objc_msgSend(v49, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v45, v48, 4, 1);
  }
  else
  {
    v50 = 0x1E0CB3000uLL;
  }
  v108 = v44;
  v131[1] = v44;
  v130[2] = CFSTR("OSLoggingSupportVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1612.0);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v131[2] = v106;
  v130[3] = CFSTR("ArchiveIdentifier");
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "UUIDString");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v131[3] = v104;
  v131[4] = v121;
  v130[4] = CFSTR("SourceIdentifier");
  v130[5] = CFSTR("EndTimeRef");
  v128[0] = CFSTR("UUID");
  objc_msgSend(*(id *)(v50 + 2368), "stringWithUTF8String:", v148);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v129[0] = v103;
  v128[1] = CFSTR("ContinuousTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v109 + 16));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v129[1] = v102;
  v128[2] = CFSTR("WallTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", _timesync_continuous_to_wall_time(a10, v43, *(_QWORD *)(v109 + 16), 0));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v129[2] = v101;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v129, v128, 3);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v131[5] = v100;
  v130[6] = CFSTR("PersistMetadata");
  v126 = CFSTR("OldestTimeRef");
  v124[0] = CFSTR("UUID");
  objc_msgSend(*(id *)(v50 + 2368), "stringWithUTF8String:", out);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v125[0] = v99;
  v124[1] = CFSTR("ContinuousTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v109 + 8));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v125[1] = v51;
  v124[2] = CFSTR("WallTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", _timesync_continuous_to_wall_time(a10, (_QWORD *)(v109 + 24), *(_QWORD *)(v109 + 8), 0));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v125[2] = v52;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v125, v124, 3);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = v53;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v127, &v126, 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v131[6] = v54;
  v131[7] = v119;
  v130[7] = CFSTR("SpecialMetadata");
  v130[8] = CFSTR("SignpostMetadata");
  v131[8] = v118;
  v131[9] = v116;
  v130[9] = CFSTR("HighVolumeMetadata");
  v130[10] = CFSTR("LiveMetadata");
  v131[10] = v114;
  v130[11] = CFSTR("PersistSizeLimit");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *a7);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v131[11] = v55;
  v130[12] = CFSTR("SpecialSizeLimit");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a7[3]);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v131[12] = v56;
  v130[13] = CFSTR("SignpostSizeLimit");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a7[6]);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v131[13] = v57;
  v130[14] = CFSTR("HighVolumeSizeLimit");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a7[9]);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v131[14] = v58;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v131, v130, 15);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)objc_msgSend(v59, "mutableCopy");

  if (a11)
    objc_msgSend(v60, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("CollectedWithPredicate"));
  v122 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v60, 100, 0, &v122);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = tmpfile();
  if (!v62)
  {
    v81 = __error();
    v82 = strerror(*v81);
    __error();
    v73 = v98;
    _OSLogWarningMessage(v98, "unable to create Info.plist tempfile: %s (%d)", v83, v84, v85, v86, v87, v88, v82);
    v80 = 0xFFFFFFFFLL;
    v66 = v111;
    v68 = (void *)v119;
    goto LABEL_43;
  }
  v63 = v62;
  fileno(v62);
  v64 = objc_retainAutorelease(v61);
  objc_msgSend(v64, "bytes");
  objc_msgSend(v64, "length");
  if (_os_trace_write() < 0)
  {
    v89 = __error();
    v97 = strerror(*v89);
    __error();
    v73 = v98;
    _OSLogWarningMessage(v98, "failed to write to tempfile: %s (%d)", v90, v91, v92, v93, v94, v95, v97);
    v66 = v111;
    v68 = (void *)v119;
    if (fclose(v63) != -1)
    {
LABEL_36:
      v80 = 0xFFFFFFFFLL;
      goto LABEL_43;
    }
LABEL_39:
    __error();
    _os_assumes_log();
    goto LABEL_36;
  }
  v65 = fileno(v63);
  v66 = v111;
  if (fchmod(v65, 0x1A4u) == -1)
  {
    __error();
    _os_assumes_log();
  }
  v67 = fileno(v63);
  v68 = (void *)v119;
  if (lseek(v67, 0, 0) == -1)
  {
    __error();
    _os_assumes_log();
  }
  v69 = fileno(v63);
  v70 = (*((uint64_t (**)(id, uint64_t, const char *))v111 + 2))(v111, v69, "Info.plist");
  if (v70)
  {
    v71 = v70;
    v72 = fileno(v63);
    if (fcntl(v72, 50, v123) == -1)
    {
      __error();
      _os_assumes_log();
    }
    strerror(v71);
    v73 = v98;
    _OSLogWarningMessage(v98, "failed copy handler: '%s' to 'Info.plist': %s (%d)", v74, v75, v76, v77, v78, v79, (char)v123);
    if (fclose(v63) != -1)
      goto LABEL_36;
    goto LABEL_39;
  }
  if (fclose(v63) == -1)
  {
    __error();
    _os_assumes_log();
  }
  v80 = 0;
  v73 = v98;
LABEL_43:

  return v80;
}

uint64_t _OSLogUUIDMapCopyUUID(int a1, const unsigned __int8 *a2, int a3, uint64_t *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  uint64_t v13;
  uint64_t result;
  uint64_t TempDirectory;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  int v42;
  char v43[1024];
  char __s[1024];
  char __str[1024];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a6;
  if (uuid_is_null(a2))
    goto LABEL_4;
  _os_trace_uuiddb_get_pathsuffix((uint64_t)a2, a3, __str, 0x400uLL);
  _os_trace_uuiddb_get_pathsuffix((uint64_t)a2, a3 | 0x10, __s, 0x400uLL);
  if (_os_trace_str_map_lookup((_QWORD *)*a4, __s))
  {
LABEL_3:
    if (_os_trace_str_map_lookup((_QWORD *)*a4, __str))
    {
LABEL_4:
      v13 = 0;
LABEL_5:

      return v13;
    }
    goto LABEL_13;
  }
  TempDirectory = _OSLogCreateTempDirectory(v12, 0x1EDu);
  if ((_DWORD)TempDirectory == -1)
  {
    v13 = *__error();
    goto LABEL_5;
  }
  v16 = TempDirectory;
  v17 = (*((uint64_t (**)(id, uint64_t, char *))v11 + 2))(v11, TempDirectory, __s);
  if (!(_DWORD)v17)
  {
    _os_trace_str_map_insert(a4, __s, 1);
    if (close(v16) == -1)
    {
      v41 = *__error();
      result = *__error();
      if (v41 == 9)
      {
LABEL_31:
        qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_1EE52EA88 = result;
        __break(1u);
        goto LABEL_32;
      }
      _os_assumes_log();
    }
    goto LABEL_3;
  }
  v13 = v17;
  if (fcntl(v16, 50, v43) == -1)
  {
    __error();
    _os_assumes_log();
  }
  strerror(v13);
  _OSLogWarningMessage(v12, "failed copy handler: '%s' to '%s': %s (%d)", v18, v19, v20, v21, v22, v23, (char)v43);
  if (close(v16) != -1)
    goto LABEL_5;
  a4 = (uint64_t *)*__error();
  v24 = *__error();
  if ((_DWORD)a4 != 9)
  {
LABEL_19:
    _os_assumes_log();
    goto LABEL_5;
  }
  qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EE52EA88 = v24;
  __break(1u);
LABEL_13:
  v25 = openat(a1, __str, 0);
  if ((_DWORD)v25 == -1)
  {
    v13 = *__error();
    if (fcntl(a1, 50, v43) == -1)
    {
      __error();
      _os_assumes_log();
    }
    strerror(v13);
    _OSLogWarningMessage(v12, "uuid text missing: %s/%s: %s (%d)", v35, v36, v37, v38, v39, v40, (char)v43);
    goto LABEL_5;
  }
  v26 = v25;
  v27 = (*((uint64_t (**)(id, uint64_t, char *))v11 + 2))(v11, v25, __str);
  if ((_DWORD)v27)
  {
    v13 = v27;
    if (fcntl(v26, 50, v43) == -1)
    {
      __error();
      _os_assumes_log();
    }
    strerror(v13);
    _OSLogWarningMessage(v12, "failed copy handler: '%s' to '%s': %s (%d)", v28, v29, v30, v31, v32, v33, (char)v43);
    if (close(v26) != -1)
      goto LABEL_5;
    v34 = *__error();
    result = *__error();
    if (v34 != 9)
      goto LABEL_19;
    qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_1EE52EA88 = result;
    __break(1u);
    goto LABEL_31;
  }
  _os_trace_str_map_insert(a4, __str, 1);
  if (close(v26) != -1)
    goto LABEL_4;
  v42 = *__error();
  result = *__error();
  if (v42 != 9)
  {
    _os_assumes_log();
    goto LABEL_4;
  }
LABEL_32:
  qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EE52EA88 = result;
  __break(1u);
  return result;
}

void _OSLogEnumerateFiles(void *a1, int a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  unsigned int i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  char v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;

  v5 = a1;
  v6 = a3;
  v7 = _os_trace_fdscandir_b();
  if (v7 < 1)
  {
LABEL_16:
    _os_trace_scandir_free_namelist();

    return;
  }
  for (i = v7; ; --i)
  {
    v9 = i - 1;
    v10 = openat(a2, (const char *)(*(_QWORD *)(8 * v9) + 21), 0);
    if ((_DWORD)v10 != -1)
      break;
    if (*__error() != 2)
    {
      v15 = *(_QWORD *)(8 * v9) + 21;
      v16 = __error();
      strerror(*v16);
      __error();
      _OSLogWarningMessage(v5, "failed to open: '%s': %s (%d)", v17, v18, v19, v20, v21, v22, v15);
    }
    if (i < 2)
      goto LABEL_16;
LABEL_13:
    ;
  }
  v11 = v10;
  v12 = (void *)MEMORY[0x1A1AEC1C8]();
  v13 = (*((uint64_t (**)(id, uint64_t, uint64_t))v6 + 2))(v6, v11, *(_QWORD *)(8 * v9) + 21);
  objc_autoreleasePoolPop(v12);
  if (close(v11) != -1)
  {
LABEL_5:
    if (i > 1)
      v14 = v13;
    else
      v14 = 0;
    if ((v14 & 1) == 0)
      goto LABEL_16;
    goto LABEL_13;
  }
  v23 = *__error();
  v24 = *__error();
  if (v23 != 9)
  {
    _os_assumes_log();
    goto LABEL_5;
  }
  qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EE52EA88 = v24;
  __break(1u);
}

uint64_t _OSLogUUIDMapAddFromFile(uint64_t a1, unint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD v14[2];
  unsigned int (*v15)(_QWORD *);
  void *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  int v23;

  v7 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v15 = (unsigned int (*)(_QWORD *))___OSLogUUIDMapAddFromFile_block_invoke;
  v16 = &unk_1E4157980;
  v8 = v7;
  v17 = v8;
  v18 = &v20;
  v19 = a3;
  v9 = v14;
  v10 = 0;
  do
  {
    if (a2 - v10 < 0x10)
      break;
    v11 = *(_QWORD *)(a1 + v10 + 8);
    if (a2 - v10 - 16 < v11)
      break;
    if (!v15(v9))
      break;
    v10 = (v10 + v11 + 23) & 0xFFFFFFFFFFFFFFF8;
  }
  while (v10 - 1 < a2);

  v12 = *((unsigned int *)v21 + 6);
  _Block_object_dispose(&v20, 8);

  return v12;
}

void sub_19EA5D5D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2184(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2185(uint64_t a1)
{

}

uint64_t OSLogCreateArchiveWithPredicate(const char *a1, uint64_t a2, int64_t a3, BOOL a4, const char *a5, void *a6)
{
  id v11;
  void *v12;
  uint64_t ArchiveWithDictionary;

  v11 = a6;
  _InitArchiveDictionary(a1, a2, a3, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_string(v12, "predicate", a5);
  ArchiveWithDictionary = OSLogCreateArchiveWithDictionary(v12, v11);

  return ArchiveWithDictionary;
}

int64_t OSLogFlushBuffers()
{
  _xpc_connection_s *v0;
  xpc_object_t v1;
  xpc_object_t v2;
  void *v3;
  int64_t int64;

  OSLogLogdAdminConnection();
  v0 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    v1 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v1, "operation", 0xBuLL);
    v2 = xpc_connection_send_message_with_reply_sync(v0, v1);
    v3 = v2;
    if (v2)
    {
      if (MEMORY[0x1A1AECA14](v2) == MEMORY[0x1E0C81310])
      {
        int64 = 22;
      }
      else if (xpc_dictionary_get_uint64(v3, "errorcode"))
      {
        int64 = 1;
      }
      else
      {
        int64 = xpc_dictionary_get_int64(v3, "st");
      }
    }
    else
    {
      int64 = 96;
    }

  }
  else
  {
    int64 = 53;
  }

  return int64;
}

char *os_trace_copy_formatted_message(uint64_t a1)
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  unsigned __int8 *v7;
  size_t v8;
  uint64_t v9;
  char *v10;
  _BYTE *v11;
  size_t v12;
  _BYTE *v13;
  char *v15;
  const char *v16;
  uint64_t v17;
  char v18;
  char *result;
  const char *v20;
  const char *v21;
  _QWORD v22[2];
  uint64_t v23;
  _QWORD v24[130];

  v24[128] = *MEMORY[0x1E0C80C00];
  v23 = 0x10000;
  v22[0] = v24;
  v22[1] = 0x40000000000;
  v2 = *(char **)(a1 + 96);
  if (!v2)
  {
    v20 = *(const char **)(a1 + 88);
    if (!v20)
      v20 = "<compose failure [missing precomposed trace]>";
    return strdup(v20);
  }
  v3 = *(_QWORD *)(a1 + 104);
  if ((unint64_t)(v3 - 1733) < 0xFFFFFFFFFFFFF93CLL)
    goto LABEL_17;
  v5 = &v2[v3 - 1];
  v4 = *v5;
  if ((_WORD)v3 + ~(_WORD)v4 + 2 * (_WORD)v4 == 0xFFFE)
    goto LABEL_17;
  MEMORY[0x1E0C80A78]();
  v7 = (unsigned __int8 *)&v22[-1] - v6;
  bzero((char *)&v22[-1] - v6, v8);
  *v7 = 0;
  v7[1] = v4;
  if ((_DWORD)v4)
  {
    v9 = -v4;
    v10 = &v2[v3 + ~v4];
    v11 = v7 + 2;
    while (1)
    {
      v12 = v5[v9] & 0x3F;
      if (&v2[v12] > v10)
        break;
      *v11 = 0;
      v11[1] = v12;
      v13 = v11 + 2;
      memcpy(v11 + 2, v2, v12);
      v11 = &v13[v12];
      v2 += v12;
      if (__CFADD__(v9++, 1))
        goto LABEL_9;
    }
LABEL_17:
    v20 = "<compose failure [corrupt trace]>";
    return strdup(v20);
  }
LABEL_9:
  v21 = 0;
  v15 = *(char **)(a1 + 88);
  if (!v15)
  {
    v16 = _os_log_resolve_format(*(__n128 **)(a1 + 24), *(_QWORD *)a1, *(_QWORD *)(a1 + 72), &v21);
    if (!v16)
    {
      v20 = v21;
      return strdup(v20);
    }
    v15 = (char *)v16;
    *(_QWORD *)(a1 + 88) = v16;
  }
  if ((*(_DWORD *)(a1 + 80) & 1) != 0)
    v17 = 4;
  else
    v17 = 8;
  os_log_fmt_compose((size_t)v22, v15, 1, 3u, v17, v7, 0, 0, 0, 0, 0);
  v18 = BYTE4(v23);
  result = (char *)v22[0];
  v22[0] = 3954044928;
  WORD2(v23) = 0;
  if ((v18 & 1) == 0)
    return (char *)_os_trace_memdup();
  return result;
}

char *os_log_copy_formatted_message(uint64_t a1)
{
  unsigned __int8 *v2;
  unint64_t v3;
  unint64_t v4;
  const char *v5;
  char *result;
  uint64_t v7;
  int v8;
  unint64_t v9;
  char *v10;
  const char *v11;
  uint64_t v12;
  char v13;
  const char *v14;
  _QWORD v15[2];
  uint64_t v16;
  char v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16 = 0x10000;
  v15[0] = &v17;
  v15[1] = 0x40000000000;
  v2 = *(unsigned __int8 **)(a1 + 96);
  if (!v2)
  {
    v5 = *(const char **)(a1 + 88);
    if (!v5)
      v5 = "<compose failure [missing precomposed log]>";
    return strdup(v5);
  }
  v3 = *(_QWORD *)(a1 + 104);
  if (v3 >> 16)
    goto LABEL_6;
  v4 = *(_QWORD *)(a1 + 120);
  if (v4 >> 16)
    goto LABEL_6;
  if ((unsigned __int16)*(_QWORD *)(a1 + 104))
  {
    if ((unsigned __int16)*(_QWORD *)(a1 + 104) == 1)
    {
LABEL_6:
      v5 = "<compose failure [corrupt log]>";
      return strdup(v5);
    }
    v7 = (uint64_t)(v2 + 2);
    LOWORD(v3) = v3 - 2;
    if (v2[1])
    {
      v8 = 0;
      while ((unsigned __int16)v3 >= 2u)
      {
        v9 = *(unsigned __int8 *)(v7 + 1) + 2;
        if (v9 > (unsigned __int16)v3)
          break;
        v7 += v9;
        LOWORD(v3) = v3 - v9;
        if (v2[1] <= (unsigned __int16)++v8)
          goto LABEL_17;
      }
      goto LABEL_6;
    }
  }
  else
  {
    v7 = 0;
    v2 = (unsigned __int8 *)&os_log_fmt_extract_pubdata_empty_hdr;
  }
LABEL_17:
  v14 = 0;
  v10 = *(char **)(a1 + 88);
  if (!v10)
  {
    v11 = _os_log_resolve_format(*(__n128 **)(a1 + 24), *(_QWORD *)a1, *(_QWORD *)(a1 + 72), &v14);
    if (!v11)
    {
      v5 = v14;
      return strdup(v5);
    }
    v10 = (char *)v11;
    *(_QWORD *)(a1 + 88) = v11;
    v4 = *(_QWORD *)(a1 + 120);
  }
  if ((*(_DWORD *)(a1 + 80) & 1) != 0)
    v12 = 4;
  else
    v12 = 8;
  os_log_fmt_compose((size_t)v15, v10, 2, 3u, v12, v2, v7, (unsigned __int16)v3, *(_QWORD *)(a1 + 112), v4, 0);
  v13 = BYTE4(v16);
  result = (char *)v15[0];
  v15[0] = 3954044928;
  WORD2(v16) = 0;
  if ((v13 & 1) == 0)
    return (char *)_os_trace_memdup();
  return result;
}

uint64_t _chunk_support_convert_tracepoint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unsigned int *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unsigned int *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  unint64_t v18;
  unsigned int *v19;
  unint64_t v20;
  uint64_t v21;
  int v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  int v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unsigned int v37;
  unsigned int v38;
  uint64_t result;
  int v40;
  __int16 v41;
  unint64_t v42;
  __int16 v43;
  unint64_t v44;
  int v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unsigned __int16 v63;
  unsigned __int16 v64;
  __int16 v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a2 + 64);
  *(_OWORD *)(a2 + 4) = 0u;
  *(_OWORD *)(a2 + 20) = 0u;
  *(_OWORD *)(a2 + 36) = 0u;
  *(_OWORD *)(a2 + 84) = 0u;
  *(_OWORD *)(a2 + 100) = 0u;
  *(_OWORD *)(a2 + 116) = 0u;
  *(_OWORD *)(a2 + 132) = 0u;
  *(_OWORD *)(a2 + 148) = 0u;
  *(_OWORD *)(a2 + 164) = 0u;
  *(_OWORD *)(a2 + 180) = 0u;
  *(_OWORD *)(a2 + 196) = 0u;
  *(_OWORD *)(a2 + 212) = 0u;
  *(_OWORD *)(a2 + 224) = 0u;
  *(_OWORD *)(a2 + 68) = 0u;
  *(_OWORD *)(a2 + 52) = 0u;
  *(_DWORD *)a2 = 1024;
  v7 = *(_QWORD *)(a3 + 56);
  if (v7)
  {
    *(_DWORD *)(a2 + 4) = *(_DWORD *)(v7 + 4);
    *(_QWORD *)(a2 + 8) = *(_QWORD *)(v7 + 8);
    *(_QWORD *)(a2 + 24) = v7 + 24;
    uuidpath_lookup_fd(*(_DWORD *)(a3 + 4), (const void *)(v7 + 24), (_QWORD *)(a2 + 32));
    if ((*(_WORD *)(v7 + 2) & 1) != 0)
      *(_DWORD *)(a2 + 136) = 1;
  }
  v8 = *(_QWORD *)(a3 + 32);
  if (*(_DWORD *)v8 == 24580)
    return 0;
  if (*(_DWORD *)v8 == 24579)
  {
    if (!*(_DWORD *)(v8 + 4) && *(_QWORD *)(v8 + 8) >= 0x31uLL)
    {
      *(_DWORD *)a2 = 2560;
      v9 = *(_QWORD *)(v8 + 32);
      *(_QWORD *)(a2 + 40) = *(_QWORD *)(v8 + 40);
      v10 = *(unsigned int **)(a3 + 24);
      *(_QWORD *)(a2 + 64) = v9;
      v11 = *(_QWORD *)(a3 + 88);
      if (v11)
      {
        v12 = _timesync_continuous_to_wall_time(v11, (_QWORD *)(*(_QWORD *)(a3 + 24) + 128), v9, (_QWORD *)(a2 + 112));
        *(_QWORD *)(a2 + 96) = v12 / 0x3B9ACA00;
        *(_DWORD *)(a2 + 104) = v12 % 0x3B9ACA00 / 0x3E8;
      }
      else
      {
        v30 = *((_QWORD *)v10 + 2);
        v31 = v10[6];
        v32 = *((_QWORD *)v10 + 6);
        if (v32 != v9)
        {
          v34 = *v10;
          v33 = v10[1];
          if (v32 >= v9)
          {
            v61 = (v32 - v9) * v34 / v33;
            v30 -= v61 / 0x3B9ACA00;
            v31 -= v61 % 0x3B9ACA00 / 0x3E8;
            if (v31 < 0)
            {
              --v30;
              v31 += 1000000;
            }
          }
          else
          {
            v35 = (v9 - v32) * v34 / v33;
            v30 += v35 / 0x3B9ACA00;
            v31 += v35 % 0x3B9ACA00 / 0x3E8;
            if (v31 > 999999)
            {
              ++v30;
              v31 -= 1000000;
            }
          }
        }
        *(_QWORD *)(a2 + 96) = v30;
        *(_QWORD *)(a2 + 104) = v31;
        *(_QWORD *)(a2 + 112) = *(_QWORD *)(a3 + 16);
      }
      v62 = v8 + 48;
      if (!uuidpath_lookup_fd(*(_DWORD *)(a3 + 4), (const void *)(v8 + 48), (_QWORD *)(a2 + 88)))
      {
        v62 = *(_QWORD *)(a2 + 24);
        *(_QWORD *)(a2 + 88) = *(_QWORD *)(a2 + 32);
      }
      *(_QWORD *)(a2 + 80) = v62;
      result = (uint64_t)_state_support_create_message(*(_QWORD *)(a3 + 32), (_QWORD *)(a2 + 152));
      *(_QWORD *)(a2 + 144) = result;
      if (result)
        return *(_QWORD *)(a3 + 56) != 0;
      return result;
    }
    return 0;
  }
  v13 = *(_QWORD *)(a3 + 64);
  if (v13)
  {
    if (v13 == -1)
    {
      v14 = *(unsigned int **)(a3 + 24);
      *(_QWORD *)(a2 + 64) = v6;
      v15 = *(_QWORD *)(a3 + 88);
      if (v15)
      {
        v16 = (_QWORD *)(*(_QWORD *)(a3 + 24) + 128);
        v17 = (_QWORD *)(a2 + 112);
        v18 = v6;
LABEL_16:
        v20 = _timesync_continuous_to_wall_time(v15, v16, v18, v17);
        *(_QWORD *)(a2 + 96) = v20 / 0x3B9ACA00;
        *(_DWORD *)(a2 + 104) = v20 % 0x3B9ACA00 / 0x3E8;
        goto LABEL_32;
      }
      v21 = *((_QWORD *)v14 + 2);
      v22 = v14[6];
      v23 = *((_QWORD *)v14 + 6);
      if (v23 != v6)
      {
        v25 = *v14;
        v24 = v14[1];
        v26 = v23 - v6;
        if (v23 < v6)
        {
          v27 = v6 - v23;
          goto LABEL_23;
        }
        goto LABEL_29;
      }
    }
    else
    {
      v18 = (*(_QWORD *)(a1 + 16) & 0xFFFFFFFFFFFFLL) + *(_QWORD *)(v13 + 8);
      v19 = *(unsigned int **)(a3 + 24);
      *(_QWORD *)(a2 + 64) = v18;
      v15 = *(_QWORD *)(a3 + 88);
      if (v15)
      {
        v16 = (_QWORD *)(*(_QWORD *)(a3 + 24) + 128);
        v17 = (_QWORD *)(a2 + 112);
        goto LABEL_16;
      }
      v21 = *((_QWORD *)v19 + 2);
      v22 = v19[6];
      v28 = *((_QWORD *)v19 + 6);
      if (v28 != v18)
      {
        v25 = *v19;
        v24 = v19[1];
        v26 = v28 - v18;
        if (v28 < v18)
        {
          v27 = v18 - v28;
LABEL_23:
          v29 = v27 * v25 / v24;
          v21 += v29 / 0x3B9ACA00;
          v22 += v29 % 0x3B9ACA00 / 0x3E8;
          if (v22 > 999999)
          {
            ++v21;
            v22 -= 1000000;
          }
          goto LABEL_31;
        }
LABEL_29:
        v36 = v26 * v25 / v24;
        v21 -= v36 / 0x3B9ACA00;
        v22 -= v36 % 0x3B9ACA00 / 0x3E8;
        if (v22 < 0)
        {
          --v21;
          v22 += 1000000;
        }
      }
    }
LABEL_31:
    *(_QWORD *)(a2 + 96) = v21;
    *(_QWORD *)(a2 + 104) = v22;
    *(_QWORD *)(a2 + 112) = *(_QWORD *)(a3 + 16);
  }
LABEL_32:
  *(_QWORD *)(a2 + 56) = *(_QWORD *)a1;
  *(_QWORD *)(a2 + 72) = *(_QWORD *)(a1 + 8);
  v37 = *(_QWORD *)a1;
  if (v37 <= 6 && ((1 << v37) & 0x58) != 0)
    v38 = *(_QWORD *)a1 << 8;
  else
    v38 = bswap32(*(_QWORD *)a1) >> 16;
  *(_DWORD *)a2 = v38;
  if (!v7)
    return 0;
  result = 0;
  switch(*(_BYTE *)a1)
  {
    case 2:
      v40 = *(unsigned __int8 *)(a1 + 1);
      if (v40 == 1)
        return _chunk_support_parse_activity_create(a2, a1, a3);
      if (v40 == 3)
        return _chunk_support_parse_useraction(a2, a1, a3);
      if (v40 != 2)
        return 0;
      return _chunk_support_parse_activity_swap(a2, a1, a3);
    case 3:
      v64 = 0;
      *(_DWORD *)a2 = 768;
      v41 = *(_WORD *)(a1 + 2);
      if ((v41 & 1) != 0)
      {
        if (!(*(_QWORD *)(a1 + 16) >> 51))
          return 0;
        v64 = 8;
        v59 = *(_QWORD *)(a1 + 24);
        *(_QWORD *)(a2 + 40) = v59;
        *(_QWORD *)(a2 + 48) = _os_activity_map_find_parent(*(_QWORD **)(a3 + 8), v59);
        v41 = *(_WORD *)(a1 + 2);
        v42 = 16;
      }
      else
      {
        v42 = 8;
      }
      if ((v41 & 0x10) != 0)
      {
        if (v42 > *(unsigned __int16 *)(a1 + 22))
          return 0;
        v64 = v42;
      }
      result = _chunk_support_parse_location(a1, &v64, a2 + 56, a3);
      if ((_DWORD)result)
      {
        v60 = v64;
        *(_QWORD *)(a2 + 152) = a1 + v64 + 24;
        v58 = *(unsigned __int16 *)(a1 + 22) - v60;
        goto LABEL_85;
      }
      return result;
    case 4:
      goto LABEL_45;
    case 6:
      *(_DWORD *)a2 = 1536;
LABEL_45:
      v63 = 0;
      v43 = *(_WORD *)(a1 + 2);
      if ((v43 & 1) != 0)
      {
        if (!(*(_QWORD *)(a1 + 16) >> 51))
          return 0;
        LODWORD(v44) = 8;
        v63 = 8;
        v46 = *(_QWORD *)(a1 + 24);
        *(_QWORD *)(a2 + 40) = v46;
        *(_QWORD *)(a2 + 48) = _os_activity_map_find_parent(*(_QWORD **)(a3 + 8), v46);
        v43 = *(_WORD *)(a1 + 2);
        if ((v43 & 0x10) == 0)
          goto LABEL_54;
      }
      else
      {
        LODWORD(v44) = 0;
        if ((v43 & 0x10) == 0)
          goto LABEL_54;
      }
      v44 = (v44 + 8);
      if (*(unsigned __int16 *)(a1 + 22) < v44)
        return 0;
      v63 = v44;
LABEL_54:
      if ((v43 & 0x100) == 0)
        goto LABEL_60;
      if ((unint64_t)v44 + 4 > *(unsigned __int16 *)(a1 + 22))
        return 0;
      v63 = v44 + 4;
      v47 = a1 + v44;
      v48 = *(unsigned __int16 *)(v47 + 24);
      v49 = *(unsigned __int16 *)(v47 + 26);
      if ((v49 + v48) <= 0x1000)
      {
        v50 = *(_QWORD *)(a3 + 80);
        if (4096 - v50 <= v48 && (*(_BYTE *)a3 & 0x80) == 0)
        {
          *(_QWORD *)(a2 + 168) = *(_QWORD *)(a3 + 72) + v50 - 4096 + v48;
          *(_QWORD *)(a2 + 176) = v49;
        }
      }
LABEL_60:
      result = _chunk_support_parse_location(a1, &v63, a2 + 56, a3);
      if (!(_DWORD)result)
        return result;
      LOWORD(v51) = v63;
      if ((*(_WORD *)(a1 + 2) & 0x200) == 0)
        goto LABEL_65;
      LOWORD(v51) = v63 + 2;
      if ((unint64_t)v63 + 2 > *(unsigned __int16 *)(a1 + 22))
        return 0;
      v52 = *(_QWORD *)(a3 + 56);
      v65 = *(_WORD *)(a1 + v63 + 24);
      v53 = hashtable_lookup(*(_QWORD *)(v52 + 64), (uint64_t)&v65);
      if (v53)
      {
        *(_QWORD *)(a2 + 184) = *(_QWORD *)(v53 + 8);
        *(_QWORD *)(a2 + 192) = *(_QWORD *)(v53 + 16);
      }
LABEL_65:
      v54 = *(_WORD *)(a1 + 2);
      if ((v54 & 0x400) == 0)
        goto LABEL_68;
      if (*(unsigned __int16 *)(a1 + 22) <= (unint64_t)(unsigned __int16)v51)
        return 0;
      LOWORD(v51) = v51 + 1;
LABEL_68:
      if (*(_BYTE *)a1 == 6)
      {
        v55 = (unsigned __int16)v51;
        v51 = (unsigned __int16)v51 + 8;
        if (v51 > *(unsigned __int16 *)(a1 + 22))
          return 0;
        *(_QWORD *)(a2 + 208) = *(_QWORD *)(a1 + v55 + 24);
        *(_BYTE *)(a2 + 224) = *(_BYTE *)(a1 + 1) & 0x3F;
        *(_BYTE *)(a2 + 225) = *(_BYTE *)(a1 + 1) & 0xC0;
        v54 = *(_WORD *)(a1 + 2);
        if (v54 < 0)
        {
          v51 = (unsigned __int16)v51 + 4;
          v56 = *(_QWORD *)(a1 + 16);
          if (v51 > HIWORD(v56))
            return 0;
          if ((v54 & 0x20) != 0)
          {
            v51 = (unsigned __int16)v51 + 2;
            if (v51 > HIWORD(v56))
              return 0;
          }
        }
      }
      if ((v54 & 0x800) == 0)
        goto LABEL_77;
      v57 = (unsigned __int16)v51;
      v51 = (unsigned __int16)v51 + 4;
      if (v51 > *(unsigned __int16 *)(a1 + 22))
        return 0;
      *(_DWORD *)(a2 + 200) = *(_DWORD *)(a1 + v57 + 24);
LABEL_77:
      *(_QWORD *)(a2 + 152) = a1 + (unsigned __int16)v51 + 24;
      v58 = *(unsigned __int16 *)(a1 + 22) - (unint64_t)(unsigned __int16)v51;
LABEL_85:
      *(_QWORD *)(a2 + 160) = v58;
LABEL_86:
      result = 1;
      break;
    case 7:
      *(_DWORD *)a2 = 1792;
      if (*(_QWORD *)(a1 + 16) >> 51 < 3uLL)
        return 0;
      v45 = *(_DWORD *)(a1 + 40);
      *(_OWORD *)(a2 + 144) = *(_OWORD *)(a1 + 24);
      *(_DWORD *)(a2 + 160) = v45;
      goto LABEL_86;
    default:
      return result;
  }
  return result;
}

uint64_t _chunk_support_parse_activity_swap(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int16 v5;
  unint64_t v6;
  unint64_t v7;

  *(_DWORD *)a1 = 514;
  v5 = *(_WORD *)(a2 + 2);
  if ((v5 & 1) == 0)
  {
    LODWORD(v6) = 0;
    if ((v5 & 0x10) == 0)
      goto LABEL_7;
LABEL_6:
    v6 = (v6 + 8);
    if (*(unsigned __int16 *)(a2 + 22) < v6)
      return 0;
    goto LABEL_7;
  }
  if (!(*(_QWORD *)(a2 + 16) >> 51))
    return 0;
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = v7;
  *(_QWORD *)(a1 + 48) = _os_activity_map_find_parent(*(_QWORD **)(a3 + 8), v7);
  v5 = *(_WORD *)(a2 + 2);
  LODWORD(v6) = 8;
  if ((v5 & 0x10) != 0)
    goto LABEL_6;
LABEL_7:
  if ((v5 & 0x200) == 0)
    return 1;
  if ((unint64_t)v6 + 8 <= *(unsigned __int16 *)(a2 + 22))
  {
    *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + v6 + 24);
    return 1;
  }
  return 0;
}

uint64_t _chunk_support_parse_activity_create(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int16 v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  unint64_t v10;
  uint64_t v11;
  __int16 v12;

  *(_DWORD *)a1 = 513;
  v5 = *(_WORD *)(a2 + 2);
  if ((v5 & 1) == 0)
  {
    LODWORD(v6) = 0;
    if ((v5 & 0x10) == 0)
      goto LABEL_3;
LABEL_7:
    v7 = v6;
    v6 = v6 + 8;
    if (v6 > *(unsigned __int16 *)(a2 + 22))
      return 0;
    *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + v7 + 24);
    if ((*(_WORD *)(a2 + 2) & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_9;
  }
  if (!(*(_QWORD *)(a2 + 16) >> 51))
    return 0;
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 24);
  v5 = *(_WORD *)(a2 + 2);
  LODWORD(v6) = 8;
  if ((v5 & 0x10) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v5 & 0x200) != 0)
  {
LABEL_9:
    v8 = v6;
    v6 = v6 + 8;
    if (v6 <= *(unsigned __int16 *)(a2 + 22))
    {
      *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + v8 + 24);
      goto LABEL_11;
    }
    return 0;
  }
LABEL_11:
  if ((unint64_t)v6 + 8 > *(unsigned __int16 *)(a2 + 22))
    return 0;
  v12 = v6 + 8;
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + v6 + 24);
  result = _chunk_support_parse_location(a2, &v12, a1 + 56, a3);
  if ((_DWORD)result)
  {
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
    {
      v11 = *(_QWORD *)(a1 + 48);
      if (v11)
        _os_activity_map_insert((uint64_t *)(a3 + 8), v10, v11);
    }
    else
    {
      *(_QWORD *)(a1 + 144) = "Default/remote activity";
    }
    return 1;
  }
  return result;
}

uint64_t _chunk_support_parse_useraction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int16 v6;
  unint64_t v7;
  unint64_t v8;
  __int16 v10;

  v10 = 0;
  *(_DWORD *)a1 = 515;
  v6 = *(_WORD *)(a2 + 2);
  if ((v6 & 1) == 0)
  {
    v7 = 8;
    if ((v6 & 0x10) == 0)
      return _chunk_support_parse_location(a2, &v10, a1 + 56, a3);
    goto LABEL_6;
  }
  if (!(*(_QWORD *)(a2 + 16) >> 51))
    return 0;
  v10 = 8;
  v8 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = _os_activity_map_find_parent(*(_QWORD **)(a3 + 8), v8);
  v7 = 16;
  if ((*(_WORD *)(a2 + 2) & 0x10) != 0)
  {
LABEL_6:
    if (v7 <= *(unsigned __int16 *)(a2 + 22))
    {
      v10 = v7;
      return _chunk_support_parse_location(a2, &v10, a1 + 56, a3);
    }
    return 0;
  }
  return _chunk_support_parse_location(a2, &v10, a1 + 56, a3);
}

uint64_t _chunk_support_parse_location(uint64_t a1, _WORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  int v9;
  unsigned int v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unsigned int *v14;
  const void *v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  _QWORD *v27;
  unint64_t v28;

  v8 = *(_QWORD *)(a4 + 56);
  v9 = *(_DWORD *)(a1 + 4);
  if ((*(_WORD *)(v8 + 2) & 1) != 0)
    v10 = 4;
  else
    v10 = 6;
  switch(*(_WORD *)(a1 + 2) & 0xE)
  {
    case 2:
    case 4:
    case 6:
      v10 = 4;
      break;
    case 8:
      break;
    case 0xA:
      v10 = 20;
      break;
    case 0xC:
      v10 = 6;
      break;
    default:
      v10 = 0;
      break;
  }
  v11 = (unsigned __int16)*a2;
  v12 = v11 + v10;
  v13 = *(_QWORD *)(a1 + 16);
  if (v12 > HIWORD(v13))
  {
    v23 = 0;
    v28 = HIWORD(v13);
LABEL_37:
    *a2 = v28;
    return v23;
  }
  *a2 = v12;
  if (!v10)
    return 0;
  v14 = (unsigned int *)(a1 + 24 + v11);
  if (v10 == 6)
  {
    v15 = 0;
    v16 = (unint64_t)*((unsigned __int16 *)v14 + 2) << 32;
  }
  else
  {
    v16 = 0;
    if (v10 == 4)
      v15 = 0;
    else
      v15 = v14 + 1;
  }
  v17 = *v14;
  if ((*(_WORD *)(a1 + 2) & 0x20) == 0)
  {
    v18 = 0;
    goto LABEL_20;
  }
  v19 = *(_QWORD *)(a1 + 16);
  if ((unint64_t)(unsigned __int16)v12 + 2 > HIWORD(v19))
  {
    v23 = 0;
    v28 = HIWORD(v19);
    goto LABEL_37;
  }
  *a2 = v12 + 2;
  v18 = (unint64_t)*(unsigned __int16 *)(a1 + 24 + (unsigned __int16)v12) << 31;
LABEL_20:
  v20 = v18 | v9 & 0x7FFFFFFF;
  if (v9 >= 0)
    v21 = v20;
  else
    v21 = v20 | 0x8000000000000000;
  *(_QWORD *)(a3 + 72) = v21;
  if (!v21)
    return 0;
  v22 = *(_WORD *)(a1 + 2) & 0xE;
  v23 = 1;
  v24 = v16 | v17;
  switch(v22)
  {
    case 2:
      *(_QWORD *)(a3 + 64) = v24;
      v15 = (const void *)(v8 + 24);
      goto LABEL_29;
    case 4:
    case 12:
      *(_QWORD *)(a3 + 24) = v8 + 40;
      v25 = a3 + 24;
      *(_QWORD *)(v25 + 40) = v24;
      return uuidpath_sharedcache_resolve_fd(*(unsigned int *)(a4 + 4), (__n128 *)(v8 + 40), v21, v16 | v17, 0, (const char **)(v25 + 64), 0, (_QWORD *)v25, v25 + 8, 0, 0);
    case 8:
      v27 = (_QWORD *)_catalog_procinfo_lookup_pc(v8, v16 | v17);
      if (!v27)
        return 0;
      v15 = v27 + 2;
      *(_QWORD *)(a3 + 64) = v24 - *v27;
      v21 = *(_QWORD *)(a3 + 72);
LABEL_29:
      *(_QWORD *)(a3 + 24) = v15;
      break;
    case 10:
      *(_QWORD *)(a3 + 64) = v24;
      *(_QWORD *)(a3 + 24) = v15;
      if (!v15)
        return 0;
      break;
    default:
      return v23;
  }
  return uuidpath_resolve_fd(*(_DWORD *)(a4 + 4), v15, v21, 0, (const char **)(a3 + 88), 0, (_QWORD *)(a3 + 32), 0);
}

tm *_chunk_support_context_init(uint64_t a1)
{
  tm *result;
  int tm_isdst;
  unint64_t v4;
  tm v5;
  time_t v6;

  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_DWORD *)(a1 + 4) = -1;
  v6 = time(0);
  memset(&v5, 0, sizeof(v5));
  result = localtime_r(&v6, &v5);
  tm_isdst = v5.tm_isdst;
  v4 = ((unsigned __int128)(v5.tm_gmtoff * (__int128)0x7777777777777777) >> 64) - v5.tm_gmtoff;
  *(_DWORD *)(a1 + 16) = (v4 >> 5) + (v4 >> 63) + 60 * v5.tm_isdst;
  *(_DWORD *)(a1 + 20) = tm_isdst;
  return result;
}

uint64_t _chunk_support_context_clear(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;

  _os_activity_map_destroy(*(_QWORD *)(a1 + 8));
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    _catalog_destroy(v2);
  result = *(unsigned int *)(a1 + 4);
  if ((_DWORD)result != -1)
  {
    result = close(result);
    if ((_DWORD)result == -1)
    {
      v4 = *__error();
      result = *__error();
      if (v4 == 9)
      {
        qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_1EE52EA88 = result;
        __break(1u);
      }
      else
      {
        return _os_assumes_log();
      }
    }
  }
  return result;
}

_QWORD *_chunk_support_context_update(_QWORD *result, int *a2)
{
  _QWORD *v2;
  unsigned __int16 *v3;
  int v4;
  unint64_t v5;
  unint64_t v6;
  _BOOL4 v7;
  unint64_t v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  BOOL v20;
  int v21;
  __int16 v22;

  v2 = result;
  v3 = 0;
  result[4] = a2;
  v4 = *a2;
  switch(*a2)
  {
    case 24577:
      v5 = *((_QWORD *)a2 + 1);
      v6 = v5 - 16;
      if (v5 < 0x10)
        goto LABEL_12;
      v3 = (unsigned __int16 *)(a2 + 8);
      v7 = *((_BYTE *)a2 + 29) != 0;
      goto LABEL_19;
    case 24578:
      v10 = *((_QWORD *)a2 + 1);
      v6 = v10 - 32;
      if (v10 < 0x20)
        goto LABEL_12;
      v7 = 0;
      v3 = (unsigned __int16 *)(a2 + 12);
      goto LABEL_19;
    case 24579:
      v11 = *((_QWORD *)a2 + 1);
      v6 = v11 - 48;
      if (v11 < 0x30)
        goto LABEL_12;
      v7 = 0;
      v3 = (unsigned __int16 *)(a2 + 16);
      goto LABEL_19;
    case 24580:
      v12 = *((_QWORD *)a2 + 1);
      v6 = v12 - 72;
      if (v12 < 0x48)
      {
LABEL_12:
        result[8] = 0;
        goto LABEL_25;
      }
      v7 = 0;
      v3 = (unsigned __int16 *)(a2 + 22);
      goto LABEL_19;
    case 24581:
    case 24582:
    case 24583:
    case 24584:
    case 24585:
    case 24586:
    case 24587:
      goto LABEL_23;
    case 24588:
      v8 = *((_QWORD *)a2 + 1);
      if (v8 <= 0xF)
      {
        result[8] = 0;
        goto LABEL_29;
      }
      v7 = 0;
      v3 = (unsigned __int16 *)a2 + 15;
      goto LABEL_18;
    default:
      if (v4 != 24592)
        goto LABEL_23;
      v8 = *((_QWORD *)a2 + 1);
      if (v8 <= 0xF)
      {
        v9 = 0;
        result[8] = 0;
        goto LABEL_31;
      }
      v7 = 0;
      v3 = (unsigned __int16 *)(a2 + 8);
LABEL_18:
      v6 = v8 - 16;
LABEL_19:
      if (v6 - 4097 < 0xFFFFFFFFFFFFF00FLL)
        goto LABEL_23;
      v13 = *v3;
      if (v6 < v13)
      {
        v3 = 0;
        goto LABEL_24;
      }
      v14 = v3[1];
      if (v14 > 0xFFF)
        goto LABEL_23;
      if (!v7)
      {
        if (v6 == 4096)
        {
          result[9] = (char *)v3 + v14;
          result[10] = (unsigned __int16)(4096 - v14);
          goto LABEL_24;
        }
LABEL_23:
        result[9] = 0;
        result[10] = 0;
        goto LABEL_24;
      }
      if (v6 > v13 + (unsigned __int16)(4096 - v14))
        goto LABEL_23;
      result[9] = (char *)v3 + v13;
      result[10] = (unsigned __int16)(4096 - v14);
LABEL_24:
      result[8] = v3;
      if ((v4 - 24577) < 4)
      {
LABEL_25:
        v15 = result[5];
        if (v15)
        {
          result = _os_procinfo_map_lookup(*(_QWORD **)(v15 + 40), *((_QWORD *)a2 + 2), a2[6]);
          v2[7] = result;
          return result;
        }
        goto LABEL_43;
      }
      if (v4 == 24592)
      {
        v9 = 0;
      }
      else
      {
        if (v4 != 24588)
          return result;
LABEL_29:
        v9 = *((unsigned __int8 *)a2 + 29);
      }
LABEL_31:
      v16 = result[5];
      if (!v16 || (v17 = *(_QWORD *)(v16 + 40)) == 0)
      {
LABEL_43:
        result[7] = 0;
        return result;
      }
      v18 = (_QWORD *)(v17 + 16);
      do
      {
        v18 = (_QWORD *)*v18;
        if (!v18)
          goto LABEL_43;
      }
      while (v18[2] != *((_QWORD *)a2 + 2));
      v19 = v18[4];
      result[7] = v19;
      if (v19)
        v20 = v9 == 0;
      else
        v20 = 1;
      if (!v20)
      {
        v21 = *(__int16 *)(v19 + 2);
        if (v21 < 0)
        {
          v22 = v21 & 0x7FFF;
          *(_WORD *)(v19 + 2) = v22;
          if (v9 == 4)
            *(_WORD *)(v19 + 2) = v22 | 1;
        }
      }
      return result;
  }
}

BOOL ___os_activity_stream_mapped_file_block_invoke(_QWORD *a1, uint64_t a2)
{
  int v3;
  BOOL v5;
  int v6;

  v3 = *(_DWORD *)a2;
  if (a1[5] == a2)
  {
    if (v3 != 4096 || *(_QWORD *)(a2 + 8) <= 0x27uLL)
      return 0;
LABEL_17:
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = _chunk_support_stream((int *)a2, a1[6]);
    return *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) != 0;
  }
  if (v3 > 7679)
  {
    switch(v3)
    {
      case 24577:
      case 24578:
      case 24579:
      case 24580:
        if (!*(_DWORD *)(a2 + 4))
          goto LABEL_17;
        break;
      case 24581:
      case 24582:
      case 24583:
      case 24584:
      case 24585:
      case 24586:
      case 24590:
      case 24591:
        return *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) != 0;
      case 24587:
        if ((*(_DWORD *)(a2 + 4) - 14) <= 3)
          goto LABEL_17;
        break;
      case 24588:
      case 24592:
        if ((*(_DWORD *)(a2 + 4) - 14) < 4)
          goto LABEL_17;
        break;
      case 24589:
        goto LABEL_17;
      default:
        if (v3 == 7680 || v3 == 0x2000)
          goto LABEL_17;
        break;
    }
    return *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) != 0;
  }
  if (v3 > 7167)
  {
    v5 = v3 == 7168;
    v6 = 7424;
  }
  else
  {
    v5 = v3 == 4096;
    v6 = 6912;
  }
  if (v5 || v3 == v6)
    goto LABEL_17;
  return *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) != 0;
}

BOOL _chunk_support_stream(int *a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  _BOOL8 v6;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  _QWORD *v15;
  unsigned __int16 *v16;
  uint64_t v17;
  unsigned __int16 *v18;
  char *v19;
  unint64_t v20;
  unsigned __int16 *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _OWORD v31[15];
  _QWORD v32[6];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  v33 = 0;
  v34 = &v33;
  v35 = 0x2000000000;
  v36 = 1;
  *(_QWORD *)(a2 + 32) = a1;
  switch(*a1)
  {
    case 24577:
    case 24588:
      _chunk_support_context_update((_QWORD *)a2, a1);
      v8 = *(_QWORD *)(a2 + 104);
      if (v8)
      {
        v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 16))(v8, a2);
        *((_BYTE *)v34 + 24) = v9;
        if (!v9)
          goto LABEL_5;
      }
      else if (!*((_BYTE *)v34 + 24))
      {
        goto LABEL_5;
      }
      if (!*(_QWORD *)(a2 + 96))
        goto LABEL_5;
      v16 = *(unsigned __int16 **)(a2 + 64);
      if (!v16)
        goto LABEL_5;
      memset(v31, 0, sizeof(v31));
      v18 = v16 + 8;
      v17 = *v16;
      v19 = (char *)v16 + v17;
      if (v17 > 0x1000)
        v20 = (unint64_t)v18;
      else
        v20 = (unint64_t)v19;
      while ((unint64_t)(v18 + 12) < v20)
      {
        v21 = v18;
        v22 = *((_QWORD *)v18 + 2);
        v23 = HIWORD(v22);
        if (!HIWORD(v22) || v23 > (uint64_t)(v20 - (_QWORD)(v18 + 12)))
          break;
        if ((v22 & 0x7000000000000) != 0)
          v25 = (HIWORD(v22) & 0xFFF8) + 32;
        else
          v25 = v23 + 24;
        v18 = (unsigned __int16 *)((char *)v18 + v25);
        if (*(_QWORD *)v21
          && _chunk_support_convert_tracepoint((uint64_t)v21, (uint64_t)v31, a2)
          && ((*(uint64_t (**)(_QWORD, _OWORD *, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 + 96) + 16))(*(_QWORD *)(a2 + 96), v31, 0, v26, v27, v28, v29, v30) & 1) == 0)
        {
          *((_BYTE *)v34 + 24) = 0;
          goto LABEL_5;
        }
      }
      goto LABEL_5;
    case 24578:
    case 24579:
    case 24580:
    case 24592:
      _chunk_support_context_update((_QWORD *)a2, a1);
      goto LABEL_3;
    case 24581:
    case 24582:
    case 24583:
    case 24584:
    case 24585:
    case 24586:
    case 24590:
    case 24591:
      goto LABEL_5;
    case 24587:
      v10 = *(_QWORD *)(a2 + 40);
      if (v10)
        _catalog_destroy(v10);
      v11 = _catalog_create_with_chunk((uint64_t)a1, 0);
      *(_QWORD *)(a2 + 40) = v11;
      if (v11)
        v12 = *(_QWORD *)(v11 + 64);
      else
        v12 = 0;
      *(_QWORD *)(a2 + 48) = v12;
      goto LABEL_3;
    case 24589:
      v13 = *(_QWORD *)(a2 + 104);
      if (v13)
      {
        v14 = (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 16))(v13, a2);
        *((_BYTE *)v34 + 24) = v14;
      }
      v15 = *(_QWORD **)(a2 + 48);
      if (v15)
      {
        if ((*(_BYTE *)(a2 + 1) & 8) == 0)
        {
          v32[0] = MEMORY[0x1E0C809B0];
          v32[1] = 0x40000000;
          v32[2] = ___chunk_support_stream_block_invoke;
          v32[3] = &unk_1E4157B00;
          v32[4] = &v33;
          v32[5] = a2;
          _tracev3_chunk_decompress_and_enumerate_chunks((uint64_t)a1, (uint64_t)v15, (uint64_t)v32);
          v15 = *(_QWORD **)(a2 + 48);
        }
        if (*v15)
          *(_QWORD *)(a2 + 48) = *v15;
LABEL_5:
        v6 = *((_BYTE *)v34 + 24) != 0;
      }
      else
      {
        v6 = 1;
      }
      _Block_object_dispose(&v33, 8);
      return v6;
    default:
      if (*a1 != 4096)
        goto LABEL_5;
      *(_QWORD *)(a2 + 24) = a1 + 4;
LABEL_3:
      v4 = *(_QWORD *)(a2 + 104);
      if (v4)
      {
        v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
        *((_BYTE *)v34 + 24) = v5;
      }
      goto LABEL_5;
  }
}

BOOL ___chunk_support_stream_block_invoke(uint64_t a1, int *a2)
{
  _BOOL8 result;
  unsigned int v5;
  BOOL v6;
  int v7;

  _chunk_support_context_update(*(_QWORD **)(a1 + 40), a2);
  result = 1;
  v5 = *a2 - 24577;
  v6 = v5 > 0xF;
  v7 = (1 << v5) & 0x880F;
  if (!v6 && v7 != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = _chunk_support_stream(a2, *(_QWORD *)(a1 + 40));
    return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) != 0;
  }
  return result;
}

uint64_t _os_activity_stream_entry_decode(void *a1, int *a2)
{
  uint64_t result;
  const char *string;
  const void *v6;
  uint64_t uint64;
  char v8;
  __n128 **v9;
  int v10;
  const char *v11;
  __n128 *v12;
  int v13;
  const void *data;
  BOOL v15;
  BOOL v16;

  if (!a1)
    return 0xFFFFFFFFLL;
  if (MEMORY[0x1A1AECA14]() != MEMORY[0x1E0C812F8])
    return 0xFFFFFFFFLL;
  *((_OWORD *)a2 + 13) = 0u;
  *((_OWORD *)a2 + 14) = 0u;
  *((_OWORD *)a2 + 11) = 0u;
  *((_OWORD *)a2 + 12) = 0u;
  *((_OWORD *)a2 + 9) = 0u;
  *((_OWORD *)a2 + 10) = 0u;
  *((_OWORD *)a2 + 7) = 0u;
  *((_OWORD *)a2 + 8) = 0u;
  *((_OWORD *)a2 + 5) = 0u;
  *((_OWORD *)a2 + 6) = 0u;
  *((_OWORD *)a2 + 3) = 0u;
  *((_OWORD *)a2 + 4) = 0u;
  *(_OWORD *)a2 = 0u;
  *((_OWORD *)a2 + 1) = 0u;
  *((_OWORD *)a2 + 2) = 0u;
  a2[1] = xpc_dictionary_get_uint64(a1, "pid");
  *((_QWORD *)a2 + 1) = xpc_dictionary_get_uint64(a1, "procid");
  a2[4] = xpc_dictionary_get_uint64(a1, "uid");
  *((_QWORD *)a2 + 3) = xpc_dictionary_get_uuid(a1, "procuuid");
  string = xpc_dictionary_get_string(a1, "procpath");
  *((_QWORD *)a2 + 4) = string;
  if (!string)
  {
    v6 = (const void *)*((_QWORD *)a2 + 3);
    if (v6)
      uuidpath_lookup_fd(-3, v6, (_QWORD *)a2 + 4);
  }
  *((_QWORD *)a2 + 5) = xpc_dictionary_get_uint64(a1, "aid");
  *((_QWORD *)a2 + 6) = xpc_dictionary_get_uint64(a1, "paid");
  *a2 = xpc_dictionary_get_uint64(a1, "type");
  a2[29] = xpc_dictionary_get_int64(a1, "timezoneDSTflag");
  a2[28] = xpc_dictionary_get_int64(a1, "timezoneMinutesWest");
  *((_QWORD *)a2 + 12) = xpc_dictionary_get_int64(a1, "timeGMTsec");
  a2[26] = xpc_dictionary_get_int64(a1, "timeGMTusec");
  if (xpc_dictionary_get_BOOL(a1, "32bits"))
    a2[34] |= 1u;
  uint64 = xpc_dictionary_get_uint64(a1, "traceid");
  v8 = BYTE2(uint64);
  *((_QWORD *)a2 + 7) = uint64;
  *((_QWORD *)a2 + 9) = xpc_dictionary_get_uint64(a1, "thread");
  *((_QWORD *)a2 + 8) = xpc_dictionary_get_uint64(a1, "timestamp");
  *((_QWORD *)a2 + 15) = xpc_dictionary_get_uint64(a1, "offset");
  *((_QWORD *)a2 + 16) = xpc_dictionary_get_uint64(a1, "formatoffset");
  *((_QWORD *)a2 + 10) = xpc_dictionary_get_uuid(a1, "imageuuid");
  v9 = (__n128 **)(a2 + 20);
  *((_QWORD *)a2 + 11) = xpc_dictionary_get_string(a1, "imagepath");
  v10 = *a2;
  result = 0xFFFFFFFFLL;
  if (*a2 > 767)
  {
    if (v10 != 1024 && v10 != 768)
      return result;
  }
  else if (v10 != 513 && v10 != 515)
  {
    return result;
  }
  v11 = xpc_dictionary_get_string(a1, "name");
  *((_QWORD *)a2 + 18) = v11;
  if (!v11 || !*((_QWORD *)a2 + 11))
  {
    v12 = *v9;
    if (*v9)
    {
      if ((v8 & 6 | 8) == 0xC)
        uuidpath_sharedcache_resolve_fd(0xFFFFFFFFLL, v12, *((_QWORD *)a2 + 16), *((_QWORD *)a2 + 15), 0, (const char **)a2 + 18, 0, (_QWORD *)a2 + 10, (unint64_t)(a2 + 22), 0, 0);
      else
        uuidpath_resolve(0, v12, *((_QWORD *)a2 + 16), 0, (const char **)a2 + 18, 0, (_QWORD *)a2 + 11, 0);
    }
  }
  v13 = *a2;
  if (*a2 == 515)
  {
    v15 = xpc_dictionary_get_BOOL(a1, "persisted");
    result = 0;
    *((_BYTE *)a2 + 152) = v15;
  }
  else if (v13 == 1024)
  {
    *((_QWORD *)a2 + 19) = xpc_dictionary_get_data(a1, "buffer", (size_t *)a2 + 20);
    *((_QWORD *)a2 + 21) = xpc_dictionary_get_data(a1, "privdata", (size_t *)a2 + 22);
    *((_QWORD *)a2 + 24) = xpc_dictionary_get_string(a1, "category");
    *((_QWORD *)a2 + 23) = xpc_dictionary_get_string(a1, "subsystem");
    v16 = xpc_dictionary_get_BOOL(a1, "persisted");
    result = 0;
    *((_BYTE *)a2 + 205) = v16;
  }
  else if (v13 == 768)
  {
    *((_QWORD *)a2 + 21) = xpc_dictionary_get_value(a1, "payload");
    data = xpc_dictionary_get_data(a1, "buffer", (size_t *)a2 + 20);
    result = 0;
    *((_QWORD *)a2 + 19) = data;
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t os_activity_stream_for_simulator(const char *a1, int a2, const void *a3)
{
  uint64_t v6;
  char __str[64];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = _os_trace_calloc();
  snprintf(__str, 0x40uLL, "com.apple.activity.stream.%s", a1);
  *(_QWORD *)(v6 + 24) = dispatch_queue_create(__str, 0);
  *(_QWORD *)v6 = _Block_copy(a3);
  *(_QWORD *)(v6 + 40) = xpc_array_create(0, 0);
  *(_QWORD *)(v6 + 48) = xpc_array_create(0, 0);
  *(_DWORD *)(v6 + 32) = a2;
  *(_DWORD *)(v6 + 64) = 0;
  *(_BYTE *)(v6 + 84) = 1;
  *(_QWORD *)(v6 + 72) = strdup(a1);
  return v6;
}

uint64_t os_activity_stream_for_pid(int a1, int a2, const void *a3)
{
  uint64_t v6;
  xpc_object_t v7;
  char __str[64];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = _os_trace_calloc();
  snprintf(__str, 0x40uLL, "com.apple.activity.stream.%d", a1);
  *(_QWORD *)(v6 + 24) = dispatch_queue_create(__str, 0);
  *(_QWORD *)v6 = _Block_copy(a3);
  v7 = xpc_array_create(0, 0);
  *(_QWORD *)(v6 + 40) = v7;
  *(_DWORD *)(v6 + 32) = a2;
  *(_DWORD *)(v6 + 64) = 0;
  if (a1 == -1)
  {
    *(_BYTE *)(v6 + 84) = 1;
  }
  else if (a1 >= 1)
  {
    xpc_array_set_int64(v7, 0xFFFFFFFFFFFFFFFFLL, a1);
  }
  return v6;
}

void os_activity_stream_add_pid(uint64_t a1, int a2)
{
  xpc_object_t v4;

  if (!*(_BYTE *)(a1 + 84))
  {
    v4 = *(xpc_object_t *)(a1 + 40);
    if (!v4)
    {
      v4 = xpc_array_create(0, 0);
      *(_QWORD *)(a1 + 40) = v4;
    }
    xpc_array_set_int64(v4, 0xFFFFFFFFFFFFFFFFLL, a2);
  }
}

uint64_t os_activity_stream_for_uid(unsigned int a1, int a2, const void *a3)
{
  uint64_t v6;
  xpc_object_t v7;
  char __str[64];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = _os_trace_calloc();
  snprintf(__str, 0x40uLL, "com.apple.activity.stream.%d", a1);
  *(_QWORD *)(v6 + 24) = dispatch_queue_create(__str, 0);
  *(_QWORD *)v6 = _Block_copy(a3);
  v7 = xpc_array_create(0, 0);
  *(_QWORD *)(v6 + 48) = v7;
  *(_DWORD *)(v6 + 32) = a2;
  *(_DWORD *)(v6 + 64) = 0;
  xpc_array_set_int64(v7, 0xFFFFFFFFFFFFFFFFLL, a1);
  return v6;
}

void os_activity_stream_add_uid(uint64_t a1, int64_t value)
{
  unsigned int v2;
  xpc_object_t v4;

  v2 = value;
  v4 = *(xpc_object_t *)(a1 + 48);
  if (!v4)
  {
    v4 = xpc_array_create(0, 0);
    *(_QWORD *)(a1 + 48) = v4;
  }
  xpc_array_set_int64(v4, 0xFFFFFFFFFFFFFFFFLL, v2);
}

void *os_activity_stream_set_event_handler(uint64_t a1, void *aBlock)
{
  void *result;

  result = _Block_copy(aBlock);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t os_activity_stream_set_filter(uint64_t result, int a2)
{
  *(_DWORD *)(result + 64) |= a2;
  return result;
}

void os_activity_stream_resume(uint64_t a1)
{
  _os_activity_stream_resume_with_filter(a1, 0, 0);
}

void _os_activity_stream_resume_with_filter(uint64_t a1, const void *a2, size_t a3)
{
  _xpc_connection_s *mach_service;
  uint64_t v7;
  xpc_object_t v8;
  const char *v9;
  void *v10;
  id v11;
  id v12;
  _OSLogStreamFilter *v13;
  _OSLogStreamFilter *v14;
  _OSLogStreamFilter *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _OSLogStreamFilter *v21;
  _OSLogStreamFilter *v22;
  void *v23;
  id v24;
  _OSLogStreamFilter *v25;
  _OSLogStreamFilter *v26;
  void *v27;
  _xpc_connection_s *v28;
  NSObject *global_queue;
  _QWORD v30[5];
  _QWORD handler[5];
  _QWORD v32[4];
  _OSLogStreamFilter *v33;
  uint64_t applier;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, int, xpc_object_t);
  void *v37;
  _OSLogStreamFilter *v38;

  mach_service = xpc_connection_create_mach_service("com.apple.diagnosticd", *(dispatch_queue_t *)(a1 + 24), 2uLL);
  v7 = MEMORY[0x1E0C809B0];
  *(_QWORD *)(a1 + 16) = mach_service;
  handler[0] = v7;
  handler[1] = 0x40000000;
  handler[2] = ___os_activity_stream_resume_with_filter_block_invoke;
  handler[3] = &__block_descriptor_tmp_37;
  handler[4] = a1;
  xpc_connection_set_event_handler(mach_service, handler);
  xpc_retain(*(xpc_object_t *)(a1 + 16));
  xpc_connection_set_context(*(xpc_connection_t *)(a1 + 16), (void *)a1);
  xpc_connection_set_finalizer_f(*(xpc_connection_t *)(a1 + 16), (xpc_finalizer_t)_os_activity_stream_dealloc);
  xpc_connection_activate(*(xpc_connection_t *)(a1 + 16));
  if (!*(_DWORD *)(a1 + 64))
    *(_DWORD *)(a1 + 64) = 7;
  v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v8, "action", 3uLL);
  xpc_dictionary_set_uint64(v8, "flags", *(unsigned int *)(a1 + 32));
  xpc_dictionary_set_uint64(v8, "types", *(unsigned int *)(a1 + 64));
  v9 = *(const char **)(a1 + 72);
  if (v9)
    xpc_dictionary_set_string(v8, "simulator_device", v9);
  if (xpc_array_get_count(*(xpc_object_t *)(a1 + 40)) && xpc_array_get_count(*(xpc_object_t *)(a1 + 48)))
  {
    if (a2)
    {
      _os_assert_log();
      _os_crash();
      __break(1u);
    }
    else if (!*(_BYTE *)(a1 + 84))
    {
      v10 = *(void **)(a1 + 48);
      v11 = *(id *)(a1 + 40);
      v12 = v10;
      if (xpc_array_get_count(v11))
      {
        if (xpc_array_get_count(v12))
        {
          v13 = -[_OSLogStreamFilter initWithPredicate:]([_OSLogStreamFilter alloc], "initWithPredicate:", 0);
          applier = v7;
          v35 = 3221225472;
          v36 = ___OSLogStreamFilterBytesForPIDAndUIDArray_block_invoke;
          v37 = &unk_1E4157680;
          v14 = v13;
          v38 = v14;
          xpc_array_apply(v11, &applier);
          v32[0] = v7;
          v32[1] = 3221225472;
          v32[2] = ___OSLogStreamFilterBytesForPIDAndUIDArray_block_invoke_2;
          v32[3] = &unk_1E4157680;
          v33 = v14;
          v15 = v14;
          xpc_array_apply(v12, v32);
          -[_OSLogStreamFilter data](v15, "data");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "length");
          v17 = (void *)_os_trace_malloc();
          objc_msgSend(v16, "getBytes:length:", v17, objc_msgSend(v16, "length"));
          a3 = objc_msgSend(v16, "length");

          v18 = 0;
          v19 = 0;
          a2 = v17;
          if (!v17)
            goto LABEL_26;
          goto LABEL_24;
        }
        goto LABEL_34;
      }
LABEL_33:
      _os_assert_log();
      _os_crash();
      __break(1u);
LABEL_34:
      _os_assert_log();
      _os_crash();
      __break(1u);
LABEL_35:
      _os_assert_log();
      _os_crash();
      __break(1u);
      goto LABEL_36;
    }
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_33;
  }
  if (!xpc_array_get_count(*(xpc_object_t *)(a1 + 40)))
  {
    if (xpc_array_get_count(*(xpc_object_t *)(a1 + 48)))
    {
      if (a2)
      {
LABEL_39:
        _os_assert_log();
        _os_crash();
        __break(1u);
        goto LABEL_40;
      }
      if (*(_BYTE *)(a1 + 84))
      {
LABEL_40:
        _os_assert_log();
        _os_crash();
        __break(1u);
        goto LABEL_41;
      }
      v24 = *(id *)(a1 + 48);
      if (!xpc_array_get_count(v24))
      {
LABEL_41:
        _os_assert_log();
        _os_crash();
        __break(1u);
        return;
      }
      v25 = -[_OSLogStreamFilter initWithPredicate:]([_OSLogStreamFilter alloc], "initWithPredicate:", 0);
      applier = v7;
      v35 = 3221225472;
      v36 = ___OSLogStreamFilterBytesForUIDArray_block_invoke;
      v37 = &unk_1E4157680;
      v38 = v25;
      v26 = v25;
      xpc_array_apply(v24, &applier);
      -[_OSLogStreamFilter data](v26, "data");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "length");
      v18 = (void *)_os_trace_malloc();
      objc_msgSend(v27, "getBytes:length:", v18, objc_msgSend(v27, "length"));
      a3 = objc_msgSend(v27, "length");

      v17 = 0;
      v19 = 0;
      a2 = v18;
      if (!v18)
        goto LABEL_26;
    }
    else
    {
      v17 = 0;
      v18 = 0;
      v19 = 0;
      if (!a2)
        goto LABEL_26;
    }
    goto LABEL_24;
  }
  if (a2)
    goto LABEL_35;
  if (*(_BYTE *)(a1 + 84))
  {
LABEL_36:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_37;
  }
  v20 = *(id *)(a1 + 40);
  if (!xpc_array_get_count(v20))
  {
LABEL_37:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_38:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_39;
  }
  v21 = -[_OSLogStreamFilter initWithPredicate:]([_OSLogStreamFilter alloc], "initWithPredicate:", 0);
  applier = v7;
  v35 = 3221225472;
  v36 = ___OSLogStreamFilterBytesForPIDArray_block_invoke;
  v37 = &unk_1E4157680;
  v38 = v21;
  v22 = v21;
  xpc_array_apply(v20, &applier);
  -[_OSLogStreamFilter data](v22, "data");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "length");
  v19 = (void *)_os_trace_malloc();
  objc_msgSend(v23, "getBytes:length:", v19, objc_msgSend(v23, "length"));
  a3 = objc_msgSend(v23, "length");

  v17 = 0;
  v18 = 0;
  a2 = v19;
  if (!v19)
  {
LABEL_26:
    if (*(_BYTE *)(a1 + 84))
      goto LABEL_27;
    goto LABEL_38;
  }
LABEL_24:
  xpc_dictionary_set_data(v8, "stream_filter", a2, a3);
LABEL_27:
  free(v19);
  free(v18);
  free(v17);
  v28 = *(_xpc_connection_s **)(a1 + 16);
  if (*(_QWORD *)(a1 + 8))
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v30[0] = v7;
    v30[1] = 0x40000000;
    v30[2] = ___os_activity_stream_resume_with_filter_block_invoke_2;
    v30[3] = &__block_descriptor_tmp_43;
    v30[4] = a1;
    xpc_connection_send_message_with_reply(v28, v8, global_queue, v30);
  }
  else
  {
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v8);
  }
  xpc_release(v8);
}

void ___os_activity_stream_resume_with_filter_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD v8[15];

  memset(v8, 0, sizeof(v8));
  v4 = MEMORY[0x1A1AECA14](a2);
  if (v4 == MEMORY[0x1E0C812F8])
  {
    if (xpc_dictionary_get_value(a2, "action")
      && !_os_activity_stream_entry_decode(a2, (int *)v8)
      && ((*(uint64_t (**)(void))(**(_QWORD **)(a1 + 32) + 16))() & 1) == 0)
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)(v6 + 80) = 89;
      xpc_connection_cancel(*(xpc_connection_t *)(v6 + 16));
    }
  }
  else if (v4 == MEMORY[0x1E0C81310])
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (a2 == (void *)MEMORY[0x1E0C81260])
    {
      v7 = *(_QWORD *)(v5 + 8);
      if (v7)
        (*(void (**)(void))(v7 + 16))();
      else
        (*(void (**)(void))(*(_QWORD *)v5 + 16))();
      xpc_release(*(xpc_object_t *)(*(_QWORD *)(a1 + 32) + 16));
    }
    else
    {
      *(_DWORD *)(v5 + 80) = 5;
      xpc_connection_cancel(*(xpc_connection_t *)(v5 + 16));
    }
  }
}

void _os_activity_stream_dealloc(const void **a1)
{
  NSObject *v2;
  const void *v3;
  void *v4;
  void *v5;

  v2 = a1[3];
  if (v2)
  {
    dispatch_release(v2);
    a1[3] = 0;
  }
  if (*a1)
  {
    _Block_release(*a1);
    *a1 = 0;
  }
  v3 = a1[1];
  if (v3)
  {
    _Block_release(v3);
    a1[1] = 0;
  }
  v4 = (void *)a1[5];
  if (v4)
  {
    xpc_release(v4);
    a1[5] = 0;
  }
  v5 = (void *)a1[6];
  if (v5)
    xpc_release(v5);
  free(a1);
}

void ___os_activity_stream_resume_with_filter_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  xpc_object_t value;
  uint64_t v6;
  _xpc_connection_s *v7;
  uint64_t v8;

  v4 = MEMORY[0x1A1AECA14](a2);
  if (v4 == MEMORY[0x1E0C812F8])
  {
    value = xpc_dictionary_get_value(a2, "error");
    v6 = *(_QWORD *)(a1 + 32);
    if (!value)
    {
      (*(void (**)(void))(*(_QWORD *)(v6 + 8) + 16))();
      return;
    }
    *(_DWORD *)(v6 + 80) = 1;
    v7 = *(_xpc_connection_s **)(v6 + 16);
LABEL_7:
    xpc_connection_cancel(v7);
    return;
  }
  if (v4 == MEMORY[0x1E0C81310])
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)(v8 + 80) = 5;
    v7 = *(_xpc_connection_s **)(v8 + 16);
    goto LABEL_7;
  }
}

void os_activity_stream_cancel(uint64_t a1)
{
  *(_DWORD *)(a1 + 80) = 89;
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 16));
  xpc_release(*(xpc_object_t *)(a1 + 16));
}

uint64_t _LevelForKey(void *a1, uint64_t a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "objectForKey:", a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if (!objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("default")))
    {
      v4 = 2;
      goto LABEL_12;
    }
    if (!objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("info")))
    {
      v4 = 3;
      goto LABEL_12;
    }
    if (!objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("debug")))
    {
      v4 = 4;
      goto LABEL_12;
    }
    if (!objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("off"))
      || !objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("none")))
    {
      v4 = 0;
      goto LABEL_12;
    }
  }
  v4 = 1;
LABEL_12:

  return v4;
}

id OSLogPreferencesList(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", _os_trace_app_cryptex_sysprefsdir_path());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  OSLogPreferencesListDirectory(v4, v2);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", _os_trace_os_cryptex_sysprefsdir_path());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  OSLogPreferencesListDirectory(v6, v2);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", _os_trace_sysprefsdir_path());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  OSLogPreferencesListDirectory(v8, v2);
  if (_os_trace_is_development_build())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", _os_trace_intprefsdir_path());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathComponent:", v1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    OSLogPreferencesListDirectory(v10, v2);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", _os_trace_prefsdir_path());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", v1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  OSLogPreferencesListDirectory(v12, v2);
  return v2;
}

void OSLogPreferencesListDirectory(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CB3620];
  v5 = a1;
  objc_msgSend(v4, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v5, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __OSLogPreferencesListDirectory_block_invoke;
  v9[3] = &unk_1E4157C98;
  v10 = v3;
  v7 = v3;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);

}

BOOL OSLogValidateProfilePayload(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v1 = a1;
  objc_msgSend(v1, "objectForKey:", CFSTR("Processes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v1, "objectForKey:", CFSTR("Subsystems"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(v1, "objectForKey:", CFSTR("System"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 1;
      if (v4)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          v5 = 0;
      }

    }
  }

  return v5;
}

BOOL OSLogInstallProfilePayload(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  _BOOL8 v9;
  _QWORD v11[5];
  _QWORD v12[5];
  __int128 buf;
  uint64_t v14;
  char v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (os_log_type_enabled(MEMORY[0x1E0C81030], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v1;
    _os_log_impl(&dword_19EA26000, MEMORY[0x1E0C81030], OS_LOG_TYPE_DEFAULT, "Profile installation requested with dictionary: %{public}@", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v14 = 0x2020000000;
  v15 = 1;
  objc_msgSend(v1, "objectForKey:", CFSTR("Processes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __OSLogInstallProfilePayload_block_invoke;
  v12[3] = &unk_1E4157B28;
  v12[4] = &buf;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v12);
  if (!*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    goto LABEL_8;
  objc_msgSend(v1, "objectForKey:", CFSTR("Subsystems"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __OSLogInstallProfilePayload_block_invoke_2;
  v11[3] = &unk_1E4157B28;
  v11[4] = &buf;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v11);

  if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
  {
    objc_msgSend(v1, "objectForKey:", CFSTR("System"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("Enable-Logging"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 == 0;

    if (v8)
      objc_msgSend(v6, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("Enable-Logging"));
    objc_msgSend(v6, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("Locked"));
    _OSLogInstallPreferences(1u, CFSTR("com.apple.system.logging"), (uint64_t)v6);

    v9 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;
  }
  else
  {
LABEL_8:
    v9 = 0;
  }

  _Block_object_dispose(&buf, 8);
  return v9;
}

void sub_19EA62D90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t OSLogRemoveProfilePayload(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (os_log_type_enabled(MEMORY[0x1E0C81030], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v1;
    _os_log_impl(&dword_19EA26000, MEMORY[0x1E0C81030], OS_LOG_TYPE_DEFAULT, "Profile removal requested with dictionary: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  objc_msgSend(v1, "objectForKey:", CFSTR("Processes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_2504);
  objc_msgSend(v1, "objectForKey:", CFSTR("Subsystems"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_11_2505);
  objc_msgSend(v1, "objectForKey:", CFSTR("System"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    _OSLogRemovePreferences(1u, CFSTR("com.apple.system.logging"));

  return 1;
}

void observation_callback(uint64_t a1, uint64_t a2)
{
  const void *v3;
  const __CFString *v5;
  const __CFString *v6;
  int v7;
  int v8;
  int v9;
  const void *v10;
  int v11;
  int v13;
  int v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  int v18;
  int v19;
  char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const void *v24;
  char buffer[56];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  strcpy(buffer, "0000000000000000000000000000000000000000");
  buffer[41] = unk_19EA7F1E8;
  if (!a1 || (v3 = *(const void **)a1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Invalid inputs", (uint8_t *)&v19, 2u);
    }
    v6 = 0;
    v3 = 0;
    goto LABEL_15;
  }
  v5 = (const __CFString *)(*(uint64_t (**)(_QWORD))(mobdevtab + 128))(*(_QWORD *)a1);
  v6 = v5;
  if (v5)
    CFStringGetCString(v5, buffer, 42, 0x8000100u);
  v7 = *(_DWORD *)(a1 + 8);
  if (v7 == 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v19 = 136315138;
      v20 = buffer;
      _os_log_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "device disconnected (%s)\n", (uint8_t *)&v19, 0xCu);
    }
    (*(void (**)(uint64_t, char *, const void *, _QWORD))a2)(1, buffer, v3, *(_QWORD *)(a2 + 8));
  }
  else if (v7 == 1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v19 = 136315138;
      v20 = buffer;
      _os_log_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "device connected (%s)\n", (uint8_t *)&v19, 0xCu);
    }
    v8 = (*(uint64_t (**)(const void *))(mobdevtab + 32))(v3);
    if (v8)
    {
      v9 = v8;
      v10 = (const void *)(*(uint64_t (**)(void))(mobdevtab + 136))();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v19 = 136315650;
        v20 = buffer;
        v21 = 1024;
        v22 = v9;
        v23 = 2112;
        v24 = v10;
        _os_log_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "(%s) AMDeviceConnect failed with %08x (%@)\n", (uint8_t *)&v19, 0x1Cu);
      }
LABEL_16:
      (*(void (**)(const void *))(mobdevtab + 64))(v3);
      if (v3)
        CFRelease(v3);
      if (v6)
        goto LABEL_19;
      goto LABEL_20;
    }
    v11 = (*(uint64_t (**)(const void *))(mobdevtab + 40))(v3);
    if (v11 != -402653155 && v11 != 0)
    {
      v13 = (*(uint64_t (**)(const void *))(mobdevtab + 120))(v3);
      if (v13)
      {
        v14 = v13;
        v10 = (const void *)(*(uint64_t (**)(void))(mobdevtab + 136))();
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
LABEL_38:
          (*(void (**)(uint64_t, char *, const void *, _QWORD))a2)(2, buffer, v3, *(_QWORD *)(a2 + 8));
          goto LABEL_16;
        }
        v19 = 136315650;
        v20 = buffer;
        v21 = 1024;
        v22 = v14;
        v23 = 2112;
        v24 = v10;
        v15 = MEMORY[0x1E0C81028];
        v16 = "(%s) AMDevicePair failed with %08x (%@)\n";
LABEL_37:
        _os_log_impl(&dword_19EA26000, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v19, 0x1Cu);
        goto LABEL_38;
      }
      v17 = (*(uint64_t (**)(const void *))(mobdevtab + 40))(v3);
      if ((_DWORD)v17 != -402653155)
      {
        v18 = v17;
        if ((_DWORD)v17)
        {
          v10 = (const void *)(*(uint64_t (**)(uint64_t))(mobdevtab + 136))(v17);
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            goto LABEL_38;
          v19 = 136315650;
          v20 = buffer;
          v21 = 1024;
          v22 = v18;
          v23 = 2112;
          v24 = v10;
          v15 = MEMORY[0x1E0C81028];
          v16 = "(%s) AMDeviceStartSession failed with %08x (%@)\n";
          goto LABEL_37;
        }
      }
    }
    (*(void (**)(_QWORD, char *, const void *, _QWORD))a2)(0, buffer, v3, *(_QWORD *)(a2 + 8));
LABEL_15:
    v10 = 0;
    goto LABEL_16;
  }
  v10 = 0;
  if (v6)
LABEL_19:
    CFRelease(v6);
LABEL_20:
  if (v10)
    CFRelease(v10);
}

void *___logdev_mobdev_vtable_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/MobileDevice.framework/MobileDevice", 1);
  _logdev_mobdev_vtable_vtab = (uint64_t)result;
  if (result)
  {
    result = dlsym(result, "AMDServiceConnectionReceive");
    qword_1EE52EBD8 = (uint64_t)result;
    if (result)
    {
      result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDServiceConnectionReceiveMessage");
      qword_1EE52EBE0 = (uint64_t)result;
      if (result)
      {
        result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDeviceCreateCopy");
        qword_1EE52EBE8 = (uint64_t)result;
        if (result)
        {
          result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDeviceConnect");
          qword_1EE52EBF0 = (uint64_t)result;
          if (result)
          {
            result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDeviceStartSession");
            qword_1EE52EBF8 = (uint64_t)result;
            if (result)
            {
              result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDeviceSecureStartService");
              qword_1EE52EC00 = (uint64_t)result;
              if (result)
              {
                result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDeviceStopSession");
                qword_1EE52EC08 = (uint64_t)result;
                if (result)
                {
                  result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDeviceDisconnect");
                  qword_1EE52EC10 = (uint64_t)result;
                  if (result)
                  {
                    result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDServiceConnectionSendMessage");
                    qword_1EE52EC18 = (uint64_t)result;
                    if (result)
                    {
                      result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDServiceConnectionGetSocket");
                      qword_1EE52EC20 = (uint64_t)result;
                      if (result)
                      {
                        result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDServiceConnectionInvalidate");
                        qword_1EE52EC28 = (uint64_t)result;
                        if (result)
                        {
                          result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDeviceCopyValue");
                          off_1EE52EC30 = (uint64_t (*)(void))result;
                          if (result)
                          {
                            result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDeviceNotificationSubscribeWithOptions");
                            qword_1EE52EC38 = (uint64_t)result;
                            if (result)
                            {
                              result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDeviceNotificationUnsubscribe");
                              off_1EE52EC40 = (uint64_t (*)(_QWORD))result;
                              if (result)
                              {
                                result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDevicePair");
                                qword_1EE52EC48 = (uint64_t)result;
                                if (result)
                                {
                                  result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDeviceCopyDeviceIdentifier");
                                  qword_1EE52EC50 = (uint64_t)result;
                                  if (result)
                                  {
                                    result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDCopyErrorText");
                                    qword_1EE52EC58 = (uint64_t)result;
                                    if (result)
                                    {
                                      result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDeviceGetInterfaceType");
                                      qword_1EE52EC60 = (uint64_t)result;
                                      if (result)
                                        _logdev_mobdev_vtable_valid = 1;
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void __logdev_stream_events_block_invoke(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  int v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  _DWORD v22[2];
  uint64_t v23;
  __int128 v24;
  _OWORD v25[3];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _OWORD v30[3];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v32 = 0u;
    v33 = 0u;
    v31 = 0u;
    memset(v30, 0, sizeof(v30));
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    memset(v25, 0, sizeof(v25));
    v4 = *(_DWORD *)(a2 + 1);
    if (v4 > 15)
    {
      switch(v4)
      {
        case 16:
          v5 = 515;
          goto LABEL_20;
        case 32:
          v5 = 514;
          goto LABEL_20;
        case 64:
          v5 = 1152;
          goto LABEL_20;
      }
    }
    else
    {
      switch(v4)
      {
        case 2:
          v5 = 513;
          goto LABEL_20;
        case 4:
          v5 = 768;
          goto LABEL_20;
        case 8:
          v5 = 1024;
          goto LABEL_20;
      }
    }
    v5 = 0;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v35 = v4;
      _os_log_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unknown os_activity_stream_type %u\n", buf, 8u);
      v5 = 0;
    }
LABEL_20:
    v6 = *(_DWORD *)(a2 + 9);
    v22[0] = v5;
    v22[1] = v6;
    v7 = *(_QWORD *)(a2 + 13);
    *(_OWORD *)((char *)v25 + 8) = *(_OWORD *)(a2 + 39);
    v23 = v7;
    *((_QWORD *)&v24 + 1) = a2 + 21;
    v8 = *(unsigned __int16 *)(a2 + 37);
    if (*(_WORD *)(a2 + 37))
      v9 = (const char *)(a2 + *(unsigned int *)(a2 + 5) + 8 * *(unsigned int *)(a2 + 125));
    else
      v9 = "<missing path>";
    *(_QWORD *)&v25[0] = v9;
    *(_OWORD *)((char *)&v25[1] + 8) = *(_OWORD *)(a2 + 67);
    *((_QWORD *)&v25[2] + 1) = *(_QWORD *)(a2 + 83);
    *(_QWORD *)&v26 = a2 + 91;
    v10 = *(unsigned __int16 *)(a2 + 107);
    if (*(_WORD *)(a2 + 107))
      v11 = (const char *)(a2 + *(unsigned int *)(a2 + 5) + 8 * *(unsigned int *)(a2 + 125) + v8);
    else
      v11 = "<missing path>";
    *((_QWORD *)&v26 + 1) = v11;
    v12 = *(_DWORD *)(a2 + 1);
    if (v12 > 7)
    {
      switch(v12)
      {
        case 8:
          goto LABEL_30;
        case 16:
          if (*(_WORD *)(a2 + 109))
            v16 = (const char *)(a2 + *(unsigned int *)(a2 + 5) + 8 * *(unsigned int *)(a2 + 125) + v8 + v10);
          else
            v16 = "<missing name>";
          v21 = *(unsigned int *)(a2 + 111);
          *(_QWORD *)&v30[0] = v16;
          *((_QWORD *)&v28 + 1) = v21;
          *(_QWORD *)&v27 = *(_QWORD *)(a2 + 55);
          DWORD2(v27) = *(_DWORD *)(a2 + 63);
          BYTE8(v30[0]) = 0;
          goto LABEL_60;
        case 64:
LABEL_30:
          v13 = *(unsigned int *)(a2 + 109);
          if ((_DWORD)v13)
            v14 = (const char *)(a2 + *(unsigned int *)(a2 + 5) + 8 * *(unsigned int *)(a2 + 125) + v8 + v10);
          else
            v14 = "<missing format data>";
          *(_QWORD *)&v30[0] = v14;
          memset((char *)v30 + 8, 0, 32);
          if (v12 == 8)
          {
            if (*(_DWORD *)(a2 + 121))
            {
              v17 = *(unsigned int *)(a2 + 117);
              v18 = a2 + *(unsigned int *)(a2 + 5) + 8 * *(unsigned int *)(a2 + 125) + v8 + v10 + v13 + v17;
            }
            else
            {
              v18 = 0;
              LODWORD(v17) = *(_DWORD *)(a2 + 117);
            }
            *(_QWORD *)&v31 = v18;
            if ((_DWORD)v17)
              v19 = (const char *)(a2 + *(unsigned int *)(a2 + 5) + 8 * *(unsigned int *)(a2 + 125) + v8 + v10 + v13);
            else
              v19 = 0;
          }
          else
          {
            v19 = "<missing buffer data>";
            *(_QWORD *)&v31 = "<missing buffer data>";
          }
          *((_QWORD *)&v30[2] + 1) = v19;
          *((_QWORD *)&v28 + 1) = 0;
          WORD6(v31) = 0;
          goto LABEL_59;
      }
LABEL_40:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v35 = v12;
        _os_log_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unknown message type %x\n", buf, 8u);
      }
      goto LABEL_60;
    }
    if (v12 == 2)
    {
      if (*(_WORD *)(a2 + 109))
        v15 = (const char *)(a2 + *(unsigned int *)(a2 + 5) + 8 * *(unsigned int *)(a2 + 125) + v8 + v10);
      else
        v15 = "<missing name>";
      *((_QWORD *)&v30[0] + 1) = *(_QWORD *)(a2 + 111);
      v20 = *(unsigned int *)(a2 + 119);
    }
    else
    {
      if (v12 != 4)
        goto LABEL_40;
      if (*(_DWORD *)(a2 + 109))
        v15 = (const char *)(a2 + *(unsigned int *)(a2 + 5) + 8 * *(unsigned int *)(a2 + 125) + v8 + v10);
      else
        v15 = "<missing buffer data>";
      memset((char *)v30 + 8, 0, 24);
      v20 = *(unsigned int *)(a2 + 117);
    }
    *(_QWORD *)&v30[0] = v15;
    *((_QWORD *)&v28 + 1) = v20;
LABEL_59:
    *(_QWORD *)&v27 = *(_QWORD *)(a2 + 55);
    DWORD2(v27) = *(_DWORD *)(a2 + 63);
LABEL_60:
    if (v5 > 767 || v5 == 513 || v5 == 515)
      (*(void (**)(_DWORD *, _QWORD))(a1 + 32))(v22, *(_QWORD *)(a1 + 40));
    return;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v22[0]) = 0;
    _os_log_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Got NULL OTRCancelAndFreeActivityStream\n", (uint8_t *)v22, 2u);
  }
  (*(void (**)(_QWORD, _QWORD))(a1 + 32))(0, *(_QWORD *)(a1 + 40));
}

uint64_t _CopyOTRServiceConnectionForDevice(uint64_t a1, CFTypeRef *a2, const __CFString *a3)
{
  uint64_t v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;
  const void *v9;
  uint64_t v10;
  uint64_t v12;
  const char *CStringPtr;
  CFTypeRef cf;
  uint8_t buf[4];
  _BYTE v18[14];
  __int16 v19;
  const void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  cf = 0;
  *a2 = 0;
  v5 = (*(uint64_t (**)(void))(mobdevtab + 24))();
  if (v5)
  {
    v6 = (const void *)v5;
    v7 = (*(uint64_t (**)(void))(mobdevtab + 32))();
    if ((_DWORD)v7)
    {
      v8 = v7;
      v9 = (const void *)(*(uint64_t (**)(void))(mobdevtab + 136))();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v18 = v8;
        *(_WORD *)&v18[4] = 2112;
        *(_QWORD *)&v18[6] = v9;
        _os_log_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "AMDeviceConnect failed: 0x%08x (%@)", buf, 0x12u);
      }
    }
    else
    {
      v10 = (*(uint64_t (**)(const void *))(mobdevtab + 40))(v6);
      if ((_DWORD)v10 == -402653155 || (_DWORD)v10 == 0)
      {
        v12 = (*(uint64_t (**)(const void *, const __CFString *, _QWORD, CFTypeRef *))(mobdevtab + 48))(v6, a3, 0, &cf);
        v8 = v12;
        if ((_DWORD)v12)
        {
          v9 = (const void *)(*(uint64_t (**)(uint64_t))(mobdevtab + 136))(v12);
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            CStringPtr = CFStringGetCStringPtr(a3, 0x8000100u);
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)v18 = CStringPtr;
            *(_WORD *)&v18[8] = 1024;
            *(_DWORD *)&v18[10] = v8;
            v19 = 2112;
            v20 = v9;
            _os_log_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to start service %s: 0x%08x (%@)", buf, 0x1Cu);
          }
          if (cf)
            CFRelease(cf);
          cf = 0;
        }
        else
        {
          v9 = 0;
          *a2 = cf;
        }
      }
      else
      {
        v8 = v10;
        v9 = (const void *)(*(uint64_t (**)(void))(mobdevtab + 136))();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v18 = v8;
          *(_WORD *)&v18[4] = 2112;
          *(_QWORD *)&v18[6] = v9;
          _os_log_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "AMDeviceStartSession failed: 0x%08x (%@)", buf, 0x12u);
        }
      }
      (*(void (**)(const void *))(mobdevtab + 64))(v6);
    }
    CFRelease(v6);
    if (v9)
      CFRelease(v9);
  }
  else
  {
    v8 = 3892314119;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "AMDeviceCreateCopy failed", buf, 2u);
    }
  }
  return v8;
}

void __logdev_stream_events_block_invoke_2(uint64_t a1)
{
  uint8_t v2[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_19EA26000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Canceling stream\n", v2, 2u);
  }
  OTRCancelAndFreeActivityStream(*(_QWORD *)(a1 + 32));
}

void OTRCancelAndFreeActivityStream(uint64_t a1)
{
  NSObject *global_queue;
  _QWORD block[5];

  if (a1)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 8));
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 16));
    global_queue = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 0x40000000;
    block[2] = __OTRCancelAndFreeActivityStream_block_invoke;
    block[3] = &__block_descriptor_tmp_56_2550;
    block[4] = a1;
    dispatch_async(global_queue, block);
  }
}

void sub_19EA64D5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EA65588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _dataForUUID(void *a1)
{
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v2[0] = 0;
  v2[1] = 0;
  objc_msgSend(a1, "getUUIDBytes:", v2);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v2, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

id _dictForTimeval(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("sec");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", *(_QWORD *)a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("usec");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 8));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id _dictForTimezone(unsigned int *a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("mw");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("dt");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1[1]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id _dictArrayForBacktrace(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[2];
  _QWORD v20[2];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v13 = v1;
  objc_msgSend(v1, "frames");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v6);
        v19[0] = CFSTR("iu");
        objc_msgSend(v7, "imageUUID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        _dataForUUID(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v19[1] = CFSTR("io");
        v20[0] = v9;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v7, "imageOffset"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v20[1] = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v2, "addObject:", v11);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v4);
  }

  return v2;
}

id _dictForLossCount(unint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("c");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("s");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", HIDWORD(a1) & 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_19EA67F08(void *a1)
{
  void *v1;

  objc_begin_catch(a1);
  objc_msgSend(v1, "invalidate");
  objc_msgSend(v1, "_runInvalidationHandler:", 8);
  objc_end_catch();
  JUMPOUT(0x19EA67EE0);
}

void sub_19EA67F28(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

uint64_t _repack_compact_add_iov(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  int v4;
  unsigned int v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v3 = result;
  v4 = *(_DWORD *)(result + 104);
  if (v4 == *(_DWORD *)(result + 108))
  {
    v5 = 2 * v4;
    if (v5 <= 0x10)
      v5 = 16;
    *(_DWORD *)(result + 108) = v5;
    result = _os_trace_realloc();
    *(_QWORD *)(v3 + 96) = result;
  }
  if (a2)
  {
    v6 = *(_QWORD *)(a2 + 8);
    v7 = (v6 & 0xFFFFFFFFFFFFFFF8) + 24;
    v8 = v6 + 16;
    if ((*(_QWORD *)(a2 + 8) & 7) != 0)
      v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  v9 = *(_QWORD *)(v3 + 96);
  v10 = *(unsigned int *)(v3 + 104);
  *(_DWORD *)(v3 + 104) = v10 + 1;
  v11 = (_QWORD *)(v9 + 16 * v10);
  *v11 = a2;
  v11[1] = v8;
  *(_DWORD *)(v3 + 112) += v8;
  return result;
}

void _repack_context_cleanup(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;

  if (*(_DWORD *)(a1 + 104) >= 2u)
  {
    v2 = 1;
    v3 = 16;
    do
    {
      free(*(void **)(*(_QWORD *)(a1 + 96) + v3));
      ++v2;
      v3 += 16;
    }
    while (v2 < *(unsigned int *)(a1 + 104));
  }
  free(*(void **)(a1 + 96));
  free(*(void **)(a1 + 120));
}

uint64_t _repack_ttl_compact_close_catalog(uint64_t a1, _QWORD *a2)
{
  int v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  void **v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  BOOL v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  int v34;
  unint64_t v35;
  unint64_t v36;
  BOOL v37;
  unint64_t v38;
  unint64_t v39;
  _BOOL4 v40;
  _QWORD *v41;
  _QWORD *v42;
  char *v43;
  char *v44;
  _QWORD *v45;
  uint64_t v46;
  _QWORD *v47;
  char *v48;
  char *v49;
  int64_t v50;
  uint64_t v51;
  uint64_t v52;
  size_t v53;
  char *v54;
  uint64_t v55;
  _WORD *v56;
  __int16 v57;
  _QWORD *v58;
  void *v59;
  int v60;
  char *v61;
  unsigned int *v62;
  uint64_t v63;
  unsigned int *v64;
  size_t v65;
  unint64_t v66;
  _QWORD *v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  _QWORD *v72;
  uint64_t result;
  int *v74;
  id v75;
  char *v76;
  _QWORD v77[2];
  void (*v78)(uint64_t, uint64_t);
  void *v79;
  uint64_t v80;
  _QWORD v81[2];
  void (*v82)(uint64_t, uint64_t);
  void *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void **v90;
  void **v91;
  char *v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(a1 + 128))
    _repack_ttl_compact_flush_chunkset();
  v4 = *(_DWORD *)(a1 + 116);
  if (v4 + 1 == *(_DWORD *)(a1 + 104))
    goto LABEL_86;
  v5 = *(_QWORD *)(a1 + 80);
  if (*(_QWORD *)(v5 + 80))
    v6 = **(_QWORD ***)(*(_QWORD *)(v5 + 72) + 8);
  else
    v6 = _catalog_subchunk_entry_alloc(v5);
  v8 = v6[2];
  v7 = v6[3];
  if (v8 < *(_QWORD *)(a1 + 8))
    *(_QWORD *)(a1 + 8) = v8;
  if (v7 > *(_QWORD *)(a1 + 16))
    *(_QWORD *)(a1 + 16) = v7;
  v9 = *(void ***)(a1 + 80);
  v10 = MEMORY[0x1E0C809B0];
  if (*(_BYTE *)(*(_QWORD *)(a1 + 192) + 24))
  {
    v11 = v9[2];
    v81[0] = MEMORY[0x1E0C809B0];
    v81[1] = 3221225472;
    v82 = ___repack_ttl_compact_close_catalog_block_invoke;
    v83 = &__block_descriptor_40_e16_v24__0_16C_8_v16l;
    v84 = a1;
    v12 = (_QWORD *)v11[2];
    if (v12)
    {
      do
      {
        ((void (*)(_QWORD *, _QWORD *, _QWORD))v82)(v81, v12 + 2, v12[4]);
        v12 = (_QWORD *)*v12;
      }
      while (v12);
      v9 = *(void ***)(a1 + 80);
    }
    v13 = v9[5];
    v77[0] = v10;
    v77[1] = 3221225472;
    v78 = ___repack_ttl_compact_close_catalog_block_invoke_2;
    v79 = &__block_descriptor_40_e9_v16__0_v8l;
    v80 = a1;
    if (v13)
    {
      v14 = (_QWORD *)v13[2];
      if (v14)
      {
        do
        {
          v78((uint64_t)v77, v14[4]);
          v14 = (_QWORD *)*v14;
        }
        while (v14);
        v9 = *(void ***)(a1 + 80);
      }
    }
  }
  v15 = (unint64_t)v9[2];
  if (v15)
    v15 = *(_QWORD *)(v15 + 24);
  v16 = 16 * v15 + 40;
  if (v15 >> 60 || 16 * v15 >= 0xFFFFFFFFFFFFFFD8)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_91;
  }
  v17 = (unint64_t)v9[4];
  v18 = (v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  v19 = __CFADD__(v16, v18);
  v20 = v16 + v18;
  if (v19)
  {
LABEL_91:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_92;
  }
  v21 = (unint64_t)v9[6];
  if (v21 >> 60)
  {
LABEL_92:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_93;
  }
  v22 = (unint64_t)v9[7];
  if (!is_mul_ok(v22, 6uLL))
  {
LABEL_93:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_94:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_95;
  }
  v23 = (unint64_t)v9[5];
  if (v23)
    v24 = *(_QWORD *)(v23 + 24);
  else
    v24 = 0;
  if (!is_mul_ok(v24, 0x38uLL))
    goto LABEL_94;
  v25 = 16 * v21;
  v26 = 56 * v24;
  v19 = __CFADD__(v26, v25);
  v27 = v26 + v25;
  if (v19)
  {
LABEL_95:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_96;
  }
  v28 = 6 * v22;
  v19 = __CFADD__(v27, v28);
  v29 = v27 + v28;
  if (v19)
  {
LABEL_96:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_97:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_98:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_99;
  }
  if ((v29 & 6) != 0)
    v29 = (v29 & 0xFFFFFFFFFFFFFFF8) + 8;
  v19 = __CFADD__(v29, v20);
  v30 = v29 + v20;
  if (v19)
    goto LABEL_97;
  if (v23)
    v23 = *(_QWORD *)(v23 + 24);
  v31 = 2 * v23 + 32;
  if ((v23 & 0x8000000000000000) != 0 || 2 * v23 >= 0xFFFFFFFFFFFFFFE0)
    goto LABEL_98;
  v32 = 2 * v23 + 40;
  if (v31 >= 0xFFFFFFFFFFFFFFF8)
  {
LABEL_99:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_100:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_101:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_102:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_103:
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  v19 = __CFADD__(v32, 2 * v17);
  v33 = v32 + 2 * v17;
  v34 = v19;
  if ((v17 & 0x8000000000000000) != 0 || v34)
    goto LABEL_100;
  v35 = (v33 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v33 & 6) == 0)
    v35 = v33;
  v36 = (unint64_t)v9[10];
  v37 = !is_mul_ok(v36, v35);
  v38 = v36 * v35;
  v39 = v30 + v38;
  v40 = __CFADD__(v30, v38);
  if (v37 || v40)
    goto LABEL_101;
  v41 = (_QWORD *)_os_trace_calloc();
  v42 = v41;
  *v41 = 0x110000600BLL;
  v41[1] = 0;
  v41[4] = v9[1];
  v43 = (char *)v41 + v39;
  v44 = (char *)(v41 + 5);
  v85 = v41 + 5;
  v45 = v9[2];
  if (v45)
    v46 = 16 * v45[3];
  else
    v46 = 0;
  if (&v43[-v46] < v44)
    goto LABEL_60;
  v76 = (char *)(v41 + 2);
  v86 = v10;
  v87 = 0x40000000;
  v88 = __catalog_chunk_unparse_uuid_block_invoke;
  v89 = &__block_descriptor_tmp_76;
  v90 = &v85;
  v47 = (_QWORD *)v45[2];
  v48 = (char *)(v41 + 5);
  if (v47)
  {
    do
    {
      ((void (*)(uint64_t *, _QWORD *, _QWORD))v88)(&v86, v47 + 2, v47[4]);
      v47 = (_QWORD *)*v47;
    }
    while (v47);
    v48 = (char *)v85;
  }
  v49 = &v48[v46];
  v85 = v49;
  *(_WORD *)v76 = (_WORD)v49 - (_WORD)v44;
  if (v43 - (_BYTE *)v9[4] < (unint64_t)v49)
  {
LABEL_60:
    free(v42);
    v42 = 0;
    v50 = MEMORY[8];
    v51 = MEMORY[8] + 16;
    goto LABEL_78;
  }
  v52 = (uint64_t)v9[3];
  v86 = v10;
  v87 = 0x40000000;
  v88 = __catalog_chunk_unparse_subsystem_block_invoke;
  v89 = &__block_descriptor_tmp_78;
  v90 = v9;
  v91 = &v85;
  _os_trace_str_map_for_each(v52, (uint64_t)&v86);
  v85 = (char *)v9[4] + (_QWORD)v85;
  v53 = (((unint64_t)v85 + 7) & 0xFFFFFFFFFFFFFFF8) - (_QWORD)v85;
  bzero(v85, v53);
  v54 = (char *)v85 + v53;
  v85 = v54;
  v55 = v54 - v44;
  *((_WORD *)v42 + 9) = (_WORD)v54 - (_WORD)v44;
  v56 = v9[5];
  if (v56)
    v57 = v56[12];
  else
    v57 = 0;
  *((_WORD *)v42 + 10) = v57;
  v86 = v10;
  v87 = 0x40000000;
  v88 = __catalog_chunk_unparse_procinfo_block_invoke;
  v89 = &__block_descriptor_tmp_79;
  v90 = v9;
  v91 = &v85;
  v92 = v43;
  if (v56)
  {
    v58 = (_QWORD *)*((_QWORD *)v56 + 2);
    if (v58)
    {
      do
      {
        ((void (*)(uint64_t *, _QWORD))v88)(&v86, v58[4]);
        v58 = (_QWORD *)*v58;
      }
      while (v58);
      v54 = (char *)v85;
      v55 = (_BYTE *)v85 - v44;
    }
  }
  *((_WORD *)v42 + 11) = v55;
  *((_WORD *)v42 + 12) = 0;
  v59 = v9[8];
  if (v59)
  {
    do
    {
      v60 = *((_DWORD *)v59 + 8);
      if (v60)
      {
        *(_OWORD *)v54 = *((_OWORD *)v59 + 1);
        *((_DWORD *)v54 + 4) = v60;
        *((_DWORD *)v54 + 5) = *((_DWORD *)v59 + 9);
        v61 = v54 + 24;
        v85 = v54 + 24;
        if ((unint64_t)(v43 - (v54 + 24)) > 3)
        {
          *((_DWORD *)v54 + 6) = *(_DWORD *)(*((_QWORD *)v59 + 6) + 4);
          v85 = v54 + 28;
          v62 = (unsigned int *)*((_QWORD *)v59 + 6);
          v63 = MEMORY[0x1E0C809B0];
          v86 = MEMORY[0x1E0C809B0];
          v87 = 0x40000000;
          v88 = __catalog_chunk_unparse_subchunk_procinfos_block_invoke;
          v89 = &__block_descriptor_tmp_82;
          v90 = &v85;
          hashtable_iterate(v62, (uint64_t)&v86);
          v61 = (char *)v85;
          if ((unint64_t)(v43 - (_BYTE *)v85) >= 4)
          {
            *(_DWORD *)v85 = *(_DWORD *)(*((_QWORD *)v59 + 5) + 4);
            v85 = v61 + 4;
            v86 = v63;
            v64 = (unsigned int *)*((_QWORD *)v59 + 5);
            v87 = 0x40000000;
            v88 = __catalog_chunk_unparse_subchunk_subcats_block_invoke;
            v89 = &__block_descriptor_tmp_83;
            v90 = &v85;
            hashtable_iterate(v64, (uint64_t)&v86);
            v61 = (char *)v85;
          }
        }
        ++*((_WORD *)v42 + 12);
        v65 = ((unint64_t)(v61 + 7) & 0xFFFFFFFFFFFFFFF8) - (_QWORD)v61;
        bzero(v61, v65);
        v54 = (char *)v85 + v65;
        v85 = (char *)v85 + v65;
      }
      v59 = *(void **)v59;
    }
    while (v59);
    v55 = v54 - v44;
  }
  if (v55 >= 0x10000)
    goto LABEL_102;
  v50 = v54 - v76;
  v42[1] = v50;
  v51 = v50 + 16;
  if (v50 + 16 > v39)
    goto LABEL_103;
LABEL_78:
  if ((v50 & 7) != 0)
    v66 = (v50 & 0xFFFFFFFFFFFFFFF8) + 24;
  else
    v66 = v51;
  v67 = (_QWORD *)(*(_QWORD *)(a1 + 96) + 16 * *(unsigned int *)(a1 + 116));
  *v67 = v42;
  v67[1] = v66;
  *(_DWORD *)(a1 + 112) += v66;
  v68 = _os_trace_writev();
  if (v68 != -1)
  {
    *(_QWORD *)(a1 + 184) += v68;
    if (*(_DWORD *)(a1 + 104) >= 2u)
    {
      v69 = *(_QWORD *)(a1 + 96);
      v70 = 1;
      v71 = 16;
      do
      {
        free(*(void **)(v69 + v71));
        v69 = *(_QWORD *)(a1 + 96);
        v72 = (_QWORD *)(v69 + v71);
        ++v70;
        *v72 = 0;
        v72[1] = 0;
        v71 += 16;
      }
      while (v70 < *(unsigned int *)(a1 + 104));
    }
    *(_DWORD *)(a1 + 112) = 0;
    v4 = 1;
LABEL_86:
    *(_DWORD *)(a1 + 104) = v4;
    _catalog_destroy(*(_QWORD *)(a1 + 24));
    _catalog_destroy(*(_QWORD *)(a1 + 80));
    *(_QWORD *)(a1 + 80) = 0;
    *(_QWORD *)(a1 + 24) = 0;
    result = 1;
    *(_QWORD *)(a1 + 40) = 0;
    return result;
  }
  v74 = __error();
  if (!a2)
    return 0;
  create_repack_error(*v74, CFSTR("Failed to write file data to temp file"));
  v75 = (id)objc_claimAutoreleasedReturnValue();
  result = 0;
  *a2 = v75;
  return result;
}

void _repack_ttl_compact_flush_chunkset()
{
  uint64_t v0;
  uint8_t *v1;
  int v2;
  size_t v3;
  size_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  _QWORD *v9;
  uint8_t dst_buffer[65536];
  uint64_t v11;

  v0 = MEMORY[0x1E0C80A78]();
  v11 = *MEMORY[0x1E0C80C00];
  v1 = dst_buffer;
  bzero(dst_buffer, 0x10000uLL);
  v2 = 256;
  v3 = compression_encode_buffer(dst_buffer, 0x10000uLL, *(const uint8_t **)(v0 + 120), *(unsigned int *)(v0 + 128), 0, COMPRESSION_LZ4);
  if (v3)
  {
    v4 = v3;
  }
  else
  {
    v2 = 0;
    v1 = *(uint8_t **)(v0 + 120);
    v4 = *(unsigned int *)(v0 + 128);
  }
  v5 = (_QWORD *)_os_trace_malloc();
  v6 = (uint64_t)v5;
  if ((v4 & 7) != 0)
    *(_QWORD *)((char *)v5 + ((v4 + 16) & 0xFFFFFFFFFFFFFFF8)) = 0;
  *v5 = 0x110000600DLL;
  v5[1] = v4;
  memcpy(v5 + 2, v1, v4);
  _repack_compact_add_iov(v0, v6);
  v7 = *(_QWORD *)(v0 + 80);
  v8 = *(_DWORD *)(v0 + 128);
  if (*(_QWORD *)(v7 + 80))
  {
    v9 = **(_QWORD ***)(*(_QWORD *)(v7 + 72) + 8);
  }
  else
  {
    v9 = _catalog_subchunk_entry_alloc(v7);
    v7 = *(_QWORD *)(v0 + 80);
  }
  *((_DWORD *)v9 + 8) = v8;
  *((_DWORD *)v9 + 9) = v2;
  _catalog_subchunk_entry_alloc(v7);
  bzero(*(void **)(v0 + 120), *(unsigned int *)(v0 + 132));
  *(_DWORD *)(v0 + 128) = 0;
}

void ___repack_ttl_compact_close_catalog_block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a2);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 192) + 32), "addObject:", v3);

}

void ___repack_ttl_compact_close_catalog_block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  unsigned int *v5;
  id v6;
  _QWORD v7[5];

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a2 + 40);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a2 + 24);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 192) + 32), "addObject:", v6);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 192) + 32), "addObject:", v4);
  v5 = *(unsigned int **)(a2 + 56);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = ___repack_ttl_compact_close_catalog_block_invoke_3;
  v7[3] = &__block_descriptor_40_e13_v24__0_v8_v16l;
  v7[4] = *(_QWORD *)(a1 + 32);
  hashtable_iterate(v5, (uint64_t)v7);

}

id create_repack_error(int a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = *MEMORY[0x1E0CB2D50];
  v9[0] = a2;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a2;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("LogRepackErrorDomain"), a1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void ___repack_ttl_compact_close_catalog_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a3 + 16);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 192) + 32), "addObject:", v4);

}

uint64_t _repack_ttl_compact_open_catalog(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v4;

  result = _catalog_create_with_chunk(a2, 0);
  *(_QWORD *)(a1 + 24) = result;
  if (result)
  {
    *(_QWORD *)(a1 + 40) = *(_QWORD *)(result + 64);
    *(_DWORD *)(a1 + 116) = *(_DWORD *)(a1 + 104);
    _repack_compact_add_iov(a1, 0);
    result = (uint64_t)_catalog_create();
    *(_QWORD *)(a1 + 80) = result;
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 24) + 8);
    if (*(_QWORD *)(result + 8) > v4)
      *(_QWORD *)(result + 8) = v4;
  }
  return result;
}

uint64_t _compact_chunkset()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  id v7;
  id v8;
  int v9;
  unsigned int v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  unsigned int v14;
  int v15;
  size_t *v16;
  size_t v17;
  _QWORD *v18;
  uint64_t v19;
  char *v20;
  unint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v27;
  id v28;
  int v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int16 v38;
  unint64_t v39;
  uint64_t v40;
  unsigned int v41;
  unint64_t v42;
  unint64_t v43;
  unsigned int *v44;
  uint64_t *v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  __int16 v49;
  unint64_t v50;
  __int16 v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  __int16 v63;
  char *v64;
  uint64_t v65;
  _QWORD *v66;
  size_t v67;
  _QWORD *v68;
  _QWORD *v69;
  size_t v70;
  _QWORD *v71;
  uint64_t v72;
  __int16 v73;
  __int16 v74;
  unsigned __int16 *v75;
  char *v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unsigned __int16 v80;
  char *v81;
  int v82;
  unint64_t v83;
  unint64_t v84;
  void *v85;
  FILE *v86;
  id v87;
  unsigned int v88;
  _QWORD *v89;
  char *v90;
  void *v91;
  _QWORD *v92;
  uint64_t v93;
  size_t v94;
  uint64_t v95;
  size_t v96;
  size_t v97;
  size_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  size_t v103;
  uint64_t v104;
  unsigned int v105;
  _BOOL4 v106;
  size_t v107;
  _BOOL4 v108;
  _QWORD *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  int v113;
  uint64_t v114;
  void *v115;
  int v116;
  uint64_t v117;
  int v118;
  uint64_t v119;
  uint64_t v120;
  _QWORD *v121;
  BOOL v122;
  int v123;
  __int16 v124;
  uint64_t v125;
  _QWORD *v126;
  unint64_t v127;
  uint64_t v128;
  uint64_t v130;
  char *v131;
  unint64_t v132;
  uint64_t v133;
  id v134;
  uint64_t *v135;
  uint64_t *v136;
  uint64_t v137;
  unint64_t v138;
  uint64_t v139;
  unint64_t v140;
  _QWORD *v141;
  unint64_t v142;
  id v143;
  uint64_t v144;
  void *context;
  char *v146;
  __int16 v147;
  size_t __n[2];
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  uint64_t v180;
  char *v181;
  uint64_t v182;
  uint64_t v183;
  __int128 v184;
  __int128 v185;
  uint64_t v186;
  uint64_t v187;
  __int128 v188;
  __int128 v189;
  uint64_t v190;
  uint64_t v191;
  char *v192;
  uint64_t v193;
  uint64_t v194;
  __int128 v195;
  __int128 v196;
  uint64_t v197;
  _QWORD *v198;
  _OWORD v199[2];
  uint64_t v200;
  uint64_t v201;

  v0 = MEMORY[0x1E0C80A78]();
  v2 = v1;
  v144 = v3;
  v5 = v4;
  v6 = (_QWORD *)v0;
  v201 = *MEMORY[0x1E0C80C00];
  v8 = v7;
  v9 = *(_DWORD *)v6;
  if (*(int *)v6 <= 24587)
  {
    if ((v9 - 24578) < 3)
    {
LABEL_3:
      v10 = *((_DWORD *)v6 + 6);
      v11 = v6[2];
      *(_QWORD *)(v5 + 32) = 0;
      v12 = _os_procinfo_map_lookup(*(_QWORD **)(*(_QWORD *)(v5 + 24) + 40), v11, v10);
      *(_QWORD *)(v5 + 32) = v12;
      goto LABEL_4;
    }
    if (v9 != 24577)
      goto LABEL_149;
    v83 = v6[1];
    v84 = v83 - 16;
    if (v83 < 0x10)
    {
LABEL_109:
      *(_QWORD *)(v5 + 48) = 0;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Warning: chunk with chunkset_start_addr and id: %p, %@ was unreadable!"), v144, v8);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = (FILE *)*MEMORY[0x1E0C80C10];
      v87 = objc_retainAutorelease(v85);
      fprintf(v86, "%s\n", (const char *)objc_msgSend(v87, "UTF8String"));
      goto LABEL_164;
    }
    v126 = v6 + 4;
    if (v83 - 4113 >= 0xFFFFFFFFFFFFF00FLL)
    {
      v127 = *((unsigned __int16 *)v6 + 16);
      if (v84 < v127)
        goto LABEL_109;
      v128 = *((unsigned __int16 *)v6 + 17);
      if (v128 <= 0xFFF)
      {
        if (*((_BYTE *)v6 + 29))
        {
          if (v84 <= v127 + (unsigned __int16)(4096 - v128))
          {
            *(_QWORD *)(v5 + 56) = (char *)v126 + v127;
            *(_QWORD *)(v5 + 64) = (unsigned __int16)(4096 - v128);
LABEL_169:
            *(_QWORD *)(v5 + 48) = v126;
            goto LABEL_3;
          }
        }
        else if (v84 == 4096)
        {
          *(_QWORD *)(v5 + 56) = (char *)v126 + v128;
          *(_QWORD *)(v5 + 64) = (unsigned __int16)(4096 - v128);
          goto LABEL_169;
        }
      }
    }
    *(_QWORD *)(v5 + 56) = 0;
    *(_QWORD *)(v5 + 64) = 0;
    goto LABEL_169;
  }
  if (v9 == 24588)
  {
    v82 = *((unsigned __int8 *)v6 + 29);
  }
  else
  {
    if (v9 != 24592)
      goto LABEL_149;
    v82 = 0;
  }
  v119 = v6[2];
  *(_QWORD *)(v5 + 32) = 0;
  v120 = *(_QWORD *)(*(_QWORD *)(v5 + 24) + 40);
  if (!v120)
    goto LABEL_148;
  v121 = (_QWORD *)(v120 + 16);
  do
  {
    v121 = (_QWORD *)*v121;
    if (!v121)
      goto LABEL_148;
  }
  while (v121[2] != v119);
  v12 = (_QWORD *)v121[4];
  *(_QWORD *)(v5 + 32) = v12;
  if (v12)
    v122 = v82 == 0;
  else
    v122 = 1;
  if (v122)
  {
LABEL_4:
    if (v12)
      goto LABEL_5;
LABEL_148:
    *(_QWORD *)(v5 + 48) = 0;
LABEL_149:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ERROR: unpacking chunk with chunkset_start_addr and id: %p, %@ was unsuccessful"), v144, v8);
    v87 = (id)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      create_repack_error(65, v87);
      v125 = 0;
      *v2 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v125 = 0;
    }
    goto LABEL_165;
  }
  v123 = *((__int16 *)v12 + 1);
  if (v123 < 0)
  {
    v124 = v123 & 0x7FFF;
    *((_WORD *)v12 + 1) = v124;
    if (v82 == 4)
      *((_WORD *)v12 + 1) = v124 | 1;
  }
LABEL_5:
  v13 = v6[1];
  if ((v13 & 7) != 0)
    v14 = (v13 & 0xFFFFFFF8) + 24;
  else
    v14 = v13 + 16;
  if (*(_DWORD *)(v5 + 128) + v14 > *(_DWORD *)(v5 + 132))
    _repack_ttl_compact_flush_chunkset();
  v15 = *(_DWORD *)v6;
  v143 = v8;
  if (v15 != 24577)
  {
    v178 = 0u;
    v179 = 0u;
    v176 = 0u;
    v177 = 0u;
    v174 = 0u;
    v175 = 0u;
    v172 = 0u;
    v173 = 0u;
    v170 = 0u;
    v171 = 0u;
    v168 = 0u;
    v169 = 0u;
    v166 = 0u;
    v167 = 0u;
    v164 = 0u;
    v165 = 0u;
    v162 = 0u;
    v163 = 0u;
    v160 = 0u;
    v161 = 0u;
    v158 = 0u;
    v159 = 0u;
    v156 = 0u;
    v157 = 0u;
    v154 = 0u;
    v155 = 0u;
    v152 = 0u;
    v153 = 0u;
    v150 = 0u;
    v151 = 0u;
    v88 = *(_DWORD *)v6 - 24579;
    *(_OWORD *)__n = 0u;
    v149 = 0u;
    if (v88 <= 1)
    {
      v89 = v6;
      v90 = (char *)v6 - v144;
      objc_msgSend(v143, "stringByAppendingFormat:", CFSTR("-%llu"), v90);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_DWORD *)v89 == 24580)
        v92 = v89 + 7;
      else
        v92 = v89 + 6;
      v93 = _os_trace_uuid_map_lookup(*(_QWORD **)(*(_QWORD *)(v5 + 192) + 16), v92);
      v94 = v89[4];
      v190 = 0;
      v189 = 0u;
      v188 = 0u;
      _OSLogEventUnpackChunk_2909(v89, *(_QWORD *)(v5 + 24), (uint64_t)&v188);
      v95 = *(_QWORD *)(v5 + 40);
      v97 = *(_QWORD *)(v95 + 16);
      v96 = *(_QWORD *)(v95 + 24);
      if (v97 <= v94)
        v97 = v94;
      if (v97 >= v96)
        v98 = v96;
      else
        v98 = v97;
      bzero(&v149, 0x400uLL);
      v100 = *(_QWORD *)(v5 + 160);
      v99 = *(_QWORD *)(v5 + 168);
      v101 = *(_QWORD *)(v5 + 24);
      v184 = v188;
      v185 = v189;
      v186 = v190;
      __n[0] = 3;
      __n[1] = v98;
      v180 = v99;
      v181 = v90;
      v182 = v100;
      v183 = v101;
      v187 = 0;
      if (objc_msgSend(**(id **)(v5 + 192), "_setLogEvent:rangeUUIDIndex:machTimebase:", __n, v93, *(_QWORD *)(v5 + 192) + 8))
      {
        if (((*(uint64_t (**)(void))(*(_QWORD *)(v5 + 136) + 16))() & 1) != 0)
        {

          v6 = v89;
          goto LABEL_122;
        }
        ++*(_QWORD *)(v5 + 152);
      }

      goto LABEL_163;
    }
LABEL_122:
    memcpy((void *)(*(_QWORD *)(v5 + 120) + *(unsigned int *)(v5 + 128)), v6, v14);
    *(_DWORD *)(v5 + 128) += v14;
    _catalog_subchunk_update_times(*(_QWORD *)(v5 + 80), v6[4]);
    v102 = _catalog_procinfo_create(*(_QWORD *)(v5 + 80), *(_QWORD *)(v5 + 32));
    *(_QWORD *)(v5 + 72) = v102;
    _catalog_subchunk_procinfo_add(*(_QWORD *)(v5 + 80), v102);
    *(_QWORD *)(v5 + 72) = 0;
    *(_QWORD *)(v5 + 32) = 0;
    goto LABEL_163;
  }
  v134 = v8;
  v178 = 0u;
  v179 = 0u;
  v176 = 0u;
  v177 = 0u;
  v174 = 0u;
  v175 = 0u;
  v172 = 0u;
  v173 = 0u;
  v170 = 0u;
  v171 = 0u;
  v168 = 0u;
  v169 = 0u;
  v166 = 0u;
  v167 = 0u;
  v164 = 0u;
  v165 = 0u;
  v162 = 0u;
  v163 = 0u;
  v160 = 0u;
  v161 = 0u;
  v158 = 0u;
  v159 = 0u;
  v156 = 0u;
  v157 = 0u;
  v154 = 0u;
  v155 = 0u;
  v152 = 0u;
  v153 = 0u;
  v150 = 0u;
  v151 = 0u;
  v149 = 0u;
  v16 = *(size_t **)(v5 + 48);
  __n[1] = v16[1];
  v17 = *v16;
  LODWORD(v17) = 268435472;
  __n[0] = v17;
  *(_QWORD *)(v5 + 88) = __n;
  v18 = v16 + 2;
  v19 = *(unsigned __int16 *)v16;
  v20 = (char *)v16 + v19;
  if (v19 > 0x1000)
    v21 = (unint64_t)v18;
  else
    v21 = (unint64_t)v20;
  v140 = v21;
  v141 = v6;
  while (1)
  {
    v22 = v18 + 3;
    if ((unint64_t)(v18 + 3) >= v21)
      break;
    v23 = v18;
    v24 = v18[2];
    v25 = HIWORD(v24);
    if (!HIWORD(v24) || v25 > (uint64_t)(v21 - (_QWORD)v22))
      break;
    if ((v24 & 0x7000000000000) != 0)
      v27 = (HIWORD(v24) & 0xFFF8) + 32;
    else
      v27 = v25 + 24;
    v18 = (_QWORD *)((char *)v18 + v27);
    if (*v23)
    {
      v146 = (char *)v23 + v27;
      context = (void *)MEMORY[0x1A1AEC1C8]();
      objc_msgSend(v143, "stringByAppendingFormat:", CFSTR("-%llu"), (char *)v23 - v144);
      v28 = (id)objc_claimAutoreleasedReturnValue();
      v29 = *(unsigned __int8 *)v23;
      v30 = (v23[2] & 0xFFFFFFFFFFFFLL) + *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8);
      v200 = 0;
      memset(v199, 0, sizeof(v199));
      _OSLogEventUnpackChunk_2909(v6, *(_QWORD *)(v5 + 24), (uint64_t)v199);
      v31 = *(_QWORD *)(v5 + 40);
      v33 = *(_QWORD *)(v31 + 16);
      v32 = *(_QWORD *)(v31 + 24);
      if (v33 <= v30)
        v33 = v30;
      if (v33 >= v32)
        v34 = v32;
      else
        v34 = v33;
      bzero(&v189, 0x400uLL);
      v36 = *(_QWORD *)(v5 + 160);
      v35 = *(_QWORD *)(v5 + 168);
      v37 = *(_QWORD *)(v5 + 24);
      v195 = v199[0];
      v196 = v199[1];
      v197 = v200;
      *(_QWORD *)&v188 = 3;
      *((_QWORD *)&v188 + 1) = v34;
      v191 = v35;
      v192 = (char *)v23 - v144;
      v193 = v36;
      v194 = v37;
      v198 = v23;
      if (!objc_msgSend(**(id **)(v5 + 192), "_setLogEvent:rangeUUIDIndex:machTimebase:", &v188, _os_trace_uuid_map_lookup(*(_QWORD **)(*(_QWORD *)(v5 + 192) + 16), v22), *(_QWORD *)(v5 + 192) + 8))goto LABEL_102;
      if (((*(uint64_t (**)(void))(*(_QWORD *)(v5 + 136) + 16))() & 1) == 0)
      {
        ++*(_QWORD *)(v5 + 152);
        goto LABEL_102;
      }
      v38 = *((_WORD *)v23 + 1);
      if ((v38 & 1) != 0)
      {
        if (!(v23[2] >> 51))
          goto LABEL_102;
        v142 = 8;
        if ((v38 & 0x10) == 0)
          goto LABEL_39;
      }
      else
      {
        v142 = 0;
        if ((v38 & 0x10) == 0)
          goto LABEL_39;
      }
      v142 += 8;
      if (*((unsigned __int16 *)v23 + 11) < v142)
        goto LABEL_102;
LABEL_39:
      if (v29 == 2)
      {
        if ((*((_WORD *)v23 + 1) & 0x200) != 0)
        {
          v39 = v142 + 8;
          if (v142 + 8 > *((unsigned __int16 *)v23 + 11))
            goto LABEL_102;
        }
        else
        {
          v39 = v142;
        }
        if (*((_BYTE *)v23 + 1) == 1)
        {
          v39 += 8;
          if (v39 > *((unsigned __int16 *)v23 + 11))
            goto LABEL_102;
        }
        LODWORD(v137) = 0;
        v138 = 0;
        goto LABEL_48;
      }
      if ((*((_WORD *)v23 + 1) & 0x100) == 0)
      {
        LODWORD(v137) = 0;
        v138 = 0;
        v39 = v142;
LABEL_48:
        v142 = 0;
        goto LABEL_49;
      }
      v39 = v142 + 4;
      if (v142 + 4 > *((unsigned __int16 *)v23 + 11))
        goto LABEL_102;
      v137 = WORD1(v22[v142 / 8]);
      v138 = LOWORD(v22[v142 / 8]);
      if (v137 + v138 > 0x1000 || 4096 - *(_QWORD *)(v5 + 64) > v138)
        goto LABEL_102;
LABEL_49:
      v40 = *(_QWORD *)(v5 + 32);
      if ((*(_WORD *)(v40 + 2) & 1) != 0)
        v41 = 4;
      else
        v41 = 6;
      switch(v38 & 0xE)
      {
        case 2:
        case 4:
        case 6:
          v41 = 4;
          break;
        case 8:
          break;
        case 0xA:
          v41 = 20;
          break;
        case 0xC:
          v41 = 6;
          break;
        default:
          v41 = 0;
          break;
      }
      v42 = v39 + v41;
      v43 = v23[2];
      if (v42 <= HIWORD(v43) && v41)
      {
        v44 = (unsigned int *)((char *)v22 + v39);
        if (v41 == 6)
        {
          v45 = 0;
          v46 = (unint64_t)*((unsigned __int16 *)v44 + 2) << 32;
        }
        else
        {
          v46 = 0;
          v45 = v41 == 4 ? 0 : (uint64_t *)(v44 + 1);
        }
        v47 = HIWORD(v43);
        v48 = *v44;
        if ((v38 & 0x20) == 0 || (v42 += 2, v42 <= v47))
        {
          if (v29 == 2)
          {
            v49 = 0;
            v139 = 0;
LABEL_79:
            if (!*(_QWORD *)(v5 + 72))
            {
              v136 = v45;
              v51 = v49;
              v52 = v46;
              v53 = v48;
              v54 = _catalog_procinfo_create(*(_QWORD *)(v5 + 80), *(_QWORD *)(v5 + 32));
              *(_QWORD *)(v5 + 72) = v54;
              _catalog_subchunk_procinfo_add(*(_QWORD *)(v5 + 80), v54);
              v48 = v53;
              v46 = v52;
              v49 = v51;
              v45 = v136;
              v38 = *((_WORD *)v23 + 1);
            }
            v55 = v38 & 0xE;
            if (v55 == 10)
            {
              v58 = *(_QWORD *)(*(_QWORD *)(v5 + 80) + 16);
              if (v58)
                v59 = *(_QWORD *)(v58 + 24);
              else
                v59 = 0;
              _os_trace_uuid_map_insert((float *)v58, v45, v59);
            }
            else if (v55 == 8)
            {
              v56 = _catalog_procinfo_lookup_pc(*(_QWORD *)(v5 + 32), v46 | v48);
              if (v56)
              {
                *((_QWORD *)&v199[1] + 1) = 0;
                *(_QWORD *)&v199[0] = *(_QWORD *)(v56 + 8);
                v57 = *(_QWORD *)v56;
                DWORD2(v199[0]) = *(_QWORD *)v56;
                WORD6(v199[0]) = WORD2(v57);
                *(_OWORD *)((char *)v199 + 14) = *(_OWORD *)(v56 + 16);
                _catalog_procinfo_uuidinfo_add(*(_QWORD *)(v5 + 80), *(_QWORD *)(v5 + 72), (uint64_t)v199);
              }
            }
            if (v139)
            {
              v60 = *(_QWORD *)(v5 + 72);
              v61 = *(uint64_t **)(v5 + 80);
              v147 = v49;
              v62 = v60;
              if (!hashtable_lookup(*(_QWORD *)(v60 + 64), (uint64_t)&v147))
              {
                v133 = v62;
                v63 = v147;
                v64 = *(char **)(v139 + 8);
                v131 = *(char **)(v139 + 16);
                LOWORD(v199[0]) = v147;
                v65 = _os_trace_calloc();
                *(_WORD *)v65 = v63;
                v66 = _os_trace_str_map_entry((_QWORD *)v61[3], v64);
                *(_QWORD *)(v65 + 8) = v66;
                if (!v66)
                {
                  _os_trace_str_map_insert(v61 + 3, v64, v61[4]);
                  v67 = strlen(v64);
                  v68 = (_QWORD *)v61[3];
                  v61[4] += v67 + 1;
                  *(_QWORD *)(v65 + 8) = _os_trace_str_map_entry(v68, v64);
                }
                v69 = _os_trace_str_map_entry((_QWORD *)v61[3], v131);
                *(_QWORD *)(v65 + 16) = v69;
                if (!v69)
                {
                  _os_trace_str_map_insert(v61 + 3, v131, v61[4]);
                  v70 = strlen(v131);
                  v71 = (_QWORD *)v61[3];
                  v61[4] += v70 + 1;
                  *(_QWORD *)(v65 + 16) = _os_trace_str_map_entry(v71, v131);
                }
                hashtable_insert(*(int **)(v133 + 64), v199, v65);
                ++v61[7];
              }
              v72 = *(_QWORD *)(v5 + 80);
              v73 = (unsigned __int16)_os_trace_str_map_lookup(*(_QWORD **)(v72 + 24), *(char **)(v139 + 8));
              catalog_subchunk_string_insert(v72, v73);
              v74 = (unsigned __int16)_os_trace_str_map_lookup(*(_QWORD **)(v72 + 24), *(char **)(v139 + 16));
              catalog_subchunk_string_insert(v72, v74);
            }
            _catalog_subchunk_update_times(*(_QWORD *)(v5 + 80), v30);
            v75 = *(unsigned __int16 **)(v5 + 88);
            v76 = (char *)v75 + *v75;
            v77 = v23[2];
            if ((v77 & 0x7000000000000) != 0)
              v78 = (HIWORD(v77) & 0xFFF8) + 32;
            else
              v78 = HIWORD(v77) + 24;
            memcpy((char *)v75 + *v75, v23, (unsigned __int16)v78);
            *v75 += v78;
            if ((*((_BYTE *)v23 + 3) & 1) != 0)
            {
              v79 = *(_QWORD *)(v5 + 64);
              v80 = v75[1] - v137;
              v75[1] = v80;
              memcpy((char *)v75 + v80, (const void *)(v79 + *(_QWORD *)(v5 + 56) + v138 - 4096), v137);
              v81 = &v76[v142];
              *((_WORD *)v81 + 12) = v80;
              *((_WORD *)v81 + 13) = v137;
            }
            goto LABEL_102;
          }
          if ((*((_WORD *)v23 + 1) & 0x200) != 0)
          {
            v130 = *v44;
            v132 = v46;
            v135 = v45;
            v50 = v42 + 2;
            if (v42 + 2 > v47)
            {
              v49 = 0;
              v139 = 0;
              v42 = HIWORD(v43);
            }
            else
            {
              v49 = *(_WORD *)((char *)v22 + v42);
              LOWORD(v199[0]) = v49;
              v139 = hashtable_lookup(*(_QWORD *)(v40 + 64), (uint64_t)v199);
              v38 = *((_WORD *)v23 + 1);
              v42 = v50;
            }
            v45 = v135;
            v48 = v130;
            v46 = v132;
            if ((v38 & 0x400) == 0)
              goto LABEL_79;
          }
          else
          {
            v49 = 0;
            v139 = 0;
            if ((*((_WORD *)v23 + 1) & 0x400) == 0)
              goto LABEL_79;
          }
          if (v42 >= *((unsigned __int16 *)v23 + 11))
            goto LABEL_102;
          goto LABEL_79;
        }
      }
LABEL_102:

      objc_autoreleasePoolPop(context);
      v21 = v140;
      v6 = v141;
      v18 = v146;
    }
  }
  v8 = v134;
  if (*(_QWORD *)(v5 + 72))
  {
    v103 = LOWORD(__n[0]);
    v104 = WORD1(__n[0]);
    v105 = LOWORD(__n[0]) - WORD1(__n[0]) + 4096;
    v106 = v105 < 0xFF9;
    if (v105 >= 0xFF9)
      v105 = 4096;
    if (WORD1(__n[0]) == 4096)
      v107 = LOWORD(__n[0]);
    else
      v107 = v105;
    v108 = WORD1(__n[0]) != 4096 && v106;
    v109 = (_QWORD *)(*(_QWORD *)(v5 + 120) + *(unsigned int *)(v5 + 128));
    *v109 = 24577;
    v109[1] = v107 + 16;
    v110 = (*(_DWORD *)(v5 + 128) + 16);
    *(_DWORD *)(v5 + 128) = v110;
    LOWORD(v109) = *((_WORD *)v6 + 15);
    v111 = *(_QWORD *)(v5 + 120) + v110;
    v112 = v6[2];
    v113 = *((_DWORD *)v6 + 6);
    *(_BYTE *)(v111 + 12) = *((_BYTE *)v6 + 28);
    *(_DWORD *)(v111 + 8) = v113;
    *(_QWORD *)v111 = v112;
    *(_BYTE *)(v111 + 13) = v108;
    *(_WORD *)(v111 + 14) = (_WORD)v109;
    v114 = (*(_DWORD *)(v5 + 128) + 16);
    *(_DWORD *)(v5 + 128) = v114;
    v115 = (void *)(*(_QWORD *)(v5 + 120) + v114);
    if (v108)
    {
      memcpy(v115, __n, v103);
      v116 = (v103 & 0xFFF8) + 8;
      if ((v103 & 7) == 0)
        v116 = v103;
      v117 = (*(_DWORD *)(v5 + 128) + v116);
      *(_DWORD *)(v5 + 128) = v117;
      memcpy((void *)(*(_QWORD *)(v5 + 120) + v117), (char *)__n + v104, 4096 - v104);
      v118 = *(_DWORD *)(v5 + 128) + ((4103 - v104) & 0xFFFFFFF8);
    }
    else
    {
      memcpy(v115, __n, v107);
      v118 = *(_DWORD *)(v5 + 128) + v107;
    }
    *(_DWORD *)(v5 + 128) = v118;
  }
  *(_QWORD *)(v5 + 72) = 0;
  *(_QWORD *)(v5 + 32) = 0;
  *(_QWORD *)(v5 + 88) = 0;
  *(_QWORD *)(v5 + 48) = 0;
LABEL_163:

  v87 = 0;
LABEL_164:
  v125 = 1;
LABEL_165:

  return v125;
}

_QWORD *_OSLogEventUnpackChunk_2909(_QWORD *result, uint64_t a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int16 *v8;
  _BOOL4 v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  BOOL v22;
  int v23;
  __int16 v24;

  *(_QWORD *)a3 = result;
  v4 = (_QWORD *)(a3 + 16);
  v5 = *(_DWORD *)result;
  switch(*(_DWORD *)result)
  {
    case 0x6001:
      v6 = result[1];
      v7 = v6 - 16;
      if (v6 < 0x10)
        goto LABEL_22;
      v8 = (unsigned __int16 *)(result + 4);
      v9 = *((_BYTE *)result + 29) != 0;
      goto LABEL_16;
    case 0x6002:
      v11 = result[1];
      v7 = v11 - 32;
      if (v11 < 0x20)
        goto LABEL_22;
      v9 = 0;
      v8 = (unsigned __int16 *)(result + 6);
      goto LABEL_16;
    case 0x6003:
      v12 = result[1];
      v7 = v12 - 48;
      if (v12 < 0x30)
        goto LABEL_22;
      v9 = 0;
      v8 = (unsigned __int16 *)(result + 8);
      goto LABEL_16;
    case 0x6004:
      v13 = result[1];
      v7 = v13 - 72;
      if (v13 < 0x48)
        goto LABEL_22;
      v9 = 0;
      v8 = (unsigned __int16 *)(result + 11);
      goto LABEL_16;
    case 0x6005:
    case 0x6006:
    case 0x6007:
    case 0x6008:
    case 0x6009:
    case 0x600A:
    case 0x600B:
      goto LABEL_7;
    case 0x600C:
      v14 = result[1];
      v7 = v14 - 16;
      if (v14 < 0x10)
        goto LABEL_22;
      v9 = 0;
      v8 = (unsigned __int16 *)result + 15;
      goto LABEL_16;
    default:
      if (v5 != 24592)
      {
LABEL_7:
        *(_OWORD *)(a3 + 24) = 0u;
        *(_OWORD *)(a3 + 8) = 0u;
        return result;
      }
      v10 = result[1];
      v7 = v10 - 16;
      if (v10 < 0x10)
        goto LABEL_22;
      v9 = 0;
      v8 = (unsigned __int16 *)(result + 4);
LABEL_16:
      if (v7 - 4097 < 0xFFFFFFFFFFFFF00FLL)
        goto LABEL_17;
      v15 = *v8;
      if (v7 < v15)
      {
LABEL_22:
        *(_QWORD *)(a3 + 8) = 0;
        *(_QWORD *)(a3 + 32) = 0;
        return result;
      }
      v17 = v8[1];
      if (v17 > 0xFFF)
        goto LABEL_17;
      if (!v9)
      {
        if (v7 == 4096)
        {
          *v4 = (char *)v8 + v17;
          v18 = (unsigned __int16)(4096 - v17);
          goto LABEL_46;
        }
LABEL_17:
        *v4 = 0;
        *(_QWORD *)(a3 + 24) = 0;
        goto LABEL_18;
      }
      if (v7 > v15 + (unsigned __int16)(4096 - v17))
        goto LABEL_17;
      v18 = (unsigned __int16)(4096 - v17);
      *v4 = (char *)v8 + v15;
LABEL_46:
      *(_QWORD *)(a3 + 24) = v18;
LABEL_18:
      *(_QWORD *)(a3 + 8) = v8;
      *(_QWORD *)(a3 + 32) = 0;
      if ((v5 - 24577) >= 4)
      {
        if (v5 == 24592)
        {
          v16 = 0;
        }
        else
        {
          if (v5 != 24588)
            return result;
          v16 = *((unsigned __int8 *)result + 29);
        }
        if (a2)
        {
          v19 = *(_QWORD *)(a2 + 40);
          if (v19)
          {
            v20 = (_QWORD *)(v19 + 16);
            while (1)
            {
              v20 = (_QWORD *)*v20;
              if (!v20)
                break;
              if (v20[2] == result[2])
              {
                v21 = v20[4];
                *(_QWORD *)(a3 + 32) = v21;
                if (v21)
                  v22 = v16 == 0;
                else
                  v22 = 1;
                if (!v22)
                {
                  v23 = *(__int16 *)(v21 + 2);
                  if (v23 < 0)
                  {
                    v24 = v23 & 0x7FFF;
                    *(_WORD *)(v21 + 2) = v24;
                    if (v16 == 4)
                      *(_WORD *)(v21 + 2) = v24 | 1;
                  }
                }
                return result;
              }
            }
          }
        }
      }
      else if (a2)
      {
        result = _os_procinfo_map_lookup(*(_QWORD **)(a2 + 40), result[2], *((_DWORD *)result + 6));
        *(_QWORD *)(a3 + 32) = result;
      }
      return result;
  }
}

void _tracev3_chunk_decompress_and_enumerate_chunks_helper(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint8_t *v6;
  unint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD v11[2];
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  uint8_t *v15;
  int v16;
  size_t v17;

  v5 = a3;
  v17 = 0;
  v16 = 0;
  v6 = _tracev3_chunk_decompress(a1, a2, (compression_algorithm *)&v16, &v17);
  if (v6)
  {
    v7 = v17;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v12 = ___tracev3_chunk_decompress_and_enumerate_chunks_helper_block_invoke;
    v13 = &unk_1E4157F48;
    v14 = v5;
    v15 = v6;
    v8 = v11;
    v9 = 0;
    do
    {
      if (v7 - v9 < 0x10)
        break;
      v10 = *(_QWORD *)&v6[v9 + 8];
      if (v7 - v9 - 16 < v10)
        break;
      if (!v12((uint64_t)v8))
        break;
      v9 = (v9 + v10 + 23) & 0xFFFFFFFFFFFFFFF8;
    }
    while (v9 - 1 < v7);

  }
  if (v16)
    free(v6);

}

uint64_t ___tracev3_chunk_decompress_and_enumerate_chunks_helper_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1A1AEC1C8]();
  v3 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
  return v3;
}

BOOL purge_unused_uuids(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  DIR *v10;
  DIR *v11;
  const char *v12;
  dirent *v13;
  _BOOL8 v14;
  const char *d_name;
  DIR *v16;
  DIR *v17;
  int v18;
  int v19;
  dirent *v20;
  char *v21;
  const char *v22;
  int v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  id v36;
  uint64_t v37;
  void *j;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  char *v43;
  id v44;
  _QWORD *v45;
  id v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  char v58[128];
  char __str[1024];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v48 = v6;
  if (!objc_msgSend(v6, "count"))
  {
    v30 = 0;
    v14 = 1;
    goto LABEL_45;
  }
  v47 = v8;
  v9 = objc_retainAutorelease(v5);
  v10 = opendir((const char *)objc_msgSend(v9, "UTF8String"));
  if (!v10)
  {
    v39 = *__error();
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unable to logarchive %@: %s (%d)"), v9, strerror(v39), v39);
    create_repack_error(-1, v40);
    v30 = (id)objc_claimAutoreleasedReturnValue();

    v14 = 0;
    v8 = v47;
    if (!a3)
      goto LABEL_45;
    goto LABEL_43;
  }
  v11 = v10;
  v45 = a3;
  v44 = v5;
  v12 = "dsc";
  v46 = v9;
  while (1)
  {
    v13 = readdir(v11);
    v14 = v13 == 0;
    if (!v13)
      break;
    if (v13->d_type == 4)
    {
      d_name = v13->d_name;
      if (strcmp(v13->d_name, ".."))
      {
        if (!strcmp(d_name, v12) || strlen(d_name) == 2)
        {
          snprintf(__str, 0x400uLL, "%s/%s", (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"), d_name);
          v16 = opendir(__str);
          if (!v16)
          {
            v41 = *__error();
            v36 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unable to open %s: %s (%d)"), __str, strerror(v41), v41);
            create_repack_error(-1, v36);
            v30 = (id)objc_claimAutoreleasedReturnValue();
            v5 = v44;
            v8 = v47;
            goto LABEL_42;
          }
          v17 = v16;
          v18 = 0;
          v19 = 0;
          while (1)
          {
            v20 = readdir(v17);
            if (!v20)
              break;
            v21 = v20->d_name;
            if (strcmp(v20->d_name, "..") && *v21 != 46)
            {
              v22 = v12;
              v23 = strcmp(d_name, v12);
              v24 = objc_alloc(MEMORY[0x1E0CB37A0]);
              if (v23)
                v25 = (void *)objc_msgSend(v24, "initWithFormat:", CFSTR("%s%s"), d_name, v21);
              else
                v25 = (void *)objc_msgSend(v24, "initWithFormat:", CFSTR("%s"), v21, v43);
              v26 = v25;
              objc_msgSend(v25, "insertString:atIndex:", CFSTR("-"), 8);
              objc_msgSend(v26, "insertString:atIndex:", CFSTR("-"), 13);
              objc_msgSend(v26, "insertString:atIndex:", CFSTR("-"), 18);
              objc_msgSend(v26, "insertString:atIndex:", CFSTR("-"), 23);
              v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v26);
              if ((objc_msgSend(v48, "containsObject:", v27) & 1) == 0)
              {
                v43 = v21;
                v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s/%s"), __str);
                objc_msgSend(v7, "addObject:", v28);
                ++v19;

              }
              ++v18;

              v12 = v22;
              v9 = v46;
            }
          }
          if (v19 == v18)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", __str);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "addObject:", v29);

          }
          closedir(v17);
        }
      }
    }
  }
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v31 = v7;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  v5 = v44;
  v8 = v47;
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v54 != v34)
          objc_enumerationMutation(v31);
        unlink((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i)), "fileSystemRepresentation"));
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    }
    while (v33);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v36 = v47;
  v30 = (id)objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
  if (v30)
  {
    v37 = *(_QWORD *)v50;
    do
    {
      for (j = 0; j != v30; j = (char *)j + 1)
      {
        if (*(_QWORD *)v50 != v37)
          objc_enumerationMutation(v36);
        rmdir((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)j)), "fileSystemRepresentation"));
      }
      v30 = (id)objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    }
    while (v30);
  }
LABEL_42:

  closedir(v11);
  a3 = v45;
  if (v45)
  {
LABEL_43:
    if (!v14)
    {
      v30 = objc_retainAutorelease(v30);
      v14 = 0;
      *a3 = v30;
    }
  }
LABEL_45:

  return v14;
}

int *execute_repack(uint64_t a1, _QWORD *a2)
{
  _OSLogPredicateMapper *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  _OSLogCatalogFilter *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  int v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  id *v26;
  _QWORD *v27;
  int v28;
  int v29;
  int v30;
  int v31;
  DIR *v32;
  DIR *v33;
  dirent *v34;
  id v35;
  dirent *v36;
  void *v37;
  char *d_name;
  char *v39;
  unsigned int v40;
  id v41;
  uint64_t v42;
  void *v43;
  int v45;
  char v46;
  int v47;
  int v48;
  uint64_t v49;
  void *v50;
  int v51;
  char v52;
  void *v53;
  id v54;
  id v55;
  uint64_t v56;
  int *result;
  id v58;
  __CFString *v59;
  void *v60;
  int v61;
  id v62;
  uint64_t v63;
  unsigned __int8 v64;
  BOOL v65;
  id v66;
  void *v67;
  int v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t i;
  void *v81;
  void *v82;
  int v83;
  void (*v84)(const char *, ...);
  void *v85;
  id v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  BOOL v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  id v103;
  void *v104;
  id v105;
  char v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  id v110;
  id v111;
  int v112;
  void *v113;
  id v114;
  int *v115;
  void *v116;
  void *v117;
  id v118;
  _QWORD *v119;
  id *v120;
  _OSLogDirectoryReference *v121;
  _OSLogDirectoryReference *v122;
  _OSLogDirectoryReference *v123;
  _OSLogCollectionReference *v124;
  _OSLogPredicateMapper *v125;
  unsigned int v126;
  id v127;
  void *v129;
  _QWORD v131[5];
  id v132[4];
  id v133;
  id v134;
  uint64_t *v135;
  uint64_t v136;
  id v137;
  uint64_t v138;
  uint64_t *v139;
  uint64_t v140;
  uint64_t (*v141)(uint64_t, uint64_t);
  void (*v142)(uint64_t);
  id v143;
  uint64_t v144;
  uint64_t *v145;
  uint64_t v146;
  uint64_t (*v147)(uint64_t, uint64_t);
  void (*v148)(uint64_t);
  id v149;
  id v150;
  _QWORD v151[4];
  void *v152;
  uint64_t v153;
  id v154;
  _QWORD v155[16];
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  char v160[8];
  const __CFString *v161;
  uint64_t v162;

  v162 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 40) || !*(_QWORD *)(a1 + 48) || !*(_QWORD *)(a1 + 56))
  {
    create_repack_error(64, CFSTR("Please provide a non NULL function for print_stats, print_warning, and print_verbose"));
    v55 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_57;
  }
  print_verbose = *(uint64_t (**)(const char *, ...))(a1 + 56);
  if (!*(_BYTE *)(a1 + 24))
  {
    v58 = 0;
    goto LABEL_106;
  }
  v116 = (void *)objc_opt_new();
  v117 = (void *)objc_opt_new();
  v144 = 0;
  v145 = &v144;
  v146 = 0x3032000000;
  v147 = __Block_byref_object_copy__2934;
  v148 = __Block_byref_object_dispose__2935;
  v149 = *(id *)(a1 + 64);
  v118 = +[OSLogEventProxy _make](OSLogEventProxy, "_make");
  v138 = 0;
  v139 = &v138;
  v140 = 0x3032000000;
  v141 = __Block_byref_object_copy__2934;
  v142 = __Block_byref_object_dispose__2935;
  v143 = 0;
  v3 = [_OSLogPredicateMapper alloc];
  v125 = -[_OSLogPredicateMapper initWithPredicate:](v3, "initWithPredicate:", v145[5]);
  v127 = objc_retainAutorelease(*(id *)a1);
  __snprintf_chk(v160, 0x400uLL, 0, 0x400uLL, "%s/timesync", (const char *)objc_msgSend(v127, "fileSystemRepresentation"));
  v4 = open(v160, 0);
  v5 = v4;
  if ((_DWORD)v4 == -1)
  {
    v59 = CFSTR("Unable to open timesync database inside archive");
    goto LABEL_64;
  }
  v6 = _timesync_db_openat(v4, ".");
  if (!v6)
  {
    v59 = CFSTR("Unable to create timesync database structure");
LABEL_64:
    create_repack_error(74, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = 0;
    v124 = 0;
    v61 = 0;
    v121 = 0;
    v122 = 0;
    if (v60)
      goto LABEL_104;
    goto LABEL_105;
  }
  v7 = *(_QWORD *)(v6 + 80);
  v115 = (int *)v6;
  objc_msgSend(v118, "_setTimesyncDatabase:", v6);
  v8 = objc_retainAutorelease(v127);
  v9 = open((const char *)objc_msgSend(v8, "fileSystemRepresentation"), 0x100000);
  if ((_DWORD)v9 == -1)
  {
    create_repack_error(74, CFSTR("Unable to open archive for UUIDs"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (close(v5) == -1)
    {
      if (*__error() == 9)
        goto LABEL_122;
      __error();
      _os_assumes_log();
    }
LABEL_76:
    v123 = 0;
    v124 = 0;
    v61 = 0;
    v121 = 0;
    v122 = 0;
    goto LABEL_103;
  }
  objc_msgSend(v118, "_setUUIDDBFileDescriptor:", v9);
  v10 = objc_retainAutorelease(v8);
  v126 = open((const char *)objc_msgSend(v10, "fileSystemRepresentation"), 0x100000);
  if ((v126 & 0x80000000) != 0)
  {
    if (close(v9) == -1)
    {
      if (*__error() == 9)
        goto LABEL_123;
      __error();
      _os_assumes_log();
    }
    if (close(v5) == -1)
    {
      if (*__error() == 9)
        goto LABEL_124;
      __error();
      _os_assumes_log();
    }
    create_repack_error(74, CFSTR("Unable to open logarchive"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_76;
  }
  v121 = -[_OSLogDirectoryReference initWithDescriptor:]([_OSLogDirectoryReference alloc], "initWithDescriptor:", v126);
  v122 = -[_OSLogDirectoryReference initWithDescriptor:]([_OSLogDirectoryReference alloc], "initWithDescriptor:", v5);
  v123 = -[_OSLogDirectoryReference initWithDescriptor:]([_OSLogDirectoryReference alloc], "initWithDescriptor:", v9);
  v124 = -[_OSLogCollectionReference initWithDiagnosticsDirectory:timesyncDirectory:UUIDTextDirectory:]([_OSLogCollectionReference alloc], "initWithDiagnosticsDirectory:timesyncDirectory:UUIDTextDirectory:", v121, v122, v123);
  v11 = [_OSLogCatalogFilter alloc];
  v12 = -[_OSLogCatalogFilter initWithPredicate:collection:](v11, "initWithPredicate:collection:", v145[5], v124);
  v13 = (void *)v139[5];
  v139[5] = v12;

  -[_OSLogPredicateMapper mappedPredicate](v125, "mappedPredicate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;

  if (v15)
  {
    v69 = (void *)MEMORY[0x1E0CB3940];
    -[_OSLogPredicateMapper validationErrors](v125, "validationErrors");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "stringWithFormat:", CFSTR("Unable to validate predicate: %@"), v70);
    v71 = (id)objc_claimAutoreleasedReturnValue();

    create_repack_error(64, v71);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_101;
  }
  -[_OSLogPredicateMapper mappedPredicate](v125, "mappedPredicate");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v145[5];
  v145[5] = v16;

  objc_msgSend((id)v145[5], "allowEvaluation");
  v18 = MEMORY[0x1E0C809B0];
  v19 = *(unsigned __int8 *)(a1 + 27);
  v132[0] = (id)MEMORY[0x1E0C809B0];
  v132[1] = (id)3221225472;
  v132[2] = __compact_logarchive_block_invoke;
  v132[3] = &unk_1E4157F70;
  v136 = a1;
  v111 = v116;
  v133 = v111;
  v137 = v118;
  v110 = v117;
  v134 = v110;
  v135 = &v144;
  v131[0] = v18;
  v131[1] = 3221225472;
  v131[2] = __compact_logarchive_block_invoke_2;
  v131[3] = &unk_1E4157F98;
  v131[4] = &v138;
  v114 = v10;
  v20 = v118;
  v120 = v132;
  v119 = v131;
  v153 = 0;
  v21 = operator new();
  *(_OWORD *)v21 = 0u;
  *(_OWORD *)(v21 + 16) = 0u;
  *(_DWORD *)(v21 + 32) = 1065353216;
  v152 = 0;
  v151[1] = v7;
  v151[2] = v21;
  v113 = v20;
  v151[0] = v20;
  v151[3] = v19;
  v112 = v19;
  if (v19)
  {
    v22 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v23 = v152;
    v152 = v22;

  }
  v24 = 0;
  v129 = 0;
  while (1)
  {
    v25 = g_books[v24];
    v26 = v120;
    v27 = v119;
    print_verbose("Begin compacting book %s\n", v25);
    v28 = openat(v126, v25, 1048832);
    v29 = v28;
    if (v28 < 0)
    {
      v42 = *__error();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to open fd for book %s: %d"), v25, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (!strcmp(v25, "HighVolume") && (_DWORD)v42 == 2)
        v45 = -2;
      else
        v45 = -1;
      create_repack_error(v45, v43);
      v35 = (id)objc_claimAutoreleasedReturnValue();

LABEL_48:
      v35 = objc_retainAutorelease(v35);
      v52 = 0;
      v53 = v35;
      goto LABEL_49;
    }
    v30 = dup(v28);
    v31 = v30;
    if (v30 == -1)
    {
      __error();
      _os_assumes_log();
      goto LABEL_41;
    }
    if (lseek(v30, 0, 0) == -1)
    {
      __error();
      _os_assumes_log();
    }
    v32 = fdopendir(v31);
    v33 = v32;
    if (!v32)
    {
      v47 = *__error();
      if (close(v31) == -1)
      {
        v48 = *__error();
        v49 = *__error();
        if (v48 == 9)
          goto LABEL_121;
        _os_assumes_log();
      }
      *__error() = v47;
LABEL_41:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to open dir fd for book %s"), v25);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      create_repack_error(-1, v50);
      v35 = (id)objc_claimAutoreleasedReturnValue();

      v46 = 0;
      goto LABEL_42;
    }
    v34 = readdir(v32);
    v35 = 0;
    while (1)
    {
      v36 = v34;
      if (!v34)
      {
        v46 = 1;
        goto LABEL_35;
      }
      v37 = (void *)MEMORY[0x1A1AEC1C8]();
      if (v36->d_type == 8)
      {
        d_name = v36->d_name;
        v39 = strrchr(d_name, 46);
        if (v39)
        {
          if (!strcmp(v39, ".tracev3"))
            break;
        }
      }
LABEL_25:
      objc_autoreleasePoolPop(v37);
      v34 = readdir(v33);
    }
    v154 = v35;
    v40 = _compact_tracev3(v29, (uint64_t)v25, d_name, &v153, (uint64_t)v151, v26, v27, &v154);
    v41 = v154;

    if (v40)
    {
      v35 = v41;
      goto LABEL_25;
    }
    objc_autoreleasePoolPop(v37);
    v46 = 0;
    v35 = v41;
LABEL_35:
    if (closedir(v33) == -1)
    {
      __error();
      _os_assumes_log();
    }
LABEL_42:
    if (v29 >= 1 && close(v29) == -1)
      break;
LABEL_46:
    if ((v46 & 1) == 0)
      goto LABEL_48;
    v52 = 1;
    v53 = v129;
LABEL_49:

    v54 = v53;
    if ((v52 & 1) != 0)
    {
      v129 = v54;
    }
    else
    {
      if (objc_msgSend(v54, "code") != -2)
        goto LABEL_84;

      v129 = 0;
    }
    if (++v24 == 4)
    {
      objc_msgSend(v114, "lastPathComponent");
      v62 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v63 = objc_msgSend(v62, "UTF8String");
      v154 = v129;
      v64 = _compact_tracev3(v126, v63, "logdata.LiveData.tracev3", &v153, (uint64_t)v151, v26, v27, &v154);
      v54 = v154;

      if (((v112 != 0) & v64) == 1)
      {
        v150 = v54;
        v65 = purge_unused_uuids(v114, v152, &v150);
        v66 = v150;

        if (v65)
        {
          v67 = 0;
          v68 = 1;
          goto LABEL_85;
        }
        v54 = v66;
LABEL_84:
        v66 = objc_retainAutorelease(v54);
        v68 = 0;
        v67 = v66;
      }
      else
      {
        if ((v64 & 1) == 0)
          goto LABEL_84;
        v67 = 0;
        v68 = 1;
        v66 = v54;
      }
LABEL_85:
      printf("Compaction complete with result: %d\n", v68);

      v72 = v67;
      if (v72)
      {
        v73 = (void *)MEMORY[0x1E0CB3940];
        v74 = objc_msgSend(v72, "code");
        objc_msgSend(v72, "localizedDescription");
        v75 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v73, "stringWithFormat:", CFSTR("Error: %ld: %s\n"), v74, objc_msgSend(v75, "UTF8String"));
        v71 = (id)objc_claimAutoreleasedReturnValue();

        create_repack_error(-1, v71);
        v76 = objc_claimAutoreleasedReturnValue();
LABEL_100:
        v60 = (void *)v76;

LABEL_101:
        v61 = 0;
      }
      else
      {
        v158 = 0u;
        v159 = 0u;
        v156 = 0u;
        v157 = 0u;
        v71 = v111;
        v77 = 0;
        v78 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v156, v155, 16);
        if (v78)
        {
          v79 = *(_QWORD *)v157;
          while (2)
          {
            for (i = 0; i != v78; ++i)
            {
              if (*(_QWORD *)v157 != v79)
                objc_enumerationMutation(v71);
              v81 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * i);
              if ((objc_msgSend(v81, "isEqualToString:", CFSTR("total")) & 1) == 0)
              {
                objc_msgSend(v71, "objectForKeyedSubscript:", v81);
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                v83 = objc_msgSend(v82, "intValue");

                if (v83 != 1)
                {
                  if (!objc_msgSend(v81, "containsString:", CFSTR("timesync")))
                  {
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Found duplicate tracepoint_id '%s' in compaction: %lu"), objc_msgSend(objc_retainAutorelease(v81), "UTF8String"), v83);
                    v72 = (id)objc_claimAutoreleasedReturnValue();
                    create_repack_error(65, v72);
                    v76 = objc_claimAutoreleasedReturnValue();
                    goto LABEL_100;
                  }
                  (*(void (**)(const char *, ...))(a1 + 48))("Found duplicate timesync file '%s'", (const char *)objc_msgSend(objc_retainAutorelease(v81), "UTF8String"));
                  v77 = v77 + v83 - 1;
                }
              }
            }
            v78 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v156, v155, 16);
            if (v78)
              continue;
            break;
          }
        }

        (*(void (**)(const char *))(a1 + 40))("Compaction results:\n");
        v84 = *(void (**)(const char *, ...))(a1 + 40);
        objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("total"));
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v84("\tTotal matched events: %d\n", objc_msgSend(v85, "intValue"));

        (*(void (**)(const char *, ...))(a1 + 40))("\tTotal unique ids: %lu\n", objc_msgSend(v110, "count"));
        (*(void (**)(const char *, ...))(a1 + 40))("\tTotal duplicates: %lu\n", v77);
        v60 = 0;
        v61 = 1;
      }
      -[_OSLogCollectionReference close](v124, "close");
LABEL_103:
      objc_msgSend(v118, "_unmake");
      _timesync_db_close(v115);
      if (v60)
LABEL_104:
        v86 = objc_retainAutorelease(v60);
LABEL_105:

      _Block_object_dispose(&v138, 8);
      _Block_object_dispose(&v144, 8);

      v58 = v60;
      v55 = v58;
      if (v61)
      {
LABEL_106:
        v87 = *(id *)a1;
        v88 = (void *)MEMORY[0x1E0C99E98];
        v89 = (void *)MEMORY[0x1E0CB3940];
        *(_QWORD *)v160 = v87;
        v161 = CFSTR("Info.plist");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v160, 2);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "pathWithComponents:", v90);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "fileURLWithPath:isDirectory:", v91, 0);
        v92 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithContentsOfURL:", v92);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = objc_alloc_init(MEMORY[0x1E0C99D68]);
        if (!v93)
        {
          create_repack_error(74, CFSTR("Unable to open Info.plist"));
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_113;
        }
        objc_msgSend(v93, "objectForKey:", CFSTR("Repacked"));
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v96 = v95 == 0;

        if (v96)
        {
          objc_msgSend(v94, "description");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          v155[0] = v98;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v155, 1);
          v97 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v93, "objectForKey:", CFSTR("Repacked"));
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "description");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "addObject:", v98);
        }

        objc_msgSend(v93, "setObject:forKey:", v97, CFSTR("Repacked"));
        v132[0] = 0;
        objc_msgSend(v93, "writeToURL:error:", v92, v132);
        v100 = v132[0];
        if (v100)
        {
          v101 = v100;
          v102 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v100, "localizedDescription");
          v103 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v102, "stringWithFormat:", CFSTR("Unable to finalize logarchive: %s"), objc_msgSend(v103, "UTF8String"));
          v104 = (void *)objc_claimAutoreleasedReturnValue();

          create_repack_error(74, v104);
          v99 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_113:
          if (v99)
          {
            v105 = objc_retainAutorelease(v99);

            v106 = 0;
            goto LABEL_118;
          }
          v106 = 0;
        }
        else
        {
          v106 = 1;
        }
        v105 = v58;
LABEL_118:

        v55 = v105;
        if ((v106 & 1) != 0)
        {
          v56 = 0;
LABEL_60:

          return (int *)v56;
        }
      }
LABEL_57:
      v56 = 0xFFFFFFFFLL;
      if (a2)
      {
        if (v55)
        {
          v55 = objc_retainAutorelease(v55);
          *a2 = v55;
        }
      }
      goto LABEL_60;
    }
  }
  v51 = *__error();
  v49 = *__error();
  if (v51 != 9)
  {
    _os_assumes_log();
    goto LABEL_46;
  }
  qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EE52EA88 = v49;
  __break(1u);
LABEL_121:
  qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EE52EA88 = v49;
  __break(1u);
LABEL_122:
  v107 = *__error();
  qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EE52EA88 = v107;
  __break(1u);
LABEL_123:
  v108 = *__error();
  qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EE52EA88 = v108;
  __break(1u);
LABEL_124:
  result = __error();
  v109 = *result;
  qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EE52EA88 = v109;
  __break(1u);
  return result;
}

void sub_19EA70C94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a53, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2934(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2935(uint64_t a1)
{

}

uint64_t __compact_logarchive_block_invoke(uint64_t a1, void *a2)
{
  __CFString *v3;
  __CFString *v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  if (v3)
    v4 = v3;
  else
    v4 = CFSTR("nil");
  if ((-[__CFString containsString:](v4, "containsString:", CFSTR("nonsparse")) & 1) != 0
    || (-[__CFString containsString:](v4, "containsString:", CFSTR("timesync")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 56) + 26))
    {
      incr_val_for_key(*(void **)(a1 + 32), v4);
      incr_val_for_key(*(void **)(a1 + 32), CFSTR("total"));
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
    }
    v6 = (id)objc_msgSend(*(id *)(a1 + 64), "composedMessage");
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "evaluateWithObject:", *(_QWORD *)(a1 + 64));
  }

  return v5;
}

uint64_t __compact_logarchive_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "isKeptCatalog:", a2);
}

int *_compact_tracev3(int a1, uint64_t a2, const char *a3, uint64_t *a4, uint64_t a5, void *a6, void *a7, _QWORD *a8)
{
  void *v13;
  void *v14;
  char *v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  size_t v22;
  _QWORD *v23;
  unint64_t v24;
  unint64_t v25;
  id *v26;
  int v27;
  _BOOL8 v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  void *v34;
  int *result;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v40;
  id aBlock;
  void *v42;
  id obj;
  _QWORD v45[2];
  uint64_t (*v46)(uint64_t, uint64_t);
  void *v47;
  id v48;
  _QWORD *v49;
  uint64_t *v50;
  char *v51;
  _OWORD *v52;
  size_t v53;
  _OWORD v54[6];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  _QWORD v62[4];
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  __int128 value;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  aBlock = a6;
  v40 = a7;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingPathComponent:", v14);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0;
  v64 = &v63;
  v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__2934;
  v67 = __Block_byref_object_dispose__2935;
  v68 = 0;
  v38 = *a4;
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x2020000000;
  v62[3] = 0;
  v61 = 0;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  memset(v54, 0, sizeof(v54));
  v53 = 0;
  v15 = (char *)_os_trace_mmap_at();
  if (!v15)
  {
    v28 = _delete_trace_file(a1, a3, v53);
LABEL_41:

    _Block_object_dispose(v62, 8);
    _Block_object_dispose(&v63, 8);

    return (int *)v28;
  }
  v16 = openat(a1, "tmp", 1538, 420);
  v17 = v16;
  if (v16 != -1)
  {
    *(_OWORD *)((char *)v54 + 8) = xmmword_19EA7F230;
    *((_QWORD *)&v60 + 1) = 0;
    LODWORD(v60) = v16;
    DWORD1(v57) = 0x10000;
    *((_QWORD *)&v56 + 1) = _os_trace_malloc();
    v18 = _Block_copy(aBlock);
    v19 = (void *)*((_QWORD *)&v57 + 1);
    *((_QWORD *)&v57 + 1) = v18;

    v20 = _Block_copy(v40);
    v21 = (void *)v58;
    *(_QWORD *)&v58 = v20;

    *((_QWORD *)&v58 + 1) = *a4;
    v61 = a5;
    v22 = v53;
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v46 = ___compact_tracev3_block_invoke;
    v47 = &unk_1E4157FE0;
    v51 = v15;
    v48 = v42;
    v49 = v62;
    v52 = v54;
    v50 = &v63;
    v23 = v45;
    v24 = 0;
    do
    {
      if (v22 - v24 < 0x10)
        break;
      v25 = *(_QWORD *)&v15[v24 + 8];
      if (v22 - v24 - 16 < v25)
        break;
      if (!((unsigned int (*)(_QWORD *))v46)(v23))
        break;
      v24 = (v24 + v25 + 23) & 0xFFFFFFFFFFFFFFF8;
    }
    while (v24 - 1 < v22);

    v26 = (id *)(v64 + 5);
    if (v64[5]
      || (v31 = *((_QWORD *)&v58 + 1), v32 = *((_QWORD *)&v54[1] + 1), *a4 = *((_QWORD *)&v58 + 1), v32)
      && (obj = *v26, v33 = _repack_ttl_compact_close_catalog((uint64_t)v54, &obj), objc_storeStrong(v26, obj), !v33))
    {
      v27 = 0;
      goto LABEL_14;
    }
    if ((uint64_t)(*((_QWORD *)&v60 + 1) + DWORD2(v55)) > 1)
    {
      if (v31 != v38)
      {
        print_verbose("Removed %lu tracepoints\n", v31 - v38);
        if (faccessat(a1, a3, 0, 0) == -1)
        {
          create_repack_error(-1, CFSTR("Tmp file no longer accessible"));
          v36 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (lseek(v17, 0, 2) >= 1)
          {
            v34 = (void *)_os_trace_mmap();
            value = 0u;
            v70 = 0;
            LODWORD(value) = 1;
            v71 = -1;
            v72 = 0;
            _OSLogGenerateXattrs((uint64_t)v34, 0, (uint64_t)&value);
            if (munmap(v34, 0) == -1)
            {
              __error();
              _os_assumes_log();
            }
            if (fsetxattr(v17, "com.apple.logd.metadata", &value, 0x28uLL, 0, 0) == -1)
            {
              __error();
              _os_assumes_log();
            }
          }
          fsync(v17);
          if (renameat(a1, "tmp", a1, a3) != -1)
            goto LABEL_31;
          create_repack_error(-1, CFSTR("Failed to rename tmp to trace file"));
          v36 = objc_claimAutoreleasedReturnValue();
        }
        v30 = (void *)v64[5];
        v64[5] = v36;
        v27 = 1;
        goto LABEL_13;
      }
      print_verbose("No tracepoints removed. Keeping file as is\n");
    }
    else if (!_delete_trace_file(a1, a3, v53))
    {
      create_repack_error(-1, CFSTR("Nothing kept, but error deleting trace file"));
      v29 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_31:
    v27 = 0;
    v28 = 1;
    goto LABEL_32;
  }
  __error();
  _os_assumes_log();
  create_repack_error(-1, CFSTR("Failed to create tmp file"));
  v29 = objc_claimAutoreleasedReturnValue();
LABEL_12:
  v27 = 0;
  v30 = (void *)v64[5];
  v64[5] = v29;
LABEL_13:

LABEL_14:
  v28 = 0;
  if (a8)
    *a8 = objc_retainAutorelease((id)v64[5]);
LABEL_32:
  if (v17 < 1 || close(v17) != -1)
    goto LABEL_36;
  if (*__error() != 9)
  {
    __error();
    _os_assumes_log();
LABEL_36:
    if (v27 && unlinkat(a1, "tmp", 0) == -1)
    {
      __error();
      _os_assumes_log();
    }
    _repack_context_cleanup((uint64_t)v54);
    if (munmap(v15, v53) == -1)
    {
      __error();
      _os_assumes_log();
    }
    goto LABEL_41;
  }
  result = __error();
  v37 = *result;
  qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EE52EA88 = v37;
  __break(1u);
  return result;
}

void sub_19EA71404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,void *a46,void *a47)
{
  uint64_t v47;

  _Block_object_dispose((const void *)(v47 - 224), 8);
  _Block_object_dispose((const void *)(v47 - 192), 8);
  _Unwind_Resume(a1);
}

BOOL _delete_trace_file(int a1, const char *a2, uint64_t a3)
{
  int v5;
  FILE *v6;
  int *v7;

  v5 = unlinkat(a1, a2, 0);
  if (v5 == -1)
  {
    v6 = (FILE *)*MEMORY[0x1E0C80C10];
    v7 = __error();
    fprintf(v6, "Failed to unlink trace file %s: error: %d\n", a2, *v7);
  }
  else
  {
    print_verbose("Deleted trace file %s of size %lu\n", a2, a3);
  }
  return v5 != -1;
}

uint64_t ___compact_tracev3_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  id *v9;
  id v10;
  void *v11;
  id v12;
  int v13;
  int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id obj[4];
  id v22;
  uint64_t *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v4 = a2 - *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingFormat:", CFSTR("-%llu"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v6 = *(_QWORD **)(a1 + 64);
  v6[21] = v4;
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v8 + 40);
  v9 = (id *)(v8 + 40);
  v10 = v11;
  v12 = v5;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2934;
  v29 = __Block_byref_object_dispose__2935;
  v30 = 0;
  v13 = *(_DWORD *)a2;
  if (v7 == a2)
  {
    if (v13 == 4096 && *(_QWORD *)(a2 + 8) > 0x27uLL)
    {
      *v6 = a2 + 144;
      _repack_compact_add_iov((uint64_t)v6, a2);
      v6[20] = a2;
      goto LABEL_17;
    }
    create_repack_error(-1, CFSTR("Not a valid header"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v26[5];
    v26[5] = v15;

  }
  else if (v13 == 24589)
  {
    if (!v6[3] || !v6[5])
      goto LABEL_17;
    if (!(*(unsigned int (**)(void))(v6[18] + 16))())
      goto LABEL_16;
    v18 = v6[5];
    obj[0] = (id)MEMORY[0x1E0C809B0];
    obj[1] = (id)3221225472;
    obj[2] = ___compact_chunk_block_invoke;
    obj[3] = &unk_1E4158008;
    v24 = v6;
    v22 = v12;
    v23 = &v25;
    _tracev3_chunk_decompress_and_enumerate_chunks_helper(a2, v18, obj);
    v19 = v26[5];

    if (!v19)
    {
LABEL_16:
      v6[5] = *(_QWORD *)v6[5];
      goto LABEL_17;
    }
  }
  else
  {
    if (v13 != 24587)
    {
LABEL_17:
      v17 = 1;
      goto LABEL_18;
    }
    if (!v6[3]
      || (obj[0] = 0, v14 = _repack_ttl_compact_close_catalog((uint64_t)v6, obj), objc_storeStrong(&v30, obj[0]), v14))
    {
      _repack_ttl_compact_open_catalog((uint64_t)v6, a2);
      _OSLogUUIDMapAddFromCatalog(v6[3], *(_QWORD *)(v6[24] + 16));
      goto LABEL_17;
    }
  }
  v10 = objc_retainAutorelease((id)v26[5]);
  v17 = 0;
LABEL_18:
  _Block_object_dispose(&v25, 8);

  objc_storeStrong(v9, v10);
  return v17;
}

void sub_19EA7174C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___compact_chunk_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id obj;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v1 + 40);
  v2 = _compact_chunkset();
  objc_storeStrong((id *)(v1 + 40), obj);
  return v2;
}

void incr_val_for_key(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = a1;
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  if (v5)
    v6 = objc_msgSend(v5, "intValue") + 1;
  else
    v6 = 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, v3);

}

void _progress(void *a1, void *a2, uint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a1;
  objc_msgSend(v7, "setCompletedUnitCount:", objc_msgSend(v7, "completedUnitCount") + a3);
  v6 = v5[3];

  if (v6)
  {
    objc_msgSend(v7, "fractionCompleted");
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
  }

}

uint64_t ctf_create(int *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v11;
  __int128 v12;
  void *v13;
  __int128 v14;
  uint64_t v15;

  v2 = malloc_type_malloc(0x400uLL, 0xCFAB4140uLL);
  if (v2)
  {
    v7 = v2;
    v11 = ".SUNW_ctf";
    v12 = xmmword_19EA7F2B0;
    v13 = &ctf_create_hdr;
    v14 = xmmword_19EA7F2C0;
    v15 = 0;
    v8 = ctf_bufopen((__int128 *)&v11, 0, 0, a1, v3, v4, v5, v6);
    v9 = v8;
    if (v8)
    {
      *(_DWORD *)(v8 + 556) |= 4u;
      *(_QWORD *)(v8 + 576) = 128;
      bzero(v7, 0x400uLL);
      *(_QWORD *)(v9 + 568) = v7;
      *(_QWORD *)(v9 + 600) = 8;
      *(_OWORD *)(v9 + 608) = xmmword_19EA7F2B0;
    }
    else
    {
      free(v7);
    }
  }
  else
  {
    v9 = 0;
    if (a1)
      *a1 = 35;
  }
  return v9;
}

uint64_t ctf_update(_QWORD *a1)
{
  unsigned int v2;
  int v3;
  uint64_t v5;
  unsigned int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  int32x2_t *v17;
  char *v18;
  int64x2_t *v19;
  char *v20;
  __int32 *v21;
  __int32 v22;
  const char *v23;
  size_t v24;
  __int32 v25;
  size_t v26;
  int v27;
  __int32 v28;
  _QWORD *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  __int32 v34;
  uint64_t v35;
  __int32 v36;
  uint64_t v37;
  uint64_t v38;
  unsigned int v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char **v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  const char *v71;
  __int128 v72;
  char *v73;
  uint64_t v74;
  __int128 v75;
  _OWORD __dst[41];

  v2 = *((_DWORD *)a1 + 139);
  if ((v2 & 4) == 0)
  {
    v3 = 1039;
LABEL_3:
    *((_DWORD *)a1 + 140) = v3;
    return 0xFFFFFFFFLL;
  }
  if ((v2 & 8) != 0)
  {
    memset(__dst, 0, 512);
    v5 = a1[74];
    if (v5)
    {
      v6 = 0;
      do
      {
        v7 = *(_DWORD *)(v5 + 44);
        v8 = *(_DWORD *)(v5 + 48);
        if (v8 == (*(unsigned int (**)(void))(*a1 + 64))())
          v9 = 20;
        else
          v9 = 12;
        v6 += v9;
        v10 = v7 & 0x3FF;
        switch((unsigned __int16)v7 >> 11)
        {
          case 1:
          case 2:
          case 14:
            v6 += 4;
            break;
          case 4:
            v6 += 12;
            break;
          case 5:
            v6 += 4 * (v10 + (v7 & 1));
            break;
          case 6:
          case 7:
            v11 = v6 + 16 * v10;
            v12 = v6 + 12 * v10;
            if (*(_DWORD *)(v5 + 48) >> 13)
              v6 = v11;
            else
              v6 = v12;
            break;
          case 8:
            v6 += 8 * v10;
            break;
          default:
            break;
        }
        v5 = *(_QWORD *)(v5 + 8);
      }
      while (v5);
    }
    else
    {
      v6 = 0;
    }
    v13 = *((unsigned int *)a1 + 150);
    v14 = (char *)mmap(0, v13 + v6 + 36, 3, 4098, -1, 0);
    if (v14 == (char *)-1)
    {
      v3 = 35;
      goto LABEL_3;
    }
    v15 = v14;
    v69 = v13 + v6 + 36;
    v16 = v6;
    v70 = 0;
    *(_WORD *)v14 = -12303;
    v14[2] = 4;
    v14[7] = 0;
    *(_DWORD *)(v14 + 3) = 0;
    *((_DWORD *)v14 + 2) = (v2 >> 1) & 1;
    *(_QWORD *)(v14 + 20) = 0;
    *(_QWORD *)(v14 + 12) = 0;
    *((_DWORD *)v14 + 7) = v6;
    *((_DWORD *)v14 + 8) = v13;
    v17 = (int32x2_t *)(v14 + 36);
    v18 = &v14[v16 + 36];
    *(_QWORD *)v18 = 0x544E4552415000;
    v19 = (int64x2_t *)a1[74];
    if (v19)
    {
      v20 = v18 + 8;
      while (2)
      {
        v21 = &v19[2].i32[2];
        v22 = v19[2].i32[3];
        v23 = (const char *)v19[1].i64[1];
        if (v23)
        {
          *v21 = (_DWORD)v20 - (_DWORD)v18;
          v24 = strlen(v23) + 1;
          v14 = (char *)memmove(v20, v23, v24);
          v20 += v24;
        }
        else
        {
          *v21 = 0;
        }
        v25 = v19[3].i32[0];
        if (v25 == (*(unsigned int (**)(char *))(*a1 + 64))(v14))
          v26 = 20;
        else
          v26 = 12;
        v14 = (char *)memmove(v17, &v19[2].u64[1], v26);
        v17 = (int32x2_t *)((char *)v17 + v26);
        switch((unsigned __int16)v22 >> 11)
        {
          case 1:
          case 2:
            v27 = (v19[4].i32[1] << 16) | (v19[4].i32[0] << 24);
            v28 = v19[4].i32[2];
            goto LABEL_54;
          case 4:
            v36 = v19[5].i32[0];
            *v17 = vmovn_s64(v19[4]);
            v17[1].i32[0] = v36;
            v17 = (int32x2_t *)((char *)v17 + 12);
            goto LABEL_66;
          case 5:
            if ((v22 & 0x3FF) != 0)
            {
              v37 = 0;
              do
              {
                v17->i32[0] = *(_QWORD *)(v19[4].i64[0] + v37);
                v17 = (int32x2_t *)((char *)v17 + 4);
                v37 += 8;
              }
              while (8 * (v22 & 0x3FF) != v37);
            }
            if ((v22 & 1) != 0)
            {
              v17->i32[0] = 0;
              v17 = (int32x2_t *)((char *)v17 + 4);
            }
            goto LABEL_66;
          case 6:
          case 7:
            v29 = (_QWORD *)v19[4].i64[1];
            if ((unsigned __int32)v19[3].i32[0] >> 13)
            {
              if (v29)
              {
                v42 = ((_DWORD)v20 - (_DWORD)v18);
                do
                {
                  v43 = (const char *)v29[2];
                  if (v43)
                  {
                    v44 = v42 + strlen(v43) + 1;
                  }
                  else
                  {
                    v44 = v42;
                    LODWORD(v42) = 0;
                  }
                  v46 = v29[3];
                  v45 = v29[4];
                  if (*((_DWORD *)a1 + 141) == 4)
                    v17->i32[1] = v46;
                  else
                    v17->i32[1] = (unsigned __int16)v46;
                  v17->i32[0] = v42;
                  v17[1].i32[0] = HIDWORD(v45);
                  v17[1].i32[1] = v45;
                  v17 += 2;
                  v29 = (_QWORD *)v29[1];
                  v42 = v44;
                }
                while (v29);
              }
            }
            else if (v29)
            {
              v30 = ((_DWORD)v20 - (_DWORD)v18);
              do
              {
                v31 = (const char *)v29[2];
                if (v31)
                {
                  v32 = v30 + strlen(v31) + 1;
                }
                else
                {
                  v32 = v30;
                  LODWORD(v30) = 0;
                }
                v33 = v29[3];
                if (*((_DWORD *)a1 + 141) == 4)
                {
                  v34 = *((unsigned __int16 *)v29 + 16);
                  v17->i32[0] = v30;
                  v17->i32[1] = v33;
                  v17[1].i32[0] = v34;
                  v35 = 12;
                }
                else
                {
                  *v17 = (int32x2_t)(((unint64_t)(unsigned __int16)v29[3] << 32) | (v29[4] << 48) | v30);
                  v35 = 8;
                }
                v17 = (int32x2_t *)((char *)v17 + v35);
                v29 = (_QWORD *)v29[1];
                v30 = v32;
              }
              while (v29);
            }
            goto LABEL_64;
          case 8:
            v38 = v19[4].i64[1];
            if (v38)
            {
              v39 = (_DWORD)v20 - (_DWORD)v18;
              do
              {
                v40 = strlen(*(const char **)(v38 + 16));
                v41 = v39;
                v39 += v40 + 1;
                *v17++ = (int32x2_t)(v41 | ((unint64_t)*(unsigned int *)(v38 + 40) << 32));
                v38 = *(_QWORD *)(v38 + 8);
              }
              while (v38);
LABEL_64:
              v47 = v19[4].i64[1];
            }
            else
            {
              v47 = 0;
            }
            v14 = ctf_copy_membnames(v47, v20);
            v20 = v14;
LABEL_66:
            v19 = (int64x2_t *)v19->i64[1];
            if (!v19)
              break;
            continue;
          case 14:
            v27 = (v19[4].u8[4] << 24) | (v19[4].u8[0] << 16);
            v28 = v19[4].u16[1];
LABEL_54:
            v17->i32[0] = v27 | v28;
            v17 = (int32x2_t *)((char *)v17 + 4);
            goto LABEL_66;
          default:
            goto LABEL_66;
        }
        break;
      }
    }
    mprotect(v15, v69, 1);
    v71 = ".SUNW_ctf";
    v72 = xmmword_19EA7F2B0;
    v73 = v15;
    v74 = v69;
    v75 = xmmword_19EA7F2B0;
    v52 = ctf_bufopen((__int128 *)&v71, 0, 0, &v70, v48, v49, v50, v51);
    if (!v52)
    {
      munmap(v15, v69);
      v3 = v70;
      goto LABEL_3;
    }
    v59 = v52;
    v60 = &_libctf_models;
    while (*((_DWORD *)v60 + 2) != *(_DWORD *)(a1[65] + 8))
    {
      v61 = v60[7];
      v60 += 7;
      if (!v61)
      {
        *(_DWORD *)(v52 + 560) = 22;
        goto LABEL_77;
      }
    }
    *(_QWORD *)(v52 + 520) = v60;
LABEL_77:
    ctf_import(v52, a1[66], v53, v54, v55, v56, v57, v58);
    *(_DWORD *)(v59 + 552) = *((_DWORD *)a1 + 138);
    *(_DWORD *)(v59 + 556) |= *((_DWORD *)a1 + 139) & 0xFFFFFFF7;
    *(_QWORD *)(v59 + 32) = 0;
    *(_QWORD *)(v59 + 568) = a1[71];
    *(_QWORD *)(v59 + 576) = a1[72];
    *(_OWORD *)(v59 + 584) = *(_OWORD *)(a1 + 73);
    *(_OWORD *)(v59 + 600) = *(_OWORD *)(a1 + 75);
    *(_QWORD *)(v59 + 616) = a1[76] - 1;
    *(_QWORD *)(v59 + 624) = a1[78];
    *(_OWORD *)(a1 + 71) = 0u;
    *(_OWORD *)(a1 + 73) = 0u;
    memcpy(__dst, a1, 0x278uLL);
    memmove(a1, (const void *)v59, 0x278uLL);
    memcpy((void *)v59, __dst, 0x278uLL);
    a1[40] = a1 + 22;
    a1[43] = a1 + 26;
    a1[46] = a1 + 30;
    a1[49] = a1 + 34;
    *(_DWORD *)(v59 + 552) = 1;
    ctf_close(v59, v62, v63, v64, v65, v66, v67, v68);
  }
  return 0;
}

char *ctf_copy_membnames(uint64_t a1, char *a2)
{
  uint64_t v3;
  const void *v4;
  size_t v5;

  if (a1)
  {
    v3 = a1;
    do
    {
      v4 = *(const void **)(v3 + 16);
      if (v4)
      {
        v5 = strlen(*(const char **)(v3 + 16)) + 1;
        memmove(a2, v4, v5);
        a2 += v5;
      }
      v3 = *(_QWORD *)(v3 + 8);
    }
    while (v3);
  }
  return a2;
}

_QWORD *ctf_dtd_insert(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v2 = (result[72] - 1) & a2[4];
  v3 = result[71];
  a2[2] = *(_QWORD *)(v3 + 8 * v2);
  *(_QWORD *)(v3 + 8 * v2) = a2;
  v4 = result + 73;
  v5 = (_QWORD *)result[73];
  result[73] = a2;
  *a2 = v5;
  a2[1] = 0;
  if (v5)
    v4 = v5;
  v4[1] = a2;
  return result;
}

void ctf_dtd_delete(_QWORD *a1, unsigned int *a2)
{
  _QWORD *v4;
  _QWORD *v5;
  unsigned int *v6;
  BOOL v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  size_t v12;
  uint64_t v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  size_t v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;

  v4 = (_QWORD *)(a1[71] + 8 * ((a1[72] - 1) & *((_QWORD *)a2 + 4)));
  do
  {
    v5 = v4;
    v6 = (unsigned int *)*v4;
    v4 = (_QWORD *)(*v4 + 16);
    if (v6)
      v7 = v6 == a2;
    else
      v7 = 1;
  }
  while (!v7);
  if (v6)
    *v5 = *v4;
  v8 = (unsigned __int16)a2[11] >> 11;
  switch((unsigned __int16)a2[11] >> 11)
  {
    case 3:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
      v9 = a2[12];
      goto LABEL_11;
    case 4:
      ctf_ref_dec((uint64_t)a1, *((_QWORD *)a2 + 8));
      v9 = *((_QWORD *)a2 + 9);
LABEL_11:
      ctf_ref_dec((uint64_t)a1, v9);
      break;
    case 5:
      ctf_ref_dec((uint64_t)a1, a2[12]);
      v14 = a2[11];
      if ((v14 & 0x3FF) != 0)
      {
        v15 = 0;
        do
        {
          v16 = *(_QWORD *)(*((_QWORD *)a2 + 8) + 8 * v15);
          if (v16)
          {
            ctf_ref_dec((uint64_t)a1, v16);
            v14 = a2[11];
          }
          ++v15;
        }
        while (v15 < (v14 & 0x3FF));
      }
      free(*((void **)a2 + 8));
      break;
    case 6:
    case 7:
    case 8:
      v10 = *((_QWORD *)a2 + 9);
      if (v10)
      {
        do
        {
          v11 = *(void **)(v10 + 16);
          if (v11)
          {
            v12 = ~strlen(*(const char **)(v10 + 16));
            free(v11);
            a1[75] += v12;
          }
          if (v8 != 8)
            ctf_ref_dec((uint64_t)a1, *(_QWORD *)(v10 + 24));
          v13 = *(_QWORD *)(v10 + 8);
          free((void *)v10);
          v10 = v13;
        }
        while (v13);
      }
      break;
    default:
      break;
  }
  v17 = (void *)*((_QWORD *)a2 + 3);
  if (v17)
  {
    v18 = ~strlen(*((const char **)a2 + 3));
    free(v17);
    a1[75] += v18;
  }
  v19 = a1 + 73;
  v20 = *(_QWORD *)a2;
  if (*(_QWORD *)a2)
    v21 = *(_QWORD **)a2;
  else
    v21 = a1 + 73;
  v21[1] = *((_QWORD *)a2 + 1);
  if (*((_QWORD *)a2 + 1))
    v19 = (_QWORD *)*((_QWORD *)a2 + 1);
  *v19 = v20;
  free(a2);
}

uint64_t ctf_ref_dec(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(result + 568);
  if (v2)
  {
    v3 = *(_QWORD *)(v2 + 8 * ((*(_QWORD *)(result + 576) - 1) & a2));
    if (v3)
    {
      while (*(_QWORD *)(v3 + 32) != a2)
      {
        v3 = *(_QWORD *)(v3 + 16);
        if (!v3)
          return result;
      }
      if ((*(_BYTE *)(result + 556) & 4) != 0)
        --*(_DWORD *)(v3 + 60);
    }
  }
  return result;
}

uint64_t ctf_dtd_lookup(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 568);
  if (!v2)
    return 0;
  for (result = *(_QWORD *)(v2 + 8 * ((*(_QWORD *)(a1 + 576) - 1) & a2)); result; result = *(_QWORD *)(result + 16))
  {
    if (*(_QWORD *)(result + 32) == a2)
      break;
  }
  return result;
}

uint64_t ctf_discard(uint64_t a1)
{
  int v2;
  uint64_t result;
  unsigned int *v4;
  unsigned int *v5;

  v2 = *(_DWORD *)(a1 + 556);
  if ((v2 & 4) != 0)
  {
    if ((v2 & 8) != 0)
    {
      v4 = *(unsigned int **)(a1 + 584);
      if (v4)
      {
        do
        {
          v5 = *(unsigned int **)v4;
          if (*(_QWORD *)(a1 + 616) < (unint64_t)(*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 40))(*((_QWORD *)v4 + 4)))
            ctf_dtd_delete((_QWORD *)a1, v4);
          v4 = v5;
        }
        while (v5);
        v2 = *(_DWORD *)(a1 + 556);
      }
      result = 0;
      *(_QWORD *)(a1 + 608) = *(_QWORD *)(a1 + 616) + 1;
      *(_DWORD *)(a1 + 556) = v2 & 0xFFFFFFF7;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    *(_DWORD *)(a1 + 560) = 1039;
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t ctf_add_integer(uint64_t a1, unsigned int a2, const char *a3, uint64_t a4)
{
  return ctf_add_encoded(a1, a2, a3, a4, 1);
}

uint64_t ctf_add_encoded(uint64_t a1, unsigned int a2, const char *a3, uint64_t a4, int a5)
{
  uint64_t result;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;

  if (a4)
  {
    v14 = 0;
    result = ctf_add_generic(a1, a2, a3, &v14);
    if (result != -1)
    {
      v9 = (-(-*(_DWORD *)(a4 + 8) & 0xFFFFFFF8) >> 3) - 1;
      v10 = v9 | (v9 >> 1) | ((v9 | (v9 >> 1)) >> 2);
      v11 = v10 | (v10 >> 4) | ((v10 | (v10 >> 4)) >> 8);
      v12 = v14;
      *(_DWORD *)(v14 + 44) = ((a2 != 0) << 10) | (a5 << 11);
      *(_DWORD *)(v12 + 48) = ((v11 >> 16) | v11) + 1;
      v13 = *(_DWORD *)(a4 + 8);
      *(_QWORD *)(v12 + 64) = *(_QWORD *)a4;
      *(_DWORD *)(v12 + 72) = v13;
    }
  }
  else
  {
    *(_DWORD *)(a1 + 560) = 22;
    return -1;
  }
  return result;
}

uint64_t ctf_add_generic(uint64_t a1, unsigned int a2, const char *a3, _QWORD *a4)
{
  int v5;
  _OWORD *v8;
  _OWORD *v9;
  char *v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (a2 >= 2)
  {
    v5 = 22;
LABEL_13:
    *(_DWORD *)(a1 + 560) = v5;
    return -1;
  }
  if ((*(_BYTE *)(a1 + 556) & 4) == 0)
  {
    v5 = 1039;
    goto LABEL_13;
  }
  if ((*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)a1 + 48))(*(unsigned int *)(a1 + 608), 1) >= 0xFFFFFFFFLL)
  {
    v5 = 1041;
    goto LABEL_13;
  }
  v8 = malloc_type_malloc(0x58uLL, 0xCFAB4140uLL);
  if (!v8)
  {
LABEL_12:
    v5 = 35;
    goto LABEL_13;
  }
  v9 = v8;
  if (a3 && *a3)
  {
    v10 = ctf_strdup(a3);
    if (!v10)
    {
      free(v9);
      goto LABEL_12;
    }
  }
  else
  {
    v10 = 0;
  }
  ++*(_QWORD *)(a1 + 608);
  v11 = (*(uint64_t (**)(void))(*(_QWORD *)a1 + 48))();
  *v9 = 0u;
  v9[1] = 0u;
  v9[2] = 0u;
  v9[3] = 0u;
  v9[4] = 0u;
  *((_QWORD *)v9 + 10) = 0;
  *((_QWORD *)v9 + 3) = v10;
  *((_QWORD *)v9 + 4) = v11;
  if (v10)
    *(_QWORD *)(a1 + 600) += strlen(v10) + 1;
  v13 = (*(_QWORD *)(a1 + 576) - 1) & v11;
  v14 = *(_QWORD *)(a1 + 568);
  *((_QWORD *)v9 + 2) = *(_QWORD *)(v14 + 8 * v13);
  *(_QWORD *)(v14 + 8 * v13) = v9;
  v15 = a1 + 584;
  v16 = *(_QWORD *)(a1 + 584);
  *(_QWORD *)(a1 + 584) = v9;
  *(_QWORD *)v9 = v16;
  *((_QWORD *)v9 + 1) = 0;
  if (v16)
    v15 = v16;
  *(_QWORD *)(v15 + 8) = v9;
  *(_DWORD *)(a1 + 556) |= 8u;
  *a4 = v9;
  return v11;
}

uint64_t ctf_add_float(uint64_t a1, unsigned int a2, const char *a3, uint64_t a4)
{
  return ctf_add_encoded(a1, a2, a3, a4, 2);
}

uint64_t ctf_add_pointer(uint64_t a1, unsigned int a2, uint64_t a3)
{
  return ctf_add_reftype(a1, a2, a3, 3);
}

uint64_t ctf_add_reftype(uint64_t a1, unsigned int a2, uint64_t a3, int a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  if (a3 == -1 || a3 >= 0xFFFFFFFFLL)
  {
    *(_DWORD *)(a1 + 560) = 22;
    return -1;
  }
  else
  {
    v11 = 0;
    v8 = ctf_add_generic(a1, a2, 0, &v11);
    if (v8 != -1)
    {
      ctf_ref_inc(a1, a3);
      v9 = v11;
      *(_DWORD *)(v11 + 44) = ((a2 != 0) << 10) | (a4 << 11);
      *(_DWORD *)(v9 + 48) = a3;
    }
  }
  return v8;
}

uint64_t ctf_ref_inc(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(result + 568);
  if (v2)
  {
    v3 = *(_QWORD *)(v2 + 8 * ((*(_QWORD *)(result + 576) - 1) & a2));
    if (v3)
    {
      while (*(_QWORD *)(v3 + 32) != a2)
      {
        v3 = *(_QWORD *)(v3 + 16);
        if (!v3)
          return result;
      }
      if ((*(_BYTE *)(result + 556) & 4) != 0)
        ++*(_DWORD *)(v3 + 60);
    }
  }
  return result;
}

uint64_t ctf_add_array(uint64_t a1, unsigned int a2, uint64_t *a3)
{
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;

  if (!a3)
  {
    v10 = 22;
LABEL_20:
    *(_DWORD *)(a1 + 560) = v10;
    return -1;
  }
  v17 = a1;
  if (!ctf_lookup_by_id((uint64_t)&v17, *a3))
  {
    v11 = *(_QWORD *)(a1 + 568);
    if (!v11 || (v12 = *(_QWORD *)(v11 + 8 * ((*(_QWORD *)(a1 + 576) - 1) & *a3))) == 0)
    {
LABEL_19:
      v10 = 1020;
      goto LABEL_20;
    }
    while (*(_QWORD *)(v12 + 32) != *a3)
    {
      v12 = *(_QWORD *)(v12 + 16);
      if (!v12)
        goto LABEL_19;
    }
  }
  v17 = a1;
  if (!ctf_lookup_by_id((uint64_t)&v17, a3[1]))
  {
    v13 = *(_QWORD *)(a1 + 568);
    if (v13)
    {
      v14 = a3[1];
      v15 = *(_QWORD *)(v13 + 8 * ((*(_QWORD *)(a1 + 576) - 1) & v14));
      if (v15)
      {
        while (*(_QWORD *)(v15 + 32) != v14)
        {
          v15 = *(_QWORD *)(v15 + 16);
          if (!v15)
            goto LABEL_19;
        }
        goto LABEL_4;
      }
    }
    goto LABEL_19;
  }
LABEL_4:
  v18 = 0;
  v6 = ctf_add_generic(a1, a2, 0, &v18);
  if (v6 != -1)
  {
    if (a2)
      v7 = 9216;
    else
      v7 = 0x2000;
    v8 = v18;
    *(_DWORD *)(v18 + 44) = v7;
    *(_DWORD *)(v8 + 48) = 0;
    v9 = a3[2];
    *(_OWORD *)(v8 + 64) = *(_OWORD *)a3;
    *(_QWORD *)(v8 + 80) = v9;
    ctf_ref_inc(a1, *a3);
    ctf_ref_inc(a1, a3[1]);
  }
  return v6;
}

uint64_t ctf_set_array(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;
  uint64_t i;
  int v7;
  __int128 v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = *(_QWORD *)(a1 + 568);
  if (v5)
  {
    for (i = *(_QWORD *)(v5 + 8 * ((*(_QWORD *)(a1 + 576) - 1) & a2)); i; i = *(_QWORD *)(i + 16))
    {
      if (*(_QWORD *)(i + 32) == a2)
        break;
    }
  }
  else
  {
    i = 0;
  }
  if ((*(_BYTE *)(a1 + 556) & 4) != 0)
  {
    if (!i || (*(_DWORD *)(i + 44) & 0xF800) != 0x2000)
      goto LABEL_23;
    v15 = a1;
    if (!ctf_lookup_by_id((uint64_t)&v15, *a3))
    {
      v10 = *(_QWORD *)(a1 + 568);
      if (!v10)
        goto LABEL_23;
      v11 = *(_QWORD *)(v10 + 8 * ((*(_QWORD *)(a1 + 576) - 1) & *a3));
      if (!v11)
        goto LABEL_23;
      while (*(_QWORD *)(v11 + 32) != *a3)
      {
        v11 = *(_QWORD *)(v11 + 16);
        if (!v11)
          goto LABEL_23;
      }
    }
    v15 = a1;
    if (ctf_lookup_by_id((uint64_t)&v15, a3[1]))
    {
LABEL_13:
      ctf_ref_dec(a1, *(_QWORD *)(i + 64));
      ctf_ref_dec(a1, *(_QWORD *)(i + 72));
      *(_DWORD *)(a1 + 556) |= 8u;
      v8 = *(_OWORD *)a3;
      *(_QWORD *)(i + 80) = a3[2];
      *(_OWORD *)(i + 64) = v8;
      ctf_ref_inc(a1, *a3);
      ctf_ref_inc(a1, a3[1]);
      return 0;
    }
    v12 = *(_QWORD *)(a1 + 568);
    if (v12)
    {
      v13 = a3[1];
      v14 = *(_QWORD *)(v12 + 8 * ((*(_QWORD *)(a1 + 576) - 1) & v13));
      if (v14)
      {
        while (*(_QWORD *)(v14 + 32) != v13)
        {
          v14 = *(_QWORD *)(v14 + 16);
          if (!v14)
            goto LABEL_23;
        }
        goto LABEL_13;
      }
    }
LABEL_23:
    v7 = 1020;
    goto LABEL_24;
  }
  v7 = 1039;
LABEL_24:
  *(_DWORD *)(a1 + 560) = v7;
  return 0xFFFFFFFFLL;
}

uint64_t ctf_add_function(uint64_t a1, unsigned int a2, uint64_t a3, _QWORD *a4)
{
  unsigned int v6;
  int v9;
  int v10;
  uint64_t v11;
  unsigned int v13;
  unint64_t i;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  size_t v25;
  uint64_t v26;
  uint64_t v27;

  if (!a3 || (v6 = *(_DWORD *)(a3 + 12), v6 > 1) || (v9 = *(_DWORD *)(a3 + 8), !a4) && v9)
  {
    v10 = 22;
LABEL_6:
    *(_DWORD *)(a1 + 560) = v10;
    return -1;
  }
  if (v6)
    v13 = v9 + 1;
  else
    v13 = *(_DWORD *)(a3 + 8);
  if (v13 >= 0x400)
  {
    v10 = 84;
    goto LABEL_6;
  }
  v26 = a1;
  if (!ctf_lookup_by_id((uint64_t)&v26, *(_QWORD *)a3))
  {
    v18 = *(_QWORD *)(a1 + 568);
    if (!v18 || (v19 = *(_QWORD *)(v18 + 8 * ((*(_QWORD *)(a1 + 576) - 1) & *(_QWORD *)a3))) == 0)
    {
LABEL_28:
      v10 = 1020;
      goto LABEL_6;
    }
    while (*(_QWORD *)(v19 + 32) != *(_QWORD *)a3)
    {
      v19 = *(_QWORD *)(v19 + 16);
      if (!v19)
        goto LABEL_28;
    }
  }
  if (*(_DWORD *)(a3 + 8))
  {
    for (i = 0; i < *(unsigned int *)(a3 + 8); ++i)
    {
      v26 = a1;
      if (!ctf_lookup_by_id((uint64_t)&v26, a4[i]))
      {
        v15 = *(_QWORD *)(a1 + 568);
        if (!v15)
          goto LABEL_28;
        v16 = a4[i];
        v17 = *(_QWORD *)(v15 + 8 * ((*(_QWORD *)(a1 + 576) - 1) & v16));
        if (!v17)
          goto LABEL_28;
        while (*(_QWORD *)(v17 + 32) != v16)
        {
          v17 = *(_QWORD *)(v17 + 16);
          if (!v17)
            goto LABEL_28;
        }
      }
    }
  }
  if (v13)
  {
    v20 = malloc_type_malloc(8 * v13, 0xCFAB4140uLL);
    if (!v20)
    {
      v10 = 35;
      goto LABEL_6;
    }
  }
  else
  {
    v20 = 0;
  }
  v27 = 0;
  v11 = ctf_add_generic(a1, a2, 0, &v27);
  if (v11 == -1)
  {
    free(v20);
  }
  else
  {
    if (a2)
      v21 = 11264;
    else
      v21 = 10240;
    v22 = v27;
    *(_DWORD *)(v27 + 44) = v21 & 0xFFFFFC00 | v13 & 0x3FF;
    *(_DWORD *)(v22 + 48) = *(_QWORD *)a3;
    ctf_ref_inc(a1, *(_QWORD *)a3);
    if (*(_DWORD *)(a3 + 8))
    {
      v23 = 0;
      do
      {
        ctf_ref_inc(a1, a4[v23++]);
        v24 = *(unsigned int *)(a3 + 8);
      }
      while (v23 < v24);
      v25 = 8 * v24;
    }
    else
    {
      v25 = 0;
    }
    memmove(v20, a4, v25);
    if ((*(_BYTE *)(a3 + 12) & 1) != 0)
      *((_QWORD *)v20 + v13 - 1) = 0;
    *(_QWORD *)(v22 + 64) = v20;
  }
  return v11;
}

uint64_t ctf_add_struct(uint64_t a1, unsigned int a2, char *__s)
{
  size_t v6;
  _DWORD *v7;
  _DWORD *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;

  if (__s
    && (v6 = strlen(__s), (v7 = ctf_hash_lookup(a1 + 176, a1, __s, v6)) != 0)
    && (v8 = v7, ctf_type_kind(a1, v7[1]) == 9))
  {
    result = v8[1];
    v10 = *(_QWORD *)(a1 + 568) + 8 * ((*(_DWORD *)(a1 + 576) - 1) & result);
    do
    {
      v11 = *(_QWORD *)v10;
      v12 = *(_QWORD *)(*(_QWORD *)v10 + 32);
      v10 = *(_QWORD *)v10 + 16;
    }
    while (v12 != result);
  }
  else
  {
    v14 = 0;
    result = ctf_add_generic(a1, a2, __s, &v14);
    if (result == -1)
      return result;
    v11 = v14;
  }
  if (a2)
    v13 = 13312;
  else
    v13 = 12288;
  *(_DWORD *)(v11 + 44) = v13;
  *(_DWORD *)(v11 + 48) = 0;
  return result;
}

uint64_t ctf_add_union(uint64_t a1, unsigned int a2, char *__s)
{
  size_t v6;
  _DWORD *v7;
  _DWORD *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;

  if (__s
    && (v6 = strlen(__s), (v7 = ctf_hash_lookup(a1 + 208, a1, __s, v6)) != 0)
    && (v8 = v7, ctf_type_kind(a1, v7[1]) == 9))
  {
    result = v8[1];
    v10 = *(_QWORD *)(a1 + 568) + 8 * ((*(_DWORD *)(a1 + 576) - 1) & result);
    do
    {
      v11 = *(_QWORD *)v10;
      v12 = *(_QWORD *)(*(_QWORD *)v10 + 32);
      v10 = *(_QWORD *)v10 + 16;
    }
    while (v12 != result);
  }
  else
  {
    v14 = 0;
    result = ctf_add_generic(a1, a2, __s, &v14);
    if (result == -1)
      return result;
    v11 = v14;
  }
  if (a2)
    v13 = 15360;
  else
    v13 = 14336;
  *(_DWORD *)(v11 + 44) = v13;
  *(_DWORD *)(v11 + 48) = 0;
  return result;
}

uint64_t ctf_add_enum(uint64_t a1, unsigned int a2, char *a3)
{
  return ctf_add_enum_sized(a1, a2, a3, *(unsigned __int16 *)(*(_QWORD *)(a1 + 520) + 40));
}

uint64_t ctf_add_enum_sized(uint64_t a1, unsigned int a2, char *__s, int a4)
{
  size_t v8;
  _DWORD *v9;
  _DWORD *v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;

  if (__s
    && (v8 = strlen(__s), (v9 = ctf_hash_lookup(a1 + 240, a1, __s, v8)) != 0)
    && (v10 = v9, ctf_type_kind(a1, v9[1]) == 9))
  {
    result = v10[1];
    v12 = *(_QWORD *)(a1 + 568) + 8 * ((*(_DWORD *)(a1 + 576) - 1) & result);
    do
    {
      v13 = *(_QWORD *)v12;
      v14 = *(_QWORD *)(*(_QWORD *)v12 + 32);
      v12 = *(_QWORD *)v12 + 16;
    }
    while (v14 != result);
  }
  else
  {
    v16 = 0;
    result = ctf_add_generic(a1, a2, __s, &v16);
    if (result == -1)
      return result;
    v13 = v16;
  }
  if (a2)
    v15 = 17408;
  else
    v15 = 0x4000;
  *(_DWORD *)(v13 + 44) = v15;
  *(_DWORD *)(v13 + 48) = a4;
  return result;
}

uint64_t ctf_add_forward(uint64_t a1, unsigned int a2, char *__s, int a4)
{
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  size_t v9;
  _DWORD *v10;
  uint64_t result;
  const char *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;

  v6 = a2;
  v7 = a1;
  switch(a4)
  {
    case 8:
      v8 = a1 + 240;
      if (__s)
        goto LABEL_7;
      break;
    case 7:
      v8 = a1 + 208;
      if (__s)
        goto LABEL_7;
      break;
    case 6:
      v8 = a1 + 176;
      if (!__s)
        break;
LABEL_7:
      v9 = strlen(__s);
      v10 = ctf_hash_lookup(v8, v7, __s, v9);
      if (v10)
        return v10[1];
      v15 = 0;
      a1 = v7;
      a2 = v6;
      v12 = __s;
      goto LABEL_13;
    default:
      *(_DWORD *)(a1 + 560) = 1023;
      return -1;
  }
  v15 = 0;
  v12 = 0;
LABEL_13:
  result = ctf_add_generic(a1, a2, v12, &v15);
  if (result != -1)
  {
    v13 = v15;
    if (v6)
      v14 = 19456;
    else
      v14 = 18432;
    *(_DWORD *)(v15 + 44) = v14;
    *(_DWORD *)(v13 + 48) = a4;
  }
  return result;
}

uint64_t ctf_add_typedef(uint64_t a1, unsigned int a2, const char *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v14 = a1;
  if (a4 == -1)
    goto LABEL_12;
  if (!ctf_lookup_by_id((uint64_t)&v14, a4))
  {
    v11 = *(_QWORD *)(a1 + 568);
    if (v11)
    {
      v12 = *(_QWORD *)(v11 + 8 * ((*(_QWORD *)(a1 + 576) - 1) & a4));
      if (v12)
      {
        while (*(_QWORD *)(v12 + 32) != a4)
        {
          v12 = *(_QWORD *)(v12 + 16);
          if (!v12)
            goto LABEL_12;
        }
        goto LABEL_3;
      }
    }
LABEL_12:
    *(_DWORD *)(a1 + 560) = 22;
    return -1;
  }
LABEL_3:
  v15 = 0;
  v8 = ctf_add_generic(a1, a2, a3, &v15);
  if (v8 != -1)
  {
    v9 = v15;
    if (a2)
      v10 = 21504;
    else
      v10 = 20480;
    *(_DWORD *)(v15 + 44) = v10;
    *(_DWORD *)(v9 + 48) = a4;
    ctf_ref_inc(a1, a4);
  }
  return v8;
}

uint64_t ctf_add_volatile(uint64_t a1, unsigned int a2, uint64_t a3)
{
  return ctf_add_reftype(a1, a2, a3, 11);
}

uint64_t ctf_add_const(uint64_t a1, unsigned int a2, uint64_t a3)
{
  return ctf_add_reftype(a1, a2, a3, 12);
}

uint64_t ctf_add_restrict(uint64_t a1, unsigned int a2, uint64_t a3)
{
  return ctf_add_reftype(a1, a2, a3, 13);
}

uint64_t ctf_add_enumerator(uint64_t a1, uint64_t a2, char *__s2, int a4)
{
  uint64_t v7;
  uint64_t i;
  int v9;
  int v10;
  uint64_t result;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  size_t v18;

  v7 = *(_QWORD *)(a1 + 568);
  if (!v7)
  {
    i = 0;
    if (__s2)
      goto LABEL_6;
LABEL_9:
    v9 = 22;
    goto LABEL_16;
  }
  for (i = *(_QWORD *)(v7 + 8 * ((*(_QWORD *)(a1 + 576) - 1) & a2)); i; i = *(_QWORD *)(i + 16))
  {
    if (*(_QWORD *)(i + 32) == a2)
      break;
  }
  if (!__s2)
    goto LABEL_9;
LABEL_6:
  if ((*(_BYTE *)(a1 + 556) & 4) == 0)
  {
    v9 = 1039;
LABEL_16:
    *(_DWORD *)(a1 + 560) = v9;
    return 0xFFFFFFFFLL;
  }
  if (!i)
  {
    v9 = 1020;
    goto LABEL_16;
  }
  v10 = *(_DWORD *)(i + 44);
  if ((v10 & 0xF800) != 0x4000)
  {
    v9 = 1022;
    goto LABEL_16;
  }
  if ((~v10 & 0x3FF) == 0)
  {
    v9 = 1040;
    goto LABEL_16;
  }
  v12 = *(_QWORD *)(i + 72);
  if (v12)
  {
    while (strcmp(*(const char **)(v12 + 16), __s2))
    {
      v12 = *(_QWORD *)(v12 + 8);
      if (!v12)
        goto LABEL_20;
    }
    v9 = 1042;
    goto LABEL_16;
  }
LABEL_20:
  v13 = malloc_type_malloc(0x30uLL, 0xCFAB4140uLL);
  if (!v13)
  {
LABEL_27:
    v9 = 35;
    goto LABEL_16;
  }
  v14 = v13;
  v15 = ctf_strdup(__s2);
  if (!v15)
  {
    free(v14);
    goto LABEL_27;
  }
  v16 = i + 64;
  v14[2] = v15;
  *(_OWORD *)(v14 + 3) = xmmword_19EA7F230;
  *((_DWORD *)v14 + 10) = a4;
  *(_DWORD *)(i + 44) = v10 & 0x400 | (v10 + 1) & 0x3FF | 0x4000;
  v17 = *(_QWORD *)(i + 64);
  *(_QWORD *)(i + 64) = v14;
  *v14 = v17;
  v14[1] = 0;
  if (v17)
    v16 = v17;
  *(_QWORD *)(v16 + 8) = v14;
  v18 = strlen(v15);
  result = 0;
  *(_QWORD *)(a1 + 600) += v18 + 1;
  *(_DWORD *)(a1 + 556) |= 8u;
  return result;
}

uint64_t ctf_add_member(uint64_t a1, uint64_t a2, char *__s2, uint64_t a4)
{
  char *v5;
  uint64_t v7;
  uint64_t i;
  int v9;
  int v10;
  int v11;
  uint64_t result;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t ctt_size;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  int v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  char *v37;
  uint64_t v38;
  unsigned int v39;

  v5 = __s2;
  v7 = *(_QWORD *)(a1 + 568);
  if (v7)
  {
    for (i = *(_QWORD *)(v7 + 8 * ((*(_QWORD *)(a1 + 576) - 1) & a2)); i; i = *(_QWORD *)(i + 16))
    {
      if (*(_QWORD *)(i + 32) == a2)
        break;
    }
  }
  else
  {
    i = 0;
  }
  if ((*(_BYTE *)(a1 + 556) & 4) == 0)
  {
    v9 = 1039;
LABEL_15:
    *(_DWORD *)(a1 + 560) = v9;
    return 0xFFFFFFFFLL;
  }
  if (!i)
  {
    v9 = 1020;
    goto LABEL_15;
  }
  v10 = *(_DWORD *)(i + 44);
  v11 = (unsigned __int16)v10 >> 11;
  if ((v11 - 8) <= 0xFFFFFFFD)
  {
    v9 = 1021;
    goto LABEL_15;
  }
  if ((*(_DWORD *)(i + 44) & 0x3FF) == 0x3FF)
  {
    v9 = 1040;
    goto LABEL_15;
  }
  if (__s2)
  {
    v13 = *(_QWORD *)(i + 72);
    if (v13)
    {
      while (1)
      {
        v14 = *(const char **)(v13 + 16);
        if (v14)
        {
          if (!strcmp(v14, v5))
            break;
        }
        v13 = *(_QWORD *)(v13 + 8);
        if (!v13)
          goto LABEL_22;
      }
      v9 = 1042;
      goto LABEL_15;
    }
  }
LABEL_22:
  v15 = ctf_type_size(a1, a4);
  if (v15 == -1)
    return 0xFFFFFFFFLL;
  v16 = v15;
  v17 = ctf_type_align(a1, a4);
  if (v17 == -1)
    return 0xFFFFFFFFLL;
  v18 = v17;
  v19 = malloc_type_malloc(0x30uLL, 0xCFAB4140uLL);
  if (!v19)
  {
LABEL_29:
    v9 = 35;
    goto LABEL_15;
  }
  v20 = v19;
  if (v5)
  {
    if (*v5)
    {
      v5 = ctf_strdup(v5);
      if (!v5)
      {
        free(v20);
        goto LABEL_29;
      }
    }
    else
    {
      v5 = 0;
    }
  }
  v20[2] = v5;
  v20[3] = a4;
  *((_DWORD *)v20 + 10) = -1;
  if ((v10 & 0x3FF) != 0 && v11 == 6)
  {
    v37 = v5;
    v21 = *(_QWORD *)(i + 64);
    v22 = ctf_type_resolve(a1, *(_QWORD *)(v21 + 24));
    v23 = *(_QWORD *)(v21 + 32);
    v39 = 0;
    v38 = 0;
    if (ctf_type_encoding((uint64_t (***)(uint64_t))a1, v22, (unsigned int *)&v38) == -1)
    {
      v26 = ctf_type_size(a1, v22);
      v24 = v23 + 8 * v26;
      if (v26 == -1)
        v24 = v23;
    }
    else
    {
      v24 = v23 + v39;
    }
    v5 = v37;
    v27 = v24 + 7;
    if (v18 <= 1)
      v28 = 1;
    else
      v28 = v18;
    v29 = (v27 >> 3) % v28;
    v30 = v28 - v29;
    if (v29)
      v31 = v30;
    else
      v31 = 0;
    v32 = v31 + (v27 >> 3);
    v20[4] = 8 * v32;
    v16 += v32;
  }
  else
  {
    v20[4] = 0;
    ctt_size = ctf_get_ctt_size((_DWORD *)a1, i + 40, 0, 0);
    if (ctt_size > v16)
      v16 = ctt_size;
  }
  if (v16 <= (*(unsigned int (**)(void))(*(_QWORD *)a1 + 56))())
  {
    v33 = v16;
  }
  else
  {
    v33 = (*(uint64_t (**)(void))(*(_QWORD *)a1 + 64))();
    *(_QWORD *)(i + 52) = __ROR8__(v16, 32);
  }
  v36 = *(_QWORD **)(i + 64);
  v35 = (_QWORD *)(i + 64);
  v34 = v36;
  *((_DWORD *)v35 - 5) = v10 & 0x400 | (v11 << 11) | (v10 + 1) & 0x3FF;
  *((_DWORD *)v35 - 4) = v33;
  *v35 = v20;
  *v20 = v36;
  v20[1] = 0;
  if (!v36)
    v34 = v35;
  v34[1] = v20;
  if (v5)
    *(_QWORD *)(a1 + 600) += strlen(v5) + 1;
  ctf_ref_inc(a1, a4);
  result = 0;
  *(_DWORD *)(a1 + 556) |= 8u;
  return result;
}

uint64_t ctf_delete_type(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t i;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v4 = *(_QWORD *)(a1 + 568);
  if (v4)
  {
    for (i = *(_QWORD *)(v4 + 8 * ((*(_QWORD *)(a1 + 576) - 1) & a2)); i; i = *(_QWORD *)(i + 16))
    {
      if (*(_QWORD *)(i + 32) == a2)
        break;
    }
  }
  else
  {
    i = 0;
  }
  if ((*(_BYTE *)(a1 + 556) & 4) == 0)
  {
    v6 = 1039;
LABEL_20:
    *(_DWORD *)(a1 + 560) = v6;
    return 0xFFFFFFFFLL;
  }
  v10 = a1;
  if (!ctf_lookup_by_id((uint64_t)&v10, a2))
  {
    v7 = *(_QWORD *)(a1 + 568);
    if (!v7)
      return 0xFFFFFFFFLL;
    v8 = *(_QWORD *)(v7 + 8 * ((*(_QWORD *)(a1 + 576) - 1) & a2));
    if (!v8)
      return 0xFFFFFFFFLL;
    while (*(_QWORD *)(v8 + 32) != a2)
    {
      v8 = *(_QWORD *)(v8 + 16);
      if (!v8)
        return 0xFFFFFFFFLL;
    }
  }
  if (!i)
  {
    v6 = 1045;
    goto LABEL_20;
  }
  if (*(_DWORD *)(i + 60) || *(_DWORD *)(a1 + 552) >= 2u)
  {
    v6 = 1044;
    goto LABEL_20;
  }
  ctf_dtd_delete((_QWORD *)a1, (unsigned int *)i);
  result = 0;
  *(_DWORD *)(a1 + 556) |= 8u;
  return result;
}

uint64_t ctf_add_type(uint64_t a1, uint64_t (***a2)(uint64_t), uint64_t a3)
{
  uint64_t v3;
  int v5;
  unsigned int *v6;
  uint64_t (***v7)(uint64_t);
  unsigned int *v8;
  unint64_t v9;
  uint64_t (***v10)(uint64_t);
  uint64_t (**v11)(uint64_t);
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  __int16 v21;
  __int16 v22;
  uint64_t v23;
  int v24;
  __int16 v25;
  size_t v26;
  _DWORD *v27;
  uint64_t v28;
  int v29;
  int v30;
  uint64_t *v31;
  const char *v32;
  uint64_t v34;
  uint64_t v35;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t *v46;
  int v47;
  uint64_t v48;
  int v49;
  unsigned int v50;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  uint64_t v55;
  uint64_t j;
  uint64_t v57;
  unsigned int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  __int16 v72;
  int v73;
  __int16 v74;
  uint64_t v75;
  unsigned int v76;
  uint64_t v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t (***v82)(uint64_t);
  uint64_t v83;
  uint64_t v84;
  uint64_t (***v85)(uint64_t);

  v3 = a3;
  v85 = a2;
  if (a2 != (uint64_t (***)(uint64_t))a1)
  {
    if ((*(_BYTE *)(a1 + 556) & 4) == 0)
    {
      v5 = 1039;
LABEL_92:
      *(_DWORD *)(a1 + 560) = v5;
      return -1;
    }
    v82 = 0;
    v83 = 0;
    v84 = 0;
    v80 = 0;
    v81 = 0;
    v79 = 0;
    v77 = 0;
    v78 = 0;
    v75 = 0;
    v76 = 0;
    v73 = 0;
    v74 = 0;
    v71 = 0;
    v72 = 0;
    v68 = 0;
    v69 = 0;
    v70 = 0;
    v65 = 0;
    v66 = 0;
    v67 = 0;
    v62 = 0;
    v63 = 0;
    v6 = (unsigned int *)ctf_lookup_by_id((uint64_t)&v85, a3);
    v7 = v85;
    if (!v6)
    {
LABEL_91:
      v5 = *((_DWORD *)v7 + 140);
      goto LABEL_92;
    }
    v8 = v6;
    v9 = *v6;
    v10 = &v85[2 * (v9 >> 31)];
    v11 = v10[53];
    if (v11)
    {
      v12 = v9 & 0x7FFFFFFF;
      v13 = (char *)v11 + v12;
      if ((unint64_t)v10[54] <= v12)
        v14 = 0;
      else
        v14 = v13;
    }
    else
    {
      v14 = 0;
    }
    if (v14)
      v15 = v14;
    else
      v15 = "(?)";
    if (*((int *)v85 + 141) > 3)
      v16 = v6[1];
    else
      v16 = *((unsigned __int16 *)v6 + 2);
    v17 = (**v85)(v16);
    if (*((int *)v7 + 141) > 3)
      v18 = v8[1];
    else
      v18 = *((unsigned __int16 *)v8 + 2);
    v19 = (*v7)[1](v18);
    if (*((int *)v7 + 141) > 3)
      v20 = v8[1];
    else
      v20 = *((unsigned __int16 *)v8 + 2);
    v21 = (*v7)[2](v20);
    v22 = v21;
    switch(v17)
    {
      case 8:
        v23 = a1 + 240;
        break;
      case 7:
        v23 = a1 + 208;
        break;
      case 6:
        v23 = a1 + 176;
        break;
      default:
        v23 = a1 + 272;
        break;
    }
    v64 = 0;
    v61 = v19;
    if ((v19 & 1) != 0)
    {
      if (!*v15)
      {
        v25 = v21;
        v24 = 0;
        goto LABEL_56;
      }
      v26 = strlen(v15);
      v27 = ctf_hash_lookup(v23, a1, v15, v26);
      if (v27)
      {
        v28 = v27[1];
        v29 = ctf_type_kind(a1, v28);
        if (v29 == v17)
        {
          v25 = v22;
          v30 = 0;
          v24 = v17;
          goto LABEL_57;
        }
        if (v29 != 9 || (v17 - 9) < 0xFFFFFFFD)
          goto LABEL_132;
        v24 = 9;
        if (!*v15)
          goto LABEL_31;
      }
      else
      {
        v24 = 0;
      }
    }
    else
    {
      v24 = 0;
      if (!*v15)
      {
LABEL_31:
        v25 = v22;
LABEL_56:
        v28 = -1;
        v30 = 1;
LABEL_57:
        v82 = v7;
        v83 = v3;
        v84 = 0;
        v79 = a1;
        v80 = v28;
        v81 = 0;
        switch(v17)
        {
          case 1:
          case 2:
            if (ctf_type_encoding(v7, v3, (unsigned int *)&v77))
              goto LABEL_91;
            if (v30)
            {
              if (ctf_add_intrinsic(a1, (uint64_t)v7, v3, v15) == -1)
                return -1;
              if (v17 == 1)
                v37 = 1;
              else
                v37 = 2;
              return ctf_add_encoded(a1, v61, v15, (uint64_t)&v77, v37);
            }
            if (ctf_type_encoding((uint64_t (***)(uint64_t))a1, v28, (unsigned int *)&v75))
              return -1;
            if (v77 != v75 || v78 != (unint64_t)v76)
              break;
            return v28;
          case 3:
          case 11:
          case 12:
          case 13:
            v34 = ctf_type_reference((uint64_t)v7, v3);
            v35 = ctf_add_type(a1, v7, v34);
            if (v35 == -1)
              return -1;
            return ctf_add_reftype(a1, v61, v35, v17);
          case 4:
            if (ctf_array_info(v7, v3, (uint64_t)&v68) == -1)
              goto LABEL_91;
            v39 = ctf_add_type(a1, v7, v68);
            v68 = v39;
            v40 = ctf_add_type(a1, v7, v69);
            v69 = v40;
            v3 = -1;
            if (v39 == -1 || v40 == -1)
              return v3;
            if ((v30 & 1) != 0)
            {
              return ctf_add_array(a1, v61, &v68);
            }
            else
            {
              if (ctf_array_info((_DWORD *)a1, v28, (uint64_t)&v65))
                return v3;
              if (v68 != v65 || v69 != v66 || v70 != v67)
              {
                *(_DWORD *)(a1 + 560) = 1043;
                return v3;
              }
            }
            return v28;
          case 5:
            if (*((int *)v7 + 141) > 3)
              v41 = v8[2];
            else
              v41 = *((unsigned __int16 *)v8 + 3);
            v62 = ctf_add_type(a1, v7, v41);
            v63 = 0;
            if (v62 == -1)
              return -1;
            return ctf_add_function(a1, v61, (uint64_t)&v62, 0);
          case 6:
          case 7:
            if (v28 != -1 && v24 != 9)
            {
              v38 = ctf_type_size((uint64_t)v7, v3);
              if (v38 != ctf_type_size(a1, v28)
                || ctf_member_iter((int *)v7, v3, (uint64_t (*)(const char *, _QWORD, unint64_t, uint64_t))membcmp, (uint64_t)&v79))
              {
                break;
              }
              return v28;
            }
            v45 = ctf_add_generic(a1, v61, v15, &v64);
            if (v45 != -1)
            {
              v28 = v45;
              v46 = v64;
              v80 = v45;
              v81 = v64;
              v47 = ctf_member_iter((int *)v7, v3, (uint64_t (*)(const char *, _QWORD, unint64_t, uint64_t))membadd, (uint64_t)&v79) != 0;
              v48 = ctf_type_size((uint64_t)v7, v3);
              if (v48 <= (*(unsigned int (**)(void))(*(_QWORD *)a1 + 56))())
              {
                v49 = v48;
              }
              else
              {
                v49 = (*(uint64_t (**)(void))(*(_QWORD *)a1 + 64))();
                *(uint64_t *)((char *)v46 + 52) = __ROR8__(v48, 32);
              }
              *((_DWORD *)v46 + 11) = (v17 << 11) | ((v61 != 0) << 10) | v25 & 0x3FF;
              *((_DWORD *)v46 + 12) = v49;
              for (i = v46[9]; i; i = *(_QWORD *)(i + 8))
              {
                v55 = ctf_add_type(a1, v7, *(_QWORD *)(i + 24));
                *(_QWORD *)(i + 24) = v55;
                if (v55 == -1)
                  ++v47;
              }
              if (!v47)
              {
                for (j = v46[9]; j; j = *(_QWORD *)(j + 8))
                  ctf_ref_inc(a1, *(_QWORD *)(j + 24));
                return v28;
              }
            }
            return -1;
          case 8:
            if (v28 == -1 || v24 == 9)
            {
              if (*((int *)v7 + 141) > 3)
                v50 = v8[2];
              else
                LOWORD(v50) = *((_WORD *)v8 + 3);
              v57 = ctf_add_enum_sized(a1, v61, v15, (unsigned __int16)v50);
              v80 = v57;
              if (v57 == -1)
                return -1;
              v28 = v57;
              if (ctf_enum_iter((uint64_t)v7, v3, (uint64_t (*)(char *, _QWORD, uint64_t))enumadd, (uint64_t)&v79))return -1;
              return v28;
            }
            if (!ctf_enum_iter((uint64_t)v7, v3, (uint64_t (*)(char *, _QWORD, uint64_t))enumcmp, (uint64_t)&v79)&& !ctf_enum_iter(a1, v28, (uint64_t (*)(char *, _QWORD, uint64_t))enumcmp, (uint64_t)&v82))
            {
              return v28;
            }
            break;
          case 9:
            if (!v30)
              return v28;
            return ctf_add_forward(a1, v61, v15, 6);
          case 10:
            v42 = ctf_type_reference((uint64_t)v7, v3);
            v43 = ctf_add_type(a1, v7, v42);
            if (v43 == -1)
              return -1;
            if (!v30)
              return v28;
            return ctf_add_typedef(a1, v61, v15, v43);
          case 14:
            if (ctf_type_ptrauth((unsigned int (***)(uint64_t))v7, v3, (uint64_t)&v73))
              goto LABEL_91;
            if ((v30 & 1) != 0)
              goto LABEL_111;
            if (ctf_type_ptrauth((unsigned int (***)(uint64_t))a1, v28, (uint64_t)&v71))
              return -1;
            if (v73 != v71 || v74 != v72)
              break;
LABEL_111:
            v52 = ctf_type_reference((uint64_t)v7, v3);
            v53 = ctf_add_type(a1, v7, v52);
            if (v53 == -1)
              return -1;
            return ctf_add_ptrauth(a1, v61, v53, (uint64_t)&v73);
          default:
            v5 = 1007;
            goto LABEL_92;
        }
LABEL_132:
        v5 = 1043;
        goto LABEL_92;
      }
    }
    v31 = *(uint64_t **)(a1 + 584);
    if (v31)
    {
      while (*(_QWORD *)(a1 + 616) < (unint64_t)(*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 40))(v31[4]))
      {
        if ((unsigned __int16)*((_DWORD *)v31 + 11) >> 11 == v17)
        {
          v32 = (const char *)v31[3];
          if (v32)
          {
            if (!strcmp(v32, v15))
            {
              if ((v17 - 1) > 1)
                return v31[4];
              if (!ctf_type_encoding(v85, v3, (unsigned int *)&v77)
                && v77 == v31[8]
                && v78 == (unint64_t)*((unsigned int *)v31 + 18))
              {
                return v31[4];
              }
            }
          }
        }
        v31 = (uint64_t *)*v31;
        if (!v31)
          break;
      }
      v25 = v22;
      v7 = v85;
    }
    else
    {
      v25 = v22;
    }
    v64 = v31;
    goto LABEL_56;
  }
  return v3;
}

uint64_t ctf_add_intrinsic(uint64_t a1, uint64_t a2, uint64_t a3, char *__s)
{
  uint64_t v8;
  size_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  int v15;
  uint64_t v16;
  unsigned int v17;

  if (!__s)
    return 0;
  if (!*__s)
    return 0;
  v8 = a2 + 272;
  v9 = strlen(__s);
  result = (uint64_t)ctf_hash_lookup(v8, a2, __s, v9);
  if (result)
  {
    v11 = result;
    result = 0;
    v17 = 0;
    v16 = 0;
    v14 = 0;
    v15 = 0;
    v12 = *(unsigned int *)(v11 + 4);
    if (v12 != a3)
    {
      if (ctf_type_encoding((uint64_t (***)(uint64_t))a2, *(unsigned int *)(v11 + 4), (unsigned int *)&v16)|| ctf_type_encoding((uint64_t (***)(uint64_t))a2, a3, (unsigned int *)&v14))
      {
        *(_DWORD *)(a1 + 560) = *(_DWORD *)(a2 + 560);
        return -1;
      }
      if (v14 == v16 && v15 == (unint64_t)v17)
        return 0;
      result = ctf_add_type(a1, a2, v12);
      if (result != -1)
        return 0;
    }
  }
  return result;
}

uint64_t ctf_add_ptrauth(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v13;

  if (a3 < 0xFFFFFFFFLL)
  {
    v13 = 0;
    v5 = ctf_add_generic(a1, a2, 0, &v13);
    if (v5 != -1)
    {
      ctf_ref_inc(a1, a3);
      if (a2)
        v9 = 29696;
      else
        v9 = 28672;
      v10 = v13;
      *(_DWORD *)(v13 + 44) = v9;
      *(_DWORD *)(v10 + 48) = a3;
      v11 = *(_WORD *)(a4 + 4);
      *(_DWORD *)(v10 + 64) = *(_DWORD *)a4;
      *(_WORD *)(v10 + 68) = v11;
    }
  }
  else
  {
    *(_DWORD *)(a1 + 560) = 22;
    return -1;
  }
  return v5;
}

BOOL membcmp(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD v5[2];

  v5[0] = a1;
  v5[1] = a3;
  return ctf_member_iter(*(int **)a4, *(_QWORD *)(a4 + 8), (uint64_t (*)(const char *, _QWORD, unint64_t, uint64_t))membmatch, (uint64_t)v5) != 1;
}

uint64_t membadd(const char *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  _QWORD *v8;
  _QWORD *v9;
  char *v10;
  uint64_t result;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;

  v8 = malloc_type_malloc(0x30uLL, 0xCFAB4140uLL);
  if (!v8)
    goto LABEL_6;
  v9 = v8;
  if (a1 && *a1)
  {
    v10 = ctf_strdup(a1);
    if (!v10)
    {
      free(v9);
LABEL_6:
      *(_DWORD *)(*a4 + 560) = 35;
      return 0xFFFFFFFFLL;
    }
  }
  else
  {
    v10 = 0;
  }
  v9[2] = v10;
  v9[3] = a2;
  v9[4] = a3;
  *((_DWORD *)v9 + 10) = -1;
  v12 = a4[2];
  v15 = *(_QWORD **)(v12 + 64);
  v13 = (_QWORD *)(v12 + 64);
  v14 = v15;
  *v13 = v9;
  *v9 = v15;
  v9[1] = 0;
  if (v15)
    v13 = v14;
  v13[1] = v9;
  v16 = *a4;
  if (v10)
    *(_QWORD *)(v16 + 600) += strlen(v10) + 1;
  result = 0;
  *(_DWORD *)(v16 + 556) |= 8u;
  return result;
}

BOOL enumcmp(const char *a1, int a2, uint64_t *a3)
{
  int v6;

  v6 = 0;
  return ctf_enum_value(*a3, a3[1], a1, &v6) == -1 || v6 != a2;
}

BOOL enumadd(char *__s2, int a2, uint64_t *a3)
{
  return ctf_add_enumerator(*a3, a3[1], __s2, a2) == -1;
}

BOOL membmatch(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return !strcmp(a1, *(const char **)a4) && *(_QWORD *)(a4 + 8) == a3;
}

double ctf_decl_init(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double result;

  result = 0.0;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 64) = -1;
  *(_QWORD *)(a1 + 72) = -1;
  *(_QWORD *)(a1 + 88) = a2;
  *(_QWORD *)(a1 + 96) = a2;
  *(_QWORD *)(a1 + 104) = a2 + a3;
  return result;
}

_QWORD *ctf_decl_fini(uint64_t a1)
{
  uint64_t i;
  _QWORD *result;
  _QWORD *v4;

  for (i = 0; i != 4; ++i)
  {
    result = *(_QWORD **)(a1 + 16 * i + 8);
    if (result)
    {
      do
      {
        v4 = (_QWORD *)result[1];
        free(result);
        result = v4;
      }
      while (v4);
    }
  }
  return result;
}

uint64_t ctf_decl_push(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v3;
  _DWORD *v4;
  uint64_t result;
  _DWORD *v6;
  unsigned int *v7;
  uint64_t v8;
  int v9;
  int v10;
  unsigned int v11;
  int v12;
  int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unint64_t v17;
  _DWORD *v18;
  uint64_t v19;
  unint64_t v20;
  const char *v21;
  const char *v22;
  unsigned int v23;
  uint64_t *v24;
  uint64_t *v25;
  int v26;
  int v27;
  uint64_t *v29;
  unsigned int v30;
  _QWORD v31[2];
  uint64_t v32;
  _DWORD *v33;

  while (2)
  {
    v3 = a3;
    v4 = a1;
    v33 = a2;
    result = ctf_lookup_by_id((uint64_t)&v33, a3);
    v6 = v33;
    if (!result)
    {
      v9 = v33[140];
LABEL_51:
      v4[30] = v9;
      return result;
    }
    v7 = (unsigned int *)result;
    if ((int)v33[141] > 3)
      v8 = *(unsigned int *)(result + 4);
    else
      v8 = *(unsigned __int16 *)(result + 4);
    v10 = (**(uint64_t (***)(uint64_t))v33)(v8);
    v11 = 0;
    v12 = 1;
    v13 = 0;
    switch(v10)
    {
      case 3:
        if ((int)v6[141] > 3)
          v15 = v7[2];
        else
          v15 = *((unsigned __int16 *)v7 + 3);
        ctf_decl_push(v4, v6, v15);
        v13 = 0;
        v11 = 1;
        goto LABEL_34;
      case 4:
        v31[0] = 0;
        v31[1] = 0;
        v32 = 0;
        ctf_array_info(v6, v3, (uint64_t)v31);
        ctf_decl_push(v4, v6, v31[0]);
        v13 = 0;
        v11 = 2;
        v12 = v32;
        goto LABEL_34;
      case 5:
        if ((int)v6[141] > 3)
          v16 = v7[2];
        else
          v16 = *((unsigned __int16 *)v7 + 3);
        ctf_decl_push(v4, v6, v16);
        v13 = 0;
        v11 = 3;
        goto LABEL_34;
      case 6:
      case 7:
      case 8:
      case 9:
        goto LABEL_34;
      case 10:
        v17 = *v7;
        v18 = &v6[4 * (v17 >> 31)];
        v19 = *((_QWORD *)v18 + 53);
        if (v19)
        {
          v20 = v17 & 0x7FFFFFFF;
          v21 = (const char *)(v19 + v20);
          if (*((_QWORD *)v18 + 54) <= v20)
            v22 = 0;
          else
            v22 = v21;
        }
        else
        {
          v22 = 0;
        }
        if (!v22)
          v22 = "(?)";
        if (!*v22)
        {
          if ((int)v6[141] > 3)
            v30 = v7[2];
          else
            v30 = *((unsigned __int16 *)v7 + 3);
          a3 = v30;
          a1 = v4;
          a2 = v6;
          continue;
        }
        v11 = 0;
        v13 = 0;
LABEL_34:
        result = (uint64_t)malloc_type_malloc(0x20uLL, 0xCFAB4140uLL);
        if (!result)
        {
          v9 = 35;
          goto LABEL_51;
        }
        *(_QWORD *)(result + 16) = v3;
        *(_DWORD *)(result + 24) = v10;
        *(_DWORD *)(result + 28) = v12;
        v24 = (uint64_t *)&v4[4 * v11];
        v25 = (uint64_t *)v24[1];
        if (!v25)
        {
          v26 = v4[21];
          v4[21] = v26 + 1;
          v4[v11 + 16] = v26;
        }
        if (v11 <= 1 && v11 > v4[20])
          v4[20] = v11;
        if (v11)
          v27 = 0;
        else
          v27 = v13;
        if (v10 != 4 && v27 == 0)
        {
          v29 = (uint64_t *)*v24;
          *v24 = result;
          *(_QWORD *)result = v29;
          *(_QWORD *)(result + 8) = 0;
          if (v29)
            v24 = v29;
          v24[1] = result;
        }
        else
        {
          v24[1] = result;
          *(_QWORD *)result = 0;
          *(_QWORD *)(result + 8) = v25;
          if (v25)
            v24 = v25;
          *v24 = result;
        }
        return result;
      case 11:
      case 12:
      case 13:
        if ((int)v6[141] > 3)
          v14 = v7[2];
        else
          v14 = *((unsigned __int16 *)v7 + 3);
        ctf_decl_push(v4, v6, v14);
        v11 = v4[20];
        v13 = 1;
        goto LABEL_34;
      case 14:
        if ((int)v6[141] > 3)
          v23 = v7[2];
        else
          v23 = *((unsigned __int16 *)v7 + 3);
        ctf_decl_push(v4, v6, v23);
        v13 = 0;
        v11 = v4[20];
        goto LABEL_34;
      default:
        v13 = 0;
        goto LABEL_34;
    }
  }
}

uint64_t ctf_decl_sprintf(_QWORD *a1, char *__format, ...)
{
  uint64_t v3;
  char *v4;
  unint64_t v5;
  uint64_t result;
  unint64_t v7;
  va_list va;

  va_start(va, __format);
  v3 = a1[13];
  v4 = (char *)a1[12];
  v5 = v3 - (_QWORD)v4;
  result = vsnprintf(v4, v3 - (_QWORD)v4, __format, va);
  v7 = (int)result;
  if (v5 < (int)result)
    v7 = v5;
  a1[12] += v7;
  a1[14] += (int)result;
  return result;
}

char *ctf_errmsg(int a1)
{
  char *result;

  if ((a1 - 1000) > 0x2E)
    result = strerror(a1);
  else
    result = _ctf_errlist[a1 - 1000];
  if (!result)
    return "Unknown error";
  return result;
}

uint64_t ctf_errno(uint64_t a1)
{
  return *(unsigned int *)(a1 + 560);
}

uint64_t ctf_hash_create(uint64_t a1, unint64_t a2)
{
  uint64_t result;
  void *v4;

  if (HIDWORD(a2))
    return 84;
  if (a2)
  {
    *(_DWORD *)(a1 + 16) = 211;
    *(_DWORD *)(a1 + 20) = a2 + 1;
    *(_DWORD *)(a1 + 24) = 1;
    *(_QWORD *)a1 = malloc_type_malloc(0x34CuLL, 0xCFAB4140uLL);
    v4 = malloc_type_malloc(12 * *(unsigned int *)(a1 + 20), 0xCFAB4140uLL);
    *(_QWORD *)(a1 + 8) = v4;
    if (*(_QWORD *)a1 && v4)
    {
      bzero(*(void **)a1, 4 * *(unsigned int *)(a1 + 16));
      bzero(*(void **)(a1 + 8), 12 * *(unsigned int *)(a1 + 20));
      return 0;
    }
    else
    {
      ctf_hash_destroy(a1);
      return 35;
    }
  }
  else
  {
    result = 0;
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)(a1 + 24) = 0;
    *(_QWORD *)a1 = &_CTF_EMPTY;
    *(_QWORD *)(a1 + 8) = 0;
    *(_DWORD *)(a1 + 16) = 1;
  }
  return result;
}

void ctf_hash_destroy(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)a1;
  if (v2 && *(_DWORD *)(a1 + 16) != 1)
  {
    free(v2);
    *(_QWORD *)a1 = 0;
  }
  v3 = *(void **)(a1 + 8);
  if (v3)
  {
    free(v3);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

uint64_t ctf_hash_size(uint64_t a1)
{
  int v1;
  BOOL v2;
  unsigned int v3;

  v1 = *(_DWORD *)(a1 + 20);
  v2 = v1 != 0;
  v3 = v1 - 1;
  if (v2)
    return v3;
  else
    return 0;
}

uint64_t ctf_hash_insert(uint64_t *a1, uint64_t a2, int a3, unsigned int a4)
{
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  const char *v9;
  uint64_t v10;
  int64_t v11;
  unint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t result;
  unint64_t v16;
  uint64_t v17;

  if (!a3)
    return 22;
  v5 = *((_DWORD *)a1 + 6);
  if (v5 >= *((_DWORD *)a1 + 5))
    return 84;
  v6 = a4 >> 31;
  v7 = *(_QWORD *)(a2 + 16 * v6 + 424);
  if (!v7)
    return 1018;
  v8 = a4 & 0x7FFFFFFF;
  if (*(_QWORD *)(a2 + 16 * v6 + 432) <= v8)
    return 1019;
  v9 = (const char *)(v7 + v8);
  if (!*(_BYTE *)(v7 + v8))
    return 0;
  v10 = a1[1];
  *(_DWORD *)(v10 + 12 * v5) = a4;
  *(_DWORD *)(v10 + 12 * v5 + 4) = a3;
  v11 = strlen(v9);
  if (v11 < 1)
  {
    v12 = 0;
  }
  else
  {
    v12 = 0;
    v13 = &v9[v11];
    do
    {
      v14 = *v9++;
      v12 = v14 + 16 * v12;
      if ((v12 & 0xF0000000) != 0)
        v12 = v12 & 0xFFFFFFFF0FFFFFFFLL ^ ((unint64_t)(v12 & 0xF0000000) >> 24);
    }
    while (v9 < v13);
  }
  result = 0;
  v16 = v12 % *((unsigned int *)a1 + 4);
  v17 = *a1;
  *(_DWORD *)(v10 + 12 * v5 + 8) = *(_DWORD *)(*a1 + 4 * v16);
  *((_DWORD *)a1 + 6) = v5 + 1;
  *(_DWORD *)(v17 + 4 * v16) = v5;
  return result;
}

uint64_t ctf_hash_define(uint64_t *a1, uint64_t a2, int a3, unsigned int a4)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  size_t v14;
  _DWORD *v15;

  v8 = a4 >> 31;
  v9 = *(_QWORD *)(a2 + 16 * v8 + 424);
  if (v9)
  {
    v10 = a4 & 0x7FFFFFFF;
    v11 = (char *)(v9 + v10);
    if (*(_QWORD *)(a2 + 16 * v8 + 432) <= v10)
      v12 = 0;
    else
      v12 = v11;
  }
  else
  {
    v12 = 0;
  }
  if (v12)
    v13 = v12;
  else
    v13 = "(?)";
  v14 = strlen(v13);
  v15 = ctf_hash_lookup((uint64_t)a1, a2, v13, v14);
  if (!v15)
    return ctf_hash_insert(a1, a2, a3, a4);
  v15[1] = a3;
  return 0;
}

_DWORD *ctf_hash_lookup(uint64_t a1, uint64_t a2, char *__s1, int64_t __n)
{
  unint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *v12;
  const char *v13;

  if (__n < 1)
  {
    v7 = 0;
  }
  else
  {
    v7 = 0;
    v8 = __s1;
    do
    {
      v9 = *v8++;
      v7 = v9 + 16 * v7;
      if ((v7 & 0xF0000000) != 0)
        v7 = v7 & 0xFFFFFFFF0FFFFFFFLL ^ ((unint64_t)(v7 & 0xF0000000) >> 24);
    }
    while (v8 < &__s1[__n]);
  }
  v10 = *(unsigned int *)(*(_QWORD *)a1 + 4 * (v7 % *(unsigned int *)(a1 + 16)));
  if (!(_DWORD)v10)
    return 0;
  v11 = *(_QWORD *)(a1 + 8);
  while (1)
  {
    v12 = (_DWORD *)(v11 + 12 * v10);
    v13 = (const char *)(*(_QWORD *)(a2 + (((unint64_t)*v12 >> 27) & 0x10) + 424)
                       + (*v12 & 0x7FFFFFFF));
    if (!strncmp(__s1, v13, __n) && !v13[__n])
      break;
    v10 = *(unsigned int *)(v11 + 12 * v10 + 8);
    if (!(_DWORD)v10)
      return 0;
  }
  return v12;
}

uint64_t ctf_zopen(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  void *v10;
  uint64_t (*v11)(void);

  ctf_dprintf("decompressing CTF data using %s\n", a2, a3, a4, a5, a6, a7, a8, (char)"/usr/lib/libz.dylib");
  result = qword_1EE52EC90;
  if (!qword_1EE52EC90)
  {
    v10 = dlopen("/usr/lib/libz.dylib", 5);
    qword_1EE52EC90 = (uint64_t)v10;
    if (v10)
    {
      zlib = (uint64_t (*)(void))dlsym(v10, "uncompress");
      v11 = (uint64_t (*)(void))dlsym((void *)qword_1EE52EC90, "zError");
      off_1EE52EC88 = v11;
      result = qword_1EE52EC90;
      if (zlib && v11)
        return result;
      dlclose((void *)qword_1EE52EC90);
      off_1EE52EC88 = 0;
      qword_1EE52EC90 = 0;
      zlib = 0;
    }
    result = 0;
    if (a1)
      *a1 = 1015;
  }
  return result;
}

uint64_t z_uncompress()
{
  return zlib();
}

uint64_t z_strerror()
{
  return off_1EE52EC88();
}

char *ctf_sect_mmap(_QWORD *a1, int a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  char *result;

  v4 = a1[6];
  v5 = getpagesize();
  v6 = v4 & (v5 - 1);
  result = (char *)mmap(0, v6 + a1[4], 1, 2, a2, v4 & -v5);
  if (result != (char *)-1)
    a1[3] = &result[v6];
  return result;
}

uint64_t ctf_sect_munmap(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = (getpagesize() - 1) & v2;
  return munmap((void *)(v2 - v3), v3 + *(_QWORD *)(a1 + 32));
}

uint64_t ctf_fdopen(int a1, int *a2)
{
  unint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  size_t v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int128 v20;
  char *v21;
  char *v22;
  size_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  size_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  unsigned int v42;
  char *v43;
  char *v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  int v48;
  uint64_t v49;
  char *v50;
  __int128 *v51;
  __int128 *v52;
  char *v53;
  uint64_t *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  __int128 *v60;
  __int128 *v61;
  int *v62;
  uint64_t v64;
  char *v65;
  size_t v66;
  char *v67;
  uint64_t v68;
  stat v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  __int128 v78[2];
  _OWORD v79[2];
  _OWORD __buf[3];
  __int128 v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  memset(&v69, 0, sizeof(v69));
  memset(v78, 0, sizeof(v78));
  memset(v79, 0, 24);
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0;
  v73 = 0;
  v71 = 0u;
  v72 = 0u;
  v70 = 0u;
  memset(__buf, 0, sizeof(__buf));
  v81 = 0u;
  if (fstat(a1, &v69) == -1)
    goto LABEL_66;
  v4 = pread(a1, __buf, 0x40uLL, 0);
  if ((uint64_t)v4 <= 0)
  {
    if ((v4 & 0x8000000000000000) != 0)
    {
      v6 = *__error();
      if (!a2)
        return 0;
    }
    else
    {
      v6 = 1000;
      if (!a2)
        return 0;
    }
    v5 = 0;
    goto LABEL_68;
  }
  if (v4 >= 4 && LOWORD(__buf[0]) == 53233)
  {
    if (BYTE2(__buf[0]) >= 5u)
    {
      if (a2)
      {
        v5 = 0;
        v6 = 1002;
LABEL_68:
        *a2 = v6;
        return v5;
      }
      return 0;
    }
    *((_QWORD *)&v78[1] + 1) = mmap(0, v69.st_size, 1, 2, a1, 0);
    if (*((_QWORD *)&v78[1] + 1) != -1)
    {
      *(__int128 *)((char *)v78 + 8) = xmmword_19EA7F2A0;
      *(_QWORD *)&v78[0] = ".SUNW_ctf";
      *(_QWORD *)&v79[0] = v69.st_size;
      *(_OWORD *)((char *)v79 + 8) = xmmword_19EA7F2B0;
      v5 = ctf_bufopen(v78, 0, 0, a2, v7, v8, v9, v10);
      if (!v5)
      {
        v11 = *((_QWORD *)&v78[1] + 1);
        v12 = (getpagesize() - 1) & v11;
        v13 = (char *)(v11 - v12);
        v14 = v12 + *(_QWORD *)&v79[0];
        goto LABEL_18;
      }
      return v5;
    }
LABEL_66:
    v62 = __error();
    if (a2)
    {
      v5 = 0;
      v6 = *v62;
      goto LABEL_68;
    }
    return 0;
  }
  if (v4 < 0x34 || LODWORD(__buf[0]) != 1179403647)
  {
LABEL_13:
    if (a2)
    {
      v5 = 0;
      v6 = 1000;
      goto LABEL_68;
    }
    return 0;
  }
  if (BYTE5(__buf[0]) != 1)
  {
    if (a2)
    {
      v5 = 0;
      v6 = 1003;
      goto LABEL_68;
    }
    return 0;
  }
  if (DWORD1(__buf[1]) != 1)
  {
    if (a2)
    {
      v5 = 0;
      v6 = 1001;
      goto LABEL_68;
    }
    return 0;
  }
  if (BYTE4(__buf[0]) == 2)
  {
    if (v4 < 0x40)
      goto LABEL_13;
    v15 = HIWORD(v81);
    LODWORD(v16) = WORD6(v81);
  }
  else
  {
    v17 = LODWORD(__buf[2]);
    v18 = DWORD1(__buf[2]);
    v19 = *((_QWORD *)&__buf[2] + 1);
    LODWORD(v16) = (unsigned __int16)v81;
    v15 = WORD1(v81);
    DWORD1(__buf[1]) = 1;
    *(_QWORD *)&v20 = DWORD2(__buf[1]);
    *((_QWORD *)&v20 + 1) = HIDWORD(__buf[1]);
    *(_OWORD *)((char *)&__buf[1] + 8) = v20;
    *((_QWORD *)&__buf[2] + 1) = v17;
    LODWORD(v81) = v18;
    *(_QWORD *)((char *)&v81 + 4) = v19;
    WORD6(v81) = v16;
    HIWORD(v81) = v15;
  }
  if (v15 >= v16)
  {
    if (a2)
    {
      v5 = 0;
      v6 = 1007;
      goto LABEL_68;
    }
    return 0;
  }
  v21 = (char *)malloc_type_malloc((unint64_t)v16 << 6, 0x37DF05C5uLL);
  if (!v21)
    goto LABEL_66;
  v22 = v21;
  if (BYTE4(__buf[0]) == 1)
  {
    v23 = 40 * v16;
    v24 = (char *)malloc_type_malloc(v23, 0x298289E8uLL);
    if (v24)
    {
      v25 = v24;
      if (pread(a1, v24, 40 * v16, *((off_t *)&__buf[2] + 1)) == v23)
      {
        v26 = 0;
        v27 = v22 + 24;
        do
        {
          *((_QWORD *)v27 - 3) = *(_QWORD *)&v25[v26];
          v28 = *(_QWORD *)&v25[v26 + 8];
          *(_QWORD *)&v29 = v28;
          *((_QWORD *)&v29 + 1) = HIDWORD(v28);
          *((_OWORD *)v27 - 1) = v29;
          v30 = *(_QWORD *)&v25[v26 + 16];
          *(_QWORD *)&v29 = v30;
          *((_QWORD *)&v29 + 1) = HIDWORD(v30);
          *(_OWORD *)v27 = v29;
          *((_QWORD *)v27 + 2) = *(_QWORD *)&v25[v26 + 24];
          v31 = *(_QWORD *)&v25[v26 + 32];
          *(_QWORD *)&v29 = v31;
          *((_QWORD *)&v29 + 1) = HIDWORD(v31);
          *(_OWORD *)(v27 + 24) = v29;
          v27 += 64;
          v26 += 40;
        }
        while (v23 != v26);
        free(v25);
        goto LABEL_42;
      }
    }
LABEL_65:
    free(v22);
    goto LABEL_66;
  }
  if (pread(a1, v21, (unint64_t)v16 << 6, *((off_t *)&__buf[2] + 1)) != (unint64_t)v16 << 6)
    goto LABEL_65;
LABEL_42:
  v32 = &v22[64 * (unint64_t)HIWORD(v81)];
  v34 = *((_QWORD *)v32 + 3);
  v33 = *((_QWORD *)v32 + 4);
  v35 = getpagesize();
  v36 = v35 - 1;
  v37 = (v34 & v36) + v33;
  v38 = (char *)mmap(0, v37, 1, 2, a1, v34 & -v35);
  if (v38 == (char *)-1)
  {
    free(v22);
    if (!a2)
      return 0;
    goto LABEL_74;
  }
  v65 = v38;
  v66 = v37;
  v68 = 0;
  v39 = 0;
  v40 = 0;
  v41 = &v38[*(_QWORD *)&v22[64 * (unint64_t)HIWORD(v81) + 24] & v36];
  v42 = WORD6(v81);
  v43 = v22 + 32;
  v44 = &v22[64 * (unint64_t)HIWORD(v81) + 32];
  if (v16 <= 1)
    v16 = 1;
  else
    v16 = v16;
  v67 = &v38[*(_QWORD *)&v22[64 * (unint64_t)HIWORD(v81) + 24] & v36];
  do
  {
    v45 = *((unsigned int *)v43 + 2);
    if (v45 < v42)
    {
      v46 = *((unsigned int *)v43 - 8);
      if (*(_QWORD *)v44 > v46)
      {
        v47 = *(unsigned int *)&v22[64 * v45];
        if (*(_QWORD *)v44 > v47)
        {
          v48 = *((_DWORD *)v43 - 7);
          if (v48 == 2)
          {
            *(_QWORD *)&v74 = &v41[v46];
            *((_QWORD *)&v74 + 1) = 2;
            *(_QWORD *)&v75 = *((_QWORD *)v43 - 3);
            *(_QWORD *)&v76 = *(_QWORD *)v43;
            *((_QWORD *)&v76 + 1) = *((_QWORD *)v43 + 3);
            v77 = *((_QWORD *)v43 - 1);
            *(_QWORD *)&v70 = &v41[v47];
            v68 = *(unsigned int *)&v22[64 * v45 + 4];
            *((_QWORD *)&v70 + 1) = v68;
            v52 = &v72;
            v51 = &v71;
            v54 = &v73;
            v53 = (char *)&v72 + 8;
            v39 = 2;
          }
          else
          {
            if (v48 != 1)
              goto LABEL_57;
            v49 = v39;
            v50 = &v41[v46];
            if (strcmp(&v41[v46], ".SUNW_ctf"))
            {
              v39 = v49;
              v41 = v67;
              goto LABEL_57;
            }
            v45 = v40;
            *(_QWORD *)&v78[0] = v50;
            *((_QWORD *)&v78[0] + 1) = 1;
            v52 = v79;
            v51 = &v78[1];
            v54 = (uint64_t *)&v79[1];
            v53 = (char *)v79 + 8;
            v39 = v49;
            v41 = v67;
          }
          v55 = &v22[64 * v45];
          *(_QWORD *)v51 = *((_QWORD *)v55 + 1);
          *(_QWORD *)v52 = *((_QWORD *)v55 + 4);
          *(_QWORD *)v53 = *((_QWORD *)v55 + 7);
          *v54 = *((_QWORD *)v55 + 3);
        }
      }
    }
LABEL_57:
    ++v40;
    v43 += 64;
  }
  while (v16 != v40);
  free(v22);
  if (!*((_QWORD *)&v78[0] + 1))
  {
    munmap(v65, v66);
    if (a2)
    {
      v5 = 0;
      v6 = 1008;
      goto LABEL_68;
    }
    return 0;
  }
  if (ctf_sect_mmap(v78, a1) == (char *)-1)
  {
    munmap(v65, v66);
    if (!a2)
      return 0;
LABEL_74:
    v5 = 0;
    v6 = 1013;
    goto LABEL_68;
  }
  if (v39 && v68)
  {
    if (ctf_sect_mmap(&v74, a1) != (char *)-1 && ctf_sect_mmap(&v70, a1) != (char *)-1)
    {
      v60 = &v74;
      v61 = &v70;
      goto LABEL_78;
    }
    if (a2)
      *a2 = 1013;
LABEL_82:
    ctf_sect_munmap((uint64_t)v78);
    ctf_sect_munmap((uint64_t)&v74);
    ctf_sect_munmap((uint64_t)&v70);
    v5 = 0;
  }
  else
  {
    v60 = 0;
    v61 = 0;
LABEL_78:
    v64 = ctf_bufopen(v78, (uint64_t)v60, (uint64_t)v61, a2, v56, v57, v58, v59);
    v5 = v64;
    if (!v64)
      goto LABEL_82;
    *(_DWORD *)(v64 + 556) |= 1u;
  }
  v13 = v65;
  v14 = v66;
LABEL_18:
  munmap(v13, v14);
  return v5;
}

uint64_t ctf_open(const char *a1, int *a2)
{
  int v3;
  int v4;
  uint64_t v5;

  v3 = open(a1, 0);
  if (v3 == -1)
  {
    if (a2)
      *a2 = *__error();
    return 0;
  }
  else
  {
    v4 = v3;
    v5 = ctf_fdopen(v3, a2);
    close(v4);
    return v5;
  }
}

uint64_t ctf_write(uint64_t a1, int __fd)
{
  uint64_t v2;
  size_t v3;
  char *v6;
  ssize_t v7;

  v2 = *(_QWORD *)(a1 + 472);
  v3 = v2 + 36;
  if (v2 == -36)
    return 0;
  v6 = *(char **)(a1 + 456);
  while (1)
  {
    v7 = write(__fd, v6, v3);
    if (v7 <= 0)
      break;
    v6 += v7;
    v3 -= v7;
    if (!v3)
      return 0;
  }
  *(_DWORD *)(a1 + 560) = *__error();
  return 0xFFFFFFFFLL;
}

uint64_t ctf_version(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  int *v9;
  int v10;

  if ((a1 & 0x80000000) != 0)
  {
    v9 = __error();
    v10 = 22;
  }
  else
  {
    v8 = a1;
    if (!(_DWORD)a1)
      return _libctf_version;
    if (a1 < 5)
    {
      ctf_dprintf("ctf_version: client using version %d\n", a2, a3, a4, a5, a6, a7, a8, a1);
      _libctf_version = v8;
      return v8;
    }
    v9 = __error();
    v10 = 45;
  }
  *v9 = v10;
  return 0xFFFFFFFFLL;
}

uint64_t ctf_lookup_by_name(const char **a1, const char *a2)
{
  size_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  const char *v8;
  char *v9;
  char *v10;
  char *v11;
  unsigned int v12;
  int v13;
  char *v14;
  char *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  char *v19;
  unsigned int v20;
  const char *v21;
  _QWORD *v22;
  unint64_t v23;
  const char *v24;
  char *v25;
  unsigned int v26;
  int v27;
  char *v28;
  char *v29;
  unsigned int v30;
  int v31;
  _DWORD *v32;
  char v33;
  int v34;
  const char *v35;
  const char **v37;

  if (a2)
  {
    v4 = strlen(a2);
    if (*a2)
    {
      v5 = 0;
      v6 = (char *)&a2[v4];
      v7 = MEMORY[0x1E0C80978];
      v37 = a1 + 38;
      v8 = a2;
      while (1)
      {
        v9 = (char *)(v8 - 1);
        do
        {
          v10 = (char *)v8;
          v11 = v9;
          v12 = *v8;
          if ((v12 & 0x80000000) != 0)
            v13 = __maskrune(v12, 0x4000uLL);
          else
            v13 = *(_DWORD *)(v7 + 4 * v12 + 60) & 0x4000;
          ++v8;
          v9 = v11 + 1;
        }
        while (v13);
        if (v10 == v6)
        {
          v33 = *v6 != 0;
LABEL_52:
          if ((v33 & 1) == 0 && v5)
            return v5;
          break;
        }
        v14 = strpbrk(v10 + 1, ctf_lookup_by_name_delimiters);
        if (v14)
          v15 = v14;
        else
          v15 = v6;
        if (*v10 == 42)
        {
          v16 = a1[63];
          v17 = *(unsigned int *)&v16[4 * (*((unsigned int (**)(uint64_t))*a1 + 5))(v5)];
          if (!(_DWORD)v17)
          {
            if (ctf_type_resolve((uint64_t)a1, v5) == -1)
              goto LABEL_48;
            v18 = a1[63];
            v17 = *(unsigned int *)&v18[4 * (*((unsigned int (**)(void))*a1 + 5))()];
            if (!(_DWORD)v17)
              goto LABEL_48;
          }
          v5 = (*((uint64_t (**)(uint64_t, _QWORD))*a1 + 6))(v17, (*((_DWORD *)a1 + 139) >> 1) & 1);
        }
        else
        {
          v19 = (char *)(v15 - v10);
          v20 = (_DWORD)v15 - (_DWORD)v10 + *(v15 - 1) - 105;
          if (v20 > 0x14
            || (&isqualifier_qhash)[2 * (int)v20 + 1] != v19
            || (v8 = v15, strncmp((&isqualifier_qhash)[2 * (int)v20], v10, v15 - v10)))
          {
            v21 = *v37;
            if (!*v37)
              goto LABEL_48;
            v22 = a1 + 38;
            while (*v21)
            {
              if (!strncmp(v10, v21, (size_t)v19))
              {
                v23 = v22[1];
                if ((unint64_t)v19 >= v23)
                  goto LABEL_29;
              }
              v24 = (const char *)v22[3];
              v22 += 3;
              v21 = v24;
              if (!v24)
                goto LABEL_48;
            }
            v23 = v22[1];
LABEL_29:
            v25 = &v11[v23];
            do
            {
              v26 = v25[1];
              if ((v26 & 0x80000000) != 0)
                v27 = __maskrune(v26, 0x4000uLL);
              else
                v27 = *(_DWORD *)(v7 + 4 * v26 + 60) & 0x4000;
              ++v25;
            }
            while (v27);
            v28 = strchr(v25, 42);
            v29 = v28 ? v28 : v6;
            v8 = v29 + 1;
            do
            {
              v30 = *(v8 - 2);
              if ((v30 & 0x80000000) != 0)
                v31 = __maskrune(v30, 0x4000uLL);
              else
                v31 = *(_DWORD *)(v7 + 4 * v30 + 60) & 0x4000;
              --v8;
            }
            while (v31);
            v32 = ctf_hash_lookup(v22[2], (uint64_t)a1, v25, v8 - v25);
            if (!v32 || !*v22)
            {
LABEL_48:
              *((_DWORD *)a1 + 140) = 1028;
              v35 = a1[66];
              if (v35)
              {
                v5 = ctf_lookup_by_name(v35, a2);
                if (v5 != -1)
                  return v5;
              }
              return -1;
            }
            v5 = v32[1];
          }
        }
        v33 = *v8;
        if (!*v8)
          goto LABEL_52;
      }
    }
    v34 = 1029;
  }
  else
  {
    v34 = 22;
  }
  *((_DWORD *)a1 + 140) = v34;
  return -1;
}

uint64_t ctf_lookup_by_symbol(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v6;
  int v7;
  char v8;
  uint64_t v9;
  int v10;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = *(_QWORD *)(a1 + 88);
  if (!v2)
  {
    v7 = 1010;
    goto LABEL_34;
  }
  if (*(_QWORD *)(a1 + 488) <= a2)
  {
    v7 = 22;
    goto LABEL_34;
  }
  v3 = *(_QWORD *)(a1 + 104);
  if (v3 == 20)
  {
    v8 = *(_BYTE *)(v2 + 20 * a2 + 12);
    goto LABEL_25;
  }
  if (v3 != 16)
  {
    if (v3 == 12)
    {
      v4 = *(_BYTE *)(v2 + 12 * a2 + 4) & 0xF;
      if (v4 == 1)
      {
        if (*(_BYTE *)(v2 + 12 * a2 + 5))
          goto LABEL_27;
      }
      else if (v4 != 15 && v4 != 3)
      {
        goto LABEL_27;
      }
      v6 = v2 + 12 * a2;
      goto LABEL_23;
    }
    v8 = *(_BYTE *)(v2 + 40 * a2 + 8);
LABEL_25:
    v12 = v8 & 0xF;
    goto LABEL_26;
  }
  v9 = v2 + 16 * a2;
  v10 = *(_BYTE *)(v9 + 4) & 0xF;
  if (v10 == 1)
  {
    if (*(_BYTE *)(v9 + 5))
      goto LABEL_27;
    goto LABEL_22;
  }
  if (v10 == 15 || v10 == 3)
  {
LABEL_22:
    v6 = v2 + 16 * a2;
LABEL_23:
    v12 = *(unsigned __int16 *)(v6 + 6);
LABEL_26:
    if (v12 == 1)
      goto LABEL_27;
    v7 = 1032;
LABEL_34:
    *(_DWORD *)(a1 + 560) = v7;
    return -1;
  }
LABEL_27:
  v13 = *(unsigned int *)(*(_QWORD *)(a1 + 480) + 4 * a2);
  if ((_DWORD)v13 == -1)
    goto LABEL_33;
  v14 = *(_QWORD *)(a1 + 464);
  if (*(int *)(a1 + 564) > 3)
  {
    v15 = *(unsigned int *)(v14 + v13);
    if (v15)
      return v15;
LABEL_33:
    v7 = 1033;
    goto LABEL_34;
  }
  v15 = *(unsigned __int16 *)(v14 + v13);
  if (!v15)
    goto LABEL_33;
  return v15;
}

uint64_t ctf_lookup_by_id(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  unsigned int v5;
  uint64_t result;

  v4 = *(_QWORD **)a1;
  if ((*(_BYTE *)(*(_QWORD *)a1 + 556) & 2) != 0
    && (*(unsigned int (**)(uint64_t))(*v4 + 24))(a2)
    && (v4 = (_QWORD *)v4[66]) == 0)
  {
    result = 0;
    *(_DWORD *)(*(_QWORD *)a1 + 560) = 1011;
  }
  else
  {
    v5 = (*(uint64_t (**)(uint64_t))(*v4 + 40))(a2);
    if (v5 && v4[64] >= (unint64_t)v5)
    {
      *(_QWORD *)a1 = v4;
      return *(unsigned int *)(v4[62] + 4 * v5) + v4[58];
    }
    else
    {
      result = 0;
      *((_DWORD *)v4 + 140) = 1020;
    }
  }
  return result;
}

uint64_t ctf_func_info(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5;
  int *v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t result;
  uint64_t v15;
  int v16;
  int v17;
  _BOOL4 v18;
  BOOL v19;

  if (!*(_QWORD *)(a1 + 88))
  {
    v10 = 1010;
LABEL_11:
    *(_DWORD *)(a1 + 560) = v10;
    return 0xFFFFFFFFLL;
  }
  if (*(_QWORD *)(a1 + 488) <= a2)
  {
    v10 = 22;
    goto LABEL_11;
  }
  v5 = *(unsigned int *)(*(_QWORD *)(a1 + 480) + 4 * a2);
  if ((_DWORD)v5 == -1
    || ((v7 = (int *)(*(_QWORD *)(a1 + 464) + v5), *(_DWORD *)(a1 + 564) != 4)
      ? (LOWORD(v8) = *(_WORD *)v7, v9 = *((unsigned __int16 *)v7 + 1))
      : (v8 = *v7, v9 = v7[1]),
        v11 = (unsigned __int16)v8,
        v12 = (**(uint64_t (***)(uint64_t))a1)(v11),
        v13 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16))(v11),
        !(v12 | v13)))
  {
    v10 = 1031;
    goto LABEL_11;
  }
  if (v12 != 5)
  {
    v10 = 1007;
    goto LABEL_11;
  }
  *(_QWORD *)a3 = v9;
  *(_DWORD *)(a3 + 8) = v13;
  *(_DWORD *)(a3 + 12) = 0;
  v15 = *(unsigned int *)(*(_QWORD *)(a1 + 480) + 4 * a2) + *(_QWORD *)(a1 + 464);
  v16 = v13 - 1;
  if (*(_DWORD *)(a1 + 564) == 4)
    v17 = *(_DWORD *)(v15 + 4 * v16 + 8);
  else
    v17 = *(unsigned __int16 *)(v15 + 2 * v16 + 4);
  v18 = v17 == 0;
  v19 = v13 == 0;
  result = 0;
  v19 = v19 || !v18;
  if (!v19)
  {
    *(_DWORD *)(a3 + 8) = v16;
    *(_DWORD *)(a3 + 12) = 1;
  }
  return result;
}

uint64_t ctf_func_args(uint64_t a1, unint64_t a2, unsigned int a3, _QWORD *a4)
{
  uint64_t result;
  unsigned int v9;
  int v10;
  uint64_t v11;
  unsigned int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v15 = 0;
  v16 = 0;
  result = ctf_func_info(a1, a2, (uint64_t)&v15);
  if ((_DWORD)result != -1)
  {
    v9 = v16;
    if (v16 >= a3)
      v9 = a3;
    if (v9)
    {
      v10 = *(_DWORD *)(a1 + 564);
      v11 = 8;
      if (v10 < 4)
        v11 = 4;
      v12 = (unsigned int *)(v11 + *(_QWORD *)(a1 + 464) + *(unsigned int *)(*(_QWORD *)(a1 + 480) + 4 * a2));
      do
      {
        if (v10 == 4)
        {
          v13 = *v12;
          v14 = 4;
        }
        else
        {
          v13 = *(unsigned __int16 *)v12;
          v14 = 2;
        }
        v12 = (unsigned int *)((char *)v12 + v14);
        *a4++ = v13;
        --v9;
      }
      while (v9);
    }
    return 0;
  }
  return result;
}

uint64_t ctf_bufopen(__int128 *a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12;
  unsigned __int16 *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  __int128 *v23;
  __int128 v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int v36;
  size_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  BOOL v41;
  _BYTE *v42;
  char *v43;
  const char **v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unsigned int v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  const char *v62;
  char *v63;
  const char *v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  const char *v68;
  const char *v69;
  _BYTE *v70;
  char v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  unint64_t v80;
  uint64_t v81;
  unint64_t v82;
  const char *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  int inited;
  uint64_t v102;
  char **v103;
  _BYTE *v105;
  unsigned int v106;
  unsigned int v107;
  __int128 v108;
  __int128 v109;
  unsigned int v110;

  if (!a1 || (a2 != 0) == (a3 == 0))
  {
    if (a4)
    {
      v38 = 0;
      v39 = 22;
LABEL_20:
      *a4 = v39;
      return v38;
    }
    return 0;
  }
  if (a2)
  {
    v12 = *(_QWORD *)(a2 + 40);
    if (v12 != 12 && v12 != 16)
    {
      if (a4)
      {
        v38 = 0;
        v39 = 1004;
        goto LABEL_20;
      }
      return 0;
    }
    if (!*(_QWORD *)(a2 + 24))
    {
      if (a4)
      {
        v38 = 0;
        v39 = 1005;
        goto LABEL_20;
      }
      return 0;
    }
  }
  if (a3 && !*(_QWORD *)(a3 + 24))
  {
    if (a4)
    {
      v38 = 0;
      v39 = 1006;
      goto LABEL_20;
    }
    return 0;
  }
  if (*((_QWORD *)a1 + 4) <= 3uLL)
    goto LABEL_43;
  v14 = (unsigned __int16 *)*((_QWORD *)a1 + 3);
  ctf_dprintf("ctf_bufopen: magic=0x%x version=%u\n", a2, a3, (uint64_t)a4, a5, a6, a7, a8, *v14);
  if (*v14 != 53233)
    goto LABEL_43;
  v22 = *((unsigned __int8 *)v14 + 2);
  if ((v22 - 2) >= 3)
  {
    if (v22 != 1)
    {
      if (a4)
      {
        v38 = 0;
        v39 = 1002;
        goto LABEL_20;
      }
      return 0;
    }
    if (*((_QWORD *)a1 + 4) >= 0x18uLL)
    {
      v40 = *((_QWORD *)a1 + 3);
      *(_QWORD *)((char *)&v108 + 4) = 0;
      HIDWORD(v108) = 0;
      LODWORD(v108) = *(_DWORD *)v40;
      v109 = *(_OWORD *)(v40 + 4);
      v25 = *(_DWORD *)(v40 + 20);
      v110 = v25;
      v26 = HIDWORD(v109);
      v28 = v25 + HIDWORD(v109);
      ctf_dprintf("ctf_bufopen: uncompressed size=%lu\n", v15, v16, v17, v18, v19, v20, v21, v25 + BYTE12(v109));
      v27 = 0;
      v36 = v109;
      v37 = 24;
      goto LABEL_30;
    }
LABEL_43:
    if (a4)
    {
      v38 = 0;
      v39 = 1009;
      goto LABEL_20;
    }
    return 0;
  }
  if (*((_QWORD *)a1 + 4) <= 0x23uLL)
    goto LABEL_43;
  v23 = (__int128 *)*((_QWORD *)a1 + 3);
  v24 = v23[1];
  v108 = *v23;
  v109 = v24;
  v25 = *((_DWORD *)v23 + 8);
  v110 = v25;
  v26 = HIDWORD(v24);
  v27 = HIDWORD(v108);
  v28 = v25 + HIDWORD(v24);
  ctf_dprintf("ctf_bufopen: uncompressed size=%lu\n", v15, v16, v17, v18, v19, v20, v21, v25 + BYTE12(v24));
  if (HIDWORD(v108) > v28)
    goto LABEL_41;
  v36 = v109;
  v37 = 36;
LABEL_30:
  if (v36 > v28
    || DWORD1(v109) > v28
    || (v26 <= v28 ? (v41 = DWORD2(v109) > v28) : (v41 = 1),
        v41
     || DWORD2(v109) > v26
     || v27 > v36
     || v36 > DWORD1(v109)
     || DWORD1(v109) > DWORD2(v109)
     || (BYTE8(v109) | v27) & 3 | (BYTE4(v109) | v36) & 1))
  {
LABEL_41:
    if (a4)
    {
      v38 = 0;
      v39 = 1007;
      goto LABEL_20;
    }
    return 0;
  }
  v106 = v26;
  v107 = v25;
  if ((BYTE3(v108) & 1) == 0)
  {
    v42 = (_BYTE *)*((_QWORD *)a1 + 3);
    v105 = &v42[v37];
    goto LABEL_49;
  }
  if (!ctf_zopen(a4, v29, v30, v31, v32, v33, v34, v35))
    return 0;
  v70 = mmap(0, v37 + v28, 3, 4098, -1, 0);
  if (v70 == (_BYTE *)-1)
  {
    if (!a4)
      return 0;
    v79 = 1016;
    goto LABEL_113;
  }
  v42 = v70;
  memmove(v70, *((const void **)a1 + 3), v37);
  v42[3] &= ~1u;
  v105 = &v42[v37];
  if (zlib())
  {
    v71 = off_1EE52EC88();
    ctf_dprintf("zlib inflate err: %s\n", v72, v73, v74, v75, v76, v77, v78, v71);
    munmap(v42, v37 + v28);
    if (!a4)
      return 0;
    v79 = 1017;
LABEL_113:
    *a4 = v79;
    return 0;
  }
  mprotect(v42, v37 + v28, 1);
LABEL_49:
  v43 = (char *)malloc_type_malloc(0x278uLL, 0xCFAB4140uLL);
  if (!v43)
  {
    if (a4)
    {
      v38 = 0;
      v39 = 35;
      goto LABEL_20;
    }
    return 0;
  }
  v38 = (uint64_t)v43;
  v44 = (const char **)(v43 + 8);
  bzero(v43 + 8, 0x270uLL);
  v52 = BYTE2(v108);
  *(_DWORD *)(v38 + 564) = BYTE2(v108);
  *(_QWORD *)v38 = (char *)&ctf_fileops + 72 * v52;
  v53 = *a1;
  v54 = a1[1];
  v55 = a1[2];
  *(_QWORD *)(v38 + 56) = *((_QWORD *)a1 + 6);
  *(_OWORD *)(v38 + 40) = v55;
  *(_OWORD *)(v38 + 24) = v54;
  *(_OWORD *)(v38 + 8) = v53;
  if (a2)
  {
    v56 = *(_OWORD *)a2;
    v57 = *(_OWORD *)(a2 + 16);
    v58 = *(_OWORD *)(a2 + 32);
    *(_QWORD *)(v38 + 112) = *(_QWORD *)(a2 + 48);
    *(_OWORD *)(v38 + 80) = v57;
    *(_OWORD *)(v38 + 96) = v58;
    *(_OWORD *)(v38 + 64) = v56;
    v59 = *(_OWORD *)a3;
    v60 = *(_OWORD *)(a3 + 16);
    v61 = *(_OWORD *)(a3 + 32);
    *(_QWORD *)(v38 + 168) = *(_QWORD *)(a3 + 48);
    *(_OWORD *)(v38 + 152) = v61;
    *(_OWORD *)(v38 + 136) = v60;
    *(_OWORD *)(v38 + 120) = v59;
  }
  if (*v44)
    *v44 = ctf_strdup(*v44);
  v62 = *(const char **)(v38 + 64);
  if (v62)
    *(_QWORD *)(v38 + 64) = ctf_strdup(v62);
  v63 = *(char **)(v38 + 120);
  if (v63)
  {
    v63 = ctf_strdup(v63);
    *(_QWORD *)(v38 + 120) = v63;
  }
  if (!*v44)
    *v44 = (const char *)&_CTF_NULLSTR;
  if (!*(_QWORD *)(v38 + 64))
    *(_QWORD *)(v38 + 64) = &_CTF_NULLSTR;
  if (!v63)
    *(_QWORD *)(v38 + 120) = &_CTF_NULLSTR;
  *(_QWORD *)(v38 + 424) = &v105[v106];
  *(_QWORD *)(v38 + 432) = v107;
  if (a3)
  {
    *(_QWORD *)(v38 + 440) = *(_QWORD *)(a3 + 24);
    *(_QWORD *)(v38 + 448) = *(_QWORD *)(a3 + 32);
  }
  *(_QWORD *)(v38 + 456) = v42;
  *(_QWORD *)(v38 + 464) = v105;
  *(_QWORD *)(v38 + 472) = v37 + v28;
  v64 = "(?)";
  if (DWORD1(v108))
  {
    v65 = v38 + 16 * ((unint64_t)DWORD1(v108) >> 31);
    v66 = *(_QWORD *)(v65 + 424);
    if (v66)
    {
      v67 = DWORD1(v108) & 0x7FFFFFFF;
      v68 = (const char *)(v66 + v67);
      if (*(_QWORD *)(v65 + 432) <= v67)
        v69 = 0;
      else
        v69 = v68;
    }
    else
    {
      v69 = 0;
    }
    if (!v69)
      v69 = "(?)";
    *(_QWORD *)(v38 + 536) = v69;
  }
  if (DWORD2(v108))
  {
    v80 = v38 + 16 * ((unint64_t)DWORD2(v108) >> 31);
    v81 = *(_QWORD *)(v80 + 424);
    if (v81)
    {
      v82 = DWORD2(v108) & 0x7FFFFFFF;
      v83 = (const char *)(v81 + v82);
      if (*(_QWORD *)(v80 + 432) <= v82)
        v84 = 0;
      else
        v84 = v83;
    }
    else
    {
      v84 = 0;
    }
    if (v84)
      v64 = v84;
    *(_QWORD *)(v38 + 544) = v64;
  }
  else
  {
    v64 = *(const char **)(v38 + 544);
  }
  if (!v64)
    v64 = "<NULL>";
  ctf_dprintf("ctf_bufopen: parent name %s (label %s)\n", v45, v46, v47, v48, v49, v50, v51, (char)v64);
  if (a2)
  {
    v91 = *(_QWORD *)(a2 + 32) / *(_QWORD *)(a2 + 40);
    *(_QWORD *)(v38 + 488) = v91;
    v92 = 2;
    if (*(_DWORD *)(v38 + 564) == 4)
      v92 = 3;
    v93 = malloc_type_malloc(v91 << v92, 0xCFAB4140uLL);
    *(_QWORD *)(v38 + 480) = v93;
    if (!v93)
    {
      inited = 35;
      goto LABEL_107;
    }
    init_symtab(v38, &v108, a2, a3, v97, v98, v99, v100);
  }
  inited = init_types(v38, &v108, v85, v86, v87, v88, v89, v90);
  if (inited)
  {
LABEL_107:
    if (a4)
      *a4 = inited;
    ctf_close(v38, v94, v95, v96, v97, v98, v99, v100);
    return 0;
  }
  *(_QWORD *)(v38 + 304) = "struct";
  *(_QWORD *)(v38 + 312) = 6;
  *(_QWORD *)(v38 + 320) = v38 + 176;
  *(_QWORD *)(v38 + 328) = "union";
  *(_QWORD *)(v38 + 336) = 5;
  *(_QWORD *)(v38 + 344) = v38 + 208;
  *(_QWORD *)(v38 + 352) = "enum";
  *(_QWORD *)(v38 + 360) = 4;
  *(_QWORD *)(v38 + 368) = v38 + 240;
  *(_QWORD *)(v38 + 376) = &_CTF_NULLSTR;
  *(_QWORD *)(v38 + 384) = 0;
  *(_QWORD *)(v38 + 392) = v38 + 272;
  *(_QWORD *)(v38 + 408) = 0;
  *(_QWORD *)(v38 + 416) = 0;
  *(_QWORD *)(v38 + 400) = 0;
  if (a2)
  {
    v102 = *(_QWORD *)(a2 + 40);
    v103 = &off_1E4158460;
    if (v102 != 40 && v102 != 16)
      v103 = &_libctf_models;
  }
  else
  {
    v103 = &off_1E4158460;
  }
  *(_QWORD *)(v38 + 520) = v103;
  *(_DWORD *)(v38 + 552) = 1;
  return v38;
}

const char *init_symtab(uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  unsigned int *v11;
  unsigned int *v12;
  int v13;
  unsigned int *v14;
  char v15;
  int v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  unsigned int v26;
  int v27;
  __int128 *v28;
  char v29;
  const char *v30;
  int v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  char v37;
  int v38;
  unsigned int v40;
  unsigned int v41;
  __int128 v43;
  __int128 v44;
  uint64_t v45;

  v8 = *(_QWORD *)(a1 + 488);
  if (v8 >= 1)
  {
    v11 = *(unsigned int **)(a1 + 480);
    v12 = &v11[v8];
    v13 = *(_DWORD *)(a1 + 564);
    v14 = *(unsigned int **)(a3 + 24);
    v40 = a2[4];
    v41 = a2[5];
    v45 = 0;
    v43 = 0u;
    v44 = 0u;
    if (v13 < 4)
      v15 = 1;
    else
      v15 = 2;
    if (v13 >= 4)
      v16 = 4;
    else
      v16 = 2;
    v37 = v15;
    v38 = v16;
    v17 = *(_QWORD *)(a3 + 40);
    while (1)
    {
      switch(v17)
      {
        case 12:
          v19 = *v14;
          if (!(_DWORD)v19)
            goto LABEL_27;
          v20 = *(_QWORD *)(a4 + 24);
          v21 = (_BYTE *)(v20 + v19);
          if (*v21 == 95)
            LODWORD(v21) = (_DWORD)v21 + 1;
          v18 = ((_DWORD)v21 - v20);
          *(_QWORD *)&v44 = v14[2];
          BYTE8(v43) = 0;
          v22 = -2;
          break;
        case 16:
          v23 = *v14;
          if (!(_DWORD)v23)
          {
LABEL_27:
            v18 = 0;
            goto LABEL_34;
          }
          v24 = *(_QWORD *)(a4 + 24);
          v25 = (_BYTE *)(v24 + v23);
          if (*v25 == 95)
            LODWORD(v25) = (_DWORD)v25 + 1;
          v18 = ((_DWORD)v25 - v24);
          *(_QWORD *)&v44 = *((_QWORD *)v14 + 1);
          BYTE8(v43) = 0;
          v22 = -3;
          break;
        case 20:
          v18 = *v14;
          *(_QWORD *)&v44 = v14[1];
          BYTE8(v43) = *((_BYTE *)v14 + 12);
          WORD5(v43) = *((_WORD *)v14 + 7);
          goto LABEL_34;
        default:
          v18 = *(_QWORD *)v14;
          v28 = (__int128 *)v14;
          goto LABEL_35;
      }
      WORD5(v43) = v22;
      v26 = *((unsigned __int8 *)v14 + 4);
      if (v26 >= 0x20)
      {
        if (v26 == 32)
          goto LABEL_32;
        if (v26 == 36)
        {
          v29 = 18;
LABEL_33:
          BYTE8(v43) = v29;
        }
      }
      else
      {
        v27 = v26 & 0xF;
        if (v27 != 1)
        {
          if (v27 == 15 || v27 == 3)
            BYTE8(v43) = *((_BYTE *)v14 + 6) & 0xF | 0x10;
          goto LABEL_34;
        }
        if (!*((_BYTE *)v14 + 5))
        {
LABEL_32:
          v29 = 17;
          goto LABEL_33;
        }
      }
LABEL_34:
      v28 = &v43;
LABEL_35:
      v30 = (const char *)&_CTF_NULLSTR;
      if (v18 < *(_QWORD *)(a4 + 32))
        v30 = (const char *)(*(_QWORD *)(a4 + 24) + v18);
      if (!v18)
        goto LABEL_50;
      v31 = *((unsigned __int16 *)v28 + 5);
      if (!*((_WORD *)v28 + 5) || !strcmp(v30, "_START_") || !strcmp(v30, "_END_"))
        goto LABEL_50;
      v32 = *((_BYTE *)v28 + 8) & 0xF;
      if (v32 == 2)
      {
        if (v41 < a2[6])
        {
          *v11 = v41;
          v33 = *(_QWORD *)(a1 + 464);
          if (*(_DWORD *)(a1 + 564) == 4)
            v34 = *(unsigned int *)(v33 + v41);
          else
            v34 = *(unsigned __int16 *)(v33 + v41);
          v35 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16))(v34);
          if ((**(unsigned int (***)(uint64_t))a1)(v34) | v35)
            v41 += (v35 + 2) << v37;
          else
            v41 += v38;
          goto LABEL_51;
        }
LABEL_50:
        *v11 = -1;
        goto LABEL_51;
      }
      if (v32 != 1 || v40 >= a2[5] || v31 == 65521 && !*((_QWORD *)v28 + 2))
        goto LABEL_50;
      *v11 = v40;
      v40 += v38;
LABEL_51:
      ++v11;
      v17 = *(_QWORD *)(a3 + 40);
      v14 = (unsigned int *)((char *)v14 + v17);
      if (v11 >= v12)
      {
        v8 = *(_QWORD *)(a1 + 488);
        return ctf_dprintf("loaded %lu symtab entries\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v8);
      }
    }
  }
  return ctf_dprintf("loaded %lu symtab entries\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v8);
}

uint64_t init_types(uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  unsigned int *v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 *v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int *v31;
  unsigned int v32;
  unsigned __int16 *v33;
  unsigned int v34;
  unsigned __int16 *v35;
  unsigned int v36;
  uint64_t result;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  unsigned int v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char *v55;
  char *v56;
  char *v57;
  int v58;
  unsigned int v59;
  uint64_t *v60;
  uint64_t v61;
  size_t v62;
  _DWORD *v63;
  _DWORD *v64;
  int v65;
  uint64_t v66;
  int v67;
  unint64_t v69;
  int v70;
  int v72;
  int v73;
  int v75;
  unsigned int v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  size_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  int v91;
  BOOL v92;
  char v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  int v101;
  char v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  int v110;
  char v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  int v119;
  char v120;
  unint64_t v121;
  int v122;
  unsigned int *v123;
  uint64_t v124;
  unint64_t v125;
  uint64_t v126;
  uint64_t v127;
  unint64_t v128;
  const char *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  int v135;
  int v136;
  uint64_t *v137;
  unsigned int v138;
  unsigned int v139;
  unsigned int *v140;
  _DWORD *v141;
  uint64_t v142;
  int v143;
  uint64_t v144;
  uint64_t v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  int64x2_t v151[11];
  uint64_t v152;

  v152 = *MEMORY[0x1E0C80C00];
  v9 = *(_QWORD *)(a1 + 464);
  v10 = a2[6];
  v11 = a2[7];
  v12 = v9 + v10;
  v13 = v9 + v11;
  v150 = 0u;
  memset(v151, 0, sizeof(v151));
  v148 = 0u;
  v149 = 0u;
  v146 = 0u;
  v147 = 0u;
  v14 = a2[2] != 0;
  v138 = v11;
  v139 = v10;
  v140 = (unsigned int *)(v9 + v10);
  if (v10 < v11)
  {
    while (1)
    {
      if (*(int *)(a1 + 564) > 3)
        v15 = *(unsigned int *)(v12 + 4);
      else
        v15 = *(unsigned __int16 *)(v12 + 4);
      v16 = (**(uint64_t (***)(uint64_t))a1)(v15);
      if (*(int *)(a1 + 564) > 3)
        v17 = *(unsigned int *)(v12 + 4);
      else
        v17 = *(unsigned __int16 *)(v12 + 4);
      v18 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16))(v17);
      v142 = 0;
      v145 = 0;
      ctf_get_ctt_size((_DWORD *)a1, v12, (unint64_t *)&v142, &v145);
      v19 = v18;
      v20 = 4;
      switch(v16)
      {
        case 0u:
          goto LABEL_47;
        case 1u:
        case 2u:
          goto LABEL_53;
        case 3u:
        case 0xAu:
        case 0xBu:
        case 0xCu:
        case 0xDu:
          if (*(int *)(a1 + 564) > 3)
            v21 = *(unsigned int *)(v12 + 8);
          else
            v21 = *(unsigned __int16 *)(v12 + 6);
          v20 = 0;
          v14 |= (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 32))(v21);
          goto LABEL_53;
        case 4u:
          if (*(_DWORD *)(a1 + 564) == 4)
            v20 = 12;
          else
            v20 = 8;
          goto LABEL_53;
        case 5u:
          v25 = (v19 & 1) + v19;
          v26 = 2 * v25;
          v27 = 4 * v25;
          if (*(_DWORD *)(a1 + 564) == 4)
            v20 = v27;
          else
            v20 = v26;
          goto LABEL_53;
        case 6u:
        case 7u:
          v22 = *(_DWORD *)(a1 + 564);
          if (v22 == 1 || v142 < 0x2000)
          {
            if (v22 == 4)
            {
              v20 = 12 * v19;
              if ((_DWORD)v19)
              {
                v31 = (unsigned int *)(v145 + v12 + 4);
                do
                {
                  v32 = *v31;
                  v31 += 3;
                  v14 |= (*(uint64_t (**)(_QWORD))(*(_QWORD *)a1 + 32))(v32);
                  LODWORD(v19) = v19 - 1;
                }
                while ((_DWORD)v19);
              }
            }
            else
            {
              v20 = 8 * v19;
              if ((_DWORD)v19)
              {
                v35 = (unsigned __int16 *)(v145 + v12 + 4);
                do
                {
                  v36 = *v35;
                  v35 += 4;
                  v14 |= (*(uint64_t (**)(_QWORD))(*(_QWORD *)a1 + 32))(v36);
                  LODWORD(v19) = v19 - 1;
                }
                while ((_DWORD)v19);
              }
            }
          }
          else
          {
            v20 = 16 * v19;
            if (v22 == 4)
            {
              if ((_DWORD)v19)
              {
                v23 = (unsigned int *)(v145 + v12 + 4);
                do
                {
                  v24 = *v23;
                  v23 += 4;
                  v14 |= (*(uint64_t (**)(_QWORD))(*(_QWORD *)a1 + 32))(v24);
                  LODWORD(v19) = v19 - 1;
                }
                while ((_DWORD)v19);
              }
            }
            else if ((_DWORD)v19)
            {
              v33 = (unsigned __int16 *)(v145 + v12 + 4);
              do
              {
                v34 = *v33;
                v33 += 8;
                v14 |= (*(uint64_t (**)(_QWORD))(*(_QWORD *)a1 + 32))(v34);
                LODWORD(v19) = v19 - 1;
              }
              while ((_DWORD)v19);
            }
          }
          goto LABEL_53;
        case 8u:
          v20 = 8 * v19;
          goto LABEL_53;
        case 9u:
          if (*(int *)(a1 + 564) > 3)
          {
            v28 = &v149;
            if (*(_DWORD *)(v12 + 8))
            {
              v28 = &v149;
              if (*(_DWORD *)(v12 + 8) <= 0x1Eu)
              {
                v29 = *(unsigned int *)(v12 + 8);
                goto LABEL_45;
              }
            }
          }
          else
          {
            v28 = &v149;
            if (*(_WORD *)(v12 + 6))
            {
              v28 = &v149;
              if (*(unsigned __int16 *)(v12 + 6) <= 0x1Eu)
              {
                v29 = *(unsigned __int16 *)(v12 + 6);
LABEL_45:
                v28 = (__int128 *)((char *)&v146 + 8 * v29);
              }
            }
          }
          ++*(_QWORD *)v28;
LABEL_47:
          v20 = 0;
LABEL_53:
          v12 += v20 + v145;
          ++*((_QWORD *)&v146 + v16);
          ++*(_QWORD *)(a1 + 512);
          if (v13 <= v12)
            goto LABEL_54;
          break;
        case 0xEu:
          if (*(int *)(a1 + 564) > 3)
            v30 = *(unsigned int *)(v12 + 8);
          else
            v30 = *(unsigned __int16 *)(v12 + 6);
          v14 |= (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 32))(v30);
          v20 = 4;
          goto LABEL_53;
        default:
          ctf_dprintf("detected invalid CTF kind -- %u\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v16);
          return 1007;
      }
    }
  }
LABEL_54:
  if (v14)
  {
    ctf_dprintf("CTF container %p is a child\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, a1);
    *(_DWORD *)(a1 + 556) |= 2u;
  }
  else
  {
    ctf_dprintf("CTF container %p is a parent\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, a1);
  }
  result = ctf_hash_create(a1 + 176, v149);
  if (!(_DWORD)result)
  {
    result = ctf_hash_create(a1 + 208, *((unint64_t *)&v149 + 1));
    if (!(_DWORD)result)
    {
      result = ctf_hash_create(a1 + 240, v150);
      if (!(_DWORD)result)
      {
        result = ctf_hash_create(a1 + 272, vaddvq_s64(vaddq_s64(*(int64x2_t *)((char *)v151 + 8), *(int64x2_t *)((char *)&v151[1] + 8)))+ *((_QWORD *)&v146 + 1)+ v147+ *((_QWORD *)&v148 + 1)+ v151[0].i64[0]+ *((_QWORD *)&v147 + 1));
        if (!(_DWORD)result)
        {
          *(_QWORD *)(a1 + 496) = malloc_type_malloc(4 * *(_QWORD *)(a1 + 512) + 4, 0xCFAB4140uLL);
          v38 = malloc_type_malloc(4 * *(_QWORD *)(a1 + 512) + 4, 0xCFAB4140uLL);
          *(_QWORD *)(a1 + 504) = v38;
          result = 35;
          v141 = *(_DWORD **)(a1 + 496);
          if (v141)
          {
            if (v38)
            {
              v137 = (uint64_t *)(a1 + 272);
              *v141 = 0;
              bzero(v141, 4 * *(_QWORD *)(a1 + 512) + 4);
              bzero(*(void **)(a1 + 504), 4 * *(_QWORD *)(a1 + 512) + 4);
              if (v139 < v138)
              {
                v135 = 0;
                v136 = 0;
                v46 = 1;
                while (1)
                {
                  if (*(int *)(a1 + 564) > 3)
                    v47 = v140[1];
                  else
                    v47 = *((unsigned __int16 *)v140 + 2);
                  v48 = (**(uint64_t (***)(uint64_t))a1)(v47);
                  if (*(int *)(a1 + 564) > 3)
                    v49 = v140[1];
                  else
                    v49 = *((unsigned __int16 *)v140 + 2);
                  v50 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16))(v49);
                  v144 = 0;
                  v145 = 0;
                  v143 = 0;
                  v142 = 0;
                  ctf_get_ctt_size((_DWORD *)a1, (uint64_t)v140, (unint64_t *)&v145, &v144);
                  v51 = *v140;
                  v52 = a1 + 16 * (v51 >> 31);
                  v53 = *(_QWORD *)(v52 + 424);
                  if (v53)
                  {
                    v54 = v51 & 0x7FFFFFFF;
                    v55 = (char *)(v53 + v54);
                    if (*(_QWORD *)(v52 + 432) <= v54)
                      v56 = 0;
                    else
                      v56 = v55;
                  }
                  else
                  {
                    v56 = 0;
                  }
                  if (v56)
                    v57 = v56;
                  else
                    v57 = "(?)";
                  switch(v48)
                  {
                    case 1:
                    case 2:
                      v62 = strlen(v57);
                      v63 = ctf_hash_lookup((uint64_t)v137, a1, v57, v62);
                      if (!v63)
                        goto LABEL_123;
                      v64 = v63;
                      v65 = ctf_type_encoding((uint64_t (***)(uint64_t))a1, v63[1], (unsigned int *)&v142);
                      if (!(v65 | v143))
                        v64[1] = (*(uint64_t (**)(uint64_t, BOOL))(*(_QWORD *)a1 + 48))(v46, v14 != 0);
                      goto LABEL_127;
                    case 3:
                      if (*(int *)(a1 + 564) > 3)
                        v66 = v140[2];
                      else
                        v66 = *((unsigned __int16 *)v140 + 3);
                      if (v14 == (*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 32))(v66))
                      {
                        v79 = *(int *)(a1 + 564) > 3 ? v140[2] : *((unsigned __int16 *)v140 + 3);
                        if (*(_QWORD *)(a1 + 512) >= (unint64_t)(*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 40))(v79))
                        {
                          if (*(int *)(a1 + 564) > 3)
                            v82 = v140[2];
                          else
                            v82 = *((unsigned __int16 *)v140 + 3);
                          v83 = *(_QWORD *)(a1 + 504);
                          *(_DWORD *)(v83 + 4 * (*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 40))(v82)) = v46;
                        }
                      }
                      goto LABEL_80;
                    case 4:
                      v61 = 12;
                      if (*(int *)(a1 + 564) < 4)
                        v61 = 8;
                      goto LABEL_141;
                    case 5:
                      v67 = (*(uint64_t (**)(uint64_t, BOOL))(*(_QWORD *)a1 + 48))(v46, v14 != 0);
                      result = ctf_hash_insert(v137, a1, v67, *v140);
                      if ((_DWORD)result != 1018 && (_DWORD)result != 0)
                        return result;
                      v69 = (v50 & 1) + (unint64_t)v50;
                      if (*(int *)(a1 + 564) > 3)
                        goto LABEL_137;
                      v61 = 2 * v69;
                      goto LABEL_141;
                    case 6:
                      v70 = (*(uint64_t (**)(uint64_t, BOOL))(*(_QWORD *)a1 + 48))(v46, v14 != 0);
                      result = ctf_hash_define((uint64_t *)(a1 + 176), a1, v70, *v140);
                      if ((_DWORD)result != 1018 && (_DWORD)result != 0)
                        return result;
                      v72 = *(_DWORD *)(a1 + 564);
                      if (v72 == 1 || v145 < 0x2000)
                        goto LABEL_121;
                      v61 = 16 * v50;
                      ++v135;
                      goto LABEL_141;
                    case 7:
                      v73 = (*(uint64_t (**)(uint64_t, BOOL))(*(_QWORD *)a1 + 48))(v46, v14 != 0);
                      result = ctf_hash_define((uint64_t *)(a1 + 208), a1, v73, *v140);
                      if ((_DWORD)result != 1018 && (_DWORD)result != 0)
                        return result;
                      v72 = *(_DWORD *)(a1 + 564);
                      if (v72 == 1 || v145 < 0x2000)
                      {
LABEL_121:
                        if (v72 > 3)
                        {
                          v69 = 3 * v50;
LABEL_137:
                          v61 = 4 * v69;
                        }
                        else
                        {
LABEL_122:
                          v61 = 8 * v50;
                        }
                      }
                      else
                      {
                        v61 = 16 * v50;
                        ++v136;
                      }
                      goto LABEL_141;
                    case 8:
                      v75 = (*(uint64_t (**)(uint64_t, BOOL))(*(_QWORD *)a1 + 48))(v46, v14 != 0);
                      result = ctf_hash_define((uint64_t *)(a1 + 240), a1, v75, *v140);
                      if ((_DWORD)result != 1018 && (_DWORD)result != 0)
                        return result;
                      goto LABEL_122;
                    case 9:
                      if (*(int *)(a1 + 564) > 3)
                        v77 = v140[2];
                      else
                        v77 = *((unsigned __int16 *)v140 + 3);
                      if (v77 == 8)
                      {
                        v80 = a1 + 240;
                      }
                      else
                      {
                        v80 = a1 + 176;
                        if (v77 == 7)
                          v80 = a1 + 208;
                      }
                      v81 = strlen(v57);
                      if (ctf_hash_lookup(v80, a1, v57, v81))
                        goto LABEL_140;
                      v58 = (*(uint64_t (**)(uint64_t, BOOL))(*(_QWORD *)a1 + 48))(v46, v14 != 0);
                      v59 = *v140;
                      v60 = (uint64_t *)v80;
                      goto LABEL_81;
                    case 10:
                    case 11:
                    case 12:
                    case 13:
LABEL_80:
                      v58 = (*(uint64_t (**)(uint64_t, BOOL))(*(_QWORD *)a1 + 48))(v46, v14 != 0);
                      v59 = *v140;
                      v60 = (uint64_t *)(a1 + 272);
LABEL_81:
                      result = ctf_hash_insert(v60, a1, v58, v59);
                      v61 = 0;
                      if (!(_DWORD)result)
                        goto LABEL_141;
                      goto LABEL_125;
                    case 14:
LABEL_123:
                      v78 = (*(uint64_t (**)(uint64_t, BOOL))(*(_QWORD *)a1 + 48))(v46, v14 != 0);
                      result = ctf_hash_insert(v137, a1, v78, *v140);
                      if ((_DWORD)result)
                      {
                        v61 = 4;
LABEL_125:
                        if ((_DWORD)result != 1018)
                          return result;
                      }
                      else
                      {
LABEL_127:
                        v61 = 4;
                      }
LABEL_141:
                      v141[v46++] = (_DWORD)v140 - *(_DWORD *)(a1 + 464);
                      v140 = (unsigned int *)((char *)v140 + v61 + v144);
                      if (v13 <= (unint64_t)v140)
                        goto LABEL_152;
                      break;
                    default:
LABEL_140:
                      v61 = 0;
                      goto LABEL_141;
                  }
                }
              }
LABEL_152:
              ctf_dprintf("%lu total types processed\n", v39, v40, v41, v42, v43, v44, v45, *(_QWORD *)(a1 + 512));
              v91 = *(_DWORD *)(a1 + 260);
              v92 = v91 != 0;
              v93 = v91 - 1;
              if (!v92)
                v93 = 0;
              ctf_dprintf("%u enum names hashed\n", v84, v85, v86, v87, v88, v89, v90, v93);
              v101 = *(_DWORD *)(a1 + 196);
              v92 = v101 != 0;
              v102 = v101 - 1;
              if (!v92)
                v102 = 0;
              ctf_dprintf("%u struct names hashed (%d long)\n", v94, v95, v96, v97, v98, v99, v100, v102);
              v110 = *(_DWORD *)(a1 + 228);
              v92 = v110 != 0;
              v111 = v110 - 1;
              if (!v92)
                v111 = 0;
              ctf_dprintf("%u union names hashed (%d long)\n", v103, v104, v105, v106, v107, v108, v109, v111);
              v119 = *(_DWORD *)(a1 + 292);
              v92 = v119 != 0;
              v120 = v119 - 1;
              if (!v92)
                v120 = 0;
              ctf_dprintf("%u base type names hashed\n", v112, v113, v114, v115, v116, v117, v118, v120);
              if (*(_QWORD *)(a1 + 512))
              {
                v121 = 1;
                do
                {
                  v122 = *(_DWORD *)(*(_QWORD *)(a1 + 504) + 4 * v121);
                  if (v122)
                  {
                    v123 = (unsigned int *)(*(unsigned int *)(*(_QWORD *)(a1 + 496) + 4 * v121) + *(_QWORD *)(a1 + 464));
                    v124 = *(int *)(a1 + 564) > 3 ? v123[1] : *((unsigned __int16 *)v123 + 2);
                    if ((**(unsigned int (***)(uint64_t))a1)(v124) == 10)
                    {
                      v125 = *v123;
                      v126 = a1 + 16 * (v125 >> 31);
                      v127 = *(_QWORD *)(v126 + 424);
                      if (v127)
                      {
                        v128 = v125 & 0x7FFFFFFF;
                        v129 = (const char *)(v127 + v128);
                        if (*(_QWORD *)(v126 + 432) <= v128)
                          v130 = 0;
                        else
                          v130 = v129;
                      }
                      else
                      {
                        v130 = 0;
                      }
                      if (!v130)
                        v130 = "(?)";
                      if (!*v130)
                      {
                        v131 = *(int *)(a1 + 564) > 3 ? v123[2] : *((unsigned __int16 *)v123 + 3);
                        if (v14 == (*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 32))(v131))
                        {
                          v132 = *(int *)(a1 + 564) > 3 ? v123[2] : *((unsigned __int16 *)v123 + 3);
                          if (*(_QWORD *)(a1 + 512) >= (unint64_t)(*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 40))(v132))
                          {
                            if (*(int *)(a1 + 564) > 3)
                              v133 = v123[2];
                            else
                              v133 = *((unsigned __int16 *)v123 + 3);
                            v134 = *(_QWORD *)(a1 + 504);
                            *(_DWORD *)(v134
                                      + 4 * (*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 40))(v133)) = v122;
                          }
                        }
                      }
                    }
                  }
                  result = 0;
                  v92 = v121++ >= *(_QWORD *)(a1 + 512);
                }
                while (!v92);
              }
              else
              {
                return 0;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void ctf_close(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v9;
  unsigned int *v10;
  unsigned int *v11;
  unint64_t v12;
  int v13;
  unint64_t v14;
  int v15;
  unint64_t v16;
  int v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  if (a1)
  {
    ctf_dprintf("ctf_close(%p) refcnt=%u\n", a2, a3, a4, a5, a6, a7, a8, a1);
    v9 = *(_DWORD *)(a1 + 552);
    if (v9 < 2)
    {
      if (*(_QWORD *)(a1 + 528))
        ctf_close();
      v10 = *(unsigned int **)(a1 + 584);
      if (v10)
      {
        do
        {
          v11 = *(unsigned int **)v10;
          ctf_dtd_delete((_QWORD *)a1, v10);
          v10 = v11;
        }
        while (v11);
      }
      free(*(void **)(a1 + 568));
      if ((*(_BYTE *)(a1 + 556) & 1) != 0)
      {
        v12 = *(_QWORD *)(a1 + 32);
        if (v12)
        {
          v13 = getpagesize();
          munmap((void *)(v12 - ((v13 - 1) & v12)), ((v13 - 1) & v12) + *(_QWORD *)(a1 + 40));
        }
        v14 = *(_QWORD *)(a1 + 88);
        if (v14)
        {
          v15 = getpagesize();
          munmap((void *)(v14 - ((v15 - 1) & v14)), ((v15 - 1) & v14) + *(_QWORD *)(a1 + 96));
        }
        v16 = *(_QWORD *)(a1 + 144);
        if (v16)
        {
          v17 = getpagesize();
          munmap((void *)(v16 - ((v17 - 1) & v16)), ((v17 - 1) & v16) + *(_QWORD *)(a1 + 152));
        }
      }
      v18 = *(void **)(a1 + 8);
      if (v18 != &_CTF_NULLSTR && v18 != 0)
        free(v18);
      v20 = *(void **)(a1 + 64);
      if (v20 != &_CTF_NULLSTR && v20)
        free(v20);
      v21 = *(void **)(a1 + 120);
      if (v21 != &_CTF_NULLSTR && v21)
        free(v21);
      v22 = *(void **)(a1 + 456);
      if (v22 && v22 != *(void **)(a1 + 32))
        munmap(v22, *(_QWORD *)(a1 + 472));
      v23 = *(void **)(a1 + 480);
      if (v23)
        free(v23);
      v24 = *(void **)(a1 + 496);
      if (v24)
        free(v24);
      v25 = *(void **)(a1 + 504);
      if (v25)
        free(v25);
      ctf_hash_destroy(a1 + 176);
      ctf_hash_destroy(a1 + 208);
      ctf_hash_destroy(a1 + 240);
      ctf_hash_destroy(a1 + 272);
      free((void *)a1);
    }
    else
    {
      *(_DWORD *)(a1 + 552) = v9 - 1;
    }
  }
}

uint64_t get_kind_v1(unsigned __int16 a1)
{
  return a1 >> 12;
}

uint64_t get_root_v1(unsigned int a1)
{
  return (a1 >> 11) & 1;
}

uint64_t get_vlen_v1(__int16 a1)
{
  return a1 & 0x7FF;
}

BOOL is_parent_v1(uint64_t a1)
{
  return a1 < 0x8000;
}

BOOL is_child_v1(uint64_t a1)
{
  return a1 >= 0x8000;
}

uint64_t type_to_index_v1(__int16 a1)
{
  return a1 & 0x7FFF;
}

uint64_t index_to_type_v1(uint64_t result, int a2)
{
  if (a2)
    return result | 0x8000;
  else
    return result;
}

uint64_t max_size_v1()
{
  return 65534;
}

uint64_t lsize_sent_v1()
{
  return 0xFFFFLL;
}

uint64_t get_kind_v2(unsigned __int16 a1)
{
  return a1 >> 11;
}

uint64_t get_root_v2(unsigned int a1)
{
  return (a1 >> 10) & 1;
}

uint64_t get_vlen_v2(__int16 a1)
{
  return a1 & 0x3FF;
}

BOOL is_parent_v4(int a1)
{
  return a1 >= 0;
}

uint64_t is_child_v4(unint64_t a1)
{
  return (a1 >> 31) & 1;
}

uint64_t type_to_index_v4(int a1)
{
  return a1 & 0x7FFFFFFF;
}

uint64_t index_to_type_v4(uint64_t result, int a2)
{
  if (a2)
    return result | 0x80000000;
  else
    return result;
}

uint64_t max_size_v4()
{
  return 4294967294;
}

uint64_t lsize_sent_v4()
{
  return 0xFFFFFFFFLL;
}

uint64_t ctf_setmodel(uint64_t a1, int a2)
{
  char **i;
  uint64_t v4;

  for (i = &_libctf_models; *((_DWORD *)i + 2) != a2; i += 7)
  {
    if (!i[7])
    {
      *(_DWORD *)(a1 + 560) = 22;
      return 0xFFFFFFFFLL;
    }
  }
  v4 = 0;
  *(_QWORD *)(a1 + 520) = i;
  return v4;
}

uint64_t ctf_parent_file(uint64_t a1)
{
  return *(_QWORD *)(a1 + 528);
}

uint64_t ctf_parent_name(uint64_t a1)
{
  return *(_QWORD *)(a1 + 544);
}

uint64_t ctf_import(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v10;
  uint64_t result;
  uint64_t v12;

  if (!a1 || a1 == a2)
    goto LABEL_7;
  if (!a2)
    goto LABEL_9;
  if (!*(_DWORD *)(a2 + 552))
  {
LABEL_7:
    v10 = 22;
    goto LABEL_8;
  }
  if (*(_QWORD *)(a2 + 520) != *(_QWORD *)(a1 + 520))
  {
    v10 = 1012;
LABEL_8:
    *(_DWORD *)(a1 + 560) = v10;
    return 0xFFFFFFFFLL;
  }
LABEL_9:
  v12 = *(_QWORD *)(a1 + 528);
  if (v12)
    ctf_close(v12, a2, a3, a4, a5, a6, a7, a8);
  if (a2)
  {
    *(_DWORD *)(a1 + 556) |= 2u;
    ++*(_DWORD *)(a2 + 552);
  }
  result = 0;
  *(_QWORD *)(a1 + 528) = a2;
  return result;
}

uint64_t ctf_getmodel(uint64_t a1)
{
  return *(unsigned int *)(*(_QWORD *)(a1 + 520) + 8);
}

uint64_t ctf_setspecific(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 624) = a2;
  return result;
}

uint64_t ctf_getspecific(uint64_t a1)
{
  return *(_QWORD *)(a1 + 624);
}

void *ctf_data_alloc(size_t a1)
{
  return mmap(0, a1, 3, 4098, -1, 0);
}

uint64_t ctf_data_protect(void *a1, size_t a2)
{
  return mprotect(a1, a2, 1);
}

void *ctf_alloc(size_t a1)
{
  return malloc_type_malloc(a1, 0xCFAB4140uLL);
}

const char *ctf_dprintf(const char *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  const char *v9;
  FILE **v10;

  if (_libctf_debug)
  {
    v9 = result;
    v10 = (FILE **)MEMORY[0x1E0C80C10];
    fputs("libctf DEBUG: ", (FILE *)*MEMORY[0x1E0C80C10]);
    return (const char *)vfprintf(*v10, v9, &a9);
  }
  return result;
}

uint64_t get_type_ctt_info(uint64_t a1, uint64_t a2)
{
  if (*(int *)(a1 + 564) > 3)
    return *(unsigned int *)(a2 + 4);
  else
    return *(unsigned __int16 *)(a2 + 4);
}

uint64_t get_type_ctt_type(uint64_t a1, uint64_t a2)
{
  if (*(int *)(a1 + 564) > 3)
    return *(unsigned int *)(a2 + 8);
  else
    return *(unsigned __int16 *)(a2 + 6);
}

uint64_t get_type_ctt_name(uint64_t a1, unsigned int *a2)
{
  return *a2;
}

uint64_t get_type_ctt_size(uint64_t a1, uint64_t a2)
{
  if (*(int *)(a1 + 564) > 3)
    return *(unsigned int *)(a2 + 8);
  else
    return *(unsigned __int16 *)(a2 + 6);
}

unint64_t ctf_get_ctt_lsize(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 16;
  v3 = 12;
  if (*(int *)(a1 + 564) < 4)
  {
    v2 = 12;
    v3 = 8;
  }
  return *(unsigned int *)(a2 + v2) | ((unint64_t)*(unsigned int *)(a2 + v3) << 32);
}

unint64_t ctf_get_ctt_size(_DWORD *a1, uint64_t a2, unint64_t *a3, uint64_t *a4)
{
  int v7;
  int v9;
  int v10;
  int v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t result;
  unsigned int v18;

  v7 = a1[141];
  if (v7 < 2)
    goto LABEL_15;
  if (v7 > 3)
    v9 = *(_DWORD *)(a2 + 8);
  else
    v9 = *(unsigned __int16 *)(a2 + 6);
  v10 = (*(uint64_t (**)(_DWORD *))(*(_QWORD *)a1 + 64))(a1);
  v11 = a1[141];
  if (v9 != v10)
  {
    if (v11 > 3)
    {
      v18 = *(_DWORD *)(a2 + 8);
      v13 = 12;
LABEL_16:
      result = v18;
      if (!a3)
        goto LABEL_18;
      goto LABEL_17;
    }
LABEL_15:
    v18 = *(unsigned __int16 *)(a2 + 6);
    v13 = 8;
    goto LABEL_16;
  }
  v12 = v11 < 4;
  v13 = 16;
  v14 = 12;
  v15 = 8;
  if (!v12)
    v15 = 12;
  v16 = *(unsigned int *)(a2 + v15);
  if (!v12)
    v14 = 16;
  result = *(unsigned int *)(a2 + v14) | (unint64_t)(v16 << 32);
  if (!v12)
    v13 = 20;
  if (a3)
LABEL_17:
    *a3 = result;
LABEL_18:
  if (a4)
    *a4 = v13;
  return result;
}

uint64_t ctf_member_iter(int *a1, uint64_t a2, uint64_t (*a3)(const char *, _QWORD, unint64_t, uint64_t), uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  uint64_t result;
  int v13;
  uint64_t v14;
  uint64_t (*v15)(_QWORD);
  int v16;
  unsigned int *v17;
  unint64_t v18;
  int *v19;
  uint64_t v20;
  unint64_t v21;
  const char *v22;
  const char *v23;
  const char *v24;
  int v25;
  unsigned int *v26;
  unint64_t v27;
  int *v28;
  uint64_t v29;
  unint64_t v30;
  const char *v31;
  const char *v32;
  const char *v33;
  int v34;
  unsigned int *v35;
  unint64_t v36;
  int *v37;
  uint64_t v38;
  unint64_t v39;
  const char *v40;
  const char *v41;
  const char *v42;
  int v43;
  unsigned int *v44;
  unint64_t v45;
  int *v46;
  uint64_t v47;
  unint64_t v48;
  const char *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  int *v54;

  v54 = a1;
  v7 = ctf_type_resolve((uint64_t)a1, a2);
  if (v7 == -1)
    return 0xFFFFFFFFLL;
  v52 = 0;
  v53 = 0;
  v8 = ctf_lookup_by_id((uint64_t)&v54, v7);
  if (!v8)
    return 0xFFFFFFFFLL;
  v9 = v8;
  v10 = v54;
  ctf_get_ctt_size(v54, v8, (unint64_t *)&v53, &v52);
  if (v10[141] > 3)
    v11 = *(unsigned int *)(v9 + 4);
  else
    v11 = *(unsigned __int16 *)(v9 + 4);
  if ((**(unsigned int (***)(uint64_t))v10)(v11) - 8 <= 0xFFFFFFFD)
  {
    a1[140] = 1021;
    return 0xFFFFFFFFLL;
  }
  v13 = v10[141];
  v14 = v52;
  v15 = *(uint64_t (**)(_QWORD))(*(_QWORD *)v10 + 16);
  if (v13 == 1 || v53 < 0x2000)
  {
    if (v13 > 3)
    {
      result = v15(*(unsigned int *)(v9 + 4));
      if ((_DWORD)result)
      {
        v43 = result;
        v44 = (unsigned int *)(v14 + v9);
        do
        {
          v45 = *v44;
          v46 = &v10[4 * (v45 >> 31)];
          v47 = *((_QWORD *)v46 + 53);
          if (v47)
          {
            v48 = v45 & 0x7FFFFFFF;
            v49 = (const char *)(v47 + v48);
            if (*((_QWORD *)v46 + 54) <= v48)
              v50 = 0;
            else
              v50 = v49;
          }
          else
          {
            v50 = 0;
          }
          if (v50)
            v51 = v50;
          else
            v51 = "(?)";
          result = a3(v51, v44[1], *((unsigned __int16 *)v44 + 4), a4);
          if ((_DWORD)result)
            break;
          v44 += 3;
          --v43;
        }
        while (v43);
      }
    }
    else
    {
      result = v15(*(unsigned __int16 *)(v9 + 4));
      if ((_DWORD)result)
      {
        v25 = result;
        v26 = (unsigned int *)(v14 + v9);
        do
        {
          v27 = *v26;
          v28 = &v10[4 * (v27 >> 31)];
          v29 = *((_QWORD *)v28 + 53);
          if (v29)
          {
            v30 = v27 & 0x7FFFFFFF;
            v31 = (const char *)(v29 + v30);
            if (*((_QWORD *)v28 + 54) <= v30)
              v32 = 0;
            else
              v32 = v31;
          }
          else
          {
            v32 = 0;
          }
          if (v32)
            v33 = v32;
          else
            v33 = "(?)";
          result = a3(v33, *((unsigned __int16 *)v26 + 2), *((unsigned __int16 *)v26 + 3), a4);
          if ((_DWORD)result)
            break;
          v26 += 2;
          --v25;
        }
        while (v25);
      }
    }
  }
  else if (v13 > 3)
  {
    result = v15(*(unsigned int *)(v9 + 4));
    if ((_DWORD)result)
    {
      v34 = result;
      v35 = (unsigned int *)(v14 + v9);
      do
      {
        v36 = *v35;
        v37 = &v10[4 * (v36 >> 31)];
        v38 = *((_QWORD *)v37 + 53);
        if (v38)
        {
          v39 = v36 & 0x7FFFFFFF;
          v40 = (const char *)(v38 + v39);
          if (*((_QWORD *)v37 + 54) <= v39)
            v41 = 0;
          else
            v41 = v40;
        }
        else
        {
          v41 = 0;
        }
        if (v41)
          v42 = v41;
        else
          v42 = "(?)";
        result = a3(v42, v35[1], v35[3] | ((unint64_t)v35[2] << 32), a4);
        if ((_DWORD)result)
          break;
        v35 += 4;
        --v34;
      }
      while (v34);
    }
  }
  else
  {
    result = v15(*(unsigned __int16 *)(v9 + 4));
    if ((_DWORD)result)
    {
      v16 = result;
      v17 = (unsigned int *)(v14 + v9);
      do
      {
        v18 = *v17;
        v19 = &v10[4 * (v18 >> 31)];
        v20 = *((_QWORD *)v19 + 53);
        if (v20)
        {
          v21 = v18 & 0x7FFFFFFF;
          v22 = (const char *)(v20 + v21);
          if (*((_QWORD *)v19 + 54) <= v21)
            v23 = 0;
          else
            v23 = v22;
        }
        else
        {
          v23 = 0;
        }
        if (v23)
          v24 = v23;
        else
          v24 = "(?)";
        result = a3(v24, *((unsigned __int16 *)v17 + 2), v17[3] | ((unint64_t)v17[2] << 32), a4);
        if ((_DWORD)result)
          break;
        v17 += 4;
        --v16;
      }
      while (v16);
    }
  }
  return result;
}

uint64_t ctf_type_resolve(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v19;
  uint64_t v21;

  v21 = a1;
  v4 = a2;
  v5 = a2;
  while (1)
  {
    v6 = v4;
    v7 = ctf_lookup_by_id((uint64_t)&v21, v4);
    if (!v7)
      break;
    v8 = v7;
    v9 = v21;
    if (*(int *)(v21 + 564) > 3)
      v10 = *(unsigned int *)(v7 + 4);
    else
      v10 = *(unsigned __int16 *)(v7 + 4);
    if ((**(unsigned int (***)(uint64_t))v21)(v10) - 10 > 3)
      return v6;
    if (*(int *)(v9 + 564) > 3)
      v4 = *(unsigned int *)(v8 + 8);
    else
      v4 = *(unsigned __int16 *)(v8 + 6);
    v19 = v6 == v4 || v4 == a2 || v5 == v4;
    v5 = v6;
    if (v19)
    {
      ctf_dprintf("type %ld cycle detected\n", v11, v12, v13, v14, v15, v16, v17, a2);
      *(_DWORD *)(a1 + 560) = 1007;
      return -1;
    }
  }
  return -1;
}

uint64_t ctf_enum_iter(uint64_t a1, uint64_t a2, uint64_t (*a3)(char *, _QWORD, uint64_t), uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _DWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  int v15;
  unsigned int *i;
  unint64_t v17;
  _DWORD *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  const char *v22;
  char *v23;
  uint64_t v24;
  _DWORD *v25;

  v25 = (_DWORD *)a1;
  v7 = ctf_type_resolve(a1, a2);
  if (v7 == -1)
    return 0xFFFFFFFFLL;
  v24 = 0;
  v8 = ctf_lookup_by_id((uint64_t)&v25, v7);
  if (!v8)
    return 0xFFFFFFFFLL;
  v9 = v8;
  v10 = v25;
  if ((int)v25[141] > 3)
    v11 = *(unsigned int *)(v8 + 4);
  else
    v11 = *(unsigned __int16 *)(v8 + 4);
  if ((**(unsigned int (***)(uint64_t))v25)(v11) != 8)
  {
    *(_DWORD *)(a1 + 560) = 1022;
    return 0xFFFFFFFFLL;
  }
  ctf_get_ctt_size(v10, v9, 0, &v24);
  if ((int)v10[141] > 3)
    v12 = *(unsigned int *)(v9 + 4);
  else
    v12 = *(unsigned __int16 *)(v9 + 4);
  v14 = v24;
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v10 + 16))(v12);
  if ((_DWORD)result)
  {
    v15 = result;
    for (i = (unsigned int *)(v14 + v9); ; i += 2)
    {
      v17 = *i;
      v18 = &v10[4 * (v17 >> 31)];
      v19 = *((_QWORD *)v18 + 53);
      if (v19)
      {
        v20 = v17 & 0x7FFFFFFF;
        v21 = v19 + v20;
        v22 = *((_QWORD *)v18 + 54) <= v20 ? 0 : (const char *)v21;
      }
      else
      {
        v22 = 0;
      }
      v23 = v22 ? (char *)v22 : "(?)";
      result = a3(v23, i[1], a4);
      if ((_DWORD)result)
        break;
      if (!--v15)
        return 0;
    }
  }
  return result;
}

uint64_t ctf_type_iter(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t), uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 512);
  if (v3 >= 1)
  {
    v7 = -v3;
    v8 = 1;
    v9 = (*(_DWORD *)(a1 + 556) >> 1) & 1;
    do
    {
      v10 = *(unsigned int *)(*(_QWORD *)(a1 + 496) + 4 * v8) + *(_QWORD *)(a1 + 464);
      if (*(int *)(a1 + 564) > 3)
      {
        if ((*(_DWORD *)(v10 + 4) & 0x400) != 0)
        {
LABEL_7:
          v11 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 48))(v8, v9);
          result = a2(v11, a3);
          if ((_DWORD)result)
            return result;
        }
      }
      else if ((*(_WORD *)(v10 + 4) & 0x400) != 0)
      {
        goto LABEL_7;
      }
      ++v8;
    }
    while (v7 + v8 != 1);
  }
  return 0;
}

uint64_t ctf_type_lname(_DWORD *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  _DWORD *v15;
  _OWORD v16[4];
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;

  result = -1;
  if (a1 || a2 != -1)
  {
    v19 = 0;
    v23 = 0u;
    memset(v16, 0, sizeof(v16));
    v17 = -1;
    v18 = -1;
    v20 = a3;
    v21 = a3;
    v22 = a3 + a4;
    ctf_decl_push(v16, a1, a2);
    if (DWORD2(v23))
    {
      ctf_decl_fini((uint64_t)v16);
      a1[140] = DWORD2(v23);
      return -1;
    }
    else
    {
      v7 = 0;
      if (SHIDWORD(v17) > 1)
        v8 = 1;
      else
        v8 = 0xFFFFFFFFLL;
      v9 = 2;
      if ((int)v18 > 2)
        v8 = 2;
      v14 = v8;
      if ((int)v18 <= 2)
        v9 = 0xFFFFFFFFLL;
      if (SHIDWORD(v17) > 1)
        v10 = 1;
      else
        v10 = v9;
      v11 = 3;
      do
      {
        for (i = *((_QWORD *)&v16[v7] + 1); i; i = *(_QWORD *)(i + 8))
        {
          v15 = a1;
          ctf_lookup_by_id((uint64_t)&v15, *(_QWORD *)(i + 16));
          if ((v11 - 5) <= 0xFFFFFFFD)
            ctf_decl_sprintf(v16, " ");
          if (v7 == v10)
          {
            ctf_decl_sprintf(v16, "(");
            v10 = 0xFFFFFFFFLL;
          }
          switch(*(_DWORD *)(i + 24))
          {
            case 1:
            case 2:
            case 0xA:
              ctf_decl_sprintf(v16, "%s");
              break;
            case 3:
              ctf_decl_sprintf(v16, "*", v13);
              break;
            case 4:
              ctf_decl_sprintf(v16, "[%u]");
              break;
            case 5:
              ctf_decl_sprintf(v16, "()", v13);
              break;
            case 6:
            case 9:
              ctf_decl_sprintf(v16, "struct %s");
              break;
            case 7:
              ctf_decl_sprintf(v16, "union %s");
              break;
            case 8:
              ctf_decl_sprintf(v16, "enum %s");
              break;
            case 0xB:
              ctf_decl_sprintf(v16, "volatile", v13);
              break;
            case 0xC:
              ctf_decl_sprintf(v16, "const", v13);
              break;
            case 0xD:
              ctf_decl_sprintf(v16, "restrict", v13);
              break;
            case 0xE:
              ctf_decl_sprintf(v16, "ptrauth", v13);
              break;
            default:
              break;
          }
          v11 = *(_DWORD *)(i + 24);
        }
        if (v14 == v7)
          ctf_decl_sprintf(v16, ")");
        ++v7;
      }
      while (v7 != 4);
      if ((unint64_t)v23 >= a4)
        a1[140] = 1027;
      ctf_decl_fini((uint64_t)v16);
      return v23;
    }
  }
  return result;
}

char *__cdecl ctf_type_name(ctf_file_t *a1, ctf_id_t a2, char *a3, size_t a4)
{
  size_t v6;

  v6 = ctf_type_lname(a1, a2, (uint64_t)a3, a4);
  if (v6 >= a4 || (uint64_t)v6 <= -1)
    return 0;
  else
    return a3;
}

uint64_t ctf_type_size(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  _QWORD v9[2];
  uint64_t v10;
  uint64_t v11;

  v11 = a1;
  result = ctf_type_resolve(a1, a2);
  if (result != -1)
  {
    v3 = result;
    v4 = ctf_lookup_by_id((uint64_t)&v11, result);
    if (!v4)
      return -1;
    v5 = v4;
    v6 = v11;
    if (*(int *)(v11 + 564) > 3)
      v7 = *(unsigned int *)(v4 + 4);
    else
      v7 = *(unsigned __int16 *)(v4 + 4);
    v8 = (**(uint64_t (***)(uint64_t))v11)(v7);
    if (v8 > 4)
    {
      if (v8 == 5)
        return 0;
      if (v8 != 14)
        return ctf_get_ctt_size((_DWORD *)v6, v5, 0, 0);
    }
    else if (v8 != 3)
    {
      if (v8 == 4)
      {
        result = ctf_get_ctt_size((_DWORD *)v6, v5, 0, 0);
        if (result > 0)
          return result;
        v9[0] = 0;
        v9[1] = 0;
        v10 = 0;
        if (ctf_array_info((_DWORD *)v6, v3, (uint64_t)v9) != -1)
        {
          result = ctf_type_size(v6, v9[0]);
          if (result != -1)
            result *= v10;
          return result;
        }
        return -1;
      }
      return ctf_get_ctt_size((_DWORD *)v6, v5, 0, 0);
    }
    return *(_QWORD *)(*(_QWORD *)(v6 + 520) + 16);
  }
  return result;
}

uint64_t ctf_array_info(_DWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _DWORD *v7;
  uint64_t v8;
  unsigned __int16 *v9;
  uint64_t result;
  __int128 v11;
  int v12;
  uint64_t v13;
  _DWORD *v14;

  v13 = 0;
  v14 = a1;
  v5 = ctf_lookup_by_id((uint64_t)&v14, a2);
  if (!v5)
    return 0xFFFFFFFFLL;
  v6 = v5;
  v7 = v14;
  if ((int)v14[141] > 3)
    v8 = *(unsigned int *)(v5 + 4);
  else
    v8 = *(unsigned __int16 *)(v5 + 4);
  if ((**(unsigned int (***)(uint64_t))v14)(v8) != 4)
  {
    a1[140] = 1025;
    return 0xFFFFFFFFLL;
  }
  ctf_get_ctt_size(v7, v6, 0, &v13);
  v9 = (unsigned __int16 *)(v13 + v6);
  result = 0;
  if (v7[141] == 4)
  {
    *(_QWORD *)&v11 = *(_QWORD *)v9;
    *((_QWORD *)&v11 + 1) = HIDWORD(*(_QWORD *)v9);
    *(_OWORD *)a3 = v11;
    v12 = *((_DWORD *)v9 + 2);
  }
  else
  {
    *(_QWORD *)a3 = *v9;
    *(_QWORD *)(a3 + 8) = v9[1];
    v12 = *((_DWORD *)v9 + 1);
  }
  *(_DWORD *)(a3 + 16) = v12;
  return result;
}

unint64_t ctf_type_align(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _DWORD *v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  unsigned int *v15;
  unsigned int v16;
  unint64_t v17;
  unsigned int *v18;
  unsigned int v19;
  unint64_t v20;
  unsigned __int16 *v21;
  unsigned int v22;
  unint64_t v23;
  unsigned __int16 *v24;
  unsigned int v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28[3];
  _DWORD *v29;

  while (1)
  {
    v29 = (_DWORD *)a1;
    v2 = ctf_type_resolve(a1, a2);
    if (v2 == -1)
      return v2;
    v3 = ctf_lookup_by_id((uint64_t)&v29, v2);
    if (!v3)
      return -1;
    v4 = v3;
    v5 = v29;
    v6 = (int)v29[141] > 3 ? *(unsigned int *)(v3 + 4) : *(unsigned __int16 *)(v3 + 4);
    v7 = (**(uint64_t (***)(uint64_t))v29)(v6);
    if (v7 > 0xE)
      break;
    if (((1 << v7) & 0x4028) != 0)
      return *(_QWORD *)(*((_QWORD *)v5 + 65) + 16);
    if (((1 << v7) & 0xC0) != 0)
    {
      if ((int)v5[141] > 3)
        v8 = *(unsigned int *)(v4 + 4);
      else
        v8 = *(unsigned __int16 *)(v4 + 4);
      v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 16))(v8);
      v27 = 0;
      v28[0] = 0;
      ctf_get_ctt_size(v5, v4, v28, &v27);
      if ((int)v5[141] > 3)
        v11 = *(unsigned int *)(v4 + 4);
      else
        v11 = *(unsigned __int16 *)(v4 + 4);
      v12 = v27;
      if ((**(unsigned int (***)(uint64_t))v5)(v11) == 6)
        v13 = v10 != 0;
      else
        v13 = v10;
      v14 = v5[141];
      if (v14 == 1 || (uint64_t)v28[0] < 0x2000)
      {
        if (v14 == 4)
        {
          if (v13)
          {
            v2 = 0;
            v18 = (unsigned int *)(v12 + v4 + 4);
            do
            {
              v19 = *v18;
              v18 += 3;
              v20 = ctf_type_align(v5, v19);
              if (v2 <= v20)
                v2 = v20;
              --v13;
            }
            while (v13);
            return v2;
          }
        }
        else if (v13)
        {
          v2 = 0;
          v24 = (unsigned __int16 *)(v12 + v4 + 4);
          do
          {
            v25 = *v24;
            v24 += 4;
            v26 = ctf_type_align(v5, v25);
            if (v2 <= v26)
              v2 = v26;
            --v13;
          }
          while (v13);
          return v2;
        }
      }
      else if (v14 == 4)
      {
        if (v13)
        {
          v2 = 0;
          v15 = (unsigned int *)(v12 + v4 + 4);
          do
          {
            v16 = *v15;
            v15 += 4;
            v17 = ctf_type_align(v5, v16);
            if (v2 <= v17)
              v2 = v17;
            --v13;
          }
          while (v13);
          return v2;
        }
      }
      else if (v13)
      {
        v2 = 0;
        v21 = (unsigned __int16 *)(v12 + v4 + 4);
        do
        {
          v22 = *v21;
          v21 += 8;
          v23 = ctf_type_align(v5, v22);
          if (v2 <= v23)
            v2 = v23;
          --v13;
        }
        while (v13);
        return v2;
      }
      return 0;
    }
    if (v7 != 4)
      return ctf_get_ctt_size(v5, v4, 0, 0);
    memset(v28, 0, sizeof(v28));
    if (ctf_array_info(v5, v2, (uint64_t)v28) == -1)
      return -1;
    a2 = v28[0];
    a1 = (uint64_t)v5;
  }
  return ctf_get_ctt_size(v5, v4, 0, 0);
}

uint64_t ctf_type_kind(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v5 = a1;
  v2 = ctf_lookup_by_id((uint64_t)&v5, a2);
  if (!v2)
    return 0xFFFFFFFFLL;
  if (*(int *)(v5 + 564) > 3)
    v3 = *(unsigned int *)(v2 + 4);
  else
    v3 = *(unsigned __int16 *)(v2 + 4);
  return (**(uint64_t (***)(uint64_t))v5)(v3);
}

uint64_t ctf_type_reference(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v11;

  v11 = a1;
  v3 = ctf_lookup_by_id((uint64_t)&v11, a2);
  if (!v3)
    return -1;
  v4 = v3;
  v5 = v11;
  if (*(int *)(v11 + 564) > 3)
    v6 = *(unsigned int *)(v3 + 4);
  else
    v6 = *(unsigned __int16 *)(v3 + 4);
  v7 = (**(uint64_t (***)(uint64_t))v11)(v6);
  if ((v7 - 10) >= 5 && v7 != 3)
  {
    *(_DWORD *)(a1 + 560) = 1026;
    return -1;
  }
  if (*(int *)(v5 + 564) > 3)
    return *(unsigned int *)(v4 + 8);
  else
    return *(unsigned __int16 *)(v4 + 6);
}

uint64_t ctf_type_pointer(uint64_t a1, uint64_t a2)
{
  _DWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v11 = (_QWORD *)a1;
  if (ctf_lookup_by_id((uint64_t)&v11, a2))
  {
    v4 = v11;
    v5 = v11[63];
    v6 = *(unsigned int *)(v5 + 4 * (*(unsigned int (**)(uint64_t))(*v11 + 40))(a2));
    if ((_DWORD)v6)
      return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)v4 + 48))(v6, (v4[139] >> 1) & 1);
    v8 = ctf_type_resolve((uint64_t)v4, a2);
    if (v8 != -1)
    {
      v9 = v8;
      if (ctf_lookup_by_id((uint64_t)&v11, v8))
      {
        v4 = v11;
        v10 = v11[63];
        v6 = *(unsigned int *)(v10 + 4 * (*(unsigned int (**)(uint64_t))(*v11 + 40))(v9));
        if ((_DWORD)v6)
          return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)v4 + 48))(v6, (v4[139] >> 1) & 1);
      }
    }
    *(_DWORD *)(a1 + 560) = 1028;
  }
  return -1;
}

uint64_t ctf_type_encoding(uint64_t (***a1)(uint64_t), uint64_t a2, unsigned int *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (***v7)(uint64_t);
  uint64_t v8;
  int v9;
  uint64_t result;
  unsigned int v11;
  uint64_t v12;
  uint64_t (***v13)(uint64_t);

  v12 = 0;
  v13 = a1;
  v5 = ctf_lookup_by_id((uint64_t)&v13, a2);
  if (v5)
  {
    v6 = v5;
    v7 = v13;
    ctf_get_ctt_size(v13, v5, 0, &v12);
    if (*((int *)v7 + 141) > 3)
      v8 = *(unsigned int *)(v6 + 4);
    else
      v8 = *(unsigned __int16 *)(v6 + 4);
    v9 = (**v7)(v8);
    if (v9 == 2 || v9 == 1)
    {
      result = 0;
      v11 = *(_DWORD *)(v12 + v6);
      *a3 = HIBYTE(v11);
      a3[1] = BYTE2(v11);
      a3[2] = (unsigned __int16)v11;
      return result;
    }
    *((_DWORD *)a1 + 140) = 1024;
  }
  return 0xFFFFFFFFLL;
}

uint64_t ctf_type_ptrauth(unsigned int (***a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int (***v7)(uint64_t);
  uint64_t v8;
  uint64_t result;
  int v10;
  uint64_t v11;
  unsigned int (***v12)(uint64_t);

  v11 = 0x7FFFFFFFFFFFFFFFLL;
  v12 = a1;
  v5 = ctf_lookup_by_id((uint64_t)&v12, a2);
  if (v5)
  {
    v6 = v5;
    v7 = v12;
    ctf_get_ctt_size(v12, v5, 0, &v11);
    if (*((int *)v7 + 141) > 3)
      v8 = *(unsigned int *)(v6 + 4);
    else
      v8 = *(unsigned __int16 *)(v6 + 4);
    if ((**v7)(v8) == 14)
    {
      result = 0;
      v10 = *(_DWORD *)(v11 + v6);
      *(_BYTE *)a3 = BYTE2(v10);
      *(_WORD *)(a3 + 2) = v10;
      *(_BYTE *)(a3 + 4) = (v10 & 0xFF000000) != 0;
      return result;
    }
    *((_DWORD *)a1 + 140) = 1046;
  }
  return 0xFFFFFFFFLL;
}

uint64_t ctf_type_cmp(_QWORD *a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v6;
  unint64_t v7;
  unsigned int v8;

  if (a2 < a4)
    v4 = 0xFFFFFFFFLL;
  else
    v4 = a2 > a4;
  if (a1 != a3)
  {
    v6 = a3;
    v7 = (unint64_t)a1;
    if ((*(unsigned int (**)(uint64_t))(*a1 + 24))(a2) && *(_QWORD *)(v7 + 528))
      v7 = *(_QWORD *)(v7 + 528);
    if ((*(unsigned int (**)(uint64_t))(*v6 + 24))(a4) && v6[66])
      v6 = (_QWORD *)v6[66];
    if (v7 > (unint64_t)v6)
      v8 = 1;
    else
      v8 = v4;
    if (v7 >= (unint64_t)v6)
      return v8;
    else
      return 0xFFFFFFFFLL;
  }
  return v4;
}

uint64_t ctf_type_compat(uint64_t (***a1)(uint64_t), uint64_t a2, uint64_t (***a3)(uint64_t), uint64_t a4)
{
  return ctf_type_compat_helper(a1, a2, a3, a4, 1);
}

uint64_t ctf_type_compat_helper(uint64_t (***a1)(uint64_t), uint64_t a2, uint64_t (***a3)(uint64_t), uint64_t a4, int a5)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  unsigned int *v14;
  uint64_t v15;
  unsigned int *v16;
  uint64_t result;
  unint64_t v18;
  uint64_t (***v19)(uint64_t);
  uint64_t (**v20)(uint64_t);
  unint64_t v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  unint64_t v25;
  uint64_t (***v26)(uint64_t);
  uint64_t (**v27)(uint64_t);
  unint64_t v28;
  uint64_t v29;
  const char *v30;
  const char *v31;
  uint64_t v33;
  uint64_t (***v34)(uint64_t);
  uint64_t (***v35)(uint64_t);
  uint64_t (***v36)(uint64_t);
  uint64_t (***v37)(uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unsigned int v46;
  uint64_t v47;
  int v48;
  uint64_t (***v49)(uint64_t);
  uint64_t (***v50)(uint64_t);

  while (1)
  {
    v5 = a5;
    v6 = a4;
    v7 = (uint64_t)a3;
    v8 = a2;
    v9 = (uint64_t)a1;
    v49 = a3;
    v50 = a1;
    if (!ctf_type_cmp(a1, a2, a3, a4))
      return 1;
    v48 = 0;
    v47 = 0;
    v45 = 0;
    v46 = 0;
    v10 = ctf_type_resolve(v9, v8);
    v11 = ctf_type_kind(v9, v10);
    v12 = ctf_type_resolve(v7, v6);
    v13 = ctf_type_kind(v7, v12);
    v14 = (unsigned int *)ctf_lookup_by_id((uint64_t)&v50, v10);
    v15 = ctf_lookup_by_id((uint64_t)&v49, v12);
    if (v5)
    {
      v16 = (unsigned int *)v15;
      result = 0;
      if (v11 != v13 || !v14 || !v16)
        return result;
      v18 = *v14;
      v19 = &v50[2 * (v18 >> 31)];
      v20 = v19[53];
      if (v20)
      {
        v21 = v18 & 0x7FFFFFFF;
        v22 = (uint64_t)v20 + v21;
        v23 = (unint64_t)v19[54] <= v21 ? 0 : (const char *)v22;
      }
      else
      {
        v23 = 0;
      }
      v24 = v23 ? v23 : "(?)";
      v25 = *v16;
      v26 = &v49[2 * (v25 >> 31)];
      v27 = v26[53];
      if (v27)
      {
        v28 = v25 & 0x7FFFFFFF;
        v29 = (uint64_t)v27 + v28;
        v30 = (unint64_t)v26[54] <= v28 ? 0 : (const char *)v29;
      }
      else
      {
        v30 = 0;
      }
      v31 = v30 ? v30 : "(?)";
      if (strcmp(v24, v31))
        return 0;
    }
    result = 1;
    switch(v11)
    {
      case 1:
      case 2:
        if (ctf_type_encoding(v50, v10, (unsigned int *)&v47)
          || ctf_type_encoding(v49, v12, (unsigned int *)&v45))
        {
          return 0;
        }
        return v47 == v45 && v48 == (unint64_t)v46;
      case 3:
        goto LABEL_42;
      case 4:
        v42 = 0;
        v43 = 0;
        v44 = 0;
        v34 = v50;
        if (ctf_array_info(v50, v10, (uint64_t)&v42))
          return 0;
        v39 = 0;
        v40 = 0;
        v41 = 0;
        v35 = v49;
        if (ctf_array_info(v49, v12, (uint64_t)&v39) || (_DWORD)v44 != (_DWORD)v41)
          return 0;
        result = ctf_type_compat_helper(v34, v42, v35, v39, 1);
        if (!(_DWORD)result)
          return result;
        a2 = v43;
        a4 = v40;
        a1 = v34;
        a3 = v35;
        goto LABEL_45;
      case 6:
      case 7:
        v33 = ctf_type_size((uint64_t)v50, v10);
        return v33 == ctf_type_size((uint64_t)v49, v12);
      case 8:
      case 9:
        return result;
      case 14:
        v10 = ctf_type_reference((uint64_t)v50, v10);
LABEL_42:
        v36 = v49;
        if (v13 == 14)
          v12 = ctf_type_reference((uint64_t)v49, v12);
        v37 = v50;
        v38 = ctf_type_reference((uint64_t)v50, v10);
        a4 = ctf_type_reference((uint64_t)v36, v12);
        a1 = v37;
        a2 = v38;
        a3 = v36;
LABEL_45:
        a5 = 1;
        break;
      default:
        return 0;
    }
  }
}

uint64_t ctf_type_printf_compat(uint64_t (***a1)(uint64_t), uint64_t a2, uint64_t (***a3)(uint64_t), uint64_t a4)
{
  return ctf_type_compat_helper(a1, a2, a3, a4, 0);
}

uint64_t ctf_member_info(int *a1, uint64_t a2, const char *a3, _QWORD *a4)
{
  return _ctf_member_info(a1, a2, a3, 0, a4);
}

uint64_t _ctf_member_info(int *a1, uint64_t a2, const char *a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  unsigned int *v19;
  unsigned int v20;
  uint64_t result;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  int v29;
  int v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  int v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  int v52;
  int v53;
  uint64_t v54;
  unsigned int v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int *v66;

  v66 = a1;
  v9 = ctf_type_resolve((uint64_t)a1, a2);
  if (v9 == -1)
    return 0xFFFFFFFFLL;
  v64 = 0;
  v65 = 0;
  v10 = ctf_lookup_by_id((uint64_t)&v66, v9);
  if (!v10)
    return 0xFFFFFFFFLL;
  v11 = v10;
  v12 = v66;
  ctf_get_ctt_size(v66, v10, (unint64_t *)&v65, &v64);
  if (v12[141] > 3)
    v13 = *(unsigned int *)(v11 + 4);
  else
    v13 = *(unsigned __int16 *)(v11 + 4);
  if ((**(unsigned int (***)(uint64_t))v12)(v13) - 8 > 0xFFFFFFFD)
  {
    v15 = v12[141];
    if (v15 == 1 || v65 < 0x2000)
    {
      if (v15 == 4)
      {
        v28 = v64;
        v29 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)v12 + 16))(*(unsigned int *)(v11 + 4));
        if (v29)
        {
          v30 = v29;
          v31 = v28 + v11;
          while (1)
          {
            v32 = *(_DWORD *)v31;
            if (!*(_DWORD *)v31)
            {
              result = _ctf_member_info(v12, *(unsigned int *)(v31 + 4), a3, *(unsigned __int16 *)(v31 + 8) + a4, a5);
              if (!(_DWORD)result)
                return result;
              v32 = *(_DWORD *)v31;
            }
            v33 = v32 >> 31;
            v34 = *(_QWORD *)&v12[4 * v33 + 106];
            if (v34)
            {
              v35 = v32 & 0x7FFFFFFF;
              v36 = v34 + v35;
              v37 = *(_QWORD *)&v12[4 * v33 + 108] <= v35 ? 0 : (const char *)v36;
            }
            else
            {
              v37 = 0;
            }
            v38 = v37 ? v37 : "(?)";
            result = strcmp(v38, a3);
            if (!(_DWORD)result)
              break;
            v31 += 12;
            if (!--v30)
              goto LABEL_81;
          }
          *a5 = *(unsigned int *)(v31 + 4);
          v63 = *(unsigned __int16 *)(v31 + 8);
          goto LABEL_90;
        }
      }
      else
      {
        if (v15 > 3)
          v40 = *(unsigned int *)(v11 + 4);
        else
          v40 = *(unsigned __int16 *)(v11 + 4);
        v51 = v64;
        v52 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v12 + 16))(v40);
        if (v52)
        {
          v53 = v52;
          v54 = v51 + v11;
          while (1)
          {
            v55 = *(_DWORD *)v54;
            if (!*(_DWORD *)v54)
            {
              result = _ctf_member_info(v12, *(unsigned __int16 *)(v54 + 4), a3, *(unsigned __int16 *)(v54 + 6) + a4, a5);
              if (!(_DWORD)result)
                return result;
              v55 = *(_DWORD *)v54;
            }
            v56 = v55 >> 31;
            v57 = *(_QWORD *)&v12[4 * v56 + 106];
            if (v57)
            {
              v58 = v55 & 0x7FFFFFFF;
              v59 = v57 + v58;
              v60 = *(_QWORD *)&v12[4 * v56 + 108] <= v58 ? 0 : (const char *)v59;
            }
            else
            {
              v60 = 0;
            }
            v61 = v60 ? v60 : "(?)";
            result = strcmp(v61, a3);
            if (!(_DWORD)result)
              break;
            v54 += 8;
            if (!--v53)
              goto LABEL_81;
          }
          *a5 = *(unsigned __int16 *)(v54 + 4);
          v63 = *(unsigned __int16 *)(v54 + 6);
          goto LABEL_90;
        }
      }
    }
    else if (v15 == 4)
    {
      v16 = v64;
      v17 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)v12 + 16))(*(unsigned int *)(v11 + 4));
      if (v17)
      {
        v18 = v17;
        v19 = (unsigned int *)(v16 + v11);
        while (1)
        {
          v20 = *v19;
          if (!*v19)
          {
            result = _ctf_member_info(v12, 0, a3, (v19[3] | ((unint64_t)v19[2] << 32)) + a4, a5);
            if (!(_DWORD)result)
              return result;
            v20 = *v19;
          }
          v22 = v20 >> 31;
          v23 = *(_QWORD *)&v12[4 * v22 + 106];
          if (v23)
          {
            v24 = v20 & 0x7FFFFFFF;
            v25 = v23 + v24;
            v26 = *(_QWORD *)&v12[4 * v22 + 108] <= v24 ? 0 : (const char *)v25;
          }
          else
          {
            v26 = 0;
          }
          v27 = v26 ? v26 : "(?)";
          result = strcmp(v27, a3);
          if (!(_DWORD)result)
            break;
          v19 += 4;
          if (!--v18)
            goto LABEL_81;
        }
        v62 = v19[1];
LABEL_88:
        *a5 = v62;
        v63 = v19[3] | ((unint64_t)v19[2] << 32);
LABEL_90:
        a5[1] = v63 + a4;
        return result;
      }
    }
    else
    {
      if (v15 > 3)
        v39 = *(unsigned int *)(v11 + 4);
      else
        v39 = *(unsigned __int16 *)(v11 + 4);
      v41 = v64;
      v42 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v12 + 16))(v39);
      if (v42)
      {
        v43 = v42;
        v19 = (unsigned int *)(v41 + v11);
        while (1)
        {
          v44 = *v19;
          if (!*v19)
          {
            result = _ctf_member_info(v12, 0, a3, (v19[3] | ((unint64_t)v19[2] << 32)) + a4, a5);
            if (!(_DWORD)result)
              return result;
            v44 = *v19;
          }
          v45 = v44 >> 31;
          v46 = *(_QWORD *)&v12[4 * v45 + 106];
          if (v46)
          {
            v47 = v44 & 0x7FFFFFFF;
            v48 = v46 + v47;
            v49 = *(_QWORD *)&v12[4 * v45 + 108] <= v47 ? 0 : (const char *)v48;
          }
          else
          {
            v49 = 0;
          }
          v50 = v49 ? v49 : "(?)";
          result = strcmp(v50, a3);
          if (!(_DWORD)result)
            break;
          v19 += 4;
          if (!--v43)
            goto LABEL_81;
        }
        v62 = *((unsigned __int16 *)v19 + 2);
        goto LABEL_88;
      }
    }
LABEL_81:
    v14 = 1038;
    goto LABEL_82;
  }
  v14 = 1021;
LABEL_82:
  a1[140] = v14;
  return 0xFFFFFFFFLL;
}

const char *ctf_enum_name(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5;
  const char *result;
  uint64_t v7;
  _DWORD *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  unsigned int *v14;
  unint64_t v15;
  _DWORD *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _DWORD *v22;

  v22 = (_DWORD *)a1;
  v5 = ctf_type_resolve(a1, a2);
  if (v5 == -1)
    return 0;
  v21 = 0;
  result = (const char *)ctf_lookup_by_id((uint64_t)&v22, v5);
  if (result)
  {
    v7 = (uint64_t)result;
    v8 = v22;
    if ((int)v22[141] > 3)
      v9 = *((unsigned int *)result + 1);
    else
      v9 = *((unsigned __int16 *)result + 2);
    if ((**(unsigned int (***)(uint64_t))v22)(v9) == 8)
    {
      ctf_get_ctt_size(v8, v7, 0, &v21);
      if ((int)v8[141] > 3)
        v10 = *(unsigned int *)(v7 + 4);
      else
        v10 = *(unsigned __int16 *)(v7 + 4);
      v12 = v21;
      v13 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 16))(v10);
      if (v13)
      {
        v14 = (unsigned int *)(v12 + v7);
        while (v14[1] != a3)
        {
          v14 += 2;
          if (!--v13)
            goto LABEL_16;
        }
        v15 = *v14;
        v16 = &v8[4 * (v15 >> 31)];
        v17 = *((_QWORD *)v16 + 53);
        if (v17)
        {
          v18 = v15 & 0x7FFFFFFF;
          v19 = v17 + v18;
          if (*((_QWORD *)v16 + 54) <= v18)
            v20 = 0;
          else
            v20 = v19;
        }
        else
        {
          v20 = 0;
        }
        if (v20)
          return (const char *)v20;
        else
          return "(?)";
      }
LABEL_16:
      result = 0;
      v11 = 1037;
    }
    else
    {
      result = 0;
      v11 = 1022;
    }
    *(_DWORD *)(a1 + 560) = v11;
  }
  return result;
}

uint64_t ctf_enum_value(uint64_t a1, uint64_t a2, const char *a3, _DWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _DWORD *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  unsigned int *v17;
  unint64_t v18;
  _DWORD *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  uint64_t result;
  uint64_t v26;
  unint64_t v27;
  _DWORD *v28;

  v28 = (_DWORD *)a1;
  v7 = ctf_type_resolve(a1, a2);
  if (v7 == -1)
    return 0xFFFFFFFFLL;
  v26 = 0;
  v27 = 0;
  v8 = ctf_lookup_by_id((uint64_t)&v28, v7);
  if (!v8)
    return 0xFFFFFFFFLL;
  v9 = v8;
  v10 = v28;
  if ((int)v28[141] > 3)
    v11 = *(unsigned int *)(v8 + 4);
  else
    v11 = *(unsigned __int16 *)(v8 + 4);
  if ((**(unsigned int (***)(uint64_t))v28)(v11) != 8)
  {
    v13 = 1022;
LABEL_24:
    *(_DWORD *)(a1 + 560) = v13;
    return 0xFFFFFFFFLL;
  }
  ctf_get_ctt_size(v10, v9, &v27, &v26);
  if ((int)v10[141] > 3)
    v12 = *(unsigned int *)(v9 + 4);
  else
    v12 = *(unsigned __int16 *)(v9 + 4);
  v14 = v26;
  v15 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v10 + 16))(v12);
  if (!v15)
  {
LABEL_23:
    v13 = 1037;
    goto LABEL_24;
  }
  v16 = v15;
  v17 = (unsigned int *)(v14 + v9);
  while (1)
  {
    v18 = *v17;
    v19 = &v10[4 * (v18 >> 31)];
    v20 = *((_QWORD *)v19 + 53);
    if (v20)
    {
      v21 = v18 & 0x7FFFFFFF;
      v22 = v20 + v21;
      v23 = *((_QWORD *)v19 + 54) <= v21 ? 0 : (const char *)v22;
    }
    else
    {
      v23 = 0;
    }
    v24 = v23 ? v23 : "(?)";
    if (!strcmp(v24, a3))
      break;
    v17 += 2;
    if (!--v16)
      goto LABEL_23;
  }
  result = 0;
  if (a4)
    *a4 = v17[1];
  return result;
}

uint64_t ctf_type_visit(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a4)
{
  return ctf_type_rvisit(a1, a2, a3, a4, (uint64_t)&_CTF_NULLSTR, 0, 0);
}

uint64_t ctf_type_rvisit(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  _DWORD *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  unsigned int *v23;
  unint64_t v24;
  _DWORD *v25;
  uint64_t v26;
  unint64_t v27;
  const char *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  unsigned __int16 *v34;
  unint64_t v35;
  _DWORD *v36;
  uint64_t v37;
  unint64_t v38;
  const char *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  unsigned int *v47;
  unint64_t v48;
  _DWORD *v49;
  uint64_t v50;
  unint64_t v51;
  const char *v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  unsigned __int16 *v58;
  unint64_t v59;
  _DWORD *v60;
  uint64_t v61;
  unint64_t v62;
  const char *v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  _DWORD *v68;

  v68 = (_DWORD *)a1;
  v13 = ctf_type_resolve(a1, a2);
  if (v13 == -1)
    return 0xFFFFFFFFLL;
  v66 = 0;
  v67 = 0;
  v14 = ctf_lookup_by_id((uint64_t)&v68, v13);
  if (!v14)
    return 0xFFFFFFFFLL;
  v15 = v14;
  result = a3(a5, a2, a6, a7, a4);
  if (!(_DWORD)result)
  {
    v17 = v68;
    if ((int)v68[141] > 3)
      v18 = *(unsigned int *)(v15 + 4);
    else
      v18 = *(unsigned __int16 *)(v15 + 4);
    if ((**(unsigned int (***)(uint64_t))v68)(v18) - 8 >= 0xFFFFFFFE)
    {
      ctf_get_ctt_size(v17, v15, (unint64_t *)&v67, &v66);
      v19 = v17[141];
      if (v19 == 1 || v67 < 0x2000)
      {
        if (v19 == 4)
        {
          v31 = v66;
          result = (*(uint64_t (**)(_QWORD))(*(_QWORD *)v17 + 16))(*(unsigned int *)(v15 + 4));
          if ((_DWORD)result)
          {
            v32 = result;
            v33 = (a7 + 1);
            v34 = (unsigned __int16 *)(v31 + v15 + 8);
            do
            {
              v35 = *((unsigned int *)v34 - 2);
              v36 = &v17[4 * (v35 >> 31)];
              v37 = *((_QWORD *)v36 + 53);
              if (v37)
              {
                v38 = v35 & 0x7FFFFFFF;
                v39 = (const char *)(v37 + v38);
                if (*((_QWORD *)v36 + 54) <= v38)
                  v40 = 0;
                else
                  v40 = v39;
              }
              else
              {
                v40 = 0;
              }
              if (v40)
                v41 = v40;
              else
                v41 = "(?)";
              result = ctf_type_rvisit(v17, *((unsigned int *)v34 - 1), a3, a4, v41, *v34 + a6, v33);
              if ((_DWORD)result)
                break;
              v34 += 6;
              --v32;
            }
            while (v32);
          }
        }
        else
        {
          if (v19 > 3)
            v43 = *(unsigned int *)(v15 + 4);
          else
            v43 = *(unsigned __int16 *)(v15 + 4);
          v55 = v66;
          result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v17 + 16))(v43);
          if ((_DWORD)result)
          {
            v56 = result;
            v57 = (a7 + 1);
            v58 = (unsigned __int16 *)(v55 + v15 + 6);
            do
            {
              v59 = *(unsigned int *)(v58 - 3);
              v60 = &v17[4 * (v59 >> 31)];
              v61 = *((_QWORD *)v60 + 53);
              if (v61)
              {
                v62 = v59 & 0x7FFFFFFF;
                v63 = (const char *)(v61 + v62);
                if (*((_QWORD *)v60 + 54) <= v62)
                  v64 = 0;
                else
                  v64 = v63;
              }
              else
              {
                v64 = 0;
              }
              if (v64)
                v65 = v64;
              else
                v65 = "(?)";
              result = ctf_type_rvisit(v17, *(v58 - 1), a3, a4, v65, *v58 + a6, v57);
              if ((_DWORD)result)
                break;
              v58 += 4;
              --v56;
            }
            while (v56);
          }
        }
      }
      else if (v19 == 4)
      {
        v20 = v66;
        result = (*(uint64_t (**)(_QWORD))(*(_QWORD *)v17 + 16))(*(unsigned int *)(v15 + 4));
        if ((_DWORD)result)
        {
          v21 = result;
          v22 = (a7 + 1);
          v23 = (unsigned int *)(v20 + v15 + 8);
          do
          {
            v24 = *(v23 - 2);
            v25 = &v17[4 * (v24 >> 31)];
            v26 = *((_QWORD *)v25 + 53);
            if (v26)
            {
              v27 = v24 & 0x7FFFFFFF;
              v28 = (const char *)(v26 + v27);
              if (*((_QWORD *)v25 + 54) <= v27)
                v29 = 0;
              else
                v29 = v28;
            }
            else
            {
              v29 = 0;
            }
            if (v29)
              v30 = v29;
            else
              v30 = "(?)";
            result = ctf_type_rvisit(v17, *(v23 - 1), a3, a4, v30, (v23[1] | ((unint64_t)*v23 << 32)) + a6, v22);
            if ((_DWORD)result)
              break;
            v23 += 4;
            --v21;
          }
          while (v21);
        }
      }
      else
      {
        if (v19 > 3)
          v42 = *(unsigned int *)(v15 + 4);
        else
          v42 = *(unsigned __int16 *)(v15 + 4);
        v44 = v66;
        result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v17 + 16))(v42);
        if ((_DWORD)result)
        {
          v45 = result;
          v46 = (a7 + 1);
          v47 = (unsigned int *)(v44 + v15 + 8);
          do
          {
            v48 = *(v47 - 2);
            v49 = &v17[4 * (v48 >> 31)];
            v50 = *((_QWORD *)v49 + 53);
            if (v50)
            {
              v51 = v48 & 0x7FFFFFFF;
              v52 = (const char *)(v50 + v51);
              if (*((_QWORD *)v49 + 54) <= v51)
                v53 = 0;
              else
                v53 = v52;
            }
            else
            {
              v53 = 0;
            }
            if (v53)
              v54 = v53;
            else
              v54 = "(?)";
            result = ctf_type_rvisit(v17, *((unsigned __int16 *)v47 - 2), a3, a4, v54, (v47[1] | ((unint64_t)*v47 << 32)) + a6, v46);
            if ((_DWORD)result)
              break;
            v47 += 4;
            --v45;
          }
          while (v45);
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

_QWORD *ctf_list_append(_QWORD *result, _QWORD *a2)
{
  _QWORD *v2;

  v2 = (_QWORD *)*result;
  *result = a2;
  *a2 = v2;
  a2[1] = 0;
  if (!v2)
    v2 = result;
  v2[1] = a2;
  return result;
}

_QWORD *ctf_list_prepend(_QWORD *result, _QWORD *a2)
{
  _QWORD *v2;

  v2 = (_QWORD *)result[1];
  result[1] = a2;
  *a2 = 0;
  a2[1] = v2;
  if (!v2)
    v2 = result;
  *v2 = a2;
  return result;
}

_QWORD *ctf_list_delete(_QWORD *result, uint64_t *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;

  v2 = (_QWORD *)*a2;
  if (*a2)
    v3 = (_QWORD *)*a2;
  else
    v3 = result;
  v3[1] = a2[1];
  v4 = (_QWORD *)a2[1];
  if (!v4)
    v4 = result;
  *v4 = v2;
  return result;
}

uint64_t ctf_strraw(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v2 = a2 >> 31;
  v3 = *(_QWORD *)(a1 + 16 * v2 + 424);
  if (!v3)
    return 0;
  v4 = a2 & 0x7FFFFFFF;
  v5 = v3 + v4;
  if (*(_QWORD *)(a1 + 16 * v2 + 432) <= v4)
    return 0;
  else
    return v5;
}

const char *ctf_strptr(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = a2 >> 31;
  v3 = *(_QWORD *)(a1 + 16 * v2 + 424);
  if (v3)
  {
    v4 = a2 & 0x7FFFFFFF;
    v5 = v3 + v4;
    if (*(_QWORD *)(a1 + 16 * v2 + 432) <= v4)
      v6 = 0;
    else
      v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  if (v6)
    return (const char *)v6;
  else
    return "(?)";
}

char *ctf_strdup(const char *a1)
{
  size_t v2;
  char *result;

  v2 = strlen(a1);
  result = (char *)malloc_type_malloc(v2 + 1, 0xCFAB4140uLL);
  if (result)
    return strcpy(result, a1);
  return result;
}

uint64_t ctf_set_open_errno(_DWORD *a1, int a2)
{
  if (a1)
    *a1 = a2;
  return 0;
}

uint64_t ctf_set_errno(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 560) = a2;
  return -1;
}

size_t _os_log_fmt_decode_error(size_t result)
{
  uint64_t v1;
  unsigned int v2;

  if ((*(_WORD *)(result + 20) & 2) == 0)
  {
    v1 = *(unsigned int *)(result + 8);
    if ((*(char *)(result + 22) + *(_DWORD *)(result + 12) - v1 - 1) <= 0x15)
    {
      return os_trace_blob_add_slow(result, "<decode: missing data>", 0x16uLL);
    }
    else
    {
      qmemcpy((void *)(*(_QWORD *)result + v1), "<decode: missing data>", 22);
      v2 = *(_DWORD *)(result + 8) + 22;
      *(_DWORD *)(result + 8) = v2;
      if (!*(_BYTE *)(result + 22))
        *(_BYTE *)(*(_QWORD *)result + v2) = 0;
    }
  }
  return result;
}

uint64_t _os_log_fmt_decode_cmd_mismatch(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;
  _DWORD *v30;
  unsigned int v31;
  uint64_t v32;
  unsigned int v33;

  v8 = a5;
  os_trace_blob_addf(a1, "<decode: mismatch for [%.*s] got [", a3, (uint64_t)a4, a5, a6, a7, a8, a3);
  v17 = *a4;
  if (v17 > 0x4F)
  {
    os_trace_blob_addf(a1, "%d", v11, v12, v13, v14, v15, v16, *a4 >> 4);
  }
  else
  {
    v18 = _cmd_type2str[v17 >> 4];
    v19 = strlen(v18);
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      v26 = v19;
      v27 = *(unsigned int *)(a1 + 8);
      if (v19 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v27 - 1))
      {
        os_trace_blob_add_slow(a1, v18, v19);
      }
      else
      {
        memcpy((void *)(*(_QWORD *)a1 + v27), v18, v19);
        v28 = *(_DWORD *)(a1 + 8) + v26;
        *(_DWORD *)(a1 + 8) = v28;
        if (!*(_BYTE *)(a1 + 22))
          *(_BYTE *)(*(_QWORD *)a1 + v28) = 0;
      }
    }
  }
  if ((*a4 & 2) != 0 && (*(_WORD *)(a1 + 20) & 2) == 0)
  {
    v29 = *(unsigned int *)(a1 + 8);
    if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v29 - 1) <= 6)
    {
      os_trace_blob_add_slow(a1, " public", 7uLL);
    }
    else
    {
      v30 = (_DWORD *)(*(_QWORD *)a1 + v29);
      *(_DWORD *)((char *)v30 + 3) = 1667853410;
      *v30 = 1651863584;
      v31 = *(_DWORD *)(a1 + 8) + 7;
      *(_DWORD *)(a1 + 8) = v31;
      if (!*(_BYTE *)(a1 + 22))
        *(_BYTE *)(*(_QWORD *)a1 + v31) = 0;
    }
  }
  if ((*a4 & 1) != 0 && (*(_WORD *)(a1 + 20) & 2) == 0)
  {
    v32 = *(unsigned int *)(a1 + 8);
    if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v32 - 1) <= 7)
    {
      os_trace_blob_add_slow(a1, " private", 8uLL);
    }
    else
    {
      *(_QWORD *)(*(_QWORD *)a1 + v32) = 0x6574617669727020;
      v33 = *(_DWORD *)(a1 + 8) + 8;
      *(_DWORD *)(a1 + 8) = v33;
      if (!*(_BYTE *)(a1 + 22))
        *(_BYTE *)(*(_QWORD *)a1 + v33) = 0;
    }
  }
  return os_trace_blob_addf(a1, " sz:%d]>", v20, v21, v22, v23, v24, v25, v8);
}

uint64_t _os_log_fmt_decode_bad_range(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_trace_blob_addf(a1, "<decode: bad range for [%.*s] got [offs:%d len:%d within:%d]>", a3, a4, a5, a6, a7, a8, a3);
}

uint64_t _os_log_fmt_decode_masked_unknown(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;

  if ((a4 - 8) < 3)
    return os_trace_blob_addf(a1, "<decode: mask \"%.*s\" is %s>", a3, a4, a5, a6, a7, a8, a2);
  result = _os_crash();
  __break(1u);
  return result;
}

uint64_t _os_log_fmt_decode_give_up(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_trace_blob_addf(a1, "<decode: can't compose [%.*s]>", a3, a4, a5, a6, a7, a8, a3);
}

id _OSLogFailWithPOSIXError(id result, _QWORD *a2)
{
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], (int)result, 0);
    result = (id)objc_claimAutoreleasedReturnValue();
    *a2 = result;
  }
  return result;
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

uint64_t MKBDeviceFormattedForContentProtection()
{
  return MEMORY[0x1E0D4E478]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1E0D4E4A0]();
}

id NSAllocateObject(Class aClass, NSUInteger extraBytes, NSZone *zone)
{
  return (id)MEMORY[0x1E0CB2868](aClass, extraBytes, zone);
}

void NSDeallocateObject(id object)
{
  MEMORY[0x1E0CB2920](object);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB3400](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFCopySupplementalVersionDictionary()
{
  return MEMORY[0x1E0C9A0C8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

void operator delete(void *__p)
{
  off_1E41553F8(__p);
}

uint64_t operator delete()
{
  return off_1E4155400();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E4155408(__sz);
}

uint64_t operator new()
{
  return off_1E4155410();
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

uint64_t __memset_chk()
{
  return MEMORY[0x1E0C80B78]();
}

int __snprintf_chk(char *a1, size_t a2, int a3, size_t a4, const char *a5, ...)
{
  return MEMORY[0x1E0C80BE0](a1, a2, *(_QWORD *)&a3, a4, a5);
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x1E0C80BE8](a1, *(_QWORD *)&a2, a3, a4);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C70](*(_QWORD *)&a1);
}

uint64_t _dyld_dlsym_blocked()
{
  return MEMORY[0x1E0C80E08]();
}

uint64_t _dyld_get_shared_cache_uuid()
{
  return MEMORY[0x1E0C80EA0]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1E0C80FF0]();
}

uint64_t _os_assumes_log()
{
  return MEMORY[0x1E0C80FF8]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C81000]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _os_state_request_for_pidlist()
{
  return MEMORY[0x1E0C810E8]();
}

uint64_t _os_trace_app_cryptex_sysprefsdir_path()
{
  return MEMORY[0x1E0C810F0]();
}

uint64_t _os_trace_calloc()
{
  return MEMORY[0x1E0C810F8]();
}

uint64_t _os_trace_fdscandir_b()
{
  return MEMORY[0x1E0C81100]();
}

uint64_t _os_trace_get_boot_uuid()
{
  return MEMORY[0x1E0C81108]();
}

uint64_t _os_trace_getxattr_at()
{
  return MEMORY[0x1E0C81110]();
}

uint64_t _os_trace_intprefsdir_path()
{
  return MEMORY[0x1E0C81118]();
}

uint64_t _os_trace_is_development_build()
{
  return MEMORY[0x1E0C81120]();
}

uint64_t _os_trace_malloc()
{
  return MEMORY[0x1E0C81130]();
}

uint64_t _os_trace_memdup()
{
  return MEMORY[0x1E0C81138]();
}

uint64_t _os_trace_mmap()
{
  return MEMORY[0x1E0C81140]();
}

uint64_t _os_trace_mmap_at()
{
  return MEMORY[0x1E0C81148]();
}

uint64_t _os_trace_os_cryptex_sysprefsdir_path()
{
  return MEMORY[0x1E0C81150]();
}

uint64_t _os_trace_prefsdir_path()
{
  return MEMORY[0x1E0C81158]();
}

uint64_t _os_trace_read_file_at()
{
  return MEMORY[0x1E0C81160]();
}

uint64_t _os_trace_realloc()
{
  return MEMORY[0x1E0C81168]();
}

uint64_t _os_trace_scandir_free_namelist()
{
  return MEMORY[0x1E0C81170]();
}

uint64_t _os_trace_sysprefsdir_path()
{
  return MEMORY[0x1E0C81178]();
}

uint64_t _os_trace_write()
{
  return MEMORY[0x1E0C81180]();
}

uint64_t _os_trace_writev()
{
  return MEMORY[0x1E0C81188]();
}

uint64_t _os_trace_zalloc()
{
  return MEMORY[0x1E0C81190]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1E0C813D0](a1, *(_QWORD *)&a2);
}

int alphasort(const dirent **a1, const dirent **a2)
{
  return MEMORY[0x1E0C81560](a1, a2);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1E0C81608](a1, a2);
}

int atexit_b(void *a1)
{
  return MEMORY[0x1E0C81650](a1);
}

const char *__cdecl bootstrap_strerror(kern_return_t r)
{
  return (const char *)MEMORY[0x1E0C81730](*(_QWORD *)&r);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1E0DE7A80](cls, outCount);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1E0C82698](a1);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1E0DE5270](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1E0DE5280](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1E0C82D08](key);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x1E0C82E10](predicate, context, function);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x1E0C82E80](queue, key, context, destructor);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1E0C82F28](source);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F48](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

int dlclose(void *__handle)
{
  return MEMORY[0x1E0C83030](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int dup(int a1)
{
  return MEMORY[0x1E0C83078](*(_QWORD *)&a1);
}

int dup2(int a1, int a2)
{
  return MEMORY[0x1E0C83088](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

uint64_t dyld_shared_cache_iterate_text()
{
  return MEMORY[0x1E0C831A0]();
}

int execlp(const char *__file, const char *__arg0, ...)
{
  return MEMORY[0x1E0C83260](__file, __arg0);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

int faccessat(int a1, const char *a2, int a3, int a4)
{
  return MEMORY[0x1E0C832B8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1E0C832D0](*(_QWORD *)&a1, a2);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1E0C832E0](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fcopyfile(int from_fd, int to_fd, copyfile_state_t a3, copyfile_flags_t flags)
{
  return MEMORY[0x1E0C83308](*(_QWORD *)&from_fd, *(_QWORD *)&to_fd, a3, *(_QWORD *)&flags);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x1E0C83318](*(_QWORD *)&a1, a2);
}

DIR *__cdecl fdopendir(int a1)
{
  return (DIR *)MEMORY[0x1E0C83320](*(_QWORD *)&a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1E0C83370](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1E0C833B0](a1);
}

pid_t fork(void)
{
  return MEMORY[0x1E0C83468]();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1E0C83490](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C83548](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int fstatat(int a1, const char *a2, stat *a3, int a4)
{
  return MEMORY[0x1E0C83568](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int fsync(int a1)
{
  return MEMORY[0x1E0C83578](*(_QWORD *)&a1);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x1E0C835A0](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x1E0C835A8](a1, *(_QWORD *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x1E0C835B0](a1);
}

int fts_set(FTS *a1, FTSENT *a2, int a3)
{
  return MEMORY[0x1E0C835B8](a1, a2, *(_QWORD *)&a3);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

int getpagesize(void)
{
  return MEMORY[0x1E0C83740]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C83778]();
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1E0C83860](a1, a2);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1E0C83980](*(_QWORD *)&a1, a2);
}

int isatty(int a1)
{
  return MEMORY[0x1E0C839A8](*(_QWORD *)&a1);
}

int issetugid(void)
{
  return MEMORY[0x1E0C839B8]();
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1E0C83BB0](a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1E0C83C80](*(_QWORD *)&error_value);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

int mergesort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  return MEMORY[0x1E0C840E0](__base, __nel, __width, __compar);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C84160](a1, a2);
}

int mkdirat(int a1, const char *a2, mode_t a3)
{
  return MEMORY[0x1E0C84168](*(_QWORD *)&a1, a2, a3);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1E0C84170](a1);
}

int mkstemps(char *a1, int a2)
{
  return MEMORY[0x1E0C841B0](a1, *(_QWORD *)&a2);
}

time_t mktime(tm *a1)
{
  return MEMORY[0x1E0C841C8](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int mprotect(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1E0C841F0](a1, a2, *(_QWORD *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x1E0C844A0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1E0C844C0](a1);
}

uint64_t os_log_backtrace_create_from_buffer()
{
  return MEMORY[0x1E0C84700]();
}

uint64_t os_log_backtrace_destroy()
{
  return MEMORY[0x1E0C84708]();
}

uint64_t os_log_backtrace_get_frames()
{
  return MEMORY[0x1E0C84710]();
}

uint64_t os_log_backtrace_get_length()
{
  return MEMORY[0x1E0C84718]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1E0C849D8]();
}

void perror(const char *a1)
{
  MEMORY[0x1E0C84AF0](a1);
}

int pipe(int a1[2])
{
  return MEMORY[0x1E0C84B10](a1);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C84BC8](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

objc_property_attribute_t *__cdecl property_copyAttributeList(objc_property_t property, unsigned int *outCount)
{
  return (objc_property_attribute_t *)MEMORY[0x1E0DE8058](property, outCount);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1E0DE8070](property);
}

objc_property_t *__cdecl protocol_copyPropertyList(Protocol *proto, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1E0DE8090](proto, outCount);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1E0C84DC0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1E0C84DE0](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1E0C84F18](a1, a2);
}

int putchar(int a1)
{
  return MEMORY[0x1E0C84F50](*(_QWORD *)&a1);
}

int putenv(char *a1)
{
  return MEMORY[0x1E0C84F58](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1E0C84F60](a1);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  MEMORY[0x1E0C84F90](__base, __nel, __width, __compar);
}

size_t rb_tree_count(rb_tree_t *a1)
{
  return MEMORY[0x1E0C84FC8](a1);
}

void *__cdecl rb_tree_find_node(rb_tree_t *a1, const void *a2)
{
  return (void *)MEMORY[0x1E0C84FD0](a1, a2);
}

void rb_tree_init(rb_tree_t *a1, const rb_tree_ops_t *a2)
{
  MEMORY[0x1E0C84FD8](a1, a2);
}

void *__cdecl rb_tree_insert_node(rb_tree_t *a1, void *a2)
{
  return (void *)MEMORY[0x1E0C84FE0](a1, a2);
}

void *__cdecl rb_tree_iterate(rb_tree_t *a1, void *a2, const unsigned int a3)
{
  return (void *)MEMORY[0x1E0C84FE8](a1, a2, *(_QWORD *)&a3);
}

void rb_tree_remove_node(rb_tree_t *a1, void *a2)
{
  MEMORY[0x1E0C84FF0](a1, a2);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1E0C85008](a1);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

int renameat(int a1, const char *a2, int a3, const char *a4)
{
  return MEMORY[0x1E0C85108](*(_QWORD *)&a1, a2, *(_QWORD *)&a3, a4);
}

int rmdir(const char *a1)
{
  return MEMORY[0x1E0C85138](a1);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1E0C853F0](*(_QWORD *)&a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C85500](a1, a2);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1E0C85508](__big, __little);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C85518](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1E0C85530](__dst, __src);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1E0C85538](__s, __charset);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1E0C85558](a1, a2, a3, a4);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1E0C85590](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B0](__dst, __src, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B8](__s1, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C855C0](__s1, __n);
}

char *__cdecl strpbrk(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C855D0](__s1, __s2);
}

char *__cdecl strptime(const char *a1, const char *a2, tm *a3)
{
  return (char *)MEMORY[0x1E0C855D8](a1, a2, a3);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C855E8](__s, *(_QWORD *)&__c);
}

size_t strspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1E0C85608](__s, __charset);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85610](__s1, __s2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85698](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C856A8](__str, __endptr, *(_QWORD *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

FILE *tmpfile(void)
{
  return (FILE *)MEMORY[0x1E0C85978]();
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

int unlinkat(int a1, const char *a2, int a3)
{
  return MEMORY[0x1E0C859C0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

void uuid_clear(uuid_t uu)
{
  MEMORY[0x1E0C85A00](uu);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1E0C85A08](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x1E0C85A10](dst, src);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1E0C85A30](uu);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1E0C85A38](in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A40](uu, out);
}

void uuid_unparse_lower(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A48](uu, out);
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A50](uu, out);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1E0C85A58](a1, a2, a3);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x1E0C85A68](a1, a2, a3);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1E0C85B98](__str, __size, __format, a4);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x1E0C85BD0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C85DF8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

void xpc_array_set_int64(xpc_object_t xarray, size_t index, int64_t value)
{
  MEMORY[0x1E0C85EC0](xarray, index, value);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F50](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

uid_t xpc_connection_get_euid(xpc_connection_t connection)
{
  return MEMORY[0x1E0C85FF0](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
  MEMORY[0x1E0C86070](connection, context);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

void xpc_connection_set_finalizer_f(xpc_connection_t connection, xpc_finalizer_t finalizer)
{
  MEMORY[0x1E0C86088](connection, finalizer);
}

uint64_t xpc_copy_short_description()
{
  return MEMORY[0x1E0C86148]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86230](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C86278](xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return (const uint8_t *)MEMORY[0x1E0C862D8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C86330](xdict, key, bytes, length);
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
  MEMORY[0x1E0C86358](xdict, key, *(_QWORD *)&fd);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1E0C86570](xint);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C86658](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1E0C86660](object);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1E0C867B8](xuint);
}

