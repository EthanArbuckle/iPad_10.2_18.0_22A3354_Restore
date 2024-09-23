@implementation ZN7CoreNLP15CompositeTagger25getAttributedTokenAtIndexE15NLTokenizerUnitl

uint64_t **___ZN7CoreNLP15CompositeTagger25getAttributedTokenAtIndexE15NLTokenizerUnitl_block_invoke(uint64_t a1, __int128 *a2)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  CoreNLP::NLAttributedToken *v6;
  int *v7;
  uint64_t **result;
  int v9;
  unsigned int v10;
  int v11;
  int v12;
  int v13;
  int *v14;
  CFRange v15;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = std::__list_imp<CoreNLP::NLAttributedToken>::__create_node[abi:ne180100]<NLToken &>(v3 + 872, 0, 0, a2);
  v4[1] = v3 + 872;
  v5 = *(_QWORD *)(v3 + 872);
  *v4 = v5;
  *(_QWORD *)(v5 + 8) = v4;
  *(_QWORD *)(v3 + 872) = v4;
  ++*(_QWORD *)(v3 + 888);
  CoreNLP::extractTokenExtendedAttributes(*(_QWORD *)(*(_QWORD *)(v3 + 16) + 8), (const __CFString *)(v4 + 2), v6);
  v13 = 0;
  v15.location = *(_QWORD *)(v3 + 744);
  v15.length = (CFIndex)(v4 + 2);
  result = (uint64_t **)CoreNLP::quoteStatusForToken(*(CFStringRef *)(*(_QWORD *)(v3 + 16) + 8), *(const __CFString **)(v3 + 736), v15, (CoreNLP::NLAttributedToken *)&v13, v7);
  if ((_DWORD)result)
  {
    v9 = v13;
    v12 = 1;
    v14 = &v12;
    result = std::__tree<std::__value_type<CoreNLP::NLTagSchemeType,std::pair<int,double>>,std::__map_value_compare<CoreNLP::NLTagSchemeType,std::__value_type<CoreNLP::NLTagSchemeType,std::pair<int,double>>,std::less<CoreNLP::NLTagSchemeType>,true>,std::allocator<std::__value_type<CoreNLP::NLTagSchemeType,std::pair<int,double>>>>::__emplace_unique_key_args<CoreNLP::NLTagSchemeType,std::piecewise_construct_t const&,std::tuple<CoreNLP::NLTagSchemeType&&>,std::tuple<>>((uint64_t **)v4 + 5, &v12, (uint64_t)&std::piecewise_construct, &v14);
    *((_DWORD *)result + 10) = v9;
  }
  if (*(_BYTE *)(a1 + 40))
  {
    v10 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(v3 + 944) + 120))(*(_QWORD *)(v3 + 944));
    if (v10 > 7)
      v11 = 1;
    else
      v11 = dword_191D422D4[v10];
    v12 = 6;
    v14 = &v12;
    result = std::__tree<std::__value_type<CoreNLP::NLTagSchemeType,std::pair<int,double>>,std::__map_value_compare<CoreNLP::NLTagSchemeType,std::__value_type<CoreNLP::NLTagSchemeType,std::pair<int,double>>,std::less<CoreNLP::NLTagSchemeType>,true>,std::allocator<std::__value_type<CoreNLP::NLTagSchemeType,std::pair<int,double>>>>::__emplace_unique_key_args<CoreNLP::NLTagSchemeType,std::piecewise_construct_t const&,std::tuple<CoreNLP::NLTagSchemeType&&>,std::tuple<>>((uint64_t **)v4 + 5, &v12, (uint64_t)&std::piecewise_construct, &v14);
    *((_DWORD *)result + 10) = v11;
  }
  return result;
}

_QWORD *___ZN7CoreNLP15CompositeTagger25getAttributedTokenAtIndexE15NLTokenizerUnitl_block_invoke_2(uint64_t a1, __int128 *a2)
{
  uint64_t v2;
  _QWORD *result;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  result = std::__list_imp<CoreNLP::NLAttributedToken>::__create_node[abi:ne180100]<NLToken &>(v2 + 848, 0, 0, a2);
  v4 = *(_QWORD *)(v2 + 848);
  *result = v4;
  result[1] = v2 + 848;
  *(_QWORD *)(v4 + 8) = result;
  *(_QWORD *)(v2 + 848) = result;
  ++*(_QWORD *)(v2 + 864);
  return result;
}

@end
