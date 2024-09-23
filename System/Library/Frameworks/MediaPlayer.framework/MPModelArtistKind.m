@implementation MPModelArtistKind

void __39__MPModelArtistKind_kindWithAlbumKind___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(a2 + 16), *(id *)(a1 + 32));
}

+ (id)identityKind
{
  return +[MPModelKind kindWithModelClass:](MPModelKind, "kindWithModelClass:", objc_opt_class());
}

- (void)applyToView:(shared_ptr<mlcore:(id)a4 :LibraryView>)a3 withContext:
{
  LibraryView *var0;
  __shared_weak_count *v6;
  void *v7;
  void *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  std::__shared_weak_count *v16;

  var0 = a3.var0;
  v6 = a3.var1;
  -[MPModelArtistKind albumKind](self, "albumKind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
  v15 = *(_QWORD *)var0;
  v16 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  objc_msgSend(v7, "applyToView:withContext:", &v15, v6);
  v12 = v16;
  if (v16)
  {
    v13 = (unint64_t *)&v16->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }

}

- (MPModelAlbumKind)albumKind
{
  return self->_albumKind;
}

+ (id)kindWithAlbumKind:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Artist:a%p"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __39__MPModelArtistKind_kindWithAlbumKind___block_invoke;
  v10[3] = &unk_1E31545F8;
  v11 = v4;
  v7 = v4;
  objc_msgSend(a1, "kindWithModelClass:cacheKey:block:", v6, v5, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)humanDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[MPModelAlbumKind humanDescription](self->_albumKind, "humanDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("artists with %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPModelArtistKind;
  v3 = -[MPModelKind hash](&v5, sel_hash);
  return -[MPModelAlbumKind hash](self->_albumKind, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MPModelArtistKind;
  if (-[MPModelKind isEqual:](&v7, sel_isEqual_, v4))
    v5 = -[MPModelAlbumKind isEqual:](self->_albumKind, "isEqual:", v4[2]);
  else
    v5 = 0;

  return v5;
}

- (MPModelArtistKind)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MPModelArtistKind *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("albumKind"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[MPModelArtistKind kindWithAlbumKind:](MPModelArtistKind, "kindWithAlbumKind:", v5);
    v6 = (MPModelArtistKind *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPModelArtistKind;
  v4 = a3;
  -[MPModelKind encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_albumKind, CFSTR("albumKind"), v5.receiver, v5.super_class);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_albumKind, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (shared_ptr<mlcore::Predicate>)representedSearchScopePredicate
{
  void *v2;
  void *v3;
  void *v4;
  mlcore *v5;
  mlcore *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  uint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t v12;
  _OWORD *v13;
  char v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  unint64_t *v18;
  unint64_t v19;
  char *v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  uint64_t i;
  _QWORD *v28;
  unint64_t *v29;
  unint64_t *v30;
  unint64_t v31;
  mlcore *exists;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  unint64_t v39;
  _OWORD *v40;
  char v41;
  uint64_t v42;
  char v43;
  __int128 v44;
  unint64_t *v45;
  unint64_t v46;
  uint64_t j;
  Predicate *v48;
  __shared_weak_count *v49;
  std::__shared_weak_count *v50;
  unint64_t *v51;
  unint64_t v52;
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
  _OWORD *v65;
  _OWORD *v66;
  _OWORD *v67;
  uint64_t v68;
  std::__shared_weak_count *v69;
  _OWORD *v70;
  _OWORD *v71;
  _OWORD *v72;
  __int128 v73;
  char *v74;
  std::__shared_weak_count *v75;
  _QWORD *v76;
  std::__shared_weak_count *v77;
  uint64_t v78;
  std::__shared_weak_count *v79;
  __int128 v80;
  uint64_t v81;
  std::__shared_weak_count *v82;
  _QWORD *v83;
  _QWORD *v84;
  uint64_t v85;
  shared_ptr<mlcore::Predicate> result;

  v85 = *MEMORY[0x1E0C80C00];
  -[MPModelArtistKind albumKind](self, "albumKind");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "songKind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "predicateWithBaseProperty:", 0);
  }
  else
  {
    v78 = 0;
    v79 = 0;
  }

  v6 = (mlcore *)mlcore::ArtistPropertyPersistentID(v5);
  mlcore::ItemPropertyAlbumArtistPersistentID(v6);
  v7 = (std::__shared_weak_count *)operator new(0x38uLL);
  v7->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v7->__shared_owners_;
  v7->__shared_weak_owners_ = 0;
  v7->__vftable = (std::__shared_weak_count_vtbl *)&off_1E314AA30;
  v9 = mlcore::ComparisonPropertyPredicate::ComparisonPropertyPredicate();
  v76 = &v7[1].__vftable;
  v77 = v7;
  MEMORY[0x194039EC8](v9);
  v81 = v78;
  v82 = v79;
  if (v79)
  {
    v10 = (unint64_t *)&v79->__shared_owners_;
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
  v83 = &v7[1].__vftable;
  v84 = &v7->__vftable;
  do
    v12 = __ldxr(p_shared_owners);
  while (__stxr(v12 + 1, p_shared_owners));
  v70 = 0;
  v71 = 0;
  v72 = 0;
  *(_QWORD *)&v80 = &v70;
  BYTE8(v80) = 0;
  v13 = operator new(0x20uLL);
  v14 = 0;
  v15 = 0;
  v70 = v13;
  v71 = v13;
  v72 = v13 + 2;
  do
  {
    v16 = v14;
    v17 = *((_OWORD *)&v81 + v15);
    *v13 = v17;
    if (*((_QWORD *)&v17 + 1))
    {
      v18 = (unint64_t *)(*((_QWORD *)&v17 + 1) + 8);
      do
        v19 = __ldxr(v18);
      while (__stxr(v19 + 1, v18));
    }
    ++v13;
    v14 = 1;
    v15 = 1;
  }
  while ((v16 & 1) == 0);
  v71 = v13;
  mlcore::CreateAndPredicate();
  v20 = (char *)operator new(0x38uLL);
  *(_OWORD *)(v20 + 8) = 0u;
  *(_QWORD *)v20 = &off_1E314AAA0;
  v80 = v73;
  v73 = 0u;
  mlcore::Query::Query();
  v21 = (std::__shared_weak_count *)*((_QWORD *)&v80 + 1);
  if (*((_QWORD *)&v80 + 1))
  {
    v22 = (unint64_t *)(*((_QWORD *)&v80 + 1) + 8);
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  v74 = v20 + 24;
  v75 = (std::__shared_weak_count *)v20;
  v24 = (std::__shared_weak_count *)*((_QWORD *)&v73 + 1);
  if (*((_QWORD *)&v73 + 1))
  {
    v25 = (unint64_t *)(*((_QWORD *)&v73 + 1) + 8);
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  *(_QWORD *)&v80 = &v70;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v80);
  for (i = 16; i != -16; i -= 16)
    std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&v81 + i);
  v28 = operator new(0x30uLL);
  v28[1] = 0;
  v29 = v28 + 1;
  v28[2] = 0;
  *v28 = &off_1E314A7C8;
  v81 = (uint64_t)v74;
  v82 = v75;
  if (v75)
  {
    v30 = (unint64_t *)&v75->__shared_owners_;
    do
      v31 = __ldxr(v30);
    while (__stxr(v31 + 1, v30));
  }
  exists = (mlcore *)mlcore::ExistsPredicate::ExistsPredicate();
  v33 = v82;
  if (v82)
  {
    v34 = (unint64_t *)&v82->__shared_owners_;
    do
      v35 = __ldaxr(v34);
    while (__stlxr(v35 - 1, v34));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }
  *(_QWORD *)&v73 = v28 + 3;
  *((_QWORD *)&v73 + 1) = v28;
  mlcore::ArtistPropertyLikedState(exists);
  LODWORD(v81) = 2;
  v36 = (std::__shared_weak_count *)operator new(0x48uLL);
  v36->__shared_owners_ = 0;
  v37 = (unint64_t *)&v36->__shared_owners_;
  v36->__shared_weak_owners_ = 0;
  v36->__vftable = (std::__shared_weak_count_vtbl *)&off_1E314A918;
  v68 = mlcore::ComparisonPredicate<int>::ComparisonPredicate();
  v69 = v36;
  v81 = v68;
  v82 = v36;
  do
    v38 = __ldxr(v37);
  while (__stxr(v38 + 1, v37));
  v83 = v28 + 3;
  v84 = v28;
  do
    v39 = __ldxr(v29);
  while (__stxr(v39 + 1, v29));
  v65 = 0;
  v66 = 0;
  v67 = 0;
  *(_QWORD *)&v80 = &v65;
  BYTE8(v80) = 0;
  v40 = operator new(0x20uLL);
  v41 = 0;
  v42 = 0;
  v65 = v40;
  v66 = v40;
  v67 = v40 + 2;
  do
  {
    v43 = v41;
    v44 = *((_OWORD *)&v81 + v42);
    *v40 = v44;
    if (*((_QWORD *)&v44 + 1))
    {
      v45 = (unint64_t *)(*((_QWORD *)&v44 + 1) + 8);
      do
        v46 = __ldxr(v45);
      while (__stxr(v46 + 1, v45));
    }
    ++v40;
    v41 = 1;
    v42 = 1;
  }
  while ((v43 & 1) == 0);
  v66 = v40;
  mlcore::CreateOrPredicate();
  *(_QWORD *)&v80 = &v65;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v80);
  for (j = 16; j != -16; j -= 16)
    v48 = (Predicate *)std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&v81 + j);
  v50 = v69;
  if (v69)
  {
    v51 = (unint64_t *)&v69->__shared_owners_;
    do
      v52 = __ldaxr(v51);
    while (__stlxr(v52 - 1, v51));
    if (!v52)
    {
      ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
      std::__shared_weak_count::__release_weak(v50);
    }
  }
  v53 = (std::__shared_weak_count *)*((_QWORD *)&v73 + 1);
  if (*((_QWORD *)&v73 + 1))
  {
    v54 = (unint64_t *)(*((_QWORD *)&v73 + 1) + 8);
    do
      v55 = __ldaxr(v54);
    while (__stlxr(v55 - 1, v54));
    if (!v55)
    {
      ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
      std::__shared_weak_count::__release_weak(v53);
    }
  }
  v56 = v75;
  if (v75)
  {
    v57 = (unint64_t *)&v75->__shared_owners_;
    do
      v58 = __ldaxr(v57);
    while (__stlxr(v58 - 1, v57));
    if (!v58)
    {
      ((void (*)(std::__shared_weak_count *))v56->__on_zero_shared)(v56);
      std::__shared_weak_count::__release_weak(v56);
    }
  }
  v59 = v77;
  if (v77)
  {
    v60 = (unint64_t *)&v77->__shared_owners_;
    do
      v61 = __ldaxr(v60);
    while (__stlxr(v61 - 1, v60));
    if (!v61)
    {
      ((void (*)(std::__shared_weak_count *))v59->__on_zero_shared)(v59);
      std::__shared_weak_count::__release_weak(v59);
    }
  }
  v62 = v79;
  if (v79)
  {
    v63 = (unint64_t *)&v79->__shared_owners_;
    do
      v64 = __ldaxr(v63);
    while (__stlxr(v64 - 1, v63));
    if (!v64)
    {
      ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
      std::__shared_weak_count::__release_weak(v62);
    }
  }
  result.var1 = v49;
  result.var0 = v48;
  return result;
}

@end
