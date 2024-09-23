@implementation NSFetchedResultsController

- (NSArray)sections
{
  void *v2;
  NSArray *v3;

  v2 = (void *)-[NSMutableOrderedSet copy](self->_sections, "copy");
  v3 = (NSArray *)objc_msgSend(v2, "array");

  return v3;
}

uint64_t __72__NSFetchedResultsController__recursivePerformBlockAndWait_withContext___block_invoke(_QWORD *a1)
{
  if (a1[4])
    return -[NSFetchedResultsController _recursivePerformBlockAndWait:withContext:](a1[5], a1[6]);
  else
    return (*(uint64_t (**)(void))(a1[6] + 16))();
}

_QWORD *__82__NSFetchedResultsController_PrivateMethods___core_managedObjectContextDidChange___block_invoke(_QWORD *result)
{
  uint64_t v1;
  _QWORD *v2;
  char isKindOfClass;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  id v7;
  _QWORD *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  char *v21;
  _PFArray *v22;
  _PFBatchFaultingArray *v23;
  uint64_t *v24;
  _QWORD *v25;
  void *v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  _PFChangeInfo *v41;
  uint64_t v42;
  void *v43;
  const __CFString *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  int v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t i;
  uint64_t v64;
  uint64_t v65;
  uint64_t j;
  _QWORD *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t k;
  _QWORD *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t m;
  void *v76;
  uint64_t updated;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  _QWORD *v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  _QWORD *v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  int v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  _QWORD *v114;
  void *v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  _QWORD *v122;
  void *v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  id *v130;
  void *v131;
  uint64_t v132;
  uint64_t v133;
  id v134;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  id v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t n;
  uint64_t v144;
  void *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  _QWORD *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t ii;
  uint64_t v157;
  void *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  _QWORD *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  _QWORD *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  _QWORD *v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  const __CFString *v184;
  __CFString *v185;
  id v186;
  id v187;
  id v188;
  id v189;
  void *v190;
  void *v191;
  id v192;
  void *v193;
  _QWORD *v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
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
  _QWORD v215[5];
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
  __int128 v229;
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
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  _BYTE v260[128];
  _BYTE v261[128];
  _BYTE v262[128];
  _BYTE v263[128];
  _BYTE v264[128];
  _BYTE v265[128];
  _BYTE v266[128];
  _BYTE v267[128];
  _BYTE v268[128];
  _BYTE v269[128];
  _BYTE v270[128];
  _BYTE v271[128];
  _BYTE v272[128];
  _BYTE v273[128];
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  uint64_t v278[20];

  v278[17] = *MEMORY[0x1E0C80C00];
  v194 = result;
  v1 = result[4];
  if (!*(_QWORD *)(v1 + 96) || !*(_QWORD *)(v1 + 104))
    return result;
  v2 = v194;
  if (!objc_msgSend((id)v194[5], "objectForKey:", CFSTR("invalidatedAll")))
  {
    v7 = (id)v194[4];
    v186 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    v190 = (void *)objc_msgSend((id)v194[4], "delegate");
    if (!v190)
    {
      v8 = (_QWORD *)v194[4];
      if (v8[10])
        objc_msgSend(v8, "setDelegate:", 0);
    }
    v9 = v190;
    v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v189 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v192 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v187 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v188 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v11 = objc_msgSend(*(id *)(v194[4] + 8), "predicate");
    v12 = *(void **)(v194[4] + 56);
    if ((void *)v11 != v12)
    {
      v13 = (void *)v11;

      *(_QWORD *)(v194[4] + 56) = v13;
      if (v13)
        v14 = -[_NSMemoryStorePredicateRemapper createPredicateForFetchFromPredicate:withContext:](+[_NSMemoryStorePredicateRemapper defaultInstance](_NSMemoryStorePredicateRemapper, "defaultInstance"), "createPredicateForFetchFromPredicate:withContext:", v13, *(_QWORD *)(v2[4] + 16));
      else
        v14 = 0;
      *(_QWORD *)(v2[4] + 48) = v14;
    }
    v193 = v10;
    v31 = (void *)v2[5];
    v185 = CFSTR("inserted_objectIDs");
    v32 = (void *)objc_msgSend(v31, "objectForKey:");
    v33 = (void *)v2[5];
    v184 = CFSTR("updated_objectIDs");
    v191 = (void *)objc_msgSend((id)objc_msgSend(v33, "objectForKey:"), "mutableCopy");
    v34 = v2[4];
    if (v34)
    {
      v277 = 0u;
      v276 = 0u;
      v275 = 0u;
      v274 = 0u;
      v35 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v274, v278, 16);
      if (v35)
      {
        v36 = *(_QWORD *)v275;
        do
        {
          v37 = 0;
          do
          {
            if (*(_QWORD *)v275 != v36)
              objc_enumerationMutation(v32);
            v38 = *(void **)(*((_QWORD *)&v274 + 1) + 8 * v37);
            v39 = (void *)MEMORY[0x18D76B4E4]();
            if (_objectIDEntityAffectsResults(v34, v38))
            {
              if (-[NSFetchedResultsController _indexOfFetchedID:isManagedObjectID:](v34, v38, 1) == 0x7FFFFFFFFFFFFFFFLL)
              {
                v40 = (void *)objc_msgSend(*(id *)(v34 + 16), "objectWithID:", v38);
                if (-[NSFetchedResultsController _objectInResults:](v34, v40))
                {
                  v41 = [_PFChangeInfo alloc];
                  if (v41)
                  {
                    v42 = -[_PFChangeInfo initWithObject:](v41, "initWithObject:", v40);
                    v43 = (void *)v42;
                    if (v42)
                      *(_QWORD *)(v42 + 16) = 1;
                  }
                  else
                  {
                    v43 = 0;
                  }
                  if ((*(_BYTE *)(v34 + 72) & 8) != 0)
                  {
                    v44 = -[NSFetchedResultsController _sectionNameForObject:]((const __CFString *)v34, v40);
                    if (v44)
                    {
                      if (!objc_msgSend(*(id *)(v34 + 112), "objectForKey:", v44))
                        objc_msgSend(v188, "addObject:", v44);
                    }
                  }
                  objc_msgSend(v193, "addObject:", v43);

                }
              }
              else
              {
                objc_msgSend(v191, "addObject:", v38);
              }
            }
            objc_autoreleasePoolPop(v39);
            ++v37;
          }
          while (v35 != v37);
          v45 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v274, v278, 16);
          v35 = v45;
        }
        while (v45);
      }
    }
    -[NSFetchedResultsController _preprocessDeletedObjects:deletesInfo:sectionsWithDeletes:](v194[4], (void *)objc_msgSend((id)v194[5], "objectForKey:", CFSTR("deleted_objectIDs")), v189, v187);
    -[NSFetchedResultsController _preprocessDeletedObjects:deletesInfo:sectionsWithDeletes:](v194[4], (void *)objc_msgSend((id)v194[5], "objectForKey:", CFSTR("invalidated_objectIDs")), v189, v187);
    v46 = (void *)objc_msgSend((id)v194[5], "objectForKey:", CFSTR("refreshed_objectIDs"));
    v47 = v193;
    -[NSFetchedResultsController _preprocessUpdatedObjects:insertsInfo:deletesInfo:updatesInfo:sectionsWithDeletes:newSectionNames:treatAsRefreshes:](v194[4], v191, v193, v189, v192, v187, v188, v46);
    if (v46)
    {
      v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v46);
      v49 = objc_msgSend((id)v194[5], "objectForKey:", CFSTR("deleted_objectIDs"));
      if (v49)
        objc_msgSend(v48, "minusSet:", v49);
      v50 = objc_msgSend((id)v194[5], "objectForKey:", v184);
      if (v50)
        objc_msgSend(v48, "minusSet:", v50);
      v51 = objc_msgSend((id)v194[5], "objectForKey:", v185);
      if (v51)
        objc_msgSend(v48, "minusSet:", v51);
      -[NSFetchedResultsController _preprocessUpdatedObjects:insertsInfo:deletesInfo:updatesInfo:sectionsWithDeletes:newSectionNames:treatAsRefreshes:](v194[4], v48, v193, v189, v192, v187, v188, v46);

    }
    if (!objc_msgSend(v193, "count") && !objc_msgSend(v189, "count") && !objc_msgSend(v192, "count"))
    {
LABEL_148:

      objc_msgSend(v186, "drain");
      return (id)v194[4];
    }
    v57 = v194;
    v58 = v194[4];
    v59 = *(_DWORD *)(v58 + 72);
    if ((v59 & 0x1000) != 0)
    {
      objc_msgSend(v190, "controllerWillChangeContent:");
      v58 = v194[4];
      v59 = *(_DWORD *)(v58 + 72);
    }
    *(_DWORD *)(v58 + 72) = v59 | 1;
    v60 = v57[4];
    if (!*(_QWORD *)(v60 + 96) || !*(_QWORD *)(v60 + 104))
    {
LABEL_109:
      _NSCoreDataLog(4, (uint64_t)CFSTR("(NSFetchedResultsController) rebuilding section caches"), v58, v52, v53, v54, v55, v56, v183);
      v278[0] = 0;
      +[NSFetchedResultsController deleteCacheWithName:](NSFetchedResultsController, "deleteCacheWithName:", objc_msgSend((id)v194[4], "cacheName"));
      updated = objc_msgSend((id)v194[4], "performFetch:", v278);
      if ((updated & 1) == 0)
      {
        _NSCoreDataLog(1, (uint64_t)CFSTR("(NSFetchedResultsController) error refetching objects after context update: %@"), v78, v79, v80, v81, v82, v83, v278[0]);
        goto LABEL_113;
      }
      goto LABEL_110;
    }
    v256 = 0u;
    v257 = 0u;
    v258 = 0u;
    v259 = 0u;
    v61 = objc_msgSend(v189, "countByEnumeratingWithState:objects:count:", &v256, v278, 16);
    if (v61)
    {
      v62 = *(_QWORD *)v257;
      do
      {
        for (i = 0; i != v61; ++i)
        {
          if (*(_QWORD *)v257 != v62)
            objc_enumerationMutation(v189);
          if (!-[NSFetchedResultsController _updateFetchedObjectsWithDeleteChange:](v60, *(void **)(*((_QWORD *)&v256 + 1) + 8 * i)))goto LABEL_109;
        }
        v61 = objc_msgSend(v189, "countByEnumeratingWithState:objects:count:", &v256, v278, 16);
      }
      while (v61);
    }
    v255 = 0u;
    v254 = 0u;
    v253 = 0u;
    v252 = 0u;
    v64 = objc_msgSend(v192, "countByEnumeratingWithState:objects:count:", &v252, &v274, 16);
    if (v64)
    {
      v65 = *(_QWORD *)v253;
      do
      {
        for (j = 0; j != v64; ++j)
        {
          if (*(_QWORD *)v253 != v65)
            objc_enumerationMutation(v192);
          v67 = *(_QWORD **)(*((_QWORD *)&v252 + 1) + 8 * j);
          if (v67
            && v67[2] == 3
            && !-[NSFetchedResultsController _updateFetchedObjectsWithDeleteChange:](v60, v67))
          {
            goto LABEL_109;
          }
        }
        v64 = objc_msgSend(v192, "countByEnumeratingWithState:objects:count:", &v252, &v274, 16);
      }
      while (v64);
    }
    v250 = 0u;
    v251 = 0u;
    v248 = 0u;
    v249 = 0u;
    v68 = objc_msgSend(v192, "countByEnumeratingWithState:objects:count:", &v248, v273, 16);
    if (!v68)
      goto LABEL_99;
    v69 = *(_QWORD *)v249;
    do
    {
      for (k = 0; k != v68; ++k)
      {
        if (*(_QWORD *)v249 != v69)
          objc_enumerationMutation(v192);
        v71 = *(_QWORD **)(*((_QWORD *)&v248 + 1) + 8 * k);
        v72 = (void *)MEMORY[0x18D76B4E4]();
        if (v71 && v71[2] == 3 && !-[NSFetchedResultsController _updateFetchedObjectsWithInsertChange:](v60, v71))
        {
LABEL_108:
          objc_autoreleasePoolPop(v72);
          goto LABEL_109;
        }
        objc_autoreleasePoolPop(v72);
      }
      v68 = objc_msgSend(v192, "countByEnumeratingWithState:objects:count:", &v248, v273, 16);
    }
    while (v68);
LABEL_99:
    v246 = 0u;
    v247 = 0u;
    v244 = 0u;
    v245 = 0u;
    v73 = objc_msgSend(v193, "countByEnumeratingWithState:objects:count:", &v244, v272, 16);
    if (v73)
    {
      v74 = *(_QWORD *)v245;
      do
      {
        for (m = 0; m != v73; ++m)
        {
          if (*(_QWORD *)v245 != v74)
            objc_enumerationMutation(v193);
          v76 = *(void **)(*((_QWORD *)&v244 + 1) + 8 * m);
          v72 = (void *)MEMORY[0x18D76B4E4]();
          if (!-[NSFetchedResultsController _updateFetchedObjectsWithInsertChange:](v60, v76))
            goto LABEL_108;
          objc_autoreleasePoolPop(v72);
        }
        v73 = objc_msgSend(v193, "countByEnumeratingWithState:objects:count:", &v244, v272, 16);
      }
      while (v73);
    }
    updated = -[NSFetchedResultsController _updateIndexCacheWithFetchedObjects](v60);
LABEL_110:
    if ((*(_BYTE *)(v194[4] + 72) & 8) != 0)
    {
      updated = objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v84 = (void *)updated;
    }
    else
    {
      v84 = 0;
    }
    v85 = (void *)MEMORY[0x18D76B4E4](updated);
    v238 = 0u;
    v239 = 0u;
    v236 = 0u;
    v237 = 0u;
    v86 = objc_msgSend(v192, "countByEnumeratingWithState:objects:count:", &v236, v270, 16);
    if (v86)
    {
      v87 = *(_QWORD *)v237;
      do
      {
        v88 = 0;
        do
        {
          if (*(_QWORD *)v237 != v87)
            objc_enumerationMutation(v192);
          v89 = *(_QWORD **)(*((_QWORD *)&v236 + 1) + 8 * v88);
          v90 = (void *)objc_msgSend((id)v194[4], "indexPathForObject:", objc_msgSend(v89, "object"));
          if (v89)
          {
            objc_setProperty_nonatomic(v89, v91, v90, 32);
            v92 = v194[4];
            if ((*(_BYTE *)(v92 + 72) & 8) == 0)
              goto LABEL_126;
            v93 = (void *)v89[4];
          }
          else
          {
            v92 = v194[4];
            if ((*(_BYTE *)(v92 + 72) & 8) == 0)
              goto LABEL_126;
            v93 = 0;
          }
          v94 = (void *)objc_msgSend(*(id *)(v92 + 104), "objectAtIndex:", objc_msgSend(v93, "indexAtPosition:", 0));
          if (!v89 || (objc_setProperty_nonatomic(v89, v95, v94, 48), v89[5] == v89[6]))
            objc_msgSend(v84, "addObject:");
LABEL_126:
          ++v88;
        }
        while (v86 != v88);
        v96 = objc_msgSend(v192, "countByEnumeratingWithState:objects:count:", &v236, v270, 16);
        v86 = v96;
      }
      while (v96);
    }
    v234 = 0u;
    v235 = 0u;
    v232 = 0u;
    v233 = 0u;
    v97 = objc_msgSend(v193, "countByEnumeratingWithState:objects:count:", &v232, v269, 16);
    if (!v97)
      goto LABEL_147;
    v98 = *(_QWORD *)v233;
LABEL_134:
    v99 = 0;
    while (1)
    {
      if (*(_QWORD *)v233 != v98)
        objc_enumerationMutation(v193);
      v100 = *(_QWORD **)(*((_QWORD *)&v232 + 1) + 8 * v99);
      v101 = (void *)objc_msgSend((id)v194[4], "indexPathForObject:", objc_msgSend(v100, "object"));
      if (v100)
      {
        objc_setProperty_nonatomic(v100, v102, v101, 32);
        v103 = v194[4];
        if ((*(_BYTE *)(v103 + 72) & 8) != 0)
        {
          v104 = (void *)v100[4];
          goto LABEL_140;
        }
      }
      else
      {
        v103 = v194[4];
        if ((*(_BYTE *)(v103 + 72) & 8) != 0)
        {
          v104 = 0;
LABEL_140:
          v105 = (void *)objc_msgSend(*(id *)(v103 + 104), "objectAtIndex:", objc_msgSend(v104, "indexAtPosition:", 0));
          if (v100)
            objc_setProperty_nonatomic(v100, v106, v105, 48);
        }
      }
      if (v97 == ++v99)
      {
        v107 = objc_msgSend(v193, "countByEnumeratingWithState:objects:count:", &v232, v269, 16);
        v97 = v107;
        if (!v107)
        {
LABEL_147:
          objc_autoreleasePoolPop(v85);
          v47 = v193;
          if ((-[NSFetchedResultsController _conditionallyDispatchSnapshotToDelegate:updatesInfo:](v194[4], v190, v192) & 1) != 0)
            goto LABEL_148;
          v108 = v194[4];
          v109 = *(_DWORD *)(v108 + 72);
          if ((v109 & 0x40) == 0)
          {
            if ((v109 & 8) != 0)
            {
              v218 = 0u;
              v219 = 0u;
              v216 = 0u;
              v217 = 0u;
              v141 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v216, v265, 16);
              if (v141)
              {
                v142 = *(_QWORD *)v217;
                do
                {
                  for (n = 0; n != v141; ++n)
                  {
                    if (*(_QWORD *)v217 != v142)
                      objc_enumerationMutation(v84);
                    v144 = *(_QWORD *)(*((_QWORD *)&v216 + 1) + 8 * n);
                    v145 = (void *)MEMORY[0x18D76B4E4]();
                    v215[0] = MEMORY[0x1E0C809B0];
                    v215[1] = 3221225472;
                    v215[2] = __82__NSFetchedResultsController_PrivateMethods___core_managedObjectContextDidChange___block_invoke_2;
                    v215[3] = &unk_1E1EDF440;
                    v215[4] = v144;
                    v146 = objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v215);
                    -[NSFetchedResultsController _lowerMoveOperationsToUpdatesForSection:withInsertedObjects:deletedObjects:updatedObjects:](v194[4], v144, (void *)objc_msgSend(v193, "filteredSetUsingPredicate:", v146), (void *)objc_msgSend(v189, "filteredSetUsingPredicate:", v146), (void *)objc_msgSend(v192, "filteredSetUsingPredicate:", v146));
                    objc_autoreleasePoolPop(v145);
                  }
                  v141 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v216, v265, 16);
                }
                while (v141);
              }
            }
            else
            {
              -[NSFetchedResultsController _lowerMoveOperationsToUpdatesForSection:withInsertedObjects:deletedObjects:updatedObjects:](v108, 0, v193, v189, v192);
            }
            if ((*(_BYTE *)(v194[4] + 73) & 2) != 0)
            {
              v213 = 0u;
              v214 = 0u;
              v211 = 0u;
              v212 = 0u;
              v147 = objc_msgSend(v189, "countByEnumeratingWithState:objects:count:", &v211, v264, 16);
              if (v147)
              {
                v148 = *(_QWORD *)v212;
                do
                {
                  v149 = 0;
                  do
                  {
                    if (*(_QWORD *)v212 != v148)
                      objc_enumerationMutation(v189);
                    v150 = *(_QWORD **)(*((_QWORD *)&v211 + 1) + 8 * v149);
                    v151 = objc_msgSend(v150, "object");
                    if (v150)
                      v152 = v150[3];
                    else
                      v152 = 0;
                    objc_msgSend(v190, "controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:", v194[4], v151, v152, 2, 0);
                    ++v149;
                  }
                  while (v147 != v149);
                  v153 = objc_msgSend(v189, "countByEnumeratingWithState:objects:count:", &v211, v264, 16);
                  v147 = v153;
                }
                while (v153);
              }
            }
            if ((*(_BYTE *)(v194[4] + 73) & 4) != 0)
            {
              v209 = 0u;
              v210 = 0u;
              v207 = 0u;
              v208 = 0u;
              v154 = objc_msgSend(v188, "countByEnumeratingWithState:objects:count:", &v207, v263, 16);
              if (v154)
              {
                v155 = *(_QWORD *)v208;
                do
                {
                  for (ii = 0; ii != v154; ++ii)
                  {
                    if (*(_QWORD *)v208 != v155)
                      objc_enumerationMutation(v188);
                    v157 = objc_msgSend(*(id *)(v194[4] + 112), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v207 + 1) + 8 * ii));
                    if (v157)
                      objc_msgSend(v190, "controller:didChangeSection:atIndex:forChangeType:", v194[4], v157, -[_NSDefaultSectionInfo sectionNumber](v157), 1);
                  }
                  v154 = objc_msgSend(v188, "countByEnumeratingWithState:objects:count:", &v207, v263, 16);
                }
                while (v154);
              }
              v205 = 0u;
              v206 = 0u;
              v203 = 0u;
              v204 = 0u;
              v158 = (void *)objc_msgSend(v187, "allValues");
              v159 = objc_msgSend(v158, "countByEnumeratingWithState:objects:count:", &v203, v262, 16);
              if (v159)
              {
                v160 = *(_QWORD *)v204;
                do
                {
                  v161 = 0;
                  do
                  {
                    if (*(_QWORD *)v204 != v160)
                      objc_enumerationMutation(v158);
                    v162 = *(_QWORD **)(*((_QWORD *)&v203 + 1) + 8 * v161);
                    if (!objc_msgSend(*(id *)(v194[4] + 112), "objectForKey:", objc_msgSend(v162, "name")))
                    {
                      if (v162)
                        v163 = v162[6];
                      else
                        v163 = 0;
                      objc_msgSend(v190, "controller:didChangeSection:atIndex:forChangeType:", v194[4], v162, v163, 2);
                    }
                    ++v161;
                  }
                  while (v159 != v161);
                  v164 = objc_msgSend(v158, "countByEnumeratingWithState:objects:count:", &v203, v262, 16);
                  v159 = v164;
                }
                while (v164);
              }
            }
            if ((*(_BYTE *)(v194[4] + 73) & 2) != 0)
            {
              v201 = 0u;
              v202 = 0u;
              v199 = 0u;
              v200 = 0u;
              v165 = objc_msgSend(v193, "countByEnumeratingWithState:objects:count:", &v199, v261, 16);
              if (v165)
              {
                v166 = *(_QWORD *)v200;
                do
                {
                  v167 = 0;
                  do
                  {
                    if (*(_QWORD *)v200 != v166)
                      objc_enumerationMutation(v193);
                    v168 = *(_QWORD **)(*((_QWORD *)&v199 + 1) + 8 * v167);
                    v169 = objc_msgSend(v168, "object");
                    if (v168)
                      v170 = v168[4];
                    else
                      v170 = 0;
                    objc_msgSend(v190, "controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:", v194[4], v169, 0, 1, v170);
                    ++v167;
                  }
                  while (v165 != v167);
                  v171 = objc_msgSend(v193, "countByEnumeratingWithState:objects:count:", &v199, v261, 16);
                  v165 = v171;
                }
                while (v171);
              }
              v197 = 0u;
              v198 = 0u;
              v195 = 0u;
              v196 = 0u;
              v172 = objc_msgSend(v192, "countByEnumeratingWithState:objects:count:", &v195, v260, 16);
              if (v172)
              {
                v173 = *(_QWORD *)v196;
                do
                {
                  v174 = 0;
                  do
                  {
                    if (*(_QWORD *)v196 != v173)
                      objc_enumerationMutation(v192);
                    v175 = *(_QWORD **)(*((_QWORD *)&v195 + 1) + 8 * v174);
                    v176 = objc_msgSend(v175, "object");
                    if (v175)
                    {
                      v177 = v175[2];
                      v178 = (void *)v175[3];
                      v175 = (_QWORD *)v175[4];
                      if (!BYTE2(dword_1ECD8DE18) && v177 == 3)
                      {
                        v179 = objc_msgSend(v178, "indexAtPosition:", 0);
                        if (v179 == objc_msgSend(v175, "indexAtPosition:", 0))
                        {
                          v180 = objc_msgSend(v178, "indexAtPosition:", 1);
                          v181 = objc_msgSend(v175, "indexAtPosition:", 1);
                          if (v180 == v181)
                            v177 = 4;
                          else
                            v177 = 3;
                          if (v180 == v181)
                            v175 = 0;
                        }
                        else
                        {
                          v177 = 3;
                        }
                      }
                    }
                    else
                    {
                      v178 = 0;
                      v177 = 0;
                    }
                    objc_msgSend(v190, "controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:", v194[4], v176, v178, v177, v175);
                    ++v174;
                  }
                  while (v172 != v174);
                  v182 = objc_msgSend(v192, "countByEnumeratingWithState:objects:count:", &v195, v260, 16);
                  v172 = v182;
                }
                while (v182);
              }
            }
            v47 = v193;
            if ((*(_BYTE *)(v194[4] + 72) & 0x80) != 0)
              objc_msgSend(v190, "controllerDidChangeContent:");
            goto LABEL_148;
          }
          v110 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v189, "count") + objc_msgSend(v193, "count") + 2 * objc_msgSend(v192, "count"));
          v185 = (__CFString *)MEMORY[0x18D76B4E4]();
          v230 = 0u;
          v231 = 0u;
          v228 = 0u;
          v229 = 0u;
          v111 = objc_msgSend(v193, "countByEnumeratingWithState:objects:count:", &v228, v268, 16);
          if (v111)
          {
            v112 = *(_QWORD *)v229;
            do
            {
              v113 = 0;
              do
              {
                if (*(_QWORD *)v229 != v112)
                  objc_enumerationMutation(v193);
                v114 = *(_QWORD **)(*((_QWORD *)&v228 + 1) + 8 * v113);
                v115 = (void *)MEMORY[0x1E0CB3830];
                v116 = objc_msgSend((id)objc_msgSend(v114, "object"), "objectID");
                if (v114)
                  v117 = (void *)v114[4];
                else
                  v117 = 0;
                objc_msgSend(v110, "addObject:", objc_msgSend(v115, "changeWithObject:type:index:", v116, 0, objc_msgSend(v117, "indexAtPosition:", 1)));
                ++v113;
              }
              while (v111 != v113);
              v118 = objc_msgSend(v193, "countByEnumeratingWithState:objects:count:", &v228, v268, 16);
              v111 = v118;
            }
            while (v118);
          }
          v226 = 0u;
          v227 = 0u;
          v224 = 0u;
          v225 = 0u;
          v119 = objc_msgSend(v189, "countByEnumeratingWithState:objects:count:", &v224, v267, 16);
          if (v119)
          {
            v120 = *(_QWORD *)v225;
            do
            {
              v121 = 0;
              do
              {
                if (*(_QWORD *)v225 != v120)
                  objc_enumerationMutation(v189);
                v122 = *(_QWORD **)(*((_QWORD *)&v224 + 1) + 8 * v121);
                v123 = (void *)MEMORY[0x1E0CB3830];
                v124 = objc_msgSend((id)objc_msgSend(v122, "object"), "objectID");
                if (v122)
                  v125 = (void *)v122[3];
                else
                  v125 = 0;
                objc_msgSend(v110, "addObject:", objc_msgSend(v123, "changeWithObject:type:index:", v124, 1, objc_msgSend(v125, "indexAtPosition:", 1)));
                ++v121;
              }
              while (v119 != v121);
              v126 = objc_msgSend(v189, "countByEnumeratingWithState:objects:count:", &v224, v267, 16);
              v119 = v126;
            }
            while (v126);
          }
          v222 = 0u;
          v223 = 0u;
          v220 = 0u;
          v221 = 0u;
          v127 = objc_msgSend(v192, "countByEnumeratingWithState:objects:count:", &v220, v266, 16);
          if (v127)
          {
            v128 = *(_QWORD *)v221;
            do
            {
              v129 = 0;
              do
              {
                if (*(_QWORD *)v221 != v128)
                  objc_enumerationMutation(v192);
                v130 = *(id **)(*((_QWORD *)&v220 + 1) + 8 * v129);
                v131 = (void *)MEMORY[0x1E0CB3830];
                v132 = objc_msgSend((id)objc_msgSend(v130, "object"), "objectID");
                if (v130)
                {
                  v133 = objc_msgSend(v130[4], "indexAtPosition:", 1);
                  v134 = v130[3];
                }
                else
                {
                  v133 = objc_msgSend(0, "indexAtPosition:", 1);
                  v134 = 0;
                }
                objc_msgSend(v110, "addObject:", objc_msgSend(v131, "changeWithObject:type:index:associatedIndex:", v132, 0, v133, objc_msgSend(v134, "indexAtPosition:", 1)));
                v135 = (void *)MEMORY[0x1E0CB3830];
                v136 = objc_msgSend((id)objc_msgSend(v130, "object"), "objectID");
                if (v130)
                {
                  v137 = objc_msgSend(v130[3], "indexAtPosition:", 1);
                  v138 = v130[4];
                }
                else
                {
                  v137 = objc_msgSend(0, "indexAtPosition:", 1);
                  v138 = 0;
                }
                objc_msgSend(v110, "addObject:", objc_msgSend(v135, "changeWithObject:type:index:associatedIndex:", v136, 1, v137, objc_msgSend(v138, "indexAtPosition:", 1)));
                ++v129;
              }
              while (v127 != v129);
              v139 = objc_msgSend(v192, "countByEnumeratingWithState:objects:count:", &v220, v266, 16);
              v127 = v139;
            }
            while (v139);
          }
          objc_autoreleasePoolPop(v185);
          v140 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3838]), "initWithChanges:", v110);
          objc_msgSend(v190, "controller:didChangeContentWithDifference:", v194[4], v140);

LABEL_113:
          v47 = v193;
          goto LABEL_148;
        }
        goto LABEL_134;
      }
    }
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = v194[4];
  if ((isKindOfClass & 1) != 0)
  {
    -[_PFBatchFaultingArray _turnAllBatchesIntoFaults](*(_QWORD *)(v4 + 96));
    v5 = v194[4];
    v6 = *(_DWORD *)(v5 + 72) | 2;
  }
  else
  {
    v15 = (void *)-[NSFetchedResultsController _fetchedObjectsArrayOfObjectIDs](v4);
    v16 = objc_msgSend(v15, "count");
    v17 = v16;
    if (!(_DWORD)v16)
      goto LABEL_22;
    v18 = *(void **)(v194[4] + 96);
    v19 = v16;
    MEMORY[0x1E0C80A78](v16);
    v21 = (char *)&v183 - v20;
    if (v19 > 0x200)
      v21 = (char *)NSAllocateScannedUncollectable();
    else
      bzero((char *)&v183 - v20, 8 * v19);
    objc_msgSend(v15, "getObjects:range:", v21, 0, v17);
    v22 = -[_PFArray initWithObjects:count:andFlags:]([_PFArray alloc], "initWithObjects:count:andFlags:", v21, v17, 27);
    if (v19 >= 0x201)
      NSZoneFree(0, v21);
    v23 = [_PFBatchFaultingArray alloc];
    v24 = v194 + 4;
    *(_QWORD *)(*v24 + 96) = -[_PFBatchFaultingArray initWithPFArray:andRequest:andContext:](v23, "initWithPFArray:andRequest:andContext:", v22, *(_QWORD *)(v194[4] + 8), *(_QWORD *)(v194[4] + 16));
    -[NSFetchedResultsController _updateIndexCacheWithFetchedObjects](*v24);

    if ((-[NSFetchedResultsController _computeSectionInfo:error:](*v24, *(void **)(*v24 + 96), 0) & 1) == 0)
    {
      v25 = v194 + 4;

      *(_QWORD *)(*v25 + 104) = 0;
      *(_QWORD *)(*v25 + 112) = 0;

      *(_QWORD *)(*v25 + 120) = 0;
      *(_QWORD *)(*v25 + 128) = 0;
    }
    v2 = v194;
    *(_DWORD *)(v194[4] + 72) |= 2u;
    v5 = v2[4];
    v6 = *(_DWORD *)(v5 + 72) & 0xFFFFFFFB;
  }
  *(_DWORD *)(v5 + 72) = v6;
LABEL_22:
  v242 = 0u;
  v243 = 0u;
  v240 = 0u;
  v241 = 0u;
  v26 = *(void **)(v2[4] + 104);
  result = (_QWORD *)objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v240, v271, 16);
  v27 = result;
  if (result)
  {
    v28 = *(_QWORD *)v241;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v241 != v28)
          objc_enumerationMutation(v26);
        v30 = *(_QWORD *)(*((_QWORD *)&v240 + 1) + 8 * (_QWORD)v29);
        if (v30)
        {

          *(_QWORD *)(v30 + 56) = 0;
        }
        v29 = (_QWORD *)((char *)v29 + 1);
      }
      while (v27 != v29);
      result = (_QWORD *)objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v240, v271, 16);
      v27 = result;
    }
    while (result);
  }
  return result;
}

- (uint64_t)_preprocessDeletedObjects:(void *)a3 deletesInfo:(void *)a4 sectionsWithDeletes:
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _PFChangeInfo *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  _QWORD *v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v6 = result;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (result)
    {
      v7 = result;
      v8 = *(_QWORD *)v25;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(a2);
          v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v9);
          if (_objectIDEntityAffectsResults(v6, v10))
          {
            v11 = -[NSFetchedResultsController _indexOfFetchedID:isManagedObjectID:](v6, v10, 1);
            if (v11 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v12 = v11;
              v13 = objc_msgSend(*(id *)(v6 + 16), "objectWithID:", v10);
              v14 = [_PFChangeInfo alloc];
              if (v14)
              {
                v15 = -[_PFChangeInfo initWithObject:](v14, "initWithObject:", v13);
                v16 = (void *)v15;
                if (v15)
                  *(_QWORD *)(v15 + 16) = 2;
              }
              else
              {
                v16 = 0;
              }
              v17 = (void *)-[NSFetchedResultsController _indexPathForIndex:](*(void **)(v6 + 104), v12);
              if (v17)
              {
                v19 = v17;
                if (v16)
                  objc_setProperty_nonatomic(v16, v18, v17, 24);
                v21 = (_QWORD *)objc_msgSend(*(id *)(v6 + 104), "objectAtIndex:", objc_msgSend(v19, "indexAtPosition:", 0));
                if (v16)
                  objc_setProperty_nonatomic(v16, v20, v21, 40);
                if ((*(_BYTE *)(v6 + 72) & 8) != 0)
                {
                  v22 = -[_NSDefaultSectionInfo sectionNumber]((uint64_t)v21);
                  if (v21)
                    v21[6] = v22;
                  objc_msgSend(a4, "setObject:forKey:", v21, objc_msgSend(v21, "name"));
                }
              }
              objc_msgSend(a3, "addObject:", v16);

            }
          }
          ++v9;
        }
        while (v7 != v9);
        result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        v7 = result;
      }
      while (result);
    }
  }
  return result;
}

- (id)delegate
{
  id *delegate;

  delegate = (id *)self->_delegate;
  if (delegate)
    return objc_loadWeak(delegate + 1);
  else
    return 0;
}

- (uint64_t)_preprocessUpdatedObjects:(void *)a3 insertsInfo:(void *)a4 deletesInfo:(void *)a5 updatesInfo:(void *)a6 sectionsWithDeletes:(void *)a7 newSectionNames:(void *)a8 treatAsRefreshes:
{
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  char v17;
  _PFChangeInfo *v18;
  const char *v19;
  _PFChangeInfo *v20;
  int v21;
  int v22;
  const char *v23;
  _QWORD *v24;
  void *v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  int v35;
  const char *v36;
  _QWORD *v37;
  SEL v38;
  const __CFString *v39;
  const __CFString *v40;
  uint64_t v41;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v49;
  _PFChangeInfo *self;
  void *v51;
  uint64_t v52;
  id newValue;
  void *context;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v11 = a2;
    v12 = result;
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    v52 = result;
    if (result)
    {
      v13 = *(_QWORD *)v60;
      v45 = a4;
      v46 = a6;
      v43 = v11;
      v44 = a3;
      v49 = *(_QWORD *)v60;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v60 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v14);
          context = (void *)MEMORY[0x18D76B4E4]();
          if (_objectIDEntityAffectsResults(v12, v15))
          {
            v16 = -[NSFetchedResultsController _indexOfFetchedID:isManagedObjectID:](v12, v15, 1);
            newValue = v16 == 0x7FFFFFFFFFFFFFFFLL
                     ? 0
                     : (id)-[NSFetchedResultsController _indexPathForIndex:](*(void **)(v12 + 104), v16);
            v51 = (void *)objc_msgSend(*(id *)(v12 + 16), "objectWithID:", v15);
            v17 = -[NSFetchedResultsController _objectInResults:](v12, v51);
            if ((v17 & 1) != 0 || newValue)
            {
              v18 = -[_PFChangeInfo initWithObject:]([_PFChangeInfo alloc], "initWithObject:", v51);
              if ((v17 & 1) != 0)
              {
                self = v18;
                if (!newValue)
                {
                  v20 = v18;
                  if (v18)
                    v18->_changeType = 1;
                  v25 = a3;
                  if ((*(_BYTE *)(v12 + 72) & 8) != 0)
                  {
                    v27 = -[NSFetchedResultsController _sectionNameForObject:]((const __CFString *)v12, v51);
                    v25 = a3;
                    if (v27)
                    {
                      v28 = objc_msgSend(*(id *)(v12 + 112), "objectForKey:", v27);
                      v25 = a3;
                      if (!v28)
                      {
                        objc_msgSend(a7, "addObject:", v27);
                        v25 = a3;
                      }
                    }
                  }
                  goto LABEL_55;
                }
                v20 = v18;
                if ((objc_msgSend(a3, "containsObject:", v18) & 1) == 0
                  && (objc_msgSend(a4, "containsObject:", self) & 1) == 0)
                {
                  if ((objc_msgSend(a8, "containsObject:", v15) & 1) != 0)
                  {
                    v21 = 1;
                    v22 = 1;
                  }
                  else
                  {
                    v29 = (void *)objc_msgSend(v51, "changedValuesForCurrentEvent");
                    v55 = 0u;
                    v56 = 0u;
                    v57 = 0u;
                    v58 = 0u;
                    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
                    if (v30)
                    {
                      v31 = v30;
                      v21 = 0;
                      v22 = 0;
                      v32 = *(_QWORD *)v56;
                      do
                      {
                        for (i = 0; i != v31; ++i)
                        {
                          if (*(_QWORD *)v56 != v32)
                            objc_enumerationMutation(v29);
                          v34 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
                          v35 = objc_msgSend(*(id *)(v12 + 88), "containsObject:", v34);
                          v22 |= v35;
                          v21 |= objc_msgSend(*(id *)(v12 + 32), "isEqualToString:", v34) | v35;
                        }
                        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
                      }
                      while (v31);
                    }
                    else
                    {
                      v21 = 0;
                      v22 = 0;
                    }
                  }
                  v37 = (_QWORD *)objc_msgSend(*(id *)(v12 + 104), "objectAtIndex:", objc_msgSend(newValue, "indexAtPosition:", 0));
                  v20 = self;
                  if (!self)
                  {
                    v25 = a5;
                    a4 = v45;
                    a6 = v46;
                    a3 = v44;
                    goto LABEL_45;
                  }
                  objc_setProperty_nonatomic(self, v36, newValue, 24);
                  objc_setProperty_nonatomic(self, v38, v37, 40);
                  a4 = v45;
                  a6 = v46;
                  a3 = v44;
                  if (((v21 | v22) & 1) != 0)
                  {
                    self->_changeType = 3;
                    v25 = a5;
LABEL_45:
                    v11 = v43;
                    if ((v21 & 1) != 0)
                    {
                      v25 = a5;
                      if ((*(_BYTE *)(v12 + 72) & 8) != 0)
                      {
                        v39 = -[NSFetchedResultsController _sectionNameForObject:]((const __CFString *)v12, v51);
                        if (!v39)
                          goto LABEL_50;
                        v40 = v39;
                        v41 = objc_msgSend(*(id *)(v12 + 112), "objectForKey:", v39);
                        if (!v41)
                        {
                          objc_msgSend(a7, "addObject:", v40);
LABEL_50:
                          v41 = 0;
                        }
                        v25 = a5;
                        if (v37)
                        {
                          v25 = a5;
                          if (v37 != (_QWORD *)v41)
                          {
                            v37[6] = -[_NSDefaultSectionInfo sectionNumber]((uint64_t)v37);
                            objc_msgSend(a6, "setObject:forKey:", v37, objc_msgSend(v37, "name"));
                            v25 = a5;
                          }
                        }
                      }
                    }
                  }
                  else
                  {
                    self->_changeType = 4;
                    v25 = a5;
                    v11 = v43;
                  }
LABEL_55:
                  objc_msgSend(v25, "addObject:", v20);
                  v13 = v49;
                }

                goto LABEL_57;
              }
              v20 = v18;
              if (v18)
              {
                v18->_changeType = 2;
                objc_setProperty_nonatomic(v18, v19, newValue, 24);
              }
              v24 = (_QWORD *)objc_msgSend(*(id *)(v12 + 104), "objectAtIndex:", objc_msgSend(newValue, "indexAtPosition:", 0));
              if (v20)
                objc_setProperty_nonatomic(v20, v23, v24, 40);
              v25 = a4;
              if ((*(_BYTE *)(v12 + 72) & 8) != 0)
              {
                v26 = -[_NSDefaultSectionInfo sectionNumber]((uint64_t)v24);
                if (v24)
                  v24[6] = v26;
                objc_msgSend(a6, "setObject:forKey:", v24, objc_msgSend(v24, "name"));
                v25 = a4;
              }
              goto LABEL_55;
            }
          }
LABEL_57:
          objc_autoreleasePoolPop(context);
          ++v14;
        }
        while (v14 != v52);
        result = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
        v52 = result;
      }
      while (result);
    }
  }
  return result;
}

- (unint64_t)_indexOfFetchedID:(int)a3 isManagedObjectID:
{
  uint64_t v5;

  if (result)
  {
    v5 = result;
    if (objc_msgSend(*(id *)(result + 8), "resultType") != 1)
    {
      if (objc_msgSend(*(id *)(v5 + 8), "resultType") == 2)
        return objc_msgSend(*(id *)(v5 + 96), "indexOfObject:", a2);
      if (objc_msgSend(*(id *)(v5 + 8), "resultType"))
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Result type of fetched object is not an NSManagedObjectIDResultType, NSDictionaryResultType or NSManagedObjectResultType."), 0));
      if ((a3 & 1) == 0)
        a2 = (void *)objc_msgSend(a2, "objectID");
    }
    if ((objc_opt_respondsToSelector() & 1) != 0 && a3)
      return objc_msgSend(*(id *)(v5 + 96), "indexOfManagedObjectForObjectID:", a2);
    else
      return -[NSFetchedResultsController _indexOfCachedID:](v5, (uint64_t)a2);
  }
  return result;
}

- (NSIndexPath)indexPathForObject:(id)object
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  if (!object)
    return 0;
  v4 = (*(_BYTE *)&self->_flags & 8) != 0
     ? -[NSMutableDictionary objectForKey:](self->_sectionsByName, "objectForKey:", -[NSFetchedResultsController _sectionNameForObject:]((const __CFString *)self, object)): -[NSMutableOrderedSet lastObject](self->_sections, "lastObject");
  v5 = v4;
  if (!v4)
    return 0;
  v6 = -[NSFetchedResultsController _indexOfFetchedID:isManagedObjectID:](*(_QWORD *)(v4 + 8), object, 0);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v7 = v6 - *(_QWORD *)(v5 + 32);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v9[0] = -[_NSDefaultSectionInfo sectionNumber](v5);
  v9[1] = v7;
  return (NSIndexPath *)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndexes:length:", v9, 2);
}

- (unint64_t)_indexOfCachedID:(uint64_t)a1
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v3 = (void *)objc_msgSend(*(id *)(a1 + 136), "objectForKey:", a2);
  v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (v3)
  {
    v5 = objc_msgSend(v3, "integerValue");
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = v5;
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v7 = *(void **)(a1 + 144);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v15;
        v4 = v6;
        while (1)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v15 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
            if (v12)
            {
              if (v4 < *(_QWORD *)(v12 + 8))
                continue;
              v12 = *(_QWORD *)(v12 + 24);
            }
            v4 += v12;
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (!v9)
            return v4;
        }
      }
      return v6;
    }
  }
  return v4;
}

- (uint64_t)_indexPathForIndex:(void *)a1
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[2];
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  result = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(a1);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        if (v8)
          v9 = *(_QWORD *)(v8 + 32);
        else
          v9 = 0;
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "numberOfObjects") + v9 > a2)
        {
          v15[0] = -[_NSDefaultSectionInfo sectionNumber](v8);
          if (v8)
            v10 = *(_QWORD *)(v8 + 32);
          else
            v10 = 0;
          v15[1] = a2 - v10;
          return objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndexes:length:", v15, 2);
        }
        ++v7;
      }
      while (v5 != v7);
      result = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      v5 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (void)_updateSectionOffsetsStartingAtSection:(uint64_t)a1
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = objc_msgSend(*(id *)(a1 + 104), "count");
  v5 = -[_NSDefaultSectionInfo sectionNumber]((uint64_t)a2) + 1;
  if (v5 < v4)
  {
    do
    {
      v6 = objc_msgSend(*(id *)(a1 + 104), "objectAtIndex:", v5);
      if (a2)
        v7 = a2[4];
      else
        v7 = 0;
      v8 = objc_msgSend(a2, "numberOfObjects");
      if (v6)
      {
        *(_QWORD *)(v6 + 32) = v8 + v7;

        *(_QWORD *)(v6 + 56) = 0;
      }
      ++v5;
      a2 = (_QWORD *)v6;
    }
    while (v4 != v5);
  }
}

- (uint64_t)_updateFetchedObjectsWithDeleteChange:(unint64_t)a1
{
  uint64_t v2;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _PFIndexCacheOffset *v22;
  _QWORD *v23;
  void *v24;
  uint64_t v25;
  uint64_t v27;
  unint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  uint64_t v34;

  v2 = (uint64_t)a2;
  v34 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a2, "object");
  if (v2)
  {
    v2 = *(_QWORD *)(v2 + 40);
    if (v2)
    {
      v5 = -[NSFetchedResultsController _indexOfFetchedID:isManagedObjectID:](*(_QWORD *)(v2 + 8), v4, 0);
      if (v5 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v6 = *(_QWORD *)(v2 + 32);
        v7 = v5 - v6;
        if (v5 - v6 != 0x7FFFFFFFFFFFFFFFLL)
        {
          LOBYTE(v18) = 0;
LABEL_23:
          v19 = v6 + v7;
          if ((*(_BYTE *)(a1 + 72) & 4) == 0)
            -[NSFetchedResultsController _makeMutableFetchedObjects](a1);
          v20 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:", v19), "objectID");
          objc_msgSend(*(id *)(a1 + 96), "removeObjectAtIndex:", v19);
          objc_msgSend(*(id *)(a1 + 136), "removeObjectForKey:", v20);
          if (objc_msgSend(*(id *)(a1 + 96), "count"))
          {
            v21 = objc_msgSend(*(id *)(a1 + 96), "count");
            v22 = [_PFIndexCacheOffset alloc];
            if (v22)
            {
              v33.receiver = v22;
              v33.super_class = (Class)_PFIndexCacheOffset;
              v23 = objc_msgSendSuper2(&v33, sel_init);
              v24 = v23;
              if (v23)
              {
                v23[1] = v19;
                v23[2] = v21;
                v23[3] = -1;
              }
            }
            else
            {
              v24 = 0;
            }
            objc_msgSend(*(id *)(a1 + 144), "addObject:", v24);

          }
          else
          {
            objc_msgSend(*(id *)(a1 + 144), "removeAllObjects");
          }
          v25 = objc_msgSend((id)v2, "numberOfObjects");
          if ((v18 & 1) == 0)
          {
            *(_QWORD *)(v2 + 40) = v25 - 1;

            *(_QWORD *)(v2 + 56) = 0;
          }
          -[NSFetchedResultsController _updateSectionOffsetsStartingAtSection:](a1, (_QWORD *)v2);
          goto LABEL_34;
        }
      }
    }
  }
  v8 = -[NSFetchedResultsController _indexOfFetchedID:isManagedObjectID:](a1, (void *)objc_msgSend(v4, "objectID"), 1);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_34:
    if (v2 && !objc_msgSend((id)v2, "numberOfObjects") && (*(_BYTE *)(a1 + 72) & 8) != 0)
    {
      objc_msgSend(*(id *)(a1 + 104), "removeObjectAtIndex:", -[_NSDefaultSectionInfo sectionNumber](v2));
      objc_msgSend(*(id *)(a1 + 112), "removeObjectForKey:", objc_msgSend((id)v2, "name"));
      *(_QWORD *)(v2 + 8) = 0;

      *(_QWORD *)(v2 + 56) = 0;
      *(_QWORD *)(a1 + 120) = 0;

      *(_QWORD *)(a1 + 128) = 0;
    }
    return 1;
  }
  v7 = v8;
  v9 = *(void **)(a1 + 104);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, &v33, 16);
  if (!v10)
  {
LABEL_20:
    if (v2)
    {
      LOBYTE(v18) = 0;
      v6 = *(_QWORD *)(v2 + 32);
    }
    else
    {
LABEL_46:
      v6 = 0;
      LOBYTE(v18) = 1;
    }
    goto LABEL_23;
  }
  v11 = v10;
  v12 = *(_QWORD *)v30;
LABEL_8:
  v13 = 0;
  while (1)
  {
    if (*(_QWORD *)v30 != v12)
      objc_enumerationMutation(v9);
    v14 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v13);
    v15 = v14 ? *(_QWORD *)(v14 + 32) : 0;
    if (objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v13), "numberOfObjects") + v15 > v7)
      break;
    if (v11 == ++v13)
    {
      v16 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, &v33, 16);
      v11 = v16;
      if (v16)
        goto LABEL_8;
      goto LABEL_20;
    }
  }
  v17 = -[_NSDefaultSectionInfo sectionNumber](v14);
  if (v17 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_20;
  v27 = objc_msgSend(*(id *)(a1 + 104), "objectAtIndex:", v17);
  v2 = v27;
  if (!v27)
  {
    v7 = 0;
    goto LABEL_46;
  }
  v28 = -[NSFetchedResultsController _indexOfFetchedID:isManagedObjectID:](*(_QWORD *)(v27 + 8), v4, 0);
  v18 = 0;
  if (v28 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v18 = 0;
    v6 = *(_QWORD *)(v2 + 32);
    v7 = v28 - v6;
    if (v28 - v6 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_23;
  }
  return v18;
}

- (BOOL)_updateFetchedObjectsWithInsertChange:(uint64_t)a1
{
  __CFString *v3;
  uint64_t v4;
  const __CFString *v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  _PFIndexCacheOffset *v29;
  _QWORD *v30;
  void *v31;
  uint64_t v32;
  _PFIndexCacheOffset *v33;
  _QWORD *v34;
  void *v35;
  uint64_t v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  objc_super v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)objc_msgSend(a2, "object");
  if ((*(_BYTE *)(a1 + 72) & 8) == 0)
  {
    v4 = objc_msgSend(*(id *)(a1 + 104), "lastObject");
LABEL_5:
    v6 = (_QWORD *)v4;
    goto LABEL_6;
  }
  v5 = -[NSFetchedResultsController _sectionNameForObject:]((const __CFString *)a1, v3);
  if (v5)
  {
    v4 = objc_msgSend(*(id *)(a1 + 112), "objectForKey:", v5);
    goto LABEL_5;
  }
  v6 = 0;
LABEL_6:
  v7 = objc_msgSend(v6, "numberOfObjects");
  v8 = objc_msgSend(*(id *)(a1 + 96), "count");
  if (v7 > v8)
    return v7 <= v8;
  if (!v6)
  {
    if ((*(_BYTE *)(a1 + 72) & 8) != 0)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v12 = *(void **)(a1 + 104);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, &v42, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v39;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v39 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v16);
            if (v17)
              v18 = *(_QWORD *)(v17 + 32);
            else
              v18 = 0;
            objc_msgSend(v11, "addObject:", objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:", v18));
            ++v16;
          }
          while (v14 != v16);
          v19 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, &v42, 16);
          v14 = v19;
        }
        while (v19);
      }
      v20 = +[NSFetchedResultsController _insertIndexForObject:inArray:lowIdx:highIdx:sortDescriptors:]((uint64_t)NSFetchedResultsController, (uint64_t)v3, v11, 0, objc_msgSend(v11, "count") - 1, (void *)objc_msgSend((id)objc_msgSend((id)a1, "fetchRequest"), "sortDescriptors"));

      v21 = (__CFString *)-[NSFetchedResultsController _sectionNameForObject:]((const __CFString *)a1, v3);
      v22 = v3;
      if (objc_msgSend(*(id *)(a1 + 8), "resultType") != 1)
      {
        if (objc_msgSend(*(id *)(a1 + 8), "resultType") == 4)
          v22 = CFSTR("Count");
        else
          v22 = (__CFString *)-[__CFString valueForKeyPath:](v3, "valueForKeyPath:", *(_QWORD *)(a1 + 24));
      }
      v23 = (void *)-[NSFetchedResultsController _resolveSectionIndexTitleForSectionName:](a1, (uint64_t)v21);
      if (v20)
      {
        v24 = (_QWORD *)objc_msgSend(*(id *)(a1 + 104), "objectAtIndex:", v20 - 1);
        if (v24)
          v25 = v24[4];
        else
          v25 = 0;
        v26 = objc_msgSend(v24, "numberOfObjects") + v25;
      }
      else
      {
        v26 = 0;
      }
      v6 = -[_NSDefaultSectionInfo initWithController:name:sectionId:indexTitle:sectionOffset:]([_NSDefaultSectionInfo alloc], a1, v21, v22, v23, v26);
      objc_msgSend(*(id *)(a1 + 104), "insertObject:atIndex:", v6, v20);
      objc_msgSend(*(id *)(a1 + 112), "setObject:forKey:", v6, objc_msgSend(v6, "name"));

      *(_QWORD *)(a1 + 120) = 0;
      *(_QWORD *)(a1 + 128) = 0;
    }
    else
    {
      v6 = -[_NSDefaultSectionInfo initWithController:name:sectionId:indexTitle:sectionOffset:]([_NSDefaultSectionInfo alloc], a1, 0, 0, 0, 0);
      objc_msgSend(*(id *)(a1 + 104), "addObject:", v6);

      if (!*(_QWORD *)(a1 + 104))
      {
        v6 = 0;
LABEL_11:
        v9 = 0;
        v10 = 1;
        goto LABEL_36;
      }
    }
    if (!v6)
      goto LABEL_11;
  }
  v10 = 0;
  v9 = v6[4];
LABEL_36:
  v27 = +[NSFetchedResultsController _insertIndexForObject:inArray:lowIdx:highIdx:sortDescriptors:]((uint64_t)NSFetchedResultsController, (uint64_t)v3, *(void **)(a1 + 96), v9, v9 + objc_msgSend(v6, "numberOfObjects") - 1, (void *)objc_msgSend((id)objc_msgSend((id)a1, "fetchRequest"), "sortDescriptors"));
  if (v27 < objc_msgSend(*(id *)(a1 + 96), "count") && objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:", v27))
  {
    v28 = objc_msgSend(*(id *)(a1 + 96), "count");
    v29 = [_PFIndexCacheOffset alloc];
    if (v29)
    {
      v42.receiver = v29;
      v42.super_class = (Class)_PFIndexCacheOffset;
      v30 = objc_msgSendSuper2(&v42, sel_init);
      v31 = v30;
      if (v30)
      {
        v30[1] = v27;
        v30[2] = v28;
        v30[3] = 1;
      }
    }
    else
    {
      v31 = 0;
    }
    objc_msgSend(*(id *)(a1 + 144), "addObject:", v31);

  }
  if ((*(_BYTE *)(a1 + 72) & 4) == 0)
    -[NSFetchedResultsController _makeMutableFetchedObjects](a1);
  if (objc_msgSend(*(id *)(a1 + 96), "count") > v27 && objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:", v27))
  {
    v32 = objc_msgSend(*(id *)(a1 + 96), "count");
    v33 = [_PFIndexCacheOffset alloc];
    if (v33)
    {
      v42.receiver = v33;
      v42.super_class = (Class)_PFIndexCacheOffset;
      v34 = objc_msgSendSuper2(&v42, sel_init);
      v35 = v34;
      if (v34)
      {
        v34[1] = v27;
        v34[2] = v32;
        v34[3] = 1;
      }
    }
    else
    {
      v35 = 0;
    }
    objc_msgSend(*(id *)(a1 + 144), "addObject:", v35);

  }
  objc_msgSend(*(id *)(a1 + 96), "insertObject:atIndex:", v3, v27);
  objc_msgSend(*(id *)(a1 + 136), "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v27), -[__CFString objectID](v3, "objectID"));
  v36 = objc_msgSend(v6, "numberOfObjects");
  if ((v10 & 1) == 0)
  {
    v6[5] = v36 + 1;

    v6[7] = 0;
  }
  -[NSFetchedResultsController _updateSectionOffsetsStartingAtSection:](a1, v6);
  return v7 <= v8;
}

- (NSFetchedResultsController)initWithFetchRequest:(NSFetchRequest *)fetchRequest managedObjectContext:(NSManagedObjectContext *)context sectionNameKeyPath:(NSString *)sectionNameKeyPath cacheName:(NSString *)name
{
  NSFetchedResultsController *v11;
  uint64_t v12;
  NSPredicate *v13;
  NSArray *v14;
  NSEntityDescription *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *j;
  uint64_t v24;
  int v25;
  void *v26;
  uint64_t v27;
  NSString *v28;
  uint64_t v29;
  NSString *v30;
  int v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  NSManagedObjectContext *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!fetchRequest || !context)
  {
    v34 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("An instance of %@ requires a non-nil fetchRequest and managedObjectContext"), objc_opt_class());
    goto LABEL_40;
  }
  if (!-[NSFetchRequest sortDescriptors](fetchRequest, "sortDescriptors"))
  {
    v34 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("An instance of %@ requires a fetch request with sort descriptors"), objc_opt_class());
LABEL_40:
    v35 = v34;

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v35, 0));
  }
  v41.receiver = self;
  v41.super_class = (Class)NSFetchedResultsController;
  v11 = -[NSFetchedResultsController init](&v41, sel_init);
  if (v11)
  {
    v11->_fetchRequest = fetchRequest;
    v11->_managedObjectContext = context;
    v12 = -[NSString copy](sectionNameKeyPath, "copy");
    v11->_sectionNameKeyPath = (NSString *)v12;
    v11->_flags = (_fetchResultsControllerFlags)(*(_DWORD *)&v11->_flags & 0xFFFFFFF7 | (8 * (v12 != 0)));
    v13 = -[NSFetchRequest predicate](v11->_fetchRequest, "predicate");
    v11->_originalPredicate = v13;
    if (v13)
      v11->_remappedPredicate = (NSPredicate *)-[_NSMemoryStorePredicateRemapper createPredicateForFetchFromPredicate:withContext:](+[_NSMemoryStorePredicateRemapper defaultInstance](_NSMemoryStorePredicateRemapper, "defaultInstance"), "createPredicateForFetchFromPredicate:withContext:", v13, v11->_managedObjectContext);
    v11->_cacheName = (NSString *)-[NSString copy](name, "copy");
    v14 = -[NSFetchRequest sortDescriptors](v11->_fetchRequest, "sortDescriptors");
    -[NSFetchRequest _resolveEntityWithContext:](v11->_fetchRequest, "_resolveEntityWithContext:", context);
    v15 = -[NSFetchRequest entity](v11->_fetchRequest, "entity");
    v11->_flags = (_fetchResultsControllerFlags)(*(_DWORD *)&v11->_flags & 0xFFFFDFFF | ((-[NSFetchRequest resultType](v11->_fetchRequest, "resultType") == 2) << 13));
    v36 = context;
    if (-[NSDictionary count](-[NSEntityDescription subentitiesByName](v15, "subentitiesByName"), "count"))
    {
      if (-[NSFetchRequest includesSubentities](v11->_fetchRequest, "includesSubentities"))
        v16 = 32;
      else
        v16 = 0;
    }
    else
    {
      v16 = 0;
    }
    v11->_flags = (_fetchResultsControllerFlags)(*(_DWORD *)&v11->_flags & 0xFFFFFFDF | v16);
    v11->_sortKeys = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v38 != v19)
            objc_enumerationMutation(v14);
          v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "key");
          v22 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          for (j = v21; ; v21 = j)
          {
            objc_msgSend(j, "rangeOfString:", CFSTR("."));
            if (!v24)
              break;
            objc_msgSend(v22, "insertObject:atIndex:", objc_msgSend(v21, "pathExtension"), 0);
            j = (void *)objc_msgSend(v21, "stringByDeletingPathExtension");
          }
          objc_msgSend(v11->_sortKeys, "addObject:", v21);
          objc_msgSend(v22, "insertObject:atIndex:", v21, 0);
          if ((*((_BYTE *)&v11->_flags + 1) & 0x20) == 0)
          {
            if (-[NSFetchedResultsController _keyPathContainsNonPersistedProperties:](v11, v22))
              v25 = 0x2000;
            else
              v25 = 0;
            v11->_flags = (_fetchResultsControllerFlags)(*(_DWORD *)&v11->_flags & 0xFFFFDFFF | v25);
          }
        }
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v18);
    }
    if ((*(_BYTE *)&v11->_flags & 8) != 0)
    {
      v11->_sectionNameKey = v11->_sectionNameKeyPath;
      v26 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      -[NSString rangeOfString:](v11->_sectionNameKey, "rangeOfString:", CFSTR("."));
      if (v27)
      {
        do
        {
          objc_msgSend(v26, "insertObject:atIndex:", -[NSString pathExtension](v11->_sectionNameKey, "pathExtension"), 0);
          v28 = -[NSString stringByDeletingPathExtension](v11->_sectionNameKey, "stringByDeletingPathExtension");
          v11->_sectionNameKey = v28;
          -[NSString rangeOfString:](v28, "rangeOfString:", CFSTR("."));
        }
        while (v29);
      }
      v30 = v11->_sectionNameKey;
      objc_msgSend(v26, "insertObject:atIndex:", v11->_sectionNameKey, 0);
      if ((*((_BYTE *)&v11->_flags + 1) & 0x20) == 0)
      {
        if (-[NSFetchedResultsController _keyPathContainsNonPersistedProperties:](v11, v26))
          v31 = 0x2000;
        else
          v31 = 0;
        v11->_flags = (_fetchResultsControllerFlags)(*(_DWORD *)&v11->_flags & 0xFFFFDFFF | v31);
      }
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v11, sel__managedObjectContextDidSave_, CFSTR("_NSManagedObjectContextDidSaveObjectIDsPrivateNotification"), v36);
    if (v11->_cacheName)
    {
      v32 = -[NSManagedObjectContext persistentStoreCoordinator](v36, "persistentStoreCoordinator");
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v11, sel__managedObjectContextDidSave_, CFSTR("_NSManagedObjectContextDidSaveObjectIDsPrivateNotification"), v32);
    }
  }
  return v11;
}

- (uint64_t)_keyPathContainsNonPersistedProperties:(void *)a1
{
  void *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  unsigned __int8 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "fetchRequest"), "entity"), "propertiesByName");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(a2);
        v8 = (void *)objc_msgSend(v3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        if (!v8)
          return 1;
        v9 = v8;
        if ((objc_msgSend(v8, "isTransient") & 1) != 0)
          return 1;
        v10 = objc_msgSend(v9, "_propertyType");
        if (objc_msgSend(v9, "_isAttribute"))
        {
          v11 = objc_msgSend(v9, "attributeType");
          if (v11 == 1800 || v11 == 0)
          {
            v18 = 1;
            if (!v11)
              return v18;
          }
          else
          {
            v3 = 0;
            if (!v11)
              return v18;
          }
          if (v11 == 1800)
            return v18;
        }
        else if (objc_msgSend(v9, "_isRelationship"))
        {
          v3 = (void *)objc_msgSend((id)objc_msgSend(v9, "destinationEntity"), "propertiesByName");
        }
        else
        {
          if (v10)
            v13 = v10 == 3;
          else
            v13 = 1;
          if (v13)
            return 1;
          v3 = 0;
        }
      }
      v5 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      result = 0;
      if (v5)
        continue;
      break;
    }
  }
  return result;
}

- (NSFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

+ (uint64_t)_insertIndexForObject:(void *)a3 inArray:(uint64_t)a4 lowIdx:(uint64_t)a5 highIdx:(void *)a6 sortDescriptors:
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  if (a5 < a4 || a5 + 1 == a4)
    return a4;
  while (2)
  {
    v11 = a4 + a5;
    if (a4 + a5 < 0 != __OFADD__(a4, a5))
      ++v11;
    v12 = v11 >> 1;
    v13 = objc_msgSend(a3, "objectAtIndex:", v11 >> 1);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v14 = objc_msgSend(a6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v21;
LABEL_7:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(a6);
        v18 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v17), "compareObject:toObject:", v13, a2);
        if (v18)
          break;
        if (v15 == ++v17)
        {
          v15 = objc_msgSend(a6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          if (v15)
            goto LABEL_7;
          return v12;
        }
      }
      if (v18 == 1)
      {
        if (a4 == v12)
          return a4;
        a5 = v12 - 1;
      }
      else
      {
        if (a5 == v12)
          return a5 + 1;
        a4 = v12 + 1;
      }
      if (a4 <= a5)
        continue;
    }
    return v12;
  }
}

void __75__NSFetchedResultsController_PrivateMethods___managedObjectContextDidSave___block_invoke(uint64_t a1)
{
  -[NSFetchedResultsController _core_managedObjectContextDidSave:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (uint64_t)_updateIndexCacheWithFetchedObjects
{
  id *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (id *)result;
    objc_msgSend(*(id *)(result + 136), "removeAllObjects");
    objc_msgSend(v1[18], "removeAllObjects");
    if (!objc_msgSend(v1[1], "resultType") || (result = objc_msgSend(v1[1], "resultType"), result == 1))
    {
      v9 = 0u;
      v10 = 0u;
      v11 = 0u;
      v12 = 0u;
      obj = (id)-[NSFetchedResultsController _fetchedObjectsArrayOfObjectIDs]((uint64_t)v1);
      result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (result)
      {
        v2 = result;
        v3 = 0;
        v4 = *(_QWORD *)v10;
        do
        {
          v5 = 0;
          do
          {
            if (*(_QWORD *)v10 != v4)
              objc_enumerationMutation(obj);
            v6 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v5);
            v7 = (void *)MEMORY[0x18D76B4E4]();
            objc_msgSend(v1[17], "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3 + v5), v6);
            objc_autoreleasePoolPop(v7);
            ++v5;
          }
          while (v2 != v5);
          result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
          v2 = result;
          v3 += v5;
        }
        while (result);
      }
    }
  }
  return result;
}

- (uint64_t)_fetchedObjectsArrayOfObjectIDs
{
  void *v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a1 || objc_msgSend(*(id *)(a1 + 8), "resultType") == 2 || objc_msgSend(*(id *)(a1 + 8), "resultType") == 4)
    return 0;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = *(void **)(a1 + 96);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(v2, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "objectID"));
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }
    return (uint64_t)v2;
  }
  return objc_msgSend(*(id *)(a1 + 96), "arrayFromObjectIDs");
}

- (void)_lowerMoveOperationsToUpdatesForSection:(void *)a3 withInsertedObjects:(void *)a4 deletedObjects:(void *)a5 updatedObjects:
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  unint64_t v22;
  unsigned int v23;
  unsigned int v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  void *context;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    context = (void *)MEMORY[0x18D76B4E4]();
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (uint64_t)v9;
    if (a2)
      v10 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v11 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v41;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v41 != v13)
            objc_enumerationMutation(a5);
          v15 = *(_QWORD **)(*((_QWORD *)&v40 + 1) + 8 * v14);
          if (v15)
          {
            if (v15[2] == 4)
              goto LABEL_19;
            v16 = v9;
            if (!a2)
            {
LABEL_18:
              objc_msgSend(v16, "addObject:", v15);
              goto LABEL_19;
            }
            v17 = v15[6];
          }
          else
          {
            v16 = v9;
            if (!a2)
              goto LABEL_18;
            v17 = 0;
          }
          if (v17 == a2)
            objc_msgSend(v9, "addObject:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v14));
          if (v15)
            v18 = v15[5];
          else
            v18 = 0;
          v16 = (void *)v10;
          if (v18 == a2)
            goto LABEL_18;
LABEL_19:
          ++v14;
        }
        while (v12 != v14);
        v19 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        v12 = v19;
      }
      while (v19);
    }
    v20 = (id)objc_msgSend((id)objc_msgSend(a3, "allObjects"), "mutableCopy");
    objc_msgSend(v20, "addObjectsFromArray:", v9);
    objc_msgSend(v20, "sortUsingComparator:", &__block_literal_global_12);
    v21 = (id)objc_msgSend((id)objc_msgSend(a4, "allObjects"), "mutableCopy");
    objc_msgSend(v21, "addObjectsFromArray:", v10);
    objc_msgSend(v21, "sortUsingComparator:", &__block_literal_global_192);
    if (objc_msgSend(v20, "count"))
    {
      v22 = 0;
      v23 = 0;
      v24 = 0;
      do
      {
        if (objc_msgSend(v21, "count") <= (unint64_t)v23)
          break;
        v25 = (_QWORD *)objc_msgSend(v20, "objectAtIndex:", v22);
        v26 = objc_msgSend(v21, "objectAtIndex:", v23);
        v27 = (_QWORD *)v26;
        if (!v25 || v25[2] != 1)
        {
          if (v26 && *(_QWORD *)(v26 + 16) == 2)
            goto LABEL_55;
          v28 = v25 ? (void *)v25[4] : 0;
          v29 = objc_msgSend(v28, "indexAtPosition:", 1);
          v30 = v27 ? (void *)v27[3] : 0;
          v31 = v29 - v22;
          v32 = objc_msgSend(v30, "indexAtPosition:", 1) - v23;
          if (v31 >= v32)
          {
            if (v32 < v31)
              goto LABEL_55;
            if (v25 == v27)
            {
              if (v25)
                v25[2] = 4;
              ++v24;
LABEL_55:
              ++v23;
              goto LABEL_56;
            }
            v38 = objc_msgSend(v21, "indexOfObject:", v25);
            v33 = objc_msgSend(v20, "indexOfObject:", v27);
            if (v38 != 0x7FFFFFFFFFFFFFFFLL && v38 >= v23)
            {
              if (v33 == 0x7FFFFFFFFFFFFFFFLL || v33 < v22)
                goto LABEL_55;
              v34 = v33;
              v35 = v25 ? (void *)v25[3] : 0;
              if (v31 == objc_msgSend(v35, "indexAtPosition:", 1) - v38)
              {
                v36 = v27 ? (void *)v27[4] : 0;
                if (v32 != objc_msgSend(v36, "indexAtPosition:", 1) - v34)
                  goto LABEL_55;
                v37 = objc_msgSend(v21, "indexOfObject:", v25);
                if (objc_msgSend(v20, "indexOfObject:", v27) > v37)
                  goto LABEL_55;
              }
            }
          }
        }
        ++v24;
LABEL_56:
        v22 = v24;
      }
      while (objc_msgSend(v20, "count") > (unint64_t)v24);
    }
    objc_autoreleasePoolPop(context);
  }
}

- (void)_managedObjectContextDidSave:(id)a3
{
  NSManagedObjectContext *managedObjectContext;
  _QWORD v6[6];

  if (-[NSManagedObjectContext concurrencyType](self->_managedObjectContext, "concurrencyType"))
  {
    managedObjectContext = self->_managedObjectContext;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __75__NSFetchedResultsController_PrivateMethods___managedObjectContextDidSave___block_invoke;
    v6[3] = &unk_1E1EDD430;
    v6[4] = self;
    v6[5] = a3;
    -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v6);
  }
  else
  {
    -[NSFetchedResultsController _core_managedObjectContextDidSave:]((uint64_t)self, a3);
  }
}

- (BOOL)performFetch:(NSError *)error
{
  NSFetchRequestResultType v5;
  BOOL v6;
  id v7;
  id v8;
  NSError *v9;
  char v10;
  _QWORD v12[7];
  BOOL v13;
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3052000000;
  v18 = __Block_byref_object_copy__21;
  v19 = __Block_byref_object_dispose__21;
  v20 = 0;
  v5 = -[NSFetchRequest resultType](self->_fetchRequest, "resultType");
  v6 = -[NSFetchRequest returnsObjectsAsFaults](self->_fetchRequest, "returnsObjectsAsFaults");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __43__NSFetchedResultsController_performFetch___block_invoke;
  v12[3] = &unk_1E1EDF3B0;
  v13 = v5 == 2;
  v12[4] = self;
  v12[5] = &v21;
  v12[6] = &v15;
  v14 = v6;
  -[NSFetchedResultsController _recursivePerformBlockAndWait:withContext:]((uint64_t)self, (uint64_t)v12, self->_managedObjectContext);
  if (!v16[5])
  {
    v7 = -[NSFetchedResultsController delegate](self, "delegate");
    if (v7)
    {
      -[NSFetchedResultsController _conditionallyDispatchSnapshotToDelegate:updatesInfo:]((uint64_t)self, v7, (void *)objc_msgSend(MEMORY[0x1E0C99E60], "set"));

    }
  }
  v8 = (id)v16[5];
  if (error)
  {
    v9 = (NSError *)v16[5];
    if (v9)
      *error = v9;
  }
  v10 = *((_BYTE *)v22 + 24);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  return v10;
}

- (uint64_t)_conditionallyDispatchSnapshotToDelegate:(void *)a3 updatesInfo:
{
  uint64_t v3;
  objc_class *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *context;
  uint64_t v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  const __CFString *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    if ((*(_BYTE *)(result + 73) & 1) != 0)
    {
      v4 = NSClassFromString((NSString *)CFSTR("NSDiffableDataSourceSnapshot"));
      if (!v4)
        v4 = NSClassFromString((NSString *)CFSTR("_PFDiffableDataSourceSnapshot"));
      v5 = objc_alloc_init(v4);
      context = (void *)MEMORY[0x18D76B4E4]();
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v22 = v3;
      obj = *(id *)(v3 + 104);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v29 != v8)
              objc_enumerationMutation(obj);
            v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            v11 = (void *)MEMORY[0x18D76B4E4]();
            v12 = objc_msgSend(v10, "name");
            if (v12)
              v13 = (const __CFString *)v12;
            else
              v13 = CFSTR("d69e6c783a242772974cfc99189691b88e9d37c3");
            v33 = v13;
            objc_msgSend(v5, "appendSectionsWithIdentifiers:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1));
            objc_msgSend(v5, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", objc_msgSend((id)objc_msgSend(v10, "objects"), "valueForKey:", CFSTR("objectID")), v13);
            objc_autoreleasePoolPop(v11);
          }
          v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
        }
        while (v7);
      }
      if (objc_msgSend(a3, "count"))
      {
        v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a3, "count"));
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v15 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v25;
          do
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v25 != v17)
                objc_enumerationMutation(a3);
              objc_msgSend(v14, "addObject:", objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "object"), "objectID"));
            }
            v16 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v16);
        }
        objc_msgSend(v5, "reloadItemsWithIdentifiers:", v14);
      }
      objc_autoreleasePoolPop(context);
      objc_msgSend(a2, "controller:didChangeContentWithSnapshot:", v22, v5);

      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)_recursivePerformBlockAndWait:(void *)a3 withContext:
{
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[7];

  if (result)
  {
    v5 = result;
    v6 = objc_msgSend(a3, "parentContext");
    if (objc_msgSend(a3, "concurrencyType"))
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __72__NSFetchedResultsController__recursivePerformBlockAndWait_withContext___block_invoke;
      v7[3] = &unk_1E1EDF3D8;
      v7[4] = v6;
      v7[5] = v5;
      v7[6] = a2;
      return objc_msgSend(a3, "performBlockAndWait:", v7);
    }
    else
    {
      -[NSManagedObjectContext lockObjectStore]((uint64_t)a3);
      if (v6)
        -[NSFetchedResultsController _recursivePerformBlockAndWait:withContext:](v5, a2);
      else
        (*(void (**)(uint64_t))(a2 + 16))(a2);
      return -[NSManagedObjectContext unlockObjectStore]((uint64_t)a3);
    }
  }
  return result;
}

- (_QWORD)_core_managedObjectContextDidChange:(_QWORD *)result
{
  _QWORD *v2;
  uint64_t v3;

  if (result)
  {
    v2 = result;
    if (objc_msgSend((id)result[2], "concurrencyType", MEMORY[0x1E0C809B0], 3221225472, __82__NSFetchedResultsController_PrivateMethods___core_managedObjectContextDidChange___block_invoke, &unk_1E1EDD430, result, a2))
    {
      return (_QWORD *)objc_msgSend((id)v2[2], "performBlockAndWait:", &v3);
    }
    else
    {
      return __82__NSFetchedResultsController_PrivateMethods___core_managedObjectContextDidChange___block_invoke(&v3);
    }
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("_NSObjectsChangedInManagingContextPrivateNotification"), self->_managedObjectContext);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("_NSManagedObjectContextDidSaveObjectIDsPrivateNotification"), self->_managedObjectContext);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("_NSManagedObjectContextDidMergeChangesObjectIDsPrivateNotification"), self->_managedObjectContext);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("_NSManagedObjectContextDidSaveObjectIDsPrivateNotification"), -[NSManagedObjectContext persistentStoreCoordinator](self->_managedObjectContext, "persistentStoreCoordinator"));
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("_NSManagedObjectContextPrivateDidMutateObjectIDsNotification"), self->_managedObjectContext);

  v3.receiver = self;
  v3.super_class = (Class)NSFetchedResultsController;
  -[NSFetchedResultsController dealloc](&v3, sel_dealloc);
}

- (void)setDelegate:(id)delegate
{
  id *v4;
  id WeakRetained;
  BOOL v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  int v19;
  char v20;
  int v21;
  char v22;
  int v23;
  char v24;
  int v25;
  NSManagedObjectContext *v26;
  NSManagedObjectContext *managedObjectContext;
  uint64_t v28;
  id v29;

  v4 = (id *)self->_delegate;
  v29 = delegate;
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained(v4 + 1);
    if (WeakRetained)
      v6 = WeakRetained == v29;
    else
      v6 = 0;
    if (v6)
    {

      return;
    }
    v7 = WeakRetained;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("_NSObjectsChangedInManagingContextPrivateNotification"), -[NSFetchedResultsController managedObjectContext](self, "managedObjectContext"));
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("_NSManagedObjectContextDidMergeChangesObjectIDsPrivateNotification"), -[NSFetchedResultsController managedObjectContext](self, "managedObjectContext"));
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("_NSManagedObjectContextPrivateDidMutateObjectIDsNotification"), -[NSFetchedResultsController managedObjectContext](self, "managedObjectContext"));
    *(_DWORD *)&self->_flags &= 0xFFFFE03F;
    self->_delegate = 0;

    delegate = v29;
  }
  if (delegate)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 2048;
    else
      v8 = 0;
    self->_flags = (_fetchResultsControllerFlags)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v8);
    v9 = BYTE3(z9dsptsiQ80etb9782fsrs98bfdle88);
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (NSClassFromString((NSString *)CFSTR("NSDiffableDataSourceSnapshot"))
       || NSClassFromString((NSString *)CFSTR("_PFDiffableDataSourceSnapshot"))))
    {
      v10 = 256;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0 || self->_sectionNameKeyPath)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          _NSCoreDataLog(2, (uint64_t)CFSTR("Difference delegate method is not supported when fetched results controller is configured with a sectionNameKeyPath"), v12, v13, v14, v15, v16, v17, v28);
        v18 = objc_opt_respondsToSelector();
        if ((v18 & 1) != 0)
          v19 = 128;
        else
          v19 = 0;
        self->_flags = (_fetchResultsControllerFlags)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v19);
        v20 = objc_opt_respondsToSelector();
        if ((v20 & 1) != 0)
          v21 = 512;
        else
          v21 = 0;
        self->_flags = (_fetchResultsControllerFlags)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v21);
        v22 = objc_opt_respondsToSelector();
        if ((v22 & 1) != 0)
          v23 = 1024;
        else
          v23 = 0;
        self->_flags = (_fetchResultsControllerFlags)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v23);
        v24 = objc_opt_respondsToSelector();
        if ((v24 & 1) != 0)
          v25 = 4096;
        else
          v25 = 0;
        self->_flags = (_fetchResultsControllerFlags)(*(_DWORD *)&self->_flags & 0xFFFFEFFF | v25);
        if (v9 && (v18 & 1) == 0 && (v20 & 1) == 0 && (v22 & 1) == 0 && (v24 & 1) == 0)
          goto LABEL_44;
        goto LABEL_16;
      }
      managedObjectContext = self->_managedObjectContext;
      if (managedObjectContext)
        *(_QWORD *)&managedObjectContext->_flags |= 0x80000000uLL;
      v10 = 64;
    }
    *(_DWORD *)&self->_flags |= v10;
LABEL_16:
    if (-[NSFetchRequest resultType](self->_fetchRequest, "resultType") == 2)
    {
      if (BYTE4(z9dsptsiQ80etb9782fsrs98bfdle88))
      {
        v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ does not support both change tracking and fetch request's with NSDictionaryResultType"), objc_opt_class()), 0);
        objc_exception_throw(v11);
      }
    }
    else
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel__managedObjectContextDidChange_, CFSTR("_NSObjectsChangedInManagingContextPrivateNotification"), -[NSFetchedResultsController managedObjectContext](self, "managedObjectContext"));
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel__managedObjectContextDidChangeObjectIDs_, CFSTR("_NSManagedObjectContextDidMergeChangesObjectIDsPrivateNotification"), -[NSFetchedResultsController managedObjectContext](self, "managedObjectContext"));
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel__managedObjectContextDidMutateObjectIDs_, CFSTR("_NSManagedObjectContextPrivateDidMutateObjectIDsNotification"), -[NSFetchedResultsController managedObjectContext](self, "managedObjectContext"));
      v26 = -[NSFetchedResultsController managedObjectContext](self, "managedObjectContext");
      if (v26)
        *(_QWORD *)&v26->_flags |= 0x80000000uLL;
    }
LABEL_44:
    self->_delegate = -[_PFWeakReference initWithObject:]([_PFWeakReference alloc], "initWithObject:", v29);
  }
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (void)_managedObjectContextDidChangeObjectIDs:(id)a3
{
  -[NSFetchedResultsController _core_managedObjectContextDidChange:](self, objc_msgSend(a3, "userInfo"));
}

- (void)_managedObjectContextDidChange:(id)a3
{
  if (!objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("NSObjectsChangedByMergeChangesKey")))
    -[NSFetchedResultsController _core_managedObjectContextDidChange:](self, objc_msgSend(a3, "userInfo"));
}

- (uint64_t)_objectInResults:(uint64_t)a1
{
  void *v3;
  uint64_t result;

  v3 = *(void **)(a1 + 48);
  if ((*(_BYTE *)(a1 + 72) & 8) == 0
    || (result = (uint64_t)-[NSFetchedResultsController _sectionNameForObject:]((const __CFString *)a1, a2)) != 0)
  {
    if ((objc_msgSend(a2, "isDeleted") & 1) != 0)
    {
      return 0;
    }
    else if (v3)
    {
      return objc_msgSend(v3, "evaluateWithObject:", a2);
    }
    else
    {
      return 1;
    }
  }
  return result;
}

+ (void)initialize
{
  objc_opt_self();
}

- (NSArray)fetchedObjects
{
  id fetchedObjects;

  fetchedObjects = self->_fetchedObjects;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    return (NSArray *)(id)objc_msgSend(fetchedObjects, "copy");
  else
    return (NSArray *)fetchedObjects;
}

- (id)_fetchedObjects
{
  return self->_fetchedObjects;
}

+ (void)deleteCacheWithName:(NSString *)name
{
  void *v4;
  void *v5;
  uint64_t v6;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)+[NSFetchedResultsController _CoreDataSectionCachesPath]();
  v6 = (uint64_t)v5;
  if (name)
    v6 = objc_msgSend(v5, "stringByAppendingPathComponent:", name);
  objc_msgSend(v4, "removeItemAtPath:error:", v6, 0);
}

void __43__NSFetchedResultsController_performFetch___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = 0;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) = 0;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) = 0;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = 0;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 72) &= ~4u;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 72) &= ~2u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setReturnsObjectsAsFaults:", 1);
  if (BYTE3(z9dsptsiQ80etb9782fsrs98bfdle88)
    && !*(_BYTE *)(a1 + 56)
    && (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "hasChanges")
     || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "includesPendingChanges") & 1) == 0))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -[NSFetchedResultsController _restoreCachedSectionInfo](*(_QWORD *)(a1 + 32));
  }
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 96))
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = (id)objc_msgSend(*(id *)(v2 + 16), "executeFetchRequest:error:", *(_QWORD *)(v2 + 8), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (!*(_BYTE *)(a1 + 56))
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "count"));
      -[NSFetchedResultsController _updateIndexCacheWithFetchedObjects](*(_QWORD *)(a1 + 32));
    }
    if (!BYTE3(z9dsptsiQ80etb9782fsrs98bfdle88) || *(_BYTE *)(a1 + 56))
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -[NSFetchedResultsController _restoreCachedSectionInfo](*(_QWORD *)(a1 + 32));
  }
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 96);
  if (v4)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      if (objc_msgSend(*(id *)(v3 + 104), "count"))
        goto LABEL_22;
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(void **)(v3 + 96);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -[NSFetchedResultsController _computeSectionInfo:error:](v3, v4, (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)
      || (v5 = *(_QWORD *)(a1 + 32), *(_QWORD *)(v5 + 40))
      && *(_QWORD *)(v5 + 80)
      && ((v6 = *(_QWORD *)(v5 + 16)) == 0 || (*(_BYTE *)(v6 + 42) & 2) == 0)
      && (*(_DWORD *)(v5 + 72) |= 1u,
          -[NSFetchedResultsController _core_managedObjectContextDidSave:](*(_QWORD *)(a1 + 32), 0),
          !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)))
    {

      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = 0;
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = 0;

      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144) = 0;
    }
  }
LABEL_22:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setReturnsObjectsAsFaults:", *(unsigned __int8 *)(a1 + 57));
  v7 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v8 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v8 + 96))
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) = 0;

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = 0;
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 72) &= ~4u;
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 72) &= ~2u;
  }
}

- (uint64_t)_restoreCachedSectionInfo
{
  uint64_t v1;
  void *v2;
  const char *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  int v24;
  void *v25;
  unint64_t v26;
  unsigned int v27;
  unsigned int v28;
  void *v29;
  id v30;
  void *v31;
  __darwin_time_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unsigned int v41;
  unsigned int v42;
  id v43;
  id v44;
  unint64_t v45;
  unint64_t v46;
  unsigned int v47;
  unsigned int v48;
  _QWORD *v49;
  _QWORD *v50;
  unint64_t v51;
  unint64_t v52;
  int v53;
  void *v54;
  unint64_t v55;
  unint64_t v56;
  unsigned int v57;
  uint64_t v58;
  id v59;
  void *v60;
  void *v61;
  unint64_t v62;
  unint64_t v63;
  unsigned int v64;
  uint64_t v65;
  id v66;
  void *v67;
  __CFArray *Mutable;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unsigned int v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unsigned int v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  uint64_t v80;
  unsigned int Count;
  __CFArray *v82;
  BOOL v83;
  int v84;
  __CFArray *v85;
  unint64_t v86;
  unint64_t v87;
  unsigned int v88;
  void *v89;
  int v90;
  unint64_t v91;
  unint64_t v92;
  unsigned int v93;
  uint64_t v94;
  unint64_t v95;
  unint64_t v96;
  unsigned int v97;
  unint64_t v98;
  unint64_t v99;
  unint64_t v100;
  void *v101;
  void *v102;
  uint64_t v103;
  unsigned int v104;
  unint64_t v105;
  unint64_t v106;
  unsigned int v107;
  void *v108;
  int v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  id v113;
  unsigned int v114;
  unint64_t v115;
  stat v116;

  if (result)
  {
    v1 = result;
    result = (uint64_t)-[NSFetchedResultsController _sectionCachePath](result);
    if (result)
    {
      v2 = (void *)objc_msgSend((id)result, "stringByAppendingPathComponent:", CFSTR("sectionInfo"));
      v3 = (const char *)objc_msgSend(v2, "fileSystemRepresentation");
      memset(&v116, 0, sizeof(v116));
      if (stat(v3, &v116))
        return 0;
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfMappedFile:", v2);
      v5 = objc_msgSend(v4, "length");
      v115 = 0;
      if (v5 < 0x20
        || ((v6 = v5, v7 = (_QWORD *)objc_msgSend(v4, "bytes"), *v7 == 0x3562366135623134)
          ? (v8 = v7[1] == 0x3463383438653663)
          : (v8 = 0),
            v8 ? (v9 = v7[2] == 0x6330383438613236) : (v9 = 0),
            v9 ? (v10 = v7[3] == 0x3366656163343264) : (v10 = 0),
            !v10))
      {
LABEL_27:

        unlink(v3);
        return 0;
      }
      v11 = (uint64_t)v7;
      v115 += 48;
      v12 = (void *)objc_msgSend((id)objc_msgSend((id)v1, "fetchRequest"), "entity");
      v13 = _newReadStringFromBytes(v11, &v115, v6);
      if (!v13
        || (objc_msgSend((id)objc_msgSend(v12, "name"), "isEqualToString:", v13) & 1) == 0
        || (v13, (v13 = _newReadDataFromBytes(v11, &v115, v6)) == 0)
        || (objc_msgSend((id)objc_msgSend(v12, "versionHash"), "isEqualToData:", v13) & 1) == 0)
      {

        goto LABEL_27;
      }

      v14 = _newReadStringFromBytes(v11, &v115, v6);
      if (v14)
      {
        v15 = *(void **)(v1 + 24);
        if (!v15)
        {
LABEL_24:
          if (objc_msgSend(v14, "length"))
            goto LABEL_25;
LABEL_30:

          v16 = (v115 + 3) & 0xFFFFFFFFFFFFFFFCLL;
          if (v16 + 4 <= v6)
          {
            v114 = bswap32(*(_DWORD *)(v11 + v16));
            v115 = v16 + 4;
          }
          else
          {
            v114 = 0;
          }
          if (!BYTE3(z9dsptsiQ80etb9782fsrs98bfdle88)
            && objc_msgSend((id)objc_msgSend((id)v1, "fetchedObjects"), "count") != v114)
          {
            goto LABEL_27;
          }
          v17 = (void *)objc_msgSend(*(id *)(v1 + 8), "sortDescriptors");
          v18 = v17;
          v19 = (v115 + 3) & 0xFFFFFFFFFFFFFFFCLL;
          if (v19 + 4 <= v6)
          {
            v20 = *(_DWORD *)(v11 + v19);
            v21 = bswap32(v20);
            v115 = v19 + 4;
            if ((_DWORD)v21 != objc_msgSend(v17, "count"))
              goto LABEL_27;
            if (v20)
            {
              v22 = 0;
              do
              {
                v23 = _newReadStringFromBytes(v11, &v115, v6);
                v24 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v18, "objectAtIndex:", v22), "key"), "isEqualToString:", v23);

                if (!v24)
                  goto LABEL_27;
              }
              while (v21 != ++v22);
            }
          }
          else if (objc_msgSend(v17, "count"))
          {
            goto LABEL_27;
          }
          v25 = (void *)objc_msgSend(*(id *)(v1 + 8), "affectedStores");
          if (!objc_msgSend(v25, "count"))
            v25 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 16), "persistentStoreCoordinator"), "persistentStores");
          v26 = (v115 + 3) & 0xFFFFFFFFFFFFFFFCLL;
          if (v26 + 4 <= v6)
          {
            v27 = *(_DWORD *)(v11 + v26);
            v28 = bswap32(v27);
            v115 = v26 + 4;
            if (v28 != objc_msgSend(v25, "count"))
              goto LABEL_27;
            if (v27)
            {
              v29 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:", v25, objc_msgSend(v25, "valueForKey:", CFSTR("identifier")));
              do
              {
                v30 = _newReadStringFromBytes(v11, &v115, v6);
                v31 = (void *)objc_msgSend(v29, "objectForKey:", v30);

                if (!v31)
                  goto LABEL_27;
                v32 = stat_path_for_modication_time((void *)objc_msgSend(v31, "URL"));
                v34 = (v115 + 7) & 0xFFFFFFFFFFFFFFF8;
                v35 = v34 + 8;
                if (v34 + 8 <= v6)
                {
                  v36 = bswap64(*(_QWORD *)(v11 + v34));
                  v115 = v34 + 8;
                  v34 = (v34 + 15) & 0xFFFFFFFFFFFFFFF8;
                  v35 = v34 + 8;
                }
                else
                {
                  v36 = 0;
                }
                if (v35 <= v6)
                {
                  v37 = bswap64(*(_QWORD *)(v11 + v34));
                  v115 = v35;
                }
                else
                {
                  v37 = 0;
                }
                if (v36 != v32 || v37 != v33)
                  goto LABEL_27;
              }
              while (--v28);
            }
          }
          else if (objc_msgSend(v25, "count"))
          {
            goto LABEL_27;
          }

          *(_QWORD *)(v1 + 104) = objc_alloc_init(MEMORY[0x1E0C99E10]);
          *(_QWORD *)(v1 + 112) = objc_alloc_init(MEMORY[0x1E0C99E08]);

          *(_QWORD *)(v1 + 120) = 0;
          *(_QWORD *)(v1 + 128) = 0;
          v38 = v115;
          v39 = (v115 + 3) & 0xFFFFFFFFFFFFFFFCLL;
          v40 = v39 + 4;
          if (v39 + 4 <= v6)
          {
            v41 = *(_DWORD *)(v11 + v39);
            v115 = v40;
            v38 = v40;
            if (v41)
            {
              v42 = bswap32(v41);
              while (1)
              {
                v43 = _newReadStringFromBytes(v11, &v115, v6);
                v44 = _newReadStringFromBytes(v11, &v115, v6);
                v14 = v44;
                v45 = (v115 + 3) & 0xFFFFFFFFFFFFFFFCLL;
                v46 = v45 + 4;
                if (v45 + 4 <= v6)
                {
                  v47 = bswap32(*(_DWORD *)(v11 + v45));
                  v115 = v45 + 4;
                  v45 = (v45 + 7) & 0xFFFFFFFFFFFFFFFCLL;
                  v46 = v45 + 4;
                }
                else
                {
                  v47 = 0;
                }
                if (v46 <= v6)
                {
                  v48 = bswap32(*(_DWORD *)(v11 + v45));
                  v115 = v46;
                }
                else
                {
                  v48 = 0;
                }
                if (!v43 || !v44)
                  break;
                v49 = -[_NSDefaultSectionInfo initWithController:name:sectionId:indexTitle:sectionOffset:]([_NSDefaultSectionInfo alloc], v1, v43, 0, v44, v48);
                v50 = v49;
                if (v49)
                {
                  v49[5] = v47;

                  v50[7] = 0;
                }

                objc_msgSend(*(id *)(v1 + 104), "addObject:", v50);
                if ((*(_BYTE *)(v1 + 72) & 8) != 0)
                  objc_msgSend(*(id *)(v1 + 112), "setObject:forKey:", v50, objc_msgSend(v50, "name"));

                if (!--v42)
                {
                  v38 = v115;
                  goto LABEL_78;
                }
              }

              goto LABEL_25;
            }
          }
LABEL_78:
          v51 = (v38 + 3) & 0xFFFFFFFFFFFFFFFCLL;
          v52 = v51 + 4;
          if (v51 + 4 > v6
            || (v53 = *(_DWORD *)(v11 + v51), v115 = v52, !v53)
            || !BYTE3(z9dsptsiQ80etb9782fsrs98bfdle88))
          {
LABEL_79:

            return 1;
          }
          v113 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
          v54 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v55 = (v115 + 3) & 0xFFFFFFFFFFFFFFFCLL;
          v56 = v55 + 4;
          if (v55 + 4 <= v6)
          {
            v57 = *(_DWORD *)(v11 + v55);
            v115 = v56;
            if (v57)
            {
              v58 = bswap32(v57);
              do
              {
                v59 = _newReadStringFromBytes(v11, &v115, v6);
                if (!v59)
                  goto LABEL_122;
                v60 = v59;
                objc_msgSend(v54, "addObject:", v59);

              }
              while (--v58);
            }
          }
          v61 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v62 = (v115 + 3) & 0xFFFFFFFFFFFFFFFCLL;
          v63 = v62 + 4;
          if (v62 + 4 <= v6)
          {
            v64 = *(_DWORD *)(v11 + v62);
            v115 = v63;
            if (v64)
            {
              v65 = bswap32(v64);
              while (1)
              {
                v66 = _newReadStringFromBytes(v11, &v115, v6);
                if (!v66)
                  break;
                v67 = v66;
                objc_msgSend(v61, "addObject:", v66);

                if (!--v65)
                  goto LABEL_92;
              }
LABEL_122:
              objc_msgSend(v113, "drain");
              goto LABEL_27;
            }
          }
LABEL_92:
          v112 = v54;
          Mutable = CFArrayCreateMutable(0, 0, 0);
          v69 = v115;
          v70 = (v115 + 3) & 0xFFFFFFFFFFFFFFFCLL;
          v71 = v70 + 4;
          if (v70 + 4 <= v6 && (v72 = *(_DWORD *)(v11 + v70), v115 = v71, v69 = v71, v72))
          {
            v73 = bswap32(v72);
            while (1)
            {
              v74 = (v115 + 3) & 0xFFFFFFFFFFFFFFFCLL;
              v75 = v74 + 4;
              if (v74 + 4 > v6)
                break;
              v76 = *(_DWORD *)(v11 + v74);
              v115 = v75;
              if (!v76)
                break;
              CFArrayAppendValue(Mutable, (const void *)bswap32(v76));
              if (!--v73)
              {
                v69 = v115;
                goto LABEL_99;
              }
            }
          }
          else
          {
LABEL_99:
            v77 = (v69 + 7) & 0xFFFFFFFFFFFFFFF8;
            v78 = v77 + 8;
            if (v77 + 8 <= v6)
            {
              v79 = *(_QWORD *)(v11 + v77);
              v115 = v78;
              if (v79)
              {
                v80 = bswap64(v79);
                v110 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v80);
                Count = CFArrayGetCount(Mutable);
                v82 = CFArrayCreateMutable(0, 0, 0);
                v111 = v80;
                v83 = v80 >= 0x1000000 || Count >= 0xFF;
                v84 = !v83;
                v109 = v84;
                if (v83)
                {
                  v91 = (v115 + 3) & 0xFFFFFFFFFFFFFFFCLL;
                  v92 = v91 + 4;
                  if (v91 + 4 <= v6)
                  {
                    v93 = bswap32(*(_DWORD *)(v11 + v91));
                    v115 = v92;
                  }
                  else
                  {
                    v93 = 0;
                  }
                  v103 = v93;
                  if (Count >= 0xFF)
                  {
                    if (v93)
                    {
                      do
                      {
                        v105 = (v115 + 1) & 0xFFFFFFFFFFFFFFFELL;
                        v106 = v105 + 2;
                        if (v105 + 2 <= v6)
                        {
                          v107 = bswap32(*(unsigned __int16 *)(v11 + v105)) >> 16;
                          v115 = v106;
                        }
                        else
                        {
                          v107 = 0;
                        }
                        if (v107 >= Count)
                          goto LABEL_112;
                        CFArrayAppendValue(v82, (const void *)v107);
                      }
                      while (--v103);
                    }
                  }
                  else if (v93)
                  {
                    do
                    {
                      if (v115 + 1 <= v6)
                        v104 = *(unsigned __int8 *)(v11 + v115++);
                      else
                        v104 = 0;
                      if (v104 >= Count)
                        goto LABEL_112;
                      CFArrayAppendValue(v82, (const void *)v104);
                    }
                    while (--v103);
                  }
                }
                v85 = CFArrayCreateMutable(0, 0, 0);
                v86 = (v115 + 3) & 0xFFFFFFFFFFFFFFFCLL;
                v87 = v86 + 4;
                if (v86 + 4 <= v6)
                {
                  v88 = bswap32(*(_DWORD *)(v11 + v86));
                  v115 = v87;
                }
                else
                {
                  v88 = 0;
                }
                v94 = v88;
                if (v111 >= 0xFFFFFFFFLL)
                {
                  if (v88)
                  {
                    do
                    {
                      v98 = (v115 + 7) & 0xFFFFFFFFFFFFFFF8;
                      v99 = v98 + 8;
                      if (v98 + 8 > v6)
                        goto LABEL_113;
                      v100 = *(_QWORD *)(v11 + v98);
                      v115 = v99;
                      if (!v100)
                        goto LABEL_113;
                      CFArrayAppendValue(v85, (const void *)bswap64(v100));
                    }
                    while (--v94);
                  }
                }
                else if (v88)
                {
                  do
                  {
                    v95 = (v115 + 3) & 0xFFFFFFFFFFFFFFFCLL;
                    v96 = v95 + 4;
                    if (v95 + 4 > v6)
                      goto LABEL_113;
                    v97 = *(_DWORD *)(v11 + v95);
                    v115 = v96;
                    if (!v97)
                      goto LABEL_113;
                    CFArrayAppendValue(v85, (const void *)bswap32(v97));
                  }
                  while (--v94);
                }
                v101 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v112, v61, Mutable, v110, 0);
                if (v109)
                  v102 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v85);
                else
                  v102 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v82, v85, 0);
                v108 = (void *)+[_PFRoutines _newObjectIDsArrayWithMapping:andEntries:andCoordinator:]((uint64_t)_PFRoutines, v101, v102, (void *)objc_msgSend(*(id *)(v1 + 16), "persistentStoreCoordinator"));
                v89 = v108;
                if (v108 && objc_msgSend(v108, "count") == v114)
                {
                  *(_QWORD *)(v1 + 96) = -[_PFBatchFaultingArray initWithPFArray:andRequest:andContext:]([_PFBatchFaultingArray alloc], "initWithPFArray:andRequest:andContext:", v89, *(_QWORD *)(v1 + 8), *(_QWORD *)(v1 + 16));
                  *(_QWORD *)(v1 + 136) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v89, "count"));
                  *(_QWORD *)(v1 + 144) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  *(_DWORD *)(v1 + 72) = *(_DWORD *)(v1 + 72) & 0xFFFFFFF9 | 2;
                  v90 = 1;
                  if (!Mutable)
                  {
LABEL_116:
                    if (v82)
                      CFRelease(v82);
                    if (v85)
                      CFRelease(v85);

                    objc_msgSend(v113, "drain");
                    if (!v90)
                      goto LABEL_27;
                    goto LABEL_79;
                  }
LABEL_115:
                  CFRelease(Mutable);
                  goto LABEL_116;
                }
LABEL_114:
                v90 = 0;
                if (!Mutable)
                  goto LABEL_116;
                goto LABEL_115;
              }
            }
          }
          v82 = 0;
LABEL_112:
          v85 = 0;
LABEL_113:
          v89 = 0;
          goto LABEL_114;
        }
        if (objc_msgSend(v15, "isEqualToString:", v14))
        {
          if (*(_QWORD *)(v1 + 24))
            goto LABEL_30;
          goto LABEL_24;
        }
      }
LABEL_25:

      goto LABEL_27;
    }
  }
  return result;
}

- (id)_sectionCachePath
{
  id result;

  if (!*(_QWORD *)(a1 + 40))
    return 0;
  result = *(id *)(a1 + 64);
  if (!result)
  {
    result = (id)objc_msgSend((id)+[NSFetchedResultsController _CoreDataSectionCachesPath](), "stringByAppendingPathComponent:", *(_QWORD *)(a1 + 40));
    *(_QWORD *)(a1 + 64) = result;
  }
  return result;
}

- (uint64_t)_computeSectionInfo:(id *)a3 error:
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  id v13;
  _NSDefaultSectionInfo *v14;
  _QWORD *v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  id v22;
  _NSDefaultSectionInfo *v23;
  __CFString *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  id v42;
  void *v43;
  NSExpressionDescription *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t k;
  void *v59;
  void *v60;
  void *v61;
  __CFString *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  __CFString *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  _QWORD *v74;
  unsigned int v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  id *v82;
  id *v83;
  void *v84;
  void *v85;
  id obj;
  id obja;
  unint64_t v88;
  uint64_t v89;
  _QWORD v90[7];
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  id v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v4 = a2;
  v5 = result;
  v6 = objc_msgSend(a2, "count");

  *(_QWORD *)(v5 + 104) = objc_alloc_init(MEMORY[0x1E0C99E10]);
  *(_QWORD *)(v5 + 112) = objc_alloc_init(MEMORY[0x1E0C99E08]);

  *(_QWORD *)(v5 + 120) = 0;
  *(_QWORD *)(v5 + 128) = 0;
  v7 = *(_DWORD *)(v5 + 72);
  v88 = v6;
  if (!v6 && (v7 & 8) != 0)
    return 1;
  if ((v7 & 8) == 0)
  {
    v8 = -[_NSDefaultSectionInfo initWithController:name:sectionId:indexTitle:sectionOffset:]([_NSDefaultSectionInfo alloc], v5, 0, 0, 0, 0);
    v9 = v8;
    if (v8)
    {
      v8[5] = v88;

      v9[7] = 0;
    }
    objc_msgSend(*(id *)(v5 + 104), "addObject:", v9);

    return 1;
  }
  if (objc_msgSend(*(id *)(v5 + 8), "includesPendingChanges")
    && ((objc_msgSend(*(id *)(v5 + 16), "hasChanges") & 1) != 0 || objc_msgSend(*(id *)(v5 + 16), "parentContext"))
    || (*(_BYTE *)(v5 + 73) & 0x20) != 0
    || objc_msgSend(*(id *)(v5 + 8), "fetchLimit")
    || objc_msgSend(*(id *)(v5 + 8), "fetchOffset"))
  {
    goto LABEL_14;
  }
  v36 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v5 + 8), "affectedStores"), "copy");
  if (!v36)
    v36 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v5 + 16), "persistentStoreCoordinator"), "persistentStores"), "copy");
  v37 = v36;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v100, v106, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v101;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v101 != v40)
          objc_enumerationMutation(v36);
        if ((__CFString *)objc_msgSend(*(id *)(*((_QWORD *)&v100 + 1) + 8 * i), "type") != CFSTR("SQLite"))
          goto LABEL_14;
      }
      v39 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v100, v106, 16);
    }
    while (v39);
  }
  v85 = v4;
  v83 = a3;
  v42 = (id)objc_msgSend((id)objc_msgSend((id)v5, "fetchRequest"), "copy");
  objc_msgSend(v42, "setResultType:", 2);
  objc_msgSend(v42, "setIncludesPropertyValues:", 1);
  objc_msgSend(v42, "setFetchBatchSize:", 0);
  v43 = (void *)objc_msgSend((id)v5, "sectionNameKeyPath");
  v44 = objc_alloc_init(NSExpressionDescription);
  -[NSExpressionDescription setExpression:](v44, "setExpression:", objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForFunction:arguments:", CFSTR("count:"), objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForFunction:selectorName:arguments:", objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", NSClassFromString((NSString *)CFSTR("_NSPredicateUtilities"))), CFSTR("distinct:"), objc_msgSend(MEMORY[0x1E0C99D20],
            "arrayWithObject:",
            objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject"))))));
  -[NSPropertyDescription setName:](v44, "setName:", CFSTR("sectionCount"));
  -[NSExpressionDescription setExpressionResultType:](v44, "setExpressionResultType:", 200);
  objc_msgSend(v42, "setPropertiesToFetch:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v43, v44, 0));
  objc_msgSend(v42, "setPropertiesToGroupBy:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v43, 0));
  v45 = (void *)objc_msgSend(v42, "sortDescriptors");
  if (objc_msgSend(v45, "count"))
  {
    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v96, v105, 16);
    if (v46)
    {
      v47 = v46;
      v48 = 0;
      v49 = *(_QWORD *)v97;
      do
      {
        for (j = 0; j != v47; ++j)
        {
          if (*(_QWORD *)v97 != v49)
            objc_enumerationMutation(v45);
          v51 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * j);
          if (objc_msgSend(v43, "isEqualToString:", objc_msgSend(v51, "key")))
            v48 = (uint64_t)v51;
        }
        v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v96, v105, 16);
      }
      while (v47);
      v4 = v85;
      if (v48)
        goto LABEL_68;
    }
    v52 = objc_msgSend((id)objc_msgSend(v45, "objectAtIndex:", 0), "ascending");
  }
  else
  {
    v52 = 1;
  }
  v48 = objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", v43, v52);
LABEL_68:
  objc_msgSend(v42, "setSortDescriptors:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v48));
  v95 = 0;
  v53 = (void *)objc_msgSend((id)objc_msgSend((id)v5, "managedObjectContext"), "executeFetchRequest:error:", v42, &v95);
  if (v53)
  {
    v54 = v53;
    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
    if (v55)
    {
      v56 = v55;
      obja = v54;
      v57 = 0;
      v89 = *(_QWORD *)v92;
      do
      {
        for (k = 0; k != v56; ++k)
        {
          if (*(_QWORD *)v92 != v89)
            objc_enumerationMutation(obja);
          v59 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * k);
          v60 = (void *)MEMORY[0x18D76B4E4]();
          v61 = (void *)objc_msgSend(v59, "valueForKeyPath:", v43);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            *(_DWORD *)(v5 + 72) |= 0x10u;
            v62 = (__CFString *)(id)objc_msgSend(v61, "_retainedURIString");
          }
          else
          {
            v62 = (__CFString *)objc_msgSend(v61, "description");
          }
          v69 = v62;
          if (!v62)
          {
            _NSCoreDataLog(1, (uint64_t)CFSTR("(NSFetchedResultsController) A section returned nil value for section name key path '%@'. Objects will be placed in unnamed section"), v63, v64, v65, v66, v67, v68, *(_QWORD *)(v5 + 24));
            v69 = &stru_1E1EE23F0;
          }
          v70 = objc_msgSend(*(id *)(v5 + 112), "objectForKey:", v69);
          if (v70)
          {
            v71 = v70;
            v72 = objc_msgSend((id)objc_msgSend(v59, "valueForKeyPath:", CFSTR("sectionCount")), "unsignedIntValue");
            *(_QWORD *)(v71 + 40) = objc_msgSend((id)v71, "numberOfObjects") + v72;

            *(_QWORD *)(v71 + 56) = 0;
          }
          else
          {
            v73 = (void *)-[NSFetchedResultsController _resolveSectionIndexTitleForSectionName:](v5, (uint64_t)v69);
            v74 = -[_NSDefaultSectionInfo initWithController:name:sectionId:indexTitle:sectionOffset:]([_NSDefaultSectionInfo alloc], v5, v69, (void *)objc_msgSend(v59, "valueForKeyPath:", v43), v73, v57);
            v75 = objc_msgSend((id)objc_msgSend(v59, "valueForKeyPath:", CFSTR("sectionCount")), "unsignedIntValue");
            v72 = v75;
            if (v74)
            {
              v74[5] = v75;

              v74[7] = 0;
            }
            objc_msgSend(*(id *)(v5 + 104), "addObject:", v74);
            objc_msgSend(*(id *)(v5 + 112), "setObject:forKey:", v74, v69);

          }
          v57 += v72;
          objc_autoreleasePoolPop(v60);
        }
        v56 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
      }
      while (v56);
    }
    return 1;
  }
  objc_msgSend(v95, "userInfo");
  _NSCoreDataLog(1, (uint64_t)CFSTR("Fetching ERROR during section computation with request = %@ and error = %@ and userInfo = %@"), v76, v77, v78, v79, v80, v81, (uint64_t)v42);
  a3 = v83;
LABEL_14:
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  if (objc_msgSend(*(id *)(v5 + 8), "resultType") != 2)
  {
    v90[0] = MEMORY[0x1E0C809B0];
    v90[1] = 3221225472;
    v90[2] = __72__NSFetchedResultsController_PrivateMethods___computeSectionInfo_error___block_invoke;
    v90[3] = &unk_1E1EDD8A8;
    v90[5] = v5;
    v90[6] = v88;
    v90[4] = v4;
    -[NSFetchedResultsController _recursivePerformBlockAndWait:withContext:](v5, (uint64_t)v90, *(void **)(v5 + 16));
  }
  v11 = (__CFString *)objc_msgSend(v4, "objectAtIndex:", 0);
  v12 = (id)-[NSFetchedResultsController _sectionNameForObject:]((const __CFString *)v5, v11);
  v13 = (id)-[NSFetchedResultsController _resolveSectionIndexTitleForSectionName:](v5, (uint64_t)v12);
  v14 = [_NSDefaultSectionInfo alloc];
  if (objc_msgSend(*(id *)(v5 + 8), "resultType") != 1)
  {
    if (objc_msgSend(*(id *)(v5 + 8), "resultType") == 4)
      v11 = CFSTR("Count");
    else
      v11 = (__CFString *)-[__CFString valueForKeyPath:](v11, "valueForKeyPath:", *(_QWORD *)(v5 + 24));
  }
  obj = v13;
  v15 = -[_NSDefaultSectionInfo initWithController:name:sectionId:indexTitle:sectionOffset:](v14, v5, v12, v11, v13, 0);
  objc_msgSend(*(id *)(v5 + 104), "addObject:", v15);
  objc_msgSend(*(id *)(v5 + 112), "setObject:forKey:", v15, v12);

  if (v88 < 2)
  {
    v16 = 1;
LABEL_33:

    goto LABEL_34;
  }
  v84 = v4;
  v82 = a3;
  v17 = 0;
  v18 = 1;
  v16 = 1;
  while (1)
  {
    v19 = (void *)MEMORY[0x18D76B4E4]();
    v20 = (__CFString *)objc_msgSend(v84, "objectAtIndex:", v18);
    v21 = (__CFString *)-[NSFetchedResultsController _sectionNameForObject:]((const __CFString *)v5, v20);
    if ((-[__CFString isEqualToString:](v21, "isEqualToString:", v12) & 1) == 0)
      break;
LABEL_32:
    ++v16;
    objc_autoreleasePoolPop(v19);
    v17 = ++v18 >= v88;
    if (v88 == v18)
      goto LABEL_33;
  }
  if (!objc_msgSend(v10, "containsObject:", v21))
  {
    objc_msgSend(v10, "addObject:", v12);
    if (v15)
    {
      v15[5] = v16;

      v15[7] = 0;
    }

    v12 = v21;
    v22 = (id)-[NSFetchedResultsController _resolveSectionIndexTitleForSectionName:](v5, (uint64_t)v12);
    v23 = [_NSDefaultSectionInfo alloc];
    if (objc_msgSend(*(id *)(v5 + 8), "resultType") == 1)
    {
      v24 = v20;
    }
    else
    {
      v25 = objc_msgSend(*(id *)(v5 + 8), "resultType");
      v24 = CFSTR("Count");
      if (v25 != 4)
        v24 = (__CFString *)-[__CFString valueForKeyPath:](v20, "valueForKeyPath:", *(_QWORD *)(v5 + 24), CFSTR("Count"));
    }
    obj = v22;
    v15 = -[_NSDefaultSectionInfo initWithController:name:sectionId:indexTitle:sectionOffset:](v23, v5, v12, v24, v22, v18);
    objc_msgSend(*(id *)(v5 + 104), "addObject:", v15);
    objc_msgSend(*(id *)(v5 + 112), "setObject:forKey:", v15, v12);

    v16 = 0;
    goto LABEL_32;
  }
  v26 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The fetched object at index %lu has an out of order section name '%@'. Objects must be sorted by section name"), v18, v12);
  if (v82)
  {
    v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
    *v82 = (id)objc_msgSend(v27, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v26, CFSTR("reason")));
  }
  v28 = objc_opt_class();
  _NSCoreDataLog(1, (uint64_t)CFSTR("(%@) %@"), v29, v30, v31, v32, v33, v34, v28);

  *(_QWORD *)(v5 + 104) = 0;
  *(_QWORD *)(v5 + 112) = 0;

  *(_QWORD *)(v5 + 120) = 0;
  *(_QWORD *)(v5 + 128) = 0;
  objc_autoreleasePoolPop(v19);

  if (v17)
  {
LABEL_34:
    if (v15)
    {
      v15[5] = v16;

      v15[7] = 0;
    }
    return 1;
  }
  if (v82)
    v35 = *v82;
  return 0;
}

+ (uint64_t)_CoreDataSectionCachesPath
{
  uint64_t result;
  void *v1;
  NSArray *v2;
  NSString *v3;
  NSString *v4;
  void *v5;
  NSString *v6;

  objc_opt_self();
  result = _CoreDataSectionCachesPath__cachesPath;
  if (!_CoreDataSectionCachesPath__cachesPath)
  {
    v1 = (void *)objc_opt_class();
    objc_sync_enter(v1);
    v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    if (-[NSArray count](v2, "count"))
      v3 = -[NSArray objectAtIndex:](v2, "objectAtIndex:", 0);
    else
      v3 = NSTemporaryDirectory();
    v4 = v3;
    v5 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier");
    if (objc_msgSend(v5, "length"))
      v4 = -[NSString stringByAppendingPathComponent:](v4, "stringByAppendingPathComponent:", v5);
    v6 = -[NSString stringByAppendingPathComponent:](-[NSString stringByAppendingPathComponent:](v4, "stringByAppendingPathComponent:", CFSTR(".CoreDataCaches")), "stringByAppendingPathComponent:", CFSTR("SectionInfoCaches"));
    if (!_CoreDataSectionCachesPath__cachesPath)
      _CoreDataSectionCachesPath__cachesPath = v6;
    objc_sync_exit(v1);
    return _CoreDataSectionCachesPath__cachesPath;
  }
  return result;
}

- (id)objectAtIndexPath:(NSIndexPath *)indexPath
{
  unint64_t v5;
  unint64_t v6;
  NSMutableOrderedSet *sections;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v31;
  uint64_t v32;
  uint64_t v33;

  if (!indexPath && BYTE4(z9dsptsiQ80etb9782fsrs98bfdle88))
    return 0;
  v5 = -[NSIndexPath indexAtPosition:](indexPath, "indexAtPosition:", 0);
  v6 = -[NSIndexPath indexAtPosition:](indexPath, "indexAtPosition:", 1);
  sections = self->_sections;
  if (sections)
  {
    v8 = -[NSMutableOrderedSet count](sections, "count");
    if (v5 >= -[NSMutableOrderedSet count](self->_sections, "count"))
    {
      if (v8)
      {
        _NSCoreDataLog(1, (uint64_t)CFSTR("NSFetchedResultsController: no section at index %lu in sections list"), v9, v10, v11, v12, v13, v14, v5);
        if (HIBYTE(dword_1ECD8DE18))
        {
          v15 = (void *)MEMORY[0x1E0C99DA0];
          v16 = *MEMORY[0x1E0C99778];
          v17 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no section at index %lu"), v5);
          v18 = v15;
          v19 = v16;
          goto LABEL_22;
        }
        return 0;
      }
LABEL_14:
      _NSCoreDataLog(1, (uint64_t)CFSTR("NSFetchedResultsController: cannot access fetched objects before -performFetch:"), v9, v10, v11, v12, v13, v14, v33);
      if (HIBYTE(dword_1ECD8DE18))
      {
        v18 = (void *)MEMORY[0x1E0C99DA0];
        v19 = *MEMORY[0x1E0C99778];
        v17 = CFSTR("cannot access fetched objects before -performFetch:");
        goto LABEL_22;
      }
      return 0;
    }
  }
  else if (v5 >= objc_msgSend(0, "count"))
  {
    goto LABEL_14;
  }
  v20 = (_QWORD *)-[NSMutableOrderedSet objectAtIndex:](self->_sections, "objectAtIndex:", v5);
  if (v6 >= objc_msgSend(v20, "numberOfObjects"))
  {
    _NSCoreDataLog(1, (uint64_t)CFSTR("NSFetchedResultsController: no object at index %lu in section at index %lu"), v21, v22, v23, v24, v25, v26, v6);
    if (HIBYTE(dword_1ECD8DE18))
    {
      v31 = (void *)MEMORY[0x1E0C99DA0];
      v32 = *MEMORY[0x1E0C99778];
      v17 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no object at index %lu in section at index %lu"), v6, v5);
      v18 = v31;
      v19 = v32;
LABEL_22:
      objc_exception_throw((id)objc_msgSend(v18, "exceptionWithName:reason:userInfo:", v19, v17, 0));
    }
    return 0;
  }
  if (v20)
    v27 = v20[4];
  else
    v27 = 0;
  v28 = v27 + v6;
  if (v27 + v6 >= objc_msgSend(self->_fetchedObjects, "count"))
    v29 = 0;
  else
    v29 = (void *)objc_msgSend(self->_fetchedObjects, "objectAtIndex:", v28);
  return v29;
}

- (void)_core_managedObjectContextDidSave:(uint64_t)a1
{
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  off_t st_size;
  const char *v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  const char *v17;
  int v18;
  int v19;
  void *v20;
  ssize_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t k;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t m;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t ii;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t n;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t kk;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t jj;
  unint64_t v94;
  ssize_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  int v111;
  void *v112;
  char *v113;
  id v114;
  unint64_t __offsetb;
  id __offseta;
  unint64_t v117;
  unint64_t v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
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
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  id v147;
  id v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  uint64_t v157;
  unint64_t __buf;
  _BYTE v159[128];
  _BYTE v160[128];
  _BYTE v161[128];
  _BYTE v162[128];
  _BYTE v163[128];
  _BYTE v164[128];
  _BYTE v165[128];
  _BYTE v166[128];
  _BYTE v167[128];
  stat v168;
  const __CFString *v169;
  _QWORD v170[3];

  v170[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = (void *)objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", CFSTR("_NSTriggerModifiedObjectIDsKey"));
    if (objc_msgSend(v4, "count"))
    {
      v169 = CFSTR("updated_objectIDs");
      v170[0] = v4;
      -[NSFetchedResultsController _core_managedObjectContextDidChange:]((_QWORD *)a1, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v170, &v169, 1));
    }
    if (*(_QWORD *)(a1 + 40) && *(_QWORD *)(a1 + 80))
    {
      v5 = -[NSFetchedResultsController _sectionCachePath](a1);
      v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v157 = 0;
      v7 = objc_msgSend(v6, "fileExistsAtPath:", v5);
      v8 = (void *)objc_msgSend(a2, "userInfo");
      v9 = (void *)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("sectionInfo"));
      memset(&v168, 0, sizeof(v168));
      v10 = stat((const char *)objc_msgSend(v9, "fileSystemRepresentation"), &v168);
      st_size = v168.st_size;
      v12 = (const char *)objc_msgSend(v9, "fileSystemRepresentation");
      if (a2)
      {
        if (objc_msgSend(a2, "object") == *(_QWORD *)(a1 + 16))
        {
          if ((*(_WORD *)(a1 + 72) & 0x1080) == 0)
            goto LABEL_10;
        }
        else
        {
          v13 = objc_msgSend(v8, "objectForKey:", CFSTR("managedObjectContext"));
          if (v13 && v13 != *(_QWORD *)(a1 + 16))
          {
LABEL_10:
            if (v12)
            {
              v14 = open(v12, 1026, 384);
              if ((v14 & 0x80000000) == 0)
                close(v14);
            }
            return;
          }
        }
      }
      v15 = *(_DWORD *)(a1 + 72);
      if ((v15 & 1) != 0)
        v16 = 0;
      else
        v16 = v7;
      if (v16 != 1 || v10 || st_size < 1)
        goto LABEL_30;
      v17 = (const char *)objc_msgSend((id)objc_msgSend(-[NSFetchedResultsController _sectionCachePath](a1), "stringByAppendingPathComponent:", CFSTR("sectionInfo")), "fileSystemRepresentation");
      if (v17)
      {
        v18 = open(v17, 2);
        if ((v18 & 0x80000000) == 0)
        {
          v19 = v18;
          __buf = 0;
          memset(&v168, 0, sizeof(v168));
          if (!fstat(v18, &v168) && v168.st_size >= 40)
          {
            if (pread(v19, &__buf, 8uLL, 40) == 8)
            {
              __offsetb = bswap64(__buf);
              v114 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
              v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 4096);
              -[NSFetchedResultsController _appendAffectedStoreInfoToData:adjustedOffset:](a1, v20, 0);
              v21 = pwrite(v19, (const void *)objc_msgSend(v20, "bytes"), objc_msgSend(v20, "length"), __offsetb);
              if (v21 == objc_msgSend(v20, "length"))
              {

                close(v19);
                v22 = v114;
LABEL_116:
                objc_msgSend(v22, "drain");
                return;
              }
              __error();
              v103 = objc_opt_class();
              _NSCoreDataLog(1, (uint64_t)CFSTR(" (%@): error writing section cached info at %@ with error %d"), v104, v105, v106, v107, v108, v109, v103);
              ftruncate(v19, 0);

              close(v19);
              objc_msgSend(v114, "drain");
              goto LABEL_29;
            }
            v23 = objc_opt_class();
            _NSCoreDataLog(1, (uint64_t)CFSTR(" (%@): couldn't read cache file to update store info timestamps"), v24, v25, v26, v27, v28, v29, v23);
          }
          close(v19);
        }
      }
LABEL_29:
      v15 = *(_DWORD *)(a1 + 72);
LABEL_30:
      *(_DWORD *)(a1 + 72) = v15 & 0xFFFFFFFE;
      if ((v7 & 1) == 0
        && (objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v157) & 1) == 0)
      {
        v74 = objc_opt_class();
        _NSCoreDataLog(1, (uint64_t)CFSTR(" (%@): couldn't create section info cache directory at %@ : %@"), v75, v76, v77, v78, v79, v80, v74);
        return;
      }
      if (!v12 || (v30 = open(v12, 1538, 384), v30 < 0))
      {
        __error();
        v110 = objc_opt_class();
        _NSCoreDataLog(1, (uint64_t)CFSTR(" (%@): couldn't create section info file at %@ : %d"), v68, v69, v70, v71, v72, v73, v110);
        return;
      }
      v31 = v30;
      __offseta = objc_alloc_init(MEMORY[0x1E0CB34A8]);
      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 4096);
      objc_msgSend(v32, "appendBytes:length:", "41b5a6b5c6e848c462a8480cd24caef3", 32);
      _writeInt64IntoData(v32, 0);
      __buf = 0;
      _writeInt64IntoData(v32, 0);
      _writeStringIntoData((void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "entity"), "name"), v32, &v168);
      _writeDataIntoData((void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "entity"), "versionHash"), v32);
      _writeStringIntoData(*(void **)(a1 + 24), v32, &v168);
      _writeInt32IntoData(v32, objc_msgSend(*(id *)(a1 + 96), "count"));
      v33 = (void *)objc_msgSend(*(id *)(a1 + 8), "sortDescriptors");
      _writeInt32IntoData(v32, objc_msgSend(v33, "count"));
      v155 = 0u;
      v156 = 0u;
      v153 = 0u;
      v154 = 0u;
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v153, v167, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v154;
        do
        {
          for (i = 0; i != v35; ++i)
          {
            if (*(_QWORD *)v154 != v36)
              objc_enumerationMutation(v33);
            _writeStringIntoData((void *)objc_msgSend(*(id *)(*((_QWORD *)&v153 + 1) + 8 * i), "key"), v32, &v168);
          }
          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v153, v167, 16);
        }
        while (v35);
      }
      -[NSFetchedResultsController _appendAffectedStoreInfoToData:adjustedOffset:](a1, v32, &__buf);
      _writeInt32IntoData(v32, objc_msgSend(*(id *)(a1 + 104), "count"));
      v151 = 0u;
      v152 = 0u;
      v149 = 0u;
      v150 = 0u;
      v38 = *(void **)(a1 + 104);
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v149, v166, 16);
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v150;
        do
        {
          v42 = 0;
          do
          {
            if (*(_QWORD *)v150 != v41)
              objc_enumerationMutation(v38);
            v43 = *(_QWORD **)(*((_QWORD *)&v149 + 1) + 8 * v42);
            _writeStringIntoData((void *)objc_msgSend(v43, "name"), v32, &v168);
            _writeStringIntoData((void *)objc_msgSend(v43, "indexTitle"), v32, &v168);
            _writeInt32IntoData(v32, objc_msgSend(v43, "numberOfObjects"));
            if (v43)
              v44 = v43[4];
            else
              LODWORD(v44) = 0;
            _writeInt32IntoData(v32, v44);
            ++v42;
          }
          while (v40 != v42);
          v45 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v149, v166, 16);
          v40 = v45;
        }
        while (v45);
      }
      v148 = 0;
      v147 = 0;
      v46 = (void *)-[NSFetchedResultsController _fetchedObjectsArrayOfObjectIDs](a1);
      v113 = (char *)v12;
      if (+[_PFRoutines _generateObjectIDMaptableForArray:withMapping:andEntries:]((uint64_t)_PFRoutines, v46, (uint64_t *)&v148, (uint64_t *)&v147))
      {
        v111 = v31;
        _writeInt32IntoData(v32, 1u);
        v47 = (void *)objc_msgSend(v148, "objectAtIndex:", 0);
        v48 = (void *)objc_msgSend(v148, "objectAtIndex:", 1);
        v49 = (void *)objc_msgSend(v148, "objectAtIndex:", 2);
        v112 = (void *)objc_msgSend(v148, "objectAtIndex:", 3);
        v50 = (void *)objc_msgSend(v147, "objectAtIndex:", 0);
        v51 = v50;
        if ((unint64_t)objc_msgSend(v147, "count") >= 2)
          v51 = (void *)objc_msgSend(v147, "objectAtIndex:", 1);
        _writeInt32IntoData(v32, objc_msgSend(v47, "count"));
        v145 = 0u;
        v146 = 0u;
        v143 = 0u;
        v144 = 0u;
        v52 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v143, v165, 16);
        if (v52)
        {
          v53 = v52;
          v54 = *(_QWORD *)v144;
          do
          {
            for (j = 0; j != v53; ++j)
            {
              if (*(_QWORD *)v144 != v54)
                objc_enumerationMutation(v47);
              _writeStringIntoData(*(void **)(*((_QWORD *)&v143 + 1) + 8 * j), v32, &v168);
            }
            v53 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v143, v165, 16);
          }
          while (v53);
        }
        _writeInt32IntoData(v32, objc_msgSend(v48, "count"));
        v141 = 0u;
        v142 = 0u;
        v139 = 0u;
        v140 = 0u;
        v56 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v139, v164, 16);
        if (v56)
        {
          v57 = v56;
          v58 = *(_QWORD *)v140;
          do
          {
            for (k = 0; k != v57; ++k)
            {
              if (*(_QWORD *)v140 != v58)
                objc_enumerationMutation(v48);
              _writeStringIntoData(*(void **)(*((_QWORD *)&v139 + 1) + 8 * k), v32, &v168);
            }
            v57 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v139, v164, 16);
          }
          while (v57);
        }
        _writeInt32IntoData(v32, objc_msgSend(v49, "count"));
        v137 = 0u;
        v138 = 0u;
        v135 = 0u;
        v136 = 0u;
        v60 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v135, v163, 16);
        if (v60)
        {
          v61 = v60;
          v62 = *(_QWORD *)v136;
          do
          {
            for (m = 0; m != v61; ++m)
            {
              if (*(_QWORD *)v136 != v62)
                objc_enumerationMutation(v49);
              _writeInt32IntoData(v32, *(_QWORD *)(*((_QWORD *)&v135 + 1) + 8 * m));
            }
            v61 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v135, v163, 16);
          }
          while (v61);
        }
        _writeInt64IntoData(v32, objc_msgSend(v112, "longLongValue"));
        if ((unint64_t)objc_msgSend(v147, "count") >= 2)
        {
          _writeInt32IntoData(v32, objc_msgSend(v50, "count"));
          if ((unint64_t)objc_msgSend(v49, "count") > 0xFE)
          {
            v129 = 0uLL;
            v130 = 0uLL;
            v127 = 0uLL;
            v128 = 0uLL;
            v82 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v127, v161, 16);
            if (v82)
            {
              v83 = v82;
              v84 = *(_QWORD *)v128;
              do
              {
                for (n = 0; n != v83; ++n)
                {
                  if (*(_QWORD *)v128 != v84)
                    objc_enumerationMutation(v50);
                  _writeInt16IntoData(v32, (unsigned __int16)*(_QWORD *)(*((_QWORD *)&v127 + 1) + 8 * n));
                }
                v83 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v127, v161, 16);
              }
              while (v83);
            }
          }
          else
          {
            v133 = 0uLL;
            v134 = 0uLL;
            v131 = 0uLL;
            v132 = 0uLL;
            v64 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v131, v162, 16);
            if (v64)
            {
              v65 = v64;
              v66 = *(_QWORD *)v132;
              do
              {
                for (ii = 0; ii != v65; ++ii)
                {
                  if (*(_QWORD *)v132 != v66)
                    objc_enumerationMutation(v50);
                  LOBYTE(v118) = *(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * ii);
                  objc_msgSend(v32, "appendBytes:length:", &v118, 1);
                }
                v65 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v131, v162, 16);
              }
              while (v65);
            }
          }
        }
        _writeInt32IntoData(v32, objc_msgSend(v51, "count"));
        if (objc_msgSend(v112, "longLongValue") > 4294967294)
        {
          v121 = 0uLL;
          v122 = 0uLL;
          v119 = 0uLL;
          v120 = 0uLL;
          v90 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v119, v159, 16);
          v31 = v111;
          v81 = __offseta;
          if (v90)
          {
            v91 = v90;
            v92 = *(_QWORD *)v120;
            do
            {
              for (jj = 0; jj != v91; ++jj)
              {
                if (*(_QWORD *)v120 != v92)
                  objc_enumerationMutation(v51);
                _writeInt64IntoData(v32, *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * jj));
              }
              v91 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v119, v159, 16);
            }
            while (v91);
          }
        }
        else
        {
          v125 = 0uLL;
          v126 = 0uLL;
          v123 = 0uLL;
          v124 = 0uLL;
          v86 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v123, v160, 16);
          v31 = v111;
          v81 = __offseta;
          if (v86)
          {
            v87 = v86;
            v88 = *(_QWORD *)v124;
            do
            {
              for (kk = 0; kk != v87; ++kk)
              {
                if (*(_QWORD *)v124 != v88)
                  objc_enumerationMutation(v51);
                _writeInt32IntoData(v32, *(_QWORD *)(*((_QWORD *)&v123 + 1) + 8 * kk));
              }
              v87 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v123, v160, 16);
            }
            while (v87);
          }
        }
      }
      else
      {
        _writeInt32IntoData(v32, 0);
        v81 = __offseta;
      }
      v94 = objc_msgSend(v32, "length");
      v118 = bswap64(v94);
      objc_msgSend(v32, "replaceBytesInRange:withBytes:", 32, 8, &v118);
      v117 = bswap64(__buf);
      objc_msgSend(v32, "replaceBytesInRange:withBytes:", 40, 8, &v117);
      v95 = pwrite(v31, (const void *)objc_msgSend(v32, "bytes"), v94, 0);
      if (!v94 || v95 != v94)
      {
        __error();
        v96 = objc_opt_class();
        _NSCoreDataLog(1, (uint64_t)CFSTR(" (%@): error writing section cached info at %@ with error %d"), v97, v98, v99, v100, v101, v102, v96);
        ftruncate(v31, 0);
        unlink(v113);
      }

      close(v31);
      v22 = v81;
      goto LABEL_116;
    }
  }
}

- (void)_makeMutableFetchedObjects
{
  void *v2;
  unsigned int v3;

  if ((*(_BYTE *)(a1 + 72) & 4) == 0)
  {
    v2 = *(void **)(a1 + 96);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      *(_QWORD *)(a1 + 96) = -[_PFMutableProxyArray initWithPFArray:]([_PFMutableProxyArray alloc], "initWithPFArray:", *(_QWORD *)(a1 + 96));
      v3 = *(_DWORD *)(a1 + 72) | 2;
    }
    else
    {
      *(_QWORD *)(a1 + 96) = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v2);
      v3 = *(_DWORD *)(a1 + 72) & 0xFFFFFFFD;
    }
    *(_DWORD *)(a1 + 72) = v3;

    *(_DWORD *)(a1 + 72) |= 4u;
  }
}

- (const)_sectionNameForObject:(const __CFString *)result
{
  const __CFString *v3;
  void *v4;
  void *v5;

  if (result)
  {
    v3 = result;
    if (objc_msgSend((id)result->info, "resultType") == 1)
    {
      return (const __CFString *)(id)objc_msgSend(a2, "_retainedURIString");
    }
    else if (objc_msgSend((id)v3->info, "resultType") == 4)
    {
      return CFSTR("Count");
    }
    else
    {
      v4 = (void *)objc_msgSend(a2, "valueForKeyPath:", v3->length);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = (void *)objc_msgSend(v4, "objectID");
        LODWORD(v3[2].info) |= 0x10u;
        result = (const __CFString *)(id)objc_msgSend(v5, "_retainedURIString");
      }
      else
      {
        result = (const __CFString *)objc_msgSend(v4, "description");
      }
      if (!result)
        return &stru_1E1EE23F0;
    }
  }
  return result;
}

- (NSString)sectionIndexTitleForSectionName:(NSString *)sectionName
{
  if (sectionName && -[NSString length](sectionName, "length"))
    return (NSString *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c"), -[NSString characterAtIndex:](sectionName, "characterAtIndex:", 0)), "uppercaseString");
  else
    return 0;
}

- (NSArray)sectionIndexTitles
{
  NSArray *result;
  NSMutableOrderedSet *sections;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  result = (NSArray *)self->_sectionIndexTitles;
  if (!result)
  {
    self->_sectionIndexTitles = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableOrderedSet count](self->_sections, "count"));
    self->_sectionIndexTitlesSections = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableOrderedSet count](self->_sections, "count"));
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      sections = self->_sections;
      v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](sections, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
      {
        v6 = v5;
        v7 = 0;
        v8 = *(_QWORD *)v14;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v14 != v8)
              objc_enumerationMutation(sections);
            v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
            v11 = objc_msgSend(v10, "indexTitle");
            if (v11)
            {
              v12 = (void *)v11;
              if ((objc_msgSend(v7, "isEqualToString:", v11) & 1) == 0)
              {
                objc_msgSend(self->_sectionIndexTitles, "addObject:", v12);
                objc_msgSend(self->_sectionIndexTitlesSections, "addObject:", v10);
                v7 = v12;
              }
            }
          }
          v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](sections, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v6);
      }
    }
    return (NSArray *)self->_sectionIndexTitles;
  }
  return result;
}

- (NSInteger)sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)sectionIndex
{
  NSArray *v7;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  v7 = -[NSFetchedResultsController sectionIndexTitles](self, "sectionIndexTitles");
  if ((int64_t)-[NSArray count](v7, "count") <= sectionIndex)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99768];
    v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid Section Index offset%li"), sectionIndex);
    v12 = v9;
    v13 = v10;
    goto LABEL_6;
  }
  if ((objc_msgSend(-[NSArray objectAtIndex:](v7, "objectAtIndex:", sectionIndex), "isEqualToString:", title) & 1) == 0)
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99768];
    v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Index title at %li is not equal to '%@'"), sectionIndex, title);
    v12 = v14;
    v13 = v15;
LABEL_6:
    objc_exception_throw((id)objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, v11, 0));
  }
  return -[_NSDefaultSectionInfo sectionNumber](objc_msgSend(self->_sectionIndexTitlesSections, "objectAtIndex:", sectionIndex));
}

- (NSString)sectionNameKeyPath
{
  return self->_sectionNameKeyPath;
}

- (NSString)cacheName
{
  return self->_cacheName;
}

void __72__NSFetchedResultsController_PrivateMethods___computeSectionInfo_error___block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;

  if (*(_QWORD *)(a1 + 48))
  {
    v2 = 0;
    do
    {
      v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v2);
      if ((objc_msgSend(v3, "isFault") & 1) == 0
        && (objc_msgSend((id)objc_msgSend(v3, "objectID"), "isTemporaryID") & 1) == 0)
      {
        v4 = objc_msgSend(v3, "_versionReference");
        v5 = objc_msgSend(v3, "objectID");
        v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
        if (v6)
          v7 = *(void **)(v6 + 32);
        else
          v7 = 0;
        v8 = (void *)objc_msgSend(v7, "newValuesForObjectWithID:withContext:error:", v5);
        if (!v8 || (v9 = v8, v10 = objc_msgSend(v8, "_versionNumber"), v9, v4 != v10))
        {
          if ((objc_msgSend(v3, "hasChanges") & 1) == 0)
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "refreshObject:mergeChanges:", v3, 0);
        }
      }
      ++v2;
    }
    while (v2 < *(_QWORD *)(a1 + 48));
  }
}

- (uint64_t)_resolveSectionIndexTitleForSectionName:(uint64_t)a1
{
  uint64_t v5;
  id WeakRetained;
  uint64_t v7;

  if ((*(_BYTE *)(a1 + 73) & 8) == 0)
    return objc_msgSend((id)a1, "sectionIndexTitleForSectionName:", a2);
  v5 = *(_QWORD *)(a1 + 80);
  if (v5)
    WeakRetained = objc_loadWeakRetained((id *)(v5 + 8));
  else
    WeakRetained = 0;
  v7 = objc_msgSend(WeakRetained, "controller:sectionIndexTitleForSectionName:", a1, a2);

  return v7;
}

uint64_t __136__NSFetchedResultsController_PrivateMethods___lowerMoveOperationsToUpdatesForSection_withInsertedObjects_deletedObjects_updatedObjects___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  if (!a2)
  {
    v3 = 0;
    if (!a3)
      return objc_msgSend(v3, "compare:", a3);
    goto LABEL_3;
  }
  v3 = *(void **)(a2 + 32);
  if (a3)
LABEL_3:
    a3 = *(_QWORD *)(a3 + 32);
  return objc_msgSend(v3, "compare:", a3);
}

uint64_t __136__NSFetchedResultsController_PrivateMethods___lowerMoveOperationsToUpdatesForSection_withInsertedObjects_deletedObjects_updatedObjects___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  if (!a2)
  {
    v3 = 0;
    if (!a3)
      return objc_msgSend(v3, "compare:", a3);
    goto LABEL_3;
  }
  v3 = *(void **)(a2 + 24);
  if (a3)
LABEL_3:
    a3 = *(_QWORD *)(a3 + 24);
  return objc_msgSend(v3, "compare:", a3);
}

uint64_t __82__NSFetchedResultsController_PrivateMethods___core_managedObjectContextDidChange___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  BOOL v6;

  v2 = a2[2];
  if ((unint64_t)(v2 - 3) >= 2)
  {
    v6 = v2 == 1;
    v5 = a2 + 6;
    v3 = (_QWORD *)(a1 + 32);
    if (!v6)
      v5 = a2 + 5;
    return *v5 == *v3;
  }
  v4 = *(_QWORD *)(a1 + 32);
  v3 = (_QWORD *)(a1 + 32);
  if (a2[5] != v4)
  {
    v5 = a2 + 6;
    return *v5 == *v3;
  }
  return 1;
}

- (void)_managedObjectContextDidMutateObjectIDs:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _fetchResultsControllerFlags flags;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSMutableDictionary *sectionsByName;
  uint64_t v21;
  uint64_t *v22;
  _NSDefaultSectionInfo *v23;
  void *v24;
  _QWORD *v25;
  uint64_t v26;
  id v27;
  void *v28;
  _fetchResultsControllerFlags v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  void *v44;
  void *context;
  void *contexta;
  void *contextb;
  id obj;
  id obja;
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
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", CFSTR("_NSManagedObjectContextObjectIDMutationMappingKey"));
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v63 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i);
        v10 = -[NSFetchedResultsController _indexOfCachedID:]((uint64_t)self, v9);
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v11 = v10;
          v12 = objc_msgSend(v4, "objectForKey:", v9);
          -[NSMutableDictionary setObject:forKey:](self->_indexCache, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11), v12);
          -[NSMutableDictionary removeObjectForKey:](self->_indexCache, "removeObjectForKey:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
    }
    while (v6);
  }
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    context = (void *)MEMORY[0x18D76B4E4]();
    obj = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v14 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v59;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v59 != v16)
            objc_enumerationMutation(v4);
          v18 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v17);
          v19 = (void *)MEMORY[0x18D76B4E4](v14);
          sectionsByName = self->_sectionsByName;
          *(_DWORD *)&self->_flags |= 0x10u;
          v21 = -[NSMutableDictionary objectForKeyedSubscript:](sectionsByName, "objectForKeyedSubscript:", (id)objc_msgSend(v18, "_retainedURIString", context));
          if (v21)
          {
            v22 = (uint64_t *)v21;
            v23 = [_NSDefaultSectionInfo alloc];
            v24 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", v18);
            *(_DWORD *)&self->_flags |= 0x10u;
            v25 = -[_NSDefaultSectionInfo initWithController:name:sectionId:indexTitle:sectionOffset:](v23, (uint64_t)self, (id)objc_msgSend(v24, "_retainedURIString"), (void *)objc_msgSend(v22, "sectionId"), (void *)objc_msgSend(v22, "indexTitle"), v22[4]);
            v26 = objc_msgSend(v22, "numberOfObjects");
            if (v25)
            {
              v25[5] = v26;

              v25[7] = 0;
            }
            -[NSMutableOrderedSet replaceObjectAtIndex:withObject:](self->_sections, "replaceObjectAtIndex:withObject:", -[_NSDefaultSectionInfo sectionNumber]((uint64_t)v22), v25);
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sectionsByName, "setObject:forKeyedSubscript:", v25, objc_msgSend(v25, "name"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sectionsByName, "setObject:forKeyedSubscript:", 0, objc_msgSend(v22, "name"));
            objc_msgSend(obj, "addObject:", v25);

          }
          objc_autoreleasePoolPop(v19);
          ++v17;
        }
        while (v15 != v17);
        v14 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
        v15 = v14;
      }
      while (v14);
    }
    if (objc_msgSend(obj, "count", context))
    {
      v27 = -[NSFetchedResultsController delegate](self, "delegate");
      if (v27)
      {
        v28 = v27;
        v29 = self->_flags;
        if ((*(_WORD *)&v29 & 0x1000) != 0)
        {
          objc_msgSend(v27, "controllerWillChangeContent:", self);
          v29 = self->_flags;
        }
        if ((*(_WORD *)&v29 & 0x400) != 0)
        {
          v56 = 0u;
          v57 = 0u;
          v54 = 0u;
          v55 = 0u;
          v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
          if (v30)
          {
            v31 = v30;
            v32 = *(_QWORD *)v55;
            do
            {
              for (j = 0; j != v31; ++j)
              {
                if (*(_QWORD *)v55 != v32)
                  objc_enumerationMutation(obj);
                objc_msgSend(v28, "controller:didChangeSection:atIndex:forChangeType:", self, *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * j), -[_NSDefaultSectionInfo sectionNumber](*(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * j)), 4);
              }
              v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
            }
            while (v31);
          }
        }
        if ((*(_BYTE *)&self->_flags & 0x80) != 0)
          objc_msgSend(v28, "controllerDidChangeContent:", self);

      }
    }

    objc_autoreleasePoolPop(contexta);
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    v34 = -[NSFetchedResultsController delegate](self, "delegate");
    if (v34 || !self->_delegate)
    {
      contextb = v34;
      v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      obja = (id)MEMORY[0x18D76B4E4]();
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v36 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v51;
        do
        {
          for (k = 0; k != v37; ++k)
          {
            if (*(_QWORD *)v51 != v38)
              objc_enumerationMutation(v4);
            v40 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * k);
            v41 = objc_msgSend(v4, "objectForKeyedSubscript:", v40, contextb);
            v42 = -[NSFetchedResultsController _indexOfCachedID:]((uint64_t)self, v41);
            if (v42 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v43 = v42;
              objc_msgSend(v35, "addObject:", objc_msgSend(MEMORY[0x1E0CB3830], "changeWithObject:type:index:associatedIndex:", v40, 1, v43, v43));
              objc_msgSend(v35, "addObject:", objc_msgSend(MEMORY[0x1E0CB3830], "changeWithObject:type:index:associatedIndex:", v41, 0, v43, v43));
            }
          }
          v37 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
        }
        while (v37);
      }
      objc_autoreleasePoolPop(obja);
      if (objc_msgSend(v35, "count"))
      {
        v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3838]), "initWithChanges:", v35);
        objc_msgSend(contextb, "controller:didChangeContentWithDifference:", self, v44);

      }
    }
    else
    {
      -[NSFetchedResultsController setDelegate:](self, "setDelegate:", 0);
    }
  }
}

- (uint64_t)_appendAffectedStoreInfoToData:(_QWORD *)a3 adjustedOffset:
{
  void *v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __darwin_time_t v12;
  unint64_t v13;
  unint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _BYTE v20[2048];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(*(id *)(a1 + 8), "affectedStores");
  if (!objc_msgSend(v6, "count"))
    v6 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "persistentStoreCoordinator"), "persistentStores");
  _writeInt32IntoData(a2, objc_msgSend(v6, "count"));
  if (a3)
    *a3 = objc_msgSend(a2, "length") - 4;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  result = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (result)
  {
    v8 = result;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        _writeStringIntoData((void *)objc_msgSend(v11, "identifier"), a2, v20);
        v12 = stat_path_for_modication_time((void *)objc_msgSend(v11, "URL"));
        v14 = v13;
        _writeInt64IntoData(a2, v12);
        _writeInt64IntoData(a2, v14);
        ++v10;
      }
      while (v8 != v10);
      result = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v8 = result;
    }
    while (result);
  }
  return result;
}

@end
