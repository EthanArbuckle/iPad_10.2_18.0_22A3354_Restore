@implementation MPModelMovieKind

uint64_t __45__MPModelMovieKind_kindWithVariants_options___block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(a2 + 16) = *(_QWORD *)(result + 32);
  *(_QWORD *)(a2 + 24) = *(_QWORD *)(result + 40);
  return result;
}

- (shared_ptr<mlcore::Predicate>)predicateWithBaseProperty:(void *)a3
{
  _DWORD *v5;
  ModelPropertyBase *v6;
  __int128 v7;
  uint64_t v8;
  _OWORD *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  _QWORD *v16;
  _QWORD *v17;
  char *v18;
  __int128 v19;
  int64x2_t v20;
  uint64_t v21;
  uint64_t v22;
  ModelPropertyBase *IsRental;
  __int128 v24;
  uint64_t v25;
  _OWORD *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  _QWORD *v33;
  _QWORD *v34;
  char *v35;
  __int128 v36;
  int64x2_t v37;
  uint64_t v38;
  ModelPropertyBase *IsMusicShow;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char *v45;
  uint64_t v46;
  char *v47;
  _QWORD *v48;
  _QWORD *v49;
  char *v50;
  __int128 v51;
  int64x2_t v52;
  _OWORD *v53;
  uint64_t v54;
  std::__shared_weak_count *v55;
  unint64_t *v56;
  unint64_t v57;
  std::__shared_weak_count *v58;
  unint64_t *v59;
  unint64_t v60;
  std::__shared_weak_count *v61;
  unint64_t *v62;
  unint64_t v63;
  mlcore *v64;
  _QWORD *v65;
  __int128 v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  char *v71;
  uint64_t v72;
  char *v73;
  _QWORD *v74;
  _QWORD *v75;
  char *v76;
  __int128 v77;
  int64x2_t v78;
  uint64_t v79;
  Predicate *v80;
  __shared_weak_count *v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  int64x2_t v85;
  _QWORD v86[5];
  _QWORD v87[3];
  __int128 v88;
  uint64_t *v89[3];
  __int128 v90;
  void *__p;
  void *v92;
  _DWORD *v93;
  int64x2_t *v94;
  int64x2_t v95;
  uint64_t v96;
  _QWORD *v97;
  _BYTE v98[24];
  uint64_t v99;
  shared_ptr<mlcore::Predicate> result;

  v99 = *MEMORY[0x1E0C80C00];
  v85 = 0uLL;
  v86[0] = 0;
  __p = 0;
  v92 = 0;
  v93 = 0;
  v5 = -[MPModelMovieKind variants](self, "variants");
  if (v5)
  {
    v5 = operator new(4uLL);
    *v5 = 2048;
    v92 = v5 + 1;
    v93 = v5 + 1;
    __p = v5;
  }
  v6 = (ModelPropertyBase *)mlcore::ItemPropertyMediaType((mlcore *)v5);
  if (a3)
    MPMediaLibraryGetProperty((ModelPropertyBase *)a3, v6);
  std::allocate_shared[abi:ne180100]<mlcore::InPredicate<int>,std::allocator<mlcore::InPredicate<int>>,mlcore::ModelProperty<int> *&,std::vector<int> const&,void>((uint64_t *)&v90);
  v7 = v90;
  *(_OWORD *)v98 = v90;
  v90 = 0uLL;
  v8 = v85.i64[1];
  if (v85.i64[1] >= v86[0])
  {
    v82 = v7;
    v10 = (v85.i64[1] - v85.i64[0]) >> 4;
    if ((unint64_t)(v10 + 1) >> 60)
      std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
    v11 = (v86[0] - v85.i64[0]) >> 3;
    if (v11 <= v10 + 1)
      v11 = v10 + 1;
    if (v86[0] - v85.i64[0] >= 0x7FFFFFFFFFFFFFF0uLL)
      v12 = 0xFFFFFFFFFFFFFFFLL;
    else
      v12 = v11;
    v97 = v86;
    v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v12);
    v15 = &v13[16 * v10];
    *(_OWORD *)v15 = v82;
    *(_OWORD *)v98 = 0uLL;
    v16 = (_QWORD *)v85.i64[1];
    v17 = (_QWORD *)v85.i64[0];
    if (v85.i64[1] == v85.i64[0])
    {
      v20 = vdupq_n_s64(v85.u64[1]);
      v18 = &v13[16 * v10];
    }
    else
    {
      v18 = &v13[16 * v10];
      do
      {
        v19 = *((_OWORD *)v16 - 1);
        v16 -= 2;
        *((_OWORD *)v18 - 1) = v19;
        v18 -= 16;
        *v16 = 0;
        v16[1] = 0;
      }
      while (v16 != v17);
      v20 = v85;
    }
    v9 = v15 + 16;
    v85.i64[0] = (uint64_t)v18;
    v85.i64[1] = (uint64_t)(v15 + 16);
    v95 = v20;
    v21 = v86[0];
    v86[0] = &v13[16 * v14];
    v96 = v21;
    v94 = (int64x2_t *)v20.i64[0];
    std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v94);
  }
  else
  {
    *(_OWORD *)v85.i64[1] = v7;
    v9 = (_OWORD *)(v8 + 16);
    *(_OWORD *)v98 = 0uLL;
  }
  v85.i64[1] = (uint64_t)v9;
  v22 = -[MPModelMovieKind variants](self, "variants", v82);
  if ((v22 & 4) == 0)
  {
    IsRental = (ModelPropertyBase *)mlcore::MoviePropertyIsRental((mlcore *)v22);
    if (a3)
      MPMediaLibraryGetProperty((ModelPropertyBase *)a3, IsRental);
    v22 = std::allocate_shared[abi:ne180100]<mlcore::UnaryPredicate<int>,std::allocator<mlcore::UnaryPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::UnaryOperator,void>((uint64_t *)&v90);
    v24 = v90;
    *(_OWORD *)v98 = v90;
    v90 = 0uLL;
    v25 = v85.i64[1];
    if (v85.i64[1] >= v86[0])
    {
      v83 = v24;
      v27 = (v85.i64[1] - v85.i64[0]) >> 4;
      if ((unint64_t)(v27 + 1) >> 60)
        std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
      v28 = (v86[0] - v85.i64[0]) >> 3;
      if (v28 <= v27 + 1)
        v28 = v27 + 1;
      if (v86[0] - v85.i64[0] >= 0x7FFFFFFFFFFFFFF0uLL)
        v29 = 0xFFFFFFFFFFFFFFFLL;
      else
        v29 = v28;
      v97 = v86;
      v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v29);
      v32 = &v30[16 * v27];
      *(_OWORD *)v32 = v83;
      *(_OWORD *)v98 = 0uLL;
      v33 = (_QWORD *)v85.i64[1];
      v34 = (_QWORD *)v85.i64[0];
      if (v85.i64[1] == v85.i64[0])
      {
        v37 = vdupq_n_s64(v85.u64[1]);
        v35 = &v30[16 * v27];
      }
      else
      {
        v35 = &v30[16 * v27];
        do
        {
          v36 = *((_OWORD *)v33 - 1);
          v33 -= 2;
          *((_OWORD *)v35 - 1) = v36;
          v35 -= 16;
          *v33 = 0;
          v33[1] = 0;
        }
        while (v33 != v34);
        v37 = v85;
      }
      v26 = v32 + 16;
      v85.i64[0] = (uint64_t)v35;
      v85.i64[1] = (uint64_t)(v32 + 16);
      v95 = v37;
      v38 = v86[0];
      v86[0] = &v30[16 * v31];
      v96 = v38;
      v94 = (int64x2_t *)v37.i64[0];
      v22 = std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v94);
    }
    else
    {
      *(_OWORD *)v85.i64[1] = v24;
      v26 = (_OWORD *)(v25 + 16);
      *(_OWORD *)v98 = 0uLL;
    }
    v85.i64[1] = (uint64_t)v26;
  }
  IsMusicShow = (ModelPropertyBase *)mlcore::ItemPropertyIsMusicShow((mlcore *)v22);
  if (a3)
    MPMediaLibraryGetProperty((ModelPropertyBase *)a3, IsMusicShow);
  std::allocate_shared[abi:ne180100]<mlcore::UnaryPredicate<long long>,std::allocator<mlcore::UnaryPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::UnaryOperator,void>((uint64_t *)&v88);
  *(_QWORD *)v98 = 2;
  *(_OWORD *)&v98[8] = v88;
  v88 = 0uLL;
  std::map<unsigned long,std::shared_ptr<mlcore::Predicate>>::map[abi:ne180100](v89, (unint64_t *)v98, 1);
  _MPMLPredicateForVariants((uint64_t)&v90, v89, 1, -[MPModelMovieKind variants](self, "variants"));
  v40 = v85.i64[1];
  if (v85.i64[1] >= v86[0])
  {
    v41 = (v85.i64[1] - v85.i64[0]) >> 4;
    v42 = v41 + 1;
    if ((unint64_t)(v41 + 1) >> 60)
      std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
    v43 = v86[0] - v85.i64[0];
    if ((v86[0] - v85.i64[0]) >> 3 > v42)
      v42 = v43 >> 3;
    if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFF0)
      v44 = 0xFFFFFFFFFFFFFFFLL;
    else
      v44 = v42;
    v97 = v86;
    v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v44);
    v47 = &v45[16 * v41];
    *(_OWORD *)v47 = v90;
    v90 = 0uLL;
    v48 = (_QWORD *)v85.i64[1];
    v49 = (_QWORD *)v85.i64[0];
    if (v85.i64[1] == v85.i64[0])
    {
      v52 = vdupq_n_s64(v85.u64[1]);
      v50 = &v45[16 * v41];
    }
    else
    {
      v50 = &v45[16 * v41];
      do
      {
        v51 = *((_OWORD *)v48 - 1);
        v48 -= 2;
        *((_OWORD *)v50 - 1) = v51;
        v50 -= 16;
        *v48 = 0;
        v48[1] = 0;
      }
      while (v48 != v49);
      v52 = v85;
    }
    v53 = v47 + 16;
    v85.i64[0] = (uint64_t)v50;
    v95 = v52;
    v54 = v86[0];
    v86[0] = &v45[16 * v46];
    v96 = v54;
    v94 = (int64x2_t *)v52.i64[0];
    std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v94);
    v55 = (std::__shared_weak_count *)*((_QWORD *)&v90 + 1);
    v85.i64[1] = (uint64_t)v53;
    if (*((_QWORD *)&v90 + 1))
    {
      v56 = (unint64_t *)(*((_QWORD *)&v90 + 1) + 8);
      do
        v57 = __ldaxr(v56);
      while (__stlxr(v57 - 1, v56));
      if (!v57)
      {
        ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
        std::__shared_weak_count::__release_weak(v55);
      }
    }
  }
  else
  {
    *(_OWORD *)v85.i64[1] = v90;
    v90 = 0uLL;
    v85.i64[1] = v40 + 16;
  }
  std::__tree<std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>,std::__map_value_compare<long long,std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>,std::less<long long>,true>,std::allocator<std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>>>::destroy(v89[1]);
  v58 = *(std::__shared_weak_count **)&v98[16];
  if (*(_QWORD *)&v98[16])
  {
    v59 = (unint64_t *)(*(_QWORD *)&v98[16] + 8);
    do
      v60 = __ldaxr(v59);
    while (__stlxr(v60 - 1, v59));
    if (!v60)
    {
      ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
      std::__shared_weak_count::__release_weak(v58);
    }
  }
  v61 = (std::__shared_weak_count *)*((_QWORD *)&v88 + 1);
  if (*((_QWORD *)&v88 + 1))
  {
    v62 = (unint64_t *)(*((_QWORD *)&v88 + 1) + 8);
    do
      v63 = __ldaxr(v62);
    while (__stlxr(v63 - 1, v62));
    if (!v63)
    {
      ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
      std::__shared_weak_count::__release_weak(v61);
    }
  }
  v64 = -[MPModelMovieKind options](self, "options", v83);
  if ((v64 & 1) != 0)
  {
    mlcore::ItemPropertyExcludeFromShuffle(v64);
    std::allocate_shared[abi:ne180100]<mlcore::UnaryPredicate<int>,std::allocator<mlcore::UnaryPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::UnaryOperator,void>((uint64_t *)&v90);
    v66 = v90;
    *(_OWORD *)v98 = v90;
    v90 = 0uLL;
    v67 = v85.i64[1];
    if (v85.i64[1] >= v86[0])
    {
      v84 = v66;
      v68 = (v85.i64[1] - v85.i64[0]) >> 4;
      if ((unint64_t)(v68 + 1) >> 60)
        std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
      v69 = (v86[0] - v85.i64[0]) >> 3;
      if (v69 <= v68 + 1)
        v69 = v68 + 1;
      if (v86[0] - v85.i64[0] >= 0x7FFFFFFFFFFFFFF0uLL)
        v70 = 0xFFFFFFFFFFFFFFFLL;
      else
        v70 = v69;
      v97 = v86;
      v71 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v70);
      v73 = &v71[16 * v68];
      *(_OWORD *)v73 = v84;
      *(_OWORD *)v98 = 0uLL;
      v74 = (_QWORD *)v85.i64[1];
      v75 = (_QWORD *)v85.i64[0];
      if (v85.i64[1] == v85.i64[0])
      {
        v78 = vdupq_n_s64(v85.u64[1]);
        v76 = &v71[16 * v68];
      }
      else
      {
        v76 = &v71[16 * v68];
        do
        {
          v77 = *((_OWORD *)v74 - 1);
          v74 -= 2;
          *((_OWORD *)v76 - 1) = v77;
          v76 -= 16;
          *v74 = 0;
          v74[1] = 0;
        }
        while (v74 != v75);
        v78 = v85;
      }
      v65 = v73 + 16;
      v85.i64[0] = (uint64_t)v76;
      v85.i64[1] = (uint64_t)(v73 + 16);
      v95 = v78;
      v79 = v86[0];
      v86[0] = &v71[16 * v72];
      v96 = v79;
      v94 = (int64x2_t *)v78.i64[0];
      std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v94);
    }
    else
    {
      *(_OWORD *)v85.i64[1] = v66;
      v65 = (_QWORD *)(v67 + 16);
      *(_OWORD *)v98 = 0uLL;
    }
    v85.i64[1] = (uint64_t)v65;
  }
  else
  {
    v65 = (_QWORD *)v85.i64[1];
  }
  memset(v87, 0, sizeof(v87));
  std::vector<std::shared_ptr<mlcore::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<mlcore::Predicate>*,std::shared_ptr<mlcore::Predicate>*>(v87, v85.i64[0], v65, ((uint64_t)v65 - v85.i64[0]) >> 4);
  mlcore::CreateAndPredicate();
  v94 = (int64x2_t *)v87;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v94);
  if (__p)
  {
    v92 = __p;
    operator delete(__p);
  }
  v94 = &v85;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v94);
  result.var1 = v81;
  result.var0 = v80;
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
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  variants = self->_variants;
  if ((variants & 1) != 0)
  {
    objc_msgSend(v4, "addObject:", CFSTR("movies"));
    variants = self->_variants;
    if ((variants & 2) == 0)
    {
LABEL_3:
      if ((variants & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((variants & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v5, "addObject:", CFSTR("Apple Music movies"));
  if ((self->_variants & 4) != 0)
LABEL_4:
    objc_msgSend(v5, "addObject:", CFSTR("rentals"));
LABEL_5:
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

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Movie:v%lu:o%lu"), a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__MPModelMovieKind_kindWithVariants_options___block_invoke;
  v11[3] = &__block_descriptor_48_e26_v16__0__MPModelMovieKind_8l;
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
  v3.super_class = (Class)MPModelMovieKind;
  return self->_variants ^ -[MPModelKind hash](&v3, sel_hash) ^ self->_options;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MPModelMovieKind;
  v5 = -[MPModelKind isEqual:](&v7, sel_isEqual_, v4) && self->_variants == v4[2] && self->_options == v4[3];

  return v5;
}

- (MPModelMovieKind)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  MPModelMovieKind *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("variants"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("options"));

  +[MPModelMovieKind kindWithVariants:options:](MPModelMovieKind, "kindWithVariants:options:", v5, v6);
  v7 = (MPModelMovieKind *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPModelMovieKind;
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

  v2 = (Predicate *)-[MPModelMovieKind predicateWithBaseProperty:](self, "predicateWithBaseProperty:", 0);
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

@end
