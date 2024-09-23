@implementation ZL26PhPopulateFiltersFromQueryPK20

int *___ZL26PhPopulateFiltersFromQueryPK20__CFAttributedStringPP10query_nodeS4_P14NSMutableArrayIP7NSValueES9_by_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  unsigned __int8 v10;
  unsigned __int8 *v11;
  uint64_t v12;
  _QWORD *v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  NSString *v17;
  const char *v18;
  NSObject *v19;
  BOOL v20;
  NSObject *v21;
  uint64_t v22;
  NSString *v23;
  int *result;
  _BOOL4 v25;
  uint64_t v26;
  _QWORD *query_node_with_ann;
  uint64_t v28;
  NSString *v29;
  _BOOL4 v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  NSString *v34;
  _BYTE __p[12];
  __int16 v36;
  NSString *v37;
  __int16 v38;
  NSString *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a2, "length");
  if (!a3)
    goto LABEL_17;
  if (!v6)
    goto LABEL_17;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_17;
  if (!objc_msgSend(a3, "length"))
    goto LABEL_17;
  v7 = (char *)objc_msgSend(a2, "UTF8String");
  v8 = objc_msgSend(a3, "UTF8String");
  if (!v7)
    goto LABEL_17;
  v9 = (char *)v8;
  if (!v8)
    goto LABEL_17;
  std::string::basic_string[abi:nn180100]<0>(__p, v7);
  {
    MetadataKeys(void)::_metadataKeys = 0u;
    *(_OWORD *)algn_1EF1B0DF0 = 0u;
    dword_1EF1B0E00 = 1065353216;
    __cxa_atexit((void (*)(void *))std::unordered_set<std::string>::~unordered_set[abi:nn180100], &MetadataKeys(void)::_metadataKeys, &dword_1B8270000);
  }
  if (MetadataKeys(void)::onceToken != -1)
    dispatch_once(&MetadataKeys(void)::onceToken, &__block_literal_global_11807);
  v11 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(MetadataKeys(void)::_metadataKeys, *((unint64_t *)&MetadataKeys(void)::_metadataKeys + 1), (uint64_t)__p);
  if (SHIBYTE(v38) < 0)
    operator delete(*(void **)__p);
  if (!v11)
  {
    if (!*(_BYTE *)(a1 + 88))
    {
      std::string::basic_string[abi:nn180100]<0>(__p, v7);
      v25 = isGenericFilterKey((uint64_t)__p);
      if (SHIBYTE(v38) < 0)
        operator delete(*(void **)__p);
      if (v25)
      {
        v26 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        query_node_with_ann = db_make_query_node_with_ann(v9, 0);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = makeOrNode(v26, (uint64_t)query_node_with_ann);
        v14 = *__error();
        v15 = _SILogForLogForCategory(19);
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          goto LABEL_23;
        v28 = *(_QWORD *)(a1 + 72);
        v29 = NSStringFromRange(*(NSRange *)(a1 + 56));
        *(_DWORD *)__p = 134218498;
        *(_QWORD *)&__p[4] = v28;
        v36 = 2112;
        v37 = (NSString *)a3;
        v38 = 2112;
        v39 = v29;
        v18 = "[qid=%llu] Adding generic filter: %@, token range: %@";
        goto LABEL_15;
      }
      if (!*(_BYTE *)(a1 + 88))
      {
        std::string::basic_string[abi:nn180100]<0>(__p, v7);
        v30 = isGenericFilterTopLevelKey((uint64_t)__p);
        if (SHIBYTE(v38) < 0)
          operator delete(*(void **)__p);
        if (v30)
        {
          v31 = **(_QWORD **)(a1 + 80);
          v32 = db_make_query_node_with_ann(v9, 0);
          **(_QWORD **)(a1 + 80) = makeAndNode(v31, (uint64_t)v32);
          v14 = *__error();
          v15 = _SILogForLogForCategory(19);
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            goto LABEL_23;
          v33 = *(_QWORD *)(a1 + 72);
          v34 = NSStringFromRange(*(NSRange *)(a1 + 56));
          *(_DWORD *)__p = 134218498;
          *(_QWORD *)&__p[4] = v33;
          v36 = 2112;
          v37 = (NSString *)a3;
          v38 = 2112;
          v39 = v34;
          v18 = "[qid=%llu] Adding generic top level filter: %@, token range: %@";
          goto LABEL_15;
        }
      }
    }
LABEL_17:
    v20 = *(_BYTE *)(a1 + 88) == 0;
    v14 = *__error();
    if (v20)
    {
      v21 = _SILogForLogForCategory(19);
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        goto LABEL_23;
    }
    else
    {
      v21 = _SILogForLogForCategory(20);
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        goto LABEL_23;
    }
    v22 = *(_QWORD *)(a1 + 72);
    v23 = NSStringFromRange(*(NSRange *)(a1 + 56));
    *(_DWORD *)__p = 134218498;
    *(_QWORD *)&__p[4] = v22;
    v36 = 2112;
    v37 = v23;
    v38 = 2112;
    v39 = (NSString *)a2;
    v18 = "[qid=%llu] [WARN] Ignoring filter, token range: %@, key: %@";
    v19 = v21;
    goto LABEL_22;
  }
  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v13 = db_make_query_node_with_ann(v9, 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = makeOrNode(v12, (uint64_t)v13);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64)));
  v14 = *__error();
  v15 = _SILogForLogForCategory(19);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(_QWORD *)(a1 + 72);
    v17 = NSStringFromRange(*(NSRange *)(a1 + 56));
    *(_DWORD *)__p = 134218498;
    *(_QWORD *)&__p[4] = v16;
    v36 = 2112;
    v37 = (NSString *)a3;
    v38 = 2112;
    v39 = v17;
    v18 = "[qid=%llu] Adding metadata filter: %@, token range: %@";
LABEL_15:
    v19 = v15;
LABEL_22:
    _os_log_impl(&dword_1B8270000, v19, OS_LOG_TYPE_DEFAULT, v18, __p, 0x20u);
  }
LABEL_23:
  result = __error();
  *result = v14;
  return result;
}

@end
