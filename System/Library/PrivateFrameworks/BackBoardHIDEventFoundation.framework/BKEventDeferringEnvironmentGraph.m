@implementation BKEventDeferringEnvironmentGraph

- (BKEventDeferringEnvironmentGraph)initWithEnvironment:(id)a3
{
  id v5;
  BKEventDeferringEnvironmentGraph *v6;
  BKEventDeferringEnvironmentGraph *v7;
  NSMutableSet *v8;
  NSMutableSet *selectedNodeIdentities;
  NSMutableOrderedSet *v10;
  NSMutableOrderedSet *allNodes;
  NSMutableDictionary *v12;
  NSMutableDictionary *tokenToNode;
  NSMutableDictionary *v14;
  NSMutableDictionary *topLevelInEachProcess;
  NSMutableDictionary *v16;
  NSMutableDictionary *nodeByIdentity;
  NSMutableDictionary *v18;
  NSMutableDictionary *pidToActiveUIResponderNodes;
  NSMutableDictionary *v20;
  NSMutableDictionary *pidToActiveUIResponderTokens;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)BKEventDeferringEnvironmentGraph;
  v6 = -[BKEventDeferringEnvironmentGraph init](&v23, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_environment, a3);
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    selectedNodeIdentities = v7->_selectedNodeIdentities;
    v7->_selectedNodeIdentities = v8;

    v10 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    allNodes = v7->_allNodes;
    v7->_allNodes = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    tokenToNode = v7->_tokenToNode;
    v7->_tokenToNode = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    topLevelInEachProcess = v7->_topLevelInEachProcess;
    v7->_topLevelInEachProcess = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    nodeByIdentity = v7->_nodeByIdentity;
    v7->_nodeByIdentity = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pidToActiveUIResponderNodes = v7->_pidToActiveUIResponderNodes;
    v7->_pidToActiveUIResponderNodes = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pidToActiveUIResponderTokens = v7->_pidToActiveUIResponderTokens;
    v7->_pidToActiveUIResponderTokens = v20;

  }
  return v7;
}

- (void)dealloc
{
  NSMutableOrderedSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableOrderedSet count](self->_allNodes, "count"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = self->_allNodes;
    v4 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          -[BKEventDeferringNode disconnectFromGraph](*(id **)(*((_QWORD *)&v9 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

  }
  v8.receiver = self;
  v8.super_class = (Class)BKEventDeferringEnvironmentGraph;
  -[BKEventDeferringEnvironmentGraph dealloc](&v8, sel_dealloc);
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSMutableOrderedSet hash](self->_allNodes, "hash");
  return -[NSMutableSet hash](self->_selectedNodeIdentities, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  BKEventDeferringEnvironmentGraph *v4;
  BKEventDeferringEnvironmentGraph *v5;
  char v6;

  v4 = (BKEventDeferringEnvironmentGraph *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSMutableOrderedSet isEqual:](self->_allNodes, "isEqual:", v5->_allNodes))
        v6 = -[NSMutableSet isEqual:](self->_selectedNodeIdentities, "isEqual:", v5->_selectedNodeIdentities);
      else
        v6 = 0;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (BOOL)isEmpty
{
  return -[NSMutableOrderedSet count](self->_allNodes, "count") == 0;
}

- (void)setRules:(id)a3 forPID:(int)a4
{
  id v6;
  uint64_t v7;
  NSMutableOrderedSet *allNodes;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  id *v25;
  id *v26;
  id v27;
  void *v28;
  void *v29;
  NSMutableDictionary *nodeByIdentity;
  void *v31;
  NSMutableSet *selectedNodeIdentities;
  void *v33;
  NSObject *v34;
  id v35;
  BKEventDeferringEnvironmentGraph *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  NSMutableDictionary *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  NSMutableOrderedSet *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t k;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  __CFString *v65;
  NSObject *v66;
  void *v68;
  _QWORD *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  uint64_t v75;
  void *v76;
  id v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  _QWORD *v85;
  _QWORD *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  unint64_t v97;
  _QWORD *v98;
  uint64_t v99;
  BKSHIDEventDeferringEnvironment *environment;
  id v101;
  BKSHIDEventDeferringEnvironment *v102;
  id v103;
  void *v104;
  id v105;
  unsigned int v106;
  NSMutableOrderedSet *v107;
  void *v108;
  id obj;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  id v113;
  uint64_t v114;
  void *v115;
  NSMutableOrderedSet *v116;
  BKEventDeferringEnvironmentGraph *v117;
  _QWORD v118[4];
  id v119;
  unsigned int v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _QWORD v125[4];
  int v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  uint8_t v143[128];
  uint8_t buf[4];
  void *v145;
  __int16 v146;
  __CFString *v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  uint8_t v160[4];
  BKSHIDEventDeferringEnvironment *v161;
  __int16 v162;
  id v163;
  uint64_t v164;

  v164 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v117 = self;
  allNodes = self->_allNodes;
  v125[0] = MEMORY[0x1E0C809B0];
  v125[1] = 3221225472;
  v125[2] = __52__BKEventDeferringEnvironmentGraph_setRules_forPID___block_invoke;
  v125[3] = &__block_descriptor_36_e30__16__0__BKEventDeferringNode_8l;
  v106 = a4;
  v126 = a4;
  -[NSMutableOrderedSet bs_compactMap:](allNodes, "bs_compactMap:", v125);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v124 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v143, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v122;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v122 != v11)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v121 + 1) + 8 * i), "identity");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "addObject:", v13);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v143, 16);
    }
    while (v10);
  }

  v14 = (void *)objc_msgSend(v113, "mutableCopy");
  objc_msgSend(v14, "minusOrderedSet:", v104);
  v15 = (void *)objc_msgSend(v104, "mutableCopy");
  objc_msgSend(v15, "minusOrderedSet:", v113);
  v118[0] = v7;
  v118[1] = 3221225472;
  v118[2] = __52__BKEventDeferringEnvironmentGraph_setRules_forPID___block_invoke_2;
  v118[3] = &unk_1E81F7B40;
  v108 = v15;
  v105 = v14;
  v119 = v105;
  v120 = v106;
  objc_msgSend(obj, "bs_compactMap:", v118);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = v16;
  if (objc_msgSend(v15, "count"))
  {
    BKLogEventDelivery();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      environment = v117->_environment;
      *(_DWORD *)v160 = 138543618;
      v161 = environment;
      v162 = 2114;
      v163 = v15;
      _os_log_debug_impl(&dword_1C8914000, v17, OS_LOG_TYPE_DEBUG, "removing rules from %{public}@: %{public}@", v160, 0x16u);

      v18 = v15;
      v101 = v15;
    }
    else
    {

      v18 = v15;
      v19 = v15;
      if (!v117)
      {
LABEL_23:

        v16 = v111;
        goto LABEL_24;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v106);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = 0u;
    v157 = 0u;
    v158 = 0u;
    v159 = 0u;
    v20 = v18;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v156, v160, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v157;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v157 != v23)
            objc_enumerationMutation(v20);
          -[NSMutableDictionary objectForKey:](v117->_nodeByIdentity, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v156 + 1) + 8 * j));
          v25 = (id *)objc_claimAutoreleasedReturnValue();
          v26 = v25;
          if (v25)
          {
            -[BKEventDeferringNode disconnectFromGraph](v25);
            v27 = v26[2];
            objc_msgSend(v27, "target");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "token");
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (v29)
              -[NSMutableDictionary removeObjectForKey:](v117->_tokenToNode, "removeObjectForKey:", v29);
            -[NSMutableDictionary bs_removeObject:fromCollectionForKey:](v117->_topLevelInEachProcess, "bs_removeObject:fromCollectionForKey:", v26, v115);
            nodeByIdentity = v117->_nodeByIdentity;
            objc_msgSend(v27, "identity");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary removeObjectForKey:](nodeByIdentity, "removeObjectForKey:", v31);

            -[NSMutableOrderedSet removeObject:](v117->_allNodes, "removeObject:", v26);
            selectedNodeIdentities = v117->_selectedNodeIdentities;
            objc_msgSend(v20, "set");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableSet minusSet:](selectedNodeIdentities, "minusSet:", v33);

            v18 = v108;
          }

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v156, v160, 16);
      }
      while (v22);
    }

    goto LABEL_23;
  }
LABEL_24:
  if (!objc_msgSend(v105, "count"))
    goto LABEL_83;
  BKLogEventDelivery();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    v102 = v117->_environment;
    *(_DWORD *)v160 = 138543618;
    v161 = v102;
    v162 = 2114;
    v163 = v105;
    _os_log_debug_impl(&dword_1C8914000, v34, OS_LOG_TYPE_DEBUG, "adding rules to %{public}@: %{public}@", v160, 0x16u);

    v36 = v117;
    v103 = v16;
    goto LABEL_27;
  }

  v35 = v16;
  v36 = v117;
  if (v117)
  {
LABEL_27:
    -[NSMutableOrderedSet addObjectsFromArray:](v36->_allNodes, "addObjectsFromArray:", v16);
    v141 = 0u;
    v142 = 0u;
    v139 = 0u;
    v140 = 0u;
    v37 = v16;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v139, v160, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v140;
      do
      {
        v41 = 0;
        do
        {
          if (*(_QWORD *)v140 != v40)
            objc_enumerationMutation(v37);
          v42 = *(_QWORD *)(*((_QWORD *)&v139 + 1) + 8 * v41);
          if (v42)
            v43 = *(void **)(v42 + 16);
          else
            v43 = 0;
          v44 = v43;
          v45 = v117->_nodeByIdentity;
          objc_msgSend(v44, "identity");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v45, "setObject:forKey:", v42, v46);

          objc_msgSend(v44, "target");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "token");
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          if (v48)
            -[NSMutableDictionary setObject:forKey:](v117->_tokenToNode, "setObject:forKey:", v42, v48);

          ++v41;
        }
        while (v39 != v41);
        v49 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v139, v160, 16);
        v39 = v49;
      }
      while (v49);
    }

    v137 = 0u;
    v138 = 0u;
    v135 = 0u;
    v136 = 0u;
    v50 = v117->_allNodes;
    v51 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v135, &v156, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v136;
      do
      {
        for (k = 0; k != v52; ++k)
        {
          if (*(_QWORD *)v136 != v53)
            objc_enumerationMutation(v50);
          -[BKEventDeferringNode disconnectFromGraph](*(id **)(*((_QWORD *)&v135 + 1) + 8 * k));
        }
        v52 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v135, &v156, 16);
      }
      while (v52);
    }

    v133 = 0u;
    v134 = 0u;
    v131 = 0u;
    v132 = 0u;
    v55 = (uint64_t)v117;
    v107 = v117->_allNodes;
    v16 = v111;
    v112 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v107, "countByEnumeratingWithState:objects:count:", &v131, &v152, 16);
    if (v112)
    {
      v110 = *(_QWORD *)v132;
      do
      {
        v56 = 0;
        do
        {
          if (*(_QWORD *)v132 != v110)
            objc_enumerationMutation(v107);
          v114 = v56;
          v57 = *(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * v56);
          BKLogEventDelivery();
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
          {
            if (v57)
              v76 = *(void **)(v57 + 16);
            else
              v76 = 0;
            v77 = v76;
            objc_msgSend(v77, "identity");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v145 = v78;
            _os_log_debug_impl(&dword_1C8914000, v58, OS_LOG_TYPE_DEBUG, "match supernode %{public}@", buf, 0xCu);

          }
          v129 = 0u;
          v130 = 0u;
          v127 = 0u;
          v128 = 0u;
          v59 = *(id *)(v55 + 48);
          v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v127, &v148, 16);
          if (v60)
          {
            v61 = v60;
            v62 = *(_QWORD *)v128;
            do
            {
              v63 = 0;
              do
              {
                if (*(_QWORD *)v128 != v62)
                  objc_enumerationMutation(v59);
                v64 = *(_QWORD **)(*((_QWORD *)&v127 + 1) + 8 * v63);
                if ((_QWORD *)v57 != v64)
                {
                  -[BKEventDeferringEnvironmentGraph _matchSubnode:toSupernode:](v55, *(void **)(*((_QWORD *)&v127 + 1) + 8 * v63), (void *)v57);
                  v65 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  if (v65 != CFSTR("process doesn't match"))
                  {
                    BKLogEventDelivery();
                    v66 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
                    {
                      if (v64)
                        v72 = (void *)v64[2];
                      else
                        v72 = 0;
                      v73 = v72;
                      objc_msgSend(v73, "identity");
                      v74 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543618;
                      v145 = v74;
                      v146 = 2114;
                      v147 = v65;
                      _os_log_debug_impl(&dword_1C8914000, v66, OS_LOG_TYPE_DEBUG, "   -> %{public}@: %{public}@", buf, 0x16u);

                      v55 = (uint64_t)v117;
                    }

                    if (v65 == CFSTR("connected") && v57 != 0)
                    {
                      v68 = *(void **)(v57 + 32);
                      v69 = v64;
                      objc_msgSend(*(id *)(v57 + 32), "insertObject:atIndex:", v69, objc_msgSend(v68, "indexOfObject:inSortedRange:options:usingComparator:", v69, 0, objc_msgSend(v68, "count"), 1024, &__block_literal_global));
                      v70 = (void *)v69[3];

                      v71 = v70;
                      v55 = (uint64_t)v117;
                      objc_msgSend(v71, "addObject:", v57);
                    }
                  }

                }
                ++v63;
              }
              while (v61 != v63);
              v75 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v127, &v148, 16);
              v61 = v75;
            }
            while (v75);
          }

          v56 = v114 + 1;
          v16 = v111;
        }
        while (v114 + 1 != v112);
        v79 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v107, "countByEnumeratingWithState:objects:count:", &v131, &v152, 16);
        v112 = v79;
      }
      while (v79);
    }

  }
LABEL_83:
  v80 = (uint64_t)v117;
  if (v117)
  {
    v150 = 0u;
    v151 = 0u;
    v148 = 0u;
    v149 = 0u;
    v116 = v117->_allNodes;
    v81 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v116, "countByEnumeratingWithState:objects:count:", &v148, &v156, 16);
    if (v81)
    {
      v82 = v81;
      v83 = *(_QWORD *)v149;
      do
      {
        v84 = 0;
        do
        {
          if (*(_QWORD *)v149 != v83)
            objc_enumerationMutation(v116);
          v85 = *(id *)(*((_QWORD *)&v148 + 1) + 8 * v84);
          v86 = v85;
          if (v85)
            v87 = *((unsigned int *)v85 + 3);
          else
            v87 = 0;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v87);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v152 = 0u;
          v153 = 0u;
          v154 = 0u;
          v155 = 0u;
          if (v86)
            v89 = (void *)v86[3];
          else
            v89 = 0;
          v90 = v89;
          v91 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v152, v160, 16);
          if (v91)
          {
            v92 = v91;
            v93 = *(_QWORD *)v153;
LABEL_95:
            v94 = 0;
            while (1)
            {
              if (*(_QWORD *)v153 != v93)
                objc_enumerationMutation(v90);
              v95 = *(_QWORD *)(*((_QWORD *)&v152 + 1) + 8 * v94);
              if (v95)
                LODWORD(v95) = *(_DWORD *)(v95 + 12);
              if ((_DWORD)v87 != (_DWORD)v95)
                break;
              if (v92 == ++v94)
              {
                v92 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v152, v160, 16);
                if (v92)
                  goto LABEL_95;

                v80 = (uint64_t)v117;
                -[NSMutableDictionary bs_removeObject:fromCollectionForKey:](v117->_topLevelInEachProcess, "bs_removeObject:fromCollectionForKey:", v86, v88);
                goto LABEL_110;
              }
            }
          }

          v80 = (uint64_t)v117;
          -[NSMutableDictionary objectForKey:](v117->_topLevelInEachProcess, "objectForKey:", v88);
          v96 = (id)objc_claimAutoreleasedReturnValue();
          if (!v96)
          {
            v96 = objc_alloc_init(MEMORY[0x1E0C99E10]);
            -[NSMutableDictionary setObject:forKey:](v117->_topLevelInEachProcess, "setObject:forKey:", v96, v88);
          }
          v97 = objc_msgSend(v96, "indexOfObject:inSortedRange:options:usingComparator:", v86, 0, objc_msgSend(v96, "count"), 1024, &__block_literal_global_2820);
          if (v97 >= objc_msgSend(v96, "count")
            || (objc_msgSend(v96, "objectAtIndex:", v97),
                v98 = (_QWORD *)objc_claimAutoreleasedReturnValue(),
                v98,
                v98 != v86))
          {
            objc_msgSend(v96, "insertObject:atIndex:", v86, v97);
          }

LABEL_110:
          ++v84;
        }
        while (v84 != v82);
        v99 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v116, "countByEnumeratingWithState:objects:count:", &v148, &v156, 16);
        v82 = v99;
      }
      while (v99);
    }

  }
  -[BKEventDeferringEnvironmentGraph _reevaluateActiveUIResponderNodesForPID:](v80, v106);

}

- (id)deferringPathForPID:(int)a3 dispatchTarget:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;
  NSMutableDictionary *topLevelInEachProcess;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  char v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  void *v28;
  id v29;
  id v30;
  BKEventDeferringEnvironmentGraph *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v4 = *(_QWORD *)&a3;
  v37 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v31 = self;
  topLevelInEachProcess = self->_topLevelInEachProcess;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](topLevelInEachProcess, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "deferringToken");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      v29 = v6;
      v30 = v7;
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v28 = v10;
      v13 = v10;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v33;
        while (2)
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v33 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD **)(*((_QWORD *)&v32 + 1) + 8 * v17);
            if (v18)
              v19 = (void *)v18[2];
            else
              v19 = 0;
            v20 = v19;
            objc_msgSend(v20, "predicate");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "token");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "isEqual:", v12);

            if ((v23 & 1) != 0)
            {
              v25 = v18;

              v6 = v29;
              v7 = v30;
              v10 = v28;
              if (!v18)
                goto LABEL_18;
              v26 = (uint64_t)v31;
              goto LABEL_19;
            }
            ++v17;
          }
          while (v15 != v17);
          v24 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
          v15 = v24;
          if (v24)
            continue;
          break;
        }
      }

      v6 = v29;
      v7 = v30;
      v10 = v28;
    }
  }
LABEL_18:
  v26 = (uint64_t)v31;
  -[BKEventDeferringEnvironmentGraph _policyNodeFromCollection:]((uint64_t)v31, v10);
  v25 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
LABEL_19:
    -[BKEventDeferringEnvironmentGraph _chooseSubnodeOfNode:appendToPath:](v26, v25, v7);

  }
  return v7;
}

- (void)setActiveUIResponderTokens:(id)a3 forPID:(int)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *pidToActiveUIResponderTokens;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v4 = *(_QWORD *)&a4;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  BKLogEventDelivery();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v8;
    v14 = 1024;
    v15 = v4;
    _os_log_impl(&dword_1C8914000, v7, OS_LOG_TYPE_DEFAULT, "setActiveUIResponderTokens:%{public}@ forPID:%d", (uint8_t *)&v12, 0x12u);

  }
  v9 = objc_msgSend(v6, "count");
  pidToActiveUIResponderTokens = self->_pidToActiveUIResponderTokens;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    -[NSMutableDictionary setObject:forKey:](pidToActiveUIResponderTokens, "setObject:forKey:", v6, v11);
  else
    -[NSMutableDictionary removeObjectForKey:](pidToActiveUIResponderTokens, "removeObjectForKey:", v11);

  -[BKEventDeferringEnvironmentGraph _reevaluateActiveUIResponderNodesForPID:]((uint64_t)self, v4);
}

- (void)selectDeferringPathForToken:(id)a3
{
  NSMutableSet *v4;
  NSObject *v5;
  uint64_t v6;
  id *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  NSMutableSet *selectedNodeIdentities;
  int v19;
  NSMutableSet *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (NSMutableSet *)a3;
  BKLogEventDelivery();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138543362;
    v20 = v4;
    _os_log_impl(&dword_1C8914000, v5, OS_LOG_TYPE_DEFAULT, "selectDeferringPathForToken:%{public}@", (uint8_t *)&v19, 0xCu);
  }

  -[NSMutableDictionary objectForKey:](self->_tokenToNode, "objectForKey:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (id *)v6;
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[BKEventDeferringEnvironmentGraph _chooseSubnodeOfNode:appendToPath:]((uint64_t)self, v7, v8);
    -[NSObject lastObject](v8, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;

      v7 = v11;
    }
    -[NSMutableSet removeAllObjects](self->_selectedNodeIdentities, "removeAllObjects");
    v12 = 0;
    do
    {
      v13 = v12;
      v14 = v7[2];
      objc_msgSend(v14, "identity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableSet addObject:](self->_selectedNodeIdentities, "addObject:", v12);
      v15 = v7[3];
      objc_msgSend(v15, "firstObject");
      v16 = objc_claimAutoreleasedReturnValue();

      v7 = (id *)v16;
    }
    while (v16);
    BKLogEventDelivery();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      selectedNodeIdentities = self->_selectedNodeIdentities;
      v19 = 138543362;
      v20 = selectedNodeIdentities;
      _os_log_impl(&dword_1C8914000, v17, OS_LOG_TYPE_DEFAULT, "selected nodes now: %{public}@", (uint8_t *)&v19, 0xCu);
    }

  }
  else
  {
    BKLogEventDelivery();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v19 = 138543362;
      v20 = v4;
      _os_log_error_impl(&dword_1C8914000, v8, OS_LOG_TYPE_ERROR, "selection target not found: %{public}@", (uint8_t *)&v19, 0xCu);
    }
  }

}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v3;

  v3 = (id)objc_msgSend(a3, "appendObject:withName:", self->_topLevelInEachProcess, 0);
}

- (void)appendGraphDescription:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = -[NSMutableDictionary count](self->_topLevelInEachProcess, "count");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__BKEventDeferringEnvironmentGraph_appendGraphDescription___block_invoke;
  v7[3] = &unk_1E81F7CF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[BKGraphDescription appendSubnodesWithCount:block:]((uint64_t)v6, v5, v7);

}

- (BOOL)containsDeferringRuleIdentity:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKey:](self->_nodeByIdentity, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)logConnectionDescriptionForDeferringRuleIdentity:(id)a3 toTarget:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  _BOOL4 v33;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  NSMutableDictionary *topLevelInEachProcess;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSMutableOrderedSet *obj;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  void *v68;
  BKEventDeferringEnvironmentGraph *v69;
  NSMutableOrderedSet *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v69 = self;
  -[NSMutableDictionary objectForKey:](self->_nodeByIdentity, "objectForKey:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (_QWORD *)v8;
  v10 = (void *)MEMORY[0x1E0D01750];
  if (v8)
  {
    v11 = *(id *)(v8 + 16);
    objc_msgSend(v10, "descriptionForRootObject:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "writeString:", v12);

    objc_msgSend(v7, "writeString:", CFSTR("\n"));
    v13 = (void *)v9[3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", 0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "writeString:", v59);

    objc_msgSend(v7, "writeString:", CFSTR("\n"));
    v13 = 0;
  }
  v14 = v13;
  objc_msgSend(v14, "bs_map:", &__block_literal_global_30);
  v15 = objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0CB3940];
  v61 = (void *)v15;
  objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("has supernodes %@\n"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "writeString:", v18);

  v62 = v6;
  if (v9)
    v19 = (void *)v9[4];
  else
    v19 = 0;
  v20 = v19;
  objc_msgSend(v20, "bs_map:", &__block_literal_global_34);
  v21 = objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0CB3940];
  v60 = (void *)v21;
  objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("has subnodes %@\n"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v7;
  objc_msgSend(v7, "writeString:", v24);

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  obj = v69->_allNodes;
  v67 = v9;
  v65 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v75, v80, 16);
  if (v65)
  {
    v64 = *(_QWORD *)v76;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v76 != v64)
          objc_enumerationMutation(obj);
        v66 = v25;
        v26 = *(_QWORD **)(*((_QWORD *)&v75 + 1) + 8 * v25);
        v71 = 0u;
        v72 = 0u;
        v73 = 0u;
        v74 = 0u;
        v70 = v69->_allNodes;
        v27 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v70, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v72;
          do
          {
            v30 = 0;
            do
            {
              if (*(_QWORD *)v72 != v29)
                objc_enumerationMutation(v70);
              v31 = *(_QWORD **)(*((_QWORD *)&v71 + 1) + 8 * v30);
              v33 = v26 == v9 || v31 == v9;
              if (v26 != v31 && v33)
              {
                -[BKEventDeferringEnvironmentGraph _matchSubnode:toSupernode:]((uint64_t)v69, *(void **)(*((_QWORD *)&v71 + 1) + 8 * v30), v26);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                if (v35)
                {
                  if (v26)
                    v36 = (void *)v26[2];
                  else
                    v36 = 0;
                  v37 = (void *)MEMORY[0x1E0CB3940];
                  v38 = v36;
                  objc_msgSend(v38, "identity");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v31)
                    v40 = (void *)v31[2];
                  else
                    v40 = 0;
                  v41 = v40;
                  objc_msgSend(v41, "identity");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "stringWithFormat:", CFSTR(" %@  -> %@: %@\n"), v39, v42, v35);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v68, "writeString:", v43);

                  v9 = v67;
                }

              }
              ++v30;
            }
            while (v28 != v30);
            v44 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v70, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
            v28 = v44;
          }
          while (v44);
        }

        v25 = v66 + 1;
      }
      while (v66 + 1 != v65);
      v65 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v75, v80, 16);
    }
    while (v65);
  }

  topLevelInEachProcess = v69->_topLevelInEachProcess;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v62, "pid"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](topLevelInEachProcess, "objectForKey:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "containsObject:", v9);

  v49 = v68;
  if (v48)
  {
    if (v9)
      v50 = (void *)v9[3];
    else
      v50 = 0;
    v51 = v50;
    v52 = objc_msgSend(v51, "count");

    v53 = (void *)MEMORY[0x1E0CB3940];
    if (v9)
    {
      BSProcessDescriptionForPID();
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (v52)
      {
        v55 = (void *)v9[3];
LABEL_45:
        v56 = v55;
        objc_msgSend(v56, "bs_map:", &__block_literal_global_41);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "stringWithFormat:", CFSTR("entrypoint into %@ from %@\n"), v54, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "writeString:", v58);

LABEL_53:
        goto LABEL_54;
      }
    }
    else
    {
      BSProcessDescriptionForPID();
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (v52)
      {
        v55 = 0;
        v9 = v67;
        v49 = v68;
        goto LABEL_45;
      }
      v9 = v67;
      v49 = v68;
    }
    objc_msgSend(v53, "stringWithFormat:", CFSTR("root node in %@\n"), v54);
    v56 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "writeString:", v56);
    goto LABEL_53;
  }
LABEL_54:

}

- (BKSHIDEventDeferringEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenToNode, 0);
  objc_storeStrong((id *)&self->_nodeByIdentity, 0);
  objc_storeStrong((id *)&self->_allNodes, 0);
  objc_storeStrong((id *)&self->_pidToActiveUIResponderTokens, 0);
  objc_storeStrong((id *)&self->_pidToActiveUIResponderNodes, 0);
  objc_storeStrong((id *)&self->_selectedNodeIdentities, 0);
  objc_storeStrong((id *)&self->_topLevelInEachProcess, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

- (const)_matchSubnode:(void *)a3 toSupernode:
{
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = 0;
  if (a1 && v5 != v6)
  {
    if (v6)
      v9 = (void *)v6[2];
    else
      v9 = 0;
    v10 = v9;
    objc_msgSend(v10, "target");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "pid");
    if (v5)
    {
      if (v12 == *((_DWORD *)v5 + 3))
      {
        v13 = (void *)v5[2];
LABEL_8:
        v14 = v13;
        objc_msgSend(v14, "predicate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "token");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "token");
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v17;
        if (v16 || !v17)
        {
          if ((BSEqualObjects() & 1) == 0)
          {
            v8 = CFSTR("no token match");
            goto LABEL_22;
          }
          if (!-[BKEventDeferringNode hasAncestorNode:]((uint64_t)v7, v5))
          {
            v8 = CFSTR("connected");
            goto LABEL_22;
          }
        }
        else
        {
          if (v5)
            v19 = (void *)v5[3];
          else
            v19 = 0;
          v20 = v19;
          v21 = objc_msgSend(v20, "count");

          if (v21)
          {
            v8 = CFSTR("partial match, but there's already a supernode");
LABEL_22:

LABEL_31:
            goto LABEL_32;
          }
          if ((-[BKEventDeferringNode hasAncestorNode:]((uint64_t)v7, v5) & 1) == 0)
          {
            v8 = CFSTR("partial connection");
            goto LABEL_22;
          }
        }
        BKLogEventDelivery();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          if (v7)
            v23 = (void *)v7[2];
          else
            v23 = 0;
          v29 = v23;
          objc_msgSend(v29, "identity");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v5)
            v25 = (void *)v5[2];
          else
            v25 = 0;
          v26 = v25;
          objc_msgSend(v26, "identity");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v31 = v24;
          v32 = 2114;
          v33 = v27;
          _os_log_error_impl(&dword_1C8914000, v22, OS_LOG_TYPE_ERROR, "cycle detected between %{public}@ -> %{public}@", buf, 0x16u);

        }
        v8 = CFSTR("cycle detected");
        goto LABEL_22;
      }
    }
    else if (!v12)
    {
      v13 = 0;
      goto LABEL_8;
    }
    v8 = CFSTR("process doesn't match");
    goto LABEL_31;
  }
LABEL_32:

  return v8;
}

uint64_t __94__BKEventDeferringEnvironmentGraph_logConnectionDescriptionForDeferringRuleIdentity_toTarget___block_invoke_3()
{
  return BSProcessDescriptionForPID();
}

id __94__BKEventDeferringEnvironmentGraph_logConnectionDescriptionForDeferringRuleIdentity_toTarget___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  void *v4;

  if (a2)
    v2 = *(void **)(a2 + 16);
  else
    v2 = 0;
  v3 = v2;
  objc_msgSend(v3, "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __94__BKEventDeferringEnvironmentGraph_logConnectionDescriptionForDeferringRuleIdentity_toTarget___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  void *v4;

  if (a2)
    v2 = *(void **)(a2 + 16);
  else
    v2 = 0;
  v3 = v2;
  objc_msgSend(v3, "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __59__BKEventDeferringEnvironmentGraph_appendGraphDescription___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__BKEventDeferringEnvironmentGraph_appendGraphDescription___block_invoke_2;
  v6[3] = &unk_1E81F7C10;
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void __59__BKEventDeferringEnvironmentGraph_appendGraphDescription___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v5 = *(id **)(a1 + 32);
  v13 = a3;
  objc_msgSend(a2, "intValue");
  BSProcessDescriptionForPID();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKGraphDescription appendNode:](v5, CFSTR("%@"), v7, v8, v9, v10, v11, v12, (uint64_t)v6);

  -[BKEventDeferringEnvironmentGraph _logNodes:toGraphDescription:](*(_QWORD *)(a1 + 40), v13, *(void **)(a1 + 32));
}

- (void)_logNodes:(void *)a3 toGraphDescription:
{
  id v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = objc_msgSend(v5, "count");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65__BKEventDeferringEnvironmentGraph__logNodes_toGraphDescription___block_invoke;
    v8[3] = &unk_1E81F7BE8;
    v9 = v5;
    v10 = v6;
    v11 = a1;
    -[BKGraphDescription appendSubnodesWithCount:block:]((uint64_t)v10, v7, v8);

  }
}

void __65__BKEventDeferringEnvironmentGraph__logNodes_toGraphDescription___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v6);
        -[BKEventDeferringNode appendGraphDescription:](v7, *(void **)(a1 + 40));
        v8 = *(_QWORD *)(a1 + 48);
        if (v7)
          v9 = *(void **)(v7 + 32);
        else
          v9 = 0;
        v10 = v9;
        -[BKEventDeferringEnvironmentGraph _logNodes:toGraphDescription:](v8, v10, *(_QWORD *)(a1 + 40));

        ++v6;
      }
      while (v4 != v6);
      v11 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v4 = v11;
    }
    while (v11);
  }

}

- (void)_chooseSubnodeOfNode:(void *)a3 appendToPath:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  _BYTE *v12;
  id v13;
  _BYTE *v14;
  id v15;
  void *v16;
  id *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = a2;
  v5 = a3;
  v6 = v5;
  if (a1)
  {
    objc_msgSend(v5, "addObject:", v17);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v17[4];
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
          v12 = *(_BYTE **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (v12 && v12[8])
          {
            v14 = v12;

            objc_msgSend(v6, "addObject:", v14);
            goto LABEL_19;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v9)
          continue;
        break;
      }

      if (!v17)
      {
        v13 = 0;
        goto LABEL_16;
      }
    }
    else
    {

    }
    v13 = v17[4];
LABEL_16:
    v15 = v13;
    -[BKEventDeferringEnvironmentGraph _policyNodeFromCollection:](a1, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      -[BKEventDeferringEnvironmentGraph _chooseSubnodeOfNode:appendToPath:](a1, v16, v6);

    v14 = 0;
LABEL_19:

  }
}

- (_QWORD)_policyNodeFromCollection:(uint64_t)a1
{
  id v3;
  void *v4;
  _QWORD *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  uint64_t v17;
  _QWORD *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "firstObject");
    v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 24), "count"))
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v6 = v4;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v7)
      {
        v8 = v7;
        v19 = v5;
        v9 = *(_QWORD *)v21;
LABEL_5:
        v10 = 0;
        while (1)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD **)(*((_QWORD *)&v20 + 1) + 8 * v10);
          v12 = *(void **)(a1 + 24);
          v13 = v11 ? (void *)v11[2] : 0;
          v14 = v13;
          objc_msgSend(v14, "identity");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v12, "containsObject:", v15);

          if (v16)
            break;
          if (v8 == ++v10)
          {
            v17 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
            v8 = v17;
            if (!v17)
            {
              v5 = v19;
              goto LABEL_17;
            }
            goto LABEL_5;
          }
        }
        v5 = v11;

      }
LABEL_17:

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_reevaluateActiveUIResponderNodesForPID:(uint64_t)a1
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (v9)
            *(_BYTE *)(v9 + 8) = 0;
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __76__BKEventDeferringEnvironmentGraph__reevaluateActiveUIResponderNodesForPID___block_invoke;
    v12[3] = &unk_1E81F7B68;
    v12[4] = a1;
    objc_msgSend(v10, "bs_compactMap:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v11, v3);
    }
    else if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v3);
    }

  }
}

id __76__BKEventDeferringEnvironmentGraph__reevaluateActiveUIResponderNodesForPID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKey:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    *(_BYTE *)(v4 + 8) = 1;
  }
  else
  {
    BKLogEventDelivery();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138543362;
      v9 = v3;
      _os_log_error_impl(&dword_1C8914000, v6, OS_LOG_TYPE_ERROR, "no node for active UI responder token %{public}@ (yet?)", (uint8_t *)&v8, 0xCu);
    }

  }
  return v5;
}

id __52__BKEventDeferringEnvironmentGraph_setRules_forPID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if (*((_DWORD *)v3 + 3) != *(_DWORD *)(a1 + 32))
    {
      v7 = 0;
      goto LABEL_6;
    }
    v5 = (void *)*((_QWORD *)v3 + 2);
  }
  else
  {
    v5 = 0;
    v9 = a1;
    v7 = 0;
    if (*(_DWORD *)(v9 + 32))
      goto LABEL_6;
  }
  v6 = v5;
  objc_msgSend(v6, "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v7;
}

BKEventDeferringNode *__52__BKEventDeferringEnvironmentGraph_setRules_forPID___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  BKEventDeferringNode *v7;
  int v8;
  id v9;
  BKEventDeferringNode *v10;
  NSMutableOrderedSet *v11;
  NSMutableOrderedSet *subnodes;
  NSMutableOrderedSet *v13;
  NSMutableOrderedSet *supernodes;
  objc_super v16;

  v4 = a2;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v4, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "containsObject:", v6);

  if ((_DWORD)v5)
  {
    v7 = [BKEventDeferringNode alloc];
    v8 = *(_DWORD *)(a1 + 40);
    v9 = v4;
    if (v7)
    {
      v16.receiver = v7;
      v16.super_class = (Class)BKEventDeferringNode;
      v10 = (BKEventDeferringNode *)objc_msgSendSuper2(&v16, sel_init);
      v7 = v10;
      if (v10)
      {
        v10->_pid = v8;
        objc_storeStrong((id *)&v10->_rule, a2);
        v11 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
        subnodes = v7->_subnodes;
        v7->_subnodes = v11;

        v13 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
        supernodes = v7->_supernodes;
        v7->_supernodes = v13;

      }
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __62__BKEventDeferringEnvironmentGraph__updateNodeTopLevelStatus___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;

  v4 = a3;
  if (a2)
    v5 = *(void **)(a2 + 16);
  else
    v5 = 0;
  v6 = v5;
  if (v4)
    v7 = (void *)v4[2];
  else
    v7 = 0;
  v8 = v7;

  v9 = objc_msgSend(v6, "weightedDeferringRuleCompare:", v8);
  return v9;
}

@end
