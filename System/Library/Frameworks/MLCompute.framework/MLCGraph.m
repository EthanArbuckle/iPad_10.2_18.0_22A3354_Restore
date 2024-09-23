@implementation MLCGraph

+ (MLCGraph)graphWithGraphObjects:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGraphObjects:", v4);

  return (MLCGraph *)v5;
}

- (MLCGraph)init
{
  return -[MLCGraph initWithGraphObjects:](self, "initWithGraphObjects:", MEMORY[0x1E0C9AA60]);
}

+ (MLCGraph)graph
{
  return (MLCGraph *)(id)objc_opt_new();
}

- (MLCGraph)initWithGraphObjects:(id)a3
{
  id v5;
  MLCGraph *v6;
  MLCGraph *v7;
  void *v8;
  uint64_t v9;
  NSMutableArray *graphLayerList;
  void *v11;
  uint64_t v12;
  NSMutableDictionary *layerChildMap;
  uint64_t v14;
  NSMutableDictionary *layerParentMap;
  uint64_t v16;
  NSMutableArray *rootLevelTensorNodes;
  NSDictionary *allInputs;
  NSDictionary *allOutputs;
  NSDictionary *allLossLabels;
  NSDictionary *allLossLabelWeights;
  MLCDevice *device;
  uint64_t v23;
  NSMutableArray *lstmLayerIndexList;
  uint64_t v25;
  NSMutableArray *freeResourceList;
  uint64_t v27;
  void *v28;
  char v29;
  BOOL v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t k;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t m;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t n;
  void *v70;
  unint64_t v71;
  uint64_t v72;
  id obj;
  id obja;
  MLCGraph *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  objc_super v96;
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v96.receiver = self;
  v96.super_class = (Class)MLCGraph;
  v6 = -[MLCGraph init](&v96, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_nextLayerID = 1;
    v8 = (void *)MEMORY[0x1E0C9AA60];
    v9 = objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    graphLayerList = v7->_graphLayerList;
    v7->_graphLayerList = (NSMutableArray *)v9;

    v11 = (void *)MEMORY[0x1E0C9AA70];
    v12 = objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
    layerChildMap = v7->_layerChildMap;
    v7->_layerChildMap = (NSMutableDictionary *)v12;

    v14 = objc_msgSend(v11, "mutableCopy");
    layerParentMap = v7->_layerParentMap;
    v7->_layerParentMap = (NSMutableDictionary *)v14;

    v16 = objc_msgSend(v8, "mutableCopy");
    rootLevelTensorNodes = v7->_rootLevelTensorNodes;
    v7->_rootLevelTensorNodes = (NSMutableArray *)v16;

    objc_storeStrong((id *)&v7->_graphObjects, a3);
    v7->_readyForExecution = 0;
    allInputs = v7->_allInputs;
    v7->_allInputs = 0;

    allOutputs = v7->_allOutputs;
    v7->_allOutputs = 0;

    allLossLabels = v7->_allLossLabels;
    v7->_allLossLabels = 0;

    allLossLabelWeights = v7->_allLossLabelWeights;
    v7->_allLossLabelWeights = 0;

    device = v7->_device;
    v7->_device = 0;

    *(_WORD *)&v7->_recompileAfterLinking = 256;
    v7->_compilerOptions = 0;
    v23 = objc_msgSend(v8, "mutableCopy");
    lstmLayerIndexList = v7->_lstmLayerIndexList;
    v7->_lstmLayerIndexList = (NSMutableArray *)v23;

    v71 = 1;
    v7->_allocateDeviceMemoryForTensorsInGraph = 1;
    v25 = objc_msgSend(v8, "mutableCopy");
    freeResourceList = v7->_freeResourceList;
    v7->_freeResourceList = (NSMutableArray *)v25;

    if (objc_msgSend(v5, "count"))
    {
      v27 = 0;
      v70 = v5;
      v71 = 1;
      v75 = v7;
      do
      {
        v72 = v27;
        objc_msgSend(v5, "objectAtIndexedSubscript:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v28, "nextLayerID") > v71)
          v71 = objc_msgSend(v28, "nextLayerID");
        v29 = objc_msgSend(v28, "staticBatchSizeInGraph");
        if (v7->_staticBatchSizeInGraph)
          v30 = v29;
        else
          v30 = 0;
        v7->_staticBatchSizeInGraph = v30;
        objc_msgSend(v28, "graphLayerList");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "count");

        if (v32)
        {
          v33 = 0;
          do
          {
            objc_msgSend(v28, "graphLayerList");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "objectAtIndexedSubscript:", v33);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[MLCGraph flattenConditionalLayer:](v7, "flattenConditionalLayer:", v35);
            }
            else
            {
              -[MLCGraph graphLayerList](v7, "graphLayerList");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "addObject:", v35);

            }
            ++v33;
            objc_msgSend(v28, "graphLayerList");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "count");

          }
          while (v33 < v38);
        }
        v94 = 0u;
        v95 = 0u;
        v92 = 0u;
        v93 = 0u;
        objc_msgSend(v28, "rootLevelTensorNodes");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v92, v101, 16);
        if (v40)
        {
          v41 = v40;
          v42 = *(_QWORD *)v93;
          do
          {
            for (i = 0; i != v41; ++i)
            {
              if (*(_QWORD *)v93 != v42)
                objc_enumerationMutation(v39);
              -[NSMutableArray addObject:](v7->_rootLevelTensorNodes, "addObject:", *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * i));
            }
            v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v92, v101, 16);
          }
          while (v41);
        }

        v90 = 0u;
        v91 = 0u;
        v88 = 0u;
        v89 = 0u;
        objc_msgSend(v28, "layerChildMap");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v100, 16);
        v45 = v28;
        if (v44)
        {
          v46 = v44;
          v47 = *(_QWORD *)v89;
          do
          {
            for (j = 0; j != v46; ++j)
            {
              if (*(_QWORD *)v89 != v47)
                objc_enumerationMutation(obj);
              v49 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * j);
              v50 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
              v84 = 0u;
              v85 = 0u;
              v86 = 0u;
              v87 = 0u;
              objc_msgSend(v28, "layerChildMap");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "objectForKeyedSubscript:", v49);
              v52 = (void *)objc_claimAutoreleasedReturnValue();

              v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v84, v99, 16);
              if (v53)
              {
                v54 = v53;
                v55 = *(_QWORD *)v85;
                do
                {
                  for (k = 0; k != v54; ++k)
                  {
                    if (*(_QWORD *)v85 != v55)
                      objc_enumerationMutation(v52);
                    objc_msgSend(v50, "addObject:", *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * k));
                  }
                  v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v84, v99, 16);
                }
                while (v54);
              }

              -[NSMutableDictionary setObject:forKeyedSubscript:](v75->_layerChildMap, "setObject:forKeyedSubscript:", v50, v49);
              v28 = v45;
            }
            v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v100, 16);
          }
          while (v46);
        }

        v82 = 0u;
        v83 = 0u;
        v80 = 0u;
        v81 = 0u;
        objc_msgSend(v28, "layerParentMap");
        obja = (id)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v80, v98, 16);
        if (v57)
        {
          v58 = v57;
          v59 = *(_QWORD *)v81;
          do
          {
            for (m = 0; m != v58; ++m)
            {
              if (*(_QWORD *)v81 != v59)
                objc_enumerationMutation(obja);
              v61 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * m);
              v62 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
              v76 = 0u;
              v77 = 0u;
              v78 = 0u;
              v79 = 0u;
              objc_msgSend(v28, "layerParentMap");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "objectForKeyedSubscript:", v61);
              v64 = (void *)objc_claimAutoreleasedReturnValue();

              v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v76, v97, 16);
              if (v65)
              {
                v66 = v65;
                v67 = *(_QWORD *)v77;
                do
                {
                  for (n = 0; n != v66; ++n)
                  {
                    if (*(_QWORD *)v77 != v67)
                      objc_enumerationMutation(v64);
                    objc_msgSend(v62, "addObject:", *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * n));
                  }
                  v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v76, v97, 16);
                }
                while (v66);
              }

              -[NSMutableDictionary setObject:forKeyedSubscript:](v75->_layerParentMap, "setObject:forKeyedSubscript:", v62, v61);
              v28 = v45;
            }
            v58 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v80, v98, 16);
          }
          while (v58);
        }

        v27 = v72 + 1;
        v5 = v70;
        v7 = v75;
      }
      while (v72 + 1 < (unint64_t)objc_msgSend(v70, "count"));
    }
    v7->_nextLayerID = v71;
  }

  return v7;
}

- (void)dealloc
{
  MLCGraph *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  unint64_t v46;
  void *v47;
  uint64_t v48;
  unint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  unint64_t v59;
  void *v60;
  uint64_t v61;
  unint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  unint64_t v72;
  void *v73;
  void *v74;
  int v75;
  MLCGraph *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  uint64_t v86;
  objc_super v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  uint64_t v103;

  v2 = self;
  v103 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_graphLayerList, "count"))
  {
    v3 = 0;
    v4 = (void *)MEMORY[0x1E0C9AA60];
    while (1)
    {
      -[NSMutableArray objectAtIndexedSubscript:](v2->_graphLayerList, "objectAtIndexedSubscript:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "resetLayerID");
      v98 = 0u;
      v99 = 0u;
      v96 = 0u;
      v97 = 0u;
      objc_msgSend(v5, "sourceTensors");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v96, v102, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v97;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v97 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * i);
            objc_msgSend(v11, "childLayers");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "removeAllObjects");

            objc_msgSend(v11, "parentLayers");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "removeAllObjects");

          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v96, v102, 16);
        }
        while (v8);
      }

      v94 = 0u;
      v95 = 0u;
      v92 = 0u;
      v93 = 0u;
      objc_msgSend(v5, "resultTensors");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v92, v101, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v93;
        do
        {
          for (j = 0; j != v16; ++j)
          {
            if (*(_QWORD *)v93 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * j);
            objc_msgSend(v19, "childLayers");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "removeAllObjects");

            objc_msgSend(v19, "parentLayers");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "removeAllObjects");

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v92, v101, 16);
        }
        while (v16);
      }

      objc_msgSend(v5, "intermediateGradientTensors");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "removeAllObjects");

      objc_msgSend(v5, "setIntermediateGradientTensorIndex:", 0);
      objc_msgSend(v5, "setIntermediateSumLayer:", 0);
      v90 = 0u;
      v91 = 0u;
      v88 = 0u;
      v89 = 0u;
      objc_msgSend(v5, "fusedLayers");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v88, v100, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v89;
        do
        {
          for (k = 0; k != v25; ++k)
          {
            if (*(_QWORD *)v89 != v26)
              objc_enumerationMutation(v23);
            v28 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * k);
            v29 = (void *)objc_msgSend(v4, "mutableCopy");
            objc_msgSend(v28, "setDeviceOps:", v29);

          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v88, v100, 16);
        }
        while (v25);
      }

      objc_msgSend(v5, "fusedLayers");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v30, "count"))
        v31 = 1;
      else
        v31 = objc_msgSend(v5, "skipLayer");

      -[MLCGraph device](v2, "device");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v32, "type"))
        goto LABEL_30;
      -[MLCGraph device](v2, "device");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v33, "type") == 1)
        break;
      -[MLCGraph device](v2, "device");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v73, "type") == 2)
      {
        -[MLCGraph device](v2, "device");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "gpuDevices");
        v75 = v31;
        v76 = v2;
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = objc_msgSend(v77, "count");

        v2 = v76;
        v31 = v75;

        if (v86)
          goto LABEL_31;
      }
      else
      {

      }
LABEL_54:
      objc_msgSend(v5, "setSkipLayer:", 0);
      objc_msgSend(v5, "setIsLastFusedLayer:", 0);
      if (v31)
      {
        objc_msgSend(v5, "sourceTensors");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "removeAllObjects");

        objc_msgSend(v5, "resultTensors");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "removeAllObjects");

        objc_msgSend(v5, "sourceGradientTensors");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "removeAllObjects");

        objc_msgSend(v5, "resultGradientTensors");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "removeAllObjects");

        objc_msgSend(v5, "fusedLayers");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = objc_msgSend(v82, "count");

        if (v83)
        {
          objc_msgSend(v5, "fusedLayers");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "removeAllObjects");

        }
        v85 = (void *)objc_msgSend(v4, "mutableCopy");
        objc_msgSend(v5, "setDeviceOps:", v85);

      }
      objc_msgSend(v5, "unlinkAssociatedTensors");

      if (++v3 >= (unint64_t)-[NSMutableArray count](v2->_graphLayerList, "count"))
        goto LABEL_59;
    }

LABEL_30:
LABEL_31:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v31 = 1;
    objc_msgSend(v5, "sourceTensors");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "count");

    if (v35)
    {
      v36 = 0;
      do
      {
        objc_msgSend(v5, "sourceTensors");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectAtIndexedSubscript:", v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "sharedMemoryTensor");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39)
        {
          objc_msgSend(v5, "sourceTensors");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "objectAtIndexedSubscript:", v36);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "deviceMemory");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "removeAllObjects");

          objc_msgSend(v5, "sourceTensors");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "objectAtIndexedSubscript:", v36);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setSharedMemoryTensor:", 0);

        }
        ++v36;
        objc_msgSend(v5, "sourceTensors");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "count");

      }
      while (v36 < v46);
    }
    objc_msgSend(v5, "resultTensors");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "count");

    if (v48)
    {
      v49 = 0;
      do
      {
        objc_msgSend(v5, "resultTensors");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "objectAtIndexedSubscript:", v49);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "sharedMemoryTensor");
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        if (v52)
        {
          objc_msgSend(v5, "resultTensors");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "objectAtIndexedSubscript:", v49);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "deviceMemory");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "removeAllObjects");

          objc_msgSend(v5, "resultTensors");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "objectAtIndexedSubscript:", v49);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "setSharedMemoryTensor:", 0);

        }
        ++v49;
        objc_msgSend(v5, "resultTensors");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v58, "count");

      }
      while (v49 < v59);
    }
    objc_msgSend(v5, "resultGradientTensors");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v60, "count");

    if (v61)
    {
      v62 = 0;
      do
      {
        objc_msgSend(v5, "resultGradientTensors");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "objectAtIndexedSubscript:", v62);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "sharedMemoryTensor");
        v65 = (void *)objc_claimAutoreleasedReturnValue();

        if (v65)
        {
          objc_msgSend(v5, "resultGradientTensors");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "objectAtIndexedSubscript:", v62);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "deviceMemory");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "removeAllObjects");

          objc_msgSend(v5, "resultGradientTensors");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "objectAtIndexedSubscript:", v62);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "setSharedMemoryTensor:", 0);

        }
        ++v62;
        objc_msgSend(v5, "resultGradientTensors");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_msgSend(v71, "count");

      }
      while (v62 < v72);
    }
    goto LABEL_54;
  }
LABEL_59:
  -[MLCGraph addOutputs:](v2, "addOutputs:", 0);
  v87.receiver = v2;
  v87.super_class = (Class)MLCGraph;
  -[MLCGraph dealloc](&v87, sel_dealloc);
}

- (id)createTensorWith:(id)a3 sources:(id)a4
{
  return (id)objc_msgSend(a3, "resultTensorFromSources:", a4);
}

- (id)createGradientSourceTensorWith:(id)a3 source:(id)a4
{
  void *v4;
  void *v5;
  NSObject *v7;

  if (a4)
  {
    objc_msgSend(a4, "descriptor", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLCTensor tensorWithDescriptor:](MLCTensor, "tensorWithDescriptor:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[MLCLog framework](MLCLog, "framework", a3);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MLCGraph createGradientSourceTensorWith:source:].cold.1(a2);

    v5 = 0;
  }
  return v5;
}

- (id)createLossGradientSourceTensorWith:(id)a3 source:(id)a4 batchSize:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;

  v7 = a4;
  v8 = a5;
  if (v7)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    objc_msgSend(v7, "descriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shape");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      v13 = 0;
      do
      {
        objc_msgSend(v7, "descriptor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "shape");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndex:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          v17 = v16;
        else
          v17 = v8;
        objc_msgSend(v9, "setObject:atIndexedSubscript:", v17, v13);

        ++v13;
        objc_msgSend(v7, "descriptor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "shape");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "count");

      }
      while (v13 < v20);
    }
    objc_msgSend(v7, "descriptor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v9, objc_msgSend(v21, "dataType"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    +[MLCTensor tensorWithDescriptor:](MLCTensor, "tensorWithDescriptor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[MLCGraph createGradientSourceTensorWith:source:].cold.1(a2);

    v23 = 0;
  }

  return v23;
}

- (void)checkAndResetTensorsAssociatedWithLayer:(id)a3 sources:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  unint64_t v35;
  id v36;

  v36 = a3;
  v5 = a4;
  objc_msgSend(v36, "sourceTensors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  objc_msgSend(v36, "sourceTensors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    objc_msgSend(v36, "sourceTensors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      v12 = 0;
      while (1)
      {
        objc_msgSend(v36, "sourceTensors");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndexedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectAtIndexedSubscript:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14 != v15)
          break;
        ++v12;
        objc_msgSend(v36, "sourceTensors");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

        if (v12 >= v17)
          goto LABEL_6;
      }
      objc_msgSend(v36, "sourceTensors");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "count");

      if (v28)
      {
        v29 = 0;
        while (1)
        {
          objc_msgSend(v36, "sourceTensors");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectAtIndexedSubscript:", v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectAtIndexedSubscript:", v29);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v31, "doesShapeMatchWithTensor:", v32);

          if ((v33 & 1) == 0)
            break;
          ++v29;
          objc_msgSend(v36, "sourceTensors");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "count");

          if (v29 >= v35)
            goto LABEL_17;
        }
      }
      else
      {
LABEL_17:
        if (v7)
        {
          objc_msgSend(v36, "sourceTensors");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "removeAllObjects");
LABEL_11:

          goto LABEL_12;
        }
      }
LABEL_7:
      if (objc_msgSend(v36, "isUpdatable"))
      {
        objc_msgSend(v36, "sourceTensors");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");

        if (v19)
        {
          objc_msgSend(v36, "device");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "computeEngine");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "synchronizeUpdatesForLayer:", v36);

        }
      }
      objc_msgSend(v36, "sourceTensors");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "removeAllObjects");

      objc_msgSend(v36, "resultTensors");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "removeAllObjects");

      objc_msgSend(v36, "sourceGradientTensors");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "removeAllObjects");

      objc_msgSend(v36, "resultGradientTensors");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "removeAllObjects");

      v26 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
      objc_msgSend(v36, "setDeviceOps:", v26);
      goto LABEL_11;
    }
  }
LABEL_6:
  if (!v7)
    goto LABEL_7;
LABEL_12:

}

- (void)linkSourceTensorsWithLayer:(id)a3 sources:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  NSMutableDictionary *layerParentMap;
  void *v28;
  void *v29;
  void *v30;
  NSMutableDictionary *layerChildMap;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id obj;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[MLCGraph nextLayerID](self, "nextLayerID");
  -[MLCGraph setNextLayerID:](self, "setNextLayerID:", v8 + 1);
  objc_msgSend(v6, "assignLayerID:", v8);
  v9 = (void *)MEMORY[0x1E0C9AA60];
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  -[MLCGraph layerChildMap](self, "layerChildMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "label");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

  v13 = (void *)objc_msgSend(v9, "mutableCopy");
  -[MLCGraph layerParentMap](self, "layerParentMap");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "label");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v15);

  objc_msgSend(v6, "sourceTensors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v16, "count");

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v7;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v40)
  {
    v38 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v47 != v38)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v18, "childLayers");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v6);

        if (!v39)
        {
          objc_msgSend(v6, "sourceTensors");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v18);

        }
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v41 = v18;
        objc_msgSend(v18, "parentLayers");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v43;
          do
          {
            for (j = 0; j != v23; ++j)
            {
              if (*(_QWORD *)v43 != v24)
                objc_enumerationMutation(v21);
              v26 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
              layerParentMap = self->_layerParentMap;
              objc_msgSend(v6, "label");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary objectForKeyedSubscript:](layerParentMap, "objectForKeyedSubscript:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v26, "label");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "addObject:", v30);

              layerChildMap = self->_layerChildMap;
              objc_msgSend(v26, "label");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary objectForKeyedSubscript:](layerChildMap, "objectForKeyedSubscript:", v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v6, "label");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "addObject:", v34);

            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
          }
          while (v23);
        }

        objc_msgSend(v41, "parentLayers");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "count");

        if (!v36)
          -[NSMutableArray addObject:](self->_rootLevelTensorNodes, "addObject:", v41);
      }
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v40);
  }

}

- (BOOL)checksBeforeAddLayerInGraph:(id)a3 sources:(id)a4 forTraining:(BOOL)a5
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  NSObject *v15;
  BOOL v16;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "resultTensors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12
    && (-[MLCGraph graphLayerList](self, "graphLayerList"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = -[MLCGraph isLayerInGraphLayerList:graphLayerList:](self, "isLayerInGraphLayerList:graphLayerList:", v9, v13), v13, v14))
  {
    +[MLCLog framework](MLCLog, "framework");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MLCGraph checksBeforeAddLayerInGraph:sources:forTraining:].cold.4();
  }
  else if (objc_msgSend(v9, "layerID"))
  {
    +[MLCLog framework](MLCLog, "framework");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MLCGraph checksBeforeAddLayerInGraph:sources:forTraining:].cold.3();
  }
  else if (objc_msgSend(v10, "count"))
  {
    if ((objc_msgSend(v9, "isSupportedShapeForTensorSources:", v10) & 1) != 0)
    {
      if (a5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v16 = 1;
        goto LABEL_9;
      }
      +[MLCLog framework](MLCLog, "framework");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[MLCGraph checksBeforeAddLayerInGraph:sources:forTraining:].cold.2(a2);
    }
    else
    {
      +[MLCLog framework](MLCLog, "framework");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138412802;
        v20 = v18;
        v21 = 2112;
        v22 = v9;
        v23 = 2112;
        v24 = v10;
        _os_log_error_impl(&dword_1D4999000, v15, OS_LOG_TYPE_ERROR, "%@: layer (%@) does not support tensor shape used by sources (%@)", (uint8_t *)&v19, 0x20u);

      }
    }
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MLCGraph checksBeforeAddLayerInGraph:sources:forTraining:].cold.1();
  }

  v16 = 0;
LABEL_9:

  return v16;
}

- (NSArray)splitWithSource:(MLCTensor *)source splitCount:(NSUInteger)splitCount dimension:(NSUInteger)dimension
{
  MLCTensor *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  MLCTensor *v29;

  v8 = source;
  +[MLCSplitLayer layerWithSplitCount:dimension:](MLCSplitLayer, "layerWithSplitCount:dimension:", splitCount, dimension);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v29 = v8;
  -[MLCGraph nodeWithMultiOutputLayer:source:forTraining:](self, "nodeWithMultiOutputLayer:source:forTraining:", v9, v8, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v9, "sourceGradientTensors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (!v12)
    {
      if (objc_msgSend(v10, "count"))
      {
        v13 = 0;
        v14 = 0;
        do
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLCGraph createGradientSourceTensorWith:source:](self, "createGradientSourceTensorWith:source:", v9, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "sourceGradientTensors");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:atIndexedSubscript:", v16, v13);

          objc_msgSend(v9, "sourceGradientTensors");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectAtIndexedSubscript:", v13);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setSplitOffset:", v14);

          v20 = objc_msgSend(v9, "dimension");
          objc_msgSend(v9, "sourceGradientTensors");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectAtIndexedSubscript:", v13);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setSplitDimension:", v20);

          objc_msgSend(v9, "sourceGradientTensors");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectAtIndexedSubscript:", v13);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "descriptor");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "shape");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectAtIndexedSubscript:", objc_msgSend(v9, "dimension"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v14 += objc_msgSend(v27, "unsignedIntegerValue");

          ++v13;
        }
        while (v13 < objc_msgSend(v10, "count"));
      }
    }
  }

  return (NSArray *)v10;
}

- (NSArray)splitWithSource:(MLCTensor *)source splitSectionLengths:(NSArray *)splitSectionLengths dimension:(NSUInteger)dimension
{
  MLCTensor *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  MLCTensor *v29;

  v8 = source;
  +[MLCSplitLayer layerWithSplitSectionLengths:dimension:](MLCSplitLayer, "layerWithSplitSectionLengths:dimension:", splitSectionLengths, dimension);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v29 = v8;
  -[MLCGraph nodeWithMultiOutputLayer:source:forTraining:](self, "nodeWithMultiOutputLayer:source:forTraining:", v9, v8, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v9, "sourceGradientTensors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (!v12)
    {
      if (objc_msgSend(v10, "count"))
      {
        v13 = 0;
        v14 = 0;
        do
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLCGraph createGradientSourceTensorWith:source:](self, "createGradientSourceTensorWith:source:", v9, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "sourceGradientTensors");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:atIndexedSubscript:", v16, v13);

          objc_msgSend(v9, "sourceGradientTensors");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectAtIndexedSubscript:", v13);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setSplitOffset:", v14);

          v20 = objc_msgSend(v9, "dimension");
          objc_msgSend(v9, "sourceGradientTensors");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectAtIndexedSubscript:", v13);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setSplitDimension:", v20);

          objc_msgSend(v9, "sourceGradientTensors");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectAtIndexedSubscript:", v13);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "descriptor");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "shape");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectAtIndexedSubscript:", objc_msgSend(v9, "dimension"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v14 += objc_msgSend(v27, "unsignedIntegerValue");

          ++v13;
        }
        while (v13 < objc_msgSend(v10, "count"));
      }
    }
  }

  return (NSArray *)v10;
}

- (MLCTensor)concatenateWithSources:(NSArray *)sources dimension:(NSUInteger)dimension
{
  NSArray *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = sources;
  if (!-[NSArray count](v7, "count"))
  {
    +[MLCLog framework](MLCLog, "framework");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MLCGraph concatenateWithSources:dimension:].cold.1(a2);
    goto LABEL_14;
  }
  if (dimension > 3)
  {
    +[MLCLog framework](MLCLog, "framework");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MLCGraph concatenateWithSources:dimension:].cold.2(a2);
LABEL_14:

    v12 = 0;
    goto LABEL_15;
  }
  if (-[NSArray count](v7, "count"))
  {
    v9 = 0;
    while (1)
    {
      -[NSArray objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        break;
      if (++v9 >= -[NSArray count](v7, "count"))
        goto LABEL_11;
    }
    +[MLCLog framework](MLCLog, "framework");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MLCGraph createGradientSourceTensorWith:source:].cold.1(a2);
    goto LABEL_14;
  }
LABEL_11:
  +[MLCConcatenationLayer layerWithDimension:](MLCConcatenationLayer, "layerWithDimension:", dimension);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCGraph nodeWithLayer:sources:](self, "nodeWithLayer:sources:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
  return (MLCTensor *)v12;
}

- (MLCTensor)reshapeWithShape:(NSArray *)shape source:(MLCTensor *)source
{
  MLCTensor *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = source;
  +[MLCReshapeLayer layerWithShape:](MLCReshapeLayer, "layerWithShape:", shape);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLCGraph nodeWithLayer:sources:](self, "nodeWithLayer:sources:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLCTensor *)v9;
}

- (MLCTensor)transposeWithDimensions:(NSArray *)dimensions source:(MLCTensor *)source
{
  MLCTensor *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = source;
  +[MLCTransposeLayer layerWithDimensions:](MLCTransposeLayer, "layerWithDimensions:", dimensions);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLCGraph nodeWithLayer:sources:](self, "nodeWithLayer:sources:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLCTensor *)v9;
}

- (MLCTensor)selectWithSources:(NSArray *)sources condition:(MLCTensor *)condition
{
  NSArray *v7;
  MLCTensor *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v7 = sources;
  v8 = condition;
  if (-[NSArray count](v7, "count") == 2)
  {
    +[MLCSelectionLayer layer](MLCSelectionLayer, "layer");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", 0, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v10;
    -[NSArray objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCGraph nodeWithLayer:sources:](self, "nodeWithLayer:sources:", v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MLCGraph selectWithSources:condition:].cold.1(a2);
    v13 = 0;
  }

  return (MLCTensor *)v13;
}

- (MLCTensor)scatterWithDimension:(NSUInteger)dimension source:(MLCTensor *)source indices:(MLCTensor *)indices copyFrom:(MLCTensor *)copyFrom reductionType:(MLCReductionType)reductionType
{
  uint64_t v7;
  MLCTensor *v12;
  MLCTensor *v13;
  MLCTensor *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];

  v7 = *(_QWORD *)&reductionType;
  v19[3] = *MEMORY[0x1E0C80C00];
  v12 = copyFrom;
  v13 = indices;
  v14 = source;
  +[MLCScatterLayer layerWithDimension:reductionType:](MLCScatterLayer, "layerWithDimension:reductionType:", dimension, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v14;
  v19[1] = v13;
  v19[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLCGraph nodeWithLayer:sources:](self, "nodeWithLayer:sources:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLCTensor *)v17;
}

- (MLCTensor)gatherWithDimension:(NSUInteger)dimension source:(MLCTensor *)source indices:(MLCTensor *)indices
{
  MLCTensor *v8;
  MLCTensor *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v8 = indices;
  v9 = source;
  +[MLCGatherLayer layerWithDimension:](MLCGatherLayer, "layerWithDimension:", dimension);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLCGraph nodeWithLayer:sources:](self, "nodeWithLayer:sources:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLCTensor *)v12;
}

- (MLCTensor)nodeWithLayer:(MLCLayer *)layer source:(MLCTensor *)source
{
  void *v6;
  MLCTensor *v7;
  MLCLayer *v8;
  void *v9;
  void *v10;
  MLCTensor *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = source;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = source;
  v8 = layer;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLCGraph nodeWithLayer:sources:disableUpdate:](self, "nodeWithLayer:sources:disableUpdate:", v8, v9, 0, v12, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLCTensor *)v10;
}

- (MLCTensor)nodeWithLayer:(MLCLayer *)layer sources:(NSArray *)sources lossLabels:(NSArray *)lossLabels
{
  MLCLayer *v8;
  NSArray *v9;
  NSArray *v10;
  MLCLayer *v11;
  void *v12;
  void *v13;
  NSObject *v14;

  v8 = layer;
  v9 = sources;
  v10 = lossLabels;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v8;
    -[NSArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCLayer setLossLabels:](v11, "setLossLabels:", v12);

    -[MLCGraph nodeWithLayer:sources:](self, "nodeWithLayer:sources:", v11, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[MLCGraph nodeWithLayer:sources:lossLabels:].cold.1();

    v13 = 0;
  }

  return (MLCTensor *)v13;
}

- (MLCTensor)nodeWithLayer:(MLCLayer *)layer sources:(NSArray *)sources
{
  return -[MLCGraph nodeWithLayer:sources:disableUpdate:](self, "nodeWithLayer:sources:disableUpdate:", layer, sources, 0);
}

- (MLCTensor)nodeWithLayer:(MLCLayer *)layer sources:(NSArray *)sources disableUpdate:(BOOL)disableUpdate
{
  _BOOL8 v5;
  MLCLayer *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = disableUpdate;
  v8 = layer;
  -[MLCGraph nodeWithLayer:sources:forTraining:](self, "nodeWithLayer:sources:forTraining:", v8, sources, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[MLCLayer setDisableUpdate:](v8, "setDisableUpdate:", v5);
    if (-[MLCLayer isUpdatable](v8, "isUpdatable"))
      -[MLCLayer setIsUpdatable:](v8, "setIsUpdatable:", -[MLCLayer disableUpdate](v8, "disableUpdate") ^ 1);
    -[MLCLayer sourceGradientTensors](v8, "sourceGradientTensors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (!v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "descriptor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "shape");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCGraph createLossGradientSourceTensorWith:source:batchSize:](self, "createLossGradientSourceTensorWith:source:batchSize:", v8, v9, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCLayer sourceGradientTensors](v8, "sourceGradientTensors");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:atIndexedSubscript:", v15, 0);

      }
      else
      {
        -[MLCGraph createGradientSourceTensorWith:source:](self, "createGradientSourceTensorWith:source:", v8, v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCLayer sourceGradientTensors](v8, "sourceGradientTensors");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:atIndexedSubscript:", v12, 0);
      }

    }
  }

  return (MLCTensor *)v9;
}

- (id)nodeWithLayer:(id)a3 sources:(id)a4 forTraining:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  id v42;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (-[MLCGraph checksBeforeAddLayerInGraph:sources:forTraining:](self, "checksBeforeAddLayerInGraph:sources:forTraining:", v8, v9, v5))
  {
    -[MLCGraph checkAndResetTensorsAssociatedWithLayer:sources:](self, "checkAndResetTensorsAssociatedWithLayer:sources:", v8, v9);
    -[MLCGraph linkSourceTensorsWithLayer:sources:](self, "linkSourceTensorsWithLayer:sources:", v8, v9);
    objc_msgSend(v8, "linkAssociatedTensors");
    objc_msgSend(v8, "resultTensors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      objc_msgSend(v8, "resultTensors");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[MLCGraph createTensorWith:sources:](self, "createTensorWith:sources:", v8, v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "resultTensors");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v13);
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v8;
      objc_msgSend(v14, "descriptor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "resultMode");

      if ((v16 & 1) != 0)
      {
        objc_msgSend(v14, "resultTensors");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");

        if (v18 == 1)
        {
          objc_msgSend(v14, "resultStateTensorWithSources:", v9);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "resultTensors");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v21);

          objc_msgSend(v14, "resultTensors");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v23);

          objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "parentLayers");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v14);

          objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "parentLayers");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v14);

          objc_msgSend(v14, "resultStateTensorWithSources:", v9);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLCGraph createGradientSourceTensorWith:source:](self, "createGradientSourceTensorWith:source:", v14, v13);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "sourceGradientTensors");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setObject:atIndexedSubscript:", v29, 0);

          objc_msgSend(v14, "sourceGradientTensors");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObject:", v32);

          objc_msgSend(v14, "sourceGradientTensors");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectAtIndexedSubscript:", 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "addObject:", v34);

        }
        else
        {
          objc_msgSend(v14, "resultTensors");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "objectAtIndexedSubscript:", 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "parentLayers");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "addObject:", v14);

          objc_msgSend(v14, "resultTensors");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectAtIndexedSubscript:", 2);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "parentLayers");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "addObject:", v14);
        }

      }
    }
    if (v13)
    {
      objc_msgSend(v13, "parentLayers");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addObject:", v8);

      -[MLCGraph graphLayerList](self, "graphLayerList");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addObject:", v8);

      if (-[MLCGraph staticBatchSizeInGraph](self, "staticBatchSizeInGraph"))
        v40 = objc_msgSend(v8, "isStaticBatchSize");
      else
        v40 = 0;
      -[MLCGraph setStaticBatchSizeInGraph:](self, "setStaticBatchSizeInGraph:", v40);
      v42 = v13;
    }
    else
    {
      +[MLCLog framework](MLCLog, "framework");
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        -[MLCGraph nodeWithLayer:sources:forTraining:].cold.1();

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)nodeWithMultiOutputLayer:(id)a3 source:(id)a4 forTraining:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unint64_t v41;
  void *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  unint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v62;
  void *v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  unint64_t v79;
  unint64_t v80;
  void *v81;
  void *v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  unint64_t v87;
  void *v88;
  unint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  void *v97;
  MLCGraph *v98;
  id v99;
  void *v100;
  uint64_t v101;
  id v102;
  id v103;
  id v104;
  uint8_t buf[4];
  void *v106;
  __int16 v107;
  id v108;
  __int16 v109;
  id v110;
  uint64_t v111;

  v5 = a5;
  v111 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[MLCLog framework](MLCLog, "framework");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v106 = v95;
      v107 = 2112;
      v108 = v9;
      v109 = 2112;
      v110 = v10;
      _os_log_error_impl(&dword_1D4999000, v15, OS_LOG_TYPE_ERROR, "%@: layer (%@) does not support multiple result tensors (%@)", buf, 0x20u);

    }
    v60 = 0;
    goto LABEL_21;
  }
  v104 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v104, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MLCGraph checksBeforeAddLayerInGraph:sources:forTraining:](self, "checksBeforeAddLayerInGraph:sources:forTraining:", v9, v11, v5);

  if (v12)
  {
    v103 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v103, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCGraph checkAndResetTensorsAssociatedWithLayer:sources:](self, "checkAndResetTensorsAssociatedWithLayer:sources:", v9, v13);

    v102 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v102, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCGraph linkSourceTensorsWithLayer:sources:](self, "linkSourceTensorsWithLayer:sources:", v9, v14);

    v99 = v9;
    v15 = v9;
    v16 = -[NSObject dimension](v15, "dimension");
    objc_msgSend(v10, "descriptor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "shape");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = v16;
    objc_msgSend(v18, "objectAtIndexedSubscript:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "unsignedIntegerValue");

    v21 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    objc_msgSend(v10, "descriptor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "shape");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    if (v24)
    {
      v25 = 0;
      do
      {
        objc_msgSend(v10, "descriptor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "shape");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectAtIndexedSubscript:", v25);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:atIndexedSubscript:", v28, v25);

        ++v25;
        objc_msgSend(v10, "descriptor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "shape");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "count");

      }
      while (v25 < v31);
    }
    -[NSObject resultTensors](v15, "resultTensors");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "count");

    v98 = self;
    if (v33)
    {
      -[NSObject resultTensors](v15, "resultTensors");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "count");

      if (v35)
      {
        v36 = 0;
        do
        {
          -[NSObject resultTensors](v15, "resultTensors");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "objectAtIndexedSubscript:", v36);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "parentLayers");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "addObject:", v15);

          ++v36;
          -[NSObject resultTensors](v15, "resultTensors");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "count");

        }
        while (v36 < v41);
      }
    }
    else
    {
      -[NSObject splitSectionLengths](v15, "splitSectionLengths");
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      if (v62)
      {
        -[NSObject splitSectionLengths](v15, "splitSectionLengths");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v63, "count");

        if (v64)
        {
          v65 = 0;
          v66 = 0x1E981F000uLL;
          v67 = 0x1E981F000uLL;
          v96 = v10;
          v97 = v21;
          do
          {
            -[NSObject splitSectionLengths](v15, "splitSectionLengths");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "objectAtIndexedSubscript:", v65);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setObject:atIndexedSubscript:", v69, v101);

            v70 = *(void **)(v66 + 2336);
            objc_msgSend(v10, "descriptor");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "descriptorWithShape:dataType:", v21, objc_msgSend(v71, "dataType"));
            v72 = objc_claimAutoreleasedReturnValue();

            v100 = (void *)v72;
            objc_msgSend(*(id *)(v67 + 2320), "tensorWithDescriptor:", v72);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "parentLayers");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "addObject:", v15);

            -[NSObject resultTensors](v15, "resultTensors");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "addObject:", v73);

            -[NSObject splitSectionLengths](v15, "splitSectionLengths");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "objectAtIndexedSubscript:", v65);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20 <= objc_msgSend(v77, "unsignedIntegerValue"))
            {
              v20 = 0;
            }
            else
            {
              -[NSObject splitSectionLengths](v15, "splitSectionLengths");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v78, "objectAtIndexedSubscript:", v65);
              v79 = v67;
              v80 = v66;
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              v20 -= objc_msgSend(v81, "unsignedIntegerValue");

              v66 = v80;
              v67 = v79;
              v10 = v96;

              v21 = v97;
            }

            if (!v20)
              break;
            ++v65;
            -[NSObject splitSectionLengths](v15, "splitSectionLengths");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            v83 = objc_msgSend(v82, "count");

          }
          while (v65 < v83);
        }
      }
      else
      {
        v84 = -[NSObject splitCount](v15, "splitCount");
        if (v84)
        {
          v85 = v84;
          v86 = (v20 + v84 - 1) / v84;
          do
          {
            if (v20 >= v86)
              v87 = v86;
            else
              v87 = v20;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v87);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "replaceObjectAtIndex:withObject:", v101, v88);
            v89 = v20;
            objc_msgSend(v10, "descriptor");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v21, objc_msgSend(v90, "dataType"));
            v91 = (void *)objc_claimAutoreleasedReturnValue();

            +[MLCTensor tensorWithDescriptor:](MLCTensor, "tensorWithDescriptor:", v91);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v92, "parentLayers");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "addObject:", v15);

            -[NSObject resultTensors](v15, "resultTensors");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "addObject:", v92);

            if (v89 <= v86)
              break;
            v20 = v89 >= v86 ? v89 - v86 : 0;
            --v85;
          }
          while (v85);
        }
      }
    }
    -[NSObject resultTensors](v15, "resultTensors");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "count");

    if (v43)
    {
      v44 = 0;
      v45 = 0;
      do
      {
        -[NSObject resultTensors](v15, "resultTensors");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "objectAtIndexedSubscript:", v44);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setSplitOffset:", v45);

        v48 = -[NSObject dimension](v15, "dimension");
        -[NSObject resultTensors](v15, "resultTensors");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "objectAtIndexedSubscript:", v44);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "setSplitDimension:", v48);

        -[NSObject resultTensors](v15, "resultTensors");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "objectAtIndexedSubscript:", v44);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "descriptor");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "shape");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "objectAtIndexedSubscript:", -[NSObject dimension](v15, "dimension"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v45 += objc_msgSend(v55, "unsignedIntegerValue");

        ++v44;
        -[NSObject resultTensors](v15, "resultTensors");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v56, "count");

      }
      while (v44 < v57);
    }
    -[MLCGraph graphLayerList](v98, "graphLayerList");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "addObject:", v15);

    if (-[MLCGraph staticBatchSizeInGraph](v98, "staticBatchSizeInGraph"))
      v59 = -[NSObject isStaticBatchSize](v15, "isStaticBatchSize");
    else
      v59 = 0;
    v9 = v99;
    -[MLCGraph setStaticBatchSizeInGraph:](v98, "setStaticBatchSizeInGraph:", v59);
    -[NSObject resultTensors](v15, "resultTensors");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_21:
    goto LABEL_22;
  }
  v60 = 0;
LABEL_22:

  return v60;
}

- (BOOL)bindAndWriteData:(NSDictionary *)inputsData forInputs:(NSDictionary *)inputTensors toDevice:(MLCDevice *)device batchSize:(NSUInteger)batchSize synchronous:(BOOL)synchronous
{
  return -[MLCGraph bindAndWriteData:forInputs:toDevice:batchSize:synchronous:skipWrite:](self, "bindAndWriteData:forInputs:toDevice:batchSize:synchronous:skipWrite:", inputsData, inputTensors, device, batchSize, synchronous, 0);
}

- (BOOL)bindAndWriteData:(NSDictionary *)inputsData forInputs:(NSDictionary *)inputTensors toDevice:(MLCDevice *)device synchronous:(BOOL)synchronous
{
  return -[MLCGraph bindAndWriteData:forInputs:toDevice:batchSize:synchronous:skipWrite:](self, "bindAndWriteData:forInputs:toDevice:batchSize:synchronous:skipWrite:", inputsData, inputTensors, device, 0, synchronous, 0);
}

- (BOOL)bindAndWriteData:(id)a3 forInputs:(id)a4 toDevice:(id)a5 batchSize:(unint64_t)a6 synchronous:(BOOL)a7 skipWrite:(BOOL)a8
{
  id v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  char isKindOfClass;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  BOOL v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  char v55;
  uint64_t v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  BOOL v65;
  void *v66;
  NSObject *v67;
  _BOOL4 v69;
  id v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  id obj;
  id v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v69 = a7;
  v96 = *MEMORY[0x1E0C80C00];
  v79 = a3;
  v10 = a4;
  v72 = a5;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  obj = v10;
  v75 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
  if (v75)
  {
    v73 = *(_QWORD *)v90;
    do
    {
      for (i = 0; i != v75; ++i)
      {
        if (*(_QWORD *)v90 != v73)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * i);
        objc_msgSend(obj, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "childLayers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count");

        if (v15)
        {
          v16 = 0;
          while (1)
          {
            objc_msgSend(v13, "childLayers");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectAtIndexedSubscript:", v16);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
              break;
LABEL_19:
            ++v16;
            objc_msgSend(v13, "childLayers");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v32, "count");

            if (v16 >= v33)
              goto LABEL_20;
          }
          objc_msgSend(v13, "childLayers");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectAtIndexedSubscript:", v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v21, "sourceTensors");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "count") == 2)
          {

            goto LABEL_12;
          }
          objc_msgSend(v21, "sourceTensors");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "count");

          if (v24 == 4)
          {
LABEL_12:
            objc_msgSend(v21, "sourceTensors");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "count");
            objc_msgSend(v21, "sourceTensors");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v27;
            if (v26 == 2)
              v29 = 1;
            else
              v29 = 3;
            objc_msgSend(v27, "objectAtIndexedSubscript:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            if (v30 == v13)
            {
              objc_msgSend(v79, "objectForKeyedSubscript:", v12);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              -[MLCGraph createVariableLengthSequenceTensorsForLayer:withVariableSequenceLength:](self, "createVariableLengthSequenceTensorsForLayer:withVariableSequenceLength:", v21, v31);

            }
          }

          goto LABEL_19;
        }
LABEL_20:

      }
      v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
    }
    while (v75);
  }
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v34 = v79;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v86;
    v38 = v72;
    v39 = a8;
    v40 = a6;
    v74 = v34;
    v76 = *(_QWORD *)v86;
    while (2)
    {
      v41 = 0;
      v80 = v36;
      do
      {
        if (*(_QWORD *)v86 != v37)
          objc_enumerationMutation(v34);
        v42 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * v41);
        objc_msgSend(v34, "objectForKeyedSubscript:", v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(obj, "objectForKeyedSubscript:", v42);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v44, "skipWritingToDevice") & 1) == 0)
        {
          if (!v44)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("input name=%@ missing from inputs specified at compile time allInputs=%@"), v42, obj);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            +[MLCLog framework](MLCLog, "framework");
            v67 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
              -[MLCTrainingGraph executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:].cold.3();

            v65 = 0;
            goto LABEL_65;
          }
          v45 = v38;
          if (objc_msgSend(v45, "type") == 3)
          {
            v83 = 0u;
            v84 = 0u;
            v81 = 0u;
            v82 = 0u;
            objc_msgSend(v44, "childLayers");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v81, v93, 16);
            if (v47)
            {
              v48 = v47;
              v49 = *(_QWORD *)v82;
              while (2)
              {
                for (j = 0; j != v48; ++j)
                {
                  if (*(_QWORD *)v82 != v49)
                    objc_enumerationMutation(v46);
                  v51 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * j);
                  objc_msgSend(v51, "device");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v52)
                  {
                    objc_msgSend(v51, "device");
                    v53 = objc_claimAutoreleasedReturnValue();

                    v45 = (id)v53;
                    goto LABEL_40;
                  }
                }
                v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v81, v93, 16);
                if (v48)
                  continue;
                break;
              }
LABEL_40:
              v38 = v72;
              v39 = a8;
              v40 = a6;
            }

            v34 = v74;
          }
          objc_msgSend(v45, "computeEngine");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_opt_respondsToSelector();

          if ((v55 & 1) != 0)
          {
            v56 = v40;
            if (!v40)
              v56 = objc_msgSend(v44, "calculateBatchSizeToUse:", 0);
            objc_msgSend(v45, "computeEngine");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "selectDevicesWithBatchSize:calledfromBindAndWrite:", v56, 1);

          }
          if (objc_msgSend(v45, "type"))
          {
            objc_msgSend(v45, "computeEngine");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = objc_msgSend(v58, "needToAllocateDeviceMemoryForTensor:", v44);

            if (v59)
              objc_msgSend(v44, "allocateDeviceMemory:", v45);
          }
          else if ((objc_msgSend(v44, "isLayerParameter") & 1) == 0)
          {
            objc_msgSend(v43, "data");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "setData:", v60);

            objc_msgSend(v44, "data");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "deviceMemory");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "setObject:atIndexedSubscript:", v61, 0);

          }
          if (!v39)
          {
            v63 = objc_msgSend(v44, "calculateBatchSizeToUse:", v40);
            if (objc_msgSend(v44, "isLayerParameter"))
            {
              objc_msgSend(v44, "bindAndWriteData:toDevice:", v43, v45);
            }
            else
            {
              objc_msgSend(v43, "data");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "setData:", v64);

              if (v69)
                objc_msgSend(v44, "writeTensorDataToAllDevices:batchSize:", v45, v63);
              else
                objc_msgSend(v44, "dispatchWriteTensorDataToAllDevices:batchSize:", v45, v63);
            }
          }
          objc_msgSend(v44, "setDevice:", v45);

          v37 = v76;
          v36 = v80;
        }

        ++v41;
      }
      while (v41 != v36);
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
      if (v36)
        continue;
      break;
    }
    v65 = 1;
  }
  else
  {
    v65 = 1;
    v38 = v72;
  }
LABEL_65:

  return v65;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCGraph graphObjects](self, "graphObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCGraph graphLayerList](self, "graphLayerList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCGraph allInputs](self, "allInputs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCGraph allOutputs](self, "allOutputs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCGraph device](self, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { graphObjects=%@ : graphLayerList=%@ : allInputs=%@ : allOutputs=%@ : device=%@}"), v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)writeAsyncToDevice:(id)a3 dataForTensors:(id)a4
{
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v11, "computeEngine");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "allocateDeviceMemoryForTensor:", v8);

      objc_msgSend(v11, "computeEngine");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "broadcastTensor:", v10);

      ++v6;
    }
    while (v6 < objc_msgSend(v5, "count"));
  }

}

- (void)createVariableLengthSequenceTensorsForLayer:(id)a3 withVariableSequenceLength:(id)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  v36 = a3;
  v5 = a4;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v7 = objc_msgSend(v5, "length");
  if (v7 >= 4)
  {
    v8 = 0;
    v9 = v7 >> 2;
    do
    {
      v10 = objc_msgSend(v5, "bytes");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(v10 + 4 * v8));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v11);

      ++v8;
    }
    while (v9 != v8);
  }
  objc_msgSend(v36, "sourceTensors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "descriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "shape");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "descriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCTensorDescriptor descriptorWithShape:sequenceLengths:sortedSequences:dataType:](MLCTensorDescriptor, "descriptorWithShape:sequenceLengths:sortedSequences:dataType:", v14, v6, 1, objc_msgSend(v15, "dataType"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "sourceTensors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDescriptor:", v16);

  objc_msgSend(v36, "resultTensors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "descriptor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "shape");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "descriptor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCTensorDescriptor descriptorWithShape:sequenceLengths:sortedSequences:dataType:](MLCTensorDescriptor, "descriptorWithShape:sequenceLengths:sortedSequences:dataType:", v22, v6, 1, objc_msgSend(v23, "dataType"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "resultTensors");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setDescriptor:", v24);

  objc_msgSend(v36, "sourceGradientTensors");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "descriptor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "shape");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "descriptor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCTensorDescriptor descriptorWithShape:sequenceLengths:sortedSequences:dataType:](MLCTensorDescriptor, "descriptorWithShape:sequenceLengths:sortedSequences:dataType:", v30, v6, 1, objc_msgSend(v31, "dataType"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "sourceGradientTensors");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setDescriptor:", v32);

}

- (void)enumerateLayersUsingBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  NSMutableDictionary *layerParentMap;
  void *v10;
  void *v11;
  NSMutableDictionary *layerChildMap;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void (**v17)(id, void *, void *, void *);

  v17 = (void (**)(id, void *, void *, void *))a3;
  -[MLCGraph graphLayerList](self, "graphLayerList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = 0;
    do
    {
      -[MLCGraph graphLayerList](self, "graphLayerList");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      layerParentMap = self->_layerParentMap;
      objc_msgSend(v8, "label");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](layerParentMap, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      layerChildMap = self->_layerChildMap;
      objc_msgSend(v8, "label");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](layerChildMap, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17[2](v17, v8, v11, v14);

      ++v6;
      -[MLCGraph graphLayerList](self, "graphLayerList");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

    }
    while (v6 < v16);
  }

}

- (void)enumerateInputsUsingBlock:(id)a3
{
  void (**v4)(id, void *, uint64_t, void *);
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, uint64_t, void *))a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_rootLevelTensorNodes;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "descriptor", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "label");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "dataType");
        objc_msgSend(v11, "shape");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v12, v13, v14);

      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

- (void)enumerateOutputsUsingBlock:(id)a3
{
  void (**v4)(id, void *, uint64_t, void *);
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  unint64_t v23;
  MLCGraph *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, uint64_t, void *))a3;
  -[MLCGraph graphLayerList](self, "graphLayerList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    v24 = self;
    do
    {
      -[MLCGraph graphLayerList](self, "graphLayerList", v24);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v25 = v9;
      objc_msgSend(v9, "resultTensors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v27 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            objc_msgSend(v15, "childLayers");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "count");

            if (!v17)
            {
              objc_msgSend(v15, "descriptor");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "label");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v18, "dataType");
              objc_msgSend(v18, "shape");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v4[2](v4, v19, v20, v21);

            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v12);
      }

      ++v7;
      self = v24;
      -[MLCGraph graphLayerList](v24, "graphLayerList");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

    }
    while (v7 < v23);
  }

}

- (BOOL)isLayerInGraphLayerList:(id)a3 graphLayerList:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  id v8;
  BOOL v9;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v7 = 0;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      v9 = v8 == v5;
      if (v9)
        break;
      ++v7;
    }
    while (v7 < objc_msgSend(v6, "count"));
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSArray)resultTensorsForLayer:(MLCLayer *)layer
{
  MLCLayer *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = layer;
  v5 = -[MLCLayer isDebuggingEnabled](v4, "isDebuggingEnabled");
  -[MLCLayer setIsDebuggingEnabled:isPrivate:](v4, "setIsDebuggingEnabled:isPrivate:", 0, 1);
  -[MLCGraph graphLayerList](self, "graphLayerList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCGraph resultTensorsForLayer:graphLayerList:](self, "resultTensorsForLayer:graphLayerList:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLCLayer setIsDebuggingEnabled:isPrivate:](v4, "setIsDebuggingEnabled:isPrivate:", v5, 1);
  return (NSArray *)v7;
}

- (NSArray)sourceTensorsForLayer:(MLCLayer *)layer
{
  MLCLayer *v4;
  void *v5;
  void *v6;

  v4 = layer;
  -[MLCGraph graphLayerList](self, "graphLayerList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCGraph sourceTensorsForLayer:graphLayerList:](self, "sourceTensorsForLayer:graphLayerList:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (id)resultTensorsForLayer:(id)a3 graphLayerList:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  NSObject *v15;

  v6 = a3;
  if (!-[MLCGraph isLayerInGraphLayerList:graphLayerList:](self, "isLayerInGraphLayerList:graphLayerList:", v6, a4))
  {
    +[MLCLog framework](MLCLog, "framework");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MLCTrainingGraph resultGradientTensorsForLayer:summedGradientForInputTensors:].cold.3();
    goto LABEL_13;
  }
  if (objc_msgSend(v6, "skipLayer") && (objc_msgSend(v6, "isLastFusedLayer") & 1) == 0)
  {
    +[MLCLog framework](MLCLog, "framework");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MLCGraph resultTensorsForLayer:graphLayerList:].cold.1();
LABEL_13:

    v14 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_14;
  }
  if (objc_msgSend(v6, "isDebuggingEnabled"))
  {
    objc_msgSend(v6, "resultTensors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v9 = 0;
      do
      {
        objc_msgSend(v6, "resultTensors");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "synchronizeData");

        ++v9;
        objc_msgSend(v6, "resultTensors");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

      }
      while (v9 < v13);
    }
  }
  objc_msgSend(v6, "resultTensors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v14;
}

- (id)sourceTensorsForLayer:(id)a3 graphLayerList:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;

  v6 = a3;
  if (-[MLCGraph isLayerInGraphLayerList:graphLayerList:](self, "isLayerInGraphLayerList:graphLayerList:", v6, a4))
  {
    objc_msgSend(v6, "sourceTensors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MLCTrainingGraph resultGradientTensorsForLayer:summedGradientForInputTensors:].cold.3();

    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

- (void)flattenConditionalLayer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "sourceTensors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[MLCControlTreeNode controlTreeNodeWithPredicate:needToNegate:](MLCControlTreeNode, "controlTreeNodeWithPredicate:needToNegate:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trueBranch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCGraph addGraphNodes:withControlTreeNode:](self, "addGraphNodes:withControlTreeNode:", v8, v7);

  +[MLCControlTreeNode controlTreeNodeWithPredicate:needToNegate:](MLCControlTreeNode, "controlTreeNodeWithPredicate:needToNegate:", v6, 1);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "falseBranch");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCGraph addGraphNodes:withControlTreeNode:](self, "addGraphNodes:withControlTreeNode:", v9, v10);

  -[MLCGraph insertPhis:](self, "insertPhis:", v4);
}

- (void)addGraphNodes:(id)a3 withControlTreeNode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  uint8_t v22[4];
  _BYTE v23[28];

  *(_QWORD *)&v23[20] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "graphLayerList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = 0;
    v20 = v23;
    do
    {
      objc_msgSend(v6, "graphLayerList", v20);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        +[MLCLog framework](MLCLog, "framework");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[MLCGraph addGraphNodes:withControlTreeNode:].cold.1(v22, a2, v20, v14);

      }
      objc_msgSend(v6, "graphLayerList");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setConditionalTreeNode:", v7);

      -[MLCGraph graphLayerList](self, "graphLayerList");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "graphLayerList");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", v10);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v19);

      ++v10;
    }
    while (v9 != v10);
  }

}

- (void)insertPhis:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  MLCGraph *v35;
  void *v36;
  void *v37;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "trueBranch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "falseBranch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "graphLayerList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  objc_msgSend(v6, "graphLayerList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  objc_msgSend(v4, "sourceTensors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v4;
  +[MLCControlTreeNode controlTreeNodeWithPredicate:needToNegate:](MLCControlTreeNode, "controlTreeNodeWithPredicate:needToNegate:", v12, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "resultTensors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    v16 = 0;
    v33 = v10 - 1;
    v34 = v8 - 1;
    v35 = self;
    v36 = v5;
    do
    {
      objc_msgSend(v5, "graphLayerList", v33);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", v34);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "resultTensors");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "graphLayerList");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectAtIndexedSubscript:", v33);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "resultTensors");
      v23 = v15;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v38[0] = v20;
      v38[1] = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "resultTensors");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectAtIndexedSubscript:", v16);
      v28 = v6;
      v29 = v13;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLCPhiLayer layerWithControlTreeNode:sources:resultTensor:](MLCPhiLayer, "layerWithControlTreeNode:sources:resultTensor:", v37, v26, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = v29;
      v6 = v28;

      -[MLCGraph graphLayerList](v35, "graphLayerList");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addObject:", v31);

      v5 = v36;
      v15 = v23;

      ++v16;
    }
    while (v23 != v16);
  }

}

- (id)conditionalWithPredicate:(id)a3 trueBranch:(id)a4 falseBranch:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  +[MLCConditionalLayer layerWithTrueBranch:falseBranch:](MLCConditionalLayer, "layerWithTrueBranch:falseBranch:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    +[MLCLog framework](MLCLog, "framework");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MLCGraph conditionalWithPredicate:trueBranch:falseBranch:].cold.2(a2);

  }
  objc_msgSend(v10, "allOutputs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {

  }
  else
  {
    objc_msgSend(v11, "allOutputs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (!v16)
      goto LABEL_12;
  }
  +[MLCLog framework](MLCLog, "framework");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[MLCGraph conditionalWithPredicate:trueBranch:falseBranch:].cold.1(a2);

LABEL_12:
  -[MLCGraph nodeWithLayer:source:](self, "nodeWithLayer:source:", v12, v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (NSArray)layers
{
  void *v2;
  void *v3;

  -[MLCGraph graphLayerList](self, "graphLayerList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (BOOL)checkPageAlignmentAndSizeForOutputs:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSUInteger v13;
  uint64_t v14;
  NSUInteger v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MLCGraph device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  if (v6 == 1)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), (_QWORD)v18);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "length");
          if (NSRoundUpToMultipleOfPageSize(v13) != v13)
          {

LABEL_15:
            v16 = 0;
            goto LABEL_16;
          }
          v14 = objc_msgSend(v12, "bytes");
          v15 = (NSPageSize() - 1) & v14;

          if (v15)
            goto LABEL_15;
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        v16 = 1;
        if (v9)
          continue;
        break;
      }
    }
    else
    {
      v16 = 1;
    }
LABEL_16:

  }
  else
  {
    v16 = 1;
  }

  return v16;
}

- (void)updateOutputTensorsDeviceMemoryWithData:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v9, (_QWORD)v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCGraph allOutputs](self, "allOutputs");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "device");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x1D8263D2C]();
        objc_msgSend(v13, "computeEngine");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setDeviceMemoryForTensor:data:", v12, v10);

        objc_autoreleasePoolPop(v14);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

}

- (BOOL)addInputs:(id)a3 lossLabels:(id)a4
{
  return -[MLCGraph addInputs:lossLabels:lossLabelWeights:](self, "addInputs:lossLabels:lossLabelWeights:", a3, a4, 0);
}

- (BOOL)addInputs:(id)a3 lossLabels:(id)a4 lossLabelWeights:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = a4;
  -[MLCGraph setAllInputs:](self, "setAllInputs:", a3);
  -[MLCGraph setAllLossLabels:](self, "setAllLossLabels:", v9);

  -[MLCGraph setAllLossLabelWeights:](self, "setAllLossLabelWeights:", v8);
  return 1;
}

- (BOOL)addOutputs:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  NSObject *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[MLCGraph allOutputs](self, "allOutputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        -[MLCGraph allOutputs](self, "allOutputs");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "setComputeFlags:", objc_msgSend(v12, "computeFlags") & 0xFFFFFFFELL);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v7);
  }

  if (!v4)
    goto LABEL_24;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v13 = v4;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (!v14)
    goto LABEL_23;
  v15 = v14;
  v16 = *(_QWORD *)v31;
  while (2)
  {
    for (j = 0; j != v15; ++j)
    {
      if (*(_QWORD *)v31 != v16)
        objc_enumerationMutation(v13);
      v18 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
      objc_msgSend(v13, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("name=%@ in outputs=%@ specifies a nil tensor, outputs="), v18, v13);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLCLog framework](MLCLog, "framework");
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          -[MLCTrainingGraph executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:].cold.3();

        v26 = 0;
        goto LABEL_28;
      }
      v20 = v19;
      if ((objc_msgSend(v19, "computeFlags") & 1) == 0)
      {
        objc_msgSend(v20, "parentLayers");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "count"))
        {

        }
        else
        {
          objc_msgSend(v20, "childLayers");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "count");

          if (!v23)
            goto LABEL_21;
        }
        objc_msgSend(v20, "sharedMemoryTensor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          objc_msgSend(v20, "setSharedMemoryTensor:", 0);
          objc_msgSend(v20, "deviceMemory");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "removeAllObjects");

        }
      }
LABEL_21:
      objc_msgSend(v20, "setComputeFlags:", objc_msgSend(v20, "computeFlags") | 1);

    }
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v15)
      continue;
    break;
  }
LABEL_23:

LABEL_24:
  -[MLCGraph setAllOutputs:](self, "setAllOutputs:", v4);
  v26 = 1;
LABEL_28:

  return v26;
}

- (BOOL)dispatchReadsForMultipleTensorOutputs:(id)a3 finalTensorInGraph:(id)a4 finalResultTensor:(id)a5 batchSize:(unint64_t)a6
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  MLCGraph *v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  uint64_t v35;
  void *v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v34 = a5;
  if (v9)
  {
    v44 = 0uLL;
    v45 = 0uLL;
    v42 = 0uLL;
    v43 = 0uLL;
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v11)
    {
      v12 = v11;
      v35 = *(_QWORD *)v43;
      v36 = v9;
      v13 = self;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v43 != v35)
            objc_enumerationMutation(v9);
          v15 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_msgSend(v9, "objectForKeyedSubscript:", v15, v34);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLCGraph allOutputs](self, "allOutputs");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", v15);
          v18 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "device");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10 && v18 == v10)
          {
            v18 = v34;

          }
          v20 = objc_msgSend(v18, "calculateBatchSizeToUse:", a6);
          objc_msgSend(v19, "computeEngine");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "data");
          v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v21, "dispatchReadTensor:targetBuffer:batchSize:", v18, objc_msgSend(v22, "bytes"), v20);

          v9 = v36;
          self = v13;
        }
        v12 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v12);
    }
  }
  else
  {
    v40 = 0uLL;
    v41 = 0uLL;
    v38 = 0uLL;
    v39 = 0uLL;
    -[MLCGraph allOutputs](self, "allOutputs", v34);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v39;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v39 != v26)
            objc_enumerationMutation(v23);
          v28 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j);
          -[MLCGraph allOutputs](self, "allOutputs");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectForKeyedSubscript:", v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v30, "device");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "computeEngine");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "synchronizeTensor:", v30);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      }
      while (v25);
    }

  }
  return 1;
}

- (void)linkRelatedTensorsForConcatLayer:(id)a3 device:(id)a4
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  id v16;

  v16 = a3;
  v4 = objc_msgSend(v16, "dimension");
  objc_msgSend(v16, "sourceTensors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    v8 = 0;
    do
    {
      objc_msgSend(v16, "sourceTensors");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "setConcatOffset:", v7);
      objc_msgSend(v10, "setConcatDimension:", v4);
      objc_msgSend(v10, "descriptor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "shape");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v7 += objc_msgSend(v13, "unsignedIntegerValue");

      ++v8;
      objc_msgSend(v16, "sourceTensors");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

    }
    while (v8 < v15);
  }

}

- (NSString)summarizedDOTDescription
{
  NSObject *v4;
  MLCGraph *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  NSObject *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  unsigned int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  void *v41;
  void *v42;
  unint64_t v43;
  uint64_t v44;
  void *v45;
  void *i;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  unint64_t v55;
  unsigned int v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  unint64_t v62;
  void *v63;
  void *v64;
  unint64_t v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  unint64_t v81;
  unsigned int v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  unint64_t v88;
  void *v89;
  void *v90;
  unint64_t v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  id v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t j;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  char v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  NSObject *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t k;
  uint64_t v134;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t m;
  void *v140;
  char v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  uint64_t n;
  void *v151;
  int v152;
  __CFString *v153;
  __CFString *v154;
  void *v155;
  uint64_t v156;
  void *v157;
  void *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  unint64_t v172;
  unsigned int v173;
  void *v174;
  void *v175;
  __CFString *v176;
  id v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t ii;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  id obj;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  MLCGraph *v192;
  id v193;
  id v194;
  NSObject *v195;
  id v196;
  id v197;
  id v198;
  id v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  void *v204;
  id v205;
  id v206;
  id v207;
  void *v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  unint64_t v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  _BYTE v246[128];
  _BYTE v247[128];
  _BYTE v248[128];
  _BYTE v249[128];
  _BYTE v250[128];
  _BYTE v251[128];
  _BYTE v252[128];
  _BYTE v253[128];
  _BYTE v254[128];
  uint64_t v255;

  v255 = *MEMORY[0x1E0C80C00];
  if (-[MLCGraph readyForExecution](self, "readyForExecution")
    && (-[MLCGraph compilerOptions](self, "compilerOptions") & 3) == 0)
  {
    +[MLCLog framework](MLCLog, "framework");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MLCGraph summarizedDOTDescription].cold.1(a2);
    v10 = &stru_1E9821EC0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", MEMORY[0x1E0C9AA60]);
    v4 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v192 = self;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = self;
      -[MLCGraph optimizer](v5, "optimizer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[MLCGraph optimizer](v5, "optimizer");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v185 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v185 = 0;
      }
      v11 = (void *)MEMORY[0x1E0C99E60];
      -[MLCGraph stopGradientTensorList](v5, "stopGradientTensorList");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setWithArray:", v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v195 = v13;
    }
    else
    {
      v195 = v4;
      v185 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v242 = 0u;
    v243 = 0u;
    v244 = 0u;
    v245 = 0u;
    -[MLCGraph layers](v192, "layers");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v187 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v242, v254, 16);
    if (v187)
    {
      v15 = 0;
      v188 = *(_QWORD *)v243;
      v204 = v14;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v243 != v188)
          {
            v17 = v16;
            objc_enumerationMutation(obj);
            v16 = v17;
          }
          v189 = v16;
          v18 = *(void **)(*((_QWORD *)&v242 + 1) + 8 * v16);
          v238 = 0u;
          v239 = 0u;
          v240 = 0u;
          v241 = 0u;
          objc_msgSend(v18, "sourceTensors");
          v205 = (id)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v205, "countByEnumeratingWithState:objects:count:", &v238, v253, 16);
          v208 = v18;
          if (v19)
          {
            v20 = v19;
            v21 = *(id *)v239;
            v196 = *(id *)v239;
            do
            {
              v22 = 0;
              v200 = v20;
              do
              {
                if (*(id *)v239 != v21)
                  objc_enumerationMutation(v205);
                v23 = *(void **)(*((_QWORD *)&v238 + 1) + 8 * v22);
                objc_msgSend(v23, "parentLayers");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v24, "count");

                if (!v25)
                {
                  v26 = v15;
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invisibleInput%lu [style = invis]"), v15);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "addObject:", v27);

                  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "label");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "appendString:", v29);

                  objc_msgSend(v28, "appendString:", CFSTR(" ["));
                  objc_msgSend(v23, "descriptor");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "shape");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v32 = objc_msgSend(v31, "count");

                  if (v32)
                  {
                    v33 = 0;
                    v34 = 1;
                    do
                    {
                      objc_msgSend(v23, "descriptor");
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v35, "shape");
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v36, "objectAtIndexedSubscript:", v33);
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v28, "appendFormat:", CFSTR("%lu"), objc_msgSend(v37, "unsignedLongValue"));

                      objc_msgSend(v23, "descriptor");
                      v38 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v38, "shape");
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      v40 = objc_msgSend(v39, "count");

                      if (v40 > v34)
                        objc_msgSend(v28, "appendString:", CFSTR(", "));
                      v33 = v34;
                      objc_msgSend(v23, "descriptor");
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v41, "shape");
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      v43 = objc_msgSend(v42, "count");

                      ++v34;
                    }
                    while (v43 > v33);
                  }
                  objc_msgSend(v28, "appendString:", CFSTR("]"));
                  v44 = v26;
                  v18 = v208;
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invisibleInput%lu -> %lu [label=<<FONT POINT-SIZE=\"10\">%@</FONT>>]"), v44, objc_msgSend(v208, "layerID"), v28);
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "addObject:", v45);

                  v15 = v44 + 1;
                  v21 = v196;
                  v20 = v200;
                }
                ++v22;
              }
              while (v22 != v20);
              v20 = objc_msgSend(v205, "countByEnumeratingWithState:objects:count:", &v238, v253, 16);
            }
            while (v20);
          }

          if (objc_msgSend(v18, "isLastLayer"))
          {
            v236 = 0u;
            v237 = 0u;
            v234 = 0u;
            v235 = 0u;
            objc_msgSend(v18, "resultTensors");
            v197 = (id)objc_claimAutoreleasedReturnValue();
            v206 = (id)objc_msgSend(v197, "countByEnumeratingWithState:objects:count:", &v234, v252, 16);
            if (v206)
            {
              v201 = *(_QWORD *)v235;
              do
              {
                for (i = 0; i != v206; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v235 != v201)
                    objc_enumerationMutation(v197);
                  v47 = *(void **)(*((_QWORD *)&v234 + 1) + 8 * (_QWORD)i);
                  v48 = v15;
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invisibleOutput%lu [style = invis]"), v15, v183);
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "addObject:", v49);

                  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "label");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v50, "appendString:", v51);

                  objc_msgSend(v50, "appendString:", CFSTR(" ["));
                  objc_msgSend(v47, "descriptor");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "shape");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  v54 = objc_msgSend(v53, "count");

                  if (v54)
                  {
                    v55 = 0;
                    v56 = 1;
                    do
                    {
                      objc_msgSend(v47, "descriptor");
                      v57 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v57, "shape");
                      v58 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v58, "objectAtIndexedSubscript:", v55);
                      v59 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v50, "appendFormat:", CFSTR("%lu"), objc_msgSend(v59, "unsignedLongValue"));

                      objc_msgSend(v47, "descriptor");
                      v60 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v60, "shape");
                      v61 = (void *)objc_claimAutoreleasedReturnValue();
                      v62 = objc_msgSend(v61, "count");

                      if (v62 > v56)
                        objc_msgSend(v50, "appendString:", CFSTR(", "));
                      v55 = v56;
                      objc_msgSend(v47, "descriptor");
                      v63 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v63, "shape");
                      v64 = (void *)objc_claimAutoreleasedReturnValue();
                      v65 = objc_msgSend(v64, "count");

                      ++v56;
                    }
                    while (v65 > v55);
                  }
                  objc_msgSend(v50, "appendString:", CFSTR("]"));
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu -> invisibleOutput%lu [label=<<FONT POINT-SIZE=\"10\">%@</FONT>>]"), objc_msgSend(v208, "layerID"), v48, v50);
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "addObject:", v66);

                  v15 = v48 + 1;
                }
                v206 = (id)objc_msgSend(v197, "countByEnumeratingWithState:objects:count:", &v234, v252, 16);
              }
              while (v206);
            }

            v18 = v208;
          }
          v190 = v15;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v67 = v18;
            objc_msgSend(v67, "lossLabels");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            if (v68)
            {
              v69 = v68;
              objc_msgSend(v68, "parentLayers");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              v71 = objc_msgSend(v70, "count");

              if (!v71)
              {
LABEL_51:
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invisibleLabel%lu [style = invis]"), v190);
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "addObject:", v76);

                objc_msgSend(MEMORY[0x1E0CB37A0], "string");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v69, "label");
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v73, "appendString:", v77);

                objc_msgSend(v73, "appendString:", CFSTR(" ["));
                objc_msgSend(v69, "descriptor");
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v78, "shape");
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                v80 = objc_msgSend(v79, "count");

                if (v80)
                {
                  v81 = 0;
                  v82 = 1;
                  do
                  {
                    objc_msgSend(v69, "descriptor");
                    v83 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v83, "shape");
                    v84 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v84, "objectAtIndexedSubscript:", v81);
                    v85 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v73, "appendFormat:", CFSTR("%lu"), objc_msgSend(v85, "unsignedLongValue"));

                    objc_msgSend(v69, "descriptor");
                    v86 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v86, "shape");
                    v87 = (void *)objc_claimAutoreleasedReturnValue();
                    v88 = objc_msgSend(v87, "count");

                    if (v88 > v82)
                      objc_msgSend(v73, "appendString:", CFSTR(", "));
                    v81 = v82;
                    objc_msgSend(v69, "descriptor");
                    v89 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v89, "shape");
                    v90 = (void *)objc_claimAutoreleasedReturnValue();
                    v91 = objc_msgSend(v90, "count");

                    ++v82;
                  }
                  while (v91 > v81);
                }
                objc_msgSend(v73, "appendString:", CFSTR("]"));
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invisibleLabel%lu -> %lu [label=<<FONT POINT-SIZE=\"10\">%@</FONT>>]"), v190, objc_msgSend(v67, "layerID"), v73);
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "addObject:", v92);

                ++v190;
                v18 = v208;
                goto LABEL_58;
              }
            }
            else
            {
              -[MLCGraph allLossLabels](v192, "allLossLabels");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "allKeys");
              v73 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v73, "count"))
              {
                objc_msgSend(v73, "objectAtIndexedSubscript:", 0);
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                -[MLCGraph allLossLabels](v192, "allLossLabels");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "objectForKeyedSubscript:", v74);
                v69 = (void *)objc_claimAutoreleasedReturnValue();

                v14 = v204;
                goto LABEL_51;
              }
              v69 = 0;
              v14 = v204;
LABEL_58:

            }
          }
          v93 = (void *)MEMORY[0x1E0CB3940];
          v94 = objc_msgSend(v18, "layerID");
          objc_msgSend(v18, "summarizedDOTDescription");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "stringWithFormat:", CFSTR("%lu [fillcolor=\"lightblue\" label=%@]"), v94, v95);
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v96);

          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v207 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "fusedLayers");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          v100 = objc_msgSend(v99, "count");

          if (v100)
          {
            objc_msgSend(v18, "fusedLayers");
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "addObjectsFromArray:", v101);

            v102 = v18;
            v230 = 0u;
            v231 = 0u;
            v232 = 0u;
            v233 = 0u;
            v198 = v102;
            objc_msgSend(v102, "fusedLayers");
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            v104 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v230, v251, 16);
            if (v104)
            {
              v105 = v104;
              v106 = *(_QWORD *)v231;
              do
              {
                for (j = 0; j != v105; ++j)
                {
                  if (*(_QWORD *)v231 != v106)
                    objc_enumerationMutation(v103);
                  v108 = *(void **)(*((_QWORD *)&v230 + 1) + 8 * j);
                  objc_msgSend(v108, "sourceTensors");
                  v109 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v109, "count") != 1)
                    -[MLCGraph summarizedDOTDescription].cold.2();

                  objc_msgSend(v108, "sourceTensors");
                  v110 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v110, "objectAtIndexedSubscript:", 0);
                  v111 = (void *)objc_claimAutoreleasedReturnValue();

                  if (-[NSObject containsObject:](v195, "containsObject:", v111))
                  {
                    objc_msgSend(v111, "childLayers");
                    v112 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v207, "addObjectsFromArray:", v112);

                  }
                  v229 = 0;
                  v113 = objc_msgSend(v198, "layerID");
                  v183 = objc_msgSend(v108, "layerID");
                  hashCombine_9(&v229, v114, v115, v116, v117, v118, v119, v120, v113);
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v229);
                  v121 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v97, "setObject:forKey:", v111, v121);

                }
                v105 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v230, v251, 16);
              }
              while (v105);
            }

          }
          else
          {
            v227 = 0u;
            v228 = 0u;
            v225 = 0u;
            v226 = 0u;
            objc_msgSend(v18, "resultTensors");
            v198 = (id)objc_claimAutoreleasedReturnValue();
            v193 = (id)objc_msgSend(v198, "countByEnumeratingWithState:objects:count:", &v225, v250, 16);
            if (v193)
            {
              v191 = *(_QWORD *)v226;
              v122 = v195;
              do
              {
                v123 = 0;
                do
                {
                  if (*(_QWORD *)v226 != v191)
                    objc_enumerationMutation(v198);
                  v202 = v123;
                  v124 = *(void **)(*((_QWORD *)&v225 + 1) + 8 * v123);
                  if (-[NSObject containsObject:](v122, "containsObject:", v124))
                  {
                    objc_msgSend(v124, "childLayers");
                    v125 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v207, "addObjectsFromArray:", v125);

                  }
                  v126 = (void *)MEMORY[0x1E0C99E60];
                  -[MLCGraph layers](v192, "layers");
                  v127 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v126, "setWithArray:", v127);
                  v128 = (void *)objc_claimAutoreleasedReturnValue();

                  v223 = 0u;
                  v224 = 0u;
                  v221 = 0u;
                  v222 = 0u;
                  objc_msgSend(v124, "childLayers");
                  v129 = (void *)objc_claimAutoreleasedReturnValue();
                  v130 = objc_msgSend(v129, "countByEnumeratingWithState:objects:count:", &v221, v249, 16);
                  if (v130)
                  {
                    v131 = v130;
                    v132 = *(_QWORD *)v222;
                    do
                    {
                      for (k = 0; k != v131; ++k)
                      {
                        if (*(_QWORD *)v222 != v132)
                          objc_enumerationMutation(v129);
                        v134 = *(_QWORD *)(*((_QWORD *)&v221 + 1) + 8 * k);
                        if (objc_msgSend(v128, "containsObject:", v134))
                          objc_msgSend(v98, "addObject:", v134);
                      }
                      v131 = objc_msgSend(v129, "countByEnumeratingWithState:objects:count:", &v221, v249, 16);
                    }
                    while (v131);
                  }

                  v219 = 0u;
                  v220 = 0u;
                  v217 = 0u;
                  v218 = 0u;
                  objc_msgSend(v124, "childLayers");
                  v135 = (void *)objc_claimAutoreleasedReturnValue();
                  v136 = objc_msgSend(v135, "countByEnumeratingWithState:objects:count:", &v217, v248, 16);
                  if (v136)
                  {
                    v137 = v136;
                    v138 = *(_QWORD *)v218;
                    do
                    {
                      for (m = 0; m != v137; ++m)
                      {
                        if (*(_QWORD *)v218 != v138)
                          objc_enumerationMutation(v135);
                        v140 = *(void **)(*((_QWORD *)&v217 + 1) + 8 * m);
                        v229 = 0;
                        v141 = objc_msgSend(v208, "layerID");
                        v183 = objc_msgSend(v140, "layerID");
                        hashCombine_9(&v229, v142, v143, v144, v145, v146, v147, v148, v141);
                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v229);
                        v149 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v97, "setObject:forKey:", v124, v149);

                      }
                      v137 = objc_msgSend(v135, "countByEnumeratingWithState:objects:count:", &v217, v248, 16);
                    }
                    while (v137);
                  }

                  v14 = v204;
                  v123 = v202 + 1;
                  v122 = v195;
                }
                while ((id)(v202 + 1) != v193);
                v193 = (id)objc_msgSend(v198, "countByEnumeratingWithState:objects:count:", &v225, v250, 16);
              }
              while (v193);
            }
          }

          v215 = 0u;
          v216 = 0u;
          v213 = 0u;
          v214 = 0u;
          v194 = v98;
          v203 = objc_msgSend(v194, "countByEnumeratingWithState:objects:count:", &v213, v247, 16);
          if (v203)
          {
            v199 = *(id *)v214;
            do
            {
              for (n = 0; n != v203; ++n)
              {
                if (*(id *)v214 != v199)
                  objc_enumerationMutation(v194);
                v151 = *(void **)(*((_QWORD *)&v213 + 1) + 8 * n);
                v152 = objc_msgSend(v207, "containsObject:", v151);
                v153 = CFSTR("solid");
                if (v152)
                  v153 = CFSTR("dashed");
                v154 = v153;
                v155 = (void *)MEMORY[0x1E0CB3940];
                v156 = objc_msgSend(v151, "layerID");
                objc_msgSend(v151, "summarizedDOTDescription");
                v157 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v155, "stringWithFormat:", CFSTR("%lu [fillcolor=\"lightblue\" label=%@]"), v156, v157);
                v158 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "addObject:", v158);

                v229 = 0;
                LOBYTE(v158) = objc_msgSend(v208, "layerID");
                v184 = objc_msgSend(v151, "layerID");
                hashCombine_9(&v229, v159, v160, v161, v162, v163, v164, v165, (char)v158);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v229);
                v166 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v97, "objectForKey:", v166);
                v167 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v167, "descriptor");
                v168 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v168, "shape");
                v169 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x1E0CB37A0], "string");
                v170 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v167, "label");
                v171 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v170, "appendString:", v171);

                objc_msgSend(v170, "appendString:", CFSTR("\n"));
                objc_msgSend(v170, "appendString:", CFSTR(" ["));
                if (objc_msgSend(v169, "count"))
                {
                  v172 = 0;
                  v173 = 1;
                  do
                  {
                    objc_msgSend(v169, "objectAtIndexedSubscript:", v172);
                    v174 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v170, "appendFormat:", CFSTR("%lu"), objc_msgSend(v174, "unsignedLongValue"), v184);

                    if (objc_msgSend(v169, "count") > (unint64_t)v173)
                      objc_msgSend(v170, "appendString:", CFSTR(", "));
                    v172 = v173++;
                  }
                  while (objc_msgSend(v169, "count") > v172);
                }
                objc_msgSend(v170, "appendString:", CFSTR("]"));
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu -> %lu [style=\"%@\" label=<<FONT POINT-SIZE=\"10\">%@</FONT>>]"), objc_msgSend(v208, "layerID"), objc_msgSend(v151, "layerID"), v154, v170);
                v175 = (void *)objc_claimAutoreleasedReturnValue();
                v14 = v204;
                objc_msgSend(v204, "addObject:", v175);

              }
              v203 = objc_msgSend(v194, "countByEnumeratingWithState:objects:count:", &v213, v247, 16);
            }
            while (v203);
          }

          v15 = v190;
          v16 = v189 + 1;
        }
        while (v189 + 1 != v187);
        v187 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v242, v254, 16);
      }
      while (v187);
    }

    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("digraph MLCGraph {\n node [style=filled];\n"));
    v176 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v10 = v176;
    if (v185)
      -[__CFString appendFormat:](v176, "appendFormat:", CFSTR("subgraph G {\nnode [style=filled, fillcolor=\"#40e0d0\" shape=tripleoctagon];%@\n}\n"),
        v185);
    v211 = 0u;
    v212 = 0u;
    v209 = 0u;
    v210 = 0u;
    v177 = v14;
    v178 = objc_msgSend(v177, "countByEnumeratingWithState:objects:count:", &v209, v246, 16);
    if (v178)
    {
      v179 = v178;
      v180 = *(_QWORD *)v210;
      do
      {
        for (ii = 0; ii != v179; ++ii)
        {
          if (*(_QWORD *)v210 != v180)
            objc_enumerationMutation(v177);
          -[__CFString appendFormat:](v10, "appendFormat:", CFSTR("\t%@;\n"),
            *(_QWORD *)(*((_QWORD *)&v209 + 1) + 8 * ii),
            v183);
        }
        v179 = objc_msgSend(v177, "countByEnumeratingWithState:objects:count:", &v209, v246, 16);
      }
      while (v179);
    }

    -[__CFString appendFormat:](v10, "appendFormat:", CFSTR("}"));
    v9 = v195;
  }

  return (NSString *)v10;
}

- (void)updateLSTMLayersForVariableSequenceLengthInGraph:(id)a3 withInputData:(id)a4
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  unint64_t v32;
  id v33;
  unint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v33 = a4;
  -[MLCGraph lstmLayerIndexList](self, "lstmLayerIndexList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    while (1)
    {
      -[MLCGraph lstmLayerIndexList](self, "lstmLayerIndexList");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "unsignedIntegerValue");

      -[MLCGraph graphLayerList](self, "graphLayerList");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "sourceTensors");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "count") == 2)
        break;
      objc_msgSend(v12, "sourceTensors");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v15 == 4)
        goto LABEL_6;
LABEL_19:

      ++v7;
      -[MLCGraph lstmLayerIndexList](self, "lstmLayerIndexList");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "count");

      if (v7 >= v32)
        goto LABEL_20;
    }

LABEL_6:
    v34 = v7;
    objc_msgSend(v12, "sourceTensors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");
    objc_msgSend(v12, "sourceTensors");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17 == 2)
      v20 = 1;
    else
      v20 = 3;
    objc_msgSend(v18, "objectAtIndexedSubscript:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v22 = v33;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v36 != v25)
            objc_enumerationMutation(v22);
          v27 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v21, "label");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "isEqualToString:", v27);

          if (v29)
          {
            objc_msgSend(v22, "objectForKeyedSubscript:", v27);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[MLCGraph createVariableLengthSequenceTensorsForLayer:withVariableSequenceLength:](self, "createVariableLengthSequenceTensorsForLayer:withVariableSequenceLength:", v12, v30);

          }
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v24);
    }

    v7 = v34;
    goto LABEL_19;
  }
LABEL_20:

}

- (void)allocateDeviceMemoryForTensor:(id)a3 device:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v31 = a3;
  v6 = a4;
  objc_msgSend(v6, "computeEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "needToAllocateDeviceMemoryForTensor:", v31);

  if (v8)
  {
    if ((objc_msgSend(v31, "computeFlags") & 1) != 0)
      goto LABEL_14;
    objc_msgSend(v31, "childLayers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (!v10)
      goto LABEL_14;
    objc_msgSend(v6, "computeEngine");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "deviceMemorySizeForTensor:", v31);

    -[MLCGraph freeResourceList](self, "freeResourceList");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    -[MLCGraph freeResourceList](self, "freeResourceList");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16)
    {
      v17 = 0;
      v18 = -1;
      while (1)
      {
        objc_msgSend(v6, "computeEngine");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCGraph freeResourceList](self, "freeResourceList");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectAtIndexedSubscript:", v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v19, "deviceMemorySizeForTensor:", v21);

        if (v22 == v12)
          break;
        if (v22 > v12 && v18 > v22)
        {
          v14 = v17;
          v18 = v22;
        }
        ++v17;
        -[MLCGraph freeResourceList](self, "freeResourceList");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "count");

        if (v17 >= v24)
          goto LABEL_12;
      }
      v14 = v17;
    }
LABEL_12:
    -[MLCGraph freeResourceList](self, "freeResourceList");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");

    if (v14 >= v26)
    {
LABEL_14:
      objc_msgSend(v6, "computeEngine");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "allocateDeviceMemoryForTensor:", v31);
    }
    else
    {
      -[MLCGraph freeResourceList](self, "freeResourceList");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectAtIndexedSubscript:", v14);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "computeEngine");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "shareDeviceMemoryWithResultTensor:sourceTensor:", v31, v28);

      -[MLCGraph freeResourceList](self, "freeResourceList");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "removeObjectAtIndex:", v14);

    }
  }

}

- (void)freeDeviceMemoryForTensorIfSafe:(id)a3 device:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;

  v5 = a3;
  objc_msgSend(v5, "parentLayers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "count"))
  {

    goto LABEL_8;
  }
  v7 = objc_msgSend(v5, "computeFlags");

  if ((v7 & 1) != 0)
  {
LABEL_8:
    v9 = v5;
    goto LABEL_9;
  }
  objc_msgSend(v5, "sharedMemoryTensor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = v5;
LABEL_11:
    if (objc_msgSend(v9, "readCount"))
    {
      objc_msgSend(v9, "setReadCount:", objc_msgSend(v9, "readCount") - 1);
      if (!objc_msgSend(v9, "readCount"))
      {
        -[MLCGraph freeResourceList](self, "freeResourceList");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v9);

      }
    }
    else
    {
      -[MLCGraph freeResourceList](self, "freeResourceList");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (v14)
      {
        v15 = 0;
        while (1)
        {
          -[MLCGraph freeResourceList](self, "freeResourceList");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectAtIndexedSubscript:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9 == v17)
            break;
          ++v15;
          -[MLCGraph freeResourceList](self, "freeResourceList");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "count");

          if (v15 >= v19)
            goto LABEL_19;
        }
      }
      else
      {
LABEL_19:
        objc_msgSend(v9, "childLayers");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "count");

        if (v21)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("tensor=%@ not found in free list"), v9);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLCLog framework](MLCLog, "framework");
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            -[MLCTrainingGraph executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:].cold.3();

        }
      }
    }
    goto LABEL_9;
  }
  objc_msgSend(v5, "sharedMemoryTensor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "parentLayers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "count"))
  {

    goto LABEL_9;
  }
  v11 = objc_msgSend(v9, "computeFlags");

  if ((v11 & 1) == 0)
    goto LABEL_11;
LABEL_9:

}

- (void)updateDeviceMemoryReadCountForTensor:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "sharedMemoryTensor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v7, "sharedMemoryTensor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "childLayers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setReadCount:", objc_msgSend(v4, "readCount") + objc_msgSend(v5, "count"));

    objc_msgSend(v7, "setReadCount:", 0);
  }
  else
  {
    objc_msgSend(v7, "childLayers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setReadCount:", objc_msgSend(v6, "count"));

    v7 = v6;
  }

}

- (void)updateDeviceMemoryReadCountForGradientWithLayer:(id)a3 tensor:(id)a4 checkIfSourceNeeded:(BOOL)a5 checkIfResultNeeded:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;

  v6 = a6;
  v7 = a5;
  v22 = a3;
  v9 = a4;
  if (v6)
  {
    objc_msgSend(v22, "deviceOps");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "resultOfForwardNeededForGradient");

    if (v12)
    {
      objc_msgSend(v9, "sharedMemoryTensor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v9, "sharedMemoryTensor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setReadCount:", objc_msgSend(v14, "readCount") + 1);

        v15 = 0;
      }
      else
      {
        v15 = objc_msgSend(v9, "readCount") + 1;
      }
      objc_msgSend(v9, "setReadCount:", v15);
    }
  }
  if (v7)
  {
    objc_msgSend(v22, "deviceOps");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "sourceOfForwardNeededForGradient");

    if (v18)
    {
      objc_msgSend(v9, "sharedMemoryTensor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(v9, "sharedMemoryTensor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setReadCount:", objc_msgSend(v20, "readCount") + 1);

        v21 = 0;
      }
      else
      {
        v21 = objc_msgSend(v9, "readCount") + 1;
      }
      objc_msgSend(v9, "setReadCount:", v21);
    }
  }

}

- (MLCDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (BOOL)readyForExecution
{
  return self->_readyForExecution;
}

- (void)setReadyForExecution:(BOOL)a3
{
  self->_readyForExecution = a3;
}

- (NSArray)graphObjects
{
  return self->_graphObjects;
}

- (unint64_t)nextLayerID
{
  return self->_nextLayerID;
}

- (void)setNextLayerID:(unint64_t)a3
{
  self->_nextLayerID = a3;
}

- (NSMutableArray)graphLayerList
{
  return self->_graphLayerList;
}

- (void)setGraphLayerList:(id)a3
{
  objc_storeStrong((id *)&self->_graphLayerList, a3);
}

- (NSMutableArray)rootLevelTensorNodes
{
  return self->_rootLevelTensorNodes;
}

- (void)setRootLevelTensorNodes:(id)a3
{
  objc_storeStrong((id *)&self->_rootLevelTensorNodes, a3);
}

- (NSMutableDictionary)layerParentMap
{
  return self->_layerParentMap;
}

- (void)setLayerParentMap:(id)a3
{
  objc_storeStrong((id *)&self->_layerParentMap, a3);
}

- (NSMutableDictionary)layerChildMap
{
  return self->_layerChildMap;
}

- (void)setLayerChildMap:(id)a3
{
  objc_storeStrong((id *)&self->_layerChildMap, a3);
}

- (NSDictionary)allInputs
{
  return self->_allInputs;
}

- (void)setAllInputs:(id)a3
{
  objc_storeStrong((id *)&self->_allInputs, a3);
}

- (NSDictionary)allLossLabels
{
  return self->_allLossLabels;
}

- (void)setAllLossLabels:(id)a3
{
  objc_storeStrong((id *)&self->_allLossLabels, a3);
}

- (NSDictionary)allLossLabelWeights
{
  return self->_allLossLabelWeights;
}

- (void)setAllLossLabelWeights:(id)a3
{
  objc_storeStrong((id *)&self->_allLossLabelWeights, a3);
}

- (NSDictionary)allOutputs
{
  return self->_allOutputs;
}

- (void)setAllOutputs:(id)a3
{
  objc_storeStrong((id *)&self->_allOutputs, a3);
}

- (NSMutableArray)lstmLayerIndexList
{
  return self->_lstmLayerIndexList;
}

- (void)setLstmLayerIndexList:(id)a3
{
  objc_storeStrong((id *)&self->_lstmLayerIndexList, a3);
}

- (BOOL)recompileAfterLinking
{
  return self->_recompileAfterLinking;
}

- (void)setRecompileAfterLinking:(BOOL)a3
{
  self->_recompileAfterLinking = a3;
}

- (unint64_t)compilerOptions
{
  return self->_compilerOptions;
}

- (void)setCompilerOptions:(unint64_t)a3
{
  self->_compilerOptions = a3;
}

- (BOOL)staticBatchSizeInGraph
{
  return self->_staticBatchSizeInGraph;
}

- (void)setStaticBatchSizeInGraph:(BOOL)a3
{
  self->_staticBatchSizeInGraph = a3;
}

- (BOOL)allocateDeviceMemoryForTensorsInGraph
{
  return self->_allocateDeviceMemoryForTensorsInGraph;
}

- (void)setAllocateDeviceMemoryForTensorsInGraph:(BOOL)a3
{
  self->_allocateDeviceMemoryForTensorsInGraph = a3;
}

- (NSMutableArray)freeResourceList
{
  return self->_freeResourceList;
}

- (void)setFreeResourceList:(id)a3
{
  objc_storeStrong((id *)&self->_freeResourceList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_freeResourceList, 0);
  objc_storeStrong((id *)&self->_lstmLayerIndexList, 0);
  objc_storeStrong((id *)&self->_allOutputs, 0);
  objc_storeStrong((id *)&self->_allLossLabelWeights, 0);
  objc_storeStrong((id *)&self->_allLossLabels, 0);
  objc_storeStrong((id *)&self->_allInputs, 0);
  objc_storeStrong((id *)&self->_layerChildMap, 0);
  objc_storeStrong((id *)&self->_layerParentMap, 0);
  objc_storeStrong((id *)&self->_rootLevelTensorNodes, 0);
  objc_storeStrong((id *)&self->_graphLayerList, 0);
  objc_storeStrong((id *)&self->_graphObjects, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)createGradientSourceTensorWith:(const char *)a1 source:.cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: source tensor is nil", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)checksBeforeAddLayerInGraph:sources:forTraining:.cold.1()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: layer (%@) has empty sources", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)checksBeforeAddLayerInGraph:(const char *)a1 sources:forTraining:.cold.2(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: YOLO loss layer can only be pass as loss layer when creating training graph", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)checksBeforeAddLayerInGraph:sources:forTraining:.cold.3()
{
  NSObject *v0;
  void *v1;
  SEL v2;
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_9_0();
  v10 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412802;
  v5 = v3;
  v6 = 2112;
  v7 = v1;
  v8 = 2048;
  v9 = objc_msgSend(v1, "layerID");
  _os_log_error_impl(&dword_1D4999000, v0, OS_LOG_TYPE_ERROR, "%@: layer (%@) already has a layerID (%lu)", (uint8_t *)&v4, 0x20u);

}

- (void)checksBeforeAddLayerInGraph:sources:forTraining:.cold.4()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: layer (%@) being added twice to the graph", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)concatenateWithSources:(const char *)a1 dimension:.cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: Number of sources must be > 0", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)concatenateWithSources:(const char *)a1 dimension:.cold.2(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: dimension must be a value between 1 and 4", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)selectWithSources:(const char *)a1 condition:.cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: Number of sources must be 2", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)nodeWithLayer:sources:lossLabels:.cold.1()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: layer (%@) is not a loss layer", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)nodeWithLayer:sources:forTraining:.cold.1()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: (%@) nil resultTensor", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)resultTensorsForLayer:graphLayerList:.cold.1()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: Layer (%@) has been fused", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)addGraphNodes:(_QWORD *)a3 withControlTreeNode:(NSObject *)a4 .cold.1(uint8_t *a1, SEL aSelector, _QWORD *a3, NSObject *a4)
{
  void *v7;

  NSStringFromSelector(aSelector);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1D4999000, a4, OS_LOG_TYPE_ERROR, "%@: Nested conditions are not yet supported ", a1, 0xCu);

}

- (void)conditionalWithPredicate:(const char *)a1 trueBranch:falseBranch:.cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: Conditional layer doesn't support multiple outputs for now. ", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)conditionalWithPredicate:(const char *)a1 trueBranch:falseBranch:.cold.2(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: Conditional layer must be added before call to -graphWithGraphObjects:lossLayer:optimizer or -graphWithGraphObjects:", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)summarizedDOTDescription
{
  __assert_rtn("-[MLCGraph summarizedDOTDescription]", "MLCGraph.m", 1347, "childLayer.sourceTensors.count == 1");
}

@end
