@implementation GKMeshGraph

- (void)makeCGraph
{
  id *v3;

  v3 = (id *)operator new();
  GKCMeshGraph::GKCMeshGraph((GKCMeshGraph *)v3);
  self->_cMeshGraph = v3;
  objc_storeWeak(v3 + 83, self);
  return self->_cMeshGraph;
}

- (void)cMeshGraph
{
  return self->_cMeshGraph;
}

- (NSArray)obstacles
{
  return (NSArray *)self->_sourceObstacles;
}

- (void)setTriangulationMode:(GKMeshGraphTriangulationMode)triangulationMode
{
  _BYTE *cMeshGraph;

  cMeshGraph = self->_cMeshGraph;
  cMeshGraph[657] = (triangulationMode & 2) != 0;
  cMeshGraph[656] = triangulationMode & 1;
  cMeshGraph[658] = (triangulationMode & 4) != 0;
}

- (GKMeshGraphTriangulationMode)triangulationMode
{
  unsigned __int8 *cMeshGraph;

  cMeshGraph = (unsigned __int8 *)self->_cMeshGraph;
  if (cMeshGraph[658])
    return cMeshGraph[656] | (2 * cMeshGraph[657]) | 4;
  else
    return cMeshGraph[656] | (2 * cMeshGraph[657]);
}

- (void)setMakeNodesFromTriangleCenters:(BOOL)a3
{
  *((_BYTE *)self->_cMeshGraph + 657) = a3;
}

- (BOOL)makeNodesFromTriangleCenters
{
  return *((_BYTE *)self->_cMeshGraph + 657);
}

- (void)setMakeNodesFromTriangleVertices:(BOOL)a3
{
  *((_BYTE *)self->_cMeshGraph + 656) = a3;
}

- (BOOL)makeNodesFromTriangleVertices
{
  return *((_BYTE *)self->_cMeshGraph + 656);
}

- (void)setMakeNodesFromTriangleEdgeMidpoints:(BOOL)a3
{
  *((_BYTE *)self->_cMeshGraph + 658) = a3;
}

- (BOOL)makeNodesFromTriangleEdgeMidpoints
{
  return *((_BYTE *)self->_cMeshGraph + 658);
}

- (Class)nodeClass
{
  return self->_nodeClass;
}

- (float)bufferRadius
{
  return *((float *)self->_cMeshGraph + 168);
}

+ (GKMeshGraph)graphWithBufferRadius:(float)bufferRadius minCoordinate:(vector_float2)min maxCoordinate:(vector_float2)max nodeClass:(Class)nodeClass
{
  id v10;
  double v11;

  v10 = objc_alloc((Class)a1);
  *(float *)&v11 = bufferRadius;
  return (GKMeshGraph *)(id)objc_msgSend(v10, "initWithBufferRadius:minCoordinate:maxCoordinate:nodeClass:", nodeClass, v11, *(double *)&min, *(double *)&max);
}

- (GKMeshGraph)initWithBufferRadius:(float)bufferRadius minCoordinate:(vector_float2)min maxCoordinate:(vector_float2)max nodeClass:(Class)nodeClass
{
  GKMeshGraph *v10;
  GKMeshGraph *v11;
  uint64_t v12;
  NSMutableArray *sourceObstacles;
  vector_float2 *cMeshGraph;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)GKMeshGraph;
  v10 = -[GKGraph init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_nodeClass = nodeClass;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    sourceObstacles = v11->_sourceObstacles;
    v11->_sourceObstacles = (NSMutableArray *)v12;

    cMeshGraph = (vector_float2 *)v11->_cMeshGraph;
    cMeshGraph[84].f32[0] = fmaxf(bufferRadius, 0.0);
    cMeshGraph[85] = min;
    *((vector_float2 *)v11->_cMeshGraph + 86) = max;
  }
  return v11;
}

+ (GKMeshGraph)graphWithBufferRadius:(float)bufferRadius minCoordinate:(vector_float2)min maxCoordinate:(vector_float2)max
{
  uint64_t v9;
  double v10;

  v9 = objc_opt_class();
  *(float *)&v10 = bufferRadius;
  return (GKMeshGraph *)objc_msgSend(a1, "graphWithBufferRadius:minCoordinate:maxCoordinate:nodeClass:", v9, v10, *(double *)&min, *(double *)&max);
}

- (GKMeshGraph)initWithBufferRadius:(float)bufferRadius minCoordinate:(vector_float2)min maxCoordinate:(vector_float2)max
{
  uint64_t v9;
  double v10;

  v9 = objc_opt_class();
  *(float *)&v10 = bufferRadius;
  return -[GKMeshGraph initWithBufferRadius:minCoordinate:maxCoordinate:nodeClass:](self, "initWithBufferRadius:minCoordinate:maxCoordinate:nodeClass:", v9, v10, *(double *)&min, *(double *)&max);
}

- (void)addObstacles:(NSArray *)obstacles
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = obstacles;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if ((-[NSMutableArray containsObject:](self->_sourceObstacles, "containsObject:", v8, (_QWORD)v9) & 1) == 0)
        {
          -[NSMutableArray addObject:](self->_sourceObstacles, "addObject:", v8);
          GKCMeshGraph::AddObstacle((GKCMeshGraph *)self->_cMeshGraph, (id *)objc_msgSend(v8, "cPolygonObstacle"));
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)removeObstacles:(NSArray *)obstacles
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = obstacles;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (-[NSMutableArray containsObject:](self->_sourceObstacles, "containsObject:", v8, (_QWORD)v9))
        {
          -[NSMutableArray removeObject:](self->_sourceObstacles, "removeObject:", v8);
          GKCMeshGraph::RemoveObstacle((GKCMeshGraph *)self->_cMeshGraph, (GKCPolygonObstacle *)objc_msgSend(v8, "cPolygonObstacle"));
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)connectNodeUsingObstacles:(id)node
{
  id v4;

  v4 = node;
  GKCMeshGraph::ConnectNodeUsingObstacles((p2t::CDT **)self->_cMeshGraph, (float32x2_t *)objc_msgSend(v4, "cGraphNode2D"));

}

- (void)triangulate
{
  GKCMeshGraph::Triangulate((GKCMeshGraph *)self->_cMeshGraph);
}

- (NSUInteger)triangleCount
{
  return (int)GKCMeshGraph::GetNumTriangles((p2t::CDT **)self->_cMeshGraph);
}

- (GKTriangle)triangleAtIndex:(SEL)a3
{
  return (GKTriangle *)GKCMeshGraph::TriangleAtIndex((p2t::CDT **)self->_cMeshGraph, index);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKMeshGraph)initWithCoder:(id)a3
{
  id v4;
  GKMeshGraph *v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  NSString *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  _QWORD *cMeshGraph;
  unint64_t v16;
  unint64_t v17;
  _BYTE *v18;
  _BYTE *v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  __int128 *v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD *v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t *v45;
  char *v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char *v51;
  uint64_t *v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  char *v57;
  uint64_t *v58;
  uint64_t v59;
  __int128 v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  char *v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t *v71;
  uint64_t **v72;
  uint64_t **v73;
  unint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  char *v79;
  unint64_t v80;
  unint64_t v81;
  uint64_t *v82;
  uint64_t **v83;
  uint64_t **v84;
  unint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t *v88;
  void *v90;
  id v91;
  id v92;
  id obj;
  id v94;
  uint64_t v95;
  uint64_t v96;
  unsigned int v97;
  unsigned int v98;
  GKMeshGraph *v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  id v104;
  objc_super v105;
  _BYTE v106[128];
  _QWORD v107[13];

  v107[11] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v105.receiver = self;
  v105.super_class = (Class)GKMeshGraph;
  v5 = -[GKGraph initWithCoder:](&v105, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_73;
  v92 = v4;
  v91 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v107[0] = objc_opt_class();
  v107[1] = objc_opt_class();
  v107[2] = objc_opt_class();
  v107[3] = objc_opt_class();
  v107[4] = objc_opt_class();
  v107[5] = objc_opt_class();
  v107[6] = objc_opt_class();
  v107[7] = objc_opt_class();
  v107[8] = objc_opt_class();
  v107[9] = objc_opt_class();
  v107[10] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v107, 11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "addObjectsFromArray:", v6);

  objc_msgSend(v4, "allowedClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "unionSet:", v7);

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v91, CFSTR("_sourceObstacles"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v91, CFSTR("extrudedObstacles"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("bufferRadius"));
  v9 = v8;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("class"));
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  v5->_nodeClass = NSClassFromString(v10);

  *((float *)v5->_cMeshGraph + 168) = fmaxf(v9, 0.0);
  objc_storeStrong((id *)&v5->_sourceObstacles, obj);
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("minX"));
  v97 = v11;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("minY"));
  *((_QWORD *)v5->_cMeshGraph + 85) = __PAIR64__(v12, v97);
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("maxX"));
  v98 = v13;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("maxY"));
  *((_QWORD *)v5->_cMeshGraph + 86) = __PAIR64__(v14, v98);
  std::vector<NSObject * {__strong}>::reserve((uint64_t)v5->_cMeshGraph + 424, objc_msgSend(v90, "count"));
  cMeshGraph = v5->_cMeshGraph;
  v16 = objc_msgSend(v90, "count");
  v17 = v16;
  v18 = (_BYTE *)cMeshGraph[50];
  if (v16 <= (uint64_t)(cMeshGraph[52] - (_QWORD)v18) >> 3)
    goto LABEL_14;
  if (v16 >> 61)
    _ZNKSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEE20__throw_length_errorB8ne180100Ev();
  v19 = (_BYTE *)cMeshGraph[51];
  v20 = (char *)operator new(8 * v16);
  v21 = v19 - v18;
  v22 = &v20[(v19 - v18) & 0xFFFFFFFFFFFFFFF8];
  v23 = v22;
  if (v19 != v18)
  {
    if ((unint64_t)(v21 - 8) < 0x58)
    {
      v23 = &v20[(v19 - v18) & 0xFFFFFFFFFFFFFFF8];
      do
      {
LABEL_11:
        v32 = *((_QWORD *)v19 - 1);
        v19 -= 8;
        *((_QWORD *)v23 - 1) = v32;
        v23 -= 8;
      }
      while (v19 != v18);
      goto LABEL_12;
    }
    v23 = &v20[(v19 - v18) & 0xFFFFFFFFFFFFFFF8];
    if (v19 - v20 - (v21 & 0xFFFFFFFFFFFFFFF8) < 0x20)
      goto LABEL_11;
    v24 = v21 >> 3;
    v25 = ((unint64_t)(v21 - 8) >> 3) + 1;
    v26 = 8 * (v25 & 0x3FFFFFFFFFFFFFFCLL);
    v27 = &v19[-v26];
    v23 = &v22[-v26];
    v28 = &v20[8 * v24 - 16];
    v29 = (__int128 *)(v19 - 16);
    v30 = v25 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v31 = *v29;
      *((_OWORD *)v28 - 1) = *(v29 - 1);
      *(_OWORD *)v28 = v31;
      v28 -= 32;
      v29 -= 2;
      v30 -= 4;
    }
    while (v30);
    v19 = v27;
    if (v25 != (v25 & 0x3FFFFFFFFFFFFFFCLL))
      goto LABEL_11;
  }
LABEL_12:
  cMeshGraph[50] = v23;
  cMeshGraph[51] = v22;
  cMeshGraph[52] = &v20[8 * v17];
  if (v18)
    operator delete(v18);
LABEL_14:
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v94 = v90;
  v33 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v100, v106, 16);
  v99 = v5;
  if (!v33)
    goto LABEL_47;
  v95 = *(_QWORD *)v101;
  do
  {
    v96 = v33;
    v34 = 0;
    do
    {
      if (*(_QWORD *)v101 != v95)
        objc_enumerationMutation(v94);
      v37 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * v34);
      v104 = v37;
      v38 = v5->_cMeshGraph;
      v39 = (_QWORD *)v38[54];
      if ((unint64_t)v39 >= v38[55])
      {
        v40 = std::vector<NSObject * {__strong}>::__push_back_slow_path<NSObject * const {__strong}&>(v38 + 53, &v104);
      }
      else
      {
        *v39 = v37;
        v40 = v39 + 1;
      }
      v38[54] = v40;
      v41 = v5->_cMeshGraph;
      v42 = objc_msgSend(v104, "cPolygonObstacle");
      v43 = v42;
      v45 = (uint64_t *)v41[51];
      v44 = v41[52];
      if ((unint64_t)v45 < v44)
      {
        *v45 = v42;
        v35 = (uint64_t)(v45 + 1);
        v36 = v96;
        v5 = v99;
        goto LABEL_18;
      }
      v46 = (char *)v41[50];
      v47 = ((char *)v45 - v46) >> 3;
      v48 = v47 + 1;
      if ((unint64_t)(v47 + 1) >> 61)
        _ZNKSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEE20__throw_length_errorB8ne180100Ev();
      v49 = v44 - (_QWORD)v46;
      if (v49 >> 2 > v48)
        v48 = v49 >> 2;
      if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFF8)
        v50 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v50 = v48;
      if (v50)
      {
        if (v50 >> 61)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v51 = (char *)operator new(8 * v50);
        v52 = (uint64_t *)&v51[8 * v47];
        *v52 = v43;
        v35 = (uint64_t)(v52 + 1);
        if (v45 != (uint64_t *)v46)
        {
LABEL_34:
          v53 = (char *)(v45 - 1) - v46;
          v5 = v99;
          if (v53 < 0x58)
          {
            v36 = v96;
            goto LABEL_43;
          }
          v36 = v96;
          if ((unint64_t)(v46 - v51) < 0x20)
            goto LABEL_79;
          v54 = (v53 >> 3) + 1;
          v55 = 8 * (v54 & 0x3FFFFFFFFFFFFFFCLL);
          v56 = &v45[v55 / 0xFFFFFFFFFFFFFFF8];
          v52 = (uint64_t *)((char *)v52 - v55);
          v57 = &v51[8 * v47 - 16];
          v58 = v45 - 2;
          v59 = v54 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v60 = *(_OWORD *)v58;
            *((_OWORD *)v57 - 1) = *((_OWORD *)v58 - 1);
            *(_OWORD *)v57 = v60;
            v57 -= 32;
            v58 -= 4;
            v59 -= 4;
          }
          while (v59);
          v45 = v56;
          if (v54 != (v54 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_79:
            do
            {
LABEL_43:
              v61 = *--v45;
              *--v52 = v61;
            }
            while (v45 != (uint64_t *)v46);
          }
          v45 = (uint64_t *)v41[50];
          v41[50] = v52;
          v41[51] = v35;
          v41[52] = &v51[8 * v50];
          if (!v45)
            goto LABEL_18;
LABEL_45:
          operator delete(v45);
          goto LABEL_18;
        }
      }
      else
      {
        v51 = 0;
        v52 = (uint64_t *)(8 * v47);
        *(_QWORD *)(8 * v47) = v43;
        v35 = 8 * v47 + 8;
        if (v45 != (uint64_t *)v46)
          goto LABEL_34;
      }
      v36 = v96;
      v5 = v99;
      v41[50] = v52;
      v41[51] = v35;
      v41[52] = &v51[8 * v50];
      if (v45)
        goto LABEL_45;
LABEL_18:
      v41[51] = v35;
      ++v34;
    }
    while (v34 != v36);
    v33 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v100, v106, 16);
  }
  while (v33);
LABEL_47:

  v62 = objc_msgSend(obj, "count");
  if (v62 >= 1)
  {
    v63 = 0;
    v64 = v62;
    do
    {
      objc_msgSend(obj, "objectAtIndexedSubscript:", v63);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "objectAtIndexedSubscript:", v63);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v66, "cPolygonObstacle");
      v68 = (char *)v5->_cMeshGraph;
      v69 = objc_msgSend(v65, "cPolygonObstacle");
      v70 = v69;
      v71 = (uint64_t *)*((_QWORD *)v68 + 57);
      if (v71)
      {
        while (1)
        {
          while (1)
          {
            v73 = (uint64_t **)v71;
            v74 = v71[4];
            if (v69 >= v74)
              break;
            v71 = *v73;
            v72 = v73;
            if (!*v73)
              goto LABEL_56;
          }
          if (v74 >= v69)
            break;
          v71 = v73[1];
          if (!v71)
          {
            v72 = v73 + 1;
            goto LABEL_56;
          }
        }
        v75 = (uint64_t *)v73;
      }
      else
      {
        v72 = (uint64_t **)(v68 + 456);
        v73 = (uint64_t **)(v68 + 456);
LABEL_56:
        v75 = (uint64_t *)operator new(0x30uLL);
        v75[4] = v70;
        v75[5] = 0;
        *v75 = 0;
        v75[1] = 0;
        v75[2] = (uint64_t)v73;
        *v72 = v75;
        v76 = **((_QWORD **)v68 + 56);
        v77 = v75;
        if (v76)
        {
          *((_QWORD *)v68 + 56) = v76;
          v77 = *v72;
        }
        std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*((uint64_t **)v68 + 57), v77);
        ++*((_QWORD *)v68 + 58);
      }
      v75[5] = v67;
      v78 = objc_msgSend(v65, "cPolygonObstacle");
      v79 = (char *)v99->_cMeshGraph;
      v80 = objc_msgSend(v66, "cPolygonObstacle");
      v81 = v80;
      v82 = (uint64_t *)*((_QWORD *)v79 + 60);
      if (v82)
      {
        while (1)
        {
          while (1)
          {
            v84 = (uint64_t **)v82;
            v85 = v82[4];
            if (v80 >= v85)
              break;
            v82 = *v84;
            v83 = v84;
            if (!*v84)
              goto LABEL_67;
          }
          if (v85 >= v80)
            break;
          v82 = v84[1];
          if (!v82)
          {
            v83 = v84 + 1;
            goto LABEL_67;
          }
        }
        v86 = (uint64_t *)v84;
      }
      else
      {
        v83 = (uint64_t **)(v79 + 480);
        v84 = (uint64_t **)(v79 + 480);
LABEL_67:
        v86 = (uint64_t *)operator new(0x30uLL);
        v86[4] = v81;
        v86[5] = 0;
        *v86 = 0;
        v86[1] = 0;
        v86[2] = (uint64_t)v84;
        *v83 = v86;
        v87 = **((_QWORD **)v79 + 59);
        v88 = v86;
        if (v87)
        {
          *((_QWORD *)v79 + 59) = v87;
          v88 = *v83;
        }
        std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*((uint64_t **)v79 + 60), v88);
        ++*((_QWORD *)v79 + 61);
      }
      v5 = v99;
      v86[5] = v78;

      ++v63;
    }
    while (v63 != v64);
  }

  v4 = v92;
LABEL_73:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKMeshGraph;
  -[GKGraph encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sourceObstacles, CFSTR("_sourceObstacles"));
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:count:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("extrudedObstacles"));
  -[GKMeshGraph bufferRadius](self, "bufferRadius");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("bufferRadius"));
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("minX"), *((double *)self->_cMeshGraph + 85));
  LODWORD(v6) = *((_DWORD *)self->_cMeshGraph + 171);
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("minY"), v6);
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("maxX"), *((double *)self->_cMeshGraph + 86));
  LODWORD(v7) = *((_DWORD *)self->_cMeshGraph + 173);
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("maxY"), v7);
  NSStringFromClass(-[GKMeshGraph nodeClass](self, "nodeClass"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("class"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceObstacles, 0);
}

@end
