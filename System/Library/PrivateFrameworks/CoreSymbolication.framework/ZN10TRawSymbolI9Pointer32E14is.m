@implementation ZN10TRawSymbolI9Pointer32E14is

unsigned int **___ZN10TRawSymbolI9Pointer32E14is_objc_methodEv_block_invoke(uint64_t a1)
{
  unsigned int **result;
  unsigned int v3;
  int is_objc_method_internal;

  result = *(unsigned int ***)(a1 + 40);
  v3 = atomic_load((unsigned int *)result + 5);
  if ((v3 & 0x1000000) == 0)
  {
    is_objc_method_internal = TRawSymbol<Pointer32>::is_objc_method_internal((int)result, *(char **)(a1 + 48));
    return CSCppBitLock::set_bits(*(unsigned int ***)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), is_objc_method_internal);
  }
  return result;
}

CSCppBitLock *___ZN10TRawSymbolI9Pointer32E14is_objc_methodEv_block_invoke_2(uint64_t a1)
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
