@implementation ARFrameContextHandler

- (ARFrameContextHandler)init
{
  ARFrameContextHandler *v2;
  uint64_t v3;
  NSMutableOrderedSet *inFlightContexts;
  uint64_t v5;
  NSMutableOrderedSet *anchorsToAdd;
  uint64_t v7;
  NSMutableOrderedSet *anchorsToRemove;
  uint64_t v9;
  NSMutableOrderedSet *anchorsToStopTracking;
  uint64_t v11;
  NSMutableSet *collaborationDatas;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ARFrameContextHandler;
  v2 = -[ARFrameContextHandler init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    inFlightContexts = v2->_inFlightContexts;
    v2->_inFlightContexts = (NSMutableOrderedSet *)v3;

    v5 = objc_opt_new();
    anchorsToAdd = v2->_anchorsToAdd;
    v2->_anchorsToAdd = (NSMutableOrderedSet *)v5;

    v7 = objc_opt_new();
    anchorsToRemove = v2->_anchorsToRemove;
    v2->_anchorsToRemove = (NSMutableOrderedSet *)v7;

    v9 = objc_opt_new();
    anchorsToStopTracking = v2->_anchorsToStopTracking;
    v2->_anchorsToStopTracking = (NSMutableOrderedSet *)v9;

    v11 = objc_opt_new();
    collaborationDatas = v2->_collaborationDatas;
    v2->_collaborationDatas = (NSMutableSet *)v11;

  }
  return v2;
}

- (__n128)setSessionTransform:(__n128)a3
{
  result[5] = a2;
  result[6] = a3;
  result[7] = a4;
  result[8] = a5;
  result[3].n128_u8[0] = 0;
  result[4].n128_u8[0] = 1;
  return result;
}

- (void)resetSessionTransform
{
  uint64_t v2;
  __int128 v3;
  __int128 v4;

  v2 = MEMORY[0x1E0C83FF0];
  v3 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 16);
  *(_OWORD *)&self[1].super.isa = *MEMORY[0x1E0C83FF0];
  *(_OWORD *)&self[1]._mostRecentInFlightContext = v3;
  v4 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)&self[1]._anchorsToRemove = *(_OWORD *)(v2 + 32);
  *(_OWORD *)&self[1]._sessionTransformReset = v4;
  self->_sessionTransformReset = 1;
  self->_sessionTransformUpdated = 1;
}

- (NSArray)anchorsToAdd
{
  return (NSArray *)-[NSMutableOrderedSet array](self->_anchorsToAdd, "array");
}

- (void)addAnchor:(id)a3
{
  -[NSMutableOrderedSet addObject:](self->_anchorsToAdd, "addObject:", a3);
}

- (void)clearAddedAnchors
{
  -[NSMutableOrderedSet removeAllObjects](self->_anchorsToAdd, "removeAllObjects");
}

- (void)removeAnchor:(id)a3
{
  NSMutableOrderedSet *anchorsToAdd;
  id v5;

  anchorsToAdd = self->_anchorsToAdd;
  v5 = a3;
  -[NSMutableOrderedSet removeObject:](anchorsToAdd, "removeObject:", v5);
  -[NSMutableOrderedSet addObject:](self->_anchorsToRemove, "addObject:", v5);

}

- (void)stopTrackingAnchors:(id)a3
{
  -[NSMutableOrderedSet addObjectsFromArray:](self->_anchorsToStopTracking, "addObjectsFromArray:", a3);
}

- (void)addCollaborationData:(id)a3
{
  -[NSMutableSet addObject:](self->_collaborationDatas, "addObject:", a3);
}

- (id)createdContextByConsumingPendingChanges
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  if (-[NSMutableOrderedSet count](self->_anchorsToAdd, "count"))
  {
    -[NSMutableOrderedSet array](self->_anchorsToAdd, "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAnchorsToAdd:", v4);

  }
  else
  {
    objc_msgSend(v3, "setAnchorsToAdd:", 0);
  }
  if (-[NSMutableOrderedSet count](self->_anchorsToRemove, "count"))
  {
    -[NSMutableOrderedSet array](self->_anchorsToRemove, "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAnchorsToRemove:", v5);

  }
  else
  {
    objc_msgSend(v3, "setAnchorsToRemove:", 0);
  }
  if (-[NSMutableOrderedSet count](self->_anchorsToStopTracking, "count"))
  {
    -[NSMutableOrderedSet array](self->_anchorsToStopTracking, "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAnchorsToStopTracking:", v6);

  }
  else
  {
    objc_msgSend(v3, "setAnchorsToStopTracking:", 0);
  }
  objc_msgSend(v3, "setSessionTransform:", *(double *)&self[1].super.isa, *(double *)&self[1]._mostRecentInFlightContext, *(double *)&self[1]._anchorsToRemove, *(double *)&self[1]._sessionTransformReset);
  objc_msgSend(v3, "setSessionTransformUpdated:", self->_sessionTransformUpdated);
  objc_msgSend(v3, "setSessionTransformReset:", self->_sessionTransformReset);
  objc_msgSend(v3, "setCollaborationData:", self->_collaborationDatas);
  -[NSMutableOrderedSet removeAllObjects](self->_anchorsToAdd, "removeAllObjects");
  -[NSMutableOrderedSet removeAllObjects](self->_anchorsToRemove, "removeAllObjects");
  -[NSMutableOrderedSet removeAllObjects](self->_anchorsToStopTracking, "removeAllObjects");
  self->_sessionTransformUpdated = 0;
  self->_sessionTransformReset = 0;
  -[NSMutableSet removeAllObjects](self->_collaborationDatas, "removeAllObjects");
  -[NSMutableOrderedSet addObject:](self->_inFlightContexts, "addObject:", v3);
  objc_storeStrong((id *)&self->_mostRecentInFlightContext, v3);
  return v3;
}

- (void)markFrameContextProcessed:(id)a3
{
  ARFrameContext *mostRecentInFlightContext;
  id v5;

  v5 = a3;
  if (-[ARFrameContext isEqual:](self->_mostRecentInFlightContext, "isEqual:"))
  {
    mostRecentInFlightContext = self->_mostRecentInFlightContext;
    self->_mostRecentInFlightContext = 0;

  }
  -[NSMutableOrderedSet removeObject:](self->_inFlightContexts, "removeObject:", v5);

}

- (void)clearInFlightContextsReapplyingChanges
{
  ARFrameContext *mostRecentInFlightContext;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  NSMutableOrderedSet *v8;
  NSMutableOrderedSet *v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t m;
  NSMutableSet *collaborationDatas;
  void *v29;
  NSMutableOrderedSet *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t n;
  NSMutableOrderedSet *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t ii;
  uint64_t v40;
  NSMutableOrderedSet *anchorsToAdd;
  NSMutableOrderedSet *v42;
  NSMutableOrderedSet *anchorsToRemove;
  NSMutableOrderedSet *v44;
  NSMutableOrderedSet *obj;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  mostRecentInFlightContext = self->_mostRecentInFlightContext;
  if (mostRecentInFlightContext)
  {
    if (!self->_sessionTransformUpdated)
    {
      self->_sessionTransformReset = -[ARFrameContext sessionTransformReset](mostRecentInFlightContext, "sessionTransformReset");
      self->_sessionTransformUpdated = -[ARFrameContext sessionTransformUpdated](self->_mostRecentInFlightContext, "sessionTransformUpdated");
      -[ARFrameContext sessionTransform](self->_mostRecentInFlightContext, "sessionTransform");
      *(_OWORD *)&self[1].super.isa = v4;
      *(_OWORD *)&self[1]._mostRecentInFlightContext = v5;
      *(_OWORD *)&self[1]._anchorsToRemove = v6;
      *(_OWORD *)&self[1]._sessionTransformReset = v7;
      mostRecentInFlightContext = self->_mostRecentInFlightContext;
    }
    self->_mostRecentInFlightContext = 0;

  }
  if (-[NSMutableOrderedSet count](self->_inFlightContexts, "count"))
  {
    v8 = (NSMutableOrderedSet *)objc_opt_new();
    v9 = (NSMutableOrderedSet *)objc_opt_new();
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    obj = self->_inFlightContexts;
    v47 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
    if (v47)
    {
      v46 = *(_QWORD *)v69;
      do
      {
        for (i = 0; i != v47; ++i)
        {
          if (*(_QWORD *)v69 != v46)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
          v64 = 0u;
          v65 = 0u;
          v66 = 0u;
          v67 = 0u;
          objc_msgSend(v11, "anchorsToAdd");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v65;
            do
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v65 != v15)
                  objc_enumerationMutation(v12);
                -[NSMutableOrderedSet addObject:](v8, "addObject:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * j));
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
            }
            while (v14);
          }

          v62 = 0u;
          v63 = 0u;
          v60 = 0u;
          v61 = 0u;
          objc_msgSend(v11, "anchorsToRemove");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v60, v75, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v61;
            do
            {
              for (k = 0; k != v19; ++k)
              {
                if (*(_QWORD *)v61 != v20)
                  objc_enumerationMutation(v17);
                v22 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * k);
                -[NSMutableOrderedSet removeObject:](v8, "removeObject:", v22);
                -[NSMutableOrderedSet addObject:](v9, "addObject:", v22);
              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v60, v75, 16);
            }
            while (v19);
          }

          v58 = 0u;
          v59 = 0u;
          v56 = 0u;
          v57 = 0u;
          objc_msgSend(v11, "anchorsToStopTracking");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v56, v74, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v57;
            do
            {
              for (m = 0; m != v25; ++m)
              {
                if (*(_QWORD *)v57 != v26)
                  objc_enumerationMutation(v23);
                -[NSMutableOrderedSet addObject:](self->_anchorsToStopTracking, "addObject:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * m));
              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v56, v74, 16);
            }
            while (v25);
          }

          collaborationDatas = self->_collaborationDatas;
          objc_msgSend(v11, "collaborationData");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableSet unionSet:](collaborationDatas, "unionSet:", v29);

        }
        v47 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
      }
      while (v47);
    }

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v30 = self->_anchorsToAdd;
    v31 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v52, v73, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v53;
      do
      {
        for (n = 0; n != v32; ++n)
        {
          if (*(_QWORD *)v53 != v33)
            objc_enumerationMutation(v30);
          -[NSMutableOrderedSet addObject:](v8, "addObject:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * n));
        }
        v32 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v52, v73, 16);
      }
      while (v32);
    }

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v35 = self->_anchorsToRemove;
    v36 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v48, v72, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v49;
      do
      {
        for (ii = 0; ii != v37; ++ii)
        {
          if (*(_QWORD *)v49 != v38)
            objc_enumerationMutation(v35);
          v40 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * ii);
          -[NSMutableOrderedSet removeObject:](v8, "removeObject:", v40);
          -[NSMutableOrderedSet addObject:](v9, "addObject:", v40);
        }
        v37 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v48, v72, 16);
      }
      while (v37);
    }

    anchorsToAdd = self->_anchorsToAdd;
    self->_anchorsToAdd = v8;
    v42 = v8;

    anchorsToRemove = self->_anchorsToRemove;
    self->_anchorsToRemove = v9;
    v44 = v9;

    -[NSMutableOrderedSet removeAllObjects](self->_inFlightContexts, "removeAllObjects");
  }
}

- (__n128)sessionTransform
{
  return a1[5];
}

- (BOOL)sessionTransformUpdated
{
  return self->_sessionTransformUpdated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationDatas, 0);
  objc_storeStrong((id *)&self->_anchorsToStopTracking, 0);
  objc_storeStrong((id *)&self->_anchorsToRemove, 0);
  objc_storeStrong((id *)&self->_anchorsToAdd, 0);
  objc_storeStrong((id *)&self->_mostRecentInFlightContext, 0);
  objc_storeStrong((id *)&self->_inFlightContexts, 0);
}

@end
