@implementation GCHapticCapabilityGraph

- (NSMutableDictionary)nodes
{
  return self->_nodes;
}

- (void)setNodes:(id)a3
{
  objc_storeStrong((id *)&self->_nodes, a3);
}

- (NSMutableSet)exposedCapabilities
{
  return self->_exposedCapabilities;
}

- (void)setExposedCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_exposedCapabilities, a3);
}

- (NSMutableSet)exposedLeafCapabilities
{
  return self->_exposedLeafCapabilities;
}

- (void)setExposedLeafCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_exposedLeafCapabilities, a3);
}

- (NSMutableSet)allCapabilities
{
  return self->_allCapabilities;
}

- (void)setAllCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_allCapabilities, a3);
}

- (NSMutableSet)allLeafCapabilities
{
  return self->_allLeafCapabilities;
}

- (void)setAllLeafCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_allLeafCapabilities, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allLeafCapabilities, 0);
  objc_storeStrong((id *)&self->_allCapabilities, 0);
  objc_storeStrong((id *)&self->_exposedLeafCapabilities, 0);
  objc_storeStrong((id *)&self->_exposedCapabilities, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCHapticCapabilityGraph)initWithCoder:(id)a3
{

  return 0;
}

- (GCHapticCapabilityGraph)initWithActuators:(id)a3 nodes:(id)a4
{
  id v7;
  id v8;
  GCHapticCapabilityGraph *v9;
  uint64_t v10;
  NSMutableDictionary *nodes;
  uint64_t v12;
  NSMutableSet *exposedCapabilities;
  uint64_t v14;
  NSMutableSet *exposedLeafCapabilities;
  uint64_t v16;
  NSMutableSet *allCapabilities;
  uint64_t v18;
  NSMutableSet *allLeafCapabilities;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  GCHapticCapabilityGraphNode *v33;
  NSMutableDictionary *v34;
  void *v35;
  void *v36;
  void *v37;
  void *k;
  void *v39;
  NSMutableDictionary *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t m;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t n;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t ii;
  NSMutableDictionary *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t jj;
  void *v71;
  uint64_t v72;
  NSMutableSet *v73;
  void *v74;
  NSMutableSet *v75;
  void *v76;
  NSMutableSet *v77;
  void *v78;
  NSMutableSet *v79;
  void *v80;
  void *v82;
  void *context;
  id v84;
  void *v85;
  id v86;
  SEL v87;
  uint64_t v88;
  void *v89;
  id obj;
  id obja;
  id objb;
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
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  objc_super v121;
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  uint64_t v129;

  v129 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v121.receiver = self;
  v121.super_class = (Class)GCHapticCapabilityGraph;
  v9 = -[GCHapticCapabilityGraph init](&v121, sel_init);
  if (v9)
  {
    v85 = v8;
    +[NSMutableDictionary dictionary](&off_254DEBD30, "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    nodes = v9->_nodes;
    v9->_nodes = (NSMutableDictionary *)v10;

    +[NSMutableSet set](&off_254DEBF30, "set");
    v12 = objc_claimAutoreleasedReturnValue();
    exposedCapabilities = v9->_exposedCapabilities;
    v9->_exposedCapabilities = (NSMutableSet *)v12;

    +[NSMutableSet set](&off_254DEBF30, "set");
    v14 = objc_claimAutoreleasedReturnValue();
    exposedLeafCapabilities = v9->_exposedLeafCapabilities;
    v9->_exposedLeafCapabilities = (NSMutableSet *)v14;

    +[NSMutableSet set](&off_254DEBF30, "set");
    v16 = objc_claimAutoreleasedReturnValue();
    allCapabilities = v9->_allCapabilities;
    v9->_allCapabilities = (NSMutableSet *)v16;

    +[NSMutableSet set](&off_254DEBF30, "set");
    v18 = objc_claimAutoreleasedReturnValue();
    allLeafCapabilities = v9->_allLeafCapabilities;
    v9->_allLeafCapabilities = (NSMutableSet *)v18;

    context = (void *)MEMORY[0x2199DE97C]();
    +[NSMutableDictionary dictionary](&off_254DEBD30, "dictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = 0u;
    v118 = 0u;
    v119 = 0u;
    v120 = 0u;
    v84 = v7;
    v21 = v7;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v117, v128, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v118;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v118 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * i);
          objc_msgSend(v26, "label");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKey:", v26, v27);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v117, v128, 16);
      }
      while (v23);
    }

    +[NSMutableDictionary dictionary](&off_254DEBD30, "dictionary");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unk_254DEC4F8(&off_254DEC660, "currentHandler");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("GCHapticCapabilityGraph.m"), 83, CFSTR("Expected NSArray when deserializing nodes"));

    }
    v87 = a2;
    v115 = 0u;
    v116 = 0u;
    v113 = 0u;
    v114 = 0u;
    obj = v85;
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v127, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v114;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v114 != v30)
            objc_enumerationMutation(obj);
          v32 = *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            unk_254DEC4F8(&off_254DEC660, "currentHandler");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", v87, v9, CFSTR("GCHapticCapabilityGraph.m"), 85, CFSTR("Expected NSDictionary when deserializing GCHapticCapabilityGraphNode"));

          }
          v33 = -[GCHapticCapabilityGraphNode initWithJSONDictionaryRepresentation:]([GCHapticCapabilityGraphNode alloc], "initWithJSONDictionaryRepresentation:", v32);
          v34 = v9->_nodes;
          -[GCHapticCapabilityGraphNode label](v33, "label");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v34, "setObject:forKey:", v33, v35);

          -[GCHapticCapabilityGraphNode label](v33, "label");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "setObject:forKey:", v32, v36);

        }
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v127, 16);
      }
      while (v29);
    }

    v111 = 0u;
    v112 = 0u;
    v109 = 0u;
    v110 = 0u;
    objc_msgSend(v89, "allValues");
    v86 = (id)objc_claimAutoreleasedReturnValue();
    obja = (id)objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v109, v126, 16);
    if (obja)
    {
      v88 = *(_QWORD *)v110;
      do
      {
        for (k = 0; k != obja; k = (char *)k + 1)
        {
          if (*(_QWORD *)v110 != v88)
            objc_enumerationMutation(v86);
          v39 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * (_QWORD)k);
          v40 = v9->_nodes;
          objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("label"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](v40, "objectForKeyedSubscript:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          v107 = 0u;
          v108 = 0u;
          v105 = 0u;
          v106 = 0u;
          objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("children"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v105, v125, 16);
          if (v44)
          {
            v45 = v44;
            v46 = *(_QWORD *)v106;
            do
            {
              for (m = 0; m != v45; ++m)
              {
                if (*(_QWORD *)v106 != v46)
                  objc_enumerationMutation(v43);
                -[NSMutableDictionary objectForKeyedSubscript:](v9->_nodes, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * m));
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "addChild:", v48);

              }
              v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v105, v125, 16);
            }
            while (v45);
          }

          objc_msgSend(v42, "children");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "count");

          if (!v50)
          {
            v103 = 0u;
            v104 = 0u;
            v101 = 0u;
            v102 = 0u;
            objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("actuators"));
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v101, v124, 16);
            if (v52)
            {
              v53 = v52;
              v54 = *(_QWORD *)v102;
              do
              {
                for (n = 0; n != v53; ++n)
                {
                  if (*(_QWORD *)v102 != v54)
                    objc_enumerationMutation(v51);
                  objc_msgSend(v20, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * n));
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v42, "addActuator:", v56);

                }
                v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v101, v124, 16);
              }
              while (v53);
            }

          }
        }
        obja = (id)objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v109, v126, 16);
      }
      while (obja);
    }

    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    objc_msgSend(v89, "allValues");
    objb = (id)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v97, v123, 16);
    if (v57)
    {
      v58 = v57;
      v59 = *(_QWORD *)v98;
      do
      {
        for (ii = 0; ii != v58; ++ii)
        {
          if (*(_QWORD *)v98 != v59)
            objc_enumerationMutation(objb);
          v61 = v9->_nodes;
          objc_msgSend(*(id *)(*((_QWORD *)&v97 + 1) + 8 * ii), "objectForKeyedSubscript:", CFSTR("label"));
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](v61, "objectForKeyedSubscript:", v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v63, "children");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend(v64, "count");

          if (v65)
          {
            v95 = 0u;
            v96 = 0u;
            v93 = 0u;
            v94 = 0u;
            -[GCHapticCapabilityGraph actuatorsForNode:](v9, "actuatorsForNode:", v63);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v93, v122, 16);
            if (v67)
            {
              v68 = v67;
              v69 = *(_QWORD *)v94;
              do
              {
                for (jj = 0; jj != v68; ++jj)
                {
                  if (*(_QWORD *)v94 != v69)
                    objc_enumerationMutation(v66);
                  objc_msgSend(v63, "addActuator:", *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * jj));
                }
                v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v93, v122, 16);
              }
              while (v68);
            }

          }
          objc_msgSend(v63, "children");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = objc_msgSend(v71, "count");

          v73 = v9->_allCapabilities;
          objc_msgSend(v63, "label");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableSet addObject:](v73, "addObject:", v74);

          if (!v72)
          {
            v75 = v9->_allLeafCapabilities;
            objc_msgSend(v63, "label");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableSet addObject:](v75, "addObject:", v76);

          }
          if (objc_msgSend(v63, "isExposed"))
          {
            v77 = v9->_exposedCapabilities;
            objc_msgSend(v63, "label");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableSet addObject:](v77, "addObject:", v78);

          }
          if (objc_msgSend(v63, "isExposed") && !v72)
          {
            v79 = v9->_exposedLeafCapabilities;
            objc_msgSend(v63, "label");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableSet addObject:](v79, "addObject:", v80);

          }
        }
        v58 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v97, v123, 16);
      }
      while (v58);
    }

    objc_autoreleasePoolPop(context);
    v7 = v84;
    v8 = v85;
  }

  return v9;
}

- (GCHapticCapabilityGraph)initWithJSONDictionaryRepresentation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  GCHapticActuator *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  GCHapticCapabilityGraph *v18;
  void *v20;
  void *v21;
  void *context;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  context = (void *)MEMORY[0x2199DE97C]();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("actuators"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCHapticCapabilityGraph.m"), 137, CFSTR("Expected NSArray when deserializing actuators"));

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("actuators"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          unk_254DEC4F8(&off_254DEC660, "currentHandler");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCHapticCapabilityGraph.m"), 140, CFSTR("Expected NSDictionary when deserializing GCHapticActuator"));

        }
        v13 = -[GCHapticActuator initWithJSONDictionaryRepresentation:]([GCHapticActuator alloc], "initWithJSONDictionaryRepresentation:", v12);
        objc_msgSend(v4, "addObject:", v13);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("nodes"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v16 = objc_opt_isKindOfClass();

  if ((v16 & 1) == 0)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCHapticCapabilityGraph.m"), 145, CFSTR("Expected NSArray when deserializing nodes"));

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("nodes"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[GCHapticCapabilityGraph initWithActuators:nodes:](self, "initWithActuators:nodes:", v4, v17);

  objc_autoreleasePoolPop(context);
  return v18;
}

- (id)actuatorsForNode:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    +[NSMutableArray array](&off_254DEBB20, "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v4, "children", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          -[GCHapticCapabilityGraph actuatorsForNode:](self, "actuatorsForNode:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObjectsFromArray:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

  }
  else
  {
    objc_msgSend(v4, "actuators");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)jsonDictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSMutableSet *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  +[NSMutableDictionary dictionary](&off_254DEBD30, "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSMutableArray array](&off_254DEBB20, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[NSMutableDictionary allValues](self->_nodes, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "jsonDictionaryRepresentation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v7);
  }

  v26 = v3;
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("nodes"));
  +[NSMutableArray array](&off_254DEBB20, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = self->_allLeafCapabilities;
  v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v28;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v12);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_nodes, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v16));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "actuators");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");

        if (v19 != 1)
        {
          unk_254DEC4F8(&off_254DEC660, "currentHandler");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCHapticCapabilityGraph.m"), 179, CFSTR("All leaf nodes should have exactly 1 actuator"));

        }
        objc_msgSend(v17, "actuators");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "jsonDictionaryRepresentation");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v22);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v14);
  }

  objc_msgSend(v26, "setObject:forKey:", v11, CFSTR("actuators"));
  return v26;
}

- (NSString)description
{
  return +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ - %lu nodes, %lu capabilities (%lu exposed), %lu leaf capabilities (%lu exposed)>"), objc_opt_class(), -[NSMutableDictionary count](self->_nodes, "count"), -[NSMutableSet count](self->_allCapabilities, "count"), -[NSMutableSet count](self->_exposedCapabilities, "count"), -[NSMutableSet count](self->_allLeafCapabilities, "count"), -[NSMutableSet count](self->_exposedLeafCapabilities, "count"));
}

@end
