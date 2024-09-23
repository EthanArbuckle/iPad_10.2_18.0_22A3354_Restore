@implementation MPModelTVEpisodeKind

uint64_t __49__MPModelTVEpisodeKind_kindWithVariants_options___block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(a2 + 16) = *(_QWORD *)(result + 32);
  *(_QWORD *)(a2 + 24) = *(_QWORD *)(result + 40);
  return result;
}

- (shared_ptr<mlcore::Predicate>)predicateWithBaseProperty:(void *)a3
{
  _DWORD *v5;
  ModelPropertyBase *v6;
  mlcore *v7;
  __int128 v8;
  uint64_t v9;
  _OWORD *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  _QWORD *v17;
  _QWORD *v18;
  char *v19;
  __int128 v20;
  int64x2_t v21;
  uint64_t v22;
  ModelPropertyBase *IsMusicShow;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  _QWORD *v32;
  _QWORD *v33;
  char *v34;
  __int128 v35;
  int64x2_t v36;
  _OWORD *v37;
  uint64_t v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  mlcore *v48;
  _QWORD *v49;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  char *v55;
  uint64_t v56;
  char *v57;
  _QWORD *v58;
  _QWORD *v59;
  char *v60;
  __int128 v61;
  int64x2_t v62;
  uint64_t v63;
  Predicate *v64;
  __shared_weak_count *v65;
  __int128 v66;
  __int128 v67;
  int64x2_t v68;
  _QWORD v69[5];
  _QWORD v70[3];
  __int128 v71;
  uint64_t *v72[3];
  __int128 v73;
  void *__p;
  void *v75;
  _DWORD *v76;
  int64x2_t *v77;
  int64x2_t v78;
  uint64_t v79;
  _QWORD *v80;
  _BYTE v81[24];
  uint64_t v82;
  shared_ptr<mlcore::Predicate> result;

  v82 = *MEMORY[0x1E0C80C00];
  v68 = 0uLL;
  v69[0] = 0;
  __p = 0;
  v75 = 0;
  v76 = 0;
  v5 = -[MPModelTVEpisodeKind variants](self, "variants");
  if (v5)
  {
    v5 = operator new(4uLL);
    *v5 = 512;
    v75 = v5 + 1;
    v76 = v5 + 1;
    __p = v5;
  }
  v6 = (ModelPropertyBase *)mlcore::ItemPropertyMediaType((mlcore *)v5);
  if (a3)
    MPMediaLibraryGetProperty((ModelPropertyBase *)a3, v6);
  v7 = (mlcore *)std::allocate_shared[abi:ne180100]<mlcore::InPredicate<int>,std::allocator<mlcore::InPredicate<int>>,mlcore::ModelProperty<int> *&,std::vector<int> const&,void>((uint64_t *)&v73);
  v8 = v73;
  *(_OWORD *)v81 = v73;
  v73 = 0uLL;
  v9 = v68.i64[1];
  if (v68.i64[1] >= v69[0])
  {
    v66 = v8;
    v11 = (v68.i64[1] - v68.i64[0]) >> 4;
    if ((unint64_t)(v11 + 1) >> 60)
      std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
    v12 = (v69[0] - v68.i64[0]) >> 3;
    if (v12 <= v11 + 1)
      v12 = v11 + 1;
    if (v69[0] - v68.i64[0] >= 0x7FFFFFFFFFFFFFF0uLL)
      v13 = 0xFFFFFFFFFFFFFFFLL;
    else
      v13 = v12;
    v80 = v69;
    v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v13);
    v16 = &v14[16 * v11];
    *(_OWORD *)v16 = v66;
    *(_OWORD *)v81 = 0uLL;
    v17 = (_QWORD *)v68.i64[1];
    v18 = (_QWORD *)v68.i64[0];
    if (v68.i64[1] == v68.i64[0])
    {
      v21 = vdupq_n_s64(v68.u64[1]);
      v19 = &v14[16 * v11];
    }
    else
    {
      v19 = &v14[16 * v11];
      do
      {
        v20 = *((_OWORD *)v17 - 1);
        v17 -= 2;
        *((_OWORD *)v19 - 1) = v20;
        v19 -= 16;
        *v17 = 0;
        v17[1] = 0;
      }
      while (v17 != v18);
      v21 = v68;
    }
    v10 = v16 + 16;
    v68.i64[0] = (uint64_t)v19;
    v68.i64[1] = (uint64_t)(v16 + 16);
    v78 = v21;
    v22 = v69[0];
    v69[0] = &v14[16 * v15];
    v79 = v22;
    v77 = (int64x2_t *)v21.i64[0];
    v7 = (mlcore *)std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v77);
  }
  else
  {
    *(_OWORD *)v68.i64[1] = v8;
    v10 = (_OWORD *)(v9 + 16);
    *(_OWORD *)v81 = 0uLL;
  }
  v68.i64[1] = (uint64_t)v10;
  IsMusicShow = (ModelPropertyBase *)mlcore::ItemPropertyIsMusicShow(v7);
  if (a3)
    MPMediaLibraryGetProperty((ModelPropertyBase *)a3, IsMusicShow);
  std::allocate_shared[abi:ne180100]<mlcore::UnaryPredicate<long long>,std::allocator<mlcore::UnaryPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::UnaryOperator,void>((uint64_t *)&v71);
  *(_QWORD *)v81 = 2;
  *(_OWORD *)&v81[8] = v71;
  v71 = 0uLL;
  std::map<unsigned long,std::shared_ptr<mlcore::Predicate>>::map[abi:ne180100](v72, (unint64_t *)v81, 1);
  _MPMLPredicateForVariants((uint64_t)&v73, v72, 1, -[MPModelTVEpisodeKind variants](self, "variants"));
  v24 = v68.i64[1];
  if (v68.i64[1] >= v69[0])
  {
    v25 = (v68.i64[1] - v68.i64[0]) >> 4;
    v26 = v25 + 1;
    if ((unint64_t)(v25 + 1) >> 60)
      std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
    v27 = v69[0] - v68.i64[0];
    if ((v69[0] - v68.i64[0]) >> 3 > v26)
      v26 = v27 >> 3;
    if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF0)
      v28 = 0xFFFFFFFFFFFFFFFLL;
    else
      v28 = v26;
    v80 = v69;
    v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v28);
    v31 = &v29[16 * v25];
    *(_OWORD *)v31 = v73;
    v73 = 0uLL;
    v32 = (_QWORD *)v68.i64[1];
    v33 = (_QWORD *)v68.i64[0];
    if (v68.i64[1] == v68.i64[0])
    {
      v36 = vdupq_n_s64(v68.u64[1]);
      v34 = &v29[16 * v25];
    }
    else
    {
      v34 = &v29[16 * v25];
      do
      {
        v35 = *((_OWORD *)v32 - 1);
        v32 -= 2;
        *((_OWORD *)v34 - 1) = v35;
        v34 -= 16;
        *v32 = 0;
        v32[1] = 0;
      }
      while (v32 != v33);
      v36 = v68;
    }
    v37 = v31 + 16;
    v68.i64[0] = (uint64_t)v34;
    v78 = v36;
    v38 = v69[0];
    v69[0] = &v29[16 * v30];
    v79 = v38;
    v77 = (int64x2_t *)v36.i64[0];
    std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v77);
    v39 = (std::__shared_weak_count *)*((_QWORD *)&v73 + 1);
    v68.i64[1] = (uint64_t)v37;
    if (*((_QWORD *)&v73 + 1))
    {
      v40 = (unint64_t *)(*((_QWORD *)&v73 + 1) + 8);
      do
        v41 = __ldaxr(v40);
      while (__stlxr(v41 - 1, v40));
      if (!v41)
      {
        ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
        std::__shared_weak_count::__release_weak(v39);
      }
    }
  }
  else
  {
    *(_OWORD *)v68.i64[1] = v73;
    v73 = 0uLL;
    v68.i64[1] = v24 + 16;
  }
  std::__tree<std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>,std::__map_value_compare<long long,std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>,std::less<long long>,true>,std::allocator<std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>>>::destroy(v72[1]);
  v42 = *(std::__shared_weak_count **)&v81[16];
  if (*(_QWORD *)&v81[16])
  {
    v43 = (unint64_t *)(*(_QWORD *)&v81[16] + 8);
    do
      v44 = __ldaxr(v43);
    while (__stlxr(v44 - 1, v43));
    if (!v44)
    {
      ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
      std::__shared_weak_count::__release_weak(v42);
    }
  }
  v45 = (std::__shared_weak_count *)*((_QWORD *)&v71 + 1);
  if (*((_QWORD *)&v71 + 1))
  {
    v46 = (unint64_t *)(*((_QWORD *)&v71 + 1) + 8);
    do
      v47 = __ldaxr(v46);
    while (__stlxr(v47 - 1, v46));
    if (!v47)
    {
      ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
      std::__shared_weak_count::__release_weak(v45);
    }
  }
  v48 = -[MPModelTVEpisodeKind options](self, "options", v66);
  if ((v48 & 1) != 0)
  {
    mlcore::ItemPropertyExcludeFromShuffle(v48);
    std::allocate_shared[abi:ne180100]<mlcore::UnaryPredicate<int>,std::allocator<mlcore::UnaryPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::UnaryOperator,void>((uint64_t *)&v73);
    v50 = v73;
    *(_OWORD *)v81 = v73;
    v73 = 0uLL;
    v51 = v68.i64[1];
    if (v68.i64[1] >= v69[0])
    {
      v67 = v50;
      v52 = (v68.i64[1] - v68.i64[0]) >> 4;
      if ((unint64_t)(v52 + 1) >> 60)
        std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
      v53 = (v69[0] - v68.i64[0]) >> 3;
      if (v53 <= v52 + 1)
        v53 = v52 + 1;
      if (v69[0] - v68.i64[0] >= 0x7FFFFFFFFFFFFFF0uLL)
        v54 = 0xFFFFFFFFFFFFFFFLL;
      else
        v54 = v53;
      v80 = v69;
      v55 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v54);
      v57 = &v55[16 * v52];
      *(_OWORD *)v57 = v67;
      *(_OWORD *)v81 = 0uLL;
      v58 = (_QWORD *)v68.i64[1];
      v59 = (_QWORD *)v68.i64[0];
      if (v68.i64[1] == v68.i64[0])
      {
        v62 = vdupq_n_s64(v68.u64[1]);
        v60 = &v55[16 * v52];
      }
      else
      {
        v60 = &v55[16 * v52];
        do
        {
          v61 = *((_OWORD *)v58 - 1);
          v58 -= 2;
          *((_OWORD *)v60 - 1) = v61;
          v60 -= 16;
          *v58 = 0;
          v58[1] = 0;
        }
        while (v58 != v59);
        v62 = v68;
      }
      v49 = v57 + 16;
      v68.i64[0] = (uint64_t)v60;
      v68.i64[1] = (uint64_t)(v57 + 16);
      v78 = v62;
      v63 = v69[0];
      v69[0] = &v55[16 * v56];
      v79 = v63;
      v77 = (int64x2_t *)v62.i64[0];
      std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v77);
    }
    else
    {
      *(_OWORD *)v68.i64[1] = v50;
      v49 = (_QWORD *)(v51 + 16);
      *(_OWORD *)v81 = 0uLL;
    }
    v68.i64[1] = (uint64_t)v49;
  }
  else
  {
    v49 = (_QWORD *)v68.i64[1];
  }
  memset(v70, 0, sizeof(v70));
  std::vector<std::shared_ptr<mlcore::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<mlcore::Predicate>*,std::shared_ptr<mlcore::Predicate>*>(v70, v68.i64[0], v49, ((uint64_t)v49 - v68.i64[0]) >> 4);
  mlcore::CreateAndPredicate();
  v77 = (int64x2_t *)v70;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v77);
  if (__p)
  {
    v75 = __p;
    operator delete(__p);
  }
  v77 = &v68;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v77);
  result.var1 = v65;
  result.var0 = v64;
  return result;
}

- (unint64_t)variants
{
  return self->_variants;
}

- (unint64_t)options
{
  return self->_options;
}

- (id)humanDescription
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t variants;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  variants = self->_variants;
  if ((variants & 1) != 0)
  {
    objc_msgSend(v4, "addObject:", CFSTR("episodes"));
    variants = self->_variants;
  }
  if ((variants & 2) != 0)
    objc_msgSend(v5, "addObject:", CFSTR("Apple Music episodes"));
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(" or "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v7);

  if ((self->_options & 1) != 0)
    objc_msgSend(v3, "insertString:atIndex:", CFSTR("shuffleable "), 0);

  return v3;
}

+ (id)kindWithVariants:(unint64_t)a3 options:(unint64_t)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[6];

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TVEpisode:v%lu:o%lu"), a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__MPModelTVEpisodeKind_kindWithVariants_options___block_invoke;
  v11[3] = &__block_descriptor_48_e30_v16__0__MPModelTVEpisodeKind_8l;
  v11[4] = a3;
  v11[5] = a4;
  objc_msgSend(a1, "kindWithModelClass:cacheKey:block:", v8, v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)identityKind
{
  return +[MPModelKind kindWithModelClass:](MPModelKind, "kindWithModelClass:", objc_opt_class());
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPModelTVEpisodeKind;
  return self->_variants ^ -[MPModelKind hash](&v3, sel_hash) ^ self->_options;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MPModelTVEpisodeKind;
  v5 = -[MPModelKind isEqual:](&v7, sel_isEqual_, v4) && self->_variants == v4[2] && self->_options == v4[3];

  return v5;
}

- (MPModelTVEpisodeKind)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  MPModelTVEpisodeKind *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("variants"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("options"));

  +[MPModelTVEpisodeKind kindWithVariants:options:](MPModelTVEpisodeKind, "kindWithVariants:options:", v5, v6);
  v7 = (MPModelTVEpisodeKind *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPModelTVEpisodeKind;
  v4 = a3;
  -[MPModelKind encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_variants, CFSTR("variants"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_options, CFSTR("options"));

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

  v2 = (Predicate *)-[MPModelTVEpisodeKind predicateWithBaseProperty:](self, "predicateWithBaseProperty:", 0);
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

@end
