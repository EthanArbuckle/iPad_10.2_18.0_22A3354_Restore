@implementation MPStoreLibraryPersonalizationCollectionDataSource

- (id)_libraryObjectWithRelativeModelClass:(Class)a3 identifierSet:(id)a4 propertySet:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  os_unfair_lock_s *p_lock;
  MPMediaLibraryEntityTranslationContext *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *p_shared_owners;
  unint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  void *__p;
  uint64_t v30;
  uint64_t v31;
  std::__shared_weak_count *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[3];
  _BYTE v37[24];
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  __int128 v41;
  _BYTE v42[24];
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  mlcore::Entity *v47;
  std::__shared_weak_count *v48;
  void *v49;
  void *v50;
  uint64_t v51;

  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "library");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "persistentID");

  v12 = 0;
  if (v9 && v11)
  {
    +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "entityClass");
    if (v13)
    {
      objc_msgSend(v13, "MLCorePropertiesForPropertySet:", v9);
    }
    else
    {
      __p = 0;
      v30 = 0;
    }
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v50 = 0;
    v51 = 0;
    v49 = 0;
    std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v49, __p, v30, (v30 - (uint64_t)__p) >> 3);
    -[MPStoreLibraryPersonalizationCollectionDataSource _entityCacheForEntityClass:propertiesToFetch:](self, "_entityCacheForEntityClass:propertiesToFetch:", v14, &v49);
    if (v49)
    {
      v50 = v49;
      operator delete(v49);
    }
    *(_OWORD *)&v37[8] = 0u;
    v40 = 1065353216;
    *(_OWORD *)&v42[8] = 0u;
    v46 = MEMORY[0x1E0D4AF40] + 56;
    v39 = 0u;
    v38 = 0u;
    v44 = 0u;
    v43 = 0u;
    v36[0] = 1065353216;
    *(_DWORD *)&v37[16] = 1065353216;
    *(_DWORD *)&v42[16] = 1065353216;
    v45 = 1065353216;
    v34 = 0u;
    v35 = 0u;
    *(_OWORD *)&v36[1] = 0u;
    *(_OWORD *)v37 = 0u;
    v41 = 0u;
    *(_OWORD *)v42 = 0u;
    v33 = MEMORY[0x1E0D4AF40] + 16;
    (*(void (**)(mlcore::Entity **__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t *))(*(_QWORD *)v31 + 24))(&v47, v31, v14, v11, &v33);
    mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase(&v33);
    +[MPMediaLibrary logDatabaseAccess](MPMediaLibrary, "logDatabaseAccess");
    if (v47)
    {
      v16 = objc_alloc_init(MPMediaLibraryEntityTranslationContext);
      -[MPMediaLibraryView library](self->_libraryView, "library");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPMediaLibraryEntityTranslationContext setMediaLibrary:](v16, "setMediaLibrary:", v17);

      +[MPModelKind kindWithModelClass:](MPModelKind, "kindWithModelClass:", a3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPMediaLibraryEntityTranslationContext setModelKind:](v16, "setModelKind:", v18);

      if (objc_msgSend(MEMORY[0x1E0DDC108], "canAccessAccountStore"))
      {
        -[MPMediaLibraryView library](self->_libraryView, "library");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "userIdentity");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "accountDSID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPMediaLibraryEntityTranslationContext setPersonID:](v16, "setPersonID:", v21);

      }
      v22 = (*(uint64_t (**)(mlcore::Entity *))(*(_QWORD *)v47 + 48))(v47);
      objc_msgSend(v13, "objectForPropertySet:entityClass:propertyCache:context:", v9, v22, mlcore::Entity::propertyCache(v47), v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }
    os_unfair_lock_unlock(p_lock);
    v23 = v48;
    if (v48)
    {
      p_shared_owners = (unint64_t *)&v48->__shared_owners_;
      do
        v25 = __ldaxr(p_shared_owners);
      while (__stlxr(v25 - 1, p_shared_owners));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
    }
    if (v32)
    {
      v26 = (unint64_t *)&v32->__shared_owners_;
      do
        v27 = __ldaxr(v26);
      while (__stlxr(v27 - 1, v26));
      if (!v27)
      {
        ((void (*)())v32->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v32);
      }
    }
    if (__p)
      operator delete(__p);

  }
  return v12;
}

- (unint64_t)numberOfSections
{
  return -[MPSectionedCollection numberOfSections](self->_unpersonalizedContentDescriptors, "numberOfSections");
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  return -[MPSectionedCollection numberOfItemsInSection:](self->_unpersonalizedContentDescriptors, "numberOfItemsInSection:", a3);
}

uint64_t __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLyrics:", *(_QWORD *)(a1 + 32));
}

uint64_t __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHasLibraryLyrics:", 0);
}

- (id)itemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  MPPropertySet *v17;
  MPPropertySet *itemProperties;
  MPPropertySet *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  MPPropertySet *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;

  v4 = a3;
  -[MPSectionedCollection itemAtIndexPath:](self->_unpersonalizedContentDescriptors, "itemAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = v5;
  v9 = v8;
  v10 = v8;
  if (v6 == v7)
  {
    objc_msgSend(v8, "model");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "relativeModelObjectForStoreLibraryPersonalization");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_opt_class();
    v10 = v11;
    if (!v13)
    {
LABEL_30:

      goto LABEL_31;
    }
    -[NSMapTable objectForKey:](self->_relativeModelClassToMappingResponse, "objectForKey:", v13);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "libraryIdentifierSetForIdentifierSet:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v46 = v15;
    }
    else
    {
      objc_msgSend(v12, "identifiers");
      v46 = (id)objc_claimAutoreleasedReturnValue();
    }

    -[NSDictionary objectForKey:](self->_itemIndexPathToOverridePropertySet, "objectForKey:", v4);
    v17 = (MPPropertySet *)objc_claimAutoreleasedReturnValue();
    itemProperties = v17;
    if (!v17)
      itemProperties = self->_itemProperties;
    v19 = itemProperties;

    v20 = objc_msgSend(v9, "personalizationStyle");
    if ((unint64_t)(v20 - 1) < 2)
    {
      v42 = v12;
      v43 = v19;
      objc_msgSend(v11, "personalizationScopedPropertiesForProperties:", v19);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (!v27)
      {
        +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
      }
      +[MPStoreLibraryPersonalizationContentDescriptor lightweightPersonalizationPropertiesForModelClass:](MPStoreLibraryPersonalizationContentDescriptor, "lightweightPersonalizationPropertiesForModelClass:", v13);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "propertySetByIntersectingWithPropertySet:", v29);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
      v12 = v42;
      objc_msgSend(v13, "requiredStoreLibraryPersonalizationProperties");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (v30)
      {
        v32 = v30;
      }
      else
      {
        +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
        v32 = (id)objc_claimAutoreleasedReturnValue();
      }
      v34 = v32;

      v44 = v34;
      objc_msgSend(v34, "propertySetByCombiningWithPropertySet:", v41);
      v35 = objc_claimAutoreleasedReturnValue();

      v36 = (void *)v35;
      v45 = (void *)v35;
      +[MPStoreLibraryPersonalizationContentDescriptor requiredLightweightPersonalizationPropertiesForModelClass:requestedProperties:](MPStoreLibraryPersonalizationContentDescriptor, "requiredLightweightPersonalizationPropertiesForModelClass:requestedProperties:", v13, v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "propertySetByCombiningWithPropertySet:", v37);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      -[MPStoreLibraryPersonalizationCollectionDataSource _libraryObjectWithRelativeModelClass:identifierSet:propertySet:](self, "_libraryObjectWithRelativeModelClass:identifierSet:propertySet:", v13, v46, v23);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_lightweightPersonalizedObjectWithUnpersonalizedObject:libraryObject:personalizationProperties:overrideLibraryAddedStatus:", v42, v25, v23, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26 == v42)
      {
        v26 = v42;
        v10 = v11;
      }
      else
      {
        objc_msgSend(v11, "objectWithStoreLibraryPersonalizationRelativeModelObject:", v26);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v38;
        v10 = v11;
        if (v38)
        {
          v10 = v38;

        }
      }
    }
    else
    {
      v10 = v11;
      if ((unint64_t)(v20 - 3) >= 2)
      {
LABEL_29:

        goto LABEL_30;
      }
      objc_msgSend(v11, "personalizationScopedPropertiesForProperties:", v19);
      v21 = objc_claimAutoreleasedReturnValue();
      -[MPStoreLibraryPersonalizationCollectionDataSource _libraryObjectWithRelativeModelClass:identifierSet:propertySet:](self, "_libraryObjectWithRelativeModelClass:identifierSet:propertySet:", v13, v46, v21);
      v22 = objc_claimAutoreleasedReturnValue();
      v45 = (void *)v21;
      if (!v22)
      {
        v33 = 0;
        v10 = v11;
LABEL_28:

        goto LABEL_29;
      }
      objc_msgSend((id)objc_opt_class(), "_completePersonalizedObjectWithLibraryObject:personalizationProperties:overrideLibraryAddedStatus:", v22, v21, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectWithStoreLibraryPersonalizationRelativeModelObject:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = (void *)v22;
      if (!v24)
      {
        v25 = 0;
        v10 = v11;
        goto LABEL_27;
      }
      v43 = v19;
      v25 = v24;
      v26 = v11;
      v10 = v25;
    }

    v19 = v43;
LABEL_27:

    v33 = v44;
    goto LABEL_28;
  }
LABEL_31:

  return v10;
}

uint64_t __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_10(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = *(void **)(a1 + 32);
  if ((objc_msgSend(v2, "isLibraryAddEligible") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(*(id *)(a1 + 40), "isLibraryAddEligible");
  return objc_msgSend(v2, "setLibraryAddEligible:", v3);
}

- (void)setSectionProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setLibraryView:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setItemProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setItemIndexPathToOverridePropertySet:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (MPStoreLibraryPersonalizationCollectionDataSource)init
{
  MPStoreLibraryPersonalizationCollectionDataSource *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPStoreLibraryPersonalizationCollectionDataSource;
  result = -[MPStoreLibraryPersonalizationCollectionDataSource init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

+ (id)_lightweightPersonalizedObjectWithUnpersonalizedObject:(id)a3 libraryObject:(id)a4 personalizationProperties:(id)a5 overrideLibraryAddedStatus:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  id v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  _QWORD v79[4];
  id v80;
  id v81;
  _QWORD v82[4];
  id v83;
  id v84;
  int64_t v85;
  _QWORD v86[4];
  id v87;
  id v88;
  int64_t v89;
  _QWORD v90[4];
  id v91;
  _QWORD v92[4];
  id v93;
  id v94;
  id v95;
  int64_t v96;
  id v97;
  _QWORD v98[4];
  id v99;
  _QWORD v100[4];
  id v101;
  id v102;
  id v103;
  int64_t v104;
  id v105;
  _QWORD v106[4];
  id v107;
  _QWORD v108[4];
  id v109;
  _QWORD v110[4];
  id v111;
  id v112;
  id v113;
  id v114;
  int64_t v115;
  id v116;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v10;
  v75 = v12;
  objc_msgSend(v13, "identifiers");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "properties");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "relationships");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_opt_class();
  if (objc_msgSend(v14, "isSubclassOfClass:", objc_opt_class()))
  {
    v15 = v13;
    if (v11)
    {
      v16 = v11;
      objc_msgSend(v16, "identifiers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "unionSet:", v77);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      if (v18)
        v20 = (void *)v18;
      else
        v20 = v77;
      v21 = v20;

      v110[0] = MEMORY[0x1E0C809B0];
      v110[1] = 3221225472;
      v110[2] = __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke;
      v110[3] = &unk_1E3158688;
      v111 = v76;
      v115 = a6;
      v22 = v16;
      v112 = v22;
      v113 = v78;
      v116 = a1;
      v23 = v15;
      v114 = v23;
      v24 = (void *)objc_msgSend(v23, "copyWithIdentifiers:block:", v21, v110);

      v15 = v23;
    }
    else
    {
      objc_msgSend(v78, "objectForKey:", CFSTR("MPModelRelationshipSongPlaybackPosition"));
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v24 = v15;
      if (v22)
      {
        if (objc_msgSend(v15, "hasLoadedValueForKey:", CFSTR("MPModelRelationshipSongPlaybackPosition")))
        {
          objc_msgSend(v15, "playbackPosition");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v38 = 0;
        }
        if (!objc_msgSend(v38, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaybackPositionShouldRememberBookmarkTime"))|| (v24 = v15, objc_msgSend(v38, "shouldRememberBookmarkTime")))
        {
          objc_msgSend(v15, "identifiers");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_lightweightPersonalizedPlaybackPositionWithUnpersonalizedPlaybackPosition:identifiers:personalizationProperties:", v38, v52, v22);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          v24 = v15;
          if (v38 != v53)
          {
            objc_msgSend(v15, "identifiers");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v108[0] = MEMORY[0x1E0C809B0];
            v108[1] = 3221225472;
            v108[2] = __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_2;
            v108[3] = &unk_1E31586B0;
            v109 = v53;
            v24 = (void *)objc_msgSend(v15, "copyWithIdentifiers:block:", v54, v108);

          }
        }

      }
      objc_msgSend(v78, "objectForKey:", CFSTR("MPModelRelationshipSongLyrics"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if (v55)
      {
        if (objc_msgSend(v15, "hasLoadedValueForKey:", CFSTR("MPModelRelationshipSongLyrics")))
        {
          objc_msgSend(v15, "lyrics");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v56 = 0;
        }
        objc_msgSend(v56, "identifiers");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = (void *)objc_msgSend(v56, "copyWithIdentifiers:block:", v57, &__block_literal_global_21475);

        objc_msgSend(v15, "identifiers");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v106[0] = MEMORY[0x1E0C809B0];
        v106[1] = 3221225472;
        v106[2] = __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_4;
        v106[3] = &unk_1E31586B0;
        v60 = v58;
        v107 = v60;
        v61 = objc_msgSend(v15, "copyWithIdentifiers:block:", v59, v106);

        v24 = (void *)v61;
        v11 = 0;
      }

    }
    goto LABEL_71;
  }
  if (objc_msgSend(v14, "isSubclassOfClass:", objc_opt_class()))
  {
    v15 = v13;
    if (v11)
    {
      v25 = v11;
      objc_msgSend(v25, "identifiers");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "unionSet:", v77);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)v27;
      if (v27)
        v29 = (void *)v27;
      else
        v29 = v77;
      v30 = v29;

      v100[0] = MEMORY[0x1E0C809B0];
      v100[1] = 3221225472;
      v100[2] = __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_5;
      v100[3] = &unk_1E3158718;
      v101 = v76;
      v104 = a6;
      v22 = v25;
      v102 = v22;
      v103 = v78;
      v105 = a1;
      v24 = (void *)objc_msgSend(v15, "copyWithIdentifiers:block:", v30, v100);

      v31 = v101;
LABEL_19:

LABEL_71:
      goto LABEL_72;
    }
    objc_msgSend(v78, "objectForKey:", CFSTR("MPModelRelationshipTVEpisodePlaybackPosition"));
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      if (objc_msgSend(v15, "hasLoadedValueForKey:", CFSTR("MPModelRelationshipTVEpisodePlaybackPosition")))
      {
        objc_msgSend(v15, "playbackPosition");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v45 = 0;
      }
      if (objc_msgSend(v45, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaybackPositionShouldRememberBookmarkTime")))
      {
        v24 = v15;
        if (!objc_msgSend(v45, "shouldRememberBookmarkTime"))
          goto LABEL_70;
      }
      objc_msgSend(v15, "identifiers");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_lightweightPersonalizedPlaybackPositionWithUnpersonalizedPlaybackPosition:identifiers:personalizationProperties:", v45, v68, v22);
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = v15;
      if (v45 == v69)
      {
LABEL_69:

LABEL_70:
        goto LABEL_71;
      }
      objc_msgSend(v15, "identifiers");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v98[0] = MEMORY[0x1E0C809B0];
      v98[1] = 3221225472;
      v98[2] = __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_6;
      v98[3] = &unk_1E3158740;
      v99 = v69;
      v24 = (void *)objc_msgSend(v15, "copyWithIdentifiers:block:", v70, v98);

      v71 = v99;
LABEL_68:

      goto LABEL_69;
    }
    goto LABEL_52;
  }
  if (objc_msgSend(v14, "isSubclassOfClass:", objc_opt_class()))
  {
    v15 = v13;
    if (v11)
    {
      v32 = v11;
      objc_msgSend(v32, "identifiers");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "unionSet:", v77);
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = (void *)v34;
      if (v34)
        v36 = (void *)v34;
      else
        v36 = v77;
      v37 = v36;

      v92[0] = MEMORY[0x1E0C809B0];
      v92[1] = 3221225472;
      v92[2] = __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_7;
      v92[3] = &unk_1E3158768;
      v93 = v76;
      v96 = a6;
      v22 = v32;
      v94 = v22;
      v95 = v78;
      v97 = a1;
      v24 = (void *)objc_msgSend(v15, "copyWithIdentifiers:block:", v37, v92);

      v31 = v93;
      goto LABEL_19;
    }
    objc_msgSend(v78, "objectForKey:", CFSTR("MPModelRelationshipMoviePlaybackPosition"));
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      if (objc_msgSend(v15, "hasLoadedValueForKey:", CFSTR("MPModelRelationshipMoviePlaybackPosition")))
      {
        objc_msgSend(v15, "playbackPosition");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v45 = 0;
      }
      if (objc_msgSend(v45, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaybackPositionShouldRememberBookmarkTime")))
      {
        v24 = v15;
        if (!objc_msgSend(v45, "shouldRememberBookmarkTime"))
          goto LABEL_70;
      }
      objc_msgSend(v15, "identifiers");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_lightweightPersonalizedPlaybackPositionWithUnpersonalizedPlaybackPosition:identifiers:personalizationProperties:", v45, v72, v22);
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = v15;
      if (v45 == v69)
        goto LABEL_69;
      objc_msgSend(v15, "identifiers");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v90[0] = MEMORY[0x1E0C809B0];
      v90[1] = 3221225472;
      v90[2] = __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_8;
      v90[3] = &unk_1E3158790;
      v91 = v69;
      v24 = (void *)objc_msgSend(v15, "copyWithIdentifiers:block:", v73, v90);

      v71 = v91;
      goto LABEL_68;
    }
LABEL_52:
    v24 = v15;
    goto LABEL_71;
  }
  if (objc_msgSend(v14, "isSubclassOfClass:", objc_opt_class()))
  {
    v39 = v11;
    objc_msgSend(v39, "identifiers");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "unionSet:", v77);
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = (void *)v41;
    if (v41)
      v43 = (void *)v41;
    else
      v43 = v77;
    v44 = v43;

    v86[0] = MEMORY[0x1E0C809B0];
    v86[1] = 3221225472;
    v86[2] = __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_9;
    v86[3] = &unk_1E31587B8;
    v87 = v76;
    v89 = a6;
    v15 = v39;
    v88 = v15;
    v24 = (void *)objc_msgSend(v13, "copyWithIdentifiers:block:", v44, v86);

    v22 = v87;
    goto LABEL_71;
  }
  if (objc_msgSend(v14, "isSubclassOfClass:", objc_opt_class()))
  {
    v46 = v11;
    objc_msgSend(v46, "identifiers");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "unionSet:", v77);
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = (void *)v48;
    if (v48)
      v50 = (void *)v48;
    else
      v50 = v77;
    v51 = v50;

    v82[0] = MEMORY[0x1E0C809B0];
    v82[1] = 3221225472;
    v82[2] = __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_11;
    v82[3] = &unk_1E31587E0;
    v83 = v76;
    v85 = a6;
    v15 = v46;
    v84 = v15;
    v24 = (void *)objc_msgSend(v13, "copyWithIdentifiers:block:", v51, v82);

    v22 = v83;
    goto LABEL_71;
  }
  v24 = v13;
  if (objc_msgSend(v14, "isSubclassOfClass:", objc_opt_class()))
  {
    v62 = v11;
    objc_msgSend(v62, "identifiers");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "unionSet:", v77);
    v64 = objc_claimAutoreleasedReturnValue();
    v65 = (void *)v64;
    if (v64)
      v66 = (void *)v64;
    else
      v66 = v77;
    v67 = v66;

    v79[0] = MEMORY[0x1E0C809B0];
    v79[1] = 3221225472;
    v79[2] = __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_12;
    v79[3] = &unk_1E3161C58;
    v80 = v76;
    v15 = v62;
    v81 = v15;
    v24 = (void *)objc_msgSend(v13, "copyWithIdentifiers:block:", v67, v79);

    v22 = v80;
    goto LABEL_71;
  }
LABEL_72:

  return v24;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

- (id)sectionAtIndex:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *sectionToLibraryAddedOverride;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;

  -[MPSectionedCollection sectionAtIndex:](self->_unpersonalizedContentDescriptors, "sectionAtIndex:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = v5;
  v9 = v8;
  v10 = v8;
  if (v6 == v7)
  {
    objc_msgSend(v8, "model");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "relativeModelObjectForStoreLibraryPersonalization");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_opt_class();
    v10 = v11;
    if (!v13)
    {
LABEL_30:

      goto LABEL_31;
    }
    -[NSMapTable objectForKey:](self->_relativeModelClassToMappingResponse, "objectForKey:", v13);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "libraryIdentifierSetForIdentifierSet:", v14);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    sectionToLibraryAddedOverride = self->_sectionToLibraryAddedOverride;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](sectionToLibraryAddedOverride, "objectForKey:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = v17;
    if (v17)
    {
      v18 = objc_msgSend(v17, "BOOLValue");
      v19 = 1;
      if (!v18)
        v19 = 2;
      v43 = v19;
    }
    else
    {
      v43 = 0;
    }
    v20 = objc_msgSend(v9, "personalizationStyle");
    if ((unint64_t)(v20 - 3) < 2)
    {
      objc_msgSend(v11, "personalizationScopedPropertiesForProperties:", self->_sectionProperties);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPStoreLibraryPersonalizationCollectionDataSource _libraryObjectWithRelativeModelClass:identifierSet:propertySet:](self, "_libraryObjectWithRelativeModelClass:identifierSet:propertySet:", v13, v46, v28);
      v29 = objc_claimAutoreleasedReturnValue();
      if (!v29)
      {
        v34 = 0;
        v10 = v11;
LABEL_28:

        goto LABEL_29;
      }
      objc_msgSend((id)objc_opt_class(), "_completePersonalizedObjectWithLibraryObject:personalizationProperties:overrideLibraryAddedStatus:", v29, v28, v43);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectWithStoreLibraryPersonalizationRelativeModelObject:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)v29;
      if (!v31)
      {
        v32 = 0;
        v10 = v11;
        goto LABEL_27;
      }
      v32 = v31;
      v33 = v11;
      v10 = v32;
    }
    else
    {
      v10 = v11;
      if ((unint64_t)(v20 - 1) > 1)
      {
LABEL_29:

        goto LABEL_30;
      }
      v41 = v12;
      objc_msgSend(v11, "personalizationScopedPropertiesForProperties:", self->_sectionProperties);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (!v21)
      {
        +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      +[MPStoreLibraryPersonalizationContentDescriptor lightweightPersonalizationPropertiesForModelClass:](MPStoreLibraryPersonalizationContentDescriptor, "lightweightPersonalizationPropertiesForModelClass:", v13);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "propertySetByIntersectingWithPropertySet:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      objc_msgSend(v13, "requiredStoreLibraryPersonalizationProperties");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      v12 = v41;
      if (v25)
      {
        v27 = v25;
      }
      else
      {
        +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
        v27 = (id)objc_claimAutoreleasedReturnValue();
      }
      v35 = v27;

      v42 = v35;
      objc_msgSend(v24, "propertySetByCombiningWithPropertySet:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = v36;
      +[MPStoreLibraryPersonalizationContentDescriptor requiredLightweightPersonalizationPropertiesForModelClass:requestedProperties:](MPStoreLibraryPersonalizationContentDescriptor, "requiredLightweightPersonalizationPropertiesForModelClass:requestedProperties:", v13, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "propertySetByCombiningWithPropertySet:", v37);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      -[MPStoreLibraryPersonalizationCollectionDataSource _libraryObjectWithRelativeModelClass:identifierSet:propertySet:](self, "_libraryObjectWithRelativeModelClass:identifierSet:propertySet:", v13, v46, v30);
      v32 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_lightweightPersonalizedObjectWithUnpersonalizedObject:libraryObject:personalizationProperties:overrideLibraryAddedStatus:", v41, v32, v30, v43);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33 == v41)
      {
        v33 = v41;
        v10 = v11;
      }
      else
      {
        objc_msgSend(v11, "objectWithStoreLibraryPersonalizationRelativeModelObject:", v33);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v38;
        v10 = v11;
        if (v38)
        {
          v10 = v38;

        }
      }
    }

LABEL_27:
    v34 = v42;
    goto LABEL_28;
  }
LABEL_31:

  return v10;
}

- (void)setUnpersonalizedContentDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_unpersonalizedContentDescriptors, a3);
}

- (void)setSectionToLibraryAddedOverride:(id)a3
{
  objc_storeStrong((id *)&self->_sectionToLibraryAddedOverride, a3);
}

- (void)setRelativeModelClassToMappingResponse:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

void __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyPlaylistLibraryAdded"), (_QWORD)v11))
        {
          v9 = *(_QWORD *)(a1 + 48);
          if (v9 == 1)
          {
            v10 = 1;
          }
          else if (v9 == 2)
          {
            v10 = 0;
          }
          else
          {
            v10 = objc_msgSend(*(id *)(a1 + 40), "isLibraryAdded");
          }
          objc_msgSend(v3, "setLibraryAdded:", v10);
        }
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyPlaylistIsFavorite")))
          objc_msgSend(v3, "setIsFavorite:", objc_msgSend(*(id *)(a1 + 40), "isFavorite"));
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyPlaylistIsDisliked")))
        {
          objc_msgSend(v3, "setIsDisliked:", objc_msgSend(*(id *)(a1 + 40), "isDisliked"));
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyPlaylistKeepLocalEnableState")))
        {
          objc_msgSend(v3, "setKeepLocalEnableState:", objc_msgSend(*(id *)(a1 + 40), "keepLocalEnableState"));
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyPlaylistKeepLocalManagedStatus")))
        {
          objc_msgSend(v3, "setKeepLocalManagedStatus:", objc_msgSend(*(id *)(a1 + 40), "keepLocalManagedStatus"));
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyPlaylistKeepLocalManagedStatusReason")))
        {
          objc_msgSend(v3, "setKeepLocalManagedStatusReason:", objc_msgSend(*(id *)(a1 + 40), "keepLocalManagedStatusReason"));
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyPlaylistKeepLocalConstraints")))
        {
          objc_msgSend(v3, "setKeepLocalConstraints:", objc_msgSend(*(id *)(a1 + 40), "keepLocalConstraints"));
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

void __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyArtistIsFavorite"), (_QWORD)v9))
          objc_msgSend(v3, "setIsFavorite:", objc_msgSend(*(id *)(a1 + 40), "isFavorite"));
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyArtistIsDisliked")))
          objc_msgSend(v3, "setIsDisliked:", objc_msgSend(*(id *)(a1 + 40), "isDisliked"));
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyArtistLibraryAdded")))
          objc_msgSend(v3, "setLibraryAdded:", objc_msgSend(*(id *)(a1 + 40), "isLibraryAdded"));
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

void __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyAlbumLibraryAdded")))
        {
          v9 = *(_QWORD *)(a1 + 48);
          if (v9 == 1)
          {
            v10 = 1;
          }
          else if (v9 == 2)
          {
            v10 = 0;
          }
          else
          {
            v10 = objc_msgSend(*(id *)(a1 + 40), "isLibraryAdded");
          }
          objc_msgSend(v3, "setLibraryAdded:", v10);
        }
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyAlbumIsFavorite")))
          objc_msgSend(v3, "setIsFavorite:", objc_msgSend(*(id *)(a1 + 40), "isFavorite"));
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyAlbumIsDisliked")))
        {
          objc_msgSend(v3, "setIsDisliked:", objc_msgSend(*(id *)(a1 + 40), "isDisliked"));
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyAlbumKeepLocalEnableState")))
        {
          objc_msgSend(v3, "setKeepLocalEnableState:", objc_msgSend(*(id *)(a1 + 40), "keepLocalEnableState"));
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyAlbumKeepLocalManagedStatus")))
        {
          objc_msgSend(v3, "setKeepLocalManagedStatus:", objc_msgSend(*(id *)(a1 + 40), "keepLocalManagedStatus"));
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyAlbumKeepLocalManagedStatusReason")))
        {
          objc_msgSend(v3, "setKeepLocalManagedStatusReason:", objc_msgSend(*(id *)(a1 + 40), "keepLocalManagedStatusReason"));
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyAlbumKeepLocalConstraints")))
        {
          objc_msgSend(v3, "setKeepLocalConstraints:", objc_msgSend(*(id *)(a1 + 40), "keepLocalConstraints"));
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyAlbumLibraryAddEligible")))
        {
          v11[0] = MEMORY[0x1E0C809B0];
          v11[1] = 3221225472;
          v11[2] = __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_10;
          v11[3] = &unk_1E31635F8;
          v12 = v3;
          v13 = *(id *)(a1 + 40);
          +[MPModelObject performWithoutEnforcement:](MPModelObject, "performWithoutEnforcement:", v11);

        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

}

- (id)identifiersForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  uint64_t v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  const __CFString *v43;
  uint64_t v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[2];
  _QWORD v55[2];
  void *v56;
  _QWORD v57[3];
  _QWORD v58[3];
  void *v59;
  uint8_t buf[4];
  MPStoreLibraryPersonalizationCollectionDataSource *v61;
  __int16 v62;
  id v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  _QWORD v68[3];
  _QWORD v69[3];
  void *v70;
  _QWORD v71[2];
  _QWORD v72[4];

  v72[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MPSectionedCollection itemAtIndexPath:](self->_unpersonalizedContentDescriptors, "itemAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    v8 = v5;
    objc_msgSend(v8, "model");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "relativeModelObjectForStoreLibraryPersonalization");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_class();
    if (v16)
    {
      objc_msgSend(v15, "identifiers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        -[NSMapTable objectForKey:](self->_relativeModelClassToMappingResponse, "objectForKey:", v16);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "libraryIdentifierSetForIdentifierSet:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          objc_msgSend(v18, "unionSet:", v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (v20)
          {
            v22 = v20;
          }
          else
          {
            v40 = os_log_create("com.apple.amp.mediaplayer", "Default");
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218754;
              v61 = self;
              v62 = 2114;
              v63 = v4;
              v64 = 2114;
              v65 = v19;
              v66 = 2114;
              v67 = v17;
              _os_log_impl(&dword_193B9B000, v40, OS_LOG_TYPE_ERROR, "MPStoreLibraryPersonalizationCollectionDataSource %p: identifiersForItemAtIndexPath returning MPIdentifierSet.emptyIdentifierSet [libraryIdentifiers unionSet: failed] indexPath=%{public}@ libraryIdentifiers=%{public}@ originalIdentifiers=%{public}@", buf, 0x2Au);
            }

            v41 = (void *)MEMORY[0x1E0D4D030];
            v58[0] = v4;
            v57[0] = CFSTR("indexPath");
            v57[1] = CFSTR("libraryIdentifiers");
            objc_msgSend(v19, "description");
            v42 = objc_claimAutoreleasedReturnValue();
            v50 = (void *)v42;
            v51 = v41;
            if (v42)
              v43 = (const __CFString *)v42;
            else
              v43 = CFSTR("@");
            v58[1] = v43;
            v57[2] = CFSTR("originalIdentifiers");
            objc_msgSend(v17, "description");
            v44 = objc_claimAutoreleasedReturnValue();
            v45 = (void *)v44;
            if (v44)
              v46 = (const __CFString *)v44;
            else
              v46 = CFSTR("@");
            v58[2] = v46;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 3);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = v47;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", *MEMORY[0x1E0D4CE38], CFSTR("Bug"), CFSTR("Tracklisting-LazySectionedCollectionDataSource-InvalidStateBug"), CFSTR("-[MPStoreLibraryPersonalizationCollectionDataSource identifiersForItemAtIndexPath:] (libraryIdentifiers unionSet: failed)"), 0, v48, 0);

            +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
            v22 = (id)objc_claimAutoreleasedReturnValue();
          }
          v7 = v22;

        }
        else
        {
          v7 = v17;
        }

      }
      else
      {
        v30 = os_log_create("com.apple.amp.mediaplayer", "Default");
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218498;
          v61 = self;
          v62 = 2114;
          v63 = v4;
          v64 = 2114;
          v65 = v15;
          _os_log_impl(&dword_193B9B000, v30, OS_LOG_TYPE_ERROR, "MPStoreLibraryPersonalizationCollectionDataSource %p: identifiersForItemAtIndexPath returning MPIdentifierSet.emptyIdentifierSet [effectiveOriginalObject has no identifiers] indexPath=%{public}@ effectiveOriginalObject=%{public}@", buf, 0x20u);
        }

        v31 = (void *)MEMORY[0x1E0D4D030];
        v69[0] = v4;
        v68[0] = CFSTR("indexPath");
        v68[1] = CFSTR("originalObject");
        objc_msgSend(v53, "description");
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = (void *)v32;
        if (v32)
          v34 = (const __CFString *)v32;
        else
          v34 = CFSTR("@");
        v69[1] = v34;
        v68[2] = CFSTR("effectiveOriginalObject");
        objc_msgSend(v15, "description");
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = (void *)v35;
        if (v35)
          v37 = (const __CFString *)v35;
        else
          v37 = CFSTR("@");
        v69[2] = v37;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 3);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = v38;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", *MEMORY[0x1E0D4CE38], CFSTR("Bug"), CFSTR("Tracklisting-LazySectionedCollectionDataSource-InvalidStateBug"), CFSTR("-[MPStoreLibraryPersonalizationCollectionDataSource identifiersForItemAtIndexPath:] (effectiveOriginalObject has no identifiers)"), 0, v39, 0);

        +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
        v7 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      objc_msgSend(v53, "identifiers");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        v23 = os_log_create("com.apple.amp.mediaplayer", "Default");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218498;
          v61 = self;
          v62 = 2114;
          v63 = v4;
          v64 = 2114;
          v65 = v53;
          _os_log_impl(&dword_193B9B000, v23, OS_LOG_TYPE_ERROR, "MPStoreLibraryPersonalizationCollectionDataSource %p: identifiersForItemAtIndexPath returning MPIdentifierSet.emptyIdentifierSet [originalObject has no identifiers] indexPath=%{public}@ originalObject=%{public}@", buf, 0x20u);
        }

        v24 = (void *)MEMORY[0x1E0D4D030];
        v54[0] = CFSTR("indexPath");
        v54[1] = CFSTR("originalObject");
        v55[0] = v4;
        objc_msgSend(v53, "description");
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v25;
        v27 = CFSTR("@");
        if (v25)
          v27 = (const __CFString *)v25;
        v55[1] = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v28;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", *MEMORY[0x1E0D4CE38], CFSTR("Bug"), CFSTR("Tracklisting-LazySectionedCollectionDataSource-InvalidStateBug"), CFSTR("-[MPStoreLibraryPersonalizationCollectionDataSource identifiersForItemAtIndexPath:] (originalObject has no identifiers)"), 0, v29, 0);

        +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
        v7 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    goto LABEL_44;
  }
  objc_msgSend(v5, "identifiers");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v71[0] = CFSTR("indexPath");
    v71[1] = CFSTR("possibleObject");
    v72[0] = v4;
    objc_msgSend(v5, "description");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = CFSTR("@");
    if (v9)
      v11 = (const __CFString *)v9;
    v72[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v12);

    if (!v5)
    {
      -[MPSectionedCollection description](self->_unpersonalizedContentDescriptors, "description");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v13);

    }
    v14 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      v61 = self;
      v62 = 2114;
      v63 = v4;
      v64 = 2114;
      v65 = v5;
      _os_log_impl(&dword_193B9B000, v14, OS_LOG_TYPE_ERROR, "MPStoreLibraryPersonalizationCollectionDataSource %p: identifiersForItemAtIndexPath returning MPIdentifierSet.emptyIdentifierSet [unpersonalizedContentDescriptors did not contain MPStoreLibraryPersonalizationContentDescriptor] indexPath=%{public}@ possibleObject=%{public}@", buf, 0x20u);
    }

    objc_msgSend(MEMORY[0x1E0D4D030], "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", *MEMORY[0x1E0D4CE38], CFSTR("Bug"), CFSTR("Tracklisting-LazySectionedCollectionDataSource-InvalidStateBug"), CFSTR("-[MPStoreLibraryPersonalizationCollectionDataSource identifiersForItemAtIndexPath:] (unpersonalizedContentDescriptors did not contain MPStoreLibraryPersonalizationContentDescriptor)"), 0, v8, 0);
    +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
    v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_44:

  }
  return v7;
}

- (id)identifiersForSectionAtIndex:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;

  -[MPSectionedCollection sectionAtIndex:](self->_unpersonalizedContentDescriptors, "sectionAtIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    objc_msgSend(v4, "model");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "relativeModelObjectForStoreLibraryPersonalization");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_class();
    if (v9)
    {
      -[NSMapTable objectForKey:](self->_relativeModelClassToMappingResponse, "objectForKey:", v9);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifiers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "libraryIdentifierSetForIdentifierSet:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "identifiers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "unionSet:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        v16 = v14;
      }
      else
      {
        objc_msgSend(v8, "identifiers");
        v16 = (id)objc_claimAutoreleasedReturnValue();
      }
      v6 = v16;

    }
    else
    {
      objc_msgSend(v8, "identifiers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v10 = v17;
        v6 = v10;
      }
      else
      {
        objc_msgSend(v7, "identifiers");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 0;
      }
    }

  }
  else
  {
    objc_msgSend(v4, "identifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)indexPathForItemWithIdentifiersIntersectingSet:(id)a3
{
  id v4;
  MPSectionedCollection *unpersonalizedContentDescriptors;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  MPStoreLibraryPersonalizationCollectionDataSource *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__21409;
  v17 = __Block_byref_object_dispose__21410;
  v18 = 0;
  unpersonalizedContentDescriptors = self->_unpersonalizedContentDescriptors;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __100__MPStoreLibraryPersonalizationCollectionDataSource_indexPathForItemWithIdentifiersIntersectingSet___block_invoke;
  v9[3] = &unk_1E3158638;
  v11 = self;
  v12 = &v13;
  v10 = v4;
  v6 = v4;
  -[MPSectionedCollection enumerateItemsUsingBlock:](unpersonalizedContentDescriptors, "enumerateItemsUsingBlock:", v9);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (shared_ptr<mlcore::EntityCache>)_entityCacheForEntityClass:(void *)a3 propertiesToFetch:(vector<mlcore:(std::allocator<mlcore::ModelPropertyBase *>> *)a4 :ModelPropertyBase *)
{
  mlcore::EntityCache **v4;
  mlcore::EntityCache **v8;
  mlcore::EntityCache **begin;
  mlcore::EntityCache **end;
  unint64_t *v11;
  unint64_t *v12;
  unint64_t v13;
  const void *v14;
  uint64_t v15;
  size_t v16;
  uint64_t v17;
  __shared_weak_count *v18;
  MPMediaLibraryView *libraryView;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  mlcore::EntityCache *v23;
  char *value;
  char *v25;
  mlcore::EntityCache *v26;
  unint64_t *v27;
  unint64_t v28;
  void *v29;
  char *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char *v35;
  char *v36;
  __int128 v37;
  unint64_t *v38;
  unint64_t v39;
  char *v40;
  __int128 v41;
  int64x2_t v42;
  void *v43;
  __int128 v44;
  void *v45;
  void *v46;
  uint64_t v47;
  shared_ptr<mlcore::EntityCache> result;

  v8 = v4;
  os_unfair_lock_assert_owner(&self->_lock);
  begin = (mlcore::EntityCache **)self->_entityCaches.__begin_;
  end = (mlcore::EntityCache **)self->_entityCaches.__end_;
  while (begin != end)
  {
    *v8 = *begin;
    v11 = (unint64_t *)begin[1];
    v8[1] = (mlcore::EntityCache *)v11;
    if (v11)
    {
      v12 = v11 + 1;
      do
        v13 = __ldxr(v12);
      while (__stxr(v13 + 1, v12));
    }
    v15 = mlcore::EntityCache::propertiesToFetchForEntityClass();
    v14 = *(const void **)v15;
    v16 = *(_QWORD *)(v15 + 8) - *(_QWORD *)v15;
    if (v16 == (char *)a4->var1 - (char *)a4->var0)
    {
      v17 = memcmp(v14, a4->var0, v16);
      if (!(_DWORD)v17)
        goto LABEL_49;
    }
    std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)v8);
    begin += 2;
  }
  libraryView = self->_libraryView;
  if (libraryView)
    -[MPMediaLibraryView mlCoreView](libraryView, "mlCoreView");
  else
    v44 = 0uLL;
  std::allocate_shared[abi:ne180100]<mlcore::EntityCache,std::allocator<mlcore::EntityCache>,std::shared_ptr<mlcore::DeviceLibraryView>,void>(v8, &v44);
  v20 = (std::__shared_weak_count *)*((_QWORD *)&v44 + 1);
  if (*((_QWORD *)&v44 + 1))
  {
    v21 = (unint64_t *)(*((_QWORD *)&v44 + 1) + 8);
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  mlcore::EntityCache::setCacheDisabled(*v8);
  v23 = *v8;
  v46 = 0;
  v47 = 0;
  v45 = 0;
  std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v45, a4->var0, (uint64_t)a4->var1, a4->var1 - a4->var0);
  (*(void (**)(mlcore::EntityCache *, void **, void *))(*(_QWORD *)v23 + 16))(v23, &v45, a3);
  v17 = (uint64_t)v45;
  if (v45)
  {
    v46 = v45;
    operator delete(v45);
  }
  v25 = (char *)self->_entityCaches.__end_;
  value = (char *)self->_entityCaches.__end_cap_.__value_;
  if (v25 >= value)
  {
    v30 = (char *)self->_entityCaches.__begin_;
    v31 = (v25 - v30) >> 4;
    v32 = v31 + 1;
    if ((unint64_t)(v31 + 1) >> 60)
      std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
    v33 = value - v30;
    if (v33 >> 3 > v32)
      v32 = v33 >> 3;
    if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFF0)
      v34 = 0xFFFFFFFFFFFFFFFLL;
    else
      v34 = v32;
    if (v34 >> 60)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v35 = (char *)operator new(16 * v34);
    v36 = &v35[16 * v31];
    v37 = *(_OWORD *)v8;
    *(_OWORD *)v36 = *(_OWORD *)v8;
    if (*((_QWORD *)&v37 + 1))
    {
      v38 = (unint64_t *)(*((_QWORD *)&v37 + 1) + 8);
      do
        v39 = __ldxr(v38);
      while (__stxr(v39 + 1, v38));
      v30 = (char *)self->_entityCaches.__begin_;
      v25 = (char *)self->_entityCaches.__end_;
    }
    if (v25 == v30)
    {
      v42 = vdupq_n_s64((unint64_t)v25);
      v40 = &v35[16 * v31];
    }
    else
    {
      v40 = &v35[16 * v31];
      do
      {
        v41 = *((_OWORD *)v25 - 1);
        v25 -= 16;
        *((_OWORD *)v40 - 1) = v41;
        v40 -= 16;
        *(_QWORD *)v25 = 0;
        *((_QWORD *)v25 + 1) = 0;
      }
      while (v25 != v30);
      v42 = *(int64x2_t *)&self->_entityCaches.__begin_;
    }
    v29 = v36 + 16;
    self->_entityCaches.__begin_ = v40;
    self->_entityCaches.__end_ = v36 + 16;
    self->_entityCaches.__end_cap_.__value_ = &v35[16 * v34];
    v17 = v42.i64[1];
    v43 = (void *)v42.i64[0];
    while ((void *)v17 != v43)
      v17 = std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100](v17 - 16);
    if (v43)
      operator delete(v43);
  }
  else
  {
    *(_QWORD *)v25 = *v8;
    v26 = v8[1];
    *((_QWORD *)v25 + 1) = v26;
    if (v26)
    {
      v27 = (unint64_t *)((char *)v26 + 8);
      do
        v28 = __ldxr(v27);
      while (__stxr(v28 + 1, v27));
    }
    v29 = v25 + 16;
  }
  self->_entityCaches.__end_ = v29;
LABEL_49:
  result.var1 = v18;
  result.var0 = (EntityCache *)v17;
  return result;
}

- (MPSectionedCollection)unpersonalizedContentDescriptors
{
  return self->_unpersonalizedContentDescriptors;
}

- (MPPropertySet)itemProperties
{
  return self->_itemProperties;
}

- (MPPropertySet)sectionProperties
{
  return self->_sectionProperties;
}

- (NSDictionary)itemIndexPathToOverridePropertySet
{
  return self->_itemIndexPathToOverridePropertySet;
}

- (MPMediaLibraryView)libraryView
{
  return self->_libraryView;
}

- (NSMapTable)relativeModelClassToMappingResponse
{
  return self->_relativeModelClassToMappingResponse;
}

- (NSMutableDictionary)sectionToLibraryAddedOverride
{
  return self->_sectionToLibraryAddedOverride;
}

- (void).cxx_destruct
{
  void *begin;
  uint64_t end;
  void *v5;

  objc_storeStrong((id *)&self->_sectionToLibraryAddedOverride, 0);
  objc_storeStrong((id *)&self->_relativeModelClassToMappingResponse, 0);
  objc_storeStrong((id *)&self->_libraryView, 0);
  objc_storeStrong((id *)&self->_itemIndexPathToOverridePropertySet, 0);
  objc_storeStrong((id *)&self->_sectionProperties, 0);
  objc_storeStrong((id *)&self->_itemProperties, 0);
  objc_storeStrong((id *)&self->_unpersonalizedContentDescriptors, 0);
  begin = self->_entityCaches.__begin_;
  if (begin)
  {
    end = (uint64_t)self->_entityCaches.__end_;
    v5 = self->_entityCaches.__begin_;
    if ((void *)end != begin)
    {
      do
        end = std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100](end - 16);
      while ((void *)end != begin);
      v5 = self->_entityCaches.__begin_;
    }
    self->_entityCaches.__end_ = begin;
    operator delete(v5);
  }
}

void __100__MPStoreLibraryPersonalizationCollectionDataSource_indexPathForItemWithIdentifiersIntersectingSet___block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a2;
  v7 = a3;
  v8 = objc_opt_class();
  if (v8 == objc_opt_class())
  {
    objc_msgSend(v21, "model");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = 0;
      goto LABEL_15;
    }
    v9 = v21;
  }
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "identifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "intersectsSet:", a1[4]);

    if (v12)
    {
      v13 = *(_QWORD *)(a1[6] + 8);
      v14 = v7;
      v15 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v14;
    }
    else
    {
      objc_msgSend(v10, "relativeModelObjectForStoreLibraryPersonalization");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_opt_class();
      if (v16)
      {
        objc_msgSend(*(id *)(a1[5] + 80), "objectForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "identifiers");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "libraryIdentifierSetForIdentifierSet:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "unionSet:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "intersectsSet:", a1[4]))
          objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);

      }
    }

    if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
      *a4 = 1;
  }
LABEL_15:

}

+ (id)_lightweightPersonalizedPlaybackPositionWithUnpersonalizedPlaybackPosition:(id)a3 libraryPlaybackPosition:(id)a4 personalizationProperties:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "properties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __178__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedPlaybackPositionWithUnpersonalizedPlaybackPosition_libraryPlaybackPosition_personalizationProperties___block_invoke;
  v16[3] = &unk_1E3159758;
  v12 = v10;
  v17 = v12;
  v13 = v8;
  v18 = v13;
  v14 = (void *)objc_msgSend(v7, "copyWithIdentifiers:block:", v11, v16);

  return v14;
}

+ (id)_lightweightPersonalizedPlaybackPositionWithUnpersonalizedPlaybackPosition:(id)a3 identifiers:(id)a4 personalizationProperties:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a3;
  v7 = a5;
  if (objc_msgSend(v6, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaybackPositionStoreUbiquitousIdentifier"))&& (objc_msgSend(v6, "storeUbiquitousIdentifier"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v7, "properties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPUbiquitousPlaybackPositionController sharedUbiquitousPlaybackPositionController](MPUbiquitousPlaybackPositionController, "sharedUbiquitousPlaybackPositionController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "playbackPositionForLocalEntityIdentifier:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v6, "identifiers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __166__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedPlaybackPositionWithUnpersonalizedPlaybackPosition_identifiers_personalizationProperties___block_invoke;
      v15[3] = &unk_1E3159758;
      v16 = v9;
      v17 = v11;
      v13 = (id)objc_msgSend(v6, "copyWithIdentifiers:block:", v12, v15);

    }
    else
    {
      v13 = v6;
    }

  }
  else
  {
    v13 = v6;
  }

  return v13;
}

+ (id)_lightweightPersonalizedLyricsWithUnpersonalizedLyrics:(id)a3 libraryLyrics:(id)a4 identifiers:(id)a5 personalizationProperties:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a6;
  objc_msgSend(v8, "identifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __160__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedLyricsWithUnpersonalizedLyrics_libraryLyrics_identifiers_personalizationProperties___block_invoke;
  v16[3] = &unk_1E3161CD0;
  v12 = v10;
  v17 = v12;
  v13 = v9;
  v18 = v13;
  v14 = (void *)objc_msgSend(v8, "copyWithIdentifiers:block:", v11, v16);

  return v14;
}

+ (id)_lightweightPersonalizedStoreAssetWithUnpersonalizedAsset:(id)a3 libraryAsset:(id)a4 personalizationProperties:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "properties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __150__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedStoreAssetWithUnpersonalizedAsset_libraryAsset_personalizationProperties___block_invoke;
  v17[3] = &unk_1E3158660;
  v12 = v10;
  v18 = v12;
  v13 = v8;
  v19 = v13;
  v14 = v7;
  v20 = v14;
  v15 = (void *)objc_msgSend(v14, "copyWithIdentifiers:block:", v11, v17);

  return v15;
}

+ (id)_completePersonalizedObjectWithLibraryObject:(id)a3 personalizationProperties:(id)a4 overrideLibraryAddedStatus:(int64_t)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  int64_t v27;
  _QWORD v28[5];
  id v29;
  int64_t v30;
  _QWORD v31[5];
  id v32;
  int64_t v33;
  _QWORD v34[5];
  id v35;
  int64_t v36;
  _QWORD v37[5];
  id v38;
  int64_t v39;

  v7 = a3;
  v8 = a4;
  v9 = v7;
  objc_msgSend(v8, "properties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_class();
  if (objc_msgSend(v11, "isSubclassOfClass:", objc_opt_class()))
  {
    v12 = v9;
    objc_msgSend(v12, "identifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __151__MPStoreLibraryPersonalizationCollectionDataSource__completePersonalizedObjectWithLibraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke;
    v37[3] = &unk_1E3158808;
    v14 = v37;
    v37[4] = v10;
    v39 = a5;
    v38 = v12;
    v15 = objc_msgSend(v38, "copyWithIdentifiers:block:", v13, v37);
LABEL_13:
    v20 = (void *)v15;

    goto LABEL_14;
  }
  if (objc_msgSend(v11, "isSubclassOfClass:", objc_opt_class()))
  {
    v16 = v9;
    objc_msgSend(v16, "identifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __151__MPStoreLibraryPersonalizationCollectionDataSource__completePersonalizedObjectWithLibraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_2;
    v34[3] = &unk_1E3158830;
    v14 = v34;
    v34[4] = v10;
    v36 = a5;
    v35 = v16;
    v15 = objc_msgSend(v35, "copyWithIdentifiers:block:", v13, v34);
    goto LABEL_13;
  }
  if (objc_msgSend(v11, "isSubclassOfClass:", objc_opt_class()))
  {
    v17 = v9;
    objc_msgSend(v17, "identifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __151__MPStoreLibraryPersonalizationCollectionDataSource__completePersonalizedObjectWithLibraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_3;
    v31[3] = &unk_1E3158858;
    v14 = v31;
    v31[4] = v10;
    v33 = a5;
    v32 = v17;
    v15 = objc_msgSend(v32, "copyWithIdentifiers:block:", v13, v31);
    goto LABEL_13;
  }
  if (objc_msgSend(v11, "isSubclassOfClass:", objc_opt_class()))
  {
    v18 = v9;
    objc_msgSend(v18, "identifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __151__MPStoreLibraryPersonalizationCollectionDataSource__completePersonalizedObjectWithLibraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_4;
    v28[3] = &unk_1E31587B8;
    v14 = v28;
    v28[4] = v10;
    v30 = a5;
    v29 = v18;
    v15 = objc_msgSend(v29, "copyWithIdentifiers:block:", v13, v28);
    goto LABEL_13;
  }
  if (objc_msgSend(v11, "isSubclassOfClass:", objc_opt_class()))
  {
    v19 = v9;
    objc_msgSend(v19, "identifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __151__MPStoreLibraryPersonalizationCollectionDataSource__completePersonalizedObjectWithLibraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_5;
    v25[3] = &unk_1E31587E0;
    v14 = v25;
    v25[4] = v10;
    v27 = a5;
    v26 = v19;
    v15 = objc_msgSend(v26, "copyWithIdentifiers:block:", v13, v25);
    goto LABEL_13;
  }
  v20 = v9;
  if (objc_msgSend(v11, "isSubclassOfClass:", objc_opt_class()))
  {
    v21 = v9;
    objc_msgSend(v21, "identifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __151__MPStoreLibraryPersonalizationCollectionDataSource__completePersonalizedObjectWithLibraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_6;
    v23[3] = &unk_1E3161C58;
    v14 = v23;
    v23[4] = v10;
    v24 = v21;
    v15 = objc_msgSend(v24, "copyWithIdentifiers:block:", v13, v23);
    goto LABEL_13;
  }
LABEL_14:

  return v20;
}

void __151__MPStoreLibraryPersonalizationCollectionDataSource__completePersonalizedObjectWithLibraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", CFSTR("MPModelPropertySongLibraryAdded")))
  {
    v3 = *(_QWORD *)(a1 + 48);
    if (v3 == 1)
    {
      v4 = 1;
    }
    else if (v3 == 2)
    {
      v4 = 0;
    }
    else
    {
      v4 = objc_msgSend(*(id *)(a1 + 40), "isLibraryAdded");
    }
    objc_msgSend(v5, "setLibraryAdded:", v4);
  }
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", CFSTR("MPModelPropertySongIsFavorite")))
    objc_msgSend(v5, "setIsFavorite:", objc_msgSend(*(id *)(a1 + 40), "isFavorite"));
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", CFSTR("MPModelPropertySongIsDisliked")))
    objc_msgSend(v5, "setIsDisliked:", objc_msgSend(*(id *)(a1 + 40), "isDisliked"));

}

void __151__MPStoreLibraryPersonalizationCollectionDataSource__completePersonalizedObjectWithLibraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", CFSTR("MPModelPropertyTVEpisodeLibraryAdded")))
  {
    v3 = *(_QWORD *)(a1 + 48);
    if (v3 == 1)
    {
      v4 = 1;
    }
    else if (v3 == 2)
    {
      v4 = 0;
    }
    else
    {
      v4 = objc_msgSend(*(id *)(a1 + 40), "isLibraryAdded");
    }
    objc_msgSend(v5, "setLibraryAdded:", v4);
  }

}

void __151__MPStoreLibraryPersonalizationCollectionDataSource__completePersonalizedObjectWithLibraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", CFSTR("MPModelPropertyMovieLibraryAdded")))
  {
    v3 = *(_QWORD *)(a1 + 48);
    if (v3 == 1)
    {
      v4 = 1;
    }
    else if (v3 == 2)
    {
      v4 = 0;
    }
    else
    {
      v4 = objc_msgSend(*(id *)(a1 + 40), "isLibraryAdded");
    }
    objc_msgSend(v5, "setLibraryAdded:", v4);
  }

}

void __151__MPStoreLibraryPersonalizationCollectionDataSource__completePersonalizedObjectWithLibraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", CFSTR("MPModelPropertyAlbumLibraryAdded")))
  {
    v3 = *(_QWORD *)(a1 + 48);
    if (v3 == 1)
    {
      v4 = 1;
    }
    else if (v3 == 2)
    {
      v4 = 0;
    }
    else
    {
      v4 = objc_msgSend(*(id *)(a1 + 40), "isLibraryAdded");
    }
    objc_msgSend(v5, "setLibraryAdded:", v4);
  }
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", CFSTR("MPModelPropertyAlbumIsFavorite")))
    objc_msgSend(v5, "setIsFavorite:", objc_msgSend(*(id *)(a1 + 40), "isFavorite"));
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", CFSTR("MPModelPropertyAlbumIsDisliked")))
    objc_msgSend(v5, "setIsDisliked:", objc_msgSend(*(id *)(a1 + 40), "isDisliked"));

}

void __151__MPStoreLibraryPersonalizationCollectionDataSource__completePersonalizedObjectWithLibraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", CFSTR("MPModelPropertyPlaylistLibraryAdded")))
  {
    v3 = *(_QWORD *)(a1 + 48);
    if (v3 == 1)
    {
      v4 = 1;
    }
    else if (v3 == 2)
    {
      v4 = 0;
    }
    else
    {
      v4 = objc_msgSend(*(id *)(a1 + 40), "isLibraryAdded");
    }
    objc_msgSend(v5, "setLibraryAdded:", v4);
  }
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", CFSTR("MPModelPropertyPlaylistIsFavorite")))
    objc_msgSend(v5, "setIsFavorite:", objc_msgSend(*(id *)(a1 + 40), "isFavorite"));
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", CFSTR("MPModelPropertyPlaylistIsDisliked")))
    objc_msgSend(v5, "setIsDisliked:", objc_msgSend(*(id *)(a1 + 40), "isDisliked"));

}

void __151__MPStoreLibraryPersonalizationCollectionDataSource__completePersonalizedObjectWithLibraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", CFSTR("MPModelPropertyArtistIsFavorite")))
    objc_msgSend(v3, "setIsFavorite:", objc_msgSend(*(id *)(a1 + 40), "isFavorite"));
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", CFSTR("MPModelPropertyArtistIsDisliked")))
    objc_msgSend(v3, "setIsDisliked:", objc_msgSend(*(id *)(a1 + 40), "isDisliked"));
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", CFSTR("MPModelPropertyArtistLibraryAdded")))
    objc_msgSend(v3, "setLibraryAdded:", objc_msgSend(*(id *)(a1 + 40), "isLibraryAdded"));

}

void __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v34;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v34 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v6);
        v8 = *(_QWORD *)(a1 + 64);
        if (v8 == 1)
        {
          v9 = 1;
        }
        else if (v8 == 2)
        {
          v9 = 0;
        }
        else
        {
          v9 = objc_msgSend(*(id *)(a1 + 40), "isLibraryAdded");
        }
        if (objc_msgSend(v7, "isEqualToString:", CFSTR("MPModelPropertySongIsFavorite")))
          objc_msgSend(v3, "setIsFavorite:", objc_msgSend(*(id *)(a1 + 40), "isFavorite"));
        if (objc_msgSend(v7, "isEqualToString:", CFSTR("MPModelPropertySongIsDisliked")))
          objc_msgSend(v3, "setIsDisliked:", objc_msgSend(*(id *)(a1 + 40), "isDisliked"));
        if (objc_msgSend(v7, "isEqualToString:", CFSTR("MPModelPropertySongLibraryAdded")))
        {
          objc_msgSend(v3, "setLibraryAdded:", v9);
        }
        else if (objc_msgSend(v7, "isEqualToString:", CFSTR("MPModelPropertySongKeepLocalEnableState")))
        {
          objc_msgSend(v3, "setKeepLocalEnableState:", objc_msgSend(*(id *)(a1 + 40), "keepLocalEnableState"));
        }
        else if (objc_msgSend(v7, "isEqualToString:", CFSTR("MPModelPropertySongKeepLocalManagedStatus")))
        {
          objc_msgSend(v3, "setKeepLocalManagedStatus:", objc_msgSend(*(id *)(a1 + 40), "keepLocalManagedStatus"));
        }
        else if (objc_msgSend(v7, "isEqualToString:", CFSTR("MPModelPropertySongKeepLocalManagedStatusReason")))
        {
          objc_msgSend(v3, "setKeepLocalManagedStatusReason:", objc_msgSend(*(id *)(a1 + 40), "keepLocalManagedStatusReason"));
        }
        else if (objc_msgSend(v7, "isEqualToString:", CFSTR("MPModelPropertySongKeepLocalConstraints")))
        {
          objc_msgSend(v3, "setKeepLocalConstraints:", objc_msgSend(*(id *)(a1 + 40), "keepLocalConstraints"));
        }
        else if (objc_msgSend(v7, "isEqualToString:", CFSTR("MPModelPropertySongUserRating")))
        {
          if ((objc_msgSend(*(id *)(a1 + 40), "hasCloudSyncSource") | v9) == 1)
          {
            objc_msgSend(*(id *)(a1 + 40), "userRating");
            objc_msgSend(v3, "setUserRating:");
          }
        }
        else
        {
          v10 = objc_msgSend(v7, "isEqualToString:", CFSTR("MPModelPropertySongCloudStatus"));
          v11 = *(void **)(a1 + 40);
          if (v10)
          {
            objc_msgSend(v3, "setCloudStatus:", objc_msgSend(v11, "cloudStatus"));
          }
          else if (objc_msgSend(v11, "hasCloudSyncSource")
                 && objc_msgSend(v7, "isEqualToString:", CFSTR("MPModelPropertySongLibraryAddEligible")))
          {
            if ((objc_msgSend(*(id *)(a1 + 40), "isLibraryAddEligible") & 1) != 0)
              v12 = 1;
            else
              v12 = objc_msgSend(v3, "isLibraryAddEligible");
            objc_msgSend(v3, "setLibraryAddEligible:", v12);
          }
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 48), "objectForKey:", CFSTR("MPModelRelationshipSongLocalFileAsset"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (!v14)
  {
    objc_msgSend(*(id *)(a1 + 40), "localFileAsset");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLocalFileAsset:", v15);

  }
  objc_msgSend(*(id *)(a1 + 48), "objectForKey:", CFSTR("MPModelRelationshipSongPlaybackPosition"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    if (objc_msgSend(v3, "hasLoadedValueForKey:", CFSTR("MPModelRelationshipSongPlaybackPosition")))
    {
      objc_msgSend(v3, "playbackPosition");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
    v18 = *(void **)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 40), "playbackPosition");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_lightweightPersonalizedPlaybackPositionWithUnpersonalizedPlaybackPosition:libraryPlaybackPosition:personalizationProperties:", v17, v19, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPlaybackPosition:", v20);

  }
  objc_msgSend(*(id *)(a1 + 48), "objectForKey:", CFSTR("MPModelRelationshipSongLyrics"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    if (objc_msgSend(*(id *)(a1 + 56), "hasLoadedValueForKey:", CFSTR("MPModelRelationshipSongLyrics")))
    {
      objc_msgSend(*(id *)(a1 + 56), "lyrics");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
    v23 = *(void **)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 40), "lyrics");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "identifiers");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_lightweightPersonalizedLyricsWithUnpersonalizedLyrics:libraryLyrics:identifiers:personalizationProperties:", v22, v24, v25, v21);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLyrics:", v26);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "hasCloudSyncSource"))
  {
    objc_msgSend(*(id *)(a1 + 48), "objectForKey:", CFSTR("MPModelRelationshipSongStoreAsset"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      if (objc_msgSend(v3, "hasLoadedValueForKey:", CFSTR("MPModelRelationshipSongStoreAsset")))
      {
        objc_msgSend(v3, "storeAsset");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v28 = 0;
      }
      v29 = *(void **)(a1 + 72);
      objc_msgSend(*(id *)(a1 + 40), "storeAsset");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "_lightweightPersonalizedStoreAssetWithUnpersonalizedAsset:libraryAsset:personalizationProperties:", v28, v30, v27);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setStoreAsset:", v31);

    }
  }

}

uint64_t __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPlaybackPosition:", *(_QWORD *)(a1 + 32));
}

void __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v29;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v29 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v7);
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyTVEpisodeLibraryAdded"), (_QWORD)v28))
        {
          v9 = *(_QWORD *)(a1 + 56);
          if (v9 == 1)
          {
            v10 = 1;
          }
          else if (v9 == 2)
          {
            v10 = 0;
          }
          else
          {
            v10 = objc_msgSend(*(id *)(a1 + 40), "isLibraryAdded");
          }
          objc_msgSend(v3, "setLibraryAdded:", v10);
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyTVEpisodeKeepLocalEnableState")))
        {
          objc_msgSend(v3, "setKeepLocalEnableState:", objc_msgSend(*(id *)(a1 + 40), "keepLocalEnableState"));
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyTVEpisodeKeepLocalManagedStatus")))
        {
          objc_msgSend(v3, "setKeepLocalManagedStatus:", objc_msgSend(*(id *)(a1 + 40), "keepLocalManagedStatus"));
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyTVEpisodeKeepLocalManagedStatusReason")))
        {
          objc_msgSend(v3, "setKeepLocalManagedStatusReason:", objc_msgSend(*(id *)(a1 + 40), "keepLocalManagedStatusReason"));
        }
        else
        {
          v11 = objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyTVEpisodeKeepLocalConstraints"));
          v12 = *(void **)(a1 + 40);
          if (v11)
          {
            objc_msgSend(v3, "setKeepLocalConstraints:", objc_msgSend(v12, "keepLocalConstraints"));
          }
          else if (objc_msgSend(v12, "hasCloudSyncSource")
                 && objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyTVEpisodeLibraryAddEligible")))
          {
            if ((objc_msgSend(*(id *)(a1 + 40), "isLibraryAddEligible") & 1) != 0)
              v13 = 1;
            else
              v13 = objc_msgSend(v3, "isLibraryAddEligible");
            objc_msgSend(v3, "setLibraryAddEligible:", v13);
          }
        }
        ++v7;
      }
      while (v5 != v7);
      v14 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      v5 = v14;
    }
    while (v14);
  }

  objc_msgSend(*(id *)(a1 + 48), "objectForKey:", CFSTR("MPModelRelationshipTVEpisodeLocalFileAsset"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 == 0;

  if (!v16)
  {
    objc_msgSend(*(id *)(a1 + 40), "localFileAsset");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLocalFileAsset:", v17);

  }
  objc_msgSend(*(id *)(a1 + 48), "objectForKey:", CFSTR("MPModelRelationshipTVEpisodePlaybackPosition"), (_QWORD)v28);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if (objc_msgSend(v3, "hasLoadedValueForKey:", CFSTR("MPModelRelationshipTVEpisodePlaybackPosition")))
    {
      objc_msgSend(v3, "playbackPosition");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }
    v20 = *(void **)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 40), "playbackPosition");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_lightweightPersonalizedPlaybackPositionWithUnpersonalizedPlaybackPosition:libraryPlaybackPosition:personalizationProperties:", v19, v21, v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPlaybackPosition:", v22);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "hasCloudSyncSource"))
  {
    objc_msgSend(*(id *)(a1 + 48), "objectForKey:", CFSTR("MPModelRelationshipTVEpisodeStoreAsset"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = *(void **)(a1 + 64);
      objc_msgSend(v3, "storeAsset");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "storeAsset");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "_lightweightPersonalizedStoreAssetWithUnpersonalizedAsset:libraryAsset:personalizationProperties:", v25, v26, v23);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setStoreAsset:", v27);

    }
  }

}

uint64_t __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPlaybackPosition:", *(_QWORD *)(a1 + 32));
}

void __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v29;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v29 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v7);
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyMovieLibraryAdded"), (_QWORD)v28))
        {
          v9 = *(_QWORD *)(a1 + 56);
          if (v9 == 1)
          {
            v10 = 1;
          }
          else if (v9 == 2)
          {
            v10 = 0;
          }
          else
          {
            v10 = objc_msgSend(*(id *)(a1 + 40), "isLibraryAdded");
          }
          objc_msgSend(v3, "setLibraryAdded:", v10);
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyMovieKeepLocalEnableState")))
        {
          objc_msgSend(v3, "setKeepLocalEnableState:", objc_msgSend(*(id *)(a1 + 40), "keepLocalEnableState"));
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyMovieKeepLocalManagedStatus")))
        {
          objc_msgSend(v3, "setKeepLocalManagedStatus:", objc_msgSend(*(id *)(a1 + 40), "keepLocalManagedStatus"));
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyMovieKeepLocalManagedStatusReason")))
        {
          objc_msgSend(v3, "setKeepLocalManagedStatusReason:", objc_msgSend(*(id *)(a1 + 40), "keepLocalManagedStatusReason"));
        }
        else
        {
          v11 = objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyMovieKeepLocalConstraints"));
          v12 = *(void **)(a1 + 40);
          if (v11)
          {
            objc_msgSend(v3, "setKeepLocalConstraints:", objc_msgSend(v12, "keepLocalConstraints"));
          }
          else if (objc_msgSend(v12, "hasCloudSyncSource")
                 && objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyMovieLibraryAddEligible")))
          {
            if ((objc_msgSend(*(id *)(a1 + 40), "isLibraryAddEligible") & 1) != 0)
              v13 = 1;
            else
              v13 = objc_msgSend(v3, "isLibraryAddEligible");
            objc_msgSend(v3, "setLibraryAddEligible:", v13);
          }
        }
        ++v7;
      }
      while (v5 != v7);
      v14 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      v5 = v14;
    }
    while (v14);
  }

  objc_msgSend(*(id *)(a1 + 48), "objectForKey:", CFSTR("MPModelRelationshipMovieLocalFileAsset"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 == 0;

  if (!v16)
  {
    objc_msgSend(*(id *)(a1 + 40), "localFileAsset");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLocalFileAsset:", v17);

  }
  objc_msgSend(*(id *)(a1 + 48), "objectForKey:", CFSTR("MPModelRelationshipMoviePlaybackPosition"), (_QWORD)v28);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if (objc_msgSend(v3, "hasLoadedValueForKey:", CFSTR("MPModelRelationshipMoviePlaybackPosition")))
    {
      objc_msgSend(v3, "playbackPosition");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }
    v20 = *(void **)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 40), "playbackPosition");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_lightweightPersonalizedPlaybackPositionWithUnpersonalizedPlaybackPosition:libraryPlaybackPosition:personalizationProperties:", v19, v21, v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPlaybackPosition:", v22);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "hasCloudSyncSource"))
  {
    objc_msgSend(*(id *)(a1 + 48), "objectForKey:", CFSTR("MPModelRelationshipMovieStoreAsset"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = *(void **)(a1 + 64);
      objc_msgSend(v3, "storeAsset");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "storeAsset");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "_lightweightPersonalizedStoreAssetWithUnpersonalizedAsset:libraryAsset:personalizationProperties:", v25, v26, v23);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setStoreAsset:", v27);

    }
  }

}

uint64_t __175__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedObjectWithUnpersonalizedObject_libraryObject_personalizationProperties_overrideLibraryAddedStatus___block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPlaybackPosition:", *(_QWORD *)(a1 + 32));
}

void __150__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedStoreAssetWithUnpersonalizedAsset_libraryAsset_personalizationProperties___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a1[4];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyStoreAssetEndpointType"), (_QWORD)v11))
        {
          objc_msgSend(v3, "setEndpointType:", objc_msgSend(a1[5], "endpointType"));
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyStoreAssetRedownloadParameters")))
        {
          objc_msgSend(a1[5], "redownloadParameters");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setRedownloadParameters:", v9);

        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyStoreAssetAccountIdentifier")))
        {
          objc_msgSend(v3, "setAccountIdentifier:", objc_msgSend(a1[5], "accountIdentifier"));
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyStoreAssetShouldReportPlayEvents")))
        {
          objc_msgSend(v3, "setShouldReportPlayEvents:", objc_msgSend(a1[5], "shouldReportPlayEvents"));
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyStoreAssetRedownloadable")))
        {
          if ((objc_msgSend(a1[5], "isRedownloadable") & 1) != 0)
            v10 = 1;
          else
            v10 = objc_msgSend(a1[6], "isRedownloadable");
          objc_msgSend(v3, "setRedownloadable:", v10);
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

void __160__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedLyricsWithUnpersonalizedLyrics_libraryLyrics_identifiers_personalizationProperties___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "properties");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7), "isEqualToString:", CFSTR("MPModelPropertyLyricsHasLibraryLyrics"), (_QWORD)v8))objc_msgSend(v3, "setHasLibraryLyrics:", objc_msgSend(*(id *)(a1 + 40), "hasLibraryLyrics"));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

void __166__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedPlaybackPositionWithUnpersonalizedPlaybackPosition_identifiers_personalizationProperties___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  double v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyPlaybackPositionBookmarkTime"), (_QWORD)v11))
        {
          objc_msgSend(*(id *)(a1 + 40), "bookmarkTime");
          objc_msgSend(v3, "setBookmarkTime:", v9 / 1000.0);
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyPlaybackPositionHasBeenPlayed")))
        {
          objc_msgSend(v3, "setHasBeenPlayed:", objc_msgSend(*(id *)(a1 + 40), "hasBeenPlayed"));
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyPlaybackPositionUserPlayCount")))
        {
          objc_msgSend(v3, "setUserPlayCount:", objc_msgSend(*(id *)(a1 + 40), "userPlayCount"));
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyPlaybackPositionStoreUbiquitousIdentifier")))
        {
          objc_msgSend(*(id *)(a1 + 40), "ubiquitousIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setStoreUbiquitousIdentifier:", v10);

        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

void __178__MPStoreLibraryPersonalizationCollectionDataSource__lightweightPersonalizedPlaybackPositionWithUnpersonalizedPlaybackPosition_libraryPlaybackPosition_personalizationProperties___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyPlaybackPositionBookmarkTime"), (_QWORD)v9))
        {
          objc_msgSend(*(id *)(a1 + 40), "bookmarkTime");
          objc_msgSend(v3, "setBookmarkTime:");
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyPlaybackPositionHasBeenPlayed")))
        {
          objc_msgSend(v3, "setHasBeenPlayed:", objc_msgSend(*(id *)(a1 + 40), "hasBeenPlayed"));
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("MPModelPropertyPlaybackPositionUserPlayCount")))
        {
          objc_msgSend(v3, "setUserPlayCount:", objc_msgSend(*(id *)(a1 + 40), "userPlayCount"));
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

@end
