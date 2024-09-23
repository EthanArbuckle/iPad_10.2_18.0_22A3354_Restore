@implementation MPModelTVSeasonKind

void __43__MPModelTVSeasonKind_kindWithEpisodeKind___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(a2 + 16), *(id *)(a1 + 32));
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
  -[MPModelTVSeasonKind episodeKind](self, "episodeKind");
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

- (MPModelTVEpisodeKind)episodeKind
{
  return self->_episodeKind;
}

- (id)humanDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[MPModelTVEpisodeKind humanDescription](self->_episodeKind, "humanDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("seasons with %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)kindWithEpisodeKind:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TVSeason:e%p"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__MPModelTVSeasonKind_kindWithEpisodeKind___block_invoke;
  v10[3] = &unk_1E315F5B0;
  v11 = v4;
  v7 = v4;
  objc_msgSend(a1, "kindWithModelClass:cacheKey:block:", v6, v5, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)identityKind
{
  return +[MPModelKind kindWithModelClass:](MPModelKind, "kindWithModelClass:", objc_opt_class());
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPModelTVSeasonKind;
  v3 = -[MPModelKind hash](&v5, sel_hash);
  return -[MPModelTVEpisodeKind hash](self->_episodeKind, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MPModelTVSeasonKind;
  if (-[MPModelKind isEqual:](&v7, sel_isEqual_, v4))
    v5 = -[MPModelTVEpisodeKind isEqual:](self->_episodeKind, "isEqual:", v4[2]);
  else
    v5 = 0;

  return v5;
}

- (MPModelTVSeasonKind)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MPModelTVSeasonKind *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("episodeKind"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[MPModelTVSeasonKind kindWithEpisodeKind:](MPModelTVSeasonKind, "kindWithEpisodeKind:", v5);
    v6 = (MPModelTVSeasonKind *)objc_claimAutoreleasedReturnValue();
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
  v5.super_class = (Class)MPModelTVSeasonKind;
  v4 = a3;
  -[MPModelKind encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_episodeKind, CFSTR("episodeKind"), v5.receiver, v5.super_class);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_episodeKind, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
