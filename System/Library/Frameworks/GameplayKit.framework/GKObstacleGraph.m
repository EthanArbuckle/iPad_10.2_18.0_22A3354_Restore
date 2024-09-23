@implementation GKObstacleGraph

- (void)makeCGraph
{
  id *v3;

  v3 = (id *)operator new();
  GKCObstacleGraph::GKCObstacleGraph((GKCObstacleGraph *)v3);
  self->_cObstacleGraph = v3;
  objc_storeWeak(v3 + 24, self);
  return self->_cObstacleGraph;
}

- (void)cObstacleGraph
{
  return self->_cObstacleGraph;
}

- (NSArray)obstacles
{
  return (NSArray *)self->_sourceObstacles;
}

- (id)mutObstacles
{
  return self->_sourceObstacles;
}

- (float)bufferRadius
{
  return *((float *)self->_cObstacleGraph + 28);
}

+ (GKObstacleGraph)graphWithObstacles:(NSArray *)obstacles bufferRadius:(float)bufferRadius
{
  NSArray *v5;
  GKObstacleGraph *v6;
  double v7;
  GKObstacleGraph *v8;

  v5 = obstacles;
  v6 = [GKObstacleGraph alloc];
  *(float *)&v7 = bufferRadius;
  v8 = -[GKObstacleGraph initWithObstacles:bufferRadius:](v6, "initWithObstacles:bufferRadius:", v5, v7);

  return v8;
}

- (GKObstacleGraph)initWithObstacles:(NSArray *)obstacles bufferRadius:(float)bufferRadius
{
  NSArray *v6;
  uint64_t v7;
  double v8;
  GKObstacleGraph *v9;

  v6 = obstacles;
  v7 = objc_opt_class();
  *(float *)&v8 = bufferRadius;
  v9 = -[GKObstacleGraph initWithObstacles:bufferRadius:nodeClass:](self, "initWithObstacles:bufferRadius:nodeClass:", v6, v7, v8);

  return v9;
}

+ (GKObstacleGraph)graphWithObstacles:(NSArray *)obstacles bufferRadius:(float)bufferRadius nodeClass:(Class)nodeClass
{
  NSArray *v7;
  GKObstacleGraph *v8;
  double v9;
  GKObstacleGraph *v10;

  v7 = obstacles;
  v8 = [GKObstacleGraph alloc];
  *(float *)&v9 = bufferRadius;
  v10 = -[GKObstacleGraph initWithObstacles:bufferRadius:nodeClass:](v8, "initWithObstacles:bufferRadius:nodeClass:", v7, nodeClass, v9);

  return v10;
}

- (GKObstacleGraph)initWithObstacles:(NSArray *)obstacles bufferRadius:(float)bufferRadius nodeClass:(Class)nodeClass
{
  NSArray *v8;
  GKObstacleGraph *v9;
  GKObstacleGraph *v10;
  uint64_t v11;
  NSMutableArray *sourceObstacles;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = obstacles;
  if ((-[objc_class isSubclassOfClass:](nodeClass, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("initWithObstacles: nodeClass does not descend from GKGraphNode2D"));
  v22.receiver = self;
  v22.super_class = (Class)GKObstacleGraph;
  v9 = -[GKGraph init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_nodeClass = nodeClass;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    sourceObstacles = v10->_sourceObstacles;
    v10->_sourceObstacles = (NSMutableArray *)v11;

    *((float *)v10->_cObstacleGraph + 28) = fmaxf(bufferRadius, 0.0);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v13 = v8;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v19;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v13);
          GKCObstacleGraph::addObstacle((GKCObstacleGraph *)v10->_cObstacleGraph, (GKCPolygonObstacle *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v16++), "cPolygonObstacle", (_QWORD)v18), 1);
        }
        while (v14 != v16);
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v14);
    }

  }
  return v10;
}

- (void)connectNodeUsingObstacles:(id)node
{
  id v4;

  v4 = node;
  GKCObstacleGraph::connectNodeUsingObstacles((GKCObstacleGraph *)self->_cObstacleGraph, (GKCGraphNode2D *)objc_msgSend(v4, "cGraphNode2D"));

}

- (void)connectNodeUsingObstacles:(id)node ignoringObstacles:(NSArray *)obstaclesToIgnore
{
  NSArray *v6;
  id v7;

  v7 = node;
  v6 = obstaclesToIgnore;
  GKCObstacleGraph::connectNodeUsingObstaclesIgnoringObstacles((uint64_t)self->_cObstacleGraph, (GKCGraphNode *)objc_msgSend(v7, "cGraphNode2D"), v6);

}

- (void)connectNodeUsingObstacles:(id)node ignoringBufferRadiusOfObstacles:(NSArray *)obstaclesBufferRadiusToIgnore
{
  NSArray *v6;
  id v7;

  v7 = node;
  v6 = obstaclesBufferRadiusToIgnore;
  GKCObstacleGraph::connectNodeUsingObstaclesIgnoringBufferRadiusOfObstacles((GKCGraph *)self->_cObstacleGraph, (float32x2_t *)objc_msgSend(v7, "cGraphNode2D"), v6);

}

- (void)addObstacles:(NSArray *)obstacles
{
  NSArray *v4;
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
  v4 = obstacles;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
        GKCObstacleGraph::addObstacle((GKCObstacleGraph *)self->_cObstacleGraph, (GKCPolygonObstacle *)objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "cPolygonObstacle", (_QWORD)v8));
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)removeAllObstacles
{
  GKCObstacleGraph::removeAllObstacles((GKCObstacleGraph *)self->_cObstacleGraph);
}

- (void)removeObstacles:(NSArray *)obstacles
{
  NSArray *v4;
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
  v4 = obstacles;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
        GKCObstacleGraph::removeObstacle((GKCObstacleGraph *)self->_cObstacleGraph, (GKCPolygonObstacle *)objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "cPolygonObstacle", (_QWORD)v8));
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (NSArray)nodesForObstacle:(GKPolygonObstacle *)obstacle
{
  GKPolygonObstacle *v4;
  void *v5;

  v4 = obstacle;
  GKCObstacleGraph::nodesForObstacle((GKCObstacleGraph *)self->_cObstacleGraph, (GKCPolygonObstacle *)-[GKPolygonObstacle cPolygonObstacle](v4, "cPolygonObstacle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (void)lockConnectionFromNode:(id)startNode toNode:(id)endNode
{
  id v6;
  id v7;

  v7 = startNode;
  v6 = endNode;
  GKCObstacleGraph::lockConnectionFromNode((GKCObstacleGraph *)self->_cObstacleGraph, (GKCGraphNode2D *)objc_msgSend(v7, "cGraphNode2D"), (GKCGraphNode2D *)objc_msgSend(v6, "cGraphNode2D"));

}

- (void)unlockConnectionFromNode:(id)startNode toNode:(id)endNode
{
  id v6;
  id v7;

  v7 = startNode;
  v6 = endNode;
  GKCObstacleGraph::unlockConnectionFromNode((uint64_t)self->_cObstacleGraph, objc_msgSend(v7, "cGraphNode2D"), objc_msgSend(v6, "cGraphNode2D"));

}

- (BOOL)isConnectionLockedFromNode:(id)startNode toNode:(id)endNode
{
  id v6;
  id v7;

  v6 = startNode;
  v7 = endNode;
  LOBYTE(self) = GKCObstacleGraph::isConnectedLockedFromNode((uint64_t)self->_cObstacleGraph, objc_msgSend(v6, "cGraphNode2D"), objc_msgSend(v7, "cGraphNode2D"));

  return (char)self;
}

- (Class)nodeClass
{
  return self->_nodeClass;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKObstacleGraph)initWithCoder:(id)a3
{
  id v4;
  GKObstacleGraph *v5;
  void *v6;
  void *v7;
  int v8;
  _QWORD *cObstacleGraph;
  unint64_t v10;
  _BYTE *v11;
  _BYTE *v12;
  char *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  __int128 *v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t *v38;
  char *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char *v44;
  uint64_t *v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  char *v50;
  uint64_t *v51;
  uint64_t v52;
  __int128 v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  char *v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t *v64;
  uint64_t **v65;
  uint64_t **v66;
  unint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  char *v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t *v75;
  uint64_t **v76;
  uint64_t **v77;
  unint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t *v81;
  id v83;
  void *v84;
  id v85;
  id obj;
  id v87;
  uint64_t v88;
  uint64_t v89;
  GKObstacleGraph *v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  id v95;
  objc_super v96;
  _BYTE v97[128];
  _QWORD v98[13];

  v98[11] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v96.receiver = self;
  v96.super_class = (Class)GKObstacleGraph;
  v5 = -[GKGraph initWithCoder:](&v96, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_73;
  v83 = v4;
  v85 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v98[0] = objc_opt_class();
  v98[1] = objc_opt_class();
  v98[2] = objc_opt_class();
  v98[3] = objc_opt_class();
  v98[4] = objc_opt_class();
  v98[5] = objc_opt_class();
  v98[6] = objc_opt_class();
  v98[7] = objc_opt_class();
  v98[8] = objc_opt_class();
  v98[9] = objc_opt_class();
  v98[10] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v98, 11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "addObjectsFromArray:", v6);

  objc_msgSend(v4, "allowedClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "unionSet:", v7);

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v85, CFSTR("_sourceObstacles"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v85, CFSTR("extrudedObstacles"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("bufferRadius"));
  *((_DWORD *)v5->_cObstacleGraph + 28) = v8;
  objc_storeStrong((id *)&v5->_sourceObstacles, obj);
  std::vector<NSObject * {__strong}>::reserve((uint64_t)v5->_cObstacleGraph + 88, objc_msgSend(v84, "count"));
  cObstacleGraph = v5->_cObstacleGraph;
  v10 = objc_msgSend(v84, "count");
  v11 = (_BYTE *)cObstacleGraph[8];
  if (v10 <= (uint64_t)(cObstacleGraph[10] - (_QWORD)v11) >> 3)
    goto LABEL_14;
  if (v10 >> 61)
    _ZNKSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEE20__throw_length_errorB8ne180100Ev();
  v12 = (_BYTE *)cObstacleGraph[9];
  v13 = (char *)operator new(8 * v10);
  v14 = v12 - v11;
  v15 = &v13[(v12 - v11) & 0xFFFFFFFFFFFFFFF8];
  v16 = v15;
  if (v12 != v11)
  {
    if ((unint64_t)(v14 - 8) < 0x58)
    {
      v16 = &v13[(v12 - v11) & 0xFFFFFFFFFFFFFFF8];
      do
      {
LABEL_11:
        v25 = *((_QWORD *)v12 - 1);
        v12 -= 8;
        *((_QWORD *)v16 - 1) = v25;
        v16 -= 8;
      }
      while (v12 != v11);
      goto LABEL_12;
    }
    v16 = &v13[(v12 - v11) & 0xFFFFFFFFFFFFFFF8];
    if (v12 - v13 - (v14 & 0xFFFFFFFFFFFFFFF8) < 0x20)
      goto LABEL_11;
    v17 = v14 >> 3;
    v18 = ((unint64_t)(v14 - 8) >> 3) + 1;
    v19 = 8 * (v18 & 0x3FFFFFFFFFFFFFFCLL);
    v20 = &v12[-v19];
    v16 = &v15[-v19];
    v21 = &v13[8 * v17 - 16];
    v22 = (__int128 *)(v12 - 16);
    v23 = v18 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v24 = *v22;
      *((_OWORD *)v21 - 1) = *(v22 - 1);
      *(_OWORD *)v21 = v24;
      v21 -= 32;
      v22 -= 2;
      v23 -= 4;
    }
    while (v23);
    v12 = v20;
    if (v18 != (v18 & 0x3FFFFFFFFFFFFFFCLL))
      goto LABEL_11;
  }
LABEL_12:
  cObstacleGraph[8] = v16;
  cObstacleGraph[9] = v15;
  cObstacleGraph[10] = &v13[8 * v10];
  if (v11)
    operator delete(v11);
LABEL_14:
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v87 = v84;
  v26 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v91, v97, 16);
  v90 = v5;
  if (!v26)
    goto LABEL_47;
  v88 = *(_QWORD *)v92;
  do
  {
    v89 = v26;
    v27 = 0;
    do
    {
      if (*(_QWORD *)v92 != v88)
        objc_enumerationMutation(v87);
      v30 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v27);
      v95 = v30;
      v31 = v5->_cObstacleGraph;
      v32 = (_QWORD *)v31[12];
      if ((unint64_t)v32 >= v31[13])
      {
        v33 = std::vector<NSObject * {__strong}>::__push_back_slow_path<NSObject * const {__strong}&>(v31 + 11, &v95);
      }
      else
      {
        *v32 = v30;
        v33 = v32 + 1;
      }
      v31[12] = v33;
      v34 = v5->_cObstacleGraph;
      v35 = objc_msgSend(v95, "cPolygonObstacle");
      v36 = v35;
      v38 = (uint64_t *)v34[9];
      v37 = v34[10];
      if ((unint64_t)v38 < v37)
      {
        *v38 = v35;
        v28 = (uint64_t)(v38 + 1);
        v29 = v89;
        v5 = v90;
        goto LABEL_18;
      }
      v39 = (char *)v34[8];
      v40 = ((char *)v38 - v39) >> 3;
      v41 = v40 + 1;
      if ((unint64_t)(v40 + 1) >> 61)
        _ZNKSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEE20__throw_length_errorB8ne180100Ev();
      v42 = v37 - (_QWORD)v39;
      if (v42 >> 2 > v41)
        v41 = v42 >> 2;
      if ((unint64_t)v42 >= 0x7FFFFFFFFFFFFFF8)
        v43 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v43 = v41;
      if (v43)
      {
        if (v43 >> 61)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v44 = (char *)operator new(8 * v43);
        v45 = (uint64_t *)&v44[8 * v40];
        *v45 = v36;
        v28 = (uint64_t)(v45 + 1);
        if (v38 != (uint64_t *)v39)
        {
LABEL_34:
          v46 = (char *)(v38 - 1) - v39;
          v5 = v90;
          if (v46 < 0x58)
          {
            v29 = v89;
            goto LABEL_43;
          }
          v29 = v89;
          if ((unint64_t)(v39 - v44) < 0x20)
            goto LABEL_79;
          v47 = (v46 >> 3) + 1;
          v48 = 8 * (v47 & 0x3FFFFFFFFFFFFFFCLL);
          v49 = &v38[v48 / 0xFFFFFFFFFFFFFFF8];
          v45 = (uint64_t *)((char *)v45 - v48);
          v50 = &v44[8 * v40 - 16];
          v51 = v38 - 2;
          v52 = v47 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v53 = *(_OWORD *)v51;
            *((_OWORD *)v50 - 1) = *((_OWORD *)v51 - 1);
            *(_OWORD *)v50 = v53;
            v50 -= 32;
            v51 -= 4;
            v52 -= 4;
          }
          while (v52);
          v38 = v49;
          if (v47 != (v47 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_79:
            do
            {
LABEL_43:
              v54 = *--v38;
              *--v45 = v54;
            }
            while (v38 != (uint64_t *)v39);
          }
          v38 = (uint64_t *)v34[8];
          v34[8] = v45;
          v34[9] = v28;
          v34[10] = &v44[8 * v43];
          if (!v38)
            goto LABEL_18;
LABEL_45:
          operator delete(v38);
          goto LABEL_18;
        }
      }
      else
      {
        v44 = 0;
        v45 = (uint64_t *)(8 * v40);
        *(_QWORD *)(8 * v40) = v36;
        v28 = 8 * v40 + 8;
        if (v38 != (uint64_t *)v39)
          goto LABEL_34;
      }
      v29 = v89;
      v5 = v90;
      v34[8] = v45;
      v34[9] = v28;
      v34[10] = &v44[8 * v43];
      if (v38)
        goto LABEL_45;
LABEL_18:
      v34[9] = v28;
      ++v27;
    }
    while (v27 != v29);
    v26 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v91, v97, 16);
  }
  while (v26);
LABEL_47:

  v55 = objc_msgSend(obj, "count");
  if (v55 >= 1)
  {
    v56 = 0;
    v57 = v55;
    do
    {
      objc_msgSend(obj, "objectAtIndexedSubscript:", v56);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "objectAtIndexedSubscript:", v56);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v59, "cPolygonObstacle");
      v61 = (char *)v5->_cObstacleGraph;
      v62 = objc_msgSend(v58, "cPolygonObstacle");
      v63 = v62;
      v65 = (uint64_t **)(v61 + 152);
      v64 = (uint64_t *)*((_QWORD *)v61 + 19);
      if (v64)
      {
        while (1)
        {
          while (1)
          {
            v66 = (uint64_t **)v64;
            v67 = v64[4];
            if (v62 >= v67)
              break;
            v64 = *v66;
            v65 = v66;
            if (!*v66)
              goto LABEL_56;
          }
          if (v67 >= v62)
            break;
          v64 = v66[1];
          if (!v64)
          {
            v65 = v66 + 1;
            goto LABEL_56;
          }
        }
        v68 = (uint64_t *)v66;
      }
      else
      {
        v66 = (uint64_t **)(v61 + 152);
LABEL_56:
        v68 = (uint64_t *)operator new(0x30uLL);
        v68[4] = v63;
        v68[5] = 0;
        *v68 = 0;
        v68[1] = 0;
        v68[2] = (uint64_t)v66;
        *v65 = v68;
        v69 = **((_QWORD **)v61 + 18);
        v70 = v68;
        if (v69)
        {
          *((_QWORD *)v61 + 18) = v69;
          v70 = *v65;
        }
        std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*((uint64_t **)v61 + 19), v70);
        ++*((_QWORD *)v61 + 20);
      }
      v68[5] = v60;
      v71 = objc_msgSend(v58, "cPolygonObstacle");
      v72 = (char *)v90->_cObstacleGraph;
      v73 = objc_msgSend(v59, "cPolygonObstacle");
      v74 = v73;
      v76 = (uint64_t **)(v72 + 176);
      v75 = (uint64_t *)*((_QWORD *)v72 + 22);
      if (v75)
      {
        while (1)
        {
          while (1)
          {
            v77 = (uint64_t **)v75;
            v78 = v75[4];
            if (v73 >= v78)
              break;
            v75 = *v77;
            v76 = v77;
            if (!*v77)
              goto LABEL_67;
          }
          if (v78 >= v73)
            break;
          v75 = v77[1];
          if (!v75)
          {
            v76 = v77 + 1;
            goto LABEL_67;
          }
        }
        v79 = (uint64_t *)v77;
      }
      else
      {
        v77 = (uint64_t **)(v72 + 176);
LABEL_67:
        v79 = (uint64_t *)operator new(0x30uLL);
        v79[4] = v74;
        v79[5] = 0;
        *v79 = 0;
        v79[1] = 0;
        v79[2] = (uint64_t)v77;
        *v76 = v79;
        v80 = **((_QWORD **)v72 + 21);
        v81 = v79;
        if (v80)
        {
          *((_QWORD *)v72 + 21) = v80;
          v81 = *v76;
        }
        std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*((uint64_t **)v72 + 22), v81);
        ++*((_QWORD *)v72 + 23);
      }
      v5 = v90;
      v79[5] = v71;

      ++v56;
    }
    while (v56 != v57);
  }

  v4 = v83;
LABEL_73:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)GKObstacleGraph;
  -[GKGraph encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sourceObstacles, CFSTR("_sourceObstacles"));
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:count:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("extrudedObstacles"));
  -[GKObstacleGraph bufferRadius](self, "bufferRadius");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("bufferRadius"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceObstacles, 0);
}

@end
