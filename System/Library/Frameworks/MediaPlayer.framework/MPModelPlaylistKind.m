@implementation MPModelPlaylistKind

+ (id)identityKind
{
  return +[MPModelKind kindWithModelClass:](MPModelKind, "kindWithModelClass:", objc_opt_class());
}

void __66__MPModelPlaylistKind_kindWithVariants_playlistEntryKind_options___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;

  *(_QWORD *)(a2 + 16) = *(_QWORD *)(a1 + 40);
  objc_storeStrong((id *)(a2 + 24), *(id *)(a1 + 32));
  v4 = (id)a2;
  v4[4] = *(_QWORD *)(a1 + 48);

}

- (void)applyToView:(shared_ptr<mlcore:(id)a4 :LibraryView>)a3 withContext:
{
  LibraryView *var0;
  __shared_weak_count *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  mlcore::LibraryView *v21;
  std::__shared_weak_count *v22;
  objc_super v23;
  mlcore::LibraryView *v24;
  std::__shared_weak_count *v25;

  var0 = a3.var0;
  v6 = a3.var1;
  v7 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
  v24 = *(mlcore::LibraryView **)var0;
  v25 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  v23.receiver = self;
  v23.super_class = (Class)MPModelPlaylistKind;
  -[MPModelKind applyToView:withContext:](&v23, sel_applyToView_withContext_, &v24, v6);
  v10 = v25;
  if (v25)
  {
    v11 = (unint64_t *)&v25->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  if ((-[MPModelPlaylistKind options](self, "options") & 4) != 0)
  {
    mlcore::LibraryView::filters(*(mlcore::LibraryView **)var0);
    mlcore::LibraryView::setFilters(*(mlcore::LibraryView **)var0);
  }
  -[MPModelPlaylistKind playlistEntryKind](self, "playlistEntryKind");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
  v21 = *(mlcore::LibraryView **)var0;
  v22 = v15;
  if (v15)
  {
    v16 = (unint64_t *)&v15->__shared_owners_;
    do
      v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
  }
  objc_msgSend(v13, "applyToView:withContext:", &v21, v6);
  v18 = v22;
  if (v22)
  {
    v19 = (unint64_t *)&v22->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }

}

- (shared_ptr<mlcore::Predicate>)predicateWithBaseProperty:(void *)a3
{
  ModelPropertyBase *IsSmart;
  mlcore *v6;
  ModelPropertyBase *IsFavoritedSongs;
  unint64_t *v8;
  unint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  _OWORD *v12;
  char v13;
  uint64_t v14;
  char v15;
  __int128 v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t i;
  mlcore *v20;
  unint64_t *v21;
  unint64_t v22;
  ModelPropertyBase *IsFolder;
  mlcore *v24;
  ModelPropertyBase *IsGenius;
  mlcore *v26;
  ModelPropertyBase *IsSubscribedAndNotPersonalMix;
  mlcore *v28;
  ModelPropertyBase *IsCuratorOwned;
  mlcore *v30;
  ModelPropertyBase *IsPersonalMix;
  mlcore *v32;
  ModelPropertyBase *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  _QWORD *v42;
  _QWORD *v43;
  char *v44;
  __int128 v45;
  int64x2_t v46;
  _OWORD *v47;
  char *v48;
  std::__shared_weak_count *v49;
  unint64_t *v50;
  unint64_t v51;
  uint64_t j;
  std::__shared_weak_count *v53;
  unint64_t *v54;
  unint64_t v55;
  std::__shared_weak_count *v56;
  unint64_t *v57;
  unint64_t v58;
  std::__shared_weak_count *v59;
  unint64_t *v60;
  unint64_t v61;
  std::__shared_weak_count *v62;
  unint64_t *v63;
  unint64_t v64;
  std::__shared_weak_count *v65;
  unint64_t *v66;
  unint64_t v67;
  std::__shared_weak_count *v68;
  unint64_t *v69;
  unint64_t v70;
  mlcore *v71;
  ModelPropertyBase *v72;
  __int128 v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  unint64_t v78;
  char *v79;
  uint64_t v80;
  char *v81;
  _QWORD *v82;
  _QWORD *v83;
  char *v84;
  __int128 v85;
  int64x2_t v86;
  _OWORD *v87;
  char *v88;
  std::__shared_weak_count *v89;
  unint64_t *v90;
  unint64_t v91;
  std::__shared_weak_count *v92;
  unint64_t *v93;
  unint64_t v94;
  mlcore *v95;
  ModelPropertyBase *IsTracklistUserEditable;
  __int128 v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  unint64_t v102;
  char *v103;
  uint64_t v104;
  char *v105;
  _QWORD *v106;
  _QWORD *v107;
  char *v108;
  __int128 v109;
  int64x2_t v110;
  _OWORD *v111;
  char *v112;
  std::__shared_weak_count *v113;
  unint64_t *v114;
  unint64_t v115;
  std::__shared_weak_count *v116;
  unint64_t *v117;
  unint64_t v118;
  std::__shared_weak_count *v119;
  unint64_t *v120;
  unint64_t v121;
  std::__shared_weak_count *v122;
  unint64_t *v123;
  unint64_t v124;
  std::__shared_weak_count *v125;
  unint64_t *v126;
  unint64_t v127;
  Predicate *v128;
  __shared_weak_count *v129;
  _QWORD v130[3];
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  uint64_t *v137[3];
  __int128 v138;
  _OWORD *v139;
  _OWORD *v140;
  _OWORD *v141;
  uint64_t v142;
  std::__shared_weak_count *v143;
  uint64_t v144;
  std::__shared_weak_count *v145;
  __int128 v146;
  int64x2_t v147;
  char *v148;
  void **v149;
  int64x2_t v150;
  char *v151;
  char **v152;
  __int128 v153;
  uint64_t v154;
  uint64_t v155;
  __int128 v156;
  uint64_t v157;
  __int128 v158;
  uint64_t v159;
  __int128 v160;
  uint64_t v161;
  __int128 v162;
  uint64_t v163;
  __int128 v164;
  uint64_t v165;
  __int128 v166;
  uint64_t v167;
  shared_ptr<mlcore::Predicate> result;

  v167 = *MEMORY[0x1E0C80C00];
  v147 = 0uLL;
  v148 = 0;
  IsSmart = (ModelPropertyBase *)mlcore::PlaylistPropertyIsSmart((mlcore *)self);
  if (a3)
    MPMediaLibraryGetProperty((ModelPropertyBase *)a3, IsSmart);
  v6 = (mlcore *)std::allocate_shared[abi:ne180100]<mlcore::UnaryPredicate<int>,std::allocator<mlcore::UnaryPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::UnaryOperator,void>((uint64_t *)&v146);
  IsFavoritedSongs = (ModelPropertyBase *)mlcore::PlaylistPropertyIsFavoritedSongs(v6);
  if (a3)
    MPMediaLibraryGetProperty((ModelPropertyBase *)a3, IsFavoritedSongs);
  std::allocate_shared[abi:ne180100]<mlcore::UnaryPredicate<int>,std::allocator<mlcore::UnaryPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::UnaryOperator,void>(&v144);
  v153 = v146;
  if (*((_QWORD *)&v146 + 1))
  {
    v8 = (unint64_t *)(*((_QWORD *)&v146 + 1) + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  v154 = v144;
  v155 = (uint64_t)v145;
  if (v145)
  {
    p_shared_owners = (unint64_t *)&v145->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  v139 = 0;
  v140 = 0;
  v141 = 0;
  v149 = (void **)&v139;
  v150.i8[0] = 0;
  v12 = operator new(0x20uLL);
  v13 = 0;
  v14 = 0;
  v139 = v12;
  v140 = v12;
  v141 = v12 + 2;
  do
  {
    v15 = v13;
    v16 = *(&v153 + v14);
    *v12 = v16;
    if (*((_QWORD *)&v16 + 1))
    {
      v17 = (unint64_t *)(*((_QWORD *)&v16 + 1) + 8);
      do
        v18 = __ldxr(v17);
      while (__stxr(v18 + 1, v17));
    }
    ++v12;
    v13 = 1;
    v14 = 1;
  }
  while ((v15 & 1) == 0);
  v140 = v12;
  mlcore::CreateOrPredicate();
  v149 = (void **)&v139;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v149);
  for (i = 16; i != -16; i -= 16)
    v20 = (mlcore *)std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&v153 + i);
  *(_QWORD *)&v153 = 2;
  *((_QWORD *)&v153 + 1) = v142;
  v154 = (uint64_t)v143;
  if (v143)
  {
    v21 = (unint64_t *)&v143->__shared_owners_;
    do
      v22 = __ldxr(v21);
    while (__stxr(v22 + 1, v21));
  }
  IsFolder = (ModelPropertyBase *)mlcore::PlaylistPropertySmartIsFolder(v20);
  if (a3)
    MPMediaLibraryGetProperty((ModelPropertyBase *)a3, IsFolder);
  v24 = (mlcore *)std::allocate_shared[abi:ne180100]<mlcore::UnaryPredicate<int>,std::allocator<mlcore::UnaryPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::UnaryOperator,void>((uint64_t *)&v136);
  v155 = 8;
  v156 = v136;
  v136 = 0uLL;
  IsGenius = (ModelPropertyBase *)mlcore::PlaylistPropertySmartIsGenius(v24);
  if (a3)
    MPMediaLibraryGetProperty((ModelPropertyBase *)a3, IsGenius);
  v26 = (mlcore *)std::allocate_shared[abi:ne180100]<mlcore::UnaryPredicate<int>,std::allocator<mlcore::UnaryPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::UnaryOperator,void>((uint64_t *)&v135);
  v157 = 4;
  v158 = v135;
  v135 = 0uLL;
  IsSubscribedAndNotPersonalMix = (ModelPropertyBase *)mlcore::PlaylistPropertyIsSubscribedAndNotPersonalMix(v26);
  if (a3)
    MPMediaLibraryGetProperty((ModelPropertyBase *)a3, IsSubscribedAndNotPersonalMix);
  v28 = (mlcore *)std::allocate_shared[abi:ne180100]<mlcore::UnaryPredicate<int>,std::allocator<mlcore::UnaryPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::UnaryOperator,void>((uint64_t *)&v134);
  v159 = 16;
  v160 = v134;
  v134 = 0uLL;
  IsCuratorOwned = (ModelPropertyBase *)mlcore::PlaylistPropertyIsCuratorOwned(v28);
  if (a3)
    MPMediaLibraryGetProperty((ModelPropertyBase *)a3, IsCuratorOwned);
  v30 = (mlcore *)std::allocate_shared[abi:ne180100]<mlcore::UnaryPredicate<int>,std::allocator<mlcore::UnaryPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::UnaryOperator,void>((uint64_t *)&v133);
  v161 = 32;
  v162 = v133;
  v133 = 0uLL;
  IsPersonalMix = (ModelPropertyBase *)mlcore::PlaylistCategoryTypeIsPersonalMix(v30);
  if (a3)
    MPMediaLibraryGetProperty((ModelPropertyBase *)a3, IsPersonalMix);
  v32 = (mlcore *)std::allocate_shared[abi:ne180100]<mlcore::UnaryPredicate<int>,std::allocator<mlcore::UnaryPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::UnaryOperator,void>((uint64_t *)&v132);
  v163 = 64;
  v164 = v132;
  v132 = 0uLL;
  v33 = (ModelPropertyBase *)mlcore::PlaylistPropertyIsFavoritedSongs(v32);
  if (a3)
    MPMediaLibraryGetProperty((ModelPropertyBase *)a3, v33);
  std::allocate_shared[abi:ne180100]<mlcore::UnaryPredicate<int>,std::allocator<mlcore::UnaryPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::UnaryOperator,void>((uint64_t *)&v131);
  v165 = 128;
  v166 = v131;
  v131 = 0uLL;
  std::map<unsigned long,std::shared_ptr<mlcore::Predicate>>::map[abi:ne180100](v137, (unint64_t *)&v153, 7);
  _MPMLPredicateForVariants((uint64_t)&v138, v137, 1, -[MPModelPlaylistKind variants](self, "variants"));
  v34 = v147.i64[1];
  if (v147.i64[1] >= (unint64_t)v148)
  {
    v35 = (v147.i64[1] - v147.i64[0]) >> 4;
    v36 = v35 + 1;
    if ((unint64_t)(v35 + 1) >> 60)
      std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
    v37 = (uint64_t)&v148[-v147.i64[0]];
    if ((uint64_t)&v148[-v147.i64[0]] >> 3 > v36)
      v36 = v37 >> 3;
    if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFF0)
      v38 = 0xFFFFFFFFFFFFFFFLL;
    else
      v38 = v36;
    v152 = &v148;
    v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v38);
    v41 = &v39[16 * v35];
    *(_OWORD *)v41 = v138;
    v138 = 0uLL;
    v42 = (_QWORD *)v147.i64[1];
    v43 = (_QWORD *)v147.i64[0];
    if (v147.i64[1] == v147.i64[0])
    {
      v46 = vdupq_n_s64(v147.u64[1]);
      v44 = &v39[16 * v35];
    }
    else
    {
      v44 = &v39[16 * v35];
      do
      {
        v45 = *((_OWORD *)v42 - 1);
        v42 -= 2;
        *((_OWORD *)v44 - 1) = v45;
        v44 -= 16;
        *v42 = 0;
        v42[1] = 0;
      }
      while (v42 != v43);
      v46 = v147;
    }
    v47 = v41 + 16;
    v147.i64[0] = (uint64_t)v44;
    v147.i64[1] = (uint64_t)(v41 + 16);
    v150 = v46;
    v48 = v148;
    v148 = &v39[16 * v40];
    v151 = v48;
    v149 = (void **)v46.i64[0];
    std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v149);
    v49 = (std::__shared_weak_count *)*((_QWORD *)&v138 + 1);
    v147.i64[1] = (uint64_t)v47;
    if (*((_QWORD *)&v138 + 1))
    {
      v50 = (unint64_t *)(*((_QWORD *)&v138 + 1) + 8);
      do
        v51 = __ldaxr(v50);
      while (__stlxr(v51 - 1, v50));
      if (!v51)
      {
        ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
        std::__shared_weak_count::__release_weak(v49);
      }
    }
  }
  else
  {
    *(_OWORD *)v147.i64[1] = v138;
    v138 = 0uLL;
    v147.i64[1] = v34 + 16;
  }
  std::__tree<std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>,std::__map_value_compare<long long,std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>,std::less<long long>,true>,std::allocator<std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>>>::destroy(v137[1]);
  for (j = 152; j != -16; j -= 24)
    std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&v153 + j);
  v53 = (std::__shared_weak_count *)*((_QWORD *)&v131 + 1);
  if (*((_QWORD *)&v131 + 1))
  {
    v54 = (unint64_t *)(*((_QWORD *)&v131 + 1) + 8);
    do
      v55 = __ldaxr(v54);
    while (__stlxr(v55 - 1, v54));
    if (!v55)
    {
      ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
      std::__shared_weak_count::__release_weak(v53);
    }
  }
  v56 = (std::__shared_weak_count *)*((_QWORD *)&v132 + 1);
  if (*((_QWORD *)&v132 + 1))
  {
    v57 = (unint64_t *)(*((_QWORD *)&v132 + 1) + 8);
    do
      v58 = __ldaxr(v57);
    while (__stlxr(v58 - 1, v57));
    if (!v58)
    {
      ((void (*)(std::__shared_weak_count *))v56->__on_zero_shared)(v56);
      std::__shared_weak_count::__release_weak(v56);
    }
  }
  v59 = (std::__shared_weak_count *)*((_QWORD *)&v133 + 1);
  if (*((_QWORD *)&v133 + 1))
  {
    v60 = (unint64_t *)(*((_QWORD *)&v133 + 1) + 8);
    do
      v61 = __ldaxr(v60);
    while (__stlxr(v61 - 1, v60));
    if (!v61)
    {
      ((void (*)(std::__shared_weak_count *))v59->__on_zero_shared)(v59);
      std::__shared_weak_count::__release_weak(v59);
    }
  }
  v62 = (std::__shared_weak_count *)*((_QWORD *)&v134 + 1);
  if (*((_QWORD *)&v134 + 1))
  {
    v63 = (unint64_t *)(*((_QWORD *)&v134 + 1) + 8);
    do
      v64 = __ldaxr(v63);
    while (__stlxr(v64 - 1, v63));
    if (!v64)
    {
      ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
      std::__shared_weak_count::__release_weak(v62);
    }
  }
  v65 = (std::__shared_weak_count *)*((_QWORD *)&v135 + 1);
  if (*((_QWORD *)&v135 + 1))
  {
    v66 = (unint64_t *)(*((_QWORD *)&v135 + 1) + 8);
    do
      v67 = __ldaxr(v66);
    while (__stlxr(v67 - 1, v66));
    if (!v67)
    {
      ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
      std::__shared_weak_count::__release_weak(v65);
    }
  }
  v68 = (std::__shared_weak_count *)*((_QWORD *)&v136 + 1);
  if (*((_QWORD *)&v136 + 1))
  {
    v69 = (unint64_t *)(*((_QWORD *)&v136 + 1) + 8);
    do
      v70 = __ldaxr(v69);
    while (__stlxr(v70 - 1, v69));
    if (!v70)
    {
      ((void (*)(std::__shared_weak_count *))v68->__on_zero_shared)(v68);
      std::__shared_weak_count::__release_weak(v68);
    }
  }
  v71 = -[MPModelPlaylistKind options](self, "options");
  if ((v71 & 1) != 0)
  {
    v72 = (ModelPropertyBase *)mlcore::PlaylistPropertyDatePlayedLocal(v71);
    if (a3)
      MPMediaLibraryGetProperty((ModelPropertyBase *)a3, v72);
    *(_QWORD *)&v136 = 0;
    std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<long long>,std::allocator<mlcore::ComparisonPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::ComparisonOperator &,long long const&,mlcore::ComparisonOptions &,void>((uint64_t *)&v138);
    v73 = v138;
    v153 = v138;
    v138 = 0uLL;
    v74 = v147.i64[1];
    if (v147.i64[1] >= (unint64_t)v148)
    {
      v75 = (v147.i64[1] - v147.i64[0]) >> 4;
      v76 = v75 + 1;
      if ((unint64_t)(v75 + 1) >> 60)
        std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
      v77 = (uint64_t)&v148[-v147.i64[0]];
      if ((uint64_t)&v148[-v147.i64[0]] >> 3 > v76)
        v76 = v77 >> 3;
      if ((unint64_t)v77 >= 0x7FFFFFFFFFFFFFF0)
        v78 = 0xFFFFFFFFFFFFFFFLL;
      else
        v78 = v76;
      v152 = &v148;
      v79 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v78);
      v81 = &v79[16 * v75];
      *(_OWORD *)v81 = v153;
      v153 = 0uLL;
      v82 = (_QWORD *)v147.i64[1];
      v83 = (_QWORD *)v147.i64[0];
      if (v147.i64[1] == v147.i64[0])
      {
        v86 = vdupq_n_s64(v147.u64[1]);
        v84 = &v79[16 * v75];
      }
      else
      {
        v84 = &v79[16 * v75];
        do
        {
          v85 = *((_OWORD *)v82 - 1);
          v82 -= 2;
          *((_OWORD *)v84 - 1) = v85;
          v84 -= 16;
          *v82 = 0;
          v82[1] = 0;
        }
        while (v82 != v83);
        v86 = v147;
      }
      v87 = v81 + 16;
      v147.i64[0] = (uint64_t)v84;
      v147.i64[1] = (uint64_t)(v81 + 16);
      v150 = v86;
      v88 = v148;
      v148 = &v79[16 * v80];
      v151 = v88;
      v149 = (void **)v86.i64[0];
      std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v149);
      v89 = (std::__shared_weak_count *)*((_QWORD *)&v153 + 1);
      v147.i64[1] = (uint64_t)v87;
      if (*((_QWORD *)&v153 + 1))
      {
        v90 = (unint64_t *)(*((_QWORD *)&v153 + 1) + 8);
        do
          v91 = __ldaxr(v90);
        while (__stlxr(v91 - 1, v90));
        if (!v91)
        {
          ((void (*)(std::__shared_weak_count *))v89->__on_zero_shared)(v89);
          std::__shared_weak_count::__release_weak(v89);
        }
      }
    }
    else
    {
      *(_QWORD *)v147.i64[1] = v73;
      *(_QWORD *)(v74 + 8) = *((_QWORD *)&v73 + 1);
      v153 = 0uLL;
      v147.i64[1] = v74 + 16;
    }
    v92 = (std::__shared_weak_count *)*((_QWORD *)&v138 + 1);
    if (*((_QWORD *)&v138 + 1))
    {
      v93 = (unint64_t *)(*((_QWORD *)&v138 + 1) + 8);
      do
        v94 = __ldaxr(v93);
      while (__stlxr(v94 - 1, v93));
      if (!v94)
      {
        ((void (*)(std::__shared_weak_count *))v92->__on_zero_shared)(v92);
        std::__shared_weak_count::__release_weak(v92);
      }
    }
  }
  v95 = -[MPModelPlaylistKind options](self, "options");
  if ((v95 & 2) != 0)
  {
    IsTracklistUserEditable = (ModelPropertyBase *)mlcore::PlaylistPropertyIsTracklistUserEditable(v95);
    if (a3)
      MPMediaLibraryGetProperty((ModelPropertyBase *)a3, IsTracklistUserEditable);
    std::allocate_shared[abi:ne180100]<mlcore::UnaryPredicate<int>,std::allocator<mlcore::UnaryPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::UnaryOperator,void>((uint64_t *)&v138);
    v97 = v138;
    v153 = v138;
    v138 = 0uLL;
    v98 = v147.i64[1];
    if (v147.i64[1] >= (unint64_t)v148)
    {
      v99 = (v147.i64[1] - v147.i64[0]) >> 4;
      v100 = v99 + 1;
      if ((unint64_t)(v99 + 1) >> 60)
        std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
      v101 = (uint64_t)&v148[-v147.i64[0]];
      if ((uint64_t)&v148[-v147.i64[0]] >> 3 > v100)
        v100 = v101 >> 3;
      if ((unint64_t)v101 >= 0x7FFFFFFFFFFFFFF0)
        v102 = 0xFFFFFFFFFFFFFFFLL;
      else
        v102 = v100;
      v152 = &v148;
      v103 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v102);
      v105 = &v103[16 * v99];
      *(_OWORD *)v105 = v153;
      v153 = 0uLL;
      v106 = (_QWORD *)v147.i64[1];
      v107 = (_QWORD *)v147.i64[0];
      if (v147.i64[1] == v147.i64[0])
      {
        v110 = vdupq_n_s64(v147.u64[1]);
        v108 = &v103[16 * v99];
      }
      else
      {
        v108 = &v103[16 * v99];
        do
        {
          v109 = *((_OWORD *)v106 - 1);
          v106 -= 2;
          *((_OWORD *)v108 - 1) = v109;
          v108 -= 16;
          *v106 = 0;
          v106[1] = 0;
        }
        while (v106 != v107);
        v110 = v147;
      }
      v111 = v105 + 16;
      v147.i64[0] = (uint64_t)v108;
      v147.i64[1] = (uint64_t)(v105 + 16);
      v150 = v110;
      v112 = v148;
      v148 = &v103[16 * v104];
      v151 = v112;
      v149 = (void **)v110.i64[0];
      std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v149);
      v113 = (std::__shared_weak_count *)*((_QWORD *)&v153 + 1);
      v147.i64[1] = (uint64_t)v111;
      if (*((_QWORD *)&v153 + 1))
      {
        v114 = (unint64_t *)(*((_QWORD *)&v153 + 1) + 8);
        do
          v115 = __ldaxr(v114);
        while (__stlxr(v115 - 1, v114));
        if (!v115)
        {
          ((void (*)(std::__shared_weak_count *))v113->__on_zero_shared)(v113);
          std::__shared_weak_count::__release_weak(v113);
        }
      }
    }
    else
    {
      *(_QWORD *)v147.i64[1] = v97;
      *(_QWORD *)(v98 + 8) = *((_QWORD *)&v97 + 1);
      v153 = 0uLL;
      v147.i64[1] = v98 + 16;
    }
    v116 = (std::__shared_weak_count *)*((_QWORD *)&v138 + 1);
    if (*((_QWORD *)&v138 + 1))
    {
      v117 = (unint64_t *)(*((_QWORD *)&v138 + 1) + 8);
      do
        v118 = __ldaxr(v117);
      while (__stlxr(v118 - 1, v117));
      if (!v118)
      {
        ((void (*)(std::__shared_weak_count *))v116->__on_zero_shared)(v116);
        std::__shared_weak_count::__release_weak(v116);
      }
    }
  }
  memset(v130, 0, sizeof(v130));
  std::vector<std::shared_ptr<mlcore::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<mlcore::Predicate>*,std::shared_ptr<mlcore::Predicate>*>(v130, v147.i64[0], (_QWORD *)v147.i64[1], (v147.i64[1] - v147.i64[0]) >> 4);
  mlcore::CreateAndPredicate();
  *(_QWORD *)&v153 = v130;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v153);
  v119 = v143;
  if (v143)
  {
    v120 = (unint64_t *)&v143->__shared_owners_;
    do
      v121 = __ldaxr(v120);
    while (__stlxr(v121 - 1, v120));
    if (!v121)
    {
      ((void (*)(std::__shared_weak_count *))v119->__on_zero_shared)(v119);
      std::__shared_weak_count::__release_weak(v119);
    }
  }
  v122 = v145;
  if (v145)
  {
    v123 = (unint64_t *)&v145->__shared_owners_;
    do
      v124 = __ldaxr(v123);
    while (__stlxr(v124 - 1, v123));
    if (!v124)
    {
      ((void (*)(std::__shared_weak_count *))v122->__on_zero_shared)(v122);
      std::__shared_weak_count::__release_weak(v122);
    }
  }
  v125 = (std::__shared_weak_count *)*((_QWORD *)&v146 + 1);
  if (*((_QWORD *)&v146 + 1))
  {
    v126 = (unint64_t *)(*((_QWORD *)&v146 + 1) + 8);
    do
      v127 = __ldaxr(v126);
    while (__stlxr(v127 - 1, v126));
    if (!v127)
    {
      ((void (*)(std::__shared_weak_count *))v125->__on_zero_shared)(v125);
      std::__shared_weak_count::__release_weak(v125);
    }
  }
  *(_QWORD *)&v153 = &v147;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v153);
  result.var1 = v129;
  result.var0 = v128;
  return result;
}

- (unint64_t)options
{
  return self->_options;
}

- (unint64_t)variants
{
  return self->_variants;
}

- (MPModelPlaylistEntryKind)playlistEntryKind
{
  return self->_playlistEntryKind;
}

- (id)humanDescription
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t variants;
  void *v7;
  unint64_t options;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("playlists"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  variants = self->_variants;
  if ((variants & 2) != 0)
  {
    objc_msgSend(v4, "addObject:", CFSTR("smart"));
    variants = self->_variants;
    if ((variants & 4) == 0)
    {
LABEL_3:
      if ((variants & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((variants & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v5, "addObject:", CFSTR("genius"));
  variants = self->_variants;
  if ((variants & 0x10) == 0)
  {
LABEL_4:
    if ((variants & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v5, "addObject:", CFSTR("subscribed"));
  variants = self->_variants;
  if ((variants & 0x20) == 0)
  {
LABEL_5:
    if ((variants & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v5, "addObject:", CFSTR("administered"));
  variants = self->_variants;
  if ((variants & 0x40) == 0)
  {
LABEL_6:
    if ((variants & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_21:
  objc_msgSend(v5, "addObject:", CFSTR("personal mix"));
  if ((self->_variants & 0x80) != 0)
LABEL_7:
    objc_msgSend(v5, "addObject:", CFSTR("favorite songs"));
LABEL_8:
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v3, "insertString:atIndex:", CFSTR(" "), 0);
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(" or "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "insertString:atIndex:", v7, 0);

  }
  if ((self->_variants & 8) != 0)
    objc_msgSend(v3, "appendString:", CFSTR(" or folders"));
  options = self->_options;
  if ((options & 1) == 0)
  {
    if ((options & 2) == 0)
      goto LABEL_14;
LABEL_24:
    objc_msgSend(v3, "insertString:atIndex:", CFSTR("mutable "), 0);
    if ((self->_options & 4) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
  objc_msgSend(v3, "insertString:atIndex:", CFSTR("previously played "), 0);
  options = self->_options;
  if ((options & 2) != 0)
    goto LABEL_24;
LABEL_14:
  if ((options & 4) != 0)
LABEL_15:
    objc_msgSend(v3, "insertString:atIndex:", CFSTR("non-empty "), 0);
LABEL_16:
  -[MPModelPlaylistEntryKind humanDescription](self->_playlistEntryKind, "humanDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" containing %@"), v9);

  return v3;
}

+ (id)kindWithVariants:(unint64_t)a3 playlistEntryKind:(id)a4 options:(unint64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  unint64_t v16;
  unint64_t v17;

  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Playlist:v%lu:o%lu:pe%p"), a3, a5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__MPModelPlaylistKind_kindWithVariants_playlistEntryKind_options___block_invoke;
  v14[3] = &unk_1E315D748;
  v15 = v8;
  v16 = a3;
  v17 = a5;
  v11 = v8;
  objc_msgSend(a1, "kindWithModelClass:cacheKey:block:", v10, v9, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPModelPlaylistKind;
  v3 = self->_variants ^ -[MPModelKind hash](&v5, sel_hash) ^ self->_options;
  return v3 ^ -[MPModelPlaylistEntryKind hash](self->_playlistEntryKind, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MPModelPlaylistKind;
  if (-[MPModelKind isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = self->_variants == v5[2]
      && -[MPModelPlaylistEntryKind isEqual:](self->_playlistEntryKind, "isEqual:", v5[3])
      && self->_options == v5[4];

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (MPModelPlaylistKind)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  MPModelPlaylistKind *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("variants"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("options"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("playlistEntryKind"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[MPModelPlaylistKind kindWithVariants:playlistEntryKind:options:](MPModelPlaylistKind, "kindWithVariants:playlistEntryKind:options:", v5, v7, v6);
    v8 = (MPModelPlaylistKind *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPModelPlaylistKind;
  v4 = a3;
  -[MPModelKind encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_variants, CFSTR("variants"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_playlistEntryKind, CFSTR("playlistEntryKind"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_options, CFSTR("options"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playlistEntryKind, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (shared_ptr<mlcore::Predicate>)representedSearchScopePredicate
{
  Predicate *v2;
  __shared_weak_count *v3;
  shared_ptr<mlcore::Predicate> result;

  v2 = (Predicate *)-[MPModelPlaylistKind predicateWithBaseProperty:](self, "predicateWithBaseProperty:", 0);
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

@end
