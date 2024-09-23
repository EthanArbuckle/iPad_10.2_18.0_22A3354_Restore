@implementation PKMathRecognitionController

- (PKMathRecognitionController)init
{
  PKMathRecognitionController *v2;
  PKMathRecognitionController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKMathRecognitionController;
  v2 = -[PKMathRecognitionController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PKMathRecognitionController reset](v2, "reset");
  return v3;
}

- (PKMathRecognitionController)initWithDelegate:(id)a3
{
  id v4;
  PKMathRecognitionController *v5;
  PKMathRecognitionController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKMathRecognitionController;
  v5 = -[PKMathRecognitionController init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PKMathRecognitionController reset](v5, "reset");
    -[PKMathRecognitionController setDelegate:](v6, "setDelegate:", v4);
  }

  return v6;
}

- (void)reset
{
  void *v3;
  double v4;
  NSObject *v5;
  double updateItemsDelay;
  NSSet *v7;
  NSSet *currentItems;
  NSDictionary *changeMap;
  NSDictionary *v10;
  NSDictionary *stableIdentifierMap;
  NSDictionary *sortIndexMap;
  NSDictionary *expressionMap;
  NSDictionary *shouldSolveMap;
  NSArray *currentMathRecognitionItems;
  NSArray *delayedItems;
  int v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleForKey:", CFSTR("internalSettings.mathUpdateDelay"));
  self->_updateItemsDelay = v4;

  if (self->_updateItemsDelay == 0.0)
    self->_updateItemsDelay = 0.7;
  v5 = os_log_create("com.apple.pencilkit", "Math");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    updateItemsDelay = self->_updateItemsDelay;
    v17 = 134217984;
    v18 = updateItemsDelay;
    _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_DEFAULT, "Setting up PKMathRecognitionController with update delay: %g", (uint8_t *)&v17, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v7 = (NSSet *)objc_claimAutoreleasedReturnValue();
  currentItems = self->_currentItems;
  self->_currentItems = v7;

  changeMap = self->_changeMap;
  v10 = (NSDictionary *)MEMORY[0x1E0C9AA70];
  self->_changeMap = (NSDictionary *)MEMORY[0x1E0C9AA70];

  stableIdentifierMap = self->_stableIdentifierMap;
  self->_stableIdentifierMap = v10;

  sortIndexMap = self->_sortIndexMap;
  self->_sortIndexMap = v10;

  expressionMap = self->_expressionMap;
  self->_expressionMap = v10;

  shouldSolveMap = self->_shouldSolveMap;
  self->_shouldSolveMap = v10;

  currentMathRecognitionItems = self->_currentMathRecognitionItems;
  self->_currentMathRecognitionItems = (NSArray *)MEMORY[0x1E0C9AA60];

  delayedItems = self->_delayedItems;
  self->_delayedItems = 0;

}

- (void)_foundStrokeGroups:(int)a3 canDelay:
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  id v15;
  void *v16;
  double *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  id v30;
  id *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  char v47;
  NSObject *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  NSObject *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  NSObject *v91;
  uint64_t v92;
  NSObject *v93;
  id v94;
  int v95;
  void *v96;
  void *v97;
  void *v98;
  char v99;
  uint64_t v100;
  void *v101;
  void *v102;
  id obj;
  id obja;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  uint8_t buf[4];
  uint64_t v125;
  __int16 v126;
  _BYTE v127[18];
  __int16 v128;
  void *v129;
  _BYTE v130[128];
  _BYTE v131[128];
  uint64_t v132;

  v132 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v100 = a1;
  if (!a1)
    goto LABEL_66;
  v95 = a3;
  v6 = os_log_create("com.apple.pencilkit", "Math");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v125 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1BE213000, v6, OS_LOG_TYPE_DEFAULT, "Found stroke groups: %lu", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", v100);
  v7 = *(void **)(v100 + 64);
  *(_QWORD *)(v100 + 64) = 0;

  objc_msgSend((id)v100, "delegate");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v5, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v94 = v5;
  v9 = v5;
  v112 = v8;
  v113 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v120, v131, 16);
  v98 = v9;
  if (v113)
  {
    v10 = 0;
    v11 = *(_QWORD *)v121;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v121 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD **)(*((_QWORD *)&v120 + 1) + 8 * v12);
        if (v13)
          v14 = (void *)v13[1];
        else
          v14 = 0;
        v15 = v14;
        objc_msgSend(v15, "mathResult");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v17 = (double *)-[PKMathRecognitionItem initWithStrokeGroupItem:uuid:]((char *)[PKMathRecognitionItem alloc], v13, 0);
          -[PKMathRecognitionItem strokesForIdentifier](v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "count"))
          {
            objc_msgSend(v17, "uuid");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v8, "containsObject:", v19);

            if ((v20 & 1) == 0)
            {
              objc_msgSend(v17, "uuid");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "addObject:", v21);

              if (v17)
                v17[11] = (double)v10;
              objc_msgSend(obj, "addObject:", v17);
LABEL_21:
              ++v10;

              goto LABEL_22;
            }
          }
          else
          {

          }
          v22 = os_log_create("com.apple.pencilkit", "Math");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            -[PKMathRecognitionItem strokesForIdentifier](v17);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "count");
            objc_msgSend(v17, "uuid");
            v110 = v10;
            v25 = v11;
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v8, "containsObject:", v26);
            objc_msgSend(v16, "preferredTranscription");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218499;
            v125 = v24;
            v126 = 1024;
            *(_DWORD *)v127 = v27;
            v9 = v98;
            *(_WORD *)&v127[4] = 2113;
            *(_QWORD *)&v127[6] = v28;
            _os_log_impl(&dword_1BE213000, v22, OS_LOG_TYPE_DEFAULT, "Unable to add a math item. Identifier strokes: %ld, existing: %{BOOL}d, expression: %{private}@", buf, 0x1Cu);

            v8 = v112;
            v11 = v25;
            v10 = v110;

          }
          goto LABEL_21;
        }
LABEL_22:

        ++v12;
      }
      while (v113 != v12);
      v29 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v120, v131, 16);
      v113 = v29;
    }
    while (v29);
  }

  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  v30 = obj;
  v31 = (id *)v100;
  v32 = v102;
  v111 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v116, v130, 16);
  if (!v111)
    goto LABEL_50;
  v105 = *(_QWORD *)v117;
  obja = v30;
  do
  {
    v33 = 0;
    do
    {
      if (*(_QWORD *)v117 != v105)
        objc_enumerationMutation(obja);
      v34 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * v33);
      objc_msgSend(v34, "uuid");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKMathRecognitionItem changeIdentifier]((uint64_t)v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKMathRecognitionItem stableIdentifier]((uint64_t)v34);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v34, "sortIndex");
      objc_msgSend(v38, "numberWithDouble:");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "expression");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v34, "shouldSolveMathFlagIsSet"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v31[1], "containsObject:", v35))
      {
        objc_msgSend(v31[2], "objectForKeyedSubscript:", v35);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v41, "isEqual:", v36))
          goto LABEL_39;
        objc_msgSend(v31[3], "objectForKeyedSubscript:", v35);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v42, "isEqual:", v37) & 1) == 0)
        {

LABEL_39:
LABEL_40:
          v48 = os_log_create("com.apple.pencilkit", "Math");
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v34, "expression");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138477827;
            v125 = (uint64_t)v49;
            _os_log_impl(&dword_1BE213000, v48, OS_LOG_TYPE_DEFAULT, "Expression change detected: %{private}@", buf, 0xCu);

            v31 = (id *)v100;
          }

          objc_msgSend(v101, "addObject:", v35);
          -[PKMathRecognitionItem _tagAsRecentlyUpdated]((uint64_t)v34);
LABEL_43:
          v32 = v102;
          goto LABEL_44;
        }
        objc_msgSend(v31[5], "objectForKeyedSubscript:", v35);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v99 = objc_msgSend(v43, "isEqual:", v39);

        v31 = (id *)v100;
        if ((v99 & 1) == 0)
          goto LABEL_40;
        objc_msgSend(*(id *)(v100 + 32), "objectForKeyedSubscript:", v35);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "isEqual:", v114);

        if ((v45 & 1) == 0)
        {
          v50 = os_log_create("com.apple.pencilkit", "Math");
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v34, "expression");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138477827;
            v125 = (uint64_t)v51;
            _os_log_impl(&dword_1BE213000, v50, OS_LOG_TYPE_DEFAULT, "Sort index changed for: %{private}@", buf, 0xCu);

          }
          objc_msgSend(v101, "addObject:", v35);
          v31 = (id *)v100;
          goto LABEL_43;
        }
        objc_msgSend(*(id *)(v100 + 48), "objectForKeyedSubscript:", v35);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "isEqual:", v40);

        v31 = (id *)v100;
        v32 = v102;
        if ((v47 & 1) == 0)
          objc_msgSend(v97, "addObject:", v35);
      }
LABEL_44:
      objc_msgSend(v112, "addObject:", v35);
      objc_msgSend(v32, "setObject:forKeyedSubscript:", v36, v35);
      objc_msgSend(v109, "setObject:forKeyedSubscript:", v37, v35);
      objc_msgSend(v108, "setObject:forKeyedSubscript:", v114, v35);
      objc_msgSend(v107, "setObject:forKeyedSubscript:", v39, v35);
      objc_msgSend(v106, "setObject:forKeyedSubscript:", v40, v35);

      ++v33;
    }
    while (v111 != v33);
    v30 = obja;
    v52 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v116, v130, 16);
    v111 = v52;
  }
  while (v52);
LABEL_50:

  v53 = (void *)objc_msgSend(v31[1], "mutableCopy");
  objc_msgSend(v53, "minusSet:", v112);
  v54 = (void *)objc_msgSend(v112, "mutableCopy");
  objc_msgSend(v54, "minusSet:", v31[1]);
  v115 = v54;
  if (v95
    && !objc_msgSend(v54, "count")
    && !objc_msgSend(v97, "count")
    && (objc_msgSend(v53, "count") || objc_msgSend(v101, "count")))
  {
    v84 = os_log_create("com.apple.pencilkit", "Math");
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
    {
      v85 = objc_msgSend(v53, "count");
      v86 = objc_msgSend(v101, "count");
      v87 = objc_msgSend(v97, "count");
      *(_DWORD *)buf = 134218752;
      v125 = v85;
      v126 = 2048;
      *(_QWORD *)v127 = v86;
      *(_WORD *)&v127[8] = 2048;
      *(_QWORD *)&v127[10] = v87;
      v128 = 2048;
      v129 = v96;
      _os_log_impl(&dword_1BE213000, v84, OS_LOG_TYPE_DEFAULT, "Delaying items. Removed: %lu, changedItems: %lu, solvingChanged: %lu, delegate: %p", buf, 0x2Au);
    }
    v63 = v53;

    v83 = v98;
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", v100, sel_sendDelayedItems, 0);
    v88 = *(void **)(v100 + 64);
    *(_QWORD *)(v100 + 64) = 0;

    v89 = objc_msgSend(v83, "copy");
    v90 = *(void **)(v100 + 64);
    *(_QWORD *)(v100 + 64) = v89;

    v91 = os_log_create("com.apple.pencilkit", "Math");
    v5 = v94;
    v56 = v109;
    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
    {
      v92 = objc_msgSend(v83, "count");
      *(_DWORD *)buf = 134217984;
      v125 = v92;
      _os_log_impl(&dword_1BE213000, v91, OS_LOG_TYPE_DEFAULT, "Schedule delayed items: %lu", buf, 0xCu);
    }

    objc_msgSend((id)v100, "performSelector:withObject:afterDelay:", sel_sendDelayedItems, 0, *(double *)(v100 + 72));
    v64 = v112;
    v67 = v102;
    v75 = v107;
    v72 = v108;
    v78 = v106;
  }
  else
  {
    if (objc_msgSend(v53, "count") || objc_msgSend(v54, "count") || objc_msgSend(v101, "count"))
    {
      v55 = os_log_create("com.apple.pencilkit", "Math");
      v5 = v94;
      v56 = v109;
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        v57 = objc_msgSend(v53, "count");
        v58 = objc_msgSend(v54, "count");
        v59 = objc_msgSend(v101, "count");
        *(_DWORD *)buf = 134218752;
        v125 = v57;
        v126 = 2048;
        *(_QWORD *)v127 = v58;
        *(_WORD *)&v127[8] = 2048;
        *(_QWORD *)&v127[10] = v59;
        v128 = 2048;
        v129 = v96;
        _os_log_impl(&dword_1BE213000, v55, OS_LOG_TYPE_DEFAULT, "Removed: %lu, newItems: %lu, changedItems: %lu, delegate: %p", buf, 0x2Au);
      }

      v60 = v100;
      objc_msgSend(v96, "mathRecognitionController:didUpdateExpressions:newItems:removedItems:mathItems:", v100, v101, v54, v53, v30);
    }
    else
    {
      v93 = os_log_create("com.apple.pencilkit", "Math");
      v5 = v94;
      v56 = v109;
      if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE213000, v93, OS_LOG_TYPE_DEFAULT, "No change detected", buf, 2u);
      }

      v60 = v100;
    }
    if (objc_msgSend(v97, "count") && (*(_BYTE *)(v60 + 80) & 2) != 0)
    {
      v61 = os_log_create("com.apple.pencilkit", "Math");
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        v62 = objc_msgSend(v97, "count");
        *(_DWORD *)buf = 134217984;
        v125 = v62;
        _os_log_impl(&dword_1BE213000, v61, OS_LOG_TYPE_DEFAULT, "Solving style changed: %lu", buf, 0xCu);
      }

      v60 = v100;
      objc_msgSend(v96, "mathRecognitionController:solveStateChangedForExpressions:mathItems:", v100, v97, v30);
    }
    v63 = v53;
    v64 = v112;
    v65 = objc_msgSend(v112, "copy");
    v66 = *(void **)(v60 + 8);
    *(_QWORD *)(v60 + 8) = v65;

    v67 = v102;
    v68 = objc_msgSend(v102, "copy");
    v69 = *(void **)(v60 + 16);
    *(_QWORD *)(v60 + 16) = v68;

    v70 = objc_msgSend(v56, "copy");
    v71 = *(void **)(v60 + 24);
    *(_QWORD *)(v60 + 24) = v70;

    v72 = v108;
    v73 = objc_msgSend(v108, "copy");
    v74 = *(void **)(v60 + 32);
    *(_QWORD *)(v60 + 32) = v73;

    v75 = v107;
    v76 = objc_msgSend(v107, "copy");
    v77 = *(void **)(v60 + 40);
    *(_QWORD *)(v60 + 40) = v76;

    v78 = v106;
    v79 = objc_msgSend(v106, "copy");
    v80 = *(void **)(v60 + 48);
    *(_QWORD *)(v60 + 48) = v79;

    v81 = objc_msgSend(v30, "copy");
    v82 = v60;
    v83 = *(id *)(v60 + 56);
    *(_QWORD *)(v82 + 56) = v81;
  }

LABEL_66:
}

- (void)_updateExpressionForItem:(void *)a3 expression:
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  if (a1)
  {
    v5 = a3;
    objc_msgSend(a2, "uuid");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v9);

    v7 = objc_msgSend(v6, "copy");
    v8 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v7;

  }
}

- (void)_drawingDidUpdate:(uint64_t)a1
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  _QWORD *v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  uint64_t v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v34 = a2;
  if (a1 && objc_msgSend(*(id *)(a1 + 56), "count") && (*(_BYTE *)(a1 + 80) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    objc_msgSend(v34, "strokes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v40 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          if ((objc_msgSend(v9, "_flags") & 0x20000000000) != 0)
          {
            objc_msgSend(v9, "_strokeUUID");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v10);

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
      }
      while (v6);
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v32 = (_QWORD *)a1;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v12 = *(id *)(a1 + 56);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v36 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j);
          -[PKMathRecognitionItem heroStroke]((_QWORD *)v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18)
          {
            objc_msgSend(v18, "_strokeUUID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v3, "containsObject:", v20);

            if ((_DWORD)v21 != objc_msgSend((id)v17, "shouldSolveMathFlagIsSet"))
            {
              if (v17)
              {
                *(_BYTE *)(v17 + 66) = v21;
                -[PKStrokeGroupItem refreshStrokesInDrawing:](*(id **)(v17 + 8), v34);
              }
              objc_msgSend((id)v17, "uuid");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "addObject:", v22);

            }
          }
          else
          {
            v21 = 0;
          }
          objc_msgSend((id)v17, "uuid");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v21);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v17, "uuid");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v24, v25);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      }
      while (v14);
    }

    if (objc_msgSend(v33, "count"))
    {
      v26 = objc_msgSend(v11, "copy");
      v27 = (void *)v32[6];
      v32[6] = v26;

      v28 = os_log_create("com.apple.pencilkit", "Math");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = objc_msgSend(v33, "count");
        *(_DWORD *)buf = 134217984;
        v44 = v29;
        _os_log_impl(&dword_1BE213000, v28, OS_LOG_TYPE_DEFAULT, "Found %lu groups with updated solve state", buf, 0xCu);
      }

      objc_msgSend(v32, "delegate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v33, "copy");
      objc_msgSend(v30, "mathRecognitionController:solveStateChangedForExpressions:mathItems:", v32, v31, v32[7]);

    }
  }

}

- (void)setDelegate:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  char v7;
  NSUInteger v8;
  NSObject *v9;
  NSUInteger v10;
  void *v11;
  NSSet *currentItems;
  void *v13;
  int v14;
  NSUInteger v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->__sessionManager);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->__sessionManager, v4);
    *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector() & 1;
    v6 = (objc_opt_respondsToSelector() & 1) != 0 ? 2 : 0;
    *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFD | v6;
    v7 = (objc_opt_respondsToSelector() & 1) != 0 ? 4 : 0;
    *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFB | v7;
    if (-[NSSet count](self->_currentItems, "count"))
    {
      v8 = -[NSArray count](self->_currentMathRecognitionItems, "count");
      if (v4)
      {
        if (v8)
        {
          v9 = os_log_create("com.apple.pencilkit", "Math");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            v10 = -[NSSet count](self->_currentItems, "count");
            v14 = 134217984;
            v15 = v10;
            _os_log_impl(&dword_1BE213000, v9, OS_LOG_TYPE_DEFAULT, "Updating new delegate with items: %lu", (uint8_t *)&v14, 0xCu);
          }

          objc_msgSend(MEMORY[0x1E0C99E60], "set");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          currentItems = self->_currentItems;
          objc_msgSend(MEMORY[0x1E0C99E60], "set");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "mathRecognitionController:didUpdateExpressions:newItems:removedItems:mathItems:", self, v11, currentItems, v13, self->_currentMathRecognitionItems);

        }
      }
    }
  }

}

- (void)sendDelayedItems
{
  void *v3;
  double v4;
  double v5;
  double v6;
  NSObject *v7;
  NSArray *delayedItems;
  NSArray *v9;
  NSObject *v10;
  NSUInteger v11;
  double v12;
  int v13;
  double v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!self->_delayedItems)
    goto LABEL_7;
  if ((*(_BYTE *)&self->_delegateFlags & 1) == 0)
    goto LABEL_7;
  -[PKMathRecognitionController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mathRecognitionControllerTimestampForLatestUserInteraction:", self);
  v5 = v4;

  if (v5 <= 0.0)
    goto LABEL_7;
  v6 = CACurrentMediaTime() - v5;
  v7 = os_log_create("com.apple.pencilkit", "Math");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134217984;
    v14 = v6;
    _os_log_impl(&dword_1BE213000, v7, OS_LOG_TYPE_DEFAULT, "Interactive timestamp delta: %g", (uint8_t *)&v13, 0xCu);
  }

  if (v6 < self->_updateItemsDelay)
  {
    v10 = os_log_create("com.apple.pencilkit", "Math");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = -[NSArray count](self->_delayedItems, "count");
      v12 = self->_updateItemsDelay - v6;
      v13 = 134218240;
      v14 = *(double *)&v11;
      v15 = 2048;
      v16 = v12;
      _os_log_impl(&dword_1BE213000, v10, OS_LOG_TYPE_DEFAULT, "Interactive delayed items: %lu, %g", (uint8_t *)&v13, 0x16u);
    }

    -[PKMathRecognitionController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_sendDelayedItems, 0, self->_updateItemsDelay - v6);
  }
  else
  {
LABEL_7:
    delayedItems = self->_delayedItems;
    self->_delayedItems = 0;
    v9 = delayedItems;

    -[PKMathRecognitionController actuallySendDelayedItems:]((uint64_t)self, v9);
  }
}

- (void)actuallySendDelayedItems:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = os_log_create("com.apple.pencilkit", "Math");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 134217984;
      v6 = objc_msgSend(v3, "count");
      _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "Send delayed items: %lu", (uint8_t *)&v5, 0xCu);
    }

    if (objc_msgSend(v3, "count"))
      -[PKMathRecognitionController _foundStrokeGroups:canDelay:](a1, v3, 0);
  }

}

- (BOOL)processDelayedItemsIfNecessary
{
  NSArray *delayedItems;
  NSArray *v4;
  NSArray *v5;

  delayedItems = self->_delayedItems;
  if (delayedItems)
  {
    v4 = delayedItems;
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_sendDelayedItems, 0);
    v5 = self->_delayedItems;
    self->_delayedItems = 0;

    -[PKMathRecognitionController actuallySendDelayedItems:]((uint64_t)self, v4);
  }
  return delayedItems != 0;
}

- (void)didEraseStrokes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  PKMathRecognitionController *v19;
  NSArray *obj;
  void *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_delegateFlags & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v19 = self;
    obj = self->_currentMathRecognitionItems;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v5)
    {
      v6 = v5;
      v22 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v28 != v22)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          objc_msgSend(v8, "strokes", v19);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v24;
            while (2)
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v24 != v12)
                  objc_enumerationMutation(v9);
                objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "_strokeUUID");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = objc_msgSend(v4, "containsObject:", v14);

                if (v15)
                {
                  objc_msgSend(v8, "uuid");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "addObject:", v16);

                  goto LABEL_17;
                }
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
              if (v11)
                continue;
              break;
            }
          }
LABEL_17:

        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v6);
    }

    -[PKMathRecognitionController delegate](v19, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v21, "copy");
    objc_msgSend(v17, "mathRecognitionController:didEraseStrokesInExpressions:", v19, v18);

  }
}

- (PKMathRecognitionControllerDelegate)delegate
{
  return (PKMathRecognitionControllerDelegate *)objc_loadWeakRetained((id *)&self->__sessionManager);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self[1].super.isa);
  objc_destroyWeak((id *)&self->__sessionManager);
  objc_storeStrong((id *)&self->_delayedItems, 0);
  objc_storeStrong((id *)&self->_currentMathRecognitionItems, 0);
  objc_storeStrong((id *)&self->_shouldSolveMap, 0);
  objc_storeStrong((id *)&self->_expressionMap, 0);
  objc_storeStrong((id *)&self->_sortIndexMap, 0);
  objc_storeStrong((id *)&self->_stableIdentifierMap, 0);
  objc_storeStrong((id *)&self->_changeMap, 0);
  objc_storeStrong((id *)&self->_currentItems, 0);
}

@end
