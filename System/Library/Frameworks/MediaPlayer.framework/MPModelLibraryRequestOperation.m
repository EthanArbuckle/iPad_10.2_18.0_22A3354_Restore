@implementation MPModelLibraryRequestOperation

- (void)_insertPropertyCacheForEntityPID:(int64_t)a3 entityClass:(void *)a4 entityTranslator:(id)a5 translationContext:(id)a6 propertyCachesVector:(const void *)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  _OWORD *v16;
  char v17;
  uint64_t v18;
  char v19;
  __int128 v20;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *p_shared_owners;
  unint64_t v25;
  uint64_t i;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  unint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  void *v38;
  _QWORD v39[9];
  mlcore::Query *v40;
  std::__shared_weak_count *v41;
  uint64_t v42[3];
  _OWORD *v43;
  _OWORD *v44;
  _OWORD *v45;
  std::__shared_weak_count *v46;
  mlcore::Query *v47;
  std::__shared_weak_count *v48;
  int64_t v49;
  void **v50;
  char v51;
  uint64_t v52;
  uint64_t *v53;
  __int128 v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v49 = a3;
  v12 = a5;
  v13 = a6;
  -[MPModelLibraryRequestOperation _libraryView](self, "_libraryView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v12, "entityQueryForPropertySet:sortDescriptors:context:view:", v15, MEMORY[0x1E0C9AA60], v13, v14);
  }
  else
  {
    v47 = 0;
    v48 = 0;
  }

  mlcore::Query::predicate(v47);
  (*(void (**)(void *))(*(_QWORD *)a4 + 112))(a4);
  std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<long long>,std::allocator<mlcore::ComparisonPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::ComparisonOperator,long long const&,void>(v42);
  v54 = *(_OWORD *)v42;
  *(_OWORD *)v42 = 0uLL;
  v44 = 0;
  v45 = 0;
  v43 = 0;
  v50 = (void **)&v43;
  v51 = 0;
  v16 = operator new(0x20uLL);
  v17 = 0;
  v18 = 0;
  v43 = v16;
  v44 = v16;
  v45 = v16 + 2;
  do
  {
    v19 = v17;
    v20 = *((_OWORD *)&v52 + v18);
    *v16 = v20;
    if (*((_QWORD *)&v20 + 1))
    {
      v21 = (unint64_t *)(*((_QWORD *)&v20 + 1) + 8);
      do
        v22 = __ldxr(v21);
      while (__stxr(v22 + 1, v21));
    }
    ++v16;
    v17 = 1;
    v18 = 1;
  }
  while ((v19 & 1) == 0);
  v44 = v16;
  mlcore::CreateAndPredicate();
  mlcore::Query::setPredicate();
  v23 = v46;
  if (v46)
  {
    p_shared_owners = (unint64_t *)&v46->__shared_owners_;
    do
      v25 = __ldaxr(p_shared_owners);
    while (__stlxr(v25 - 1, p_shared_owners));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  v50 = (void **)&v43;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v50);
  for (i = 16; i != -16; i -= 16)
    std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&v52 + i);
  v27 = (std::__shared_weak_count *)v42[1];
  if (v42[1])
  {
    v28 = (unint64_t *)(v42[1] + 8);
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
  v52 = 0;
  v53 = &v52;
  *(_QWORD *)&v54 = 0x2020000000;
  BYTE8(v54) = 0;
  v40 = v47;
  v41 = v48;
  if (v48)
  {
    v30 = (unint64_t *)&v48->__shared_owners_;
    do
      v31 = __ldxr(v30);
    while (__stxr(v31 + 1, v30));
  }
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __136__MPModelLibraryRequestOperation__insertPropertyCacheForEntityPID_entityClass_entityTranslator_translationContext_propertyCachesVector___block_invoke;
  v39[3] = &unk_1E3153960;
  v39[6] = a7;
  v39[7] = a4;
  v39[8] = v49;
  v39[4] = self;
  v39[5] = &v52;
  objc_msgSend(v14, "performCoreQuery:withCompletion:", &v40, v39);
  v32 = v41;
  if (v41)
  {
    v33 = (unint64_t *)&v41->__shared_owners_;
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
  }
  if (!*((_BYTE *)v53 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelLibraryRequestOperation.mm"), 303, CFSTR("MLCore library queries should be guaranteed no-escape"));

  }
  _Block_object_dispose(&v52, 8);
  v35 = v48;
  if (v48)
  {
    v36 = (unint64_t *)&v48->__shared_owners_;
    do
      v37 = __ldaxr(v36);
    while (__stlxr(v37 - 1, v36));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }

}

- (void)_executeNewRequest
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  std::__shared_weak_count *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  int v28;
  uint64_t v29;
  mlcore *v30;
  uint64_t IsLimited;
  uint64_t v32;
  void **v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  unint64_t *v37;
  unint64_t v38;
  id v39;
  std::__shared_weak_count *v40;
  unint64_t *p_shared_owners;
  unint64_t v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  MPModelLibraryResponse *v49;
  void **v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  void *v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  MPModelLibraryDefaultSectionedCollectionDataSource *v60;
  MPModelLibraryRequest *request;
  unint64_t *v62;
  unint64_t v63;
  MPModelLibraryDefaultSectionedCollectionDataSource *v64;
  std::__shared_weak_count *v65;
  unint64_t *v66;
  unint64_t v67;
  MPLazySectionedCollection *v68;
  std::__shared_weak_count *v69;
  unint64_t *v70;
  unint64_t v71;
  uint64_t v72;
  unint64_t *v73;
  unint64_t v74;
  id v75;
  std::__shared_weak_count *v76;
  unint64_t *v77;
  unint64_t v78;
  int v79;
  mlcore::EntityQueryResult *v80;
  std::__shared_weak_count *v81;
  unint64_t *v82;
  unint64_t v83;
  size_t v84;
  unint64_t *v85;
  unint64_t v86;
  id v87;
  id v88;
  id v89;
  uint64_t shared_weak_owners;
  void *v91;
  std::__shared_weak_count *v92;
  unint64_t *v93;
  unint64_t v94;
  MPModelLibraryModelSectionedCollectionDataSource *v95;
  MPModelLibraryRequest *v96;
  unint64_t *v97;
  unint64_t v98;
  MPModelLibraryModelSectionedCollectionDataSource *v99;
  std::__shared_weak_count *v100;
  unint64_t *v101;
  unint64_t v102;
  MPLazySectionedCollection *v103;
  std::__shared_weak_count *v104;
  unint64_t *v105;
  unint64_t v106;
  std::__shared_weak_count *v107;
  unint64_t *v108;
  unint64_t v109;
  std::__shared_weak_count *v110;
  unint64_t *v111;
  unint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  void *v118;
  void *v119;
  BOOL v120;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  MPModelLibraryResponse *v128;
  void *v129;
  void *v130;
  void *v131;
  std::__shared_weak_count *v132;
  id v133;
  uint64_t *v134;
  std::__shared_weak_count *v135;
  mlcore::EntityQueryResult *v136;
  std::__shared_weak_count *v137;
  _QWORD block[5];
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  void **v146;
  void **v147;
  void **v148;
  mlcore::EntityQueryResult *v149;
  std::__shared_weak_count *v150;
  uint64_t v151;
  SEL v152;
  char v153;
  BOOL v154;
  void *v155;
  std::__shared_weak_count *v156;
  uint64_t v157;
  uint64_t (*v158)(uint64_t, uint64_t);
  void (*v159)(uint64_t);
  id v160;
  void *v161;
  std::__shared_weak_count *v162;
  uint64_t v163;
  uint64_t (*v164)(uint64_t, uint64_t);
  uint64_t (*v165)();
  void *v166;
  int v167;
  uint64_t *v168;
  void **v169;
  unint64_t v170;
  _QWORD *(*v171)(_QWORD *, _QWORD *);
  void (*v172)(uint64_t);
  void *v173;
  _QWORD **v174;
  _QWORD *v175[2];
  mlcore::EntityQueryResult *v176;
  std::__shared_weak_count *v177;
  id v178;
  mlcore::PropertiesQuery *v179;
  std::__shared_weak_count *v180;
  mlcore::EntityQueryResult *v181;
  std::__shared_weak_count *v182;
  void *v183;
  void *v184;
  uint64_t v185;
  mlcore::PropertiesQuery *v186;
  std::__shared_weak_count *v187;

  -[MPModelLibraryRequestOperation request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelLibraryRequestOperation request](self, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    -[MPModelLibraryRequestOperation request](self, "request");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "connectionAssertionWithIdentifier:", v8);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {

  }
  -[MPModelLibraryRequestOperation _libraryView](self, "_libraryView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelRequest sectionKind](self->_request, "sectionKind");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "modelClass");

  -[MPModelRequest itemKind](self->_request, "itemKind");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "modelClass");

  v14 = -[MPModelLibraryRequest contentRange](self->_request, "contentRange");
  v16 = v15;
  v122 = (void *)v14;
  if (v13)
  {
    +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  -[MPModelRequest itemProperties](self->_request, "itemProperties");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = -[MPModelLibraryResponse initWithRequest:]([MPModelLibraryResponse alloc], "initWithRequest:", self->_request);
  -[MPModelLibraryResponse setLibraryAssertion:](v128, "setLibraryAssertion:", v130);
  v120 = v11 != 0;
  if (!v11)
  {
    -[MPModelLibraryRequest itemTranslationContext](self->_request, "itemTranslationContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v9, "copy");
    -[MPModelRequest itemSortDescriptors](self->_request, "itemSortDescriptors");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v17, "entityQueryForPropertySet:sortDescriptors:context:view:", v129, v21, v19, v20);
    }
    else
    {
      v168 = 0;
      v169 = 0;
    }

    v36 = v168;
    if (v168)
    {
      if (!v16)
        goto LABEL_30;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelLibraryRequestOperation.mm"), 562, CFSTR("Request did not produce an item query: %@"), self->_request);

      v36 = 0;
      if (!v16)
      {
LABEL_30:
        v134 = v36;
        v135 = (std::__shared_weak_count *)v169;
        if (v169)
        {
          v37 = (unint64_t *)(v169 + 1);
          do
            v38 = __ldxr(v37);
          while (__stxr(v38 + 1, v37));
        }
        v133 = 0;
        if (v20)
        {
          objc_msgSend(v20, "resultsForCoreQuery:error:", &v134, &v133);
          v39 = v133;
        }
        else
        {
          v39 = 0;
          v161 = 0;
          v162 = 0;
        }
        v40 = v135;
        if (!v135)
          goto LABEL_40;
        p_shared_owners = (unint64_t *)&v135->__shared_owners_;
        do
          v42 = __ldaxr(p_shared_owners);
        while (__stlxr(v42 - 1, p_shared_owners));
        if (!v42)
        {
          ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
          std::__shared_weak_count::__release_weak(v40);
          if (v39)
            goto LABEL_41;
        }
        else
        {
LABEL_40:
          if (v39)
          {
LABEL_41:
            -[MPAsyncOperation finishWithError:](self, "finishWithError:", v39);
            goto LABEL_42;
          }
        }
        v56 = v161;
        if (!v161)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v116, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelLibraryRequestOperation.mm"), 575, CFSTR("item query did not produce error or result"));

          v56 = v161;
        }
        v57 = v162;
        v155 = v56;
        v156 = v162;
        if (v162)
        {
          v58 = (unint64_t *)&v162->__shared_owners_;
          do
            v59 = __ldxr(v58);
          while (__stxr(v59 + 1, v58));
        }
        v60 = [MPModelLibraryDefaultSectionedCollectionDataSource alloc];
        request = self->_request;
        v131 = v56;
        v132 = v57;
        if (v57)
        {
          v62 = (unint64_t *)&v57->__shared_owners_;
          do
            v63 = __ldxr(v62);
          while (__stxr(v63 + 1, v62));
        }
        v64 = -[MPModelLibraryDefaultSectionedCollectionDataSource initWithRequest:itemQueryResults:](v60, "initWithRequest:itemQueryResults:", request, &v131);
        v65 = v132;
        if (v132)
        {
          v66 = (unint64_t *)&v132->__shared_owners_;
          do
            v67 = __ldaxr(v66);
          while (__stlxr(v67 - 1, v66));
          if (!v67)
          {
            ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
            std::__shared_weak_count::__release_weak(v65);
          }
        }
        v68 = -[MPLazySectionedCollection initWithDataSource:]([MPLazySectionedCollection alloc], "initWithDataSource:", v64);
        -[MPModelResponse setResults:](v128, "setResults:", v68);

        v69 = v156;
        if (v156)
        {
          v70 = (unint64_t *)&v156->__shared_owners_;
          do
            v71 = __ldaxr(v70);
          while (__stlxr(v71 - 1, v70));
          if (!v71)
          {
            ((void (*)(std::__shared_weak_count *))v69->__on_zero_shared)(v69);
            std::__shared_weak_count::__release_weak(v69);
          }
        }
LABEL_42:
        v43 = v162;
        if (v162)
        {
          v44 = (unint64_t *)&v162->__shared_owners_;
          do
            v45 = __ldaxr(v44);
          while (__stlxr(v45 - 1, v44));
          if (!v45)
          {
            ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
            std::__shared_weak_count::__release_weak(v43);
          }
        }

        v46 = (std::__shared_weak_count *)v169;
        if (v169)
        {
          v47 = (unint64_t *)(v169 + 1);
          do
            v48 = __ldaxr(v47);
          while (__stlxr(v48 - 1, v47));
          if (!v48)
          {
            ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
            std::__shared_weak_count::__release_weak(v46);
          }
        }

        v49 = v128;
        if (!v39)
          goto LABEL_151;
        goto LABEL_152;
      }
    }
    v161 = v122;
    v162 = v16;
    mlcore::RangeQuery::setRange();
    v36 = v168;
    goto LABEL_30;
  }
  v124 = v17;
  -[MPModelLibraryRequestOperation _sectionProperties](self, "_sectionProperties");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", v11);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelLibraryRequest sectionTranslationContext](self->_request, "sectionTranslationContext");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelRequest sectionSortDescriptors](self->_request, "sectionSortDescriptors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v127)
  {
    objc_msgSend(v127, "entityQueryForPropertySet:sortDescriptors:context:view:", v125, v18, v126, v9);
  }
  else
  {
    v186 = 0;
    v187 = 0;
  }

  if (!v186)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelLibraryRequestOperation.mm"), 395, CFSTR("Request did not produce an entity query: %@"), self->_request);

  }
  -[MPModelLibraryRequest filterText](self->_request, "filterText");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v22, "length"))
  {

    LOBYTE(v28) = 0;
LABEL_25:
    v17 = v124;
    goto LABEL_91;
  }
  -[MPModelRequest sectionKind](self->_request, "sectionKind");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = v9;
  objc_msgSend(v23, "identityKind");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPModelPlaylistKind identityKind](MPModelPlaylistKind, "identityKind");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v24;
  v27 = v25;
  if (v26 == v27)
    v28 = 1;
  else
    v28 = objc_msgSend(v26, "isEqual:", v27);

  if (!v28)
  {
    v9 = v119;
    goto LABEL_25;
  }
  v29 = mlcore::PropertiesQuery::propertiesToFetch(v186);
  v168 = 0;
  v169 = 0;
  v170 = 0;
  v30 = (mlcore *)std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v168, *(const void **)v29, *(_QWORD *)(v29 + 8), (uint64_t)(*(_QWORD *)(v29 + 8) - *(_QWORD *)v29) >> 3);
  IsLimited = mlcore::PlaylistPropertySmartIsLimited(v30);
  v32 = IsLimited;
  v33 = v169;
  if ((unint64_t)v169 >= v170)
  {
    v50 = (void **)v168;
    v51 = ((char *)v169 - (char *)v168) >> 3;
    v52 = v51 + 1;
    if ((unint64_t)(v51 + 1) >> 61)
      std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
    v53 = v170 - (_QWORD)v168;
    if ((uint64_t)(v170 - (_QWORD)v168) >> 2 > v52)
      v52 = v53 >> 2;
    if ((unint64_t)v53 >= 0x7FFFFFFFFFFFFFF8)
      v54 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v54 = v52;
    if (v54)
      v54 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v54);
    else
      v55 = 0;
    v34 = (uint64_t *)(v54 + 8 * v51);
    *v34 = v32;
    v35 = (uint64_t)(v34 + 1);
    if (v33 != v50)
    {
      do
      {
        v72 = (uint64_t)*--v33;
        *--v34 = v72;
      }
      while (v33 != v50);
      v33 = (void **)v168;
    }
    v168 = v34;
    v170 = v54 + 8 * v55;
    v9 = v119;
    if (v33)
      operator delete(v33);
  }
  else
  {
    *v169 = (void *)IsLimited;
    v34 = v168;
    v35 = (uint64_t)(v33 + 1);
    v9 = v119;
  }
  v169 = (void **)v35;
  v184 = 0;
  v185 = 0;
  v183 = 0;
  std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v183, v34, v35, (v35 - (uint64_t)v34) >> 3);
  v17 = v124;
  mlcore::PropertiesQuery::setPropertiesToFetch();
  if (v183)
  {
    v184 = v183;
    operator delete(v183);
  }
  if (v168)
    operator delete(v168);
LABEL_91:
  if (v16)
  {
    v168 = (uint64_t *)v122;
    v169 = (void **)&v16->__vftable;
    mlcore::RangeQuery::setRange();
  }
  v179 = v186;
  v180 = v187;
  if (v187)
  {
    v73 = (unint64_t *)&v187->__shared_owners_;
    do
      v74 = __ldxr(v73);
    while (__stxr(v74 + 1, v73));
  }
  v178 = 0;
  if (v9)
  {
    objc_msgSend(v9, "resultsForCoreQuery:error:", &v179, &v178);
    v75 = v178;
  }
  else
  {
    v75 = 0;
    v181 = 0;
    v182 = 0;
  }
  v76 = v180;
  if (!v180)
    goto LABEL_103;
  v77 = (unint64_t *)&v180->__shared_owners_;
  do
    v78 = __ldaxr(v77);
  while (__stlxr(v78 - 1, v77));
  if (!v78)
  {
    ((void (*)(std::__shared_weak_count *))v76->__on_zero_shared)(v76);
    std::__shared_weak_count::__release_weak(v76);
    if (v75)
      goto LABEL_104;
  }
  else
  {
LABEL_103:
    if (v75)
    {
LABEL_104:
      -[MPAsyncOperation finishWithError:](self, "finishWithError:", v75);
      v79 = 1;
      goto LABEL_140;
    }
  }
  v80 = v181;
  if (!v181)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelLibraryRequestOperation.mm"), 418, CFSTR("section query did not produce error or result for request: %@"), self->_request);

    v80 = v181;
  }
  v81 = v182;
  v176 = v80;
  v177 = v182;
  if (v182)
  {
    v82 = (unint64_t *)&v182->__shared_owners_;
    do
      v83 = __ldxr(v82);
    while (__stxr(v83 + 1, v82));
  }
  v168 = 0;
  v169 = (void **)&v168;
  v171 = __Block_byref_object_copy__2440;
  v172 = __Block_byref_object_dispose__2441;
  v170 = 0x4812000000;
  v175[0] = 0;
  v175[1] = 0;
  v173 = &unk_193F4554F;
  v174 = v175;
  if (!v17)
    goto LABEL_125;
  -[MPModelLibraryRequest itemTranslationContext](self->_request, "itemTranslationContext");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "scopedContainers");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v161 = 0;
  v162 = (std::__shared_weak_count *)&v161;
  v163 = 0x3812000000;
  v164 = __Block_byref_object_copy__64;
  v165 = __Block_byref_object_dispose__65;
  v166 = &unk_193F4554F;
  v167 = 0;
  v155 = 0;
  v156 = (std::__shared_weak_count *)&v155;
  v157 = 0x3032000000;
  v158 = __Block_byref_object_copy__67;
  v159 = __Block_byref_object_dispose__68;
  v160 = 0;
  v84 = mlcore::EntityQueryResult::entityCount(v80);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3321888768;
  block[2] = __52__MPModelLibraryRequestOperation__executeNewRequest__block_invoke;
  block[3] = &unk_1E314AEC0;
  v146 = &v161;
  v147 = &v155;
  block[4] = self;
  v153 = v28;
  v149 = v80;
  v150 = v81;
  if (v81)
  {
    v85 = (unint64_t *)&v81->__shared_owners_;
    do
      v86 = __ldxr(v85);
    while (__stxr(v86 + 1, v85));
  }
  v87 = v123;
  v139 = v87;
  v140 = v126;
  v151 = v11;
  v88 = v118;
  v141 = v88;
  v142 = v9;
  v143 = v124;
  v152 = a2;
  v144 = v129;
  v148 = (void **)&v168;
  v154 = v120;
  v89 = v117;
  v145 = v89;
  dispatch_apply(v84, 0, block);
  shared_weak_owners = v156[1].__shared_weak_owners_;
  if (shared_weak_owners)
  {
    -[MPAsyncOperation finishWithError:](self, "finishWithError:", v156[1].__shared_weak_owners_);
  }
  else
  {
    v91 = (void *)objc_msgSend(v89, "copy");
    -[MPModelLibraryResponse setSectionKeepLocalStatusConfigurations:](v128, "setSectionKeepLocalStatusConfigurations:", v91);

  }
  v92 = v150;
  if (v150)
  {
    v93 = (unint64_t *)&v150->__shared_owners_;
    do
      v94 = __ldaxr(v93);
    while (__stlxr(v94 - 1, v93));
    if (!v94)
    {
      ((void (*)(std::__shared_weak_count *))v92->__on_zero_shared)(v92);
      std::__shared_weak_count::__release_weak(v92);
    }
  }
  _Block_object_dispose(&v155, 8);

  _Block_object_dispose(&v161, 8);
  if (shared_weak_owners)
  {
    v79 = 1;
  }
  else
  {
LABEL_125:
    v95 = [MPModelLibraryModelSectionedCollectionDataSource alloc];
    v96 = self->_request;
    v136 = v176;
    v137 = v177;
    if (v177)
    {
      v97 = (unint64_t *)&v177->__shared_owners_;
      do
        v98 = __ldxr(v97);
      while (__stxr(v98 + 1, v97));
    }
    v99 = -[MPModelLibraryModelSectionedCollectionDataSource initWithRequest:sectionQueryResults:itemQueryResults:](v95, "initWithRequest:sectionQueryResults:itemQueryResults:", v96, &v136, v169 + 6);
    v100 = v137;
    if (v137)
    {
      v101 = (unint64_t *)&v137->__shared_owners_;
      do
        v102 = __ldaxr(v101);
      while (__stlxr(v102 - 1, v101));
      if (!v102)
      {
        ((void (*)(std::__shared_weak_count *))v100->__on_zero_shared)(v100);
        std::__shared_weak_count::__release_weak(v100);
      }
    }
    v103 = -[MPLazySectionedCollection initWithDataSource:]([MPLazySectionedCollection alloc], "initWithDataSource:", v99);
    -[MPModelResponse setResults:](v128, "setResults:", v103);

    v79 = 0;
  }
  _Block_object_dispose(&v168, 8);
  std::__tree<std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>,std::__map_value_compare<long long,std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>,std::less<long long>,true>,std::allocator<std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>>>::destroy(v175[0]);
  v104 = v177;
  if (v177)
  {
    v105 = (unint64_t *)&v177->__shared_owners_;
    do
      v106 = __ldaxr(v105);
    while (__stlxr(v106 - 1, v105));
    if (!v106)
    {
      ((void (*)(std::__shared_weak_count *))v104->__on_zero_shared)(v104);
      std::__shared_weak_count::__release_weak(v104);
    }
  }
  v17 = v124;
LABEL_140:
  v107 = v182;
  if (v182)
  {
    v108 = (unint64_t *)&v182->__shared_owners_;
    do
      v109 = __ldaxr(v108);
    while (__stlxr(v109 - 1, v108));
    if (!v109)
    {
      ((void (*)(std::__shared_weak_count *))v107->__on_zero_shared)(v107);
      std::__shared_weak_count::__release_weak(v107);
    }
  }

  v110 = v187;
  if (v187)
  {
    v111 = (unint64_t *)&v187->__shared_owners_;
    do
      v112 = __ldaxr(v111);
    while (__stlxr(v112 - 1, v111));
    if (!v112)
    {
      ((void (*)(std::__shared_weak_count *))v110->__on_zero_shared)(v110);
      std::__shared_weak_count::__release_weak(v110);
    }
  }

  v49 = v128;
  if (!v79)
  {
LABEL_151:
    (*((void (**)(void))self->_responseHandler + 2))();
    -[MPAsyncOperation finish](self, "finish");
  }
LABEL_152:

}

- (MPModelLibraryRequest)request
{
  return self->_request;
}

- (id)_libraryView
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  MPMediaLibraryView *v7;
  void *v8;
  MPMediaLibraryView *v9;

  v3 = -[MPModelLibraryRequest filteringOptions](self->_request, "filteringOptions");
  -[MPModelRequest itemKind](self->_request, "itemKind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "modelClass");
  v6 = objc_opt_class();

  if (v5 == v6)
    v3 |= 4uLL;
  v7 = [MPMediaLibraryView alloc];
  -[MPModelLibraryRequest mediaLibrary](self->_request, "mediaLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MPMediaLibraryView initWithLibrary:filteringOptions:](v7, "initWithLibrary:filteringOptions:", v8, v3);

  return v9;
}

- (void)execute
{
  void *v3;

  -[MPModelLibraryRequest legacyMediaQuery](self->_request, "legacyMediaQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MPModelLibraryRequestOperation _executeLegacyRequest](self, "_executeLegacyRequest");
  }
  else
  {
    -[MPModelLibraryRequestOperation _sanityCheckRequest](self, "_sanityCheckRequest");
    -[MPModelLibraryRequestOperation _executeNewRequest](self, "_executeNewRequest");
  }
}

- (void)_sanityCheckRequest
{
  void *v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  dispatch_semaphore_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  unint64_t j;
  unint64_t k;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v32;
  uint64_t v33;
  id obj;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  _QWORD v40[4];
  NSObject *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[3];
  uint8_t buf[4];
  MPModelLibraryRequestOperation *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  -[MPModelLibraryRequestOperation request](self, "request");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "itemKind");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v2, "modelClass");

  v36 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v39, "scopedContainers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
  if (v3)
  {
    v37 = *(_QWORD *)v43;
    v33 = *MEMORY[0x1E0D4CE38];
    do
    {
      v38 = v3;
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v43 != v37)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v6 = objc_opt_class();
        if (v6)
        {
          objc_msgSend(v36, "addObject:", v6);
        }
        else
        {
          v7 = os_log_create("com.apple.amp.mediaplayer", "Library");
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218498;
            v48 = self;
            v49 = 2114;
            v50 = v39;
            v51 = 2114;
            v52 = v5;
            _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_ERROR, "MPModelLibraryRequestOperation: %p _sanityCheckRequest: nil container class request=%{public}@ scopedContainer=%{public}@", buf, 0x20u);
          }

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("request:%@"), v39);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v39, "scopedContainers");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "stringWithFormat:", CFSTR("scopedContainers:%@"), v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("container:%@"), v5);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = dispatch_semaphore_create(0);
          v14 = (void *)MEMORY[0x1E0D4D030];
          v15 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v39, "label");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringWithFormat:", CFSTR("%@"), v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v46[0] = v8;
          v46[1] = v11;
          v46[2] = v12;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 3);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v40[0] = MEMORY[0x1E0C809B0];
          v40[1] = 3221225472;
          v40[2] = __53__MPModelLibraryRequestOperation__sanityCheckRequest__block_invoke;
          v40[3] = &unk_1E3163508;
          v19 = v13;
          v41 = v19;
          objc_msgSend(v14, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v33, CFSTR("Bug"), CFSTR("ModelRequestWithNilContainerClass"), v17, 0, v18, v40);

          dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    }
    while (v3);
  }

  v20 = v39;
  if (objc_msgSend(v36, "containsObject:", v32) && v32 != objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "label");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelLibraryRequestOperation.mm"), 348, CFSTR("scopedContainers cannot contain a MPModelObject subclass matching the itemKind's modelClass. label=%@"), v30);

    v20 = v39;
  }
  objc_msgSend(v20, "allowedItemIdentifiers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  for (j = 0; j < objc_msgSend(v21, "count"); ++j)
  {
    for (k = 0; k < objc_msgSend(v21, "count"); ++k)
    {
      if (j != k)
      {
        objc_msgSend(v21, "objectAtIndexedSubscript:", j);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndexedSubscript:", k);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v24, "intersectsSet:", v25);

        if (v26)
        {
          v27 = os_log_create("com.apple.amp.mediaplayer", "Library");
          if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend(v39, "label");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218498;
            v48 = self;
            v49 = 2114;
            v50 = v28;
            v51 = 2114;
            v52 = v21;
            _os_log_impl(&dword_193B9B000, v27, OS_LOG_TYPE_FAULT, "MPModelLibraryRequestOperation: %p _sanityCheckRequest: allowedItemIdentifiers must contain unique array elements -- cannot contain duplicates. label=%{public}@ allowedItemIdentifiers=%{public}@", buf, 0x20u);

          }
        }
      }
    }
  }

}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (void)setRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

void __136__MPModelLibraryRequestOperation__insertPropertyCacheForEntityPID_entityClass_entityTranslator_translationContext_propertyCachesVector___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  std::__shared_weak_count *v6;
  mlcore::EntityQueryResult *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void **v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t *v23;
  unint64_t v24;
  void *__p[2];
  char v26;
  mlcore::EntityQueryResult *v27;
  std::__shared_weak_count *v28;
  _BYTE buf[24];
  _BYTE v30[20];
  _BYTE v31[20];
  __int128 v32;
  int v33;
  __int128 v34;
  __int128 v35;
  int v36;
  __int128 v37;
  __int128 v38;
  int v39;
  float v40[10];
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v7 = *(mlcore::EntityQueryResult **)a2;
  v6 = *(std::__shared_weak_count **)(a2 + 8);
  v27 = v7;
  v28 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  v10 = (_QWORD *)mlcore::EntityQueryResult::propertyCaches(v7);
  if (v10[1] == *v10)
  {
    v13 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      v14 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(v14 + 272), "label");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0CB3940];
      (*(void (**)(void **__return_ptr))(**(_QWORD **)(a1 + 56) + 56))(__p);
      if (v26 >= 0)
        v17 = __p;
      else
        v17 = (void **)__p[0];
      objc_msgSend(v16, "stringWithUTF8String:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(a1 + 64);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "legacyMediaQuery");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2114;
      *(_QWORD *)v30 = v18;
      *(_WORD *)&v30[8] = 2048;
      *(_QWORD *)&v30[10] = v19;
      *(_WORD *)&v30[18] = 2114;
      *(_QWORD *)v31 = v20;
      _os_log_impl(&dword_193B9B000, v13, OS_LOG_TYPE_FAULT, "MPModelLibraryRequestOperation: %p _insertPropertyCacheForEntityPID: no entity label=%{public}@ entityClass=%{public}@ entityPID=%lld legacyMediaQuery=%{public}@", buf, 0x34u);

      if (v26 < 0)
        operator delete(__p[0]);

    }
    *(_OWORD *)v30 = 0u;
    *(_OWORD *)&buf[8] = 0u;
    *(_DWORD *)&v30[16] = 1065353216;
    *(_OWORD *)&v31[4] = 0u;
    v32 = 0u;
    v35 = 0u;
    v34 = 0u;
    v33 = 1065353216;
    v36 = 1065353216;
    v37 = 0u;
    v38 = 0u;
    memset(v40, 0, 32);
    v39 = 1065353216;
    v40[8] = 1.0;
    *(_QWORD *)buf = MEMORY[0x1E0D4AF40] + 16;
    v41 = MEMORY[0x1E0D4AF40] + 56;
    v21 = *(_QWORD *)(a1 + 64);
    __p[0] = (void *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 56) + 112))(*(_QWORD *)(a1 + 56));
    std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<long long> *,long long>,std::__unordered_map_hasher<mlcore::ModelProperty<long long> *,std::__hash_value_type<mlcore::ModelProperty<long long> *,long long>,std::hash<mlcore::ModelProperty<long long> *>,std::equal_to<mlcore::ModelProperty<long long> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<long long> *,std::__hash_value_type<mlcore::ModelProperty<long long> *,long long>,std::equal_to<mlcore::ModelProperty<long long> *>,std::hash<mlcore::ModelProperty<long long> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<long long> *,long long>>>::__emplace_unique_key_args<mlcore::ModelProperty<long long> *,std::piecewise_construct_t const&,std::tuple<mlcore::ModelProperty<long long> * const&>,std::tuple<>>(v40, (unint64_t)__p[0], __p)[3] = v21;
    v11 = **(_QWORD **)(a1 + 48);
    v12 = *(_QWORD *)(v11 + 8);
    if (v12 >= *(_QWORD *)(v11 + 16))
    {
      v22 = std::vector<mlcore::PropertyCache>::__push_back_slow_path<mlcore::PropertyCache const&>(**(_QWORD ***)(a1 + 48));
      goto LABEL_19;
    }
    mlcore::PropertyCache::PropertyCache();
  }
  else
  {
    mlcore::EntityQueryResult::propertyCaches(v7);
    mlcore::PropertyCache::PropertyCache();
    v11 = **(_QWORD **)(a1 + 48);
    v12 = *(_QWORD *)(v11 + 8);
    if (v12 >= *(_QWORD *)(v11 + 16))
    {
      v22 = std::vector<mlcore::PropertyCache>::__push_back_slow_path<mlcore::PropertyCache const&>(**(_QWORD ***)(a1 + 48));
      goto LABEL_19;
    }
    mlcore::PropertyCache::PropertyCache();
  }
  v22 = v12 + 216;
  *(_QWORD *)(v11 + 8) = v12 + 216;
LABEL_19:
  *(_QWORD *)(v11 + 8) = v22;
  mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase(buf);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  if (v6)
  {
    v23 = (unint64_t *)&v6->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (void)_executeLegacyRequest
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  MPMediaLibraryEntityTranslationContext *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  MPMediaLibraryEntityTranslationContext *v20;
  void *v21;
  void *v22;
  _QWORD *v23;
  _QWORD *v24;
  std::__shared_weak_count *v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  std::vector<std::string> *v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  unint64_t *v33;
  unint64_t v34;
  unint64_t *v35;
  unint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  std::vector<std::string> *v41;
  std::vector<std::string>::pointer end;
  __int128 v43;
  std::vector<std::string>::pointer v44;
  unint64_t v45;
  BOOL v46;
  BOOL v47;
  unint64_t v48;
  unsigned int v49;
  unint64_t v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  std::__shared_weak_count *v54;
  unint64_t *v55;
  unint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t m;
  unint64_t *v61;
  unint64_t v62;
  std::__shared_weak_count *v63;
  unint64_t *v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t n;
  unint64_t *v69;
  unint64_t v70;
  std::__shared_weak_count *v71;
  unint64_t *v72;
  unint64_t v73;
  _QWORD *v74;
  unint64_t *v75;
  unint64_t v76;
  std::__shared_weak_count *v77;
  unint64_t *v78;
  unint64_t v79;
  std::__shared_weak_count *v80;
  unint64_t *v81;
  unint64_t v82;
  MPModelLibraryDefaultSectionedCollectionDataSource *v83;
  MPModelLibraryRequest *v84;
  unint64_t *v85;
  unint64_t v86;
  MPModelLibraryDefaultSectionedCollectionDataSource *v87;
  std::__shared_weak_count *v88;
  unint64_t *v89;
  unint64_t v90;
  MPLazySectionedCollection *v91;
  std::__shared_weak_count *v92;
  unint64_t *v93;
  unint64_t v94;
  std::__shared_weak_count *v95;
  unint64_t *v96;
  unint64_t v97;
  std::__shared_weak_count *v98;
  unint64_t *v99;
  unint64_t v100;
  std::__shared_weak_count *v101;
  unint64_t *v102;
  unint64_t v103;
  std::__shared_weak_count *v104;
  unint64_t *v105;
  unint64_t v106;
  _QWORD *v107;
  uint64_t v108;
  _QWORD *v109;
  uint64_t v110;
  void *v111;
  _QWORD *v112;
  MPModelPlaylist *v113;
  MPIdentifierSet *v114;
  void *v115;
  MPIdentifierSet *v116;
  MPModelPlaylist *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  unint64_t *p_shared_owners;
  unint64_t v125;
  uint64_t v126;
  void *v127;
  id v128;
  void *v129;
  uint64_t v130;
  void *v131;
  int v132;
  void *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t j;
  unint64_t *v137;
  unint64_t v138;
  std::__shared_weak_count *v139;
  unint64_t *v140;
  unint64_t v141;
  std::__shared_weak_count *v142;
  unint64_t *v143;
  unint64_t v144;
  std::__shared_weak_count *v145;
  unint64_t *v146;
  unint64_t v147;
  std::__shared_weak_count *v148;
  unint64_t *v149;
  unint64_t v150;
  std::__shared_weak_count *v151;
  unint64_t *v152;
  unint64_t v153;
  std::__shared_weak_count *v154;
  unint64_t *v155;
  unint64_t v156;
  uint64_t *v157;
  unint64_t *v158;
  unint64_t v159;
  std::__shared_weak_count *v160;
  unint64_t *v161;
  unint64_t v162;
  void *v163;
  uint64_t v164;
  std::__shared_weak_count *v165;
  unint64_t *v166;
  unint64_t v167;
  std::__shared_weak_count *v168;
  unint64_t *v169;
  unint64_t v170;
  std::__shared_weak_count *v171;
  unint64_t *v172;
  unint64_t v173;
  std::__shared_weak_count *v174;
  unint64_t *v175;
  unint64_t v176;
  std::__shared_weak_count *v177;
  unint64_t *v178;
  unint64_t v179;
  MPModelLibraryModelSectionedCollectionDataSource *v180;
  MPModelLibraryRequest *request;
  unint64_t *v182;
  unint64_t v183;
  MPModelLibraryModelSectionedCollectionDataSource *v184;
  std::__shared_weak_count *v185;
  unint64_t *v186;
  unint64_t v187;
  std::__shared_weak_count *v188;
  unint64_t *v189;
  unint64_t v190;
  std::__shared_weak_count *v191;
  unint64_t *v192;
  unint64_t v193;
  std::__shared_weak_count *v194;
  unint64_t *v195;
  unint64_t v196;
  MPModelLibraryResponse *v197;
  std::__shared_weak_count *v198;
  unint64_t *v199;
  unint64_t v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t *v210;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  uint64_t v218;
  uint64_t v219;
  void *v220;
  id obj;
  uint64_t v222;
  MPMediaLibraryEntityTranslationContext *v223;
  void *v224;
  void *v225;
  uint64_t v226;
  uint64_t v227;
  int v228;
  uint64_t i;
  void *__p;
  __int128 v231;
  _QWORD v232[5];
  id v233;
  MPMediaLibraryEntityTranslationContext *v234;
  uint64_t v235;
  uint64_t v236;
  std::__shared_weak_count *v237;
  _QWORD v238[5];
  id v239;
  MPMediaLibraryEntityTranslationContext *v240;
  uint64_t v241;
  uint64_t v242;
  std::__shared_weak_count *v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  _QWORD v256[5];
  std::__shared_weak_count *v257;
  _QWORD *v258;
  std::__shared_weak_count *v259;
  _QWORD *v260;
  std::__shared_weak_count *v261;
  std::__shared_weak_count *v262;
  std::__shared_weak_count *v263;
  _QWORD v264[5];
  id v265;
  MPMediaLibraryEntityTranslationContext *v266;
  uint64_t v267;
  _QWORD *v268;
  std::__shared_weak_count *v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  _QWORD v274[5];
  id v275;
  MPMediaLibraryEntityTranslationContext *v276;
  uint64_t v277;
  _QWORD *v278;
  std::__shared_weak_count *v279;
  _QWORD v280[4];
  id v281;
  void *v282;
  uint64_t v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  uint64_t v288;
  std::__shared_weak_count *v289;
  std::vector<std::string> *v290;
  std::__shared_weak_count *v291;
  uint64_t *v292;
  _QWORD *v293[2];
  __int128 __s;
  std::string::size_type v295;
  uint64_t *v296;
  std::__shared_weak_count *v297;
  _QWORD *v298;
  std::__shared_weak_count *v299;
  uint64_t v300;
  std::__shared_weak_count *v301;
  uint64_t v302;
  std::__shared_weak_count *v303;
  uint64_t *v304;
  std::__shared_weak_count *v305;
  _BYTE v306[128];
  _BYTE v307[128];
  _BYTE v308[128];
  _BYTE v309[128];
  uint64_t v310;
  MPModelPlaylist *v311;
  _BYTE v312[128];
  uint64_t v313;

  v313 = *MEMORY[0x1E0C80C00];
  -[MPModelLibraryRequest legacyMediaQuery](self->_request, "legacyMediaQuery");
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelLibraryRequestOperation request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaLibrary");
  v220 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPModelLibraryRequestOperation request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    -[MPModelLibraryRequestOperation request](self, "request");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v220, "connectionAssertionWithIdentifier:", v7);
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {

  }
  -[MPModelLibraryRequestOperation _libraryView](self, "_libraryView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v214 = v8;
  if (v8)
  {
    objc_msgSend(v8, "mlCoreView");
  }
  else
  {
    v297 = 0;
    v296 = 0;
  }
  -[MPModelLibraryRequestOperation _itemProperties](self, "_itemProperties");
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelRequest sectionKind](self->_request, "sectionKind");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "modelClass");

  -[MPModelRequest itemKind](self->_request, "itemKind");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "modelClass");

  if (v12
    && (+[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", v12), v13 = (id)objc_claimAutoreleasedReturnValue(), v13, v13))
  {
    objc_msgSend(v13, "MLCorePropertiesForPropertySet:", v215);
  }
  else
  {
    v13 = 0;
    __p = 0;
  }
  v14 = objc_msgSend(v13, "entityClass");
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelLibraryRequestOperation request](self, "request");
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v202, "label");
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelLibraryRequestOperation.mm"), 95, CFSTR("Request did not provide an entity class for %@ %@. label=%@"), v12, v13, v203);

  }
  v15 = objc_alloc_init(MPMediaLibraryEntityTranslationContext);
  -[MPMediaLibraryEntityTranslationContext setMediaLibrary:](v15, "setMediaLibrary:", v220);
  -[MPModelRequest itemKind](self->_request, "itemKind");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaLibraryEntityTranslationContext setModelKind:](v15, "setModelKind:", v16);

  if (v10)
  {
    v223 = objc_alloc_init(MPMediaLibraryEntityTranslationContext);
    -[MPMediaLibraryEntityTranslationContext setMediaLibrary:](v223, "setMediaLibrary:", v220);
    -[MPModelRequest sectionKind](self->_request, "sectionKind");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPMediaLibraryEntityTranslationContext setModelKind:](v223, "setModelKind:", v17);

    -[MPModelLibraryRequestOperation _sectionProperties](self, "_sectionProperties");
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v224 = v18;
    if (v18)
    {
      objc_msgSend(v18, "MLCorePropertiesForPropertySet:", v216);
    }
    else
    {
      __s = 0uLL;
      v295 = 0;
    }
    if (objc_msgSend(v225, "groupingType"))
    {
      objc_msgSend(v225, "collections");
      v213 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v213, "resultSet");
    }
    else
    {
      if (v10 == objc_opt_class())
      {
        v19 = (void *)objc_msgSend(v225, "copy");
        objc_msgSend(v19, "setGroupingType:", 6);
      }
      else
      {
        v19 = (void *)objc_msgSend(v225, "copy");
        objc_msgSend(v19, "setGroupingType:", objc_msgSend(v225, "_representativeCollectionGroupingType"));
      }
      objc_msgSend(v19, "collections");
      v213 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v213, "resultSet");
    }
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    v293[1] = 0;
    v293[0] = 0;
    v292 = (uint64_t *)v293;
    v107 = (_QWORD *)operator new();
    *v107 = 0;
    v107[1] = 0;
    v107[2] = 0;
    std::shared_ptr<std::vector<mlcore::PropertyCache>>::shared_ptr[abi:ne180100]<std::vector<mlcore::PropertyCache>,void>(&v290, (uint64_t)v107);
    v108 = objc_msgSend(v224, "entityClass");
    v109 = (_QWORD *)operator new();
    *v109 = 0;
    v109[1] = 0;
    v109[2] = 0;
    std::shared_ptr<std::vector<mlcore::Section>>::shared_ptr[abi:ne180100]<std::vector<mlcore::Section>,void>(&v288, (uint64_t)v109);
    v286 = 0u;
    v287 = 0u;
    v284 = 0u;
    v285 = 0u;
    obj = v213;
    v110 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v284, v312, 16);
    v218 = v108;
    if (v110)
    {
      v222 = *(_QWORD *)v285;
      v219 = *MEMORY[0x1E0D50C80];
      do
      {
        v227 = v110;
        for (i = 0; i != v227; ++i)
        {
          if (*(_QWORD *)v285 != v222)
            objc_enumerationMutation(obj);
          v111 = *(void **)(*((_QWORD *)&v284 + 1) + 8 * i);
          v283 = objc_msgSend(v111, "persistentID", v206, v207, v208, v210);
          -[MPModelLibraryRequestOperation _insertPropertyCacheForEntityPID:entityClass:entityTranslator:translationContext:propertyCachesVector:](self, "_insertPropertyCacheForEntityPID:entityClass:entityTranslator:translationContext:propertyCachesVector:", v283, v108, v224, v223, &v290);
          v112 = (_QWORD *)operator new();
          *v112 = 0;
          v112[1] = 0;
          v112[2] = 0;
          std::shared_ptr<std::vector<mlcore::PropertyCache>>::shared_ptr[abi:ne180100]<std::vector<mlcore::PropertyCache>,void>(&v298, (uint64_t)v112);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if ((objc_msgSend(v111, "playlistAttributes") & 2) != 0)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v163 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v163, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelLibraryRequestOperation.mm"), 147, CFSTR("Smart playlists cannot use _executeLegacyRequest"));

            }
            v113 = [MPModelPlaylist alloc];
            v114 = [MPIdentifierSet alloc];
            +[MPModelPlaylistKind identityKind](MPModelPlaylistKind, "identityKind");
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            v280[0] = MEMORY[0x1E0C809B0];
            v280[1] = 3221225472;
            v280[2] = __55__MPModelLibraryRequestOperation__executeLegacyRequest__block_invoke;
            v280[3] = &unk_1E3162A70;
            v281 = v220;
            v282 = v111;
            v116 = -[MPIdentifierSet initWithSource:modelKind:block:](v114, "initWithSource:modelKind:block:", CFSTR("LibraryRequestOperation"), v115, v280);
            v117 = -[MPModelObject initWithIdentifiers:](v113, "initWithIdentifiers:", v116);
            v311 = v117;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v311, 1);
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPMediaLibraryEntityTranslationContext setScopedContainers:](v15, "setScopedContainers:", v118);

            objc_msgSend(v225, "mediaLibrary");
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v119, "ml3Library");
            v120 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v225, "criteria");
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v121, "ML3ItemsQueryInLibrary:", v120);
            v122 = (void *)objc_claimAutoreleasedReturnValue();

            v310 = v219;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v310, 1);
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            v274[0] = MEMORY[0x1E0C809B0];
            v274[1] = 3321888768;
            v274[2] = __55__MPModelLibraryRequestOperation__executeLegacyRequest__block_invoke_3;
            v274[3] = &unk_1E314B040;
            v274[4] = self;
            v277 = v14;
            v275 = v13;
            v276 = v15;
            v278 = v298;
            v279 = v299;
            if (v299)
            {
              p_shared_owners = (unint64_t *)&v299->__shared_owners_;
              do
                v125 = __ldxr(p_shared_owners);
              while (__stxr(v125 + 1, p_shared_owners));
            }
            objc_msgSend(v122, "enumeratePersistentIDsAndProperties:usingBlock:", v123, v274);

            if (objc_msgSend(v122, "filtersOnDynamicProperties"))
              v126 = objc_msgSend(v120, "currentRevision");
            else
              v126 = objc_msgSend(v120, "currentContentRevision");
            v130 = v126;
            v142 = v279;
            if (v279)
            {
              v143 = (unint64_t *)&v279->__shared_owners_;
              do
                v144 = __ldaxr(v143);
              while (__stlxr(v144 - 1, v143));
              if (!v144)
              {
                ((void (*)(std::__shared_weak_count *))v142->__on_zero_shared)(v142);
                std::__shared_weak_count::__release_weak(v142);
              }
            }

            v127 = v281;
          }
          else
          {
            -[MPMediaLibraryEntityTranslationContext setScopedContainers:](v15, "setScopedContainers:", 0);
            objc_msgSend(v111, "items");
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v128 = v127;
              objc_msgSend(v128, "resultSet");
              v129 = (void *)objc_claimAutoreleasedReturnValue();
              v130 = objc_msgSend(v129, "revision");

            }
            else
            {
              v130 = 0;
            }
            objc_msgSend(v111, "itemsQuery");
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            v132 = objc_msgSend(v131, "_hasStaticEntities");

            if (v132)
            {
              v272 = 0u;
              v273 = 0u;
              v270 = 0u;
              v271 = 0u;
              objc_msgSend(v111, "items");
              v133 = (void *)objc_claimAutoreleasedReturnValue();
              v134 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v270, v309, 16);
              if (v134)
              {
                v135 = *(_QWORD *)v271;
                do
                {
                  for (j = 0; j != v134; ++j)
                  {
                    if (*(_QWORD *)v271 != v135)
                      objc_enumerationMutation(v133);
                    -[MPModelLibraryRequestOperation _insertPropertyCacheForEntityPID:entityClass:entityTranslator:translationContext:propertyCachesVector:](self, "_insertPropertyCacheForEntityPID:entityClass:entityTranslator:translationContext:propertyCachesVector:", objc_msgSend(*(id *)(*((_QWORD *)&v270 + 1) + 8 * j), "persistentID"), v14, v13, v15, &v298);
                  }
                  v134 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v270, v309, 16);
                }
                while (v134);
              }

              v108 = v218;
            }
            else
            {
              v264[0] = MEMORY[0x1E0C809B0];
              v264[1] = 3321888768;
              v264[2] = __55__MPModelLibraryRequestOperation__executeLegacyRequest__block_invoke_22;
              v264[3] = &unk_1E314B008;
              v264[4] = self;
              v267 = v14;
              v265 = v13;
              v266 = v15;
              v268 = v298;
              v269 = v299;
              if (v299)
              {
                v137 = (unint64_t *)&v299->__shared_owners_;
                do
                  v138 = __ldxr(v137);
                while (__stxr(v138 + 1, v137));
              }
              objc_msgSend(v111, "_enumerateItemPersistentIDsUsingBlock:", v264);
              v139 = v269;
              if (v269)
              {
                v140 = (unint64_t *)&v269->__shared_owners_;
                do
                  v141 = __ldaxr(v140);
                while (__stlxr(v141 - 1, v140));
                if (!v141)
                {
                  ((void (*)(std::__shared_weak_count *))v139->__on_zero_shared)(v139);
                  std::__shared_weak_count::__release_weak(v139);
                }
              }

            }
          }

          v145 = (std::__shared_weak_count *)operator new(0x128uLL);
          v145->__shared_owners_ = 0;
          v145->__shared_weak_owners_ = 0;
          v145->__vftable = (std::__shared_weak_count_vtbl *)&off_1E314A8A8;
          v304 = v296;
          v305 = v297;
          if (v297)
          {
            v146 = (unint64_t *)&v297->__shared_owners_;
            do
              v147 = __ldxr(v146);
            while (__stxr(v147 + 1, v146));
          }
          v303 = 0;
          v302 = 0;
          v301 = 0;
          v300 = 0;
          v206 = 0;
          v207 = 0;
          v208 = v130;
          v210 = &v300;
          mlcore::EntityQueryResult::EntityQueryResult();
          v148 = v301;
          if (v301)
          {
            v149 = (unint64_t *)&v301->__shared_owners_;
            do
              v150 = __ldaxr(v149);
            while (__stlxr(v150 - 1, v149));
            if (!v150)
            {
              ((void (*)(std::__shared_weak_count *))v148->__on_zero_shared)(v148);
              std::__shared_weak_count::__release_weak(v148);
            }
          }
          v151 = v303;
          if (v303)
          {
            v152 = (unint64_t *)&v303->__shared_owners_;
            do
              v153 = __ldaxr(v152);
            while (__stlxr(v153 - 1, v152));
            if (!v153)
            {
              ((void (*)(std::__shared_weak_count *))v151->__on_zero_shared)(v151);
              std::__shared_weak_count::__release_weak(v151);
            }
          }
          v154 = v305;
          if (v305)
          {
            v155 = (unint64_t *)&v305->__shared_owners_;
            do
              v156 = __ldaxr(v155);
            while (__stlxr(v156 - 1, v155));
            if (!v156)
            {
              ((void (*)(std::__shared_weak_count *))v154->__on_zero_shared)(v154);
              std::__shared_weak_count::__release_weak(v154);
            }
          }
          v262 = v145 + 1;
          v263 = v145;
          v157 = std::__tree<std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>,std::__map_value_compare<long long,std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>,std::less<long long>,true>,std::allocator<std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>(&v292, v283, &v283);
          std::shared_ptr<mlcore::QueryResult>::operator=[abi:ne180100](v157 + 5, (uint64_t)&v145[1], (uint64_t)v145);
          if (v145)
          {
            v158 = (unint64_t *)&v263->__shared_owners_;
            do
              v159 = __ldaxr(v158);
            while (__stlxr(v159 - 1, v158));
            if (!v159)
            {
              ((void (*)(std::__shared_weak_count *))v145->__on_zero_shared)(v145);
              std::__shared_weak_count::__release_weak(v145);
            }
          }
          v160 = v299;
          if (v299)
          {
            v161 = (unint64_t *)&v299->__shared_owners_;
            do
              v162 = __ldaxr(v161);
            while (__stlxr(v162 - 1, v161));
            if (!v162)
            {
              ((void (*)(std::__shared_weak_count *))v160->__on_zero_shared)(v160);
              std::__shared_weak_count::__release_weak(v160);
            }
          }
        }
        v110 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v284, v312, 16, 0, 0, v130, &v300);
      }
      while (v110);
    }

    v164 = objc_msgSend(v212, "revision");
    v165 = (std::__shared_weak_count *)operator new(0x128uLL);
    v165->__shared_owners_ = 0;
    v165->__shared_weak_owners_ = 0;
    v165->__vftable = (std::__shared_weak_count_vtbl *)&off_1E314A8A8;
    v304 = v296;
    v305 = v297;
    if (v297)
    {
      v166 = (unint64_t *)&v297->__shared_owners_;
      do
        v167 = __ldxr(v166);
      while (__stxr(v167 + 1, v166));
    }
    v303 = 0;
    v302 = 0;
    v301 = 0;
    v300 = 0;
    v299 = 0;
    v298 = 0;
    v209 = v164;
    mlcore::EntityQueryResult::EntityQueryResult();
    v168 = v299;
    if (v299)
    {
      v169 = (unint64_t *)&v299->__shared_owners_;
      do
        v170 = __ldaxr(v169);
      while (__stlxr(v170 - 1, v169));
      if (!v170)
      {
        ((void (*)(std::__shared_weak_count *))v168->__on_zero_shared)(v168);
        std::__shared_weak_count::__release_weak(v168);
      }
    }
    v171 = v301;
    if (v301)
    {
      v172 = (unint64_t *)&v301->__shared_owners_;
      do
        v173 = __ldaxr(v172);
      while (__stlxr(v173 - 1, v172));
      if (!v173)
      {
        ((void (*)(std::__shared_weak_count *))v171->__on_zero_shared)(v171);
        std::__shared_weak_count::__release_weak(v171);
      }
    }
    v174 = v303;
    if (v303)
    {
      v175 = (unint64_t *)&v303->__shared_owners_;
      do
        v176 = __ldaxr(v175);
      while (__stlxr(v176 - 1, v175));
      if (!v176)
      {
        ((void (*)(std::__shared_weak_count *))v174->__on_zero_shared)(v174);
        std::__shared_weak_count::__release_weak(v174);
      }
    }
    v177 = v305;
    if (v305)
    {
      v178 = (unint64_t *)&v305->__shared_owners_;
      do
        v179 = __ldaxr(v178);
      while (__stlxr(v179 - 1, v178));
      if (!v179)
      {
        ((void (*)(std::__shared_weak_count *))v177->__on_zero_shared)(v177);
        std::__shared_weak_count::__release_weak(v177);
      }
    }
    v262 = v165 + 1;
    v263 = v165;
    v180 = [MPModelLibraryModelSectionedCollectionDataSource alloc];
    request = self->_request;
    v260 = &v165[1].__vftable;
    v261 = v165;
    if (v165)
    {
      v182 = (unint64_t *)&v263->__shared_owners_;
      do
        v183 = __ldxr(v182);
      while (__stxr(v183 + 1, v182));
    }
    v184 = -[MPModelLibraryModelSectionedCollectionDataSource initWithRequest:sectionQueryResults:itemQueryResults:](v180, "initWithRequest:sectionQueryResults:itemQueryResults:", request, &v260, &v292, 0, 0, v209, &v298);
    v185 = v261;
    if (v261)
    {
      v186 = (unint64_t *)&v261->__shared_owners_;
      do
        v187 = __ldaxr(v186);
      while (__stlxr(v187 - 1, v186));
      if (!v187)
      {
        ((void (*)(std::__shared_weak_count *))v185->__on_zero_shared)(v185);
        std::__shared_weak_count::__release_weak(v185);
      }
    }
    v91 = -[MPLazySectionedCollection initWithDataSource:]([MPLazySectionedCollection alloc], "initWithDataSource:", v184);

    v188 = v263;
    if (v263)
    {
      v189 = (unint64_t *)&v263->__shared_owners_;
      do
        v190 = __ldaxr(v189);
      while (__stlxr(v190 - 1, v189));
      if (!v190)
      {
        ((void (*)(std::__shared_weak_count *))v188->__on_zero_shared)(v188);
        std::__shared_weak_count::__release_weak(v188);
      }
    }
    v191 = v289;
    if (v289)
    {
      v192 = (unint64_t *)&v289->__shared_owners_;
      do
        v193 = __ldaxr(v192);
      while (__stlxr(v193 - 1, v192));
      if (!v193)
      {
        ((void (*)(std::__shared_weak_count *))v191->__on_zero_shared)(v191);
        std::__shared_weak_count::__release_weak(v191);
      }
    }
    v194 = v291;
    if (v291)
    {
      v195 = (unint64_t *)&v291->__shared_owners_;
      do
        v196 = __ldaxr(v195);
      while (__stlxr(v196 - 1, v195));
      if (!v196)
      {
        ((void (*)(std::__shared_weak_count *))v194->__on_zero_shared)(v194);
        std::__shared_weak_count::__release_weak(v194);
      }
    }
    std::__tree<std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>,std::__map_value_compare<long long,std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>,std::less<long long>,true>,std::allocator<std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>>>::destroy(v293[0]);

    if ((_QWORD)__s)
    {
      *((_QWORD *)&__s + 1) = __s;
      operator delete((void *)__s);
    }
  }
  else
  {
    v228 = objc_msgSend(v12, "isSubclassOfClass:", objc_opt_class());
    if (v228)
      objc_msgSend(v225, "items");
    else
      objc_msgSend(v225, "collections");
    v223 = (MPMediaLibraryEntityTranslationContext *)(id)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = v223;
      -[MPMediaLibraryEntityTranslationContext resultSet](v20, "resultSet");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v226 = objc_msgSend(v21, "revision");
      -[MPMediaLibraryEntityTranslationContext sectionInfo](v20, "sectionInfo");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v226 = 0;
      v22 = 0;
    }
    objc_msgSend(v22, "sections");
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    v216 = v22;
    v23 = (_QWORD *)operator new();
    *v23 = 0;
    v23[1] = 0;
    v23[2] = 0;
    std::shared_ptr<std::vector<mlcore::PropertyCache>>::shared_ptr[abi:ne180100]<std::vector<mlcore::PropertyCache>,void>(&v302, (uint64_t)v23);
    v24 = (_QWORD *)operator new();
    *v24 = 0;
    v24[1] = 0;
    v24[2] = 0;
    std::shared_ptr<std::vector<mlcore::Section>>::shared_ptr[abi:ne180100]<std::vector<mlcore::Section>,void>(&v300, (uint64_t)v24);
    v299 = 0;
    v298 = 0;
    v291 = 0;
    v290 = 0;
    if (objc_msgSend(v224, "count"))
    {
      v25 = (std::__shared_weak_count *)operator new(0x30uLL);
      v25->__shared_owners_ = 0;
      v25->__shared_weak_owners_ = 0;
      v25->__vftable = (std::__shared_weak_count_vtbl *)&off_1E314AC60;
      v25[1].__shared_owners_ = 0;
      v25[1].__shared_weak_owners_ = 0;
      v25[1].__vftable = 0;
      v26 = v299;
      v298 = &v25[1].__vftable;
      v299 = v25;
      if (v26)
      {
        v27 = (unint64_t *)&v26->__shared_owners_;
        do
          v28 = __ldaxr(v27);
        while (__stlxr(v28 - 1, v27));
        if (!v28)
        {
          ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
          std::__shared_weak_count::__release_weak(v26);
        }
      }
      v29 = (std::vector<std::string> *)operator new(0x30uLL);
      v29->__end_ = 0;
      v29->__end_cap_.__value_ = 0;
      v29->__begin_ = (std::vector<std::string>::pointer)&off_1E314AC60;
      v29[1].__end_ = 0;
      v29[1].__end_cap_.__value_ = 0;
      v29[1].__begin_ = 0;
      v30 = v291;
      v290 = v29 + 1;
      v291 = (std::__shared_weak_count *)v29;
      if (v30)
      {
        v31 = (unint64_t *)&v30->__shared_owners_;
        do
          v32 = __ldaxr(v31);
        while (__stlxr(v32 - 1, v31));
        if (!v32)
        {
          ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
          std::__shared_weak_count::__release_weak(v30);
        }
      }
      v256[0] = MEMORY[0x1E0C809B0];
      v256[1] = 3321888768;
      v256[2] = __55__MPModelLibraryRequestOperation__executeLegacyRequest__block_invoke_27;
      v256[3] = &__block_descriptor_64_ea8_32c75_ZTSNSt3__110shared_ptrINS_6vectorIN6mlcore7SectionENS_9allocatorIS3_EEEEEE48c107_ZTSNSt3__110shared_ptrINS_6vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS5_IS7_EEEEEE_e36_v32__0__MPMediaQuerySection_8Q16_B24l;
      v256[4] = v300;
      v257 = v301;
      if (v301)
      {
        v33 = (unint64_t *)&v301->__shared_owners_;
        do
          v34 = __ldxr(v33);
        while (__stxr(v34 + 1, v33));
      }
      v258 = v298;
      v259 = v299;
      if (v299)
      {
        v35 = (unint64_t *)&v299->__shared_owners_;
        do
          v36 = __ldxr(v35);
        while (__stxr(v36 + 1, v35));
      }
      objc_msgSend(v224, "enumerateObjectsUsingBlock:", v256);
      v254 = 0u;
      v255 = 0u;
      v252 = 0u;
      v253 = 0u;
      objc_msgSend(v22, "sectionIndexTitles");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v252, v308, 16);
      if (v38)
      {
        v39 = *(_QWORD *)v253;
        do
        {
          for (k = 0; k != v38; ++k)
          {
            if (*(_QWORD *)v253 != v39)
              objc_enumerationMutation(v37);
            std::string::basic_string[abi:ne180100]<0>(&__s, (char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v252 + 1) + 8 * k)), "UTF8String"));
            v41 = v290;
            end = v290->__end_;
            if (end >= v290->__end_cap_.__value_)
            {
              v44 = std::vector<std::string>::__push_back_slow_path<std::string const&>(v290, &__s);
            }
            else
            {
              if (SHIBYTE(v295) < 0)
              {
                std::string::__init_copy_ctor_external(v290->__end_, (const std::string::value_type *)__s, *((std::string::size_type *)&__s + 1));
              }
              else
              {
                v43 = __s;
                end->__r_.__value_.__r.__words[2] = v295;
                *(_OWORD *)&end->__r_.__value_.__l.__data_ = v43;
              }
              v44 = end + 1;
              v41->__end_ = end + 1;
            }
            v41->__end_ = v44;
            if (SHIBYTE(v295) < 0)
              operator delete((void *)__s);
          }
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v252, v308, 16);
        }
        while (v38);
      }

      v45 = 0xAAAAAAAAAAAAAAABLL * (((char *)v290->__end_ - (char *)v290->__begin_) >> 3);
      v46 = v45 >= 2;
      v47 = v45 > 2;
      v48 = v45 - 2;
      v49 = v47;
      if (v46)
        v50 = v48;
      else
        v50 = 0;
      v51 = v259;
      if (v259)
      {
        v52 = (unint64_t *)&v259->__shared_owners_;
        do
          v53 = __ldaxr(v52);
        while (__stlxr(v53 - 1, v52));
        if (!v53)
        {
          ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
          std::__shared_weak_count::__release_weak(v51);
        }
      }
      v54 = v257;
      if (v257)
      {
        v55 = (unint64_t *)&v257->__shared_owners_;
        do
          v56 = __ldaxr(v55);
        while (__stlxr(v56 - 1, v55));
        if (!v56)
        {
          ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
          std::__shared_weak_count::__release_weak(v54);
        }
      }
    }
    else
    {
      v49 = 0;
      v50 = 0;
    }
    if (objc_msgSend(v225, "_hasStaticEntities"))
    {
      if (v228)
      {
        v250 = 0u;
        v251 = 0u;
        v248 = 0u;
        v249 = 0u;
        objc_msgSend(v225, "items");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v248, v307, 16);
        if (v58)
        {
          v59 = *(_QWORD *)v249;
          do
          {
            for (m = 0; m != v58; ++m)
            {
              if (*(_QWORD *)v249 != v59)
                objc_enumerationMutation(v57);
              -[MPModelLibraryRequestOperation _insertPropertyCacheForEntityPID:entityClass:entityTranslator:translationContext:propertyCachesVector:](self, "_insertPropertyCacheForEntityPID:entityClass:entityTranslator:translationContext:propertyCachesVector:", objc_msgSend(*(id *)(*((_QWORD *)&v248 + 1) + 8 * m), "persistentID"), v14, v13, v15, &v302);
            }
            v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v248, v307, 16);
          }
          while (v58);
        }
      }
      else
      {
        v246 = 0u;
        v247 = 0u;
        v244 = 0u;
        v245 = 0u;
        objc_msgSend(v225, "collections");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v244, v306, 16);
        if (v66)
        {
          v67 = *(_QWORD *)v245;
          do
          {
            for (n = 0; n != v66; ++n)
            {
              if (*(_QWORD *)v245 != v67)
                objc_enumerationMutation(v57);
              -[MPModelLibraryRequestOperation _insertPropertyCacheForEntityPID:entityClass:entityTranslator:translationContext:propertyCachesVector:](self, "_insertPropertyCacheForEntityPID:entityClass:entityTranslator:translationContext:propertyCachesVector:", objc_msgSend(*(id *)(*((_QWORD *)&v244 + 1) + 8 * n), "persistentID"), v14, v13, v15, &v302);
            }
            v66 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v244, v306, 16);
          }
          while (v66);
        }
      }

    }
    else if (v228)
    {
      v238[0] = MEMORY[0x1E0C809B0];
      v238[1] = 3321888768;
      v238[2] = __55__MPModelLibraryRequestOperation__executeLegacyRequest__block_invoke_29;
      v238[3] = &unk_1E314B008;
      v238[4] = self;
      v241 = v14;
      v239 = v13;
      v240 = v15;
      v242 = v302;
      v243 = v303;
      if (v303)
      {
        v61 = (unint64_t *)&v303->__shared_owners_;
        do
          v62 = __ldxr(v61);
        while (__stxr(v62 + 1, v61));
      }
      objc_msgSend(v225, "_enumerateItemPersistentIDsUsingBlock:", v238);
      v63 = v243;
      if (v243)
      {
        v64 = (unint64_t *)&v243->__shared_owners_;
        do
          v65 = __ldaxr(v64);
        while (__stlxr(v65 - 1, v64));
        if (!v65)
        {
          ((void (*)(std::__shared_weak_count *))v63->__on_zero_shared)(v63);
          std::__shared_weak_count::__release_weak(v63);
        }
      }

    }
    else
    {
      v232[0] = MEMORY[0x1E0C809B0];
      v232[1] = 3321888768;
      v232[2] = __55__MPModelLibraryRequestOperation__executeLegacyRequest__block_invoke_2_30;
      v232[3] = &unk_1E314B008;
      v232[4] = self;
      v235 = v14;
      v233 = v13;
      v234 = v15;
      v236 = v302;
      v237 = v303;
      if (v303)
      {
        v69 = (unint64_t *)&v303->__shared_owners_;
        do
          v70 = __ldxr(v69);
        while (__stxr(v70 + 1, v69));
      }
      objc_msgSend(v225, "_enumerateCollectionPersistentIDsUsingBlock:", v232);
      v71 = v237;
      if (v237)
      {
        v72 = (unint64_t *)&v237->__shared_owners_;
        do
          v73 = __ldaxr(v72);
        while (__stlxr(v73 - 1, v72));
        if (!v73)
        {
          ((void (*)(std::__shared_weak_count *))v71->__on_zero_shared)(v71);
          std::__shared_weak_count::__release_weak(v71);
        }
      }

    }
    v74 = operator new(0x128uLL);
    v74[1] = 0;
    v74[2] = 0;
    *v74 = &off_1E314A8A8;
    v292 = v296;
    v293[0] = &v297->__vftable;
    if (v297)
    {
      v75 = (unint64_t *)&v297->__shared_owners_;
      do
        v76 = __ldxr(v75);
      while (__stxr(v76 + 1, v75));
    }
    v305 = 0;
    v304 = 0;
    mlcore::EntityQueryResult::EntityQueryResult();
    v77 = v305;
    if (v305)
    {
      v78 = (unint64_t *)&v305->__shared_owners_;
      do
        v79 = __ldaxr(v78);
      while (__stlxr(v79 - 1, v78));
      if (!v79)
      {
        ((void (*)(std::__shared_weak_count *))v77->__on_zero_shared)(v77);
        std::__shared_weak_count::__release_weak(v77);
      }
    }
    v80 = (std::__shared_weak_count *)v293[0];
    if (v293[0])
    {
      v81 = v293[0] + 1;
      do
        v82 = __ldaxr(v81);
      while (__stlxr(v82 - 1, v81));
      if (!v82)
      {
        ((void (*)(std::__shared_weak_count *))v80->__on_zero_shared)(v80);
        std::__shared_weak_count::__release_weak(v80);
      }
    }
    *(_QWORD *)&__s = v74 + 3;
    *((_QWORD *)&__s + 1) = v74;
    v83 = [MPModelLibraryDefaultSectionedCollectionDataSource alloc];
    v84 = self->_request;
    v231 = __s;
    if (*((_QWORD *)&__s + 1))
    {
      v85 = (unint64_t *)(*((_QWORD *)&__s + 1) + 8);
      do
        v86 = __ldxr(v85);
      while (__stxr(v86 + 1, v85));
    }
    v87 = -[MPModelLibraryDefaultSectionedCollectionDataSource initWithRequest:itemQueryResults:](v83, "initWithRequest:itemQueryResults:", v84, &v231, v49, v50, v226, &v304);
    v88 = (std::__shared_weak_count *)*((_QWORD *)&v231 + 1);
    if (*((_QWORD *)&v231 + 1))
    {
      v89 = (unint64_t *)(*((_QWORD *)&v231 + 1) + 8);
      do
        v90 = __ldaxr(v89);
      while (__stlxr(v90 - 1, v89));
      if (!v90)
      {
        ((void (*)(std::__shared_weak_count *))v88->__on_zero_shared)(v88);
        std::__shared_weak_count::__release_weak(v88);
      }
    }
    v91 = -[MPLazySectionedCollection initWithDataSource:]([MPLazySectionedCollection alloc], "initWithDataSource:", v87);

    v92 = (std::__shared_weak_count *)*((_QWORD *)&__s + 1);
    if (*((_QWORD *)&__s + 1))
    {
      v93 = (unint64_t *)(*((_QWORD *)&__s + 1) + 8);
      do
        v94 = __ldaxr(v93);
      while (__stlxr(v94 - 1, v93));
      if (!v94)
      {
        ((void (*)(std::__shared_weak_count *))v92->__on_zero_shared)(v92);
        std::__shared_weak_count::__release_weak(v92);
      }
    }
    v95 = v291;
    if (v291)
    {
      v96 = (unint64_t *)&v291->__shared_owners_;
      do
        v97 = __ldaxr(v96);
      while (__stlxr(v97 - 1, v96));
      if (!v97)
      {
        ((void (*)(std::__shared_weak_count *))v95->__on_zero_shared)(v95);
        std::__shared_weak_count::__release_weak(v95);
      }
    }
    v98 = v299;
    if (v299)
    {
      v99 = (unint64_t *)&v299->__shared_owners_;
      do
        v100 = __ldaxr(v99);
      while (__stlxr(v100 - 1, v99));
      if (!v100)
      {
        ((void (*)(std::__shared_weak_count *))v98->__on_zero_shared)(v98);
        std::__shared_weak_count::__release_weak(v98);
      }
    }
    v101 = v301;
    if (v301)
    {
      v102 = (unint64_t *)&v301->__shared_owners_;
      do
        v103 = __ldaxr(v102);
      while (__stlxr(v103 - 1, v102));
      if (!v103)
      {
        ((void (*)(std::__shared_weak_count *))v101->__on_zero_shared)(v101);
        std::__shared_weak_count::__release_weak(v101);
      }
    }
    v104 = v303;
    if (v303)
    {
      v105 = (unint64_t *)&v303->__shared_owners_;
      do
        v106 = __ldaxr(v105);
      while (__stlxr(v106 - 1, v105));
      if (!v106)
      {
        ((void (*)(std::__shared_weak_count *))v104->__on_zero_shared)(v104);
        std::__shared_weak_count::__release_weak(v104);
      }
    }
  }

  v197 = -[MPModelLibraryResponse initWithRequest:]([MPModelLibraryResponse alloc], "initWithRequest:", self->_request);
  -[MPModelLibraryResponse setLibraryAssertion:](v197, "setLibraryAssertion:", v217);
  if (!v91)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MPModelLibraryRequestOperation _executeLegacyRequest]");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v204, "handleFailureInFunction:file:lineNumber:description:", v205, CFSTR("MPModelLibraryRequestOperation.mm"), 271, CFSTR("Results should not be nil!"));

  }
  -[MPModelResponse setResults:](v197, "setResults:", v91);
  (*((void (**)(void))self->_responseHandler + 2))();
  -[MPAsyncOperation finish](self, "finish");

  if (__p)
    operator delete(__p);

  v198 = v297;
  if (v297)
  {
    v199 = (unint64_t *)&v297->__shared_owners_;
    do
      v200 = __ldaxr(v199);
    while (__stlxr(v200 - 1, v199));
    if (!v200)
    {
      ((void (*)(std::__shared_weak_count *))v198->__on_zero_shared)(v198);
      std::__shared_weak_count::__release_weak(v198);
    }
  }

}

- (id)_itemProperties
{
  return -[MPModelRequest itemProperties](self->_request, "itemProperties");
}

- (id)_sectionProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[MPModelRequest sectionProperties](self->_request, "sectionProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MPModelLibraryRequest wantsDetailedKeepLocalRequestableResponse](self->_request, "wantsDetailedKeepLocalRequestableResponse"))
  {
    -[MPModelRequest sectionKind](self->_request, "sectionKind");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "modelClass");

    if (objc_msgSend(v5, "supportsKeepLocalStatusObservation"))
    {
      objc_msgSend(v5, "requiredKeepLocalStatusObservationProperties");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "propertySetByCombiningWithPropertySet:", v3);
      v7 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v7;
    }
  }
  return v3;
}

- (id)responseHandler
{
  return self->_responseHandler;
}

void __52__MPModelLibraryRequestOperation__executeNewRequest__block_invoke(uint64_t a1)
{
  uint64_t v2;
  mlcore *v3;
  ModelPropertyBase *IsLimited;
  _BOOL4 v5;
  unint64_t *v6;
  unint64_t v7;
  MPIdentifierSet *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  mlcore::Query *v14;
  void *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  id v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  mlcore::EntityQueryResult *v28;
  uint64_t v29;
  unint64_t *v30;
  unint64_t v31;
  uint64_t *v32;
  MPModelLibraryResponseKeepLocalStatusConfiguration *v33;
  mlcore::Query *v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  unint64_t v38;
  void *v39;
  id v40;
  uint64_t v41;
  mlcore *v42;
  _OWORD *v43;
  char v44;
  uint64_t v45;
  char v46;
  __int128 v47;
  unint64_t *v48;
  unint64_t v49;
  std::__shared_weak_count *v50;
  unint64_t *v51;
  unint64_t v52;
  uint64_t i;
  std::__shared_weak_count *v54;
  unint64_t *v55;
  unint64_t v56;
  unint64_t *v57;
  unint64_t v58;
  std::__shared_weak_count *v59;
  unint64_t *v60;
  unint64_t v61;
  std::__shared_weak_count *v62;
  unint64_t *v63;
  unint64_t v64;
  _BOOL4 v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  unint64_t *v71;
  unint64_t v72;
  id v73;
  std::__shared_weak_count *v74;
  unint64_t *v75;
  unint64_t v76;
  std::__shared_weak_count *v77;
  unint64_t *v78;
  unint64_t v79;
  std::__shared_weak_count *v80;
  unint64_t *v81;
  unint64_t v82;
  std::__shared_weak_count *v83;
  unint64_t *v84;
  unint64_t v85;
  mlcore::EntityQueryResult *v86;
  unint64_t *v87;
  unint64_t v88;
  uint64_t *v89;
  uint64_t *v90;
  _QWORD *v91;
  mlcore *v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  unint64_t v96;
  mlcore *v97;
  uint64_t v98;
  unint64_t v99;
  _QWORD *v100;
  unint64_t v101;
  __int128 **v102;
  char *v103;
  __int128 *v104;
  __int128 *v105;
  unint64_t v106;
  char *v107;
  uint64_t v108;
  char *v109;
  __int128 v110;
  char *v111;
  __int128 v112;
  mlcore::EntityQueryResult *v113;
  char *v114;
  std::__shared_weak_count *v115;
  unint64_t *v116;
  unint64_t v117;
  std::__shared_weak_count *v118;
  unint64_t *v119;
  unint64_t v120;
  __int128 v121;
  std::__shared_weak_count *v122;
  unint64_t *v123;
  unint64_t v124;
  std::__shared_weak_count *v125;
  unint64_t *v126;
  unint64_t v127;
  std::__shared_weak_count *v128;
  unint64_t *v129;
  unint64_t v130;
  uint64_t *v131;
  std::__shared_weak_count *v132;
  unint64_t *v133;
  unint64_t v134;
  std::__shared_weak_count *v135;
  unint64_t *v136;
  unint64_t v137;
  std::__shared_weak_count *v138;
  unint64_t *v139;
  unint64_t v140;
  void *v141;
  void *v142;
  mlcore::EntityQueryResult *v143;
  void *v144;
  void *v145;
  void *v146;
  MPIdentifierSet *v147;
  void *v148;
  void *context;
  __int128 v150;
  __int128 v151;
  char *v152;
  std::__shared_weak_count *v153;
  _QWORD *v154;
  std::__shared_weak_count *v155;
  id v156;
  mlcore::EntityQuery *v157;
  std::__shared_weak_count *v158;
  mlcore::EntityQuery *v159;
  std::__shared_weak_count *v160;
  __int128 v161;
  _OWORD *v162;
  _OWORD *v163;
  _OWORD *v164;
  __int128 v165;
  mlcore::EntityQuery *v166;
  std::__shared_weak_count *v167;
  _QWORD v168[4];
  id v169;
  id v170;
  id v171;
  id v172;
  id v173;
  mlcore::EntityQueryResult *v174[2];
  id v175;
  mlcore::Query *v176;
  std::__shared_weak_count *v177;
  mlcore::EntityQueryResult *v178;
  mlcore::EntityQueryResult *v179;
  mlcore::Query *v180;
  std::__shared_weak_count *v181;
  _QWORD v182[4];
  id v183;
  uint64_t v184;
  uint64_t v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  uint64_t v189;

  v189 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x19403A624]();
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 48));
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 48));
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) != 0 || v2)
    goto LABEL_38;
  if (*(_BYTE *)(a1 + 152))
  {
    v3 = (mlcore *)mlcore::EntityQueryResult::entityAtIndex(*(mlcore::EntityQueryResult **)(a1 + 120));
    IsLimited = (ModelPropertyBase *)mlcore::PlaylistPropertySmartIsLimited(v3);
    v5 = mlcore::Entity::valueForProperty<int>(v187, IsLimited) != 0;
    if (*((_QWORD *)&v187 + 1))
    {
      v6 = (unint64_t *)(*((_QWORD *)&v187 + 1) + 8);
      do
        v7 = __ldaxr(v6);
      while (__stlxr(v7 - 1, v6));
      if (!v7)
      {
        (*(void (**)(_QWORD))(**((_QWORD **)&v187 + 1) + 16))(*((_QWORD *)&v187 + 1));
        std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v187 + 1));
      }
    }
  }
  else
  {
    v5 = 0;
  }
  v145 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  v185 = mlcore::EntityQueryResult::persistentIDAtIndex(*(mlcore::EntityQueryResult **)(a1 + 120));
  v8 = [MPIdentifierSet alloc];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "sectionKind");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v182[0] = MEMORY[0x1E0C809B0];
  v182[1] = 3221225472;
  v182[2] = __52__MPModelLibraryRequestOperation__executeNewRequest__block_invoke_2;
  v182[3] = &unk_1E315F6D0;
  v183 = *(id *)(a1 + 48);
  v184 = v185;
  v147 = -[MPIdentifierSet initWithSource:modelKind:block:](v8, "initWithSource:modelKind:block:", CFSTR("LibraryRequestOperation"), v9, v182);

  v11 = v145;
  v144 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 136)), "initWithIdentifiers:block:", v147, &__block_literal_global_2453);
  objc_msgSend(*(id *)(a1 + 56), "arrayByAddingObject:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "setScopedContainers:", v12);

  v148 = (void *)objc_msgSend(*(id *)(a1 + 64), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "itemSortDescriptors");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(void **)(a1 + 72);
  if (v13)
  {
    objc_msgSend(v13, "entityQueryForPropertySet:sortDescriptors:context:view:", *(_QWORD *)(a1 + 80), v146, v145, v148);
    v14 = v180;
    if (v180)
      goto LABEL_15;
  }
  else
  {
    v180 = 0;
    v181 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 144), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272));

  v14 = v180;
LABEL_15:
  v176 = v14;
  v177 = v181;
  if (v181)
  {
    p_shared_owners = (unint64_t *)&v181->__shared_owners_;
    do
      v17 = __ldxr(p_shared_owners);
    while (__stxr(v17 + 1, p_shared_owners));
  }
  v175 = 0;
  if (v148)
  {
    objc_msgSend(v148, "resultsForCoreQuery:error:", &v176, &v175);
    v18 = v175;
  }
  else
  {
    v18 = 0;
    v178 = 0;
    v179 = 0;
  }
  v19 = v177;
  if (v177)
  {
    v20 = (unint64_t *)&v177->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
      if (v18)
        goto LABEL_26;
LABEL_40:
      v28 = v178;
      if (!v178)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v141, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 144), *(_QWORD *)(a1 + 32), CFSTR("MPModelLibraryRequestOperation.mm"), 466, CFSTR("item query did not produce error or result"));

        v11 = v145;
        v28 = v178;
      }
      v29 = (uint64_t)v179;
      v174[0] = v28;
      v174[1] = v179;
      if (v179)
      {
        v30 = (unint64_t *)((char *)v179 + 8);
        do
          v31 = __ldxr(v30);
        while (__stxr(v31 + 1, v30));
      }
      os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 48));
      v32 = std::__tree<std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>,std::__map_value_compare<long long,std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>,std::less<long long>,true>,std::allocator<std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>((uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 48), v185, &v185);
      std::shared_ptr<mlcore::QueryResult>::operator=[abi:ne180100](v32 + 5, (uint64_t)v28, v29);
      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 48));
      if (*(_BYTE *)(a1 + 153)
        && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "wantsDetailedKeepLocalRequestableResponse"))
      {
        v33 = objc_alloc_init(MPModelLibraryResponseKeepLocalStatusConfiguration);
        v34 = v180;
        if (v180 && __dynamic_cast(v180, MEMORY[0x1E0D4AF00], MEMORY[0x1E0D4AF18], 0))
        {
          v35 = v181;
          if (v181)
          {
            v36 = (unint64_t *)&v181->__shared_owners_;
            do
              v37 = __ldxr(v36);
            while (__stxr(v37 + 1, v36));
            do
              v38 = __ldaxr(v36);
            while (__stlxr(v38 - 1, v36));
            if (!v38)
            {
              ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
              std::__shared_weak_count::__release_weak(v35);
            }
          }
          v39 = (void *)objc_msgSend(*(id *)(a1 + 64), "copy");
          v168[0] = v10;
          v168[1] = 3221225472;
          v168[2] = __52__MPModelLibraryRequestOperation__executeNewRequest__block_invoke_5;
          v168[3] = &unk_1E31539A8;
          v169 = *(id *)(a1 + 72);
          v170 = *(id *)(a1 + 80);
          v171 = v146;
          v172 = v11;
          v40 = v39;
          v173 = v40;
          -[MPModelLibraryResponseKeepLocalStatusConfiguration setDownloadablePlaylistItemEntityQueryBlock:](v33, "setDownloadablePlaylistItemEntityQueryBlock:", v168);

        }
        else
        {
          v41 = mlcore::Query::entityClass(v34);
          v42 = (mlcore *)mlcore::Query::predicate(v180);
          mlcore::ItemPropertyIsStoreRedownloadable(v42);
          std::allocate_shared[abi:ne180100]<mlcore::UnaryPredicate<int>,std::allocator<mlcore::UnaryPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::UnaryOperator,void>((uint64_t *)&v161);
          v188 = v161;
          v161 = 0uLL;
          v163 = 0;
          v164 = 0;
          v162 = 0;
          *(_QWORD *)&v186 = &v162;
          BYTE8(v186) = 0;
          v43 = operator new(0x20uLL);
          v44 = 0;
          v45 = 0;
          v162 = v43;
          v163 = v43;
          v164 = v43 + 2;
          do
          {
            v46 = v44;
            v47 = *(&v187 + v45);
            *v43 = v47;
            if (*((_QWORD *)&v47 + 1))
            {
              v48 = (unint64_t *)(*((_QWORD *)&v47 + 1) + 8);
              do
                v49 = __ldxr(v48);
              while (__stxr(v49 + 1, v48));
            }
            ++v43;
            v44 = 1;
            v45 = 1;
          }
          while ((v46 & 1) == 0);
          v163 = v43;
          mlcore::CreateAndPredicate();
          std::allocate_shared[abi:ne180100]<mlcore::EntityQuery,std::allocator<mlcore::EntityQuery>,mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate>,void>(&v166, v41, &v165);
          v50 = (std::__shared_weak_count *)*((_QWORD *)&v165 + 1);
          if (*((_QWORD *)&v165 + 1))
          {
            v51 = (unint64_t *)(*((_QWORD *)&v165 + 1) + 8);
            do
              v52 = __ldaxr(v51);
            while (__stlxr(v52 - 1, v51));
            if (!v52)
            {
              ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
              std::__shared_weak_count::__release_weak(v50);
            }
          }
          *(_QWORD *)&v186 = &v162;
          std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v186);
          for (i = 16; i != -16; i -= 16)
            std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&v187 + i);
          v54 = (std::__shared_weak_count *)*((_QWORD *)&v161 + 1);
          v11 = v145;
          if (*((_QWORD *)&v161 + 1))
          {
            v55 = (unint64_t *)(*((_QWORD *)&v161 + 1) + 8);
            do
              v56 = __ldaxr(v55);
            while (__stlxr(v56 - 1, v55));
            if (!v56)
            {
              ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
              std::__shared_weak_count::__release_weak(v54);
            }
          }
          v159 = v166;
          v160 = v167;
          if (v167)
          {
            v57 = (unint64_t *)&v167->__shared_owners_;
            do
              v58 = __ldxr(v57);
            while (__stxr(v58 + 1, v57));
          }
          -[MPModelLibraryResponseKeepLocalStatusConfiguration setDownloadableItemsQuery:](v33, "setDownloadableItemsQuery:", &v159);
          v59 = v160;
          if (v160)
          {
            v60 = (unint64_t *)&v160->__shared_owners_;
            do
              v61 = __ldaxr(v60);
            while (__stlxr(v61 - 1, v60));
            if (!v61)
            {
              ((void (*)(std::__shared_weak_count *))v59->__on_zero_shared)(v59);
              std::__shared_weak_count::__release_weak(v59);
            }
          }
          v62 = v167;
          if (v167)
          {
            v63 = (unint64_t *)&v167->__shared_owners_;
            do
              v64 = __ldaxr(v63);
            while (__stlxr(v64 - 1, v63));
            if (!v64)
            {
              ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
              std::__shared_weak_count::__release_weak(v62);
            }
          }
        }
        os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 48));
        objc_msgSend(*(id *)(a1 + 88), "addObject:", v33);
        os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 48));

      }
      if (*(_BYTE *)(a1 + 152))
        v65 = v5;
      else
        v65 = 0;
      if (v65)
      {
        objc_msgSend(*(id *)(a1 + 40), "setFilterText:", 0);
        v66 = (void *)objc_msgSend(*(id *)(a1 + 64), "copy");
        v67 = *(void **)(a1 + 72);
        +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "itemSortDescriptors");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        if (v67)
        {
          v70 = v67;
          v11 = v145;
          objc_msgSend(v70, "entityQueryForPropertySet:sortDescriptors:context:view:", v68, v69, v145, v66);
        }
        else
        {
          v166 = 0;
          v167 = 0;
          v11 = v145;
        }

        v157 = v166;
        v158 = v167;
        if (v167)
        {
          v71 = (unint64_t *)&v167->__shared_owners_;
          do
            v72 = __ldxr(v71);
          while (__stxr(v72 + 1, v71));
        }
        v156 = 0;
        if (v66)
        {
          objc_msgSend(v66, "resultsForCoreQuery:error:", &v157, &v156);
          v73 = v156;
        }
        else
        {
          v73 = 0;
          v165 = 0uLL;
        }
        v74 = v158;
        if (v158)
        {
          v75 = (unint64_t *)&v158->__shared_owners_;
          do
            v76 = __ldaxr(v75);
          while (__stlxr(v76 - 1, v75));
          if (!v76)
          {
            ((void (*)(std::__shared_weak_count *))v74->__on_zero_shared)(v74);
            std::__shared_weak_count::__release_weak(v74);
          }
        }
        if (v73)
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), v73);
        }
        else
        {
          v86 = (mlcore::EntityQueryResult *)v165;
          if (!(_QWORD)v165)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v142 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v142, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 144), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272));

            v86 = (mlcore::EntityQueryResult *)v165;
          }
          *(_QWORD *)&v161 = v86;
          *((_QWORD *)&v161 + 1) = *((_QWORD *)&v165 + 1);
          if (*((_QWORD *)&v165 + 1))
          {
            v87 = (unint64_t *)(*((_QWORD *)&v165 + 1) + 8);
            do
              v88 = __ldxr(v87);
            while (__stxr(v88 + 1, v87));
          }
          v89 = (uint64_t *)mlcore::EntityQueryResult::propertyCaches(v86);
          v143 = v174[0];
          v90 = (uint64_t *)mlcore::EntityQueryResult::propertyCaches(v174[0]);
          v91 = (_QWORD *)operator new();
          *v91 = 0;
          v91[1] = 0;
          v91[2] = 0;
          v92 = (mlcore *)std::shared_ptr<std::vector<mlcore::PropertyCache>>::shared_ptr[abi:ne180100]<std::vector<mlcore::PropertyCache>,void>(&v154, (uint64_t)v91);
          v94 = *v89;
          v93 = v89[1];
          if (*v89 != v93)
          {
            v95 = 0;
            do
            {
              if (v95 >= 0x84BDA12F684BDA13 * ((v90[1] - *v90) >> 3))
                break;
              v96 = mlcore::PlaylistItemPropertyPersistentID(v92);
              v97 = (mlcore *)mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::valueForProperty(v94, v96);
              v98 = *v90;
              v99 = mlcore::PlaylistItemPropertyPersistentID(v97);
              v92 = (mlcore *)mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::valueForProperty(v98 + 216 * v95, v99);
              if (v97 == v92)
              {
                v100 = v154;
                v101 = v154[1];
                if (v101 >= v154[2])
                {
                  v92 = (mlcore *)std::vector<mlcore::PropertyCache>::__push_back_slow_path<mlcore::PropertyCache const&>(v154);
                }
                else
                {
                  mlcore::PropertyCache::PropertyCache();
                  v92 = (mlcore *)(v101 + 216);
                  v100[1] = v101 + 216;
                }
                v100[1] = v92;
                ++v95;
              }
              v94 += 216;
            }
            while (v94 != v93);
          }
          v102 = (__int128 **)mlcore::EntityQueryResult::sections(v143);
          v103 = (char *)operator new(0x30uLL);
          *(_OWORD *)(v103 + 8) = 0u;
          *(_QWORD *)v103 = &off_1E314AC28;
          *((_QWORD *)v103 + 3) = 0;
          *((_OWORD *)v103 + 2) = 0u;
          v105 = *v102;
          v104 = v102[1];
          *(_QWORD *)&v186 = v103 + 24;
          BYTE8(v186) = 0;
          if (v104 != v105)
          {
            v106 = 0xAAAAAAAAAAAAAAABLL * (v104 - v105);
            if (v106 >= 0x555555555555556)
              std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
            v107 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::Section>>(v106);
            *((_QWORD *)v103 + 5) = &v107[48 * v108];
            *((_QWORD *)v103 + 3) = v107;
            *((_QWORD *)v103 + 4) = v107;
            *(_QWORD *)&v151 = v107;
            *(_QWORD *)&v150 = v107;
            *(_QWORD *)&v187 = v103 + 40;
            *((_QWORD *)&v187 + 1) = &v150;
            *(_QWORD *)&v188 = &v151;
            BYTE8(v188) = 0;
            v109 = v107;
            do
            {
              if (*((char *)v105 + 23) < 0)
              {
                std::string::__init_copy_ctor_external((std::string *)v109, *(const std::string::value_type **)v105, *((_QWORD *)v105 + 1));
                v111 = (char *)v151;
              }
              else
              {
                v110 = *v105;
                *((_QWORD *)v109 + 2) = *((_QWORD *)v105 + 2);
                *(_OWORD *)v109 = v110;
                v111 = v109;
              }
              v112 = *(__int128 *)((char *)v105 + 24);
              *((_DWORD *)v109 + 10) = *((_DWORD *)v105 + 10);
              *(_OWORD *)(v109 + 24) = v112;
              v105 += 3;
              v109 = v111 + 48;
              *(_QWORD *)&v151 = v111 + 48;
            }
            while (v105 != v104);
            BYTE8(v188) = 1;
            std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<mlcore::Section>,mlcore::Section*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&v187);
            *((_QWORD *)v103 + 4) = v109;
          }
          v152 = v103 + 24;
          v153 = (std::__shared_weak_count *)v103;
          if (v148)
            objc_msgSend(v148, "mlCoreView");
          else
            v151 = 0uLL;
          mlcore::Query::entityClass(v166);
          mlcore::EntityQuery::identityPropertiesToFetch(v166);
          v113 = v174[0];
          mlcore::EntityQueryResult::localizedSectionIndices(v174[0]);
          mlcore::EntityQueryResult::optionalLocalizedSectionIndicesRange(v113);
          mlcore::EntityQueryResult::entityRevision(v113);
          mlcore::EntityQueryResult::entityCache(v113);
          v114 = (char *)operator new(0x128uLL);
          *(_OWORD *)(v114 + 8) = 0u;
          *(_QWORD *)v114 = &off_1E314A8A8;
          v186 = v150;
          v187 = v151;
          v150 = 0u;
          v151 = 0u;
          mlcore::EntityQueryResult::EntityQueryResult();
          v115 = (std::__shared_weak_count *)*((_QWORD *)&v186 + 1);
          v11 = v145;
          v73 = 0;
          if (*((_QWORD *)&v186 + 1))
          {
            v116 = (unint64_t *)(*((_QWORD *)&v186 + 1) + 8);
            do
              v117 = __ldaxr(v116);
            while (__stlxr(v117 - 1, v116));
            if (!v117)
            {
              ((void (*)(std::__shared_weak_count *))v115->__on_zero_shared)(v115);
              std::__shared_weak_count::__release_weak(v115);
            }
          }
          v118 = (std::__shared_weak_count *)*((_QWORD *)&v187 + 1);
          if (*((_QWORD *)&v187 + 1))
          {
            v119 = (unint64_t *)(*((_QWORD *)&v187 + 1) + 8);
            do
              v120 = __ldaxr(v119);
            while (__stlxr(v120 - 1, v119));
            if (!v120)
            {
              ((void (*)(std::__shared_weak_count *))v118->__on_zero_shared)(v118);
              std::__shared_weak_count::__release_weak(v118);
            }
          }
          *(_QWORD *)&v121 = v114 + 24;
          *((_QWORD *)&v121 + 1) = v114;
          v122 = (std::__shared_weak_count *)v174[1];
          *(_OWORD *)v174 = v121;
          if (v122)
          {
            v123 = (unint64_t *)&v122->__shared_owners_;
            do
              v124 = __ldaxr(v123);
            while (__stlxr(v124 - 1, v123));
            if (!v124)
            {
              ((void (*)(std::__shared_weak_count *))v122->__on_zero_shared)(v122);
              std::__shared_weak_count::__release_weak(v122);
            }
          }
          v125 = (std::__shared_weak_count *)*((_QWORD *)&v150 + 1);
          if (*((_QWORD *)&v150 + 1))
          {
            v126 = (unint64_t *)(*((_QWORD *)&v150 + 1) + 8);
            do
              v127 = __ldaxr(v126);
            while (__stlxr(v127 - 1, v126));
            if (!v127)
            {
              ((void (*)(std::__shared_weak_count *))v125->__on_zero_shared)(v125);
              std::__shared_weak_count::__release_weak(v125);
            }
          }
          v128 = (std::__shared_weak_count *)*((_QWORD *)&v151 + 1);
          if (*((_QWORD *)&v151 + 1))
          {
            v129 = (unint64_t *)(*((_QWORD *)&v151 + 1) + 8);
            do
              v130 = __ldaxr(v129);
            while (__stlxr(v130 - 1, v129));
            if (!v130)
            {
              ((void (*)(std::__shared_weak_count *))v128->__on_zero_shared)(v128);
              std::__shared_weak_count::__release_weak(v128);
            }
          }
          os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 48));
          v131 = std::__tree<std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>,std::__map_value_compare<long long,std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>,std::less<long long>,true>,std::allocator<std::__value_type<long long,std::shared_ptr<mlcore::EntityQueryResult>>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>((uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 48), v185, &v185);
          std::shared_ptr<mlcore::QueryResult>::operator=[abi:ne180100](v131 + 5, (uint64_t)v174[0], (uint64_t)v174[1]);
          os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 48));
          v132 = v153;
          if (v153)
          {
            v133 = (unint64_t *)&v153->__shared_owners_;
            do
              v134 = __ldaxr(v133);
            while (__stlxr(v134 - 1, v133));
            if (!v134)
            {
              ((void (*)(std::__shared_weak_count *))v132->__on_zero_shared)(v132);
              std::__shared_weak_count::__release_weak(v132);
            }
          }
          v135 = v155;
          if (v155)
          {
            v136 = (unint64_t *)&v155->__shared_owners_;
            do
              v137 = __ldaxr(v136);
            while (__stlxr(v137 - 1, v136));
            if (!v137)
            {
              ((void (*)(std::__shared_weak_count *))v135->__on_zero_shared)(v135);
              std::__shared_weak_count::__release_weak(v135);
            }
          }
          v138 = (std::__shared_weak_count *)*((_QWORD *)&v161 + 1);
          if (*((_QWORD *)&v161 + 1))
          {
            v139 = (unint64_t *)(*((_QWORD *)&v161 + 1) + 8);
            do
              v140 = __ldaxr(v139);
            while (__stlxr(v140 - 1, v139));
            if (!v140)
            {
              ((void (*)(std::__shared_weak_count *))v138->__on_zero_shared)(v138);
              std::__shared_weak_count::__release_weak(v138);
            }
          }
        }
        v77 = (std::__shared_weak_count *)*((_QWORD *)&v165 + 1);
        if (*((_QWORD *)&v165 + 1))
        {
          v78 = (unint64_t *)(*((_QWORD *)&v165 + 1) + 8);
          do
            v79 = __ldaxr(v78);
          while (__stlxr(v79 - 1, v78));
          if (!v79)
          {
            ((void (*)(std::__shared_weak_count *))v77->__on_zero_shared)(v77);
            std::__shared_weak_count::__release_weak(v77);
          }
        }

        v80 = v167;
        if (v167)
        {
          v81 = (unint64_t *)&v167->__shared_owners_;
          do
            v82 = __ldaxr(v81);
          while (__stlxr(v82 - 1, v81));
          if (!v82)
          {
            ((void (*)(std::__shared_weak_count *))v80->__on_zero_shared)(v80);
            std::__shared_weak_count::__release_weak(v80);
          }
        }

      }
      v83 = (std::__shared_weak_count *)v174[1];
      if (v174[1])
      {
        v84 = (unint64_t *)((char *)v174[1] + 8);
        do
          v85 = __ldaxr(v84);
        while (__stlxr(v85 - 1, v84));
        if (!v85)
        {
          ((void (*)(std::__shared_weak_count *))v83->__on_zero_shared)(v83);
          std::__shared_weak_count::__release_weak(v83);
        }
      }
      goto LABEL_27;
    }
  }
  if (!v18)
    goto LABEL_40;
LABEL_26:
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), v18);
LABEL_27:
  v22 = (std::__shared_weak_count *)v179;
  if (v179)
  {
    v23 = (unint64_t *)((char *)v179 + 8);
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }

  v25 = v181;
  if (v181)
  {
    v26 = (unint64_t *)&v181->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }

LABEL_38:
  objc_autoreleasePoolPop(context);
}

void __52__MPModelLibraryRequestOperation__executeNewRequest__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "mediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__MPModelLibraryRequestOperation__executeNewRequest__block_invoke_3;
  v6[3] = &__block_descriptor_40_e44_v16__0___MPMutableLocalLibraryIdentifiers__8l;
  v6[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "setLibraryIdentifiersWithDatabaseID:block:", v4, v6);

}

void __52__MPModelLibraryRequestOperation__executeNewRequest__block_invoke_5(_QWORD *a1@<X0>, mlcore::Query **a2@<X8>)
{
  void *v4;
  mlcore::Query *v5;
  mlcore *v6;
  mlcore *v7;
  ModelPropertyBase *IsStoreRedownloadable;
  _OWORD *v9;
  char v10;
  uint64_t v11;
  char v12;
  __int128 v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  uint64_t i;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  __int128 v29;
  _OWORD *v30;
  _OWORD *v31;
  _OWORD *v32;
  std::__shared_weak_count *v33;
  mlcore::Query *v34;
  std::__shared_weak_count *v35;
  void **v36;
  char v37;
  _OWORD v38[1];
  __int128 v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = (void *)a1[4];
  if (v4)
  {
    objc_msgSend(v4, "entityQueryForPropertySet:sortDescriptors:context:view:", a1[5], a1[6], a1[7], a1[8]);
    v5 = v34;
  }
  else
  {
    v5 = 0;
    v34 = 0;
    v35 = 0;
  }
  v6 = (mlcore *)mlcore::Query::predicate(v5);
  v7 = (mlcore *)mlcore::PlaylistItemPropertyItemPersistentID(v6);
  IsStoreRedownloadable = (ModelPropertyBase *)mlcore::ItemPropertyIsStoreRedownloadable(v7);
  MPMediaLibraryGetProperty((ModelPropertyBase *)v7, IsStoreRedownloadable);
  std::allocate_shared[abi:ne180100]<mlcore::UnaryPredicate<int>,std::allocator<mlcore::UnaryPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::UnaryOperator,void>((uint64_t *)&v29);
  v39 = v29;
  v29 = 0uLL;
  v31 = 0;
  v32 = 0;
  v30 = 0;
  v36 = (void **)&v30;
  v37 = 0;
  v9 = operator new(0x20uLL);
  v10 = 0;
  v11 = 0;
  v30 = v9;
  v31 = v9;
  v32 = v9 + 2;
  do
  {
    v12 = v10;
    v13 = v38[v11];
    *v9 = v13;
    if (*((_QWORD *)&v13 + 1))
    {
      v14 = (unint64_t *)(*((_QWORD *)&v13 + 1) + 8);
      do
        v15 = __ldxr(v14);
      while (__stxr(v15 + 1, v14));
    }
    ++v9;
    v10 = 1;
    v11 = 1;
  }
  while ((v12 & 1) == 0);
  v31 = v9;
  mlcore::CreateAndPredicate();
  mlcore::Query::setPredicate();
  v16 = v33;
  if (v33)
  {
    p_shared_owners = (unint64_t *)&v33->__shared_owners_;
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  v36 = (void **)&v30;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v36);
  for (i = 1; i != -1; --i)
    std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&v38[i]);
  v20 = (std::__shared_weak_count *)*((_QWORD *)&v29 + 1);
  if (*((_QWORD *)&v29 + 1))
  {
    v21 = (unint64_t *)(*((_QWORD *)&v29 + 1) + 8);
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  v23 = v35;
  *a2 = v34;
  a2[1] = (mlcore::Query *)v23;
  if (v23)
  {
    v24 = (unint64_t *)&v23->__shared_owners_;
    do
      v25 = __ldxr(v24);
    while (__stxr(v25 + 1, v24));
    v26 = v35;
    if (v35)
    {
      v27 = (unint64_t *)&v35->__shared_owners_;
      do
        v28 = __ldaxr(v27);
      while (__stlxr(v28 - 1, v27));
      if (!v28)
      {
        ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
        std::__shared_weak_count::__release_weak(v26);
      }
    }
  }
}

uint64_t __52__MPModelLibraryRequestOperation__executeNewRequest__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPersistentID:", *(_QWORD *)(a1 + 32));
}

intptr_t __53__MPModelLibraryRequestOperation__sanityCheckRequest__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __55__MPModelLibraryRequestOperation__executeLegacyRequest__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD v5[5];

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__MPModelLibraryRequestOperation__executeLegacyRequest__block_invoke_2;
  v5[3] = &unk_1E3162B80;
  v5[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "setLibraryIdentifiersWithDatabaseID:block:", v3, v5);

}

void __55__MPModelLibraryRequestOperation__executeLegacyRequest__block_invoke_3(uint64_t a1, uint64_t a2, id *a3)
{
  id v4;

  v4 = *a3;
  objc_msgSend(*(id *)(a1 + 32), "_insertPropertyCacheForEntityPID:entityClass:entityTranslator:translationContext:propertyCachesVector:", objc_msgSend(v4, "longLongValue"), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a1 + 64);

}

uint64_t __55__MPModelLibraryRequestOperation__executeLegacyRequest__block_invoke_22(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_insertPropertyCacheForEntityPID:entityClass:entityTranslator:translationContext:propertyCachesVector:", a2, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a1 + 64);
}

void __55__MPModelLibraryRequestOperation__executeLegacyRequest__block_invoke_27(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  std::string *v5;
  std::string *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  unint64_t v17;
  std::string *v18;
  char *v19;
  const std::string::value_type **v20;
  const std::string::value_type **v21;
  std::string *v22;
  std::string *v23;
  const std::string::value_type **v24;
  __int128 v25;
  std::string *v26;
  int v27;
  std::string *v28;
  std::string *v29;
  std::string *v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  __int128 v34;
  std::vector<std::string>::pointer v35;
  void *__p[2];
  std::string::size_type v37;
  __int128 v38;
  int v39;
  void *v40[2];
  uint64_t v41;
  char *v42;
  std::string *v43;
  std::string *v44;
  char *v45;
  uint64_t v46;
  _QWORD v47[3];
  char v48;
  __int128 v49;
  __int128 v50;

  v3 = a2;
  v4 = objc_msgSend(v3, "range");
  v6 = v5;
  objc_msgSend(v3, "title");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(v40, (char *)objc_msgSend(v7, "UTF8String"));

  v42 = (char *)v4;
  v43 = v6;
  mlcore::Section::Section();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(v8 + 8);
  v10 = *(_QWORD *)(v8 + 16);
  if (v9 >= v10)
  {
    v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v9 - *(_QWORD *)v8) >> 4);
    if (v11 + 1 > 0x555555555555555)
      std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
    v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v10 - *(_QWORD *)v8) >> 4);
    v13 = 2 * v12;
    if (2 * v12 <= v11 + 1)
      v13 = v11 + 1;
    if (v12 >= 0x2AAAAAAAAAAAAAALL)
      v14 = 0x555555555555555;
    else
      v14 = v13;
    v46 = v8 + 16;
    if (v14)
    {
      v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::Section>>(v14);
    }
    else
    {
      v16 = 0;
      v15 = 0;
    }
    v18 = (std::string *)&v16[48 * v11];
    v42 = v16;
    v43 = v18;
    v44 = v18;
    v45 = &v16[48 * v15];
    if (SHIBYTE(v37) < 0)
    {
      std::string::__init_copy_ctor_external(v18, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
      v18 = v44;
    }
    else
    {
      v18->__r_.__value_.__r.__words[2] = v37;
      *(_OWORD *)&v18->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
    }
    v19 = &v16[48 * v11];
    *((_DWORD *)v19 + 10) = v39;
    *(_OWORD *)(v19 + 24) = v38;
    v44 = v18 + 2;
    v20 = *(const std::string::value_type ***)v8;
    v21 = *(const std::string::value_type ***)(v8 + 8);
    v22 = v43;
    *(_QWORD *)&v50 = v43;
    *((_QWORD *)&v50 + 1) = v43;
    v49 = v50;
    v47[0] = v8 + 16;
    v47[1] = &v49;
    v47[2] = &v50;
    v48 = 0;
    if (v21 != v20)
    {
      do
      {
        v23 = v22 - 2;
        v24 = v21 - 6;
        if (*((char *)v21 - 25) < 0)
        {
          std::string::__init_copy_ctor_external(v23, *(v21 - 6), (std::string::size_type)*(v21 - 5));
          v26 = (std::string *)*((_QWORD *)&v50 + 1);
        }
        else
        {
          v25 = *(_OWORD *)v24;
          v22[-2].__r_.__value_.__r.__words[2] = (std::string::size_type)*(v21 - 4);
          *(_OWORD *)&v23->__r_.__value_.__l.__data_ = v25;
          v26 = v22;
        }
        v27 = *((_DWORD *)v21 - 2);
        *(_OWORD *)&v22[-1].__r_.__value_.__l.__data_ = *(_OWORD *)(v21 - 3);
        LODWORD(v22[-1].__r_.__value_.__r.__words[2]) = v27;
        v22 = v26 - 2;
        *((_QWORD *)&v50 + 1) = v26 - 2;
        v21 -= 6;
      }
      while (v24 != v20);
    }
    v48 = 1;
    std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<mlcore::Section>,std::reverse_iterator<mlcore::Section*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v47);
    v28 = *(std::string **)v8;
    *(_QWORD *)v8 = v22;
    v43 = v28;
    v29 = *(std::string **)(v8 + 8);
    *(_QWORD *)(v8 + 8) = v44;
    v30 = v43;
    v44 = v29;
    v31 = *(char **)(v8 + 16);
    *(_QWORD *)(v8 + 16) = v45;
    v45 = v31;
    v42 = (char *)v30;
    v17 = *(_QWORD *)(v8 + 8);
    std::__split_buffer<mlcore::Section>::~__split_buffer((uint64_t)&v42);
  }
  else
  {
    if (SHIBYTE(v37) < 0)
    {
      std::string::__init_copy_ctor_external(*(std::string **)(v8 + 8), (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
    }
    else
    {
      *(_QWORD *)(v9 + 16) = v37;
      *(_OWORD *)v9 = *(_OWORD *)__p;
    }
    *(_DWORD *)(v9 + 40) = v39;
    *(_OWORD *)(v9 + 24) = v38;
    v17 = v9 + 48;
    *(_QWORD *)(v8 + 8) = v17;
  }
  *(_QWORD *)(v8 + 8) = v17;
  v32 = *(_QWORD *)(a1 + 48);
  v33 = *(_QWORD *)(v32 + 8);
  if (v33 >= *(_QWORD *)(v32 + 16))
  {
    v35 = std::vector<std::string>::__push_back_slow_path<std::string const&>(*(std::vector<std::string> **)(a1 + 48), (__int128 *)v40);
  }
  else
  {
    if (SHIBYTE(v41) < 0)
    {
      std::string::__init_copy_ctor_external(*(std::string **)(v32 + 8), (const std::string::value_type *)v40[0], (std::string::size_type)v40[1]);
    }
    else
    {
      v34 = *(_OWORD *)v40;
      *(_QWORD *)(v33 + 16) = v41;
      *(_OWORD *)v33 = v34;
    }
    v35 = (std::vector<std::string>::pointer)(v33 + 24);
    *(_QWORD *)(v32 + 8) = v33 + 24;
  }
  *(_QWORD *)(v32 + 8) = v35;
  if (SHIBYTE(v37) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v41) < 0)
    operator delete(v40[0]);

}

uint64_t __55__MPModelLibraryRequestOperation__executeLegacyRequest__block_invoke_29(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_insertPropertyCacheForEntityPID:entityClass:entityTranslator:translationContext:propertyCachesVector:", a2, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a1 + 64);
}

uint64_t __55__MPModelLibraryRequestOperation__executeLegacyRequest__block_invoke_2_30(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_insertPropertyCacheForEntityPID:entityClass:entityTranslator:translationContext:propertyCachesVector:", a2, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a1 + 64);
}

void __55__MPModelLibraryRequestOperation__executeLegacyRequest__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(*(id *)(a1 + 32), "persistentID"));

}

@end
