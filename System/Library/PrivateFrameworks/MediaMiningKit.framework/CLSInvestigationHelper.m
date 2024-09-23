@implementation CLSInvestigationHelper

- (CLSInvestigationHelper)initWithServiceManager:(id)a3 locationCache:(id)a4 aoiCache:(id)a5 poiCache:(id)a6 roiCache:(id)a7 natureCache:(id)a8
{
  id v15;
  id v16;
  id v17;
  CLSInvestigationHelper *v18;
  CLSInvestigationHelper *v19;
  NSMutableDictionary *v20;
  NSMutableDictionary *parentTaxonomyNodesBySceneIdentifierBySceneModelIdentifier;
  NSMutableDictionary *v22;
  NSMutableDictionary *taxonomyNodeBySceneIdentifierBySceneModelIdentifier;
  NSMutableDictionary *v24;
  NSMutableDictionary *taxonomyNodesLevelsAndWeightsBySceneIdentifierBySceneModelIdentifier;
  NSMutableDictionary *v26;
  NSMutableDictionary *maxTaxonomyNodeLevelBySceneIdentifierBySceneModelIdentifier;
  uint64_t v28;
  CSUKnowledgeEntityStore *csuKnowledgeEntityStore;
  id v31;
  id v32;
  id v33;
  objc_super v34;

  v33 = a3;
  v32 = a4;
  v31 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v34.receiver = self;
  v34.super_class = (Class)CLSInvestigationHelper;
  v18 = -[CLSInvestigationHelper init](&v34, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_serviceManager, a3);
    objc_storeStrong((id *)&v19->_locationCache, a4);
    objc_storeStrong((id *)&v19->_aoiCache, a5);
    objc_storeStrong((id *)&v19->_poiCache, a6);
    objc_storeStrong((id *)&v19->_roiCache, a7);
    objc_storeStrong((id *)&v19->_natureCache, a8);
    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    parentTaxonomyNodesBySceneIdentifierBySceneModelIdentifier = v19->_parentTaxonomyNodesBySceneIdentifierBySceneModelIdentifier;
    v19->_parentTaxonomyNodesBySceneIdentifierBySceneModelIdentifier = v20;

    v19->_parentTaxonomyNodesLock._os_unfair_lock_opaque = 0;
    v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    taxonomyNodeBySceneIdentifierBySceneModelIdentifier = v19->_taxonomyNodeBySceneIdentifierBySceneModelIdentifier;
    v19->_taxonomyNodeBySceneIdentifierBySceneModelIdentifier = v22;

    v19->_taxonomyNodesLock._os_unfair_lock_opaque = 0;
    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    taxonomyNodesLevelsAndWeightsBySceneIdentifierBySceneModelIdentifier = v19->_taxonomyNodesLevelsAndWeightsBySceneIdentifierBySceneModelIdentifier;
    v19->_taxonomyNodesLevelsAndWeightsBySceneIdentifierBySceneModelIdentifier = v24;

    v19->_taxonomyNodesLevelsAndWeightsLock._os_unfair_lock_opaque = 0;
    v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    maxTaxonomyNodeLevelBySceneIdentifierBySceneModelIdentifier = v19->_maxTaxonomyNodeLevelBySceneIdentifierBySceneModelIdentifier;
    v19->_maxTaxonomyNodeLevelBySceneIdentifierBySceneModelIdentifier = v26;

    +[CLSInvestigationHelper _csuKnowledgeEntityStore](CLSInvestigationHelper, "_csuKnowledgeEntityStore");
    v28 = objc_claimAutoreleasedReturnValue();
    csuKnowledgeEntityStore = v19->_csuKnowledgeEntityStore;
    v19->_csuKnowledgeEntityStore = (CSUKnowledgeEntityStore *)v28;

  }
  return v19;
}

- (id)taxonomyNodeForSceneIdentifier:(unint64_t)a3 sceneModel:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  os_unfair_lock_s *p_taxonomyNodesLock;
  id v10;
  void *v11;
  void *v12;
  _DWORD v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (objc_msgSend(v6, "isResponsibleForSignalIdentifier:", a3))
  {
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      p_taxonomyNodesLock = &self->_taxonomyNodesLock;
      os_unfair_lock_lock(&self->_taxonomyNodesLock);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_taxonomyNodeBySceneIdentifierBySceneModelIdentifier, "objectForKeyedSubscript:", v7);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_taxonomyNodeBySceneIdentifierBySceneModelIdentifier, "setObject:forKeyedSubscript:", v10, v7);
      }
      objc_msgSend(v10, "objectForKeyedSubscript:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        objc_msgSend(v6, "taxonomyNodeForSceneIdentifier:", a3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v14[0] = 67109120;
            v14[1] = a3;
            _os_log_error_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "No taxonomy node found for sceneIdentifier %d", (uint8_t *)v14, 8u);
          }
        }
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, v8);
      }
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11 == v12)
      {

        v11 = 0;
      }
      os_unfair_lock_unlock(p_taxonomyNodesLock);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)parentNodesOfTaxonomyNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  os_unfair_lock_s *p_parentTaxonomyNodesLock;
  id v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "taxonomy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "digest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "extendedSceneClassId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    p_parentTaxonomyNodesLock = &self->_parentTaxonomyNodesLock;
    os_unfair_lock_lock(&self->_parentTaxonomyNodesLock);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_parentTaxonomyNodesBySceneIdentifierBySceneModelIdentifier, "objectForKeyedSubscript:", v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_parentTaxonomyNodesBySceneIdentifierBySceneModelIdentifier, "setObject:forKeyedSubscript:", v9, v6);
    }
    objc_msgSend(v9, "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(v4, "parents");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, v7);
    }
    os_unfair_lock_unlock(p_parentTaxonomyNodesLock);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (void)enumerateTaxonomyNodesLevelsAndWeightsStartingWithNode:(id)a3 usingBlock:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  CLSInvestigationHelper *v17;
  unint64_t v18;
  void *v19;
  double v20;
  void *v21;
  char v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  CLSInvestigationHelperSceneNodeLevelAndWeight *v29;
  void *v30;
  void *v31;
  os_unfair_lock_t lock;
  id v33;
  void *v34;
  void *v35;
  id v36;
  unint64_t v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  objc_msgSend(v6, "taxonomy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "digest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v6, "extendedSceneClassId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock(&self->_taxonomyNodesLevelsAndWeightsLock);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_taxonomyNodesLevelsAndWeightsBySceneIdentifierBySceneModelIdentifier, "objectForKeyedSubscript:", v9);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_taxonomyNodesLevelsAndWeightsBySceneIdentifierBySceneModelIdentifier, "setObject:forKeyedSubscript:", v11, v9);
    }
    objc_msgSend(v11, "objectForKeyedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      os_unfair_lock_unlock(&self->_taxonomyNodesLevelsAndWeightsLock);
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      obj = v12;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v40 != v15)
              objc_enumerationMutation(obj);
            v7[2](v7, *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
          }
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
        }
        while (v14);
      }
    }
    else
    {
      lock = &self->_taxonomyNodesLevelsAndWeightsLock;
      v35 = v9;
      v33 = v11;
      v34 = v10;
      obj = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v11, "setObject:forKeyedSubscript:");
      v17 = self;
      v18 = -[CLSInvestigationHelper _maxLevelWithTaxonomyNode:](self, "_maxLevelWithTaxonomyNode:", v6);
      v36 = v6;
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v18 + 1;
      v20 = (double)v18;
      while (1)
      {
        if (objc_msgSend(v19, "count", lock) == 1)
        {
          objc_msgSend(v19, "anyObject");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isRoot");

          if ((v22 & 1) != 0)
            break;
        }
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v23 = v19;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
        if (v24)
        {
          v25 = v24;
          v19 = 0;
          v26 = *(_QWORD *)v44;
          do
          {
            for (j = 0; j != v25; ++j)
            {
              if (*(_QWORD *)v44 != v26)
                objc_enumerationMutation(v23);
              v28 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
              if ((objc_msgSend(v28, "isRoot") & 1) == 0)
              {
                v29 = -[CLSInvestigationHelperSceneNodeLevelAndWeight initWithTaxonomyNode:level:andWeight:]([CLSInvestigationHelperSceneNodeLevelAndWeight alloc], "initWithTaxonomyNode:level:andWeight:", v28, v18, (double)(v37 - v18) / v20);
                ((void (**)(id, CLSInvestigationHelperSceneNodeLevelAndWeight *))v7)[2](v7, v29);
                objc_msgSend(obj, "addObject:", v29);
                -[CLSInvestigationHelper parentNodesOfTaxonomyNode:](v17, "parentNodesOfTaxonomyNode:", v28);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = v30;
                if (v19)
                  objc_msgSend(v19, "unionSet:", v30);
                else
                  v19 = (void *)objc_msgSend(v30, "mutableCopy");

              }
            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
          }
          while (v25);
        }
        else
        {
          v19 = 0;
        }

        --v18;
      }
      os_unfair_lock_unlock(lock);

      v9 = v35;
      v6 = v36;
      v11 = v33;
      v10 = v34;
      v12 = 0;
    }

  }
}

- (unint64_t)_maxLevelWithTaxonomyNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "taxonomy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "digest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "extendedSceneClassId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_maxTaxonomyNodeLevelBySceneIdentifierBySceneModelIdentifier, "objectForKeyedSubscript:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_maxTaxonomyNodeLevelBySceneIdentifierBySceneModelIdentifier, "setObject:forKeyedSubscript:", v8, v6);
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = objc_msgSend(v9, "unsignedIntegerValue");
    }
    else
    {
      v11 = _maxTaxonomyNodeLevel(v4);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, v7);

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)visualLookupSceneNameForSceneIdentifier:(unint64_t)a3
{
  void *v3;
  void *v4;

  if (HIDWORD(a3))
  {
    v4 = 0;
  }
  else
  {
    -[CSUKnowledgeEntityStore entityForIdentifier:](self->_csuKnowledgeEntityStore, "entityForIdentifier:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "humanReadableLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (CLSServiceManager)serviceManager
{
  return (CLSServiceManager *)objc_getProperty(self, a2, 72, 1);
}

- (CLSLocationCache)locationCache
{
  return (CLSLocationCache *)objc_getProperty(self, a2, 80, 1);
}

- (CLSAOICache)aoiCache
{
  return (CLSAOICache *)objc_getProperty(self, a2, 88, 1);
}

- (CLSPOICache)poiCache
{
  return (CLSPOICache *)objc_getProperty(self, a2, 96, 1);
}

- (CLSROICache)roiCache
{
  return (CLSROICache *)objc_getProperty(self, a2, 104, 1);
}

- (CLSNatureCache)natureCache
{
  return (CLSNatureCache *)objc_getProperty(self, a2, 112, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_natureCache, 0);
  objc_storeStrong((id *)&self->_roiCache, 0);
  objc_storeStrong((id *)&self->_poiCache, 0);
  objc_storeStrong((id *)&self->_aoiCache, 0);
  objc_storeStrong((id *)&self->_locationCache, 0);
  objc_storeStrong((id *)&self->_serviceManager, 0);
  objc_storeStrong((id *)&self->_csuKnowledgeEntityStore, 0);
  objc_storeStrong((id *)&self->_maxTaxonomyNodeLevelBySceneIdentifierBySceneModelIdentifier, 0);
  objc_storeStrong((id *)&self->_taxonomyNodesLevelsAndWeightsBySceneIdentifierBySceneModelIdentifier, 0);
  objc_storeStrong((id *)&self->_taxonomyNodeBySceneIdentifierBySceneModelIdentifier, 0);
  objc_storeStrong((id *)&self->_parentTaxonomyNodesBySceneIdentifierBySceneModelIdentifier, 0);
}

+ (id)_csuKnowledgeEntityStore
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D73288], "photosDataVaultPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("PrivateEncryptedComputeStore.json"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D188C8]);
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v6 = (void *)objc_msgSend(v4, "initWithDatabasePath:error:", v5, &v9);
  v7 = v9;

  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v7;
    _os_log_error_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to load CSU EntityStore. Error: %@", buf, 0xCu);
  }

  return v6;
}

@end
