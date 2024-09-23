@implementation ZL14fast

const UInt8 *___ZL14fast_kext_info17CSCppArchitectureNSt3__113unordered_mapINS0_12basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEyNS0_4hashIS7_EENS0_8equal_toIS7_EENS5_INS0_4pairIKS7_yEEEEEEjPKc_block_invoke_75(_QWORD *a1, __int128 *a2)
{
  const UInt8 *result;
  uint64_t v5;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  result = (const UInt8 *)a1[5];
  if (result)
  {
    v5 = *(_QWORD *)a2;
    result = CFDataGetBytePtr((CFDataRef)result);
    if (*(_QWORD *)(v5 + 16) == *(_QWORD *)result && *(_QWORD *)(v5 + 24) == *((_QWORD *)result + 1))
    {
      v7 = *(_QWORD *)a2;
      v8 = *(_QWORD **)(*(_QWORD *)a2 + 32);
      v9 = *(_QWORD *)(*(_QWORD *)a2 + 40) - (_QWORD)v8;
      if (v9)
      {
        v10 = v9 >> 5;
        if (v10 <= 1)
          v10 = 1;
        do
        {
          *v8 += a1[6];
          v8 += 4;
          --v10;
        }
        while (v10);
      }
      v12 = v7 + 56;
      v11 = *(_QWORD **)(v7 + 56);
      v13 = *(_QWORD *)(v12 + 8) - (_QWORD)v11;
      if (v13)
      {
        v14 = v13 / 24;
        if (v14 <= 1)
          v14 = 1;
        do
        {
          *v11 += a1[6];
          v11 += 3;
          --v14;
        }
        while (v14);
      }
      return (const UInt8 *)std::vector<std::shared_ptr<CSCppSymbolOwner>>::push_back[abi:ne180100]((char **)(*(_QWORD *)(a1[4] + 8) + 40), a2);
    }
  }
  return result;
}

@end
