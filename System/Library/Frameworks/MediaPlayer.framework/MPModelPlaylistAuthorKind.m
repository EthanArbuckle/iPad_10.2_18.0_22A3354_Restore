@implementation MPModelPlaylistAuthorKind

- (id)humanDescription
{
  void *v3;
  void *v4;
  unint64_t variants;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  variants = self->_variants;
  if ((variants & 1) == 0)
  {
    if ((variants & 2) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(v4, "addObject:", CFSTR("collaborator"));
    if ((self->_variants & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(v3, "addObject:", CFSTR("host"));
  variants = self->_variants;
  if ((variants & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((variants & 4) != 0)
LABEL_4:
    objc_msgSend(v4, "addObject:", CFSTR("pending-collaborator"));
LABEL_5:
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "msv_compactDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("playlist author: variants:[%@]"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)variants
{
  return self->_variants;
}

+ (id)identityKind
{
  return +[MPModelPlaylistAuthorKind kindWithVariants:](MPModelPlaylistAuthorKind, "kindWithVariants:", 3);
}

+ (id)kindWithVariants:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[5];

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PlaylistAuthor:v%lu"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__MPModelPlaylistAuthorKind_kindWithVariants___block_invoke;
  v9[3] = &__block_descriptor_40_e35_v16__0__MPModelPlaylistAuthorKind_8l;
  v9[4] = a3;
  objc_msgSend(a1, "kindWithModelClass:cacheKey:block:", v6, v5, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __46__MPModelPlaylistAuthorKind_kindWithVariants___block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(a2 + 16) = *(_QWORD *)(result + 32);
  return result;
}

- (shared_ptr<mlcore::Predicate>)predicateWithBaseProperty:(void *)a3
{
  ModelPropertyBase *v5;
  mlcore *v6;
  ModelPropertyBase *IsPending;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  _QWORD *v16;
  _QWORD *v17;
  char *v18;
  __int128 v19;
  int64x2_t v20;
  _OWORD *v21;
  char *v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  uint64_t i;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  Predicate *v33;
  __shared_weak_count *v34;
  _QWORD v35[3];
  __int128 v36;
  int v37;
  __int128 v38;
  uint64_t *v39[3];
  __int128 v40;
  int64x2_t v41;
  char *v42;
  uint64_t v43;
  int64x2_t v44;
  char *v45;
  char **v46;
  uint64_t v47;
  __int128 v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  shared_ptr<mlcore::Predicate> result;

  v51 = *MEMORY[0x1E0C80C00];
  v41 = 0uLL;
  v42 = 0;
  v5 = (ModelPropertyBase *)mlcore::PlaylistAuthorPropertyRole((mlcore *)self);
  if (a3)
    MPMediaLibraryGetProperty((ModelPropertyBase *)a3, v5);
  v37 = 1;
  v6 = (mlcore *)std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<int>,std::allocator<mlcore::ComparisonPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::ComparisonOperator &,int const&,mlcore::ComparisonOptions &,void>((uint64_t *)&v38);
  v47 = 1;
  v48 = v38;
  v38 = 0uLL;
  IsPending = (ModelPropertyBase *)mlcore::PlaylistAuthorPropertyIsPending(v6);
  if (a3)
    MPMediaLibraryGetProperty((ModelPropertyBase *)a3, IsPending);
  std::allocate_shared[abi:ne180100]<mlcore::UnaryPredicate<int>,std::allocator<mlcore::UnaryPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::UnaryOperator,void>((uint64_t *)&v36);
  v49 = 4;
  v50 = v36;
  v36 = 0uLL;
  std::map<unsigned long,std::shared_ptr<mlcore::Predicate>>::map[abi:ne180100](v39, (unint64_t *)&v47, 2);
  _MPMLPredicateForVariants((uint64_t)&v40, v39, 2, -[MPModelPlaylistAuthorKind variants](self, "variants"));
  v8 = v41.i64[1];
  if (v41.i64[1] >= (unint64_t)v42)
  {
    v9 = (v41.i64[1] - v41.i64[0]) >> 4;
    v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 60)
      std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
    v11 = (uint64_t)&v42[-v41.i64[0]];
    if ((uint64_t)&v42[-v41.i64[0]] >> 3 > v10)
      v10 = v11 >> 3;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0)
      v12 = 0xFFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    v46 = &v42;
    v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v12);
    v15 = &v13[16 * v9];
    *(_OWORD *)v15 = v40;
    v40 = 0uLL;
    v16 = (_QWORD *)v41.i64[1];
    v17 = (_QWORD *)v41.i64[0];
    if (v41.i64[1] == v41.i64[0])
    {
      v20 = vdupq_n_s64(v41.u64[1]);
      v18 = &v13[16 * v9];
    }
    else
    {
      v18 = &v13[16 * v9];
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
      v20 = v41;
    }
    v21 = v15 + 16;
    v41.i64[0] = (uint64_t)v18;
    v41.i64[1] = (uint64_t)(v15 + 16);
    v44 = v20;
    v22 = v42;
    v42 = &v13[16 * v14];
    v45 = v22;
    v43 = v20.i64[0];
    std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v43);
    v23 = (std::__shared_weak_count *)*((_QWORD *)&v40 + 1);
    v41.i64[1] = (uint64_t)v21;
    if (*((_QWORD *)&v40 + 1))
    {
      v24 = (unint64_t *)(*((_QWORD *)&v40 + 1) + 8);
      do
        v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
    }
  }
  else
  {
    *(_OWORD *)v41.i64[1] = v40;
    v40 = 0uLL;
    v41.i64[1] = v8 + 16;
  }
  std::__tree<std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>,std::__map_value_compare<long long,std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>,std::less<long long>,true>,std::allocator<std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>>>::destroy(v39[1]);
  for (i = 32; i != -16; i -= 24)
    std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&v47 + i);
  v27 = (std::__shared_weak_count *)*((_QWORD *)&v36 + 1);
  if (*((_QWORD *)&v36 + 1))
  {
    v28 = (unint64_t *)(*((_QWORD *)&v36 + 1) + 8);
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
  v30 = (std::__shared_weak_count *)*((_QWORD *)&v38 + 1);
  if (*((_QWORD *)&v38 + 1))
  {
    v31 = (unint64_t *)(*((_QWORD *)&v38 + 1) + 8);
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
  memset(v35, 0, sizeof(v35));
  std::vector<std::shared_ptr<mlcore::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<mlcore::Predicate>*,std::shared_ptr<mlcore::Predicate>*>(v35, v41.i64[0], (_QWORD *)v41.i64[1], (v41.i64[1] - v41.i64[0]) >> 4);
  mlcore::CreateAndPredicate();
  v47 = (uint64_t)v35;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v47);
  v47 = (uint64_t)&v41;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v47);
  result.var1 = v34;
  result.var0 = v33;
  return result;
}

@end
