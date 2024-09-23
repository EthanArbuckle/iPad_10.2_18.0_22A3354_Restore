@implementation ZN7CoreNLP24SingletonResourceManagerINSt3

_QWORD *___ZN7CoreNLP24SingletonResourceManagerINSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS_12ReadOnlyFileIhEEE18getPersistentCacheEv_block_invoke()
{
  _QWORD *result;

  result = (_QWORD *)operator new();
  result[2] = 0;
  result[1] = 0;
  *result = result + 1;
  CoreNLP::SingletonResourceManager<std::string,CoreNLP::ReadOnlyFile<unsigned char>>::getPersistentCache(void)::cache = (uint64_t)result;
  return result;
}

_QWORD *___ZN7CoreNLP24SingletonResourceManagerINSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS_12ReadOnlyFileItEEE18getPersistentCacheEv_block_invoke()
{
  _QWORD *result;

  result = (_QWORD *)operator new();
  result[2] = 0;
  result[1] = 0;
  *result = result + 1;
  CoreNLP::SingletonResourceManager<std::string,CoreNLP::ReadOnlyFile<unsigned short>>::getPersistentCache(void)::cache = (uint64_t)result;
  return result;
}

_QWORD *___ZN7CoreNLP24SingletonResourceManagerINSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS_12ReadOnlyFileIcEEE8getCacheEv_block_invoke()
{
  _QWORD *result;

  result = (_QWORD *)operator new();
  result[2] = 0;
  result[1] = 0;
  *result = result + 1;
  CoreNLP::SingletonResourceManager<std::string,CoreNLP::ReadOnlyFile<char>>::getCache(void)::cache = (uint64_t)result;
  return result;
}

uint64_t *___ZN7CoreNLP24SingletonResourceManagerINSt3__14pairINS_15NLTagSchemeTypeE12NLLanguageIDEENS_12ReadOnlyFileIcEEE21getPersistentResourceERKS5_U13block_pointerFPS7_vE_block_invoke(uint64_t a1)
{
  uint64_t **v2;
  uint64_t *result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t *v6;

  if (CoreNLP::SingletonResourceManager<std::pair<CoreNLP::NLTagSchemeType,NLLanguageID>,CoreNLP::ReadOnlyFile<char>>::getPersistentCache(void)::onceToken != -1)
    dispatch_once(&CoreNLP::SingletonResourceManager<std::pair<CoreNLP::NLTagSchemeType,NLLanguageID>,CoreNLP::ReadOnlyFile<char>>::getPersistentCache(void)::onceToken, &__block_literal_global_97);
  v2 = (uint64_t **)CoreNLP::SingletonResourceManager<std::pair<CoreNLP::NLTagSchemeType,NLLanguageID>,CoreNLP::ReadOnlyFile<char>>::getPersistentCache(void)::cache;
  result = std::__tree<std::__value_type<std::pair<CoreNLP::NLTagSchemeType,NLLanguageID>,std::pair<std::string,std::shared_ptr<CoreNLP::ReadOnlyFile<char>>>>,std::__map_value_compare<std::pair<CoreNLP::NLTagSchemeType,NLLanguageID>,std::__value_type<std::pair<CoreNLP::NLTagSchemeType,NLLanguageID>,std::pair<std::string,std::shared_ptr<CoreNLP::ReadOnlyFile<char>>>>,std::less<std::pair<CoreNLP::NLTagSchemeType,NLLanguageID>>,true>,std::allocator<std::__value_type<std::pair<CoreNLP::NLTagSchemeType,NLLanguageID>,std::pair<std::string,std::shared_ptr<CoreNLP::ReadOnlyFile<char>>>>>>::find<std::pair<CoreNLP::NLTagSchemeType,NLLanguageID>>((uint64_t)CoreNLP::SingletonResourceManager<std::pair<CoreNLP::NLTagSchemeType,NLLanguageID>,CoreNLP::ReadOnlyFile<char>>::getPersistentCache(void)::cache, *(int **)(a1 + 48));
  if (v2 + 1 == (uint64_t **)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v4 = *(uint64_t **)(a1 + 48);
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v6 = v4;
    result = std::__tree<std::__value_type<std::pair<CoreNLP::NLTagSchemeType,NLLanguageID>,CoreNLP::ReadOnlyFile<char> *>,std::__map_value_compare<std::pair<CoreNLP::NLTagSchemeType,NLLanguageID>,std::__value_type<std::pair<CoreNLP::NLTagSchemeType,NLLanguageID>,CoreNLP::ReadOnlyFile<char> *>,std::less<std::pair<CoreNLP::NLTagSchemeType,NLLanguageID>>,true>,std::allocator<std::__value_type<std::pair<CoreNLP::NLTagSchemeType,NLLanguageID>,CoreNLP::ReadOnlyFile<char> *>>>::__emplace_unique_key_args<std::pair<CoreNLP::NLTagSchemeType,NLLanguageID>,std::piecewise_construct_t const&,std::tuple<std::pair<CoreNLP::NLTagSchemeType,NLLanguageID> const&>,std::tuple<>>(v2, (int *)v4, (uint64_t)&std::piecewise_construct, &v6);
    result[5] = v5;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result[5];
  }
  return result;
}

@end
