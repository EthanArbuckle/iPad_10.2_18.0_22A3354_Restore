@implementation BKHIDEventDeliveryManager

- (id)_lock_resolveEventDescriptor:(void *)a3 senderDescriptor:(void *)a4 transcript:
{
  char v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  id v13;
  char v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  void *v26;
  void *v27;
  int v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  _QWORD *v35;
  id v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id *v45;
  id v46;
  void *v47;
  _QWORD *v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  id *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  id v64;
  void *v65;
  char v66;
  id obj;
  id v68;
  id v69;
  id v70;
  _QWORD *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  _QWORD v81[4];
  id *v82;
  id v83;
  id v84;
  uint64_t v85;
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v70 = a2;
  v69 = a3;
  v68 = a4;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v64 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v70, "hidEventType");
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v80 = a1;
    obj = *(id *)(a1 + 32);
    v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
    if (v75)
    {
      v66 = 0;
      v73 = *(_QWORD *)v88;
      v74 = 1 << v7;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v88 != v73)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD **)(*((_QWORD *)&v87 + 1) + 8 * v8);
          if (v9)
            v10 = v9[6];
          else
            v10 = 0;
          if ((v10 & v74) != 0)
          {
            v77 = v8;
            v11 = v9;
            v12 = v70;
            v13 = v69;
            v78 = v12;
            v14 = objc_msgSend(v12, "hidEventType");
            v76 = v9;
            if (v9)
              v15 = (void *)v11[2];
            else
              v15 = 0;
            v16 = v15;
            v91 = 0u;
            v92 = 0u;
            v93 = 0u;
            v94 = 0u;
            v17 = v16;
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v91, v96, 16);
            if (v18)
            {
              v19 = v18;
              v71 = v11;
              v20 = 1 << v14;
              v21 = *(_QWORD *)v92;
              while (2)
              {
                for (i = 0; i != v19; ++i)
                {
                  if (*(_QWORD *)v92 != v21)
                    objc_enumerationMutation(v17);
                  v23 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
                  v24 = objc_msgSend(v23, "predicateEventTypeMask");
                  if (v24 == 1 || (v24 & v20) != 0)
                  {
                    objc_msgSend(v23, "predicate");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "senderDescriptors");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    v28 = _BKHIDEventSenderMatchesSenderSet(v13, v27, *(void **)(v80 + 16));

                    if (v28 && (objc_msgSend(v26, "specifiesDescriptor:", v78) & 1) != 0)
                    {
                      v29 = v23;

                      goto LABEL_28;
                    }

                  }
                }
                v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v91, v96, 16);
                if (v19)
                  continue;
                break;
              }
              v29 = 0;
LABEL_28:
              v11 = v71;
            }
            else
            {
              v29 = 0;
            }

            if (v29)
            {
              objc_msgSend(v13, "associatedDisplay");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v30)
              {
                objc_msgSend(MEMORY[0x1E0D00CF8], "nullDisplay");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v29, "target");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "deferringEnvironment");
              v32 = objc_claimAutoreleasedReturnValue();
              v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00C90]), "initWithDisplay:environment:", v30, v32);
              if (v76)
                v34 = (void *)v11[4];
              else
                v34 = 0;
              v35 = v11;
              v36 = v34;
              objc_msgSend(v36, "objectForKey:", v33);
              v37 = objc_claimAutoreleasedReturnValue();
              v79 = (void *)v32;
              if (v37)
              {
                v38 = (void *)v37;
                v72 = v33;
              }
              else
              {
                v39 = objc_alloc(MEMORY[0x1E0D00C90]);
                objc_msgSend(MEMORY[0x1E0D00CF8], "nullDisplay");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = objc_msgSend(v39, "initWithDisplay:environment:", v40, v32);

                objc_msgSend(v36, "objectForKey:", v41);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v72 = (void *)v41;
              }
              v42 = v36;
              -[BKEventDeliveryChain resolutionPath]((uint64_t)v38);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "lastObject");
              v44 = (void *)objc_claimAutoreleasedReturnValue();

              if (v44)
              {
                objc_msgSend(v64, "addObject:", v44);
                if (v68)
                {
                  v65 = v31;
                  v45 = (id *)-[BKGraphDescription initWithTopLevelCount:target:]([BKGraphDescription alloc], 1, v68);
                  v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  v47 = (void *)MEMORY[0x1E0CB3940];
                  if (v76)
                  {
                    v48 = v35;
                    v49 = (id)v35[1];
                    objc_msgSend(v47, "stringWithFormat:", CFSTR("%@: %@"), v49, v29);
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v46, "addObject:", v50);

                    v57 = v48[1];
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@"), 0, v29);
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v46, "addObject:", v61);

                    v57 = 0;
                  }
                  -[BKGraphDescription appendNode:](v45, CFSTR("%@"), v51, v52, v53, v54, v55, v56, v57);
                  v81[0] = MEMORY[0x1E0C809B0];
                  v81[1] = 3221225472;
                  v81[2] = __86__BKHIDEventDeliveryManager__lock_resolveEventDescriptor_senderDescriptor_transcript___block_invoke;
                  v81[3] = &unk_1E81F6DE8;
                  v82 = v45;
                  v83 = v38;
                  v84 = v29;
                  v85 = v80;
                  v86 = v46;
                  v58 = v46;
                  v59 = v45;
                  -[BKGraphDescription appendSubnodesWithCount:block:]((uint64_t)v59, 1, v81);
                  objc_msgSend(v68, "writeString:", CFSTR("\nRules: "));
                  objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", v58);
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v68, "writeString:", v60);

                  objc_msgSend(v68, "writeString:", CFSTR("\n\n"));
                  v31 = v65;
                }

              }
              v66 = 1;
            }

            v8 = v77;
          }
          ++v8;
        }
        while (v8 != v75);
        v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
        v75 = v62;
      }
      while (v62);
    }
    else
    {
      v66 = 0;
    }

    if (v68 && (v66 & 1) == 0)
      objc_msgSend(v68, "writeString:", CFSTR("no matching dispatch rules"));
  }
  else
  {
    v64 = 0;
  }

  return v64;
}

- (void)reevaluateBufferingWithContext:(id)a3
{
  BKHIDEventDeliveryManager *v3;
  os_unfair_lock_s *p_lock;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  void *v12;
  id v13;
  unsigned int *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  NSObject *v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  NSObject *v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  NSMutableDictionary *buffersByDispatchTarget;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  void *v56;
  NSObject *v57;
  int v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  id v63;
  BKHIDEventBuffer *v64;
  BKHIDEventBuffer *v65;
  int v66;
  void *v67;
  char v68;
  NSObject *v69;
  NSObject *v70;
  id v71;
  id v72;
  NSObject *v73;
  int v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t k;
  void *v80;
  void *v81;
  int v82;
  NSObject *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  id v89;
  void *v90;
  id v91;
  unint64_t v92;
  NSObject *v93;
  int v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  id v98;
  void *v99;
  _BOOL4 v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  id v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t m;
  void *v115;
  void *v116;
  int v117;
  NSObject *v118;
  id v119;
  os_unfair_lock_t lock;
  NSMutableArray *obj;
  uint64_t v122;
  id v123;
  uint64_t v124;
  uint64_t v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  uint64_t v133;
  uint64_t v134;
  id v135;
  _QWORD *v136;
  uint64_t v137;
  uint64_t v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id *p_isa;
  os_log_t log;
  NSObject *loga;
  id v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  _QWORD *v150;
  id v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  char v155;
  BKHIDEventBufferingHIDSystem *v156;
  uint64_t v157;
  void *v158;
  void *v159;
  id v160;
  id v161;
  id v162;
  id v163;
  uint64_t v164;
  void *v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  uint8_t buf[4];
  void *v175;
  __int16 v176;
  _BYTE v177[14];
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  uint8_t v182[16];
  __int128 v183;
  __int128 v184;
  __int128 v185;
  uint8_t v186[128];
  uint8_t v187[16];
  __int128 v188;
  __int128 v189;
  __int128 v190;
  _BYTE v191[24];
  void *v192;
  id *v193;
  uint8_t v194[4];
  _BYTE v195[18];
  uint64_t v196;

  v3 = self;
  v196 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  v119 = a3;
  os_unfair_lock_lock(p_lock);
  p_isa = (id *)&v3->super.isa;
  lock = p_lock;
  if (v3)
  {
    os_unfair_lock_assert_owner(p_lock);
    v123 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v126 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v128 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v132 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    *(_OWORD *)v182 = 0u;
    v183 = 0u;
    v184 = 0u;
    v185 = 0u;
    obj = v3->_deliveryRoots;
    v124 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", v182, v186, 16);
    if (!v124)
      goto LABEL_67;
    v122 = *(_QWORD *)v183;
    do
    {
      v5 = 0;
      do
      {
        v125 = v5;
        if (*(_QWORD *)v183 != v122)
        {
          objc_enumerationMutation(obj);
          v5 = v125;
        }
        v6 = *(_QWORD *)(*(_QWORD *)&v182[8] + 8 * v5);
        v166 = 0u;
        v167 = 0u;
        v168 = 0u;
        v169 = 0u;
        if (v6)
          v7 = *(void **)(v6 + 32);
        else
          v7 = 0;
        objc_msgSend(v7, "allValues");
        v127 = (id)objc_claimAutoreleasedReturnValue();
        v134 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v166, &v178, 16);
        if (v134)
        {
          v8 = 0;
          v130 = *(id *)v167;
          while (1)
          {
            v9 = 0;
            do
            {
              if (*(id *)v167 != v130)
                objc_enumerationMutation(v127);
              v10 = *(_QWORD **)(*((_QWORD *)&v166 + 1) + 8 * v9);
              v11 = v132;
              v12 = v10;
              v146 = v11;
              v137 = v9;
              v136 = v10;
              if (v10)
                v12 = (void *)v10[4];
              v13 = v12;
              objc_msgSend(v13, "firstObject");
              v14 = (unsigned int *)objc_claimAutoreleasedReturnValue();
              v139 = v8;
              if (v14)
                v15 = v14[3];
              else
                v15 = 0;

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v146, "addObject:", v16);

              -[BSMutableIntegerMap objectForKey:](v3->_bufferingPredicatesByPID, "objectForKey:", (int)v15);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v170 = 0u;
              v171 = 0u;
              v172 = 0u;
              v173 = 0u;
              v141 = v13;
              v148 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v170, v194, 16);
              if (!v148)
              {
                v160 = 0;
                v155 = 0;
                goto LABEL_49;
              }
              v160 = 0;
              v155 = 0;
              log = *(os_log_t *)v171;
              do
              {
                v18 = 0;
                do
                {
                  if (*(os_log_t *)v171 != log)
                    objc_enumerationMutation(v141);
                  v19 = *(_QWORD **)(*((_QWORD *)&v170 + 1) + 8 * v18);
                  if (v19)
                    v19 = (_QWORD *)v19[2];
                  v150 = v19;
                  objc_msgSend(v150, "predicate");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_OWORD *)v187 = 0u;
                  v188 = 0u;
                  v189 = 0u;
                  v190 = 0u;
                  v163 = v17;
                  v21 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", v187, v191, 16);
                  v152 = v18;
                  if (v21)
                  {
                    v22 = v21;
                    v157 = v15;
                    v23 = *(_QWORD *)v188;
                    do
                    {
                      for (i = 0; i != v22; ++i)
                      {
                        if (*(_QWORD *)v188 != v23)
                          objc_enumerationMutation(v163);
                        v25 = *(void **)(*(_QWORD *)&v187[8] + 8 * i);
                        objc_msgSend(v20, "environment");
                        v26 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v20, "display");
                        v27 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v20, "token");
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        v29 = v25;
                        v30 = v27;
                        v31 = v28;
                        v32 = v26;
                        objc_msgSend(v29, "environment");
                        v33 = (void *)objc_claimAutoreleasedReturnValue();
                        v34 = objc_msgSend(v32, "isEqual:", v33);

                        if (v34)
                        {
                          objc_msgSend(v29, "display");
                          v35 = (void *)objc_claimAutoreleasedReturnValue();
                          if (_BKHIDEventDeferringDisplayMatch(v35, v30))
                          {
                            objc_msgSend(v29, "token");
                            v36 = (void *)objc_claimAutoreleasedReturnValue();
                            if (!v36 || BSEqualObjects())
                            {

                              BKLogEventDeliveryBuffering();
                              v37 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                              {
                                *(_DWORD *)buf = 138543618;
                                v175 = v20;
                                v176 = 2114;
                                *(_QWORD *)v177 = v29;
                                _os_log_debug_impl(&dword_1C8914000, v37, OS_LOG_TYPE_DEBUG, "  BUFFER: rule:%{public}@ is match with bufferingPredicate:%{public}@", buf, 0x16u);
                              }

                              v38 = v160;
                              if (!v160)
                              {
                                objc_msgSend(MEMORY[0x1E0C99E20], "set");
                                v38 = (id)objc_claimAutoreleasedReturnValue();
                              }
                              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v157);
                              v39 = objc_claimAutoreleasedReturnValue();
                              v160 = v38;
                              objc_msgSend(v38, "addObject:", v39);
                              v155 = 1;
                              goto LABEL_43;
                            }

                          }
                        }

                        BKLogEventDeliveryBuffering();
                        v39 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 138543618;
                          v175 = v20;
                          v176 = 2114;
                          *(_QWORD *)v177 = v29;
                          _os_log_debug_impl(&dword_1C8914000, v39, OS_LOG_TYPE_DEBUG, "  BUFFER: rule:%{public}@ is NO match with bufferingPredicate:%{public}@", buf, 0x16u);
                        }
LABEL_43:

                      }
                      v22 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", v187, v191, 16);
                    }
                    while (v22);
                  }

                  objc_msgSend(v150, "target");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  v15 = objc_msgSend(v40, "pid");

                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v15);
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v146, "addObject:", v41);

                  v3 = (BKHIDEventDeliveryManager *)p_isa;
                  objc_msgSend(p_isa[10], "objectForKey:", (int)v15);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();

                  v18 = v152 + 1;
                }
                while (v152 + 1 != v148);
                v148 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v170, v194, 16);
              }
              while (v148);
LABEL_49:

              v8 = v160;
              v42 = v136;
              if (v136)
                v42 = (void *)v136[2];
              v43 = v42;
              if (objc_msgSend(v8, "count"))
                objc_msgSend(v128, "setObject:forKey:", v8, v43);
              if ((v155 & 1) != 0)
              {
                objc_msgSend(v126, "addObject:", v43);
                BKLogEventDeliveryBuffering();
                v44 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", v8);
                  v45 = v8;
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v194 = 138543618;
                  *(_QWORD *)v195 = v46;
                  *(_WORD *)&v195[8] = 2114;
                  *(_QWORD *)&v195[10] = v43;
                  _os_log_debug_impl(&dword_1C8914000, v44, OS_LOG_TYPE_DEBUG, "  BUFFER: --> we should buffer this target at the request of %{public}@: %{public}@", v194, 0x16u);

                  v8 = v45;
                }
              }
              else
              {
                BKLogEventDeliveryBuffering();
                v44 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)v194 = 138543362;
                  *(_QWORD *)v195 = v43;
                  _os_log_debug_impl(&dword_1C8914000, v44, OS_LOG_TYPE_DEBUG, "  BUFFER: --> we should NOT buffer this target: %{public}@", v194, 0xCu);
                }
              }

              v9 = v137 + 1;
            }
            while (v137 + 1 != v134);
            v47 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v166, &v178, 16);
            v134 = v47;
            if (!v47)
            {

              break;
            }
          }
        }

        v5 = v125 + 1;
      }
      while (v125 + 1 != v124);
      v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", v182, v186, 16);
      v124 = v48;
    }
    while (v48);
LABEL_67:

    v49 = (void *)objc_msgSend(v126, "mutableCopy");
    buffersByDispatchTarget = v3->_buffersByDispatchTarget;
    if (buffersByDispatchTarget)
    {
      -[NSMutableDictionary allKeys](buffersByDispatchTarget, "allKeys");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "addObjectsFromArray:", v51);

    }
    v52 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v170 = 0u;
    v171 = 0u;
    v172 = 0u;
    v173 = 0u;
    v161 = v49;
    v53 = objc_msgSend(v161, "countByEnumeratingWithState:objects:count:", &v170, v194, 16);
    v158 = v52;
    if (v53)
    {
      v54 = v53;
      v164 = *(_QWORD *)v171;
      do
      {
        for (j = 0; j != v54; ++j)
        {
          if (*(_QWORD *)v171 != v164)
            objc_enumerationMutation(v161);
          v56 = *(void **)(*((_QWORD *)&v170 + 1) + 8 * j);
          BKLogEventDeliveryBuffering();
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
          {
            v74 = objc_msgSend(v126, "containsObject:", v56);
            *(_DWORD *)v191 = 138543618;
            *(_QWORD *)&v191[4] = v56;
            *(_WORD *)&v191[12] = 1024;
            *(_DWORD *)&v191[14] = v74;
            _os_log_debug_impl(&dword_1C8914000, v57, OS_LOG_TYPE_DEBUG, "  BUFFER: --> eval target: %{public}@ enable:%{BOOL}u", v191, 0x12u);
          }

          v58 = objc_msgSend(v126, "containsObject:", v56);
          objc_msgSend(v128, "objectForKey:", v56);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = v56;
          v61 = v59;
          v62 = v123;
          v63 = v52;
          objc_msgSend(p_isa[7], "objectForKey:", v60);
          v64 = (BKHIDEventBuffer *)objc_claimAutoreleasedReturnValue();
          v65 = v64;
          if (v64)
            v66 = 0;
          else
            v66 = v58;
          if ((v58 & 1) != 0 || !v64)
          {
            if ((v66 & 1) != 0)
            {
LABEL_90:
              if (!p_isa[7])
              {
                v71 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                v72 = p_isa[7];
                p_isa[7] = v71;

              }
              v65 = -[BKHIDEventBuffer initWithDispatchTarget:]([BKHIDEventBuffer alloc], "initWithDispatchTarget:", v60);
              objc_msgSend(p_isa[7], "setObject:forKey:", v65, v60);
              -[BKHIDEventBuffer setBufferingPIDs:](v65, "setBufferingPIDs:", v61);
              BKLogEventDeliveryBuffering();
              v73 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v187 = 138543362;
                *(_QWORD *)&v187[4] = v65;
                _os_log_impl(&dword_1C8914000, v73, OS_LOG_TYPE_DEFAULT, "adding buffer %{public}@", v187, 0xCu);
              }

              objc_msgSend(v63, "setObject:forKey:", v65, v60);
            }
            else
            {
              if (!v64)
                goto LABEL_98;
              -[BKHIDEventBuffer setBufferingPIDs:](v64, "setBufferingPIDs:", v61);
            }

            goto LABEL_98;
          }
          objc_msgSend(v62, "addObject:", v64);
          objc_msgSend(p_isa[7], "removeObjectForKey:", v60);
          -[BKHIDEventBuffer bufferingPIDs](v65, "bufferingPIDs");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)v191 = MEMORY[0x1E0C809B0];
          *(_QWORD *)&v191[8] = 3221225472;
          *(_QWORD *)&v191[16] = __109__BKHIDEventDeliveryManager__lock_enableBuffering_dispatchTarget_ownerPIDs_buffersToDrain_targetToNewBuffer___block_invoke;
          v192 = &unk_1E81F6EE0;
          v193 = p_isa;
          v68 = objc_msgSend(v67, "bs_containsObjectPassingTest:", v191);

          if ((v68 & 1) == 0)
          {
            -[BKHIDEventBuffer setAllBufferingClientsTerminated:](v65, "setAllBufferingClientsTerminated:", 1);
            BKLogEventDeliveryBuffering();
            v69 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)v187 = 0;
              _os_log_debug_impl(&dword_1C8914000, v69, OS_LOG_TYPE_DEBUG, "  BUFFER: all clients terminated", v187, 2u);
            }

          }
          BKLogEventDeliveryBuffering();
          v70 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v187 = 138543362;
            *(_QWORD *)&v187[4] = v65;
            _os_log_impl(&dword_1C8914000, v70, OS_LOG_TYPE_DEFAULT, "removing buffer %{public}@", v187, 0xCu);
          }

          v52 = v158;
          if (v66)
            goto LABEL_90;
LABEL_98:

        }
        v54 = objc_msgSend(v161, "countByEnumeratingWithState:objects:count:", &v170, v194, 16);
      }
      while (v54);
    }

    v189 = 0u;
    v190 = 0u;
    *(_OWORD *)v187 = 0u;
    v188 = 0u;
    v75 = v123;
    v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", v187, v191, 16);
    if (v76)
    {
      v77 = v76;
      v78 = *(_QWORD *)v188;
      do
      {
        for (k = 0; k != v77; ++k)
        {
          if (*(_QWORD *)v188 != v78)
            objc_enumerationMutation(v75);
          v80 = *(void **)(*(_QWORD *)&v187[8] + 8 * k);
          objc_msgSend(v80, "bufferingPIDs");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = objc_msgSend(v81, "intersectsSet:", v132);

          BKLogEventDeliveryBuffering();
          v83 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
          {
            v84 = (void *)MEMORY[0x1E0D01750];
            objc_msgSend(v80, "bufferingPIDs");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "descriptionForRootObject:", v85);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", v132);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v175 = v86;
            v176 = 1024;
            *(_DWORD *)v177 = v82;
            *(_WORD *)&v177[4] = 2114;
            *(_QWORD *)&v177[6] = v87;
            _os_log_debug_impl(&dword_1C8914000, v83, OS_LOG_TYPE_DEBUG, "  BUFFER: --> %{public}@ intersects:(%{BOOL}u) %{public}@", buf, 0x1Cu);

          }
          if ((v82 & 1) == 0)
            objc_msgSend(v80, "setAllBufferingClientsTerminated:", 1);
        }
        v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", v187, v191, 16);
      }
      while (v77);
    }

    if (objc_msgSend(v158, "count"))
      v88 = objc_retainAutorelease(v158);
    else
      v88 = 0;
    v3 = (BKHIDEventDeliveryManager *)p_isa;

  }
  else
  {
    v88 = 0;
    v75 = 0;
  }
  v89 = v88;
  os_unfair_lock_unlock(lock);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("reevaluate (%@)"), v119);
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  v131 = v75;
  v91 = v89;
  v129 = v90;
  if (v3)
  {
    os_unfair_lock_assert_not_owner(lock);
    v156 = v3->_bufferingDispatcher;
    v92 = 0x1E0C99000uLL;
    if (objc_msgSend(v131, "count"))
    {
      BKLogEventDeliveryBuffering();
      v93 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
      {
        v94 = objc_msgSend(v131, "count");
        *(_DWORD *)v194 = 67109378;
        *(_DWORD *)v195 = v94;
        *(_WORD *)&v195[4] = 2114;
        *(_QWORD *)&v195[6] = v129;
        _os_log_impl(&dword_1C8914000, v93, OS_LOG_TYPE_DEFAULT, "draining %d buffers (%{public}@)", v194, 0x12u);
      }

    }
    if (objc_msgSend(v91, "count"))
      -[BKHIDEventBufferingHIDSystem bufferingDidAddNewBuffers:](v156, "bufferingDidAddNewBuffers:", v91);
    v180 = 0u;
    v181 = 0u;
    v178 = 0u;
    v179 = 0u;
    v140 = v131;
    v95 = objc_msgSend(v140, "countByEnumeratingWithState:objects:count:", &v178, v194, 16);
    if (v95)
    {
      v96 = v95;
      v97 = *(_QWORD *)v179;
      v133 = *(_QWORD *)v179;
      v135 = v91;
      do
      {
        v98 = 0;
        v138 = v96;
        do
        {
          if (*(_QWORD *)v179 != v97)
            objc_enumerationMutation(v140);
          v99 = *(void **)(*((_QWORD *)&v178 + 1) + 8 * (_QWORD)v98);
          -[BKHIDEventBufferingHIDSystem bufferWillBeginDraining:](v156, "bufferWillBeginDraining:", v99);
          v159 = v99;
          LOBYTE(v99) = objc_msgSend(v99, "hasEvents");
          BKLogEventDeliveryBuffering();
          loga = objc_claimAutoreleasedReturnValue();
          v100 = os_log_type_enabled(loga, OS_LOG_TYPE_DEFAULT);
          if ((v99 & 1) != 0)
          {
            v142 = v98;
            if (v100)
            {
              *(_DWORD *)v182 = 134217984;
              *(_QWORD *)&v182[4] = v159;
              _os_log_impl(&dword_1C8914000, loga, OS_LOG_TYPE_DEFAULT, "BUFFER: --> will drain %p ", v182, 0xCu);
            }

            objc_msgSend(v159, "drainAllEvents");
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v159, "dispatchTarget");
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            v151 = objc_alloc_init(*(Class *)(v92 + 3592));
            v170 = 0u;
            v171 = 0u;
            v172 = 0u;
            v173 = 0u;
            loga = v101;
            v149 = -[NSObject countByEnumeratingWithState:objects:count:](loga, "countByEnumeratingWithState:objects:count:", &v170, v191, 16);
            if (v149)
            {
              v147 = *(_QWORD *)v171;
              do
              {
                v103 = 0;
                do
                {
                  if (*(_QWORD *)v171 != v147)
                    objc_enumerationMutation(loga);
                  v154 = v103;
                  v104 = *(void **)(*((_QWORD *)&v170 + 1) + 8 * v103);
                  v105 = objc_msgSend(v104, "event");
                  objc_msgSend(v104, "additionalContext");
                  v162 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v104, "sender");
                  v165 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v104, "sequence");
                  v106 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v106, "keyCommand");
                  v107 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v151, "objectForKey:", v106);
                  v108 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v108)
                  {
                    objc_msgSend(v165, "senderDescriptor");
                    v109 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v107)
                      objc_msgSend(p_isa, "destinationsForKeyCommand:sender:", v107, v109);
                    else
                      objc_msgSend(p_isa, "destinationsForEvent:sender:", v105, v109);
                    v108 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v151, "setObject:forKey:", v108, v106);
                  }
                  v153 = (void *)v107;
                  v189 = 0u;
                  v190 = 0u;
                  *(_OWORD *)v187 = 0u;
                  v188 = 0u;
                  v110 = v108;
                  v111 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", v187, v186, 16);
                  if (v111)
                  {
                    v112 = v111;
                    v113 = *(_QWORD *)v188;
                    do
                    {
                      for (m = 0; m != v112; ++m)
                      {
                        if (*(_QWORD *)v188 != v113)
                          objc_enumerationMutation(v110);
                        v115 = *(void **)(*(_QWORD *)&v187[8] + 8 * m);
                        objc_msgSend(v115, "dispatchingTarget");
                        v116 = (void *)objc_claimAutoreleasedReturnValue();
                        v117 = objc_msgSend(v116, "isEqual:", v102);

                        if (v117)
                          -[BKHIDEventBufferingHIDSystem buffer:drainEvent:withContext:sender:sequence:toResolution:](v156, "buffer:drainEvent:withContext:sender:sequence:toResolution:", v159, v105, v162, v165, v106, v115);
                      }
                      v112 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", v187, v186, 16);
                    }
                    while (v112);
                  }

                  v103 = v154 + 1;
                }
                while (v154 + 1 != v149);
                v149 = -[NSObject countByEnumeratingWithState:objects:count:](loga, "countByEnumeratingWithState:objects:count:", &v170, v191, 16);
              }
              while (v149);
            }

            BKLogEventDeliveryBuffering();
            v118 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v118, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v182 = 134217984;
              *(_QWORD *)&v182[4] = v159;
              _os_log_debug_impl(&dword_1C8914000, v118, OS_LOG_TYPE_DEBUG, "BUFFER: --> did drain %p", v182, 0xCu);
            }

            v92 = 0x1E0C99000;
            v97 = v133;
            v91 = v135;
            v96 = v138;
            v98 = v142;
          }
          else if (v100)
          {
            *(_DWORD *)v182 = 134217984;
            *(_QWORD *)&v182[4] = v159;
            _os_log_impl(&dword_1C8914000, loga, OS_LOG_TYPE_DEFAULT, "BUFFER: --> %p empty", v182, 0xCu);
          }

          -[BKHIDEventBufferingHIDSystem bufferDidFinishDraining:](v156, "bufferDidFinishDraining:", v159);
          objc_msgSend(v159, "invalidate");
          v98 = (char *)v98 + 1;
        }
        while (v98 != (id)v96);
        v96 = objc_msgSend(v140, "countByEnumeratingWithState:objects:count:", &v178, v194, 16);
      }
      while (v96);
    }

  }
}

- (id)_lock_processDescriptionForPID:(uint64_t)a1
{
  uint64_t v4;
  void *v5;
  id v6;

  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    objc_msgSend(*(id *)(a1 + 88), "objectForKey:", a2);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (!v4 || (v6 = *(id *)(v4 + 16)) == 0)
    {
      BSProcessDescriptionForPID();
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[BKHIDEventDeliveryClient setProcessDescription:]((uint64_t)v5, v6);
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

BOOL __109__BKHIDEventDeliveryManager__lock_enableBuffering_dispatchTarget_ownerPIDs_buffersToDrain_targetToNewBuffer___block_invoke(uint64_t a1, void *a2)
{
  _BYTE *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "objectForKey:", (int)objc_msgSend(a2, "intValue"));
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[8] == 0;
  else
    v3 = 0;

  return v3;
}

- (id)destinationsForEvent:(__IOHIDEvent *)a3 sender:(id)a4
{
  id v7;
  void *v8;
  os_unfair_lock_s *p_lock;
  void *v10;
  unsigned int Type;
  uint64_t IntegerValue;
  uint64_t v14;
  NSObject *v15;
  uint64_t Name;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  BKHIDEventDeliveryManager *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Must have a valid senderDescriptor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138544642;
      v23 = (uint64_t)v19;
      v24 = 2114;
      v25 = v21;
      v26 = 2048;
      v27 = self;
      v28 = 2114;
      v29 = CFSTR("BKHIDEventDeliveryManager.m");
      v30 = 1024;
      v31 = 730;
      v32 = 2114;
      v33 = v18;
      _os_log_error_impl(&dword_1C8914000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v22, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1C891C300);
  }
  v8 = v7;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BKHIDEventDeliveryManager _lock_destinationsForEvent:sender:]((uint64_t)self, (uint64_t)a3, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  Type = IOHIDEventGetType();
  if (Type > 0x1F
    || ((1 << Type) & 0x82309000) == 0
    && (Type != 1
     || (IntegerValue = IOHIDEventGetIntegerValue(), v14 = IOHIDEventGetIntegerValue(), IntegerValue != 65292)
     && (IntegerValue != 65280 || v14 != 59)))
  {
    BKLogEventDelivery();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      IOHIDEventGetType();
      Name = IOHIDEventTypeGetName();
      _BKResolutionDescriptionForLogging(v10, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = Name;
      v24 = 2114;
      v25 = v17;
      _os_log_impl(&dword_1C8914000, v15, OS_LOG_TYPE_DEFAULT, "destinations for %{public}@ event: %{public}@", (uint8_t *)&v22, 0x16u);

    }
  }

  return v10;
}

- (id)_lock_destinationsForEvent:(void *)a3 sender:
{
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  int v15;
  uint64_t Name;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    v6 = *(_QWORD *)(a1 + 40);
    if (((v6 >> IOHIDEventGetType()) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D00CD8], "descriptorForHIDEvent:", a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 104), "objectForKey:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v7);
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
      }
      else
      {
        BKLogEventDeliveryMatching();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          IOHIDEventGetType();
          v15 = 138543362;
          Name = IOHIDEventTypeGetName();
          _os_log_impl(&dword_1C8914000, v11, OS_LOG_TYPE_DEFAULT, "cache miss for %{public}@ event", (uint8_t *)&v15, 0xCu);
        }

        -[BKHIDEventDeliveryManager _lock_resolveEventDescriptor:senderDescriptor:transcript:](a1, v7, v5, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "count"))
        {
          v13 = v12;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E60], "set");
          v13 = (id)objc_claimAutoreleasedReturnValue();
        }
        v10 = v13;
        if (!v8)
        {
          v8 = (void *)objc_opt_new();
          objc_msgSend(*(id *)(a1 + 104), "setObject:forKey:", v8, v5);
        }
        objc_msgSend(v8, "setObject:forKey:", v12, v7);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setEventBufferingPredicates:(id)a3 forClientWithPID:(int)a4
{
  uint64_t v4;
  os_unfair_lock_s *p_lock;
  id v7;

  v4 = *(_QWORD *)&a4;
  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  -[BKHIDEventDeliveryManager _lock_setEventBufferingPredicates:forClientWithPID:]((uint64_t)self, v7, v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_setEventBufferingPredicates:(uint64_t)a3 forClientWithPID:
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  Class isa;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  NSObject *v22;
  int v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    BKLogEventDelivery();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      v25 = a3;
      v26 = 2114;
      v27 = v7;
      _os_log_impl(&dword_1C8914000, v6, OS_LOG_TYPE_DEFAULT, "new buffering predicates for pid:%d: %{public}@", buf, 0x12u);

    }
    objc_msgSend(*(id *)(a1 + 80), "objectForKey:", (int)a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = BSEqualSets();
    BKLogEventDelivery();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        *(_DWORD *)buf = 67109378;
        v25 = a3;
        v26 = 2114;
        v27 = v5;
        _os_log_impl(&dword_1C8914000, v10, OS_LOG_TYPE_DEFAULT, "pid:%d no change to buffering predicates: %{public}@", buf, 0x12u);
      }
    }
    else
    {
      if (v11)
      {
        *(_DWORD *)buf = 67109378;
        v25 = a3;
        v26 = 2114;
        v27 = v5;
        _os_log_impl(&dword_1C8914000, v10, OS_LOG_TYPE_DEFAULT, "pid:%d new buffering predicates: %{public}@", buf, 0x12u);
      }

      v12 = objc_msgSend(v5, "count");
      -[BKHIDEventDeliveryManager _lock_clientWithPID:createIfNeeded:](a1, a3, v12 != 0);
      v13 = objc_claimAutoreleasedReturnValue();
      v10 = v13;
      if (v13)
      {
        v14 = *(id *)(v13 + 64);
        objc_msgSend(v14, "invalidate");
        isa = v10[8].isa;
        v10[8].isa = 0;

      }
      v16 = *(void **)(a1 + 80);
      if (v12)
      {
        objc_msgSend(v16, "setObject:forKey:", v5, (int)a3);
        v17 = objc_alloc(MEMORY[0x1E0D01720]);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BKHIDEventDeliveryManager buffer predicate pid:%d"), a3);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v17, "initWithIdentifier:", v18);

        -[BKHIDEventDeliveryClient setBufferTimer:]((uint64_t)v10, v19);
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __80__BKHIDEventDeliveryManager__lock_setEventBufferingPredicates_forClientWithPID___block_invoke;
        v20[3] = &unk_1E81F6F08;
        v20[4] = a1;
        v23 = a3;
        v21 = v5;
        v22 = v10;
        objc_msgSend(v19, "scheduleWithFireInterval:leewayInterval:queue:handler:", MEMORY[0x1E0C80D38], v20, 8.0, 1.0);

      }
      else
      {
        objc_msgSend(v16, "removeObjectForKey:", (int)a3);
      }
      objc_msgSend(*(id *)(a1 + 120), "requestBufferReevaluationWithContext:", 0);
    }

  }
}

- (void)setDeferringRules:(id)a3 forClientWithPID:(int)a4
{
  os_unfair_lock_s *p_lock;
  id v7;

  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  -[BKHIDEventDeliveryManager _lock_setDeferringRules:forClientWithPID:]((uint64_t)self, v7, a4);

  os_unfair_lock_unlock(p_lock);
}

void __70__BKHIDEventDeliveryManager__lock_setDeferringRules_forClientWithPID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sortedArrayUsingSelector:", sel_weightedDeferringRuleCompare_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_reverse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BKLogEventDelivery();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    v24 = v5;
    v25 = 2114;
    v26 = v6;
    _os_log_impl(&dword_1C8914000, v4, OS_LOG_TYPE_DEFAULT, "new deferring rules for pid:%d: %{public}@", buf, 0x12u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "setObject:forKey:", v3, *(int *)(a1 + 48));
  -[BKHIDEventDeliveryManager _lock_clientWithPID:createIfNeeded:](*(_QWORD *)(a1 + 40), *(_DWORD *)(a1 + 48), 1);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    objc_storeStrong((id *)(v7 + 40), v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "removeAllObjects");
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64);
  v10 = *(unsigned int *)(a1 + 48);
  v11 = v3;
  if (v9)
  {
    v12 = *(void **)(v9 + 16);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v11, v13);

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v14 = *(id *)(v9 + 24);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, buf, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v20;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(v14);
          -[BKEventDeferringGraph _setRules:forPID:toDisplay:](v9, v11, v10, *(void **)(*((_QWORD *)&v19 + 1) + 8 * v18++));
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, buf, 16);
      }
      while (v16);
    }

  }
}

- (id)_lock_clientWithPID:(int)a3 createIfNeeded:
{
  uint64_t v6;
  id *p_isa;
  BOOL v8;
  BKHIDEventDeliveryClient *v9;
  void *v10;

  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    v6 = a2;
    objc_msgSend(*(id *)(a1 + 88), "objectForKey:", a2);
    p_isa = (id *)objc_claimAutoreleasedReturnValue();
    if (p_isa)
      v8 = 1;
    else
      v8 = a3 == 0;
    if (!v8)
    {
      v9 = objc_alloc_init(BKHIDEventDeliveryClient);
      p_isa = (id *)&v9->super.isa;
      if (v9)
      {
        v9->_pid = a2;
        BSProcessDescriptionForPID();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(p_isa + 2, v10);
      }
      else
      {
        BSProcessDescriptionForPID();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(*(id *)(a1 + 88), "setObject:forKey:", p_isa, v6);
    }
  }
  else
  {
    p_isa = 0;
  }
  return p_isa;
}

- (void)_lock_setDeferringRules:(int)a3 forClientWithPID:
{
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  int v9;

  v5 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __70__BKHIDEventDeliveryManager__lock_setDeferringRules_forClientWithPID___block_invoke;
    v6[3] = &unk_1E81F6E78;
    v9 = a3;
    v7 = v5;
    v8 = a1;
    -[BKHIDEventDeliveryManager _lock_notifyObserversForReason:chainsMayUpdate:](a1, CFSTR("setDeferringRules"), v6);
    if (objc_msgSend(*(id *)(a1 + 80), "count"))
      objc_msgSend(*(id *)(a1 + 120), "requestBufferReevaluationWithContext:", 0);

  }
}

- (BKHIDEventDeliveryManager)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKHIDEventDeliveryManager *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BKHIDEventDeliveryManager *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Use initWithObserverService:"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("BKHIDEventDeliveryManager.m");
    v17 = 1024;
    v18 = 287;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1C8914000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKHIDEventDeliveryManager *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (BKHIDEventDeliveryManager)initWithObserverService:(id)a3
{
  id v5;
  BKHIDEventDeliveryManager *v6;
  BKHIDEventDeliveryManager *v7;
  BKEventDeferringGraph *v8;
  BKEventDeferringGraph *deferringGraph;
  uint64_t v10;
  NSMutableArray *deliveryRoots;
  uint64_t v12;
  NSMutableArray *keyCommandDeliveryRoots;
  uint64_t v14;
  BSMutableIntegerMap *clientsByPID;
  uint64_t v16;
  BSMutableIntegerMap *deferringRulesByPID;
  uint64_t v18;
  BSMutableIntegerMap *bufferingPredicatesByPID;
  uint64_t v20;
  NSMutableDictionary *destinationCacheBySender;
  uint64_t v22;
  BKSHIDEventDisplay *mainDisplay;
  objc_super v25;

  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BKHIDEventDeliveryManager;
  v6 = -[BKHIDEventDeliveryManager init](&v25, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    v8 = objc_alloc_init(BKEventDeferringGraph);
    deferringGraph = v7->_deferringGraph;
    v7->_deferringGraph = v8;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    deliveryRoots = v7->_deliveryRoots;
    v7->_deliveryRoots = (NSMutableArray *)v10;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    keyCommandDeliveryRoots = v7->_keyCommandDeliveryRoots;
    v7->_keyCommandDeliveryRoots = (NSMutableArray *)v12;

    v14 = objc_opt_new();
    clientsByPID = v7->_clientsByPID;
    v7->_clientsByPID = (BSMutableIntegerMap *)v14;

    v16 = objc_opt_new();
    deferringRulesByPID = v7->_deferringRulesByPID;
    v7->_deferringRulesByPID = (BSMutableIntegerMap *)v16;

    v18 = objc_opt_new();
    bufferingPredicatesByPID = v7->_bufferingPredicatesByPID;
    v7->_bufferingPredicatesByPID = (BSMutableIntegerMap *)v18;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v20 = objc_claimAutoreleasedReturnValue();
    destinationCacheBySender = v7->_destinationCacheBySender;
    v7->_destinationCacheBySender = (NSMutableDictionary *)v20;

    objc_storeStrong((id *)&v7->_resolutionObserver, a3);
    objc_msgSend(MEMORY[0x1E0D00CF8], "builtinDisplay");
    v22 = objc_claimAutoreleasedReturnValue();
    mainDisplay = v7->_mainDisplay;
    v7->_mainDisplay = (BKSHIDEventDisplay *)v22;

  }
  return v7;
}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  objc_super v4;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  -[BSMutableIntegerMap enumerateWithBlock:](self->_clientsByPID, "enumerateWithBlock:", &__block_literal_global_266);
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)BKHIDEventDeliveryManager;
  -[BKHIDEventDeliveryManager dealloc](&v4, sel_dealloc);
}

- (NSDictionary)currentBuffersPerDispatchTarget
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  v4 = (void *)-[NSMutableDictionary copy](self->_buffersByDispatchTarget, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

- (void)setMainDisplay:(id)a3
{
  BKSHIDEventDisplay *v4;
  os_unfair_lock_s *p_lock;
  BKSHIDEventDisplay **p_mainDisplay;
  BKSHIDEventDisplay *mainDisplay;
  NSObject *v8;
  int v9;
  BKSHIDEventDisplay *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (BKSHIDEventDisplay *)a3;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0D00CF8], "builtinDisplay");
    v4 = (BKSHIDEventDisplay *)objc_claimAutoreleasedReturnValue();
  }
  mainDisplay = self->_mainDisplay;
  p_mainDisplay = &self->_mainDisplay;
  if (mainDisplay != v4)
  {
    BKLogEventDelivery();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = v4;
      _os_log_impl(&dword_1C8914000, v8, OS_LOG_TYPE_DEFAULT, "main display is now: %{public}@", (uint8_t *)&v9, 0xCu);
    }

    objc_storeStrong((id *)p_mainDisplay, v4);
  }
  os_unfair_lock_unlock(p_lock);

}

- (BKSHIDEventDisplay)mainDisplay
{
  os_unfair_lock_s *p_lock;
  BKSHIDEventDisplay *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_mainDisplay;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)processDidTerminate:(int)a3
{
  os_unfair_lock_s *p_lock;
  _BYTE *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  BKEventDeferringGraph *deferringGraph;
  NSMutableDictionary *identityToGraph;
  id v12;
  uint8_t buf[8];
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t, void *);
  void *v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BSMutableIntegerMap objectForKey:](self->_clientsByPID, "objectForKey:", a3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v6 = v12;
    os_unfair_lock_assert_owner(p_lock);
    v7 = *((unsigned int *)v6 + 3);
    BKLogEventDelivery();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v7;
      _os_log_impl(&dword_1C8914000, v8, OS_LOG_TYPE_DEFAULT, "pid:%d terminated", buf, 8u);
    }

    v6[8] = 1;
    v9 = (void *)MEMORY[0x1E0C9AA60];
    -[BKHIDEventDeliveryManager _lock_setDispatchingRoots:forClientWithPID:]((id *)&self->super.isa, MEMORY[0x1E0C9AA60], v7);
    -[BKHIDEventDeliveryManager _lock_setKeyCommandRoots:forClientWithPID:]((uint64_t)self, v9, v7);
    -[BKHIDEventDeliveryManager _lock_setDeferringRules:forClientWithPID:]((uint64_t)self, v9, v7);
    -[BKEventDeferringGraph setActiveUIResponderPredicates:forPID:]((uint64_t)self->_deferringGraph, v9, v7);
    -[BKHIDEventDeliveryManager _lock_setKeyCommandsRegistrations:forClientWithPID:]((uint64_t)self, 0, v7);
    -[BKHIDEventDeliveryManager _lock_setEventBufferingPredicates:forClientWithPID:]((uint64_t)self, 0, v7);
    deferringGraph = self->_deferringGraph;
    if (deferringGraph)
    {
      identityToGraph = deferringGraph->_identityToGraph;
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __45__BKEventDeferringGraph_processDidTerminate___block_invoke;
      v16 = &__block_descriptor_36_e81_v32__0__BKSEventDeferringChainIdentity_8__BKEventDeferringEnvironmentGraph_16_B24l;
      v17 = v7;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](identityToGraph, "enumerateKeysAndObjectsUsingBlock:", buf);
    }
    objc_msgSend(v6, "invalidate");
    -[BSMutableIntegerMap removeObjectForKey:](self->_clientsByPID, "removeObjectForKey:", (int)v7);

  }
  os_unfair_lock_unlock(p_lock);

}

- (void)setDispatchingRoots:(id)a3 forClientWithPID:(int)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v7 = (void *)objc_opt_new();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__BKHIDEventDeliveryManager_setDispatchingRoots_forClientWithPID___block_invoke;
  v10[3] = &unk_1E81F6CB0;
  v8 = v7;
  v11 = v8;
  objc_msgSend(v8, "appendCollection:withName:itemBlock:", v6, 0, v10);
  BKLogEventDelivery();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v13 = a4;
    v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_1C8914000, v9, OS_LOG_TYPE_DEFAULT, "new dispatching rulesets for pid:%d: %{public}@", buf, 0x12u);
  }

  -[BKHIDEventDeliveryManager _lock_setDispatchingRoots:forClientWithPID:]((id *)&self->super.isa, v6, a4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)setKeyCommandRoots:(id)a3 forClientWithPID:(int)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v7 = (void *)objc_opt_new();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__BKHIDEventDeliveryManager_setKeyCommandRoots_forClientWithPID___block_invoke;
  v10[3] = &unk_1E81F6D28;
  v8 = v7;
  v11 = v8;
  objc_msgSend(v8, "appendCollection:withName:itemBlock:", v6, 0, v10);
  BKLogEventDelivery();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v13 = a4;
    v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_1C8914000, v9, OS_LOG_TYPE_DEFAULT, "new key command dispatching rules for pid:%d: %{public}@", buf, 0x12u);
  }

  -[BKHIDEventDeliveryManager _lock_setKeyCommandRoots:forClientWithPID:]((uint64_t)self, v6, a4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)setKeyCommandsRegistrations:(id)a3 forClientWithPID:(int)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  os_unfair_lock_s *lock;
  BKHIDEventDeliveryManager *v27;
  void *v28;
  id obj;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  int v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v27 = self;
  self = (BKHIDEventDeliveryManager *)((char *)self + 8);
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)self);
  lock = (os_unfair_lock_s *)self;
  os_unfair_lock_lock((os_unfair_lock_t)self);
  v28 = (void *)objc_msgSend(v5, "mutableCopy");
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
  if (v6)
  {
    v7 = v6;
    v31 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v37 != v31)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v9, "keyCommands", lock, v27);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
        if (!v12)
        {
          v14 = 0;
          v18 = v11;
          goto LABEL_20;
        }
        v13 = v12;
        v14 = 0;
        v15 = *(_QWORD *)v33;
        do
        {
          for (j = 0; j != v13; ++j)
          {
            if (*(_QWORD *)v33 != v15)
              objc_enumerationMutation(v11);
            v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
            if ((objc_msgSend(v17, "isRoutableKeyCommand") & 1) == 0)
            {
              if (!v14)
                v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
              objc_msgSend(v14, "addObject:", v17);
            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
        }
        while (v13);

        if (v14)
        {
          objc_msgSend(v28, "removeObject:", v9);
          v18 = (void *)objc_msgSend(v11, "mutableCopy");
          objc_msgSend(v18, "minusSet:", v14);
          v19 = (void *)objc_msgSend(v9, "mutableCopy");
          objc_msgSend(v19, "setKeyCommands:", v18);
          objc_msgSend(v28, "addObject:", v19);

          v11 = v19;
LABEL_20:

          v11 = v18;
        }
        objc_msgSend(v9, "deferringEnvironment");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "deferringToken");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "count"))
        {
          BKLogEventDelivery();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x1E0D00D08], "_descriptionForKeyCommandCollection:", v14);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 67109378;
            v41 = a4;
            v42 = 2114;
            v43 = v25;
            _os_log_error_impl(&dword_1C8914000, v22, OS_LOG_TYPE_ERROR, "ignoring non-routable key commands for pid:%d %{public}@", buf, 0x12u);

          }
        }
        BKLogEventDelivery();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x1E0D00D08], "_descriptionForKeyCommandCollection:", v11);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109890;
          v41 = a4;
          v42 = 2114;
          v43 = v20;
          v44 = 2114;
          v45 = v21;
          v46 = 2114;
          v47 = v24;
          _os_log_impl(&dword_1C8914000, v23, OS_LOG_TYPE_DEFAULT, "new key command registrations for pid:%d env:%{public}@ token:%{public}@ %{public}@", buf, 0x26u);

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
    }
    while (v7);
  }

  -[BKHIDEventDeliveryManager _lock_setKeyCommandsRegistrations:forClientWithPID:]((uint64_t)v27, v28, a4);
  os_unfair_lock_unlock(lock);

}

- (id)sequenceForKeyCommand:(id)a3 sender:(id)a4 processor:(id)a5 dispatcher:(id)a6 additionalContext:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  BKHIDEventDeliverySequence *v31;
  NSObject *v32;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  BKHIDEventDeliverySequence *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v13, "senderDescriptorForEventType:", 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKHIDEventDeliveryManager _lock_destinationsForKeyCommand:sender:transcript:]((uint64_t)self, v12, v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = v18;
  if (objc_msgSend(v18, "count"))
  {
    v34 = v15;
    v37 = v12;
    v38 = v16;
    v35 = v14;
    v36 = v13;
    v19 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v20 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v21 = v18;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v41 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v26, "dispatchingTarget");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](self->_buffersByDispatchTarget, "objectForKey:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
          {
            v29 = v20;
            v30 = v28;
          }
          else
          {
            v29 = v19;
            v30 = v26;
          }
          objc_msgSend(v29, "addObject:", v30);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      }
      while (v23);
    }

    v15 = v34;
    v14 = v35;
    v13 = v36;
    v12 = v37;
    v31 = -[BKHIDEventDeliverySequence initWithProcessor:dispatcher:senderInfo:additionalContext:keyCommand:deliveryManager:resolutions:buffers:]([BKHIDEventDeliverySequence alloc], "initWithProcessor:dispatcher:senderInfo:additionalContext:keyCommand:deliveryManager:resolutions:buffers:", v35, v34, v36, v38, v37, self, v19, v20);
    os_unfair_lock_unlock(&self->_lock);
    BKLogEventDelivery();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v45 = v37;
      v46 = 2114;
      v47 = v31;
      _os_log_impl(&dword_1C8914000, v32, OS_LOG_TYPE_DEFAULT, "sequence starting with key command %{public}@: %{public}@", buf, 0x16u);
    }

    v16 = v38;
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    v31 = 0;
  }

  return v31;
}

- (id)sequenceForFirstEvent:(__IOHIDEvent *)a3 sender:(id)a4 processor:(id)a5 dispatcher:(id)a6 additionalContext:(id)a7
{
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  BKHIDEventDeliverySequence *v27;
  NSObject *v28;
  uint64_t Name;
  os_unfair_lock_t lock;
  id v32;
  id v33;
  id v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  BKHIDEventDeliverySequence *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v34 = a5;
  v33 = a6;
  v32 = a7;
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v35 = v12;
  objc_msgSend(v12, "senderDescriptorForEventType:", IOHIDEventGetType());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKHIDEventDeliveryManager _lock_destinationsForEvent:sender:]((uint64_t)self, (uint64_t)a3, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v17 = v14;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v37 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v22, "dispatchingTarget");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](self->_buffersByDispatchTarget, "objectForKey:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v25 = v16;
          v26 = v24;
        }
        else
        {
          v25 = v15;
          v26 = v22;
        }
        objc_msgSend(v25, "addObject:", v26);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v19);
  }

  v27 = -[BKHIDEventDeliverySequence initWithProcessor:dispatcher:senderInfo:additionalContext:keyCommand:deliveryManager:resolutions:buffers:]([BKHIDEventDeliverySequence alloc], "initWithProcessor:dispatcher:senderInfo:additionalContext:keyCommand:deliveryManager:resolutions:buffers:", v34, v33, v35, v32, 0, self, v15, v16);
  os_unfair_lock_unlock(lock);
  BKLogEventDelivery();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    IOHIDEventGetType();
    Name = IOHIDEventTypeGetName();
    *(_DWORD *)buf = 138543618;
    v41 = Name;
    v42 = 2114;
    v43 = v27;
    _os_log_impl(&dword_1C8914000, v28, OS_LOG_TYPE_DEFAULT, "sequence starting with %{public}@ event: %{public}@", buf, 0x16u);
  }

  return v27;
}

- (void)setActiveUIResponders:(id)a3 forClientWithPID:(int)a4
{
  id v6;

  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self)
    -[BKEventDeferringGraph setActiveUIResponderPredicates:forPID:]((uint64_t)self->_deferringGraph, v6, a4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)selectDeferringPredicate:(id)a3 forClientWithPID:(int)a4
{
  os_unfair_lock_s *p_lock;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  BKHIDEventDeliveryManager *v13;
  id v14;

  p_lock = &self->_lock;
  v6 = a3;
  os_unfair_lock_lock(p_lock);
  v7 = v6;
  v8 = v7;
  if (self)
  {
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __77__BKHIDEventDeliveryManager__lock_selectDeferringPredicate_forClientWithPID___block_invoke;
    v12 = &unk_1E81F7CF8;
    v13 = self;
    v14 = v7;
    -[BKHIDEventDeliveryManager _lock_notifyObserversForReason:chainsMayUpdate:]((uint64_t)self, CFSTR("select"), &v9);
    -[NSMutableDictionary removeAllObjects](self->_destinationCacheBySender, "removeAllObjects", v9, v10, v11, v12, v13);

  }
  os_unfair_lock_unlock(p_lock);
}

- (void)forceSelectDeferringTarget:(id)a3 forEnvironment:(id)a4 forClientWithPID:(int)a5
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  os_unfair_lock_unlock(p_lock);
}

- (id)destinationsStartingFromPID:(int)a3 deferringPredicate:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v36;
  void *v37;
  objc_class *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_class *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  id obj;
  id v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint8_t v63[128];
  uint8_t buf[4];
  _BYTE v65[38];
  __int16 v66;
  int v67;
  __int16 v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a3 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("pid > 0"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (objc_class *)objc_opt_class();
      NSStringFromClass(v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      *(_QWORD *)v65 = v37;
      *(_WORD *)&v65[8] = 2114;
      *(_QWORD *)&v65[10] = v39;
      *(_WORD *)&v65[18] = 2048;
      *(_QWORD *)&v65[20] = self;
      *(_WORD *)&v65[28] = 2114;
      *(_QWORD *)&v65[30] = CFSTR("BKHIDEventDeliveryManager.m");
      v66 = 1024;
      v67 = 746;
      v68 = 2114;
      v69 = v36;
      _os_log_error_impl(&dword_1C8914000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v36), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1C89216F4);
  }
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("predicate != ((void *)0)"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (objc_class *)objc_opt_class();
      NSStringFromClass(v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      *(_QWORD *)v65 = v41;
      *(_WORD *)&v65[8] = 2114;
      *(_QWORD *)&v65[10] = v43;
      *(_WORD *)&v65[18] = 2048;
      *(_QWORD *)&v65[20] = self;
      *(_WORD *)&v65[28] = 2114;
      *(_QWORD *)&v65[30] = CFSTR("BKHIDEventDeliveryManager.m");
      v66 = 1024;
      v67 = 747;
      v68 = 2114;
      v69 = v40;
      _os_log_error_impl(&dword_1C8914000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v40), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1C89217F4);
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v49 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v7, "environment");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "display");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = a3;
  -[BSMutableIntegerMap objectForKey:](self->_clientsByPID, "objectForKey:", a3);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8 && (v10 = *(id *)(v8 + 24)) != 0)
  {
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v11 = v10;
    v52 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
    if (v52)
    {
      obj = v11;
      v50 = *(_QWORD *)v59;
      v51 = v9;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v59 != v50)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD **)(*((_QWORD *)&v58 + 1) + 8 * v12);
          v54 = 0u;
          v55 = 0u;
          v56 = 0u;
          v57 = 0u;
          v53 = v12;
          if (v13)
            v13 = (_QWORD *)v13[5];
          v14 = v13;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v55;
            while (2)
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v55 != v17)
                  objc_enumerationMutation(v14);
                objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "lastObject");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "environment");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "environment");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v20, "isEqual:", v21);

                if (v22)
                {
                  objc_msgSend(v7, "token");
                  v23 = objc_claimAutoreleasedReturnValue();
                  if (!v23)
                    goto LABEL_23;
                  v24 = (void *)v23;
                  objc_msgSend(v7, "token");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "token");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v27 = BSEqualObjects();

                  if (v27)
                  {
LABEL_23:
                    objc_msgSend(v49, "addObject:", v19);

                    goto LABEL_24;
                  }
                }

              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
              if (v16)
                continue;
              break;
            }
          }
LABEL_24:

          v12 = v53 + 1;
          v9 = v51;
        }
        while (v53 + 1 != v52);
        v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
      }
      while (v52);
      v11 = obj;
    }
    v28 = v11;
  }
  else
  {
    -[BKHIDEventDeliveryManager _lock_resolveDeferringChainForPID:display:environment:dispatchingTarget:getTargetOrder:]((uint64_t)self, a3, v44, v46, 0, 0);
    v29 = objc_claimAutoreleasedReturnValue();
    if (v29)
      objc_msgSend(v49, "addObject:", v29);
    v30 = (void *)v29;
    BKLogEventDeliveryMatching();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v65 = v30;
      _os_log_debug_impl(&dword_1C8914000, v31, OS_LOG_TYPE_DEBUG, " resolved directly: %{public}@", buf, 0xCu);
    }

    v28 = 0;
    v11 = v30;
  }

  -[BKHIDEventDeliveryManager _lock_processDescriptionForPID:]((uint64_t)self, v45);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  BKLogEventDelivery();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    _BKResolutionDescriptionForLogging(v49, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v65 = v45;
    *(_WORD *)&v65[4] = 2114;
    *(_QWORD *)&v65[6] = v32;
    *(_WORD *)&v65[14] = 2114;
    *(_QWORD *)&v65[16] = v7;
    *(_WORD *)&v65[24] = 2114;
    *(_QWORD *)&v65[26] = v34;
    _os_log_impl(&dword_1C8914000, v33, OS_LOG_TYPE_DEFAULT, "destinations startingFromPID:%d (%{public}@) predicate:%{public}@: %{public}@", buf, 0x26u);

  }
  return v49;
}

- (id)destinationsForKeyCommand:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lock;
  void *v9;
  NSObject *v10;
  void *v11;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  -[BKHIDEventDeliveryManager _lock_destinationsForKeyCommand:sender:transcript:]((uint64_t)self, v6, v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  BKLogEventDelivery();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    _BKResolutionDescriptionForLogging(v9, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v6;
    v15 = 2114;
    v16 = v7;
    v17 = 2114;
    v18 = v11;
    _os_log_impl(&dword_1C8914000, v10, OS_LOG_TYPE_DEFAULT, "destinationsForKeyCommand:%{public}@ sender:%{public}@: %{public}@", (uint8_t *)&v13, 0x20u);

  }
  return v9;
}

- (BKSHIDEventAuthenticationOriginator)authenticationOriginator
{
  os_unfair_lock_s *p_lock;
  BKSHIDEventAuthenticationOriginator *authenticationOriginator;
  BKSHIDEventAuthenticationOriginator *v5;
  BKSHIDEventAuthenticationOriginator *v6;
  BKSHIDEventAuthenticationOriginator *v7;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  authenticationOriginator = self->_authenticationOriginator;
  if (!authenticationOriginator)
  {
    v5 = (BKSHIDEventAuthenticationOriginator *)objc_alloc_init(MEMORY[0x1E0D00CA0]);
    v6 = self->_authenticationOriginator;
    self->_authenticationOriginator = v5;

    authenticationOriginator = self->_authenticationOriginator;
  }
  v7 = authenticationOriginator;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (id)descriptionOfResolutionPathForEventDescriptor:(id)a3 senderDescriptor:(id)a4
{
  id v6;
  id v7;
  BKStringTranscriptTarget *v8;
  id v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  v8 = objc_alloc_init(BKStringTranscriptTarget);
  v9 = -[BKHIDEventDeliveryManager _lock_resolveEventDescriptor:senderDescriptor:transcript:]((uint64_t)self, v6, v7, v8);
  os_unfair_lock_unlock(&self->_lock);
  -[BKStringTranscriptTarget build](v8, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)deliveryGraphDescription
{
  os_unfair_lock_s *p_lock;
  BKStringTranscriptTarget *v4;
  id v5;
  NSMutableArray *deliveryRoots;
  id v7;
  void *v8;
  BKEventDeferringGraph *deferringGraph;
  void *v10;
  NSMutableDictionary *pidToRules;
  BKStringTranscriptTarget *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = objc_alloc_init(BKStringTranscriptTarget);
  -[BKEventDeferringGraph logGraphToTarget:]((uint64_t)self->_deferringGraph, v4);
  v5 = objc_alloc_init(MEMORY[0x1E0D01750]);
  deliveryRoots = self->_deliveryRoots;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __53__BKHIDEventDeliveryManager_deliveryGraphDescription__block_invoke;
  v18[3] = &unk_1E81F6D50;
  v19 = v5;
  v7 = v5;
  objc_msgSend(v7, "appendCollection:withName:itemBlock:", deliveryRoots, 0, v18);
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKStringTranscriptTarget writeString:](v4, "writeString:", v8);

  -[BKStringTranscriptTarget writeString:](v4, "writeString:", CFSTR("\n"));
  deferringGraph = self->_deferringGraph;
  if (deferringGraph)
  {
    v10 = (void *)MEMORY[0x1E0D01750];
    pidToRules = deferringGraph->_pidToRules;
    v12 = v4;
    -[NSMutableDictionary allValues](pidToRules, "allValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bs_flatten");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "descriptionForRootObject:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKStringTranscriptTarget writeString:](v12, "writeString:", v15);

  }
  os_unfair_lock_unlock(p_lock);
  -[BKStringTranscriptTarget build](v4, "build");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)connectionDescriptionForDeferringRuleIdentity:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  BKStringTranscriptTarget *v6;
  BKEventDeferringGraph *deferringGraph;
  id v8;
  BKStringTranscriptTarget *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  BKStringTranscriptTarget *v15;
  BKEventDeferringGraph *v16;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = objc_alloc_init(BKStringTranscriptTarget);
  deferringGraph = self->_deferringGraph;
  v8 = v5;
  v9 = v6;
  if (deferringGraph)
  {
    -[BKEventDeferringGraph _dictionaryWithGraphToIdentityMapping]((uint64_t)deferringGraph);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __83__BKEventDeferringGraph_logConnectionDescriptionForDeferringRuleIdentity_toTarget___block_invoke;
    v13[3] = &unk_1E81F77C0;
    v14 = v8;
    v15 = v9;
    v16 = deferringGraph;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v13);

  }
  os_unfair_lock_unlock(p_lock);
  -[BKStringTranscriptTarget build](v9, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)descriptionOfResolutionPathForKeyCommand:(id)a3 senderDescriptor:(id)a4
{
  id v6;
  id v7;
  BKStringTranscriptTarget *v8;
  BKEventGraphDescriptionAccumulator *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  BKStringTranscriptTarget *v17;
  BKGraphDescription *v18;
  _BKGraphStructureNode *topLevel;
  NSMutableArray *subnodes;
  _QWORD *v21;
  _BKGraphStructureNode *v22;
  _BKGraphStructureNode *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  v8 = objc_alloc_init(BKStringTranscriptTarget);
  v9 = objc_alloc_init(BKEventGraphDescriptionAccumulator);
  -[BKEventGraphDescriptionAccumulator appendNode:]((uint64_t)v9, CFSTR("input key command: %@"), v10, v11, v12, v13, v14, v15, (char)v6);
  v16 = -[BKHIDEventDeliveryManager _lock_destinationsForKeyCommand:sender:transcript:]((uint64_t)self, v6, v7, v9);
  os_unfair_lock_unlock(&self->_lock);
  v17 = v8;
  if (v9)
  {
    v18 = [BKGraphDescription alloc];
    topLevel = v9->_topLevel;
    if (topLevel)
      subnodes = topLevel->_subnodes;
    else
      subnodes = 0;
    v21 = -[BKGraphDescription initWithTopLevelCount:target:](v18, -[NSMutableArray count](subnodes, "count"), v17);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v22 = v9->_topLevel;
    if (v22)
      v22 = (_BKGraphStructureNode *)v22->_subnodes;
    v23 = v22;
    v24 = -[_BKGraphStructureNode countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v31;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v31 != v26)
            objc_enumerationMutation(v23);
          -[BKEventGraphDescriptionAccumulator _recursiveAppendNode:toDescription:]((uint64_t)v9, *(void **)(*((_QWORD *)&v30 + 1) + 8 * v27++), v21);
        }
        while (v25 != v27);
        v25 = -[_BKGraphStructureNode countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v25);
    }

  }
  -[BKStringTranscriptTarget build](v17, "build");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)_test_deliveryRootForIdentifier:(id)a3
{
  id v4;
  NSMutableArray *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_deliveryRoots;
  v6 = (_QWORD *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v8);
        if (v9)
          v10 = v9[1];
        else
          v10 = 0;
        if ((objc_msgSend(v4, "isEqualToString:", v10, (_QWORD)v13) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_15;
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v6 = (_QWORD *)v11;
    }
    while (v11);
  }
LABEL_15:

  return v6;
}

- (void)_fireTimeoutForPID:(int)a3 bufferingPredicates:(id)a4 client:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  _DWORD v12[2];
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  os_unfair_lock_lock(&self->_lock);
  -[BSMutableIntegerMap removeObjectForKey:](self->_bufferingPredicatesByPID, "removeObjectForKey:", a3);
  -[BKHIDEventBufferingHIDSystem requestBufferReevaluationWithContext:](self->_bufferingDispatcher, "requestBufferReevaluationWithContext:", 0);
  os_unfair_lock_unlock(&self->_lock);
  BKLogEventDelivery();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = 67109378;
    v12[1] = a3;
    v13 = 2114;
    v14 = v11;
    _os_log_impl(&dword_1C8914000, v10, OS_LOG_TYPE_DEFAULT, "buffering timed out for pid:%d: %{public}@", (uint8_t *)v12, 0x12u);

  }
  -[BKHIDEventDeliveryClient setBufferTimer:]((uint64_t)v9, 0);

}

- (BKHIDEventDeliveryResolutionObserver)resolutionObserver
{
  return self->_resolutionObserver;
}

- (void)setResolutionObserver:(id)a3
{
  objc_storeStrong((id *)&self->_resolutionObserver, a3);
}

- (BKHIDEventBufferingHIDSystem)bufferingDispatcher
{
  return self->_bufferingDispatcher;
}

- (void)setBufferingDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_bufferingDispatcher, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferingDispatcher, 0);
  objc_storeStrong((id *)&self->_resolutionObserver, 0);
  objc_storeStrong((id *)&self->_destinationCacheBySender, 0);
  objc_storeStrong((id *)&self->_allObserverResolutions, 0);
  objc_storeStrong((id *)&self->_clientsByPID, 0);
  objc_storeStrong((id *)&self->_bufferingPredicatesByPID, 0);
  objc_storeStrong((id *)&self->_deferringRulesByPID, 0);
  objc_storeStrong((id *)&self->_deferringGraph, 0);
  objc_storeStrong((id *)&self->_buffersByDispatchTarget, 0);
  objc_storeStrong((id *)&self->_keyCommandDeliveryRoots, 0);
  objc_storeStrong((id *)&self->_deliveryRoots, 0);
  objc_storeStrong((id *)&self->_authenticationOriginator, 0);
  objc_storeStrong((id *)&self->_mainDisplay, 0);
}

- (id)_lock_destinationsForKeyCommand:(void *)a3 sender:(void *)a4 transcript:
{
  id v7;
  id *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  NSObject *v50;
  uint64_t v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  uint64_t i;
  void *v64;
  char v65;
  void *v66;
  uint64_t v67;
  void *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  int v72;
  NSObject *v73;
  _BOOL4 v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  id v88;
  void *v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t j;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  NSObject *v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  NSObject *v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  void *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  NSObject *v133;
  void *v134;
  void *v135;
  NSObject *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  char v153;
  void *v154;
  void *v155;
  id obj;
  uint64_t v157;
  void *v158;
  uint64_t v159;
  void *v160;
  void *v161;
  uint64_t v162;
  id v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  id v167;
  void *v168;
  void *v169;
  id v170;
  id v171;
  void *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  void *v176;
  void *v177;
  uint64_t v178;
  uint64_t v179;
  id v180;
  void *v181;
  id v182;
  uint64_t v183;
  void *v184;
  uint64_t v185;
  uint64_t v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  uint64_t v191;
  _QWORD v192[4];
  id v193;
  uint64_t v194;
  id v195;
  void *v196;
  void *v197;
  _QWORD v198[4];
  id v199;
  id v200;
  void *v201;
  void *v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  id v215;
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
  _BYTE v228[128];
  _BYTE v229[128];
  _BYTE v230[128];
  _BYTE v231[128];
  uint8_t v232[128];
  uint8_t buf[4];
  _BYTE v234[18];
  uint64_t v235;

  v235 = *MEMORY[0x1E0C80C00];
  v182 = a2;
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    v158 = v7;
    objc_msgSend(v7, "associatedDisplay");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v177)
    {
      objc_msgSend(MEMORY[0x1E0D00CF8], "nullDisplay");
      v177 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v220 = 0u;
    v221 = 0u;
    v222 = 0u;
    v223 = 0u;
    obj = *(id *)(a1 + 48);
    v159 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v220, v232, 16);
    v160 = v9;
    if (v159)
    {
      v157 = *(_QWORD *)v221;
      v178 = (uint64_t)v8;
      v179 = a1;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v221 != v157)
            objc_enumerationMutation(obj);
          v162 = v10;
          v11 = *(_QWORD *)(*((_QWORD *)&v220 + 1) + 8 * v10);
          BKLogEventDeliveryMatching();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)v234 = v11;
            _os_log_debug_impl(&dword_1C8914000, v12, OS_LOG_TYPE_DEBUG, "KCMD: examine root %{public}@", buf, 0xCu);
          }

          if (v8)
          {
            if (v11)
              v19 = *(_QWORD *)(v11 + 8);
            else
              LOBYTE(v19) = 0;
            -[BKEventGraphDescriptionAccumulator appendSubnode:]((uint64_t)v8, CFSTR("key command root: %@"), v13, v14, v15, v16, v17, v18, v19);
          }
          if (v11)
            v20 = *(void **)(v11 + 16);
          else
            v20 = 0;
          v21 = v20;
          objc_msgSend(v21, "predicate");
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v161, "senderDescriptors");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = _BKHIDEventSenderMatchesSenderSet(v158, v22, *(void **)(a1 + 16));

          if (!v23)
            goto LABEL_113;
          objc_msgSend(v21, "targets");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v187 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v169 = (void *)objc_claimAutoreleasedReturnValue();
          v216 = 0u;
          v217 = 0u;
          v218 = 0u;
          v219 = 0u;
          v163 = v24;
          v165 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v216, v231, 16);
          if (!v165)
            goto LABEL_105;
          v164 = *(_QWORD *)v217;
          v170 = v21;
          do
          {
            v25 = 0;
            do
            {
              if (*(_QWORD *)v217 != v164)
                objc_enumerationMutation(v163);
              v166 = v25;
              v26 = *(void **)(*((_QWORD *)&v216 + 1) + 8 * v25);
              BKLogEventDeliveryMatching();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543362;
                *(_QWORD *)v234 = v26;
                _os_log_debug_impl(&dword_1C8914000, v27, OS_LOG_TYPE_DEBUG, "KCMD: examine key command target %{public}@", buf, 0xCu);
              }

              -[BKEventGraphDescriptionAccumulator pushSection](v8);
              v168 = (void *)objc_claimAutoreleasedReturnValue();
              -[BKEventGraphDescriptionAccumulator appendSubnode:]((uint64_t)v8, CFSTR("dispatch target: %@"), v28, v29, v30, v31, v32, v33, (char)v26);
              v34 = objc_msgSend(v26, "pid");
              objc_msgSend(v26, "deferringEnvironment");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v215 = 0;
              v184 = v35;
              v176 = v26;
              v36 = -[BKHIDEventDeliveryManager _lock_resolveDeferringChainForPID:display:environment:dispatchingTarget:getTargetOrder:](a1, v34, v177, v35, v26, &v215);
              v37 = v215;
              v211 = 0u;
              v212 = 0u;
              v213 = 0u;
              v214 = 0u;
              v167 = v37;
              objc_msgSend(v37, "reverseObjectEnumerator");
              v171 = (id)objc_claimAutoreleasedReturnValue();
              v174 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v211, v230, 16);
              if (!v174)
                goto LABEL_102;
              v173 = *(_QWORD *)v212;
              v38 = 0xFFFFFFFFLL;
LABEL_27:
              v39 = 0;
              v40 = v38;
              while (1)
              {
                if (*(_QWORD *)v212 != v173)
                  objc_enumerationMutation(v171);
                v175 = v39;
                v41 = *(void **)(*((_QWORD *)&v211 + 1) + 8 * v39);
                _BKDeferringTargetForResolutionTranscript(v41);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                -[BKEventGraphDescriptionAccumulator appendSubnode:]((uint64_t)v8, CFSTR("%@"), v43, v44, v45, v46, v47, v48, (char)v42);

                -[BKEventGraphDescriptionAccumulator pushSection](v8);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                BKLogEventDeliveryMatching();
                v50 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138543362;
                  *(_QWORD *)v234 = v41;
                  _os_log_debug_impl(&dword_1C8914000, v50, OS_LOG_TYPE_DEBUG, "KCMD: examine deferring target %{public}@", buf, 0xCu);
                }

                v51 = objc_msgSend(v41, "pid");
                if ((_DWORD)v40 != (_DWORD)v51)
                  break;
                BKLogEventDeliveryMatching();
                v52 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138543362;
                  *(_QWORD *)v234 = v41;
                  _os_log_debug_impl(&dword_1C8914000, v52, OS_LOG_TYPE_DEBUG, "KCMD:  dropping prior target %{public}@", buf, 0xCu);
                }

                v38 = v40;
LABEL_96:

                v39 = v175 + 1;
                v40 = v38;
                if (v175 + 1 == v174)
                {
                  v131 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v211, v230, 16);
                  v174 = v131;
                  if (!v131)
                    goto LABEL_102;
                  goto LABEL_27;
                }
              }
              v53 = v51;
              objc_msgSend(*(id *)(a1 + 88), "objectForKey:", (int)v51);
              v54 = objc_claimAutoreleasedReturnValue();
              v172 = (void *)v54;
              if (v54)
                v55 = *(void **)(v54 + 48);
              else
                v55 = 0;
              v188 = v41;
              v56 = v55;
              objc_msgSend(MEMORY[0x1E0D00CA8], "keyboardFocusEnvironment");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v207 = 0u;
              v208 = 0u;
              v209 = 0u;
              v210 = 0u;
              v58 = v56;
              v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v207, v229, 16);
              v183 = v53;
              if (v59)
              {
                v60 = v59;
                v61 = 0;
                v62 = *(_QWORD *)v208;
                do
                {
                  for (i = 0; i != v60; ++i)
                  {
                    if (*(_QWORD *)v208 != v62)
                      objc_enumerationMutation(v58);
                    objc_msgSend(*(id *)(*((_QWORD *)&v207 + 1) + 8 * i), "deferringEnvironment");
                    v64 = (void *)objc_claimAutoreleasedReturnValue();
                    v65 = objc_msgSend(v64, "isEqual:", v57);

                    v61 |= v65 ^ 1;
                  }
                  v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v207, v229, 16);
                }
                while (v60);
              }
              else
              {
                v61 = 0;
              }

              v205 = 0u;
              v206 = 0u;
              v203 = 0u;
              v204 = 0u;
              v180 = v58;
              v66 = v188;
              v186 = objc_msgSend(v180, "countByEnumeratingWithState:objects:count:", &v203, v228, 16);
              if (v186)
              {
                v185 = *(_QWORD *)v204;
                v181 = v49;
                do
                {
                  v67 = 0;
                  do
                  {
                    if (*(_QWORD *)v204 != v185)
                      objc_enumerationMutation(v180);
                    v68 = *(void **)(*((_QWORD *)&v203 + 1) + 8 * v67);
                    BKLogEventDeliveryMatching();
                    v69 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138543618;
                      *(_QWORD *)v234 = v68;
                      *(_WORD *)&v234[8] = 2114;
                      *(_QWORD *)&v234[10] = v182;
                      _os_log_debug_impl(&dword_1C8914000, v69, OS_LOG_TYPE_DEBUG, "KCMD: examine registration %{public}@ looking for %{public}@", buf, 0x16u);
                    }

                    objc_msgSend(v68, "deferringEnvironment");
                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                    v191 = v67;
                    if ((v61 & 1) != 0)
                    {
                      v71 = v68;
                      v72 = objc_msgSend(v184, "isEqual:", v70);
                      BKLogEventDeliveryMatching();
                      v73 = objc_claimAutoreleasedReturnValue();
                      v74 = os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG);
                      if (!v72)
                      {
                        if (v74)
                        {
                          *(_DWORD *)buf = 138543618;
                          *(_QWORD *)v234 = v184;
                          *(_WORD *)&v234[8] = 2114;
                          *(_QWORD *)&v234[10] = v70;
                          _os_log_debug_impl(&dword_1C8914000, v73, OS_LOG_TYPE_DEBUG, "KCMD: environment mismatch want:%{public}@ got:%{public}@", buf, 0x16u);
                        }

                        goto LABEL_89;
                      }
                      if (v74)
                      {
                        *(_DWORD *)buf = 138543362;
                        *(_QWORD *)v234 = v70;
                        _os_log_debug_impl(&dword_1C8914000, v73, OS_LOG_TYPE_DEBUG, "KCMD: environment %{public}@", buf, 0xCu);
                      }

                      -[BKEventGraphDescriptionAccumulator appendSubnode:]((uint64_t)v8, CFSTR("%@"), v75, v76, v77, v78, v79, v80, (char)v70);
                      v68 = v71;
                    }
                    if (v8)
                    {
                      _BKDeferringTargetForResolutionTranscript(v66);
                      v81 = (void *)objc_claimAutoreleasedReturnValue();
                      -[BKEventGraphDescriptionAccumulator appendSubnode:]((uint64_t)v8, CFSTR("target: %@ environment:%@"), v82, v83, v84, v85, v86, v87, (char)v81);

                    }
                    v189 = v70;
                    v88 = v182;
                    v190 = v68;
                    objc_msgSend(v68, "keyCommands");
                    v89 = (void *)objc_claimAutoreleasedReturnValue();
                    v224 = 0u;
                    v225 = 0u;
                    v226 = 0u;
                    v227 = 0u;
                    v90 = v89;
                    v91 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v224, buf, 16);
                    if (v91)
                    {
                      v92 = v91;
                      v93 = 0;
                      v94 = 0;
                      v95 = *(_QWORD *)v225;
                      while (2)
                      {
                        for (j = 0; j != v92; ++j)
                        {
                          if (*(_QWORD *)v225 != v95)
                            objc_enumerationMutation(v90);
                          v97 = *(void **)(*((_QWORD *)&v224 + 1) + 8 * j);
                          v94 |= objc_msgSend(v97, "describes:", v88);
                          if (v94)
                          {
                            v93 = objc_retainAutorelease(v97);
                            if (v94 == 3)
                            {

                              v98 = v93;
                              v8 = (id *)v178;
                              v49 = v181;
                              v100 = v190;
                              BKLogEventDeliveryMatching();
                              v101 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
                              {
                                objc_msgSend(v190, "deferringEnvironment");
                                v102 = (void *)objc_claimAutoreleasedReturnValue();
                                *(_DWORD *)buf = 67109378;
                                *(_DWORD *)v234 = v183;
                                *(_WORD *)&v234[4] = 2114;
                                *(_QWORD *)&v234[6] = v102;
                                _os_log_impl(&dword_1C8914000, v101, OS_LOG_TYPE_DEFAULT, "KCMD: match in pid:%d %{public}@", buf, 0x12u);

                                v100 = v190;
                              }

                              if (v178)
                              {
                                objc_msgSend(v100, "deferringEnvironment");
                                v154 = (void *)objc_claimAutoreleasedReturnValue();
                                -[BKEventGraphDescriptionAccumulator appendSubnode:](v178, CFSTR("complete match in pid:%d %@ [%@]"), v103, v104, v105, v106, v107, v108, v183);

                              }
                              v109 = (void *)MEMORY[0x1E0D00CB0];
                              v192[0] = MEMORY[0x1E0C809B0];
                              v192[1] = 3221225472;
                              v192[2] = __79__BKHIDEventDeliveryManager__lock_destinationsForKeyCommand_sender_transcript___block_invoke_139;
                              v192[3] = &unk_1E81F6D78;
                              v193 = v177;
                              v194 = v179;
                              v195 = v184;
                              v196 = v188;
                              v197 = v176;
                              objc_msgSend(v109, "build:", v192);
                              v110 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v187, "addObject:", v110);

                              v111 = v193;
                              goto LABEL_83;
                            }
                          }
                        }
                        v92 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v224, buf, 16);
                        if (v92)
                          continue;
                        break;
                      }

                      v98 = v93;
                      v8 = (id *)v178;
                      v49 = v181;
                      v99 = v190;
                      if (v94 == 1)
                      {
                        if (v178)
                        {
                          objc_msgSend(v190, "deferringEnvironment");
                          v155 = (void *)objc_claimAutoreleasedReturnValue();
                          -[BKEventGraphDescriptionAccumulator appendSubnode:](v178, CFSTR("partial match in pid:%d %@ [%@]"), v121, v122, v123, v124, v125, v126, v183);

                        }
                        v127 = (void *)MEMORY[0x1E0D00CB0];
                        v198[0] = MEMORY[0x1E0C809B0];
                        v198[1] = 3221225472;
                        v198[2] = __79__BKHIDEventDeliveryManager__lock_destinationsForKeyCommand_sender_transcript___block_invoke;
                        v198[3] = &unk_1E81F71A8;
                        v199 = v177;
                        v200 = v184;
                        v201 = v188;
                        v202 = v176;
                        objc_msgSend(v127, "build:", v198);
                        v128 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v169, "addObject:", v128);

                        v111 = v199;
                        goto LABEL_83;
                      }
                      if (!v94)
                        goto LABEL_79;
                    }
                    else
                    {

                      v98 = 0;
                      v49 = v181;
                      v99 = v68;
LABEL_79:
                      BKLogEventDeliveryMatching();
                      v112 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
                      {
                        objc_msgSend(v99, "deferringEnvironment");
                        v113 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 67109378;
                        *(_DWORD *)v234 = v183;
                        *(_WORD *)&v234[4] = 2114;
                        *(_QWORD *)&v234[6] = v113;
                        _os_log_impl(&dword_1C8914000, v112, OS_LOG_TYPE_DEFAULT, "KCMD: no match in pid:%d %{public}@", buf, 0x12u);

                        v99 = v190;
                      }

                      if (v8)
                      {
                        objc_msgSend(v99, "deferringEnvironment");
                        v111 = (void *)objc_claimAutoreleasedReturnValue();
                        -[BKEventGraphDescriptionAccumulator appendSubnode:]((uint64_t)v8, CFSTR("no match in pid:%d %@"), v114, v115, v116, v117, v118, v119, v183);
LABEL_83:

                      }
                    }
                    v120 = objc_msgSend(v187, "count");

                    v66 = v188;
                    v70 = v189;
                    if (v120)
                    {

                      goto LABEL_95;
                    }
LABEL_89:

                    v67 = v191 + 1;
                  }
                  while (v191 + 1 != v186);
                  v129 = objc_msgSend(v180, "countByEnumeratingWithState:objects:count:", &v203, v228, 16);
                  v186 = v129;
                }
                while (v129);
              }
LABEL_95:

              -[BKEventGraphDescriptionAccumulator popSection:]((uint64_t)v8, v49);
              v130 = objc_msgSend(v187, "count");

              a1 = v179;
              v21 = v170;
              v38 = v183;
              if (!v130)
                goto LABEL_96;

LABEL_102:
              -[BKEventGraphDescriptionAccumulator popSection:]((uint64_t)v8, v168);
              v132 = objc_msgSend(v187, "count");

              if (v132)
                goto LABEL_105;
              v25 = v166 + 1;
            }
            while (v166 + 1 != v165);
            v165 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v216, v231, 16);
          }
          while (v165);
LABEL_105:

          if (objc_msgSend(v187, "count"))
          {
            BKLogEventDeliveryMatching();
            v133 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v133, OS_LOG_TYPE_DEBUG))
            {
              v134 = v187;
              goto LABEL_111;
            }
            v134 = v187;
            _BKResolutionDescriptionForLogging(v187, 0);
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)v234 = v135;
            v136 = v133;
            v137 = "  ->completeDestinations:%{public}@";
LABEL_117:
            _os_log_debug_impl(&dword_1C8914000, v136, OS_LOG_TYPE_DEBUG, v137, buf, 0xCu);

            goto LABEL_111;
          }
          if (objc_msgSend(v169, "count"))
          {
            BKLogEventDeliveryMatching();
            v133 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v133, OS_LOG_TYPE_DEBUG))
            {
              v134 = v169;
              _BKResolutionDescriptionForLogging(v169, 0);
              v135 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)v234 = v135;
              v136 = v133;
              v137 = "  ->partialDestinations:%{public}@";
              goto LABEL_117;
            }
            v134 = v169;
LABEL_111:

            objc_msgSend(v160, "addObjectsFromArray:", v134);
          }

LABEL_113:
          v10 = v162 + 1;
          v9 = v160;
        }
        while (v162 + 1 != v159);
        v138 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v220, v232, 16);
        v159 = v138;
      }
      while (v138);
    }

    v7 = v158;
    if (v8)
    {
      if (objc_msgSend(v9, "count"))
      {
        _BKResolutionDescriptionForLogging(v9, 1);
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        -[BKEventGraphDescriptionAccumulator appendNode:]((uint64_t)v8, CFSTR("complete: %@"), v146, v147, v148, v149, v150, v151, (char)v145);

        v9 = v160;
      }
      else
      {
        -[BKEventGraphDescriptionAccumulator appendNode:]((uint64_t)v8, CFSTR("no matching key commands"), v139, v140, v141, v142, v143, v144, v153);
      }
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_lock_resolveDeferringChainForPID:(void *)a3 display:(void *)a4 environment:(void *)a5 dispatchingTarget:(_QWORD *)a6 getTargetOrder:
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD *v30;
  id v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  if (a1)
  {
    v13 = a5;
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    -[BKEventDeferringGraph deferringPathForPID:environment:display:dispatchTarget:](*(_QWORD *)(a1 + 64), a2, v12, v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "lastObject");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = 0x1E0D00000uLL;
    if (!v15)
      goto LABEL_10;
    v17 = (void *)v15;
    v30 = a6;
    v31 = v12;
    v18 = *(id *)(v15 + 16);
    v19 = objc_alloc_init(MEMORY[0x1E0D00D88]);
    objc_msgSend(v18, "predicate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "environment");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setEnvironment:", v21);

    if (v18)
    {
      objc_msgSend(v18, "target");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "predicate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "display");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
      {
        objc_msgSend(MEMORY[0x1E0D00CF8], "nullDisplay");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v25 = objc_msgSend(v22, "pid", v30);
      objc_msgSend(v19, "setDisplay:", v24);
      objc_msgSend(v19, "setPid:", v25);
      objc_msgSend(v22, "token");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setToken:", v26);

      v16 = 0x1E0D00000;
    }

    a6 = v30;
    v12 = v31;
    if (v19)
    {
      if (v30)
      {
        objc_msgSend(v14, "bs_map:", &__block_literal_global_148);
        *v30 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
LABEL_10:
      v19 = objc_alloc_init(*(Class *)(v16 + 3464));
      if (!v11)
      {
        objc_msgSend(MEMORY[0x1E0D00CF8], "nullDisplay");
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v19, "setEnvironment:", v12, v30);
      objc_msgSend(v19, "setDisplay:", v11);
      objc_msgSend(v19, "setPid:", a2);
      objc_msgSend(v19, "setToken:", 0);
      if (a6)
      {
        v27 = (void *)objc_msgSend(MEMORY[0x1E0D00D90], "new");
        objc_msgSend(v27, "setPid:", a2);
        v32[0] = v27;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    -[BKHIDEventDeliveryManager _lock_processDescriptionForPID:](a1, objc_msgSend(v19, "pid", v30));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setProcessDescription:", v28);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

void __79__BKHIDEventDeliveryManager__lock_destinationsForKeyCommand_sender_transcript___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "setDisplay:", v3);
  objc_msgSend(v5, "setEnvironment:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "setPid:", objc_msgSend(*(id *)(a1 + 48), "pid"));
  objc_msgSend(*(id *)(a1 + 48), "token");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setToken:", v4);

  objc_msgSend(v5, "setDispatchingTarget:", *(_QWORD *)(a1 + 56));
}

void __79__BKHIDEventDeliveryManager__lock_destinationsForKeyCommand_sender_transcript___block_invoke_139(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  if (!v3)
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
  v5 = a2;
  objc_msgSend(v5, "setDisplay:", v3);
  objc_msgSend(v5, "setEnvironment:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v5, "setPid:", objc_msgSend(*(id *)(a1 + 56), "pid"));
  objc_msgSend(*(id *)(a1 + 56), "token");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setToken:", v4);

  objc_msgSend(v5, "setDispatchingTarget:", *(_QWORD *)(a1 + 64));
}

id __116__BKHIDEventDeliveryManager__lock_resolveDeferringChainForPID_display_environment_dispatchingTarget_getTargetOrder___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  void *v4;

  if (a2)
    v2 = *(void **)(a2 + 16);
  else
    v2 = 0;
  v3 = v2;
  objc_msgSend(v3, "target");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __53__BKHIDEventDeliveryManager_deliveryGraphDescription__block_invoke(uint64_t a1, id *a2)
{
  void *v2;
  id *v3;
  id v4;
  id v5;
  id *v6;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    v3 = a2;
    a2 = (id *)a2[2];
    v4 = v3[1];
  }
  else
  {
    v4 = 0;
  }
  v6 = a2;
  v5 = (id)objc_msgSend(v2, "appendObject:withName:", a2, v4);

}

void __86__BKHIDEventDeliveryManager__lock_resolveEventDescriptor_senderDescriptor_transcript___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  id *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;

  v3 = *(id **)(a1 + 32);
  v2 = *(_QWORD **)(a1 + 40);
  if (v2)
    v2 = (_QWORD *)v2[3];
  v4 = v2;
  -[BKGraphDescription appendNode:](v3, CFSTR("%@"), v5, v6, v7, v8, v9, v10, (uint64_t)v4);

  v11 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __86__BKHIDEventDeliveryManager__lock_resolveEventDescriptor_senderDescriptor_transcript___block_invoke_2;
  v15[3] = &unk_1E81F6DE8;
  v16 = v11;
  v17 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 56);
  v14 = *(void **)(a1 + 64);
  v18 = v12;
  v19 = v13;
  v20 = v14;
  -[BKGraphDescription appendSubnodesWithCount:block:]((uint64_t)v16, 1, v15);

}

void __86__BKHIDEventDeliveryManager__lock_resolveEventDescriptor_senderDescriptor_transcript___block_invoke_2(uint64_t a1)
{
  id *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  unint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = *(id **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "target");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKGraphDescription appendNode:](v2, CFSTR("%@"), v4, v5, v6, v7, v8, v9, (uint64_t)v3);

  v10 = *(_QWORD **)(a1 + 48);
  if (v10)
    v10 = (_QWORD *)v10[4];
  v11 = v10;
  v21 = 0;
  -[BKHIDEventDeliveryManager _recursiveAppendNodes:index:toGraphDescription:](*(_QWORD *)(a1 + 56), v11, &v21, *(void **)(a1 + 32));
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(a1 + 64), "addObject:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++));
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v14);
  }

}

- (void)_recursiveAppendNodes:(unint64_t *)a3 index:(void *)a4 toGraphDescription:
{
  id v7;
  id v8;
  unint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  unint64_t *v14;

  v7 = a2;
  v8 = a4;
  if (a1)
  {
    v9 = *a3;
    if (v9 < objc_msgSend(v7, "count"))
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __76__BKHIDEventDeliveryManager__recursiveAppendNodes_index_toGraphDescription___block_invoke;
      v10[3] = &unk_1E81F6DC0;
      v11 = v7;
      v14 = a3;
      v12 = v8;
      v13 = a1;
      -[BKGraphDescription appendSubnodesWithCount:block:]((uint64_t)v12, 1, v10);

    }
  }

}

uint64_t __76__BKHIDEventDeliveryManager__recursiveAppendNodes_index_toGraphDescription___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", **(_QWORD **)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKEventDeferringNode appendGraphDescription:]((uint64_t)v2, *(void **)(a1 + 40));

  ++**(_QWORD **)(a1 + 56);
  return -[BKHIDEventDeliveryManager _recursiveAppendNodes:index:toGraphDescription:](*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __77__BKHIDEventDeliveryManager__lock_selectDeferringPredicate_forClientWithPID___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
  if (v1)
  {
    v2 = (objc_class *)MEMORY[0x1E0D00C90];
    v3 = *(id *)(a1 + 40);
    v4 = [v2 alloc];
    objc_msgSend(v3, "display");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "environment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v4, "initWithDisplay:environment:", v5, v6);

    objc_msgSend(*(id *)(v1 + 8), "objectForKey:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "token");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "selectDeferringPathForToken:", v8);
  }
}

- (void)_lock_notifyObserversForReason:(void *)a3 chainsMayUpdate:
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id *v16;
  id v17;
  id v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  id v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  void (**v43)(void);
  id obj;
  uint64_t v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id *v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  _QWORD v58[5];
  id v59;
  _QWORD v60[4];
  id v61;
  uint64_t v62;
  id v63;
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
  _QWORD v80[5];
  id v81;
  id v82;
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v42 = a2;
  v43 = a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v48 = a1;
  v7 = *(id *)(a1 + 32);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v69;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v69 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * v11);
        if (v12)
          v13 = *(_QWORD *)(v12 + 32);
        else
          v13 = 0;
        objc_msgSend(v5, "addEntriesFromDictionary:", v13);
        ++v11;
      }
      while (v9 != v11);
      v14 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
      v9 = v14;
    }
    while (v14);
  }

  v43[2]();
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = *(id *)(v48 + 32);
  v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v83, 16);
  if (v49)
  {
    v45 = *(_QWORD *)v65;
    v46 = v6;
    v47 = v5;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v65 != v45)
          objc_enumerationMutation(obj);
        v16 = (id *)*(id *)(*((_QWORD *)&v64 + 1) + 8 * v15);
        v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v80[0] = MEMORY[0x1E0C809B0];
        v80[1] = 3221225472;
        v80[2] = __60__BKHIDEventDeliveryManager__lock_rebuildRootDeliveryPaths___block_invoke;
        v80[3] = &unk_1E81F6F30;
        v80[4] = v48;
        v51 = v17;
        v53 = v17;
        v81 = v53;
        v50 = v18;
        v52 = v18;
        v82 = v52;
        v19 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1CAA37E74](v80);
        v54 = v16;
        v55 = v15;
        if (v16)
          v20 = v16[2];
        else
          v20 = 0;
        v21 = v20;
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        v57 = v21;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v77;
          do
          {
            v25 = 0;
            v56 = v23;
            do
            {
              if (*(_QWORD *)v77 != v24)
                objc_enumerationMutation(v57);
              v26 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v25);
              objc_msgSend(v26, "predicate");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "senderDescriptors");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "target");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              if (v29)
              {
                if (v28)
                {
                  v30 = v24;
                  v74 = 0u;
                  v75 = 0u;
                  v72 = 0u;
                  v73 = 0u;
                  v31 = v28;
                  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
                  if (v32)
                  {
                    v33 = v32;
                    v34 = *(_QWORD *)v73;
                    do
                    {
                      for (i = 0; i != v33; ++i)
                      {
                        if (*(_QWORD *)v73 != v34)
                          objc_enumerationMutation(v31);
                        ((void (**)(_QWORD, _QWORD, void *))v19)[2](v19, *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i), v29);
                      }
                      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
                    }
                    while (v33);
                  }

                  v24 = v30;
                  v23 = v56;
                }
                else
                {
                  ((void (**)(_QWORD, _QWORD, void *))v19)[2](v19, 0, v29);
                }
              }

              ++v25;
            }
            while (v25 != v23);
            v23 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
          }
          while (v23);
        }
        if (v54)
        {
          objc_storeStrong(v54 + 4, v51);
          objc_storeStrong(v54 + 5, v50);
        }

        v6 = v46;
        v5 = v47;
        if (v54)
          v36 = v54[4];
        else
          v36 = 0;
        objc_msgSend(v46, "addEntriesFromDictionary:", v36);
        v15 = v55 + 1;
      }
      while (v55 + 1 != v49);
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v83, 16);
      v49 = v37;
    }
    while (v37);
  }

  if ((objc_msgSend(v5, "isEqual:", v6) & 1) == 0)
  {
    v38 = MEMORY[0x1E0C809B0];
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __76__BKHIDEventDeliveryManager__lock_notifyObserversForReason_chainsMayUpdate___block_invoke;
    v60[3] = &unk_1E81F6F58;
    v39 = v5;
    v61 = v39;
    v62 = v48;
    v40 = v42;
    v63 = v40;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v60);
    objc_msgSend(v6, "allKeys");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "removeObjectsForKeys:", v41);

    v58[0] = v38;
    v58[1] = 3221225472;
    v58[2] = __76__BKHIDEventDeliveryManager__lock_notifyObserversForReason_chainsMayUpdate___block_invoke_2;
    v58[3] = &unk_1E81F6F80;
    v58[4] = v48;
    v59 = v40;
    objc_msgSend(v39, "enumerateKeysAndObjectsUsingBlock:", v58);

  }
}

void __76__BKHIDEventDeliveryManager__lock_notifyObserversForReason_chainsMayUpdate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id *v8;
  id *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  _QWORD *v17;
  _QWORD *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id *v28;
  id *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v30 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v30);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BSEqualObjects() & 1) == 0)
  {
    v7 = *(_QWORD *)(a1 + 40);
    v8 = (id *)v5;
    v9 = v8;
    v10 = 0;
    if (v7 && v8)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v28 = v9;
      v12 = v9[4];
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v32 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD **)(*((_QWORD *)&v31 + 1) + 8 * i);
            if (v17)
              v17 = (_QWORD *)v17[2];
            v18 = v17;
            objc_msgSend(v18, "target");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v19);

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        }
        while (v14);
      }
      objc_msgSend(v12, "lastObject", v28);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      if (v20)
        v22 = *(void **)(v20 + 16);
      else
        v22 = 0;
      v23 = v22;
      objc_msgSend(v23, "predicate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "display");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = objc_alloc(MEMORY[0x1E0D00CC0]);
      v27 = v29[1];
      v10 = (void *)objc_msgSend(v26, "initWithIdentity:compatibilityDisplay:path:", v27, v25, v11);

      v9 = v29;
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "deliveryChainDidUpdate:forIdentity:reason:", v10, v30, *(_QWORD *)(a1 + 48));
  }

}

uint64_t __76__BKHIDEventDeliveryManager__lock_notifyObserversForReason_chainsMayUpdate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "deliveryChainDidUpdate:forIdentity:reason:", 0, a2, *(_QWORD *)(a1 + 40));
}

void __60__BKHIDEventDeliveryManager__lock_rebuildRootDeliveryPaths___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BKEventDeliveryChain *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  BKSEventDeferringChainIdentity *identity;
  void *v20;
  BKSEventDeferringChainIdentity *v21;
  BKSEventDeferringChainIdentity *v22;
  void *v23;
  id v24;
  objc_super v25;

  v6 = a2;
  v7 = a3;
  objc_msgSend(v7, "deferringEnvironment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "pid");
  objc_msgSend(v6, "associatedDisplay");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0D00CF8], "nullDisplay");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[BKEventDeferringGraph deferringPathForPID:environment:display:dispatchTarget:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), v9, v8, v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = [BKEventDeliveryChain alloc];
  v13 = v10;
  v14 = v8;
  v15 = v7;
  v24 = v6;
  v16 = v11;
  if (v12
    && (v25.receiver = v12,
        v25.super_class = (Class)BKEventDeliveryChain,
        (v12 = (BKEventDeliveryChain *)objc_msgSendSuper2(&v25, sel_init)) != 0))
  {
    v17 = v13;
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0D00CF8], "nullDisplay");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0D00C90]), "initWithDisplay:environment:", v17, v14);
    identity = v12->_identity;
    v12->_identity = (BKSEventDeferringChainIdentity *)v18;

    objc_storeStrong((id *)&v12->_dispatchTarget, a3);
    objc_storeStrong((id *)&v12->_senderDescriptor, a2);
    objc_storeStrong((id *)&v12->_deferringPath, v11);
  }
  else
  {
    v17 = v13;
  }

  v20 = *(void **)(a1 + 40);
  if (v12)
    v21 = v12->_identity;
  else
    v21 = 0;
  v22 = v21;
  objc_msgSend(v20, "setObject:forKey:", v12, v22);

  -[BKEventDeliveryChain resolutionPath]((uint64_t)v12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v23);

}

void __80__BKHIDEventDeliveryManager__lock_setEventBufferingPredicates_forClientWithPID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v2 = *(unsigned int *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = a2;
  objc_msgSend(v3, "_fireTimeoutForPID:bufferingPredicates:client:", v2, v4, v5);
  objc_msgSend(v6, "invalidate");

}

- (void)_lock_setKeyCommandsRegistrations:(int)a3 forClientWithPID:
{
  const os_unfair_lock *v6;
  id v7;
  id *v8;

  if (a1)
  {
    v6 = (const os_unfair_lock *)(a1 + 8);
    v7 = a2;
    os_unfair_lock_assert_owner(v6);
    -[BKHIDEventDeliveryManager _lock_clientWithPID:createIfNeeded:](a1, a3, 1);
    v8 = (id *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_storeStrong(v8 + 6, a2);

  }
}

void __65__BKHIDEventDeliveryManager_setKeyCommandRoots_forClientWithPID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "reason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_stringRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__BKHIDEventDeliveryManager_setKeyCommandRoots_forClientWithPID___block_invoke_2;
  v8[3] = &unk_1E81F6D00;
  v9 = v3;
  v10 = *(id *)(a1 + 32);
  v7 = v3;
  objc_msgSend(v4, "appendCustomFormatWithName:block:", v6, v8);

}

- (void)_lock_setKeyCommandRoots:(int)a3 forClientWithPID:
{
  const os_unfair_lock *v5;
  id v6;
  uint64_t v7;
  id *v8;
  id v9;
  id obj;

  if (a1)
  {
    v5 = (const os_unfair_lock *)(a1 + 8);
    v6 = a2;
    os_unfair_lock_assert_owner(v5);
    objc_msgSend(v6, "bs_map:", &__block_literal_global_171);
    obj = (id)objc_claimAutoreleasedReturnValue();

    -[BKHIDEventDeliveryManager _lock_clientWithPID:createIfNeeded:](a1, a3, 1);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (id *)v7;
    if (v7)
    {
      v9 = *(id *)(v7 + 32);
      if (v9)
        objc_msgSend(*(id *)(a1 + 48), "removeObjectsInArray:", v9);
      objc_storeStrong(v8 + 4, obj);
    }
    else
    {
      v9 = 0;
    }
    if (objc_msgSend(obj, "count"))
      objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", obj);

  }
}

_BKHIDKeyCommandDeliveryRoot *__71__BKHIDEventDeliveryManager__lock_setKeyCommandRoots_forClientWithPID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BKHIDKeyCommandDeliveryRoot *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  void *v9;

  v2 = a2;
  v3 = objc_alloc_init(_BKHIDKeyCommandDeliveryRoot);
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_msgSend(v2, "seed");
  objc_msgSend(v2, "reason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%u-%@"), v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_setProperty_nonatomic_copy(v3, v7, v8, 8);

  objc_msgSend(v2, "rule");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_storeStrong((id *)&v3->_dispatchingRule, v9);

  return v3;
}

void __65__BKHIDEventDeliveryManager_setKeyCommandRoots_forClientWithPID___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "rule");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicate");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "senderDescriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _BKDescribeSenderSet(*(void **)(a1 + 40), v3);
  v4 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "rule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "targets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__BKHIDEventDeliveryManager_setKeyCommandRoots_forClientWithPID___block_invoke_3;
  v8[3] = &unk_1E81F6CD8;
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v4, "appendCollection:withName:itemBlock:", v6, CFSTR("targets"), v8);

}

id __65__BKHIDEventDeliveryManager_setKeyCommandRoots_forClientWithPID___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", a2, 0, 0);
}

void __66__BKHIDEventDeliveryManager_setDispatchingRoots_forClientWithPID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "rules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_stringRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__BKHIDEventDeliveryManager_setDispatchingRoots_forClientWithPID___block_invoke_2;
  v8[3] = &unk_1E81F6C88;
  v9 = *(id *)(a1 + 32);
  objc_msgSend(v3, "appendCollection:withName:itemBlock:", v5, v7, v8);

}

- (void)_lock_setDispatchingRoots:(int)a3 forClientWithPID:
{
  const os_unfair_lock *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id *v20;
  id v21;
  id v22;

  if (a1)
  {
    v5 = (const os_unfair_lock *)(a1 + 1);
    v6 = a2;
    os_unfair_lock_assert_owner(v5);
    objc_msgSend(v6, "bs_map:", &__block_literal_global_160);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[BKHIDEventDeliveryManager _lock_clientWithPID:createIfNeeded:]((uint64_t)a1, a3, 1);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = *(void **)(v8 + 24);
    else
      v10 = 0;
    v11 = v10;
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __72__BKHIDEventDeliveryManager__lock_setDispatchingRoots_forClientWithPID___block_invoke_2;
    v18 = &unk_1E81F6E50;
    v12 = v11;
    v19 = v12;
    v20 = a1;
    v13 = v9;
    v21 = v13;
    v14 = v7;
    v22 = v14;
    -[BKHIDEventDeliveryManager _lock_notifyObserversForReason:chainsMayUpdate:]((uint64_t)a1, CFSTR("setDispatchingRoots"), &v15);
    objc_msgSend(a1[13], "removeAllObjects", v15, v16, v17, v18);
    if (objc_msgSend(a1[10], "count"))
      objc_msgSend(a1[15], "requestBufferReevaluationWithContext:", 0);

  }
}

void __72__BKHIDEventDeliveryManager__lock_setDispatchingRoots_forClientWithPID___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  uint64_t v40;
  void *v41;
  id obj;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  id *location;
  _QWORD *v50;
  id v51;
  void *v52;
  id v53;
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
  _QWORD v66[6];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v1 = a1;
  v80 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "removeObjectsInArray:");
  v2 = *(_QWORD *)(v1 + 48);
  if (v2)
    objc_storeStrong((id *)(v2 + 24), *(id *)(v1 + 56));
  if (objc_msgSend(*(id *)(v1 + 56), "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 40) + 32), "addObjectsFromArray:", *(_QWORD *)(v1 + 56));
  *(_QWORD *)(*(_QWORD *)(v1 + 40) + 40) = 0;
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = *(id *)(*(_QWORD *)(v1 + 40) + 32);
  v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v77, 16);
  if (v45)
  {
    v43 = *(_QWORD *)v63;
    v44 = v1;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v63 != v43)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD **)(*((_QWORD *)&v62 + 1) + 8 * v4);
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v46 = v5;
        if (v5)
          v5 = (_QWORD *)v5[2];
        v47 = v4;
        v50 = v5;
        v6 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v58, v76, 16);
        if (v6)
        {
          v7 = v6;
          v8 = 0;
          v9 = *(_QWORD *)v59;
          v48 = *(_QWORD *)v59;
          do
          {
            v10 = 0;
            location = (id *)v7;
            do
            {
              if (*(_QWORD *)v59 != v9)
                objc_enumerationMutation(v50);
              v11 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v10);
              objc_msgSend(v11, "predicate");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "senderDescriptors");
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v13, "count"))
              {
                v52 = v11;
                v56 = 0u;
                v57 = 0u;
                v54 = 0u;
                v55 = 0u;
                v14 = v13;
                v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v54, v75, 16);
                if (v15)
                {
                  v16 = v15;
                  v17 = *(_QWORD *)v55;
                  do
                  {
                    for (i = 0; i != v16; ++i)
                    {
                      if (*(_QWORD *)v55 != v17)
                        objc_enumerationMutation(v14);
                      objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "associatedDisplay");
                      v19 = (void *)objc_claimAutoreleasedReturnValue();
                      if (!v19)
                      {
                        objc_msgSend(MEMORY[0x1E0D00CF8], "nullDisplay");
                        v19 = (void *)objc_claimAutoreleasedReturnValue();
                      }
                      objc_msgSend(v3, "addObject:", v19);

                    }
                    v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v54, v75, 16);
                  }
                  while (v16);
                  v9 = v48;
                  v7 = (uint64_t)location;
                }
                v11 = v52;
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0D00CF8], "nullDisplay");
                v14 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "addObject:", v14);
              }

              v8 |= objc_msgSend(v11, "predicateEventTypeMask");
              ++v10;
            }
            while (v10 != v7);
            v7 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v58, v76, 16);
          }
          while (v7);
        }
        else
        {
          v8 = 0;
        }

        if ((v8 & 1) != 0)
          v20 = -1;
        else
          v20 = v8;
        if (v46)
          v46[6] = v20;
        v1 = v44;
        *(_QWORD *)(*(_QWORD *)(v44 + 40) + 40) |= v20;
        v4 = v47 + 1;
      }
      while (v47 + 1 != v45);
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v77, 16);
    }
    while (v45);
  }

  v21 = *(_QWORD *)(*(_QWORD *)(v1 + 40) + 64);
  v51 = v3;
  if (v21)
  {
    v22 = (void *)objc_msgSend(*(id *)(v21 + 24), "mutableCopy");
    v23 = v22;
    if (v22)
      objc_msgSend(v22, "minusSet:", v51);
    v53 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v24 = *(id *)(v21 + 8);
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v72;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v72 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * j);
          objc_msgSend(v29, "display");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v23, "containsObject:", v30);

          if (v31)
            objc_msgSend(v53, "addObject:", v29);
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
      }
      while (v26);
    }

    objc_msgSend(*(id *)(v21 + 8), "removeObjectsForKeys:", v53);
    v32 = (void *)objc_msgSend(v51, "mutableCopy");
    v33 = v32;
    if (*(_QWORD *)(v21 + 24))
      objc_msgSend(v32, "minusSet:");
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v34 = v33;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v68;
      v38 = MEMORY[0x1E0C809B0];
      do
      {
        for (k = 0; k != v36; ++k)
        {
          if (*(_QWORD *)v68 != v37)
            objc_enumerationMutation(v34);
          v40 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * k);
          v41 = *(void **)(v21 + 16);
          v66[0] = v38;
          v66[1] = 3221225472;
          v66[2] = __43__BKEventDeferringGraph_setSenderDisplays___block_invoke;
          v66[3] = &unk_1E81F78B0;
          v66[4] = v21;
          v66[5] = v40;
          objc_msgSend(v41, "enumerateKeysAndObjectsUsingBlock:", v66);
        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
      }
      while (v36);
    }

    objc_storeStrong((id *)(v21 + 24), v3);
  }

}

_BKHIDEventDeliveryRoot *__72__BKHIDEventDeliveryManager__lock_setDispatchingRoots_forClientWithPID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BKHIDEventDeliveryRoot *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  void *v9;

  v2 = a2;
  v3 = objc_alloc_init(_BKHIDEventDeliveryRoot);
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_msgSend(v2, "seed");
  objc_msgSend(v2, "reason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%u-%@"), v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_setProperty_nonatomic_copy(v3, v7, v8, 8);

  objc_msgSend(v2, "rules");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_storeStrong((id *)&v3->_dispatchingRules, v9);

  return v3;
}

void __66__BKHIDEventDeliveryManager_setDispatchingRoots_forClientWithPID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "predicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "senderDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _BKDescribeSenderSet(*(void **)(a1 + 32), v5);
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v4, "descriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v7;
  if (objc_msgSend(v9, "count"))
  {
    v21 = v8;
    v22 = v5;
    v23 = v3;
    v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v28;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v15), "hidEventType"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v13);
    }

    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = ___BKDescribeEventDescriptors_block_invoke;
    v24[3] = &unk_1E81F7CF8;
    v8 = v21;
    v25 = v21;
    v26 = v10;
    v17 = v10;
    objc_msgSend(v25, "sameLine:", v24);

    v5 = v22;
    v3 = v23;
  }

  objc_msgSend(*(id *)(a1 + 32), "appendRightArrow");
  v18 = *(void **)(a1 + 32);
  objc_msgSend(v3, "target");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v18, "appendObject:withName:skipIfNil:", v19, 0, 0);

}

uint64_t __36__BKHIDEventDeliveryManager_dealloc__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "invalidate");
}

@end
