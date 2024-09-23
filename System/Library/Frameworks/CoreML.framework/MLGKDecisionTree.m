@implementation MLGKDecisionTree

- (id)_init
{
  MLGKDecisionTree *v2;
  uint64_t *v3;
  uint64_t v4;
  CoreML::Specification::ModelDescription *v5;
  std::string **v6;
  std::string *v7;
  std::string **v8;
  __int128 *v9;
  std::__shared_weak_count *v10;
  uint64_t v11;
  uint64_t *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  CoreML::Specification::TreeEnsembleClassifier *v15;
  CoreML::Specification::TreeEnsembleParameters *v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  CoreML::Specification::TreeEnsembleClassifier *v21;
  std::string **v22;
  std::string *v23;
  std::string **v24;
  __int128 *v25;
  uint64_t v26;
  std::string **v27;
  std::string *v28;
  std::string **v29;
  __int128 *v30;
  std::string __p;
  std::string v33;
  std::string __str;
  objc_super v35;
  void (**v36)(CoreML::Model *__hidden);
  uint64_t v37;
  std::__shared_weak_count *v38;

  v35.receiver = self;
  v35.super_class = (Class)MLGKDecisionTree;
  v2 = -[MLGKDecisionTree init](&v35, sel_init);
  if (v2)
  {
    v3 = (uint64_t *)operator new();
    std::string::basic_string[abi:ne180100]<0>(&__str, "action");
    std::string::basic_string[abi:ne180100]<0>(&v33, "probabilities");
    std::string::basic_string[abi:ne180100]<0>(&__p, "GKDecisionTree->CoreML");
    CoreML::Model::Model((CoreML::Model *)&v36);
    v4 = v37;
    v5 = *(CoreML::Specification::ModelDescription **)(v37 + 16);
    if (!v5)
    {
      v5 = (CoreML::Specification::ModelDescription *)operator new();
      CoreML::Specification::ModelDescription::ModelDescription(v5);
      *(_QWORD *)(v4 + 16) = v5;
    }
    v6 = (std::string **)*((_QWORD *)v5 + 20);
    if (!v6)
    {
      v6 = (std::string **)operator new();
      CoreML::Specification::Metadata::Metadata((CoreML::Specification::Metadata *)v6);
      *((_QWORD *)v5 + 20) = v6;
    }
    v9 = (__int128 *)v6[6];
    v8 = v6 + 6;
    v7 = (std::string *)v9;
    if (v9 == &google::protobuf::internal::fixed_address_empty_string)
      google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena(v8, (uint64_t)&__p);
    else
      std::string::operator=(v7, &__p);
    *v3 = (uint64_t)&off_1E3D597D0;
    v11 = v37;
    v10 = v38;
    v3[1] = v37;
    v12 = v3 + 1;
    v3[2] = (uint64_t)v10;
    if (v10)
    {
      p_shared_owners = (unint64_t *)&v10->__shared_owners_;
      do
        v14 = __ldxr(p_shared_owners);
      while (__stxr(v14 + 1, p_shared_owners));
      v11 = *v12;
    }
    *v3 = (uint64_t)&off_1E3D59538;
    v3[5] = 0;
    v3[4] = 0;
    v3[3] = (uint64_t)(v3 + 4);
    if (*(_DWORD *)(v11 + 44) == 402)
    {
      v15 = *(CoreML::Specification::TreeEnsembleClassifier **)(v11 + 32);
    }
    else
    {
      CoreML::Specification::Model::clear_Type(v11);
      *(_DWORD *)(v11 + 44) = 402;
      v15 = (CoreML::Specification::TreeEnsembleClassifier *)operator new();
      CoreML::Specification::TreeEnsembleClassifier::TreeEnsembleClassifier(v15);
      *(_QWORD *)(v11 + 32) = v15;
    }
    v16 = (CoreML::Specification::TreeEnsembleParameters *)*((_QWORD *)v15 + 2);
    if (!v16)
    {
      v16 = (CoreML::Specification::TreeEnsembleParameters *)operator new();
      CoreML::Specification::TreeEnsembleParameters::TreeEnsembleParameters(v16);
      *((_QWORD *)v15 + 2) = v16;
    }
    v3[6] = (uint64_t)v16;
    v36 = &off_1E3D597D0;
    v17 = v38;
    if (v38)
    {
      v18 = (unint64_t *)&v38->__shared_owners_;
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
    *v3 = (uint64_t)&off_1E3D59610;
    v20 = v3[1];
    if (*(_DWORD *)(v20 + 44) == 402)
    {
      v21 = *(CoreML::Specification::TreeEnsembleClassifier **)(v20 + 32);
    }
    else
    {
      CoreML::Specification::Model::clear_Type(v3[1]);
      *(_DWORD *)(v20 + 44) = 402;
      v21 = (CoreML::Specification::TreeEnsembleClassifier *)operator new();
      CoreML::Specification::TreeEnsembleClassifier::TreeEnsembleClassifier(v21);
      *(_QWORD *)(v20 + 32) = v21;
      v20 = *v12;
    }
    v3[7] = (uint64_t)v21;
    v22 = *(std::string ***)(v20 + 16);
    if (!v22)
    {
      v22 = (std::string **)operator new();
      CoreML::Specification::ModelDescription::ModelDescription((CoreML::Specification::ModelDescription *)v22);
      *(_QWORD *)(v20 + 16) = v22;
    }
    v25 = (__int128 *)v22[17];
    v24 = v22 + 17;
    v23 = (std::string *)v25;
    if (v25 == &google::protobuf::internal::fixed_address_empty_string)
      google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena(v24, (uint64_t)&__str);
    else
      std::string::operator=(v23, &__str);
    v26 = *v12;
    v27 = *(std::string ***)(*v12 + 16);
    if (!v27)
    {
      v27 = (std::string **)operator new();
      CoreML::Specification::ModelDescription::ModelDescription((CoreML::Specification::ModelDescription *)v27);
      *(_QWORD *)(v26 + 16) = v27;
    }
    v30 = (__int128 *)v27[18];
    v29 = v27 + 18;
    v28 = (std::string *)v30;
    if (v30 == &google::protobuf::internal::fixed_address_empty_string)
      google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena(v29, (uint64_t)&v33);
    else
      std::string::operator=(v28, &v33);
    v2->_trc = v3;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v33.__r_.__value_.__l.__data_);
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__str.__r_.__value_.__l.__data_);
  }
  return v2;
}

- (id)_initWithFlattenedTree:(id)a3
{
  _QWORD *v4;
  id v5;
  void *v6;
  uint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  uint64_t v11;
  CoreML::Specification::FeatureType *v12;
  uint64_t v13;
  CoreML::Specification::Int64FeatureType *v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  char *v46;
  uint64_t v47;
  unint64_t j;
  void *v49;
  BOOL v50;
  void *v51;
  _QWORD *v52;
  void *v53;
  id v54;
  std::__shared_weak_count *v55;
  unint64_t *v56;
  unint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  signed int v62;
  unsigned int *v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  char isKindOfClass;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  int v81;
  void *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  BOOL v93;
  CoreML::Specification::TreeEnsembleParameters_TreeNode *v94;
  void *v95;
  uint64_t v96;
  CoreML::TreeEnsembleBase *v97;
  _QWORD *v98;
  CoreML::Specification::TreeEnsembleParameters_TreeNode *Node;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  CoreML::Specification::TreeEnsembleParameters_TreeNode_EvaluationInfo *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  CoreML::Specification::Int64Vector *v108;
  uint64_t v109;
  unint64_t v110;
  unint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  int v116;
  uint64_t v117;
  std::__shared_weak_count *v118;
  unint64_t *v119;
  unint64_t v120;
  void *v121;
  uint64_t v122;
  id v123;
  void *v124;
  std::__shared_weak_count *v125;
  unint64_t *v126;
  unint64_t v127;
  id v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  unint64_t v133;
  void *v134;
  uint64_t v135;
  void *v136;
  char *v137;
  char *v138;
  char *v139;
  unint64_t v140;
  uint64_t v141;
  char *v142;
  id v143;
  _QWORD *v144;
  id obj;
  id obja;
  id v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  CoreML::Specification::FeatureType *v156;
  std::__shared_weak_count *v157;
  void *v158[3];
  char v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  CoreML::Specification::FeatureType *v164;
  std::__shared_weak_count *v165;
  void *v166[3];
  char v167;
  CoreML::Specification::FeatureType *v168;
  std::__shared_weak_count *v169;
  void *v170;
  std::__shared_weak_count *v171;
  char v172;
  void *v173[3];
  char v174;
  _BYTE v175[128];
  _BYTE v176[128];
  _BYTE v177[128];
  uint64_t v178;

  v178 = *MEMORY[0x1E0C80C00];
  v129 = a3;
  v4 = -[MLGKDecisionTree _init](self, "_init");
  v144 = v4;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v4, "set_attributes:", v5);

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", objc_msgSend(v129, "count"));
    objc_msgSend(v4, "set_objectStore:", v6);

    v7 = v4[1];
    std::string::basic_string[abi:ne180100]<0>(&v170, "action");
    CoreML::FeatureType::FeatureType(&v168, 1);
    (*(void (**)(void **__return_ptr, uint64_t, void **, CoreML::Specification::FeatureType **))(*(_QWORD *)v7 + 24))(v173, v7, &v170, &v168);
    if (v174 < 0)
      operator delete(v173[1]);
    v8 = v169;
    if (v169)
    {
      p_shared_owners = (unint64_t *)&v169->__shared_owners_;
      do
        v10 = __ldaxr(p_shared_owners);
      while (__stlxr(v10 - 1, p_shared_owners));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    if (v172 < 0)
      operator delete(v170);
    v11 = v4[1];
    std::string::basic_string[abi:ne180100]<0>(&v170, "probabilities");
    CoreML::FeatureType::FeatureType(&v164, 6);
    v12 = v164;
    if (*((_DWORD *)v164 + 9) == 6)
    {
      v13 = *((_QWORD *)v164 + 3);
    }
    else
    {
      CoreML::Specification::FeatureType::clear_Type((uint64_t)v164);
      *((_DWORD *)v12 + 9) = 6;
      v13 = operator new();
      CoreML::Specification::DictionaryFeatureType::DictionaryFeatureType((CoreML::Specification::DictionaryFeatureType *)v13);
      *((_QWORD *)v12 + 3) = v13;
    }
    if (*(_DWORD *)(v13 + 28) != 1)
    {
      CoreML::Specification::MILSpec::Dimension::clear_dimension(v13);
      *(_DWORD *)(v13 + 28) = 1;
      v14 = (CoreML::Specification::Int64FeatureType *)operator new();
      CoreML::Specification::Int64FeatureType::Int64FeatureType(v14);
      *(_QWORD *)(v13 + 16) = v14;
    }
    (*(void (**)(void **__return_ptr, uint64_t, void **, CoreML::Specification::FeatureType **))(*(_QWORD *)v11 + 24))(v166, v11, &v170, &v164);
    if (v167 < 0)
      operator delete(v166[1]);
    v15 = v165;
    if (v165)
    {
      v16 = (unint64_t *)&v165->__shared_owners_;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    if (v172 < 0)
      operator delete(v170);
    v160 = 0u;
    v161 = 0u;
    v162 = 0u;
    v163 = 0u;
    obj = v129;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v160, v177, 16);
    if (v18)
    {
      v139 = 0;
      v140 = 0;
      v137 = 0;
      v138 = 0;
      v142 = 0;
      v19 = 0;
      v20 = 0;
      v21 = *(_QWORD *)v161;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v161 != v21)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * i);
          objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("attribute"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("children"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "count") == 0;

          if (v26)
          {
            objc_msgSend(v144, "_objectStore");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "containsObject:", v24);

            if ((v29 & 1) == 0)
            {
              objc_msgSend(v144, "_objectStore");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "addObject:", v24);

              if (v139 >= v142)
              {
                v32 = (v139 - v138) >> 3;
                v33 = v32 + 1;
                if ((unint64_t)(v32 + 1) >> 61)
                  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
                if ((v142 - v138) >> 2 > v33)
                  v33 = (v142 - v138) >> 2;
                if ((unint64_t)(v142 - v138) >= 0x7FFFFFFFFFFFFFF8)
                  v34 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v34 = v33;
                if (v34)
                  v34 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v34);
                else
                  v35 = 0;
                v36 = (char *)(v34 + 8 * v32);
                *(_QWORD *)v36 = v20;
                v31 = v36 + 8;
                if (v139 == v138)
                {
                  v37 = v138;
                }
                else
                {
                  v37 = v138;
                  v38 = v139;
                  do
                  {
                    v39 = *((_QWORD *)v38 - 1);
                    v38 -= 8;
                    *((_QWORD *)v36 - 1) = v39;
                    v36 -= 8;
                  }
                  while (v38 != v138);
                }
                v142 = (char *)(v34 + 8 * v35);
                if (v37)
                  operator delete(v37);
                v138 = v36;
              }
              else
              {
                *(_QWORD *)v139 = v20;
                v31 = v139 + 8;
              }
              ++v20;
              if ((unint64_t)v19 >= v140)
              {
                v40 = (v19 - v137) >> 3;
                v41 = v40 + 1;
                if ((unint64_t)(v40 + 1) >> 61)
                  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
                if ((uint64_t)(v140 - (_QWORD)v137) >> 2 > v41)
                  v41 = (uint64_t)(v140 - (_QWORD)v137) >> 2;
                if (v140 - (unint64_t)v137 >= 0x7FFFFFFFFFFFFFF8)
                  v42 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v42 = v41;
                if (v42)
                  v42 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v42);
                else
                  v43 = 0;
                v44 = (char *)(v42 + 8 * v40);
                *(_QWORD *)v44 = 0;
                v45 = v44 + 8;
                if (v19 == v137)
                {
                  v46 = v137;
                }
                else
                {
                  v46 = v137;
                  do
                  {
                    v47 = *((_QWORD *)v19 - 1);
                    v19 -= 8;
                    *((_QWORD *)v44 - 1) = v47;
                    v44 -= 8;
                  }
                  while (v19 != v137);
                }
                v140 = v42 + 8 * v43;
                if (v46)
                  operator delete(v46);
                v139 = v31;
                v19 = v45;
                v137 = v44;
              }
              else
              {
                *(_QWORD *)v19 = 0;
                v19 += 8;
                v139 = v31;
              }
            }
          }
          else
          {
            objc_msgSend(v144, "_attributes");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "addObject:", v24);

          }
        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v160, v177, 16);
      }
      while (v18);
    }
    else
    {
      v138 = 0;
      v139 = 0;
      v19 = 0;
      v137 = 0;
    }

    for (j = 0; ; ++j)
    {
      objc_msgSend(v144, "_attributes");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = j < objc_msgSend(v49, "count");

      v51 = v144;
      v52 = (_QWORD *)v144[1];
      if (!v50)
        break;
      objc_msgSend(v144, "_attributes");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "objectAtIndexedSubscript:", j);
      v54 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::basic_string[abi:ne180100]<0>(&v170, (char *)objc_msgSend(v54, "UTF8String"));
      CoreML::FeatureType::FeatureType(&v156, 2);
      (*(void (**)(void **__return_ptr, _QWORD *, void **, CoreML::Specification::FeatureType **))(*v52 + 16))(v158, v52, &v170, &v156);
      if (v159 < 0)
        operator delete(v158[1]);
      v55 = v157;
      if (v157)
      {
        v56 = (unint64_t *)&v157->__shared_owners_;
        do
          v57 = __ldaxr(v56);
        while (__stlxr(v57 - 1, v56));
        if (!v57)
        {
          ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
          std::__shared_weak_count::__release_weak(v55);
        }
      }
      if (v172 < 0)
        operator delete(v170);

    }
    v58 = v52[6];
    *(_DWORD *)(v58 + 40) = 0;
    v59 = v137;
    if (v137 == v19)
    {
      v65 = v19;
    }
    else
    {
      do
      {
        v60 = *(_QWORD *)v59;
        v61 = v52[6];
        v63 = (unsigned int *)(v61 + 40);
        v62 = *(_DWORD *)(v61 + 40);
        if (v62 == *(_DWORD *)(v61 + 44))
        {
          google::protobuf::RepeatedField<double>::Reserve(v63, v62 + 1);
          v62 = *v63;
        }
        v64 = *(_QWORD *)(v61 + 48);
        *(_DWORD *)(v61 + 40) = v62 + 1;
        *(_QWORD *)(v64 + 8 * v62 + 8) = v60;
        v59 += 8;
      }
      while (v59 != v19);
      v58 = v52[6];
      v65 = v137;
    }
    *(_QWORD *)(v58 + 64) = (v19 - v65) >> 3;
    v152 = 0u;
    v153 = 0u;
    v154 = 0u;
    v155 = 0u;
    obja = obj;
    v66 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v152, v176, 16);
    if (v66)
    {
      v133 = 0;
      v130 = *(_QWORD *)v153;
      do
      {
        v135 = 0;
        v131 = v66;
        do
        {
          if (*(_QWORD *)v153 != v130)
            objc_enumerationMutation(obja);
          v134 = *(void **)(*((_QWORD *)&v152 + 1) + 8 * v135);
          objc_msgSend(v134, "objectForKeyedSubscript:", CFSTR("attribute"));
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "_attributes");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v132 = objc_msgSend(v67, "indexOfObject:", v136);

          v150 = 0u;
          v151 = 0u;
          v148 = 0u;
          v149 = 0u;
          objc_msgSend(v134, "objectForKeyedSubscript:", CFSTR("children"));
          v143 = (id)objc_claimAutoreleasedReturnValue();
          v68 = objc_msgSend(v143, "countByEnumeratingWithState:objects:count:", &v148, v175, 16);
          if (!v68)
          {
            v141 = 0;
            v69 = 0;
            v81 = 5;
            v71 = 0;
            goto LABEL_125;
          }
          v141 = 0;
          v69 = 0;
          v70 = *(_QWORD *)v149;
          v71 = 0;
          do
          {
            v72 = 0;
            do
            {
              if (*(_QWORD *)v149 != v70)
                objc_enumerationMutation(v143);
              v73 = *(void **)(*((_QWORD *)&v148 + 1) + 8 * v72);
              objc_msgSend(obja, "objectAtIndexedSubscript:", objc_msgSend(v73, "unsignedIntegerValue"));
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("branch"));
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) != 0)
              {
                objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("branch"));
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v77, "predicateFormat");
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v78, "characterAtIndex:", 5) == 60)
                {
                  v69 = objc_msgSend(v73, "unsignedIntegerValue");
                  objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("branchValue"));
                  v79 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v79, "doubleValue");
                  v71 = v80;
                  v81 = 0;
LABEL_106:

                  goto LABEL_114;
                }
                if (objc_msgSend(v78, "characterAtIndex:", 5) == 62)
                {
                  v141 = objc_msgSend(v73, "unsignedIntegerValue");
                  v81 = 0;
                  goto LABEL_114;
                }
                if (objc_msgSend(v78, "characterAtIndex:", 5) != 33)
                {
                  v69 = objc_msgSend(v73, "unsignedIntegerValue");
                  objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("branchValue"));
                  v79 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("branchValue"));
                  }
                  else
                  {
                    objc_msgSend(v144, "_objectStore");
                    v87 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v87, "addObject:", v79);

                    objc_msgSend(v144, "_objectStore");
                    v88 = (void *)objc_claimAutoreleasedReturnValue();
                    v89 = objc_msgSend(v88, "indexOfObject:", v79);

                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v89);
                  }
                  v86 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v86, "doubleValue");
                  v71 = v90;

                  v81 = 4;
                  goto LABEL_106;
                }
                v141 = objc_msgSend(v73, "unsignedIntegerValue");
              }
              else
              {
                v69 = objc_msgSend(v73, "unsignedIntegerValue");
                objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("branchValue"));
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("branchValue"));
                }
                else
                {
                  objc_msgSend(v144, "_objectStore");
                  v82 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v82, "addObject:", v77);

                  objc_msgSend(v144, "_objectStore");
                  v83 = (void *)objc_claimAutoreleasedReturnValue();
                  v84 = objc_msgSend(v83, "indexOfObject:", v77);

                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v84);
                }
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v78, "doubleValue");
                v71 = v85;
              }
              v81 = 4;
LABEL_114:

              ++v72;
            }
            while (v68 != v72);
            v91 = objc_msgSend(v143, "countByEnumeratingWithState:objects:count:", &v148, v175, 16);
            v68 = v91;
          }
          while (v91);
LABEL_125:

          objc_msgSend(v134, "objectForKeyedSubscript:", CFSTR("children"));
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = objc_msgSend(v92, "count") == 0;

          if (v93)
          {
            objc_msgSend(v144, "_objectStore");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            v96 = objc_msgSend(v95, "indexOfObject:", v136);

            v97 = (CoreML::TreeEnsembleBase *)v144[1];
            v98 = operator new(0x10uLL);
            *v98 = v96;
            v98[1] = 0x3FF0000000000000;
            Node = CoreML::TreeEnsembleBase::_getNode(v97, v133);
            *((_DWORD *)Node + 14) = 6;
            v100 = *((unsigned int *)Node + 6);
            if ((int)v100 >= 1)
            {
              v101 = (uint64_t *)(*((_QWORD *)Node + 4) + 8);
              do
              {
                v102 = *v101++;
                *(_QWORD *)(v102 + 16) = 0;
                *(_QWORD *)(v102 + 24) = 0;
                --v100;
              }
              while (v100);
              *((_DWORD *)Node + 6) = 0;
            }
            v103 = google::protobuf::internal::RepeatedPtrFieldBase::Add<google::protobuf::RepeatedPtrField<CoreML::Specification::TreeEnsembleParameters_TreeNode_EvaluationInfo>::TypeHandler>((CoreML::Specification::TreeEnsembleParameters_TreeNode *)((char *)Node + 16));
            *((_QWORD *)v103 + 2) = *v98;
            *((_QWORD *)v103 + 3) = v98[1];
            operator delete(v98);
          }
          else
          {
            v94 = CoreML::TreeEnsembleBase::_getNode((CoreML::TreeEnsembleBase *)v144[1], v133);
            *((_QWORD *)v94 + 8) = v132;
            *((_DWORD *)v94 + 14) = v81;
            *((_QWORD *)v94 + 9) = v71;
            *((_QWORD *)v94 + 10) = v69;
            *((_QWORD *)v94 + 11) = v141;
          }

          ++v133;
          ++v135;
          v51 = v144;
        }
        while (v135 != v131);
        v66 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v152, v176, 16);
      }
      while (v66);
    }

    v104 = v144[1];
    *(_DWORD *)(*(_QWORD *)(v104 + 56) + 24) = 0;
    v105 = *(_QWORD *)(v104 + 8);
    if (*(_DWORD *)(v105 + 44) == 402)
    {
      v106 = *(_QWORD *)(v105 + 32);
      v107 = v139;
    }
    else
    {
      CoreML::Specification::Model::clear_Type(*(_QWORD *)(v104 + 8));
      v107 = v139;
      *(_DWORD *)(v105 + 44) = 402;
      v106 = operator new();
      CoreML::Specification::TreeEnsembleClassifier::TreeEnsembleClassifier((CoreML::Specification::TreeEnsembleClassifier *)v106);
      *(_QWORD *)(v105 + 32) = v106;
    }
    if (*(_DWORD *)(v106 + 44) == 101)
    {
      v108 = *(CoreML::Specification::Int64Vector **)(v106 + 32);
    }
    else
    {
      CoreML::Specification::TreeEnsembleClassifier::clear_ClassLabels(v106);
      *(_DWORD *)(v106 + 44) = 101;
      v108 = (CoreML::Specification::Int64Vector *)operator new();
      CoreML::Specification::Int64Vector::Int64Vector(v108);
      *(_QWORD *)(v106 + 32) = v108;
    }
    *((_DWORD *)v108 + 4) = 0;
    v109 = v107 - v138;
    if (v107 != v138)
    {
      v110 = 0;
      v111 = v109 >> 3;
      do
      {
        v112 = *(_QWORD *)(v104 + 8);
        if (*(_DWORD *)(v112 + 44) == 402)
        {
          v113 = *(_QWORD *)(v112 + 32);
        }
        else
        {
          CoreML::Specification::Model::clear_Type(*(_QWORD *)(v104 + 8));
          *(_DWORD *)(v112 + 44) = 402;
          v113 = operator new();
          CoreML::Specification::TreeEnsembleClassifier::TreeEnsembleClassifier((CoreML::Specification::TreeEnsembleClassifier *)v113);
          *(_QWORD *)(v112 + 32) = v113;
        }
        if (*(_DWORD *)(v113 + 44) == 101)
        {
          v114 = *(_QWORD *)(v113 + 32);
        }
        else
        {
          CoreML::Specification::TreeEnsembleClassifier::clear_ClassLabels(v113);
          *(_DWORD *)(v113 + 44) = 101;
          v114 = operator new();
          CoreML::Specification::Int64Vector::Int64Vector((CoreML::Specification::Int64Vector *)v114);
          *(_QWORD *)(v113 + 32) = v114;
        }
        v115 = *(_QWORD *)&v138[8 * v110];
        v116 = *(_DWORD *)(v114 + 16);
        if (v116 == *(_DWORD *)(v114 + 20))
        {
          google::protobuf::RepeatedField<double>::Reserve((unsigned int *)(v114 + 16), v116 + 1);
          v116 = *(_DWORD *)(v114 + 16);
        }
        v117 = *(_QWORD *)(v114 + 24);
        *(_DWORD *)(v114 + 16) = v116 + 1;
        *(_QWORD *)(v117 + 8 * v116 + 8) = v115;
        ++v110;
      }
      while (v110 < v111);
    }
    CoreML::TreeEnsembles::constructAndValidateTreeEnsembleFromSpec((CoreML::TreeEnsembles *)&v170, *(const CoreML::Specification::Model **)(v144[1] + 8));
    v118 = v171;
    if (v171)
    {
      v119 = (unint64_t *)&v171->__shared_owners_;
      do
        v120 = __ldaxr(v119);
      while (__stlxr(v120 - 1, v119));
      if (!v120)
      {
        ((void (*)(std::__shared_weak_count *))v118->__on_zero_shared)(v118);
        std::__shared_weak_count::__release_weak(v118);
      }
    }
    std::allocate_shared[abi:ne180100]<CoreML::Specification::Model,std::allocator<CoreML::Specification::Model>,CoreML::Specification::Model const&,void>((CoreML::Specification::Model **)&v170, *(const CoreML::Specification::Model **)(v144[1] + 8));
    v121 = (void *)objc_opt_new();
    v147 = 0;
    +[MLTreeEnsembleClassifier loadModelFromSpecification:configuration:error:](MLTreeEnsembleClassifier, "loadModelFromSpecification:configuration:error:", &v170, v121, &v147);
    v122 = objc_claimAutoreleasedReturnValue();
    v123 = v147;

    v124 = (void *)v144[2];
    v144[2] = v122;

    v125 = v171;
    if (v171)
    {
      v126 = (unint64_t *)&v171->__shared_owners_;
      do
        v127 = __ldaxr(v126);
      while (__stlxr(v127 - 1, v126));
      if (!v127)
      {
        ((void (*)(std::__shared_weak_count *))v125->__on_zero_shared)(v125);
        std::__shared_weak_count::__release_weak(v125);
      }
    }
    if (v138)
      operator delete(v138);
    if (v137)
      operator delete(v137);
  }

  return v144;
}

- (BOOL)_saveModelAssetWithModelToPath:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *trc;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  int v21;
  id v23;
  id v24;
  void *__p;
  char v26;
  int v27;
  void *v28;
  char v29;
  id v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v7;
  objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v30);
  v9 = v30;

  objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("model.pb"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  trc = self->_trc;
  v12 = objc_retainAutorelease(v10);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v12, "fileSystemRepresentation"));
  CoreML::Model::save((uint64_t)&v27, (uint64_t)trc);
  if (v26 < 0)
    operator delete(__p);
  objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("attributes.gk"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB36F8];
  -[MLGKDecisionTree _attributes](self, "_attributes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v15;
  -[MLGKDecisionTree _objectStore](self, "_objectStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v9;
  objc_msgSend(v14, "archivedDataWithRootObject:requiringSecureCoding:error:", v17, 1, &v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v24;

  v23 = v19;
  objc_msgSend(v18, "writeToURL:options:error:", v13, 1, &v23);
  v20 = v23;

  v21 = v27;
  if (v29 < 0)
    operator delete(v28);

  return (v21 & 0xFFFFFFEF) == 0;
}

- (void)_loadModelAssetWithModelAtPath:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
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
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];

  v33[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("model.pb"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("model.mlmodelc"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCompilerOptions defaultOptions](MLCompilerOptions, "defaultOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v7;
  +[MLCompiler compileSpecificationAtURL:toURL:options:error:](MLCompiler, "compileSpecificationAtURL:toURL:options:error:", v26, v6, v8, &v32);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v32;

  if (v9)
  {
    v31 = v10;
    +[MLModelAsset modelAssetWithURL:error:](MLModelAsset, "modelAssetWithURL:error:", v27, &v31);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v31;

    if (v11)
    {
      +[MLModelConfiguration defaultConfiguration](MLModelConfiguration, "defaultConfiguration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v12;
      objc_msgSend(v11, "modelWithConfiguration:error:", v13, &v30);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v30;

      if (v25)
      {
        objc_msgSend(v25, "classifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)&self->_treeClassifier, v22);
        objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("attributes.gk"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v10;
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v24, 2, &v29);
        v14 = v29;

        v15 = (void *)MEMORY[0x1E0CB3710];
        v16 = (void *)MEMORY[0x1E0C99E60];
        v33[0] = objc_opt_class();
        v33[1] = objc_opt_class();
        v33[2] = objc_opt_class();
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setWithArray:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v14;
        objc_msgSend(v15, "unarchivedObjectOfClasses:fromData:error:", v18, v23, &v28);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v28;

        objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLGKDecisionTree set_attributes:](self, "set_attributes:", v20);

        objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLGKDecisionTree set_objectStore:](self, "set_objectStore:", v21);

      }
    }
    else
    {
      v10 = v12;
    }

  }
}

- (id)_makeInferenceFromAnswers:(id)a3 withError:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  MLDictionaryFeatureProvider *v22;
  id v23;
  MLTreeEnsembleClassifier *treeClassifier;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  id obj;
  void *v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v34 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v6);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(v6, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v40 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          v14 = v11;
          objc_msgSend(v14, "doubleValue");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setObject:forKeyedSubscript:", v15, v10);

        }
        else
        {
          -[MLGKDecisionTree _objectStore](self, "_objectStore");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v11);

          -[MLGKDecisionTree _objectStore](self, "_objectStore");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "indexOfObject:", v11);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "doubleValue");
          v21 = v20;

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21);
          v14 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setObject:forKeyedSubscript:", v14, v10);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v7);
  }

  v38 = v34;
  v22 = -[MLDictionaryFeatureProvider initWithDictionary:error:]([MLDictionaryFeatureProvider alloc], "initWithDictionary:error:", v36, &v38);
  v23 = v38;

  treeClassifier = self->_treeClassifier;
  +[MLPredictionOptions defaultOptions](MLPredictionOptions, "defaultOptions");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v23;
  -[MLTreeEnsembleClassifier classify:options:error:](treeClassifier, "classify:options:error:", v22, v25, &v37);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v37;

  v28 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v26, "predictedClass");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "numberWithLongLong:", objc_msgSend(v29, "int64Value"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLGKDecisionTree _objectStore](self, "_objectStore");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectAtIndex:", objc_msgSend(v30, "unsignedIntegerValue"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (void)dealloc
{
  void *trc;
  objc_super v4;

  trc = self->_trc;
  if (trc)
    (*(void (**)(void *, SEL))(*(_QWORD *)trc + 8))(trc, a2);
  v4.receiver = self;
  v4.super_class = (Class)MLGKDecisionTree;
  -[MLGKDecisionTree dealloc](&v4, sel_dealloc);
}

- (NSMutableArray)_attributes
{
  return self->__attributes;
}

- (void)set_attributes:(id)a3
{
  objc_storeStrong((id *)&self->__attributes, a3);
}

- (NSMutableOrderedSet)_objectStore
{
  return self->__objectStore;
}

- (void)set_objectStore:(id)a3
{
  objc_storeStrong((id *)&self->__objectStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__objectStore, 0);
  objc_storeStrong((id *)&self->__attributes, 0);
  objc_storeStrong((id *)&self->_treeClassifier, 0);
}

@end
