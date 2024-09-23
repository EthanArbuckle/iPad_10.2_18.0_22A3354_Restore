@implementation VNGreedyClusteringReadOnly

- (BOOL)_parseOptions:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  BOOL v22;
  id obj;
  void *v25;
  id v26;
  char v27;

  v6 = a3;
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", v7, CFSTR("VNClusterOptionCacheFolderPath"), v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v27 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "fileExistsAtPath:isDirectory:", v9, &v27);

    if (v27)
      v12 = v11;
    else
      v12 = 0;
    if ((v12 & 1) != 0)
    {
      +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", v8, CFSTR("VNClusterOptionFaceprintRevision"), v6, a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", v8, CFSTR("VNClusterOptionTorsoprintRevision"), v6, a4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          v22 = 0;
LABEL_30:

          goto LABEL_31;
        }
        +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", v7, CFSTR("VNClusterOptionClusteringAlgorithm"), v6, a4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (!v15)
          goto LABEL_25;
        if ((objc_msgSend(v15, "isEqualToString:", CFSTR("VNClusteringAlgorithm_Greedy")) & 1) != 0
          || (objc_msgSend(v16, "isEqualToString:", CFSTR("VNClusteringAlgorithm_GreedyWithTorso")) & 1) != 0)
        {
          v25 = v16;
          v26 = 0;
          v17 = +[VNValidationUtilities getOptionalObject:ofClass:forKey:inOptions:error:](VNValidationUtilities, "getOptionalObject:ofClass:forKey:inOptions:error:", &v26, objc_opt_class(), CFSTR("VNClusterOptionRestoreClusteringState"), v6, a4);
          v18 = v26;
          v19 = v26;
          if (v17)
          {
            obj = v18;
            v20 = v19;
            if (!v19 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", v8, CFSTR("VNClusterOptionVectorMapReadOnlyFlag"), v6, a4);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = v21 != 0;
              v16 = v25;
              if (v21)
              {
                self->_faceprintRevision = objc_msgSend(v13, "unsignedIntegerValue");
                self->_torsoprintRevision = objc_msgSend(v14, "unsignedIntegerValue");
                objc_storeStrong((id *)&self->_algorithmType, v25);
                objc_storeStrong((id *)&self->_cacheFolderPath, v9);
                objc_storeStrong((id *)&self->_state, obj);
                self->_vectorMapReadOnlyFlag = objc_msgSend(v21, "BOOLValue");
              }

              v19 = v20;
              goto LABEL_28;
            }
            v22 = 0;
            v19 = v20;
          }
          else
          {
            v22 = 0;
          }
          v16 = v25;
LABEL_28:

          goto LABEL_29;
        }
        if (a4)
        {
          +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("VNClusterOptionClusteringAlgorithm must be set to either VNClusteringAlgorithm_Greedy or VNClusteringAlgorithm_GreedyWithTorso"));
          v22 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
LABEL_25:
          v22 = 0;
        }
LABEL_29:

        goto LABEL_30;
      }
      v22 = 0;
LABEL_31:

      goto LABEL_32;
    }
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid cache file path: %@"), v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v13);
      v22 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    }
  }
  v22 = 0;
LABEL_32:

  return v22;
}

- (void)initializeLogging
{
  VNClusteringLogger *clusteringLogger;
  VNSuggestionsLogger *suggestionsLogger;
  void *v5;
  id v6;
  char v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  _QWORD v19[5];
  id v20;
  char v21;

  clusteringLogger = self->_clusteringLogger;
  self->_clusteringLogger = 0;

  suggestionsLogger = self->_suggestionsLogger;
  self->_suggestionsLogger = 0;

  if (+[VNClusteringLogger isLogEnabled](VNClusteringLogger, "isLogEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", self->_cacheFolderPath);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __47__VNGreedyClusteringReadOnly_initializeLogging__block_invoke;
    v19[3] = &unk_1E4541ED8;
    v19[4] = self;
    v6 = v5;
    v20 = v6;
    v21 = 1;
    v18 = 0;
    v7 = VNExecuteBlock(v19, (uint64_t)&v18);
    v8 = v18;
    v9 = v8;
    if ((v7 & 1) == 0)
    {
      objc_msgSend(v8, "localizedDescription");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v11 = objc_msgSend(v10, "UTF8String");
      VNValidatedLog(4, (uint64_t)CFSTR("%s"), v12, v13, v14, v15, v16, v17, v11);

    }
  }
}

- (VNGreedyClusteringReadOnly)initWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  VNGreedyClusteringReadOnly *v7;
  VNGreedyClusteringReadOnly *v8;
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
  VNGreedyClusteringReadOnly *v21;
  void *v22;
  char *v23;
  const void *v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  __int128 v32;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  unint64_t *v42;
  __int128 v43;
  std::__shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  unint64_t *v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  std::__shared_weak_count *v52;
  unint64_t *v53;
  unint64_t v54;
  __int128 v55;
  uint64_t v56;
  std::__shared_weak_count *v57;
  objc_super v58;
  __int128 v59;
  __int128 v60;

  v6 = a3;
  v58.receiver = self;
  v58.super_class = (Class)VNGreedyClusteringReadOnly;
  v7 = -[VNGreedyClusteringReadOnly init](&v58, sel_init);
  v8 = v7;
  if (!v7)
  {
    if (a4)
    {
      +[VNError errorForMemoryAllocationFailure](VNError, "errorForMemoryAllocationFailure");
      v21 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    }
LABEL_16:
    v21 = 0;
    goto LABEL_74;
  }
  if (!-[VNGreedyClusteringReadOnly _parseOptions:error:](v7, "_parseOptions:error:", v6, a4))
    goto LABEL_16;
  faceprintRevision = v8->_faceprintRevision;
  torsoprintRevision = v8->_torsoprintRevision;
  v11 = -[NSString UTF8String](v8->_algorithmType, "UTF8String");
  v12 = strlen(v11);
  apple::vision::GreedyClusteringParamsWrapper::createClusteringHacksWrapper(&v56, faceprintRevision, torsoprintRevision, (uint64_t)v11, v12);
  if (!v56)
  {
    if (a4)
    {
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Creating clustering parameters object failed for following face and torsoprint revisions: %lu and %lu and algorith type: %@"), v8->_faceprintRevision, v8->_torsoprintRevision, v8->_algorithmType);
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v22);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_68;
  }
  if (-[NSString isEqualToString:](v8->_algorithmType, "isEqualToString:", CFSTR("VNClusteringAlgorithm_Greedy")))
  {
    v13 = -[NSString UTF8String](v8->_cacheFolderPath, "UTF8String");
    vectorMapReadOnlyFlag = v8->_vectorMapReadOnlyFlag;
    v15 = -[NSData bytes](v8->_state, "bytes");
    v16 = -[NSData length](v8->_state, "length");
    v55 = 0uLL;
    if (!v13)
      goto LABEL_33;
    if (v16)
    {
      std::allocate_shared[abi:ne180100]<std::vector<unsigned char>,std::allocator<std::vector<unsigned char>>,unsigned char const* const&,unsigned char const*,void>(&v60, v15, (uint64_t)v15 + v16);
      std::allocate_shared[abi:ne180100]<vision::mod::GreedyClustererFaces,std::allocator<vision::mod::GreedyClustererFaces>,char const*&,std::shared_ptr<std::vector<unsigned char>> &,BOOL &,std::shared_ptr<apple::vision::GreedyClusteringParamsWrapper> const&,void>(&v59, v13, (uint64_t **)&v60, vectorMapReadOnlyFlag, &v56);
      v55 = v59;
      v17 = (std::__shared_weak_count *)*((_QWORD *)&v60 + 1);
      if (*((_QWORD *)&v60 + 1))
      {
        v18 = (unint64_t *)(*((_QWORD *)&v60 + 1) + 8);
        do
          v19 = __ldaxr(v18);
        while (__stlxr(v19 - 1, v18));
        if (!v19)
        {
          ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
          std::__shared_weak_count::__release_weak(v17);
        }
      }
      v20 = v55;
      if (!(_QWORD)v55)
      {
LABEL_33:
        v32 = v55;
        v55 = 0uLL;
        cntrl = (std::__shared_weak_count *)v8->m_ClusteringImpl_const.__cntrl_;
        v8->m_ClusteringImpl_const = (shared_ptr<const vision::mod::FaceClustering>)v32;
        if (cntrl)
        {
          p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
          do
            v35 = __ldaxr(p_shared_owners);
          while (__stlxr(v35 - 1, p_shared_owners));
          if (!v35)
          {
            ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
            std::__shared_weak_count::__release_weak(cntrl);
          }
        }
        v36 = (std::__shared_weak_count *)*((_QWORD *)&v55 + 1);
        if (*((_QWORD *)&v55 + 1))
        {
          v37 = (unint64_t *)(*((_QWORD *)&v55 + 1) + 8);
          do
            v38 = __ldaxr(v37);
          while (__stlxr(v38 - 1, v37));
          goto LABEL_62;
        }
        goto LABEL_64;
      }
    }
    else
    {
      std::allocate_shared[abi:ne180100]<vision::mod::GreedyClustererFaces,std::allocator<vision::mod::GreedyClustererFaces>,char const*&,std::shared_ptr<apple::vision::GreedyClusteringParamsWrapper> const&,void>(&v60, v13, &v56);
      v55 = v60;
      v20 = v60;
      if (!(_QWORD)v60)
        goto LABEL_33;
    }
    if (!*(_BYTE *)(v20 + 208))
    {
      v39 = (std::__shared_weak_count *)*((_QWORD *)&v55 + 1);
      v55 = 0uLL;
      if (v39)
      {
        v40 = (unint64_t *)&v39->__shared_owners_;
        do
          v41 = __ldaxr(v40);
        while (__stlxr(v41 - 1, v40));
        if (!v41)
        {
          ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
          std::__shared_weak_count::__release_weak(v39);
        }
      }
    }
    goto LABEL_33;
  }
  if (!-[NSString isEqualToString:](v8->_algorithmType, "isEqualToString:", CFSTR("VNClusteringAlgorithm_GreedyWithTorso")))goto LABEL_64;
  v23 = -[NSString UTF8String](v8->_cacheFolderPath, "UTF8String");
  v24 = -[NSData bytes](v8->_state, "bytes");
  v25 = -[NSData length](v8->_state, "length");
  v55 = 0uLL;
  if (v23)
  {
    if (v25)
    {
      std::allocate_shared[abi:ne180100]<std::vector<unsigned char>,std::allocator<std::vector<unsigned char>>,unsigned char const* const&,unsigned char const*,void>(&v60, v24, (uint64_t)v24 + v25);
      std::allocate_shared[abi:ne180100]<vision::mod::GreedyClustererFacesWithTorso,std::allocator<vision::mod::GreedyClustererFacesWithTorso>,char const*&,std::shared_ptr<std::vector<unsigned char>> &,BOOL &,std::shared_ptr<apple::vision::GreedyClusteringParamsWrapper> const&,void>((uint64_t)&v59);
      std::shared_ptr<vision::mod::ImageAnalyzer>::operator=[abi:ne180100]((uint64_t)&v55, &v59);
      v26 = (std::__shared_weak_count *)*((_QWORD *)&v59 + 1);
      if (*((_QWORD *)&v59 + 1))
      {
        v27 = (unint64_t *)(*((_QWORD *)&v59 + 1) + 8);
        do
          v28 = __ldaxr(v27);
        while (__stlxr(v28 - 1, v27));
        if (!v28)
        {
          ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
          std::__shared_weak_count::__release_weak(v26);
        }
      }
      v29 = (std::__shared_weak_count *)*((_QWORD *)&v60 + 1);
      if (!*((_QWORD *)&v60 + 1))
        goto LABEL_52;
      v30 = (unint64_t *)(*((_QWORD *)&v60 + 1) + 8);
      do
        v31 = __ldaxr(v30);
      while (__stlxr(v31 - 1, v30));
    }
    else
    {
      std::allocate_shared[abi:ne180100]<vision::mod::GreedyClustererFacesWithTorso,std::allocator<vision::mod::GreedyClustererFacesWithTorso>,char const*&,std::shared_ptr<apple::vision::GreedyClusteringParamsWrapper> const&,void>(&v60, v23, &v56);
      std::shared_ptr<vision::mod::ImageAnalyzer>::operator=[abi:ne180100]((uint64_t)&v55, &v60);
      v29 = (std::__shared_weak_count *)*((_QWORD *)&v60 + 1);
      if (!*((_QWORD *)&v60 + 1))
      {
LABEL_52:
        if ((_QWORD)v55)
        {
          if (!*(_BYTE *)(v55 + 216))
          {
            v52 = (std::__shared_weak_count *)*((_QWORD *)&v55 + 1);
            v55 = 0uLL;
            if (v52)
            {
              v53 = (unint64_t *)&v52->__shared_owners_;
              do
                v54 = __ldaxr(v53);
              while (__stlxr(v54 - 1, v53));
              if (!v54)
              {
                ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
                std::__shared_weak_count::__release_weak(v52);
              }
            }
          }
        }
        goto LABEL_54;
      }
      v42 = (unint64_t *)(*((_QWORD *)&v60 + 1) + 8);
      do
        v31 = __ldaxr(v42);
      while (__stlxr(v31 - 1, v42));
    }
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
    goto LABEL_52;
  }
LABEL_54:
  v43 = v55;
  v55 = 0uLL;
  v44 = (std::__shared_weak_count *)v8->m_ClusteringImpl_const.__cntrl_;
  v8->m_ClusteringImpl_const = (shared_ptr<const vision::mod::FaceClustering>)v43;
  if (v44)
  {
    v45 = (unint64_t *)&v44->__shared_owners_;
    do
      v46 = __ldaxr(v45);
    while (__stlxr(v46 - 1, v45));
    if (!v46)
    {
      ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
      std::__shared_weak_count::__release_weak(v44);
    }
  }
  v36 = (std::__shared_weak_count *)*((_QWORD *)&v55 + 1);
  if (*((_QWORD *)&v55 + 1))
  {
    v47 = (unint64_t *)(*((_QWORD *)&v55 + 1) + 8);
    do
      v38 = __ldaxr(v47);
    while (__stlxr(v38 - 1, v47));
LABEL_62:
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }
LABEL_64:
  if (!v8->m_ClusteringImpl_const.__ptr_)
  {
    if (a4)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Error initializing cluster state"));
      v21 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_69;
    }
LABEL_68:
    v21 = 0;
    goto LABEL_69;
  }
  -[VNGreedyClusteringReadOnly initializeLogging](v8, "initializeLogging");
  v21 = v8;
LABEL_69:
  v48 = v57;
  if (v57)
  {
    v49 = (unint64_t *)&v57->__shared_owners_;
    do
      v50 = __ldaxr(v49);
    while (__stlxr(v50 - 1, v49));
    if (!v50)
    {
      ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
      std::__shared_weak_count::__release_weak(v48);
    }
  }
LABEL_74:

  return v21;
}

- (void)setGreedyClustererFaces_const:(shared_ptr<const vision::mod::FaceClustering>)a3
{
  __shared_weak_count *v3;
  FaceClustering *v4;
  unint64_t *v5;
  unint64_t v6;
  __shared_weak_count *cntrl;
  unint64_t *v8;
  unint64_t v9;

  v4 = *(FaceClustering **)a3.__ptr_;
  v3 = (__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
  if (v3)
  {
    v5 = (unint64_t *)((char *)v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  cntrl = self->m_ClusteringImpl_const.__cntrl_;
  self->m_ClusteringImpl_const.__ptr_ = v4;
  self->m_ClusteringImpl_const.__cntrl_ = v3;
  if (cntrl)
  {
    v8 = (unint64_t *)((char *)cntrl + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (id)convertUpdatePairsToClusters:(void *)a3
{
  id v4;
  id v5;
  _QWORD *i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  VNCluster *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  for (i = *(_QWORD **)a3; i != *((_QWORD **)a3 + 1); i += 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", i[1]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "arrayWithObject:", v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", i[1]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, v9);
    }

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v5, "allKeys", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v15);
        v17 = objc_alloc_init(VNCluster);
        objc_msgSend(v5, "objectForKeyedSubscript:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[VNCluster setObjects:](v17, "setObjects:", v18);
        -[VNCluster setTotalObjectCount:](v17, "setTotalObjectCount:", objc_msgSend(v18, "count"));
        -[VNCluster setClusterId:](v17, "setClusterId:", (int)objc_msgSend(v16, "intValue"));
        objc_msgSend(v4, "addObject:", v17);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  return v4;
}

- (id)suggestionsForClusterIdsWithFlags:(id)a3 affinityThreshold:(float)a4 error:(id *)a5
{
  char v6;
  VNGreedyClusteringReadOnly *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  char v18;
  id v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  id v31;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  char v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t mm;
  uint64_t v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  void *v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t k;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t m;
  void *v69;
  void *v70;
  id v71;
  id v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t n;
  void *v77;
  uint64_t v78;
  id v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t ii;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t kk;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t jj;
  void *context;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  VNGreedyClusteringReadOnly *v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  void *v108;
  _BOOL4 v109;
  id v110;
  void *v111;
  void *v112;
  id obj;
  id obja;
  id objb;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  id v152;
  _QWORD v153[9];
  uint64_t v154;
  uint64_t *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t *v159;
  uint64_t v160;
  uint64_t v161;
  void (*v162)(uint64_t);
  const char *v163;
  void *__p;
  void *v165;
  uint64_t v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  id v171;
  _QWORD v172[7];
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  id v177;
  _QWORD v178[6];
  _QWORD v179[7];
  _QWORD *v180[2];
  _BYTE v181[128];
  _BYTE v182[128];
  _BYTE v183[128];
  _BYTE v184[128];
  _BYTE v185[128];
  _BYTE v186[128];
  _BYTE v187[128];
  _BYTE v188[128];
  _BYTE v189[128];
  _BYTE v190[128];
  _BYTE v191[128];
  uint64_t v192;

  v192 = *MEMORY[0x1E0C80C00];
  v98 = a3;
  context = (void *)MEMORY[0x1A1B0B060]();
  -[VNClusteringLogger resetFileNameURLWithCurentDateTime](self->_suggestionsLogger, "resetFileNameURLWithCurentDateTime");
  -[VNSuggestionsLogger logInputFaceIdsWithFlags:](self->_suggestionsLogger, "logInputFaceIdsWithFlags:", v98);
  v179[0] = 0;
  v179[1] = v179;
  v179[2] = 0x4812000000;
  v179[3] = __Block_byref_object_copy_;
  v179[4] = __Block_byref_object_dispose_;
  v180[1] = 0;
  v180[0] = 0;
  v179[5] = "";
  v179[6] = v180;
  v178[0] = MEMORY[0x1E0C809B0];
  v178[1] = 3221225472;
  v178[2] = __88__VNGreedyClusteringReadOnly_suggestionsForClusterIdsWithFlags_affinityThreshold_error___block_invoke;
  v178[3] = &unk_1E4543480;
  v178[4] = self;
  v178[5] = v179;
  v177 = 0;
  v6 = VNExecuteBlock(v178, (uint64_t)&v177);
  v7 = self;
  v8 = v177;
  if ((v6 & 1) == 0)
  {
    v30 = 0;
    goto LABEL_20;
  }
  v9 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(v98, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = v7;
  objc_msgSend(v9, "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(v98, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
  v107 = (void *)objc_claimAutoreleasedReturnValue();

  v96 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v176 = 0u;
  v175 = 0u;
  v174 = 0u;
  v173 = 0u;
  objc_msgSend(v98, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v13;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v173, v191, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v174;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v174 != v15)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v173 + 1) + 8 * i);
        v158 = 0;
        v159 = &v158;
        v160 = 0x2020000000;
        v161 = -1;
        v172[0] = MEMORY[0x1E0C809B0];
        v172[1] = 3221225472;
        v172[2] = __88__VNGreedyClusteringReadOnly_suggestionsForClusterIdsWithFlags_affinityThreshold_error___block_invoke_2;
        v172[3] = &unk_1E4547408;
        v172[6] = &v158;
        v172[4] = v103;
        v172[5] = v17;
        v171 = v8;
        v18 = VNExecuteBlock(v172, (uint64_t)&v171);
        v19 = v171;

        v8 = v19;
        if ((v18 & 1) == 0)
        {
          _Block_object_dispose(&v158, 8);
          v13 = obj;
          goto LABEL_17;
        }
        if ((v159[3] & 0x8000000000000000) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "objectForKey:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21 == 0;

          if (v22)
          {
            v23 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v159[3]);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v108, "setObject:forKeyedSubscript:", v23, v24);

            v25 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v159[3]);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v107, "setObject:forKeyedSubscript:", v25, v26);

            objc_msgSend(v98, "objectForKeyedSubscript:", v17);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "isEqual:", MEMORY[0x1E0C9AAA0]);

            if (v28)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v159[3]);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v96, "addObject:", v29);

            }
          }
        }
        _Block_object_dispose(&v158, 8);
      }
      v13 = obj;
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v173, v191, 16);
      if (v14)
        continue;
      break;
    }
  }
LABEL_17:

  if (v8)
    goto LABEL_18;
  v169 = 0u;
  v170 = 0u;
  v167 = 0u;
  v168 = 0u;
  objc_msgSend(v108, "allKeys");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v167, v190, 16);
  if (!v34)
  {

LABEL_56:
    -[VNSuggestionsLogger logAllSuggestons:](v103->_suggestionsLogger, "logAllSuggestons:", v108);
    -[VNSuggestionsLogger logFilteredByInputQuerySuggestons:](v103->_suggestionsLogger, "logFilteredByInputQuerySuggestons:", v107);
    v110 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v146 = 0u;
    v147 = 0u;
    v144 = 0u;
    v145 = 0u;
    objc_msgSend(v107, "allKeys");
    v97 = (id)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v144, v188, 16);
    if (v53)
    {
      v100 = *(id *)v145;
      do
      {
        v54 = 0;
        v102 = v53;
        do
        {
          if (*(id *)v145 != v100)
            objc_enumerationMutation(v97);
          v106 = v54;
          v55 = *(void **)(*((_QWORD *)&v144 + 1) + 8 * v54);
          v104 = (void *)MEMORY[0x1A1B0B060]();
          objc_msgSend(v107, "objectForKeyedSubscript:", v55);
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          v142 = 0u;
          v143 = 0u;
          v140 = 0u;
          v141 = 0u;
          objc_msgSend(v107, "allKeys");
          objb = (id)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v140, v187, 16);
          if (v56)
          {
            v57 = *(_QWORD *)v141;
            do
            {
              for (j = 0; j != v56; ++j)
              {
                if (*(_QWORD *)v141 != v57)
                  objc_enumerationMutation(objb);
                v59 = *(void **)(*((_QWORD *)&v140 + 1) + 8 * j);
                v60 = objc_msgSend(v55, "unsignedIntegerValue");
                if (v60 != objc_msgSend(v59, "unsignedIntegerValue")
                  && objc_msgSend(v112, "containsObject:", v59))
                {
                  if (objc_msgSend(v110, "count"))
                  {
                    v138 = 0u;
                    v139 = 0u;
                    v136 = 0u;
                    v137 = 0u;
                    v61 = v110;
                    v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v136, v186, 16);
                    if (v62)
                    {
                      v63 = *(_QWORD *)v137;
                      while (2)
                      {
                        for (k = 0; k != v62; ++k)
                        {
                          if (*(_QWORD *)v137 != v63)
                            objc_enumerationMutation(v61);
                          v65 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * k);
                          if (objc_msgSend(v65, "containsObject:", v55))
                          {
                            objc_msgSend(v65, "addObject:", v59);
                            goto LABEL_89;
                          }
                        }
                        v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v136, v186, 16);
                        if (v62)
                          continue;
                        break;
                      }
                    }

                    v134 = 0u;
                    v135 = 0u;
                    v132 = 0u;
                    v133 = 0u;
                    v61 = v61;
                    v66 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v132, v185, 16);
                    if (v66)
                    {
                      v67 = *(_QWORD *)v133;
                      while (2)
                      {
                        for (m = 0; m != v66; ++m)
                        {
                          if (*(_QWORD *)v133 != v67)
                            objc_enumerationMutation(v61);
                          v69 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * m);
                          if (objc_msgSend(v69, "containsObject:", v59))
                          {
                            objc_msgSend(v69, "addObject:", v55);
                            goto LABEL_89;
                          }
                        }
                        v66 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v132, v185, 16);
                        if (v66)
                          continue;
                        break;
                      }
                    }

                    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v55);
                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v70, "addObject:", v59);
                    objc_msgSend(v61, "addObject:", v70);
                    v61 = v70;
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v55);
                    v61 = (id)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v61, "addObject:", v59);
                    objc_msgSend(v110, "addObject:", v61);
                  }
LABEL_89:

                }
              }
              v56 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v140, v187, 16);
            }
            while (v56);
          }

          objc_autoreleasePoolPop(v104);
          v54 = v106 + 1;
        }
        while (v106 + 1 != v102);
        v53 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v144, v188, 16);
      }
      while (v53);
    }

    -[VNSuggestionsLogger logConnectedGroups:](v103->_suggestionsLogger, "logConnectedGroups:", v110);
    if (objc_msgSend(v110, "count"))
    {
      v71 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v126 = 0u;
      v127 = 0u;
      v124 = 0u;
      v125 = 0u;
      v72 = v110;
      v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v124, v183, 16);
      if (v73)
      {
        v74 = 0;
        v75 = *(_QWORD *)v125;
        do
        {
          for (n = 0; n != v73; ++n)
          {
            if (*(_QWORD *)v125 != v75)
              objc_enumerationMutation(v72);
            v77 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * n);
            if (objc_msgSend(v77, "count") <= v74)
            {
              if (objc_msgSend(v77, "count") == v74 && (objc_msgSend(v71, "isEqualToSet:", v77) & 1) == 0)
                objc_msgSend(v71, "unionSet:", v77);
            }
            else
            {
              v74 = objc_msgSend(v77, "count");
              v78 = objc_msgSend(v77, "mutableCopy");

              v71 = (id)v78;
            }
          }
          v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v124, v183, 16);
        }
        while (v73);
      }

      if (objc_msgSend(v71, "count"))
      {
        v79 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v118 = 0u;
        v119 = 0u;
        v116 = 0u;
        v117 = 0u;
        v80 = v71;
        v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v116, v181, 16);
        if (v81)
        {
          v82 = *(_QWORD *)v117;
          do
          {
            for (ii = 0; ii != v81; ++ii)
            {
              if (*(_QWORD *)v117 != v82)
                objc_enumerationMutation(v80);
              objc_msgSend(v108, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * ii));
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v79, "unionSet:", v84);

            }
            v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v116, v181, 16);
          }
          while (v81);
        }

        objc_msgSend(v79, "minusSet:", v96);
        objc_msgSend(v79, "allObjects");
        v85 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v79 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v122 = 0u;
        v123 = 0u;
        v120 = 0u;
        v121 = 0u;
        objc_msgSend(v108, "allValues");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v120, v182, 16);
        if (v91)
        {
          v92 = *(_QWORD *)v121;
          do
          {
            for (jj = 0; jj != v91; ++jj)
            {
              if (*(_QWORD *)v121 != v92)
                objc_enumerationMutation(v90);
              objc_msgSend(v79, "unionSet:", *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * jj));
            }
            v91 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v120, v182, 16);
          }
          while (v91);
        }

        objc_msgSend(v79, "minusSet:", v96);
        objc_msgSend(v79, "allObjects");
        v85 = objc_claimAutoreleasedReturnValue();
      }
      v30 = (void *)v85;

    }
    else
    {
      v71 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v130 = 0u;
      v131 = 0u;
      v128 = 0u;
      v129 = 0u;
      objc_msgSend(v108, "allValues");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v128, v184, 16);
      if (v87)
      {
        v88 = *(_QWORD *)v129;
        do
        {
          for (kk = 0; kk != v87; ++kk)
          {
            if (*(_QWORD *)v129 != v88)
              objc_enumerationMutation(v86);
            objc_msgSend(v71, "unionSet:", *(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * kk));
          }
          v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v128, v184, 16);
        }
        while (v87);
      }

      objc_msgSend(v71, "minusSet:", v96);
      objc_msgSend(v71, "allObjects");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[VNSuggestionsLogger logFinalSuggestionsList:](v103->_suggestionsLogger, "logFinalSuggestionsList:", v30);
    v8 = 0;
    goto LABEL_19;
  }
  v99 = v33;
  v101 = v34;
  v8 = 0;
  v105 = *(_QWORD *)v168;
LABEL_27:
  v35 = 0;
  while (1)
  {
    if (*(_QWORD *)v168 != v105)
      objc_enumerationMutation(v99);
    v36 = *(_QWORD *)(*((_QWORD *)&v167 + 1) + 8 * v35);
    v111 = (void *)MEMORY[0x1A1B0B060]();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v158 = 0;
    v159 = &v158;
    v160 = 0x4812000000;
    v161 = (uint64_t)__Block_byref_object_copy__166;
    v162 = __Block_byref_object_dispose__167;
    v163 = "";
    v165 = 0;
    v166 = 0;
    __p = 0;
    v154 = 0;
    v155 = &v154;
    v156 = 0x2020000000;
    v157 = 0;
    v153[0] = MEMORY[0x1E0C809B0];
    v153[1] = 3221225472;
    v153[2] = __88__VNGreedyClusteringReadOnly_suggestionsForClusterIdsWithFlags_affinityThreshold_error___block_invoke_169;
    v153[3] = &unk_1E4541F50;
    v153[4] = v103;
    v153[5] = v36;
    v153[6] = &v154;
    v153[7] = &v158;
    v153[8] = v179;
    v152 = v8;
    v38 = VNExecuteBlock(v153, (uint64_t)&v152);
    obja = v152;

    if ((v38 & 1) != 0)
    {
      v109 = v155[3] == 5248;
      if (v155[3] == 5248)
      {
        v40 = v159[6];
        v41 = v159[7];
        while (v40 != v41)
        {
          LODWORD(v39) = *(_DWORD *)(v40 + 8);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v39);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)v40);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setObject:forKeyedSubscript:", v42, v43);

          v40 += 16;
        }
        v150 = 0u;
        v151 = 0u;
        v148 = 0u;
        v149 = 0u;
        objc_msgSend(v37, "allKeys");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v148, v189, 16);
        if (v45)
        {
          v46 = *(_QWORD *)v149;
          do
          {
            for (mm = 0; mm != v45; ++mm)
            {
              if (*(_QWORD *)v149 != v46)
                objc_enumerationMutation(v44);
              v48 = *(_QWORD *)(*((_QWORD *)&v148 + 1) + 8 * mm);
              objc_msgSend(v108, "objectForKeyedSubscript:", v36);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "addObject:", v48);

              objc_msgSend(v108, "allKeys");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = objc_msgSend(v50, "containsObject:", v48);

              if (v51)
              {
                objc_msgSend(v107, "objectForKeyedSubscript:", v36);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "addObject:", v48);

              }
            }
            v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v148, v189, 16);
          }
          while (v45);
        }
        v8 = obja;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Internal error querying similar faces"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v44);
        v8 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v109 = 0;
      v8 = obja;
    }
    _Block_object_dispose(&v154, 8);
    _Block_object_dispose(&v158, 8);
    if (__p)
    {
      v165 = __p;
      operator delete(__p);
    }

    objc_autoreleasePoolPop(v111);
    if (!v109)
      break;
    if (++v35 == v101)
    {
      v101 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v167, v190, 16);
      if (v101)
        goto LABEL_27;
      break;
    }
  }

  if (!v8)
    goto LABEL_56;
LABEL_18:
  v30 = 0;
LABEL_19:

LABEL_20:
  _Block_object_dispose(v179, 8);
  std::__tree<std::__value_type<long long,std::vector<long long>>,std::__map_value_compare<long long,std::__value_type<long long,std::vector<long long>>,std::less<long long>,true>,std::allocator<std::__value_type<long long,std::vector<long long>>>>::destroy(v180[0]);
  objc_autoreleasePoolPop(context);
  if (v8)
  {
    v31 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v8);
  }
  else
  {
    v31 = v30;
  }

  return v31;
}

- (id)getClusterState:(id *)a3
{
  _QWORD *v3;
  void *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  __n128 (*v13)(__n128 *, __n128 *);
  uint64_t (*v14)(uint64_t);
  const char *v15;
  uint64_t v16;
  std::__shared_weak_count *v17;

  v10 = 0;
  v11 = &v10;
  v12 = 0x4012000000;
  v13 = __Block_byref_object_copy__172;
  v14 = __Block_byref_object_dispose__173;
  v16 = 0;
  v17 = 0;
  v15 = "";
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__VNGreedyClusteringReadOnly_getClusterState___block_invoke;
  v9[3] = &unk_1E4543480;
  v9[4] = self;
  v9[5] = &v10;
  if ((VNExecuteBlock(v9, (uint64_t)a3) & 1) != 0 && (v3 = (_QWORD *)v11[6]) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", *v3, v3[1] - *v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  _Block_object_dispose(&v10, 8);
  v5 = v17;
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  return v4;
}

- (id)getClusteredIds:(id *)a3
{
  void *v5;
  _QWORD *i;
  void *v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  __n128 (*v14)(__n128 *, __n128 *);
  void (*v15)(uint64_t);
  const char *v16;
  void *__p;
  void *v18;
  uint64_t v19;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x4812000000;
  v14 = __Block_byref_object_copy__175;
  v15 = __Block_byref_object_dispose__176;
  v16 = "";
  __p = 0;
  v18 = 0;
  v19 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__VNGreedyClusteringReadOnly_getClusteredIds___block_invoke;
  v10[3] = &unk_1E4543480;
  v10[4] = self;
  v10[5] = &v11;
  if ((VNExecuteBlock(v10, (uint64_t)a3) & 1) != 0)
  {
    for (i = (_QWORD *)v12[6]; i != (_QWORD *)v12[7]; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v7);

    }
    v8 = v5;
  }
  else
  {
    v8 = 0;
  }
  _Block_object_dispose(&v11, 8);
  if (__p)
  {
    v18 = __p;
    operator delete(__p);
  }

  return v8;
}

- (id)getLevel0ClusteredIdsForFaceId:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t *v8;
  uint64_t *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  VNGreedyClusteringReadOnly *v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  _QWORD *(*v29)(_QWORD *, _QWORD *);
  _QWORD *(*v30)(uint64_t);
  uint64_t v31;
  _QWORD v32[3];

  v6 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x4812000000;
  v29 = __Block_byref_object_copy__178;
  v30 = __Block_byref_object_dispose__179;
  v31 = 0;
  v32[0] = v32;
  v32[1] = v32;
  v32[2] = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __67__VNGreedyClusteringReadOnly_getLevel0ClusteredIdsForFaceId_error___block_invoke;
  v17 = &unk_1E4544DA0;
  v20 = &v22;
  v18 = self;
  v7 = v6;
  v19 = v7;
  v21 = &v26;
  if ((VNExecuteBlock(&v14, (uint64_t)a4) & 1) == 0)
    goto LABEL_8;
  if (v23[3] != 5248)
  {
    if (!a4)
      goto LABEL_9;
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    v12 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("getting clusters failed with error: %lld"), v23[3], v14, v15, v16, v17, v18);
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_8:
    a4 = 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", v27[8]);
  a4 = (id *)objc_claimAutoreleasedReturnValue();
  v8 = v27 + 6;
  v9 = (uint64_t *)v27[7];
  if (v9 != v27 + 6)
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v9[2]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a4, "addObject:", v10);

      v9 = (uint64_t *)v9[1];
    }
    while (v9 != v8);
  }
LABEL_9:

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
  std::__list_imp<long long>::clear(v32);

  return a4;
}

- (id)getLevel1ClusteredIdsGroupedByLevel0ClustersForFaceId:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  _QWORD *v18;
  _QWORD *i;
  void *v20;
  uint64_t (**v21)(void *, void *, id, id *);
  void *v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v32[6];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _QWORD aBlock[5];
  id v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  _QWORD *(*v50)(_QWORD *, _QWORD *);
  void (*v51)(uint64_t);
  const char *v52;
  _QWORD **v53;
  _QWORD *v54[3];

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v47 = 0;
    v48 = &v47;
    v49 = 0x4812000000;
    v50 = __Block_byref_object_copy_;
    v51 = __Block_byref_object_dispose_;
    v54[0] = 0;
    v54[1] = 0;
    v52 = "";
    v53 = v54;
    v43 = 0;
    v44 = &v43;
    v45 = 0x2020000000;
    v46 = 0;
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __90__VNGreedyClusteringReadOnly_getLevel1ClusteredIdsGroupedByLevel0ClustersForFaceId_error___block_invoke;
    aBlock[3] = &unk_1E4544DA0;
    aBlock[4] = self;
    v41 = &v47;
    v42 = &v43;
    v9 = v6;
    v40 = v9;
    v10 = _Block_copy(aBlock);
    if ((VNExecuteBlock(v10, (uint64_t)a4) & 1) != 0)
    {
      v11 = (_QWORD *)v48[7];
      if (!v11)
LABEL_10:
        std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
      v12 = v44[3];
      while (1)
      {
        while (1)
        {
          v13 = v11[4];
          if (v12 >= v13)
            break;
          v11 = (_QWORD *)*v11;
          if (!v11)
            goto LABEL_10;
        }
        if (v13 >= v12)
          break;
        v11 = (_QWORD *)v11[1];
        if (!v11)
          goto LABEL_10;
      }
      v16 = v11[6] - v11[5];
      if (v16)
      {
        objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", v16 >> 3);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        v18 = (_QWORD *)v11[5];
        for (i = (_QWORD *)v11[6]; v18 != i; ++v18)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v20);

        }
        v33 = 0;
        v34 = &v33;
        v35 = 0x3032000000;
        v36 = __Block_byref_object_copy__190;
        v37 = __Block_byref_object_dispose__191;
        v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v32[0] = v8;
        v32[1] = 3221225472;
        v32[2] = __90__VNGreedyClusteringReadOnly_getLevel1ClusteredIdsGroupedByLevel0ClustersForFaceId_error___block_invoke_192;
        v32[3] = &unk_1E4541F78;
        v32[4] = self;
        v32[5] = &v33;
        v21 = (uint64_t (**)(void *, void *, id, id *))_Block_copy(v32);
        if (v21[2](v21, v9, v17, a4))
        {
          while (objc_msgSend(v17, "count"))
          {
            objc_msgSend(v17, "firstObject");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v21[2](v21, v22, v17, a4);

            if ((v23 & 1) == 0)
              goto LABEL_21;
          }
          v15 = (id)v34[5];
        }
        else
        {
LABEL_21:
          v15 = 0;
        }

        _Block_object_dispose(&v33, 8);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("getLevel1ClusteredIdsGroupedByLevel0ClustersForFaceId: Level-1 cluster size is zero for a valid clusterID descriptor (%lld)"), v44[3]);
        v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v24 = objc_msgSend(v17, "UTF8String");
        VNValidatedLog(4, (uint64_t)CFSTR("%s"), v25, v26, v27, v28, v29, v30, v24);
        if (a4)
        {
          +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v17);
          v15 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v15 = 0;
        }
      }

    }
    else
    {
      v15 = 0;
    }

    _Block_object_dispose(&v43, 8);
    _Block_object_dispose(&v47, 8);
    std::__tree<std::__value_type<long long,std::vector<long long>>,std::__map_value_compare<long long,std::__value_type<long long,std::vector<long long>>,std::less<long long>,true>,std::allocator<std::__value_type<long long,std::vector<long long>>>>::destroy(v54[0]);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("getLevel1ClusteredIdsGroupedByLevel0ClustersForFaceId: faceId (%@) is not initialized"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v14);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    v15 = 0;
  }

  return v15;
}

- (id)getDistanceBetweenLevel0ClustersWithFaceId:(id)a3 andFaceId:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  v11 = 0;
  if (v8 && v9)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__190;
    v22 = __Block_byref_object_dispose__191;
    v23 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __89__VNGreedyClusteringReadOnly_getDistanceBetweenLevel0ClustersWithFaceId_andFaceId_error___block_invoke;
    v14[3] = &unk_1E4541FA0;
    v14[4] = self;
    v15 = v8;
    v16 = v10;
    v17 = &v18;
    v12 = _Block_copy(v14);
    if ((VNExecuteBlock(v12, (uint64_t)a5) & 1) != 0)
      v11 = (id)v19[5];
    else
      v11 = 0;

    _Block_object_dispose(&v18, 8);
  }

  return v11;
}

- (id)getDistanceBetweenLevel1Clusters:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD aBlock[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count") == 2)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__VNGreedyClusteringReadOnly_getDistanceBetweenLevel1Clusters_error___block_invoke;
    aBlock[3] = &unk_1E45461D0;
    aBlock[4] = self;
    v14 = v7;
    v9 = v8;
    v15 = v9;
    v10 = _Block_copy(aBlock);
    if ((VNExecuteBlock(v10, (uint64_t)a4) & 1) != 0)
      v11 = v9;
    else
      v11 = 0;

  }
  else if (a4)
  {
    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 1, CFSTR("Parameter validation failed for getDistanceBetweenLevel1Clusters"));
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)getAllClustersFromStateAndReturnError:(id *)a3
{
  id v4;
  _QWORD *i;
  _QWORD *v6;
  VNCluster *v7;
  id v8;
  _QWORD *j;
  void *v10;
  void *v11;
  _QWORD *v13;
  _QWORD *v14;
  void **v15;

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  (*(void (**)(_QWORD **__return_ptr))(*(_QWORD *)self->m_ClusteringImpl_const.__ptr_ + 152))(&v13);
  v6 = v13;
  for (i = v14; v6 != i; v6 += 3)
  {
    if (*v6 != v6[1])
    {
      v7 = objc_alloc_init(VNCluster);
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      for (j = (_QWORD *)*v6; j != (_QWORD *)v6[1]; ++j)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *j);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v10);

      }
      -[VNCluster setObjects:](v7, "setObjects:", v8);
      -[VNCluster setTotalObjectCount:](v7, "setTotalObjectCount:", objc_msgSend(v8, "count"));
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNCluster setClusterId:](v7, "setClusterId:", objc_msgSend(v11, "unsignedIntegerValue"));

      objc_msgSend(v4, "addObject:", v7);
      i = v14;
    }
  }
  v15 = (void **)&v13;
  std::vector<std::vector<long long>>::__destroy_vector::operator()[abi:ne180100](&v15);
  return v4;
}

- (id)getClustersForClusterIds:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  uint64_t *v23;
  _QWORD *v24;
  VNCluster *v25;
  id v26;
  _QWORD *j;
  void *v28;
  void *v29;
  id v30;
  id v32;
  id v33;
  id obj;
  _QWORD aBlock[6];
  _QWORD v36[7];
  void **v37;
  void ***v38;
  uint64_t v39;
  __n128 (*v40)(__n128 *, __n128 *);
  void (*v41)(uint64_t);
  const char *v42;
  void *__p;
  void *v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  __n128 (*v53)(__n128 *, __n128 *);
  void (*v54)(uint64_t);
  const char *v55;
  _QWORD v56[3];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = v10;
  v50 = 0;
  v51 = &v50;
  v52 = 0x4812000000;
  v53 = __Block_byref_object_copy__214;
  v54 = __Block_byref_object_dispose__215;
  v55 = "";
  memset(v56, 0, sizeof(v56));
  if (v8)
  {
    v32 = v10;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v33 = v8;
    obj = v8;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v47;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v47 != v13)
            objc_enumerationMutation(obj);
          v15 = objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "unsignedIntegerValue");
          v37 = 0;
          v38 = &v37;
          v39 = 0x4812000000;
          v40 = __Block_byref_object_copy__175;
          v41 = __Block_byref_object_dispose__176;
          v42 = "";
          v44 = 0;
          v45 = 0;
          __p = 0;
          v36[0] = MEMORY[0x1E0C809B0];
          v36[1] = 3221225472;
          v36[2] = __69__VNGreedyClusteringReadOnly_getClustersForClusterIds_options_error___block_invoke;
          v36[3] = &unk_1E4548998;
          v36[5] = &v37;
          v36[6] = v15;
          v36[4] = self;
          if ((VNExecuteBlock(v36, (uint64_t)a5) & 1) == 0)
          {
            _Block_object_dispose(&v37, 8);
            if (__p)
            {
              v44 = __p;
              operator delete(__p);
            }

            v8 = v33;
            v11 = v32;
            goto LABEL_28;
          }
          v16 = v51;
          v17 = v51 + 6;
          v18 = (uint64_t)(v38 + 6);
          v19 = v51[7];
          if (v19 >= v51[8])
          {
            v20 = std::vector<std::vector<long long>>::__push_back_slow_path<std::vector<long long> const&>(v17, v18);
          }
          else
          {
            std::vector<std::vector<long long>>::__construct_one_at_end[abi:ne180100]<std::vector<long long> const&>((uint64_t)v17, v18);
            v20 = v19 + 24;
          }
          v16[7] = v20;
          _Block_object_dispose(&v37, 8);
          if (__p)
          {
            v44 = __p;
            operator delete(__p);
          }
        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
        if (v12)
          continue;
        break;
      }
    }

    v8 = v33;
    v11 = v32;
  }
  else
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__VNGreedyClusteringReadOnly_getClustersForClusterIds_options_error___block_invoke_2;
    aBlock[3] = &unk_1E4543480;
    aBlock[4] = self;
    aBlock[5] = &v50;
    v21 = _Block_copy(aBlock);
    v22 = VNExecuteBlock(v21, (uint64_t)a5);

    if (!v22)
    {
LABEL_28:
      v30 = 0;
      goto LABEL_29;
    }
  }
  v23 = v51;
  v24 = (_QWORD *)v51[6];
  if (v24 != (_QWORD *)v51[7])
  {
    do
    {
      if (*v24 != v24[1])
      {
        v25 = objc_alloc_init(VNCluster);
        v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        for (j = (_QWORD *)*v24; j != (_QWORD *)v24[1]; ++j)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *j);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v28);

        }
        -[VNCluster setObjects:](v25, "setObjects:", v26);
        -[VNCluster setTotalObjectCount:](v25, "setTotalObjectCount:", objc_msgSend(v26, "count"));
        objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[VNCluster setClusterId:](v25, "setClusterId:", objc_msgSend(v29, "unsignedIntegerValue"));

        objc_msgSend(v11, "addObject:", v25);
        v23 = v51;
      }
      v24 += 3;
    }
    while (v24 != (_QWORD *)v23[7]);
  }
  v30 = v11;
LABEL_29:
  _Block_object_dispose(&v50, 8);
  v37 = (void **)v56;
  std::vector<std::vector<long long>>::__destroy_vector::operator()[abi:ne180100](&v37);

  return v30;
}

- (id)getDistances:(id)a3 to:(id)a4 error:(id *)a5
{
  uint64_t v8;
  _BOOL4 v9;
  void *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  uint64_t v13;
  id v14;
  void *v15;
  std::__shared_weak_count *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t i;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  double v38;
  uint64_t k;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  int v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  float *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  unint64_t j;
  unint64_t v57;
  void *v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  unint64_t *p_shared_owners;
  unint64_t v65;
  _QWORD *exception;
  uint64_t v68;
  VNGreedyClusteringReadOnly *v69;
  id *v70;
  uint64_t v71;
  std::__shared_weak_count *v72;
  void *v73;
  id v74;
  void *v75;
  unint64_t v76;
  uint64_t v77;
  id v78;
  _QWORD v79[6];
  void *__p;
  void *v81;
  uint64_t v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  float *v87;
  __int128 v88;
  __int128 v89;
  uint64_t v90;
  __n128 (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  const char *v93;
  void *v94[13];
  int v95;
  void *v96;
  void *v97[3];
  _QWORD v98[6];
  uint64_t v99;
  int *v100;
  uint64_t v101;
  int v102;
  _QWORD v103[3];
  void *v104[13];
  int v105;
  void *v106;
  __int128 v107;
  int v108;
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v74 = a3;
  v78 = a4;
  v8 = objc_msgSend(v78, "count");
  if (!v8)
  {
    v14 = (id)MEMORY[0x1E0C9AA70];
    goto LABEL_92;
  }
  v9 = -[NSString isEqualToString:](self->_algorithmType, "isEqualToString:", CFSTR("VNClusteringAlgorithm_GreedyWithTorso"));
  v108 = 0;
  objc_msgSend(v78, "objectAtIndexedSubscript:", 0);
  v107 = 0uLL;
  v89 = 0uLL;
  v90 = 0;
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "faceprint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "lengthInBytes");
  vision::mod::ImageDescriptorBufferAbstract::ImageDescriptorBufferAbstract((uint64_t)v104, (_QWORD **)&v89, &v108, v11, 0, 0);
  v105 = 1;
  v106 = 0;
  v104[0] = &off_1E453A8D0;
  v104[12] = (void *)(v11 >> 2);

  v105 = 2;
  +[VNGreedyClusteringReadOnly addFaceObservations:toFaceDescriptorBuffer:](VNGreedyClusteringReadOnly, "addFaceObservations:toFaceDescriptorBuffer:", v78, v104);
  memset(v103, 0, sizeof(v103));
  v99 = 0;
  v100 = (int *)&v99;
  v101 = 0x2020000000;
  v102 = 0;
  v98[0] = MEMORY[0x1E0C809B0];
  v98[1] = 3221225472;
  v98[2] = __52__VNGreedyClusteringReadOnly_getDistances_to_error___block_invoke;
  v98[3] = &unk_1E4543480;
  v98[5] = &v99;
  v98[4] = self;
  if ((VNExecuteBlock(v98, (uint64_t)a5) & 1) != 0)
  {
    if (v9)
    {
      v12 = 0;
      v13 = 0;
      v100[6] /= 2;
    }
    else
    {
      vision::mod::descriptorBufferUnpackedScores(&v89, v104, (uint64_t)v103, v100[6]);
      v12 = (std::__shared_weak_count *)*((_QWORD *)&v89 + 1);
      v13 = v89;
      v107 = v89;
      *(_DWORD *)(v89 + 104) = 2;
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    memset(v97, 0, sizeof(v97));
    v72 = v12;
    if (v74)
    {
      *(_QWORD *)&v89 = 0;
      *((_QWORD *)&v89 + 1) = &v89;
      v90 = 0xA812000000;
      v91 = __Block_byref_object_copy__220;
      v92 = __Block_byref_object_dispose__221;
      v93 = "";
      v87 = 0;
      v88 = 0uLL;
      v17 = v100[6];
      vision::mod::ImageDescriptorBufferAbstract::ImageDescriptorBufferAbstract((uint64_t)v94, (_QWORD **)&v87, &v108, 4 * v17, 0, 0);
      v95 = 1;
      v96 = 0;
      v94[0] = &off_1E453A8D0;
      v94[12] = (void *)(v17 & 0x3FFFFFFFFFFFFFFFLL);
      *(_DWORD *)(*((_QWORD *)&v89 + 1) + 152) = 2;
      v83 = 0u;
      v84 = 0u;
      v85 = 0u;
      v86 = 0u;
      v18 = v74;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v83, v109, 16);
      v69 = self;
      v70 = a5;
      v68 = v13;
      v76 = v8;
      v20 = 0;
      v21 = 0;
      if (v19)
      {
        v22 = 0;
        v23 = *(_QWORD *)v84;
        v24 = v18;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v84 != v23)
              objc_enumerationMutation(v18);
            v26 = objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * i), "unsignedIntegerValue");
            v27 = v26;
            if ((unint64_t)v21 >= v22)
            {
              v28 = v21 - v20;
              v29 = v28 + 1;
              if ((unint64_t)(v28 + 1) >> 61)
                std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
              if ((uint64_t)(v22 - (_QWORD)v20) >> 2 > v29)
                v29 = (uint64_t)(v22 - (_QWORD)v20) >> 2;
              if (v22 - (unint64_t)v20 >= 0x7FFFFFFFFFFFFFF8)
                v30 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v30 = v29;
              if (v30)
                v30 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v30);
              else
                v31 = 0;
              v32 = (uint64_t *)(v30 + 8 * v28);
              *v32 = v27;
              v33 = v32 + 1;
              while (v21 != v20)
              {
                v34 = *--v21;
                *--v32 = v34;
              }
              v22 = v30 + 8 * v31;
              if (v20)
                operator delete(v20);
              v20 = v32;
              v21 = v33;
              v18 = v24;
            }
            else
            {
              *v21++ = v26;
            }
          }
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v83, v109, 16);
        }
        while (v19);
      }

      v79[0] = MEMORY[0x1E0C809B0];
      v79[1] = 3321888768;
      v79[2] = __52__VNGreedyClusteringReadOnly_getDistances_to_error___block_invoke_223;
      v79[3] = &unk_1E453C1A0;
      v79[4] = v69;
      __p = 0;
      v81 = 0;
      v82 = 0;
      std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&__p, v20, (uint64_t)v21, v21 - v20);
      v79[5] = &v89;
      if ((VNExecuteBlock(v79, (uint64_t)v70) & 1) == 0)
      {
        if (__p)
        {
          v81 = __p;
          operator delete(__p);
        }
        if (v20)
          operator delete(v20);
        _Block_object_dispose(&v89, 8);
        v94[0] = &off_1E453A8D0;
        free(v96);
        vision::mod::ImageDescriptorBufferAbstract::~ImageDescriptorBufferAbstract(v94);
        v14 = 0;
        goto LABEL_81;
      }
      if (v68)
        (*(void (**)(float **__return_ptr))(*(_QWORD *)v68 + 80))(&v87);
      else
        vision::mod::ImageDescriptorBufferFloat32::computeDistancesFrom((vision::mod::ImageDescriptorBufferFloat32 *)v104, (vDSP_Length *)(*((_QWORD *)&v89 + 1) + 48), &v87);
      if (v97[0])
        operator delete(v97[0]);
      v52 = v87;
      v97[0] = v87;
      v71 = v88;
      *(_OWORD *)&v97[1] = v88;
      if (objc_msgSend(v18, "count") * v76 == (v71 - (uint64_t)v52) >> 2)
      {
        v53 = 0;
        if (v76 <= 1)
          v54 = 1;
        else
          v54 = v76;
        do
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          for (j = 0; ; ++j)
          {
            v57 = objc_msgSend(v18, "count");
            v58 = (void *)MEMORY[0x1E0CB37E8];
            if (v57 <= j)
              break;
            *(float *)&v59 = v52[j + v53 * objc_msgSend(v18, "count")];
            objc_msgSend(v58, "numberWithFloat:", v59);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectAtIndexedSubscript:", j);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "setObject:forKeyedSubscript:", v60, v61);

          }
          objc_msgSend(v78, "objectAtIndexedSubscript:", v53);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "numberWithUnsignedInteger:", objc_msgSend(v62, "faceId"));
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "setObject:forKeyedSubscript:", v55, v63);

          ++v53;
        }
        while (v53 != v54);
      }
      if (__p)
      {
        v81 = __p;
        operator delete(__p);
      }
      if (v20)
        operator delete(v20);
      _Block_object_dispose(&v89, 8);
      v94[0] = &off_1E453A8D0;
      free(v96);
      vision::mod::ImageDescriptorBufferAbstract::~ImageDescriptorBufferAbstract(v94);
    }
    else
    {
      if (v13)
        (*(void (**)(__int128 *__return_ptr, uint64_t))(*(_QWORD *)v13 + 96))(&v89, v13);
      else
        vision::mod::ImageDescriptorBufferFloat32::computeSelfDistances((uint64_t)v104, &v89);
      v35 = v13;
      *(_OWORD *)v97 = v89;
      v97[2] = (void *)v90;
      v36 = 0;
      v77 = v89;
      do
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        for (k = 0; k != v8; ++k)
        {
          v40 = (void *)MEMORY[0x1E0CB37E8];
          if (v36 == k)
          {
            objc_msgSend(v78, "objectAtIndexedSubscript:", v36);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "numberWithUnsignedInteger:", objc_msgSend(v41, "faceId"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setObject:forKeyedSubscript:", &unk_1E459C400, v42);
          }
          else
          {
            LODWORD(v38) = 0;
            if ((_DWORD)v36 != (_DWORD)k)
            {
              v43 = *(_DWORD *)(v35 + 72);
              if (v43 <= (int)v36 || v43 <= (int)k)
              {
                exception = __cxa_allocate_exception(8uLL);
                *exception = 3692;
                __cxa_throw(exception, MEMORY[0x1E0DE4F28], 0);
              }
              if ((int)v36 <= (int)k)
                v45 = k;
              else
                v45 = v36;
              if ((int)v36 >= (int)k)
                v46 = k;
              else
                v46 = v36;
              LODWORD(v38) = *(_DWORD *)(v77 + 4 * (v46 + (v45 - 1) * v45 / 2));
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v38);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v78, "objectAtIndexedSubscript:", k);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "numberWithUnsignedInteger:", objc_msgSend(v42, "faceId"));
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setObject:forKeyedSubscript:", v41, v48);

          }
        }
        v49 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v78, "objectAtIndexedSubscript:", v36);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "numberWithUnsignedInteger:", objc_msgSend(v50, "faceId"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "setObject:forKeyedSubscript:", v37, v51);

        ++v36;
      }
      while (v36 != v8);
    }
    v14 = v75;
LABEL_81:
    if (v97[0])
      operator delete(v97[0]);

    v15 = (void *)v103[0];
    v16 = v72;
    goto LABEL_84;
  }
  v15 = 0;
  v16 = 0;
  v14 = 0;
LABEL_84:
  _Block_object_dispose(&v99, 8);
  if (v15)
    operator delete(v15);
  v104[0] = &off_1E453A8D0;
  free(v106);
  vision::mod::ImageDescriptorBufferAbstract::~ImageDescriptorBufferAbstract(v104);
  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      v65 = __ldaxr(p_shared_owners);
    while (__stlxr(v65 - 1, p_shared_owners));
    if (!v65)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }

LABEL_92:
  return v14;
}

- (id)maximumFaceIdInModelAndReturnError:(id *)a3
{
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__VNGreedyClusteringReadOnly_maximumFaceIdInModelAndReturnError___block_invoke;
  v5[3] = &unk_1E4543480;
  v5[4] = self;
  v5[5] = &v6;
  if ((VNExecuteBlock(v5, (uint64_t)a3) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v7[3]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)cancelClustering:(id *)a3
{
  (*(void (**)(FaceClustering *, SEL, id *))(*(_QWORD *)self->m_ClusteringImpl_const.__ptr_ + 184))(self->m_ClusteringImpl_const.__ptr_, a2, a3);
  return 1;
}

- (void).cxx_destruct
{
  std::shared_ptr<rtcv::Logger::Target>::~shared_ptr[abi:nn180100]((uint64_t)&self->m_ClusteringImpl_const);
  objc_storeStrong((id *)&self->_ageClassifierFilePath, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_algorithmType, 0);
  objc_storeStrong((id *)&self->_cacheFolderPath, 0);
  objc_storeStrong((id *)&self->_suggestionsLogger, 0);
  objc_storeStrong((id *)&self->_clusteringLogger, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  return self;
}

uint64_t __65__VNGreedyClusteringReadOnly_maximumFaceIdInModelAndReturnError___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 88)
                                                                                                  + 128))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
  return 1;
}

uint64_t __52__VNGreedyClusteringReadOnly_getDistances_to_error___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 88)
                                                                                                  + 168))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
  return 1;
}

uint64_t __52__VNGreedyClusteringReadOnly_getDistances_to_error___block_invoke_223(uint64_t a1)
{
  uint64_t v2;
  void *__p;
  void *v5;
  uint64_t v6;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
  v5 = 0;
  v6 = 0;
  __p = 0;
  std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&__p, *(const void **)(a1 + 48), *(_QWORD *)(a1 + 56), (uint64_t)(*(_QWORD *)(a1 + 56) - *(_QWORD *)(a1 + 48)) >> 3);
  (*(void (**)(uint64_t, void **, uint64_t))(*(_QWORD *)v2 + 176))(v2, &__p, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48);
  if (__p)
  {
    v5 = __p;
    operator delete(__p);
  }
  return 1;
}

uint64_t __69__VNGreedyClusteringReadOnly_getClustersForClusterIds_options_error___block_invoke(_QWORD *a1)
{
  (*(void (**)(_QWORD, _QWORD, uint64_t, _QWORD))(**(_QWORD **)(a1[4] + 88) + 160))(*(_QWORD *)(a1[4] + 88), a1[6], *(_QWORD *)(a1[5] + 8) + 48, 0);
  return 1;
}

uint64_t __69__VNGreedyClusteringReadOnly_getClustersForClusterIds_options_error___block_invoke_2(uint64_t a1)
{
  uint64_t *v2;
  void **v3;
  __int128 v5;
  uint64_t v6;
  void **v7;

  (*(void (**)(__int128 *__return_ptr))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 88) + 144))(&v5);
  v2 = *(uint64_t **)(*(_QWORD *)(a1 + 40) + 8);
  v3 = (void **)(v2 + 6);
  if (v2[6])
  {
    std::vector<std::vector<long long>>::__clear[abi:ne180100](v2 + 6);
    operator delete(*v3);
    *v3 = 0;
    v2[7] = 0;
    v2[8] = 0;
  }
  *((_OWORD *)v2 + 3) = v5;
  v2[8] = v6;
  v6 = 0;
  v5 = 0uLL;
  v7 = (void **)&v5;
  std::vector<std::vector<long long>>::__destroy_vector::operator()[abi:ne180100](&v7);
  return 1;
}

uint64_t __69__VNGreedyClusteringReadOnly_getDistanceBetweenLevel1Clusters_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  double v9;
  _DWORD *v10;
  _DWORD *v11;
  void *v12;
  void *v14;
  void *v15;
  id obj;
  void *__p;
  void *v18;
  uint64_t v19;
  void *v20;
  _DWORD *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  __n128 (*v31)(__n128 *, __n128 *);
  void (*v32)(uint64_t);
  const char *v33;
  void *v34[3];
  _QWORD **v35;
  _QWORD *v36[2];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v36[0] = 0;
  v36[1] = 0;
  v35 = v36;
  (*(void (**)(_QWORD, _QWORD ***))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 88) + 112))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), &v35);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", 1);
  v28 = 0;
  v29 = &v28;
  v30 = 0x4812000000;
  v31 = __Block_byref_object_copy__175;
  v32 = __Block_byref_object_dispose__176;
  v33 = "";
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  std::vector<long long>::vector(v34, objc_msgSend(v15, "count"), &v20);
  *(_QWORD *)v29[6] = 0;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __69__VNGreedyClusteringReadOnly_getDistanceBetweenLevel1Clusters_error___block_invoke_2;
  v27[3] = &unk_1E4541FC8;
  v27[4] = &v28;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v27);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v14;
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v24 != v3)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v20 = 0;
        v21 = 0;
        v22 = 0;
        v6 = objc_msgSend(v5, "unsignedIntegerValue");
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
        v18 = 0;
        v19 = 0;
        __p = 0;
        std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&__p, (const void *)v29[6], v29[7], (v29[7] - v29[6]) >> 3);
        (*(void (**)(uint64_t, uint64_t, void **, _QWORD ***, void **))(*(_QWORD *)v7 + 104))(v7, v6, &__p, &v35, &v20);
        if (__p)
        {
          v18 = __p;
          operator delete(__p);
        }
        v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v10 = v20;
        v11 = v21;
        while (v10 != v11)
        {
          LODWORD(v9) = *v10;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v12);

          ++v10;
        }
        objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v8, v5);

        if (v20)
        {
          v21 = v20;
          operator delete(v20);
        }
      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
    }
    while (v2);
  }

  _Block_object_dispose(&v28, 8);
  if (v34[0])
  {
    v34[1] = v34[0];
    operator delete(v34[0]);
  }

  std::__tree<std::__value_type<long long,std::vector<long long>>,std::__map_value_compare<long long,std::__value_type<long long,std::vector<long long>>,std::less<long long>,true>,std::allocator<std::__value_type<long long,std::vector<long long>>>>::destroy(v36[0]);
  return 1;
}

void __69__VNGreedyClusteringReadOnly_getDistanceBetweenLevel1Clusters_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) + 8 * a3) = objc_msgSend(v5, "unsignedIntegerValue");

}

uint64_t __89__VNGreedyClusteringReadOnly_getDistanceBetweenLevel0ClustersWithFaceId_andFaceId_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  void *v4;
  _QWORD **v6;
  _QWORD *v7[2];
  _QWORD **v8;
  _QWORD *v9[2];

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "logEnabled"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "resetFileNameURLWithCurentDateTime");
    v9[0] = 0;
    v9[1] = 0;
    v8 = v9;
    (*(void (**)(_QWORD, _QWORD ***))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 88) + 112))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), &v8);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "logClusterMapL1:", &v8);
    v7[0] = 0;
    v7[1] = 0;
    v6 = v7;
    (*(void (**)(_QWORD, _QWORD ***))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 88) + 72))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), &v6);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "logClusterMapL0:", &v6);
    std::__tree<std::__value_type<long long,std::vector<long long>>,std::__map_value_compare<long long,std::__value_type<long long,std::vector<long long>>,std::less<long long>,true>,std::allocator<std::__value_type<long long,std::vector<long long>>>>::destroy(v7[0]);
    std::__tree<std::__value_type<long long,std::vector<long long>>,std::__map_value_compare<long long,std::__value_type<long long,std::vector<long long>>,std::less<long long>,true>,std::allocator<std::__value_type<long long,std::vector<long long>>>>::destroy(v9[0]);
  }
  LODWORD(v8) = 0;
  v2 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD ***))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 88)
                                                                       + 96))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), objc_msgSend(*(id *)(a1 + 40), "unsignedLongValue"), objc_msgSend(*(id *)(a1 + 48), "unsignedLongValue"), &v8);
  if (v2 == 5248)
  {
    LODWORD(v3) = (_DWORD)v8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v4);
  if (v2 == 5248)

  return 1;
}

BOOL __90__VNGreedyClusteringReadOnly_getLevel1ClusteredIdsGroupedByLevel0ClustersForFaceId_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD **v15;
  _QWORD *v16[2];

  (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 88) + 112))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "logEnabled"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "resetFileNameURLWithCurentDateTime");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "logClusterMapL1:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48);
    v16[0] = 0;
    v16[1] = 0;
    v15 = v16;
    (*(void (**)(_QWORD, _QWORD ***))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 88) + 72))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), &v15);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "logClusterMapL0:", &v15);
    std::__tree<std::__value_type<long long,std::vector<long long>>,std::__map_value_compare<long long,std::__value_type<long long,std::vector<long long>>,std::less<long long>,true>,std::allocator<std::__value_type<long long,std::vector<long long>>>>::destroy(v16[0]);
  }
  v4 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 88) + 120))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), objc_msgSend(*(id *)(a1 + 40), "longLongValue"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v4;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v4;
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (v5 == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("getLevel1ClusteredIdsGroupedByLevel0ClustersForFaceId: There is no level-1 cluster that contains faceId = %d"), objc_msgSend(*(id *)(a1 + 40), "intValue"));
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = objc_msgSend(v6, "UTF8String");
    VNValidatedLog(4, (uint64_t)CFSTR("%s"), v8, v9, v10, v11, v12, v13, v7);
    if (a2)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v6);
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v5 != -1;
}

BOOL __90__VNGreedyClusteringReadOnly_getLevel1ClusteredIdsGroupedByLevel0ClustersForFaceId_error___block_invoke_192(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7;
  void *v8;

  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "getLevel0ClusteredIdsForFaceId:error:", a2, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v8);
    objc_msgSend(v7, "minusOrderedSet:", v8);
  }

  return v8 != 0;
}

uint64_t __67__VNGreedyClusteringReadOnly_getLevel0ClusteredIdsForFaceId_error___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 88) + 88))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), objc_msgSend(*(id *)(a1 + 40), "unsignedIntValue"), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48);
  return 1;
}

uint64_t __46__VNGreedyClusteringReadOnly_getClusteredIds___block_invoke(uint64_t a1)
{
  (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 88) + 136))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48);
  return 1;
}

uint64_t __46__VNGreedyClusteringReadOnly_getClusterState___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  __int128 v11;

  (*(void (**)(__int128 *__return_ptr))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 88) + 48))(&v11);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = v11;
  v11 = 0uLL;
  v4 = *(std::__shared_weak_count **)(v2 + 56);
  *(_OWORD *)(v2 + 48) = v3;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  v7 = (std::__shared_weak_count *)*((_QWORD *)&v11 + 1);
  if (*((_QWORD *)&v11 + 1))
  {
    v8 = (unint64_t *)(*((_QWORD *)&v11 + 1) + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return 1;
}

uint64_t __88__VNGreedyClusteringReadOnly_suggestionsForClusterIdsWithFlags_affinityThreshold_error___block_invoke(uint64_t a1)
{
  (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 88) + 112))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48);
  return 1;
}

uint64_t __88__VNGreedyClusteringReadOnly_suggestionsForClusterIdsWithFlags_affinityThreshold_error___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 88) + 120))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), objc_msgSend(*(id *)(a1 + 40), "unsignedIntegerValue"));
  return 1;
}

uint64_t __88__VNGreedyClusteringReadOnly_suggestionsForClusterIdsWithFlags_affinityThreshold_error___block_invoke_169(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 88) + 40))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), objc_msgSend(*(id *)(a1 + 40), "unsignedIntegerValue"), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 48);
  return 1;
}

uint64_t __47__VNGreedyClusteringReadOnly_initializeLogging__block_invoke(uint64_t a1)
{
  VNClusteringLogger *v2;
  uint64_t v3;
  void *v4;
  VNSuggestionsLogger *v5;
  uint64_t v6;
  void *v7;
  _QWORD **v9;
  _QWORD *v10[2];
  _QWORD **v11;
  _QWORD *v12[2];
  _QWORD **v13;
  _QWORD *v14[2];
  _QWORD **v15;
  _QWORD *v16[2];

  v2 = -[VNClusteringLogger initWithOptions:logEnabled:]([VNClusteringLogger alloc], "initWithOptions:logEnabled:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  v5 = -[VNSuggestionsLogger initWithOptions:logEnabled:]([VNSuggestionsLogger alloc], "initWithOptions:logEnabled:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v5;

  v16[0] = 0;
  v16[1] = 0;
  v15 = v16;
  (*(void (**)(_QWORD, _QWORD ***))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 88) + 72))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), &v15);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "logClusterMapL0:", &v15);
  v14[0] = 0;
  v14[1] = 0;
  v13 = v14;
  (*(void (**)(_QWORD, _QWORD ***))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 88) + 64))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), &v13);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "logClusterLookupMapL0:", &v13);
  v12[0] = 0;
  v12[1] = 0;
  v11 = v12;
  (*(void (**)(_QWORD, _QWORD ***))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 88) + 112))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), &v11);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "logClusterMapL1:", &v11);
  v10[0] = 0;
  v10[1] = 0;
  v9 = v10;
  (*(void (**)(_QWORD, _QWORD ***))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 88) + 80))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), &v9);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "logClusterLookupMapL1:", &v9);
  std::__tree<std::__value_type<long long,std::vector<long long>>,std::__map_value_compare<long long,std::__value_type<long long,std::vector<long long>>,std::less<long long>,true>,std::allocator<std::__value_type<long long,std::vector<long long>>>>::destroy(v10[0]);
  std::__tree<std::__value_type<long long,std::vector<long long>>,std::__map_value_compare<long long,std::__value_type<long long,std::vector<long long>>,std::less<long long>,true>,std::allocator<std::__value_type<long long,std::vector<long long>>>>::destroy(v12[0]);
  std::__tree<std::__value_type<long long,std::vector<long long>>,std::__map_value_compare<long long,std::__value_type<long long,std::vector<long long>>,std::less<long long>,true>,std::allocator<std::__value_type<long long,std::vector<long long>>>>::destroy(v14[0]);
  std::__tree<std::__value_type<long long,std::vector<long long>>,std::__map_value_compare<long long,std::__value_type<long long,std::vector<long long>>,std::less<long long>,true>,std::allocator<std::__value_type<long long,std::vector<long long>>>>::destroy(v16[0]);
  return 1;
}

+ (id)nonGroupedGroupID
{
  if (+[VNGreedyClusteringReadOnly nonGroupedGroupID]::onceToken != -1)
    dispatch_once(&+[VNGreedyClusteringReadOnly nonGroupedGroupID]::onceToken, &__block_literal_global_141);
  return (id)+[VNGreedyClusteringReadOnly nonGroupedGroupID]::uuid;
}

+ (void)addFaceObservations:(id)a3 toFaceDescriptorBuffer:(void *)a4
{
  void *v5;
  void *v6;
  size_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *DataForKthDescriptor;
  id v16;
  id v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  objc_msgSend(v17, "objectAtIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "faceprint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "lengthInBytes");

  vision::mod::ImageDescriptorBufferAbstract::resizeForDescriptorsCount((vision::mod::ImageDescriptorBufferAbstract *)a4, objc_msgSend(v17, "count"), v7 > 3);
  std::vector<long long>::resize((char **)a4 + 1, objc_msgSend(v17, "count"));
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v17;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = 0;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v12, "faceprint");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "descriptorData");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        DataForKthDescriptor = (void *)vision::mod::ImageDescriptorBufferAbstract::getDataForKthDescriptor((vision::mod::ImageDescriptorBufferAbstract *)a4, v9 + i);
        v16 = objc_retainAutorelease(v14);
        memcpy(DataForKthDescriptor, (const void *)objc_msgSend(v16, "bytes"), v7);
        vision::mod::ImageDescriptorBufferAbstract::setDescriptorIdForKthDescriptor((vision::mod::ImageDescriptorBufferAbstract *)a4, v9 + i, objc_msgSend(v12, "faceId"));

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v9 += i;
    }
    while (v8);
  }

}

+ (void)addFaceObservations:(id)a3 withGroupingIdentifiers:(id)a4 toFaceDescriptorBuffer:(void *)a5
{
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  void *v16;
  unint64_t v17;

  v13 = a3;
  v7 = a4;
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "faceTorsoprint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "lengthInBytes");

  v11 = objc_msgSend(v13, "count");
  vision::mod::ImageDescriptorBufferJoint::resizeForDescriptorsCount((void **)a5, v11, v10 > 3);
  std::vector<long long>::resize((char **)a5 + 1, v11);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __97__VNGreedyClusteringReadOnly_addFaceObservations_withGroupingIdentifiers_toFaceDescriptorBuffer___block_invoke;
  v14[3] = &unk_1E4541F00;
  v16 = a5;
  v17 = v10;
  v12 = v7;
  v15 = v12;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v14);

}

+ (void)addPersonData:(id)a3 withGroupingIdentifiers:(id)a4 toFaceDescriptorBuffer:(void *)a5
{
  id v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  void *v15;
  unint64_t v16;

  v12 = a3;
  v7 = a4;
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "lengthInBytes");

  v10 = objc_msgSend(v12, "count");
  vision::mod::ImageDescriptorBufferJoint::resizeForDescriptorsCount((void **)a5, v10, v9 > 3);
  std::vector<long long>::resize((char **)a5 + 1, v10);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __91__VNGreedyClusteringReadOnly_addPersonData_withGroupingIdentifiers_toFaceDescriptorBuffer___block_invoke;
  v13[3] = &unk_1E4541F28;
  v15 = a5;
  v16 = v9;
  v11 = v7;
  v14 = v11;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v13);

}

+ (id)getRepresentativenessForFaces:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _DWORD *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  __n128 (*v41)(__n128 *, __n128 *);
  void (*v42)(uint64_t);
  const char *v43;
  void *__p;
  void *v45;
  uint64_t v46;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_200);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    v39 = &v38;
    v40 = 0x4812000000;
    v41 = __Block_byref_object_copy__201;
    v42 = __Block_byref_object_dispose__202;
    v43 = "";
    __p = 0;
    v45 = 0;
    v46 = 0;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __66__VNGreedyClusteringReadOnly_getRepresentativenessForFaces_error___block_invoke_204;
    v34[3] = &unk_1E4547408;
    v9 = v8;
    v35 = v9;
    v10 = v7;
    v36 = v10;
    v37 = &v38;
    if ((VNExecuteBlock(v34, (uint64_t)a4) & 1) != 0)
    {
      v33 = v5;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (_DWORD *)v39[6];
      if (v12 != (_DWORD *)v39[7])
      {
        v13 = 0;
        do
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "faceId");
          VNValidatedLog(1, (uint64_t)CFSTR("  face[%lu].representativeness = %.3f"), v16, v17, v18, v19, v20, v21, v15);
          LODWORD(v22) = *v12;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "faceId"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v23, v24);

          ++v12;
          ++v13;
        }
        while (v12 != (_DWORD *)v39[7]);
      }
      v25 = objc_msgSend(v9, "faceId");
      VNValidatedLog(1, (uint64_t)CFSTR("  best rep = %lu"), v26, v27, v28, v29, v30, v31, v25);
      v5 = v33;
    }
    else
    {
      v11 = 0;
    }

    _Block_object_dispose(&v38, 8);
    if (__p)
    {
      v45 = __p;
      operator delete(__p);
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v11;
}

+ (id)clustererModelFileNamesFromState:(id)a3 storedInPath:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  char v11;
  id v12;
  id v13;
  const void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *p_shared_owners;
  unint64_t v28;
  void *v29;
  void *v30;
  id v31;
  id v33;
  const void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  uint64_t v49;
  void *__p[2];
  char v51;
  std::string v52;
  std::string v53;
  char v54;
  int v55;
  uint64_t *v56;
  std::__shared_weak_count *v57;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cache file path is a required parameter"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
      *a5 = v30;

    }
LABEL_19:
    v31 = 0;
    goto LABEL_20;
  }
  v54 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v8, &v54);

  if (v54)
    v11 = v10;
  else
    v11 = 0;
  if ((v11 & 1) == 0)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid cache file path: %@"), v8);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if (!v7)
  {
    if (a5)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("RestoreClusteringState is a required parameter"));
      v31 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  memset(&v53, 0, sizeof(v53));
  memset(&v52, 0, sizeof(v52));
  v12 = objc_retainAutorelease(v8);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v12, "UTF8String"));
  v13 = objc_retainAutorelease(v7);
  v14 = (const void *)objc_msgSend(v13, "bytes");
  v15 = objc_msgSend(v13, "length");
  if (v14 && v15)
  {
    std::allocate_shared[abi:ne180100]<std::vector<unsigned char>,std::allocator<std::vector<unsigned char>>,unsigned char const* const&,unsigned char const*,void>(&v56, v14, (uint64_t)v14 + v15);
    v55 = -1;
    v25 = vision::mod::GreedyClustererFaces::pasreAndVerifyClustererState((uint64_t)__p, *v56, &v53, &v52, &v55, v22, v23, v24);
    close(v55);
    v26 = v57;
    if (v57)
    {
      p_shared_owners = (unint64_t *)&v57->__shared_owners_;
      do
        v28 = __ldaxr(p_shared_owners);
      while (__stlxr(v28 - 1, p_shared_owners));
      if (!v28)
      {
        ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
        std::__shared_weak_count::__release_weak(v26);
      }
    }
  }
  else
  {
    VNValidatedLog(4, (uint64_t)CFSTR("Invalid parameter passed to extract Clusterer model file names\n"), v16, v17, v18, v19, v20, v21, v49);
    v25 = 5244;
  }
  if (v51 < 0)
    operator delete(__p[0]);
  if (v25 == 5248)
    goto LABEL_38;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
  v33 = objc_retainAutorelease(v13);
  v34 = (const void *)objc_msgSend(v33, "bytes");
  v35 = objc_msgSend(v33, "length");
  if (v34 && v35)
  {
    std::allocate_shared[abi:ne180100]<std::vector<unsigned char>,std::allocator<std::vector<unsigned char>>,unsigned char const* const&,unsigned char const*,void>(&v56, v34, (uint64_t)v34 + v35);
    v55 = -1;
    v45 = vision::mod::GreedyClustererFacesWithTorso::pasreAndVerifyClustererState((uint64_t)__p, *v56, &v53, &v52, &v55, v42, v43, v44);
    close(v55);
    v46 = v57;
    if (v57)
    {
      v47 = (unint64_t *)&v57->__shared_owners_;
      do
        v48 = __ldaxr(v47);
      while (__stlxr(v48 - 1, v47));
      if (!v48)
      {
        ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
        std::__shared_weak_count::__release_weak(v46);
      }
    }
  }
  else
  {
    VNValidatedLog(4, (uint64_t)CFSTR("Invalid parameter passed to extract Clusterer model file names\n"), v36, v37, v38, v39, v40, v41, v49);
    v45 = 5244;
  }
  if (v51 < 0)
    operator delete(__p[0]);
  if (v45 == 5248)
  {
LABEL_38:
    v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    _addFileNameInStdStringPathToArray((uint64_t *)&v53, v31);
    _addFileNameInStdStringPathToArray((uint64_t *)&v52, v31);
  }
  else if (a5)
  {
    VNErrorForCVMLStatus((id)v45);
    v31 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = 0;
  }
  if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v52.__r_.__value_.__l.__data_);
  if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v53.__r_.__value_.__l.__data_);
LABEL_20:

  return v31;
}

uint64_t __66__VNGreedyClusteringReadOnly_getRepresentativenessForFaces_error___block_invoke_204(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  uint64_t v4;
  vDSP_Length *v5;
  float *v6;
  float *v7;
  float *v8;
  float v9;
  float *v10;
  float v11;
  _QWORD *v12;
  void *v13;
  __int128 v15;
  uint64_t v16;
  void *v17[13];
  int v18;
  void *v19;
  int v20;

  v20 = 0;
  v15 = 0uLL;
  v16 = 0;
  objc_msgSend(*(id *)(a1 + 32), "faceprint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lengthInBytes");
  vision::mod::ImageDescriptorBufferAbstract::ImageDescriptorBufferAbstract((uint64_t)v17, (_QWORD **)&v15, &v20, v3, 0, 0);
  v18 = 1;
  v19 = 0;
  v17[0] = &off_1E453A8D0;
  v17[12] = (void *)(v3 >> 2);

  v4 = *(_QWORD *)(a1 + 40);
  v18 = 2;
  +[VNGreedyClusteringReadOnly addFaceObservations:toFaceDescriptorBuffer:](VNGreedyClusteringReadOnly, "addFaceObservations:toFaceDescriptorBuffer:", v4, v17);
  v5 = (vDSP_Length *)(*((void *(**)(uint64_t, int, uint64_t))v17[0] + 15))((uint64_t)v17, 1, 0);
  (*((void (**)(vision::mod::ImageDescriptorBufferFloat32 *@<X0>, vDSP_Length *@<X1>, float **@<X8>))v17[0]
   + 10))((vision::mod::ImageDescriptorBufferFloat32 *)v17, v5, (float **)&v15);
  if (v5)
    (*(void (**)(vDSP_Length *))(*v5 + 8))(v5);
  v7 = (float *)*((_QWORD *)&v15 + 1);
  v6 = (float *)v15;
  v8 = std::__minmax_element_impl[abi:ne180100]<std::__wrap_iter<float *>,std::__wrap_iter<float *>,std::__identity,std::__less<void,void>>((float *)v15, *((float **)&v15 + 1));
  v9 = *v8;
  v11 = *v10 - *v8;
  if (v11 < 0.00000011921)
    v11 = 1.0;
  while (v6 != v7)
  {
    *v6 = 1.0 - (float)((float)(*v6 - v9) / v11);
    ++v6;
  }
  v12 = *(_QWORD **)(*(_QWORD *)(a1 + 48) + 8);
  v13 = (void *)v12[6];
  if (v13)
  {
    v12[7] = v13;
    operator delete(v13);
    v12[6] = 0;
    v12[7] = 0;
    v12[8] = 0;
  }
  *((_OWORD *)v12 + 3) = v15;
  v12[8] = v16;
  v17[0] = &off_1E453A8D0;
  free(v19);
  vision::mod::ImageDescriptorBufferAbstract::~ImageDescriptorBufferAbstract(v17);
  return 1;
}

BOOL __66__VNGreedyClusteringReadOnly_getRepresentativenessForFaces_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "faceprint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __91__VNGreedyClusteringReadOnly_addPersonData_withGroupingIdentifiers_toFaceDescriptorBuffer___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *DataForKthDescriptor;
  id v8;
  void *v9;
  double v10;
  __n128 v11;
  __n128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "descriptorData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  DataForKthDescriptor = (void *)vision::mod::ImageDescriptorBufferAbstract::getDataForKthDescriptor(*(vision::mod::ImageDescriptorBufferAbstract **)(a1 + 40), a3);
  v8 = objc_retainAutorelease(v6);
  memcpy(DataForKthDescriptor, (const void *)objc_msgSend(v8, "bytes"), *(_QWORD *)(a1 + 48));
  vision::mod::ImageDescriptorBufferJoint::setAvailableFlagsForKthDescriptor(*(_QWORD *)(a1 + 40), a3, objc_msgSend(v5, "isValidFaceprint"), objc_msgSend(v5, "isValidTorsoprint"));
  v12 = 0uLL;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getUUIDBytes:", &v12);

  v11 = v12;
  *(_QWORD *)&v10 = vision::mod::ImageDescriptorBufferJoint::setSideInfoForKthDescriptor(*(_QWORD *)(a1 + 40), a3, &v11).n128_u64[0];
  vision::mod::ImageDescriptorBufferAbstract::setDescriptorIdForKthDescriptor(*(vision::mod::ImageDescriptorBufferAbstract **)(a1 + 40), a3, objc_msgSend(v5, "personId", v10));

}

void __97__VNGreedyClusteringReadOnly_addFaceObservations_withGroupingIdentifiers_toFaceDescriptorBuffer___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *DataForKthDescriptor;
  id v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  double v15;
  __n128 v16;
  __n128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "faceTorsoprint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "descriptorData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  DataForKthDescriptor = (void *)vision::mod::ImageDescriptorBufferAbstract::getDataForKthDescriptor(*(vision::mod::ImageDescriptorBufferAbstract **)(a1 + 40), a3);
  v9 = objc_retainAutorelease(v7);
  memcpy(DataForKthDescriptor, (const void *)objc_msgSend(v9, "bytes"), *(_QWORD *)(a1 + 48));
  v10 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "faceTorsoprint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isValidFaceprint");
  objc_msgSend(v5, "faceTorsoprint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  vision::mod::ImageDescriptorBufferJoint::setAvailableFlagsForKthDescriptor(v10, a3, v12, objc_msgSend(v13, "isValidTorsoprint"));

  v17 = 0uLL;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "getUUIDBytes:", &v17);

  v16 = v17;
  *(_QWORD *)&v15 = vision::mod::ImageDescriptorBufferJoint::setSideInfoForKthDescriptor(*(_QWORD *)(a1 + 40), a3, &v16).n128_u64[0];
  vision::mod::ImageDescriptorBufferAbstract::setDescriptorIdForKthDescriptor(*(vision::mod::ImageDescriptorBufferAbstract **)(a1 + 40), a3, objc_msgSend(v5, "faceId", v15));

}

void __47__VNGreedyClusteringReadOnly_nonGroupedGroupID__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v2[0] = 0;
  v2[1] = 0;
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v2);
  v1 = (void *)+[VNGreedyClusteringReadOnly nonGroupedGroupID]::uuid;
  +[VNGreedyClusteringReadOnly nonGroupedGroupID]::uuid = v0;

}

@end
