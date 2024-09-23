@implementation ZN8HALS

__int32 *___ZN8HALS_Tap16HandleClientExitEj_block_invoke(uint64_t a1)
{
  uint64_t v2;
  unsigned __int32 v3;
  HALS_Object *v4;
  HALS_ObjectMap *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unsigned __int8 v13;
  unsigned __int8 *v14;
  __int32 *v15;
  __int32 *result;
  __int32 *v17;
  __int32 *v18;
  void *__p;
  std::__shared_weak_count *v21;
  unsigned __int8 v22;
  uint64_t v23;
  std::__shared_weak_count *v24;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(a1 + 40);
  if (!std::__hash_table<std::__hash_value_type<unsigned int,std::optional<unsigned int>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::optional<unsigned int>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::optional<unsigned int>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::optional<unsigned int>>>>::find<unsigned int>((_QWORD *)(v2 + 88), v3))goto LABEL_22;
  std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__erase_unique<unsigned int>((_QWORD *)(v2 + 88), v3);
  v23 = 0;
  v24 = 0;
  HALS_System::GetInstance(&__p, 0, &v23);
  v5 = (HALS_ObjectMap *)HALS_System::CopyClientByObjectID((HALS_System *)__p, *(_DWORD *)(a1 + 40));
  v6 = v21;
  if (v21)
  {
    p_shared_owners = (unint64_t *)&v21->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  v9 = v24;
  if (!v24)
    goto LABEL_11;
  v10 = (unint64_t *)&v24->__shared_owners_;
  do
    v11 = __ldaxr(v10);
  while (__stlxr(v11 - 1, v10));
  if (!v11)
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
    if (v5)
      goto LABEL_12;
  }
  else
  {
LABEL_11:
    if (v5)
    {
LABEL_12:
      HALS_Client::GetBundleIDString((HALS_Client *)&__p, (uint64_t)v5);
      v12 = (std::__shared_weak_count *)v22;
      v13 = v22;
      if ((v22 & 0x80u) != 0)
        v12 = v21;
      if (v12)
      {
        std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string const&>(v2 + 168, (unsigned __int8 *)&__p, (uint64_t)&__p);
        v14 = std::__hash_table<std::__hash_value_type<std::string,std::vector<unsigned int>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<unsigned int>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<unsigned int>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<unsigned int>>>>::find<std::string>((_QWORD *)(v2 + 128), (unsigned __int8 *)&__p);
        if (v14)
          std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::erase((_QWORD *)(v2 + 128), (void **)v14);
        v13 = v22;
      }
      if ((v13 & 0x80) != 0)
        operator delete(__p);
    }
  }
  HALS_ObjectMap::ReleaseObject(v5, v4);
  v3 = *(_DWORD *)(a1 + 40);
LABEL_22:
  v15 = *(__int32 **)(v2 + 216);
  result = wmemchr(*(__int32 **)(v2 + 208), v3, ((uint64_t)v15 - *(_QWORD *)(v2 + 208)) >> 2);
  if (result)
    v17 = result;
  else
    v17 = v15;
  v18 = v17 + 1;
  if (v17 != v15 && v18 != v15)
  {
    do
    {
      if (*v18 != *(_DWORD *)(a1 + 40))
        *v17++ = *v18;
      ++v18;
    }
    while (v18 != v15);
  }
  if (*(__int32 **)(v2 + 216) != v17)
    *(_QWORD *)(v2 + 216) = v17;
  return result;
}

@end
