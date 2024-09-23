@implementation _MPSSILImplementation

- (_MPSSILImplementation)initWithSectionedIdentifierList:(id)a3 randomSource:(id)a4 startingItemEntry:(id)a5 withExclusiveAccessToken:(id)a6
{
  id v10;
  MPARC4RandomSource *v11;
  id v12;
  id v13;
  void *v14;
  _MPSSILImplementation *v15;
  _MPSSILImplementationInitToken *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSMutableArray *candidateItems;
  void *v21;
  _MPSSILImplementation *v22;
  _MPSSILImplementationInitToken *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  uint64_t v35;
  MPRandomDistribution *v36;
  MPARC4RandomSource *v37;
  uint64_t v38;
  MPRandomDistribution *randomDistribution;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v46;
  MPARC4RandomSource *v47;
  id v48;
  _MPSSILImplementationInitToken *v49;
  _MPSSILImplementation *v50;
  _QWORD v51[4];
  _MPSSILImplementation *v52;
  _MPSSILImplementationInitToken *v53;
  objc_super v54;
  _QWORD v55[2];

  v55[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (MPARC4RandomSource *)a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v54.receiver = self;
  v54.super_class = (Class)_MPSSILImplementation;
  v15 = -[MPSectionedIdentifierList initWithIdentifier:](&v54, sel_initWithIdentifier_, v14);

  v50 = v15;
  if (v15)
  {
    v47 = v11;
    v16 = objc_alloc_init(_MPSSILImplementationInitToken);
    +[MPSectionedIdentifierListHeadEntry headEntryWithSectionIdentifier:](MPSectionedIdentifierListHeadEntry, "headEntryWithSectionIdentifier:", CFSTR("🔀"));
    v17 = objc_claimAutoreleasedReturnValue();
    -[MPSectionedIdentifierList _sectionHeadEntryMapWithExclusiveAccessToken:](v15, "_sectionHeadEntryMapWithExclusiveAccessToken:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, CFSTR("🔀"));

    v46 = (void *)v17;
    -[MPSectionedIdentifierList _insertDataSourceHead:afterEntry:withExclusiveAccessToken:](v50, "_insertDataSourceHead:afterEntry:withExclusiveAccessToken:", v17, 0, v16);
    objc_msgSend(v13, "assertHasExclusiveAccessForOwner:", v10);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "_itemCountWithExclusiveAccessToken:", v13));
    candidateItems = v50->_candidateItems;
    v50->_candidateItems = (NSMutableArray *)v19;

    objc_msgSend(v10, "_sectionHeadEntryMapWithExclusiveAccessToken:", v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __113___MPSSILImplementation_initWithSectionedIdentifierList_randomSource_startingItemEntry_withExclusiveAccessToken___block_invoke;
    v51[3] = &unk_1E3153FF0;
    v22 = v50;
    v52 = v22;
    v23 = v16;
    v53 = v23;
    objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v51);

    v48 = v10;
    objc_msgSend(v10, "enumeratorWithOptions:startPosition:endPosition:withExclusiveAccessToken:", 0x1000000, 0, 0, v13);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "nextObjectWithExclusiveAccessToken:", v13);
    v25 = objc_claimAutoreleasedReturnValue();
    v49 = v23;
    if (v25)
    {
      v26 = (void *)v25;
      while (objc_msgSend(v26, "entryType") != 3)
      {
LABEL_13:
        objc_msgSend(v24, "nextObjectWithExclusiveAccessToken:", v13);
        v35 = objc_claimAutoreleasedReturnValue();

        v26 = (void *)v35;
        if (!v35)
          goto LABEL_14;
      }
      objc_msgSend(v26, "itemResult");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "itemIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "itemResult");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "sectionIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "sectionIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v30, "isEqual:", v31) & 1) != 0)
      {
        objc_msgSend(v12, "itemIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v28, "isEqual:", v32);

        v23 = v49;
        if ((v33 & 1) != 0)
        {
LABEL_12:

          goto LABEL_13;
        }
      }
      else
      {

      }
      -[_MPSSILImplementation _createShuffleCloneForItem:inSection:withExclusiveAccessToken:](v22, "_createShuffleCloneForItem:inSection:withExclusiveAccessToken:", v28, v30, v23);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34)
        -[NSMutableArray addObject:](v50->_candidateItems, "addObject:", v34);

      goto LABEL_12;
    }
LABEL_14:
    v36 = [MPRandomDistribution alloc];
    v11 = v47;
    v37 = v47;
    if (!v47)
      v37 = objc_alloc_init(MPARC4RandomSource);
    v38 = -[MPRandomDistribution initWithRandomSource:lowestValue:highestValue:](v36, "initWithRandomSource:lowestValue:highestValue:", v37, 0, 0x7FFFFFFFLL);
    randomDistribution = v22->_randomDistribution;
    v22->_randomDistribution = (MPRandomDistribution *)v38;

    if (!v47)
    v40 = +[MPShuffleableSectionedIdentifierList initialCandidateDequeueQuota](MPShuffleableSectionedIdentifierList, "initialCandidateDequeueQuota");
    if (v12)
    {
      objc_msgSend(v12, "itemIdentifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sectionIdentifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MPSSILImplementation _createShuffleCloneForItem:inSection:withExclusiveAccessToken:](v22, "_createShuffleCloneForItem:inSection:withExclusiveAccessToken:", v41, v42, v49);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = v49;
      v55[0] = v43;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MPSSILImplementation _appendShuffledItems:withExclusiveAccessToken:](v22, "_appendShuffledItems:withExclusiveAccessToken:", v44, v49);

      if (v40 >= 2)
        -[_MPSSILImplementation _dequeueCandidatesWithQuota:withExclusiveAccessToken:](v22, "_dequeueCandidatesWithQuota:withExclusiveAccessToken:", v40 - 1, v49);

    }
    else
    {
      -[_MPSSILImplementation _dequeueCandidatesWithQuota:withExclusiveAccessToken:](v22, "_dequeueCandidatesWithQuota:withExclusiveAccessToken:", v40, v23);
    }

    v10 = v48;
  }

  return v50;
}

- (_MPSSILImplementation)initWithCoder:(id)a3
{
  id v4;
  _MPSSILImplementation *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSMutableArray *candidateItems;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  MPRandomDistribution *randomDistribution;
  _MPSSILImplementationInitToken *v25;
  _MPSSILImplementation *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)_MPSSILImplementation;
  v5 = -[MPSectionedIdentifierList initWithCoder:](&v32, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v4;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("cani"));
    v9 = objc_claimAutoreleasedReturnValue();
    candidateItems = v5->_candidateItems;
    v5->_candidateItems = (NSMutableArray *)v9;

    v25 = objc_alloc_init(_MPSSILImplementationInitToken);
    -[MPSectionedIdentifierList _sectionHeadEntryMapWithExclusiveAccessToken:](v5, "_sectionHeadEntryMapWithExclusiveAccessToken:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v26 = v5;
    v12 = v5->_candidateItems;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v17, "sectionIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "identifiersItemEntryMap");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "itemIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v17, v21);

        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v14);
    }

    v4 = v27;
    objc_msgSend(v27, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rand"));
    v22 = objc_claimAutoreleasedReturnValue();
    v5 = v26;
    randomDistribution = v26->_randomDistribution;
    v26->_randomDistribution = (MPRandomDistribution *)v22;

  }
  return v5;
}

- (void)_beforeInitWithCoder:(id)a3
{
  id v4;
  _MPSSILImplementationInitToken *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_MPSSILImplementation;
  -[MPSectionedIdentifierList _beforeInitWithCoder:](&v22, sel__beforeInitWithCoder_, v4);
  v5 = objc_alloc_init(_MPSSILImplementationInitToken);
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("ssh"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSectionedIdentifierList _sectionHeadEntryMapWithExclusiveAccessToken:](self, "_sectionHeadEntryMapWithExclusiveAccessToken:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v16, "sectionIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, v17);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v13);
  }

}

- (void)encodeWithCoder:(id)a3 withExclusiveAccessToken:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  objc_super v16;

  v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_MPSSILImplementation;
  v7 = a3;
  -[MPSectionedIdentifierList encodeWithCoder:withExclusiveAccessToken:](&v16, sel_encodeWithCoder_withExclusiveAccessToken_, v7, v6);
  objc_msgSend(v6, "assertHasExclusiveAccessForOwner:", self);
  objc_msgSend(v7, "encodeObject:forKey:", self->_candidateItems, CFSTR("cani"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_randomDistribution, CFSTR("rand"));
  -[MPSectionedIdentifierList _sectionHeadEntryMapWithExclusiveAccessToken:](self, "_sectionHeadEntryMapWithExclusiveAccessToken:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count") - 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66___MPSSILImplementation_encodeWithCoder_withExclusiveAccessToken___block_invoke;
  v13[3] = &unk_1E3154018;
  v13[4] = self;
  v14 = v6;
  v15 = v9;
  v10 = v9;
  v11 = v6;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v13);
  v12 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v7, "encodeObject:forKey:", v12, CFSTR("ssh"));

}

- (void)dequeueCandidatesWithQuota:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52___MPSSILImplementation_dequeueCandidatesWithQuota___block_invoke;
  v3[3] = &unk_1E3154040;
  v3[4] = self;
  v3[5] = a3;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v3);
}

- (void)safelyReshuffleAfterItem:(id)a3 inSection:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60___MPSSILImplementation_safelyReshuffleAfterItem_inSection___block_invoke;
  v10[3] = &unk_1E315E1B0;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v10);

}

- (void)addDataSourceAtStart:(id)a3 section:(id)a4 sequentially:(BOOL)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  BOOL v15;

  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67___MPSSILImplementation_addDataSourceAtStart_section_sequentially___block_invoke;
  v12[3] = &unk_1E3153F00;
  v15 = a5;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v12);

}

- (void)addDataSource:(id)a3 section:(id)a4 sequentially:(BOOL)a5 afterItem:(id)a6 inSection:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  BOOL v25;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __80___MPSSILImplementation_addDataSource_section_sequentially_afterItem_inSection___block_invoke;
  v20[3] = &unk_1E3153F28;
  v25 = a5;
  v20[4] = self;
  v21 = v15;
  v22 = v14;
  v23 = v12;
  v24 = v13;
  v16 = v13;
  v17 = v12;
  v18 = v14;
  v19 = v15;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v20);

}

- (void)addDataSource:(id)a3 section:(id)a4 sequentially:(BOOL)a5 afterTailOfSection:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  BOOL v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __79___MPSSILImplementation_addDataSource_section_sequentially_afterTailOfSection___block_invoke;
  v16[3] = &unk_1E3153F50;
  v20 = a5;
  v16[4] = self;
  v17 = v12;
  v18 = v10;
  v19 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v12;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v16);

}

- (void)addDataSource:(id)a3 section:(id)a4 sequentially:(BOOL)a5 beforeTailOfSection:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  BOOL v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __80___MPSSILImplementation_addDataSource_section_sequentially_beforeTailOfSection___block_invoke;
  v16[3] = &unk_1E3153F50;
  v20 = a5;
  v16[4] = self;
  v17 = v12;
  v18 = v10;
  v19 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v12;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v16);

}

- (void)addDataSourceAtEnd:(id)a3 section:(id)a4 sequentially:(BOOL)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  BOOL v15;

  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65___MPSSILImplementation_addDataSourceAtEnd_section_sequentially___block_invoke;
  v12[3] = &unk_1E3153F00;
  v15 = a5;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v12);

}

- (void)dataSourceInsertItemsAtHead:(id)a3 inSection:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_super v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPShuffleableSectionedIdentifierList.m"), 636, CFSTR("Invalid insertion (no item identifiers) in section: %@"), v8);

  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63___MPSSILImplementation_dataSourceInsertItemsAtHead_inSection___block_invoke;
  v13[3] = &unk_1E3153F78;
  v13[4] = self;
  v9 = v8;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  if (-[MPSectionedIdentifierList performWithExclusiveAccessAndReturnBOOL:](self, "performWithExclusiveAccessAndReturnBOOL:", v13))
  {
    v12.receiver = self;
    v12.super_class = (Class)_MPSSILImplementation;
    -[MPSectionedIdentifierList dataSourceInsertItemsAtHead:inSection:](&v12, sel_dataSourceInsertItemsAtHead_inSection_, v10, v9);
  }

}

- (void)dataSourceInsertItems:(id)a3 afterItem:(id)a4 inSection:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  objc_super v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPShuffleableSectionedIdentifierList.m"), 655, CFSTR("Invalid insertion (no item identifiers) in section: %@"), v11);

  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __67___MPSSILImplementation_dataSourceInsertItems_afterItem_inSection___block_invoke;
  v16[3] = &unk_1E3153F78;
  v16[4] = self;
  v12 = v11;
  v17 = v12;
  v13 = v9;
  v18 = v13;
  if (-[MPSectionedIdentifierList performWithExclusiveAccessAndReturnBOOL:](self, "performWithExclusiveAccessAndReturnBOOL:", v16))
  {
    v15.receiver = self;
    v15.super_class = (Class)_MPSSILImplementation;
    -[MPSectionedIdentifierList dataSourceInsertItems:afterItem:inSection:](&v15, sel_dataSourceInsertItems_afterItem_inSection_, v13, v10, v12);
  }

}

- (void)dataSourceInsertItemsAtTail:(id)a3 inSection:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_super v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPShuffleableSectionedIdentifierList.m"), 674, CFSTR("Invalid insertion (no item identifiers) in section: %@"), v8);

  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63___MPSSILImplementation_dataSourceInsertItemsAtTail_inSection___block_invoke;
  v13[3] = &unk_1E3153F78;
  v13[4] = self;
  v9 = v8;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  if (-[MPSectionedIdentifierList performWithExclusiveAccessAndReturnBOOL:](self, "performWithExclusiveAccessAndReturnBOOL:", v13))
  {
    v12.receiver = self;
    v12.super_class = (Class)_MPSSILImplementation;
    -[MPSectionedIdentifierList dataSourceInsertItemsAtTail:inSection:](&v12, sel_dataSourceInsertItemsAtTail_inSection_, v10, v9);
  }

}

- (void)dataSourceRemoveItems:(id)a3 fromSection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  objc_super v12;
  _QWORD v13[4];
  id v14;
  _MPSSILImplementation *v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59___MPSSILImplementation_dataSourceRemoveItems_fromSection___block_invoke;
  v13[3] = &unk_1E315E340;
  v9 = v6;
  v14 = v9;
  v15 = self;
  v10 = v7;
  v16 = v10;
  v11 = v8;
  v17 = v11;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v13);
  if (objc_msgSend(v11, "count"))
  {
    v12.receiver = self;
    v12.super_class = (Class)_MPSSILImplementation;
    -[MPSectionedIdentifierList dataSourceRemoveItems:fromSection:](&v12, sel_dataSourceRemoveItems_fromSection_, v11, v10);
  }

}

- (void)dataSourceReloadItems:(id)a3 inSection:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57___MPSSILImplementation_dataSourceReloadItems_inSection___block_invoke;
  v10[3] = &unk_1E315E1B0;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v10);

}

- (int64_t)itemCount
{
  int64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34___MPSSILImplementation_itemCount__block_invoke;
  v4[3] = &unk_1E315E2C8;
  v4[4] = self;
  v4[5] = &v5;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](self, "performWithExclusiveAccess:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_enumerator:(id)a3 didEncounterEntry:(id)a4 withExclusiveAccessToken:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a4;
  v7 = a5;
  objc_msgSend(v7, "assertHasExclusiveAccessForOwner:", self);
  objc_msgSend(v10, "nextEntries");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfObjectPassingTest:", &__block_literal_global_4856);

  if (v9 == 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v10, "branchDepth") <= 1)
    -[_MPSSILImplementation _dequeueCandidatesWithQuota:withExclusiveAccessToken:](self, "_dequeueCandidatesWithQuota:withExclusiveAccessToken:", +[MPShuffleableSectionedIdentifierList enumerationCandidateDequeueQuota](MPShuffleableSectionedIdentifierList, "enumerationCandidateDequeueQuota"), v7);

}

- (BOOL)_isSequentialSection:(id)a3 withExclusiveAccessToken:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "assertHasExclusiveAccessForOwner:", self);
  -[MPSectionedIdentifierList _sectionHeadEntryMapWithExclusiveAccessToken:](self, "_sectionHeadEntryMapWithExclusiveAccessToken:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "previousEntry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = 1;
  }
  else
  {
    -[MPSectionedIdentifierList _startEntriesWithExclusiveAccessToken:](self, "_startEntriesWithExclusiveAccessToken:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v12, "containsObject:", v9);

  }
  return v11;
}

- (void)_reverseEnumeratorWillStartAtEnd:(id)a3 withExclusiveAccessToken:(id)a4
{
  id v5;

  v5 = a4;
  objc_msgSend(v5, "assertHasExclusiveAccessForOwner:", self);
  -[_MPSSILImplementation _dequeueCandidatesWithQuota:withExclusiveAccessToken:](self, "_dequeueCandidatesWithQuota:withExclusiveAccessToken:", -[NSMutableArray count](self->_candidateItems, "count"), v5);

}

- (void)_addShuffleSection:(id)a3 dataSource:(id)a4 withExclusiveAccessToken:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "assertHasExclusiveAccessForOwner:", self);
  +[MPSectionedIdentifierListHeadEntry headEntryWithSectionIdentifier:](MPSectionedIdentifierListHeadEntry, "headEntryWithSectionIdentifier:", v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDataSource:", v9);

  objc_msgSend(v12, "setShuffledHead:", 1);
  -[MPSectionedIdentifierList _sectionHeadEntryMapWithExclusiveAccessToken:](self, "_sectionHeadEntryMapWithExclusiveAccessToken:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, v10);
}

- (void)_appendShuffledItems:(id)a3 withExclusiveAccessToken:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v7 = a4;
  -[MPSectionedIdentifierList _sectionHeadEntryMapWithExclusiveAccessToken:](self, "_sectionHeadEntryMapWithExclusiveAccessToken:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("🔀"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "assertHasExclusiveAccessForOwner:", self);
  self->super._itemCount += objc_msgSend(v15, "count");
  +[MPSectionedIdentifierListPosition positionForTailOfSection:](MPSectionedIdentifierListPosition, "positionForTailOfSection:", CFSTR("🔀"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSectionedIdentifierList enumeratorWithOptions:startPosition:endPosition:withExclusiveAccessToken:](self, "enumeratorWithOptions:startPosition:endPosition:withExclusiveAccessToken:", 11, v10, 0, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "nextObjectWithExclusiveAccessToken:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPShuffleableSectionedIdentifierList.m"), 800, CFSTR("MPSSIL unexpected enumeration result: %@"), objc_opt_class());

  }
  -[MPSectionedIdentifierList _addBranchToEntry:entries:withExclusiveAccessToken:](self, "_addBranchToEntry:entries:withExclusiveAccessToken:", v12, v15, v7);
  objc_msgSend(v15, "lastObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLastItemEntry:", v13);

}

- (id)_createShuffleCloneForItem:(id)a3 inSection:(id)a4 withExclusiveAccessToken:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "assertHasExclusiveAccessForOwner:", self);
  +[MPSectionedIdentifierListItemEntry itemEntryWithSectionIdentifier:itemIdentifier:](MPSectionedIdentifierListItemEntry, "itemEntryWithSectionIdentifier:itemIdentifier:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHostedSectionIdentifier:", CFSTR("🔀"));
  -[MPSectionedIdentifierList _sectionHeadEntryMapWithExclusiveAccessToken:](self, "_sectionHeadEntryMapWithExclusiveAccessToken:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKeyedSubscript:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "identifiersItemEntryMap");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, v10);

  return v11;
}

- (void)_dequeueCandidatesWithQuota:(int64_t)a3 withExclusiveAccessToken:(id)a4
{
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a4;
  objc_msgSend(v22, "assertHasExclusiveAccessForOwner:", self);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 >= 1)
  {
    do
    {
      if (!-[NSMutableArray count](self->_candidateItems, "count"))
        break;
      v6 = -[MPRandomDistribution nextIntWithUpperBound:](self->_randomDistribution, "nextIntWithUpperBound:", -[NSMutableArray count](self->_candidateItems, "count"));
      -[NSMutableArray objectAtIndexedSubscript:](self->_candidateItems, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObjectAtIndex:](self->_candidateItems, "removeObjectAtIndex:", v6);
      -[MPSectionedIdentifierList _sectionHeadEntryMapWithExclusiveAccessToken:](self, "_sectionHeadEntryMapWithExclusiveAccessToken:", v22);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sectionIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dataSource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v7, "isRemoved") & 1) != 0
        || (objc_opt_respondsToSelector() & 1) != 0
        && (objc_msgSend(v7, "sectionIdentifier"),
            v17 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v7, "itemIdentifier"),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            v19 = objc_msgSend(v11, "section:shouldShuffleExcludeItem:", v17, v18),
            v18,
            v17,
            (v19 & 1) != 0))
      {
        -[MPSectionedIdentifierList _sectionHeadEntryMapWithExclusiveAccessToken:](self, "_sectionHeadEntryMapWithExclusiveAccessToken:", v22);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "sectionIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifiersItemEntryMap");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "itemIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", 0, v16);

      }
      else
      {
        objc_msgSend(v21, "addObject:", v7);
        --a3;
      }

    }
    while (a3 > 0);
  }
  if (objc_msgSend(v21, "count"))
  {
    -[_MPSSILImplementation _appendShuffledItems:withExclusiveAccessToken:](self, "_appendShuffledItems:withExclusiveAccessToken:", v21, v22);
    -[MPSectionedIdentifierList delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v20, "didDequeueShuffledItemsInSSIL:", self);

  }
}

- (MPRandomDistribution)randomDistribution
{
  return self->_randomDistribution;
}

- (NSMutableArray)candidateItems
{
  return self->_candidateItems;
}

- (void)setCandidateItems:(id)a3
{
  objc_storeStrong((id *)&self->_candidateItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateItems, 0);
  objc_storeStrong((id *)&self->_randomDistribution, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
