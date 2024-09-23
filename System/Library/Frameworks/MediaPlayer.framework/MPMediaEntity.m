@implementation MPMediaEntity

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  objc_super v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (-[MPMediaEntity valueForProperty:](self, "valueForProperty:", CFSTR("persistentID")),
        (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "valueForProperty:", CFSTR("persistentID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MPMediaEntity;
    v8 = -[MPMediaEntity isEqual:](&v10, sel_isEqual_, v4);
  }

  return v8;
}

+ (BOOL)canFilterByProperty:(NSString *)property
{
  NSString *v3;
  char v4;

  v3 = property;
  if (-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("persistentID"))
    || -[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("entityRevision"))
    || -[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("keepLocal"))
    || -[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("keepLocalStatus"))
    || -[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("keepLocalStatusReason"))
    || -[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("keepLocalConstraints")))
  {
    v4 = 1;
  }
  else
  {
    v4 = -[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("fileSize"));
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__tokenBinaryIdentifierAsString, 0);
  objc_storeStrong((id *)&self->_multiverseIdentifier, 0);
}

- (id)genericModelObjectWithRequestedProperties:(id)a3
{
  id v4;
  MPModelGenericObject *v5;
  void *v6;
  id v7;
  MPModelGenericObject *v8;
  _QWORD v10[4];
  id v11;
  MPMediaEntity *v12;

  v4 = a3;
  v5 = [MPModelGenericObject alloc];
  +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__MPMediaEntity_NewMP__genericModelObjectWithRequestedProperties___block_invoke;
  v10[3] = &unk_1E3155970;
  v7 = v4;
  v11 = v7;
  v12 = self;
  v8 = -[MPModelObject initWithIdentifiers:block:](v5, "initWithIdentifiers:block:", v6, v10);

  return v8;
}

void __66__MPMediaEntity_NewMP__genericModelObjectWithRequestedProperties___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  void *v5;
  void *v6;
  MPMediaLibraryEntityTranslationContext *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MPMediaLibraryView *v13;
  void *v14;
  MPMediaLibraryView *v15;
  __int128 v16;
  unint64_t *v17;
  unint64_t v18;
  char v19;
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
  mlcore::Entity *v31[2];
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  __int128 v42;
  _BYTE v43[24];
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  __int128 v55;
  _BYTE v56[24];
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  __int128 v60;
  _BYTE v61[24];
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  __int128 v73;
  _BYTE v74[24];
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  __int128 v78;
  _BYTE v79[24];
  __int128 v80;
  __int128 v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  __int128 v88;
  __int128 v89;
  uint64_t v90;
  __int128 v91;
  _BYTE v92[24];
  __int128 v93;
  __int128 v94;
  uint64_t v95;
  __int128 v96;
  _BYTE v97[24];
  __int128 v98;
  __int128 v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  __int128 v106;
  __int128 v107;
  uint64_t v108;
  __int128 v109;
  _BYTE v110[24];
  __int128 v111;
  __int128 v112;
  uint64_t v113;
  __int128 v114;
  _BYTE v115[24];
  __int128 v116;
  __int128 v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  __int128 v124;
  __int128 v125;
  uint64_t v126;
  __int128 v127;
  _BYTE v128[24];
  __int128 v129;
  __int128 v130;
  uint64_t v131;
  __int128 v132;
  _BYTE v133[24];
  __int128 v134;
  __int128 v135;
  uint64_t v136;
  uint64_t v137;
  void *__p;
  void *v139;
  uint64_t v140;
  __int128 v141;
  _BYTE v142[216];

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "relationships");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("MPModelRelationshipGenericSong"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MPMediaLibraryEntityTranslationContext);
  objc_msgSend(*(id *)(a1 + 40), "mediaLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:](MPMediaLibrary, "deviceMediaLibraryWithUserIdentity:", v2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[MPMediaLibraryEntityTranslationContext setMediaLibrary:](v7, "setMediaLibrary:", v9);
  if (!v8)
  {

  }
  objc_msgSend(*(id *)(a1 + 40), "mediaLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accountDSID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaLibraryEntityTranslationContext setPersonID:](v7, "setPersonID:", v12);

  -[MPMediaLibraryEntityTranslationContext setFilteringOptions:](v7, "setFilteringOptions:", 65540);
  v13 = [MPMediaLibraryView alloc];
  -[MPMediaLibraryEntityTranslationContext mediaLibrary](v7, "mediaLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[MPMediaLibraryView initWithLibrary:filteringOptions:](v13, "initWithLibrary:filteringOptions:", v14, -[MPMediaLibraryEntityTranslationContext filteringOptions](v7, "filteringOptions"));

  if (v15)
  {
    -[MPMediaLibraryView mlCoreView](v15, "mlCoreView");
    v16 = *(_OWORD *)v31;
  }
  else
  {
    v16 = 0uLL;
  }
  v141 = v16;
  mlcore::EntityCache::EntityCache();
  if (*((_QWORD *)&v141 + 1))
  {
    v17 = (unint64_t *)(*((_QWORD *)&v141 + 1) + 8);
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&v141 + 1) + 16))(*((_QWORD *)&v141 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v141 + 1));
    }
  }
  if (!v6)
    goto LABEL_17;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(*(id *)(a1 + 40), "mediaType") & 1) == 0)
  {
    objc_msgSend(v4, "setSong:", 0);
LABEL_17:
    v19 = 0;
    goto LABEL_18;
  }
  +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "persistentID");
  if (v22)
  {
    objc_msgSend(v22, "MLCorePropertiesForPropertySet:", v6);
  }
  else
  {
    v139 = 0;
    __p = 0;
    v140 = 0;
  }
  objc_msgSend(v22, "entityClass");
  mlcore::EntityCache::setPropertiesToFetchForEntityClass();
  if (__p)
  {
    v139 = __p;
    operator delete(__p);
  }
  objc_msgSend(v22, "entityClass");
  v126 = 1065353216;
  *(_OWORD *)&v128[8] = 0u;
  *(_OWORD *)&v133[8] = 0u;
  v131 = 1065353216;
  v125 = 0u;
  v124 = 0u;
  v129 = 0u;
  v130 = 0u;
  v135 = 0u;
  v134 = 0u;
  *(_DWORD *)&v128[16] = 1065353216;
  *(_DWORD *)&v133[16] = 1065353216;
  v136 = 1065353216;
  v127 = 0u;
  *(_OWORD *)v128 = 0u;
  *(_OWORD *)v133 = 0u;
  v132 = 0u;
  v123 = MEMORY[0x1E0D4AF40] + 16;
  v137 = MEMORY[0x1E0D4AF40] + 56;
  mlcore::EntityCache::entityForClassAndPersistentID();
  mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase(&v123);
  +[MPMediaLibrary logDatabaseAccess](MPMediaLibrary, "logDatabaseAccess");
  objc_msgSend(v4, "setSong:", 0);

  v19 = 1;
LABEL_18:
  objc_msgSend(v5, "objectForKey:", CFSTR("MPModelRelationshipGenericPlaylist"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    if ((v19 & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_msgSend(v4, "setPlaylist:", 0);
    }
    else
    {
      +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", objc_opt_class());
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "persistentID");
      if (v21)
      {
        objc_msgSend(v21, "MLCorePropertiesForPropertySet:", v20);
      }
      else
      {
        v121 = 0;
        v120 = 0;
        v122 = 0;
      }
      objc_msgSend(v21, "entityClass");
      mlcore::EntityCache::setPropertiesToFetchForEntityClass();
      if (v120)
      {
        v121 = v120;
        operator delete(v120);
      }
      objc_msgSend(v21, "entityClass");
      v108 = 1065353216;
      *(_OWORD *)&v110[8] = 0u;
      *(_OWORD *)&v115[8] = 0u;
      v113 = 1065353216;
      v107 = 0u;
      v106 = 0u;
      v111 = 0u;
      v112 = 0u;
      v117 = 0u;
      v116 = 0u;
      *(_DWORD *)&v110[16] = 1065353216;
      *(_DWORD *)&v115[16] = 1065353216;
      v118 = 1065353216;
      v109 = 0u;
      *(_OWORD *)v110 = 0u;
      *(_OWORD *)v115 = 0u;
      v114 = 0u;
      v105 = MEMORY[0x1E0D4AF40] + 16;
      v119 = MEMORY[0x1E0D4AF40] + 56;
      mlcore::EntityCache::entityForClassAndPersistentID();
      mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase(&v105);
      +[MPMediaLibrary logDatabaseAccess](MPMediaLibrary, "logDatabaseAccess");
      objc_msgSend(v4, "setPlaylist:", 0);

      v19 = 1;
    }
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("MPModelRelationshipGenericAlbum"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    if ((v19 & 1) == 0
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && objc_msgSend(*(id *)(a1 + 40), "groupingType") == 1)
    {
      +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", objc_opt_class());
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "persistentID");
      if (v24)
      {
        objc_msgSend(v24, "MLCorePropertiesForPropertySet:", v23);
      }
      else
      {
        v103 = 0;
        v102 = 0;
        v104 = 0;
      }
      objc_msgSend(v24, "entityClass");
      mlcore::EntityCache::setPropertiesToFetchForEntityClass();
      if (v102)
      {
        v103 = v102;
        operator delete(v102);
      }
      objc_msgSend(v24, "entityClass");
      v90 = 1065353216;
      *(_OWORD *)&v92[8] = 0u;
      *(_OWORD *)&v97[8] = 0u;
      v95 = 1065353216;
      v89 = 0u;
      v88 = 0u;
      v93 = 0u;
      v94 = 0u;
      v99 = 0u;
      v98 = 0u;
      *(_DWORD *)&v92[16] = 1065353216;
      *(_DWORD *)&v97[16] = 1065353216;
      v100 = 1065353216;
      v91 = 0u;
      *(_OWORD *)v92 = 0u;
      v96 = 0u;
      *(_OWORD *)v97 = 0u;
      v87 = MEMORY[0x1E0D4AF40] + 16;
      v101 = MEMORY[0x1E0D4AF40] + 56;
      mlcore::EntityCache::entityForClassAndPersistentID();
      mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase(&v87);
      +[MPMediaLibrary logDatabaseAccess](MPMediaLibrary, "logDatabaseAccess");
      objc_msgSend(v4, "setAlbum:", 0);

      v19 = 1;
    }
    else
    {
      objc_msgSend(v4, "setAlbum:", 0);
    }
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("MPModelRelationshipGenericArtist"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    if ((v19 & 1) == 0
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && objc_msgSend(*(id *)(a1 + 40), "groupingType") == 2)
    {
      +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", objc_opt_class());
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "persistentID");
      if (v26)
      {
        objc_msgSend(v26, "MLCorePropertiesForPropertySet:", v25);
      }
      else
      {
        v85 = 0;
        v84 = 0;
        v86 = 0;
      }
      objc_msgSend(v26, "entityClass");
      mlcore::EntityCache::setPropertiesToFetchForEntityClass();
      if (v84)
      {
        v85 = v84;
        operator delete(v84);
      }
      objc_msgSend(v26, "entityClass");
      v72 = 1065353216;
      *(_OWORD *)&v74[8] = 0u;
      *(_OWORD *)&v79[8] = 0u;
      v77 = 1065353216;
      v71 = 0u;
      v70 = 0u;
      v75 = 0u;
      v76 = 0u;
      v81 = 0u;
      v80 = 0u;
      *(_DWORD *)&v74[16] = 1065353216;
      *(_DWORD *)&v79[16] = 1065353216;
      v82 = 1065353216;
      v73 = 0u;
      *(_OWORD *)v74 = 0u;
      v78 = 0u;
      *(_OWORD *)v79 = 0u;
      v69 = MEMORY[0x1E0D4AF40] + 16;
      v83 = MEMORY[0x1E0D4AF40] + 56;
      mlcore::EntityCache::entityForClassAndPersistentID();
      mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase(&v69);
      +[MPMediaLibrary logDatabaseAccess](MPMediaLibrary, "logDatabaseAccess");
      objc_msgSend(v4, "setArtist:", 0);

      v19 = 1;
    }
    else
    {
      objc_msgSend(v4, "setArtist:", 0);
    }
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("MPModelRelationshipGenericTVEpisode"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    if ((v19 & 1) == 0
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && objc_msgSend(*(id *)(a1 + 40), "mediaType") == 512)
    {
      +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", objc_opt_class());
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "persistentID");
      if (v28)
      {
        objc_msgSend(v28, "MLCorePropertiesForPropertySet:", v27);
      }
      else
      {
        v66 = 0;
        v67 = 0;
        v68 = 0;
      }
      objc_msgSend(v28, "entityClass");
      mlcore::EntityCache::setPropertiesToFetchForEntityClass();
      if (v66)
      {
        v67 = v66;
        operator delete(v66);
      }
      objc_msgSend(v28, "entityClass");
      v54 = 1065353216;
      *(_OWORD *)&v56[8] = 0u;
      *(_OWORD *)&v61[8] = 0u;
      v59 = 1065353216;
      v53 = 0u;
      v52 = 0u;
      v57 = 0u;
      v58 = 0u;
      v63 = 0u;
      v62 = 0u;
      *(_DWORD *)&v56[16] = 1065353216;
      *(_DWORD *)&v61[16] = 1065353216;
      v64 = 1065353216;
      v55 = 0u;
      *(_OWORD *)v56 = 0u;
      v60 = 0u;
      *(_OWORD *)v61 = 0u;
      v51 = MEMORY[0x1E0D4AF40] + 16;
      v65 = MEMORY[0x1E0D4AF40] + 56;
      mlcore::EntityCache::entityForClassAndPersistentID();
      mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase(&v51);
      +[MPMediaLibrary logDatabaseAccess](MPMediaLibrary, "logDatabaseAccess");
      objc_msgSend(v4, "setTvEpisode:", 0);

      v19 = 1;
    }
    else
    {
      objc_msgSend(v4, "setTvEpisode:", 0);
    }
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("MPModelRelationshipGenericMovie"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    if ((v19 & 1) == 0
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && objc_msgSend(*(id *)(a1 + 40), "mediaType") == 256)
    {
      +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", objc_opt_class());
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "persistentID");
      if (v30)
      {
        objc_msgSend(v30, "MLCorePropertiesForPropertySet:", v29);
      }
      else
      {
        v48 = 0;
        v49 = 0;
        v50 = 0;
      }
      objc_msgSend(v30, "entityClass");
      mlcore::EntityCache::setPropertiesToFetchForEntityClass();
      if (v48)
      {
        v49 = v48;
        operator delete(v48);
      }
      objc_msgSend(v30, "entityClass");
      *(_OWORD *)&v43[8] = 0u;
      v41 = 1065353216;
      v40 = 0u;
      v45 = 0u;
      v44 = 0u;
      v35 = 1065353216;
      v38 = 1065353216;
      *(_DWORD *)&v43[16] = 1065353216;
      v46 = 1065353216;
      v34 = 0u;
      v33 = 0u;
      v36 = 0u;
      v37 = 0u;
      v39 = 0u;
      v42 = 0u;
      *(_OWORD *)v43 = 0u;
      v32 = MEMORY[0x1E0D4AF40] + 16;
      v47 = MEMORY[0x1E0D4AF40] + 56;
      mlcore::EntityCache::entityForClassAndPersistentID();
      mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase(&v32);
      +[MPMediaLibrary logDatabaseAccess](MPMediaLibrary, "logDatabaseAccess");
      objc_msgSend(v4, "setMovie:", 0);

    }
    else
    {
      objc_msgSend(v4, "setMovie:", 0);
    }
  }
  MEMORY[0x194038D7C](v142);

}

- (MPMediaEntityPersistentID)persistentID
{
  void *v2;
  MPMediaEntityPersistentID v3;

  -[MPMediaEntity valueForProperty:](self, "valueForProperty:", CFSTR("persistentID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongLongValue");

  return v3;
}

- (MPMediaItem)representativeItem
{
  return 0;
}

- (id)valueForProperty:(NSString *)property
{
  return 0;
}

- (id)valuesForProperties:(id)a3
{
  return 0;
}

- (id)cachedValueForProperty:(id)a3 isCached:(BOOL *)a4
{
  return 0;
}

- (void)enumerateValuesForProperties:(NSSet *)properties usingBlock:(void *)block
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = block;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__MPMediaEntity_enumerateValuesForProperties_usingBlock___block_invoke;
  v8[3] = &unk_1E3158580;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[NSSet enumerateObjectsUsingBlock:](properties, "enumerateObjectsUsingBlock:", v8);

}

- (MPMediaEntity)initWithMultiverseIdentifier:(id)a3 library:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaEntity.m"), 82, CFSTR("subclass must implement"));

  return 0;
}

- (MPMediaEntity)initWithCoder:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaEntity.m"), 87, CFSTR("subclass must implement"));

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaEntity.m"), 92, CFSTR("subclass must implement"));

}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  objc_super v8;

  -[MPMediaEntity valueForProperty:](self, "valueForProperty:", CFSTR("persistentID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "unsignedLongLongValue");
    v6 = v5 ^ HIDWORD(v5);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MPMediaEntity;
    v6 = -[MPMediaEntity hash](&v8, sel_hash);
  }

  return v6;
}

- (MPMediaLibrary)mediaLibrary
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaEntity.m"), 128, CFSTR("subclass must implement"));

  return 0;
}

- (MIPMultiverseIdentifier)multiverseIdentifier
{
  return self->_multiverseIdentifier;
}

- (NSString)_tokenBinaryIdentifierAsString
{
  return self->__tokenBinaryIdentifierAsString;
}

void __57__MPMediaEntity_enumerateValuesForProperties_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "valueForProperty:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
