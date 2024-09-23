@implementation GKDecisionNode

- (GKDecisionNode)initWithNode:(void *)a3 tree:(id)a4
{
  id v6;
  GKDecisionNode *v7;
  GKDecisionNode *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)GKDecisionNode;
  v7 = -[GKDecisionNode init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_node = a3;
    objc_storeStrong((id *)a3 + 10, v7);
    objc_storeWeak((id *)&v8->_tree, v6);
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  self->_node = 0;
  objc_storeWeak((id *)&self->_tree, 0);
  v3.receiver = self;
  v3.super_class = (Class)GKDecisionNode;
  -[GKDecisionNode dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("attribute: %@, child count: %lu\n"), *((_QWORD *)self->_node + 6), (uint64_t)(*((_QWORD *)self->_node + 1) - *(_QWORD *)self->_node) >> 4);
}

- (id)branches
{
  _QWORD *node;
  id v3;
  _QWORD *v4;
  _QWORD *v5;

  node = self->_node;
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = (_QWORD *)*node;
  v5 = (_QWORD *)node[1];
  while (v4 != v5)
  {
    if (*v4)
      objc_msgSend(v3, "addObject:");
    v4 += 2;
  }
  return v3;
}

- (void)setAttribute:(id)a3
{
  id v5;
  id *node;
  id v7;

  v5 = a3;
  node = (id *)self->_node;
  if (node)
  {
    v7 = v5;
    objc_storeStrong(node + 6, a3);
    v5 = v7;
  }

}

- (id)attribute
{
  id *node;

  node = (id *)self->_node;
  if (node)
    return node[6];
  else
    return 0;
}

- (id)createChildWithAttribute:(id)a3 randomSource:(id)a4 withBranch:(id)a5
{
  id v9;
  id v10;
  id v11;
  id **node;
  id *v13;
  GKRandomDistribution *v14;
  id *v15;
  id **v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  int v20;
  id **v21;
  _QWORD *v22;
  void *v23;
  uint64_t v24;
  void **v25;
  id v26;
  _QWORD *v27;
  id v28;
  void *v29;
  _OWORD *v30;
  GKDecisionNode *v31;
  id WeakRetained;
  uint64_t v33;
  void **v34;
  id v35;
  _QWORD *v36;
  id v37;
  void *v38;
  _OWORD *v39;
  GKDecisionNode *v40;
  void *v41;
  id v43;
  id v44;
  id v45;
  id v46;
  __int128 v47;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  node = (id **)self->_node;
  if (!node)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("GKDecisionTree: Cannot create new child with branch: %@ and attribute: %@ from nil node."), v11, v9);
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_claimAutoreleasedReturnValue(), 0);
    v43 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v43);
  }
  if (node[1] != *node)
  {
    objc_msgSend(**node, "superclass");
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("GKDecisionTree: Cannot create child for node type: %@, with branch: %@"), objc_msgSend(**(id **)self->_node, "superclass"), v11);
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_claimAutoreleasedReturnValue(), 0);
      v44 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v44);
    }
    node = (id **)self->_node;
    v13 = node[8];
    if (!v10 && v13)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("GKDecisionTree: Cannot create child for random node type with branch: %@"), v11);
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_claimAutoreleasedReturnValue(), 0);
      v45 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v45);
    }
    if (v10 && !v13)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("GKDecisionTree: Cannot create child for node type: %@ with random branch"), objc_msgSend(**node, "superclass"));
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_claimAutoreleasedReturnValue(), 0);
      v46 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v46);
    }
  }
  if (v10)
  {
    if (node[8])
      v14 = -[GKRandomDistribution initWithRandomSource:lowestValue:highestValue:]([GKRandomDistribution alloc], "initWithRandomSource:lowestValue:highestValue:", v10, 0, objc_msgSend(v11, "integerValue") + objc_msgSend(*((id *)self->_node + 8), "highestValue"));
    else
      v14 = -[GKRandomDistribution initWithRandomSource:lowestValue:highestValue:]([GKRandomDistribution alloc], "initWithRandomSource:lowestValue:highestValue:", v10, 0, objc_msgSend(v11, "integerValue"));
    v22 = self->_node;
    v23 = (void *)v22[8];
    v22[8] = v14;

    v24 = operator new();
    *(_OWORD *)v24 = 0u;
    *(_OWORD *)(v24 + 16) = 0u;
    *(_OWORD *)(v24 + 56) = 0u;
    *(_OWORD *)(v24 + 72) = 0u;
    *(_OWORD *)(v24 + 32) = xmmword_227BC0080;
    *(_QWORD *)(v24 + 48) = v9;
    objc_storeStrong((id *)self->_node + 9, a4);
    v25 = (void **)self->_node;
    v26 = v11;
    *(_QWORD *)&v47 = v26;
    *((_QWORD *)&v47 + 1) = v24;
    v27 = v25[1];
    if (v27 >= v25[2])
    {
      v30 = std::vector<std::pair<objc_object * {__strong},GKCDecisionNode *>>::__push_back_slow_path<std::pair<objc_object * {__strong},GKCDecisionNode *>>(v25, &v47);
      v29 = (void *)v47;
    }
    else
    {
      v28 = v26;
      v29 = 0;
      *(_QWORD *)&v47 = 0;
      v30 = v27 + 2;
      *v27 = v28;
      v27[1] = v24;
    }
    v25[1] = v30;

    v31 = [GKDecisionNode alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_tree);
    v33 = -[GKDecisionNode initWithNode:tree:](v31, "initWithNode:tree:", v24, WeakRetained);
  }
  else
  {
    v16 = node;
    v15 = *node;
    if (v16[1] == v15)
      goto LABEL_22;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    do
    {
      v20 = objc_msgSend(v11, "isEqual:", v15[v17]);
      v21 = (id **)self->_node;
      v15 = *v21;
      if (v20)
        v19 = (uint64_t)v15[v17 + 1];
      ++v18;
      v17 += 2;
    }
    while (v18 < ((char *)v21[1] - (char *)v15) >> 4);
    if (!v19)
    {
LABEL_22:
      v19 = operator new();
      *(_OWORD *)v19 = 0u;
      *(_OWORD *)(v19 + 16) = 0u;
      *(_OWORD *)(v19 + 48) = 0u;
      *(_OWORD *)(v19 + 64) = 0u;
      *(_QWORD *)(v19 + 80) = 0;
      *(_OWORD *)(v19 + 32) = xmmword_227BC0080;
    }
    objc_storeStrong((id *)(v19 + 48), a3);
    v34 = (void **)self->_node;
    v35 = v11;
    *(_QWORD *)&v47 = v35;
    *((_QWORD *)&v47 + 1) = v19;
    v36 = v34[1];
    if (v36 >= v34[2])
    {
      v39 = std::vector<std::pair<objc_object * {__strong},GKCDecisionNode *>>::__push_back_slow_path<std::pair<objc_object * {__strong},GKCDecisionNode *>>(v34, &v47);
      v38 = (void *)v47;
    }
    else
    {
      v37 = v35;
      v38 = 0;
      *(_QWORD *)&v47 = 0;
      v39 = v36 + 2;
      *v36 = v37;
      v36[1] = v19;
    }
    v34[1] = v39;

    v40 = [GKDecisionNode alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_tree);
    v33 = -[GKDecisionNode initWithNode:tree:](v40, "initWithNode:tree:", v19, WeakRetained);
  }
  v41 = (void *)v33;

  return v41;
}

- (GKDecisionNode)createBranchWithValue:(NSNumber *)value attribute:(id)attribute
{
  -[GKDecisionNode createChildWithAttribute:randomSource:withBranch:](self, "createChildWithAttribute:randomSource:withBranch:", attribute, 0, value);
  return (GKDecisionNode *)(id)objc_claimAutoreleasedReturnValue();
}

- (GKDecisionNode)createBranchWithPredicate:(NSPredicate *)predicate attribute:(id)attribute
{
  -[GKDecisionNode createChildWithAttribute:randomSource:withBranch:](self, "createChildWithAttribute:randomSource:withBranch:", attribute, 0, predicate);
  return (GKDecisionNode *)(id)objc_claimAutoreleasedReturnValue();
}

- (GKDecisionNode)createBranchWithWeight:(NSInteger)weight attribute:(id)attribute
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

  v6 = attribute;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tree);
  objc_msgSend(WeakRetained, "randomSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    +[GKRandomSource sharedRandom](GKRandomSource, "sharedRandom");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_loadWeakRetained((id *)&self->_tree);
    objc_msgSend(v10, "setRandomSource:", v9);

  }
  v11 = objc_loadWeakRetained((id *)&self->_tree);
  objc_msgSend(v11, "randomSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", weight);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDecisionNode createChildWithAttribute:randomSource:withBranch:](self, "createChildWithAttribute:randomSource:withBranch:", v6, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (GKDecisionNode *)v14;
}

- (id)getNodeAtBranch:(id)a3
{
  id v4;
  uint64_t *node;
  uint64_t v6;
  uint64_t v7;
  GKDecisionNode *v8;
  void *v9;
  GKDecisionNode *v10;
  uint64_t v11;
  id WeakRetained;

  v4 = a3;
  node = (uint64_t *)self->_node;
  v6 = *node;
  v7 = node[1];
  if (*node == v7)
  {
LABEL_4:
    v8 = 0;
  }
  else
  {
    while (!objc_msgSend(*(id *)v6, "isEqual:", v4))
    {
      v6 += 16;
      if (v6 == v7)
        goto LABEL_4;
    }
    v9 = *(void **)(*(_QWORD *)(v6 + 8) + 80);
    if (v9)
    {
      v8 = v9;
    }
    else
    {
      v10 = [GKDecisionNode alloc];
      v11 = *(_QWORD *)(v6 + 8);
      WeakRetained = objc_loadWeakRetained((id *)&self->_tree);
      v8 = -[GKDecisionNode initWithNode:tree:](v10, "initWithNode:tree:", v11, WeakRetained);

    }
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tree);
}

@end
