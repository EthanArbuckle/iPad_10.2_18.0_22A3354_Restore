@implementation MTLBinaryArchive

uint64_t __82___MTLBinaryArchive_MTLBinaryArchiveInternal__getBinaryDataForKey_reflectionType___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  _QWORD v6[4];
  uint64_t v7;
  _QWORD v8[5];

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 376), "objectForKey:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    result = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(result + 60))
      return result;
    result = objc_msgSend((id)result, "updateReflectionForEntry:binaryKey:requiredReflection:");
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if ((result & 1) == 0)
    {
      *(_QWORD *)(v3 + 40) = 0;
      return result;
    }
    if (*(_QWORD *)(v3 + 40))
      return result;
  }
  v4 = *(_BYTE **)(a1 + 32);
  if (v4[60])
  {
    v5 = objc_msgSend(*(id *)(a1 + 40), "value");
    v7 = *(_QWORD *)(a1 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __82___MTLBinaryArchive_MTLBinaryArchiveInternal__getBinaryDataForKey_reflectionType___block_invoke_2;
    v8[3] = &unk_1E0FE2C90;
    v8[4] = v7;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __82___MTLBinaryArchive_MTLBinaryArchiveInternal__getBinaryDataForKey_reflectionType___block_invoke_3;
    v6[3] = &unk_1E0FE2CB8;
    result = objc_msgSend(v4, "materializeEntryForKey:fileIndex:containsEntry:addEntry:", v5, v7 + 288, v8, v6);
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "materializeAIRNTBlockForKey:reflectionType:", *(_QWORD *)(a1 + 40), *(char *)(a1 + 56));
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  return result;
}

void __54___MTLBinaryArchive_initWithOptions_device_url_error___block_invoke()
{
  _BOOL4 v0;
  int v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (_MTLIsInternalBuild())
    v0 = MTLGetEnvDefault("MTL_DEBUG_PRINT_BINARY_ARCHIVE_URL_LOAD_ERRORS", 0) != 0;
  else
    v0 = 0;
  v1 = v0 | -[_MTLBinaryArchive initWithOptions:device:url:error:]::shouldPrintBinaryArchiveLoadFromURL;
  -[_MTLBinaryArchive initWithOptions:device:url:error:]::shouldPrintBinaryArchiveLoadFromURL = v1;
  if (v1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v2 = 136315138;
      v3 = "MTL_DEBUG_PRINT_BINARY_ARCHIVE_URL_LOAD_ERRORS";
      _os_log_impl(&dword_182636000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s was set, printing errors/faults from loading from URL.", (uint8_t *)&v2, 0xCu);
    }
  }
}

uint64_t __51___MTLBinaryArchive_archiveTypeAtURL_device_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 40) + a2;
  if (v4 + a3 <= (unint64_t)objc_msgSend(*(id *)(a1 + 32), "length"))
    return objc_msgSend(*(id *)(a1 + 32), "bytes") + v4;
  else
    return 0;
}

uint64_t __39___MTLBinaryArchive_loadFromURL_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 40) + a2;
  if (v4 + a3 <= (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "length"))
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "bytes") + v4;
  else
    return 0;
}

uint64_t __52___MTLBinaryArchive_materializeFromFileOffset_hash___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _OWORD *v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = (_OWORD *)a1[9];
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a1[8] + a4;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a5;
  v6 = *(_OWORD *)(a3 + 24);
  *v5 = *(_OWORD *)(a3 + 8);
  v5[1] = v6;
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(_QWORD *)(a3 + 64);
  *(_QWORD *)(a3 + 64) = *(_QWORD *)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v8;
  v9 = *(_QWORD *)(a1[7] + 8);
  v10 = *(_QWORD *)(a3 + 72);
  *(_QWORD *)(a3 + 72) = *(_QWORD *)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v10;
  return 1;
}

uint64_t __52___MTLBinaryArchive_materializeFromFileOffset_hash___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 40) + a2;
  if (v4 + a3 <= (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "length"))
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "bytes") + v4;
  else
    return 0;
}

void __42___MTLBinaryArchive_formattedDescription___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __CFString *v3;
  void *v4;
  id v5;
  const __CFString *v6;
  objc_super v7;
  _QWORD v8[7];

  v8[6] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", *(_QWORD *)(a1 + 48) + 4, CFSTR(" "), 0);
  v3 = (__CFString *)objc_msgSend(*(id *)(a1 + 32), "retainedLabel");
  v4 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)_MTLBinaryArchive;
  v5 = objc_msgSendSuper2(&v7, sel_description);
  v8[0] = v2;
  v8[1] = CFSTR("label =");
  v6 = CFSTR("<none>");
  if (v3)
    v6 = v3;
  v8[2] = v6;
  v8[3] = v2;
  v8[4] = CFSTR("count =");
  v8[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304) + objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 376), "count"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%@"), v5, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 6), "componentsJoinedByString:", CFSTR(" ")));

}

uint64_t __63___MTLBinaryArchive_getSpecializedFunctionArchivesToSerialize___block_invoke(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6;
  __int128 v7;
  char v8;
  _OWORD v10[2];
  NSObject *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (std::__hash_table<HashKey,KeyHashFunction,std::equal_to<HashKey>,std::allocator<HashKey>>::find<HashKey>(*(_QWORD **)(a1 + 32), (unint64_t *)a2)|| (v6 = *(_QWORD *)(a1 + 32), v7 = *(_OWORD *)(a2 + 16), v10[0] = *(_OWORD *)a2, v10[1] = v7, v11 = a3, std::__hash_table<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<MTLUINT256_t,std::pair<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>>(v6, (unint64_t *)v10, (uint64_t)v10), (v8 & 1) == 0))
  {
    dispatch_release(a3);
  }
  return 1;
}

void __55___MTLBinaryArchive_airntSerializeToURL_options_error___block_invoke(uint64_t a1)
{
  int64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  __int128 v5;
  NSObject *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t *v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  _QWORD v38[10];
  __int128 v39;
  uint64_t v40;
  _QWORD *v41;
  std::__shared_weak_count *v42;
  uint64_t v43;
  std::__shared_weak_count *v44;
  _QWORD *v45;
  std::__shared_weak_count *v46;
  _QWORD block[4];
  __int128 v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t *v52;
  __int128 v53;
  _QWORD *v54;
  std::__shared_weak_count *v55;
  int64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  __n128 (*v60)(__n128 *, __n128 *);
  void (*v61)(uint64_t);
  void *v62;
  void *__p;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  char v76;
  _QWORD *v77;
  std::__shared_weak_count *v78;

  v2 = +[MTLLoader sliceIDForDevice:andDriverVersion:]((uint64_t)MTLLoader, *(void **)(*(_QWORD *)(a1 + 32) + 24), 0);
  v3 = (std::__shared_weak_count *)operator new(0x30uLL);
  v3->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v3->__shared_owners_;
  v3->__shared_weak_owners_ = 0;
  v3[1].__vftable = 0;
  v3->__vftable = (std::__shared_weak_count_vtbl *)&off_1E0FDF460;
  v3[1].__shared_owners_ = 0;
  v3[1].__shared_weak_owners_ = 0;
  v77 = &v3[1].__vftable;
  v78 = v3;
  v73 = 0;
  v74 = &v73;
  v75 = 0x2020000000;
  v76 = 0;
  v69 = 0;
  v70 = &v69;
  v71 = 0x2020000000;
  v72 = 0;
  v66 = 0;
  v67 = 0;
  v68 = 0;
  v57 = 0;
  v58 = &v57;
  v59 = 0x4812000000;
  v60 = __Block_byref_object_copy__172;
  v61 = __Block_byref_object_dispose__173;
  v62 = &unk_182827312;
  __p = 0;
  v64 = 0;
  v65 = 0;
  v5 = *(_OWORD *)(a1 + 32);
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3321888768;
  block[2] = __55___MTLBinaryArchive_airntSerializeToURL_options_error___block_invoke_175;
  block[3] = &unk_1E0FDF660;
  v48 = v5;
  v56 = v2;
  v49 = &v73;
  v54 = &v3[1].__vftable;
  v55 = v3;
  do
    v8 = __ldxr(p_shared_owners);
  while (__stxr(v8 + 1, p_shared_owners));
  v9 = *(_QWORD *)(a1 + 48);
  v50 = &v57;
  v51 = v9;
  v52 = &v69;
  v53 = *(_OWORD *)(a1 + 56);
  dispatch_sync(v6, block);
  if (!*((_BYTE *)v74 + 24))
  {
    v16 = objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v17 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "path"), "stringByDeletingLastPathComponent");
    v18 = objc_msgSend(v17, "stringByAppendingFormat:", CFSTR("/%@.metallib"), objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString"));
    v19 = (v58[7] - v58[6]) >> 3;
    v66 = v58[6];
    v67 = v19;
    v68 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v20 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "compiler");
    v21 = v70[3];
    v45 = &v3[1].__vftable;
    v46 = v3;
    do
      v22 = __ldxr(p_shared_owners);
    while (__stxr(v22 + 1, p_shared_owners));
    v23 = (uint64_t *)(*(_QWORD *)(a1 + 32) + 704);
    v43 = *v23;
    v24 = (std::__shared_weak_count *)v23[1];
    v44 = v24;
    if (v24)
    {
      v25 = (unint64_t *)&v24->__shared_owners_;
      do
        v26 = __ldxr(v25);
      while (__stxr(v26 + 1, v25));
    }
    v38[0] = v7;
    v38[1] = 3321888768;
    v38[2] = __55___MTLBinaryArchive_airntSerializeToURL_options_error___block_invoke_183;
    v38[3] = &unk_1E0FDF628;
    v38[8] = &v69;
    v41 = &v3[1].__vftable;
    v42 = v3;
    do
      v27 = __ldxr(p_shared_owners);
    while (__stxr(v27 + 1, p_shared_owners));
    v38[9] = &v57;
    v28 = *(_QWORD *)(a1 + 40);
    v38[4] = *(_QWORD *)(a1 + 32);
    v38[5] = v16;
    v38[6] = v28;
    v38[7] = v18;
    v39 = *(_OWORD *)(a1 + 56);
    v40 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v20, "generateMachOWithID:binaryEntries:machOSpecializedData:machOType:Path:platform:bitcodeList:completionHandler:", v21, &v45, &v66, 0, v18, (v2 << 32) | (v2 >> 32), &v43, v38);
    v29 = v44;
    if (v44)
    {
      v30 = (unint64_t *)&v44->__shared_owners_;
      do
        v31 = __ldaxr(v30);
      while (__stlxr(v31 - 1, v30));
      if (!v31)
      {
        ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
        std::__shared_weak_count::__release_weak(v29);
      }
    }
    v32 = v46;
    if (v46)
    {
      v33 = (unint64_t *)&v46->__shared_owners_;
      do
        v34 = __ldaxr(v33);
      while (__stlxr(v34 - 1, v33));
      if (!v34)
      {
        ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
        std::__shared_weak_count::__release_weak(v32);
      }
    }
    v35 = v42;
    if (v42)
    {
      v36 = (unint64_t *)&v42->__shared_owners_;
      do
        v37 = __ldaxr(v36);
      while (__stlxr(v37 - 1, v36));
      if (!v37)
      {
        ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
        std::__shared_weak_count::__release_weak(v35);
      }
    }
  }
  v10 = v55;
  if (v55)
  {
    v11 = (unint64_t *)&v55->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  _Block_object_dispose(&v57, 8);
  if (__p)
  {
    v64 = __p;
    operator delete(__p);
  }
  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v73, 8);
  v13 = v78;
  if (v78)
  {
    v14 = (unint64_t *)&v78->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
}

id __55___MTLBinaryArchive_airntSerializeToURL_options_error___block_invoke_175(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  id result;
  BOOL v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  void *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  void *v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  unsigned int **v26;
  unsigned int **v27;
  unsigned int *v28;
  unint64_t v29;
  uint64_t v30;
  unsigned int v31;
  unsigned int v32;
  unint64_t v33;
  uint64_t v34;
  unsigned int v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unsigned int v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint8x8_t v66;
  _QWORD *v67;
  _QWORD *i;
  unint64_t v69;
  uint64_t v70;
  int v71;
  unsigned int v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  float v76;
  _BOOL4 v77;
  unint64_t v78;
  unint64_t v79;
  int8x8_t prime;
  void *v81;
  void *v82;
  uint64_t v83;
  _QWORD **v84;
  unint64_t v85;
  uint8x8_t v86;
  unint64_t v87;
  uint8x8_t v88;
  uint64_t v89;
  _QWORD *j;
  unint64_t v91;
  _QWORD *v92;
  _QWORD *v93;
  unint64_t v94;
  unsigned int **v95;
  unint64_t v96;
  _QWORD *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  char *v103;
  char *v104;
  char *v105;
  char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  void *__p[2];
  __int128 v112;
  float v113;
  uint64_t v114;
  std::__shared_weak_count *v115;
  uint64_t v116;
  std::__shared_weak_count *v117;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = 392;
  v4 = (void *)v2[49];
  if (v4)
  {
    result = (id)objc_msgSend(v4, "isEqualToString:", objc_msgSend(*(id *)(a1 + 40), "absoluteString"));
    v2 = *(_QWORD **)(a1 + 32);
  }
  else
  {
    result = 0;
  }
  v6 = v2[40] == v2[39] && v2[111] == 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6;
  v7 = *(_QWORD **)(a1 + 32);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v7[28] != v7[27];
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224);
    if (v8 == v9)
      v10 = 1;
    else
      v10 = (char)result;
    if ((v10 & 1) == 0)
    {
      v11 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      result = (id)objc_msgSend(v11, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", *(_QWORD *)(a1 + 40), objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 392)), 0, 0, 0, *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = (_BYTE)result;
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224);
    }
    if (v8 == v9)
    {
      result = newErrorWithMessage(CFSTR("Nothing to serialize"), MTLBinaryArchiveErrorCompilationFailure);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40) = result;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
    }
    return result;
  }
  v12 = *(std::__shared_weak_count **)(a1 + 104);
  v116 = *(_QWORD *)(a1 + 96);
  v117 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v14 = __ldxr(p_shared_owners);
    while (__stxr(v14 + 1, p_shared_owners));
  }
  objc_msgSend(v7, "materializeAirNTAllForSlice:entryList:", a1 + 112, &v116);
  v15 = v117;
  if (v117)
  {
    v16 = (unint64_t *)&v117->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  v18 = *(void **)(a1 + 32);
  v19 = *(std::__shared_weak_count **)(a1 + 104);
  v114 = *(_QWORD *)(a1 + 96);
  v115 = v19;
  if (v19)
  {
    v20 = (unint64_t *)&v19->__shared_owners_;
    do
      v21 = __ldxr(v20);
    while (__stxr(v21 + 1, v20));
  }
  objc_msgSend(v18, "materializeAirNTFromOnlineForSlice:entryList:", a1 + 112, &v114);
  v22 = v115;
  if (v115)
  {
    v23 = (unint64_t *)&v115->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  v25 = *(_QWORD *)(a1 + 32);
  *(_OWORD *)__p = 0u;
  v112 = 0u;
  v113 = 1.0;
  v26 = *(unsigned int ***)(v25 + 264);
  v27 = *(unsigned int ***)(v25 + 272);
  if (v26 != v27)
  {
    v110 = v25;
    while (1)
    {
      v28 = *v26;
      v29 = **v26;
      switch((int)v29)
      {
        case 0:
          v30 = *((unsigned __int8 *)v28 + 32);
          if ((v30 & 0xA) == 0)
          {
            v31 = v28[2];
            if (v31 != -1)
              v28[2] = *(_DWORD *)(v110 + 56) + v31;
          }
          if ((v30 & 9) == 0)
          {
            v32 = v28[4];
            if (v32 != -1)
              v28[4] = *(_DWORD *)(v110 + 56) + v32;
          }
          if ((v30 & 2) != 0)
          {
            v55 = *((_QWORD *)v28 + 1);
            v56 = HIDWORD(v55);
            v57 = 0x9DDFEA08EB382D69 * (((8 * v55) + 8) ^ HIDWORD(v55));
            v33 = 0x9DDFEA08EB382D69
                * ((0x9DDFEA08EB382D69 * (v56 ^ (v57 >> 47) ^ v57)) ^ ((0x9DDFEA08EB382D69
                                                                        * (v56 ^ (v57 >> 47) ^ v57)) >> 47));
          }
          else
          {
            v33 = v28[2];
          }
          v58 = ((v29 << 6) + 2654435769u + (v29 >> 2) + (v30 & 0xFFFFFFFFFFFFFFF7)) ^ v29;
          v36 = ((v58 << 6) + 2654435769u + (v58 >> 2) + v33) ^ v58;
          if ((v30 & 1) != 0)
          {
            v54 = *((_QWORD *)v28 + 2);
            goto LABEL_74;
          }
          v37 = v28[4];
          goto LABEL_75;
        case 1:
          v47 = *((unsigned __int8 *)v28 + 32);
          if ((v47 & 0xA) == 0)
          {
            v48 = v28[2];
            if (v48 != -1)
              v28[2] = *(_DWORD *)(v110 + 56) + v48;
          }
          v36 = ((v29 << 6) + 2654435769u + (v29 >> 2) + (v47 & 0xFFFFFFFFFFFFFFF7)) ^ v29;
          if ((v47 & 2) != 0)
          {
            v59 = *((_QWORD *)v28 + 1);
            v60 = HIDWORD(v59);
            v61 = 0x9DDFEA08EB382D69 * (((8 * v59) + 8) ^ HIDWORD(v59));
            v37 = 0x9DDFEA08EB382D69
                * ((0x9DDFEA08EB382D69 * (v60 ^ (v61 >> 47) ^ v61)) ^ ((0x9DDFEA08EB382D69
                                                                        * (v60 ^ (v61 >> 47) ^ v61)) >> 47));
          }
          else
          {
            v37 = v28[2];
          }
          goto LABEL_75;
        case 2:
          v34 = *((unsigned __int8 *)v28 + 32);
          if ((v34 & 0xA) == 0)
          {
            v35 = v28[2];
            if (v35 != -1)
              v28[2] = *(_DWORD *)(v110 + 56) + v35;
          }
          v36 = ((v29 << 6) + 2654435769u + (v29 >> 2) + (v34 & 0xFFFFFFFFFFFFFFF7)) ^ v29;
          if ((v34 & 2) != 0)
            goto LABEL_68;
          goto LABEL_46;
        case 3:
          v38 = *((unsigned __int8 *)v28 + 32);
          if ((v38 & 0xA) == 0)
          {
            v39 = v28[4];
            if (v39 != -1)
              v28[4] = *(_DWORD *)(v110 + 56) + v39;
          }
          if ((v38 & 9) == 0)
          {
            v40 = v28[6];
            if (v40 != -1)
              v28[6] = *(_DWORD *)(v110 + 56) + v40;
          }
          if ((v38 & 0xC) == 0)
          {
            v41 = v28[2];
            if (v41 != -1)
              v28[2] = *(_DWORD *)(v110 + 56) + v41;
          }
          if ((v38 & 2) != 0)
          {
            v49 = *((_QWORD *)v28 + 2);
            v50 = HIDWORD(v49);
            v51 = 0x9DDFEA08EB382D69 * (((8 * v49) + 8) ^ HIDWORD(v49));
            v42 = 0x9DDFEA08EB382D69
                * ((0x9DDFEA08EB382D69 * (v50 ^ (v51 >> 47) ^ v51)) ^ ((0x9DDFEA08EB382D69
                                                                        * (v50 ^ (v51 >> 47) ^ v51)) >> 47));
            if ((v38 & 1) != 0)
            {
LABEL_58:
              v43 = *((_QWORD *)v28 + 3);
              v44 = HIDWORD(v43);
              v45 = 0x9DDFEA08EB382D69 * (((8 * v43) + 8) ^ HIDWORD(v43));
              v46 = 0x9DDFEA08EB382D69
                  * ((0x9DDFEA08EB382D69 * (v44 ^ (v45 >> 47) ^ v45)) ^ ((0x9DDFEA08EB382D69
                                                                          * (v44 ^ (v45 >> 47) ^ v45)) >> 47));
              goto LABEL_67;
            }
          }
          else
          {
            v42 = v28[4];
            if ((v38 & 1) != 0)
              goto LABEL_58;
          }
          v46 = v28[6];
LABEL_67:
          v52 = ((v29 << 6) + 2654435769u + (v29 >> 2) + (v38 & 0xFFFFFFFFFFFFFFF7)) ^ v29;
          v53 = ((v52 << 6) + 2654435769u + (v52 >> 2) + v42) ^ v52;
          v36 = ((v53 << 6) + 2654435769u + (v53 >> 2) + v46) ^ v53;
          if ((v38 & 4) != 0)
          {
LABEL_68:
            v54 = *((_QWORD *)v28 + 1);
LABEL_74:
            v62 = HIDWORD(v54);
            v63 = 0x9DDFEA08EB382D69 * (((8 * v54) + 8) ^ HIDWORD(v54));
            v37 = 0x9DDFEA08EB382D69
                * ((0x9DDFEA08EB382D69 * (v62 ^ (v63 >> 47) ^ v63)) ^ ((0x9DDFEA08EB382D69
                                                                        * (v62 ^ (v63 >> 47) ^ v63)) >> 47));
          }
          else
          {
LABEL_46:
            v37 = v28[2];
          }
LABEL_75:
          v64 = ((v36 << 6) + 2654435769u + (v36 >> 2) + v37) ^ v36;
          v65 = (unint64_t)__p[1];
          if (__p[1])
          {
            v66 = (uint8x8_t)vcnt_s8((int8x8_t)__p[1]);
            v66.i16[0] = vaddlv_u8(v66);
            if (v66.u32[0] > 1uLL)
            {
              v3 = ((v36 << 6) + 2654435769u + (v36 >> 2) + v37) ^ v36;
              if ((void *)v64 >= __p[1])
                v3 = v64 % (unint64_t)__p[1];
            }
            else
            {
              v3 = ((unint64_t)__p[1] - 1) & v64;
            }
            v67 = (_QWORD *)*((_QWORD *)__p[0] + v3);
            if (v67)
            {
              for (i = (_QWORD *)*v67; i; i = (_QWORD *)*i)
              {
                v69 = i[1];
                if (v69 == v64)
                {
                  v70 = i[2];
                  if (*(_DWORD *)v70 == (_DWORD)v29)
                  {
                    switch((int)v29)
                    {
                      case 0:
                        if ((*(_BYTE *)(v70 + 32) & 2) != 0)
                        {
                          if (*(_QWORD *)(v70 + 8) != *((_QWORD *)v28 + 1))
                            continue;
                        }
                        else if (*(_DWORD *)(v70 + 8) != v28[2])
                        {
                          continue;
                        }
                        if ((*(_BYTE *)(v70 + 32) & 1) == 0)
                        {
                          v71 = *(_DWORD *)(v70 + 16);
                          v72 = v28[4];
LABEL_87:
                          if (v71 == v72)
                            goto LABEL_114;
                          continue;
                        }
                        v73 = *(_QWORD *)(v70 + 16);
                        v74 = *((_QWORD *)v28 + 2);
LABEL_113:
                        if (v73 == v74)
                        {
LABEL_114:
                          MEMORY[0x186DABFBC](v28, 0x1022C405FDF33A9);
                          goto LABEL_187;
                        }
                        break;
                      case 1:
                      case 2:
                        if ((*(_BYTE *)(v70 + 32) & 2) == 0)
                          goto LABEL_86;
                        goto LABEL_112;
                      case 3:
                        if ((*(_BYTE *)(v70 + 32) & 2) != 0)
                        {
                          if (*(_QWORD *)(v70 + 16) != *((_QWORD *)v28 + 2))
                            continue;
                        }
                        else if (*(_DWORD *)(v70 + 16) != v28[4])
                        {
                          continue;
                        }
                        if ((*(_BYTE *)(v70 + 32) & 1) != 0)
                        {
                          if (*(_QWORD *)(v70 + 24) != *((_QWORD *)v28 + 3))
                            continue;
                        }
                        else if (*(_DWORD *)(v70 + 24) != v28[6])
                        {
                          continue;
                        }
                        if ((*(_BYTE *)(v70 + 32) & 4) == 0)
                        {
LABEL_86:
                          v71 = *(_DWORD *)(v70 + 8);
                          v72 = v28[2];
                          goto LABEL_87;
                        }
LABEL_112:
                        v73 = *(_QWORD *)(v70 + 8);
                        v74 = *((_QWORD *)v28 + 1);
                        goto LABEL_113;
                      default:
                        continue;
                    }
                  }
                }
                else
                {
                  if (v66.u32[0] > 1uLL)
                  {
                    if ((void *)v69 >= __p[1])
                      v69 %= (unint64_t)__p[1];
                  }
                  else
                  {
                    v69 &= (unint64_t)__p[1] - 1;
                  }
                  if (v69 != v3)
                    break;
                }
              }
            }
          }
          v75 = operator new(0x18uLL);
          *v75 = 0;
          v75[1] = v64;
          v75[2] = v28;
          v76 = (float)(unint64_t)(*((_QWORD *)&v112 + 1) + 1);
          if (v65 && (float)(v113 * (float)v65) >= v76)
            goto LABEL_161;
          v77 = (v65 & (v65 - 1)) == 0;
          if (v65 < 3)
            v77 = 0;
          v78 = (2 * v65) | !v77;
          v79 = vcvtps_u32_f32(v76 / v113);
          if (v78 <= v79)
            prime = (int8x8_t)v79;
          else
            prime = (int8x8_t)v78;
          if (*(_QWORD *)&prime == 1)
          {
            prime = (int8x8_t)2;
          }
          else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
          {
            prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
            v65 = (unint64_t)__p[1];
          }
          if (*(_QWORD *)&prime > v65)
            goto LABEL_127;
          if (*(_QWORD *)&prime >= v65)
            goto LABEL_156;
          v87 = vcvtps_u32_f32((float)*((unint64_t *)&v112 + 1) / v113);
          if (v65 < 3 || (v88 = (uint8x8_t)vcnt_s8((int8x8_t)v65), v88.i16[0] = vaddlv_u8(v88), v88.u32[0] > 1uLL))
          {
            v87 = std::__next_prime(v87);
          }
          else
          {
            v89 = 1 << -(char)__clz(v87 - 1);
            if (v87 >= 2)
              v87 = v89;
          }
          if (*(_QWORD *)&prime <= v87)
            prime = (int8x8_t)v87;
          if (*(_QWORD *)&prime >= v65)
          {
            v65 = (unint64_t)__p[1];
          }
          else
          {
            if (!*(_QWORD *)&prime)
            {
              v108 = __p[0];
              __p[0] = 0;
              if (v108)
                operator delete(v108);
              v65 = 0;
              __p[1] = 0;
              goto LABEL_156;
            }
LABEL_127:
            if (*(_QWORD *)&prime >> 61)
              std::__throw_bad_array_new_length[abi:ne180100]();
            v81 = operator new(8 * *(_QWORD *)&prime);
            v82 = __p[0];
            __p[0] = v81;
            if (v82)
              operator delete(v82);
            v83 = 0;
            __p[1] = (void *)prime;
            do
              *((_QWORD *)__p[0] + v83++) = 0;
            while (*(_QWORD *)&prime != v83);
            v84 = (_QWORD **)v112;
            if ((_QWORD)v112)
            {
              v85 = *(_QWORD *)(v112 + 8);
              v86 = (uint8x8_t)vcnt_s8(prime);
              v86.i16[0] = vaddlv_u8(v86);
              if (v86.u32[0] > 1uLL)
              {
                if (v85 >= *(_QWORD *)&prime)
                  v85 %= *(_QWORD *)&prime;
              }
              else
              {
                v85 &= *(_QWORD *)&prime - 1;
              }
              *((_QWORD *)__p[0] + v85) = &v112;
              for (j = *v84; j; v85 = v91)
              {
                v91 = j[1];
                if (v86.u32[0] > 1uLL)
                {
                  if (v91 >= *(_QWORD *)&prime)
                    v91 %= *(_QWORD *)&prime;
                }
                else
                {
                  v91 &= *(_QWORD *)&prime - 1;
                }
                if (v91 != v85)
                {
                  if (!*((_QWORD *)__p[0] + v91))
                  {
                    *((_QWORD *)__p[0] + v91) = v84;
                    goto LABEL_152;
                  }
                  *v84 = (_QWORD *)*j;
                  *j = **((_QWORD **)__p[0] + v91);
                  **((_QWORD **)__p[0] + v91) = j;
                  j = v84;
                }
                v91 = v85;
LABEL_152:
                v84 = (_QWORD **)j;
                j = (_QWORD *)*j;
              }
            }
            v65 = (unint64_t)prime;
          }
LABEL_156:
          if ((v65 & (v65 - 1)) != 0)
          {
            if (v64 >= v65)
              v3 = v64 % v65;
            else
              v3 = v64;
          }
          else
          {
            v3 = (v65 - 1) & v64;
          }
LABEL_161:
          v92 = __p[0];
          v93 = (_QWORD *)*((_QWORD *)__p[0] + v3);
          if (v93)
          {
            *v75 = *v93;
          }
          else
          {
            *v75 = v112;
            *(_QWORD *)&v112 = v75;
            v92[v3] = &v112;
            if (!*v75)
              goto LABEL_170;
            v94 = *(_QWORD *)(*v75 + 8);
            if ((v65 & (v65 - 1)) != 0)
            {
              if (v94 >= v65)
                v94 %= v65;
            }
            else
            {
              v94 &= v65 - 1;
            }
            v93 = (char *)__p[0] + 8 * v94;
          }
          *v93 = v75;
LABEL_170:
          ++*((_QWORD *)&v112 + 1);
          v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v95 = *(unsigned int ***)(v3 + 56);
          v96 = *(_QWORD *)(v3 + 64);
          if ((unint64_t)v95 >= v96)
          {
            v98 = *(_QWORD *)(v3 + 48);
            v99 = ((uint64_t)v95 - v98) >> 3;
            if ((unint64_t)(v99 + 1) >> 61)
              std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
            v100 = v96 - v98;
            v101 = v100 >> 2;
            if (v100 >> 2 <= (unint64_t)(v99 + 1))
              v101 = v99 + 1;
            if ((unint64_t)v100 >= 0x7FFFFFFFFFFFFFF8)
              v102 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v102 = v101;
            if (v102)
              v103 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>(v3 + 64, v102);
            else
              v103 = 0;
            v104 = &v103[8 * v99];
            *(_QWORD *)v104 = v28;
            v97 = v104 + 8;
            v106 = *(char **)(v3 + 48);
            v105 = *(char **)(v3 + 56);
            if (v105 != v106)
            {
              do
              {
                v107 = *((_QWORD *)v105 - 1);
                v105 -= 8;
                *((_QWORD *)v104 - 1) = v107;
                v104 -= 8;
              }
              while (v105 != v106);
              v105 = *(char **)(v3 + 48);
            }
            *(_QWORD *)(v3 + 48) = v104;
            *(_QWORD *)(v3 + 56) = v97;
            *(_QWORD *)(v3 + 64) = &v103[8 * v102];
            if (v105)
              operator delete(v105);
          }
          else
          {
            *v95 = v28;
            v97 = v95 + 1;
          }
          *(_QWORD *)(v3 + 56) = v97;
LABEL_187:
          if (++v26 == v27)
          {
            v25 = *(_QWORD *)(a1 + 32);
            goto LABEL_198;
          }
          break;
        default:
          v37 = (_BYTE)v28[8] & 0xF7;
          v36 = **v26;
          goto LABEL_75;
      }
    }
  }
LABEL_198:
  std::__hash_table<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,std::__unordered_map_hasher<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::__unordered_map_equal<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::allocator<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>>>::clear(v25 + 648);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = MTLMetalScriptBuilder::newSerializedMetalScript(*(MTLMetalScriptBuilder **)(*(_QWORD *)(a1 + 32) + 696));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 888) = 0;
  v109 = *(const char **)(*(_QWORD *)(a1 + 32) + 64);
  if (v109)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = strdup(v109);
    free(*(void **)(*(_QWORD *)(a1 + 32) + 64));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = 0;
  }
  return (id)std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)__p);
}

void __55___MTLBinaryArchive_airntSerializeToURL_options_error___block_invoke_183(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  MTLHashKey *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD block[4];
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  if (v4)
    free(v4);
  v5 = *(uint64_t **)(a1 + 104);
  v6 = *v5;
  if (v5[1] != *v5)
  {
    v7 = 0;
    v8 = 0;
    do
    {
      v9 = *(NSObject **)(v6 + v7 + 32);
      if (v9)
        dispatch_release(v9);
      v10 = *(NSObject **)(v6 + v7 + 16);
      if (v10)
        dispatch_release(v10);
      v11 = *(NSObject **)(v6 + v7 + 24);
      if (v11)
        dispatch_release(v11);
      v12 = *(NSObject **)(v6 + v7 + 40);
      if (v12)
        dispatch_release(v12);
      v13 = *(MTLHashKey **)(v6 + v7 + 8);
      if (v13)
      {
        MTLHashKey::~MTLHashKey(v13);
        MEMORY[0x186DABFBC]();
      }
      ++v8;
      v14 = *(uint64_t **)(a1 + 104);
      v6 = *v14;
      v7 += 72;
    }
    while (v8 < 0x8E38E38E38E38E39 * ((v14[1] - *v14) >> 3));
  }
  v15 = *(_QWORD *)(a1 + 72);
  v16 = *(_QWORD *)(v15 + 8);
  v17 = *(_QWORD *)(v16 + 56);
  if (v17 != *(_QWORD *)(v16 + 48))
  {
    v18 = 0;
    v17 = *(_QWORD *)(v16 + 48);
    do
    {
      v19 = *(_QWORD *)(v17 + 8 * v18);
      if (v19)
      {
        MEMORY[0x186DABFBC](v19, 0x1022C405FDF33A9);
        v15 = *(_QWORD *)(a1 + 72);
      }
      ++v18;
      v16 = *(_QWORD *)(v15 + 8);
      v17 = *(_QWORD *)(v16 + 48);
    }
    while (v18 < (*(_QWORD *)(v16 + 56) - v17) >> 3);
  }
  *(_QWORD *)(v16 + 56) = v17;
  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(NSObject **)(v20 + 80);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55___MTLBinaryArchive_airntSerializeToURL_options_error___block_invoke_2;
  block[3] = &unk_1E0FE29F0;
  v26 = *(_OWORD *)(a1 + 40);
  v22 = *(_QWORD *)(a1 + 56);
  v29 = *(_OWORD *)(a1 + 80);
  v23 = *(_QWORD *)(a1 + 96);
  v27 = v22;
  v28 = v20;
  v24 = *(_QWORD *)(a1 + 72);
  v30 = v23;
  v31 = v24;
  v32 = a2;
  dispatch_sync(v21, block);
}

void __55___MTLBinaryArchive_airntSerializeToURL_options_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  const std::__fs::filesystem::path *v7;
  std::error_code *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  MTLAirNTObject *v12;
  uint64_t v13;
  MTLLoadedFile *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  char *v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t *i;
  uint64_t v36;
  void **v37;
  _QWORD *v38;
  unint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char *v45;
  char *v46;
  char *v47;
  char *v48;
  uint64_t v49;
  void *v50;

  v2 = *(_QWORD *)(a1 + 96);
  if (*(_QWORD *)v2)
  {
    v3 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    if (v3)
    {
      dispatch_release(v3);
      v2 = *(_QWORD *)(a1 + 96);
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = newErrorWithMessage(*(NSString **)(v2 + 8), MTLBinaryArchiveErrorCompilationFailure);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", *(_QWORD *)(a1 + 40), objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", *(_QWORD *)(a1 + 48), 0), 0, 0, 0, *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 56);
      v6 = *(NSObject **)(v5 + 640);
      if (v6)
      {
        dispatch_release(v6);
        v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
        v5 = *(_QWORD *)(a1 + 56);
      }
      *(_QWORD *)(v5 + 640) = v4;
    }
  }
  v7 = (const std::__fs::filesystem::path *)objc_msgSend(*(id *)(a1 + 48), "UTF8String");
  remove(v7, v8);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 376), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 376), "addEntriesFromDictionary:", *(_QWORD *)(*(_QWORD *)(a1 + 56) + 384));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 384), "removeAllObjects");
  std::__hash_table<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,std::__unordered_map_hasher<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::__unordered_map_equal<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::allocator<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>>>::clear(*(_QWORD *)(a1 + 56) + 96);
  v9 = *(_QWORD *)(a1 + 56);
  v10 = *(_QWORD *)(v9 + 224);
  if (v10 != *(_QWORD *)(v9 + 216))
  {
    v11 = 0;
    v10 = *(_QWORD *)(v9 + 216);
    do
    {
      v12 = *(MTLAirNTObject **)(v10 + 8 * v11);
      if (v12)
      {
        MTLAirNTObject::~MTLAirNTObject(v12);
        MEMORY[0x186DABFBC]();
        v9 = *(_QWORD *)(a1 + 56);
      }
      ++v11;
      v10 = *(_QWORD *)(v9 + 216);
    }
    while (v11 < (*(_QWORD *)(v9 + 224) - v10) >> 3);
  }
  *(_QWORD *)(v9 + 224) = v10;
  *(_QWORD *)(*(_QWORD *)(a1 + 56) + 248) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 240);
  objc_msgSend(*(id *)(a1 + 56), "clearLibCache");
  v13 = *(_QWORD *)(a1 + 56);
  v14 = *(MTLLoadedFile **)(v13 + 40);
  if (v14)
  {
    -[MTLLoader releaseLoadedFile:](*(_QWORD *)(*(_QWORD *)(v13 + 24) + 472), v14);
    v13 = *(_QWORD *)(a1 + 56);
  }
  *(_QWORD *)(v13 + 40) = 0;

  *(_QWORD *)(*(_QWORD *)(a1 + 56) + 48) = 0;
  if ((objc_msgSend(*(id *)(a1 + 56), "recompilationTarget") & 1) == 0)
  {
    v15 = *(_QWORD *)(a1 + 56);
    if (*(_DWORD *)(v15 + 56) || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      v16 = *(uint64_t **)(v15 + 264);
      v17 = *(uint64_t **)(v15 + 272);
      if (v16 != v17)
      {
        do
        {
          v18 = *v16;
          v19 = *(_QWORD **)(*(_QWORD *)(a1 + 88) + 8);
          v20 = (_QWORD *)v19[7];
          v21 = v19[8];
          if ((unint64_t)v20 >= v21)
          {
            v23 = v19[6];
            v24 = ((uint64_t)v20 - v23) >> 3;
            if ((unint64_t)(v24 + 1) >> 61)
LABEL_61:
              std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
            v25 = v21 - v23;
            v26 = v25 >> 2;
            if (v25 >> 2 <= (unint64_t)(v24 + 1))
              v26 = v24 + 1;
            if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8)
              v27 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v27 = v26;
            if (v27)
              v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(v19 + 8), v27);
            else
              v28 = 0;
            v29 = &v28[8 * v24];
            *(_QWORD *)v29 = v18;
            v22 = v29 + 8;
            v31 = (char *)v19[6];
            v30 = (char *)v19[7];
            if (v30 != v31)
            {
              do
              {
                v32 = *((_QWORD *)v30 - 1);
                v30 -= 8;
                *((_QWORD *)v29 - 1) = v32;
                v29 -= 8;
              }
              while (v30 != v31);
              v30 = (char *)v19[6];
            }
            v19[6] = v29;
            v19[7] = v22;
            v19[8] = &v28[8 * v27];
            if (v30)
              operator delete(v30);
          }
          else
          {
            *v20 = v18;
            v22 = v20 + 1;
          }
          v19[7] = v22;
          ++v16;
        }
        while (v16 != v17);
        v15 = *(_QWORD *)(a1 + 56);
        v16 = *(uint64_t **)(v15 + 264);
      }
      *(_QWORD *)(v15 + 272) = v16;
      objc_msgSend(*(id *)(a1 + 56), "loadFromURL:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      v33 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v34 = *(uint64_t **)(v33 + 48);
      for (i = *(uint64_t **)(v33 + 56); v34 != i; ++v34)
      {
        v36 = *v34;
        v37 = (void **)(*(_QWORD *)(a1 + 56) + 264);
        v38 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 272);
        v39 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 280);
        if ((unint64_t)v38 >= v39)
        {
          v41 = ((char *)v38 - (_BYTE *)*v37) >> 3;
          if ((unint64_t)(v41 + 1) >> 61)
            goto LABEL_61;
          v42 = v39 - (_QWORD)*v37;
          v43 = v42 >> 2;
          if (v42 >> 2 <= (unint64_t)(v41 + 1))
            v43 = v41 + 1;
          if ((unint64_t)v42 >= 0x7FFFFFFFFFFFFFF8)
            v44 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v44 = v43;
          if (v44)
            v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>(*(_QWORD *)(a1 + 56) + 280, v44);
          else
            v45 = 0;
          v46 = &v45[8 * v41];
          *(_QWORD *)v46 = v36;
          v40 = v46 + 8;
          v48 = (char *)*v37;
          v47 = (char *)v37[1];
          if (v47 != *v37)
          {
            do
            {
              v49 = *((_QWORD *)v47 - 1);
              v47 -= 8;
              *((_QWORD *)v46 - 1) = v49;
              v46 -= 8;
            }
            while (v47 != v48);
            v47 = (char *)*v37;
          }
          *v37 = v46;
          v37[1] = v40;
          v37[2] = &v45[8 * v44];
          if (v47)
            operator delete(v47);
        }
        else
        {
          *v38 = v36;
          v40 = v38 + 1;
        }
        v37[1] = v40;
      }
    }
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v50 = *(void **)(*(_QWORD *)(a1 + 56) + 392);
    if (v50)

    *(_QWORD *)(*(_QWORD *)(a1 + 56) + 392) = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", objc_msgSend(*(id *)(a1 + 40), "absoluteString"));
  }
}

void __89___MTLBinaryArchive_newRecompiledFunctionWithAIRNTObject_index_destinationArchive_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "getLibraryInArchiveAtPos:atIndex:error:", *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 72));
  if (v2)
  {
    v3 = v2;
    if ((objc_msgSend(v2, "isStub") & 1) == 0)
    {
      v4 = objc_msgSend(v3, "newFunctionWithHash:", *(_QWORD *)(*(_QWORD *)(**(_QWORD **)(a1 + 56) + 8 * *(_QWORD *)(a1 + 64)) + 24));
      if (v4)
      {
        v5 = (id)v4;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "recompileFunction:inLibrary:toArchive:toBinary:error:", v4, v3, *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 72));

      }
      else if (*(_QWORD *)(a1 + 72))
      {
        **(_QWORD **)(a1 + 72) = newErrorWithMessage((NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to find the requested function hash in the binary archive")), MTLBinaryArchiveErrorInvalidFile);
      }
    }
  }
}

uint64_t __55___MTLBinaryArchive_recompileStatelessToArchive_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "getLibraryInArchiveAtPos:atIndex:error:", *(_QWORD *)(a1 + 56), 0, *(_QWORD *)(a1 + 64));
  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (result)
  {
    result = objc_msgSend((id)result, "isStub");
    if ((result & 1) == 0)
    {
      result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "newFunctionWithHash:", *(_QWORD *)(***(_QWORD ***)(a1 + 56) + 24));
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      {
        if (*(_QWORD *)(a1 + 64))
        {
          result = (uint64_t)newErrorWithMessage((NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to find the requested function hash in the binary archive")), MTLBinaryArchiveErrorInvalidFile);
          **(_QWORD **)(a1 + 64) = result;
        }
      }
    }
  }
  return result;
}

uint64_t __56___MTLBinaryArchive_legacySerializeToURL_options_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", a2, a3, 0);
  v6 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += a3;
  return objc_msgSend(*(id *)(a1 + 32), "writeData:error:", v5, v6);
}

uint64_t __56___MTLBinaryArchive_legacySerializeToURL_options_error___block_invoke_237(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];
  __int128 v6;

  objc_msgSend(*(id *)(a1 + 32), "materializeAll");
  objc_msgSend(*(id *)(a1 + 32), "materializeAllAIRNTLegacy");
  std::vector<MTLLoaderMachOPayload>::reserve((void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 376), "count"));
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 376);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[2] = __56___MTLBinaryArchive_legacySerializeToURL_options_error___block_invoke_2;
  v5[3] = &unk_1E0FE2AB8;
  v5[1] = 3221225472;
  v6 = *(_OWORD *)(a1 + 48);
  v5[4] = v2;
  return objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v5);
}

void __56___MTLBinaryArchive_legacySerializeToURL_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6;
  __int128 *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _QWORD *v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;

  v6 = objc_msgSend(a3, "data");
  v7 = (__int128 *)objc_msgSend(a2, "value");
  v31 = *v7;
  v32 = v7[1];
  v8 = *(_QWORD *)(a1 + 40);
  v9 = objc_msgSend(a3, "importedLibraries");
  v10 = objc_msgSend(a3, "importedSymbols");
  v11 = (*(unsigned __int8 *)(a1 + 48) >> 1) & 1;
  v12 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v13 = v12[7];
  v14 = v12[8];
  if (v13 >= v14)
  {
    v16 = v12[6];
    v17 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v13 - v16) >> 4);
    v18 = v17 + 1;
    if ((unint64_t)(v17 + 1) > 0x249249249249249)
      std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
    v19 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v14 - v16) >> 4);
    if (2 * v19 > v18)
      v18 = 2 * v19;
    if (v19 >= 0x124924924924924)
      v20 = 0x249249249249249;
    else
      v20 = v18;
    if (v20)
      v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MTLLoaderMachOPayload>>((uint64_t)(v12 + 8), v20);
    else
      v21 = 0;
    v22 = &v21[112 * v17];
    *(_OWORD *)(v22 + 8) = v31;
    v23 = &v21[112 * v20];
    *(_QWORD *)v22 = v6;
    *(_OWORD *)(v22 + 24) = v32;
    v22[40] = v11;
    *((_DWORD *)v22 + 11) = 0;
    *(_DWORD *)(v22 + 41) = 0;
    *((_QWORD *)v22 + 6) = v8;
    *((_QWORD *)v22 + 7) = 0;
    *((_QWORD *)v22 + 8) = v9;
    *((_QWORD *)v22 + 9) = v10;
    *((_OWORD *)v22 + 5) = 0u;
    *((_OWORD *)v22 + 6) = 0u;
    v15 = v22 + 112;
    v25 = (char *)v12[6];
    v24 = (char *)v12[7];
    if (v24 != v25)
    {
      do
      {
        v26 = *((_OWORD *)v24 - 7);
        v27 = *((_OWORD *)v24 - 5);
        *((_OWORD *)v22 - 6) = *((_OWORD *)v24 - 6);
        *((_OWORD *)v22 - 5) = v27;
        *((_OWORD *)v22 - 7) = v26;
        v28 = *((_OWORD *)v24 - 4);
        v29 = *((_OWORD *)v24 - 3);
        v30 = *((_OWORD *)v24 - 1);
        *((_OWORD *)v22 - 2) = *((_OWORD *)v24 - 2);
        *((_OWORD *)v22 - 1) = v30;
        *((_OWORD *)v22 - 4) = v28;
        *((_OWORD *)v22 - 3) = v29;
        v22 -= 112;
        v24 -= 112;
      }
      while (v24 != v25);
      v24 = (char *)v12[6];
    }
    v12[6] = v22;
    v12[7] = v15;
    v12[8] = v23;
    if (v24)
      operator delete(v24);
  }
  else
  {
    *(_OWORD *)(v13 + 8) = v31;
    *(_QWORD *)v13 = v6;
    *(_OWORD *)(v13 + 24) = v32;
    *(_BYTE *)(v13 + 40) = v11;
    *(_DWORD *)(v13 + 41) = 0;
    *(_DWORD *)(v13 + 44) = 0;
    *(_QWORD *)(v13 + 48) = v8;
    *(_QWORD *)(v13 + 56) = 0;
    *(_QWORD *)(v13 + 64) = v9;
    *(_QWORD *)(v13 + 72) = v10;
    v15 = (char *)(v13 + 112);
    *(_OWORD *)(v13 + 80) = 0u;
    *(_OWORD *)(v13 + 96) = 0u;
  }
  v12[7] = v15;
}

BOOL __75___MTLBinaryArchive_loadAirntBlocksForSlice_sliceOffset_skipAIRValidation___block_invoke(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  _BOOL4 v10;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  unint64_t var1;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void ***v24;
  MTLHashKey *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void **p_var1;
  MTLHashKey v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  MTLHashKey v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v29 = a2;
  v9 = **(_QWORD **)(a1 + 40);
  v10 = v9 != a2;
  if (v9 == a2 && (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) & 0x10) == 0)
  {
    MTLHashKey::MTLHashKey(&v36, a4, a5, a3);
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 48);
    MTLHashKey::MTLHashKey(&v31, &v36);
    v32 = a7;
    v33 = v16 + a6;
    v34 = a9;
    v35 = v16 + a8;
    std::__hash_table<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,std::__unordered_map_hasher<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::__unordered_map_equal<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::allocator<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>>>::__emplace_unique_key_args<MTLHashKey,std::pair<MTLHashKey const,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>>(v15 + 96, &v31, (uint64_t)&v31);
    MTLHashKey::~MTLHashKey(&v31);
    v17 = (_QWORD *)(*(_QWORD *)(a1 + 32) + 176);
    v31.var0.var0 = *(_QWORD *)(a1 + 48) + a6;
    v18 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::find<unsigned long>(v17, &v31.var0.var0);
    if (v18)
    {
      memset(&v31, 0, 24);
      std::vector<MTLHashKey>::__init_with_size[abi:ne180100]<MTLHashKey*,MTLHashKey*>(&v31, v18[3], v18[4], 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v18[4] - v18[3]) >> 4));
      var1 = v31.var0.var1;
      if (v31.var0.var1 >= *(_QWORD *)&v31.var0.var2)
      {
        v20 = std::vector<MTLHashKey>::__push_back_slow_path<MTLHashKey const&>((uint64_t *)&v31, &v36);
      }
      else
      {
        MTLHashKey::MTLHashKey((MTLHashKey *)v31.var0.var1, &v36);
        v20 = var1 + 80;
      }
      v31.var0.var1 = v20;
      v26 = &v31;
      v24 = (void ***)&v26;
    }
    else
    {
      v26 = 0;
      v27 = 0;
      v28 = 0;
      v21 = std::vector<MTLHashKey>::__push_back_slow_path<MTLHashKey const&>((uint64_t *)&v26, &v36);
      v22 = *(_QWORD *)(a1 + 32);
      v23 = *(_QWORD *)(a1 + 48);
      v27 = v21;
      v31.var0.var0 = v23 + a6;
      memset(&v31.var0.var1, 0, 24);
      std::vector<MTLHashKey>::__init_with_size[abi:ne180100]<MTLHashKey*,MTLHashKey*>(&v31.var0.var1, (uint64_t)v26, v21, 0xCCCCCCCCCCCCCCCDLL * ((v21 - (uint64_t)v26) >> 4));
      std::__hash_table<std::__hash_value_type<unsigned long long,std::vector<MTLHashKey>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<MTLHashKey>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<MTLHashKey>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::vector<MTLHashKey>>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long const,std::vector<MTLHashKey>>>(v22 + 176, &v31.var0.var0, (uint64_t)&v31);
      p_var1 = (void **)&v31.var0.var1;
      std::vector<MTLHashKey>::__destroy_vector::operator()[abi:ne180100](&p_var1);
      v31.var0.var0 = (unint64_t)&v26;
      v24 = (void ***)&v31;
    }
    std::vector<MTLHashKey>::__destroy_vector::operator()[abi:ne180100](v24);
    MTLHashKey::~MTLHashKey(&v36);
  }
  return !v10;
}

uint64_t __75___MTLBinaryArchive_loadAirntBlocksForSlice_sliceOffset_skipAIRValidation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void **v4;
  uint64_t *v5;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  void **v20;
  uint64_t *v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  char *v29;
  char *v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  CC_SHA256_CTX v44;
  unint64_t data;
  uint64_t v46;
  unsigned __int8 *v47;
  unint64_t md[4];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)(a2 + 80) & 0x20) != 0)
  {
    v8 = *(_QWORD *)(a1 + 32);
    result = 1;
    *(_BYTE *)(v8 + 72) = 1;
  }
  else
  {
    *(_QWORD *)(a2 + 56) = *(_QWORD *)(a1 + 40);
    v46 = 0;
    objc_msgSend(*(id *)(a1 + 32), "preloadLibrariesInAirntObject:error:", a2, &v46);
    if (*(_BYTE *)(a1 + 48) || (objc_msgSend(*(id *)(a1 + 32), "getScriptsWithAIRNTObject:", a2) & 1) != 0)
    {
      v4 = (void **)(*(_QWORD *)(a1 + 32) + 216);
      v5 = *(uint64_t **)(*(_QWORD *)(a1 + 32) + 224);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232);
      if ((unint64_t)v5 >= v6)
      {
        v10 = ((char *)v5 - (_BYTE *)*v4) >> 3;
        if ((unint64_t)(v10 + 1) >> 61)
          std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
        v11 = v6 - (_QWORD)*v4;
        v12 = v11 >> 2;
        if (v11 >> 2 <= (unint64_t)(v10 + 1))
          v12 = v10 + 1;
        if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
          v13 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v13 = v12;
        if (v13)
          v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>(*(_QWORD *)(a1 + 32) + 232, v13);
        else
          v14 = 0;
        v15 = &v14[8 * v10];
        v16 = &v14[8 * v13];
        *(_QWORD *)v15 = a2;
        v7 = v15 + 8;
        v18 = (char *)*v4;
        v17 = (char *)v4[1];
        if (v17 != *v4)
        {
          do
          {
            v19 = *((_QWORD *)v17 - 1);
            v17 -= 8;
            *((_QWORD *)v15 - 1) = v19;
            v15 -= 8;
          }
          while (v17 != v18);
          v17 = (char *)*v4;
        }
        *v4 = v15;
        v4[1] = v7;
        v4[2] = v16;
        if (v17)
          operator delete(v17);
      }
      else
      {
        *v5 = a2;
        v7 = v5 + 1;
      }
      v4[1] = v7;
      if ((*(_BYTE *)(a2 + 80) & 4) != 0)
      {
        v20 = (void **)(*(_QWORD *)(a1 + 32) + 240);
        v21 = *(uint64_t **)(*(_QWORD *)(a1 + 32) + 248);
        v22 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256);
        if ((unint64_t)v21 >= v22)
        {
          v24 = ((char *)v21 - (_BYTE *)*v20) >> 3;
          if ((unint64_t)(v24 + 1) >> 61)
            std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
          v25 = v22 - (_QWORD)*v20;
          v26 = v25 >> 2;
          if (v25 >> 2 <= (unint64_t)(v24 + 1))
            v26 = v24 + 1;
          if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8)
            v27 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v27 = v26;
          if (v27)
            v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>(*(_QWORD *)(a1 + 32) + 256, v27);
          else
            v28 = 0;
          v29 = &v28[8 * v24];
          v30 = &v28[8 * v27];
          *(_QWORD *)v29 = a2;
          v23 = v29 + 8;
          v32 = (char *)*v20;
          v31 = (char *)v20[1];
          if (v31 != *v20)
          {
            do
            {
              v33 = *((_QWORD *)v31 - 1);
              v31 -= 8;
              *((_QWORD *)v29 - 1) = v33;
              v29 -= 8;
            }
            while (v31 != v32);
            v31 = (char *)*v20;
          }
          *v20 = v29;
          v20[1] = v23;
          v20[2] = v30;
          if (v31)
            operator delete(v31);
        }
        else
        {
          *v21 = a2;
          v23 = v21 + 1;
        }
        v20[1] = v23;
      }
      v34 = *(_QWORD *)(a1 + 32);
      if ((*(_BYTE *)(v34 + 32) & 0x10) == 0)
      {
        data = *(_QWORD *)(a2 + 40) + *(_QWORD *)(a1 + 40);
        v36 = *(_QWORD *)(v34 + 216);
        v35 = *(_QWORD *)(v34 + 224);
        *(_QWORD *)v44.count = &data;
        std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v34 + 336, &data, (uint64_t)&std::piecewise_construct, &v44)[3] = (v35 - v36) >> 3;
        CC_SHA256_Init(&v44);
        CC_SHA256_Update(&v44, *(const void **)(**(_QWORD **)a2 + 24), 0x20u);
        CC_SHA256_Update(&v44, &data, 8u);
        CC_SHA256_Final((unsigned __int8 *)md, &v44);
        v37 = *(_QWORD *)(a1 + 40);
        v39 = *(unsigned int *)(a2 + 64);
        v38 = *(unsigned int *)(a2 + 68);
        v41 = *(unsigned int *)(a2 + 72);
        v40 = *(unsigned int *)(a2 + 76);
        v42 = *(_QWORD *)(a1 + 32) + 136;
        v47 = (unsigned __int8 *)md;
        v43 = std::__hash_table<std::__hash_value_type<MTLUINT256_t,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>>>::__emplace_unique_key_args<MTLUINT256_t,std::piecewise_construct_t const&,std::tuple<MTLUINT256_t const&>,std::tuple<>>(v42, md, (uint64_t)&std::piecewise_construct, (_OWORD **)&v47);
        v43[6] = v37 + v39;
        v43[7] = v38;
        v43[8] = v37 + v41;
        v43[9] = v40;
      }
      return 1;
    }
    else
    {
      MTLAirNTObject::~MTLAirNTObject((MTLAirNTObject *)a2);
      MEMORY[0x186DABFBC]();
      return 0;
    }
  }
  return result;
}

uint64_t __75___MTLBinaryArchive_loadAirntBlocksForSlice_sliceOffset_skipAIRValidation___block_invoke_3(uint64_t a1, _DWORD *a2)
{
  void **v4;
  _QWORD *v5;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;

  v4 = (void **)(*(_QWORD *)(a1 + 32) + 264);
  v5 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 272);
  v6 = (unint64_t)v4[2];
  if ((unint64_t)v5 >= v6)
  {
    v8 = ((char *)v5 - (_BYTE *)*v4) >> 3;
    if ((unint64_t)(v8 + 1) >> 61)
      std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
    v9 = v6 - (_QWORD)*v4;
    v10 = v9 >> 2;
    if (v9 >> 2 <= (unint64_t)(v8 + 1))
      v10 = v8 + 1;
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFF8)
      v11 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    if (v11)
      v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(v4 + 2), v11);
    else
      v12 = 0;
    v13 = &v12[8 * v8];
    v14 = &v12[8 * v11];
    *(_QWORD *)v13 = a2;
    v7 = v13 + 8;
    v16 = (char *)*v4;
    v15 = (char *)v4[1];
    if (v15 != *v4)
    {
      do
      {
        v17 = *((_QWORD *)v15 - 1);
        v15 -= 8;
        *((_QWORD *)v13 - 1) = v17;
        v13 -= 8;
      }
      while (v15 != v16);
      v15 = (char *)*v4;
    }
    *v4 = v13;
    v4[1] = v7;
    v4[2] = v14;
    if (v15)
      operator delete(v15);
  }
  else
  {
    *v5 = a2;
    v7 = v5 + 1;
  }
  v4[1] = v7;
  v18 = a2[2];
  if (v18 != -1)
  {
    v19 = *(_QWORD *)(a1 + 32);
    if (v18 <= *(_DWORD *)(v19 + 56))
      v18 = *(_DWORD *)(v19 + 56);
    *(_DWORD *)(v19 + 56) = v18;
  }
  v20 = a2[4];
  if (v20 != -1)
  {
    v21 = *(_QWORD *)(a1 + 32);
    if (v20 <= *(_DWORD *)(v21 + 56))
      v20 = *(_DWORD *)(v21 + 56);
    *(_DWORD *)(v21 + 56) = v20;
  }
  v22 = a2[6];
  if (v22 != -1)
  {
    v23 = *(_QWORD *)(a1 + 32);
    if (v22 <= *(_DWORD *)(v23 + 56))
      v22 = *(_DWORD *)(v23 + 56);
    *(_DWORD *)(v23 + 56) = v22;
  }
  return 1;
}

BOOL __75___MTLBinaryArchive_loadAirntBlocksForSlice_sliceOffset_skipAIRValidation___block_invoke_4(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 - 7) <= 1)
    return *(_BYTE *)(a1 + 40) != 0;
  if (a2 != 3)
    return 0;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __75___MTLBinaryArchive_loadAirntBlocksForSlice_sliceOffset_skipAIRValidation___block_invoke_4_cold_1(a1);
  return 1;
}

uint64_t __75___MTLBinaryArchive_loadAirntBlocksForSlice_sliceOffset_skipAIRValidation___block_invoke_251(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 40) + a2;
  if (v4 + a3 <= (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "length"))
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "bytes") + v4;
  else
    return 0;
}

uint64_t __79___MTLBinaryArchive_loadFileIndex_expectedSliceId_expectedVersion_sliceOffset___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, int a5, uint64_t a6)
{
  uint64_t **v6;
  uint64_t v7;
  __int128 v8;
  _OWORD v10[2];
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (**(_QWORD **)(a1 + 32) != a2 || *(_QWORD *)(a1 + 40) != a3)
    return 0;
  v6 = *(uint64_t ***)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56) + a6;
  v8 = a4[1];
  v10[0] = *a4;
  v10[1] = v8;
  v11 = a5;
  v12 = v7;
  std::__tree<std::__value_type<MTLUINT256_t,std::pair<unsigned int,unsigned long long>>,std::__map_value_compare<MTLUINT256_t,std::__value_type<MTLUINT256_t,std::pair<unsigned int,unsigned long long>>,CompareHash,true>,std::allocator<std::__value_type<MTLUINT256_t,std::pair<unsigned int,unsigned long long>>>>::__emplace_unique_key_args<MTLUINT256_t,std::pair<MTLUINT256_t const,std::pair<unsigned int,unsigned long long>>>(v6, (unint64_t *)v10, v10);
  return 1;
}

uint64_t __79___MTLBinaryArchive_loadFileIndex_expectedSliceId_expectedVersion_sliceOffset___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 40) + a2;
  if (v4 + a3 <= (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "length"))
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "bytes") + v4;
  else
    return 0;
}

uint64_t __105___MTLBinaryArchive_enumerateArchivesFromBackingFileFromSlice_version_verifyKey_offset_bytes_enumerator___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) + a2;
  if ((unint64_t)(v3 + a3) <= a1[5])
    return a1[6] + v3;
  else
    return 0;
}

uint64_t __105___MTLBinaryArchive_enumerateArchivesFromBackingFileFromSlice_version_verifyKey_offset_bytes_enumerator___block_invoke_2(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, size_t a5)
{
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  BOOL v12;

  if (a2 != **(_QWORD **)(a1 + 56) || a3[6] != *(_QWORD *)(a1 + 64))
    return 0;
  v6 = *(uint64_t **)(a1 + 72);
  if (v6)
  {
    v7 = *v6;
    v8 = v6[1];
    v10 = v6[2];
    v9 = v6[3];
    v11 = a3[1] == v7 && a3[2] == v8;
    v12 = v11 && a3[3] == v10;
    if (v12 && a3[4] == v9)
      return 1;
  }
  dispatch_data_create_subrange((dispatch_data_t)objc_msgSend(*(id *)(a1 + 32), "dispatchData"), *(_QWORD *)(a1 + 80) + a4 + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), a5);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __105___MTLBinaryArchive_enumerateArchivesFromBackingFileFromSlice_version_verifyKey_offset_bytes_enumerator___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2 != **(_QWORD **)(a1 + 56) || *(_QWORD *)(a1 + 64) != a3)
    return 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a6;
  return +[MTLLoader deserializeMachOWrapperWithType:payloadHandler:reader:]((uint64_t)MTLLoader, 0, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

id __25___MTLBinaryArchive_keys__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  id result;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[60])
    objc_msgSend(v2, "materializeAll");
  else
    objc_msgSend(v2, "materializeAllAIRNTLegacy");
  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 376), "allKeys");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void __78___MTLBinaryArchive_MTLBinaryArchiveInternal__addArchiveEntryInternal_forKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  __int128 *v4;
  uint64_t v5;
  __int128 v6;
  char v7;
  uint64_t v8;
  __int128 *v9;
  uint64_t v10;
  __int128 v11;
  char v12;
  id v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 60))
  {
    if ((*(_BYTE *)(v2 + 32) & 4) != 0)
    {
      v3 = v2 + 728;
      v4 = *(__int128 **)(a1 + 48);
      v5 = objc_msgSend(*(id *)(a1 + 40), "data");
      v6 = v4[1];
      v14 = *v4;
      v15 = v6;
      v16 = v5;
      std::__hash_table<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<MTLUINT256_t,std::pair<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>>(v3, (unint64_t *)&v14, (uint64_t)&v14);
      if ((v7 & 1) != 0)
        dispatch_retain((dispatch_object_t)objc_msgSend(*(id *)(a1 + 40), "data"));
    }
  }
  else
  {
    v8 = v2 + 560;
    v10 = *(_QWORD *)(a1 + 40);
    v9 = *(__int128 **)(a1 + 48);
    v11 = v9[1];
    v14 = *v9;
    v15 = v11;
    v16 = v10;
    std::__hash_table<std::__hash_value_type<MTLUINT256_t,MTLAirEntry *>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,MTLAirEntry *>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,MTLAirEntry *>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,MTLAirEntry *>>>::__emplace_unique_key_args<MTLUINT256_t,std::pair<MTLUINT256_t,MTLAirEntry *>>(v8, (unint64_t *)&v14, (uint64_t)&v14);
    if ((v12 & 1) != 0)
    {
      v13 = *(id *)(a1 + 40);
      ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 888);
    }
  }
}

void __76___MTLBinaryArchive_MTLBinaryArchiveInternal__newArchiveDataForKeyInternal___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v2 = std::__hash_table<HashKey,KeyHashFunction,std::equal_to<HashKey>,std::allocator<HashKey>>::find<HashKey>((_QWORD *)(*(_QWORD *)(a1 + 32) + 728), *(unint64_t **)(a1 + 48));
  v3 = *(char **)(a1 + 32);
  if (v2 && (v4 = v2[6]) != 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v4;
    dispatch_retain(*(dispatch_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 48);
    v8[4] = *(_QWORD *)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __76___MTLBinaryArchive_MTLBinaryArchiveInternal__newArchiveDataForKeyInternal___block_invoke_2;
    v9[3] = &unk_1E0FE2C90;
    v9[4] = v3;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __76___MTLBinaryArchive_MTLBinaryArchiveInternal__newArchiveDataForKeyInternal___block_invoke_3;
    v8[3] = &unk_1E0FE2CB8;
    v6 = (void *)objc_msgSend(v3, "materializeEntryForKey:fileIndex:containsEntry:addEntry:", v5, v3 + 768, v9, v8);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(v6, "data");
    v7 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v7)
      dispatch_retain(v7);

  }
}

BOOL __76___MTLBinaryArchive_MTLBinaryArchiveInternal__newArchiveDataForKeyInternal___block_invoke_2(uint64_t a1, unint64_t *a2)
{
  return std::__hash_table<HashKey,KeyHashFunction,std::equal_to<HashKey>,std::allocator<HashKey>>::find<HashKey>((_QWORD *)(*(_QWORD *)(a1 + 32) + 728), a2) != 0;
}

void __76___MTLBinaryArchive_MTLBinaryArchiveInternal__newArchiveDataForKeyInternal___block_invoke_3(uint64_t a1, void *a2, _OWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  char v8;
  id v9;
  _OWORD v10[2];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32) + 728;
  v6 = objc_msgSend(a2, "data");
  v7 = a3[1];
  v10[0] = *a3;
  v10[1] = v7;
  v11 = v6;
  std::__hash_table<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<MTLUINT256_t,std::pair<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>>(v5, (unint64_t *)v10, (uint64_t)v10);
  LOBYTE(a3) = v8;
  v9 = a2;
  if ((a3 & 1) != 0)
    dispatch_retain((dispatch_object_t)objc_msgSend(a2, "data"));
}

void __77___MTLBinaryArchive_MTLBinaryArchiveInternal__addBinaryEntryInternal_forKey___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addBinaryEntryImpl:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __77___MTLBinaryArchive_MTLBinaryArchiveInternal__getArchiveIDWithErrorInternal___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[7];
  _QWORD v7[4];

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 64))
  {
    v7[0] = 0;
    v7[1] = v7;
    v7[2] = 0x2020000000;
    v7[3] = 0;
    v3 = (void *)objc_msgSend(*(id *)(v1 + 24), "compiler");
    v4 = objc_msgSend(*(id *)(a1 + 32), "recompilationTarget");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __77___MTLBinaryArchive_MTLBinaryArchiveInternal__getArchiveIDWithErrorInternal___block_invoke_2;
    v6[3] = &unk_1E0FE2D08;
    v5 = *(_QWORD *)(a1 + 40);
    v6[4] = *(_QWORD *)(a1 + 32);
    v6[5] = v7;
    v6[6] = v5;
    objc_msgSend(v3, "createBinaryArchiveAsRecompileTarget:completionHandler:", v4, v6);
    _Block_object_dispose(v7, 8);
  }
}

void __77___MTLBinaryArchive_MTLBinaryArchiveInternal__getArchiveIDWithErrorInternal___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  __CFString *v3;
  NSObject *v4;
  size_t size_ptr;

  if (*(_QWORD *)a2)
  {
    if (*(_QWORD *)(a2 + 8))
      v3 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to generate archiveID with error: %@"), *(_QWORD *)(a2 + 8));
    else
      v3 = CFSTR("Failed to generate archiveID");
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = newErrorWithMessage(&v3->isa, MTLBinaryArchiveErrorInternalError);
  }
  else
  {
    size_ptr = 0;
    v4 = dispatch_data_create_map(*(dispatch_data_t *)(a2 + 24), (const void **)(*(_QWORD *)(a1[5] + 8) + 24), &size_ptr);
    if (size_ptr <= strlen(*(const char **)(*(_QWORD *)(a1[5] + 8) + 24)))
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = newErrorWithMessage(CFSTR("Failed to generate archiveID; the returned ID seems invalid"),
                                                       MTLBinaryArchiveErrorInternalError);
    else
      *(_QWORD *)(a1[4] + 64) = strdup(*(const char **)(*(_QWORD *)(a1[5] + 8) + 24));
    dispatch_release(v4);
  }
}

BOOL __82___MTLBinaryArchive_MTLBinaryArchiveInternal__getBinaryDataForKey_reflectionType___block_invoke_2(uint64_t a1, uint64_t a2)
{
  MTLBinaryKey *v3;
  uint64_t v4;
  MTLHashKey v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MTLHashKey::MTLHashKey((uint64_t)&v6, a2);
  v3 = -[MTLBinaryKey initWithHash:]([MTLBinaryKey alloc], "initWithHash:", &v6);
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 376), "objectForKey:", v3);

  MTLHashKey::~MTLHashKey(&v6);
  return v4 != 0;
}

void __82___MTLBinaryArchive_MTLBinaryArchiveInternal__getBinaryDataForKey_reflectionType___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MTLBinaryKey *v5;
  MTLHashKey v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MTLHashKey::MTLHashKey((uint64_t)&v6, a3);
  v5 = -[MTLBinaryKey initWithHash:]([MTLBinaryKey alloc], "initWithHash:", &v6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 376), "setObject:forKey:", a2, v5);

  MTLHashKey::~MTLHashKey(&v6);
}

_QWORD *__76___MTLBinaryArchive_MTLBinaryArchiveInternal__findProgramObjectForFunction___block_invoke(_QWORD *a1)
{
  _QWORD *result;
  uint64_t v3;

  result = std::__hash_table<HashKey,KeyHashFunction,std::equal_to<HashKey>,std::allocator<HashKey>>::find<HashKey>((_QWORD *)(a1[4] + 848), a1 + 6);
  if (result)
    v3 = result[6];
  else
    v3 = 0;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v3;
  return result;
}

_QWORD *__72___MTLBinaryArchive_MTLBinaryArchiveInternal__programObjectForFunction___block_invoke(_QWORD *a1)
{
  _OWORD *v2;
  _QWORD *result;
  MTLProgramObject *v4;
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;

  v2 = a1 + 6;
  result = std::__hash_table<HashKey,KeyHashFunction,std::equal_to<HashKey>,std::allocator<HashKey>>::find<HashKey>((_QWORD *)(a1[4] + 848), a1 + 6);
  if (result)
  {
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = result[6];
  }
  else
  {
    v4 = (MTLProgramObject *)operator new();
    MTLProgramObject::MTLProgramObject(v4);
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v4;
    v5 = a1[4];
    v6 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
    v7 = v2;
    result = std::__hash_table<std::__hash_value_type<MTLUINT256_t,MTLProgramObject *>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,MTLProgramObject *>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,MTLProgramObject *>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,MTLProgramObject *>>>::__emplace_unique_key_args<MTLUINT256_t,std::piecewise_construct_t const&,std::tuple<MTLUINT256_t const&>,std::tuple<>>(v5 + 848, (unint64_t *)v2, (uint64_t)&std::piecewise_construct, &v7);
    result[6] = v6;
  }
  return result;
}

void __85___MTLBinaryArchive_MTLBinaryArchiveInternal__newStitchedLibraryWithKey_descriptors___block_invoke(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int i;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  BOOL v10;
  uint64_t v11;

  v1 = *(uint64_t **)(a1 + 56);
  v2 = *v1;
  v3 = v1[1];
  if (*v1 != v3)
  {
    for (i = 0; ; ++i)
    {
      v6 = std::__hash_table<HashKey,KeyHashFunction,std::equal_to<HashKey>,std::allocator<HashKey>>::find<HashKey>((_QWORD *)(*(_QWORD *)(a1 + 32) + 480), (unint64_t *)(v2 + 8));
      v7 = v6
         ? objc_msgSend((id)v6[6], "newStitchedFunctionWithHash:", v2 + 8)
         : objc_msgSend(*(id *)(a1 + 32), "localStitchedFunctionLookupWithDescriptor:", v2);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48) + 8 * i) = v7;
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v9 = !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48) + 8 * i)
        || *(_BYTE *)(v8 + 24) == 0;
      v10 = !v9;
      *(_BYTE *)(v8 + 24) = v10;
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        break;
      v2 += 40;
      if (v2 == v3)
        return;
    }
    if (i)
    {
      v11 = 0;
      do
      {

        v11 += 8;
      }
      while (8 * i != v11);
    }
  }
}

_QWORD *__108___MTLBinaryArchive_MTLBinaryArchiveInternal__addStitchedLibraryWithKey_descriptors_inputFunctions_library___block_invoke(_QWORD *result)
{
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD *v13;

  v1 = (_QWORD *)result[6];
  v2 = (_QWORD *)*v1;
  v3 = (_QWORD *)v1[1];
  if ((_QWORD *)*v1 != v3)
  {
    v4 = result;
    v5 = 0x1ECD41000uLL;
    do
    {
      result = std::__hash_table<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>>>::find<MTLUINT256_t>((_QWORD *)(v4[4] + 600), v2 + 1);
      if (!result)
      {
        result = std::__hash_table<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>>>::find<MTLUINT256_t>((_QWORD *)(v4[4] + 480), v2 + 1);
        if (!result)
        {
          if (((*(uint64_t (**)(_QWORD))(*(_QWORD *)v4[7] + 256))(v4[7]) & 1) != 0)
          {
            v6 = v5;
            v7 = (void *)objc_msgSend((id)v4[4], "getFunctionNameFromAirDescriptor:", v2);
            v8 = (void *)(*(uint64_t (**)(_QWORD, void *, _QWORD))(*(_QWORD *)v4[7] + 160))(v4[7], v7, *(_QWORD *)(v4[4] + 24));
            v9 = objc_msgSend(v8, "libraryData");
            v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v9 + 128))(v9);

            v5 = v6;
          }
          else
          {
            v10 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)v4[7] + 128))(v4[7]);
          }
          v11 = objc_msgSend(objc_alloc((Class)(v5 + 2776)), "initWithData:bitcode:airScript:", v10, 0, *v2);
          objc_msgSend((id)v4[4], "addStitchingInputsFunction:toEntry:", v4[5], v11);
          v12 = v4[4] + 600;
          v13 = v2 + 1;
          result = std::__hash_table<std::__hash_value_type<MTLUINT256_t,MTLAirEntry *>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,MTLAirEntry *>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,MTLAirEntry *>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,MTLAirEntry *>>>::__emplace_unique_key_args<MTLUINT256_t,std::piecewise_construct_t const&,std::tuple<MTLUINT256_t const&>,std::tuple<>>(v12, v2 + 1, (uint64_t)&std::piecewise_construct, &v13);
          result[6] = v11;
        }
      }
      v2 += 5;
    }
    while (v2 != v3);
  }
  return result;
}

void __107___MTLBinaryArchive_MTLBinaryArchiveInternal__newArchiverIdWithBinaryKey_entry_srcArchiverId_functionType___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  __int128 *v4;
  void *v5;
  _QWORD *v6;
  _QWORD *v7;
  int *v8;
  unsigned __int16 *v9;
  uint64_t v10;
  int v11;
  unint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  MTLHashKey *v16;
  void **v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  uint64_t v21;
  _BOOL4 v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  char *v27;
  char *v28;
  char *v29;
  char *v30;
  __int32 RequiredStagesPresentMask;
  _OWORD *v32;
  int8x8_t v33;
  _OWORD *v34;
  __int128 v35;
  __int128 v36;
  unsigned __int8 v37;
  __int128 v38;
  char v39;
  size_t v40;
  void *buffer_ptr;

  v2 = *(NSObject **)(a1 + 32);
  if (v2)
  {
    v40 = 0;
    buffer_ptr = 0;
    v3 = dispatch_data_create_map(v2, (const void **)&buffer_ptr, &v40);
    v4 = (__int128 *)buffer_ptr;
    if ((getRequiredStagesPresentMask(*(const Air::PipelineScript **)(a1 + 80)) & ~*((unsigned __int8 *)v4
                                                                                                  + 45)) == 0)
    {
      dispatch_release(v3);
      dispatch_retain(*(dispatch_object_t *)(a1 + 32));
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = *(_QWORD *)(a1 + 32);
      return;
    }
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "recompilationTarget"))
  {
    v5 = *(void **)(a1 + 48);
    if (!v5)
      goto LABEL_9;
  }
  else
  {
    v5 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 376), "objectForKey:", *(_QWORD *)(a1 + 56));
    if (!v5)
    {
LABEL_9:
      objc_msgSend(*(id *)(a1 + 40), "addBinaryEntryImpl:forKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      v5 = *(void **)(a1 + 48);
    }
  }
  v6 = std::__hash_table<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,std::__unordered_map_hasher<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::__unordered_map_equal<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::allocator<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>>>::find<MTLHashKey>((_QWORD *)(*(_QWORD *)(a1 + 40) + 648), *(MTLHashKey **)(a1 + 88));
  v7 = v6;
  if (*(_BYTE *)(a1 + 104))
  {
    v8 = *(int **)(a1 + 80);
    v9 = (unsigned __int16 *)((char *)v8 - *v8);
    if (*v9 >= 9u)
    {
      v10 = v9[4];
      if (v10)
      {
        v11 = *((unsigned __int8 *)v8 + v10);
        if (!v6)
          goto LABEL_14;
LABEL_18:
        v14 = 0;
        LODWORD(v15) = -1;
        goto LABEL_44;
      }
    }
  }
  v11 = 0;
  if (v6)
    goto LABEL_18;
LABEL_14:
  if (objc_msgSend(v5, "index") == -1)
  {
    v16 = (MTLHashKey *)operator new();
    MTLHashKey::MTLHashKey(v16, *(const MTLHashKey **)(a1 + 88));
    v17 = (void **)(*(_QWORD *)(a1 + 40) + 312);
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 320);
    v15 = (uint64_t)(v18 - (_QWORD)*v17) >> 4;
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 328);
    if (v18 >= v19)
    {
      v23 = v15 + 1;
      if ((unint64_t)(v15 + 1) >> 60)
        std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
      v24 = v19 - (_QWORD)*v17;
      if (v24 >> 3 > v23)
        v23 = v24 >> 3;
      if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF0)
        v25 = 0xFFFFFFFFFFFFFFFLL;
      else
        v25 = v23;
      if (v25)
        v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long,char const*>>>(*(_QWORD *)(a1 + 40) + 328, v25);
      else
        v26 = 0;
      v27 = &v26[16 * v15];
      v28 = &v26[16 * v25];
      *(_QWORD *)v27 = v16;
      *((_DWORD *)v27 + 2) = v11;
      v20 = v27 + 16;
      v30 = (char *)*v17;
      v29 = (char *)v17[1];
      if (v29 != *v17)
      {
        do
        {
          *((_OWORD *)v27 - 1) = *((_OWORD *)v29 - 1);
          v27 -= 16;
          v29 -= 16;
        }
        while (v29 != v30);
        v29 = (char *)*v17;
      }
      *v17 = v27;
      v17[1] = v20;
      v17[2] = v28;
      if (v29)
        operator delete(v29);
    }
    else
    {
      *(_QWORD *)v18 = v16;
      *(_DWORD *)(v18 + 8) = v11;
      v20 = (char *)(v18 + 16);
    }
    v17[1] = v20;
    objc_msgSend(v5, "setIndex:", -2);
LABEL_42:
    v14 = 0;
  }
  else
  {
    v12 = objc_msgSend(v5, "index");
    v13 = objc_msgSend(v5, "index");
    if (v12 > 0xFFFFFFFFFFFFFFFDLL)
    {
      if (v13 == -2)
      {
        v15 = (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 320) - *(_QWORD *)(*(_QWORD *)(a1 + 40) + 312)) >> 4;
        v21 = v15 - 1;
        while (v21 != -1)
        {
          v22 = MTLHashKey::operator==(*(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 312) + 16 * v21--), *(_QWORD **)(a1 + 88));
          LODWORD(v15) = v15 - 1;
          if (v22)
            goto LABEL_42;
        }
      }
      v14 = 0;
      LODWORD(v15) = -1;
    }
    else
    {
      v14 = 1;
      LODWORD(v15) = v13;
    }
  }
  if (*(_BYTE *)(a1 + 104))
  {
LABEL_44:
    RequiredStagesPresentMask = getRequiredStagesPresentMask(*(const Air::PipelineScript **)(a1 + 80));
    dispatch_release(*(dispatch_object_t *)(a1 + 64));
    v32 = malloc_type_malloc(0x30uLL, 0x102204031A510F6uLL);
    v34 = v32;
    if (*(_QWORD *)(a1 + 32))
    {
      v35 = *v4;
      v36 = v4[2];
      v32[1] = v4[1];
      v32[2] = v36;
      *v32 = v35;
      if (!v3)
        goto LABEL_47;
    }
    else
    {
      v33.i32[0] = RequiredStagesPresentMask;
      v37 = vaddlv_u8((uint8x8_t)vcnt_s8(v33));
      *((_QWORD *)v32 + 4) = -1;
      *(_QWORD *)&v38 = -1;
      *((_QWORD *)&v38 + 1) = -1;
      *v32 = v38;
      v32[1] = v38;
      *((_DWORD *)v32 + 10) = v11;
      *((_WORD *)v32 + 22) = v37;
      if (!v3)
      {
LABEL_47:
        switch(*(_QWORD *)(a1 + 96))
        {
          case 1:
            if (v7)
            {
              *(_QWORD *)v34 = v7[12];
              goto LABEL_58;
            }
            *(_DWORD *)v34 = v15;
            goto LABEL_68;
          case 2:
            if (v7)
            {
              *((_QWORD *)v34 + 3) = v7[12];
              v39 = *((_BYTE *)v34 + 45) | 1;
            }
            else
            {
              *((_DWORD *)v34 + 6) = v15;
              v39 = *((_BYTE *)v34 + 45) & 0xFE;
            }
            goto LABEL_70;
          case 3:
            if (v7)
            {
              *((_QWORD *)v34 + 4) = v7[12];
              goto LABEL_58;
            }
            *((_DWORD *)v34 + 8) = v15;
            goto LABEL_68;
          case 7:
            if (v7)
            {
              *((_QWORD *)v34 + 1) = v7[12];
LABEL_58:
              v39 = *((_BYTE *)v34 + 45) | 2;
            }
            else
            {
              *((_DWORD *)v34 + 2) = v15;
LABEL_68:
              v39 = *((_BYTE *)v34 + 45) & 0xFD;
            }
LABEL_70:
            *((_BYTE *)v34 + 45) = v39;
LABEL_71:
            if (v14)
              *((_BYTE *)v34 + 45) |= 8u;
            --*((_BYTE *)v34 + 44);
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = dispatch_data_create(v34, 0x30uLL, *(dispatch_queue_t *)(*(_QWORD *)(a1 + 40)+ 80), (dispatch_block_t)*MEMORY[0x1E0C80CE0]);
            break;
          case 8:
            if (v7)
            {
              *((_QWORD *)v34 + 2) = v7[12];
              v39 = *((_BYTE *)v34 + 45) | 4;
            }
            else
            {
              *((_DWORD *)v34 + 4) = v15;
              v39 = *((_BYTE *)v34 + 45) & 0xFB;
            }
            goto LABEL_70;
          default:
            goto LABEL_71;
        }
        return;
      }
    }
    dispatch_release(v3);
    goto LABEL_47;
  }
  dispatch_release(*(dispatch_object_t *)(a1 + 64));
  if (v3)
    dispatch_release(v3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = 0;
}

void __101___MTLBinaryArchive_MTLBinaryArchiveInternal__updatePipelineWithPipelineArchiverId_key_functionType___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t *v4;
  unint64_t v5;
  int v6;
  MTLHashKey *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  int v14;
  void **v15;
  uint64_t *v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  uint64_t *v24;
  char *v25;
  char *v26;
  char *v27;
  uint64_t v28;
  size_t v29;
  void *buffer_ptr;
  const MTLHashKey *v31;

  v2 = *(NSObject **)(a1 + 32);
  if (!v2 || (unint64_t)(*(_QWORD *)(a1 + 56) - 5) < 2)
    return;
  v29 = 0;
  buffer_ptr = 0;
  v3 = dispatch_data_create_map(v2, (const void **)&buffer_ptr, &v29);
  v4 = (uint64_t *)buffer_ptr;
  v5 = *(_QWORD *)(a1 + 56) - 1;
  if (v5 > 7)
    v6 = 0;
  else
    v6 = dword_182809F0C[v5];
  v7 = (MTLHashKey *)objc_msgSend(*(id *)(a1 + 40), "getFunctionId");
  if (std::__hash_table<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,std::__unordered_map_hasher<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::__unordered_map_equal<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::allocator<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>>>::find<MTLHashKey>((_QWORD *)(*(_QWORD *)(a1 + 48) + 648), v7))
  {
    goto LABEL_15;
  }
  if ((v6 & ~*((unsigned __int8 *)v4 + 45)) == 0)
  {
    v8 = 0;
    v9 = *(_QWORD *)(a1 + 48);
    v10 = v4;
    switch(*(_QWORD *)(a1 + 56))
    {
      case 1:
        goto LABEL_13;
      case 2:
        v10 = v4 + 3;
        goto LABEL_13;
      case 3:
        v10 = v4 + 4;
        goto LABEL_13;
      case 7:
        v10 = v4 + 1;
        goto LABEL_13;
      case 8:
        v10 = v4 + 2;
LABEL_13:
        v8 = *v10;
        break;
      default:
        break;
    }
    v31 = v7;
    std::__hash_table<std::__hash_value_type<MTLHashKey,MTLOpaqueGPUArchiverUnitId *>,std::__unordered_map_hasher<MTLHashKey,std::__hash_value_type<MTLHashKey,MTLOpaqueGPUArchiverUnitId *>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::__unordered_map_equal<MTLHashKey,std::__hash_value_type<MTLHashKey,MTLOpaqueGPUArchiverUnitId *>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::allocator<std::__hash_value_type<MTLHashKey,MTLOpaqueGPUArchiverUnitId *>>>::__emplace_unique_key_args<MTLHashKey,std::piecewise_construct_t const&,std::tuple<MTLHashKey const&>,std::tuple<>>(v9 + 648, v7, (uint64_t)&std::piecewise_construct, &v31)[12] = v8;
LABEL_15:
    if ((*((_BYTE *)v4 + 45) & 0x10) != 0)
    {
LABEL_17:
      dispatch_release(v3);
      return;
    }
  }
  if (*((_BYTE *)v4 + 44))
    goto LABEL_17;
  v11 = operator new();
  v12 = v11;
  v13 = *((_BYTE *)v4 + 45);
  *(_BYTE *)(v11 + 32) = v13;
  switch(*((_DWORD *)v4 + 10))
  {
    case 1:
      if ((v13 & 1) != 0)
        *(_QWORD *)(v11 + 16) = v4[3];
      else
        *(_DWORD *)(v11 + 16) = *((_DWORD *)v4 + 6);
      if ((v13 & 2) != 0)
      {
        v14 = 0;
        *(_QWORD *)(v11 + 8) = *v4;
      }
      else
      {
        v14 = 0;
        *(_DWORD *)(v11 + 8) = *(_DWORD *)v4;
      }
      goto LABEL_43;
    case 2:
      if ((v13 & 2) != 0)
        *(_QWORD *)(v11 + 8) = v4[4];
      else
        *(_DWORD *)(v11 + 8) = *((_DWORD *)v4 + 8);
      v14 = 1;
      goto LABEL_43;
    case 3:
      if ((v13 & 2) != 0)
        *(_QWORD *)(v11 + 8) = v4[4];
      else
        *(_DWORD *)(v11 + 8) = *((_DWORD *)v4 + 8);
      v14 = 2;
      goto LABEL_43;
    case 4:
      if ((v13 & 1) != 0)
        *(_QWORD *)(v11 + 24) = v4[3];
      else
        *(_DWORD *)(v11 + 24) = *((_DWORD *)v4 + 6);
      if ((v13 & 2) != 0)
        *(_QWORD *)(v11 + 16) = v4[1];
      else
        *(_DWORD *)(v11 + 16) = *((_DWORD *)v4 + 2);
      if ((v13 & 4) != 0)
        *(_QWORD *)(v11 + 8) = v4[2];
      else
        *(_DWORD *)(v11 + 8) = *((_DWORD *)v4 + 4);
      v14 = 3;
LABEL_43:
      *(_DWORD *)v11 = v14;
      break;
    default:
      break;
  }
  dispatch_release(v3);
  v15 = (void **)(*(_QWORD *)(a1 + 48) + 264);
  v16 = (uint64_t *)v15[1];
  v17 = (unint64_t)v15[2];
  if ((unint64_t)v16 >= v17)
  {
    v19 = ((char *)v16 - (_BYTE *)*v15) >> 3;
    if ((unint64_t)(v19 + 1) >> 61)
      std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
    v20 = v17 - (_QWORD)*v15;
    v21 = v20 >> 2;
    if (v20 >> 2 <= (unint64_t)(v19 + 1))
      v21 = v19 + 1;
    if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF8)
      v22 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v22 = v21;
    if (v22)
      v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(v15 + 2), v22);
    else
      v23 = 0;
    v24 = (uint64_t *)&v23[8 * v19];
    v25 = &v23[8 * v22];
    *v24 = v12;
    v18 = v24 + 1;
    v27 = (char *)*v15;
    v26 = (char *)v15[1];
    if (v26 != *v15)
    {
      do
      {
        v28 = *((_QWORD *)v26 - 1);
        v26 -= 8;
        *--v24 = v28;
      }
      while (v26 != v27);
      v26 = (char *)*v15;
    }
    *v15 = v24;
    v15[1] = v18;
    v15[2] = v25;
    if (v26)
      operator delete(v26);
  }
  else
  {
    *v16 = v12;
    v18 = v16 + 1;
  }
  v15[1] = v18;
}

uint64_t __94___MTLBinaryArchive_MTLBinaryArchiveInternal__deserializeBinaryArchiveHeader_fileData_device___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 + a2 <= (unint64_t)objc_msgSend(*(id *)(a1 + 32), "length"))
    return objc_msgSend(*(id *)(a1 + 32), "bytes") + a2;
  else
    return 0;
}

uint64_t __94___MTLBinaryArchive_MTLBinaryArchiveInternal__deserializeBinaryArchiveHeader_fileData_device___block_invoke_532(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  MTLArchitecture *v12;
  uint64_t v13;
  float *v14;
  _QWORD *v15;
  uint64_t v17;
  _QWORD v18[6];
  uint64_t v19;

  v19 = a2;
  if (a2 == *(_QWORD *)(a1 + 72))
  {
    v8 = *(_QWORD *)(a1 + 64);
    *(_WORD *)v8 = 257;
LABEL_9:
    *(_QWORD *)(v8 + 8) = a3;
    *(_QWORD *)(v8 + 16) = a4;
    goto LABEL_17;
  }
  if (v19 == *(_QWORD *)(a1 + 80))
  {
    v9 = *(_QWORD *)(a1 + 64);
    *(_BYTE *)(v9 + 24) = 1;
    *(_QWORD *)(v9 + 32) = a3;
    *(_QWORD *)(v9 + 40) = a4;
  }
  else if (v19 == *(_QWORD *)(a1 + 88))
  {
    if (*(_DWORD *)(a1 + 96) >= HIDWORD(a2))
    {
      v10 = *(_QWORD *)(a1 + 64);
      if (!*(_BYTE *)(v10 + 64) || *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) < SHIDWORD(a2))
      {
        *(_BYTE *)(v10 + 64) = 1;
        *(_QWORD *)(v10 + 72) = a3;
        *(_QWORD *)(v10 + 80) = a4;
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = HIDWORD(a2);
      }
    }
  }
  else if ((a2 - 16777235) >= 3)
  {
    if ((_DWORD)a2 == 16777239)
    {
      v11 = *(_QWORD *)(a1 + 64);
      *(_BYTE *)(v11 + 64) = 1;
      *(_QWORD *)(v11 + 72) = a3;
      *(_QWORD *)(v11 + 80) = a4;
    }
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 64);
    *(_BYTE *)(v8 + 1) = 1;
    if (!*(_QWORD *)(v8 + 16) && !*(_QWORD *)(v8 + 8))
      goto LABEL_9;
  }
LABEL_17:
  v12 = -[MTLArchitecture initWithCPUType:cpuSubtype:]([MTLArchitecture alloc], "initWithCPUType:cpuSubtype:", a2, HIDWORD(a2));
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __94___MTLBinaryArchive_MTLBinaryArchiveInternal__deserializeBinaryArchiveHeader_fileData_device___block_invoke_2;
  v18[3] = &unk_1E0FE2958;
  v13 = *(_QWORD *)(a1 + 64);
  v18[4] = *(_QWORD *)(a1 + 32);
  v18[5] = v13;
  if (!+[MTLLoader airNTMachOEmpty:type:]((uint64_t)MTLLoader, (uint64_t)v18, 0))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v12);
    v14 = (float *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48);
    v17 = (a2 << 32) | (a2 >> 32);
    v15 = std::unordered_map<unsigned long long,+[_MTLBinaryArchive(MTLBinaryArchiveInternal) deserializeBinaryArchiveHeader:fileData:device:]::archSliceId,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<std::pair<unsigned long long const,+[_MTLBinaryArchive(MTLBinaryArchiveInternal) deserializeBinaryArchiveHeader:fileData:device:]::archSliceId>>>::operator[](v14, (unint64_t *)&v17);
    *v15 = a3;
    v15[1] = a4;
  }

  return 1;
}

uint64_t __94___MTLBinaryArchive_MTLBinaryArchiveInternal__deserializeBinaryArchiveHeader_fileData_device___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v5;

  v5 = a3 + a2 + *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v5 <= objc_msgSend(*(id *)(a1 + 32), "length"))
    return objc_msgSend(*(id *)(a1 + 32), "bytes") + a2 + *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  else
    return 0;
}

uint64_t __94___MTLBinaryArchive_MTLBinaryArchiveInternal__deserializeBinaryArchiveHeader_fileData_device___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v5;

  v5 = a3 + a2 + *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v5 <= objc_msgSend(*(id *)(a1 + 32), "length"))
    return objc_msgSend(*(id *)(a1 + 32), "bytes") + a2 + *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  else
    return 0;
}

uint64_t __96___MTLBinaryArchive_MTLBinaryArchiveInternal__deserializeBinaryArchiveDescriptorMachO_fileData___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, void *__s1, size_t __n, uint64_t a6, uint64_t a7)
{
  uint64_t result;
  int v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD v15[7];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;

  v21 = a2;
  result = memcmp(__s1, &_MTLBinaryArchiveDescriptorUUID, __n);
  if ((_DWORD)result)
    return 1;
  if (a3 == 1 && v21 == a1[6])
  {
    if (*(_QWORD *)(a1[5] + 48))
      return 0;
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v15[6] = a7;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __96___MTLBinaryArchive_MTLBinaryArchiveInternal__deserializeBinaryArchiveDescriptorMachO_fileData___block_invoke_2;
    v16[3] = &unk_1E0FE2E70;
    v16[4] = &v17;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __96___MTLBinaryArchive_MTLBinaryArchiveInternal__deserializeBinaryArchiveDescriptorMachO_fileData___block_invoke_3;
    v15[3] = &unk_1E0FE2E98;
    v15[4] = a1[4];
    v15[5] = a6;
    +[MTLLoader deserializeMachOWrapperWithType:payloadHandler:reader:]((uint64_t)MTLLoader, 0, (uint64_t)v16, (uint64_t)v15);
    v12 = *((unsigned __int8 *)v18 + 24);
    _Block_object_dispose(&v17, 8);
    if (v12)
      return 0;
    v13 = (_QWORD *)a1[5];
    v14 = v13[5] - a6;
    v13[6] = v13[4] + a6;
    v13[7] = v14;
    return 1;
  }
  return result;
}

BOOL __96___MTLBinaryArchive_MTLBinaryArchiveInternal__deserializeBinaryArchiveDescriptorMachO_fileData___block_invoke_2(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;

  v3 = a3[1] | a3[2] | a3[3] | a3[4];
  if (v3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return v3 == 0;
}

uint64_t __96___MTLBinaryArchive_MTLBinaryArchiveInternal__deserializeBinaryArchiveDescriptorMachO_fileData___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 40) + a2;
  if ((unint64_t)(v3 + a3) <= *(_QWORD *)(a1 + 48))
    return objc_msgSend(*(id *)(a1 + 32), "bytes") + v3;
  else
    return 0;
}

uint64_t __96___MTLBinaryArchive_MTLBinaryArchiveInternal__deserializeBinaryArchiveDescriptorMachO_fileData___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32) + a2;
  if (v4 + a3 <= (unint64_t)objc_msgSend(*(id *)(a1 + 32), "length"))
    return objc_msgSend(*(id *)(a1 + 32), "bytes") + v4;
  else
    return 0;
}

void __75___MTLBinaryArchive_loadAirntBlocksForSlice_sliceOffset_skipAIRValidation___block_invoke_4_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 392), "UTF8String");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_2(&dword_182636000, MEMORY[0x1E0C81028], v1, "No binaries found in %s ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

@end
