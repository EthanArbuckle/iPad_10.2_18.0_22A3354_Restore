@implementation CHMutableStrokeClassificationResult

- (CHMutableStrokeClassificationResult)init
{
  CHMutableStrokeClassificationResult *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *strokeClassificationsByStrokeIdentifier;
  NSMutableDictionary *v5;
  NSMutableDictionary *scriptClassificationsByStrokeIdentifier;
  NSMutableDictionary *v7;
  NSMutableDictionary *scriptClassificationRawResultsByStrokeIdentifier;
  NSMutableDictionary *v9;
  NSMutableDictionary *substrokesByStrokeIdentifier;
  NSMutableSet *v11;
  NSMutableSet *nontextCandidates;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CHMutableStrokeClassificationResult;
  v2 = -[CHStrokeClassificationResult init](&v14, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    strokeClassificationsByStrokeIdentifier = v2->_strokeClassificationsByStrokeIdentifier;
    v2->_strokeClassificationsByStrokeIdentifier = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    scriptClassificationsByStrokeIdentifier = v2->_scriptClassificationsByStrokeIdentifier;
    v2->_scriptClassificationsByStrokeIdentifier = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    scriptClassificationRawResultsByStrokeIdentifier = v2->_scriptClassificationRawResultsByStrokeIdentifier;
    v2->_scriptClassificationRawResultsByStrokeIdentifier = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    substrokesByStrokeIdentifier = v2->_substrokesByStrokeIdentifier;
    v2->_substrokesByStrokeIdentifier = v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    nontextCandidates = v2->_nontextCandidates;
    v2->_nontextCandidates = v11;

  }
  return v2;
}

- (CHMutableStrokeClassificationResult)initWithStrokeClassificationsByStrokeIdentifier:(id)a3 scriptClassificationsByStrokeIdentifier:(id)a4 scriptClassificationRawResultsByStrokeIdentifier:(id)a5 substrokesByStrokeIdentifier:(id)a6 nontextCandidates:(id)a7
{
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CHMutableStrokeClassificationResult *v19;
  uint64_t v20;
  NSMutableDictionary *strokeClassificationsByStrokeIdentifier;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSMutableDictionary *scriptClassificationsByStrokeIdentifier;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSMutableDictionary *scriptClassificationRawResultsByStrokeIdentifier;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSMutableDictionary *substrokesByStrokeIdentifier;
  id v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSMutableSet *nontextCandidates;
  id v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  NSMutableSet *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v74;
  id v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  objc_super v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v74 = a3;
  v75 = a4;
  v76 = a5;
  v12 = a6;
  v13 = a7;
  v81.receiver = self;
  v81.super_class = (Class)CHMutableStrokeClassificationResult;
  v19 = -[CHStrokeClassificationResult init](&v81, sel_init);
  if (v19)
  {
    v20 = objc_msgSend_mutableCopy(v74, v14, v15, v16, v17, v18);
    strokeClassificationsByStrokeIdentifier = v19->_strokeClassificationsByStrokeIdentifier;
    v19->_strokeClassificationsByStrokeIdentifier = (NSMutableDictionary *)v20;

    v27 = objc_msgSend_mutableCopy(v75, v22, v23, v24, v25, v26);
    scriptClassificationsByStrokeIdentifier = v19->_scriptClassificationsByStrokeIdentifier;
    v19->_scriptClassificationsByStrokeIdentifier = (NSMutableDictionary *)v27;

    v34 = objc_msgSend_mutableCopy(v76, v29, v30, v31, v32, v33);
    scriptClassificationRawResultsByStrokeIdentifier = v19->_scriptClassificationRawResultsByStrokeIdentifier;
    v19->_scriptClassificationRawResultsByStrokeIdentifier = (NSMutableDictionary *)v34;

    v41 = objc_msgSend_mutableCopy(v12, v36, v37, v38, v39, v40);
    substrokesByStrokeIdentifier = v19->_substrokesByStrokeIdentifier;
    v19->_substrokesByStrokeIdentifier = (NSMutableDictionary *)v41;

    v43 = objc_alloc(MEMORY[0x1E0C99E20]);
    v49 = objc_msgSend_count(v13, v44, v45, v46, v47, v48);
    v54 = objc_msgSend_initWithCapacity_(v43, v50, v49, v51, v52, v53);
    nontextCandidates = v19->_nontextCandidates;
    v19->_nontextCandidates = (NSMutableSet *)v54;

    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v56 = v13;
    v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v56, v57, (uint64_t)&v77, (uint64_t)v82, 16, v58);
    if (v64)
    {
      v65 = *(_QWORD *)v78;
      do
      {
        v66 = 0;
        do
        {
          if (*(_QWORD *)v78 != v65)
            objc_enumerationMutation(v56);
          v67 = v19->_nontextCandidates;
          v68 = (void *)objc_msgSend_mutableCopy(*(void **)(*((_QWORD *)&v77 + 1) + 8 * v66), v59, v60, v61, v62, v63);
          objc_msgSend_addObject_(v67, v69, (uint64_t)v68, v70, v71, v72);

          ++v66;
        }
        while (v64 != v66);
        v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v56, v59, (uint64_t)&v77, (uint64_t)v82, 16, v63);
      }
      while (v64);
    }

  }
  return v19;
}

- (void)updateNonTextCandidatesByRemovingSupportFromStrokeIdentifier:(id)a3 skippingCandidatesWithStrokeIdentifier:(id)a4
{
  id v6;
  id v7;
  NSMutableSet *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int isEqual;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  NSMutableDictionary *strokeClassificationsByStrokeIdentifier;
  void *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  CHMutableStrokeClassificationResult *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v59 = 88;
  v60 = self;
  v8 = self->_nontextCandidates;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v61, (uint64_t)v65, 16, v10);
  if (!v16)
  {

    v17 = 0;
    goto LABEL_17;
  }
  v17 = 0;
  v18 = *(_QWORD *)v62;
  do
  {
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v62 != v18)
        objc_enumerationMutation(v8);
      v21 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
      objc_msgSend_strokeIdentifier(v21, v11, v12, v13, v14, v15, v59);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v22, v23, (uint64_t)v6, v24, v25, v26);

      if (isEqual)
      {
        v20 = v17;
        v17 = v21;
LABEL_5:

        continue;
      }
      objc_msgSend_strokeIdentifier(v21, v28, v29, v30, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend_containsObject_(v7, v34, (uint64_t)v33, v35, v36, v37);

      if ((v38 & 1) == 0
        && objc_msgSend_adjustSupportByRemovingStrokeIdentifier_(v21, v11, (uint64_t)v6, v13, v14, v15))
      {
        strokeClassificationsByStrokeIdentifier = v60->_strokeClassificationsByStrokeIdentifier;
        v40 = (void *)MEMORY[0x1E0CB37E8];
        v41 = objc_msgSend_effectiveClassification(v21, v11, v12, v13, v14, v15);
        objc_msgSend_numberWithInteger_(v40, v42, v41, v43, v44, v45);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_strokeIdentifier(v21, v46, v47, v48, v49, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(strokeClassificationsByStrokeIdentifier, v52, (uint64_t)v20, (uint64_t)v51, v53, v54);

        goto LABEL_5;
      }
    }
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v61, (uint64_t)v65, 16, v15);
  }
  while (v16);

  if (v17)
    objc_msgSend_removeObject_(*(void **)((char *)&v60->super.super.isa + v59), v55, (uint64_t)v17, v56, v57, v58);
LABEL_17:

}

- (void)updateByRemovingStrokeIdentifier:(id)a3 withRemovedAndClutterStrokeIDs:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;

  v26 = a3;
  v6 = a4;
  objc_msgSend_removeObjectForKey_(self->_strokeClassificationsByStrokeIdentifier, v7, (uint64_t)v26, v8, v9, v10);
  objc_msgSend_removeObjectForKey_(self->_scriptClassificationsByStrokeIdentifier, v11, (uint64_t)v26, v12, v13, v14);
  objc_msgSend_removeObjectForKey_(self->_scriptClassificationRawResultsByStrokeIdentifier, v15, (uint64_t)v26, v16, v17, v18);
  objc_msgSend_removeObjectForKey_(self->_substrokesByStrokeIdentifier, v19, (uint64_t)v26, v20, v21, v22);
  objc_msgSend_updateNonTextCandidatesByRemovingSupportFromStrokeIdentifier_skippingCandidatesWithStrokeIdentifier_(self, v23, (uint64_t)v26, (uint64_t)v6, v24, v25);

}

- (void)updateByTransitionedClutterStrokeIdentifier:(id)a3 withRemovedAndClutterStrokeIDs:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v17 = a3;
  v6 = a4;
  objc_msgSend_removeObjectForKey_(self->_substrokesByStrokeIdentifier, v7, (uint64_t)v17, v8, v9, v10);
  objc_msgSend_updateNonTextCandidatesByRemovingSupportFromStrokeIdentifier_skippingCandidatesWithStrokeIdentifier_(self, v11, (uint64_t)v17, (uint64_t)v6, v12, v13);
  objc_msgSend_setObject_forKey_(self->_strokeClassificationsByStrokeIdentifier, v14, (uint64_t)&unk_1E7829390, (uint64_t)v17, v15, v16);

}

- (void)updateByAddingNonClutterStroke:(id)a3 withAllStrokes:(id)a4 forceClass:(int64_t)a5
{
  id v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableDictionary *substrokesByStrokeIdentifier;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  NSMutableDictionary *strokeClassificationsByStrokeIdentifier;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char isEqual;
  NSMutableDictionary *v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  id v109;
  void *v110;
  void *v111;
  id obj;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _BYTE v117[128];
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v109 = a4;
  v111 = v8;
  v9 = (void *)objc_opt_class();
  objc_msgSend_substrokesForStroke_(v9, v10, (uint64_t)v8, v11, v12, v13);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  substrokesByStrokeIdentifier = self->_substrokesByStrokeIdentifier;
  objc_msgSend_encodedStrokeIdentifier(v8, v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(substrokesByStrokeIdentifier, v21, (uint64_t)v110, (uint64_t)v20, v22, v23);

  v29 = &OBJC_IVAR___CHTransformedTextSegment__textStrokes;
  if (!a5)
  {
    if ((objc_msgSend_strokeAttributes(v8, v24, v25, v26, v27, v28) & 2) != 0)
    {
      a5 = 5;
    }
    else
    {
      v30 = (void *)objc_opt_class();
      objc_msgSend_nonTextCandidateForStroke_withSubstrokes_(v30, v31, (uint64_t)v8, (uint64_t)v110, v32, v33);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (v38)
      {
        objc_msgSend_addObject_(self->_nontextCandidates, v34, (uint64_t)v38, v35, v36, v37);
        v115 = 0u;
        v116 = 0u;
        v113 = 0u;
        v114 = 0u;
        obj = v109;
        v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v39, (uint64_t)&v113, (uint64_t)v117, 16, v40);
        if (v46)
        {
          v47 = *(_QWORD *)v114;
          do
          {
            for (i = 0; i != v46; ++i)
            {
              if (*(_QWORD *)v114 != v47)
                objc_enumerationMutation(obj);
              v49 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * i);
              strokeClassificationsByStrokeIdentifier = self->_strokeClassificationsByStrokeIdentifier;
              objc_msgSend_encodedStrokeIdentifier(v49, v41, v42, v43, v44, v45);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKey_(strokeClassificationsByStrokeIdentifier, v52, (uint64_t)v51, v53, v54, v55);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v62 = objc_msgSend_unsignedIntegerValue(v56, v57, v58, v59, v60, v61);

              objc_msgSend_encodedStrokeIdentifier(v49, v63, v64, v65, v66, v67);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_strokeIdentifier(v38, v69, v70, v71, v72, v73);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              isEqual = objc_msgSend_isEqual_(v68, v75, (uint64_t)v74, v76, v77, v78);

              if ((isEqual & 1) == 0)
              {
                v80 = self->_substrokesByStrokeIdentifier;
                objc_msgSend_encodedStrokeIdentifier(v49, v41, v42, v43, v44, v45);
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKey_(v80, v82, (uint64_t)v81, v83, v84, v85);
                v86 = (void *)objc_claimAutoreleasedReturnValue();

                if (v86)
                  objc_msgSend_adjustSupportByAddingStroke_consistingOfSubstrokes_strokeClassification_(v38, v87, (uint64_t)v49, (uint64_t)v86, v62, v88);

              }
            }
            v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v41, (uint64_t)&v113, (uint64_t)v117, 16, v45);
          }
          while (v46);
        }

        a5 = objc_msgSend_effectiveClassification(v38, v89, v90, v91, v92, v93);
      }
      else
      {
        a5 = 1;
      }

    }
    v29 = &OBJC_IVAR___CHTransformedTextSegment__textStrokes;
  }
  v94 = *(Class *)((char *)&self->super.super.isa + v29[446]);
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v24, a5, v26, v27, v28);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodedStrokeIdentifier(v111, v96, v97, v98, v99, v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v94, v102, (uint64_t)v95, (uint64_t)v101, v103, v104);

  objc_msgSend_updateNonTextCandidatesSupportFromStroke_(self, v105, (uint64_t)v111, v106, v107, v108);
}

- (void)updateNonTextCandidatesSupportFromStroke:(id)a3
{
  id v4;
  NSMutableDictionary *strokeClassificationsByStrokeIdentifier;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char isEqual;
  NSMutableDictionary *substrokesByStrokeIdentifier;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSMutableDictionary *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  NSMutableDictionary *v74;
  void *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  NSMutableSet *obj;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  strokeClassificationsByStrokeIdentifier = self->_strokeClassificationsByStrokeIdentifier;
  objc_msgSend_encodedStrokeIdentifier(v4, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(strokeClassificationsByStrokeIdentifier, v12, (uint64_t)v11, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = objc_msgSend_unsignedIntegerValue(v16, v17, v18, v19, v20, v21);

  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  obj = self->_nontextCandidates;
  v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v93, (uint64_t)v97, 16, v23);
  if (v29)
  {
    v30 = *(_QWORD *)v94;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v94 != v30)
          objc_enumerationMutation(obj);
        v32 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
        objc_msgSend_encodedStrokeIdentifier(v4, v24, v25, v26, v27, v28);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_strokeIdentifier(v32, v34, v35, v36, v37, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v33, v40, (uint64_t)v39, v41, v42, v43);

        if ((isEqual & 1) == 0)
        {
          substrokesByStrokeIdentifier = self->_substrokesByStrokeIdentifier;
          objc_msgSend_encodedStrokeIdentifier(v4, v24, v25, v26, v27, v28);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKey_(substrokesByStrokeIdentifier, v47, (uint64_t)v46, v48, v49, v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v51)
          {
            v54 = (void *)objc_opt_class();
            objc_msgSend_substrokesForStroke_(v54, v55, (uint64_t)v4, v56, v57, v58);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = self->_substrokesByStrokeIdentifier;
            objc_msgSend_encodedStrokeIdentifier(v4, v60, v61, v62, v63, v64);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKey_(v59, v66, (uint64_t)v51, (uint64_t)v65, v67, v68);

          }
          if (objc_msgSend_adjustSupportByAddingStroke_consistingOfSubstrokes_strokeClassification_(v32, v52, (uint64_t)v4, (uint64_t)v51, v91, v53))
          {
            v74 = self->_strokeClassificationsByStrokeIdentifier;
            v75 = (void *)MEMORY[0x1E0CB37E8];
            v76 = objc_msgSend_effectiveClassification(v32, v69, v70, v71, v72, v73);
            objc_msgSend_numberWithInteger_(v75, v77, v76, v78, v79, v80);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_strokeIdentifier(v32, v82, v83, v84, v85, v86);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKey_(v74, v88, (uint64_t)v81, (uint64_t)v87, v89, v90);

          }
        }
      }
      v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v24, (uint64_t)&v93, (uint64_t)v97, 16, v28);
    }
    while (v29);
  }

}

- (id)strokeClassificationsByStrokeIdentifier
{
  return self->_strokeClassificationsByStrokeIdentifier;
}

- (id)scriptClassificationsByStrokeIdentifier
{
  return self->_scriptClassificationsByStrokeIdentifier;
}

- (id)scriptClassificationRawResultsByStrokeIdentifier
{
  return self->_scriptClassificationRawResultsByStrokeIdentifier;
}

- (id)substrokesByStrokeIdentifier
{
  return self->_substrokesByStrokeIdentifier;
}

- (id)nontextCandidates
{
  return self->_nontextCandidates;
}

- (void)updateByAddingClutterStroke:(id)a3
{
  id v4;
  NSMutableDictionary *strokeClassificationsByStrokeIdentifier;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableDictionary *scriptClassificationsByStrokeIdentifier;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  CHScriptClassificationRawResult *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  NSMutableDictionary *scriptClassificationRawResultsByStrokeIdentifier;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;

  v4 = a3;
  strokeClassificationsByStrokeIdentifier = self->_strokeClassificationsByStrokeIdentifier;
  v47 = v4;
  objc_msgSend_encodedStrokeIdentifier(v4, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(strokeClassificationsByStrokeIdentifier, v12, (uint64_t)&unk_1E7829390, (uint64_t)v11, v13, v14);

  scriptClassificationsByStrokeIdentifier = self->_scriptClassificationsByStrokeIdentifier;
  objc_msgSend_encodedStrokeIdentifier(v47, v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(scriptClassificationsByStrokeIdentifier, v22, (uint64_t)&unk_1E7829390, (uint64_t)v21, v23, v24);

  objc_msgSend_defaultScriptClassificationDictionary(CHStrokeUtilities, v25, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = [CHScriptClassificationRawResult alloc];
  v36 = (void *)objc_msgSend_initWithProbabilityByScriptClassifications_(v31, v32, (uint64_t)v30, v33, v34, v35);
  scriptClassificationRawResultsByStrokeIdentifier = self->_scriptClassificationRawResultsByStrokeIdentifier;
  objc_msgSend_encodedStrokeIdentifier(v47, v38, v39, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(scriptClassificationRawResultsByStrokeIdentifier, v44, (uint64_t)v36, (uint64_t)v43, v45, v46);

}

- (id)copyWithZone:(_NSZone *)a3
{
  CHStrokeClassificationResult *v4;
  const char *v5;

  v4 = [CHStrokeClassificationResult alloc];
  return (id)objc_msgSend_initWithStrokeClassificationsByStrokeIdentifier_scriptClassificationsByStrokeIdentifier_scriptClassificationRawResultsByStrokeIdentifier_substrokesByStrokeIdentifier_nontextCandidates_(v4, v5, (uint64_t)self->_strokeClassificationsByStrokeIdentifier, (uint64_t)self->_scriptClassificationsByStrokeIdentifier, (uint64_t)self->_scriptClassificationRawResultsByStrokeIdentifier, (uint64_t)self->_substrokesByStrokeIdentifier, self->_nontextCandidates);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nontextCandidates, 0);
  objc_storeStrong((id *)&self->_substrokesByStrokeIdentifier, 0);
  objc_storeStrong((id *)&self->_scriptClassificationRawResultsByStrokeIdentifier, 0);
  objc_storeStrong((id *)&self->_scriptClassificationsByStrokeIdentifier, 0);
  objc_storeStrong((id *)&self->_strokeClassificationsByStrokeIdentifier, 0);
}

@end
