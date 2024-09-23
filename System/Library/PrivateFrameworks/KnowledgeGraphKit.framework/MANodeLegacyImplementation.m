@implementation MANodeLegacyImplementation

- (MANodeLegacyImplementation)initWithNode:(id)a3
{
  MANode *v4;
  MANodeLegacyImplementation *v5;
  MANodeLegacyImplementation *v6;
  NSMutableArray *v7;
  NSMutableArray *edges;
  objc_super v10;

  v4 = (MANode *)a3;
  v10.receiver = self;
  v10.super_class = (Class)MANodeLegacyImplementation;
  v5 = -[MANodeLegacyImplementation init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_node = v4;
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    edges = v6->_edges;
    v6->_edges = v7;

  }
  return v6;
}

- (unint64_t)countOfEdgesOfType:(unint64_t)a3 matchingFilter:(id)a4
{
  id v6;
  unint64_t v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v6 = a4;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__MANodeLegacyImplementation_countOfEdgesOfType_matchingFilter___block_invoke;
  v9[3] = &unk_1E83E6328;
  v9[4] = &v10;
  -[MANodeLegacyImplementation enumerateEdgesOfType:matchingFilter:usingBlock:](self, "enumerateEdgesOfType:matchingFilter:usingBlock:", a3, v6, v9);
  v7 = v11[3];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (BOOL)hasEdgeOfType:(unint64_t)a3 matchingFilter:(id)a4
{
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v6 = a4;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__MANodeLegacyImplementation_hasEdgeOfType_matchingFilter___block_invoke;
  v8[3] = &unk_1E83E6328;
  v8[4] = &v9;
  -[MANodeLegacyImplementation enumerateEdgesOfType:matchingFilter:usingBlock:](self, "enumerateEdgesOfType:matchingFilter:usingBlock:", a3, v6, v8);
  LOBYTE(a3) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return a3;
}

- (void)enumerateEdgesOfType:(unint64_t)a3 usingBlock:(id)a4
{
  id v6;
  NSMutableArray *v7;
  void *v8;
  NSMutableArray *edges;
  NSMutableArray *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;

  v6 = a4;
  switch(a3)
  {
    case 3uLL:
      edges = self->_edges;
      v12[1] = 3221225472;
      v12[2] = __62__MANodeLegacyImplementation_enumerateEdgesOfType_usingBlock___block_invoke_3;
      v12[3] = &unk_1E83E2368;
      v11 = v6;
      v12[0] = MEMORY[0x1E0C809B0];
      v13 = v6;
      -[NSMutableArray enumerateObjectsUsingBlock:](edges, "enumerateObjectsUsingBlock:", v12);
      v8 = v13;
      goto LABEL_7;
    case 2uLL:
      v10 = self->_edges;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __62__MANodeLegacyImplementation_enumerateEdgesOfType_usingBlock___block_invoke_2;
      v14[3] = &unk_1E83E2340;
      v14[4] = self;
      v11 = v6;
      v15 = v6;
      -[NSMutableArray enumerateObjectsUsingBlock:](v10, "enumerateObjectsUsingBlock:", v14);
      v8 = v15;
      goto LABEL_7;
    case 1uLL:
      v7 = self->_edges;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __62__MANodeLegacyImplementation_enumerateEdgesOfType_usingBlock___block_invoke;
      v16[3] = &unk_1E83E2340;
      v16[4] = self;
      v11 = v6;
      v17 = v6;
      -[NSMutableArray enumerateObjectsUsingBlock:](v7, "enumerateObjectsUsingBlock:", v16);
      v8 = v17;
LABEL_7:

      v6 = v11;
      break;
  }

}

- (void)enumerateEdgesOfType:(unint64_t)a3 matchingFilter:(id)a4 usingBlock:(id)a5
{
  id v8;
  void *v9;
  int v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v11 = a4;
  v8 = a5;
  +[MAElementFilter any](MAEdgeFilter, "any");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v11, "isEqual:", v9);

  if (v10)
  {
    -[MANodeLegacyImplementation enumerateEdgesOfType:usingBlock:](self, "enumerateEdgesOfType:usingBlock:", a3, v8);
  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __77__MANodeLegacyImplementation_enumerateEdgesOfType_matchingFilter_usingBlock___block_invoke;
    v12[3] = &unk_1E83E43F8;
    v13 = v11;
    v14 = v8;
    -[MANodeLegacyImplementation enumerateEdgesOfType:usingBlock:](self, "enumerateEdgesOfType:usingBlock:", a3, v12);

  }
}

- (BOOL)hasEdgeOfType:(unint64_t)a3 withNode:(id)a4
{
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v6 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__MANodeLegacyImplementation_hasEdgeOfType_withNode___block_invoke;
  v9[3] = &unk_1E83E4568;
  v11 = &v12;
  v9[4] = self;
  v7 = v6;
  v10 = v7;
  -[MANodeLegacyImplementation enumerateEdgesOfType:usingBlock:](self, "enumerateEdgesOfType:usingBlock:", a3, v9);
  LOBYTE(a3) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return a3;
}

- (void)addEdge:(id)a3
{
  -[NSMutableArray addObject:](self->_edges, "addObject:", a3);
}

- (void)removeEdge:(id)a3
{
  -[NSMutableArray removeObject:](self->_edges, "removeObject:", a3);
}

- (void)enumerateEdgesOfType:(unint64_t)a3 withNode:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v8 = a4;
  v9 = a5;
  +[MAElementFilter any](MAEdgeFilter, "any");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__MANodeLegacyImplementation_enumerateEdgesOfType_withNode_usingBlock___block_invoke;
  v13[3] = &unk_1E83E2390;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  -[MANodeLegacyImplementation enumerateNeighborEdgesAndNodesThroughEdgesOfType:matchingFilter:usingBlock:](self, "enumerateNeighborEdgesAndNodesThroughEdgesOfType:matchingFilter:usingBlock:", a3, v10, v13);

}

- (void)enumerateNeighborEdgesAndNodesMatchingFilter:(id)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  int v8;
  id *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v12 = a3;
  v6 = a4;
  +[MAElementFilter any](MANodeFilter, "any");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v12, "isEqual:", v7);

  if (v8)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __86__MANodeLegacyImplementation_enumerateNeighborEdgesAndNodesMatchingFilter_usingBlock___block_invoke;
    v16[3] = &unk_1E83E43F8;
    v9 = &v17;
    v16[4] = self;
    v17 = v6;
    v10 = v6;
    -[MANodeLegacyImplementation enumerateEdgesOfType:usingBlock:](self, "enumerateEdgesOfType:usingBlock:", 3, v16);
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __86__MANodeLegacyImplementation_enumerateNeighborEdgesAndNodesMatchingFilter_usingBlock___block_invoke_2;
    v13[3] = &unk_1E83E23B8;
    v13[4] = self;
    v9 = &v14;
    v14 = v12;
    v15 = v6;
    v11 = v6;
    -[MANodeLegacyImplementation enumerateEdgesOfType:usingBlock:](self, "enumerateEdgesOfType:usingBlock:", 3, v13);

  }
}

- (void)enumerateNeighborNodesMatchingFilter:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__MANodeLegacyImplementation_enumerateNeighborNodesMatchingFilter_usingBlock___block_invoke;
  v8[3] = &unk_1E83E23E0;
  v9 = v6;
  v7 = v6;
  -[MANodeLegacyImplementation enumerateNeighborEdgesAndNodesMatchingFilter:usingBlock:](self, "enumerateNeighborEdgesAndNodesMatchingFilter:usingBlock:", a3, v8);

}

- (void)enumerateNeighborEdgesAndNodesThroughEdgesOfType:(unint64_t)a3 matchingFilter:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __105__MANodeLegacyImplementation_enumerateNeighborEdgesAndNodesThroughEdgesOfType_matchingFilter_usingBlock___block_invoke;
  v10[3] = &unk_1E83E43F8;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  -[MANodeLegacyImplementation enumerateEdgesOfType:matchingFilter:usingBlock:](self, "enumerateEdgesOfType:matchingFilter:usingBlock:", a3, a4, v10);

}

- (void)enumerateNeighborNodesThroughEdgesOfType:(unint64_t)a3 matchingFilter:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __97__MANodeLegacyImplementation_enumerateNeighborNodesThroughEdgesOfType_matchingFilter_usingBlock___block_invoke;
  v10[3] = &unk_1E83E43F8;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  -[MANodeLegacyImplementation enumerateEdgesOfType:matchingFilter:usingBlock:](self, "enumerateEdgesOfType:matchingFilter:usingBlock:", a3, a4, v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edges, 0);
}

void __97__MANodeLegacyImplementation_enumerateNeighborNodesThroughEdgesOfType_matchingFilter_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "oppositeNode:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, uint64_t))(v4 + 16))(v4, v5, a3);

}

void __105__MANodeLegacyImplementation_enumerateNeighborEdgesAndNodesThroughEdgesOfType_matchingFilter_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v4 = a2;
  objc_msgSend(v4, "oppositeNode:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __78__MANodeLegacyImplementation_enumerateNeighborNodesMatchingFilter_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __86__MANodeLegacyImplementation_enumerateNeighborEdgesAndNodesMatchingFilter_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "oppositeNode:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 != *(void **)(*(_QWORD *)(a1 + 32) + 16))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __86__MANodeLegacyImplementation_enumerateNeighborEdgesAndNodesMatchingFilter_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "oppositeNode:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 != *(void **)(*(_QWORD *)(a1 + 32) + 16) && objc_msgSend(*(id *)(a1 + 40), "matchesNode:", v3))
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __71__MANodeLegacyImplementation_enumerateEdgesOfType_withNode_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isSameNodeAsNode:", a3))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __53__MANodeLegacyImplementation_hasEdgeOfType_withNode___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  void *v5;

  objc_msgSend(a2, "oppositeNode:", *(_QWORD *)(a1[4] + 16));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v5 == (void *)a1[5];

  *a3 = *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24);
}

void __77__MANodeLegacyImplementation_enumerateEdgesOfType_matchingFilter_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "matchesEdge:"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __62__MANodeLegacyImplementation_enumerateEdgesOfType_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "targetNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSameNodeAsNode:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

  if (v4)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __62__MANodeLegacyImplementation_enumerateEdgesOfType_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "sourceNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSameNodeAsNode:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

  if (v4)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __62__MANodeLegacyImplementation_enumerateEdgesOfType_usingBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__MANodeLegacyImplementation_hasEdgeOfType_matchingFilter___block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

uint64_t __64__MANodeLegacyImplementation_countOfEdgesOfType_matchingFilter___block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

@end
