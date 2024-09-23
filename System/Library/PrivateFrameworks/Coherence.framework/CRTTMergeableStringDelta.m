@implementation CRTTMergeableStringDelta

- (CRTTMergeableStringDelta)initWithDeltasTo:(id)a3 from:(id)a4 compareElements:(id)a5
{
  id v8;
  id v9;
  CRTTMergeableStringDelta *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  CRTTMergeableStringStorage *attributedString;
  uint64_t v21;
  __int128 **v22;
  __int128 **v23;
  __int128 *v24;
  uint64_t *v25;
  void **v26;
  uint64_t **v27;
  unsigned int v28;
  int v29;
  int v30;
  unsigned int v31;
  int v32;
  BOOL v33;
  int v34;
  unsigned int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  unsigned int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  _OWORD *v46;
  __int128 v47;
  uint64_t *v48;
  uint64_t i;
  uint64_t v50;
  void *v51;
  void *v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  ObjCVersion *fromVersion;
  uint64_t v59;
  ObjCVersion *fromAddedByVersion;
  uint64_t v61;
  ObjCVersion *version;
  uint64_t v63;
  ObjCVersion *addedByVersion;
  CRTTMergeableStringDelta *v65;
  TopoSubstring **begin;
  TopoSubstring **end;
  _BOOL4 v69;
  id *location;
  int v71;
  id v72;
  _QWORD v73[4];
  CRTTMergeableStringDelta *v74;
  id v75;
  id v76;
  id v77;
  TopoID *v78;
  uint64_t **v79;
  uint64_t *v80;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  int v84;
  objc_super v85;
  _BYTE v86[32];
  int v87;
  TopoID v88;
  char v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v72 = a5;
  v85.receiver = self;
  v85.super_class = (Class)CRTTMergeableStringDelta;
  v10 = -[CRTTMergeableStringDelta init](&v85, sel_init);
  objc_msgSend(v9, "version");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "version");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "hasDeltaTo:", v12))
  {

    v13 = v72 != 0;
    v71 = 1;
LABEL_6:
    v82 = 0u;
    v83 = 0u;
    v84 = 1065353216;
    v80 = 0;
    v81 = 0;
    v79 = &v80;
    objc_msgSend(v8, "attributedString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v13;
    objc_msgSend(v18, "cr_emptyCopy");
    v19 = objc_claimAutoreleasedReturnValue();
    attributedString = v10->_attributedString;
    location = (id *)&v10->_attributedString;
    v10->_attributedString = (CRTTMergeableStringStorage *)v19;

    v21 = objc_msgSend(v9, "orderedSubstrings");
    v23 = *(__int128 ***)v21;
    v22 = *(__int128 ***)(v21 + 8);
    while (v23 != v22)
    {
      v24 = *v23;
      v25 = v80;
      v26 = (void **)&v80;
      v27 = &v80;
      if (!v80)
        goto LABEL_25;
      v26 = (void **)&v80;
      while (1)
      {
        while (1)
        {
          v27 = (uint64_t **)v25;
          v28 = *((_DWORD *)v24 + 4);
          v29 = *((_DWORD *)v24 + 5);
          *(_OWORD *)v86 = *v24;
          v30 = *((_DWORD *)v24 + 6);
          *(_OWORD *)v88.replica.uuid = *((_OWORD *)v27 + 2);
          v31 = *((_DWORD *)v27 + 12);
          v32 = *((_DWORD *)v27 + 13);
          v33 = v30 != 0;
          v34 = v30 - 1;
          if (!v33)
            v34 = 0;
          v35 = v34 + v29;
          v36 = *((_DWORD *)v27 + 14);
          *(_QWORD *)&v86[16] = __PAIR64__(v35, v28);
          v37 = v36 - 1;
          if (!v36)
            v37 = 0;
          v88.replica.index = v31;
          v88.clock = v37 + v32;
          if (!TopoID::lessThanOrderingReplicaFirst((TopoID *)v86, &v88))
            break;
          v25 = *v27;
          v26 = (void **)v27;
          if (!*v27)
            goto LABEL_25;
        }
        *(_OWORD *)v86 = *((_OWORD *)v27 + 2);
        *(_DWORD *)&v86[16] = *((_DWORD *)v27 + 12);
        v38 = *((_DWORD *)v27 + 13);
        v39 = *((_DWORD *)v27 + 14);
        v40 = *((_DWORD *)v24 + 4);
        v41 = *((_DWORD *)v24 + 5);
        *(_OWORD *)v88.replica.uuid = *v24;
        v33 = v39 != 0;
        v42 = v39 - 1;
        if (!v33)
          v42 = 0;
        v43 = v42 + v38;
        v44 = *((_DWORD *)v24 + 6);
        *(_DWORD *)&v86[20] = v43;
        v45 = v44 - 1;
        if (!v44)
          v45 = 0;
        v88.replica.index = v40;
        v88.clock = v45 + v41;
        if (!TopoID::lessThanOrderingReplicaFirst((TopoID *)v86, &v88))
          break;
        v26 = (void **)(v27 + 1);
        v25 = v27[1];
        if (!v25)
          goto LABEL_25;
      }
      v46 = *v26;
      if (!*v26)
      {
LABEL_25:
        v46 = operator new(0x48uLL);
        v47 = *v24;
        *(_OWORD *)((char *)v46 + 44) = *(__int128 *)((char *)v24 + 12);
        v46[2] = v47;
        *((_QWORD *)v46 + 8) = 0;
        *(_QWORD *)v46 = 0;
        *((_QWORD *)v46 + 1) = 0;
        *((_QWORD *)v46 + 2) = v27;
        *v26 = v46;
        v48 = (uint64_t *)v46;
        if (*v79)
        {
          v79 = (uint64_t **)*v79;
          v48 = (uint64_t *)*v26;
        }
        std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v80, v48);
        ++v81;
      }
      *((_QWORD *)v46 + 8) = v24;
      ++v23;
    }
    for (i = *(_QWORD *)(objc_msgSend(v8, "orderedSubstrings") + 8);
          i != *(_QWORD *)objc_msgSend(v8, "orderedSubstrings");
          i -= 8)
    {
      v50 = *(_QWORD *)(i - 8);
      -[CRTTMergeableStringDelta findAndCompareSubstring:from:toString:charMap:deltaCharMap:compareElements:](v10, "findAndCompareSubstring:from:toString:charMap:deltaCharMap:compareElements:", v50, v9, v8, &v79, &v82, v72);
    }
    *(_QWORD *)v88.replica.uuid = 0;
    *(_QWORD *)&v88.replica.uuid[8] = &v88;
    *(_QWORD *)&v88.replica.index = 0x2020000000;
    v89 = 1;
    memset(v86, 0, sizeof(v86));
    v87 = 1065353216;
    objc_msgSend(v8, "attributedString");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "cr_emptyCopy");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    std::vector<TopoSubstring *>::reserve((void **)&v10->orderedSubstrings.__begin_, *((unint64_t *)&v83 + 1));
    v53 = (_QWORD *)v83;
    if ((_QWORD)v83)
    {
      v54 = MEMORY[0x1E0C809B0];
      do
      {
        v55 = v53[5];
        if (!*(_DWORD *)(v55 + 80))
        {
          v73[0] = v54;
          v73[1] = 3221225472;
          v73[2] = __66__CRTTMergeableStringDelta_initWithDeltasTo_from_compareElements___block_invoke;
          v73[3] = &unk_1E775E300;
          v74 = v10;
          v75 = v9;
          v76 = v8;
          v78 = &v88;
          v77 = v52;
          traverseIterative(v55, v86, v73);

        }
        v53 = (_QWORD *)*v53;
      }
      while (v53);
    }
    objc_storeStrong(location, v52);
    if (*(_BYTE *)(*(_QWORD *)&v88.replica.uuid[8] + 24))
    {
      v56 = v71;
      if (v10->orderedSubstrings.__end_ != v10->orderedSubstrings.__begin_)
        v56 = 1;
      if (v56 == 1)
      {
        if (!v69 || objc_msgSend(*location, "length"))
        {
LABEL_43:
          objc_msgSend(v9, "version");
          v57 = objc_claimAutoreleasedReturnValue();
          fromVersion = v10->_fromVersion;
          v10->_fromVersion = (ObjCVersion *)v57;

          objc_msgSend(v9, "addedByVersion");
          v59 = objc_claimAutoreleasedReturnValue();
          fromAddedByVersion = v10->_fromAddedByVersion;
          v10->_fromAddedByVersion = (ObjCVersion *)v59;

          objc_msgSend(v8, "version");
          v61 = objc_claimAutoreleasedReturnValue();
          version = v10->_version;
          v10->_version = (ObjCVersion *)v61;

          objc_msgSend(v8, "addedByVersion");
          v63 = objc_claimAutoreleasedReturnValue();
          addedByVersion = v10->_addedByVersion;
          v10->_addedByVersion = (ObjCVersion *)v63;

          v10->_renameGeneration = +[CRGlobalContextObjC renameGeneration](CRGlobalContextObjC, "renameGeneration");
          v65 = v10;
LABEL_50:

          std::__hash_table<std::__hash_value_type<TopoSubstring const*,unsigned int>,std::__unordered_map_hasher<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::hash<TopoSubstring const*>,std::equal_to<TopoSubstring const*>,true>,std::__unordered_map_equal<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::equal_to<TopoSubstring const*>,std::hash<TopoSubstring const*>,true>,std::allocator<std::__hash_value_type<TopoSubstring const*,unsigned int>>>::~__hash_table((uint64_t)v86);
          _Block_object_dispose(&v88, 8);
          std::__tree<std::__value_type<TopoIDRange,TopoSubstring *>,std::__map_value_compare<TopoIDRange,std::__value_type<TopoIDRange,TopoSubstring *>,$_2,true>,std::allocator<std::__value_type<TopoIDRange,TopoSubstring *>>>::destroy(v80);
          std::__hash_table<std::__hash_value_type<TopoSubstring const*,unsigned int>,std::__unordered_map_hasher<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::hash<TopoSubstring const*>,std::equal_to<TopoSubstring const*>,true>,std::__unordered_map_equal<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::equal_to<TopoSubstring const*>,std::hash<TopoSubstring const*>,true>,std::allocator<std::__hash_value_type<TopoSubstring const*,unsigned int>>>::~__hash_table((uint64_t)&v82);
          v16 = v72;
          goto LABEL_51;
        }
        begin = v10->orderedSubstrings.__begin_;
        end = v10->orderedSubstrings.__end_;
        if (begin != end)
        {
          while (*((_QWORD *)*begin + 5) == *((_QWORD *)*begin + 4))
          {
            v65 = 0;
            if (++begin == end)
              goto LABEL_50;
          }
          goto LABEL_43;
        }
      }
    }
    v65 = 0;
    goto LABEL_50;
  }
  objc_msgSend(v9, "addedByVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addedByVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v14, "hasDeltaTo:", v15);

  v16 = v72;
  v13 = v72 != 0;
  v17 = v71;
  if (v72)
    v17 = 1;
  if ((v17 & 1) != 0)
    goto LABEL_6;
  v65 = 0;
LABEL_51:

  return v65;
}

void __66__CRTTMergeableStringDelta_initWithDeltasTo_from_compareElements___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  NSObject *v23;
  id v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;

  v4 = *(_QWORD **)(a1 + 32);
  v5 = (_QWORD *)v4[2];
  v6 = v4[3];
  if ((unint64_t)v5 >= v6)
  {
    v8 = v4[1];
    v9 = ((uint64_t)v5 - v8) >> 3;
    if ((unint64_t)(v9 + 1) >> 61)
      std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
    v10 = v6 - v8;
    v11 = v10 >> 2;
    if (v10 >> 2 <= (unint64_t)(v9 + 1))
      v11 = v9 + 1;
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v11;
    if (v12)
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)(v4 + 3), v12);
    else
      v13 = 0;
    v14 = &v13[8 * v9];
    v15 = &v13[8 * v12];
    *(_QWORD *)v14 = a2;
    v7 = v14 + 8;
    v17 = (char *)v4[1];
    v16 = (char *)v4[2];
    if (v16 != v17)
    {
      do
      {
        v18 = *((_QWORD *)v16 - 1);
        v16 -= 8;
        *((_QWORD *)v14 - 1) = v18;
        v14 -= 8;
      }
      while (v16 != v17);
      v16 = (char *)v4[1];
    }
    v4[1] = v14;
    v4[2] = v7;
    v4[3] = v15;
    if (v16)
      operator delete(v16);
  }
  else
  {
    *v5 = a2;
    v7 = v5 + 1;
  }
  v4[2] = v7;
  v19 = *(unsigned int *)(a2 + 24);
  if ((_DWORD)v19)
  {
    v20 = *(unsigned int *)(a2 + 84);
    if ((_DWORD)v20 != -1)
    {
      objc_msgSend(*(id *)(a1 + 32), "attributedString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "length");

      if (v20 + v19 <= v22)
      {
        v25 = objc_msgSend(*(id *)(a1 + 56), "length");
        v26 = *(void **)(a1 + 56);
        objc_msgSend(*(id *)(a1 + 32), "attributedString");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "cr_appendStorage:fromRange:", v27, *(unsigned int *)(a2 + 84), *(unsigned int *)(a2 + 24));

        *(_DWORD *)(a2 + 84) = v25;
      }
      else
      {
        v28 = MEMORY[0x1E0C809B0];
        v29 = *(id *)(a1 + 40);
        v30 = *(id *)(a1 + 48);
        os_state_add_handler();
        v23 = MEMORY[0x1E0C81028];
        v24 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v23, (os_log_type_t)0x90u))
          __66__CRTTMergeableStringDelta_initWithDeltasTo_from_compareElements___block_invoke_cold_1();
        os_state_remove_handler();
        if (os_variant_has_internal_diagnostics())
          objc_msgSend(*(id *)(a1 + 32), "openTapToRadar", v28, 3221225472, __66__CRTTMergeableStringDelta_initWithDeltasTo_from_compareElements___block_invoke_2, &unk_1E775E2D8, v29, v30);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;

      }
    }
  }
}

char *__66__CRTTMergeableStringDelta_initWithDeltasTo_from_compareElements___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1C3B7D930]();
  v3 = (void *)MEMORY[0x1E0CB38B0];
  v10[0] = CFSTR("from");
  objc_msgSend(*(id *)(a1 + 32), "dotDescription:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("to");
  v11[0] = v4;
  objc_msgSend(*(id *)(a1 + 40), "dotDescription:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataWithPropertyList:format:options:error:", v6, 200, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (char *)malloc_type_malloc(objc_msgSend(v7, "length") + 200, 0x8CA7AFCCuLL);
  *(_DWORD *)v8 = 1;
  *((_DWORD *)v8 + 1) = objc_msgSend(v7, "length");
  objc_msgSend(v7, "getBytes:range:", v8 + 200, 0, objc_msgSend(v7, "length"));
  strlcpy(v8 + 136, (const char *)objc_msgSend(CFSTR("CRTTMergeableStringDelta.init"), "UTF8String"), 0x40uLL);

  objc_autoreleasePoolPop(v2);
  return v8;
}

- (void)dealloc
{
  TopoSubstring **begin;
  TopoSubstring **end;
  TopoSubstring *v5;
  void *v6;
  void *v7;
  objc_super v8;

  begin = self->orderedSubstrings.__begin_;
  end = self->orderedSubstrings.__end_;
  while (begin != end)
  {
    v5 = *begin;
    if (*begin)
    {
      v6 = (void *)*((_QWORD *)v5 + 7);
      if (v6)
      {
        *((_QWORD *)v5 + 8) = v6;
        operator delete(v6);
      }
      v7 = (void *)*((_QWORD *)v5 + 4);
      if (v7)
      {
        *((_QWORD *)v5 + 5) = v7;
        operator delete(v7);
      }
      MEMORY[0x1C3B7D750](v5, 0x10A0C409FE6E197);
    }
    ++begin;
  }
  v8.receiver = self;
  v8.super_class = (Class)CRTTMergeableStringDelta;
  -[CRTTMergeableStringDelta dealloc](&v8, sel_dealloc);
}

- (void)openTapToRadar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if ((-[CRTTMergeableStringDelta openTapToRadar]::hasAlreadyFiled & 1) == 0)
  {
    -[CRTTMergeableStringDelta openTapToRadar]::hasAlreadyFiled = 1;
    v12 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    objc_msgSend(v12, "setScheme:", CFSTR("tap-to-radar"));
    objc_msgSend(v12, "setHost:", CFSTR("new"));
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("ComponentName"), CFSTR("Coherence"));
    objc_msgSend(v3, "addObject:", v4);

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("ComponentVersion"), CFSTR("all"));
    objc_msgSend(v3, "addObject:", v5);

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("ComponentID"), CFSTR("941619"));
    objc_msgSend(v3, "addObject:", v6);

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("AutoDiagnostics"), CFSTR("1"));
    objc_msgSend(v3, "addObject:", v7);

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Title"), CFSTR("CRTTMergeableStringDelta Fatal Failure"));
    objc_msgSend(v3, "addObject:", v8);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Classification"), CFSTR("Crash/Hang/Data Loss"));
    objc_msgSend(v3, "addObject:", v9);

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Reproducibility"), CFSTR("Not Applicable"));
    objc_msgSend(v3, "addObject:", v10);

    objc_msgSend(v12, "setQueryItems:", v3);
    objc_msgSend(v12, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRTTMergeableStringDelta openURL:](self, "openURL:", v11);

  }
}

- (void)openURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[objc_class sharedApplication](NSClassFromString(CFSTR("UIApplication")), "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0C99DB8];
    objc_msgSend(v3, "methodSignatureForSelector:", sel_openURL_options_completionHandler_);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invocationWithMethodSignature:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setSelector:", sel_openURL_options_completionHandler_);
    objc_msgSend(v7, "setArgument:atIndex:", &v13, 2);
    objc_msgSend(v7, "invokeWithTarget:", v4);

  }
  -[objc_class sharedWorkspace](NSClassFromString(CFSTR("NSWorkspace")), "sharedWorkspace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = (void *)MEMORY[0x1E0C99DB8];
    objc_msgSend(v8, "methodSignatureForSelector:", sel_openURL_);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invocationWithMethodSignature:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setSelector:", sel_openURL_);
    objc_msgSend(v12, "setArgument:atIndex:", &v13, 2);
    objc_msgSend(v12, "invokeWithTarget:", v9);

  }
}

- (void)orderedSubstrings
{
  return &self->orderedSubstrings;
}

- (CRTTMergeableStringDelta)initWithDecoder:(id)a3 error:(id *)a4
{
  id v6;
  CRTTMergeableStringDelta *v7;
  uint64_t v8;
  CRTTMergeableStringStorage *attributedString;
  uint64_t v10;
  ObjCVersion *version;
  uint64_t v12;
  ObjCVersion *addedByVersion;
  uint64_t v14;
  ObjCVersion *fromVersion;
  uint64_t v16;
  ObjCVersion *fromAddedByVersion;
  vector<TopoSubstring *, std::allocator<TopoSubstring *>> *p_orderedSubstrings;
  uint64_t v19;
  uint64_t v20;
  TopoSubstring **value;
  _QWORD *end;
  TopoSubstring **v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  uint64_t *v29;
  TopoSubstring **v30;
  TopoSubstring **begin;
  uint64_t v32;
  void *v33;
  _BOOL4 v34;
  CRTTMergeableStringDelta *v35;
  CRTTMergeableStringDelta *v36;
  unsigned int v38;
  objc_super v39;

  v6 = a3;
  v39.receiver = self;
  v39.super_class = (Class)CRTTMergeableStringDelta;
  v7 = -[CRTTMergeableStringDelta init](&v39, sel_init);
  objc_msgSend(v6, "storageWithError:", a4);
  v8 = objc_claimAutoreleasedReturnValue();
  attributedString = v7->_attributedString;
  v7->_attributedString = (CRTTMergeableStringStorage *)v8;

  if (!v7->_attributedString)
    goto LABEL_29;
  v7->_renameGeneration = +[CRGlobalContextObjC renameGeneration](CRGlobalContextObjC, "renameGeneration");
  objc_msgSend(v6, "versionWithError:", a4);
  v10 = objc_claimAutoreleasedReturnValue();
  version = v7->_version;
  v7->_version = (ObjCVersion *)v10;

  objc_msgSend(v6, "addedByVersionWithError:", a4);
  v12 = objc_claimAutoreleasedReturnValue();
  addedByVersion = v7->_addedByVersion;
  v7->_addedByVersion = (ObjCVersion *)v12;

  objc_msgSend(v6, "fromVersionWithError:", a4);
  v14 = objc_claimAutoreleasedReturnValue();
  fromVersion = v7->_fromVersion;
  v7->_fromVersion = (ObjCVersion *)v14;

  objc_msgSend(v6, "fromAddedByVersionWithError:", a4);
  v16 = objc_claimAutoreleasedReturnValue();
  fromAddedByVersion = v7->_fromAddedByVersion;
  v7->_fromAddedByVersion = (ObjCVersion *)v16;

  if (!v7->_version)
    goto LABEL_29;
  if (v7->_addedByVersion && v7->_fromVersion && v7->_fromAddedByVersion)
  {
    v38 = objc_msgSend(v6, "substringCount");
    p_orderedSubstrings = &v7->orderedSubstrings;
    std::vector<TopoSubstring *>::reserve((void **)&v7->orderedSubstrings.__begin_, v38);
    if (v38)
    {
      v19 = 0;
      do
      {
        v20 = operator new();
        *(_DWORD *)(v20 + 16) = 0;
        uuid_clear((unsigned __int8 *)v20);
        *(_DWORD *)(v20 + 20) = 0;
        *(_OWORD *)(v20 + 32) = 0u;
        *(_OWORD *)(v20 + 48) = 0u;
        *(_OWORD *)(v20 + 64) = 0u;
        *(_DWORD *)(v20 + 80) = 0;
        end = v7->orderedSubstrings.__end_;
        value = v7->orderedSubstrings.__end_cap_.__value_;
        if (end >= value)
        {
          v24 = (TopoSubstring **)end - p_orderedSubstrings->__begin_;
          if ((unint64_t)(v24 + 1) >> 61)
            std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
          v25 = (char *)value - (char *)p_orderedSubstrings->__begin_;
          v26 = v25 >> 2;
          if (v25 >> 2 <= (unint64_t)(v24 + 1))
            v26 = v24 + 1;
          if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8)
            v27 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v27 = v26;
          if (v27)
            v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)&v7->orderedSubstrings.__end_cap_, v27);
          else
            v28 = 0;
          v29 = (uint64_t *)&v28[8 * v24];
          *v29 = v20;
          v23 = (TopoSubstring **)(v29 + 1);
          begin = v7->orderedSubstrings.__begin_;
          v30 = v7->orderedSubstrings.__end_;
          if (v30 != begin)
          {
            do
            {
              v32 = (uint64_t)*--v30;
              *--v29 = v32;
            }
            while (v30 != begin);
            v30 = p_orderedSubstrings->__begin_;
          }
          v7->orderedSubstrings.__begin_ = (TopoSubstring **)v29;
          v7->orderedSubstrings.__end_ = v23;
          v7->orderedSubstrings.__end_cap_.__value_ = (TopoSubstring **)&v28[8 * v27];
          if (v30)
            operator delete(v30);
        }
        else
        {
          *end = v20;
          v23 = (TopoSubstring **)(end + 1);
        }
        v7->orderedSubstrings.__end_ = v23;
        ++v19;
      }
      while (v19 != v38);
    }
    -[CRTTMergeableStringDelta attributedString](v7, "attributedString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = decodeSubstrings(v38, objc_msgSend(v33, "length"), v6, (uint64_t *)&v7->orderedSubstrings, 0, 0, (uint64_t)a4);

    if (v34)
      v35 = v7;
    else
      v35 = 0;
    v36 = v35;
  }
  else
  {
LABEL_29:
    v36 = 0;
  }

  return v36;
}

- (BOOL)saveToEncoder:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t **v7;
  uint64_t *v8;
  uint64_t *v9;
  int v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t **v20;
  uint64_t **v21;
  _QWORD *v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD *v30;
  uint64_t v31;
  _OWORD v32[2];
  int v33;
  uint64_t *v34;

  v6 = a3;
  memset(v32, 0, sizeof(v32));
  v33 = 1065353216;
  v7 = -[CRTTMergeableStringDelta orderedSubstrings](self, "orderedSubstrings");
  v8 = *v7;
  v9 = v7[1];
  if (*v7 != v9)
  {
    v10 = 0;
    do
    {
      v31 = 0;
      v31 = *v8;
      v34 = &v31;
      *((_DWORD *)std::__hash_table<std::__hash_value_type<TopoSubstring const*,unsigned int>,std::__unordered_map_hasher<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::hash<TopoSubstring const*>,std::equal_to<TopoSubstring const*>,true>,std::__unordered_map_equal<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::equal_to<TopoSubstring const*>,std::hash<TopoSubstring const*>,true>,std::allocator<std::__hash_value_type<TopoSubstring const*,unsigned int>>>::__emplace_unique_key_args<TopoSubstring const*,std::piecewise_construct_t const&,std::tuple<TopoSubstring const* const&>,std::tuple<>>((uint64_t)v32, &v31, (uint64_t)&std::piecewise_construct, &v34)+ 6) = v10++;
      ++v8;
    }
    while (v8 != v9);
  }
  v11 = -[CRTTMergeableStringDelta orderedSubstrings](self, "orderedSubstrings", a4);
  v12 = (_QWORD *)*v11;
  v13 = (_QWORD *)v11[1];
  if ((_QWORD *)*v11 != v13)
  {
    while (1)
    {
      v14 = *v12;
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", *v12);
      objc_msgSend(v6, "setCharWithId:clock:", v15, *(unsigned int *)(v14 + 20));
      objc_msgSend(v6, "setWithLength:", *(unsigned int *)(v14 + 24));
      if (*(_DWORD *)(v14 + 84) == -1)
        break;
      if (*(_QWORD *)(v14 + 40) == *(_QWORD *)(v14 + 32))
      {
        v16 = 1;
LABEL_9:
        objc_msgSend(v6, "setWithContentOptions:", v16);
      }
      v18 = *(_QWORD *)(v14 + 32);
      v17 = *(_QWORD *)(v14 + 40);
      while (v18 != v17)
      {
        if (*(_DWORD *)(v18 + 16) == -1)
        {
          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v18);
          objc_msgSend(v6, "addRemovedAddedById:clock:", v19, *(unsigned int *)(v18 + 20));
        }
        else
        {
          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v18);
          objc_msgSend(v6, "addAddedById:clock:", v19, *(unsigned int *)(v18 + 20));
        }

        v18 += 24;
      }
      v20 = *(uint64_t ***)(v14 + 56);
      v21 = *(uint64_t ***)(v14 + 64);
      while (v20 != v21)
      {
        v34 = 0;
        v34 = *v20;
        v22 = std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::find<TopoSubstring *>(v32, &v34);
        if (!v22)
          __assert_rtn("-[CRTTMergeableStringDelta saveToEncoder:error:]", "CRTTMergeableStringDelta.mm", 293, "it != substringIndexes.end()");
        objc_msgSend(v6, "addChildWithId:", *((unsigned int *)v22 + 6));
        ++v20;
      }
      objc_msgSend(v6, "finishSubstring");

      if (++v12 == v13)
        goto LABEL_21;
    }
    v16 = 2;
    goto LABEL_9;
  }
LABEL_21:
  -[CRTTMergeableStringDelta attributedString](self, "attributedString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStorage:error:", v23, v30);

  if (v30 && *v30)
  {
    v24 = 0;
  }
  else
  {
    -[CRTTMergeableStringDelta version](self, "version");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithVersion:", v25);

    -[CRTTMergeableStringDelta addedByVersion](self, "addedByVersion");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithAddedByVersion:", v26);

    -[CRTTMergeableStringDelta fromVersion](self, "fromVersion");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFromVersion:", v27);

    -[CRTTMergeableStringDelta fromAddedByVersion](self, "fromAddedByVersion");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFromAddedByVersion:", v28);

    v24 = 1;
  }
  std::__hash_table<std::__hash_value_type<TopoSubstring const*,unsigned int>,std::__unordered_map_hasher<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::hash<TopoSubstring const*>,std::equal_to<TopoSubstring const*>,true>,std::__unordered_map_equal<TopoSubstring const*,std::__hash_value_type<TopoSubstring const*,unsigned int>,std::equal_to<TopoSubstring const*>,std::hash<TopoSubstring const*>,true>,std::allocator<std::__hash_value_type<TopoSubstring const*,unsigned int>>>::~__hash_table((uint64_t)v32);

  return v24;
}

- (void)addSubstring:(const TopoIDRange *)a3 requiresExactLength:(BOOL)a4 deltaCharMap:(void *)a5
{
  _BOOL4 v6;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  __int128 v11;
  _OWORD *v13;

  v6 = a4;
  v8 = std::__hash_table<std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::__unordered_map_hasher<TopoID,std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::hash<TopoID>,std::equal_to<TopoID>,true>,std::__unordered_map_equal<TopoID,std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::equal_to<TopoID>,std::hash<TopoID>,true>,std::allocator<std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>>>::find<TopoID>(a5, (uint64_t)a3);
  if (!v8)
  {
    v10 = operator new();
    *(_DWORD *)(v10 + 16) = 0;
    uuid_clear((unsigned __int8 *)v10);
    *(_QWORD *)(v10 + 80) = 0xFFFFFFFF00000000;
    *(_OWORD *)(v10 + 48) = 0u;
    *(_OWORD *)(v10 + 64) = 0u;
    *(_OWORD *)(v10 + 32) = 0u;
    *(_OWORD *)v10 = *(_OWORD *)a3->charID.replica.uuid;
    v11 = *(_OWORD *)&a3->charID.replica.uuid[12];
LABEL_8:
    *(_OWORD *)(v10 + 12) = v11;
    v13 = (_OWORD *)v10;
    *((_QWORD *)std::__hash_table<std::__hash_value_type<TopoID,TopoSubstring *>,std::__unordered_map_hasher<TopoID,std::__hash_value_type<TopoID,TopoSubstring *>,std::hash<TopoID>,std::equal_to<TopoID>,true>,std::__unordered_map_equal<TopoID,std::__hash_value_type<TopoID,TopoSubstring *>,std::equal_to<TopoID>,std::hash<TopoID>,true>,std::allocator<std::__hash_value_type<TopoID,TopoSubstring *>>>::__emplace_unique_key_args<TopoID,std::piecewise_construct_t const&,std::tuple<TopoID const&>,std::tuple<>>((uint64_t)a5, v10, (uint64_t)&std::piecewise_construct, &v13)+ 5) = v10;
    return (void *)v10;
  }
  v9 = v8;
  v10 = v8[5];
  if (v6 && TopoIDRange::operator!=((unsigned __int8 *)v8[5], a3->charID.replica.uuid))
  {
    if (*(_QWORD *)(v10 + 40) != *(_QWORD *)(v10 + 32) || *(_QWORD *)(v10 + 64) != *(_QWORD *)(v10 + 56))
      -[CRTTMergeableStringDelta addSubstring:requiresExactLength:deltaCharMap:].cold.1();
    std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::erase(a5, v9);
    v11 = *(_OWORD *)&a3->charID.replica.uuid[12];
    *(_OWORD *)v10 = *(_OWORD *)a3->charID.replica.uuid;
    goto LABEL_8;
  }
  return (void *)v10;
}

- (void)addChildTo:(const void *)a3 child:(const void *)a4 deltaCharMap:(void *)a5
{
  TopoSubstring::addChild((TopoSubstring *)-[CRTTMergeableStringDelta addSubstring:requiresExactLength:deltaCharMap:](self, "addSubstring:requiresExactLength:deltaCharMap:", a3, 1), (TopoSubstring *)-[CRTTMergeableStringDelta addSubstring:requiresExactLength:deltaCharMap:](self, "addSubstring:requiresExactLength:deltaCharMap:", a4, 0, a5));
}

- (void)findAndCompareSubstring:(const void *)a3 from:(id)a4 toString:(id)a5 charMap:(const void *)a6 deltaCharMap:(void *)a7 compareElements:(id)a8
{
  id v14;
  id v15;
  uint64_t v16;
  unsigned int v17;
  unsigned __int8 **v18;
  int v19;
  int v20;
  int v21;
  BOOL v22;
  int v23;
  _BOOL4 v24;
  uint64_t *v25;
  char *v26;
  char *v27;
  __int128 **v28;
  __int128 **i;
  __int128 *v30;
  __int128 v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  void *v36;
  _BYTE v37[28];
  void *v38;
  void *v39;
  uint64_t v40;
  void *__p;
  void *v42;
  uint64_t v43;
  int v44;
  int v45;
  __int128 v46;
  unsigned int v47;
  TopoID v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a5;
  v35 = a8;
  v36 = v15;
  v46 = *(_OWORD *)a3;
  v47 = *((_DWORD *)a3 + 4);
  v16 = *((_QWORD *)a6 + 1);
  if (!v16)
    goto LABEL_12;
  v17 = *((_DWORD *)a3 + 5);
  v18 = (unsigned __int8 **)((char *)a6 + 8);
  do
  {
    *(_OWORD *)v37 = *(_OWORD *)(v16 + 32);
    v19 = *(_DWORD *)(v16 + 48);
    v20 = *(_DWORD *)(v16 + 52);
    v21 = *(_DWORD *)(v16 + 56);
    *(_OWORD *)v48.replica.uuid = v46;
    v22 = v21 != 0;
    v23 = v21 - 1;
    if (!v22)
      v23 = 0;
    *(_DWORD *)&v37[16] = v19;
    *(_DWORD *)&v37[20] = v23 + v20;
    v48.replica.index = v47;
    v48.clock = v17;
    v24 = TopoID::lessThanOrderingReplicaFirst((TopoID *)v37, &v48);
    v25 = (uint64_t *)(v16 + 8);
    if (!v24)
    {
      v25 = (uint64_t *)v16;
      v18 = (unsigned __int8 **)v16;
    }
    v16 = *v25;
  }
  while (*v25);
  if (v18 == (unsigned __int8 **)((char *)a6 + 8)
    || TopoIDRange::operator!=(v18[8], (unsigned __int8 *)a3)
    && !TopoIDRange::intersects((TopoIDRange *)v18[8], (const TopoIDRange *)a3))
  {
LABEL_12:
    v34 = v14;
    v26 = -[CRTTMergeableStringDelta addSubstring:requiresExactLength:deltaCharMap:](self, "addSubstring:requiresExactLength:deltaCharMap:", a3, 1, a7);
    v27 = v26;
    if (v26 != a3)
      std::vector<TopoID>::__assign_with_size[abi:ne180100]<TopoID*,TopoID*>(v26 + 32, *((char **)a3 + 4), *((_QWORD *)a3 + 5), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 5) - *((_QWORD *)a3 + 4)) >> 3));
    std::vector<TopoSubstring *>::reserve((void **)v27 + 7, (uint64_t)(*((_QWORD *)a3 + 8) - *((_QWORD *)a3 + 7)) >> 3);
    v28 = (__int128 **)*((_QWORD *)a3 + 7);
    for (i = (__int128 **)*((_QWORD *)a3 + 8); v28 != i; ++v28)
    {
      v30 = *v28;
      v31 = **v28;
      *(_OWORD *)&v37[12] = *(__int128 *)((char *)*v28 + 12);
      *(_OWORD *)v37 = v31;
      v39 = 0;
      v40 = 0;
      v38 = 0;
      std::vector<TopoID>::__init_with_size[abi:ne180100]<TopoID*,TopoID*>(&v38, *((const void **)v30 + 4), *((_QWORD *)v30 + 5), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v30 + 5) - *((_QWORD *)v30 + 4)) >> 3));
      __p = 0;
      v42 = 0;
      v44 = 0;
      v43 = 0;
      v45 = *((_DWORD *)v30 + 21);
      -[CRTTMergeableStringDelta addChildTo:child:deltaCharMap:](self, "addChildTo:child:deltaCharMap:", a3, v37, a7);
      if (__p)
      {
        v42 = __p;
        operator delete(__p);
      }
      if (v38)
      {
        v39 = v38;
        operator delete(v38);
      }
    }
    v14 = v34;
    v15 = v36;
    if (*((_QWORD *)a3 + 5) != *((_QWORD *)a3 + 4))
    {
      objc_msgSend(v36, "attributedString");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (*((_QWORD *)a3 + 5) == *((_QWORD *)a3 + 4))
        v33 = 0;
      else
        v33 = *((unsigned int *)a3 + 6);
      -[CRTTMergeableStringDelta addStorageTo:fromStorage:range:](self, "addStorageTo:fromStorage:range:", v27, v32, *((unsigned int *)a3 + 21), v33);

    }
  }
  else
  {
    -[CRTTMergeableStringDelta compareSubstring:toSubstring:fromString:toString:charMap:deltaCharMap:compareElements:](self, "compareSubstring:toSubstring:fromString:toString:charMap:deltaCharMap:compareElements:", a3, v18[8], v14, v15, a6, a7, v35);
  }

}

- (void)addStorageTo:(void *)a3 fromStorage:(id)a4 range:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;

  length = a5.length;
  location = a5.location;
  v9 = a4;
  *((_DWORD *)a3 + 21) = CRTTBoundedCheckedCastNSUIntegerToUInt32(-[CRTTMergeableStringStorage length](self->_attributedString, "length"));
  -[CRTTMergeableStringStorage cr_appendStorage:fromRange:](self->_attributedString, "cr_appendStorage:fromRange:", v9, location, length);

}

- (void)compareSameSubstring:(const void *)a3 toSubstring:(const void *)a4 from:(id)a5 toString:(id)a6 charMap:(const void *)a7 deltaCharMap:(void *)a8 compareElements:(id)a9
{
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *i;
  __int128 v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  unint64_t v21;
  unint64_t v22;
  int v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char *v30;
  char *v31;
  char *v32;
  char *v33;
  char *v34;
  __int128 v35;
  __int128 *v36;
  __int128 *v37;
  __int128 v38;
  void *v39;
  void *v40;
  char v41;
  unint64_t v42;
  unint64_t v43;
  __int128 v44;
  char *v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  char *v51;
  char *v52;
  __int128 v53;
  char *v54;
  char *v55;
  char *v56;
  __int128 v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t j;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  int v67;
  void *v68;
  void *v69;
  __int128 **v70;
  __int128 **k;
  __int128 *v72;
  uint64_t *v73;
  uint64_t *v74;
  uint64_t v75;
  __int128 v76;
  void *v77;
  id v78;
  id v79;
  _QWORD *obj;
  id obja;
  id v82;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE src[28];
  void *v89;
  void *v90;
  uint64_t v91;
  void *__p;
  void *v93;
  uint64_t v94;
  int v95;
  int v96;
  unsigned __int8 v97[132];
  uuid_t dst;
  int v99;
  __int128 v100;
  int v101;
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v79 = a5;
  v82 = a6;
  v78 = a9;
  if (*((_DWORD *)a4 + 6))
  {
    v14 = (_QWORD *)*((_QWORD *)a4 + 4);
    v13 = (_QWORD *)*((_QWORD *)a4 + 5);
    obj = v14;
    for (i = 0; v14 != v13; v14 += 3)
    {
      v16 = *(_OWORD *)v14;
      *(_QWORD *)&src[16] = v14[2];
      *(_OWORD *)src = v16;
      if (std::__find_impl[abi:ne180100]<TopoID const*,TopoID const*,TopoID,std::__identity>(*((unsigned __int8 **)a3 + 4), *((unsigned __int8 **)a3 + 5), src) == *((unsigned __int8 **)a3 + 5))
      {
        objc_msgSend(v82, "addedByVersion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        TopoID::objc((TopoID *)src);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "contains:", v18);

        if (v19)
        {
          if (!i)
            i = -[CRTTMergeableStringDelta addSubstring:requiresExactLength:deltaCharMap:](self, "addSubstring:requiresExactLength:deltaCharMap:", a3, 1, a8);
          v99 = -1;
          uuid_copy(dst, src);
          v20 = *(_DWORD *)&src[20];
          v100 = *(_OWORD *)dst;
          v101 = v99;
          v21 = i[6];
          v22 = i[5];
          if (v22 >= v21)
          {
            v25 = i[4];
            v26 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v22 - v25) >> 3);
            v27 = v26 + 1;
            if (v26 + 1 > 0xAAAAAAAAAAAAAAALL)
              std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
            v28 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v21 - v25) >> 3);
            if (2 * v28 > v27)
              v27 = 2 * v28;
            if (v28 >= 0x555555555555555)
              v29 = 0xAAAAAAAAAAAAAAALL;
            else
              v29 = v27;
            if (v29)
              v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoID>>((uint64_t)(i + 6), v29);
            else
              v30 = 0;
            v31 = &v30[24 * v26];
            *((_DWORD *)v31 + 4) = v101;
            *(_OWORD *)v31 = v100;
            *((_DWORD *)v31 + 5) = v20;
            v33 = (char *)i[4];
            v32 = (char *)i[5];
            v34 = v31;
            if (v32 != v33)
            {
              do
              {
                v35 = *(_OWORD *)(v32 - 24);
                *((_QWORD *)v34 - 1) = *((_QWORD *)v32 - 1);
                *(_OWORD *)(v34 - 24) = v35;
                v34 -= 24;
                v32 -= 24;
              }
              while (v32 != v33);
              v32 = (char *)i[4];
            }
            v24 = v31 + 24;
            i[4] = v34;
            i[5] = v31 + 24;
            i[6] = &v30[24 * v29];
            if (v32)
              operator delete(v32);
          }
          else
          {
            v23 = v99;
            *(_OWORD *)v22 = *(_OWORD *)dst;
            *(_DWORD *)(v22 + 16) = v23;
            *(_DWORD *)(v22 + 20) = v20;
            v24 = (char *)(v22 + 24);
          }
          i[5] = v24;
        }
      }
    }
    v37 = (__int128 *)*((_QWORD *)a3 + 4);
    v36 = (__int128 *)*((_QWORD *)a3 + 5);
    if (v37 != v36)
    {
      do
      {
        v38 = *v37;
        *(_QWORD *)&src[16] = *((_QWORD *)v37 + 2);
        *(_OWORD *)src = v38;
        if (std::__find_impl[abi:ne180100]<TopoID const*,TopoID const*,TopoID,std::__identity>(*((unsigned __int8 **)a4 + 4), *((unsigned __int8 **)a4 + 5), src) == *((unsigned __int8 **)a4 + 5))
        {
          objc_msgSend(v79, "addedByVersion");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          TopoID::objc((TopoID *)src);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v39, "contains:", v40);

          if ((v41 & 1) == 0)
          {
            if (!i)
              i = -[CRTTMergeableStringDelta addSubstring:requiresExactLength:deltaCharMap:](self, "addSubstring:requiresExactLength:deltaCharMap:", a3, 1, a8);
            v42 = i[6];
            v43 = i[5];
            if (v43 >= v42)
            {
              v46 = i[4];
              v47 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v43 - v46) >> 3);
              v48 = v47 + 1;
              if (v47 + 1 > 0xAAAAAAAAAAAAAAALL)
                std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
              v49 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v42 - v46) >> 3);
              if (2 * v49 > v48)
                v48 = 2 * v49;
              if (v49 >= 0x555555555555555)
                v50 = 0xAAAAAAAAAAAAAAALL;
              else
                v50 = v48;
              if (v50)
                v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoID>>((uint64_t)(i + 6), v50);
              else
                v51 = 0;
              v52 = &v51[24 * v47];
              v53 = *(_OWORD *)src;
              *((_QWORD *)v52 + 2) = *(_QWORD *)&src[16];
              *(_OWORD *)v52 = v53;
              v55 = (char *)i[4];
              v54 = (char *)i[5];
              v56 = v52;
              if (v54 != v55)
              {
                do
                {
                  v57 = *(_OWORD *)(v54 - 24);
                  *((_QWORD *)v56 - 1) = *((_QWORD *)v54 - 1);
                  *(_OWORD *)(v56 - 24) = v57;
                  v56 -= 24;
                  v54 -= 24;
                }
                while (v54 != v55);
                v54 = (char *)i[4];
              }
              v45 = v52 + 24;
              i[4] = v56;
              i[5] = v52 + 24;
              i[6] = &v51[24 * v50];
              if (v54)
                operator delete(v54);
            }
            else
            {
              v44 = *(_OWORD *)src;
              *(_QWORD *)(v43 + 16) = *(_QWORD *)&src[16];
              *(_OWORD *)v43 = v44;
              v45 = (char *)(v43 + 24);
            }
            i[5] = v45;
          }
        }
        v37 = (__int128 *)((char *)v37 + 24);
      }
      while (v37 != v36);
      if (*((_QWORD *)a3 + 5) != *((_QWORD *)a3 + 4))
      {
        if (v13 == obj)
        {
          if (!i)
            i = -[CRTTMergeableStringDelta addSubstring:requiresExactLength:deltaCharMap:](self, "addSubstring:requiresExactLength:deltaCharMap:", a3, 1, a8);
          objc_msgSend(v82, "attributedString");
          -[CRTTMergeableStringDelta addStorageTo:fromStorage:range:](self, "addStorageTo:fromStorage:range:", i, objc_claimAutoreleasedReturnValue());
        }
        else
        {
          if (!v78)
            goto LABEL_69;
          (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v78 + 2))(v78, *((unsigned int *)a3 + 21), *((unsigned int *)a3 + 6), *((unsigned int *)a4 + 21), *((unsigned int *)a4 + 6));
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v77, "count") && i)
          {
            objc_msgSend(v82, "attributedString");
            v58 = (id)objc_claimAutoreleasedReturnValue();
            if (*((_QWORD *)a3 + 5) == *((_QWORD *)a3 + 4))
              v59 = 0;
            else
              v59 = *((unsigned int *)a3 + 6);
            -[CRTTMergeableStringDelta addStorageTo:fromStorage:range:](self, "addStorageTo:fromStorage:range:", i, v58, *((unsigned int *)a3 + 21), v59);
          }
          else
          {
            v86 = 0u;
            v87 = 0u;
            v84 = 0u;
            v85 = 0u;
            v58 = v77;
            obja = v58;
            v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v84, v97, 16);
            if (v60)
            {
              v61 = *(_QWORD *)v85;
              do
              {
                for (j = 0; j != v60; ++j)
                {
                  if (*(_QWORD *)v85 != v61)
                    objc_enumerationMutation(obja);
                  v63 = objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * j), "rangeValue");
                  v65 = v64;
                  v66 = *((_DWORD *)a3 + 4);
                  v67 = v63 - *((_DWORD *)a3 + 21) + *((_DWORD *)a3 + 5);
                  *(_OWORD *)src = *(_OWORD *)a3;
                  *(_DWORD *)&src[16] = v66;
                  *(_DWORD *)&src[20] = v67;
                  *(_DWORD *)&src[24] = v64;
                  v68 = -[CRTTMergeableStringDelta addSubstring:requiresExactLength:deltaCharMap:](self, "addSubstring:requiresExactLength:deltaCharMap:", src, 1, a8);
                  objc_msgSend(v82, "attributedString");
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  -[CRTTMergeableStringDelta addStorageTo:fromStorage:range:](self, "addStorageTo:fromStorage:range:", v68, v69, v63, v65);

                }
                v58 = obja;
                v60 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v84, v97, 16);
              }
              while (v60);
            }
          }

        }
      }
    }
  }
LABEL_69:
  v70 = (__int128 **)*((_QWORD *)a3 + 7);
  for (k = (__int128 **)*((_QWORD *)a3 + 8); v70 != k; ++v70)
  {
    v72 = *v70;
    v73 = (uint64_t *)*((_QWORD *)a4 + 7);
    v74 = (uint64_t *)*((_QWORD *)a4 + 8);
    while (v73 != v74)
    {
      v75 = *v73;
      if (*((_DWORD *)v72 + 5) == *(_DWORD *)(*v73 + 20)
        && *((_DWORD *)v72 + 4) == *(_DWORD *)(v75 + 16)
        && !uuid_compare((const unsigned __int8 *)v72, (const unsigned __int8 *)v75))
      {
        goto LABEL_80;
      }
      ++v73;
    }
    v76 = *v72;
    *(_OWORD *)&src[12] = *(__int128 *)((char *)v72 + 12);
    *(_OWORD *)src = v76;
    v90 = 0;
    v91 = 0;
    v89 = 0;
    std::vector<TopoID>::__init_with_size[abi:ne180100]<TopoID*,TopoID*>(&v89, *((const void **)v72 + 4), *((_QWORD *)v72 + 5), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v72 + 5) - *((_QWORD *)v72 + 4)) >> 3));
    __p = 0;
    v93 = 0;
    v95 = 0;
    v94 = 0;
    v96 = *((_DWORD *)v72 + 21);
    -[CRTTMergeableStringDelta addChildTo:child:deltaCharMap:](self, "addChildTo:child:deltaCharMap:", a3, src, a8);
    if (__p)
    {
      v93 = __p;
      operator delete(__p);
    }
    if (v89)
    {
      v90 = v89;
      operator delete(v89);
    }
LABEL_80:
    ;
  }

}

- (void)compareSubstring:(const void *)a3 toSubstring:(const void *)a4 fromString:(id)a5 toString:(id)a6 charMap:(const void *)a7 deltaCharMap:(void *)a8 compareElements:(id)a9
{
  id v15;
  id v16;
  id v17;
  unsigned int v18;
  unsigned int v19;
  uuid_t uu;
  int v21;
  int v22;
  void *v23[2];
  void *__p[2];
  __int128 v25;
  int v26;
  _BYTE v27[28];
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v15 = a5;
  v16 = a6;
  v17 = a9;
  if (TopoIDRange::operator==((unsigned __int8 *)a4, (unsigned __int8 *)a3))
  {
    -[CRTTMergeableStringDelta compareSameSubstring:toSubstring:from:toString:charMap:deltaCharMap:compareElements:](self, "compareSameSubstring:toSubstring:from:toString:charMap:deltaCharMap:compareElements:", a3, a4, v15, v16, a7, a8, v17);
  }
  else
  {
    v18 = *((_DWORD *)a4 + 5);
    v19 = *((_DWORD *)a3 + 5);
    if (v18 == v19)
    {
      if (*((_DWORD *)a4 + 6) <= *((_DWORD *)a3 + 6))
      {
        *(_OWORD *)v27 = *(_OWORD *)a3;
        *(_OWORD *)&v27[12] = *(_OWORD *)((char *)a3 + 12);
        v29 = 0;
        v30 = 0;
        v28 = 0;
        std::vector<TopoID>::__init_with_size[abi:ne180100]<TopoID*,TopoID*>(&v28, *((const void **)a3 + 4), *((_QWORD *)a3 + 5), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 5) - *((_QWORD *)a3 + 4)) >> 3));
        v31 = 0;
        v32 = 0;
        v33 = 0;
        std::vector<TopoSubstring *>::__init_with_size[abi:ne180100]<TopoSubstring **,TopoSubstring **>(&v31, *((const void **)a3 + 7), *((_QWORD *)a3 + 8), (uint64_t)(*((_QWORD *)a3 + 8) - *((_QWORD *)a3 + 7)) >> 3);
        v34 = *((_QWORD *)a3 + 10);
        v21 = 0;
        uuid_clear(uu);
        v22 = 0;
        *(_OWORD *)v23 = 0u;
        *(_OWORD *)__p = 0u;
        v25 = 0u;
        v26 = 0;
        TopoSubstring::splitAt((TopoSubstring *)v27, *((_DWORD *)a4 + 6), (TopoSubstring *)uu);
        -[CRTTMergeableStringDelta compareSubstring:toSubstring:fromString:toString:charMap:deltaCharMap:compareElements:](self, "compareSubstring:toSubstring:fromString:toString:charMap:deltaCharMap:compareElements:", v27, a4, v15, v16, a7, a8, v17);
        -[CRTTMergeableStringDelta findAndCompareSubstring:from:toString:charMap:deltaCharMap:compareElements:](self, "findAndCompareSubstring:from:toString:charMap:deltaCharMap:compareElements:", uu, v15, v16, a7, a8, v17);
      }
      else
      {
        *(_OWORD *)v27 = *(_OWORD *)a4;
        *(_OWORD *)&v27[12] = *(_OWORD *)((char *)a4 + 12);
        v29 = 0;
        v30 = 0;
        v28 = 0;
        std::vector<TopoID>::__init_with_size[abi:ne180100]<TopoID*,TopoID*>(&v28, *((const void **)a4 + 4), *((_QWORD *)a4 + 5), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a4 + 5) - *((_QWORD *)a4 + 4)) >> 3));
        v31 = 0;
        v32 = 0;
        v33 = 0;
        std::vector<TopoSubstring *>::__init_with_size[abi:ne180100]<TopoSubstring **,TopoSubstring **>(&v31, *((const void **)a4 + 7), *((_QWORD *)a4 + 8), (uint64_t)(*((_QWORD *)a4 + 8) - *((_QWORD *)a4 + 7)) >> 3);
        v34 = *((_QWORD *)a4 + 10);
        v21 = 0;
        uuid_clear(uu);
        v22 = 0;
        *(_OWORD *)v23 = 0u;
        *(_OWORD *)__p = 0u;
        v25 = 0u;
        v26 = 0;
        TopoSubstring::splitAt((TopoSubstring *)v27, *((_DWORD *)a3 + 6), (TopoSubstring *)uu);
        -[CRTTMergeableStringDelta compareSubstring:toSubstring:fromString:toString:charMap:deltaCharMap:compareElements:](self, "compareSubstring:toSubstring:fromString:toString:charMap:deltaCharMap:compareElements:", a3, v27, v15, v16, a7, a8, v17);
      }
    }
    else if (v18 >= v19)
    {
      *(_OWORD *)v27 = *(_OWORD *)a3;
      *(_OWORD *)&v27[12] = *(_OWORD *)((char *)a3 + 12);
      v29 = 0;
      v30 = 0;
      v28 = 0;
      std::vector<TopoID>::__init_with_size[abi:ne180100]<TopoID*,TopoID*>(&v28, *((const void **)a3 + 4), *((_QWORD *)a3 + 5), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 5) - *((_QWORD *)a3 + 4)) >> 3));
      v31 = 0;
      v32 = 0;
      v33 = 0;
      std::vector<TopoSubstring *>::__init_with_size[abi:ne180100]<TopoSubstring **,TopoSubstring **>(&v31, *((const void **)a3 + 7), *((_QWORD *)a3 + 8), (uint64_t)(*((_QWORD *)a3 + 8) - *((_QWORD *)a3 + 7)) >> 3);
      v34 = *((_QWORD *)a3 + 10);
      v21 = 0;
      uuid_clear(uu);
      v22 = 0;
      *(_OWORD *)v23 = 0u;
      *(_OWORD *)__p = 0u;
      v25 = 0u;
      v26 = 0;
      TopoSubstring::splitAt((TopoSubstring *)v27, *((_DWORD *)a4 + 5) - *((_DWORD *)a3 + 5), (TopoSubstring *)uu);
      -[CRTTMergeableStringDelta findAndCompareSubstring:from:toString:charMap:deltaCharMap:compareElements:](self, "findAndCompareSubstring:from:toString:charMap:deltaCharMap:compareElements:", v27, v15, v16, a7, a8, v17);
      -[CRTTMergeableStringDelta compareSubstring:toSubstring:fromString:toString:charMap:deltaCharMap:compareElements:](self, "compareSubstring:toSubstring:fromString:toString:charMap:deltaCharMap:compareElements:", uu, a4, v15, v16, a7, a8, v17);
    }
    else
    {
      *(_OWORD *)v27 = *(_OWORD *)a4;
      *(_OWORD *)&v27[12] = *(_OWORD *)((char *)a4 + 12);
      v29 = 0;
      v30 = 0;
      v28 = 0;
      std::vector<TopoID>::__init_with_size[abi:ne180100]<TopoID*,TopoID*>(&v28, *((const void **)a4 + 4), *((_QWORD *)a4 + 5), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a4 + 5) - *((_QWORD *)a4 + 4)) >> 3));
      v31 = 0;
      v32 = 0;
      v33 = 0;
      std::vector<TopoSubstring *>::__init_with_size[abi:ne180100]<TopoSubstring **,TopoSubstring **>(&v31, *((const void **)a4 + 7), *((_QWORD *)a4 + 8), (uint64_t)(*((_QWORD *)a4 + 8) - *((_QWORD *)a4 + 7)) >> 3);
      v34 = *((_QWORD *)a4 + 10);
      v21 = 0;
      uuid_clear(uu);
      v22 = 0;
      *(_OWORD *)v23 = 0u;
      *(_OWORD *)__p = 0u;
      v25 = 0u;
      v26 = 0;
      TopoSubstring::splitAt((TopoSubstring *)v27, *((_DWORD *)a3 + 5) - *((_DWORD *)a4 + 5), (TopoSubstring *)uu);
      -[CRTTMergeableStringDelta compareSubstring:toSubstring:fromString:toString:charMap:deltaCharMap:compareElements:](self, "compareSubstring:toSubstring:fromString:toString:charMap:deltaCharMap:compareElements:", a3, uu, v15, v16, a7, a8, v17);
    }
    if (__p[1])
    {
      *(void **)&v25 = __p[1];
      operator delete(__p[1]);
    }
    if (v23[0])
    {
      v23[1] = v23[0];
      operator delete(v23[0]);
    }
    if (v31)
    {
      v32 = v31;
      operator delete(v31);
    }
    if (v28)
    {
      v29 = v28;
      operator delete(v28);
    }
  }

}

- (id)dotDescription:(unint64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  TopoSubstring **begin;
  TopoSubstring *v12;
  BOOL isStartNode;
  const __CFString *v14;
  _BOOL4 isEndNode;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  __int128 *v21;
  __int128 *v22;
  __int128 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD *v28;
  _QWORD *v29;
  void *v31;
  CRTTMergeableStringDelta *v32;
  __CFString *v33;
  TopoSubstring **end;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[CRTTMergeableStringDelta fromVersion](self, "fromVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTTMergeableStringDelta version](self, "version");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("subgraph cluster_%ld%p_%ld from:%@ to:%@ {\n  rankdir=\"LR\";\n"),
    a3,
    self,
    a3,
    v6,
    v7);

  -[CRTTMergeableStringDelta attributedString](self, "attributedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\\n"));
  v10 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR("  label=\"'%@'\"\n"), v10);
  objc_msgSend(v5, "appendFormat:", CFSTR("  color=lightgrey;\n"));
  v31 = (void *)v10;
  begin = self->orderedSubstrings.__begin_;
  v32 = self;
  end = self->orderedSubstrings.__end_;
  if (begin != end)
  {
    while (1)
    {
      v12 = *begin;
      isStartNode = TopoSubstring::isStartNode(*begin);
      v14 = CFSTR("  N%ld%p [label=\"Start\"];\n");
      if (!isStartNode)
      {
        isEndNode = TopoSubstring::isEndNode(v12);
        v14 = CFSTR("  N%ld%p [label=\"End\"];\n");
        if (!isEndNode)
          break;
      }
      objc_msgSend(v5, "appendFormat:", v14, a3, v12);
LABEL_16:
      v28 = (_QWORD *)*((_QWORD *)v12 + 7);
      v29 = (_QWORD *)*((_QWORD *)v12 + 8);
      while (v28 != v29)
        objc_msgSend(v5, "appendFormat:", CFSTR("  N%ld%p -> N%ld%p;\n"), a3, v12, a3, *v28++);
      if (++begin == end)
        goto LABEL_20;
    }
    if (*((_DWORD *)v12 + 21) == -1)
    {
      v33 = &stru_1E77650F0;
      goto LABEL_12;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      -[CRTTMergeableStringStorage string](v32->_attributedString, "string");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "substringWithRange:", *((unsigned int *)v12 + 21), *((unsigned int *)v12 + 6));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%@"), v18);
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_opt_class();
      v33 = CFSTR("?");
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_12;
      v19 = (void *)MEMORY[0x1E0CB3940];
      -[CRTTMergeableStringStorage substringWithRange:](v32->_attributedString, "substringWithRange:", *((unsigned int *)v12 + 21), *((unsigned int *)v12 + 6));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("%@"), v17);
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

LABEL_12:
    v20 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v21 = (__int128 *)*((_QWORD *)v12 + 4);
    v22 = (__int128 *)*((_QWORD *)v12 + 5);
    while (v21 != v22)
    {
      v23 = *v21;
      v36 = *((_QWORD *)v21 + 2);
      v35 = v23;
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", &v35);
      objc_msgSend(v24, "CRTTShortDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "appendFormat:", CFSTR("%@.%d,%d "), v25, v36, HIDWORD(v36));

      v21 = (__int128 *)((char *)v21 + 24);
    }
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v12);
    objc_msgSend(v26, "CRTTShortDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  N%ld%p [label=\"%@ %@.%d,%d-%u (%@)\"];\n"),
      a3,
      v12,
      v33,
      v27,
      *((unsigned int *)v12 + 4),
      *((unsigned int *)v12 + 5),
      (*((_DWORD *)v12 + 5) + *((_DWORD *)v12 + 6) - 1),
      v20);

    goto LABEL_16;
  }
LABEL_20:
  objc_msgSend(v5, "appendString:", CFSTR("}\n"));

  return v5;
}

- (CRTTMergeableStringStorage)attributedString
{
  return self->_attributedString;
}

- (ObjCVersion)fromVersion
{
  return self->_fromVersion;
}

- (void)setFromVersion:(id)a3
{
  objc_storeStrong((id *)&self->_fromVersion, a3);
}

- (ObjCVersion)fromAddedByVersion
{
  return self->_fromAddedByVersion;
}

- (void)setFromAddedByVersion:(id)a3
{
  objc_storeStrong((id *)&self->_fromAddedByVersion, a3);
}

- (ObjCVersion)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (ObjCVersion)addedByVersion
{
  return self->_addedByVersion;
}

- (void)setAddedByVersion:(id)a3
{
  objc_storeStrong((id *)&self->_addedByVersion, a3);
}

- (int64_t)renameGeneration
{
  return self->_renameGeneration;
}

- (void)setRenameGeneration:(int64_t)a3
{
  self->_renameGeneration = a3;
}

- (void).cxx_destruct
{
  TopoSubstring **begin;

  objc_storeStrong((id *)&self->_addedByVersion, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_fromAddedByVersion, 0);
  objc_storeStrong((id *)&self->_fromVersion, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
  begin = self->orderedSubstrings.__begin_;
  if (begin)
  {
    self->orderedSubstrings.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

void __66__CRTTMergeableStringDelta_initWithDeltasTo_from_compareElements___block_invoke_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1BDD82000, MEMORY[0x1E0C81028], (os_log_type_t)0x90u, "Failed to generate mergeable string delta.", v0, 2u);
}

- (void)addSubstring:requiresExactLength:deltaCharMap:.cold.1()
{
  __assert_rtn("-[CRTTMergeableStringDelta addSubstring:requiresExactLength:deltaCharMap:]", "CRTTMergeableStringDelta.mm", 330, "newSubstring->addedBy.size() == 0 && newSubstring->children.size() == 0");
}

@end
