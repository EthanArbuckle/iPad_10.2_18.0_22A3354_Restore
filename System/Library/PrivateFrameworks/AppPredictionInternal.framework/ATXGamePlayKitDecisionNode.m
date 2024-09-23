@implementation ATXGamePlayKitDecisionNode

- (ATXGamePlayKitDecisionNode)initWithNode:(shared_ptr<ATXGamePlayKitCDecisionNode>)a3 tree:(id)a4
{
  uint64_t *ptr;
  __shared_weak_count *v6;
  ATXGamePlayKitDecisionNode *v7;
  ATXGamePlayKitDecisionNode *v8;
  objc_super v10;

  ptr = (uint64_t *)a3.__ptr_;
  v6 = a3.__cntrl_;
  v10.receiver = self;
  v10.super_class = (Class)ATXGamePlayKitDecisionNode;
  v7 = -[ATXGamePlayKitDecisionNode init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    std::shared_ptr<ATXGamePlayKitCDecisionNode>::operator=[abi:ne180100](&v7->_node.__ptr_, ptr);
    objc_storeWeak((id *)v8->_node.__ptr_ + 11, v8);
    objc_storeWeak((id *)&v8->_tree, v6);
  }

  return v8;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ATXGamePlayKitDecisionNode;
  -[ATXGamePlayKitDecisionNode dealloc](&v2, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attribute: %@, child count: %lu\n"), *((_QWORD *)self->_node.__ptr_ + 7), 0xAAAAAAAAAAAAAAABLL* ((uint64_t)(*((_QWORD *)self->_node.__ptr_ + 1) - *(_QWORD *)self->_node.__ptr_) >> 3));
}

- (id)branches
{
  return ATXGamePlayKitCDecisionNode::branches(self->_node.__ptr_);
}

- (void)setAttribute:(id)a3
{
  id v5;
  ATXGamePlayKitCDecisionNode *ptr;
  id v7;

  v5 = a3;
  ptr = self->_node.__ptr_;
  if (ptr)
  {
    v7 = v5;
    objc_storeStrong((id *)ptr + 7, a3);
    v5 = v7;
  }

}

- (id)attribute
{
  ATXGamePlayKitCDecisionNode *ptr;

  ptr = self->_node.__ptr_;
  if (ptr)
    return *((id *)ptr + 7);
  else
    return 0;
}

- (id)createChildWithAttribute:(id)a3 randomSource:(id)a4 withBranch:(id)a5
{
  id v9;
  id v10;
  id v11;
  ATXGamePlayKitCDecisionNode *ptr;
  uint64_t v13;
  ATXGamePlayKitRandomDistribution *v14;
  id *v15;
  ATXGamePlayKitCDecisionNode *v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t *v23;
  id v24;
  std::__shared_weak_count *v25;
  id *v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  ATXGamePlayKitDecisionNode *v32;
  unint64_t *v33;
  unint64_t v34;
  id v35;
  ATXGamePlayKitDecisionNode *v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  ATXGamePlayKitCDecisionNode *v43;
  void *v44;
  char *v45;
  unint64_t *v46;
  uint64_t *v47;
  id v48;
  unint64_t v49;
  std::__shared_weak_count *v50;
  unint64_t *p_shared_owners;
  unint64_t v52;
  ATXGamePlayKitDecisionNode *v53;
  unint64_t *v54;
  unint64_t v55;
  id WeakRetained;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  unint64_t *v60;
  id v62;
  id v63;
  id v64;
  id v65;
  id *v66;
  std::__shared_weak_count *v67;
  id *v68;
  std::__shared_weak_count *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  __int128 v73;
  std::__shared_weak_count *v74;
  id *v75;
  std::__shared_weak_count *v76;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  ptr = self->_node.__ptr_;
  if (!ptr)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ATXGamePlayKitDecisionTree: Cannot create new child with branch: %@ and attribute: %@ from nil node."), v11, v9);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_claimAutoreleasedReturnValue(), 0);
    v62 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v62);
  }
  if (*((_QWORD *)ptr + 1) != *(_QWORD *)ptr)
  {
    objc_msgSend(**(id **)ptr, "superclass");
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ATXGamePlayKitDecisionTree: Cannot create child for node type: %@, with branch: %@"), objc_msgSend(**(id **)self->_node.__ptr_, "superclass"), v11);
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_claimAutoreleasedReturnValue(), 0);
      v63 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v63);
    }
    ptr = self->_node.__ptr_;
    v13 = *((_QWORD *)ptr + 9);
    if (!v10 && v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ATXGamePlayKitDecisionTree: Cannot create child for random node type with branch: %@"), v11);
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_claimAutoreleasedReturnValue(), 0);
      v64 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v64);
    }
    if (v10 && !v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ATXGamePlayKitDecisionTree: Cannot create child for node type: %@ with random branch"), objc_msgSend(**(id **)ptr, "superclass"));
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_claimAutoreleasedReturnValue(), 0);
      v65 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v65);
    }
  }
  if (v10)
  {
    if (*((_QWORD *)ptr + 9))
      v14 = -[ATXGamePlayKitRandomDistribution initWithRandomSource:lowestValue:highestValue:]([ATXGamePlayKitRandomDistribution alloc], "initWithRandomSource:lowestValue:highestValue:", v10, 0, objc_msgSend(v11, "integerValue") + objc_msgSend(*((id *)self->_node.__ptr_ + 9), "highestValue"));
    else
      v14 = -[ATXGamePlayKitRandomDistribution initWithRandomSource:lowestValue:highestValue:]([ATXGamePlayKitRandomDistribution alloc], "initWithRandomSource:lowestValue:highestValue:", v10, 0, objc_msgSend(v11, "integerValue"));
    v43 = self->_node.__ptr_;
    v44 = (void *)*((_QWORD *)v43 + 9);
    *((_QWORD *)v43 + 9) = v14;

    v45 = (char *)operator new(0x78uLL);
    *((_QWORD *)v45 + 1) = 0;
    v46 = (unint64_t *)(v45 + 8);
    *((_QWORD *)v45 + 2) = 0;
    *(_QWORD *)v45 = &off_1E82DE580;
    *(_OWORD *)(v45 + 24) = 0u;
    *(_OWORD *)(v45 + 40) = 0u;
    *((_QWORD *)v45 + 7) = 0;
    *((_OWORD *)v45 + 6) = 0u;
    *((_OWORD *)v45 + 5) = 0u;
    *((_QWORD *)v45 + 14) = 0;
    *((_OWORD *)v45 + 4) = xmmword_1C9E7EE50;
    v75 = (id *)(v45 + 24);
    v76 = (std::__shared_weak_count *)v45;
    objc_storeStrong((id *)v45 + 10, a3);
    objc_storeStrong((id *)self->_node.__ptr_ + 10, a4);
    v47 = (uint64_t *)self->_node.__ptr_;
    v48 = v11;
    do
      v49 = __ldxr(v46);
    while (__stxr(v49 + 1, v46));
    v70 = 0;
    *(_QWORD *)&v73 = v48;
    *((_QWORD *)&v73 + 1) = v45 + 24;
    v74 = (std::__shared_weak_count *)v45;
    v71 = 0;
    v72 = 0;
    std::vector<std::pair<objc_object * {__strong},std::shared_ptr<ATXGamePlayKitCDecisionNode>>>::push_back[abi:ne180100](v47, &v73);
    v50 = v74;
    if (v74)
    {
      p_shared_owners = (unint64_t *)&v74->__shared_owners_;
      do
        v52 = __ldaxr(p_shared_owners);
      while (__stlxr(v52 - 1, p_shared_owners));
      if (!v52)
      {
        ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
        std::__shared_weak_count::__release_weak(v50);
      }
    }

    v53 = [ATXGamePlayKitDecisionNode alloc];
    v68 = v75;
    v69 = v76;
    if (v76)
    {
      v54 = (unint64_t *)&v76->__shared_owners_;
      do
        v55 = __ldxr(v54);
      while (__stxr(v55 + 1, v54));
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_tree);
    v36 = -[ATXGamePlayKitDecisionNode initWithNode:tree:](v53, "initWithNode:tree:", &v68, WeakRetained);

    v57 = v69;
    if (v69)
    {
      v58 = (unint64_t *)&v69->__shared_owners_;
      do
        v59 = __ldaxr(v58);
      while (__stlxr(v59 - 1, v58));
      if (!v59)
      {
        ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
        std::__shared_weak_count::__release_weak(v57);
      }
    }
    v40 = v76;
    if (v76)
    {
      v60 = (unint64_t *)&v76->__shared_owners_;
      do
        v42 = __ldaxr(v60);
      while (__stlxr(v42 - 1, v60));
      goto LABEL_61;
    }
  }
  else
  {
    v75 = 0;
    v76 = 0;
    v16 = ptr;
    v15 = *(id **)ptr;
    if (*((id **)v16 + 1) == v15)
      goto LABEL_17;
    v17 = 0;
    v18 = 0;
    do
    {
      if (objc_msgSend(v11, "isEqual:", v15[v17]))
        std::shared_ptr<ATXGamePlayKitCDecisionNode>::operator=[abi:ne180100](&v75, (uint64_t *)(*(_QWORD *)self->_node.__ptr_ + v17 * 8 + 8));
      ++v18;
      v15 = *(id **)self->_node.__ptr_;
      v17 += 3;
    }
    while (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)self->_node.__ptr_ + 1) - (_QWORD)v15) >> 3) > v18);
    if (!v75)
    {
LABEL_17:
      v19 = (char *)operator new(0x78uLL);
      *((_QWORD *)v19 + 1) = 0;
      *((_QWORD *)v19 + 2) = 0;
      *(_QWORD *)v19 = &off_1E82DE580;
      *(_OWORD *)(v19 + 40) = 0u;
      *((_QWORD *)v19 + 7) = 0;
      *(_OWORD *)(v19 + 24) = 0u;
      *((_OWORD *)v19 + 5) = 0u;
      *((_OWORD *)v19 + 6) = 0u;
      *((_QWORD *)v19 + 14) = 0;
      *((_OWORD *)v19 + 4) = xmmword_1C9E7EE50;
      v20 = v76;
      v75 = (id *)(v19 + 24);
      v76 = (std::__shared_weak_count *)v19;
      if (v20)
      {
        v21 = (unint64_t *)&v20->__shared_owners_;
        do
          v22 = __ldaxr(v21);
        while (__stlxr(v22 - 1, v21));
        if (!v22)
        {
          ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
          std::__shared_weak_count::__release_weak(v20);
        }
      }
    }
    objc_storeStrong(v75 + 7, a3);
    v23 = (uint64_t *)self->_node.__ptr_;
    v24 = v11;
    v26 = v75;
    v25 = v76;
    if (v76)
    {
      v27 = (unint64_t *)&v76->__shared_owners_;
      do
        v28 = __ldxr(v27);
      while (__stxr(v28 + 1, v27));
    }
    v70 = 0;
    *(_QWORD *)&v73 = v24;
    *((_QWORD *)&v73 + 1) = v26;
    v74 = v25;
    v71 = 0;
    v72 = 0;
    std::vector<std::pair<objc_object * {__strong},std::shared_ptr<ATXGamePlayKitCDecisionNode>>>::push_back[abi:ne180100](v23, &v73);
    v29 = v74;
    if (v74)
    {
      v30 = (unint64_t *)&v74->__shared_owners_;
      do
        v31 = __ldaxr(v30);
      while (__stlxr(v31 - 1, v30));
      if (!v31)
      {
        ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
        std::__shared_weak_count::__release_weak(v29);
      }
    }

    v32 = [ATXGamePlayKitDecisionNode alloc];
    v66 = v75;
    v67 = v76;
    if (v76)
    {
      v33 = (unint64_t *)&v76->__shared_owners_;
      do
        v34 = __ldxr(v33);
      while (__stxr(v34 + 1, v33));
    }
    v35 = objc_loadWeakRetained((id *)&self->_tree);
    v36 = -[ATXGamePlayKitDecisionNode initWithNode:tree:](v32, "initWithNode:tree:", &v66, v35);

    v37 = v67;
    if (v67)
    {
      v38 = (unint64_t *)&v67->__shared_owners_;
      do
        v39 = __ldaxr(v38);
      while (__stlxr(v39 - 1, v38));
      if (!v39)
      {
        ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
        std::__shared_weak_count::__release_weak(v37);
      }
    }
    v40 = v76;
    if (v76)
    {
      v41 = (unint64_t *)&v76->__shared_owners_;
      do
        v42 = __ldaxr(v41);
      while (__stlxr(v42 - 1, v41));
LABEL_61:
      if (!v42)
      {
        ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
        std::__shared_weak_count::__release_weak(v40);
      }
    }
  }

  return v36;
}

- (id)createBranchWithValue:(id)a3 attribute:(id)a4
{
  -[ATXGamePlayKitDecisionNode createChildWithAttribute:randomSource:withBranch:](self, "createChildWithAttribute:randomSource:withBranch:", a4, 0, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)createBranchWithPredicate:(id)a3 attribute:(id)a4
{
  -[ATXGamePlayKitDecisionNode createChildWithAttribute:randomSource:withBranch:](self, "createChildWithAttribute:randomSource:withBranch:", a4, 0, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)createBranchWithWeight:(int64_t)a3 attribute:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tree);
  objc_msgSend(WeakRetained, "randomSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    +[ATXGamePlayKitRandomSource sharedRandom](ATXGamePlayKitRandomSource, "sharedRandom");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_loadWeakRetained((id *)&self->_tree);
    objc_msgSend(v10, "setRandomSource:", v9);

  }
  v11 = objc_loadWeakRetained((id *)&self->_tree);
  objc_msgSend(v11, "randomSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXGamePlayKitDecisionNode createChildWithAttribute:randomSource:withBranch:](self, "createChildWithAttribute:randomSource:withBranch:", v6, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)getNodeAtBranch:(id)a3
{
  id v4;
  ATXGamePlayKitCDecisionNode *ptr;
  uint64_t v6;
  uint64_t v7;
  ATXGamePlayKitDecisionNode *v8;
  id WeakRetained;
  ATXGamePlayKitDecisionNode *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  id v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  std::__shared_weak_count *v20;

  v4 = a3;
  ptr = self->_node.__ptr_;
  v7 = *(_QWORD *)ptr;
  v6 = *((_QWORD *)ptr + 1);
  while (1)
  {
    if (v7 == v6)
    {
      v8 = 0;
      goto LABEL_8;
    }
    if (objc_msgSend(*(id *)v7, "isEqual:", v4))
      break;
    v7 += 24;
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(v7 + 8) + 88));

  if (WeakRetained)
  {
    v8 = (ATXGamePlayKitDecisionNode *)objc_loadWeakRetained((id *)(*(_QWORD *)(v7 + 8) + 88));
  }
  else
  {
    v11 = [ATXGamePlayKitDecisionNode alloc];
    v12 = *(std::__shared_weak_count **)(v7 + 16);
    v19 = *(_QWORD *)(v7 + 8);
    v20 = v12;
    if (v12)
    {
      p_shared_owners = (unint64_t *)&v12->__shared_owners_;
      do
        v14 = __ldxr(p_shared_owners);
      while (__stxr(v14 + 1, p_shared_owners));
    }
    v15 = objc_loadWeakRetained((id *)&self->_tree);
    v8 = -[ATXGamePlayKitDecisionNode initWithNode:tree:](v11, "initWithNode:tree:", &v19, v15);

    v16 = v20;
    if (v20)
    {
      v17 = (unint64_t *)&v20->__shared_owners_;
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
  }
LABEL_8:

  return v8;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tree);
  std::shared_ptr<ATXGamePlayKitCDecisionNode>::~shared_ptr[abi:ne180100]((uint64_t)&self->_node);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
