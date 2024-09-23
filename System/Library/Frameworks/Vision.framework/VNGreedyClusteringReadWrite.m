@implementation VNGreedyClusteringReadWrite

- (VNGreedyClusteringReadWrite)initWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  VNGreedyClusteringReadWrite *v7;
  VNGreedyClusteringReadWrite *v8;
  unint64_t faceprintRevision;
  unint64_t torsoprintRevision;
  const char *v11;
  size_t v12;
  char *v13;
  char vectorMapReadOnlyFlag;
  const void *v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  VNGreedyClusteringReadWrite *v21;
  void *v23;
  char *v24;
  const void *v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  __int128 v33;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  unint64_t *v43;
  __int128 v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  unint64_t *v48;
  __shared_weak_count *v49;
  unint64_t *v50;
  unint64_t v51;
  std::__shared_weak_count *v52;
  unint64_t *v53;
  unint64_t v54;
  std::__shared_weak_count *v55;
  unint64_t *v56;
  unint64_t v57;
  std::__shared_weak_count *v58;
  unint64_t *v59;
  unint64_t v60;
  objc_super v61;
  FaceClustering *ptr;
  std::__shared_weak_count *v63;
  __int128 v64;
  uint64_t v65;
  std::__shared_weak_count *v66;
  objc_super v67;
  __int128 v68;
  __int128 v69;

  v6 = a3;
  v67.receiver = self;
  v67.super_class = (Class)VNGreedyClusteringReadWrite;
  v7 = -[VNGreedyClusteringReadWrite init](&v67, sel_init);
  v8 = v7;
  if (!v7 || !-[VNGreedyClusteringReadOnly _parseOptions:error:](v7, "_parseOptions:error:", v6, a4))
  {
    v21 = 0;
    goto LABEL_15;
  }
  faceprintRevision = v8->super._faceprintRevision;
  torsoprintRevision = v8->super._torsoprintRevision;
  v11 = -[NSString UTF8String](v8->super._algorithmType, "UTF8String");
  v12 = strlen(v11);
  apple::vision::GreedyClusteringParamsWrapper::createClusteringHacksWrapper(&v65, faceprintRevision, torsoprintRevision, (uint64_t)v11, v12);
  if (!v65)
  {
    if (a4)
    {
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Creating clustering parameters object failed for following face and torsoprint revisions: %lu and %lu and algorithm type: %@"), v8->super._faceprintRevision, v8->super._torsoprintRevision, v8->super._algorithmType);
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v23);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_76:
    v21 = 0;
    goto LABEL_77;
  }
  if (-[NSString isEqualToString:](v8->super._algorithmType, "isEqualToString:", CFSTR("VNClusteringAlgorithm_Greedy")))
  {
    v13 = -[NSString UTF8String](v8->super._cacheFolderPath, "UTF8String");
    vectorMapReadOnlyFlag = v8->super._vectorMapReadOnlyFlag;
    v15 = -[NSData bytes](v8->super._state, "bytes");
    v16 = -[NSData length](v8->super._state, "length");
    v64 = 0uLL;
    if (!v13)
      goto LABEL_33;
    if (v16)
    {
      std::allocate_shared[abi:ne180100]<std::vector<unsigned char>,std::allocator<std::vector<unsigned char>>,unsigned char const* const&,unsigned char const*,void>(&v69, v15, (uint64_t)v15 + v16);
      std::allocate_shared[abi:ne180100]<vision::mod::GreedyClustererFaces,std::allocator<vision::mod::GreedyClustererFaces>,char const*&,std::shared_ptr<std::vector<unsigned char>> &,BOOL &,std::shared_ptr<apple::vision::GreedyClusteringParamsWrapper> const&,void>(&v68, v13, (uint64_t **)&v69, vectorMapReadOnlyFlag, &v65);
      v64 = v68;
      v17 = (std::__shared_weak_count *)*((_QWORD *)&v69 + 1);
      if (*((_QWORD *)&v69 + 1))
      {
        v18 = (unint64_t *)(*((_QWORD *)&v69 + 1) + 8);
        do
          v19 = __ldaxr(v18);
        while (__stlxr(v19 - 1, v18));
        if (!v19)
        {
          ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
          std::__shared_weak_count::__release_weak(v17);
        }
      }
      v20 = v64;
      if (!(_QWORD)v64)
      {
LABEL_33:
        v33 = v64;
        v64 = 0uLL;
        cntrl = (std::__shared_weak_count *)v8->m_ClusteringImpl.__cntrl_;
        v8->m_ClusteringImpl = (shared_ptr<vision::mod::FaceClustering>)v33;
        if (cntrl)
        {
          p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
          do
            v36 = __ldaxr(p_shared_owners);
          while (__stlxr(v36 - 1, p_shared_owners));
          if (!v36)
          {
            ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
            std::__shared_weak_count::__release_weak(cntrl);
          }
        }
        v37 = (std::__shared_weak_count *)*((_QWORD *)&v64 + 1);
        if (*((_QWORD *)&v64 + 1))
        {
          v38 = (unint64_t *)(*((_QWORD *)&v64 + 1) + 8);
          do
            v39 = __ldaxr(v38);
          while (__stlxr(v39 - 1, v38));
          goto LABEL_62;
        }
        goto LABEL_64;
      }
    }
    else
    {
      std::allocate_shared[abi:ne180100]<vision::mod::GreedyClustererFaces,std::allocator<vision::mod::GreedyClustererFaces>,char const*&,std::shared_ptr<apple::vision::GreedyClusteringParamsWrapper> const&,void>(&v69, v13, &v65);
      v64 = v69;
      v20 = v69;
      if (!(_QWORD)v69)
        goto LABEL_33;
    }
    if (!*(_BYTE *)(v20 + 208))
    {
      v40 = (std::__shared_weak_count *)*((_QWORD *)&v64 + 1);
      v64 = 0uLL;
      if (v40)
      {
        v41 = (unint64_t *)&v40->__shared_owners_;
        do
          v42 = __ldaxr(v41);
        while (__stlxr(v42 - 1, v41));
        if (!v42)
        {
          ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
          std::__shared_weak_count::__release_weak(v40);
        }
      }
    }
    goto LABEL_33;
  }
  if (!-[NSString isEqualToString:](v8->super._algorithmType, "isEqualToString:", CFSTR("VNClusteringAlgorithm_GreedyWithTorso")))goto LABEL_64;
  v24 = -[NSString UTF8String](v8->super._cacheFolderPath, "UTF8String");
  v25 = -[NSData bytes](v8->super._state, "bytes");
  v26 = -[NSData length](v8->super._state, "length");
  v64 = 0uLL;
  if (v24)
  {
    if (v26)
    {
      std::allocate_shared[abi:ne180100]<std::vector<unsigned char>,std::allocator<std::vector<unsigned char>>,unsigned char const* const&,unsigned char const*,void>(&v69, v25, (uint64_t)v25 + v26);
      std::allocate_shared[abi:ne180100]<vision::mod::GreedyClustererFacesWithTorso,std::allocator<vision::mod::GreedyClustererFacesWithTorso>,char const*&,std::shared_ptr<std::vector<unsigned char>> &,BOOL &,std::shared_ptr<apple::vision::GreedyClusteringParamsWrapper> const&,void>((uint64_t)&v68);
      std::shared_ptr<vision::mod::ImageAnalyzer>::operator=[abi:ne180100]((uint64_t)&v64, &v68);
      v27 = (std::__shared_weak_count *)*((_QWORD *)&v68 + 1);
      if (*((_QWORD *)&v68 + 1))
      {
        v28 = (unint64_t *)(*((_QWORD *)&v68 + 1) + 8);
        do
          v29 = __ldaxr(v28);
        while (__stlxr(v29 - 1, v28));
        if (!v29)
        {
          ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
          std::__shared_weak_count::__release_weak(v27);
        }
      }
      v30 = (std::__shared_weak_count *)*((_QWORD *)&v69 + 1);
      if (!*((_QWORD *)&v69 + 1))
        goto LABEL_52;
      v31 = (unint64_t *)(*((_QWORD *)&v69 + 1) + 8);
      do
        v32 = __ldaxr(v31);
      while (__stlxr(v32 - 1, v31));
    }
    else
    {
      std::allocate_shared[abi:ne180100]<vision::mod::GreedyClustererFacesWithTorso,std::allocator<vision::mod::GreedyClustererFacesWithTorso>,char const*&,std::shared_ptr<apple::vision::GreedyClusteringParamsWrapper> const&,void>(&v69, v24, &v65);
      std::shared_ptr<vision::mod::ImageAnalyzer>::operator=[abi:ne180100]((uint64_t)&v64, &v69);
      v30 = (std::__shared_weak_count *)*((_QWORD *)&v69 + 1);
      if (!*((_QWORD *)&v69 + 1))
      {
LABEL_52:
        if ((_QWORD)v64)
        {
          if (!*(_BYTE *)(v64 + 216))
          {
            v58 = (std::__shared_weak_count *)*((_QWORD *)&v64 + 1);
            v64 = 0uLL;
            if (v58)
            {
              v59 = (unint64_t *)&v58->__shared_owners_;
              do
                v60 = __ldaxr(v59);
              while (__stlxr(v60 - 1, v59));
              if (!v60)
              {
                ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
                std::__shared_weak_count::__release_weak(v58);
              }
            }
          }
        }
        goto LABEL_54;
      }
      v43 = (unint64_t *)(*((_QWORD *)&v69 + 1) + 8);
      do
        v32 = __ldaxr(v43);
      while (__stlxr(v32 - 1, v43));
    }
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
    goto LABEL_52;
  }
LABEL_54:
  v44 = v64;
  v64 = 0uLL;
  v45 = (std::__shared_weak_count *)v8->m_ClusteringImpl.__cntrl_;
  v8->m_ClusteringImpl = (shared_ptr<vision::mod::FaceClustering>)v44;
  if (v45)
  {
    v46 = (unint64_t *)&v45->__shared_owners_;
    do
      v47 = __ldaxr(v46);
    while (__stlxr(v47 - 1, v46));
    if (!v47)
    {
      ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
      std::__shared_weak_count::__release_weak(v45);
    }
  }
  v37 = (std::__shared_weak_count *)*((_QWORD *)&v64 + 1);
  if (*((_QWORD *)&v64 + 1))
  {
    v48 = (unint64_t *)(*((_QWORD *)&v64 + 1) + 8);
    do
      v39 = __ldaxr(v48);
    while (__stlxr(v39 - 1, v48));
LABEL_62:
    if (!v39)
    {
      ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
      std::__shared_weak_count::__release_weak(v37);
    }
  }
LABEL_64:
  if (v8->m_ClusteringImpl.__ptr_)
  {
    ptr = v8->m_ClusteringImpl.__ptr_;
    v49 = v8->m_ClusteringImpl.__cntrl_;
    v63 = (std::__shared_weak_count *)v49;
    if (v49)
    {
      v50 = (unint64_t *)((char *)v49 + 8);
      do
        v51 = __ldxr(v50);
      while (__stxr(v51 + 1, v50));
    }
    v61.receiver = v8;
    v61.super_class = (Class)VNGreedyClusteringReadWrite;
    -[VNGreedyClusteringReadOnly setGreedyClustererFaces_const:](&v61, sel_setGreedyClustererFaces_const_, &ptr);
    v52 = v63;
    if (v63)
    {
      v53 = (unint64_t *)&v63->__shared_owners_;
      do
        v54 = __ldaxr(v53);
      while (__stlxr(v54 - 1, v53));
      if (!v54)
      {
        ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
        std::__shared_weak_count::__release_weak(v52);
      }
    }
    -[VNGreedyClusteringReadOnly initializeLogging](v8, "initializeLogging");
    v21 = v8;
    goto LABEL_77;
  }
  if (!a4)
    goto LABEL_76;
  +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Error initializing cluster state"));
  v21 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_77:
  v55 = v66;
  if (v66)
  {
    v56 = (unint64_t *)&v66->__shared_owners_;
    do
      v57 = __ldaxr(v56);
    while (__stlxr(v57 - 1, v56));
    if (!v57)
    {
      ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
      std::__shared_weak_count::__release_weak(v55);
    }
  }
LABEL_15:

  return v21;
}

- (int64_t)_cancellableUpdate:(void *)a3 facesToMove:(void *)a4 requestRevision:(unint64_t)a5
{
  int v5;
  id v6;
  int64_t *v7;
  int64_t v8;
  id v10;
  _QWORD v11[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 5248;
  v10 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__VNGreedyClusteringReadWrite__cancellableUpdate_facesToMove_requestRevision___block_invoke;
  v11[3] = &unk_1E4548138;
  v11[4] = self;
  v11[5] = &v12;
  v11[6] = a3;
  v11[7] = a4;
  v5 = VNExecuteBlock(v11, (uint64_t)&v10);
  v6 = v10;
  v7 = v13 + 3;
  if (!v5)
    v7 = &CVML_status_internalError;
  v8 = *v7;

  _Block_object_dispose(&v12, 8);
  return v8;
}

- (id)getClustersWithOptions:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  int v36;
  void *v37;
  uint64_t v38;
  VNClusteringLogger *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  void *v46;
  unint64_t v47;
  void *v48;
  unint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t k;
  uint64_t v55;
  void *v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t m;
  void *v61;
  VNClusteringLogger *clusteringLogger;
  void *v63;
  uint64_t v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  const __CFString *v69;
  uint64_t v70;
  char v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  id obja;
  VNGreedyClusteringReadWrite *v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _QWORD aBlock[6];
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _QWORD *v91[3];
  void (**v92)(vision::mod::ImageDescriptorBufferFloat32 *__hidden);
  void (***v93)(vision::mod::ImageDescriptorBufferFloat32 *__hidden);
  uint64_t v94;
  __n128 (*v95)(__n128 *, __n128 *);
  void (*v96)(uint64_t);
  const char *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  unint64_t v101;
  int v102;
  void *v103;
  void *v104[3];
  void *v105;
  void *v106;
  uint64_t v107;
  int v108;
  _QWORD v109[7];
  void *__p;
  void *v111;
  uint64_t v112;
  void *v113;
  __int128 *v114;
  uint64_t v115;
  uint64_t v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  void *v125;
  void *v126;
  uint64_t v127;
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  uint64_t v132;

  v132 = *MEMORY[0x1E0C80C00];
  v78 = a3;
  -[VNClusteringLogger resetFileNameURLWithCurentDateTime](self->super._clusteringLogger, "resetFileNameURLWithCurentDateTime");
  -[VNClusteringLogger logString:](self->super._clusteringLogger, "logString:", CFSTR("Clustering with greedy algorithm"));
  v126 = 0;
  v125 = 0;
  v127 = 0;
  objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("VNClusterOptionRemoveObjectsFromClustering"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = self;
  if (!v77)
    goto LABEL_72;
  objc_msgSend(v77, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = 0;
  v93 = &v92;
  v94 = 0x4812000000;
  v95 = __Block_byref_object_copy__299;
  v96 = __Block_byref_object_dispose__300;
  v97 = "";
  v98 = 0;
  v99 = 0;
  v100 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    v6 = v77;
    v75 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v121, v131, 16);
    if (v7)
    {
      v8 = 0;
      v9 = 0;
      v10 = 0;
      v11 = *(_QWORD *)v122;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v122 != v11)
            objc_enumerationMutation(v6);
          v13 = objc_msgSend(*(id *)(*((_QWORD *)&v121 + 1) + 8 * i), "faceId");
          v14 = v13;
          if ((unint64_t)v9 >= v10)
          {
            v15 = v9 - v8;
            v16 = v15 + 1;
            if ((unint64_t)(v15 + 1) >> 61)
              std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
            if ((uint64_t)(v10 - (_QWORD)v8) >> 2 > v16)
              v16 = (uint64_t)(v10 - (_QWORD)v8) >> 2;
            if (v10 - (unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8)
              v17 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v17 = v16;
            if (v17)
              v17 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v17);
            else
              v18 = 0;
            v19 = (uint64_t *)(v17 + 8 * v15);
            *v19 = v14;
            v20 = v19 + 1;
            while (v9 != v8)
            {
              v21 = *--v9;
              *--v19 = v21;
            }
            v10 = v17 + 8 * v18;
            if (v8)
              operator delete(v8);
            v8 = v19;
            v9 = v20;
          }
          else
          {
            *v9++ = v13;
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v121, v131, 16);
      }
      while (v7);
      goto LABEL_55;
    }
    goto LABEL_54;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    v22 = v77;
    v75 = v5;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v117, v130, 16);
    if (v23)
    {
      v8 = 0;
      v9 = 0;
      v24 = 0;
      v25 = *(_QWORD *)v118;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v118 != v25)
            objc_enumerationMutation(v22);
          v27 = objc_msgSend(*(id *)(*((_QWORD *)&v117 + 1) + 8 * j), "personId");
          v28 = v27;
          if ((unint64_t)v9 >= v24)
          {
            v29 = v9 - v8;
            v30 = v29 + 1;
            if ((unint64_t)(v29 + 1) >> 61)
              std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
            if ((uint64_t)(v24 - (_QWORD)v8) >> 2 > v30)
              v30 = (uint64_t)(v24 - (_QWORD)v8) >> 2;
            if (v24 - (unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8)
              v31 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v31 = v30;
            if (v31)
              v31 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v31);
            else
              v32 = 0;
            v33 = (uint64_t *)(v31 + 8 * v29);
            *v33 = v28;
            v34 = v33 + 1;
            while (v9 != v8)
            {
              v35 = *--v9;
              *--v33 = v35;
            }
            v24 = v31 + 8 * v32;
            if (v8)
              operator delete(v8);
            v8 = v33;
            v9 = v34;
          }
          else
          {
            *v9++ = v27;
          }
        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v117, v130, 16);
      }
      while (v23);
LABEL_55:

      v5 = v75;
      v113 = 0;
      v114 = (__int128 *)&v113;
      v115 = 0x2020000000;
      v116 = 0;
      v109[0] = MEMORY[0x1E0C809B0];
      v109[1] = 3321888768;
      v109[2] = __60__VNGreedyClusteringReadWrite_getClustersWithOptions_error___block_invoke;
      v109[3] = &unk_1E453C210;
      v109[5] = &v113;
      v109[4] = v81;
      v112 = 0;
      __p = 0;
      v111 = 0;
      std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&__p, v8, (uint64_t)v9, v9 - v8);
      v109[6] = &v92;
      if ((VNExecuteBlock(v109, (uint64_t)a4) & 1) != 0)
      {
        if (*((_QWORD *)v114 + 3) == 128)
        {
          std::vector<std::pair<long long,long long>>::__insert_with_size[abi:ne180100]<std::__wrap_iter<std::pair<long long,long long>*>,std::__wrap_iter<std::pair<long long,long long>*>>((__int128 **)&v125, (uint64_t)v126, (__int128 *)v93[6], (__int128 *)v93[7], ((char *)v93[7] - (char *)v93[6]) >> 4);
          v36 = 0;
LABEL_64:
          if (__p)
          {
            v111 = __p;
            operator delete(__p);
          }
          _Block_object_dispose(&v113, 8);
          if (v8)
            operator delete(v8);
          goto LABEL_68;
        }
        if (a4)
        {
          VNErrorForCVMLStatus(*((id *)v114 + 3));
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      v36 = 1;
      goto LABEL_64;
    }
LABEL_54:
    v8 = 0;
    v9 = 0;
    goto LABEL_55;
  }
  if (a4)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Unexpected type of object for clustering"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v36 = 1;
LABEL_68:
  _Block_object_dispose(&v92, 8);
  if (v98)
  {
    v99 = v98;
    operator delete(v98);
  }

  self = v81;
  if (v36)
  {
    v37 = 0;
    goto LABEL_118;
  }
LABEL_72:
  objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("VNClusterOptionAddObjectsToClustering"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v76, "count");
  objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("VNClusterOptionAddObjectGroupIdsToClustering"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v38)
  {
LABEL_81:
    -[VNGreedyClusteringReadOnly convertUpdatePairsToClusters:](self, "convertUpdatePairsToClusters:", &v125);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNClusteringLogger logString:](self->super._clusteringLogger, "logString:", CFSTR("Clusters:"));
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    v43 = v73;
    v51 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v87, v129, 16);
    if (v51)
    {
      v52 = *(_QWORD *)v88;
      v53 = MEMORY[0x1E0C809B0];
      while (2)
      {
        for (k = 0; k != v51; ++k)
        {
          if (*(_QWORD *)v88 != v52)
            objc_enumerationMutation(v43);
          v55 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * k);
          aBlock[0] = v53;
          aBlock[1] = 3221225472;
          aBlock[2] = __60__VNGreedyClusteringReadWrite_getClustersWithOptions_error___block_invoke_314;
          aBlock[3] = &unk_1E45488F0;
          aBlock[4] = v55;
          aBlock[5] = v81;
          v56 = _Block_copy(aBlock);
          v57 = VNExecuteBlock(v56, (uint64_t)a4);

          if (!v57)
          {

            goto LABEL_116;
          }
        }
        v51 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v87, v129, 16);
        if (v51)
          continue;
        break;
      }
    }

    -[VNClusteringLogger logString:](v81->super._clusteringLogger, "logString:", CFSTR("clusters:"));
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    obja = v43;
    v58 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v82, v128, 16);
    if (v58)
    {
      v59 = *(_QWORD *)v83;
      do
      {
        for (m = 0; m != v58; ++m)
        {
          if (*(_QWORD *)v83 != v59)
            objc_enumerationMutation(obja);
          v61 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * m);
          clusteringLogger = v81->super._clusteringLogger;
          v63 = (void *)MEMORY[0x1E0CB3940];
          v64 = objc_msgSend(v61, "clusterId");
          objc_msgSend(v61, "objects");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "description");
          v66 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v63, "stringWithFormat:", CFSTR("  clusterId: %ld, %s"), v64, objc_msgSend(v66, "UTF8String"));
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          -[VNClusteringLogger logString:](clusteringLogger, "logString:", v67);

        }
        v58 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v82, v128, 16);
      }
      while (v58);
    }

    v43 = obja;
    v37 = v43;
    goto LABEL_117;
  }
  v39 = self->super._clusteringLogger;
  v40 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v76, "description");
  v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v40, "stringWithFormat:", CFSTR("adding faces (%lu): %s"), v38, objc_msgSend(v41, "UTF8String"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNClusteringLogger logString:](v39, "logString:", v42);

  objc_msgSend(v76, "objectAtIndexedSubscript:", 0);
  v43 = (id)objc_claimAutoreleasedReturnValue();
  v108 = 0;
  v114 = 0;
  v113 = 0;
  v115 = 0;
  objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("VNClusterOptionFaceprintRevision"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "unsignedIntegerValue");

  if (!-[NSString isEqualToString:](v81->super._algorithmType, "isEqualToString:", CFSTR("VNClusteringAlgorithm_GreedyWithTorso")))
  {
    objc_msgSend(v43, "faceprint");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "lengthInBytes");

    v105 = 0;
    v106 = 0;
    v107 = 0;
    vision::mod::ImageDescriptorBufferAbstract::ImageDescriptorBufferAbstract((uint64_t)&v92, (_QWORD **)&v105, &v108, v49, 0, 0);
    v103 = 0;
    v92 = &off_1E453A8D0;
    v101 = v49 >> 2;
    v102 = 2;
    +[VNGreedyClusteringReadOnly addFaceObservations:toFaceDescriptorBuffer:](VNGreedyClusteringReadOnly, "addFaceObservations:toFaceDescriptorBuffer:", v76, &v92);
    v50 = -[VNGreedyClusteringReadWrite _cancellableUpdate:facesToMove:requestRevision:](v81, "_cancellableUpdate:facesToMove:requestRevision:", &v92, &v113, v45);
    v92 = &off_1E453A8D0;
    free(v103);
    vision::mod::ImageDescriptorBufferAbstract::~ImageDescriptorBufferAbstract((void **)&v92);
LABEL_77:
    if (v50 == 128)
    {
      std::vector<std::pair<long long,long long>>::__insert_with_size[abi:ne180100]<std::__wrap_iter<std::pair<long long,long long>*>,std::__wrap_iter<std::pair<long long,long long>*>>((__int128 **)&v125, (uint64_t)v126, (__int128 *)v113, v114, ((char *)v114 - (_BYTE *)v113) >> 4);
      if (v113)
      {
        v114 = (__int128 *)v113;
        operator delete(v113);
      }

      self = v81;
      goto LABEL_81;
    }
    if (!a4)
      goto LABEL_114;
    VNErrorForCVMLStatus(v50);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_113:
    *a4 = v68;
    goto LABEL_114;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v43, "faceTorsoprint");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "lengthInBytes");

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
        goto LABEL_114;
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Unexpected type of object for clustering"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_113;
    }
    v47 = objc_msgSend(v43, "lengthInBytes");
  }
  if (!v74)
  {
    if (!a4)
      goto LABEL_114;
    v69 = CFSTR("Faces to add must be accompanied by grouping identifiers when performing clustering in torso mode.");
    v70 = 7;
    goto LABEL_112;
  }
  if (objc_msgSend(v74, "count") != v38)
  {
    if (!a4)
      goto LABEL_114;
    v69 = CFSTR("Faces to add array must be the same size as that of the grouping identifiers array.");
    v70 = 5;
LABEL_112:
    +[VNError errorWithCode:message:underlyingError:](VNError, "errorWithCode:message:underlyingError:", v70, v69, 0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_113;
  }
  v105 = 0;
  v106 = 0;
  v107 = 0;
  memset(v104, 0, sizeof(v104));
  memset(v91, 0, sizeof(v91));
  vision::mod::ImageDescriptorBufferJoint::ImageDescriptorBufferJoint((uint64_t)&v92, v91, &v108, (uint64_t)v104, &v105, v47, 0, 0);
  v102 = 3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[VNGreedyClusteringReadOnly addFaceObservations:withGroupingIdentifiers:toFaceDescriptorBuffer:](VNGreedyClusteringReadOnly, "addFaceObservations:withGroupingIdentifiers:toFaceDescriptorBuffer:", v76, v74, &v92);
LABEL_123:
    v50 = -[VNGreedyClusteringReadWrite _cancellableUpdate:facesToMove:requestRevision:](v81, "_cancellableUpdate:facesToMove:requestRevision:", &v92, &v113, v45);
    v72 = 1;
    goto LABEL_124;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[VNGreedyClusteringReadOnly addPersonData:withGroupingIdentifiers:toFaceDescriptorBuffer:](VNGreedyClusteringReadOnly, "addPersonData:withGroupingIdentifiers:toFaceDescriptorBuffer:", v76, v74, &v92);
    goto LABEL_123;
  }
  if (a4)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Unexpected type of object for clustering"));
    v50 = 0;
    v72 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v50 = 0;
    v72 = 0;
  }
LABEL_124:
  vision::mod::ImageDescriptorBufferJoint::~ImageDescriptorBufferJoint((void **)&v92);
  if (v104[0])
    operator delete(v104[0]);
  if (v105)
  {
    v106 = v105;
    operator delete(v105);
  }
  if ((v72 & 1) != 0)
    goto LABEL_77;
LABEL_114:
  if (v113)
  {
    v114 = (__int128 *)v113;
    operator delete(v113);
  }
LABEL_116:
  v37 = 0;
LABEL_117:

LABEL_118:
  if (v125)
  {
    v126 = v125;
    operator delete(v125);
  }

  return v37;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v3;
  unint64_t v4;

  cntrl = self->m_ClusteringImpl.__cntrl_;
  if (cntrl)
  {
    v3 = (unint64_t *)((char *)cntrl + 8);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 - 1, v3));
    if (!v4)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 14) = 0;
  return self;
}

uint64_t __60__VNGreedyClusteringReadWrite_getClustersWithOptions_error___block_invoke(_QWORD *a1)
{
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = (*(uint64_t (**)(_QWORD, _QWORD *, uint64_t))(**(_QWORD **)(a1[4] + 104) + 192))(*(_QWORD *)(a1[4] + 104), a1 + 7, *(_QWORD *)(a1[6] + 8) + 48);
  return 1;
}

uint64_t __60__VNGreedyClusteringReadWrite_getClustersWithOptions_error___block_invoke_314(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  _QWORD *v10;
  int v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  void *__p;
  _BYTE *v18;
  uint64_t v19;

  objc_msgSend(*(id *)(a1 + 32), "setTotalObjectCount:", (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(*(_QWORD *)(a1 + 40) + 104) + 200))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 104), objc_msgSend(*(id *)(a1 + 32), "clusterId")));
  v2 = objc_msgSend(*(id *)(a1 + 32), "totalObjectCount");
  objc_msgSend(*(id *)(a1 + 32), "objects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = v2 - v4;
  objc_msgSend(*(id *)(a1 + 32), "setShouldUpdateRepresentative:", v2 == v4);
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldUpdateRepresentative") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setShouldUpdateRepresentative:", ((COERCE_UNSIGNED_INT((float)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "totalObjectCount")) ^ COERCE_UNSIGNED_INT((float)v5)) & 0x7F800000) != 0);
  v6 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("  %d: prevcount=%d, curcount=%d, shouldUpdateRep = %d"), objc_msgSend(*(id *)(a1 + 32), "clusterId"), v5, objc_msgSend(*(id *)(a1 + 32), "totalObjectCount"), objc_msgSend(*(id *)(a1 + 32), "shouldUpdateRepresentative"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logString:", v7);

  if (objc_msgSend(*(id *)(a1 + 32), "shouldUpdateRepresentative"))
  {
    __p = 0;
    v18 = 0;
    v19 = 0;
    (*(void (**)(_QWORD, uint64_t, void **, _QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 40) + 104) + 160))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 104), objc_msgSend(*(id *)(a1 + 32), "clusterId"), &__p, 0);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = __p;
    v9 = v18;
    if (v18 != __p)
    {
      v11 = 0;
      v12 = 1374389535 * (int)((unint64_t)(v18 - (_BYTE *)__p) >> 3);
      v13 = (v12 >> 37) + ((unint64_t)v12 >> 63);
      do
      {
        if (v11 >= v13)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

          v11 = 0;
          v9 = v18;
        }
        else
        {
          ++v11;
        }
        ++v10;
      }
      while (v10 != v9);
    }
    objc_msgSend(v8, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setSuggestedIdsForRepresentative:", v15);

    if (__p)
    {
      v18 = __p;
      operator delete(__p);
    }
  }
  return 1;
}

uint64_t __78__VNGreedyClusteringReadWrite__cancellableUpdate_facesToMove_requestRevision___block_invoke(_QWORD *a1)
{
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(**(_QWORD **)(a1[4] + 104) + 16))(*(_QWORD *)(a1[4] + 104), a1[6], a1[7]);
  return 1;
}

@end
