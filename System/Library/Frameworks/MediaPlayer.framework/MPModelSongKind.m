@implementation MPModelSongKind

+ (id)identityKind
{
  return +[MPModelKind kindWithModelClass:](MPModelKind, "kindWithModelClass:", objc_opt_class());
}

uint64_t __44__MPModelSongKind_kindWithVariants_options___block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(a2 + 16) = *(_QWORD *)(result + 32);
  *(_QWORD *)(a2 + 24) = *(_QWORD *)(result + 40);
  return result;
}

- (id)humanDescription
{
  void *v3;
  void *v4;
  unint64_t variants;
  void *v6;
  void *v7;
  void *v8;
  unint64_t options;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  variants = self->_variants;
  if ((variants & 1) != 0)
  {
    objc_msgSend(v3, "addObject:", CFSTR("songs"));
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
  objc_msgSend(v4, "addObject:", CFSTR("music videos"));
  if ((self->_variants & 4) != 0)
LABEL_4:
    objc_msgSend(v4, "addObject:", CFSTR("artist uploaded content"));
LABEL_5:
  v6 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(" or "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  options = self->_options;
  if ((options & 1) != 0)
  {
    objc_msgSend(v8, "insertString:atIndex:", CFSTR("shuffleable "), 0);
    options = self->_options;
  }
  if ((options & 2) != 0)
    objc_msgSend(v8, "insertString:atIndex:", CFSTR("cloud library "), 0);

  return v8;
}

- (shared_ptr<mlcore::Predicate>)predicateWithBaseProperty:(void *)a3
{
  char *v5;
  unint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  BOOL v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  unint64_t v16;
  int v17;
  ModelPropertyBase *v18;
  __int128 v19;
  uint64_t v20;
  _OWORD *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  _QWORD *v28;
  _QWORD *v29;
  char *v30;
  __int128 v31;
  int64x2_t v32;
  uint64_t v33;
  mlcore *v34;
  _QWORD *v35;
  ModelPropertyBase *v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  char *v42;
  uint64_t v43;
  char *v44;
  _QWORD *v45;
  _QWORD *v46;
  char *v47;
  __int128 v48;
  int64x2_t v49;
  uint64_t v50;
  Predicate *v51;
  __shared_weak_count *v52;
  __int128 v53;
  __int128 v54;
  int64x2_t v55;
  _QWORD v56[5];
  _QWORD v57[3];
  __int128 v58;
  __int128 v59;
  void *__p;
  char *v61;
  char *v62;
  int64x2_t *v63;
  int64x2_t v64;
  uint64_t v65;
  _QWORD *v66;
  shared_ptr<mlcore::Predicate> result;

  v55 = 0uLL;
  v56[0] = 0;
  __p = 0;
  v61 = 0;
  v62 = 0;
  if ((-[MPModelSongKind variants](self, "variants") & 1) != 0)
  {
    v5 = (char *)operator new(4uLL);
    *(_DWORD *)v5 = 8;
    v61 = v5 + 4;
    v62 = v5 + 4;
    __p = v5;
  }
  v6 = -[MPModelSongKind variants](self, "variants");
  if ((v6 & 2) != 0)
  {
    v7 = v61;
    if (v61 >= v62)
    {
      v6 = (unint64_t)__p;
      v9 = (v61 - (_BYTE *)__p) >> 2;
      v10 = v9 + 1;
      if ((unint64_t)(v9 + 1) >> 62)
        std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
      v11 = v62 - (_BYTE *)__p;
      if ((v62 - (_BYTE *)__p) >> 1 > v10)
        v10 = v11 >> 1;
      v12 = (unint64_t)v11 >= 0x7FFFFFFFFFFFFFFCLL;
      v13 = 0x3FFFFFFFFFFFFFFFLL;
      if (!v12)
        v13 = v10;
      if (v13)
      {
        v13 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v13);
        v6 = (unint64_t)__p;
        v7 = v61;
      }
      else
      {
        v14 = 0;
      }
      v15 = (char *)(v13 + 4 * v9);
      v16 = v13 + 4 * v14;
      *(_DWORD *)v15 = 1032;
      v8 = v15 + 4;
      while (v7 != (char *)v6)
      {
        v17 = *((_DWORD *)v7 - 1);
        v7 -= 4;
        *((_DWORD *)v15 - 1) = v17;
        v15 -= 4;
      }
      __p = v15;
      v62 = (char *)v16;
      if (v6)
        operator delete((void *)v6);
    }
    else
    {
      *(_DWORD *)v61 = 1032;
      v8 = v7 + 4;
    }
    v61 = v8;
  }
  v18 = (ModelPropertyBase *)mlcore::ItemPropertyMediaType((mlcore *)v6);
  if (a3)
    MPMediaLibraryGetProperty((ModelPropertyBase *)a3, v18);
  std::allocate_shared[abi:ne180100]<mlcore::InPredicate<int>,std::allocator<mlcore::InPredicate<int>>,mlcore::ModelProperty<int> *&,std::vector<int> const&,void>((uint64_t *)&v58);
  v19 = v58;
  v59 = v58;
  v58 = 0uLL;
  v20 = v55.i64[1];
  if (v55.i64[1] >= v56[0])
  {
    v53 = v19;
    v22 = (v55.i64[1] - v55.i64[0]) >> 4;
    if ((unint64_t)(v22 + 1) >> 60)
      std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
    v23 = (v56[0] - v55.i64[0]) >> 3;
    if (v23 <= v22 + 1)
      v23 = v22 + 1;
    if (v56[0] - v55.i64[0] >= 0x7FFFFFFFFFFFFFF0uLL)
      v24 = 0xFFFFFFFFFFFFFFFLL;
    else
      v24 = v23;
    v66 = v56;
    v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v24);
    v27 = &v25[16 * v22];
    *(_OWORD *)v27 = v53;
    v59 = 0uLL;
    v28 = (_QWORD *)v55.i64[1];
    v29 = (_QWORD *)v55.i64[0];
    if (v55.i64[1] == v55.i64[0])
    {
      v32 = vdupq_n_s64(v55.u64[1]);
      v30 = &v25[16 * v22];
    }
    else
    {
      v30 = &v25[16 * v22];
      do
      {
        v31 = *((_OWORD *)v28 - 1);
        v28 -= 2;
        *((_OWORD *)v30 - 1) = v31;
        v30 -= 16;
        *v28 = 0;
        v28[1] = 0;
      }
      while (v28 != v29);
      v32 = v55;
    }
    v21 = v27 + 16;
    v55.i64[0] = (uint64_t)v30;
    v55.i64[1] = (uint64_t)(v27 + 16);
    v64 = v32;
    v33 = v56[0];
    v56[0] = &v25[16 * v26];
    v65 = v33;
    v63 = (int64x2_t *)v32.i64[0];
    std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v63);
  }
  else
  {
    *(_OWORD *)v55.i64[1] = v19;
    v21 = (_OWORD *)(v20 + 16);
    v59 = 0uLL;
  }
  v55.i64[1] = (uint64_t)v21;
  v34 = -[MPModelSongKind options](self, "options", v53);
  if ((v34 & 1) != 0)
  {
    v36 = (ModelPropertyBase *)mlcore::ItemPropertyExcludeFromShuffle(v34);
    if (a3)
      MPMediaLibraryGetProperty((ModelPropertyBase *)a3, v36);
    std::allocate_shared[abi:ne180100]<mlcore::UnaryPredicate<int>,std::allocator<mlcore::UnaryPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::UnaryOperator,void>((uint64_t *)&v58);
    v37 = v58;
    v59 = v58;
    v58 = 0uLL;
    v38 = v55.i64[1];
    if (v55.i64[1] >= v56[0])
    {
      v54 = v37;
      v39 = (v55.i64[1] - v55.i64[0]) >> 4;
      if ((unint64_t)(v39 + 1) >> 60)
        std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
      v40 = (v56[0] - v55.i64[0]) >> 3;
      if (v40 <= v39 + 1)
        v40 = v39 + 1;
      if (v56[0] - v55.i64[0] >= 0x7FFFFFFFFFFFFFF0uLL)
        v41 = 0xFFFFFFFFFFFFFFFLL;
      else
        v41 = v40;
      v66 = v56;
      v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v41);
      v44 = &v42[16 * v39];
      *(_OWORD *)v44 = v54;
      v59 = 0uLL;
      v45 = (_QWORD *)v55.i64[1];
      v46 = (_QWORD *)v55.i64[0];
      if (v55.i64[1] == v55.i64[0])
      {
        v49 = vdupq_n_s64(v55.u64[1]);
        v47 = &v42[16 * v39];
      }
      else
      {
        v47 = &v42[16 * v39];
        do
        {
          v48 = *((_OWORD *)v45 - 1);
          v45 -= 2;
          *((_OWORD *)v47 - 1) = v48;
          v47 -= 16;
          *v45 = 0;
          v45[1] = 0;
        }
        while (v45 != v46);
        v49 = v55;
      }
      v35 = v44 + 16;
      v55.i64[0] = (uint64_t)v47;
      v55.i64[1] = (uint64_t)(v44 + 16);
      v64 = v49;
      v50 = v56[0];
      v56[0] = &v42[16 * v43];
      v65 = v50;
      v63 = (int64x2_t *)v49.i64[0];
      std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v63);
    }
    else
    {
      *(_OWORD *)v55.i64[1] = v37;
      v35 = (_QWORD *)(v38 + 16);
      v59 = 0uLL;
    }
    v55.i64[1] = (uint64_t)v35;
  }
  else
  {
    v35 = (_QWORD *)v55.i64[1];
  }
  memset(v57, 0, sizeof(v57));
  std::vector<std::shared_ptr<mlcore::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<mlcore::Predicate>*,std::shared_ptr<mlcore::Predicate>*>(v57, v55.i64[0], v35, ((uint64_t)v35 - v55.i64[0]) >> 4);
  mlcore::CreateAndPredicate();
  v63 = (int64x2_t *)v57;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v63);
  if (__p)
  {
    v61 = (char *)__p;
    operator delete(__p);
  }
  v63 = &v55;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v63);
  result.var1 = v52;
  result.var0 = v51;
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

+ (id)kindWithVariants:(unint64_t)a3 options:(unint64_t)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[6];

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Song:v%lu:o%lu"), a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44__MPModelSongKind_kindWithVariants_options___block_invoke;
  v11[3] = &__block_descriptor_48_e25_v16__0__MPModelSongKind_8l;
  v11[4] = a3;
  v11[5] = a4;
  objc_msgSend(a1, "kindWithModelClass:cacheKey:block:", v8, v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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
  int v15;
  void *v16;
  mlcore *v17;
  _OWORD *v18;
  char v19;
  uint64_t v20;
  char v21;
  __int128 v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  uint64_t i;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  void **v32;
  char v33;
  uint64_t v34;
  __int128 v35;
  _OWORD *v36;
  _OWORD *v37;
  _OWORD *v38;
  std::__shared_weak_count *v39;
  objc_super v40;
  uint64_t v41;
  std::__shared_weak_count *v42;
  _OWORD v43[1];
  __int128 v44;
  uint64_t v45;

  var0 = a3.var0;
  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3.var1;
  v7 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
  v41 = *(_QWORD *)var0;
  v42 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  v40.receiver = self;
  v40.super_class = (Class)MPModelSongKind;
  -[MPModelKind applyToView:withContext:](&v40, sel_applyToView_withContext_, &v41, v6);
  v10 = v42;
  if (v42)
  {
    v11 = (unint64_t *)&v42->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  if ((-[MPModelSongKind options](self, "options") & 2) == 0)
  {
    -[__shared_weak_count mediaLibrary](v6, "mediaLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaLibrarySystemFilters filtersForLibrary:](MPMediaLibrarySystemFilters, "filtersForLibrary:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "shouldExcludePurchaseHistoryContent");

    if (v15)
    {
      +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", -[MPModelKind modelClass](self, "modelClass"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "entityClass");
      objc_msgSend(v16, "entityClass");
      v17 = (mlcore *)mlcore::LibraryView::filterPredicateForEntityClass();
      mlcore::ItemPropertyRemoteLocationID(v17);
      v34 = 100;
      std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<long long>,std::allocator<mlcore::ComparisonPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::ComparisonOperator &,long long const&,mlcore::ComparisonOptions &,void>((uint64_t *)&v35);
      v44 = v35;
      v35 = 0uLL;
      v37 = 0;
      v38 = 0;
      v36 = 0;
      v32 = (void **)&v36;
      v33 = 0;
      v18 = operator new(0x20uLL);
      v19 = 0;
      v20 = 0;
      v36 = v18;
      v37 = v18;
      v38 = v18 + 2;
      do
      {
        v21 = v19;
        v22 = v43[v20];
        *v18 = v22;
        if (*((_QWORD *)&v22 + 1))
        {
          v23 = (unint64_t *)(*((_QWORD *)&v22 + 1) + 8);
          do
            v24 = __ldxr(v23);
          while (__stxr(v24 + 1, v23));
        }
        ++v18;
        v19 = 1;
        v20 = 1;
      }
      while ((v21 & 1) == 0);
      v37 = v18;
      mlcore::CreateAndPredicate();
      mlcore::LibraryView::setFilterPredicateForEntityClass();
      v25 = v39;
      if (v39)
      {
        v26 = (unint64_t *)&v39->__shared_owners_;
        do
          v27 = __ldaxr(v26);
        while (__stlxr(v27 - 1, v26));
        if (!v27)
        {
          ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
          std::__shared_weak_count::__release_weak(v25);
        }
      }
      v32 = (void **)&v36;
      std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v32);
      for (i = 1; i != -1; --i)
        std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&v43[i]);
      v29 = (std::__shared_weak_count *)*((_QWORD *)&v35 + 1);
      if (*((_QWORD *)&v35 + 1))
      {
        v30 = (unint64_t *)(*((_QWORD *)&v35 + 1) + 8);
        do
          v31 = __ldaxr(v30);
        while (__stlxr(v31 - 1, v30));
        if (!v31)
        {
          ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
          std::__shared_weak_count::__release_weak(v29);
        }
      }

    }
  }

}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPModelSongKind;
  v3 = -[MPModelKind hash](&v6, sel_hash);
  v4 = -[MPModelSongKind variants](self, "variants");
  return v4 ^ -[MPModelSongKind options](self, "options") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MPModelSongKind;
  v5 = -[MPModelKind isEqual:](&v7, sel_isEqual_, v4) && self->_variants == v4[2] && self->_options == v4[3];

  return v5;
}

- (MPModelSongKind)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  MPModelSongKind *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("variants"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("options"));

  +[MPModelSongKind kindWithVariants:options:](MPModelSongKind, "kindWithVariants:options:", v5, v6);
  v7 = (MPModelSongKind *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPModelSongKind;
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

  v2 = (Predicate *)-[MPModelSongKind predicateWithBaseProperty:](self, "predicateWithBaseProperty:", 0);
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

@end
