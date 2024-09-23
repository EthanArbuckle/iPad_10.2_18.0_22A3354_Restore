@implementation BWInferenceSchedulerFramebufferBuilder

- (id)newFramebuffer
{
  if (!self->_graph || !self->_prototypeJobList)
    return 0;
  if (self->_didVendFramebuffer)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ already returned a framebuffer. Multi-buffering is not yet supported"), self), 0));
  self->_didVendFramebuffer = 1;
  return -[BWInferenceSchedulerFramebuffer initWithGraph:jobList:]([BWInferenceSchedulerFramebuffer alloc], "initWithGraph:jobList:", self->_graph, self->_prototypeJobList);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceSchedulerFramebufferBuilder;
  -[BWInferenceSchedulerFramebufferBuilder dealloc](&v3, sel_dealloc);
}

- (void)_populateJobList:(void *)a3 fromGraphEdges:(uint64_t)a4 withHeadNode:(void *)a5 jobTypes:
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  float v23;
  uint64_t j;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  float v31;
  unint64_t v32;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t n;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  int v50;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  id obj;
  id obja;
  uint64_t v58;
  void *v59;
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
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v47 = a2;
  v90 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v5 = a3;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 258, 0, objc_msgSend(a3, "count"));
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 258, 0, objc_msgSend(v5, "count"));
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v55 = v5;
    obj = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
    if (obj)
    {
      v53 = *(_QWORD *)v81;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v81 != v53)
            objc_enumerationMutation(v5);
          v58 = v8;
          v9 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * v8);
          v76 = 0u;
          v77 = 0u;
          v78 = 0u;
          v79 = 0u;
          v10 = (void *)objc_msgSend(v5, "objectForKey:", v9, v47);
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v77;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v77 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * i);
                v16 = *(_QWORD *)(v15 + 16);
                v17 = (void *)objc_msgSend(v6, "objectForKey:", v16);
                if (!v17)
                {
                  v17 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
                  objc_msgSend(v6, "setObject:forKey:", v17, v16);
                }
                objc_msgSend(v17, "addObject:", v9);
                v18 = (void *)objc_msgSend(v7, "objectForKey:", v16);
                if (!v18)
                {
                  v18 = (void *)objc_msgSend(MEMORY[0x1E0CB3868], "pointerArrayWithOptions:", 258);
                  objc_msgSend(v7, "setObject:forKey:", v18, v16);
                }
                objc_msgSend(v18, "addPointer:", v15 + 24);
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
            }
            while (v12);
          }
          v8 = v58 + 1;
          v5 = v55;
        }
        while ((id)(v58 + 1) != obj);
        obj = (id)objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
      }
      while (obj);
    }
    v59 = (void *)objc_msgSend(MEMORY[0x1E0CB3550], "set", v47);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v5, "count"));
    objc_msgSend(v19, "addObject:", a4);
    if (objc_msgSend(v19, "count"))
    {
      v20 = 0;
      obja = v19;
      do
      {
        v50 = v20;
        if ((unint64_t)objc_msgSend(v19, "count") < 2)
        {
          v22 = (void *)objc_msgSend(v19, "anyObject");
        }
        else
        {
          v21 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v72 = 0u;
          v73 = 0u;
          v74 = 0u;
          v75 = 0u;
          v54 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
          v22 = 0;
          if (v54)
          {
            v52 = *(_QWORD *)v73;
            v23 = 0.0;
            do
            {
              for (j = 0; j != v54; ++j)
              {
                if (*(_QWORD *)v73 != v52)
                  objc_enumerationMutation(obja);
                v25 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * j);
                v26 = (void *)objc_msgSend(v5, "objectForKey:", v25);
                v68 = 0u;
                v69 = 0u;
                v70 = 0u;
                v71 = 0u;
                v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
                if (v27)
                {
                  v28 = v27;
                  v29 = *(_QWORD *)v69;
                  do
                  {
                    for (k = 0; k != v28; ++k)
                    {
                      if (*(_QWORD *)v69 != v29)
                        objc_enumerationMutation(v26);
                      objc_msgSend(v21, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v6, "objectForKey:", *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * k) + 16)), "allObjects"));
                    }
                    v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
                  }
                  while (v28);
                }
                v31 = (float)(unint64_t)objc_msgSend(v21, "count");
                v32 = objc_msgSend(v26, "count");
                if ((float)(v31 / (float)v32) < v23 || v22 == 0)
                {
                  v22 = v25;
                  v23 = v31 / (float)v32;
                }
                objc_msgSend(v21, "removeAllObjects");
                v5 = v55;
              }
              v19 = obja;
              v54 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
            }
            while (v54);
          }
        }
        objc_msgSend(v19, "removeObject:", v22);
        v34 = objc_msgSend(v48, "jobAtIndex:", v50);
        *(_QWORD *)v34 = v22;
        *(_BYTE *)(v34 + 21) = objc_msgSend(v59, "countForObject:", v22);
        *(_BYTE *)(v34 + 20) = objc_msgSend(a5, "objectForKey:", v22);
        v64 = 0u;
        v65 = 0u;
        v66 = 0u;
        v67 = 0u;
        v35 = (void *)objc_msgSend(v7, "objectForKey:", v22);
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v64, v85, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v65;
          do
          {
            for (m = 0; m != v37; ++m)
            {
              if (*(_QWORD *)v65 != v38)
                objc_enumerationMutation(v35);
              **(_BYTE **)(*((_QWORD *)&v64 + 1) + 8 * m) = v50;
            }
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v64, v85, 16);
          }
          while (v37);
        }
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v40 = (void *)objc_msgSend(v5, "objectForKey:", v22);
        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v60, v84, 16);
        if (v41)
        {
          v42 = v41;
          v43 = *(_QWORD *)v61;
          do
          {
            for (n = 0; n != v42; ++n)
            {
              if (*(_QWORD *)v61 != v43)
                objc_enumerationMutation(v40);
              v45 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * n) + 16);
              objc_msgSend(v59, "addObject:", v45);
              v46 = (void *)objc_msgSend(v6, "objectForKey:", v45);
              objc_msgSend(v46, "removeObject:", v22);
              if (!objc_msgSend(v46, "count"))
                objc_msgSend(obja, "addObject:", v45);
            }
            v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v60, v84, 16);
          }
          while (v42);
        }
        v20 = v50 + 1;
        v19 = obja;
      }
      while (objc_msgSend(obja, "count"));
    }

  }
}

- (id)_connectNodesExpectingInputs:(void *)a3 toNodesProvidingOutput:(void *)a4 dependencyProvider:(void *)a5 nodeForExternalRequirement:
{
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  _QWORD *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id *v31;
  id v33;
  uint64_t v34;
  uint64_t v35;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
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
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v31 = result;
  if (result)
  {
    v6 = a2;
    v33 = (id)objc_msgSend(a2, "copy");
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v34 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    if (v34)
    {
      v28 = *(_QWORD *)v47;
      v29 = v6;
      v30 = a3;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v47 != v28)
            objc_enumerationMutation(a3);
          v35 = v7;
          v8 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v7);
          v9 = objc_msgSend(a3, "objectForKey:", v8, v28);
          v10 = (void *)objc_msgSend((id)objc_msgSend(v6, "objectForKey:", v8), "allObjects");
          v11 = (void *)objc_msgSend(v31[4], "objectForKey:", v9);
          v12 = (void *)objc_msgSend(a4, "dependenciesForInputVideoRequirement:", v8);
          v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          v45 = 0u;
          obj = v12;
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v43;
            do
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v43 != v16)
                  objc_enumerationMutation(obj);
                v18 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
                v19 = (void *)objc_msgSend(v18, "dataRequirement");
                v20 = (void *)objc_msgSend(a5, "objectForKey:", objc_msgSend(v18, "inferenceRequirement"));
                if (objc_msgSend(v10, "containsObject:", v20))
                {
                  v21 = malloc_type_calloc(1uLL, 0x20uLL, 0x108004097C26A9CuLL);
                  *v21 = v8;
                  v21[1] = v19;
                  v21[2] = v20;
                  objc_msgSend(v11, "addPointer:", v21);
                  objc_msgSend(v13, "addObject:", v20);
                }
              }
              v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
            }
            while (v15);
          }
          v40 = 0u;
          v41 = 0u;
          v38 = 0u;
          v39 = 0u;
          v22 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v39;
            do
            {
              for (j = 0; j != v23; ++j)
              {
                if (*(_QWORD *)v39 != v24)
                  objc_enumerationMutation(v10);
                v26 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
                if ((objc_msgSend(v13, "containsObject:", v26) & 1) == 0)
                {
                  v27 = malloc_type_calloc(1uLL, 0x20uLL, 0x108004097C26A9CuLL);
                  *v27 = v8;
                  v27[1] = v8;
                  v27[2] = v26;
                  objc_msgSend(v11, "addPointer:", v27);
                }
              }
              v23 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
            }
            while (v23);
          }

          objc_msgSend(v33, "removeObjectForKey:", v8);
          v7 = v35 + 1;
          v6 = v29;
          a3 = v30;
        }
        while (v35 + 1 != v34);
        v34 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      }
      while (v34);
    }
    return (id *)v33;
  }
  return result;
}

- (uint64_t)_addScalingNodesForNodesExpectingInputs:(void *)a3 nodesProvidingOutput:(void *)a4 dependencyProvider:(void *)a5 nodesForExternalRequirements:(void *)a6 fencedMediaKeys:(uint64_t)a7 iterations:
{
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unint64_t v20;
  id v21;
  uint64_t j;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  int v34;
  int v35;
  BOOL v36;
  int v37;
  int v38;
  uint64_t v39;
  BWInferenceScalingRequirement *v40;
  BWInferenceScalingRequirement *v41;
  id v42;
  uint64_t k;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t m;
  uint64_t v50;
  id v51;
  id *v52;
  uint64_t v54;
  void *v55;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  id v63;
  int obja;
  id obj;
  void *v67;
  uint64_t v68;
  uint64_t v70;
  uint64_t v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
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
  _BYTE v92[128];
  _BYTE v93[128];
  void *v94;
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v9 = a2;
  if (!objc_msgSend(a2, "count"))
    return (uint64_t)v9;
  if (!a7)
    return 0;
  v54 = a7;
  v55 = a5;
  v10 = (void *)objc_msgSend(v9, "copy");
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v89;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v89 != v14)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "attachedMediaKey");
        v18 = (void *)objc_msgSend(v11, "objectForKeyedSubscript:", v17);
        if (v18)
        {
          v19 = (void *)objc_msgSend(v18, "videoFormat");
          v20 = objc_msgSend((id)objc_msgSend(v16, "videoFormat"), "width");
          if (v20 <= objc_msgSend(v19, "width"))
            continue;
        }
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, v17);
      }
      v13 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
    }
    while (v13);
  }
  v21 = (id)objc_msgSend(a3, "copy");
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v60 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
  if (v60)
  {
    v58 = v11;
    v59 = *(_QWORD *)v85;
    v63 = v21;
    do
    {
      for (j = 0; j != v60; ++j)
      {
        if (*(_QWORD *)v85 != v59)
          objc_enumerationMutation(v11);
        v70 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * j);
        v23 = (void *)objc_msgSend(v11, "objectForKeyedSubscript:");
        v67 = (void *)objc_msgSend(v23, "videoFormat");
        v80 = 0u;
        v81 = 0u;
        v82 = 0u;
        v83 = 0u;
        v24 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
        if (v24)
        {
          v25 = v24;
          v61 = v23;
          v62 = j;
          v26 = 0;
          v27 = *(_QWORD *)v81;
          while (1)
          {
            v28 = 0;
            do
            {
              v29 = v26;
              if (*(_QWORD *)v81 != v27)
                objc_enumerationMutation(v21);
              v26 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v28);
              if (objc_msgSend((id)objc_msgSend(v26, "attachedMediaKey"), "isEqualToString:", v70)
                && (v30 = (void *)objc_msgSend(v26, "videoFormat"),
                    objc_msgSend(v21, "objectForKey:", v26),
                    -[BWInferenceSchedulerFramebufferBuilder _validToDeriveFormat:fromFormat:vendingProvider:]((_BOOL8)a1, v67, v30)))
              {
                if (!v29)
                  goto LABEL_36;
                v31 = (void *)objc_msgSend(v29, "videoFormat");
                v32 = objc_msgSend(v30, "width");
                if (v32 < objc_msgSend(v31, "width"))
                  goto LABEL_34;
                v33 = objc_msgSend(v30, "width");
                if (v33 != objc_msgSend(v31, "width"))
                  goto LABEL_33;
                v34 = objc_msgSend(v31, "includesInvalidContent");
                if (v34 == objc_msgSend(v67, "includesInvalidContent")
                  || (v35 = objc_msgSend(v30, "includesInvalidContent"),
                      v36 = v35 == objc_msgSend(v67, "includesInvalidContent"),
                      v21 = v63,
                      !v36))
                {
                  obja = objc_msgSend(v31, "includesInvalidContent");
                  if (obja == objc_msgSend(v67, "includesInvalidContent")
                    && (v37 = objc_msgSend(v31, "pixelFormat"), v37 != objc_msgSend(v67, "pixelFormat")))
                  {
                    v38 = objc_msgSend(v30, "pixelFormat");
                    if (v38 != objc_msgSend(v67, "pixelFormat"))
                      v26 = v29;
                  }
                  else
                  {
LABEL_33:
                    v26 = v29;
                  }
LABEL_34:
                  v21 = v63;
                }
              }
              else
              {
                v26 = v29;
              }
LABEL_36:
              ++v28;
            }
            while (v25 != v28);
            v39 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
            v25 = v39;
            if (!v39)
            {
              j = v62;
              if (v61 && v26)
              {
                if (objc_msgSend(v61, "isSatisfiedByRequirement:", v26))
                  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Creating scaling nodes to convert between two requirements that already satisfy one another: %@ and %@"), v61, v26), 0));
                v40 = [BWInferenceScalingRequirement alloc];
                v94 = v61;
                v41 = -[BWInferenceScalingRequirement initWithInputVideoRequirement:requestedOutputVideoRequirements:intermediatePixelBufferCompressionType:](v40, "initWithInputVideoRequirement:requestedOutputVideoRequirements:intermediatePixelBufferCompressionType:", v26, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v94, 1), objc_msgSend(a4, "supportedPixelBufferCompressionType"));
                v42 = -[BWInferenceSchedulerFramebufferBuilder _newScalingNodesForScalingRequirement:fencedMedia:]((uint64_t)a1, v41, objc_msgSend(a6, "containsObject:", objc_msgSend(v26, "attachedMediaKey")));

                v78 = 0u;
                v79 = 0u;
                v76 = 0u;
                v77 = 0u;
                obj = v42;
                v71 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v76, v93, 16);
                if (v71)
                {
                  v68 = *(_QWORD *)v77;
                  do
                  {
                    for (k = 0; k != v71; ++k)
                    {
                      if (*(_QWORD *)v77 != v68)
                        objc_enumerationMutation(obj);
                      v44 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * k);
                      -[BWInferenceSchedulerFramebufferBuilder _prepareToConnectNode:]((uint64_t)a1, (uint64_t)v44);
                      objc_msgSend(a3, "setObject:forKey:", v44, objc_msgSend((id)objc_msgSend(v44, "outputRequirements"), "firstObject"));
                      v74 = 0u;
                      v75 = 0u;
                      v72 = 0u;
                      v73 = 0u;
                      v45 = (void *)objc_msgSend(v44, "inputVideoRequirements");
                      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v72, v92, 16);
                      if (v46)
                      {
                        v47 = v46;
                        v48 = *(_QWORD *)v73;
                        do
                        {
                          for (m = 0; m != v47; ++m)
                          {
                            if (*(_QWORD *)v73 != v48)
                              objc_enumerationMutation(v45);
                            v50 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * m);
                            v51 = (id)objc_msgSend(v10, "objectForKey:", v50);
                            if (!v51)
                              v51 = (id)objc_opt_new();
                            objc_msgSend(v51, "addObject:", v44);
                            objc_msgSend(v10, "setObject:forKey:", v51, v50);
                          }
                          v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v72, v92, 16);
                        }
                        while (v47);
                      }
                    }
                    v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v93, 16);
                  }
                  while (v71);
                }

                j = v62;
                v21 = v63;
              }
              break;
            }
          }
        }
        v11 = v58;
      }
      v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
    }
    while (v60);
  }
  v52 = -[BWInferenceSchedulerFramebufferBuilder _connectNodesExpectingInputs:toNodesProvidingOutput:dependencyProvider:nodeForExternalRequirement:](a1, v10, a3, a4, v55);

  return -[BWInferenceSchedulerFramebufferBuilder _addScalingNodesForNodesExpectingInputs:nodesProvidingOutput:dependencyProvider:nodesForExternalRequirements:fencedMediaKeys:iterations:](a1, v52, a3, a4, v55, a6, v54 - 1);
}

- (BOOL)_validToDeriveFormat:(_BOOL8)result fromFormat:(void *)a2 vendingProvider:(void *)a3
{
  unint64_t v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  int v9;

  if (result)
  {
    v5 = objc_msgSend(a3, "width");
    if (v5 >= objc_msgSend(a2, "width")
      && (v6 = objc_msgSend(a3, "height"), v6 >= objc_msgSend(a2, "height"))
      && ((v7 = objc_msgSend(a2, "includesInvalidContent"),
           v7 == objc_msgSend(a3, "includesInvalidContent"))
       || (objc_msgSend(a2, "includesInvalidContent") & 1) == 0
       && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      && (v8 = objc_msgSend(a3, "videoContentMode"), v8 <= objc_msgSend(a2, "videoContentMode")))
    {
      if (objc_msgSend((id)objc_msgSend(a3, "cropDescriptor"), "identifier"))
      {
        v9 = objc_msgSend((id)objc_msgSend(a3, "cropDescriptor"), "identifier");
        return v9 == objc_msgSend((id)objc_msgSend(a2, "cropDescriptor"), "identifier");
      }
      else
      {
        return 1;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)_newScalingNodesForScalingRequirement:(unsigned int)a3 fencedMedia:
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  BWInferenceSchedulerScaler *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = (void *)objc_msgSend(a2, "orderedVideoRequirements", 0, 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (1)
    {
      if (*(_QWORD *)v17 != v9)
        objc_enumerationMutation(v6);
      if (!--v8)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (!v8)
          break;
      }
    }
  }
  v10 = (void *)objc_msgSend((id)objc_msgSend(a2, "orderedVideoRequirements"), "mutableCopy");
  if ((unint64_t)objc_msgSend(v10, "count") >= 2)
  {
    v11 = 0;
    do
    {
      v12 = objc_msgSend(v10, "firstObject");
      objc_msgSend(v10, "removeObjectAtIndex:", 0);
      v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v13, "addObject:", objc_msgSend(v10, "firstObject"));
      if ((unint64_t)objc_msgSend(v10, "count") >= 2)
      {
        do
        {
          if (!objc_msgSend((id)objc_msgSend(v10, "objectAtIndex:", 1), "isSatisfiedByRequirement:", objc_msgSend(v13, "lastObject")))break;
          objc_msgSend(v10, "removeObjectAtIndex:", 0);
          objc_msgSend(v13, "addObject:", objc_msgSend(v10, "firstObject"));
        }
        while ((unint64_t)objc_msgSend(v10, "count") > 1);
      }
      v14 = -[BWInferenceSchedulerScaler initWithInputRequirement:derivedFromRequirement:outputRequirements:options:]([BWInferenceSchedulerScaler alloc], "initWithInputRequirement:derivedFromRequirement:outputRequirements:options:", v12, v11, v13, a3);

      objc_msgSend(v5, "addObject:", v14);
      v11 = v12;
    }
    while ((unint64_t)objc_msgSend(v10, "count") > 1);
  }

  return v5;
}

- (BWInferenceSchedulerFramebufferBuilder)initWithInferenceRequirements:(id)a3 dependencyProvider:(id)a4 formatProvider:(id)a5
{
  BWInferenceSchedulerFramebufferBuilder *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  BWInferenceSchedulerGraphInputNode *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  BWInferenceVideoFormat *v23;
  uint64_t v24;
  BWInferenceVideoRequirement *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  BWInferenceSchedulerInference *v32;
  void *v33;
  char *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t m;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t n;
  id *v52;
  uint64_t v53;
  void *v54;
  NSMapTable *directedEdgesByNode;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t ii;
  uint64_t v60;
  BWInferenceSchedulerJobList *v61;
  uint64_t v63;
  void *v64;
  BWInferenceSchedulerFramebufferBuilder *v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  void *v69;
  id obj;
  char *obja;
  id objb;
  id v73;
  id v74;
  char *v75;
  id v76;
  id v77;
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
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  objc_super v106;
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  v106.receiver = self;
  v106.super_class = (Class)BWInferenceSchedulerFramebufferBuilder;
  v8 = -[BWInferenceSchedulerFramebufferBuilder init](&v106, sel_init);
  if (v8)
  {
    v9 = objc_msgSend((id)objc_msgSend(a4, "allInputVideoDependencies"), "count");
    v10 = objc_msgSend((id)objc_msgSend(a4, "allOutputVideoDependencies"), "count") + v9;
    v8->_directedEdgesByNode = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, v10);
    v11 = (void *)objc_msgSend(MEMORY[0x1E0CB3748], "bw_strongVideoRequirementToStrongObjectsMapTable");
    v12 = (void *)objc_msgSend(MEMORY[0x1E0CB3748], "bw_strongVideoRequirementToStrongObjectsMapTable");
    v74 = a3;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 258, 1282, objc_msgSend(a3, "count"));
    v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v15 = -[BWInferenceSchedulerGraphInputNode initWithVideoPropagatedToStorage:]([BWInferenceSchedulerGraphInputNode alloc], "initWithVideoPropagatedToStorage:", v14);
    v65 = v8;
    v16 = (uint64_t)v8;
    v17 = v14;
    -[BWInferenceSchedulerFramebufferBuilder _prepareToConnectNode:](v16, (uint64_t)v15);
    v69 = v13;
    objc_msgSend(v13, "setObject:forKey:", 1, v15);
    v73 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v102 = 0u;
    v103 = 0u;
    v104 = 0u;
    v105 = 0u;
    v77 = a4;
    obj = (id)objc_msgSend(a4, "consumedVideoAttachedMediaKeys");
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v113, 16);
    v66 = (uint64_t)v15;
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v103;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v103 != v20)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * i);
          v23 = (BWInferenceVideoFormat *)objc_msgSend(a5, "inputInferenceVideoFormatForAttachedMediaKey:", v22);
          if (!v23)
          {
            v24 = objc_msgSend(a5, "inputVideoFormatForAttachedMediaKey:", v22);
            if (!v24)
              goto LABEL_64;
            LODWORD(v63) = 0;
            v23 = -[BWInferenceVideoFormat initWithUnderlyingFormat:isDeviceOriented:videoContentMode:includesInvalidContent:cropDescriptor:histogramRequest:rotationDegrees:]([BWInferenceVideoFormat alloc], "initWithUnderlyingFormat:isDeviceOriented:videoContentMode:includesInvalidContent:cropDescriptor:histogramRequest:rotationDegrees:", v24, 0, 0, objc_msgSend(v22, "isEqualToString:", CFSTR("PrimaryFormat")), 0, 0, v63);
            v15 = (BWInferenceSchedulerGraphInputNode *)v66;
          }
          v25 = -[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:]([BWInferenceVideoRequirement alloc], "initWithAttachedMediaKey:videoFormat:", v22, v23);
          objc_msgSend(v17, "addObject:", v25);
          objc_msgSend(v11, "setObject:forKey:", v15, v25);

          if ((objc_msgSend(v73, "containsObject:", v22) & 1) == 0
            && objc_msgSend(a5, "intermediateResourceTrackingAllowedForAttachedMediaKey:", v22))
          {
            objc_msgSend(v73, "addObject:", v22);
          }
        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v113, 16);
      }
      while (v19);
    }
    v64 = v17;
    v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    v98 = 0u;
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v27 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v98, v112, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v99;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v99 != v29)
            objc_enumerationMutation(v74);
          v31 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * j);
          v32 = -[BWInferenceSchedulerInference initWithInferenceRequirement:]([BWInferenceSchedulerInference alloc], "initWithInferenceRequirement:", v31);
          -[BWInferenceSchedulerFramebufferBuilder _prepareToConnectNode:]((uint64_t)v65, (uint64_t)v32);
          objc_msgSend(v69, "setObject:forKey:", 2, v32);
          objc_msgSend(v26, "setObject:forKey:", v32, v31);

        }
        v28 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v98, v112, 16);
      }
      while (v28);
    }
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    v33 = v77;
    v67 = (id)objc_msgSend(v77, "allInputVideoDependencies");
    obja = (char *)objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v94, v111, 16);
    if (obja)
    {
      v68 = *(_QWORD *)v95;
      do
      {
        v34 = 0;
        do
        {
          if (*(_QWORD *)v95 != v68)
            objc_enumerationMutation(v67);
          v75 = v34;
          v35 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)v34);
          v90 = 0u;
          v91 = 0u;
          v92 = 0u;
          v93 = 0u;
          v36 = (void *)objc_msgSend(v33, "dependenciesForInputVideoRequirement:", v35);
          v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v90, v110, 16);
          if (v37)
          {
            v38 = v37;
            v39 = *(_QWORD *)v91;
            do
            {
              for (k = 0; k != v38; ++k)
              {
                if (*(_QWORD *)v91 != v39)
                  objc_enumerationMutation(v36);
                v41 = objc_msgSend(v26, "objectForKey:", objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * k), "inferenceRequirement"));
                v42 = (id)objc_msgSend(v12, "objectForKey:", v35);
                if (!v42)
                {
                  v42 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                  objc_msgSend(v12, "setObject:forKey:", v42, v35);

                }
                objc_msgSend(v42, "addObject:", v41);
              }
              v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v90, v110, 16);
            }
            while (v38);
          }
          v33 = v77;
          v34 = v75 + 1;
        }
        while (v75 + 1 != obja);
        obja = (char *)objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v94, v111, 16);
      }
      while (obja);
    }
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    objb = (id)objc_msgSend(v33, "allOutputVideoDependencies");
    v43 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v86, v109, 16);
    if (v43)
    {
      v44 = v43;
      v76 = *(id *)v87;
      do
      {
        for (m = 0; m != v44; ++m)
        {
          if (*(id *)v87 != v76)
            objc_enumerationMutation(objb);
          v46 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * m);
          v82 = 0u;
          v83 = 0u;
          v84 = 0u;
          v85 = 0u;
          v47 = (void *)objc_msgSend(v33, "dependenciesForOutputVideoRequirement:", v46);
          v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v82, v108, 16);
          if (v48)
          {
            v49 = v48;
            v50 = *(_QWORD *)v83;
            do
            {
              for (n = 0; n != v49; ++n)
              {
                if (*(_QWORD *)v83 != v50)
                  objc_enumerationMutation(v47);
                objc_msgSend(v11, "setObject:forKey:", objc_msgSend(v26, "objectForKey:", objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * n), "inferenceRequirement")), v46);
              }
              v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v82, v108, 16);
            }
            while (v49);
          }
          v33 = v77;
        }
        v44 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v86, v109, 16);
      }
      while (v44);
    }
    v52 = -[BWInferenceSchedulerFramebufferBuilder _connectNodesExpectingInputs:toNodesProvidingOutput:dependencyProvider:nodeForExternalRequirement:]((id *)&v65->super.isa, v12, v11, v33, v26);
    v53 = -[BWInferenceSchedulerFramebufferBuilder _addScalingNodesForNodesExpectingInputs:nodesProvidingOutput:dependencyProvider:nodesForExternalRequirements:fencedMediaKeys:iterations:]((id *)&v65->super.isa, v52, (id)objc_msgSend(v11, "copy"), v33, v26, v73, 15);
    v17 = v64;
    if (v53)
    {
      v54 = (void *)v53;
      v80 = 0u;
      v81 = 0u;
      v78 = 0u;
      v79 = 0u;
      directedEdgesByNode = v65->_directedEdgesByNode;
      v56 = -[NSMapTable countByEnumeratingWithState:objects:count:](directedEdgesByNode, "countByEnumeratingWithState:objects:count:", &v78, v107, 16);
      if (v56)
      {
        v57 = v56;
        v58 = *(_QWORD *)v79;
        do
        {
          for (ii = 0; ii != v57; ++ii)
          {
            if (*(_QWORD *)v79 != v58)
              objc_enumerationMutation(directedEdgesByNode);
            v60 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * ii);
            if (!objc_msgSend(v69, "objectForKey:", v60))
              objc_msgSend(v69, "setObject:forKey:", 3, v60);
          }
          v57 = -[NSMapTable countByEnumeratingWithState:objects:count:](directedEdgesByNode, "countByEnumeratingWithState:objects:count:", &v78, v107, 16);
        }
        while (v57);
      }
      v17 = v64;
      if (!objc_msgSend(v54, "count"))
      {
        v65->_graph = -[BWInferenceSchedulerGraph initWithHeadNode:directedEdges:]([BWInferenceSchedulerGraph alloc], "initWithHeadNode:directedEdges:", v66, v65->_directedEdgesByNode);
        v61 = -[BWInferenceSchedulerJobList initWithCapacity:]([BWInferenceSchedulerJobList alloc], "initWithCapacity:", v65->_jobCount);
        v65->_prototypeJobList = v61;
        -[BWInferenceSchedulerFramebufferBuilder _populateJobList:fromGraphEdges:withHeadNode:jobTypes:]((uint64_t)v65, (uint64_t)v61, v65->_directedEdgesByNode, v66, v69);
      }
    }
LABEL_64:

    return v65;
  }
  return v8;
}

- (void)_prepareToConnectNode:(uint64_t)a1
{
  id v4;
  id v5;

  if (a1)
  {
    ++*(_QWORD *)(a1 + 24);
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3870]), "initWithOptions:", 1024);
    objc_msgSend(v4, "setSizeFunction:", BWInferenceSchedulerGraphDirectedEdgeSize);
    objc_msgSend(v4, "setRelinquishFunction:", BWInferenceSchedulerGraphDirectedEdgeRelinquish);
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3868]), "initWithPointerFunctions:", v4);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, a2);

  }
}

+ (void)initialize
{
  objc_opt_class();
}

@end
