@implementation MAAbstractGraph

- (MAAbstractGraph)init
{
  MAAbstractGraph *v2;
  NSMutableArray *v3;
  NSMutableArray *nodes;
  NSMutableArray *v5;
  NSMutableArray *edges;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MAAbstractGraph;
  v2 = -[MAAbstractGraph init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    nodes = v2->_nodes;
    v2->_nodes = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    edges = v2->_edges;
    v2->_edges = v5;

  }
  return v2;
}

- (id)insertNodeWithLabel:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  MAAbstractNode *v13;
  double v14;
  MAAbstractNode *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_nodes;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "label", (_QWORD)v17);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        if (v11 == v4)
        {
          v12 = v4;
LABEL_12:
          v15 = v10;

          goto LABEL_13;
        }
        v12 = v11;
        if ((objc_msgSend(v11, "isEqualToString:", v4) & 1) != 0)
          goto LABEL_12;

      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
        continue;
      break;
    }
  }

  v13 = [MAAbstractNode alloc];
  LODWORD(v14) = 1.0;
  v15 = -[MAAbstractNode initWithLabel:domain:weight:properties:](v13, "initWithLabel:domain:weight:properties:", v4, 1, MEMORY[0x1E0C9AA70], v14);
  -[MANode setIdentifier:](v15, "setIdentifier:", -[NSMutableArray count](self->_nodes, "count") + 1);
  -[NSMutableArray addObject:](self->_nodes, "addObject:", v15);
LABEL_13:

  return v15;
}

- (id)insertEdgeWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 minimum:(unint64_t)a6 maximum:(unint64_t)a7 directed:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  MAAbstractEdge *v20;
  double v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(_QWORD *, void *, _BYTE *);
  void *v35;
  id v36;
  id v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__5119;
  v43 = __Block_byref_object_dispose__5120;
  v44 = 0;
  v32 = MEMORY[0x1E0C809B0];
  v33 = 3221225472;
  v34 = __86__MAAbstractGraph_insertEdgeWithLabel_sourceNode_targetNode_minimum_maximum_directed___block_invoke;
  v35 = &unk_1E83E5878;
  v17 = v16;
  v36 = v17;
  v18 = v14;
  v37 = v18;
  v38 = &v39;
  objc_msgSend(v15, "enumerateEdgesUsingBlock:", &v32);
  v19 = (void *)v40[5];
  if (!v19)
  {
    v20 = [MAAbstractEdge alloc];
    LOBYTE(v31) = a8;
    LODWORD(v21) = 1.0;
    v22 = -[MAAbstractEdge initWithLabel:sourceNode:targetNode:domain:weight:minimum:maximum:directed:](v20, "initWithLabel:sourceNode:targetNode:domain:weight:minimum:maximum:directed:", v18, v15, v17, 1, a6, a7, v21, v31, v32, v33, v34, v35, v36);
    v23 = (void *)v40[5];
    v40[5] = v22;

    v24 = -[NSMutableArray count](self->_edges, "count");
    objc_msgSend((id)v40[5], "setIdentifier:", v24 + 1);
    -[NSMutableArray addObject:](self->_edges, "addObject:", v40[5]);
    objc_msgSend((id)v40[5], "sourceNode");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "implementation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "addEdge:", v40[5]);
    if ((objc_msgSend((id)v40[5], "isLoop") & 1) == 0)
    {
      objc_msgSend((id)v40[5], "targetNode");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "implementation");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "addEdge:", v40[5]);
    }

    v19 = (void *)v40[5];
  }
  v29 = v19;

  _Block_object_dispose(&v39, 8);
  return v29;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edges, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
}

void __86__MAAbstractGraph_insertEdgeWithLabel_sourceNode_targetNode_minimum_maximum_directed___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  char v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "targetNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isSameNodeAsNode:", a1[4]))
  {
    if (v6 == (void *)a1[5])
    {

    }
    else
    {
      v8 = objc_msgSend(v6, "isEqualToString:");

      if ((v8 & 1) == 0)
        goto LABEL_8;
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    *a3 = 1;
  }
  else
  {

  }
LABEL_8:

}

@end
