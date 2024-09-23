@implementation BWInferenceSchedulerGraph

- (void)_visitJob:(void *)a3 withEnRouteAccumulation:(uint64_t)a4 block:
{
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  id v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v8 = (void *)objc_msgSend(a3, "objectForKey:", a2);
    (*(void (**)(uint64_t, uint64_t, void *))(a4 + 16))(a4, a2, v8);
    v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __69__BWInferenceSchedulerGraph__visitJob_withEnRouteAccumulation_block___block_invoke;
    v21[3] = &unk_1E49229E8;
    v21[4] = v9;
    objc_msgSend(a1, "enumerateVideoDestinationsFromJob:withBlock:", a2, v21);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    obj = v9;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          v15 = (id)objc_msgSend(a3, "objectForKey:", v14);
          if (!v15)
          {
            v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            objc_msgSend(a3, "setObject:forKey:", v15, v14);

          }
          objc_msgSend(v15, "addObject:", a2);
          objc_msgSend(v15, "addObjectsFromArray:", objc_msgSend(v8, "allObjects"));
          -[BWInferenceSchedulerGraph _visitJob:withEnRouteAccumulation:block:](a1, v14, a3, a4);
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v11);
    }

  }
}

- (void)enumerateVideoDestinationsFromJob:(id)a3 withBlock:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = -[NSMapTable objectForKey:](self->_directedEdgesByNode, "objectForKey:", a3);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))a4 + 2))(a4, **(_QWORD **)(*((_QWORD *)&v10 + 1) + 8 * v9), *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16), *(unsigned __int8 *)(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 24), *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 8));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

uint64_t __69__BWInferenceSchedulerGraph__visitJob_withEnRouteAccumulation_block___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (void)visitProvidersWithBlock:(id)a3
{
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, -[NSMapTable count](self->_directedEdgesByNode, "count"));
  -[BWInferenceSchedulerGraph _visitJob:withEnRouteAccumulation:block:](self, (uint64_t)self->_head, v5, (uint64_t)a3);

}

- (BWInferenceSchedulerGraph)initWithHeadNode:(id)a3 directedEdges:(id)a4
{
  BWInferenceSchedulerGraph *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BWInferenceSchedulerGraph;
  v6 = -[BWInferenceSchedulerGraph init](&v8, sel_init);
  if (v6)
  {
    v6->_head = (BWInferenceJobProvider *)a3;
    v6->_directedEdgesByNode = (NSMapTable *)a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceSchedulerGraph;
  -[BWInferenceSchedulerGraph dealloc](&v3, sel_dealloc);
}

@end
