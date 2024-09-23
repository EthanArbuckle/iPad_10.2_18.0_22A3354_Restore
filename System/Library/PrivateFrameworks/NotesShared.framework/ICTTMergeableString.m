@implementation ICTTMergeableString

- (BOOL)check:(id *)a3
{
  id v5;
  id v6;
  id v7;
  BOOL v8;
  id v9;
  unsigned int v10;
  unint64_t v11;
  _QWORD *v12;
  unsigned int v13;
  uint64_t *v14;
  uint64_t v15;
  id v16;
  int v17;
  id v18;
  int v19;
  void *v20;
  _BOOL4 v21;
  NSObject *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  BOOL v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  void *v34;
  _BYTE *v36;
  uint64_t v37;
  uint8_t buf;
  _BYTE v39[15];
  int v40;
  int v41;
  id v42;
  int v43;
  int v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  _QWORD v50[4];
  id v51;
  uint64_t *v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  const __CFString *v65;
  uint64_t v66;
  const __CFString *v67;
  uint64_t v68;
  _QWORD v69[3];

  v69[1] = *MEMORY[0x1E0C80C00];
  if (!hasLoop(*self->_startNodes.__begin_))
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v60 = 0;
    v61 = &v60;
    v62 = 0x2020000000;
    v63 = 1;
    v54 = 0;
    v55 = &v54;
    v56 = 0x3032000000;
    v57 = __Block_byref_object_copy__35;
    v58 = __Block_byref_object_dispose__36;
    v59 = 0;
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __29__ICTTMergeableString_check___block_invoke;
    v50[3] = &unk_1E76C8E70;
    v6 = v9;
    v51 = v6;
    v52 = &v54;
    v53 = &v60;
    -[ICTTMergeableString traverseUnordered:](self, "traverseUnordered:", v50);
    v10 = 0;
    LODWORD(v11) = 0;
    v36 = v39;
    v37 = *MEMORY[0x1E0CB2D68];
    while (1)
    {
      v12 = -[ICTTMergeableString orderedSubstrings](self, "orderedSubstrings", v36);
      v13 = v10;
      v14 = v61;
      if (v10 >= (unint64_t)((uint64_t)(v12[1] - *v12) >> 3) || !*((_BYTE *)v61 + 24))
        break;
      v15 = *(_QWORD *)(*(_QWORD *)-[ICTTMergeableString orderedSubstrings](self, "orderedSubstrings") + 8 * v10);
      v16 = *(id *)v15;
      *(_QWORD *)&v39[7] = v16;
      v17 = *(_DWORD *)(v15 + 16);
      v40 = *(_DWORD *)(v15 + 8);
      v41 = v17;
      v18 = *(id *)(v15 + 24);
      v42 = v18;
      v19 = *(_DWORD *)(v15 + 40);
      v43 = *(_DWORD *)(v15 + 32);
      v44 = v19;
      v45 = *(_BYTE *)(v15 + 44);
      v49 = 0;
      v47 = 0;
      v48 = 0;
      v46 = 0;
      if (!v45)
      {
        -[ICTTMergeableString attributedString](self, "attributedString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (v17 + v11);
        v21 = objc_msgSend(v20, "length") < v11;

        if (v21)
        {
          v22 = os_log_create("com.apple.notes", "Topotext");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            -[ICTTMergeableString check:].cold.2(&buf, v36, v22);

          *((_BYTE *)v61 + 24) = 0;
          v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v66 = v37;
          v67 = CFSTR("ICTTMergeableString substring max > string max.");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v23, "initWithDomain:code:userInfo:", CFSTR("TopoText"), -3, v24);
          v26 = (void *)v55[5];
          v55[5] = v25;

          v14 = v61;
          break;
        }
      }

      v10 = v13 + 1;
    }
    if (*((_BYTE *)v14 + 24))
    {
      -[ICTTMergeableString attributedString](self, "attributedString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "length") == v11;

      if (!v28)
      {
        *((_BYTE *)v61 + 24) = 0;
        v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v64 = v37;
        v65 = CFSTR("ICTTMergeableString length of substrings != attributedString length.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v29, "initWithDomain:code:userInfo:", CFSTR("TopoText"), -4, v30);
        v32 = (void *)v55[5];
        v55[5] = v31;

        -[ICTTMergeableString dumpData](self, "dumpData");
        v33 = os_log_create("com.apple.notes", "Topotext");
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          -[ICTTMergeableString check:].cold.1();

      }
    }
    if (a3)
    {
      v34 = (void *)v55[5];
      if (v34)
        *a3 = objc_retainAutorelease(v34);
    }
    v8 = *((_BYTE *)v61 + 24) != 0;

    _Block_object_dispose(&v54, 8);
    _Block_object_dispose(&v60, 8);
    goto LABEL_23;
  }
  if (a3)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v68 = *MEMORY[0x1E0CB2D68];
    v69[0] = CFSTR("ICTTMergeableString graph has loop.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, &v68, 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", CFSTR("TopoText"), -1, v6);
    v8 = 0;
    *a3 = v7;
LABEL_23:

    return v8;
  }
  return 0;
}

- (void)orderedSubstrings
{
  if (self->_cacheInvalid)
    -[ICTTMergeableString updateCache](self, "updateCache");
  return &self->_orderedSubstrings;
}

- (void)updateCache
{
  TopoSubstring **begin;
  vector<TopoSubstring *, std::allocator<TopoSubstring *>> *p_orderedSubstrings;
  TopoSubstring **v5;
  TopoSubstring **end;
  uint64_t v7;
  uint64_t v8;
  TopoSubstring **v9;
  _QWORD v10[5];

  p_orderedSubstrings = &self->_orderedSubstrings;
  begin = self->_orderedSubstrings.__begin_;
  self->_orderedSubstrings.__end_ = begin;
  self->_cacheInvalid = 0;
  v5 = self->_startNodes.__begin_;
  end = self->_startNodes.__end_;
  if (v5 == end)
  {
    v9 = begin;
  }
  else
  {
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = (uint64_t)*v5;
      v10[0] = v7;
      v10[1] = 3221225472;
      v10[2] = __34__ICTTMergeableString_updateCache__block_invoke;
      v10[3] = &unk_1E76C8E20;
      v10[4] = self;
      traverseIterative(v8, v10);
      ++v5;
    }
    while (v5 != end);
    begin = self->_orderedSubstrings.__begin_;
    v9 = self->_orderedSubstrings.__end_;
  }
  if (((char *)v9 - (char *)begin) >> 2 < (unint64_t)(self->_orderedSubstrings.__end_cap_.__value_ - begin))
    std::vector<TopoSubstring *>::shrink_to_fit((uint64_t)p_orderedSubstrings);
}

- (unint64_t)mergeWithString:(id)a3 mergeTimestamps:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  int v7;
  void *v8;
  id **v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  int v13;
  TopoSubstring ****v14;
  TopoSubstring ***v15;
  TopoSubstring ***v16;
  TopoSubstring **v17;
  uint64_t v18;
  id **v19;
  id *v20;
  unsigned int v21;
  unsigned int v22;
  char *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t *v26;
  unsigned int v27;
  unsigned int v28;
  TopoSubstring *v29;
  id v30;
  int v31;
  TopoSubstring **v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  TopoSubstring **v38;
  TopoSubstring *v39;
  uint64_t *v40;
  int v41;
  NSMutableAttributedString *attributedString;
  void *v43;
  uint64_t v44;
  uint64_t **v45;
  uint64_t **v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  void *v50;
  BOOL v51;
  char *v52;
  TopoSubstring **v53;
  unsigned int v54;
  unsigned int v55;
  __int128 *v56;
  NSMutableAttributedString *v57;
  int v58;
  NSMutableAttributedString *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id *v65;
  void *v66;
  void *v67;
  void *v68;
  TopoSubstring ****v69;
  TopoSubstring ***v70;
  TopoSubstring ***v71;
  char v72;
  uint64_t v73;
  id **v74;
  _QWORD *v75;
  _QWORD *v76;
  BOOL v77;
  uint64_t v78;
  _QWORD *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  BOOL v83;
  NSObject *v84;
  NSObject *v85;
  _QWORD *i;
  _QWORD *j;
  uint64_t v88;
  void *v89;
  _BOOL4 v91;
  uint64_t v92;
  id v93;
  char **v94;
  void *v95;
  id v96;
  id v97;
  TopoSubstring **v98;
  int v99;
  TopoSubstring *v100;
  uint64_t v101;
  __int128 v102;
  __int128 v103;
  int v104;
  __int128 v105;
  __int128 v106;
  int v107;
  __int128 v108;
  __int128 v109;
  int v110;
  __int128 v111;
  __int128 v112;
  int v113;
  _QWORD v114[4];
  int v115;
  uint64_t *v116;
  uint64_t v117;
  _QWORD v118[4];

  v4 = a4;
  v118[1] = *MEMORY[0x1E0C80C00];
  v96 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("DebugDumpMergeData"));

  if (v7)
    -[ICTTMergeableString dumpMergeData:](self, "dumpMergeData:", v96);
  -[ICTTMergeableString generateIdsForLocalChanges](self, "generateIdsForLocalChanges");
  objc_msgSend(v96, "generateIdsForLocalChanges");
  objc_msgSend(v96, "checkTimestampLogStyleErrors:", 0);
  if (!-[ICTTMergeableString canMergeString:](self, "canMergeString:", v96))
  {
    v11 = 0;
    goto LABEL_131;
  }
  -[ICTTMergeableString timestamp](self, "timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "timestamp");
  v9 = (id **)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "compareTo:", v9);

  if ((v10 & 1) != 0)
  {
    memset(v114, 0, sizeof(v114));
    v115 = 1065353216;
    v111 = 0u;
    v112 = 0u;
    v113 = 1065353216;
    v108 = 0u;
    v109 = 0u;
    v110 = 1065353216;
    v105 = 0u;
    v106 = 0u;
    v107 = 1065353216;
    v102 = 0u;
    v103 = 0u;
    v104 = 1065353216;
    v12 = -[NSMutableAttributedString length](self->_attributedString, "length");
    v13 = objc_msgSend(v96, "isFragment");
    v92 = v12;
    v91 = v4;
    v14 = -[ICTTMergeableString orderedSubstrings](self, "orderedSubstrings");
    v15 = *v14;
    v16 = v14[1];
    if (*v14 != v16)
    {
      v10 = (uint64_t)&std::piecewise_construct;
      do
      {
        v17 = *v15;
        v98 = v17;
        *((_QWORD *)std::__hash_table<std::__hash_value_type<TopoID,TopoSubstring *>,std::__unordered_map_hasher<TopoID,std::__hash_value_type<TopoID,TopoSubstring *>,std::hash<TopoID>,std::equal_to<TopoID>,true>,std::__unordered_map_equal<TopoID,std::__hash_value_type<TopoID,TopoSubstring *>,std::equal_to<TopoID>,std::hash<TopoID>,true>,std::allocator<std::__hash_value_type<TopoID,TopoSubstring *>>>::__emplace_unique_key_args<TopoID,std::piecewise_construct_t const&,std::tuple<TopoID const&>,std::tuple<>>((uint64_t)v114, v17, (uint64_t)&std::piecewise_construct, (uint64_t *)&v98)+ 4) = v17;
        if (v13)
        {
          v18 = objc_msgSend(v96, "startNodes");
          v9 = *(id ***)v18;
          v19 = *(id ***)(v18 + 8);
          while (v9 != v19)
          {
            v20 = *v9;
            if (objc_msgSend(**v9, "isEqual:", *v17))
            {
              v21 = *((_DWORD *)v20 + 2);
              v22 = *((_DWORD *)v17 + 2);
              if (v21 >= v22 && v21 < *((_DWORD *)v17 + 4) + v22)
              {
                v98 = (TopoSubstring **)v20;
                *((_QWORD *)std::__hash_table<std::__hash_value_type<TopoID,TopoSubstring *>,std::__unordered_map_hasher<TopoID,std::__hash_value_type<TopoID,TopoSubstring *>,std::hash<TopoID>,std::equal_to<TopoID>,true>,std::__unordered_map_equal<TopoID,std::__hash_value_type<TopoID,TopoSubstring *>,std::equal_to<TopoID>,std::hash<TopoID>,true>,std::allocator<std::__hash_value_type<TopoID,TopoSubstring *>>>::__emplace_unique_key_args<TopoID,std::piecewise_construct_t const&,std::tuple<TopoID const&>,std::tuple<>>((uint64_t)v114, v20, (uint64_t)&std::piecewise_construct, (uint64_t *)&v98)+ 4) = v17;
              }
            }
            ++v9;
          }
        }
        ++v15;
      }
      while (v15 != v16);
    }
    v94 = (char **)objc_msgSend(v96, "orderedSubstrings");
    v23 = *v94;
    if (*v94 == v94[1])
    {
LABEL_48:
      v93 = 0;
    }
    else
    {
      v9 = (id **)&v100;
      while (1)
      {
        v24 = *(_QWORD *)v23;
        v25 = std::__hash_table<TopoID,std::hash<TopoID>,std::equal_to<TopoID>,std::allocator<TopoID>>::find<TopoID>(v114, *(_QWORD **)v23);
        v26 = v25;
        if (!v25)
          break;
        v101 = v25[4];
        v27 = *(_DWORD *)(v101 + 16);
        v28 = *(_DWORD *)(v24 + 16);
        if (v27 <= v28)
        {
          if (v27 < v28)
          {
            v98 = 0;
            v98 = -[ICTTMergeableString splitTopoSubstring:atIndex:](self, "splitTopoSubstring:atIndex:", v24);
            v23 = std::vector<TopoSubstring *>::insert((uint64_t)v94, v23 + 8, (char *)&v98) - 8;
          }
        }
        else
        {
          v100 = 0;
          v29 = -[ICTTMergeableString splitTopoSubstring:atIndex:](self, "splitTopoSubstring:atIndex:");
          v100 = v29;
          v30 = *(id *)v29;
          v31 = *((_DWORD *)v29 + 2);
          v32 = (TopoSubstring **)v30;
          v98 = v32;
          v99 = v31;
          v116 = (uint64_t *)&v98;
          *((_QWORD *)std::__hash_table<std::__hash_value_type<TopoID,TopoSubstring *>,std::__unordered_map_hasher<TopoID,std::__hash_value_type<TopoID,TopoSubstring *>,std::hash<TopoID>,std::equal_to<TopoID>,true>,std::__unordered_map_equal<TopoID,std::__hash_value_type<TopoID,TopoSubstring *>,std::equal_to<TopoID>,std::hash<TopoID>,true>,std::allocator<std::__hash_value_type<TopoID,TopoSubstring *>>>::__emplace_unique_key_args<TopoID,std::piecewise_construct_t const&,std::tuple<TopoID&&>,std::tuple<>>((uint64_t)v114, &v98, (uint64_t)&std::piecewise_construct, &v116)+ 4) = v29;

          if (std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::find<TopoSubstring *>(&v102, &v101))
          {
            v98 = (TopoSubstring **)&v101;
            v33 = std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::__emplace_unique_key_args<TopoSubstring *,std::piecewise_construct_t const&,std::tuple<TopoSubstring * const&>,std::tuple<>>((uint64_t)&v102, &v101, (uint64_t)&std::piecewise_construct, &v98)[3];
            v98 = &v100;
            std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::__emplace_unique_key_args<TopoSubstring *,std::piecewise_construct_t const&,std::tuple<TopoSubstring * const&>,std::tuple<>>((uint64_t)&v102, &v100, (uint64_t)&std::piecewise_construct, &v98)[3] = v33;
            std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::__erase_unique<TopoSubstring *>(&v102, &v101);
          }

        }
        v10 = *(_QWORD *)(v24 + 48);
        v34 = *(_QWORD *)(v24 + 56);
        while (v10 != v34)
        {
          v35 = *(_QWORD *)v10;
          v36 = std::__hash_table<TopoID,std::hash<TopoID>,std::equal_to<TopoID>,std::allocator<TopoID>>::find<TopoID>(v114, *(_QWORD **)v10);
          v116 = 0;
          if (v36)
          {
            v37 = v36[4];
            v116 = (uint64_t *)v37;
            if (*(_DWORD *)(v37 + 8) != *(_DWORD *)(v35 + 8)
              || (objc_msgSend(*(id *)v37, "isEqual:", *(_QWORD *)v35) & 1) == 0)
            {
              v38 = -[ICTTMergeableString splitTopoSubstring:atIndex:](self, "splitTopoSubstring:atIndex:");
              v98 = v38;
              *((_QWORD *)std::__hash_table<std::__hash_value_type<TopoID,TopoSubstring *>,std::__unordered_map_hasher<TopoID,std::__hash_value_type<TopoID,TopoSubstring *>,std::hash<TopoID>,std::equal_to<TopoID>,true>,std::__unordered_map_equal<TopoID,std::__hash_value_type<TopoID,TopoSubstring *>,std::equal_to<TopoID>,std::hash<TopoID>,true>,std::allocator<std::__hash_value_type<TopoID,TopoSubstring *>>>::__emplace_unique_key_args<TopoID,std::piecewise_construct_t const&,std::tuple<TopoID const&>,std::tuple<>>((uint64_t)v114, v38, (uint64_t)&std::piecewise_construct, (uint64_t *)&v98)+ 4) = v38;
              v116 = (uint64_t *)v38;
            }
          }
          else
          {
            v39 = (TopoSubstring *)operator new();
            TopoSubstring::TopoSubstring(v39, (TopoSubstring *)v35);
            v116 = v40;
            v98 = (TopoSubstring **)v35;
            *((_QWORD *)std::__hash_table<std::__hash_value_type<TopoID,TopoSubstring *>,std::__unordered_map_hasher<TopoID,std::__hash_value_type<TopoID,TopoSubstring *>,std::hash<TopoID>,std::equal_to<TopoID>,true>,std::__unordered_map_equal<TopoID,std::__hash_value_type<TopoID,TopoSubstring *>,std::equal_to<TopoID>,std::hash<TopoID>,true>,std::allocator<std::__hash_value_type<TopoID,TopoSubstring *>>>::__emplace_unique_key_args<TopoID,std::piecewise_construct_t const&,std::tuple<TopoID const&>,std::tuple<>>((uint64_t)v114, (_QWORD *)v35, (uint64_t)&std::piecewise_construct, (uint64_t *)&v98)+ 4) = v39;
            std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>((uint64_t)&v108, &v116, &v116);
            if (!*(_BYTE *)(v35 + 44))
            {
              v41 = ICTTBoundedCheckedCastNSUIntegerToUInt32(-[NSMutableAttributedString length](self->_attributedString, "length"));
              *((_DWORD *)v116 + 10) = v41;
              attributedString = self->_attributedString;
              objc_msgSend(v96, "string");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              if (*(_BYTE *)(v35 + 44))
                v44 = 0;
              else
                v44 = *(unsigned int *)(v35 + 16);
              -[NSMutableAttributedString ic_appendAttributedSubstring:fromRange:](attributedString, "ic_appendAttributedSubstring:fromRange:", v43, *(unsigned int *)(v35 + 40), v44);

            }
          }
          v100 = (TopoSubstring *)v26[4];
          v46 = (uint64_t **)*((_QWORD *)v100 + 6);
          v45 = (uint64_t **)*((_QWORD *)v100 + 7);
          if (v46 != v45)
          {
            while (*v46 != v116)
            {
              if (++v46 == v45)
              {
                v46 = (uint64_t **)*((_QWORD *)v100 + 7);
                break;
              }
            }
          }
          if (v46 == v45)
          {
            if (!std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::find<TopoSubstring *>(&v102, &v100))
            {
              v48 = *((_QWORD *)v100 + 6);
              v47 = *((_QWORD *)v100 + 7);
              v98 = &v100;
              std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::__emplace_unique_key_args<TopoSubstring *,std::piecewise_construct_t const&,std::tuple<TopoSubstring * const&>,std::tuple<>>((uint64_t)&v102, &v100, (uint64_t)&std::piecewise_construct, &v98)[3] = (v47 - v48) >> 3;
            }
            TopoSubstring::addChild(v100, (TopoSubstring *)v116);
          }
          v10 += 8;
        }
        v23 += 8;
        if (v23 == v94[1])
          goto LABEL_48;
      }
      v49 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v117 = *MEMORY[0x1E0CB2D68];
      v118[0] = CFSTR("Reached substring that is not in our graph.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v118, &v117, 1);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = (id)objc_msgSend(v49, "initWithDomain:code:userInfo:", CFSTR("TopoText"), -3, v50);

    }
    -[ICTTMergeableString invalidateCache](self, "invalidateCache");
    if (v93 || (v97 = 0, v51 = -[ICTTMergeableString check:](self, "check:", &v97), v93 = v97, !v51))
    {
      v84 = os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
        -[ICTTMergeableString mergeWithString:mergeTimestamps:].cold.2((uint64_t)v93, v84);

      v85 = os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
        -[ICTTMergeableString mergeWithString:mergeTimestamps:].cold.1();

      for (i = (_QWORD *)v103; i; i = (_QWORD *)*i)
        std::vector<TopoSubstring *>::resize(i[2] + 48, i[3]);
      traverseUnorderedSimple((uint64_t)*self->_startNodes.__begin_, &__block_literal_global_10);
      traverseUnorderedSimple((uint64_t)*self->_startNodes.__begin_, &__block_literal_global_68);
      -[NSMutableAttributedString replaceCharactersInRange:withString:](self->_attributedString, "replaceCharactersInRange:withString:", v92, -[NSMutableAttributedString length](self->_attributedString, "length") - v92, &stru_1E76DB108);
      for (j = (_QWORD *)v109; j; j = (_QWORD *)*j)
      {
        v88 = j[2];
        if (v88)
        {
          v89 = *(void **)(v88 + 48);
          if (v89)
          {
            *(_QWORD *)(v88 + 56) = v89;
            operator delete(v89);
          }

          MEMORY[0x1C3B7A848](v88, 0x1080C40D9F1C51ELL);
        }
      }
      -[ICTTMergeableString invalidateCache](self, "invalidateCache");
      -[ICTTMergeableString coalesce](self, "coalesce");
      -[ICTTMergeableString dumpMergeData:](self, "dumpMergeData:", v96);
      v11 = 0;
    }
    else
    {
      v52 = *v94;
      if (*v94 != v94[1])
      {
        v10 = (uint64_t)&v105;
        while (1)
        {
          v9 = *(id ***)v52;
          v53 = (TopoSubstring **)std::__hash_table<TopoID,std::hash<TopoID>,std::equal_to<TopoID>,std::allocator<TopoID>>::find<TopoID>(v114, *(_QWORD **)v52)[4];
          v98 = v53;
          v54 = *((_DWORD *)v53 + 8);
          v55 = *((_DWORD *)v9 + 8);
          if (v54 < v55)
            goto LABEL_55;
          if (v54 == v55 && -[TopoSubstring TTCompare:](v53[3], "TTCompare:", v9[3]) == -1)
            break;
LABEL_77:
          v52 += 8;
          if (v52 == v94[1])
            goto LABEL_78;
        }
        v53 = v98;
LABEL_55:
        if (*((_BYTE *)v53 + 44))
        {
          if (*((_BYTE *)v9 + 44))
          {
LABEL_65:
            if (!*((_BYTE *)v9 + 44))
            {
              v57 = self->_attributedString;
              if (*((_BYTE *)v98 + 44))
              {
                v58 = ICTTBoundedCheckedCastNSUIntegerToUInt32(-[NSMutableAttributedString length](self->_attributedString, "length"));
                *((_DWORD *)v98 + 10) = v58;
                v59 = self->_attributedString;
                objc_msgSend(v96, "string");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                if (*((_BYTE *)v9 + 44))
                  v61 = 0;
                else
                  v61 = *((unsigned int *)v9 + 4);
                -[NSMutableAttributedString ic_appendAttributedSubstring:fromRange:](v59, "ic_appendAttributedSubstring:fromRange:", v60, *((unsigned int *)v9 + 10), v61);
              }
              else
              {
                v62 = *((unsigned int *)v98 + 10);
                v63 = *((unsigned int *)v98 + 4);
                objc_msgSend(v96, "string");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                if (*((_BYTE *)v9 + 44))
                  v64 = 0;
                else
                  v64 = *((unsigned int *)v9 + 4);
                -[NSMutableAttributedString ic_replaceCharactersInRange:withAttributedSubstring:fromRange:](v57, "ic_replaceCharactersInRange:withAttributedSubstring:fromRange:", v62, v63, v60, *((unsigned int *)v9 + 10), v64);
              }

            }
            v65 = (id *)v98;
            *((_BYTE *)v98 + 44) = *((_BYTE *)v9 + 44);
            objc_storeStrong(v65 + 3, v9[3]);
            *((_DWORD *)v65 + 8) = *((_DWORD *)v9 + 8);
            goto LABEL_77;
          }
          v56 = &v108;
        }
        else if (*((_BYTE *)v9 + 44))
        {
          v56 = &v111;
        }
        else
        {
          v56 = &v105;
        }
        std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>((uint64_t)v56, &v98, &v98);
        goto LABEL_65;
      }
LABEL_78:
      -[ICTTMergeableString sortSplitNodes](self, "sortSplitNodes");
      -[ICTTMergeableString invalidateCache](self, "invalidateCache");
      objc_msgSend(v96, "invalidateCache");
      -[ICTTMergeableString updateAttributedStringAfterMerge](self, "updateAttributedStringAfterMerge");
      if (v91)
      {
        -[ICTTMergeableString timestamp](self, "timestamp");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "timestamp");
        v9 = (id **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "mergeWithTimestamp:", v9);

        -[ICTTMergeableString updateClock](self, "updateClock");
        -[ICTTMergeableString checkTimestampLogStyleErrors:](self, "checkTimestampLogStyleErrors:", 1);
      }
      -[ICTTMergeableString delegate](self, "delegate");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v67;
      if (v67)
      {
        v95 = v67;
        objc_msgSend(v67, "beginEditing");
        v69 = -[ICTTMergeableString orderedSubstrings](self, "orderedSubstrings");
        v70 = *v69;
        v71 = v69[1];
        if (*v69 != v71)
        {
          v72 = 0;
          v73 = 0;
          v74 = 0;
          do
          {
            v98 = *v70;
            v75 = std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::find<TopoSubstring *>(&v108, &v98);
            v76 = std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::find<TopoSubstring *>(&v111, &v98);
            v77 = v76 != 0;
            if (v75)
            {
              if (!*((_BYTE *)v98 + 44))
              {
                if ((v72 & 1) != 0)
                  v78 = v73;
                else
                  v78 = 0;
                if ((v72 & 1) == 0)
                {
                  v10 = 0;
                  v9 = v74;
                }
                v73 = v78 + *((unsigned int *)v98 + 4);
                v72 = 1;
              }
            }
            else
            {
              v79 = v76;
              if (v76)
              {
                if ((v72 & 1) != 0)
                  v80 = v73;
                else
                  v80 = 0;
                if ((v72 & 1) != 0)
                  v81 = v10;
                else
                  v81 = 0;
                if ((v72 & 1) == 0)
                  v9 = v74;
                v82 = *((unsigned int *)v98 + 4);
                v10 = v81 + v82;
                v73 = v80 - v82;
              }
              else if ((v72 & 1) != 0)
              {
                objc_msgSend(v95, "edited:range:changeInLength:", 2, v9, v10, v73);
                v74 = (id **)((char *)v74 + v73);
              }
              if (std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::find<TopoSubstring *>(&v105, &v98))
              {
                objc_msgSend(v95, "edited:range:changeInLength:", 1, v74, *((unsigned int *)v98 + 4), 0);
              }
              if (*((_BYTE *)v98 + 44))
                v83 = v79 == 0;
              else
                v83 = 0;
              if (v83)
              {
                v72 = 0;
              }
              else
              {
                v74 = (id **)((char *)v74 + *((unsigned int *)v98 + 4));
                v72 = v77;
              }
            }
            ++v70;
          }
          while (v70 != v71);
        }
        v68 = v95;
        objc_msgSend(v95, "endEditing");
      }
      if (*((_QWORD *)&v112 + 1) | *((_QWORD *)&v109 + 1) | *((_QWORD *)&v106 + 1))
        v11 = 2;
      else
        v11 = 1;

    }
    std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)&v102);
    std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)&v105);
    std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)&v108);
    std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)&v111);
    std::__hash_table<TopoID,std::hash<TopoID>,std::equal_to<TopoID>,std::allocator<TopoID>>::~__hash_table((uint64_t)v114);

    goto LABEL_131;
  }
  v11 = 1;
LABEL_131:

  return v11;
}

- (id)string
{
  return self->_attributedString;
}

- (void)invalidateCache
{
  self->_cacheInvalid = 1;
  self->_orderedSubstrings.__end_ = self->_orderedSubstrings.__begin_;
}

- (void)generateIdsForLocalChanges
{
  id v3;

  -[ICTTMergeableString timestamp](self, "timestamp");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[ICTTMergeableString generateIdsForLocalChangesSafeForSharedTimestamp:](self, "generateIdsForLocalChangesSafeForSharedTimestamp:", objc_msgSend(v3, "isDocumentShared"));

}

- (void)generateIdsForLocalChangesSafeForSharedTimestamp:(BOOL)a3
{
  _BOOL4 v3;
  void ****v5;
  void ***v6;
  void ***v7;
  char v8;
  void **v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  NSUUID *replicaUUID;
  NSUUID *v19;
  int replicaTextClock;
  uint64_t v21;
  int v22;
  NSUUID *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  ICTTVectorMultiTimestamp *timestamp;
  _BOOL4 v28;
  unint64_t replicaStyleClock;
  NSUUID *v30;
  int v31;
  int v32;
  id v33;
  int v34;
  int v35;

  if (self->_hasLocalChanges)
  {
    v3 = a3;
    replicaStyleClock = self->_replicaStyleClock;
    v5 = -[ICTTMergeableString orderedSubstrings](self, "orderedSubstrings");
    v6 = *v5;
    v7 = v5[1];
    if (*v5 == v7)
    {
      -[ICTTMergeableString cleanupObjectsNeedingUpdatedRanges](self, "cleanupObjectsNeedingUpdatedRanges");
      goto LABEL_32;
    }
    v28 = v3;
    v8 = 0;
    while (1)
    {
      v9 = *v6;
      v10 = **v6;
      objc_msgSend(MEMORY[0x1E0CB3A28], "CR_unserialized");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 == v11)
        break;
      v12 = v9[3];
      objc_msgSend(MEMORY[0x1E0CB3A28], "CR_unserialized");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == v13)
      {
        v14 = *((_DWORD *)v9 + 8);
        LODWORD(v15) = v14 + 8;
        if (*((_BYTE *)v9 + 44))
          v15 = v15;
        else
          v15 = (v14 + 1);
        if (replicaStyleClock <= v15)
          v16 = v15;
        else
          v16 = replicaStyleClock;
        if (v16 + 1 > self->_replicaStyleClock)
          v17 = v16 + 1;
        else
          v17 = self->_replicaStyleClock;
        self->_replicaStyleClock = v17;
        objc_storeStrong(v9 + 3, self->_replicaUUID);
        *((_DWORD *)v9 + 8) = v16;
LABEL_21:
        v8 = 1;
      }
      if (++v6 == v7)
      {
        -[ICTTMergeableString cleanupObjectsNeedingUpdatedRanges](self, "cleanupObjectsNeedingUpdatedRanges");
        if ((v8 & 1) == 0)
          goto LABEL_32;
        timestamp = self->_timestamp;
        if (v28)
        {
          if (-[ICTTVectorMultiTimestamp clockForUUID:atIndex:](timestamp, "clockForUUID:atIndex:", self->_replicaUUID, 0) < self->_replicaTextClock)-[ICTTVectorMultiTimestamp setClock:forUUID:atIndex:](self->_timestamp, "setClock:forUUID:atIndex:");
          if (-[ICTTVectorMultiTimestamp clockForUUID:atIndex:](self->_timestamp, "clockForUUID:atIndex:", self->_replicaUUID, 1) >= self->_replicaStyleClock)
          {
LABEL_32:
            self->_unserializedClock = 0;
            self->_hasLocalChanges = 0;
            return;
          }
        }
        else
        {
          -[ICTTVectorMultiTimestamp setClock:forUUID:atIndex:](timestamp, "setClock:forUUID:atIndex:", self->_replicaTextClock, self->_replicaUUID, 0);
        }
        -[ICTTVectorMultiTimestamp setClock:forUUID:atIndex:](self->_timestamp, "setClock:forUUID:atIndex:", self->_replicaStyleClock, self->_replicaUUID, 1);
        goto LABEL_32;
      }
    }
    replicaUUID = self->_replicaUUID;
    v19 = replicaUUID;
    replicaTextClock = self->_replicaTextClock;
    v21 = *((unsigned int *)v9 + 4);
    v33 = *v9;
    v22 = *((_DWORD *)v9 + 4);
    v34 = *((_DWORD *)v9 + 2);
    v35 = v22;
    v23 = v19;
    v30 = v23;
    v31 = replicaTextClock;
    v32 = v21;
    -[ICTTMergeableString updateTopoIDRange:toNewRangeID:](self, "updateTopoIDRange:toNewRangeID:", &v33, &v30);
    objc_storeStrong(v9, replicaUUID);
    v24 = v9[3];
    *((_DWORD *)v9 + 2) = replicaTextClock;
    *((_DWORD *)v9 + 4) = v21;
    self->_replicaTextClock += v21;
    objc_msgSend(MEMORY[0x1E0CB3A28], "CR_unserialized");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24 == v25)
    {
      objc_storeStrong(v9 + 3, self->_replicaUUID);
      *((_DWORD *)v9 + 8) = 0;
      v26 = self->_replicaStyleClock;
      if (v26 <= 1)
        v26 = 1;
      self->_replicaStyleClock = v26;
    }

    goto LABEL_21;
  }
}

- (void)checkTimestampLogStyleErrors:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__ICTTMergeableString_checkTimestampLogStyleErrors___block_invoke;
  v3[3] = &unk_1E76C8E98;
  v3[4] = self;
  v4 = a3;
  -[ICTTMergeableString traverseUnordered:](self, "traverseUnordered:", v3);
}

- (void)traverseUnordered:(id)a3
{
  TopoSubstring **end;
  uint64_t *begin;
  id v6;

  v6 = a3;
  begin = (uint64_t *)self->_startNodes.__begin_;
  end = self->_startNodes.__end_;
  while (begin != (uint64_t *)end)
    traverseUnordered(*begin++, v6);

}

- (void)updateAttributedStringAfterMerge
{
  NSMutableAttributedString *v3;
  _QWORD *v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableAttributedString *attributedString;

  v3 = (NSMutableAttributedString *)objc_alloc_init(MEMORY[0x1E0CB3778]);
  v4 = -[ICTTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v5 = (uint64_t *)*v4;
  v6 = (uint64_t *)v4[1];
  while (v5 != v6)
  {
    v7 = *v5;
    v8 = -[NSMutableAttributedString length](v3, "length");
    if (!*(_BYTE *)(v7 + 44))
      -[NSMutableAttributedString ic_appendAttributedSubstring:fromRange:](v3, "ic_appendAttributedSubstring:fromRange:", self->_attributedString, *(unsigned int *)(v7 + 40), *(unsigned int *)(v7 + 16));
    *(_DWORD *)(v7 + 40) = ICTTBoundedCheckedCastNSUIntegerToUInt32(v8);
    ++v5;
  }
  attributedString = self->_attributedString;
  self->_attributedString = v3;

}

- (void)sortSplitNodes
{
  id v2[4];

  minIdPath(*self->_startNodes.__begin_, (uint64_t)v2);

}

- (ICTTMergeableStringDelegate)delegate
{
  return (ICTTMergeableStringDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSMutableAttributedString)attributedString
{
  return self->_attributedString;
}

- (void)dealloc
{
  TopoSubstring **begin;
  TopoSubstring **end;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  objc_super v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  uint64_t (*v17)(uint64_t);
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  int v21;

  v13 = 0;
  v14 = &v13;
  v15 = 0x5812000000;
  v16 = __Block_byref_object_copy__10;
  v17 = __Block_byref_object_dispose__11;
  v18 = 0u;
  v19 = 0u;
  v20 = 0;
  v21 = 1065353216;
  begin = self->_startNodes.__begin_;
  end = self->_startNodes.__end_;
  if (begin == end)
  {
    v7 = (_QWORD *)&v19 + 1;
  }
  else
  {
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v6 = (uint64_t)*begin;
      v12[0] = v5;
      v12[1] = 3221225472;
      v12[2] = __30__ICTTMergeableString_dealloc__block_invoke;
      v12[3] = &unk_1E76C8D80;
      v12[4] = &v13;
      traverseUnordered(v6, v12);
      ++begin;
    }
    while (begin != end);
    v7 = v14 + 8;
  }
  v8 = (_QWORD *)*v7;
  if (*v7)
  {
    do
    {
      v9 = v8[2];
      if (v9)
      {
        v10 = *(void **)(v9 + 48);
        if (v10)
        {
          *(_QWORD *)(v9 + 56) = v10;
          operator delete(v10);
        }

        MEMORY[0x1C3B7A848](v9, 0x1080C40D9F1C51ELL);
      }
      v8 = (_QWORD *)*v8;
    }
    while (v8);
  }
  _Block_object_dispose(&v13, 8);
  std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)&v18 + 8);
  v11.receiver = self;
  v11.super_class = (Class)ICTTMergeableString;
  -[ICTTMergeableString dealloc](&v11, sel_dealloc);
}

- (ICTTMergeableString)initWithData:(id)a3 replicaID:(id)a4
{
  return -[ICTTMergeableString initWithData:replicaID:fragment:](self, "initWithData:replicaID:fragment:", a3, a4, 0);
}

- (unint64_t)mergeWithString:(id)a3
{
  return -[ICTTMergeableString mergeWithString:mergeTimestamps:](self, "mergeWithString:mergeTimestamps:", a3, 1);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ICTTMergeableString)initWithReplicaID:(id)a3 asFragment:(BOOL)a4
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  ICTTVectorMultiTimestamp *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  objc_super v18;
  uint64_t __src;
  uint64_t v20;
  TopoID v21;
  TopoID v22;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ICTTMergeableString;
  v8 = -[ICTTMergeableString init](&v18, sel_init);
  if (v8)
  {
    if (!v7)
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "replicaID", "-[ICTTMergeableString initWithReplicaID:asFragment:]", 1, 0, CFSTR("Trying to create a mergeable string without a replica ID"));
    objc_storeStrong((id *)v8 + 15, a3);
    *((_DWORD *)v8 + 20) = 0;
    if (!a4)
    {
      v9 = operator new();
      objc_msgSend(MEMORY[0x1E0CB3A28], "TTZero");
      v21.replicaID = (NSUUID *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v21.clock = 0;
      TopoSubstring::TopoSubstring((TopoSubstring *)v9, v21, 0, 0);
      v10 = operator new();
      objc_msgSend(MEMORY[0x1E0CB3A28], "TTZero");
      v22.replicaID = (NSUUID *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v22.clock = 0xFFFFFFFFLL;
      TopoSubstring::TopoSubstring((TopoSubstring *)v10, v22, 0, 0);
      __src = v10;
      std::vector<TopoSubstring *>::__assign_with_size[abi:ne180100]<TopoSubstring * const*,TopoSubstring * const*>((char *)(v9 + 48), (char *)&__src, (uint64_t)&v20, 1uLL);
      *(_DWORD *)(v10 + 72) = 1;
      __src = v9;
      std::vector<TopoSubstring *>::__assign_with_size[abi:ne180100]<TopoSubstring * const*,TopoSubstring * const*>((char *)v8 + 8, (char *)&__src, (uint64_t)&v20, 1uLL);
      __src = v10;
      std::vector<TopoSubstring *>::__assign_with_size[abi:ne180100]<TopoSubstring * const*,TopoSubstring * const*>((char *)v8 + 32, (char *)&__src, (uint64_t)&v20, 1uLL);
    }
    v11 = -[ICTTVectorMultiTimestamp initWithCapacity:]([ICTTVectorMultiTimestamp alloc], "initWithCapacity:", 2);
    v12 = (void *)*((_QWORD *)v8 + 16);
    *((_QWORD *)v8 + 16) = v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 5);
    v14 = (void *)*((_QWORD *)v8 + 18);
    *((_QWORD *)v8 + 18) = v13;

    *((_BYTE *)v8 + 96) = 1;
    v15 = objc_alloc_init(MEMORY[0x1E0CB3778]);
    v16 = (void *)*((_QWORD *)v8 + 19);
    *((_QWORD *)v8 + 19) = v15;

  }
  return (ICTTMergeableString *)v8;
}

- (ICTTMergeableString)initWithReplicaID:(id)a3
{
  return -[ICTTMergeableString initWithReplicaID:asFragment:](self, "initWithReplicaID:asFragment:", a3, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 9) = 0;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (BOOL)canMergeString:(id)a3
{
  id v4;
  BOOL v5;
  uint64_t v6;
  id **v7;
  id **v8;
  id *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  _QWORD *v15;
  id **v16;
  id **v17;
  id *v18;
  id v19;
  int v20;
  int v21;
  id v22;
  id v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  int v28;

  v4 = a3;
  if (-[ICTTMergeableString isFragment](self, "isFragment"))
  {
    v5 = 0;
  }
  else if (objc_msgSend(v4, "isFragment"))
  {
    v26 = 0u;
    v27 = 0u;
    v28 = 1065353216;
    v6 = objc_msgSend(v4, "startNodes");
    v7 = *(id ***)v6;
    v8 = *(id ***)(v6 + 8);
    while (v7 != v8)
    {
      v9 = *v7;
      v10 = **v7;
      v11 = (*((_DWORD *)v9 + 2) + *((_DWORD *)v9 + 4) - 1);
      v24 = v10;
      v25 = v11;
      std::__hash_table<TopoID,std::hash<TopoID>,std::equal_to<TopoID>,std::allocator<TopoID>>::__emplace_unique_key_args<TopoID,TopoID>((uint64_t)&v26, &v24, (uint64_t *)&v24);

      ++v7;
    }
    v12 = objc_msgSend(v4, "endNodes");
    v13 = *(uint64_t **)v12;
    v14 = *(uint64_t **)(v12 + 8);
    while (v13 != v14)
    {
      std::__hash_table<TopoID,std::hash<TopoID>,std::equal_to<TopoID>,std::allocator<TopoID>>::__emplace_unique_key_args<TopoID,TopoID const&>((uint64_t)&v26, (_QWORD *)*v13, *v13);
      ++v13;
    }
    v15 = -[ICTTMergeableString orderedSubstrings](self, "orderedSubstrings");
    v16 = (id **)*v15;
    v17 = (id **)v15[1];
LABEL_12:
    if (v16 != v17)
    {
      v18 = *v16;
      v19 = **v16;
      v20 = *((_DWORD *)v18 + 2);
      if (*((_DWORD *)v18 + 4) <= 1u)
        v21 = 1;
      else
        v21 = *((_DWORD *)v18 + 4);
      while (1)
      {
        v22 = v19;
        v24 = v22;
        LODWORD(v25) = v20;
        std::__hash_table<TopoID,std::hash<TopoID>,std::equal_to<TopoID>,std::allocator<TopoID>>::__erase_unique<TopoID>(&v26, &v24);

        if (!*((_QWORD *)&v27 + 1))
          break;
        ++v20;
        if (!--v21)
        {

          ++v16;
          goto LABEL_12;
        }
      }

    }
    v5 = *((_QWORD *)&v27 + 1) == 0;
    std::__hash_table<TopoID,std::hash<TopoID>,std::equal_to<TopoID>,std::allocator<TopoID>>::~__hash_table((uint64_t)&v26);
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (BOOL)isFragment
{
  TopoSubstring **begin;
  TopoSubstring *v4;
  void *v5;
  int v6;
  char v7;
  TopoSubstring *v8;

  begin = self->_startNodes.__begin_;
  if ((TopoSubstring **)((char *)self->_startNodes.__end_ - (char *)begin) != (TopoSubstring **)8
    || (TopoSubstring **)((char *)self->_endNodes.__end_ - (char *)self->_endNodes.__begin_) != (TopoSubstring **)8)
  {
    goto LABEL_9;
  }
  v4 = *begin;
  objc_msgSend(MEMORY[0x1E0CB3A28], "TTZero");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (*((_DWORD *)v4 + 2))
    goto LABEL_4;
  v7 = objc_msgSend(*(id *)v4, "isEqual:", v5);

  if ((v7 & 1) == 0)
  {
LABEL_9:
    LOBYTE(v6) = 1;
    return v6;
  }
  v8 = *self->_endNodes.__begin_;
  objc_msgSend(MEMORY[0x1E0CB3A28], "TTZero");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (*((_DWORD *)v8 + 2) == -1)
  {
    v6 = objc_msgSend(*(id *)v8, "isEqual:", v5) ^ 1;
    goto LABEL_5;
  }
LABEL_4:
  LOBYTE(v6) = 1;
LABEL_5:

  return v6;
}

- (ICTTMergeableString)initWithArchive:(const void *)a3 replicaID:(id)a4 orderedSubstrings:(void *)a5 timestamp:(id)a6 fragment:(BOOL)a7
{
  id v11;
  ICTTVectorMultiTimestamp *v12;
  ICTTMergeableString *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unint64_t v20;
  uint64_t i;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  uint64_t *v30;
  char *v31;
  char *v32;
  uint64_t v33;
  ICTTVectorMultiTimestamp *v34;
  ICTTVectorMultiTimestamp *v35;
  ICTTVectorMultiTimestamp *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  void *v43;
  NSObject *v44;
  ICTTMergeableString *v45;
  char v46;
  unint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  void *v56;
  topotext::Substring *v57;
  uint64_t v58;
  int v59;
  _BOOL4 v60;
  void *v61;
  void *v62;
  topotext::Substring *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  BOOL v67;
  int v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  void **v72;
  char *v73;
  unint64_t v74;
  _QWORD *v75;
  _QWORD *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  char *v81;
  char *v82;
  char *v83;
  char *v84;
  uint64_t v85;
  void **v86;
  char *v87;
  unint64_t v88;
  _QWORD *v89;
  _QWORD *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  char *v95;
  char *v96;
  char *v97;
  char *v98;
  uint64_t v99;
  NSObject *v100;
  BOOL v101;
  NSObject *v102;
  _QWORD *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  char v107;
  ICTTMergeableString *v108;
  NSObject *v110;
  NSObject *v112;
  void *v113;
  char *v114;
  BOOL v115;
  void *v116;
  char v117;
  void *v118;
  ICTTVectorMultiTimestamp *v119;
  void *v120;
  void *v121;
  unint64_t v122;
  _BOOL4 v123;
  int v124;
  NSObject *v125;
  int v126;
  unint64_t v127;
  int v128;
  void *v130;
  id obj;
  TopoSubstring *v132;
  _QWORD v133[4];
  int v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  char *v139;
  char *v140;
  unint64_t v141;
  _BYTE v142[128];
  uint64_t v143;

  v143 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = (ICTTVectorMultiTimestamp *)a6;
  v130 = v11;
  v13 = -[ICTTMergeableString initWithReplicaID:asFragment:](self, "initWithReplicaID:asFragment:", v11, 1);

  if (!v13)
    goto LABEL_150;
  if ((*((_BYTE *)a3 + 32) & 1) == 0
    || ((v14 = objc_alloc(MEMORY[0x1E0CB3940]), v15 = (uint64_t *)*((_QWORD *)a3 + 5), *((char *)v15 + 23) < 0)
      ? (v15 = (uint64_t *)*v15, v16 = *(_QWORD *)(*((_QWORD *)a3 + 5) + 8))
      : (v16 = *((unsigned __int8 *)v15 + 23)),
        (v17 = objc_msgSend(v14, "initWithBytes:length:encoding:", v15, v16, 4)) == 0))
  {
    v44 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      -[ICTTMergeableString(ICTTMergeableStringPersistenceAdditions) initWithArchive:replicaID:orderedSubstrings:timestamp:fragment:].cold.1();

    v45 = 0;
    goto LABEL_152;
  }
  v18 = (void *)v17;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v17);
  v115 = a7;
  v119 = v12;
  v120 = v18;
  -[ICTTMergeableString setAttributedString:](v13, "setAttributedString:", v19);

  v20 = *((unsigned int *)a3 + 14);
  v139 = 0;
  v140 = 0;
  v141 = 0;
  std::vector<TopoSubstring *>::reserve((void **)&v139, v20);
  if ((_DWORD)v20)
  {
    for (i = 0; i != v20; ++i)
    {
      v22 = operator new();
      v23 = v22;
      *(_QWORD *)v22 = 0;
      *(_QWORD *)(v22 + 24) = 0;
      *(_QWORD *)(v22 + 56) = 0;
      *(_QWORD *)(v22 + 64) = 0;
      *(_QWORD *)(v22 + 48) = 0;
      *(_DWORD *)(v22 + 72) = 0;
      v24 = v140;
      if ((unint64_t)v140 >= v141)
      {
        v26 = (v140 - v139) >> 3;
        if ((unint64_t)(v26 + 1) >> 61)
          std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
        v27 = (uint64_t)(v141 - (_QWORD)v139) >> 2;
        if (v27 <= v26 + 1)
          v27 = v26 + 1;
        if (v141 - (unint64_t)v139 >= 0x7FFFFFFFFFFFFFF8)
          v28 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v28 = v27;
        if (v28)
          v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)&v141, v28);
        else
          v29 = 0;
        v30 = (uint64_t *)&v29[8 * v26];
        *v30 = v23;
        v25 = (char *)(v30 + 1);
        v32 = v139;
        v31 = v140;
        if (v140 != v139)
        {
          do
          {
            v33 = *((_QWORD *)v31 - 1);
            v31 -= 8;
            *--v30 = v33;
          }
          while (v31 != v32);
          v31 = v139;
        }
        v139 = (char *)v30;
        v140 = v25;
        v141 = (unint64_t)&v29[8 * v28];
        if (v31)
          operator delete(v31);
      }
      else
      {
        *(_QWORD *)v140 = v22;
        v25 = v24 + 8;
      }
      v140 = v25;
    }
  }
  v34 = v12;
  if (!v12)
  {
    v35 = [ICTTVectorMultiTimestamp alloc];
    v36 = v35;
    v37 = *((_QWORD *)a3 + 9);
    if (!v37)
      v37 = *(_QWORD *)(topotext::String::default_instance((topotext::String *)v35) + 72);
    v34 = -[ICTTVectorMultiTimestamp initWithArchive:andCapacity:](v36, "initWithArchive:andCapacity:", v37, 2);
  }
  -[ICTTMergeableString setTimestamp:](v13, "setTimestamp:", v34);
  if (!v12)

  -[ICTTMergeableString timestamp](v13, "timestamp");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "sortedUUIDs");
  v121 = (void *)objc_claimAutoreleasedReturnValue();

  v122 = objc_msgSend(v121, "count");
  v137 = 0u;
  v138 = 0u;
  v135 = 0u;
  v136 = 0u;
  obj = v121;
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v135, v142, 16);
  if (v39)
  {
    v40 = *(_QWORD *)v136;
    while (2)
    {
      for (j = 0; j != v39; ++j)
      {
        if (*(_QWORD *)v136 != v40)
          objc_enumerationMutation(obj);
        v42 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0CB3A28], "TTZero");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v42) = objc_msgSend(v42, "isEqual:", v43);

        if ((v42 & 1) != 0)
        {
          v128 = 0;
          v117 = 1;
          goto LABEL_45;
        }
      }
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v135, v142, 16);
      if (v39)
        continue;
      break;
    }
  }
  v117 = 0;
  v128 = 1;
LABEL_45:

  memset(v133, 0, sizeof(v133));
  v134 = 1065353216;
  v46 = v128 ^ 1;
  if (!(_DWORD)v20)
    v46 = 1;
  if ((v46 & 1) != 0)
  {
    v126 = 0;
    LODWORD(v127) = 0;
LABEL_126:
    -[ICTTMergeableString attributedString](v13, "attributedString", v114);
    v45 = (ICTTMergeableString *)objc_claimAutoreleasedReturnValue();
    v101 = -[ICTTMergeableString length](v45, "length") == v127;

    if (v101)
    {
      if (!v128 || ((v126 ^ 1) & 1) != 0 || v115)
      {
        if (!v128 || v115)
        {
          if (!v128)
          {
LABEL_135:
            v103 = -[ICTTMergeableString startNodes](v13, "startNodes");
            v103[1] = *v103;
            if ((_DWORD)v20)
            {
              v104 = 0;
              do
              {
                v105 = *(_QWORD *)&v139[v104];
                if (v105)
                {
                  v106 = *(void **)(v105 + 48);
                  if (v106)
                  {
                    *(_QWORD *)(v105 + 56) = v106;
                    operator delete(v106);
                  }

                  MEMORY[0x1C3B7A848](v105, 0x1080C40D9F1C51ELL);
                }
                v104 += 8;
              }
              while (8 * v20 != v104);
            }
          }
        }
        else
        {
          -[ICTTMergeableString updateClock](v13, "updateClock");
        }
        v107 = 1;
        if (a5 && &v139 != a5)
          std::vector<TopoSubstring *>::__assign_with_size[abi:ne180100]<TopoSubstring * const*,TopoSubstring * const*>((char *)a5, v139, (uint64_t)v140, (v140 - v139) >> 3);
        goto LABEL_145;
      }
      v102 = os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
        -[ICTTMergeableString(ICTTMergeableStringPersistenceAdditions) initWithArchive:replicaID:orderedSubstrings:timestamp:fragment:].cold.2();
    }
    else
    {
      v102 = os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
        -[ICTTMergeableString check:].cold.1();
    }

    v128 = 0;
    goto LABEL_135;
  }
  v47 = 0;
  v126 = 0;
  LODWORD(v127) = 0;
  v48 = (char *)a3 + 48;
  v114 = (char *)a3 + 48;
  while (1)
  {
    v49 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::Substring>::TypeHandler>((uint64_t)v48, v47);
    v50 = v49;
    if ((~*(_DWORD *)(v49 + 32) & 7) != 0)
    {
      v100 = os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
        -[ICTTMergeableString(ICTTMergeableStringPersistenceAdditions) initWithArchive:replicaID:orderedSubstrings:timestamp:fragment:].cold.7();
      v128 = 0;
      goto LABEL_125;
    }
    v51 = *(_QWORD *)(v49 + 40);
    if (!v51)
    {
      v49 = topotext::Substring::default_instance((topotext::Substring *)v49);
      v51 = *(_QWORD *)(v49 + 40);
    }
    v52 = *(unsigned int *)(v51 + 40);
    v53 = *(_QWORD *)(v50 + 48);
    if (!v53)
      v53 = *(_QWORD *)(topotext::Substring::default_instance((topotext::Substring *)v49) + 48);
    v54 = *(unsigned int *)(v53 + 40);
    if (v122 < v52 || v122 < v54)
    {
      v110 = os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
        -[ICTTMergeableString(ICTTMergeableStringPersistenceAdditions) initWithArchive:replicaID:orderedSubstrings:timestamp:fragment:].cold.4();
      v125 = 0;
LABEL_123:

      v128 = 0;
LABEL_124:
      v100 = v125;
LABEL_125:

      goto LABEL_126;
    }
    if ((_DWORD)v52)
      objc_msgSend(obj, "objectAtIndexedSubscript:", (v52 - 1));
    else
      objc_msgSend(MEMORY[0x1E0CB3A28], "TTZero");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v125 = v56;

    v58 = *(_QWORD *)(v50 + 40);
    if (!v58)
      v58 = *(_QWORD *)(topotext::Substring::default_instance(v57) + 40);
    v123 = v52 == 0;
    v124 = *(_DWORD *)(v58 + 44);
    v59 = *(_DWORD *)(v50 + 56);
    v60 = v54 == 0;
    if ((_DWORD)v54)
    {
      objc_msgSend(obj, "objectAtIndexedSubscript:", (v54 - 1));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = v61;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "TTZero");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v116 = v61;
    }
    objc_storeStrong((id *)(*(_QWORD *)&v139[8 * v47] + 24), v61);
    v62 = v116;
    if ((_DWORD)v54)
      v62 = v118;

    v64 = *(_QWORD *)(v50 + 48);
    if (!v64)
      v64 = *(_QWORD *)(topotext::Substring::default_instance(v63) + 48);
    v65 = *(_QWORD *)&v139[8 * v47];
    *(_DWORD *)(v65 + 32) = *(_DWORD *)(v64 + 44);
    *(_DWORD *)(v65 + 40) = v127;
    if ((*(_BYTE *)(v50 + 32) & 8) != 0 && *(_BYTE *)(v50 + 60))
    {
      *(_BYTE *)(v65 + 44) = 1;
      goto LABEL_76;
    }
    *(_BYTE *)(v65 + 44) = 0;
    -[ICTTMergeableString attributedString](v13, "attributedString", v114);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = (v59 + v127);
    v67 = objc_msgSend(v66, "length") < v127;

    if (v67)
      break;
    v65 = *(_QWORD *)&v139[8 * v47];
LABEL_76:
    objc_storeStrong((id *)v65, v56);
    v126 |= v123 ^ v60;
    *(_DWORD *)(v65 + 8) = v124;
    *(_DWORD *)(v65 + 16) = v59;
    v68 = *(_DWORD *)(v50 + 72);
    if (v68)
    {
      v69 = 0;
      v70 = v50 + 64;
      while (1)
      {
        v71 = *(unsigned int *)google::protobuf::RepeatedField<unsigned int>::Get(v70, v69);
        if (v71 >= v20)
          break;
        v132 = 0;
        v132 = *(TopoSubstring **)&v139[8 * v71];
        TopoSubstring::addChild(*(TopoSubstring **)&v139[8 * v47], v132);
        std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>((uint64_t)v133, &v132, &v132);
        if (v68 == ++v69)
          goto LABEL_80;
      }
      v110 = os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
        -[ICTTMergeableString(ICTTMergeableStringPersistenceAdditions) initWithArchive:replicaID:orderedSubstrings:timestamp:fragment:].cold.5();
      goto LABEL_123;
    }
LABEL_80:
    if ((v117 & 1) != 0)
      goto LABEL_124;
    if (std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::find<TopoSubstring *>(v133, &v139[8 * v47]))
    {
      if (!v68)
        goto LABEL_101;
    }
    else
    {
      v72 = -[ICTTMergeableString startNodes](v13, "startNodes");
      v73 = v139;
      v74 = (unint64_t)v72[2];
      v75 = v72[1];
      if ((unint64_t)v75 >= v74)
      {
        v77 = ((char *)v75 - (_BYTE *)*v72) >> 3;
        if ((unint64_t)(v77 + 1) >> 61)
          goto LABEL_170;
        v78 = v74 - (_QWORD)*v72;
        v79 = v78 >> 2;
        if (v78 >> 2 <= (unint64_t)(v77 + 1))
          v79 = v77 + 1;
        if ((unint64_t)v78 >= 0x7FFFFFFFFFFFFFF8)
          v80 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v80 = v79;
        if (v80)
          v81 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)(v72 + 2), v80);
        else
          v81 = 0;
        v82 = &v81[8 * v77];
        *(_QWORD *)v82 = *(_QWORD *)&v73[8 * v47];
        v76 = v82 + 8;
        v84 = (char *)*v72;
        v83 = (char *)v72[1];
        if (v83 != *v72)
        {
          do
          {
            v85 = *((_QWORD *)v83 - 1);
            v83 -= 8;
            *((_QWORD *)v82 - 1) = v85;
            v82 -= 8;
          }
          while (v83 != v84);
          v83 = (char *)*v72;
        }
        *v72 = v82;
        v72[1] = v76;
        v72[2] = &v81[8 * v80];
        if (v83)
          operator delete(v83);
      }
      else
      {
        *v75 = *(_QWORD *)&v139[8 * v47];
        v76 = v75 + 1;
      }
      v72[1] = v76;
      if (!v68)
      {
LABEL_101:
        v86 = -[ICTTMergeableString endNodes](v13, "endNodes", v114);
        v87 = v139;
        v88 = (unint64_t)v86[2];
        v89 = v86[1];
        if ((unint64_t)v89 >= v88)
        {
          v91 = ((char *)v89 - (_BYTE *)*v86) >> 3;
          if ((unint64_t)(v91 + 1) >> 61)
LABEL_170:
            std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
          v92 = v88 - (_QWORD)*v86;
          v93 = v92 >> 2;
          if (v92 >> 2 <= (unint64_t)(v91 + 1))
            v93 = v91 + 1;
          if ((unint64_t)v92 >= 0x7FFFFFFFFFFFFFF8)
            v94 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v94 = v93;
          if (v94)
            v95 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)(v86 + 2), v94);
          else
            v95 = 0;
          v96 = &v95[8 * v91];
          *(_QWORD *)v96 = *(_QWORD *)&v87[8 * v47];
          v90 = v96 + 8;
          v98 = (char *)*v86;
          v97 = (char *)v86[1];
          if (v97 != *v86)
          {
            do
            {
              v99 = *((_QWORD *)v97 - 1);
              v97 -= 8;
              *((_QWORD *)v96 - 1) = v99;
              v96 -= 8;
            }
            while (v97 != v98);
            v97 = (char *)*v86;
          }
          *v86 = v96;
          v86[1] = v90;
          v86[2] = &v95[8 * v94];
          if (v97)
            operator delete(v97);
        }
        else
        {
          *v89 = *(_QWORD *)&v139[8 * v47];
          v90 = v89 + 1;
        }
        v86[1] = v90;
      }
    }

    ++v47;
    v48 = v114;
    if (v47 >= v20)
      goto LABEL_126;
  }
  -[ICTTMergeableString dumpData](v13, "dumpData");
  v112 = os_log_create("com.apple.notes", "Topotext");
  if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
    -[ICTTMergeableString(ICTTMergeableStringPersistenceAdditions) initWithArchive:replicaID:orderedSubstrings:timestamp:fragment:].cold.6();

  v45 = (ICTTMergeableString *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithReplicaID:", v130);
  -[ICTTMergeableString attributedString](v13, "attributedString");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTTMergeableString insertAttributedString:atIndex:](v45, "insertAttributedString:atIndex:", v113, 0);

  v13 = 0;
  v107 = 0;
LABEL_145:
  std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)v133);

  if (v139)
  {
    v140 = v139;
    operator delete(v139);
  }

  if ((v107 & 1) != 0)
  {
    v12 = v119;
    if (!v128)
    {
      v108 = 0;
      goto LABEL_151;
    }
LABEL_150:
    v108 = v13;
LABEL_151:
    v45 = v108;
  }
  else
  {
    v12 = v119;
  }
LABEL_152:

  return v45;
}

void __34__ICTTMergeableString_updateCache__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  _QWORD *v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
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

  v3 = *(_QWORD **)(a1 + 32);
  v4 = (_QWORD *)v3[8];
  v5 = v3[9];
  if ((unint64_t)v4 >= v5)
  {
    v7 = v3[7];
    v8 = ((uint64_t)v4 - v7) >> 3;
    if ((unint64_t)(v8 + 1) >> 61)
      std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
    v9 = v5 - v7;
    v10 = v9 >> 2;
    if (v9 >> 2 <= (unint64_t)(v8 + 1))
      v10 = v8 + 1;
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFF8)
      v11 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    if (v11)
      v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)(v3 + 9), v11);
    else
      v12 = 0;
    v13 = &v12[8 * v8];
    v14 = &v12[8 * v11];
    *(_QWORD *)v13 = a2;
    v6 = v13 + 8;
    v16 = (char *)v3[7];
    v15 = (char *)v3[8];
    if (v15 != v16)
    {
      do
      {
        v17 = *((_QWORD *)v15 - 1);
        v15 -= 8;
        *((_QWORD *)v13 - 1) = v17;
        v13 -= 8;
      }
      while (v15 != v16);
      v15 = (char *)v3[7];
    }
    v3[7] = v13;
    v3[8] = v6;
    v3[9] = v14;
    if (v15)
      operator delete(v15);
  }
  else
  {
    *v4 = a2;
    v6 = v4 + 1;
  }
  v3[8] = v6;
}

_QWORD *__30__ICTTMergeableString_dealloc__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = a2;
  return std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48, &v3, &v3);
}

void __29__ICTTMergeableString_check___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = *(id *)a2;
  v7 = *(unsigned int *)(a2 + 16);
  if ((_DWORD)v7)
  {
    v8 = *(unsigned int *)(a2 + 8);
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      if (objc_msgSend(v9, "intersectsIndexesInRange:", v8, v7))
      {
        v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v16 = *MEMORY[0x1E0CB2D68];
        v17[0] = CFSTR("ICTTMergeableString graph has two characters with the same id.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "initWithDomain:code:userInfo:", CFSTR("TopoText"), -2, v12);
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v15 = *(void **)(v14 + 40);
        *(_QWORD *)(v14 + 40) = v13;

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
        *a3 = 1;
      }
      else
      {
        objc_msgSend(v10, "addIndexesInRange:", v8, v7);
      }
    }
    else
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", v8, v7);
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
    }

  }
}

void __52__ICTTMergeableString_checkTimestampLogStyleErrors___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  char v6;
  int v7;
  int v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;

  if (*(_DWORD *)(a2 + 16))
  {
    v4 = *(id *)a2;
    objc_msgSend(MEMORY[0x1E0CB3A28], "TTZero");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      v7 = *(_DWORD *)(a2 + 8);
      v8 = *(_DWORD *)(a2 + 16);
      objc_msgSend(*(id *)(a1 + 32), "timestamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "clockForUUID:atIndex:", v4, 0);

      if (v4)
      {
        if (v10 <= (v8 + v7 - 1))
        {
          v11 = os_log_create("com.apple.notes", "Topotext");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            __52__ICTTMergeableString_checkTimestampLogStyleErrors___block_invoke_cold_2();

          objc_msgSend(*(id *)(a1 + 32), "timestamp");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setClock:forUUID:atIndex:", (v8 + v7), v4, 0);

        }
      }
    }
    v13 = *(id *)(a2 + 24);
    objc_msgSend(MEMORY[0x1E0CB3A28], "TTZero");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqual:", v14);

    if ((v15 & 1) == 0)
    {
      v16 = *(unsigned int *)(a2 + 32);
      objc_msgSend(*(id *)(a1 + 32), "timestamp");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "clockForUUID:atIndex:", v13, 1);

      if (v13)
      {
        if (v18 <= v16)
        {
          if (*(_BYTE *)(a1 + 40))
          {
            v19 = os_log_create("com.apple.notes", "Topotext");
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              __52__ICTTMergeableString_checkTimestampLogStyleErrors___block_invoke_cold_1();

          }
          objc_msgSend(*(id *)(a1 + 32), "timestamp");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setClock:forUUID:atIndex:", (v16 + 1), v13, 1);

        }
      }
    }

  }
}

- (ICTTVectorMultiTimestamp)timestamp
{
  return self->_timestamp;
}

- (void)updateClock
{
  void *v3;
  void ****v4;
  void ***v5;
  void ***v6;
  unsigned int v7;
  unsigned int v8;
  void **v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  unsigned int v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unsigned int v19;
  id v20;
  uint64_t v21;
  ICTTMergeableString *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  ICTTMergeableString *v27;
  id v28;

  if (self->_replicaUUID)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "TTZero");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "TTZero");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[ICTTMergeableString orderedSubstrings](self, "orderedSubstrings");
    v27 = self;
    v5 = *v4;
    v6 = v4[1];
    if (*v4 != v6)
    {
      v7 = 0;
      v8 = 0;
      while (1)
      {
        v9 = *v5;
        v10 = **v5;
        objc_msgSend(MEMORY[0x1E0CB3A28], "TTZero", v27);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "isEqual:", v11) & 1) != 0)
          goto LABEL_12;
        v12 = *v9;
        v13 = v12;
        v14 = *((_DWORD *)v9 + 2) + *((_DWORD *)v9 + 4) - 1;
        if (v14 > v7)
          break;
        if (v14 != v7)
        {

          goto LABEL_12;
        }
        v16 = objc_msgSend(v12, "TTCompare:", v28);

        if (v16 == 1)
          goto LABEL_7;
LABEL_13:
        v17 = v9[3];
        objc_msgSend(MEMORY[0x1E0CB3A28], "TTZero");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v17, "isEqual:", v18) & 1) == 0)
        {
          v19 = *((_DWORD *)v9 + 8);
          if (v19 > v8)
          {

LABEL_17:
            v20 = v9[3];

            v8 = *((_DWORD *)v9 + 8);
            v3 = v20;
            goto LABEL_18;
          }
          if (v19 == v8)
          {
            v21 = objc_msgSend(v9[3], "TTCompare:", v3);

            if (v21 != 1)
              goto LABEL_18;
            goto LABEL_17;
          }
        }

LABEL_18:
        if (++v5 == v6)
          goto LABEL_25;
      }

LABEL_7:
      v15 = *v9;
      v11 = v28;
      v7 = *((_DWORD *)v9 + 2) + *((_DWORD *)v9 + 4) - 1;
      v28 = v15;
LABEL_12:

      goto LABEL_13;
    }
    v8 = 0;
    v7 = 0;
LABEL_25:
    v22 = v27;
    v23 = objc_msgSend(v28, "TTCompare:", v27->_replicaUUID, v27);
    v24 = objc_msgSend(v3, "TTCompare:", v22->_replicaUUID);
    if (v23 == -1)
      v25 = v7;
    else
      v25 = v7 + 1;
    if (v24 == -1)
      v26 = v8;
    else
      v26 = v8 + 1;
    v22->_replicaTextClock = v25;
    v22->_replicaStyleClock = v26;

  }
}

- (void)startNodes
{
  return &self->_startNodes;
}

- (void)setTimestamp:(id)a3
{
  unint64_t replicaTextClock;
  unint64_t v6;
  unint64_t v7;
  unint64_t replicaStyleClock;
  unint64_t v9;
  unint64_t v10;
  id v11;

  v11 = a3;
  objc_storeStrong((id *)&self->_timestamp, a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ICTTMergeableString invalidateCache](self, "invalidateCache");
    -[ICTTMergeableString updateClock](self, "updateClock");
    replicaTextClock = self->_replicaTextClock;
    v6 = -[ICTTVectorMultiTimestamp clockForUUID:atIndex:](self->_timestamp, "clockForUUID:atIndex:", self->_replicaUUID, 0);
    if (replicaTextClock <= v6)
      v7 = v6;
    else
      v7 = replicaTextClock;
    self->_replicaTextClock = v7;
    replicaStyleClock = self->_replicaStyleClock;
    v9 = -[ICTTVectorMultiTimestamp clockForUUID:atIndex:](self->_timestamp, "clockForUUID:atIndex:", self->_replicaUUID, 1);
    if (replicaStyleClock <= v9)
      v10 = v9;
    else
      v10 = replicaStyleClock;
    self->_replicaStyleClock = v10;
  }

}

- (void)setAttributedString:(id)a3
{
  objc_storeStrong((id *)&self->_attributedString, a3);
}

- (void)endNodes
{
  return &self->_endNodes;
}

- (void).cxx_destruct
{
  TopoSubstring **begin;
  TopoSubstring **v4;
  TopoSubstring **v5;

  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_objectsNeedingUpdatedRanges, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_replicaUUID, 0);
  objc_storeStrong(&self->_updateRangeBlock, 0);
  begin = self->_orderedSubstrings.__begin_;
  if (begin)
  {
    self->_orderedSubstrings.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_endNodes.__begin_;
  if (v4)
  {
    self->_endNodes.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_startNodes.__begin_;
  if (v5)
  {
    self->_startNodes.__end_ = v5;
    operator delete(v5);
  }
}

- (ICTTMergeableString)initWithData:(id)a3 replicaID:(id)a4 fragment:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  char *v11;
  int v12;
  ICTTMergeableString *v13;
  NSObject *v14;
  _BYTE v16[128];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  topotext::String::String((topotext::String *)v16);
  v10 = objc_retainAutorelease(v8);
  v11 = (char *)objc_msgSend(v10, "bytes");
  v12 = ICTTBoundedCheckedCastNSUIntegerToUInt32(objc_msgSend(v10, "length"));
  if (google::protobuf::MessageLite::ParseFromArray((google::protobuf::MessageLite *)v16, v11, v12))
  {
    self = -[ICTTMergeableString initWithArchive:replicaID:orderedSubstrings:timestamp:fragment:](self, "initWithArchive:replicaID:orderedSubstrings:timestamp:fragment:", v16, v9, 0, 0, v5);
    v13 = self;
  }
  else
  {
    v14 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ICTTMergeableString(ICTTMergeableStringPersistenceAdditions) initWithData:replicaID:fragment:].cold.1();

    v13 = 0;
  }
  topotext::String::~String((topotext::String *)v16);

  return v13;
}

- (id)selectionForCharacterRanges:(id)a3 selectionAffinity:(unint64_t)a4
{
  id v6;
  ICTTMergeableStringSelection *v7;
  uint64_t **v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  BOOL v20;
  _BOOL4 v21;
  int v22;
  id v23;
  int v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  ICTTMergeableStringSelection *v30;
  id v31;
  int v32;
  void *v33;
  int v34;
  uint64_t *v35;
  uint64_t *v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t *v40;
  id v41;
  unint64_t v42;
  uint64_t *v43;
  id v44;
  int v45;
  id v46;
  int v47;

  v6 = a3;
  v7 = objc_alloc_init(ICTTMergeableStringSelection);
  v42 = a4;
  -[ICTTMergeableStringSelection setSelectionAffinity:](v7, "setSelectionAffinity:", a4);
  if (!objc_msgSend(v6, "count"))
    goto LABEL_36;
  v8 = -[ICTTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v9 = *v8;
  v40 = v8[1];
  if (*v8 == v40)
    goto LABEL_36;
  v10 = 0;
  v11 = 0;
  v12 = 1;
  v41 = v6;
  do
  {
    v13 = *v9;
    if (*(_BYTE *)(*v9 + 44))
      goto LABEL_35;
    v43 = v9;
    while (1)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "rangeValue");
      v17 = v16;

      if (v12)
        break;
      v22 = v15 + v17;
      if (v10 + (unint64_t)*(unsigned int *)(v13 + 16) <= v15 + v17 - 1)
      {
        v12 = 0;
        goto LABEL_33;
      }
      v23 = *(id *)v13;
      v24 = *(_DWORD *)(v13 + 8) + v22 + ~(_DWORD)v10;
      v25 = *(_QWORD *)(-[ICTTMergeableStringSelection selectionRanges](v7, "selectionRanges") + 8);
      v26 = *(void **)(v25 - 16);
      *(_QWORD *)(v25 - 16) = v23;
      v27 = v23;

      *(_DWORD *)(v25 - 8) = v24;
      v28 = 1;
      v12 = 1;
LABEL_29:

      v9 = v43;
      v11 += v28;
      if (v11 >= objc_msgSend(v6, "count"))
        goto LABEL_33;
    }
    v12 = v17 == 0;
    if (v17 | v42)
      v18 = 1;
    else
      v18 = v15 == 0;
    v19 = !v18;
    if (v42 || v10 != v15)
    {
      v21 = 0;
      if (v42 == 1)
      {
        v20 = 0;
        if (v10 == v15)
        {
          v21 = 0;
          v20 = *(_QWORD *)(v13 + 56) == *(_QWORD *)(v13 + 48);
        }
      }
      else
      {
        v20 = 0;
      }
    }
    else
    {
      v20 = 0;
      v21 = *(_DWORD *)(v13 + 72) == 0;
    }
    v29 = v15 - v19;
    if (v10 + (unint64_t)*(unsigned int *)(v13 + 16) > v29 || v20 || v21)
    {
      v30 = v7;
      v31 = *(id *)v13;
      v32 = *(_DWORD *)(v13 + 8);
      objc_msgSend(MEMORY[0x1E0CB3A28], "TTZero");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v32 + v29 - v10;
      v27 = v31;
      v44 = v27;
      v45 = v34;
      v46 = v33;
      v47 = 0;
      v35 = -[ICTTMergeableStringSelection selectionRanges](v30, "selectionRanges");
      v36 = v35;
      v37 = v35[1];
      if (v37 >= v35[2])
      {
        v38 = std::vector<std::pair<TopoID,TopoID>>::__push_back_slow_path<std::pair<TopoID,TopoID> const&>(v35, (uint64_t)&v44);
      }
      else
      {
        *(_QWORD *)v37 = v44;
        *(_DWORD *)(v37 + 8) = v45;
        *(_QWORD *)(v37 + 16) = v46;
        *(_DWORD *)(v37 + 24) = v47;
        v38 = v37 + 32;
        v36[1] = v37 + 32;
      }
      v7 = v30;
      v28 = v17 == 0;
      v36[1] = v38;

      v6 = v41;
      goto LABEL_29;
    }
    v12 = 1;
    v6 = v41;
LABEL_33:
    if (v11 >= objc_msgSend(v6, "count"))
      break;
    v10 += *(unsigned int *)(v13 + 16);
LABEL_35:
    ++v9;
  }
  while (v9 != v40);
LABEL_36:

  return v7;
}

- (id)selectionForCharacterRanges:(id)a3
{
  -[ICTTMergeableString selectionForCharacterRanges:selectionAffinity:](self, "selectionForCharacterRanges:selectionAffinity:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSHashTable)objectsNeedingUpdatedRanges
{
  return self->_objectsNeedingUpdatedRanges;
}

- (unint64_t)length
{
  void *v2;
  unint64_t v3;

  -[ICTTMergeableString string](self, "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (BOOL)hasLocalChanges
{
  return self->_hasLocalChanges;
}

- (id)characterRangesForSelection:(id)a3 selectedSubstringsBlock:(id)a4
{
  NSUInteger v4;
  id v6;
  void (**v7)(id, _QWORD, NSUInteger, NSUInteger);
  _QWORD *v8;
  id v9;
  _QWORD *v10;
  _QWORD *v11;
  NSUInteger v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  void (**v16)(id, _QWORD, NSUInteger, NSUInteger);
  uint64_t v17;
  id v18;
  unsigned int v19;
  id v20;
  void *v21;
  unsigned int v22;
  id v23;
  int v24;
  unsigned int v25;
  int v26;
  void *v27;
  int v28;
  int v29;
  void *v30;
  unsigned int v31;
  uint64_t v32;
  void *v33;
  _QWORD *v34;
  _QWORD *v35;
  NSUInteger v36;
  NSUInteger v37;
  NSRange v38;
  uint64_t v39;
  _QWORD *v42;
  _QWORD *v43;
  void *v44;
  void *v45;
  NSRange v46;
  NSRange v47;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, NSUInteger, NSUInteger))a4;
  v45 = v6;
  v8 = (_QWORD *)objc_msgSend(v6, "selectionRanges");
  if (v8[1] == *v8)
  {
    v9 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_50;
  }
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = -[ICTTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v11 = (_QWORD *)*v10;
  v42 = (_QWORD *)v10[1];
  if ((_QWORD *)*v10 != v42)
  {
    v44 = v9;
    v12 = 0;
    v13 = 0;
    v14 = 1;
    while (1)
    {
      v43 = v11;
      v15 = *v11;
      while (1)
      {
        v16 = v7;
        v17 = *(_QWORD *)objc_msgSend(v45, "selectionRanges") + 32 * v13;
        v18 = *(id *)v17;
        v19 = *(_DWORD *)(v17 + 8);
        v20 = *(id *)(v17 + 16);
        v21 = v20;
        v22 = *(_DWORD *)(v17 + 24);
        v23 = *(id *)v15;
        if ((v14 & 1) != 0)
          break;
        if (!objc_msgSend(v20, "isEqual:", v23))
          goto LABEL_37;
        v31 = *(_DWORD *)(v15 + 8);
        if (v22 < v31 || v22 >= *(_DWORD *)(v15 + 16) + v31)
          goto LABEL_37;
        if (*(_BYTE *)(v15 + 44))
          v32 = 0;
        else
          v32 = v22 - v31 + 1;
        v7 = v16;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v4, v12 + v32 - v4);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addObject:", v33);

        ++v13;
        if (v16)
          v16[2](v16, v15, 0, v32);
        v14 = 1;
LABEL_35:

        v34 = (_QWORD *)objc_msgSend(v45, "selectionRanges");
        if (v13 >= (uint64_t)(v34[1] - *v34) >> 5)
          goto LABEL_38;
      }
      v24 = objc_msgSend(v18, "isEqual:", v23);
      v25 = *(_DWORD *)(v15 + 8);
      v26 = v19 >= v25 ? v24 : 0;
      if (v26 == 1 && v19 < *(_DWORD *)(v15 + 16) + v25
        || v25 == v19 && objc_msgSend(*(id *)v15, "isEqual:", v18))
      {
        break;
      }
LABEL_37:

      v7 = v16;
LABEL_38:
      v35 = (_QWORD *)objc_msgSend(v45, "selectionRanges");
      if (v13 < (uint64_t)(v35[1] - *v35) >> 5)
      {
        if (!((v7 == 0) | v14 & 1))
        {
          if (*(_BYTE *)(v15 + 44))
            v36 = 0;
          else
            v36 = *(unsigned int *)(v15 + 16);
          v37 = *(unsigned int *)(v15 + 40);
          v47.length = -[ICTTMergeableString length](self, "length") - v4;
          v46.location = v37;
          v46.length = v36;
          v47.location = v4;
          v38 = NSIntersectionRange(v46, v47);
          v7[2](v7, v15, v38.location, v38.length);
        }
        v39 = *(_BYTE *)(v15 + 44) ? 0 : *(unsigned int *)(v15 + 16);
        v12 += v39;
        v11 = v43 + 1;
        if (v43 + 1 != v42)
          continue;
      }
      v9 = v44;
      goto LABEL_50;
    }
    v4 = v12;
    if (!*(_BYTE *)(v15 + 44))
      v4 = v12 + v19 - *(_DWORD *)(v15 + 8);
    objc_msgSend(MEMORY[0x1E0CB3A28], "TTZero");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v21, "isEqual:", v27);
    if (v22)
      v29 = 0;
    else
      v29 = v28;

    if (v29 == 1)
    {
      if (!*(_BYTE *)(v15 + 44) && !objc_msgSend(v45, "selectionAffinity") && *(_DWORD *)(v15 + 72))
        ++v4;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v4, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "addObject:", v30);

      ++v13;
      v14 = 1;
    }
    else
    {
      v14 = 0;
    }
    v7 = v16;
    goto LABEL_35;
  }
LABEL_50:

  return v9;
}

- (id)characterRangesForSelection:(id)a3
{
  -[ICTTMergeableString characterRangesForSelection:selectedSubstringsBlock:](self, "characterRangesForSelection:selectedSubstringsBlock:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _BYTE v10[128];

  topotext::String::String((topotext::String *)v10);
  -[ICTTMergeableString saveToArchive:](self, "saveToArchive:", v10);
  -[ICTTMergeableString timestamp](self, "timestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isDocumentShared"))
  {
    -[ICTTMergeableString timestamp](self, "timestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  v6 = objc_alloc((Class)objc_opt_class());
  -[ICTTMergeableString replicaUUID](self, "replicaUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithArchive:replicaID:timestamp:", v10, v7, v5);

  topotext::String::~String((topotext::String *)v10);
  return v8;
}

+ (id)timestampFromData:(id)a3
{
  id v3;
  ICTTVectorMultiTimestamp *v4;

  v3 = a3;
  v4 = -[ICTTVectorMultiTimestamp initWithData:andCapacity:]([ICTTVectorMultiTimestamp alloc], "initWithData:andCapacity:", v3, 2);

  return v4;
}

- (void)setReplicaUUID:(id)a3
{
  objc_storeStrong((id *)&self->_replicaUUID, a3);
}

- (void)insertString:(id)a3 atIndex:(unint64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v7);
  -[ICTTMergeableString insertAttributedString:atIndex:](self, "insertAttributedString:atIndex:", v6, a4);

}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v7;
  id v8;

  length = a3.length;
  location = a3.location;
  v8 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v8);
  -[ICTTMergeableString replaceCharactersInRange:withAttributedString:](self, "replaceCharactersInRange:withAttributedString:", location, length, v7);

}

- (void)replaceCharactersInRange:(_NSRange)a3 withAttributedString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v7;
  void *v8;
  id v9;

  length = a3.length;
  location = a3.location;
  v9 = a4;
  -[ICTTMergeableString delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "beginEditing");
  -[ICTTMergeableString beginEditing](self, "beginEditing");
  -[ICTTMergeableString deleteCharactersInRange:](self, "deleteCharactersInRange:", location, length);
  -[ICTTMergeableString insertAttributedString:atIndex:](self, "insertAttributedString:atIndex:", v9, location);
  -[ICTTMergeableString endEditing](self, "endEditing");
  if (v8)
    objc_msgSend(v8, "endEditing");

}

- (void)deleteCharactersInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  _QWORD *v6;
  void *__p;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  if (a3.length)
  {
    length = a3.length;
    location = a3.location;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v6 = operator new(0x10uLL);
    v8 = v6 + 2;
    v9 = v6 + 2;
    *v6 = location;
    v6[1] = length;
    __p = v6;
    -[ICTTMergeableString getSubstrings:forCharacterRange:](self, "getSubstrings:forCharacterRange:", &v10, location, length);
    -[ICTTMergeableString deleteSubstrings:withCharacterRanges:](self, "deleteSubstrings:withCharacterRanges:", &v10, &__p);
    if (__p)
    {
      v8 = __p;
      operator delete(__p);
    }
    if (v10)
    {
      v11 = v10;
      operator delete(v10);
    }
  }
}

- (void)insertAttributedString:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  _QWORD *v7;
  _QWORD *v8;
  TopoSubstring *v9;
  TopoSubstring **begin;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  unsigned int v14;
  BOOL v15;
  uint64_t v16;
  TopoSubstring *v17;
  void *v18;

  v6 = a3;
  if (!objc_msgSend(v6, "length"))
    goto LABEL_16;
  if (a4)
  {
    if (-[ICTTMergeableString length](self, "length") == a4)
    {
      v7 = -[ICTTMergeableString orderedSubstrings](self, "orderedSubstrings");
      v8 = -[ICTTMergeableString orderedSubstrings](self, "orderedSubstrings");
      v9 = *(TopoSubstring **)(v8[1] - *v8 + *v7 - 16);
      begin = self->_endNodes.__begin_;
      goto LABEL_14;
    }
    v12 = ICTTBoundedCheckedCastNSUIntegerToUInt32(a4);
    for (i = 0; ; i += 8)
    {
      v9 = *(TopoSubstring **)(*(_QWORD *)-[ICTTMergeableString orderedSubstrings](self, "orderedSubstrings") + i);
      if (!*((_BYTE *)v9 + 44))
      {
        v14 = *((_DWORD *)v9 + 4);
        v15 = v12 >= v14;
        v16 = v12 - v14;
        if (!v15)
        {
          v17 = -[ICTTMergeableString splitTopoSubstring:atIndex:](self, "splitTopoSubstring:atIndex:", v9, v12);
          -[ICTTMergeableString invalidateCache](self, "invalidateCache");
          goto LABEL_15;
        }
        v12 = v16;
        if (!(_DWORD)v16)
          break;
      }
    }
    v11 = *(_QWORD *)-[ICTTMergeableString orderedSubstrings](self, "orderedSubstrings") + i;
  }
  else
  {
    v9 = *self->_startNodes.__begin_;
    v11 = *(_QWORD *)-[ICTTMergeableString orderedSubstrings](self, "orderedSubstrings");
  }
  begin = (TopoSubstring **)(v11 + 8);
LABEL_14:
  v17 = *begin;
LABEL_15:
  -[ICTTMergeableString insertAttributedString:after:before:](self, "insertAttributedString:after:before:", v6, v9, v17);

LABEL_16:
}

- (void)beginEditing
{
  ++self->_editCount;
}

- (void)endEditing
{
  unint64_t editCount;
  unint64_t v3;

  editCount = self->_editCount;
  if (editCount)
  {
    v3 = editCount - 1;
    self->_editCount = v3;
    if (!v3)
      -[ICTTMergeableString coalesce](self, "coalesce");
  }
}

- (void)resetLocalReplicaClocksToTimestampValues
{
  self->_replicaTextClock = -[ICTTVectorMultiTimestamp clockForUUID:atIndex:](self->_timestamp, "clockForUUID:atIndex:", self->_replicaUUID, 0);
  self->_replicaStyleClock = -[ICTTVectorMultiTimestamp clockForUUID:atIndex:](self->_timestamp, "clockForUUID:atIndex:", self->_replicaUUID, 1);
}

- (void)_testSetTextTimestamp:(unint64_t)a3
{
  self->_replicaTextClock = a3;
}

- (void)updateTimestampsInRange:(_NSRange)a3
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *__p;
  uint64_t *v10;
  uint64_t v11;

  if (a3.length)
  {
    __p = 0;
    v10 = 0;
    v11 = 0;
    -[ICTTMergeableString getSubstrings:forCharacterRange:](self, "getSubstrings:forCharacterRange:", &__p, a3.location, a3.length);
    v4 = (uint64_t *)__p;
    v5 = v10;
    if (__p != v10)
    {
      do
      {
        v6 = *v4;
        objc_msgSend(MEMORY[0x1E0CB3A28], "CR_unserialized");
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = *(void **)(v6 + 24);
        *(_QWORD *)(v6 + 24) = v7;

        ++v4;
      }
      while (v4 != v5);
    }
    -[ICTTMergeableString coalesce](self, "coalesce");
    self->_hasLocalChanges = 1;
    if (__p)
    {
      v10 = (uint64_t *)__p;
      operator delete(__p);
    }
  }
}

- (void)deleteSubstrings:(void *)a3 withCharacterRanges:(void *)a4
{
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSUInteger *v19;
  NSUInteger *v20;
  uint64_t v21;
  NSRange v22;
  NSUInteger location;
  NSUInteger v24;
  id v25;
  NSRange v26;

  v6 = *(uint64_t **)a3;
  v7 = (uint64_t *)*((_QWORD *)a3 + 1);
  if (*(uint64_t **)a3 != v7)
  {
    do
    {
      v8 = *v6;
      if (!*(_BYTE *)(*v6 + 44))
      {
        *(_BYTE *)(v8 + 44) = 1;
        objc_msgSend(MEMORY[0x1E0CB3A28], "CR_unserialized");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = *(void **)(v8 + 24);
        *(_QWORD *)(v8 + 24) = v9;

      }
      ++v6;
    }
    while (v6 != v7);
  }
  v11 = (__int128 *)*((_QWORD *)a4 + 1);
  v12 = 126 - 2 * __clz(((uint64_t)v11 - *(_QWORD *)a4) >> 4);
  if (v11 == *(__int128 **)a4)
    v13 = 0;
  else
    v13 = v12;
  std::__introsort<std::_ClassicAlgPolicy,-[ICTTMergeableString deleteSubstrings:withCharacterRanges:]::$_1 &,_NSRange *,false>(*(_QWORD *)a4, v11, v13, 1);
  v14 = *(uint64_t **)a4;
  v15 = (uint64_t *)*((_QWORD *)a4 + 1);
  while (v14 != v15)
  {
    v16 = *v14;
    v17 = v14[1];
    v14 += 2;
    -[NSMutableAttributedString deleteCharactersInRange:](self->_attributedString, "deleteCharactersInRange:", v16, v17);
  }
  -[ICTTMergeableString delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v18;
  if (v18)
  {
    objc_msgSend(v18, "beginEditing");
    v20 = *(NSUInteger **)a4;
    v19 = (NSUInteger *)*((_QWORD *)a4 + 1);
    if (v19 == *(NSUInteger **)a4)
      goto LABEL_18;
    v21 = 0;
    location = *v20;
    v22.length = v20[1];
    do
    {
      v26.location = *v20;
      v24 = v20[1];
      v22.location = location;
      v26.length = v24;
      v22 = NSUnionRange(v22, v26);
      location = v22.location;
      v21 += v24;
      v20 += 2;
    }
    while (v20 != v19);
    objc_msgSend(v25, "edited:range:changeInLength:", 2, v22.location, v22.length, -v21);
  }
  -[ICTTMergeableString coalesce](self, "coalesce");
  -[ICTTMergeableString updateSubstringIndexes](self, "updateSubstringIndexes");
  self->_hasLocalChanges = 1;
  if (v25)
    objc_msgSend(v25, "endEditing");
LABEL_18:

}

- (TopoIDRange)insertAttributedString:(SEL)a3 after:(id)a4 before:(void *)a5
{
  id v10;
  uint64_t v11;
  NSUUID *v12;
  uint64_t unserializedClock;
  int v14;
  int v15;
  uint64_t v16;
  void *v17;
  id *v18;
  char *v19;
  uint64_t v20;
  void **v21;
  void *v22;
  void **v23;
  char *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id updateRangeBlock;
  id v31;
  id *v32;
  TopoIDRange *result;
  _QWORD aBlock[5];
  uint64_t v35;
  id *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t __src;
  uint64_t v46;
  TopoID v47;

  v46 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v44 = 0;
  v35 = 0;
  v36 = (id *)&v35;
  v37 = 0x4812000000;
  v38 = __Block_byref_object_copy__19;
  v39 = __Block_byref_object_dispose__20;
  v40 = 256;
  v41 = 0;
  v42 = 0;
  v43 = 0;
  if (objc_msgSend(v10, "length"))
  {
    v11 = operator new();
    objc_msgSend(MEMORY[0x1E0CB3A28], "CR_unserialized");
    v12 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    unserializedClock = self->_unserializedClock;
    v14 = *((_DWORD *)a6 + 10);
    v15 = ICTTBoundedCheckedCastNSUIntegerToUInt32(objc_msgSend(v10, "length"));
    v47.replicaID = v12;
    *(_QWORD *)&v47.clock = unserializedClock;
    TopoSubstring::TopoSubstring((TopoSubstring *)v11, v47, v14, v15);
    v44 = v11;
    objc_msgSend(MEMORY[0x1E0CB3A28], "CR_unserialized");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(void **)(v11 + 24);
    *(_QWORD *)(v11 + 24) = v16;

    *(_DWORD *)(v11 + 32) = 0;
    self->_unserializedClock += objc_msgSend(v10, "length");
    v18 = v36;
    objc_storeStrong(v36 + 6, *(id *)v11);
    *((_DWORD *)v18 + 14) = *(_DWORD *)(v11 + 8);
    *((_DWORD *)v18 + 16) = *(_DWORD *)(v11 + 16);
    v19 = (char *)*((_QWORD *)a5 + 6);
    v20 = *((_QWORD *)a5 + 7);
    v21 = (void **)v19;
    if (v19 != (char *)v20)
    {
      while (*v21 != a6)
      {
        if (++v21 == (void **)v20)
        {
          v21 = (void **)*((_QWORD *)a5 + 7);
          break;
        }
      }
    }
    if (v21 == (void **)v20)
    {
      if ((void *)v11 != a5)
        std::vector<TopoSubstring *>::__assign_with_size[abi:ne180100]<TopoSubstring * const*,TopoSubstring * const*>((char *)(v11 + 48), v19, v20, (v20 - (uint64_t)v19) >> 3);
      __src = v11;
      std::vector<TopoSubstring *>::__assign_with_size[abi:ne180100]<TopoSubstring * const*,TopoSubstring * const*>((char *)a5 + 48, (char *)&__src, (uint64_t)&v46, 1uLL);
    }
    else
    {
      *v21 = (void *)v11;
      __src = (uint64_t)a6;
      std::vector<TopoSubstring *>::__assign_with_size[abi:ne180100]<TopoSubstring * const*,TopoSubstring * const*>((char *)(v11 + 48), (char *)&__src, (uint64_t)&v46, 1uLL);
    }
    *(_DWORD *)(v11 + 72) = 1;
    if (!self->_cacheInvalid)
    {
      v23 = *(void ***)-[ICTTMergeableString orderedSubstrings](self, "orderedSubstrings");
      v24 = (char *)(v23 + 1);
      while (v23 != *(void ***)(-[ICTTMergeableString orderedSubstrings](self, "orderedSubstrings") + 8))
      {
        if (*v23 == a5)
        {
          std::vector<TopoSubstring *>::insert((uint64_t)-[ICTTMergeableString orderedSubstrings](self, "orderedSubstrings"), v24, (char *)&v44);
          break;
        }
        ++v23;
        v24 += 8;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("﻿"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ic_attributedStringByReplacingCharactersInSet:withString:", v25, CFSTR(" "));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICTTMergeableString attributedString](self, "attributedString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "insertAttributedString:atIndex:", v22, *(unsigned int *)(v44 + 40));

    -[ICTTMergeableString delegate](self, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
    {
      objc_msgSend(v27, "beginEditing");
      objc_msgSend(v28, "edited:range:changeInLength:", 2, *(unsigned int *)(v44 + 40), 0, *(unsigned int *)(v44 + 16));
    }
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__ICTTMergeableString_insertAttributedString_after_before___block_invoke;
    aBlock[3] = &unk_1E76C8DD0;
    aBlock[4] = &v35;
    v29 = _Block_copy(aBlock);
    updateRangeBlock = self->_updateRangeBlock;
    self->_updateRangeBlock = v29;

    -[ICTTMergeableString coalesce](self, "coalesce");
    -[ICTTMergeableString updateSubstringIndexes](self, "updateSubstringIndexes");
    self->_hasLocalChanges = 1;
    v31 = self->_updateRangeBlock;
    self->_updateRangeBlock = 0;

    if (v28)
      objc_msgSend(v28, "endEditing");

  }
  else
  {
    v22 = v10;
  }
  v32 = v36;
  retstr->var0.replicaID = (NSUUID *)v36[6];
  retstr->var0.clock = *((_DWORD *)v32 + 14);
  retstr->var1 = *((_DWORD *)v32 + 16);
  _Block_object_dispose(&v35, 8);

  return result;
}

void __59__ICTTMergeableString_insertAttributedString_after_before___block_invoke(uint64_t a1, id *a2, id *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8[3];
  void **v9;

  memset(v8, 0, sizeof(v8));
  updateTopoIDRange((TopoIDRange *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48), a2, (uint64_t)a3, v8);
  v6 = v8[0];
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  objc_storeStrong((id *)(v7 + 48), *(id *)v8[0]);
  *(_DWORD *)(v7 + 56) = *(_DWORD *)(v6 + 8);
  *(_DWORD *)(v7 + 64) = *(_DWORD *)(v6 + 16);
  v9 = (void **)v8;
  std::vector<TopoIDRange>::__destroy_vector::operator()[abi:ne180100](&v9);

}

- (void)moveRange:(_NSRange)a3 toIndex:(unint64_t)a4
{
  void *__p;
  void *v5;
  uint64_t v6;

  if (a3.length)
  {
    __p = 0;
    v5 = 0;
    v6 = 0;
    -[ICTTMergeableString getSubstrings:forCharacterRange:](self, "getSubstrings:forCharacterRange:", &__p, a3.location, a3.length);
    if (__p)
    {
      v5 = __p;
      operator delete(__p);
    }
  }
}

- (void)getSubstrings:(void *)a3 forCharacterRange:(_NSRange)a4
{
  -[ICTTMergeableString getSubstrings:inOrderedSubstrings:forCharacterRange:](self, "getSubstrings:inOrderedSubstrings:forCharacterRange:", a3, -[ICTTMergeableString orderedSubstrings](self, "orderedSubstrings"), a4.location, a4.length);
}

- (void)getSubstrings:(void *)a3 inOrderedSubstrings:(void *)a4 forCharacterRange:(_NSRange)a5
{
  char *v7;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v11;
  NSUInteger v12;
  uint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  BOOL v16;
  NSUInteger v17;
  unint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  uint64_t *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  char *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t *v43;
  _QWORD *v44;
  char *v45;
  void **v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char *v51;
  char *v52;
  char *v53;
  char *v54;
  char *v55;
  uint64_t v56;
  char *v57;
  void *v58;
  void *v59;

  if (!a5.length)
    return;
  v7 = *(char **)a4;
  if (*(_QWORD *)a4 == *((_QWORD *)a4 + 1))
    goto LABEL_47;
  length = a5.length;
  location = a5.location;
  v11 = 0;
  v12 = a5.location + a5.length;
  v57 = (char *)a3 + 16;
  while (1)
  {
    v13 = *(_QWORD *)v7;
    if (*(_BYTE *)(*(_QWORD *)v7 + 44))
    {
      v14 = v11;
      goto LABEL_46;
    }
    v14 = v11 + *(unsigned int *)(v13 + 16);
    if (v14 <= location)
      goto LABEL_46;
    v15 = v12 - v11;
    if (v12 <= v11)
      goto LABEL_47;
    v16 = location >= v11;
    v17 = location - v11;
    if (v17 == 0 || !v16)
      break;
    v59 = 0;
    v59 = -[ICTTMergeableString splitTopoSubstring:atIndex:](self, "splitTopoSubstring:atIndex:", v13, ICTTBoundedCheckedCastNSUIntegerToUInt32(v17));
    v7 = std::vector<TopoSubstring *>::insert((uint64_t)a4, v7 + 8, (char *)&v59);
    v19 = (_QWORD *)*((_QWORD *)a3 + 1);
    v18 = *((_QWORD *)a3 + 2);
    if ((unint64_t)v19 >= v18)
    {
      v24 = ((uint64_t)v19 - *(_QWORD *)a3) >> 3;
      if ((unint64_t)(v24 + 1) >> 61)
        goto LABEL_67;
      v25 = v18 - *(_QWORD *)a3;
      v26 = v25 >> 2;
      if (v25 >> 2 <= (unint64_t)(v24 + 1))
        v26 = v24 + 1;
      if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8)
        v27 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v27 = v26;
      if (v27)
        v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)v57, v27);
      else
        v28 = 0;
      v34 = &v28[8 * v24];
      *(_QWORD *)v34 = v59;
      v20 = v34 + 8;
      v36 = *(char **)a3;
      v35 = (char *)*((_QWORD *)a3 + 1);
      if (v35 != *(char **)a3)
      {
        do
        {
          v37 = *((_QWORD *)v35 - 1);
          v35 -= 8;
          *((_QWORD *)v34 - 1) = v37;
          v34 -= 8;
        }
        while (v35 != v36);
        v35 = *(char **)a3;
      }
      *(_QWORD *)a3 = v34;
      *((_QWORD *)a3 + 1) = v20;
      *((_QWORD *)a3 + 2) = &v28[8 * v27];
      if (v35)
        operator delete(v35);
    }
    else
    {
      *v19 = v59;
      v20 = v19 + 1;
    }
    *((_QWORD *)a3 + 1) = v20;
    if (v12 < v14)
    {
      v58 = -[ICTTMergeableString splitTopoSubstring:atIndex:](self, "splitTopoSubstring:atIndex:", v59, ICTTBoundedCheckedCastNSUIntegerToUInt32(length));
      v45 = v7 + 8;
      v46 = &v58;
      goto LABEL_66;
    }
LABEL_46:
    v7 += 8;
    v11 = v14;
    if (v7 == *((char **)a4 + 1))
      goto LABEL_47;
  }
  if (v14 <= v12)
  {
    v22 = (uint64_t *)*((_QWORD *)a3 + 1);
    v21 = *((_QWORD *)a3 + 2);
    if ((unint64_t)v22 >= v21)
    {
      v29 = ((uint64_t)v22 - *(_QWORD *)a3) >> 3;
      if ((unint64_t)(v29 + 1) >> 61)
        goto LABEL_67;
      v30 = v21 - *(_QWORD *)a3;
      v31 = v30 >> 2;
      if (v30 >> 2 <= (unint64_t)(v29 + 1))
        v31 = v29 + 1;
      if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF8)
        v32 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v32 = v31;
      if (v32)
        v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)v57, v32);
      else
        v33 = 0;
      v38 = &v33[8 * v29];
      *(_QWORD *)v38 = v13;
      v23 = v38 + 8;
      v40 = *(char **)a3;
      v39 = (char *)*((_QWORD *)a3 + 1);
      if (v39 != *(char **)a3)
      {
        do
        {
          v41 = *((_QWORD *)v39 - 1);
          v39 -= 8;
          *((_QWORD *)v38 - 1) = v41;
          v38 -= 8;
        }
        while (v39 != v40);
        v39 = *(char **)a3;
      }
      *(_QWORD *)a3 = v38;
      *((_QWORD *)a3 + 1) = v23;
      *((_QWORD *)a3 + 2) = &v33[8 * v32];
      if (v39)
        operator delete(v39);
    }
    else
    {
      *v22 = v13;
      v23 = v22 + 1;
    }
    *((_QWORD *)a3 + 1) = v23;
    goto LABEL_46;
  }
  v59 = -[ICTTMergeableString splitTopoSubstring:atIndex:](self, "splitTopoSubstring:atIndex:", v13, ICTTBoundedCheckedCastNSUIntegerToUInt32(v15));
  v43 = (uint64_t *)*((_QWORD *)a3 + 1);
  v42 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v43 >= v42)
  {
    v47 = ((uint64_t)v43 - *(_QWORD *)a3) >> 3;
    if ((unint64_t)(v47 + 1) >> 61)
LABEL_67:
      std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
    v48 = v42 - *(_QWORD *)a3;
    v49 = v48 >> 2;
    if (v48 >> 2 <= (unint64_t)(v47 + 1))
      v49 = v47 + 1;
    if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFF8)
      v50 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v50 = v49;
    if (v50)
      v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)v57, v50);
    else
      v51 = 0;
    v52 = &v51[8 * v47];
    v53 = &v51[8 * v50];
    *(_QWORD *)v52 = v13;
    v44 = v52 + 8;
    v55 = *(char **)a3;
    v54 = (char *)*((_QWORD *)a3 + 1);
    if (v54 != *(char **)a3)
    {
      do
      {
        v56 = *((_QWORD *)v54 - 1);
        v54 -= 8;
        *((_QWORD *)v52 - 1) = v56;
        v52 -= 8;
      }
      while (v54 != v55);
      v54 = *(char **)a3;
    }
    *(_QWORD *)a3 = v52;
    *((_QWORD *)a3 + 1) = v44;
    *((_QWORD *)a3 + 2) = v53;
    if (v54)
      operator delete(v54);
  }
  else
  {
    *v43 = v13;
    v44 = v43 + 1;
  }
  *((_QWORD *)a3 + 1) = v44;
  v45 = v7 + 8;
  v46 = &v59;
LABEL_66:
  std::vector<TopoSubstring *>::insert((uint64_t)a4, v45, (char *)v46);
LABEL_47:
  -[ICTTMergeableString invalidateCache](self, "invalidateCache");
}

- (void)getSubstringBeforeTopoID:(TopoID)a3
{
  unsigned int clock;
  NSUUID *replicaID;
  TopoSubstring *v6;
  id ***v7;
  id **v8;
  id **v9;
  id *v10;
  id v11;
  unsigned int v12;
  int v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  ICTTMergeableString *v19;
  NSUUID *v20;

  clock = a3.clock;
  replicaID = a3.replicaID;
  v6 = *self->_startNodes.__begin_;
  v20 = a3.replicaID;
  v7 = -[ICTTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v9 = *v7;
  v8 = v7[1];
  if (*v7 == v8)
  {
LABEL_13:
    v6 = 0;
    goto LABEL_18;
  }
  v19 = self;
  while (1)
  {
    v10 = *v9;
    v11 = **v9;
    v12 = *((_DWORD *)v10 + 2);
    v13 = *((_DWORD *)v10 + 4);
    if (!-[NSUUID isEqual:](replicaID, "isEqual:", v11))
      goto LABEL_10;
    v14 = clock - v12;
    if (clock == v12)
      goto LABEL_17;
    if (clock <= v12)
      goto LABEL_10;
    v15 = v11;
    v16 = v15;
    if (v13 + v12 > clock)
      break;
    if (v13 + v12 == clock)
    {
      v17 = -[NSUUID TTCompare:](v20, "TTCompare:", v15);

      replicaID = v20;
      if (v17 == -1)
        goto LABEL_15;
    }
    else
    {

      replicaID = v20;
    }
LABEL_10:
    if (!*((_BYTE *)v10 + 44))
      v6 = (TopoSubstring *)v10;

    if (++v9 == v8)
      goto LABEL_13;
  }

  replicaID = v20;
LABEL_15:
  if (!*((_BYTE *)v10 + 44))
  {
    -[ICTTMergeableString splitTopoSubstring:atIndex:](v19, "splitTopoSubstring:atIndex:", v10, v14);
    -[ICTTMergeableString invalidateCache](v19, "invalidateCache");
    v6 = (TopoSubstring *)v10;
  }
LABEL_17:

LABEL_18:
  return v6;
}

- (void)getSubstrings:(void *)a3 forTopoIDRange:(TopoIDRange *)a4
{
  id ***v6;
  id **v7;
  id *v8;
  id v9;
  unsigned int v10;
  int v11;
  id v12;
  unint64_t v13;
  void **v14;
  NSUUID *v15;
  NSUUID *v16;
  unsigned int v17;
  uint64_t v18;
  unsigned int clock;
  NSUUID *v20;
  unsigned int v21;
  id v22;
  void *v23;
  id v24;
  NSUUID *v25;
  NSUUID *v26;
  unsigned int v27;
  NSUUID *v28;
  unint64_t v29;
  id **v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  id **v39;
  _QWORD *v40;
  unint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char *v50;
  id **v51;
  char *v52;
  char *v53;
  id *v54;
  char *v55;
  id *v56;
  id **v57;
  char *v58;
  char *v59;
  id *v60;
  char *v61;
  char v62;
  id **v64;
  id v65[2];

  if (!a4->var1)
    goto LABEL_80;
  v6 = -[ICTTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v7 = *v6;
  v64 = v6[1];
  if (*v6 == v64)
    goto LABEL_80;
  v62 = 0;
  v61 = (char *)a3 + 16;
  do
  {
    v8 = *v7;
    v9 = **v7;
    v10 = *((_DWORD *)v8 + 2);
    v11 = *((_DWORD *)v8 + 4);
    if ((-[NSUUID isEqual:](a4->var0.replicaID, "isEqual:", v9) & 1) == 0)
      goto LABEL_69;
    v12 = v9;
    v13 = v11 + v10;
    v65[0] = v12;
    v65[1] = (id)v13;
    if (TopoID::operator<=((uint64_t)v65, a4))
    {

      goto LABEL_69;
    }
    v14 = (void **)a3;
    v15 = a4->var0.replicaID;
    v16 = v15;
    v17 = a4->var1 + a4->var0.clock;
    if (v10 == v17)
    {
      if ((objc_msgSend(v12, "isEqual:", v15) & 1) != 0)
        goto LABEL_13;
      v18 = objc_msgSend(v12, "TTCompare:", v16);

      if (v18 == 1)
        goto LABEL_14;
    }
    else
    {
      if (v10 > v17)
      {
LABEL_13:

LABEL_14:
        a3 = v14;
        goto LABEL_69;
      }

    }
    clock = a4->var0.clock;
    if (clock > v10)
    {
      v8 = -[ICTTMergeableString splitTopoSubstring:atIndex:](self, "splitTopoSubstring:atIndex:", v8, clock - v10);
      v20 = a4->var0.replicaID;
      v21 = a4->var1 + a4->var0.clock;
      v22 = v12;
      v23 = v22;
      if (v21 < v13)
      {

LABEL_18:
        -[ICTTMergeableString splitTopoSubstring:atIndex:](self, "splitTopoSubstring:atIndex:", v8, a4->var1, v61);
        goto LABEL_40;
      }
      if (v21 == (_DWORD)v13)
      {
        v37 = -[NSUUID TTCompare:](v20, "TTCompare:", v22);

        if (v37 == -1)
          goto LABEL_18;
      }
      else
      {

      }
LABEL_40:
      a3 = v14;
      v30 = (id **)v14[1];
      v41 = (unint64_t)v14[2];
      if ((unint64_t)v30 < v41)
      {
LABEL_41:
        *v30 = v8;
        v42 = v30 + 1;
LABEL_68:
        *((_QWORD *)a3 + 1) = v42;
        v62 = 1;
        goto LABEL_69;
      }
      v43 = ((char *)v30 - (_BYTE *)*v14) >> 3;
      if ((unint64_t)(v43 + 1) >> 61)
        std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
      v44 = v41 - (_QWORD)*v14;
      v45 = v44 >> 2;
      if (v44 >> 2 <= (unint64_t)(v43 + 1))
        v45 = v43 + 1;
      if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFF8)
        v34 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v34 = v45;
      if (v34)
      {
        v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)v61, v34);
        a3 = v14;
      }
      else
      {
        v35 = 0;
      }
      v51 = (id **)&v35[8 * v43];
      *v51 = v8;
      v42 = v51 + 1;
      v53 = *(char **)a3;
      v52 = (char *)*((_QWORD *)a3 + 1);
      if (v52 != *(char **)a3)
      {
        do
        {
          v54 = (id *)*((_QWORD *)v52 - 1);
          v52 -= 8;
          *--v51 = v54;
        }
        while (v52 != v53);
LABEL_65:
        v52 = *(char **)a3;
        goto LABEL_66;
      }
      goto LABEL_66;
    }
    v24 = v12;
    v25 = a4->var0.replicaID;
    v26 = v25;
    v27 = a4->var1 + a4->var0.clock;
    if (v13 > v27)
    {

LABEL_21:
      v28 = a4->var0.replicaID;
      -[ICTTMergeableString splitTopoSubstring:atIndex:](self, "splitTopoSubstring:atIndex:", v8, a4->var0.clock - v10 + a4->var1);
      a3 = v14;

      v30 = (id **)v14[1];
      v29 = (unint64_t)v14[2];
      if ((unint64_t)v30 < v29)
        goto LABEL_41;
      v31 = ((char *)v30 - (_BYTE *)*v14) >> 3;
      if ((unint64_t)(v31 + 1) >> 61)
        goto LABEL_81;
      v32 = v29 - (_QWORD)*v14;
      v33 = v32 >> 2;
      if (v32 >> 2 <= (unint64_t)(v31 + 1))
        v33 = v31 + 1;
      if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFF8)
        v34 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v34 = v33;
      if (v34)
        v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)v61, v34);
      else
        v35 = 0;
      v51 = (id **)&v35[8 * v31];
      *v51 = v8;
      v42 = v51 + 1;
      v55 = (char *)*v14;
      v52 = (char *)v14[1];
      if (v52 != *v14)
      {
        do
        {
          v56 = (id *)*((_QWORD *)v52 - 1);
          v52 -= 8;
          *--v51 = v56;
        }
        while (v52 != v55);
        goto LABEL_65;
      }
LABEL_66:
      *(_QWORD *)a3 = v51;
      *((_QWORD *)a3 + 1) = v42;
      *((_QWORD *)a3 + 2) = &v35[8 * v34];
      if (v52)
        operator delete(v52);
      goto LABEL_68;
    }
    if ((_DWORD)v13 == v27)
    {
      v36 = objc_msgSend(v24, "TTCompare:", v25);

      if (v36 == 1)
        goto LABEL_21;
    }
    else
    {

    }
    a3 = v14;
    v39 = (id **)v14[1];
    v38 = (unint64_t)v14[2];
    if ((unint64_t)v39 >= v38)
    {
      v46 = ((char *)v39 - (_BYTE *)*v14) >> 3;
      if ((unint64_t)(v46 + 1) >> 61)
LABEL_81:
        std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
      v47 = v38 - (_QWORD)*v14;
      v48 = v47 >> 2;
      if (v47 >> 2 <= (unint64_t)(v46 + 1))
        v48 = v46 + 1;
      if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF8)
        v49 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v49 = v48;
      if (v49)
        v50 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)v61, v49);
      else
        v50 = 0;
      v57 = (id **)&v50[8 * v46];
      *v57 = v8;
      v40 = v57 + 1;
      v59 = (char *)*v14;
      v58 = (char *)v14[1];
      if (v58 != *v14)
      {
        do
        {
          v60 = (id *)*((_QWORD *)v58 - 1);
          v58 -= 8;
          *--v57 = v60;
        }
        while (v58 != v59);
        v58 = (char *)*v14;
      }
      *v14 = v57;
      v14[1] = v40;
      v14[2] = &v50[8 * v49];
      if (v58)
        operator delete(v58);
    }
    else
    {
      *v39 = v8;
      v40 = v39 + 1;
    }
    v14[1] = v40;
LABEL_69:

    ++v7;
  }
  while (v7 != v64);
  if ((v62 & 1) != 0)
    -[ICTTMergeableString invalidateCache](self, "invalidateCache");
LABEL_80:

}

- (void)getCharacterRanges:(void *)a3 forSubstrings:(void *)a4
{
  _QWORD *v7;
  _QWORD *v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  int v30;

  std::vector<_NSRange>::reserve((void **)a3, (uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 3);
  v28 = 0u;
  v29 = 0u;
  v30 = 1065353216;
  v7 = *(_QWORD **)a4;
  v8 = (_QWORD *)*((_QWORD *)a4 + 1);
  while (v7 != v8)
  {
    std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>((uint64_t)&v28, v7, v7);
    ++v7;
  }
  v9 = -[ICTTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v10 = *v9;
  v11 = v9[1];
  if (*v9 != v11)
  {
    v12 = 0;
    do
    {
      v27 = *v10;
      v13 = std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::find<TopoSubstring *>(&v28, &v27);
      v14 = v13;
      if (*(_BYTE *)(v27 + 44))
      {
        v15 = 0;
        if (!v13)
          goto LABEL_28;
      }
      else
      {
        v15 = *(unsigned int *)(v27 + 16);
        if (!v13)
          goto LABEL_28;
      }
      v17 = (_QWORD *)*((_QWORD *)a3 + 1);
      v16 = *((_QWORD *)a3 + 2);
      if ((unint64_t)v17 >= v16)
      {
        v19 = *(_QWORD **)a3;
        v20 = ((uint64_t)v17 - *(_QWORD *)a3) >> 4;
        v21 = v20 + 1;
        if ((unint64_t)(v20 + 1) >> 60)
          std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
        v22 = v16 - (_QWORD)v19;
        if (v22 >> 3 > v21)
          v21 = v22 >> 3;
        if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF0)
          v23 = 0xFFFFFFFFFFFFFFFLL;
        else
          v23 = v21;
        if (v23)
        {
          v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_NSRange>>((uint64_t)a3 + 16, v23);
          v19 = *(_QWORD **)a3;
          v17 = (_QWORD *)*((_QWORD *)a3 + 1);
        }
        else
        {
          v24 = 0;
        }
        v25 = &v24[16 * v20];
        *(_QWORD *)v25 = v12;
        *((_QWORD *)v25 + 1) = v15;
        v26 = v25;
        if (v17 != v19)
        {
          do
          {
            *((_OWORD *)v26 - 1) = *((_OWORD *)v17 - 1);
            v26 -= 16;
            v17 -= 2;
          }
          while (v17 != v19);
          v19 = *(_QWORD **)a3;
        }
        v18 = v25 + 16;
        *(_QWORD *)a3 = v26;
        *((_QWORD *)a3 + 1) = v25 + 16;
        *((_QWORD *)a3 + 2) = &v24[16 * v23];
        if (v19)
          operator delete(v19);
      }
      else
      {
        *v17 = v12;
        v17[1] = v15;
        v18 = v17 + 2;
      }
      *((_QWORD *)a3 + 1) = v18;
      if (*((_QWORD *)&v29 + 1) == 1)
        break;
      std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::erase(&v28, v14);
LABEL_28:
      v12 += v15;
      ++v10;
    }
    while (v10 != v11);
  }
  std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)&v28);
}

- (unint64_t)getCharacterIndexForCharID:(TopoID)a3
{
  unsigned int clock;
  NSUUID *replicaID;
  uint64_t **v5;
  uint64_t *v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  id v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;

  clock = a3.clock;
  replicaID = a3.replicaID;
  v5 = -[ICTTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v6 = *v5;
  v7 = v5[1];
  if (*v5 == v7)
  {
LABEL_18:
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v8 = 0;
    while (1)
    {
      v9 = *v6;
      v10 = *(_BYTE *)(*v6 + 44) ? 0 : *(unsigned int *)(v9 + 16);
      if (*(_DWORD *)(v9 + 8) == clock && (objc_msgSend(*(id *)v9, "isEqual:", replicaID) & 1) != 0)
        break;
      if (objc_msgSend(*(id *)v9, "isEqual:", replicaID))
      {
        v11 = *(_DWORD *)(v9 + 8);
        if (v11 < clock || v11 == clock && objc_msgSend(*(id *)v9, "TTCompare:", replicaID) == -1)
        {
          v12 = *(id *)v9;
          v13 = v12;
          v14 = *(_DWORD *)(v9 + 16) + *(_DWORD *)(v9 + 8);
          if (v14 > clock)
          {

LABEL_21:
            v8 = v8 + clock - *(unsigned int *)(v9 + 8);
            break;
          }
          if (v14 == clock)
          {
            v15 = -[NSUUID TTCompare:](replicaID, "TTCompare:", v12);

            if (v15 == -1)
              goto LABEL_21;
          }
          else
          {

          }
        }
      }
      v8 += v10;
      if (++v6 == v7)
        goto LABEL_18;
    }
  }

  return v8;
}

- (void)enumerateSubstrings:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t, id *, id, _QWORD);
  _QWORD *v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  id v12;
  int v13;
  int v14;

  v4 = (void (**)(id, uint64_t, uint64_t, id *, id, _QWORD))a3;
  v5 = -[ICTTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v6 = (uint64_t *)*v5;
  v7 = (uint64_t *)v5[1];
  while (v6 != v7)
  {
    v8 = *v6;
    if (!*(_BYTE *)(*v6 + 44))
    {
      v9 = *(unsigned int *)(v8 + 16);
      if ((_DWORD)v9)
      {
        v10 = *(unsigned int *)(v8 + 40);
        v12 = *(id *)v8;
        v11 = *(_DWORD *)(v8 + 16);
        v13 = *(_DWORD *)(v8 + 8);
        v14 = v11;
        v4[2](v4, v10, v9, &v12, *(id *)(v8 + 24), *(unsigned int *)(v8 + 32));
      }
    }
    ++v6;
  }

}

- (int64_t)substring:(void *)a3 modifiedAfter:(id)a4
{
  return -[ICTTMergeableString substring:modifiedAfter:includeAttributes:replicaID:](self, "substring:modifiedAfter:includeAttributes:replicaID:", a3, a4, 1, 0);
}

- (int64_t)substring:(void *)a3 modifiedAfter:(id)a4 includeAttributes:(BOOL)a5 replicaID:(id *)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  uint64_t v11;
  int64_t v12;
  id v13;

  v7 = a5;
  v9 = a4;
  v10 = *(id *)a3;
  v11 = objc_msgSend(v9, "clockForUUID:atIndex:", v10, 0) - *((unsigned int *)a3 + 2);
  if (v11 >= *((unsigned int *)a3 + 4))
  {
    v13 = *((id *)a3 + 3);
    if (objc_msgSend(v9, "clockForUUID:atIndex:", v13, 1) > *((unsigned int *)a3 + 8) || !v7)
    {
      v12 = -1;
    }
    else
    {
      v12 = 0;
      if (a6)
        *a6 = objc_retainAutorelease(v13);
    }

  }
  else
  {
    if (a6)
      *a6 = objc_retainAutorelease(v10);
    v12 = v11 & ~(v11 >> 63);
  }

  return v12;
}

- (void)enumerateHighlightableRangesModifiedAfter:(id)a3 includingAttributes:(BOOL)a4 usingBlock:(id)a5
{
  _BOOL8 v6;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  int64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  char v16;
  void (**v17)(id, int64_t, int64_t);
  id v18;
  id v19;

  v6 = a4;
  v18 = a3;
  v17 = (void (**)(id, int64_t, int64_t))a5;
  -[ICTTMergeableString generateIdsForLocalChanges](self, "generateIdsForLocalChanges");
  v8 = -[ICTTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v10 = (uint64_t *)*v8;
  v9 = (uint64_t *)v8[1];
  while (v10 != v9)
  {
    v11 = *v10;
    if (!*(_BYTE *)(*v10 + 44) && *(_DWORD *)(v11 + 16))
    {
      v19 = 0;
      v12 = -[ICTTMergeableString substring:modifiedAfter:includeAttributes:replicaID:](self, "substring:modifiedAfter:includeAttributes:replicaID:", v11, v18, v6, &v19);
      v13 = v19;
      if ((v12 & 0x8000000000000000) == 0)
      {
        v14 = *(unsigned int *)(v11 + 40);
        -[ICTTMergeableString replicaUUID](self, "replicaUUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v13, "isEqual:", v15);

        if ((v16 & 1) == 0)
          v17[2](v17, v12 + v14, *(unsigned int *)(v11 + 16) - v12);
      }

    }
    ++v10;
  }

}

- (BOOL)textEitherSideOfSelectionAnchor:(TopoID)a3 wasModifiedAfter:(id)a4
{
  unsigned int clock;
  NSUUID *replicaID;
  id v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  char v11;
  _QWORD *v12;
  _QWORD *v13;
  unsigned int v14;
  BOOL v15;
  unint64_t v16;
  id v17;
  int v18;
  BOOL v19;

  clock = a3.clock;
  replicaID = a3.replicaID;
  v7 = a4;
  v8 = -[ICTTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v9 = (_QWORD *)*v8;
  v10 = (_QWORD *)v8[1];
  if ((_QWORD *)*v8 != v10)
  {
    v11 = 0;
    v12 = 0;
    while (1)
    {
      v13 = (_QWORD *)*v9;
      if ((v11 & 1) != 0)
        break;
      if (-[NSUUID isEqual:](replicaID, "isEqual:", *v13))
      {
        v14 = *((_DWORD *)v13 + 2);
        if (v14 <= clock && *((_DWORD *)v13 + 4) + v14 > clock)
        {
          if (*((_BYTE *)v13 + 44))
            v15 = v12 == 0;
          else
            v15 = 1;
          if (!v15
            && (-[ICTTMergeableString substring:modifiedAfter:](self, "substring:modifiedAfter:", v12, v7) & 0x8000000000000000) == 0
            || (v16 = -[ICTTMergeableString substring:modifiedAfter:](self, "substring:modifiedAfter:", v13, v7),
                (v16 & 0x8000000000000000) == 0)
            && v16 <= clock - *((_DWORD *)v13 + 2))
          {
LABEL_32:
            v19 = 1;
            goto LABEL_31;
          }
          v17 = (id)*v13;
          v18 = *((_DWORD *)v13 + 2) + *((_DWORD *)v13 + 4) - 1;

          if (v18 != clock)
            goto LABEL_30;
          goto LABEL_7;
        }
      }
      if (!*((_DWORD *)v13 + 4)
        && *((_DWORD *)v13 + 2) == clock
        && (objc_msgSend((id)*v13, "isEqual:", replicaID) & 1) != 0)
      {
        goto LABEL_7;
      }
      if (!*((_BYTE *)v13 + 44)
        || (-[ICTTMergeableString substring:modifiedAfter:](self, "substring:modifiedAfter:", v13, v7) & 0x8000000000000000) == 0)
      {
        v11 = 0;
        goto LABEL_27;
      }
      v11 = 0;
LABEL_8:
      v13 = v12;
LABEL_27:
      ++v9;
      v12 = v13;
      if (v9 == v10)
        goto LABEL_30;
    }
    if (!-[ICTTMergeableString substring:modifiedAfter:](self, "substring:modifiedAfter:", *v9, v7)
      && *((_DWORD *)v13 + 4))
    {
      goto LABEL_32;
    }
    if (!*((_BYTE *)v13 + 44))
      goto LABEL_30;
LABEL_7:
    v11 = 1;
    goto LABEL_8;
  }
LABEL_30:
  v19 = 0;
LABEL_31:

  return v19;
}

- (BOOL)selection:(id)a3 wasModifiedAfter:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  id **v14;
  id *v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[5];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v6 = a3;
  v7 = a4;
  -[ICTTMergeableString generateIdsForLocalChanges](self, "generateIdsForLocalChanges");
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v8 = (_QWORD *)objc_msgSend(v6, "selectionRanges");
  if (v8[1] == *v8)
  {
    LOBYTE(self) = 0;
  }
  else
  {
    v9 = (_QWORD *)objc_msgSend(v6, "selectionRanges");
    if (v9[1] - *v9 != 32)
    {
LABEL_9:
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __50__ICTTMergeableString_selection_wasModifiedAfter___block_invoke;
      v22[3] = &unk_1E76C8DF8;
      v22[4] = self;
      v23 = v7;
      v24 = &v25;
      v20 = -[ICTTMergeableString characterRangesForSelection:selectedSubstringsBlock:](self, "characterRangesForSelection:selectedSubstringsBlock:", v6, v22);
      LOBYTE(self) = *((_BYTE *)v26 + 24) != 0;

      goto LABEL_10;
    }
    v10 = *(_QWORD *)objc_msgSend(v6, "selectionRanges");
    objc_msgSend(MEMORY[0x1E0CB3A28], "TTZero");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (*(_DWORD *)(v10 + 24))
    {

      goto LABEL_9;
    }
    v13 = objc_msgSend(*(id *)(v10 + 16), "isEqual:", v11);

    if (!v13)
      goto LABEL_9;
    v14 = (id **)objc_msgSend(v6, "selectionRanges");
    v15 = *v14;
    v16 = **v14;
    v17 = *((unsigned int *)v15 + 2);
    v18 = v16;
    v19 = v18;
    if (self)
      LOBYTE(self) = -[ICTTMergeableString textEitherSideOfSelectionAnchor:wasModifiedAfter:](self, "textEitherSideOfSelectionAnchor:wasModifiedAfter:", v18, v17, v7);
    else

  }
LABEL_10:
  _Block_object_dispose(&v25, 8);

  return (char)self;
}

NSUInteger __50__ICTTMergeableString_selection_wasModifiedAfter___block_invoke(uint64_t a1, uint64_t a2, NSUInteger a3, NSUInteger a4)
{
  NSUInteger result;
  NSRange v9;
  NSRange v10;
  NSRange v11;

  result = objc_msgSend(*(id *)(a1 + 32), "substring:modifiedAfter:", a2, *(_QWORD *)(a1 + 40));
  if ((result & 0x8000000000000000) == 0)
  {
    if (*(_BYTE *)(a2 + 44)
      || (v10.length = *(unsigned int *)(a2 + 16) - result,
          v10.location = result + *(unsigned int *)(a2 + 40),
          v11.location = a3,
          v11.length = a4,
          v9 = NSIntersectionRange(v10, v11),
          result = v9.location,
          v9.length))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  return result;
}

- (void)splitTopoSubstring:(void *)a3 atIndex:(unsigned int)a4
{
  id v6;
  int v7;
  int v8;
  uint64_t v9;
  unsigned int v10;
  NSUUID *v11;
  unsigned int v12;
  TopoIDRange v14;
  uint64_t __src;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = *(id *)a3;
  v7 = *((_DWORD *)a3 + 2);
  v8 = *((_DWORD *)a3 + 4);
  *((_DWORD *)a3 + 4) = a4;
  v9 = operator new();
  v10 = v7 + a4;
  v11 = (NSUUID *)v6;
  v14.var0.replicaID = v11;
  v14.var0.clock = v10;
  v14.var1 = v8 - a4;
  if (*((_BYTE *)a3 + 44))
    v12 = 0;
  else
    v12 = a4;
  TopoSubstring::TopoSubstring((TopoSubstring *)v9, &v14, v12 + *((_DWORD *)a3 + 10));
  *(_BYTE *)(v9 + 44) = *((_BYTE *)a3 + 44);
  objc_storeStrong((id *)(v9 + 24), *((id *)a3 + 3));
  *(_DWORD *)(v9 + 32) = *((_DWORD *)a3 + 8);
  if ((void *)v9 != a3)
    std::vector<TopoSubstring *>::__assign_with_size[abi:ne180100]<TopoSubstring * const*,TopoSubstring * const*>((char *)(v9 + 48), *((char **)a3 + 6), *((_QWORD *)a3 + 7), (uint64_t)(*((_QWORD *)a3 + 7) - *((_QWORD *)a3 + 6)) >> 3);
  __src = v9;
  std::vector<TopoSubstring *>::__assign_with_size[abi:ne180100]<TopoSubstring * const*,TopoSubstring * const*>((char *)a3 + 48, (char *)&__src, (uint64_t)&v16, 1uLL);
  *(_DWORD *)(v9 + 72) = 1;

  return (void *)v9;
}

- (void)updateSubstringIndexes
{
  uint64_t **v2;
  uint64_t *v3;
  uint64_t *v4;
  int v5;
  uint64_t v6;

  v2 = -[ICTTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v3 = *v2;
  v4 = v2[1];
  if (*v2 != v4)
  {
    v5 = 0;
    do
    {
      v6 = *v3;
      *(_DWORD *)(v6 + 40) = v5;
      if (!*(_BYTE *)(v6 + 44))
        v5 += *(_DWORD *)(v6 + 16);
      ++v3;
    }
    while (v3 != v4);
  }
}

- (void)coalesce
{
  TopoSubstring *v3;
  void *v4;
  id v5;
  _QWORD *i;
  uint64_t v7;
  id v8;
  int v9;
  int v10;
  uint64_t v11;
  unsigned int unserializedClock;
  id v13;
  id v14;
  int v15;
  _QWORD *j;
  uint64_t v17;
  void *v18;
  id v19;
  int v20;
  int v21;
  id v22;
  int v23;
  int v24;
  _QWORD v25[4];
  id v26;
  ICTTMergeableString *v27;
  uint64_t *v28;
  _QWORD *v29;
  uint64_t *v30;
  TopoSubstring *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  uint64_t (*v36)(uint64_t);
  _BYTE v37[32];
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  uint64_t (*v44)(uint64_t);
  _BYTE v45[32];
  uint64_t v46;
  int v47;
  _QWORD v48[3];
  int v49;

  if (!self->_editCount && !-[ICTTMergeableString isFragment](self, "isFragment"))
  {
    v3 = *self->_startNodes.__begin_;
    v48[0] = 0;
    v48[1] = v48;
    v48[2] = 0x2020000000;
    v49 = 0;
    v40 = 0;
    v41 = &v40;
    v42 = 0x5812000000;
    v43 = __Block_byref_object_copy__10;
    v44 = __Block_byref_object_dispose__11;
    memset(v45, 0, sizeof(v45));
    v46 = 0;
    v47 = 1065353216;
    v32 = 0;
    v33 = &v32;
    v34 = 0x5812000000;
    v35 = __Block_byref_object_copy__10;
    v36 = __Block_byref_object_dispose__11;
    memset(v37, 0, sizeof(v37));
    v38 = 0;
    v39 = 1065353216;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __31__ICTTMergeableString_coalesce__block_invoke;
    v25[3] = &unk_1E76C8E48;
    v31 = v3;
    v28 = &v32;
    v5 = v4;
    v26 = v5;
    v27 = self;
    v29 = v48;
    v30 = &v40;
    -[ICTTMergeableString traverseUnordered:](self, "traverseUnordered:", v25);
    for (i = (_QWORD *)v41[8]; i; i = (_QWORD *)*i)
    {
      v7 = i[2];
      v8 = *(id *)v7;
      v9 = *(_DWORD *)(v7 + 8);
      v10 = *(_DWORD *)(v7 + 16);
      objc_msgSend(MEMORY[0x1E0CB3A28], "CR_unserialized");
      v11 = objc_claimAutoreleasedReturnValue();
      unserializedClock = self->_unserializedClock;
      v13 = *(id *)v7;
      *(_QWORD *)v7 = v11;

      *(_DWORD *)(v7 + 8) = unserializedClock;
      self->_unserializedClock += *(_DWORD *)(v7 + 16);
      v14 = v8;
      v22 = v14;
      v23 = v9;
      v24 = v10;
      v19 = *(id *)v7;
      v15 = *(_DWORD *)(v7 + 16);
      v20 = *(_DWORD *)(v7 + 8);
      v21 = v15;
      -[ICTTMergeableString updateTopoIDRange:toNewRangeID:](self, "updateTopoIDRange:toNewRangeID:", &v22, &v19);

    }
    for (j = (_QWORD *)v33[8]; j; j = (_QWORD *)*j)
    {
      v17 = j[2];
      if (v17)
      {
        v18 = *(void **)(v17 + 48);
        if (v18)
        {
          *(_QWORD *)(v17 + 56) = v18;
          operator delete(v18);
        }

        MEMORY[0x1C3B7A848](v17, 0x1080C40D9F1C51ELL);
      }
    }
    -[ICTTMergeableString invalidateCache](self, "invalidateCache");

    _Block_object_dispose(&v32, 8);
    std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)&v37[8]);
    _Block_object_dispose(&v40, 8);
    std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)&v45[8]);
    _Block_object_dispose(v48, 8);
  }
}

void __31__ICTTMergeableString_coalesce__block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  id v16;
  int v17;
  int v18;
  void *v19;
  id v20;
  int v21;
  uint64_t v22;
  int v23;
  id v24;
  int v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  int v31;
  id v32;
  int v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  int v38;
  int v39;
  id v40;
  int v41;
  int v42;
  id v43;
  int v44;
  int v45;
  uint64_t v46;
  uint64_t v47;

  v47 = a2;
  if (a1[9] != a2)
  {
    v2 = a2;
    v3 = *(uint64_t **)(a2 + 48);
    if (*(_QWORD *)(a2 + 56) - (_QWORD)v3 == 8)
    {
      v5 = 0x1E0CB3000uLL;
      do
      {
        v46 = 0;
        v6 = *v3;
        v46 = v6;
        if (*(_DWORD *)(v6 + 72) != 1 || *(unsigned __int8 *)(v2 + 44) != *(unsigned __int8 *)(v6 + 44))
          return;
        if ((objc_msgSend(*(id *)v2, "isEqual:", *(_QWORD *)v6) & 1) != 0)
        {
          v7 = v47;
          if (*(_DWORD *)(v2 + 16) + *(_DWORD *)(v2 + 8) == *(_DWORD *)(v6 + 8)
            && *(_DWORD *)(v47 + 32) == *(_DWORD *)(v46 + 32))
          {
            v8 = objc_msgSend(*(id *)(v47 + 24), "isEqual:", *(_QWORD *)(v46 + 24));
            v7 = v47;
            if (v8)
            {
              v9 = v47;
              if (v47 != v46)
              {
                std::vector<TopoSubstring *>::__assign_with_size[abi:ne180100]<TopoSubstring * const*,TopoSubstring * const*>((char *)(v47 + 48), *(char **)(v46 + 48), *(_QWORD *)(v46 + 56), (uint64_t)(*(_QWORD *)(v46 + 56) - *(_QWORD *)(v46 + 48)) >> 3);
                v9 = v46;
                v7 = v47;
              }
              *(_DWORD *)(v7 + 16) += *(_DWORD *)(v9 + 16);
              std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>(*(_QWORD *)(a1[6] + 8) + 48, &v46, &v46);
              goto LABEL_27;
            }
          }
        }
        else
        {
          v7 = v47;
        }
        v10 = *(void **)v7;
        objc_msgSend(*(id *)(v5 + 2600), "CR_unserialized", v34, v35, v36);
        v11 = objc_claimAutoreleasedReturnValue();
        if (v10 != (void *)v11)
        {
          v10 = (void *)v11;
          goto LABEL_32;
        }
        v12 = *(id *)v46;
        objc_msgSend(*(id *)(v5 + 2600), "CR_unserialized");
        v13 = objc_claimAutoreleasedReturnValue();
        if (v12 != (id)v13)
        {
          v12 = (id)v13;
LABEL_31:

LABEL_32:
          return;
        }
        if (*(_DWORD *)(v47 + 32) != *(_DWORD *)(v46 + 32))
          goto LABEL_31;
        v14 = objc_msgSend(*(id *)(v47 + 24), "isEqual:", *(_QWORD *)(v46 + 24));

        if (!v14)
          return;
        v15 = v47;
        v16 = *(id *)v47;
        v17 = *(_DWORD *)(v15 + 8);
        v18 = *(_DWORD *)(v15 + 16);
        if (v47 != v46)
          std::vector<TopoSubstring *>::__assign_with_size[abi:ne180100]<TopoSubstring * const*,TopoSubstring * const*>((char *)(v47 + 48), *(char **)(v46 + 48), *(_QWORD *)(v46 + 56), (uint64_t)(*(_QWORD *)(v46 + 56) - *(_QWORD *)(v46 + 48)) >> 3);
        v19 = (void *)a1[4];
        v20 = v19;
        v21 = *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
        v22 = v47;
        v23 = *(_DWORD *)(v47 + 16);
        v24 = v20;
        v25 = *(_DWORD *)(v46 + 16) + *(_DWORD *)(v22 + 16);
        objc_storeStrong((id *)v22, v19);
        *(_DWORD *)(v22 + 8) = v21;
        *(_DWORD *)(v22 + 16) = v25;
        *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24) += *(_DWORD *)(v47 + 16);
        v26 = (void *)a1[5];
        v27 = v16;
        v43 = v27;
        v44 = v17;
        v45 = v18;
        v28 = v24;
        v40 = v28;
        v41 = v21;
        v42 = v18;
        if (v26)
        {
          objc_msgSend(v26, "updateTopoIDRange:toNewRangeID:", &v43, &v40);
        }
        else
        {

        }
        v29 = (void *)a1[5];
        v30 = v46;
        v37 = *(id *)v46;
        v31 = *(_DWORD *)(v30 + 16);
        v38 = *(_DWORD *)(v30 + 8);
        v39 = v31;
        v32 = v28;
        v34 = v32;
        v33 = *(_DWORD *)(v46 + 16);
        LODWORD(v35) = v23 + v21;
        LODWORD(v36) = v33;
        if (v29)
        {
          objc_msgSend(v29, "updateTopoIDRange:toNewRangeID:", &v37, &v34);
        }
        else
        {

        }
        std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>(*(_QWORD *)(a1[8] + 8) + 48, &v47, &v47);
        std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>(*(_QWORD *)(a1[6] + 8) + 48, &v46, &v46);
        *(_BYTE *)(a1[5] + 112) = 1;

        v5 = 0x1E0CB3000;
LABEL_27:
        v2 = v47;
        v3 = *(uint64_t **)(v47 + 48);
      }
      while (*(_QWORD *)(v47 + 56) - (_QWORD)v3 == 8);
    }
  }
}

- (void)updateTopoIDRange:(TopoIDRange *)a3 toNewRangeID:(TopoIDRange *)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unsigned int var1;
  unsigned int v13;
  void (**updateRangeBlock)(id, NSUUID **, NSUUID **);
  unsigned int v15;
  unsigned int v16;
  NSUUID *v17;
  unsigned int v18;
  unsigned int v19;
  NSUUID *v20;
  unsigned int v21;
  unsigned int v22;
  NSUUID *v23;
  unsigned int v24;
  unsigned int v25;
  NSUUID *v26;
  unsigned int clock;
  unsigned int v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[ICTTMergeableString objectsNeedingUpdatedRanges](self, "objectsNeedingUpdatedRanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v26 = a3->var0.replicaID;
        var1 = a3->var1;
        clock = a3->var0.clock;
        v28 = var1;
        v23 = a4->var0.replicaID;
        v13 = a4->var1;
        v24 = a4->var0.clock;
        v25 = v13;
        if (v11)
        {
          objc_msgSend(v11, "updateTopoIDRange:toNewRangeID:", &v26, &v23);
        }
        else
        {

        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v8);
  }

  updateRangeBlock = (void (**)(id, NSUUID **, NSUUID **))self->_updateRangeBlock;
  if (updateRangeBlock)
  {
    v20 = a3->var0.replicaID;
    v15 = a3->var1;
    v21 = a3->var0.clock;
    v22 = v15;
    v17 = a4->var0.replicaID;
    v16 = a4->var1;
    v18 = a4->var0.clock;
    v19 = v16;
    updateRangeBlock[2](updateRangeBlock, &v20, &v17);
  }

}

- (void)cleanupObjectsNeedingUpdatedRanges
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 5);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[ICTTMergeableString objectsNeedingUpdatedRanges](self, "objectsNeedingUpdatedRanges", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v8, "hasTopoIDsThatCanChange") & 1) == 0)
          objc_msgSend(v3, "addObject:", v8);
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[ICTTMergeableString objectsNeedingUpdatedRanges](self, "objectsNeedingUpdatedRanges");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusHashTable:", v3);

}

- (void)dumpData
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 120);
  v4 = 134218498;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1BD918000, log, OS_LOG_TYPE_ERROR, "Dumping mergeable string data: %p %@ %@", (uint8_t *)&v4, 0x20u);
}

- (void)dumpMergeData:(id)a3
{
  id *v4;
  uint64_t v5;
  uint64_t v6;
  uint32_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSMutableAttributedString *attributedString;
  NSMutableAttributedString *v31;
  id v32;
  NSUUID *replicaUUID;
  void *v34;
  NSMutableAttributedString *v35;
  id *v36;
  uint8_t buf[4];
  ICTTMergeableString *v38;
  __int16 v39;
  NSUUID *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v5 = -[NSMutableAttributedString mutableCopy](self->_attributedString, "mutableCopy");
  v6 = objc_msgSend(v4[19], "mutableCopy");
  v7 = arc4random();
  v34 = (void *)v6;
  v35 = (NSMutableAttributedString *)v5;
  v36 = v4;
  v8 = -[NSMutableAttributedString length](self->_attributedString, "length");
  if (v8)
  {
    v9 = 0;
    do
    {
      -[NSMutableAttributedString mutableString](self->_attributedString, "mutableString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0CB3940];
      -[NSMutableAttributedString mutableString](self->_attributedString, "mutableString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%c"), (v7 ^ objc_msgSend(v12, "characterAtIndex:", v9)) % 0x5E + 32);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "replaceCharactersInRange:withString:", v9, 1, v13);

      ++v9;
    }
    while (v8 != v9);
  }
  v14 = v36;
  v15 = objc_msgSend(v36[19], "length");
  if (v15)
  {
    v16 = 0;
    do
    {
      objc_msgSend(v14[19], "mutableString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v14[19], "mutableString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("%c"), (v7 ^ objc_msgSend(v19, "characterAtIndex:", v16)) % 0x5E + 32);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "replaceCharactersInRange:withString:", v16, 1, v20);

      ++v16;
      v14 = v36;
    }
    while (v15 != v16);
  }
  -[ICTTMergeableString serialize](self, "serialize");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "serialize");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  NSTemporaryDirectory();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mergeA-%p.data"), self);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringByAppendingPathComponent:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  NSTemporaryDirectory();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mergeB-%p.data"), self);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringByAppendingPathComponent:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "writeToFile:atomically:", v25, 1);
  objc_msgSend(v22, "writeToFile:atomically:", v28, 1);
  v29 = os_log_create("com.apple.notes", "Topotext");
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    replicaUUID = self->_replicaUUID;
    *(_DWORD *)buf = 134218754;
    v38 = self;
    v39 = 2112;
    v40 = replicaUUID;
    v41 = 2112;
    v42 = v25;
    v43 = 2112;
    v44 = v28;
    _os_log_error_impl(&dword_1BD918000, v29, OS_LOG_TYPE_ERROR, "Dumping merge: %p %@ %@ %@", buf, 0x2Au);
  }

  attributedString = self->_attributedString;
  self->_attributedString = v35;
  v31 = v35;

  v32 = v14[19];
  v14[19] = v34;

}

void __55__ICTTMergeableString_mergeWithString_mergeTimestamps___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 72) = 0;
}

void __55__ICTTMergeableString_mergeWithString_mergeTimestamps___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;

  v2 = *(uint64_t **)(a2 + 48);
  v3 = *(uint64_t **)(a2 + 56);
  while (v2 != v3)
  {
    v4 = *v2++;
    ++*(_DWORD *)(v4 + 72);
  }
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTTMergeableString string](self, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p = '%@'>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableAttributedString *attributedString;
  void *v6;
  BOOL v7;

  v4 = a3;
  attributedString = self->_attributedString;
  objc_msgSend(v4, "attributedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(attributedString) = -[NSMutableAttributedString isEqual:](attributedString, "isEqual:", v6);

  v7 = (attributedString & 1) != 0 && -[ICTTMergeableString graphIsEqual:](self, "graphIsEqual:", v4);
  return v7;
}

- (BOOL)graphIsEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t **v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  _QWORD v20[6];
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  uint64_t (*v26)(uint64_t);
  _BYTE v27[32];
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v4 = a3;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 1;
  v22 = 0;
  v23 = &v22;
  v24 = 0x5812000000;
  v25 = __Block_byref_object_copy__73;
  v26 = __Block_byref_object_dispose__74;
  memset(v27, 0, sizeof(v27));
  v28 = 0;
  v29 = 1065353216;
  -[ICTTMergeableString coalesce](self, "coalesce");
  objc_msgSend(v4, "coalesce");
  v5 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __36__ICTTMergeableString_graphIsEqual___block_invoke;
  v21[3] = &unk_1E76C8D80;
  v21[4] = &v22;
  -[ICTTMergeableString traverseUnordered:](self, "traverseUnordered:", v21);
  v20[0] = v5;
  v20[1] = 3221225472;
  v20[2] = __36__ICTTMergeableString_graphIsEqual___block_invoke_2;
  v20[3] = &unk_1E76C8D58;
  v20[4] = &v22;
  v20[5] = &v30;
  objc_msgSend(v4, "traverseUnordered:", v20);
  if (*((_BYTE *)v31 + 24))
  {
    v6 = (uint64_t **)v23[8];
    if (v6)
    {
      while (1)
      {
        v7 = v6[2];
        v8 = v6[4];
        v9 = v6[5];
        if (!v8 || v9 == 0)
          break;
        v12 = v8[6];
        v11 = v8[7];
        v13 = (v11 - v12) >> 3;
        if (v13 != (v9[7] - v9[6]) >> 3)
          break;
        if (v11 != v12)
        {
          v14 = 0;
          if (v13 <= 1)
            v15 = 1;
          else
            v15 = (v11 - v12) >> 3;
          while (1)
          {
            v16 = *(_QWORD *)(v8[6] + 8 * v14);
            v17 = *(_QWORD *)(v9[6] + 8 * v14);
            if (*(_DWORD *)(v16 + 8) != *(_DWORD *)(v17 + 8)
              || (objc_msgSend(*(id *)v16, "isEqual:", *(_QWORD *)v17) & 1) == 0)
            {
              break;
            }
            if (v15 == ++v14)
              goto LABEL_17;
          }
          *((_BYTE *)v31 + 24) = 0;
        }
LABEL_17:
        if (!*((_BYTE *)v31 + 24))
          goto LABEL_21;

        v6 = (uint64_t **)*v6;
        if (!v6)
          goto LABEL_22;
      }
      *((_BYTE *)v31 + 24) = 0;
LABEL_21:

    }
  }
LABEL_22:
  v18 = *((_BYTE *)v31 + 24);
  _Block_object_dispose(&v22, 8);
  std::__hash_table<TopoID,std::hash<TopoID>,std::equal_to<TopoID>,std::allocator<TopoID>>::~__hash_table((uint64_t)&v27[8]);
  _Block_object_dispose(&v30, 8);

  return v18;
}

_QWORD *__36__ICTTMergeableString_graphIsEqual___block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *result;
  _QWORD *v7;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48;
  v7 = a2;
  *((_QWORD *)std::__hash_table<std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::__unordered_map_hasher<TopoID,std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::hash<TopoID>,std::equal_to<TopoID>,true>,std::__unordered_map_equal<TopoID,std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::equal_to<TopoID>,std::hash<TopoID>,true>,std::allocator<std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>>>::__emplace_unique_key_args<TopoID,std::piecewise_construct_t const&,std::tuple<TopoID const&>,std::tuple<>>(v4, a2, (uint64_t)&std::piecewise_construct, (uint64_t *)&v7)+ 4) = a2;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48;
  v7 = a2;
  result = std::__hash_table<std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::__unordered_map_hasher<TopoID,std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::hash<TopoID>,std::equal_to<TopoID>,true>,std::__unordered_map_equal<TopoID,std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::equal_to<TopoID>,std::hash<TopoID>,true>,std::allocator<std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>>>::__emplace_unique_key_args<TopoID,std::piecewise_construct_t const&,std::tuple<TopoID const&>,std::tuple<>>(v5, a2, (uint64_t)&std::piecewise_construct, (uint64_t *)&v7);
  result[5] = 0;
  return result;
}

uint64_t *__36__ICTTMergeableString_graphIsEqual___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t *result;
  uint64_t *v7;
  uint64_t v8;

  result = std::__hash_table<TopoID,std::hash<TopoID>,std::equal_to<TopoID>,std::allocator<TopoID>>::find<TopoID>((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48), (_QWORD *)a2);
  if (result
    && (v7 = result, v8 = result[4], *(_DWORD *)(a2 + 32) == *(_DWORD *)(v8 + 32))
    && (result = (uint64_t *)objc_msgSend(*(id *)(a2 + 24), "isEqual:", *(_QWORD *)(v8 + 24)),
        (result & 1) != 0))
  {
    v7[5] = a2;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ICTTMergeableString attributedString](self, "attributedString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)dotDescription:(unint64_t)a3
{
  id v5;
  __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t **v12;
  uint64_t *v13;
  uint64_t v14;
  TopoSubstring **end;
  TopoSubstring **begin;
  __CFString *v17;
  int v18;
  int v19;
  void *v20;
  TopoSubstring **v21;
  TopoSubstring **v22;
  _QWORD *v23;
  _QWORD *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  void *v30;
  void *v32;
  ICTTMergeableString *v33;
  uint64_t *v34;

  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v5, "appendFormat:", CFSTR("subgraph cluster_%ld%p_%ld {\n  rankdir=\"LR\";\n"), a3, self, a3);
  if (-[ICTTMergeableString isFragment](self, "isFragment"))
  {
    v6 = CFSTR("<Fragment>");
  }
  else
  {
    -[ICTTMergeableString string](self, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "description");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  -[__CFString stringByReplacingOccurrencesOfString:withString:](v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\\n"));
  v9 = objc_claimAutoreleasedReturnValue();

  -[ICTTMergeableString replicaUUID](self, "replicaUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)v9;
  objc_msgSend(v10, "TTShortDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("  label=\"%@_%ld (%ld)    '%@'\"\n"), v11, a3, -[ICTTVectorMultiTimestamp clockForUUID:atIndex:](self->_timestamp, "clockForUUID:atIndex:", self->_replicaUUID, 0), v9);

  objc_msgSend(v5, "appendFormat:", CFSTR("  color=lightgrey;\n"));
  v12 = -[ICTTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v13 = *v12;
  v34 = v12[1];
  if (*v12 != v34)
  {
    v33 = self;
    while (1)
    {
      v14 = *v13;
      begin = self->_startNodes.__begin_;
      end = self->_startNodes.__end_;
      if (begin != end)
      {
        while (*begin != (TopoSubstring *)v14)
        {
          if (++begin == end)
          {
            begin = self->_startNodes.__end_;
            break;
          }
        }
      }
      if (begin != end)
        break;
      v22 = self->_endNodes.__begin_;
      v21 = self->_endNodes.__end_;
      if (v22 != v21)
      {
        while (*v22 != (TopoSubstring *)v14)
        {
          if (++v22 == v21)
          {
            v22 = self->_endNodes.__end_;
            break;
          }
        }
      }
      if (v22 == v21)
      {
        v17 = &stru_1E76DB108;
        if (!*(_BYTE *)(v14 + 44))
        {
          -[NSMutableAttributedString string](self->_attributedString, "string");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v25;
          if (*(_BYTE *)(v14 + 44))
            v27 = 0;
          else
            v27 = *(unsigned int *)(v14 + 16);
          objc_msgSend(v25, "substringWithRange:", *(unsigned int *)(v14 + 40), v27);
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(*(id *)v14, "TTShortDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = *(unsigned int *)(v14 + 8);
        v29 = *(_DWORD *)(v14 + 16);
        objc_msgSend(*(id *)(v14 + 24), "TTShortDescription");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("  N%ld%p [label=\"%@ %@,%d-%u (%@,%d)\"];\n"),
          a3,
          v14,
          v17,
          v20,
          v28,
          (v28 + v29 - 1),
          v30,
          *(unsigned int *)(v14 + 32));

        goto LABEL_12;
      }
      objc_msgSend(*(id *)v14, "TTShortDescription");
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("  N%ld%p [label=\"End\\n%@,%d\"];\n"),
        a3,
        v14,
        v17,
        *(unsigned int *)(v14 + 8));
LABEL_19:

      v23 = *(_QWORD **)(v14 + 48);
      v24 = *(_QWORD **)(v14 + 56);
      while (v23 != v24)
        objc_msgSend(v5, "appendFormat:", CFSTR("  N%ld%p -> N%ld%p;\n"), a3, v14, a3, *v23++);
      if (++v13 == v34)
        goto LABEL_30;
    }
    v17 = (__CFString *)*(id *)v14;
    v18 = *(_DWORD *)(v14 + 8);
    v19 = *(_DWORD *)(v14 + 16);
    -[__CFString TTShortDescription](v17, "TTShortDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  N%ld%p [label=\"Start\\n%@,%d\"];\n"),
      a3,
      v14,
      v20,
      (v18 + v19 - 1));
LABEL_12:
    self = v33;

    goto LABEL_19;
  }
LABEL_30:
  objc_msgSend(v5, "appendString:", CFSTR("}\n"));

  return v5;
}

- (NSUUID)replicaUUID
{
  return self->_replicaUUID;
}

- (void)setHasLocalChanges:(BOOL)a3
{
  self->_hasLocalChanges = a3;
}

- (unint64_t)replicaTextClock
{
  return self->_replicaTextClock;
}

- (unint64_t)replicaStyleClock
{
  return self->_replicaStyleClock;
}

- (void)deleteSubstrings:(uint64_t)a3 withCharacterRanges:(char)a4
{
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  __int128 *v18;
  unint64_t v19;
  unint64_t v20;
  __int128 *v21;
  unint64_t v22;
  unint64_t v23;
  BOOL v24;
  unint64_t v25;
  unint64_t v26;
  __int128 *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  __int128 *v31;
  unint64_t v32;
  __int128 *v33;
  __int128 *v34;
  __int128 *v35;
  __int128 *v36;
  unint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 *v41;
  BOOL v43;
  uint64_t v44;
  unint64_t *v45;
  __int128 *v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  _QWORD *v51;
  int64_t v52;
  int64_t v53;
  int64_t v54;
  uint64_t v55;
  unint64_t *v56;
  unint64_t v57;
  __int128 *v58;
  __int128 v59;
  unint64_t v60;
  __int128 *v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _OWORD *v66;
  __int128 *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  __int128 *v72;
  unint64_t v73;
  uint64_t v74;
  __int128 *v75;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;

- (ICTTMergeableString)initWithArchive:(const void *)a3 replicaID:(id)a4
{
  return -[ICTTMergeableString initWithArchive:replicaID:orderedSubstrings:](self, "initWithArchive:replicaID:orderedSubstrings:", a3, a4, 0);
}

- (ICTTMergeableString)initWithArchive:(const void *)a3 replicaID:(id)a4 timestamp:(id)a5
{
  return -[ICTTMergeableString initWithArchive:replicaID:orderedSubstrings:timestamp:fragment:](self, "initWithArchive:replicaID:orderedSubstrings:timestamp:fragment:", a3, a4, 0, a5, 0);
}

- (ICTTMergeableString)initWithArchive:(const void *)a3 replicaID:(id)a4 orderedSubstrings:(void *)a5
{
  return -[ICTTMergeableString initWithArchive:replicaID:orderedSubstrings:timestamp:fragment:](self, "initWithArchive:replicaID:orderedSubstrings:timestamp:fragment:", a3, a4, a5, 0, 0);
}

- (void)saveToArchive:(void *)a3
{
  -[ICTTMergeableString generateIdsForLocalChanges](self, "generateIdsForLocalChanges");
  -[ICTTMergeableString coalesce](self, "coalesce");
  -[ICTTMergeableString checkTimestampLogStyleErrors:](self, "checkTimestampLogStyleErrors:", 1);
  -[ICTTMergeableString saveSubstrings:archiveSet:linkSet:archivedString:toArchive:](self, "saveSubstrings:archiveSet:linkSet:archivedString:toArchive:", -[ICTTMergeableString orderedSubstrings](self, "orderedSubstrings"), 0, 0, 0, a3);
}

- (void)saveSubstrings:(void *)a3 archiveSet:(void *)a4 linkSet:(void *)a5 archivedString:(id *)a6 toArchive:(void *)a7
{
  uint64_t *v11;
  uint64_t *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  topotext::Substring *v25;
  uint64_t v26;
  int32x2_t v27;
  topotext::CharID *v28;
  void *v29;
  int v30;
  topotext::CharID *v31;
  int v32;
  topotext::CharID *v33;
  void *v34;
  int v35;
  topotext::CharID *v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  unint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  topotext::CharID *v46;
  uint64_t v47;
  int v48;
  uint64_t *v49;
  uint64_t *i;
  int v51;
  int v52;
  uint64_t v53;
  void *v54;
  id v55;
  void *v56;
  _QWORD *v57;
  void *v58;
  char v59;
  void *v60;
  topotext::VectorTimestamp *v61;
  id *v62;
  _QWORD *v63;
  id v64;
  uint64_t *v66;
  _QWORD *v67;
  void *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  _OWORD v72[2];
  int v73;
  _QWORD *v74[2];

  v62 = a6;
  memset(v72, 0, sizeof(v72));
  v73 = 1065353216;
  v11 = *(uint64_t **)a3;
  v12 = (uint64_t *)*((_QWORD *)a3 + 1);
  if (*(uint64_t **)a3 != v12)
  {
    v13 = 0;
    do
    {
      v71 = *v11;
      v74[0] = &v71;
      *((_DWORD *)std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned int>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned int>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned int>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned int>>>::__emplace_unique_key_args<TopoSubstring *,std::piecewise_construct_t const&,std::tuple<TopoSubstring * const&>,std::tuple<>>((uint64_t)v72, &v71, (uint64_t)&std::piecewise_construct, v74)+ 6) = v13++;
      ++v11;
    }
    while (v11 != v12);
  }
  v64 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  -[ICTTMergeableString timestamp](self, "timestamp");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sortedUUIDs");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  v69 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "TTZero");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setObject:forKeyedSubscript:", &unk_1E771A528, v15);
  v67 = a4;

  v16 = objc_msgSend(v68, "count");
  if (v16)
  {
    v17 = 0;
    do
    {
      v18 = v17 + 1;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17 + 1, v62);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "objectAtIndexedSubscript:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "setObject:forKeyedSubscript:", v19, v20);

      v17 = v18;
    }
    while (v16 != v18);
  }
  v21 = *(uint64_t **)a3;
  v66 = (uint64_t *)*((_QWORD *)a3 + 1);
  if (*(uint64_t **)a3 != v66)
  {
    do
    {
      v71 = 0;
      v71 = *v21;
      v22 = *((_DWORD *)a7 + 15);
      v23 = *((int *)a7 + 14);
      if ((int)v23 >= v22)
      {
        if (v22 == *((_DWORD *)a7 + 16))
          google::protobuf::internal::RepeatedPtrFieldBase::Reserve((int *)a7 + 12, v22 + 1);
        v25 = google::protobuf::internal::GenericTypeHandler<topotext::Substring>::New();
        v26 = *((_QWORD *)a7 + 6);
        v27 = *(int32x2_t *)((char *)a7 + 56);
        *((int32x2_t *)a7 + 7) = vadd_s32(v27, (int32x2_t)0x100000001);
        *(_QWORD *)(v26 + 8 * v27.i32[0]) = v25;
      }
      else
      {
        v24 = *((_QWORD *)a7 + 6);
        *((_DWORD *)a7 + 14) = v23 + 1;
        v25 = *(topotext::Substring **)(v24 + 8 * v23);
      }
      *((_DWORD *)v25 + 8) |= 1u;
      v28 = (topotext::CharID *)*((_QWORD *)v25 + 5);
      if (!v28)
      {
        v28 = (topotext::CharID *)operator new();
        topotext::CharID::CharID(v28);
        *((_QWORD *)v25 + 5) = v28;
      }
      objc_msgSend(v69, "objectForKeyedSubscript:", *(_QWORD *)v71, v62);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "integerValue");
      *((_DWORD *)v28 + 8) |= 1u;
      *((_DWORD *)v28 + 10) = v30;

      *((_DWORD *)v25 + 8) |= 1u;
      v31 = (topotext::CharID *)*((_QWORD *)v25 + 5);
      if (!v31)
      {
        v31 = (topotext::CharID *)operator new();
        topotext::CharID::CharID(v31);
        *((_QWORD *)v25 + 5) = v31;
      }
      v32 = *(_DWORD *)(v71 + 8);
      *((_DWORD *)v31 + 8) |= 2u;
      *((_DWORD *)v31 + 11) = v32;
      if (v67
        && !std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::find<TopoSubstring *>(v67, &v71))
      {
        *((_DWORD *)v25 + 8) |= 4u;
        v46 = (topotext::CharID *)*((_QWORD *)v25 + 6);
        if (!v46)
        {
          v46 = (topotext::CharID *)operator new();
          topotext::CharID::CharID(v46);
          *((_QWORD *)v25 + 6) = v46;
        }
        *((_DWORD *)v46 + 8) |= 1u;
        *((_DWORD *)v46 + 10) = 0;
        *((_DWORD *)v25 + 8) |= 4u;
        *((_DWORD *)v46 + 8) |= 2u;
        *((_DWORD *)v46 + 11) = 0;
      }
      else
      {
        *((_DWORD *)v25 + 8) |= 4u;
        v33 = (topotext::CharID *)*((_QWORD *)v25 + 6);
        if (!v33)
        {
          v33 = (topotext::CharID *)operator new();
          topotext::CharID::CharID(v33);
          *((_QWORD *)v25 + 6) = v33;
        }
        objc_msgSend(v69, "objectForKeyedSubscript:", *(_QWORD *)(v71 + 24));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "integerValue");
        *((_DWORD *)v33 + 8) |= 1u;
        *((_DWORD *)v33 + 10) = v35;

        *((_DWORD *)v25 + 8) |= 4u;
        v36 = (topotext::CharID *)*((_QWORD *)v25 + 6);
        if (!v36)
        {
          v36 = (topotext::CharID *)operator new();
          topotext::CharID::CharID(v36);
          *((_QWORD *)v25 + 6) = v36;
        }
        v37 = v71;
        v38 = *(_DWORD *)(v71 + 32);
        *((_DWORD *)v36 + 8) |= 2u;
        *((_DWORD *)v36 + 11) = v38;
        if (!*(_BYTE *)(v37 + 44))
        {
          v39 = *(unsigned int *)(v37 + 40);
          v40 = *(unsigned int *)(v37 + 16);
          -[ICTTMergeableString attributedString](self, "attributedString");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "length");

          if (v40 + v39 <= v42)
          {
            -[ICTTMergeableString attributedString](self, "attributedString");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = v43;
            if (*(_BYTE *)(v71 + 44))
              v45 = 0;
            else
              v45 = *(unsigned int *)(v71 + 16);
            objc_msgSend(v43, "attributedSubstringFromRange:", *(unsigned int *)(v71 + 40), v45);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "appendAttributedString:", v54);

          }
          goto LABEL_31;
        }
      }
      *((_DWORD *)v25 + 8) |= 8u;
      *((_BYTE *)v25 + 60) = 1;
LABEL_31:
      v47 = v71;
      v48 = *(_DWORD *)(v71 + 16);
      *((_DWORD *)v25 + 8) |= 2u;
      *((_DWORD *)v25 + 14) = v48;
      v49 = *(uint64_t **)(v47 + 48);
      for (i = *(uint64_t **)(v47 + 56); v49 != i; ++v49)
      {
        v70 = 0;
        v70 = *v49;
        if (!a5
          || std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::find<TopoSubstring *>(a5, &v70))
        {
          v74[0] = &v70;
          v51 = *((_DWORD *)std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned int>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned int>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned int>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned int>>>::__emplace_unique_key_args<TopoSubstring *,std::piecewise_construct_t const&,std::tuple<TopoSubstring * const&>,std::tuple<>>((uint64_t)v72, &v70, (uint64_t)&std::piecewise_construct, v74)+ 6);
          v52 = *((_DWORD *)v25 + 18);
          if (v52 == *((_DWORD *)v25 + 19))
          {
            google::protobuf::RepeatedField<unsigned int>::Reserve((_DWORD *)v25 + 16, v52 + 1);
            v52 = *((_DWORD *)v25 + 18);
          }
          v53 = *((_QWORD *)v25 + 8);
          *((_DWORD *)v25 + 18) = v52 + 1;
          *(_DWORD *)(v53 + 4 * v52) = v51;
        }
      }
      ++v21;
    }
    while (v21 != v66);
  }
  objc_msgSend(v64, "string", v62);
  v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v55, "UTF8String");
  objc_msgSend(v64, "string");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "lengthOfBytesUsingEncoding:", 4);
  *((_DWORD *)a7 + 8) |= 1u;
  if (!google::protobuf::internal::empty_string_)
    __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
  if (*((_QWORD *)a7 + 5) == google::protobuf::internal::empty_string_)
  {
    v57 = (_QWORD *)operator new();
    *v57 = 0;
    v57[1] = 0;
    v57[2] = 0;
    *((_QWORD *)a7 + 5) = v57;
  }
  MEMORY[0x1C3B7A7E8]();

  if (v63)
    *v63 = objc_retainAutorelease(v64);
  -[ICTTMergeableString timestamp](self, "timestamp");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "isDocumentShared");

  if ((v59 & 1) == 0)
  {
    -[ICTTMergeableString timestamp](self, "timestamp");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)a7 + 8) |= 4u;
    v61 = (topotext::VectorTimestamp *)*((_QWORD *)a7 + 9);
    if (!v61)
    {
      v61 = (topotext::VectorTimestamp *)operator new();
      topotext::VectorTimestamp::VectorTimestamp(v61);
      *((_QWORD *)a7 + 9) = v61;
    }
    objc_msgSend(v60, "saveToArchive:", v61);

  }
  std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)v72);
}

- (id)serialize
{
  id v3;
  void *v4;
  int v5;
  _BYTE v7[128];

  topotext::String::String((topotext::String *)v7);
  -[ICTTMergeableString saveToArchive:](self, "saveToArchive:", v7);
  v3 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", (int)topotext::String::ByteSize((topotext::String *)v7)));
  v4 = (void *)objc_msgSend(v3, "mutableBytes");
  v5 = ICTTBoundedCheckedCastNSUIntegerToUInt32(objc_msgSend(v3, "length"));
  google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)v7, v4, v5);
  topotext::String::~String((topotext::String *)v7);
  return v3;
}

- (id)i_saveDeltasSinceTimestamp:(id)a3 toArchive:(void *)a4
{
  id v6;
  uint64_t **v7;
  uint64_t *v8;
  uint64_t v9;
  id v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  id **v14;
  id **v15;
  id *v16;
  id v17;
  int v18;
  int v19;
  unsigned int v20;
  unsigned int v21;
  char *v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char *v27;
  char *v28;
  char *v29;
  char *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char *v37;
  char *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t *v43;
  char *v44;
  char *v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  char *v49;
  char *v50;
  char *v51;
  char *v52;
  uint64_t v53;
  id v54;
  ICTTMergeableString *v56;
  void *v57;
  uint64_t *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  _OWORD v62[2];
  int v63;
  _OWORD v64[2];
  int v65;
  char *v66;
  char *v67;
  _QWORD v68[2];

  v6 = a3;
  -[ICTTMergeableString generateIdsForLocalChanges](self, "generateIdsForLocalChanges");
  -[ICTTMergeableString coalesce](self, "coalesce");
  v56 = self;
  v57 = a4;
  v66 = 0;
  v67 = 0;
  v68[0] = 0;
  memset(v64, 0, sizeof(v64));
  v65 = 1065353216;
  memset(v62, 0, sizeof(v62));
  v63 = 1065353216;
  v7 = -[ICTTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v8 = *v7;
  v58 = v7[1];
  if (*v7 != v58)
  {
    do
    {
      v9 = *v8;
      v61 = v9;
      v10 = *(id *)v9;
      v11 = *(_DWORD *)(v9 + 8);
      LODWORD(v9) = *(_DWORD *)(v9 + 16);
      v12 = objc_msgSend(v6, "clockForUUID:atIndex:", v10, 0);
      v13 = objc_msgSend(v6, "clockForUUID:atIndex:", v10, 1);
      if ((int)v9 + v11 >= v12 || *(_DWORD *)(v61 + 32) >= v13)
      {
        std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>((uint64_t)v62, &v61, &v61);
        if (!std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::find<TopoSubstring *>(v64, &v61))
        {
          v32 = v67;
          if ((unint64_t)v67 >= v68[0])
          {
            v34 = (v67 - v66) >> 3;
            if ((unint64_t)(v34 + 1) >> 61)
              std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
            v35 = (uint64_t)(v68[0] - (_QWORD)v66) >> 2;
            if (v35 <= v34 + 1)
              v35 = v34 + 1;
            if (v68[0] - (_QWORD)v66 >= 0x7FFFFFFFFFFFFFF8uLL)
              v36 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v36 = v35;
            if (v36)
              v37 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)v68, v36);
            else
              v37 = 0;
            v38 = &v37[8 * v34];
            *(_QWORD *)v38 = v61;
            v33 = v38 + 8;
            v40 = v66;
            v39 = v67;
            if (v67 != v66)
            {
              do
              {
                v41 = *((_QWORD *)v39 - 1);
                v39 -= 8;
                *((_QWORD *)v38 - 1) = v41;
                v38 -= 8;
              }
              while (v39 != v40);
              v39 = v66;
            }
            v66 = v38;
            v67 = v33;
            v68[0] = &v37[8 * v36];
            if (v39)
              operator delete(v39);
          }
          else
          {
            *(_QWORD *)v67 = v61;
            v33 = v32 + 8;
          }
          v67 = v33;
          std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>((uint64_t)v64, &v61, &v61);
        }
        v42 = *(uint64_t **)(v61 + 48);
        v43 = *(uint64_t **)(v61 + 56);
        while (v42 != v43)
        {
          v60 = 0;
          v60 = *v42;
          if (!std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::find<TopoSubstring *>(v64, &v60))
          {
            v44 = v67;
            if ((unint64_t)v67 >= v68[0])
            {
              v46 = (v67 - v66) >> 3;
              if ((unint64_t)(v46 + 1) >> 61)
                std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
              v47 = (uint64_t)(v68[0] - (_QWORD)v66) >> 2;
              if (v47 <= v46 + 1)
                v47 = v46 + 1;
              if (v68[0] - (_QWORD)v66 >= 0x7FFFFFFFFFFFFFF8uLL)
                v48 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v48 = v47;
              if (v48)
                v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)v68, v48);
              else
                v49 = 0;
              v50 = &v49[8 * v46];
              *(_QWORD *)v50 = v60;
              v45 = v50 + 8;
              v52 = v66;
              v51 = v67;
              if (v67 != v66)
              {
                do
                {
                  v53 = *((_QWORD *)v51 - 1);
                  v51 -= 8;
                  *((_QWORD *)v50 - 1) = v53;
                  v50 -= 8;
                }
                while (v51 != v52);
                v51 = v66;
              }
              v66 = v50;
              v67 = v45;
              v68[0] = &v49[8 * v48];
              if (v51)
                operator delete(v51);
            }
            else
            {
              *(_QWORD *)v67 = v60;
              v45 = v44 + 8;
            }
            v67 = v45;
            std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>((uint64_t)v64, &v60, &v60);
          }
          ++v42;
        }
      }
      else
      {
        v14 = *(id ***)(v61 + 48);
        v15 = *(id ***)(v61 + 56);
        while (v14 != v15)
        {
          v16 = *v14;
          v17 = **v14;
          v18 = *((_DWORD *)v16 + 2);
          v19 = *((_DWORD *)v16 + 4);
          v20 = objc_msgSend(v6, "clockForUUID:atIndex:", v17, 0);
          v21 = objc_msgSend(v6, "clockForUUID:atIndex:", v17, 1);
          if ((v19 + v18 >= v20 || *((_DWORD *)v16 + 8) >= v21)
            && !std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::find<TopoSubstring *>(v64, &v61))
          {
            v22 = v67;
            if ((unint64_t)v67 >= v68[0])
            {
              v24 = (v67 - v66) >> 3;
              if ((unint64_t)(v24 + 1) >> 61)
                std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
              v25 = (uint64_t)(v68[0] - (_QWORD)v66) >> 2;
              if (v25 <= v24 + 1)
                v25 = v24 + 1;
              if (v68[0] - (_QWORD)v66 >= 0x7FFFFFFFFFFFFFF8uLL)
                v26 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v26 = v25;
              if (v26)
                v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)v68, v26);
              else
                v27 = 0;
              v28 = &v27[8 * v24];
              *(_QWORD *)v28 = v61;
              v23 = v28 + 8;
              v30 = v66;
              v29 = v67;
              if (v67 != v66)
              {
                do
                {
                  v31 = *((_QWORD *)v29 - 1);
                  v29 -= 8;
                  *((_QWORD *)v28 - 1) = v31;
                  v28 -= 8;
                }
                while (v29 != v30);
                v29 = v66;
              }
              v66 = v28;
              v67 = v23;
              v68[0] = &v27[8 * v26];
              if (v29)
                operator delete(v29);
            }
            else
            {
              *(_QWORD *)v67 = v61;
              v23 = v22 + 8;
            }
            v67 = v23;
            std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>((uint64_t)v64, &v61, &v61);
          }

          ++v14;
        }
      }

      ++v8;
    }
    while (v8 != v58);
  }
  v59 = 0;
  -[ICTTMergeableString saveSubstrings:archiveSet:linkSet:archivedString:toArchive:](v56, "saveSubstrings:archiveSet:linkSet:archivedString:toArchive:", &v66, v62, v64, &v59, v57);
  v54 = v59;
  std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)v62);
  std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)v64);
  if (v66)
  {
    v67 = v66;
    operator delete(v66);
  }

  return v54;
}

- (void)saveDeltaSinceTimestamp:(id)a3 toArchive:(void *)a4
{
  id v4;

  v4 = -[ICTTMergeableString i_saveDeltasSinceTimestamp:toArchive:](self, "i_saveDeltasSinceTimestamp:toArchive:", a3, a4);
}

- (id)serializeDeltaSinceTimestamp:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  _BYTE v12[128];

  v4 = a3;
  if (-[ICTTMergeableString hasLocalChanges](self, "hasLocalChanges")
    || (-[ICTTMergeableString timestamp](self, "timestamp"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqual:", v4),
        v5,
        (v6 & 1) == 0))
  {
    topotext::String::String((topotext::String *)v12);
    -[ICTTMergeableString saveDeltaSinceTimestamp:toArchive:](self, "saveDeltaSinceTimestamp:toArchive:", v4, v12);
    v7 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", (int)topotext::String::ByteSize((topotext::String *)v12)));
    v8 = (void *)objc_msgSend(v7, "mutableBytes");
    v9 = ICTTBoundedCheckedCastNSUIntegerToUInt32(objc_msgSend(v7, "length"));
    google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)v12, v8, v9);
    topotext::String::~String((topotext::String *)v12);
  }
  else
  {
    v7 = 0;
  }
  v10 = (void *)objc_msgSend(v7, "copy");

  return v10;
}

- (ICCRTTCompatibleDocument)document
{
  void *v2;
  void *v3;

  objc_getAssociatedObject(self, (const void *)ICTTMergeableStringICCRDataTypeICCRDocumentWeakObjectKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICCRTTCompatibleDocument *)v3;
}

- (void)setDocument:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "replica");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTTMergeableString setReplicaUUID:](self, "setReplicaUUID:", v4);

  objc_opt_class();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "sharedTopotextTimestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTTMergeableString setTimestamp:](self, "setTimestamp:", v7);

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64298]), "initWithObject:", v6);
    objc_setAssociatedObject(self, (const void *)ICTTMergeableStringICCRDataTypeICCRDocumentWeakObjectKey, v8, (void *)0x301);

  }
  else if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICTTMergeableString(ICCRDataType) setDocument:]", 1, 0, CFSTR("ICTTMergeableString document set to non-TT-compatible document."));
  }

}

- (void)mergeWith:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Invalid merge, classes must be equal for merge."), 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v7);
    }
    -[ICTTMergeableString mergeWithString:mergeTimestamps:](self, "mergeWithString:mergeTimestamps:", v8, 0);
    -[ICTTMergeableString document](self, "document");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[ICTTMergeableString document](self, "document");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringsWithClocksNeedingUpdating");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", self);

    }
  }

}

- (void)realizeLocalChangesIn:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[ICTTMergeableString generateIdsForLocalChanges](self, "generateIdsForLocalChanges", a3);
  -[ICTTMergeableString document](self, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ICTTMergeableString document](self, "document");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringsWithClocksToResetAfterRealizingLocalChanges");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", self);

  }
}

- (void)check:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "Corrupt mergeable string, length of substrings != attributedString length.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)check:(os_log_t)log .cold.2(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1BD918000, log, OS_LOG_TYPE_ERROR, "Corrupt mergeable string, substring max > string max.", buf, 2u);
}

void __52__ICTTMergeableString_checkTimestampLogStyleErrors___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "Style clock is too low.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __52__ICTTMergeableString_checkTimestampLogStyleErrors___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "Text clock is too low.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)mergeWithString:mergeTimestamps:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "Failed to merge strings.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)mergeWithString:(uint64_t)a1 mergeTimestamps:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1BD918000, a2, OS_LOG_TYPE_ERROR, "Failed to merge strings: %@", (uint8_t *)&v2, 0xCu);
}

@end
