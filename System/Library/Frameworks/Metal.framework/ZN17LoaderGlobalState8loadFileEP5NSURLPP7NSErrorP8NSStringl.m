@implementation ZN17LoaderGlobalState8loadFileEP5NSURLPP7NSErrorP8NSStringl

_QWORD *___ZN17LoaderGlobalState8loadFileEP5NSURLPP7NSErrorP8NSStringl_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *result;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v2 = a1[7];
  v3 = (_QWORD *)(a1[6] + 16);
  v12 = *(_DWORD *)v2;
  v13 = *(_QWORD *)(v2 + 8);
  result = std::__hash_table<std::__hash_value_type<FileIdentifier,MTLLoadedFile *>,std::__unordered_map_hasher<FileIdentifier,std::__hash_value_type<FileIdentifier,MTLLoadedFile *>,FileIdentifier::Hash,std::equal_to<FileIdentifier>,true>,std::__unordered_map_equal<FileIdentifier,std::__hash_value_type<FileIdentifier,MTLLoadedFile *>,std::equal_to<FileIdentifier>,FileIdentifier::Hash,true>,std::allocator<std::__hash_value_type<FileIdentifier,MTLLoadedFile *>>>::find<FileIdentifier>(v3, &v12);
  if (result)
  {
    v5 = result;
    v6 = (_QWORD *)result[4];
    v7 = v6[3];
    if (v7 != *(_QWORD *)(a1[7] + 48))
      goto LABEL_13;
    result = (_QWORD *)time(0);
    v8 = (unint64_t)result - v7;
    if ((uint64_t)result - v7 < 0)
      v8 = v7 - (_QWORD)result;
    if (v8 >= 2)
    {

      result = v6;
      *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40) = result;
    }
    else
    {
LABEL_13:
      if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
        v5[4] = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40);
    }
  }
  else if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    v9 = a1[7];
    v10 = *(_QWORD *)(a1[4] + 8);
    v12 = *(_DWORD *)v9;
    v11 = *(_QWORD *)(v10 + 40);
    v13 = *(_QWORD *)(v9 + 8);
    v14 = v11;
    return std::__hash_table<std::__hash_value_type<FileIdentifier,MTLLoadedFile *>,std::__unordered_map_hasher<FileIdentifier,std::__hash_value_type<FileIdentifier,MTLLoadedFile *>,FileIdentifier::Hash,std::equal_to<FileIdentifier>,true>,std::__unordered_map_equal<FileIdentifier,std::__hash_value_type<FileIdentifier,MTLLoadedFile *>,std::equal_to<FileIdentifier>,FileIdentifier::Hash,true>,std::allocator<std::__hash_value_type<FileIdentifier,MTLLoadedFile *>>>::__emplace_unique_key_args<FileIdentifier,std::pair<FileIdentifier,MTLLoadedFile *>>((uint64_t)v3, &v12, (uint64_t)&v12);
  }
  return result;
}

@end
