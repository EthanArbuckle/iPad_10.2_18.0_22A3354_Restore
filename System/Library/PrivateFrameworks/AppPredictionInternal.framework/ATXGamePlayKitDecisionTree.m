@implementation ATXGamePlayKitDecisionTree

- (ATXGamePlayKitDecisionTree)init
{
  ATXGamePlayKitDecisionTree *v2;
  ATXGamePlayKitDecisionTree *v3;
  shared_ptr<ATXGamePlayKitCDecisionTree> *p_decisionTree;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  ATXGamePlayKitDecisionNode *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v12;
  ATXGamePlayKitDecisionNode *rootNode;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v18;
  std::__shared_weak_count *v19;
  __int128 v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)ATXGamePlayKitDecisionTree;
  v2 = -[ATXGamePlayKitDecisionTree init](&v21, sel_init);
  v3 = v2;
  if (v2)
  {
    _ZNSt3__115allocate_sharedB8ne180100I27ATXGamePlayKitCDecisionTreeNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v20);
    p_decisionTree = &v2->_decisionTree;
    std::shared_ptr<ATXGamePlayKitCDecisionNode>::operator=[abi:ne180100]((uint64_t)p_decisionTree, &v20);
    v5 = (std::__shared_weak_count *)*((_QWORD *)&v20 + 1);
    if (*((_QWORD *)&v20 + 1))
    {
      v6 = (unint64_t *)(*((_QWORD *)&v20 + 1) + 8);
      do
        v7 = __ldaxr(v6);
      while (__stlxr(v7 - 1, v6));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
    v8 = [ATXGamePlayKitDecisionNode alloc];
    v9 = (std::__shared_weak_count *)*((_QWORD *)p_decisionTree->__ptr_ + 1);
    v18 = *(_QWORD *)p_decisionTree->__ptr_;
    v19 = v9;
    if (v9)
    {
      p_shared_owners = (unint64_t *)&v9->__shared_owners_;
      do
        v11 = __ldxr(p_shared_owners);
      while (__stxr(v11 + 1, p_shared_owners));
    }
    v12 = -[ATXGamePlayKitDecisionNode initWithNode:tree:](v8, "initWithNode:tree:", &v18, v3);
    rootNode = v3->_rootNode;
    v3->_rootNode = (ATXGamePlayKitDecisionNode *)v12;

    v14 = v19;
    if (v19)
    {
      v15 = (unint64_t *)&v19->__shared_owners_;
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    v3->_isInduced = 0;
  }
  return v3;
}

- (ATXGamePlayKitDecisionTree)initWithAttribute:(id)a3
{
  id v5;
  ATXGamePlayKitDecisionTree *v6;
  ATXGamePlayKitDecisionTree *v7;
  ATXGamePlayKitDecisionNode *v8;
  ATXGamePlayKitCDecisionTree *ptr;
  std::__shared_weak_count *v10;
  uint64_t v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  ATXGamePlayKitDecisionNode *v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t v19;
  std::__shared_weak_count *v20;

  v5 = a3;
  v6 = -[ATXGamePlayKitDecisionTree init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)v6->_decisionTree.__ptr_ + 56), a3);
    v8 = [ATXGamePlayKitDecisionNode alloc];
    ptr = v7->_decisionTree.__ptr_;
    v11 = *(_QWORD *)ptr;
    v10 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
    v19 = v11;
    v20 = v10;
    if (v10)
    {
      p_shared_owners = (unint64_t *)&v10->__shared_owners_;
      do
        v13 = __ldxr(p_shared_owners);
      while (__stxr(v13 + 1, p_shared_owners));
    }
    v14 = -[ATXGamePlayKitDecisionNode initWithNode:tree:](v8, "initWithNode:tree:", &v19, v7);
    -[ATXGamePlayKitDecisionTree setRootNode:](v7, "setRootNode:", v14, v19);

    v15 = v20;
    if (v20)
    {
      v16 = (unint64_t *)&v20->__shared_owners_;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    v7->_isInduced = 0;
  }

  return v7;
}

+ (void)configureKeyedArchiver:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setClassName:forClass:", CFSTR("GKDecisionTree"), NSClassFromString(CFSTR("ATXGamePlayKitDecisionTree")));
  objc_msgSend(v3, "setClassName:forClass:", CFSTR("GKRandomSource"), NSClassFromString(CFSTR("ATXGamePlayKitRandomSource")));
  objc_msgSend(v3, "setClassName:forClass:", CFSTR("GKRandomDistribution"), NSClassFromString(CFSTR("ATXGamePlayKitRandomDistribution")));
  objc_msgSend(v3, "setClassName:forClass:", CFSTR("GKARC4RandomSource"), NSClassFromString(CFSTR("ATXGamePlayKitARC4RandomSource")));
  objc_msgSend(v3, "setClassName:forClass:", CFSTR("GKSystemArc4RandomSource"), NSClassFromString(CFSTR("ATXGamePlayKitSystemArc4RandomSource")));

}

+ (void)configureKeyedUnarchiver:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setClass:forClassName:", NSClassFromString(CFSTR("ATXGamePlayKitDecisionTree")), CFSTR("GKDecisionTree"));
  objc_msgSend(v3, "setClass:forClassName:", NSClassFromString(CFSTR("ATXGamePlayKitRandomSource")), CFSTR("GKRandomSource"));
  objc_msgSend(v3, "setClass:forClassName:", NSClassFromString(CFSTR("ATXGamePlayKitRandomDistribution")), CFSTR("GKRandomDistribution"));
  objc_msgSend(v3, "setClass:forClassName:", NSClassFromString(CFSTR("ATXGamePlayKitARC4RandomSource")), CFSTR("GKARC4RandomSource"));
  objc_msgSend(v3, "setClass:forClassName:", NSClassFromString(CFSTR("ATXGamePlayKitSystemArc4RandomSource")), CFSTR("GKSystemArc4RandomSource"));

}

- (ATXGamePlayKitDecisionTree)initWithCoder:(id)a3
{
  id v4;
  ATXGamePlayKitDecisionTree *v5;
  ATXGamePlayKitDecisionTree *v6;
  ATXGamePlayKitCDecisionTree **p_ptr;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSArray *v15;
  id v16;
  ATXGamePlayKitDecisionNode *v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  ATXGamePlayKitDecisionNode *v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  void *v25;
  int v26;
  id v27;
  ATXGamePlayKitCDecisionTree *v28;
  void *v29;
  uint64_t v30;
  MLGKDecisionTree *mlkitDecisionTree;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  uint64_t *v36;
  std::__shared_weak_count *v37;
  uint64_t v38;
  std::__shared_weak_count *v39;
  id v40;
  __int128 v41;
  _QWORD v42[16];

  v42[15] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[ATXGamePlayKitDecisionTree init](self, "init");
  v6 = v5;
  if (v5)
  {
    _ZNSt3__115allocate_sharedB8ne180100I27ATXGamePlayKitCDecisionTreeNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v41);
    p_ptr = &v5->_decisionTree.__ptr_;
    std::shared_ptr<ATXGamePlayKitCDecisionNode>::operator=[abi:ne180100]((uint64_t)&v5->_decisionTree, &v41);
    v8 = (std::__shared_weak_count *)*((_QWORD *)&v41 + 1);
    if (*((_QWORD *)&v41 + 1))
    {
      v9 = (unint64_t *)(*((_QWORD *)&v41 + 1) + 8);
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rand"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXGamePlayKitDecisionTree setRandomSource:](v6, "setRandomSource:", v11);

    v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v42[0] = objc_opt_class();
    v42[1] = objc_opt_class();
    v42[2] = objc_opt_class();
    v42[3] = objc_opt_class();
    v42[4] = objc_opt_class();
    v42[5] = objc_opt_class();
    v42[6] = objc_opt_class();
    v42[7] = objc_opt_class();
    v42[8] = objc_opt_class();
    v42[9] = objc_opt_class();
    v42[10] = objc_opt_class();
    v42[11] = objc_opt_class();
    v42[12] = objc_opt_class();
    v42[13] = objc_opt_class();
    v42[14] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObjectsFromArray:", v13);

    objc_msgSend(v4, "allowedClasses");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "unionSet:", v14);

    v40 = 0;
    objc_msgSend(v4, "decodeTopLevelObjectOfClasses:forKey:error:", v12, CFSTR("tree"), &v40);
    v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v16 = v40;
    NSLog(CFSTR("ATXGamePlayKitDecisionTree: Encountered an error decoding: %@"), v16);
    ATXGamePlayKitCDecisionTree::decode(*p_ptr, v15);
    v17 = [ATXGamePlayKitDecisionNode alloc];
    v18 = (std::__shared_weak_count *)*((_QWORD *)*p_ptr + 1);
    v38 = *(_QWORD *)*p_ptr;
    v39 = v18;
    if (v18)
    {
      p_shared_owners = (unint64_t *)&v18->__shared_owners_;
      do
        v20 = __ldxr(p_shared_owners);
      while (__stxr(v20 + 1, p_shared_owners));
    }
    v21 = -[ATXGamePlayKitDecisionNode initWithNode:tree:](v17, "initWithNode:tree:", &v38, v6);
    -[ATXGamePlayKitDecisionTree setRootNode:](v6, "setRootNode:", v21);

    v22 = v39;
    if (v39)
    {
      v23 = (unint64_t *)&v39->__shared_owners_;
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("induced"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "BOOLValue");
    v6->_isInduced = v26;
    if (v26)
    {
      v27 = objc_alloc(MEMORY[0x1E0C9E928]);
      v28 = *p_ptr;
      v36 = 0;
      v37 = 0;
      ATXGamePlayKitCDecisionTree::encodeWithCoder((uint64_t *)v28, &v36, 0, 0, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v27, "_initWithFlattenedTree:", v29);
      mlkitDecisionTree = v6->mlkitDecisionTree;
      v6->mlkitDecisionTree = (MLGKDecisionTree *)v30;

      v32 = v37;
      if (v37)
      {
        v33 = (unint64_t *)&v37->__shared_owners_;
        do
          v34 = __ldaxr(v33);
        while (__stlxr(v34 - 1, v33));
        if (!v34)
        {
          ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
          std::__shared_weak_count::__release_weak(v32);
        }
      }
    }

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t *ptr;
  void *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  void *v11;
  uint64_t *v12;
  std::__shared_weak_count *v13;

  v4 = a3;
  -[ATXGamePlayKitDecisionTree randomSource](self, "randomSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("rand"));

  ptr = (uint64_t *)self->_decisionTree.__ptr_;
  v12 = 0;
  v13 = 0;
  ATXGamePlayKitCDecisionTree::encodeWithCoder(ptr, &v12, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("tree"));

  v8 = v13;
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isInduced);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("induced"));

}

- (void)dealloc
{
  objc_super v3;

  -[ATXGamePlayKitDecisionTree setRootNode:](self, "setRootNode:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ATXGamePlayKitDecisionTree;
  -[ATXGamePlayKitDecisionTree dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXGamePlayKitDecisionTree)initWithExamples:(id)a3 actions:(id)a4 attributes:(id)a5
{
  return -[ATXGamePlayKitDecisionTree initWithExamples:actions:attributes:maxDepth:minSamplesSplit:](self, "initWithExamples:actions:attributes:maxDepth:minSamplesSplit:", a3, a4, a5, 1000000000, 0);
}

- (ATXGamePlayKitDecisionTree)initWithExamples:(id)a3 actions:(id)a4 attributes:(id)a5 maxDepth:(unint64_t)a6 minSamplesSplit:(unint64_t)a7
{
  return -[ATXGamePlayKitDecisionTree initWithExamples:actions:attributes:maxDepth:minSamplesSplit:ratioForLeafNodeDecision:](self, "initWithExamples:actions:attributes:maxDepth:minSamplesSplit:ratioForLeafNodeDecision:", a3, a4, a5, a6, a7, 0.5);
}

- (ATXGamePlayKitDecisionTree)initWithExamples:(id)a3 actions:(id)a4 attributes:(id)a5 maxDepth:(unint64_t)a6 minSamplesSplit:(unint64_t)a7 ratioForLeafNodeDecision:(double)a8
{
  id v12;
  ATXGamePlayKitDecisionTree *v13;
  ATXGamePlayKitDecisionTree *v14;
  ATXGamePlayKitCDecisionTree *ptr;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  unint64_t v30;
  ATXGamePlayKitCDecisionTree *v31;
  std::__shared_weak_count *v32;
  unint64_t *p_shared_owners;
  unint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  id v38;
  uint64_t *v39;
  void *v40;
  uint64_t v41;
  MLGKDecisionTree *mlkitDecisionTree;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  uint64_t v46;
  void *v47;
  unint64_t *v48;
  shared_ptr<ATXGamePlayKitCDecisionTree> *p_decisionTree;
  id v53;
  id v54;
  uint64_t *v55[2];
  uint64_t v56;
  std::__shared_weak_count *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v54 = a4;
  v53 = a5;
  v13 = -[ATXGamePlayKitDecisionTree init](self, "init");
  v14 = v13;
  if (!v13)
    goto LABEL_37;
  ptr = v13->_decisionTree.__ptr_;
  if (!ptr || !*(_QWORD *)ptr)
    goto LABEL_37;
  v16 = objc_msgSend(v12, "count");
  if (v16 == objc_msgSend(v54, "count"))
  {
    objc_msgSend(v12, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");
    v19 = objc_msgSend(v53, "count");

    if (v18 == v19)
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v12, "count"));
      p_decisionTree = &v14->_decisionTree;
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v21 = v54;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
      if (v22)
      {
        v23 = 0;
        v24 = *(_QWORD *)v59;
        do
        {
          v25 = 0;
          v26 = v23;
          do
          {
            if (*(_QWORD *)v59 != v24)
              objc_enumerationMutation(v21);
            v27 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * v25);
            objc_msgSend(v12, "objectAtIndexedSubscript:", v26 + v25);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "arrayByAddingObject:", v27);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addObject:", v29);

            ++v25;
          }
          while (v22 != v25);
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
          v23 = v26 + v25;
        }
        while (v22);
      }

      if (a6)
        v30 = a6;
      else
        v30 = 1000000000;
      v31 = p_decisionTree->__ptr_;
      v32 = (std::__shared_weak_count *)*((_QWORD *)p_decisionTree->__ptr_ + 1);
      v56 = *(_QWORD *)p_decisionTree->__ptr_;
      v57 = v32;
      if (v32)
      {
        p_shared_owners = (unint64_t *)&v32->__shared_owners_;
        do
          v34 = __ldxr(p_shared_owners);
        while (__stxr(v34 + 1, p_shared_owners));
      }
      ATXGamePlayKitCDecisionTree::cartTreeGrowth(v31, v20, v53, &v56, v30, a7, a8);
      v35 = v57;
      if (v57)
      {
        v36 = (unint64_t *)&v57->__shared_owners_;
        do
          v37 = __ldaxr(v36);
        while (__stlxr(v37 - 1, v36));
        if (!v37)
        {
          ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
          std::__shared_weak_count::__release_weak(v35);
        }
      }
      if (!a7 && v30 == 1000000000)
      {
        v38 = objc_alloc(MEMORY[0x1E0C9E928]);
        v39 = (uint64_t *)p_decisionTree->__ptr_;
        v55[0] = 0;
        v55[1] = 0;
        ATXGamePlayKitCDecisionTree::encodeWithCoder(v39, v55, 0, 0, 0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v38, "_initWithFlattenedTree:", v40);
        mlkitDecisionTree = v14->mlkitDecisionTree;
        v14->mlkitDecisionTree = (MLGKDecisionTree *)v41;

        std::shared_ptr<ATXGamePlayKitCDecisionNode>::~shared_ptr[abi:ne180100]((uint64_t)v55);
        v14->_isInduced = 1;
      }

      goto LABEL_37;
    }
    v46 = objc_msgSend(v53, "count");
    objc_msgSend(v12, "firstObject");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("ATXGamePlayKitDecisionTree: Mismatch between the number of attributes provided: %tu and the number of attributes per example: %tu"), v46, objc_msgSend(v47, "count"));

    _ZNSt3__115allocate_sharedB8ne180100I27ATXGamePlayKitCDecisionTreeNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v62);
    std::shared_ptr<ATXGamePlayKitCDecisionNode>::operator=[abi:ne180100]((uint64_t)&v14->_decisionTree, &v62);
    v43 = (std::__shared_weak_count *)*((_QWORD *)&v62 + 1);
    if (!*((_QWORD *)&v62 + 1))
      goto LABEL_37;
    v48 = (unint64_t *)(*((_QWORD *)&v62 + 1) + 8);
    do
      v45 = __ldaxr(v48);
    while (__stlxr(v45 - 1, v48));
  }
  else
  {
    NSLog(CFSTR("ATXGamePlayKitDecisionTree: Mismatch between the number of actions provided: %tu and the number of examples provided: %tu"), objc_msgSend(v54, "count"), objc_msgSend(v12, "count"));
    _ZNSt3__115allocate_sharedB8ne180100I27ATXGamePlayKitCDecisionTreeNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v62);
    std::shared_ptr<ATXGamePlayKitCDecisionNode>::operator=[abi:ne180100]((uint64_t)&v14->_decisionTree, &v62);
    v43 = (std::__shared_weak_count *)*((_QWORD *)&v62 + 1);
    if (!*((_QWORD *)&v62 + 1))
      goto LABEL_37;
    v44 = (unint64_t *)(*((_QWORD *)&v62 + 1) + 8);
    do
      v45 = __ldaxr(v44);
    while (__stlxr(v45 - 1, v44));
  }
  if (!v45)
  {
    ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
    std::__shared_weak_count::__release_weak(v43);
  }
LABEL_37:

  return v14;
}

- (ATXGamePlayKitDecisionTree)initWithURL:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  ATXGamePlayKitDecisionTree *v11;
  id v12;
  ATXGamePlayKitDecisionTree *v13;
  MLGKDecisionTree *v14;
  MLGKDecisionTree *mlkitDecisionTree;
  ATXGamePlayKitDecisionTree *v16;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1CAA48B6C]();
  v19 = v7;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v6, 2, &v19);
  v10 = v19;

  v18 = v10;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v9, &v18);
  v11 = (ATXGamePlayKitDecisionTree *)objc_claimAutoreleasedReturnValue();
  v12 = v18;

  if (v12 || !v9)
  {
    v13 = objc_alloc_init(ATXGamePlayKitDecisionTree);

    v13->_isInduced = 1;
    v14 = (MLGKDecisionTree *)objc_alloc_init(MEMORY[0x1E0C9E928]);
    mlkitDecisionTree = v13->mlkitDecisionTree;
    v13->mlkitDecisionTree = v14;

    -[MLGKDecisionTree _loadModelAssetWithModelAtPath:withError:](v13->mlkitDecisionTree, "_loadModelAssetWithModelAtPath:withError:", v6, v12);
  }
  else
  {
    v13 = v11;
  }
  v16 = v13;

  objc_autoreleasePoolPop(v8);
  return v16;
}

- (BOOL)exportToURL:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1CAA48B6C]();
  if (self->_isInduced)
  {
    v9 = -[MLGKDecisionTree _saveModelAssetWithModelToPath:withError:](self->mlkitDecisionTree, "_saveModelAssetWithModelToPath:withError:", v6, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v7;
    v9 = objc_msgSend(v10, "writeToURL:options:error:", v6, 1, &v13);
    v11 = v13;

    v7 = v11;
  }
  objc_autoreleasePoolPop(v8);

  return v9;
}

- (id)getFlattenedTree
{
  uint64_t *ptr;
  void *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t *v8;
  std::__shared_weak_count *v9;

  ptr = (uint64_t *)self->_decisionTree.__ptr_;
  v8 = 0;
  v9 = 0;
  ATXGamePlayKitCDecisionTree::encodeWithCoder(ptr, &v8, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  return v3;
}

- (id)findActionForAnswers:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (self->_isInduced)
  {
    v5 = (void *)objc_opt_new();
    -[MLGKDecisionTree _makeInferenceFromAnswers:withError:](self->mlkitDecisionTree, "_makeInferenceFromAnswers:withError:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    ATXGamePlayKitCDecisionTree::findActionForAnswers(self->_decisionTree.__ptr_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)findAccuracyWithExamples:(id)a3 actions:(id)a4 attributes:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  double v23;
  void *v24;
  id obj;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v29 = a4;
  v30 = a5;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v8)
  {
    v33 = 0;
    v9 = 0;
    v28 = *(_QWORD *)v39;
    do
    {
      v10 = 0;
      v31 = v8;
      do
      {
        v32 = v9;
        if (*(_QWORD *)v39 != v28)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v10);
        v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v13 = v30;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (v14)
        {
          v15 = 0;
          v16 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v35 != v16)
                objc_enumerationMutation(v13);
              v18 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
              objc_msgSend(v11, "objectAtIndexedSubscript:", v15 + i);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setObject:forKey:", v19, v18);

            }
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
            v15 += i;
          }
          while (v14);
        }

        -[ATXGamePlayKitDecisionTree findActionForAnswers:](self, "findActionForAnswers:", v12);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectAtIndexedSubscript:", v33);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqual:", v20);

        v9 = v32 + v22;
        ++v33;
        ++v10;
      }
      while (v10 != v31);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v8);
    v23 = (double)v9;
  }
  else
  {
    v23 = 0.0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v23 / ((double)(unint64_t)objc_msgSend(obj, "count") + 0.000001));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)description
{
  ATXGamePlayKitCDecisionTree *ptr;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  __CFString *v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  _QWORD *v11;
  std::__shared_weak_count *v12;

  ptr = self->_decisionTree.__ptr_;
  if (ptr && *(_QWORD *)ptr)
  {
    v3 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
    v11 = *(_QWORD **)ptr;
    v12 = v3;
    if (v3)
    {
      p_shared_owners = (unint64_t *)&v3->__shared_owners_;
      do
        v5 = __ldxr(p_shared_owners);
      while (__stxr(v5 + 1, p_shared_owners));
    }
    ATXGamePlayKitCDecisionTree::printTree((uint64_t)ptr, &v11, CFSTR("\t"), CFSTR("-"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v7 = v12;
    if (v12)
    {
      v8 = (unint64_t *)&v12->__shared_owners_;
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
  }
  else
  {
    v6 = &stru_1E82FDC98;
  }
  return v6;
}

- (ATXGamePlayKitDecisionNode)rootNode
{
  return self->_rootNode;
}

- (void)setRootNode:(id)a3
{
  objc_storeStrong((id *)&self->_rootNode, a3);
}

- (ATXGamePlayKitRandomSource)randomSource
{
  return self->_randomSource;
}

- (void)setRandomSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_randomSource, 0);
  objc_storeStrong((id *)&self->_rootNode, 0);
  objc_storeStrong((id *)&self->mlkitDecisionTree, 0);
  std::shared_ptr<ATXGamePlayKitCDecisionNode>::~shared_ptr[abi:ne180100]((uint64_t)&self->_decisionTree);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
