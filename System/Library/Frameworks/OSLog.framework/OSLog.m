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
  v6 = &unk_1E977B0D8;
  v7 = a2;
  for (i = *(_QWORD **)(v2 + 16); i; i = (_QWORD *)*i)
    result = ((uint64_t (*)(_QWORD *, _QWORD *, _QWORD))v5)(v4, i + 2, i[4]);
  return result;
}

uint64_t ___catalog_for_each_uuid_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
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
  v4[3] = &unk_1E977B100;
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
  v5[3] = &unk_1E977B128;
  v5[5] = &v7;
  v5[6] = a2;
  v5[4] = v6;
  hashtable_iterate(v2, (uint64_t)v5);
  v3 = v8[3];
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v7, 8);
  return v3;
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

void _catalog_procinfo_free(unsigned int **a1)
{
  void (*v2)(_QWORD);

  v2 = (void (*)(_QWORD))MEMORY[0x1E0C834A8];
  hashtable_destroy(a1[7], (void (*)(_QWORD))MEMORY[0x1E0C834A8]);
  hashtable_destroy(a1[8], v2);
  free(a1);
}

void _catalog_destroy(uint64_t a1)
{
  unsigned int **v2;
  unsigned int *v3;
  uint64_t v4;
  void *v5;
  void **v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;

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
  v4 = *(_QWORD *)(a1 + 24);
  _os_trace_str_map_clear(v4);
  if (v4)
  {
    std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::__deallocate_node(*(void ***)(v4 + 16));
    v5 = *(void **)v4;
    *(_QWORD *)v4 = 0;
    if (v5)
      operator delete(v5);
    MEMORY[0x1D82595C8](v4, 0x10A0C408EF24B1CLL);
  }
  v6 = *(void ***)(a1 + 40);
  _os_procinfo_map_clear(v6, 0);
  if (v6)
  {
    v7 = v6[2];
    if (v7)
    {
      do
      {
        v8 = (_QWORD *)*v7;
        operator delete(v7);
        v7 = v8;
      }
      while (v8);
    }
    v9 = *v6;
    *v6 = 0;
    if (v9)
      operator delete(v9);
    MEMORY[0x1D82595C8](v6, 0x10A0C408EF24B1CLL);
  }
  free((void *)a1);
}

uint64_t _catalog_update_earliest_fhbuf_ts(uint64_t result, unint64_t a2)
{
  if (*(_QWORD *)(result + 8) > a2)
    *(_QWORD *)(result + 8) = a2;
  return result;
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

uint64_t __catalog_chunk_parse_uuid_v2_block_invoke(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  _os_trace_uuid_map_insert(*(float **)(*(_QWORD *)(a1 + 32) + 16), a3, a2);
  if (*(_BYTE *)(a1 + 40))
    _chunk_print_uuid(a2, (unsigned __int8 *)a3);
  return 1;
}

uint64_t __catalog_chunk_parse_uuid_legacy_block_invoke(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  _os_trace_uuid_map_insert(*(float **)(*(_QWORD *)(a1 + 32) + 16), a3, a2);
  if (*(_BYTE *)(a1 + 40))
    _chunk_print_uuid(a2, (unsigned __int8 *)a3);
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

void std::__throw_bad_array_new_length[abi:nn180100]()
{
  abort();
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
    JUMPOUT(0x1D82595C8);
  }
  return result;
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

_QWORD *_os_trace_str_map_entry(_QWORD *result, char *a2)
{
  _QWORD *v2;
  int v3;
  void *v4;
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
  _QWORD v16[2];
  unsigned __int8 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = result;
    std::string::basic_string[abi:nn180100]<0>(v16, a2);
    v3 = (char)v17;
    v4 = (void *)v16[0];
    if ((v17 & 0x80u) == 0)
      v5 = v16;
    else
      v5 = (uint64_t *)v16[0];
    if ((v17 & 0x80u) == 0)
      v6 = v17;
    else
      v6 = v16[1];
    v7 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](v5, v6);
    v8 = (int8x8_t)v2[1];
    if (!*(_QWORD *)&v8)
      goto LABEL_25;
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
    v13 = *(unsigned __int8 ***)(*v2 + 8 * v12);
    if (v13)
    {
      for (i = *v13; i; i = *(unsigned __int8 **)i)
      {
        v15 = *((_QWORD *)i + 1);
        if (v9 == v15)
        {
          if (std::equal_to<std::string>::operator()[abi:nn180100](i + 16, (unsigned __int8 *)v16))
            break;
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
            goto LABEL_25;
        }
      }
    }
    else
    {
LABEL_25:
      i = 0;
    }
    if (v3 < 0)
    {
      operator delete(v4);
      if (i)
      {
LABEL_28:
        result = i + 16;
        if ((char)i[39] < 0)
          return (_QWORD *)*result;
        return result;
      }
    }
    else if (i)
    {
      goto LABEL_28;
    }
    return 0;
  }
  return result;
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

BOOL hashkey_compare_uint16(unsigned __int16 a1, unsigned __int16 *a2)
{
  return *a2 == a1;
}

BOOL hashkey_compare_uint64(uint64_t a1, _QWORD *a2)
{
  return *a2 == a1;
}

uint64_t hash_uint16(unsigned __int16 *a1)
{
  return *a1;
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
              qword_1EFE38668 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
              qword_1EFE38698 = result;
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
  qword_1EFE38668 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EFE38698 = result;
  __break(1u);
  return result;
}

uint64_t _timesync_db_openat(int a1, const char *a2)
{
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  DIR *v8;
  DIR *v9;
  uint64_t v10;
  dirent *v11;
  uint64_t v12;
  char *d_name;
  int v14;
  int v15;
  int v16;
  uint64_t result;
  int v18;
  int v19;
  _QWORD v20[2];
  uint64_t (*v21)(_QWORD *, char *);
  void *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = _os_trace_zalloc();
  v5 = openat(a1, a2, 0);
  *(_DWORD *)v4 = v5;
  if (v5 != -1)
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x2000000000;
    v37 = 0;
    v30 = 0;
    v31 = &v30;
    v32 = 0x2000000000;
    v33 = -1;
    v26 = 0;
    v27 = &v26;
    v28 = 0x2000000000;
    v29 = 0;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 0x40000000;
    v21 = ___timesync_tidy_and_count_files_block_invoke;
    v22 = &unk_1E977B250;
    v23 = &v34;
    v24 = &v30;
    v25 = &v26;
    v6 = dup(v5);
    if (v6 == -1)
      goto LABEL_16;
    v7 = v6;
    if (lseek(v6, 0, 0) == -1)
    {
      __error();
      _os_assumes_log();
    }
    v8 = fdopendir(v7);
    if (!v8)
    {
      v14 = *__error();
      if (close(v7) == -1)
      {
        v19 = *__error();
        result = *__error();
        if (v19 == 9)
          goto LABEL_34;
        _os_assumes_log();
      }
      *__error() = v14;
      goto LABEL_19;
    }
    v9 = v8;
    v10 = MEMORY[0x1E0C80978];
LABEL_7:
    while (1)
    {
      v11 = readdir(v9);
      if (!v11)
        break;
      if ((v11->d_type | 8) == 8)
      {
        v12 = 0;
        d_name = v11->d_name;
        while ((d_name[v12] & 0x80000000) == 0
             && (*(_DWORD *)(v10 + 4 * d_name[v12] + 60) & 0x10000) != 0)
        {
          if (++v12 == 16)
          {
            if (strcmp(&v11->d_name[16], ".timesync") || (v21(v20, d_name) & 1) != 0)
              goto LABEL_7;
            goto LABEL_15;
          }
        }
      }
    }
LABEL_15:
    if (closedir(v9) == -1)
    {
LABEL_16:
      __error();
      _os_assumes_log();
    }
LABEL_19:
    v15 = *((_DWORD *)v35 + 6);
    if (v15 >= 1)
    {
      *(_QWORD *)(v4 + 8) = v31[3];
      *(_QWORD *)(v4 + 16) = v27[3];
    }
    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v34, 8);
    if (v15 >= 1 && (_timesync_reset(v4) & 0x80000000) == 0)
      return v4;
    goto LABEL_25;
  }
  __error();
  _os_assumes_log();
LABEL_25:
  v16 = *__error();
  if ((*(_DWORD *)v4 & 0x80000000) != 0 || close(*(_DWORD *)v4) != -1)
    goto LABEL_27;
  v18 = *__error();
  result = *__error();
  if (v18 != 9)
  {
    _os_assumes_log();
LABEL_27:
    free((void *)v4);
    v4 = 0;
    *__error() = v16;
    return v4;
  }
  qword_1EFE38668 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EFE38698 = result;
  __break(1u);
LABEL_34:
  qword_1EFE38668 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EFE38698 = result;
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

uint64_t _timesync_db_open(const char *a1)
{
  return _timesync_db_openat(-2, a1);
}

uint64_t _timesync_db_dup(int *a1)
{
  return _timesync_db_openat(*a1, ".");
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

uint64_t _timesync_mach_timebase(uint64_t result, _QWORD *a2)
{
  *a2 = *(_QWORD *)(result + 80);
  return result;
}

unint64_t _timesync_continuous_to_wall_time(uint64_t a1, _QWORD *a2, unint64_t a3, _QWORD *a4)
{
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int16 *v12;

  if (*a2 != *(_QWORD *)(a1 + 64) || a2[1] != *(_QWORD *)(a1 + 72))
    goto LABEL_8;
  v8 = *(_QWORD *)(a1 + 112);
  v9 = *(_QWORD *)(a1 + 48);
  if (!v9 || *(_WORD *)v9 != 29524)
  {
    if (v8 > a3)
      goto LABEL_7;
LABEL_19:
    if (a4)
    {
      *a4 = *(_QWORD *)(a1 + 128);
      v8 = *(_QWORD *)(a1 + 112);
    }
    return (a3 - v8) * *(unsigned int *)(a1 + 80) / *(unsigned int *)(a1 + 84) + *(_QWORD *)(a1 + 120);
  }
  if (v8 <= a3 && *(_QWORD *)(v9 + 8) > a3)
    goto LABEL_19;
LABEL_7:
  if (v8 <= a3)
    return _timesync_advance_and_calculate(a1, a3, a4);
LABEL_8:
  _timesync_reset(a1);
LABEL_9:
  v10 = *(_QWORD *)(a1 + 64);
  v11 = *(_QWORD *)(a1 + 72);
  if (*a2 == v10 && a2[1] == v11)
    return _timesync_advance_and_calculate(a1, a3, a4);
  while (1)
  {
    v12 = *(unsigned __int16 **)(a1 + 48);
    if (!v12)
      return -1;
    if (*v12 == 48048 && (*((_QWORD *)v12 + 1) != v10 || *((_QWORD *)v12 + 2) != v11))
    {
      _timesync_advance(a1);
      goto LABEL_9;
    }
    _timesync_advance(a1);
  }
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

unint64_t _timesync_wall_time_to_continuous(uint64_t a1, unint64_t a2, unint64_t a3, _OWORD *a4)
{
  unint64_t v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = 0;
  *a4 = *(_OWORD *)_timesync_range_find_startboot(a1, a2, a3, v5);
  return v5[0];
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

_QWORD **_timesync_range_create_impl(uint64_t a1, unint64_t a2, unint64_t a3, int a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t *startboot;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  float *v15;
  uint64_t v16;
  int8x8_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint8x8_t v21;
  unint64_t v22;
  _QWORD *v23;
  _QWORD *i;
  unint64_t v25;
  unint64_t v27;
  _QWORD **v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  BOOL v32;
  _QWORD *v33;
  int8x8_t v34;
  unint64_t v35;
  uint8x8_t v36;
  _QWORD *v37;
  _QWORD *v38;
  unint64_t v39;
  _QWORD *v40;
  unint64_t v41;
  unint64_t v42;
  _QWORD *v43;
  __n128 *j;
  _QWORD v47[2];
  __n128 (*v48)(uint64_t, __n128 *, uint64_t);
  void *v49;
  _QWORD **v50;
  _QWORD v51[2];
  BOOL (*v52)(uint64_t, uint64_t, unint64_t);
  void *v53;
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v7 = _os_trace_zalloc();
  *(_QWORD *)v7 = 0;
  *(_OWORD *)(v7 + 8) = xmmword_1D419B2F0;
  v8 = operator new();
  *(_OWORD *)v8 = 0u;
  *(_OWORD *)(v8 + 16) = 0u;
  *(_DWORD *)(v8 + 32) = 1065353216;
  *(_QWORD *)v7 = v8;
  startboot = (uint64_t *)_timesync_range_find_startboot(a1, a2, a3, (unint64_t *)(v7 + 8));
  v10 = 1;
  _os_trace_uuid_map_insert(*(float **)v7, startboot, 1);
  v11 = *startboot;
  v12 = startboot[1];
  v13 = *(_QWORD *)(a1 + 112) + (a3 - *(_QWORD *)(a1 + 120)) * *(unsigned int *)(a1 + 84) / *(unsigned int *)(a1 + 80);
  *(_QWORD *)(v7 + 16) = v13;
  if (*(_QWORD *)(a1 + 48))
  {
    v10 = 1;
    do
    {
      _timesync_advance(a1);
      v14 = *(_QWORD *)(a1 + 120);
      if (*(_QWORD *)(a1 + 64) != v11 || *(_QWORD *)(a1 + 72) != v12)
      {
        v15 = *(float **)v7;
        if (*(_QWORD *)v7)
          v16 = *((_QWORD *)v15 + 3);
        else
          v16 = 0;
        if ((_os_trace_uuid_map_insert(v15, (uint64_t *)(a1 + 64), v16 + 1) & 1) == 0)
          _os_assumes_log();
        v11 = *(_QWORD *)(a1 + 64);
        v12 = *(_QWORD *)(a1 + 72);
      }
      if (v14 <= a3)
      {
        v17 = *(int8x8_t *)(*(_QWORD *)v7 + 8);
        if (!*(_QWORD *)&v17)
          goto LABEL_33;
        v18 = __ROR8__(v12 + 16, 16);
        v19 = 0x9DDFEA08EB382D69
            * (v18 ^ ((0x9DDFEA08EB382D69 * (v11 ^ v18)) >> 47) ^ (0x9DDFEA08EB382D69 * (v11 ^ v18)));
        v20 = (0x9DDFEA08EB382D69 * (v19 ^ (v19 >> 47))) ^ v12;
        v21 = (uint8x8_t)vcnt_s8(v17);
        v21.i16[0] = vaddlv_u8(v21);
        if (v21.u32[0] > 1uLL)
        {
          v22 = v20;
          if (v20 >= *(_QWORD *)&v17)
            v22 = v20 % *(_QWORD *)&v17;
        }
        else
        {
          v22 = v20 & (*(_QWORD *)&v17 - 1);
        }
        v23 = *(_QWORD **)(**(_QWORD **)v7 + 8 * v22);
        if (v23)
        {
          for (i = (_QWORD *)*v23; i; i = (_QWORD *)*i)
          {
            v25 = i[1];
            if (v20 == v25)
            {
              if (i[2] == v11 && i[3] == v12)
              {
                v17 = (int8x8_t)i[4];
                goto LABEL_33;
              }
            }
            else
            {
              if (v21.u32[0] > 1uLL)
              {
                if (v25 >= *(_QWORD *)&v17)
                  v25 %= *(_QWORD *)&v17;
              }
              else
              {
                v25 &= *(_QWORD *)&v17 - 1;
              }
              if (v25 != v22)
                break;
            }
          }
        }
        v17 = 0;
LABEL_33:
        if (v17)
          v10 = (uint64_t)v17;
        v27 = *(_QWORD *)(a1 + 112)
            + (a3 - *(_QWORD *)(a1 + 120)) * *(unsigned int *)(a1 + 84) / *(unsigned int *)(a1 + 80);
        *(_QWORD *)(v7 + 16) = v27;
        if ((a4 & (v27 > v13)) != 0)
          v13 = v27;
      }
    }
    while (*(_QWORD *)(a1 + 48));
  }
  if (a3 != -1 && a4 && v13 > *(_QWORD *)(v7 + 16))
  {
    fwrite("Wall Clock adjustment detected - results might be strange while using --end\n", 0x4CuLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
    *(_QWORD *)(v7 + 16) = v13;
  }
  v28 = (_QWORD **)_os_trace_realloc();
  v29 = *v28;
  v30 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 0x40000000;
  v52 = ___timesync_range_create_impl_block_invoke;
  v53 = &__block_descriptor_tmp_17;
  v54 = v10;
  v31 = (_QWORD *)v29[2];
  if (v31)
  {
    while (1)
    {
      v32 = v52((uint64_t)v51, (uint64_t)(v31 + 2), v31[4]);
      v33 = (_QWORD *)*v31;
      if (!v32)
        break;
LABEL_71:
      v31 = v33;
      if (!v33)
        goto LABEL_72;
    }
    v34 = (int8x8_t)v29[1];
    v35 = v31[1];
    v36 = (uint8x8_t)vcnt_s8(v34);
    v36.i16[0] = vaddlv_u8(v36);
    if (v36.u32[0] > 1uLL)
    {
      if (v35 >= *(_QWORD *)&v34)
        v35 %= *(_QWORD *)&v34;
    }
    else
    {
      v35 &= *(_QWORD *)&v34 - 1;
    }
    v37 = *(_QWORD **)(*v29 + 8 * v35);
    do
    {
      v38 = v37;
      v37 = (_QWORD *)*v37;
    }
    while (v37 != v31);
    if (v38 == v29 + 2)
      goto LABEL_77;
    v39 = v38[1];
    if (v36.u32[0] > 1uLL)
    {
      if (v39 >= *(_QWORD *)&v34)
        v39 %= *(_QWORD *)&v34;
    }
    else
    {
      v39 &= *(_QWORD *)&v34 - 1;
    }
    v40 = (_QWORD *)*v31;
    if (v39 != v35)
    {
LABEL_77:
      if (v33)
      {
        v41 = v33[1];
        if (v36.u32[0] > 1uLL)
        {
          if (v41 >= *(_QWORD *)&v34)
            v41 %= *(_QWORD *)&v34;
        }
        else
        {
          v41 &= *(_QWORD *)&v34 - 1;
        }
        v40 = (_QWORD *)*v31;
        if (v41 == v35)
          goto LABEL_64;
      }
      *(_QWORD *)(*v29 + 8 * v35) = 0;
      v40 = (_QWORD *)*v31;
    }
    if (!v40)
    {
LABEL_70:
      *v38 = v40;
      --v29[3];
      operator delete(v31);
      goto LABEL_71;
    }
LABEL_64:
    v42 = v40[1];
    if (v36.u32[0] > 1uLL)
    {
      if (v42 >= *(_QWORD *)&v34)
        v42 %= *(_QWORD *)&v34;
    }
    else
    {
      v42 &= *(_QWORD *)&v34 - 1;
    }
    if (v42 != v35)
    {
      *(_QWORD *)(*v29 + 8 * v42) = v38;
      v40 = (_QWORD *)*v31;
    }
    goto LABEL_70;
  }
LABEL_72:
  v43 = *v28;
  v47[0] = v30;
  v47[1] = 0x40000000;
  v48 = ___timesync_range_create_impl_block_invoke_2;
  v49 = &__block_descriptor_tmp_19;
  v50 = v28;
  for (j = (__n128 *)v43[2]; j; j = (__n128 *)j->n128_u64[0])
    v48((uint64_t)v47, j + 1, j[2].n128_i64[0]);
  _timesync_reset(a1);
  return v28;
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
  *(_OWORD *)v3 = xmmword_1D419B1A8;
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
    qword_1EFE38668 = (uint64_t)"BUG IN LIBTRACE: Invalid type";
    qword_1EFE38698 = a2;
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
    qword_1EFE38668 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: Path buffer is too small";
    qword_1EFE38698 = __size;
    __break(1u);
    goto LABEL_17;
  }
  __str[(int)result] = 47;
  v9 = &__str[v8];
  do
  {
    *v9 = a0123456789abcd[(unint64_t)*(unsigned __int8 *)(v6 + v7) >> 4];
    v9[1] = a0123456789abcd[*(_BYTE *)(v6 + v7) & 0xF];
    v9 += 2;
    ++v7;
  }
  while (v7 != 16);
  *v9 = 0;
  return result;
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
LABEL_9:
    _os_trace_uuiddb_get_pathsuffix(a2, a3, &__b[v6], 1024 - v6);
    return access(__b, 0) == 0;
  }
  if (_os_trace_uuiddb_path_sandbox_can_read_data_once != -1)
    dispatch_once(&_os_trace_uuiddb_path_sandbox_can_read_data_once, &__block_literal_global_94);
  if (_os_trace_uuiddb_path_sandbox_can_read_data_can_read)
  {
    memset(__b, 170, sizeof(__b));
    if (_os_trace_shared_paths_init_once != -1)
      dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
    v6 = snprintf(__b, 0x400uLL, "%s/", (const char *)_os_trace_uuidtext_path);
    goto LABEL_9;
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
                v25 = v24 > 0x36 ? -1 : dword_1D419B1B8[v24];
                v26 = v12->fts_name[1] - 48;
                v27 = v26 > 0x36 ? -1 : dword_1D419B1B8[v26];
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
            qword_1EFE38668 = (uint64_t)"BUG IN LIBTRACE: unexpected fts entry";
            qword_1EFE38698 = fts_info;
            __break(1u);
            return result;
        }
        while (1)
        {
          v19 = v12->fts_name[v17] - 48;
          v20 = v19 > 0x36 ? -1 : dword_1D419B1B8[v19];
          v21 = v12->fts_name[v17 + 1] - 48;
          v22 = v21 > 0x36 ? -1 : dword_1D419B1B8[v21];
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

uint64_t _os_trace_uuiddb_get_dsc_map_fd(uint64_t a1, __n128 *a2)
{
  return _os_trace_uuiddb_get_dsc_map_impl(a1, 0, a2, 1);
}

uint64_t _os_trace_uuiddb_get_dsc_map_impl(uint64_t a1, char *a2, __n128 *a3, int a4)
{
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  dispatch_once_t *v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  dispatch_once_t *v16;
  unint64_t v17;
  char *v18;
  _QWORD *v19;
  int v20;
  unint64_t v21;
  int v22;
  uint64_t result;
  dispatch_once_t *v24;
  unint64_t v25;
  char *v26;
  int v27;

  v7 = 0;
  v8 = 0x1EFE38000uLL;
  v9 = 0x1EFE38000uLL;
  v10 = 0x1EFE38000uLL;
  v11 = &_os_trace_shared_paths_init_once;
  while (1)
  {
    v12 = *(_QWORD *)(v8 + 1784);
    if (v12)
    {
      v13 = *(_QWORD **)(v8 + 1784);
      while (v13[4] != a3->n128_u64[0] || v13[5] != a3->n128_u64[1])
      {
        v13 = (_QWORD *)*v13;
        if (!v13)
          goto LABEL_7;
      }
      if (v7)
        _os_trace_uuiddb_dsc_map_destroy((uint64_t)v7);
      return (uint64_t)v13;
    }
LABEL_7:
    if (!a4)
      return 0;
    if (!v7)
      break;
LABEL_19:
    *v7 = v12;
    while (1)
    {
      v21 = __ldxr((unint64_t *)&_os_trace_uuiddb_get_dsc_map_impl__dsc_map_head);
      if (v21 != v12)
        break;
      if (!__stlxr((unint64_t)v7, (unint64_t *)&_os_trace_uuiddb_get_dsc_map_impl__dsc_map_head))
        return (uint64_t)v7;
    }
    __clrex();
  }
  v27 = a4;
  if ((_DWORD)a1 == -1)
  {
    if (!a2)
    {
      if (*(_QWORD *)(v9 + 1720) != -1)
      {
        v24 = v11;
        v25 = v9;
        dispatch_once(v11, &__block_literal_global_55);
        v11 = v24;
        v9 = v25;
      }
      a2 = *(char **)(v10 + 1712);
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
      return (uint64_t)v7;
    goto LABEL_19;
  }
  v22 = *__error();
  result = *__error();
  if (v22 != 9)
  {
    _os_assumes_log();
    a2 = v26;
    goto LABEL_18;
  }
  qword_1EFE38668 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EFE38698 = result;
  __break(1u);
  return result;
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

void _os_trace_uuiddb_dsc_run_block_on_map(char *a1, __n128 *a2, uint64_t a3)
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t dsc_map_impl;
  BOOL v9;
  uint64_t v10;
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
    (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, dsc_map_impl);
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
      qword_1EFE38668 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_1EFE38698 = v12;
      __break(1u);
      return;
    }
    _os_assumes_log();
  }
LABEL_10:
  if (!v9)
    _os_trace_uuiddb_dsc_map_destroy(dsc_map_impl);
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
    qword_1EFE38668 = (uint64_t)"BUG IN LIBTRACE: failed to create queue target from subsystem";
    qword_1EFE38698 = v1;
    __break(1u);
LABEL_10:
    result = __error();
    v2 = *result;
    qword_1EFE38668 = (uint64_t)"BUG IN LIBTRACE: failed to create log file path";
    qword_1EFE38698 = v2;
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
    qword_1EFE38668 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_1EFE38698 = result;
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

id makeComponents(void *a1)
{
  id v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  OSLogMessageComponent *v8;
  void *v9;

  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v1, "decomposedMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "state"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  }
  else
  {
    v5 = objc_msgSend(v3, "placeholderCount");
    if (v5 != -1)
    {
      v6 = 0;
      v7 = v5 + 1;
      do
      {
        v8 = -[OSLogMessageComponent initWithDecomposedMessage:atIndex:]([OSLogMessageComponent alloc], "initWithDecomposedMessage:atIndex:", v3, v6);
        objc_msgSend(v2, "addObject:", v8);

        ++v6;
      }
      while (v7 != v6);
    }
    v4 = v2;
  }
  v9 = v4;

  return v9;
}

void sub_1D4199D2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id convertEventProxyToEntry(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  __objc2_class **v4;

  v1 = a1;
  v2 = objc_msgSend(v1, "type");
  v3 = 0;
  if (v2 <= 1023)
  {
    if ((unint64_t)(v2 - 513) < 3)
    {
      v4 = off_1E977ABC8;
      goto LABEL_13;
    }
  }
  else if (v2 > 1535)
  {
    if (v2 == 1536)
    {
      v4 = &off_1E977ABE0;
      goto LABEL_13;
    }
    if (v2 == 2560)
    {
      v4 = off_1E977ABC0;
      goto LABEL_13;
    }
  }
  else
  {
    if (v2 == 1024)
    {
      v4 = off_1E977ABD8;
      goto LABEL_13;
    }
    if (v2 == 1280)
    {
      v4 = off_1E977ABD0;
LABEL_13:
      v3 = (void *)objc_msgSend(objc_alloc(*v4), "initWithEventProxy:", v1);
    }
  }

  return v3;
}

void sub_1D419A22C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D419A364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

uint64_t MKBDeviceFormattedForContentProtection()
{
  return MEMORY[0x1E0D4E478]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1E0D4E4A0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
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
  off_1E977AC50(__p);
}

uint64_t operator delete()
{
  return off_1E977AC58();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E977AC60(__sz);
}

uint64_t operator new()
{
  return off_1E977AC68();
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t __memset_chk()
{
  return MEMORY[0x1E0C80B78]();
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_trace_calloc()
{
  return MEMORY[0x1E0C810F8]();
}

uint64_t _os_trace_mmap_at()
{
  return MEMORY[0x1E0C81148]();
}

uint64_t _os_trace_prefsdir_path()
{
  return MEMORY[0x1E0C81158]();
}

uint64_t _os_trace_realloc()
{
  return MEMORY[0x1E0C81168]();
}

uint64_t _os_trace_write()
{
  return MEMORY[0x1E0C81180]();
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

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1E0C81608](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1E0C82698](a1);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
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

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x1E0C82E80](queue, key, context, destructor);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

int dup(int a1)
{
  return MEMORY[0x1E0C83078](*(_QWORD *)&a1);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1E0C832E0](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

DIR *__cdecl fdopendir(int a1)
{
  return (DIR *)MEMORY[0x1E0C83320](*(_QWORD *)&a1);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
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

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C83778]();
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1E0C83BB0](a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x1E0C844A0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1E0C849D8]();
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

int putchar(int a1)
{
  return MEMORY[0x1E0C84F50](*(_QWORD *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1E0C84F60](a1);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1E0C85008](a1);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1E0C85558](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85610](__s1, __s2);
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

uid_t xpc_connection_get_euid(xpc_connection_t connection)
{
  return MEMORY[0x1E0C85FF0](connection);
}

