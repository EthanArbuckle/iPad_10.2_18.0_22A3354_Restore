@implementation MPSectionedIdentifierListReverseEnumerator

void __56__MPSectionedIdentifierListReverseEnumerator_nextObject__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "nextObjectWithExclusiveAccessToken:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)nextObjectWithExclusiveAccessToken:(id)a3
{
  id v4;
  unint64_t options;
  int *v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  MPSectionedIdentifierListEntry *v17;
  NSMutableArray *contexts;
  unint64_t v19;
  char isKindOfClass;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  dispatch_semaphore_t v26;
  const __CFString *v27;
  const __CFString *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  int v32;
  int v33;
  char v34;
  unint64_t v35;
  char v36;
  MPSectionedIdentifierListEntry *v37;
  MPSectionedIdentifierListEntry *endEntry;
  MPSectionedIdentifierListEntry *v40;
  uint64_t v41;
  void *v43;
  void *v44;
  uint64_t v45;
  char v46;
  id v47;
  __CFString *v48;
  __CFString *v49;
  _QWORD v50[4];
  dispatch_semaphore_t v51;
  _QWORD v52[4];
  _QWORD v53[4];
  _QWORD v54[3];

  v54[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "assertHasExclusiveAccessForOwner:", self->_sectionedIdentifierList);
  options = self->_options;
  v6 = &OBJC_IVAR___MPModelLibraryAlbumAppDataChangeRequestOperation__request;
  v7 = &OBJC_IVAR___MPModelLibraryAlbumAppDataChangeRequestOperation__request;
  v41 = *MEMORY[0x1E0D4CE38];
  v46 = options;
  v47 = v4;
  while (1)
  {
    v8 = -[NSMutableArray count](self->_contexts, "count");
    v9 = v6[44];
    if (!v8 && !objc_msgSend(*(id *)((char *)&self->super.super.isa + v9), "count"))
    {
      v10 = 0;
      goto LABEL_57;
    }
    if (objc_msgSend(*(id *)((char *)&self->super.super.isa + v9), "count"))
    {
      objc_msgSend(*(id *)((char *)&self->super.super.isa + v9), "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)((char *)&self->super.super.isa + v9), "removeObjectAtIndex:", 0);
      if ((options & 0x20) == 0
        || (_MPSectionedIdentifierListEnumeratorShouldEmitAsDataSourceEntry(self->_sectionedIdentifierList, v10, v4) & 1) != 0)
      {
        goto LABEL_57;
      }

    }
    -[NSMutableArray lastObject](self->_contexts, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "nextObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "nextEntries");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectEnumerator");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableArray addObject:](self->_contexts, "addObject:", v15);
      objc_msgSend(*(id *)((char *)&self->super.super.isa + v7[46]), "addObject:", v13);

      goto LABEL_45;
    }
    v16 = v7[46];
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v16), "lastObject");
    v17 = (MPSectionedIdentifierListEntry *)objc_claimAutoreleasedReturnValue();
    contexts = self->_contexts;
    if (v17 == self->_endEntry)
      break;
    -[NSMutableArray removeLastObject](contexts, "removeLastObject");
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v16), "removeLastObject");
    v19 = self->_options;
    if (v17 == (MPSectionedIdentifierListEntry *)self->_startEntryProxy)
    {
      if ((v19 & 1) != 0)
        endEntry = v17;
      else
        endEntry = 0;
      v4 = v47;
      goto LABEL_54;
    }
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    -[MPSectionedIdentifierListEntry previousEntry](v17, "previousEntry");
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v48 = v21;
    if ((isKindOfClass & 1) != 0)
    {
      -[MPSectionedIdentifierListEntry sectionHeadEntry](v17, "sectionHeadEntry");
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_16:
      v23 = v22;
      -[__CFString nextEntries](v22, "nextEntries");
      v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    if (v21)
    {
      v22 = v21;
      goto LABEL_16;
    }
    -[MPSectionedIdentifierListReverseEnumerator _startEntryProxy](self, "_startEntryProxy");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSectionedIdentifierList _startEntriesWithExclusiveAccessToken:](self->_sectionedIdentifierList, "_startEntriesWithExclusiveAccessToken:", v47);
    v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = v17;
      if (-[MPSectionedIdentifierListEntry isShuffledHead](v37, "isShuffledHead"))
      {
        -[__CFString arrayByAddingObject:](v49, "arrayByAddingObject:", v37);
        v45 = objc_claimAutoreleasedReturnValue();

        v49 = (__CFString *)v45;
      }

    }
LABEL_17:
    if (objc_msgSend(*(id *)((char *)&self->super.super.isa + v16), "indexOfObjectIdenticalTo:", v23) == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(*(id *)((char *)&self->super.super.isa + v16), "addObject:", v23);
      -[__CFString objectEnumerator](v49, "objectEnumerator");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "nextObjectIdenticalTo:", v17);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v25)
      {
        v26 = dispatch_semaphore_create(0);
        v44 = (void *)MEMORY[0x1E0D4D030];
        v52[0] = CFSTR("entryToEmit");
        v52[1] = CFSTR("nextEntryToEmit");
        v53[0] = v17;
        v53[1] = v23;
        if (v49)
          v27 = v49;
        else
          v27 = CFSTR("@");
        v52[2] = CFSTR("nextEntries");
        v52[3] = CFSTR("previousEntry");
        v28 = v48;
        if (!v48)
          v28 = CFSTR("@");
        v53[2] = v27;
        v53[3] = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 4);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v54[0] = v43;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v50[0] = MEMORY[0x1E0C809B0];
        v50[1] = 3221225472;
        v50[2] = __81__MPSectionedIdentifierListReverseEnumerator_nextObjectWithExclusiveAccessToken___block_invoke;
        v50[3] = &unk_1E3163508;
        v51 = v26;
        v30 = v26;
        objc_msgSend(v44, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v41, CFSTR("Bug"), CFSTR("Invalid-SIL"), CFSTR("entryToEmit.previousEntry.nextEntries-2"), &stru_1E3163D10, v29, v50);

        dispatch_semaphore_wait(v30, 0xFFFFFFFFFFFFFFFFLL);
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPSectionedIdentifierListEnumerator.m"), 340, CFSTR("entryToEmit not found in entryToEmit.previousEntry.nextEntries"));

        v25 = 0;
      }
      -[NSMutableArray addObject:](self->_contexts, "addObject:", v24);

    }
    objc_opt_class();
    v32 = objc_opt_isKindOfClass();
    v33 = v32;
    if ((v19 & 1) == 0 && (v32 & 1) == 0)
    {
      v34 = 1;
      LOBYTE(options) = v46;
      v4 = v47;
      goto LABEL_44;
    }
    v35 = self->_options;
    v36 = -[MPSectionedIdentifierListEntry isDataSourceRemoved](v17, "isDataSourceRemoved");
    LOBYTE(options) = v46;
    if ((v36 & 1) != 0 || ((v33 ^ 1) & 1) != 0)
    {
      v4 = v47;
      if ((v35 & 2) != 0)
        goto LABEL_41;
    }
    else
    {
      v4 = v47;
      if ((v46 & 0x20) == 0)
        v36 = -[MPSectionedIdentifierListEntry isRemoved](v17, "isRemoved");
      if ((v35 & 2) != 0)
        goto LABEL_41;
    }
    if ((v36 & 1) != 0)
      goto LABEL_35;
LABEL_41:
    if ((v46 & 0x20) != 0
      && !_MPSectionedIdentifierListEnumeratorShouldEmitAsDataSourceEntry(self->_sectionedIdentifierList, v17, v4))
    {
LABEL_35:
      v34 = 1;
      goto LABEL_44;
    }
    v40 = v17;
    v34 = 0;
LABEL_44:

    v6 = &OBJC_IVAR___MPModelLibraryAlbumAppDataChangeRequestOperation__request;
    v7 = &OBJC_IVAR___MPModelLibraryAlbumAppDataChangeRequestOperation__request;
    if ((v34 & 1) == 0)
      goto LABEL_56;
LABEL_45:

  }
  -[NSMutableArray removeAllObjects](contexts, "removeAllObjects");
  objc_msgSend(*(id *)((char *)&self->super.super.isa + v9), "removeAllObjects");
  objc_msgSend(*(id *)((char *)&self->super.super.isa + v16), "removeAllObjects");
  if ((self->_options & 0x40) == 0)
  {
    v40 = 0;
    goto LABEL_55;
  }
  endEntry = self->_endEntry;
LABEL_54:
  v40 = endEntry;
LABEL_55:

LABEL_56:
  v10 = v40;
LABEL_57:

  return v10;
}

- (MPSectionedIdentifierListReverseEnumerator)initWithSectionedIdentifierList:(id)a3 options:(unint64_t)a4 startEntry:(id)a5 endEntry:(id)a6 withExclusiveAccessToken:(id)a7
{
  id v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  MPSectionedIdentifierListReverseEnumerator *v17;
  MPSectionedIdentifierListReverseEnumerator *v18;
  uint64_t v19;
  NSMutableArray *nextEmittableEnumerationResults;
  uint64_t v21;
  NSMutableArray *contexts;
  uint64_t v23;
  NSMutableArray *entriesToEmit;
  unint64_t options;
  NSMutableArray *v26;
  void *v27;
  id v28;
  NSMutableArray *v29;
  void *v30;
  void *v31;
  NSMutableArray *v32;
  void *v33;
  void *v35;
  void *v36;
  id *p_sectionedIdentifierList;
  objc_super v39;

  v13 = a3;
  v14 = (unint64_t)a5;
  v15 = (unint64_t)a6;
  v16 = a7;
  if (v14 == v15 && v14 | v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPSectionedIdentifierListEnumerator.m"), 234, CFSTR("endEntry cannot be the same as the startingEntry"));

  }
  v39.receiver = self;
  v39.super_class = (Class)MPSectionedIdentifierListReverseEnumerator;
  v17 = -[MPSectionedIdentifierListReverseEnumerator init](&v39, sel_init);
  v18 = v17;
  if (v17)
  {
    p_sectionedIdentifierList = (id *)&v17->_sectionedIdentifierList;
    objc_storeStrong((id *)&v17->_sectionedIdentifierList, a3);
    v18->_options = a4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = objc_claimAutoreleasedReturnValue();
    nextEmittableEnumerationResults = v18->_nextEmittableEnumerationResults;
    v18->_nextEmittableEnumerationResults = (NSMutableArray *)v19;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = objc_claimAutoreleasedReturnValue();
    contexts = v18->_contexts;
    v18->_contexts = (NSMutableArray *)v21;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v23 = objc_claimAutoreleasedReturnValue();
    entriesToEmit = v18->_entriesToEmit;
    v18->_entriesToEmit = (NSMutableArray *)v23;

    objc_storeStrong((id *)&v18->_endEntry, a6);
    if ((a4 & 0x10) == 0 && !v14)
      objc_msgSend(*p_sectionedIdentifierList, "_reverseEnumeratorWillStartAtEnd:withExclusiveAccessToken:", v18, v16);
    options = v18->_options;
    v26 = v18->_contexts;
    objc_msgSend(MEMORY[0x1E0C9AA60], "objectEnumerator", v13);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v26, "addObject:", v27);

    if (v14)
    {
      v28 = (id)v14;
    }
    else
    {
      objc_msgSend(*p_sectionedIdentifierList, "_endEntryWithExclusiveAccessToken:", v16);
      v28 = (id)objc_claimAutoreleasedReturnValue();
      if (!v28)
        goto LABEL_12;
    }
    -[NSMutableArray addObject:](v18->_entriesToEmit, "addObject:", v28);
LABEL_12:
    if (!v14 && (options & 1) != 0)
    {
      v29 = v18->_nextEmittableEnumerationResults;
      +[_MPSectionedIdentifierListProxyEntry endEntry](_MPSectionedIdentifierListProxyEntry, "endEntry");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v29, "addObject:", v30);

      objc_msgSend(*p_sectionedIdentifierList, "_endEntryWithExclusiveAccessToken:", v16);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v31)
      {
        v32 = v18->_nextEmittableEnumerationResults;
        +[_MPSectionedIdentifierListProxyEntry startEntry](_MPSectionedIdentifierListProxyEntry, "startEntry");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v32, "addObject:", v33);

      }
    }
    _MPSectionedIdentifierListEnumeratorAdjustForStartItemInclusionIfNeeded(v18, a4, (void *)v14, v16);

    v13 = v36;
  }

  return v18;
}

- (id)_startEntryProxy
{
  _MPSectionedIdentifierListProxyEntry *startEntryProxy;
  _MPSectionedIdentifierListProxyEntry *v4;
  _MPSectionedIdentifierListProxyEntry *v5;

  startEntryProxy = self->_startEntryProxy;
  if (!startEntryProxy)
  {
    +[_MPSectionedIdentifierListProxyEntry startEntry](_MPSectionedIdentifierListProxyEntry, "startEntry");
    v4 = (_MPSectionedIdentifierListProxyEntry *)objc_claimAutoreleasedReturnValue();
    v5 = self->_startEntryProxy;
    self->_startEntryProxy = v4;

    startEntryProxy = self->_startEntryProxy;
  }
  return startEntryProxy;
}

- (id)nextObject
{
  MPSectionedIdentifierList *sectionedIdentifierList;
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
  v9 = __Block_byref_object_copy__6014;
  v10 = __Block_byref_object_dispose__6015;
  v11 = 0;
  sectionedIdentifierList = self->_sectionedIdentifierList;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__MPSectionedIdentifierListReverseEnumerator_nextObject__block_invoke;
  v5[3] = &unk_1E315E2C8;
  v5[4] = self;
  v5[5] = &v6;
  -[MPSectionedIdentifierList performWithExclusiveAccess:](sectionedIdentifierList, "performWithExclusiveAccess:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endEntry, 0);
  objc_storeStrong((id *)&self->_nextEmittableEnumerationResults, 0);
  objc_storeStrong((id *)&self->_entriesToEmit, 0);
  objc_storeStrong((id *)&self->_contexts, 0);
  objc_storeStrong((id *)&self->_sectionedIdentifierList, 0);
  objc_storeStrong((id *)&self->_startEntryProxy, 0);
}

- (MPSectionedIdentifierList)sectionedIdentifierList
{
  return self->_sectionedIdentifierList;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (NSMutableArray)contexts
{
  return self->_contexts;
}

- (void)setContexts:(id)a3
{
  objc_storeStrong((id *)&self->_contexts, a3);
}

- (NSMutableArray)entriesToEmit
{
  return self->_entriesToEmit;
}

- (void)setEntriesToEmit:(id)a3
{
  objc_storeStrong((id *)&self->_entriesToEmit, a3);
}

- (NSMutableArray)nextEmittableEnumerationResults
{
  return self->_nextEmittableEnumerationResults;
}

- (void)setNextEmittableEnumerationResults:(id)a3
{
  objc_storeStrong((id *)&self->_nextEmittableEnumerationResults, a3);
}

- (MPSectionedIdentifierListEntry)endEntry
{
  return self->_endEntry;
}

- (void)setEndEntry:(id)a3
{
  objc_storeStrong((id *)&self->_endEntry, a3);
}

intptr_t __81__MPSectionedIdentifierListReverseEnumerator_nextObjectWithExclusiveAccessToken___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
