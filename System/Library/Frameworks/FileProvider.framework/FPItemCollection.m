@implementation FPItemCollection

- (void)_receivedBatchWithUpdatedItems:(id)a3 deletedItemsIdentifiers:(id)a4 forceFlush:(BOOL)a5 dropForReplacedPlaceholders:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  FPItemCollection *v15;
  _BOOL4 v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  void *v52;
  void *v53;
  int v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t m;
  void *v67;
  void *v68;
  char v69;
  NSObject *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  NSObject *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t n;
  void *v81;
  void *v82;
  void *v83;
  NSObject *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  int v92;
  void *v93;
  BOOL v94;
  FPItemCollection *v95;
  _BOOL4 v96;
  _BOOL4 v97;
  void *v98;
  void *v99;
  NSObject *v100;
  NSObject *v101;
  const char *v102;
  uint32_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t ii;
  uint64_t v107;
  void *v108;
  NSObject *v109;
  void *v110;
  NSObject *v111;
  void *v112;
  int v113;
  uint64_t v114;
  NSObject *v115;
  NSObject *v116;
  FPPacer *updatePacer;
  _BOOL4 v118;
  uint64_t v119;
  _BOOL4 v120;
  void *v121;
  void *v122;
  unsigned int v123;
  id obj;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  NSPredicate *v129;
  NSPredicate *v130;
  void *v131;
  void *v132;
  void *context;
  uint64_t v134;
  unsigned int v135;
  FPItemCollection *v136;
  void *v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
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
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  uint64_t section;
  _BYTE v167[128];
  uint8_t v168[4];
  uint64_t v169;
  _BYTE v170[128];
  _BYTE v171[128];
  _BYTE v172[128];
  char v173[32];
  _BYTE v174[128];
  _BYTE v175[128];
  uint8_t v176[128];
  uint8_t buf[4];
  _BYTE v178[10];
  uint64_t v179;
  _BYTE v180[10];
  __int16 v181;
  FPItemCollection *v182;
  __int16 v183;
  _BOOL4 v184;
  uint64_t v185;

  v6 = a6;
  v120 = a5;
  v185 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_updateQueue);
  obj = v9;
  if (self->_observing)
  {
    v11 = objc_msgSend(v9, "count");
    v121 = v10;
    v12 = objc_msgSend(v10, "count");
    section = __fp_create_section();
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v12 + v11;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134219010;
      *(_QWORD *)v178 = section;
      *(_WORD *)&v178[8] = 2048;
      v179 = v14;
      *(_WORD *)v180 = 2048;
      *(_QWORD *)&v180[2] = objc_msgSend(v10, "count");
      v181 = 2112;
      v182 = self;
      v183 = 1024;
      v184 = v120;
      _os_log_debug_impl(&dword_1A0A34000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx received %ld updates (deleted %ld) for %@ (forceFlush:%d)", buf, 0x30u);
    }
    v119 = v14;
    v136 = self;

    v131 = (void *)objc_opt_new();
    v15 = self;
    if (objc_msgSend(obj, "count") == 1 && !objc_msgSend(v10, "count"))
    {
      objc_msgSend(obj, "objectAtIndexedSubscript:", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[FPItemCollection isRootItem:](self, "isRootItem:", v24);

      v15 = self;
    }
    else
    {
      v16 = 0;
    }
    v118 = v16;
    v17 = !v15->_regathering || v16;
    if (v17 != 1 || v6)
    {
      +[FPStitchingManager sharedInstance](FPStitchingManager, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "allPlaceholderItemsByParentIdentifierAndName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v19, "count"))
      {
        v20 = (void *)MEMORY[0x1E0C99DE8];
        if ((v17 & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(obj, "count"));
          v21 = (id)objc_claimAutoreleasedReturnValue();
          v22 = v21;
        }
        else
        {
          objc_msgSend(v19, "allValues");
          v21 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "arrayWithArray:", v21);
          v22 = (id)objc_claimAutoreleasedReturnValue();

        }
        v164 = 0u;
        v165 = 0u;
        v162 = 0u;
        v163 = 0u;
        v25 = obj;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v162, v176, 16);
        if (v26)
        {
          v27 = *(_QWORD *)v163;
          do
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v163 != v27)
                objc_enumerationMutation(v25);
              v29 = *(_QWORD *)(*((_QWORD *)&v162 + 1) + 8 * i);
              +[FPStitchingManager parentIdNameKeyForItem:](FPStitchingManager, "parentIdNameKeyForItem:", v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "objectForKey:", v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = v31 == 0;

              if (v32)
                objc_msgSend(v22, "addObject:", v29);

            }
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v162, v176, 16);
          }
          while (v26);
        }

        obj = v22;
      }
      +[FPStitchingManager sharedInstance](FPStitchingManager, "sharedInstance");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "allDeletedIDs");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v34, "count"))
      {
        objc_msgSend(v121, "arrayByAddingObjectsFromArray:", v34);
        v35 = objc_claimAutoreleasedReturnValue();

        v121 = (void *)v35;
      }

    }
    if (v6)
    {
      v137 = (void *)objc_opt_new();
      +[FPStitchingManager sharedInstance](FPStitchingManager, "sharedInstance");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "allPlaceholderReplacementsIDs");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = (void *)objc_opt_new();
      v160 = 0u;
      v161 = 0u;
      v158 = 0u;
      v159 = 0u;
      v39 = obj;
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v158, v175, 16);
      if (v40)
      {
        v41 = *(_QWORD *)v159;
        do
        {
          for (j = 0; j != v40; ++j)
          {
            if (*(_QWORD *)v159 != v41)
              objc_enumerationMutation(v39);
            v43 = *(void **)(*((_QWORD *)&v158 + 1) + 8 * j);
            objc_msgSend(v43, "formerItemID");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            if (v44)
            {
              objc_msgSend(v43, "itemID");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = objc_msgSend(v37, "containsObject:", v45);

              if (v46)
              {
                objc_msgSend(v43, "formerItemID");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "addObject:", v47);

              }
            }
          }
          v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v158, v175, 16);
        }
        while (v40);
      }

      v156 = 0u;
      v157 = 0u;
      v154 = 0u;
      v155 = 0u;
      v48 = v39;
      v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v154, v174, 16);
      if (v49)
      {
        v50 = *(_QWORD *)v155;
        do
        {
          for (k = 0; k != v49; ++k)
          {
            if (*(_QWORD *)v155 != v50)
              objc_enumerationMutation(v48);
            v52 = *(void **)(*((_QWORD *)&v154 + 1) + 8 * k);
            objc_msgSend(v52, "itemID");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = objc_msgSend(v38, "containsObject:", v53);

            if (v54)
            {
              fp_current_or_default_log();
              v55 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)v178 = v52;
                _os_log_debug_impl(&dword_1A0A34000, v55, OS_LOG_TYPE_DEBUG, "[DEBUG] Dropping placeholder %@ as it has already been replaced.", buf, 0xCu);
              }

            }
            else
            {
              objc_msgSend(v137, "addObject:", v52);
            }
          }
          v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v154, v174, 16);
        }
        while (v49);
      }

      obj = v137;
    }
    +[FPStitchingManager sharedInstance](FPStitchingManager, "sharedInstance");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "stitchedFieldsAndItemsByItemIDs");
    v127 = (void *)objc_claimAutoreleasedReturnValue();

    +[FPStitchingManager sharedInstance](FPStitchingManager, "sharedInstance");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPItemCollection enumeratedItemID](v136, "enumeratedItemID");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "stitchedItemsForParentID:", v58);
    v122 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v122, "count"))
    {
      fp_current_or_default_log();
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
      {
        -[FPItemCollection enumeratedItemID](v136, "enumeratedItemID");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        -[FPItemCollection _receivedBatchWithUpdatedItems:deletedItemsIdentifiers:forceFlush:dropForReplacedPlaceholders:].cold.6(v60, (uint64_t)v122, (uint64_t)v173, v59);
      }

      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", obj);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obj, "fp_itemIDs");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v152 = 0u;
      v153 = 0u;
      v150 = 0u;
      v151 = 0u;
      v63 = v122;
      v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v150, v172, 16);
      if (v64)
      {
        v65 = *(_QWORD *)v151;
        do
        {
          for (m = 0; m != v64; ++m)
          {
            if (*(_QWORD *)v151 != v65)
              objc_enumerationMutation(v63);
            v67 = *(void **)(*((_QWORD *)&v150 + 1) + 8 * m);
            objc_msgSend(v67, "itemID");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = objc_msgSend(v62, "containsObject:", v68);

            if ((v69 & 1) != 0)
            {
              fp_current_or_default_log();
              v70 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)v178 = v67;
                _os_log_debug_impl(&dword_1A0A34000, v70, OS_LOG_TYPE_DEBUG, "[DEBUG] Dropping stitched item already in update: %@", buf, 0xCu);
              }

            }
            else
            {
              objc_msgSend(v61, "addObject:", v67);
            }
          }
          v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v150, v172, 16);
        }
        while (v64);
      }

      v71 = v61;
    }
    else
    {
      v71 = obj;
    }
    v148 = 0u;
    v149 = 0u;
    v146 = 0u;
    v147 = 0u;
    obj = v71;
    v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v146, v171, 16);
    if (v72)
    {
      v123 = 0;
      v126 = *(_QWORD *)v147;
      do
      {
        v73 = 0;
        v135 = v123;
        v123 += v72;
        v128 = v72;
        do
        {
          if (*(_QWORD *)v147 != v126)
            objc_enumerationMutation(obj);
          v134 = v73;
          v74 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * v73);
          context = (void *)MEMORY[0x1A1B00664]();
          if (v135 <= 0x13)
          {
            fp_current_or_default_log();
            v75 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v178 = v74;
              _os_log_debug_impl(&dword_1A0A34000, v75, OS_LOG_TYPE_DEBUG, "[DEBUG] updated item: %@", buf, 0xCu);
            }

          }
          v144 = 0u;
          v145 = 0u;
          v142 = 0u;
          v143 = 0u;
          objc_msgSend(v74, "itemID");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v127, "objectForKeyedSubscript:", v76);
          v77 = (void *)objc_claimAutoreleasedReturnValue();

          v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v142, v170, 16);
          if (v78)
          {
            v79 = *(_QWORD *)v143;
            do
            {
              for (n = 0; n != v78; ++n)
              {
                if (*(_QWORD *)v143 != v79)
                  objc_enumerationMutation(v77);
                v81 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * n);
                objc_msgSend(v81, "objectForKeyedSubscript:", CFSTR("FPStitchingSessionFields"));
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v81, "objectForKeyedSubscript:", CFSTR("FPStitchingSessionItemKey"));
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                fp_current_or_default_log();
                v84 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v74, "itemID");
                  v85 = (void *)objc_claimAutoreleasedReturnValue();
                  -[FPItemCollection _receivedBatchWithUpdatedItems:deletedItemsIdentifiers:forceFlush:dropForReplacedPlaceholders:].cold.5(v85, v168, &v169, v84);
                }

                objc_msgSend(v74, "overrideFields:ofItem:", v82, v83);
              }
              v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v142, v170, 16);
            }
            while (v78);
          }

          objc_msgSend(v74, "itemID");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "providerID");
          v87 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v131, "objectForKeyedSubscript:", v87);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v88)
          {
            v89 = (void *)MEMORY[0x1E0CB37E8];
            +[FPReachabilityMonitor sharedReachabilityMonitor](FPReachabilityMonitor, "sharedReachabilityMonitor");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "numberWithBool:", objc_msgSend(v90, "isNetworkReachableForBundle:", v87));
            v88 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v131, "setObject:forKeyedSubscript:", v88, v87);
          }
          objc_msgSend(v74, "setOffline:", objc_msgSend(v88, "BOOLValue") ^ 1);
          objc_msgSend(v74, "parentItemIdentifier");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v91, "isEqualToString:", CFSTR("NSFileProviderRootContainerItemIdentifier")))
          {

LABEL_99:
            if (-[FPItemCollection isRootItem:](v136, "isRootItem:", v74))
            {
              -[FPItemCollection _updateObservedItem:](v136, "_updateObservedItem:", v74);
              goto LABEL_121;
            }
            objc_msgSend(v74, "itemID");
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            v95 = v136;
            objc_sync_enter(v95);
            v130 = v136->_itemFilteringPredicate;
            v129 = v136->_additionalItemFilteringPredicate;
            objc_sync_exit(v95);

            v96 = -[FPItemCollection isCollectionValidForItem:](v95, "isCollectionValidForItem:", v74);
            if (v96 && (!v130 || -[NSPredicate evaluateWithObject:](v130, "evaluateWithObject:", v74)))
            {
              if (v129)
              {
                HIDWORD(v125) = -[NSPredicate evaluateWithObject:](v129, "evaluateWithObject:", v74);
                LODWORD(v125) = 1;
              }
              else
              {
                v125 = 0x100000001;
              }
            }
            else
            {
              v125 = 0;
            }
            v97 = -[FPItemCollection isHiddenItem:](v95, "isHiddenItem:", v74);
            objc_msgSend(v74, "formerItemID");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v96 & v125 & HIDWORD(v125)) == 1 && (!v97 || v136->_showHiddenFiles))
            {
              -[NSMutableDictionary objectForKey:](v136->_formerItemsIdentifiers, "objectForKey:", v132);
              v99 = (void *)objc_claimAutoreleasedReturnValue();

              if (v99)
              {
                fp_current_or_default_log();
                v100 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)v178 = v132;
                  v101 = v100;
                  v102 = "[DEBUG] not interested in superseded itemID %@";
                  v103 = 12;
                  goto LABEL_129;
                }
                goto LABEL_119;
              }
              if (v98)
              {
                -[NSMutableDictionary setObject:forKey:](v136->_formerItemsIdentifiers, "setObject:forKey:", v132, v98);
                -[NSMutableDictionary removeObjectForKey:](v136->_updatedItemsByIdentifiers, "removeObjectForKey:", v98);
              }
              -[NSMutableDictionary setObject:forKeyedSubscript:](v136->_updatedItemsByIdentifiers, "setObject:forKeyedSubscript:", v74, v132);
              -[NSMutableSet removeObject:](v136->_deletedItemsIdentifiers, "removeObject:", v132);
            }
            else
            {
              if (-[FPItemCollection _indexOfItem:](v95, "_indexOfItem:", v74) == 0x7FFFFFFFFFFFFFFFLL)
              {
                fp_current_or_default_log();
                v100 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
                  goto LABEL_119;
                *(_DWORD *)buf = 67109888;
                *(_DWORD *)v178 = v96;
                *(_WORD *)&v178[4] = 1024;
                *(_DWORD *)&v178[6] = v125;
                LOWORD(v179) = 1024;
                *(_DWORD *)((char *)&v179 + 2) = HIDWORD(v125);
                HIWORD(v179) = 1024;
                *(_DWORD *)v180 = v97;
                v101 = v100;
                v102 = "[DEBUG] not interested in item (validForCollection: %{BOOL}d, predicate1: %{BOOL}d, predicate2: %"
                       "{BOOL}d, hidden: %{BOOL}d)";
              }
              else
              {
                -[NSMutableDictionary removeObjectForKey:](v136->_updatedItemsByIdentifiers, "removeObjectForKey:", v132);
                -[NSMutableSet addObject:](v136->_deletedItemsIdentifiers, "addObject:", v132);
                if (v98)
                {
                  -[NSMutableSet addObject:](v136->_deletedItemsIdentifiers, "addObject:", v98);
                  -[NSMutableDictionary setObject:forKey:](v136->_formerItemsIdentifiers, "setObject:forKey:", v132, v98);
                }
                fp_current_or_default_log();
                v100 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
                  goto LABEL_119;
                *(_DWORD *)buf = 67109888;
                *(_DWORD *)v178 = v96;
                *(_WORD *)&v178[4] = 1024;
                *(_DWORD *)&v178[6] = v125;
                LOWORD(v179) = 1024;
                *(_DWORD *)((char *)&v179 + 2) = HIDWORD(v125);
                HIWORD(v179) = 1024;
                *(_DWORD *)v180 = v97;
                v101 = v100;
                v102 = "[DEBUG] removing item because it isn't not interesting anymore (validForCollection: %{BOOL}d, pre"
                       "dicate1: %{BOOL}d, predicate2: %{BOOL}d, hidden: %{BOOL}d)";
              }
              v103 = 26;
LABEL_129:
              _os_log_debug_impl(&dword_1A0A34000, v101, OS_LOG_TYPE_DEBUG, v102, buf, v103);
LABEL_119:

            }
            goto LABEL_121;
          }
          v92 = objc_msgSend(v74, "isFolder");

          if (!v92)
            goto LABEL_99;
          -[FPAppRegistry promoteItemToAppLibraryIfNeeded:](v136->_appRegistry, "promoteItemToAppLibraryIfNeeded:", v74);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v94 = v93 == 0;

          if (!v94)
            goto LABEL_99;
LABEL_121:

          objc_autoreleasePoolPop(context);
          ++v135;
          v73 = v134 + 1;
        }
        while (v134 + 1 != v128);
        v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v146, v171, 16);
      }
      while (v72);
    }

    v140 = 0u;
    v141 = 0u;
    v138 = 0u;
    v139 = 0u;
    v10 = v121;
    v104 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v138, v167, 16);
    if (v104)
    {
      v105 = *(_QWORD *)v139;
      do
      {
        for (ii = 0; ii != v104; ++ii)
        {
          if (*(_QWORD *)v139 != v105)
            objc_enumerationMutation(v10);
          v107 = *(_QWORD *)(*((_QWORD *)&v138 + 1) + 8 * ii);
          v108 = (void *)MEMORY[0x1A1B00664]();
          -[NSMutableDictionary removeObjectForKey:](v136->_updatedItemsByIdentifiers, "removeObjectForKey:", v107);
          -[NSMutableSet addObject:](v136->_deletedItemsIdentifiers, "addObject:", v107);
          fp_current_or_default_log();
          v109 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v178 = v107;
            _os_log_debug_impl(&dword_1A0A34000, v109, OS_LOG_TYPE_DEBUG, "[DEBUG] deleted item: %@", buf, 0xCu);
          }

          -[NSMutableDictionary objectForKey:](v136->_formerItemsIdentifiers, "objectForKey:", v107);
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          if (v110)
          {
            -[NSMutableDictionary removeObjectForKey:](v136->_updatedItemsByIdentifiers, "removeObjectForKey:", v110);
            -[NSMutableSet addObject:](v136->_deletedItemsIdentifiers, "addObject:", v110);
            fp_current_or_default_log();
            v111 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v111, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v178 = v110;
              _os_log_debug_impl(&dword_1A0A34000, v111, OS_LOG_TYPE_DEBUG, "[DEBUG] deleted item: %@", buf, 0xCu);
            }

          }
          objc_autoreleasePoolPop(v108);
        }
        v104 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v138, v167, 16);
      }
      while (v104);
    }

    +[FPProgressManager defaultManager](FPProgressManager, "defaultManager");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "attachProgressToItemsIfNeeded:", obj);

    v113 = !v118;
    if (!v119)
      v113 = 0;
    if (!v136->_gathering)
    {
      if (!v136->_regathering)
        goto LABEL_150;
      v113 = 0;
    }
    if (!v136->_hasMoreUpdates)
    {
      fp_current_or_default_log();
      v115 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v115, OS_LOG_TYPE_DEBUG))
        -[FPItemCollection _receivedBatchWithUpdatedItems:deletedItemsIdentifiers:forceFlush:dropForReplacedPlaceholders:].cold.4();

      goto LABEL_156;
    }
LABEL_150:
    if (!v113)
    {
      fp_current_or_default_log();
      v114 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v114, OS_LOG_TYPE_DEBUG))
        -[FPItemCollection _receivedBatchWithUpdatedItems:deletedItemsIdentifiers:forceFlush:dropForReplacedPlaceholders:].cold.3();
      goto LABEL_160;
    }
LABEL_156:
    fp_current_or_default_log();
    v116 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG))
      -[FPItemCollection _receivedBatchWithUpdatedItems:deletedItemsIdentifiers:forceFlush:dropForReplacedPlaceholders:].cold.2();

    v136->_flushableRegatheringGeneration = v136->_regatheringGeneration;
    updatePacer = v136->_updatePacer;
    if (!v120)
    {
      -[FPPacer signalWithTransferredQoSIfImmediate](updatePacer, "signalWithTransferredQoSIfImmediate");
      goto LABEL_162;
    }
    -[FPPacer eventBlock](updatePacer, "eventBlock");
    v114 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(v114 + 16))();
LABEL_160:

LABEL_162:
    __fp_leave_section_Debug((uint64_t)&section);
    goto LABEL_163;
  }
  fp_current_or_default_log();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    -[FPItemCollection _receivedBatchWithUpdatedItems:deletedItemsIdentifiers:forceFlush:dropForReplacedPlaceholders:].cold.1();

LABEL_163:
}

- (BOOL)isRootItem:(id)a3
{
  return 0;
}

- (BOOL)isCollectionValidForItem:(id)a3
{
  return 1;
}

- (FPItemID)enumeratedItemID
{
  return (FPItemID *)objc_getProperty(self, a2, 200, 1);
}

- (BOOL)isHiddenItem:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  char v11;
  BOOL v12;

  v3 = a3;
  if ((objc_msgSend(v3, "fileSystemFlags") & 8) != 0)
    goto LABEL_5;
  objc_msgSend(v3, "creationDate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_6;
  v5 = (void *)v4;
  objc_msgSend(v3, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceNow");
  v8 = fabs(v7);

  if (v8 >= 10.0)
    goto LABEL_6;
  objc_msgSend(v3, "filename");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pathExtension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("sb-"));

  if ((v11 & 1) != 0)
LABEL_5:
    v12 = 1;
  else
LABEL_6:
    v12 = 0;

  return v12;
}

uint64_t __34__FPItemCollection_startObserving__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startObserving");
}

uint64_t __43__FPItemCollection_removeActiveCollection___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend((id)_activeCollections, "removeObject:", *(_QWORD *)(a1 + 32));
  result = objc_msgSend((id)_activeCollections, "count");
  if (!result)
    return objc_msgSend((id)_indexingAssertion, "stop");
  return result;
}

void __40__FPItemCollection_addActiveCollection___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend((id)_activeCollections, "addObject:", *(_QWORD *)(a1 + 32));
  if (objc_msgSend((id)_activeCollections, "count") == 1)
  {
    if (_indexingAssertion)
    {
      objc_msgSend((id)_indexingAssertion, "start");
    }
    else if ((_isFetchingIndexingAssertion & 1) == 0)
    {
      _isFetchingIndexingAssertion = 1;
      +[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy");
      v1 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "forceIndexingInForeground:completionHandler:", 0, &__block_literal_global_198);

    }
  }
}

uint64_t __34__FPItemCollection__numberOfItems__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __52__FPItemCollection_reorderItemsWithSortDescriptors___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  int v4;
  void *v5;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __52__FPItemCollection_reorderItemsWithSortDescriptors___block_invoke_cold_1();

  if ((objc_msgSend(*(id *)(a1 + 40), "isEqualToArray:", v2) & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
    if (objc_msgSend(*(id *)(a1 + 32), "_numberOfItems"))
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 112) = 1;
      v4 = objc_msgSend(*(id *)(a1 + 32), "hasMoreUpdates");
      v5 = *(void **)(a1 + 32);
      if (v4)
        objc_msgSend(v5, "_restartObservationWithReason:", CFSTR("sort order changed"));
      else
        objc_msgSend(v5, "_flushPendingUpdates");
    }
  }

}

- (NSArray)items
{
  NSObject *itemAccessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__17;
  v10 = __Block_byref_object_dispose__17;
  v11 = 0;
  itemAccessQueue = self->_itemAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __25__FPItemCollection_items__block_invoke;
  v5[3] = &unk_1E444B600;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(itemAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __70__FPItemCollection_reachabilityMonitor_didChangeReachabilityStatusTo___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isRegatheringAfterSignal") & 1) == 0)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allObjects", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
          objc_msgSend(v8, "setOffline:", *(_BYTE *)(a1 + 40) == 0);
          if ((objc_msgSend(v8, "isDownloading") & 1) != 0 || objc_msgSend(v8, "isUploading"))
            objc_msgSend(v2, "addObject:", v8);
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

    if (objc_msgSend(v2, "count"))
      objc_msgSend(*(id *)(a1 + 32), "receivedBatchWithUpdatedItems:deletedItemsIdentifiers:", v2, MEMORY[0x1E0C9AA60]);

  }
}

void __25__FPItemCollection_items__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allObjects");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)isRegatheringAfterSignal
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_updateQueue);
  return !self->_gathering && self->_regathering;
}

- (void)_flushPendingUpdates
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  os_log_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  int v9;

  OUTLINED_FUNCTION_41(*MEMORY[0x1E0C80C00]);
  v1 = *(_QWORD *)(v0 + 128);
  v4 = 134218498;
  v5 = v2;
  v6 = 2112;
  v7 = v0;
  v8 = 1024;
  v9 = v1;
  _os_log_debug_impl(&dword_1A0A34000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx flushing pending updates for %@, generation %d", (uint8_t *)&v4, 0x1Cu);
}

- (void)_startRegathering
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2(&dword_1A0A34000, v0, v1, "[DEBUG] regathering %@ (generation %d)");
  OUTLINED_FUNCTION_3();
}

- (int64_t)_numberOfItems
{
  NSObject *itemAccessQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  itemAccessQueue = self->_itemAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__FPItemCollection__numberOfItems__block_invoke;
  v5[3] = &unk_1E444B600;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(itemAccessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_reorderWithPlaceholdersLast:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
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
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7), "state", (_QWORD)v12) & 1) != 0)
        {

          objc_msgSend(v3, "fp_filter:", &__block_literal_global_161);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "fp_filter:", &__block_literal_global_162);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v10);
          v8 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }

  v8 = v3;
LABEL_11:

  return v8;
}

- (void)dataSource:(id)a3 replaceContentsWithItems:(id)a4 hasMoreChanges:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *updateQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a4;
  updateQueue = self->_updateQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__FPItemCollection_dataSource_replaceContentsWithItems_hasMoreChanges___block_invoke;
  v13[3] = &unk_1E444C438;
  v13[4] = self;
  v14 = v8;
  v16 = a5;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(updateQueue, v13);

}

- (void)_receivedBatchWithUpdatedItems:(id)a3 deletedItemsIdentifiers:(id)a4
{
  -[FPItemCollection _receivedBatchWithUpdatedItems:deletedItemsIdentifiers:dropForReplacedPlaceholders:](self, "_receivedBatchWithUpdatedItems:deletedItemsIdentifiers:dropForReplacedPlaceholders:", a3, a4, 1);
}

- (void)_receivedBatchWithUpdatedItems:(id)a3 deletedItemsIdentifiers:(id)a4 dropForReplacedPlaceholders:(BOOL)a5
{
  -[FPItemCollection _receivedBatchWithUpdatedItems:deletedItemsIdentifiers:forceFlush:dropForReplacedPlaceholders:](self, "_receivedBatchWithUpdatedItems:deletedItemsIdentifiers:forceFlush:dropForReplacedPlaceholders:", a3, a4, 0, a5);
}

void __55__FPItemCollection_dataSource_wasInvalidatedWithError___block_invoke(uint64_t a1)
{
  int v2;
  _QWORD *v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;

  if (objc_msgSend(*(id *)(a1 + 32), "__isUsingDataSource:", *(_QWORD *)(a1 + 40)))
  {
    v2 = objc_msgSend(*(id *)(a1 + 48), "fp_isSyncAnchorExpiredError");
    v3 = *(_QWORD **)(a1 + 32);
    if (v2)
    {
      objc_msgSend(v3, "_startRegathering");
      objc_msgSend(*(id *)(a1 + 32), "_restartObservationWithReason:", CFSTR("sync anchor expired"));
    }
    else
    {
      v4 = v3[4];
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __55__FPItemCollection_dataSource_wasInvalidatedWithError___block_invoke_2;
      v5[3] = &unk_1E4449A40;
      v5[4] = v3;
      v6 = *(id *)(a1 + 48);
      dispatch_async(v4, v5);

    }
  }
}

uint64_t __71__FPItemCollection_dataSource_replaceContentsWithItems_hasMoreChanges___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "__isUsingDataSource:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_startRegathering");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 178) = *(_BYTE *)(a1 + 56);
    return objc_msgSend(*(id *)(a1 + 32), "_receivedBatchWithUpdatedItems:deletedItemsIdentifiers:", *(_QWORD *)(a1 + 48), MEMORY[0x1E0C9AA60]);
  }
  return result;
}

- (BOOL)__isUsingDataSource:(id)a3
{
  return self->_observing && self->_dataSource == a3;
}

- (BOOL)isGathering
{
  return self->_gathering;
}

- (NSPredicate)itemFilteringPredicate
{
  return self->_itemFilteringPredicate;
}

void __35__FPItemCollection_initWithPacing___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_flushPendingUpdates");

}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setItemFilteringPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_itemFilteringPredicate, a3);
}

+ (void)initialize
{
  if (initialize_once_0 != -1)
    dispatch_once(&initialize_once_0, &__block_literal_global_33);
}

uint64_t __63__FPItemCollection_refreshActiveCollectionsForDecorationChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_restartObservationWithReason:", CFSTR("decorations updated"));
}

- (void)reachabilityMonitor:(id)a3 didChangeReachabilityStatusTo:(BOOL)a4
{
  NSObject *updateQueue;
  _QWORD v5[5];
  BOOL v6;

  updateQueue = self->_updateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__FPItemCollection_reachabilityMonitor_didChangeReachabilityStatusTo___block_invoke;
  v5[3] = &unk_1E444BAA8;
  v5[4] = self;
  v6 = a4;
  dispatch_async(updateQueue, v5);
}

- (FPItemCollection)init
{
  return -[FPItemCollection initWithPacing:](self, "initWithPacing:", 1);
}

- (OS_dispatch_queue)updateQueue
{
  return self->_updateQueue;
}

void __33__FPItemCollection_stopObserving__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 180))
  {
    *(_BYTE *)(v1 + 180) = 0;
    v7 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(v7, "invalidate");
    objc_msgSend(v7, "setDelegate:", 0);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = 0;

    +[FPItemCollection removeActiveCollection:](FPItemCollection, "removeActiveCollection:", *(_QWORD *)(a1 + 32));
    +[FPReachabilityMonitor sharedReachabilityMonitor](FPReachabilityMonitor, "sharedReachabilityMonitor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:", *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "suspend");
  }
  else
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __33__FPItemCollection_stopObserving__block_invoke_cold_1();

  }
}

void __40__FPItemCollection__flushPendingUpdates__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  id WeakRetained;
  char v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *(_QWORD *)(a1 + 64);
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __40__FPItemCollection__flushPendingUpdates__block_invoke_cold_3();

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__17;
  v26 = __Block_byref_object_dispose__17;
  v27 = 0;
  v15 = MEMORY[0x1E0C809B0];
  v17 = __40__FPItemCollection__flushPendingUpdates__block_invoke_171;
  v18 = &unk_1E444AB70;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(v3 + 40);
  v16 = 3221225472;
  v21 = &v22;
  v19 = v3;
  v20 = v4;
  dispatch_sync(v5, &v15);
  fp_current_or_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __40__FPItemCollection__flushPendingUpdates__block_invoke_cold_2();

  if (*(_BYTE *)(a1 + 72))
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __40__FPItemCollection__flushPendingUpdates__block_invoke_cold_1();

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 192));
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      objc_msgSend((id)v23[5], "itemIDsDifferenceWithList:", *(_QWORD *)(a1 + 40), v15, v16, v17, v18, v19);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 192));
      objc_msgSend(v11, "dataForCollectionShouldBeReloaded:deleteItemsWithIDs:", *(_QWORD *)(a1 + 32), v10);

    }
    else
    {
      v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 192));
      objc_msgSend(v10, "dataForCollectionShouldBeReloaded:", *(_QWORD *)(a1 + 32), v15, v16, v17, v18, v19);
    }

  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 48), "containsChanges", v15, v16, v17, v18, v19))
    {
      v12 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 168));

      if (v12)
        objc_msgSend(*(id *)(a1 + 32), "sendIndexPathBasedDiffs:", *(_QWORD *)(a1 + 48));
    }
    if (objc_msgSend(*(id *)(a1 + 56), "containsChanges"))
    {
      v13 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 160));

      if (v13)
        objc_msgSend(*(id *)(a1 + 32), "sendItemIDBasedDiffs:", *(_QWORD *)(a1 + 56));
    }
  }
  if (*(_BYTE *)(a1 + 73))
  {
    objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("gathering"));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 176) = 0;
    objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("gathering"));
    v14 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 192));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v14, "collectionDidFinishGathering:", *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "resume");
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 216));

  _Block_object_dispose(&v22, 8);
  __fp_leave_section_Debug((uint64_t)&v28);
}

- (void)_startObserving
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0(&dword_1A0A34000, v0, v1, "[DEBUG] collection is already being observed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

+ (void)addActiveCollection:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  v4 = _collectionsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__FPItemCollection_addActiveCollection___block_invoke;
  block[3] = &unk_1E444A308;
  v7 = v3;
  v5 = v3;
  dispatch_sync(v4, block);

}

- (void)setAdditionalItemFilteringPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_additionalItemFilteringPredicate, a3);
}

+ (void)removeActiveCollection:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  v4 = _collectionsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__FPItemCollection_removeActiveCollection___block_invoke;
  block[3] = &unk_1E444A308;
  v7 = v3;
  v5 = v3;
  dispatch_sync(v4, block);

}

- (FPItemCollection)initWithPacing:(BOOL)a3
{
  _BOOL4 v3;
  FPItemCollection *v4;
  FPItemCollection *v5;
  uint64_t v6;
  NSArray *sortDescriptors;
  uint64_t v8;
  NSMutableDictionary *updatedItemsByIdentifiers;
  uint64_t v10;
  NSMutableSet *deletedItemsIdentifiers;
  uint64_t v12;
  NSMutableDictionary *formerItemsIdentifiers;
  uint64_t v14;
  NSMutableDictionary *pendingItemsStitching;
  uint64_t v16;
  NSMutableDictionary *pendingItemsFields;
  _FPItemList *v18;
  _FPItemList *currentItems;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *itemAccessQueue;
  id v23;
  const char *v24;
  NSObject *v25;
  NSObject *v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *updateQueue;
  double v29;
  FPPacer *v30;
  FPPacer *updatePacer;
  uint64_t v32;
  NSPredicate *itemFilteringPredicate;
  uint64_t v34;
  FPAppRegistry *appRegistry;
  _QWORD v37[4];
  id v38;
  id location;
  objc_super v40;

  v3 = a3;
  v40.receiver = self;
  v40.super_class = (Class)FPItemCollection;
  v4 = -[FPItemCollection init](&v40, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_gathering = 1;
    v4->_regathering = 1;
    v4->_hasMoreUpdates = 1;
    objc_msgSend(MEMORY[0x1E0C99D20], "fp_sortDescriptorByDisplayName");
    v6 = objc_claimAutoreleasedReturnValue();
    sortDescriptors = v5->_sortDescriptors;
    v5->_sortDescriptors = (NSArray *)v6;

    v5->_shouldRetryOnceAfterCrash = 1;
    v8 = objc_opt_new();
    updatedItemsByIdentifiers = v5->_updatedItemsByIdentifiers;
    v5->_updatedItemsByIdentifiers = (NSMutableDictionary *)v8;

    v10 = objc_opt_new();
    deletedItemsIdentifiers = v5->_deletedItemsIdentifiers;
    v5->_deletedItemsIdentifiers = (NSMutableSet *)v10;

    v12 = objc_opt_new();
    formerItemsIdentifiers = v5->_formerItemsIdentifiers;
    v5->_formerItemsIdentifiers = (NSMutableDictionary *)v12;

    v14 = objc_opt_new();
    pendingItemsStitching = v5->_pendingItemsStitching;
    v5->_pendingItemsStitching = (NSMutableDictionary *)v14;

    v16 = objc_opt_new();
    pendingItemsFields = v5->_pendingItemsFields;
    v5->_pendingItemsFields = (NSMutableDictionary *)v16;

    v18 = objc_alloc_init(_FPItemList);
    currentItems = v5->_currentItems;
    v5->_currentItems = v18;

    objc_storeStrong((id *)&v5->_workingQueue, MEMORY[0x1E0C80D38]);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = dispatch_queue_create("com.apple.FileProvider.ItemCollection.item-access-queue", v20);
    itemAccessQueue = v5->_itemAccessQueue;
    v5->_itemAccessQueue = (OS_dispatch_queue *)v21;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.FileProvider.ItemCollection.update-queue (%p)"), v5);
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v24 = (const char *)objc_msgSend(v23, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v25 = objc_claimAutoreleasedReturnValue();
    if (itemCollectionUpdateQueue_once != -1)
      dispatch_once(&itemCollectionUpdateQueue_once, &__block_literal_global_396);
    v26 = (id)itemCollectionUpdateQueue_updateQueue;
    v27 = dispatch_queue_create_with_target_V2(v24, v25, v26);
    updateQueue = v5->_updateQueue;
    v5->_updateQueue = (OS_dispatch_queue *)v27;

    if (v3)
      v29 = 0.5;
    else
      v29 = 0.0;
    v30 = -[FPPacer initWithName:queue:minFireInterval:]([FPPacer alloc], "initWithName:queue:minFireInterval:", CFSTR("com.apple.FileProvider.ItemCollection.update-pacer"), v5->_updateQueue, v29);
    updatePacer = v5->_updatePacer;
    v5->_updatePacer = v30;

    location = 0;
    objc_initWeak(&location, v5);
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __35__FPItemCollection_initWithPacing___block_invoke;
    v37[3] = &unk_1E44499C0;
    objc_copyWeak(&v38, &location);
    -[FPPacer setEventBlock:](v5->_updatePacer, "setEventBlock:", v37);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    v32 = objc_claimAutoreleasedReturnValue();
    itemFilteringPredicate = v5->_itemFilteringPredicate;
    v5->_itemFilteringPredicate = (NSPredicate *)v32;

    +[FPAppRegistry sharedRegistry](FPAppRegistry, "sharedRegistry");
    v34 = objc_claimAutoreleasedReturnValue();
    appRegistry = v5->_appRegistry;
    v5->_appRegistry = (FPAppRegistry *)v34;

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);

  }
  return v5;
}

- (void)setDelegate:(id)a3
{
  void *v4;
  int v5;
  FPItemCollectionIndexPathBasedDelegate **p_indexPathBasedDelegate;
  void *v7;
  id v8;

  v8 = a3;
  objc_storeWeak((id *)&self->_delegate, v8);
  if (!v8)
  {
    objc_storeWeak((id *)&self->_itemIDBasedDelegate, 0);
    p_indexPathBasedDelegate = &self->_indexPathBasedDelegate;
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EE5DF2F0))
    v4 = v8;
  else
    v4 = 0;
  objc_storeWeak((id *)&self->_itemIDBasedDelegate, v4);
  v5 = objc_msgSend(v8, "conformsToProtocol:", &unk_1EE5E7CE0);
  p_indexPathBasedDelegate = &self->_indexPathBasedDelegate;
  if (!v5)
    goto LABEL_8;
  v7 = v8;
LABEL_9:
  objc_storeWeak((id *)p_indexPathBasedDelegate, v7);

}

+ (void)refreshActiveCollectionsForDecorationChange
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a1, "activeCollections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "workingQueue");
        v9 = objc_claimAutoreleasedReturnValue();
        block[0] = v6;
        block[1] = 3221225472;
        block[2] = __63__FPItemCollection_refreshActiveCollectionsForDecorationChange__block_invoke;
        block[3] = &unk_1E444A308;
        block[4] = v8;
        dispatch_async(v9, block);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

- (OS_dispatch_queue)workingQueue
{
  return self->_workingQueue;
}

+ (id)activeCollections
{
  id v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__17;
  v9 = __Block_byref_object_dispose__17;
  v10 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__FPItemCollection_activeCollections__block_invoke;
  block[3] = &unk_1E444B188;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)_collectionsQueue, block);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __50__FPItemCollection__restartObservationWithReason___block_invoke(uint64_t a1)
{
  NSObject *v2;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __50__FPItemCollection__restartObservationWithReason___block_invoke_cold_1();

  return objc_msgSend(*(id *)(a1 + 32), "_restartObservation");
}

- (void)_restartObservation
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] %@ restarting observation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startObserving
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] %@: don't start immediately, start is throttled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)stopObserving
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] stop observing %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_cancelStartTime
{
  NSObject *restartTimer;
  OS_dispatch_source *v4;

  restartTimer = self->_restartTimer;
  if (restartTimer)
  {
    dispatch_source_cancel(restartTimer);
    v4 = self->_restartTimer;
    self->_restartTimer = 0;

  }
}

- (void)_restartObservationWithReason:(id)a3
{
  id v4;
  NSObject *workingQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workingQueue = self->_workingQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__FPItemCollection__restartObservationWithReason___block_invoke;
  v7[3] = &unk_1E4449A40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workingQueue, v7);

}

- (void)reorderItemsWithSortDescriptors:(id)a3
{
  id v4;
  void *v5;
  NSObject *updateQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    updateQueue = self->_updateQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __52__FPItemCollection_reorderItemsWithSortDescriptors___block_invoke;
    v7[3] = &unk_1E4449A40;
    v7[4] = self;
    v8 = v4;
    dispatch_async(updateQueue, v7);

  }
}

- (BOOL)observing
{
  return self->_observing;
}

- (FPCollectionDataSource)dataSource
{
  return self->_dataSource;
}

- (void)dataSource:(id)a3 wasInvalidatedWithError:(id)a4
{
  id v7;
  id v8;
  NSObject *updateQueue;
  id v10;
  id v11;
  void *v12;
  _QWORD block[5];
  id v14;
  id v15;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPItemCollection.m"), 608, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

  }
  updateQueue = self->_updateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__FPItemCollection_dataSource_wasInvalidatedWithError___block_invoke;
  block[3] = &unk_1E444AB48;
  block[4] = self;
  v14 = v7;
  v15 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(updateQueue, block);

}

void __37__FPItemCollection_activeCollections__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend((id)_activeCollections, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __40__FPItemCollection_addActiveCollection___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  _isFetchingIndexingAssertion = 0;
  objc_storeStrong((id *)&_indexingAssertion, *(id *)(a1 + 32));
  result = objc_msgSend((id)_activeCollections, "count");
  if (result)
    return objc_msgSend((id)_indexingAssertion, "start");
  return result;
}

void __30__FPItemCollection_initialize__block_invoke()
{
  uint64_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  v0 = objc_opt_new();
  v1 = (void *)_activeCollections;
  _activeCollections = v0;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("collections-queue", v4);
  v3 = (void *)_collectionsQueue;
  _collectionsQueue = (uint64_t)v2;

}

void __40__FPItemCollection_addActiveCollection___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  id v4;
  _QWORD block[4];
  id v6;

  v2 = a2;
  v3 = _collectionsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__FPItemCollection_addActiveCollection___block_invoke_3;
  block[3] = &unk_1E444A308;
  v6 = v2;
  v4 = v2;
  dispatch_async(v3, block);

}

uint64_t __80__FPItemCollection_dataSource_receivedUpdatedItems_deletedItems_hasMoreChanges___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "__isUsingDataSource:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 178) = *(_BYTE *)(a1 + 64);
    return objc_msgSend(*(id *)(a1 + 32), "_receivedBatchWithUpdatedItems:deletedItemsIdentifiers:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  return result;
}

uint64_t __42__FPItemCollection_isEnumerationSuspended__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = _enumerationSuspendCount != 0;
  return result;
}

void __40__FPItemCollection__updateObservedItem___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  char v4;
  void *v5;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __40__FPItemCollection__updateObservedItem___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collection:didUpdateObservedItem:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

  }
}

uint64_t __33__FPItemCollection__indexOfItem___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 24), "indexOfObject:", a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)setWorkingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workingQueue, a3);
}

- (void)setShowHiddenFiles:(BOOL)a3
{
  self->_showHiddenFiles = a3;
}

- (unint64_t)lastForcedUpdate
{
  return self->_lastForcedUpdate;
}

- (FPItemCollectionMinimalDelegate)delegate
{
  return (FPItemCollectionMinimalDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)dataSourceShouldAlwaysReplaceContents:(id)a3
{
  return 0;
}

- (void)dataSource:(id)a3 receivedUpdatedItems:(id)a4 deletedItems:(id)a5 hasMoreChanges:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *updateQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  updateQueue = self->_updateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__FPItemCollection_dataSource_receivedUpdatedItems_deletedItems_hasMoreChanges___block_invoke;
  block[3] = &unk_1E444D890;
  block[4] = self;
  v18 = v10;
  v21 = a6;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(updateQueue, block);

}

- (void)_updateObservedItem:(id)a3
{
  id v4;
  NSObject *workingQueue;
  _QWORD v6[4];
  id v7;
  FPItemCollection *v8;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_updateQueue);
  -[FPItemCollection updateRootItem:](self, "updateRootItem:", v4);
  if (self->_observing)
  {
    workingQueue = self->_workingQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __40__FPItemCollection__updateObservedItem___block_invoke;
    v6[3] = &unk_1E4449A40;
    v7 = v4;
    v8 = self;
    dispatch_async(workingQueue, v6);

  }
}

- (unint64_t)_indexOfItem:(id)a3
{
  id v4;
  NSObject *itemAccessQueue;
  id v6;
  unint64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  itemAccessQueue = self->_itemAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__FPItemCollection__indexOfItem___block_invoke;
  block[3] = &unk_1E444AB70;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(itemAccessQueue, block);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

+ (BOOL)isEnumerationSuspended
{
  char v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__FPItemCollection_isEnumerationSuspended__block_invoke;
  block[3] = &unk_1E444B188;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)_collectionsQueue, block);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __34__FPItemCollection_startObserving__block_invoke_132(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  NSObject *v3;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    fp_current_or_default_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __34__FPItemCollection_startObserving__block_invoke_132_cold_1();

    objc_msgSend(WeakRetained, "_cancelStartTime");
    v3 = WeakRetained[27];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34__FPItemCollection_startObserving__block_invoke_133;
    block[3] = &unk_1E444A308;
    block[4] = WeakRetained;
    dispatch_async(v3, block);
  }

}

uint64_t __34__FPItemCollection_startObserving__block_invoke_133(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startObserving");
}

- (BOOL)recoverFromError:(id)a3
{
  return 0;
}

- (BOOL)shouldRetryError:(id)a3
{
  return objc_msgSend(a3, "fp_isRemoteCrashError");
}

void __55__FPItemCollection_dataSource_wasInvalidatedWithError___block_invoke_2(uint64_t a1)
{
  _BYTE *v2;
  id *v3;
  id *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = (id *)(a1 + 32);
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[136] && (v4 = (id *)(a1 + 40), objc_msgSend(v2, "shouldRetryError:", *(_QWORD *)(a1 + 40))))
  {
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __55__FPItemCollection_dataSource_wasInvalidatedWithError___block_invoke_2_cold_2((uint64_t)v3, v4);

    *((_BYTE *)*v3 + 136) = 0;
    objc_msgSend(*v3, "_restartObservation");
  }
  else
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __55__FPItemCollection_dataSource_wasInvalidatedWithError___block_invoke_2_cold_1((uint64_t)v3, a1);

    if ((objc_msgSend(*(id *)(a1 + 32), "recoverFromError:", *(_QWORD *)(a1 + 40)) & 1) == 0)
    {
      objc_msgSend(*v3, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*v3, "stopObserving");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v8 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "fp_unwrappedInternalError");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "collection:didEncounterError:", v8, v9);

      }
    }
  }
}

- (void)suspendUpdates
{
  NSObject *updateQueue;
  _QWORD block[5];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workingQueue);
  updateQueue = self->_updateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__FPItemCollection_suspendUpdates__block_invoke;
  block[3] = &unk_1E444A308;
  block[4] = self;
  dispatch_sync(updateQueue, block);
}

uint64_t __34__FPItemCollection_suspendUpdates__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "suspend");
}

- (void)resumeUpdates
{
  NSObject *updateQueue;
  _QWORD block[5];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workingQueue);
  updateQueue = self->_updateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__FPItemCollection_resumeUpdates__block_invoke;
  block[3] = &unk_1E444A308;
  block[4] = self;
  dispatch_sync(updateQueue, block);
}

uint64_t __33__FPItemCollection_resumeUpdates__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "resume");
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] dealloc %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (int64_t)numberOfItems
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workingQueue);
  return -[FPItemCollection _numberOfItems](self, "_numberOfItems");
}

- (unint64_t)_indexOfItemID:(id)a3
{
  id v4;
  NSObject *itemAccessQueue;
  id v6;
  unint64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  itemAccessQueue = self->_itemAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__FPItemCollection__indexOfItemID___block_invoke;
  block[3] = &unk_1E444AB70;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(itemAccessQueue, block);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __35__FPItemCollection__indexOfItemID___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 24), "indexOfItemID:", a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (id)itemAtIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *itemAccessQueue;
  id v7;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workingQueue);
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__17;
  v14 = __Block_byref_object_dispose__17;
  v15 = 0;
  v5 = objc_msgSend(v4, "indexAtPosition:", 0);
  itemAccessQueue = self->_itemAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__FPItemCollection_itemAtIndexPath___block_invoke;
  block[3] = &unk_1E444D8B8;
  block[5] = &v10;
  block[6] = v5;
  block[4] = self;
  dispatch_sync(itemAccessQueue, block);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __36__FPItemCollection_itemAtIndexPath___block_invoke(_QWORD *a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = a1[6];
  if (v2 < objc_msgSend(*(id *)(a1[4] + 24), "count"))
  {
    objc_msgSend(*(id *)(a1[4] + 24), "objectAtIndex:", a1[6]);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1[5] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

- (id)_t_items
{
  void *v2;
  void *v3;

  -[_FPItemList allObjects](self->_currentItems, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)_itemsMutableCopy
{
  NSObject *itemAccessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__17;
  v10 = __Block_byref_object_dispose__17;
  v11 = 0;
  itemAccessQueue = self->_itemAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__FPItemCollection__itemsMutableCopy__block_invoke;
  v5[3] = &unk_1E444B600;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(itemAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __37__FPItemCollection__itemsMutableCopy__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "mutableCopy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)_isUsingDataSource:(id)a3
{
  id v4;
  NSObject *updateQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workingQueue);
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  updateQueue = self->_updateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__FPItemCollection__isUsingDataSource___block_invoke;
  block[3] = &unk_1E444AB70;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(updateQueue, block);
  LOBYTE(v4) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

uint64_t __39__FPItemCollection__isUsingDataSource___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "__isUsingDataSource:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)replacePlaceholders:(id)a3 withActualItems:(id)a4 deletedIDs:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *updateQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  updateQueue = self->_updateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__FPItemCollection_replacePlaceholders_withActualItems_deletedIDs___block_invoke;
  block[3] = &unk_1E444A0C0;
  block[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(updateQueue, block);

}

void __67__FPItemCollection_replacePlaceholders_withActualItems_deletedIDs___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  NSObject *v24;
  uint8_t v25;
  _BYTE v26[15];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t section;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  section = __fp_create_section();
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __67__FPItemCollection_replacePlaceholders_withActualItems_deletedIDs___block_invoke_cold_3();

  if (objc_msgSend(*(id *)(a1 + 32), "isRegatheringAfterSignal"))
  {
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __67__FPItemCollection_replacePlaceholders_withActualItems_deletedIDs___block_invoke_cold_1();
  }
  else
  {
    v24 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v4 = *(id *)(a1 + 48);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
    if (v5)
    {
      v7 = *(_QWORD *)v28;
      *(_QWORD *)&v6 = 134218498;
      v23 = v6;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v28 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v9, "formerIdentifier", v23);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10 == 0;

          if (!v11)
          {
            v12 = objc_msgSend(*(id *)(a1 + 32), "_indexOfItem:", v9);
            if (v12 != 0x7FFFFFFFFFFFFFFFLL)
            {
              fp_current_or_default_log();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v9, "formerIdentifier");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v23;
                v33 = v12;
                v34 = 2112;
                v35 = v20;
                v36 = 2112;
                v37 = v9;
                _os_log_debug_impl(&dword_1A0A34000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] replacing placeholder at index %ld with ID %@ with %@", buf, 0x20u);

              }
              if (objc_msgSend(v9, "isBusy"))
              {
                fp_current_or_default_log();
                v14 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
                  __67__FPItemCollection_replacePlaceholders_withActualItems_deletedIDs___block_invoke_cold_2(&v25, v26, v14);

                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectAtIndex:", v12);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "creationDate");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "setCreationDate:", v16);

                objc_msgSend(v15, "documentSize");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "setDocumentSize:", v17);

                objc_msgSend(v15, "contentModificationDate");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "setContentModificationDate:", v18);

              }
              objc_msgSend(v9, "formerItemID");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject removeObject:](v24, "removeObject:", v19);

            }
          }
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
      }
      while (v5);
    }

    -[NSObject allObjects](v24, "allObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "arrayByAddingObjectsFromArray:", *(_QWORD *)(a1 + 56));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 184);
    objc_msgSend(*(id *)(a1 + 32), "_receivedBatchWithUpdatedItems:deletedItemsIdentifiers:dropForReplacedPlaceholders:", *(_QWORD *)(a1 + 48), v22, 0);
    objc_msgSend(*(id *)(a1 + 32), "_flushPendingUpdates");

    v3 = v24;
  }

  __fp_leave_section_Debug((uint64_t)&section);
}

- (void)receivedBatchWithUpdatedItems:(id)a3 deletedItemsIdentifiers:(id)a4 hasMoreChanges:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *updateQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a4;
  updateQueue = self->_updateQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __89__FPItemCollection_receivedBatchWithUpdatedItems_deletedItemsIdentifiers_hasMoreChanges___block_invoke;
  v13[3] = &unk_1E444C438;
  v16 = a5;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(updateQueue, v13);

}

uint64_t __89__FPItemCollection_receivedBatchWithUpdatedItems_deletedItemsIdentifiers_hasMoreChanges___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 178) = *(_BYTE *)(a1 + 56);
  return objc_msgSend(*(id *)(a1 + 32), "_receivedBatchWithUpdatedItems:deletedItemsIdentifiers:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)receivedBatchWithUpdatedItems:(id)a3 deletedItemsIdentifiers:(id)a4
{
  id v6;
  id v7;
  NSObject *updateQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  updateQueue = self->_updateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__FPItemCollection_receivedBatchWithUpdatedItems_deletedItemsIdentifiers___block_invoke;
  block[3] = &unk_1E444AB48;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(updateQueue, block);

}

uint64_t __74__FPItemCollection_receivedBatchWithUpdatedItems_deletedItemsIdentifiers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_receivedBatchWithUpdatedItems:deletedItemsIdentifiers:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)forceRefreshOfItemWithItemID:(id)a3
{
  id v4;
  NSObject *updateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  updateQueue = self->_updateQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__FPItemCollection_forceRefreshOfItemWithItemID___block_invoke;
  v7[3] = &unk_1E4449A40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(updateQueue, v7);

}

void __49__FPItemCollection_forceRefreshOfItemWithItemID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__17;
  v16 = __Block_byref_object_dispose__17;
  v17 = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (v13[5])
    goto LABEL_3;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__FPItemCollection_forceRefreshOfItemWithItemID___block_invoke_2;
  block[3] = &unk_1E444AB70;
  v11 = &v12;
  block[4] = v2;
  v10 = v3;
  dispatch_sync(v4, block);
  LOBYTE(v4) = v13[5] == 0;

  if ((v4 & 1) == 0)
  {
LABEL_3:
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __49__FPItemCollection_forceRefreshOfItemWithItemID___block_invoke_cold_1();

    v6 = *(void **)(a1 + 32);
    v7 = (void *)objc_msgSend((id)v13[5], "copy");
    v18[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_receivedBatchWithUpdatedItems:deletedItemsIdentifiers:", v8, MEMORY[0x1E0C9AA60]);

  }
  _Block_object_dispose(&v12, 8);

}

void __49__FPItemCollection_forceRefreshOfItemWithItemID___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 24), "itemWithItemID:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)indexPathFromIndex:(int64_t)a3
{
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPItemCollection.m"), 1266, CFSTR("invalid index"));

  }
  v8[0] = 0;
  v8[1] = a3;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndexes:length:", v8, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)indexPathsFromIndexSet:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  FPItemCollection *v12;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__FPItemCollection_indexPathsFromIndexSet___block_invoke;
  v10[3] = &unk_1E444D8E0;
  v7 = v6;
  v11 = v7;
  v12 = self;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v10);

  v8 = v7;
  return v8;
}

void __43__FPItemCollection_indexPathsFromIndexSet___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "indexPathFromIndex:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (id)_bouncedItem:(id)a3 withinItems:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v5;
  objc_msgSend(v7, "filename");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  objc_msgSend(v8, "fp_stringByDeletingPathBounceNo:andPathExtension:isFolder:", &v37, 0, objc_msgSend(v7, "isFolder"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v37;

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  v13 = v11;
  v14 = v7;
  if (!v12)
    goto LABEL_17;
  v15 = v12;
  v31 = v10;
  v16 = 0;
  v17 = *(_QWORD *)v34;
  do
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v34 != v17)
        objc_enumerationMutation(v11);
      v19 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
      objc_msgSend(v19, "filename", v31);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      objc_msgSend(v20, "fp_stringByDeletingPathBounceNo:andPathExtension:isFolder:", &v32, 0, objc_msgSend(v19, "isFolder"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v32;

      if (!objc_msgSend(v9, "localizedCaseInsensitiveCompare:", v21))
      {
        v23 = objc_msgSend(v22, "unsignedIntValue");
        if (v16 > v23)
          v23 = v16;
        if (v23 <= 1)
          v16 = 1;
        else
          v16 = v23;
      }

    }
    v15 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  }
  while (v15);

  v14 = v7;
  v10 = v31;
  if (v16)
  {
    v14 = (void *)objc_msgSend(v7, "copy");

    objc_msgSend(v9, "fp_bouncedNameWithIndex:isDir:", v16 + 1, objc_msgSend(v14, "isFolder"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDisplayName:", v24);

    objc_msgSend(v14, "displayName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFilename:", v25);

    objc_msgSend(v14, "fileURL");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v14, "fileURL");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "URLByDeletingLastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "filename");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "URLByAppendingPathComponent:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setFileURL:", v29);

LABEL_17:
    }
  }

  return v14;
}

BOOL __49__FPItemCollection__reorderWithPlaceholdersLast___block_invoke(uint64_t a1, void *a2)
{
  return (objc_msgSend(a2, "state") & 1) == 0;
}

uint64_t __49__FPItemCollection__reorderWithPlaceholdersLast___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "state") & 1;
}

- (BOOL)shouldConsiderUsingPlaceholder:(id)a3 forItem:(id)a4 skipForwardFormerID:(BOOL *)a5
{
  id v8;
  NSMutableDictionary *pendingItemsStitching;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  char v17;

  v8 = a3;
  *a5 = 0;
  pendingItemsStitching = self->_pendingItemsStitching;
  v10 = a4;
  objc_msgSend(v8, "itemID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](pendingItemsStitching, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "itemID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "itemID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v13, "isEqual:", v14);
  objc_msgSend(v8, "formerItemID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "isPlaceholder") & 1) != 0)
  {
    v17 = v15 ^ 1;
    if (((v15 ^ 1) & 1) != 0)
      goto LABEL_9;
LABEL_6:
    if (v16)
    {
      v17 = 1;
      *a5 = 1;
    }
    goto LABEL_9;
  }
  if (!((v12 == 0) & ~objc_msgSend(v8, "isBusy") | v15 & 1))
  {
    v17 = 1;
    goto LABEL_9;
  }
  v17 = 0;
  if (v15)
    goto LABEL_6;
LABEL_9:

  return v17;
}

void __40__FPItemCollection__flushPendingUpdates__block_invoke_171(uint64_t a1)
{
  id *v1;
  uint64_t v2;
  NSObject *v3;

  v1 = (id *)(a1 + 32);
  v2 = a1 + 48;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(*v1, "willChangeValueForKey:", CFSTR("_t_items"));
  objc_storeStrong((id *)*v1 + 3, v1[1]);
  objc_msgSend(*v1, "didChangeValueForKey:", CFSTR("_t_items"));
  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __40__FPItemCollection__flushPendingUpdates__block_invoke_171_cold_1((uint64_t *)v1, v2, v3);

}

- (id)computeIndexPathsBasedDiffsWithOldItems:(id)a3 futureItems:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableSet *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  unint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  unint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v51;
  void *v52;
  void *v53;
  id obj;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
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
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v59 = a3;
  v60 = a4;
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  objc_msgSend(v6, "setMovedSourceIndexPaths:", v7);

  v8 = (void *)objc_opt_new();
  objc_msgSend(v6, "setMovedDestinationIndexPaths:", v8);

  v9 = (void *)objc_opt_new();
  objc_msgSend(v6, "setDeletedIndexes:", v9);

  v10 = (void *)objc_opt_new();
  objc_msgSend(v6, "setInsertedIndexes:", v10);

  v11 = (void *)objc_opt_new();
  objc_msgSend(v6, "setUpdatedIndexes:", v11);

  objc_msgSend(v6, "movedSourceIndexPaths");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "movedDestinationIndexPaths");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deletedIndexes");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertedIndexes");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v6;
  objc_msgSend(v6, "updatedIndexes");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v12 = self->_deletedItemsIdentifiers;
  v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v70;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v70 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * v16);
        v18 = (void *)MEMORY[0x1A1B00664]();
        v19 = -[FPItemCollection _indexOfItemID:](self, "_indexOfItemID:", v17);
        if (v19 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v20 = v19;
          objc_msgSend(v59, "removeObjectWithID:", v17);
          objc_msgSend(v57, "addIndex:", v20);
        }
        objc_autoreleasePoolPop(v18);
        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
    }
    while (v14);
  }

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  -[NSMutableDictionary allValues](self->_updatedItemsByIdentifiers, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v66;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v66 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v24);
        v26 = (void *)MEMORY[0x1A1B00664]();
        objc_msgSend(v25, "itemID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "removeObjectWithID:", v27);

        v28 = objc_msgSend(v60, "indexOfObject:", v25);
        v29 = -[FPItemCollection _indexOfItem:](self, "_indexOfItem:", v25);
        if (v29 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v30 = v56;
          if (v28 != 0x7FFFFFFFFFFFFFFFLL)
            goto LABEL_23;
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPItemCollection.m"), 1687, CFSTR("item %@ doesn't belong in collection %@?"), v25, self);
          v30 = v56;
          goto LABEL_22;
        }
        v32 = v29;
        if (v28 == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPItemCollection.m"), 1694, CFSTR("we just inserted this item"));

        }
        v30 = v58;
        if (v32 != v28)
        {
          -[FPItemCollection indexPathFromIndex:](self, "indexPathFromIndex:", v32);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "addObject:", v34);

          -[FPItemCollection indexPathFromIndex:](self, "indexPathFromIndex:", v28);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "addObject:", v31);
          v30 = v58;
LABEL_22:

        }
LABEL_23:
        objc_msgSend(v30, "addIndex:", v28);
        objc_autoreleasePoolPop(v26);
        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
    }
    while (v22);
  }

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  objc_msgSend(v59, "allObjects");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v62;
    do
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v62 != v38)
          objc_enumerationMutation(v35);
        v40 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v39);
        v41 = (void *)MEMORY[0x1A1B00664]();
        v42 = -[FPItemCollection _indexOfItem:](self, "_indexOfItem:", v40);
        v43 = objc_msgSend(v60, "indexOfObject:", v40);
        if (v43 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (v42 == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPItemCollection.m"), 1714, CFSTR("item doesn't belong anywhere"));

          }
          v45 = v57;
          v46 = v42;
        }
        else
        {
          v47 = v43;
          if (v42 != v43)
          {
            -[FPItemCollection indexPathFromIndex:](self, "indexPathFromIndex:", v42);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "addObject:", v48);

            -[FPItemCollection indexPathFromIndex:](self, "indexPathFromIndex:", v47);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "addObject:", v49);

          }
          v45 = v58;
          v46 = v47;
        }
        objc_msgSend(v45, "addIndex:", v46);
        objc_autoreleasePoolPop(v41);
        ++v39;
      }
      while (v37 != v39);
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
    }
    while (v37);
  }

  return v51;
}

- (void)sendIndexPathBasedDiffs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  FPItemCollection *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  FPItemCollection *v27;
  id v28;
  id v29;
  id v30;

  v4 = a3;
  objc_msgSend(v4, "movedSourceIndexPaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "movedDestinationIndexPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deletedIndexes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertedIndexes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updatedIndexes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_indexPathBasedDelegate);
  v11 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __44__FPItemCollection_sendIndexPathBasedDiffs___block_invoke;
  v24[3] = &unk_1E444D990;
  v12 = v7;
  v25 = v12;
  v13 = WeakRetained;
  v26 = v13;
  v27 = self;
  v14 = v8;
  v28 = v14;
  v15 = v5;
  v29 = v15;
  v16 = v6;
  v30 = v16;
  v17 = (void *)MEMORY[0x1A1B00850](v24);
  v18 = objc_msgSend(v12, "count");
  v19 = objc_msgSend(v14, "count") + v18;
  if (v19 + objc_msgSend(v15, "count"))
    objc_msgSend(v13, "collection:didPerformBatchUpdateWithReplayBlock:", self, v17);
  if (objc_msgSend(v9, "count"))
  {
    v20[0] = v11;
    v20[1] = 3221225472;
    v20[2] = __44__FPItemCollection_sendIndexPathBasedDiffs___block_invoke_186;
    v20[3] = &unk_1E444AB48;
    v21 = v9;
    v22 = v13;
    v23 = self;
    objc_msgSend(v22, "collection:didPerformBatchUpdateWithReplayBlock:", self, v20);

  }
}

uint64_t __44__FPItemCollection_sendIndexPathBasedDiffs___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t result;
  NSObject *v11;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    fp_current_or_default_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __44__FPItemCollection_sendIndexPathBasedDiffs___block_invoke_cold_3();

    v4 = *(void **)(a1 + 40);
    v3 = *(void **)(a1 + 48);
    objc_msgSend(v3, "indexPathsFromIndexSet:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collection:didDeleteItemsAtIndexPaths:", v3, v5);

  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __44__FPItemCollection_sendIndexPathBasedDiffs___block_invoke_cold_2();

    v7 = *(void **)(a1 + 40);
    v8 = *(void **)(a1 + 48);
    objc_msgSend(v8, "indexPathsFromIndexSet:", *(_QWORD *)(a1 + 56));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collection:didInsertItemsAtIndexPaths:", v8, v9);

  }
  result = objc_msgSend(*(id *)(a1 + 64), "count");
  if (result)
  {
    fp_current_or_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __44__FPItemCollection_sendIndexPathBasedDiffs___block_invoke_cold_1();

    return objc_msgSend(*(id *)(a1 + 40), "collection:didMoveItemsFromIndexPaths:toIndexPaths:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  }
  return result;
}

void __44__FPItemCollection_sendIndexPathBasedDiffs___block_invoke_186(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __44__FPItemCollection_sendIndexPathBasedDiffs___block_invoke_186_cold_1();

  v4 = (void *)a1[5];
  v3 = (void *)a1[6];
  objc_msgSend(v3, "indexPathsFromIndexSet:", a1[4]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collection:didUpdateItemsAtIndexPaths:changes:", v3, v5, 0);

}

- (id)computeItemIDBasedDiffs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  _FPItemList *currentItems;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[NSMutableSet allObjects](self->_deletedItemsIdentifiers, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v3, "setDeletedItemIDs:", v5);

  -[NSMutableDictionary allValues](self->_updatedItemsByIdentifiers, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v3, "setUpdatedItems:", v7);

  v8 = (void *)objc_opt_new();
  objc_msgSend(v3, "setReplacedItemsByFormerID:", v8);

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[NSMutableDictionary allValues](self->_updatedItemsByIdentifiers, "allValues", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v14, "formerItemID");
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (void *)v15;
          currentItems = self->_currentItems;
          objc_msgSend(v14, "formerItemID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[_FPItemList indexOfItemID:](currentItems, "indexOfItemID:", v18);

          if (v19 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v3, "replacedItemsByFormerID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "formerItemID");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setObject:forKeyedSubscript:", v14, v21);

            objc_msgSend(v3, "updatedItems");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "removeObject:", v14);

          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v11);
  }

  return v3;
}

- (void)sendItemIDBasedDiffs:(id)a3
{
  FPItemCollectionItemIDBasedDelegate **p_itemIDBasedDelegate;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;

  p_itemIDBasedDelegate = &self->_itemIDBasedDelegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_itemIDBasedDelegate);
  objc_msgSend(v5, "updatedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "replacedItemsByFormerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deletedItemIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "collection:didUpdateItems:replaceItemsByFormerID:deleteItemsWithIDs:", self, v6, v7, v8);
}

- (id)createDataSourceWithSortDescriptors:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPItemCollection.m"), 1803, CFSTR("UNREACHABLE: should be overriden"));

  return 0;
}

- (id)scopedSearchQuery
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPItemCollection.m"), 1808, CFSTR("UNREACHABLE: should be overriden"));

  return 0;
}

+ (void)consumeUpdates:(id)a3 deletes:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  _QWORD block[5];
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t section;
  uint8_t v23[128];
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  section = __fp_create_section();
  fp_current_or_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v25 = section;
    v26 = 2112;
    v27 = v6;
    v28 = 2112;
    v29 = v7;
    _os_log_debug_impl(&dword_1A0A34000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx stitching notifications (updated:%@ deleted:%@)", buf, 0x20u);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a1, "activeCollections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v13, "updateQueue");
        v14 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __43__FPItemCollection_consumeUpdates_deletes___block_invoke;
        block[3] = &unk_1E444AB48;
        block[4] = v13;
        v16 = v6;
        v17 = v7;
        dispatch_async(v14, block);

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v10);
  }

  __fp_leave_section_Debug((uint64_t)&section);
}

void __43__FPItemCollection_consumeUpdates_deletes___block_invoke(uint64_t a1)
{
  NSObject *v2;

  if (objc_msgSend(*(id *)(a1 + 32), "isRegatheringAfterSignal"))
  {
    fp_current_or_default_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __43__FPItemCollection_consumeUpdates_deletes___block_invoke_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_receivedBatchWithUpdatedItems:deletedItemsIdentifiers:forceFlush:dropForReplacedPlaceholders:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1, 0);
  }
}

+ (void)replacePlaceholders:(id)a3 withActualItems:(id)a4 deletedIDs:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a1, "activeCollections", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "replacePlaceholders:withActualItems:deletedIDs:", v8, v9, v10);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

+ (void)suspendVendorEnumeration
{
  dispatch_sync((dispatch_queue_t)_collectionsQueue, &__block_literal_global_192);
}

void __44__FPItemCollection_suspendVendorEnumeration__block_invoke()
{
  NSObject *v0;

  ++_enumerationSuspendCount;
  fp_current_or_default_log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __44__FPItemCollection_suspendVendorEnumeration__block_invoke_cold_1();

}

+ (void)resumeVendorEnumeration
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD block[8];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__17;
  v23 = __Block_byref_object_dispose__17;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v2 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__FPItemCollection_resumeVendorEnumeration__block_invoke;
  block[3] = &unk_1E444D9D8;
  block[6] = a2;
  block[7] = a1;
  block[4] = &v15;
  block[5] = &v19;
  dispatch_sync((dispatch_queue_t)_collectionsQueue, block);
  if (!v16[3])
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = (id)v20[5];
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v25, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v11 != v5)
            objc_enumerationMutation(v3);
          v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
          objc_msgSend(v7, "updateQueue");
          v8 = objc_claimAutoreleasedReturnValue();
          v9[0] = v2;
          v9[1] = 3221225472;
          v9[2] = __43__FPItemCollection_resumeVendorEnumeration__block_invoke_195;
          v9[3] = &unk_1E444A308;
          v9[4] = v7;
          dispatch_sync(v8, v9);

        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v25, 16);
      }
      while (v4);
    }

  }
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

}

void __43__FPItemCollection_resumeVendorEnumeration__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = _enumerationSuspendCount;
  if (!_enumerationSuspendCount)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[7], CFSTR("FPItemCollection.m"), 1911, CFSTR("over resume!"));

    v2 = _enumerationSuspendCount;
  }
  _enumerationSuspendCount = v2 - 1;
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v2 - 1;
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __43__FPItemCollection_resumeVendorEnumeration__block_invoke_cold_1();

  v5 = objc_msgSend((id)_activeCollections, "copy");
  v6 = *(_QWORD *)(a1[5] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __43__FPItemCollection_resumeVendorEnumeration__block_invoke_195(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enumerationMightHaveResumed");

}

- (void)_replaceContentsWithVendorItems:(id)a3
{
  id v4;
  NSObject *updateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  updateQueue = self->_updateQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__FPItemCollection__replaceContentsWithVendorItems___block_invoke;
  v7[3] = &unk_1E4449A40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(updateQueue, v7);

}

void __52__FPItemCollection__replaceContentsWithVendorItems___block_invoke(uint64_t a1)
{
  void *v2;
  char isKindOfClass;
  id v4;
  uint64_t v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeAllObjects");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 113) = 1;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v6, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v4 = v6;
  }
  else
  {
    objc_msgSend(v6, "fp_map:", &__block_literal_global_201);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  v7 = v4;
  objc_msgSend(*(id *)(a1 + 32), "_receivedBatchWithUpdatedItems:deletedItemsIdentifiers:", v4, MEMORY[0x1E0C9AA60]);

}

FPItem *__52__FPItemCollection__replaceContentsWithVendorItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  FPItem *v3;

  v2 = a2;
  v3 = -[FPItem initWithSearchableItem:]([FPItem alloc], "initWithSearchableItem:", v2);

  return v3;
}

- (void)_setObserving:(BOOL)a3
{
  self->_observing = a3;
}

- (void)setGathering:(BOOL)a3
{
  self->_gathering = a3;
}

- (BOOL)isImmutable
{
  return self->_immutable;
}

- (BOOL)hasMoreUpdates
{
  return self->_hasMoreUpdates;
}

- (BOOL)showHiddenFiles
{
  return self->_showHiddenFiles;
}

- (NSPredicate)additionalItemFilteringPredicate
{
  return self->_additionalItemFilteringPredicate;
}

- (void)setObserving:(BOOL)a3
{
  self->_observing = a3;
}

- (FPPacer)updatePacer
{
  return self->_updatePacer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatePacer, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_additionalItemFilteringPredicate, 0);
  objc_storeStrong((id *)&self->_enumeratedItemID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_indexPathBasedDelegate);
  objc_destroyWeak((id *)&self->_itemIDBasedDelegate);
  objc_storeStrong((id *)&self->_appRegistry, 0);
  objc_storeStrong((id *)&self->_itemFilteringPredicate, 0);
  objc_storeStrong((id *)&self->_pendingItemsFields, 0);
  objc_storeStrong((id *)&self->_pendingItemsStitching, 0);
  objc_storeStrong((id *)&self->_formerItemsIdentifiers, 0);
  objc_storeStrong((id *)&self->_deletedItemsIdentifiers, 0);
  objc_storeStrong((id *)&self->_updatedItemsByIdentifiers, 0);
  objc_storeStrong((id *)&self->_lastInvalidationOnError, 0);
  objc_storeStrong((id *)&self->_restartTimer, 0);
  objc_storeStrong((id *)&self->_itemAccessQueue, 0);
  objc_storeStrong((id *)&self->_workingQueue, 0);
  objc_storeStrong((id *)&self->_currentItems, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
}

- (NSString)providerIdentifier
{
  return (NSString *)&stru_1E4450B40;
}

- (NSString)domainIdentifier
{
  return (NSString *)&stru_1E4450B40;
}

void __34__FPItemCollection_startObserving__block_invoke_132_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] %@: start timer expired", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __55__FPItemCollection_dataSource_wasInvalidatedWithError___block_invoke_2_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(*(id *)(a2 + 40), "fp_prettyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2_1(&dword_1A0A34000, v3, v4, "[ERROR] %@ received an error from data source: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

void __55__FPItemCollection_dataSource_wasInvalidatedWithError___block_invoke_2_cold_2(uint64_t a1, id *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(*a2, "fp_prettyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2_1(&dword_1A0A34000, v3, v4, "[ERROR] %@ received a retriable error from data source: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

void __33__FPItemCollection_stopObserving__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0(&dword_1A0A34000, v0, v1, "[DEBUG] collection is not being observed, nothing to do", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

void __52__FPItemCollection_reorderItemsWithSortDescriptors___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_5(&dword_1A0A34000, v0, v1, "[DEBUG] changing sort descriptors: \"%@\" -> \"%@\");
  OUTLINED_FUNCTION_3();
}

void __67__FPItemCollection_replacePlaceholders_withActualItems_deletedIDs___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0(&dword_1A0A34000, v0, v1, "[DEBUG] not doing anything because we're regathering", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

void __67__FPItemCollection_replacePlaceholders_withActualItems_deletedIDs___block_invoke_cold_2(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1A0A34000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Item isBusy, absorbing info from placeHolder", buf, 2u);
}

void __67__FPItemCollection_replacePlaceholders_withActualItems_deletedIDs___block_invoke_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_0_5(&dword_1A0A34000, v0, v1, "[DEBUG] ┏%llx %@: replacing placeholders and sending updates");
  OUTLINED_FUNCTION_3();
}

void __40__FPItemCollection__updateObservedItem___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] updating observed item: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __49__FPItemCollection_forceRefreshOfItemWithItemID___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_41(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] force refresh item %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_receivedBatchWithUpdatedItems:deletedItemsIdentifiers:forceFlush:dropForReplacedPlaceholders:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0(&dword_1A0A34000, v0, v1, "[DEBUG] not observing, ignoring update", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

- (void)_receivedBatchWithUpdatedItems:deletedItemsIdentifiers:forceFlush:dropForReplacedPlaceholders:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;

  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_10_2(&dword_1A0A34000, v0, v1, "[DEBUG] will flush%s for generation %d", v2, v3);
  OUTLINED_FUNCTION_3();
}

- (void)_receivedBatchWithUpdatedItems:deletedItemsIdentifiers:forceFlush:dropForReplacedPlaceholders:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0(&dword_1A0A34000, v0, v1, "[DEBUG] not flushing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

- (void)_receivedBatchWithUpdatedItems:deletedItemsIdentifiers:forceFlush:dropForReplacedPlaceholders:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0(&dword_1A0A34000, v0, v1, "[DEBUG] we need to clear the gathering bit", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

- (void)_receivedBatchWithUpdatedItems:(void *)a1 deletedItemsIdentifiers:(uint8_t *)a2 forceFlush:(_QWORD *)a3 dropForReplacedPlaceholders:(NSObject *)a4 .cold.5(void *a1, uint8_t *a2, _QWORD *a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138412290;
  *a3 = a1;
  OUTLINED_FUNCTION_10(&dword_1A0A34000, a4, (uint64_t)a3, "[DEBUG] Found a stitched item for itemID %@, overriding if needed.", a2);

}

- (void)_receivedBatchWithUpdatedItems:(void *)a1 deletedItemsIdentifiers:(uint64_t)a2 forceFlush:(uint64_t)a3 dropForReplacedPlaceholders:(NSObject *)a4 .cold.6(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  id v7;

  v7 = a1;
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = v7;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  _os_log_debug_impl(&dword_1A0A34000, a4, OS_LOG_TYPE_DEBUG, "[DEBUG] Found stitched child items of (%@): %@", (uint8_t *)a3, 0x16u);

}

void __40__FPItemCollection__flushPendingUpdates__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0(&dword_1A0A34000, v0, v1, "[DEBUG] data should be reloaded", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

void __40__FPItemCollection__flushPendingUpdates__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0(&dword_1A0A34000, v0, v1, "[DEBUG] notify delegate of changes", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

void __40__FPItemCollection__flushPendingUpdates__block_invoke_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_0_5(&dword_1A0A34000, v0, v1, "[DEBUG] ┳%llx exchange future state with current one for %@");
  OUTLINED_FUNCTION_3();
}

void __40__FPItemCollection__flushPendingUpdates__block_invoke_171_cold_1(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = *a1;
  v7 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)a2 + 8) + 40), "count");
  v8 = objc_msgSend(*(id *)(*a1 + 24), "count");
  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a2 + 8) + 40);
  v10 = *(_QWORD *)(*a1 + 24);
  v11 = 138413314;
  v12 = v6;
  v13 = 1024;
  v14 = v7;
  v15 = 1024;
  v16 = v8;
  v17 = 2112;
  v18 = v9;
  v19 = 2112;
  v20 = v10;
  _os_log_debug_impl(&dword_1A0A34000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] calling delegates for %@ (old count=%d, new count=%d)\nold items: %@\nnew items: %@", (uint8_t *)&v11, 0x2Cu);
}

void __44__FPItemCollection_sendIndexPathBasedDiffs___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_41(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_0_5(&dword_1A0A34000, v0, v1, "[DEBUG] moved %@ to %@");
  OUTLINED_FUNCTION_3();
}

void __44__FPItemCollection_sendIndexPathBasedDiffs___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_41(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] inserted %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __44__FPItemCollection_sendIndexPathBasedDiffs___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_41(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] deleted %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __44__FPItemCollection_sendIndexPathBasedDiffs___block_invoke_186_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] updated %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __43__FPItemCollection_consumeUpdates_deletes___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_41(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] skipping %@ because it's regathering", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __44__FPItemCollection_suspendVendorEnumeration__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] suspended vendor notifications (suspend count:%lu)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __43__FPItemCollection_resumeVendorEnumeration__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] resumed vendor notifications (suspend count:%lu)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __50__FPItemCollection__restartObservationWithReason___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_38();
  _os_log_debug_impl(&dword_1A0A34000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Restarting observation %@ (%@)", v1, 0x16u);
  OUTLINED_FUNCTION_3();
}

@end
