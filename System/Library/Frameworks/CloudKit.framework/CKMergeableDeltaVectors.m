@implementation CKMergeableDeltaVectors

+ (id)pDistributedTimestampsFromDeltaMetadataVectors:(id)a3
{
  id v3;
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
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  void *v37;

  v3 = a3;
  objc_msgSend_previous(v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_backingVector(v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contents(v3, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_backingVector(v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removals(v3, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_backingVector(v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dependencies(v3, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_backingVector(v31, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pDistributedTimestampsWithPreviousVector_contentsVector_removalsVector_dependenciesVector_(CKMergeableDeltaVectors, v36, (uint64_t)v11, (uint64_t)v19, v27, v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

+ (id)pDistributedTimestampsWithPreviousVector:(id)a3 contentsVector:(id)a4 removalsVector:(id)a5 dependenciesVector:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v69;
  id obj;
  id v71;
  id v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v73 = v9;
  objc_sync_enter(v73);
  v72 = v10;
  objc_sync_enter(v72);
  v71 = v11;
  objc_sync_enter(v71);
  v13 = v12;
  objc_sync_enter(v13);
  v14 = (void *)objc_opt_new();
  objc_msgSend_set(MEMORY[0x1E0C99E20], v15, v16, v17);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  if (v73)
  {
    objc_msgSend_allSiteIdentifiers(v73, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unionSet_(v69, v22, (uint64_t)v21, v23);

  }
  if (v72)
  {
    objc_msgSend_allSiteIdentifiers(v72, v18, v19, v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unionSet_(v69, v25, (uint64_t)v24, v26);

  }
  if (v13)
  {
    objc_msgSend_allSiteIdentifiers(v13, v18, v19, v20);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unionSet_(v69, v28, (uint64_t)v27, v29);

  }
  if (v71)
  {
    objc_msgSend_allSiteIdentifiers(v71, v18, v19, v20);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unionSet_(v69, v31, (uint64_t)v30, v32);

  }
  objc_msgSend_allObjects(v69, v18, v19, v20);
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v33, (uint64_t)&v74, (uint64_t)v78, 16);
  if (v36)
  {
    v37 = *(_QWORD *)v75;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v75 != v37)
          objc_enumerationMutation(obj);
        v39 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * i);
        objc_msgSend_pSiteIdentifierFromSiteIdentifier_(CKDistributedSiteIdentifier, v34, v39, v35);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addSiteIdentifiers_(v14, v41, (uint64_t)v40, v42);
        v43 = (void *)objc_opt_new();
        objc_msgSend_pVersionVectorFromAttributedVector_siteIdentifier_(CKDistributedTimestampAttributedVector, v44, (uint64_t)v73, v39);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setPreviousVector_(v43, v46, (uint64_t)v45, v47);

        objc_msgSend_pVersionVectorFromAttributedVector_siteIdentifier_(CKDistributedTimestampAttributedVector, v48, (uint64_t)v72, v39);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setContentsVector_(v43, v50, (uint64_t)v49, v51);

        objc_msgSend_pVersionVectorFromAttributedVector_siteIdentifier_(CKDistributedTimestampAttributedVector, v52, (uint64_t)v71, v39);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setRemovalsVector_(v43, v54, (uint64_t)v53, v55);

        objc_msgSend_pVersionVectorFromAttributedVector_siteIdentifier_(CKDistributedTimestampAttributedVector, v56, (uint64_t)v13, v39);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setDependenciesVector_(v43, v58, (uint64_t)v57, v59);

        if ((objc_msgSend_hasPreviousVector(v43, v60, v61, v62) & 1) != 0
          || (objc_msgSend_hasContentsVector(v43, v63, v64, v65) & 1) != 0
          || (objc_msgSend_hasRemovalsVector(v43, v63, v66, v65) & 1) != 0
          || objc_msgSend_hasDependenciesVector(v43, v63, v67, v65))
        {
          objc_msgSend_addSiteVersionVectors_(v14, v63, (uint64_t)v43, v65);
        }

      }
      v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v74, (uint64_t)v78, 16);
    }
    while (v36);
  }

  objc_sync_exit(v13);
  objc_sync_exit(v71);

  objc_sync_exit(v72);
  objc_sync_exit(v73);

  return v14;
}

+ (id)deltaMetadataVectorsFromPDistributedTimestamps:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  int v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  int v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  int v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  char v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  CKMergeableDeltaVectors *v75;
  void *v76;
  void *v77;
  void *v78;
  const char *v79;
  void *v80;
  void *v82;
  void *v83;
  void *v84;

  v6 = a3;
  v84 = (void *)objc_opt_new();
  v83 = (void *)objc_opt_new();
  v82 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  if (objc_msgSend_siteIdentifiersCount(v6, v8, v9, v10))
  {
    v14 = 0;
    while (1)
    {
      objc_msgSend_siteVersionVectors(v6, v11, v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v15, v16, v14, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_siteIdentifiers(v6, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v22, v23, v14, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_siteIdentifierFromPSiteIdentifier_(CKDistributedSiteIdentifier, v26, (uint64_t)v25, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend_hasPreviousVector(v18, v29, v30, v31))
      {
        objc_msgSend_backingVector(v84, v32, v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_previousVector(v18, v36, v37, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend_addToAttributedVector_fromPVersionVector_forSiteIdentifier_error_(a1, v40, (uint64_t)v35, (uint64_t)v39, v28, a4);

        if (!v41)
          break;
      }
      if (objc_msgSend_hasContentsVector(v18, v32, v33, v34))
      {
        objc_msgSend_backingVector(v83, v42, v43, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_contentsVector(v18, v46, v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend_addToAttributedVector_fromPVersionVector_forSiteIdentifier_error_(a1, v50, (uint64_t)v45, (uint64_t)v49, v28, a4);

        if (!v51)
          break;
      }
      if (objc_msgSend_hasRemovalsVector(v18, v42, v43, v44))
      {
        objc_msgSend_backingVector(v82, v52, v53, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removalsVector(v18, v56, v57, v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend_addToAttributedVector_fromPVersionVector_forSiteIdentifier_error_(a1, v60, (uint64_t)v55, (uint64_t)v59, v28, a4);

        if (!v61)
          break;
      }
      if (objc_msgSend_hasDependenciesVector(v18, v52, v53, v54))
      {
        objc_msgSend_backingVector(v7, v62, v63, v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_dependenciesVector(v18, v66, v67, v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = objc_msgSend_addToAttributedVector_fromPVersionVector_forSiteIdentifier_error_(a1, v70, (uint64_t)v65, (uint64_t)v69, v28, a4);

        if ((v71 & 1) == 0)
          break;
      }

      if (++v14 >= (unint64_t)objc_msgSend_siteIdentifiersCount(v6, v72, v73, v74))
        goto LABEL_12;
    }

    v80 = 0;
    v77 = v83;
    v76 = v84;
    v78 = v82;
  }
  else
  {
LABEL_12:
    v75 = [CKMergeableDeltaVectors alloc];
    v77 = v83;
    v76 = v84;
    v78 = v82;
    v80 = (void *)objc_msgSend_initWithPreviousVector_contentsVector_removalsVector_dependenciesVector_(v75, v79, (uint64_t)v84, (uint64_t)v83, v82, v7);
  }

  return v80;
}

+ (BOOL)addToAttributedVector:(id)a3 fromPVersionVector:(id)a4 forSiteIdentifier:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  void *v40;
  BOOL v41;
  unint64_t v42;
  unint64_t i;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  int v61;
  id *v62;
  const char *v63;
  uint64_t v64;
  int v65;
  const char *v66;
  void *v67;
  const char *v68;
  id v70;
  id obj;
  unint64_t v72;

  v9 = a3;
  v10 = a4;
  v70 = a5;
  obj = v9;
  objc_sync_enter(obj);
  v14 = objc_msgSend_clockValuesCount(v10, v11, v12, v13);
  if (v14 == objc_msgSend_clockValueLengthsCount(v10, v15, v16, v17))
  {
    v21 = objc_msgSend_stateValuesCount(v10, v18, v19, v20);
    if (v21 == objc_msgSend_stateValueLengthsCount(v10, v22, v23, v24))
      goto LABEL_8;
    v28 = objc_msgSend_stateValuesCount(v10, v25, v26, v27);
    v32 = objc_msgSend_stateValueLengthsCount(v10, v29, v30, v31);
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v33, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("State values count (%ld) not equal to state values lengths count (%ld)"), v28, v32);
  }
  else
  {
    v34 = objc_msgSend_clockValuesCount(v10, v18, v19, v20);
    v38 = objc_msgSend_clockValueLengthsCount(v10, v35, v36, v37);
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v39, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Clock values count (%ld) not equal to clock value lengths count (%ld)"), v34, v38);
  }
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    v41 = 0;
    if (!a6)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_8:
  v42 = 0;
  for (i = 0; i < objc_msgSend_clockValuesCount(v10, v25, v26, v27); ++i)
  {
    v47 = *(_QWORD *)(objc_msgSend_clockValues(v10, v44, v45, v46) + 8 * i);
    v72 = *(_QWORD *)(objc_msgSend_clockValueLengths(v10, v48, v49, v50) + 8 * i) + v47;
    while (v42 < objc_msgSend_stateValuesCount(v10, v51, v52, v53) && v47 < v72)
    {
      v54 = *(unsigned int *)(objc_msgSend_stateValueLengths(v10, v25, v26, v27) + 4 * v42);
      v58 = *(unsigned int *)(objc_msgSend_stateValues(v10, v55, v56, v57) + 4 * v42);
      v61 = objc_msgSend_clockTypeFromPClockTypeAndAtomState_(CKDistributedTimestampAttributedVector, v59, v58, v60);
      v62 = a6;
      v65 = objc_msgSend_atomStateFromPClockTypeAndAtomState_(CKDistributedTimestampAttributedVector, v63, v58, v64);
      objc_msgSend_indexSetWithIndexesInRange_(MEMORY[0x1E0CB36B8], v66, v47, v54);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addClockValuesInIndexSet_withAttribute_forSiteIdentifier_(obj, v68, (uint64_t)v67, __rev16(v61 | (v65 << 8)), v70);

      v47 += v54;
      ++v42;
      a6 = v62;
    }
  }
  v40 = 0;
  v41 = 1;
  if (a6)
LABEL_16:
    *a6 = objc_retainAutorelease(v40);
LABEL_17:

  objc_sync_exit(obj);
  return v41;
}

- (unint64_t)protobufSize
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;

  v3 = objc_alloc_init(MEMORY[0x1E0D82B98]);
  objc_msgSend_pDistributedTimestampsFromDeltaMetadataVectors_(CKMergeableDeltaVectors, v4, (uint64_t)self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeTo_(v6, v7, (uint64_t)v3, v8);
  objc_msgSend_immutableData(v3, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_length(v12, v13, v14, v15);

  return v16;
}

- (CKMergeableDeltaVectors)initWithPreviousStateVector:(id)a3 currentStateVector:(id)a4
{
  id v6;
  id v7;
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
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  id v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  CKMergeableDeltaVectors *v37;

  v6 = a4;
  v7 = a3;
  objc_msgSend_clockVector(v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend_mutableCopy(v11, v12, v13, v14);

  v19 = (void *)objc_msgSend_mutableCopy(v6, v16, v17, v18);
  v23 = (void *)objc_msgSend_mutableCopy(v19, v20, v21, v22);
  if ((objc_msgSend_isGreaterThanOrEqualToVector_(v19, v24, (uint64_t)v15, v25) & 1) == 0)
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v26, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("currentStateVector must be greater than or equal to previousStateVector"));
  v27 = v19;
  objc_msgSend_minusVector_(v27, v28, (uint64_t)v15, v29);
  v30 = v23;
  objc_msgSend_intersectVector_(v30, v31, (uint64_t)v15, v32);
  objc_msgSend_minusStateVector_(v30, v33, (uint64_t)v7, v34);

  v35 = (void *)objc_opt_new();
  v37 = (CKMergeableDeltaVectors *)objc_msgSend_initWithPreviousVector_contentsVector_removalsVector_dependenciesVector_(self, v36, (uint64_t)v15, (uint64_t)v27, v30, v35);

  return v37;
}

- (CKMergeableDeltaVectors)initWithPreviousVector:(id)a3 contentsVector:(id)a4 removalsVector:(id)a5 dependenciesVector:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  void *v15;
  uint64_t *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  CKMergeableDeltaVectors *v20;
  uint64_t v21;
  CKDistributedTimestampStateVector *contents;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  CKDistributedTimestampStateVector *removals;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  CKDistributedTimestampClockVector *previous;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  CKDistributedTimestampClockVector *dependencies;
  char v38;
  id v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  id v52;
  objc_super v53;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v15 = v13;
  v16 = (uint64_t *)MEMORY[0x1E0C99778];
  if (!v10 || !v11 || !v12 || !v13)
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v14, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Vectors must not be nil"));
  v53.receiver = self;
  v53.super_class = (Class)CKMergeableDeltaVectors;
  v20 = -[CKMergeableDeltaVectors init](&v53, sel_init);
  if (v20)
  {
    v21 = objc_msgSend_mutableCopy(v11, v17, v18, v19);
    contents = v20->_contents;
    v20->_contents = (CKDistributedTimestampStateVector *)v21;

    v26 = objc_msgSend_mutableCopy(v12, v23, v24, v25);
    removals = v20->_removals;
    v20->_removals = (CKDistributedTimestampStateVector *)v26;

    v31 = objc_msgSend_mutableCopy(v10, v28, v29, v30);
    previous = v20->_previous;
    v20->_previous = (CKDistributedTimestampClockVector *)v31;

    v36 = objc_msgSend_mutableCopy(v15, v33, v34, v35);
    dependencies = v20->_dependencies;
    v20->_dependencies = (CKDistributedTimestampClockVector *)v36;

  }
  v52 = 0;
  v38 = objc_msgSend__validate_(v20, v17, (uint64_t)&v52, v19);
  v39 = v52;
  v43 = v39;
  if ((v38 & 1) == 0)
  {
    v44 = (void *)MEMORY[0x1E0C99DA0];
    v45 = *v16;
    objc_msgSend_userInfo(v39, v40, v41, v42);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v46, v47, *MEMORY[0x1E0CB2D50], v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v44, v50, v45, (uint64_t)CFSTR("%@"), v49);

  }
  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CKMergeableDeltaVectors *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;

  v4 = [CKMergeableDeltaVectors alloc];
  objc_msgSend_previous(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contents(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removals(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dependencies(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend_initWithPreviousVector_contentsVector_removalsVector_dependenciesVector_(v4, v21, (uint64_t)v8, (uint64_t)v12, v16, v20);

  return v22;
}

+ (id)mergeableDeltaMetadataVectorsByCombiningVectors:(id)a3
{
  id v3;
  CKMergeableDeltaVectors *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const char *v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
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
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  char hasTimestampsNotInVector;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  _BYTE v141[128];
  uint64_t v142;

  v142 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = [CKMergeableDeltaVectors alloc];
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v10 = (void *)objc_msgSend_initWithPreviousVector_contentsVector_removalsVector_dependenciesVector_(v4, v9, (uint64_t)v5, (uint64_t)v6, v7, v8);

  v139 = 0u;
  v140 = 0u;
  v137 = 0u;
  v138 = 0u;
  v11 = v3;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v137, (uint64_t)v141, 16);
  if (v13)
  {
    v17 = v13;
    v18 = *(_QWORD *)v138;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v138 != v18)
          objc_enumerationMutation(v11);
        v20 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * v19);
        objc_msgSend_previous(v10, v14, v15, v16, (_QWORD)v137);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_previous(v20, v22, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_unionVector_(v21, v26, (uint64_t)v25, v27);

        objc_msgSend_contents(v10, v28, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_contents(v20, v32, v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_unionStateVector_(v31, v36, (uint64_t)v35, v37);

        objc_msgSend_removals(v10, v38, v39, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removals(v20, v42, v43, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_unionStateVector_(v41, v46, (uint64_t)v45, v47);

        objc_msgSend_dependencies(v10, v48, v49, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_dependencies(v20, v52, v53, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_unionVector_(v51, v56, (uint64_t)v55, v57);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v137, (uint64_t)v141, 16);
    }
    while (v17);
  }

  objc_msgSend_previous(v10, v58, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contents(v10, v62, v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clockVector(v65, v66, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_minusVector_(v61, v70, (uint64_t)v69, v71);

  objc_msgSend_contents(v10, v72, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = (void *)objc_msgSend_copy(v75, v76, v77, v78);

  objc_msgSend_contents(v10, v80, v81, v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removals(v10, v84, v85, v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unionStateVector_(v83, v88, (uint64_t)v87, v89);

  objc_msgSend_contents(v10, v90, v91, v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clockVector(v79, v94, v95, v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_intersectVector_(v93, v98, (uint64_t)v97, v99);

  objc_msgSend_removals(v10, v100, v101, v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contents(v10, v104, v105, v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clockVector(v107, v108, v109, v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_minusVector_(v103, v112, (uint64_t)v111, v113);

  objc_msgSend_dependencies(v10, v114, v115, v116);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contents(v10, v118, v119, v120);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clockVector(v121, v122, v123, v124);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  hasTimestampsNotInVector = objc_msgSend_hasTimestampsNotInVector_(v117, v126, (uint64_t)v125, v127);

  if ((hasTimestampsNotInVector & 1) == 0)
  {
    objc_msgSend_dependencies(v10, v129, v130, v131);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = (void *)objc_opt_new();
    objc_msgSend_intersectVector_(v132, v134, (uint64_t)v133, v135);

  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  CKMergeableDeltaVectors *v4;
  CKMergeableDeltaVectors *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
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
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  char v37;
  void *v39;

  v4 = (CKMergeableDeltaVectors *)a3;
  if (v4 == self)
  {
    v37 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend_previous(self, v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_previous(v5, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (CKObjectsAreBothNilOrEqual(v9, v13))
      {
        objc_msgSend_contents(self, v14, v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_contents(v5, v18, v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (CKObjectsAreBothNilOrEqual(v17, v21))
        {
          objc_msgSend_removals(self, v22, v23, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removals(v5, v26, v27, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (CKObjectsAreBothNilOrEqual(v25, v29))
          {
            objc_msgSend_dependencies(self, v30, v31, v32);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_dependencies(v5, v33, v34, v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = CKObjectsAreBothNilOrEqual(v39, v36);

          }
          else
          {
            v37 = 0;
          }

        }
        else
        {
          v37 = 0;
        }

      }
      else
      {
        v37 = 0;
      }

    }
    else
    {
      v37 = 0;
    }
  }

  return v37;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;

  objc_msgSend_previous(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  objc_msgSend_contents(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;
  objc_msgSend_removals(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_hash(v21, v22, v23, v24);
  objc_msgSend_dependencies(self, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v17 ^ v25 ^ objc_msgSend_hash(v29, v30, v31, v32);

  return v33;
}

- (BOOL)_validate:(id *)a3
{
  uint64_t v3;
  void *v6;
  int isGreaterThanOrEqualToVector;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  _BOOL4 v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v63;
  int v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;

  objc_msgSend_previous(self, a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  isGreaterThanOrEqualToVector = 1;
  objc_msgSend_vectorFilteredByClockType_(v6, v8, 1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_contents(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vectorFilteredByClockType_(v14, v15, 1, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)objc_msgSend_mutableCopy(v10, v18, v19, v20);
  objc_msgSend_clockVector(v17, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_intersectVector_(v21, v26, (uint64_t)v25, v27);

  v31 = objc_msgSend_timestampCount(v21, v28, v29, v30);
  objc_msgSend_previous(self, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vectorFilteredByClockType_(v35, v36, 2, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_contents(self, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vectorFilteredByClockType_(v42, v43, 2, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v31)
  {
    if (!objc_msgSend_timestampCount(v38, v46, v47, v48) || !objc_msgSend_timestampCount(v45, v50, v51, v52))
    {
      LOBYTE(isGreaterThanOrEqualToVector) = 0;
      v49 = a3 == 0;
      goto LABEL_9;
    }
    objc_msgSend_clockVector(v45, v53, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    isGreaterThanOrEqualToVector = objc_msgSend_isGreaterThanOrEqualToVector_(v38, v57, (uint64_t)v56, v58);

  }
  v49 = a3 == 0;
  if (a3 && isGreaterThanOrEqualToVector)
  {
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v46, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("previousVector and contentsVector must not overlap (intesection is %@)"), v21);
    v49 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:

  if ((isGreaterThanOrEqualToVector & 1) != 0)
    return 0;
  objc_msgSend_contents(self, v59, v60, v61);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 1;
  objc_msgSend_vectorFilteredByClockType_(v63, v65, 1, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_removals(self, v68, v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vectorFilteredByClockType_(v71, v72, 1, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  v78 = (void *)objc_msgSend_mutableCopy(v67, v75, v76, v77);
  objc_msgSend_clockVector(v74, v79, v80, v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_intersectVector_(v78, v83, (uint64_t)v82, v84);

  v88 = objc_msgSend_timestampCount(v78, v85, v86, v87);
  objc_msgSend_contents(self, v89, v90, v91);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vectorFilteredByClockType_(v92, v93, 2, v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_removals(self, v96, v97, v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vectorFilteredByClockType_(v99, v100, 2, v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  if (v88)
    goto LABEL_15;
  if (objc_msgSend_timestampCount(v102, v103, v104, v105) && objc_msgSend_timestampCount(v95, v106, v107, v108))
  {
    objc_msgSend_clockVector(v95, v109, v110, v111);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend_isGreaterThanOrEqualToVector_(v102, v113, (uint64_t)v112, v114);

LABEL_15:
    if (((v49 | v64 ^ 1) & 1) == 0)
    {
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v103, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("contentsVector and removalsVector must not overlap (intesection is %@)"), v78);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_18;
  }
  LOBYTE(v64) = 0;
LABEL_18:

  return v64 ^ 1;
}

- (id)descriptionWithStringSiteIdentifiers:(BOOL)a3 usingSuperscripts:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;

  v4 = a4;
  v5 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend_appendString_(v7, v8, (uint64_t)CFSTR("{\n"), v9);
  objc_msgSend_previous(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_descriptionWithStringSiteIdentifiers_usingSuperscripts_(v13, v14, v5, v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v7, v16, (uint64_t)CFSTR("  Previous: %@\n"), v17, v15);

  objc_msgSend_contents(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_descriptionWithStringSiteIdentifiers_usingSuperscripts_(v21, v22, v5, v4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v7, v24, (uint64_t)CFSTR("  Contents: %@\n"), v25, v23);

  objc_msgSend_removals(self, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_descriptionWithStringSiteIdentifiers_usingSuperscripts_(v29, v30, v5, v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v7, v32, (uint64_t)CFSTR("  Removals: %@\n"), v33, v31);

  objc_msgSend_dependencies(self, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_descriptionWithStringSiteIdentifiers_usingSuperscripts_(v37, v38, v5, v4);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v7, v40, (uint64_t)CFSTR("  Dependencies: %@\n"), v41, v39);

  objc_msgSend_appendString_(v7, v42, (uint64_t)CFSTR("}"), v43);
  return v7;
}

- (id)description
{
  return (id)objc_msgSend_descriptionWithStringSiteIdentifiers_usingSuperscripts_(self, a2, 0, 0);
}

- (id)debugDescription
{
  return (id)objc_msgSend_descriptionWithStringSiteIdentifiers_usingSuperscripts_(self, a2, 1, 1);
}

- (CKDistributedTimestampClockVector)previous
{
  return self->_previous;
}

- (CKDistributedTimestampStateVector)contents
{
  return self->_contents;
}

- (CKDistributedTimestampStateVector)removals
{
  return self->_removals;
}

- (CKDistributedTimestampClockVector)dependencies
{
  return self->_dependencies;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dependencies, 0);
  objc_storeStrong((id *)&self->_removals, 0);
  objc_storeStrong((id *)&self->_contents, 0);
  objc_storeStrong((id *)&self->_previous, 0);
}

@end
