@implementation CLSGraph

- (CLSGraph)init
{
  return (CLSGraph *)MEMORY[0x1E0DE7D20](self, sel_initWithMemoryOptions_, 0);
}

- (CLSGraph)initWithMemoryOptions:(unint64_t)a3
{
  CLSGraph *v4;
  CLSGraph *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  NSMapTable *verticesMap;
  id v10;
  const char *v11;
  uint64_t v12;
  NSMapTable *inEdgesMap;
  id v14;
  const char *v15;
  uint64_t v16;
  NSMapTable *outEdgesMap;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CLSGraph;
  v4 = -[CLSGraph init](&v19, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_options = a3;
    v6 = objc_alloc(MEMORY[0x1E0CB3748]);
    v8 = objc_msgSend_initWithKeyOptions_valueOptions_capacity_(v6, v7, a3, v5->_options, 50);
    verticesMap = v5->_verticesMap;
    v5->_verticesMap = (NSMapTable *)v8;

    v10 = objc_alloc(MEMORY[0x1E0CB3748]);
    v12 = objc_msgSend_initWithKeyOptions_valueOptions_capacity_(v10, v11, a3, v5->_options, 50);
    inEdgesMap = v5->_inEdgesMap;
    v5->_inEdgesMap = (NSMapTable *)v12;

    v14 = objc_alloc(MEMORY[0x1E0CB3748]);
    v16 = objc_msgSend_initWithKeyOptions_valueOptions_capacity_(v14, v15, a3, v5->_options, 50);
    outEdgesMap = v5->_outEdgesMap;
    v5->_outEdgesMap = (NSMapTable *)v16;

  }
  return v5;
}

- (unint64_t)vertexCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_verticesMap, a2, v2);
}

- (unint64_t)edgeCount
{
  NSMapTable *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = self->_outEdgesMap;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v3);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1D82573E4](v5);
        objc_msgSend_objectForKey_(self->_outEdgesMap, v12, v10, (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v7 += objc_msgSend_count(v13, v14, v15);

        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v6 != v9);
      v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v16, (uint64_t)&v18, v22, 16);
      v6 = v5;
    }
    while (v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)reset
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;

  objc_msgSend_removeAllObjects(self->_inEdgesMap, a2, v2);
  objc_msgSend_removeAllObjects(self->_outEdgesMap, v4, v5);
  objc_msgSend_removeAllObjects(self->_verticesMap, v6, v7);
}

- (CLSGraphVertex)anyVertex
{
  NSMapTable *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  _OWORD v11[4];
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  memset(v11, 0, sizeof(v11));
  v3 = self->_verticesMap;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)v11, v12, 16);
  if (v5)
  {
    v6 = **((_QWORD **)&v11[0] + 1);
    v7 = (void *)MEMORY[0x1D82573E4](v5);
    objc_msgSend_objectForKey_(self->_verticesMap, v8, v6, *(_QWORD *)&v11[0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    v9 = 0;
  }

  return (CLSGraphVertex *)v9;
}

- (unint64_t)degree:(id)a3
{
  NSMapTable *inEdgesMap;
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;

  inEdgesMap = self->_inEdgesMap;
  v5 = a3;
  v7 = objc_msgSend__degreeOfVertex_inEdgeMap_(self, v6, (uint64_t)v5, inEdgesMap);
  v9 = objc_msgSend__degreeOfVertex_inEdgeMap_(self, v8, (uint64_t)v5, self->_outEdgesMap);

  return v9 + v7;
}

- (unint64_t)inDegree:(id)a3
{
  return objc_msgSend__degreeOfVertex_inEdgeMap_(self, a2, (uint64_t)a3, self->_inEdgesMap);
}

- (unint64_t)outDegree:(id)a3
{
  return objc_msgSend__degreeOfVertex_inEdgeMap_(self, a2, (uint64_t)a3, self->_outEdgesMap);
}

- (unint64_t)_degreeOfVertex:(id)a3 inEdgeMap:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  unint64_t v13;

  v5 = a4;
  objc_msgSend_vertexID(a3, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v5, v9, (uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend_count(v10, v11, v12);
  return v13;
}

- (id)vertexWithVertexID:(id)a3
{
  return (id)objc_msgSend_objectForKey_(self->_verticesMap, a2, (uint64_t)a3);
}

- (BOOL)containsVertexWithVertexID:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend_objectForKey_(self->_verticesMap, a2, (uint64_t)a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)containsVertex:(id)a3
{
  void *v4;
  const char *v5;

  objc_msgSend_vertexID(a3, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend_containsVertexWithVertexID_(self, v5, (uint64_t)v4);

  return (char)self;
}

- (BOOL)hasEdgeFromVertex:(id)a3 toVertex:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;

  v6 = a4;
  objc_msgSend_vertexID(a3, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(self->_outEdgesMap, v10, (uint64_t)v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vertexID(v6, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v9) = objc_msgSend_containsObject_(v11, v15, (uint64_t)v14);
  return (char)v9;
}

- (void)addVertex:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  id v8;
  CLSGraph *v9;
  const char *v10;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  void *v15;
  const char *v16;
  id v17;

  v17 = a3;
  objc_msgSend_vertexID(v17, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(self->_verticesMap, v7, (uint64_t)v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 != v17)
  {
    v9 = self;
    objc_sync_enter(v9);
    objc_msgSend_objectForKey_(v9->_inEdgesMap, v10, (uint64_t)v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend_hashTableWithOptions_(MEMORY[0x1E0CB3690], v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_setObject_forKey_(v9->_inEdgesMap, v11, (uint64_t)v12, v6);
    objc_msgSend_objectForKey_(v9->_outEdgesMap, v13, (uint64_t)v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      objc_msgSend_hashTableWithOptions_(MEMORY[0x1E0CB3690], v14, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_setObject_forKey_(v9->_outEdgesMap, v14, (uint64_t)v15, v6);
    objc_msgSend_setObject_forKey_(self->_verticesMap, v16, (uint64_t)v17, v6);

    objc_sync_exit(v9);
  }

}

- (void)addEdgeFromVertex:(id)a3 toVertex:(id)a4
{
  id v6;
  const char *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  CLSGraph *v15;
  const char *v16;
  void *v17;
  const char *v18;
  const char *v19;
  void *v20;
  const char *v21;
  id v22;

  v22 = a3;
  v6 = a4;
  objc_msgSend_addVertex_(self, v7, (uint64_t)v22);
  objc_msgSend_addVertex_(self, v8, (uint64_t)v6);
  objc_msgSend_vertexID(v22, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vertexID(v6, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = self;
  objc_sync_enter(v15);
  objc_msgSend_objectForKey_(v15->_outEdgesMap, v16, (uint64_t)v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v17, v18, (uint64_t)v14);
  objc_msgSend_objectForKey_(v15->_inEdgesMap, v19, (uint64_t)v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_addObject_(v20, v21, (uint64_t)v11);
  objc_sync_exit(v15);

}

- (void)removeVertex:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  void *v22;
  const char *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_vertexID(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(self->_outEdgesMap, v8, (uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectForKey_(self->_outEdgesMap, v10, (uint64_t)v7);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v11 = v9;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v39, v44, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v40;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v40 != v15)
          objc_enumerationMutation(v11);
        v17 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v16);
        v18 = (void *)MEMORY[0x1D82573E4]();
        objc_msgSend__removeEdgeFromVertexWithID_toVertexWithID_(self, v19, (uint64_t)v7, v17);
        objc_autoreleasePoolPop(v18);
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v20, (uint64_t)&v39, v44, 16);
    }
    while (v14);
  }

  objc_msgSend_objectForKey_(self->_inEdgesMap, v21, (uint64_t)v7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectForKey_(self->_inEdgesMap, v23, (uint64_t)v7);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v24 = v22;
  v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v35, v43, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v36;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v36 != v28)
          objc_enumerationMutation(v24);
        v30 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v29);
        v31 = (void *)MEMORY[0x1D82573E4](v26);
        objc_msgSend__removeEdgeFromVertexWithID_toVertexWithID_(self, v32, v30, v7, (_QWORD)v35);
        objc_autoreleasePoolPop(v31);
        ++v29;
      }
      while (v27 != v29);
      v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v33, (uint64_t)&v35, v43, 16);
      v27 = v26;
    }
    while (v26);
  }

  objc_msgSend_removeObjectForKey_(self->_verticesMap, v34, (uint64_t)v7);
}

- (void)removeEdgeFromVertex:(id)a3 toVertex:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  id v13;

  v6 = a4;
  objc_msgSend_vertexID(a3, v7, v8);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vertexID(v6, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__removeEdgeFromVertexWithID_toVertexWithID_(self, v12, (uint64_t)v13, v11);
}

- (void)_removeEdgeFromVertexWithID:(id)a3 toVertexWithID:(id)a4
{
  NSMapTable *outEdgesMap;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  id v14;

  outEdgesMap = self->_outEdgesMap;
  v7 = a4;
  v8 = a3;
  objc_msgSend_objectForKey_(outEdgesMap, v9, (uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObject_(v10, v11, (uint64_t)v7);
  objc_msgSend_objectForKey_(self->_inEdgesMap, v12, (uint64_t)v7);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_removeObject_(v14, v13, (uint64_t)v8);
}

- (void)removeSubtreeStartingAtVertex:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_outNeighboursOfVertex_(self, v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeVertex_(self, v7, (uint64_t)v4);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v6;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v16, v20, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v8);
        v15 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (!objc_msgSend_inDegree_(self, v11, v15, (_QWORD)v16))
          objc_msgSend_removeSubtreeStartingAtVertex_(self, v11, v15);
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v16, v20, 16);
    }
    while (v12);
  }

}

- (id)neighboursOfVertex:(id)a3
{
  id v4;
  void *v5;
  id v6;
  const char *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D40680FC;
  v9[3] = &unk_1E9749F28;
  v6 = v5;
  v10 = v6;
  objc_msgSend_enumerateNeighboursOfVertex_enumerationBlock_(self, v7, (uint64_t)v4, v9);

  return v6;
}

- (void)enumerateNeighboursOfVertex:(id)a3 enumerationBlock:(id)a4
{
  id v6;
  CLSGraph *v7;
  NSMapTable *inEdgesMap;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  NSMapTable *outEdgesMap;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  id v22;

  v22 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  inEdgesMap = v7->_inEdgesMap;
  objc_msgSend_vertexID(v22, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(inEdgesMap, v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__enumerateVerticesInEdges_skipingEdges_enumerationBlock_(v7, v14, (uint64_t)v13, 0, v6);
  outEdgesMap = v7->_outEdgesMap;
  objc_msgSend_vertexID(v22, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(outEdgesMap, v19, (uint64_t)v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__enumerateVerticesInEdges_skipingEdges_enumerationBlock_(v7, v21, (uint64_t)v20, v13, v6);
  objc_sync_exit(v7);

}

- (id)inNeighboursOfVertex:(id)a3
{
  id v4;
  void *v5;
  id v6;
  const char *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D40682AC;
  v9[3] = &unk_1E9749F28;
  v6 = v5;
  v10 = v6;
  objc_msgSend_enumerateInNeighboursOfVertex_enumerationBlock_(self, v7, (uint64_t)v4, v9);

  return v6;
}

- (void)enumerateInNeighboursOfVertex:(id)a3 enumerationBlock:(id)a4
{
  id v6;
  CLSGraph *v7;
  NSMapTable *inEdgesMap;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  inEdgesMap = v7->_inEdgesMap;
  objc_msgSend_vertexID(v15, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(inEdgesMap, v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__enumerateVerticesInEdges_skipingEdges_enumerationBlock_(v7, v14, (uint64_t)v13, 0, v6);
  objc_sync_exit(v7);

}

- (id)outNeighboursOfVertex:(id)a3
{
  id v4;
  void *v5;
  id v6;
  const char *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D406840C;
  v9[3] = &unk_1E9749F28;
  v6 = v5;
  v10 = v6;
  objc_msgSend_enumerateOutNeighboursOfVertex_enumerationBlock_(self, v7, (uint64_t)v4, v9);

  return v6;
}

- (void)enumerateOutNeighboursOfVertex:(id)a3 enumerationBlock:(id)a4
{
  id v6;
  CLSGraph *v7;
  NSMapTable *outEdgesMap;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  outEdgesMap = v7->_outEdgesMap;
  objc_msgSend_vertexID(v15, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(outEdgesMap, v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__enumerateVerticesInEdges_skipingEdges_enumerationBlock_(v7, v14, (uint64_t)v13, 0, v6);
  objc_sync_exit(v7);

}

- (void)_enumerateVerticesInEdges:(id)a3 skipingEdges:(id)a4 enumerationBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _BYTE *);
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  void *v21;
  int v22;
  const char *v23;
  unsigned __int8 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _BYTE *))a5;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = v8;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v25, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v11);
        v17 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        v18 = (void *)MEMORY[0x1D82573E4]();
        if ((objc_msgSend_containsObject_(v9, v19, v17) & 1) == 0)
        {
          objc_msgSend_objectForKey_(self->_verticesMap, v20, v17);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 0;
          v10[2](v10, v21, &v24);
          v22 = v24;

          if (v22)
          {
            objc_autoreleasePoolPop(v18);
            goto LABEL_12;
          }
        }
        objc_autoreleasePoolPop(v18);
      }
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v23, (uint64_t)&v25, v29, 16);
      if (v14)
        continue;
      break;
    }
  }
LABEL_12:

}

- (void)enumerate:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  NSMapTable *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  int v15;
  const char *v16;
  unsigned __int8 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _BYTE *))a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_verticesMap;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v9)
        objc_enumerationMutation(v5);
      v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10);
      v12 = (void *)MEMORY[0x1D82573E4]();
      objc_msgSend_objectForKey_(self->_verticesMap, v13, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      v4[2](v4, v14, &v17);
      v15 = v17;

      objc_autoreleasePoolPop(v12);
      if (v15)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v16, (uint64_t)&v18, v22, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)traverse:(id)a3
{
  objc_msgSend_traverseVerticesPassingTest_enumerationBlock_(self, a2, (uint64_t)&unk_1E9749930, a3);
}

- (void)traverseVerticesPassingTest:(id)a3 enumerationBlock:(id)a4
{
  unsigned int (**v6)(id, void *);
  id v7;
  const char *v8;
  id v9;
  NSMapTable *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = (unsigned int (**)(id, void *))a3;
  v7 = a4;
  v9 = (id)objc_msgSend_hashTableWithOptions_(MEMORY[0x1E0CB3690], v8, 517);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = self->_verticesMap;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v23, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v10);
        v16 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v15);
        v17 = (void *)MEMORY[0x1D82573E4](v12);
        objc_msgSend_objectForKey_(self->_verticesMap, v18, v16, (_QWORD)v23);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_containsObject_(v9, v20, (uint64_t)v19) & 1) == 0 && v6[2](v6, v19))
          objc_msgSend__traverseStartingAtVertex_previousVertex_visitedVertices_enumerationBlock_(self, v21, (uint64_t)v19, 0, v9, v7);

        objc_autoreleasePoolPop(v17);
        ++v15;
      }
      while (v13 != v15);
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v22, (uint64_t)&v23, v27, 16);
      v13 = v12;
    }
    while (v12);
  }

}

- (void)traverseStartingAtVertex:(id)a3 enumerationBlock:(id)a4
{
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  id v11;

  v6 = (void *)MEMORY[0x1E0CB3690];
  v7 = a4;
  v11 = a3;
  v9 = objc_msgSend_hashTableWithOptions_(v6, v8, 517);
  objc_msgSend__traverseStartingAtVertex_previousVertex_visitedVertices_enumerationBlock_(self, v10, (uint64_t)v11, 0, v9, v7);

}

- (void)_traverseStartingAtVertex:(id)a3 previousVertex:(id)a4 visitedVertices:(id)a5 enumerationBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, id, id, _BYTE *);
  const char *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  char v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, id, id, _BYTE *))a6;
  objc_msgSend_addObject_(v12, v14, (uint64_t)v10);
  v37 = 0;
  v13[2](v13, v10, v11, &v37);
  if (!v37)
  {
    v32 = v11;
    objc_msgSend_vertexID(v10, v15, v16);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(self->_outEdgesMap, v17, (uint64_t)v31);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v33, v38, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v34 != v22)
            objc_enumerationMutation(v18);
          v24 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          v25 = (void *)MEMORY[0x1D82573E4]();
          objc_msgSend_objectForKey_(self->_verticesMap, v26, v24);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend_containsObject_(v12, v28, (uint64_t)v27) & 1) == 0)
            objc_msgSend__traverseStartingAtVertex_previousVertex_visitedVertices_enumerationBlock_(self, v29, (uint64_t)v27, v10, v12, v13);

          objc_autoreleasePoolPop(v25);
        }
        v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v30, (uint64_t)&v33, v38, 16);
      }
      while (v21);
    }

    v11 = v32;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outEdgesMap, 0);
  objc_storeStrong((id *)&self->_inEdgesMap, 0);
  objc_storeStrong((id *)&self->_verticesMap, 0);
}

@end
