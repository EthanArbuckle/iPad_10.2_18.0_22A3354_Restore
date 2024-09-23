@implementation SGPipeline

- (id)_dissectOperations:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSDictionary *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  NSDictionary *dissectorsAndDependencies;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  SGPipeline *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[5];
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = (void *)MEMORY[0x1E0CB34C8];
  v9 = MEMORY[0x1E0C809B0];
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __39__SGPipeline__dissectOperations_block___block_invoke;
  v55[3] = &unk_1E7DB56F0;
  v10 = v6;
  v56 = v10;
  objc_msgSend(v8, "blockOperationWithBlock:", v55);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB34C8];
  v53[0] = v9;
  v53[1] = 3221225472;
  v53[2] = __39__SGPipeline__dissectOperations_block___block_invoke_2;
  v53[3] = &unk_1E7DB56F0;
  v39 = v10;
  v54 = v39;
  objc_msgSend(v12, "blockOperationWithBlock:", v53);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)v11;
  objc_msgSend(v36, "addDependency:", v11);
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSDictionary count](self->_dissectorsAndDependencies, "count"));
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v35 = self;
  v13 = self->_dissectorsAndDependencies;
  v14 = -[NSDictionary countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v50 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
        v19 = (void *)MEMORY[0x1C3BD4F6C]();
        v7[2](v7, v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v21 = (void *)MEMORY[0x1E0CB34C8];
          v46[0] = MEMORY[0x1E0C809B0];
          v46[1] = 3221225472;
          v46[2] = __39__SGPipeline__dissectOperations_block___block_invoke_3;
          v46[3] = &unk_1E7DB6F48;
          v46[4] = v18;
          v47 = v39;
          v48 = v20;
          objc_msgSend(v21, "blockOperationWithBlock:", v46);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (objc_class *)objc_opt_class();
          NSStringFromClass(v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setName:", v24);

          objc_msgSend(v38, "setObject:forKeyedSubscript:", v22, v18);
        }

        objc_autoreleasePoolPop(v19);
      }
      v15 = -[NSDictionary countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    }
    while (v15);
  }

  dissectorsAndDependencies = v35->_dissectorsAndDependencies;
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __39__SGPipeline__dissectOperations_block___block_invoke_4;
  v44[3] = &unk_1E7DB1998;
  v26 = v38;
  v45 = v26;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](dissectorsAndDependencies, "enumerateKeysAndObjectsUsingBlock:", v44);
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v26, "count") + 2);
  objc_msgSend(v27, "addObject:", v37);
  objc_msgSend(v27, "addObject:", v36);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(v26, "allValues");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v40, v57, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v41 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
        objc_msgSend(v33, "addDependency:", v37);
        objc_msgSend(v36, "addDependency:", v33);
        objc_msgSend(v27, "addObject:", v33);
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v40, v57, 16);
    }
    while (v30);
  }

  return v27;
}

- (id)dissectOperationsForMailMessage:(id)a3 entity:(id)a4 inContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63__SGPipeline_dissectOperationsForMailMessage_entity_inContext___block_invoke;
  v16[3] = &unk_1E7DB19C0;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[SGPipeline _dissectOperations:block:](self, "_dissectOperations:block:", v12, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)dissectOperationsForTextMessage:(id)a3 entity:(id)a4 inContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63__SGPipeline_dissectOperationsForTextMessage_entity_inContext___block_invoke;
  v16[3] = &unk_1E7DB19C0;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[SGPipeline _dissectOperations:block:](self, "_dissectOperations:block:", v12, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)dissectOperationsForInteraction:(id)a3 entity:(id)a4 inContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63__SGPipeline_dissectOperationsForInteraction_entity_inContext___block_invoke;
  v16[3] = &unk_1E7DB19C0;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[SGPipeline _dissectOperations:block:](self, "_dissectOperations:block:", v12, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_dissectOperations:(id)a3 inContext:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id result;
  void *v16;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "mailMessage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v7, "mailMessage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGPipeline dissectOperationsForMailMessage:entity:inContext:](self, "dissectOperationsForMailMessage:entity:inContext:", v10, v7, v8);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v14 = (void *)v11;

    return v14;
  }
  objc_msgSend(v7, "textMessage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v7, "textMessage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGPipeline dissectOperationsForTextMessage:entity:inContext:](self, "dissectOperationsForTextMessage:entity:inContext:", v10, v7, v8);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(v7, "interaction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v7, "interaction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGPipeline dissectOperationsForInteraction:entity:inContext:](self, "dissectOperationsForInteraction:entity:inContext:", v10, v7, v8);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPipeline.m"), 456, CFSTR("Unknown entity type"));

  __break(1u);
  return result;
}

- (id)geocodeOperation:(id)a3 withDependencies:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CB34C8];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __48__SGPipeline_geocodeOperation_withDependencies___block_invoke;
  v20[3] = &unk_1E7DB56F0;
  v8 = v5;
  v21 = v8;
  objc_msgSend(v7, "blockOperationWithBlock:", v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v9, "addDependency:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14++), (_QWORD)v16);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v12);
  }

  return v9;
}

- (id)verificationOperation:(id)a3 overrideVerificationStatus:(id)a4 withDependencies:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[4];
  id v26;
  id v27;
  SGPipeline *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0CB34C8];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __80__SGPipeline_verificationOperation_overrideVerificationStatus_withDependencies___block_invoke;
  v25[3] = &unk_1E7DB7800;
  v12 = v8;
  v26 = v12;
  v13 = v9;
  v27 = v13;
  v28 = self;
  objc_msgSend(v11, "blockOperationWithBlock:", v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = v10;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(v14, "addDependency:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v19++), (_QWORD)v21);
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v17);
  }

  return v14;
}

- (void)logDKIMStatus:(int64_t)a3 forPipelineEntity:(id)a4
{
  id v5;
  void *v6;
  unsigned __int16 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = v5;
  v16 = 0u;
  v17 = 0u;
  if (a3)
    v7 = 10;
  else
    v7 = 11;
  v18 = 0uLL;
  v19 = 0uLL;
  objc_msgSend(v5, "enrichments", (_QWORD)v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x1C3BD4F6C]();
        if (objc_msgSend(v13, "isEvent"))
        {
          +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "logEventInteractionForEntity:interface:actionType:", v13, 0, v7);

        }
        objc_autoreleasePoolPop(v14);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

}

- (id)verificationOperation:(id)a3 withDependencies:(id)a4
{
  return -[SGPipeline verificationOperation:overrideVerificationStatus:withDependencies:](self, "verificationOperation:overrideVerificationStatus:withDependencies:", a3, 0, a4);
}

- (id)storeOperation:(id)a3 withStore:(id)a4 dependencies:(id)a5
{
  return -[SGPipeline storeOperation:spotlightBundleIdentifier:spotlightUniqueIdentifier:spotlightDomainIdentifier:withStore:dependencies:](self, "storeOperation:spotlightBundleIdentifier:spotlightUniqueIdentifier:spotlightDomainIdentifier:withStore:dependencies:", a3, 0, 0, 0, a4, a5);
}

- (id)storeOperation:(id)a3 withStore:(id)a4 dependencies:(id)a5 originalEnrichmentCount:(unint64_t)a6
{
  return -[SGPipeline storeOperation:spotlightBundleIdentifier:spotlightUniqueIdentifier:spotlightDomainIdentifier:withStore:dependencies:originalEnrichmentCount:](self, "storeOperation:spotlightBundleIdentifier:spotlightUniqueIdentifier:spotlightDomainIdentifier:withStore:dependencies:originalEnrichmentCount:", a3, 0, 0, 0, a4, a5, a6);
}

- (id)storeOperation:(id)a3 spotlightBundleIdentifier:(id)a4 spotlightUniqueIdentifier:(id)a5 spotlightDomainIdentifier:(id)a6 withStore:(id)a7 dependencies:(id)a8
{
  return -[SGPipeline storeOperation:spotlightBundleIdentifier:spotlightUniqueIdentifier:spotlightDomainIdentifier:withStore:dependencies:originalEnrichmentCount:](self, "storeOperation:spotlightBundleIdentifier:spotlightUniqueIdentifier:spotlightDomainIdentifier:withStore:dependencies:originalEnrichmentCount:", a3, a4, a5, a6, a7, a8, 0);
}

- (id)storeOperation:(id)a3 spotlightBundleIdentifier:(id)a4 spotlightUniqueIdentifier:(id)a5 spotlightDomainIdentifier:(id)a6 withStore:(id)a7 dependencies:(id)a8 originalEnrichmentCount:(unint64_t)a9
{
  id v16;
  id v17;
  unint64_t v18;
  unint64_t v19;
  id v20;
  id v21;
  BOOL v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  id v43;
  SGPipeline *v44;
  id v45;
  id v46;
  id v47;
  SEL v48;
  unint64_t v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = (unint64_t)a5;
  v19 = (unint64_t)a6;
  v20 = a7;
  v21 = a8;
  v22 = (v18 | v19) == 0;
  if (v17)
    v22 = v18 != 0;
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPipeline.m"), 646, CFSTR("bundleIdentifier and uniqueIdentifier are required if adding a Spotlight reference."));

  }
  v23 = (void *)MEMORY[0x1E0CB34C8];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __154__SGPipeline_storeOperation_spotlightBundleIdentifier_spotlightUniqueIdentifier_spotlightDomainIdentifier_withStore_dependencies_originalEnrichmentCount___block_invoke;
  v41[3] = &unk_1E7DB1A78;
  v24 = v16;
  v42 = v24;
  v25 = (id)v18;
  v43 = v25;
  v44 = self;
  v48 = a2;
  v49 = a9;
  v26 = v20;
  v45 = v26;
  v27 = v17;
  v46 = v27;
  v28 = (id)v19;
  v47 = v28;
  objc_msgSend(v23, "blockOperationWithBlock:", v41);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v30 = v21;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v38 != v33)
          objc_enumerationMutation(v30);
        objc_msgSend(v29, "addDependency:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i), (_QWORD)v37);
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
    }
    while (v32);
  }

  objc_msgSend(v29, "setName:", CFSTR("Store"));
  return v29;
}

- (void)dissect:(id)a3 inContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[3];

  v9 = a3;
  v6 = a4;
  v10[2] = 0;
  v10[0] = CFSTR("dissect");
  v10[1] = mach_absolute_time();
  objc_msgSend(v6, "processingQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGPipeline _dissectOperations:inContext:](self, "_dissectOperations:inContext:", v9, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addOperations:waitUntilFinished:", v8, 1);

  SGRecordMeasurementState(v10);
  SGRecordMeasurementState(v10);

}

- (void)dissect:(id)a3
{
  id v4;
  SGRequestContext *v5;
  SGServiceContext *v6;
  void *v7;
  SGServiceContext *v8;
  SGRequestContext *v9;

  v4 = a3;
  v5 = [SGRequestContext alloc];
  v6 = [SGServiceContext alloc];
  +[SGSqlEntityStore defaultStore](SGSqlEntityStore, "defaultStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SGServiceContext initWithStore:](v6, "initWithStore:", v7);
  v9 = -[SGRequestContext initWithServiceContext:concurrencyBehavior:backpressureHazard:](v5, "initWithServiceContext:concurrencyBehavior:backpressureHazard:", v8, 1, 0);

  -[SGPipeline dissect:inContext:](self, "dissect:inContext:", v4, v9);
}

- (void)dissectAndStore:(id)a3 inContext:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  id obj;
  void *v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[3];
  _QWORD v47[3];
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v33 = a4;
  v47[0] = CFSTR("dissectArrayAndWrite");
  v47[1] = mach_absolute_time();
  v47[2] = 0;
  v46[0] = CFSTR("dissectArray");
  v46[1] = mach_absolute_time();
  v46[2] = 0;
  v31 = (void *)objc_opt_new();
  v32 = (void *)objc_opt_new();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v43;
    do
    {
      v11 = 0;
      v12 = v9;
      do
      {
        if (*(_QWORD *)v43 != v10)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v11);
        v14 = (void *)MEMORY[0x1C3BD4F6C]();
        -[SGPipeline _dissectOperations:inContext:](self, "_dissectOperations:inContext:", v13, v33);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addObjectsFromArray:", v15);
        objc_msgSend(v33, "serviceContext");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "store");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SGPipeline storeOperation:withStore:dependencies:](self, "storeOperation:withStore:dependencies:", v13, v17, v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v32, "addObject:", v9);
        if (v12)
          objc_msgSend(v9, "addDependency:", v12);

        objc_autoreleasePoolPop(v14);
        ++v11;
        v12 = v9;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    }
    while (v8);

  }
  objc_msgSend(v33, "storageQueue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addOperations:waitUntilFinished:", v32, 0);

  objc_msgSend(v33, "processingQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addOperations:waitUntilFinished:", v31, 0);

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v20 = v31;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v39 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "waitUntilFinished");
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
    }
    while (v22);
  }

  SGRecordMeasurementState(v46);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v25 = v32;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v35 != v28)
          objc_enumerationMutation(v25);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "waitUntilFinished");
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
    }
    while (v27);
  }

  SGRecordMeasurementState(v47);
}

- (void)dissect:(id)a3 andStore:(id)a4
{
  id v6;
  id v7;
  SGRequestContext *v8;
  SGServiceContext *v9;

  v6 = a4;
  v7 = a3;
  v9 = -[SGServiceContext initWithStore:]([SGServiceContext alloc], "initWithStore:", v6);

  v8 = -[SGRequestContext initWithServiceContext:concurrencyBehavior:backpressureHazard:]([SGRequestContext alloc], "initWithServiceContext:concurrencyBehavior:backpressureHazard:", v9, 1, 0);
  -[SGPipeline dissectAndStore:inContext:](self, "dissectAndStore:inContext:", v7, v8);

}

- (void)_dissectEntity:(id)a3 inContext:(id)a4 andThen:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[3];
  _QWORD v26[3];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  v11 = (void *)MEMORY[0x1C3BD4F6C]();
  v26[0] = CFSTR("dissectEntityAndWrite");
  v26[1] = mach_absolute_time();
  v26[2] = 0;
  v25[0] = CFSTR("dissectEntity");
  v25[1] = mach_absolute_time();
  v25[2] = 0;
  -[SGPipeline _dissectOperations:inContext:](self, "_dissectOperations:inContext:", v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2](v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "storageQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addOperation:", v13);

  objc_msgSend(v9, "processingQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addOperations:waitUntilFinished:", v12, 0);

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = v12;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v20++), "waitUntilFinished", (_QWORD)v21);
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v18);
  }

  +[SGPipeline _delayedResetCachesAndModels](SGPipeline, "_delayedResetCachesAndModels");
  SGRecordMeasurementState(v25);
  objc_msgSend(v13, "waitUntilFinished");
  SGRecordMeasurementState(v26);

  objc_autoreleasePoolPop(v11);
}

- (void)dissectEntity:(id)a3 andStore:(id)a4
{
  id v6;
  id v7;
  SGRequestContext *v8;
  SGServiceContext *v9;
  SGRequestContext *v10;

  v6 = a4;
  v7 = a3;
  v8 = [SGRequestContext alloc];
  v9 = -[SGServiceContext initWithStore:]([SGServiceContext alloc], "initWithStore:", v6);
  v10 = -[SGRequestContext initWithServiceContext:concurrencyBehavior:backpressureHazard:](v8, "initWithServiceContext:concurrencyBehavior:backpressureHazard:", v9, 1, 0);

  -[SGPipeline dissectAndStoreEntity:inContext:destinationStore:](self, "dissectAndStoreEntity:inContext:destinationStore:", v7, v10, v6);
}

- (void)dissectAndStoreEntity:(id)a3 inContext:(id)a4 destinationStore:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "enrichments");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63__SGPipeline_dissectAndStoreEntity_inContext_destinationStore___block_invoke;
  v16[3] = &unk_1E7DB1AA0;
  v16[4] = self;
  v17 = v8;
  v18 = v10;
  v19 = v9;
  v20 = v12;
  v13 = v9;
  v14 = v10;
  v15 = v8;
  -[SGPipeline _dissectEntity:inContext:andThen:](self, "_dissectEntity:inContext:andThen:", v15, v13, v16);

}

- (void)dissectAndStoreEntity:(id)a3 inContext:(id)a4
{
  -[SGPipeline dissectAndStoreEntity:inContext:destinationStore:](self, "dissectAndStoreEntity:inContext:destinationStore:", a3, a4, 0);
}

- (void)dissectAndStoreSpotlightEntity:(id)a3 bundleIdentifier:(id)a4 uniqueIdentifier:(id)a5 domainIdentifier:(id)a6 inContext:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __106__SGPipeline_dissectAndStoreSpotlightEntity_bundleIdentifier_uniqueIdentifier_domainIdentifier_inContext___block_invoke;
  v22[3] = &unk_1E7DB1AC8;
  v22[4] = self;
  v23 = v12;
  v24 = v13;
  v25 = v14;
  v26 = v15;
  v27 = v16;
  v17 = v16;
  v18 = v15;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  -[SGPipeline _dissectEntity:inContext:andThen:](self, "_dissectEntity:inContext:andThen:", v21, v17, v22);

}

- (id)dissectors
{
  return -[NSDictionary allKeys](self->_dissectorsAndDependencies, "allKeys");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dissectorsAndDependencies, 0);
}

id __106__SGPipeline_dissectAndStoreSpotlightEntity_bundleIdentifier_uniqueIdentifier_domainIdentifier_inContext___block_invoke(_QWORD *a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[7];
  v6 = a1[8];
  v7 = (void *)a1[9];
  v8 = a2;
  objc_msgSend(v7, "serviceContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "store");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storeOperation:spotlightBundleIdentifier:spotlightUniqueIdentifier:spotlightDomainIdentifier:withStore:dependencies:", v3, v4, v5, v6, v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __63__SGPipeline_dissectAndStoreEntity_inContext_destinationStore___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(*(id *)(a1 + 56), "serviceContext");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "store");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "storeOperation:withStore:dependencies:originalEnrichmentCount:", v6, v8, v4, *(_QWORD *)(a1 + 64));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {

  }
  return v9;
}

void __154__SGPipeline_storeOperation_spotlightBundleIdentifier_spotlightUniqueIdentifier_spotlightDomainIdentifier_withStore_dependencies_originalEnrichmentCount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v2 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(*(id *)(a1 + 32), "harvestMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startTimer:", kHarvestMetricsStorageTimer);

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "enrichments");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    v6 = *(_QWORD *)(a1 + 88);

    if (v5 <= v6)
    {
      v7 = 0;
      goto LABEL_7;
    }
    objc_msgSend(*(id *)(a1 + 56), "writeEntity:withSpotlightReferenceForBundleIdentifier:uniqueIdentifier:domainIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "writeEntity:", *(_QWORD *)(a1 + 32));
  }
  v7 = 1;
LABEL_7:
  if (objc_msgSend(*(id *)(a1 + 32), "hasFullDownloadBeenRequested")
    && objc_msgSend(*(id *)(a1 + 56), "entityWantsFullDownload:", *(_QWORD *)(a1 + 32)))
  {
    notify_post("com.apple.suggestions.fulldownloadrequested");
  }
  objc_msgSend(*(id *)(a1 + 56), "syncNewBlobsIfChanged");
  objc_msgSend(*(id *)(a1 + 32), "harvestMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = kHarvestMetricsStorageTimer;
  if ((v7 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "enrichments");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endTimer:significantWork:", v10, objc_msgSend(v11, "count") != 0);

  }
  else
  {
    objc_msgSend(v8, "endTimer:significantWork:", kHarvestMetricsStorageTimer, 0);
  }

  objc_autoreleasePoolPop(v2);
}

void __80__SGPipeline_verificationOperation_overrideVerificationStatus_withDependencies___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void (**v5)(_QWORD);
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  char v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D198F0], "enableDKIMEnforcement"))
    return;
  objc_msgSend(*(id *)(a1 + 32), "harvestMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startTimer:", kHarvestMetricsVerificationTimer);

  objc_msgSend(*(id *)(a1 + 32), "duplicateKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "entityType") == 5)
    v4 = objc_msgSend(*(id *)(a1 + 32), "hasEventEnrichment");
  else
    v4 = 0;

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __80__SGPipeline_verificationOperation_overrideVerificationStatus_withDependencies___block_invoke_2;
  v19[3] = &unk_1E7DB1A10;
  v20 = *(id *)(a1 + 32);
  v21 = v4;
  v5 = (void (**)(_QWORD))MEMORY[0x1C3BD5158](v19);
  if (v4)
  {
    v6 = *(void **)(a1 + 40);
    if (v6)
    {
      v7 = objc_msgSend(v6, "integerValue");
      v8 = 0;
    }
    else
    {
      +[SGMailClientUtil sharedInstance](SGMailClientUtil, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v18 = 0;
      v7 = objc_msgSend(v9, "verifyDKIMSignatureForPipelineEntity:error:", v10, &v18);
      v8 = v18;
      objc_msgSend(*(id *)(a1 + 48), "logDKIMStatus:forPipelineEntity:", v7, *(_QWORD *)(a1 + 32));

    }
    if (!objc_msgSend(*(id *)(a1 + 32), "needsSourceVerification"))
      goto LABEL_16;
    if (v7)
    {
      if (v7 != 2)
      {
        if (v7 == 1)
        {
          sgEventsLogHandle();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 32), "loggingIdentifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v23 = v8;
            v24 = 2114;
            v25 = v12;
            _os_log_impl(&dword_1C3607000, v11, OS_LOG_TYPE_DEFAULT, "SGPipeline verificationOperation: DKIM verification resulted in temporary failure: %@. [SGPipelineEntity (%{public}@)]", buf, 0x16u);

          }
          v13 = 1;
          goto LABEL_23;
        }
LABEL_16:
        v13 = 0;
LABEL_24:
        objc_msgSend(*(id *)(a1 + 32), "setPendingVerification:", v13);

        goto LABEL_25;
      }
      sgEventsLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "loggingIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v23 = v8;
        v24 = 2114;
        v25 = v16;
        _os_log_impl(&dword_1C3607000, v15, OS_LOG_TYPE_DEFAULT, "SGPipeline verificationOperation: DKIM verification resulted in permanent failure: %@. [SGPipelineEntity (%{public}@)]", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 32), "enrichments");
      v11 = objc_claimAutoreleasedReturnValue();
      sgFilter();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setEnrichments:", v17);

    }
    else
    {
      sgEventsLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "loggingIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v23 = v14;
        _os_log_impl(&dword_1C3607000, v11, OS_LOG_TYPE_DEFAULT, "SGPipeline verificationOperation: Successfully verified DKIM signature. [SGPipelineEntity (%{public}@)]", buf, 0xCu);

      }
    }
    v13 = 0;
LABEL_23:

    goto LABEL_24;
  }
LABEL_25:
  if (v5)
    v5[2](v5);

}

void __80__SGPipeline_verificationOperation_overrideVerificationStatus_withDependencies___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "harvestMetrics");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endTimer:significantWork:", kHarvestMetricsVerificationTimer, *(unsigned __int8 *)(a1 + 40));

}

uint64_t __80__SGPipeline_verificationOperation_overrideVerificationStatus_withDependencies___block_invoke_114(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEvent") ^ 1;
}

void __48__SGPipeline_geocodeOperation_withDependencies___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *context;
  char v21;
  NSObject *group;
  _QWORD v23[4];
  id v24;
  void *v25;
  NSObject *v26;
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

  v37 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(*(id *)(a1 + 32), "harvestMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startTimer:", kHarvestMetricsGeocodingTimer);

  group = dispatch_group_create();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v19 = a1;
  objc_msgSend(*(id *)(a1 + 32), "enrichments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v4)
  {
    v5 = v4;
    v21 = 0;
    v6 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v32 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1C3BD4F6C]();
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        objc_msgSend(v8, "tags");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v28;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v28 != v13)
                objc_enumerationMutation(v10);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "isExtractedEventCategory") & 1) != 0)
              {

                if ((objc_msgSend(MEMORY[0x1E0D198F0], "allowGeocode") & 1) != 0)
                {
                  +[SGStorageEvent storageEventFromEntity:](SGStorageEvent, "storageEventFromEntity:", v8);
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  dispatch_group_enter(group);
                  v16 = (void *)MEMORY[0x1E0D19810];
                  v23[0] = MEMORY[0x1E0C809B0];
                  v23[1] = 3221225472;
                  v23[2] = __48__SGPipeline_geocodeOperation_withDependencies___block_invoke_2;
                  v23[3] = &unk_1E7DB19E8;
                  v24 = v15;
                  v25 = v8;
                  v26 = group;
                  v17 = v15;
                  objc_msgSend(v16, "geocodeEvent:withCallback:", v17, v23);

                  v21 = 1;
                }
                else
                {
                  objc_msgSend(v8, "setPendingGeocode:", 1);
                }
                goto LABEL_18;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            if (v12)
              continue;
            break;
          }
        }

LABEL_18:
        objc_autoreleasePoolPop(v9);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v5);
  }
  else
  {
    v21 = 0;
  }

  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(*(id *)(v19 + 32), "harvestMetrics");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "endTimer:significantWork:", kHarvestMetricsGeocodingTimer, v21 & 1);

  objc_autoreleasePoolPop(context);
}

void __48__SGPipeline_geocodeOperation_withDependencies___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v11 = a2;
  if ((objc_msgSend(v11, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "locations");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeAllObjects");

    objc_msgSend(*(id *)(a1 + 40), "locations");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "locations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v5);

    objc_msgSend(v11, "when");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setTimeRange:", v6);

    objc_msgSend(*(id *)(a1 + 40), "tags");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D197F0], "allDay");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "containsObject:", v8);

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 40), "timeRange");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "isValidAllDayRange") & 1) == 0)
        __assert_rtn("-[SGPipeline geocodeOperation:withDependencies:]_block_invoke_2", "SGPipeline.m", 497, "[enrichment.timeRange isValidAllDayRange]");

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

id __63__SGPipeline_dissectOperationsForInteraction_entity_inContext___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF90E108))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __63__SGPipeline_dissectOperationsForInteraction_entity_inContext___block_invoke_2;
    v6[3] = &unk_1E7DB77B0;
    v7 = v3;
    v8 = a1[4];
    v9 = a1[5];
    v10 = a1[6];
    v4 = (void *)MEMORY[0x1C3BD5158](v6);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __63__SGPipeline_dissectOperationsForInteraction_entity_inContext___block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(*(id *)(a1 + 32), "dissectInteraction:entity:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  objc_autoreleasePoolPop(v2);
}

id __63__SGPipeline_dissectOperationsForTextMessage_entity_inContext___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF8E75E0))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __63__SGPipeline_dissectOperationsForTextMessage_entity_inContext___block_invoke_2;
    v6[3] = &unk_1E7DB77B0;
    v7 = v3;
    v8 = a1[4];
    v9 = a1[5];
    v10 = a1[6];
    v4 = (void *)MEMORY[0x1C3BD5158](v6);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __63__SGPipeline_dissectOperationsForTextMessage_entity_inContext___block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(*(id *)(a1 + 32), "dissectTextMessage:entity:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  objc_autoreleasePoolPop(v2);
}

id __63__SGPipeline_dissectOperationsForMailMessage_entity_inContext___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF8E7558))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __63__SGPipeline_dissectOperationsForMailMessage_entity_inContext___block_invoke_2;
    v6[3] = &unk_1E7DB77B0;
    v7 = v3;
    v8 = a1[4];
    v9 = a1[5];
    v10 = a1[6];
    v4 = (void *)MEMORY[0x1C3BD5158](v6);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __63__SGPipeline_dissectOperationsForMailMessage_entity_inContext___block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(*(id *)(a1 + 32), "dissectMailMessage:entity:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  objc_autoreleasePoolPop(v2);
}

void __39__SGPipeline__dissectOperations_block___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "harvestMetrics");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "startTimer:", kHarvestMetricsDissectorTimer);

}

void __39__SGPipeline__dissectOperations_block___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "harvestMetrics");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = kHarvestMetricsDissectorTimer;
  objc_msgSend(*(id *)(a1 + 32), "enrichments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  objc_msgSend(*(id *)(a1 + 32), "externalEnrichments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endTimer:significantWork:", v2, v4 + objc_msgSend(v5, "count") != 0);

}

void __39__SGPipeline__dissectOperations_block___block_invoke_3(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v16[3];

  v2 = (void *)MEMORY[0x1C3BD4F6C]();
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 40), "acquireDissectorLock");
  objc_msgSend(*(id *)(a1 + 40), "harvestMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startTimer:", v4);

  objc_msgSend(*(id *)(a1 + 40), "enrichments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  objc_msgSend(*(id *)(a1 + 40), "externalEnrichments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  v16[2] = 0;
  v15 = v4;
  v16[0] = v15;
  v16[1] = mach_absolute_time();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  SGRecordMeasurementState(v16);
  objc_msgSend(*(id *)(a1 + 40), "enrichments");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  objc_msgSend(*(id *)(a1 + 40), "externalEnrichments");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  objc_msgSend(*(id *)(a1 + 40), "harvestMetrics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "endTimer:significantWork:", v15, v9 + v7 < (unint64_t)(v13 + v11));

  objc_msgSend(*(id *)(a1 + 40), "releaseDissectorLock");
  SGRecordMeasurementState(v16);

}

void __39__SGPipeline__dissectOperations_block___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v12, (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addDependency:", v14);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
}

+ (void)initialize
{
  dispatch_source_t v2;
  void *v3;
  NSObject *v4;

  if ((id)objc_opt_class() == a1)
  {
    if (initialize__pasOnceToken3 != -1)
      dispatch_once(&initialize__pasOnceToken3, &__block_literal_global_26252);
    v4 = (id)initialize__pasExprOnceResult;
    v2 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 0x37uLL, v4);
    v3 = (void *)memoryPressureSource;
    memoryPressureSource = (uint64_t)v2;

    dispatch_source_set_event_handler((dispatch_source_t)memoryPressureSource, &__block_literal_global_10);
    dispatch_resume((dispatch_object_t)memoryPressureSource);

  }
}

+ (void)_resetCachesAndModels
{
  objc_msgSend(MEMORY[0x1E0D1CF38], "resetSharedCachesAndModels");
}

+ (void)_delayedResetCachesAndModels
{
  NSObject *v2;
  int64_t data;
  double v4;
  NSObject *v5;
  dispatch_time_t v6;
  _QWORD block[5];
  uint8_t buf[4];
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SGPipeline__delayedResetCachesAndModels__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_delayedResetCachesAndModels__pasOnceToken4 != -1)
    dispatch_once(&_delayedResetCachesAndModels__pasOnceToken4, block);
  v2 = (id)_delayedResetCachesAndModels__pasExprOnceResult;
  dispatch_suspend(v2);
  data = dispatch_source_get_data((dispatch_source_t)memoryPressureSource);
  if (data > 15)
  {
    if (data != 32)
    {
      if (data == 16)
      {
        v4 = 0.1;
        goto LABEL_13;
      }
      goto LABEL_12;
    }
LABEL_10:
    v4 = 0.0;
    goto LABEL_13;
  }
  if (data == 2)
  {
    v4 = 1.0;
    goto LABEL_13;
  }
  if (data == 4)
    goto LABEL_10;
LABEL_12:
  v4 = 10.0;
LABEL_13:
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v9 = v4;
    _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "Setting a timer to reset DDNL caches in %f seconds", buf, 0xCu);
  }

  if (v4 <= 0.0)
    v6 = 0;
  else
    v6 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
  dispatch_source_set_timer(v2, v6, 0xFFFFFFFFFFFFFFFFLL, 1000000000 * (unint64_t)(v4 / 10.0));
  dispatch_resume(v2);

}

+ (id)sharedBackgroundProcessingQueue
{
  if (sharedBackgroundProcessingQueue_onceToken != -1)
    dispatch_once(&sharedBackgroundProcessingQueue_onceToken, &__block_literal_global_14_26245);
  return (id)sharedBackgroundProcessingQueue_queue;
}

+ (id)sharedBackgroundStorageQueue
{
  if (sharedBackgroundStorageQueue_onceToken != -1)
    dispatch_once(&sharedBackgroundStorageQueue_onceToken, &__block_literal_global_17_26241);
  return (id)sharedBackgroundStorageQueue_queue;
}

+ (id)dependencyClassesForDissectorClass:(Class)a3
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[9];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  v26[2] = objc_opt_class();
  v26[3] = objc_opt_class();
  v26[4] = objc_opt_class();
  v26[5] = objc_opt_class();
  v26[6] = objc_opt_class();
  v26[7] = objc_opt_class();
  v26[8] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v9)
        objc_enumerationMutation(v6);
      if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10)) & 1) != 0)
        goto LABEL_25;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v27, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }

  if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
  {
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    v11 = (void *)MEMORY[0x1E0C99D20];
    v12 = v25;
LABEL_15:
    v13 = 2;
    goto LABEL_16;
  }
  if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
  {
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    v11 = (void *)MEMORY[0x1E0C99D20];
    v12 = v24;
    goto LABEL_15;
  }
  if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
  {
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v11 = (void *)MEMORY[0x1E0C99D20];
    v12 = v23;
    goto LABEL_15;
  }
  if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
  {
    v22 = objc_opt_class();
    v11 = (void *)MEMORY[0x1E0C99D20];
    v12 = &v22;
  }
  else if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
  {
    v21 = objc_opt_class();
    v11 = (void *)MEMORY[0x1E0C99D20];
    v12 = &v21;
  }
  else
  {
    if (!-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGPipeline.m"), 235, CFSTR("Dependencies unknown for dissector class: %@"), a3);
LABEL_25:

      v14 = 0;
      return v14;
    }
    v20 = objc_opt_class();
    v11 = (void *)MEMORY[0x1E0C99D20];
    v12 = &v20;
  }
  v13 = 1;
LABEL_16:
  objc_msgSend(v11, "arrayWithObjects:count:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  return v14;
}

+ (id)parallelPipeline:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  void (**v20)(_QWORD, _QWORD);
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (_QWORD *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v32;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1C3BD4F6C]();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, objc_opt_class());
        objc_msgSend(v5, "addObject:", objc_opt_class());
        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v9);
  }

  v14 = v5;
  v15 = (void *)objc_opt_new();
  v16 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __31__SGPipeline_parallelPipeline___block_invoke;
  v29[3] = &unk_1E7DB18C8;
  v17 = v6;
  v30 = v17;
  v26[0] = v16;
  v26[1] = 3221225472;
  v26[2] = __31__SGPipeline_parallelPipeline___block_invoke_2;
  v26[3] = &unk_1E7DB18F0;
  v18 = (id)MEMORY[0x1C3BD5158](v29);
  v28 = v18;
  v19 = v15;
  v27 = v19;
  v20 = (void (**)(_QWORD, _QWORD))MEMORY[0x1C3BD5158](v26);
  v21 = v14;
  if (objc_msgSend(v14, "count"))
  {
    v22 = v14;
    do
    {
      ((void (**)(_QWORD, void *))v20)[2](v20, v22);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = v21;
    }
    while (objc_msgSend(v21, "count"));
  }
  v23 = (void *)v4[1];
  v4[1] = v19;
  v24 = v19;

  return v4;
}

+ (id)customPipeline:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      v11 = v8;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
        v13 = (void *)MEMORY[0x1C3BD4F6C](v6);
        if (v11)
        {
          v22 = v11;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v12);

        }
        else
        {
          objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA60], v12, (_QWORD)v18);
        }
        v8 = v12;

        objc_autoreleasePoolPop(v13);
        ++v10;
        v11 = v8;
      }
      while (v7 != v10);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      v7 = v6;
    }
    while (v6);
  }
  else
  {
    v8 = 0;
  }

  v15 = (_QWORD *)objc_opt_new();
  v16 = (void *)v15[1];
  v15[1] = v4;

  return v15;
}

+ (id)emptyPipeline
{
  return (id)objc_msgSend(a1, "customPipeline:", MEMORY[0x1E0C9AA60]);
}

+ (id)fullPipeline
{
  if (fullPipeline_once != -1)
    dispatch_once(&fullPipeline_once, &__block_literal_global_45);
  return (id)fullPipeline_pipeline;
}

+ (id)retrainingPipeline
{
  if (retrainingPipeline__pasOnceToken6 != -1)
    dispatch_once(&retrainingPipeline__pasOnceToken6, &__block_literal_global_46);
  return (id)retrainingPipeline__pasExprOnceResult;
}

+ (id)remindersTestingPipeline
{
  if (remindersTestingPipeline__pasOnceToken7 != -1)
    dispatch_once(&remindersTestingPipeline__pasOnceToken7, &__block_literal_global_47_26222);
  return (id)remindersTestingPipeline__pasExprOnceResult;
}

+ (id)remindersTestingPipelineWithCustomReminderDissector:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGPipeline customPipeline:](SGPipeline, "customPipeline:", v5, v8, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)deliveriesTestingPipeline
{
  if (deliveriesTestingPipeline__pasOnceToken8 != -1)
    dispatch_once(&deliveriesTestingPipeline__pasOnceToken8, &__block_literal_global_48_26219);
  return (id)deliveriesTestingPipeline__pasExprOnceResult;
}

void __39__SGPipeline_deliveriesTestingPipeline__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = (void *)objc_opt_new();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGPipeline customPipeline:](SGPipeline, "customPipeline:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)deliveriesTestingPipeline__pasExprOnceResult;
  deliveriesTestingPipeline__pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v0);
}

void __38__SGPipeline_remindersTestingPipeline__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = (void *)objc_opt_new();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGPipeline customPipeline:](SGPipeline, "customPipeline:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)remindersTestingPipeline__pasExprOnceResult;
  remindersTestingPipeline__pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v0);
}

void __32__SGPipeline_retrainingPipeline__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = (void *)objc_opt_new();
  v6[0] = v1;
  v2 = (void *)objc_opt_new();
  v6[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGPipeline customPipeline:](SGPipeline, "customPipeline:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)retrainingPipeline__pasExprOnceResult;
  retrainingPipeline__pasExprOnceResult = v4;

  objc_autoreleasePoolPop(v0);
}

void __26__SGPipeline_fullPipeline__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[14];

  v16[13] = *MEMORY[0x1E0C80C00];
  v15 = (void *)objc_opt_new();
  v16[0] = v15;
  v14 = (void *)objc_opt_new();
  v16[1] = v14;
  v13 = (void *)objc_opt_new();
  v16[2] = v13;
  v12 = (void *)objc_opt_new();
  v16[3] = v12;
  v0 = (void *)objc_opt_new();
  v16[4] = v0;
  v1 = (void *)objc_opt_new();
  v16[5] = v1;
  v2 = (void *)objc_opt_new();
  v16[6] = v2;
  +[SGMessageEventDissector sharedInstance](SGMessageEventDissector, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[7] = v3;
  +[SGNaturalLanguageDissector sharedInstance](SGNaturalLanguageDissector, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[8] = v4;
  +[SGReminderDissector sharedInstance](SGReminderDissector, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[9] = v5;
  v6 = (void *)objc_opt_new();
  v16[10] = v6;
  v7 = (void *)objc_opt_new();
  v16[11] = v7;
  v8 = (void *)objc_opt_new();
  v16[12] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[SGPipeline parallelPipeline:](SGPipeline, "parallelPipeline:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)fullPipeline_pipeline;
  fullPipeline_pipeline = v10;

}

id __31__SGPipeline_parallelPipeline___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = *(void **)(a1 + 32);
    v4 = (void *)objc_opt_new();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, a2);
  }
  return v4;
}

id __31__SGPipeline_parallelPipeline___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *context;
  uint64_t v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v25 = (id)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v3;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v21)
  {
    v20 = *(_QWORD *)v31;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v31 != v20)
          objc_enumerationMutation(obj);
        v24 = v4;
        v22 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v4);
        context = (void *)MEMORY[0x1C3BD4F6C]();
        +[SGPipeline dependencyClassesForDissectorClass:](SGPipeline, "dependencyClassesForDissectorClass:", v22);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v7 = v5;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v27;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v27 != v10)
                objc_enumerationMutation(v7);
              v12 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v11);
              v13 = (void *)MEMORY[0x1C3BD4F6C]();
              (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "addObject:", v14);
              objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v15)
                objc_msgSend(v25, "addObject:", v12);

              objc_autoreleasePoolPop(v13);
              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          }
          while (v9);
        }

        v16 = *(void **)(a1 + 32);
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v6, v17);

        objc_autoreleasePoolPop(context);
        v4 = v24 + 1;
      }
      while (v24 + 1 != v21);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v21);
  }

  return v25;
}

uint64_t __42__SGPipeline_sharedBackgroundStorageQueue__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedBackgroundStorageQueue_queue;
  sharedBackgroundStorageQueue_queue = v0;

  objc_msgSend((id)sharedBackgroundStorageQueue_queue, "setMaxConcurrentOperationCount:", 1);
  return objc_msgSend((id)sharedBackgroundStorageQueue_queue, "setName:", CFSTR("+[SGPipeline sharedBackgroundStorageQueue]"));
}

uint64_t __45__SGPipeline_sharedBackgroundProcessingQueue__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedBackgroundProcessingQueue_queue;
  sharedBackgroundProcessingQueue_queue = v0;

  objc_msgSend((id)sharedBackgroundProcessingQueue_queue, "setMaxConcurrentOperationCount:", -1);
  return objc_msgSend((id)sharedBackgroundProcessingQueue_queue, "setName:", CFSTR("+[SGPipeline sharedBackgroundProcessingQueue]"));
}

void __42__SGPipeline__delayedResetCachesAndModels__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  _QWORD handler[5];

  v2 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "SGPipeline-_delayedResetCachesAndModels", 17);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v3);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __42__SGPipeline__delayedResetCachesAndModels__block_invoke_2;
  handler[3] = &__block_descriptor_40_e5_v8__0l;
  handler[4] = *(_QWORD *)(a1 + 32);
  dispatch_source_set_event_handler(v4, handler);
  dispatch_resume(v4);

  v5 = (void *)_delayedResetCachesAndModels__pasExprOnceResult;
  _delayedResetCachesAndModels__pasExprOnceResult = (uint64_t)v4;

  objc_autoreleasePoolPop(v2);
}

uint64_t __42__SGPipeline__delayedResetCachesAndModels__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetCachesAndModels");
}

uint64_t __24__SGPipeline_initialize__block_invoke_2()
{
  return +[SGPipeline _delayedResetCachesAndModels](SGPipeline, "_delayedResetCachesAndModels");
}

void __24__SGPipeline_initialize__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "SGPipeline-_resetCachesAndModels-pressure", 17);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)initialize__pasExprOnceResult;
  initialize__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

@end
