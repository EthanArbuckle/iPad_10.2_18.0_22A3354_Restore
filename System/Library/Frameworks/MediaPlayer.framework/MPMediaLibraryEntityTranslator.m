@implementation MPMediaLibraryEntityTranslator

+ (id)_translatorForMPModelClass:(Class)a3 mlcoreEntityClass:(void *)a4 create:(BOOL)a5 transient:(BOOL)a6
{
  _BOOL4 v7;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id *v15;
  id *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v7 = a5;
  if (a3)
  {
    if (_MPMLInitTranslatorDictionaries(void)::onceToken != -1)
      dispatch_once(&_MPMLInitTranslatorDictionaries(void)::onceToken, &__block_literal_global_291);
    v11 = (void *)MPModelToTranslatorDictionary;
    NSStringFromClass(a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (a4)
  {
    if (_MPMLInitTranslatorDictionaries(void)::onceToken != -1)
      dispatch_once(&_MPMLInitTranslatorDictionaries(void)::onceToken, &__block_literal_global_291);
    v14 = (void *)MLEntityClassToTranslatorDictionary;
    _MPMLKeyForEntityClass((uint64_t)a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v15 = (id *)v13;

    v16 = v15;
    if (v15)
      return v16;
    goto LABEL_10;
  }
  v16 = 0;
LABEL_10:
  if (v7)
  {
    if (a4)
      v17 = 1;
    else
      v17 = a6;
    if (!a3 || !v17)
      __assert_rtn("+[MPMediaLibraryEntityTranslator _translatorForMPModelClass:mlcoreEntityClass:create:transient:]", "MPMediaLibraryEntityTranslator.mm", 162, "MPModelClass && (entityClass || transient)");
    if (_MPMLInitTranslatorDictionaries(void)::onceToken != -1)
      dispatch_once(&_MPMLInitTranslatorDictionaries(void)::onceToken, &__block_literal_global_291);
    v16 = (id *)objc_alloc_init((Class)a1);
    objc_storeStrong(v16 + 4, a3);
    v16[5] = a4;
    *((_BYTE *)v16 + 24) = a6;
    v18 = (void *)MPModelToTranslatorDictionary;
    NSStringFromClass(a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v16, v19);

    if (a4)
    {
      v20 = (void *)MLEntityClassToTranslatorDictionary;
      _MPMLKeyForEntityClass((uint64_t)a4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKey:", v16, v21);

    }
  }
  return v16;
}

+ (id)translatorForMPModelClass:(Class)a3
{
  if (MPMLCoreInitialize(void)::onceToken != -1)
    dispatch_once(&MPMLCoreInitialize(void)::onceToken, &__block_literal_global_43387);
  return (id)objc_msgSend(a1, "_translatorForMPModelClass:mlcoreEntityClass:create:transient:", a3, 0, 0, 0);
}

- (id)identifiersForPropertyCache:(const void *)a3 context:(id)a4
{
  -[MPMediaLibraryEntityTranslator _valueForKeyPath:forPropertyCache:context:](self, "_valueForKeyPath:forPropertyCache:context:", &unk_1E31E6508, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_valueForKeyPath:(id)a3 forPropertyCache:(const void *)a4 context:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  void *v19;
  void *v20;
  uint64_t v21;
  std::__shared_weak_count *v22;

  v9 = a3;
  v10 = a5;
  -[MPMediaLibraryEntityTranslator _propertyTranslatorForKeyPath:](self, "_propertyTranslatorForKeyPath:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(-[MPMediaLibraryEntityTranslator MPModelClass](self, "MPModelClass"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaLibraryEntityTranslator.mm"), 573, CFSTR("Property mapping missing for %@:%@"), v20, v9);

  }
  objc_msgSend(v11, "valueTransformer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[MPMediaLibraryEntityTranslator _propertyMapForKeyPath:includePropertiesToSort:](self, "_propertyMapForKeyPath:includePropertiesToSort:", v9, 0);
    objc_msgSend(v11, "valueTransformer");
    v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, uint64_t, const void *))v13)[2](v13, v10, v21, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v22;
    if (v22)
    {
      p_shared_owners = (unint64_t *)&v22->__shared_owners_;
      do
        v17 = __ldaxr(p_shared_owners);
      while (__stlxr(v17 - 1, p_shared_owners));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (shared_ptr<std::unordered_map<std::string,)_propertyMapForKeyPath:(id)a3 includePropertiesToSort:(BOOL)a4
{
  uint64_t *v4;
  _BOOL4 v5;
  uint64_t *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  id *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t *p_shared_owners;
  unint64_t v20;
  id *v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  unsigned __int8 *v25;
  void **v26;
  void *v27;
  void *v28;
  ModelPropertyBase *v29;
  void *v30;
  _QWORD *v31;
  __int128 v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  __shared_weak_count *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  std::__shared_weak_count *v46;
  void *v47;
  uint64_t v48;
  std::__shared_weak_count *v49;
  void *__p[2];
  void *v51;
  _QWORD v52[3];
  _QWORD v53[4];
  shared_ptr<std::unordered_map<std::string, mlcore::ModelPropertyBase *>> result;

  v5 = a4;
  v8 = v4;
  v53[3] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if ((unint64_t)objc_msgSend(v9, "count") >= 2)
  {
    v53[0] = CFSTR("MPModelRelationshipPlaylistEntrySong");
    v53[1] = CFSTR("MPModelRelationshipPlaylistEntryTVEpisode");
    v53[2] = CFSTR("MPModelRelationshipPlaylistEntryMovie");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v9, "count") - 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "containsObject:", v11);

    if (v12)
    {
      +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", objc_opt_class());
      v13 = (id *)objc_claimAutoreleasedReturnValue();
      v52[0] = CFSTR("MPModelPropertySongArtwork");
      v52[1] = CFSTR("MPModelPropertyTVEpisodeArtwork");
      v52[2] = CFSTR("MPModelPropertyMovieArtwork");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "containsObject:", v15);

      if (v16)
      {
        objc_msgSend(v13[1], "objectForKeyedSubscript:", CFSTR("_MPModelPropertyPlaylistEntryArtwork"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
        {
          objc_msgSend(v17, "propertiesToFetchMap");
          if (v46)
          {
            p_shared_owners = &v46->__shared_owners_;
            do
              v20 = __ldaxr((unint64_t *)p_shared_owners);
            while (__stlxr(v20 - 1, (unint64_t *)p_shared_owners));
            if (!v20)
            {
              ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
              std::__shared_weak_count::__release_weak(v46);
            }
          }
          if (v45)
            goto LABEL_11;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromClass(-[MPMediaLibraryEntityTranslator MPModelClass](self, "MPModelClass"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaLibraryEntityTranslator.mm"), 543, CFSTR("Property mapping missing for %@:%@"), v42, CFSTR("_MPModelPropertyPlaylistEntryArtwork"));

        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromClass(-[MPMediaLibraryEntityTranslator MPModelClass](self, "MPModelClass"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaLibraryEntityTranslator.mm"), 544, CFSTR("Property translator mapping missing for %@:%@"), v44, CFSTR("_MPModelPropertyPlaylistEntryArtwork"));

        if (!v18)
        {
          *v8 = 0;
          v8[1] = 0;
          goto LABEL_12;
        }
LABEL_11:
        objc_msgSend(v18, "propertiesToFetchMap");
LABEL_12:

        goto LABEL_39;
      }

    }
  }
  -[MPMediaLibraryEntityTranslator _propertyTranslatorForKeyPath:](self, "_propertyTranslatorForKeyPath:", v9);
  v21 = (id *)objc_claimAutoreleasedReturnValue();
  v13 = v21;
  if (v21)
  {
    objc_msgSend(v21, "propertiesToFetchMap");
    if (!v5)
      goto LABEL_16;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(-[MPMediaLibraryEntityTranslator MPModelClass](self, "MPModelClass"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaLibraryEntityTranslator.mm"), 551, CFSTR("Property mapping missing for %@:%@"), v40, v9);

    *v8 = 0;
    v8[1] = 0;
    if (!v5)
    {
LABEL_16:
      if ((unint64_t)objc_msgSend(v9, "count") < 2)
        goto LABEL_39;
    }
  }
  std::unordered_map<std::string,mlcore::ModelPropertyBase *>::unordered_map((uint64_t)&v45, *v8);
  if (v5)
  {
    objc_msgSend(v13, "propertiesToSortMap");
    std::unordered_map<std::string,mlcore::ModelPropertyBase *>::unordered_map((uint64_t)__p, v48);
    v22 = v49;
    if (v49)
    {
      v23 = (unint64_t *)&v49->__shared_owners_;
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
    v25 = (unsigned __int8 *)v51;
    if (v51)
    {
      do
      {
        std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,mlcore::ModelPropertyBase *> const&>((uint64_t)&v45, v25 + 16, (uint64_t)(v25 + 16));
        v25 = *(unsigned __int8 **)v25;
      }
      while (v25);
      v26 = (void **)v51;
    }
    else
    {
      v26 = 0;
    }
    std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__deallocate_node(v26);
    v27 = __p[0];
    __p[0] = 0;
    if (v27)
      operator delete(v27);
  }
  if ((unint64_t)objc_msgSend(v9, "count") >= 2)
  {
    objc_msgSend(v9, "subarrayWithRange:", 0, objc_msgSend(v9, "count") - 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[MPMediaLibraryEntityTranslator _propertyForKeyPath:](self, "_propertyForKeyPath:", v28);

    _MPMLGetForeignPropertyMap((uint64_t)__p, v29, (uint64_t)&v45);
    std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__move_assign((uint64_t)&v45, (uint64_t *)__p);
    std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__deallocate_node((void **)v51);
    v30 = __p[0];
    __p[0] = 0;
    if (v30)
      operator delete(v30);
  }
  v31 = operator new(0x40uLL);
  v31[1] = 0;
  v31[2] = 0;
  *v31 = &off_1E314ABB8;
  *(_QWORD *)&v32 = std::unordered_map<std::string,mlcore::ModelPropertyBase *>::unordered_map((uint64_t)(v31 + 3), (uint64_t)&v45);
  *((_QWORD *)&v32 + 1) = v31;
  v33 = (std::__shared_weak_count *)v8[1];
  *(_OWORD *)v8 = v32;
  if (v33)
  {
    v34 = (unint64_t *)&v33->__shared_owners_;
    do
      v35 = __ldaxr(v34);
    while (__stlxr(v35 - 1, v34));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__deallocate_node((void **)v47);
  v36 = v45;
  v45 = 0;
  if (v36)
    operator delete(v36);
LABEL_39:

  result.__cntrl_ = v38;
  result.__ptr_ = v37;
  return result;
}

- (id)_propertyTranslatorForKeyPath:(id)a3
{
  id v4;
  NSMutableDictionary *propertiesToTranslators;
  void *v6;
  void *v7;
  NSMutableDictionary *relationshipsToTranslators;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (objc_msgSend(v4, "count") == 1)
  {
    propertiesToTranslators = self->_propertiesToTranslators;
    objc_msgSend(v4, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](propertiesToTranslators, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    relationshipsToTranslators = self->_relationshipsToTranslators;
    objc_msgSend(v4, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](relationshipsToTranslators, "objectForKeyedSubscript:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "entityTranslator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subarrayWithRange:", 1, objc_msgSend(v4, "count") - 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_propertyTranslatorForKeyPath:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

MPIdentifierSet *__84__MPMediaLibraryEntityTranslator_mapIdentifierMLProperties_identifierCreationBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MPIdentifierSet *v14;
  id v15;
  MPIdentifierSet *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;

  v7 = a2;
  objc_msgSend(v7, "modelKind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isMultiQuery"))
  {
    +[MPModelGenericObjectKind identityKind](MPModelGenericObjectKind, "identityKind");
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  v10 = *(void **)(a1 + 32);
  objc_msgSend(v7, "mediaLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_cachedMediaLibraryUniqueIdentifierForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = [MPIdentifierSet alloc];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __84__MPMediaLibraryEntityTranslator_mapIdentifierMLProperties_identifierCreationBlock___block_invoke_2;
  v18[3] = &unk_1E3162748;
  v20 = *(id *)(a1 + 40);
  v15 = v7;
  v19 = v15;
  v21 = a3;
  v22 = a4;
  v16 = -[MPIdentifierSet initWithSource:modelKind:block:](v14, "initWithSource:modelKind:block:", v13, v8, v18);

  return v16;
}

void __84__MPMediaLibraryEntityTranslator_mapIdentifierMLProperties_identifierCreationBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

id __62__MPMediaLibraryEntityTranslator_mapPropertyKey_toMLProperty___block_invoke(uint64_t a1, void *a2, _QWORD *a3, int8x8_t *a4)
{
  id v6;
  unsigned __int8 *v7;
  void *v8;
  void *__p[2];
  char v11;

  v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "property");
  v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7)
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 < 0)
    operator delete(__p[0]);

  return v8;
}

- (void)mapIdentifierMLProperties:(const void *)a3 identifierCreationBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  void *__p[2];
  void *v12[2];
  int v13;

  v6 = a4;
  *(_OWORD *)__p = 0u;
  *(_OWORD *)v12 = 0u;
  v13 = 1065353216;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __84__MPMediaLibraryEntityTranslator_mapIdentifierMLProperties_identifierCreationBlock___block_invoke;
  v9[3] = &unk_1E3162770;
  v9[4] = self;
  v10 = v6;
  v7 = v6;
  -[MPMediaLibraryEntityTranslator mapPropertyKey:withPropertiesToFetch:propertiesToSort:sortTransformer:valueTransformer:](self, "mapPropertyKey:withPropertiesToFetch:propertiesToSort:sortTransformer:valueTransformer:", CFSTR("_default"), a3, __p, 0, v9);
  std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__deallocate_node((void **)v12[0]);
  v8 = __p[0];
  __p[0] = 0;
  if (v8)
    operator delete(v8);

}

- (void)mapPropertyKey:(id)a3 toMLProperty:(void *)a4
{
  id v6;
  void *v7;
  void *__p[5];
  void *v9[2];
  char v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  std::string::basic_string[abi:ne180100]<0>(v9, "property");
  v11 = a4;
  std::unordered_map<std::string,mlcore::ModelPropertyBase *>::unordered_map((uint64_t)__p, (unsigned __int8 *)v9, 1);
  -[MPMediaLibraryEntityTranslator mapPropertyKey:withPropertiesToFetch:valueTransformer:](self, "mapPropertyKey:withPropertiesToFetch:valueTransformer:", v6, __p, &__block_literal_global_47339);
  std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__deallocate_node((void **)__p[2]);
  v7 = __p[0];
  __p[0] = 0;
  if (v7)
    operator delete(v7);
  if (v10 < 0)
    operator delete(v9[0]);

}

- (void)mapPropertyKey:(id)a3 withPropertiesToFetch:(const void *)a4 valueTransformer:(id)a5
{
  id v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  SEL v14;
  void *__p[2];
  void *v16[2];
  int v17;

  v9 = a3;
  *(_OWORD *)__p = 0u;
  *(_OWORD *)v16 = 0u;
  v17 = 1065353216;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __88__MPMediaLibraryEntityTranslator_mapPropertyKey_withPropertiesToFetch_valueTransformer___block_invoke;
  v12[3] = &unk_1E31627D8;
  v13 = v9;
  v14 = a2;
  v12[4] = self;
  v10 = v9;
  -[MPMediaLibraryEntityTranslator mapPropertyKey:withPropertiesToFetch:propertiesToSort:sortTransformer:valueTransformer:](self, "mapPropertyKey:withPropertiesToFetch:propertiesToSort:sortTransformer:valueTransformer:", v10, a4, __p, v12, a5);
  std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__deallocate_node((void **)v16[0]);
  v11 = __p[0];
  __p[0] = 0;
  if (v11)
    operator delete(v11);

}

- (void)mapPropertyKey:(id)a3 withPropertiesToFetch:(const void *)a4 propertiesToSort:(const void *)a5 sortTransformer:(id)a6 valueTransformer:(id)a7
{
  -[MPMediaLibraryEntityTranslator mapPropertyKey:withPropertiesToFetch:propertiesToSort:sortTransformer:filterTransformer:valueTransformer:](self, "mapPropertyKey:withPropertiesToFetch:propertiesToSort:sortTransformer:filterTransformer:valueTransformer:", a3, a4, a5, a6, 0, a7);
}

- (vector<mlcore::ModelPropertyBase)_MLCorePropertiesForPropertySet:(MPMediaLibraryEntityTranslator *)self withForeignPropertyBase:(SEL)a3
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  std::__shared_weak_count *v15;
  void *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  _QWORD *v30;
  void **v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  std::__shared_weak_count *v38;
  void *v39;
  unint64_t *v40;
  unint64_t v41;
  objc_class *v42;
  void *v43;
  void *v44;
  void *v45;
  objc_class *v46;
  void *v47;
  void *v48;
  void *v49;
  std::__shared_weak_count *v50;
  unint64_t *v51;
  unint64_t v52;
  _QWORD *v53;
  void **v54;
  void *v55;
  void *v56;
  _QWORD *v57;
  unint64_t v58;
  _QWORD *v59;
  ModelPropertyBase **var1;
  vector<mlcore::ModelPropertyBase *, std::allocator<mlcore::ModelPropertyBase *>> *result;
  id v63;
  id obj;
  std::string v66;
  _QWORD v67[8];
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  char v71;
  void *__p;
  std::__shared_weak_count *v73;
  _QWORD *v74;
  void *v75;
  std::__shared_weak_count *v76;
  void *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;
  float *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, _QWORD *);
  uint64_t (*v86)(uint64_t);
  _BYTE v87[32];
  uint64_t v88;
  int v89;
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v82 = 0;
  v83 = (float *)&v82;
  v84 = 0x5812000000;
  v85 = __Block_byref_object_copy__136;
  v86 = __Block_byref_object_dispose__137;
  v63 = a4;
  memset(v87, 0, sizeof(v87));
  v88 = 0;
  v89 = 1065353216;
  objc_msgSend(v63, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "setByAddingObject:", CFSTR("_default"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("_default"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v79;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v79 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v11);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_propertiesToTranslators, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (!v13)
        {
          v19 = -[MPMediaLibraryEntityTranslator MPModelClass](self, "MPModelClass");
          v20 = (void *)MEMORY[0x1E0CB3940];
          NSStringFromClass(-[MPMediaLibraryEntityTranslator MPModelClass](self, "MPModelClass"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringWithFormat:", CFSTR("MediaLibrary property mapping missing for %@:%@"), v21, v12);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          MPModelPropertyMappingMissing(v19, v12, v22);

LABEL_17:
          v23 = -[MPMediaLibraryEntityTranslator MPModelClass](self, "MPModelClass");
          v24 = (void *)MEMORY[0x1E0CB3940];
          NSStringFromClass(-[MPMediaLibraryEntityTranslator MPModelClass](self, "MPModelClass"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "stringWithFormat:", CFSTR("MediaLibrary property translator mapping missing for %@:%@"), v25, v12);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          MPModelPropertyMappingMissing(v23, v12, v26);

          goto LABEL_18;
        }
        objc_msgSend(v13, "propertiesToFetchMap");
        v16 = v75;
        v15 = v76;
        if (v76)
        {
          p_shared_owners = (unint64_t *)&v76->__shared_owners_;
          do
            v18 = __ldaxr(p_shared_owners);
          while (__stlxr(v18 - 1, p_shared_owners));
          if (!v18)
          {
            ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
            std::__shared_weak_count::__release_weak(v15);
            if (v16)
              goto LABEL_18;
            goto LABEL_17;
          }
        }
        if (!v16)
          goto LABEL_17;
LABEL_18:
        objc_msgSend(v14, "propertiesToFetchMap");
        std::unordered_map<std::string,mlcore::ModelPropertyBase *>::unordered_map((uint64_t)&v75, (uint64_t)__p);
        v27 = v73;
        if (v73)
        {
          v28 = (unint64_t *)&v73->__shared_owners_;
          do
            v29 = __ldaxr(v28);
          while (__stlxr(v29 - 1, v28));
          if (!v29)
          {
            ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
            std::__shared_weak_count::__release_weak(v27);
          }
        }
        _MPMLGetForeignPropertyMap((uint64_t)&__p, (ModelPropertyBase *)a5, (uint64_t)&v75);
        v30 = v74;
        if (v74)
        {
          do
          {
            std::__hash_table<mlcore::ModelPropertyBase *,std::hash<mlcore::ModelPropertyBase *>,std::equal_to<mlcore::ModelPropertyBase *>,std::allocator<mlcore::ModelPropertyBase *>>::__emplace_unique_key_args<mlcore::ModelPropertyBase *,mlcore::ModelPropertyBase * const&>(v83 + 12, v30[5], v30[5]);
            v30 = (_QWORD *)*v30;
          }
          while (v30);
          v31 = (void **)v74;
        }
        else
        {
          v31 = 0;
        }
        std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__deallocate_node(v31);
        v32 = __p;
        __p = 0;
        if (v32)
          operator delete(v32);
        std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__deallocate_node((void **)v77);
        v33 = v75;
        v75 = 0;
        if (v33)
          operator delete(v33);

        ++v11;
      }
      while (v11 != v9);
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
      v9 = v34;
    }
    while (v34);
  }

  v68 = 0;
  v69 = &v68;
  v70 = 0x2020000000;
  v71 = 0;
  objc_msgSend(v63, "relationships");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = __90__MPMediaLibraryEntityTranslator__MLCorePropertiesForPropertySet_withForeignPropertyBase___block_invoke;
  v67[3] = &unk_1E3162938;
  v67[4] = self;
  v67[5] = &v68;
  v67[6] = &v82;
  v67[7] = a5;
  objc_msgSend(v35, "enumerateKeysAndObjectsUsingBlock:", v67);

  if (*((_BYTE *)v69 + 24))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_propertiesToTranslators, "objectForKeyedSubscript:", CFSTR("_MPModelPropertyPlaylistEntryArtwork"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (v36)
    {
      objc_msgSend(v36, "propertiesToFetchMap");
      v39 = v75;
      v38 = v76;
      if (!v76)
        goto LABEL_42;
      v40 = (unint64_t *)&v76->__shared_owners_;
      do
        v41 = __ldaxr(v40);
      while (__stlxr(v41 - 1, v40));
      if (!v41)
      {
        ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
        std::__shared_weak_count::__release_weak(v38);
        if (v39)
        {
LABEL_46:
          objc_msgSend(v37, "propertiesToFetchMap");
          std::unordered_map<std::string,mlcore::ModelPropertyBase *>::unordered_map((uint64_t)&v75, (uint64_t)__p);
          v50 = v73;
          if (v73)
          {
            v51 = (unint64_t *)&v73->__shared_owners_;
            do
              v52 = __ldaxr(v51);
            while (__stlxr(v52 - 1, v51));
            if (!v52)
            {
              ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
              std::__shared_weak_count::__release_weak(v50);
            }
          }
          _MPMLGetForeignPropertyMap((uint64_t)&__p, (ModelPropertyBase *)a5, (uint64_t)&v75);
          v53 = v74;
          if (v74)
          {
            do
            {
              if (*((char *)v53 + 39) < 0)
                std::string::__init_copy_ctor_external(&v66, (const std::string::value_type *)v53[2], v53[3]);
              else
                v66 = *(std::string *)(v53 + 2);
              std::__hash_table<mlcore::ModelPropertyBase *,std::hash<mlcore::ModelPropertyBase *>,std::equal_to<mlcore::ModelPropertyBase *>,std::allocator<mlcore::ModelPropertyBase *>>::__emplace_unique_key_args<mlcore::ModelPropertyBase *,mlcore::ModelPropertyBase * const&>(v83 + 12, v53[5], v53[5]);
              if (SHIBYTE(v66.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v66.__r_.__value_.__l.__data_);
              v53 = (_QWORD *)*v53;
            }
            while (v53);
            v54 = (void **)v74;
          }
          else
          {
            v54 = 0;
          }
          std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__deallocate_node(v54);
          v55 = __p;
          __p = 0;
          if (v55)
            operator delete(v55);
          std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__deallocate_node((void **)v77);
          v56 = v75;
          v75 = 0;
          if (v56)
            operator delete(v56);

          goto LABEL_65;
        }
      }
      else
      {
LABEL_42:
        if (v39)
          goto LABEL_46;
      }
    }
    else
    {
      v42 = -[MPMediaLibraryEntityTranslator MPModelClass](self, "MPModelClass");
      v43 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromClass(-[MPMediaLibraryEntityTranslator MPModelClass](self, "MPModelClass"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "stringWithFormat:", CFSTR("MediaLibrary property mapping missing for %@:%@"), v44, CFSTR("_MPModelPropertyPlaylistEntryArtwork"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      MPModelPropertyMappingMissing(v42, CFSTR("_MPModelPropertyPlaylistEntryArtwork"), v45);

    }
    v46 = -[MPMediaLibraryEntityTranslator MPModelClass](self, "MPModelClass");
    v47 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromClass(-[MPMediaLibraryEntityTranslator MPModelClass](self, "MPModelClass"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "stringWithFormat:", CFSTR("MediaLibrary property translator mapping missing for %@:%@"), v48, CFSTR("_MPModelPropertyPlaylistEntryArtwork"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    MPModelPropertyMappingMissing(v46, CFSTR("_MPModelPropertyPlaylistEntryArtwork"), v49);

    goto LABEL_46;
  }
LABEL_65:
  v57 = (_QWORD *)*((_QWORD *)v83 + 8);
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  if (v57)
  {
    v58 = 0;
    v59 = v57;
    do
    {
      ++v58;
      v59 = (_QWORD *)*v59;
    }
    while (v59);
    std::vector<mlcore::ModelPropertyBase *>::__vallocate[abi:ne180100](retstr, v58);
    var1 = retstr->var1;
    do
    {
      *var1++ = (ModelPropertyBase *)v57[2];
      v57 = (_QWORD *)*v57;
    }
    while (v57);
    retstr->var1 = var1;
  }
  _Block_object_dispose(&v68, 8);

  _Block_object_dispose(&v82, 8);
  std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::__unordered_map_hasher<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::hash<mlcore::ModelProperty<int> *>,std::equal_to<mlcore::ModelProperty<int> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::equal_to<mlcore::ModelProperty<int> *>,std::hash<mlcore::ModelProperty<int> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<int> *,int>>>::~__hash_table((uint64_t)&v87[8]);

  return result;
}

- (void)mapPropertyKey:(id)a3 withPropertiesToFetch:(const void *)a4 propertiesToSort:(const void *)a5 sortTransformer:(id)a6 filterTransformer:(id)a7 valueTransformer:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSMutableDictionary *propertiesToTranslators;
  NSMutableDictionary *v19;
  NSMutableDictionary *v20;
  _MPMediaLibraryEntityPropertyTranslator *v21;
  std::__shared_weak_count *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  uint64_t v28;
  std::__shared_weak_count *v29;
  uint64_t v30;
  std::__shared_weak_count *v31;

  v14 = a3;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  propertiesToTranslators = self->_propertiesToTranslators;
  if (!propertiesToTranslators)
  {
    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v20 = self->_propertiesToTranslators;
    self->_propertiesToTranslators = v19;

    propertiesToTranslators = self->_propertiesToTranslators;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](propertiesToTranslators, "objectForKeyedSubscript:", v14);
  v21 = (_MPMediaLibraryEntityPropertyTranslator *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    v21 = objc_alloc_init(_MPMediaLibraryEntityPropertyTranslator);
    -[NSMutableDictionary setObject:forKey:](self->_propertiesToTranslators, "setObject:forKey:", v21, v14);
  }
  std::allocate_shared[abi:ne180100]<std::unordered_map<std::string,mlcore::ModelPropertyBase *>,std::allocator<std::unordered_map<std::string,mlcore::ModelPropertyBase *>>,std::unordered_map<std::string,mlcore::ModelPropertyBase *> const&,void>(&v30, (uint64_t)a4);
  -[_MPMediaLibraryEntityPropertyTranslator setPropertiesToFetchMap:](v21, "setPropertiesToFetchMap:", &v30);
  v22 = v31;
  if (v31)
  {
    p_shared_owners = (unint64_t *)&v31->__shared_owners_;
    do
      v24 = __ldaxr(p_shared_owners);
    while (__stlxr(v24 - 1, p_shared_owners));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  std::allocate_shared[abi:ne180100]<std::unordered_map<std::string,mlcore::ModelPropertyBase *>,std::allocator<std::unordered_map<std::string,mlcore::ModelPropertyBase *>>,std::unordered_map<std::string,mlcore::ModelPropertyBase *> const&,void>(&v28, (uint64_t)a5);
  -[_MPMediaLibraryEntityPropertyTranslator setPropertiesToSortMap:](v21, "setPropertiesToSortMap:", &v28);
  v25 = v29;
  if (v29)
  {
    v26 = (unint64_t *)&v29->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }
  -[_MPMediaLibraryEntityPropertyTranslator setSortTransformer:](v21, "setSortTransformer:", v15);
  -[_MPMediaLibraryEntityPropertyTranslator setValueTransformer:](v21, "setValueTransformer:", v17);
  -[_MPMediaLibraryEntityPropertyTranslator setFilterTransformer:](v21, "setFilterTransformer:", v16);

}

void __90__MPMediaLibraryEntityTranslator__MLCorePropertiesForPropertySet_withForeignPropertyBase___block_invoke(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t *p_shared_owners;
  unint64_t v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  ModelPropertyBase *Property;
  ModelPropertyBase *v20;
  void *v21;
  void *v22;
  unint64_t *v23;
  std::__shared_weak_count *v24;
  float *v25;
  std::__shared_weak_count *v26;
  float *v27;
  void *v28;
  void *__p;
  std::__shared_weak_count *v30;
  void *v31;
  void *v32[2];
  void *v33;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "MPModelClass");
    v9 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromClass((Class)objc_msgSend(*(id *)(a1 + 32), "MPModelClass"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("MediaLibrary relationship mapping missing for %@:%@"), v10, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    MPModelPropertyMappingMissing(v8, v5, v11);

  }
  if (v5 == CFSTR("MPModelRelationshipPlaylistEntrySong")
    || v5 == CFSTR("MPModelRelationshipPlaylistEntryMovie")
    || v5 == CFSTR("MPModelRelationshipPlaylistEntryTVEpisode"))
  {
    v12 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v12, "removeProperty:", CFSTR("MPModelPropertySongArtwork"));
    objc_msgSend(v12, "removeProperty:", CFSTR("MPModelPropertyMovieArtwork"));
    objc_msgSend(v12, "removeProperty:", CFSTR("MPModelPropertyTVEpisodeArtwork"));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

    v6 = v12;
  }
  objc_msgSend(v7, "relationshipValidationProperties");
  std::unordered_map<std::string,mlcore::ModelPropertyBase *>::unordered_map((uint64_t)v32, (uint64_t)__p);
  if (v30)
  {
    p_shared_owners = &v30->__shared_owners_;
    do
      v14 = __ldaxr((unint64_t *)p_shared_owners);
    while (__stlxr(v14 - 1, (unint64_t *)p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
  _MPMLGetForeignPropertyMap((uint64_t)&__p, *(ModelPropertyBase **)(a1 + 56), (uint64_t)v32);
  std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__move_assign((uint64_t)v32, (uint64_t *)&__p);
  std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__deallocate_node((void **)v31);
  v15 = __p;
  __p = 0;
  if (v15)
    operator delete(v15);
  v16 = v33;
  if (v33)
  {
    do
    {
      std::__hash_table<mlcore::ModelPropertyBase *,std::hash<mlcore::ModelPropertyBase *>,std::equal_to<mlcore::ModelPropertyBase *>,std::allocator<mlcore::ModelPropertyBase *>>::__emplace_unique_key_args<mlcore::ModelPropertyBase *,mlcore::ModelPropertyBase * const&>((float *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48), v16[5], v16[5]);
      v16 = (_QWORD *)*v16;
    }
    while (v16);
  }
  if (objc_msgSend(v7, "transient"))
  {
    objc_msgSend(v7, "entityTranslator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      objc_msgSend(v17, "_MLCorePropertiesForPropertySet:withForeignPropertyBase:", v6, *(_QWORD *)(a1 + 56));
    }
    else
    {
      __p = 0;
      v30 = 0;
      v31 = 0;
    }

    v23 = (unint64_t *)__p;
    v24 = v30;
    if (__p != v30)
    {
      v25 = (float *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48);
      do
      {
        std::__hash_table<mlcore::ModelPropertyBase *,std::hash<mlcore::ModelPropertyBase *>,std::equal_to<mlcore::ModelPropertyBase *>,std::allocator<mlcore::ModelPropertyBase *>>::__emplace_unique_key_args<mlcore::ModelPropertyBase *,mlcore::ModelPropertyBase * const&>(v25, *v23, *v23);
        ++v23;
      }
      while (v23 != (unint64_t *)v24);
LABEL_32:
      v23 = (unint64_t *)__p;
    }
  }
  else
  {
    Property = (ModelPropertyBase *)objc_msgSend(v7, "foreignPropertyBase");
    v20 = *(ModelPropertyBase **)(a1 + 56);
    if (v20)
      Property = (ModelPropertyBase *)MPMediaLibraryGetProperty(v20, Property);
    objc_msgSend(v7, "entityTranslator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      objc_msgSend(v21, "_MLCorePropertiesForPropertySet:withForeignPropertyBase:", v6, Property);
    }
    else
    {
      __p = 0;
      v30 = 0;
      v31 = 0;
    }

    v23 = (unint64_t *)__p;
    v26 = v30;
    if (__p != v30)
    {
      v27 = (float *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48);
      do
      {
        std::__hash_table<mlcore::ModelPropertyBase *,std::hash<mlcore::ModelPropertyBase *>,std::equal_to<mlcore::ModelPropertyBase *>,std::allocator<mlcore::ModelPropertyBase *>>::__emplace_unique_key_args<mlcore::ModelPropertyBase *,mlcore::ModelPropertyBase * const&>(v27, *v23, *v23);
        ++v23;
      }
      while (v23 != (unint64_t *)v26);
      goto LABEL_32;
    }
  }
  if (v23)
  {
    v30 = (std::__shared_weak_count *)v23;
    operator delete(v23);
  }
  std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__deallocate_node((void **)v33);
  v28 = v32[0];
  v32[0] = 0;
  if (v28)
    operator delete(v28);

}

void __120__MPMediaLibraryEntityTranslator__objectForPropertySet_entityClass_propertyCache_baseTranslator_prependKeyPath_context___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  ModelPropertyBase *v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  void *v16;
  uint64_t (**v17)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *__p;
  std::__shared_weak_count *v30;
  void *v31;
  void *v32[5];

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = *(_QWORD *)(a1 + 72);
    v27 = *(void **)(a1 + 32);
    NSStringFromClass((Class)objc_msgSend(v27, "MPModelClass"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", v26, v27, CFSTR("MPMediaLibraryEntityTranslator.mm"), 613, CFSTR("Relationship mapping missing for %@:%@"), v28, v5);

  }
  objc_msgSend(*(id *)(a1 + 40), "arrayByAddingObject:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "transient") & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    v10 = *(void **)(a1 + 48);
    objc_msgSend(v8, "subarrayWithRange:", 0, objc_msgSend(v8, "count") - 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (ModelPropertyBase *)objc_msgSend(v10, "_propertyForKeyPath:", v11);

    objc_msgSend(v7, "relationshipValidationProperties");
    std::unordered_map<std::string,mlcore::ModelPropertyBase *>::unordered_map((uint64_t)v32, (uint64_t)__p);
    v13 = v30;
    if (v30)
    {
      p_shared_owners = (unint64_t *)&v30->__shared_owners_;
      do
        v15 = __ldaxr(p_shared_owners);
      while (__stlxr(v15 - 1, p_shared_owners));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    _MPMLGetForeignPropertyMap((uint64_t)&__p, v12, (uint64_t)v32);
    std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__move_assign((uint64_t)v32, (uint64_t *)&__p);
    std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__deallocate_node((void **)v31);
    v16 = __p;
    __p = 0;
    if (v16)
      operator delete(v16);
    objc_msgSend(v7, "validRelationshipHandler");
    v17 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v9 = ((uint64_t (**)(_QWORD, _QWORD, void **, _QWORD))v17)[2](v17, *(_QWORD *)(a1 + 56), v32, *(_QWORD *)(a1 + 80));

    std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__deallocate_node((void **)v32[2]);
    v18 = v32[0];
    v32[0] = 0;
    if (v18)
      operator delete(v18);
  }
  objc_msgSend(v7, "entityTranslator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *(id *)(a1 + 48);
  v21 = objc_msgSend(*(id *)(a1 + 32), "MPModelClass");
  if (v21 != objc_opt_class())
  {
    if (!v9)
    {
      v24 = 0;
      v23 = v20;
      goto LABEL_21;
    }
    v22 = *(_QWORD *)(a1 + 88);
    v23 = v20;
    goto LABEL_19;
  }

  v23 = v19;
  v8 = (void *)MEMORY[0x1E0C9AA60];
  v22 = objc_msgSend(v23, "entityClass");
  if (v22 == *(_QWORD *)(a1 + 88))
  {
LABEL_19:
    objc_msgSend(v19, "_objectForPropertySet:entityClass:propertyCache:baseTranslator:prependKeyPath:context:", v6, v22, *(_QWORD *)(a1 + 80), v23, v8, *(_QWORD *)(a1 + 56));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  v24 = 0;
LABEL_21:
  objc_msgSend(*(id *)(a1 + 64), "setValue:forModelKey:", v24, v5);

}

- (void)_propertyForKeyPath:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  ModelPropertyBase *v9;
  uint64_t v10;
  id *p_isa;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t Property;
  void *v17;
  void *v19;
  SEL v20;
  MPMediaLibraryEntityTranslator *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v21 = self;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v20 = a2;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v23;
    p_isa = (id *)&v21->super.isa;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v6);
        v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(p_isa[2], "objectForKeyedSubscript:", v13);
        v14 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v14;
        if (!v14)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromClass((Class)objc_msgSend(p_isa, "MPModelClass"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", v20, v21, CFSTR("MPMediaLibraryEntityTranslator.mm"), 517, CFSTR("Relationship mapping missing for %@:%@"), v17, v13);

        }
        objc_msgSend(v8, "entityTranslator");
        v15 = objc_claimAutoreleasedReturnValue();

        p_isa = (id *)v15;
        if ((objc_msgSend(v8, "transient") & 1) == 0)
        {
          if (v9)
            Property = MPMediaLibraryGetProperty(v9, (ModelPropertyBase *)objc_msgSend(v8, "foreignPropertyBase"));
          else
            Property = objc_msgSend(v8, "foreignPropertyBase");
          v9 = (ModelPropertyBase *)Property;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);

    v21 = (MPMediaLibraryEntityTranslator *)v15;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (Class)MPModelClass
{
  return self->_MPModelClass;
}

void __120__MPMediaLibraryEntityTranslator__objectForPropertySet_entityClass_propertyCache_baseTranslator_prependKeyPath_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id obj;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__132;
  v37 = __Block_byref_object_dispose__133;
  objc_msgSend(*(id *)(a1 + 32), "properties");
  v38 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "relationships");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __120__MPMediaLibraryEntityTranslator__objectForPropertySet_entityClass_propertyCache_baseTranslator_prependKeyPath_context___block_invoke_134;
  v32[3] = &unk_1E31628C0;
  v32[4] = &v33;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v32);

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = (id)v34[5];
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v29 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = *(_QWORD *)(a1 + 72);
          v14 = *(void **)(a1 + 40);
          NSStringFromClass((Class)objc_msgSend(v14, "MPModelClass"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", v13, v14, CFSTR("MPMediaLibraryEntityTranslator.mm"), 606, CFSTR("Property mapping missing for %@:%@"), v15, v8);

        }
        v10 = *(void **)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 56), "arrayByAddingObject:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_valueForKeyPath:forPropertyCache:context:", v11, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 64));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "setValue:forModelKey:", v12, v8);
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 32), "relationships");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __120__MPMediaLibraryEntityTranslator__objectForPropertySet_entityClass_propertyCache_baseTranslator_prependKeyPath_context___block_invoke_2;
  v21[3] = &unk_1E31628E8;
  v17 = *(_QWORD *)(a1 + 72);
  v21[4] = *(_QWORD *)(a1 + 40);
  v26 = v17;
  v22 = *(id *)(a1 + 56);
  v23 = *(id *)(a1 + 48);
  v24 = *(id *)(a1 + 64);
  v27 = *(_OWORD *)(a1 + 80);
  v18 = v3;
  v25 = v18;
  objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v21);

  _Block_object_dispose(&v33, 8);
}

- (id)_objectForPropertySet:(id)a3 entityClass:(void *)a4 propertyCache:(const void *)a5 baseTranslator:(id)a6 prependKeyPath:(id)a7 context:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  MPMediaLibraryEntityTranslator *v26;
  id v27;
  id v28;
  id v29;
  SEL v30;
  const void *v31;
  void *v32;

  v15 = a3;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (*((_QWORD *)a5 + 19) + *((_QWORD *)a5 + 24) + *((_QWORD *)a5 + 14) + *((_QWORD *)a5 + 9) + *((_QWORD *)a5 + 4))
  {
    objc_msgSend(v17, "arrayByAddingObject:", CFSTR("_default"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_valueForKeyPath:forPropertyCache:context:", v20, a5, v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_alloc(-[MPMediaLibraryEntityTranslator MPModelClass](self, "MPModelClass"));
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __120__MPMediaLibraryEntityTranslator__objectForPropertySet_entityClass_propertyCache_baseTranslator_prependKeyPath_context___block_invoke;
    v24[3] = &unk_1E3162910;
    v25 = v15;
    v26 = self;
    v30 = a2;
    v27 = v16;
    v28 = v17;
    v31 = a5;
    v29 = v18;
    v32 = a4;
    v19 = (void *)objc_msgSend(v22, "initWithIdentifiers:block:", v21, v24);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

BOOL __101__MPMediaLibraryEntityTranslator_mapRelationshipKey_toModelClass_transient_usingForeignPropertyBase___block_invoke(uint64_t a1, void *a2, uint64_t a3, int8x8_t *a4)
{
  id v6;
  ModelPropertyBase **v7;
  void *v8;
  uint64_t v9;
  void *__p[2];
  char v12;
  void **v13;

  v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "joinProperty");
  v13 = __p;
  v7 = (ModelPropertyBase **)std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(a3, (unsigned __int8 *)__p, (__int128 **)&v13);
  MPMediaLibraryPropertyCacheValueForProperty(v7[5], a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "longLongValue");

  if (v12 < 0)
    operator delete(__p[0]);

  return v9 != 0;
}

- (void)mapRelationshipKey:(id)a3 toModelClass:(Class)a4 transient:(BOOL)a5 usingForeignPropertyBase:(void *)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  void *__p[5];
  void *v13[2];
  char v14;
  void *v15;
  uint64_t v16;

  v7 = a5;
  v16 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  std::string::basic_string[abi:ne180100]<0>(v13, "joinProperty");
  v15 = a6;
  std::unordered_map<std::string,mlcore::ModelPropertyBase *>::unordered_map((uint64_t)__p, (unsigned __int8 *)v13, 1);
  -[MPMediaLibraryEntityTranslator mapRelationshipKey:toModelClass:transient:usingForeignPropertyBase:relationshipValidationProperties:isValidRelationshipHandler:](self, "mapRelationshipKey:toModelClass:transient:usingForeignPropertyBase:relationshipValidationProperties:isValidRelationshipHandler:", v10, a4, v7, a6, __p, &__block_literal_global_94_47333);
  std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__deallocate_node((void **)__p[2]);
  v11 = __p[0];
  __p[0] = 0;
  if (v11)
    operator delete(v11);
  if (v14 < 0)
    operator delete(v13[0]);

}

- (void)mapRelationshipKey:(id)a3 toModelClass:(Class)a4 transient:(BOOL)a5 usingForeignPropertyBase:(void *)a6 relationshipValidationProperties:(const void *)a7 isValidRelationshipHandler:(id)a8
{
  _BOOL8 v11;
  id v14;
  id v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *relationshipsToTranslators;
  _MPMediaLibraryEntityRelationshipTranslator *v18;
  std::__shared_weak_count *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  uint64_t v22;
  std::__shared_weak_count *v23;

  v11 = a5;
  v14 = a3;
  v15 = a8;
  if (!self->_relationshipsToTranslators)
  {
    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    relationshipsToTranslators = self->_relationshipsToTranslators;
    self->_relationshipsToTranslators = v16;

  }
  v18 = objc_alloc_init(_MPMediaLibraryEntityRelationshipTranslator);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_relationshipsToTranslators, "setObject:forKeyedSubscript:", v18, v14);
  -[_MPMediaLibraryEntityRelationshipTranslator setTransient:](v18, "setTransient:", v11);
  -[_MPMediaLibraryEntityRelationshipTranslator setRelationshipModelClass:](v18, "setRelationshipModelClass:", a4);
  -[_MPMediaLibraryEntityRelationshipTranslator setForeignPropertyBase:](v18, "setForeignPropertyBase:", a6);
  -[_MPMediaLibraryEntityRelationshipTranslator setValidRelationshipHandler:](v18, "setValidRelationshipHandler:", v15);
  std::allocate_shared[abi:ne180100]<std::unordered_map<std::string,mlcore::ModelPropertyBase *>,std::allocator<std::unordered_map<std::string,mlcore::ModelPropertyBase *>>,std::unordered_map<std::string,mlcore::ModelPropertyBase *> const&,void>(&v22, (uint64_t)a7);
  -[_MPMediaLibraryEntityRelationshipTranslator setRelationshipValidationProperties:](v18, "setRelationshipValidationProperties:", &v22);
  v19 = v23;
  if (v23)
  {
    p_shared_owners = (unint64_t *)&v23->__shared_owners_;
    do
      v21 = __ldaxr(p_shared_owners);
    while (__stlxr(v21 - 1, p_shared_owners));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }

}

void __89__MPMediaLibraryEntityTranslator_entityQueryForPropertySet_sortDescriptors_context_view___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t *p_shared_owners;
  unint64_t v15;
  uint64_t *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  unint64_t *v28;
  unint64_t v29;
  unint64_t *v30;
  unint64_t v31;
  unint64_t *v32;
  unint64_t v33;
  unint64_t *v34;
  unint64_t v35;
  std::__shared_weak_count *v36;
  uint64_t *v37;
  unint64_t v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  std::__shared_weak_count *v46;
  uint64_t v47;
  std::__shared_weak_count *v48;
  std::__shared_weak_count *v49;
  mlcore::Query *v50;
  std::__shared_weak_count *v51;
  mlcore::Query *v52;
  std::__shared_weak_count *v53;
  mlcore::Query *v54;
  std::__shared_weak_count *v55;
  void *__p;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = *(_QWORD *)(a1 + 72);
    v44 = *(void **)(a1 + 32);
    NSStringFromClass((Class)objc_msgSend(v44, "MPModelClass"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", v43, v44, CFSTR("MPMediaLibraryEntityTranslator.mm"), 320, CFSTR("Relationship mapping missing for %@:%@"), v45, v5);

  }
  objc_msgSend(v7, "entityTranslator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "MLCorePropertiesForPropertySet:", v6);
    v10 = v59;
    v11 = v60;
  }
  else
  {
    v11 = 0;
    v10 = 0;
    v59 = 0;
    v60 = 0;
    v61 = 0;
  }
  v57 = 0;
  v58 = 0;
  __p = 0;
  std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&__p, v10, v11, (v11 - (uint64_t)v10) >> 3);
  objc_msgSend(v9, "entityClass");
  mlcore::MultiEntityQuery::setPropertiesToFetchForEntityClass();
  if (__p)
  {
    v57 = __p;
    operator delete(__p);
  }
  v12 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "mlCoreView");
    v54 = v52;
    v55 = v53;
    if (v53)
    {
      p_shared_owners = &v53->__shared_owners_;
      do
        v15 = __ldxr((unint64_t *)p_shared_owners);
      while (__stxr(v15 + 1, (unint64_t *)p_shared_owners));
      v16 = &v53->__shared_owners_;
      do
        v17 = __ldaxr((unint64_t *)v16);
      while (__stlxr(v17 - 1, (unint64_t *)v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
        std::__shared_weak_count::__release_weak(v53);
      }
    }
  }
  else
  {
    v52 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
  }

  objc_msgSend(*(id *)(a1 + 56), "relationshipKinds");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setModelKind:", v19);

  objc_msgSend(v9, "entityQueryBlock");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  v22 = *(_QWORD *)(a1 + 48);
  v50 = v54;
  v51 = v55;
  if (v55)
  {
    v23 = (unint64_t *)&v55->__shared_owners_;
    do
      v24 = __ldxr(v23);
    while (__stxr(v24 + 1, v23));
  }
  (*(void (**)(mlcore::Query **__return_ptr, uint64_t, uint64_t, mlcore::Query **))(v20 + 16))(&v52, v20, v22, &v50);
  v25 = v51;
  if (v51)
  {
    v26 = (unint64_t *)&v51->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }

  v49 = v55;
  if (v55)
  {
    v28 = (unint64_t *)&v55->__shared_owners_;
    do
      v29 = __ldxr(v28);
    while (__stxr(v29 + 1, v28));
  }
  objc_msgSend(v9, "entityClass");
  mlcore::MultiEntityQuery::setViewForEntityClass();
  if (v49)
  {
    v30 = (unint64_t *)&v49->__shared_owners_;
    do
      v31 = __ldaxr(v30);
    while (__stlxr(v31 - 1, v30));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
      std::__shared_weak_count::__release_weak(v49);
    }
  }
  mlcore::Query::predicate(v52);
  if (!v48)
    goto LABEL_37;
  v32 = (unint64_t *)&v48->__shared_owners_;
  do
    v33 = __ldaxr(v32);
  while (__stlxr(v33 - 1, v32));
  if (!v33)
  {
    ((void (*)())v48->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v48);
    if (!v47)
      goto LABEL_44;
  }
  else
  {
LABEL_37:
    if (!v47)
      goto LABEL_44;
  }
  mlcore::Query::predicate(v52);
  objc_msgSend(v9, "entityClass");
  mlcore::MultiEntityQuery::setPredicateForEntityClass();
  if (v46)
  {
    v34 = (unint64_t *)&v46->__shared_owners_;
    do
      v35 = __ldaxr(v34);
    while (__stlxr(v35 - 1, v34));
    if (!v35)
    {
      ((void (*)())v46->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v46);
    }
  }
LABEL_44:
  v36 = v53;
  if (v53)
  {
    v37 = &v53->__shared_owners_;
    do
      v38 = __ldaxr((unint64_t *)v37);
    while (__stlxr(v38 - 1, (unint64_t *)v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }
  v39 = v55;
  if (v55)
  {
    v40 = (unint64_t *)&v55->__shared_owners_;
    do
      v41 = __ldaxr(v40);
    while (__stlxr(v41 - 1, v40));
    if (!v41)
    {
      ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
      std::__shared_weak_count::__release_weak(v39);
    }
  }
  if (v59)
  {
    v60 = (uint64_t)v59;
    operator delete(v59);
  }

}

- (void)entityClass
{
  return self->_entityClass;
}

- (id)entityQueryBlock
{
  return self->_entityQueryBlock;
}

- (id)objectForPropertySet:(id)a3 entityClass:(void *)a4 propertyCache:(const void *)a5 context:(id)a6
{
  -[MPMediaLibraryEntityTranslator _objectForPropertySet:entityClass:propertyCache:baseTranslator:prependKeyPath:context:](self, "_objectForPropertySet:entityClass:propertyCache:baseTranslator:prependKeyPath:context:", a3, a4, a5, self, MEMORY[0x1E0C9AA60], a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (shared_ptr<mlcore::EntityQuery>)entityQueryForPropertySet:(id)a3 sortDescriptors:(id)a4 context:(id)a5 view:(id)a6
{
  uint64_t v6;
  id v11;
  void (**entityQueryBlock)(id, id, _OWORD *);
  __int128 v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  void *v17;
  objc_class *v18;
  void *v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  mlcore::Query *v22;
  unint64_t *v23;
  unint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  void **v47;
  uint64_t v48;
  void **v49;
  void **v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void **v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  _QWORD *v65;
  uint64_t v66;
  uint64_t i;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  _QWORD *v76;
  uint64_t v77;
  uint64_t j;
  _QWORD *v79;
  _QWORD *v80;
  _OWORD *v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  _QWORD *v85;
  void *v86;
  std::__shared_weak_count *v87;
  unint64_t *v88;
  unint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  unint64_t v93;
  char *v94;
  uint64_t v95;
  char *v96;
  _QWORD *v97;
  _QWORD *v98;
  char *v99;
  __int128 v100;
  int64x2_t v101;
  _OWORD *v102;
  __n128 (*v103)(__n128 *, __n128 *);
  unint64_t *v104;
  unint64_t v105;
  std::__shared_weak_count *v106;
  unint64_t *p_shared_owners;
  unint64_t v108;
  EntityQuery *v109;
  __shared_weak_count *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  id v116;
  id v117;
  id v118;
  id v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  id v123;
  uint64_t v124;
  uint64_t v125;
  MPMediaLibraryEntityTranslator *v126;
  id obj;
  uint64_t v128;
  uint64_t v129;
  uint64_t v131;
  uint64_t v132;
  unint64_t v133;
  uint64_t v134;
  _QWORD v135[3];
  std::__shared_weak_count *v136;
  __int128 v137;
  void *v138;
  void *v139;
  uint64_t v140;
  _QWORD v141[8];
  __int128 v142;
  uint64_t v143;
  __n128 (*v144)(__n128 *, __n128 *);
  void (*v145)(uint64_t);
  void *v146;
  _BYTE v147[32];
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  int64x2_t v152;
  _QWORD v153[2];
  _QWORD v154[5];
  id v155;
  id v156;
  id v157;
  void ***v158;
  SEL v159;
  void ***v160;
  int64x2_t v161;
  __n128 (*v162)(__n128 *, __n128 *);
  uint64_t (*v163)(uint64_t);
  void *v164;
  mlcore::Query *v165;
  std::__shared_weak_count *v166;
  void *__p;
  void *v168;
  uint64_t v169;
  void *v170;
  _BYTE *v171;
  __int128 v172;
  void **v173;
  void **v174;
  void **v175;
  unint64_t v176;
  _QWORD *v177;
  _BYTE v178[128];
  uint64_t v179;
  shared_ptr<mlcore::EntityQuery> result;

  v120 = v6;
  v179 = *MEMORY[0x1E0C80C00];
  v117 = a3;
  v118 = a4;
  v119 = a5;
  v11 = a6;
  entityQueryBlock = (void (**)(id, id, _OWORD *))self->_entityQueryBlock;
  v123 = v11;
  if (!entityQueryBlock)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(-[MPMediaLibraryEntityTranslator MPModelClass](self, "MPModelClass"));
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaLibraryEntityTranslator.mm"), 306, CFSTR("No entityQueryBlock was mapped for %@"), v112);

    entityQueryBlock = (void (**)(id, id, _OWORD *))self->_entityQueryBlock;
  }
  if (v11)
  {
    objc_msgSend(v11, "mlCoreView");
    v13 = v142;
  }
  else
  {
    v13 = 0uLL;
  }
  v172 = v13;
  v142 = 0uLL;
  entityQueryBlock[2](entityQueryBlock, v119, &v172);
  v14 = (std::__shared_weak_count *)*((_QWORD *)&v172 + 1);
  if (*((_QWORD *)&v172 + 1))
  {
    v15 = (unint64_t *)(*((_QWORD *)&v172 + 1) + 8);
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaLibraryEntityTranslator MLCorePropertiesForPropertySet:](self, "MLCorePropertiesForPropertySet:", v17);

  v169 = 0;
  __p = 0;
  v168 = 0;
  std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&__p, v170, (uint64_t)v171, (v171 - (_BYTE *)v170) >> 3);
  mlcore::EntityQuery::setIdentityPropertiesToFetch();
  if (__p)
  {
    v168 = __p;
    operator delete(__p);
  }
  if (!*(_QWORD *)v120)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(-[MPMediaLibraryEntityTranslator MPModelClass](self, "MPModelClass"));
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaLibraryEntityTranslator.mm"), 311, CFSTR("%@ entityQueryBlock did not return a query."), v114);

  }
  v18 = -[MPMediaLibraryEntityTranslator MPModelClass](self, "MPModelClass");
  if (v18 != (objc_class *)objc_opt_class())
  {
    -[MPMediaLibraryEntityTranslator MLCorePropertiesForPropertySet:](self, "MLCorePropertiesForPropertySet:", v117);
    v139 = 0;
    v140 = 0;
    v138 = 0;
    std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v138, (const void *)v142, *((uint64_t *)&v142 + 1), (uint64_t)(*((_QWORD *)&v142 + 1) - v142) >> 3);
    mlcore::PropertiesQuery::setPropertiesToFetch();
    if (v138)
    {
      v139 = v138;
      operator delete(v138);
    }
    -[MPMediaLibraryEntityTranslator MLCoreSortDescriptorsForModelSortDescriptors:](self, "MLCoreSortDescriptorsForModelSortDescriptors:", v118);
    if (v174 != v173)
      mlcore::PropertiesQuery::setSortDescriptors();
    objc_msgSend(v119, "propertyFilters");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPMediaLibraryEntityTranslator MLCorePredicateForModelPropertyFilters:](self, "MLCorePredicateForModelPropertyFilters:", v19);

    if (v152.i64[1] != v152.i64[0])
    {
      mlcore::Query::predicate(*(mlcore::Query **)v120);
      v20 = v152.i64[1];
      if (v152.i64[1] >= v153[0])
      {
        v90 = (v152.i64[1] - v152.i64[0]) >> 4;
        v91 = v90 + 1;
        if ((unint64_t)(v90 + 1) >> 60)
          std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
        v92 = v153[0] - v152.i64[0];
        if ((v153[0] - v152.i64[0]) >> 3 > v91)
          v91 = v92 >> 3;
        if ((unint64_t)v92 >= 0x7FFFFFFFFFFFFFF0)
          v93 = 0xFFFFFFFFFFFFFFFLL;
        else
          v93 = v91;
        v163 = (uint64_t (*)(uint64_t))v153;
        v94 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v93);
        v96 = &v94[16 * v90];
        *(_OWORD *)v96 = v137;
        v137 = 0uLL;
        v97 = (_QWORD *)v152.i64[1];
        v98 = (_QWORD *)v152.i64[0];
        if (v152.i64[1] == v152.i64[0])
        {
          v101 = vdupq_n_s64(v152.u64[1]);
          v99 = &v94[16 * v90];
        }
        else
        {
          v99 = &v94[16 * v90];
          do
          {
            v100 = *((_OWORD *)v97 - 1);
            v97 -= 2;
            *((_OWORD *)v99 - 1) = v100;
            v99 -= 16;
            *v97 = 0;
            v97[1] = 0;
          }
          while (v97 != v98);
          v101 = v152;
        }
        v102 = v96 + 16;
        v152.i64[0] = (uint64_t)v99;
        v152.i64[1] = (uint64_t)(v96 + 16);
        v161 = v101;
        v103 = (__n128 (*)(__n128 *, __n128 *))v153[0];
        v153[0] = &v94[16 * v95];
        v162 = v103;
        v160 = (void ***)v101.i64[0];
        std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v160);
        v152.i64[1] = (uint64_t)v102;
        if (*((_QWORD *)&v137 + 1))
        {
          v104 = (unint64_t *)(*((_QWORD *)&v137 + 1) + 8);
          do
            v105 = __ldaxr(v104);
          while (__stlxr(v105 - 1, v104));
          if (!v105)
          {
            (*(void (**)(_QWORD))(**((_QWORD **)&v137 + 1) + 16))(*((_QWORD *)&v137 + 1));
            std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v137 + 1));
          }
        }
      }
      else
      {
        *(_OWORD *)v152.i64[1] = v137;
        v152.i64[1] = v20 + 16;
      }
      memset(v135, 0, sizeof(v135));
      std::vector<std::shared_ptr<mlcore::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<mlcore::Predicate>*,std::shared_ptr<mlcore::Predicate>*>(v135, v152.i64[0], (_QWORD *)v152.i64[1], (v152.i64[1] - v152.i64[0]) >> 4);
      mlcore::CreateAndPredicate();
      mlcore::Query::setPredicate();
      v106 = v136;
      if (v136)
      {
        p_shared_owners = (unint64_t *)&v136->__shared_owners_;
        do
          v108 = __ldaxr(p_shared_owners);
        while (__stlxr(v108 - 1, p_shared_owners));
        if (!v108)
        {
          ((void (*)(std::__shared_weak_count *))v106->__on_zero_shared)(v106);
          std::__shared_weak_count::__release_weak(v106);
        }
      }
      v160 = (void ***)v135;
      std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v160);
    }
    v160 = (void ***)&v152;
    std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v160);
    v160 = &v173;
    std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100]((void ***)&v160);
    if ((_QWORD)v142)
    {
      *((_QWORD *)&v142 + 1) = v142;
      operator delete((void *)v142);
    }
    goto LABEL_130;
  }
  v162 = __Block_byref_object_copy__47284;
  v163 = __Block_byref_object_dispose__47285;
  v22 = *(mlcore::Query **)v120;
  v21 = *(std::__shared_weak_count **)(v120 + 8);
  v164 = &unk_193F4554F;
  v165 = v22;
  v160 = 0;
  v161.i64[0] = (uint64_t)&v160;
  v161.i64[1] = 0x4012000000;
  v166 = v21;
  if (v21)
  {
    v23 = (unint64_t *)&v21->__shared_owners_;
    do
      v24 = __ldxr(v23);
    while (__stxr(v24 + 1, v23));
  }
  objc_msgSend(v119, "modelKind");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "relationships");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v154[0] = MEMORY[0x1E0C809B0];
  v154[1] = 3221225472;
  v154[2] = __89__MPMediaLibraryEntityTranslator_entityQueryForPropertySet_sortDescriptors_context_view___block_invoke;
  v154[3] = &unk_1E3162840;
  v159 = a2;
  v154[4] = self;
  v158 = (void ***)&v160;
  v155 = v11;
  v26 = v119;
  v156 = v26;
  v116 = v115;
  v157 = v116;
  objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v154);

  objc_msgSend(v26, "setModelKind:", v116);
  v152 = 0uLL;
  v153[0] = 0;
  v148 = 0u;
  v149 = 0u;
  v150 = 0u;
  v151 = 0u;
  obj = v118;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v148, v178, 16);
  if (v27)
  {
    v129 = *(_QWORD *)v149;
    v134 = MEMORY[0x1E0D4AF50] + 16;
    v126 = self;
    do
    {
      v28 = 0;
      v128 = v27;
      do
      {
        if (*(_QWORD *)v149 != v129)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v148 + 1) + 8 * v28);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaLibraryEntityTranslator.mm"), 339, CFSTR("MPModelGenericObject can only be sorted by MPMulitSortDescriptor."));

        }
        *(_QWORD *)&v142 = 0;
        *((_QWORD *)&v142 + 1) = &v142;
        v143 = 0x4812000000;
        v144 = __Block_byref_object_copy__109;
        v145 = __Block_byref_object_dispose__110;
        v146 = &unk_193F4554F;
        memset(v147, 0, 24);
        objc_msgSend(v29, "relatedProperties");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v141[0] = MEMORY[0x1E0C809B0];
        v141[1] = 3221225472;
        v141[2] = __89__MPMediaLibraryEntityTranslator_entityQueryForPropertySet_sortDescriptors_context_view___block_invoke_112;
        v141[3] = &unk_1E3162868;
        v141[4] = self;
        v141[5] = v29;
        v141[6] = &v142;
        v141[7] = a2;
        objc_msgSend(v30, "enumerateKeysAndObjectsUsingBlock:", v141);

        v131 = v28;
        v32 = *(_QWORD *)(*((_QWORD *)&v142 + 1) + 48);
        v31 = *(_QWORD *)(*((_QWORD *)&v142 + 1) + 56);
        v33 = v31 - v32;
        if (v31 - v32 >= 1)
        {
          v34 = v33 / 56;
          v35 = v152.u64[1];
          v36 = v152.i64[0];
          v37 = (v152.i64[1] - v152.i64[0]) / 56;
          v38 = v152.i64[0] + 56 * v37;
          if (0x6DB6DB6DB6DB6DB7 * ((v153[0] - v152.i64[1]) >> 3) >= v33 / 56)
          {
            v42 = v152.i64[1] - v38;
            v133 = v152.u64[1];
            if (0x6DB6DB6DB6DB6DB7 * ((v152.i64[1] - v38) >> 3) >= v34)
            {
              v132 = v32 + 56 * v34;
              v45 = v152.i64[1];
            }
            else
            {
              v132 = v32 + 8 * ((v152.i64[1] - v38) >> 3);
              if (v132 == v31)
              {
                v45 = v152.i64[1];
              }
              else
              {
                v121 = v152.i64[1] - v38;
                v122 = v152.i64[0];
                v124 = (v152.i64[1] - v152.i64[0]) / 56;
                v43 = 0;
                do
                {
                  v44 = v35 + v43;
                  *(_QWORD *)(v35 + v43) = MEMORY[0x1E0D4AF50] + 16;
                  std::unordered_map<mlcore::EntityClass *,mlcore::ModelPropertyBase *>::unordered_map(v35 + v43 + 8, v132 + v43 + 8);
                  *(_DWORD *)(v44 + 48) = *(_DWORD *)(v132 + v43 + 48);
                  v43 += 56;
                  v35 = v133;
                }
                while (v132 + v43 != v31);
                v45 = v133 + v43;
                v11 = v123;
                v37 = v124;
                v27 = v128;
                v42 = v121;
                v36 = v122;
              }
              v152.i64[1] = v45;
              if (v42 < 1)
                goto LABEL_99;
            }
            v57 = v38 + 56 * v34;
            v58 = v45 - 56 * v34;
            v59 = v45;
            if (v58 < v35)
            {
              v60 = v37;
              v61 = 0;
              v125 = v57;
              v62 = v36 + 8 * ((v45 - v57) >> 3) + 56 * v60;
              v63 = MEMORY[0x1E0D4AF50];
              do
              {
                *(_QWORD *)(v45 + v61) = v63 + 16;
                std::__hash_table<std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<mlcore::EntityClass *,std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::hash<mlcore::EntityClass *>,std::equal_to<mlcore::EntityClass *>,true>,std::__unordered_map_equal<mlcore::EntityClass *,std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::equal_to<mlcore::EntityClass *>,std::hash<mlcore::EntityClass *>,true>,std::allocator<std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>>>::__hash_table(v45 + v61 + 8, (uint64_t *)(v62 + v61 + 8));
                *(_DWORD *)(v45 + v61 + 48) = *(_DWORD *)(v62 + v61 + 48);
                v61 += 56;
              }
              while (v62 + v61 < v133);
              v59 = v45 + v61;
              v11 = v123;
              v57 = v125;
              self = v126;
              v27 = v128;
            }
            v152.i64[1] = v59;
            if (v45 != v57)
            {
              do
              {
                if (*(_QWORD *)(v45 - 24))
                {
                  v64 = *(_QWORD **)(v45 - 32);
                  if (v64)
                  {
                    do
                    {
                      v65 = (_QWORD *)*v64;
                      operator delete(v64);
                      v64 = v65;
                    }
                    while (v65);
                  }
                  *(_QWORD *)(v45 - 32) = 0;
                  v66 = *(_QWORD *)(v45 - 40);
                  if (v66)
                  {
                    for (i = 0; i != v66; ++i)
                      *(_QWORD *)(*(_QWORD *)(v45 - 48) + 8 * i) = 0;
                  }
                  *(_QWORD *)(v45 - 24) = 0;
                }
                v68 = *(_QWORD *)(v58 - 48);
                *(_QWORD *)(v58 - 48) = 0;
                v69 = *(void **)(v45 - 48);
                *(_QWORD *)(v45 - 48) = v68;
                if (v69)
                  operator delete(v69);
                v70 = *(_QWORD *)(v58 - 32);
                v71 = *(_QWORD *)(v58 - 40);
                *(_QWORD *)(v45 - 32) = v70;
                v72 = v45 - 32;
                *(_QWORD *)(v45 - 40) = v71;
                *(_QWORD *)(v58 - 40) = 0;
                v73 = *(_QWORD *)(v58 - 24);
                *(_QWORD *)(v72 + 8) = v73;
                *(_DWORD *)(v72 + 16) = *(_DWORD *)(v58 - 16);
                if (v73)
                {
                  v74 = *(_QWORD *)(v70 + 8);
                  v75 = *(_QWORD *)(v45 - 40);
                  if ((v75 & (v75 - 1)) != 0)
                  {
                    if (v74 >= v75)
                      v74 %= v75;
                  }
                  else
                  {
                    v74 &= v75 - 1;
                  }
                  *(_QWORD *)(*(_QWORD *)(v45 - 48) + 8 * v74) = v72;
                  *(_QWORD *)(v58 - 32) = 0;
                  *(_QWORD *)(v58 - 24) = 0;
                }
                *(_DWORD *)(v45 - 8) = *(_DWORD *)(v58 - 8);
                v45 -= 56;
                v58 -= 56;
              }
              while (v58 != v38);
            }
            while (v32 != v132)
            {
              if (v38 != v32)
              {
                *(_DWORD *)(v38 + 40) = *(_DWORD *)(v32 + 40);
                v76 = *(_QWORD **)(v32 + 24);
                v77 = *(_QWORD *)(v38 + 16);
                if (!v77)
                  goto LABEL_94;
                for (j = 0; j != v77; *(_QWORD *)(*(_QWORD *)(v38 + 8) + 8 * j++) = 0)
                  ;
                v79 = *(_QWORD **)(v38 + 24);
                *(_QWORD *)(v38 + 24) = 0;
                *(_QWORD *)(v38 + 32) = 0;
                if (v79)
                {
                  while (v76)
                  {
                    v79[2] = v76[2];
                    v79[3] = v76[3];
                    v80 = (_QWORD *)*v79;
                    std::__hash_table<std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<mlcore::EntityClass *,std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::hash<mlcore::EntityClass *>,std::equal_to<mlcore::EntityClass *>,true>,std::__unordered_map_equal<mlcore::EntityClass *,std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::equal_to<mlcore::EntityClass *>,std::hash<mlcore::EntityClass *>,true>,std::allocator<std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>>>::__node_insert_multi(v38 + 8, v79);
                    v76 = (_QWORD *)*v76;
                    v79 = v80;
                    if (!v80)
                      goto LABEL_94;
                  }
                  do
                  {
                    v85 = (_QWORD *)*v79;
                    operator delete(v79);
                    v79 = v85;
                  }
                  while (v85);
                }
                else
                {
LABEL_94:
                  while (v76)
                  {
                    v81 = operator new(0x20uLL);
                    *(_QWORD *)v81 = 0;
                    v81[1] = *((_OWORD *)v76 + 1);
                    v82 = *((_QWORD *)v81 + 2);
                    v83 = HIDWORD(v82);
                    v84 = 0x9DDFEA08EB382D69 * (((8 * v82) + 8) ^ HIDWORD(v82));
                    *((_QWORD *)v81 + 1) = 0x9DDFEA08EB382D69
                                         * ((0x9DDFEA08EB382D69 * (v83 ^ (v84 >> 47) ^ v84)) ^ ((0x9DDFEA08EB382D69
                                                                                                 * (v83 ^ (v84 >> 47) ^ v84)) >> 47));
                    std::__hash_table<std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<mlcore::EntityClass *,std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::hash<mlcore::EntityClass *>,std::equal_to<mlcore::EntityClass *>,true>,std::__unordered_map_equal<mlcore::EntityClass *,std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::equal_to<mlcore::EntityClass *>,std::hash<mlcore::EntityClass *>,true>,std::allocator<std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>>>::__node_insert_multi(v38 + 8, v81);
                    v76 = (_QWORD *)*v76;
                  }
                }
              }
              *(_DWORD *)(v38 + 48) = *(_DWORD *)(v32 + 48);
              v32 += 56;
              v38 += 56;
            }
          }
          else
          {
            v39 = v37 + v34;
            if ((unint64_t)(v37 + v34) > 0x492492492492492)
              std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
            if (0xDB6DB6DB6DB6DB6ELL * ((v153[0] - v152.i64[0]) >> 3) > v39)
              v39 = 0xDB6DB6DB6DB6DB6ELL * ((v153[0] - v152.i64[0]) >> 3);
            if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((v153[0] - v152.i64[0]) >> 3)) >= 0x249249249249249)
              v40 = 0x492492492492492;
            else
              v40 = v39;
            v177 = v153;
            if (v40)
              v40 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::MultiSortDescriptor>>(v40);
            else
              v41 = 0;
            v46 = 0;
            v47 = (void **)(v40 + 56 * v37);
            v173 = (void **)v40;
            v174 = v47;
            v175 = v47;
            v176 = v40 + 56 * v41;
            v48 = 56 * v34;
            v49 = &v47[(unint64_t)v48 / 8];
            do
            {
              v47[v46 / 8] = (void *)v134;
              std::unordered_map<mlcore::EntityClass *,mlcore::ModelPropertyBase *>::unordered_map((uint64_t)&v47[v46 / 8 + 1], v32 + v46 + 8);
              LODWORD(v47[v46 / 8 + 6]) = *(_DWORD *)(v32 + v46 + 48);
              v46 += 56;
            }
            while (v48 != v46);
            v175 = &v47[(unint64_t)v48 / 8];
            v50 = v174;
            v51 = v152.i64[0];
            if (v152.i64[0] == v38)
            {
              self = v126;
              v53 = MEMORY[0x1E0D4AF50];
            }
            else
            {
              v52 = 0;
              self = v126;
              v53 = MEMORY[0x1E0D4AF50];
              do
              {
                v50[v52 - 7] = (void *)(v53 + 16);
                std::__hash_table<std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<mlcore::EntityClass *,std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::hash<mlcore::EntityClass *>,std::equal_to<mlcore::EntityClass *>,true>,std::__unordered_map_equal<mlcore::EntityClass *,std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::equal_to<mlcore::EntityClass *>,std::hash<mlcore::EntityClass *>,true>,std::allocator<std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>>>::__hash_table((uint64_t)&v50[v52 - 6], (uint64_t *)(v38 + v52 * 8 - 48));
                LODWORD(v50[v52 - 1]) = *(_DWORD *)(v38 + v52 * 8 - 8);
                v52 -= 7;
              }
              while (v38 + v52 * 8 != v51);
              v50 = (void **)((char *)v50 + v52 * 8);
              v49 = v175;
            }
            v174 = v50;
            v54 = v152.i64[1];
            v27 = v128;
            if (v152.i64[1] != v38)
            {
              do
              {
                *v49 = (void *)(v53 + 16);
                std::__hash_table<std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<mlcore::EntityClass *,std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::hash<mlcore::EntityClass *>,std::equal_to<mlcore::EntityClass *>,true>,std::__unordered_map_equal<mlcore::EntityClass *,std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>,std::equal_to<mlcore::EntityClass *>,std::hash<mlcore::EntityClass *>,true>,std::allocator<std::__hash_value_type<mlcore::EntityClass *,mlcore::ModelPropertyBase *>>>::__hash_table((uint64_t)(v49 + 1), (uint64_t *)(v38 + 8));
                *((_DWORD *)v49 + 12) = *(_DWORD *)(v38 + 48);
                v38 += 56;
                v49 += 7;
              }
              while (v38 != v54);
              v50 = v174;
              v38 = v152.i64[1];
            }
            v55 = (void **)v152.i64[0];
            v56 = v153[0];
            v152.i64[0] = (uint64_t)v50;
            v152.i64[1] = (uint64_t)v49;
            v153[0] = v176;
            v175 = (void **)v38;
            v176 = v56;
            v174 = v55;
            v173 = v55;
            std::__split_buffer<mlcore::MultiSortDescriptor>::~__split_buffer((uint64_t)&v173);
          }
        }
LABEL_99:
        _Block_object_dispose(&v142, 8);
        v173 = (void **)v147;
        std::vector<mlcore::MultiSortDescriptor>::__destroy_vector::operator()[abi:ne180100](&v173);
        v28 = v131 + 1;
      }
      while (v131 + 1 != v27);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v148, v178, 16);
    }
    while (v27);
  }

  mlcore::MultiEntityQuery::setMultiSortDescriptors();
  *(_QWORD *)&v142 = &v152;
  std::vector<mlcore::MultiSortDescriptor>::__destroy_vector::operator()[abi:ne180100]((void ***)&v142);

  _Block_object_dispose(&v160, 8);
  v87 = v166;
  if (v166)
  {
    v88 = (unint64_t *)&v166->__shared_owners_;
    do
      v89 = __ldaxr(v88);
    while (__stlxr(v89 - 1, v88));
    if (!v89)
    {
      ((void (*)(std::__shared_weak_count *))v87->__on_zero_shared)(v87);
      std::__shared_weak_count::__release_weak(v87);
    }
  }
LABEL_130:
  if (objc_msgSend(v119, "sortUsingAllowedEntityIdentifiers"))
  {
    v142 = 0uLL;
    v143 = 0;
    mlcore::PropertiesQuery::setSortDescriptors();
    v160 = (void ***)&v142;
    std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100]((void ***)&v160);
  }
  if (v170)
  {
    v171 = v170;
    operator delete(v170);
  }

  result.__cntrl_ = v110;
  result.__ptr_ = v109;
  return result;
}

- (vector<mlcore::ModelPropertyBase)MLCorePropertiesForPropertySet:(MPMediaLibraryEntityTranslator *)self
{
  return -[MPMediaLibraryEntityTranslator _MLCorePropertiesForPropertySet:withForeignPropertyBase:](self, "_MLCorePropertiesForPropertySet:withForeignPropertyBase:", a4, 0);
}

- (vector<mlcore::SortDescriptor,)MLCoreSortDescriptorsForModelSortDescriptors:(MPMediaLibraryEntityTranslator *)self
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void (**v16)(_QWORD *__return_ptr);
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  SortDescriptor *var0;
  SortDescriptor *var1;
  uint64_t v22;
  uint64_t v23;
  SortDescriptor *v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  SortDescriptor *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t *v35;
  unint64_t v36;
  uint64_t v37;
  SortDescriptor *v38;
  uint64_t v39;
  uint64_t v40;
  SortDescriptor *v41;
  uint64_t v42;
  vector<mlcore::SortDescriptor, std::allocator<mlcore::SortDescriptor>> *v43;
  SortDescriptor *v44;
  SortDescriptor *v45;
  SortDescriptor *v46;
  void (**v47)(SortDescriptor *);
  BOOL v48;
  char *v49;
  SortDescriptor *v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  std::__shared_weak_count *v60;
  unint64_t *p_shared_owners;
  unint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  vector<mlcore::SortDescriptor, std::allocator<mlcore::SortDescriptor>> *result;
  id obj;
  uint64_t v70;
  vector<mlcore::SortDescriptor, std::allocator<mlcore::SortDescriptor>> *v71;
  uint64_t v73;
  uint64_t v74;
  std::__shared_weak_count *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  void **v80;
  void *v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  v71 = retstr;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
  if (v6)
  {
    v70 = *(_QWORD *)v77;
    v7 = MEMORY[0x1E0D4AF48];
    v8 = MEMORY[0x1E0D4AF48] + 16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v77 != v70)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "keyPath");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v10, "key");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = v12;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

        }
        if (!objc_msgSend(v11, "count"))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("MPMediaLibraryEntityTranslator.mm"), 431, CFSTR("Sort descriptor must have at least one key."));

        }
        -[MPMediaLibraryEntityTranslator _propertyTranslatorForKeyPath:](self, "_propertyTranslatorForKeyPath:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromClass(-[MPMediaLibraryEntityTranslator MPModelClass](self, "MPModelClass"));
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("MPMediaLibraryEntityTranslator.mm"), 434, CFSTR("Property mapping missing for %@:%@"), v65, v11);

        }
        objc_msgSend(v13, "sortTransformer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14 == 0;

        if (v15)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("MPMediaLibraryEntityTranslator.mm"), 435, CFSTR("Sort descriptor missing transformer: %@"), v10);

        }
        -[MPMediaLibraryEntityTranslator _propertyMapForKeyPath:includePropertiesToSort:](self, "_propertyMapForKeyPath:includePropertiesToSort:", v11, 1);
        objc_msgSend(v13, "sortTransformer");
        v16 = (void (**)(_QWORD *__return_ptr))objc_claimAutoreleasedReturnValue();
        v16[2](&v73);

        v18 = v73;
        v17 = v74;
        if (v74 - v73 >= 1)
        {
          v19 = 0xAAAAAAAAAAAAAAABLL * ((v74 - v73) >> 3);
          var0 = v71->var0;
          var1 = v71->var1;
          v22 = (var1 - v71->var0) / 24;
          v23 = (uint64_t)v71->var0 + 24 * v22;
          v24 = v71->var2.var0;
          if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * ((v24 - var1) >> 3)) >= v19)
          {
            if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * (((uint64_t)var1 - v23) >> 3)) >= v19)
            {
              v29 = v73 + 8 * ((v74 - v73) >> 3);
              v31 = v71->var1;
            }
            else
            {
              v29 = v73 + 8 * (((uint64_t)var1 - v23) >> 3);
              if (v29 == v74)
              {
                v31 = v71->var1;
              }
              else
              {
                v30 = v73 + 8 * (((uint64_t)var1 - v23) >> 3);
                v31 = v71->var1;
                do
                {
                  *(_QWORD *)v31 = v7 + 16;
                  v32 = *(_QWORD *)(v30 + 8);
                  *((_DWORD *)v31 + 4) = *(_DWORD *)(v30 + 16);
                  *((_QWORD *)v31 + 1) = v32;
                  v30 += 24;
                  v31 = (SortDescriptor *)((char *)v31 + 24);
                }
                while (v30 != v17);
              }
              v71->var1 = v31;
              if ((uint64_t)var1 - v23 < 1)
                goto LABEL_58;
            }
            v49 = (char *)v31 - 24 * v19;
            v50 = v31;
            while (v49 < (char *)var1)
            {
              *(_QWORD *)v50 = v7 + 16;
              v51 = *((_QWORD *)v49 + 1);
              *((_DWORD *)v50 + 4) = *((_DWORD *)v49 + 4);
              *((_QWORD *)v50 + 1) = v51;
              v49 += 24;
              v50 = (SortDescriptor *)((char *)v50 + 24);
            }
            v52 = v23 + 24 * v19;
            v71->var1 = v50;
            if (v31 != (SortDescriptor *)v52)
            {
              v53 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v31 - v52) >> 3);
              v54 = (char *)v31 - 16;
              v55 = (uint64_t)var0 + 24 * v22 - 16;
              v56 = 24 * v53;
              do
              {
                v57 = *(_QWORD *)(v55 + v56);
                *((_DWORD *)v54 + 2) = *(_DWORD *)(v55 + v56 + 8);
                *(_QWORD *)v54 = v57;
                v54 -= 24;
                v56 -= 24;
              }
              while (v56);
            }
            if (v29 != v18)
            {
              v58 = (uint64_t)var0 + 24 * v22 + 8;
              do
              {
                v59 = *(_QWORD *)(v18 + 8);
                *(_DWORD *)(v58 + 8) = *(_DWORD *)(v18 + 16);
                *(_QWORD *)v58 = v59;
                v58 += 24;
                v18 += 24;
              }
              while (v18 != v29);
            }
          }
          else
          {
            if ((unint64_t)(v22 - 0x5555555555555555 * ((v74 - v73) >> 3)) > 0xAAAAAAAAAAAAAAALL)
              std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
            v25 = 0xAAAAAAAAAAAAAAABLL * ((v24 - var0) >> 3);
            v26 = 2 * v25;
            if (2 * v25 <= v22 - 0x5555555555555555 * ((v74 - v73) >> 3))
              v26 = v22 - 0x5555555555555555 * ((v74 - v73) >> 3);
            if (v25 >= 0x555555555555555)
              v27 = 0xAAAAAAAAAAAAAAALL;
            else
              v27 = v26;
            if (v27)
              v27 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v27);
            else
              v28 = 0;
            v33 = v27 + 24 * v22;
            v34 = v33 + 24 * v19;
            v35 = (uint64_t *)(v18 + 8);
            v36 = v33;
            do
            {
              *(_QWORD *)v36 = v8;
              v37 = *v35;
              *(_DWORD *)(v36 + 16) = *((_DWORD *)v35 + 2);
              *(_QWORD *)(v36 + 8) = v37;
              v35 += 3;
              v36 += 24;
            }
            while (v36 != v34);
            v38 = v71->var0;
            if (v71->var0 != (SortDescriptor *)v23)
            {
              v39 = v23;
              do
              {
                *(_QWORD *)(v33 - 24) = v7 + 16;
                v33 -= 24;
                v40 = *(_QWORD *)(v39 - 16);
                *(_DWORD *)(v33 + 16) = *(_DWORD *)(v39 - 8);
                *(_QWORD *)(v33 + 8) = v40;
                v39 -= 24;
              }
              while ((SortDescriptor *)v39 != v38);
            }
            v41 = v71->var1;
            if (v41 == (SortDescriptor *)v23)
            {
              v43 = v71;
            }
            else
            {
              do
              {
                *(_QWORD *)v34 = v7 + 16;
                v42 = *(_QWORD *)(v23 + 8);
                *(_DWORD *)(v34 + 16) = *(_DWORD *)(v23 + 16);
                *(_QWORD *)(v34 + 8) = v42;
                v23 += 24;
                v34 += 24;
              }
              while ((SortDescriptor *)v23 != v41);
              v43 = v71;
              v23 = (uint64_t)v71->var1;
            }
            v44 = v43->var0;
            v43->var0 = (SortDescriptor *)v33;
            v43->var1 = (SortDescriptor *)v34;
            v43->var2.var0 = (SortDescriptor *)(v27 + 24 * v28);
            if ((SortDescriptor *)v23 != v44)
            {
              v45 = (SortDescriptor *)(v23 - 24);
              v46 = v45;
              do
              {
                v47 = *(void (***)(SortDescriptor *))v46;
                v46 = (SortDescriptor *)((char *)v46 - 24);
                (*v47)(v45);
                v48 = v45 == v44;
                v45 = v46;
              }
              while (!v48);
            }
            if (v44)
              operator delete(v44);
          }
        }
LABEL_58:
        v80 = (void **)&v73;
        std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100](&v80);
        v60 = v75;
        if (v75)
        {
          p_shared_owners = (unint64_t *)&v75->__shared_owners_;
          do
            v62 = __ldaxr(p_shared_owners);
          while (__stlxr(v62 - 1, p_shared_owners));
          if (!v62)
          {
            ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
            std::__shared_weak_count::__release_weak(v60);
          }
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
    }
    while (v6);
  }

  return result;
}

- (vector<std::shared_ptr<mlcore::Predicate>,)MLCorePredicateForModelPropertyFilters:(MPMediaLibraryEntityTranslator *)self
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void (**v14)(_QWORD *__return_ptr);
  char *var0;
  char *var1;
  uint64_t v17;
  uint64_t v18;
  MPMediaLibraryEntityTranslator *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t *v29;
  unint64_t v30;
  _QWORD *v31;
  unint64_t v32;
  unint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  char *v41;
  int64x2_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  unint64_t *v46;
  unint64_t v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  unint64_t *p_shared_owners;
  unint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  vector<std::shared_ptr<mlcore::Predicate>, std::allocator<std::shared_ptr<mlcore::Predicate>>> *result;
  id obj;
  __compressed_pair<std::shared_ptr<mlcore::Predicate> *, std::allocator<std::shared_ptr<mlcore::Predicate>>> *p_var2;
  vector<std::shared_ptr<mlcore::Predicate>, std::allocator<std::shared_ptr<mlcore::Predicate>>> *v60;
  void *v61;
  void *v62;
  std::__shared_weak_count *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  char *v69;
  __int128 v70;
  char *v71;
  __compressed_pair<std::shared_ptr<mlcore::Predicate> *, std::allocator<std::shared_ptr<mlcore::Predicate>>> *v72;
  char *v73;
  int64x2_t v74;
  char *v75;
  __compressed_pair<std::shared_ptr<mlcore::Predicate> *, std::allocator<std::shared_ptr<mlcore::Predicate>>> *v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  v60 = retstr;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
  if (v7)
  {
    p_var2 = &retstr->var2;
    v8 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v66 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
        objc_msgSend(v10, "keys");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "value");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "comparisonType");
        -[MPMediaLibraryEntityTranslator _propertyTranslatorForKeyPath:](self, "_propertyTranslatorForKeyPath:", v62);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromClass(-[MPMediaLibraryEntityTranslator MPModelClass](self, "MPModelClass"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("MPMediaLibraryEntityTranslator.mm"), 454, CFSTR("Property mapping missing for %@:%@"), v54, v62);

        }
        objc_msgSend(v11, "filterTransformer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12 == 0;

        if (v13)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("MPMediaLibraryEntityTranslator.mm"), 455, CFSTR("Property filter transformer missing for property filter: %@"), v10);

        }
        -[MPMediaLibraryEntityTranslator _propertyMapForKeyPath:includePropertiesToSort:](self, "_propertyMapForKeyPath:includePropertiesToSort:", v62, 0);
        objc_msgSend(v11, "filterTransformer");
        v14 = (void (**)(_QWORD *__return_ptr))objc_claimAutoreleasedReturnValue();
        ((void (**)(__int128 *__return_ptr))v14)[2](&v64);

        var1 = (char *)v60->var1;
        var0 = (char *)v60->var2.var0;
        if (var1 < var0)
        {
          v28 = *((_QWORD *)&v64 + 1);
          *(_OWORD *)var1 = v64;
          if (v28)
          {
            v29 = (unint64_t *)(v28 + 8);
            do
              v30 = __ldxr(v29);
            while (__stxr(v30 + 1, v29));
          }
          v60->var1 = var1 + 16;
        }
        else
        {
          v17 = v8;
          v18 = v7;
          v19 = self;
          v20 = (char *)v60->var0;
          v21 = var1 - (char *)v60->var0;
          v22 = v21 >> 4;
          v23 = (v21 >> 4) + 1;
          if ((unint64_t)v23 >> 60)
            std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
          v24 = var0 - v20;
          v25 = v24 >> 3;
          if (v24 >> 3 <= (unint64_t)v23)
            v25 = (v21 >> 4) + 1;
          if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF0)
            v26 = 0xFFFFFFFFFFFFFFFLL;
          else
            v26 = v25;
          v72 = p_var2;
          if (v26)
            v26 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v26);
          else
            v27 = 0;
          v31 = (_QWORD *)(v26 + 16 * v22);
          v69 = (char *)v26;
          *(_QWORD *)&v70 = v31;
          *((_QWORD *)&v70 + 1) = v31;
          v71 = (char *)(v26 + 16 * v27);
          if (v22 == v27)
          {
            if (v21 < 1)
            {
              if (v20 == var1)
                v33 = 1;
              else
                v33 = v21 >> 3;
              v76 = p_var2;
              v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v33);
              v36 = v70;
              v37 = *((_QWORD *)&v70 + 1) - v70;
              if (*((_QWORD *)&v70 + 1) == (_QWORD)v70)
              {
                v42 = vdupq_n_s64(v70);
                v39 = (unint64_t)&v34[16 * (v33 >> 2)];
              }
              else
              {
                v38 = v37 >> 4;
                v39 = (unint64_t)&v34[16 * (v33 >> 2) + (v37 & 0xFFFFFFFFFFFFFFF0)];
                v40 = 16 * v38;
                v41 = &v34[16 * (v33 >> 2)];
                do
                {
                  *(_OWORD *)v41 = *(_OWORD *)v36;
                  v41 += 16;
                  *(_QWORD *)v36 = 0;
                  *(_QWORD *)(v36 + 8) = 0;
                  v36 += 16;
                  v40 -= 16;
                }
                while (v40);
                v42 = (int64x2_t)v70;
              }
              v43 = v69;
              v44 = v71;
              v69 = v34;
              *(_QWORD *)&v70 = &v34[16 * (v33 >> 2)];
              v74 = v42;
              *((_QWORD *)&v70 + 1) = v39;
              v71 = &v34[16 * v35];
              v73 = v43;
              v75 = v44;
              std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v73);
              v31 = (_QWORD *)*((_QWORD *)&v70 + 1);
            }
            else
            {
              if (v23 >= 0)
                v32 = (v21 >> 4) + 1;
              else
                v32 = (v21 >> 4) + 2;
              v31 -= 2 * (v32 >> 1);
              *(_QWORD *)&v70 = v31;
              *((_QWORD *)&v70 + 1) = v31;
            }
          }
          *v31 = v64;
          v45 = *((_QWORD *)&v64 + 1);
          v31[1] = *((_QWORD *)&v64 + 1);
          self = v19;
          v7 = v18;
          v8 = v17;
          if (v45)
          {
            v46 = (unint64_t *)(v45 + 8);
            do
              v47 = __ldxr(v46);
            while (__stxr(v47 + 1, v46));
            v31 = (_QWORD *)*((_QWORD *)&v70 + 1);
          }
          *((_QWORD *)&v70 + 1) = v31 + 2;
          std::vector<std::shared_ptr<mlcore::Predicate>>::__swap_out_circular_buffer(v60, &v69, var1);
          std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v69);
        }
        v48 = (std::__shared_weak_count *)*((_QWORD *)&v64 + 1);
        if (*((_QWORD *)&v64 + 1))
        {
          v49 = (unint64_t *)(*((_QWORD *)&v64 + 1) + 8);
          do
            v50 = __ldaxr(v49);
          while (__stlxr(v50 - 1, v49));
          if (!v50)
          {
            ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
            std::__shared_weak_count::__release_weak(v48);
          }
        }
        if (v63)
        {
          p_shared_owners = (unint64_t *)&v63->__shared_owners_;
          do
            v52 = __ldaxr(p_shared_owners);
          while (__stlxr(v52 - 1, p_shared_owners));
          if (!v52)
          {
            ((void (*)())v63->__on_zero_shared)();
            std::__shared_weak_count::__release_weak(v63);
          }
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
    }
    while (v7);
  }

  return result;
}

+ (id)translatorForMPModelClass:(Class)a3 mlcoreEntityClass:(void *)a4
{
  return (id)objc_msgSend(a1, "_translatorForMPModelClass:mlcoreEntityClass:create:transient:", a3, a4, 1, 0);
}

- (void)mapRelationshipKey:(id)a3 toModelClass:(Class)a4 usingForeignPropertyBase:(void *)a5
{
  -[MPMediaLibraryEntityTranslator mapRelationshipKey:toModelClass:transient:usingForeignPropertyBase:](self, "mapRelationshipKey:toModelClass:transient:usingForeignPropertyBase:", a3, a4, 0, a5);
}

- (void)setEntityQueryBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setAllowedItemPredicatesBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

+ (id)translatorForTransientMPModelClass:(Class)a3
{
  return (id)objc_msgSend(a1, "_translatorForMPModelClass:mlcoreEntityClass:create:transient:", a3, 0, 1, 1);
}

void __88__MPMediaLibraryEntityTranslator_mapPropertyKey_withPropertiesToFetch_valueTransformer___block_invoke(_QWORD *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, _QWORD *a4@<X8>)
{
  id v7;
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  int v11;

  v7 = a3;
  if (*(_QWORD *)(a2 + 24) != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("MPMediaLibraryEntityTranslator.mm"), 233, CFSTR("Sorting by %@ is ambiguous, please define sortTransformer."), a1[5]);

  }
  objc_msgSend(v7, "_MPMediaLibraryEntityTranslator_MLCoreSortDescriptorOrdering");
  mlcore::SortDescriptor::SortDescriptor();
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  v8 = operator new(0x18uLL);
  a4[2] = v8 + 3;
  *v8 = MEMORY[0x1E0D4AF48] + 16;
  v8[1] = v10;
  *((_DWORD *)v8 + 4) = v11;
  *a4 = v8;
  a4[1] = v8 + 3;

}

- (shared_ptr<mlcore::PropertiesQuery>)propertiesQueryForPropertySet:(id)a3 scopedContainers:(id)a4 allowedItemIdentifiers:(id)a5 view:(id)a6
{
  _QWORD *v6;
  _QWORD *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void (**allowedItemPredicatesBlock)(_OWORD *__return_ptr);
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  char *v20;
  int64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  char *v26;
  uint64_t v27;
  unint64_t *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  char *v32;
  uint64_t v33;
  unint64_t *v34;
  unint64_t v35;
  _QWORD *v36;
  char *v37;
  char *v38;
  __int128 v39;
  char *v40;
  char *v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  void *entityClass;
  std::__shared_weak_count *v47;
  unint64_t *v48;
  unint64_t v49;
  std::__shared_weak_count *v50;
  unint64_t *v51;
  unint64_t v52;
  PropertiesQuery *v53;
  __shared_weak_count *v54;
  char *v55;
  char *v56;
  unint64_t v57;
  void *__p;
  void *v59;
  _QWORD v60[3];
  _OWORD v61[2];
  __int128 v62;
  char *v63;
  unint64_t v64;
  unint64_t *v65;
  shared_ptr<mlcore::PropertiesQuery> result;

  v11 = v6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v55 = 0;
  v56 = 0;
  v57 = 0;
  if (objc_msgSend(v14, "count"))
  {
    allowedItemPredicatesBlock = (void (**)(_OWORD *__return_ptr))self->_allowedItemPredicatesBlock;
    if (allowedItemPredicatesBlock)
    {
      allowedItemPredicatesBlock[2](v61);
      v17 = (_QWORD *)*((_QWORD *)&v61[0] + 1);
      v18 = *(uint64_t **)&v61[0];
      if ((uint64_t)(*((_QWORD *)&v61[0] + 1) - *(_QWORD *)&v61[0]) >= 1)
      {
        v19 = (uint64_t)(*((_QWORD *)&v61[0] + 1) - *(_QWORD *)&v61[0]) >> 4;
        v20 = v56;
        if (v19 <= (uint64_t)(v57 - (_QWORD)v56) >> 4)
        {
          if (v19 <= 0)
          {
            v30 = *(_QWORD *)&v61[0] + 16 * v19;
            std::vector<std::shared_ptr<mlcore::Predicate>>::__move_range((uint64_t)&v55, v56, (unint64_t)v56, &v56[16 * v19]);
            if ((uint64_t *)v30 != v18)
            {
              do
              {
                v43 = *v18;
                v44 = v18[1];
                v18 += 2;
                std::shared_ptr<mlcore::QueryResult>::operator=[abi:ne180100](v20, v43, v44);
                v20 += 16;
              }
              while (v18 != (uint64_t *)v30);
            }
          }
          else
          {
            if (*(_QWORD *)&v61[0] == *((_QWORD *)&v61[0] + 1))
            {
              v26 = v56;
            }
            else
            {
              v25 = *(_QWORD **)&v61[0];
              v26 = v56;
              do
              {
                *(_QWORD *)v26 = *v25;
                v27 = v25[1];
                *((_QWORD *)v26 + 1) = v27;
                if (v27)
                {
                  v28 = (unint64_t *)(v27 + 8);
                  do
                    v29 = __ldxr(v28);
                  while (__stxr(v29 + 1, v28));
                }
                v25 += 2;
                v26 += 16;
              }
              while (v25 != v17);
            }
            v56 = v26;
          }
        }
        else
        {
          v21 = (v56 - v55) >> 4;
          if ((unint64_t)(v21 + v19) >> 60)
            std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
          v22 = (uint64_t)(v57 - (_QWORD)v55) >> 3;
          if (v22 <= v21 + v19)
            v22 = v21 + v19;
          if (v57 - (unint64_t)v55 >= 0x7FFFFFFFFFFFFFF0)
            v23 = 0xFFFFFFFFFFFFFFFLL;
          else
            v23 = v22;
          v65 = &v57;
          if (v23)
            v23 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mlcore::LocalizedSearchScope>>>(v23);
          else
            v24 = 0;
          v31 = (uint64_t *)(v23 + 16 * v21);
          *(_QWORD *)&v62 = v23;
          *((_QWORD *)&v62 + 1) = v31;
          v64 = v23 + 16 * v24;
          v32 = (char *)&v31[2 * v19];
          do
          {
            *v31 = *v18;
            v33 = v18[1];
            v31[1] = v33;
            if (v33)
            {
              v34 = (unint64_t *)(v33 + 8);
              do
                v35 = __ldxr(v34);
              while (__stxr(v35 + 1, v34));
            }
            v31 += 2;
            v18 += 2;
          }
          while (v31 != (uint64_t *)v32);
          v63 = v32;
          v36 = (_QWORD *)*((_QWORD *)&v62 + 1);
          v37 = v55;
          if (v55 != v20)
          {
            v38 = v20;
            do
            {
              v39 = *((_OWORD *)v38 - 1);
              v38 -= 16;
              *((_OWORD *)v36 - 1) = v39;
              v36 -= 2;
              *(_QWORD *)v38 = 0;
              *((_QWORD *)v38 + 1) = 0;
            }
            while (v38 != v37);
            v32 = v63;
          }
          *((_QWORD *)&v62 + 1) = v36;
          v40 = v56;
          if (v56 != v20)
          {
            do
            {
              *(_OWORD *)v32 = *(_OWORD *)v20;
              v32 += 16;
              *(_QWORD *)v20 = 0;
              *((_QWORD *)v20 + 1) = 0;
              v20 += 16;
            }
            while (v20 != v40);
            v36 = (_QWORD *)*((_QWORD *)&v62 + 1);
            v20 = v56;
          }
          v41 = v55;
          v42 = v57;
          v55 = (char *)v36;
          v56 = v32;
          v57 = v64;
          v63 = v20;
          v64 = v42;
          *(_QWORD *)&v62 = v41;
          *((_QWORD *)&v62 + 1) = v41;
          std::__split_buffer<std::shared_ptr<mlcore::Predicate>>::~__split_buffer((uint64_t)&v62);
        }
      }
      *(_QWORD *)&v62 = v61;
      std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v62);
    }
  }
  memset(v60, 0, sizeof(v60));
  std::vector<std::shared_ptr<mlcore::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<mlcore::Predicate>*,std::shared_ptr<mlcore::Predicate>*>(v60, v55, v56, (v56 - v55) >> 4);
  mlcore::CreateAndPredicate();
  v45 = (char *)operator new(0x80uLL);
  *(_OWORD *)(v45 + 8) = 0u;
  *(_QWORD *)v45 = &off_1E314A800;
  entityClass = self->_entityClass;
  v62 = v61[0];
  v61[0] = 0u;
  MEMORY[0x194038F80](v45 + 24, entityClass, &v62);
  v47 = (std::__shared_weak_count *)*((_QWORD *)&v62 + 1);
  if (*((_QWORD *)&v62 + 1))
  {
    v48 = (unint64_t *)(*((_QWORD *)&v62 + 1) + 8);
    do
      v49 = __ldaxr(v48);
    while (__stlxr(v49 - 1, v48));
    if (!v49)
    {
      ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
      std::__shared_weak_count::__release_weak(v47);
    }
  }
  *v11 = v45 + 24;
  v11[1] = v45;
  v50 = (std::__shared_weak_count *)*((_QWORD *)&v61[0] + 1);
  if (*((_QWORD *)&v61[0] + 1))
  {
    v51 = (unint64_t *)(*((_QWORD *)&v61[0] + 1) + 8);
    do
      v52 = __ldaxr(v51);
    while (__stlxr(v52 - 1, v51));
    if (!v52)
    {
      ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
      std::__shared_weak_count::__release_weak(v50);
    }
  }
  *(_QWORD *)&v62 = v60;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v62);
  if (*v11)
  {
    -[MPMediaLibraryEntityTranslator MLCorePropertiesForPropertySet:](self, "MLCorePropertiesForPropertySet:", v12);
    mlcore::PropertiesQuery::setPropertiesToFetch();
    if (__p)
    {
      v59 = __p;
      operator delete(__p);
    }
  }
  *(_QWORD *)&v62 = &v55;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v62);

  result.var1 = v54;
  result.var0 = v53;
  return result;
}

- (Class)classForRelationshipKey:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_relationshipsToTranslators, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relationshipModelClass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v4;
}

- (unordered_map<std::string,)propertiesToFetchForPropertyKey:()std:()std:(std:(mlcore:(MPMediaLibraryEntityTranslator *)self :(SEL)a3 ModelPropertyBase *>>> *__return_ptr)retstr :(id)a4 allocator<std::pair<const)std::string :equal_to<std::string> :hash<std::string>
{
  id v7;
  void *v8;
  void *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  unordered_map<std::string, mlcore::ModelPropertyBase *, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, mlcore::ModelPropertyBase *>>> *result;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;

  v7 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_propertiesToTranslators, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(-[MPMediaLibraryEntityTranslator MPModelClass](self, "MPModelClass"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("MPMediaLibraryEntityTranslator.mm"), 474, CFSTR("Property mapping missing for %@:%@"), v16, v7);

LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(-[MPMediaLibraryEntityTranslator MPModelClass](self, "MPModelClass"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("MPMediaLibraryEntityTranslator.mm"), 475, CFSTR("Property translator mapping missing for %@:%@"), v18, v7);

    goto LABEL_8;
  }
  objc_msgSend(v8, "propertiesToFetchMap");
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)())v20->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  if (!v19)
    goto LABEL_15;
LABEL_8:
  objc_msgSend(v9, "propertiesToFetchMap");
  std::unordered_map<std::string,mlcore::ModelPropertyBase *>::unordered_map((uint64_t)retstr, v19);
  if (v20)
  {
    v12 = (unint64_t *)&v20->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)())v20->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v20);
    }
  }

  return result;
}

- (id)_cachedMediaLibraryUniqueIdentifierForKey:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&-[MPMediaLibraryEntityTranslator _cachedMediaLibraryUniqueIdentifierForKey:]::lock);
  objc_msgSend((id)-[MPMediaLibraryEntityTranslator _cachedMediaLibraryUniqueIdentifierForKey:]::libraryIdentifiers, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if (!-[MPMediaLibraryEntityTranslator _cachedMediaLibraryUniqueIdentifierForKey:]::libraryIdentifiers)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)-[MPMediaLibraryEntityTranslator _cachedMediaLibraryUniqueIdentifierForKey:]::libraryIdentifiers;
      -[MPMediaLibraryEntityTranslator _cachedMediaLibraryUniqueIdentifierForKey:]::libraryIdentifiers = v5;

    }
    objc_msgSend(CFSTR("Library-"), "stringByAppendingString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)-[MPMediaLibraryEntityTranslator _cachedMediaLibraryUniqueIdentifierForKey:]::libraryIdentifiers, "setObject:forKeyedSubscript:", v4, v3);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&-[MPMediaLibraryEntityTranslator _cachedMediaLibraryUniqueIdentifierForKey:]::lock);

  return v4;
}

- (BOOL)isTransient
{
  return self->_transient;
}

- (id)allowedItemPredicatesBlock
{
  return self->_allowedItemPredicatesBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_entityQueryBlock, 0);
  objc_storeStrong(&self->_allowedItemPredicatesBlock, 0);
  objc_storeStrong((id *)&self->_MPModelClass, 0);
  objc_storeStrong((id *)&self->_relationshipsToTranslators, 0);
  objc_storeStrong((id *)&self->_propertiesToTranslators, 0);
}

void __120__MPMediaLibraryEntityTranslator__objectForPropertySet_entityClass_propertyCache_baseTranslator_prependKeyPath_context___block_invoke_134(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;

  v16 = a2;
  v7 = a3;
  if (v16 == CFSTR("MPModelRelationshipPlaylistEntrySong"))
  {
    objc_msgSend(v7, "properties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", CFSTR("MPModelPropertySongArtwork"));
    goto LABEL_8;
  }
  if (v16 == CFSTR("MPModelRelationshipPlaylistEntryTVEpisode"))
  {
    objc_msgSend(v7, "properties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", CFSTR("MPModelPropertyTVEpisodeArtwork"));
LABEL_8:
    v12 = v11;

    if ((v12 & 1) == 0)
      goto LABEL_10;
LABEL_9:
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setByAddingObject:", CFSTR("_MPModelPropertyPlaylistEntryArtwork"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    *a4 = 1;
    goto LABEL_10;
  }
  if (v16 == CFSTR("MPModelRelationshipPlaylistEntryMovie"))
  {
    objc_msgSend(v7, "properties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", CFSTR("MPModelPropertyMovieArtwork"));

    if (v9)
      goto LABEL_9;
  }
LABEL_10:

}

void __89__MPMediaLibraryEntityTranslator_entityQueryForPropertySet_sortDescriptors_context_view___block_invoke_112(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64x2_t *v17;
  unint64_t v18;
  uint64_t v19;
  int64x2_t *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void **v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  _DWORD v44[12];
  void **v45;
  uint64_t v46;
  int v47;
  int v48;
  _QWORD v49[2];
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD v54[3];

  v54[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = *(_QWORD *)(a1 + 56);
    v33 = *(void **)(a1 + 32);
    NSStringFromClass((Class)objc_msgSend(v33, "MPModelClass"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", v32, v33, CFSTR("MPMediaLibraryEntityTranslator.mm"), 344, CFSTR("Relationship mapping missing for %@:%@"), v34, v5);

  }
  objc_msgSend(v7, "entityTranslator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", v6, objc_msgSend(*(id *)(a1 + 40), "ascending"));
  v54[0] = objc_claimAutoreleasedReturnValue();
  v40 = (void *)v54[0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v8, "MLCoreSortDescriptorsForModelSortDescriptors:", v9);
  }
  else
  {
    v51 = 0;
    v52 = 0;
    v53 = 0;
  }

  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48);
  v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 56);
  v12 = v51;
  if (v10 == v11)
  {
    v13 = v52;
    if (v51 == v52)
    {
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 56);
    }
    else
    {
      v42 = v8;
      v36 = v7;
      v39 = v5;
      v14 = MEMORY[0x1E0D4AF48] + 16;
      v15 = MEMORY[0x1E0D4AF50];
      v41 = MEMORY[0x1E0D4AF50] + 16;
      do
      {
        v49[0] = v14;
        v16 = *(_QWORD *)(v12 + 8);
        v50 = *(_DWORD *)(v12 + 16);
        v49[1] = v16;
        mlcore::SortDescriptor::ordering((mlcore::SortDescriptor *)v49);
        mlcore::MultiSortDescriptor::MultiSortDescriptor();
        v17 = *(int64x2_t **)(*(_QWORD *)(a1 + 48) + 8);
        v18 = v17[3].u64[1];
        if (v18 >= v17[4].i64[0])
        {
          v19 = std::vector<mlcore::MultiSortDescriptor>::__push_back_slow_path<mlcore::MultiSortDescriptor const&>(v17 + 3, (uint64_t)&v45);
        }
        else
        {
          *(_QWORD *)v18 = v41;
          std::unordered_map<mlcore::EntityClass *,mlcore::ModelPropertyBase *>::unordered_map(v18 + 8, (uint64_t)&v46);
          *(_DWORD *)(v18 + 48) = v48;
          v19 = v18 + 56;
          v17[3].i64[1] = v18 + 56;
        }
        v17[3].i64[1] = v19;
        mlcore::MultiSortDescriptor::MultiSortDescriptor();
        v20 = *(int64x2_t **)(*(_QWORD *)(a1 + 48) + 8);
        v21 = v20[3].u64[1];
        if (v21 >= v20[4].i64[0])
        {
          v22 = std::vector<mlcore::MultiSortDescriptor>::__push_back_slow_path<mlcore::MultiSortDescriptor const&>(v20 + 3, (uint64_t)&v43);
        }
        else
        {
          *(_QWORD *)v21 = v15 + 16;
          std::unordered_map<mlcore::EntityClass *,mlcore::ModelPropertyBase *>::unordered_map(v21 + 8, (uint64_t)v44);
          *(_DWORD *)(v21 + 48) = v44[10];
          v22 = v21 + 56;
          v20[3].i64[1] = v21 + 56;
        }
        v20[3].i64[1] = v22;
        v43 = v15 + 16;
        std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::__unordered_map_hasher<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::hash<mlcore::ModelProperty<int> *>,std::equal_to<mlcore::ModelProperty<int> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::equal_to<mlcore::ModelProperty<int> *>,std::hash<mlcore::ModelProperty<int> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<int> *,int>>>::~__hash_table((uint64_t)v44);
        v45 = (void **)(v15 + 16);
        std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::__unordered_map_hasher<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::hash<mlcore::ModelProperty<int> *>,std::equal_to<mlcore::ModelProperty<int> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::equal_to<mlcore::ModelProperty<int> *>,std::hash<mlcore::ModelProperty<int> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<int> *,int>>>::~__hash_table((uint64_t)&v46);
        v12 += 24;
      }
      while (v12 != v13);
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48);
      v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 56);
      v12 = v51;
      v5 = v39;
      v7 = v36;
      v8 = v42;
    }
  }
  v23 = 0x6DB6DB6DB6DB6DB7 * ((v10 - v11) >> 3);
  v24 = v52;
  if (v23 != 0xAAAAAAAAAAAAAAABLL * ((v52 - v12) >> 3) + 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("MPMediaLibraryEntityTranslator.mm"), 360, CFSTR("All relatedProperties must have the same number of core sort descriptors."));

    v12 = v51;
    v24 = v52;
  }
  if (v24 != v12)
  {
    v37 = v7;
    v38 = v6;
    v25 = 0;
    v26 = 0;
    v27 = 8;
    v28 = (void **)(MEMORY[0x1E0D4AF48] + 16);
    do
    {
      v45 = v28;
      v29 = *(_QWORD *)(v12 + v27);
      v47 = *(_DWORD *)(v12 + v27 + 8);
      v46 = v29;
      mlcore::SortDescriptor::property((mlcore::SortDescriptor *)&v45);
      objc_msgSend(v8, "entityClass");
      mlcore::MultiSortDescriptor::setPropertyForEntityClass();
      ++v26;
      v12 = v51;
      v25 += 56;
      v27 += 24;
    }
    while (v26 < 0xAAAAAAAAAAAAAAABLL * ((v52 - v51) >> 3));
    v6 = v38;
    v7 = v37;
  }
  v30 = objc_msgSend(v8, "entityClass");
  (*(void (**)(uint64_t))(*(_QWORD *)v30 + 112))(v30);
  objc_msgSend(v8, "entityClass");
  mlcore::MultiSortDescriptor::setPropertyForEntityClass();
  v45 = (void **)&v51;
  std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100](&v45);

}

@end
