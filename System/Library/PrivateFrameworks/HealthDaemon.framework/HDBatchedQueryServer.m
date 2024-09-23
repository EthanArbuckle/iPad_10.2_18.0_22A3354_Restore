@implementation HDBatchedQueryServer

- (int64_t)batchObjectsWithEnumerator:(id)a3 error:(id *)a4 handler:(id)a5
{
  id v8;
  id v9;
  int64_t v10;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__HDBatchedQueryServer_batchObjectsWithEnumerator_error_handler___block_invoke;
  v12[3] = &unk_1E6D099E8;
  v13 = v8;
  v9 = v8;
  v10 = -[HDBatchedQueryServer batchObjectsWithEnumerator:includeDeletedObjects:error:batchHandler:](self, "batchObjectsWithEnumerator:includeDeletedObjects:error:batchHandler:", a3, 0, a4, v12);

  return v10;
}

- (int64_t)batchObjectsWithEnumerator:(id)a3 includeDeletedObjects:(BOOL)a4 error:(id *)a5 batchHandler:(id)a6
{
  _BOOL8 v8;
  id v11;
  void (*v12)(uint64_t);
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  _BOOL8 v35;
  void *v36;
  uint64_t v37;
  id v38;
  int64_t v39;
  void *v41;
  void *v42;
  id *v43;
  void *v44;
  SEL v45;
  _QWORD v46[5];
  id v47;
  id v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t *v52;
  _QWORD *v53;
  SEL v54;
  BOOL v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  uint64_t aBlock;
  uint64_t p_aBlock;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  _QWORD v76[5];
  id v77;
  id v78;
  _QWORD *v79;
  _QWORD v80[5];

  v8 = a4;
  v11 = a3;
  v12 = (void (*)(uint64_t))a6;
  v45 = a2;
  if (self)
  {
    -[HDQueryServer client](self, "client");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sourceBundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v14, "hasPrefix:", CFSTR("com.appleinternal.health.Lime.")) & 1) != 0)
      v15 = 0;
    else
      v15 = objc_msgSend(v14, "hasPrefix:", CFSTR("com.apple.Research.")) ^ 1;
    -[HDQueryServer sampleType](self, "sampleType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6680], "electrocardiogramType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v16, "isEqual:", v17) || v15)
    {

    }
    else
    {
      v43 = a5;
      v18 = v11;
      v19 = v8;
      -[HDQueryServer client](self, "client");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "configuration");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "applicationSDKVersionToken");
      v22 = dyld_version_token_at_least();

      if ((v22 & 1) == 0)
      {
        aBlock = MEMORY[0x1E0C809B0];
        p_aBlock = 3221225472;
        v72 = (uint64_t)__68__HDBatchedQueryServer__processBatchHandlerForResearchAppECGAccess___block_invoke;
        v73 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6D099E8;
        v74 = v12;
        v12 = (void (*)(uint64_t))_Block_copy(&aBlock);

      }
      v8 = v19;
      v11 = v18;
      a5 = v43;
    }
    v23 = _Block_copy(v12);

  }
  else
  {
    v23 = 0;
  }

  -[HDQueryServer sampleType](self, "sampleType");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    -[HDQueryServer readAuthorizationStatusForType:error:](self, "readAuthorizationStatusForType:error:", v24, a5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      if (objc_msgSend(v25, "canRead"))
      {
        objc_msgSend(v26, "restrictedSourceEntities");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setRestrictedSourceEntities:", v27);

        if (v8)
        {
          objc_msgSend(v26, "restrictedBundleIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v28)
          {
            objc_msgSend(v26, "deletedObjectBaselineAnchor");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setDeletedObjectsAnchor:", v29);

          }
        }
        v30 = _Block_copy(self->_unitTest_queryServerWillSendBatchHandler);
        v31 = _Block_copy(self->_unitTest_queryServerObjectEnumerationHandler);
        v80[0] = 0;
        v80[1] = v80;
        v80[2] = 0x2020000000;
        v80[3] = 0;
        v41 = v30;
        v44 = v31;
        if (v30)
        {
          v76[0] = MEMORY[0x1E0C809B0];
          v76[1] = 3221225472;
          v76[2] = __92__HDBatchedQueryServer_batchObjectsWithEnumerator_includeDeletedObjects_error_batchHandler___block_invoke;
          v76[3] = &unk_1E6D09A10;
          v32 = v30;
          v76[4] = self;
          v77 = v32;
          v78 = v23;
          v79 = v80;
          v23 = _Block_copy(v76);

        }
        aBlock = 0;
        p_aBlock = (uint64_t)&aBlock;
        v72 = 0x3032000000;
        v73 = __Block_byref_object_copy__163;
        v74 = __Block_byref_object_dispose__163;
        v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 200);
        v34 = 0;
        v75 = v33;
        v64 = 0;
        v65 = &v64;
        v66 = 0x3032000000;
        v67 = __Block_byref_object_copy__163;
        v68 = __Block_byref_object_dispose__163;
        if (v8)
          v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 200, v30, v44);
        v35 = v8;
        v69 = v34;
        v60 = 0;
        v61 = &v60;
        v62 = 0x2020000000;
        v63 = 0;
        v56 = 0;
        v57 = &v56;
        v58 = 0x2020000000;
        v59 = 0;
        objc_msgSend(v11, "anchor", v41);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "longLongValue");

        v59 = v37;
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __92__HDBatchedQueryServer_batchObjectsWithEnumerator_includeDeletedObjects_error_batchHandler___block_invoke_187;
        v46[3] = &unk_1E6D09A38;
        v46[4] = self;
        v49 = &aBlock;
        v50 = &v60;
        v51 = &v64;
        v55 = v35;
        v54 = v45;
        v23 = v23;
        v47 = v23;
        v52 = &v56;
        v53 = v80;
        v38 = v44;
        v48 = v38;
        if ((objc_msgSend(v11, "enumerateIncludingDeletedObjects:error:handler:", v35, a5, v46) & 1) != 0)
        {
          if (-[HDQueryServer _shouldStopProcessingQuery](self, "_shouldStopProcessingQuery"))
          {
            v39 = 4;
          }
          else if (*((_BYTE *)v61 + 24))
          {
            v39 = 3;
          }
          else
          {
            (*((void (**)(id, _QWORD, uint64_t, uint64_t, uint64_t))v23 + 2))(v23, *(_QWORD *)(p_aBlock + 40), v65[5], v57[3], 1);
            v39 = 0;
          }
        }
        else
        {
          v39 = 1;
        }

        _Block_object_dispose(&v56, 8);
        _Block_object_dispose(&v60, 8);
        _Block_object_dispose(&v64, 8);

        _Block_object_dispose(&aBlock, 8);
        _Block_object_dispose(v80, 8);

      }
      else
      {
        v39 = 2;
      }
    }
    else
    {
      v39 = 1;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a5, 3, CFSTR("Missing sample type for query"));
    v39 = 1;
  }

  return v39;
}

uint64_t __65__HDBatchedQueryServer_batchObjectsWithEnumerator_error_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_queryServerWillSendBatchHandler, 0);
  objc_storeStrong(&self->_unitTest_queryServerObjectEnumerationHandler, 0);
}

void __92__HDBatchedQueryServer_batchObjectsWithEnumerator_includeDeletedObjects_error_batchHandler___block_invoke(_QWORD *a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, id, uint64_t, uint64_t);
  id v12;
  id v13;

  v9 = a1[4];
  v8 = a1[5];
  v10 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
  v11 = *(void (**)(uint64_t, uint64_t, id, uint64_t, uint64_t))(v8 + 16);
  v12 = a3;
  v13 = a2;
  v11(v8, v9, v13, a5, v10);
  (*(void (**)(void))(a1[6] + 16))();

}

uint64_t __92__HDBatchedQueryServer_batchObjectsWithEnumerator_includeDeletedObjects_error_batchHandler___block_invoke_187(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  id *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void *v28;

  v7 = a2;
  v8 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldStopProcessingQuery"))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;

LABEL_16:
    v14 = 0;
    goto LABEL_35;
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "_shouldSuspendQuery"))
  {
    if (!(v7 | v8))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 32), CFSTR("HDBatchedQueryServer.m"), 110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sample != nil || deletedObject != nil"));

LABEL_34:
      v14 = 1;
      goto LABEL_35;
    }
    if (!v7)
    {
      v14 = 1;
      if (!v8 || !*(_BYTE *)(a1 + 104))
        goto LABEL_35;
    }
    v16 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count");
    if ((unint64_t)(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "count") + v16) >= 0xC8)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 200);
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;

      v20 = *(unsigned __int8 *)(a1 + 104);
      if (*(_BYTE *)(a1 + 104))
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 200);
      else
        v21 = 0;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v21);
      if (v20)

      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
    }
    if (v7)
    {
      v22 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v23 = v7;
    }
    else
    {
      if (!v8 || !*(_BYTE *)(a1 + 104))
        goto LABEL_27;
      v22 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      v23 = v8;
    }
    objc_msgSend(*v22, "addObject:", v23);
LABEL_27:
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    if (*(_QWORD *)(v24 + 24) < a4)
      *(_QWORD *)(v24 + 24) = a4;
    v25 = *(_QWORD *)(a1 + 48);
    if (v25)
    {
      if (v7)
        v26 = v7;
      else
        v26 = v8;
      (*(void (**)(uint64_t, _QWORD, unint64_t, _QWORD))(v25 + 16))(v25, *(_QWORD *)(a1 + 32), v26, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24));
    }
    goto LABEL_34;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 200);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  v14 = *(unsigned __int8 *)(a1 + 104);
  if (*(_BYTE *)(a1 + 104))
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 200);
  else
    v15 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v15);
  if ((_DWORD)v14)
  {

    goto LABEL_16;
  }
LABEL_35:

  return v14;
}

void __68__HDBatchedQueryServer__processBatchHandlerForResearchAppECGAccess___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(a2, "hk_map:", &__block_literal_global_199);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

id __68__HDBatchedQueryServer__processBatchHandlerForResearchAppECGAccess___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "metadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "mutableCopy");

  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v2, "privateClassification"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CB7278]);

  objc_msgSend(v2, "_setMetadata:", v5);
  return v2;
}

- (int64_t)batchObjectsWithMultitypeQueryCursor:(id)a3 includeDeletedObjects:(BOOL)a4 limit:(unint64_t)a5 error:(id *)a6 batchHandler:(id)a7
{
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char **v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  HDQueryDescriptor *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  HDQueryDescriptor *v55;
  uint64_t v56;
  void *v57;
  id v58;
  id v59;
  unint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  HDMultiTypeSortedSampleIterator *v69;
  void *v70;
  void *v71;
  HDMultiTypeSortedSampleIterator *v72;
  void *v73;
  uint64_t v74;
  HDDistinctByKeyPathsIterator *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  _BOOL4 v80;
  void *v81;
  id v82;
  id v83;
  int64_t v84;
  id *v85;
  _BOOL4 v86;
  id v87;
  unint64_t v88;
  BOOL v89;
  uint64_t v90;
  void *v91;
  void *v92;
  id v93;
  id v94;
  void *v95;
  char isKindOfClass;
  void *v97;
  void *v98;
  void *v99;
  char v100;
  void *v101;
  BOOL v102;
  id v103;
  BOOL v104;
  void *v105;
  id v106;
  char v107;
  char v108;
  _BOOL4 v109;
  void *v110;
  void *v111;
  id v114;
  id v115;
  char *v116;
  void *v117;
  void (**v118)(id, id, id, uint64_t, void *, _QWORD);
  uint64_t v119;
  unint64_t v120;
  uint64_t v121;
  void (**v122)(void *, HDBatchedQueryServer *, void *, unint64_t);
  id v123;
  void *v124;
  _BOOL4 v125;
  void *v126;
  HDBatchedQueryServer *v127;
  void *v128;
  uint64_t v129;
  id *v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  id v135;
  _BYTE v136[128];
  uint64_t v137;

  v125 = a4;
  v137 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v115 = a7;
  v126 = v10;
  objc_msgSend(v10, "queryDescriptors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v131 = 0u;
  v132 = 0u;
  v133 = 0u;
  v134 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v131, v136, 16);
  v123 = v12;
  v127 = self;
  v130 = a6;
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v132;
    v16 = &selRef_setCanRepromptOnSameBuild_;
    v119 = *(_QWORD *)v132;
    do
    {
      v17 = 0;
      v116 = v16[510];
      v121 = v14;
      do
      {
        if (*(_QWORD *)v132 != v15)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * v17);
        objc_msgSend(v18, "sampleType");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDQueryServer readAuthorizationStatusForType:error:](self, "readAuthorizationStatusForType:error:", v19, a6);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
          goto LABEL_50;
        if (!objc_msgSend(v20, "canRead"))
          goto LABEL_28;
        if (v125
          && (objc_msgSend(v20, "restrictedBundleIdentifier"),
              v21 = (void *)objc_claimAutoreleasedReturnValue(),
              v21,
              !v21))
        {
          v45 = (void *)MEMORY[0x1E0D29838];
          +[HDDataEntity disambiguatedSQLForProperty:](HDDataEntity, "disambiguatedSQLForProperty:", CFSTR("data_id"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "deletedObjectBaselineAnchor");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "predicateWithProperty:greaterThanValue:", v46, v47);
          v128 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v128 = 0;
        }
        objc_msgSend(v18, "sampleType");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v126;
        if (!self)
        {
          v27 = 0;
          goto LABEL_26;
        }
        v24 = v22;
        -[HDQueryServer client](self, "client");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "authorizationOracle");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "additionalAuthorizationPredicateForObjectType:error:", v24, v130);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v27)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), v116, CFSTR("Unable to determine authorization status."));
          v44 = (id)objc_claimAutoreleasedReturnValue();
          v41 = v44;
          if (v44)
          {
            if (v130)
            {
              v41 = objc_retainAutorelease(v44);
              v27 = 0;
              *v130 = v41;
            }
            else
            {
              _HKLogDroppedError();
              v27 = 0;
            }
            v40 = v41;
          }
          else
          {
            v40 = 0;
            v27 = 0;
          }
          goto LABEL_25;
        }
        objc_msgSend(v23, "followingAnchor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          v29 = (void *)MEMORY[0x1E0D29890];
          v30 = (void *)MEMORY[0x1E0D29838];
          v31 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v23, "followingAnchor");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "numberWithLongLong:", objc_msgSend(v32, "_rowid"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "predicateWithProperty:greaterThanValue:", CFSTR("data_id"), v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "compoundPredicateWithPredicate:otherPredicate:", v27, v34);
          v35 = objc_claimAutoreleasedReturnValue();

          v27 = (void *)v35;
        }
        objc_msgSend(v23, "upToAndIncludingAnchor");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          v37 = (void *)MEMORY[0x1E0D29890];
          v38 = (void *)MEMORY[0x1E0D29838];
          v39 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v23, "upToAndIncludingAnchor");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "numberWithLongLong:", objc_msgSend(v40, "_rowid") + 1);
          v41 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "predicateWithProperty:lessThanValue:", CFSTR("data_id"), v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "compoundPredicateWithPredicate:otherPredicate:", v27, v42);
          v43 = objc_claimAutoreleasedReturnValue();

          v27 = (void *)v43;
          self = v127;
LABEL_25:

          goto LABEL_26;
        }
        self = v127;
LABEL_26:

        if (!v27)
        {

          v12 = v123;
LABEL_50:

          v84 = 1;
          v57 = v124;
          goto LABEL_101;
        }
        v48 = [HDQueryDescriptor alloc];
        v49 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v18, "sampleType");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setWithObject:", v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "restrictedSourceEntities");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDQueryServer sampleAuthorizationFilter](self, "sampleAuthorizationFilter");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "_filter");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = -[HDQueryDescriptor initWithSampleTypes:encodingOptions:restrictedSourceEntities:authorizationFilter:filter:samplePredicate:deletedObjectsPredicate:](v48, "initWithSampleTypes:encodingOptions:restrictedSourceEntities:authorizationFilter:filter:samplePredicate:deletedObjectsPredicate:", v51, 0, v52, v53, v54, v27, v128);
        objc_msgSend(v124, "addObject:", v55);

        self = v127;
        v14 = v121;
        v12 = v123;
        a6 = v130;
        v15 = v119;
LABEL_28:

        ++v17;
      }
      while (v14 != v17);
      v56 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v131, v136, 16);
      v14 = v56;
      v16 = &selRef_setCanRepromptOnSameBuild_;
    }
    while (v56);
  }

  v57 = v124;
  if (!objc_msgSend(v124, "count"))
  {
    v84 = 2;
    goto LABEL_101;
  }
  v58 = v124;
  v59 = v126;
  v118 = (void (**)(id, id, id, uint64_t, void *, _QWORD))v115;
  if (!self)
  {
    v84 = 0;
    v12 = v123;
    goto LABEL_100;
  }
  if ((uint64_t)a5 >= 50)
    v60 = 50;
  else
    v60 = a5;
  v120 = a5 - 1;
  if ((uint64_t)a5 >= 1)
    v61 = v60;
  else
    v61 = 50;
  v62 = (void *)MEMORY[0x1E0CB6C10];
  objc_msgSend(v59, "sortDescriptors");
  v63 = objc_claimAutoreleasedReturnValue();
  v64 = (void *)v63;
  v65 = v59;
  if (v63)
    v66 = v63;
  else
    v66 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v65, "followingAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "sortedQueryAnchorWithSortDescriptors:objectID:", v66, objc_msgSend(v67, "_rowid"));
  v68 = objc_claimAutoreleasedReturnValue();

  v69 = [HDMultiTypeSortedSampleIterator alloc];
  objc_msgSend(v65, "sortDescriptors");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQueryServer profile](self, "profile");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = (void *)v68;
  v72 = -[HDMultiTypeSortedSampleIterator initWithQueryDescriptors:includeDeletedObjects:anchor:sortDescriptors:bufferSize:profile:](v69, "initWithQueryDescriptors:includeDeletedObjects:anchor:sortDescriptors:bufferSize:profile:", v58, v125, v68, v70, v61, v71);

  v59 = v65;
  objc_msgSend(v65, "distinctByKeyPaths");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v73, "count");

  if (v74)
  {
    v75 = [HDDistinctByKeyPathsIterator alloc];
    objc_msgSend(v65, "distinctByKeyPaths");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = -[HDDistinctByKeyPathsIterator initWithSourceIterator:keyPaths:](v75, "initWithSourceIterator:keyPaths:", v72, v76);

    v72 = (HDMultiTypeSortedSampleIterator *)v77;
  }
  objc_msgSend(v65, "state");
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  if (v78)
  {
    objc_msgSend(v65, "state");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = -[HDMultiTypeSortedSampleIterator restoreIteratorStateFromData:error:](v72, "restoreIteratorStateFromData:error:", v79, v130);

    if (!v80)
    {
      v84 = 1;
      v12 = v123;
      v105 = v117;
      goto LABEL_99;
    }
  }
  v114 = v58;
  v122 = (void (**)(void *, HDBatchedQueryServer *, void *, unint64_t))_Block_copy(self->_unitTest_queryServerObjectEnumerationHandler);
  objc_msgSend(v65, "followingAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = objc_msgSend(v81, "_rowid");

  v82 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v125)
    v83 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  else
    v83 = 0;
  v85 = v130;
  v135 = 0;
  v86 = -[HDMultiTypeSortedSampleIterator advanceWithError:](v72, "advanceWithError:", &v135);
  v87 = v135;
  if (!v86)
  {
LABEL_75:
    v104 = 0;
LABEL_76:
    v12 = v123;
    goto LABEL_83;
  }
  v88 = 1;
  while (1)
  {
    v89 = -[HDQueryServer _shouldStopProcessingQuery](v127, "_shouldStopProcessingQuery");
    if (v89)
    {
      v106 = 0;
      goto LABEL_82;
    }
    if (-[HDQueryServer _shouldSuspendQuery](v127, "_shouldSuspendQuery"))
      break;
    v90 = objc_msgSend(v82, "count");
    if ((unint64_t)(objc_msgSend(v83, "count") + v90) >= 0xC8)
    {
      -[HDMultiTypeSortedSampleIterator iteratorStateData](v72, "iteratorStateData");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDBatchedQueryServer _queryCursorWithQueryCursor:state:]((uint64_t)v127, v65, v91);
      v92 = (void *)objc_claimAutoreleasedReturnValue();

      v118[2](v118, v82, v83, v129, v92, 0);
      v93 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

      if (v125)
        v94 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      else
        v94 = 0;

      v129 = 0;
      v82 = v93;
      v83 = v94;
      v85 = v130;
    }
    -[HDMultiTypeSortedSampleIterator object](v72, "object");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[HDMultiTypeSortedSampleIterator sample](v72, "sample");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = v82;
    }
    else
    {
      if (!v125)
        goto LABEL_68;
      -[HDMultiTypeSortedSampleIterator object](v72, "object");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v100 = objc_opt_isKindOfClass();

      if ((v100 & 1) == 0)
        goto LABEL_68;
      -[HDMultiTypeSortedSampleIterator deletedObject](v72, "deletedObject");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = v83;
    }
    objc_msgSend(v98, "addObject:", v97);

LABEL_68:
    if (-[HDMultiTypeSortedSampleIterator objectID](v72, "objectID") > v129)
      v129 = -[HDMultiTypeSortedSampleIterator objectID](v72, "objectID");
    if (v120 < v88)
      goto LABEL_75;
    if (v122)
    {
      -[HDMultiTypeSortedSampleIterator object](v72, "object");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v122[2](v122, v127, v101, v88);

    }
    v135 = v87;
    v102 = -[HDMultiTypeSortedSampleIterator advanceWithError:](v72, "advanceWithError:", &v135);
    v103 = v135;

    ++v88;
    v87 = v103;
    if (!v102)
    {
      v104 = 0;
      v87 = v103;
      goto LABEL_76;
    }
  }
  v106 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

  v82 = v83;
  if (v125)
    v83 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  else
    v83 = 0;
LABEL_82:
  v12 = v123;
  v104 = !v89;

  v82 = v106;
LABEL_83:
  v107 = objc_msgSend(v87, "hk_isHealthKitErrorWithCode:", 900);
  v108 = v107;
  if (v87 && (v107 & 1) == 0)
  {
    if (v85)
      *v85 = objc_retainAutorelease(v87);
    else
      _HKLogDroppedError();
    v84 = 1;
    goto LABEL_95;
  }
  v109 = -[HDQueryServer _shouldStopProcessingQuery](v127, "_shouldStopProcessingQuery");
  if (v109)
    v84 = 4;
  else
    v84 = 3;
  if (v104 || v109)
  {
LABEL_95:
    v59 = v65;
    v105 = v117;
  }
  else
  {
    v59 = v65;
    if ((v108 & 1) != 0)
    {
      v110 = 0;
      v105 = v117;
      goto LABEL_97;
    }
    -[HDMultiTypeSortedSampleIterator iteratorStateData](v72, "iteratorStateData");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDBatchedQueryServer _queryCursorWithQueryCursor:state:]((uint64_t)v127, v65, v111);
    v110 = (void *)objc_claimAutoreleasedReturnValue();

    v105 = v117;
    if (v110)
    {
LABEL_97:
      v118[2](v118, v82, v83, v129, v110, 1);

      v84 = 0;
    }
    else
    {
      v84 = 1;
    }
  }

  v57 = v124;
  v58 = v114;
LABEL_99:

LABEL_100:
LABEL_101:

  return v84;
}

- (id)_queryCursorWithQueryCursor:(void *)a3 state:
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", sel__queryCursorWithQueryCursor_state_, a1, CFSTR("HDBatchedQueryServer.m"), 377, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("state"));

  }
  v7 = objc_alloc(MEMORY[0x1E0CB6AF0]);
  objc_msgSend(v5, "queryDescriptors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortDescriptors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "followingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "upToAndIncludingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "distinctByKeyPaths");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v7, "initWithQueryDescriptors:sortDescriptors:followingAnchor:upToAndIncludingAnchor:distinctByKeyPaths:state:", v8, v9, v10, v11, v12, v6);

  return v13;
}

- (id)unitTest_queryServerObjectEnumerationHandler
{
  return self->_unitTest_queryServerObjectEnumerationHandler;
}

- (void)setUnitTest_queryServerObjectEnumerationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (id)unitTest_queryServerWillSendBatchHandler
{
  return self->_unitTest_queryServerWillSendBatchHandler;
}

- (void)setUnitTest_queryServerWillSendBatchHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

@end
