@implementation ZN10TRawSymbolI9Pointer64E13

unsigned int **___ZN10TRawSymbolI9Pointer64E13_resolve_nameEPPcPm_block_invoke(unsigned int **result, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  unsigned int *v4;
  unsigned int v5;
  unsigned int **v6;
  __int16 v7;
  char *v8;
  uint64_t v9;
  unsigned int *v10;
  BOOL v11;
  __int16 v12;
  char v13;
  char *dyld_stub_name;

  v4 = result[5];
  v5 = atomic_load(v4 + 7);
  if ((v5 & 0x20000) == 0)
  {
    v6 = result;
    v7 = atomic_load(v4 + 7);
    if (v7 < 0)
    {
      LODWORD(v9) = 0x20000;
      return CSCppBitLock::set_bits(*(unsigned int ***)(*((_QWORD *)v6[4] + 1) + 24), v9);
    }
    v8 = DemanglingUtilities::demangle_with_reusable_buffer(*((char **)v4 + 4), (char *)result[6], (char **)result[7], a4);
    if (v8)
    {
      v9 = 0x20000;
      if (!v6[6])
      {
        v10 = v6[7];
        v11 = v10 != 0;
        if (v10)
          v9 = 0x20000;
        else
          v9 = 393216;
LABEL_15:
        *((_QWORD *)v4 + 4) = v8;
        v13 = atomic_load(v4 + 7);
        if ((v13 & 2) != 0)
        {
          dyld_stub_name = DemanglingUtilities::create_dyld_stub_name(*((DemanglingUtilities **)v4 + 4), (const char *)v9);
          if (!v11)
            free(*((void **)v4 + 4));
          *((_QWORD *)v4 + 4) = dyld_stub_name;
          LODWORD(v9) = 393216;
        }
        return CSCppBitLock::set_bits(*(unsigned int ***)(*((_QWORD *)v6[4] + 1) + 24), v9);
      }
    }
    else
    {
      v8 = (char *)*((_QWORD *)v4 + 4);
      v12 = atomic_load(v4 + 7);
      if ((v12 & 0x4000) != 0 && *v8 == 95)
        ++v8;
      v9 = 0x20000;
    }
    v11 = 1;
    goto LABEL_15;
  }
  return result;
}

CSCppBitLock *___ZN10TRawSymbolI9Pointer64E13_resolve_nameEPPcPm_block_invoke_2(uint64_t a1)
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
