@implementation MPModelLibrarySearchScope

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MPModelLibrarySearchScope)initWithItemKind:(id)a3 name:(id)a4 properties:(id)a5
{
  id v9;
  id v10;
  id v11;
  MPModelLibrarySearchScope *v12;
  MPModelLibrarySearchScope *v13;
  uint64_t v14;
  MPPropertySet *itemProperties;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[MPModelLibrarySearchScope init](self, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_itemKind, a3);
    objc_storeStrong((id *)&v13->_name, a4);
    v14 = objc_msgSend(v11, "copy");
    itemProperties = v13->_itemProperties;
    v13->_itemProperties = (MPPropertySet *)v14;

  }
  return v13;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  MPPropertySet *itemProperties;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  -[MPModelKind description](self->_itemKind, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("; itemKind = %@"), v7);

  if (self->_name)
    objc_msgSend(v6, "appendFormat:", CFSTR("; name = %@"), self->_name);
  itemProperties = self->_itemProperties;
  if (itemProperties)
  {
    -[MPPropertySet description](itemProperties, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("; itemProperties = %@"), v9);

  }
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  MPModelLibrarySearchScope *v4;
  MPModelLibrarySearchScope *v5;
  MPModelLibrarySearchScope *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  char v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  id v22;
  id v23;

  v4 = (MPModelLibrarySearchScope *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    -[MPModelLibrarySearchScope itemKind](self, "itemKind");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelLibrarySearchScope itemKind](v6, "itemKind");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    if (v9 == v10)
    {

    }
    else
    {
      v11 = v10;
      v12 = objc_msgSend(v9, "isEqual:", v10);

      if ((v12 & 1) == 0)
        goto LABEL_9;
    }
    -[MPModelLibrarySearchScope name](self, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelLibrarySearchScope name](v6, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v14;
    v17 = v15;
    if (v16 == v17)
    {

    }
    else
    {
      v18 = v17;
      v19 = objc_msgSend(v16, "isEqual:", v17);

      if ((v19 & 1) == 0)
      {
LABEL_9:
        v13 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    -[MPModelLibrarySearchScope itemProperties](self, "itemProperties");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelLibrarySearchScope itemProperties](v6, "itemProperties");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v20;
    v23 = v21;
    if (v22 == v23)
      v13 = 1;
    else
      v13 = objc_msgSend(v22, "isEqual:", v23);

    goto LABEL_15;
  }
  v13 = 1;
LABEL_16:

  return v13;
}

- (MPModelLibrarySearchScope)initWithCoder:(id)a3
{
  id v4;
  MPModelLibrarySearchScope *v5;
  uint64_t v6;
  MPModelKind *itemKind;
  uint64_t v8;
  NSString *name;
  uint64_t v10;
  MPPropertySet *itemProperties;

  v4 = a3;
  v5 = -[MPModelLibrarySearchScope init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPModelLibrarySearchScopeItemKind"));
    v6 = objc_claimAutoreleasedReturnValue();
    itemKind = v5->_itemKind;
    v5->_itemKind = (MPModelKind *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPModelLibrarySearchScopeName"));
    v8 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPModelLibrarySearchScopeItemProperties"));
    v10 = objc_claimAutoreleasedReturnValue();
    itemProperties = v5->_itemProperties;
    v5->_itemProperties = (MPPropertySet *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_itemKind, CFSTR("MPModelLibrarySearchScopeItemKind"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, CFSTR("MPModelLibrarySearchScopeName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_itemProperties, CFSTR("MPModelLibrarySearchScopeItemProperties"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  __shared_weak_count *cntrl;
  LocalizedSearchScope *ptr;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 24), self->_itemKind);
    objc_storeStrong((id *)(v5 + 32), self->_name);
    objc_storeStrong((id *)(v5 + 40), self->_itemProperties);
    ptr = self->_coreScope.__ptr_;
    cntrl = self->_coreScope.__cntrl_;
    if (cntrl)
    {
      v8 = (unint64_t *)((char *)cntrl + 8);
      do
        v9 = __ldxr(v8);
      while (__stxr(v9 + 1, v8));
    }
    v10 = *(std::__shared_weak_count **)(v5 + 16);
    *(_QWORD *)(v5 + 8) = ptr;
    *(_QWORD *)(v5 + 16) = cntrl;
    if (v10)
    {
      p_shared_owners = (unint64_t *)&v10->__shared_owners_;
      do
        v12 = __ldaxr(p_shared_owners);
      while (__stlxr(v12 - 1, p_shared_owners));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
  }
  return (id)v5;
}

- (shared_ptr<mlcore::LocalizedSearchScope>)coreScope
{
  LocalizedSearchScope **v2;
  MPModelLibrarySearchScope *v3;
  LocalizedSearchScope **v4;
  LocalizedSearchScope *ptr;
  shared_ptr<mlcore::LocalizedSearchScope> *p_coreScope;
  MPModelKind *v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  __shared_weak_count *cntrl;
  unint64_t *v19;
  unint64_t v20;
  __int128 v21;
  _QWORD v22[5];
  id v23;
  __int128 *v24;
  SEL v25;
  __int128 v26;
  uint64_t v27;
  __n128 (*v28)(__n128 *, __n128 *);
  void (*v29)(uint64_t);
  void *v30;
  _QWORD v31[3];
  shared_ptr<mlcore::LocalizedSearchScope> result;

  v3 = self;
  v4 = v2;
  p_coreScope = &self->_coreScope;
  ptr = self->_coreScope.__ptr_;
  if (!ptr)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v3->_itemKind;
      *(_QWORD *)&v26 = 0;
      *((_QWORD *)&v26 + 1) = &v26;
      v27 = 0x4812000000;
      v28 = __Block_byref_object_copy__4988;
      v29 = __Block_byref_object_dispose__4989;
      v30 = &unk_193F4554F;
      memset(v31, 0, sizeof(v31));
      -[MPModelKind relationshipKinds](v8, "relationshipKinds");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __38__MPModelLibrarySearchScope_coreScope__block_invoke_21;
      v22[3] = &unk_1E31540E8;
      v22[4] = v3;
      v23 = &__block_literal_global_4991;
      v24 = &v26;
      v25 = a2;
      objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v22);

      v10 = *((_QWORD *)&v26 + 1);
      v11 = operator new(0x60uLL);
      v11[1] = 0;
      v11[2] = 0;
      *v11 = &off_1E314A9C0;
      *(_QWORD *)&v21 = MEMORY[0x194039244](v11 + 3, v10 + 48);
      *((_QWORD *)&v21 + 1) = v11;
      std::shared_ptr<mlcore::LocalizedSearchScope>::operator=[abi:ne180100]((uint64_t)p_coreScope, &v21);
      v12 = (std::__shared_weak_count *)*((_QWORD *)&v21 + 1);
      if (*((_QWORD *)&v21 + 1))
      {
        v13 = (unint64_t *)(*((_QWORD *)&v21 + 1) + 8);
        do
          v14 = __ldaxr(v13);
        while (__stlxr(v14 - 1, v13));
        if (!v14)
        {
          ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
          std::__shared_weak_count::__release_weak(v12);
        }
      }

      _Block_object_dispose(&v26, 8);
      *(_QWORD *)&v21 = v31;
      std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v21);

    }
    else
    {
      __38__MPModelLibrarySearchScope_coreScope__block_invoke(v3->_itemKind, v3->_itemProperties, &v26);
      self = (MPModelLibrarySearchScope *)std::shared_ptr<mlcore::LocalizedSearchScope>::operator=[abi:ne180100]((uint64_t)p_coreScope, &v26);
      v15 = (std::__shared_weak_count *)*((_QWORD *)&v26 + 1);
      if (*((_QWORD *)&v26 + 1))
      {
        v16 = (unint64_t *)(*((_QWORD *)&v26 + 1) + 8);
        do
          v17 = __ldaxr(v16);
        while (__stlxr(v17 - 1, v16));
        if (!v17)
        {
          ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
          std::__shared_weak_count::__release_weak(v15);
        }
      }
    }
    ptr = p_coreScope->__ptr_;
  }
  cntrl = v3->_coreScope.__cntrl_;
  *v4 = ptr;
  v4[1] = (LocalizedSearchScope *)cntrl;
  if (cntrl)
  {
    v19 = (unint64_t *)((char *)cntrl + 8);
    do
      v20 = __ldxr(v19);
    while (__stxr(v20 + 1, v19));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (LocalizedSearchScope *)self;
  return result;
}

- (MPModelKind)itemKind
{
  return self->_itemKind;
}

- (void)setItemKind:(id)a3
{
  objc_storeStrong((id *)&self->_itemKind, a3);
}

- (NSString)name
{
  return self->_name;
}

- (MPPropertySet)itemProperties
{
  return self->_itemProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemProperties, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_itemKind, 0);
  std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&self->_coreScope);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

void __38__MPModelLibrarySearchScope_coreScope__block_invoke_21(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  void *v13;
  __int128 v14;

  v5 = a2;
  v6 = a3;
  v7 = a1[5];
  objc_msgSend(*(id *)(a1[4] + 40), "relationships");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(__int128 *__return_ptr, uint64_t, id, void *))(v7 + 16))(&v14, v7, v6, v9);

  if (!(_QWORD)v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a1[7], a1[4], CFSTR("MPModelLibrarySearchScope.mm"), 121, CFSTR("Couldn't create scope for modelKind: %@"), v6);

  }
  std::vector<std::shared_ptr<mlcore::LocalizedSearchScope>>::push_back[abi:ne180100]((char **)(*(_QWORD *)(a1[6] + 8) + 48), &v14);
  v10 = (std::__shared_weak_count *)*((_QWORD *)&v14 + 1);
  if (*((_QWORD *)&v14 + 1))
  {
    v11 = (unint64_t *)(*((_QWORD *)&v14 + 1) + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }

}

void __38__MPModelLibrarySearchScope_coreScope__block_invoke(void *a1@<X1>, void *a2@<X2>, _QWORD *a3@<X8>)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  char *v9;
  __int128 v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  void *__p;
  void *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;

  v5 = a1;
  v6 = a2;
  +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", objc_msgSend(v5, "modelClass"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "entityClass");
  if (!v8)
  {
    *a3 = 0;
    a3[1] = 0;
    goto LABEL_20;
  }
  if (v5)
  {
    objc_msgSend(v5, "representedSearchScopePredicate");
    if (v7)
    {
LABEL_4:
      objc_msgSend(v7, "MLCorePropertiesForPropertySet:", v6);
      goto LABEL_8;
    }
  }
  else
  {
    v20 = 0uLL;
    if (v7)
      goto LABEL_4;
  }
  __p = 0;
  v18 = 0;
  v19 = 0;
LABEL_8:
  v9 = (char *)operator new(0x60uLL);
  *(_OWORD *)(v9 + 8) = 0u;
  *(_QWORD *)v9 = &off_1E314A9C0;
  v10 = v20;
  v20 = 0u;
  v21 = v10;
  MEMORY[0x194039238](v9 + 24, v8, &v21, &__p);
  v11 = (std::__shared_weak_count *)*((_QWORD *)&v21 + 1);
  if (*((_QWORD *)&v21 + 1))
  {
    v12 = (unint64_t *)(*((_QWORD *)&v21 + 1) + 8);
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  *a3 = v9 + 24;
  a3[1] = v9;
  if (__p)
  {
    v18 = __p;
    operator delete(__p);
  }
  v14 = (std::__shared_weak_count *)*((_QWORD *)&v20 + 1);
  if (*((_QWORD *)&v20 + 1))
  {
    v15 = (unint64_t *)(*((_QWORD *)&v20 + 1) + 8);
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
LABEL_20:

}

@end
