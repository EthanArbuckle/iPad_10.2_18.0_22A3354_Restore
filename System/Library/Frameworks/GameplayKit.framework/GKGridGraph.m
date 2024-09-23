@implementation GKGridGraph

- (void)makeCGraph
{
  id *v3;

  v3 = (id *)operator new();
  GKCGridGraph::GKCGridGraph((GKCGridGraph *)v3);
  self->_cGridGraph = v3;
  objc_storeWeak(v3 + 12, self);
  return self->_cGridGraph;
}

- (vector_int2)gridOrigin
{
  return *(vector_int2 *)((char *)self->_cGridGraph + 40);
}

- (NSUInteger)gridWidth
{
  return *((unsigned int *)self->_cGridGraph + 12);
}

- (NSUInteger)gridHeight
{
  return *((unsigned int *)self->_cGridGraph + 13);
}

- (void)cGridGraph
{
  return self->_cGridGraph;
}

+ (GKGridGraph)graphFromGridStartingAt:(vector_int2)position width:(int)width height:(int)height diagonalsAllowed:(BOOL)diagonalsAllowed
{
  return -[GKGridGraph initFromGridStartingAt:width:height:diagonalsAllowed:]([GKGridGraph alloc], "initFromGridStartingAt:width:height:diagonalsAllowed:", *(_QWORD *)&width, *(_QWORD *)&height, diagonalsAllowed, *(double *)&position);
}

- (GKGridGraph)initFromGridStartingAt:(vector_int2)position width:(int)width height:(int)height diagonalsAllowed:(BOOL)diagonalsAllowed
{
  return -[GKGridGraph initFromGridStartingAt:width:height:diagonalsAllowed:nodeClass:](self, "initFromGridStartingAt:width:height:diagonalsAllowed:nodeClass:", *(_QWORD *)&width, *(_QWORD *)&height, diagonalsAllowed, objc_opt_class(), *(double *)&position);
}

+ (GKGridGraph)graphFromGridStartingAt:(vector_int2)position width:(int)width height:(int)height diagonalsAllowed:(BOOL)diagonalsAllowed nodeClass:(Class)nodeClass
{
  return -[GKGridGraph initFromGridStartingAt:width:height:diagonalsAllowed:nodeClass:]([GKGridGraph alloc], "initFromGridStartingAt:width:height:diagonalsAllowed:nodeClass:", *(_QWORD *)&width, *(_QWORD *)&height, diagonalsAllowed, nodeClass, *(double *)&position);
}

- (GKGridGraph)initFromGridStartingAt:(vector_int2)position width:(int)width height:(int)height diagonalsAllowed:(BOOL)diagonalsAllowed nodeClass:(Class)nodeClass
{
  id v13;
  GKGridGraph *v14;
  objc_super v16;

  if ((-[objc_class isSubclassOfClass:](nodeClass, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("initFromGridStartingAt: nodeClass does not descend from GKGridGraph"));
  v16.receiver = self;
  v16.super_class = (Class)GKGridGraph;
  v13 = -[GKGraph init](&v16, sel_init);
  v14 = (GKGridGraph *)v13;
  if (v13)
    GKCGridGraph::init(*((_QWORD *)v13 + 4), width, height, diagonalsAllowed, nodeClass, *(double *)&position);
  return v14;
}

- (id)nodeAtGridPosition:(vector_int2)position
{
  id *WeakRetained;

  WeakRetained = (id *)GKCGridGraph::nodeAtGridPosition((uint64_t)self->_cGridGraph, *(double *)&position);
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 9);
  return WeakRetained;
}

- (id)nodeAtGridPositionNoNilCheck:(GKGridGraph *)self
{
  int32x2_t v2;
  uint64_t v3;

  v3 = GKCGridGraph::nodeAtGridPositionNoNullCheck((int32x2_t *)self->_cGridGraph, v2);
  return objc_loadWeakRetained((id *)(v3 + 72));
}

- (void)connectNodeToAdjacentNodes:(GKGridGraphNode *)node
{
  GKGridGraphNode *v4;

  v4 = node;
  GKCGridGraph::connectNodeToAdjacentNodes((GKCGridGraph *)self->_cGridGraph, (int32x2_t *)-[GKGridGraphNode cGridGraphNode](v4, "cGridGraphNode"));

}

- (void)removeNodes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        (*(void (**)(void *, uint64_t))(*(_QWORD *)self->_cGridGraph + 16))(self->_cGridGraph, objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "cGraphNode", (_QWORD)v8));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKGridGraph)initWithCoder:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  int v20;
  int v21;
  char v22;
  objc_super v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)GKGridGraph;
  v5 = -[GKGraph initWithCoder:](&v28, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("gridOriginX"));
    v7 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("gridOriginY"));
    v8 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("gridWidth"));
    v9 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("gridHeight"));
    v22 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("diagonalsAllowed"));
    v10 = (_QWORD *)*((_QWORD *)v5 + 4);
    v11 = objc_opt_class();
    GKCGridGraph::initDontConstructNodes(v10, v8, v9, v22, v11, COERCE_DOUBLE(__PAIR64__(v7, v6)));
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v5, "nodes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v9;
    v21 = v8;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if ((GKCGridGraph::addNodeToGridNodes(*((int32x2_t **)v5 + 4), (int32x2_t *)objc_msgSend(v17, "cGridGraphNode")) & 1) == 0)objc_msgSend(v12, "addObject:", v17);
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v14);
    }

    v23.receiver = v5;
    v23.super_class = (Class)GKGridGraph;
    -[GKGraph removeNodes:](&v23, sel_removeNodes_, v12);
    v18 = *((_QWORD *)v5 + 4);
    *(_DWORD *)(v18 + 48) = v21;
    *(_DWORD *)(v18 + 52) = v20;
    *(_BYTE *)(v18 + 56) = v22;

  }
  return (GKGridGraph *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)GKGridGraph;
  -[GKGraph encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt:forKey:", *((_QWORD *)self->_cGridGraph + 5), CFSTR("gridOriginX"));
  objc_msgSend(v4, "encodeInt:forKey:", *((unsigned int *)self->_cGridGraph + 11), CFSTR("gridOriginY"));
  objc_msgSend(v4, "encodeInt:forKey:", *((unsigned int *)self->_cGridGraph + 12), CFSTR("gridWidth"));
  objc_msgSend(v4, "encodeInt:forKey:", *((unsigned int *)self->_cGridGraph + 13), CFSTR("gridHeight"));
  objc_msgSend(v4, "encodeBool:forKey:", *((unsigned __int8 *)self->_cGridGraph + 56), CFSTR("diagonalsAllowed"));

}

- (Class)classForGenericArgumentAtIndex:(NSUInteger)index
{
  return (Class)*((id *)self->_cGridGraph + 11);
}

- (BOOL)diagonalsAllowed
{
  return self->_diagonalsAllowed;
}

@end
