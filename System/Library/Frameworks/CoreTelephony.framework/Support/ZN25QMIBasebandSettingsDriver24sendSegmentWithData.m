@implementation ZN25QMIBasebandSettingsDriver24sendSegmentWithData

_DWORD *___ZN25QMIBasebandSettingsDriver24sendSegmentWithData_syncEN10subscriber7SimSlotEN3bsp11QMIFileTypeENSt3__112basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEENS4_10shared_ptrINS4_13basic_istreamIcS7_EEEEttRNS4_6vectorIhN3ctu21malloc_zone_allocatorIhEEEEhNSG_2cf11CFSharedRefIK8__CFDataEEb_block_invoke(_DWORD *result, uint64_t a2)
{
  char *v3;
  _QWORD *v4;
  char **v5;
  char *v6;
  char *v7;
  size_t v8;
  unint64_t v9;
  uint64_t v10;
  size_t v11;
  _BYTE *v12;
  size_t v13;
  char *v14;
  char *v15;

  *(_DWORD *)a2 = result[10];
  *(_BYTE *)(a2 + 4) |= 2 * *((_BYTE *)result + 48);
  *(_WORD *)(a2 + 6) = *((_WORD *)result + 22);
  *(_WORD *)(a2 + 8) = *((_WORD *)result + 23);
  v4 = (_QWORD *)(a2 + 16);
  v3 = *(char **)(a2 + 16);
  v5 = (char **)*((_QWORD *)result + 4);
  v6 = *v5;
  v7 = v5[1];
  v8 = v7 - *v5;
  v9 = *(_QWORD *)(a2 + 32);
  if (v9 - (unint64_t)v3 < v8)
  {
    if (v3)
    {
      *(_QWORD *)(a2 + 24) = v3;
      operator delete(v3);
      v9 = 0;
      *v4 = 0;
      v4[1] = 0;
      v4[2] = 0;
    }
    if ((v8 & 0x8000000000000000) != 0)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v10 = 2 * v9;
    if (2 * v9 <= v8)
      v10 = v8;
    if (v9 >= 0x3FFFFFFFFFFFFFFFLL)
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = std::vector<unsigned char>::__vallocate[abi:ne180100](v4, v11);
    v3 = *(char **)(a2 + 24);
    goto LABEL_17;
  }
  v12 = *(_BYTE **)(a2 + 24);
  v13 = v12 - v3;
  if (v12 - v3 >= v8)
  {
LABEL_17:
    if (v7 != v6)
      result = memmove(v3, v6, v8);
    v15 = &v3[v8];
    goto LABEL_20;
  }
  v14 = &v6[v13];
  if (v12 != v3)
  {
    result = memmove(*(void **)(a2 + 16), v6, v13);
    v3 = *(char **)(a2 + 24);
  }
  if (v7 != v14)
    result = memmove(v3, v14, v7 - v14);
  v15 = &v3[v7 - v14];
LABEL_20:
  *(_QWORD *)(a2 + 24) = v15;
  return result;
}

_QWORD *___ZN25QMIBasebandSettingsDriver24sendSegmentWithData_syncEN10subscriber7SimSlotEN3bsp11QMIFileTypeENSt3__112basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEENS4_10shared_ptrINS4_13basic_istreamIcS7_EEEEttRNS4_6vectorIhN3ctu21malloc_zone_allocatorIhEEEEhNSG_2cf11CFSharedRefIK8__CFDataEEb_block_invoke_76(uint64_t a1, _QWORD *a2)
{
  char *BytePtr;

  BytePtr = (char *)CFDataGetBytePtr(*(CFDataRef *)(a1 + 32));
  return std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(a2, BytePtr, &BytePtr[*(_QWORD *)(a1 + 40)], *(_QWORD *)(a1 + 40));
}

@end
