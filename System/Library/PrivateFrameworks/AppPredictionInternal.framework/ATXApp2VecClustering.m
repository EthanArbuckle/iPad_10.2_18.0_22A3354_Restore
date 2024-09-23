@implementation ATXApp2VecClustering

- (ATXApp2VecClustering)init
{
  void *v3;
  void *v4;
  ATXApp2VecClustering *v5;
  BOOL v6;
  ATXApp2VecMapping *v7;
  ATXApp2VecMapping *clusterCentroids;
  ATXApp2VecMapping *v9;
  ATXApp2VecMapping *appEmbeddings;
  uint64_t v11;
  char v12;
  NSObject *v13;
  objc_super v15;

  objc_msgSend(MEMORY[0x1E0CF8CF0], "pathForResource:ofType:isDirectory:", CFSTR("_ATXApp2VecClusters"), CFSTR("dat"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF8CF0], "pathForResource:ofType:isDirectory:", CFSTR("_ATXApp2VecMapping"), CFSTR("dat"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)ATXApp2VecClustering;
  v5 = -[ATXApp2VecClustering init](&v15, sel_init);
  if (v5)
  {
    if (v3)
      v6 = v4 == 0;
    else
      v6 = 1;
    if (!v6)
    {
      v7 = -[ATXApp2VecMapping initWithPath:]([ATXApp2VecMapping alloc], "initWithPath:", v3);
      clusterCentroids = v5->_clusterCentroids;
      v5->_clusterCentroids = v7;

      v9 = -[ATXApp2VecMapping initWithPath:]([ATXApp2VecMapping alloc], "initWithPath:", v4);
      appEmbeddings = v5->_appEmbeddings;
      v5->_appEmbeddings = v9;

      v11 = -[ATXApp2VecMapping vectorLength](v5->_appEmbeddings, "vectorLength");
      v5->_vectorLength = v11;
      if (v11 != -[ATXApp2VecMapping vectorLength](v5->_clusterCentroids, "vectorLength"))
        -[ATXApp2VecClustering init].cold.2();
    }
    if (v5->_clusterCentroids && v5->_appEmbeddings)
    {
      v12 = 1;
    }
    else
    {
      __atxlog_handle_default();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[ATXApp2VecClustering init].cold.1((uint64_t)v3, (uint64_t)v4, v13);

      v12 = 0;
    }
    v5->_loaded = v12;
  }

  return v5;
}

+ (id)sharedInstance
{
  id v2;

  pthread_mutex_lock(&sharedInstanceLock_0);
  v2 = (id)sharedInstance_0;
  if (!v2)
  {
    v2 = (id)objc_opt_new();
    objc_storeStrong((id *)&sharedInstance_0, v2);
  }
  pthread_mutex_unlock(&sharedInstanceLock_0);
  return v2;
}

+ (void)resetSharedInstance
{
  void *v2;

  pthread_mutex_lock(&sharedInstanceLock_0);
  v2 = (void *)sharedInstance_0;
  sharedInstance_0 = 0;

  pthread_mutex_unlock(&sharedInstanceLock_0);
}

- (id)getClusterCentroidsForBundleIds:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[ATXApp2VecClustering getClosestClusterCentroidForBundleId:](self, "getClosestClusterCentroidForBundleId:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[ATXApp2VecClustering _mergeClusterCentroids:forBundleIds:](self, "_mergeClusterCentroids:forBundleIds:", v5, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_mergeClusterCentroids:(id)a3 forBundleIds:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  ATXApp2VecMapping *appEmbeddings;
  char *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  float v32;
  uint64_t i;
  id v34;
  ATXApp2VecClustering *v35;
  ATXApp2VecMapping *clusterCentroids;
  void *v37;
  void *v38;
  ATXApp2VecMapping *v39;
  char *v40;
  float v41;
  float v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t *v60;
  uint64_t v61;
  id v62;
  char *v63;
  char *v64;
  id v65;
  ATXApp2VecClustering *v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v66 = self;
  if (self->_loaded)
  {
    v8 = (void *)objc_opt_new();
    if (objc_msgSend(v7, "count"))
    {
      v9 = 0;
      do
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, v13);

        }
        objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v16);

        ++v9;
      }
      while (objc_msgSend(v7, "count") > v9);
    }
    v57 = v7;
    v17 = v6;
    objc_msgSend(v8, "allKeys");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v73;
      v55 = v8;
      v56 = v6;
      v53 = v21;
      v54 = v18;
      do
      {
        v22 = 0;
        v58 = v20;
        do
        {
          if (*(_QWORD *)v73 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v22);
          objc_msgSend(v8, "objectForKeyedSubscript:", v23);
          v24 = (id)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v24, "count") == 1)
          {
            v60 = &v52;
            v61 = v22;
            appEmbeddings = v66->_appEmbeddings;
            v26 = (char *)&v52 - ((4 * v66->_vectorLength + 15) & 0xFFFFFFFFFFFFFFF0);
            v62 = v24;
            objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = v26;
            LODWORD(appEmbeddings) = -[ATXApp2VecMapping getVectorForBundleId:into:](appEmbeddings, "getVectorForBundleId:into:", v27, v26);

            if ((_DWORD)appEmbeddings)
            {
              v28 = v23;
              v59 = &v52;
              v63 = (char *)&v52 - ((4 * v66->_vectorLength + 15) & 0xFFFFFFFFFFFFFFF0);
              v70 = 0u;
              v71 = 0u;
              v68 = 0u;
              v69 = 0u;
              v67 = v8;
              v29 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
              v65 = v28;
              if (v29)
              {
                v30 = v29;
                v31 = *(_QWORD *)v69;
                v32 = 3.4028e38;
                v65 = v28;
                do
                {
                  for (i = 0; i != v30; ++i)
                  {
                    if (*(_QWORD *)v69 != v31)
                      objc_enumerationMutation(v67);
                    v34 = *(id *)(*((_QWORD *)&v68 + 1) + 8 * i);
                    if (v34 != v28)
                    {
                      if (objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * i), "integerValue"))
                      {
                        v35 = v66;
                        clusterCentroids = v66->_clusterCentroids;
                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v34, "integerValue") - 1);
                        v37 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v37, "stringValue");
                        v38 = (void *)objc_claimAutoreleasedReturnValue();
                        v39 = clusterCentroids;
                        v40 = v63;
                        -[ATXApp2VecMapping getVectorForBundleId:into:](v39, "getVectorForBundleId:into:", v38, v63);

                        -[ATXApp2VecClustering _getL2DistanceFrom:to:](v35, "_getL2DistanceFrom:to:", v64, v40);
                        if (v41 < v32)
                        {
                          v42 = v41;
                          v43 = v34;

                          v32 = v42;
                          v65 = v43;
                        }
                      }
                    }
                  }
                  v30 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
                }
                while (v30);
              }
              v44 = v67;

              objc_msgSend(v44, "removeObjectForKey:", v28);
              v45 = v65;
              objc_msgSend(v44, "objectForKeyedSubscript:", v65);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = v62;
              objc_msgSend(v62, "objectAtIndexedSubscript:", 0);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "addObject:", v48);

              objc_msgSend(v47, "objectAtIndexedSubscript:", 0);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = objc_msgSend(v57, "indexOfObject:", v49);

              v17 = v56;
              objc_msgSend(v56, "setObject:atIndexedSubscript:", v45, v50);

              v18 = v54;
              v8 = v55;
              v21 = v53;
              v20 = v58;
            }
            v22 = v61;
            v24 = v62;
          }

          ++v22;
        }
        while (v22 != v20);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
      }
      while (v20);
    }

    v6 = v17;
    v7 = v57;
  }

  return v6;
}

- (id)getClosestClusterCentroidForBundleId:(id)a3
{
  char *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (!self->_loaded)
    return &unk_1E83CD318;
  v4 = (char *)v7 - ((4 * self->_vectorLength + 15) & 0xFFFFFFFFFFFFFFF0);
  if (-[ATXApp2VecMapping getVectorForBundleId:into:](self->_appEmbeddings, "getVectorForBundleId:into:", a3, v4))
  {
    -[ATXApp2VecClustering _getClosestClusterCentroidForVector:](self, "_getClosestClusterCentroidForVector:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &unk_1E83CD318;
  }
  return v5;
}

- (id)_getClosestClusterCentroidForVector:(const float *)a3
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  float v10;
  ATXApp2VecMapping *clusterCentroids;
  void *v12;
  void *v13;
  float v14;
  uint64_t v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = -[ATXApp2VecMapping appCount](self->_clusterCentroids, "appCount");
  v17[0] = v17;
  v6 = (char *)v17 - ((4 * self->_vectorLength + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v5 < 1)
  {
    v9 = 0;
  }
  else
  {
    v7 = v5;
    v8 = 0;
    v9 = 0;
    v10 = 3.4028e38;
    do
    {
      clusterCentroids = self->_clusterCentroids;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8, v17[0]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXApp2VecMapping getVectorForBundleId:into:](clusterCentroids, "getVectorForBundleId:into:", v13, v6);

      -[ATXApp2VecClustering _getL2DistanceFrom:to:](self, "_getL2DistanceFrom:to:", a3, v6);
      if (v14 < v10)
        v9 = v8 + 1;
      v15 = v8 + 1;
      if (v14 < v10)
        v10 = v14;
      ++v8;
    }
    while (v7 != v15);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9, v17[0]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (float)_getL2DistanceFrom:(const float *)a3 to:(float *)a4
{
  float result;

  catlas_saxpby_NEWLAPACK();
  cblas_snrm2_NEWLAPACK();
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appEmbeddings, 0);
  objc_storeStrong((id *)&self->_clusterCentroids, 0);
}

- (void)init
{
  __assert_rtn("-[ATXApp2VecClustering init]", "ATXApp2VecClustering.m", 34, "_vectorLength == [_clusterCentroids vectorLength]");
}

@end
