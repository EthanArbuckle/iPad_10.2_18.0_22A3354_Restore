@implementation MPModelAlbumKind

void __54__MPModelAlbumKind_kindWithVariants_songKind_options___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;

  *(_QWORD *)(a2 + 16) = *(_QWORD *)(a1 + 40);
  objc_storeStrong((id *)(a2 + 24), *(id *)(a1 + 32));
  v4 = (id)a2;
  v4[4] = *(_QWORD *)(a1 + 48);

}

+ (id)identityKind
{
  return +[MPModelKind kindWithModelClass:](MPModelKind, "kindWithModelClass:", objc_opt_class());
}

- (shared_ptr<mlcore::Predicate>)predicateWithBaseProperty:(void *)a3
{
  ModelPropertyBase *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  _QWORD *v14;
  _QWORD *v15;
  char *v16;
  __int128 v17;
  int64x2_t v18;
  _OWORD *v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  mlcore *v30;
  _QWORD *v31;
  ModelPropertyBase *v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  _QWORD *v41;
  _QWORD *v42;
  char *v43;
  __int128 v44;
  int64x2_t v45;
  uint64_t v46;
  Predicate *v47;
  __shared_weak_count *v48;
  __int128 v49;
  int64x2_t v50;
  _QWORD v51[5];
  _QWORD v52[3];
  __int128 v53;
  uint64_t *v54[3];
  __int128 v55;
  int64x2_t *v56;
  int64x2_t v57;
  uint64_t v58;
  _QWORD *v59;
  _BYTE v60[24];
  uint64_t v61;
  shared_ptr<mlcore::Predicate> result;

  v61 = *MEMORY[0x1E0C80C00];
  v50 = 0uLL;
  v51[0] = 0;
  v5 = (ModelPropertyBase *)mlcore::AlbumPropertyAllCompilations((mlcore *)self);
  if (a3)
    MPMediaLibraryGetProperty((ModelPropertyBase *)a3, v5);
  std::allocate_shared[abi:ne180100]<mlcore::UnaryPredicate<int>,std::allocator<mlcore::UnaryPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::UnaryOperator,void>((uint64_t *)&v53);
  *(_QWORD *)v60 = 2;
  *(_OWORD *)&v60[8] = v53;
  v53 = 0uLL;
  std::map<unsigned long,std::shared_ptr<mlcore::Predicate>>::map[abi:ne180100](v54, (unint64_t *)v60, 1);
  _MPMLPredicateForVariants((uint64_t)&v55, v54, 1, -[MPModelAlbumKind variants](self, "variants"));
  v6 = v50.i64[1];
  if (v50.i64[1] >= v51[0])
  {
    v7 = (v50.i64[1] - v50.i64[0]) >> 4;
    v8 = v7 + 1;
    if ((unint64_t)(v7 + 1) >> 60)
      std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
    v9 = v51[0] - v50.i64[0];
    if ((v51[0] - v50.i64[0]) >> 3 > v8)
      v8 = v9 >> 3;
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFF0)
      v10 = 0xFFFFFFFFFFFFFFFLL;
    else
      v10 = v8;
    v59 = v51;
    v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v10);
    v13 = &v11[16 * v7];
    *(_OWORD *)v13 = v55;
    v55 = 0uLL;
    v14 = (_QWORD *)v50.i64[1];
    v15 = (_QWORD *)v50.i64[0];
    if (v50.i64[1] == v50.i64[0])
    {
      v18 = vdupq_n_s64(v50.u64[1]);
      v16 = &v11[16 * v7];
    }
    else
    {
      v16 = &v11[16 * v7];
      do
      {
        v17 = *((_OWORD *)v14 - 1);
        v14 -= 2;
        *((_OWORD *)v16 - 1) = v17;
        v16 -= 16;
        *v14 = 0;
        v14[1] = 0;
      }
      while (v14 != v15);
      v18 = v50;
    }
    v19 = v13 + 16;
    v50.i64[0] = (uint64_t)v16;
    v57 = v18;
    v20 = v51[0];
    v51[0] = &v11[16 * v12];
    v58 = v20;
    v56 = (int64x2_t *)v18.i64[0];
    std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v56);
    v21 = (std::__shared_weak_count *)*((_QWORD *)&v55 + 1);
    v50.i64[1] = (uint64_t)v19;
    if (*((_QWORD *)&v55 + 1))
    {
      v22 = (unint64_t *)(*((_QWORD *)&v55 + 1) + 8);
      do
        v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }
  }
  else
  {
    *(_OWORD *)v50.i64[1] = v55;
    v55 = 0uLL;
    v50.i64[1] = v6 + 16;
  }
  std::__tree<std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>,std::__map_value_compare<long long,std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>,std::less<long long>,true>,std::allocator<std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>>>::destroy(v54[1]);
  v24 = *(std::__shared_weak_count **)&v60[16];
  if (*(_QWORD *)&v60[16])
  {
    v25 = (unint64_t *)(*(_QWORD *)&v60[16] + 8);
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  v27 = (std::__shared_weak_count *)*((_QWORD *)&v53 + 1);
  if (*((_QWORD *)&v53 + 1))
  {
    v28 = (unint64_t *)(*((_QWORD *)&v53 + 1) + 8);
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
  v30 = -[MPModelAlbumKind options](self, "options");
  if ((v30 & 1) != 0)
  {
    v32 = (ModelPropertyBase *)mlcore::AlbumPropertyDatePlayedLocal(v30);
    if (a3)
      MPMediaLibraryGetProperty((ModelPropertyBase *)a3, v32);
    *(_QWORD *)&v53 = 0;
    std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<long long>,std::allocator<mlcore::ComparisonPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::ComparisonOperator &,long long const&,mlcore::ComparisonOptions &,void>((uint64_t *)&v55);
    v33 = v55;
    *(_OWORD *)v60 = v55;
    v55 = 0uLL;
    v34 = v50.i64[1];
    if (v50.i64[1] >= v51[0])
    {
      v49 = v33;
      v35 = (v50.i64[1] - v50.i64[0]) >> 4;
      if ((unint64_t)(v35 + 1) >> 60)
        std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
      v36 = (v51[0] - v50.i64[0]) >> 3;
      if (v36 <= v35 + 1)
        v36 = v35 + 1;
      if (v51[0] - v50.i64[0] >= 0x7FFFFFFFFFFFFFF0uLL)
        v37 = 0xFFFFFFFFFFFFFFFLL;
      else
        v37 = v36;
      v59 = v51;
      v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v37);
      v40 = &v38[16 * v35];
      *(_OWORD *)v40 = v49;
      *(_OWORD *)v60 = 0uLL;
      v41 = (_QWORD *)v50.i64[1];
      v42 = (_QWORD *)v50.i64[0];
      if (v50.i64[1] == v50.i64[0])
      {
        v45 = vdupq_n_s64(v50.u64[1]);
        v43 = &v38[16 * v35];
      }
      else
      {
        v43 = &v38[16 * v35];
        do
        {
          v44 = *((_OWORD *)v41 - 1);
          v41 -= 2;
          *((_OWORD *)v43 - 1) = v44;
          v43 -= 16;
          *v41 = 0;
          v41[1] = 0;
        }
        while (v41 != v42);
        v45 = v50;
      }
      v31 = v40 + 16;
      v50.i64[0] = (uint64_t)v43;
      v50.i64[1] = (uint64_t)(v40 + 16);
      v57 = v45;
      v46 = v51[0];
      v51[0] = &v38[16 * v39];
      v58 = v46;
      v56 = (int64x2_t *)v45.i64[0];
      std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v56);
    }
    else
    {
      *(_OWORD *)v50.i64[1] = v33;
      v31 = (_QWORD *)(v34 + 16);
      *(_OWORD *)v60 = 0uLL;
    }
    v50.i64[1] = (uint64_t)v31;
  }
  else
  {
    v31 = (_QWORD *)v50.i64[1];
  }
  memset(v52, 0, sizeof(v52));
  std::vector<std::shared_ptr<mlcore::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<mlcore::Predicate>*,std::shared_ptr<mlcore::Predicate>*>(v52, v50.i64[0], v31, ((uint64_t)v31 - v50.i64[0]) >> 4);
  mlcore::CreateAndPredicate();
  v56 = (int64x2_t *)v52;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v56);
  v56 = &v50;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v56);
  result.var1 = v48;
  result.var0 = v47;
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
  unint64_t variants;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  variants = self->_variants;
  if ((variants & 1) != 0)
  {
    objc_msgSend(v3, "appendString:", CFSTR("albums"));
    if ((self->_variants & 2) == 0)
      goto LABEL_7;
    objc_msgSend(v4, "appendString:", CFSTR(" or "));
    goto LABEL_6;
  }
  if ((variants & 2) != 0)
LABEL_6:
    objc_msgSend(v4, "appendString:", CFSTR("compilations"));
LABEL_7:
  if ((self->_options & 1) != 0)
    objc_msgSend(v4, "insertString:atIndex:", CFSTR("previously played "), 0);
  -[MPModelSongKind humanDescription](self->_songKind, "humanDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" containing %@"), v6);

  return v4;
}

+ (MPModelAlbumKind)kindWithVariants:(unint64_t)a3 songKind:(id)a4 options:(unint64_t)a5
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
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Album:v%lu:o%lu:s%p"), a3, a5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54__MPModelAlbumKind_kindWithVariants_songKind_options___block_invoke;
  v14[3] = &unk_1E3163AD0;
  v15 = v8;
  v16 = a3;
  v17 = a5;
  v11 = v8;
  objc_msgSend(a1, "kindWithModelClass:cacheKey:block:", v10, v9, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPModelAlbumKind *)v12;
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
  uint64_t v21;
  std::__shared_weak_count *v22;
  objc_super v23;
  uint64_t v24;
  std::__shared_weak_count *v25;

  var0 = a3.var0;
  v6 = a3.var1;
  v7 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
  v24 = *(_QWORD *)var0;
  v25 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  v23.receiver = self;
  v23.super_class = (Class)MPModelAlbumKind;
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
  -[MPModelAlbumKind songKind](self, "songKind");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
  v21 = *(_QWORD *)var0;
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

- (MPModelSongKind)songKind
{
  return self->_songKind;
}

- (shared_ptr<mlcore::Predicate>)representedSearchScopePredicate
{
  void *v3;
  void *v4;
  _OWORD *v5;
  char v6;
  uint64_t v7;
  char v8;
  __int128 v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t i;
  Predicate *v13;
  __shared_weak_count *v14;
  _OWORD *v15;
  _OWORD *v16;
  _OWORD *v17;
  void **v18;
  char v19;
  _QWORD v20[5];
  shared_ptr<mlcore::Predicate> result;

  v20[4] = *MEMORY[0x1E0C80C00];
  -[MPModelAlbumKind songKind](self, "songKind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "predicateWithBaseProperty:", 0);
  }
  else
  {
    v20[0] = 0;
    v20[1] = 0;
  }
  -[MPModelAlbumKind predicateWithBaseProperty:](self, "predicateWithBaseProperty:", 0);
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v18 = (void **)&v15;
  v19 = 0;
  v5 = operator new(0x20uLL);
  v6 = 0;
  v7 = 0;
  v15 = v5;
  v16 = v5;
  v17 = v5 + 2;
  do
  {
    v8 = v6;
    v9 = *(_OWORD *)&v20[2 * v7];
    *v5 = v9;
    if (*((_QWORD *)&v9 + 1))
    {
      v10 = (unint64_t *)(*((_QWORD *)&v9 + 1) + 8);
      do
        v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }
    ++v5;
    v6 = 1;
    v7 = 1;
  }
  while ((v8 & 1) == 0);
  v16 = v5;
  mlcore::CreateAndPredicate();
  v18 = (void **)&v15;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v18);
  for (i = 2; i != -2; i -= 2)
    std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&v20[i]);

  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MPModelAlbumKind;
  v3 = -[MPModelKind hash](&v9, sel_hash);
  v4 = -[MPModelAlbumKind variants](self, "variants");
  v5 = v4 ^ -[MPModelAlbumKind options](self, "options");
  -[MPModelAlbumKind songKind](self, "songKind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash") ^ v3;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  char v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MPModelAlbumKind;
  if (-[MPModelKind isEqual:](&v12, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = -[MPModelAlbumKind variants](self, "variants");
    if (v6 == objc_msgSend(v5, "variants")
      && (v7 = -[MPModelAlbumKind options](self, "options"), v7 == objc_msgSend(v5, "options")))
    {
      -[MPModelAlbumKind songKind](self, "songKind");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "songKind");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (MPModelAlbumKind)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  MPModelAlbumKind *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("variants"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("options"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("songKind"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[MPModelAlbumKind kindWithVariants:songKind:options:](MPModelAlbumKind, "kindWithVariants:songKind:options:", v5, v7, v6);
    v8 = (MPModelAlbumKind *)objc_claimAutoreleasedReturnValue();
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
  v5.super_class = (Class)MPModelAlbumKind;
  v4 = a3;
  -[MPModelKind encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_variants, CFSTR("variants"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_songKind, CFSTR("songKind"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_options, CFSTR("options"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_songKind, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
