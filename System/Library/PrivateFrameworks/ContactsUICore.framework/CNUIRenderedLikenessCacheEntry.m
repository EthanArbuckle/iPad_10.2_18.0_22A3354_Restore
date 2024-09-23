@implementation CNUIRenderedLikenessCacheEntry

- (CNObservable)imageObservable
{
  return self->_imageObservable;
}

- (CNUILikenessRenderingScope)scope
{
  return self->_scope;
}

- (NSArray)contacts
{
  return self->_contacts;
}

+ (id)entryWithObservable:(id)a3 token:(id)a4 contacts:(id)a5 scope:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithObservable:token:contacts:scope:", v13, v12, v11, v10);

  return v14;
}

- (CNUIRenderedLikenessCacheEntry)initWithObservable:(id)a3 token:(id)a4 contacts:(id)a5 scope:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CNUIRenderedLikenessCacheEntry *v15;
  CNUIRenderedLikenessCacheEntry *v16;
  CNUIRenderedLikenessCacheEntry *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CNUIRenderedLikenessCacheEntry;
  v15 = -[CNUIRenderedLikenessCacheEntry init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_token, a4);
    objc_storeStrong((id *)&v16->_scope, a6);
    objc_storeStrong((id *)&v16->_contacts, a5);
    objc_storeStrong((id *)&v16->_imageObservable, a3);
    v17 = v16;
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_imageObservable, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIRenderedLikenessCacheEntry contacts](self, "contacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_map:", &__block_literal_global_15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("contacts"), v6);
  -[CNUIRenderedLikenessCacheEntry scope](self, "scope");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("scope"), v9);

  objc_msgSend(v3, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __45__CNUIRenderedLikenessCacheEntry_description__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (CNCancelable)token
{
  return self->_token;
}

@end
