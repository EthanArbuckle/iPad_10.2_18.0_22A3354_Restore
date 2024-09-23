@implementation ZN10TRawSymbolI9Pointer64E21

unsigned int **___ZN10TRawSymbolI9Pointer64E21_resolve_mangled_nameINS1_21PersistentMangledNameEEEPKcT__block_invoke(unsigned int **result, const char *a2)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int **v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  int is_objc_method_internal;
  int v10;
  size_t v11;
  _BYTE *v12;
  int v13;

  v2 = result[5];
  v3 = v2 + 7;
  v4 = atomic_load(v2 + 7);
  if ((v4 & 0x400000) == 0)
  {
    v5 = result;
    v6 = atomic_load(v3);
    v7 = atomic_load(v3);
    if ((v6 & 0x80000) != 0)
    {
      if ((v7 & 2) != 0)
      {
        *((_QWORD *)v2 + 5) = DemanglingUtilities::create_dyld_stub_name(*((DemanglingUtilities **)v2 + 5), a2);
        v13 = 12582912;
        return CSCppBitLock::set_bits(*(unsigned int ***)(*((_QWORD *)v5[4] + 1) + 24), v13);
      }
    }
    else if ((v7 & 0x100000) != 0 || (v8 = atomic_load(v2 + 7), (v8 & 0x200000) != 0))
    {
      is_objc_method_internal = TRawSymbol<Pointer32>::is_objc_method_internal((int)result[5], *((char **)v2 + 5));
      v10 = is_objc_method_internal;
      if ((is_objc_method_internal & 4) != 0)
      {
        v13 = is_objc_method_internal | 0x400000;
      }
      else
      {
        v11 = strlen(*((const char **)v2 + 5));
        v12 = malloc_type_malloc(v11 + 2, 0x6A22D941uLL);
        *v12 = 95;
        strcpy(v12 + 1, *((const char **)v2 + 5));
        *((_QWORD *)v2 + 5) = v12;
        v13 = v10 | 0xC00000;
      }
      return CSCppBitLock::set_bits(*(unsigned int ***)(*((_QWORD *)v5[4] + 1) + 24), v13);
    }
    v13 = 0x400000;
    return CSCppBitLock::set_bits(*(unsigned int ***)(*((_QWORD *)v5[4] + 1) + 24), v13);
  }
  return result;
}

CSCppBitLock *___ZN10TRawSymbolI9Pointer64E21_resolve_mangled_nameINS1_21PersistentMangledNameEEEPKcT__block_invoke_2(uint64_t a1)
{
  CSCppBitLock *result;

  result = *(CSCppBitLock **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (result)
  {
    CSCppBitLock::~CSCppBitLock(result);
    result = (CSCppBitLock *)MEMORY[0x1B5E36940]();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  return result;
}

unsigned int **___ZN10TRawSymbolI9Pointer64E21_resolve_mangled_nameINS1_20EphemeralMangledNameEEEPKcT__block_invoke(unsigned int **result)
{
  unsigned int *v1;
  unsigned int *v2;
  unsigned int v3;
  unsigned int **v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  const char *v9;
  int is_objc_method_internal;

  v1 = result[5];
  v2 = v1 + 7;
  v3 = atomic_load(v1 + 7);
  if ((v3 & 0x400000) == 0)
  {
    v4 = result;
    v5 = atomic_load(v2);
    v6 = atomic_load(v2);
    if ((v5 & 0x80000) != 0)
    {
      v8 = 0x400000;
      if ((v6 & 2) == 0)
        return CSCppBitLock::set_bits(*(unsigned int ***)(*((_QWORD *)v4[4] + 1) + 24), v8);
      v9 = "DYLD-STUB$$";
    }
    else
    {
      if ((v6 & 0x100000) == 0)
      {
        v7 = atomic_load(v1 + 7);
        if ((v7 & 0x200000) == 0)
        {
          v8 = 0x400000;
          return CSCppBitLock::set_bits(*(unsigned int ***)(*((_QWORD *)v4[4] + 1) + 24), v8);
        }
      }
      is_objc_method_internal = TRawSymbol<Pointer32>::is_objc_method_internal((int)result[5], *((char **)v1 + 5));
      v8 = is_objc_method_internal | 0x400000;
      if ((is_objc_method_internal & 4) != 0)
        return CSCppBitLock::set_bits(*(unsigned int ***)(*((_QWORD *)v4[4] + 1) + 24), v8);
      v9 = "_";
    }
    *((_QWORD *)v1 + 12) = v9;
    return CSCppBitLock::set_bits(*(unsigned int ***)(*((_QWORD *)v4[4] + 1) + 24), v8);
  }
  return result;
}

CSCppBitLock *___ZN10TRawSymbolI9Pointer64E21_resolve_mangled_nameINS1_20EphemeralMangledNameEEEPKcT__block_invoke_2(uint64_t a1)
{
  CSCppBitLock *result;

  result = *(CSCppBitLock **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (result)
  {
    CSCppBitLock::~CSCppBitLock(result);
    result = (CSCppBitLock *)MEMORY[0x1B5E36940]();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  return result;
}

@end
