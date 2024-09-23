@implementation MPModelKind

- (BOOL)isEqual:(id)a3
{
  MPModelKind *v4;
  MPModelKind *v5;
  objc_class *v6;
  uint64_t v7;
  BOOL v8;

  v4 = (MPModelKind *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else if (-[MPModelKind isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = -[MPModelKind modelClass](self, "modelClass");
    v7 = -[MPModelKind modelClass](v5, "modelClass");

    v8 = v6 == (objc_class *)v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (Class)modelClass
{
  return self->_modelClass;
}

- (MPModelKind)identityKind
{
  uint64_t v3;
  MPModelKind *v4;

  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    v4 = self;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "identityKind");
    v4 = (MPModelKind *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (MPModelKind)kindWithModelClass:(Class)a3
{
  return (MPModelKind *)objc_msgSend(a1, "_kindWithModelClass:cacheKey:block:", a3, a3, &__block_literal_global_196);
}

+ (id)_kindWithModelClass:(Class)a3 cacheKey:(id)a4 block:(id)a5
{
  id v9;
  void (**v10)(id, void *);
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v16;

  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  os_unfair_lock_lock((os_unfair_lock_t)&_kindWithModelClass_cacheKey_block____lock);
  objc_msgSend((id)_kindWithModelClass_cacheKey_block____kinds, "objectForKeyedSubscript:", v9);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    os_unfair_lock_unlock((os_unfair_lock_t)&_kindWithModelClass_cacheKey_block____lock);
  }
  else
  {
    if (!_kindWithModelClass_cacheKey_block____kinds)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 50);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)_kindWithModelClass_cacheKey_block____kinds;
      _kindWithModelClass_cacheKey_block____kinds = v13;

    }
    v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithModelClass:", a3);
    v10[2](v10, v12);
    objc_msgSend((id)_kindWithModelClass_cacheKey_block____kinds, "setObject:forKeyedSubscript:", v12, v9);
    os_unfair_lock_unlock((os_unfair_lock_t)&_kindWithModelClass_cacheKey_block____lock);
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelObject.m"), 669, CFSTR("Must have produced a model kind!"));

    }
  }

  return v12;
}

- (id)_initWithModelClass:(Class)a3
{
  MPModelKind *v4;
  MPModelKind *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPModelKind;
  v4 = -[MPModelKind init](&v7, sel_init);
  v5 = v4;
  if (v4)
    objc_storeStrong((id *)&v4->_modelClass, a3);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)applyToView:(shared_ptr<mlcore:(id)a4 :LibraryView>)a3 withContext:
{
  __shared_weak_count *v5;
  void *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  _OWORD *v11;
  char v12;
  uint64_t v13;
  char v14;
  __int128 v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  uint64_t i;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  void **v28;
  char v29;
  _OWORD *v30;
  _OWORD *v31;
  _OWORD *v32;
  std::__shared_weak_count *v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  uint64_t v36;
  std::__shared_weak_count *v37;
  _QWORD v38[8];

  v38[7] = *MEMORY[0x1E0C80C00];
  v5 = a3.var1;
  +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", -[MPModelKind modelClass](self, "modelClass"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelKind predicateWithBaseProperty:](self, "predicateWithBaseProperty:", 0);
  objc_msgSend(v6, "entityClass");
  mlcore::LibraryView::filterPredicateForEntityClass();
  objc_msgSend(v6, "entityClass");
  v38[0] = v36;
  v38[1] = v37;
  if (v37)
  {
    p_shared_owners = (unint64_t *)&v37->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  v38[2] = v34;
  v38[3] = v35;
  if (v35)
  {
    v9 = (unint64_t *)&v35->__shared_owners_;
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  v30 = 0;
  v31 = 0;
  v32 = 0;
  v28 = (void **)&v30;
  v29 = 0;
  v11 = operator new(0x20uLL);
  v12 = 0;
  v13 = 0;
  v30 = v11;
  v31 = v11;
  v32 = v11 + 2;
  do
  {
    v14 = v12;
    v15 = *(_OWORD *)&v38[2 * v13];
    *v11 = v15;
    if (*((_QWORD *)&v15 + 1))
    {
      v16 = (unint64_t *)(*((_QWORD *)&v15 + 1) + 8);
      do
        v17 = __ldxr(v16);
      while (__stxr(v17 + 1, v16));
    }
    ++v11;
    v12 = 1;
    v13 = 1;
  }
  while ((v14 & 1) == 0);
  v31 = v11;
  mlcore::CreateAndPredicate();
  mlcore::LibraryView::setFilterPredicateForEntityClass();
  v18 = v33;
  if (v33)
  {
    v19 = (unint64_t *)&v33->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v28 = (void **)&v30;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v28);
  for (i = 2; i != -2; i -= 2)
    std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&v38[i]);
  v22 = v35;
  if (v35)
  {
    v23 = (unint64_t *)&v35->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  v25 = v37;
  if (v37)
  {
    v26 = (unint64_t *)&v37->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }

}

- (shared_ptr<mlcore::Predicate>)predicateWithBaseProperty:(void *)a3
{
  _QWORD *v3;
  shared_ptr<mlcore::Predicate> result;

  *v3 = 0;
  v3[1] = 0;
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (Predicate *)self;
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MPModelKind humanDescription](self, "humanDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)humanDescription
{
  return NSStringFromClass(self->_modelClass);
}

+ (MPModelKind)unknownKind
{
  return (MPModelKind *)-[MPModelKind _initWithModelClass:]([MPModelKind alloc], "_initWithModelClass:", objc_opt_class());
}

- (MPModelKind)initWithCoder:(id)a3
{
  id v4;
  MPModelKind *v5;
  NSString *v6;
  uint64_t v7;
  Class modelClass;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MPModelKind;
  v5 = -[MPModelKind init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modelClass"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(v6);
    v7 = objc_claimAutoreleasedReturnValue();
    modelClass = v5->_modelClass;
    v5->_modelClass = (Class)v7;

  }
  return v5;
}

- (unint64_t)hash
{
  return -[objc_class hash](self->_modelClass, "hash") ^ 0x8542043BLL;
}

- (void)encodeWithCoder:(id)a3
{
  objc_class *modelClass;
  id v4;
  id v5;

  modelClass = self->_modelClass;
  v4 = a3;
  NSStringFromClass(modelClass);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("modelClass"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelClass, 0);
}

+ (MPModelKind)identityKind
{
  uint64_t v4;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  v4 = objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2);
  if (v4 == objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelObject.m"), 587, CFSTR("Subclass %@ must implement -%@ defined in %@."), v8, v9, CFSTR("[MPModelKind class]"));

  }
  return (MPModelKind *)-[MPModelKind _initWithModelClass:]([MPModelKind alloc], "_initWithModelClass:", objc_opt_class());
}

- (shared_ptr<mlcore::Predicate>)representedSearchScopePredicate
{
  _QWORD *v2;
  shared_ptr<mlcore::Predicate> result;

  *v2 = 0;
  v2[1] = 0;
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (Predicate *)self;
  return result;
}

@end
