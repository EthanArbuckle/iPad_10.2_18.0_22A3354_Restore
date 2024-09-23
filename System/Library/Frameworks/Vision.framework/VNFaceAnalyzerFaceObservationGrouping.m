@implementation VNFaceAnalyzerFaceObservationGrouping

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationGroupsToRequestMapping, 0);
}

- (id)addToGroupingsRequest:(id)a3 withFaceObservations:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  BOOL v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12), "uuid", (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  -[NSMutableDictionary objectForKey:](self->_observationGroupsToRequestMapping, "objectForKey:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;

  if (v15)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v16, "addObject:", v6);
    -[NSMutableDictionary setObject:forKey:](self->_observationGroupsToRequestMapping, "setObject:forKey:", v16, v8);
  }
  else
  {
    -[NSMutableDictionary objectForKey:](self->_observationGroupsToRequestMapping, "objectForKey:", v8);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v6);
  }

  return v8;
}

@end
