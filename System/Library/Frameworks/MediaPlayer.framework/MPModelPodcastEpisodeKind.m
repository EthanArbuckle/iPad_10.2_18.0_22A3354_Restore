@implementation MPModelPodcastEpisodeKind

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
  ModelPropertyBase *HasBeenPlayed;
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
  if ((-[MPModelPodcastEpisodeKind variants](self, "variants") & 1) != 0)
  {
    v5 = (char *)operator new(4uLL);
    *(_DWORD *)v5 = 4;
    v61 = v5 + 4;
    v62 = v5 + 4;
    __p = v5;
  }
  v6 = -[MPModelPodcastEpisodeKind variants](self, "variants");
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
      *(_DWORD *)v15 = 256;
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
      *(_DWORD *)v61 = 256;
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
  v34 = -[MPModelPodcastEpisodeKind options](self, "options", v53);
  if ((v34 & 1) != 0)
  {
    HasBeenPlayed = (ModelPropertyBase *)mlcore::ItemPropertyHasBeenPlayed(v34);
    if (a3)
      MPMediaLibraryGetProperty((ModelPropertyBase *)a3, HasBeenPlayed);
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

- (id)humanDescription
{
  void *v3;
  void *v4;
  unint64_t variants;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("podcasts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  variants = self->_variants;
  if ((variants & 1) != 0)
  {
    objc_msgSend(v3, "insertString:atIndex:", CFSTR("audio "), 0);
    if ((self->_variants & 2) == 0)
      goto LABEL_7;
    objc_msgSend(v4, "insertString:atIndex:", CFSTR(" or "), 0);
    goto LABEL_6;
  }
  if ((variants & 2) != 0)
LABEL_6:
    objc_msgSend(v4, "insertString:atIndex:", CFSTR("video "), 0);
LABEL_7:
  if ((self->_options & 1) != 0)
    objc_msgSend(v4, "insertString:atIndex:", CFSTR("unplayed "), 0);
  return v4;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPModelPodcastEpisodeKind;
  return self->_variants ^ -[MPModelKind hash](&v3, sel_hash) ^ self->_options;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MPModelPodcastEpisodeKind;
  v5 = -[MPModelKind isEqual:](&v7, sel_isEqual_, v4) && self->_variants == v4[2] && self->_options == v4[3];

  return v5;
}

- (MPModelPodcastEpisodeKind)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  MPModelPodcastEpisodeKind *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("variants"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("options"));

  +[MPModelPodcastEpisodeKind kindWithVariants:options:](MPModelPodcastEpisodeKind, "kindWithVariants:options:", v5, v6);
  v7 = (MPModelPodcastEpisodeKind *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPModelPodcastEpisodeKind;
  v4 = a3;
  -[MPModelKind encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_variants, CFSTR("variants"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_options, CFSTR("options"));

}

- (unint64_t)variants
{
  return self->_variants;
}

- (unint64_t)options
{
  return self->_options;
}

+ (id)identityKind
{
  return +[MPModelKind kindWithModelClass:](MPModelKind, "kindWithModelClass:", objc_opt_class());
}

+ (MPModelPodcastEpisodeKind)kindWithVariants:(unint64_t)a3 options:(unint64_t)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[6];

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PodcastEpisode:v%lu:o%lu"), a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__MPModelPodcastEpisodeKind_kindWithVariants_options___block_invoke;
  v11[3] = &__block_descriptor_48_e35_v16__0__MPModelPodcastEpisodeKind_8l;
  v11[4] = a3;
  v11[5] = a4;
  objc_msgSend(a1, "kindWithModelClass:cacheKey:block:", v8, v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPModelPodcastEpisodeKind *)v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __54__MPModelPodcastEpisodeKind_kindWithVariants_options___block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(a2 + 16) = *(_QWORD *)(result + 32);
  *(_QWORD *)(a2 + 24) = *(_QWORD *)(result + 40);
  return result;
}

@end
