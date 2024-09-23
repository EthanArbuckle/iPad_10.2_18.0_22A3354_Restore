@implementation CKDistributedTimestampStateVector

- (void)_setBackingState:(id)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  id v7;

  v7 = (id)objc_msgSend_mutableCopy(a3, a2, (uint64_t)a3, v3);
  objc_msgSend___setBackingStateNoCopy_(self, v5, (uint64_t)v7, v6);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;

  v4 = (void *)objc_opt_new();
  objc_msgSend_backingVector(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setBackingState_(v4, v9, (uint64_t)v8, v10);

  return v4;
}

- (void)intersectVector:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  id v17;

  v17 = a3;
  objc_msgSend_backingVector(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_backingVector(v17, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_vectorExpansionState(self, v12, v13, v14);
  objc_msgSend_clockVector_intersectVector_withExpansionState_(v7, v16, (uint64_t)v11, v15);

}

- (void)minusVector:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  id v17;

  v17 = a3;
  objc_msgSend_backingVector(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_backingVector(v17, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_vectorExpansionState(self, v12, v13, v14);
  objc_msgSend_clockVector_minusVector_withExpansionState_(v7, v16, (uint64_t)v11, v15);

}

- (void)unionStateVector:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  id v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  unsigned __int16 v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  unsigned __int16 v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  id v105;
  id obj;
  void *v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _BYTE v112[128];
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_backingVector(self, v5, v6, v7);
  v105 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v105);
  objc_msgSend_backingVector(v4, v8, v9, v10);
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  objc_msgSend_backingVector(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_backingVector(v4, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clockVector_checkInvariantsAgainstVector_(v14, v19, (uint64_t)v18, v20);

  v21 = (void *)objc_opt_new();
  v107 = (void *)objc_opt_new();
  objc_msgSend_backingVector(self, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mutableAttributeToSparseVector(v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v107, v34, (uint64_t)v33, v35);

  objc_msgSend_backingVector(v4, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mutableAttributeToSparseVector(v39, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v43, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v107, v48, (uint64_t)v47, v49);

  objc_msgSend_allObjects(v107, v50, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (void *)objc_msgSend_mutableCopy(v53, v54, v55, v56);

  objc_msgSend_sortUsingComparator_(v57, v58, (uint64_t)&unk_1E1F66038, v59);
  v110 = 0u;
  v111 = 0u;
  v108 = 0u;
  v109 = 0u;
  v60 = v57;
  v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v60, v61, (uint64_t)&v108, (uint64_t)v112, 16);
  if (v65)
  {
    v66 = *(_QWORD *)v109;
    do
    {
      v67 = 0;
      do
      {
        if (*(_QWORD *)v109 != v66)
          objc_enumerationMutation(v60);
        v68 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * v67);
        objc_msgSend_backingVector(self, v62, v63, v64, v105);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = objc_msgSend_shortValue(v68, v70, v71, v72);
        objc_msgSend_vectorFilteredByAttribute_(v69, v74, v73, v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_backingVector(v4, v77, v78, v79);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = objc_msgSend_shortValue(v68, v81, v82, v83);
        objc_msgSend_vectorFilteredByAttribute_(v80, v85, v84, v86);
        v87 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_addAllClockValuesFromVector_(v21, v88, (uint64_t)v76, v89);
        objc_msgSend_addAllClockValuesFromVector_(v21, v90, (uint64_t)v87, v91);

        ++v67;
      }
      while (v65 != v67);
      v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v60, v62, (uint64_t)&v108, (uint64_t)v112, 16);
    }
    while (v65);
  }

  objc_msgSend_backingVector(self, v92, v93, v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__swapContentsWithVector_(v95, v96, (uint64_t)v21, v97);

  objc_sync_exit(obj);
  objc_msgSend_backingVector(self, v98, v99, v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clockVector_maintainInvariants(v101, v102, v103, v104);

  objc_sync_exit(v105);
}

- (void)minusStateVector:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t i;
  void *v80;
  unsigned __int16 v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  unsigned __int16 v98;
  const char *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  id v107;
  id obj;
  void *v109;
  id v110;
  void *v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _BYTE v116[128];
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v110 = a3;
  objc_msgSend_backingVector(self, v4, v5, v6);
  v107 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v107);
  objc_msgSend_backingVector(v110, v7, v8, v9);
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  objc_msgSend_backingVector(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_backingVector(v110, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clockVector_checkInvariantsAgainstVector_(v13, v18, (uint64_t)v17, v19);

  objc_msgSend_backingVector(v110, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allSiteIdentifiers(self, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend_vectorExpansionState(self, v28, v29, v30);
  objc_msgSend_clockVector_vectorFillingInImplicitClockValuesUsingSiteIdentifiers_withExpansionState_(v23, v32, (uint64_t)v27, v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v111 = (void *)objc_opt_new();
  objc_msgSend_backingVector(self, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mutableAttributeToSparseVector(v37, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v41, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v111, v46, (uint64_t)v45, v47);

  objc_msgSend_mutableAttributeToSparseVector(v33, v48, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v51, v52, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v111, v56, (uint64_t)v55, v57);

  objc_msgSend_allObjects(v111, v58, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = (void *)objc_msgSend_mutableCopy(v61, v62, v63, v64);

  v109 = v65;
  objc_msgSend_sortUsingComparator_(v65, v66, (uint64_t)&unk_1E1F55A68, v67);
  v68 = (void *)objc_opt_new();
  v114 = 0u;
  v115 = 0u;
  v112 = 0u;
  v113 = 0u;
  objc_msgSend_reverseObjectEnumerator(v65, v69, v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v73, (uint64_t)&v112, (uint64_t)v116, 16);
  if (v77)
  {
    v78 = *(_QWORD *)v113;
    do
    {
      for (i = 0; i != v77; ++i)
      {
        if (*(_QWORD *)v113 != v78)
          objc_enumerationMutation(v72);
        v80 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * i);
        v81 = objc_msgSend_shortValue(v80, v74, v75, v76);
        objc_msgSend_vectorFilteredByAttribute_(v33, v82, v81, v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_vectorWithoutAttributes(v84, v85, v86, v87);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_unionVector_(v68, v89, (uint64_t)v88, v90);

        objc_msgSend_backingVector(self, v91, v92, v93);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = objc_msgSend_shortValue(v80, v95, v96, v97);
        objc_msgSend_minusVector_forAttribute_(v94, v99, (uint64_t)v68, v98);

      }
      v77 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v74, (uint64_t)&v112, (uint64_t)v116, 16);
    }
    while (v77);
  }

  objc_sync_exit(obj);
  objc_msgSend_backingVector(self, v100, v101, v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clockVector_maintainInvariants(v103, v104, v105, v106);

  objc_sync_exit(v107);
}

- (void)intersectStateVector:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  id v69;

  v69 = a3;
  objc_msgSend_backingVector(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  objc_msgSend_backingVector(v69, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v11);
  objc_msgSend_backingVector(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_backingVector(v69, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clockVector_checkInvariantsAgainstVector_(v15, v20, (uint64_t)v19, v21);

  objc_msgSend_backingVector(self, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allSiteIdentifiers(v69, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend_vectorExpansionState(self, v30, v31, v32);
  objc_msgSend_clockVector_vectorFillingInImplicitClockValuesUsingSiteIdentifiers_withExpansionState_(v25, v34, (uint64_t)v29, v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend_mutableCopy(v35, v36, v37, v38);

  objc_msgSend_backingVector(v69, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allSiteIdentifiers(self, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend_vectorExpansionState(self, v48, v49, v50);
  objc_msgSend_clockVector_vectorFillingInImplicitClockValuesUsingSiteIdentifiers_withExpansionState_(v43, v52, (uint64_t)v47, v51);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_intersectAttributedVector_(v39, v54, (uint64_t)v53, v55);
  objc_msgSend_backingVector(self, v56, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__swapContentsWithVector_(v59, v60, (uint64_t)v39, v61);

  objc_sync_exit(v11);
  objc_msgSend_backingVector(self, v62, v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clockVector_maintainInvariants(v65, v66, v67, v68);

  objc_sync_exit(v7);
}

- (void)addClockValuesInIndexSet:(id)a3 forSiteIdentifier:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel_addClockValuesInIndexSet_withClockType_forSiteIdentifier_, a3, 1);
}

- (void)addClockValuesInIndexSet:(id)a3 withClockType:(unsigned __int8)a4 forSiteIdentifier:(id)a5
{
  objc_msgSend_addClockValuesInIndexSet_withClockType_atomState_forSiteIdentifier_(self, a2, (uint64_t)a3, a4, 1, a5);
}

- (void)addClockValuesInIndexSet:(id)a3 withAtomState:(unsigned __int8)a4 forSiteIdentifier:(id)a5
{
  objc_msgSend_addClockValuesInIndexSet_withClockType_atomState_forSiteIdentifier_(self, a2, (uint64_t)a3, 1, a4, a5);
}

- (void)addClockValuesInIndexSet:(id)a3 withClockType:(unsigned __int8)a4 atomState:(unsigned __int8)a5 forSiteIdentifier:(id)a6
{
  int v7;
  uint64_t v8;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;

  v7 = a5;
  v8 = a4;
  v28 = a3;
  v10 = a6;
  objc_msgSend_backingVector(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clockVector_checkInvariantsAgainstClockValues_withSiteIdentifier_ofType_(v14, v15, (uint64_t)v28, (uint64_t)v10, v8);

  objc_msgSend_backingVector(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addClockValuesInIndexSet_withAttribute_forSiteIdentifier_(v19, v20, (uint64_t)v28, __rev16(v8 | (v7 << 8)), v10);

  objc_msgSend_backingVector(self, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clockVector_maintainInvariants(v24, v25, v26, v27);

}

@end
