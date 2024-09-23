@implementation MPModelPlaylistEntryKind

void __42__MPModelPlaylistEntryKind_kindWithKinds___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(a2 + 16), *(id *)(a1 + 32));
}

BOOL __42__MPModelPlaylistEntryKind_kindWithKinds___block_invoke(uint64_t a1, unint64_t a2, unint64_t a3)
{
  return a2 < a3;
}

- (id)humanDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[NSArray valueForKeyPath:](self->_kinds, "valueForKeyPath:", CFSTR("humanDescription"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" or "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("playlist entries of (%@)"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (MPModelPlaylistEntryKind)kindWithKinds:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("PlaylistEntry:k"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_41850);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "appendFormat:", CFSTR("%p"), *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v11 = objc_opt_class();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __42__MPModelPlaylistEntryKind_kindWithKinds___block_invoke_2;
  v15[3] = &unk_1E315F2F8;
  v16 = v4;
  v12 = v4;
  objc_msgSend(a1, "kindWithModelClass:cacheKey:block:", v11, v5, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPModelPlaylistEntryKind *)v13;
}

- (void)applyToView:(shared_ptr<mlcore:(id)a4 :LibraryView>)a3 withContext:
{
  uint64_t isKindOfClass;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t v17;
  int64x2_t *v18;
  _QWORD *v19;
  _QWORD *v20;
  char *v21;
  __int128 v22;
  int64x2_t v23;
  int64x2_t *v24;
  char *v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char *v34;
  uint64_t v35;
  int64x2_t *v36;
  _QWORD *v37;
  _QWORD *v38;
  char *v39;
  __int128 v40;
  int64x2_t v41;
  int64x2_t *v42;
  char *v43;
  std::__shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  id v47;
  unint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  unint64_t *v51;
  unint64_t v52;
  std::__shared_weak_count *v53;
  unint64_t *v54;
  unint64_t v55;
  _OWORD *v56;
  __int128 v57;
  unint64_t *v58;
  unint64_t v59;
  std::__shared_weak_count *v60;
  unint64_t *v61;
  unint64_t v62;
  void *v63;
  void *v64;
  int v65;
  mlcore *v66;
  mlcore *v67;
  ModelPropertyBase *v68;
  mlcore *v69;
  __int128 v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  unint64_t v75;
  char *v76;
  uint64_t v77;
  char *v78;
  _QWORD *v79;
  _QWORD *v80;
  char *v81;
  __int128 v82;
  int64x2_t v83;
  _OWORD *v84;
  char *v85;
  std::__shared_weak_count *v86;
  unint64_t *v87;
  unint64_t v88;
  std::__shared_weak_count *v89;
  unint64_t *v90;
  unint64_t v91;
  __int128 v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  unint64_t v97;
  char *v98;
  uint64_t v99;
  char *v100;
  _QWORD *v101;
  _QWORD *v102;
  char *v103;
  __int128 v104;
  int64x2_t v105;
  _OWORD *v106;
  char *v107;
  std::__shared_weak_count *v108;
  unint64_t *v109;
  unint64_t v110;
  std::__shared_weak_count *v111;
  unint64_t *v112;
  unint64_t v113;
  std::__shared_weak_count *v114;
  unint64_t *p_shared_owners;
  unint64_t v116;
  std::__shared_weak_count *v117;
  unint64_t *v118;
  unint64_t v119;
  __shared_weak_count *v120;
  uint64_t v121;
  id obj;
  int64x2_t v123;
  char *v124;
  _QWORD v125[3];
  std::__shared_weak_count *v126;
  _QWORD v127[3];
  std::__shared_weak_count *v128;
  uint64_t v129;
  __int128 v130;
  _QWORD v131[3];
  _QWORD v132[3];
  int64x2_t v133;
  char *v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  int64x2_t v139;
  char *v140;
  int64x2_t *v141;
  int64x2_t v142;
  char *v143;
  char **v144;
  __int128 v145;
  int64x2_t v146;
  char *v147;
  _BYTE v148[128];
  uint64_t v149;

  v149 = *MEMORY[0x1E0C80C00];
  v120 = a3.var1;
  v123 = 0uLL;
  v124 = 0;
  v139 = 0uLL;
  v140 = 0;
  v135 = 0u;
  v136 = 0u;
  v137 = 0u;
  v138 = 0u;
  -[MPModelPlaylistEntryKind kinds](self, "kinds");
  obj = (id)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v135, v148, 16);
  v6 = isKindOfClass;
  if (!isKindOfClass)
  {
    LOBYTE(v121) = 0;
    goto LABEL_55;
  }
  LOBYTE(v121) = 0;
  v7 = *(_QWORD *)v136;
  do
  {
    v8 = 0;
    do
    {
      if (*(_QWORD *)v136 != v7)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * v8);
      v10 = mlcore::PlaylistItemPropertyItemPersistentID((mlcore *)isKindOfClass);
      if (v9)
        objc_msgSend(v9, "predicateWithBaseProperty:", v10);
      else
        v133 = 0uLL;
      v11 = v123.i64[1];
      if (v123.i64[1] >= (unint64_t)v124)
      {
        v12 = (v123.i64[1] - v123.i64[0]) >> 4;
        v13 = v12 + 1;
        if ((unint64_t)(v12 + 1) >> 60)
          std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
        v14 = (uint64_t)&v124[-v123.i64[0]];
        if ((uint64_t)&v124[-v123.i64[0]] >> 3 > v13)
          v13 = v14 >> 3;
        if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0)
          v15 = 0xFFFFFFFFFFFFFFFLL;
        else
          v15 = v13;
        v144 = &v124;
        v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v15);
        v18 = (int64x2_t *)&v16[16 * v12];
        *v18 = v133;
        v133 = 0uLL;
        v19 = (_QWORD *)v123.i64[1];
        v20 = (_QWORD *)v123.i64[0];
        if (v123.i64[1] == v123.i64[0])
        {
          v23 = vdupq_n_s64(v123.u64[1]);
          v21 = &v16[16 * v12];
        }
        else
        {
          v21 = &v16[16 * v12];
          do
          {
            v22 = *((_OWORD *)v19 - 1);
            v19 -= 2;
            *((_OWORD *)v21 - 1) = v22;
            v21 -= 16;
            *v19 = 0;
            v19[1] = 0;
          }
          while (v19 != v20);
          v23 = v123;
        }
        v24 = v18 + 1;
        v123.i64[0] = (uint64_t)v21;
        v142 = v23;
        v25 = v124;
        v124 = &v16[16 * v17];
        v143 = v25;
        v141 = (int64x2_t *)v23.i64[0];
        std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v141);
        v26 = (std::__shared_weak_count *)v133.i64[1];
        v123.i64[1] = (uint64_t)v24;
        if (!v133.i64[1])
          goto LABEL_27;
        v27 = (unint64_t *)(v133.i64[1] + 8);
        do
          v28 = __ldaxr(v27);
        while (__stlxr(v28 - 1, v27));
        if (!v28)
        {
          ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
          std::__shared_weak_count::__release_weak(v26);
          if (v9)
          {
LABEL_28:
            objc_msgSend(v9, "predicateWithBaseProperty:", 0);
            goto LABEL_31;
          }
        }
        else
        {
LABEL_27:
          if (v9)
            goto LABEL_28;
        }
      }
      else
      {
        *(int64x2_t *)v123.i64[1] = v133;
        v123.i64[1] = v11 + 16;
        if (v9)
          goto LABEL_28;
      }
      v133 = 0uLL;
LABEL_31:
      v29 = v139.i64[1];
      if (v139.i64[1] >= (unint64_t)v140)
      {
        v30 = (v139.i64[1] - v139.i64[0]) >> 4;
        v31 = v30 + 1;
        if ((unint64_t)(v30 + 1) >> 60)
          std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
        v32 = (uint64_t)&v140[-v139.i64[0]];
        if ((uint64_t)&v140[-v139.i64[0]] >> 3 > v31)
          v31 = v32 >> 3;
        if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFF0)
          v33 = 0xFFFFFFFFFFFFFFFLL;
        else
          v33 = v31;
        v144 = &v140;
        v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v33);
        v36 = (int64x2_t *)&v34[16 * v30];
        *v36 = v133;
        v133 = 0uLL;
        v37 = (_QWORD *)v139.i64[1];
        v38 = (_QWORD *)v139.i64[0];
        if (v139.i64[1] == v139.i64[0])
        {
          v41 = vdupq_n_s64(v139.u64[1]);
          v39 = &v34[16 * v30];
        }
        else
        {
          v39 = &v34[16 * v30];
          do
          {
            v40 = *((_OWORD *)v37 - 1);
            v37 -= 2;
            *((_OWORD *)v39 - 1) = v40;
            v39 -= 16;
            *v37 = 0;
            v37[1] = 0;
          }
          while (v37 != v38);
          v41 = v139;
        }
        v42 = v36 + 1;
        v139.i64[0] = (uint64_t)v39;
        v139.i64[1] = (uint64_t)v36[1].i64;
        v142 = v41;
        v43 = v140;
        v140 = &v34[16 * v35];
        v143 = v43;
        v141 = (int64x2_t *)v41.i64[0];
        std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v141);
        v44 = (std::__shared_weak_count *)v133.i64[1];
        v139.i64[1] = (uint64_t)v42;
        if (v133.i64[1])
        {
          v45 = (unint64_t *)(v133.i64[1] + 8);
          do
            v46 = __ldaxr(v45);
          while (__stlxr(v46 - 1, v45));
          if (!v46)
          {
            ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
            std::__shared_weak_count::__release_weak(v44);
          }
        }
      }
      else
      {
        *(int64x2_t *)v139.i64[1] = v133;
        v139.i64[1] = v29 + 16;
      }
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
      {
        v47 = v9;
        v48 = objc_msgSend(v47, "options");

        v121 = (v48 >> 1) & 1;
      }
      ++v8;
    }
    while (v8 != v6);
    isKindOfClass = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v135, v148, 16);
    v6 = isKindOfClass;
  }
  while (isKindOfClass);
LABEL_55:

  memset(v132, 0, sizeof(v132));
  std::vector<std::shared_ptr<mlcore::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<mlcore::Predicate>*,std::shared_ptr<mlcore::Predicate>*>(v132, v123.i64[0], (_QWORD *)v123.i64[1], (v123.i64[1] - v123.i64[0]) >> 4);
  mlcore::CreateOrPredicate();
  v133 = 0uLL;
  v134 = 0;
  v141 = &v133;
  v142.i8[0] = 0;
  v49 = operator new(0x10uLL);
  v133.i64[0] = (uint64_t)v49;
  v133.i64[1] = (uint64_t)v49;
  v134 = (char *)(v49 + 2);
  v50 = v146.i64[1];
  *v49 = v146.i64[0];
  v49[1] = v50;
  if (v50)
  {
    v51 = (unint64_t *)(v50 + 8);
    do
      v52 = __ldxr(v51);
    while (__stxr(v52 + 1, v51));
    v53 = (std::__shared_weak_count *)v146.i64[1];
    v133.i64[1] = (uint64_t)(v49 + 2);
    if (v146.i64[1])
    {
      v54 = (unint64_t *)(v146.i64[1] + 8);
      do
        v55 = __ldaxr(v54);
      while (__stlxr(v55 - 1, v54));
      if (!v55)
      {
        ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
        std::__shared_weak_count::__release_weak(v53);
      }
    }
  }
  else
  {
    v133.i64[1] = (uint64_t)(v49 + 2);
  }
  v141 = (int64x2_t *)v132;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v141);
  memset(v131, 0, sizeof(v131));
  std::vector<std::shared_ptr<mlcore::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<mlcore::Predicate>*,std::shared_ptr<mlcore::Predicate>*>(v131, v139.i64[0], (_QWORD *)v139.i64[1], (v139.i64[1] - v139.i64[0]) >> 4);
  mlcore::CreateOrPredicate();
  v146 = 0uLL;
  v147 = 0;
  v141 = &v146;
  v142.i8[0] = 0;
  v56 = operator new(0x10uLL);
  v146.i64[0] = (uint64_t)v56;
  v146.i64[1] = (uint64_t)v56;
  v147 = (char *)(v56 + 1);
  v57 = v145;
  *v56 = v145;
  if (*((_QWORD *)&v57 + 1))
  {
    v58 = (unint64_t *)(*((_QWORD *)&v57 + 1) + 8);
    do
      v59 = __ldxr(v58);
    while (__stxr(v59 + 1, v58));
    v60 = (std::__shared_weak_count *)*((_QWORD *)&v145 + 1);
    v146.i64[1] = (uint64_t)(v56 + 1);
    if (*((_QWORD *)&v145 + 1))
    {
      v61 = (unint64_t *)(*((_QWORD *)&v145 + 1) + 8);
      do
        v62 = __ldaxr(v61);
      while (__stlxr(v62 - 1, v61));
      if (!v62)
      {
        ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
        std::__shared_weak_count::__release_weak(v60);
      }
    }
  }
  else
  {
    v146.i64[1] = (uint64_t)(v56 + 1);
  }
  v141 = (int64x2_t *)v131;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v141);
  if ((v121 & 1) == 0)
  {
    -[__shared_weak_count mediaLibrary](v120, "mediaLibrary");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaLibrarySystemFilters filtersForLibrary:](MPMediaLibrarySystemFilters, "filtersForLibrary:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v64, "shouldExcludePurchaseHistoryContent");

    if (v65)
    {
      v67 = (mlcore *)mlcore::PlaylistItemPropertyItemPersistentID(v66);
      v68 = (ModelPropertyBase *)mlcore::ItemPropertyRemoteLocationID(v67);
      MPMediaLibraryGetProperty((ModelPropertyBase *)v67, v68);
      v129 = 100;
      v69 = (mlcore *)std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<long long>,std::allocator<mlcore::ComparisonPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::ComparisonOperator &,long long const&,mlcore::ComparisonOptions &,void>((uint64_t *)&v130);
      v70 = v130;
      v145 = v130;
      v130 = 0uLL;
      v71 = v133.i64[1];
      if (v133.i64[1] >= (unint64_t)v134)
      {
        v72 = (v133.i64[1] - v133.i64[0]) >> 4;
        v73 = v72 + 1;
        if ((unint64_t)(v72 + 1) >> 60)
          std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
        v74 = (uint64_t)&v134[-v133.i64[0]];
        if ((uint64_t)&v134[-v133.i64[0]] >> 3 > v73)
          v73 = v74 >> 3;
        if ((unint64_t)v74 >= 0x7FFFFFFFFFFFFFF0)
          v75 = 0xFFFFFFFFFFFFFFFLL;
        else
          v75 = v73;
        v144 = &v134;
        v76 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v75);
        v78 = &v76[16 * v72];
        *(_OWORD *)v78 = v145;
        v145 = 0uLL;
        v79 = (_QWORD *)v133.i64[1];
        v80 = (_QWORD *)v133.i64[0];
        if (v133.i64[1] == v133.i64[0])
        {
          v83 = vdupq_n_s64(v133.u64[1]);
          v81 = &v76[16 * v72];
        }
        else
        {
          v81 = &v76[16 * v72];
          do
          {
            v82 = *((_OWORD *)v79 - 1);
            v79 -= 2;
            *((_OWORD *)v81 - 1) = v82;
            v81 -= 16;
            *v79 = 0;
            v79[1] = 0;
          }
          while (v79 != v80);
          v83 = v133;
        }
        v84 = v78 + 16;
        v133.i64[0] = (uint64_t)v81;
        v133.i64[1] = (uint64_t)(v78 + 16);
        v142 = v83;
        v85 = v134;
        v134 = &v76[16 * v77];
        v143 = v85;
        v141 = (int64x2_t *)v83.i64[0];
        v69 = (mlcore *)std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v141);
        v86 = (std::__shared_weak_count *)*((_QWORD *)&v145 + 1);
        v133.i64[1] = (uint64_t)v84;
        if (*((_QWORD *)&v145 + 1))
        {
          v87 = (unint64_t *)(*((_QWORD *)&v145 + 1) + 8);
          do
            v88 = __ldaxr(v87);
          while (__stlxr(v88 - 1, v87));
          if (!v88)
          {
            ((void (*)(std::__shared_weak_count *))v86->__on_zero_shared)(v86);
            std::__shared_weak_count::__release_weak(v86);
          }
        }
      }
      else
      {
        *(_QWORD *)v133.i64[1] = v70;
        *(_QWORD *)(v71 + 8) = *((_QWORD *)&v70 + 1);
        v145 = 0uLL;
        v133.i64[1] = v71 + 16;
      }
      v89 = (std::__shared_weak_count *)*((_QWORD *)&v130 + 1);
      if (*((_QWORD *)&v130 + 1))
      {
        v90 = (unint64_t *)(*((_QWORD *)&v130 + 1) + 8);
        do
          v91 = __ldaxr(v90);
        while (__stlxr(v91 - 1, v90));
        if (!v91)
        {
          ((void (*)(std::__shared_weak_count *))v89->__on_zero_shared)(v89);
          std::__shared_weak_count::__release_weak(v89);
        }
      }
      mlcore::ItemPropertyRemoteLocationID(v69);
      v129 = 100;
      std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<long long>,std::allocator<mlcore::ComparisonPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::ComparisonOperator &,long long const&,mlcore::ComparisonOptions &,void>((uint64_t *)&v130);
      v92 = v130;
      v145 = v130;
      v130 = 0uLL;
      v93 = v146.i64[1];
      if (v146.i64[1] >= (unint64_t)v147)
      {
        v94 = (v146.i64[1] - v146.i64[0]) >> 4;
        v95 = v94 + 1;
        if ((unint64_t)(v94 + 1) >> 60)
          std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
        v96 = (uint64_t)&v147[-v146.i64[0]];
        if ((uint64_t)&v147[-v146.i64[0]] >> 3 > v95)
          v95 = v96 >> 3;
        if ((unint64_t)v96 >= 0x7FFFFFFFFFFFFFF0)
          v97 = 0xFFFFFFFFFFFFFFFLL;
        else
          v97 = v95;
        v144 = &v147;
        v98 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v97);
        v100 = &v98[16 * v94];
        *(_OWORD *)v100 = v145;
        v145 = 0uLL;
        v101 = (_QWORD *)v146.i64[1];
        v102 = (_QWORD *)v146.i64[0];
        if (v146.i64[1] == v146.i64[0])
        {
          v105 = vdupq_n_s64(v146.u64[1]);
          v103 = &v98[16 * v94];
        }
        else
        {
          v103 = &v98[16 * v94];
          do
          {
            v104 = *((_OWORD *)v101 - 1);
            v101 -= 2;
            *((_OWORD *)v103 - 1) = v104;
            v103 -= 16;
            *v101 = 0;
            v101[1] = 0;
          }
          while (v101 != v102);
          v105 = v146;
        }
        v106 = v100 + 16;
        v146.i64[0] = (uint64_t)v103;
        v146.i64[1] = (uint64_t)(v100 + 16);
        v142 = v105;
        v107 = v147;
        v147 = &v98[16 * v99];
        v143 = v107;
        v141 = (int64x2_t *)v105.i64[0];
        std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v141);
        v108 = (std::__shared_weak_count *)*((_QWORD *)&v145 + 1);
        v146.i64[1] = (uint64_t)v106;
        if (*((_QWORD *)&v145 + 1))
        {
          v109 = (unint64_t *)(*((_QWORD *)&v145 + 1) + 8);
          do
            v110 = __ldaxr(v109);
          while (__stlxr(v110 - 1, v109));
          if (!v110)
          {
            ((void (*)(std::__shared_weak_count *))v108->__on_zero_shared)(v108);
            std::__shared_weak_count::__release_weak(v108);
          }
        }
      }
      else
      {
        *(_QWORD *)v146.i64[1] = v92;
        *(_QWORD *)(v93 + 8) = *((_QWORD *)&v92 + 1);
        v145 = 0uLL;
        v146.i64[1] = v93 + 16;
      }
      v111 = (std::__shared_weak_count *)*((_QWORD *)&v130 + 1);
      if (*((_QWORD *)&v130 + 1))
      {
        v112 = (unint64_t *)(*((_QWORD *)&v130 + 1) + 8);
        do
          v113 = __ldaxr(v112);
        while (__stlxr(v113 - 1, v112));
        if (!v113)
        {
          ((void (*)(std::__shared_weak_count *))v111->__on_zero_shared)(v111);
          std::__shared_weak_count::__release_weak(v111);
        }
      }
    }
  }
  MEMORY[0x194038ED8]();
  memset(v127, 0, sizeof(v127));
  std::vector<std::shared_ptr<mlcore::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<mlcore::Predicate>*,std::shared_ptr<mlcore::Predicate>*>(v127, v133.i64[0], (_QWORD *)v133.i64[1], (v133.i64[1] - v133.i64[0]) >> 4);
  mlcore::CreateAndPredicate();
  mlcore::LibraryView::setFilterPredicateForEntityClass();
  v114 = v128;
  if (v128)
  {
    p_shared_owners = (unint64_t *)&v128->__shared_owners_;
    do
      v116 = __ldaxr(p_shared_owners);
    while (__stlxr(v116 - 1, p_shared_owners));
    if (!v116)
    {
      ((void (*)(std::__shared_weak_count *))v114->__on_zero_shared)(v114);
      std::__shared_weak_count::__release_weak(v114);
    }
  }
  v141 = (int64x2_t *)v127;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v141);
  MEMORY[0x194039EC8]();
  memset(v125, 0, sizeof(v125));
  std::vector<std::shared_ptr<mlcore::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<mlcore::Predicate>*,std::shared_ptr<mlcore::Predicate>*>(v125, v146.i64[0], (_QWORD *)v146.i64[1], (v146.i64[1] - v146.i64[0]) >> 4);
  mlcore::CreateAndPredicate();
  mlcore::LibraryView::setFilterPredicateForEntityClass();
  v117 = v126;
  if (v126)
  {
    v118 = (unint64_t *)&v126->__shared_owners_;
    do
      v119 = __ldaxr(v118);
    while (__stlxr(v119 - 1, v118));
    if (!v119)
    {
      ((void (*)(std::__shared_weak_count *))v117->__on_zero_shared)(v117);
      std::__shared_weak_count::__release_weak(v117);
    }
  }
  v141 = (int64x2_t *)v125;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v141);
  v141 = &v146;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v141);
  v141 = &v133;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v141);
  v141 = &v139;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v141);
  v141 = &v123;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v141);

}

- (NSArray)kinds
{
  return self->_kinds;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPModelPlaylistEntryKind;
  v3 = -[MPModelKind hash](&v5, sel_hash);
  return -[NSArray hash](self->_kinds, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MPModelPlaylistEntryKind;
  if (-[MPModelKind isEqual:](&v7, sel_isEqual_, v4))
    v5 = -[NSArray isEqual:](self->_kinds, "isEqual:", v4[2]);
  else
    v5 = 0;

  return v5;
}

- (MPModelPlaylistEntryKind)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  MPModelPlaylistEntryKind *v9;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("kinds"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    +[MPModelPlaylistEntryKind kindWithKinds:](MPModelPlaylistEntryKind, "kindWithKinds:", v8);
    v9 = (MPModelPlaylistEntryKind *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPModelPlaylistEntryKind;
  v4 = a3;
  -[MPModelKind encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_kinds, CFSTR("kinds"), v5.receiver, v5.super_class);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kinds, 0);
}

+ (id)identityKind
{
  return +[MPModelKind kindWithModelClass:](MPModelKind, "kindWithModelClass:", objc_opt_class());
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
